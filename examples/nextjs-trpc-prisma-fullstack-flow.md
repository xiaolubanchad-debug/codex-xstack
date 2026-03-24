# Next.js + tRPC + Prisma full-stack flow / Next.js + tRPC + Prisma 全栈流程

## Scenario / 场景

Build a full-stack TypeScript feature where the UI creates or updates data through tRPC procedures backed by Prisma.  
构建一个全栈 TypeScript 功能：前端通过 tRPC procedure 创建或更新数据，后端数据层使用 Prisma。

Example / 示例：  
A user can create a workspace note from a dashboard form, and the new note appears immediately in the list view with the correct permission-scoped data.  
比如：用户可以在 dashboard 表单中创建一条 workspace note，并且新数据会立即在列表中显示，且权限范围正确。

---

## Stack / 技术栈

- Next.js
- tRPC
- Prisma
- TypeScript

Optional but common / 常见可选搭配：

- React Query or equivalent client cache layer
- auth middleware and tenant scoping / 认证 middleware 与租户隔离
- server actions coexisting with tRPC in adjacent features / 某些相邻功能中还可能同时存在 server actions

---

## Recommended skill flow / 推荐 skill 流程

1. `plan-engineering`
2. `implement-feature`
3. `review-frontend-flow`
4. `review-backend-api`
5. `qa-release`
6. optional: `security-review` / 可选：`security-review`
7. optional: `document-release` / 可选：`document-release`

If the feature changes user permissions, tenant visibility, or output shape in a meaningful way, strongly consider also running:  
如果这个功能明显改变了用户权限、租户可见性或输出结构，强烈建议额外执行：

- `security-review`

---

## Key packs / 关键 packs

- `nextjs-app-pack`
- `trpc-pack`
- `prisma-pack`
- `fullstack-contract-pack`
- optional: `auth-permission-pack` / 可选：`auth-permission-pack`
- optional: `release-risk-pack` / 可选：`release-risk-pack`

---

## Why this flow matters / 为什么这条流程重要

This is one of the clearest examples of where xstack should outperform generic coding prompts.  
这是最能体现 xstack 应该优于普通 coding prompt 的场景之一。

Why / 原因在于：

- type safety can make teams overconfident  
  类型安全很容易让团队产生“已经足够安全”的错觉
- UI, procedure contracts, and database shape are tightly coupled  
  UI、procedure 契约和数据库结构高度耦合
- mutations can succeed technically while leaving the UI stale or confusing  
  mutation 可能在技术上成功，但 UI 仍然会过时或让人困惑
- auth and tenant assumptions often drift between client, middleware, and database queries  
  权限和租户隔离假设很容易在 client、middleware 和数据库查询之间发生漂移

This is exactly the kind of stack where xstack should help teams think beyond “it compiles.”  
这正是 xstack 应该帮助团队超越“代码能编译就行”这种思维的地方。

---

## Example prompt / 示例提示词

```text
Use plan-engineering to inspect this Next.js + tRPC + Prisma flow and propose the smallest sound implementation.
After implementation, run both review-frontend-flow and review-backend-api.
Use qa-release before calling it ready.
If permissions or tenant visibility changed, also run security-review.
```

```text
用 plan-engineering 检查这个 Next.js + tRPC + Prisma 流程，并提出最小但靠谱的实现方案。
实现完成后，同时执行 review-frontend-flow 和 review-backend-api。
最后用 qa-release 判断是否真的 ready。
如果权限或租户可见性发生变化，再额外执行 security-review。
```

---

## What xstack should help catch / xstack 应该帮你抓到什么

### Frontend flow risks / 前端流程风险

- stale list state after mutation  
  mutation 后列表状态陈旧
- loading / empty / error states that were skipped because the procedure compiles  
  因为 procedure 能跑，就忽略了 loading / empty / error 状态
- invalidation or refetch behavior that is assumed but not implemented  
  假设会自动 invalidation / refetch，但实际上没实现
- UI assuming fields that the procedure does not always return  
  UI 假设 procedure 一定返回某些字段，但实际上并不稳定

### Procedure / contract risks / Procedure / 契约风险

- Zod schemas that validate syntax but not product expectations  
  Zod schema 只校验了语法，没有覆盖产品层预期
- procedure output shape that is type-safe but awkward for UI reconciliation  
  procedure 输出结构虽然类型安全，但不利于前端状态回收
- public/protected/admin procedure boundaries that are not explicit enough  
  public / protected / admin procedure 边界不够明确
- hidden middleware behavior that makes auth flow hard to reason about  
  middleware 把权限逻辑藏得太深，导致 auth flow 难以推理

### Prisma / data risks / Prisma / 数据风险

- relation or include/select shape drifting away from UI needs  
  relation 或 include/select 结构偏离前端真实需求
- tenant or ownership filters applied inconsistently  
  tenant / ownership filter 使用不一致
- partial write or multi-step mutation behavior without clear transaction thinking  
  多步骤写入没有清晰的事务思路
- schema assumptions that work in development but fail on existing production rows  
  在开发环境成立的 schema 假设，在生产旧数据上失效

### Release risks / 发版风险

- feature works in a narrow path but fails in permission edge cases  
  功能只在窄路径下能跑，在权限边界情况下失败
- types still compile after a contract change, but product behavior regresses  
  契约改动后类型仍能编译，但产品行为已经回归
- cache or client update behavior makes release confidence lower than it appears  
  cache 或客户端更新行为让发版风险比表面上更高

---

## What a good final result looks like / 理想结果长什么样

A good result is not just “the procedure works end to end.”  
理想结果不只是“procedure 从头到尾能跑通”。

It should mean:  
它还应该意味着：

- the procedure is shaped well for product use  
  procedure 的形状适合真实产品使用
- the UI updates coherently after mutation  
  mutation 后 UI 更新连贯
- type safety supports real behavior instead of hiding weak design  
  类型安全是在支撑真实行为，而不是掩盖设计薄弱点
- auth and data scoping stay aligned across layers  
  权限和数据范围在各层之间保持一致
- release readiness is judged with real evidence  
  发版准备情况是基于真实证据判断的

---

## Suggested follow-up / 后续建议

If this example is useful, the next two examples to add are:  
如果这个示例有价值，接下来最值得补的两个示例是：

1. `nest-prisma-backend-flow.md`
2. `express-prisma-api-flow.md`
