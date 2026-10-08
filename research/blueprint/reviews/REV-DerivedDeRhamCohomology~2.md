# REV-DerivedDeRhamCohomology~2

**Completed independent review: accepted.** Codex, session `codex-4LrBfo`, 8 October 2026; issue #7041. Reviewer: `independent-review-REV-DerivedDeRhamCohomology~2`. This session wrote neither the original plan nor revision BP-DerivedDeRhamCohomology~2. The revision author was Codex session `codex-1pCPsk`.

The revised target-level plan is consistent after the corrections below. I reviewed all 132 nodes, their mathematical hypotheses, proof routes, direct prerequisites, API contracts and proposed tests; all 46 directly cited baseline declarations at the pins; every source locator and all 13 source issues; the suggested signatures and explicit omissions; target coverage, supplier ownership and planets. I read the full preceding review and checked each rejection family against the revision. The unrestricted arbitrary-model statements and overlapping positive/negative assertions have been removed or replaced by faithful ordinary views with explicit omissions. This resolves the preceding rejection.

Acceptance applies to the plan and its stated boundaries. All seven stages remain planned, none closed, and all nodes have unchecked implementation status. The 13 recorded proof/signature gaps and 12 supplier requests remain open. In particular, acceptance does not certify omitted enhanced signatures, unread original-book arguments, or the completion of an external supplier. This is a finished review, not a checkpoint.

The packet's new `review.checked` supplies an individual reason for every node: 119 verified and 13 corrected. The earlier needs_changes review is preserved unchanged in `reviewHistory`; source issues also preserve their earlier decisions. The reader and suggested file reflect the current verdict and every mathematical correction.

## Inventory and coverage

| Item | Reviewed result |
| --- | --- |
| Nodes | 132: 16 definitions, 34 constructions, 14 lemmas, 50 theorems, 13 comparisons, 5 applications |
| Verdicts | 119 verified, 13 corrected; none added or unverifiable |
| Definition/construction API | 191 items, including the new accurately named `completionComplete` |
| Mathematical tests | 151; all 50 definitions/constructions have at least three |
| Baseline | 46 declarations confirmed; none removed, replaced or added by this review |
| Sources | 24 public artifacts, all recorded hashes matched; 184 node citations |
| Target coverage | 31 rows realized across seven planned stages; zero closed stages |
| Planets | 39; at most six in every layer |
| Gaps / requests | 13 / 12; none closed or added |
| Suggested node coverage | 32 typed ordinary views, 11 partial, 89 omitted |
| Suggested name coverage | 133 typed names: 43 main declarations, 40 APIs, 50 labeled examples |
| Explicitly omitted names | 341: 89 declarations, 151 APIs, 101 tests |
| Recursive reference audit | 162 reachable nodes, 780 prerequisite edges, 79 distinct baseline leaves, 18 supplier frontier stages |

| Stage | Nodes | Verified / corrected | API | Tests | Planets |
| --- | ---: | --- | ---: | ---: | ---: |
| DD.0 | 22 | 22 / 0 | 26 | 21 | 6 |
| DD.1 | 21 | 18 / 3 | 35 | 24 | 6 |
| DD.2 | 32 | 29 / 3 | 40 | 37 | 5 |
| DD.3 | 10 | 8 / 2 | 10 | 9 | 6 |
| DD.4 | 14 | 14 / 0 | 16 | 12 | 6 |
| DD.5 | 13 | 13 / 0 | 20 | 15 | 5 |
| DD.6 | 20 | 15 / 5 | 44 | 33 | 5 |

All 27 inherited node IDs remain. The additional ordinary differential proof nodes already belonged to the preceding plan; this review adds no proof-lemma tranche. Target-level completeness was checked against the authoritative seven-stage document, its completion contracts, the integrated decomposition and all current `targetCoverage` rows. A planned target may end in a precise proof or supplier gap under the protocol. No stage is described as proved or implemented.

## Corrections in this review

