# REV-DerivedDeRhamCohomology

**Completed independent review: needs_changes.** Codex, session `codex-SI7TNh`, 6 October 2026; issue #385. Reviewer identity: `independent-review-REV-DerivedDeRhamCohomology`. The reviewed planning work was written by other sessions, including `codex-4pmoDm` and its earlier checkpoint author `codex-7e92bd`.

The target-level pass covers all seven stages and retains all 132 nodes. I checked every node's source locator, excerpt, mathematical hypotheses and proof route; every directly cited baseline declaration at the exact pins; all 190 API items and 151 tests; and ownership, requests, dependencies and planets. Clear textual errors are corrected in the packet and corresponding suggested-file comments. However, the suggested derived signatures frequently quantify unrelated models without identification hypotheses. Several positive and negative declarations are exact logical opposites. These are false contracts, beyond the acknowledged absence of enhanced infrastructure. They prevent acceptance.

All 11 inherited source issues are independently confirmed; two additional misprints are recorded. Open source/proof/supplier gaps remain explicit. Such gaps, and a complete target pass with no closed stages, are permissible and are not themselves the rejection reason. This is a finished review, not a planning checkpoint. No implementation or promotion is asserted.

## Counts and scope

| Item | Result |
| --- | --- |
| Nodes | 132: 16 definitions, 34 constructions, 14 lemmas, 50 theorems, 13 comparisons, 5 applications |
| Per-node review verdicts | 19 corrected, 1 verified, 112 unverifiable; none added |
| Nodes receiving clear packet corrections | 50; a corrected citation does not resolve an invalid suggested contract |
| Direct baseline declarations | 45 confirmed; 0 removed, replaced or added |
| Source records / node citations | 24 / 184; every normalized excerpt found in the independently fetched source |
| API / unit-test inventory | 190 / 151; all names present in the suggested file |
| Definitions and constructions | All 50 have at least three packet tests; signature validity and discrimination still fail in the families below |
| Coverage | Seven planned stages, zero closed; 31 target-coverage rows realized |
| Planets | 39, at most six per stage |
| Requests / gaps | 12 / 13; previously 12 gaps |
| Source issues | 13 confirmed: 11 inherited, 2 added; none rejected |
| Fine-node dependency closure | 162 reachable nodes, 779 edges, 78 distinct baseline leaves; no unresolved fine-node references or fine-node cycles |

| Stage | Nodes | Corrected / verified / unverifiable | Planets |
| --- | ---: | --- | ---: |
| DD.0 | 22 | 0 / 0 / 22 | 6 |
| DD.1 | 21 | 0 / 0 / 21 | 6 |
| DD.2 | 32 | 19 / 0 / 13 | 5 |
| DD.3 | 10 | 0 / 1 / 9 | 6 |
| DD.4 | 14 | 0 / 0 / 14 | 6 |
| DD.5 | 13 | 0 / 0 / 13 | 5 |
| DD.6 | 20 | 0 / 0 / 20 | 5 |

The packet's `review.checked` is the complete 132-node ledger, with individual reasons. `unverifiable` means that the complete node contract, including its proposed API/tests, cannot be certified; it does not claim that every underlying mathematical source theorem is false. The ordinary differential-symbol tranche is sound at target level after correcting its Riou locator. Its scalar restriction, coefficient-first differential, strict characteristic-two alternation, spanning/kernel argument and semilinear pullback fit the pinned carriers. Frobenius scalar linearity is verified separately.

## Acceptance blockers and concrete revision requirements

The following declarations are in [the suggested file](../suggested/DerivedDeRhamCohomology.lean). They remain admitted and explicitly flagged in its header. Source-based mathematical comments do not restrict the quantified Lean statement beneath them.

