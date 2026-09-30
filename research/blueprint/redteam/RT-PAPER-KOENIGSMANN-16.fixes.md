# Koenigsmann extraction: confirmed findings fixed

Issue #4991 · Codex · session `codex-rtOQ9t` · 2026-09-30.

This fixes all nine findings confirmed in `RT-PAPER-KOENIGSMANN-16.review.json`, including the five low-severity findings omitted from the generated issue's four-item synopsis. Koenigsmann now has 49 items (6 library, 6 planned, 37 missing), all missing items routed exactly once: 34 to LD.4 and three to LD.0. Seven new extraction items make the missing inputs explicit; proof closure remains blueprint work. No result is claimed newly formalised.

Only the four listed deliverables change. The earlier source read/review history and source issues E1–E7 are preserved. The independent reviews are not rewritten. In particular the ABS Part II still has its existing rejected review and G2/G3 obligations; this fix resolves the four shared foundations' ownership only.

## Disposition of every confirmed finding

1. **Missing cross-roadmap imports.** Route 1 names the exact four quadratic-form supplier stages and the pinned weak-approximation declaration. The report distinguishes an import request from a graph edge. The maintainer requests below specify the out-of-scope graph work; this issue does not claim to have installed those edges.
2. **Model completeness and existential closedness.** Added definition item **43** and theorem item **44**, following the verifier's correction that the item schema requires separate kinds. Item 43 defines existentially closed embeddings and model-complete theories with API/test outlines; item 44 states the equivalent existential-closedness and existential-normal-form criteria. Both go to LD.0 beside 39. Item 41 imports them through the existing LD.0 → LD.4 direction. The library provides syntax, elementary embeddings and upward existential preservation, not these full notions/theorems.
3. **External non-n-th-power theorem.** Added **45**, Colliot-Thélène–Van Geel for every number field and positive n, including the trivial n=1 case. Item 40(c) names it. It goes to LD.4 as a separate external theorem source, whose Brauer–Manin/proof dependencies are for that blueprint to close. The elementary n=2 argument is not substituted for it. The CTVG statement was independently checked, beyond Koenigsmann's citation.
4. **Duplicate Diophantine foundations.** Item **46** defines the ring-general finite-system carrier once at LD.4; item **42** supplies the valid general closure/composition operations and separately scoped domain/Q/computable-ring consequences. Item **49** owns the general integer-subring undecidability transfer. Item 1 now describes only its actual logical library bases, with the polynomial bridge delegated to 46/42. The ABS items **1, 3, 46, 47** retain their statements, statuses and APIs, with ownership notes added. Item 3 no longer lists Part II item 45 as a prerequisite: reducing systems to one equation is a downstream specialization, not an input to the generic transfer. They move out of its Part II into a new LD.4 source route; its brief imports them. No other ABS item changes. The requested arbitrary-ring finite-union assertion was not copied, for the mathematical reason below. The verifier's restriction of sum-of-squares reduction to Q is also retained.
5. **Archimedean symbol owner.** Item 8 now lists GlobalQuadraticForms Layer 4 and assigns its real-place clause to 4.4. QuadraticFormInvariants 6C supplies the finite-place formulas. The report no longer claims that 6C supplies every clause.
6. **Existing quaternion norm form.** Item 6 cites Tau Ceti's `QuaternionAlgebra.normForm` and `QuaternionAlgebra.equivalent_normForm_weightedSumSquares`. Item 16 specifies the norm-one trace-set construction on that existing carrier and coordinate formula. It remains missing. Item 7 distinguishes the built norm-form base from the missing general splitting criterion in the partly built Layer 2.
7. **Local square criterion.** Added **47**, with status **planned**, owned by LocalFieldsRamification Layer 1, as corrected by the verifier. It covers odd-prime unit squares/residue squares and the dyadic inclusion `1+8Z₂` in squares. Mathlib Hensel is its base; citing Hensel does not establish the complete square criterion. QuadraticFormInvariants 6A is the consumer, not a new owner.
8. **Two source misprints.** Added **E8** (localization `Z_(l)`, not completion `Z_l`, published p. 90) and **E9** (the omitted 8 in the congruence class, published p. 91). Both were independently read in the published page images and collated against v2 pp. 20–21; both affect nothing. Dated fresh searches are recorded. They reference the existing red-team verification in their search history but have no invented new source-issue review verdict.
9. **Conditional rational undecidability.** Added **48**, the implication from a Diophantine definition of Z in Q to undecidability over Q. It is the rational instance of 49 and explicitly conditional. Item 15's unconditional ∀∃ transfer retains its own quantifier-prefix argument and does not inherit that unproved hypothesis.

