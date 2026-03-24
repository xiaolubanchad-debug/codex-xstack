# xstack roadmap / xstack 路线图

## v0.2 goal / v0.2 目标

Turn xstack from a strong general delivery stack into a sharper **full-stack web delivery stack**.  
把 xstack 从一个强力的通用交付栈，推进成一个更锋利的 **全栈 Web 交付栈**。

v0.2 focuses on practical efficiency gains for website frontends and backends by adding reusable packs that strengthen the weakest points in AI-assisted web development:  
v0.2 的重点，是通过增加可复用的 packs，补强 AI 辅助网站开发中最薄弱的环节，从而在网站前端和后端开发中带来真实效率提升：

- frontend state handling / 前端状态处理
- backend API design discipline / 后端 API 设计纪律
- database migration safety / 数据库迁移安全性
- frontend/backend contract alignment / 前后端契约对齐

## Why v0.2 exists / 为什么要做 v0.2

xstack v0.1 already improves planning, implementation discipline, review quality, QA, investigation, security review, and release communication.  
xstack v0.1 已经在规划、实现纪律、review 质量、QA、排障、安全审查和发布说明方面带来了改进。

The next step is not adding more generic roles. The next step is making xstack much better at real web-app work.  
下一步不应该只是增加更多泛化角色，而应该让 xstack 在真实 Web 应用开发中明显更能打。

## v0.2 priorities / v0.2 优先级

### P0 — ship first / P0 —— 优先落地

#### 1. frontend-state-flow-pack

Strengthen user-facing work by checking:  
通过检查以下内容，提升面向用户界面的开发质量：

- initial state / 初始状态
- loading state / loading 状态
- empty state / empty 状态
- success state / success 状态
- error state / error 状态
- retry flow / 重试流程
- refresh behavior / 刷新后的行为
- permission-denied behavior when relevant / 与权限相关时的拒绝访问状态

**Primary impact:** frontend reliability and QA quality.  
**主要影响：** 提升前端可靠性和 QA 质量。

#### 2. backend-api-pack

Strengthen backend and service-facing work by checking:  
通过检查以下内容，提升后端和服务端接口相关工作的质量：

- request and response contracts / 请求与响应契约
- field semantics / 字段语义
- compatibility impact / 兼容性影响
- error handling / 错误处理
- pagination, filtering, sorting / 分页、筛选、排序
- object-level access and permissions / 对象级访问和权限

**Primary impact:** API stability, lower rework, stronger reviews.  
**主要影响：** 提升 API 稳定性、减少返工、增强 review 质量。

#### 3. db-migration-pack

Reduce migration and schema risk by checking:  
通过检查以下内容，降低迁移和 schema 变更风险：

- backward compatibility / 向后兼容
- rollout order / 发布顺序
- rollback path / 回滚路径
- old-data assumptions / 对旧数据的假设
- null/default/index risks / 空值、默认值、索引风险
- large-table and lock-risk concerns / 大表与锁风险问题

**Primary impact:** safer releases and less backend uncertainty.  
**主要影响：** 发版更安全，后端不确定性更少。

#### 4. fullstack-contract-pack

Improve frontend/backend collaboration by checking:  
通过检查以下内容，提升前后端协作质量：

- data fields expected by the UI vs delivered by the backend / 前端期望字段与后端实际返回字段是否一致
- enum and state-shape consistency / 枚举值与状态结构是否一致
- error-flow alignment / 错误流程是否对齐
- pagination/filter/sort agreement / 分页/筛选/排序协议是否一致
- permission and visibility agreement / 权限与可见性规则是否一致

**Primary impact:** fewer integration mismatches and better full-stack delivery.  
**主要影响：** 减少集成不一致问题，提升全栈交付质量。

### P1 — next wave / P1 —— 第二波

- form-flow-pack
- auth-permission-pack
- release-risk-pack

### P2 — later / P2 —— 后续

_No open P2 items currently listed._  
_当前没有明确列出的 P2 待办项。_

### In progress / landed after initial v0.2 planning / 初始 v0.2 规划后已落地或推进中的内容

- `review-frontend-flow` has been added as the first dedicated web-focused review skill.  
  `review-frontend-flow` 已作为第一个 Web 专项审查 skill 加入。
- `review-backend-api` has been added as the backend counterpart for contract, auth, data, and release-readiness review.  
  `review-backend-api` 已作为后端对应的审查 skill 加入，重点覆盖契约、权限、数据和发版准备情况。
- `incident-response-pack` has been added to strengthen production incident triage and mitigation reasoning.  
  `incident-response-pack` 已加入，用于增强生产事故分诊和缓解判断能力。
- `component-consistency-pack` has been added to improve repeated UI pattern quality and product-level frontend coherence.  
  `component-consistency-pack` 已加入，用于增强重复 UI 模式质量和产品级前端一致性。
- `nextjs-app-pack` is the first stack-specific pack, aimed at making xstack more effective on real Next.js projects.  
  `nextjs-app-pack` 是第一个面向具体技术栈的 pack，目标是让 xstack 在真实 Next.js 项目中更有效。
- `prisma-pack` has been added as the first backend-oriented Node stack pack, aimed at improving Prisma schema, query-shape, transaction, and release-readiness review.  
  `prisma-pack` 已作为第一个偏后端的 Node 技术栈 pack 加入，用于提升 Prisma 的 schema、查询结构、事务判断和发版准备审查质量。
- `nestjs-backend-pack` has been added to strengthen Node backend architecture review around controllers, services, modules, DTOs, guards, and provider boundaries.  
  `nestjs-backend-pack` 已加入，用于加强 Node 后端在控制器、服务、模块、DTO、Guard 和 Provider 边界上的架构审查能力。
- `trpc-pack` has been added to strengthen full-stack TypeScript review around routers, procedures, Zod schemas, middleware, and query/mutation coordination.  
  `trpc-pack` 已加入，用于加强全栈 TypeScript 在 router、procedure、Zod schema、middleware 以及 query/mutation 协调方面的审查能力。

## Implementation plan / 实施计划

### Phase 1 / 阶段 1

Add the first four packs as reusable reference material under `packs/`.  
把前四个 pack 作为可复用参考材料加入 `packs/` 目录。

### Phase 2 / 阶段 2

Wire those packs into the existing core skills:  
把这些 pack 接入现有核心 skills：

- `plan-engineering`
- `implement-feature`
- `review-change`
- `qa-release`
- `security-review`

### Phase 3 / 阶段 3

Observe where packs are not enough and promote the most valuable workflows into standalone skills only if needed.  
观察哪些场景仅靠 packs 已经不够，然后只在确有必要时，把最有价值的流程升级成独立 skill。

## Success criteria / 成功标准

v0.2 is successful if it noticeably reduces:  
如果 v0.2 能明显减少以下问题，就算成功：

- frontend state omissions / 前端状态遗漏
- backend API contract drift / 后端 API 契约漂移
- migration-related release risk / 与迁移相关的发版风险
- frontend/backend mismatch after implementation / 实现完成后前后端不匹配的问题

It should also improve:  
同时它还应该带来以下提升：

- review quality / review 质量
- QA completeness / QA 完整性
- release confidence for web-app changes / 对 Web 应用改动的发版信心
