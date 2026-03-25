# xstack v0.3.x milestone / xstack v0.3.x 里程碑

## Working title / 工作标题

**xstack v0.3.x — easier to start, easier to choose, easier to use consistently**  
**xstack v0.3.x —— 更容易上手、更容易选对流程、也更容易稳定使用**

## Why v0.3.x exists / 为什么需要 v0.3.x

xstack v0.3.0 made the project clearly Node-first.  
xstack v0.3.0 已经把项目明确推进到了 Node-first 的方向。

The next step is not adding many more skills.  
下一步不应该是继续增加大量新 skill。

The next step is making xstack easier for real users and teams to adopt without confusion.  
下一步应该是让真实用户和团队更容易采用 xstack，并且不容易在上手阶段产生困惑。

v0.3.x should improve the first-use experience, workflow selection clarity, and consistency of day-to-day usage.  
v0.3.x 的重点应该是改善第一次使用体验、让 workflow 选择更清楚，并提升日常使用的一致性。

---

## Current friction points / 当前主要阻力

### 1. Onboarding is readable but still too manual
The repository explains itself well, but the shortest path to getting started is still more implicit than explicit.

仓库本身解释得已经不错，但“最短上手路径”仍然不够显式。

### 2. Skill selection still creates avoidable hesitation
A new user may still wonder:
- which skill should I start with?
- when should I add a web-focused or security review?
- what is the difference between a skill, a pack, and a reference?

一个新用户仍然很容易犹豫：
- 我到底该先用哪个 skill？
- 什么时候该加专项 review 或安全审查？
- skill、pack 和 reference 到底分别是什么？

### 3. Examples are useful, but not yet execution-oriented enough
The examples describe workflows well, but many users will still benefit from more explicit “copy this / expect this / avoid this” guidance.

examples 已经有帮助，但还不够像执行模板。很多用户仍然需要更明确的“照着用 / 期待输出 / 避免跑偏”指引。

### 4. The repository is still content-first rather than system-first
xstack now has a strong content layer, but it still lacks some structural affordances that would make indexing, recommendation, and consistency easier over time.

xstack 当前已经有不错的内容层，但在索引、推荐和长期一致性方面，仍然缺少一些更系统化的结构。

---

## Goals / 目标

v0.3.x should make xstack noticeably better at the following:

### 1. Easier to start
A new user should know where to begin within 30 seconds.

新用户应该能在 30 秒内知道从哪里开始。

### 2. Easier to choose the right path
A user should be able to map a task type or stack to a sensible first workflow without reading the whole repository.

用户应该能在不通读整个仓库的情况下，根据任务类型或技术栈快速选出合理的第一条 workflow。

### 3. Easier to use consistently
xstack should become easier to apply in a repeatable, team-friendly way rather than only as an individual reading experience.

xstack 应该更容易以可重复、团队友好的方式使用，而不只是作为个人阅读体验存在。

### 4. Stronger onboarding without bloating the stack
The stack should become easier to approach without losing its compact, opinionated nature.

在不破坏“小而锋利”的前提下，让整个栈更容易接近。

---

## Non-goals / 非目标

v0.3.x should not try to:

- support every ecosystem
- add many speculative skills without proven workflow value
- turn xstack into a giant documentation dump
- replace judgment with excessive ceremony

v0.3.x 不应该试图：

- 覆盖所有生态
- 在没有真实价值证明前增加大量猜想型 skill
- 把 xstack 变成巨大的文档堆
- 用繁琐仪式替代判断力

---

## Proposed deliverables / 建议交付物

### 1. Entry-point docs
Add:
- `START_HERE.md`
- `QUICKSTART.md`
- `ANTI_PATTERNS.md`

These files should make first contact with xstack more directed and less diffuse.

这些文件的作用，是让用户第一次接触 xstack 时更有方向感，而不是到处跳转。

### 2. README navigation improvements
Refine `README.md` so it more clearly:
- points new users to the right first files
- explains the relationship between skills, packs, and references
- shortens the “first-use path” into an obvious set of choices

优化 README，使它更清楚地：
- 把新用户引导到正确的入口文件
- 解释 skills、packs 和 references 的关系
- 把第一次使用路径压缩成更明显的选择题

### 3. Example structure tightening
Update examples so they increasingly include:
- scenario
- recommended flow
- copy-paste prompt
- expected output shape
- common failure modes
- follow-up guidance

让 examples 逐步具备以下统一结构：
- 场景
- 推荐流程
- 可直接复制的 prompt
- 期望输出结构
- 常见跑偏模式
- 后续纠偏建议

### 4. Workflow selection clarity
Add stronger guidance for:
- choosing by task type
- choosing by stack
- choosing by risk level

增强以下三类选择指引：
- 按任务类型选择
- 按技术栈选择
- 按风险等级选择

### 5. Foundation for future systemization
Prepare the repository for future metadata, indexing, or recommendation layers without requiring a full productization jump in v0.3.x.

为未来的元数据、索引或推荐层提前打基础，但不要求 v0.3.x 立刻完成完整产品化。

---

## Suggested release breakdown / 建议拆分方式

### v0.3.1 — onboarding and navigation
Focus:
- start-here docs
- quickstart path
- README entry-point improvements

### v0.3.2 — examples and anti-patterns
Focus:
- more execution-oriented examples
- anti-pattern guidance
- stronger first-workflow consistency

### v0.3.3 — metadata and quality foundations
Focus:
- optional machine-readable metadata direction
- stronger doctor checks
- better indexing and consistency support

---

## Success criteria / 成功标准

v0.3.x is successful if it becomes noticeably easier for a new or returning user to:

- identify the right starting file quickly
- choose a reasonable first workflow without reading everything
- understand how skills, packs, and references relate to each other
- apply xstack with less hesitation and less self-invented process drift
- use examples as execution aids rather than only conceptual illustrations

如果 v0.3.x 能明显让新用户或回归用户更容易做到以下几点，就算成功：

- 快速识别应该先读哪个文件
- 不必通读全部文档也能选出合理的第一条 workflow
- 理解 skills、packs 和 references 的关系
- 以更少犹豫和更少“自行发明流程漂移”的方式使用 xstack
- 把 examples 当作执行辅助，而不仅是概念展示

---

## Suggested public framing / 建议对外表述

### Short version / 短版
xstack v0.3.x makes the Node-first workflow stack easier to start, easier to navigate, and easier to use consistently.

xstack v0.3.x 让这套 Node-first workflow stack 更容易上手、更容易导航，也更容易稳定使用。

### Longer version / 长版
xstack v0.3.0 clarified what the project is.  
v0.3.0 让项目的定位更清楚了。

xstack v0.3.x should clarify how to begin, how to choose the right path, and how to use the stack well without adding unnecessary complexity.  
v0.3.x 则应该进一步把“怎么开始、怎么选对路径、怎么在不增加无谓复杂度的前提下用好这套栈”说清楚并落下来。
