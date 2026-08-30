# Master Requirements Traceability Matrix

| Domain | Primary records | Services/workers | Gate | Evidence |
|---|---|---|---|---|
| Identity | users, employee_accounts, credentials | identity service | MFA/RBAC | auth + audit |
| RBAC | roles, permissions, assignments | policy engine | approval | decision event |
| CRM | clients, cases, tasks | CRM workers | tenant/assignment | activity trace |
| Billing | invoices, invoice_lines | billing service | agreement | invoice version |
| Payments | payments, allocations, stripe_events | Stripe workers | signature/idempotency | processor event |
| Collections | collections, actions | collection worker | policy stage | communication/task |
| Recovery | recovery_cases | recovery worker | assignment | recovery ledger |
| Practitioner fees | fee ledger, settlements | settlement worker | approval/reconciliation | settlement evidence |
| Refunds | refund_cases, lifecycle events | refund guard | authorized source | verified status evidence |
| Documents | templates, artifacts, consents | writer worker | approval/signature | artifact hash |
| HR | employee profiles/accounts | HR navigator | HR approval | onboarding evidence |
| Education | courses/enrollments/assessments | learning workers | curriculum rules | grade/completion |
| CEU | CEU records | renewal worker | completion | certificate/CEU evidence |
| Security | audit/security events | monitoring | policy | immutable event |
| Operations | jobs/events/incidents | worker platform | retry/DLQ | run trace |

## Definition of done
A capability is not complete merely because a UI exists. It requires: data model, API contract, authorization, validation, audit evidence, failure path, worker behavior where needed, tests, documentation, monitoring and release-gate evidence.
