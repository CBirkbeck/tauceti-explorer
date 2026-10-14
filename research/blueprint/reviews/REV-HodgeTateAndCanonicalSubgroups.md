# REV-HodgeTateAndCanonicalSubgroups

**Accepted after correction.** Codex, session `codex-P3IfDh`, 14 October 2026. Refs #9394. This session did not write BP-HodgeTateAndCanonicalSubgroups or either imported part.

Reviewed the [packet](../packets/HodgeTateAndCanonicalSubgroups.json), [reader](../readmes/HodgeTateAndCanonicalSubgroups.md) and [suggested Lean file](../suggested/HodgeTateAndCanonicalSubgroups.lean). The verdict covers the effective whole-roadmap plan: **137 targets, 133 verified and four corrected; zero added or unverifiable**. All nine stages remain **planned**, none closed. The **25 supplier requests and 23 gaps** remain open. Acceptance establishes the planning pass and its supplier contracts; it does not establish the proposed theorems or library implementations.

## Scope and inventory

The T0–T5 part contributes 66 targets, and the T6 part 68. Their bytes and accepted independent-review identifiers match `assembly.imports`. Remove the outgoing T5/aip-hodge-tate-comparison, apply the definitive prerequisite lists and the six authoritative field replacements, then add the four whole-roadmap nodes. This yields 137 targets: 58 theorems, 40 constructions, 22 definitions, 13 lemmas, three comparisons and one application; **411 API items, 224 definition tests and 37 planets**.

| Layer | Targets | Planets |
| --- | ---: | ---: |
| T0 | 23 | 6 |
| T1 | 3 | 1 |
| T2 | 13 | 6 |
| T3 | 10 | 5 |
| T4 | 8 | 3 |
| T5 | 12 | 5 |
| T6:log-sites | 31 | 5 |
| T6:comparison | 36 | 6 |
| T6 | 1 | 0 |

Every target has one `review.checked` entry. Unchanged historical source verdicts are inherited from REV-HodgeTateAndCanonicalSubgroups--T0~2 and --T6~2, rather than claimed as new readings of every historical locator. This review independently read the four added nodes, the source assertions behind all six imported field corrections, all 42 distinct baseline declarations and the direct fine supplier statements. All imported targets were checked for effective prerequisites, assembly, API/test coverage and reader agreement. Fifty-two imported prerequisite lists differ from their historical parts.

## Corrections made in this review

| Target or metadata | Change and justification |
| --- | --- |
| T2/p-level-tower | Supplied nonemptiness of the compact-open index using a closed faithful linear embedding and intersection with GL_d(ℤ_p). Corrected the GL₂ component test: each component fixes a primitive Weil-pairing value, while TauCetiRoadmap ModularCurves' X_full is the disjoint union. |
| T2/tower-right-action | Restricted the acceptance clause to the actual GL₂ scalar test. A single example does not prove the general action-kernel description, which remains S0's target. The finite-level right-action order and tame commutation are unchanged. |
| T2/infinite-level-diamond | Stated the neat-level projection as separated **quasi-pro-étale**, using Scholze's terminology for diamonds. Added the strictly totally disconnected base-test proof and exact P5 affinoid-limit, D1 pro-étale-criterion and D3 morphism-class prerequisites. Added API for lifting a compatible cone, evaluating its projections and equality of maps into the limit. |
| T5/aip-torsor-hodge-tate-comparison | Restricted finite n to **n ≥ 1**, retaining the canonical-subgroup range at every Hilbert quotient. The n=0 coefficient-sheaf result uses AL₁ downstream. Added the ordinary z=0 Weyl-matrix non-example: full integral-level action does not preserve the selected anticanonical chart. |
| Same torsor proof | For finite n, ρ=u_nγu_n⁻¹ has lower-left entry p⁻ⁿc, which need not be divisible by p. Replaced the invalid use of the Γ₀(p) automorphy assertion for ρ by the general quotient-line chart law and the ratio of two actual AIP lifts over the same base point. The factor is (p⁻ⁿc)(pⁿz)+d=cz+d. Its membership in B_m follows from the torsor, not an ambient-radius inclusion. |
| Suggested Lean annotation | Corrected the direction of BHW (7.1): B_m is contained in the uniform ambient group. The prior annotation reversed the already reviewed T0-part E20 correction. |
| Inventories and receipts | Added three API entries; corrected the file length to 780 lines; distinguished 707 distinct indexed names from 771 index entries; recorded the small `toSubgroup` helper among the 16 light definitions/structures. Extended SCH15's continuity proof locator to pp.55–56 and recorded the extra ECD/CS17 readings. |
| Audit and assembly metadata | Replaced the claim that AUDIT-37 is unreviewed by its accepted review provenance. Explained that the current atlas merger does not apply assembly overrides or exclude the outgoing target. Synchronized the reader and packet. |