## Correction to the proposed fix's ring generality

The duplication finding is valid, but finite unions of projections of finite polynomial systems are not closed over **arbitrary commutative rings**. Let `R = F₂ × F₂`. A finite system over R, with any coefficients and any finite witness tuple, splits into its two component systems. Existence of witnesses also splits, so its projected solution set is a Cartesian product. If it contains both `0_R=(0,0)` and `1_R=(1,1)`, it contains `(0,1)` and `(1,0)` as well. Consequently `{0_R,1_R}` is not defined by such a system, even though each singleton is. This rules out the proposed general theorem, not just one attempted encoding.

Item 42 instead states finite-union closure for integral domains. Its selector equation `e(e-1)=0` forces e=0 or e=1 there, allowing one of two systems to be selected. Finite intersections, projection, polynomial preimages and substitution through a Diophantine unital subring work over arbitrary commutative rings. Over Q, sums of squares give single-equation conjunctions and inverse witnesses eliminate inequalities. The sum-of-squares claim is not extended to arbitrary fields; units are not confused with nonzero elements over rings. Recursive enumerability assumes effective ring operations, equality, coefficients and enumeration.

The generic transfer (49) needs only effective finite expressions in the integers and the finitely many constants of the fixed definition; it does not assume every abstract ring has a computable presentation. It reduces integer polynomial solvability to **systems** over R. The ABS single-equation adapter remains its separate item 45.

These are elementary generalizations needed to share the two papers' foundations. The item locators identify them as such rather than attributing an arbitrary-ring theorem to Koenigsmann's Q-only text. MRS Definition 2.2 and Proposition 2.3(1) were independently checked as the general carrier/transfer source; the transitivity and intersection arguments are the general finite-system versions of MRS Lemmas 4.3 and 4.5.

## Maintainer handoff: supplier links

The files owning stage edges are outside this issue's deliverables. Please add these supplier → consumer imports, with this extraction and the named source arguments as evidence. Every target is `LogicAndDefinabilityInNumberTheory:LD.4`:

| Supplier stage | Consumer/evidence |
| --- | --- |
| `tauceti:TauCetiRoadmap/QuadraticFormInvariants#layer-2-quaternion-algebras-and-the-four-fold-splitting-criterion` | Items 7 and 16–18; Koenigsmann Definition 4 and the norm-one trace argument. Reuse the norm form already built; import the general splitting criterion. |
| `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant` | Items 7–9; Observation 5's finite-place symbols and reciprocity interface. |
| `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-4-global-square-norm-and-approximation-lemmas` | Items 8–10; the archimedean symbol, localized product and quadratic norm adapters. |
| `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-6-representation-and-isometry` | Items 7 and 10; the Hasse–Minkowski representation input to Proposition 6 and the quadratic norm comparison. |
| `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group` | New item 47; dyadic step on p. 78 and odd-prime square step on p. 88. This fifth request follows from confirmed finding /7. |

Item 11 directly imports the built `TauCeti.GlobalNumberFields.weakApproximation_denseRange`, with its completion identifications, rather than requesting a second weak-approximation theorem.

For the ABS route revision, retain the new LD.4 source route for /1, /3, /46 and /47 and the Part II's imports of those foundations. Its existing route-5 review is still rejected for separate arithmetic obligations; the new source route needs its normal review. This fix neither accepts route 5 nor claims its proof gaps are closed.

At assembled base `8984cbb929a023398a752d00e5660a5c5e1dcb70`, all proposed endpoints exist. Each of the five requested pairs has no forward path, no direct edge and no reverse path; adding the imports therefore respects the dependency direction. The existing LD.0 → LD.4 path was checked. No graph data was edited.

## Sources and pinned checks

