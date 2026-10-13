# Handoff: BP-ModularCurvesPartII--R13.4b

Codex, session `codex-4rkG2e`, completed the target-level planning pass for issue #9426 on 13 October 2026. The claim was confirmed before work began. This is a complete blueprint submission under PROTOCOL §0, with all nine stages planned and explicit remaining obligations. It is not a closed mathematical plan, an implementation or an independent review of this submission.

The deliverables are the [packet](../packets/ModularCurvesPartII--R13.4b.json), [reader](../readmes/ModularCurvesPartII--R13.4b.md) and [suggested Lean file](../suggested/ModularCurvesPartII--R13.4b.lean). The scope is exactly R13.4b, R13.5, R13.6 and R14.1–R14.6. All coverage records have status `planned`; none is `closed`.

## Canonical ownership and completed work

Every required target already has a canonical node in one of two independently accepted packets. The [R13.3 packet](../packets/ModularCurvesPartII--R13.3.json), accepted by independent review on 13 October 2026, supplies 32 targets in this scope. The [R14.3 packet](../packets/ModularCurvesPartII--R14.3.json), accepted on 11 October 2026, supplies 43. The packet records the accepted review identities, full byte hashes and exact node inventories. It creates zero new nodes and imports all 75 existing targets; creating copies with new IDs would duplicate their mathematical ownership, while reusing their IDs as new nodes fails the duplicate-node check. The reader states the complete corrected target specifications, hypotheses, proof routes, uses, named interfaces, unit checks and source locators. Earlier reader documents predate some review corrections, so use this reader when assembling these stages.

The imported inventory comprises 34 theorems, 20 constructions, 11 comparisons, six applications, three definitions and one lemma. Definitions and constructions have 136 API items and 91 unit checks. There are 36 canonical planets: zero in R13.4b, five in R13.5, two in R13.6, five in R14.1, four in R14.2, five in R14.3, six in R14.4, four in R14.5 and five in R14.6. The new packet retains nine gaps and 44 external supplier requests. All imported implementation statuses remain unchecked.

Twenty-four `dependencyResolutions` specify exact existing nodes in place of broad local R13.5, R14.1 and R14.2 prerequisites. These are assembly contracts and do not edit the canonical packets. In particular, the R14.2 Jacobian/Tate carrier and action prefix precedes the rational rank-two consequence in R14.3. Applying these resolutions gives an acyclic dependency graph; an integral rank-two or freeness assertion must not be inserted into that prefix. The import inventories, resolutions, supplier contracts and statistics are durable in the packet and require no scratch files.

## Restructuring and transfers

Accepted RS-06 supplies the title, base and ownership boundaries. The base is TauCetiRoadmap’s ModularCurves, including its existing affine and prime-level compactification constructions. Preserve R13.4a → R12.3 → R12.6 → R13.4b. R13.4 is a process aggregate and supplies no mathematics. The cyclic modular polynomial remains with the earlier R12.6/R13.4a owners; ComplexMultiplicationAndExplicitReciprocity supplies Kronecker’s congruence. The full-subgroup and cyclic correspondences retain different repeated-prime degrees and boundary formulas.

R13.6 imports the four lower LPV.7 semistable-curve nodes and R14.6 imports the lower R11.3/R11.4 Tate and graph interfaces. There is no upward Weights R34.3 prerequisite. The two-added-prime level-lowering case retains the quaternionic pivot obligation described below. SF.2 requests the precise finite/local-coefficient étale–Betti theorem represented by RS-06’s unresolved upstream label; DifferentialGeometry’s real de Rham comparison does not supply it.

Confirmed finding **RT-AREA-langlands-2/9** is handled by the packet’s explicit R14.6 → AutomorphicGaloisRepresentations:R19.1 link and the reader’s ownership statement. R14.6 owns the weight-two special-fibre Eichler–Shimura identity. R19.1 must import it to deduce the good-prime characteristic polynomial and retain its genuinely higher-weight Sym^(k−2)/Deligne congruence. No R19 files were changed because they are outside this issue’s deliverables. The packet preserves this transfer for the owner and assembly worker.

## Checks and source discipline

Nineteen actual baseline declaration statements were personally read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Exact external node contracts were read rather than inferred from titles. Current TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were checked read-only. JacobianChallenge and UniversalCovers were read in full; relevant ModularCurves/ModularForms layers and the nine post-snapshot roadmaps, including nested OperatorTheory files, were screened. Existing symmetric-power bundles, twisted singular coefficients, Tate data and group-ring algebra are credited to their existing owners.

