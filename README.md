# xstack

> A Codex-first workflow stack for shipping software with more structure, less drift, and better judgment.  
> 一个面向 Codex 的工作流栈，让软件交付更有结构、更少跑偏、更有判断力。

**xstack** is a collection of focused skills that turn Codex from “a model that can edit files” into a more disciplined software delivery partner.  
**xstack** 是一组聚焦型技能，让 Codex 从“能改文件的模型”变成一个更有纪律的软件交付搭档。

It is inspired by the useful part of gstack — role-based workflow switching — but redesigned for **Codex**, not transplanted from Claude Code.  
它借鉴了 gstack 里真正有价值的部分——基于角色/模式的工作流切换——但它是为 **Codex** 重新设计的，而不是从 Claude Code 直接移植过来的。

Instead of one giant prompt and a lot of hope, xstack gives Codex a set of compact operating modes for planning, implementation, review, QA, investigation, security, design, and release communication.  
它不依赖“一个超长 prompt 再加上一点运气”，而是为 Codex 提供一套紧凑的工作模式，用于规划、实现、审查、QA、排障、安全、设计和发布说明。

---

## Why xstack exists / 为什么会有 xstack

Codex is strong at execution.  
Codex 在执行层面很强。

What it often needs is better structure around **when to plan**, **when to slow down**, **how to review**, **what to validate**, and **how to separate “done coding” from “ready to ship.”**  
但它经常缺的是更好的结构：**什么时候该先规划**、**什么时候该放慢节奏**、**如何做 review**、**该验证什么**，以及**如何区分“代码写完了”和“可以发版了”**。

That is the job of xstack.  
xstack 的工作，就是补上这层结构。

xstack is for people who want:  
xstack 适合这样的人：

- clearer planning before code changes  
  在改代码前先把事情想清楚
- tighter implementation discipline  
  让实现过程更克制、更有纪律
- more reliable review and QA passes  
  让 review 和 QA 更可靠
- better handling of risky or ambiguous changes  
  更好地处理高风险或需求不清的改动
- a stack that feels native to Codex rather than adapted from another tool  
  希望得到一套真正贴近 Codex，而不是从别的工具生搬硬套来的工作流栈

---

## What makes xstack different / xstack 有什么不同

### Codex-first / 以 Codex 为中心

xstack is built around the way Codex tends to work well:  
xstack 是围绕 Codex 最擅长的工作方式构建的：

- inspect the repo / 查看仓库
- make focused changes / 做聚焦的修改
- run validation / 跑验证
- summarize results / 总结结果

It avoids theatrical roleplay and focuses on **mode switching** instead.  
它避免戏剧化的角色扮演，而是把重点放在**工作模式切换**上。

### Smaller, sharper skills / 更少但更锋利的技能

Instead of dozens of overlapping personas, xstack uses a compact set of skills with clear boundaries.  
它不追求几十个边界模糊的人设，而是使用一组边界清晰、职责明确的技能。

Each skill is designed to answer one question well:  
每个 skill 都是为了解决一个明确的问题：

- What exactly are we building? / 我们到底在做什么？
- How should we implement it? / 这个东西应该怎么实现？
- Did we change the right thing? / 我们改对地方了吗？
- Is this safe to ship? / 这次改动适合上线吗？
- What actually caused the bug? / 这个 bug 真正的原因是什么？

### Stable outputs / 更稳定的输出结构

xstack favors structured outputs over vague essays.  
xstack 更偏好结构化输出，而不是空泛的大段文字。

Skills are written to consistently produce things like:  
这些技能会更稳定地产出如下内容：

- goals and acceptance criteria / 目标与验收标准
- implementation plans / 实现计划
- must-fix vs should-fix review findings / 必须修复与建议修复的审查结论
- QA checklists and ship recommendations / QA 清单和发版建议
- release notes and operator summaries / 发布说明和运维摘要

### Guardrails over hype / 约束优先于噱头

xstack tries to make Codex more trustworthy, not more dramatic.  
xstack 的目标是让 Codex 更值得信任，而不是显得更夸张。

That means:  
这意味着：

- stop when requirements are unclear  
  需求不清时先停下来
- avoid silent scope creep  
  避免悄悄扩大范围
- slow down around risky changes  
  面对高风险改动时主动放慢节奏
- treat missing validation as real risk  
  把“未验证”当成真实风险，而不是小注脚

---

