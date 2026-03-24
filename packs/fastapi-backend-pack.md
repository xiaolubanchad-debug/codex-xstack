# fastapi-backend-pack

Use this pack when a task targets a FastAPI backend, especially one involving Pydantic models, request/response schemas, dependency injection, auth dependencies, background tasks, or route-level contract changes.

## Purpose

Make xstack more effective on real FastAPI backends by focusing on common framework-specific failure points:

- request and response schema drift
- route signatures that look valid but break clients
- dependency injection used inconsistently
- auth and permission checks split across handlers and dependencies in confusing ways
- background tasks, async behavior, or validation errors that are technically wired but operationally weak
- database and transaction assumptions hidden behind “simple” path operations

## FastAPI checklist

### Schema discipline

- Are request and response models explicit and correct?
- Are optional vs required fields aligned with real behavior?
- Could Pydantic model changes break existing callers?

### Route contracts

- Do path, query, and body parameters match the intended API contract?
- Are status codes and error shapes intentional?
- Are validation failures represented clearly and consistently?

### Dependency injection

- Are dependencies used in the right layer?
- Are auth, tenant, or resource-loading dependencies clear and reusable?
- Could hidden dependency behavior make the route harder to reason about?

### Async, tasks, and side effects

- Is async behavior appropriate for the code path?
- Are background tasks safe and observable enough?
- Does the route create side effects that the caller or UI needs to understand?

### Auth and permissions

- Are permission checks enforced in server-side logic, not just implied by clients?
- Are resource ownership and tenant boundaries protected?
- Could a caller reach data or actions they should not access?

### Persistence and transactions

- Are database writes safe and intentional?
- Could partial failures leave inconsistent state?
- Are transaction boundaries or retry assumptions hidden?

## Review cues

Look for these common failure patterns:

- model changes that silently break clients
- validation working in FastAPI but not matching product expectations
- dependencies that obscure auth or tenant scope
- async or background tasks added without clear failure visibility
- route handlers that appear simple while hiding multi-step side effects
- transaction or persistence assumptions left implicit

## Best fit

Read this pack from:

- `plan-engineering`
- `implement-feature`
- `review-backend-api`
- `security-review`
- `qa-release`
