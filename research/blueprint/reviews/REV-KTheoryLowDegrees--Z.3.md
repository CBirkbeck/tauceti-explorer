# Independent review: Explicit K₀, Z.3–Z.6

**Verdict: needs_changes.** The packet and suggested Lean contracts have been corrected. One unresolved contradiction remains in the reader Markdown, which is outside the three deliverables of issue #442. This verdict does not reject the packet for honestly recorded supplier gaps, its complete-pass status, or unavailable Lean compilation.

Reviewer: Codex, session `codex-rtOQ9t`, `REV-KTheoryLowDegrees--Z.3`; date 2026-10-05. Issue: [#442](https://github.com/CBirkbeck/tauceti-explorer/issues/442). Winning claim: [5985667547](https://github.com/CBirkbeck/tauceti-explorer/issues/442#issuecomment-5985667547), confirmed by [5985668669](https://github.com/CBirkbeck/tauceti-explorer/issues/442#issuecomment-5985668669). The whole issue was reread after confirmation. The reviewed BP #765 was authored by another session, `codex-J6LwjP`; none of its preceding authors is this session.

Immutable input revision: `550acd5d97804b879f9f9472201894ab402e01c8`. The original packet SHA-256 was `179626de0c9a27265ae8e2e1173d40505227cc3c4ff27d51052e11acafbbd71b`; the original suggested-file SHA-256 was `a502dbcb326b231a2ce4978661342c10cbcad0e6e0879976ee3d6661786cd196`. Binding instructions read: WORKERS, blueprint and expansion PROTOCOL, and UPSTREAM_GUIDE.

## Contradiction to resolve before acceptance

The reader `research/blueprint/readmes/KTheoryLowDegrees--Z.3.md` at lines 883, 1657, 1811 and 10391 describes determinant as the top λ coefficient on a constant-rank class, including the explicit virtual-class assertion at line 1811. Let R have a nontrivial invertible module L and put x=[L]−[R]. Then rank(x)=0, det(x)=Pic.mk(L)≠1, but λ⁰(x)=1. The correct statement concerns an actual finite projective P of constant rank r: det([P])=Pic.mk(ΛʳP), while λʳ[P] is the K₀ class [ΛʳP]. A Picard class and its K₀ class must also not be identified by a type-incorrect equality.

The packet node, uses, tests and restructuring summary now have this correction; the native API has the actual-projective formula and a virtual rank-zero counterexample. The reader must be regenerated to carry this correction and the other review edits. `scripts/promote.py`, `destinations`, copies the reader verbatim; it does not regenerate it from the reviewed packet. An accepted review would therefore publish the contradiction. The reader has been read but left unmodified under the issue’s output restriction.

## Counts, coverage and closure

The input had 240 nodes and 372 baseline declarations. The reviewed packet has **260 nodes, 375 baseline declarations, 450 API items and 280 tests on definitions/constructions, 18 planets, 3 explicit gaps, 16 supplier requests and 28 source issues**. Counting API/test lists on every node gives 455/283. Its kinds are 41 theorems, 119 lemmas, 53 constructions, 19 definitions, 12 applications and 16 comparisons. Review verdict counts: {'verified': 192, 'corrected': 48, 'added': 20}. All 20 new nodes carry `addedBy: REV-KTheoryLowDegrees--Z.3`.

All four stage target lists were compared with the source and atlas stage texts. Z.3, Z.5 and Z.6 are planned; Z.4 is source_decomposed (the checker includes that in its four planned-stage count). No stage is marked closed. The complete status means a complete inventory pass, not proof completion. Each target has its realizers. In particular, the ring/λ/determinant/γ/Adams interfaces are in Z.3, Dedekind classification and maps in Z.4, the general regular-curve theorem and dictionaries in Z.5, and map-level K/G/perfect-complex comparisons and examples in Z.6. The elliptic origin-dependent decomposition is imported from EllipticKTheory E.2.

Every proof sketch and direct prerequisite was examined. The packet-internal dependency graph has no cycle. Supplier statements were read rather than inferred from titles. The three retained gaps distinguish general Picard duality/pullback, integral/arbitrary-field Serre inputs, and coherent determinant/perfect v-descent; their affected nodes and requested interfaces are explicit. No field extension is silently treated as localization, relative ideal K-theory is not substituted for support K-theory, and a complex representation theorem is not substituted for arbitrary-field descent. The actual index-assisted CLI checker reports 0 errors and 0 warnings.

## Correction ledger

These are all substantive correction records, including native parity and errata metadata changes. The per-node `review.checked` list supplies the final 260-node ledger; correcting a cited baseline also marks its consumers corrected.

| # | Node or scope | Correction |
| --- | --- | --- |
| 1 | KTheoryLowDegrees:Z.3/projective-exterior-power | List the existing exteriorPower.instFinite used by the finite-generation conclusion as a direct prerequisite. |
| 2 | KTheoryLowDegrees:Z.3/total-lambda | Give the finite-free-retract argument and its actual baseline dependency for the uniform exterior-power bound. |
| 3 | KTheoryLowDegrees:Z.3/exterior-base-change | Split the scalar-extension comparison and stalk-rank theorem, corresponding to the two existing suggested Lean declarations. Added: KTheoryLowDegrees:Z.3/exterior-rank. |
| 4 | KTheoryLowDegrees:Z.3/lambda-free | Split positive and negative free-class coefficient theorems, retaining their native declaration names and treating m=0 explicitly. Added: KTheoryLowDegrees:Z.3/lambda-negative-free. |
| 5 | KTheoryLowDegrees:Z.3/determinant-hom | Restrict the top-exterior determinant formula to actual projective modules, distinguish Picard classes from K0 classes, and add a virtual rank-zero non-example and universal-property API. Clarify the two matching use descriptions. |
| 6 | KTheoryLowDegrees:Z.3/determinant-surjective | Replace the misplaced Pic.mk_self prerequisite by Pic.mk_eq_self. Retain mk_self as the genuine unit normalisation used by determinant-free. |
| 7 | mathlib:Module.rankAtStalk_tensorProduct | Restore the finite/flat section hypotheses on M to the provides description; the projective citing nodes meet them. |
| 8 | mathlib:Module.FinitePresentation.exists_free_localizedModule_powers | Record the actual nontriviality hypothesis on the localisation; prime-local citing applications meet it. |
| 9 | KTheoryLowDegrees:Z.3/projective-sheaf-condition | Replace the false claim that individual localisation maps are injective by joint injectivity over the unit-ideal cover; k×k supplies the counterexample. |
| 10 | KTheoryLowDegrees:Z.3/pic-locally-constant-power | Specify a nontrivial diagonal Picard class in the nonconstant-exponent non-example; the original assertion failed for arbitrary L₁,L₂, including trivial classes. |
| 11 | KTheoryLowDegrees:Z.3/rank-det-ring | Add the nontriviality hypothesis needed by the square-zero-extension non-example. |
| 12 | KTheoryLowDegrees:Z.3/determinant-exterior-power | Use the newly separated stalk-rank theorem as a direct prerequisite of the exterior determinant calculation. |
| 13 | KTheoryLowDegrees:Z.3/pic-locally-constant-power | Require IsIdempotentElem e, and supply the actual idempotent proof from the clopen equivalence at the caller. The former unconditional instance asserted a false rank-one claim for e=2 over Z. |
| 14 | KTheoryLowDegrees:Z.3/sk-zero | Restrict the SK0/ker det non-example to nontrivial rings, agreeing with its existing Lean example. |
| 15 | KTheoryLowDegrees:Z.4/rank-pic-ring-equiv | Supply the nontrivial Picard-class hypothesis for the failure of multiplicativity; remove the blanket assertion about every possible Picard ring structure. |
| 16 | KTheoryLowDegrees:Z.4/pic-norm | Require a nonzero generator in the principal-ideal norm test, so that its Picard class is defined. |
| 17 | KTheoryLowDegrees:Z.4/top-exterior-inclusion-injective | Distinguish the equal-rank top-line comparison from exterior-power injectivity over a domain. |
| 18 | KTheoryLowDegrees:Z.5/sheaf-exterior-power | Replace an erroneous exclusive affine comparison claim by a concrete non-separated exterior presheaf on P¹ and the correct quasi-coherent affine comparison. |
| 19 | KTheoryLowDegrees:Z.5/regular-curve-finite-resolution | Exclude n=0 from the displayed length-one resolution of ℤ/n. |
| 20 | KTheoryLowDegrees:Z.5/point-class-map | Declare the existing injectivity theorem used by the pointClass_injective API as a direct prerequisite. |
| 21 | KTheoryLowDegrees:Z.5/curve-k-zero-ring | Exclude trivial point classes from the square-zero non-idempotence example. |
| 22 | KTheoryLowDegrees:Z.6/perfect-complex-euler-class | Use module-perfect K-theory for a general ring; restrict Spec A notation to commutative rings. Separate the Euler identity from the nonzero-n resolution claim. |
| 23 | KTheoryLowDegrees:Z.6/field-test | Use arbitrary scalar-extension naturality for a field extension; a field extension need not be a localisation. |
| 24 | KTheoryLowDegrees:Z.6/nonprincipal-ideal-test | Remove the false claim that the ideal quotient sequence splits at every prime; use local freeness for the K₀ conclusion and generic vanishing for support. |
| 25 | KTheoryLowDegrees:Z.3/integral-comodule-torsion-devissage | State the two-layer devissage test without asserting a nonzero class difference for every coalgebra. |
| 26 | KTheoryLowDegrees:Z.3/graded-line-tensor | Give the test a distinct declaration name: TauCeti.GradedDeterminant.graded_line_tensor_unit → TauCeti.GradedDeterminant.graded_line_tensor_unit_test; the API keeps its original name. |
| 27 | KTheoryLowDegrees:Z.3/projective-graded-det | Give the test a distinct declaration name: TauCeti.GradedDeterminant.projective_graded_det_zero → TauCeti.GradedDeterminant.projective_graded_det_zero_test; the API keeps its original name. |
| 28 | KTheoryLowDegrees:Z.6/scheme-spectrum-det | Give the test a distinct declaration name: TauCeti.GradedDeterminant.scheme_spectrum_det_shift → TauCeti.GradedDeterminant.scheme_spectrum_det_shift_test; the API keeps its original name. |
| 29 | KTheoryLowDegrees:Z.6/witt-supported-input | Give the test a distinct declaration name: TauCeti.GradedDeterminant.witt_supported_input_zero → TauCeti.GradedDeterminant.witt_supported_input_zero_test; the API keeps its original name. |
| 30 | KTheoryLowDegrees:Z.6/witt-supported-det | Give the test a distinct declaration name: TauCeti.GradedDeterminant.witt_supported_det_zero → TauCeti.GradedDeterminant.witt_supported_det_zero_test; the API keeps its original name. |
| 31 | Z.4 Picard/class-group coordinates | Correct the informal coercion name to Additive.ofMul, agreeing with the existing typed Lean expressions; keep actual API declaration names and Multiplicative.ofAdd. |
| 32 | mathlib:IsDedekindDomain.isPrincipalIdealRing_localization_over_prime | Restore the explicit hypotheses read from the pinned native declaration and its section context. |
| 33 | mathlib:IsLocalization.isDedekindDomain | Restore the explicit hypotheses read from the pinned native declaration and its section context. |
| 34 | mathlib:IsIntegralClosure.isLocalization | Restore the explicit hypotheses read from the pinned native declaration and its section context. |
| 35 | tauceti:NumberField.adjoin_gen_eq_top_of_mod_four_ne_one | Restore the explicit hypotheses read from the pinned native declaration and its section context. |
| 36 | KTheoryLowDegrees:Z.5/sheaf-exterior-power | Correct I.5.3 locator to the actual operations/determinant text on physical PDF p.58. |
| 37 | KTheoryLowDegrees:Z.5/exterior-power-vector-bundle | Correct I.5.3 locator to the actual operations/determinant text on physical PDF p.58. |
| 38 | KTheoryLowDegrees:Z.5/determinant-bundle | Correct I.5.3 locator to the actual operations/determinant text on physical PDF p.58. |
| 39 | KTheoryLowDegrees:Z.5/generic-rank-kernel | Correct Exercise II.6.9(b) locator to physical PDF p.134. |
| 40 | KTheoryLowDegrees:Z.5/picard-affine-comparison | Correct I.5.3 locator to the actual operations/determinant text on physical PDF p.58. |
| 41 | KTheoryLowDegrees:Z.6/pointless-conic-test | Correct Exercise I.5.12(b) locator to physical PDF p.70. |
| 42 | tauceti:TauCeti.ExactStructure.eulerClassOf_eq | Restore the explicit E-projectivity hypothesis; the general resolving/comodule argument is not provided by this theorem. |
| 43 | KTheoryLowDegrees:Z.6/ring-k-zero-pi-zero | Replace a nonexistent K.7 decomposition node by its actual owner stage and a precise product-normalisation request. |
| 44 | KTheoryLowDegrees:Z.6/perfect-complex-euler-class | Replace a nonexistent K.5 decomposition-node reference with the actual S.3 support/localisation interfaces. Relative ideal K is not substituted for support K. |
| 45 | KTheoryLowDegrees:Z.6/localisation-projective-class | Replace a nonexistent K.5 decomposition-node reference with the actual S.3 support/localisation interfaces. Relative ideal K is not substituted for support K. |
| 46 | KTheoryLowDegrees:Z.4/projective-classification | Separate the classification, class injectivity and cancellation declarations. Added: KTheoryLowDegrees:Z.4/projective-class-injective, KTheoryLowDegrees:Z.4/projective-cancellation. |
| 47 | KTheoryLowDegrees:Z.4/invertible-injection-class | Expose the index ideal definition with API and three tests; separate evaluation, Pic class, congruence, free-basis and localisation lemmas. Added: KTheoryLowDegrees:Z.4/index-ideal, KTheoryLowDegrees:Z.4/index-ideal-evaluation, KTheoryLowDegrees:Z.4/index-ideal-congr, KTheoryLowDegrees:Z.4/index-ideal-free, KTheoryLowDegrees:Z.4/index-ideal-localisation. |
| 48 | KTheoryLowDegrees:Z.5/regular-curve-resolution-property | Separate affine diagonal, resolution property and the separated ample-line-bundle statement. Added: KTheoryLowDegrees:Z.5/curve-affine-diagonal, KTheoryLowDegrees:Z.5/curve-ample-line-bundle. |
| 49 | KTheoryLowDegrees:Z.5/skyscraper-class | Separate the point ideal, skyscraper exact sequence, inverse divisor line and K₀ coordinates. Added: KTheoryLowDegrees:Z.5/point-ideal-sheaf, KTheoryLowDegrees:Z.5/point-skyscraper-exact-sequence, KTheoryLowDegrees:Z.5/point-divisor-line-inverse. |
| 50 | restructure/interface | Remove the ambiguous virtual-class determinant formula from the packet supplier summary as well as the node API. |
| 51 | KTheoryLowDegrees:Z.4/index-ideal | Add three actual pinned primitive dependencies for the newly exposed index-ideal definition: Module.Dual, TensorProduct.lift and LinearMap.range. |
| 52 | KTheoryLowDegrees:Z.3/pre-lambda-ring | Separate the four other carriers (homomorphisms, λ-ideals, quotient and line elements) with direct consumer dependencies, APIs and three tests each. Added: KTheoryLowDegrees:Z.3/pre-lambda-hom, KTheoryLowDegrees:Z.3/lambda-ideal, KTheoryLowDegrees:Z.3/pre-lambda-quotient, KTheoryLowDegrees:Z.3/lambda-line-element. |
| 53 | KTheoryLowDegrees:Z.3/lambda-universal-polynomials | Separate product, composition and Newton polynomials, redistribute their APIs/tests and add the missing composition and Newton checks. Added: KTheoryLowDegrees:Z.3/lambda-composition-polynomial, KTheoryLowDegrees:Z.3/lambda-newton-polynomial. |
| 54 | sourceIssues/E1–E28 | Supply individual confirmed verdicts for all 28 entries after reading their locators; qualify E19/E21 as proof gaps, not false results, and strengthen the E24 counterexample to positive rank. |
| 55 | KTheoryLowDegrees:Z.3/lambda-line-element | Distinguish the native weak degree-one-series predicate (which includes zero) from Weibel’s positive invertible line elements; cite the actual p.26 paragraph. |
| 56 | suggested-file-parity | Update the independent-review compile/reader status, attach full node tags to existing native signatures, and correct the index-ideal documentation after the split. |

## Pinned-library audit

All 375 cited declarations were read with their surrounding variable/section hypotheses at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All citing statements/proof steps were then checked against those hypotheses. The 195 distinct modules needed by the baseline plus suggested imports were byte-compared with their pinned Git blobs: all matched. All 75 suggested-file imports resolve to actual source files at the appropriate pin. A declaration-index hit was never used as a substitute for reading a statement.

No baseline declaration was fabricated or promoted from a nearby statement. The seven substantive hypothesis repairs are recorded above: tensor-product stalk rank; finite-presentation localized free neighborhoods; prime-local principal/Dedekind/localization and integral-closure assumptions; the quadratic-field generator criterion; and E-projectivity in `TauCeti.ExactStructure.eulerClassOf_eq`. The determinant-surjectivity dependency is `Pic.mk_eq_self`, while the genuine free-unit calculation retains `Pic.mk_self`. The three added primitives are `Module.Dual`, `TensorProduct.lift`, and `LinearMap.range` for the newly exposed index ideal; their actual linear/semilinear statements were read. The general resolving-comodule Euler argument remains separate from the projective comparison theorem.

The reviewed `data/library-coverage.json` entries and campaign targets for Z.3–Z.6 were read. Existing Pic/ClassGroup equivalences, module Euler classes, exact/split K₀, exterior powers, norms, and S-integer class-group interfaces are reused. The projective tensor subcategory and group-completion ring operations package these facts; they do not re-plan their existing library definitions.

## Source reads and versions

The following are physical PDF page numbers, not printed chapter numbering. Every node locator/excerpt and hypothesis was checked in the cited passage; a theorem/proof split uses the actual proof dependencies, not a matching title. Historical predecessor acquisition/full-comparison claims are retained as historical records, not asserted as this reviewer’s reads. Published-edition references are not treated as collation with the AMS edition. Stacks chapter copies are the packet’s recorded public July 2026 snapshots.

| Source | Public URL | Pages read |
| --- | --- | --- |
| Kbook.I | https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.I.pdf | 10, 11, 15, 16, 17, 18, 19, 24, 25, 43, 52 |
| Kbook.II | https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.II.pdf | 5, 8, 11, 13, 14, 25, 26, 27, 28, 29, 30, 31, 32, 33, 35, 36, 83, 86 |
| Soule.1985 | https://www.cambridge.org/core/services/aop-cambridge-core/content/view/S0008414X00008427 | 1, 2, 3, 4, 5, 6 |
| Serre.1968 | https://www.numdam.org/item/PMIHES_1968__34__37_0.pdf | 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17 |
| Cohen | https://www.math.utoronto.ca/~ila/Cohen%20--%20Advanced%20topics%20in%20computational%20number%20theory.pdf | 19, 23, 24, 25, 26, 29, 30, 91, 94, 95 |
| Kbook.2013 | https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf | 29, 36, 37, 54, 55, 57, 58, 64, 65, 66, 68, 69, 70, 76, 77, 82, 86, 100, 101, 103, 105, 106, 107, 129, 133, 134, 138, 141, 153, 154, 155, 157, 161, 165, 170, 177, 178, 327, 336, 395 |
| Handbook | https://www.maths.ed.ac.uk/~v1ranick/papers/handktheory.pdf | 157, 158 |
| Milne.ANT.2020 | https://www.jmilne.org/math/CourseNotes/ANT.pdf | 12, 60, 73, 92 |
| Totaro.2004 | https://arxiv.org/pdf/math/0207210 | 1, 2 |
| BS17.v3 | https://arxiv.org/pdf/1507.06490v3 | 15, 17, 18, 19, 20, 24, 25, 54, 55, 56, 57, 58, 59 |
| modules | https://stacks.math.columbia.edu/download/modules.pdf | 19, 20, 29, 30, 31, 37, 38, 39, 40 |
| divisors | https://stacks.math.columbia.edu/download/divisors.pdf | 67, 70 |
| varieties | https://stacks.math.columbia.edu/download/varieties.pdf | 77, 81 |
| properties | https://stacks.math.columbia.edu/download/properties.pdf | 10, 11, 12 |
| chow | https://stacks.math.columbia.edu/download/chow.pdf | 39, 40, 41, 185 |
| perfect | https://stacks.math.columbia.edu/download/perfect.pdf | 93, 98, 99 |
| more-algebra | https://stacks.math.columbia.edu/download/more-algebra.pdf | 370, 371 |

The full mathematical passages at Stacks tags [0FIC](https://stacks.math.columbia.edu/tag/0FIC), [00AK](https://stacks.math.columbia.edu/tag/00AK), [00AM](https://stacks.math.columbia.edu/tag/00AM), [01CR](https://stacks.math.columbia.edu/tag/01CR), and current [0FDS](https://stacks.math.columbia.edu/tag/0FDS)/[0BXJ](https://stacks.math.columbia.edu/tag/0BXJ), including the relevant current comments, were read. Milne’s scanned radical symbols on PDF pp.12 and 73 were inspected as rendered images: √−5, rather than a text-extraction guess. All three pages of [Cohen’s DVI errata](https://www.math.u-bordeaux.fr/~hecohen/errataadv1.dvi) were decoded/read; formula glyph positions were not reconstructed, so no formula-based errata absence claim is made.

The currently served Soulé journal scan has SHA-256 `f2b559ea3150c7d72a3e662835212e90e1ad0fc2b2b56083cb63d8e670cf5bdd`. It has a timestamped Cambridge footer and differs from the historical recorded download; all six current pages were read, but a full comparison with historical bytes was not possible or claimed. Its current sourceVersion was added while the historical record was retained. The combined Weibel author draft, SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`, was reread at the listed passages and a scoped current receipt added. The live author-errata PDF was unavailable; cached opening entries support E4/E14. No fresh full-author-errata or published-book collation is claimed.

## Source issues: independent verdicts

All 28 entries have `review.verdict: confirmed`, individual reasons and `review.by: REV-KTheoryLowDegrees--Z.3`. E1–E22 were inherited and checked; E23–E28 were added. “Confirmed” for E19/E21 means an argument/citation gap, not a counterexample to the theorem. No author was contacted.

| Issue | Independent reason and scope |
| --- | --- |
| KTheoryLowDegrees/E1 | Confirmed in the 2012 chapter at p.25; a single inverted prime gives one integer exponent. The combined draft p.37 already has ℤ, so the correction is version-specific. |
| KTheoryLowDegrees/E2 | Confirmed at chapter II p.11 and combined p.82: the proof interchanges P and Q in the exterior summand. P=R,Q=0 contradicts its ensuing vanishing statement; the theorem is unaffected after restoring the factors. |
| KTheoryLowDegrees/E3 | Confirmed at II p.32 and combined p.105: at k=1 the printed sign would negate the identity on a graded piece; the final proof line gives (−1)^{k−1}. |
| KTheoryLowDegrees/E4 | Confirmed at II p.11: ℚ[C₃]=ℚ×ℚ(ζ₃) has two simple factors and K₀-rank two, versus three conjugacy classes. The cached author errata supports the additional splitting-field hypothesis; no fresh full errata PDF was acquired. |
| KTheoryLowDegrees/E5 | Confirmed at II p.29 and combined p.103: in dimension one, a nonprincipal invertible ideal gives a nonzero reduced class. A representative of rank strictly below one would vanish. Rank at most the dimension is the needed bound. |
| KTheoryLowDegrees/E6 | Confirmed in Cohen physical p.23: multiplying a nonzero ideal by zero gives the zero module, so the scalar must be nonzero. The intended denominator-clearing proof uses a nonzero scalar. |
| KTheoryLowDegrees/E7 | Confirmed at II p.32 and combined p.106: ψ¹=id has its entire rational group in the eigenvalue-one space and cannot distinguish weights; the proof requires distinct 1,k,k²,… and hence k>1. |
| KTheoryLowDegrees/E8 | Confirmed in the author draft physical p.106, not collated with the AMS edition. c₁(O(1)) on projective space can be nonzero; vanishing starts strictly above rank. |
| KTheoryLowDegrees/E9 | Confirmed in the draft physical p.106: an annihilating square-free polynomial constrains the minimal polynomial. Id on a two-dimensional vector space has characteristic polynomial (t−1)². The diagonalizability proof survives the terminology correction. |
| KTheoryLowDegrees/E10 | Confirmed at II p.33: the preceding multiplicative total-Chern axiom gives convolution. On P², two copies of O(1) have nonzero second Chern class although each line has c₂=0. |
| KTheoryLowDegrees/E11 | Confirmed at II p.33: CC0 sends every integer multiple of the unit to total Chern class one. For K=ℤ the kernel is all ℤ, so a torsion-kernel conclusion needs restriction to the reduced group and a specified target. |
| KTheoryLowDegrees/E12 | Confirmed at II p.33: c₁ is the identity on the first graded piece, which contradicts the printed negative coefficient; the Newton coefficient is (−1)^{n−1}(n−1)!. |
| KTheoryLowDegrees/E13 | Confirmed in II pp.27–28 and draft physical pp.100–101: λ_t(1)=1+t differs from the stated Witt unit 1−t. In the printed product the first coefficient polynomial has the opposite sign. Use the plus normalization or λ_{−t}; no fresh full author-errata collation is claimed. |
| KTheoryLowDegrees/E14 | Confirmed at II p.27 and draft p.101: exp(1−r_ntⁿ/n) has constant coefficient e, so it cannot define a series in 1+tR[[t]]. Removing 1 gives the stated minus-normalized Witt exponential; the cached author erratum confirms this typo. |
| KTheoryLowDegrees/E15 | Confirmed in I p.24 and combined p.36. The displayed choice has zero input in a determinant factor but output determinant 1; this was also checked by exact rational Gaussian elimination. A basis-defined local map and the determinant tensor identity repair the hint, leaving its theorem true. |
| KTheoryLowDegrees/E16 | Confirmed at II p.14 and draft p.86: for ℚ→ℚ×ℚ, pullback after transfer sends (1,0) to (1,1), not (2,0). Its kernel contains all (a,−a), so no power of 2 annihilates it. The reverse composition satisfies the projection formula. |
| KTheoryLowDegrees/E17 | Confirmed in Cohen physical p.23: the displayed R^{n−1} formula is undefined at rank zero. The following proof, p.24, explicitly treats the zero module separately; retain that boundary in the statement. |
| KTheoryLowDegrees/E18 | Confirmed at I p.18 and draft p.29: the zero ideal is not an invertible module over a nonzero domain. Nonzero ideals give the Picard classes. |
| KTheoryLowDegrees/E19 | Confirmed as a citation/argument gap, not a false conclusion, in draft p.154. Its cited Hartshorne exercise and I.5.12 have curve-over-a-field hypotheses absent from the general statement. The packet uses generic-point localization and principal-divisor vanishing instead; no counterexample to the theorem is asserted. |
| KTheoryLowDegrees/E20 | Confirmed in BS arXiv v3 p.58: π₀ΩBX=π₁BX. For the discrete grouplike space ℤ, π₁X=0 but π₀ΩBℤ=ℤ. This is a misprint, not a failure of the surrounding argument. |
| KTheoryLowDegrees/E21 | Confirmed as a missing justification in the BS v3 p.19 proof, not a false corollary. Affineness alone supplies coherent-cohomology vanishing, whereas the general lifting obstruction involves cotangent-complex Ext. The proof does not establish the required finite-projective reduction for arbitrary regular R₀. The smooth case and a separately justified approximation/continuity argument are sufficient; no explicit nonzero obstruction is claimed. |
| KTheoryLowDegrees/E22 | Confirmed in BS v3 pp.56–57: without a nullary unit condition, the discrete monoidal groupoid {1,e}, e²=e, yields two [0]-points and three [1]-points. Add X_empty≅1. In the paper’s finite-projective and Picard applications that condition is forced, so no applied result is refuted. |
| KTheoryLowDegrees/E23 | Take A=∏_{n∈ℕ} F₂ and I=⊕_{n∈ℕ} F₂, the finite-support ideal. I is not finitely generated: finitely many generators have a common finite support. At a prime corresponding to a principal ultrafilter I_p=A_p=F₂; at any other prime all finite-support idempotents vanish after localization, so I_p=0. Thus the quasi-coherent sheaf I~ has finite free stalks everywhere. If it were finite locally free on Spec A, affine quasi-compactness would make I finite projective, a contradiction. Finitely presented sheaves with free stalks are finite locally free. The reviewed nodes use only (3)/(4), never the invalid (2). |
| KTheoryLowDegrees/E24 | Take N=R as the first direct summand of M=R⊕I, with I a nonprincipal invertible ideal over a Dedekind domain. Then M/N=I, whereas the printed complement R^{m−n} is R. In a simultaneous pseudo-basis the complement is ⊕_{j>n}b_j, a projective module. This correction leaves the torsion invariant factors and theorem intact. |
| KTheoryLowDegrees/E25 | The homogeneous hyperplane equation gives 0→O(−1)→O→O_H→0 in the draft’s standard Proj twisting convention (I.5.3.1). I.5.13.1 explicitly distinguishes an ideal from its inverse divisor line. The Picard generator theorem remains true, with O(1) the positive divisor line; the packet uses O(D), not the ideal as the positive class. |
| KTheoryLowDegrees/E26 | For X=A¹_k, the discrete valuation ord_∞ on k(t) has no centre on X: t has negative valuation. X is integral, separated and noetherian normal. Conversely each prime divisor does give the stated DVR valuation. The class-group dictionary in the packet indexes actual codimension-one points and does not use the invalid converse. |
| KTheoryLowDegrees/E27 | For a DVR A=k[[t]], f=t and I=A, the printed left coefficient is length(A/A)−length(A/tA)=−1, whereas ord_A(t)=1. Both quotient-class differences map to zero in G₀ by the displayed exact sequences, so the principal-divisor vanishing theorem and its use here remain true. |
| KTheoryLowDegrees/E28 | P⁰_R≃Spec R and O(m) is trivial for every m. Lemma 29.4 gives Pic(Spec R)=0, so the displayed Z→Pic(P⁰_R) cannot be injective. The cocycle proof requires at least two standard charts. The packet’s application is P¹ over a field, which satisfies n≥1. |

## Supplier statements, ownership and red-team checks

The following 45 actual supplier node statements, including their hypotheses and recorded review/scope limitations, were read. GeneralAlgebraicKTheory K.1/K.2 and the companion/scheme packets are planned interfaces, not falsely advertised as accepted proofs; the general K packet’s recorded needs_changes status is preserved as a supplier limitation. EllipticKTheory E.2 is used with its rational-origin hypothesis. Scheme comparisons retain quasi-compact/quasi-separated, resolution-property, regular/noetherian and finite-Tor requirements wherever applicable.

- `EllipticKTheory:E.2/K0-of-an-elliptic-curve`
- `EllipticKTheory:E.2/picard-decomposition-and-the-point-group`
- `EllipticKTheory:E.2/ring-structure-of-K0-of-a-curve`
- `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`
- `GeneralAlgebraicKTheory:K.1/pi1-BQ-equals-K0`
- `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`
- `KTheoryLowDegrees:Z.1/extend-scalars-finite-projective`
- `KTheoryLowDegrees:Z.1/restrict-scalars-finite-projective`
- `KTheoryLowDegrees:Z.1/ring-k0`
- `KTheoryLowDegrees:Z.1/ring-k0-class-induction`
- `KTheoryLowDegrees:Z.1/ring-k0-exact`
- `KTheoryLowDegrees:Z.1/ring-k0-map`
- `KTheoryLowDegrees:Z.1/ring-k0-transfer`
- `KTheoryLowDegrees:Z.2/componentwise-free`
- `KTheoryLowDegrees:Z.2/division-ring-k0`
- `KTheoryLowDegrees:Z.2/k0-field-product`
- `KTheoryLowDegrees:Z.2/k0-pi`
- `KTheoryLowDegrees:Z.2/local-freeness`
- `KTheoryLowDegrees:Z.2/nonfree-projective-ideal`
- `KTheoryLowDegrees:Z.2/pi-ring-modules`
- `KTheoryLowDegrees:Z.2/pid-k0`
- `KTheoryLowDegrees:Z.2/rank-base-change`
- `KTheoryLowDegrees:Z.2/rank-connected`
- `KTheoryLowDegrees:Z.2/rank-domain`
- `KTheoryLowDegrees:Z.2/rank-fibre-decomposition`
- `KTheoryLowDegrees:Z.2/rank-hom`
- `KTheoryLowDegrees:Z.2/rank-section`
- `SchemeKTheoryOperations:S.1/doubled-plane-counterexample`
- `SchemeKTheoryOperations:S.1/resolution-property`
- `SchemeKTheoryOperations:S.1/vector-bundle-comparison`
- `SchemeKTheoryOperations:S.2/affine-k-theory-comparison`
- `SchemeKTheoryOperations:S.2/cartan-degree-zero-compatibility`
- `SchemeKTheoryOperations:S.2/cartan-equivalence`
- `SchemeKTheoryOperations:S.2/cartan-map`
- `SchemeKTheoryOperations:S.2/cartan-singular-non-example`
- `SchemeKTheoryOperations:S.2/g-theory-of-a-scheme`
- `SchemeKTheoryOperations:S.2/k-theory-pullback`
- `SchemeKTheoryOperations:S.2/k-zero-of-a-scheme`
- `SchemeKTheoryOperations:S.2/tensor-product-pairings`
- `SchemeKTheoryOperations:S.2/vector-bundle-k-theory-comparison`
- `SchemeKTheoryOperations:S.3/affine-support-comparison`
- `SchemeKTheoryOperations:S.3/localisation-fibre-sequence`
- `SchemeKTheoryOperations:S.3/one-dimensional-localisation-sequence`
- `SchemeKTheoryOperations:S.5/projective-bundle-cohomology`
- `SchemeKTheoryOperations:S.5/projective-line-k-theory`

The following 13 stage scopes were also read in full, including the two formerly nonexistent decomposition-node references:

- `AlgebraicModuliForArithmeticGeometry:R09.1`
- `GeneralAlgebraicKTheory:K.3`
- `GeneralAlgebraicKTheory:K.4:construction`
- `GeneralAlgebraicKTheory:K.5`
- `GeneralAlgebraicKTheory:K.7`
- `KTheoryLowDegrees:U.3`
- `KTheoryLowDegrees:Z.2`
- `SchemeAndStackFoundations:SF.1`
- `SchemeKTheoryOperations:S.1`
- `SchemeKTheoryOperations:S.2`
- `SchemeKTheoryOperations:S.3`
- `StableHomotopyKTheory:H.4`
- `StableHomotopyKTheory:H.5:spectra`

The nonexistent K.7 product node is replaced by the actual owner stage with a precise requested π₀ product normalization: [P][Q]=[P⊗Q], ring-map naturality and compatibility with the ExactK₀/BQ comparison. The nonexistent K.5 relative/excision node is removed from the two support consumers; their actual suppliers are S.3 affine support and localization-fiber interfaces. Every one of the 16 requests was checked for a concrete interface and neededBy list.

Upstream GrothendieckEulerForms layers 3–4, ClassicalGroups layers 3–4, AlgebraicCurves layers 12A–12E and JacobianChallenge layer A were read in full at the relevant scope. General resolving Euler independence uses refinement, not the E-projective comparison theorem. ClassicalGroups provides a complex theorem, leaving the arbitrary-field GL character/descent problem with the existing ReductiveGroups Part II direction. JacobianChallenge owns general Picard duality/pullback; Z.5’s independent regular-curve divisorial dictionary is retained. SF.1 currently supplies fpqc/fppf and needs an explicit rescope for perfect v-descent; H.5’s homotopy-category surface does not silently supply coherent spectral truncation. All 16 restructuring entries were checked; cyclic coherent determinant/scheme routes remain separated between early Z.3 and downstream Z.6. No upstream source or stage file was edited.

Both confirmed red-team result files and their independent verifier verdicts were read. RT-AREA-ktheory-1/31 concerns the doubled **plane**, dimension at least two, as the resolution-property counterexample; the doubled line is a valid nonseparated regular-curve example with K₀(Vect)=G₀=ℤ². The packet and reader already use this distinction correctly. The source misprint is already recorded by the GeneralAlgebraicKTheory owner (`E-double-origin`), so it is not duplicated here. RT-AREA-ktheory-2/41 removes S.6→Z.5 and S.7→Z.6, and routes the S.6→M.4 need through M.6b; Z.3/S.2 for curves and S.2/S.5 for Z.6 remain necessary. No forbidden S.6/S.7 proof prerequisite remains in this packet. The reader’s restructuring text records the removals; applying them to the assembled atlas remains the orchestrator’s job.

## Lemma granularity, API, tests and planets

The issue explicitly requires lemma level. Twenty new nodes separate exterior rank, negative free λ coefficients, projective-class injectivity and cancellation, index-ideal definition/evaluation/congruence/free/localization, affine diagonal and ample line bundle, point ideal/exact sequence/inverse divisor line, pre-λ homomorphisms/ideals/quotients/weak line elements, and composition/Newton universal polynomials. Their consumers now cite the precise direct node; existing carrier/API declaration names were retained where possible. Remaining simultaneous source statements are kept with the source’s simultaneous proof; no imported generic construction was duplicated merely to make this pass longer.

All 72 definitions/constructions have at least three distinct meaningful tests, with constructor, extensionality, simp, structure, functoriality, universal-property and compatibility coverage appropriate to their object. Five API/test declaration-name collisions were removed. Boundary/non-example tests now use their necessary hypotheses, including nontrivial Picard classes, nonzero ideal generators, nonzero integers and nontrivial rings. The native weak degree-one-series predicate includes zero and is explicitly distinguished from Weibel’s stronger positive invertible line element; no equivalence of these notions is asserted. The product, composition and Newton polynomial tests are separated rather than hidden in one node.

Planet allocation is Z.3: 6; Z.4: 6; Z.5: 5; Z.6: 1, within the six-per-stage bound. The 18 names identify central definitions, constructions and named results; the new supporting lemmas do not add planets.

## Suggested Lean and validation

Every non-comment line of the input suggested file was read via a nested-comment-aware line-numbered projection; omission contracts and all final edits were inspected separately. All 260 node IDs are represented by full tags in the final suggested source. Packet/native signatures were compared, including idempotent-only restriction of an invertible module, corrected counterexample hypotheses, added helper nodes and their new tests. This is source inspection, not Lean elaboration. Existing outline-only interfaces and honest `sorry` placeholders are not formal proofs.

There are 31 explicit node-level OMISSION blocks, one marked partial and the rest omitted. These retain the actual requested mathematical contracts instead of opaque proposition-valued carrier surrogates. Additional inherited outline-only dependencies are described at their use sites. The final source has 6823 lines. No separate Lean file, Lake project, cache download, library build or language server was created.

Lean was **not compiled**: there is no existing build at both required pins. The available compiled Tau Ceti checkout is at `cf386627e9176a3827c1a5fe804989fd94a4d216`, rather than the required `f790474821cf4256814db967cb154e7af3d0c369`; the pinned source checkout has no build. Import existence and source reading do not justify claiming elaboration.

Validation commands:

```text
python3 scripts/check_blueprint.py research/blueprint/packets/KTheoryLowDegrees--Z.3.json --index <pinned-declaration-index>
git diff --check
```

The actual checker passes with 0 errors and 0 warnings. Final JSON parsing, complete 260-node review coverage, all 28 source-review fields, the acyclic internal graph, unique API/test names, three-test minimum, planet bounds, source-module pin receipts and the authorized three-file output scope were checked. No promotion, label change, issue closure or manual merge was performed.

## Questions and required action for the orchestrator

1. Regenerate the reader from the corrected packet, carrying all new split nodes, hypotheses, API/tests, locators and six new source issues. In particular remove the virtual-class top-λ determinant assertion at the four locations above. Keep this review at needs_changes until that concrete contradiction is resolved.
2. During assembly, apply the already confirmed S.6→Z.5/S.7→Z.6 removals and the S.6→M.4 route change, together with the recorded early vector-bundle sublayer and coherent determinant supplier rescopes. These are proposals, not edits to live content in this review.
3. Preserve the three explicit gaps and scoped source-version limitations in continuation jobs. The next representation pass should establish integral GL coefficient freeness, exact-category/K₀ transport and arbitrary-field character images; the determinant pass needs enhanced support/perfect K coherences and perfect v-descent. Do not treat this review’s source-inspection ledger as an elaboration certificate.

This report and the packet’s per-node/source-issue verdicts are the public recovery record. The worker’s temporary downloaded sources and scratch worklist may be deleted after the PR opens; nothing needed to understand the verdict depends on a private path.
