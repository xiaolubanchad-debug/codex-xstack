# Express + Prisma API flow / Express + Prisma API 流程

## Scenario / 场景

Build or change a lightweight Node API using Express and Prisma.  
使用 Express + Prisma 构建或修改一个轻量 Node API。

Example / 示例：  
Add an endpoint for updating a user's notification preferences, with validation, auth checks, and data updates that must remain consistent.  
比如：新增一个用于更新用户通知偏好的接口，涉及参数校验、权限检查和必须保持一致的数据更新。

---

## Stack / 技术栈

- Express
- Prisma
- TypeScript or JavaScript / TypeScript 或 JavaScript

Optional but common / 常见可选搭配：

- middleware-based auth
- shared validation helpers / 共享验证工具
- service-layer helpers / service 层辅助封装

---

## Recommended skill flow / 推荐 skill 流程

1. `plan-engineering`
2. `implement-feature`
3. `review-backend-api`
4. `security-review`
5. `qa-release`
6. optional: `document-release` / 可选：`document-release`

If the route touches existing production data or rollout order matters, also lean on:  
如果这个路由会触碰已有生产数据，或者上线顺序很关键，也建议额外依赖：

- `db-migration-pack`
- `release-risk-pack`

---

## Key packs / 关键 packs

- `express-api-pack`
- `prisma-pack`
- `auth-permission-pack`
- `backend-api-pack`
- optional: `release-risk-pack` / 可选：`release-risk-pack`
- optional: `incident-response-pack` / 可选：`incident-response-pack`

---

## Why this flow matters / 为什么这条流程重要

Express gives you flexibility, but that flexibility often hides inconsistency.  
Express 给了你很大的灵活性，但这种灵活性也很容易把不一致藏起来。

This workflow matters because Express projects often drift in these places:  
这条流程重要，是因为 Express 项目很容易在这些地方出问题：

- route handlers doing too much  
  route handler 干了太多事情
- validation scattered across middleware and handler code  
  validation 分散在 middleware 和 handler 里
- auth middleware present but ownership logic still weak  
  有 auth middleware，但 ownership 逻辑仍然薄弱
- Prisma writes looking straightforward while hiding side effects  
  Prisma 写操作看似直接，却隐藏了额外副作用

---

## Example prompt / 示例提示词

```text
Use plan-engineering to inspect this Express + Prisma API change and propose the safest implementation path.
After implementation, run review-backend-api and security-review.
Use qa-release before calling the route production-ready.
```

```text
用 plan-engineering 检查这个 Express + Prisma API 改动，并提出最安全的实现路径。
实现完成后，执行 review-backend-api 和 security-review。
最后用 qa-release 判断这个路由是否真的具备生产可用性。
```

---

## What xstack should help catch / xstack 应该帮你抓到什么

### Handler and middleware risks / Handler 与 middleware 风险

- route handler growing into controller + service + validator at once  
  一个 route handler 同时承担 controller、service 和 validator 的职责
- middleware order creating hidden behavior  
  middleware 顺序导致隐藏行为
- validation split across too many places  
  validation 被拆散在太多位置

### Contract risks / 契约风险

- inconsistent response shape across similar routes  
  相似路由之间的返回结构不一致
- status codes that do not match real failure modes  
  status code 和真实失败模式不匹配
- route behavior that callers cannot predict cleanly  
  调用方难以稳定预期路由行为

### Data and permission risks / 数据与权限风险

- Prisma queries scoped differently for read vs update  
  Prisma 查询在读取和更新路径上的 scope 不一致
- ownership checks implied by auth middleware but missing deeper in code  
  auth middleware 看起来有控制，但更深层代码里仍然缺 ownership 检查
- partial updates or side effects that should be transactional  
  某些部分更新或副作用本应有事务保护

### Release risks / 发版风险

- route works in test data but not against real production assumptions  
  路由在测试数据上正常，但在生产假设下不稳
- error handling exists but does not help support or investigation  
  错误处理虽然有，但对支持和排障帮助很小
- rollout safety depends on hidden knowledge rather than explicit checks  
  上线安全依赖隐性经验，而不是显式检查

---

## What a good final result looks like / 理想结果长什么样

A good result means more than “the route returns 200.”  
理想结果不只是“路由返回了 200”。

It should mean:  
它还应该意味着：

- the route is scoped cleanly  
  路由职责清晰
- validation and auth are easy to reason about  
  validation 和 auth 逻辑容易推理
- Prisma writes are safe enough for production  
  Prisma 写入对生产环境足够安全
- release confidence comes from review and evidence  
  发版信心来自 review 和证据，而不是直觉
