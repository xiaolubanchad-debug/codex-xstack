# Backend API change example / 后端 API 改动示例

## Scenario / 场景

Change an API response to include new filtering and role-based visibility rules.  
修改一个 API 的返回结果，并增加新的筛选逻辑和基于角色的可见性规则。

## Recommended skill flow / 推荐 skill 流程

1. `plan-engineering`
2. `implement-feature`
3. `review-backend-api`
4. `security-review`
5. `qa-release`

## Example prompt / 示例提示词

```text
Use plan-engineering to inspect the current API shape and propose the safest implementation.
After implementation, use review-backend-api, security-review, and qa-release to evaluate compatibility, permissions, and ship readiness.
```

```text
用 plan-engineering 检查当前 API 结构，并提出最安全的实现方案。
实现完成后，用 review-backend-api、security-review 和 qa-release 去评估兼容性、权限风险和上线准备情况。
```

## What xstack should help catch / xstack 应该帮你抓到什么

- request/response contract drift / 请求与响应契约漂移
- breaking client assumptions / 破坏客户端已有假设
- object-level permission mistakes / 对象级权限错误
- tenant-scoping gaps / 租户隔离缺口
- unsafe migration or rollout assumptions / 不安全的迁移或发布顺序假设

## Good final result / 理想结果

You get an API change that is not only implemented, but reviewed like a production-facing backend contract.  
最终结果不只是“API 改好了”，而是它被当成一个面向生产环境的后端契约来认真审查过。
