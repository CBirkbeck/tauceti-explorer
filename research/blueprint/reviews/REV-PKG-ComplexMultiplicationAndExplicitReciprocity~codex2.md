# Independent package review: complex multiplication and explicit reciprocity

Issue: #11243. Job: `REV-PKG-ComplexMultiplicationAndExplicitReciprocity~codex2`.
Reviewer: Codex, session `codex-mX4Mn6`. Date: 2026-10-19.

**Verdict: `accepted`, with the two README corrections below applied.** The relative Serre-tensor input missing in R1 of the previous review is now supplied by AbelianSchemesAndArithmeticModuli A1.3a and A4.7a. Its generality, variance and base-change contracts cover the CM package's uses. The ideal-kernel and finite-flat degree results remain CM conclusions, including inseparable degrees. No unresolved defect was found in this independent pass.

## Scope and independence

I read the package's complete README, Suggested.lean and metadata; the previous independent review; the `~adv3` fix handoff; and the accepted packet, including its APIs, acceptance tests, requests, source issues and historical gaps. I did not author these inputs. The fresh-review instruction at the end of #11243 determines this job; the generated text about an older revision round does not change its deliverables.

The packet has 69 nodes. The maintainer's [#10742 instruction](https://github.com/CBirkbeck/tauceti-explorer/issues/10742) removes 11 computational algorithm/certificate nodes: the complex, CRT and endomorphism certificates and their soundness/termination statements; their three certificate API nodes; and the two class-polynomial algorithm constructions. I checked the other **58 nodes**, including seven separately recorded API lemmas, against the package. The mathematical error bounds, reconstruction uniqueness, signed relations and prime-power conductor criterion remain. I did not edit the packet or restore a computational supplier.

For form, I read the upstream Multiquadratic and HodgeStructures READMEs in the atlas snapshot, the current completed Multiquadratic and EffectiveBounds roadmaps, and the upstream guide. I also inspected the current ClassFieldTheory and IntegralLattices form and the relevant supplier layers. The CM README has the required Summary, ownership, conventions, exact contracts, ordered layers, definition APIs and discriminating Checks, examples, dependencies and source locators. The single metadata line `topic = "math.NT"` is appropriate.

## Corrections made in this review

1. **Existing ordinary finite-field theorem.** The current EllipticCurves Layer 1 already owns the assertion that the endomorphism ring of an ordinary curve over F_q is an order in Q(π_q) containing Z[π_q]. Added that exact input to the ownership/supplier boundary and the prerequisite of `deuringClassification`. The retained variant explicitly adds arbitrary characteristic-p base fields, the split/conductor restriction, quaternionic maximality and realization of every maximal-order type. No whole CM target needed deletion.
2. **Kings–Sprang reference range.** The references entry stopped at p.11 although the period-lattice target correctly cites (1.3.3)–(1.3.4), p.12. Extended the range to pp.6–12 and named those equations. The mathematical statement and its in-body locator were already correct.

Suggested.lean and metadata were unchanged. There are no source passages or section-by-section source summaries in these edits or this report.

## R1: supplier verification and CM specialization

