# Full-stack flow example / 全栈流程示例

## Scenario / 场景

Add a feature where users can create a project from the UI, with backend validation, persistence, and permission checks.  
新增一个“用户从前端创建项目”的功能，涉及后端校验、数据持久化和权限检查。

## Recommended skill flow / 推荐 skill 流程

1. `plan-product`
2. `plan-engineering`
3. `implement-feature`
4. `review-frontend-flow`
5. `review-backend-api`
6. `qa-release`
7. optional: `document-release` / 可选：`document-release`

## Example prompt / 示例提示词

```text
Use plan-product first, then use plan-engineering to design the full-stack implementation.
After implementation, run both review-frontend-flow and review-backend-api, then use qa-release before calling this feature ready.
```

```text
先用 plan-product，再用 plan-engineering 设计这个全栈功能的实现方案。
实现完成后，同时执行 review-frontend-flow 和 review-backend-api，最后用 qa-release 再判断这个功能是否真的可交付。
```

## What xstack should help catch / xstack 应该帮你抓到什么

- frontend/backend field mismatches / 前后端字段不一致
- incomplete mutation-state handling / 提交流程状态处理不完整
- permission mismatch between UI and backend / UI 和后端权限判断不一致
- API success shape that does not support the UI / API 成功返回结构无法支撑前端展示
- release risk hidden across layers / 跨层级隐藏的上线风险

## Good final result / 理想结果

You get a feature that holds together across planning, UI behavior, API contract, permissions, and release judgment.  
最终结果是：这个功能在规划、界面行为、API 契约、权限设计和上线判断几个层面都能站得住。
