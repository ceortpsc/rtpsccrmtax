# Refund Worker Automation

## Queues

| Queue | Purpose | Retry |
|---|---|---|
| refund-ingest | Normalize authorized status evidence | bounded exponential backoff |
| refund-evaluate | Apply versioned rules | bounded |
| refund-followup | Create practitioner tasks | bounded |
| refund-notify | Consent-aware notifications | bounded |
| refund-reconcile | Compare source and CRM state | scheduled |
| refund-dead-letter | Human investigation | manual |

## Idempotency

External events are unique by provider/source plus event identifier. Scheduled case evaluations use deterministic idempotency keys.

## Guards

- tenant active;
- practitioner authorized;
- required taxpayer consent/authorization present;
- approved source;
- evidence freshness acceptable;
- case not closed;
- no legal/compliance hold blocks the action.

## Failure handling

Provider timeout -> retry.
Authentication failure -> stop and alert.
Invalid payload -> quarantine.
Duplicate event -> acknowledge without duplicate side effect.
Policy mismatch -> human review.
Missing evidence -> evidence request.
Repeated failure -> dead-letter and owner task.

## Observability

Measure queue depth, attempts, latency, provider errors, stale cases, unresolved TC cases, and reconciliation mismatches.
