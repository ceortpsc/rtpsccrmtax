-- Read-only verification/reporting queries. Execute against a test/staging database after migrations.
-- 1) Duplicate tenant usernames
SELECT tenant_id, username, COUNT(*) FROM employee_accounts GROUP BY tenant_id, username HAVING COUNT(*) > 1;

-- 2) Duplicate invoice numbers
SELECT tenant_id, invoice_number, COUNT(*) FROM invoices GROUP BY tenant_id, invoice_number HAVING COUNT(*) > 1;

-- 3) Negative / impossible balances
SELECT id, invoice_number, total_amount, status FROM invoices WHERE total_amount < 0;

-- 4) Stripe events not processed
SELECT stripe_event_id, event_type, created_at FROM stripe_events WHERE processed_at IS NULL ORDER BY created_at;

-- 5) Payment references without evidence
SELECT p.id, p.stripe_payment_intent_id, p.status
FROM payments p
LEFT JOIN payment_evidence e ON e.stripe_payment_intent_id = p.stripe_payment_intent_id
WHERE p.status IN ('succeeded','paid') AND e.id IS NULL;

-- 6) Collection cases with non-positive target balances
SELECT id, balance_at_open, stage FROM collections WHERE balance_at_open <= 0;

-- 7) Active role assignments missing approval
SELECT id, user_id, role_code FROM role_assignments
WHERE status='active' AND approved_by IS NULL;

-- 8) Refund cases stale beyond configured threshold (example: 24h)
SELECT id, client_id, status, last_verified_at
FROM refund_cases
WHERE status NOT IN ('resolved','closed')
AND (last_verified_at IS NULL OR last_verified_at < now() - interval '24 hours');

-- 9) Missing policy version on audit events
SELECT id, event_type FROM audit_events WHERE policy_version IS NULL OR policy_version='';

-- 10) Payment allocations exceeding payment amounts
SELECT p.id, p.amount,
       COALESCE(SUM(a.amount),0) allocated
FROM payments p
LEFT JOIN payment_allocations a ON a.payment_id=p.id
GROUP BY p.id,p.amount
HAVING COALESCE(SUM(a.amount),0) > p.amount;

-- 11) Training completions without assessment evidence where required
SELECT e.id, e.user_id, e.course_id
FROM training_enrollments e
LEFT JOIN assessment_results r ON r.enrollment_id=e.id
WHERE e.status='completed' AND r.id IS NULL;

-- 12) Evidence records without correlation IDs
SELECT id,event_type FROM audit_events WHERE correlation_id IS NULL OR correlation_id='';

-- 13) Receipt uniqueness
SELECT receipt_number, COUNT(*) FROM payment_evidence GROUP BY receipt_number HAVING COUNT(*) > 1;

-- 14) Tenant isolation smoke query: all application reads should include tenant_id predicates.
-- This query is a review aid, not an automatic proof of application-layer isolation.

-- 15) Release readiness summary
SELECT
 (SELECT COUNT(*) FROM audit_events) AS audit_events,
 (SELECT COUNT(*) FROM stripe_events) AS stripe_events,
 (SELECT COUNT(*) FROM invoices) AS invoices,
 (SELECT COUNT(*) FROM payments) AS payments,
 (SELECT COUNT(*) FROM collections) AS collections,
 (SELECT COUNT(*) FROM refund_cases) AS refund_cases;
