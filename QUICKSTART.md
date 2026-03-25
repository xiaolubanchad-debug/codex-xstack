# QUICKSTART / 快速开始

This file is the shortest path to using xstack well.

这个文件提供的是：最短的上手路径。

---

## Goal / 目标

In the first 10 minutes, you should be able to:

- understand what xstack is for
- install it or point Codex at it
- run one useful workflow
- recognize whether the output is good enough

---

## Step 1 — Get the repo / 获取仓库

```bash
git clone https://github.com/xiaolubanchad-debug/codex-xstack.git
cd codex-xstack
```

---

## Step 2 — Choose how to use it / 选择使用方式

### Option A — Keep the repo where Codex can read it
If your workflow already reads this repository directly, you can use it in place.

如果你的 Codex 工作流本来就可以直接读取这个仓库，可以直接使用。

### Option B — Install skills and packs into a target directory
```bash
./scripts/install.sh ~/my-codex/xstack
```

Or use the unified entrypoint:

```bash
./scripts/xstack.sh install ~/my-codex/xstack
```

Then point your Codex setup at that directory.

然后把你的 Codex 配置指向该目录。

---

## Step 3 — Run doctor / 跑自检

```bash
./scripts/doctor.sh
```

This checks that the repository is complete and that pack references are not broken.

这个脚本会检查仓库结构是否完整，以及 pack 引用是否损坏。

---

## Step 4 — Try the smallest useful workflow / 先试最小有用流程

Start with:

- `plan-engineering`
- `review-change`
- `qa-release`

Use this exact prompt:

```text
Use plan-engineering to inspect the repo and propose the smallest sound implementation plan.
After implementation, use review-change and qa-release before calling the task done.
```

Why this flow:
- it is short
- it shows xstack's core value
- it improves planning, review, and release judgment without adding much process weight

---

## Step 5 — Add stack-specific help only when needed / 需要时再加专项支持

### Frontend / Next.js
Add:
- `review-frontend-flow`
- `nextjs-app-pack`

### Backend / API
Add:
- `review-backend-api`
- `backend-api-pack`

### Prisma / schema risk
Add:
- `prisma-pack`
- `db-migration-pack`

### Permissions / auth / tenant scope
Add:
- `security-review`
- `auth-permission-pack`

Do not add everything by default.

不要默认把所有东西都加上。

---

## What good output looks like / 好输出长什么样

### Good `plan-engineering`
Should include:
- problem summary
- relevant code areas
- smallest sound approach
- ordered steps
- risks
- validation plan
- open questions

### Good `review-change`
Should include:
- summary
- must-fix
- should-fix
- test gaps
- risk assessment

### Good `qa-release`
Should include:
- what was validated
- what was not validated
- release blockers
- ship / no-ship judgment
- confidence level

---

## What bad output looks like / 坏输出长什么样

Bad `plan-engineering`:
- starts coding immediately
- ignores the actual repo structure
- proposes a large rewrite without justification
- has no validation plan

Bad `review-change`:
- only comments on style
- does not identify real failure modes
- mixes must-fix and nice-to-have
- says “looks good” without evidence

Bad `qa-release`:
- treats “it compiles” as “ready to ship”
- does not mention test gaps
- ignores rollout or risk

---

## First workflows by use case / 按场景的第一条流程

### New feature
- `plan-product`
- `plan-engineering`
- `implement-feature`
- `review-change`
- `qa-release`

### Bug fix
- `investigate-bug`
- `plan-engineering` if needed
- `implement-feature`
- `review-change`
- `qa-release`

### Frontend page flow
- `plan-engineering`
- `implement-feature`
- `review-frontend-flow`
- `qa-release`

### Backend/API change
- `plan-engineering`
- `implement-feature`
- `review-backend-api`
- `qa-release`

### Sensitive change
- `careful-mode`
- `plan-engineering`
- `security-review`
- `implement-feature`
- `review-change`
- `qa-release`

---

## Rule of thumb / 经验法则

Use the smallest workflow that gives real discipline.

使用能带来真实纪律约束的最小 workflow。

Too little structure causes drift.
Too much structure causes friction.

结构太少，容易跑偏。
结构太多，也会变重。

xstack works best in the middle.

---

## Next step / 下一步

After this file, read:

1. one example from `examples/` that matches your stack
2. `ANTI_PATTERNS.md`
3. the `SKILL.md` files for the modes you actually plan to use
