# Independent review: Deligne weights, purity and the Weil bounds, DWP.0

**Verdict: needs_changes.** Completed review of [issue #382](https://github.com/CBirkbeck/tauceti-explorer/issues/382), by Codex, session `codex-fH0uPG`, on 2026-10-06. The authors of the submitted plan were other sessions. This is a finished review, not a checkpoint.

The corrected packet meets the target-level planning standard. The reader document still contradicts it, and PROTOCOL §8 requires agreement before promotion. The reader is outside this issue’s permitted edit paths. Its revision is the acceptance blocker; the two explicitly recorded gaps and the unbuilt supplier interfaces are honest planning limitations, not reasons to reject a complete pass.

## Scope, counts and coverage

Reviewed the packet, suggested Lean file, reader, reviewed library audit, RS-17 restructuring, handed-down red-team findings, precise supplier statements and source passages. Upstream models read included ArithmeticDirichletSeries and CompactGroups; relevant ReductiveGroups, JacobianChallenge and ModularCurves statements were also inspected for their supplier boundaries.

| Item | Submitted | Corrected |
| --- | ---: | ---: |
| Nodes | 81 | 83 |
| Definitions / constructions | 8 / 4 | 8 / 4 |
| Lemmas / theorems | 12 / 57 | 12 / 59 |
| API items | 80 | 81 |
| Unit tests | 42 | 44 |
| Planets | 27 | 27 |
| Baseline declarations | 27 | 29 |
| Supplier requests | 29 | 28 |
| Explicit gaps | 2 | 2 |
| Source issues | 6 | 8 |

All 83 nodes have individual entries in the packet’s review: **47 verified, 34 corrected, 2 added, 0 unverifiable**. The 120 source excerpts were checked with the surrounding cited statements; normalized OCR matching was a secondary check, and ambiguous printed formulae were checked against page images. A global text match alone was not treated as verification of a locator. All twelve definitions and constructions have at least three tests; the twelve per-node counts are 4, 4, 5, 4, 4, 3, 3, 4, 3, 3, 3, 4.

| Stage | Nodes | Coverage |
| --- | ---: | --- |
| DeligneWeightsAndPurity:DWP.0 | 18 | planned |
| DeligneWeightsAndPurity:DWP.1 | 9 | planned |
| DeligneWeightsAndPurity:DWP.10 | 7 | planned |
| DeligneWeightsAndPurity:DWP.2 | 11 | planned |
| DeligneWeightsAndPurity:DWP.3 | 11 | planned |
| DeligneWeightsAndPurity:DWP.4 | 3 | planned |
| DeligneWeightsAndPurity:DWP.5 | 19 | planned |
| DeligneWeightsAndPurity:DWP.6 | 5 | planned |

Every target of these eight stages is present. `status: complete` remains correct for the completed target-level pass under the node budget. No stage is closed: supplier realization and the explicit prescribed-base embedding and suggested-signature gaps remain. Definitions, theorem statements, filtration conventions, Frobenius signs, characteristic restrictions and concrete acceptance cases were checked. Nothing is claimed formalized; every implementation status stays unchecked.

## Corrections applied

The following is the complete node-change record. IDs below omit the common `DeligneWeightsAndPurity:` prefix. Added nodes carry this review’s `addedBy` field.

- **DWP.0/endomorphism-weights** (corrected): Added the singular-zero-operator regression test: the total logarithm core does not admit additive weight translation at zero.

- **DWP.0/characteristic-power-series-and-traces** (corrected): Separated the characteristic-independent quotient −tD′/D from the formal logarithm, which needs characteristic zero.

- **DWP.0/eigenvalues-of-exterior-powers** (added): Added distinct-position exterior spectra, including multiplicities, nonsplit Jordan blocks, the empty wedge and out-of-range degrees, using the actual Mathlib exterior construction and basis.

- **DWP.0/twisting-by-rank-one-characters** (corrected): Qualified the weight-translation API by invertibility and cited the existing finite-coefficient Tate construction directly; retained the rational-realization request.

- **DWP.2/open-subgroups-of-symplectic-groups-are-zariski-dense** (corrected): Corrected the connectedness rationale: an open subgroup of O can have closure SO. The full-dimension argument gives Sp because Sp is connected.

- **DWP.2/compact-cohomology-of-even-tensor-powers** (corrected): Replaced the coarse EDC.2 input by its exact extreme-degree cohomology node, retaining the affine and rational-coefficient hypotheses.

- **DWP.2/coarse-bound-on-compact-cohomology** (corrected): Replaced the coarse EDC.2 input by the exact affine/extreme-degree formula.

- **DWP.2/coarse-bound-on-cohomology-of-the-projective-line** (corrected): Cited the existing j_* curve Poincaré-duality node rather than its coarse stage.

- **DWP.1/frobenius-endomorphism-over-a-finite-field** (corrected): Used naturality and products for the group law and requested the independent étale-local finite-flat degree q^g theorem; removed reliance on later point counts.

- **DWP.1/point-counts-of-abelian-varieties** (corrected): Corrected d(1−π^m) to +1, explained finite surjective étale isogeny and multiplicity-one kernel count, added exterior spectra, and cited Milne II.1.5–1.6.

- **DWP.1/compatibility-with-the-hasse-bound** (corrected): Corrected the Milne excerpt against the actual course-note text.

- **DWP.3/geometrically-constant-lisse-sheaves** (corrected): Required geometric connectedness for the arithmetic/geometric π₁ quotient and added the explicit IG.1 dependency.

- **DWP.3/exceptional-frobenius-set-has-density-zero** (corrected): Added the Haar-disintegration/continuous conditional-mass supplier already needed by the proof and listed this consumer in its precise request.

- **DWP.3/coarse-bound-for-the-pencil** (corrected): Replaced coarse LPV.5 by the existing fixed-ℚ_ℓ Kazhdan–Margulis open-image node.

- **DWP.4/middle-cohomology-half-unit-bound** (corrected): Corrected the induction: outer terms inherit the half-unit interval after twist, not exact purity. Split geometric components and descend after finite base extension.

- **DWP.4/middle-cohomology-purity** (corrected): Corrected the source to Weil I Lemma 7.2, pp. 300–301, with its actual Cartesian-power passage.

- **DWP.4/smooth-projective-purity** (corrected): Corrected the reference to Weil I Lemma 7.2 and §7.3, pp. 300–301.

- **DWP.5/weil-sheaf** (corrected): Restricted the arithmetic π₁ characterization of descent to lisse sheaves; constructible non-lisse sheaves require sheaf descent data.

- **DWP.5/rank-one-normalization** (corrected): Replaced a too-narrow incidence-complement Bertini node by a precise normal-scheme curve-reduction request to LPV, Part II; corrected pp. 156–158 and 185–186.

- **DWP.5/determinantal-weights** (corrected): Added exterior spectra and component/finite-field base-extension comparison, and corrected the determinant-definition and functoriality locators to pp. 158 and 161.

- **DWP.5/geometric-monodromy-and-central-degree** (corrected): Corrected the central-degree and radical passages to pp. 158–162 and used an excerpt present in the source.

- **DWP.5/determinantal-weight-functoriality** (added): Added dominant normal pullback, tensor weights and exterior-weight sums with rank capacities n(β), not constituent multiplicities, from Weil II 1.3.13. Its direct inputs include central-degree monodromy and the precise finite-index π₁ request.

- **DWP.5/generalized-majoration** (corrected): Added both missing exterior/determinantal functoriality inputs, made the descending-induction argument explicit, used the exact H²_c supplier and requested general normal-scheme curve reduction. Corrected 1.5.1–1.5.3 to pp. 164–165.

- **DWP.5/initial-curve-and-boundary-bounds** (corrected): Corrected Lemma 1.8.1 and Remark 1.8.2 to p. 175 and used the exact extreme-degree supplier.

- **DWP.5/local-monodromy-purity** (corrected): Corrected §1.7 and Theorem 1.8.4 to pp. 170–176; removed a coarse cohomological-duality dependency unused in this local linear-algebra proof.

- **DWP.5/local-weight-corollaries** (corrected): Added the existing finite-coefficient Tate supplier while keeping the actual rational realization as an owner request.

- **DWP.5/stalk-newton-polygon** (corrected): Added exterior spectra for cumulative products and corrected the local Newton theorem to 1.10.6, p. 183.

- **DWP.5/nonarchimedean-boundary-bounds** (corrected): Added exterior spectra and corrected §1.10 to pp. 182–184.

- **DWP.5/specialization-of-monodromy** (corrected): Corrected §1.11 and its uniform-model specialization proof to pp. 184–186.

- **DWP.5/hadamard-de-la-vallee-poussin** (corrected): Corrected §2.1–§2.2 analytic and corollary references to pp. 187–191 and 195–196.

- **DWP.5/compact-weil-form** (corrected): Corrected pure weight to −2Re(r) for ω₁=q^(−deg), added the norm-exponent API and Tate-character sign test, and corrected pp. 192–195.

- **DWP.5/strict-initial-h1-bound** (corrected): Corrected Corollaries 2.2.9–2.2.10 to pp. 195–196 (2.2.9 is not a theorem) and cited exact extreme-degree cohomology.

- **DWP.5/abstract-degree-equidistribution** (corrected): Corrected §2.2.1–2.2.3 to pp. 191–192.

- **DWP.6/real-cohomological-factors** (corrected): Replaced coarse EDC.2 by the exact extreme-degree and adic/rational duality nodes.

- **DWP.6/square-improvement** (corrected): Said finite surjective cover by a smooth curve, avoiding a false smooth-morphism claim for ramified covers, and cited exact extreme-degree and j_* curve duality.

- **DWP.10/mixed-nearby-and-newton-exports** (corrected): Separated the actual companion sources: Newton couples pp. 206–207, nearby-cycle mixedness Theorem 6.1.13 p. 246, and the ℤ[1/ℓ] variant 6.2.7 p. 248.

The exterior spectrum is a missing theorem, not a duplicate of Mathlib’s exterior-power construction. The determinantal functoriality theorem is also a necessary target-level input: central-degree monodromy, finite-index normal pullback and exterior rank capacities are not routine consequences of the determinant definition or of tensor spectra alone. No proof was split into a lemma-level plan.

The supplier edits replace existing coarse-stage references with exact available nodes where their statements suffice. The EDC.2 and constant-pencil LPV.5 requests were therefore removed. General normal-scheme curve reduction remains a separate LPV, Part II request; the inspected LPV Bertini theorem concerns a projective incidence complement and does not supply it. The IG.1 request now specifies finite-index image for dominant normal pullback. SF.0 now explicitly supplies Frobenius degree independently of weights and counts. EDC.0 distinguishes derived scalar change from actual adic/rational coefficient categories. The Haar request now names the exceptional-density consumer. The signature-interface gap includes the new determinantal theorem.

## Pinned baseline and ownership

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All 27 submitted declaration names and statements were confirmed at the Mathlib pin; none was removed or replaced. Two genuine exterior-power declarations were added and independently checked. Each entry’s surrounding typeclass hypotheses and the narrower `provides` contract were read, including injectivity for minimal polynomials, prescribed-base limits of ring equivalences, finite-free hypotheses, the ordinary transpose versus inverse dual, and the existing valuation and subgroup objects.

| Confirmed declaration | Module at the Mathlib pin |
| --- | --- |
| `minpoly.algHom_eq` | [Mathlib/FieldTheory/Minpoly/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Minpoly/Basic.lean) |
| `IsAlgClosed.lift` | [Mathlib/FieldTheory/IsAlgClosed/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IsAlgClosed/Basic.lean) |
| `NumberField.Embeddings.pow_eq_one_of_norm_eq_one` | [Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/InfinitePlace/Embeddings.lean) |
| `IsAlgClosed.cardinal_eq_cardinal_transcendence_basis_of_aleph0_lt` | [Mathlib/FieldTheory/IsAlgClosed/Classification.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IsAlgClosed/Classification.lean) |
| `Cardinal.mk_complex` | [Mathlib/Analysis/Complex/Cardinality.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Complex/Cardinality.lean) |
| `IsAlgClosed.equivOfTranscendenceBasis` | [Mathlib/FieldTheory/IsAlgClosed/Classification.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IsAlgClosed/Classification.lean) |
| `IsAlgClosed.ringEquiv_of_equiv_of_charZero` | [Mathlib/FieldTheory/IsAlgClosed/Classification.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IsAlgClosed/Classification.lean) |
| `Algebra.IsAlgebraic.cardinalMk_le_max` | [Mathlib/RingTheory/Algebraic/Cardinality.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Algebraic/Cardinality.lean) |
| `LinearMap.charpoly_baseChange` | [Mathlib/LinearAlgebra/Charpoly/BaseChange.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Charpoly/BaseChange.lean) |
| `Module.End.hasEigenvalue_iff_isRoot_charpoly` | [Mathlib/LinearAlgebra/Eigenspace/Charpoly.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Eigenspace/Charpoly.lean) |
| `LinearMap.finrank_maxGenEigenspace_eq` | [Mathlib/LinearAlgebra/Eigenspace/Zero.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Eigenspace/Zero.lean) |
| `Module.End.iSup_maxGenEigenspace_eq_top` | [Mathlib/LinearAlgebra/Eigenspace/Triangularizable.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Eigenspace/Triangularizable.lean) |
| `Module.End.independent_maxGenEigenspace` | [Mathlib/LinearAlgebra/Eigenspace/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Eigenspace/Basic.lean) |
| `Matrix.charpoly_fromBlocks_zero₂₁` | [Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean) |
| `LinearMap.charpoly_prodMap` | [Mathlib/LinearAlgebra/Charpoly/ToMatrix.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Charpoly/ToMatrix.lean) |
| `Matrix.reverse_charpoly` | [Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean) |
| `Matrix.trace_eq_sum_roots_charpoly` | [Mathlib/LinearAlgebra/Matrix/Charpoly/Eigs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Charpoly/Eigs.lean) |
| `Matrix.charpoly_inv` | [Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean) |
| `Matrix.det_kronecker` | [Mathlib/LinearAlgebra/Matrix/Kronecker.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/Kronecker.lean) |
| `LinearMap.trace_tensorProduct'` | [Mathlib/LinearAlgebra/Trace.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Trace.lean) |
| `LinearMap.det_dualMap` | [Mathlib/LinearAlgebra/Determinant.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Determinant.lean) |
| `Polynomial.isCoprime_iff_aeval_ne_zero_of_isAlgClosed` | [Mathlib/FieldTheory/IsAlgClosed/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IsAlgClosed/Basic.lean) |
| `LinearMap.aeval_self_charpoly` | [Mathlib/LinearAlgebra/Charpoly/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Charpoly/Basic.lean) |
| `Polynomial.sup_ker_aeval_eq_ker_aeval_mul_of_coprime` | [Mathlib/RingTheory/Polynomial/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Polynomial/Basic.lean) |
| `AddValuation` | [Mathlib/RingTheory/Valuation/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Valuation/Basic.lean) |
| `Multiset.sort` | [Mathlib/Data/Multiset/Sort.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Multiset/Sort.lean) |
| `MonoidHom.eqLocus` | [Mathlib/Algebra/Group/Subgroup/Ker.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Ker.lean) |
| `exteriorPower.map` | [Mathlib/LinearAlgebra/ExteriorPower/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Basic.lean) |
| `Module.Basis.exteriorPower` | [Mathlib/LinearAlgebra/ExteriorPower/Basis.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Basis.lean) |

The reviewed audit marks the weight theory and geometric cohomology infrastructure as unbuilt, with existing linear algebra available to import. That distinction is preserved. Tau Ceti’s pinned `ThreeFourOne` supplies the finite trigonometric positivity identity; its Landau theorem supplies a precise Dirichlet-series abscissa statement, not the power-series pole comparison here. The abstract representation-family argument is consequently not re-planned as an upstream positivity theorem. Existing abelian-variety characteristic polynomials and degree, Schur–Weyl invariants, duality, pencils, nilpotent monodromy, direct-image bounds and mixed-complex results remain imported.

Supplier comparisons also retain the explicit Part II requests for base-point-free finite-field Jacobian descent and H¹ comparison, complex maximal-compact comparisons and ℓ-adic analytic measure, and full universal elliptic-family monodromy. In particular, fixed-pairing fine-moduli representability is not asserted to prove the connectedness/full SL₂ monodromy that ModularCurves 5B expressly leaves out. Internal numeric definitions precede their geometric uses; no coarse DWP.5↔DWP.2 proof cycle is introduced. The finite-cover Chebotarev input uses the initial curve estimate, not later general equidistribution.

## Public sources and errata

Only public versions were used. Their SHA-256 values agree with the packet and source-version records. Yu’s source-version kind was normalized from the invalid “author preprint” value to the schema’s “preprint”; the v5 URL and hash are unchanged:

| Source | Version and checked passages |
| --- | --- |
| [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf) | Cited passages in §§1–3, §§5.12–7.3, printed pp. 275–301, including all pencil rationality, half-unit induction and tensor-power cases. |
| [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf) | Cited passages of §§1.1–1.5, 1.7–1.8, 1.10–1.11, §§2.1–2.2, §§3.1–3.3 and 3.5, plus 6.1.13 p. 246 and 6.2.7 p. 248; erratum page images checked. |
| [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf) | Chapter II §1 pp. 75–78 and Chapter III trace/Jacobian passages pp. 113–119, including the marked unfinished proof. |
| [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5) | Weight-facing passages §§1–2, 6.1 pp. 42–43 and 7.1 pp. 64–65, in public arXiv v5 only. |
| [Indecomposable vector bundles and stable Higgs bundles over smooth projective curves](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p06-p.pdf) | Published Proposition 4.7, Appendix B and bibliography compared with arXiv v2 Proposition 4.8, Appendix B and bibliography; analytic supplier, half twist and density-owner distinctions checked. |
| [Schiffmann preprint](https://arxiv.org/pdf/1406.3839v2) | v2, Proposition 4.8, Appendix B pp. 35–36 and bibliography compared with the published version. |

All six submitted source issues were independently confirmed, with explicit review objects. Two already-known Weil II misprints affecting this plan were added, also confirmed:

| Issue | Verified correction and scope |
| --- | --- |
| E1 | Milne III.11.2 p. 119 explicitly marks a pullback-degree step unfinished. The finding now certifies that gap only; it does not certify an unsupplied theta-divisor repair. The trace formula remains an owner input. |
| E2 | Schiffmann’s Appendix B theorem locator belongs to Weil II §3.5.3; its preprint bibliography and published Weil I reference misidentify that source. |
| E3 | Preprint normalization H¹(−1) has the wrong weight; its displayed spectrum requires the chosen half-weight inverse scalar. The published version corrects this. |
| E4 | Weil II p. 212’s SU(2) density has total mass 1/4; normalized Haar pushforward has density (2/π) sin²θ on [0,π]. |
| E5 | Weil II p. 212’s elliptic point count subtracts the H¹ trace. |
| E6 | Yu v5 pp. 42–43 reverses the tensor–Hom order; H⁰ uses Hom(ℱ₂,ℱ₁), while H² uses Hom(ℱ₁,ℱ₂) dual with twist −1. This comparison is scoped to v5, without asserting journal collation. |
| E7, added | Weil II 1.3.10(iv), p. 160 needs a finite-index subgroup of ℤ, not a finite subgroup, for its positive central degree. |
| E8, added | Weil II 2.2.8(i), p. 195, repeated in 3.5.1 p. 211, needs weight −2Re(r) for the printed ω₁=q^(−deg) convention. The Tate character gives a direct sign check. |

Weil II 1.2.9–1.2.10 retain their status as conjectures in that source. This review does not silently promote them to theorems or infer modern results from the 1980 text. Unused multivariable estimates and the companion DWP.7–9 targets remain outside this pass.

## API, suggested file and planets

All 81 API names and 44 test names are present in the suggested file, as executable signatures/examples or expressly omitted entries naming unavailable genuine interfaces. The actual numeric definitions use Mathlib fields, endomorphisms, characteristic-root multisets, valuations and exterior powers. The Weil-group pullback is a genuine equalizer subgroup. Neither geometric cohomology nor constructible Weil sheaves are simulated by proposition-valued fields. The document’s recorded interface gap makes those omitted entries honest; this review does not count a commented specification as an elaborated signature.

The new exterior signatures use `exteriorPower.map` and finite-dimensional exterior powers from Mathlib, with the corresponding module import. The numerical twist signature now requires bijectivity, and a zero-operator example detects the missing hypothesis. The compact-form norm-exponent API and test remain documentary because their actual monodromy carrier is unavailable. The documentary ledger was synchronized with corrected mathematical statements and direct inputs. The 27 planets remain named central definitions, constructions and theorems, within the per-layer limit; splitting DWP.5 remains an explicit assembly proposal.

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/DeligneWeightsAndPurity--DWP.0.json`: 83 nodes, **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/DeligneWeightsAndPurity--DWP.0.lean`: **exit 0**, at the pinned Mathlib build; 89 warnings, all declaration uses `sorry`. No errors and no other warning category. No geometric signature is certified by this elaboration.
- Source-issue and source-version schemas, API/test-name coverage and per-node minimum test counts checked. Source download hashes matched all six public version records. Change paths and whitespace checked before submission.

## Required reader revision and orchestrator actions

Regenerate/synchronize `research/blueprint/readmes/DeligneWeightsAndPurity--DWP.0.md` from the corrected packet before a new independent review. Preserve its useful explanatory prose and supplier boundaries, while applying every correction above and updating the counts, baseline, requests, source issues, dependencies and suggested-file limitations. Three concrete contradictions requiring correction are:

1. At line 814, the differential of 1−π^m is +1, although the reader says −1. Its exterior-power proof at line 823 also cites only tensor spectra; it must cite the new exterior theorem.
2. At line 1544, the DWP.4 half-unit induction claims exact purity of the outer terms before the tensor-power purity theorem. Replace this circular claim by the shifted half-unit interval.
3. At line 2105, the compact-form irreducible sheaf has weight −2Re(r) for the stated source exponent. The current positive sign contradicts the Tate test and the corrected packet.

Also include both added theorem nodes, qualify the lisse descent API and invertible twist API, update the source locators and E7–E8, and replace the unsupported general Bertini import by the precise owner request. Lines above refer to the submitted reader and will move when regenerated. Acceptance requires a consistent packet, reader and suggested file, not removal of the honestly recorded gaps.

Both handed-down red-team findings are correctly treated in the existing packet and reader proposals. RT-AREA-etale/1 moves the analytic equidistribution supplier for PAPER-SCHIFFMANN-16/36 to a DWP.8 equidistribution child, with DWP.5/7/8 inputs; the full density/universal-family theorem stays with UniversalHypersurfaceMonodromy (LPV, Part II), retaining explicit families, half-scalar normalization and characteristic hypotheses. RT-AREA-etale/9 makes RD.6 import DWP.0’s numeric predicates while owning its own pointwise F-isocrystal notions. These are proposals for orchestrator application, not already-applied atlas edges.

Queue the blueprint reader revision and its new independent review. On eventual acceptance, apply the recorded DWP.8 equidistribution ownership move and DWP.0→RD.6 edge/RS-17 ownership amendment through the authorised assembly/restructuring process. Preserve the requested supplier Part IIs and the numeric-before-geometric dependency direction. No additional mathematical blocker was found in this corrected target-level packet.
