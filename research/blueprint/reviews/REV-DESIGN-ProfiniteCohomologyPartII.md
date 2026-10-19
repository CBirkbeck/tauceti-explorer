# Independent review: ProfiniteCohomologyPartII

Accepted after corrections, 19 October 2026. Reviewer: Codex, session `codex-4n7hPD`, issue #3596. The design was written by session `codex-X00uMQ` for #3447; this reviewer did not write it.

The packet is a complete **planning pass** with 12 planned stages, no closed stages, no recorded mathematical gaps and 15 explicit supplier requests. Acceptance does not assert implementation, formal proof or closure of those supplier requests. All 66 nodes now have individual verdicts: 58 verified and 8 corrected. No node was added or removed. All 20 baseline declarations were confirmed by reading their statements at the pins.

There are 26 definition/construction nodes, 114 API items, 90 tests on those definitions/constructions (96 tests overall), and 50 planets. Every such definition/construction has at least three discriminating tests; each stage has at most six planets. The stages, source locators, hypotheses, proof routes, direct prerequisites, API uses and reader names were checked against one another. No source excerpts were introduced.

## Corrections made

1. **M.0 source locators.** The defining-system convention is in HW's Introduction, p. 1. Section 2 has **Notation** 2.1, p. 5; Definition 3.2, p. 9, defines the outer exponent. Corrected the three affected node citations, both source inventories and the reader. The strict DGA and all-degree comparison are identified as derived interface targets, rather than attributed to a nonexistent source definition.
2. **M.0 canonical resolution and topology.** Removed the unsupported reference to a parent continuous bar resolution. The comparison now uses the parent's actual iterated continuous-coinduction resolution, explicit homogeneous/inhomogeneous inverse coordinates, compact-open curry/uncurry under profinite local compactness, and the graded-cup formula. The isomorphism is in `TopModuleCat Z` between discrete objects. Added the infinite-product C₂ example detecting the wrong inherited pointwise topology; the low-degree comparison uses the parent's discrete wrappers.
3. **M.0 representative change.** The present DGAInfinity8 scope owns matric Massey systems but does not explicitly state integral representative invariance. Its exponential gauge interface over Q-algebras does not suffice for this roadmap's coefficients. Refined the existing supplier request to the finite upper-unitriangular gauge theorem, and gave the finite geometric-series inverse, curvature identity, corner-coboundary correction and reverse-gauge argument. This proves the intended value-set invariance without division and preserves continuity.
4. **M.1/M.4 attribution.** Separated citations to HW, Michailov and Moravec under their actual source IDs. HW Proposition 4.1's proof is on pp. 11–12, with the relevant formula on p. 12.
5. **M.4 nonabelian size-five case.** The original proof incorrectly called the derived subgroup of UT₅(F_p) abelian. Its elements e₀₂(1), e₂₄(1) have commutator e₀₄(1)≠1. The general gap-two endpoint-collection theorem covers this case and gives the same Bogomolov-vanishing target. Added an acceptance test, reader example and a noncommuting-pair example in the suggested Lean file.
6. **M.9 triangular carriers.** Clarified that the rank-one specialization of U(W) is unitriangular and that of U¹(W) is its degree-two subgroup; T(W) is the larger invertible upper-triangular group.
7. **API.** Added pointwise cochain extensionality, defining-system entry extensionality, and filtered-automorphism block extensionality. These reuse existing carrier extensionality and are synchronized with the reader.
8. **Baseline metadata.** `LinearMap` is a structure of semilinear maps over semirings, with ordinary linear maps obtained by specialization. Corrected its kind and scope. Made the character-module theorem's commutative-ring hypothesis and `AddCircle (1 : Q)` model explicit. No baseline citation was removed or replaced.
9. **Reader-only locator slips.** Corrected HW Remark 4.8 (not Definition 4.8), the following unnumbered boundary-module definition, and Remarks 4.10–4.11/equation (4.8), all on p. 15. The sparse-conjugation and reversal node citations were already correct.
10. **Review and current-library records.** Added all 66 node verdicts, all 12 source-issue verdicts, independent reading ranges, exact baseline links and three upstream notes. Replaced the reader's obsolete “unreviewed” status for the source findings. Historical design provenance is retained separately from review provenance.

