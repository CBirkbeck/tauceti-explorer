# Independent review of genus-one fibrations and rational elliptic surfaces, revision round 2

Accepted as a completed **target-level planning pass**, with the seventeen recorded gaps and twenty-three supplier requests retained. This accepts the mathematical contracts and their stated proof routes at that scope. It does not certify the unresolved source proofs, supplier integration, regular surface models or exhaustive classification. All implementation statuses remain unchecked; all seven layers remain planned and none is closed.

Reviewer: Codex, session codex-iHzSZP. Job: REV-DESIGN-NeronModelsAndSemistableAbelianVarietiesPartII~2, issue #6394. Date: 11 October 2026. This reviewer wrote neither the original design nor its revision. The previous review and the revision handoff were read before checking the revised deliverables.

| Item | Reviewed result |
| --- | --- |
| Targets | 168: 165 verified contracts, 3 corrected contracts, 0 added, 0 unverifiable |
| Kinds | 12 definitions, 43 constructions, 79 lemmas, 28 theorems, 6 comparisons |
| API contracts | 723 entries across all targets; 661 on definitions and constructions |
| Test contracts | 483 across all targets; 442 on definitions and constructions |
| Definitions and constructions | All 55 have at least three discriminating tests |
| Baseline declarations | All 546 confirmed; 3 line locators corrected, none removed |
| Consolidation | All 608 historical identifiers resolve to their owning target and API |
| Coverage | 7 planned layers, 0 closed; 17 gaps and 23 requests |
| Source issues | 27 inherited findings checked and confirmed; 2 findings added and confirmed |
| Planets | 29, naming definitions, constructions and central theorem targets |

The packet's new `review.checked` contains one individual entry for each current target. The historical 776-entry ledger has been replaced; the revision's consolidation map remains for consumers of the old identifiers. No prerequisite uses an obsolete consolidated identifier. Projections, generator formulas, restriction identities, inverse laws and routine proof steps have been incorporated into their owning APIs. The remaining nodes are mathematical targets, definitions or substantial constructions, rather than a mechanical expansion of every source proof step.

**Corrections made in this review.**

