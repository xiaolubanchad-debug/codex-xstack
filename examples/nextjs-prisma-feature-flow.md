# Next.js + Prisma feature flow / Next.js + Prisma 功能开发流程

## Scenario / 场景

Add a user-facing feature to a Next.js app backed by Prisma.  
在一个使用 Prisma 作为数据层的 Next.js 应用中新增一个面向用户的功能。

Example / 示例：  
A user can create a saved project template from the dashboard, then see it immediately in their list view.  
比如：用户可以在 dashboard 中创建一个“项目模板”，然后立即在列表页看到它。

---

## Stack / 技术栈

- Next.js
- Prisma
- TypeScript

Optional but common / 常见可选搭配：

- React Server Components
- route handlers or server actions / route handlers 或 server actions
- auth and tenant scoping / 认证与租户隔离

---

## Recommended skill flow / 推荐 skill 流程

1. `plan-product`
2. `plan-engineering`
3. `implement-feature`
4. `review-frontend-flow`
5. `qa-release`
6. optional: `document-release` / 可选：`document-release`

If the feature changes API behavior, auth rules, or data shape in a meaningful way, also run:  
如果这个功能明显改变了 API 行为、权限规则或数据结构，还建议额外执行：

- `review-backend-api`
- `security-review`

---

## Key packs / 关键 packs

- `nextjs-app-pack`
- `prisma-pack`
- `frontend-state-flow-pack`
- `fullstack-contract-pack`
- optional: `component-consistency-pack` / 可选：`component-consistency-pack`
- optional: `auth-permission-pack` / 可选：`auth-permission-pack`

---

## Why this flow matters / 为什么这条流程重要

This is one of the most common real-world Node workflows:  
这是现实里最常见的一类 Node 工作流之一：

- a user-facing change  
  一个面向用户的界面改动
- data written through Prisma  
  数据通过 Prisma 写入
- UI must reconcile immediately after mutation  
  提交之后前端必须立即正确更新
- release risk exists across frontend, backend, and data layers  
  前端、后端和数据层都存在上线风险

This is exactly the kind of work where xstack should feel useful, not abstract.  
这正是 xstack 应该体现价值、而不是停留在抽象概念层面的场景。

---

## Example prompt / 示例提示词

```text
Use plan-product to turn this Next.js dashboard feature into scope and acceptance criteria.
Then use plan-engineering to inspect the repo and propose the smallest sound implementation.
After implementation, use review-frontend-flow and qa-release before calling it done.
If the mutation changes backend behavior or data shape, also run review-backend-api.
```

```text
用 plan-product 把这个 Next.js dashboard 功能整理成范围和验收标准。
然后用 plan-engineering 检查仓库，并提出最小但靠谱的实现方案。
实现完成后，用 review-frontend-flow 和 qa-release 再判断是否真的完成。
如果这个提交动作改变了后端行为或数据结构，再额外执行 review-backend-api。
```

---

## What xstack should help catch / xstack 应该帮你抓到什么

### Frontend-side risks / 前端侧风险

- missing loading, empty, or error states  
  loading、empty、error 状态缺失
- optimistic UI that does not reconcile correctly after save  
  乐观更新后页面状态没有正确回收
- stale data after mutation because refresh or revalidation was forgotten  
  提交后忘记 refresh / revalidate，导致数据陈旧
- UI patterns that feel inconsistent with adjacent pages  
  页面风格和周围界面不一致

### Backend/data risks / 后端与数据风险

- Prisma schema assumptions that do not match real data  
  Prisma schema 假设和真实数据不一致
- response shape that does not support the UI  
  返回结构无法支撑前端展示
- route handler or server action doing too much implicitly  
  route handler 或 server action 暗中承担了过多逻辑
- auth or tenant checks that are implied in UI but weak on the server  
  UI 上看起来有权限控制，但服务端实际控制较弱

### Release risks / 发版风险

- feature works locally but fails around cache, revalidation, or edge states  
  本地能跑，但在 cache、revalidation 或边界状态下出问题
- old rows or missing defaults break new feature assumptions  
  旧数据或默认值缺失导致新功能假设不成立
- mutation success path is tested but retry/failure path is not  
  只测了成功路径，没有测失败和重试路径

---

## What a good final result looks like / 理想结果长什么样

A good result is not just “the feature exists.”  
一个理想结果，不只是“功能做出来了”。

It should mean:  
它应该意味着：

- the feature is scoped clearly  
  功能范围清楚
- the implementation fits the Next.js + Prisma architecture  
  实现方式符合 Next.js + Prisma 的架构习惯
- the mutation path updates the UI coherently  
  提交流程能连贯地更新界面
- data shape and UI assumptions stay aligned  
  数据结构和前端假设保持一致
- the release is reviewed with enough evidence  
  发版前有足够证据支持判断

---

## Suggested follow-up / 后续建议

If this example is useful, the next two examples to add are:  
如果这个示例有价值，接下来最值得补的两个示例是：

1. `nextjs-trpc-prisma-fullstack-flow.md`
2. `nest-prisma-backend-flow.md`
