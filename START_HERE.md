# START HERE / 从这里开始

xstack is a compact, Node-first workflow stack for Codex.

xstack 不是一个“万能 prompt 集合”。
它是一组明确的工作模式，帮助 Codex：

- 在修改前先规划
- 在实现时控制范围
- 在 review 时更像工程师
- 在 QA 和发版判断时更谨慎

If you are new to xstack, do not start by reading everything.  
如果你是第一次接触 xstack，不要试图一口气读完整个仓库。

Start with the smallest useful path.

---

## What xstack is made of / xstack 由什么组成

### Skills
Skills are workflow modes.

Skills 是工作模式。它们决定 Codex 此刻应该怎么工作。

Examples:

- `plan-product`
- `plan-engineering`
- `implement-feature`
- `review-change`
- `qa-release`

### Packs
Packs are stack-specific or domain-specific review lenses.

Packs 是技术栈或领域专项的检查视角。

Examples:

- `nextjs-app-pack`
- `prisma-pack`
- `backend-api-pack`
- `auth-permission-pack`

### References
References are deeper checklists and templates used only when needed.

References 是按需使用的更细清单和模板，不应该成为主流程噪音。

---

## Choose your first path / 选择你的第一条路径

### If you just want to try xstack quickly
Use:

1. `plan-engineering`
2. `review-change`
3. `qa-release`

Recommended prompt:

```text
Use plan-engineering to inspect the repo and propose the smallest sound implementation plan.
After implementation, use review-change and qa-release before calling the task done.
```

---

### If you are building a new feature
Use:

1. `plan-product`
2. `plan-engineering`
3. `implement-feature`
4. `review-change`
5. `qa-release`

---

### If you are fixing a bug
Use:

1. `investigate-bug`
2. `plan-engineering` if needed
3. `implement-feature`
4. `review-change`
5. `qa-release`

---

### If the change is risky
Use:

1. `careful-mode`
2. `plan-engineering`
3. `security-review` when auth, permissions, data, billing, or trust boundaries are involved
4. `implement-feature`
5. `review-change`
6. `qa-release`

---

## Choose by stack / 按技术栈选择

### Next.js app
Add:

- `nextjs-app-pack`
- `review-frontend-flow`

### Next.js + Prisma
Add:

- `nextjs-app-pack`
- `prisma-pack`

### Next.js + tRPC + Prisma
Add:

- `nextjs-app-pack`
- `trpc-pack`
- `prisma-pack`
- `review-frontend-flow`
- `review-backend-api`

### NestJS + Prisma
Add:

- `nestjs-backend-pack`
- `prisma-pack`
- `review-backend-api`
- `security-review`

### Express + Prisma
Add:

- `express-api-pack`
- `prisma-pack`
- `review-backend-api`
- `security-review`

---

## Read in this order / 建议阅读顺序

1. `README.md`
2. `QUICKSTART.md`
3. `CODEX_WORKFLOWS.md`
4. one file from `examples/` that matches your stack
5. the skill you want to start with

Do not read every skill up front unless you actually need them.

---

## Common mistake / 常见误区

Do not use xstack by dumping 8 skills into one vague prompt.

不要把 8 个 skill 一股脑塞进一个模糊 prompt 里。

xstack works best when:
- the task is clear
- the workflow mode is explicit
- the output shape is expected
- the validation step is real

---

## Minimal rule / 最小规则

If you only remember one thing, remember this:

**Do not let coding be the first step or the last judgment.**

请不要让“开始写代码”成为第一步，也不要让“代码写完了”成为最后判断。
