import assert from "node:assert/strict";
import { mkdtemp, rm, writeFile } from "node:fs/promises";
import { tmpdir } from "node:os";
import path from "node:path";
import { afterEach, test } from "node:test";
import { spawnSync } from "node:child_process";
import { fileURLToPath } from "node:url";

import {
  addTask,
  completeTask,
  formatTasks,
  listTasks,
  runCli,
} from "../examples/tiny-project/src/task-list.mjs";

const temporaryDirectories = [];
const repositoryRoot = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..");
const cliPath = path.join(repositoryRoot, "examples/tiny-project/bin/task-list.mjs");

async function temporaryDataPath() {
  const directory = await mkdtemp(path.join(tmpdir(), "ai-builder-task-list-"));
  temporaryDirectories.push(directory);
  return path.join(directory, "tasks.json");
}

afterEach(async () => {
  await Promise.all(
    temporaryDirectories.splice(0).map((directory) => rm(directory, { recursive: true, force: true })),
  );
});

test("builder can add and retrieve tasks through the public task-list API", async () => {
  const dataPath = await temporaryDataPath();

  assert.deepEqual(await addTask(dataPath, "Read the feature spec"), {
    id: 1,
    title: "Read the feature spec",
    done: false,
  });
  assert.deepEqual(await addTask(dataPath, "Run the behavior tests"), {
    id: 2,
    title: "Run the behavior tests",
    done: false,
  });
  assert.equal((await listTasks(dataPath)).length, 2);
});

test("builder can complete a task and see its status", async () => {
  const dataPath = await temporaryDataPath();
  await addTask(dataPath, "Review the diff");

  assert.equal((await completeTask(dataPath, 1)).done, true);
  assert.equal(formatTasks(await listTasks(dataPath)), "[x] 1 Review the diff");
});

test("task-list rejects missing titles, unknown tasks, and malformed data", async () => {
  const dataPath = await temporaryDataPath();

  await assert.rejects(() => addTask(dataPath, "   "), /title is required/i);
  await assert.rejects(() => completeTask(dataPath, 9), /task 9 was not found/i);
  await writeFile(dataPath, "{}\n", "utf8");
  await assert.rejects(() => listTasks(dataPath), /must contain a JSON array/i);
});

test("empty task lists have a useful display", () => {
  assert.equal(formatTasks([]), "No tasks.");
});

test("CLI supports add, list, done, and usage errors", async () => {
  const dataPath = await temporaryDataPath();
  const stdout = [];
  const stderr = [];
  const io = {
    out: (value) => stdout.push(value),
    error: (value) => stderr.push(value),
  };

  assert.equal(await runCli(["--data", dataPath, "add", "Ship", "one", "slice"], io), 0);
  assert.equal(stdout.pop(), "Added 1: Ship one slice");
  assert.equal(await runCli(["--data", dataPath, "list"], io), 0);
  assert.equal(stdout.pop(), "[ ] 1 Ship one slice");
  assert.equal(await runCli(["--data", dataPath, "done", "1"], io), 0);
  assert.equal(stdout.pop(), "Completed 1: Ship one slice");
  assert.equal(await runCli(["--data", dataPath, "unknown"], io), 2);
  assert.match(stderr.pop(), /usage:/i);
  assert.equal(await runCli(["--data"], io), 2);
  assert.match(stderr.pop(), /usage:/i);
});

test("builder can run the task-list command-line entrypoint", async () => {
  const dataPath = await temporaryDataPath();
  const addResult = spawnSync(process.execPath, [cliPath, "--data", dataPath, "add", "Use", "one", "workflow"], {
    encoding: "utf8",
  });

  assert.equal(addResult.status, 0, addResult.stderr);
  assert.equal(addResult.stdout.trim(), "Added 1: Use one workflow");

  const listResult = spawnSync(process.execPath, [cliPath, "--data", dataPath, "list"], { encoding: "utf8" });
  assert.equal(listResult.status, 0, listResult.stderr);
  assert.equal(listResult.stdout.trim(), "[ ] 1 Use one workflow");
});
