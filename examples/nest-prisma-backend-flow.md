# NestJS + Prisma backend flow / NestJS + Prisma 后端流程

## Scenario / 场景

Build or change a structured Node backend feature using NestJS and Prisma.  
使用 NestJS + Prisma 构建或修改一个结构化的 Node 后端功能。

Example / 示例：  
Add an admin-only endpoint for creating a team invitation, with role checks, tenant scoping, and database writes that must remain consistent.  
比如：新增一个只有管理员可用的团队邀请接口，涉及角色校验、租户范围限制和必须保持一致的数据库写入。

---

## Stack / 技术栈

- NestJS
- Prisma
- TypeScript

Optional but common / 常见可选搭配：

- Guards
- DTOs + validation pipes
- Interceptors or exception filters / interceptor 或 exception filter
- background jobs or events / 后台任务或事件

---

## Recommended skill flow / 推荐 skill 流程

1. `plan-engineering`
2. `implement-feature`
3. `review-backend-api`
4. `security-review`
5. `qa-release`
6. optional: `document-release` / 可选：`document-release`

If the work involves a meaningful schema change, also lean on:  
如果这项改动明显涉及 schema 变更，还应额外依赖：

- `db-migration-pack`
- `release-risk-pack`

---

## Key packs / 关键 packs

- `nestjs-backend-pack`
- `prisma-pack`
- `auth-permission-pack`
- `backend-api-pack`
- optional: `db-migration-pack` / 可选：`db-migration-pack`
- optional: `release-risk-pack` / 可选：`release-risk-pack`

---

## Why this flow matters / 为什么这条流程重要

NestJS encourages structure, but structure alone does not guarantee a good backend design.  
NestJS 鼓励结构化，但“有结构”并不等于“设计合理”。

This workflow matters because it forces review at the places where NestJS projects often drift:  
这条流程重要，是因为它会强迫你审查 NestJS 项目最容易漂移的地方：

- controllers getting fat  
  controller 变胖
- DTOs validating syntax but not product meaning  
  DTO 只校验语法，不覆盖产品语义
- guards protecting entry points but missing deeper ownership checks  
  guard 保护了入口，却漏掉更深层的 ownership 检查
- Prisma writes looking simple while hiding transaction complexity  
  Prisma 写操作看起来简单，但实际上隐藏了事务复杂度

---

## Example prompt / 示例提示词

```text
Use plan-engineering to inspect this NestJS + Prisma backend change and propose the safest implementation.
After implementation, run review-backend-api and security-review.
Use qa-release before calling the change production-ready.
```

```text
用 plan-engineering 检查这个 NestJS + Prisma 后端改动，并提出最安全的实现方案。
实现完成后，执行 review-backend-api 和 security-review。
最后用 qa-release 判断这次改动是否真的具备生产可用性。
```

---

## What xstack should help catch / xstack 应该帮你抓到什么

### Architecture risks / 架构风险

- controller/service/module boundary drift  
  controller / service / module 边界漂移
- provider injection that works but becomes hard to reason about  
  provider 注入虽然能跑，但逐渐难以理解
- route behavior hidden in decorators, guards, and interceptors  
  路由行为被 decorator、guard、interceptor 隐藏得太深

### Contract and validation risks / 契约与验证风险

- DTO shape that compiles but mismatches actual caller expectations  
  DTO 结构能编译，但和真实调用方预期不匹配
- validation pipe behavior that is technically correct but product-weak  
  validation pipe 技术上成立，但从产品角度不够稳
- success/error response inconsistency across adjacent endpoints  
  相邻接口的成功/错误返回不一致

### Data and permission risks / 数据与权限风险

- Prisma queries scoped differently across list, detail, and mutation paths  
  Prisma 查询在列表、详情和 mutation 路径上的 scope 不一致
- tenant or ownership logic checked at entry but not at write time  
  tenant / ownership 只在入口检查，写入时没有真正约束
- transaction boundaries assumed rather than designed  
  事务边界是“默认假设”，而不是明确设计出来的

### Release risks / 发版风险

- schema change or write path seems safe locally but risks production data  
  schema 变更或写路径在本地没问题，但对生产数据有风险
- error mapping is framework-valid but operationally unclear  
  错误映射在框架层有效，但对运维和排查不够清晰
- background side effects are added without enough runtime visibility  
  加了后台副作用，但缺少运行时可观测性

---

## What a good final result looks like / 理想结果长什么样

A good result means more than “the endpoint works.”  
理想结果不只是“接口能跑”。

It should mean:  
它还应该意味着：

- the NestJS structure still makes sense  
  NestJS 的结构仍然合理
- validation and auth behavior are clear  
  验证和权限行为清晰
- Prisma reads and writes are scoped safely  
  Prisma 读写范围安全
- release readiness is judged with evidence, not optimism  
  发版判断基于证据，而不是乐观假设

---

## Suggested follow-up / 后续建议

If this example is useful, the next backend example to pair with it is:  
如果这个示例有价值，下一个最适合和它配套的后端示例是：

- `express-prisma-api-flow.md`
