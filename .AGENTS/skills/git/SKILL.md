---
name: git
description: Commit the current repository's intended changes after reading its .AGENTS/GIT.md rules. Use when the user invokes $git, types /git as a request, or asks to make a Git commit.
---

# Git commit

1. Locate the current Git repository root. Read `<root>/.AGENTS/GIT.md` fresh on every invocation, and follow its current rules. If the file is missing, stop and tell the user.
2. Inspect `git status` and the relevant diffs. Stage only changes intended for this commit. If the scope cannot be determined from the request or current work, ask which changes to include.
3. Write a commit message that describes the staged changes and complies with the rules file. Check the staged diff before committing. Do not create an empty commit.
4. Commit, then report the commit hash, message, and any remaining uncommitted changes. Do not amend, reset, push, or alter other commits unless the user requests it.