| Family / declarations | Failure and required correction |
| --- | --- |
| `crystallineComparisonSmooth`, `lciCrystallineComparison`, `test_crys_map_nonlci` | Smooth comparison asserts `IsIso` for an arbitrary target `cr`; the negative example denies it for every map and the same arbitrary `cr`. Specializing to A=B yields both assertions. The lci theorem has no lci, endpoint flatness or nilpotent-p hypotheses. Use an actual crystalline model/comparison, source hypotheses, and the specific non-lci example. |
| `hlfCompositionBaseChange`, `test_hlf_nonintegral_kato` | The first universally asserts the hlf predicate and the second universally negates the identical predicate. Composition/base change must take actual hlf maps and squares; the negative example must instantiate KY's specified monoid inclusion and ring map. |
| `correctedGLciLocalFiltered`, `test_corrected_glci_square_zero` | Universal assertion and negation of the same corrected G-lci predicate. Its prototype checks an unrelated ideal in B rather than a factorization and the strict quotient's kernel. Encode the regular factorization and compatible filtered presentations, and instantiate the specified nonregular quotient. |
| `logCrystallineComparisonStrict`, `test_log_crys_strict_regular`, `test_log_crys_noncartier` | Positive and negative examples have overlapping unrestricted parameters; the negative includes identical monoids covered by the positive strict declaration. Strictness identifies the comparison with ordinary Comp; it does not make Comp invertible without its comparison hypotheses. |
| `qrspWittControl` and QRSP Witt tests | Concentration has no QRSP assumption, while the alleged negative example asserts higher cohomology for those same unrestricted inputs. Require an actual QRSP ring and specify the non-QRSP example separately. |
| `cotangentResolutionEquiv`, power base changes, graded-piece and totalization comparisons | Arbitrary normalized differentials, base-change functions, tensor operations, graded operations and totalization objects are asserted equivalent to the constructed object. A zero model versus a nonzero unit disproves this pattern. Supply actual functors, resolutions, diagrams, comparison maps and identifying hypotheses. |
| `symmetricPowerFlat`, `dividedPowerFlat`, `completeNakayama` | The former identify weight-zero power with an arbitrary ordinary weight; choosing zero contradicts the unit computation. The latter permits reduction identically zero, forcing a nonzero complete module to vanish. Use the ordinary power functor and actual derived quotient. |
| `lciAmplitude`, `absoluteCompleteIntersection`, `andreRegularity`, `fFiniteCotangent`, `pBasesDifferentials` | Essential lci/local/AQ/F-finite/p-basis hypotheses disappear. A Noetherian field with infinitely many independent p-basis variables is not F-finite. An arbitrary index type cannot be a basis of every differential module. State the exact source conditions and the chosen p-basis. |
| `boundedTorsionCriterion`, `ordinaryFlatnessFromCompleteFlatness` | The former gives vanishing for any M and any bounds, without completeness or Tor-amplitude. The latter gives ordinary flatness of any B from Noetherian A alone, contradicted by Z→F_p. State the complete-flatness and Noetherian theorem's actual input hypotheses. |
| `quasisyntomicCover`, `projQSynCover`, sites and QRSP/root covers | Cotangent amplitude alone does not imply ordinary faithful flatness. The site uses all rings and loses relative map restrictions. QRSP omits a perfectoid source; its quotient API asks for a surjection from every R instead of an existing chosen perfectoid R. Root-cover surjectivity similarly cannot hold for arbitrary R. Restore object/map distinctions, complete faithful flatness, the actual source and its witnesses. |
| `ordinaryBaseChangeKunneth` | B′ is unrelated to the base-change algebra. Take A′=A, B=A and B′=A[t]; degree-one forms on the left vanish and those on the right do not. Require B′=B⊗_A A′ through the appropriate algebra equivalence and square. |
| Formal/scheme de Rham tests | Degree-one formal forms are asserted to be B for every A→B, including the identity whose one-forms vanish. `deRhamSheaves` universally denies finite H0, including Spec A with H0=A. Scheme inputs lack the morphism to the base. Use the explicit polynomial/nonproper examples and base morphisms. |
| `properSmoothCohomologicalControl`, `completedBaseChangeCupProducts` | An arbitrary scheme over an arbitrary ring is given perfect finite-projective control, with no proper/smooth/base data. An arbitrary function is asserted to implement global base change. State the proper smooth finite-presentation formal morphism and actual derived square, retaining the recorded lifting gap. |
| `prelogAnimationExtend`, log site and chart families | The extension API equates arbitrary functors F and G. The carrier/site is a product of rings and monoids without a structure map; chart inputs do not require the compatibility square. Use actual prelog objects, compatible maps and the extension restriction/universal property. |
| Derived derivations, Beilinson/Rees/universal APIs | Derivations are defined as cotangent Hom, making their comparison circular rather than testing intrinsic sections. Beilinson t-structure is P⇒P; its heart is an arbitrary zero-differential complex. Rees has no t-action. Inhabited Hom sets merely have zero maps. `isDerivedCompleteLimits` only states shift stability. Supply the planned independent constructions and universal properties, or explicitly narrow the suggested coverage. |
| Quotient, algebraization, log point and period tests | Quotienting by the span of g·0 is vacuous. Existence of any smooth algebra is witnessed by A and ignores B. Arbitrary log maps are assigned the standard log point's cohomology, including identities. Arbitrary `pdLogTeich` functions do not test the canonical convergent PD logarithm. Instantiate the mathematical data and assert the actual nontrivial computation/boundary. |

These failures cannot be repaired by putting the desired conclusion into an assumption or retaining the same unrestricted model under a more reassuring comment. Repair the model interfaces first, then express actual source hypotheses and positive/negative instances. Coherent animation, E∞ structures and mapping spaces remain explicit supplier/gap obligations; ordinary derived-category views can still be useful where their statements are mathematically valid. A future revision need not implement these objects or close every gap to pass review, but must propose consistent, discriminating contracts.

## Clear mathematical corrections

The broad bounded-torsion conclusion in DD.1 was false. BMS2 Lemma 4.6 gives cohomological amplitude from finite p-complete Tor-amplitude; Lemma 4.7 supplies bounded torsion in the complete-flat amplitude-zero case. For a counterexample to the broad claim, over Z_p take the two-term complex of flat derived-complete modules ∏_{n≥1}Z_p → ∏_{n≥1}Z_p, in degrees −1,0, with nth differential p^n. It is derived p-complete with p-complete Tor-amplitude [−1,0]; H0 is ∏_{n≥1}Z/p^n and has unbounded p-power torsion. The injective differential gives H−1=0. This does not contradict the complete-flat theorem.

Flat square-zero lifting now assumes B flat over A. The cited cotangent extension theorem classifies extensions with a specified ideal; flatness of the lifted algebra additionally uses the local flatness criterion and the ideal identification. That proof input is a new explicit gap. The relative quasismooth cotangent conclusion is p-completely flat, not automatically ordinarily flat. An étale chart map is a quasisyntomic map; it is a cover only with the faithful/joint cover condition. Finite free compact-projective prelog generators are distinguished from generally infinite cotriple resolution terms.

For Bhatt Example 3.21, failure of Tor-amplitude [−1,0] alone does not establish unbounded cotangent homology. The proof route now requests the stronger eventual-AQ-vanishing criterion. BL Appendix B only animates cotangent-specialized exterior powers, so its citation cannot alone support all generic module-pair power constructions; this is added to the existing integral powers gap. The irrelevant exterior diagonal sentence is removed from symmetric/divided powers.

## Every node-level correction

The following ledger records all 50 affected nodes. Source/hypothesis corrections coexist with `unverifiable` verdicts where the suggested contract still fails. The 19 ordinary nodes receive `corrected` verdicts because only their citation needed repair.