1. `G.1/canonical-type-classification` now explicitly lists I₀, Iₙ for n≥1, II, III, IV, Iₙ* for n≥0, IV*, III* and II*. The conclusion uses the primitive multiplicity vector and the full geometric predicate, including the local distinctions between I₂/III and I₃/IV. Its earlier route identifier did not specify the theorem. The source is [Schröer, equation (1), §3, pp. 9–10, arXiv v3](https://arxiv.org/pdf/2004.07025v3). The quasielliptic geometric proof interface remains an explicit gap.
2. `G.2/diagonal-quotient-example` now assumes an excellent DVR R, a finite integral closure R′ that is itself a DVR, unchanged residue field, and total ramification. The multiplicity argument already used these conditions, whereas the old statement did not exclude a semilocal or non-totally-ramified extension. The quotient imports the invariant-cover and polarization descent interfaces of R09.3. The example is in [Schröer, §8, p. 23](https://arxiv.org/pdf/2004.07025v3).
3. `G.2/llr-kodaira-comparison` now assumes a henselian DVR with algebraically closed residue field and uses its local torsor period. Its source locator is corrected to [Liu–Lorenzini–Raynaud, Theorem 6.6, pp. 496–497, and Remark 6.8, p. 497](https://www.math.u-bordeaux.fr/~qliu/articles/LLR.pdf). The statement, its supplier requests, the recursive-proof gap, the roadmap's G.2 description and the suggested file's omission ledger agree on this qualification.
4. The unnecessary R11.2 requirement was removed from the G.0 layer description: none of its targets depends on that parent layer. The Part II application's later model layers still import their actual parent results.
5. Requests to StableReduction Layer 6 and EllipticCurves Layer 1 now identify the needed numerical-Picard geometric realization, genuine scheme/function-field isogeny comparison and finite-extension compatibility. The separate SF.3 pointed-curve presentation adapter remains responsible for passing from arbitrary pointed genus-one schemes to native Weierstrass equations.
6. Seventeen remaining baseline descriptions containing Lean source headers were replaced by mathematical descriptions of their actual scope. No declaration or new mathematical target was substituted.
7. All inherited source-issue reviews now name this review. Eight CDL findings had incorrect inherited review pages; two had incorrect descriptions. These have been corrected, as have the IV and exceptional-graph review pages. The additional LLR qualification and Temkin–Tyomkin notation error are recorded with explicit independent verdicts.

The suggested file changes are comments describing the exact missing theorem signatures. No artificial geometric carrier or weakened theorem signature was introduced to make these targets appear implemented.

**Baseline and supplier checks.**

All 546 full declaration statements and ambient hypotheses were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Generated dual declarations were checked against their generating source and annotations. The three corrected line locators are:

| Declaration | Old line | Declaration line at the pin |
| --- | --- | --- |
| `CategoryTheory.IsIso.of_isIso_comp_left` | 353 | 354 |
| `AlgebraicGeometry.Scheme.SpecMap_stalkSpecializes_fromSpecStalk` | 124 | 127 |
| `AlgebraicGeometry.Scheme.Hom.normalization.hom_ext` | 439 | 437 |

In particular, relative normalization uniqueness needs both comparison triangles and an affine target map; finite normalization requires the stated finiteness/excellence inputs; tensor quotient equivalences preserve their scalar towers; and the additive short complex uses the native biproduct/difference sign. The baseline supplies these interfaces without proving the proposed global pinching, normalization or surface results.

The reviewed SF.0/R09/R11 records in `data/library-coverage.json` were read, and pending audit work was kept distinct. Supplier statements were read for SF.0–SF.6, R09.1, R09.3, A0-extension including the finer Raynaud adapter, and R11.2/R11.4. The exact SF.0 flat-annihilator, ideal-comap and affine ideal-restriction exports fit the conductor use. The existing parent Kodaira theorem covers elliptic geometric configurations; the Part II genus-one, multiple and quasielliptic interfaces are its extensions. The parent semistable Picard comparison does not already provide the full LLR arbitrary-torsor and additive-fiber comparisons.

Current upstream was screened at commit `c251d2e42c66f14c279d1e5c2708c5a91d8c8aec`, and the current Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The relevant StableReduction and EllipticCurves contracts, the nine post-snapshot roadmap Suggested scopes, and the four additional Completed roadmap scopes were read. AlgebraicVectorBundles' relative Spec/linear scheme and base-change signatures were inspected for possible overlap. The library, abstract lattices, numerical Picard types, minimal models, Tate algorithm and native Weierstrass machinery remain imports. This was a target-specific overlap check, not a claim to audit every library declaration. Nothing was built or changed in those read-only environments.

**Source fidelity and newly confirmed findings.**

Statements and source corrections are in mathematical prose, with locators. No excerpt fields or source passages are added. The packet retains the named authors' earlier reading and computational attribution separately from this review's fresh checks. In particular, William Lang's 2000 configuration article and the recursive EGA, Raynaud, Tsen, Lie/Picard and rational-surface proof inputs remain gaps rather than being presented as newly read or proved.

Fresh public checks cover the node and source-issue locators in Schröer v3; [Ferrand, §§1–2, 4–5 and Theorem 7.1/proof, pp. 575–578](https://numdam.org/item/BSMF_2003__131_4_553_0.pdf); [Temkin–Tyomkin v3, the definition and construction chain on pp. 3–19](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf); [Witaszek, Definition 2.17 and the relevant quotient/pushout lemmas in §§2.4–2.5](https://par.nsf.gov/servlets/purl/10429755); LLR's specified local comparison passages and the [2018 corrigendum, introduction and corrected statements, pp. 593–595](https://www.math.u-bordeaux.fr/~qliu/articles/CorrigendumToNeronModelsLieAlg.pdf). The canonical formula was checked in [Bombieri–Mumford, Theorem 2/Proposition 4, pp. 27–30](https://www.dam.brown.edu/people/mumford/alg_geom/papers/1976d--EnrClass-II-NC.pdf), and Lang's group/torsor argument in [Lang 1956, pp. 555–558](https://wstein.org/papers/bib/Lang-Algebraic_Groups_Over_Finite_Fields.pdf). Szydło's invariant signs and CDL's five relevant printed pages were inspected visually. The full Stacks conductor, tensor and pushout passages, including the linked historical correction patch, were read at their recorded tags. The report does not claim complete reading of these books, papers or recursive references.

The CDL records now correctly locate the Euler-characteristic symbol at p. 366, positive-rank boundary at p. 394, torsion-generator/length distinction at p. 365, A/D-star indexing and terminal edges at p. 267, and IV*/II* intersection data at p. 268. The sign in the p. 366 degree formula was already correct: its error is using the base curve's Euler characteristic in place of the surface's. The multiplicity bound must exclude equality a_t=m_t. These were checked in the [April 19, 2024 author manuscript, Proposition 2.2.5, Theorem 4.1.6 proof and Lemma 4.4.1](https://sites.lsa.umich.edu/idolga/wp-content/uploads/sites/1334/2024/08/EnriquesOne.pdf).

The new LLR finding `ELLR6.6` has a concrete counterexample to an unqualified nonhenselian period. Set R=C[t]_(t−1), choose E/C with a nonzero two-torsion point P, and descend E×G_m,s along t=s² using (e,s)↦(e+P,−s). Every rational map P¹_C→E extends and is constant, so E(C(s))=E(C). The translation cocycle is therefore nontrivial of order two over C(t). The quotient has a smooth proper special fiber at t=1, with multiplicity one. Over the henselization the cover splits and the local period is one. Thus the strictly henselian reduction used in the proof can change the period appearing in the printed statement. The existing 2018 correction concerns Theorem 4.3. A bounded search found no separate correction of this qualification; no assertion about all published editions is made.

The new `ETT6.1.1` finding concerns the quotient orientation in [Temkin–Tyomkin, Theorem 6.1.1 proof, part (5), p. 16](https://math.huji.ac.il/~temkin/papers/Ferrands_Pushouts.pdf). The étale relation is X₁=X₀×_X X₀, so X is X₀/X₁, as in Theorem 4.4.1 on p. 12. The printed reverse expression is inconsistent with the correctly oriented relation map in the next sentence. The argument survives this notation correction. A bounded search found no separate erratum; the journal typography was not checked.

The inherited historical Stacks 00DF finding is confirmed only as an already corrected proof reference. The [authors' July 24, 2025 patch](https://github.com/stacks/stacks-project/commit/aee70b2c90b64dc043aa7740e0d9c9346aa4323f) supplies the Hom-exactness argument tested against every module. The [current lemma](https://stacks.math.columbia.edu/tag/00DF) contains the correction.

**Finite checks, tests and their limits.**

Fresh independent calculations checked all 32 binary Weierstrass coefficient tuples, selected the 16 smooth ones, evaluated all eight constant changes and all 1,024 affine equation transports, checked all sixteen witness rows, and obtained the five disjoint orbits of sizes 2,4,4,4,2 with projective point counts 1,2,3,4,5. The packet's group cycles and the order-four doubling witness agree with the native curve API. This finite equation classifier does not supply the general pointed-genus-one-scheme presentation theorem.

All fourteen candidate coefficient records pass the degree, discriminant and reversed-chart polynomial checks. Their t=1 smooth-fiber counts are respectively 4,4,4,2,4,2,2,4,5,5,3,4,4,4. The first omitted model gives a hand local I₂* calculation at zero and a nonsplit I₂ tangent at infinity; together with its four-point fiber at one, its fiber count is 15+4+6=25. This supports the counterexample to the printed list. The earlier paper review's full fourteen-class search remains attributed: this review did not rerun an exhaustive bounded surface search, all-place Tate certificates, geometric resolutions or orbit distinctness. G.5 and G.6 continue to require those certificates.

For the bare bound invoked in the [Stacks 0C6L proof](https://stacks.math.columbia.edu/tag/0C6L), all 32 matrices of the form [[λI₂,M],[0,λI₂]] over F₂ and all 1,024 products were checked. They form a commutative unital five-dimensional subalgebra of End(F₂⁴). This refutes the general dimension-four bound used there, not the curve conductor lemma. The packet's finite-annihilator route does not depend on that bound.

The previous review's three test objections are resolved. The normalization-chart tests evaluate the actual pullback of q and tq and their coefficients; the relative-normalization section tests use the actual `toNormalization` map; and the function-field tests use the actual chart pullback followed by its generic germ. Their conclusions are no longer assumed as input coordinate identities. Native nilpotent conductor, actual comparison-section and flat recomputation tests are retained. Tests elaborate as proposed statements with placeholder proofs; their elaboration does not prove the statements.

Validation: `python3 scripts/check_blueprint.py research/blueprint/packets/NeronModelsAndSemistableAbelianVarietiesPartII.json` reports zero errors and zero warnings. The final complete suggested file passed `lean-check` at the pinned shared build in 116.8 seconds, exit code zero, with no errors and exactly 1,116 warnings, all declaration uses of `sorry`. No other warnings occurred. `git diff --check` passed. The packet's 17 gaps and stage `remaining` lists correctly prevent any layer being called closed.

**Items for the orchestrator.**

The review requires no further design revision. Follow-up work must close the listed source, geometric model, classification and supplier integration gaps before any claim of proof closure. The general Lang theorem and Tsen/Brauer consequence need a foundational owner; the component-descent bridge and LLR exact exports should be resolved with their existing owners. Packaging also needs an ordering decision: the parent's BGW nodal-pinching target imports Part II G.0, while the later Part II applications import R11.2/R11.4. The proof dependencies do not give a node cycle, but packaging the two whole roadmaps separately needs either an explicit bundle or placement of the generic pinching foundation with a lower owner. Removing G.0's unused R11.2 edge makes that actual boundary clear. This review does not edit the parent or move its identifiers.
