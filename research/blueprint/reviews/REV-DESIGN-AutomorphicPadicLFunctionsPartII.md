# Independent review: critical Hecke values over totally imaginary fields

**Job:** REV-DESIGN-AutomorphicPadicLFunctionsPartII, issue #3502. **Reviewer:** Codex, session codex-z5gl9r. **Date:** 2026-10-19. The design was written by the different session codex-ucfSVA for #3350.

**Verdict: accepted as a complete target-level planning pass.** Every target has an independent verdict in the packet: 30 corrected and 14 verified. Acceptance establishes the quality and honesty of the plan, not proofs of its theorem targets. All nine stages are `planned`, none `closed`. The three mathematical obligations G1–G3 and eleven supplier requests remain explicit. No unresolved contradiction is presented as an established result.

| Item | Reviewed total |
| --- | ---: |
| Layers | 9 |
| Nodes | 44 |
| Definitions / constructions / theorems / comparisons | 13 / 11 / 19 / 1 |
| Definition/construction API items | 74 |
| Definition/construction unit checks | 77 |
| Planets | 35 |
| Confirmed baseline declarations | 11 |
| Recorded source issues, each independently confirmed | 15 |
| Mathematical gaps / supplier requests | 3 / 11 |

No nodes were added, removed or renamed. Each of the 24 definitions/constructions has at least three discriminating checks. Planet counts in KV.0–KV.8 are respectively 3, 3, 4, 5, 3, 6, 3, 4, 4. The routed-item ledger still covers all 52 Kings–Sprang items; the independent ten-item BKO direction remains in the four-layer NonordinaryCMSpecialValues proposal.

## Sources and the scope of the verification

I read every node's cited locator and checked its statement, hypotheses, source match and proof dependencies against Guido Kings and Johannes Sprang, [arXiv:1912.03657v4](https://arxiv.org/pdf/1912.03657v4), using the [matching TeX source](https://arxiv.org/src/1912.03657v4) to resolve notation. All packet page numbers are the 85-page preprint's pagination, not journal pagination. The PDF SHA-256 is `fab8e605123cf9c399753b7114c4fd65000e1863e3507abdd4129c8c940fbb72`.

The source-issue audit covers Proposition 1.5, p.8; Proposition 2.27, pp.22–23; Theorem 2.30, p.24; Proposition 3.13, pp.35–36; Lemma 3.16 and Proposition 3.17, pp.37–38; the expansion on p.41; Lemma 3.25, p.43; Theorem 3.27, pp.44–45; Corollary 4.15 and Remark 4.16, p.54; equation (5.6.1), p.72; Theorem 5.27 and its proof, pp.74–79; and Appendix A.1, p.79. Every finding has its own verdict and reason. All statements and descriptions are in our own words; there are no source excerpts.

I also read the split-boundary passages in Burungale–Kobayashi–Ota, [published author-repository PDF](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf), introduction pp.943–944, §3 pp.950–954 and §6 pp.961–962, including the intermediate Rubin-conjecture context at pp.960–961. Its SHA-256 is `77ff329057e17cbad573cc309fce3f69f4ba6b73619c4ca203a4ed79a1cb790e`. The PDF has a cover sheet before printed p.943. These passages justify keeping the inert-prime central-value direction separate from ordinary Katz interpolation; they do not establish all the original Finis or Kato inputs.

The KS journal publication metadata, arXiv history and author publication lists were checked for corrections. The journal PDF was not read, so none of the fifteen findings is attributed to that text. Original Deligne, Finis, Kato and Serre sources were not independently read; their exact interfaces remain supplied or requested. The library index contains no cleared de Shalit copy, and no other copy was used. Its missing bounded-division argument remains G2.

## Corrections made in place

