# CODEX workflows / 面向 Codex 的工作流

This document explains how to use xstack as a practical workflow layer for Codex sessions.  
这个文档解释如何把 xstack 当成一层面向 Codex 会话的实用工作流层来使用。

The goal is not to make Codex more ceremonial.  
目标不是让 Codex 更有仪式感。

The goal is to make it more disciplined at the moments that matter:  
目标是在真正关键的时刻，让它更有纪律：

- before coding
- during risky implementation
- during review
- before shipping

---

## Core idea / 核心思路

Codex is usually strongest when it can:

- inspect a repository
- make focused changes
- run validation
- summarize results

Codex 通常最擅长：

- 检查仓库
- 做聚焦修改
- 跑验证
- 总结结果

What it often needs is not more raw capability, but a better session shape.  
Codex 更常缺的不是原始能力，而是更好的会话结构。

That is what xstack should provide.  
xstack 的价值就在这里。

---

## The default rule / 默认规则

If you are unsure which workflow to use, start with:

1. `plan-engineering`
2. `implement-feature`
3. `review-change`
4. `qa-release`

如果你不确定该选哪条 workflow，先从这条默认路径开始：

1. `plan-engineering`
2. `implement-feature`
3. `review-change`
4. `qa-release`

This is the smallest useful Codex loop for most repository work.  
这是大多数仓库任务最小但有用的 Codex 闭环。

---

## Session pattern 1 — Small repository change / 小型仓库改动

Use when:

- the task is already clear
- scope is small
- no auth, migration, or rollout complexity is obvious

适用场景：

- 任务已经比较清楚
- 范围较小
- 暂时看不出 auth、migration 或 rollout 风险

### Recommended flow

1. `plan-engineering`
2. `implement-feature`
3. `review-change`
4. `qa-release`

### Why this flow works

- `plan-engineering` stops Codex from changing files before understanding the repo.
- `review-change` adds a correctness pass instead of relying on implementation optimism.
- `qa-release` forces a final shipping judgment.

- `plan-engineering` 可以避免 Codex 在没理解仓库前就改文件。
- `review-change` 提供一次正确性检查，避免实现完成后过度乐观。
- `qa-release` 强制补上一层上线判断。

### Good prompt starter

```text
Use plan-engineering first.
Inspect the repo before proposing code changes.
Then implement the smallest sound change.
After implementation, run review-change and qa-release.
```

---

## Session pattern 2 — Vague feature request / 模糊功能需求

Use when:

- the request is still fuzzy
- the real scope is unclear
- you expect product questions to matter

适用场景：

- 需求还比较模糊
- 真实范围不清楚
- 产品层问题会影响实现

### Recommended flow

1. `plan-product`
2. `plan-engineering`
3. `implement-feature`
4. `review-change`
5. `qa-release`

### Why this flow works

- `plan-product` turns “an idea” into something Codex can implement without inventing its own product assumptions.
- `plan-engineering` then grounds the implementation in the actual repo.

- `plan-product` 把“想法”整理成可实现的范围，避免 Codex 自己脑补产品假设。
- `plan-engineering` 再把实现落到真实仓库结构里。

### Good prompt starter

```text
Use plan-product to clarify goals, scope, non-goals, and acceptance criteria.
Then use plan-engineering to inspect the repo and propose the smallest sound implementation.
After implementation, run review-change and qa-release.
```

---

## Session pattern 3 — Frontend feature flow / 前端功能流

Use when:

- the main risk is UX quality
- user states matter
- forms, loading, error, or retry behavior matter

适用场景：

- 主要风险在 UX 质量
- 用户状态切换很重要
- 表单、loading、error、retry 行为很重要

### Recommended flow

1. `plan-engineering`
2. `implement-feature`
3. `review-frontend-flow`
4. `qa-release`

Optional:
- `design-review`

### Why this flow works

- frontend work often fails in product behavior, not syntax
- `review-frontend-flow` is a better fit than generic review when state and interaction quality are the main risk

- 前端任务最常出问题的地方通常不是语法，而是产品行为。
- 当状态完整性和交互质量是主风险时，`review-frontend-flow` 比 generic review 更合适。

### Good prompt starter

```text
Use plan-engineering first.
After implementation, run review-frontend-flow and qa-release.
Focus on loading, error, empty, submit, success, retry, and refresh behavior.
```

---

## Session pattern 4 — Backend/API change / 后端或 API 改动

Use when:

- contract shape matters
- auth or permission behavior may change
- rollout and compatibility risk matter

适用场景：

- 契约结构很重要
- auth 或 permission 行为可能改变
- rollout 和兼容性风险重要

### Recommended flow

1. `plan-engineering`
2. `implement-feature`
3. `review-backend-api`
4. `qa-release`

Optional:
- `security-review`

### Why this flow works

- backend risk often hides in contracts, object access, and assumptions made by existing callers
- `review-backend-api` is designed to catch that better than a generic diff review

- 后端风险常常藏在契约、对象级访问控制，以及旧调用方的假设里。
- `review-backend-api` 比 generic diff review 更适合抓这些问题。

### Good prompt starter

```text
Use plan-engineering first.
Implement the smallest sound backend change.
After implementation, run review-backend-api and qa-release.
If permissions or trust boundaries changed, also run security-review.
```

---

## Session pattern 5 — High-risk or sensitive work / 高风险或敏感改动

Use when:

- auth or permissions are involved
- data exposure is possible
- billing, tenant isolation, or trust boundaries are touched
- the request is ambiguous but high impact

适用场景：

- 涉及 auth 或 permissions
- 可能引发数据暴露
- 触及 billing、tenant isolation 或 trust boundary
- 需求不清但影响很大

