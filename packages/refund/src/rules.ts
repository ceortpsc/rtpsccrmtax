import type { RefundObservation, RefundDecision } from "./types";

export function classifyRefundObservation(
  observation: RefundObservation
): RefundDecision {
  return {
    lane:
      observation.transactionCode === "TC_810"
        ? "NOTICE_RESPONSE_REVIEW"
        : "PRACTITIONER_ESCALATION",
    rationale:
      "A transaction-code observation requires surrounding account context, notice review, and the current applicable IRS procedure before remediation is selected.",
    confidence: "LOW",
    requiresHumanApproval: true,
    policyVersion: observation.procedureVersion,
  };
}
