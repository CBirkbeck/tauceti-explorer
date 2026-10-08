# Independent review of the revised Deligne weights and purity plan

Job: `REV-DeligneWeightsAndPurity--DWP.0~2` · issue #7040 · Codex session `codex-cujRop` · 2026-10-08.

**Accepted after corrections.** This is an independent review of the revised packet, reader and suggested file; this session authored neither blueprint round. Every one of the 83 nodes is verified or corrected. All 29 baseline citations were confirmed at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti inputs were read at `f790474821cf4256814db967cb154e7af3d0c369`. No baseline citation or node was added, removed or replaced. Fifteen existing nodes were corrected. The packet still has 81 API items, 44 tests, 27 planets, 28 supplier requests, eight confirmed source issues and two explicit gaps.

All eight stages remain `planned`: their in-scope targets and essential inputs are specified. None is declared `closed`, and the packet's `complete` status means a finished target-level pass. Prescribed-base compatibility for a complex isomorphism and unavailable geometric/analytic signatures remain explicit obligations. This verdict certifies a mathematical plan and its stated supplier contracts; it does not certify a geometric formalization.

## Earlier review and revision

The original independent review corrected the packet but rejected the reader because it contradicted those corrections. The revision synchronized the reader. I rechecked every requested mathematical correction, including the two added targets, rather than treating the revision's unchanged packet as automatically verified.

| Earlier finding | Independent check of the revised result |
| --- | --- |
| DWP.0 algebraicity, field cardinality and operator conventions | Algebraicity prevents a zero minimal polynomial from making purity vacuous; all-embedding statements have the proper ambient-field restriction. Ordinary transpose and contragredient spectra differ. The twist weight-set formula excludes singular Frobenius. Formal-logarithm arguments keep characteristic zero. Exterior spectra use actual Mathlib exterior powers. |
| DWP.1 Frobenius, Jacobian and degree inputs | Scheme Frobenius supplies a group endomorphism by product naturality, and degree q^g is an independent SF.0 contract. The differential of 1−π^m is +1. Exterior spectra are direct inputs. The curve comparison needs base-point-free descent, translation invariance and the actual H¹ isomorphism; the Hasse specialization uses Milne III.11.4. |
| DWP.2 group and cohomology suppliers | Connected Sp is distinguished from O and SO. The exact rational extreme-degree and j_* curve duality statements were read; no finite-ring eigenvalue assertion is imported as a rational theorem. |
| DWP.3 constancy, openness and density | Geometric connectedness is retained. LPV's Kazhdan–Margulis node supplies the fixed Q_ell open image. Nullity holds in each arithmetic fibre; conditional clopen masses and Dini give uniformity before per-degree finite-cover Chebotarev is applied. |
| DWP.4 induction | Weil I (7.1)–(7.3), pp. 298–301, treats zero vanishing cycles, zero quotient and nonzero quotient. Outer Leray terms retain a half-unit error; products remove that error. No premature pure outer-cohomology assertion or hard Lefschetz is used. |
| DWP.5 coefficient and local interfaces | Constructible descent is distinguished from the lisse representation criterion. General normal-scheme reduction remains an LPV Part II request. Exterior determinant sums use rank capacities. Local monodromy imports the actual nilpotent/primitive tensor and dual theory. Newton bounds use exterior spectra. Central degree has finite-index image. The norm exponent has weight −2Re(r). |
| DWP.5 analytic interface | The norm-character translation, pole orders and possible quadratic exception are explicit. Character decay is a target. The initial H¹ bound is strict below β+2, not the sharp β+1 result to be proved by square improvement. |
| DWP.6 curve proof | Ramified finite surjective covers are between smooth curves; the map itself is not asserted smooth. Exact j_* duality and rational trace splitting are named. Finite integer iteration of square improvement gives the sharp limit. |
| DWP.10 imports and arithmetic export | Newton restrictions pp. 206–207, nearby mixedness 6.1.13 p. 246 and the proper Z[1/ell] variant 6.2.7 p. 248 have distinct source locators. Stable arithmetic subquotients require Frobenius stability and an independently supplied rational compatible factor. |

No contradiction from the original review remains. The exact node statements, hypotheses, proof steps, acceptance properties, APIs and tests were checked against the synchronized reader; its prose retains all the corrected conventions.

## Corrections in this review