| Node suffix | Correction and reason |
| --- | --- |
| `polynomial-cartier-map` | Kept the coordinate, tensor and lift-independence calculations inside this target-level proof. Theorem 3.2 and Remark 3.3 support the plan; the coherent Cartier signature stays omitted. |
| `characteristic-zero-completion-boundary` | Replaced source prose by the Laurent-monomial calculation showing dt/t is not exact. Uncompleted rational collapse and Hodge-completed smooth comparison remain separate claims. |
| `derived-completion` | Renamed the typed completeness statement to completionComplete and added its API. The real completedColimit still requires a diagram and universal property and is now explicitly omitted. |
| `complete-flatness` | Aligned the three actual examples with their packet names and strengthened the Z and Zp tests. Complete flatness does not require completeness; Fp has a derived-reduction obstruction over Z. |
| `completely-smooth-algebraization` | Replaced unsupported standard-cover patching by the global projective-conormal/complement construction of Stacks 07M8. Higher square-zero lifting/effectivity remain the recorded algebraization proof gap. |
| `de-rham-transitivity` | Corrected the conjugate relative power to be exterior over C before restriction to B and Frobenius base change. The Hodge transitivity formula already had the appropriate relative base. |
| `de-rham-sheaves` | Restricted the hypothesis to affine descent for finite Hodge quotients followed by Hodge completion. Raw uncompleted descent requires the separately stated bounds. |
| `cartier-extension-obstruction` | Corrected Example 3.16 to Remark 3.16. The lift obstruction and extension class retain the source's Frobenius and W2 hypotheses. |
| `free-prelog-resolutions` | Corrected Definition 2.4 to Notation 2.4. The two-sort free prelog resolution includes the structure map and distinguishes finite generators from infinite cotriple terms. |
| `homological-log-flatness` | Corrected the omitted-counterexample locator to KY Remark 2.46. Homological log flatness is the two-sort derived pushout condition, distinct from Kato log flatness. |
| `log-smooth-cartier-comparison` | Replaced the nonexistent Remark 7.7 citation by Corollary 7.6 and its proof. Integral log-smooth Cartier hypotheses remain part of the comparison. |
| `log-lci-crystalline-comparison` | Corrected Corollary 7.8 to Proposition 7.8. The log comparison retains repaired G-lci and Cartier-type ranges rather than asserting the printed arbitrary-quotient theorem. |
| `log-power-de-rham-descent` | Added KY Corollary 3.10, p.29, for p-completed uncompleted descent. Proposition 2.47 and its corollaries support power, finite Hodge and Hodge-completed descent. |

`completionComplete` now names exactly the retained statement that the reflector produces a complete object. The mathematical `completedColimit` contract is still present in the API and explicitly omitted from Lean: it requires a diagram, the ambient colimit and the complete-subcategory universal property. This prevents a completeness statement from masquerading as a colimit theorem.

The complete-flatness examples now have the packet's actual names. The Z example states both complete flatness and failure of completeness, with p prime. The Zp example includes faithful flatness of its actual reduction. The Fp negative example computes the obstruction over Z; the packet also explains the analogous Zp obstruction. These are three typed tests, not omissions. The retained base-change API remains omitted. The API count therefore rises from 190 to 191, while the test count stays 151.

Metadata corrections replace the stale recursive counts 784/82 by the independently recomputed 780/79, record the current name partition and exact validation method, and preserve historical reviews rather than overwriting them. The reader's stage and total counts, source-issue decisions and validation section are synchronized. The source sentence formerly reproduced in the Laurent example is replaced by our own monomial calculation; no source passage is retained.

## Resolution of the earlier rejection

