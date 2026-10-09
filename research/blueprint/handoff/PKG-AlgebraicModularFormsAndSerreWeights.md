# PKG-AlgebraicModularFormsAndSerreWeights

Completed by Codex (GPT-6), session `codex-VM2rnP`, for issue #7456 on 9 October 2026. The bot confirmed the claim in comment 6071900192. Branch: `codex-VM2rnP-pkg-algebraic-modular-forms-serre-weights`; starting commit: `f91f880fe`.

## Delivered

The package is in `research/blueprint/packages/AlgebraicModularFormsAndSerreWeights/`:

* `README.md` is a 140,487-byte mathematical roadmap retaining the Part II relationship to ModularForms. It gives motivation, scope, conventions and the six ordered layers, grouping closely related targets without dropping any. Each of the 66 targets has its own anchor, mathematical statement, prerequisite paragraph and source theorem/section/page locators. All 72 API items and 64 named tests appear beside their definitions. The final supplier table and proof-requirement paragraphs retain the accepted plan's mathematical dependency obligations. All exposition is authored prose; no source excerpts or source-by-source summaries are included.
* `Suggested.lean` is a 65,890-byte single file with one opening specification note, one Mathlib import block and the accepted mathematical code. A comparison removing comments and whitespace confirms that no mathematical code changed from the input suggested file. Comments now refer to the companion README and mathematical prerequisites rather than packet/review history. The original omission comments remain beside incomplete geometric and Galois templates.
* `metadata.toml` is exactly `topic = "math.NT"` followed by a newline.

| Layer | Targets | API items | Named tests |
| --- | ---: | ---: | ---: |
| R15.1 | 6 | 13 | 12 |
| R15.2 | 14 | 18 | 18 |
| R15.3 | 13 | 19 | 15 |
| R15.4 | 13 | 7 | 7 |
| R15.5 | 14 | 3 | 3 |
| R15.6 | 6 | 12 | 9 |
| Total | 66 | 72 | 64 |

The accepted packet is the source of truth. Its 66 targets supersede the input reader's stale 63-target count. No packet, input reader, input suggested file, atlas data or other job's file is changed. This is a completed package submission, not a checkpoint or a claim of mathematical implementation.

## Validation

* `python3 scripts/check_blueprint.py research/blueprint/packets/AlgebraicModularFormsAndSerreWeights.json`: **0 errors, 0 warnings**; 66 nodes, six planned layers, 72 API items and 64 tests. It also reports 13 gaps, 29 requests and no closed layers, as in the accepted plan.
* `lean-check research/blueprint/packages/AlgebraicModularFormsAndSerreWeights/Suggested.lean`: **exit 0, no errors, 160 warnings**, all `declaration uses sorry`. The final check used the submitted file, with 111 GB available memory and no second Lean invocation by this worker.
* Final Lean SHA-256: `72ea55a6d73250357977020fe553d1fdb9adc2802079d399d4c5b36c918d6fd2`.
* Structural checks confirm every accepted target anchor, API declaration name and test name; 66 source and prerequisite paragraphs; unique anchors and resolved internal links; unchanged mathematical Lean code; one import block; and the exact single-line TOML. The README is within the size bound and contains no programme-process terminology.
* The four deliverables are checked with `python3 research/blueprint/intake.py check-files`, and whitespace is checked with `git diff --check` before submission.

The shared build's Mathlib is exactly `082e2d37e8b0463410cdb532e111cd43d5a66174`. Its Tau Ceti checkout is `cf386627e9176a3827c1a5fe804989fd94a4d216`, newer than the recorded baseline `f790474821cf4256814db967cb154e7af3d0c369`. The suggested file imports only Mathlib and consumes no Tau Ceti module, so its successful elaboration is at the pinned Mathlib and does not depend on that newer checkout. No dependency build, cache download, language server or private Lake project was used.

All eight baseline declarations were read at their exact recorded pins: `Algebra.adjoin_le`, `Algebra.HasGoingDown.of_flat`, `Ideal.exists_ideal_le_liesOver_of_le`, `TauCeti.integralClosure.isDedekindDomain`, `IsArtinianRing.isNilpotent_jacobson_bot`, `IsArtinianRing.localization_artinian`, `Module.mem_support_iff_of_finite` and `TensorProduct.AlgebraTensorModule.map_tmul`. In particular, the Tau Ceti integral-closure result does not require separability and does not assert module finiteness of the closure. The R15 library-coverage audit and neighbouring-roadmap boundaries were inspected. SemisimpleAlgebras and Multiquadratic were the two upstream roadmaps read in full; the RepresentationTheory index was also read.

