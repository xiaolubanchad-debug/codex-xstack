# xstack v0.3.0 release plan / xstack v0.3.0 发布方案

## Release goal / 发布目标

Ship the first release where xstack is presented clearly as a **Node-first, Codex-first workflow stack** rather than only a general web workflow project.  
发布一个版本，让 xstack 第一次能够被清晰地呈现为一个 **Node-first、Codex-first 的工作流栈**，而不只是一个通用 Web workflow 项目。

## Proposed release title / 建议版本标题

**xstack v0.3.0 — Node-first workflow stack**  
**xstack v0.3.0 —— Node-first 工作流栈**

## Release positioning / 发布定位

This release should communicate three things clearly:  
这个版本应该清楚传达三件事：

1. xstack has moved beyond a generic baseline.  
   xstack 已经不再只是一个通用基线。
2. xstack is now intentionally focused on Node/TypeScript web delivery.  
   xstack 现在明确聚焦于 Node/TypeScript Web 交付。
3. xstack now has enough stack-specific packs and examples to feel usable in real projects.  
   xstack 现在已经拥有足够的技术栈 pack 和示例，可以在真实项目中体现可用性。

## What should be included / 这个版本应该包含什么

### Core message / 核心信息

xstack is becoming a practical operating layer for real Node teams using Codex.  
xstack 正在成为一个面向真实 Node 团队、帮助他们使用 Codex 的实用操作层。

### Highlights / 亮点

#### 1. Node-first stack packs / Node-first 技术栈增强包

- `nextjs-app-pack`
- `prisma-pack`
- `nestjs-backend-pack`
- `trpc-pack`
- `express-api-pack`

#### 2. Web delivery packs / Web 交付增强包

- `frontend-state-flow-pack`
- `form-flow-pack`
- `component-consistency-pack`
- `backend-api-pack`
- `auth-permission-pack`
- `db-migration-pack`
- `fullstack-contract-pack`
- `release-risk-pack`
- `incident-response-pack`

#### 3. Review skills / 审查技能

- `review-frontend-flow`
- `review-backend-api`

#### 4. Onboarding improvements / 上手体验改进

- bilingual README / 双语 README
- bilingual release notes / 双语 release notes
- bilingual roadmap and contributing docs / 双语 roadmap 和 contributing 文档
- install script / 安装脚本
- doctor script / 自检脚本
- quick start / 快速开始
- Node-first examples hub / Node-first 示例中枢

#### 5. Real examples / 真实示例

- `nextjs-prisma-feature-flow.md`
- `nextjs-trpc-prisma-fullstack-flow.md`
- `nest-prisma-backend-flow.md`
- `express-prisma-api-flow.md`

## Release checklist / 发布检查清单

Before shipping v0.3.0, confirm the following:  
在发布 v0.3.0 之前，确认以下事项：

### Messaging / 文案

- README clearly says Node-first  
  README 已清楚表达 Node-first 定位
- release notes reflect the Node-first shift  
  release notes 已体现 Node-first 转向
- roadmap and milestone language are aligned  
  roadmap 和 milestone 文案已经对齐

### Repository health / 仓库健康度

- `./scripts/doctor.sh` passes cleanly  
  `./scripts/doctor.sh` 可 clean pass
- install script usage is documented  
  install script 的用法已写清楚
- no removed-pack references remain  
  没有残留已删除 pack 的引用

### Examples / 示例

- at least one frontend-oriented Node example exists  
  至少有一条面向前端的 Node 示例
- at least one full-stack TypeScript example exists  
  至少有一条全栈 TypeScript 示例
- at least one structured backend example exists  
  至少有一条结构化后端示例
- at least one lightweight API example exists  
  至少有一条轻量 API 示例

## Suggested release note structure / 建议的 release note 结构

### Title / 标题

xstack v0.3.0 — Node-first workflow stack

### Opening / 开头

xstack v0.3.0 is the release where xstack becomes clearly Node-first. It now combines a stronger Node/TypeScript positioning, stack-specific packs, improved onboarding, and real Node workflow examples.  
xstack v0.3.0 是 xstack 明确转向 Node-first 的版本。它现在同时具备更清晰的 Node/TypeScript 定位、技术栈专项 packs、更好的上手体验，以及真实的 Node 工作流示例。

### Sections / 章节建议

1. Node-first positioning / Node-first 定位
2. New stack-specific packs / 新增技术栈 packs
3. Example system improvements / 示例体系增强
4. Onboarding and install improvements / 安装与上手体验提升
5. What’s next / 下一步方向

## Suggested public framing / 建议的对外表述

### Short version / 短版

xstack v0.3.0 is the release where xstack becomes a clearer Node-first workflow stack for Codex.  
xstack v0.3.0 是 xstack 明确成为一个面向 Codex 的 Node-first 工作流栈的版本。

### Longer version / 长版

xstack v0.3.0 turns xstack from a strong web workflow baseline into a more concrete Node/TypeScript delivery stack, with stack-specific packs, real examples, better onboarding, and stronger workflow guidance.  
xstack v0.3.0 将 xstack 从一个强力的 Web workflow 基线，推进成一个更具体的 Node/TypeScript 交付栈，具备技术栈专项 packs、真实示例、更好的上手体验和更强的工作流指导能力。

## Recommendation / 建议

Do not rush to add many more packs before releasing v0.3.0.  
在发布 v0.3.0 之前，不要急着继续大量增加 packs。

At this stage, release quality comes more from coherence and positioning than from raw pack count.  
在这个阶段，版本质量更多来自整体一致性和定位清晰度，而不是 pack 数量本身。
