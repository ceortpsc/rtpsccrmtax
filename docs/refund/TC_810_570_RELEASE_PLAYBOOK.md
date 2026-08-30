# Refund Release Playbook — TC 810 / TC 570

## Purpose

Provide a practitioner workflow for identifying, documenting, monitoring, and resolving refund holds without asserting that the application can release an IRS refund.

## State machine

NEW -> EVIDENCE_REQUESTED -> EVIDENCE_RECEIVED -> REVIEW -> REMEDIATION_READY -> APPROVAL_REQUIRED -> SUBMITTED -> AWAITING_RESPONSE -> MONITORING -> RESOLVED | ESCALATED | CLOSED

## Required evidence

- taxpayer authorization;
- tax year;
- return reference;
- transcript or official source reference;
- exact transaction code(s);
- date/time observed;
- responsibility/action code when available;
- notice number/date when applicable;
- supporting documents;
- practitioner analysis;
- applicable current procedure/source version;
- approval record;
- submission/response evidence;
- outcome.

## TC 810

A TC 810 can indicate a refund freeze in specific IRS processing contexts. The application must capture available responsibility/action-code context and route to the applicable current IRS procedure. It does not establish a remedy or release date by itself.

## TC 570

A TC 570 can indicate a refund hold/additional-liability-pending condition in specific contexts. The application must inspect surrounding account activity and notices rather than treating TC 570 as a standalone diagnosis.

## Determination lanes

MONITOR
REQUEST_INFORMATION
CORRECT_RETURN_REVIEW
NOTICE_RESPONSE_REVIEW
IDENTITY_REVIEW
REFUND_TRACE_REVIEW
TAS_ELIGIBILITY_REVIEW
PRACTITIONER_ESCALATION

The application never emits IRS_RELEASE_CONFIRMED unless an authorized source explicitly provides evidence supporting that state.

## Guard worker

1. Load latest authorized evidence.
2. Check freshness.
3. Compare normalized state with prior state.
4. Create a task for material changes.
5. Schedule the next permitted check.
6. Stop when closed/resolved.
7. Dead-letter repeated provider failures.
8. Record every action.

No infinite polling. Polling is bounded, rate-limited, provider-compliant, and auditable.

## Client-safe language

“Your return/refund is currently being monitored. The IRS has not provided a confirmed release date through the information available to our office.”

Do not say that a refund is guaranteed, that the practitioner released an IRS refund, that a specific future date is guaranteed, or that a TC code alone proves denial/fraud.
