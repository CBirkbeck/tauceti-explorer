# Independent review: Smooth representations of local groups, Part II

Job REV-DESIGN-SmoothRepresentationsOfLocalGroupsPartII; issue #3616. Reviewer: Codex, session codex-3Rl9BT, 2026-10-18. The design being reviewed was written by another worker.

**Verdict: accepted as a partial packet.** All 87 target-level nodes have been checked: 53 verified and 34 corrected; none added or left unverifiable as a statement. This accepts the corrected plan and its honest gap records, not proof closure or a completed formalisation. SRU.0 is planned; SRU.1–SRU.7 are partial, with precise remaining inputs. There are 12 gaps (five retained, seven added), five requests, and five imports from roadmaps outside the atlas snapshot. No stage is closed.

The packet contains 13 definitions, eight constructions and 66 theorems, with 152 API entries, 83 definition/construction checks and 38 planets. Every definition/construction has at least three checks. One new isogeny check was added. All 32 baseline declarations are confirmed at the immutable pins; one deprecated name was replaced. The 454-line suggested file elaborates. Its only warnings are the expected theorem `sorry` warnings.

## Corrections and the per-node record

The packet's `review.checked` is the exhaustive 87-node ledger, including source locators, individual corrections, API/check counts and explicit proof conditions. It is part of this review, rather than an inference from the validator. The following groups explain the mathematical changes.

- **SRU.0:** Hilbert-sum, GNS and completion continuity estimates now use the norm bound valid on the zero space. The proper-algebraic-sum check uses an actual infinite-support vector in ℓ²(ℕ), rather than the false assertion that an infinite index set suffices. Domination in GNS gives a dense-range contraction, whose adjoint is injective but generally not isometric; its polar factor supplies the isometric intertwiner (BHV A.1.4, pp. 307–308). Polar decomposition is imported from existing OperatorTheory/PolarDecomposition, Part B PD-B24–B36. Pure positive-type irreducibility uses the invariant projection and cyclic density; orthogonal subrepresentations need not be inequivalent. The projection prerequisite and the completeness hypothesis of the Lean density theorem were corrected.
- **SRU.1:** The total-set weak-containment criterion now handles sums of unrelated cyclic spaces using BHV F.1.3, pp. 421–423, rather than expanding uncontrolled mixed coefficients. Godement's theorem retains its positive-L¹/GNS proof input as a gap (BHV C.5.3, p. 382); an unsupported uniform-equicontinuity argument was removed. The Fell basis proof includes neighbourhoods about arbitrary member points, and the sequence criterion preserves the index and uses a compact exhaustion under second countability. Closure of the set of a sequence does not prove convergence. Relative isolated-summand isolation is retained in the form GI18 A.2 uses; its finite-product application now records the missing tensor-product/Fell compatibility theorem.
- **SRU.2–SRU.3:** Finite-length semisimplicity retains admissibility; uniqueness up to scalar of completed invariant forms retains irreducibility. The suggested uniqueness/complement statements now assume a locally profinite topological group. Tadić's subsequence argument uses uniform admissibility, a countable Hecke spanning family and diagonal extraction, instead of a false finite list of inducing supports. The global finite-character decomposition in Miličić remains conditional on the existing bounded-trace gap. Discrete-series isolation now explicitly needs the local topology of the tempered dual; neither Bernstein-centre convergence nor uniqueness of tempered support supplies it. Ordinary unramified characters were checked against SRup SR.3.1 and distinguished from weakly unramified characters.
- **SRU.4:** Curtis–Iwahori–Kilmoyer §4, Lemma 4.3 and Theorem 4.4, pp. 94–95, independently support the finite-Hecke sign character and its degree. The alternating-character identity and Rodier constituent/exponent combinatorics are explicit proof inputs; an unsupported Boolean submodule-lattice assertion was removed. Howe–Moore now uses compact K-orbits of fixed vectors, not the false uniform unit-ball decay, and records the full contraction/Mautner propagation input. G/G⁺ is compact abelian in general and finite in characteristic zero; the positive-characteristic PGL_p example prevents the stronger assertion. The Steinberg-isolation proof supplies the Iwahori-block hypothesis before invoking Levi genericity.
- **SRU.5:** Temperedness uses the Langlands/Casselman exponent criterion, not false Weyl stability of an individual constituent's Jacquet exponents. The unbounded-region exclusion uses the reflection-type signature theorem of BCP §5.2, p. 53, with its Hecke/characteristic adapter recorded as a gap; a single exponent does not by itself prove coefficient nondecay. The rank-one reducibility check distinguishes nonsplit endpoint extensions and their negative-endpoint quadratic twists. The displayed type-C rank formula assumes n≥2, with n=1 routed to A₁.
- **SRU.6:** The split companion retains its full isogeny: PSU(2n+1) gives Sp(2n), not adjoint PSp(2n); PSU₃ is a new test. The nonsplit categorical supplier is BC3 Theorems 1.3.1 and 1.4.1 plus Corollary 6.2.6, not the split-only Barbasch–Moy theorem. Generic/sign transport, the isogeny adapter and positive-characteristic Hecke transport remain explicit inputs. Restrictions contain the adjoint representation and give two copies of the indicated defining/spin representations. The odd-unitary residual statement retains genericity, unitarity and all ambient half-integrality hypotheses. Central compact parts mean central in the full L-dual and compatible with a unitary character twist.
- **SRU.7:** The simplified KL dictionary is restricted to split adjoint G; arbitrary isogeny can require a nontrivial enhancement even when e=0. Aubert's corrected proof is an access gap, while Ban02 Theorem 3.1, p. 678, independently corroborates the endpoint and cites the 1996 erratum on p. 692. La24 Definition 4.2 and Theorem 4.3, p. 18, specify the centre-preserving Iwahori–Matsumoto convention and Kato's alternating induction–restriction identity. CiF4 Theorem 3.1, author pp. 10–11, supports graded unitarity preservation. The nilpotent-zero identification with U₀ᵍ uses the real slice, not all real parts of parameters with arbitrary compact part. Regular strata retain central compact twists. Triple-centraliser classification keeps its real/central-compact hypothesis. The four E₈ endpoint formulas are now explicit. Both 4A₁ coordinate-lattice exclusions and the switched source labels were checked separately.

