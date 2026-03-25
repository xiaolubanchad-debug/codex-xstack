# xstack metadata / xstack 元数据规范

This document defines the lightweight machine-readable metadata layer for xstack.  
这个文档定义了 xstack 的轻量机器可读元数据层。

The goal is not to replace `SKILL.md` or pack markdown files.  
目标不是替代 `SKILL.md` 或 pack 的 markdown 文件。

The goal is to make indexing, doctor checks, recommendation, and future tooling easier without making the repository heavy.  
目标是在不让仓库变重的前提下，让索引、doctor 校验、推荐和未来工具化更容易。

---

## Design principles / 设计原则

- Keep metadata small and stable.  
  元数据保持小而稳定。
- Let markdown remain the primary human-facing source.  
  让 markdown 继续作为主要的人类阅读载体。
- Use JSON for easy validation and scripting.  
  使用 JSON，便于脚本和校验。
- Prefer fields that help selection, indexing, and consistency.  
  优先保留对选择、索引和一致性有帮助的字段。
- Avoid turning metadata into a second documentation system.  
  避免把元数据变成第二套文档系统。

---

## Skill metadata / Skill 元数据

Each skill directory should contain:

```text
skills/<skill-name>/skill.json
```

### Required fields / 必填字段

```json
{
  "name": "plan-engineering",
  "type": "skill",
  "category": "core",
  "summary": "Inspect the codebase and produce an implementation plan before editing files.",
  "entry": "SKILL.md"
}
```

### Field meanings / 字段说明

- `name`: must match the skill directory name  
  必须与 skill 目录名一致
- `type`: must be `skill`  
  必须为 `skill`
- `category`: one of:
  - `core`
  - `review`
  - `extended`
  - `control`
- `summary`: short human-readable description  
  简短说明
- `entry`: normally `SKILL.md`  
  通常为 `SKILL.md`

### Optional fields / 可选字段

```json
{
  "triggers": ["implementation planning", "repo inspection"],
  "recommendedWith": ["implement-feature", "review-change", "qa-release"],
  "packs": ["backend-api-pack", "db-migration-pack"]
}
```

Use optional fields when they improve recommendation or indexing.  
可选字段只在有助于推荐或索引时使用。

---

## Pack metadata / Pack 元数据

Each pack should have a sibling JSON file:

```text
packs/<pack-name>.json
```

### Required fields / 必填字段

```json
{
  "name": "backend-api-pack",
  "type": "pack",
  "scope": "backend",
  "summary": "Strengthen backend API work by checking contracts, compatibility, errors, and authorization.",
  "entry": "backend-api-pack.md"
}
```

### Field meanings / 字段说明

- `name`: must match the markdown filename without `.md`  
  必须与 markdown 文件名（去掉 `.md`）一致
- `type`: must be `pack`  
  必须为 `pack`
- `scope`: one of:
  - `frontend`
  - `backend`
  - `fullstack`
  - `data`
  - `security`
  - `quality`
  - `operations`
  - `platform`
- `summary`: short human-readable description  
  简短说明
- `entry`: markdown filename  
  对应 markdown 文件名

### Optional fields / 可选字段

```json
{
  "bestFitSkills": ["plan-engineering", "review-change", "qa-release"]
}
```

---

## Validation expectations / 校验预期

`doctor.sh` should be able to validate at least:

- every skill has `skill.json`
- every pack has matching `.json`
- required fields exist
- `name` matches the path
- `type` is correct
- `entry` points to an existing file
- `category` / `scope` values are valid
- referenced pack names in skill metadata resolve to real pack markdown files
- `recommendedWith` / `bestFitSkills` values resolve to real skill directories

---

## Non-goals / 非目标

This metadata layer does not try to:

- encode the full workflow logic
- duplicate all markdown content
- become a prompt runtime format
- replace human judgment

这层 metadata 不试图：

- 编码完整 workflow 逻辑
- 复制全部 markdown 内容
- 变成 prompt runtime 格式
- 替代人工判断
