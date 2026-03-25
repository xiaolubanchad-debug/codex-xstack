# Frontend feature example / 前端功能示例

## Scenario / 场景

Add a new settings form for updating a user's profile preferences.  
新增一个设置页表单，用来更新用户的个人偏好。

This is a representative example of a user-facing feature that can look done in code while still feeling incomplete in product behavior.  
这是一个很典型的用户功能场景：代码层面可能已经“做完”，但产品行为层面仍然可能不完整。

---

## Recommended skill flow / 推荐 skill 流程

1. `plan-product`
2. `plan-engineering`
3. `implement-feature`
4. `review-frontend-flow`
5. `qa-release`
6. optional: `document-release` / 可选：`document-release`

Use this flow when the change is mainly about user experience, state completeness, and product-quality interaction behavior.  
当这类改动主要风险在于用户体验、状态完整性和交互质量时，适合用这条流程。

---

## Copy-paste prompt / 可直接复制的 prompt

```text
Use plan-product to turn this settings-page idea into scope and acceptance criteria.
Then use plan-engineering to inspect the repo and propose the smallest sound implementation.
After implementation, run review-frontend-flow and qa-release before calling it ready.
Focus on loading, error, empty, submit, success, retry, and post-save UI behavior.
```

```text
用 plan-product 把这个设置页想法整理成范围和验收标准。
然后用 plan-engineering 检查仓库，并提出最小但靠谱的实现方案。
实现完成后，执行 review-frontend-flow 和 qa-release，再判断是否真的 ready。
重点关注 loading、error、empty、submit、success、retry 以及保存后的 UI 行为。
```

---

## Expected output shape / 期望输出结构

A good run should roughly produce:  
一次好的执行，应该大致产出这些结构：

### 1. Product framing / 产品整理
- goal
- scope
- non-goals
- acceptance criteria

### 2. Implementation plan / 实现计划
- affected UI areas
- state transitions
- data dependency assumptions
- smallest sound implementation steps
- validation plan

### 3. Frontend review / 前端审查
- summary
- must-fix
- should-fix
- state gaps
- UX quality concerns
- test gaps

### 4. Release judgment / 发版判断
- what was validated
- what was not validated
- remaining risk
- ship / no-ship recommendation

If the output skips state behavior and only talks about component structure, it is usually too shallow.  
如果输出只谈组件结构，不谈状态行为，通常说明深度还不够。

---

## What xstack should help catch / xstack 应该帮你抓到什么

- missing loading, empty, or error states / loading、empty、error 状态缺失
- weak submit-state handling / 提交状态处理不完整
- stale UI after save / 保存后页面状态未及时更新
- inconsistent button, form, or spacing patterns / 按钮、表单或间距风格不一致
- frontend assumptions not supported by backend responses / 前端假设和后端返回不一致
- optimistic UI or success messaging that does not reflect actual save behavior / 乐观更新或成功提示与真实保存行为不一致
- retry or validation flows that exist technically but feel poor in product use / 重试或校验流程在技术上存在，但产品体验上不够顺

---

## Common failure modes / 常见跑偏模式

### 1. The plan jumps into coding without mapping user states
只讲代码改动，不讲用户状态流转。

### 2. The implementation focuses on fields and handlers, but not on save/reload behavior
只关心字段和 handler，没有想保存后、刷新后、失败后的行为。

### 3. The review talks about styling, but not product completeness
review 偏样式点评，没有审查产品流程完整性。

### 4. The feature technically works, but submit/disabled/error/retry behavior is underdefined
功能技术上能跑，但提交中、禁用态、报错态、重试态没有定义清楚。

### 5. The UI assumes the backend response shape without checking contract stability
前端直接假设后端响应结构稳定，没有检查契约对齐情况。

---

## Human correction prompts / 人类纠偏 prompt

Use these when the first run is too shallow or too implementation-heavy.  
如果第一轮输出太浅，或太偏实现细节，可以用下面这些 prompt 纠偏。

### If state handling is weak
```text
Redo this with stronger attention to initial, loading, empty, error, submit, success, retry, and refresh states.
Do not assume the happy path is enough.
```

### If the plan is too large
```text
Shrink this to the smallest sound implementation.
Call out what is in scope now vs what should be deferred.
```

### If frontend/backend alignment is fuzzy
```text
Explicitly list which backend fields, response shapes, and mutation outcomes the UI depends on.
Call out any assumptions that should be validated.
```

### If the review is too soft
```text
Redo the review like a frontend product-quality reviewer.
Separate must-fix from should-fix and call out concrete failure modes.
```

---

## Good final result / 理想结果

You end up with a form that not only works, but also behaves like a real product flow.  
最终结果不只是“表单能提交”，而是它像一个真正的产品流程那样完整、顺手、可验收。

A good final result means:
- the user can understand what is happening
- the save flow behaves coherently
- failures are recoverable
- the UI stays aligned with backend reality
- QA has something concrete to verify

一个理想结果意味着：
- 用户能理解当前发生了什么
- 保存流程行为连贯
- 失败后可以恢复
- UI 与后端现实保持一致
- QA 有明确可验证的检查点
