# ANTI-PATTERNS / 反模式

xstack is small on purpose.

xstack 被刻意保持得很小。

That only works if it is used with discipline.
只有在使用方式也足够克制时，它才会真正有效。

This file describes common failure modes when using xstack.

---

## 1. Loading too many skills at once
## 一次塞太多 skill

### Bad
“Use plan-product, plan-engineering, implement-feature, review-change, qa-release, security-review, design-review, benchmark-change on this small UI tweak.”

### Why this is bad
- too many modes at once
- weak task focus
- noisy outputs
- false sense of rigor

### Better
Use the smallest set that matches the task.

For a small UI tweak:
- `plan-engineering`
- `implement-feature`
- `review-frontend-flow`
- `qa-release`

---

## 2. Starting with implementation before inspection
## 还没看仓库就先开始实现

### Bad
“Implement this feature now.”

### Why this is bad
- easy to fight the repo's actual structure
- increases rework
- encourages hidden scope growth

### Better
Start with:
- `plan-engineering`

If requirements are vague, start even earlier with:
- `plan-product`

---

## 3. Treating `implement-feature` as permission for broad rewrites
## 把 `implement-feature` 当成大改授权

### Bad
A small feature request turns into:
- architecture rewrite
- folder reorganization
- unrelated cleanup
- convention replacement

### Why this is bad
- scope creep
- harder review
- weaker validation
- release risk rises fast

### Better
Keep changes tightly scoped.
If a larger redesign is truly needed, say so explicitly before doing it.

---

## 4. Treating type safety as proof of product correctness
## 把类型安全当成产品正确性的证明

### Bad
“It compiles, so the API change is safe.”

### Why this is bad
- types do not guarantee UX coherence
- types do not guarantee correct permission behavior
- types do not guarantee rollout safety
- types do not guarantee old data compatibility

### Better
Use:
- `review-backend-api`
- `review-frontend-flow`
- `qa-release`

especially when contracts, state, or permissions changed.

---

## 5. Doing review as style commentary
## 把 review 做成样式点评

### Bad
- naming nitpicks
- formatting comments
- abstract discomfort
- no concrete failure modes

### Why this is bad
It creates the appearance of rigor without improving release quality.

### Better
`review-change` should focus on:
- correctness
- regressions
- edge cases
- state transitions
- missing validation
- real release risk

---

## 6. Calling something “ready” without validation evidence
## 没有验证证据就说 ready

### Bad
“The code is done.”

### Why this is bad
Done coding is not the same as ready to ship.

### Better
Use `qa-release` and state:
- what was tested
- what was not tested
- what risks remain
- whether the release is blocked

---

## 7. Using packs as if they were separate workflows
## 把 pack 当成独立 workflow 使用

### Bad
“Use prisma-pack to build this feature.”

### Why this is bad
A pack is not a workflow mode.
It is a specialized lens.

### Better
Use a skill as the mode, and a pack as the lens.

For example:
- `plan-engineering` + `prisma-pack`
- `review-backend-api` + `auth-permission-pack`

---

## 8. Skipping security review when the change obviously affects trust boundaries
## 明显涉及信任边界却跳过安全审查

### Bad
Auth, tenant scope, billing, or sensitive data changed, but no dedicated security pass happened.

### Why this is bad
These are exactly the areas where “looks fine” is not good enough.

### Better
Add `security-review` when the task affects:
- authentication
- authorization
- tenant isolation
- billing
- sensitive data exposure
- trust boundaries

---

## 9. Writing prompts that are too vague to constrain behavior
## prompt 太模糊，无法约束行为

### Bad
“Review this carefully.”
“Help me implement this better.”
“Make this production ready.”

### Why this is bad
Vague prompts encourage vague outputs.

### Better
Ask for:
- a specific mode
- a specific output shape
- a specific decision

Example:

```text
Use review-change on this diff.
Separate must-fix from should-fix.
Call out test gaps and release risk.
```

---

## 10. Reading every skill before doing any work
## 还没开始做事就把所有 skill 都读一遍

### Bad
Front-loading every document creates fatigue and confusion.

### Better
Read only:
- the entry docs
- one relevant example
- the specific `SKILL.md` files you actually need

xstack should feel sharper as you use it, not heavier before you begin.

---

## Rule to remember / 最该记住的一条规则

Use xstack to reduce drift, not to simulate sophistication.

使用 xstack 的目的，是减少跑偏，不是制造“看起来很专业”的复杂感。
