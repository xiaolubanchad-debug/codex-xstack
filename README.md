# xstack

> A Codex-first, Node-first workflow stack for shipping software with more structure, less drift, and better judgment.  
> 一个面向 Codex、同时更聚焦 Node 技术栈的工作流栈，让软件交付更有结构、更少跑偏、更有判断力。

**xstack** is a collection of focused skills that turn Codex from “a model that can edit files” into a more disciplined software delivery partner.  
**xstack** 是一组聚焦型技能，让 Codex 从“能改文件的模型”变成一个更有纪律的软件交付搭档。

It is inspired by the useful part of gstack — role-based workflow switching — but redesigned for **Codex**, not transplanted from Claude Code.  
它借鉴了 gstack 里真正有价值的部分——基于角色/模式的工作流切换——但它是为 **Codex** 重新设计的，而不是从 Claude Code 直接移植过来的。

> New here? Start with [START_HERE.md](./START_HERE.md).  
> 第一次接触 xstack？先看 [START_HERE.md](./START_HERE.md)。
>
> Want the shortest path to trying it? Read [QUICKSTART.md](./QUICKSTART.md).  
> 想走最短上手路径？看 [QUICKSTART.md](./QUICKSTART.md)。
>
> Want the Codex-specific session patterns? Read [CODEX_WORKFLOWS.md](./CODEX_WORKFLOWS.md).  
> 想看更贴近 Codex 会话节奏的工作流？看 [CODEX_WORKFLOWS.md](./CODEX_WORKFLOWS.md)。
>
> Want to avoid common usage mistakes? Read [ANTI_PATTERNS.md](./ANTI_PATTERNS.md).  
> 想避免常见使用误区？看 [ANTI_PATTERNS.md](./ANTI_PATTERNS.md)。

Instead of one giant prompt and a lot of hope, xstack gives Codex a set of compact operating modes for planning, implementation, review, QA, investigation, security, design, and release communication.  
它不依赖“一个超长 prompt 再加上一点运气”，而是为 Codex 提供一套紧凑的工作模式，用于规划、实现、审查、QA、排障、安全、设计和发布说明。

---

## Why use xstack / 为什么用 xstack

xstack is for people who want Codex to behave more like a disciplined delivery partner and less like a fast but loosely guided editor.  
xstack 适合那些希望 Codex 更像一个有纪律的软件交付搭档，而不是一个虽然很快、但缺少约束的编辑器的人。

Use xstack when you want:

- clearer planning before code changes / 改代码前先把事情想清楚
- tighter implementation discipline / 让实现过程更克制、更有纪律
- more reliable review and QA passes / 让 review 和 QA 更可靠
- better handling of risky or ambiguous work / 更好地处理高风险或需求不清的任务
- a stack that feels native to Codex rather than adapted from another tool / 希望得到一套真正贴近 Codex 的工作流栈

If you want maximum improvisation and minimum process, xstack is probably a worse fit.  
如果你追求极致自由发挥、几乎不想要任何流程，那么 xstack 大概率不适合你。

---

## Choose your path / 选择你的起步路径

### New here / 第一次接触

1. Read [START_HERE.md](./START_HERE.md)
2. Read [QUICKSTART.md](./QUICKSTART.md)
3. Try the minimal workflow:
   - `plan-engineering`
   - `review-change`
   - `qa-release`

### Building a new feature / 做新功能

1. `plan-product`
2. `plan-engineering`
3. `implement-feature`
4. `review-change`
5. `qa-release`

### Fixing a bug / 修 bug

1. `investigate-bug`
2. `plan-engineering` if needed
3. `implement-feature`
4. `review-change`
5. `qa-release`

### Working on frontend / 做前端

Add:
- `review-frontend-flow`
- optional: `design-review`

### Working on backend or APIs / 做后端或 API

Add:
- `review-backend-api`
- optional: `security-review`

For execution-oriented starter flows, go to [examples/README.md](./examples/README.md).  
如果你想直接看更偏执行导向的起步流程，请看 [examples/README.md](./examples/README.md)。

If you want generated indexes of the current stack, see [SKILLS_INDEX.md](./SKILLS_INDEX.md) and [PACKS_INDEX.md](./PACKS_INDEX.md).  
如果你想看当前栈的自动生成索引，可以看 [SKILLS_INDEX.md](./SKILLS_INDEX.md) 和 [PACKS_INDEX.md](./PACKS_INDEX.md)。

---

## Why xstack exists / 为什么会有 xstack

Codex is strong at execution.  
Codex 在执行层面很强。

What it often needs is better structure around **when to plan**, **when to slow down**, **how to review**, **what to validate**, and **how to separate “done coding” from “ready to ship.”**  
但它经常缺的是更好的结构：**什么时候该先规划**、**什么时候该放慢节奏**、**如何做 review**、**该验证什么**，以及**如何区分“代码写完了”和“可以发版了”**。

