# Skills index / Skills 索引

This file is generated from `skills/*/skill.json` by `scripts/build-index.sh`.  
此文件由 `scripts/build-index.sh` 根据 `skills/*/skill.json` 自动生成。

Use this index when you want a fast overview of what each skill is for, how it is categorized, and which other modes it commonly pairs with.  
当你想快速了解每个 skill 的用途、分类，以及它通常与哪些模式搭配时，可以看这个索引。

---

## Core delivery flow / core 分类

### `implement-feature`
- Summary: Make tightly scoped changes, follow local patterns, and validate the result.
- Triggers: `feature implementation`, `scoped changes`, `repository-aligned coding`
- Recommended with: `review-change`, `qa-release`
- Related packs: `frontend-state-flow-pack`, `form-flow-pack`, `component-consistency-pack`, `nextjs-app-pack`, `prisma-pack`, `nestjs-backend-pack`, `trpc-pack`, `express-api-pack`, `db-migration-pack`
- Entry: [`skills/implement-feature/SKILL.md`](./skills/implement-feature/SKILL.md)

### `plan-engineering`
- Summary: Inspect the codebase and produce an implementation plan before editing files.
- Triggers: `implementation planning`, `repo inspection`, `pre-coding analysis`
- Recommended with: `implement-feature`, `review-change`, `qa-release`
- Related packs: `backend-api-pack`, `db-migration-pack`, `fullstack-contract-pack`, `frontend-state-flow-pack`, `auth-permission-pack`, `nextjs-app-pack`, `prisma-pack`, `nestjs-backend-pack`, `trpc-pack`, `express-api-pack`
- Entry: [`skills/plan-engineering/SKILL.md`](./skills/plan-engineering/SKILL.md)

### `plan-product`
- Summary: Turn a vague request into goals, scope, non-goals, assumptions, and acceptance criteria.
- Triggers: `feature scoping`, `acceptance criteria`, `requirements clarification`
- Recommended with: `plan-engineering`, `implement-feature`
- Entry: [`skills/plan-product/SKILL.md`](./skills/plan-product/SKILL.md)

### `qa-release`
- Summary: Decide whether a change is actually ready to ship.
- Triggers: `release readiness`, `QA pass`, `ship decision`
- Recommended with: `document-release`
- Related packs: `frontend-state-flow-pack`, `form-flow-pack`, `component-consistency-pack`, `backend-api-pack`, `db-migration-pack`, `fullstack-contract-pack`, `auth-permission-pack`, `release-risk-pack`, `incident-response-pack`, `nextjs-app-pack`, `prisma-pack`, `nestjs-backend-pack`, `trpc-pack`, `express-api-pack`
- Entry: [`skills/qa-release/SKILL.md`](./skills/qa-release/SKILL.md)

---

## Review and quality modes / review 分类

### `benchmark-change`
- Summary: Assess whether performance claims are backed by credible measurement.
- Triggers: `performance review`, `benchmark review`, `measurement validation`
- Recommended with: `qa-release`
- Entry: [`skills/benchmark-change/SKILL.md`](./skills/benchmark-change/SKILL.md)

### `design-review`
- Summary: Evaluate UX quality, interaction clarity, and AI-slop signals in user-facing work.
- Triggers: `UX review`, `interaction review`, `design quality review`
- Recommended with: `review-frontend-flow`, `qa-release`
- Related packs: `frontend-state-flow-pack`, `form-flow-pack`, `component-consistency-pack`
- Entry: [`skills/design-review/SKILL.md`](./skills/design-review/SKILL.md)

### `review-backend-api`
- Summary: Review an API or backend change for contract quality, compatibility, authorization, data safety, and release risk.
- Triggers: `API review`, `backend contract review`, `authorization review`
- Recommended with: `security-review`, `qa-release`
- Related packs: `backend-api-pack`, `auth-permission-pack`, `db-migration-pack`, `release-risk-pack`, `fullstack-contract-pack`, `nextjs-app-pack`, `prisma-pack`, `nestjs-backend-pack`, `trpc-pack`, `express-api-pack`
- Entry: [`skills/review-backend-api/SKILL.md`](./skills/review-backend-api/SKILL.md)