| Earlier failure family | Revised contract checked |
| --- | --- |
| Crystalline arbitrary targets and overlapping positive/negative examples | A fixed CR.2 construction supplies the ordinary target. The typed smooth map has nilpotent-p and smoothness hypotheses; the negative uses the specific non-lci square-zero quotient. General lci and completed interfaces are omitted. |
| hlf universal assertion versus universal negation | The full hlf signature is omitted, with the actual two-sort homotopy-pushout criterion retained in the plan. The counterexample is scoped to KY Remark 2.46. |
| Corrected G-lci universal assertion versus negation | The plan requires an actual log-smooth factorization and finite regular strict kernel. The compatible filtered form is a recorded gap; arbitrary quotient predicates are absent from typed code. |
| Strict log crystalline positive/negative overlap | The typed claims are omitted. The plan exactifies first and retains the repaired regularity, endpoint flatness and Cartier conditions. Strictness alone is not invertibility. |
| QRSP Witt concentration without QRSP | The full signatures are omitted; concentration and the negative boundary retain their actual QRSP hypotheses in the plan. |
| Arbitrary resolution, tensor, graded and totalization models | Retained ordinary signatures use fixed named constructions. Arbitrary caller-selected models no longer serve as comparison targets. Coherent enhanced comparisons are individually omitted. |
| Arbitrary power weights and vacuous Nakayama reduction | General power signatures are omitted. The typed Nakayama uses the actual derived quotient and complete object, with a finitely generated ideal. |
| Missing lci/local/AQ/F-finite/p-basis hypotheses | The full predicates and comparisons are omitted; the target statements retain the source hypotheses and the non-routine proof gaps. |
| Bounded torsion and ordinary flatness without hypotheses | The typed amplitude theorem has BMS2's complete Tor-amplitude conditions. The flatness theorem has Bhatt's Noetherian, torsion-free and complete input conditions. Neither reinstates the false broad torsion assertion. |
| Cover/site/QRSP/perfectoid-source failures | QSyn objects and maps are distinguished. Only their ordinary predicate views are typed; full covering topologies and chosen perfectoid-root constructions are omitted. |
| Ordinary Künneth with unrelated B′ | The retained forms comparison uses the actual tensor algebra. The full complex/dg tensor comparison is omitted. |
| Formal/scheme tests on arbitrary inputs | Formal and global scheme signatures are omitted. The mathematical plan identifies base morphisms, finite Hodge descent, completion and explicit examples. |
| Proper-smooth control for every scheme | The formal morphism/perfectness/base-change signatures are omitted. The plan keeps proper smooth finite presentation, actual squares and the separate perfect-lifting gap. |
| Independent ring/monoid carriers and arbitrary prelog extensions | Full log signatures are omitted. The plan requires the prelog structure map, compatible chart square and the actual two-sort extension property. |
| Circular derivations, tautological Beilinson/Rees/universal APIs | Intrinsic mapping-space, filtered-heart and Rees signatures are omitted. The typed dg uniqueness view is expressly narrower than full initiality. |
| Vacuous quotient, algebraization, log point and period tests | The quotient view now uses N/gN. Algebraization, log point and period signatures are omitted; their mathematical tests retain the actual algebra/chart/root data. |

The preceding review permitted explicit narrowing of suggested coverage. I checked both sides of that narrowing: every intended name is either an actual declaration/labeled example outside comments or an explicit omission with a reason, and the boundary never treats a narrower ordinary view as the whole enhanced result. There are 474 names in this partition, with no duplicate or missing entry. `sorry` admits a proposed construction or proof; the revised signatures do not accept the desired comparison conclusion as an input hypothesis.

## Baseline and ownership audit

Every declaration below was read in its cited module at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The added classical completeness entry belongs to the revision under review, not this review. No baseline near miss was treated as a theorem it does not supply.