That is the job of xstack.  
xstack 的工作，就是补上这层结构。

The core problem xstack tries to solve is not capability, but judgment and timing.  
xstack 试图解决的核心问题，不是“能不能做”，而是“什么时候该先想、什么时候该收敛、什么时候才算真的 ready”。

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

### Three layers, three jobs / 三层结构，三种职责

xstack works best when these three layers stay clear:  
xstack 在这三层职责清晰时效果最好：

- **Skills** = workflow modes / 工作模式
- **Packs** = stack-specific or domain-specific lenses / 技术栈或领域专项视角
- **References** = deeper checklists and templates loaded only when useful / 按需加载的更细清单与模板

In short: skills decide **how Codex should work**, packs sharpen **what it should pay attention to**, and references provide **deeper guidance when the task actually needs it**.  
简单说：skills 决定 **Codex 现在该怎么工作**，packs 强化 **它此刻该重点看什么**，references 则在任务确实需要时提供 **更深入的细节指导**。

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

## v0.3 scope / v0.3 版本范围

xstack v0.3 is the release where the project becomes clearly **Node-first**.  
xstack v0.3 是 xstack 明确转向 **Node-first** 的版本。

It keeps the core delivery loop:  
它保留了核心交付闭环：

**plan → implement → review → validate → communicate**  
**规划 → 实现 → 审查 → 验证 → 沟通**

and builds a stronger Node/TypeScript delivery layer on top:  
并在此基础上建立了更强的 Node/TypeScript 交付增强层：

- web delivery packs for frontend, backend, and release work / 面向前端、后端和发版工作的 Web 交付 packs
- stack-specific support for Next.js, Prisma, NestJS, tRPC, and Express / 面向 Next.js、Prisma、NestJS、tRPC 和 Express 的技术栈专项支持
- stronger onboarding through install, doctor, quick start, and examples / 通过 install、doctor、quick start 和 examples 提供更强的上手体验
- clearer release planning and release-ready documentation / 更清晰的版本规划与发布文档体系

v0.3 is where xstack stops feeling like a generic workflow baseline and starts feeling like a practical **Node-first workflow stack for Codex**.  
v0.3 是 xstack 从“通用 workflow 基线”真正转向“面向 Codex 的实用 Node-first 工作流栈”的版本。

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

## Metadata and generated indexes / 元数据与自动生成索引

xstack now includes a lightweight metadata layer for skills and packs.  
xstack 现在包含一层轻量元数据，用于描述 skills 和 packs。

See:

- [METADATA.md](./METADATA.md)
- [SKILLS_INDEX.md](./SKILLS_INDEX.md)
- [PACKS_INDEX.md](./PACKS_INDEX.md)

If you change metadata, run:

```bash
./scripts/build-index.sh
./scripts/doctor.sh
```

Or through the unified entrypoint:

```bash
./scripts/xstack.sh build-index
./scripts/xstack.sh doctor
./scripts/xstack.sh release-check
```

If you want a heuristic starting recommendation based on a task or stack query, try:

```bash
./scripts/recommend.sh "nextjs prisma feature"
./scripts/recommend.sh --task feature --stack "nextjs prisma"
./scripts/recommend.sh --task backend --stack "nestjs prisma" --risk sensitive --json
```

Recommendation rules now live in:

- `config/recommend-rules.json`
- `config/recommend-rules.schema.json`

If you change recommendation behavior, run:

```bash
./scripts/test-recommend.sh
```

Or through the unified entrypoint:

```bash
./scripts/xstack.sh recommend --task feature --stack "nextjs prisma"
./scripts/xstack.sh test-recommend
./scripts/xstack.sh release-check
```

如果你修改了 metadata，请运行上面的命令来重新生成索引并做一致性校验。你也可以用 `recommend.sh` 根据自由文本或结构化参数得到一个启发式起步建议；推荐规则现在集中在 `config/recommend-rules.json`；如果改了推荐逻辑，请再跑 `test-recommend.sh`。

---

## Quick Start / 快速开始

If you only want the shortest path to trying xstack, do this:  
如果你只想用最短路径试一下 xstack，可以这样做：

1. clone the repo / 克隆仓库
2. run `./scripts/install.sh <target-dir>` / 运行 `./scripts/install.sh <target-dir>`
3. start with these skills:  
   从这几个 skill 开始：
   - `plan-engineering`
   - `review-change`
   - `qa-release`
4. if you are doing frontend work, add `review-frontend-flow`  
   如果你做的是前端任务，再加上 `review-frontend-flow`
5. if you are doing backend/API work, add `review-backend-api`  
   如果你做的是后端/API 任务，再加上 `review-backend-api`

