# Independent review: LocallyAnalyticDistributions L0

**Verdict: accepted after corrections.** Reviewer: Codex (GPT-6), session `codex-jVle16`, job `REV-LocallyAnalyticDistributions--L0`, issue #9248, 13 October 2026. The reviewed author was Claude, session `claude-6BAjPW` (BP issue #9290, PR #9438). I did not author that input. This is a complete independent pass, not a checkpoint.

The packet remains `complete` and L0 `planned`, with one explicit gap and no requests. PROTOCOL §0 permits planned chains to end in a recorded gap. L0 is **not closed**. The compact-type extension theorem remains conditional on H1/H2, and its predecessor three-space target must remain conditional during assembly. Acceptance verifies the corrected plan and the honesty of this boundary; it does not assert a proof of that extension result.

## Counts and scope

The input had 31 nodes and 27 baseline declarations. The corrected packet has 36 nodes: 8 definitions, 9 constructions, 11 theorems, 4 lemmas and 4 comparisons. Of the original nodes, 21 are corrected and 10 verified; 5 key inputs are added with `addedBy: REV-LocallyAnalyticDistributions--L0`. The checker reports 154 API items, 68 unit tests, 31 baseline declarations, 2 planets, 4 independently reviewed source issues, 1 gap and 0 requests. Every definition and construction has at least three meaningful tests. All nodes remain implementation-unchecked: these are planning targets, not formalisation claims.

The eighteen predecessor L0 nodes are imported, not repeated. Their exact statements and the continuation map were checked. In particular, merely injective compact Banach transition maps require tensor injectivity; topological-embedding preservation alone does not prove the compact-type tensor theorem. The five new nodes expose the nonroutine functional-analysis inputs at target level, without splitting every proof into lemmas.

## Source and statement checks

I read the source at every original and added node locator, including its proof where needed. Statements and proof sketches are written in the roadmap’s own words. No source passages or excerpts are stored here. The later maintainer instruction clearing selected books overrides the issue template’s older public-only restriction: Schneider’s *p-Adic Lie Groups* was read from the cleared library in place. No copy of that book or a passage from it was made. The packet records public URLs for the public sources and edition information for the cleared book.

The main checks were Schneider, *Nonarchimedean Functional Analysis*, §§1–13, 16–20 at the packet’s proposition/page locators; Schneider, *p-Adic Lie Groups*, Lemma 1.4 (p. 5), §§5–8 (pp. 25–56), §10 (pp. 75–79) and §12 (pp. 84–88); Schneider–Teitelbaum §1, Proposition 1.5 (pp. 2–5), and §2 (pp. 5–7); Emerton §1.1 (pp. 10–18) and the cited §2.1 results (pp. 28–38); Schneiders §1.1.2 (pp. 8–13), §§1.2.2–1.2.3 (pp. 19–30); Colmez §§I.1.3–I.1.4 (pp. 4–7), §I.4.1 (pp. 13–14); Colmez–Gilles–Nizioł and Colmez–Dospinescu–Nizioł §2.1 (pp. 7–10); both recorded Colmez–Nizioł Appendix A versions (pp. 58–59); and Dierolf–Roelcke’s scalar convention (p. 14) and Proposition 3.8 (pp. 30–31). The packet gives exact proposition/definition locators for each node.

Corrected NFA author-note pagination: the numbered printed pages agree with one-based PDF pages in that public version. The previous minus-nine mapping was wrong. This is separate from the cleared Lie-groups book’s front-matter offset. Corrected NFA Proposition 5.1 to p. 26, and the surrounding limit locators accordingly. Other source-version scope remains explicit: E104 concerns the author notes actually read, not an unread Springer printing. Emerton 1.1.24 supplies the stated Fréchet-dual polar input; its cited Bourbaki volume was not independently read or claimed as checked.

The tensor seminorm criterion now excludes zero factors before its converse, and the scalar-unit tensor identity gives the completion when the other factor is incomplete. The quotient construction first closes the seminorm family under finite maxima. The cofinal chart construction requires mesh tending to zero and handles analytic changes of coordinates, rather than treating them as affine or assuming any strictly shrinking sequence is cofinal. Finite-stage Banachness is a sufficient assertion, with the zero-coefficient infinite-product counterexample preventing an incorrect converse.

For geometry, the base field is L finite over ℚ_p, while K is a complete coefficient extension of L. Compact-type duality additionally assumes K spherically complete. This fixes the distinction needed for functions on ℤ_p with larger coefficient fields; it does not require such coefficients to be locally compact. Compact restriction estimates are stated in the target chart’s coordinates and for scalar stages. General Banach-valued compact restrictions and arbitrary affinoid-function-space extensions are not claimed.

