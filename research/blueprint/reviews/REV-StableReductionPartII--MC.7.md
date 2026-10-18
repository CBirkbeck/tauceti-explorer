# Independent review of MC.7: level Picard parameters

**Accepted after corrections.** Review job `REV-StableReductionPartII--MC.7`, issue #8943, completed by Codex, session `codex-phe8QM`, on 18 October 2026. The planning session was `codex-6bC3qQ`; this reviewer did not write the original plan.

The [packet](../packets/StableReductionPartII--MC.7.json) is a complete target-level planning pass for `StableReductionPartII:MC.7`. Its layer remains **planned**, with four explicit gaps and a precise remaining-work list. Acceptance certifies the corrected mathematical plan, sources and ownership boundaries; it does not discharge those gaps or certify implementation. No unresolved contradiction remains in the reviewed targets.

| Item | Result |
| --- | --- |
| Nodes | 13: four theorems, one definition, two constructions, six applications |
| Node verdicts | Seven verified; six corrected; none unverifiable |
| Nodes added or removed | Zero |
| Definition/construction API | 17 items, distributed 6 / 4 / 7 |
| Discriminating tests | 11, distributed 4 / 3 / 4 |
| Pinned baseline citations | Nine confirmed; none removed or replaced |
| Supplier requests | 11: one proper-flat quotient proof input and ten existing-owner imports |
| Planets | Four new, plus the inherited Level Picard parameters planet |
| Coverage | One planned stage; zero closed stages |
| Source issues | Empty; no new source error asserted |

## Corrections made

