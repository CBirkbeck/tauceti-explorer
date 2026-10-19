# Handoff: independent review of field definability

Issue #3567; job `REV-DESIGN-LogicAndDefinabilityInNumberTheoryPartII`; Codex session `codex-SVHNsm`, 19 October 2026.

Completed the independent review and accepted the corrected target-level pass. The packet has 58 individual review entries (45 verified, 13 corrected), 16 verified exact-pin baselines, 69 API items, 54 tests, 29 planets, and independent confirmation of all 17 source issues. All eight stages remain planned, none closed. The report records the source, supplier, audit and validation evidence.

The main corrections are early Rumely formula ownership in FG.0; the distinction between ring finite generation of R_T and κ-algebra finite generation of S_T; a nonzero guard on the dyadic formula; the zero-arity dependence boundary; explicit specialization, approximation and local norm dependencies; and the existing finite-field classification baseline. The reader and roadmap are synchronized. The suggested Lean file is unchanged and compiles at the pins with only the expected proof-placeholder warnings.

The existing node moved from `LogicAndDefinabilityInNumberTheoryPartII:FG.4/global-arithmetic-formulas` to `LogicAndDefinabilityInNumberTheoryPartII:FG.0/global-arithmetic-formulas`. All references in this packet were updated. No references to the old identifier were found elsewhere in the clone. This is the same mathematical target, moved to precede its consumers, not a newly added node. FG.0 now has ten nodes; FG.4 has seven.

The orchestrator should preserve these follow-ups:

- GlobalQuadraticForms currently plans number-field Hasse–Minkowski and excludes characteristic two. Route the explicitly requested global-function-field and nonsingular characteristic-two quadratic extension through that owner or its Part II. Do not mark it supplied by current Layer 5. The nice-tail construction is now a direct consumer.
- A0's formal-étale completion request also serves Poonen's higher-dimensional specializations for positive-characteristic global subfields and relative independence. A curve-only model theorem cannot supply them.
- G-PO now acknowledges the existing all-degree C_i owner Q2.5. Obtain its exact application receipt and route the missing cubic descent and elliptic/Albanese inputs; do not create another C_i foundation.
- Obtain the other eleven supplier contracts at their specified generality, notably number-field approximation off a chosen finite place with archimedean conditions, the degree-three surface/norm adapter, and bounded extension/quotient interpretation codes.
- Keep all seven proof-audit gaps open until their actual evidence arrives. These are final dimension-proof collation, external elliptic/cubic receipts, original Rumely proofs, an odd-degree alteration receipt, surface/norm/adapted-base audits, Nies standardness, and the existing RealAlgebraicGeometry preordering receipt. Acceptance is not source closure.
- Decide the separate functional-transcendence proposal (44 retained routes) and the canonical prime-to-degree alteration owner. Proposed FT stages are not active prerequisites and were not promoted by this review.

Packet validation reports zero errors and warnings. The local prerequisite graph is acyclic, all 52 field-paper routes resolve, and every definition/construction retains at least three discriminating tests. No baseline citation was removed; `FiniteField.ringEquivOfCardEq` was added after reading its exact pinned statement. No new mathematical node or source issue was added. No source file, passage, private path or scratch dependency is included. The submission completes this one review job; the remaining work belongs to the recorded follow-ups.
