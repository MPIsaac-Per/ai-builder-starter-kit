import { mkdir, readFile, writeFile } from "node:fs/promises";
import path from "node:path";

async function loadTasks(dataPath) {
  let source;
  try {
    source = await readFile(dataPath, "utf8");
  } catch (error) {
    if (error.code === "ENOENT") {
      return [];
    }
    throw error;
  }

  const tasks = JSON.parse(source);
  if (!Array.isArray(tasks)) {
    throw new Error("Task data must contain a JSON array.");
  }
  return tasks;
}

async function saveTasks(dataPath, tasks) {
  await mkdir(path.dirname(dataPath), { recursive: true });
  await writeFile(dataPath, `${JSON.stringify(tasks, null, 2)}\n`, "utf8");
}

export async function listTasks(dataPath) {
  return loadTasks(dataPath);
}

export async function addTask(dataPath, title) {
  const normalizedTitle = String(title ?? "").trim();
  if (!normalizedTitle) {
    throw new Error("A task title is required.");
  }

  const tasks = await loadTasks(dataPath);
  const nextId = tasks.reduce((maximum, task) => Math.max(maximum, task.id), 0) + 1;
  const task = { id: nextId, title: normalizedTitle, done: false };
  tasks.push(task);
  await saveTasks(dataPath, tasks);
  return task;
}

export async function completeTask(dataPath, id) {
  const tasks = await loadTasks(dataPath);
  const task = tasks.find((candidate) => candidate.id === id);
  if (!task) {
    throw new Error(`Task ${id} was not found.`);
  }

  task.done = true;
  await saveTasks(dataPath, tasks);
  return task;
}

export function formatTasks(tasks) {
  if (tasks.length === 0) {
    return "No tasks.";
  }

  return tasks
    .map((task) => `[${task.done ? "x" : " "}] ${task.id} ${task.title}`)
    .join("\n");
}

function usage() {
  return "Usage: task-list [--data PATH] add TITLE | list | done ID";
}

export async function runCli(args, io = {}) {
  const out = io.out ?? console.log;
  const errorOut = io.error ?? console.error;
  const remaining = [...args];
  let dataPath = path.resolve(".ai-builder/tasks.json");

  if (remaining[0] === "--data") {
    if (!remaining[1]) {
      errorOut(usage());
      return 2;
    }
    dataPath = path.resolve(remaining[1]);
    remaining.splice(0, 2);
  }

  const command = remaining.shift();
  try {
    if (command === "add") {
      const task = await addTask(dataPath, remaining.join(" "));
      out(`Added ${task.id}: ${task.title}`);
      return 0;
    }
    if (command === "list") {
      out(formatTasks(await listTasks(dataPath)));
      return 0;
    }
    if (command === "done") {
      const id = Number.parseInt(remaining[0], 10);
      const task = await completeTask(dataPath, id);
      out(`Completed ${task.id}: ${task.title}`);
      return 0;
    }

    errorOut(usage());
    return 2;
  } catch (error) {
    errorOut(error.message);
    return 1;
  }
}
