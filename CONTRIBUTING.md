# Contributing to xstack

Thanks for wanting to improve xstack.

xstack is intentionally small, opinionated, and workflow-focused. Contributions are welcome, but the goal is not to turn it into a giant pile of prompts. Favor sharper skills, clearer outputs, and stronger judgment.

## What good contributions look like

Good contributions usually do one of the following:

- improve an existing skill's trigger or workflow
- tighten guardrails around risky work
- improve output structure or review quality
- add genuinely reusable references
- add a new skill only when it has a clear, distinct job
- improve README clarity, examples, or positioning

## What to avoid

Please avoid contributions that:

- duplicate another skill with a slightly different name
- add roleplay without improving execution quality
- bloat `SKILL.md` with general advice Codex already knows
- add large numbers of niche skills without real usage evidence
- turn references into verbose documentation dumps

## Skill design guidelines

When editing or adding a skill, prefer these rules:

1. Keep the skill single-purpose.
2. Write trigger descriptions that are specific and practical.
3. Prefer structured outputs over freeform essays.
4. Put detailed checklists in `references/`, not in `SKILL.md`.
5. Add guardrails when a task is easy to do recklessly.
6. Make the skill useful in real repositories, not just toy examples.

## Suggested contribution process

1. Open an issue or describe the problem clearly.
2. Explain the real workflow gap you are trying to fix.
3. Propose the smallest change that improves the stack.
4. Keep naming consistent with the existing skill set.
5. Update the README if the public surface changes.

## Naming conventions

- Use lowercase, hyphenated names for skills.
- Prefer names that describe the job directly.
- Avoid cute names when a plain one is clearer.

## Philosophy

xstack should help Codex:

- plan before changing
- change with discipline
- review with evidence
- validate before shipping
- communicate clearly after shipping

If a contribution strengthens that loop, it is probably a good fit.