| Confirmed declaration | Exact-pin file | Scope supplied |
| --- | --- | --- |
| `mathlib:AlternatingMap.map_eq_zero_of_eq` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Alternating/Basic.lean) | Strict alternation, valid also in characteristic two. |
| `mathlib:AlternatingMap.map_swap` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Alternating/Basic.lean) | Exchanging two distinct slots negates an alternating map. |
| `mathlib:CochainComplex.of` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/HomologicalComplex.lean) | Constructs the nonnegative complex from an adjacent differential and its square-zero proof. |
| `mathlib:Derivation.leibniz` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Derivation/Basic.lean) | The universal derivation obeys the coefficient product rule. |
| `mathlib:Derivation.leibniz_pow` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Derivation/Basic.lean) | D(b^n)=n·b^(n−1)Db, used for Frobenius scalar linearity. |
| `mathlib:Derivation.map_algebraMap` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Derivation/Basic.lean) | An R-derivation vanishes on the image of R. |
| `mathlib:Derivation.map_one_eq_zero` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Derivation/Basic.lean) | The universal derivation kills 1. |
| `mathlib:ExteriorAlgebra.exteriorPower` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean) | The degree-n existing submodule of the exterior algebra; no new carrier of forms is required. |
| `mathlib:ExteriorAlgebra.gradedAlgebra` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorAlgebra/Grading.lean) | The existing graded algebra structure on exterior powers supplies wedge multiplication. |
| `mathlib:Finsupp.linearCombination` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Finsupp/LinearCombination.lean) | Linear map from the existing free module evaluating a prescribed generator family. |
| `mathlib:KaehlerDifferential.D` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Kaehler/Basic.lean) | The existing universal derivation B→Ω_(B/A), linear over A and a derivation over B. |
| `mathlib:KaehlerDifferential.kerTotal` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Kaehler/Basic.lean) | The existing Kähler relation submodule: additivity, Leibniz and base constants. |
| `mathlib:KaehlerDifferential.mvPolynomialBasis` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Kaehler/Polynomial.lean) | The existing basis of multivariate polynomial Kähler differentials, with basis vectors DX_i, detects dX∧dY≠0 in the two-variable test. |
| `mathlib:KaehlerDifferential.polynomialEquiv_D` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Kaehler/Polynomial.lean) | Under the existing polynomial differential-module equivalence, DP maps to the formal derivative of P. |
| `mathlib:KaehlerDifferential.quotKerTotalEquiv` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Kaehler/Basic.lean) | Identifies the presented module of Kähler symbols with the pinned Kähler differential module. |
| `mathlib:KaehlerDifferential.span_range_derivation` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Kaehler/Basic.lean) | Exact one-forms span the Kähler module over B, not generally over A. |
| `mathlib:Module.Presentation.restrictScalars` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Module/Presentation/RestrictScalars.lean) | Given a B-module presentation, an A-module presentation of B and lifting data, constructs the A-module presentation. |
| `mathlib:Polynomial.derivative_X` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/Derivative.lean) | The formal derivative of X is 1, detecting a wrongly zero de Rham differential. |
| `mathlib:Submodule.liftQ` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Quotient/Basic.lean) | Descends a semilinear map annihilating a submodule to its quotient. |
| `mathlib:exteriorPower.alternatingMapLinearEquiv` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Basic.lean) | Universal property of existing exterior powers. |
| `mathlib:exteriorPower.oneEquiv` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Basic.lean) | Identifies the existing first exterior power with the module. |
| `mathlib:exteriorPower.presentation` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Basic.lean) | The existing exterior-power presentation by multilinearity and strict alternation. |
| `mathlib:exteriorPower.zeroEquiv` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Basic.lean) | Identifies the existing zeroth exterior power with the coefficient ring. |
| `mathlib:exteriorPower.ιMulti` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Basic.lean) | The canonical alternating map to the existing exterior power. |
| `mathlib:exteriorPower.ιMulti_span_of_span` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/ExteriorPower/Basic.lean) | Wedges from a spanning family span each existing exterior power. |
| `tauceti:KaehlerDifferential.mapSemilinear` | [source](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Kaehler/MapSemilinear.lean) | The already implemented f-semilinear map along an arbitrary A-algebra homomorphism f:B→C. |
| `tauceti:KaehlerDifferential.mapSemilinear_D` | [source](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Kaehler/MapSemilinear.lean) | The pinned semilinear map sends Db to D(fb). |
| `mathlib:Algebra.Extension.cotangentComplex` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Extension/Cotangent/Basic.lean) | The existing conormal-to-Kähler map of a presentation; only the naive two-term object. |
| `mathlib:Algebra.Extension.toKaehler` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Extension/Cotangent/Basic.lean) | Projection from the presentation cotangent space to the existing Kähler module. |
| `mathlib:Algebra.Extension.exact_cotangentComplex_toKaehler` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Extension/Cotangent/Basic.lean) | Exactness of the conormal, presentation cotangent-space and Kähler sequence. |
| `mathlib:Algebra.H1Cotangent` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Extension/Cotangent/Basic.lean) | The presentation-independent kernel of the naive conormal differential; cohomological H^−1 here. |
| `mathlib:Algebra.Generators.equivH1Cotangent` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Extension/Cotangent/Basic.lean) | The equivalence between presentation H1 and the existing presentation-independent H1Cotangent. |
| `mathlib:derivationToSquareZeroEquivLift` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Derivation/ToSquareZero.lean) | Ordinary derivations correspond to lifts to a fixed square-zero extension under its scalar-tower hypotheses; not an enhanced mapping space. |
| `mathlib:DividedPowers` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DividedPowers/Basic.lean) | A divided-power structure on an ordinary ideal, with integral relations and no factorial division. |
| `mathlib:DividedPowerAlgebra` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/DividedPowerAlgebra/Init.lean) | The ordinary divided-power algebra carrier on a module, defined by a polynomial ring congruence; not a PD envelope or derived functor. |
| `mathlib:WittVector` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/WittVector/Defs.lean) | The existing p-typical Witt-vector carrier; its ring maps are imported, not redefined. |
| `mathlib:DerivedCategory` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean) | The ordinary derived category obtained by localization of integer-indexed cochain complexes at quasi-isomorphisms. |
| `mathlib:DerivedCategory.Q` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean) | The localization functor from existing cochain complexes to the ordinary derived category. |
| `mathlib:DerivedCategory.singleFunctor` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/Basic.lean) | Places an existing module in a specified cohomological degree. |
| `mathlib:DerivedCategory.homologyFunctor` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/HomologySequence.lean) | Cohomology of an object of the ordinary derived category in each integer degree. |
| `mathlib:DerivedCategory.isIso_iff` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Homology/DerivedCategory/HomologySequence.lean) | A derived-category map is an isomorphism exactly when all induced cohomology maps are isomorphisms. |
| `mathlib:RingTheory.Sequence.IsWeaklyRegular` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Regular/RegularSequence.lean) | Injectivity modulo each preceding initial subsequence; existing regular-sequence test used in the corrected quotient signature. |
| `mathlib:RingTheory.Sequence.IsRegular` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Regular/RegularSequence.lean) | Weak regularity together with nonzero final quotient; no full lci predicate or log factorization is provided. |
| `mathlib:PadicInt` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicIntegers.lean) | The existing ring of p-adic integers, the norm-at-most-one subtype of p-adic numbers under a prime fact. |
| `mathlib:LaurentPolynomial` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/Laurent.lean) | The existing Laurent polynomial ring, an additive monoid algebra on the integer exponent group. |
| `mathlib:IsAdicComplete` | [source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Basic.lean) | Ordinary adic completeness: Hausdorffness plus convergence of every adic Cauchy sequence. Reused for QSyn objects, not derived completeness. |

