# Application Flow, Configuration & State Mapping

## Global request flow
Identity -> tenant resolution -> RBAC/ABAC -> policy evaluation -> validation -> domain transaction -> audit event -> durable event -> worker -> external integration -> reconciliation -> notification -> evidence.

## Client / CRM
Lead -> intake -> identity match -> consent -> client profile -> case -> assigned practitioner -> service agreement -> active work -> billing -> completion -> retention/closure.

## Tax practitioner service billing
Service selected -> fee schedule -> agreement -> invoice -> payment gate -> verified payment -> service entitlement -> preparation workflow -> review -> completion -> receipt/evidence.

## Collections
Invoice due -> overdue detector -> collection case -> policy stage -> assigned collector -> approved communication -> promise/payment plan -> payment -> reconciliation -> resolved OR escalation/write-off approval.

## Practitioner fees
Verified client payment -> service attribution -> fee calculation -> fee ledger -> approval -> settlement batch -> payout/transfer where applicable -> reconciliation.

## Refund guard
Refund case -> authorized data source adapter -> verified status -> lifecycle event -> freshness evaluation -> exception classification -> human task -> next authorized inquiry -> closure.

## Employee onboarding
Applicant -> application validation -> role/job mapping -> HR approval -> required documents -> consent -> training -> credential request -> role approval -> account provisioning -> active employee.

## Education
Enrollment -> orientation -> course -> lecture/materials -> assignment -> exam -> grading -> remediation -> final assessment -> completion -> CEU/diploma issuance where rules permit.

## Document writer
Template selection -> jurisdiction/effective-date check -> source authority -> field validation -> draft -> review -> approval -> signature/consent -> issuance -> immutable artifact/evidence -> retention.

## Configuration precedence
Platform policy -> tenant policy -> workspace policy -> role constraints -> workflow state -> object-level authorization. More restrictive controls win.

## Feature flags
Every high-risk integration or financial capability has an explicit flag and rollout state: disabled -> internal -> staging -> pilot -> controlled production -> full.

## State transition contract
Every state-changing command must declare:
current state, requested transition, actor, authorization result, required approvals, validation result, side effects, compensating action, audit event, resulting state.
