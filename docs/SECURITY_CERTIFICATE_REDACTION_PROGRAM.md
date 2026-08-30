# Security Certificate, Redaction, Encryption & Disclosure Program

## Certificate status
TLS certificates secure transport. A DigiCert certificate is not an "IRS-approved certificate" and must never be marketed as IRS approval. IRS authorization/participation and website TLS are separate controls.

## TLS
- TLS 1.2+; prefer TLS 1.3.
- HTTPS-only production endpoints.
- HSTS after domain validation.
- Automated certificate expiry monitoring.
- Renewal before expiration.
- No private keys in Git, application logs, tickets, CRM notes or exports.
- Private keys reside only in the approved certificate/secret manager.

## Redaction
Redaction is irreversible removal from an approved output copy. Masking is reversible display suppression.
Rules:
- Never expose full SSNs, bank account numbers, card numbers, passwords, API secrets or session tokens.
- UI defaults to least disclosure.
- Exports apply field-level redaction by role.
- Logs use identifiers/fingerprints, not secrets.
- Redaction events record actor, reason, policy version and output artifact.

## Encryption
- TLS in transit.
- Strong encryption at rest through managed KMS/database/storage controls.
- Field-level encryption for configured high-sensitivity data.
- Separate encryption keys by environment.
- Key rotation and access logging.
- No hard-coded encryption secrets.

## Security badges
Display only badges that are actually earned and verifiable: TLS/certificate status, PCI-related Stripe-hosted payment controls where applicable, privacy/security certifications actually held, and accessibility/security statements that are substantiated.

Never display "IRS Certified", "IRS Approved", "Treasury Approved", "DigiCert Secure Site" or similar claims unless the exact claim is independently true and authorized.

## Disclosures
Every sensitive workflow presents applicable privacy, payment, document, tax-service, electronic-signature and authorization disclosures before consent.

## Consent
Consent records:
consent_id, user_id, document_type, document_version, jurisdiction, consent_text_hash, accepted_at, method, IP metadata where legally appropriate, policy_version, revoked_at.

Consent must be versioned and never silently rewritten.

## Evidence
Security events are immutable and include correlation ID, actor, action, target, timestamp, policy version and outcome.
