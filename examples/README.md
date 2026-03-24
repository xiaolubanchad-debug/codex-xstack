# Node-first examples hub / Node-first 示例中枢

This directory is the workflow hub for xstack examples.  
这个目录是 xstack 示例体系的 workflow 中枢。

Its purpose is not just to list files, but to help a Node team quickly find the right example path for the stack and task they care about.  
它的目的不只是列出文件，而是帮助 Node 团队快速找到最适合自己技术栈和任务场景的示例路径。

---

## Current generic examples / 当前通用示例

These examples already exist and are still useful as baseline flows:  
这些示例已经存在，仍然适合作为基础工作流参考：

- `frontend-feature.md`
- `backend-api-change.md`
- `fullstack-flow.md`

Use them when you want to understand the general xstack workflow before switching to stack-specific examples.  
如果你想先理解 xstack 的通用工作流，再进入具体技术栈示例，可以先看这些文件。

---

## Planned Node-first examples / 计划中的 Node-first 示例

### 1. Next.js + Prisma feature flow

**Use when / 适用场景：**  
You are building a user-facing feature in a Next.js app backed by Prisma.  
你正在做一个由 Prisma 支撑数据层的 Next.js 用户功能。

**Recommended flow / 推荐流程：**

1. `plan-product`
2. `plan-engineering`
3. `implement-feature`
4. `review-frontend-flow`
5. `qa-release`

**Key packs / 关键 packs：**

- `nextjs-app-pack`
- `prisma-pack`
- optional: `component-consistency-pack` / 可选：`component-consistency-pack`

---

### 2. Next.js + tRPC + Prisma full-stack flow

**Use when / 适用场景：**  
You are building a full-stack TypeScript feature with shared procedure contracts.  
你正在做一个依赖共享 procedure 契约的全栈 TypeScript 功能。

**Recommended flow / 推荐流程：**

1. `plan-engineering`
2. `implement-feature`
3. `review-frontend-flow`
4. `review-backend-api`
5. `qa-release`

**Key packs / 关键 packs：**

- `nextjs-app-pack`
- `trpc-pack`
- `prisma-pack`
- `fullstack-contract-pack`

---

### 3. NestJS + Prisma backend flow

**Use when / 适用场景：**  
You are building or changing a structured Node backend with NestJS and Prisma.  
你正在用 NestJS + Prisma 构建或修改一个结构化 Node 后端。

**Recommended flow / 推荐流程：**

1. `plan-engineering`
2. `implement-feature`
3. `review-backend-api`
4. `security-review`
5. `qa-release`

**Key packs / 关键 packs：**

- `nestjs-backend-pack`
- `prisma-pack`
- `auth-permission-pack`
- optional: `release-risk-pack` / 可选：`release-risk-pack`

---

### 4. Express + Prisma API flow

**Use when / 适用场景：**  
You are working on a lighter-weight Node API with Express and Prisma.  
你正在处理一个基于 Express + Prisma 的轻量 Node API。

**Recommended flow / 推荐流程：**

1. `plan-engineering`
2. `implement-feature`
3. `review-backend-api`
4. `security-review`
5. `qa-release`

**Key packs / 关键 packs：**

- `express-api-pack`
- `prisma-pack`
- `auth-permission-pack`
- optional: `incident-response-pack` / 可选：`incident-response-pack`

---

## What each example file should contain / 每个示例文件应该包含什么

Each future example should use a consistent structure:  
后续每个示例文件都应该使用统一结构：

1. Scenario / 场景
2. Stack / 技术栈
3. Recommended skill flow / 推荐 skill 流程
4. Relevant packs / 相关 packs
5. Example prompts / 示例提示词
6. What xstack should catch / xstack 应该帮你抓到什么
7. What a good final result looks like / 理想结果长什么样

---

## Suggested reading order / 建议阅读顺序

If you are new to xstack:  
如果你是第一次接触 xstack：

1. `README.md`
2. `examples/frontend-feature.md`
3. `examples/backend-api-change.md`
4. this file / 当前这个文件

If you already understand xstack and want stack-specific guidance:  
如果你已经理解 xstack，只是想看技术栈专项 guidance：

1. this file / 当前这个文件
2. choose the example path that matches your stack / 选择与你技术栈对应的示例路径
3. follow the packs listed for that path / 按照对应 packs 去组合使用

---

## Goal / 目标

The goal is to make xstack easier to adopt for real Node teams by showing realistic stack-shaped usage instead of only abstract workflow guidance.  
目标是让真实的 Node 团队更容易采用 xstack：不只是看到抽象工作流说明，而是能直接看到贴近真实技术栈的使用方式。
