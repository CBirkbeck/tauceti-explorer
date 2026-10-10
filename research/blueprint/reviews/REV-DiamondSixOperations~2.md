# Independent review of DiamondSixOperations, revision 2

Issue **#7042**, job **REV-DiamondSixOperations~2**. Reviewer: **Codex — codex-uZwf29**, 10 October 2026. This reviewer authored neither BP-DiamondSixOperations nor its revision. The input is the revision submitted in #6955; the previous review is REV-DiamondSixOperations (#388).

**Verdict: accepted after corrections. This is a completed target-level independent review, not a checkpoint.** Every node has an individual verdict in the packet: 85 verified, five corrected, none added or unverifiable. “Verified” assesses the stated mathematical contract and proof route, relative to its explicitly recorded supplier boundaries; it does not certify a Lean implementation or close those boundaries.

The packet remains `complete`, meaning a finished planning pass. All seven stages remain `planned`, none `closed`. Four proof gaps and four supplier requests remain. Acceptance does not discharge these obligations or certify the omitted geometric signatures as elaborated tests.

| Item | Reviewed count |
| --- | ---: |
| Nodes | 90 |
| Definitions / constructions / theorems / lemmas | 9 / 10 / 66 / 5 |
| API specifications | 141 |
| Mathematical unit-test specifications | 73 |
| Planets | 31 |
| Pinned baseline declarations | 24 |
| Direct external prerequisite ids, excluding baseline | 113 |
| Explicit gaps / requests | 4 / 4 |
| Planned / closed stages | 7 / 0 |

No node, API, test or planet was added or removed. The Tate-twist computation extends an existing test. Each of the 19 definitions and constructions has at least three mathematical tests. The 31 planets are central definitions, constructions and named results; their counts per stage remain 3, 5, 5, 3, 6, 6 and 3.

## Source and baseline verification