### Recommended flow

1. `careful-mode`
2. `plan-engineering`
3. `security-review`
4. `implement-feature`
5. `review-change` or `review-backend-api`
6. `qa-release`

### Why this flow works

- `careful-mode` tells Codex to stop acting like a fast editor and start acting like a cautious engineer
- `security-review` prevents permission or exposure issues from being treated as secondary details

- `careful-mode` 会让 Codex 从“快速编辑器”切到“谨慎工程师”模式。
- `security-review` 则能防止权限或暴露问题被当成次要细节略过。

### Good prompt starter

```text
Use careful-mode first.
Then use plan-engineering before making changes.
Run security-review on the relevant flow.
After implementation, run the appropriate review mode and qa-release.
```

---

## Session pattern 6 — Bug or incident / bug 或故障

Use when:

- the task is primarily diagnosis
- the fix is not obvious yet
- you need to narrow root causes first

适用场景：

- 当前任务首先是诊断
- 修复路径还不明显
- 需要先缩小根因范围

### Recommended flow

1. `investigate-bug`
2. `plan-engineering` if a real fix is needed
3. `implement-feature`
4. `review-change`
5. `qa-release`

### Why this flow works

- `investigate-bug` helps Codex avoid turning vague symptoms into premature patches
- once the bug is understood, normal implementation and review discipline can resume

- `investigate-bug` 可以避免 Codex 把模糊症状直接变成拍脑袋修复。
- 等根因更清楚后，再回到正常的实现与审查流程。

### Good prompt starter

```text
Use investigate-bug first.
Narrow likely root causes before proposing a fix.
If a real code change is needed, switch into plan-engineering, then implement-feature, review-change, and qa-release.
```

---

## Session pattern 7 — Freeze / stabilization mode / 冻结与稳定模式

Use when:

- production is unstable
- broad edits are dangerous
- you need containment before normal progress

适用场景：

- 生产环境不稳定
- 大范围改动风险很高
- 需要先止血再恢复常规推进

### Recommended flow

1. `freeze-mode`
2. `investigate-bug`
3. `qa-release`
4. `unfreeze-mode` when it is truly safe to resume normal work

### Why this flow works

- this stops Codex from treating an incident like a normal feature session
- it keeps the priority on containment, diagnosis, and safe recovery

- 这能防止 Codex 把事故当成功能开发会话来处理。
- 它让优先级保持在止血、诊断和安全恢复上。

### Good prompt starter

```text
Use freeze-mode first.
Focus on stabilization and diagnosis, not broad implementation.
Use investigate-bug to narrow the cause.
Only return to normal execution after unfreeze-mode is justified.
```

---

## When to escalate the workflow / 什么时候该升级 workflow

Escalate from a lighter flow when:

- auth, permissions, or tenant scope become relevant
- rollout or compatibility risk grows
- data migration assumptions appear
- frontend/backend contract drift becomes visible
- the task turns out to be much broader than expected

当出现以下信号时，应该从轻量 flow 升级：

- auth、permissions 或 tenant scope 开始变重要
- rollout 或兼容性风险上升
- 出现数据迁移假设
- 前后端契约漂移开始明显
- 任务实际范围远大于一开始的判断

Typical upgrades:

- add `careful-mode`
- add `security-review`
- switch from `review-change` to `review-backend-api` or `review-frontend-flow`
- add `qa-release` if it was missing

---

## When to simplify the workflow / 什么时候该简化 workflow

Use a smaller flow when:

- the task is already concrete
- no contract, permission, or release risk is obvious
- there is no real product ambiguity
- the repo already shows a clear local pattern to follow

以下情况下可以用更轻的 flow：

- 任务已经足够具体
- 暂时没有明显的契约、权限或发布风险
- 不涉及真正的产品模糊性
- 仓库里已经有很清楚的本地模式可跟随

The point of xstack is not to maximize process.  
xstack 的目的不是把流程越加越多。

The point is to add the smallest discipline that prevents drift.  
目的是用最小的纪律约束来防止跑偏。

---

## What good Codex usage looks like / 什么叫好的 Codex 使用方式

A good xstack-driven Codex session usually does these things:

- inspects before changing
- keeps scope tight
- names risks explicitly
- validates before declaring success
- distinguishes “implemented” from “ready to ship”

一个好的 xstack 驱动的 Codex 会话，通常会做到：

- 改之前先检查
- 控制范围
- 明确写出风险
- 宣布成功前先验证
- 区分“已经实现”和“可以上线”

---

## What bad Codex usage looks like / 什么叫不好的 Codex 使用方式

Bad usage usually looks like:

- starting implementation before inspecting the repo
- using too many skills in one vague prompt
- treating compilation as proof of product correctness
- skipping review because the change feels small
- skipping qa-release because the code “looks done”

不好的使用方式通常表现为：

- 还没看仓库就开始实现
- 在一个模糊 prompt 里塞太多 skill
- 把“能编译”当成产品正确性的证明
- 因为改动看起来小，就跳过 review
- 因为代码“看起来做完了”，就跳过 qa-release

---

## Recommended companion docs / 建议搭配阅读

- `START_HERE.md`
- `QUICKSTART.md`
- `ANTI_PATTERNS.md`
- `examples/README.md`
- `examples/recommend-usage.md`
- `examples/prompt-starters.md`
- `SKILLS_INDEX.md`
- `PACKS_INDEX.md`

---

## Rule to remember / 最该记住的一条规则

Use xstack to shape the Codex session, not to decorate it.  
使用 xstack 的目的，是塑造 Codex 会话结构，而不是给会话加装饰。