The roadmap JSON and reader were brought into agreement with these corrections, including scope, source provenance, dependencies, coverage, APIs, checks and gaps. The existing valid character example comparing a nonsplit principal series with the direct sum of its constituents is retained.

## Baseline verification

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each raw module was opened at its pin and its declaration and surrounding hypotheses read. The following lines locate the checked declarations; full modules, scope conditions and convention comparisons are in `baseline.declarations[].checked` and `provides`.

| Library | Declaration | Line |
| --- | --- | ---: |
| mathlib | `ContRepresentation` | 54 |
| mathlib | `ContinuousMap` | 33 |
| mathlib | `InnerProductSpace.Core` | 154 |
| mathlib | `LocallyConvexSpace` | 51 |
| mathlib | `Matrix.PosSemidef` | 59 |
| mathlib | `MeasureTheory.Lp` | 89 |
| mathlib | `MeasureTheory.Measure.haar` | 584 |
| mathlib | `Multiplicative` | 46 |
| mathlib | `Representation.IsIrreducible` | 30 |
| mathlib | `Set.extremePoints` | 70 |
| mathlib | `Submodule.orthogonalProjectionOnto` | 121 |
| mathlib | `TopologicalSpace.generateFrom` | 70 |
| mathlib | `UniformSpace.Completion` | 291 |
| mathlib | `UniformSpace.Completion.innerProductSpace` | 89 |
| mathlib | `WeakDual.isCompact_closedBall` | 269 |
| mathlib | `closure_convexHull_extremePoints` | 96 |
| mathlib | `convexHull` | 46 |
| mathlib | `extremePoints_convexHull_subset` | 293 |
| mathlib | `lp` | 371 |
| tauceti | `Matrix.PosSemidef.KolmogorovSpace` | 126 |
| tauceti | `Matrix.PosSemidef.inner_kolmogorovFeature` | 142 |
| tauceti | `Matrix.PosSemidef.kolmogorovEquiv` | 285 |
| tauceti | `Matrix.PosSemidef.kolmogorovFeature` | 133 |
| tauceti | `Matrix.PosSemidef.kolmogorovFeature_dense` | 171 |
| tauceti | `Matrix.PosSemidef.kolmogorovIsometry` | 220 |
| tauceti | `TauCeti.ContRepresentation.IsUnitary` | 52 |
| tauceti | `TauCeti.ContRepresentation.IsUnitary.adjoint_eq_inv` | 184 |
| tauceti | `TauCeti.ContRepresentation.IsUnitary.subrepresentation` | 100 |
| tauceti | `TauCeti.ContRepresentation.matrixCoeff` | 73 |
| tauceti | `TauCeti.ContRepresentation.matrixCoeff_apply` | 80 |
| tauceti | `TauCeti.ContRepresentation.subrepresentation` | 49 |
| tauceti | `TauCeti.IsPositiveDefiniteSub` | 140 |