| Node suffix | Change |
| --- | --- |
| `symbol-relations` | Riou source path corrected to the exact PR-head module; content hash independently matched. |
| `symbol-map` | Riou source path corrected to the exact PR-head module; content hash independently matched. |
| `symbol-map-surjective` | Riou source path corrected to the exact PR-head module; content hash independently matched. |
| `symbol-relations-kernel` | Riou source path corrected to the exact PR-head module; content hash independently matched. |
| `free-symbol-differential` | Riou source path corrected to the exact PR-head module; content hash independently matched. |
| `free-differential-relations` | Riou source path corrected to the exact PR-head module; content hash independently matched. |
| `ordinary-differential` | Riou source path corrected to the exact PR-head module; content hash independently matched. |
| `differential-generator-formula` | Riou source path corrected to the exact PR-head module; content hash independently matched. |
| `differential-uniqueness` | Riou source path corrected to the exact PR-head module; content hash independently matched. |
| `differential-square-zero` | Riou source path corrected to the exact PR-head module; content hash independently matched. |
| `differential-graded-leibniz` | Riou source path corrected to the exact PR-head module; content hash independently matched. |
| `ordinary-de-rham-complex` | Riou source path corrected to the exact PR-head module; content hash independently matched. |
| `forms-pullback` | Riou source path corrected to the exact PR-head module; content hash independently matched. |
| `pullback-differential` | Riou source path corrected to the exact PR-head module; content hash independently matched. |
| `pullback-wedge` | Riou source path corrected to the exact PR-head module; content hash independently matched. |
| `pullback-identity` | Riou source path corrected to the exact PR-head module; content hash independently matched. |
| `pullback-composition` | Riou source path corrected to the exact PR-head module; content hash independently matched. |
| `ordinary-complex-map` | Riou source path corrected to the exact PR-head module; content hash independently matched. |
| `pullback-elementary` | Riou source path corrected to the exact PR-head module; content hash independently matched. |
| `derived-symmetric-powers` | statement:  The exterior operation imposes x∧x=0 even at 2. → ; Limited BL Appendix B attribution to its actual cotangent-exterior scope; general module-pair operations remain an explicit source gap. |
| `derived-divided-powers` | statement:  The exterior operation imposes x∧x=0 even at 2. → ; Limited BL Appendix B attribution to its actual cotangent-exterior scope; general module-pair operations remain an explicit source gap. |
| `derived-exterior-powers` | Limited BL Appendix B attribution to its actual cotangent-exterior scope; general module-pair operations remain an explicit source gap. |
| `square-zero-deformations` | statement: let B be an ordinary A-algebra → let B be a flat ordinary A-algebra; hypotheses: let B be an ordinary A-algebra → let B be a flat ordinary A-algebra; locator: §21, Lemma 21.1; tag 08SP → §16, Lemma 16.1 (tag 08SP), and its ringed-space version §21, Lemma 21.1 (tag 08UZ) |
| `bounded-torsion-criterion` | statement: then M has ordinary cohomological amplitude [a,b] and bounded p-power torsion in its cohomology. → then M has ordinary cohomological amplitude [a,b]. Bounded p-power torsion in every cohomology group does not follow from this finite amplitude assumption. The bounded-torsion conclusion below is restricted to the p-completely flat case [a,b]=[0,0]. |
| `relative-tor-amplitude` | statement: the completed L is a flat module in degree zero → the completed L is a p-completely flat module in degree zero; ordinary flatness requires an additional criterion, such as the Noetherian complete-flatness theorem in DD.1 |
| `formal-etale-realization` | statement: Smooth/étale maps of such charts are quasisyntomic covers, so the local values glue. → Smooth/étale maps of such charts are quasisyntomic maps. A completely faithfully flat map, or a jointly covering family with that faithful cover property, supplies quasisyntomic descent, so the local values glue; an arbitrary individual open immersion is not a cover. |
| `free-prelog-resolutions` | statement: The free/forgetful cotriple gives a canonical surjective simplicial resolution of (B,N), free termwise as both ring and monoid algebra. → Finite free objects are the compact projective generators for animation. The free/forgetful cotriple on the underlying generator sets gives a canonical surjective simplicial resolution of (B,N), whose termwise free ring and monoid generator sets may be infinite.; proofSteps: Construct the free prelog adjunction and its simplicial cotriple with both generator types. → Construct the free prelog adjunction on arbitrary generator sets and its simplicial cotriple with both generator types; finite free objects separately form the compact-projective subcategory. |
| `nonregular-quotient-homology` | proofSteps: Apply the Noetherian absolute complete-intersection cotangent criterion to get unbounded full cotangent homology. → Use the stronger eventual-vanishing criterion for André–Quillen homology needed by Bhatt Example 3.21 to obtain unbounded full cotangent homology. The amplitude [−1,0] criterion alone only rules out that amplitude; it does not prove unboundedness. The stronger criterion is recorded in the Cohen-factorization/AQ proof gap. |
| `p-bases-differentials` | locator: §5.2, Footnote 10 and the paragraph before Lemma 5.8, PDF pp.39–40 → §5.1, Theorem 5.7, Footnote 10 and the paragraph before Lemma 5.8, PDF pp.39–40 |
| `derived-completion` | locator: §93, Proposition 93.6, Lemmas 93.7–93.9; tags 091V,0920,0G1U → §93, Lemmas 93.10, 93.18 and 93.20; tags 091V,0920,0G1U |
| `koszul-completion-tower` | locator: Lemma 93.7; tag 0920 → Lemma 93.18; tag 0920 |
| `ordinary-quotient-completion` | locator: §95, Lemmas 95.1–95.4; tags 091X,0923 → §95, Lemmas 95.1–95.2 and Examples 95.3–95.4; tags 091X,0923,09AT,0G3F |
| `koszul-complex` | locator: §29, Definition 29.1, Lemmas 29.3–29.12; tags 0621–062D → §29, Definitions 29.1–29.2, Lemmas 29.3–29.12; tags 0622–062C,0663,0664 (0621 is the section introduction) |
| `cotangent-localization-colimits` | locator: §8, Lemma 8.6, and §9 localization; tags 08QZ,08SF → §8, Lemmas 8.1 and 8.6 (tags 08QZ,08SF); §3 standard-resolution functoriality and its filtered-colimit construction |
| `cotangent-naive-comparison` | locator: Lemmas 4.5 and 11.3, Proposition 14.4; tags 08QF,08RA,08RB → Lemmas 4.5, 11.2 and 11.3; tags 08QF,08RA,08RB |
| `smooth-cotangent` | locator: §9, Lemma 9.1; tags 08R2,08R5 → §9, Lemma 9.1 (tag 08R5), using §8, Lemma 8.4 (tag 08R2) for étale maps |
| `beilinson-t-structure` | locator: Appendix D, Theorem D.1 and Proposition D.6 → Appendix D, Definition D.3, Proposition D.4 and Remark D.6 |
| `beilinson-heart` | locator: Appendix D, Remark D.4 → Appendix D, Example D.8; locator: Theorem 5.4 and Remark 5.5 → Theorem 5.4(3) and proof, pp.234–237 (Remark 5.5 concerns décalage) |
| `complex-heart-ext` | locator: Proposition 5.6 and proof, p.236 → Proposition 5.6 and proof, pp.237–238, with the Ext-index correction E6 |
| `power-triangle-filtration` | locator: Lemma 3.22, Corollary 3.43 and proof → Proposition 3.22 and Remark 3.43; cotangent-specialized power filtration and décalage (general module version remains in the integral powers gap) |
| `smooth-cartier` | locator: Corollary 3.4 and proof, p.7 → Theorem 3.2 and Remark 3.4 with proof, p.7 |
| `log-power-de-rham-descent` | locator: Proposition 2.47 and Corollaries 2.48–2.49, pp.24–26 → Proposition 2.47, Remark 2.48 and Corollary 2.49, pp.24–26 |
| `de-rham-sheaves` | locator: Appendix B, Remark B.7–B.8; Appendix E, Proposition E.16 → Appendix B, Construction B.7 and Remark B.8; Appendix E, Proposition E.16 |
| `hodge-completed-derham` | locator: Appendix E, Variant E.14 and Remark E.15 → Appendix E, Construction E.14 and Remark E.15 |
| `p-completed-derham` | locator: Appendix E, Variant E.3 and Remark E.4 → Appendix E, Construction E.3 and Remark E.4 |
| `smooth-de-rham-comparison` | locator: Appendix E, Proposition E.12, Variant E.14 → Appendix E, Proposition E.12, Construction E.14 |
| `filtered-de-rham-descent` | locator: Proposition E.16 with proof, p.231 → Proposition E.16 with proof, pp.235–236 of the downloaded revision |
| `uncompleted-p-de-rham-descent` | locator: Variant E.17 with proof, pp.231–232 → Variant E.17 with proof, p.236 of the downloaded revision |
| `derived-derivations` | Replaced animation-only citations by Bhatt Remark 6.6, equivalence (6), with identical trivial monoids for the intrinsic derivation comparison. |
| `derivations-cotangent-comparison` | Replaced animation-only citations by Bhatt Remark 6.6, equivalence (6), with identical trivial monoids for the intrinsic derivation comparison. |

