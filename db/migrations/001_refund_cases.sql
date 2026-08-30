CREATE TABLE IF NOT EXISTS refund_cases (
  id uuid PRIMARY KEY,
  tenant_id uuid NOT NULL,
  client_id uuid NOT NULL,
  tax_year integer NOT NULL,
  state text NOT NULL,
  last_verified_at timestamptz,
  procedure_version text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS refund_observations (
  id uuid PRIMARY KEY,
  refund_case_id uuid NOT NULL REFERENCES refund_cases(id),
  transaction_code text NOT NULL CHECK (transaction_code IN ('TC_810','TC_570')),
  responsibility_code text,
  action_code text,
  source_type text NOT NULL,
  source_reference text NOT NULL,
  observed_at timestamptz NOT NULL,
  procedure_version text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS refund_work_items (
  id uuid PRIMARY KEY,
  refund_case_id uuid NOT NULL REFERENCES refund_cases(id),
  lane text NOT NULL,
  status text NOT NULL,
  owner_user_id uuid,
  due_at timestamptz,
  approval_required boolean NOT NULL DEFAULT true,
  policy_version text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS idx_refund_cases_tenant_state
  ON refund_cases (tenant_id, state);

CREATE INDEX IF NOT EXISTS idx_refund_observations_case_time
  ON refund_observations (refund_case_id, observed_at DESC);
