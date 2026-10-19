# Independent review: étale duality and perverse sheaves, Part II

Accepted after correction. Codex, session `codex-DwStUx`, independently reviewed the design for issue #3525 on 2026-10-19. The packet records `independent-review-REV-DESIGN-EtaleDualityAndPerverseSheavesPartII`. This is a complete target-level planning pass, not a closed development: all implementation statuses remain `unchecked`, and the remaining proof gaps and supplier requests are explicit.

## Inventory and verdict

| Item | Reviewed result |
| --- | --- |
| Nodes | 57 retained: 7 definitions, 4 constructions, 45 theorems, 1 application |
| Individual verdicts | 31 corrected, 26 verified; none unverifiable or newly added |
| Stages | All 9 planned; none marked closed |
| Definition/construction API | 68 items, increased from 66 |
| Definition/construction tests | 49, increased from 47; every one of the 11 objects has at least three |
| Planets | 23 retained; mathematical definitions and named central theorems |
| Pinned baseline declarations | All 15 independently confirmed; none removed |
| Proof gaps | 3, replacing the original 4 |
| Supplier contracts | 7, increased from 6 |
| Source findings | 6, each with an independent confirmed verdict |

The granularity remains target level. In particular, the simultaneous proof of higher transition maps and the top local class is kept as one theorem target; its surface, coniveau and complete-local arguments are proof steps. No chain of implementation lemmas or duplicate supplier layer was introduced.

## Principal mathematical corrections

The category `alt/S` does not receive every finite-type scheme by taking its maximally dominant part: the affine line over a field remains an affine line. The general `md` adjunction now has the reduced maximally dominant finite-type category as its codomain; generic finiteness is an additional condition for landing in `alt/S`. Its factorization API and a negative test make that distinction usable. Both hypercover definitions now include the degree-zero covering condition. These checks use ILO II §§1.2, 2.3, pp. 24–29.

The equivariant Cohen–Gabber proof no longer assumes the invariant ring equidimensional. It passes to its maximal-dimensional equidimensional quotient, lifts the coefficient field and parameters, and then extends the invariant residue field, following ILO IV §§2.2.3–2.2.6, pp. 53–55. The geometric description of partial algebraization distinguishes an arbitrary complete noetherian presentation base from the stronger regular-base conclusion of V §§3.1.3–3.1.4, pp. 65–66. Normality is restored in the mixed-characteristic geometric statement. The approximation example now requires a regular base before concluding regularity from étaleness.

The oriented diagram site uses finite-type schemes over a fixed noetherian base, a category closed under the finite limits used in coskeleta. Its base-change application has the same scope, sufficient for the open/closed maps in the finiteness proof. The non-abelian companions are explicitly conditional on the source's limit qualification. Ordinary proper base change, already supplied by the étale foundations, suffices for the abelian proper-acyclicity proof. In the finiteness argument the snc condition is on the inverse image of the boundary, not on an arbitrary test-closed subset; the maps from the test hypercover terms are finite type and need not be proper (ILO XII §§1–2, pp. 189–194; XIII §2.2.3, pp. 196–197).

Derived transition morphisms are now asserted only in codimensions zero and one. The trait construction first projects to wild-inertia invariants, and the normalization step uses the inverse purely inseparable residue degree. Arbitrary-codimension transitions are maps on cohomology groups, constructed jointly with the top class. The proof names the surface step, independence of specialization chains, coniveau surjectivity and the complete-local regular embedding; it uses only the regular potential complex at that point. This removes the hidden circular use of general potential-complex existence (ILO XVII §§1.2–1.4, pp. 260–263; Theorems 3.1.1–3.1.2 and §§3.2–3.6, pp. 268–280).

Finite-surjective exceptional pullback detects potentiality; finite pushforward does not preserve rank-one pinnings, as two points over one point already show (ILO XVII §2.4.3.3, p. 266). The existence sketch now specifies the normal perverse extension and the normalization/conductor cone construction. Gabber's public supported-Godement construction replaces an unsupported finite-stratification limiting argument. The heart's étale-stack property is XVII §5.2.1, p. 287, rather than Proposition 5.2.2. Uniqueness of potential complexes always means uniqueness preserving pinnings.

