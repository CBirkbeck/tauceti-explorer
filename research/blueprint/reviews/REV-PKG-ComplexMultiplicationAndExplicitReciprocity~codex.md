# Independent package review: complex multiplication and explicit reciprocity

Issue: #11142. Reviewer: Codex, session `codex-dTow9C`. Date: 2026-10-19.

**Verdict: `needs_changes`.** This is a completed fresh independent review. The substantive remaining finding is R1 below: the general relative Serre-tensor construction required by CM.1 has no supplying target in the cited A0/A1 package. The previous missing `~adv` report is not a blocker and is not a finding of this review.

## R1 — the relative Serre-tensor supplier does not exist

**Location:** [Exact supplier contracts](../packages/ComplexMultiplicationAndExplicitReciprocity/README.md#exact-supplier-contracts) and [CM.1.3](../packages/ComplexMultiplicationAndExplicitReciprocity/README.md#cm-1-3).

The original package attributed representability of projective-module Serre tensoring, its base change and its realization comparisons to `AbelianSchemesAndArithmeticModuli:A0/A1`. I read that supplier's README, Suggested file and packet and searched the current library for the construction. A0 provides the abelian-scheme carrier; A1 provides products, rigidity, relative dimension, invariant differentials and Lie/base-change statements. Neither states the required Serre tensor. Serre–Tate deformation theory is a different construction.

The missing input is a general `relativeSerreTensor`: for an abelian scheme A/S with a ring R acting on it and a finite projective right R-module M, represent the fppf sheaf associated to T ↦ M⊗_R A(T) by an abelian scheme. Supply functoriality in module maps, compatibility with sums, independence of the projective splitting, arbitrary base change, and Lie/Tate tensor comparisons with the corresponding realization hypotheses. Its Checks must include M=R, M=0, M=Rⁿ, and independence of the complement of a projective summand. The CM ideal-inclusion kernel and finite-flat degree statements remain CM conclusions; they must retain inseparable degrees.

**Affected targets:** `cmSerreTensor`, `cmSerreTensor.ideal_kernel_degree`, `cmSerreTensor.lie`, and the tensor compatibility in `cmHodgeEigenspaces` and `cmPeriodPairings`.

**Applied repair:** removed the false A0/A1 attribution, specified the missing general construction and discriminating Checks, and marked CM.1.3's dependency explicitly unfilled. KS Definition 1.8 and (1.2.3), p.9, support the CM specialization, rather than an assertion that the generic supplier already exists.

**Required next action:** the owner must add a named, source-backed supplier target and its API/Checks, or the maintainer must assign ownership of the general construction. Then replace the explicit gap with that target and verify the realization and kernel-degree contracts. Editing that other package or assigning its scope is outside this review's permitted files. Removing Serre tensor or restricting it to one convenient CM application would lose the required generality. Until this input is supplied the package is not ready for its upstream draft PR.

## Scope, inputs and coverage

I read the full current package and the accepted 69-node packet, including its API, tests, requests, source issues and five recorded gaps. I also read the earlier accepted package review and both subsequent fix handoffs. I did not author or previously review those deliverables. The issue's final fresh-review instruction supersedes the stale revision-round and unrelated Mordell title in its generated text.

The 11 computational certificate/algorithm nodes excluded by the maintainer's #10742 instruction remain excluded. In CM.5 these are `complex-class-polynomial-certificate`, `complex-algorithm-soundness-termination`, `crt-class-polynomial-certificate`, `crt-algorithm-soundness-termination`, `endomorphism-ring-certificate`, `endomorphism-verification-sound-complete`, their three certificate API nodes, and `complex-class-polynomial-algorithm`/`crt-class-polynomial-algorithm`. I checked the remaining 58 nodes against the README. Mathematical height/error bounds, signed relations, the full prime-power conductor criterion, exact interval recovery and bounded congruence remain. No algorithm, search completeness or certificate supplier was restored. The immutable packet still contains the historical nodes and gaps; it was not edited.

The README has the upstream opening Summary, scope, conventions, supplier contracts, ordered layers, named APIs, definition Checks, examples, dependencies and references. I read the current upstream `Multiquadratic` and `HodgeStructures` roadmaps as form models, plus the required upstream guide. Metadata remains the appropriate single line `topic = "math.NT"`.

All source discussion and mathematical statements added here and in the package are in my own words. No source passage or section-by-section source summary was placed in the repository.

## Repairs applied

1. **Independent modular-polynomial input.** Current upstream ModularForms Layer 0 supplies normalized j, its q-expansion, special values and elliptic orders; it does not promise integral modular polynomials, orbit separation or the monic prime diagonal. The package now consumes the actual cyclic polynomial target [ModularCurvesPartII R13.4a, §5.6](../packages/ModularCurvesPartII/README.md#s5-6), uses elliptic uniformization for isomorphism-class separation, and states `modularPolynomial.primeDiagonal` locally before CM integrality. Its proof uses the cyclic factorization and q-expansion, with no CM integrality cycle (MIT20 Lemma 20.9 p.5, Remark 20.10 p.6).
2. **Composite-level negative control.** The old claim that the cyclic square-level polynomial can have zero diagonal was false in the displayed level-four situation. The six cyclic representatives at N=4 give diagonal leading term −2q⁻⁹; thus Φ₄(X,X) has degree nine and leading coefficient −2. The full-subgroup degree-four correspondence includes E[2] and has zero diagonal, but it is a different correspondence. N=1 has zero diagonal. These now distinguish exactly what the prime hypothesis buys.
3. **Ordinary isogeny graphs.** Added exact geometric cyclic-kernel counts, retaining coincident targets with multiplicity. At ℓ∤f they are horizontal `1+(D_K/ℓ)`, ascending 0, descending `ℓ−(D_K/ℓ)`; at ℓ|f they are 0, 1, ℓ. Added all four ℓ=2 rows and the distinction between Frobenius-stable kernels and rational target j-values (MIT22 Theorems 22.3–22.5, pp.2–3).
4. **Quaternion supplier and Deuring proof route.** GN.2 §2.8 supplies embedded stable lattices, localization and involution, not a theorem that supersingular End is maximal or has discriminant p. Narrowed the supplier contract and made the endomorphism-order, reduced-discriminant and Eichler intersection meanings explicit in CM.5. Added the local ideal/quotient-isogeny route and precise Deuring §2.4–10, pp.212–218 locators, retaining all characteristics and the distinction between a curve and a level pair. Generic quaternion algebra remains with QuadraticFormInvariants.
5. **Rosati attribution.** Replaced the nonexistent A2 Rosati target with the actual `AbelianSchemesAndArithmeticModuli:A3.9/Polarization.rosati`, and included A3 in the dependency list.
6. **Generality of induction.** `CMType.IsInducedFrom` now accepts an arbitrary rational algebra map between commutative rational algebras, matching the finite-étale algebra discussion. Only the primitive-subfield theorem is field-scoped.
7. **Suggested file.** Removed admitted examples, unrelated calculations and surplus examples; retained all 14 light real-bodied definitions and all 12 pre-existing named end theorems. Promoted the quartic embedding identities, reflex-generator identity and Gaussian reflex-field check to three named theorem targets, also named in the README. The resulting file has 15 theorem targets and 18 proved example bodies, at most two tests of each kept definition. Heavy objects remain README targets and are named in the closing comment; none is replaced by an arbitrary function carrier or a sorry-defined data object.

No README mathematical target was removed to shorten the file. No additional target was removed for current-library duplication: those boundaries were already correctly deferred. The Lean removals are examples, not missing theorem statements.

## Source verification

I fetched the 20 public primary PDFs listed below and verified their SHA-256 digests against the packet's recorded versions. Access date for every entry is 2026-10-19. This establishes which versions I inspected; it is not a claim to have checked every passage in every PDF.

The random sample is reproducible: take packet nodes in packet order, exclude the 11 superseded computational certificate/algorithm nodes, and use `random.Random(11142).sample(nodes, 15)`. The following are the resulting 15 targets, with the passages I read and their mathematical role. I inspected the scanned/formula images where OCR could obscure conjugation or order conditions.

| Sampled target (node suffix) | Primary locator checked | Result |
| --- | --- | --- |
| `automorphism-factors` | MIT22 Remark 22.2, pp.1–2 | Exceptional automorphisms change graph multiplicities; retain origin-preserving automorphisms and count kernels. |
| `cm-period-pairings` | KS Corollary 1.13, p.11, including formula image | The first pairing has conjugated differential coefficients; the second has the stated conjugate-type codomain. |
| `cm-hecke-character` | MilneCM §9 pp.74–84; BT §3.1 p.6; Kato §15.10 p.260 | Character values are field elements, not necessarily integral units; distinguish positive ideal type from negative idelic type. |
| `class-polynomial-api-roots` | MIT20 Introduction p.1 and §20.3 p.5 | The product uses the full census for the specified full order. |
| `quadratic-forms-dictionary` | MIT16 Definition 16.9 and Theorem 16.12, pp.6–7; CRT §5.2 | Proper ideals/primitive positive forms and complete reduced classes are the correct objects. |
| `picard-classification` | MIT20 §20.3 p.5 | Class torsor agrees with the chosen inverse-ideal left action. |
| `class-polynomial-height-bound` | CRT Appendix 1 Lemma 8 and proof, pp.31–32 | The package uses a safe bound derived from the j estimate, not a transcription of the optimized coefficient formula. |
| `cm-reduction-dictionary` | Deuring Introduction §§2–3 pp.198–200; GZ III §7 p.261, images checked | Split ordinary versus nonsplit quaternionic reduction; order/level distinctions retained. |
| `class-polynomial-galois-action` | MIT21 §21.1 pp.1–3 | Arithmetic Artin agrees with the specified ideal-action convention. |
| `reflex-type` | MilneCM Examples 1.19 and 1.28, pp.14,18, with Proposition 1.9 pp.11–12 | Inverse cosets and the primitive-core qualification are necessary. |
| `ideal-isogeny-degree` | MIT20 §20.3 p.5; GZ III §4 p.257, image checked | Ideal norm agrees with the lattice-index degree. |
| `cm-isogeny-graphs` | MIT22 Theorems 22.3–22.5 and §22.1, pp.2–3 | The order-index trichotomy gives the corrected counts above. |
| `rational-cm-self-twist` | BT §3.1 p.6 | The paper uses the CM rank comparison. The package's explicit anti-invariant endomorphism/descent argument supplies its stronger isogeny statement; this is not attributed verbatim to BT. |
| `reflex-order` | YZ §2.2 p.546 | Selected-factor image order and relative discriminant must be distinguished from an absolute field discriminant; nonmaximal-order comparison is a separate proposed proof obligation. |
| `explicit-level-reciprocity` | Streng Theorem 2.4 pp.7–8 and proof §4.4 pp.15–16 | Matrix inverse, right action and polarization sign agree after the package's stated translation. |

### Previously flagged gaps and source issues

| Input finding | Disposition in the current package and this review |
| --- | --- |
| Absolute/reflex moduli-degree adapter | Read Tsimerman §5 p.386 and the rigidity argument in Lemma 4.1 p.384. The current target gives the relative stabilizer/fixed-field result and an absolute fixed-field inclusion with an explicit equality criterion; it does not assert an unproved absolute degree equality or a field of definition. The norm of a reflex-field ideal has domain the reflex field. |
| Canonical Gross construction proof access | Read Yang Introduction pp.1–2 and §4 pp.16–19, (4.5)–(4.9), Proposition 4.2 and Corollary 4.3. This public construction supplies an alternative to the unavailable Rohrlich proof. Keep its abs(D)>4 condition and check D=−3,−4 directly against the principal-sign law. No local conductor exponent is inferred from support. |
| Deuring primary proof and quaternion carrier | Read the introduction, §2.4–10 pp.212–218 and realization conclusion §8 p.258; inspected the lifting passage and MIT21 Theorem 21.15 p.10. Added the intrinsic local-count argument and accurate GN.2 boundary; no full-quaternion-ring lifting is claimed. |
| Computational evaluator/search suppliers | Superseded by the maintainer's removal of computational certificate/algorithm targets. Exact hypotheses on mathematical coefficient/relation/conductor comparisons remain; no CN0–CN4 dependency was restored. |
| Native carriers and omitted conditions | The former heavy carrier encodings are absent. Endomorphisms, schemes, Hecke characters, realizations and modular-function local rings live in README targets using named owners. R1 is the concrete remaining missing supplier exposed by this fresh audit. |
| Tsimerman norm-domain issue E1 | Confirmed the domain correction at §5 p.386; retained it. |
| Tsimerman unpolarized rigidity issue E2 | A nontrivial power of an infinite-order CM unit can be 1 modulo 3 and still act on an unpolarized abelian variety. The retained polarized level stabilizer avoids that false rigidity implication. |
| MIT21 repeated-root issue E3 | Read Theorem 21.14 p.10. H₋₂₃ reduces to X³ modulo 5, although the inert principal prime has residue norm 25 in the class-field situation. The package correctly requires ordinary split reduction and the discriminant condition. |
| Endo prime-power issue E4 | Read §3.1–3.2 pp.6–7 and Corollary 4 pp.5–6. With v=25,u=5 the naive two comparison discriminants coincide. The retained criterion separates prime-power valuations and treats 2 and 3; the removed certificate routine is not restored. |

The source checks confirm bounded mathematical statements and proof routes, not the truth of all proposed Lean theorems by compilation.

## Current upstream and library audit

I compared targets by objects, operators and hypotheses against current TauCetiRoadmap commit `0d144d044dacebca17b654695b6f1ad58f159b27` and TauCeti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I searched the nine newer roadmaps named in PACKAGE_REVIEW, the four named Completed roadmaps, and the relevant existing owners. I read the declarations cited by the 19 packet baseline entries at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and TauCeti `f790474`, as well as the reviewed library-coverage entry. No build was run in the current read-only checkouts.

| Existing item | Boundary retained or corrected |
| --- | --- |
| IntegralLattices B2/B3/B5 | Reuse form/ideal equivalence, composition and census. Keep only the comparison with oriented analytic CM points. |
| Tau Ceti Gaussian lattice | Reuse the lattice; retain selected embedded types/reflex field and conductor-three order, which are different data. |
| Tau Ceti CM complex-conjugation comparison | Reuse its field involution; retain embedding partitions and their trace/reflex comparisons. |
| `NumberField.units_sq_index_le` | Reuse the generic bound; retain the polarized CM stabilizer quotient and unit obstruction comparison. |
| ModularForms Layer 0 | Corrected its contract as described above; integral cyclic polynomials are supplied by ModularCurvesPartII R13.4a. |
| GN.2 §2.8 and QuadraticFormInvariants Layer 2 | Reuse lattice/localization and quaternion algebra; keep Deuring maximality and the actual endomorphism-order discriminant as CM conclusions. |
| AbelianSchemesAndArithmeticModuli A0/A1/A3/A4/A5/A6 | Corrected Rosati to A3.9 and recorded the absent relative Serre-tensor construction as R1. |

**Coordination note:** the atlas `ShimuraVarieties` package §5.1 currently also describes CM-type/reflex/primitive-core constructions, whereas accepted `restructure/RS-04.result.json` assigns these to CM.0. There is no current upstream ShimuraVarieties roadmap in the checkout inspected. I retained CM's binding RS-04 ownership and its CM.0→V5→CM.2 order; the other package needs to consume CM.0 instead of owning it again. That other package was not edited. This is an out-of-scope coordination note, not a claim of an already merged upstream implementation.

## Adversarial mathematics pass

This table covers the retained targets, their attached API lemmas and standing conventions. A row groups statements that share the same mathematical input; it does not omit the API cases. Checks already correct were retained. R1 prevents a claim of complete dependency closure.

| Statements checked | Instances, non-examples and conventions tried | Result/change |
| --- | --- | --- |
| CM types, induction, primitivity, type-product identities | Empty algebra/product; conjugate inclusion/exclusion; a type induced from a proper CM subfield; quadratic field | Keep finite reduced algebra cardinality and field-only primitive core; generalized the Lean induction map. |
| Trace reflex field, stabilizer, inverse-coset reflex type | Gaussian inclusion gives trace(i)=i and conjugate trace(i)=−i; induced types and double reflex | Primitive-core qualification retained; Gaussian reflex identity is a named target. |
| Reflex order and quartic/nonmaximal examples | Relative versus absolute discriminant; A=i√(3+√2), B=i√(3−√2), AB=−√7; Q(i) conductor 3 | Both roots have positive imaginary part; (A+B)⁴+12(A+B)²+8=0; i is outside Z+3Zi, 3i is inside, class number is 2. |
| Ideal lattice curve, End identification, ideal action, kernel, Picard classification | Unit/principal ideal; inverse-ideal left action; nonmaximal order rather than maximal class group | Preserve same-action algebraization and full-order hypotheses; norm-five Gaussian map fixes the curve class with degree five. |
| Automorphism factors and quadratic-form comparison | j=0,1728,generic j; imprimitive versus primitive forms; orientation | Weights 6,4,2 and kernel multiplicities retained; no duplicate binary-form theory. |
| Ideal isogeny degree and self-twist | Unit ideal, n-multiplication, anti-invariant CM endomorphism and conjugation | Degree is the full ideal norm; self-twist uses explicit elliptic descent rather than a rank equality alone. |
| Serre tensor, ideal kernel-degree, Lie/Hodge/period comparisons | M=0,R,R²; nonzero torsion quotient excluded; principal n has degree abs(n)^(2d); conjugated differential versus homology pairing | Mathematical scope retained; representability/realization supplier is R1. |
| Polarized CM lattice and classification | E(1,i)=1, E(i,1)=−1; scaling lattice by 2 scales ξ by 1/4; positive trace form | Fixed sign and denominator conditions retained; squareForm checks are proved; primitive End-field conclusion excludes product surfaces. |
| Reflex ideal map, principal API, idelic/torsion/polarization reciprocity | Fractional ideals, conductor-avoiding ideals, arithmetic uniformizer and inverse left action | Rational/ideal norm domains and cyclotomic multiplier retained; not a new main CM theorem. |
| Explicit level action and polarized stabilizer | Right action uses U inverse; nontrivial similitude; level at least 3 kills polarized torsion automorphisms | Matrix, exact lattice equality, CM unit witness and polarization condition stay together. |
| Class-map/unit obstruction and relative moduli orbit | Unit square-class bound; unpolarized infinite units; Gaussian Q(j) versus Q(i,j) | Relative fixed-field result retained; no unconditional absolute field equality. |
| Dimension-two example | Product Gaussian surface over F₅, 3-torsion rank four | #E(F₅)=8, π=−1+2i, degree 25, multiplier 2; Frobenius polynomial (X²+2X+5)². |
| Prime diagonal and integrality | ℓ=2; N=1; cyclic N=4 versus all subgroups of order four | Added local prime theorem and corrected the composite-square negative control. |
| Class polynomial, roots, Galois action, ring-class generator | H₋₄=X−1728, H₋₃=X, conductor-three Gaussian H₋₃₆; full census | Keep irreducibility over K and generalized dihedral action over Q distinct; no claim Q(j)=ring class field. |
| Admissible CM-value field and ray generation | Poles excluded; all admissible values rather than one arbitrary function; Gaussian level 3 | Ray calculation uses unit quotient 8/4=2; regularity and full function-field action retained. |
| CM Hecke character, coefficient components, infinity/Frobenius API | Ordinary split versus inert norm 49 at 7; character value −7 is not a unit; rank-one coefficient component versus rank-2g Tate module | Keep negative idelic weight and covariant/cohomological duality; no unit-valued character error. |
| All-prime L-factors, induction and residual Cartan normalizer | Bad-place finite inertia; odd unramified residual prime; nontrivial coefficient extension | Local invariant Euler factors and conductor terms retained; no unsupported full-image claim or theorem of Tate's thesis. |
| Canonical Gross predicate, existence, attachment and good reduction | Unit −1; i; ζ₃; D≡4 mod 8; class twist; extra ramification in arbitrary curve twist | Finite sign, D=−3,−4 exclusions, coefficient extension and support-versus-exponent distinction retained. |
| Deuring classification, CM reduction and lifting | Characteristic 2 model y²+y=x³; characteristic 3; transcendental j; Gaussian primes 5 and 7; noncommuting quaternion endomorphisms | Geometric End can be Z outside finite-field closure; all p retained; lifting is for one finite-field endomorphism. Added proof route and accurate supplier boundary. |
| Shimura–Taniyama ideal formula and Newton slopes | Number-field norm domains; ramified p; nonmaximal order; nonempty H_v; product algebra | Slopes use rational idempotents and nonzero embedding-count denominators, not an unsupported integral decomposition. |
| Ordinary graphs and supersingular curve/level pair | Four ℓ=2 rows; exceptional automorphisms; N=1; prime-to-p squarefree level N | Added counts totaling ℓ+1; distinguish geometric kernels from rational edges and discriminants p from Np. |
| Height, root bounds, perturbation and precision | Empty product; degree 0; h=1,2; δ=0; nonnegative bounds | Empty product has coefficient 1; precision requires h>0 and has positive denominator. Safe j constant and product bound retained. |
| Signed relation count, bound, parity and inversion | Trivial group; n=0 gives 1; zero exponent doubles count; inverse class changes one coordinate | Evenness requires n>0. Coincident products retain distinct sign choices. Tested 22,519 finite cases. |
| Ordinary conductor criterion | Residual conductor 25 and proposed conductor 5; valuations at 2 and 3 | Prime-power separation retained, not the impossible comparison of identical discriminants; no verifier algorithm claimed. |
| Reduction products, interval recovery and bounded CRT | H₋₂₃ mod 5=X³; both polynomial degree bounds; M=2B versus M>2B; exact intervals, not rounded centers | Split ordinary/discriminant conditions retained; strict CRT bound tested on 3,876 bounded cases, with counterexamples at equality. |

The finite checks used cyclic groups of orders 1–7, 0–3 sign coordinates and exponents 0–2; CRT used B=0–8 and M=2B+1 through 2B+4, all bounded integer pairs. Exact quadratic arithmetic checked the quartic/reflex polynomial identities. Point enumeration checked the Gaussian curve at 5 and 7; cyclic representative enumeration checked prime diagonal leading terms at 2,3,5,7,11 and levels 1,4. These are reproducible bounded checks, not proofs of the general targets.

## Lean signature audit and validation

I checked every kept declaration against the README. The following covers all 15 named theorem signatures (exceeding the required ten spot checks).

| Signature | Hypotheses/conclusion checked |
| --- | --- |
| `CMType.card` | Finite-dimensional reduced rational algebra; twice the selected cardinality equals its full rational rank. |
| `CMType.reflexField_conjugate` | Native intermediate fields; complex-conjugation map, not an arbitrary automorphism. |
| `CMType.quadratic_primitive` | Number field, CM field, rational degree two; proper CM-subfield predicate. |
| `gaussian_reflexField` | Actual singleton embedded Gaussian type and its trace-generated native field. |
| `quartic_embedding_identities` | Both square values and both degree-four equations, with the chosen positive imaginary roots. |
| `quartic_reflex_identities` | Negative product sign and the sum's degree-four equation. |
| `nonmaximalGaussian_classNumber` | ClassGroup of the actual conductor-three subring, cardinality two. |
| `rootProduct_coeff_bound` | Arbitrary finite indexing, every coefficient, nonnegative individual root bounds; includes empty product. |
| `rootProduct_coeff_perturbation` | Nonnegative M,δ, δ≤1, pointwise bounds; telescoping factor hδ(1+M+δ)^(h−1). |
| `rootProduct_precision` | h>0, nonnegative M,δ, strict precision hypothesis; positive denominator and strict 1/4 conclusion. |
| `signedRelationCount.bound` | Any commutative group; counts sign vectors, not distinct group products. |
| `signedRelationCount.even` | Explicit n>0; otherwise the empty-vector count is odd. |
| `signedRelationCount.invert_choice` | One actual coordinate of the same commutative group, with no spurious nonzero-exponent hypothesis. |
| `coefficient_interval_recovery` | Both polynomial degrees covered; exact unique integer membership in each interval. |
| `polynomial_bounded_congruence` | Nonnegative B, strict 2B<M, both coefficient bounds and coefficientwise congruence. |

`CMType.conjugate`, `gaussianType` and `gaussianOrderThree` have real data and admitted proof fields. No data body is `sorry`. The 18 example bodies are proved, but some Gaussian examples depend on structures whose proof fields remain proposed targets; I do not describe them as an axiom-free formalization.

Validation results:

- `lean-check` on the final Suggested file: exit 0, no errors, 22 warnings, all `declaration uses 'sorry'`; Mathlib is at exact pin `082e2d37e8b0463410cdb532e111cd43d5a66174`. The file imports only Mathlib, so this does not validate unavailable Tau Ceti adapters.
- `python3 scripts/check_blueprint.py research/blueprint/packets/ComplexMultiplicationAndExplicitReciprocity.json`: zero errors and warnings (69 nodes, 75 API entries, 61 tests, 19 baseline declarations, 37 requests, 5 historical gaps). This is structural validation of the unchanged packet, not closure of the revised package.
- `python3 scripts/check_sorry_data.py` on Suggested: passes.
- `python3 research/blueprint/intake.py check-files` on all five changed deliverables: zero problems.
- Local reference/anchor, declaration/example inventory, README size, metadata and `git diff --check` checks: pass.

## Source-version record

The URLs below identify the fetched PDFs; all hashes matched `sourceVersions` in the accepted packet. Dates, theorem numbering and version limitations remain those in the package References. No restricted book copy was needed.

| Source | SHA-256 |
| --- | --- |
| [MilneCM](https://www.jmilne.org/math/CourseNotes/CM.pdf) | `0ac337a885d72f6938f15724b897f568fe350d0d754d0b52370b8f3a01d2e2b5` |
| [MilneFT](https://arxiv.org/pdf/0705.3446v1) | `a554ef5ebffc6bd971649281b79881863ad75bb6f68c9755630374bae3fa6e60` |
| [Streng](https://arxiv.org/pdf/1201.0020v4) | `bc50c7f3d4a3c03d0e926b3cb20196b1eb83c73ac38a529fb3e1d7ca9f993d1c` |
| [BT](https://arxiv.org/pdf/2506.03465v2) | `cbb8284a13ed40bd15df9713001485724bc4d2a3b5c38d8fd83f9b6f3f3e4664` |
| [KS](https://arxiv.org/pdf/1912.03657v4) | `fab8e605123cf9c399753b7114c4fd65000e1863e3507abdd4129c8c940fbb72` |
| [BKO](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1) | `77ff329057e17cbad573cc309fce3f69f4ba6b73619c4ca203a4ed79a1cb790e` |
| [BS](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf) | `3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf` |
| [Tsimerman](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf) | `43259ca3cfedfb574bf1fe2f80e1023cb736ea299a76588536fd816340722abc` |
| [AGHMP](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p03-p.pdf) | `e1274468312566b3b062e9612cd89818349e9c98cf9e58a728f85704b740c6bb` |
| [YZ](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf) | `29dfd5f19dec401116f1eaf0305305acf5f2fc68aa3c90d4eb6e5222de50d507` |
| [GZ](https://wstein.org/papers/bib/Gross-Zagier_Heegner_points_and_derivatives_of_Lseries.pdf) | `a9a52cb8662e03f19ace81dcfbf24bf873bf9c46ba89a8c890727b9541abdbf5` |
| [Deuring](https://download.uni-mainz.de/mathematik/Algebraische%20Geometrie/Lehre/WS23.Padische.1941.Deuring.pdf) | `f4845d096ce4ea1ea627f8384b8d798c508291f201f52c59dc10c5b9a8c81c7a` |
| [CRT](https://arxiv.org/pdf/0903.2785v4) | `d0ef9ab1eeefd85cbd7e861eaa16f9f57171bab15a91b284793612b7e4b7e6e3` |
| [Endo](https://arxiv.org/pdf/0902.4670v2) | `7b29760f2faa8a63cb558c86b5cc87e1440a7223fcc08a2a09e80434a52aa422` |
| [Kato](https://www.numdam.org/item/AST_2004__295__117_0.pdf) | `3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d` |
| [Yang](https://people.math.wisc.edu/~tonghaiyang/HKCM.pdf) | `ac53defa86ca64204e6ddca4475bf848048f2cf4ed18f127ce3acb77434dfc85` |
| [MIT16](https://math.mit.edu/classes/18.783/2023/LectureNotes16.pdf) | `2fc781b22b32a88c0df711c20a5d8e1417610898ffbb526914049888a2d55677` |
| [MIT20](https://math.mit.edu/classes/18.783/2023/LectureNotes20.pdf) | `e810087d556c2d0e1adc5905e635895fdab6ff0ee50467c3a2ab9b4de101455b` |
| [MIT21](https://math.mit.edu/classes/18.783/2023/LectureNotes21.pdf) | `81a501a312d04bf13cef6c37fd3beb7669015674a6e3b468675b360517ed5e12` |
| [MIT22](https://math.mit.edu/classes/18.783/2023/LectureNotes22.pdf) | `c62eeddd16c3071a339d775cdd4e08fd11db2e61eb4333f30d02c96daec840fc` |
