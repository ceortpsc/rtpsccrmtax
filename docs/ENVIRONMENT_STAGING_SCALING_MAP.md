# Environment, Staging, Scaling & Configuration Map
Version: 1.0.0

## Environments
### Development
Purpose: local feature development and unit/component tests.
Data: synthetic only.
External payments: Stripe test mode.
No production credentials.

### CI
Purpose: deterministic lint/type/test/security/migration checks.
Data: ephemeral fixtures.
External integrations: mocked or provider test endpoints.

### Staging
Purpose: production-like integration/UAT.
Data: synthetic or explicitly authorized test data only.
Stripe: test/sandbox.
Full webhook, worker, reconciliation and approval workflows enabled.

### Production
Purpose: real operations.
Data: production.
Secrets: managed secret manager only.
Promotion: explicit release approval after evidence gates.

## Configuration classes
Public runtime configuration:
- application URL
- non-secret feature flags
- public Stripe publishable configuration

Secret configuration:
- Stripe secret key
- Stripe webhook signing secret
- Connect credentials when applicable
- database credentials
- encryption/key-management references
- email/SMS provider secrets
- external tax/API credentials

Never commit secret values.

## Scaling model
Web/API: horizontally scalable stateless instances.
Webhook ingress: horizontally scalable with durable event persistence and idempotency.
Workers: horizontally scalable by queue partition/consumer groups.
Database: primary transactional database with read replicas only where consistency requirements permit.
Object storage: versioned encrypted storage.
Search/analytics: asynchronous projections.
Cache: non-authoritative; never use cache as the source of payment truth.

## Capacity controls
- Queue depth
- event processing latency
- webhook error rate
- API p95/p99 latency
- database CPU/connections/locks
- worker throughput
- dead-letter count
- reconciliation exceptions
- payment failure rate
- notification backlog

## Scale triggers
Scale horizontally on sustained CPU/request/queue thresholds. Protect downstream providers with rate limits, backoff, circuit breakers and bounded concurrency.

## Disaster recovery
Define RPO/RTO per service. Backups must be encrypted, monitored, periodically restore-tested and access-controlled.