The reviewed library audit has no DD-specific entry. I read its adjacent EDS entries and accepted ownership constraints, and independently checked the pinned statements. Ordinary derived categories, naive cotangent homology, ordinary divided powers/algebra, Witt vectors, Kähler/exterior modules and classical adic completeness are reused. None is claimed to supply the corresponding missing enhancement, full cotangent, derived power, PD envelope, de Rham–Witt or derived reflector. The implemented Tau Ceti semilinear Kähler map is imported.

I read the relevant upstream DGA/infinity and adic-space roadmaps for their construction, coherence and acceptance density. Their existing work is not replanned. Accepted RS-01 ownership is retained; its pending follow-up is not treated as a new accepted authority. EDS supplies enhancement, animation, tensor and inverse-limit foundations; DD owns the generic cotangent/completion/derived de Rham branch; CR owns ordinary PD/site/classical Witt and early log data; Q0 owns integral perfectoid algebra; the existing moduli owner supplies proper coherent cohomology.

The recursive audit follows node `prerequisites` arrays, with integrated nodes taking precedence over blueprint duplicates and this packet's revised nodes taking precedence for DD. Integrated records without such arrays terminate the audit. It found no unresolved fine references or fine-node cycles. This is a reference audit, not a claim of global stage acyclicity or supplier proof completion. I read the ten distinct directly used foreign fine-node statements and the twelve request entries against their actual supplier-stage statements. Repeated uses account for 60 blueprint and eight integrated prerequisite occurrences. Requests remain precise open contracts rather than falsely certified exports.

The early CR.4 classical Nygaard input, early CR.5 log algebra and integral AI.0/Q0 inputs are explicitly separated from their later comparison applications. The same discipline keeps SF.4 formal charts separate from its later algebraization/alteration targets. Broad stage names in those requests are not permissions to import the later application back into its foundation.

