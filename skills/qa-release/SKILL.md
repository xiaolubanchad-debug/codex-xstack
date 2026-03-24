---
name: qa-release
description: Evaluate whether a change is ready to ship. Use when Codex should verify test coverage, manual validation paths, regression risk, rollout concerns, and release readiness after implementation or review.
---

# qa-release

Check whether the change is actually ready to ship.

## Workflow

1. Identify the user-visible or system-visible behaviors that changed.
2. Map the primary happy path and the most likely failure paths.
3. Review what validation has already been run.
4. Identify missing tests, manual checks, and regression hotspots.
5. Call out rollout, migration, observability, and rollback concerns when relevant.
6. Conclude with a clear readiness judgment.

## Output

Always include:

- Scope under test
- Validation already done
- Required manual checks
- Regression hotspots
- Release concerns
- Ship recommendation

## Notes

- Treat missing validation as real risk.
- Be especially careful with auth, billing, stateful workflows, migrations, and UI flows.
- If evidence is incomplete, recommend conditional rather than unconditional ship.

## References

- Read `references/manual-qa-checklist.md` when the change is user-facing.
- Read `references/release-gates.md` when deciding whether to recommend ship.
