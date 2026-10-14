# Handoff: REV-PKG-CrystallineLocalGlobalCompatibilityCM

Issue #7481. Codex session codex-pxk5UX, 2026-10-14. Independent of the package author, Codex session codex-OOPgkr. **Complete review; accepted after fixes.** No second job was claimed.

## Delivered

- Review report: `research/blueprint/reviews/REV-PKG-CrystallineLocalGlobalCompatibilityCM.md`.
- Accepted verdict: `research/blueprint/packages/CrystallineLocalGlobalCompatibilityCM/review.json`.
- Corrected the package README and representative Suggested.lean. Metadata already has the required single line `topic = "math.NT"` and was left unchanged.
- The accepted packet is untouched. All 97 targets, 103 packet API names and 104 named checks remain.

## Fixes and ownership decisions

Integral dual Weyl coefficients and Levi splitting consume PotentialAutomorphyInfrastructure §§0.4–0.5, with §§0.3 and 0.9 supplying the dictionary/retract. Removed the unassigned ReductiveGroupsIntegralRepresentationsPartII dependency. Smooth monoid categories consume the parent's §3.2 SmoothMonoidModules, while SR supplies the group category and derived invariants. These suppliers are lower-tier owners; no generic theory was moved into this extension.

Current IHG has the §0.7 target “Algebraic induction” and §1.6 “Local lifts compatible with global quotient reconstruction”, rather than the package's proposed Lean declaration names. The mathematical contracts are retained, including torsion A and finite-flat auxiliary B in the arithmetic application. Corrected ACC+ Theorem 3.4.2 to Theorem 2.4.2 and Corollary 2.4.4 to Theorem 2.4.4.

Strengthened compact support by admitting the characteristic function of Z_p and rejecting constant 1 on the longest GL₂ Borel cell Q_p. Replaced “zero coefficients” by zero selected weights with trivial R_m. Added the inverse-orientation residue witness 2⁻¹=3 mod 5 and a closing Lean inventory of absent arithmetic definitions/constructions.

Duplication audit used current upstream **0d144d044dacebca17b654695b6f1ad58f159b27**, all nine newer roadmaps and the four specified Completed roadmaps, and current Tau Ceti **a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039**. No further owned-target removal was required. General induction, Bruhat theory, cohomology, stable-image/localization, Artin–Rees and determinant reconstruction remain boundary deferrals. Parent Borel-chart induction and this package's P-double-coset/right-P variants are distinct. Read the current discrete trace declarations used for degree-zero transfer.

## Source and mathematical checks

The reproducible fifteen-locator sample uses `random.Random(7481).sample(packet["nodes"], 15)` on the accepted packet's node order; its full list and results are in the report. CN v3 and AKT v2 statements/proofs were opened directly. Checked Jantzen I.3.3–3.7, pp.38–41 in the cleared 2003 book; no copy or excerpt was made. Checked Gee Lemma 3.7, Kisin Lecture 1 Theorem 1.4.1, DDT Theorem 2.47(b), NT Proposition 2.10/Corollary 2.11, CG Lemma 6.2, Emerton Lemma 2.1.10, Hauseux Lemme 3.3.1, ACC+ coefficient/localization, length and solvable-descent statements, and AKT Appendix A.4–A.6.

The original Cab84 main theorem and Ger19 §5.2 were inaccessible; this is explicitly marked as a historical-reference source gap in the README. The precise required P-stability assertion is sourced to CN Lemma 4.2.3 and proof, p.60, rather than an unchecked Cab84 proposition number. The final ordinary hypothesis is sourced to CN Theorem 5.2(5b), p.74. Further original page-level collation belongs with the suppliers; it is not claimed complete or hidden behind acceptance.

The report records the adversarial pass across every layer, including inverse rescaling, integral transfer, all-unit ordinarity, actual adic images, odd degree bounds, torsion Hecke reduction, local corner continuity, special-fibre generic points and diamond augmentation. The characteristic-seven tetrahedral negative control was independently computed: group order 24, determinant order 3, projective order 12, determinant kernel order 8/projective order 4; all 16 outside-kernel elements satisfy the trace-square hypothesis. Anticommuting invertible quaternion generators exclude a common eigenline over every characteristic-seven extension. The final lifting theorem remains qualified by the cubic tetrahedral exclusion.

## Validation and next step

- Initial and final `lean-check` exited 0 at the atlas pins. Final output has only 24 `sorry` warnings, four theorems and twenty examples. Suggested.lean is 313 lines, with nine real definitions and no admitted data.
- All definitions/constructions have at least three README checks and appear in Lean or its closing inventory. All thirteen definition/theorem signatures were checked against their README contracts.
- `intake.py check-files` on the six deliverable/handoff files: zero problems. Packet validation: zero errors and warnings. JSON, metadata and `git diff --check` pass.

No checkpoint work remains. Submit the accepted package as a draft upstream PR through the maintainer's normal process; retain all exact supplier contracts and the documented source boundary. The review report contains the durable evidence needed after scratch cleanup.