Dualizing-complex uniqueness uses an invertible object. With general composite `n`, different prime-power factors of `ℤ/n` can carry different shifts; the new `ℤ/6` test detects the incorrect single-shift description (ILO XVII Proposition 7.5.1.1, pp. 308–309, and §§9.1–9.2, pp. 323–324). General-base open duality is obtained from extension-by-zero tensor compatibility and adjunction and is requested at EDC.1, rather than importing a field-only exchange theorem.

The local arguments compare cohomology with supports before passing to completion. The auxiliary punctured-affine Lefschetz node is restricted to an excellent strictly local ring; the general regular-local result applies it only after completion. This avoids an unsupported comparison for the punctured open itself (Česnavičius–Scholze Lemma 3.1.2, pp. 29–30, and Lemma 3.2.3, p. 33). The matched-open construction derives its unpowered quotient isomorphism from the powered sharp quotient using Frobenius, and completion identifies the posets of these opens. The generic-fibre example now identifies the tilt with the p-power inverse limit, rather than identifying a mixed-characteristic field with its tilt (§§2.1.2, 2.1.7, pp. 10–13).

## Complete node audit

Every row corresponds to an entry in the packet's `review.checked`. The packet and reader give the exact source locators and direct prerequisites. A verified node whose original proof audit remains open is justified by the exact ILO restatement and retains its named gap; verification does not claim that the missing proof has been read.

