# Contributing to xstack / 参与 xstack 贡献

Thanks for wanting to improve xstack.  
感谢你愿意改进 xstack。

xstack is intentionally small, opinionated, and workflow-focused. Contributions are welcome, but the goal is not to turn it into a giant pile of prompts. Favor sharper skills, clearer outputs, and stronger judgment.  
xstack 被刻意设计成一个小而锋利、带有明确取向、强调工作流的项目。我们欢迎贡献，但目标不是把它变成一个巨大的 prompt 堆。请优先考虑更锋利的 skill、更清晰的输出和更强的判断力。

## What good contributions look like / 什么样的贡献是好的

Good contributions usually do one of the following:  
好的贡献通常会做到下面这些事中的一种：

- improve an existing skill's trigger or workflow  
  改进已有 skill 的触发条件或工作流
- tighten guardrails around risky work  
  为高风险任务增加更好的约束
- improve output structure or review quality  
  改善输出结构或审查质量
- add genuinely reusable references  
  添加真正可复用的 references
- add a new skill only when it has a clear, distinct job  
  只有在职责明确、边界清晰时才增加新 skill
- improve README clarity, examples, or positioning  
  提升 README 的清晰度、示例质量或项目定位表达

## What to avoid / 应避免什么

Please avoid contributions that:  
请尽量避免以下类型的贡献：

- duplicate another skill with a slightly different name  
  只是换个名字就重复另一个 skill 的能力
- add roleplay without improving execution quality  
  增加角色扮演元素，却不提升执行质量
- bloat `SKILL.md` with general advice Codex already knows  
  在 `SKILL.md` 里堆放 Codex 本来就知道的泛泛建议
- add large numbers of niche skills without real usage evidence  
  在没有真实使用场景支撑的情况下添加大量小众 skills
- turn references into verbose documentation dumps  
  把 references 写成臃肿的文档堆积

## Skill design guidelines / Skill 设计准则

When editing or adding a skill, prefer these rules:  
在编辑或新增 skill 时，请优先遵循这些规则：

1. Keep the skill single-purpose.  
   保持单一职责。
2. Write trigger descriptions that are specific and practical.  
   触发描述要具体、实用。
3. Prefer structured outputs over freeform essays.  
   优先使用结构化输出，而不是自由散文式输出。
4. Put detailed checklists in `references/`, not in `SKILL.md`.  
   详细清单放在 `references/`，不要把 `SKILL.md` 写得过胖。
5. Add guardrails when a task is easy to do recklessly.  
   对容易做得过猛或过乱的任务，增加 guardrails。
6. Make the skill useful in real repositories, not just toy examples.  
   让 skill 真正能在真实仓库里工作，而不只是玩具示例里可用。

## Suggested contribution process / 推荐贡献流程

1. Open an issue or describe the problem clearly.  
   先开 issue，或者把问题描述清楚。
2. Explain the real workflow gap you are trying to fix.  
   说明你想解决的真实工作流缺口是什么。
3. Propose the smallest change that improves the stack.  
   优先提出最小但有效的改动方案。
4. Keep naming consistent with the existing skill set.  
   保持命名风格和现有 skill 集一致。
5. Update the README if the public surface changes.  
   如果对外可见的能力发生变化，请同步更新 README。
6. If you change metadata, regenerate indexes and run doctor.  
   如果你修改了 metadata，请重新生成索引并运行 doctor。

## Metadata and validation / 元数据与校验

xstack now includes a lightweight metadata layer for skills and packs.  
xstack 现在包含一层轻量 metadata，用于描述 skills 和 packs。

Relevant files:

- `METADATA.md`
- `skills/*/skill.json`
- `packs/*.json`
- `SKILLS_INDEX.md`
- `PACKS_INDEX.md`

If you change metadata, run:

```bash
./scripts/build-index.sh
./scripts/doctor.sh
```

If you change recommendation behavior, also run:

```bash
./scripts/test-recommend.sh
```

Expected contributor behavior:

- keep metadata small and consistent with the markdown entry files
- do not duplicate full markdown content into JSON
- regenerate indexes after metadata changes
- keep doctor passing before opening a PR or shipping a change

---

## Naming conventions / 命名约定

- Use lowercase, hyphenated names for skills.  
  skill 名称使用小写和连字符。
- Prefer names that describe the job directly.  
  优先使用能直接描述职责的名字。
- Avoid cute names when a plain one is clearer.  
  如果直白名称更清晰，就不要为了“有趣”而命名。

## Philosophy / 核心理念

xstack should help Codex:  
xstack 应该帮助 Codex：

- plan before changing  
  在改动前先规划
- change with discipline  
  更有纪律地改动
- review with evidence  
  带着证据做审查
- validate before shipping  
  在发版前先验证
- communicate clearly after shipping  
  在发布后清晰地说明变化

If a contribution strengthens that loop, it is probably a good fit.  
如果一个贡献能强化这条闭环，那它大概率就是合适的。
