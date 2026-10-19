# Independent review: Hodge classes realizing Jacquet–Langlands

Accepted after corrections. Reviewer: Codex — codex-dpm5k1, 19 October 2026; issue #3547. The design author was Codex — codex-fABs77, a different session. This is a review of the plan, not a claim of formalized mathematics.

The packet records a separate verdict and mathematical note for every node: **54 verified, 17 corrected, none added, none unverifiable**. Its 71 nodes comprise 6 definitions, 15 constructions, 36 theorems, 13 comparisons and 1 application. All 21 definitions/constructions have three API entries and three discriminating tests: 63 of each. All 45 planets are mathematical definitions, constructions or named results at the intended target granularity. The 62 routed paper items remain accounted for.

All eleven layers remain `planned`, none `closed`. The complete-pass status means that this planning pass is finished; four supplier gaps and sixteen explicit interface requests remain. These are recorded dependencies rather than contradictory claims of implementation or closure. Every node retains `implementationStatus: unchecked`.

## Sources and scope of the check

I read the [published IP23 PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S2050508623000203), Ichino–Prasanna, *Forum of Mathematics, Pi* 11 (2023), e22, pp. 1–135, [DOI 10.1017/fmp.2023.20](https://doi.org/10.1017/fmp.2023.20). Its SHA-256 matches the packet:

`3163d9e8a3b46fe2e70a8ec1f05fc3a56ca7a250baf9a8d022789655ebe4c065`.

Every node's locator and match was checked against the published text: the introductory theorem on pp. 4–5, definitions and proof chain on pp. 14–99, and Proposition A.1 on p. 101. The report and corrected files describe results in their own words. No source passage, private document or restricted book is reproduced. General results cited by IP23's bibliography are consumed through supplier interfaces or recorded as gaps; this review does not claim an independent review of that entire bibliography.

I also checked the [publisher's article page](https://www.cambridge.org/core/journals/forum-of-mathematics-pi/article/hodge-classes-and-the-jacquetlanglands-correspondence/308E81157C28AB3133226FD33EDC551B), [Prasanna's research page](https://sites.lsa.umich.edu/kartikp/research/) and searches for the exact title with “erratum” and “correction”. No published correction was located. That negative search is not a claim that none exists.

## Corrections made in place

The following changes are synchronized with the reader and, where they change a layer target, the roadmap definition. Each corrected node is identified below by its suffix after `HodgeClassesForJacquetLanglands:`.

| Node | Correction and evidence |
| --- | --- |
| JL.0/brauer-reduction | Corrected the proof's supplier attribution to the actual ClassFieldTheory Layer 10 request. The zero Brauer class remains the identity-correspondence branch; §12.2.1, p. 94 supplies the distinct-algebra setup. |
| JL.0/sign-lines | Restricted the two-dimensional type-(1,1) example to two weight-two factors. Weights two and four instead give (3,−1), (2,0), (0,2), (−1,3). The tensor sign labels of §3.3, p. 19 remain essential. |
| JL.1/exterior-star | The pinned `exteriorPower.map` is linear. Explained the conjugate-module conversion needed to apply it to the semilinear hermitian dual map in §5.2, pp. 26–29. |
| JL.1/quaternion-exterior | Made the general norm change explicit: for d′=αd, L′=α⁻¹L and J′=J/Nα, with right-module generator transport j′↦jα⁻¹. Recorded current `normMulEquiv` reuse. The pinned square-rescaling theorem alone does not provide this general change. |
| JL.2/tensor-model | Recorded current common-slot tensor and Brauer identities as reuse inputs to Example 5.14, pp. 36–37. The specific exterior action/form comparison remains this roadmap's target. |
| JL.3/weight-map | Corrected the dominant-coefficient API: the torus formula sends (k−2,0,0) to (a,−a,a,−a), a=(k−2)/2. Coordinate order (1,3,2,4) gives the Borel weight (a,a,−a,−a) of §11.3. Added the k=4 numerical regression statement to the suggested file. |
| JL.5/component-torus | Replaced the claim of a false component bijection by the precise missing-justification finding E4. The torus morphism suffices; non-simple-connectedness alone disproves no bijection (§4.3, p. 24). |
| JL.4/fock-comparison | Replaced references to unspecified signs/constants by all four creation/annihilation operators of (8.2), p. 51. Retained the polynomial-times-Gaussian domain. |
| JL.4/harmonic-restriction | Specified the projected identity P_X r=harmRestrict P_big of §8.5, pp. 52–54. Raw restriction need not preserve harmonicity. |
| JL.6/product-theta | Restored unitarity of the irreducible automorphic inputs in Lemma 9.2, p. 58. |
| JL.6/doubling-point | Separated normalized-intertwiner holomorphy from Lemma 9.8's existence of holomorphic, nonzero **unnormalized** local zeta data. Recorded the induction exponent, a_v, b_v, intertwiner target and exact Euler quotient of (9.3), pp. 62–64. The residue at 3/2 cannot be replaced by an unchecked positive-range Rallis value. |
| JL.6/backward-lift | Restored the actual norm-multiplier subgroup H_N^+, the embedding E⊂B, G=GU_B(X)^0, and irreducibility/unitarity hypotheses. Corrected the proof's local-integral normalization (Lemma 9.6, pp. 61–64). |
| JL.6/near-equivalence | The recovered source is a representation of H_N^+, not all B×(A_F). Retained the conjugated backward candidate and the precise irreducible unitary hypotheses of Proposition 9.5, p. 61. |
| JL.7/global-theta-data | Made irreducibility and unitarity of τ explicit in the norm-subgroup setup of §§10.1–10.3, pp. 65–68. |
| JL.8/arthur-parameter | Choose a full GL₂ representation whose quaternion transfer restricts with constituent τ, then take its choice-independent base change. One cannot directly transfer a subgroup representation. Added the precise R16.6 interface request and §11.4, p. 86 locator. |
| JL.10/auxiliary-hilbert-form | Added the missing direct R16.6 restriction/extension prerequisite already invoked by the proof; the existing Hilbert-weight node supplies parity only. Completed the source locator to §12.2.4, pp. 96–97. |
| JL.10/auxiliary-cm | Added Proposition 12.3's proof, p. 98, as the locator for the support-place choice in addition to §12.2.1 and Proposition 10.1. |

The new R16.6 request covers the automorphic restriction/extension and base-change-independence interface, including passage through the positive-infinity subgroup and the smaller norm subgroup. It serves both JL.8 and JL.10. Layer prerequisites, direct reader inputs and coverage lists now expose it. No supplier node was invented and no forward dependency through JL.10 was introduced into JL.8.

The GN.2 request no longer asks for new norm-rescaling foundations already present on current Tau Ceti. The independent-review prerequisite for E8 was discharged and removed from the remaining-work list. The four substantive supplier gaps remain unchanged in scope.

## Pinned baseline: all eight citations confirmed

The sources were read in the shared build at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. None of the eight entries was removed, renamed or inferred from current main.

| Declaration | What its pinned statement supplies; limits checked |
| --- | --- |
| `TauCeti.Hodge.HodgeStructureOn` | Opposed bounded filtration on a complex module with specified conjugation and an integer weight. The coefficient-field action is additional data. |
| `TauCeti.Hodge.HodgeStructureOn.tateTwist` | F^p shifts to F^(p+m), weight to n−2m, agreeing with the correspondence twist (d). |
| `TauCeti.Hodge.HodgeStructureOn.internalHom` | Hodge structure on complex-linear maps, weight n₂−n₁; rationality and L-linearity remain supplied by the realization interface. |
| `exteriorPower.map` | Induced **linear** map on the existing exterior carrier. Semilinearity requires the conjugate-module construction now explained. |
| `exteriorPower.pairingDual` | Determinant pairing from the exterior dual to the dual exterior power. Finite-free perfectness is justified in the paper's finite-dimensional setting, not assumed from the name alone. |
| `exteriorPower.map_top_eq_det_smul` | A rank-n finite-free endomorphism acts by its determinant on ∧ⁿ, using a basis indexed by `Fin n`. |
| `TauCeti.QuaternionAlgebra.rescaleJEquiv` | Square rescaling of the second parameter with explicit generator formulas. It is not the general norm-rescaling interface. |
| `MvPolynomial.IsHomogeneous.eq_zero_of_forall_eval_eq_zero` | Homogeneous polynomial nonvanishing over an infinite integral domain. The determinant proof first expands its finite coefficient span over the smaller parameter field; it does not pretend all coefficients are rational. |

## Ownership, prerequisites and closure

I read the reviewed audit in `data/library-coverage.json`, the statements of all **35 distinct external packet-node prerequisites**, and the relevant current upstream stage specifications. The **eight** upstream stage requests refer to GlobalNumberFields Layers 1, 2, 4 and 9, ClassFieldTheory Layers 10, 11 and 13, and ReductiveGroups Layer 3. A stage request is not represented as an already proved declaration. The special missing interfaces are named rather than silently supplied by a vaguely related existing node.

Current roadmap ownership was checked at commit `0d144d044dacebca17b654695b6f1ad58f159b27`, including the newer OrthogonalSpinGroups roadmap and its suggested file. Generic Spin, Clifford and low-rank exceptional structure stay there. This packet owns the additional hermitian, volume, multiplier and block-restriction comparison needed for IP23. The current Hodge evidence comes from the library modules; the provenance no longer implies that a current roadmap folder named `HodgeStructures` was read.

Current Tau Ceti was checked independently at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The packet's provenance and reader now identify these implemented reuse inputs:

- `TauCeti.QuaternionAlgebra.normMulEquiv` in `TauCeti/Algebra/Quaternion/SymbolEquiv.lean`;
- `TauCeti.QuaternionAlgebra.tensorAlgEquivTensorMatrix` in `TauCeti/Algebra/Quaternion/TensorProduct.lean`;
- `TauCeti.BrauerGroup.quaternionClass_mul` in `TauCeti/Algebra/Quaternion/BrauerClass.lean`.

These newer bodies do not enlarge the frozen baseline. The specific exterior-space transport remains a consumer proof; generic norm and common-slot algebra is reused. No existing Tau Ceti roadmap was edited or replanned.

The build order is coherent: JL.4 harmonic coefficients precede JL.5 rational coefficient comparison; JL.6 near-equivalence precedes JL.7 nonvanishing and JL.8 purity. The unconditional JL.10/main-hodge proof has no dependency on JL.9. Only the simultaneous all-prime conclusion depends on the exact degree-wise Kottwitz hypothesis. The d=0 constant-model boundary and equal-algebra identity branch remain explicit. The statement never upgrades a Hodge class to an algebraic cycle or an absolute Hodge class.

## Source-issue verdicts and the component repair

All eight entries now have independent `review` objects, all confirmed within their corrected scope. E1 concerns the generic nonreal coefficient-embedding convention; E2, E3, E6 and E7 are the stated degree/label/subscript/delimiter corrections. E5 requires a full Hecke character rather than evaluating a norm-one character on a general idele. E4 is narrowed from `error` to `gap`: the asserted component identification needs justification, but the weaker torus map is enough for this plan. No counterexample to that specific identification is claimed.

E8's rational-component/Galois-fixed distinction is substantive. I checked the proposed repair rather than assuming rational basis vectors are fixed. The torus cocharacter factors through j(s)=([s,s],s), so reflex-norm functoriality places its reciprocity image in j(A_F,f×). The full character is trivial there because η_T(j(s))=η(s⁻¹)=1. Its pulled-back component function therefore lies in the scalar extension of the actual rational invariant space W_Q. Finite permutation invariants commute with scalar extension.

Restriction gives a bilinear matrix family in the rational theta space and W_Q. Its determinant is separately homogeneous and is nonzero at the constructed complex theta/component point. Expand the finite coefficient span and apply infinite-field polynomial nonvanishing successively over Q(k) and Q. This supplies an invertible rational choice with a fixed component parameter. Purity gives its Hodge property; under Kottwitz, actual triviality of the source cohomology gives the simultaneous all-prime fixed property. No average of an invertible matrix is used. This verifies the repair at target-level proof depth; it is not an implementation of that proof in Lean.

## Validation and orchestrator follow-up

- `python3 scripts/check_blueprint.py research/blueprint/packets/HodgeClassesForJacquetLanglands.json`: **0 errors, 0 warnings**.
- `lean-check` on the suggested file at the pinned shared build: **exit 0; only 20 declaration-uses-sorry warnings**. The 139-line file has four real-bodied coordinate definitions, ten named theorem statements and ten examples. It does not replace missing heavy carriers by assumed data definitions.
- Reader/roadmap synchronization, all 71 `sources.match` statements, complete review coverage, retained routed items, JSON parsing and `git diff --check` checked.

No mathematical question prevents acceptance. The orchestrator still needs to register or route the four explicit supplier extensions: quaternionic Shimura realizations; automorphic cohomology and rational coefficient descent; quaternionic theta periods/residue; compatible realizations and HT tensors. It should also route the new R16.6 restriction/extension request. Generic Hodge–Tate tensor definitions remain owned by the compatible-realization extension, not duplicated here. The existing requests require their eventual supplier bindings; no layer has been marked closed prematurely.