1. **Normalization does not recover all lifts by forgetting the rigidification.** The former `pointed-normalization` test asserted that forgetting normalization restored the entire lift groupoid. It only produces the normalized isomorphism class. The corrected test states uniqueness up to unique rigidification-preserving isomorphism and recovers every lift by tensoring with a pulled-back base line bundle. The constant family over the complex projective line, twisted by its degree-one line bundle, detects the error. Added the direct prerequisite `AlgebraicModuliForArithmeticGeometry:A0-extension/section-picard-split`, whose statement and normalized descent proof supply this specialization.
2. **Chen's elliptic comparison needed the actual group-law owners.** ModularCurves 1C supplies the pointed Weierstrass presentation. The canonical scheme-level group law is in 1D; automatic compatibility of pointed maps with the group law, and hence uniqueness, is in 2D (`isGroupHom_of_mapsZero`, KM 2.5.1). Added 1D and 2D to the direct prerequisites, consumer import inventory and exact supplier requests. Narrowed the 1C request accordingly and rewrote the proof step. These are imports of existing targets, not new mathematical nodes. Also distinguished Chen's elliptic stack from its coarse scheme in prose where both had been rendered with identical notation.
3. **Corrected permanent Stacks locators.** Lemma 108.9.1 is tag [0DME](https://stacks.math.columbia.edu/tag/0DME), whereas 0DMD labels its section. Lemma 109.11.2 is tag [0E6L](https://stacks.math.columbia.edu/tag/0E6L), whereas 0E1H labels its section. Corrected the node receipts and source inventories consistently. The mathematical statements used were the intended lemmas.
4. **Corrected and completed the AV contract.** The named v1 source has Example 5.1, not Example 5.1-1. Made the finite symplectic group's hypotheses explicit: positive rank, odd finite coefficient field, and inversion of the group order on the base. In particular, the central scalar used by the test is nontrivial. The consumer still owns the cover problem and its forgetful map.
5. **Separated source attribution.** The relative-Picard comparison had placed a DGH locator inside its Yuan receipt. Added a distinct `dgh-2021-v3` receipt with its own §6.1, pp.23–24 locator and match; retained Yuan's own §4.3.2, pp.74–75 receipt.
6. **Clarified the forgetful functor.** Actual triples map to the fine-level curve-moduli groupoid, which is equivalent to a discrete sheaf. That sentence no longer risks identifying the groupoid of triples itself with that sheaf: scalar automorphisms and base twists remain present.
7. **Typed all tests.** Added the required `kind` field to each of the 11 existing tests. Their examples distinguish scalar inertia from isomorphism classes, base-line-bundle ambiguity from local triviality, native noninvertible module maps from groupoid arrows, and empty obstruction fibres from inhabited torsors.

Every mathematical correction, source change, prerequisite addition and request change is reflected in the [reader](../readmes/StableReductionPartII--MC.7.md). Added the packet's independent-review object and this report. The suggested Lean file needs no change: its signatures concern only the native fragments, and its omission inventory already names the corrected reader tests.

## Verdict for every node

The node names below have prefix `StableReductionPartII:MC.7/`.

| Node | Verdict | Check |
| --- | --- | --- |
| `fine-family-functions` | Verified | Stacks 0E0L, using 0E62 and 0BUG(7), supplies universal global functions after arbitrary scheme base change. No Noetherian restriction is imposed on test schemes. |
| `level-picard-sheaf-comparison` | Corrected | Source attribution separated. JC0 supplies the represented degree pieces, smoothness, torsor action and arbitrary-test comparison; the proper-flat representability proof input remains an explicit owner gap. |
| `actual-triples-groupoid` | Corrected | Forgetful functor and locator clarified; tests typed. Arrows are actual line-bundle isomorphisms over level-preserving curve isomorphisms. Scalar inertia survives. |
| `lift-gerbe` | Corrected | Normalization test repaired and its direct supplier added. Local objects, local isomorphisms and the scalar band follow from sheafification, descent and universal functions. |
| `lift-obstruction` | Verified | The specific Leray boundary has the stated five-term exact sequence and pullback naturality. Its target is cohomological H²; no Azumaya classification is inferred. |
| `lift-torsor` | Corrected | Locator and test metadata corrected. When the obstruction vanishes, global lift classes form a Pic(T)-torsor; choosing a lift identifies the actual groupoid with base line bundles. The stated change-of-origin sign is correct. |
| `infinitesimal-points` | Verified | The split dual-number unit sequence gives H¹(C,O), dimension g, and framed scalar automorphisms 1+εk. The integral JC6 supplier base is Spec k; the dual-number scheme is a test scheme. |
| `consumer-av` | Corrected | Correct example and explicit coefficient hypotheses. Universal-family pullback retains deck inertia and asserts no étaleness of the Hurwitz map. |
| `consumer-clp` | Verified | Stable pointed range, ordered marks, forgetful maps and boundary normalization agree with the consumer. Constant graph automorphism groups are retained, including in characteristic two. Chow and cohomology calculations remain outside this contract. |
| `consumer-chen` | Corrected | Added the group-law and pointed-arrow owners. The R09.5/SF.1 comparison supplies algebraic-space coarse universality before uniqueness identifies the existing coarse j-line. |
| `consumer-dgh` | Verified | Correct fine-level component and cartesian relative-Jacobian square. Finite geometric Torelli fibres are distinguished from a finite morphism; Pic¹, Abel and difference are section-free. |
| `consumer-landesman-litt` | Verified | The connected complex base, smooth marked family and classifying map match the source. The dominant étale condition belongs to the versal specialization. |
| `consumer-yuan` | Verified | All similitude multipliers are covered by the finite coproduct of exact-pairing components, with inverse frame adjustment. Triple-class comparison is restricted to algebraically closed fields. Stable extension uses a finite cover; the algebraic Hodge comparison does not assert the metric statement. |

The APIs provide the actual constructors, morphisms, class map, scalar automorphisms, pullback, band, action/difference, chosen-origin equivalence and pointed normalization needed by these targets. Four, three and four tests respectively meet the minimum of three. The target-level granularity is appropriate: proof steps are not promoted to auxiliary lemma nodes. The planets name the central objects and results, rather than source locations.

## Baseline and existing ownership

I read every cited declaration's actual statement at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

| Declaration | Confirmed role and limitation |
| --- | --- |
| `AlgebraicGeometry.Scheme` | Native scheme carrier, in `Mathlib/AlgebraicGeometry/Scheme.lean`. |
| `AlgebraicGeometry.Scheme.fppfTopology` | Actual fppf topology, with subcanonicity, in `Sites/Fpqc.lean`. |
| `CategoryTheory.Sheaf` | Full subcategory of sheaf presheaves, in `Sites/Sheaf.lean`; it is not a category-valued stack. |
| `CategoryTheory.GrothendieckTopology.yonedaEquiv` | Represented-sheaf evaluation equivalence under subcanonicity, in `Sites/Subcanonical.lean`. |
| `CategoryTheory.Core` | Objects and actual invertible arrows, in `CategoryTheory/Core.lean`. |
| `TauCeti.AlgebraicGeometry.InvertibleSheaf` | Full category of module sheaves, in `LineBundle/Basic.lean`; its arbitrary maps necessitate taking the core. |
| `TauCeti.AlgebraicGeometry.LineBundleClass` | Absolute skeleton with tensor commutative monoid, in `LineBundle/Class.lean`; no inverse operation at this pin. |
| `LineBundleClass.mk_eq_mk_iff` | Class equality detects an isomorphism of underlying module sheaves, in the same file. |
| `LineBundleClass.mk_tensorProduct` | Native tensor product agrees with class multiplication, in the same file. |

The reviewed library audit was checked, particularly JacobianChallenge A, C and D and StableReduction Layer 3. I also read the current JacobianChallenge and AlgebraicVectorBundles roadmaps, relevant StableReduction and ModularCurves layers, and their relevant suggested interfaces. Current read-only commits are TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

Current Tau Ceti already supplies the absolute Picard group, line-bundle pullback and its identity/composition laws, pointed rigidified class functor and trivial point, and Euler degree. The packet credits these advances separately from the older compilation baseline. The current rigidified functor files do not establish the full unpointed relative-sheaf comparison. AlgebraicVectorBundles L0A–L0C already own the tensor, pullback, dual and determinant coherence imported here. ModularCurves already owns the elliptic group law, stack and coarse j-line. No new node duplicates this work, and no upstream file was edited or built.

I read the exact direct blueprint suppliers' statements, hypotheses and proof sketches, and the representability, Leray and coarse-comparison suppliers named in `supplierProofAudit`. After correction there are 41 distinct direct external exact-node prerequisites. A traversal of all exact-node prerequisites reaches 457 nodes with no cycle or duplicate node ID. Its library/stage/request terminals are not being reported as proved declarations. In particular, a finite locally free quotient theorem cannot discharge the proper-flat divisor relation: the latter's fibres can be positive-dimensional. The existing precise R09.3 request is necessary and retained. No new roadmap, ownership transfer or upward dependency is introduced.

## Sources and remaining obligations

I independently read the packet's bounded locators in the named versions. BLR was read only in the maintainer-cleared original: §8.1 pp.203–206; §8.2 Theorems 1, 5, 8 and 12, Lemma 6 and Propositions 7 and 10, pp.210–221; §8.4 pp.231–232; §9.2 Corollary 13 p.251; §9.3 Theorem 1 and Remark 2 p.252; and §9.4 Theorem 1 p.259 and Proposition 4 p.260. This checks the Picard, quotient, Lie and stable identity-component inputs used here. No book file or passage is reproduced in the repository.

Public consumer receipts are AV arXiv:2303.13436v1, §§5.1–5.2 pp.39–41; CLP arXiv:2307.08830v3, Introduction pp.1–2 and §2.1 pp.4–5; Chen arXiv:2011.12940v2, Introduction pp.2–3; DGH arXiv:2001.10276v3, §6.1 pp.23–24; Landesman–Litt arXiv:2205.15352v4, Notation 1.10.1–1.10.3 pp.10–11; and Yuan's 21 August 2024 author manuscript, §3.1.1 p.41, Lemma 3.4 pp.43–44, pp.45–46 and 57, and §4.3.2 pp.73–75. Their URLs and version hashes are recorded in the packet; the six downloaded PDFs match those hashes. Yuan's overlines and level multipliers were checked visually. The Stacks readings include the corrected permanent tags above and 0E0L, 0E62 and 0BUG. These receipts describe target checks, not section-by-section summaries.

No `sourceIssues` entries await adjudication. The general-base triple-functor qualification does not establish a new error in Yuan: the used algebraically closed point comparison is explicit. No claim is made that these author/preprint versions have been collated against published versions. Katz–Mazur inputs are imported from the current ModularCurves owner; no independent reading of uncleared chapters is claimed.

The four recorded gaps remain: the generic proper-flat quotient; native geometric carriers and site/class comparisons; inherited category-valued curve, level, coarse and Torelli proofs; and inherited stable extension, projective-coarse and stable-Hodge proofs. Each is assigned to its existing owner and relevant consumer scope. They are compatible with `planned` coverage under Protocol §0 and rule out `closed` coverage. No orchestrator decision blocks acceptance. The next implementation or packaging pass should preserve these obligations and the eleven exact requests, including the two corrected ModularCurves imports.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/StableReductionPartII--MC.7.json` reports **zero errors and zero warnings**.

`lean-check research/blueprint/suggested/StableReductionPartII--MC.7.lean` elaborated successfully at the pinned commits, with exactly six expected `sorry` warnings and no errors or other warnings. The unchanged compact file has 132 lines: four light definitions with real bodies, two theorem signatures and four examples. It checks represented fppf points and their over-base fibre equation, the core of native invertible sheaves, and absolute class comparisons. It does not elaborate the relative Picard, lift-torsor, deformation or consumer contracts. Their 14 named omitted targets and all 17 API items and 11 tests are explicitly identified as reader specifications, as required by the compact-file rule in WORKERS.md.