## Scope and closure checks

The finite matrix filtration, transvections, conjugacy classes, free/presented groups, low-degree cohomology and cups remain imported. New targets are the strict continuous DGA comparison and Massey specialization, exact commutator reverse inclusions, concrete stabilizer calculations, local lifting extensions and the Z/8 counterexample. Generic defining systems belong to DGAInfinity. The geometric unramified-Brauer comparison, homogeneous-space rational points and global number-field mod-p theorem remain routed to the proposed homogeneous-space continuation; that continuation is not asserted to be implemented. Merkurjev–Scavia's independent negligible-class direction remains in the existing split proposal.

The proof audit retained the important qualifications: negative Massey/positive extension-class signs; fixed adjacent cocycles for bijections; continuous weak lifts; actual contragredient Hom actions; the strict exponent inequality at p=3,n=6; all abelian rather than merely cyclic Bogomolov tests; internal corner sums; the finite-domain hypothesis for discrete Hom; the connecting-cup evaluation sign; equality in U/P in the nonsplit local argument; the real-place C₂ proof; and the separate global definedness argument for the final Z/8 triple.

Read the parent PC library audit and the actual supplier statements: parent ProfiniteCohomology layers 0,2,3,5,8–12; DGAInfinity1,8; ProfiniteProPGroups5; ClassFieldTheory5; ArithmeticGaloisDuality R02.1's four named Hom/splitting/cup nodes; HigherLocalFieldsAndHigherClassFieldTheory HL.2's ordinary characteristic-p dimension statement; and all six IG.4 supplier nodes named by M.11. Target-level granularity is appropriate: the nonroutine endpoint collection, local cancellation and arithmetic obstruction steps already have their own nodes. The refined generic-gauge request remains at its existing supplier, with an explicit proof route and consumers.

The current roadmap checkout was inspected read-only at `0d144d044dacebca17b654695b6f1ad58f159b27`, and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The nine post-snapshot roadmaps' suggested files, including OperatorTheory's subpackages, were searched for these carriers; ProfiniteArithmetic and LocalGaloisGroups scopes and relevant interfaces were read. No overlapping Massey/Bogomolov or least-divisor target was found there. ProfiniteArithmetic's powering and outer-automorphism carriers remain imported.

Current Tau Ceti already contains the continuous Heisenberg-primitive criterion `ContCohomology.explicitCup11_eq_zero_iff`, all-degree `ContinuousCohomology.isIso_shapiroMap`, `ContinuousCohomology.corestriction_res`, and general nonarchimedean finite-module duality in `NumberTheory/ClassFieldTheory/Local/Duality/FiniteModule.lean`. These postdate the pinned baseline and remain imports, not proposed new work. In particular the ClassFieldTheory request is narrowed to coefficient/cup transport from existing general duality, including equal characteristic with invertible coefficients. The narrower mixed-characteristic wording in the roadmap is recorded for the maintainer without editing upstream files.

## Sources and source findings