I read A1.3a and A4.7a at [TauCetiRoadmap PR #849](https://github.com/TauCetiProject/TauCetiRoadmap/pull/849), head `a9b3fcc2b312e1f29db816eb2f6802bb70f19801`. This is an explicit supplier roadmap, rather than a claim of an existing Lean implementation. The package cites its section/target names. I also read the relevant A6.12 degree contract.

| CM consumption | Actual supplier contract and comparison |
| --- | --- |
| Representability of M⊗A | A1.3a works over any scheme S, with any associative unital R acting on A through a unital map and a finite projective right R-module M. Its projector kernel represents the pointwise tensor presheaf, which is already an fppf sheaf. It does not restrict to fields, affine bases, free modules or faithful actions. CM specializes to R=O_L with an injective action. |
| Pointwise Hom description | A1.3a gives M⊗A(T)=Hom_R(M*,A(T)). For M=c⁻¹ over O_L, M*=c. This identifies the ideal map with P↦(x↦xP) and its kernel with A[c]. |
| Functoriality and sums | A1.3a names maps induced by module maps and R-linear homomorphisms, composition/additivity, direct sums, complement independence and coherence. These cover ideal inclusions, principal identifications and products. Associativity in the commutative CM case follows from the tensor universal property. |
| Arbitrary base change | A1.3a-base-change is for every S′→S, coherent under composition and compatible with the universal map and induced morphisms. CM does not silently impose a flatness or characteristic-zero condition. |
| Lie and Tate | A4.7a supplies Lie covariantly without a characteristic restriction; the lisse Tate/torsion comparisons require ℓ invertible on S. CM retains this restriction and does not use geometric p-adic points as the characteristic-p realization. |
| de Rham, Hodge and crystalline variance | A4.7a gives contravariant H¹ as a right-R Hom and the covariant dual as M⊗H₁. It preserves the Hodge filtration; Gauss–Manin has its smooth-base hypothesis. The p-divisible/crystalline version has p locally nilpotent. These match the listed contract; no polarization or twist is inserted to reverse variance. |
| CM eigenspaces and periods | The generic realization input is combined with KS Proposition 1.11 and Corollaries 1.12–1.13, pp.10–11, and the period lattice on p.12. Lie has type Σ, the dual-abelian invariant forms have type Σ̄, and the torus action on ω_A is inverse. Ideal twists tensor each eigenspace and replace Λ by aΛ. |

The CM degree proof is substantive and has the needed input. A6.12 applied to the same-identity field L of degree twice the dimension gives deg[x]=N_L/Q(x). A1.2 rigidity and the finite index of every nonzero O_L-ideal preserve faithfulness on fibres. For a⊂b, choose x∈ab⁻¹ with the required valuations above a rational prime ℓ. The factorization through xb⊂a⊂b compares the rank with [b:xb]. The ideal c′=x(ab⁻¹)⁻¹ is prime to ℓ; its norm kills a/xb, so the first inclusion has degree prime to ℓ. This recovers the ℓ-part of [b:a] for every ℓ. The argument uses finite-flat ranks and multiplicativity, not a count of geometric kernel points.

The characteristic-five test distinguishes the two notions. For y²=x³−x with i(x,y)=(−x,3y), i acts by 3 on Lie. Thus 2+i has zero differential and a connected kernel of rank five with one geometric point, while 2−i has an étale rank-five kernel. The proposed formula still gives five. A torsion module O_L/(2+i) instead gives a zero fppf tensor but nonzero tensor with Lie, so finite projectivity cannot be dropped. The nonprincipal Z[√−5] ideal test also rules out replacing all projective modules by free ones. **R1 is closed.**

## Source verification

All 20 public PDFs in the package's source-version record were fetched for reading; their SHA-256 values agree with the packet. I used those fixed versions rather than assuming the published and preprint numbering agree. No uncleared book was used. The following reproducible sample is `random.Random(11243).sample(retained_packet_nodes, 15)`, in packet order before sampling. Duplicate API/construction source checks are recorded as such rather than counted as different source passages.

| Sampled target | Passage read and result |
| --- | --- |
| Class-polynomial height bound | CRT, Appendix 1, Lemma 8, pp.31–32: the rational constant 2114567/1000 bounds the j tail; the coefficient product bound follows. |
| CM reduction dictionary | Deuring Introduction pp.198–200 and Gross–Zagier III §7 p.261: split ordinary versus nonsplit supersingular, retaining ramified primes and good reduction. |
| Supersingular curve versus level pair | Gross–Zagier III §7 p.261, inspected as a page image: the level pair gives the Eichler order with reduced discriminant Np; the curve has maximal order of discriminant p. |
| Tate coefficient components | MilneCM Proposition 7.3 p.53 and Theorem 9.10/footnote 25 p.78; BT §3.1 p.6: rank one over E⊗Q_ℓ, with the integral order-index caveat. |
| Canonical Gross character | Yang Introduction pp.1–2; BKO §3.0.1 pp.950–951 and (3.8) p.953: conjugation, principal signs and ramified conductor support. |
| Dimension-two example | MilneCM Theorems 9.10 and 9.17, pp.78–81, together with direct F₅ point count and the product construction: trace −2, rank-four Tate realization, determinant/multiplier 2 modulo 3 and degree 25. |
| Hecke Frobenius API | MilneCM §9 pp.74–81 and Kato §15.10 p.260: actual attached character and the induction/type comparison, rather than an arbitrary character with prescribed values. |
| Integrality | MIT20 Lemma 20.9 p.5, Theorem 20.12 and Corollary 20.13 p.6: the prime cyclic diagonal, its sign, and the monic integrality argument. |
| Explicit level reciprocity | Streng Theorem 2.4 p.7: the inverse matrix U, norm rescaling and conductor/level restrictions match the arithmetic-Artin convention. |
| Relative moduli orbit | Streng Theorem 2.5 pp.7–8 and Tsimerman §5 pp.385–386: the exact marked relative stabilizer is justified; the package does not equate the reflex and absolute unmarked moduli fields. |
| Shimura–Taniyama specialization | MilneCM Theorem 8.1, Corollaries 8.2–8.3 pp.66–68 and Theorem 8.6 p.69: ideal/embedding multiplicities and the ramified slope interpretation. |
| Ideal-lattice curve | MIT16 Theorem 16.4 p.4, Corollary 16.5 p.5, Definition 16.9/Theorem 16.12 pp.6–7; MilneCM Proposition 3.17 p.31: lattice uniformization, multiplier order and proper ideal classes. |
| Ideal action | MIT20 §20.3 p.5: inverse ideal lattice action, Picard torsor and norm degree. |
| CM tensor kernel degree | KS §1.2 p.9 and Definition 1.9 p.10: the degree is stated there; the package supplies the proof from A1.3a/A3.1/A6.12 audited above. |
| Ideal-isogeny degree | MIT20 §20.3 p.5, the same norm-degree passage as the ideal-action sample: multiplication by n has elliptic degree n². |

I also checked each previously flagged source/proof concern:

| Historical concern | Independent disposition |
| --- | --- |
| Absolute moduli-degree adapter | Read Tsimerman §§4–5 pp.384–386 and Streng Theorem 2.5. The retained theorem is relative to E* with the marked stabilizer. The named forgetting-action comparison states inclusion/equality conditions; it does not claim the unsupported absolute degree equality. |
| Gross construction proof access | Read Yang §4 pp.16–19, (4.5)–(4.9), Proposition 4.2 and Corollary 4.3, as well as the introduction. These supply the public finite-character construction. Its abs(D)>4 condition is retained; D=−3,−4 are independently excluded by the principal-sign unit condition. No local conductor exponent is inferred from support alone. |
| Full Deuring proof and quaternion order | Read §2.4–10 pp.212–218 and the realization conclusion p.258 in addition to the introduction. The local ideal counts, integral representations, maximality and ordinary conductor restriction match the proof route. GN.2 supplies embedded lattices/localization, not the conclusion being proved. |
| Deuring lifting | MIT21 Theorem 21.15 p.10 supplies a lift of a finite-field curve with one nonzero endomorphism and the specified residue field. The package does not lift the whole quaternion ring. |
| Native carriers and omitted conditions | The current compact Suggested file uses existing carriers and light definitions. The geometric, Hecke, modular-evaluation and realization targets carry their identifications and hypotheses in the README, with explicit suppliers. There are no admitted data carriers. |
| Computational supplier gap | Superseded by the maintainer's explicit scope removal. The remaining coefficient/relation/order results have mathematical hypotheses and do not promise an evaluator, complete search or termination. |
| Tsimerman norm and rigidity issues | The norm-domain correction uses ideals of E*. A polarized marked level object, rather than false unpolarized congruence rigidity for CM units, is used for the stabilizer. |
| MIT21 repeated roots | Theorem 21.14 p.10 needs the package's ordinary rational split restriction: H₋₂₃ modulo 5 is X³ even though the inert principal prime has norm 25. The negative control is retained. |
| Endo prime powers | Read §2.4 Lemma 3/Corollary 4/Proposition 5 pp.5–6 and §3.1 pp.6–7. The criterion uses every prime power, with strict separation and actual class counts; existence is claimed only for primes greater than three. |

KS pp.11–12 and Gross–Zagier p.261 were also read as images where extraction loses bars or the scan has no usable text. This confirms the Σ/Σ̄, conjugate-vector-space and level-pair distinctions. The KS p.12 reference-range correction is the only source-locator repair made here.

## Current upstream and library duplication

The current read-only upstream checkout was `0d144d044dacebca17b654695b6f1ad58f159b27`; the current Tau Ceti library was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I searched README/Suggested targets by mathematical objects, operators and hypotheses across the current roadmap collection, specifically all nine newer roadmaps named in WORKERS and the Completed ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts roadmaps. I inspected relevant ClassFieldTheory, IntegralLattices, EllipticCurves, ModularForms and completed Multiquadratic boundaries. No lake command was run there.

I also read the 19 packet baseline interfaces at the pins: the CM-field/conjugation API, native intermediate-field adjunction, fractional ideals, ClassGroup/Pic and their equivalence/base change, ring of integers, Weierstrass j, and Tau Ceti's abelian-variety/endomorphism/isogeny/degree carriers. In particular, Mathlib's class group and Pic comparison apply to a commutative domain, so the nonmaximal-order example does not require a replacement class-group carrier.

| Existing owner or declaration | Disposition |
| --- | --- |
| IntegralLattices B2/B3/B5 | Existing form/ideal dictionary, composition and census remain imports; the retained variant compares oriented CM points. |
| `TauCeti.GeometryOfNumbers.gaussianLattice` and its membership/separation API | Already a boundary input. The chosen Gaussian type/reflex field and conductor-three subring are different targets. |
| `TauCeti.NumberField.complexConj_eq_complexConjugationAt` | Existing conjugation comparison remains imported; embedding partitions and type traces add CM data. |
| `NumberField.units_sq_index_le` | Existing generic unit bound remains imported. The CM unit/norm obstruction comparison is the retained variant. |
| EllipticCurves Layer 1 ordinary finite-field order theorem | Added explicit boundary consumption; removed the implication that this subcase needs to be planned independently. The general Deuring variant remains, with its differences stated. |
| ModularForms Layer 0 / ModularCurvesPartII R13.4a | The independent normalized-j and cyclic-polynomial inputs are correctly separated; the CM prime-diagonal comparison is a consequence, not a second polynomial construction. |
| AbelianSchemesAndArithmeticModuli A1.3a/A4.7a | Generic tensor and realizations are imported; CM retains ideal degrees, type/eigenspace and period comparisons. |
| QuadraticFormInvariants Layer 2 / GN.2 | Generic quaternion algebra and embedded order-lattice calculus are imported; Deuring maximality and the actual endomorphism-order discriminant remain CM conclusions. |

No entire target was newly removed. The audit found no already supplied CM-type/reflex, class-polynomial, attached-Hecke-character or general Deuring target in the current library. No `FoundationsAndLibraryIntegration` or `UPSTREAM:` prerequisite remains. The CM.0 → ShimuraVarieties V4/V5 → CM.2 ownership order agrees with RS-04; CM.2 is not an input to the main CM theorem it specializes.

**Coordination for the maintainer:** the atlas ShimuraVarieties package §5.1 also describes types/reflex fields/primitive cores, while RS-04 assigns them to CM.0. This is another package's ownership alignment, not a current upstream implementation of CM.0. I preserved RS-04 here and did not edit the other package. The supplier PR remains open at the inspected head; its eventual section renumbering would require updating the consumers' locators.

## Adversarial pass over all retained targets and APIs

The rows below cover the 58 retained packet nodes, their API laws and Checks, and the mathematical comparison targets added during earlier fixes. A combined row checks both named statements, not just the example. Except for the stated boundary/citation repairs, the existing hypotheses and negative controls were sufficient.

| Statements or conventions checked | Instances and failure mode tested | Result |
| --- | --- | --- |
| CM type, conjugation, cardinal and induction APIs | Empty/full Gaussian selection; product of two quadratic fields; zero reduced algebra in the general cardinal signature; induced ζ₈ type. | Partition, half-rank and complement laws are coherent. No primitive-core assertion for a product. |
| Primitive core, reflex type and double reflex | Quadratic singleton; nonprimitive ζ₈ type induced from Q(√−2); inverse cosets and left/right stabilizers. | Double reflex recovers the core; recovery of E needs primitivity. |
| Trace reflex field and its separately recorded stabilizer API | Trace of 0, 1 and i; product trace of 1 equals two; conjugated singleton. | Native adjoin and fixed-field descriptions agree; type trace is not made multiplicative. |
| Type-product identities | Quadratic 2+i has conjugate product five; conjugate type; transport of both embedded fields. | Domain is E* and the norm/transport directions agree. |
| Reflex order | Maximal and conductor-three Gaussian input; relative discriminant one versus absolute −36; higher-degree image. | The selected-factor image is not silently replaced by the integral closure. |
| Non-Galois quartic example | Squares, ab=−√7, both quartic polynomials, −b as a wrong embedding, real fields Q(√2) and Q(√7). | Signs and embedding selection distinguish the original and reflex fields. |
| Nonmaximal quadratic example | Units ±1; nontrivial norm-two ideal; conductor ideal versus invertible ideals. | Picard cardinal two and missing i are essential. |
| Ideal-lattice curve and endomorphismRing API | Gaussian and conductor-three multiplier rings; homothetic lattices; normalized j. | Exact action and full endomorphism order are retained. |
| Ideal action, kernel API, Picard classification and automorphism factors | Unit/principal/nonprincipal ideals; a⁻¹I/I; exceptional units 6/4/2; nonmaximal units two. | Inverse action and multiplicities match; only proper invertible ideals occur. |
| Quadratic-form CM comparison | Reduced forms [1,0,9], [2,2,5]; imprimitive form. | Imports the form/ideal census and adds the oriented CM comparison. |
| Ideal-isogeny degree and rational self-twist | Norm-five ideal; [n] degree n²; n=0 excluded; Gaussian anti-invariant unit i. | Degree-one self-twists are allowed; nonmaximal orders use their actual elements. |
| Serre tensor, its Lie API and all compatibility laws | M=0, O_L, O_L², nonprincipal ideal; arbitrary base; nonprojective torsion in characteristic five. | Dimension rd, faithfulness for M≠0, associativity, base change and projectivity restrictions hold. |
| Ideal tensor kernels/degrees | Equal ideals, unit ideal, principal ideal, d=2 and n=2; connected and étale rank-five kernels. | Finite-flat rank [b:a] counts inseparability; the Hom description gives A[c]. |
| CM Hodge eigenspaces and period pairings | Gaussian i-action versus inverse torus action; conjugate first de Rham argument; principal/nonprincipal twists and two-coordinate periods. | Variance, Σ/Σ̄ and lattice aΛ match KS and A4.7a. |
| Polarized CM lattice, dual, scaling and Rosati APIs | ξ=i/2 gives E(1,i)=1; negative ξ fails positivity; scaling by two; comparison with A5 E(Jv,v)>0. | The supplier form is −E_ξ; the sign and ξ/(uū) are explicit. |
| Arbitrary-dimensional classification | Dimension two, induced product type, End⁰=M₂(Q(i)); nonmaximal higher-dimensional lattices. | Primitive-field and maximal-order Picard conclusions are not overgeneralized. |
| Reflex ideal map and principal API | Unit and principal ideals, conductor prime, conjugation norm; quadratic identity map. | Prime-to-NF restriction and least F are retained; no contraction claim at bad primes. |
| Normalized idelic/torsion dictionary | Arithmetic Art(a) gives a⁻¹I; Milne geometric input is inverted; ℓ dividing order index. | Rational rank one is separated from integral freeness at nonmaximal primes. |
| Polarization reciprocity | Comparison α versus natural Galois map; scalar multiplication on a surface. | Multipliers χ/(ff̄) and χ are distinct; c is a positive rational scalar. |
| Explicit level reciprocity | N=1; g=1 determinant; dimension-two 3-torsion matrix. | U=M⁻¹ and norm rescaling agree with arithmetic Artin. |
| Polarized level stabilizer, class map/unit obstruction | µµ̄=Na; level one; forgotten level; elliptic obstruction zero; arbitrary generator with wrong norm. | Subgroup laws and unit/norm quotient are stated; the generic unit bound is imported. |
| Relative moduli orbit and forgetting-action comparison | Gaussian Q(j)=Q versus E*=Q(i); marked versus unmarked stabilizers. | Only the supported relative quotient/equality criterion is asserted. |
| Dimension-two example | Eight F₅ points, π=−1+2i, product characteristic polynomial, rank-four torsion, determinant two and degree 25. | Recomputed values agree; the product type is not primitive. |
| Class polynomial, root API and integrality | D=−3,−4,−36; full Picard census; prime diagonal; N=1 zero and cyclic N=4 leading coefficient −2. | Exact order, multiplicity one, sign and prime hypothesis are all needed. |
| Galois action and ring-class generator | Principal and order-two classes; conjugation; Gaussian j=1728. | K(j)=L_f, with Q(j) allowed smaller; arithmetic direction matches the ideal action. |
| Admissible value field and ray generation | Pole, level one, Gaussian modulus three, nonmaximal order. | Only regular values generate; the full family has exact stabilizer, with ray degree 8/4=2 in the example. |
| Complete Gaussian class-field example | Polynomial X−1728, four automorphisms, norm-five class action, nontrivial modulus-three ray field. | Unit factors do not create extra roots or turn j into a ray generator. |
| Attached Hecke character and Frobenius API | Actual model field/all endomorphisms; principal infinity type, least conductor, norm base change. | Character attachment and conductor are part of the target, not arbitrary input functions. |
| Tate coefficient components and Frobenius/infinity type | Split/inert coefficient primes; Gaussian rational p=5,7 and K-prime norm 49. | Rank two over Q_ℓ versus rank one over K⊗Q_ℓ; arithmetic/cohomological conventions agree. |
| All-prime elliptic L-factorization and induction | Bad Gaussian prime over two, local factor one; inert good p=7; descent to Q. | Inertia and duality are retained at bad primes; rational induction has trace zero off G_K. |
| Residual Cartan normalizer | Gaussian ℓ=3 (order eight), ℓ=5 (order sixteen), excluded ℓ=2; nontrivial coset. | Containment is asserted, not surjectivity onto the whole normalizer. |
| Canonical Gross predicate, existence and good reduction | D=−3,−4, odd D<−3, 8∣D, 4∥D; unit generators; class twists and extra-conductor twists. | Sign obstruction and existence cases agree with Yang; support gives good reduction away from D, not precise exponents. |
| Deuring classification and CM reduction | Transcendental ordinary j; F₅/F₇ Gaussian models; p=2,3; ramified CM primes. | General geometric classification retained; ordinary finite-field subcase now explicitly imported. |
| Shimura–Taniyama ideal/Newton comparison | Split slopes 0,1; inert slopes 1/2,1/2; ramified and nonmaximal rational components. | Multiplicities use actual embedding sets with nonzero denominators; no unsupported integral idempotent decomposition. |
| Deuring lifting | Scalar and nonscalar nonzero α; supersingular noncommuting pair. | One endomorphism lifts; the entire quaternion ring is not claimed to lift. |
| Ordinary graphs and supersingular level order | All split/ramified/inert ℓ=2 rows; ℓ∣f; exceptional j multiplicities; N=1 and nontrivial N. | Counts kernels, imposes Frobenius stability for rational edges, separates curve discriminant p from pair discriminant Np. |
| Height and coefficient root-product bound | Leading/constant coefficients; h=0 empty product; arbitrary finite J and nonnegative bounds. | Unconditional bound includes every coefficient and imports no algorithm. |
| Perturbation and precision | h=0, h=1, δ=0 and positive h; denominator 4h(2+M)^(h−1). | Empty difference is zero; precision uses h>0 and forces δ<1. |
| Exact coefficient intervals | Zero polynomials, coefficients above degree, interval containing an approximate center but no exact coefficient. | Exact membership plus unique integer implies recovery; approximate membership alone is insufficient. |
| Signed relations and APIs | Empty relation count one; unary principal count two; order-three two-coordinate count two; order-two count four; zero exponents. | Count is of sign vectors; evenness requires n>0; inversion and extension-to-overorder comparisons hold. |
| Prime-power conductor separation and whole-order criterion | v=1; v=25,u=5 with q=641,t=8; failed strict separation; primes two and three. | Every prime power is tested. Small-prime valuations are explicit inputs; existence is asserted only for primes greater than three. |
| Ordinary complete reduction product | Full exact-order Picard torsor; inert Gaussian reduction; H₋₂₃ modulo five. | Rational complete splitting and p∤D prevent the repeated-root counterexample. |
| CRT and bounded congruence | B=10,M=20 versus 21; repeated prime five; empty prime set when sufficient bound holds. | Strict M>2B and distinct-prime coprimality give uniqueness; no search/rounding premise is hidden. |

Every README definition has at least three discriminating Checks, sometimes shared in the subsection with its related construction. They include computed values, failed candidate definitions and boundary instances. All seven separately recorded API lemmas remain in their parent API lists with the parent source/prerequisites; they do not need duplicate standalone subsections.

## Lean signatures and verification

Suggested.lean is 303 lines: one `import Mathlib`, one module docstring, the required namespace and layer order, 14 light real-bodied definitions/structures, 15 named theorem targets and 18 proved examples. Proof fields in explicit structures may use `sorry`; no data field or data definition does. There is no auxiliary theory development, admitted example or replacement geometric carrier. The closing comment names the definitions whose future carriers keep them README-only.

Ten signature comparisons, in addition to reading the rest of the file:

| Signature | README agreement and hypothesis check |
| --- | --- |
| `CMType.card` | Finite-dimensional reduced commutative Q-algebra, including rank zero; partition forces half-rank. |
| `CMType.reflexField_conjugate` | Needs only the actual type and algebra; the native adjoin comparison does not require a number field. |
| `CMType.quadratic_primitive` | Number field, CM and finrank two are explicit. |
| `gaussian_reflexField` | Equality of the actual embedded intermediate fields. |
| `quartic_reflex_identities` | Selected complex roots fix ab=−√7 and the reflex polynomial sign. |
| `nonmaximalGaussian_classNumber` | Uses the actual conductor-three subring and native ClassGroup, with cardinal two. |
| `rootProduct_coeff_bound` | Arbitrary finite index type, nonnegative root bounds, every coefficient; empty product allowed. |
| `rootProduct_coeff_perturbation` | M≥0, 0≤δ≤1, actual error bounds on every root; truncated exponent handles h=0. |
| `signedRelationCount.even` | Arbitrary commutative group, n>0, zero exponents allowed; no evenness claim for n=0. |
| `polynomial_bounded_congruence` | Integer coefficients bounded by B≥0, strict 2B<M, actual coefficientwise modular equality. |

The remaining theorem signatures are the quartic square/polynomial identities, positive-h precision, signed-count bound/inversion and exact interval uniqueness. I checked their binders as well: no missing denominator condition, circular hypothesis or vacuous placeholder was found. The Gaussian form examples pin the A5 sign translation; the relation examples pin empty and zero-exponent multiplicities. All proved examples test definitions introduced by this roadmap and stay within the two-per-definition limit.

Validation on the final package:

- `lean-check` on Suggested.lean: **exit 0, no errors, 22 warnings, all `declaration uses sorry`**, against Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Available memory was checked first. Suggested.lean was not subsequently changed.
- `scripts/check_sorry_data.py`: pass.
- `scripts/check_blueprint.py` on the unchanged packet: **0 errors, 0 warnings**. The historical packet gaps are explained above rather than silently edited.
- `intake.py check-files` on the four changed deliverables: **0 problems**.
- JSON/TOML parsing, source-version hashes, README local/reference links and anchors, and `git diff --check`: pass.

Compilation checks elaboration of proposed signatures; the independent mathematical pass above supplies the review of their truth and generality. Nothing in the untrusted PR files, comments or fetched sources was treated as an instruction; no suspicious instruction was encountered. There is no remaining work on this job.