## Public sources and source-issue decisions

All 24 public artifacts were independently fetched on 8 October 2026 and matched their recorded SHA-256 values. Riou's artifact is the exact PR-head Lean file, not mutable PR HTML. Every node's locator, statement hypotheses and proof route were checked in the identified artifact; label/range fixes are in the correction table above. The source records retain their version/page information and older reading provenance. No original-book proof or entire paper is certified merely by matching its artifact hash.

| Artifact | Independently matched SHA-256 prefix |
| --- | --- |
| [bhatt-ddr-2012](https://arxiv.org/pdf/1204.6560v1) | `e5ca4056c89eaed4` |
| [stacks-0FKF](https://stacks.math.columbia.edu/tag/0FKF) | `ef684a3a0712e79a` |
| [stacks-0H1C](https://stacks.math.columbia.edu/tag/0H1C) | `e37f1c2423ffc34d` |
| [riou-pr18551](https://raw.githubusercontent.com/leanprover-community/mathlib4/5888c0081ba867ede5c60d3060f2d674d932b53c/Mathlib/RingTheory/DeRham/Basic.lean) | `1703f5b1fce363cd` |
| [illusie-I-errata](https://www.imo.universite-paris-saclay.fr/~illusie/ErrSLN239.pdf) | `3e34e616dfe86dd4` |
| [illusie-II-errata](https://www.imo.universite-paris-saclay.fr/~illusie/Errsln283.pdf) | `a94a04f38564b959` |
| [bo-2013-erratum](https://math.berkeley.edu/~ogus/preprints/BO_B2_Erratumre.pdf) | `7a31ee9881433d3d` |
| [bms2](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf) | `6b43d1ff3c3f345d` |
| [bhatt-lurie](https://arxiv.org/pdf/2201.06120) | `0b1beeb20c29424e` |
| [cotangent-stacks](https://stacks.math.columbia.edu/download/cotangent.pdf) | `11ac3f3090cbd582` |
| [derived-completion-stacks](https://stacks.math.columbia.edu/download/more-algebra.pdf) | `ab69179738e64260` |
| [prisms](https://arxiv.org/pdf/1905.08229) | `1d91a6eb85828feb` |
| [bhatt-mathew](https://arxiv.org/pdf/2202.04818) | `12eb19e417531add` |
| [cmm](https://arxiv.org/pdf/1803.10897) | `ad23c1d7b818b85e` |
| [dundas-morrow](https://arxiv.org/pdf/1403.0534) | `ed6452261dc16104` |
| [avramov99](https://arxiv.org/pdf/math/9909192) | `ee592066efadac9f` |
| [iyengar07](https://math.mit.edu/~hrm/palestine/iyengar-andre-quillen.pdf) | `bfa22b25f7c410ae` |
| [bhatt18](https://arxiv.org/pdf/1608.08882) | `08578ca15b17f51e` |
| [bhatt-etal23](https://arxiv.org/pdf/2012.15801) | `533218825ca5045a` |
| [log-ky](https://arxiv.org/pdf/2306.00364) | `7c55cba22922d945` |
| [gp18](https://arxiv.org/pdf/1602.01515v3) | `08c5505ecd225ba5` |
| [bhatt-lectures](https://www.math.ias.edu/~bhatt/teaching/mat549f22/lectures.pdf) | `a9f526ced2fc5e08` |
| [stacks-proper-cohomology](https://stacks.math.columbia.edu/tag/0A1G) | `6eee0ab30c75b54d` |
| [stacks-smooth-lift](https://stacks.math.columbia.edu/tag/07M8) | `7bdbc571ea369bca` |

The public Illusie Volume I/II author errata and the Berthelot–Ogus 2013 appendix corrigendum were read and remain binding. In particular, ordinary scalar extension is not silently used in a derived formula, deleted general dg/crystalline assertions are not reused, and an isomorphism of derived towers is not presented as a degreewise surjective replacement without its hypotheses. The complete original books were not used as newly read proof evidence.

All 13 source issues are independently confirmed. No source issue is added or rejected in this review. Their existing version and novelty limitations remain: confirmation concerns the specified readable text, not an inaccessible publication or a claim that no later erratum exists. New `review.by` values name this revision review, and the older review is preserved for each entry.

| Issue | Checked locator | Independent reason |
| --- | --- | --- |
| E1 | Proposition 2.3, printed/PDF p.5 in arXiv:1204.6560v1; checked on the rendered page | Bhatt Proposition 2.3, p.5, resolves the target algebra B in its proof and Definition 2.1. The printed augmentation to A cannot construct the relative object; replacing it by B is forced. |
| E2 | Notation 3.1, printed/PDF p.6 in arXiv:1204.6560v1; checked on the rendered page | Bhatt Notation 3.1, p.6, displays B tensor_A,Frob A and a relative Frobenius to B. This is the twist of B over A; the prose label A is inconsistent with that displayed construction. |
| E3 | Proof of Proposition 3.5, printed/PDF p.7 in arXiv:1204.6560v1; checked on the rendered page | In Bhatt Proposition 3.5 proof, p.7, Cartier initially compares degree-zero modules. A shift on only one side changes the degree of a nonzero polynomial form. The following realized formula correctly shifts both interpretations by −i. |
| E4 | Definition 7.20 and Theorem 7.22, arXiv v1 printed p.31/PDF p.31; also author copy printed p.30 | Bhatt Definition 7.20, p.31, permits an arbitrary strict quotient. With trivial logs the non-lci quotient Fp[x,y]/(x,y)^2 qualifies, while Example 3.21 gives unbounded negative de Rham and classical crystalline cohomology is coconnective. A finite regular strict kernel repairs the finite proof range; compatible filtered factorizations remain open. |
| E5 | Definition 5.1, published p.233; arXiv v2 printed p.28 | BMS2 Definition 5.1, p.233, indexes a decreasing Zop diagram, so the available arrow is F(i+1) to F(i). Its cofiber gives the stated graded object. The printed preceding-index quotient has the wrong arrow direction. |
| E6 | Proposition 5.6, published p.237 and proof p.238; arXiv v2 pp.31–32; companion display in Theorem 5.4 proof p.236 | BMS2 Proposition 5.6 and proof, pp.237–238, compute derived Hom shifted by c. Its degree i is Ext^(i+c), not Ext^(i−c). The two-term identity complex over a field gives the nonzero i=1,c=−1 extension and rules out the printed index. |
| E7 | Proposition 8.13(3), published p.274; arXiv v2 p.60 | For S=Fp, the full Nygaard level at i=0 maps Zp to Fp and has kernel pZp. Thus BMS2 Proposition 8.13(3), p.274, cannot assert whole-level injectivity. Equation (4) and Theorem 8.14(2) instead identify the graded quotient. |
| E8 | Claim 3.30 proof, arXiv v1 printed p.14; author copy p.13 | The rendered Claim 3.30 proof, p.14, drops the coefficient (p−1)! in its final equality. Wilson gives −1 at odd primes. The correction changes a unit/sign normalization; exact signed generator identification still needs the totalization convention. |
| E9 | Construction 2.6 and formula (2.1), arXiv:2306.00364v1 printed p.13 | KY Construction 2.6, p.13, defines its power notation as unshifted exterior powers. A free log one-form is in degree zero, whereas its de Rham weight is in degree one. Both graded displays therefore need the [−i] shift. |
| E10 | Theorem 2.11, arXiv:2306.00364v1 printed pp.14–15, second parenthesized base-change formula | KY Theorem 2.11, pp.14–15, uses an S1-module tensor for the whole de Rham complex. On a free ordinary coordinate d(t)=dt while t d(1)=0, so that differential is only base-linear. Bhatt Proposition 6.12 supplies the valid base-ring tensor expression. |
| E11 | Lemma 2.14 proof, arXiv:2306.00364v1 printed p.16 | KY Lemma 2.14 proof, p.16, reverses the scheme names. R to S induces Spec S to Spec R; the subsequent relative cotangent must use that direction. Swapping X and Y repairs the proof notation. |
| E12 | Proposition 6.12, arXiv:1204.6560v1 printed/PDF p.26, second factor of the homotopy coproduct | Bhatt Proposition 6.12, p.26, starts with two prelog targets (Ni to Bi). The second coproduct factor must use N2 to B2; N1 paired with B2 has no specified compatible prelog structure. |
| E13 | Remark 6.6, arXiv:1204.6560v1 printed/PDF p.25, sentence describing the B-module structure on Sect | Bhatt Remark 6.6, p.25, defines sections of the projection to the prelog ring N to B. The explanatory target N to P is inconsistent: P is only the coefficient B-module. The correction restores the target of equation (6). |

## Handed red-team findings and remaining gaps

RT-AREA-padic-2/7 is correctly reflected in DD.6. Bhatt Definition 7.20's arbitrary strict effective epimorphism would include the trivial-log non-lci square-zero quotient. The revised finite contract requires a finite regular strict kernel after a log-smooth Cartier-type factor, with flat Z/p^n endpoints. The filtered regular-factorization passage and all Example 7.21 compatibility checks remain precise proof obligations. Theorem 8.4 is used only through the repaired comparison range; the printed unrestricted claim is not restored.

RT-AREA-padic-2/35 is correctly reflected in DD.5. The QRSP predicate and elementary simultaneous-root construction use the early integral Q0 carrier, not Q0's later animated application or Q3. The source's root-cover argument, refinement and unfolding are planned separately and retain the chosen perfectoid source.

RT-AREA-padic-2/36 is correctly reflected in DD.4. CR.0 supplies the ordinary PD envelope, explicit regular-envelope discreteness/flatness/reduction of Bhatt Lemmas 3.37–3.38. DD.4 owns Corollary 3.40, Theorem 3.27 and the derived-to-classical comparison. CR.2 supplies the PD Poincaré model; no derived PD/crystalline comparison is duplicated in its request.

The plan does not hide the remaining non-routine inputs. Its thirteen named gaps cover Cohen factorization and cotangent lci converses; integral derived powers and décalage; the F-finiteness converse; Noetherian and weak-proregular completion; resolution independence and complete rational comparison interiors; PD root-quotient p-torsion-freeness; regular perfection and smooth approximation; perfect lifting over a p-complete base; Gabber–Olsson and exactification proof interiors; filtered corrected G-lci applications; two-sort log-quasisyntomic completion and root descent; enhanced signatures beyond the narrowed ordinary views; and flat square-zero lifting. Their affected stages' `remaining` lists keep them visible. None was closed on the strength of an ordinary carrier, a broad source citation or this review's acceptance.

## Validation and orchestrator notes

- `python3 scripts/check_blueprint.py research/blueprint/packets/DerivedDeRhamCohomology.json`: zero errors and warnings, with 132 nodes, 191 APIs, 151 tests, 39 planets and seven planned stages.
- Independent inventory checks: exact declaration/API/test partition; 50 actual labeled examples outside nested block comments; reader API/test names and coverage boundaries synchronized; every target row stays inside its owner stage; per-node and source-issue review ledgers complete.
- Independent graph traversal: the counts and leaf convention above, with no unresolved fine reference or cycle.
- Public artifact checks: all 24 recorded hashes matched. Pinned baseline statements were read independently.
- Direct `lean-check research/blueprint/suggested/DerivedDeRhamCohomology.lean` fails before the declarations because the shared build lacks `TauCeti.RingTheory.Kaehler.MapSemilinear.olean`.
- Diagnostic elaboration: temporarily replace only that import in this same suggested file by the exact pinned declarations, removing source prose; run `lean-check`; restore the delivered file in a finally block. The diagnostic exited zero with 133 `sorry` warnings, no errors or other warnings. No extra Lean file, library build, language server, dependency update or cache retrieval was used.

The diagnostic checks the proposed ordinary signature types against the pinned library. It does not make the delivered import elaborate directly, prove any admitted theorem, validate any omitted name, or establish coherence of the enhanced suppliers. This distinction is reflected in the packet, reader and suggested-file header.

For the orchestrator: accept this as a completed independent review, retaining the seven planned stages and their open obligations. A normal shared-build provisioning step must provide the pinned semilinear import before direct elaboration can be repeated. Supplier/gap follow-ups remain the recorded work, especially the compatible filtered log factorization and general integral powers. No owner move, promotion, issue closure or additional job is requested from this worker.