Additional metadata changes: corrected the Stacks proper-cohomology title from III to VI; corrected the Riou source-record module path; corrected E6's companion locator from Theorem 5.5 to the proof of 5.4 and E11's proof page from 15 to 16; added independent source-issue verdicts and E12/E13; replaced unsupported novelty language with scoped search records; rebuilt each stage's `remaining` list from supplier requests and gaps; expanded the enhanced-signature gap to include false contracts; replaced inherited validation assertions with this review's actual checks; added the 132-entry review ledger. The suggested file has a rejection banner and matching mathematical comment corrections; no attempted implementation or semantic signature repair is claimed.

## Pinned baseline audit

All 45 declarations were independently read in their cited modules at these exact commits. No citation was removed or replaced and no baseline near miss was promoted to a new node. The reviewed `data/library-coverage.json` has no DD audit entry; unreviewed leads were independently screened rather than treated as authority.

- Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.

Ordinary `DerivedCategory`, naive conormal cotangent data, ordinary divided powers/algebra, Witt vectors, Kähler differentials and exterior powers are reused. They do not provide enhanced derived algebra/animation, the full cotangent complex, generic derived power functors, PD envelopes or de Rham–Witt. `Module.Presentation.restrictScalars` specifically requires lifting data, which the packet records. Weak regularity and regularity are distinct and neither supplies a log factorization. Tau Ceti's semilinear map is already implemented and is imported rather than duplicated.