| Target | Verdict | Check or correction |
| --- | --- | --- |
| `alteration-category` | corrected | Corrected the md functor codomain and made its adjunction explicit; added the affine-line non-example. |
| `ell-prime-alteration-topology` | corrected | Added the missing degree-zero covering condition in the hypercover definition. |
| `standard-form-covers` | verified | Statement and proof route checked at ILO14, Exposé II, Proposition 3.1.1, Théorèmes 3.2.1 and 3.2.3, pp. 28–31 (printed). |
| `valuative-alteration-covers` | corrected | Confirmed the corrected fraction-field hypothesis in published ILO II 4.2.1; replaced the quasi-excellent-only standard-form argument by the general Riemann–Zariski argument. |
| `artin-popescu-approximation` | corrected | Specified the stronger a-graded comparison and required a regular base in the étale quadratic example. |
| `uniformization-henselian-reduction` | verified | Statement and proof route checked at ILO14, Exposé II, Théorèmes 4.3.1–4.3.2 and Proposition 4.3.3, p. 33 (printed). |
| `complete-local-reduction` | verified | Statement and proof route checked at ILO14, Exposé III, Théorème 6.1 and Proposition 6.2, p. 43 (printed). |
| `cohen-gabber-equal-characteristic` | verified | Statement and proof route checked at ILO14, Exposé IV, Théorème 2.1.1 and its proof §§2.1.3–2.1.12, pp. 50–53 (printed); Gabber 2005a, Lemma 8.1. |
| `cohen-gabber-equivariant` | corrected | Repaired the invariant-ring reduction when the invariant ring is not equidimensional; clarified generic étaleness over the target. |
| `epp-theorem` | corrected | Kept the exact ILO restatement and the original-proof gap, adding Kuhlmann’s published correction to the proof obligations. |
| `cohen-gabber-mixed-characteristic` | verified | Statement and proof route checked at ILO14, Exposé IV, Théorèmes 4.2.2 and 4.3.1, pp. 58–60 (printed). |
| `partially-algebraizable` | corrected | Removed the unsupported relative-dimension clause and distinguished the definition’s arbitrary complete base from the stronger regular-base presentations. |
| `partial-algebraization-equal-characteristic` | verified | Statement and proof route checked at ILO14, Exposé V, Théorème 2.1.2 and §2.2, pp. 64–66 (printed). |
| `partial-algebraization-mixed-characteristic` | corrected | Restored normality in the geometric mixed-characteristic restatement and reducedness/non-field hypotheses in the equal-characteristic comparison. |
| `de-jong-nodal-curve-alteration` | corrected | Added geometric irreducibility, needed for the birational quotient conclusions; the published ILO statement already corrects the preprint. |
| `weak-local-uniformization` | verified | Statement and proof route checked at ILO14, Exposé VII, Théorème 1.1 and §§2–4, pp. 81–83 (printed); Exposé II, Théorème 4.3.1, p. 33. |
| `prime-to-ell-local-uniformization` | verified | Statement and proof route checked at ILO14, Exposé IX, Théorème 1.1 and §2 (Théorème 2.3), pp. 131–134 (printed); Exposé II, Théorème 4.3.2, p. 33; Exposé 0, Théorème 2. |
| `regular-alteration-hypercover` | verified | Statement and proof route checked at ILO14, Exposé XIII, Théorème 2.2.2, p. 196 (printed); Exposé XV, 3.1.2, p. 222 (printed). |
| `oriented-product-topos` | verified | Statement and proof route checked at ILO14, Exposé XI, §1 (1.1–1.9, Définition 1.7), pp. 171–176 (printed). |
| `tube-base-change` | verified | Statement and proof route checked at ILO14, Exposé XI, Théorème 2.4 and Lemme 2.5, pp. 178–179 (printed). |
| `oriented-alteration-topology` | corrected | Chose a finite-limit-closed ambient category, added the degree-zero cover, and replaced the overgeneral non-cover example. |
| `oriented-proper-acyclicity` | corrected | Removed an unnecessary affine proper-base-change prerequisite and marked the source’s non-abelian limit argument as an explicit gap. |
| `oriented-cohomological-descent` | corrected | Aligned the finite-type diagram scope and separated the abelian theorem from the source’s unresolved non-abelian limit input. |
| `alteration-hypercover-base-change` | corrected | Aligned the application with the finite-type diagram site and made the non-abelian companion conditional on the recorded limit gap. |
| `constructibility-via-weak-uniformization` | corrected | Corrected the snc boundary to X minus U and the descent maps to finite-type maps; checked generic constructibility directly in Deligne. |
| `gabber-finiteness-theorem` | corrected | Corrected the codimension threshold in the induction property P_c. |
| `dimension-function` | corrected | Added universal catenarity to the normalized strictly local construction. |
| `dimension-function-existence` | verified | Statement and proof route checked at ILO14, Exposé XIV, Théorèmes 2.2.1 and 2.3.1, Propositions 2.2.2, 2.2.6, 2.3.3, pp. 212–214 (printed). |
| `induced-dimension-function` | corrected | Restricted the connected-fibre argument to the strictly local reduction, as in the source. |
| `regular-base-change` | corrected | Required strict locality for the global cohomology/completion check; ordinary regular base change remains a sheaf statement. |
| `gabber-trait-affine-lefschetz` | verified | Statement and proof route checked at ILO14, Exposé XV, Remarque 1.1.3 and §3.3.2, pp. 219 and 224 (printed), citing Illusie 2003, 2.4. |
| `affine-lefschetz-theorem` | verified | Statement and proof route checked at ILO14, Exposé XV, Théorème 1.1.2 and §§1.2–3, pp. 219–224 (printed); Exposé 0, Théorème 7. |
| `affine-lefschetz-local` | verified | Statement and proof route checked at ILO14, Exposé XV, Corollaire 1.2.2 and Corollaire 1.2.4, p. 220 (printed); Exposé 0, Corollaire 8, p. 5. |
| `gabber-cohomological-dimension-bound` | verified | Statement and proof route checked at ILO14, Exposé XVIII-A, Théorème 1.1, Corollaires 1.2 and 1.4, Lemmes 2.1–2.2, pp. 331–334 (printed). |
| `transition-morphism` | corrected | Restricted derived maps to codimensions zero and one, corrected the wild-inertia projection and inseparable normalization factor, and moved arbitrary codimension to the subsequent joint theorem. |
| `top-degree-local-class` | corrected | Recorded the jointly proved higher group transitions and top class, including the surface step, coniveau surjectivity and complete-local embedding argument; removed the hidden dependence cycle. |
| `potential-dualizing-complex` | corrected | Replaced false preservation under finite pushforward with the actual finite-surjective exceptional-pullback detection criterion. |
| `regular-potential-dualizing` | verified | Statement and proof route checked at ILO14, Exposé XVII, Propositions 2.4.1.1, 2.4.2.1 and 2.4.4.1, pp. 264–267 (printed). |
| `gabber-perverse-t-structure` | corrected | Read Gabber’s public construction; replaced the unsupported finite-stratification limit proof, removed field-only recollement, and corrected the ILO stack-descent locator. |
| `potential-dualizing-existence` | corrected | Made the normal-case perverse extension and the normalization/conductor gluing construction explicit; uniqueness always respects pinnings. |
| `potential-dualizing-functoriality` | verified | Statement and proof route checked at ILO14, Exposé XVII, Propositions 4.1.1–4.1.2, Remarque 4.1.3 and §4.2, pp. 280–284 (printed). |
| `dualizing-complex` | corrected | Corrected the uniqueness citation and the description of invertible complexes for composite coefficients; supplied general-base open restriction by formal adjunction. |
| `gabber-biduality-theorem` | verified | Statement and proof route checked at ILO14, Exposé XVII, Théorème 6.1.1 and §§6.2–6.5, pp. 293–300 (printed). |
| `gabber-duality-theorem` | verified | Statement and proof route checked at ILO14, Exposé XVII, Théorème 0.9, p. 257 (printed) (cited as Théorème 0.2 by Česnavičius–Scholze, following the Astérisque numbering); Exposé 0, (c), p. 6. |
| `regular-local-dualizing-complex` | corrected | Replaced the field-only formal-duality-exchange citation by a precise general-base EDC.1 request; the source statement and the local duality calculation are unchanged. |
| `local-duality` | corrected | Replaced the field-only formal-duality-exchange citation by a precise general-base EDC.1 request; the source statement and the local duality calculation are unchanged. |
| `local-absolute-purity` | corrected | Made the completion reduction explicit before importing purity, so no excellence hypothesis is silently dropped. |
| `sheafified-local-purity` | verified | Statement and proof route checked at CS24, Remarks 3.1.4, p. 31. |
| `punctured-affine-vanishing` | corrected | Restricted this auxiliary affine-Lefschetz consequence to excellent strictly henselian regular local rings; removed the invalid completion comparison for punctured-open cohomology. |
| `extension-by-zero-local-vanishing` | corrected | Applied the henselian completion theorem to local cohomology with supports before invoking the excellent affine-Lefschetz and duality results. |
| `local-lefschetz-hyperplane-theorem` | verified | Statement and proof route checked at CS24, Lemma 3.2.3 and its proof, p. 33. |
| `matched-punctured-opens` | corrected | Distinguished powered sharp quotients from their unpowered corollary, specified the perfect residue field in the example and clarified completion compatibility. |
| `punctured-multiplicative-tilt` | corrected | Corrected the example: the tilt is the p-power inverse limit of the field, not the field itself. |
| `tilting-idempotents` | verified | Statement and proof route checked at CS24, Theorem 2.2.7 and its proof (first part), pp. 21–22. |
| `valuation-product-tilting` | verified | Statement and proof route checked at CS24, Lemma 2.2.4, pp. 19–20, and proof of Theorem 2.2.7 (product case), pp. 21–22. |
| `tilting-etale-cohomology` | verified | Statement and proof route checked at CS24, Theorem 2.2.7 and its proof, pp. 21–22; Theorem 2.2.5, p. 20. |
| `tilting-supports` | verified | Statement and proof route checked at CS24, Theorem 2.2.7, equation (2.2.7.1), p. 21. |

