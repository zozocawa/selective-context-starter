# Operating Protocol

## Pre-Flight

Before starting work, read PROJECT_STATE.md and verify it matches the current codebase. Reconcile any discrepancies before proceeding.

## Conflict Hierarchy

When two sources disagree, this is the order of authority:
1. **Code** — What's actually in the source files. Always wins.
2. **PROJECT_STATE.md** — Reflects code. If state and code disagree, update state, not code.
3. **PROJECT_SPEC.md** — Defines what should exist. If code lacks a spec'd feature, code is incomplete. If spec describes something that doesn't match actual intent, update spec.
4. **Discovery** — If none of the above are authoritative, log it in Known Technical Debt and flag in chat.

**Rule:** When in doubt, code is truth. State and spec describe code. If they don't match, change the documents, not the code.

## Queue Discipline

- WIP limit: 1. Work on exactly one sub-task at a time.
- Pull from Ready queue in PROJECT_STATE.md when current task closes.
- Tasks with unmet dependencies sit in Blocked until resolved.

## Task Execution

1. Decompose the task into atomic sub-tasks.
2. For each sub-task:
   a. Mark "[sub-task] in progress" in PROJECT_STATE.md.
   b. Execute the edit.
   c. Verify the edit.
   d. Mark "[sub-task] done" in PROJECT_STATE.md.
   e. Update "Updated:" and "Last action:" fields.
   f. Pull the next sub-task from the Ready queue.
3. After all sub-tasks are done, update the backlog file.

## Discovery Handler

If you find a spec gap, undocumented behavior, or new tech debt:
1. Log it in PROJECT_STATE.md → Known Technical Debt.
2. Note: "Discovered during: [task name]".
3. Flag in chat for prioritization.

## Closure

1. Verify PROJECT_STATE.md matches the final state of the codebase.
2. Check root for stale tool artifacts (temp files, old config dirs from tool switches).
