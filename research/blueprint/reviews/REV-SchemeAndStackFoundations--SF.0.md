# Independent review of SchemeAndStackFoundations SF.0

**Verdict: needs_changes. Review job complete.** Codex, session `codex-FHUEmt`, reviewed another worker’s submission for issue #6282 on 9 October 2026. This is a completed independent review, not an unfinished review checkpoint. The mathematical repairs that were clear are applied. The packet and SF.0 coverage are now `partial`, with six explicit groups of remaining work. The review does not approve the unresolved ownership, proof inputs or suggested-file contracts.

## Scope and counts

| Item | Reviewed result |
| --- | --- |
| Nodes | 139: 26 definitions, 26 constructions, 75 theorems, 6 comparisons, 3 lemmas, 3 applications |
| Individual verdicts | 75 verified, 20 corrected, 44 unverifiable as complete contracts; each has a specific note in `review.checked` |
| Baseline declarations | All 492 named declarations and their surrounding hypotheses read at the exact packet pins; none removed or added |
| Sources | 281 public sources: 259 Stacks pages and 22 other sources; three Stacks inputs added |
| API and tests | 462 API items and 283 tests across all nodes; the validator counts 383 and 226 respectively on definitions/constructions |
| Planets | Six; replaced the already owned Relative Spec planet with Cohen structure theorem |
| New nodes | Zero; the added quotient-lifting API belongs inside the existing henselian finite-étale target |
| Source findings | 24 independently judged: 22 confirmed, 2 rejected; 7 findings added |
| Prerequisites | 19 missing direct edges added; the combined base/SF.0 declared node graph has 442 nodes and no cycles |

Every source locator, target statement, hypothesis list, proof route, definition/construction API and test was inspected. The mathematical source checks do not certify an omitted Lean signature. An `unverifiable` verdict here identifies an unresolved complete contract, even where its source mathematics is correct. No node is claimed implemented.

## Current owners and the library audit

The pinned baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit was checked alongside those inputs. The current upstream inventory was separately read at TauCetiRoadmap `de435a569d325b365a30fe83269ce34674eaea80` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; these newer objects are not retroactively described as pinned declarations.

