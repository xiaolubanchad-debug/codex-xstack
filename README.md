# xstack

xstack is a Codex-first skill stack for shipping software with structure.

It borrows the useful idea behind gstack — role-based workflows instead of one giant prompt — but is redesigned for Codex:

- fewer, sharper skills
- stable output formats
- explicit guardrails
- lightweight references instead of bloated prompts
- a focus on plan → implement → review → validate

## Core design

xstack treats Codex as a strong implementation agent that benefits from clear mode switches.

Instead of one general-purpose workflow, xstack splits software work into five roles:

1. `plan-product` — clarify goals, scope, non-goals, and acceptance criteria
2. `plan-engineering` — design implementation before editing code
3. `implement-feature` — make focused code changes with validation discipline
4. `review-change` — audit a diff for bugs, regressions, and risk
5. `qa-release` — verify readiness, test coverage, and release risk

## Principles

- Keep each skill single-purpose.
- Prefer predictable output structures.
- Stop and ask when requirements are ambiguous.
- Read local code before proposing implementation details.
- Avoid large blind edits.
- Distinguish must-fix issues from optional polish.
- Treat “code written” and “task complete” as different states.

## Suggested workflow

For feature work:

1. Run `plan-product`
2. Run `plan-engineering`
3. Run `implement-feature`
4. Run `review-change`
5. Run `qa-release`

For bug work:

1. Clarify reproduction and expected behavior
2. Run `plan-engineering` if the fix touches multiple areas or is unclear
3. Run `implement-feature`
4. Run `review-change`
5. Run `qa-release`

## Skill layout

```text
skills/
  plan-product/
  plan-engineering/
  implement-feature/
  review-change/
  qa-release/
```

Each skill contains:

- `SKILL.md` — trigger + workflow
- `references/` — checklists and output patterns loaded only when needed

## Naming

The project name is **xstack**.

Use it as the umbrella name for the full Codex workflow stack. Skill names stay descriptive and task-oriented so Codex can trigger them reliably.