## v0.2 scope / v0.2 版本范围

xstack v0.2 is the first release where the stack starts feeling intentionally **web-focused**.  
xstack v0.2 是第一个明显开始朝 **Web 开发**方向收拢的版本。

It keeps the core delivery loop:  
它保留了核心交付闭环：

**plan → implement → review → validate → communicate**  
**规划 → 实现 → 审查 → 验证 → 沟通**

and adds a stronger website-development layer on top:  
并在此基础上增加了更强的网站开发增强层：

- frontend state coverage / 前端状态覆盖
- form-flow quality / 表单流程质量
- component consistency / 组件一致性
- backend API contract discipline / 后端 API 契约约束
- auth and permission review / 认证与权限审查
- migration safety / 迁移安全性
- full-stack contract alignment / 前后端契约对齐
- release-risk and incident-response support / 发版风险与事故响应支持

v0.2 is still compact, but it is no longer just a generic workflow baseline. It is now a more credible **Codex-first full-stack web delivery stack**.  
v0.2 仍然保持紧凑，但它已经不再只是一个通用工作流基础版，而开始成为一个更可信的 **Codex-first 全栈 Web 交付栈**。

---

## Skill catalog / 技能目录

### Core delivery flow / 核心交付流程

#### `plan-product`
Turn a vague request into goals, scope, non-goals, assumptions, and acceptance criteria.  
把模糊需求整理成目标、范围、非目标、假设和验收标准。

#### `plan-engineering`
Inspect the codebase and produce an implementation plan before editing files.  
在改文件前先检查代码库，并产出实现计划。

#### `implement-feature`
Make tightly scoped changes, follow local patterns, and validate the result.  
做范围受控的改动，遵循仓库现有模式，并验证结果。

#### `review-change`
Review a diff like a careful engineer: correctness first, then regressions, risk, and missing validation.  
像一个谨慎的工程师一样审查 diff：先看正确性，再看回归风险和验证缺失。

#### `qa-release`
Decide whether a change is actually ready to ship.  
判断一项改动是否真的可以上线。

### Extended delivery modes / 扩展交付模式

#### `investigate-bug`
Diagnose incidents, regressions, and weird behavior before proposing a fix.  
先诊断事故、回归和异常行为，再提出修复方案。

#### `security-review`
Review auth, trust boundaries, data exposure, and realistic abuse paths.  
审查认证、信任边界、数据暴露以及真实可利用的滥用路径。

#### `design-review`
Evaluate UX quality, interaction clarity, and “AI slop” signals in user-facing work.  
评估用户体验质量、交互清晰度以及界面中的“AI 拼凑感”。

#### `benchmark-change`
Assess whether performance claims are backed by credible measurement.  
判断性能改进是否有可信的度量作为支撑。

#### `document-release`
Turn technical changes into clear release notes, operator updates, and stakeholder summaries.  
把技术改动整理成清晰的发布说明、运维更新和对外摘要。

### Web-focused reviews / Web 专项审查

#### `review-frontend-flow`
Review a user-facing flow for state completeness, form behavior, UX quality, and frontend/backend alignment.  
审查一个面向用户的流程，重点看状态完整性、表单行为、体验质量以及前后端对齐情况。

#### `review-backend-api`
Review an API or backend-facing change for contract quality, compatibility, authorization, data safety, and release risk.  
审查 API 或后端改动，重点关注契约质量、兼容性、权限、数据安全和发版风险。

### Control modes / 控制模式

#### `careful-mode`
Tighten discipline for ambiguous, risky, or high-impact work.  
在需求模糊、高风险或高影响任务下收紧执行纪律。

#### `freeze-mode`
Pause broad edits and focus on stabilization, containment, or diagnosis.  
暂停大范围修改，把重点放在稳定、止损和诊断上。

#### `unfreeze-mode`
Return to normal execution after a freeze-style task.  
在冻结式任务结束后恢复正常执行模式。

---

## Recommended workflows / 推荐工作流

### Feature workflow / 功能开发流程

1. `plan-product`
2. `plan-engineering`
3. `implement-feature`
4. `review-change`
5. `qa-release`
6. `document-release` if the change will be shipped or announced  
   如果改动要上线或需要发布说明，再执行 `document-release`

### Bug workflow / 缺陷修复流程

1. `investigate-bug`
2. `plan-engineering` if the fix is non-trivial  
   如果修复不简单，先做 `plan-engineering`