The original claim that no upstream relative-Spec owner existed is false. [AlgebraicVectorBundles](https://github.com/TauCetiProject/TauCetiRoadmap/tree/de435a569d325b365a30fe83269ce34674eaea80/TauCetiRoadmap/AlgebraicVectorBundles) L0 already owns monoidal QCoh, internal Hom/duals and symmetric algebras; L1 owns QCoh algebras, relative Spec, its universal property, recovery and base change; L2 owns graded QCoh, graded symmetric algebras and linear Spec/total space. Current Tau Ceti implements `CategoryTheory.CommMon.relativeSpec`, `relativeSpecToBase`, `relativeSpecMap`, the chart pullback and affine normalization, and `TauCeti.AlgebraicGeometry.relativeSpecAffineIso`. A progress document’s assertion about an affine-functions construction was not treated as an implemented declaration when the corresponding library definition could not be found.

Twelve nodes need carrier/ownership reconciliation: `qcoh-algebra`, `qcoh-algebra-sheaf-comparison`, `pushforward-algebra`, `relative-spec`, `relative-spec-universal-property`, `relative-spec-affine-antiequivalence`, `qcoh-algebra-pullback`, `relative-spec-base-change`, `symmetric-algebra-sheaf`, `graded-qcoh-algebra`, `sheaf-hom-dual`, `vector-schemes`. Keep the small-affine-site comparison as an adapter to the imported carrier. General qcqs pushforward, the extra relative-Spec morphism-property dictionary, general relative Proj and its comparison with the finitely generated case are genuine extensions. The present Tau Ceti QCoh pushforward file implements a Spec-map case, not the general qcqs theorem.

StableReduction L0 supplies its relative-dimension conventions; pointwise fibre-dimension semicontinuity must agree with them. L2 supplies finitely generated relative Proj and projective-space/twist carriers. L3 already supplies curve pushouts identifying smooth sections and clutching. The new compatibility request identifies that specialization of the general Ferrand construction; it does not assign a second owner to the curve construction. ModularCurves 0D/0E/4D and JacobianChallenge Layer B contracts were read, including their requested generality. The regular-local normal-domain/parameter statements are explicit requests, not assertions of completed upstream implementation.

These changes are recorded in `upstreamNotes`, `restructure`, `stageTargets` and an ownership gap. The twelve nodes and their suggested carriers have **not** yet been converted into imports: that repair must also reconcile the reader document and base assembly. The reader is outside this review issue’s editable deliverables. Describing a rescope proposal does not apply it.

## Applied mathematical and signature repairs

The added prerequisite edges are listed by node in the packet. They expose the henselian characterization and projective-lifting inputs, Noetherian henselization comparison, relative Frobenius, finite-model quasi-finiteness, normalization finiteness, field descent, approximation/presentation descent, unramified criteria, étale-site invariance and regular-local supplier contracts.

* `henselian-finite-etale-equivalence`: finite étale **algebras** correspond contravariantly to finite continuous Galois sets; schemes correspond covariantly. Added `TauCeti.Algebra.Etale.exists_lift_mod`, using [Stacks Lemma 10.143.10, 04D1](https://stacks.math.columbia.edu/tag/04D1), without a henselian assumption. Its proof route lifts a standard étale presentation and inverts its Jacobian determinant. The finite-projective lift uses the existing smooth-lifting target and a henselian section.
* `nagata-ring`: replaced an unrecorded Nagata-ascent proof leaf with the monogenic reduction, normalization, rational-generator and analytically-unramified route of Stacks 10.162.10, .12–.14. These steps remain inside the target-level proof sketch.
* `popescu-desingularization`: the induction chooses a **maximal bad quotient ideal** by the ascending-chain condition. The non-routine field-case smoothing inputs are now explicit gaps.
* `perfection-universal-homeomorphism`: removed the hidden appeal to the later preservation target that already depends on it. The étale relative-Frobenius cartesian square, followed by inverse limits, proves the required comparison directly.
* `pfp-models` and `perfectly-proper`: the injective-map argument uses a proper, locally quasi-finite, hence finite model. Its map to its schematic image is a universal homeomorphism, and the unrestricted perfection criterion makes that map an isomorphism after perfection. No unsupported finite-presentation assertion about the image over an arbitrary base is needed.
* `witt-scheme`: open comparisons use the homeomorphism induced by `X=W_1(X)→W_n(X)`. On an affine chart, `D(f)` corresponds to `D([f])`; the proof does not assert a scheme morphism in the opposite direction.
* `generic-fibre-spreading`: finite type over an arbitrary integral base does not automatically mean finite presentation. [Stacks Proposition 29.27.5, 052A](https://stacks.math.columbia.edu/tag/052A) first makes the map flat and finitely presented on a dense open. Its proof route remains a recorded input gap.
* `integral-point-descent`: reducedness belongs to the targets of the dominant maps, namely the domains of the maps compared by extensionality.
* `refined-valuative-criterion`: before [Chow’s lemma 30.18.1, 0200](https://stacks.math.columbia.edu/tag/0200), prove separatedness. A DVR at a boundary point of a component of the diagonal’s closure gives two lifts of the same canonical generic-point map; uniqueness excludes that boundary. The diagonal has closed image, so is a closed immersion. Chow’s separatedness hypothesis is now retained in the supplier request.
* `henselian-smooth-lifting`: removed unsupported Elkik attribution from the elementary lifting target’s title.

Five existing Lean signatures were corrected: the affine relative-Spec isomorphism must commute with the map to the base; finite-type submodule extension requires qcqs `X` and quasi-compact `U→X`; coherent extension and locally free coherent extension require a Noetherian scheme; fibre-dimension base change retains locally finite type. The sixth change adds the actual quotient étale-lift signature above.

Requests for later cohomology/intersection/model consumers are marked `consumer-follow-up`, and the erroneous `schematically-dense-open` reference is corrected to `schematic-density`. They are not presented as inputs to these SF.0 proofs. The earlier Picard and Chow requests remain unresolved stage-order dependencies.

## Baseline and citation repairs

No named baseline citation was missing at its cited pin. Nine descriptions needed qualification:

| Declaration | Required qualification |
| --- | --- |
| `Concrete.colimit_exists_rep`, `Concrete.colimit_rep_eq_iff_exists` | The forgetful functor preserves the indicated colimit; equality uses filteredness |
| `Ideal.quotientInfRingEquivPiQuotient` | A finite family of pairwise coprime ideals |
| `FiniteRingKrullDim` | Finite **nonempty** dimension; the zero ring is excluded |
| `Algebra.IsSeparable` | Elementwise algebraic separability; it cannot express generic separability of a transcendental field extension |
| `Polynomial.height_eq_height_add_one` | Noetherian base ring and the stated maximal ideal |
| `exists_integral_inj_algHom_of_fg` | Nontrivial finite-type algebra over a field |
| `trdeg_add_eq` | Nontrivial base, no zero divisors in the top ring, and faithful scalar actions in the tower |
| `AlgebraicGeometry.ext_of_isDominant_of_isSeparated` | The common domain of the compared maps is reduced |

Three citations now identify the freely readable PDF actually inspected, with hashes in `sources` and `sourceVersions`: [Boxer–Pilloni author manuscript](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf), [Gille–Parimala arXiv v3](https://arxiv.org/pdf/2301.07572v3), and [Hacon–Witaszek arXiv v2](https://arxiv.org/pdf/2009.02631v2). Gille–Parimala Theorem 7.1 is on manuscript p.18 in v3, rather than the cited p.23 of the unavailable HAL v5. Van Hoften Lemma 4.1.5 is on manuscript p.46 in arXiv v4. Added Stacks 04D1, 052A and 0200 supply the bounded repairs above. All explanations are in the reviewer’s own words; no source excerpts are added.

## Source issues

All inherited findings E102–E118 have independent verdicts. E107 and E109 are rejected. For E107, refine every interval of an arbitrary finite prime chain to a finite saturated chain; concatenate and use the globally common saturated-chain length. This bounds all finite chains and proves the alleged nonequivalence wrong. For E109, Bhatt–Scholze §11.5 already works over a Noetherian finite-dimensional base in `Sch_fp/S`; its ambient hypotheses supply finite presentation and qcqs target. Node 75 is a legitimate broader formulation.

E108 is confirmed as an **acknowledged omitted proof**, not a false Noetherian construction; its inaccurate assertion that the Stacks page had no comments is corrected after reading all ten. E114 and E115 likewise identify proof supplements for finite-model comparison and weakly normal models, not counterexamples. E105 is expressly scoped to Clausen–Mathew arXiv v3, Theorem 6.18 proof part 2, p.78; the published text was not used to support that finding. The remaining inherited type/index, dimension, connectedness, filter and positive-binomial-index findings are confirmed at the recorded versions.

Seven additions record slips or a proof omission found during this review:

| Finding | Locator and correction |
| --- | --- |
| E119 | Stacks 51.2.2: the final vanishing clause needs `H^0` and `H^1`, rather than `H^0` twice |
| E120 | Stacks 32.6.1 proof: compose the descended map after the limit projection |
| E121 | Stacks 32.10.1, .3, .4, .5 proofs: correct stage indices, the module’s base label, the base change defining `Y`, and the domains/direction/base of descended local maps |
| E122 | Stacks 37.67.2, .3, .7 proofs: apply `i⁻¹` to the open in `X`, and retain the pushout and its correct base labels |
| E123 | Stacks 53.15.4 proof: after the Nakayama case, the remaining intermediate algebra is `A+m_A B=A` |
| E124 | Stacks 29.47.8 proof: `pb,b^p` must lie in the smaller algebra `A` |
| E125 | Stacks 32.15.3 proof: establish separatedness before invoking the referenced Chow lemma |

Their `searched` records identify the current pages and comments inspected, including related fixes that do not repair the listed occurrences. Corrections to the blueprint’s own proof sketches are recorded as review changes, rather than automatically called source errors.

## Work required before acceptance

1. Reconcile the twelve existing-owner nodes, suggested carriers, reader and base assembly with AlgebraicVectorBundles L0–L2 and current Tau Ceti relative Spec. Retain only genuine extensions and comparison adapters. The permitted report/packet edits cannot by themselves update the excluded reader and base assembly.
2. Supply the Eakin–Nagata input inside the explicit noncatenary-domain target or import a precise earlier contract. The current Noetherian conclusion does not follow merely from integrality.
3. Close the field-case desingularization proof inputs Stacks 16.10.3 (07FE) and 16.11.4 (07FJ), including Artinian/characteristic-p hypotheses and strict growth of the bad-locus ideal. Keep target-level granularity.
4. Plan or import the generic-freeness/flat finite-presentation spreading argument of Stacks 29.27.5 for the arbitrary integral-base version of `generic-fibre-spreading`.
5. Replace SF.0’s requests from SF.3/SF.4 by exact earlier inputs or moved-down elementary Pic(P1), separated Chow and DVR statements. The base orders SF.0→SF.1→SF.2→SF.3→SF.4; citing those full later layers back into SF.0 makes a stage cycle even though the separately checked base/SF.0 node graph is acyclic. StableReduction’s projective-space carrier alone is not Pic(P1) classification.
6. Fill the actual promised suggested-file contracts and discriminating examples below. A named omission comment is not a Lean signature or a unit test.

The next revision needs these missing API signatures: `Henselization.atPrime.colimitIso`; `Scheme.pullback_limit_iso`; the normalization and strict-henselization characterizations of geometric unibranchness; `Scheme.absoluteIntegralClosure.isLimit_normalizations`; `AlgebraicGeometry.isIso_structureMonoidPerfection_iff` and `structureMonoidPerfection_rational_square`; `Scheme.arithmeticUniversalHomeomorphismPushout.rationalIso`; `Scheme.finiteLocallyFreeTrace.trans` and `.coefficientsBaseChange`; `AlgebraicGeometry.BinaryForms.points`.

The finite-separable geometric-component theorem, integral-closure intersection theorem, projective-line-to-affine factorization, geometric-unibranch finite-component theorem and Jacobian étale-localization theorem are also only omission comments. Their mathematical routes were inspected; the suggested file still needs their actual types and maps.

Concrete tests are missing for the Nagata/DVR and catenary examples; depth, CM and Serre embedded-point/plane-plus-line examples; the support-sensitive coherent module of a point on a plane; the affine-line generic-point limit; the real unibranch/non-geometrically-unibranch example; absolute integral closure factoring through normalization; the empty Ferrand pushout; and the arithmetic-pushout rational, cusp and dual-number examples. The explicit non-Japanese DVR and noncatenary local-domain carriers are replaced by existential conclusions in the file and also need attention. Some present labelled examples are weaker than their packet tests: henselization localization/constant diagrams, relative Frobenius on affine space/finite fields, perfected projective-line properness, perfect-smooth local-model equivalence, rational affine models, and structure-monoid nilpotent thickening. Most other `test:` comments label genuine anonymous examples; they are not counted as missing just because their names are not declarations.

## Red-team handoff and validation

Confirmed finding `RT-AREA-algebraicgeometry/11` is correctly handled in both packet and reader: neither plans Weil restriction in SF.0. ModularCurves 0F owns the affine finite-presentation finite-locally-free-base case and arbitrary base change; RG2.0a keeps its reductive/Deligne-torus and affine finite-étale uses; R09.3 owns the algebraic-space extension. The Lawrence–Sawin route remains a consumer pointer to RG2.0a. No edits to those owners were made.

Validation completed:

* `python3 scripts/check_blueprint.py research/blueprint/packets/SchemeAndStackFoundations--SF.0.json`: **0 errors, 0 warnings**.
* The shared `source_issues.check_issues` and `check_errata.versions_checked` functions on the packet: **0 errors**. The standalone errata CLI expects an `errata-v1` document and is not the validator for this blueprint packet.
* Combined declared base/SF.0 graph: **442 nodes, 0 cycles**. The later-stage dependencies above remain explicitly unresolved.
* `lean-check research/blueprint/suggested/SchemeAndStackFoundations--SF.0.lean`: **exit 0**, 4,058 lines, 854 warnings, all `declaration uses sorry`, no errors or other warnings. This is elaboration of a suggested interface, not completed proofs.

The orchestrator should queue a revision with permission to reconcile the reader and base ownership contracts as well as the packet and suggested file. The six gaps and per-node notes specify where to resume. This review’s `needs_changes` status prevents promotion of the inconsistent plan.
