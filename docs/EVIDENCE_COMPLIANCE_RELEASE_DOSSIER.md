# Evidence & Release Dossier

## Evidence index
A release dossier should contain:
1. Requirements traceability matrix.
2. Architecture and data-flow diagrams.
3. RBAC/ABAC permission matrix.
4. Database migration checksum and validation output.
5. API/contract test results.
6. Unit/component/integration/E2E results.
7. Security scan results.
8. Dependency/license review.
9. Secret/configuration validation proving values are externalized without revealing them.
10. TLS/certificate validation.
11. Stripe webhook signature/idempotency test evidence.
12. Invoice/payment/refund/reconciliation test evidence.
13. Worker retry/dead-letter evidence.
14. Backup/restore evidence.
15. Accessibility and responsive UI evidence.
16. UAT sign-off.
17. Release approval.
18. Deployment identifier and rollback target.
19. Post-deploy smoke test evidence.

## Evidence integrity
Evidence artifacts receive a content hash and are linked to a release ID. Do not store raw secrets in evidence.

## Claims governance
Security badges and regulatory claims must be substantiated before publication. A TLS certificate is not evidence of IRS approval. IRS participation/authorization is documented separately from website security.

## Production sign-off
Required sign-offs:
- Engineering
- Security
- Financial operations
- Compliance/policy owner
- Product/business owner

## Rollback
Every production release must have a known prior stable version, migration rollback/forward-fix plan, feature-flag disable path and incident owner.

## Current repository evidence
Repository: ceortpsc/rtpsccrmtax
Default branch: main
Repository permissions available to the connected GitHub identity include push/admin.
Current repository size reported by GitHub at verification time: 0 before the current architecture commits.
