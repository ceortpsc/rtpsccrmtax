export type RefundHoldCode = "TC_810" | "TC_570";

export type RefundCaseState =
  | "NEW"
  | "EVIDENCE_REQUESTED"
  | "EVIDENCE_RECEIVED"
  | "REVIEW"
  | "REMEDIATION_READY"
  | "APPROVAL_REQUIRED"
  | "SUBMITTED"
  | "AWAITING_RESPONSE"
  | "MONITORING"
  | "RESOLVED"
  | "ESCALATED"
  | "CLOSED";

export type RemedyLane =
  | "MONITOR"
  | "REQUEST_INFORMATION"
  | "CORRECT_RETURN_REVIEW"
  | "NOTICE_RESPONSE_REVIEW"
  | "IDENTITY_REVIEW"
  | "REFUND_TRACE_REVIEW"
  | "TAS_ELIGIBILITY_REVIEW"
  | "PRACTITIONER_ESCALATION";

export interface RefundObservation {
  caseId: string;
  taxYear: number;
  transactionCode: RefundHoldCode;
  responsibilityCode?: string;
  actionCode?: string;
  observedAt: string;
  sourceType:
    | "AUTHORIZED_TRANSCRIPT"
    | "OFFICIAL_NOTICE"
    | "AUTHORIZED_API"
    | "PRACTITIONER_ENTRY";
  sourceReference: string;
  procedureVersion: string;
}

export interface RefundDecision {
  lane: RemedyLane;
  rationale: string;
  confidence: "LOW" | "MEDIUM" | "HIGH";
  requiresHumanApproval: true;
  policyVersion: string;
}
