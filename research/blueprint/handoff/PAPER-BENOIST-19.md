# PAPER-BENOIST-19 handoff

Partial checkpoint for issue #1454, Codex session `codex-a71f92`.

## Done

The entire published 48-page paper (pp.63–110, DOI10.1007/s10240-019-00108-7) is read. JSON has151 items:8 library,8 planned,135 missing.132 missing items have exactly one route;66,67,149 are deliberately unrouted gates. All61 definitions/constructions have APIs and at least3 tests. The report explains10 routes, exact conventions, source hashes/read boundaries, owner/library audits and source-proof concerns.

Two upstream READMEs fully read: QuadraticFormInvariants and HodgeStructures. Targeted supporting proofs read in Benoist2018, BW1 and Voisin2006; see sourceLedger, not an assertion of full supplementary-paper reading.

Catalogue snapshot1c16a3cd24b5b8e55dee3f5ef2fef8dd054bee96; final recheck5a2df16e0b15e326e1adf3e6999e2fd3e32b73bd. Final check found BKT20's partial Hodge proposal and D3's general variation definition. Item151 now imports ShimuraData:D3; the Hodge route uses BKT20's SAME proposed DegeneratingHodgeStructures ID/title. It remains a proposal, not accepted planning. Charles remains partial and is a coordination lead only.

## Resume in this order

1. Re-claim through WORKERS, wait for confirmation of your own comment, reread issue/rules and refresh main. Do not treat this submitted checkpoint as a live claim.
2. Start at G4b, Proposition4.5, published pp.84–85. Its α̃ has mod2 coefficients but is added to integral classes. Read/reconstruct a cochain or derived proof; do not assume an integral lift on U. Handle the extra curve-class adjustment in Assumption4.1(ii). Find an authoritative correction if available; none was located in the limited author-page/erratum checks.
3. Read Jannsen p.268 and the injective-complex replacement input, then type-check(4.3)–(4.5), item149/G10.
4. Resolve G4a for general Ψ⊃Θ in Proposition4.4. The formula retains the factor[α̃]0. Ψ=Θ avoids this particular mismatch in the main sufficiency application, but does not repair G4b.
5. Finish the §7 sign/derived-diagram audit: carry the minus sign in Lemma7.3 through §7.5; verify reduction on the two truncated degrees in Lemma7.5 rather than trusting the printed(0,1) labels.
6. Verify G1's finite-flat Stein-factor/partial-resolution comparison and every use of finite-map Leray. Complete the compatible β choice, period induction, local-parameter determinant and generic-point sign details G2/G5/G6/G9.
7. Extract the unread prerequisite proof interiors in the JSON ledger. In particular Pfister1982 Proposition9, Scheiderer comparison, Nash/Bröcker, the Enriques Picard/halves inputs, and the real-component Brauer realization remain substantive gaps. Their proofs can introduce more inventory items.
8. Reconcile generic Hodge, K3 and Brauer-source proposals with the latest accepted atlas. Retain D3 for the variation definition, C5 for comparison/Gauss–Manin, MC2 for cycle maps and MC7 for early divisor algebraicity. Separate early QF inputs from late u-invariant outputs to keep the dependency graph acyclic.
9. Only when the full source/proof inventory and every missing item have exact routes, set complete. Run check_paper and scope checks. A paper job has no Lean deliverable.

## Validation

The paper checker passes; independent structural checks cover IDs, source hashes, planned layer membership, route cardinality, APIs/tests and exact gap/reference consistency. The mathematical tests are planning tests, not Lean proofs. No formalization or Lean compilation is claimed.

Public deliverables are only the JSON, report and this handoff. No other issue's files were edited.
