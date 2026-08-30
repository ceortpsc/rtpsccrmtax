CREATE TABLE IF NOT EXISTS service_agreements (
 id uuid PRIMARY KEY,
 tenant_id uuid NOT NULL,
 client_id uuid NOT NULL,
 agreement_number text NOT NULL,
 service_type text NOT NULL,
 version text NOT NULL,
 status text NOT NULL DEFAULT 'draft',
 accepted_at timestamptz,
 created_at timestamptz NOT NULL DEFAULT now(),
 UNIQUE (tenant_id, agreement_number)
);

CREATE TABLE IF NOT EXISTS invoices (
 id uuid PRIMARY KEY,
 tenant_id uuid NOT NULL,
 client_id uuid NOT NULL,
 agreement_id uuid,
 invoice_number text NOT NULL,
 currency char(3) NOT NULL DEFAULT 'USD',
 subtotal_minor bigint NOT NULL CHECK (subtotal_minor >= 0),
 adjustment_minor bigint NOT NULL DEFAULT 0,
 total_minor bigint NOT NULL CHECK (total_minor >= 0),
 amount_paid_minor bigint NOT NULL DEFAULT 0 CHECK (amount_paid_minor >= 0),
 balance_minor bigint NOT NULL DEFAULT 0 CHECK (balance_minor >= 0),
 status text NOT NULL DEFAULT 'draft',
 issued_at timestamptz,
 due_at timestamptz,
 created_at timestamptz NOT NULL DEFAULT now(),
 UNIQUE (tenant_id, invoice_number)
);

CREATE TABLE IF NOT EXISTS invoice_lines (
 id uuid PRIMARY KEY,
 invoice_id uuid NOT NULL,
 service_code text NOT NULL,
 description text NOT NULL,
 quantity numeric(18,4) NOT NULL CHECK (quantity > 0),
 unit_amount_minor bigint NOT NULL CHECK (unit_amount_minor >= 0),
 line_total_minor bigint NOT NULL CHECK (line_total_minor >= 0),
 created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS payment_evidence (
 id uuid PRIMARY KEY,
 tenant_id uuid NOT NULL,
 client_id uuid NOT NULL,
 invoice_id uuid,
 stripe_event_id text,
 stripe_payment_intent_id text,
 stripe_charge_id text,
 receipt_number text NOT NULL,
 amount_minor bigint NOT NULL CHECK (amount_minor > 0),
 currency char(3) NOT NULL,
 verified_at timestamptz NOT NULL,
 verification_source text NOT NULL,
 evidence_hash text NOT NULL,
 created_at timestamptz NOT NULL DEFAULT now(),
 UNIQUE (tenant_id, receipt_number),
 UNIQUE (stripe_payment_intent_id)
);

CREATE TABLE IF NOT EXISTS refund_evidence (
 id uuid PRIMARY KEY,
 tenant_id uuid NOT NULL,
 payment_evidence_id uuid NOT NULL,
 processor_ref text,
 amount_minor bigint NOT NULL CHECK (amount_minor > 0),
 status text NOT NULL,
 verified_at timestamptz,
 reason text,
 created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS consent_records (
 id uuid PRIMARY KEY,
 tenant_id uuid NOT NULL,
 user_id uuid NOT NULL,
 document_type text NOT NULL,
 document_version text NOT NULL,
 consent_text_hash text NOT NULL,
 accepted_at timestamptz NOT NULL,
 method text NOT NULL,
 revoked_at timestamptz,
 created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS security_evidence (
 id uuid PRIMARY KEY,
 tenant_id uuid NOT NULL,
 actor_id uuid,
 event_type text NOT NULL,
 target_type text,
 target_id uuid,
 policy_version text NOT NULL,
 correlation_id text NOT NULL,
 evidence_hash text,
 created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS ix_invoice_balance ON invoices(tenant_id,status,balance_minor);
CREATE INDEX IF NOT EXISTS ix_payment_evidence_client ON payment_evidence(tenant_id,client_id,verified_at);