## Baseline and existing ownership

All baseline files were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, with Tau Ceti pinned to `f790474821cf4256814db967cb154e7af3d0c369`. These declarations provide the named carriers and predicates; none is treated as an implementation of the missing six-operation formalism.

| Declaration | Module at the pin |
| --- | --- |
| `mathlib:AlgebraicGeometry.LocallyOfFiniteType` | [Mathlib/AlgebraicGeometry/Morphisms/FiniteType.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/FiniteType.lean) |
| `mathlib:AlgebraicGeometry.IsReduced` | [Mathlib/AlgebraicGeometry/Properties.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Properties.lean) |
| `mathlib:AlgebraicGeometry.Etale` | [Mathlib/AlgebraicGeometry/Morphisms/Etale.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Etale.lean) |
| `mathlib:AlgebraicGeometry.IsProper` | [Mathlib/AlgebraicGeometry/Morphisms/Proper.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Morphisms/Proper.lean) |
| `mathlib:ValuationRing` | [Mathlib/RingTheory/Valuation/ValuationRing.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Valuation/ValuationRing.lean) |
| `mathlib:IsAdicComplete` | [Mathlib/RingTheory/AdicCompletion/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Basic.lean) |
| `mathlib:MvPowerSeries` | [Mathlib/RingTheory/MvPowerSeries/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPowerSeries/Basic.lean) |
| `mathlib:IsReduced` | [Mathlib/Algebra/GroupWithZero/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/GroupWithZero/Basic.lean) |
| `mathlib:ringKrullDim` | [Mathlib/RingTheory/KrullDimension/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/KrullDimension/Basic.lean) |
| `mathlib:IsLocalRing` | [Mathlib/RingTheory/LocalRing/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/LocalRing/Defs.lean) |
| `mathlib:AlgebraicGeometry.Scheme.smallEtaleTopology` | [Mathlib/AlgebraicGeometry/Sites/Etale.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/Sites/Etale.lean) |
| `mathlib:CategoryTheory.Triangulated.TStructure` | [Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean) |
| `mathlib:IsRegularLocalRing` | [Mathlib/RingTheory/RegularLocalRing/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/RegularLocalRing/Defs.lean) |
| `mathlib:PreTilt` | [Mathlib/RingTheory/Perfection.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Perfection.lean) |
| `mathlib:HenselianRing` | [Mathlib/RingTheory/Henselian.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Henselian.lean) |

