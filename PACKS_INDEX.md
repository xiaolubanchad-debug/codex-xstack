# Packs index / Packs 索引

This file is generated from `packs/*.json` by `scripts/build-index.sh`.  
此文件由 `scripts/build-index.sh` 根据 `packs/*.json` 自动生成。

Use this index when you want to find the right stack-specific or domain-specific review lens to combine with a skill.  
当你想找到适合与某个 skill 搭配使用的技术栈或领域专项视角时，可以看这个索引。

---

## Frontend packs / frontend 分类

### `form-flow-pack`
- Summary: Improve submit-heavy user flows by checking validation, submit states, retries, and error handling.
- Best fit skills: `implement-feature`, `design-review`, `review-change`, `review-frontend-flow`, `qa-release`
- Entry: [`packs/form-flow-pack.md`](./packs/form-flow-pack.md)

### `frontend-state-flow-pack`
- Summary: Strengthen frontend state completeness across loading, empty, error, success, retry, and refresh behavior.
- Best fit skills: `plan-engineering`, `implement-feature`, `design-review`, `review-change`, `review-frontend-flow`, `qa-release`
- Entry: [`packs/frontend-state-flow-pack.md`](./packs/frontend-state-flow-pack.md)

---

## Backend packs / backend 分类

### `backend-api-pack`
- Summary: Strengthen backend API work by checking contracts, compatibility, errors, and authorization.
- Best fit skills: `plan-engineering`, `review-change`, `review-backend-api`, `security-review`, `qa-release`
- Entry: [`packs/backend-api-pack.md`](./packs/backend-api-pack.md)

---

## Full-stack packs / fullstack 分类

### `fullstack-contract-pack`
- Summary: Improve frontend/backend alignment for fields, enums, errors, permissions, and state shape.
- Best fit skills: `plan-engineering`, `review-change`, `review-backend-api`, `review-frontend-flow`, `security-review`, `qa-release`, `document-release`
- Entry: [`packs/fullstack-contract-pack.md`](./packs/fullstack-contract-pack.md)

---

## Data packs / data 分类

### `db-migration-pack`
- Summary: Reduce migration and schema risk around rollout order, old data assumptions, and rollback paths.
- Best fit skills: `plan-engineering`, `review-change`, `review-backend-api`, `qa-release`
- Entry: [`packs/db-migration-pack.md`](./packs/db-migration-pack.md)

### `prisma-pack`
- Summary: Improve Prisma review around schema shape, relations, transactions, queries, and release readiness.
- Best fit skills: `plan-engineering`, `implement-feature`, `review-backend-api`, `security-review`, `qa-release`
- Entry: [`packs/prisma-pack.md`](./packs/prisma-pack.md)

---

## Security packs / security 分类

### `auth-permission-pack`
- Summary: Strengthen auth, permission, and ownership review across user, role, and tenant boundaries.
- Best fit skills: `plan-engineering`, `review-change`, `review-backend-api`, `security-review`, `qa-release`
- Entry: [`packs/auth-permission-pack.md`](./packs/auth-permission-pack.md)

---

## Quality packs / quality 分类

### `component-consistency-pack`
- Summary: Improve repeated UI pattern quality and product-level frontend consistency.
- Best fit skills: `implement-feature`, `design-review`, `review-frontend-flow`, `qa-release`
- Entry: [`packs/component-consistency-pack.md`](./packs/component-consistency-pack.md)

---

## Operations packs / operations 分类

### `incident-response-pack`
- Summary: Support production incident triage, containment, and release-risk reasoning.
- Best fit skills: `investigate-bug`, `careful-mode`, `qa-release`, `document-release`
- Entry: [`packs/incident-response-pack.md`](./packs/incident-response-pack.md)

### `release-risk-pack`
- Summary: Sharpen release readiness by checking rollout risk, hidden dependencies, validation depth, and operational uncertainty.
- Best fit skills: `careful-mode`, `review-change`, `review-backend-api`, `review-frontend-flow`, `qa-release`, `document-release`
- Entry: [`packs/release-risk-pack.md`](./packs/release-risk-pack.md)

---

## Platform packs / platform 分类

### `express-api-pack`
- Summary: Strengthen lightweight Node API review around routes, middleware, validation placement, and response consistency.
- Best fit skills: `plan-engineering`, `implement-feature`, `review-backend-api`, `security-review`, `qa-release`
- Entry: [`packs/express-api-pack.md`](./packs/express-api-pack.md)

### `nestjs-backend-pack`
- Summary: Strengthen NestJS backend review around modules, controllers, services, DTOs, guards, and provider boundaries.
- Best fit skills: `plan-engineering`, `implement-feature`, `review-backend-api`, `security-review`, `qa-release`
- Entry: [`packs/nestjs-backend-pack.md`](./packs/nestjs-backend-pack.md)

### `nextjs-app-pack`
- Summary: Strengthen Next.js app review around client/server boundaries, data flow, caching, routing, and permissions.
- Best fit skills: `plan-engineering`, `implement-feature`, `review-frontend-flow`, `review-backend-api`, `qa-release`
- Entry: [`packs/nextjs-app-pack.md`](./packs/nextjs-app-pack.md)

### `trpc-pack`
- Summary: Strengthen tRPC review around routers, procedures, Zod schemas, middleware, and full-stack type contracts.
- Best fit skills: `plan-engineering`, `implement-feature`, `review-backend-api`, `review-frontend-flow`, `qa-release`
- Entry: [`packs/trpc-pack.md`](./packs/trpc-pack.md)

---

## Selection hints / 选择提示

- Use packs to sharpen review or planning, not to replace skills.
- Reach for frontend packs when the main risk is user state, forms, or interaction quality.
- Reach for backend, data, and security packs when the main risk is contracts, migrations, permissions, or rollout safety.
- Reach for platform packs when the task is shaped by a specific Node framework or stack.