Read [Scholze, Étale cohomology of diamonds, arXiv:1709.07343v4](https://arxiv.org/abs/1709.07343v4), §§22–25, pp. 127–161, in full. The PDF hash agrees with the packet's version record. Rechecked the cited definitions and results in §§3, 7 and 17–21, including enhanced categories, canonical compactification, proper base change, the compactified field-point topos, constructible descent, compact generation, dimension conventions and point cohomological bounds. The per-node locators and hypotheses refer to this text. No conclusion about a separate published edition is asserted.

Read the required statements and relevant duality proof in the maintainer-cleared copy of [Huber, Étale Cohomology of Rigid Analytic Varieties and Adic Spaces](https://link.springer.com/book/10.1007/978-3-663-09991-8): Theorem 6.2.2 and Remark 6.2.4 (p. 329); §7.2 setup and Theorem 7.2.2 (pp. 366–368); Lemma 7.4.4 (pp. 387–389); setup (7.5.1), Theorem 7.5.3 and Lemma 7.5.4 with the relevant proof (pp. 389–395). The §7.2 geometric base and §7.5 quasi-separated analytic base are not restricted to the rank-one plus ring. Theorem 7.5.3 permits arbitrary source complexes with bounded-below target coefficients, which includes the open-extension comparison used here. This source evidence supports H3's consumer contract; it does not finish H3's separate higher-rank proof obligations.

Corrected the source log and reader: 7.4.4 is a **lemma**, and (7.5.1) is **setup**, not a theorem. All source results and proof explanations are in our own words. No source files or passages are added to the repository.

Opened all 24 baseline declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Every name, module and supplied statement is confirmed; **zero baseline citations removed or replaced**.

| Baseline group | Confirmed declarations and limits |
| --- | --- |
| Functions and indices | `LocallyConstant`, `Subgroup.index`, `LocallyConstant.evalₗ`: actual locally constant functions, ordinary finite-index carrier and evaluation functional. Finiteness of open index uses the profinite hypotheses. |
| Profinite arithmetic | `TauCeti.profiniteOrder`, `Subgroup.profiniteIndex`, `Subgroup.profiniteOrder_eq_mul_profiniteIndex`, `OpenSubgroup.profiniteIndex_eq_ofNat_index`: supernatural order/index already exist. Lagrange retains closedness of the subgroup, compactness and total disconnection; open index agrees with its positive finite ordinary value. |
| Jacobson topology | `JacobsonSpace`, `nonempty_inter_closedPoints`, `JacobsonSpace.of_isOpenEmbedding`: these detect closed points **after** Jacobsonity is proved. They do not prove the valuation space Jacobson by themselves. |
| Adjunction and scalars | `CategoryTheory.Adjunction.comp_counit_app`, `ModuleCat.extendRestrictScalarsAdj`: actual counit composition and actual extension/restriction along a ring map. They support labeled formal specializations. |
| Derived categories | `DerivedCategory`, `DerivedCategory.singleFunctor`, `DerivedCategory.IsLE`, `DerivedCategory.IsGE`, `HasDerivedCategory.standard`: the existing derived category and standard cohomological bounds, distinguished from a stable infinity category. |
| Stalks and duals | `TopCat.Presheaf.stalk`, `Module.Dual.eval`: actual stalk colimit and canonical double-linear-dual evaluation. |
| Valuation refinement | `ValuationSubring`, `IsLocalRing.exists_factor_valuationRing`, `finite_of_finite_type_of_isJacobsonRing`: local domination supplies a proper residue valuation; Zariski lemma handles the finite-type image when it is a field. |
| Concrete p-adic examples | `PadicInt.toZModPow`, `PadicInt.compactSpace`: actual residue map and compact p-adic carrier for the infinite Haar tests. |

Read the library coverage register and the relevant AUDIT-36 evidence, distinguishing scheme/ordinary-category analogues from diamond results. Also checked the current read-only TauCetiRoadmap and Tau Ceti library, including the newer roadmaps absent from the atlas snapshot. Read AdicSpaces and ProfiniteProPGroups README/Suggested interfaces. Existing order, index and Lagrange results are imports. Existing real/ENNReal Haar measure does not supply the torsion-coefficient functional on locally constant functions planned here. No upstream roadmap or library was edited or built.

## Corrections made in place

1. **S4/strictly-local-criteria-torsion, proof step 2.** A complex over ℤ/ℓ^m is not generally filtered by identical copies of its derived reduction. Use the degreewise ℓ-adic filtration of a representing étale complex: each graded complex is killed by ℓ and comes from F_ℓ. Exactness gives the finite dévissage. Retained the periodic-resolution/self-injective argument for the genuinely derived comparison `Rf^!(ℤ/ℓ^m) ⊗^L F_ℓ → Rf^!F_ℓ` (ECD 23.4, pp. 142–144).

2. **S5/tate-twist, proof step 3 and test `tateTwist_point`.** For m dividing n, comparison uses the power map μ_n → μ_m, taking ζ to ζ^(n/m), and its identification μ_n/mμ_n with μ_m. The inclusion μ_m → μ_n does not give the desired reduction. Power maps compose, so comparison through a common multiple establishes independence of the annihilator. Added the diagnostic to the existing test: for odd p and F₂ coefficients, μ₄ → μ₂ by squaring induces an isomorphism of twists, whereas μ₂ → μ₄ induces zero modulo 2. The geometric test remains explicitly omitted from elaborated Lean because its sheaf carrier is unavailable.

3. **S5/analytic-smooth-is-cohomologically-smooth, proof and direct prerequisites.** Separated étale compactifiability alone does not establish compactifiability of a ball projection. Reordered the proof around the characteristic-p ball, characteristic-zero free quotient and mixed-characteristic nonfree quotient calculations. These establish the local projection's compactifiability and smoothness; separated étale charts and composition then give the general smooth map. Added direct compactifiable composition, exceptional composition and exceptional étale comparison inputs. The source-open gluing uses the specified local twists; the recorded D4 quotient and dimension boundaries remain (ECD 24.4, p. 156).

4. **S5/spd-qp-smooth, first proof step and direct prerequisites.** The cyclotomic tower is not the special tower with no nonsplit finite étale covers in D6/spd-is-a-spatial-diamond. Spatiality still comes from D6; the particular quotient presentation comes from finite Galois levels, Tate-pair construction, limit comparison and torsor descent. Added direct D6 Tate-pair, D3 torsor, D5 limit and A4 effective tower-descent inputs. Made completion and choice of the tilted uniformizer explicit (ECD 24.5, pp. 156–157).

5. **S6/verdier-dual, API `verdierDual_pullback_smooth`, proof and prerequisites.** State the comparison for ℓ-cohomologically smooth g with ℓ-power-torsion Λ. Exceptional composition gives `D_(f∘g) ≅ D_g ⊗ g^*D_f`; smooth internal-Hom pullback and cancellation of D_g give the desired formula. This uses S3 exceptional composition rather than an arbitrary-base-change theorem requiring smoothness of f. Added the three directly used exceptional composition, smooth twist and smooth internal-Hom inputs. The structural map f needs eligibility, not smoothness.

The packet, reader and suggested-file ledger are synchronized. The actual Lean declarations are unchanged; the Lean edits update the review notice and two affected mathematical ledger entries. Reader stage headings now call the remaining work closure/signature inputs so they do not imply this independent planning review remains pending.

## Previous review and closure audit

All ten original revision requests were checked, including the list of ten previously comment-only API names. The revision removes SupplierContext and its false assertions about arbitrary carriers. Its mathematical contracts now specify the compact-Hausdorff slice and canonical continuity cocone; augmented/coCartesian enhanced diagrams and Kan universal properties; actual coefficient changes and normalized traces; all four local smoothness conditions, arbitrary sums and cohomological degree; and the actual ball, roots-of-unity twist, action relation and Spd object. Positive S6 targets retain complete C and **O_C**, while their valued-plus counterexamples are kept separate.

Six of the ten previously missing API names have meaningful, explicitly limited algebraic/formal specializations. Four geometric names (`Ball.prod_affinoid`, `Ball.diamond_relativeBall`, `Ball.openDisc`, `tateTwist_classical`) remain omissions, with their exact mathematical contract and required input. These omissions are accepted under §13's rule for unavailable conditions and the upstream representative-signature convention; they are not treated as signatures or passed tests. Reintroducing opaque hypotheses to fill them would invalidate this verdict. Full geometric signature work remains on the recorded actual supplier carriers.

The former S6 component-openness and valuation-refinement gaps now have target-level arguments. C4's relative envelope is an open fibre product of the total envelope; its limit compatibility and C5's field-point comparison identify open residue-field valuation spaces componentwise. This does not assume compactified plus rings are valuation rings. For a basic open specified by a finite-type algebra A, choose a minimal valuation W refining the given valuation and containing A. If its residue-field image is not a field, a nonzero maximal localization admits a proper dominating residue valuation by the pinned local-domination theorem. If the image is a field, Zariski lemma makes it the algebraically closed ground field, and a larger residue field admits a proper valuation trivial on that field. Composing would refine W while preserving A, a contradiction. Thus W has ground-field residue and is closed. Nonzero section supports are closed in their open domain, so the resulting closed-point density detects arbitrary sheaves, and then cohomology sheaves of complexes. This establishes the plan's alternate argument without asserting an arbitrary inverse-limit Jacobson theorem.

Read every directly cited external supplier contract; the four stage references are accompanied by requests. The internal prerequisite graph remains acyclic. The exact closure boundaries are:

| Owner | Remaining obligation and consumers |
| --- | --- |
| ClassicalAdicEtaleCohomology H3 | Higher-rank/all-G curve-duality and support/trace proof obligations, inherited by S5/ball-smooth. The exact consumer contracts exist and the cleared source supports their scope. |
| ClassicalAdicEtaleCohomology H5 | Non-discretely valued **local** smooth-curve compactification, inherited by S6/biduality. The cited discretely valued theorem does not settle it. |
| DiamondsAndVStacks D4 | Nonfree image-relation quotient geometry, proper quasi-pro-étale quotient map, representability and eligibility for averaging/nonfree smooth descent. Torsor descent alone is insufficient. |
| DiamondEtaleCohomology C8 | Diamond fibre-dimension inequality and canonical-compactification dimension comparison for both S1 cohomological bounds; the analytic inequality is a near miss. |

The four requests are precise: E2 geometric hypercover existence/common refinement; E3 Neeman compact-generator/coproduct criterion; D4 nonfree quotient geometry; C8 diamond dimension comparison. They import the existing geometry and categorical foundations. These are follow-up supplier work, not a reason to change a planned stage to closed.

**RT-AREA-padic-1/11 is correctly handled.** Canonical compactification is owned by **DiamondEtaleCohomology:C4**, effective v-descent by **DiamondsAndVStacks:D3**, and ECD §§11–13 geometry by **D5**. S0 consumes the envelope and owns compactifiability/calculus. The stale RS-05 D5 routing is not used to justify a duplicate canonical compactification. No ownership move or foreign packet edit was needed.

## Source findings

All four `sourceIssues` have a fresh verdict by this review.

| Finding | Verdict | Check |
| --- | --- | --- |
| E1, 24.1 proof, p. 152 | confirmed | The rational-open compactifiability verification is needed separately from the practical criterion's four conditions. The packet supplies it. This is a short omitted check, not a false smoothness conclusion. |
| E2, 25.4 proof, p. 161 | rejected | Failure for arbitrary inverse systems does not refute this projective-model system. The improved alternate valuation proof closes a planning argument without establishing a source error. |
| E3, 25.4 wording, p. 161 | rejected | The perfectoid field convention in 3.1/3.8 accounts for completeness; the formal statements nevertheless retain it explicitly. |
| E4, 23.10(i), p. 145 | confirmed for v4 | Disjoint n-dimensional balls over disjoint geometric points are compactifiable, spatially representable and smooth by **target** locality, with finite dimension on each spatial test but unbounded global supremum. The criterion needs the per-test bound. |

## Validation and handoff

`python3 scripts/check_blueprint.py research/blueprint/packets/DiamondSixOperations.json` reports **0 errors, 0 warnings**. The final suggested file passes `lean-check` at both exact pins with exit 0 and **57 warnings, all declarations using `sorry`**; no other warning or error occurs. Elaboration checks the written signatures, not the admitted proofs.

The suggested-file register still distinguishes target occurrences (one typed relative, seven specializations, 91 omitted), API occurrences (seven typed relative, 18 specializations, 116 omitted) and tests (15 specializations, 58 omitted). There are 47 distinct named Lean declarations and additional concrete examples. The finite F₅ trace, finite/p-adic Haar, unequal shifts, rank-two failure and Dirac obstruction signatures use actual carriers. Every mathematical node statement, hypothesis, proof step, prerequisite, API and test agrees with the reader; every API/test name is in the ledger. Counts, node ids, planets, unchecked implementation statuses and allowed edit paths were checked; `git diff --check` passes.

No acceptance question remains for the orchestrator. Continue the four supplier requests and inherited H3/H5 obligations with their owners, retain planned coverage, and supply omitted signatures when the actual carriers exist. No scratch artifact is required. The durable resume note is `research/blueprint/handoff/REV-DiamondSixOperations~2.md`.