No baseline citation was removed or renamed. The description of `PreTilt` was narrowed to its actual perfection carrier, leaving its perfectoid interpretation and sharp-quotient comparisons to Q5. The reader and Lean header no longer claim that the pins contain only an underived ℓ-adic sheaf: generic derived categories, Ext-based sheaf cohomology, pro-étale sites and coefficient sheaves already exist. The reviewed `data/library-coverage.json` was checked.

The current read-only Tau Ceti library and upstream roadmap checkout were inspected. The relevant `AdicSpaces` and `AlgebraicVectorBundles` roadmaps were read; the nine roadmaps absent from the atlas snapshot were searched for these targets. No new target duplicates their current content. The shared checkout was never built or modified.

All 61 distinct external prerequisite references in the original packet were inspected at their individual node statements or the supplying stage's exact upstream contract. The corrected packet retains 58 distinct external references. In particular:

- Absolute purity and the snc-complement formula remain imports from [LefschetzPencilsAndVanishingCycles PR #873](https://github.com/TauCetiProject/TauCetiRoadmap/pull/873), read at `1e3ff2427f7d37b993cea83a67d49b2e4da75178`.
- [SchemeAndStackFoundations main](https://github.com/TauCetiProject/TauCetiRoadmap/blob/69bd802abd021be5efb158896d7c4930bd0775b0/TauCetiRoadmap/SchemeAndStackFoundations/README.md) supplies approximation, henselian algebra, proper hyperdescent and the existing alteration geometry. The equivariant nodal-curve target adds the 1997 birational quotient statement, beyond its ordinary curve-alteration target.
- [EtaleCohomologyFoundations PR #938](https://github.com/TauCetiProject/TauCetiRoadmap/pull/938), read at `d4865f2ea953651ee8991076ef0e503bed478fca`, already supplies arbitrary-torsion proper base change (§F.2.1), invertible-torsion smooth base change (§F.2.2), and general support localization (§0.7). These are consumed through EDC.0. Its generic local acyclicity remains field-based, so the general-noetherian generic constructibility contract is requested precisely.
- [EtaleDualityAndPerverseSheaves PR #1040](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1040), read at `9829f0a0dddbfcf532e86072e385ee98c90129a1`, provides general exceptional inverse image and imports the ambient recollement. Its named formal-duality-exchange theorem is field-based. The additional request asks its owner to confirm the formal general-base open specialization, with its adjunction proof supplied here.
- Riemann–Zariski compactness, surface resolution, modification and stable modification remain at AdicCoefficientsAndComparisonsPartII; the completion, formal glueing and arc-descent results remain at ArcTopologyAndDescent; perfectoid algebra and tilt comparisons remain at PerfectoidQuotients and its Part II. Cohen structure remains at DeformationAndDerivedPatchingAlgebra. Their individual consumed statements were checked.

The two split proposals (stacks and ind-constructibles) and the existing ownership notes remain proposals for the maintainer. This review does not create those roadmaps or move a target between owners.

## Sources, collation and remaining work

Every node's source locator was opened. All results are stated in the worker's own words, and no `excerpt` field is present. The packet records ten exact source versions with SHA-256 hashes. Public sources newly read include [Gabber's author PDF](https://www.ihes.fr/~gabber/t-str.pdf), §§1–6, pp. 1–8, and §8, pp. 10–12; [SGA 4½](https://publications.ias.edu/sites/default/files/Number32.pdf), [Th. finitude] Theorem 1.9, p. 236, and its proof in §2, pp. 238–241; and [Kuhlmann's correction](https://arxiv.org/abs/1003.5687v1), pp. 1–3. The first two close the old source-access gaps; the last qualifies the still-open audit of Epp's original proof.

| Finding | Independent verdict and version scope |
| --- | --- |
| E1 | Confirmed: reversed residue-field transcendence degree; persists in published XIV 2.5.2, p. 289. |
| E2 | Confirmed: weak/prime-to-ℓ theorem cross-reference; persists in published IX §1, p. 161. |
| E3 | Confirmed preprint misprint: residue versus fraction field; fixed in published II 4.2.1, p. 33. |
| E4 | Confirmed preprint hypothesis omission: geometric irreducibility for the birational quotient; fixed in published IX 1.2, p. 161. |
| E5 | Confirmed authors' stated proof qualification: continuity for ind-finite stacks; retained in published XII-A §1.4, p. 241. |
| E6 | Confirmed preprint properness misattribution in XII §1.3.2, p. 190; the rewritten published proof uses its proper base map, XII-A §1.3.2, p. 238. |

The accepted pass leaves three precise proof follow-ups: Epp 1973 with Kuhlmann's correction; Illusie 2003 §2 for the trait affine Lefschetz proof; and the ind-finite-stack limit theorem, needed only for the optional non-abelian companions. No claim that those original proofs were read is made. General-noetherian generic constructibility and general-base formal open duality remain owner requests, with the mathematical statements and proofs available. Other `remaining` entries are optional lemma-level refinements, not missing target-level nodes.

For the orchestrator: retain the existing purity ownership and the two split-design decisions; route the two precise supplier extensions to EDC.0/EDC.1, and schedule the three named proof audits as follow-ups. No change to another roadmap was made here.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/EtaleDualityAndPerverseSheavesPartII.json`: **0 errors, 0 warnings**; 57 nodes, 68 API items, 49 tests, 23 planets, 15 baseline declarations, 9 planned stages.
- `lean-check research/blueprint/suggested/EtaleDualityAndPerverseSheavesPartII.lean`: **passed** at the pins, with exactly eight `declaration uses sorry` warnings and no other warnings or errors. Available memory was 85 GB before the check. The file contains a real-bodied light predicate and suggested theorem/example statements; no sorry-filled data is introduced.
- Exact synchronization check: all 57 statements occur in both the reader and stage catalogue, and all hypotheses, proof steps, API statements, test statements and acceptance examples occur in the reader. All 57 node verdicts are present exactly once; all 11 objects meet the test minimum; every implementation status remains unchecked; no excerpt field survives.
- `git diff --check`: passed. Only the four reviewed inputs, this report and the required handoff note are changed. No Lean process or language server remains running.
- `python3 research/blueprint/intake.py check-files` on the six deliverables: **6 files, 0 problems**. `scripts/check_sorry_data.py` and source-version validation also passed.