3. `implement-feature`
4. `review-change`
5. `qa-release`

### Sensitive change workflow / 敏感改动流程

1. `careful-mode`
2. `plan-engineering`
3. `security-review` if auth, data, billing, permissions, or trust boundaries are involved  
   如果涉及认证、数据、计费、权限或信任边界，增加 `security-review`
4. `implement-feature`
5. `review-change`
6. `qa-release`

---

## Quick examples / 快速示例

Use xstack skills as explicit work modes.  
把 xstack 的 skills 当作明确的工作模式来使用。

```text
Use plan-product to turn this feature idea into scope and acceptance criteria.
用 plan-product 把这个功能想法整理成范围和验收标准。

Use plan-engineering and inspect the repo before proposing implementation steps.
用 plan-engineering，并在给出实现方案前先检查仓库。

Use implement-feature and keep the change tightly scoped.
用 implement-feature，并把改动范围控制紧一点。

Use review-change on the current diff and separate must-fix from should-fix.
对当前 diff 使用 review-change，并区分必须修复和建议修复。

Use qa-release and tell me whether this is safe to ship.
用 qa-release 判断这次改动是否适合上线。

Use investigate-bug and narrow likely root causes before suggesting a patch.
用 investigate-bug，先缩小可能的根因范围，再建议修复。

Use security-review on this auth change.
对这个认证改动做 security-review。

Use document-release to write operator-facing release notes.
用 document-release 写一版面向运维/操作方的发布说明。
```

---

## Repository layout / 仓库结构

```text
skills/
  plan-product/
  plan-engineering/
  implement-feature/
  review-change/
  qa-release/
  investigate-bug/
  security-review/
  design-review/
  benchmark-change/
  document-release/
  review-frontend-flow/
  review-backend-api/
  careful-mode/
  freeze-mode/
  unfreeze-mode/
```

Each skill contains:  
每个 skill 一般包含：

- `SKILL.md` — trigger description and workflow  
  `SKILL.md` —— 触发描述和工作流程
- `references/` — checklists, templates, and patterns loaded only when needed  
  `references/` —— 按需加载的清单、模板和模式说明

This keeps the main skill files compact while still allowing deeper guidance where it matters.  
这样既能让主技能文件保持紧凑，也能在必要时提供更深入的指导。

---

## Installation / 安装

xstack is currently a **repository-based skill stack**, not a packaged CLI.  
xstack 目前还是一个**基于仓库组织的技能栈**，还不是一个打包好的 CLI 产品。

The safest installation method today is to clone the repository and either:  
当前最稳妥的安装方式，是先克隆仓库，然后选择以下两种方式之一：

1. keep it where your Codex workflow can read it directly, or  
   保留在你的 Codex 工作流可以直接读取的位置；或者
2. install `skills/` and `packs/` into a target directory with the helper script.  
   使用安装脚本，把 `skills/` 和 `packs/` 安装到目标目录。

### Clone the repository / 克隆仓库

```bash
git clone https://github.com/xiaolubanchad-debug/codex-agent.git
cd codex-agent
```

### Use the install script / 使用安装脚本

```bash
./scripts/install.sh <target-dir>
```

Example / 示例：

```bash
./scripts/install.sh ~/my-codex/xstack
```

What this does / 这个脚本会做什么：

- copy `skills/` into the target directory  
  把 `skills/` 复制到目标目录
- copy `packs/` into the target directory  
  把 `packs/` 复制到目标目录
- preserve the relative paths required by the `SKILL.md` references  
  保留 `SKILL.md` 里依赖的相对路径关系

What it does **not** do / 它**不会**做的事情：

- guess your Codex runtime's skill directory automatically  
  不会自动猜测你本地 Codex 的技能目录
- modify your editor or Codex runtime configuration for you  
  不会自动修改你的编辑器或 Codex 运行时配置

So after installation, point your Codex setup at the directory you installed xstack into.  
所以安装完成后，你还需要把自己的 Codex 配置指向这个目录。

---

## Usage / 使用方式

Use xstack as a set of explicit work modes for Codex.  
把 xstack 当成一组明确的 Codex 工作模式来使用。

### Minimal feature workflow / 最小功能开发流程

1. `plan-product`
2. `plan-engineering`
3. `implement-feature`
4. `review-change`
5. `qa-release`

### For frontend work / 做前端时

Add:  
额外加入：

- `review-frontend-flow`
- `design-review`

