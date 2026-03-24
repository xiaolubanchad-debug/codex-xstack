---
name: plan-engineering
description: Turn an approved request into a concrete engineering plan before coding. Use when Codex should inspect the codebase, identify affected areas, choose an approach, sequence the work, and define validation before implementation.
---

# plan-engineering

Design the implementation before editing files.

## Workflow

1. Read the request and the current product/bug context.
2. Inspect the relevant code paths before proposing changes.
3. Identify affected modules, data flow, interfaces, state, and external dependencies.
4. Propose the smallest sound approach that satisfies the request.
5. Call out alternatives only when there is a meaningful tradeoff.
6. Break the implementation into ordered steps.
7. Define how success will be validated.
8. Pause for clarification when a critical unknown would likely cause rework.

## Output

Always include:

- Problem summary
- Relevant code areas
- Proposed approach
- Ordered implementation steps
- Risks
- Validation plan
- Open questions

## Notes

- Prefer plans grounded in actual repository structure.
- Avoid hand-wavy architecture language.
- Do not start coding unless the user explicitly asks to proceed.

## References

- Read `references/risk-checklist.md` when the task affects data models, auth, APIs, or cross-cutting behavior.
- Read `references/validation-patterns.md` when the validation strategy is not obvious.
