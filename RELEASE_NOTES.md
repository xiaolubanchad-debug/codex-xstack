# xstack v0.2.0

## Summary / 概述

xstack v0.2.0 is the first release where xstack becomes meaningfully **web-focused**, and the project is now clearly moving toward a **Node-first** direction.  
xstack v0.2.0 是第一个明显开始朝 **Web 开发方向** 收拢的版本，同时项目也开始更明确地向 **Node-first** 路线发展。

It keeps the core Codex delivery loop from v0.1:  
它保留了 v0.1 中的核心 Codex 交付闭环：

- plan before implementation / 先规划再实现
- keep changes focused / 保持改动范围聚焦
- review for correctness and risk / 从正确性和风险角度进行审查
- validate release readiness explicitly / 明确验证是否具备发版条件
- document what shipped / 记录与说明已经发布的内容

and adds a stronger layer for real website frontend/backend work.  
并在此基础上增加了更强的、面向真实网站前后端开发的增强层。

## New in v0.2.0 / v0.2.0 新增内容

### Web app packs / Web 应用增强包

- `frontend-state-flow-pack`
- `backend-api-pack`
- `db-migration-pack`
- `fullstack-contract-pack`
- `form-flow-pack`
- `auth-permission-pack`
- `release-risk-pack`
- `incident-response-pack`
- `component-consistency-pack`

### Web-focused review skills / Web 专项审查技能

- `review-frontend-flow`
- `review-backend-api`

## Why this release matters / 这个版本为什么重要

v0.2.0 moves xstack beyond a general-purpose workflow layer and toward a practical **Codex-first full-stack web delivery stack**.  
v0.2.0 让 xstack 不再只是一个通用工作流层，而开始成为一个更实用的 **Codex-first 全栈 Web 交付栈**。

This release is aimed at improving:  
这个版本重点提升的方面包括：

- frontend state completeness / 前端状态完整性
- form quality and submission behavior / 表单质量与提交流程
- UI consistency across repeated patterns / 重复界面模式中的 UI 一致性
- backend API contract quality / 后端 API 契约质量
- auth and permission review / 认证与权限审查
- migration safety / 数据迁移安全性
- frontend/backend alignment / 前后端对齐程度
- release and incident judgment / 发版判断与事故处理判断

## Full current stack / 当前完整栈

### Core delivery flow / 核心交付流程

- `plan-product`
- `plan-engineering`
- `implement-feature`
- `review-change`
- `qa-release`

### Extended delivery modes / 扩展交付模式

- `investigate-bug`
- `security-review`
- `design-review`
- `benchmark-change`
- `document-release`

### Web-focused reviews / Web 专项审查

- `review-frontend-flow`
- `review-backend-api`

### Control modes / 控制模式

- `careful-mode`
- `freeze-mode`
- `unfreeze-mode`

## Notes / 说明

v0.2.0 is still intentionally compact.  
v0.2.0 仍然刻意保持紧凑。

The project is not trying to simulate an entire org chart or become a giant prompt collection. The goal is to give Codex sharper operating modes and reusable web-delivery checks that improve real software work.  
这个项目并不想模拟一整套组织架构，也不想变成一个巨大的 prompt 集合。它的目标是给 Codex 提供更锋利的工作模式和可复用的 Web 交付检查机制，从而提升真实软件开发工作。

## Likely next areas / 下一步可能的方向

- continue expanding Node-first stack-specific packs beyond `nextjs-app-pack`, `prisma-pack`, and `nestjs-backend-pack`  
  在 `nextjs-app-pack`、`prisma-pack` 和 `nestjs-backend-pack` 之后，继续扩展更多 Node-first 的技术栈增强包
- stronger observability helpers beyond current incident-response support  
  在现有事故响应支持之上继续增强可观测性辅助能力
- packaging and distribution for easier reuse  
  做更方便复用的打包与分发方式
- tighter repository-specific conventions  
  更贴近具体仓库的约定和工作流约束