### For backend/API work / 做后端或 API 时

Add:  
额外加入：

- `review-backend-api`
- `security-review`

### Example prompts / 示例提示词

```text
Use plan-product to turn this feature idea into scope and acceptance criteria.
用 plan-product 把这个功能想法整理成范围和验收标准。

Use plan-engineering and inspect the repo before proposing implementation steps.
用 plan-engineering，在给出实现步骤前先检查仓库。

Use implement-feature and keep the change tightly scoped.
用 implement-feature，并把改动范围控制紧。

Use review-frontend-flow on this page change.
对这个页面改动使用 review-frontend-flow。

Use review-backend-api on this API diff.
对这个 API diff 使用 review-backend-api。

Use qa-release and tell me whether this is safe to ship.
用 qa-release 判断这次改动是否适合上线。
```

---

## Design principles / 设计原则

xstack follows a few rules consistently:  
xstack 始终遵循一些稳定的原则：

- **Single-purpose skills** beat giant all-in-one prompts.  
  **单一职责的 skills** 优于一个全包式巨型 prompt。
- **Role switching** is useful; roleplay is optional.  
  **工作模式切换** 很有用，但角色扮演不是重点。
- **Repository reality** matters more than abstract architecture language.  
  **仓库里的真实代码结构** 比抽象架构术语更重要。
- **Review quality** comes from concrete failure modes, not vague discomfort.  
  **高质量 review** 来自具体失败模式，而不是模糊的不安感。
- **Validation** is part of delivery, not an afterthought.  
  **验证** 是交付过程的一部分，不是收尾时才想到的步骤。
- **Shipping** and **coding** are not the same milestone.  
  **代码写完** 和 **可以发布** 不是同一个里程碑。

---

## Who this is for / 适合谁

xstack is a good fit if you:  
如果你符合下面这些情况，xstack 会比较适合你：

- use Codex as a serious coding agent  
  把 Codex 当成真正的编码代理在使用
- build alone or in a small team  
  独立开发，或者处在小团队中
- want more consistent planning and review  
  希望规划和审查过程更一致
- are tired of rewriting the same “be careful / think first / review this properly” prompts  
  不想一遍遍重写“谨慎一点 / 先想清楚 / 好好 review”这类 prompt

xstack is probably a worse fit if you want maximum improvisation and minimum process.  
如果你追求极致自由发挥、几乎不想要任何流程，那么 xstack 可能就不太适合你。

---

## Near-term roadmap / 近期路线图

The next milestone is **v0.2**, focused on improving website frontend/backend development efficiency with:  
下一个阶段重点是 **v0.2**，核心目标是提升网站前端/后端开发效率，主要包括：

- `frontend-state-flow-pack`
- `backend-api-pack`
- `db-migration-pack`
- `fullstack-contract-pack`
- `form-flow-pack`
- `auth-permission-pack`
- `release-risk-pack`
- `incident-response-pack`
- `component-consistency-pack`
- later web-focused reviews on top of those  
  后续还会在此基础上继续补充 Web 专项审查能力

See [ROADMAP.md](./ROADMAP.md) for the fuller v0.2 plan.  
更完整的 v0.2 路线，请查看 [ROADMAP.md](./ROADMAP.md)。

---

## Positioning in one sentence / 一句话定位

**xstack is a compact operating layer that helps Codex plan better, change less recklessly, review more seriously, and ship with clearer evidence.**  
**xstack 是一层紧凑的操作层，帮助 Codex 更好地规划、更克制地改动、更认真地审查，并带着更清晰的证据去发布。**

---

## Contributing / 参与贡献

See [CONTRIBUTING.md](./CONTRIBUTING.md) for contribution guidelines.  
贡献方式与约定请见 [CONTRIBUTING.md](./CONTRIBUTING.md)。

## Release notes / 发布说明

See [RELEASE_NOTES.md](./RELEASE_NOTES.md) for the current public baseline notes.  
当前版本的发布说明请见 [RELEASE_NOTES.md](./RELEASE_NOTES.md)。

## License / 许可证

MIT — see [LICENSE](./LICENSE).  
MIT 许可证，详见 [LICENSE](./LICENSE)。

## Name / 名称

The product name is **xstack**.  
该项目/产品名称为 **xstack**。

Use that name for the repository, branding, future package names, and release line.  
请将这个名字用于仓库、品牌、后续包名和版本线命名。
