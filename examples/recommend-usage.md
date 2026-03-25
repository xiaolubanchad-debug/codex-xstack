# Recommend usage / 推荐器使用示例

This file shows how to use `scripts/recommend.sh` as a lightweight workflow recommender.  
这个文件展示如何把 `scripts/recommend.sh` 当成一个轻量 workflow 推荐器来使用。

The goal is not to replace judgment.  
目标不是替代判断。

The goal is to shorten the distance between “I have a task” and “I know the first sensible xstack path to try.”  
目标是缩短“我有一个任务”和“我知道先试哪条靠谱的 xstack 路径”之间的距离。

---

## When to use it / 什么时候用

Use `recommend.sh` when you want a fast starting point for:

- a new feature idea
- a bug or incident
- a backend or API review
- a stack-specific task such as Next.js, Prisma, NestJS, tRPC, or Express
- a risky or security-sensitive change

当你需要快速得到一个起步建议时，可以用 `recommend.sh`，尤其适合：

- 新功能想法
- bug 或事故
- 后端或 API 审查
- Next.js、Prisma、NestJS、tRPC、Express 等技术栈场景
- 高风险或安全敏感改动

---

## Basic usage / 基础用法

### Freeform query / 自由文本

```bash
./scripts/recommend.sh "nextjs prisma feature"
```

Use this when you want the shortest path and do not care about structured inputs.  
如果你只想快速试一下，不在意结构化输入，可以直接用这种方式。

### Structured inputs / 结构化输入

```bash
./scripts/recommend.sh --task feature --stack "nextjs prisma"
```

Use this when you want more stable and predictable recommendations.  
如果你想让推荐更稳定、更可控，建议使用结构化输入。

### JSON output / JSON 输出

```bash
./scripts/recommend.sh --task backend --stack "nestjs prisma" --risk sensitive --json
```

Use this when you want to inspect or script against the output.  
如果你想做脚本处理，或者更清楚地看结构化结果，可以用 JSON 输出。

---

## Example 1 — Next.js + Prisma feature

```bash
./scripts/recommend.sh --task feature --stack "nextjs prisma"
```

Expected shape / 预期推荐方向：

- `plan-product`
- `plan-engineering`
- `implement-feature`
- `review-frontend-flow`
- `qa-release`

Likely packs / 可能出现的 packs：

- `nextjs-app-pack`
- `prisma-pack`
- `frontend-state-flow-pack`
- `component-consistency-pack`

Why this makes sense / 为什么合理：

- Next.js user-facing work often has client/server boundary and UX-state risk.
- Prisma means data assumptions still matter, but the primary ship risk is often in the product flow.

- Next.js 的用户功能经常带有 client/server 边界和 UX 状态风险。
- Prisma 说明数据层也重要，但这类场景的主要交付风险通常还是产品流程是否完整。

---

## Example 2 — Sensitive NestJS backend change

```bash
./scripts/recommend.sh --task backend --stack "nestjs prisma" --risk sensitive
```

Expected shape / 预期推荐方向：

- `careful-mode`
- `plan-engineering`
- `implement-feature`
- `review-backend-api`
- `security-review`
- `qa-release`

Likely packs / 可能出现的 packs：

- `nestjs-backend-pack`
- `backend-api-pack`
- `auth-permission-pack`
- `prisma-pack`
- `release-risk-pack`

Why this makes sense / 为什么合理：

- Sensitive backend changes need both contract review and trust-boundary review.
- NestJS + Prisma often means DTOs, services, guards, and data assumptions all matter.

- 敏感后端改动通常同时需要契约审查和信任边界审查。
- NestJS + Prisma 往往意味着 DTO、service、guard 和数据假设都要一起看。

---

## Example 3 — Bug under freeze conditions

```bash
./scripts/recommend.sh --task bug --risk freeze
```

Expected shape / 预期推荐方向：

- `freeze-mode`
- `investigate-bug`
- `qa-release`

Likely packs / 可能出现的 packs：

- `incident-response-pack`

Why this makes sense / 为什么合理：

- Under freeze conditions, broad edits are the wrong first move.
- The goal is stabilization, diagnosis, and containment before normal implementation resumes.

- 在 freeze 场景下，大范围改动通常不是正确的第一步。
- 重点应该是稳定、诊断和止损，而不是立刻恢复常规开发节奏。

---

## Example 4 — Full-stack tRPC feature

```bash
./scripts/recommend.sh --task fullstack --stack "nextjs trpc prisma"
```

Expected shape / 预期推荐方向：

- `plan-engineering`
- `implement-feature`
- `review-frontend-flow`
- `review-backend-api`
- `qa-release`

Likely packs / 可能出现的 packs：

- `nextjs-app-pack`
- `trpc-pack`
- `prisma-pack`
- `fullstack-contract-pack`

Why this makes sense / 为什么合理：

- tRPC flows often hide risk behind shared types.
- The real question is whether the UI, procedures, and data assumptions still line up after the change.

- tRPC 场景很容易被“共享类型安全”掩盖真实风险。
- 真正要看的，是 UI、procedure 和数据假设在改动后是否仍然对齐。

---

## How to read the output / 怎么读推荐结果

### `flow`
This is the suggested first path.  
这是建议你先走的路径。

It is not a law.  
它不是法律。

It is the script's best current guess at the smallest sensible workflow.  
它是脚本当前对“最小但合理 workflow”的最佳猜测。

### `skills`
These are the most relevant skills around that task.  
这些是和该任务最相关的 skills。

Not all of them must be used every time.  
它们不一定每次都要全部用上。

### `packs`
These are the most relevant stack/domain lenses.  
这些是最相关的技术栈或领域专项视角。

Use them to sharpen review or planning, not to replace the workflow mode itself.  
它们的作用是让 review 或 planning 更聚焦，而不是替代 workflow mode 本身。

### `why`
This is the explanation layer.  
这是解释层。

If the explanation looks wrong, treat the recommendation as weak and adjust the inputs.  
如果解释本身看起来不对，那说明推荐质量也不高，应该回头调整输入。

---

## Tips / 小建议

### Prefer structured inputs when possible
Recommended:

```bash
./scripts/recommend.sh --task backend --stack "express prisma" --risk high
```

Instead of:

```bash
./scripts/recommend.sh "maybe some risky express api thing"
```

结构化输入通常会让推荐更稳定。

### Use freeform queries for quick exploration
If you are still framing the task, a quick freeform query is fine.  
如果你还在模糊探索任务，自由文本也完全可以。

### Treat recommendation as a first draft
The recommender is meant to reduce drift, not replace repo inspection.  
推荐器的目标是减少跑偏，不是替代对仓库的实际检查。

---

## Related files / 相关文件

- `scripts/recommend.sh`
- `scripts/test-recommend.sh`
- `config/recommend-rules.json`
- `config/recommend-rules.schema.json`
- `SKILLS_INDEX.md`
- `PACKS_INDEX.md`

---

## Rule to remember / 最该记住的一条

A recommendation is only useful if it helps you choose a better first workflow.  
只有当推荐能帮你选出更好的第一条 workflow，它才是有价值的。

Do not treat it as a substitute for engineering judgment.  
不要把它当成工程判断的替代品。