## Per-node findings

| Node (L0 prefix omitted) | Verdict | Check or correction |
| --- | --- | --- |
| `nonarchimedean-locally-convex-spaces` | corrected | Corrected quotient seminorms to use finite maxima before infimizing; added diagonal quotient regression. |
| `locally-convex-limits` | corrected | Corrected printed-page locators for bornological spaces and locally convex limits; checked final and projective topology conventions. |
| `bounded-sets-strong-dual` | corrected | Used the fixed contracting scalar π in generic-field boundedness tests and checked the strong-topology comparison. |
| `spherically-complete-fields` | corrected | Corrected the Cauchy-ball argument to use effective value-group diameters and controlled subsequences. |
| `nonarchimedean-hahn-banach` | verified | Checked nonarchimedean Hahn–Banach hypotheses and its move down from the higher-tier supplier. |
| `strict-morphisms-quasi-abelian` | verified | Checked strictness, closed-image Hausdorff comparison, pullback/pushout proofs and existing ExactStructure ownership. |
| `strict-derived-category-left-heart` | verified | Checked Schneiders’ strict derived category, left t-structure and classical-object embedding against the existing Mathlib category interfaces. |
| `left-heart-classical-extensions` | verified | Checked classical left-heart short exact sequences against strict short exact sequences and the cited Appendix. |
| `projective-tensor-product` | corrected | Added the nonzero-factor qualification, completion of the scalar unit identity and finite almost-orthogonal prerequisite. |
| `inductive-tensor-product` | corrected | Added barrelledness and LB/Fréchet factorisation prerequisites and an explicit uniform-boundedness proof of joint continuity. |
| `c0-completed-tensor` | corrected | Replaced p^n by π^n in the general-field diagonal example; checked Colmez’s isometric c₀ tensor and scalar-extension statements. |
| `banach-c0-models` | verified | Checked countable-type versus discrete-valuation hypotheses and finite almost-orthogonal estimates. |
| `banach-open-mapping-lifts` | verified | Checked Banach open mapping and controlled lifts against the complete pinned declarations. |
| `banach-complemented-subspaces` | corrected | Separated finite/zero quotients from countably infinite c₀ models in the complement argument. |
| `compactoid-compact-maps` | corrected | Corrected the compactoid-decay test reference and checked the distinction from topological compactness. |
| `compact-type-spaces` | corrected | Added the nuclearity node as a direct prerequisite of the compact-type structural package. |
| `nuclear-spaces` | verified | Checked nuclear definition, seminorm systems, subspaces/quotients and Fréchet scope against Schneider. |
| `compact-type-nuclear-duality` | verified | Checked the compact-type/nuclear Fréchet anti-equivalence, reflexivity and spherical-completeness hypotheses. |
| `compact-type-tensor-products` | corrected | Added the Banach completed-tensor injectivity input needed when compact transition maps are not embeddings. |
| `nuclear-three-space` | verified | Checked the nonarchimedean nuclear-extension lattice argument independently of the archimedean Dierolf–Roelcke citation. |
| `finite-rank-strict-splitting` | corrected | Replaced the unsupported lattice claim in finite-rank splitting with a continuous finite-dimensional projection proof. |
| `compact-type-extension-duality` | corrected | Distinguished stereotype and strong duals; separated sufficient H1/H2 criteria and retained the explicit gap. |
| `restricted-power-series-ball` | corrected | Reused current scalar Tate algebra and pinned multiplication closure; retained genuinely new Banach-valued and mixed-base interfaces. |
| `multivariate-substitution-bound` | verified | Checked multivariate substitution convergence and radius bounds, including zero and boundary examples. |
| `analytic-manifold-atlases` | corrected | Reused OpenPartialHomeomorph/ChartedSpace/HasGroupoid/IsManifold/ContMDiff and confined new targets to analytic-series compatibility. |
| `chart-index-banach-stages` | corrected | Replaced the false Banach iff finite assertion; distinguished base field L from coefficient field K. |
| `relatively-compact-restriction` | corrected | Added substitution dependency and target-coordinate radius control across charts; confined compact restrictions to scalar stages. |
| `locally-analytic-function-space` | corrected | Required a constructed cofinal sequence with mesh tending to zero and analytic transition maps; corrected mixed-base conventions. |
| `locally-analytic-pullback` | corrected | Clarified the empty-manifold pullback case and mixed-base conventions. |
| `locally-analytic-product` | corrected | Added normalized radii, product-grid cofinality and current scalar Fubini reuse; corrected mixed-base conventions. |
| `locally-analytic-dual-nuclear` | corrected | Corrected mixed-base compact-type/nuclear duality scope and checked the ℤ_p comparison. |
| `barrelled-banach-steinhaus` | added | Added barrelledness, Banach–Steinhaus and bornological/barrelled strong bidual embedding, with three regression tests. |
| `pseudo-polar-duality` | added | Added strict pseudo-polars, strengthened separation and pseudo-bipolar closure, with three convention-sensitive tests. |
| `lb-frechet-factorisation` | added | Added the LB/Fréchet strong-operator and Banach-factorisation target; stated the Fréchet-dual polar input explicitly. |
| `completed-tensor-operator-comparison` | added | Added completed tensors as the strong closure of finite-rank operators, with rank-one, zero and diagonal examples. |
| `banach-completed-tensor-injective` | added | Added Banach tensor injectivity without an embedding hypothesis; supplied the bidual/operator proof. |

