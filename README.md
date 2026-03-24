# xstack

> A Codex-first workflow stack for shipping software with more structure, less drift, and better judgment.

**xstack** is a collection of focused skills that turn Codex from “a model that can edit files” into a more disciplined software delivery partner.

It is inspired by the useful part of gstack — role-based workflow switching — but redesigned for **Codex**, not transplanted from Claude Code.

Instead of one giant prompt and a lot of hope, xstack gives Codex a set of compact operating modes for planning, implementation, review, QA, investigation, security, design, and release communication.

---

## Why xstack exists

Codex is strong at execution.

What it often needs is better structure around **when to plan**, **when to slow down**, **how to review**, **what to validate**, and **how to separate “done coding” from “ready to ship.”**

That is the job of xstack.

xstack is for people who want:

- clearer planning before code changes
- tighter implementation discipline
- more reliable review and QA passes
- better handling of risky or ambiguous changes
- a stack that feels native to Codex rather than adapted from another tool

---

## What makes xstack different

### Codex-first

xstack is built around the way Codex tends to work well:

- inspect the repo
- make focused changes
- run validation
- summarize results

It avoids theatrical roleplay and focuses on **mode switching** instead.

### Smaller, sharper skills

Instead of dozens of overlapping personas, xstack uses a compact set of skills with clear boundaries.

Each skill is designed to answer one question well:

- What exactly are we building?
- How should we implement it?
- Did we change the right thing?
- Is this safe to ship?
- What actually caused the bug?

### Stable outputs

xstack favors structured outputs over vague essays.

Skills are written to consistently produce things like:

- goals and acceptance criteria
- implementation plans
- must-fix vs should-fix review findings
- QA checklists and ship recommendations
- release notes and operator summaries

### Guardrails over hype

xstack tries to make Codex more trustworthy, not more dramatic.

That means:

- stop when requirements are unclear
- avoid silent scope creep
- slow down around risky changes
- treat missing validation as real risk

---

## v0.1 scope

xstack v0.1 is the practical baseline.

It is designed for solo builders and small teams who want a clean software-delivery loop with Codex:

**plan → implement → review → validate → communicate**

This version focuses on workflow quality, not ecosystem sprawl.

---

## Skill catalog

### Core delivery flow

#### `plan-product`
Turn a vague request into goals, scope, non-goals, assumptions, and acceptance criteria.

#### `plan-engineering`
Inspect the codebase and produce an implementation plan before editing files.

#### `implement-feature`
Make tightly scoped changes, follow local patterns, and validate the result.

#### `review-change`
Review a diff like a careful engineer: correctness first, then regressions, risk, and missing validation.

#### `qa-release`
Decide whether a change is actually ready to ship.

### Extended delivery modes

#### `investigate-bug`
Diagnose incidents, regressions, and weird behavior before proposing a fix.

#### `security-review`
Review auth, trust boundaries, data exposure, and realistic abuse paths.

#### `design-review`
Evaluate UX quality, interaction clarity, and “AI slop” signals in user-facing work.

#### `benchmark-change`
Assess whether performance claims are backed by credible measurement.

#### `document-release`
Turn technical changes into clear release notes, operator updates, and stakeholder summaries.

### Control modes

#### `careful-mode`
Tighten discipline for ambiguous, risky, or high-impact work.

#### `freeze-mode`
Pause broad edits and focus on stabilization, containment, or diagnosis.

#### `unfreeze-mode`
Return to normal execution after a freeze-style task.

---

## Recommended workflows

### Feature workflow

1. `plan-product`
2. `plan-engineering`
3. `implement-feature`
4. `review-change`
5. `qa-release`
6. `document-release` if the change will be shipped or announced

### Bug workflow

1. `investigate-bug`
2. `plan-engineering` if the fix is non-trivial
3. `implement-feature`
4. `review-change`
5. `qa-release`

### Sensitive change workflow

1. `careful-mode`
2. `plan-engineering`
3. `security-review` if auth, data, billing, permissions, or trust boundaries are involved
4. `implement-feature`
5. `review-change`
6. `qa-release`

---

## Quick examples

Use xstack skills as explicit work modes.

```text
Use plan-product to turn this feature idea into scope and acceptance criteria.
Use plan-engineering and inspect the repo before proposing implementation steps.
Use implement-feature and keep the change tightly scoped.
Use review-change on the current diff and separate must-fix from should-fix.
Use qa-release and tell me whether this is safe to ship.
Use investigate-bug and narrow likely root causes before suggesting a patch.
Use security-review on this auth change.
Use document-release to write operator-facing release notes.
```

---

## Repository layout

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
  careful-mode/
  freeze-mode/
  unfreeze-mode/
```

Each skill contains:

- `SKILL.md` — trigger description and workflow
- `references/` — checklists, templates, and patterns loaded only when needed

This keeps the main skill files compact while still allowing deeper guidance where it matters.

---

## Design principles

xstack follows a few rules consistently:

- **Single-purpose skills** beat giant all-in-one prompts.
- **Role switching** is useful; roleplay is optional.
- **Repository reality** matters more than abstract architecture language.
- **Review quality** comes from concrete failure modes, not vague discomfort.
- **Validation** is part of delivery, not an afterthought.
- **Shipping** and **coding** are not the same milestone.

---

## Who this is for

xstack is a good fit if you:

- use Codex as a serious coding agent
- build alone or in a small team
- want more consistent planning and review
- are tired of rewriting the same “be careful / think first / review this properly” prompts

xstack is probably a worse fit if you want maximum improvisation and minimum process.

---

## Near-term roadmap

Likely next steps after v0.1:

- repository-specific conventions packs
- deployment-aware release gates
- stack-specific reference bundles (Next.js, FastAPI, Rails, Laravel, etc.)
- stronger observability and incident-response helpers
- packaging and distribution for easier reuse

---

## Positioning in one sentence

**xstack is a compact operating layer that helps Codex plan better, change less recklessly, review more seriously, and ship with clearer evidence.**

---

## Name

The product name is **xstack**.

Use that name for the repository, branding, future package names, and release line.
