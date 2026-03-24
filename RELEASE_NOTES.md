# xstack v0.2.0

## Summary

xstack v0.2.0 is the first release where xstack becomes meaningfully **web-focused**.

It keeps the core Codex delivery loop from v0.1:

- plan before implementation
- keep changes focused
- review for correctness and risk
- validate release readiness explicitly
- document what shipped

and adds a stronger layer for real website frontend/backend work.

## New in v0.2.0

### Web app packs

- `frontend-state-flow-pack`
- `backend-api-pack`
- `db-migration-pack`
- `fullstack-contract-pack`
- `form-flow-pack`
- `auth-permission-pack`
- `release-risk-pack`
- `incident-response-pack`
- `component-consistency-pack`

### Web-focused review skills

- `review-frontend-flow`
- `review-backend-api`

## Why this release matters

v0.2.0 moves xstack beyond a general-purpose workflow layer and toward a practical **Codex-first full-stack web delivery stack**.

This release is aimed at improving:

- frontend state completeness
- form quality and submission behavior
- UI consistency across repeated patterns
- backend API contract quality
- auth and permission review
- migration safety
- frontend/backend alignment
- release and incident judgment

## Full current stack

### Core delivery flow

- `plan-product`
- `plan-engineering`
- `implement-feature`
- `review-change`
- `qa-release`

### Extended delivery modes

- `investigate-bug`
- `security-review`
- `design-review`
- `benchmark-change`
- `document-release`

### Web-focused reviews

- `review-frontend-flow`
- `review-backend-api`

### Control modes

- `careful-mode`
- `freeze-mode`
- `unfreeze-mode`

## Notes

v0.2.0 is still intentionally compact.

The project is not trying to simulate an entire org chart or become a giant prompt collection. The goal is to give Codex sharper operating modes and reusable web-delivery checks that improve real software work.

## Likely next areas

- stack-specific packs (Next.js, FastAPI, Rails, Laravel, etc.)
- stronger observability helpers beyond current incident-response support
- packaging and distribution for easier reuse
- tighter repository-specific conventions