Public copies of all 13 bibliography sources matched the accepted source SHA-256 values. Selected relevant text was checked in Deligne–Serre §§6.9–6.13, Katz §§1.7–1.8, Calegari–Geraghty's coherent Hecke/boundary/duality/doubling discussion and Edixhoven's theta and supersingular discussion. The Edixhoven author DVI was inspected through extracted Latin text; the extraction does not reproduce every displayed mathematical glyph. The README distinguishes author-file, DVI, PDF-local and printed pagination. These checks do not claim a fresh complete reading of all 13 works or closure of the inherited source gaps. No private-library book was needed, and no source file or extracted passage is submitted.

## Input discrepancy and notation reconciliation

The accepted Hasse test `TauCeti.ModPModularForms.hasse_no_level_one_lift_p2` says that A lifts only at the specified odd levels between 3 and 11. The associated target also permits pullback to levels divisible by the listed small levels. The word "only" consequently overstates the test. The README gives the supported nonlifting assertion at level one, the small-level lifting range and the pullback cases separately. The input packet and Lean example are untouched; the suggested example asserts the level-one fragment. Review or a subsequent plan correction should reconcile that test wording in the packet.

The README uses I_p for full inertia and P_p for wild inertia. Its wild recipe takes D=V^{P_p}; the input API's shorthand D=V^{I_p} follows the source's older wild-inertia notation and must not be interpreted as fixed vectors under full inertia. Katz's source notation S(K,n,k) is holomorphic, whereas this roadmap reserves S_k for cusp forms. The coefficient maps and supersingular spaces are correspondingly distinguished.

## Mathematical boundaries retained

* Integral reduction is an actual image, with cusp H¹-torsion, stabilizer and integral character-projector conditions. It is not all Katz forms. The prescribed Hasse shift must enter that image before Deligne–Serre can be applied. Integral geometric Hecke uses the stated fine-level/weight range; the level-one consequence is separate.
* Curve Fricke, its Hodge-power scalar and the root-dependent supersingular operator are different interfaces. The logarithmic Kodaira–Spencer target first includes det(D), then uses its cup-product trivialization. With q=t^n the differential normalization includes n.
* The full boundary has characters ψ₁+ψ₂ℓ^{k−1}, with ψ₁ψ₂=ε. The infinity-orbit formula 1+εℓ^{k−1} is not asserted for all cusp types. This preserves the accepted correction of Calegari–Geraghty Remark 3.4.
* Theta eigensystem statements require θf≠0. V is coefficient-linear, distinct from absolute Frobenius. The arbitrary-prime theta tables and the p=2,3 tables remain explicit. Supersingular fibres may have negative weights; their Hecke-twisted weight-(p+1) map and weight-(p²−1) periodicity are kept separate. Relative K/O duality requires its DVR hypotheses.
* The full extension class and the ordered wild line are retained in the Serre recipe. The unconditional dyadic numerical dichotomy is k=2 or 4; its tame-niveau-two finite-flat interpretation still requires descent at the Raynaud boundary e=p−1. The Fontaine–Laffaille comparison uses contravariant U_S, HT(χ_cyc)=+1, α=0 and β=r, with p≥3 and 1≤r≤p−2.
* Abstract eigenvalue lifting allows an inseparable L/K, even when K has characteristic two, and does not require its dominating DVR to be finite over O. It lifts eigenvalues, not a prescribed residual vector. The modular-form application instead selects a characteristic-zero coefficient place. Normalization, primitive level and bad-prime data require their analytic interfaces.
* Residual witnesses require actual attachment, stable lattices, coefficient places and semisimplification comparisons. The final classical target uses the classical weights p and dyadic 4 where specified. Its universal proof belongs to ClassicalSerreModularity; minimization belongs to R20.3–R20.5, rather than this package.

The 13 inherited gaps remain precise mathematical supplier obligations: pinned algebra API integration; dyadic tame finite-flat descent; geometric/stack carriers; all-prime denominator/model comparison; Gross's torsion weight-one operator; theta-cycle and exceptional small-level proof inputs; Ribet's bad-dihedral input; character lattice and Hasse shift into the reduction image; extension-sensitive Fontaine–Laffaille classification; q-expansion formal-functions and proper base-change inputs; strong q-expansion coefficient reduction and characteristic-zero constant vanishing; Eisenstein/Bernoulli integrality; and the simple supersingular divisor with finite eigensystem support. The supplier table and adjoining proof requirements specify their consuming layers. Packaging closes none of them.

## Remaining work and where to resume

No package assembly work remains. Independent package review should compare the six README layers with the accepted packet and original suggestions, inspect the boundary conditions above, check the Hasse-test discrepancy and rerun `lean-check` on the submitted file. The incomplete geometric/Galois templates follow the protocol's explicit omission rule: their complete mathematical hypotheses are in the README, and their elaboration is not evidence that arbitrary presheaves, maps, series or representations satisfy those theorems. All continuation-relevant notes and public source locators are committed here or in the README. Scratch downloads, extraction tools and compiler logs are disposable and are deleted after the pull request opens.
