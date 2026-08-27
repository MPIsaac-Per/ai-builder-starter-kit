# Security policy

## Reporting

Do not open a public issue containing a credential, exploitable secret, personal record, or undisclosed vulnerability. Use the repository owner's private security-reporting channel after publication.

Before publication, report a concern directly to the repository owner through an existing private channel.

## Repository boundary

- Never commit `.env` files, tokens, private keys, session material, or machine credentials.
- Use invented data in examples and tests.
- Review third-party skills and scripts before execution.
- Run `./scripts/verify.sh` before publication.
- Inspect Git history as well as the working tree when checking for removed secrets.

## Supported versions

Only the latest release on the default branch will receive security corrections after publication.