| Confirmed declaration | Exact-pin source and provided boundary |
| --- | --- |
| `mathlib:AlternatingMap.map_eq_zero_of_eq` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Alternating/Basic.lean). Strict alternation, valid also in characteristic two. |
| `mathlib:AlternatingMap.map_swap` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Alternating/Basic.lean). Exchanging two distinct slots negates an alternating map. |
| `mathlib:CochainComplex.of` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/HomologicalComplex.lean). Constructs the nonnegative complex from an adjacent differential and its square-zero proof. |
| `mathlib:Derivation.leibniz` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Derivation/Basic.lean). The universal derivation obeys the coefficient product rule. |
| `mathlib:Derivation.leibniz_pow` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Derivation/Basic.lean). D(b^n)=n·b^(n−1)Db, used for Frobenius scalar linearity. |
| `mathlib:Derivation.map_algebraMap` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Derivation/Basic.lean). An R-derivation vanishes on the image of R. |
| `mathlib:Derivation.map_one_eq_zero` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Derivation/Basic.lean). The universal derivation kills 1. |
| `mathlib:ExteriorAlgebra.exteriorPower` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean). The degree-n existing submodule of the exterior algebra; no new carrier of forms is required. |
| `mathlib:ExteriorAlgebra.gradedAlgebra` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorAlgebra/Grading.lean). The existing graded algebra structure on exterior powers supplies wedge multiplication. |
| `mathlib:Finsupp.linearCombination` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Finsupp/LinearCombination.lean). Linear map from the existing free module evaluating a prescribed generator family. |
| `mathlib:KaehlerDifferential.D` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Kaehler/Basic.lean). The existing universal derivation B→Ω_(B/A), linear over A and a derivation over B. |
| `mathlib:KaehlerDifferential.kerTotal` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Kaehler/Basic.lean). The existing Kähler relation submodule: additivity, Leibniz and base constants. |
| `mathlib:KaehlerDifferential.mvPolynomialBasis` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Kaehler/Polynomial.lean). The existing basis of multivariate polynomial Kähler differentials, with basis vectors DX_i, detects dX∧dY≠0 in the two-variable test. |
| `mathlib:KaehlerDifferential.polynomialEquiv_D` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Kaehler/Polynomial.lean). Under the existing polynomial differential-module equivalence, DP maps to the formal derivative of P. |
| `mathlib:KaehlerDifferential.quotKerTotalEquiv` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Kaehler/Basic.lean). Identifies the presented module of Kähler symbols with the pinned Kähler differential module. |
| `mathlib:KaehlerDifferential.span_range_derivation` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Kaehler/Basic.lean). Exact one-forms span the Kähler module over B, not generally over A. |
| `mathlib:Module.Presentation.restrictScalars` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Presentation/RestrictScalars.lean). Given a B-module presentation, an A-module presentation of B and lifting data, constructs the A-module presentation. |
| `mathlib:Polynomial.derivative_X` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/Derivative.lean). The formal derivative of X is 1, detecting a wrongly zero de Rham differential. |
| `mathlib:Submodule.liftQ` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Quotient/Basic.lean). Descends a semilinear map annihilating a submodule to its quotient. |
| `mathlib:exteriorPower.alternatingMapLinearEquiv` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Basic.lean). Universal property of existing exterior powers. |
| `mathlib:exteriorPower.oneEquiv` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Basic.lean). Identifies the existing first exterior power with the module. |
| `mathlib:exteriorPower.presentation` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Basic.lean). The existing exterior-power presentation by multilinearity and strict alternation. |
| `mathlib:exteriorPower.zeroEquiv` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Basic.lean). Identifies the existing zeroth exterior power with the coefficient ring. |
| `mathlib:exteriorPower.ιMulti` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Basic.lean). The canonical alternating map to the existing exterior power. |
| `mathlib:exteriorPower.ιMulti_span_of_span` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Basic.lean). Wedges from a spanning family span each existing exterior power. |
| `tauceti:KaehlerDifferential.mapSemilinear` | [module](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Kaehler/MapSemilinear.lean). The already implemented f-semilinear map along an arbitrary A-algebra homomorphism f:B→C. |
| `tauceti:KaehlerDifferential.mapSemilinear_D` | [module](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Kaehler/MapSemilinear.lean). The pinned semilinear map sends Db to D(fb). |
| `mathlib:Algebra.Extension.cotangentComplex` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Extension/Cotangent/Basic.lean). The existing conormal-to-Kähler map of a presentation; only the naive two-term object. |
| `mathlib:Algebra.Extension.toKaehler` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Extension/Cotangent/Basic.lean). Projection from the presentation cotangent space to the existing Kähler module. |
| `mathlib:Algebra.Extension.exact_cotangentComplex_toKaehler` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Extension/Cotangent/Basic.lean). Exactness of the conormal, presentation cotangent-space and Kähler sequence. |
| `mathlib:Algebra.H1Cotangent` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Extension/Cotangent/Basic.lean). The presentation-independent kernel of the naive conormal differential; cohomological H^−1 here. |
| `mathlib:Algebra.Generators.equivH1Cotangent` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Extension/Cotangent/Basic.lean). The equivalence between presentation H1 and the existing presentation-independent H1Cotangent. |
| `mathlib:derivationToSquareZeroEquivLift` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Derivation/ToSquareZero.lean). Ordinary derivations correspond to lifts to a fixed square-zero extension under its scalar-tower hypotheses; not an enhanced mapping space. |
| `mathlib:DividedPowers` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DividedPowers/Basic.lean). A divided-power structure on an ordinary ideal, with integral relations and no factorial division. |
| `mathlib:DividedPowerAlgebra` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DividedPowerAlgebra/Init.lean). The ordinary divided-power algebra carrier on a module, defined by a polynomial ring congruence; not a PD envelope or derived functor. |
| `mathlib:WittVector` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Defs.lean). The existing p-typical Witt-vector carrier; its ring maps are imported, not redefined. |
| `mathlib:DerivedCategory` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean). The ordinary derived category obtained by localization of integer-indexed cochain complexes at quasi-isomorphisms. |
| `mathlib:DerivedCategory.Q` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean). The localization functor from existing cochain complexes to the ordinary derived category. |
| `mathlib:DerivedCategory.singleFunctor` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean). Places an existing module in a specified cohomological degree. |
| `mathlib:DerivedCategory.homologyFunctor` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/HomologySequence.lean). Cohomology of an object of the ordinary derived category in each integer degree. |
| `mathlib:DerivedCategory.isIso_iff` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/HomologySequence.lean). A derived-category map is an isomorphism exactly when all induced cohomology maps are isomorphisms. |
| `mathlib:RingTheory.Sequence.IsWeaklyRegular` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Regular/RegularSequence.lean). Injectivity modulo each preceding initial subsequence; existing regular-sequence test used in the corrected quotient signature. |
| `mathlib:RingTheory.Sequence.IsRegular` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Regular/RegularSequence.lean). Weak regularity together with nonzero final quotient; no full lci predicate or log factorization is provided. |
| `mathlib:PadicInt` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicIntegers.lean). The existing ring of p-adic integers, the norm-at-most-one subtype of p-adic numbers under a prime fact. |
| `mathlib:LaurentPolynomial` | [module](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/Laurent.lean). The existing Laurent polynomial ring, an additive monoid algebra on the integer exponent group. |