## Baseline and ownership

All 27 original baseline names were retained after reading their full declarations and hypotheses at the pins. Four declarations were added and read: `OpenPartialHomeomorph`, `HasGroupoid`, `ContMDiff`, and `MvPowerSeries.isRestricted.mul`. The pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The declaration index supplements, rather than replaces, this statement-level check. The complete checked inventory is:

- `mathlib:Seminorm` — `Mathlib/Analysis/Normed/Module/Seminorm/Basic.lean`.
- `mathlib:WithSeminorms` — `Mathlib/Analysis/LocallyConvex/WithSeminorms.lean`.
- `mathlib:PolynormableSpace` — `Mathlib/Analysis/LocallyConvex/WithSeminorms.lean`.
- `mathlib:IsNonarchimedean` — `Mathlib/Algebra/Order/Ring/Basic.lean`.
- `mathlib:IsUltrametricDist` — `Mathlib/Topology/MetricSpace/Ultra/Basic.lean`.
- `mathlib:lp` — `Mathlib/Analysis/Normed/Lp/lpSpace.lean`.
- `mathlib:Bornology.IsVonNBounded` — `Mathlib/Analysis/LocallyConvex/Bounded.lean`.
- `mathlib:ContinuousLinearMap.topologicalSpace` — `Mathlib/Topology/Algebra/Module/Spaces/ContinuousLinearMap.lean`.
- `mathlib:StrongDual` — `Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Basic.lean`.
- `mathlib:ZeroAtInftyContinuousMap` — `Mathlib/Topology/ContinuousMap/ZeroAtInfty.lean`.
- `mathlib:Topology.IsStrictMap` — `Mathlib/Topology/Maps/Strict/Basic.lean`.
- `mathlib:LinearMap.isStrictMap_iff_isHomeomorph_quotKerEquivRange` — `Mathlib/Topology/Maps/Strict/Module.lean`.
- `mathlib:HomotopyCategory` — `Mathlib/Algebra/Homology/HomotopyCategory.lean`.
- `mathlib:CategoryTheory.Functor.IsLocalization` — `Mathlib/CategoryTheory/Localization/Predicate.lean`.
- `mathlib:CategoryTheory.Triangulated.TStructure` — `Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean`.
- `mathlib:TensorProduct` — `Mathlib/LinearAlgebra/TensorProduct/Defs.lean`.
- `mathlib:UniformSpace.Completion` — `Mathlib/Topology/UniformSpace/Completion.lean`.
- `mathlib:ContinuousLinearMap.isOpenMap` — `Mathlib/Analysis/Normed/Operator/Banach.lean`.
- `mathlib:ContinuousLinearMap.exists_preimage_norm_le` — `Mathlib/Analysis/Normed/Operator/Banach.lean`.
- `mathlib:Submodule.ClosedComplemented` — `Mathlib/Topology/Algebra/Module/Complement.lean`.
- `mathlib:IsCompactOperator` — `Mathlib/Analysis/Normed/Operator/Compact/Basic.lean`.
- `mathlib:MvPowerSeries.IsRestricted` — `Mathlib/RingTheory/MvPowerSeries/Restricted.lean`.
- `mathlib:MvPowerSeries.gaussNorm` — `Mathlib/RingTheory/MvPowerSeries/GaussNorm.lean`.
- `mathlib:ChartedSpace` — `Mathlib/Geometry/Manifold/ChartedSpace.lean`.
- `mathlib:contDiffGroupoid` — `Mathlib/Geometry/Manifold/IsManifold/Basic.lean`.
- `mathlib:IsManifold` — `Mathlib/Geometry/Manifold/IsManifold/Basic.lean`.
- `mathlib:LocallyConstant` — `Mathlib/Topology/LocallyConstant/Basic.lean`.
- `mathlib:OpenPartialHomeomorph` — `Mathlib/Topology/OpenPartialHomeomorph/Defs.lean`.
- `mathlib:HasGroupoid` — `Mathlib/Geometry/Manifold/HasGroupoid.lean`.
- `mathlib:ContMDiff` — `Mathlib/Geometry/Manifold/ContMDiff/Defs.lean`.
- `mathlib:MvPowerSeries.isRestricted.mul` — `Mathlib/RingTheory/MvPowerSeries/Restricted.lean`.

