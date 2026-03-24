---
name: implement-feature
description: Implement a planned feature, bugfix, or refactor with disciplined code changes. Use when Codex should make focused edits, preserve intent, avoid unnecessary scope creep, and validate the result before handing off.
---

# implement-feature

Make the change carefully and prove it works.

## Workflow

1. Confirm the goal and plan before editing.
2. Inspect nearby code and existing patterns.
3. Make the smallest coherent change set that solves the task.
4. Avoid unrelated refactors unless required for correctness.
5. Keep naming, structure, and style consistent with the repository.
6. Run the most relevant validation available.
7. Summarize what changed, why, and how it was verified.

## Guardrails

- Stop and ask if requirements are still ambiguous.
- Stop and ask before destructive changes, broad rewrites, or irreversible data operations.
- Do not overwrite unrelated user changes.
- If validation cannot be run, say exactly what remains unverified.

## Output

Always include:

- What changed
- Files or areas touched
- Validation run
- Remaining risks or follow-ups

## References

- Read `references/change-discipline.md` when a task risks scope creep.
- Read `references/handoff-template.md` when preparing a final implementation summary.