- **DWP.0/weil-q-number**: Normalized a small-value test to the computation kind required by PROTOCOL §12.
- **DWP.0/iota-weight**: Normalized a small-value test to the computation kind required by PROTOCOL §12.
- **DWP.0/endomorphism-weights**: Normalized both small-value tests to the computation kind required by PROTOCOL §12.
- **DWP.0/twisting-by-rank-one-characters**: Normalized a small-value test to the computation kind required by PROTOCOL §12.
- **DWP.1/frobenius-endomorphism-over-a-finite-field**: Normalized both small-value tests to the computation kind required by PROTOCOL §12.
- **DWP.1/absolute-values-from-the-rosati-involution**: The multiplication example requires n≠0 and has modulus |n|, also for negative n; Milne II.1.3 p. 77 assumes r>0.
- **DWP.1/weil-estimate-for-curves**: Rephrased the author-marked degree-calculation gap in our own words; its trace-formula supplier obligation is unchanged.
- **DWP.2/weights-and-l-functions-of-lisse-sheaves-on-curves**: The constant scalar 2 is an ℓ-adic unit only for ℓ≠2; that hypothesis is required for the stated lisse étale line.
- **DWP.5/real-sheaves**: Restored the lisse hypothesis in Weil II (1.2.12)–(1.2.14), pp. 155–156, including the real-envelope API.
- **DWP.5/geometric-monodromy-and-central-degree**: Separated semisimplicity of the Weil representation from semisimplicity of each Frobenius operator; the source (1.3.8) p. 159 uses the former.
- **DWP.5/generalized-majoration**: Added the direct SF.2 trace-formula input used to bound the poles of the general even-tensor Euler product in (1.5.2)–(1.5.3), pp. 164–165.
- **DWP.5/specialization-of-monodromy**: Used the existing general LPV Part II curve-reduction request; the inspected incidence-complement Bertini theorem cannot supply (1.11.4)–(1.11.5), pp. 185–186.
- **DWP.3/haar-null-exceptional-eigenvalue-locus**: Added the explicit CompactGroups Part II analytic-nullity/disintegration contract used by the fibrewise Haar argument of Weil I (6.12), p. 298.
- **DWP.3/rationality-of-pencil-local-factors**: Added the directly invoked exceptional-density theorem; it supplies points in every sufficiently large permitted degree in the (6.9) Galois argument, p. 297.
- **DWP.10/compatible-realization-export**: Split a mixed Weil I/Weil II locator into two entries with the correct source ids; the rational subquotient-factor hypothesis is retained.

The four changed prerequisite lists are synchronized in both the reader and all corresponding suggested-file schemas. SF.2, LPV.5 and CompactGroups request consumer lists now name the added uses. Seven test kinds changed from `value` to the protocol's `computation`; their mathematical tests and signatures are unchanged. The lisse scope of the real-envelope schema is also synchronized. Source provenance, baseline check records, all eight erratum verdicts and the current reading record were updated to this independent review.

## Node, API and signature coverage

| Stage | Nodes | Verified | Corrected | Coverage |
| --- | ---: | ---: | ---: | --- |
| DWP.0 | 18 | 14 | 4 | planned |
| DWP.1 | 9 | 6 | 3 | planned |
| DWP.2 | 11 | 10 | 1 | planned |
| DWP.3 | 11 | 9 | 2 | planned |
| DWP.4 | 3 | 3 | 0 | planned |
| DWP.5 | 19 | 15 | 4 | planned |
| DWP.6 | 5 | 5 | 0 | planned |
| DWP.10 | 7 | 6 | 1 | planned |

The packet has 8 definitions, 4 constructions, 12 lemmas and 59 theorems. All twelve object nodes have at least three tests. The tests detect all-conjugates versus one-embedding purity, nonzero versus zero spectra, Jordan blocks, Tate/degree signs, Weil versus étale descent, determinant weight versus weight per rank, coefficient reality versus real eigenvalues, Newton normalization and the compact form's central scalar action. Their APIs cover the actual constructions, operations, transport, characterizations and owner compatibility relevant to their uses. The 27 planets are mathematical definitions, central constructions and named theorems.

The suggested file gives 52 API names and 30 test names as declarations or examples. The other 29 API names and 14 test names are explicitly omitted with precise statements and owner interfaces; 65 uninstantiated target schemas retain the packet statements and direct prerequisites. Its numeric, subgroup, closed-stalk-family and valuation cores use genuine existing types. They are not a sheaf category, cohomology implementation or fabricated proposition-valued interface. The corrected lisse geometric envelope remains distinct from its numeric stalk-family core.

