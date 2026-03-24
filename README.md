# xstack

**xstack** is a Codex-first software delivery stack.

It is inspired by the useful part of gstack — role-based workflows instead of one giant prompt — but rebuilt for Codex with a simpler shape, stronger guardrails, and more predictable outputs.

xstack is for people who want Codex to behave less like an autocomplete engine and more like a disciplined software teammate.

## What xstack is

xstack is a collection of focused skills for common software-delivery modes:

- clarify the request
- design the implementation
- make the change
- review the change
- validate release readiness
- investigate failures
- assess security risk
- document what shipped
- evaluate UX quality
- benchmark performance-sensitive work
- switch into higher-caution modes when needed

## Design goals

xstack is opinionated in a few specific ways:

- **Codex-first**: written for Codex-style execution, not transplanted from Claude Code
- **Role switching, not roleplay**: each skill changes the mode of work, not the personality for its own sake
- **Stable outputs**: useful sections and checklists instead of vague essays
- **Progressive disclosure**: `SKILL.md` stays lean; detailed checklists live in `references/`
- **Guardrails over hype**: stop when requirements are unclear or risk expands beyond the original ask
- **Plan → implement → review → validate**: xstack treats this as the default delivery loop

## Version

Current milestone: **v0.1**

v0.1 focuses on a practical baseline that one person or a small team can use immediately.

## Skill catalog

### Core flow

1. `plan-product` — turn a vague request into scope, value, non-goals, and acceptance criteria
2. `plan-engineering` — inspect the codebase and design the implementation before coding
3. `implement-feature` — make disciplined changes and validate them
4. `review-change` — review a diff for correctness, regressions, and risk
5. `qa-release` — decide whether a change is ready to ship

### Extended flow

6. `investigate-bug` — diagnose failures, narrow root causes, and define next checks
7. `security-review` — assess auth, trust boundaries, data exposure, and abuse risk
8. `design-review` — evaluate UX quality, interaction coherence, and “AI slop” risk
9. `benchmark-change` — assess performance-sensitive changes and measurement gaps
10. `document-release` — convert changes into release notes and operator-facing summaries

### Control modes

11. `careful-mode` — tighten change discipline for risky or unclear work
12. `freeze-mode` — block broad edits and hold the line on scope while diagnosing or stabilizing
13. `unfreeze-mode` — explicitly return to normal operating mode after a freeze-style task

## Recommended workflows

### Feature workflow

1. `plan-product`
2. `plan-engineering`
3. `implement-feature`
4. `review-change`
5. `qa-release`
6. `document-release` if the change will be shipped or announced

### Bug workflow

1. `investigate-bug`
2. `plan-engineering` if the fix is non-trivial
3. `implement-feature`
4. `review-change`
5. `qa-release`

### Sensitive change workflow

1. `careful-mode`
2. `plan-engineering`
3. `security-review` if auth, data, billing, or trust boundaries are involved
4. `implement-feature`
5. `review-change`
6. `qa-release`

## How to use xstack

Use xstack skills as mode switches.

Examples:

- “Use `plan-product` to turn this idea into acceptance criteria.”
- “Use `plan-engineering` and inspect the relevant code before proposing changes.”
- “Use `implement-feature` and keep the change tightly scoped.”
- “Use `review-change` on the current diff.”
- “Use `qa-release` and tell me if this is safe to ship.”
- “Use `investigate-bug` and narrow likely causes before proposing a fix.”

## Repository layout

```text
skills/
  plan-product/
  plan-engineering/
  implement-feature/
  review-change/
  qa-release/
  investigate-bug/
  security-review/
  design-review/
  benchmark-change/
  document-release/
  careful-mode/
  freeze-mode/
  unfreeze-mode/
```

Each skill contains:

- `SKILL.md` — triggering description and workflow
- `references/` — checklists, templates, and patterns loaded only when needed

## Product positioning

xstack is not trying to be a complete company simulation.

It is a compact operating layer for real software work with Codex:

- small enough to understand
- strict enough to improve quality
- modular enough to extend
- practical enough to use daily

## Near-term roadmap

After v0.1, likely next additions are:

- stronger repository-specific conventions
- deployment-aware release gates
- stack-specific reference packs (Next.js, FastAPI, Rails, etc.)
- richer investigation and observability helpers

## Name

The product name is **xstack**.

Use that name for the umbrella system, repository branding, and future packaged releases.