1. **Unit invariants, KV.0.** Proposition 1.5's arbitrary-module formulation needs a torsion-freeness hypothesis. For L=ℚ(ζ₃), R=ℤ[ζ₃,1/3], Γ=μ₆ and the weight 3σ, the nontrivial weight of a primitive sixth root is −1, which becomes 1 on M=R/(2). Thus M has invariants not predicted by the unrestricted formula. The corrected assertion requires R-torsion-free M; the finite locally free coefficient lines satisfy this. This is new finding **E14**. The native split weight decomposition itself permits torsion and is not restricted by this correction.
2. **Fixed base, KV.1.** The residue calculation now explicitly uses Γ-automorphisms of A over S with trivial action on S. Its acceptance check permits nontrivial action on A over that fixed base. Derived equivariant cohomology is still distinguished from ordinary cohomology followed by invariants; the inverse-limit comparison remains requested.
3. **Critical cap and tensor shift, KV.2.** Added direct native logarithmic-unit inputs and exact AlgebraicTopology Stages 5–6 requests for the group/singular comparison, finite-cover transfer, local-coefficient cap and fundamental class. The finite-deck comparison is not passed off as the infinite-deck group comparison. Specified the rank-one identification sending u^[a]⊗u to u^[a+1], rather than shuffle multiplication with its factor a+1. Added an API item and a degree-one test where 2 is a nonunit. Integral capping remains torsion-free; the localized normalization does not cancel nonunit indices.
4. **Refinement and polylogarithm, KV.2.** Renamed refined evaluation to say it avoids the **conductor norm**, not the unit-group torsion order; updated the roadmap and reader. Its separate torsion condition remains. Restricted the polylogarithm comparison to a characteristic-zero field base, with a chosen complex embedding for the analytic comparison, matching Theorem 2.36/Remark 2.37, pp.28–29 and the P3 supplier. New finding **E15** records the repeated B-basis label in Theorem 2.30, p.24: the second basis belongs to B∨, as the following formula already indicates.
5. **Native weight and unit theory.** Replaced the redundant ReductiveGroups weight-decomposition request by two pinned Tau Ceti declarations. Added two pinned Mathlib logarithmic-unit declarations to critical evaluation and the Borel model. No new generic torus representation or Dirichlet-unit theory is planned.
6. **Complex algebraicity, KV.5.** Removed the ordinary L3/cm-periods dependency from the Shimura formula and its layer. CM.1 Serre tensors and the ideal-period construction provide the complex periods without imposing a p-ordinary hypothesis on a complex algebraicity theorem.
7. **Theta checks, KV.6.** Added the critical augmentation formula, an index-two restriction check valid also at p=2, and an elliptic augmentation check that rules out replacing a nonzero theta value by the zero function. The general torsion-point theta function remains generic unless its killing dual is étale.
8. **Fourier level refinement, KV.7.** Replaced an ambiguous refinement assertion by the exact annihilator-support rule: an inflated function transforms to zero at characters nontrivial on the level kernel; at descended characters it has the lower-level transform. Added the ℤ/4→ℤ/2 example with support at frequencies 0 and 2 and two matching suggested Lean signatures. The inverse kernel and finite-cardinality denominator are unchanged.
9. **Ray measure and Katz comparison, KV.8.** Added the existing continuous-weighting and projection-formula nodes as direct prerequisites; the clopen unit restriction is made by extension by zero. Restricted the final comparison to the current Katz supplier's actual range: L=K, tame conductor one and types −kΣ−Σ d(σ)(σ−barσ), k≥1, d(σ)≥0. The general interpolation target still has arbitrary allowed tame conductor and critical β−α.
10. **Review and document consistency.** Classified all 73 original tests with their required `kind`; the four new checks bring the total to 77. All 74 API items were checked against uses. Put the parent roadmap first in the Part II prerequisite list; updated exact layer suppliers, audit notes, source-version evidence and `remaining` lists. Synchronized every target, hypothesis, API, check, dependency and source issue in the reader. Added the top-level independent review and all fifteen source verdicts; implementation status was not promoted.

## Baseline and supplier verification

I read each declaration's complete statement at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, as appropriate. None of the original seven citations was removed or misattributed; four useful native inputs were added.