`Submodule.orthogonalProjection` was replaced by `Submodule.orthogonalProjectionOnto`; no other baseline citation was removed. The projection needs `HasOrthogonalProjection`, available for a closed Hilbert subspace, and its codomain is the subspace. Tau Ceti `matrixCoeff` assumes operator-norm continuity and uses the other inner-product slot convention; the planned strong-continuity coefficient and inverse adapter are therefore still needed. `IsPositiveDefiniteSub` requires an additive commutative group. Algebraic irreducibility, closed-subspace irreducibility and Hilbert completeness are kept distinct. Krein–Milman does not provide Milman's closed-convex-hull converse.

## Sources, suppliers and ownership

The packet lists 25 source entries, with public URLs and version-specific locators. Six entries were added: CIK71, BCP, La24, Ban02, CiF4 and the existing polar-decomposition roadmap. These are used for particular required results, not summaries of the sources. No verbatim passages or excerpt fields remain.

All three local source issues and all seven referenced extraction findings have explicit independent confirmed verdicts and reasons. Gan–Savin's compact-type operator needs the missing dimension factor. The Ciubotaru–Harris dominant-chamber constituent convention, noncentral-compact classification scope, F₄ weight typo, hermitian locus, exceptional orbit indexing and 4A₁ case labels were checked at their specified locations. The noncentral G₂ witness is retained. These CH26 findings concern **arXiv:2311.15300v1**. The published Annals revision was not collated, and this review does not assert the same errors occur there. Gan–Savin was read in the public published version; inherited hashes/version metadata are not new cross-version comparisons.

Aubert's original §1 was accessible through public OCR. The full §2–3 and the 1996 erratum were inaccessible; historical claims to have read them were moved into explicitly prior-design metadata. Ban02 corroborates the endpoint, not the corrected resolution or its positive-characteristic extension. `CitedOnly` entries remain secondary references whose statements were checked in the read citing sources; they are not represented as independently read originals. Nonroutine unsupplied proof steps are recorded as gaps.

The reviewed library audit (`data/library-coverage.json`, OneParameterSemigroups Part C) and current read-only Tau Ceti main `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were checked. Existing positive kernels and Kolmogorov spaces are imported. Current additive GNS requires `AddCommGroup`, so it supplies the abelian case but not the nonabelian translation action. Current Schur/equivalence results use finite-dimensional hypotheses and do not replace Hilbert Schur. Current TauCetiRoadmap main `350e970ce49f707a327909beac0b7b7c782cc7ee` supplies OperatorTheory/PolarDecomposition; no duplicate polar theory is planned.

Supplier statements and all five requests were read. In particular SRup's tempered-support target supplies decomposition/uniqueness, not the missing spectral topology; NQS M0 supplies Hilbert Schur/projectors; BST B5 supplies L¹ duality; AST §7.0b owns GL_n unitary classification; OAD D1–D2 supplies group C*-algebras, without automatically supplying the L¹ comparison. Excursion ES5 and ES7 use ℓ-adic coefficients and the explicit complex-field identification and normalised-induction dictionary; ET.4's character supplier is used in characteristic zero. ReductiveGroups and LieHighestWeight imports retain their exact root/weight scope. The open roadmap heads are recorded in `upstreamImports` and source metadata.

This Part II is outside the 88-roadmap Caraiani–Newton tier order; no tier move is asserted or made. Its own stages are ordered foundations → topology → smooth/unitary comparison → limits/isolation → spherical classification → nonsplit transfer/KL strata. No upstream roadmap was edited. The intended consumers remain separate.

## Validation and remaining orchestration

- `python3 scripts/check_blueprint.py research/blueprint/packets/SmoothRepresentationsOfLocalGroupsPartII.json`: zero errors, zero warnings.
- `lean-check research/blueprint/suggested/SmoothRepresentationsOfLocalGroupsPartII.lean`: exit 0 at the pinned shared environment; only theorem `sorry` warnings. Memory was checked first; no build, dependency update or language server was started.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/SmoothRepresentationsOfLocalGroupsPartII.lean`: passes; no sorry-bodied data definitions.
- Reader anchors, node headings, API/check names and Lean mappings, JSON provenance, changed-path scope and whitespace were checked. Validation does not prove the mathematical targets.

No unresolved contradiction remains in the reviewed scope. For follow-up planning, assign the 12 named gaps from the packet, especially the seven newly exposed proof inputs, without duplicating their current suppliers. LieHighestWeightPartII (#3373) already owns the nilpotent-orbit input. The K-theory, bounded-trace and PI inputs still need precise owners. Collation with the published CH26 revision and access to Aubert's corrected proof are source follow-ups. Packaging must retain the actual companion isogeny, the real/central-compact restrictions and the distinction between an accepted review and a proof-closed roadmap. No answer from the orchestrator is needed to accept this partial review.