The audit in `data/library-coverage.json` and the relevant predecessor/supplier packets were checked. Mathlib’s ordinary-seminorm `PolynormableSpace` is insufficient for ultrametric local convexity, its scalar Hahn–Banach theorem does not have this field scope, and ordinary compact operators do not substitute for compactoid operators. The planned interfaces make these distinctions explicit.

The read-only current Tau Ceti checkout was checked separately at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, especially `Analysis/TateAlgebra/Basic` and `Analysis/TateAlgebra/Iterate`. Its scalar restricted-series carrier, Gauss norm, complete normed algebra, multiplication and multiplicativity already exist. Its `TauCeti.Huber.restrictedOptionEquiv` and isometry supply unit-radius coefficient Fubini. Those are cited for reuse, not new development targets or claims at the older elaboration pin. The suggested multiplication example uses pinned Mathlib’s actual closure lemma; the duplicate scalar multiplicativity goal was removed.

Current TauCetiRoadmap `OperatorTheory`, `GrothendieckEulerForms` and `DifferentialGeometry` were read for overlap, with their relevant suggested declarations. OperatorTheory’s Hilbert-space results have real/complex scope and do not supply the nonarchimedean functional analysis here. GrothendieckEulerForms Layer 0 owns generic exact structures, which this packet cites instead of redefining. DifferentialGeometry’s geometric targets do not replace the new power-series/function-space comparisons. Mathlib’s existing manifold/chart/analytic-map carriers are reused: the three redundant planned analytic carriers were removed from the API.

## Source issues and remaining gap

All E101–E103 received independent confirmed verdicts, with corrected scope. E101: Dierolf–Roelcke Proposition 3.8 is over ℝ/ℂ; the packet’s nonarchimedean nuclear-extension lattice proof was checked independently. E102: the compact-type extension argument still needs strictness of the strong dual sequence and continuity of the middle bidual map; the topology of a stereotype dual of the unknown middle term cannot simply be identified with the strong topology. E103 records a proof-scope limitation, not a counterexample: the cited splitting proof covers discrete valuation or countable-type quotients, rather than every asserted coefficient field.

Added E104: the NFA author-note Proposition 17.4(ii), pp. 112–113, states an unqualified norm converse. With one factor zero and a nonzero seminormed factor having zero seminorm, the tensor is zero and its seminorm is a norm; the factor seminorm is not. Both-factor nonzeroness repairs the converse. A regression test was added. A targeted source-register/author-page check found no matching correction; no blanket claim about all editions or all NFA errata is made.

The retained gap states precisely H1 (strict exactness of the strong dual sequence) and H2 (continuity of the middle strong bidual map). Middle strong dual Fréchet is a sufficient criterion for H1 by closed annihilators and Fréchet open mapping; bornological or barrelled middle space supplies H2. Bounded quotient lifting is not asserted equivalent to H1 or sufficient for H2. Split and finite-dimensional-kernel extensions are established special cases. No unresolved contradiction is hidden as a proved result.

## Validation and orchestrator actions

`python3 scripts/check_blueprint.py research/blueprint/packets/LocallyAnalyticDistributions--L0.json --index <baseline declarations index>` reports 0 errors and 0 warnings. `lean-check research/blueprint/suggested/LocallyAnalyticDistributions--L0.lean` elaborated at the pinned shared build, exit 0, with 22 `sorry` warnings and no other warnings. These are statement placeholders; no sorry-defined data were added. The file stays well below 5,000 lines. Reader/packet names, tests, hypotheses, locators and dependencies were reconciled, and the suggested-file index lists the API/tests. The two planets remain the central compact-type and locally analytic function-space definitions.

The orchestrator should apply the continuation map during assembly, import the five new functional-analysis inputs into the Part II ownership plan, and redirect the higher-tier nonarchimedean Hahn–Banach dependency to L0. Keep the predecessor compact-type-three-space statement conditional on the H1/H2 gap. A follow-up can establish those inputs or supply a complete alternative proof; this review does not invent one. No separate errata/source job is claimed, and source follow-ups remain subject to the post-upstream scheduling rule.
