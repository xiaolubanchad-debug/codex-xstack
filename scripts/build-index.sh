#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

python3 - <<'PY'
import glob
import json
import os
from collections import defaultdict

root = os.getcwd()

skill_category_titles = {
    'core': 'Core delivery flow',
    'review': 'Review and quality modes',
    'extended': 'Extended delivery modes',
    'control': 'Control modes',
}

pack_scope_titles = {
    'frontend': 'Frontend packs',
    'backend': 'Backend packs',
    'fullstack': 'Full-stack packs',
    'data': 'Data packs',
    'security': 'Security packs',
    'quality': 'Quality packs',
    'operations': 'Operations packs',
    'platform': 'Platform packs',
}

skills = []
for path in sorted(glob.glob('skills/*/skill.json')):
    with open(path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    skills.append(data)

packs = []
for path in sorted(glob.glob('packs/*.json')):
    with open(path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    packs.append(data)

skills_by_category = defaultdict(list)
for item in skills:
    skills_by_category[item['category']].append(item)

packs_by_scope = defaultdict(list)
for item in packs:
    packs_by_scope[item['scope']].append(item)

skill_lookup = {item['name']: item for item in skills}
pack_lookup = {item['name']: item for item in packs}

skills_lines = []
skills_lines.append('# Skills index / Skills 索引')
skills_lines.append('')
skills_lines.append('This file is generated from `skills/*/skill.json` by `scripts/build-index.sh`.  ')
skills_lines.append('此文件由 `scripts/build-index.sh` 根据 `skills/*/skill.json` 自动生成。')
skills_lines.append('')
skills_lines.append('Use this index when you want a fast overview of what each skill is for, how it is categorized, and which other modes it commonly pairs with.  ')
skills_lines.append('当你想快速了解每个 skill 的用途、分类，以及它通常与哪些模式搭配时，可以看这个索引。')
skills_lines.append('')
skills_lines.append('---')
skills_lines.append('')

for category in ['core', 'review', 'extended', 'control']:
    items = skills_by_category.get(category, [])
    if not items:
        continue
    skills_lines.append(f"## {skill_category_titles[category]} / {category} 分类")
    skills_lines.append('')
    for item in items:
        skills_lines.append(f"### `{item['name']}`")
        skills_lines.append(f"- Summary: {item['summary']}")
        if item.get('triggers'):
            skills_lines.append(f"- Triggers: {', '.join(f'`{x}`' for x in item['triggers'])}")
        if item.get('recommendedWith'):
            skills_lines.append(f"- Recommended with: {', '.join(f'`{x}`' for x in item['recommendedWith'])}")
        if item.get('packs'):
            skills_lines.append(f"- Related packs: {', '.join(f'`{x}`' for x in item['packs'])}")
        skills_lines.append(f"- Entry: [`skills/{item['name']}/SKILL.md`](./skills/{item['name']}/SKILL.md)")
        skills_lines.append('')
    skills_lines.append('---')
    skills_lines.append('')

skills_lines.append('## Selection hints / 选择提示')
skills_lines.append('')
skills_lines.append('- Want the smallest useful path? Start with `plan-engineering` → `review-change` → `qa-release`.')
skills_lines.append('- Building a new feature? Start with `plan-product` or `plan-engineering`, then move into implementation and review.')
skills_lines.append('- Reviewing user-facing work? Add `review-frontend-flow`.')
skills_lines.append('- Reviewing API, auth, or permission-sensitive work? Add `review-backend-api` and `security-review` when needed.')
skills_lines.append('- Working on risky or ambiguous tasks? Start with `careful-mode`.')
skills_lines.append('')

packs_lines = []
packs_lines.append('# Packs index / Packs 索引')
packs_lines.append('')
packs_lines.append('This file is generated from `packs/*.json` by `scripts/build-index.sh`.  ')
packs_lines.append('此文件由 `scripts/build-index.sh` 根据 `packs/*.json` 自动生成。')
packs_lines.append('')
packs_lines.append('Use this index when you want to find the right stack-specific or domain-specific review lens to combine with a skill.  ')
packs_lines.append('当你想找到适合与某个 skill 搭配使用的技术栈或领域专项视角时，可以看这个索引。')
packs_lines.append('')
packs_lines.append('---')
packs_lines.append('')

for scope in ['frontend', 'backend', 'fullstack', 'data', 'security', 'quality', 'operations', 'platform']:
    items = packs_by_scope.get(scope, [])
    if not items:
        continue
    packs_lines.append(f"## {pack_scope_titles[scope]} / {scope} 分类")
    packs_lines.append('')
    for item in items:
        packs_lines.append(f"### `{item['name']}`")
        packs_lines.append(f"- Summary: {item['summary']}")
        if item.get('bestFitSkills'):
            packs_lines.append(f"- Best fit skills: {', '.join(f'`{x}`' for x in item['bestFitSkills'])}")
        packs_lines.append(f"- Entry: [`packs/{item['entry']}`](./packs/{item['entry']})")
        packs_lines.append('')
    packs_lines.append('---')
    packs_lines.append('')

packs_lines.append('## Selection hints / 选择提示')
packs_lines.append('')
packs_lines.append('- Use packs to sharpen review or planning, not to replace skills.')
packs_lines.append('- Reach for frontend packs when the main risk is user state, forms, or interaction quality.')
packs_lines.append('- Reach for backend, data, and security packs when the main risk is contracts, migrations, permissions, or rollout safety.')
packs_lines.append('- Reach for platform packs when the task is shaped by a specific Node framework or stack.')
packs_lines.append('')

with open('SKILLS_INDEX.md', 'w', encoding='utf-8') as f:
    f.write('\n'.join(skills_lines).rstrip() + '\n')

with open('PACKS_INDEX.md', 'w', encoding='utf-8') as f:
    f.write('\n'.join(packs_lines).rstrip() + '\n')
PY

echo "Generated SKILLS_INDEX.md and PACKS_INDEX.md"
