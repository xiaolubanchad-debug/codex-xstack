# Frontend feature example / 前端功能示例

## Scenario / 场景

Add a new settings form for updating a user's profile preferences.  
新增一个设置页表单，用来更新用户的个人偏好。

## Recommended skill flow / 推荐 skill 流程

1. `plan-product`
2. `plan-engineering`
3. `implement-feature`
4. `review-frontend-flow`
5. `qa-release`
6. optional: `document-release` / 可选：`document-release`

## Example prompt / 示例提示词

```text
Use plan-product to turn this settings-page idea into scope and acceptance criteria.
Then use plan-engineering to inspect the repo and propose the implementation.
After implementation, use review-frontend-flow and qa-release before calling it ready.
```

```text
用 plan-product 把这个设置页想法整理成范围和验收标准。
然后用 plan-engineering 检查仓库并给出实现方案。
实现完成后，用 review-frontend-flow 和 qa-release 再判断是否真的完成。
```

## What xstack should help catch / xstack 应该帮你抓到什么

- missing loading, empty, or error states / loading、empty、error 状态缺失
- weak submit-state handling / 提交状态处理不完整
- stale UI after save / 保存后页面状态未及时更新
- inconsistent button, form, or spacing patterns / 按钮、表单或间距风格不一致
- frontend assumptions not supported by backend responses / 前端假设和后端返回不一致

## Good final result / 理想结果

You end up with a form that not only works, but also behaves like a real product flow.  
最终结果不只是“表单能提交”，而是它像一个真正的产品流程那样完整、顺手、可验收。
