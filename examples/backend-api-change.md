# Backend API change example / 后端 API 改动示例

## Scenario / 场景

Change an API response to include new filtering and role-based visibility rules.  
修改一个 API 的返回结果，并增加新的筛选逻辑和基于角色的可见性规则。

This is a representative example of a backend change that may look small in code while still carrying compatibility, authorization, and rollout risk.  
这是一个很典型的后端改动场景：代码层面看起来可能不大，但兼容性、权限和发布风险并不小。

---

## Recommended skill flow / 推荐 skill 流程

1. `plan-engineering`
2. `implement-feature`
3. `review-backend-api`
4. `security-review`
5. `qa-release`

Use this flow when the change affects contracts, filters, permissions, tenant scope, or caller expectations.  
当改动会影响接口契约、筛选逻辑、权限、租户范围或调用方假设时，适合使用这条流程。

---

## Copy-paste prompt / 可直接复制的 prompt

```text
Use plan-engineering to inspect the current API shape and propose the safest small implementation.
After implementation, run review-backend-api, security-review, and qa-release.
Focus on compatibility, permission enforcement, tenant scope, error behavior, and rollout safety.
```

```text
用 plan-engineering 检查当前 API 结构，并提出最安全、最小的实现方案。
实现完成后，执行 review-backend-api、security-review 和 qa-release。
重点关注兼容性、权限强制、租户范围、错误行为和发布安全性。
```

---

## Expected output shape / 期望输出结构

A good run should roughly produce:  
一次好的执行，应该大致产出这些结构：

### 1. Engineering plan / 工程计划
- current contract summary
- affected handlers / procedures / services
- compatibility risks
- authorization and visibility assumptions
- rollout or migration concerns
- validation plan

### 2. Backend review / 后端审查
- summary
- must-fix
- should-fix
- contract risks
- test gaps
- release risk

### 3. Security review / 安全审查
- trust boundary summary
- auth / role / tenant checks
- exposure risks
- abuse paths
- missing server-side enforcement

### 4. Release judgment / 发版判断
- what was validated
- what was not validated
- rollout blockers
- ship / no-ship recommendation

If the output only says “types still compile” or “tests passed” without discussing compatibility and access rules, it is too weak.  
如果输出只说“类型还能编译”或“测试通过了”，却没有讨论兼容性和访问规则，通常说明判断还不够扎实。

---

## What xstack should help catch / xstack 应该帮你抓到什么

- request/response contract drift / 请求与响应契约漂移
- breaking client assumptions / 破坏客户端已有假设
- object-level permission mistakes / 对象级权限错误
- tenant-scoping gaps / 租户隔离缺口
- unsafe migration or rollout assumptions / 不安全的迁移或发布顺序假设
- filter semantics that look obvious in code but are ambiguous to callers / 代码里看起来理所当然、但对调用方语义不清的筛选逻辑
- user-visible data changes that are enforced inconsistently across layers / 用户可见数据规则在各层执行不一致

---

## Common failure modes / 常见跑偏模式

### 1. The change is reviewed as implementation detail, not as contract change
把改动当成内部实现细节审，而不是当成外部契约变更来审。

### 2. New filtering logic is added without clarifying semantics
加了筛选逻辑，但没有把筛选语义说清楚。

### 3. Role-based visibility is implied by UI or caller convention rather than enforced server-side
基于角色的可见性只在 UI 或调用习惯中体现，没有服务端强制。

### 4. Existing clients are assumed to adapt automatically
默认现有客户端会自己适配，没有明确兼容性判断。

### 5. Rollout risk is ignored because the diff looks small
因为 diff 看起来不大，就忽略了上线风险和数据暴露风险。

---

## Human correction prompts / 人类纠偏 prompt

Use these when the first run is too shallow or too implementation-centric.  
如果第一轮输出太浅，或太偏实现细节，可以用下面这些 prompt 纠偏。

### If compatibility analysis is weak
```text
Redo this as a contract review, not just an implementation review.
Explicitly call out which existing clients or assumptions could break.
```

### If auth or tenant scope is underexplored
```text
Redo this with stronger attention to object-level authorization, tenant isolation, and server-side enforcement.
Do not assume caller behavior is trustworthy.
```

### If rollout thinking is missing
```text
Add rollout and release-risk analysis.
Call out migration order, fallback assumptions, and what could go wrong after deploy.
```

### If the review is too soft
```text
Separate must-fix from should-fix more aggressively.
Focus on realistic failure modes, not style commentary.
```

---

## Good final result / 理想结果

You get an API change that is not only implemented, but reviewed like a production-facing backend contract.  
最终结果不只是“API 改好了”，而是它被当成一个面向生产环境的后端契约来认真审查过。

A good final result means:
- callers can rely on the new behavior
- permission rules are enforced server-side
- compatibility risks are explicit
- rollout risk is understood
- QA and release judgment are based on evidence rather than optimism

一个理想结果意味着：
- 调用方可以可靠依赖新行为
- 权限规则在服务端被强制执行
- 兼容性风险被明确说清楚
- 发布风险被理解和评估
- QA 和发版判断基于证据，而不是乐观假设