No baseline citation was removed or replaced. No target was added. The three limit API entries are part of an existing construction, respecting target-level granularity.

## Source checks and imported field corrections

The seven main-packet PDFs and three additional inherited-source PDFs matched their packet SHA-256 receipts. Read the following locators in their specified public versions; pagination below is the author/preprint pagination, not the different journal pagination.

| Source | Locators independently read for this review |
| --- | --- |
| [Milne, Introduction to Shimura varieties](https://www.jmilne.org/math/xnotes/svi.pdf), 2017 revision | §5, Theorem 5.28 and Remark 5.29, p.65: finite quotient maps and right translations. No naive full adelic point identification without the central-closure qualification is used to construct the tower. |
| [Scholze, Étale cohomology of diamonds](https://arxiv.org/abs/1709.07343v4) | Proposition 6.5, p.29; Lemma 7.19, p.37; Definition 10.1/Convention 10.2, pp.49–50; Lemma 11.22 and proof, pp.63–64. These supply the limit and the corrected projection class. |
| [Caraiani–Scholze](https://arxiv.org/abs/1511.02418v1) | Theorems 2.1.2–2.1.3, pp.11–12; Lemmas 2.3.6–2.3.7 and frame-to-flag construction, pp.19–21. The represented tower does not itself prove the requested relative v-sheaf transfer. |
| [Birkbeck–Heuer–Williams](https://arxiv.org/abs/1902.03985v4) | §7.1, pp.29–30, and §7.2, Proposition 7.11, Lemma 7.12, diagram (7.2), Theorem 7.14 and proof, pp.30–31. The finite-level group used in the theorem's proof governs the finite twisted torsor comparison. |
| [Fargues, Harder–Narasimhan filtration](https://webusers.imj-prg.fr/~laurent.fargues/HNgp.pdf) | Degree definitions, pp.2,7,9; §9, Theorems 6–7, p.26. Its p≠2 presentation is not the sole justification for the all-prime bound. |
| [Fargues, canonical filtration](https://webusers.imj-prg.fr/~laurent.fargues/canoniqueHN.pdf) | Theorems 2–3, pp.24–25: the all-prime cokernel statement and canonical-range distinctions. |
| [Scholze, Perfectoid spaces: a survey](https://people.mpim-bonn.mpg.de/scholze/CDM.pdf) | Theorem 4.13 and Remark 4.14, pp.27–28: the integral bounded complex, including p=2. |
| [Pilloni, Higher coherent cohomology](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf) | Proposition 7.4.2.1, pp.47–48; Remark 12.7.1.1, p.77; Lemma 14.1.1, p.92. These support the supersingular degree example, the étale integral sheaf and the finite-subgroup bound. |
| [Scholze, torsion cohomology](https://arxiv.org/abs/1306.2070v2) | Lemma III.3.4 and its continuity proof, pp.55–56. |
| [Boxer–Pilloni, Higher Coleman theory](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf), 3 March 2025 author manuscript | §§4.4.22–4.4.24, pp.73–75: rational frames, the open map and the Tate-basis torsor in the Levi comparison. |

The six imported field corrections are justified as follows:

- **T2/open-tower-hodge-tate-map:** a natural relative filtration on perfectoid test objects defines the v-sheaf map before representability. P9's completed pullback and effective descent contract remains explicit. Field-point evaluation is an acceptance check, not a construction proof. The continuity API now cites the complete Siegel proof.
- **T2/hodge-tate-flag-point:** the corrected tower hypothesis imports T2 rather than higher-tier S0. The kernel/quotient and left/right conventions agree with the rational tensor filtration.
- **T0/fargues-degree:** an order-p subgroup of a supersingular elliptic p-torsion group over W(l) has degree 1/(p+1). The valuation of each nonzero torsion point is 1/(p²−1); summing over its p−1 nonzero points gives that degree. The product example has degree 1+1/(p+1).
- **T0/fargues-hodge-tate-cokernel:** the all-prime p-divisible bound uses CDM12/FAR11. For an actual finite subgroup H⊂G, the quotient G/H and its Hodge–Tate/conormal diagram give the finite-subgroup bound. A general abstract finite group does not acquire an embedding without the explicit supplier extension.
- **T5/modified-plus-sheaf:** the integral image is a sheaf on the étale site; sufficient full level permits the stated Zariski interpretation. The p≥3 bound is not silently extended to the conditional p=2 boundary variant.
- **T0/semi-abelian-hasse-invariant:** R07.2 owns arbitrary-base BT₁ Hasse theory; C4 owns the semi-abelian Verschiebung determinant and boundary factorization. T0 names the section and keeps its ordinary-locus and minimal-extension applications.

The main `sourceIssues` list is empty. The 44 inherited entries retain their earlier independent verdicts (18 in T0, 26 in T6). E14–E26 collide between parts and must remain part-qualified. This review rechecked the BHW torsor containment/ratio and Tate-twist conventions relevant to the new assembly; it adds no new source-error allegation. All repository prose is paraphrase, with exact locators. No restricted book or source passage was copied.

## Baseline and current upstream reuse

All **42 distinct declarations** were independently read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The five main entries and 38 inherited entries overlap once. Their scope is retained:

| Interfaces checked | What is reused, and its limit |
| --- | --- |
| `CategoryTheory.IsCofiltered`, `CategoryTheory.Functor`, `MulAction.toPermHom`, `CategoryTheory.Limits.limit`, `CategoryTheory.Functor.Initial.limitIso` | Index categories, functors, opposite-group interpretation of right actions, chosen limits with `HasLimit`, and reindexing by an initial functor. They do not construct Shimura spaces or a geometric limit. |
| `TauCeti.Bialgebra.AugmentationIdeal`, `.CotangentSpace`, `.cotangentMap`, `.cotangentMap_mul`; `Ideal.Cotangent`, `KaehlerDifferential`, `Derivation`, `IsGroupLikeElem`, `GroupLike` | Augmentation conormal I/I², first-order displacement and the Leibniz rule, ordinary differentials/derivations and group-like elements. The finite character map still needs the group/sheaf realization. |
| `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat`, `.cartierDualBaseChangeIso` | Finite flat commutative affine group carriers and Cartier-dual base-change compatibility; no p-divisible or boundary one-motive theory follows from them alone. |
| `TauCeti.Cocharacter.parabolic`, `.levi`; `Module.Grassmannian`, `CategoryTheory.Grp` | Dynamic point subgroups, finite-projective quotient Grassmannian carrier and group objects. These do not supply descended representable flags, algebraic Levi quotients or torsors. |
| `Module.Invertible`, `Module.length`, `LinearMap.det`, `Valuation`, `ValuationSubring`, `PadicInt`, `PadicComplex`, `IsAdicComplete` | Algebraic rank-one modules, ordinary length/determinants, valuations and p-adic coefficient carriers/completeness. Ordinary length is not Fargues degree over a nondiscrete valuation ring. |
| `AlgebraicGeometry.Scheme`, `Scheme.Hom.normalization`, `Scheme.Modules`, `Scheme.Modules.pullback`, `SheafOfModules.Submodule`, `SheafOfModules.IsLocallyFree` | Scheme and module/sheaf operations with their actual hypotheses. They are not analytic normalization, generic-fibre descent or logarithmic adic geometry. |
| `TauCeti.Huber.Pair`, `.Hom`, `.Hom.spaComap`; `CategoryTheory.GrothendieckTopology`, `CategoryTheory.Sheaf` | Huber pairs, continuous plus-preserving maps, contravariant Spa maps, cover sieves and sheaves. The requested sites remain geometric constructions. |
| `AdicCompletion`, `BDeRhamPlus`, `fontaineThetaInvertP` | Ordinary ideal-adic completion and Fontaine's period-ring ingredients under the stated prime/completeness hypotheses. They do not supply completed tensor descent or structural period sheaves. |

AUDIT-37's [accepted review](REV-AUDIT-37.md) says all nine layers are not built. The aggregate library register has not incorporated that roadmap record. Existing ingredients are imported rather than re-planned. Current read-only upstream scope was checked at TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the newer roadmap families named by WORKERS, AdicSpaces, AlgebraicVectorBundles, ReductiveGroups and ModularCurves. No current Hodge–Tate period-map, AIP torsor, Fargues degree or infinite Shimura-tower implementation was found. ModularCurves' full-basis/fixed-pairing distinction prompted the corrected test.

## Closure, requests and assigned findings

Read all **179 distinct direct fine supplier statements**, with their hypotheses. All resolve to actual target ids. The other 23 external prerequisites are stage contracts; the explicit requests prevent treating their aggregate descriptions as completed missing inputs. All external roadmap owners lie in tiers ≤15, below this tier-16 plan. The effective internal target graph is acyclic, every coverage target is realized, and no target cites the outgoing T5 node. This check does not certify the entire transitive supplier programme as proved or reviewed.

The 16 resolution records, 27 supplier-id updates and 39 resulting updated citations are consistent with the current supplier interfaces. A3's pairing request is discharged by exact targets; partial requests keep their missing remainder. PerfectoidSpaces--P0 (including the added P5 affinoid-limit supplier) and ShimuraData still have `needs_changes` reviews. Their exact mathematical contracts are usable planning dependencies, not accepted upstream packages. P9 relative effective descent, arbitrary-C Raynaud realization, normalized coefficient models, integral generator comparisons and logarithmic derived-limit inputs remain explicitly requested. Packaging still follows the bottom-up supplier rule.

| Assigned finding | Checked ownership boundary |
| --- | --- |
| RT-AREA-padic-1/4 | T6 stops at the finite-level package; BP Theorem 4.4.40 remains PerfectoidShimuraVarieties S6. |
| /22 | T2 owns the open v-sheaf map and now its tower; S3 owns representability and compactified extensions. No S3→T4 supplier cycle is introduced. |
| /23 | The four BCGP-25 Theorem 4.4.1 applications belong to TC.2 and HigherHidaAndColemanTheory; their missing owner nodes remain a handoff. |
| /24 | The logarithmic primitive comparison is T6:comparison, built on ordinary P8 inputs; downstream cohomology consumers do not become suppliers. |
| /25 | Scholze–Weinstein classification is outside T2's global filtration application; its proposed early owner is still missing. |
| /26 | BT₁ Hasse/LF theory is R07.2; the general normalized multiplicative determinant pullback remains an exact R07.2 request. |

Each of the 62 definitions/constructions has an API and at least three discriminating mathematical tests. They cover wrong twists, wrong integral lattices, component conventions, non-effective quotients, non-perfectoid constant towers and non-log prelog structures rather than merely restating constructors. The new limit API fills its universal-property omission. Planet caps hold, and no proof-only lemma is promoted to a new target.

## Validation and next consumer

- `python3 scripts/check_blueprint.py research/blueprint/packets/HodgeTateAndCanonicalSubgroups.json`: **0 errors, 0 warnings**. The stock checker sees the four main nodes; it does not verify assembly overlays.
- Separate effective-union audit: both accepted import hashes, 137 unique targets/verdicts, coverage, internal DAG, all 42 baseline names, all API/test counts and layer planet caps pass. Every statement, hypothesis, proof step, acceptance clause, API/test statement and source locator occurs in the reader.
- `lean-check research/blueprint/suggested/HodgeTateAndCanonicalSubgroups.lean`: **exit 0**, four warnings, all declarations using `sorry`, no other diagnostics. The 780-line file has 16 light definitions/structures, six milestones (two proved) and ten examples. Heavy carriers stay README targets. Only the suggested file was elaborated, using the shared pinned build after checking memory.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/HodgeTateAndCanonicalSubgroups.lean`: passes; no admitted data definition.
- `python3 research/blueprint/intake.py check-files` on the four deliverables and this job's handoff: passes.

The [handoff](../handoff/REV-HodgeTateAndCanonicalSubgroups.md) records the consumer redirects and assembly instructions. The present `merge_blueprints` concatenates historical part nodes; it does not materialize `importedPrerequisites`, field replacements or the outgoing-node exclusion. Consequently raw promotion retains the retired sheaf-comparison target and its old link. The effective plan and reader are authoritative for packaging; the historical display is not evidence of an additional planned target. No promotion, other owner's file or atlas data was changed. No mathematical clarification is required for this verdict.
