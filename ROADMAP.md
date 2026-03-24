# xstack roadmap

## v0.2 goal

Turn xstack from a strong general delivery stack into a sharper **full-stack web delivery stack**.

v0.2 focuses on practical efficiency gains for website frontends and backends by adding reusable packs that strengthen the weakest points in AI-assisted web development:

- frontend state handling
- backend API design discipline
- database migration safety
- frontend/backend contract alignment

## Why v0.2 exists

xstack v0.1 already improves planning, implementation discipline, review quality, QA, investigation, security review, and release communication.

The next step is not adding more generic roles. The next step is making xstack much better at real web-app work.

## v0.2 priorities

### P0 — ship first

#### 1. frontend-state-flow-pack

Strengthen user-facing work by checking:

- initial state
- loading state
- empty state
- success state
- error state
- retry flow
- refresh behavior
- permission-denied behavior when relevant

**Primary impact:** frontend reliability and QA quality.

#### 2. backend-api-pack

Strengthen backend and service-facing work by checking:

- request and response contracts
- field semantics
- compatibility impact
- error handling
- pagination, filtering, sorting
- object-level access and permissions

**Primary impact:** API stability, lower rework, stronger reviews.

#### 3. db-migration-pack

Reduce migration and schema risk by checking:

- backward compatibility
- rollout order
- rollback path
- old-data assumptions
- null/default/index risks
- large-table and lock-risk concerns

**Primary impact:** safer releases and less backend uncertainty.

#### 4. fullstack-contract-pack

Improve frontend/backend collaboration by checking:

- data fields expected by the UI vs delivered by the backend
- enum and state-shape consistency
- error-flow alignment
- pagination/filter/sort agreement
- permission and visibility agreement

**Primary impact:** fewer integration mismatches and better full-stack delivery.

### P1 — next wave

- form-flow-pack
- auth-permission-pack
- release-risk-pack

### P2 — later

- component-consistency-pack
- incident-response-pack
- review-backend-api skill

### In progress / landed after initial v0.2 planning

- `review-frontend-flow` has been added as the first dedicated web-focused review skill.

## Implementation plan

### Phase 1

Add the first four packs as reusable reference material under `packs/`.

### Phase 2

Wire those packs into the existing core skills:

- `plan-engineering`
- `implement-feature`
- `review-change`
- `qa-release`
- `security-review`

### Phase 3

Observe where packs are not enough and promote the most valuable workflows into standalone skills only if needed.

## Success criteria

v0.2 is successful if it noticeably reduces:

- frontend state omissions
- backend API contract drift
- migration-related release risk
- frontend/backend mismatch after implementation

It should also improve:

- review quality
- QA completeness
- release confidence for web-app changes
