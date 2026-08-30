# Branded Invoice + Proof of Payment System

## Invoice lifecycle
draft -> reviewed -> approved -> issued -> partially_paid -> paid -> overdue -> disputed/refunded/void

## Invoice contents
- Legal business identity
- Customer/client identity
- Invoice number
- Issue date
- Due date
- Service description
- Agreement/reference number
- Line items
- Quantity
- Unit price
- Discounts/credits where applicable
- Tax treatment when applicable
- Amount due
- Amount paid
- Balance remaining
- Currency
- Payment instructions
- Terms
- Applicable disclosures
- Authorized contact information

## Payment allocation
Each successful payment creates an immutable payment event and an allocation to one or more invoices. The invoice balance is calculated from authoritative ledger events.

## Proof of payment
Generate a branded receipt only after a verified payment state is obtained from the payment processor/server-side ledger.

Receipt fields:
- Receipt number
- Payment date/time
- Client
- Invoice
- Service
- Amount
- Currency
- Payment status
- Processor reference
- Invoice balance after payment
- Business legal identity
- Disclosure/terms reference
- Verification reference/QR payload that contains no secret

## Do not use
A screenshot of a checkout redirect is not proof of payment.
Client-supplied "paid" status is not proof.
A webhook must be signature-verified before becoming trusted payment evidence.

## Refunds
Refunds generate a separate immutable refund record linked to the original payment and receipt. Do not overwrite the original receipt.

## Branding
Use the approved RTPSC/254 Tax Consultants brand assets, legal identity, typography, document number, footer disclosures and contact information. Brand assets must be versioned.