Read [HW arXiv:1904.06512v2](https://arxiv.org/pdf/1904.06512v2), pp. 1–31; [Michailov arXiv:1308.3408v2](https://arxiv.org/pdf/1308.3408v2), §§1–3, pp. 1–8; and [Moravec arXiv:1203.3190](https://arxiv.org/pdf/1203.3190), §2 pp. 3–4, Lemma 3.1/Theorem 3.2 pp. 4–6 and §4 opening pp. 9–10. Every node and source-issue locator was checked. [Merkurjev–Scavia arXiv:2410.12560v1](https://arxiv.org/pdf/2410.12560v1), Introduction §§1.2–1.5, pp. 1–4, was read only to verify the independent scope split; its negligible-class proofs are not claimed read.

The packet preserves the three proof-source hashes and records separate reading dates/ranges. Publisher metadata and available author links were checked; the accessible HW author PDF is the 33-page preprint. The full 41-page published text was not obtained. Findings below are confirmed only for the exact preprint texts, without a novelty claim or an assertion about the version of record.

| Finding | Verdict and independent check |
| --- | --- |
| E1, HW Lemma 5.5 p. 19 | Confirmed. For Γ=∏C₂, C=⊕F₂[Γ/U_n] and trivial A=F₂, a coset-selecting functional has nonopen stabilizer ∩U_n. Finite C suffices in all uses here. |
| E2, HW Proposition 7.3 p. 26 | Confirmed. Fixed lifts require fixed cocycles. C₂ with sign action on F₃ has H¹=0 but distinct cohomologous cocycles; class-level existence needs conjugation. |
| E3, HW Definition 3.2 p. 9/Lemma 4.7 p. 14 | Confirmed. Trivial characteristic-two power action has least divisor 1. The required factorization through (Z/p)× remains valid. |
| E4, HW Lemma 4.7 proof p. 14 | Confirmed as a proof-direction slip: the required input is an upper divisibility bound by 9. An element of order 9 can exist, so this does not refute a lower-bound example. |
| E5, HW Lemma 4.13 p. 17 | Confirmed. The 03-coordinate requires e₀₃(a₂); F₃ with a₂=2 detects the printed parameter 1. |
| E6, HW Proposition 6.1 p. 23 | Confirmed. Removing one endpoint from size six leaves size five. |
| E7, HW §7 p. 28 | Confirmed. The two boundary sums intersect in the corner; n=3,r=s=1 gives three coordinates. |
| E8, HW Proposition 5.3 p. 19/all-place use p. 22 | Confirmed as an additional archimedean proof obligation. The nonarchimedean statement itself is unchanged; M.8 supplies C₂ and the complex case. |
| E9, HW Proposition 5.3 proof p. 19 | Confirmed. Vanishing produces a lift to U, not a map into its corner Z. |
| E10, HW Proposition 5.3 proof p. 21 | Confirmed by types: the retraction parameter u is a row and v a column; their order must remain consistent. |
| E11, Michailov §3 p. 5 | Confirmed. γ_(m−1) is the nontrivial corner over F_p, while γ_m=1. |
| E12, Michailov Theorem 3.1 Case II p. 8 | Confirmed. Both factors must have gap ℓ; adjacent transvections lie outside F_ℓ when ℓ>1. |

## Pinned baseline

Pins: Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Each of the twelve relevant module files was retrieved at its exact commit; its bytes matched the existing pinned build. The packet's `checked` fields link every declaration to its source line. All twenty actual statements supply the stated import, with the qualifications below.

| Declaration | Module and line | Scope checked |
| --- | --- | --- |
| `tauceti:TauCeti.upperUnitriangularGroup` | `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/UpperUnitriangular/Basic.lean`:115 | Finite ordered index, ring coefficients; existing subgroup. |
| `tauceti:TauCeti.UpperUnitriangularGroup.ext` | `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/UpperUnitriangular/Basic.lean`:153 | Strictly upper entries determine the group element. |
| `tauceti:TauCeti.UpperUnitriangularGroup.superdiagonalSubgroup` | `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/UpperUnitriangular/Nilpotent.lean`:137 | Existing subgroup, not the new public support submodule. |
| `tauceti:TauCeti.UpperUnitriangularGroup.mem_superdiagonalSubgroup_iff` | `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/UpperUnitriangular/Nilpotent.lean`:181 | Entrywise membership with the identity diagonal. |
| `tauceti:TauCeti.UpperUnitriangularGroup.commutator_superdiagonalSubgroup_le` | `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/UpperUnitriangular/Nilpotent.lean`:220 | Only forward containment; reverse equality remains new. |
| `tauceti:TauCeti.transvectionUnit` | `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Transvection.lean`:138 | Distinct indices; imported addition/inverse API. |
| `tauceti:TauCeti.commutatorElement_transvectionUnit` | `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Transvection.lean`:242 | Commutative ring, distinct chaining indices; xyx⁻¹y⁻¹. |
| `tauceti:TauCeti.ContCohomology.C1` | `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean`:127 | Continuous additive subgroup of plain functions. |
| `tauceti:TauCeti.ContCohomology.C2` | `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean`:130 | Continuous cochains on G×G; topology wrappers still matter. |
| `tauceti:TauCeti.ContCohomology.explicitCup11` | `TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/Product.lean`:577 | Biadditive H¹×H¹→H² with explicit continuity/equivariance. |
| `tauceti:TauCeti.homAction` | `TauCeti/RepresentationTheory/Homological/ContCohomology/InternalHom.lean`:137 | Conjugation action, not codomain action alone. |
| `tauceti:TauCeti.homAction_apply_smul` | `TauCeti/RepresentationTheory/Homological/ContCohomology/InternalHom.lean`:198 | Evaluation equivariance for that action. |
| `tauceti:TauCeti.FactorSet.exists_cohomologyClass_eq` | `TauCeti/GroupTheory/GroupExtension/Cohomology.lean`:187 | Ordinary normalized factor sets, not continuous extensions. |
| `tauceti:TauCeti.FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero` | `TauCeti/GroupTheory/GroupExtension/Cohomology.lean`:245 | Ordinary splitting criterion; PPG5 supplies continuity. |
| `mathlib:CharacterModule.dual_surjective_of_injective` | `Mathlib/Algebra/Module/CharacterModule.lean`:101 | Commutative ring; additive Q/Z character module. |
| `mathlib:LinearMap` | `Mathlib/Algebra/Module/LinearMap/Defs.lean`:85 | Semilinear structure over semirings; linear specialization. |
| `mathlib:FreeGroup` | `Mathlib/GroupTheory/FreeGroup/Basic.lean`:471 | Free-group carrier and lift universal property. |
| `mathlib:PresentedGroup` | `Mathlib/GroupTheory/PresentedGroup.lean`:39 | Quotient by normal closure of relators. |
| `mathlib:ConjClasses` | `Mathlib/Algebra/Group/Conj.lean`:133 | Existing quotient by IsConj. |
| `mathlib:IsConj.pow` | `Mathlib/Algebra/Group/Conj.lean`:52 | Natural powers preserve IsConj. |

## Validation and maintainer follow-up

- `python3 scripts/check_blueprint.py research/blueprint/packets/ProfiniteCohomologyPartII.json`: **0 errors, 0 warnings** after the review records were added.
- `lean-check research/blueprint/suggested/ProfiniteCohomologyPartII.lean`: **exit 0**, with only 17 declaration-uses-`sorry` warnings at the pinned build. Memory was checked before compiling. The file has 182 lines, three real-bodied light definitions and no sorry-filled data definition. Its theorem statements are proposals, not verified theorems.
- Independent exhaustive F₂ calculations reproduced the length-four cyclic kernel (8 cocycles/4 coboundaries) and length-six fixed-class failure (ranks 6 and 5; 4096 candidates/1036 commuting-lift candidates). For the five-dimensional module, all four nilpotent products vanish, beta and gamma each pass 256 cocycle products, beta has all 16 cyclic witnesses and fails all 32 global coboundaries, and gamma(t²)=d+e. Direct matrix multiplication checks the size-five nonabelian commutator. These calculations check the blueprint's formulas; they do not replace formal proofs.
- Checked all API/test names against the reader, all 66 unique review entries, all 12 source reviews and every definition/construction's three-test minimum.

No unresolved mathematical contradiction remains in this planning pass. The following work belongs to the normal supplier/packaging process:

1. Refine the existing DGAInfinity8 request to export integral finite-gauge representative invariance; do not use its rational exponential gauge interface for finite coefficients.
2. Reuse current ClassFieldTheory general finite-module duality and align its public roadmap/export scope; request only the coefficient and evaluation-cup comparison needed here.
3. On advancing the pins, import the existing parent Heisenberg primitive, all-degree Shapiro and corestriction. Preserve the strict DGA comparison as the new continuous Massey-specific bridge.
4. Apply the existing routing/split proposals through the orchestrator. This review makes no upstream or supplier edits and introduces no new roadmap ownership.

The full per-node reasons and precise supplier contracts are in the accepted packet. The review leaves no unfinished review work and does not claim a second issue.
