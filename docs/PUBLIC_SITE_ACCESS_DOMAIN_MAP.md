# Ross Tax Pro Software Co. — Public Site, Access Gate & Domain Map

## Primary hostnames

- `rosstaxprosoftwareco.com` — public home / marketing shell
- `home.rosstaxprosoftwareco.com` — home access point
- `docs.rosstaxprosoftwareco.com` — public documentation index
- `api.rosstaxprosoftwareco.com` — public API contract/health surface

## Public routes (SPA hash routing)

- `#home` — Home
- `#platform` — Platform overview
- `#tax-practitioner` — Tax Practitioner Workspace
- `#crm` — CRM + Collections
- `#payments` — Payments + Invoice Gates
- `#refunds` — Refund Monitor / Guard
- `#education` — Academy / CEU
- `#hr` — HR / Employee Navigator
- `#security` — Security + Governance
- `#docs` — Documentation
- `#api` — API Contract Directory
- `#access` — Workspace Access Gate

## Protected access points

| Access point | Audience | Gate |
|---|---|---|
| Practitioner Workspace | tax practitioner / preparer / reviewer | authenticated identity + RBAC/ABAC |
| ERO Workspace | ERO / authorized supervisor | authenticated identity + privileged approval |
| Client Portal | taxpayer/client | authenticated client identity + consent/session policy |
| Collections Console | authorized collections role | authenticated identity + collection permission |
| Education Portal | learner/instructor | authenticated identity + enrollment/role |
| Employee Portal | employee/admin | authenticated identity + HR role |
| Governance Console | owner/admin/compliance | privileged identity + explicit authorization |

## Access principles

1. Default deny.
2. Public pages expose no taxpayer, payment, employee or credential records.
3. Server-side authorization is authoritative.
4. Tenant/workspace context is resolved server-side.
5. Export permissions are separate from read permissions.
6. Approval, transmit, refund, write-off, credential and role-administration actions require dedicated gates.
7. AI never bypasses authorization.

## DNS mapping for AppDeploy v2

`rosstaxprosoftwareco.com` -> ALIAS/ANAME/flattening to `proxy-v2.appdeploy.ai`; fallback A `18.232.7.146` where supported.

`home.rosstaxprosoftwareco.com` -> CNAME `proxy-v2.appdeploy.ai`

`docs.rosstaxprosoftwareco.com` -> CNAME `proxy-v2.appdeploy.ai`

`api.rosstaxprosoftwareco.com` -> CNAME `proxy-v2.appdeploy.ai`

The deployment manager currently reports these hostnames as pending DNS verification. Do not remove the existing MX, SPF, DKIM, or DMARC records used for email.

## Claims governance

The public site must not state "IRS approved", "IRS certified", "Treasury approved", or similar claims unless the exact claim is independently substantiated and authorized. Secure transport and a TLS certificate do not imply government approval.
