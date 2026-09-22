# PAPER-HACON-WITASZEK-23 handoff

Partial checkpoint for issue #1369 by Codex, session codex-a71f92.

## Completed

The published 35-page paper was read fully; pages 5, 6, 12, 13 were inspected as images. The result contains 156 items, 353 acyclic dependency edges, 44 API/use/test-bearing definitions or constructions and 132 unexecuted planning tests. Statuses: 10 library, 5 planned, 141 missing; all missing items routed exactly once.

Selected primary proofs were read in AHK07, BMPSTWW v3, Wit21b, dFH11 and Stacks. The result's readingLog gives precise boundaries and SHA-256 hashes. The preceding PAPER-WITASZEK-22 partial audit is reused without upgrading its status.

Repository paper checker and custom dependency/route/API checks passed. No Lean file or formalization claim.

## Resume here, in order

1. Read the report's explicit A1 chart computation. It diagnoses both the published Lem2.2 canonical-index clause and unrestricted Lem2.16. Verify the appropriate corrected **log-index** lemma and the precise **fixed-boundary** surface statement needed for Prop2.15. Do not retain the false unrestricted statement.
2. Compare AHK07 Def2.3 with published p12: ordinary a=−b changes the first-sum condition to b≥0; fix w/W domains. Close invariance, nonnegativity and decrease in positive/mixed characteristic. AHK is over C.
3. Repair Lem6.6's local-to-global and characteristic transfer. dFH11 Prop3.1 is near the Cartier divisor; the projective application needs a properness/openness argument. Keep Cor6.7 guarded.
4. Repair the actual-Picard-lift step in Thm6.1(2b), which assumes only rational N¹ surjectivity. Lem6.5 can be used only with completeness and H²(O)=0.
5. Close the section-extension proof leaves: Bhatt finite-cover killing, Popescu/henselization, Matlis/derived-local-cohomology comparisons, finite traces, F-different and divisorial S₃. Preserve classwise versus uniform finite-cover killing.
6. Split the lower-threefold supplier into exact Tanaka/DW/HNT/BMP cone, BPF, finite-generation and termination contracts. Read ABL22 and Ber21 for the precise characteristic bound and Cartier-index descent.
7. Finish §5: general-coefficient dlt modification after perturbation, Wit21b Thm1.2/CT20 corrected proofs, Keel Cor2.9/NT20 connected gluing, F-Bertini, and the N¹-generation argument left to the reader in Claim5.5.
8. Read GNH19 §3's exact quasi-resolution definition, CR12 Cor4.5.1, BBE07 singular low-slope comparison and NT20/GNH19 Witt ideal/vanishing results. The quasi-resolution item is intentionally not an invented expanded definition.
9. Finish formal/deformation inputs: Hartshorne obstruction, Stacks dependencies, ABL CM/rationality and base-change details. Check flatness and invertibility after algebraization.
10. Refresh live atlas/packets and repeat pinned declaration matching for newly exposed inputs. Only mark complete after the frontier really closes.

## Ownership to preserve

Reuse pending `SchemeAndStackFoundationsMixedCharacteristicPositivity` (PAPER-WITASZEK-22) and `NumericalPicardAndContractionDescent` (PAPER-SCHROER-23). They are not accepted suppliers yet and remain missing.

The proposed new birational Part II is `SchemeAndStackFoundationsMixedCharacteristicBirationalGeometry`. It imports generic SF/Adic/Moduli/DDP/AnalyticStacks tools. The separate `CrystallineCohomologySingularWittRationality` Part II owns singular rational-Witt cohomology, not the birational MMP itself. Independently review both boundaries.

Do not replan Tau Ceti upstream layers, the existing Witt carrier, derived category, Ext-colimit local cohomology or regular-sequence theorem.

## Validation

Run the paper checker, then check all item/gap/source IDs, DAG acyclicity, exactly-one missing-item routing and API/use/three-test coverage. Current checker blob: cf3cae9e7d2d41209bf9fa4d719fd6fe17a69f1f.

The PR ends the claim. No manual merge, label change, issue closure or unclaim of submitted work.
