# PAPER-GILLE-PARIMALA-26 continuation checkpoint

Codex — codex-a71f92; issue #1197; 22 September 2026. Builds on codex-c83e7a's checkpoint.

148 items: 7 library, 4 planned, 137 missing. Ten routes cover 133 missing plus one planned item; all 42 definitions/constructions have an API and three tests. Keep `status: partial`. Four assertions remain unrouted: 37, 55, 56, 76.

## Newly completed

Read the full author manuscript again and the publisher's publicly exposed final Appendices A and B. The final main body remains inaccessible. Acquired CTS79's original GDZ scan and read printed pp. 109–110 and 127–130 with proofs. This discharges G4, but with an explicit correction: U must contain all codimension-at-most-one points (or retain the integral-surface hypothesis), and the affine quotient must represent the fppf sheaf quotient. X=A²_R disjoint union Spec R with G=PGL_2 is the counterexample to dropping the codimension-zero condition. Main integral-model use is unaffected. Do not reopen G4 just because no separate flatness of G is imposed: the recorded proof uses affine sheaf-quotient reduction and never infers quotient-map flatness.

Items 129–138 extract module reflexivity, Hartogs, coherent reflexive extension, local freeness, vector-bundle extension, affine Isom uniqueness and the reduction-section construction. Reuse Mathlib Module.IsReflexive. The local freeness corollary belongs to DeformationAndDerivedPatchingAlgebra:R03.3, whose accepted decomposition already owns depth/Auslander–Buchsbaum. Import R03.3 → SF.0 → SF.1; avoid a purity/vector-bundle dependency cycle.

Read all ten pages of HHKP20 v3. Items 139–148 give the precise nontrivial T-valuation family, rank bound/coarsening, smooth henselian descent, infinite quadratic transforms, henselization colimits, finite bad-point sets and termination. HHKP Theorem 2.5 uses all rank-one T-valuations, not only discrete ones; this subfamily already suffices for flags. Do not assume all residue fields along the blow-up chain coincide: use their colimit. Artin approximation from HHKP Proposition 2.3(b) is not required by this proof.

Source URLs, hashes, exact read scopes, corrected statements and attribution are in JSON/report. CTS79 was not read in full; HHKP20 was. Main-paper and both new-source hashes were checked.

## Resume here

1. G1 item 37: obtain final main-body Proposition 3.3 wording to compare the author's V/V derivative typo. The corrected V/W theorem is already routed and justified.
2. G2 items 55–56: acquire Kaletha–Prasad Proposition 2.14, Harder torus approximation and Tits normal-subgroup hypotheses in the exact possibly imperfect/infinite residue scope. Preserve closure bars, power subgroups and the F1-isotropy distinction. Optional Proposition 3.11 is not needed by the main flag theorem.
3. G3 item 76: compare the final Tits-index wording. Correct Delta_0 is stable closure of the union of the local minimal types, not the smallest stable subset contained in all local types.
4. Continue the prerequisite ledger: HH field/model patching, HHK completed-patch spreading, PS elementary independence, Kneser–Tits R comparison, Lipman 1978 SNC resolution, MPW flags, CGP restriction/fixed loci, Raghunathan Lie span, GP1 gluing, Margaux limits, SGA3 and orbit quotient. New explicit HHKP antecedents are Lipman **1969** Theorem 26.2 and smooth henselian implicit-function descent; their original proof interiors are not yet certified read.

Do not confuse a downloaded paywall rendering with the article. Final appendices, unlike the main body, were actually accessible. The errata's geometric series is rational; retain the factorial-pole witness and coefficient recurrence. Complete the local ring before loop arguments. Keep arbitrary residue fields and inseparable Weil restriction.

The candidate ReductiveGroupsPartIISemiglobalFlags is proposed, not accepted. Recheck live routes before continuing. Only this job's JSON, report and handoff are submitted; no Lean deliverable or compilation. Schema, routing, API/test, source-hash and focused exact-boundary checks pass.

