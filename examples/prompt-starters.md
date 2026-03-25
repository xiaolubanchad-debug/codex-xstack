# Prompt starters / Prompt 起手式

This file contains short, copy-paste-friendly prompt starters for using xstack with Codex.  
这个文件收集了一组短小、可直接复制的 prompt 起手式，方便你把 xstack 用在 Codex 会话里。

The goal is not to replace the skill docs.  
目标不是替代 skill 文档。

The goal is to reduce the friction between “I know the workflow I want” and “I can start the session right now.”  
目标是缩短“我知道想走哪条 workflow”和“我现在就能开始这轮会话”之间的距离。

---

## Default repository change / 默认仓库改动

Use when:
- the task is already clear
- scope is small or medium
- no major auth or rollout risk is obvious

适用场景：
- 任务已经比较清楚
- 范围小到中等
- 暂时没有明显 auth 或 rollout 风险

```text
Use plan-engineering first.
Inspect the repo before proposing code changes.
Then implement the smallest sound change.
After implementation, run review-change and qa-release.
```

---

## Vague feature request / 模糊功能需求

Use when:
- the request is still fuzzy
- product scope is not yet stable
- acceptance criteria need clarification

适用场景：
- 需求还比较模糊
- 产品范围还不稳定
- 需要先澄清验收标准

```text
Use plan-product to clarify goals, scope, non-goals, assumptions, and acceptance criteria.
Then use plan-engineering to inspect the repo and propose the smallest sound implementation.
After implementation, run review-change and qa-release.
```

---

## Frontend feature / 前端功能

Use when:
- the change is user-facing
- state handling matters
- loading, error, empty, retry, or form behavior matters

适用场景：
- 改动面向用户
- 状态处理很重要
- loading、error、empty、retry 或表单行为重要

```text
Use plan-engineering first.
Then implement the smallest sound frontend change.
After implementation, run review-frontend-flow and qa-release.
Focus on loading, error, empty, submit, success, retry, and refresh behavior.
```

---

## Backend / API change / 后端或 API 改动

Use when:
- request/response shape matters
- callers may break
- auth or object-level access may matter

适用场景：
- 请求/响应结构重要
- 现有调用方可能受影响
- auth 或对象级访问控制可能重要

```text
Use plan-engineering first.
Implement the smallest sound backend change.
After implementation, run review-backend-api and qa-release.
If permissions or trust boundaries changed, also run security-review.
```

---

## Sensitive backend work / 敏感后端改动

Use when:
- auth, permissions, billing, tenant scope, or sensitive data are involved
- the change feels high-impact

适用场景：
- 涉及 auth、permissions、billing、tenant scope 或敏感数据
- 改动影响较大

```text
Use careful-mode first.
Then use plan-engineering before making changes.
Run security-review on the relevant flow.
After implementation, run review-backend-api and qa-release.
```

---

## Bug investigation / Bug 排查

Use when:
- the root cause is unclear
- symptoms are known but the fix is not

适用场景：
- 根因还不清楚
- 已知症状，但修复路径不明确

```text
Use investigate-bug first.
Narrow likely root causes before proposing a fix.
If a real code change is needed, switch into plan-engineering, then implement-feature, review-change, and qa-release.
```

---

## Freeze / stabilization / 冻结与稳定模式

Use when:
- production is unstable
- broad edits are dangerous
- you need containment first

适用场景：
- 生产环境不稳定
- 大范围改动风险高
- 需要先止血

```text
Use freeze-mode first.
Focus on stabilization and diagnosis, not broad implementation.
Use investigate-bug to narrow the cause.
Only return to normal execution after unfreeze-mode is justified.
```

---

## Full-stack contract-sensitive change / 全栈契约敏感改动

Use when:
- frontend and backend assumptions may drift together
- the UI depends on backend contract changes
- tRPC or shared-type flows are involved

适用场景：
- 前后端假设可能一起漂移
- UI 强依赖后端契约变更
- 涉及 tRPC 或共享类型流

```text
Use plan-engineering first.
Implement the smallest sound cross-layer change.
After implementation, run both review-frontend-flow and review-backend-api.
Then use qa-release before calling it ready.
```

---

## Release-oriented pass / 发布导向检查

Use when:
- implementation is already done
- you mainly want ship/no-ship judgment
- rollout confidence matters more than more coding

适用场景：
- 实现已经完成
- 当前主要想判断能不能发
- rollout 信心比继续写代码更重要

```text
Use qa-release on the current change.
Tell me what was validated, what was not validated, the remaining release risk, and whether this is actually safe to ship.
```

---

## Release notes / 发布说明

Use when:
- the implementation is done
- stakeholders or operators need a readable summary

适用场景：
- 实现已经完成
- 需要给 stakeholder 或 operator 一份可读摘要

```text
Use document-release.
Turn the current change into operator-facing release notes, a stakeholder summary, and any rollout-relevant cautions.
```

---

## How to use these starters / 怎么使用这些起手式

### 1. Start with the closest match
不要一开始自己发明一条新 prompt，先用最接近的起手式。

### 2. Add one explicit focus line if needed
For example:

```text
Focus especially on tenant isolation and object-level permissions.
```

### 3. Keep the first turn narrow
The first turn should define the mode, not solve everything at once.  
第一轮的目标是定义模式，不是一次性把所有事做完。

### 4. Escalate only when needed
If risk grows, add:
- `careful-mode`
- `security-review`
- `review-frontend-flow`
- `review-backend-api`

---

## Related files / 相关文件

- `../CODEX_WORKFLOWS.md`
- `recommend-usage.md`
- `frontend-feature.md`
- `backend-api-change.md`
- `README.md`

---

## Rule to remember / 最该记住的一条

A prompt starter should give Codex a clean first mode, not a giant all-in-one instruction blob.  
一个好的 prompt 起手式，应该给 Codex 一个清晰的第一模式，而不是一大团全包式指令。