### `review-change`
- Summary: Review a code change for correctness, regressions, maintainability, and release risk.
- Triggers: `diff review`, `code review`, `change assessment`
- Recommended with: `qa-release`
- Related packs: `backend-api-pack`, `db-migration-pack`, `fullstack-contract-pack`, `frontend-state-flow-pack`, `form-flow-pack`, `auth-permission-pack`, `release-risk-pack`
- Entry: [`skills/review-change/SKILL.md`](./skills/review-change/SKILL.md)

### `review-frontend-flow`
- Summary: Review a user-facing flow for state completeness, form behavior, UX quality, and frontend/backend alignment.
- Triggers: `frontend flow review`, `state review`, `form behavior review`
- Recommended with: `qa-release`
- Related packs: `frontend-state-flow-pack`, `form-flow-pack`, `fullstack-contract-pack`, `release-risk-pack`, `component-consistency-pack`, `nextjs-app-pack`, `trpc-pack`
- Entry: [`skills/review-frontend-flow/SKILL.md`](./skills/review-frontend-flow/SKILL.md)

### `security-review`
- Summary: Review auth, trust boundaries, data exposure, and realistic abuse paths.
- Triggers: `auth review`, `permission review`, `trust boundary review`
- Recommended with: `qa-release`
- Related packs: `backend-api-pack`, `fullstack-contract-pack`, `auth-permission-pack`, `prisma-pack`, `nestjs-backend-pack`, `express-api-pack`
- Entry: [`skills/security-review/SKILL.md`](./skills/security-review/SKILL.md)

---

## Extended delivery modes / extended 分类

### `document-release`
- Summary: Turn technical changes into clear release notes, operator updates, and stakeholder summaries.
- Triggers: `release notes`, `operator updates`, `stakeholder summary`
- Related packs: `fullstack-contract-pack`, `release-risk-pack`, `incident-response-pack`
- Entry: [`skills/document-release/SKILL.md`](./skills/document-release/SKILL.md)

### `investigate-bug`
- Summary: Diagnose incidents, regressions, and weird behavior before proposing a fix.
- Triggers: `bug investigation`, `incident diagnosis`, `root cause analysis`
- Recommended with: `plan-engineering`, `implement-feature`
- Related packs: `incident-response-pack`
- Entry: [`skills/investigate-bug/SKILL.md`](./skills/investigate-bug/SKILL.md)

---

## Control modes / control 分类

### `careful-mode`
- Summary: Tighten discipline for ambiguous, risky, or high-impact work.
- Triggers: `risky change`, `ambiguous work`, `high-impact task`
- Recommended with: `plan-engineering`, `security-review`, `qa-release`
- Related packs: `release-risk-pack`, `incident-response-pack`
- Entry: [`skills/careful-mode/SKILL.md`](./skills/careful-mode/SKILL.md)

### `freeze-mode`
- Summary: Pause broad edits and focus on stabilization, containment, or diagnosis.
- Triggers: `freeze changes`, `incident stabilization`, `containment`
- Recommended with: `investigate-bug`
- Entry: [`skills/freeze-mode/SKILL.md`](./skills/freeze-mode/SKILL.md)

### `unfreeze-mode`
- Summary: Return to normal execution after a freeze-style task.
- Triggers: `resume work`, `post-freeze recovery`, `return to execution`
- Recommended with: `plan-engineering`
- Entry: [`skills/unfreeze-mode/SKILL.md`](./skills/unfreeze-mode/SKILL.md)

---

## Selection hints / 选择提示

- Want the smallest useful path? Start with `plan-engineering` → `review-change` → `qa-release`.
- Building a new feature? Start with `plan-product` or `plan-engineering`, then move into implementation and review.
- Reviewing user-facing work? Add `review-frontend-flow`.
- Reviewing API, auth, or permission-sensitive work? Add `review-backend-api` and `security-review` when needed.
- Working on risky or ambiguous tasks? Start with `careful-mode`.