The internal declaration graph is acyclic. Its coefficient prefix precedes the DWP.2 adapter and its local/analytic suffix follows the earlier estimates. Whole-stage DWP.5↔DWP.2 arrows must not replace that declaration order. Finite-cover Chebotarev uses the initial curve bound rather than the later general equidistribution theorem.

## Pinned baseline

Every declaration below was opened at the exact Mathlib pin, including enclosing variables and typeclass hypotheses, and checked against the packet's `provides` contract. No baseline citation needed removal or replacement. The classification equivalences remain bare ring equivalences: their prescribed-base compatibility is not silently promoted to an AlgEquiv theorem. Finite-dimensional field assumptions, finite-free ring assumptions, injectivity for minimal polynomials, ordinary dual determinant and invertibility for inverse spectra are retained.

| Confirmed declaration | Pinned module |
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

Tau Ceti's pinned `TauCeti.LSeries.threeFourOne_re_neg_log_one_sub_nonneg` supplies a finite trigonometric Euler-factor inequality. Its `TauCeti.LSeries.landau` requires the actual finite absolute-convergence abscissa and an ordinary Dirichlet series. Neither supplies the power-series factor-radius theorem nor the full representation-family nonvanishing theorem. Those are correctly owned by this plan.

## Audit, ownership and suppliers

I read the reviewed library audit for the eight scope layers and the accepted RS-17 ownership contracts. Existing characteristic-polynomial, degree, Rosati and elementary linear-algebra inputs are imported. Actual Weil sheaves, weights, étale cohomology, monodromy-weight estimates and geometric curve purity are not reported as built. The existing 3-4-1 analytic input is reused. The exterior-spectrum theorem and determinantal functoriality theorem are not duplicates of Mathlib's exterior construction or a determinant definition.

All 28 supplier requests were checked. The 30 available external prerequisite node statements were read, including A2/A6, exact EDC coefficient/curve duality nodes, LPV pencil/open-image and semistable-curve nodes, WC.3/WC.5 factor/count nodes and the DWP.7/DWP.8 companion nodes. Requests to coarse owner stages remain explicit extensions where a named existing theorem is weaker. In particular:

- LPV's incidence-complement Bertini statement does not supply general normal-scheme curve reduction. Its existing Part II request now serves specialization directly.
- Schur–Weyl Layer 9 supplies complex form-symplectic invariants; DWP.2 still owns the rational descent and coinvariant bridge.
- ReductiveGroups supplies algebraic Lie/component/radical theory; its Part II must supply the missing analytic dimension and complex maximal-compact comparisons.
- JacobianChallenge Layer F is pointed. The Part II contract supplies base-point-free descent, étale H¹ comparison and translation invariance.
- CompactGroups supplies complex Haar/character theory, Peter–Weyl and the normalized SU(2) measure. The Part II request supplies the additional ell-adic analytic nullity and uniform conditional-disintegration argument.
- ModularCurves 5B explicitly stops short of connectedness of determinant fibres. Its fine level carrier cannot stand in for the requested full SL₂ universal-family monodromy.

The ArithmeticDirichletSeries and CompactGroups upstream roadmap documents were read in full; the other supplier sections were checked against their precise consumer requirements. No upstream roadmap or other packet is edited.

RT-AREA-etale/1 is implemented correctly as an ownership boundary: numeric DWP.0 is not Schiffmann's analytic equidistribution supplier. DWP.10 currently contains the analytic nodes and the packet proposes DWP.8:equidistribution; UniversalHypersurfaceMonodromy retains the Katz–Sarnak family monodromy and full density application. RT-AREA-etale/9 is also explicit: RD.6 imports DWP.0 numerical purity and develops only the F-isocrystal specialization. These are proposals for the orchestrator, not atlas mutations by this reviewer.

## Public source and erratum checks

Only the public versions below were used; all six PDF hashes matched the packet's source-version records. Results and check arguments are stated in our own words, with printed-page locators. No source passage was copied into the deliverables.

