# xstack v0.1

## Summary

xstack v0.1 is the first public baseline of a Codex-first workflow stack for software delivery.

This release establishes the core operating model:

- plan before implementation
- keep changes focused
- review for correctness and risk
- validate release readiness explicitly
- document what shipped

## Included skills

### Core flow

- `plan-product`
- `plan-engineering`
- `implement-feature`
- `review-change`
- `qa-release`

### Extended flow

- `investigate-bug`
- `security-review`
- `design-review`
- `benchmark-change`
- `document-release`

### Control modes

- `careful-mode`
- `freeze-mode`
- `unfreeze-mode`

## Notes

This release is intentionally compact.

It focuses on reusable workflow quality instead of trying to simulate a full company org chart. The goal is to make Codex more disciplined in real repositories with a small number of sharp, composable skills.

## Next likely areas

- repository-specific convention packs
- stronger deployment-aware release guidance
- stack-specific reference bundles
- richer incident and observability workflows