For the more guided first-use path, see [QUICKSTART.md](./QUICKSTART.md).  
如果你想看更清晰、更像上手流程的版本，请看 [QUICKSTART.md](./QUICKSTART.md)。

### First 10 minutes / 前 10 分钟上手

Try this exact prompt with Codex:  
你可以直接把下面这段提示词丢给 Codex：

```text
Use plan-engineering to inspect the repo and propose the smallest sound implementation plan.
After implementation, use review-change and qa-release before calling the task done.
```

```text
用 plan-engineering 检查仓库，并提出最小但靠谱的实现方案。
实现完成后，用 review-change 和 qa-release 再判断任务是否真的完成。
```

That single flow is enough to feel what xstack is trying to improve.  
光这一条流程，通常就足以让你感受到 xstack 想改善的是什么。

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
git clone https://github.com/xiaolubanchad-debug/codex-xstack.git
cd codex-xstack
```

### Use the install script / 使用安装脚本

```bash
./scripts/install.sh <target-dir>
```

Or via the unified entrypoint:

```bash
./scripts/xstack.sh install <target-dir>
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

### Real examples / 真实示例

See the `examples/` directory for concrete starter flows:  
你可以在 `examples/` 目录里看到更具体的起步示例：

- `examples/frontend-feature.md`
- `examples/backend-api-change.md`
- `examples/fullstack-flow.md`
- `examples/recommend-usage.md`
- `examples/README.md` for the planned Node-first examples  
  以及 `examples/README.md`，查看后续 Node-first 示例计划

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

The current milestone is **v0.3**, focused on making xstack a clearer Node-first workflow stack with:  
当前阶段重点是 **v0.3**，核心目标是让 xstack 更明确地成为一个 Node-first 工作流栈，主要包括：

- stack-specific support via `nextjs-app-pack`, `prisma-pack`, `nestjs-backend-pack`, `trpc-pack`, and `express-api-pack`  
  通过 `nextjs-app-pack`、`prisma-pack`、`nestjs-backend-pack`、`trpc-pack` 和 `express-api-pack` 提供技术栈专项支持
- stronger onboarding through install, doctor, quick start, and examples  
  通过 install、doctor、quick start 和 examples 强化上手体验
- real Node-first examples for frontend, full-stack, and backend flows  
  提供覆盖前端、全栈和后端流程的真实 Node-first 示例
- better release planning and release-ready documentation  
  更好的版本规划和可发布文档体系
- selective future expansion only where it improves real workflow quality  
  只有在能真实提升工作流质量时，才继续扩展更多能力

See [ROADMAP.md](./ROADMAP.md) for the fuller v0.2/v0.3 direction.  
更完整的 v0.2 / v0.3 路线，请查看 [ROADMAP.md](./ROADMAP.md)。

For the v0.3.0 milestone framing, see [MILESTONE_v0.3.0.md](./MILESTONE_v0.3.0.md).  
关于 v0.3.0 里程碑的整理文案，请查看 [MILESTONE_v0.3.0.md](./MILESTONE_v0.3.0.md)。

For the follow-up adoption and onboarding milestone, see [MILESTONE_v0.3.x.md](./MILESTONE_v0.3.x.md).  
如果你想看面向上手体验与采用效率的后续里程碑，请查看 [MILESTONE_v0.3.x.md](./MILESTONE_v0.3.x.md)。

For a release-oriented execution checklist, see [RELEASE_PLAN_v0.3.0.md](./RELEASE_PLAN_v0.3.0.md).  
如果你想看更接近发布执行层的清单，请查看 [RELEASE_PLAN_v0.3.0.md](./RELEASE_PLAN_v0.3.0.md)。

For a GitHub-ready bilingual release draft, see [GITHUB_RELEASE_v0.3.0.md](./GITHUB_RELEASE_v0.3.0.md).  
如果你想直接使用适合 GitHub Release 的中英双语文案，请查看 [GITHUB_RELEASE_v0.3.0.md](./GITHUB_RELEASE_v0.3.0.md)。

---

## Positioning in one sentence / 一句话定位

**xstack is a compact operating layer that helps Codex plan better, change less recklessly, review more seriously, and ship with clearer evidence.**  
**xstack 是一层紧凑的操作层，帮助 Codex 更好地规划、更克制地改动、更认真地审查，并带着更清晰的证据去发布。**

---

## Contributing / 参与贡献

See [CONTRIBUTING.md](./CONTRIBUTING.md) for contribution guidelines.  
贡献方式与约定请见 [CONTRIBUTING.md](./CONTRIBUTING.md)。

If you change metadata or generated indexes, make sure to run:

```bash
./scripts/build-index.sh
./scripts/doctor.sh
```

如果你修改了 metadata 或自动生成索引，请记得运行上面的命令。

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