The packet has 17 distinct source records, with precise read sections and version hashes where bytes were available. The relevant public proof passages were read, including the full ordinary-locus proof of Conrad’s weight-two identity, Edixhoven’s local resolutions, both CDT preprint and published proof routes, the two Calegari–Geraghty copies, Serre’s real-place CSP specialization and Taylor–Wiles Proposition 1. Formulas obscured by PDF extraction were checked visually. No restricted library book was used or copied. No source passage or source-section summary is included in the deliverables.

The ten source issues are inherited with their independent-review provenance. E1 corrects Gross–Zagier’s omitted ordinary mixed singularities. E2–E5 retain the corrected scalar rigidification, cyclic/full degree distinction, polygon domains and effective stabilizers. E6 uses Conrad’s cyclotomic components modulo sign and unrestricted residue lifts. E7 separates the finite proper Tate map from its flat smooth-locus restriction, using node length 2m−1. E8–E9 retain the corrected determinant sign and Lyndon degree sequence. E10 uses the level-5 F₅ term and records the proof gap in the small-level computation. These are preserved findings, with no new novelty claim. The unavailable publisher correction text and Conrad journal version are not claimed read. Serre’s CSP PDF was read through the web PDF renderer; a direct byte request returned an access page, so no new byte hash is claimed.

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/ModularCurvesPartII--R13.4b.json`: zero errors and zero warnings, nine planned stages. Its new-node count is zero; the imported inventory is 75.
- `python3 research/blueprint/intake.py check-files` on the four deliverable paths: passed.
- A separate import audit checked both accepted packet hashes, all 75 target IDs, exact reader statements/hypotheses/acceptance checks/locators, all 136 API and 91 test entries, the 24 resolutions, graph acyclicity, stage/request terminals and planet bounds.
- Arithmetic negative controls checked HNF degrees at 1, 4, 6 and 9, level-12 exact divisors, node fibre lengths, split-Cartan genus/ramification formulas and a characteristic-two polynomial certificate. The reader includes an explicit geometric smoothness argument for the first Baran quartic at 2, rather than testing only rational points.
- `lean-check research/blueprint/suggested/ModularCurvesPartII--R13.4b.lean`: exit 0 at the pins. The file has 256 lines and only 23 `declaration uses sorry` warnings. Its definitions have real bodies over existing carriers; missing geometric constructions are reader targets. This is a signature prototype, not formalized mathematics.
- `git diff --check`: passed.

## Remaining obligations and where to resume

The packet’s `gaps`, `requests` and each coverage record’s `remaining` list give exact consuming nodes and supplier statements. Follow-ups must preserve these distinctions:

1. Compute wild coarse interior invariant rings, multiplicities and resolutions at level-dividing 2 and 3. The fine rigidified one-p-factor uv=p statement is a separate valid input.
2. Supply the relative curve norm and canonical principal polarization over ℤ[1/N]; a field Jacobian alone is insufficient.
3. Construct the integral weight-two cuspidal-symbol boundary kernel modulo torsion and compare its actual Hecke action with compact H₁ or transposed dual H¹. The existing full-symbol period quotient is not this theorem.
4. Prove the higher-weight integral boundary eigensystems, residual-ideal vanishing and lattice/saturation comparisons. For ℓ≤r use a justified divided-power/dual lattice or retain the stated conditional range.
5. Decompose the central Mennicke-symbol/congruence-kernel and Moore/class-field input to Serre’s S-arithmetic CSP specialization.
6. Close the principal-level tree fundamental-edge and enhanced congruence-invariance proof chains, including strong approximation, continuous cohomology, Hochschild–Serre/Künneth/Lazard inputs and reproducible level-8/16 calculations.
7. Supply the integral quaternionic J′_(pq) character sequence through the specific Cerednik–Drinfeld identification. A rational old/new isogeny does not remove its finite cokernel or component-group obligations.
8. State and source any requested Ihara extension beyond the exact compact constant-coefficient Γ₁ characteristic-zero range. That range includes ℓ dividing N and has no exceptional-image hypothesis; Γ₀ has a Shimura-subgroup kernel.
9. Integrate the already existing current Tau Ceti local finite-p-group group-ring locality and augmentation implementation when updating the pin. Do not prove it again.

This submission awaits an independent review. During assembly, retain canonical IDs, apply the recorded dependency resolutions, use the synchronized reader and keep the nine gaps and 44 supplier contracts visible until their exact inputs are supplied.