| Declaration | Actual input, with its limit |
| --- | --- |
| `NumberField.IsCMField` | The genuine CM predicate, imposed on K; a totally imaginary extension L is not automatically CM. |
| `AbstractMeasure` | Native continuous linear functional on continuous maps, with its existing algebraic operations. |
| `AbstractMeasure.dirac` | Continuous evaluation, supplying the two auxiliary atoms. |
| `SchwartzMap.tsum_eq_tsum_fourier` | One-dimensional real Schwartz Poisson summation; lattice iteration and basis determinant remain part of the continuation proof. |
| `fourier_gaussian_innerProductSpace` | Finite-dimensional real Gaussian transform for positive real part of its parameter, with its exact constants. |
| `mellin` | The native positive-real integral and its s−1 kernel, not a convergence theorem at continued values. |
| `Complex.Gamma_eq_integral` | Euler Gamma integral for Re(s)>0, used only in that domain. |
| `TauCeti.Comodule.isInternal_weightSpace` | Split monoid-algebra comodule weight decomposition over a commutative semiring. |
| `TauCeti.Comodule.endOfPoint_tmul_of_mem_weightSpace` | Scalar point action on a weight vector, including scalar extension. |
| `NumberField.Units.logEmbeddingEquiv` | Units modulo torsion identified with their integer logarithmic lattice. |
| `NumberField.Units.instZLattice_unitLattice` | The full real lattice; finite-index passage and coordinate change produce the compact unit torus. |

The reviewed parent library audit at L0/L3/L5 was read. I read the current **GlobalNumberFields** and **ArithmeticDirichletSeries** roadmaps in full, and the relevant ReductiveGroups, DifferentialGeometry and AlgebraicTopology readers and suggested signatures. Current TauCetiRoadmap was checked at `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read-only. Existing Hecke carriers, generic forms, Stokes, integration and native weight theory are imported rather than replanned.

Every cited nonlocal blueprint node was read, including P0–P4 tensor/Poincaré APIs, CM.0–CM.1, AL.1, parent L0/L3, measure L1–L3, SF.2, C1/C5, R07.1 and the PS.0/PS.1 period interfaces. Broad stage names are used only with exact requests where those nodes do not yet supply the need. There are eleven requests after removing one redundant request and adding the two topology interfaces. Closure, stage target realization, stage ordering, all planets and the 52+10 routed requirements were checked. There are no added lemma nodes and no hidden completed-theory substitutes in the Lean outline.

## Outstanding obligations and orchestrator notes

- **G1:** compare algebraic residue, corrected local current, unit orientation and p-adic differential conventions in one commuting normalization argument. Integer exterior-algebra calculations reproduce the recurrence and top coefficient for every degree in dimensions 1–6. They do not prove the global comparison or remove G1.
- **G2:** establish uniform integral bounded division of the auxiliary atoms, including torsion components and common zeros. The finite cyclic-group average has integral character values but nonintegral indicator values, so density alone cannot replace this argument.
- **G3:** prove the special EK-class divisibility needed for full-unit descent at nonunit torsion indices. Integral capping for arbitrary torsion groups is not claimed.
- The eleven supplier contracts are recorded with exact consumers, and every stage lists its direct remaining contracts. Their owning roadmaps should receive those requests; no upstream files were changed here.
- Keep the BKO split and the shared elliptic-unit foundation acyclic. The review did not expand this roadmap into that separate design.
- Kings–Sprang's later [arXiv:2603.15446v1](https://arxiv.org/abs/2603.15446v1), Introduction pp.1–4, constructs arbitrary-prime rigid analytic interpolation in the β=0 range. It was screened as later work, not an erratum or a uniform two-weight integral boundedness input. Its extraction/routing is an orchestrator decision outside this review.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicPadicLFunctionsPartII.json --index <pinned-declaration-index>` reports **zero errors and zero warnings** with 44 nodes and all nine stages planned. `lean-check` elaborated the 171-line suggested file successfully at the pins, with only its 27 expected proof-placeholder warnings. It has eight light real-bodied definitions, no data placeholders and no heavy substitute carriers. The statements remain proposed signatures, not proved theorems.

The submission also checks JSON/file intake, complete independent node/source verdicts, reader/packet consistency, routed coverage, planet limits, whitespace and absence of private paths or source excerpts. The handoff records the remaining mathematics and supplier contracts, so no scratch files or source downloads are needed by the next worker.
