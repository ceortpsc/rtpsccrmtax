# Branded Document Presets

## Invoice
Header -> legal business identity -> invoice number -> client -> service agreement -> line-item table -> totals -> amount paid -> balance -> payment options -> terms -> disclosures -> footer.

## Receipt / Proof of Payment
Header -> RECEIPT / PROOF OF PAYMENT -> receipt number -> verified payment date -> invoice -> service -> amount -> processor reference -> remaining balance -> verification statement -> disclosure -> footer.

## Payment Plan Agreement
Parties -> services -> agreed balance -> installment schedule -> authorization -> late/default terms -> cancellation/refund policy -> consent -> signatures -> version/effective date.

## Client Service Agreement
Parties -> scope -> fees -> payment terms -> taxpayer/client responsibilities -> document authorization -> communications -> privacy -> electronic consent -> termination -> signatures.

## Employee / Practitioner Fee Statement
Period -> practitioner -> source services -> approved fees -> adjustments -> gross payable -> deductions where applicable -> settlement status -> approval evidence.

## Disclosure blocks
Use modular disclosure blocks. Do not create legal conclusions automatically. Route jurisdiction-specific language through approved legal/compliance review.

## Document evidence
Every issued document stores:
template_id, template_version, jurisdiction, policy_version, source_refs, generated_at, generated_by, approval_event, artifact_hash.