Targeted primary-source reads on 2026-09-30:

- [Koenigsmann, published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p02-p.pdf): pp. 73, 78, 88, 90–92, with rendered page images at 90–91. SHA-256 `f26c2e155d025978045a0c68073505631677624ef4d6f9b461640c6fbe1d3c93`.
- [Koenigsmann arXiv v2](https://arxiv.org/pdf/1011.3424v2): the two misprint contexts on pp. 20–21. SHA-256 `6f10efddacba619eb816610b4a79edb28e6110f8b15d8d5813985eae1b58c541`.
- [Colliot-Thélène–Van Geel arXiv v1](https://arxiv.org/pdf/1401.0915v1): introduction and Theorem 4.3, pp. 16–17, not a new extraction of its proof dependencies. The unversioned download returned this v1, as its front page identifies. SHA-256 `a8a5a538032fa92b7d90404308522c5abef12f86ea8e9cf13760305d6df59b41`.
- [Mazur–Rubin–Shlapentokh arXiv v3](https://arxiv.org/pdf/2208.09963v3): Definition 2.2 and Proposition 2.3(1), p. 5; Lemmas 4.1–4.5, pp. 9–10 (and surrounding pp. 3–4 for context). SHA-256 `ffff534a6645e66fdc21c0a67323692792465912e1896d3e58862cf927ad560c`.

The Annals article page, arXiv version list, author's publication page and title/author erratum/corrigendum search were checked for E8–E9; no published correction was located. The historical full-paper read and prior searches remain labelled with their original date; this is a targeted fix, not a claim to a new complete read of Koenigsmann or ABS.

I read the relevant endpoint descriptions and reviewed AUDIT-04/AUDIT-05 coverage records. There is no `LogicAndDefinabilityInNumberTheory:LD.0` or `:LD.4` entry in the current reviewed coverage map; their statuses were checked directly against their specifications and pinned sources instead. The sharp dyadic square theorem and global quadratic conclusions are not marked built.

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, I read `ElementaryEmbedding` in `ModelTheory/ElementaryMaps.lean`, `BoundedFormula.IsExistential` and its preservation theorem in `ModelTheory/Complexity.lean`, `Dioph` in `NumberTheory/Dioph.lean`, and `hensels_lemma` in `NumberTheory/Padics/Hensel.lean`. The first is the actual elementary embedding interface, the second allows arbitrary quantifier-free matrices, `Dioph` is over natural-number tuples, and Hensel carries its strict derivative-norm inequality. Search hits named `model_completeTheory` concern a structure's complete theory, not model completeness.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, I read the norm-form definitions, coordinate formula and diagonalization in `Algebra/Quaternion/NormForm.lean`, and the mixed finite/infinite-place `weakApproximation_denseRange` declaration in `NumberTheory/NumberField/Global/Approximation/Weak.lean`. Targeted pinned-tree searches for model completeness, existential closedness, Diophantine ring/field sets and the named sharp square theorem did not locate the missing interfaces. No declaration was inferred from a current-branch name alone.

## Validation and remaining work

- Both result files pass `scripts/check_paper.py`, including embedded source-issue schema checks.
- Embedded source-version validation passes. The standalone `check_errata.py` CLI is for separate `errata-v1` files and was not used as the paper-file checker after an initial wrong-format invocation.
- Assertions verify unique item ids, exactly one route per missing item, valid internal dependency references, E1–E7 and source-version preservation, and the four-item-only ABS change (ownership notes, removal of item 3’s reverse dependency on Part II item 45, the route split and scoped brief correction).
- Assembled endpoint and dependency-direction checks pass. The `F₂ × F₂` selector calculation was also checked: it has all four ring elements as roots, whereas the intended union has two; the general nondefinability argument is given above.
- Four-file intake validation and `git diff --check` pass.
- No Lean file changed or compiled. No Lake build, cache operation or Lean language server was used.

All confirmed findings have their in-scope fixes or the explicitly permitted out-of-scope maintainer requests above. Supplier links and blueprint proof closure remain with their owners. Downloaded PDFs, extracted text, images and editing scratch can be deleted after the PR opens; this report retains source hashes, locators and the exact follow-up requests.
