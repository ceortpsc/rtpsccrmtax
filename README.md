# RTPSC Tax Practitioner Operating Platform

Governed monorepo blueprint for CRM, billing, collections, refund monitoring, documents, education, and authorized tax-transmission workflows.

## Refund Release / TC 810 / TC 570

This module is a monitoring, case-management, evidence, and remediation navigator. It does **not** release an IRS refund, alter an IRS account, remove a freeze, or guarantee a refund date.

Current IRS IRM material describes TC 810 and TC 570 as refund-freeze indicators in specified contexts. Their meaning depends on surrounding transaction codes, responsibility/action codes, account history, notices, and applicable IRS procedures. The platform therefore stores the observed code plus context rather than treating a code as a standalone diagnosis.

### Practitioner workflow

1. Obtain taxpayer authorization appropriate to the action.
2. Capture tax year, return reference, notice, transcript/source date, and observed transaction-code sequence.
3. Normalize TC 810 / TC 570 observations into the case timeline.
4. Evaluate against the current approved procedure version.
5. Select a remediation lane: information/document response, correction/amendment review, identity-verification review, refund-trace review, notice response, TAS eligibility review, or monitoring.
6. Require human approval before generating or transmitting a taxpayer response.
7. Record every source, decision, document, approval, submission, and outcome as evidence.
8. Continue bounded scheduled monitoring until resolution or documented closure.

### Safety rules

- Never infer that TC 810 or TC 570 alone proves fraud, error, denial, or a release date.
- Never claim that a practitioner can directly remove an IRS freeze.
- Never fabricate an IRS transaction, transcript, acknowledgement, notice, or release.
- Never represent an internal status as an IRS status.
- Never use an AI estimate as a refund-timing promise.
- Preserve the authoritative source and procedure/version used.

## IRM remedy navigator

Maps an observed issue to authoritative source, procedure/version, eligibility predicates, required evidence, authorization, practitioner owner, approval gate, submission channel, follow-up condition, escalation condition, and closure evidence.

This is procedural guidance, not legal advice and not a substitute for the current IRS IRM, forms, notices, or instructions.

## Worker automation

Workers:
- refund.case.refresh
- refund.timeline.rebuild
- refund.tc.evaluate
- refund.notice.match
- refund.document.check
- refund.followup.schedule
- refund.stale-case.guard
- refund.reconciliation
- refund.notification

Every job carries job_id, tenant_id, case_id, correlation_id, attempt, idempotency_key, policy_version, source_timestamp, next_run_at, status, and an audit event.

Automation may create tasks, reminders, classifications, and evidence requests. It cannot bypass authorization or approval gates.

## Template presets

TC-810 intake; TC-570 intake; refund-hold review; notice-response checklist; missing-document request; amended-return review; refund-trace checklist; TAS escalation review; identity-verification review; practitioner follow-up; client-safe status update; case closure report.

Templates are versioned and scoped by jurisdiction, tax year, and effective date.

## Repository layout

apps/api
apps/web
apps/worker
packages/domain
packages/policy
packages/audit
packages/billing
packages/refund
packages/documents
packages/education
packages/transmission
packages/ui
db/migrations
db/seeds
docs/refund
docs/irm
docs/workflows
docs/security
tests

## Compliance disclaimer

IRS, Treasury, TAS, and IRM names identify relevant procedures or integrations only. No government endorsement or approval is implied by this repository. Any claim of IRS authorization must be tied to current authorization evidence held by the organization.