## Independent public-source audit

Fetched every source record independently on 6 October 2026. Twenty-three downloaded source hashes match the packet. Riou's mutable PR HTML is not the hashed artifact: I separately fetched the exact PR-head `Mathlib/RingTheory/DeRham/Basic.lean` at `5888c0081ba867ede5c60d3060f2d674d932b53c`; its 432-line source matches the packet's `1703f5b1…` hash. It is an unmerged design lead, not the pinned baseline.

All 184 node excerpts match after Unicode/whitespace normalization, including the newly substituted intrinsic-section citation in Bhatt Remark 6.6. I also checked the associated source statement and proof route, not merely excerpt presence. Some excerpts are broad section words and cannot independently certify the node; the corrected locators, scope notes and explicit gaps address that distinction. Existing `readSections` records include historical author readings; this review does not independently claim to have read every page of every book. In particular, the full Illusie books, the converse SAG proof, Cohen-factorization interior, Kunz/Popescu proofs and formal perfect lifting remain recorded gaps. The public Illusie and Berthelot–Ogus errata were read and retained as binding corrections.

| Source | Independent retrieval |
| --- | --- |
| [bhatt-ddr-2012](https://arxiv.org/pdf/1204.6560v1) | Artifact hash matched; node locators checked in this version |
| [stacks-0FKF](https://stacks.math.columbia.edu/tag/0FKF) | Artifact hash matched; node locators checked in this version |
| [stacks-0H1C](https://stacks.math.columbia.edu/tag/0H1C) | Artifact hash matched; node locators checked in this version |
| [riou-pr18551](https://github.com/leanprover-community/mathlib4/pull/18551) | Exact PR-head Lean source hash matched; mutable HTML excluded; node locators checked in this version |
| [illusie-I-errata](https://www.imo.universite-paris-saclay.fr/~illusie/ErrSLN239.pdf) | Artifact hash matched; node locators checked in this version |
| [illusie-II-errata](https://www.imo.universite-paris-saclay.fr/~illusie/Errsln283.pdf) | Artifact hash matched; node locators checked in this version |
| [bo-2013-erratum](https://math.berkeley.edu/~ogus/preprints/BO_B2_Erratumre.pdf) | Artifact hash matched; node locators checked in this version |
| [bms2](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf) | Artifact hash matched; node locators checked in this version |
| [bhatt-lurie](https://arxiv.org/pdf/2201.06120) | Artifact hash matched; node locators checked in this version |
| [cotangent-stacks](https://stacks.math.columbia.edu/download/cotangent.pdf) | Artifact hash matched; node locators checked in this version |
| [derived-completion-stacks](https://stacks.math.columbia.edu/download/more-algebra.pdf) | Artifact hash matched; node locators checked in this version |
| [prisms](https://arxiv.org/pdf/1905.08229) | Artifact hash matched; node locators checked in this version |
| [bhatt-mathew](https://arxiv.org/pdf/2202.04818) | Artifact hash matched; node locators checked in this version |
| [cmm](https://arxiv.org/pdf/1803.10897) | Artifact hash matched; node locators checked in this version |
| [dundas-morrow](https://arxiv.org/pdf/1403.0534) | Artifact hash matched; node locators checked in this version |
| [avramov99](https://arxiv.org/pdf/math/9909192) | Artifact hash matched; node locators checked in this version |
| [iyengar07](https://math.mit.edu/~hrm/palestine/iyengar-andre-quillen.pdf) | Artifact hash matched; node locators checked in this version |
| [bhatt18](https://arxiv.org/pdf/1608.08882) | Artifact hash matched; node locators checked in this version |
| [bhatt-etal23](https://arxiv.org/pdf/2012.15801) | Artifact hash matched; node locators checked in this version |
| [log-ky](https://arxiv.org/pdf/2306.00364) | Artifact hash matched; node locators checked in this version |
| [gp18](https://arxiv.org/pdf/1602.01515v3) | Artifact hash matched; node locators checked in this version |
| [bhatt-lectures](https://www.math.ias.edu/~bhatt/teaching/mat549f22/lectures.pdf) | Artifact hash matched; node locators checked in this version |
| [stacks-proper-cohomology](https://stacks.math.columbia.edu/tag/0A1G) | Artifact hash matched; node locators checked in this version |
| [stacks-smooth-lift](https://stacks.math.columbia.edu/tag/07M8) | Artifact hash matched; node locators checked in this version |

The principal readings included Stacks' ordinary differential and cotangent constructions, Koszul §29, derived completion §93 and ordinary completion §95; Bhatt's cited cotangent/de Rham/log/period sections; BMS2 §§3–5 and §8.2 plus Remark 10.4; BL Appendices B/D/E; GP's filtration, completion, spectral-sequence and completed tensor arguments; KY's cited §2 and §3 prelog/log results; and each additional paper's cited statement/proof route. Local labels were corrected against the actual downloaded editions, not guessed from another version's page numbering.

## Source issues: independent decisions

Every entry has `review.by = REV-DerivedDeRhamCohomology` and `verdict = confirmed`. E1–E10 and E12/E13 were also checked on rendered source pages; E11 was checked in the proof continuation text. The packet records the exact version, printed formula, proposed correction, impact, search record and reason.

| Issue | Locator | Independent reason |
| --- | --- | --- |
| E1 | Proposition 2.3, printed/PDF p.5 in arXiv:1204.6560v1; checked on the rendered page | Visually checked arXiv v1 p.5: the statement augments to A, whereas Definition 2.1 and the immediately following proof resolve B. The proposed B correction is exact. |
| E2 | Notation 3.1, printed/PDF p.6 in arXiv:1204.6560v1; checked on the rendered page | Visually checked arXiv v1 p.6: the prose says A but the displayed twist is B⊗^L_(A,Frob)A with relative Frobenius to B. Correct the prose only. |
| E3 | Proof of Proposition 3.5, printed/PDF p.7 in arXiv:1204.6560v1; checked on the rendered page | Visually checked arXiv v1 p.7: the intermediate Cartier display shifts only its left module. The final graded-piece equivalence has the correct shift; shift both intermediate sides or neither. |
| E4 | Definition 7.20 and Theorem 7.22, arXiv v1 printed p.31/PDF p.31; also author copy printed p.30 | Visually checked arXiv v1 p.31 and Bhatt Example 3.21: an arbitrary strict effective epimorphism includes the trivial-log non-lci square-zero quotient. The cited ordinary lci theorem requires regularity. The finite regular-quotient repair is supported; the filtered repair remains a recorded proof obligation. |
| E5 | Definition 5.1, published p.233; arXiv v2 printed p.28 | Visually checked published BMS2 p.233: Z^op gives maps F(i+1)→F(i). The printed F(i)/F(i−1) cannot be the associated cofiber; the proposed i+1 correction follows directly. |
| E6 | Proposition 5.6, published p.237 and proof p.238; arXiv v2 pp.31–32; companion display in Theorem 5.4 proof p.236 | Visually checked published BMS2 pp.236–237 and read the proof: RHom(M,N)[c] has H^i=Ext^(i+c). For a field, i=1,c=−1 yields a nonzero extension of complexes while the printed Ext^2 is zero. The companion display belongs to Theorem 5.4 proof, not Theorem 5.5. |
| E7 | Proposition 8.13(3), published p.274; arXiv v2 p.60 | Visually checked published BMS2 p.274: the whole N^≥0 level for S=F_p maps Z_p→F_p, so is not injective. Equation (4) has fiber N^≥(i+1); the graded-domain correction agrees with Theorem 8.14(2). |
| E8 | Claim 3.30 proof, arXiv v1 printed p.14; author copy p.13 | Visually checked arXiv v1 p.14: for odd p Wilson gives (p−1)!=−1. The last displayed equality loses this sign. It is a unit error in the proof normalization, not failure of the comparison isomorphism. |
| E9 | Construction 2.6 and formula (2.1), arXiv:2306.00364v1 printed p.13 | Visually checked KY arXiv v1 p.13: LΩ^i is explicitly unshifted L∧^iL. A free log differential has degree zero and weight-one de Rham has degree one, forcing [−i] in both graded formulas. |
| E10 | Theorem 2.11, arXiv:2306.00364v1 printed pp.14–15, second parenthesized base-change formula | Visually checked KY arXiv v1 p.15: the parenthesized de Rham expression tensors over S1, although its differential is only R-linear. On a polynomial coordinate d(t)=dt and t·d(1)=0. Retain the R-linear base-change expression of Bhatt Proposition 6.12. |
| E11 | Lemma 2.14 proof, arXiv:2306.00364v1 printed p.16 | Read KY arXiv v1 p.16, the continuation of Lemma 2.14: its proof swaps X and Y relative to the statement and Remark 2.12. A ring map R→S induces Spec S→Spec R. Correct both names; the original issue locator p.15 was also off by one. |
| E12 (added) | Proposition 6.12, arXiv:1204.6560v1 printed/PDF p.26, second factor of the homotopy coproduct | Visually checked the p.26 homotopy-coproduct display and the immediately following induced map. The target of f₂ must retain N₂. |
| E13 (added) | Remark 6.6, arXiv:1204.6560v1 printed/PDF p.25, sentence describing the B-module structure on Sect | Visually checked arXiv v1 p.25 and read the entire Remark 6.6: the target of the projection and equation (6) is N→B. The explanatory N→P target is inconsistent with those definitions; P is only a B-module. |

The two new findings are scoped to arXiv:1204.6560v1: Proposition 6.12's second homotopy-coproduct factor must use N2, and Remark 6.6's explanatory section target must be N→B. Their surrounding formulas make these repairs unambiguous. The local errata register/source-issue screen and bounded fresh searches identified no matching correction; this establishes no novelty claim. Fresh KY corrigendum metadata (DOI [10.1016/j.aim.2026.111223](https://doi.org/10.1016/j.aim.2026.111223)) concerns Theorems 7.35/7.36. Its full text was not available in this review and it is not evidence that the §2 issues were corrected. Wilson's sign error only changes a unit normalization; it is not a counterexample to the PD comparison.

## Closure, ownership and handed red-team findings

The internal prerequisite graph and recursively reachable fine-node suppliers have no unresolved references or cycles. Stage requests were treated as explicitly scoped leaves; this is not a claim that the entire global stage graph or every supplier proof is complete. Every `targetCoverage` node exists in its stated stage; all 27 inherited node IDs are retained. Stage `planned` remains appropriate under §0's target-level definition because chains terminate in pinned baselines, specific supplier nodes/requests or named gaps. No stage is `closed` and `status: complete` means a completed target pass. The enlarged signature gap is now visible in each affected stage's `remaining` list.

Read the actual supplier statements: EDS E1 provides enhanced/presentable tensor foundations, E2 inverse-limit amplitude and surjective-system control, E3 the adjoint/localization/Kan-extension input and E5 nonabelian animation. Neither the ordinary Mathlib derived category nor a citation to animation alone proves the intrinsic derivation comparison; its source now points to Bhatt Remark 6.6. The twelve requests identify the needed operation/hypotheses and early prefixes: integral perfectoid and A_inf inputs, ordinary PD/PD Poincaré/classical Witt data, formal charts, proper coherent-cohomology perfectness, early log algebra, and Galois/Tate inputs. Formal chart statements not already exported by a fine supplier remain precise SF.0/SF.4 requests. These are not assertions that the requests have been fulfilled.

RS-01 and its accepted ownership boundaries are preserved. A historically named perfectoid supplier node is read for its actual integral-perfectoid predicate, not as a second owner of QRSP. Generic animated powers and completion stay here; ordinary divided powers/envelopes, enhanced foundations and period-ring carriers remain with their suppliers. No owner move, duplicate layer or new link was introduced.

| Finding | Check |
| --- | --- |
| RT-AREA-padic-2/7 | Packet and reader retain a finite regular strict-quotient repair, endpoint Z/p^n flatness and Cartier/log-smooth first factor. Arbitrary strict effective epimorphisms are excluded. Compatible filtered regular presentations remain a proof gap. The suggested universal G-lci assertions fail independently of that correct textual repair. |
| RT-AREA-padic-2/35 | Packet and reader import only `PerfectoidQuotients:Q0:integral-algebra`, not Q0's animated application or Q3. QRSP and roots do not depend on their later application. |
| RT-AREA-padic-2/36 | DD.4 owns the derived lci/PD comparisons (Bhatt 3.27/3.40); CR.0 supplies ordinary envelopes, flatness and reduction, and CR.2 PD Poincaré. The reader makes the same boundary explicit. |

All 39 planet selections are definitions, central constructions or named theorems at the promised target level; the per-stage counts are 6,6,5,6,6,5,5. No source-label-only planet or excessive stage count needed repair. The API/test numeric inventory passes but cannot substitute for the mathematical failures recorded above.

## Reader propagation and orchestrator questions

The reader is inspected but is not among this issue's editable deliverables. Route the following synchronization through the revision/assembly job before acceptance. Line numbers refer to the reviewed reader; node IDs and named passages are the stable anchors.

| Reader passage | Required propagation |
| --- | --- |
| `square-zero-deformations`, around line 634 | Add B/A flatness and the additional flat lifting criterion proof input. |
| `bounded-torsion-criterion`, around line 971 | Remove bounded torsion for general finite amplitude; retain the amplitude-zero complete-flat assertion. |
| `relative-tor-amplitude`, around line 3210 | Replace ordinary flatness by p-complete flatness with the separate criterion for ordinary flatness. |
| `formal-etale-realization`, around line 3315 | Distinguish quasisyntomic maps from faithful/joint covering families. |
| `free-prelog-resolutions`, around line 3382 | Distinguish finite compact generators from arbitrary cotriple term generator sets. |
| Generic power nodes, around lines 373/411/449 | State BL's cotangent-exterior scope and preserve the general-power source gap; remove copied exterior prose. |
| `nonregular-quotient-homology`, around line 701 | Require the stronger eventual-AQ-vanishing criterion for unboundedness. |
| Locator passages | Propagate the full correction ledger, including Bhatt Proposition 3.22 / Remark 3.43 (around 477), CMM §5.1 (617), BL D.3/D.4/D.6 and Example D.8 (1212/1232), Bhatt Remark 3.4 (2433), KY Remark 2.48 (3823), E6 Theorem 5.4 proof (4104), and E11 p.16 (4164). |
| Source/gap/review inventories | Reflect 13 gaps, 13 source issues, the new E12/E13 findings, and the needs_changes verdict; replace unsupported signature assurances. |

No mathematical ownership decision is needed from the orchestrator. The routing questions are: (1) assign a revision with reader-edit authorization so the synchronized correction ledger can land; (2) require its first tranche to replace contradictory contracts and unrestricted model parameters before another review; (3) keep supplier proof obligations as explicit requests/gaps rather than silently promoting them. No upstream or atlas-data edits were made.

## Validation and reproducible limits

`python3 scripts/check_blueprint.py research/blueprint/packets/DerivedDeRhamCohomology.json --json`, using the default pinned declaration index, reports **0 errors and 0 warnings** after corrections. Independent inventory checks confirm all 132 distinct review IDs, 184 literal normalized excerpts, 190 API names, 151 test names, all target realizations, the three-tests minimum and planet limits. JSON parsing and whitespace/diff checks pass.

Direct `lean-check` of the delivered suggested file at pinned Mathlib stops before elaboration because the shared build lacks the compiled `TauCeti.RingTheory.Kaehler.MapSemilinear` import artifact. A validation-only copy replacing that import with the exact pinned Tau Ceti source, after the remaining imports, elaborated successfully at pinned Mathlib with admitted-declaration warnings only (463 warnings). The supplier's `public section` wrapper was adapted to `section` for that environment. This source-inlined diagnostic is not a successful direct compilation of the delivered import graph, and it does not verify any admitted proposition. Subsequent suggested-file edits change comments only. Available memory was checked before compilation; no library build/update/cache download or language server was used, and no compile remains running.

The review report and packet preserve all findings needed for a revision after scratch cleanup. This completed needs_changes review should trigger the ordinary revision workflow; it should not promote the rejected plan or be treated as an unfinished checkpoint.