| Source | Passages checked |
| --- | --- |
| [La conjecture de Weil. I](https://www.numdam.org/article/PMIHES_1974__43__273_0.pdf) | Cited numerical, duality and fundamental-estimate passages §§1–3 pp. 275–287, and pencil rationality/induction §§5.12–7.3 pp. 294–301; all source hypotheses and three pencil cases compared independently. |
| [La conjecture de Weil. II](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf) | Cited coefficient, monodromy, analytic and curve passages §§1.1–1.5 pp. 150–165, §§1.7–1.8 pp. 170–179, §§1.10–1.11 pp. 182–186, §§2.1–2.2 pp. 187–196, §§3.1–3.2 pp. 197–204, §§3.3/3.5 pp. 206–207, 210–212, plus 6.1.13 p. 246 and 6.2.7 p. 248; source-issue page images independently inspected. |
| [Abelian Varieties](https://www.jmilne.org/math/CourseNotes/AV.pdf) | II §1 pp. 75–78 and III §§9–11 pp. 113–119, including Corollary 9.6, the Frobenius degree/count signs and III.11.2 footnote 6; public errata index rechecked. |
| [Comptage des systèmes locaux ℓ-adiques sur une courbe](https://arxiv.org/pdf/1807.04659v5) | Public v5 Proposition 6.1.1 and its proof pp. 42–43, with tensor–Hom ordering and the imported purity/pole bounds compared. |
| [Indecomposable vector bundles and stable Higgs bundles over smooth projective curves](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p06-p.pdf) | Published Appendix B pp. 357–358 and bibliography p. 359 compared with v2 Appendix B pp. 35–36 and bibliography p. 37 for analytic ownership, family monodromy, half twist and the Weil II citation. |
| [Schiffmann arXiv v2](https://arxiv.org/pdf/1406.3839v2) | Appendix B pp. 35–36 and bibliography p. 37 compared with the published version. |

All eight source issues are independently confirmed, with this review's identifier and version-specific reasoning in the packet and reader:

| Issue | Locator and reason |
| --- | --- |
| E1 | Confirmed the author-marked unfinished degree calculation in III.11.2 p. 119, footnote 6. The main public v2.00 errata page, read 2026-10-08, has no separate III.11.2 repair; the packet requests the trace formula rather than certifying that calculation. |
| E2 | The v2 Appendix B pp. 35–36 and bibliography p. 37 point to §3.5.3 with incorrect Weil bibliographic data. Published Appendix B p. 357 still cites Weil I, while §3.5.3 is the equidistribution theorem of Weil II pp. 211–212. |
| E3 | The v2 p. 35 integer twist (−1) raises the weight of H¹ from 1 to 3. The displayed q^(−n/2) spectrum instead requires a chosen half twist of weight −1; published p. 357 uses (1/2). |
| E4 | The printed p. 212 angle density integrates to 1/4 on [0,π]. Haar probability requires (2/π)sin²θ, whose mass is 1; independently inspected the page image. |
| E5 | Printed p. 212 gives the wrong sign for the indicated H¹ eigenvalues. The alternating cohomological trace formula gives 1+q^n−2q^(n/2)cosθ; independently inspected the page image. |
| E6 | In Yu v5 pp. 42–43, F₁⊗F₂∨ identifies with Hom(F₂,F₁), and duality puts Hom(F₁,F₂)∨(−1) in H². The printed order is reversed; the self-pair and no-common-constituent applications are symmetric. No verdict is asserted for an uncollated journal version. |
| E7 | The finite subgroup wording at printed p. 160 is contradicted by the positive-degree central element constructed in (1.3.12). Its nonzero subgroup of ℤ has finite index; independently inspected the page image. |
| E8 | With ω₁=q^(−deg) from (2.1.1) p. 187, a norm exponent Re(r) gives modulus q^(−deg·Re(r)) and weight −2Re(r). The plus sign on pp. 195 and 211 is contradicted already by the Tate norm character; independently inspected both page images. |

## Validation and handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/DeligneWeightsAndPurity--DWP.0.json`: 83 nodes, **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/DeligneWeightsAndPurity--DWP.0.lean`: **exit 0**, 89 warnings, all exactly `declaration uses sorry`; no Lean errors. Available memory exceeded the required threshold. No language server, Lake build or cache operation was started.
- Cross-file assertions checked all 83 node statements, hypotheses, proof steps and acceptance properties; all 81 API and 44 test names/specifications; the seven corrected test kinds; all 65 uninstantiated schema statements and direct inputs; source verdicts and request consumer lists. The internal declaration graph has no cycle.
- JSON parsing, source checksums, authorized-file scope and `git diff --check` were checked before submission.

No further blueprint revision is requested. The orchestrator should retain the two explicit gaps and arrange the stated owner extensions; accept the proposed stage split/ownership edits through their normal assembly or restructuring route. Those outstanding implementation and atlas-integration decisions are not unperformed work in this independent review.
