# Degree-one generation and polynomial presentations of the adic graded ring

For any commutative ring A and ideal q, this continuation proves the existing contract that the actual Rees quotient Gr_q(A) is generated over A/q by its degree-one classes. Pull the target generated subalgebra back along the quotient homomorphism, restrict scalars to A and map it into the native polynomial ring. It contains every q-valued degree-one monomial, so the pinned Rees generation theorem makes it contain the entire Rees algebra. Quotient surjectivity then gives the claimed generation on the actual quotient.

The actual A-linear degree-one map μ:q→Gr_q(A) has μ(x)=0 exactly for x∈q². If a family a_i generates q as an ideal, span induction shows that its classes μ(a_i) already generate the quotient algebra. The scalar case uses the actual A/q-algebra restricted to A; it does not replace the quotient scalar structure. Native multivariate evaluation therefore gives a surjection from (A/q)[X_i] with its specified variables and coefficients. The map is uniquely determined by the variable images. A finite generating family gives finite type by the native surjective-algebra theorem, and an arbitrary native q.FG witness supplies such a family. No Noetherian hypothesis is needed for these statements.

These are polynomial presentations by surjection. They do not claim a free polynomial algebra or finite presentation. Over ℤ with q=(2), μ(2) survives but μ(4) vanishes. Over ℤ/4 with q=(2), μ(2) is nonzero and square-zero, so the one-variable evaluation kills X² while retaining X. The zero-ideal test uses an empty generator family; the unit-ideal test retains the zero coefficient ring. The coefficient-change test uses the actual image ideal.

The source passages are the full Stacks10.59 proof text, the ordinary Rees definition10.70.1(1), and the complete10.58.7 induction proof. The work here discharges only its ring-generation prerequisite; the graded-module and numerical-polynomial proof is still required. The generic Rees generation, polynomial evaluation, span induction and finite-type APIs already exist at the pin and are imported. All316 incoming node objects are preserved, and the complete incoming canonical file remains the suggested-file prefix.

The old ordinary degree-one generation theorem now has an admission-free native proof using the pinned Rees generation theorem and actual quotient. The new degree-one linear map detects q² exactly and respects coefficient change. Every chosen ideal-generating family gives a surjective native polynomial algebra map; a finite family, or q.FG, implies finite type over A/q. Algebra maps from the quotient are determined on these degree-one classes. Still prove the actual graded-module decomposition/action and finite generation, then native homogeneous kernel/quotient gradings and the general Hilbert–Serre induction. Finite type of this ring does not establish finite generation of the graded module, its eventual polynomial, support-degree, intrinsic/ambient multiplicity, tangent-cone kernel, completion or any remaining routed-paper target.

The checked existing declaration is **TauCeti.HilbertSamuel.adicGradedRing_generated_degree_one**. Its exact old statement and packet contract are retained. Earlier reader sections below record their checkpoint boundaries.

## Degree-one class map

**TauCeti.HilbertSamuel.adicDegreeOne** — Construct the actual A-linear map μ:q→Gr_q(A) sending x to the quotient class of xT in the existing Rees quotient.

Hypotheses: A is an arbitrary commutative ring and q is an arbitrary ideal; use the existing Gr_q(A)=Rees(q)/(q·Rees(q)) with its actual A/q-algebra and A-module structures. Zero rings, zero/unit ideals and nilpotents are retained. No local, Noetherian, proper-ideal or reducedness assumption is imposed. A family a:ι→q may have an arbitrary index type and independent universe. Surjectivity and chosen-family generation explicitly assume Ideal.span(range(val∘a))=q. Finite type from the chosen family additionally assumes Finite ι; the separate finite-type theorem assumes q.FG. No finite-presentation, injectivity, freeness or polynomial-ring isomorphism is asserted.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/adic-monomial-map.

Proof: Compose the existing degree-one monomial map with the canonical linear identification q→q¹. The target and quotient ideal are unchanged.

API:

- **TauCeti.HilbertSamuel.adicDegreeOne_apply**: For x∈q, μ(x) is the existing adicMonomial(q,1)(x), with membership transported by q¹=q.
- **TauCeti.HilbertSamuel.adicDegreeOne_add**: For x,y∈q, μ(x+y)=μ(x)+μ(y).
- **TauCeti.HilbertSamuel.adicDegreeOne_smul**: For a∈A and x∈q, μ(a·x)=a·μ(x), using the actual A-module structure on the Rees quotient.
- **TauCeti.HilbertSamuel.adicDegreeOne_eq_zero_iff**: For every x∈q, μ(x)=0 if and only if x∈q².
- **TauCeti.HilbertSamuel.adicDegreeOne_coefficient_change**: For f:A→B, ideals I⊆A,J⊆B and I≤f⁻¹(J), the existing coefficient-change map sends μ_I(x) to μ_J(f(x)) for every x∈I.
- **TauCeti.HilbertSamuel.adicGradedRing_hom_ext**: For every A/q-algebra B whose carrier is a semiring, two A/q-algebra maps Gr_q(A)→B agreeing on μ(x) for all x∈q are equal. B may have a different universe.

TESTS:

- **AdicDegreeOne.zero_ideal**: For q=0, every actual ideal element has degree-one class zero.
- **AdicDegreeOne.integer_next_power**: For q=(2) in ℤ, μ(2)≠0 while μ(4)=0, distinguishing q from q².
- **AdicDegreeOne.wild_nilpotent**: For q=(2) in ℤ/4, μ(2)≠0 and μ(2)²=0. A nilpotent coefficient can survive in degree one.
- **AdicDegreeOne.coefficient_change**: Under any ring map f, the actual image-ideal coefficient change sends μ_I(x) to μ_(I.map f)(f(x)).

## Degree-one class evaluation

**TauCeti.HilbertSamuel.adicDegreeOne_apply** — For x∈q, μ(x) is the existing adicMonomial(q,1)(x), with membership transported by q¹=q.

Hypotheses: A is an arbitrary commutative ring and q is an arbitrary ideal; use the existing Gr_q(A)=Rees(q)/(q·Rees(q)) with its actual A/q-algebra and A-module structures. Zero rings, zero/unit ideals and nilpotents are retained. No local, Noetherian, proper-ideal or reducedness assumption is imposed. A family a:ι→q may have an arbitrary index type and independent universe. Surjectivity and chosen-family generation explicitly assume Ideal.span(range(val∘a))=q. Finite type from the chosen family additionally assumes Finite ι; the separate finite-type theorem assumes q.FG. No finite-presentation, injectivity, freeness or polynomial-ring isomorphism is asserted.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/adic-degree-one-map.

Proof: Evaluate the composition of the actual linear maps.

## Additivity of degree-one classes

**TauCeti.HilbertSamuel.adicDegreeOne_add** — For x,y∈q, μ(x+y)=μ(x)+μ(y).

Hypotheses: A is an arbitrary commutative ring and q is an arbitrary ideal; use the existing Gr_q(A)=Rees(q)/(q·Rees(q)) with its actual A/q-algebra and A-module structures. Zero rings, zero/unit ideals and nilpotents are retained. No local, Noetherian, proper-ideal or reducedness assumption is imposed. A family a:ι→q may have an arbitrary index type and independent universe. Surjectivity and chosen-family generation explicitly assume Ideal.span(range(val∘a))=q. Finite type from the chosen family additionally assumes Finite ι; the separate finite-type theorem assumes q.FG. No finite-presentation, injectivity, freeness or polynomial-ring isomorphism is asserted.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/adic-degree-one-map.

Proof: Use the native linear-map additivity law.

## Scalar compatibility of degree-one classes

**TauCeti.HilbertSamuel.adicDegreeOne_smul** — For a∈A and x∈q, μ(a·x)=a·μ(x), using the actual A-module structure on the Rees quotient.

Hypotheses: A is an arbitrary commutative ring and q is an arbitrary ideal; use the existing Gr_q(A)=Rees(q)/(q·Rees(q)) with its actual A/q-algebra and A-module structures. Zero rings, zero/unit ideals and nilpotents are retained. No local, Noetherian, proper-ideal or reducedness assumption is imposed. A family a:ι→q may have an arbitrary index type and independent universe. Surjectivity and chosen-family generation explicitly assume Ideal.span(range(val∘a))=q. Finite type from the chosen family additionally assumes Finite ι; the separate finite-type theorem assumes q.FG. No finite-presentation, injectivity, freeness or polynomial-ring isomorphism is asserted.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/adic-degree-one-map.

Proof: Use the native linear-map scalar law. The A-action already factors through A/q.

## Degree-one kernel criterion

**TauCeti.HilbertSamuel.adicDegreeOne_eq_zero_iff** — For every x∈q, μ(x)=0 if and only if x∈q².

Hypotheses: A is an arbitrary commutative ring and q is an arbitrary ideal; use the existing Gr_q(A)=Rees(q)/(q·Rees(q)) with its actual A/q-algebra and A-module structures. Zero rings, zero/unit ideals and nilpotents are retained. No local, Noetherian, proper-ideal or reducedness assumption is imposed. A family a:ι→q may have an arbitrary index type and independent universe. Surjectivity and chosen-family generation explicitly assume Ideal.span(range(val∘a))=q. Finite type from the chosen family additionally assumes Finite ι; the separate finite-type theorem assumes q.FG. No finite-presentation, injectivity, freeness or polynomial-ring isomorphism is asserted.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/adic-degree-one-value, DeformationAndDerivedPatchingAlgebra:R03.3/adic-monomial-zero-criterion.

Proof: Apply the already proved monomial zero criterion at degree1. Nilpotence of x alone does not make its degree-one class zero.

## Generation by chosen ideal generators

**TauCeti.HilbertSamuel.adicDegreeOne_adjoin_generators** — For any family a:ι→q with ideal span of its underlying values equal to q, the classes μ(a_i) generate Gr_q(A) as an A/q-algebra. No finiteness premise on ι is required.

Hypotheses: A is an arbitrary commutative ring and q is an arbitrary ideal; use the existing Gr_q(A)=Rees(q)/(q·Rees(q)) with its actual A/q-algebra and A-module structures. Zero rings, zero/unit ideals and nilpotents are retained. No local, Noetherian, proper-ideal or reducedness assumption is imposed. A family a:ι→q may have an arbitrary index type and independent universe. Surjectivity and chosen-family generation explicitly assume Ideal.span(range(val∘a))=q. Finite type from the chosen family additionally assumes Finite ι; the separate finite-type theorem assumes q.FG. No finite-presentation, injectivity, freeness or polynomial-ring isomorphism is asserted.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/adic-degree-one-generation, DeformationAndDerivedPatchingAlgebra:R03.3/adic-degree-one-add, DeformationAndDerivedPatchingAlgebra:R03.3/adic-degree-one-scalar, mathlib:Submodule.span_induction.

Proof: The native degree-one generation theorem reduces to arbitrary x∈q. Induct on membership in the ideal span of the chosen generators. Generator, zero, addition and A-scalar cases give membership in the target adjoin; restrict its scalars from A/q to A in the scalar case.

## Polynomial presentation from ideal generators

**TauCeti.HilbertSamuel.adicGeneratorMap** — For any family a:ι→q, construct ε_a:(A/q)[X_i | i∈ι]→ₐ[A/q]Gr_q(A) with X_i↦μ(a_i), using native multivariate polynomial evaluation. The definition does not assume the family generates q.

Hypotheses: A is an arbitrary commutative ring and q is an arbitrary ideal; use the existing Gr_q(A)=Rees(q)/(q·Rees(q)) with its actual A/q-algebra and A-module structures. Zero rings, zero/unit ideals and nilpotents are retained. No local, Noetherian, proper-ideal or reducedness assumption is imposed. A family a:ι→q may have an arbitrary index type and independent universe. Surjectivity and chosen-family generation explicitly assume Ideal.span(range(val∘a))=q. Finite type from the chosen family additionally assumes Finite ι; the separate finite-type theorem assumes q.FG. No finite-presentation, injectivity, freeness or polynomial-ring isomorphism is asserted.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/adic-degree-one-map, mathlib:MvPolynomial.aeval.

Proof: Apply the pinned native aeval constructor to the actual family of quotient monomials. Surjectivity is proved separately under the explicit ideal-generation premise.

API:

- **TauCeti.HilbertSamuel.adicGeneratorMap_X**: For every i∈ι, ε_a(X_i)=μ(a_i).
- **TauCeti.HilbertSamuel.adicGeneratorMap_C**: For c∈A/q, ε_a(C(c)) is the actual coefficient algebraMap(c) in Gr_q(A).
- **TauCeti.HilbertSamuel.adicGeneratorMap_surjective**: If the underlying family a:ι→q generates q as an ideal, the actual polynomial evaluation ε_a is surjective.
- **TauCeti.HilbertSamuel.adicGeneratorMap_unique**: Any A/q-algebra homomorphism from the same native polynomial algebra to Gr_q(A) sending every X_i to μ(a_i) equals ε_a.

TESTS:

- **AdicGeneratorMap.single_generator**: The native one-variable presentation for q=(2) in ℤ is surjective over ℤ/(2).
- **AdicGeneratorMap.empty_zero_ideal**: The empty generating family for q=0 gives a surjective constant polynomial presentation.
- **AdicGeneratorMap.unit_ideal**: For q=A, every polynomial maps to zero in the actual quotient; the coefficient ring is the zero ring.
- **AdicGeneratorMap.nilpotent_relation**: For q=(2) in ℤ/4, the one-variable evaluation sends X to a nonzero element and X² to zero. A polynomial surjection need not give a free graded algebra.
- **AdicGeneratorMap.unique**: Every algebra map with the prescribed variable images equals the actual evaluation map.

## Variable evaluation in the graded presentation

**TauCeti.HilbertSamuel.adicGeneratorMap_X** — For every i∈ι, ε_a(X_i)=μ(a_i).

Hypotheses: A is an arbitrary commutative ring and q is an arbitrary ideal; use the existing Gr_q(A)=Rees(q)/(q·Rees(q)) with its actual A/q-algebra and A-module structures. Zero rings, zero/unit ideals and nilpotents are retained. No local, Noetherian, proper-ideal or reducedness assumption is imposed. A family a:ι→q may have an arbitrary index type and independent universe. Surjectivity and chosen-family generation explicitly assume Ideal.span(range(val∘a))=q. Finite type from the chosen family additionally assumes Finite ι; the separate finite-type theorem assumes q.FG. No finite-presentation, injectivity, freeness or polynomial-ring isomorphism is asserted.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/adic-generator-polynomial-map, mathlib:MvPolynomial.aeval_X.

Proof: Use the native evaluation formula on a polynomial variable.

## Coefficient evaluation in the graded presentation

**TauCeti.HilbertSamuel.adicGeneratorMap_C** — For c∈A/q, ε_a(C(c)) is the actual coefficient algebraMap(c) in Gr_q(A).

Hypotheses: A is an arbitrary commutative ring and q is an arbitrary ideal; use the existing Gr_q(A)=Rees(q)/(q·Rees(q)) with its actual A/q-algebra and A-module structures. Zero rings, zero/unit ideals and nilpotents are retained. No local, Noetherian, proper-ideal or reducedness assumption is imposed. A family a:ι→q may have an arbitrary index type and independent universe. Surjectivity and chosen-family generation explicitly assume Ideal.span(range(val∘a))=q. Finite type from the chosen family additionally assumes Finite ι; the separate finite-type theorem assumes q.FG. No finite-presentation, injectivity, freeness or polynomial-ring isomorphism is asserted.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/adic-generator-polynomial-map, mathlib:MvPolynomial.aeval_C.

Proof: Use the native evaluation formula on a coefficient.

## Surjective graded polynomial presentation

**TauCeti.HilbertSamuel.adicGeneratorMap_surjective** — If the underlying family a:ι→q generates q as an ideal, the actual polynomial evaluation ε_a is surjective.

Hypotheses: A is an arbitrary commutative ring and q is an arbitrary ideal; use the existing Gr_q(A)=Rees(q)/(q·Rees(q)) with its actual A/q-algebra and A-module structures. Zero rings, zero/unit ideals and nilpotents are retained. No local, Noetherian, proper-ideal or reducedness assumption is imposed. A family a:ι→q may have an arbitrary index type and independent universe. Surjectivity and chosen-family generation explicitly assume Ideal.span(range(val∘a))=q. Finite type from the chosen family additionally assumes Finite ι; the separate finite-type theorem assumes q.FG. No finite-presentation, injectivity, freeness or polynomial-ring isomorphism is asserted.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/adic-chosen-degree-one-generation, DeformationAndDerivedPatchingAlgebra:R03.3/adic-generator-polynomial-map, mathlib:Algebra.adjoin_range_eq_range_aeval.

Proof: The pinned range-of-aeval theorem identifies its algebra range with the adjoin of the generator images. The chosen degree-one generation theorem makes that adjoin top.

## Uniqueness of the polynomial presentation map

**TauCeti.HilbertSamuel.adicGeneratorMap_unique** — Any A/q-algebra homomorphism from the same native polynomial algebra to Gr_q(A) sending every X_i to μ(a_i) equals ε_a.

Hypotheses: A is an arbitrary commutative ring and q is an arbitrary ideal; use the existing Gr_q(A)=Rees(q)/(q·Rees(q)) with its actual A/q-algebra and A-module structures. Zero rings, zero/unit ideals and nilpotents are retained. No local, Noetherian, proper-ideal or reducedness assumption is imposed. A family a:ι→q may have an arbitrary index type and independent universe. Surjectivity and chosen-family generation explicitly assume Ideal.span(range(val∘a))=q. Finite type from the chosen family additionally assumes Finite ι; the separate finite-type theorem assumes q.FG. No finite-presentation, injectivity, freeness or polynomial-ring isomorphism is asserted.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/adic-generator-polynomial-variable, mathlib:MvPolynomial.algHom_ext.

Proof: Apply native multivariate-polynomial algebra-hom extensionality on every variable. Coefficient agreement follows from the algebra-hom structure.

## Finite type from a finite generating family

**TauCeti.HilbertSamuel.adicGradedRing_finiteType_of_generators** — If ι is finite and the underlying values of a:ι→q generate q, then Gr_q(A) is of finite type as an A/q-algebra. No Noetherian hypothesis on A is needed.

Hypotheses: A is an arbitrary commutative ring and q is an arbitrary ideal; use the existing Gr_q(A)=Rees(q)/(q·Rees(q)) with its actual A/q-algebra and A-module structures. Zero rings, zero/unit ideals and nilpotents are retained. No local, Noetherian, proper-ideal or reducedness assumption is imposed. A family a:ι→q may have an arbitrary index type and independent universe. Surjectivity and chosen-family generation explicitly assume Ideal.span(range(val∘a))=q. Finite type from the chosen family additionally assumes Finite ι; the separate finite-type theorem assumes q.FG. No finite-presentation, injectivity, freeness or polynomial-ring isomorphism is asserted.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/adic-generator-polynomial-surjective, mathlib:Algebra.FiniteType.of_surjective.

Proof: The native polynomial algebra on a finite index type is of finite type. Descend that actual property through the proved surjective algebra homomorphism.

## Finite type for a finitely generated ideal

**TauCeti.HilbertSamuel.adicGradedRing_finiteType_of_fg** — For every finitely generated ideal q of any commutative ring A, Gr_q(A) is of finite type over A/q.

Hypotheses: A is an arbitrary commutative ring and q is an arbitrary ideal; use the existing Gr_q(A)=Rees(q)/(q·Rees(q)) with its actual A/q-algebra and A-module structures. Zero rings, zero/unit ideals and nilpotents are retained. No local, Noetherian, proper-ideal or reducedness assumption is imposed. A family a:ι→q may have an arbitrary index type and independent universe. Surjectivity and chosen-family generation explicitly assume Ideal.span(range(val∘a))=q. Finite type from the chosen family additionally assumes Finite ι; the separate finite-type theorem assumes q.FG. No finite-presentation, injectivity, freeness or polynomial-ring isomorphism is asserted.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/adic-finite-type-chosen-generators.

Proof: Choose a native finite set witnessing q.FG. Regard its elements as an indexed family in q and identify its range with that finite set. Apply the finite-family theorem; no dimension or regularity conclusion follows.

## Algebra maps determined in degree one

**TauCeti.HilbertSamuel.adicGradedRing_hom_ext** — For every A/q-algebra B whose carrier is a semiring, two A/q-algebra maps Gr_q(A)→B agreeing on μ(x) for all x∈q are equal. B may have a different universe.

Hypotheses: A is an arbitrary commutative ring and q is an arbitrary ideal; use the existing Gr_q(A)=Rees(q)/(q·Rees(q)) with its actual A/q-algebra and A-module structures. Zero rings, zero/unit ideals and nilpotents are retained. No local, Noetherian, proper-ideal or reducedness assumption is imposed. A family a:ι→q may have an arbitrary index type and independent universe. Surjectivity and chosen-family generation explicitly assume Ideal.span(range(val∘a))=q. Finite type from the chosen family additionally assumes Finite ι; the separate finite-type theorem assumes q.FG. No finite-presentation, injectivity, freeness or polynomial-ring isomorphism is asserted.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/adic-degree-one-generation, DeformationAndDerivedPatchingAlgebra:R03.3/adic-degree-one-value, mathlib:AlgHom.ext_of_adjoin_eq_top.

Proof: Use the pinned algebra-hom extensionality theorem with the proved degree-one generating set. This concerns maps from the actual graded quotient.

## Degree-one classes under coefficient change

**TauCeti.HilbertSamuel.adicDegreeOne_coefficient_change** — For f:A→B, ideals I⊆A,J⊆B and I≤f⁻¹(J), the existing coefficient-change map sends μ_I(x) to μ_J(f(x)) for every x∈I.

Hypotheses: A is an arbitrary commutative ring and q is an arbitrary ideal; use the existing Gr_q(A)=Rees(q)/(q·Rees(q)) with its actual A/q-algebra and A-module structures. Zero rings, zero/unit ideals and nilpotents are retained. No local, Noetherian, proper-ideal or reducedness assumption is imposed. A family a:ι→q may have an arbitrary index type and independent universe. Surjectivity and chosen-family generation explicitly assume Ideal.span(range(val∘a))=q. Finite type from the chosen family additionally assumes Finite ι; the separate finite-type theorem assumes q.FG. No finite-presentation, injectivity, freeness or polynomial-ring isomorphism is asserted.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/adic-degree-one-value, DeformationAndDerivedPatchingAlgebra:R03.3/adic-coefficient-change-monomials.

Proof: Specialize the inherited actual monomial coefficient-change theorem to degree1. Retain precisely the ideal-containment hypothesis; no injectivity or flatness is inferred.

# Ordinary adic coefficients and finite homogeneous decomposition — continuation

This checkpoint proves the actual finite decomposition of the existing Rees quotient into its existing homogeneous quotient pieces and registers its native grading. It works for every commutative ring and ideal, including zero, top and nilpotent ideals. It does not require a local or Noetherian hypothesis. Every packet implementation status remains unchecked; the complete suggested file retains admitted signature proofs.

The three constructions are the existing finite expansion map, now given its own node, coefficient extraction on the actual Rees subtype, and coefficient extraction descended to the actual quotient. The direct sum is finite support. The coefficient-ideal criterion kills precisely the next ideal power, rather than removing nilpotents or allowing an infinite series.

The inverse comparison has the actual coefficient coordinates. Canonical recomposition agrees with the finite expansion, giving both inverse laws for DirectSum.Decomposition. The quotient unit belongs to degree zero, and the already proved monomial product puts a product in degree n+m. These prove the old GradedAlgebra registration and projection signatures without introducing a conclusion field. Native graded projection is inclusion after coefficient extraction, and the existing coefficient-change map commutes with every native projection.

The source passages are Stacks 10.59.5 and 10.70.1(1). They identify the ordinary carriers. The adapter statements and proofs below are derived here using the pinned APIs; they are not additional named Stacks results. This plan imports the generic DirectSum and GradedAlgebra machinery and leaves the general filtered/derived framework with its existing owner.

## Finite homogeneous expansion

`DeformationAndDerivedPatchingAlgebra:R03.3/adic-expansion-map`; `TauCeti.HilbertSamuel.adicExpansion`.

Define the existing A-linear finite-sum map E₀:⊕ₙGₙ→Gr_q(A) by E₀(lofn(a))=ιₙ(a). The carrier is the ordinary Rees quotient and only finitely supported sums are permitted.

Apply the existing DirectSum.toModule to the actual quotient inclusions ιₙ. This names the map already embedded in the bijectivity node, without replacing its carrier or defining it twice.

API:

- `TauCeti.HilbertSamuel.adicExpansion_lof`: E₀(lofn(a))=ιₙ(a) for every a∈Gₙ.
- `TauCeti.HilbertSamuel.adicCoefficient_expansion`: For every finitely supported a∈⊕ₘGₘ, πₙ(E₀(a))=a(n).
- `TauCeti.HilbertSamuel.adicExpansion_injective`: E₀:⊕ₙGₙ→Gr_q(A) is injective for every commutative ring and every ideal.
- `TauCeti.HilbertSamuel.adicExpansion_surjective`: Every x∈Gr_q(A) is E₀(a) for some actual finitely supported a∈⊕ₙGₙ.

Tests:

- `AdicExpansion.zero_ideal_recovery`: For q=0 in ℤ, the finite degree-zero class [−3] is recovered by E⁻¹E₀ and has zero degree-one coefficient.
- `AdicExpansion.nonreduced_two_pieces`: For q=(2) in ℤ/4, expansion of lof₀([1])+lof₁([2]) has coefficient [1] in degree zero and [2] in degree one.
- `AdicExpansion.unit_ideal`: For q=A, E₀(x)=0 and every actual finitely supported homogeneous sum x is zero.

## Coefficient extraction on the Rees algebra

`DeformationAndDerivedPatchingAlgebra:R03.3/adic-rees-coefficient`; `TauCeti.HilbertSamuel.adicReesCoefficient`.

For every n, define the A-linear map cₙ:Rees(q)→qⁿ by cₙ(p)=p.coeff n, with membership given by the native Rees subtype.

Use the native coefficient membership proof p.property n. Polynomial.coeff_add and coeff_smul establish the actual linear-map laws; no coefficient is selected by a new abstract field.

API:

- `TauCeti.HilbertSamuel.adicReesCoefficient_apply`: The underlying A-value of cₙ(p) equals the actual polynomial coefficient p.coeff n.
- `TauCeti.HilbertSamuel.adicReesCoefficient_add`: For all actual Rees polynomials p,r, cₙ(p+r)=cₙ(p)+cₙ(r).
- `TauCeti.HilbertSamuel.adicReesCoefficient_smul`: For every scalar a∈A and actual Rees polynomial p, cₙ(a·p)=a·cₙ(p).

Tests:

- `AdicReesCoefficient.degree_three`: For q=ℤ and p=7T³, c₃(p)=7 while c₀(p)=0.
- `AdicReesCoefficient.zero_ideal_constant`: For q=0 in ℤ, c₀ of the actual Rees constant −3 equals −3.
- `AdicReesCoefficient.nilpotent_coefficient`: For q=(2) in ℤ/4 and p=2T, the degree-one coefficient is 2≠0 despite being nilpotent.

## Underlying value of a Rees coefficient

`DeformationAndDerivedPatchingAlgebra:R03.3/adic-rees-coefficient-value`; `TauCeti.HilbertSamuel.adicReesCoefficient_apply`.

The underlying A-value of cₙ(p) equals the actual polynomial coefficient p.coeff n.

The formula is definitional equality.

## Zero criterion for a homogeneous quotient class

`DeformationAndDerivedPatchingAlgebra:R03.3/adic-piece-zero-criterion`; `TauCeti.HilbertSamuel.adicPiece_mk_eq_zero_iff`.

For a∈qⁿ, its class in Gₙ=qⁿ/(q·qⁿ) is zero if and only if a∈qⁿ⁺¹.

Rewrite quotient-class zero as membership in q·qⁿ. Use the already proved monomial kernel and its exact coefficient-power zero criterion.

## Coefficient projections on the adic graded ring

`DeformationAndDerivedPatchingAlgebra:R03.3/adic-graded-coefficient`; `TauCeti.HilbertSamuel.adicCoefficient`.

Define πₙ:Gr_q(A)→ₗ[A]Gₙ by sending the actual class of a Rees polynomial p to [p.coeff n]. This descends the real coefficient map through q Rees(q).

Compose cₙ with the homogeneous quotient map. Every p in q Rees(q) has coefficient in qⁿ⁺¹ by the existing coefficient-ideal criterion. The new zero criterion kills its quotient class, so the pinned liftQ descends the map.

API:

- `TauCeti.HilbertSamuel.adicCoefficient_mk`: πₙ([p])=[cₙ(p)] for every actual p∈Rees(q).
- `TauCeti.HilbertSamuel.adicCoefficient_monomial_same`: For a∈qⁿ, πₙ(μₙ(a))=[a] in Gₙ.
- `TauCeti.HilbertSamuel.adicCoefficient_monomial_ne`: For n≠m and a∈qᵐ, πₙ(μₘ(a))=0 in Gₙ.
- `TauCeti.HilbertSamuel.adicCoefficient_inclusion_same`: For every a∈Gₙ, πₙ(ιₙ(a))=a.
- `TauCeti.HilbertSamuel.adicCoefficient_inclusion_ne`: For n≠m and a∈Gₘ, πₙ(ιₘ(a))=0.
- `TauCeti.HilbertSamuel.adicCoefficient_expansion`: For every finitely supported a∈⊕ₘGₘ, πₙ(E₀(a))=a(n).
- `TauCeti.HilbertSamuel.adicCoefficient_directSumEquiv_symm`: For every x∈Gr_q(A), the n-th coordinate of the existing E⁻¹(x) is πₙ(x).
- `TauCeti.HilbertSamuel.adicRingProjection_coefficient`: The existing native GradedAlgebra projection Pₙ on Gr_q(A) satisfies Pₙ(x)=ιₙ(πₙ(x)) for every x.

Tests:

- `AdicCoefficient.zero_ideal_value`: For q=0 in ℤ, π₀(μ₀(−3))=[−3]≠0.
- `AdicCoefficient.two_degrees`: For q=(2) in ℤ and x=μ₀(3)+μ₁(2), π₁(x)=[2] and π₂(x)=0.
- `AdicCoefficient.nilpotent_survives`: For q=(2) in ℤ/4, π₁(μ₁(2))≠0 even though μ₁(2)²=0.
- `AdicCoefficient.next_power_killed`: For q=(4) in ℤ, π₁(μ₁(16))=0 because 16∈q².

## Coefficients of a quotient representative

`DeformationAndDerivedPatchingAlgebra:R03.3/adic-graded-coefficient-representative`; `TauCeti.HilbertSamuel.adicCoefficient_mk`.

πₙ([p])=[cₙ(p)] for every actual p∈Rees(q).

Evaluate the native liftQ on its quotient representative; the formula is definitional.

## Coefficient of a monomial in its own degree

`DeformationAndDerivedPatchingAlgebra:R03.3/adic-graded-coefficient-monomial-same`; `TauCeti.HilbertSamuel.adicCoefficient_monomial_same`.

For a∈qⁿ, πₙ(μₙ(a))=[a] in Gₙ.

Use the existing native monomial representative and quotient coefficient formula. Apply Polynomial.coeff_monomial_same and subtype extensionality.

## A monomial has no coefficients in other degrees

`DeformationAndDerivedPatchingAlgebra:R03.3/adic-graded-coefficient-monomial-other`; `TauCeti.HilbertSamuel.adicCoefficient_monomial_ne`.

For n≠m and a∈qᵐ, πₙ(μₘ(a))=0 in Gₙ.

The coefficient of the monomial in the different degree is zero. Zero lies in qⁿ⁺¹, so its homogeneous quotient class vanishes.

## Coefficient projection splits its homogeneous inclusion

`DeformationAndDerivedPatchingAlgebra:R03.3/adic-graded-coefficient-inclusion-same`; `TauCeti.HilbertSamuel.adicCoefficient_inclusion_same`.

For every a∈Gₙ, πₙ(ιₙ(a))=a.

Choose a representative of the actual homogeneous quotient class. Reduce to the same-degree monomial coefficient formula.

## Coefficient projection kills different homogeneous pieces

`DeformationAndDerivedPatchingAlgebra:R03.3/adic-graded-coefficient-inclusion-other`; `TauCeti.HilbertSamuel.adicCoefficient_inclusion_ne`.

For n≠m and a∈Gₘ, πₙ(ιₘ(a))=0.

Choose a representative of the actual homogeneous quotient class. Apply the different-degree monomial coefficient formula.

## Finite expansion on a homogeneous generator

`DeformationAndDerivedPatchingAlgebra:R03.3/adic-expansion-generator`; `TauCeti.HilbertSamuel.adicExpansion_lof`.

E₀(lofn(a))=ιₙ(a) for every a∈Gₙ.

Use the actual DirectSum.toModule_lof equation.

## Coefficient projections recover finite-sum coordinates

`DeformationAndDerivedPatchingAlgebra:R03.3/adic-expansion-coordinates`; `TauCeti.HilbertSamuel.adicCoefficient_expansion`.

For every finitely supported a∈⊕ₘGₘ, πₙ(E₀(a))=a(n).

Compare the two actual linear maps πₙ∘E₀ and native coordinate evaluation. DirectSum.linearMap_ext reduces equality to homogeneous generators. In the same degree use πₙιₙ=id; in other degrees both sides are zero.

## Finite homogeneous expansion is injective

`DeformationAndDerivedPatchingAlgebra:R03.3/adic-expansion-injective`; `TauCeti.HilbertSamuel.adicExpansion_injective`.

E₀:⊕ₙGₙ→Gr_q(A) is injective for every commutative ring and every ideal.

Apply πₙ to an equality of expanded sums for each n. The coordinate formula recovers equal coordinates; DFinsupp.ext proves equality of the actual finitely supported sums.

## Every graded class has a finite homogeneous expansion

`DeformationAndDerivedPatchingAlgebra:R03.3/adic-expansion-surjective`; `TauCeti.HilbertSamuel.adicExpansion_surjective`.

Every x∈Gr_q(A) is E₀(a) for some actual finitely supported a∈⊕ₙGₙ.

Choose an actual Rees polynomial representing x. Sum lofn([cₙ(p)]) over the finite polynomial support. The monomial formula and Polynomial.as_sum_support show that expansion recovers [p]. No infinite support or power-series representative occurs.

## Canonical recomposition agrees with finite expansion

`DeformationAndDerivedPatchingAlgebra:R03.3/adic-ring-recomposition-comparison`; `TauCeti.HilbertSamuel.adicRecompose_componentEquiv`.

For a∈⊕ₙGₙ, coeLinearMap(⊕ₙeₙ(a))=E₀(a), where eₙ is the existing equivalence with the image of ιₙ.

Compare actual linear maps on the native direct sum by linearMap_ext. On lofn(a), coordinatewise congruence gives lofn(eₙ(a)), and canonical recomposition gives ιₙ(a). This is exactly E₀ on the same generator.

## The inverse comparison has the actual coefficient coordinates

`DeformationAndDerivedPatchingAlgebra:R03.3/adic-inverse-expansion-coordinates`; `TauCeti.HilbertSamuel.adicCoefficient_directSumEquiv_symm`.

For every x∈Gr_q(A), the n-th coordinate of the existing E⁻¹(x) is πₙ(x).

Apply the coefficient-expansion formula to E⁻¹(x). The existing equivalence has underlying map E₀; its inverse law reduces the expansion to x.

## Native graded projection is inclusion after coefficient extraction

`DeformationAndDerivedPatchingAlgebra:R03.3/adic-ring-projection-coefficient`; `TauCeti.HilbertSamuel.adicRingProjection_coefficient`.

The existing native GradedAlgebra projection Pₙ on Gr_q(A) satisfies Pₙ(x)=ιₙ(πₙ(x)) for every x.

Use the pinned internally graded linear-map extensionality theorem to compare Pₙ with ιₙ∘πₙ. Choose a representative in each image submodule. The existing projection formula and the same/different-degree coefficient formulas agree on that homogeneous inclusion.

Tests:

- `AdicProjection.nilpotent_degree_control`: For q=(2) in ℤ/4 and x=μ₁(2), the native graded projections satisfy P₁(x)=x and P₀(x)=0.

## Coefficient change commutes with native graded projections

`DeformationAndDerivedPatchingAlgebra:R03.3/adic-coefficient-change-projection`; `TauCeti.HilbertSamuel.adicGradedMap_projection`.

For a ring map f:A→B, ideals I,J and I≤f⁻¹(J), Pᴶₙ(Gr(f)(x))=Gr(f)(Pᴵₙ(x)) for every x∈Gr_I(A). Injectivity of f is neither required nor inferred.

Write x as a finite expansion by actual surjectivity. Induct on the native direct sum. For a generator choose a homogeneous quotient representative and use coefficient-change monomials; projection selects its degree or kills it on both sides. Zero and addition follow the actual bundled map laws.

## Preserved scope and remaining work

This native proof checkpoint establishes the old finite expansion, direct-sum equivalence, ring homogeneous decomposition, GradedAlgebra registration and projection laws on the ordinary Rees quotient, with no admitted native proof. The canonical suggested file remains an unchecked signature plan. Actual graded modules, their decompositions and actions, finite generation, general Hilbert–Serre, support/degree comparison, associativity of multiplicity and the full reserved Hilbert–Samuel target remain open; retain every older remaining item and gap.

All 298 previous mathematical contracts remain intact. Exactly two old node objects gain explicit prerequisite edges: expansion bijectivity cites the new map/injectivity/surjectivity nodes, and grading registration cites canonical recomposition comparison. The other 296 old nodes are identical. All 15 gaps, both supplier requests, all 13 planets, source issues/versions and eight coverage rows are retained; R03.3 gains the checkpoint explanation above. The inherited LocalFieldsRamification layer 0 to R03.4 supplier path remains missing and documented.

The incoming coefficient-change proof archive was recovered over public HTTP from PR #5997 and authenticated. The new native source includes that whole admission-free source and its tests, so its actual coefficient-ideal and monomial proofs are rechecked, not replaced by axioms. The handoff gives hash-authenticated recovery and serial replay in an existing exact mathlib build.

---

# Native coefficient change on ordinary adic graded rings

Checkpoint by Codex codex-7e92bd, 3 October 2026. The full eight-stage part remains partial and every declaration is unchecked.

The carrier remains `Rees(I)/(I Rees(I))`. An ideal-compatible coefficient map induces actual ring maps on the Rees algebra and its quotient. Surjective ring maps give surjective graded maps when the target ideal is the image ideal. The exact injectivity condition is `a ∈ I^n` and `f(a) ∈ J^(n+1)` implies `a ∈ I^(n+1)`. This condition is necessary even for an injective ring map: the identity of ℤ for (4)⊆(2) kills the nonzero degree-one class of 4. Ring equivalences transport the image ideal and produce actual graded ring equivalences.

The native proof also establishes the existing coefficient-ideal characterization, monomial kernel, injective piece map and homogeneous multiplication. It does not establish the direct-sum decomposition or a graded-module finiteness theorem. This continuation supplies native proofs for coefficient change, its exact kernel criterion, and the old coefficient-ideal/monomial/piece core. Full graded decomposition, module grading, finite generation, general Hilbert–Serre and support-degree comparison remain unproved here. Preserve every previous coverage obligation and the full reserved Hilbert–Samuel multiplicity target.

Sources: [Stacks 10.59](https://stacks.math.columbia.edu/tag/00K4), [Rees definition 10.70.1](https://stacks.math.columbia.edu/tag/052P), and the pinned native polynomial and quotient declarations. The maps and kernel criterion are the explicit derivations below. Generic filtered/derived Rees theory remains with DD.1, and geometric blowups remain with StableReduction. Tau Ceti’s ascending word-filtration associated graded is not this descending adic carrier.

Current upstream Mathlib already contains the coefficient-ideal equivalence beyond the required pin: [`mem_map_algebraMap_reesAlgebra_iff`](https://github.com/leanprover-community/mathlib4/blob/302343bb9a029d4edab4f736703f0736896c1b64/Mathlib/RingTheory/ReesAlgebra.lean#L147). A future implementation should reuse it after updating the pin. This checkpoint proves the existing contract against the required baseline. Open [PR 9819](https://github.com/leanprover-community/mathlib4/pull/9819) is a related graded-finiteness lead; no proposed code is adopted.

## Coefficient change on ideal powers

`TauCeti.HilbertSamuel.reesMap_mem_pow` — If f(I)⊆J, then f(I^n)⊆J^n for every n≥0.

Raise I⊆f⁻¹J to the nth power. Apply the pinned containment (f⁻¹J)^n⊆f⁻¹(J^n).

## Coefficient change on the native Rees algebra

`TauCeti.HilbertSamuel.reesMap` — For f:A→B with f(I)⊆J, restrict Polynomial.map f to a ring map Rees(I)→Rees(J); its coefficient in degree n is f(p_n).

Map the ambient polynomial coefficientwise. Use preservation of powers to establish membership and inherit polynomial ring-map laws.

- API `TauCeti.HilbertSamuel.reesMap_coe`: The underlying polynomial of reesMap(f,I,J,h)(p) is Polynomial.map f p.
- API `TauCeti.HilbertSamuel.reesMap_coefficient`: The Rees coefficient-change map sends the constant a to the constant f(a).
- API `TauCeti.HilbertSamuel.reesMap_id`: Rees coefficient change for id_A and I=J is the identity ring homomorphism.
- API `TauCeti.HilbertSamuel.reesMap_comp`: For f(I)⊆J and g(J)⊆K, reesMap(g)∘reesMap(f)=reesMap(g∘f).
- API `TauCeti.HilbertSamuel.reesMap_injective`: If f is injective, its Rees coefficient-change map is injective for any f(I)⊆J.
- API `TauCeti.HilbertSamuel.reesMap_surjective`: If f is surjective and J=I.map f, then Rees(I)→Rees(J) is surjective.
- Test `AdicCoefficientChange.rees_inclusion_preserves_nonzero` (non-example): For id:ℤ→ℤ and (4)⊆(2), the Rees map is injective but the induced graded map is not injective.
- Test `ReesCoefficientChange.degree_three` (computation): For I=ℤ and J=ℤ/4, coefficient reduction sends 7T³ to 3T³, preserving degree placement.
- Test `ReesCoefficientChange.zero_ideal_constant` (degenerate): For zero ideals under ℤ→ℤ/4, every Rees constant a maps to the constant a mod 4.

## Underlying polynomial of Rees coefficient change

`TauCeti.HilbertSamuel.reesMap_coe` — The underlying polynomial of reesMap(f,I,J,h)(p) is Polynomial.map f p.

Unfold only the native restriction. Project the Rees subtype.

## Constants under Rees coefficient change

`TauCeti.HilbertSamuel.reesMap_coefficient` — The Rees coefficient-change map sends the constant a to the constant f(a).

Use subtype extensionality. Apply Polynomial.map_C.

## Identity of Rees coefficient change

`TauCeti.HilbertSamuel.reesMap_id` — Rees coefficient change for id_A and I=J is the identity ring homomorphism.

Use ring-hom and subtype extensionality. Apply the polynomial identity-map law.

## Composition of Rees coefficient change

`TauCeti.HilbertSamuel.reesMap_comp` — For f(I)⊆J and g(J)⊆K, reesMap(g)∘reesMap(f)=reesMap(g∘f).

Compose the ideal-containment proofs. Check the polynomial component by Polynomial.map_map.

## Coefficient-ideal preservation

`TauCeti.HilbertSamuel.reesMap_coefficientIdeal` — Rees coefficient change carries I·Rees(I) into J·Rees(J).

Reduce containment of the mapped ideal to its generating constants. Use the constant evaluation formula and f(I)⊆J.

## Coefficient change on the ordinary adic graded ring

`TauCeti.HilbertSamuel.adicGradedMap` — For f:A→B with f(I)⊆J, descend Rees coefficient change to Gr_I(A)→+*Gr_J(B), where Gr is the existing Rees quotient.

Use the actual coefficient ideal and its preservation. Apply the pinned Ideal.quotientMap; do not introduce a second graded carrier.

- API `TauCeti.HilbertSamuel.adicGradedMap_mk`: The image of [p] is [reesMap(f)(p)] for every p∈Rees(I).
- API `TauCeti.HilbertSamuel.adicGradedMap_id`: The graded map induced by id_A with I=J is the identity.
- API `TauCeti.HilbertSamuel.adicGradedMap_comp`: For f(I)⊆J and g(J)⊆K, graded change by g after f equals graded change by g∘f.
- API `TauCeti.HilbertSamuel.adicGradedMap_monomial`: For a∈I^n, graded coefficient change sends μ_n(a) to μ_n(f(a)) in the same degree n.
- API `TauCeti.HilbertSamuel.adicGradedMap_coefficients`: The map sends algebraMap_A(a) to algebraMap_B(f(a)).
- API `TauCeti.HilbertSamuel.adicGradedMap_surjective`: If f is surjective and J=I.map f, then Gr_I(A)→Gr_J(B) is surjective.
- API `TauCeti.HilbertSamuel.adicGradedMap_residue`: The square from A/I to Gr_I(A) and B/J to Gr_J(B) commutes with Ideal.quotientMap J f h.
- API `TauCeti.HilbertSamuel.adicGradedMap_injective_iff`: The graded map is injective iff, for every n and a∈I^n, f(a)∈J^(n+1) implies a∈I^(n+1).
- Test `AdicCoefficientChange.integer_degree_one_kernel` (non-example): For id:ℤ→ℤ, I=(4) and J=(2), the degree-one class of 4 is nonzero in Gr_I but maps to zero in Gr_J.
- Test `AdicCoefficientChange.residue_surjection` (compatibility): The ring map ℤ→ℤ/4 induces a surjection on associated graded rings for I=(2) and its image ideal.
- Test `AdicCoefficientChange.residue_value` (computation): Under ℤ→ℤ/4 with I=(2), the coefficient class 7 maps to the coefficient class 3.

## Graded coefficient change on representatives

`TauCeti.HilbertSamuel.adicGradedMap_mk` — The image of [p] is [reesMap(f)(p)] for every p∈Rees(I).

Apply the defining quotient map to a quotient representative. The resulting equality is definitional.

## Identity of adic coefficient change

`TauCeti.HilbertSamuel.adicGradedMap_id` — The graded map induced by id_A with I=J is the identity.

Choose a Rees representative of every quotient element. Use the Rees identity law.

## Composition of adic coefficient change

`TauCeti.HilbertSamuel.adicGradedMap_comp` — For f(I)⊆J and g(J)⊆K, graded change by g after f equals graded change by g∘f.

Reduce to a quotient representative. Apply the quotient projection to the Rees composition equality.

## Injectivity before the graded quotient

`TauCeti.HilbertSamuel.reesMap_injective` — If f is injective, its Rees coefficient-change map is injective for any f(I)⊆J.

Project an equality to the ambient polynomial ring. Use polynomial-map injectivity and then subtype extensionality.

## Surjectivity onto the image-ideal Rees algebra

`TauCeti.HilbertSamuel.reesMap_surjective` — If f is surjective and J=I.map f, then Rees(I)→Rees(J) is surjective.

For each coefficient p_n∈(I.map f)^n choose a lift a_n∈I^n, using ideal-map powers and surjectivity. Sum a_n T^n over the finite support of p and compare every mapped monomial. No finite generation of I is needed.

## Surjectivity on the graded quotient

`TauCeti.HilbertSamuel.adicGradedMap_surjective` — If f is surjective and J=I.map f, then Gr_I(A)→Gr_J(B) is surjective.

Lift a quotient element to Rees(J). Lift that polynomial through the surjective Rees map and project its preimage.

## Preservation of homogeneous representatives

`TauCeti.HilbertSamuel.adicGradedMap_monomial` — For a∈I^n, graded coefficient change sends μ_n(a) to μ_n(f(a)) in the same degree n.

Use preservation of I^n to type the target monomial. Apply Polynomial.map_monomial beneath the quotient projection.

## Coefficients under adic coefficient change

`TauCeti.HilbertSamuel.adicGradedMap_coefficients` — The map sends algebraMap_A(a) to algebraMap_B(f(a)).

Express the two coefficient embeddings as Rees constants followed by quotient projections. Apply the Rees constant formula.

## Coefficient bound in the mapped Rees ideal

`TauCeti.HilbertSamuel.reesCoefficientIdeal_coeff` — If p∈I·Rees(I), then p_n∈I^(n+1) for every n≥0.

Induct on the ideal span of constants from I, simultaneously in n. In the multiplication case, every convolution summand lies in I^i I^(j+1)=I^(n+1).

## Monomial inclusion in the coefficient ideal

`TauCeti.HilbertSamuel.reesMonomial_mem_coefficientIdeal` — If a∈I^n and a∈I^(n+1), then aT^n∈I·Rees(I).

Write I^(n+1)=I·I^n and induct on sums of products. For a=x y, x∈I and y∈I^n, use C(x)·(yT^n), then add these expressions.

## Exact vanishing of a homogeneous adic class

`TauCeti.HilbertSamuel.adicMonomial_eq_zero_iff` — For a∈I^n, μ_n(a)=0 if and only if a∈I^(n+1).

Use the existing coefficient-ideal equivalence. Only coefficient n of aT^n can be nonzero; all other coefficients are zero.

## Coefficientwise kernel of the graded map

`TauCeti.HilbertSamuel.adicGradedMap_mk_eq_zero_iff` — The image of [p] under graded coefficient change is zero iff f(p_n)∈J^(n+1) for every n.

Evaluate the map on a Rees representative. Apply the coefficient-ideal equivalence and the coefficient formula for Polynomial.map.

## Exact injectivity criterion for coefficient change

`TauCeti.HilbertSamuel.adicGradedMap_injective_iff` — The graded map is injective iff, for every n and a∈I^n, f(a)∈J^(n+1) implies a∈I^(n+1).

For necessity, apply injectivity to the homogeneous class of a. For sufficiency, choose a Rees representative of a class in the kernel and apply the filtration condition coefficientwise.

## Bijective coefficient change for an image ideal

`TauCeti.HilbertSamuel.adicGradedMap_bijective` — If f is bijective, graded coefficient change to J=I.map f is bijective.

Use ideal-map powers and comap_map_of_bijective for the exact injectivity condition. Combine with graded surjectivity.

## Adic graded equivalence under a ring equivalence

`TauCeti.HilbertSamuel.adicGradedEquiv` — A ring equivalence e:A≃+*B induces Gr_I(A)≃+*Gr_(I.map e)(B), with forward map the actual coefficient-change map.

Bundle the proved bijectivity of the graded map. Keep the image ideal explicit; no equality of unrelated filtrations is assumed.

- API `TauCeti.HilbertSamuel.adicGradedEquiv_apply`: The forward function of adicGradedEquiv e I is adicGradedMap e I (I.map e).
- API `TauCeti.HilbertSamuel.adicGradedEquiv_inverse_monomial`: The inverse graded equivalence takes μ_n(e(a)) back to μ_n(a) for a∈I^n.
- API `TauCeti.HilbertSamuel.adicGradedEquiv_monomial`: The graded equivalence induced by e sends μ_n(a) to μ_n(e(a)) in the same degree.
- Test `AdicCoefficientEquiv.swap_factors` (computation): For the zero ideal of ℤ×ℤ, the factor-swap equivalence sends μ₀(5,7) to μ₀(7,5).
- Test `AdicCoefficientEquiv.nonreduced_inverse` (non-example): For I=(2) in ℤ/4 and e=id, the inverse graded equivalence recovers μ₁(2), whose forward image is nonzero.
- Test `AdicCoefficientEquiv.unit_ideal` (degenerate): For I=A, every graded class is zero and every coefficient equivalence sends it to zero.

## Forward map of the graded equivalence

`TauCeti.HilbertSamuel.adicGradedEquiv_apply` — The forward function of adicGradedEquiv e I is adicGradedMap e I (I.map e).

Unfold RingEquiv.ofBijective. Its forward ring hom is unchanged.

## Inverse on homogeneous representatives

`TauCeti.HilbertSamuel.adicGradedEquiv_inverse_monomial` — The inverse graded equivalence takes μ_n(e(a)) back to μ_n(a) for a∈I^n.

Rewrite the mapped homogeneous class as the forward graded equivalence. Apply its inverse identity.

## Forward homogeneous formula of the graded equivalence

`TauCeti.HilbertSamuel.adicGradedEquiv_monomial` — The graded equivalence induced by e sends μ_n(a) to μ_n(e(a)) in the same degree.

Use the forward map identification. Apply the coefficient-change monomial formula.

## Naturality of residue-ring coefficients

`TauCeti.HilbertSamuel.adicGradedMap_residue` — The square from A/I to Gr_I(A) and B/J to Gr_J(B) commutes with Ideal.quotientMap J f h.

Choose an A-representative of the residue class. Reduce to the proved coefficient formula in the Rees quotient.

## Additional existing-core regression

`AdicCoefficientChange.nonreduced_degree_one_survives` — For I=(2) in ℤ/4, μ₁(2) is nonzero and has square zero.

The handoff provides exact native and canonical compiler receipts, admitted-versus-native signature checks, all public recovery commands, and the unchanged prior obligations below.

---

## Finite length and stabilization of the local Hilbert functions

The extended functions use the same actual module quotients throughout. Put F_n=q^n M, H(q;M,n)=length_A(M/q^(n+1)M), and G(q;M,n)=length_A(F_n/(q times the top submodule of F_n)). Their coefficients are extended natural numbers until finiteness has been proved. Finite generation means generation as an A-module; it does not mean a finite underlying set. The field ℚ therefore supplies an acceptance example with an infinite residue field and finite lengths.

For Noetherian local A, radical(q)=m implies that A/q is Artinian by the existing zero-dimensional Noetherian quotient theory. On a finite module killed by q, the existing quotient action makes the same module an A/q-module. Transport Artinianity back through the identity semilinear map for A→A/q; combine it with Noetherianity over A. Apply this argument to q^(n+1) and M/q^(n+1)M to obtain finite cumulative lengths. The native injective graded-to-cumulative quotient map then gives finite graded lengths. Neither argument requires Hilbert–Serre, a chosen polynomial, completeness, freeness, a finite residue field, or a nonzero module.

Over any commutative local ring, a finite-length module is both Noetherian and Artinian. The descending maximal-ideal powers stabilize. Their stable term is finitely generated as a submodule of this Noetherian module, and Nakayama makes it zero. This proves maximal-ideal nilpotence without assuming the ring itself Noetherian. Conversely, over a Noetherian local ring, a finite module killed by a maximal-ideal power has finite length; the exponent-zero branch is exactly the zero module. An infinite direct sum of the residue field shows why finite generation cannot be removed from this converse.

For an arbitrary ideal and arbitrary module, q^r M=0 forces the cumulative length to equal length_A(M) as soon as r≤n+1 and forces the graded length to be zero as soon as r≤n. These statements preserve extended infinite lengths and distinguish the two cutoffs. For finite-length modules over a local ring, every q⊆m has an annihilating power, so both functions stabilize with those respective values. The unit ideal fails this containment premise: its cumulative function is zero even on a nonzero module of length one.

The following declarations refine R03.3 and the existing reserved multiplicity owner. Their dependencies are native baseline facts or preceding declarations here. The existing generic Hilbert–Samuel polynomial, its dimension theorem and both factorial normalizations retain their full hypotheses; these finite-length results do not identify the degree for positive-dimensional modules. All P7/P8/P9 and R03.1–R03.5 targets, the R03.6 supplier, completed tensor products, derived algebra and every routed-paper obligation remain required.

### Finite length under primary ideal annihilation

TauCeti.HilbertSamuel.finiteLength_of_primary_annihilation: If A is Noetherian local, M is finite, radical(q)=m and qM=0, then M has finite length over A.

Every minimal prime p over q contains radical(q)=m and hence equals m. The existing quotient-dimension criterion and Noetherian quotient instance make A/q Artinian; this is a baseline reduction, not a new Artinian-ring theory. Use Module.IsTorsionBySet.module for the induced action of A/q on the same M. Finiteness transfers to A/q, and the existing Artinian-ring finite-module theorem gives Artinianity. The actual identity semilinear map over the surjective quotient homomorphism transports Artinianity back to A. Combine it with Noetherianity of finite A-modules.

Prerequisites: mathlib:Ideal.krullDimLE_zero_quotient_iff_forall_minimalPrimes_isMaximal, mathlib:IsNoetherianRing.isArtinianRing_of_krullDimLE_zero, mathlib:Ideal.Quotient.isNoetherianRing, mathlib:Ideal.IsRadical.radical_le_iff, mathlib:Ideal.IsPrime.isRadical, mathlib:Ideal.IsMaximal.eq_of_le, mathlib:Module.isTorsionBySet_iff_subset_annihilator, mathlib:Module.IsTorsionBySet.module, mathlib:Module.IsTorsionBySet.semilinearMap, mathlib:Module.IsTorsionBySet.isScalarTower, mathlib:Module.Finite.of_restrictScalars_finite, mathlib:LinearMap.isArtinian_iff_of_bijective, mathlib:isFiniteLength_iff_isNoetherian_isArtinian, mathlib:IsArtinianRing.tfae, mathlib:isNoetherian_of_isNoetherianRing_of_finite, mathlib:Module.length_ne_top_iff, mathlib:Submodule.annihilator_top, mathlib:Submodule.le_annihilator_iff, mathlib:IsLocalRing.maximalIdeal.isMaximal, mathlib:Ideal.le_radical.

### Maximal-ideal nilpotence of a finite-length module

TauCeti.HilbertSamuel.exists_maximal_power_eq_bot: For every commutative local ring A and finite-length A-module M, there is r≥0 with m^r M=0. No Noetherian-ring hypothesis is needed.

Finite length supplies both Noetherianity and Artinianity of M, even when A is not Noetherian. Stabilize the actual descending submodules m^n M by IsArtinian.monotone_stabilizes. At a stable index N=m^r M is finitely generated by Noetherianity of M and satisfies N=mN. Apply the existing Nakayama lemma using jacobson(0)=m to conclude N=0. The zero module permits r=0.

Prerequisites: mathlib:isFiniteLength_iff_isNoetherian_isArtinian, mathlib:IsArtinian.monotone_stabilizes, mathlib:Ideal.pow_le_pow_right, mathlib:Submodule.smul_mono_left, mathlib:IsNoetherian, mathlib:Submodule.eq_bot_of_le_smul_of_le_jacobson_bot, mathlib:IsLocalRing.jacobson_eq_maximalIdeal, mathlib:Submodule.mul_smul.

### Finite length and maximal-ideal nilpotence

TauCeti.HilbertSamuel.finiteLength_iff_maximal_power: For Noetherian local A and finite M, M has finite length if and only if m^r M=0 for some r≥0.

Apply finite-length-maximal-power-nilpotence in the forward direction. Apply the existing finite-length-of-maximal-power-annihilation and Module.length_ne_top_iff in the reverse direction.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/finite-length-maximal-power-nilpotence, DeformationAndDerivedPatchingAlgebra:R03.3/finite-length-of-maximal-power-annihilation, mathlib:Module.length_ne_top_iff.

### Cumulative length after ideal-power annihilation

TauCeti.HilbertSamuel.function_eq_length_of_power_annihilation: For any A, M and q, if q^r M=0 and r≤n+1, then H(q;M,n)=length_A(M) in extended naturals.

Decreasing ideal powers and monotone ideal action show q^(n+1)M=0. Use the native linear equivalence from the quotient by the zero submodule to M and preservation of extended length. No finite-length-toNat conversion is used.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-function, mathlib:Ideal.pow_le_pow_right, mathlib:Submodule.smul_mono_left, mathlib:Submodule.quotEquivOfEqBot, mathlib:LinearEquiv.length_eq.

### Vanishing of graded lengths after annihilation

TauCeti.HilbertSamuel.gradedFunction_eq_zero_of_power_annihilation: For any A, M and q, if q^r M=0 and r≤n, then G(q;M,n)=0.

Decreasing ideal powers give q^n M=0. The actual numerator subtype is therefore subsingleton. Its quotient by q times the top submodule is subsingleton, so Module.length_eq_zero gives zero. Preserve the subtype carrier rather than rewrite dependent scalar instances.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/graded-hilbert-function, mathlib:Ideal.pow_le_pow_right, mathlib:Submodule.smul_mono_left, mathlib:Module.length_eq_zero.

### Nilpotence of a proper local ideal on a finite-length module

TauCeti.HilbertSamuel.exists_power_eq_bot_of_finiteLength: For any commutative local A, finite-length M and ideal q⊆m, some q^r M is zero.

Use maximal-ideal nilpotence of the same M. Power monotonicity q^r⊆m^r and monotone ideal action transport that vanishing.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/finite-length-maximal-power-nilpotence, mathlib:Ideal.pow_right_mono, mathlib:Submodule.smul_mono_left.

### Cumulative stabilization for finite-length modules

TauCeti.HilbertSamuel.function_eventually_eq_length: For any commutative local A, finite-length M and q⊆m, there is N≥0 such that H(q;M,n)=length_A(M) for every n≥N.

Choose an annihilating q power using finite-length-ideal-power-nilpotence. Use hilbert-function-of-power-annihilation at every n≥r, where r≤n+1.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/finite-length-ideal-power-nilpotence, DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-function-of-power-annihilation.

### Graded stabilization for finite-length modules

TauCeti.HilbertSamuel.gradedFunction_eventually_zero: For any commutative local A, finite-length M and q⊆m, there is N≥0 such that G(q;M,n)=0 for every n≥N.

Choose an annihilating q power using finite-length-ideal-power-nilpotence. Use graded-function-of-power-annihilation at every n≥r.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/finite-length-ideal-power-nilpotence, DeformationAndDerivedPatchingAlgebra:R03.3/graded-function-of-power-annihilation.

### API and acceptance examples

TauCeti.HilbertSamuel.function_eq_length_of_power_annihilation: For any A, M and q, if q^r M=0 and r≤n+1, then H(q;M,n)=length_A(M) in extended naturals.

TauCeti.HilbertSamuel.function_eventually_eq_length: For any commutative local A, finite-length M and q⊆m, there is N≥0 such that H(q;M,n)=length_A(M) for every n≥N.

TauCeti.HilbertSamuel.gradedFunction_eq_zero_of_power_annihilation: For any A, M and q, if q^r M=0 and r≤n, then G(q;M,n)=0.

TauCeti.HilbertSamuel.gradedFunction_eventually_zero: For any commutative local A, finite-length M and q⊆m, there is N≥0 such that G(q;M,n)=0 for every n≥N.

FiniteLengthTests.infinite_residue_field: For A=ℚ, q=0 and M=ℚ³, H(q;M,n) is finite for every n although the residue field is infinite.

FiniteLengthTests.zeroth_power_zero_module: The zero ℚ-module ℚ⁰ has finite length, and the maximal-power annihilation test allows r=0.

FiniteLengthTests.field_nilpotence: For the native finite-length ℚ-module ℚ and q=0, there is an annihilating ideal power.

FiniteLengthTests.cumulative_boundary: For A=ℚ, q=0 and M=ℚ³, H(q;M,0)=3.

FiniteLengthTests.graded_cutoff: For A=ℚ, q=0 and M=ℚ, G(q;M,1)=0.

FiniteLengthTests.graded_degree_zero_survives: For A=ℚ, q=0 and M=ℚ, G(q;M,0)≠0, so replacing the graded cutoff n≥r by n+1≥r is false.

FiniteLengthTests.infinite_sum_finiteness_required: The infinite direct sum of ℚ indexed by ℕ has infinite ℚ-length although the maximal ideal 0 annihilates it; finite generation is required in the reverse criterion.

FiniteLengthTests.unit_ideal_stabilization_rejected: For A=M=ℚ, q=A and n=0, H(A;ℚ,0)=0 differs from length_ℚ(ℚ)=1; the proper-ideal premise in stabilization is necessary.

Sources: Stacks 10.52.4 and 10.52.8 give the finite-length implications, 10.52.5 gives the surjective scalar comparison, and 10.59 supplies the cumulative and graded definitions. The quotient-Artinian route reuses pinned Mathlib dimension, finite-module and semilinear transport theorems. Regularity under completion and the other ModularCurves 4D outputs retain their existing supplier. No new planet is required for these supporting lemmas.

# Graded annihilator comparison and the primary boundary

The nth graded piece is the actual quotient of the submodule q^nM by q acting on that submodule. Adjoining Ann_A(M) identifies both numerator and denominator, so the comparison preserves underlying representatives and extended lengths even for nonfaithful and zero modules. No finite-length assumption is used in this transport.

For a nonzero module over a local ring, its annihilator is proper and lies in the maximal ideal. Thus an m-primary ideal stays m-primary after enlargement. For the zero module the enlarged ideal is the unit ideal. The full five-condition equivalence in [Stacks Remark 43.15.6](https://stacks.math.columbia.edu/tag/0AZU) therefore needs the separate zero branch recorded as source issue DeformationAndDerivedPatchingAlgebra/E3; finite quotient length alone does not establish proper primary enlargement.

The cumulative polynomial comparisons use the existing eventual-evaluation and uniqueness specifications. General Hilbert–Serre existence remains an explicit open prerequisite. Intrinsic multiplicity retains its own polynomial degree; fixed-degree extraction uses the same requested d on both sides and requires the inherited support bound when interpreted as multiplicity. No new multiplicity constructor is introduced.

## Whole-module annihilators on submodule carriers

Declaration: TauCeti.HilbertSamuel.idealSupAnnihilator_smul_subtype.

For every submodule L of M and submodule P of L, (q+Ann_A(M))P=qP, with P carrying the inherited A-action.

Hypotheses: A is a commutative ring; M is an additive commutative group with an A-module structure; q is any ideal of A. All carriers, ideal actions and extended lengths are the pinned native ones.

Proof: Injectivity of the subtype map gives Ann_A(M)⊆Ann_A(L); reverse inclusion for P⊆L gives containment in Ann_A(P). Use the zero-action criterion and distribution over ideal sum.

Prerequisites: mathlib:LinearMap.annihilator_le_of_injective, mathlib:Submodule.annihilator_top, mathlib:Submodule.annihilator_mono, mathlib:Submodule.le_annihilator_iff, mathlib:Submodule.sup_smul.

## Annihilator comparison of actual graded pieces

Declaration: TauCeti.HilbertSamuel.adicPieceAnnihilatorEquiv.

For each n≥0, there is a canonical A-linear equivalence ((q+Ann_A(M))^n M)/((q+Ann_A(M))·((q+Ann_A(M))^n M)) ≃ (q^n M)/(q·q^n M). Quotients use the ideal-action submodule inside each numerator subtype.

Hypotheses: A is a commutative ring; M is an additive commutative group with an A-module structure; q is any ideal of A. All carriers, ideal actions and extended lengths are the pinned native ones.

Proof: Use annihilator-enlargement-powers to identify the numerator submodules by LinearEquiv.ofEq. Map ideal actions through this equivalence, use full range, and identify the target denominator with annihilator-subtype-action. Apply the native quotient equivalence. Representatives preserve their value in M.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/annihilator-enlargement-powers, DeformationAndDerivedPatchingAlgebra:R03.3/annihilator-subtype-action, DeformationAndDerivedPatchingAlgebra:R03.3/graded-hilbert-function, mathlib:LinearEquiv.ofEq, mathlib:Submodule.Quotient.equiv, mathlib:Submodule.map_smul'', mathlib:Submodule.map_top, mathlib:LinearMap.range_eq_top.

API TauCeti.HilbertSamuel.adicPieceAnnihilatorEquiv_mk: The forward graded-piece comparison sends [m] to [e(m)], where e is the numerator equivalence induced by the power equality and e(m) has the same underlying element of M.

API TauCeti.HilbertSamuel.adicPieceAnnihilatorEquiv_symm_mk: The inverse graded-piece comparison sends [m] to [e⁻¹(m)], where e is the same numerator equality equivalence.

API TauCeti.HilbertSamuel.gradedFunction_sup_annihilator: For every n≥0, G(q+Ann_A(M);M,n)=G(q;M,n) in ℕ∞, with G the extended length of the actual nth graded quotient.

Test AnnihilatorGradedTests.degree_zero_representative (computation): For A=M=ℚ, q=0 and n=0, every class [m] is sent to the class of the same underlying rational by the numerator equality equivalence.

Test AnnihilatorGradedTests.nonfaithful_inverse (non-example): For A=ℤ, M=ℤ/4ℤ, q=0 and n=0, the inverse comparison preserves each underlying representative; no faithful-module hypothesis is allowed.

Test AnnihilatorGradedTests.positive_degree_zero (degenerate): For A=M=ℚ, q=0 and n=1, the comparison sends the zero representative to zero; its numerator is the zero submodule.

## Forward graded comparison on representatives

Declaration: TauCeti.HilbertSamuel.adicPieceAnnihilatorEquiv_mk.

The forward graded-piece comparison sends [m] to [e(m)], where e is the numerator equivalence induced by the power equality and e(m) has the same underlying element of M.

Hypotheses: A is a commutative ring; M is an additive commutative group with an A-module structure; q is any ideal of A. All carriers, ideal actions and extended lengths are the pinned native ones.

Proof: Unfold the native quotient equivalence and the numerator equality equivalence; its representative formula is definitional.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/annihilator-graded-piece-equivalence, mathlib:LinearEquiv.coe_ofEq_apply.

## Inverse graded comparison on representatives

Declaration: TauCeti.HilbertSamuel.adicPieceAnnihilatorEquiv_symm_mk.

The inverse graded-piece comparison sends [m] to [e⁻¹(m)], where e is the same numerator equality equivalence.

Hypotheses: A is a commutative ring; M is an additive commutative group with an A-module structure; q is any ideal of A. All carriers, ideal actions and extended lengths are the pinned native ones.

Proof: Apply forward injectivity and the forward representative formula; simplify the two inverse identities.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/annihilator-graded-piece-equivalence, DeformationAndDerivedPatchingAlgebra:R03.3/annihilator-graded-piece-mk.

## Annihilator invariance of graded lengths

Declaration: TauCeti.HilbertSamuel.gradedFunction_sup_annihilator.

For every n≥0, G(q+Ann_A(M);M,n)=G(q;M,n) in ℕ∞, with G the extended length of the actual nth graded quotient.

Hypotheses: A is a commutative ring; M is an additive commutative group with an A-module structure; q is any ideal of A. All carriers, ideal actions and extended lengths are the pinned native ones.

Proof: Apply length invariance to the actual graded-piece equivalence; no finite length or conversion to natural numbers is used.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/annihilator-graded-piece-equivalence, DeformationAndDerivedPatchingAlgebra:R03.3/graded-hilbert-function, mathlib:LinearEquiv.length_eq.

## Primary annihilator enlargement for nonzero modules

Declaration: TauCeti.HilbertSamuel.radical_sup_annihilator.

If A is local, M≠0 and radical(q)=m, then radical(q+Ann_A(M))=m.

Hypotheses: A is a commutative ring; M is an additive commutative group with an A-module structure; q is any ideal of A. All carriers, ideal actions and extended lengths are the pinned native ones. A is local, M is nonzero, and radical(q) is the maximal ideal m. No Noetherian or finite-module hypothesis is needed for the radical equality.

Proof: The unit-annihilator criterion and M≠0 make Ann_A(M) proper; every proper ideal lies in m. Both q and Ann_A(M) lie in m, and m is prime and radical, giving the upper radical bound. Monotonicity gives m=radical(q)⊆radical(q+Ann_A(M)).

Prerequisites: mathlib:Module.annihilator_eq_top_iff, mathlib:IsLocalRing.le_maximalIdeal, mathlib:IsLocalRing.maximalIdeal.isMaximal, mathlib:Ideal.IsMaximal.isPrime, mathlib:Ideal.IsPrime.isRadical, mathlib:Ideal.IsRadical.radical_le_iff, mathlib:Ideal.radical_mono, mathlib:Ideal.le_radical.

## Zero-module annihilator boundary

Declaration: TauCeti.HilbertSamuel.sup_annihilator_zero_module.

For a zero A-module M and every ideal q, q+Ann_A(M)=A.

Hypotheses: A is a commutative ring; M is an additive commutative group with an A-module structure; q is any ideal of A. All carriers, ideal actions and extended lengths are the pinned native ones. M is a zero module; the final boundary clause assumes A is a nonzero local ring.

Proof: Use the native unit-annihilator criterion and ideal-supremum simplification. For the local-ring boundary the unit ideal has radical A, whereas the maximal ideal is proper.

Prerequisites: mathlib:Module.annihilator_eq_top_iff.

Test AnnihilatorGradedTests.nonzero_field_primary (compatibility): For A=M=ℚ and q=0, radical(q+Ann_A(M)) is the maximal ideal 0.

Test AnnihilatorGradedTests.zero_module_not_primary (non-example): For A=ℚ, M=ℚ^(Fin 0)=0 and q=0, radical(q+Ann_A(M)) differs from the maximal ideal.

Test AnnihilatorGradedTests.zero_module_finite_quotient (degenerate): For A=ℚ, M=ℚ^(Fin 0)=0 and q=0, the actual cumulative quotient at n=0 has extended length 0, hence finite length despite failure of the enlarged-ideal primary condition.

## Annihilator invariance of the eventual polynomial

Declaration: TauCeti.HilbertSamuel.polynomial_sup_annihilator.

Under the finite Noetherian-local hypotheses with M≠0 and radical(q)=m, P(q+Ann_A(M);M)=P(q;M) for the existing cumulative n+1 polynomial constructor.

Hypotheses: A is a commutative ring; M is an additive commutative group with an A-module structure; q is any ideal of A. All carriers, ideal actions and extended lengths are the pinned native ones. A is local, M is nonzero, and radical(q) is the maximal ideal m. No Noetherian or finite-module hypothesis is needed for the radical equality. A is Noetherian and M is finite. The existing general eventual-polynomial theorem and its specification remain required, unproved prerequisites.

Proof: Supply the enlarged-ideal radical proof from primary-annihilator-enlargement. Use the existing polynomial eventual-evaluation specification, rewrite cumulative lengths by hilbert-samuel-function-annihilator-enlargement, and apply polynomial uniqueness. This proof depends on the existing unproved general polynomial specification; it is not a proof of Hilbert–Serre existence.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/primary-annihilator-enlargement, DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-polynomial, DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-function-annihilator-enlargement.

## Annihilator invariance of intrinsic multiplicity

Declaration: TauCeti.HilbertSamuel.multiplicity_sup_annihilator.

Under the preceding finite nonzero Noetherian-local hypotheses, intrinsic e(q+Ann_A(M);M)=e(q;M).

Hypotheses: A is a commutative ring; M is an additive commutative group with an A-module structure; q is any ideal of A. All carriers, ideal actions and extended lengths are the pinned native ones. A is local, M is nonzero, and radical(q) is the maximal ideal m. No Noetherian or finite-module hypothesis is needed for the radical equality. A is Noetherian and M is finite. The existing general eventual-polynomial theorem and its specification remain required, unproved prerequisites.

Proof: Rewrite the polynomial in the exact intrinsic formula natDegree(P)!·leadingCoeff(P). No ambient dimension is substituted.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-annihilator-enlargement, DeformationAndDerivedPatchingAlgebra:key/hilbert-samuel-multiplicity.

## Annihilator invariance of fixed-degree extraction

Declaration: TauCeti.HilbertSamuel.multiplicityInDegree_sup_annihilator.

Under the preceding finite nonzero Noetherian-local hypotheses, for every d≥0 the raw coefficient extractors e(q+Ann_A(M);M,d)=e(q;M,d) agree. Calling either value a multiplicity still requires the inherited support-dimension upper bound.

Hypotheses: A is a commutative ring; M is an additive commutative group with an A-module structure; q is any ideal of A. All carriers, ideal actions and extended lengths are the pinned native ones. A is local, M is nonzero, and radical(q) is the maximal ideal m. No Noetherian or finite-module hypothesis is needed for the radical equality. A is Noetherian and M is finite. The existing general eventual-polynomial theorem and its specification remain required, unproved prerequisites.

Proof: Rewrite the polynomial in d!·coeff(P,d); no degree bound is needed for the raw equality.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-annihilator-enlargement, DeformationAndDerivedPatchingAlgebra:R03.3/degree-indexed-multiplicity.

All implementation statuses remain unchecked. The seven new independent declarations and six new tests have successful native evidence; the three polynomial-dependent proofs have inherited admission dependencies. The canonical suggested forms remain admitted. Every previous declaration, API, example, planet, request, gap and scope target is preserved below.

---

# Annihilator enlargement of the actual adic filtration

Codex — codex-a71f92, 3 October 2026. This section is the current partial checkpoint; the complete incoming reader below remains attributed historical context. All 247 incoming node objects, the reserved general Hilbert–Samuel key, 13 existing planets, 15 gaps, two supplier requests and eight unclosed scoped stages are retained. Six declarations (one construction and five lemmas), three promoted API items and four named tests extend the R03.3 strand. This is not a new carrier for an existing quotient or a claim that the whole key definition is closed.

## Conventions and source boundary

Let A be a commutative ring and M an A-module, with its given additive commutative group. Write J=Ann_A(M), and let q be any ideal of A. The ideal sum q+J is the lattice supremum. We use native ideal actions on submodules and native module quotients. The cumulative function is H(q;M,n)=length_A(M/q^(n+1)M) with values in the extended natural numbers, including infinity.

The motivation is [Stacks Remark 43.15.6](https://stacks.math.columbia.edu/tag/0AZU): module-relative ideals of definition permit adjoining the module annihilator. Before using any local or polynomial theorem, the actual filtration must be shown unchanged. The proofs below work for every commutative A and every module M, including nonfaithful modules, the zero module, non-finitely generated modules and infinite lengths. No flatness, locality, Noetherian condition or residue-field dimension is silently imposed. This does not establish the module-relative Hilbert–Samuel polynomial, support-degree theorem, associativity or multiplicity integrality.

The complete mathematical Stacks 00K4 and 0AZU sections were freshly read; their nested general Hilbert–Serre, dimension and Koszul inputs remain open. Pinned Mathlib annihilator/action, quotient and length statements were read with their hypotheses. Bounded source/index and current ownership searches found no competing planned adapter for this exact equality. Generic annihilator, ideal action and quotient equivalence APIs are reused rather than replanned. Broad historical paper readings are preserved, not represented as fresh complete audits.

## Declarations and proof plans

### Annihilator enlargement preserves ideal action

TauCeti.HilbertSamuel.idealSupAnnihilator_smul — For every submodule N of M, (q+Ann_A(M))N=qN.

Hypotheses: A is a commutative ring, M is an additive commutative group with its given A-module structure, and q is an ideal of A. Ideal sum means lattice supremum. All actions, quotients and lengths are the pinned native ones. No Noetherian, local, finite-module, faithful-module, flatness or finite-length hypothesis is imposed.

Proof: N is contained in the whole module, so annihilator reverse inclusion shows that Ann_A(M) annihilates N. Distribute the ideal sum acting on N and discard the zero summand.

Dependencies: mathlib:Module.annihilator; mathlib:Submodule.annihilator_top; mathlib:Submodule.annihilator_mono; mathlib:Submodule.le_annihilator_iff; mathlib:Submodule.sup_smul.

### Annihilator enlargement preserves all adic powers

TauCeti.HilbertSamuel.idealSupAnnihilator_pow_smul — For every r≥0 and submodule N of M, (q+Ann_A(M))^r N=q^r N.

Hypotheses: A is a commutative ring, M is an additive commutative group with its given A-module structure, and q is an ideal of A. Ideal sum means lattice supremum. All actions, quotients and lengths are the pinned native ones. No Noetherian, local, finite-module, faithful-module, flatness or finite-length hypothesis is imposed.

Proof: At r=0 both actions are the identity. At the successor use associative ideal action, the induction hypothesis and the preceding action equality.

Dependencies: DeformationAndDerivedPatchingAlgebra:R03.3/annihilator-enlargement-action; mathlib:Submodule.mul_smul.

### Canonical annihilator-enlargement quotient equivalence

TauCeti.HilbertSamuel.adicQuotientAnnihilatorEquiv — For every r≥0, the identity on representatives induces an A-linear equivalence M/((q+Ann_A(M))^r M) ≃ M/(q^r M).

Hypotheses: A is a commutative ring, M is an additive commutative group with its given A-module structure, and q is an ideal of A. Ideal sum means lattice supremum. All actions, quotients and lengths are the pinned native ones. No Noetherian, local, finite-module, faithful-module, flatness or finite-length hypothesis is imposed.

Proof: Apply the power equality to the whole module to identify the actual denominator submodules. Use the native linear equivalence of quotients by equal submodules. No replacement carrier or finite-length assumption is introduced.

Dependencies: DeformationAndDerivedPatchingAlgebra:R03.3/annihilator-enlargement-powers; mathlib:Submodule.quotEquivOfEq.

### Forward annihilator comparison on representatives

TauCeti.HilbertSamuel.adicQuotientAnnihilatorEquiv_mk — The annihilator-enlargement quotient equivalence sends the class of each m∈M to the class of m.

Hypotheses: A is a commutative ring, M is an additive commutative group with its given A-module structure, and q is an ideal of A. Ideal sum means lattice supremum. All actions, quotients and lengths are the pinned native ones. No Noetherian, local, finite-module, faithful-module, flatness or finite-length hypothesis is imposed.

Proof: Apply the pinned representative formula for the quotient equivalence of equal submodules.

Dependencies: DeformationAndDerivedPatchingAlgebra:R03.3/annihilator-adic-quotient; mathlib:Submodule.quotEquivOfEq_mk.

### Inverse annihilator comparison on representatives

TauCeti.HilbertSamuel.adicQuotientAnnihilatorEquiv_symm_mk — The inverse annihilator-enlargement quotient equivalence sends the class of each m∈M to the class of m.

Hypotheses: A is a commutative ring, M is an additive commutative group with its given A-module structure, and q is an ideal of A. Ideal sum means lattice supremum. All actions, quotients and lengths are the pinned native ones. No Noetherian, local, finite-module, faithful-module, flatness or finite-length hypothesis is imposed.

Proof: Apply injectivity of the forward equivalence, the inverse law, and its forward representative formula.

Dependencies: DeformationAndDerivedPatchingAlgebra:R03.3/annihilator-adic-quotient; DeformationAndDerivedPatchingAlgebra:R03.3/annihilator-adic-quotient-mk.

### Annihilator enlargement preserves cumulative lengths

TauCeti.HilbertSamuel.function_sup_annihilator — For every n≥0, H(q+Ann_A(M);M,n)=H(q;M,n) as extended natural numbers, with H(q;M,n)=length_A(M/q^(n+1)M).

Hypotheses: A is a commutative ring, M is an additive commutative group with its given A-module structure, and q is an ideal of A. Ideal sum means lattice supremum. All actions, quotients and lengths are the pinned native ones. No Noetherian, local, finite-module, faithful-module, flatness or finite-length hypothesis is imposed.

Proof: Take r=n+1 in the actual A-linear quotient equivalence. Apply invariance of length under linear equivalence. Infinite lengths are retained; no polynomiality or multiplicity normalization is inferred.

Dependencies: DeformationAndDerivedPatchingAlgebra:R03.3/annihilator-adic-quotient; mathlib:LinearEquiv.length_eq; DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-function.

## Construction API and unit tests

The canonical equivalence is the native equal-denominator quotient equivalence. Its intended uses are the module-relative ideal-of-definition reduction and the general key's coefficient-comparison interface; the latter remains distinct from changing the coefficient ring. Its planning API is:

TauCeti.HilbertSamuel.adicQuotientAnnihilatorEquiv_mk (simp): The annihilator-enlargement quotient equivalence sends the class of each m∈M to the class of m.

TauCeti.HilbertSamuel.adicQuotientAnnihilatorEquiv_symm_mk (simp): The inverse annihilator-enlargement quotient equivalence sends the class of each m∈M to the class of m.

TauCeti.HilbertSamuel.function_sup_annihilator (compatibility): For every n≥0, H(q+Ann_A(M);M,n)=H(q;M,n) as extended natural numbers, with H(q;M,n)=length_A(M/q^(n+1)M).

The four tests exercise actual native quotients and actions, not a surrogate quotient or assumed equivalence:

AnnihilatorAdicTests.identity_representative (computation): For A=M=ℚ, q=0 and r=1, the canonical comparison sends the class of 7 to the class of 7.

AnnihilatorAdicTests.zeroth_power (degenerate): For A=M=ℚ, q=0 and r=0, the image of the class of 7 is zero because the zeroth power acts as the whole module.

AnnihilatorAdicTests.nonfaithful_integer_module (non-example): For A=ℤ, M=ℤ/4ℤ and q=0, the class of 1 is preserved for every r≥0, without assuming the module is faithful.

AnnihilatorAdicTests.nonannihilating_ideal_fails (non-example): For A=M=ℚ, replacing q=0 by q+ℚ at r=1 changes the denominator from zero to the whole module; adding an arbitrary ideal instead of the annihilator is false.

The native six-proof/four-test prototype has passed at the pinned Mathlib build; six axiom audits contain no admission axiom. The independent prototype supplies only the existing cumulative-function definition, whose quotient and index expression matches the incoming definition. No inherited polynomial, curve, Rees or general dimension theorem is imported into these proofs. Canonical roadmap forms remain admitted, and every node retains unchecked implementation status.

## Existing carrier elaboration and remaining work

The inherited suggested file contained a dependent local notation whose expansion lost the supplied equation, plus singleton quotation and quotient-map inference problems. The suggested continuation makes the existing full curve carrier explicitly depend on the equation, qualifies quotient-map notation and specifies the native graded multiplication carrier. These are repairs to the existing intended contracts, not new curve theorems or new ownership. The handoff records the exact reversible transformation and compiler outcome.

Keep the general Hilbert–Serre induction, support/degree theorem, Artin–Rees, localization lengths, regular-local domain comparison, completion, associativity and all routed-paper obligations open. The preserved coverage has P7, R03.3 and R03.4 partial; P8, P9, R03.1, R03.2 and R03.5 remain not-read in that record. The other promoted R03.6 part is retained. The inherited LocalFieldsRamification layer-0 → R03.4 missing supplier path stays recorded; no artificial edge is inserted. No planet is added for this technical adapter: the existing 13 landmark choices remain intact.

## Incoming reader and attribution

# Scalar restriction and actual curve multiplicity

This continuation keeps the intrinsic normalization of the reserved Hilbert–Samuel key. With a surjective coefficient map A→B, an actual B-module M has the same adic quotient carriers and cumulative lengths over A and B. The carrier equivalence itself is valid without surjectivity or flatness: restrict the mapped-power denominator to A, identify it with q^r M, and compose the two native quotient equivalences. Surjectivity enters only when identifying the two scalar-ring lengths. Infinite values remain in extended natural numbers until a finite local polynomial witness is used.

For a finite-order equation f in R=k[[x,y]], C=R/(f), v=(x,y) and its image q, the chosen general polynomial on C is the already specified explicit polynomial P_d(T)=d(T+1)−d(d−1)/2. Its intrinsic multiplicity is d; for d>0 it has degree one and coefficient one equal to d. The actual quotient R→C then gives intrinsic multiplicity d for module C over R as well, while extracting coefficient two gives zero. Fixed-index scalar comparison does not identify normalizations with different dimension indices. To interpret the degree-two extraction as ambient multiplicity, separately establish dim R=2. The incoming general degree/support-dimension theorem is still an open proof input to the support-dimension corollary.

The Stacks definitions distinguish dimension-normalized multiplicity from polynomial growth degree. The scalar formulas here are authored consequences of the pinned quotient and length APIs and the inherited curve polynomial, not a claim that Stacks supplies a formal implementation. See [Stacks 00K4](https://stacks.math.columbia.edu/tag/00K4) and [Stacks 0AZU](https://stacks.math.columbia.edu/tag/0AZU).

Every local and primary-ideal premise in the new formulas is stated explicitly. The ordinary automatic adapters for these formal power-series quotients remain required. This is a partial blueprint; new signatures, tests and proposed proof bodies are uncompiled. All 230 incoming contracts, the 15 gaps, two requests, 13 planets, eight partial stages and other roadmap parts remain intact. The unit equation is checked with its zero cumulative function, without introducing a local instance on its zero quotient. The zero equation has infinite order and retains surface growth. The nilpotent characteristic-two example has rational multiplicity 2, because residue characteristic does not reduce a module length modulo 2.

## Adic quotients commute with scalar restriction

TauCeti.HilbertSamuel.adicQuotientRestrictionEquiv (DeformationAndDerivedPatchingAlgebra:R03.3/adic-quotient-scalar-restriction).

For every r≥0, the identity on M induces the A-linear equivalence M/(q^r M) ≃ M/((qB)^r M), where the latter quotient is restricted from B to A.

Hypotheses: A and B are commutative rings with the given A-algebra structure on B. M is an additive commutative group with A- and B-module structures forming the given scalar tower. q is an ideal of A; qB is its image in B. All quotients and scalar actions are native ones.

Proof plan: Restrict the target denominator to A. Mapping commutes with ideal powers, and restriction of a mapped ideal acting on a B-submodule equals the original ideal acting on the restricted submodule. Thus the denominators agree as A-submodules. Compose the native equivalence for equal submodules with the native quotient scalar-restriction equivalence. This compares the actual quotient relations. It does not use tensor products, flatness, surjectivity or finite length.

Prerequisites: mathlib:Ideal.map_pow, mathlib:Submodule.restrictScalars_map_smul_eq, mathlib:Submodule.restrictScalars_top, mathlib:Submodule.quotEquivOfEq, mathlib:Submodule.Quotient.restrictScalarsEquiv.

API TauCeti.HilbertSamuel.adicQuotientRestrictionEquiv_mk [simp]: For every m∈M, the scalar-restriction quotient equivalence sends the class of m to the class of m.

API TauCeti.HilbertSamuel.adicQuotientRestrictionEquiv_symm_mk [simp]: The inverse quotient equivalence also sends the class of each m∈M to its class.

API TauCeti.HilbertSamuel.function_restrictScalars_of_surjective [compatibility]: If A→B is surjective, then for every n≥0, H(q;M,n) over A equals H(qB;M,n) over B as extended natural numbers.

API TauCeti.HilbertSamuel.polynomial_restrictScalars_of_surjective [compatibility]: Under surjectivity and the stated finite local hypotheses, the chosen Hilbert–Samuel polynomial over A is equal to that over B.

API TauCeti.HilbertSamuel.multiplicity_restrictScalars_of_surjective [compatibility]: Under the polynomial comparison hypotheses, intrinsic multiplicity e(q;M) over A equals e(qB;M) over B.

API TauCeti.HilbertSamuel.multiplicityInDegree_restrictScalars_of_surjective [compatibility]: Under the polynomial comparison hypotheses, for the same D≥0 on both sides, D! times the degree-D coefficient over A equals the degree-D extraction over B.

Test ScalarCurveTests.identity_representative [computation]: For A=B=M=ℚ, q=0 and r=1, the scalar comparison sends the class of 7 to the class of 7.

Test ScalarCurveTests.zeroth_power_zero_quotient [degenerate]: For A=B=M=ℚ, q=0 and r=0, the image of the class of 7 under the comparison is zero because the denominator is the whole module.

Test ScalarCurveTests.nonflat_integer_mod_two [non-example]: For the nonflat quotient ℤ→𝔽₂ and M=𝔽₂, every quotient at q=(2) has length one over ℤ; in particular H((2);𝔽₂,4)=1.

## The scalar comparison preserves representatives

TauCeti.HilbertSamuel.adicQuotientRestrictionEquiv_mk (DeformationAndDerivedPatchingAlgebra:R03.3/adic-quotient-scalar-restriction-mk).

For every m∈M, the scalar-restriction quotient equivalence sends the class of m to the class of m.

Hypotheses: A and B are commutative rings with the given A-algebra structure on B. M is an additive commutative group with A- and B-module structures forming the given scalar tower. q is an ideal of A; qB is its image in B. All quotients and scalar actions are native ones.

Proof plan: Evaluate both native constituent equivalences on the literal quotient representative.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/adic-quotient-scalar-restriction, mathlib:Submodule.quotEquivOfEq_mk, mathlib:Submodule.Quotient.restrictScalarsEquiv_mk.

## The inverse scalar comparison preserves representatives

TauCeti.HilbertSamuel.adicQuotientRestrictionEquiv_symm_mk (DeformationAndDerivedPatchingAlgebra:R03.3/adic-quotient-scalar-restriction-inverse-mk).

The inverse quotient equivalence also sends the class of each m∈M to its class.

Hypotheses: A and B are commutative rings with the given A-algebra structure on B. M is an additive commutative group with A- and B-module structures forming the given scalar tower. q is an ideal of A; qB is its image in B. All quotients and scalar actions are native ones.

Proof plan: Apply injectivity of the forward equivalence and its representative formula.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/adic-quotient-scalar-restriction, DeformationAndDerivedPatchingAlgebra:R03.3/adic-quotient-scalar-restriction-mk.

## Cumulative lengths under a surjective coefficient map

TauCeti.HilbertSamuel.function_restrictScalars_of_surjective (DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-function-scalar-restriction).

If A→B is surjective, then for every n≥0, H(q;M,n) over A equals H(qB;M,n) over B as extended natural numbers.

Hypotheses: A and B are commutative rings with the given A-algebra structure on B. M is an additive commutative group with A- and B-module structures forming the given scalar tower. q is an ideal of A; qB is its image in B. All quotients and scalar actions are native ones. The coefficient map A→B is surjective. No locality, finiteness, flatness or finite-length assumption is required.

Proof plan: Compare the quotient carriers at r=n+1 by the actual equivalence. Its A-linear length equality is followed by the pinned equality of lengths under a surjective scalar map. Keep equality in extended natural numbers: infinite-length values are included, and no toNat is used.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/adic-quotient-scalar-restriction, DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-function, mathlib:LinearEquiv.length_eq, mathlib:Module.length_eq_of_surjective.

Test ScalarCurveTests.infinite_length_retained [degenerate]: For the identity coefficient map on ℤ, q=0 and M=ℤ, H(q;M,7)=∞. Scalar comparisons must not replace this value by zero using toNat.

## The eventual polynomial under a surjective coefficient map

TauCeti.HilbertSamuel.polynomial_restrictScalars_of_surjective (DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-polynomial-scalar-restriction).

Under surjectivity and the stated finite local hypotheses, the chosen Hilbert–Samuel polynomial over A is equal to that over B.

Hypotheses: A and B are commutative rings with the given A-algebra structure on B. M is an additive commutative group with A- and B-module structures forming the given scalar tower. q is an ideal of A; qB is its image in B. All quotients and scalar actions are native ones. For polynomial and multiplicity comparisons, A and B are Noetherian local rings, M is finite over both, and q and qB have radicals equal to their respective maximal ideals. Both primary-ideal hypotheses are explicit; no kernel-containment premise is silently discarded. The coefficient map A→B is surjective.

Proof plan: Take the eventual evaluation witness for the A-polynomial. Transport its cumulative function values using the all-index extended-natural equality, then apply the existing uniqueness API of the B-polynomial. This consumes the existing general eventual-polynomial specification. It does not prove its Hilbert–Serre input.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-function-scalar-restriction, DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-polynomial.

## Intrinsic multiplicity under a surjective coefficient map

TauCeti.HilbertSamuel.multiplicity_restrictScalars_of_surjective (DeformationAndDerivedPatchingAlgebra:R03.3/intrinsic-multiplicity-scalar-restriction).

Under the polynomial comparison hypotheses, intrinsic multiplicity e(q;M) over A equals e(qB;M) over B.

Hypotheses: A and B are commutative rings with the given A-algebra structure on B. M is an additive commutative group with A- and B-module structures forming the given scalar tower. q is an ideal of A; qB is its image in B. All quotients and scalar actions are native ones. For polynomial and multiplicity comparisons, A and B are Noetherian local rings, M is finite over both, and q and qB have radicals equal to their respective maximal ideals. Both primary-ideal hypotheses are explicit; no kernel-containment premise is silently discarded. The coefficient map A→B is surjective.

Proof plan: Equal polynomials have equal natural degree and leading coefficient; substitute into the existing intrinsic factorial-times-leading-coefficient definition. This applies to the zero module too. It never replaces intrinsic degree by the dimension of the coefficient ring.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-polynomial-scalar-restriction, DeformationAndDerivedPatchingAlgebra:key/hilbert-samuel-multiplicity.

## A fixed coefficient extraction under scalar restriction

TauCeti.HilbertSamuel.multiplicityInDegree_restrictScalars_of_surjective (DeformationAndDerivedPatchingAlgebra:R03.3/degree-indexed-multiplicity-scalar-restriction).

Under the polynomial comparison hypotheses, for the same D≥0 on both sides, D! times the degree-D coefficient over A equals the degree-D extraction over B.

Hypotheses: A and B are commutative rings with the given A-algebra structure on B. M is an additive commutative group with A- and B-module structures forming the given scalar tower. q is an ideal of A; qB is its image in B. All quotients and scalar actions are native ones. For polynomial and multiplicity comparisons, A and B are Noetherian local rings, M is finite over both, and q and qB have radicals equal to their respective maximal ideals. Both primary-ideal hypotheses are explicit; no kernel-containment premise is silently discarded. The coefficient map is surjective; D is the same integer in both expressions.

Proof plan: Substitute equality of the polynomials in the existing coefficient-extraction definition. Different ambient dimension indices are not compared by this theorem.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-polynomial-scalar-restriction, DeformationAndDerivedPatchingAlgebra:R03.3/degree-indexed-multiplicity.

## The actual curve polynomial equals its explicit polynomial

TauCeti.HilbertSamuel.planeCurve_polynomial_eq_explicit (DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-general-polynomial-explicit).

The chosen general Hilbert–Samuel polynomial of q on C is the existing planeCurvePolynomial d, namely d(T+1)−d(d−1)/2.

Hypotheses: k is a field, R=k[[x,y]], f is an element of R, I=(f), C=R/I, v=(x,y), and q is the image of v under the actual quotient map. C is supplied with Noetherian and local instances and q has radical equal to its maximal ideal. Exact finite order(f)=d is assumed. No characteristic-zero or reducedness hypothesis is used.

Proof plan: Apply the existing curve-specific uniqueness theorem to the general polynomial and its eventual evaluation witness. No caller-supplied polynomial is introduced.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-polynomial, DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-polynomial-unique, DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial.

Test ScalarCurveTests.node_actual_polynomial [computation]: For f=x * y over ℚ, the general curve Hilbert–Samuel polynomial is 2T+1.

Test ScalarCurveTests.nonreduced_char_two_actual_polynomial [computation]: For f=x ^ 2 over ZMod 2, the general curve Hilbert–Samuel polynomial is 2T+1.

Test ScalarCurveTests.order_three_actual_polynomial [computation]: For f=x ^ 3 over ℚ, the general curve Hilbert–Samuel polynomial is 3T.

Test ScalarCurveTests.zero_equation_surface_boundary [non-example]: For f=0 over ℚ, the order is infinite and H(q;C,1)=3, retaining the quadratic surface growth rather than an order-zero curve polynomial.

## Intrinsic multiplicity of a finite-order plane equation

TauCeti.HilbertSamuel.planeCurve_multiplicity (DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-intrinsic-multiplicity).

The intrinsic multiplicity e(q;C) is d, including d=0 when the stated local data exists.

Hypotheses: k is a field, R=k[[x,y]], f is an element of R, I=(f), C=R/I, v=(x,y), and q is the image of v under the actual quotient map. C is supplied with Noetherian and local instances and q has radical equal to its maximal ideal. Exact finite order(f)=d is assumed. No characteristic-zero or reducedness hypothesis is used.

Proof plan: Substitute the explicit curve polynomial into the intrinsic definition and consume its factorial-times-leading-coefficient identity. For a field, d=0 is a unit equation and its quotient is the zero ring, so ordinary local-ring data is unavailable there. Unit boundary tests use the cumulative function without asserting a local instance.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-general-polynomial-explicit, DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial-normalization, DeformationAndDerivedPatchingAlgebra:key/hilbert-samuel-multiplicity.

Test ScalarCurveTests.smooth_intrinsic [computation]: For k=ℚ and f=x, the actual curve quotient at the image of (x,y), with the stated local/primary data, has intrinsic multiplicity 1.

Test ScalarCurveTests.node_intrinsic [computation]: For k=ℚ and f=x * y, the actual curve quotient at the image of (x,y), with the stated local/primary data, has intrinsic multiplicity 2.

Test ScalarCurveTests.cusp_intrinsic [computation]: For k=ℚ and f=y ^ 2 - x ^ 3, the actual curve quotient at the image of (x,y), with the stated local/primary data, has intrinsic multiplicity 2.

Test ScalarCurveTests.nonreduced_char_two_intrinsic [computation]: For k=ZMod 2 and f=x ^ 2, the actual curve quotient at the image of (x,y), with the stated local/primary data, has intrinsic multiplicity 2.

Test ScalarCurveTests.order_three_intrinsic [computation]: For k=ℚ and f=x ^ 3, the actual curve quotient at the image of (x,y), with the stated local/primary data, has intrinsic multiplicity 3.

Test ScalarCurveTests.unit_function_boundary [degenerate]: For f=1 over ℚ, the actual quotient is zero and every cumulative function value is zero. No local-ring instance or finite nonzero order is supplied for the zero quotient.

## Degree of the actual curve polynomial

TauCeti.HilbertSamuel.planeCurve_polynomial_degree (DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-general-polynomial-degree).

If d≠0, the chosen Hilbert–Samuel polynomial of q on C has natural degree one.

Hypotheses: k is a field, R=k[[x,y]], f is an element of R, I=(f), C=R/I, v=(x,y), and q is the image of v under the actual quotient map. C is supplied with Noetherian and local instances and q has radical equal to its maximal ideal. Exact finite order(f)=d is assumed. No characteristic-zero or reducedness hypothesis is used. d is nonzero.

Proof plan: Substitute the explicit polynomial and use its existing degree-one formula.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-general-polynomial-explicit, DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial-degree.

## Leading coefficient of the actual curve polynomial

TauCeti.HilbertSamuel.planeCurve_polynomial_leadingCoeff (DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-general-polynomial-leading-coefficient).

The chosen Hilbert–Samuel polynomial of q on C has leading coefficient d as a rational number.

Hypotheses: k is a field, R=k[[x,y]], f is an element of R, I=(f), C=R/I, v=(x,y), and q is the image of v under the actual quotient map. C is supplied with Noetherian and local instances and q has radical equal to its maximal ideal. Exact finite order(f)=d is assumed. No characteristic-zero or reducedness hypothesis is used.

Proof plan: Substitute the explicit polynomial and use its existing leading-coefficient formula.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-general-polynomial-explicit, DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial-leading-coefficient.

## Curve support dimension from the degree theorem

TauCeti.HilbertSamuel.planeCurve_supportDim (DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-support-dimension-from-polynomial).

If C is nontrivial and d≠0, its support dimension as a module over itself equals one.

Hypotheses: k is a field, R=k[[x,y]], f is an element of R, I=(f), C=R/I, v=(x,y), and q is the image of v under the actual quotient map. C is supplied with Noetherian and local instances and q has radical equal to its maximal ideal. Exact finite order(f)=d is assumed. No characteristic-zero or reducedness hypothesis is used. C is nontrivial and d≠0.

Proof plan: Combine the already planned general polynomial-degree/support-dimension theorem with the degree-one curve formula. The general degree theorem remains a required open proof input. This conditional consequence is not an independent proof of it or of the ambient power-series dimension upper bound.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-general-polynomial-degree, DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-degree.

Test ScalarCurveTests.node_support_dimension [compatibility]: For f=xy over ℚ with nontrivial actual quotient and the stated local/primary data, the planned general degree theorem gives support dimension one. This test depends on that open theorem.

## Degree-one multiplicity of the curve module

TauCeti.HilbertSamuel.planeCurve_multiplicityInDegree_one (DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-degree-one-multiplicity).

If d≠0, the degree-one extraction of the actual curve polynomial is d.

Hypotheses: k is a field, R=k[[x,y]], f is an element of R, I=(f), C=R/I, v=(x,y), and q is the image of v under the actual quotient map. C is supplied with Noetherian and local instances and q has radical equal to its maximal ideal. Exact finite order(f)=d is assumed. No characteristic-zero or reducedness hypothesis is used. d is nonzero.

Proof plan: Identify coefficient one with the leading coefficient using the proved polynomial-degree identity, and multiply by 1!.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-general-polynomial-degree, DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-general-polynomial-leading-coefficient, DeformationAndDerivedPatchingAlgebra:R03.3/degree-indexed-multiplicity, mathlib:Polynomial.coeff_natDegree.

## Higher coefficient extractions of the curve polynomial

TauCeti.HilbertSamuel.planeCurve_multiplicityInDegree_gt_one (DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-higher-degree-multiplicity-zero).

If d≠0 and D>1, the degree-D extraction of the actual curve polynomial is zero.

Hypotheses: k is a field, R=k[[x,y]], f is an element of R, I=(f), C=R/I, v=(x,y), and q is the image of v under the actual quotient map. C is supplied with Noetherian and local instances and q has radical equal to its maximal ideal. Exact finite order(f)=d is assumed. No characteristic-zero or reducedness hypothesis is used. d≠0 and D>1.

Proof plan: A coefficient above natural degree is zero. Multiply by D!. No dimension theorem is needed for this polynomial statement.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-general-polynomial-degree, DeformationAndDerivedPatchingAlgebra:R03.3/degree-indexed-multiplicity, mathlib:Polynomial.coeff_eq_zero_of_natDegree_lt.

Test ScalarCurveTests.nilpotent_higher_extraction [computation]: For f=x² over 𝔽₂, the actual curve polynomial has degree-three extraction zero despite nonzero nilpotents.

## Degree-two extraction in the ambient scalar ring

TauCeti.HilbertSamuel.planeCurve_multiplicityInDegree_two_restrictScalars (DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-degree-two-restricted-multiplicity-zero).

For d≠0, the degree-two extraction for module C over R at v is zero.

Hypotheses: k is a field, R=k[[x,y]], f is an element of R, I=(f), C=R/I, v=(x,y), and q is the image of v under the actual quotient map. C is supplied with Noetherian and local instances and q has radical equal to its maximal ideal. Exact finite order(f)=d is assumed. No characteristic-zero or reducedness hypothesis is used. For results over R with module C, R is also supplied with Noetherian and local instances, C is finite over R, and v has radical equal to the maximal ideal of R. A degree-two coefficient extraction is not an assertion that dim R=2; that dimension statement remains an independent required input. d is nonzero.

Proof plan: Use the actual surjective ring quotient as coefficient map. The same degree-two extraction equals that in C, whose polynomial has degree one. The result is raw coefficient extraction. Calling it ambient-normalized multiplicity additionally requires the separate dimension-two statement for R.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/degree-indexed-multiplicity-scalar-restriction, DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-higher-degree-multiplicity-zero, mathlib:Ideal.Quotient.mk_surjective.

## Intrinsic multiplicity with ambient scalars

TauCeti.HilbertSamuel.planeCurve_multiplicity_restrictScalars (DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-intrinsic-restricted-multiplicity).

The intrinsic multiplicity of module C over R at v equals d.

Hypotheses: k is a field, R=k[[x,y]], f is an element of R, I=(f), C=R/I, v=(x,y), and q is the image of v under the actual quotient map. C is supplied with Noetherian and local instances and q has radical equal to its maximal ideal. Exact finite order(f)=d is assumed. No characteristic-zero or reducedness hypothesis is used. For results over R with module C, R is also supplied with Noetherian and local instances, C is finite over R, and v has radical equal to the maximal ideal of R. A degree-two coefficient extraction is not an assertion that dim R=2; that dimension statement remains an independent required input.

Proof plan: Apply intrinsic multiplicity invariance along the actual quotient R→C, then use the intrinsic curve formula.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/intrinsic-multiplicity-scalar-restriction, DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-intrinsic-multiplicity, mathlib:Ideal.Quotient.mk_surjective.

## Degree-two extraction differs from intrinsic multiplicity

TauCeti.HilbertSamuel.planeCurve_degree_two_ne_intrinsic (DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-degree-two-intrinsic-distinction).

For d≠0, the degree-two extraction for C over R is different from its intrinsic multiplicity: the former is zero and the latter is d.

Hypotheses: k is a field, R=k[[x,y]], f is an element of R, I=(f), C=R/I, v=(x,y), and q is the image of v under the actual quotient map. C is supplied with Noetherian and local instances and q has radical equal to its maximal ideal. Exact finite order(f)=d is assumed. No characteristic-zero or reducedness hypothesis is used. For results over R with module C, R is also supplied with Noetherian and local instances, C is finite over R, and v has radical equal to the maximal ideal of R. A degree-two coefficient extraction is not an assertion that dim R=2; that dimension statement remains an independent required input. d is nonzero.

Proof plan: Use the two scalar-comparison formulas and the nonzero rational image of a nonzero natural number. With an additional dim R=2 input this is precisely the lower-dimensional module counterexample to equating ambient-normalized and intrinsic multiplicity.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-degree-two-restricted-multiplicity-zero, DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-intrinsic-restricted-multiplicity.

Test ScalarCurveTests.nilpotent_intrinsic_degree_two_distinction [non-example]: For f=x² over 𝔽₂ with the stated ambient/curve local and primary data, intrinsic multiplicity over R is 2, whereas degree-two extraction over R is zero. The coefficient characteristic does not turn the integer length 2 into zero.

## Incoming mathematical document and attribution

# Full curve tangent-cone assembly checkpoint

Codex — codex-7e92bd; Refs #551. This partial blueprint connects the existing native curve degree quotients to the existing Rees model of the associated graded ring. It adds 20 declarations, including three constructions, 16 API entries and 13 tests. All 210 incoming node objects, all eight stage statuses, both requests, all 15 gaps and the full general Hilbert–Samuel key contract remain in place. No implementation or stage is certified complete.

## The actual carriers and map

Let σ be finite, k a commutative ring, R=k[[σ]], v its variable ideal, F=(f), A=R/F, π:R→A, and q=π(v). Keep the previously specified graded ring G=Rees(q)/(q·Rees(q)), its native degree inclusions and its actual graded decomposition. Let H_n be Mathlib's homogeneous polynomial submodule of degree n.

The existing equivalence H_n/ker(ψ_f,n) ≃ q^n/(q·q^n), followed by the existing inclusion into G, gives j_f,n:H_n→G. Its value on p is the class of the Rees monomial with coefficient π(p) and degree n. The already specified Rees multiplication proves j_(n+m)(pr)=j_n(p)j_m(r); the degree-zero constant one maps to one. Mathlib's DirectSum.toAlgebra and polynomial decomposeAlgEquiv then assemble a k-algebra map θ_f:k[σ]→G. Its variables are the actual degree-one coordinate classes. Coefficients use the canonical k-action, including any coefficient kernel.

Every element of G is a finite sum of native degree classes. Inverting the existing degree comparison and choosing a polynomial representative of each of the finitely many classes proves θ_f surjective. This argument has no field, domain, Noetherian, reducedness, characteristic or equation-order hypothesis. It does use finite σ for the inherited homogeneous comparisons.

## The full kernel and grading

The actual native projection to degree n carries θ_f(p) to θ_f(p_n). Therefore θ_f(p)=0 precisely when every homogeneous p_n has zero degree class. Assume now that k has no zero divisors and order(f)=d is finite. The existing degreewise kernel gives p_n=0 for n<d and p_n=H_d(f)w_n for n≥d, with w_n homogeneous of degree n−d. Sum these witnesses only over the finite set of components of p. Then p=H_d(f)Σw_n. Conversely H_d(f) maps to zero because f−H_d(f) lies in v^(d+1), so every polynomial multiple maps to zero. Thus the kernel is the full principal ideal (H_d(f)).

The native algebra first-isomorphism theorem now yields k[σ]/(H_d(f)) ≃ₐ[k]G. On [p] it is θ_f(p); on a homogeneous representative it is exactly the pre-existing curve degree comparison followed by inclusion. The image of H_n under quotient then equivalence equals the native n-th component of G. This last Submodule.map equality is the explicit grading compatibility, without importing an unpinned generic homogeneous-quotient grading.

The full argument is an authored assembly of the credited [DDPA jet proof, §5](https://github.com/CBirkbeck/tauceti-explorer/blob/eb645dc85df65608c56fafc4d9ed0e71ab0ca3ce/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md), the incoming degree comparison and the pinned [direct-sum algebra interface](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/DirectSum/Algebra.lean). The graded/cumulative conventions remain those of [Stacks 00K4](https://stacks.math.columbia.edu/tag/00K4). This blueprint supplies proof plans and admitted Lean signatures, not new admission-free proofs of the inherited Rees branch.

## Boundary cases that distinguish the construction

For f=0, θ is injective as well as surjective, over arbitrary commutative coefficients. Zero has infinite order, so this conclusion is a separate degreewise argument. For f=1 the actual quotient and graded ring are zero. Over F₂ with f=X², X survives in degree one and X² vanishes in degree two: reduction would lose the required nilpotent class.

The no-zero-divisors hypothesis is essential to the stated principal-kernel theorem. Over Z/4Z with f=2+X, its initial form is 2. In A the coordinate equals −2, so its square is zero. Consequently θ(X²)=0, but X² is not in the polynomial ideal (2): its X² coefficient is 1, which is not divisible by 2 in Z/4Z. This is an authored test of the hypothesis boundary, not an erratum attributed to a source.

Order zero does not mean the equation is a unit over a general domain. Over ℤ with f=2+X, the initial ideal is (2), the coefficient 2 vanishes and the degree-one variable survives. With no variables and f=2 over ℤ, the degree-zero constant 1 also survives. The zero coefficient ring is permitted for the map but has no equation of exact finite order.

The earlier nonprincipal counterexample remains binding: initial forms of a chosen generating set need not generate the full initial ideal. No general ideal tangent-cone theorem is inferred from this principal equation result.

## Declarations, consumers, API and tests

All new declarations are planned in TauCeti/RingTheory/HilbertSamuel, namespace TauCeti.HilbertSamuel. Each construction consumes the existing native objects; no generic direct-sum algebra, quotient algebra, homogeneous-polynomial carrier or associated graded ring is replanned.

### Homogeneous representatives in the actual curve ideal power

`DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-representative-membership` — `TauCeti.HilbertSamuel.homogeneousCurveRepresentative_mem` (lemma).

For p∈H_n, the actual quotient representative π(p) lies in q^n.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-polynomial-lift`, `DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-polynomial-lift-value`, `DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-ideal-power`, `mathlib:Ideal.mem_map_of_mem`.

1. The existing homogeneousLift gives p in v^n and its value is the native polynomial inclusion into R. Map its membership along π.
2. Rewrite Ideal.map π (v^n) as q^n using the existing curve power adapter. No chosen degree quotient or synthetic carrier enters the membership proof.

### Homogeneous polynomial classes in the Rees quotient

`DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-map` — `TauCeti.HilbertSamuel.curveHomogeneousToGraded` (construction).

Define j_f,n:H_n→ₗ[k]G by the native quotient map H_n→H_n/ker(ψ_f,n), the existing homogeneousNativeCurveDegreeEquiv, and the existing degree-n adicPieceInclusion restricted to k.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-native-curve-degree-equivalence`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-piece-inclusion`, `mathlib:LinearMap.restrictScalars`.

1. Compose the three specified native linear maps. Restrict the last A-linear inclusion along k→A; the subalgebra and quotient scalar towers supply the same k-action on G.
2. The quotient-of-homogeneous-polynomials source is an intermediate carrier only. The codomain remains the existing Rees/qRees quotient.

API:

- `TauCeti.HilbertSamuel.curveHomogeneousToGraded_apply`: For p∈H_n, j_f,n(p)=adicMonomial q n ⟨π(p),homogeneousCurveRepresentative_mem f n p⟩.
- `TauCeti.HilbertSamuel.curveHomogeneousToGraded_piece`: j_f,n(p)=adicPieceInclusion q n (homogeneousNativeCurveDegreeEquiv f n [p]).
- `TauCeti.HilbertSamuel.curveHomogeneousToGraded_one`: j_f,0(1)=1 in the actual Rees quotient, including the zero quotient ring.
- `TauCeti.HilbertSamuel.curveHomogeneousToGraded_mul`: For p∈H_n and r∈H_m, j_f,n+m(p·r)=j_f,n(p)·j_f,m(r), where the source product is the native GradedMonoid.GMul product.
- `TauCeti.HilbertSamuel.curveHomogeneousToGraded_eq_zero`: j_f,n(p)=0 if and only if homogeneousCurveProjection f n p=0.

Consumers:

- DDPA-JET-HANDOFF §5 and the R03.3 plane-curve tangent-cone target: Assemble the already existing degreewise comparison into the actual multiplicative map and full principal kernel.
- Stacks 00K4, Proposition 10.59.5; reserved general Hilbert–Samuel key: Keep the actual associated graded ring and its degree pieces available to the future length/dimension comparison. This checkpoint does not prove general Hilbert–Serre, curve dimension or multiplicity identification.

Tests (each has a named `example` marker in the suggested file):

- `FullCurveGradedTests.native_representative` (compatibility): For p∈H_n, j_f,n(p) equals adicPieceInclusion applied to the existing homogeneousNativeCurveDegreeEquiv on [p].
- `FullCurveGradedTests.degree_zero_unit` (computation): The homogeneous constant 1 in H_0 maps to 1 in G, even when G is the zero ring.
- `FullCurveGradedTests.mixed_degree_product` (compatibility): In two variables, θ_f(X₀X₁²)=θ_f(X₀)θ_f(X₁)², mixing degrees one and two.

### The actual Rees monomial representative

`DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-representative` — `TauCeti.HilbertSamuel.curveHomogeneousToGraded_apply` (lemma).

For p∈H_n, j_f,n(p)=adicMonomial q n ⟨π(p),homogeneousCurveRepresentative_mem f n p⟩.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-map`, `DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-representative-membership`, `DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-native-curve-degree-representative`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-piece-inclusion`.

1. Evaluate the existing homogeneous comparison on the quotient class of p. Apply adicPieceInclusion_mk to obtain the literal Rees monomial of π(p) in degree n.
2. Proof irrelevance reconciles ideal-membership witnesses; no equality is inferred merely from dimensions.

### Compatibility with the existing native degree equivalence

`DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-piece` — `TauCeti.HilbertSamuel.curveHomogeneousToGraded_piece` (lemma).

j_f,n(p)=adicPieceInclusion q n (homogeneousNativeCurveDegreeEquiv f n [p]).

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-map`.

1. Unfold the composite defining j and the quotient map. This equality is the bridge to the already planned native ideal-power degree quotient.

### The homogeneous constant one

`DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-one` — `TauCeti.HilbertSamuel.curveHomogeneousToGraded_one` (lemma).

j_f,0(1)=1 in the actual Rees quotient, including the zero quotient ring.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-representative`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-monomial-map`, `mathlib:MvPolynomial.isHomogeneous_one`.

1. Use the representative formula in degree zero. Polynomial.monomial 0 1 is the Rees unit and both quotient maps preserve it.
2. This statement does not infer that 1 is nonzero; f=1 and the zero coefficient ring remain allowed.

### Multiplication of homogeneous curve classes

`DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-product` — `TauCeti.HilbertSamuel.curveHomogeneousToGraded_mul` (lemma).

For p∈H_n and r∈H_m, j_f,n+m(p·r)=j_f,n(p)·j_f,m(r), where the source product is the native GradedMonoid.GMul product.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-representative`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-homogeneous-product`, `mathlib:MvPolynomial.gradedAlgebra`.

1. Rewrite all three terms as Rees monomials. The existing adicMonomial_mul gives degree n+m and coefficient π(p)π(r).
2. The polynomial inclusion into power series and π are ring maps, so this coefficient is π(pr). Reconcile the subtype witnesses by extensionality.

### The polynomial map to the actual tangent cone

`DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-map` — `TauCeti.HilbertSamuel.curveGradedMap` (construction).

Construct the k-algebra map θ_f:k[σ]→ₐ[k]G by homogeneous decomposition followed by DirectSum.toAlgebra applied to j_f,n and its unit and multiplication laws.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-map`, `DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-one`, `DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-product`, `mathlib:DirectSum.toAlgebra`, `mathlib:DirectSum.decomposeAlgEquiv`, `mathlib:MvPolynomial.gradedAlgebra`.

1. Register MvPolynomial.gradedAlgebra locally; it is deliberately not a global instance in the pin.
2. Compose DirectSum.decomposeAlgEquiv for the native homogeneous submodules with DirectSum.toAlgebra. The latter requires exactly j_0(1)=1 and j_(n+m)(pr)=j_n(p)j_m(r), already separate prerequisites.
3. This constructs a multiplicative map on finite polynomial sums. It is not unquotiented truncation of formal series, which need not preserve multiplication.

API:

- `TauCeti.HilbertSamuel.curveGradedMap_homogeneous`: For p∈H_n, θ_f(p)=j_f,n(p).
- `TauCeti.HilbertSamuel.curveGradedMap_X`: θ_f(X_i)=j_f,1(X_i), hence the class of the actual curve coordinate π(X_i) in degree one.
- `TauCeti.HilbertSamuel.curveGradedMap_C`: θ_f(C(a))=algebraMap k G a for every a∈k.
- `TauCeti.HilbertSamuel.curveGradedMap_surjective`: θ_f is surjective for every f and arbitrary commutative coefficient ring k with finite σ.
- `TauCeti.HilbertSamuel.curveGradedMap_projection`: For every polynomial p and n, adicRingProjection q n (θ_f(p))=θ_f(homogeneousComponent n p).
- `TauCeti.HilbertSamuel.curveGradedMap_eq_zero_iff`: θ_f(p)=0 if and only if j_f,n(p_n)=0 for every native homogeneous component p_n of p.
- `TauCeti.HilbertSamuel.curveGradedMap_initial`: If d≤order(f), then θ_f(H_d(f))=0, including H_d(f)=0 when the order is larger than d.
- `TauCeti.HilbertSamuel.curveGradedMap_ker`: If k has no zero divisors and order(f)=d is finite, ker(θ_f)=Ideal.span{H_d(f)} as ideals of the full polynomial ring.

Consumers:

- DDPA-JET-HANDOFF §5 and the R03.3 plane-curve tangent-cone target: Assemble the already existing degreewise comparison into the actual multiplicative map and full principal kernel.
- Stacks 00K4, Proposition 10.59.5; reserved general Hilbert–Samuel key: Keep the actual associated graded ring and its degree pieces available to the future length/dimension comparison. This checkpoint does not prove general Hilbert–Serre, curve dimension or multiplicity identification.

Tests (each has a named `example` marker in the suggested file):

- `FullCurveGradedTests.zero_equation_injective` (degenerate): For f=0, θ_f is injective over every commutative k, including rings with nilpotents. This branch does not assume a fictitious finite order for zero.
- `FullCurveGradedTests.unit_equation` (degenerate): For f=1 every polynomial maps to zero in the actual associated graded ring.
- `FullCurveGradedTests.characteristic_two_repeated_equation` (non-example): Over F₂ with f=X², θ_f(X) is nonzero and θ_f(X²)=0; replacing the cone by its reduction fails this test.
- `FullCurveGradedTests.nilpotent_coefficients_extra_relation` (non-example): Over Z/4Z with f=2+X, θ_f(X²)=0 but X² does not lie in the polynomial ideal (2). A principal initial kernel without the no-zero-divisors hypothesis fails.
- `FullCurveGradedTests.order_zero_nonunit` (non-example): Over ℤ with f=2+X, θ_f(C(2))=0 while θ_f(X) is nonzero. Finite order zero does not imply the equation is a unit over a general domain.
- `FullCurveGradedTests.no_variables` (degenerate): With no variables over ℤ and f=2, θ_f(C(1)) is nonzero; the degree-zero quotient is retained.
- `FullCurveGradedTests.zero_coefficients` (degenerate): Over Z/1Z, θ_f(p)=0 for every polynomial p and equation f.

### Polynomial map on a homogeneous element

`DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-homogeneous` — `TauCeti.HilbertSamuel.curveGradedMap_homogeneous` (lemma).

For p∈H_n, θ_f(p)=j_f,n(p).

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-map`.

1. A homogeneous polynomial decomposes into the single degree-n summand. Evaluate DirectSum.toAlgebra on that summand.

### The prescribed degree-one generators

`DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-generator` — `TauCeti.HilbertSamuel.curveGradedMap_X` (lemma).

θ_f(X_i)=j_f,1(X_i), hence the class of the actual curve coordinate π(X_i) in degree one.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-homogeneous`, `DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-representative`, `mathlib:MvPolynomial.isHomogeneous_X`.

1. Apply the homogeneous formula to the native degree-one proof for X_i, then the actual Rees representative formula.

### Coefficients in degree zero

`DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-coefficient` — `TauCeti.HilbertSamuel.curveGradedMap_C` (lemma).

θ_f(C(a))=algebraMap k G a for every a∈k.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-map`.

1. Use the AlgHom commutation law and the native coefficient algebra map. This preserves coefficients even when their images in A/q are zero or nilpotent.

### Surjectivity onto the actual graded ring

`DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-surjective` — `TauCeti.HilbertSamuel.curveGradedMap_surjective` (lemma).

θ_f is surjective for every f and arbitrary commutative coefficient ring k with finite σ.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-homogeneous`, `DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-piece`, `DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-native-curve-degree-equivalence`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-expansion-bijective`.

1. Use adicExpansion_bijective to express an element of G as a finite sum of images of actual ideal-power quotient classes.
2. For each class, invert homogeneousNativeCurveDegreeEquiv and choose a representative in H_n of its source quotient. The piece compatibility and homogeneous formula show θ maps that polynomial to the required summand.
3. Sum only the finitely many representatives from the direct-sum support. Neither Noetherianity nor an equation-order hypothesis is used.

### Compatibility with homogeneous projections

`DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-projection` — `TauCeti.HilbertSamuel.curveGradedMap_projection` (lemma).

For every polynomial p and n, adicRingProjection q n (θ_f(p))=θ_f(homogeneousComponent n p).

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-homogeneous`, `DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-piece`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-ring-grading-registration`, `mathlib:MvPolynomial.sum_homogeneousComponent`, `mathlib:MvPolynomial.homogeneousComponent_mem`.

1. Expand p as the finite sum of its native homogeneous components, then use linearity of θ and the native adic projection.
2. adicRingProjection_inclusion kills each degree other than n and fixes degree n. This is degree separation in the actual Rees quotient, not an assumed grading on a new carrier.

### Separation of the full kernel by degrees

`DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-vanishing` — `TauCeti.HilbertSamuel.curveGradedMap_eq_zero_iff` (lemma).

θ_f(p)=0 if and only if j_f,n(p_n)=0 for every native homogeneous component p_n of p.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-projection`, `DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-homogeneous`, `mathlib:MvPolynomial.sum_homogeneousComponent`.

1. Forward, apply every adic projection to θ(p)=0 and use the projection compatibility.
2. Backward, write p as the finite sum over n≤totalDegree p. Each summand maps to zero by the hypothesis, so θ(p)=0. This avoids an invalid cancellation argument between different degrees.

### The existing degree kernel inside the graded ring

`DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-vanishing` — `TauCeti.HilbertSamuel.curveHomogeneousToGraded_eq_zero` (lemma).

j_f,n(p)=0 if and only if homogeneousCurveProjection f n p=0.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-piece`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-piece-inclusion`, `DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-native-curve-degree-vanishing`.

1. Use injectivity and preservation of zero for adicPieceInclusion, then the existing homogeneous-native comparison vanishing criterion.

### The initial form vanishes

`DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-initial-relation` — `TauCeti.HilbertSamuel.curveGradedMap_initial` (lemma).

If d≤order(f), then θ_f(H_d(f))=0, including H_d(f)=0 when the order is larger than d.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-homogeneous`, `DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-vanishing`, `DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-degree`, `DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-series`, `DeformationAndDerivedPatchingAlgebra:R03.3/degree-component-next-power`, `DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-projection-vanishing`, `DeformationAndDerivedPatchingAlgebra:R03.3/variable-ideal-power-order`.

1. The order lower bound places f in v^d; its degree-d homogeneous component also lies in v^d.
2. Their difference has zero degree-d component, hence lies in v^(d+1) by the existing next-power criterion. Thus H_d(f) lies in (f)+v^(d+1).
3. Use the actual equation-jet vanishing criterion, its homogeneous polynomial adapter and the graded homogeneous formula. No no-zero-divisors assumption is needed for this direction.

### The full principal initial ideal

`DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-principal-kernel` — `TauCeti.HilbertSamuel.curveGradedMap_ker` (lemma).

If k has no zero divisors and order(f)=d is finite, ker(θ_f)=Ideal.span{H_d(f)} as ideals of the full polynomial ring.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-vanishing`, `DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-piece`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-piece-inclusion`, `DeformationAndDerivedPatchingAlgebra:R03.3/native-curve-degree-principal-kernel`, `DeformationAndDerivedPatchingAlgebra:R03.3/native-curve-degree-below-order`, `DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-initial-relation`, `mathlib:MvPolynomial.sum_homogeneousComponent`.

1. For p in ker θ, the separation theorem places each p_n in the degreewise kernel. If n<d, the existing below-order criterion gives p_n=0. If d≤n, the principal degree criterion produces an actual homogeneous w_n with p_n=H_d(f)w_n.
2. Choose w_n only for the finite range n≤totalDegree p, assigning zero in the lower branch. Sum those equations and factor H_d(f) to show p lies in its principal ideal. This supplies a polynomial witness, rather than an unsupported infinite sum.
3. For the reverse inclusion, the initial-relation theorem puts H_d(f) in ker θ; kernel ideal closure gives every multiple. Retain NoZeroDivisors and exact finite order for the forward direction.
4. The Z/4Z example f=2+X has X² in ker θ but outside (2), showing why the domain-type hypothesis cannot simply be deleted. Order zero over the domain ℤ is allowed: f=2+X has initial ideal (2), not the unit ideal.

### The principal tangent-cone algebra equivalence

`DeformationAndDerivedPatchingAlgebra:R03.3/curve-tangent-cone-equivalence` — `TauCeti.HilbertSamuel.curveTangentConeEquiv` (construction).

If k has no zero divisors and order(f)=d is finite, construct k[σ]/(H_d(f)) ≃ₐ[k] adicGradedRing q from θ_f and its actual full kernel.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-map`, `DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-surjective`, `DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-principal-kernel`, `mathlib:Ideal.quotientKerAlgEquivOfSurjective`, `mathlib:Ideal.quotEquivOfEq`, `mathlib:AlgEquiv.ofRingEquiv`.

1. Apply the existing algebra first-isomorphism theorem to θ and its proved surjectivity.
2. Transport the source along the proved equality between ker θ and the principal ideal, using the native quotient equivalence and preserving the canonical k-action.
3. The target is the inherited Rees quotient. Do not define it to be k[σ]/(H_d(f)); that would make the comparison circular.

API:

- `TauCeti.HilbertSamuel.curveTangentConeEquiv_mk`: The tangent-cone equivalence sends the quotient class of every polynomial p to θ_f(p).
- `TauCeti.HilbertSamuel.curveTangentConeEquiv_homogeneous`: For p∈H_n, the tangent-cone equivalence sends [p] to j_f,n(p), hence to the previously constructed actual degree quotient class of π(p).
- `TauCeti.HilbertSamuel.curveTangentConeEquiv_component`: For each n, the image of H_n under polynomial quotient followed by the tangent-cone equivalence equals (adicRingComponents q n).restrictScalars k.

Consumers:

- DDPA-JET-HANDOFF §5 and the R03.3 plane-curve tangent-cone target: Assemble the already existing degreewise comparison into the actual multiplicative map and full principal kernel.
- Stacks 00K4, Proposition 10.59.5; reserved general Hilbert–Samuel key: Keep the actual associated graded ring and its degree pieces available to the future length/dimension comparison. This checkpoint does not prove general Hilbert–Serre, curve dimension or multiplicity identification.

Tests (each has a named `example` marker in the suggested file):

- `FullCurveGradedTests.quotient_generator` (compatibility): The tangent-cone equivalence sends [X_i] to j_f,1(X_i), the specified native degree-one coordinate class.
- `FullCurveGradedTests.quotient_constant` (compatibility): The tangent-cone equivalence sends [C(a)] to θ_f(C(a)), the canonical scalar image.
- `FullCurveGradedTests.quotient_inverse` (characterisation): Applying the inverse tangent-cone equivalence to θ_f(p) recovers the native quotient class [p].

### The tangent-cone comparison on representatives

`DeformationAndDerivedPatchingAlgebra:R03.3/curve-tangent-cone-representative` — `TauCeti.HilbertSamuel.curveTangentConeEquiv_mk` (lemma).

The tangent-cone equivalence sends the quotient class of every polynomial p to θ_f(p).

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/curve-tangent-cone-equivalence`, `mathlib:Ideal.quotientKerAlgEquivOfSurjective_mk`.

1. Unfold the quotient transport and use the native first-isomorphism representative formula. The equality is on the actual polynomial class.

### Compatibility with native curve degree pieces

`DeformationAndDerivedPatchingAlgebra:R03.3/curve-tangent-cone-homogeneous` — `TauCeti.HilbertSamuel.curveTangentConeEquiv_homogeneous` (lemma).

For p∈H_n, the tangent-cone equivalence sends [p] to j_f,n(p), hence to the previously constructed actual degree quotient class of π(p).

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/curve-tangent-cone-representative`, `DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-graded-homogeneous`, `DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-piece`.

1. Combine the representative formula with θ on a homogeneous polynomial and j compatibility with homogeneousNativeCurveDegreeEquiv.

### The comparison identifies every homogeneous component

`DeformationAndDerivedPatchingAlgebra:R03.3/curve-tangent-cone-components` — `TauCeti.HilbertSamuel.curveTangentConeEquiv_component` (lemma).

For each n, the image of H_n under polynomial quotient followed by the tangent-cone equivalence equals (adicRingComponents q n).restrictScalars k.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/curve-tangent-cone-homogeneous`, `DeformationAndDerivedPatchingAlgebra:R03.3/curve-homogeneous-graded-piece`, `DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-native-curve-degree-equivalence`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-ring-homogeneous-components`.

1. For the forward inclusion, the homogeneous representative formula factors through adicPieceInclusion, whose range defines the native target component.
2. For the reverse inclusion, choose a source of the range element, invert homogeneousNativeCurveDegreeEquiv, and choose a representative in H_n. The homogeneous formula maps its quotient class to the required element.
3. The source component is the image of the native H_n in k[σ]/(H_d(f)), expressed by Submodule.map. Thus the equality establishes grading compatibility without assuming a generic quotient-grading implementation from an unpinned PR.

## Validation and remaining work

The indexed packet checker reports zero errors and warnings. The handoff records exact source hashes, compile availability and the actual assembler checks. The new suggested declarations and tests use `sorry`; all implementation statuses remain unchecked. No new admission-free Rees proof archive is asserted. The predecessor's separately checked degree-comparison evidence remains attributed in the retained incoming reader and handoff.

Implement and check the new assembly bodies together with the inherited Rees coefficient-ideal, direct-sum decomposition and grading bodies. Then prove curve/support dimension and identify the explicit curve polynomial with the general cumulative polynomial through its specification. Intrinsic multiplicity uses dim Supp M; the ambient normalization uses dim A and can vanish when the support dimension is smaller. Preserve the distinction between unmixedness and minimal-prime formal equidimensionality in the existing key boundary. General Hilbert–Serre, degree/dimension, Artin–Rees, completion, localization lengths, associativity, all routed papers and all eight stage targets remain required. The R03.6 part remains separate. The inherited LocalFieldsRamification layer-0 → R03.4 missing path and the two supplier requests are not closed here.

## Complete incoming reader, retained with attribution

# The actual curve degree quotient

Current checkpoint: Codex — codex-rtOQ9t; Refs #551. The packet has 210 nodes; all 192 incoming node objects remain identical. Every implementation status is unchecked and every existing stage remains partial or not_read.

This partial P7/R03 checkpoint contains 210 declarations, preserving all 192 incoming node objects and the full general Noetherian-local finite-module Hilbert–Samuel key. Eighteen new declarations compare the actual equation-jet image with successive powers of the curve variable ideal, then identify the homogeneous polynomial quotient with the actual degree piece. Fifteen named boundary tests cover zero/unit equations, no variables, nilpotent coefficients and the characteristic-two nonreduced equation. Degreewise principal kernels retain exact-order and no-zero-divisors hypotheses. Multiplicative full graded assembly, dimension, general multiplicity and all inherited stage/source obligations remain open.

Let R=k[[σ]], v=(X_i), F=(f), A=R/F and π:R→A. Write q=Ideal.map π v and π_n:A→A/q^(n+1). The actual degree carrier is the quotient of the native ideal subtype q^n by the A-submodule q • top; its denominator is q·q^n=q^(n+1). Coefficient scalars descend through the actual quotient algebra maps. The image and ideal-power comparisons allow arbitrary σ. Finite σ is imposed for the existing homogeneous polynomial comparisons.

The construction follows the actual maps. Since ideal maps commute with powers, the pinned third algebra isomorphism gives A/q^(n+1) ≃ R/(F+v^(n+1)). A representative of π_n(q^n) lifts first to q^n and then to v^n; the representative formula puts its image in the existing equation-jet range. Conversely a witness g∈v^n gives π(g)∈q^n and an actual preimage. Injectivity comes from the jet equivalence. Mathlib already supplies the generic q^n/(q·q^n) ≃ π_n(q^n); scalar restriction to k and composition supply the curve comparison. Finally compose with the incoming homogeneous quotient-image equivalence. No dimension, support or eventual-polynomial theorem is used.

For no-zero-divisor coefficients and exact finite order d, the actual degree class of p vanishes exactly when p=H_d(f)w with w homogeneous of degree n−d and d≤n. Below an order lower bound, the class vanishes exactly when p=0 without the domain condition. The zero equation has infinite order and is tested separately. The unit equation gives zero in every actual degree piece. The characteristic-two equation X² is not assumed reduced: X survives in degree one and X² vanishes in degree two. Over Z/4Z and f=0, 2X survives in degree one.

The actual equation-jet image is now compared with the native q^n/(q·q^n) carrier in A=R/(f), using the pinned general quotient theorem, with homogeneous representative and principal degreewise kernel adapters. Assemble the generator-compatible multiplication and full graded tangent-cone isomorphism. Curve/support dimension, comparison with the general cumulative polynomial and intrinsic/ambient multiplicity remain open. General Hilbert–Serre, Artin–Rees, completion, localization, associativity, all eight stage targets and every routed-paper obligation remain required; canonical bodies remain admitted and all nodes unchecked.

The new node specifications, APIs and tests are listed below. The historical reader follows unchanged and remains attributed to its original workers.

## Powers of the curve variable ideal

DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-ideal-power · TauCeti.HilbertSamuel.curveAdicIdeal_pow

For R=k[[σ]], F=(f), A=R/F, π:R→A and q=π(v), q^n=π(v^n) for every n.

Proof: Apply the existing ideal-map power theorem to the actual quotient map and reverse the equality.

Prerequisites: mathlib:Ideal.map_pow.

## The actual curve adic jet

DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-equivalence · TauCeti.HilbertSamuel.curveJetEquiv

Define the canonical k-algebra equivalence A/q^(n+1) ≃ R/(F+v^(n+1)), for every equation f and every n.

Proof: Transport the denominator along q^(n+1)=π(v^(n+1)). Apply the pinned third isomorphism theorem for algebras to F and v^(n+1); no order or domain hypothesis enters.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-ideal-power, mathlib:Ideal.quotEquivOfEq, mathlib:AlgEquiv.ofRingEquiv, mathlib:DoubleQuot.quotQuotEquivQuotSupₐ.

- TauCeti.HilbertSamuel.curveJetEquiv_mk (simp): The jet equivalence sends the iterated class of π(g) to the actual class of g modulo F+v^(n+1).
- TauCeti.HilbertSamuel.curveAdicIdeal_pow (compatibility): For R=k[[σ]], F=(f), A=R/F, π:R→A and q=π(v), q^n=π(v^n) for every n.
- TauCeti.HilbertSamuel.curveJetEquiv_image_mem (compatibility): The curve jet equivalence sends π_n(q^n), an ideal in A/q^(n+1), into the k-linear image of the existing degree projection φ_f,n:v^n→R/(F+v^(n+1)).

- NativeCurveDegreeTests.jet_zero: For every f and n, the actual curve jet equivalence preserves zero.
- NativeCurveDegreeTests.jet_unit: For f=1, every iterated representative maps to zero in the actual equation-jet quotient.
- NativeCurveDegreeTests.jet_inverse: The inverse actual jet equivalence returns the iterated quotient representative for every g.

## The curve jet on representatives

DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-representative · TauCeti.HilbertSamuel.curveJetEquiv_mk

The jet equivalence sends the iterated class of π(g) to the actual class of g modulo F+v^(n+1).

Proof: Evaluate equal-ideal transport and the native third isomorphism equivalence on the actual quotient representative.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-equivalence, mathlib:Ideal.quotEquivOfEq_mk.

## The curve jet image lies in the equation-jet image

DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-image-membership · TauCeti.HilbertSamuel.curveJetEquiv_image_mem

The curve jet equivalence sends π_n(q^n), an ideal in A/q^(n+1), into the k-linear image of the existing degree projection φ_f,n:v^n→R/(F+v^(n+1)).

Proof: Use surjectivity of A→A/q^(n+1) to lift an ideal-image element to a∈q^n. Use q^n=π(v^n) and surjectivity of π to lift a to g∈v^n. Evaluate the jet comparison on g to obtain the required image witness.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-ideal-power, DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-representative, DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-projection, mathlib:Ideal.mem_map_iff_of_surjective.

## The actual curve degree image map

DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-image-map · TauCeti.HilbertSamuel.curveJetImageMap

Restrict the curve jet k-linear map to π_n(q^n) and corestrict its target to image(φ_f,n).

Proof: Compose the native ideal subtype inclusion with the algebra equivalence viewed as a k-linear map. Corestrict using the proved membership lemma.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-image-membership, DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-equivalence, mathlib:LinearMap.codRestrict, mathlib:LinearMap.restrictScalars.

- TauCeti.HilbertSamuel.curveJetImageMap_apply (simp): After coercion, the actual image map agrees with the curve jet equivalence on each element of π_n(q^n).
- TauCeti.HilbertSamuel.curveJetImageMap_bijective (characterisation): The k-linear map π_n(q^n)→image(φ_f,n) is bijective.
- TauCeti.HilbertSamuel.curveJetEquiv_image_mem (compatibility): The curve jet equivalence sends π_n(q^n), an ideal in A/q^(n+1), into the k-linear image of the existing degree projection φ_f,n:v^n→R/(F+v^(n+1)).

- NativeCurveDegreeTests.image_zero: The actual image map sends zero in π_n(q^n) to zero in the equation-jet range.
- NativeCurveDegreeTests.image_representative: The actual image map sends the quotient representative of π(g), with its proved membership, to φ_f,n(g).
- NativeCurveDegreeTests.image_inverse: The inverse actual image equivalence returns each original element of π_n(q^n) after the image map.

## The curve image map value

DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-image-value · TauCeti.HilbertSamuel.curveJetImageMap_apply

After coercion, the actual image map agrees with the curve jet equivalence on each element of π_n(q^n).

Proof: Evaluate subtype composition and corestriction.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-image-map.

## The curve image map is bijective

DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-image-bijective · TauCeti.HilbertSamuel.curveJetImageMap_bijective

The k-linear map π_n(q^n)→image(φ_f,n) is bijective.

Proof: Injectivity follows by coercing an equality and using injectivity of the jet equivalence. For an image witness g∈v^n, use π(g)∈q^n and the class of π(g) as a preimage. The representative formula gives equality.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-image-map, DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-representative, DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-ideal-power, mathlib:Ideal.mem_map_of_mem.

## The curve image comparison

DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-image-equivalence · TauCeti.HilbertSamuel.curveJetImageEquiv

Upgrade the proved curve image map to a k-linear equivalence π_n(q^n) ≃ image(φ_f,n).

Proof: Apply the native equivalence constructor to the actual map and its proved bijectivity.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-image-bijective, mathlib:LinearEquiv.ofBijective.

- TauCeti.HilbertSamuel.curveJetImageEquiv_mk (simp): For g∈v^n and its proved membership π(g)∈q^n, the image equivalence sends the actual class of π(g) to φ_f,n(g).
- TauCeti.HilbertSamuel.curveJetImageMap_bijective (characterisation): The k-linear map π_n(q^n)→image(φ_f,n) is bijective.
- TauCeti.HilbertSamuel.curveJetImageMap_apply (coercion): After coercion, the actual image map agrees with the curve jet equivalence on each element of π_n(q^n).

- NativeCurveDegreeTests.image_zero: The actual image map sends zero in π_n(q^n) to zero in the equation-jet range.
- NativeCurveDegreeTests.image_representative: The actual image map sends the quotient representative of π(g), with its proved membership, to φ_f,n(g).
- NativeCurveDegreeTests.image_inverse: The inverse actual image equivalence returns each original element of π_n(q^n) after the image map.

## The curve image equivalence on representatives

DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-image-representative · TauCeti.HilbertSamuel.curveJetImageEquiv_mk

For g∈v^n and its proved membership π(g)∈q^n, the image equivalence sends the actual class of π(g) to φ_f,n(g).

Proof: Evaluate the equivalence constructor on the image representative and use the jet representative formula.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-image-equivalence, DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-representative.

## The actual curve graded piece

DeformationAndDerivedPatchingAlgebra:R03.3/native-curve-degree-equivalence · TauCeti.HilbertSamuel.nativeCurveDegreeEquiv

Define the k-linear equivalence (q^n/(q·q^n)) ≃ image(φ_f,n), using the native quotient of the q^n subtype by q • top, with its actual A-module structure restricted to k.

Proof: Reuse the pinned general equivalence from the successive ideal-power quotient to π_n(q^n); it is already in Mathlib and is not re-planned. Restrict this A-linear equivalence to k using the actual scalar tower, then compose with the proved image equivalence.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-image-equivalence, mathlib:Ideal.powQuotPowSuccLinearEquivMapMkPowSuccPow, mathlib:LinearEquiv.restrictScalars.

- TauCeti.HilbertSamuel.nativeCurveDegreeEquiv_mk (simp): For g∈v^n and π(g)∈q^n, the curve degree equivalence sends the native class of π(g) in q^n/(q·q^n) to φ_f,n(g).
- TauCeti.HilbertSamuel.nativeCurveDegreeEquiv_symm (equivalence): The inverse curve degree equivalence sends the image element φ_f,n(g) to the native class of π(g), for every g∈v^n and its membership proof.
- TauCeti.HilbertSamuel.nativeCurveDegreeEquiv_mk_eq_zero (characterisation): For g∈v^n, its native class of π(g) in q^n/(q·q^n) is zero if and only if g∈F+v^(n+1).

- NativeCurveDegreeTests.native_zero: The actual successive-power quotient equivalence preserves zero for every f and n.
- NativeCurveDegreeTests.native_roundtrip: Every element of the actual q^n/(q·q^n) carrier survives the forward and inverse comparison unchanged.
- NativeCurveDegreeTests.zero_equation: For f=0, the actual degree class of p vanishes exactly when the homogeneous polynomial p is zero, including non-domain coefficients.

## The curve graded piece on representatives

DeformationAndDerivedPatchingAlgebra:R03.3/native-curve-degree-representative · TauCeti.HilbertSamuel.nativeCurveDegreeEquiv_mk

For g∈v^n and π(g)∈q^n, the curve degree equivalence sends the native class of π(g) in q^n/(q·q^n) to φ_f,n(g).

Proof: Evaluate the pinned ideal-power quotient equivalence on a subtype representative, then apply the curve jet representative formula.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/native-curve-degree-equivalence, DeformationAndDerivedPatchingAlgebra:R03.3/curve-adic-jet-representative.

## The inverse curve degree comparison

DeformationAndDerivedPatchingAlgebra:R03.3/native-curve-degree-inverse · TauCeti.HilbertSamuel.nativeCurveDegreeEquiv_symm

The inverse curve degree equivalence sends the image element φ_f,n(g) to the native class of π(g), for every g∈v^n and its membership proof.

Proof: Apply injectivity of the forward equivalence, its right inverse law and the proved representative formula.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/native-curve-degree-equivalence, DeformationAndDerivedPatchingAlgebra:R03.3/native-curve-degree-representative.

## Homogeneous polynomials and the actual curve graded piece

DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-native-curve-degree-equivalence · TauCeti.HilbertSamuel.homogeneousNativeCurveDegreeEquiv

For finite σ, compose the existing homogeneous quotient-image equivalence with the inverse curve degree equivalence to obtain P_n/ker(ψ_f,n) ≃ q^n/(q·q^n), k-linearly.

Proof: Compose the existing equivalence with the inverse of the new actual ideal-power quotient equivalence. Keep both native quotient carriers and their scalar structures.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-curve-quotient-image-equivalence, DeformationAndDerivedPatchingAlgebra:R03.3/native-curve-degree-equivalence.

- TauCeti.HilbertSamuel.homogeneousNativeCurveDegreeEquiv_mk (simp): The homogeneous comparison sends the class of p∈P_n to the native class of π(p) in q^n/(q·q^n), using polynomial inclusion into R.
- TauCeti.HilbertSamuel.homogeneousNativeCurveDegreeEquiv_eq_zero (characterisation): The image of the class of p∈P_n in the actual curve graded piece is zero if and only if ψ_f,n(p)=0.
- TauCeti.HilbertSamuel.nativeCurveDegree_principal_kernel (relation): If k has no zero divisors, order(f)=d is finite and d≤n, the image of p∈P_n in q^n/(q·q^n) is zero if and only if p=H_d(f)w for a native homogeneous polynomial w of degree n−d.
- TauCeti.HilbertSamuel.nativeCurveDegree_below_order (characterisation): If d≤order(f) and n<d, the image of p∈P_n in q^n/(q·q^n) is zero if and only if p=0; no no-zero-divisors assumption is needed.

- NativeCurveDegreeTests.homogeneous_roundtrip: A homogeneous polynomial quotient class survives the actual curve comparison and its inverse unchanged.
- NativeCurveDegreeTests.zero_equation: For f=0, the actual degree class of p vanishes exactly when the homogeneous polynomial p is zero, including non-domain coefficients.
- NativeCurveDegreeTests.unit_equation: For f=1, every homogeneous polynomial maps to zero in the actual curve degree quotient.
- NativeCurveDegreeTests.no_variables_constant: Over F₂ with no variables, the degree-zero constant 1 survives in the actual quotient for f=0.
- NativeCurveDegreeTests.nilpotent_coeff_survives: Over Z/4Z and f=0, the homogeneous polynomial 2X has nonzero actual degree-one class, without assuming the coefficient ring is a domain.
- NativeCurveDegreeTests.characteristic_two_repeated_killed: Over F₂ with f=X², the homogeneous polynomial X² maps to zero in the actual curve degree-two quotient.
- NativeCurveDegreeTests.characteristic_two_repeated_survives: Over F₂ with the nonreduced equation f=X², the homogeneous polynomial X has nonzero actual degree-one class.

## The homogeneous comparison on representatives

DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-native-curve-degree-representative · TauCeti.HilbertSamuel.homogeneousNativeCurveDegreeEquiv_mk

The homogeneous comparison sends the class of p∈P_n to the native class of π(p) in q^n/(q·q^n), using polynomial inclusion into R.

Proof: Apply injectivity of the curve degree equivalence and compare both sides in the actual equation-jet quotient using the two representative formulas.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-native-curve-degree-equivalence, DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-curve-quotient-representative, DeformationAndDerivedPatchingAlgebra:R03.3/native-curve-degree-representative, DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-polynomial-lift.

## Vanishing in the actual curve graded piece

DeformationAndDerivedPatchingAlgebra:R03.3/native-curve-degree-class-vanishing · TauCeti.HilbertSamuel.nativeCurveDegreeEquiv_mk_eq_zero

For g∈v^n, its native class of π(g) in q^n/(q·q^n) is zero if and only if g∈F+v^(n+1).

Proof: Use injectivity and preservation of zero for the equivalence to compare vanishing with φ_f,n(g)=0. Apply the existing equation-jet vanishing criterion. This is an actual quotient statement, with no reducedness or equation-order assumption.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/native-curve-degree-equivalence, DeformationAndDerivedPatchingAlgebra:R03.3/native-curve-degree-representative, DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-projection-vanishing.

## The homogeneous comparison vanishing criterion

DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-native-curve-degree-vanishing · TauCeti.HilbertSamuel.homogeneousNativeCurveDegreeEquiv_eq_zero

The image of the class of p∈P_n in the actual curve graded piece is zero if and only if ψ_f,n(p)=0.

Proof: Injectivity and zero preservation reduce to vanishing of the source quotient class. The native quotient criterion identifies that vanishing with membership in the actual kernel of ψ.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-native-curve-degree-equivalence, mathlib:LinearEquiv.map_eq_zero_iff, mathlib:Submodule.Quotient.mk_eq_zero, mathlib:LinearMap.mem_ker.

## The principal relation in the actual graded piece

DeformationAndDerivedPatchingAlgebra:R03.3/native-curve-degree-principal-kernel · TauCeti.HilbertSamuel.nativeCurveDegree_principal_kernel

If k has no zero divisors, order(f)=d is finite and d≤n, the image of p∈P_n in q^n/(q·q^n) is zero if and only if p=H_d(f)w for a native homogeneous polynomial w of degree n−d.

Proof: Apply the proved homogeneous vanishing criterion and the existing principal equation-jet kernel theorem. Both directions retain the exact finite-order and no-zero-divisors hypotheses.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-native-curve-degree-vanishing, DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-curve-principal-kernel.

## Curve graded pieces below the equation order

DeformationAndDerivedPatchingAlgebra:R03.3/native-curve-degree-below-order · TauCeti.HilbertSamuel.nativeCurveDegree_below_order

If d≤order(f) and n<d, the image of p∈P_n in q^n/(q·q^n) is zero if and only if p=0; no no-zero-divisors assumption is needed.

Proof: Apply the homogeneous vanishing criterion and the existing strict-below-order equation-jet theorem. The infinite order of the zero equation is not replaced by a finite exact order.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-native-curve-degree-vanishing, DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-curve-low-degree-injectivity.

The fresh source basis is the credited [DDPA jet argument](https://github.com/CBirkbeck/tauceti-explorer/blob/eb645dc85df65608c56fafc4d9ed0e71ab0ca3ce/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md), §§2–5, and [Stacks 00K4](https://stacks.math.columbia.edu/tag/00K4), with the exact pinned native ideal quotient statements recorded in the packet. The finite-variable arbitrary-coefficient application is authored here; this is not attributed to a printed general Hilbert–Serre theorem.

---
# Native degree quotients and equation-jet images

Let σ be finite and k be any commutative ring. Write R=k[[X_i]], v=(X_i), P=k[X_i], P_n for the native degree-n homogeneous polynomial submodule, H_n for the existing polynomial component, φ for the existing ideal-power-to-equation-jet map. All maps below are k-linear. The denominator v•top is the native submodule of the ideal-power subtype, restricted from R to k; no new quotient carrier is introduced.

The coefficient identity shows g−H_n(g) lies in the next ideal power whenever g∈v^n. Polynomial inclusion is a section of D_n and gives every homogeneous representative. Its kernel is the actual denominator v·v^n. Transporting that denominator to the kernel and using the pinned first isomorphism theorem gives the ambient equivalence. For an equation f, composition with φ gives ψ. The same remainder identity proves φ=ψD_n and equality of their actual images. The pinned first isomorphism theorem then gives P_n/ker ψ≃image φ. These equivalences preserve the displayed representatives; the inverse ambient map is the actual class of polynomial inclusion.

The principal degreewise kernel needs exact finite order and no zero divisors. Below the equation order only a lower bound is needed. The zero equation has infinite order and a trivial homogeneous kernel. A unit equation kills every image. None of these facts identifies image φ with the intrinsic q-power quotient in R/(f) without a further comparison. The full graded map, multiplication, principal ideal identity, support dimension and general Hilbert–Samuel results remain required.

### Homogeneous polynomials in ideal powers

TauCeti.HilbertSamuel.homogeneousLift. The k-linear map L_n:P_n→v^n sends a native degree-n homogeneous polynomial to its native series inclusion; its ideal membership is part of the data.

Use native polynomial inclusion and its additive and scalar compatibility. The existing homogeneity comparison and ideal-power membership supply the subtype witness.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-series-homogeneity, DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-variable-ideal-membership, mathlib:MvPolynomial.homogeneousSubmodule.

API TauCeti.HilbertSamuel.homogeneousLift_apply (simp): For every p∈P_n, the underlying series of L_n(p) is exactly the native inclusion of p.

API TauCeti.HilbertSamuel.degreePolynomial_lift (simp): For every p∈P_n, D_n(L_n(p))=p.

API TauCeti.HilbertSamuel.degreePolynomial_surjective (simp): D_n is surjective for every n. No field or flatness hypothesis is required.

Test DegreeQuotientTests.lift_zero: For every n, L_n sends the zero homogeneous polynomial to the zero element of v^n.

Test DegreeQuotientTests.lift_variable: The lift of the native degree-one polynomial X_i has underlying series exactly X_i.

Test DegreeQuotientTests.lift_torsion: Over ℤ/4ℤ in two variables, the lift of the degree-one polynomial 2X has underlying series 2X; nilpotent coefficients are retained.

### Value of the homogeneous lift

TauCeti.HilbertSamuel.homogeneousLift_apply. For every p∈P_n, the underlying series of L_n(p) is exactly the native inclusion of p.

Unfold the constructed map and take its underlying series.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-polynomial-lift.

### Polynomial projection of an ideal power

TauCeti.HilbertSamuel.degreePolynomial. The k-linear map D_n:v^n→P_n sends g to H_n(g), with its native degree-n homogeneity witness.

Restrict the existing polynomial component to v^n and bundle its native homogeneity witness. Reuse additivity and scalar linearity of H_n.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-component, DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-degree, mathlib:MvPolynomial.homogeneousSubmodule.

API TauCeti.HilbertSamuel.degreePolynomial_apply (simp): For every g∈v^n, the polynomial underlying D_n(g) is H_n(g).

API TauCeti.HilbertSamuel.degreePolynomial_eq_zero_iff (simp): For g∈v^n, D_n(g)=0 if and only if the underlying series lies in v^(n+1).

API TauCeti.HilbertSamuel.degreePolynomial_ker (characterisation): As k-submodules of v^n, ker(D_n) is the restriction of v·v^n, written v•top on the native ideal-power subtype.

Test DegreeQuotientTests.degree_lift: For every commutative k, finite variable set and p∈P_n, D_n(L_n(p))=p.

Test DegreeQuotientTests.degree_constant: With no variables, degree zero recovers every constant polynomial over any commutative k.

Test DegreeQuotientTests.degree_next: Every element of v^n whose underlying series lies in v^(n+1) has zero degree-n projection.

### Value of the polynomial projection

TauCeti.HilbertSamuel.degreePolynomial_apply. For every g∈v^n, the polynomial underlying D_n(g) is H_n(g).

Evaluate the bundled map.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/ideal-power-polynomial-projection.

### Polynomial inclusion is a section

TauCeti.HilbertSamuel.degreePolynomial_lift. For every p∈P_n, D_n(L_n(p))=p.

Use the existing component identity on an included homogeneous polynomial and subtype extensionality.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/ideal-power-polynomial-projection-value, DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-polynomial-lift-value, DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-retraction.

### Every homogeneous polynomial is represented

TauCeti.HilbertSamuel.degreePolynomial_surjective. D_n is surjective for every n. No field or flatness hypothesis is required.

Choose L_n(p) as the representative and use the section identity.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/ideal-power-projection-section.

### The next ideal power is the kernel

TauCeti.HilbertSamuel.degreePolynomial_eq_zero_iff. For g∈v^n, D_n(g)=0 if and only if the underlying series lies in v^(n+1).

Subtype vanishing is equivalent to underlying polynomial vanishing. Use the polynomial/series vanishing equivalence followed by the existing next-power criterion.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/ideal-power-polynomial-projection-value, DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-vanishing, DeformationAndDerivedPatchingAlgebra:R03.3/degree-component-next-power.

### The actual quotient denominator

TauCeti.HilbertSamuel.degreePolynomial_ker. As k-submodules of v^n, ker(D_n) is the restriction of v·v^n, written v•top on the native ideal-power subtype.

Apply the pointwise kernel criterion. The native subtype-smul membership lemma converts v•top to v·v^n in R; ideal scalar multiplication and the power identity give v^(n+1).

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/ideal-power-polynomial-vanishing, mathlib:Submodule.mem_smul_top_iff, mathlib:Ideal.smul_eq_mul.

### Homogeneous graded pieces

TauCeti.HilbertSamuel.ambientDegreeEquiv. For every n, define the k-linear equivalence (v^n/(v•top))≃P_n, using the native ideal-power subtype and restricting its R-submodule denominator to k. This is the actual degree quotient, not a new definition of the associated graded ring.

Transport the actual denominator to ker(D_n) using equality of submodules. Apply the existing first isomorphism theorem to the proved surjective D_n.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/ideal-power-polynomial-kernel-submodule, DeformationAndDerivedPatchingAlgebra:R03.3/ideal-power-polynomial-surjectivity, mathlib:Submodule.quotEquivOfEq, mathlib:LinearMap.quotKerEquivOfSurjective.

API TauCeti.HilbertSamuel.ambientDegreeEquiv_mk (simp): The ambient equivalence sends the class of g∈v^n to D_n(g).

API TauCeti.HilbertSamuel.ambientDegreeEquiv_symm (simp): The inverse ambient equivalence sends p∈P_n to the actual quotient class of L_n(p).

API TauCeti.HilbertSamuel.degreePolynomial_lift (simp): For every p∈P_n, D_n(L_n(p))=p.

Test DegreeQuotientTests.ambient_roundtrip: For every g∈v^n, the inverse ambient comparison of D_n(g) equals the actual quotient class of g.

Test DegreeQuotientTests.ambient_inverse: For every homogeneous p, applying the ambient equivalence to the quotient class of its native lift returns p.

Test DegreeQuotientTests.ambient_torsion: Over ℤ/4ℤ, the inverse ambient image of 2X in degree one is nonzero, despite the coefficient 2 being nilpotent.

### The ambient comparison on representatives

TauCeti.HilbertSamuel.ambientDegreeEquiv_mk. The ambient equivalence sends the class of g∈v^n to D_n(g).

Use the native representative formulas for quotient transport and the first isomorphism equivalence.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/ambient-degree-quotient-equivalence, mathlib:Submodule.quotEquivOfEq_mk, mathlib:LinearMap.quotKerEquivOfSurjective_apply_mk.

### The inverse ambient comparison

TauCeti.HilbertSamuel.ambientDegreeEquiv_symm. The inverse ambient equivalence sends p∈P_n to the actual quotient class of L_n(p).

Apply injectivity of the forward equivalence and use its representative formula followed by the section identity.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/ambient-degree-quotient-representative, DeformationAndDerivedPatchingAlgebra:R03.3/ideal-power-projection-section.

### Homogeneous equation-jet projection

TauCeti.HilbertSamuel.homogeneousCurveProjection. For every equation f∈R and n, define ψ_f,n:P_n→R/((f)+v^(n+1)) as the composite of L_n with the existing actual curve-degree projection φ_f,n.

Compose the two established k-linear maps. The target is the actual equation-jet quotient; do not replace it by a polynomial presentation.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-projection, DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-polynomial-lift.

API TauCeti.HilbertSamuel.homogeneousCurveProjection_apply (simp): For p∈P_n, ψ_f,n(p) is the actual equation-jet class of the native series inclusion of p.

API TauCeti.HilbertSamuel.curveDegreeProjection_factor (compatibility): For every f,n and g∈v^n, ψ_f,n(D_n(g))=φ_f,n(g).

API TauCeti.HilbertSamuel.homogeneousCurveProjection_range (compatibility): The k-submodule image of ψ_f,n equals the k-submodule image of φ_f,n, inside the same native equation-jet quotient.

API TauCeti.HilbertSamuel.homogeneousCurveProjection_kernel (characterisation): Assume k has no zero divisors, order(f)=d is finite and d≤n. For p∈P_n, ψ_f,n(p)=0 if and only if p=H_d(f)w for a native polynomial w homogeneous of degree n−d.

API TauCeti.HilbertSamuel.homogeneousCurveProjection_below_order (characterisation): If order(f)≥d and n<d, ψ_f,n(p)=0 if and only if p=0, for every p∈P_n. This lower-degree result holds over arbitrary commutative k.

Test DegreeQuotientTests.curve_unit: For the unit equation f=1, every homogeneous polynomial has zero equation-jet image.

Test DegreeQuotientTests.curve_zero: For the zero equation over any commutative coefficient ring, the homogeneous equation-jet map has zero image exactly on the zero polynomial.

Test DegreeQuotientTests.characteristic_two_killed: Over 𝔽₂, the degree-two polynomial X² maps to zero for the repeated equation f=x².

### The equation-jet class of a polynomial

TauCeti.HilbertSamuel.homogeneousCurveProjection_apply. For p∈P_n, ψ_f,n(p) is the actual equation-jet class of the native series inclusion of p.

Evaluate the composite and the existing quotient projection.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-curve-projection, DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-polynomial-lift-value, DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-projection-apply.

### Keeping the leading component preserves the class

TauCeti.HilbertSamuel.curveDegreeProjection_factor. For every f,n and g∈v^n, ψ_f,n(D_n(g))=φ_f,n(g).

The degree-n homogeneous component lies in v^n and is fixed by the same component map. Thus g minus its degree-n component has zero degree-n component and lies in v^(n+1). Its negative gives equality of the two actual quotient classes.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-curve-projection-value, DeformationAndDerivedPatchingAlgebra:R03.3/ideal-power-polynomial-projection-value, DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-series, DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-variable-ideal-membership, DeformationAndDerivedPatchingAlgebra:R03.3/degree-component-next-power, mathlib:MvPowerSeries.isHomogeneous_homogeneousComponent, mathlib:MvPowerSeries.isHomogeneous_iff_eq_homogeneousComponent.

### Equality of the actual degree images

TauCeti.HilbertSamuel.homogeneousCurveProjection_range. The k-submodule image of ψ_f,n equals the k-submodule image of φ_f,n, inside the same native equation-jet quotient.

Every polynomial image is the image of its lift under φ. Every series image is the image of D_n(g) under ψ by the factorization identity.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-curve-projection, DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-polynomial-factorization.

### Principal equation kernel on homogeneous polynomials

TauCeti.HilbertSamuel.homogeneousCurveProjection_kernel. Assume k has no zero divisors, order(f)=d is finite and d≤n. For p∈P_n, ψ_f,n(p)=0 if and only if p=H_d(f)w for a native polynomial w homogeneous of degree n−d.

Apply the existing degreewise polynomial kernel theorem to L_n(p). Its polynomial component is p by the homogeneous-inclusion identity. Retain all order and no-zero-divisors hypotheses.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-curve-projection, DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-polynomial-lift-value, DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-retraction, DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-degree-kernel.

### No relations below the equation order

TauCeti.HilbertSamuel.homogeneousCurveProjection_below_order. If order(f)≥d and n<d, ψ_f,n(p)=0 if and only if p=0, for every p∈P_n. This lower-degree result holds over arbitrary commutative k.

Use the existing strict-below-order polynomial kernel criterion on L_n(p). Identify its polynomial component with p and use subtype extensionality.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-curve-projection, DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-polynomial-lift-value, DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-retraction, DeformationAndDerivedPatchingAlgebra:R03.3/curve-polynomial-degree-below.

### Degreewise tangent-cone comparison

TauCeti.HilbertSamuel.homogeneousCurveQuotientEquiv. For every f,n, define (P_n/ker(ψ_f,n))≃ image(φ_f,n) as a k-linear equivalence. The target is the actual image in the equation-jet quotient, without a domain or finite-equation-order hypothesis.

Use the native first isomorphism theorem for ψ. Transport its image to the actual image of φ by the proved equality, without defining a new target ring.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-curve-projection-image, mathlib:LinearMap.quotKerEquivRange, mathlib:LinearEquiv.ofEq.

API TauCeti.HilbertSamuel.homogeneousCurveQuotientEquiv_mk (simp): After coercion into the actual equation-jet quotient, the quotient-image equivalence sends the class of p to ψ_f,n(p).

API TauCeti.HilbertSamuel.homogeneousCurveProjection_range (compatibility): The k-submodule image of ψ_f,n equals the k-submodule image of φ_f,n, inside the same native equation-jet quotient.

API TauCeti.HilbertSamuel.homogeneousCurveProjection_kernel (characterisation): Assume k has no zero divisors, order(f)=d is finite and d≤n. For p∈P_n, ψ_f,n(p)=0 if and only if p=H_d(f)w for a native polynomial w homogeneous of degree n−d.

Test DegreeQuotientTests.quotient_value: The homogeneous quotient-image equivalence sends each representative to its actual equation-jet class.

Test DegreeQuotientTests.quotient_inverse: The inverse homogeneous quotient-image equivalence returns the same quotient class on each representative image.

Test DegreeQuotientTests.quotient_zero_equation: For f=0, the quotient-image equivalence of the class of p is zero if and only if p=0, over arbitrary commutative coefficients.

### The tangent-cone comparison on representatives

TauCeti.HilbertSamuel.homogeneousCurveQuotientEquiv_mk. After coercion into the actual equation-jet quotient, the quotient-image equivalence sends the class of p to ψ_f,n(p).

Evaluate the native first-isomorphism equivalence and the equal-submodule transport.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-curve-quotient-image-equivalence, mathlib:LinearMap.quotKerEquivRange_apply_mk, mathlib:LinearEquiv.coe_ofEq_apply.

The source is the credited DDPA-JET-HANDOFF §§3–5, refined by the pinned native module interfaces in HS-DEGREE-QUOTIENT-PIN-J6LwjP. This is an authored adapter deduction, not a claim that the source states the arbitrary-coefficient theorem verbatim. Both reserved multiplicity conventions, all routed source obligations, the eight stage statuses, incoming node contracts and supplier requests remain unchanged.

---

# Polynomial representatives of homogeneous series

Let σ be finite, k a commutative ring, R=k[[X_i]] and P=k[X_i]. Write ι:P→R for the native injective polynomial inclusion, v for the algebraically generated variable ideal, HC_n for the native series component and H_n for the polynomial-valued component. All degree indices are natural numbers; order takes values in the extended naturals. The zero series keeps its infinite order.

The coefficient comparison uses the native polynomial and formal-series carriers. It applies to arbitrary commutative coefficients, including zero divisors, to zero polynomials and to the empty variable set. Exact principal-equation kernel factorization additionally assumes no zero divisors and a specified finite equation order. No field, reducedness, irreducibility, characteristic or local-ring instance is hidden in these adapters.

## Construction and exact API

### Polynomial-valued homogeneous component

`TauCeti.HilbertSamuel.homogeneousPolynomial` — For finite σ and a commutative ring k, H_n:R=k[[X_i]]→k[X_i] is the k-linear composite of native total truncation at n+1 with the native polynomial degree-n component. It keeps exactly the coefficients of total degree n.

Compose the two native linear maps. Finite σ ensures that each degree has finitely many monomials. Do not identify this map with total truncation on arbitrary series or equip a fixed component projection with a ring-homomorphism structure.

Inputs: `mathlib:MvPolynomial.homogeneousComponent`, `mathlib:MvPowerSeries.truncTotal`, `mathlib:LinearMap.comp`.

### Coefficients of the polynomial component

`TauCeti.HilbertSamuel.homogeneousPolynomial_coeff` — For every exponent β, coeff_β(H_n(f)) equals coeff_β(f) when totalDegree(β)=n, and zero otherwise.

Apply the polynomial-component and total-truncation coefficient formulas. If degree β=n, the cutoff n+1 retains that coefficient; otherwise the component kills it.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-component`, `mathlib:MvPolynomial.coeff_homogeneousComponent`, `mathlib:MvPowerSeries.coeff_truncTotal_eq_ite`.

### Polynomial inclusion recovers the native series component

`TauCeti.HilbertSamuel.coe_homogeneousPolynomial` — Under the native injective polynomial inclusion ι:k[X_i]→k[[X_i]], ι(H_n(f))=HC_n(f), the existing series-valued homogeneous component.

Compare every coefficient using polynomial inclusion and the two exact degree formulas.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-coeff`, `mathlib:MvPolynomial.coeff_coe`, `mathlib:MvPowerSeries.coeff_homogeneousComponent`.

### Homogeneity of the polynomial component

`TauCeti.HilbertSamuel.homogeneousPolynomial_isHomogeneous` — For every f and n, H_n(f) satisfies native MvPolynomial.IsHomogeneous of degree n, including the zero polynomial.

Use native homogeneity of a polynomial homogeneous component on the truncated polynomial.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-component`, `mathlib:MvPolynomial.homogeneousComponent_isHomogeneous`.

### Compatibility with the native polynomial component

`TauCeti.HilbertSamuel.homogeneousPolynomial_coe` — For every polynomial p, H_n(ι(p)) is exactly its native polynomial homogeneousComponent n p.

Compare coefficients; polynomial inclusion preserves each coefficient.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-coeff`, `mathlib:MvPolynomial.coeff_coe`, `mathlib:MvPolynomial.coeff_homogeneousComponent`.

### Polynomial and series homogeneity agree

`TauCeti.HilbertSamuel.coe_isHomogeneous_iff` — For every polynomial p and n, the included series ι(p) is homogeneous of degree n if and only if p is homogeneous of degree n.

Translate series homogeneity to equality with HC_n, use the component comparison and injectivity of inclusion, and recover polynomial homogeneity. Conversely a homogeneous polynomial is fixed by its native component; include this equality and use the native series characterization.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-series`, `DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-inclusion`, `mathlib:MvPolynomial.coe_injective`, `mathlib:MvPowerSeries.isHomogeneous_iff_eq_homogeneousComponent`, `mathlib:MvPolynomial.homogeneousComponent_eq_self`, `mathlib:MvPolynomial.homogeneousComponent_isHomogeneous`.

### Retraction on homogeneous polynomials

`TauCeti.HilbertSamuel.homogeneousPolynomial_coe_of_homogeneous` — If p is a native homogeneous polynomial of degree n, then H_n(ι(p))=p.

Apply compatibility with the polynomial component and its existing fixed-point theorem.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-inclusion`, `mathlib:MvPolynomial.homogeneousComponent_eq_self`.

### Unique polynomial representative of a homogeneous series

`TauCeti.HilbertSamuel.homogeneous_existsUnique_polynomial` — For every native degree-n homogeneous series f in finitely many variables, there exists a unique polynomial p with native degree-n homogeneity and ι(p)=f. The representative is H_n(f).

Use H_n(f), its homogeneity and the series fixed-point characterization for existence. Injectivity of the native polynomial inclusion proves uniqueness; no new series or polynomial carrier is introduced.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-degree`, `DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-series`, `mathlib:MvPolynomial.coe_injective`, `mathlib:MvPowerSeries.isHomogeneous_iff_eq_homogeneousComponent`.

### Vanishing comparison for homogeneous components

`TauCeti.HilbertSamuel.homogeneousPolynomial_eq_zero_iff` — For every n and f, H_n(f)=0 if and only if HC_n(f)=0.

Include the polynomial and use the native injective inclusion zero criterion.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-series`, `mathlib:MvPolynomial.coe_eq_zero_iff`.

### Initial polynomial as total truncation

`TauCeti.HilbertSamuel.homogeneousPolynomial_eq_truncTotal` — If n≤order(f), with order in extended naturals, then H_n(f)=truncTotal(n+1,f). This assertion retains its order hypothesis and includes f=0.

For degree below n, the native order bound kills the coefficient. At degree n both formulas retain it, and above n both vanish.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-coeff`, `mathlib:MvPowerSeries.coeff_truncTotal_eq_ite`, `mathlib:MvPowerSeries.coeff_of_lt_order`.

### Nonzero initial polynomial at exact finite order

`TauCeti.HilbertSamuel.homogeneousPolynomial_ne_zero_of_order` — If order(f)=n in extended naturals, then H_n(f)≠0. No no-zero-divisors assumption is needed for this single-series statement.

Transfer a hypothetical polynomial vanishing to HC_n and contradict the native exact-order nonvanishing theorem.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-vanishing`, `mathlib:MvPowerSeries.homogeneousComponent_of_order`.

### Multiplication of polynomial initial components

`TauCeti.HilbertSamuel.homogeneousPolynomial_mul_of_le_order` — If m≤order(f) and n≤order(g), then H_(m+n)(fg)=H_m(f)H_n(g). This identity holds over arbitrary commutative coefficients; it does not assert that the product is nonzero.

Include both sides into series, preserve multiplication under inclusion and apply the existing native homogeneous-component product formula with both order bounds. Use injectivity of polynomial inclusion. Distinguish the identity from additive equality of exact orders in the presence of zero divisors.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-series`, `mathlib:MvPolynomial.coe_injective`, `mathlib:MvPolynomial.coe_mul`, `mathlib:MvPowerSeries.homogeneousComponent_mul_of_le_order`.

### Orthogonality and idempotence of polynomial components

`TauCeti.HilbertSamuel.homogeneousPolynomial_component` — For every m,n,f, H_m(ι(H_n(f))) is H_n(f) when m=n, and zero otherwise.

Use polynomial compatibility and the native component formula on the degree-n homogeneous polynomial H_n(f).

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-inclusion`, `DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-degree`, `mathlib:MvPolynomial.homogeneousComponent_of_mem`.

### Polynomial equation-jet kernel above equation order

`TauCeti.HilbertSamuel.curveDegreeProjection_polynomial_kernel` — Let v=(X_i)⊂R, k have no zero divisors, order(f)=d≤n and g∈v^n. Its actual image φ_f,n(g) in R/((f)+v^(n+1)) is zero iff H_n(g)=H_d(f)w for some native homogeneous polynomial w of degree n−d.

Invoke the existing actual series-valued kernel equivalence. Replace its homogeneous series witness by the unique polynomial representative and reflect the product equality through native polynomial inclusion. Conversely include a polynomial witness, use the homogeneity equivalence and product compatibility, then apply the old kernel theorem. Both directions retain d≤n and exact order.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-projection-kernel`, `DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-series-unique-polynomial`, `DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-series-homogeneity`, `DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-series`, `mathlib:MvPolynomial.coe_injective`, `mathlib:MvPolynomial.coe_mul`.

### Polynomial equation-jet kernel below equation order

`TauCeti.HilbertSamuel.curveDegreeProjection_polynomial_below_order` — For arbitrary commutative k, n<d≤order(f) and g∈v^n, the actual image φ_f,n(g) vanishes if and only if H_n(g)=0. No finite exact order or no-zero-divisors assumption is required.

Use the existing lower-degree kernel theorem and transfer homogeneous-component vanishing through the native polynomial inclusion.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-projection-below-order`, `DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-vanishing`.

### Polynomial kernel for the zero equation

`TauCeti.HilbertSamuel.curveDegreeProjection_polynomial_zero_equation` — For f=0 and every n and g∈v^n, the actual image φ_0,n(g) vanishes if and only if H_n(g)=0. The zero equation retains its infinite order.

Use the existing zero-equation kernel theorem and the polynomial/series vanishing equivalence, without converting infinite order to a natural number.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-projection-zero-equation`, `DeformationAndDerivedPatchingAlgebra:R03.3/polynomial-homogeneous-vanishing`.

## Distinguishing tests

- `HomogeneousPolynomialTests.zero_input` (degenerate): For every finite variable type, commutative coefficient ring and n, H_n(0)=0.
- `HomogeneousPolynomialTests.native_polynomial` (compatibility): For every native degree-n homogeneous polynomial p, H_n(ι(p))=p.
- `HomogeneousPolynomialTests.no_variables` (degenerate): With no variables and coefficient a∈ℚ, H_0(C(a))=C(a) and H_1(C(a))=0.
- `HomogeneousPolynomialTests.exact_degree_not_truncation` (computation): In two variables over F₂, H_1(1+X₀+X₀²)=X₀; the constant term must be discarded as well as the square.
- `HomogeneousPolynomialTests.not_multiplicative_in_fixed_degree` (non-example): In two variables over ℚ, H_1(X₀X₀)=0 differs from H_1(X₀)H_1(X₀)=X₀². A fixed-degree component is not a ring map.
- `HomogeneousPolynomialTests.nilpotent_coefficients` (non-example): In two variables over ℤ/4ℤ, for p=2X₀, H_1(ι(p))≠0 but H_2(ι(p)²)=0. The product identity must not be strengthened to nonzero products for all coefficient rings.

The linear map already carries additivity and scalar compatibility through native composition. Its polynomial inclusion, retraction, unique-representative and orthogonal-component formulas allow consumers to work without unfolding it. The product formula uses degree m+n and both order bounds; it neither makes H_n a ring map nor asserts nonvanishing over zero-divisor coefficients.

## Consumers and remaining mathematical work

The actual degree projection is the previously defined map from v^n to R/((f)+v^(n+1)). Its polynomial kernel assertion is an equality of actual representatives, not a prescribed Hilbert function. The arbitrary series witness in its existing kernel proof becomes a unique homogeneous polynomial through ι; the converse includes this polynomial witness and returns to the same native quotient. The strict-below-order and zero-equation branches preserve their weaker assumptions.

The polynomial/series homogeneous comparison and actual polynomial equation-jet kernel now have checked native prototypes. Construct the actual image identification with q^n/q^(n+1), then assemble the generator-compatible and multiplicative full graded tangent-cone isomorphism. Curve/support dimension and comparison with the general cumulative polynomial and intrinsic/ambient multiplicity remain required. General Hilbert–Serre, Artin–Rees, completion, localization, associativity, all eight stage targets and every routed-paper obligation remain open; canonical bodies and implementation statuses remain admitted/unchecked.

The reserved intrinsic Hilbert–Samuel construction retains arbitrary Noetherian local rings, primary ideals and finite modules. Its intrinsic support-dimension normalization and the separate ambient-dimension normalization remain distinct. This finite-variable comparison supplies a source-proof input to that general theory and does not define a second multiplicity. The existing thirteen planets and all other stage/owner boundaries remain as specified below.

Sources: the credited [plane-curve jet source-proof checkpoint, §§2–5](https://github.com/CBirkbeck/tauceti-explorer/blob/eb645dc85df65608c56fafc4d9ed0e71ab0ca3ce/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md), especially equation (9); native pinned polynomial homogeneous components and series truncation/inclusion; [Stacks 00K4](https://stacks.math.columbia.edu/tag/00K4) for the distinction between graded and cumulative lengths. The finite-variable, commutative-coefficient comparisons above are authored deductions from those native formulas and the credited proof, not newly quoted whole-paper theorems.

---

# Finite equation jets and cumulative curve lengths

Continuation of the partial R03.3 blueprint, 3 October 2026. All eight stages
remain partial and every implementation status remains unchecked. This section
records the current finite-jet proof boundary; the preceding complete reader
follows unchanged.

Let σ be finite, k a commutative ring, R = MvPowerSeries σ k and
v = (X_i : i ∈ σ), the algebraically generated ideal of native variables.
For f ∈ R and N ∈ ℕ the existing quotient projection is

    R/v^(N+1) → R/((f)+v^(N+1)).

The new lemma `TauCeti.HilbertSamuel.equationJet_finite` proves that its
target is a finite k-module. The source has the existing total-jet monomial
basis, indexed by exponents of total degree less than N+1. Restrict the
actual R-linear quotient projection to k and apply the pinned finite-image
theorem. This includes empty variables, zero coefficients, nilpotent
coefficients, and arbitrary equations. Exact finite order is unnecessary.
This declaration belongs to R03.3/equation-jet-finite and consumes the
existing total-jet-finite and shifted-jet-map nodes, together with
`Submodule.factor_surjective` and `Module.Finite.of_surjective`.

If k is a field, the new lemma
`TauCeti.HilbertSamuel.equationJet_length_eq_finrank` identifies the actual
R-module length of that target with its finite k-dimension, cast to extended
naturals. It uses the preceding finiteness instance and the existing
series-module-finite-length adapter. That adapter proves the residue degree
is one before restricting scalars. This is
R03.3/equation-jet-length-finrank. No arbitrary scalar change is silently
identified with preservation of length.

For σ = Fin 2 and any field k, the existing declarations now have a combined
checked native proof route:

- `totalJet_length_eq_finrank` and `planeTotalJet_length` give
  length_R(R/v^r) = binom(r+1,2), including r=0.
- `planeEquationJet_length_balance` uses the actual shifted multiplication
  map and projection when d≤N and order(f)=d. Its equality is first the sum
  of extended-natural lengths; exactness is the equality of the projection
  kernel with the multiplication range.
- `planeEquationJet_length` substitutes the three finite natural dimensions
  in that equality, then cancels in ℕ. For N<d it instead uses the proved
  equality (f)+v^(N+1)=v^(N+1); the second binomial vanishes.
- `planeCurve_function` combines this calculation with the existing native
  quotient-ring/scalar comparison. With A=R/(f) and q the image of v,

      H_q,A(N) = binom(N+2,2) − binom(N+2−d,2).

  Both subtractions in this display are natural subtraction. The difference
  is cast to extended naturals only after it is formed. The equation may be
  nonreduced and k may have positive characteristic. At d=0 a unit equation
  gives the zero quotient and every function value is zero.
- `planeZeroEquation_function` treats f=0 separately and gives
  H_q,A(N)=binom(N+2,2). Its order is infinite, so this is not a d=0 case.

The finite-dimensional quotient proof makes finiteness explicit before the
sum is converted to naturals. It does not infer the missing curve dimension
or identify equation order with the general multiplicity definition.

The two new lemma nodes add these discriminating tests:

| Test | Actual object and result |
| --- | --- |
| `HilbertSamuelEquationJetTest.nonreduced_rank` | Over F₂, the k-dimension of R/((X₀⁴)+v⁵) is 14, agreeing with its R-length. |
| `HilbertSamuelEquationJetTest.nilpotent_coefficients_finite` | For three variables over Z/4 and f=2, R/((2)+v³) is a finite Z/4-module. |
| `HilbertSamuelEquationJetTest.zero_coefficients_finite` | With no variables over Z/1, the actual quotient by (0)+v is finite over the zero ring. |

The combined proof also checks the existing actual-curve tests: a unit at
all N; the zero equation at N=2 with value 6; X₀ at every N with value N+1;
X₀⁴ over F₂ at N=0,1,2,4 with values 1,3,6,14; and X₀¹⁰⁰ at N=2 with
value 6. These evaluate native quotient lengths, rather than substituting
numbers into a proposed function.

Sources are the credited immutable DDPA-JET-HANDOFF §§3–4 and
DDPA-CURVE-POSTULATION §§1–3, combined with the exact pinned native
statements listed in HS-EQUATION-LENGTH-PIN. The coefficient finiteness
argument above extends the source's field argument to commutative rings.
All earlier proof bodies retain their authorship. Mathlib PR #9819 remains
an open prior-art lead for the general graded Hilbert–Serre induction;
this continuation imports no unmerged theorem from it.

The reserved general Hilbert–Samuel multiplicity node and its intrinsic and
ambient normalizations remain unchanged. The cumulative formula does not
close the general existence or degree/dimension theorem. The graded-function
proof, rational postulation defect, sharp agreement threshold, tangent-cone
kernel, curve dimension, intrinsic/ambient multiplicity comparison,
Artin–Rees, associativity, completion and all routed-paper obligations remain
open. The two supplier requests, fifteen gaps and historical remaining lists
are preserved. The inherited LocalFieldsRamification layer-0 → R03.4 stage
path still needs owner reconciliation.

Validation: the combined native file has 64 examples and 65 named axiom
audits, with no errors, warnings or admissions. The complete suggested file
has 180 examples and elaborates with 352 admitted-proof warnings only at the
existing exact Mathlib pin. The handoff gives the immutable archive, source
hashes and reproducible checks. This validates the prototype boundary, while
the canonical suggested bodies remain admitted as required by the protocol.

# Exact-order shifted jet multiplication — R03.3 continuation

For finite σ, commutative k and R=k[[σ]], retain the algebraic variable ideal v.
If k has no zero divisors and f has exact native finite order d, then
fg belongs to v^(d+r) exactly when g belongs to v^r, including g=0 and r=0.
This cancels the finite addend d in ℕ∞. Native order multiplicativity is already
in Mathlib; the new declaration only compares its inequalities with algebraic ideals.

For d≤N the actual source is R/v^(N+1−d), and multiplication sends [g] to [fg]
in R/v^(N+1). It agrees with the existing principal quotient multiplication.
The projection to R/((f)+v^(N+1)) agrees with the existing principal projection.
Their range–kernel equality and projection surjectivity require only the lower
order bound over arbitrary commutative k. Left injectivity additionally requires
exact finite order and no-zero-divisors coefficients. For N<d the projection
is bijective instead; no shifted injection is asserted in that range.

The F₂ equation X_0⁴ at N=d=4 has a nonzero image of [1] and an injective map.
A loose d=1 bound for X_0² at N=1 fails injectivity even over ℚ. The ℤ/4
multiplier 2X_0 kills the nonzero class of 2. Unshifted multiplication by X_0
on R/v² also fails injectivity. These tests use actual native quotient classes.

Dependencies are the retained variable-ideal-power/order equivalence and
principal-quotient denominator, exactness, injectivity and projection proofs.
All are R03.3 declarations or exact pinned baseline imports; no new stage supplier
is introduced. The existing general multiplicity object, both normalization
conventions and every source-route obligation remain unchanged. All eight
stages remain open. The next proof is the length balance using these maps,
the checked total-jet count and the actual quotient/scalar comparison.

The source is the credited [DDPA-JET-HANDOFF §4](https://github.com/CBirkbeck/tauceti-explorer/blob/eb645dc85df65608c56fafc4d9ed0e71ab0ca3ce/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md),
with the generalization explicitly proved from [pinned native order multiplication](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/MvPowerSeries/NoZeroDivisors.lean)
and [finite ENat cancellation](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/ENat/Basic.lean).
Canonical signatures remain admitted; no implementation status is promoted.

## Exact-order preimage of a variable-ideal power

`DeformationAndDerivedPatchingAlgebra:R03.3/exact-order-mul-ideal-preimage` — `TauCeti.HilbertSamuel.mul_mem_variableIdeal_pow_iff`.

For finite σ, a commutative coefficient ring k with no zero divisors, R=MvPowerSeries σ k and v=span{X_i}, if native order(f)=(d:ℕ∞), then fg∈v^(d+r) if and only if g∈v^r, for every g∈R and d,r∈ℕ. The zero argument and r=0 are included.

- σ is finite; k is a commutative ring with NoZeroDivisors. All ideals and series are the native library objects.
- The multiplier has exact finite native order d. No field, nontriviality, completeness, local-ring, irreducibility or reducedness hypothesis is added.

Proof: Use variable-ideal-power-order to convert both memberships to inequalities in ℕ∞. Rewrite native order_mul and the exact order of f. Natural addition casts to extended-natural addition. Cancel only the finite left addend d using ENat.add_le_add_iff_left. The other addend order(g) may be infinite; no order.toNat or unjustified truncated subtraction is used. This supplies the reverse-membership condition of principal-quotient-injectivity with r=N+1−d and d≤N. Right exactness uses the weaker lower-order bound separately.

- `HilbertSamuelShiftedOrderTest.zero_multiplier` (non-example): For arbitrary finite σ and commutative k, the zero series times 1 belongs to every v^(1+r), but its order is not the finite value 1; it cannot satisfy the exact-order premise.
- `HilbertSamuelShiftedOrderTest.membership_zero_argument` (degenerate): With no-zero-divisors coefficients and exact order(f)=d, f·0∈v^(d+r) iff 0∈v^r, including the infinite order of the zero argument.
- `HilbertSamuelShiftedOrderTest.membership_zero_cutoff` (degenerate): For exact order(f)=d and every g, f·g∈v^d; the cancellation statement includes r=0.

## Shifted multiplication on finite jets

`DeformationAndDerivedPatchingAlgebra:R03.3/shifted-jet-map` — `TauCeti.HilbertSamuel.shiftedJetMap`.

Under d≤N and (d:ℕ∞)≤order(f), construct the actual R-linear map μ_f:R/v^(N+1−d)→R/v^(N+1), [g]↦[fg], by native Submodule.mapQ of LinearMap.mulLeft R f and shifted-jet-denominator. Its projection API is the native factor π_f:R/v^(N+1)→R/((f)+v^(N+1)), [g]↦[g]. No jet carrier, dimension datum, or algebra-homomorphism multiplication stand-in is introduced.

- `TauCeti.HilbertSamuel.shiftedJetMap_eq_quotientMulMap`: For d≤N and d≤order(f), shiftedJetMap is exactly quotientMulMap with J=v^(N+1−d), K=v^(N+1), multiplier f and the actual shifted denominator proof.
- `TauCeti.HilbertSamuel.jetProjection_eq_principalQuotientProjection`: For every f and N, jetProjection is exactly principalQuotientProjection for K=v^(N+1); this equality does not require a finite variable set.

- `HilbertSamuelShiftedOrderTest.loose_order_bound` (non-example): Over ℚ in two variables, f=X_0² satisfies the lower bound d=1 at N=1, but shiftedJetMap is not injective: the nonzero class of 1 modulo v maps to zero modulo v².
- `HilbertSamuelShiftedOrderTest.exactness_zero_divisors` (compatibility): Over ℤ/4 in two variables, every admissible lower-order-bound shifted multiplication still has range equal to the projection kernel and a surjective projection.
- `HilbertSamuelShiftedOrderTest.wrong_source_field` (non-example): Over ℚ in two variables, unshifted multiplication by X_0 on R/v² is well-defined but not injective: it kills the nonzero class of X_0. Ambient domain cancellation cannot replace the shifted denominator.

The complete preceding reader follows with all inherited definitions, API, tests, source inventories and remaining contracts retained.

# Commutative algebra for deformation theory and patching — part P7

Current continuation by Codex — `codex-5ebb6f`, 2 October 2026: 96 nodes (53 lemmas, sixteen theorems, eight definitions and nineteen constructions), 111 API items, 92 definition/construction tests plus eleven lemma tests, 126 native examples, thirteen planets, 217 baseline references, fifteen gaps and two unchanged requests. P7, R03.3 and R03.4 remain partial; five other stages retain not_read status. All implementations remain unchecked. The residue/length appendix records seven new nodes, including promotion of the existing total-jet finiteness API.

Historical module continuation by Codex — `codex-5ebb6f`, 2 October 2026 (Section 12): 72 nodes (37 lemmas, sixteen theorems, eight definitions and eleven constructions), 83 API entries, 67 definition/construction tests plus four inherited lemma tests, 92 native examples, thirteen planets, 157 baseline references, fourteen gaps and two unchanged requests. Every stage remains open. The full Mathlib-only suggested file compiled with zero errors, 203 admitted-proof warnings and no other warnings.

Historical ring continuation by Codex — `codex-J6LwjP`, 2 October 2026 (Section 11): 61 nodes (32 lemmas, fourteen theorems, eight definitions and seven constructions), 69 API entries, 55 definition/construction tests plus four inherited lemma tests, thirteen planets, 140 baseline references, fourteen gaps and two requests. All stages remain open. The current full suggested file compiled with zero errors and only admitted-proof warnings; earlier no-compilation statements below are dated history.

## Scope of this checkpoint

The part comprises P7–P9 and R03.1–R03.5. This partial blueprint retains the existing finite-prime-filtration input of R03.3, adds a five-node refinement of the R03.4 characteristic-zero-point argument, and adds four R03.3 nodes on catenarity and on freeness over a regular local base (Section 5a). Before the continuation in Section 5b, the packet had 46 baseline references and one object definition, the catenary predicate. Section 5b preserves those nine nodes and adds fourteen Hilbert–Samuel nodes; the combined packet has 62 baseline references. The field, quotient, integral-closure and local-field constructions are reused from their existing owners. The stage coverage records retain the remaining work explicitly.

The codex-rtOQ9t continuation in Section 9 adds four R03.3 positivity lemmas to the forty-node checkpoint. At that checkpoint the packet had 44 nodes (24 lemmas, 11 theorems, 7 definitions and 2 constructions), 44 API items, 35 definition/construction unit tests, 11 planets, 99 pinned baseline references, 14 gap groups and 2 supplier requests. Four further typed acceptance examples distinguish the polynomial-sign hypotheses. All eight scoped stages remain partial. The positivity deduction is written conditional on the existing eventual-polynomial construction, whose proof obligations remain open.

Source inspections and compilation reports in Sections 1–8 are inherited receipts from the named earlier workers. Section 9 records the positivity continuation's fresh reads and checks; Section 10 records the cumulative continuation. Those are historical elaboration receipts. Section 11 records the current full-file compilation.

The earlier cumulative continuation in Section 10 adds eight R03.3 nodes and narrows the cumulative-identity and rational-antidifference obligations. The packet has 52 nodes (28 lemmas, 13 theorems, 8 definitions and 3 constructions), 57 API items, 43 definition/construction unit tests plus 4 inherited lemma acceptance tests, 12 planets, 119 baseline references, 14 gap groups and 2 supplier requests. The cumulative polynomial is constructed only conditional on a supplied graded polynomial tail; the associated-graded ring/module structure and graded polynomiality remain gaps. All eight stages remain open: P7, R03.3 and R03.4 are partial; P8, P9, R03.1, R03.2 and R03.5 retain not_read status. All implementations are unchecked.

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The five prime-filtration declarations in Sections 1–4 are in the same Mathlib module, `Mathlib/RingTheory/Ideal/AssociatedPrime/Finiteness.lean`; its inspected Git blob is `8981a4233c39016cfd51e882d7da6d90c368dec9`.

## 1. Generality and conventions

Let R be a **commutative Noetherian ring** and M a finitely generated R-module. Finite means Mathlib's `Module.Finite`, not finiteness of the underlying set. No completeness, localness, DVR, Dedekind, field or freeness hypothesis is imposed. In particular this interface applies over the arithmetic coefficient rings in expansion principles, not just the complete-local coefficient category used for deformation functors.

A finite prime filtration is a chain of actual submodules

    0 = N0 <= N1 <= ... <= Nn = M

whose successive subquotients are R-linearly equivalent to R/p for prime ideals p. The prime can vary with the step and can occur repeatedly. The filtration need not split. Its factors need not be simple: a prime ideal need not be maximal. Consequently the theorem does not imply finite length.

When N1 is contained in N2, the quotient is formed inside N2. In Mathlib that uses the submodule `N1.submoduleOf N2`, with underlying module N2. It is not a quotient of the type N2 by a submodule whose ambient type is still M. The construction retains the inclusion and the actual linear equivalence of this subquotient with R/p.

The ring may be trivial. There are then no prime ideals, every module is zero, and the filtration has no proper steps. The general theorem remains applicable; a claimed first nonzero factor would not.

## 2. The exact baseline contract

### A prime cyclic step

`Submodule.IsQuotientEquivQuotientPrime` already records two things: containment of the lower submodule in the upper, and a point of `PrimeSpectrum R` together with nonempty linear-equivalence data for the subquotient and R/p. Use this relation rather than introducing a parallel predicate.

`Submodule.isQuotientEquivQuotientPrime_iff` characterizes a step by a vector x: the larger submodule is the sum of the smaller submodule and the span of x, and the image of x in the quotient by the smaller submodule has prime annihilator. This is an explicit cyclic description, not merely a support statement.

The proof inspected in the library constructs the comparison maps. In the forward direction, it lifts the class corresponding to 1 modulo p. The natural map from the successive quotient into M/N1 is injective, so the annihilator computation transports through it. Surjectivity of the chosen cyclic generator gives the sum-with-span description. In the reverse direction, scalar multiplication by x descends through the annihilator quotient and the first isomorphism theorem identifies its range with the successive subquotient.

These details explain what is available to a consumer requiring an actual quotient map. The submodule inclusion and quotient projection are not extra future constructions; only their particular geometric application needs to be written.

### Existence of the whole filtration

`IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime` provides a `RelSeries` of these submodules with head bottom and last top. Its ambient parameters are precisely the commutative ring, Noetherianity and finite-module hypotheses above. The source's Stacks annotation is tag 00L0.

The pinned proof proceeds by the ascending-chain condition on submodules. Starting at zero, take a proper submodule N. The quotient M/N is nonzero and has an associated prime. Choose a vector with that prime annihilator and lift it to M. Adjoining its span strictly enlarges N and supplies the next prime cyclic step through the preceding characterization. Ascending-chain induction reaches the top. There is no uniform bound on the number of steps claimed by this argument.

A `RelSeries` of length n has n steps and n+1 vertices. Extracting the data of a step yields a containment, a prime and a nonempty linear equivalence. Choosing an equivalence when needed is harmless; no canonical filtration, canonical prime ordering or functorial choice of filtration is asserted.

### The ready-made induction principle

`IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime` is the preferred consumer interface. It proves a property of every finite R-module from three hypotheses:

1. The property holds for every subsingleton module.
2. It holds for every finite module N equipped with an R-linear equivalence to R/p for a prime p.
3. In a short exact sequence of finite modules, it holds for the middle module whenever it holds for both outer modules.

The exact-sequence input is concrete: linear maps f and g, injectivity of f, surjectivity of g and `Function.Exact f g`. In particular, the hypothesis is not merely a zero composite. Surjectivity concerns the original coefficient quotient map, not any map obtained by taking global sections.

The motive is a dependent property of modules in a fixed universe, with their additive, module and finite-module instances. The prime-quotient case is formulated using a linear equivalence from N to R/p, rather than demanding that R/p itself belong to that fixed universe. Preserve this feature when applying the theorem to geometric functors.

The proof also supplies transport under arbitrary linear equivalences: use the exact sequence consisting of an equivalence followed by the zero map to a zero module. It then inducts on the supplied submodule series, transporting the lower module to its image in the next submodule and using the canonical subtype/quotient exact sequence. No separate finite-filtration induction library is required.

### An existing application

`associatedPrimes.finite` uses this exact induction. The zero case has empty associated-prime set; the prime-quotient case uses the corresponding singleton calculation and transport through a linear equivalence; the extension case uses containment in the union of the two outer associated-prime sets. This confirms that the induction is already an operational library interface, not an unimplemented declaration inferred from its name.

## 3. Contract for Fourier–Jacobi injectivity

The consumer is `AutomorphicBundles:B5/fj-injectivity-finite`. Write F(M) for its actual automorphic section module, G(M) for its actual coefficient-family module and eta_M for the constructed expansion map. This is notation for the geometric objects already owned by B5 and its suppliers, not new algebraic stand-ins.

Apply the existing induction to the property **eta_M is injective**.

**Zero case.** Tensoring the fixed coefficient sheaf with a zero module gives a zero sheaf, hence a zero section module. The expansion map with that source is injective. For a subsingleton carrier the same statement follows through its unique zero-module identification.

**Prime-quotient case.** B5's cyclic-coefficient theorem supplies injectivity for R/p only after its geometric hypotheses have been proved: component detection and the formal-chart comparison with residue coefficients. For a module N linearly equivalent to R/p, functoriality sends the equivalence and its inverse to inverse maps on F and G. Naturality of eta then transports injectivity. This does not assert that forming global sections commutes with an arbitrary tensor product or quotient.

**Extension case.** Start with an actual short exact coefficient sequence N1 -> N2 -> N3. B5 must construct the two naturality squares and establish the left-exact section row and injectivity of the first coefficient-family map. A section in F(N2) with zero expansion has zero image in F(N3), by injectivity at N3. Exactness of the F row lifts it to F(N1). Naturality and injectivity of G(N1) -> G(N2) make the lift's expansion zero; injectivity at N1 kills the lift. This is precisely the nonsplit extension step already separated in the B5 packet.

The induction concludes finite-coefficient injectivity. It contributes no geometric component theorem, formal-function theorem, invariant-exactness theorem or commutation of products with filtered colimits. Those obligations remain in B5. The further passage to arbitrary coefficients still needs the section-colimit comparison and injectivity of coefficient-family inclusions, not a colimit/product interchange.

**Dependency correction.** This argument needs the pinned Mathlib induction theorem directly. It does not wait for all of R03.3, for Schlessinger's criterion or for the complete-local coefficient category. The obsolete generic request has been removed from B5 in merged PR #3093, with its direct baseline citations and proof steps updated. Genuine unrelated uses of R03.3 are unaffected.

## 4. Regression and non-example requirements

The suggested file imports the existing module and gives direct reuse examples. It introduces no new prime-filtration definition.

**The zero module.** Over Z, the module of functions from an empty finite type has bottom equal to top. The existential filtration theorem applies and its induction starts in the subsingleton case.

**Repeated factors and a nonsplit extension.** For M = Z/4 as a Z-module, the submodule generated by 2 lies strictly between zero and M. Both successive quotients are Z/2. The projection Z/4 -> Z/2 has no additive section: the image of 1 under a map from Z/2 must be annihilated by 2, so is 0 or 2, both reducing to zero. Thus an implementation replacing the extension case by a direct-sum case would fail.

**Several primes.** For Z/12 use the chain of subgroups generated successively by 0, 6, 3 and 1. The quotient orders are 2, 2 and 3. Prime occurrence is not restricted to a set of distinct primes or to a single residue characteristic.

**Finite generation is not finite length.** Z as a module over itself has the one-step prime filtration with p = 0. It is not a finite set and not a finite-length Z-module. Do not require maximal ideals in place of primes. The direct invocation of the existing theorem on Z is a regression against those extra hypotheses.

**The trivial ring.** For R = Z/1 and a finite free R-module, the theorem reduces to the zero-module case. This checks that neither a nonzero ring nor an arbitrary prime choice is silently assumed before the zero case.

The finite abelian-group checks are elementary regressions, not a proof of the general theorem or a replacement for Lean elaboration. The general result is reused from the inspected pinned library.

## 5. Characteristic-zero points of finite local algebras

This section refines the integrated node
`R03.4/characteristic-zero-points-from-finiteness-and-dimension` without replacing its identifier. The four intermediate nodes make its algebraic proof explicit. Its arithmetic dimension input, local-field interpretation and framed-lifting extension are distinguished rather than hidden in one assertion.

### Conventions and the exact target

Let O be a discrete valuation ring, pi a uniformizer, and K its fraction field. For the characteristic-zero conclusion assume that K has characteristic zero. Fix an algebraically closed extension Omega/K, with the compatible O action. Let A be a commutative local O-algebra which is **finite as an O-module**, with Krull dimension at least one.

The algebraic target is a finite intermediate field E of Omega/K and an O-algebra map

    A -> integralClosure(O,E)

which reflects units, in the sense of Mathlib's `IsLocalHom`. The target is the existing integral-closure subalgebra, not an opaque ring postulated to have the properties the proof needs. Over an arbitrary, possibly incomplete DVR, that integral closure need not be local. For the source setting, where O is the complete ring of integers of a characteristic-zero nonarchimedean local field, the **Local fields and ramification, Layer 0** supplier identifies this closure with the complete DVR of integers in E. Only with that identification do we export the local integral point in the source's topological setting.

Neither flatness nor reducedness of A is assumed. The resulting map can have a kernel, the point need not be unique, and the target residue field is allowed to extend the residue field of A. No canonical choice of a prime or of an embedding into Omega is asserted.

### R03.4/nilpotent-uniformizer-artinian

**Statement.** For any finite commutative O-algebra A, nilpotence of pi_A implies that A is Artinian. Localness of A and finiteness of the residue field of O are not required.

Choose n such that pi_A^n=0. The coefficient map factors through O/(pi^n), with the quotient action on A defined by this factorization. An O-generating family for A also generates it over the quotient: every scalar in the expression maps to its quotient class. The proof requires no lift of a generator or a splitting of a module extension.

The uniformizer criterion `IsDiscreteValuationRing.irreducible_iff_uniformizer` identifies the ideal (pi^n) with the nth power of the maximal ideal. The pinned result `IsDiscreteValuationRing.length_quotient_pow_maximalIdeal` computes the O-module length of that quotient as n. Apply `Module.length_ne_top_iff` and `isFiniteLength_iff_isNoetherian_isArtinian`. Apply the existing `isArtinian_of_tower` to the quotient scalar tower: its ideals are O-submodules, so it is Artinian as a ring as well. Finally `IsArtinianRing.of_finite` applies to A over this quotient. If n=0, the factor ring and A are zero, so the conclusion still holds.

This proof uses finite **length**, not finite cardinality. In particular it works over an infinite residue field. It does not confuse having some pi-torsion with the much stronger assertion that a power of pi annihilates 1.

**Tests.** The algebra O/(pi^n)[t]/(t^2) is a positive test with nonzero nilpotents. The zero algebra tests exponent zero. The algebra O[t]/(pi*t,t^2) rejects the incorrect replacement of nilpotence of pi by the existence of a pi-torsion element: t is torsion, but the image of O survives.

### R03.4/generic-prime-coefficient-injection

**Statement.** If q is a prime ideal of a commutative O-algebra A and pi_A does not lie in q, then O -> A/q is injective. This step does not require A to be finite or local.

The kernel is the contraction of q to O, hence is prime. By `IsDiscreteValuationRing.iff_pid_with_one_nonzero_prime`, a nonzero prime of O is its unique maximal ideal. That ideal is (pi), and so cannot be the contraction under the avoidance hypothesis. The contraction is therefore zero. This proves injectivity and fixes the actual quotient coefficient map for the scalar towers used next.

**Tests.** For A=O and q=0, the statement recovers the original coefficient injection. For A=O/(pi), its zero prime contains pi_A=0, so it cannot be selected as a generic prime. The two branches of O[t]/(t^2-pi*t) yield distinct generic quotient maps; the construction must not identify them merely because their reductions meet.

### R03.4/algebraic-point-of-generic-prime

**Statement.** Let O be a commutative domain and A a finite commutative O-algebra. Let Omega be an algebraically closed field over O with injective coefficient map. For a prime q of A with O -> A/q injective, construct an O-algebra map f:A -> Omega whose kernel is exactly q.

Set B=A/q. The image of a finite O-generating family for A generates B, so B is integral, and hence algebraic, over O. The domains B and Omega have torsion-free O actions because their coefficient maps are injective. These are exactly the hypotheses needed for the pinned `IsAlgClosed.lift` on B.

The particular lift supplied by that definition is injective. This is not an inference that an arbitrary map from a domain is injective. The inspected definition extends the coefficient embedding through the fraction fields, uses a field embedding of Frac(B), and composes it with B -> Frac(B). Both component maps are injective. Composing this lift with A -> B gives f, and its kernel is q.

This applies the existing algebraic-closure and fraction-field constructions; none is defined again. The coefficient identities are those of the actual composed algebra homomorphisms.

**Tests.** For A=O[t]/(t^2), the generic prime (t) yields t->0, so the map on A itself is not injective. A product algebra can supply different generic kernels; it cannot generally be embedded as a ring into a field. A characteristic-p quotient is rejected by the coefficient-injection hypothesis when Omega has characteristic zero.

### R03.4/finite-field-of-point-values

**Statement.** For a compatible O -> K -> Omega tower with K and Omega fields, a module-finite commutative O-algebra A and an O-algebra map f:A -> Omega, the existing intermediate field

    E = IntermediateField.adjoin K (range f)

is finite-dimensional over K. A need not be reduced and f need not be injective.

Here is an explicit spanning argument. Choose O-generators a_1,...,a_r via `Module.Finite.exists_fin'`, and let W be the K-span of f(a_1),...,f(a_r) in Omega. Every f(a) lies in W by the expression of a in those O-generators and the compatibility of the coefficient maps. In particular 1 belongs to W.

For each i,j, express a_i*a_j in the same generating family over O. Applying f shows that f(a_i)*f(a_j) belongs to W. K-bilinearity then makes W closed under multiplication. Thus W, with the inherited operations, is a finite-dimensional K-subalgebra C of Omega.

The finite/integral comparison makes C integral over K. The pinned `Algebra.IsIntegral.inv_mem` makes this subalgebra closed under inverses in Omega. Its underlying subset therefore gives an intermediate field. It contains f(A), while every intermediate field containing f(A) contains W. Consequently its underlying subset is exactly E, and the finite spanning family proves the result.

There is no exchange of a fraction field with an inverse limit and no choice of denominators depending on an infinite family. This is ordinary finite-dimensional algebra.

**Tests.** A=O gives E=K. The nilpotent quotient O[t]/(t^2) under t->0 also gives E=K. Module-finiteness cannot be weakened to finite type: evaluation of O[t] at a transcendental element generates an infinite-dimensional field over K.

### Assembly of the characteristic-zero integral point

Choose a uniformizer pi. Suppose pi_A were nilpotent. The first node would make A Artinian; `IsArtinianRing.isMaximal_of_isPrime` and `Ring.krullDimLE_zero_iff` would imply dim(A)<=0, contrary to the dimension premise. Thus pi_A is not nilpotent.

The **existing** `nilpotent_iff_mem_prime`, negated, gives a prime q avoiding pi_A. The second and third nodes produce f:A -> Omega with kernel q and injective O -> A/q. The fourth node produces the finite field E=K(f(A)).

Corestrict f first to E. The O action on E is the composite O -> K -> E, and its inclusion in Omega respects that action. Because A is finite over O, each f(a) is integral over O; transport its monic relation to E through the injective inclusion E -> Omega. Hence f corestricts again to integralClosure(O,E). This is a constructed map into the existing subtype, not an existential ring chosen to force the result.

A DVR is Noetherian and integrally closed. In characteristic zero the finite extension E/K is separable. Thus `IsIntegralClosure.finite` shows that this integral closure is finite over O. The finiteness result itself is already in Mathlib and is not a new node.

The local-map step needs care. Factor the map through B=A/q. Its map into the integral closure is injective. The closure is integral over O, hence integral over B by `Algebra.IsIntegral.tower_top`. The injective integral map therefore reflects units by `RingHom.IsIntegral.isLocalHom`. Since A is local and B is a nonzero quotient, A -> B is local by `IsLocalHom.of_surjective`. The composite is local by `RingHom.isLocalHom_comp`. Applying the integral-injective theorem directly to the original map from A would be invalid: that map usually has the nonzero kernel q.

For the complete local-field source setting, import Layer 0's actual finite-intermediate-field topology and `integerRing_eq_integralClosure` comparison. Transport the map to the ring of integers of E. Localness sends powers of the source maximal ideal into the corresponding powers of the target maximal ideal. These powers are the declared adic neighbourhood bases, giving continuity. The supplier owns the field topology, integer ring and completeness; this roadmap owns their application to the finite local algebra.

### Tests that distinguish the hypotheses

**Torsion is not itself an obstruction.** The finite algebra O[t]/(pi*t,t^2) has the O-point t->0. Its nonzero t is killed by pi, so adding flatness or torsion-freeness to the input would discard a valid case. By contrast O/(pi^n)[t]/(t^2) has nilpotent pi and admits no unital O-algebra point in characteristic zero.

**Positive dimension alone is insufficient.** The algebra k[t], viewed over O through its residue field k, has dimension one and pi acts by zero. It is not finite as an O-module, so the theorem correctly does not apply.

**Points are not unique or separated by reduction.** In O[t]/(t^2-pi*t), both t->0 and t->pi define O-points. They are distinct in characteristic zero but have the same reduction. The existence theorem contains no uniqueness clause.

**The residue field may have to grow.** Take O=Z_3 and A=O[t]/(t^2-18). The algebra is finite, and its reduction is F_3[t]/(t^2), so A is local with residue field F_3. It is a domain: a square root of 18 in Q_3 would give a square root of 2, which is impossible after reducing a hypothetical unit root modulo 3. In any characteristic-zero integral point, the image of t divided by 3 has square 2. This element is integral and a unit, and its residue is a square root of 2. Such a root is absent from F_3. A finite extension with larger residue field, for example the unramified quadratic one, supplies the point. The chain from the zero prime to the nonzero maximal ideal (3,t) also verifies the positive-dimension premise for this domain. Thus the generic theorem cannot demand that its target have the same residue field as A.

This last example is a counterexample to a **generic strengthening**, not a reported error in Khare–Wintenberger's arithmetic corollary. A source-specific fixed-residue statement needs its own arithmetic and category hypotheses. None is silently obtained from this generic finite-algebra argument.

### Framed lifting and remaining source boundaries

The integrated node also mentions lifting the point to a formally smooth framed enlargement. That is a separate construction. With a proved complete-local presentation B=A[[x_1,...,x_d]], evaluate every x_i at zero and use the complete-local universal property. An alternative proof must build compatible maps to all Artinian target quotients and then justify their inverse-limit realization. The source residue data and any coefficient extension must be retained in either route.

Bare formal smoothness of an arbitrary ring map is not enough for a local integral lifting assertion: localization O -> K is formally smooth as a ring map, but K has no O-algebra map into the ring of integers of a finite extension, where pi is still a nonunit. This does not contradict a theorem in the complete-local coefficient category; it explains why that category cannot be omitted.

The finite-over-subring criteria, the finite-image theorem for universal deformation rings, and the arithmetic dimension estimates in the integrated decomposition remain required. This section does not reconstruct or certify those arithmetic inputs. The packet and every stage remain partial.

## 5a. R03.3: catenarity and freeness over a regular local base

Layer R03.6 of this roadmap asked R03.3 for two statements that the integrated depth node did not export.
These four nodes supply them. RS-08 assigns both to R03.3: it keeps "explicit catenarity and excellence
hypotheses" and "Cohen–Macaulay modules over a regular local base", proved compatible with ModularCurves 4D.
Library files: `TauCeti/RingTheory/Catenary` (namespace `Ring`) and `TauCeti/RingTheory/RegularLocalRing/MaximalDepth`.

### R03.3/catenary

**Definition: catenary rings** (`Ring.IsCatenary`, a definition; node `catenary`; Stacks Definition 10.105.1, tag 00NI).
A commutative ring R is catenary if, for all primes p ⊆ q:
- the lengths of chains of primes from p to q are bounded; and
- any two *saturated* chains from p to q, that is `LTSeries` in `PrimeSpectrum R` each of whose steps is a
  covering relation `⋖`, have the same length.

The pinned Mathlib has no catenary predicate. For a Noetherian ring, boundedness is automatic, since heights are finite.

*API.*
- `IsCatenary.of_ringEquiv`: invariance under ring isomorphisms.
- `IsCatenary.quotient`: quotients of catenary rings are catenary (Stacks 00NK).
- `IsCatenary.localization`: localizations of catenary rings are catenary (Stacks 00NJ).
- `isCatenary_of_ringKrullDim_le_one`: a ring of dimension at most one is catenary.
- `isCatenary_iff_ringKrullDim_quotient_covBy`: the lemma below.

*Unit tests.*
- A field is catenary (`isCatenary_test_field`).
- ℤ is catenary (`isCatenary_test_int`).
- k[x, y] is catenary although 0 ⊂ (x, y) and 0 ⊂ (x) ⊂ (x, y) differ in length (`isCatenary_test_mvPolynomial_two`).
  This test rejects a definition without *saturated*.
- Some Noetherian local domain is not catenary: Nagata's A[x]_{m'} of dimension 3, with a maximal chain of
  length 2 (Stacks 02JE; `isCatenary_test_nagata`). This test rejects a definition without the equal-length clause.

### R03.3/catenary-iff-dimension-function

**Lemma: catenarity of a Noetherian local ring as a dimension function** (`Ring.isCatenary_iff_ringKrullDim_quotient_covBy`;
node `catenary-iff-dimension-function`; Stacks Lemma 10.105.10, tag 0ECF). For a Noetherian local ring A:

```text
A catenary   ⟺   dim A/p = dim A/q + 1  whenever p ⋖ q in Spec A.
```

The right side is the hypothesis `hcat` of R03.6's `NearlyFaithful.of_quotient_of_isSMulRegular`.

*Proof.* dim A/p is the Krull dimension of V(p) (`ringKrullDim_quotient`), and it is finite (`ringKrullDim_quotient_le`,
`ringKrullDim_lt_top`). So chains from p have length at most dim A/p, and a longest chain from p ends at m and is
saturated, since otherwise a prime can be inserted (`RelSeries.insertNth`).
- (⇒) For p ⋖ q, put p in front of a longest saturated chain from q to m. This gives a saturated chain from p to m
  of length dim A/q + 1, which must equal dim A/p.
- (⇐) Chains from p to q are bounded by dim A/p. Along a saturated chain the hypothesis telescopes, so its length
  is dim A/p − dim A/q.

*Acceptance.*
- Locality is needed. The semilocal ring k[x, y] localized away from (x, y) ∪ (x − 1) is catenary, but
  (0) ⋖ (x − 1) with dimensions 2 and 0.
- Catenarity does not give equidimensionality: k⟦x, y, z⟧/(xz, yz) satisfies the condition but has components of
  dimensions 2 and 1. R03.6 therefore keeps its separate equidimensionality hypothesis.
- Nagata's ring fails the condition along its chain of length 2.

### R03.3/regular-local-cohen-macaulay

**Lemma: a regular local ring is Cohen–Macaulay** (node `regular-local-cohen-macaulay`; Stacks Lemma 10.106.3, tag 00NQ).
If A is regular local of dimension d, a minimal generating set x₁, …, x_d of m is an A-regular sequence. So A has an
A-regular sequence in m of length d.

*Proof.* By induction on d:
- A is a domain, so x₁ is a nonzerodivisor.
- dim A/(x₁) = d − 1 (`ringKrullDim_quotient_span_singleton_succ_eq_ringKrullDim_of_mem_nonZeroDivisors`), and the
  maximal ideal of A/(x₁) is generated by d − 1 elements, so A/(x₁) is regular (`isRegularLocalRing_iff`).

The domain property (Stacks 00NP, from gr_m A ≅ κ[X₁, …, X_d], 00NO) is not in the pinned Mathlib. It is recorded as a gap.

*Acceptance.*
- k⟦x, y⟧/(x², xy) has dimension 1 and depth 0, since x is killed by m.
- k⟦x, y⟧/(xy) is Cohen–Macaulay but not regular.

### R03.3/free-of-maximal-depth-regular-local

**Lemma: maximal-depth modules over a regular local ring are free** (`Module.free_of_isRegular_of_isRegularLocalRing`;
node `free-of-maximal-depth-regular-local`; Stacks Lemma 10.106.6, tag 00NT, the case e = d of Proposition 10.110.1,
tag 00O7). If A is regular local and M is finite with an M-regular sequence in m of length dim A, then M is free.

This is R03.6's form of the hypothesis "M ≠ 0 and depth M ≥ dim A".

*Proof.*
1. depth M = dim A: the given sequence gives ≥, and depth M ≤ dim Supp M ≤ dim A gives ≤.
2. pd M < ∞, because a regular local ring has finite global dimension.
3. depth A = dim A (`regular-local-cohen-macaulay`).
4. Auslander–Buchsbaum gives pd M = depth A − depth M = 0.

Steps 1, 2 and 4 use the integrated node `R03.3/depth-auslander-buchsbaum-and-dimension-bounds`. A finite projective
module is flat, hence free over a local ring (`Module.Flat.of_projective`, `Module.free_of_flat_of_isLocalRing`).

*Acceptance.*
- Regularity is needed: k = k[ε]/(ε) over the dual numbers is not free.
- Maximal depth is needed: k over k⟦x⟧ is not free.
- **Compatibility with ModularCurves 4D.** For a finite local map A → B of regular local rings of equal dimension,
  B has maximal depth over A. So B is free, which recovers 4D's miracle flatness instead of restating it.

*Consumers.* R03.6's `patching-free-conclusion` and `patching-kernel-equals-ideal`. Once these nodes are merged,
R03.6 can cite them in place of its requests to R03.3.

## 5b. General Hilbert–Samuel multiplicity

This continuation supplies the maintained reserved identifier
`DeformationAndDerivedPatchingAlgebra:key/hilbert-samuel-multiplicity` in
R03.3, once for general finite modules and ideals of definition. It is a
plan with gaps, not closure of the key definition, the stage, or this part.
The previous nine nodes, APIs, tests and historical source receipts remain.

Let (A,m) be a commutative Noetherian local ring, q an ideal with radical m,
and M a finitely generated A-module. An ideal of definition is necessarily
proper in this nontrivial local ring. No completeness, reducedness,
equidimensionality, field or DVR hypothesis belongs to the general definition.
Finite generation is not finite cardinality.

The convention is H(n)=length_A(M/q^(n+1)M). Length starts in ℕ∞;
finite-adic-quotient-length makes the values finite before they are read in
ℕ or ℚ. The pinned ENat conversion sends infinity to zero, so using it on an
unverified length would erase the difference between an infinite module and
the zero module. The quotient is the actual module quotient by the existing
ideal action on the top submodule, not a private carrier.

The cumulative polynomial P interpolates H eventually. Stacks 10.59 calls
the polynomial for the graded-piece function φ(n) its Hilbert polynomial;
that is not our cumulative P. Stacks 43.15 instead indexes its cumulative
function by q^nM. It is P(T−1) in our n+1 convention. Translation does not
change the leading coefficient, degree or multiplicity.

Intrinsic e(q;M) uses dim Supp M. Dimension-indexed e(q;M,d) extracts
d! coeff(P,d), and its multiplicity theorems require dim Supp M≤d. Ambient
e_A(M) takes d=dim A and vanishes on lower-dimensional modules. The raw
coefficient extractor at smaller d is not a multiplicity and is not promised
nonnegative. The zero module gives P=0 and e=0; its support dimension is
bottom, not zero.

The pinned Polynomial.hilbertPoly already extracts an eventual polynomial
from a rational formal power series. It does not construct a module's
associated graded, prove graded finite generation, or prove a module Hilbert
series rational. The source file explicitly leaves that graded-module
development as future work. The module-to-series bridge is therefore a
recorded gap, not a baseline theorem. Existing Module.supportDim, generic
prime filtration and length exactness are imported directly.

### Declaration-sized development

### R03.3/hilbert-samuel-function: Hilbert–Samuel quotient-length function

Proposed declaration: `TauCeti.HilbertSamuel.function`.

Definition. For any commutative ring A, module M and ideal q, define H(q,M,n)=length_A(M/(q^(n+1)·M)) in ℕ∞. Here q^(n+1)·M is the existing ideal action on the top submodule. For the local Noetherian finite-module regime, finite-adic-quotient-length proves that these values are finite; only then read them in ℕ or ℚ.

Hypotheses. A is a commutative ring and M an A-module for this raw extended-natural-valued definition; q is any ideal.

Proof route.

1. Use the actual quotient of M by (q^(n+1))·top, with its induced A action. Use Module.length directly, not the number of elements, a residue-field dimension of the whole quotient, or an unproved length-toNat conversion.

Dependencies: `mathlib:Module.length`, `mathlib:Submodule.smul_eq_map₂`.

API.

- `TauCeti.HilbertSamuel.function_eq_length`: H(q,M,n) is exactly the A-length of M/q^(n+1)M.

- `TauCeti.HilbertSamuel.function_zero`: For a zero module H(q,0,n)=0 for every n and q.

- `TauCeti.HilbertSamuel.function_congr`: An A-linear equivalence M≃N induces equality of quotient-length functions for the same q.

- `TauCeti.HilbertSamuel.function_top`: For q=A the raw function is zero; the ideal-of-definition hypotheses reject q=A over a nontrivial local ring.

Unit tests.

- `HilbertSamuelTest.function_field_rank` (computation): For a field k, q=0 and M=k^r, H(q,M,n)=r for all n, including n=0 and r=0.

- `HilbertSamuelTest.function_dvr_power` (computation): For a DVR O, q=m^s, s>0, and M=O, H(q,M,n)=s(n+1).

- `HilbertSamuelTest.function_infinite` (non-example): For A=ℤ, q=0 and M=ℤ, the raw length is ∞ for all n. Applying ENat.toNat would misleadingly give zero; do not export a polynomial here.

- `HilbertSamuelTest.function_zero` (degenerate): For the zero A-module and any ideal q the function is identically zero.

Acceptance: At n=0 take M/qM, not the zero quotient M/M. A finite quotient over an infinite residue field can still have finite length.

Sources: [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), §10.59 opening formulas and ideal-of-definition variant. The cumulative n+1 convention is read from section 10.59; graded and cumulative polynomials are not identified.

### R03.3/finite-length-of-maximal-power-annihilation: Finite length under maximal-ideal-power annihilation

Proposed declaration: `TauCeti.HilbertSamuel.finite_length_of_maximal_power`.

Lemma. For a Noetherian local A and finite A-module N, if m^r·N=0 for some r:ℕ, then length_A(N)≠∞, including r=0 and N=0.

Hypotheses. A is a commutative Noetherian local ring, N a finite A-module. There is r:ℕ such that m^r·top_N=bottom.

Proof route.

1. Filter N by m^iN for 0≤i≤r. Each subquotient is finite, because A is Noetherian, and is annihilated by m.

2. Use the induced A/m scalar action on each subquotient. Module.length_eq_of_surjective compares its A-length with its residue-field length, and Module.length_eq_finrank makes the latter a finite natural number.

3. Induct along the finite filtration using Module.length_eq_add_of_exact on the actual inclusion/projection exact sequences; do not assume they split. For r=0 the annihilation hypothesis already makes N zero.

Dependencies: `mathlib:Module.length_eq_of_surjective`, `mathlib:Module.length_eq_finrank`, `mathlib:Module.length_eq_add_of_exact`.

Acceptance: The module k[ε]/(ε²) has length 2 over itself although the filtration need not split. Without finite generation an infinite direct sum of k has mN=0 but infinite length.

Sources: [STACKS-FINITE-LENGTH](https://stacks.math.columbia.edu/tag/00J0), Lemma 10.52.8, statement and proof. Maximal-ideal-power annihilation and finite generation give the finite filtration used here.

### R03.3/finite-adic-quotient-length: Finite adic quotient lengths

Proposed declaration: `TauCeti.HilbertSamuel.function_ne_top`.

Lemma. Under the common hypotheses, H(q,M,n)≠∞ for every n:ℕ.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated.

Proof route.

1. Use Ideal.exists_radical_pow_le_of_fg and Noetherianity to choose r with m^r⊆q. If needed increase r to a positive integer; ideal powers decrease.

2. The quotient N=M/q^(n+1)M is finite and is annihilated by m^(r(n+1)), since m^(r(n+1))⊆q^(n+1). Apply finite-length-of-maximal-power-annihilation.

3. This supplies the necessary finiteness witness before H.toNat is interpreted as the genuine length.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-function`, `DeformationAndDerivedPatchingAlgebra:R03.3/finite-length-of-maximal-power-annihilation`, `mathlib:Ideal.exists_radical_pow_le_of_fg`, `mathlib:ENat.toNat`.

Acceptance: For a field and q=0 the lengths of finite-dimensional modules are finite. For k[[x,y]], q=(x) is rejected: its radical is not m, and A/q^(n+1) has infinite length.

Sources: [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), §10.59, immediately after Definition 10.59.1. The cumulative n+1 convention is read from section 10.59; graded and cumulative polynomials are not identified.

### R03.3/eventual-hilbert-samuel-polynomial: Existence and uniqueness of the cumulative polynomial

Proposed declaration: `TauCeti.HilbertSamuel.existsUnique_polynomial`.

Theorem. Under the common hypotheses there is exactly one P∈ℚ[T] such that P(n)=H(q,M,n).toNat for all n≥N for some N:ℕ. The polynomial interpolates the cumulative function, not the degree-n graded piece.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated.

Proof route.

1. The associated-graded ring/module gap supplies gr_q(A), gr_q(M), multiplication, Noetherianity, degree-one ring generation and finite graded-module generation. Its degree-n carrier is the native G_n in graded-hilbert-function; no increasing word-filtration carrier is substituted.

2. The remaining graded numerical-polynomial theorem follows the inspected induction of Stacks 10.58.7: stabilize the largest x-power-torsion submodule, terminate its nilpotent filtration, and prove the shifted degree-one multiplication exact sequences before induction on generators. This supplies Q∈ℚ[T] and N with Q(i)=φ(q,M,i).toNat for i≥N. These are still recorded gaps, not consequences of Polynomial.hilbertPoly.

3. Finite-graded-piece-length validates every coefficient conversion. Apply cumulative-polynomial-from-graded-tail to Q,N: P=S(Q)+Σ_{i<N}(φ(i).toNat−Q(i)) is the cumulative polynomial on n≥N. The new cumulative length and rational summation nodes account for this entire step; the finite initial constant is retained.

4. Uniqueness uses Polynomial.eq_of_infinite_eval_eq on the infinite tail of distinct rational natural-number casts. Finite-adic-quotient-length validates the cumulative values.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/finite-adic-quotient-length`, `DeformationAndDerivedPatchingAlgebra:R03.3/finite-graded-piece-length`, `DeformationAndDerivedPatchingAlgebra:R03.3/cumulative-polynomial-from-graded-tail`, `mathlib:Polynomial.eq_of_infinite_eval_eq`.

Acceptance: For O a DVR and q=m, P=T+1, not T and not the constant 1. For the embedded-prime example P=T+2 agrees only for n≥1; P(0)=2 is not the actual H(0)=1.

Sources: [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), Proposition 10.59.5; compare Definition 10.59.6. The cumulative n+1 convention is read from section 10.59; graded and cumulative polynomials are not identified. [STACKS-GRADED-HS](https://stacks.math.columbia.edu/tag/00K1), Proposition 10.58.7, complete proof. The proof is inspected but its graded-module hypotheses and induction interfaces still require the named gaps. [STACKS-ANTIDIFFERENCE](https://stacks.math.columbia.edu/tag/00JZ), Lemma 10.58.5, complete proof. The initial constant survives summation; this is not the assertion that the polynomial vanishes at zero.

### R03.3/hilbert-samuel-polynomial: Cumulative Hilbert–Samuel polynomial

Proposed declaration: `TauCeti.HilbertSamuel.polynomial`.

Construction. For a Noetherian local A, ideal q with radical q=m and finite M, define P(q,M) to be the unique polynomial of eventual-hilbert-samuel-polynomial. Its coefficient field is ℚ. It is chosen from the theorem on the actual quotient lengths, not accepted as extra data supplied by a caller.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated.

Proof route.

1. Choose the polynomial from eventual-hilbert-samuel-polynomial; uniqueness makes the choice independent of the threshold and of every existence witness.

2. The evaluation API is an eventual assertion with a threshold; it is not an equality for every n. Polynomial.degree returns −∞ for the zero polynomial and is retained in the zero-module case.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/eventual-hilbert-samuel-polynomial`.

API.

- `TauCeti.HilbertSamuel.polynomial_eventually`: There is N with P(q,M).eval(n)=H(q,M,n).toNat for all n≥N.

- `TauCeti.HilbertSamuel.polynomial_unique`: Any Q∈ℚ[T] eventually evaluating to the same quotient lengths equals P(q,M).

- `TauCeti.HilbertSamuel.polynomial_zero`: For a zero module P(q,0)=0.

- `TauCeti.HilbertSamuel.polynomial_congr`: An A-linear equivalence M≃N gives P(q,M)=P(q,N), by the quotient comparison and uniqueness.

Unit tests.

- `HilbertSamuelTest.polynomial_field` (computation): For q=0 on a field and M=k^r, P=C(r).

- `HilbertSamuelTest.polynomial_dvr` (computation): For q=m^s on a DVR, s>0, P=C(s)(T+1).

- `HilbertSamuelTest.polynomial_embedded` (computation): For A=k[[x,y]]/(xy,y²), q=m, P=T+2 while H(0)=1; an all-n evaluation API fails.

- `HilbertSamuelTest.polynomial_zero` (degenerate): For a zero module P=0 and polynomial degree = −∞.

Acceptance: For finite length M the eventual polynomial is the constant length M. The zero polynomial has degree −∞, not the support dimension zero.

Sources: [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), Proposition 10.59.5 and cumulative function in the opening formulas. The cumulative n+1 convention is read from section 10.59; graded and cumulative polynomials are not identified.

### R03.3/hilbert-samuel-degree: Polynomial degree equals support dimension

Proposed declaration: `TauCeti.HilbertSamuel.polynomial_degree`.

Lemma. For a nonzero finite M and radical q=m, P(q,M)≠0 and the natural degree d of P satisfies Module.supportDim A M=d (in WithBot ℕ∞). For M=0, P=0 and both polynomial degree and support dimension are −∞; no artificial dimension-zero convention is imposed.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated.

Proof route.

1. For q=m the dimension bridge gap supplies the exact-sequence leading-degree comparison of Stacks 10.59.10 and the local-ring degree/dimension theorem 10.60.9. Apply the existing prime-filtration theorem, not a new filtration construction.

2. In a prime filtration, degree equals the maximum degree of its factors and support is the union of their closed supports. Stacks 10.62.6 identifies these maxima. Module.supportDim is the existing dimension carrier, and Module.supportDim_eq_ringKrullDim_quotient_annihilator pins its convention.

3. For another ideal of definition q, compare powers of q and m as in Stacks10.59.4 and10.59.7; polynomial growth in both directions gives the same degree. The nonzero-hilbert-samuel-polynomial node independently rules out the zero polynomial, without using this degree comparison.

4. Use Module.supportDim_eq_bot_iff_subsingleton for the zero branch, not natDegree(0)=0 as a dimension assertion.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-polynomial`, `mathlib:IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime`, `mathlib:Module.supportDim`, `mathlib:Module.supportDim_eq_ringKrullDim_quotient_annihilator`, `mathlib:Module.supportDim_eq_bot_iff_subsingleton`, `DeformationAndDerivedPatchingAlgebra:R03.3/nonzero-hilbert-samuel-polynomial`.

Acceptance: For a DVR O and M=κ(O), degree is zero although dim O=1. For M=0 keep bottom support dimension.

Sources: [STACKS-SUPPORT-HS](https://stacks.math.columbia.edu/tag/00L8), Lemma 10.62.6, proof. This source is read; the named ring-dimension and exact-sequence inputs have not been decomposed or closed here. [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), Lemmas 10.59.4, 10.59.7 and Definition 10.59.8. The cumulative n+1 convention is read from section 10.59; graded and cumulative polynomials are not identified.

### R03.3/top-coefficient-finite-difference: Factorial top coefficient from finite differences

Proposed declaration: `TauCeti.HilbertSamuel.top_coefficient_finite_difference`.

Lemma. For P∈ℚ[T], d:ℕ with natDegree P≤d, and t∈ℚ, Σ_{i=0}^d (−1)^i binom(d,i)P(t−i)=d!·coeff(P,d). This includes P=0 and the case natDegree P<d.

Hypotheses. P is a rational polynomial, d a natural number bounding its natural degree, and t a rational number.

Proof route.

1. Induct on the number of backward differences ΔP(T)=P(T)−P(T−1); Pascal's identity gives the binomial expression.

2. For positive polynomial degree, Δ lowers degree by one and multiplies the leading coefficient by that degree, by binomial expansion. A constant has zero first difference; the zero polynomial remains zero.

3. After d steps obtain d! coeff(P,d). This proof is polynomial algebra only; it does not assume that module lengths themselves are exact-sequence additive at every adic level.

Dependencies: rational polynomial algebra only; no module theorem assumed.

Acceptance: For P=(T+1)(T+2)/2 and d=2 the difference equals 1, not 1/2. For P=T+1 and d=2 it equals 0.

Sources: [STACKS-MULT](https://stacks.math.columbia.edu/tag/0AZU), Lemma 43.15.4 and its complete finite-difference proof; explicit extension to degree ≤d. General local algebra, not a ring-only or curve-only special case. Section 43.15 uses n rather than n+1; translation preserves the top coefficient.

### key/hilbert-samuel-multiplicity: Intrinsic Hilbert–Samuel multiplicity

Proposed declaration: `TauCeti.HilbertSamuel.multiplicity`.

Definition. For a Noetherian local A, radical q=m and finite A-module M, define e(q;M)∈ℚ by natDegree(P(q,M))! times the leading coefficient of P(q,M). Set e(M)=e(m;M) and e(A)=e(m;A). This gives e(q;0)=0 without assigning the zero module dimension zero. For nonzero M, hilbert-samuel-degree identifies the factorial index with dim Supp M. A separate theorem proves this rational value is a positive integer.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated.

Proof route.

1. Use the actual cumulative polynomial and its top coefficient. The zero polynomial has zero leading coefficient, so the formula is zero even though its natural degree is zero.

2. Do not redefine a curve multiplicity or ambient-normalized module multiplicity here: curve applications specialize to M=A=O_C,x; ambient normalization uses multiplicityInDegree at dim A.

3. The definition is general in the ideal q and finite module M. Its existence theorem and support-degree comparison carry recorded gaps; merely giving the reserved id does not certify key-definition closure.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-polynomial`, `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-degree`.

API.

- `TauCeti.HilbertSamuel.multiplicity_zero`: e(q;0)=0.

- `TauCeti.HilbertSamuel.multiplicity_eq_factorial_leadingCoeff`: e(q;M)=natDegree(P(q,M))!·leadingCoeff(P(q,M)).

- `TauCeti.HilbertSamuel.multiplicity_congr`: A-linear equivalence M≃N preserves e(q;M).

- `TauCeti.HilbertSamuel.multiplicity_eq_inDegree`: If M≠0 and dim Supp M=d, then e(q;M)=e(q;M,d), the comparison node below.

- `TauCeti.HilbertSamuel.multiplicity_pos_integral`: For M≠0 there is a positive natural integer whose rational cast equals e(q;M), the positivity/integrality node below.

- `TauCeti.HilbertSamuel.multiplicity_pow`: For s>0, e(q^s;M)=s^dim(M) e(q;M) when M≠0, the power-ideal node below.

Unit tests.

- `HilbertSamuelTest.multiplicity_field` (computation): For a field k, q=0, M=k^r, e(q;M)=r, including r=0.

- `HilbertSamuelTest.multiplicity_dvr_power` (computation): For a DVR O, e(m^s;O)=s for every s>0.

- `HilbertSamuelTest.multiplicity_residue` (computation): For a DVR O, intrinsic e(m;κ(O))=1, not the ambient-normalized value 0.

- `HilbertSamuelTest.multiplicity_embedded` (non-example): A=k[[x,y]]/(xy,y²) has H(n)=n+2 for n≥1 and e(A)=1, but embedding dimension 2 and dimension 1. Its embedded prime forbids omitting unmixedness in Nagata's converse.

Acceptance: The intrinsic multiplicity of κ(O) over a DVR O is 1, while its ambient-normalized multiplicity is 0. The embedded-prime example has multiplicity 1 but is not regular.

Sources: [STACKS-MULT](https://stacks.math.columbia.edu/tag/0AZU), Definition 43.15.1. General local algebra, not a ring-only or curve-only special case. Section 43.15 uses n rather than n+1; translation preserves the top coefficient.

### R03.3/degree-indexed-multiplicity: Dimension-normalized multiplicity

Proposed declaration: `TauCeti.HilbertSamuel.multiplicityInDegree`.

Definition. Define e(q;M,d)=d!·coeff(P(q,M),d)∈ℚ for d:ℕ. Its multiplicity theorems require dim Supp M≤d (equivalently natDegree P≤d for nonzero M). If d=dim M it is intrinsic; if d>dim M it is zero. Ambient e_A(M) means d=dim A, not d=dim M. The raw coefficient extractor for smaller d is defined but is not a multiplicity and need not be nonnegative.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated.

Proof route.

1. Use the coefficient at the requested dimension, not the leading coefficient with a differently sized factorial.

2. Use the existing support-dimension bound to justify d=dim A for any finite M. All zero-module values vanish.

3. Do not convert coefficients to natural numbers before integrality and nonnegativity have been proved under the dimension bound.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-polynomial`, `mathlib:Module.supportDim_le_ringKrullDim`.

API.

- `TauCeti.HilbertSamuel.multiplicityInDegree_zero`: For M=0, e(q;M,d)=0 for every d.

- `TauCeti.HilbertSamuel.multiplicityInDegree_eq_coeff`: e(q;M,d)=d! coeff(P(q,M),d).

- `TauCeti.HilbertSamuel.multiplicityInDegree_eq_zero_of_lt`: If natDegree P(q,M)<d, the indexed value is zero.

- `TauCeti.HilbertSamuel.multiplicityInDegree_additive`: For a finite short exact sequence and one d bounding the support dimension of its middle module, the indexed value is additive; see the standalone additivity node.

- `TauCeti.HilbertSamuel.multiplicityInDegree_associativity`: For dim M≤d, the finite sum over top-dimensional support primes gives the indexed value; see the standalone associativity node.

Unit tests.

- `HilbertSamuelTest.inDegree_residue` (computation): For a DVR O and M=κ(O), e(m;M,0)=1 and e(m;M,1)=0.

- `HilbertSamuelTest.inDegree_mixed` (non-example): For O⊕κ(O) over a DVR, P=T+2 and intrinsic e=1. The sum of the two intrinsic multiplicities is 2; at ambient d=1 the identity is 1=1+0.

- `HilbertSamuelTest.inDegree_zero` (degenerate): For a zero module the indexed multiplicity is zero in every dimension.

- `HilbertSamuelTest.inDegree_factorial` (computation): For A=k[[x,y]], P=(T+1)(T+2)/2 and the d=2 value is 1, not 1/2; the plane-polynomial computation is a required open example.

Acceptance: For M=κ(O) over a DVR, d=1 gives zero and d=0 gives one. Intrinsic additivity is not asserted across mixed dimensions.

Sources: [STACKS-MULT](https://stacks.math.columbia.edu/tag/0AZU), Definition 43.15.1 and Lemma 43.15.2. General local algebra, not a ring-only or curve-only special case. Section 43.15 uses n rather than n+1; translation preserves the top coefficient.

### R03.3/intrinsic-ambient-normalization: Intrinsic and ambient normalization comparison

Proposed declaration: `TauCeti.HilbertSamuel.multiplicity_eq_inDegree`.

Lemma. If M≠0 and Module.supportDim A M=d, then e(q;M,d)=e(q;M). If d< D, then e(q;M,D)=0. In particular ambient normalization at dim A vanishes for every lower-dimensional M; for M=0 both notions vanish.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated.

Proof route.

1. Use hilbert-samuel-degree to identify the natural degree of the nonzero cumulative polynomial with d.

2. At d, its coefficient is its leading coefficient. At a larger D the coefficient is zero. Multiply by the indicated factorial.

3. Treat the zero module by P=0, without coercing bottom support dimension to a natural number.

Dependencies: `DeformationAndDerivedPatchingAlgebra:key/hilbert-samuel-multiplicity`, `DeformationAndDerivedPatchingAlgebra:R03.3/degree-indexed-multiplicity`, `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-degree`.

Acceptance: On κ(O) the two normalizations differ, despite its positive intrinsic multiplicity.

Sources: [STACKS-MULT](https://stacks.math.columbia.edu/tag/0AZU), Definition 43.15.1. General local algebra, not a ring-only or curve-only special case. Section 43.15 uses n rather than n+1; translation preserves the top coefficient.

### R03.3/multiplicity-positive-integer: Positivity and integrality of intrinsic multiplicity

Proposed declaration: `TauCeti.HilbertSamuel.multiplicity_pos_integral`.

Lemma. For any nonzero finite M under the common hypotheses, e(q;M) is a positive natural integer viewed in ℚ.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated. M is nonzero.

Proof route.

1. Let d=natDegree P. For t a sufficiently large natural integer, all t−i (0≤i≤d) are above the eventual evaluation threshold. top-coefficient-finite-difference expresses e as an integer linear combination of genuine integer quotient lengths, proving integrality.

2. The positive-hilbert-samuel-leading-coefficient node gives a strictly positive leading coefficient via finite positive quotient lengths, nonzero polynomial and the rational natural-tail sign lemma. Multiplication by the positive factorial makes intrinsic multiplicity positive, including the degree-zero case.

3. Combine positive rational value and integrality to obtain a positive natural integer. No primality, reducedness or Cohen–Macaulay hypothesis is introduced.

Dependencies: `DeformationAndDerivedPatchingAlgebra:key/hilbert-samuel-multiplicity`, `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-degree`, `DeformationAndDerivedPatchingAlgebra:R03.3/top-coefficient-finite-difference`, `DeformationAndDerivedPatchingAlgebra:R03.3/finite-adic-quotient-length`, `DeformationAndDerivedPatchingAlgebra:R03.3/positive-hilbert-samuel-leading-coefficient`.

Acceptance: A nonzero finite-length module has e=length>0 in dimension zero. The zero module is excluded from the positive statement.

Sources: [STACKS-MULT](https://stacks.math.columbia.edu/tag/0AZU), Lemma 43.15.4; positivity is the explicit polynomial-tail argument. General local algebra, not a ring-only or curve-only special case. Section 43.15 uses n rather than n+1; translation preserves the top coefficient. [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), Definition 10.59.8 and Lemma 10.59.10 proof, nonnegative leading coefficients. The cumulative n+1 convention is read from section 10.59; graded and cumulative polynomials are not identified.

### R03.3/multiplicity-powers: Multiplicity for powers of an ideal of definition

Proposed declaration: `TauCeti.HilbertSamuel.multiplicity_pow`.

Lemma. For s>0 and nonzero finite M of support dimension d, e(q^s;M)=s^d e(q;M). For M=0 both sides vanish.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated.

Proof route.

1. The actual quotient functions satisfy H(q^s,M,n)=H(q,M,s(n+1)−1) for every n; the exponent identity is s(n+1).

2. For sufficiently large n, polynomial evaluation identifies P(q^s,M) with P(q,M) composed with sT+(s−1), by uniqueness.

3. The coefficient of degree d of this composition is s^d times the original top coefficient by the binomial theorem. Multiply by d!, using hilbert-samuel-degree and radical(q^s)=radical(q) for s>0.

Dependencies: `DeformationAndDerivedPatchingAlgebra:key/hilbert-samuel-multiplicity`, `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-function`, `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-polynomial`, `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-degree`, `mathlib:Ideal.radical_pow`.

Acceptance: For a DVR, s=3 changes e from 1 to 3; declaring ideal-independence of multiplicity fails. For dimension zero, s^0=1 and multiplicity remains the module length.

Sources: [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), Definition 10.59.1 and quotient-length formula; explicit derivation, not a numbered source theorem. The cumulative n+1 convention is read from section 10.59; graded and cumulative polynomials are not identified.

### R03.3/dimension-normalized-additivity: Additivity at a common dimension

Proposed declaration: `TauCeti.HilbertSamuel.multiplicityInDegree_additive`.

Theorem. For a short exact sequence 0→M'→M→M''→0 of finite A-modules, q with radical q=m, and d:ℕ with Module.supportDim A M≤d, e(q;M,d)=e(q;M',d)+e(q;M'',d). Consequently intrinsic multiplicity is additive if all nonzero terms have the same dimension; it is not asserted additive for mixed dimensions.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated.

Proof route.

1. The Artin–Rees leading-coefficient gap supplies the correctly filtered quotient exact sequence: kernel M'/(M'∩q^(n+1)M), not generally M'/q^(n+1)M'.

2. Use Stacks 10.59.3 to replace the intersection filtration by a shifted q-adic filtration of a finite-colength submodule N⊆M'. The finite-colength comparison 10.59.9 preserves top coefficients in positive dimension.

3. Stacks 10.59.10 shows the discrepancy has strictly smaller degree; when M' has finite length, Artin–Rees makes its intersection with q^nM vanish eventually and the discrepancy becomes exactly length M'. Thus the dimension-zero case is genuine length additivity, not an omitted case.

4. Extract the coefficient of degree d of the eventual polynomials; terms of smaller dimension have zero dth coefficient by hilbert-samuel-degree. Multiply by d!.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/degree-indexed-multiplicity`, `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-degree`, `DeformationAndDerivedPatchingAlgebra:R03.3/finite-adic-quotient-length`, `mathlib:Module.length_eq_add_of_exact`.

Acceptance: The nonsplit sequence 0→O→O→κ(O)→0 induced by a uniformizer gives 1=1+0 at d=1; the adic quotient sequences are not exact without the induced filtration.

Sources: [STACKS-MULT](https://stacks.math.columbia.edu/tag/0AZU), Lemma 43.15.2. General local algebra, not a ring-only or curve-only special case. Section 43.15 uses n rather than n+1; translation preserves the top coefficient. [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), Lemmas 10.59.3, 10.59.9 and 10.59.10, all proofs. The cumulative n+1 convention is read from section 10.59; graded and cumulative polynomials are not identified.

### R03.3/multiplicity-associativity: Associativity of multiplicities

Proposed declaration: `TauCeti.HilbertSamuel.multiplicityInDegree_associativity`.

Theorem. For d≥dim Supp M, e(q;M,d)=Σ_p length_{A_p}(M_p) e(q_p;A/p,d), over primes p∈Supp M with dim(A/p)=d, where q_p is the image of q in A/p. The sum is finite; localized lengths are finite. At d=dim M≠−∞ this gives intrinsic associativity. Primes outside Supp M are not assigned ∞·0 terms.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated.

Proof route.

1. The finite top-dimensional support/localization gap identifies these primes with the relevant minimal support primes and proves the lengths of localized modules finite, as in Stacks 10.62.5.

2. Use the existing prime-filtration induction and dimension-normalized-additivity. Do not introduce a new generic filtration. The localized length is additive by the existing length exact-sequence theorem.

3. On a factor A/r, only p=r of dimension d contributes, with local length 1; if dim(A/r)<d both sides are zero. Transport q to the quotient coefficient ring and compare its lengths using Module.length_eq_of_surjective.

4. Sum along the finite filtration. The localization gap supplies exactness and the residue-field/zero dichotomy for every localized factor; no expression with infinite length is coerced to zero.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/dimension-normalized-additivity`, `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-degree`, `mathlib:IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime`, `mathlib:Module.length_eq_of_surjective`, `mathlib:Module.length_eq_add_of_exact`.

Acceptance: The nodal special fiber k[[x,y]]/(xy) must count both one-dimensional branches and give 2; its formal-series comparison is a required remaining example.

Sources: [STACKS-MULT](https://stacks.math.columbia.edu/tag/0AZU), Lemma 43.15.3, complete prime-filtration proof. General local algebra, not a ring-only or curve-only special case. Section 43.15 uses n rather than n+1; translation preserves the top coefficient.

### Worked convention checks and hypothesis boundary

For a DVR O and M=O, the n+1 convention gives H(n)=n+1 and P=T+1.
For q=m^s it gives P=s(T+1), hence multiplicity s. This rejects both
the wrong shift and an incorrect ideal-independent multiplicity.
For its residue field κ, H=1 and P=1: intrinsic e=1, ambient e_O=0.

For O⊕κ the quotient function is n+2 and P=T+2. Its intrinsic multiplicity
is 1, while e(O)+e(κ)=2. At ambient dimension one, however, the equality is
1=1+0. The nonsplit uniformizer sequence 0→O→O→κ→0 is a second check:
its q-adic quotients are not a short exact sequence. The additivity proof
must use the intersection filtration and Artin–Rees; it cannot assume the
q-adic quotient functor exact.

In A=k[[x,y]]/(xy,y²), every series has a unique normal form f(x)+c y.
The surviving monomials in A/m^(n+1) for n≥1 are 1,x,…,x^n,y,
so H(n)=n+2. At n=0 only 1 survives: H(0)=1 whereas P(0)=2.
The degree-one polynomial gives e(A)=1. The nilpotent ideal (y) is the
unique minimal prime and A/(y)=k[[x]], so dimension is one; x and y
are independent in m/m², so embedding dimension is two and A is not regular.
Ann(y)=m is an embedded associated prime. This is a mathematical normal-form
argument; finite monomial checks are not a Lean proof for formal series.

This also distinguishes formal equidimensionality from unmixedness.
A is already complete and its unique minimal component has full dimension,
but its associated prime m does not. Thus the maintained key brief's
“formally equidimensional (unmixed)” cannot be interpreted as identifying
minimal-prime equidimensionality with unmixedness. The retained Nagata
converse requires every associated prime of the completion to have full
dimension, as in the [Huneke–Yao introduction, p. 2](https://math.gsu.edu/yyao/eprint/regular.pdf).
That author copy quotes Nagata; it does not supply a fresh reading of Nagata's
proof. This clarification concerns the out-of-scope key brief; that file is
unchanged and no published-source erratum is alleged.

The required remaining comparisons are e(A)=1 for regular local A;
Nagata's converse with formal unmixedness; formal plane-curve order and the
smooth/node/cusp/triple-point computations with characteristics and
reducedness explicit; the parameter-ideal bound and Cohen–Macaulay equality
criterion; and completion invariance on actual rings/modules. They are
not asserted established by the finite examples or by the rational coefficient
definition.

### Ownership, source receipts and remaining proof leaves

The maintainer's assign.json reserves the general definition here.
Caro–Pasten's curve application specializes it to the local ring of a curve.
Iyengar–Khare–Manning use multiplicity to eliminate a complementary maximal
Cohen–Macaulay summand in Theorem 9.2. The selected preprint passage only uses
full-dimensional modules and does not independently identify its convention
on lower-dimensional modules; the ambient convention is mandated by the key
brief and is explicitly available here. Breuil–Mézard consumers keep their
special-fiber types and cycle comparisons rather than defining a second
general multiplicity. No automorphic statement is an input to this strand.

RS-08 still imports ModularCurves 4D's local regularity/completion/flatness
interfaces; this strand does not reconstruct them. The previous
regular-local-domain gap is retained: the existence of a Hilbert–Samuel
polynomial alone does not prove gr_m(A) a polynomial ring or A a domain.
The touching atlas stage edges and link-map overlap were screened. No new
coarse-stage dependency is introduced, and the fine-grained prerequisite
graph imports no representability or patching theorem.

The current packet retains fourteen gap groups. The original seven Hilbert–Samuel proof groups now have six remaining: associated-graded/module-to-series construction and cumulative sum; graded numerical-polynomial induction and antidifference; degree/dimension and Artin–Rees leading terms; top-dimensional localized lengths; discriminating geometric comparisons; and implementation of the signatures. Section 9 supplies the positivity proof deduction conditional on eventual-polynomial existence. It does not close the associated-graded or existence prerequisites. Every other stage retains its worklist and routed papers; none is closed.

Fresh source receipts, URLs, download SHA-256 hashes and precise selected
read sections are in the packet. Stacks 10.59 was read through its mathematical
proofs; 10.58.7, 10.52.8, 10.58.5, 10.62.6 and 43.15 were read at the stated
locators. The referenced ring-dimension proof 10.60.9 remains unread.
Iyengar–Khare–Manning is arXiv v3, not a publisher-edition collation; no
whole-paper coverage is claimed. The two near-area upstream documents read
in this session include ReductiveGroups and SemisimpleAlgebras; selected
LocalFieldsRamification contracts were also consulted.

The Hilbert–Samuel continuation initially had no compilation receipt. The
subsequent P7 continuation elaborated its then-complete suggested file at the
Mathlib pin, with 0 errors and 112 placeholder-proof warnings. That receipt
belongs to SHA-256 `fc04c0a556f75d6164a6db08ff5fa3f86e0a3b651cb1dfd0b1dea8454b5557fc`
and does not cover the four new positivity lemmas or their acceptance examples. It supplies the
canonical local-ring instance on each prime quotient from the pinned
`IsLocalRing.of_surjective'` theorem and removes redundant DVR instances.
No Tau Ceti module is imported; its baseline statements remain source-checked. The file contains real module,
ideal, quotient and rational-polynomial signatures, with explicit missing
formal-series example comparisons, not a record postulating all desired
theorems.

## 6. Remaining scope and ownership

The accepted RS-08 keeps the generic commutative-algebra direction of R03.3, while importing the specified local regularity, completion, flatness and coherent-support statements from ModularCurves 4D. The finite-prime-filtration result above is an even earlier baseline input. It neither reconstructs 4D nor makes the rest of R03.3 complete.

Section 5a now supplies catenarity, Cohen–Macaulayness of regular local rings and maximal-depth freeness over a regular local base; the domain property of regular local rings (Stacks 00NP) is a recorded gap. The remaining work for R03.3 includes its hypothesis-complete depth, Cohen–Macaulay, Auslander–Buchsbaum, complete-intersection, dimension and component-support arguments, respecting the reviewed audit's existing regular-sequence and projective-dimension declarations. Those presence/absence leads were not all re-audited in this checkpoint.

For P7, generic module/complex Milnor and Mittag–Leffler lemmas remain assigned to ArithmeticGaloisDuality R02.1 by RS-08; the complete-local derived applications stay here. P8 and P9 must retain their uniformity, derived-action, integral-torsion and component-support hypotheses. R03.1 and R03.2 must preserve the distinction between coefficient categories, hulls, representing objects and arithmetic Galois instances. R03.4's characteristic-zero-point theorem requires a genuine dimension or non-torsion premise. R03.5 constructs actual compatible patching data before asserting its depth and support conclusions.

The existing integrated decomposition remains the starting material for those parts. Its node identifiers must be retained when the corresponding arguments are verified and refined. This partial packet is not an instruction to discard those nodes or an accepted replacement for that decomposition.

## Sources and verification boundary

The main verification source is the [pinned Mathlib file](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/AssociatedPrime/Finiteness.lean), read with its parameter declarations and proofs. The corresponding mathematical statement and two source proofs were checked at [Stacks tag 00L0](https://stacks.math.columbia.edu/tag/00L0). The difference between the library's associated-prime proof and the Stacks maximal-counterexample proof is not a discrepancy in their conclusions.

The accepted AUDIT-17 R03.3 record was read, including its citation of associatedPrimes.finite, and the audit's accepted review was checked. The oversized aggregate library-coverage file returned empty content; it is not claimed read. RS-08's R03.3/P7 decisions and accepted review were read, and the relevant exact-category and local-regularity interfaces in GrothendieckEulerForms and ModularCurves were consulted. No new source erratum is alleged. Compilation and observed CI results belong in the handoff and PR; Lean-shaped examples alone do not establish elaboration.

The characteristic-zero continuation inspected the scoped AUDIT-17 R03.4 entry, the integrated point node and its source conventions, and the LocalFieldsRamification Layer 0 finite-extension/integral-closure contract. The original five baseline records and the other-stage worklists are retained. The new proof uses the additional pinned files listed with blob hashes in the packet, whose statements and proof passages were inspected. These reads do not constitute a new whole-library absence audit.

The external source is [Khare–Wintenberger, author preprint, Corollary 4.7](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), with the coefficient conventions on pp. 4–5 and the point/dimension passages on pp. 45–46. Those passages were read as parsed text; requests for the page images failed. No fresh PDF hash, successful visual inspection or publisher-edition comparison is claimed. [Stacks 00JB](https://stacks.math.columbia.edu/tag/00JB) was read for the Artinian/finite-length argument. The five nodes are explicit proof refinements, not a claim that the paper prints these five separate lemmas. No new source erratum is alleged.


## 7. Local minimal complexes and residual detection

This continuation works over an arbitrary commutative local ring for the minimal-complex results. Neither Noetherianity nor completeness is needed for the finite-free algebra. Complete Noetherian coefficient rings used in patching are instances. All earlier multiplicity, catenarity and characteristic-zero-point nodes remain. The thirteen nodes below refine the integrated P7 minimal-model node; they do not close P7 or the other seven stages.

The audited K-projective and homotopy APIs are already present at the pin. Bounded above projective complexes are K-projective; the quotient-to-derived map is bijective on their homotopy classes, and their quasi-isomorphisms are homotopy equivalences. Ordinary coefficient change preserves an actual homotopy equivalence. It does not by itself construct a derived tensor functor. The latter comparison is the explicit missing interface for the derived-object forms below.

Use cohomological grading, d_i:C^i→C^{i+1}, and H^i(K[n])=H^{i+n}(K). Write κ=R/m. A disk D_i(R) has R in degrees i,i+1 and identity differential. In the prototype it uses the existing cone of the identity on the stalk at i+1.

### perfect-object: Perfect complexes

For a commutative ring R, K in the existing DerivedCategory (ModuleCat R) is perfect exactly when there are a cochain complex C, integers a,b, finite projective R-modules C^i in every degree, vanishing C^i outside [a,b], and an isomorphism Q(C) ≅ K in the derived category. No directed quasi-isomorphism from K to a projective representative is required.

Hypotheses. R arbitrary commutative; a localization choice HasDerivedCategory is explicit. No local, complete or Noetherian hypothesis.

1. Use the pinned DerivedCategory.Q and existentially quantify an actual cochain complex, its finite/projective predicates and its termwise interval bound.

Acceptance. A nonzero finite projective module in degree n is perfect. A contractible disk is perfect although its chosen representative has two nonzero terms.

The proposed API is:

- `TauCeti.LocalPerfect.IsPerfect.of_rep`: A bounded finite-projective C makes Q(C) perfect.
- `TauCeti.LocalPerfect.IsPerfect.of_iso`: Perfectness transports along K ≅ L.
- `TauCeti.LocalPerfect.IsPerfect.exists_rep`: A perfect object has a bounded finite-projective representative and an isomorphism Q(C) ≅ K.
- `TauCeti.LocalPerfect.IsPerfect.zero`: The zero derived object is perfect.
- `TauCeti.LocalPerfect.IsPerfect.shift`: All integer shifts preserve perfectness; [a,b] becomes [a−n,b−n] for K[n].

The discriminating tests are:

- `TauCeti.LocalPerfect.perfect_zero`: The zero derived object is perfect.
- `TauCeti.LocalPerfect.perfect_projective_rep`: Q(C) is perfect whenever C is bounded and termwise finite projective.
- `TauCeti.LocalPerfect.perfect_iso_transport`: If K ≅ L, IsPerfect K ↔ IsPerfect L.
- `TauCeti.LocalPerfect.perfect_field_stalk`: For any field k and k-vector space V, the degree-zero stalk V[0] is perfect iff Module.Finite k V. In particular an infinite-dimensional stalk is not perfect.

Sources: [P7-STACKS-0657](https://stacks.math.columbia.edu/tag/0657) — Stable tag 0657; online text read 2026-10-02 (current numbering differs from the January book).

### pseudo-coherent-object: Pseudo-coherent complexes

K in D(R) is pseudo-coherent iff K ≅ Q(F) for a bounded above cochain complex F of finite free R-modules. The terms need not be bounded below. This is affine pseudo-coherence, independent of Noetherianity; bounded coherent cohomology is not substituted as its definition.

Hypotheses. R commutative and a chosen HasDerivedCategory.

1. Quantify an integer upper bound, an actual cochain complex and termwise Module.Finite/Module.Free instances.

Acceptance. Over R=k[ε]/ε², k[0] is pseudo-coherent with the resolution ...→R --ε→ R --ε→R. It is not perfect.

The proposed API is:

- `TauCeti.LocalPerfect.IsPseudoCoherent.of_rep`: Q(F) is pseudo-coherent for bounded above finite free F.
- `TauCeti.LocalPerfect.IsPseudoCoherent.of_iso`: Transport through a derived isomorphism.
- `TauCeti.LocalPerfect.IsPseudoCoherent.exists_rep`: Extract a bounded above finite-free representative.
- `TauCeti.LocalPerfect.IsPseudoCoherent.zero`: The zero derived object is pseudo-coherent.
- `TauCeti.LocalPerfect.IsPseudoCoherent.shift`: Every integer shift preserves pseudo-coherence.

The discriminating tests are:

- `TauCeti.LocalPerfect.pseudo_zero`: The zero object is pseudo-coherent.
- `TauCeti.LocalPerfect.pseudo_free_rep`: Every bounded above finite-free F gives a pseudo-coherent Q(F).
- `TauCeti.LocalPerfect.pseudo_iso_transport`: K ≅ L implies IsPseudoCoherent K ↔ IsPseudoCoherent L.
- `TauCeti.LocalPerfect.pseudo_field_stalk`: Over a field k, V[0] is pseudo-coherent iff Module.Finite k V; boundedness of the stalk alone does not suffice.

Sources: [P7-STACKS-064N](https://stacks.math.columbia.edu/tag/064N) — Stable tag 064N; online text read 2026-10-02 (current numbering differs from the January book).

### minimal-complex: Minimal complexes over local rings

For a local commutative ring (R,m,κ), a cochain complex C is minimal if every differential has image contained in m C^{i+1}. The predicate itself asserts neither finiteness, freeness nor boundedness. On finite-free complexes this is equivalently zero differentials after tensoring with κ, and equivalently all matrix entries lie in m in any chosen bases.

Hypotheses. R local; m is IsLocalRing.maximalIdeal R. Use LinearMap.range and ideal action on the actual ModuleCat carriers.

1. Define IsMinimal C by range(d_i) ≤ m • top; linearity gives the condition at every integer degree.

Acceptance. [R --π→R] over a DVR is minimal, but [R --1→R] is not. The zero complex is minimal.

The proposed API is:

- `TauCeti.LocalPerfect.IsMinimal.iff_residue_d_zero`: Minimality iff the κ-linear base change of each d_i is zero.
- `TauCeti.LocalPerfect.IsMinimal.of_iso`: A strict isomorphism of complexes preserves minimality.
- `TauCeti.LocalPerfect.IsMinimal.zero`: The zero complex is minimal.
- `TauCeti.LocalPerfect.IsMinimal.shift`: Shifts preserve minimality, including the differential sign.
- `TauCeti.LocalPerfect.IsMinimal.iff_matrix`: In finite bases, minimality iff every differential coefficient belongs to m.

The discriminating tests are:

- `TauCeti.LocalPerfect.minimal_zero`: The zero cochain complex is minimal.
- `TauCeti.LocalPerfect.minimal_iff_residue`: IsMinimal C ↔ ∀ i, (d_i).lTensor κ = 0.
- `TauCeti.LocalPerfect.minimal_iso_transport`: C ≅ D as complexes implies IsMinimal C ↔ IsMinimal D.
- `TauCeti.LocalPerfect.minimal_identity_disk`: The cone of the identity on the nonzero stalk R[1] is not minimal (its two-degree differential is a unit). It is nevertheless contractible.

Sources: [P7-STACKS-0BCC](https://stacks.math.columbia.edu/tag/0BCC) — Stable tag 0BCC; online text read 2026-10-02 (current numbering differs from the January book).

### unit-pivot-cancellation: Cancel a unit in a differential

Given a complex of finite free R-modules with chosen finite bases, if an entry of d_i:C^i→C^{i+1} is a unit, there is a strict complex isomorphism C ≅ C′ ⊕ D_i(R), where D_i is the identity disk in degrees i,i+1. The ranks in those two degrees drop by one; all other degrees are unchanged. The disk has an explicit contracting homotopy.

Hypotheses. R any commutative ring; a unit coefficient is required, not merely a nonzero coefficient. No exactness assumption on C.

1. Permute the selected row/column and scale the unit to 1. Use elementary basis operations to eliminate the rest of its column and row.
2. In d_i=diag(1,d′), d_i d_{i−1}=0 forces the incoming component into the selected summand to vanish; d_{i+1} d_i=0 forces the outgoing component to vanish.
3. Restrict the remaining differentials to complements. The inverse elementary operations assemble a complex isomorphism. Contract D_i by the identity map from degree i+1 to i.

Acceptance. Over Z/4, diag(1,2) splits as an identity disk and [R --2→ R]. Multiplication by 2 over Z/4 cannot be canceled: it is nonzero but a nonunit.

Sources: [P7-STACKS-00MT](https://stacks.math.columbia.edu/tag/00MT) — Stable tag 00MT; online text read 2026-10-02 (current numbering differs from the January book).

### minimal-representative: Minimal representatives

For a bounded above finite-free complex C over a local ring there exist a bounded above finite-free minimal complex M and a HomotopyEquiv C M. More precisely C is isomorphic to M plus a locally finite direct sum of identity disks: only finitely many disk summands meet any fixed degree. If C is bounded in [a,b], M has the same termwise bound and the disk sum is finite. The construction is not canonical.

Hypotheses. R local, C termwise finite free and bounded above; no Noetherianity or completeness. Fix bases and cancellation choices; uniqueness of the output is a separate theorem.

1. Starting at the upper bound b, cancel all unit entries of d_{b−1}, then d_{b−2}, and continue downwards. At each step the finite rank of the relevant terms strictly decreases.
2. After a differential has no units, all its coefficients lie in m. Subsequent basis changes preserve this property. Splitting further disks does not introduce coefficients outside m.
3. For every fixed degree only finitely many steps affect it: stages above it are finite in number and stages below i−1 do not change degree i. Assemble the stabilized terms, maps and inverse maps degreewise; this is an algebraic degreewise construction, not an unproved topological inverse limit.
4. The canceled disk family is degreewise finite. Its componentwise identity contraction is a defined map in every degree. Projection and inclusion give HomotopyEquiv C M. In the bounded case the sum of all original ranks bounds the number of cancellations.

Acceptance. C=[R --1→R] has M=0. C=[R --π→R] over a DVR is already minimal; both ranks survive even though only H^0(C) is nonzero. Over k[ε]/ε², the infinite resolution of k stays bounded above and minimal but not bounded below.

The proposed API is:

- `TauCeti.LocalPerfect.minimalRepresentative.exists`: Choose M with termwise finite freeness, upper bound, minimality and a homotopy equivalence C M.
- `TauCeti.LocalPerfect.minimalRepresentative.bounded`: If C vanishes outside [a,b], the chosen M may also vanish outside that interval.
- `TauCeti.LocalPerfect.minimalRepresentative.disk_part`: The discarded part is a locally finite sum of identity disks, with a specified contraction.
- `TauCeti.LocalPerfect.minimalRepresentative.quasiIso`: Its homotopy equivalence is a quasi-isomorphism by the pinned API.
- `TauCeti.LocalPerfect.minimalRepresentative.unique`: Two outputs are strictly isomorphic by minimal-homotopy-equivalence-is-iso.

The discriminating tests are:

- `TauCeti.LocalPerfect.minimal_rep_exists`: A bounded above finite-free C admits a minimal finite-free M and Nonempty (HomotopyEquiv C M).
- `TauCeti.LocalPerfect.minimal_rep_bounded`: For C bounded in [a,b], M can be chosen with IsStrictlyGE a and IsStrictlyLE b.
- `TauCeti.LocalPerfect.minimal_rep_already_minimal`: When C is minimal the identity HomotopyEquiv C C is an admissible representative.

Sources: [P7-STACKS-00MT](https://stacks.math.columbia.edu/tag/00MT) — Stable tag 00MT; online text read 2026-10-02 (current numbering differs from the January book), [P7-STACKS-0BCC](https://stacks.math.columbia.edu/tag/0BCC) — Stable tag 0BCC; online text read 2026-10-02 (current numbering differs from the January book).

### homotopy-residue-equality: Homotopies on minimal complexes vanish residually

For minimal C,D over a local ring, homotopic cochain maps f,g:C→D induce equal κ-linear maps in every degree after residue-field tensoring. This is equality of the residual chain maps, not equality of f and g over R.

Hypotheses. R local; no boundedness or finiteness is used in this statement.

1. The pinned Homotopy equation expresses f_i−g_i as d_D h_i+h_{i+1}d_C. Tensor with κ using Functor.mapHomotopy or the linear tensor-map identities.
2. Every differential is zero residually by minimality, so the residual difference is zero.

Acceptance. On [Z/4 --2→Z/4], maps differing by 2 can be homotopic and unequal over R, although equal modulo 2.

Sources: [P7-STACKS-0BCC](https://stacks.math.columbia.edu/tag/0BCC) — Stable tag 0BCC; online text read 2026-10-02 (current numbering differs from the January book).

### minimal-homotopy-equivalence-is-iso: Uniqueness of minimal complexes

Any homotopy equivalence between termwise finite-free minimal complexes over a local ring has a forward map that is a strict isomorphism of cochain complexes. Consequently two bounded above finite-free minimal complexes representing the same derived object are strictly isomorphic. No uniqueness of the isomorphism is asserted.

Hypotheses. The first assertion needs no bound. The derived-object assertion needs bounded above termwise projective complexes, so the pinned K-projective comparison applies.

1. Apply homotopy-residue-equality to the composites fg and gf. Their residual component maps are mutually inverse in every degree.
2. Apply Module.IsLocalRing.linearCombination_bijective_of_flat in finite bases (or its split-injection form plus residual surjectivity) to each component. A finite-free local map invertible residually is invertible.
3. Assemble component inverses; f_i d_D=d_C f_{i+1} implies the inverse chain identities by multiplying with these inverses.
4. For a derived isomorphism between bounded above projective representatives, use isKProjective_of_projective and Qh_map_bijective, then quasiIso_iff, to obtain the required homotopy equivalence.

Acceptance. A homotopy equivalence 0→[R --1→R] is not a strict isomorphism; minimality is indispensable. The identity and multiplication by any unit congruent to 1 modulo m give distinct isomorphisms of a nonzero stalk complex.

Sources: [P7-STACKS-0BCC](https://stacks.math.columbia.edu/tag/0BCC) — Stable tag 0BCC; online text read 2026-10-02 (current numbering differs from the January book).

### minimal-residual-ranks: Minimal ranks from residual cohomology

For a termwise finite-free minimal complex M, H^i(M⊗_R κ) ≅ M^i⊗_R κ. Thus rank_R(M^i)=dim_κ H^i(M⊗κ). For bounded above C and its minimal representative M, homotopy invariance identifies the right-hand side with H^i(C⊗κ). In particular M^i=0 iff this residual cohomology is zero.

Hypotheses. R local; ordinary termwise tensor of the projective representatives is used. The interpretation as derived base change needs the K-flat comparison recorded separately.

1. Minimality makes both neighboring residual differentials zero; cycles are the whole term and boundaries are zero.
2. Choose a finite basis of M^i and tensor it to a κ-basis, giving equality of rank and dimension. A finite-dimensional vector space has dimension zero iff it is zero; Nakayama then gives M^i=0.
3. Base change a HomotopyEquiv by the pinned mapHomotopyEquiv to preserve residual cohomology.

Acceptance. For [O --π→O] in degrees −1,0 the residual ranks are 1 in both degrees although integral H^(−1)=0. An identity disk has residual cohomology zero and minimal representative zero, despite two nonzero chosen terms.

Sources: [P7-STACKS-0BCC](https://stacks.math.columbia.edu/tag/0BCC) — Stable tag 0BCC; online text read 2026-10-02 (current numbering differs from the January book).

### three-term-residual-splitting: Exactness from a residual three-term complex

For finite-free M⁰,M¹,M² over any local ring R, and maps d₀,d₁ with d₁d₀=0, if im(d₀⊗κ)=ker(d₁⊗κ), then im d₀=ker d₁. Moreover ker d₀ splits in M⁰, im d₀ splits in M¹, and im d₁ splits in M². Exactness here is only at M¹; no injectivity at M⁰ or surjectivity at M² is asserted.

Hypotheses. R arbitrary commutative local, all three modules finite free, and actual composition zero before reduction. No Noetherianity or completeness.

1. Choose a κ-basis of ker(d₁⊗κ), and lift preimages through d₀ to vectors x_j in M⁰. Extend d₀(x_j) to a residual basis of M¹.
2. The resulting finite-free map R^r⊕R^s→M¹ is an isomorphism by the pinned local basis-lifting theorem. Denote the first factor U. It lies in im d₀ and ker d₁.
3. The induced map M¹/U→M² is injective modulo m by residual exactness. Apply split_injective_iff_lTensor_residueField_injective to split it. Therefore ker d₁=U=im d₀ and im d₁ splits in M².
4. The chosen x_j define a section of M⁰→U, so its kernel splits in M⁰. U already splits in M¹ by the basis decomposition.

Acceptance. Over Z/4, d₀(x)=(x,0), d₁(x,y)=y gives the split exact middle and all three summands. The zero maps R→0→R satisfy the hypothesis without either endpoint exactness. Over Z localized at 3 the map multiplication by 2 is invertible; over Z itself, reduction mod 3 of Z --2→Z→0 is exact while the original is not. Locality matters.

Sources: [P7-BP-AUTHOR-2025](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf) — §2.6.5, Lemma 2.6.6 and complete proof, pp.21–22.

### perfect-is-pseudo-coherent: Perfect objects are pseudo-coherent

Every perfect K is pseudo-coherent over an arbitrary commutative ring. A finite-projective representative need not itself have finite-free terms; adding a bounded above locally finite family of contractible disks produces a finite-free representative.

Hypotheses. R commutative; no local hypothesis; the resulting free complex can be unbounded below.

1. Starting at the top, choose a finite-projective complement making the highest projective term finite free.
2. At each lower degree choose a finite-projective complement making C^i plus the complement from degree i+1 finite free. Put the incoming complement identity into the differential.
3. The added complements form contractible disks with only two adjacent terms. The projection to C is a homotopy equivalence degreewise. Use the original derived isomorphism and pseudo-coherent-object.

Acceptance. For a nonfree finite projective module over a nonlocal ring, replacing projective by free in the definition of perfectness without a comparison would lose the object.

Sources: [P7-STACKS-064N](https://stacks.math.columbia.edu/tag/064N) — Stable tag 064N; online text read 2026-10-02 (current numbering differs from the January book).

### residual-perfectness-criterion: Perfectness detected at the residue field

Let K be pseudo-coherent over a local commutative ring R. If K⊗ᴸκ has cohomology only in [a,b], then K is represented by a finite-free complex with terms zero outside [a,b]. In particular K is perfect. Conversely such a representative has residual cohomology only in [a,b].

Hypotheses. R local, K pseudo-coherent and a≤b. Here amplitude for the residue-field object is cohomological amplitude, equal to projective/Tor amplitude over a field. No conclusion from ordinary K cohomology alone.

1. Take a bounded above finite-free F representing K, using pseudo-coherent-object.
2. Choose its minimal representative M. Under the projective derived-base-change comparison, residual-perfectness bounds H^i(F⊗κ).
3. minimal-residual-ranks makes M^i zero for every i outside [a,b]. Finite-free terms and this bound give a perfect representative.
4. Conversely termwise tensor of that representative is zero outside the same interval.

Acceptance. Over k[ε]/ε² the module k is pseudo-coherent but its residue-derived cohomology extends to all negative degrees, so the premise fails. For [O --π→O], the necessary interval is [−1,0], not [0,0].

Sources: [P7-BP-AUTHOR-2025](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf) — Lemma 2.6.7, p.22, full proof, [P7-STACKS-0BCC](https://stacks.math.columbia.edu/tag/0BCC) — Stable tag 0BCC; online text read 2026-10-02 (current numbering differs from the January book).

### pseudo-coherent-residual-nakayama: Residual Nakayama for pseudo-coherent objects

For a pseudo-coherent K over a local commutative ring, K⊗ᴸκ=0 iff K=0. For a morphism u between pseudo-coherent objects whose cone is pseudo-coherent, residual base change is an isomorphism iff u is an isomorphism. This theorem is not a statement about arbitrary complexes, and does not require derived completeness.

Hypotheses. R local. For the morphism form, explicitly establish pseudo-coherence of the cone; its general triangle closure is still an outstanding P7 proof, not silently assumed.

1. Choose a minimal bounded above finite-free representative. minimal-residual-ranks makes every term zero if every residual cohomology group is zero.
2. The zero representative gives K=0. The reverse implication is functoriality of base change.
3. Apply the object assertion to cone(u), using exactness of derived base change and the existing cone criterion for an isomorphism.

Acceptance. For a DVR O and K=Frac(O)[0], ordinary and derived residual tensor vanish but K is nonzero: the finite/pseudo-coherent hypothesis cannot be dropped. For perfect [O --π→O], rationalization vanishes but reduction modulo π does not; inversion and residue reduction are different tests.

Sources: [P7-STACKS-0BCC](https://stacks.math.columbia.edu/tag/0BCC) — Stable tag 0BCC; online text read 2026-10-02 (current numbering differs from the January book).

### bounded-residual-acyclic-contractible: Residual acyclicity gives a contraction

For a bounded finite-projective C over a local ring, if C⊗κ is acyclic then the identity map of C is homotopic to zero; hence C is acyclic. More generally a map between bounded finite-projective complexes whose residue map is a quasi-isomorphism is a homotopy equivalence.

Hypotheses. R local; finiteness in every degree and boundedness for the stated finite-complex version. Projective terms are finite free by the pinned local theorem.

1. Convert finite projective terms to finite free via Module.Flat.of_projective and free_of_flat_of_isLocalRing.
2. Minimal-representative and minimal-residual-ranks give a zero minimal part. The identity disk part has the explicit contraction already constructed.
3. For a map f, form cone(f), with finite-projective terms and a finite bound, and identify its residue cone with cone(residue f). Residual acyclicity contracts this cone. Use the pinned quasiIso_iff once acyclicity implies f is a quasi-isomorphism.

Acceptance. [R --1→R] contracts but its two terms are nonzero: residual acyclicity is not termwise vanishing. [Z/4 --2→Z/4] does not contract: its residual differential is zero.

Sources: [P7-STACKS-00MT](https://stacks.math.columbia.edu/tag/00MT) — Stable tag 00MT; online text read 2026-10-02 (current numbering differs from the January book), [P7-STACKS-0BCC](https://stacks.math.columbia.edu/tag/0BCC) — Stable tag 0BCC; online text read 2026-10-02 (current numbering differs from the January book).

### Scope and source-version boundaries

The suggested file gives concrete predicates on the pinned carriers, representative-level minimality and contraction signatures, the three-term exactness/splitting theorem, and their APIs and tests. It explicitly identifies signatures that still need generic derived tensor or locally finite disk machinery. No condition is replaced by an arbitrary proposition or a placeholder predicate. The complete suggested file elaborates at the Mathlib pin with 0 errors and 112 placeholder-proof warnings. This checks signatures only; every new mathematical implementation remains unchecked.

The Boxer–Pilloni author PDF is the 65-page November 2025 version, SHA-256 `af70d084612b1b75761694923ef2395752d23b41e0b8b458910d096df4c8c3c6`. The publisher PDF endpoint returned HTML; this is not a publisher-edition collation. Read scopes are p.17 and pp.21–22, including the proofs of Lemmas 2.6.6 and 2.6.7. The accepted paper review supplies E33 (the image summand belongs to M¹) and E26 (pseudo-coherence alone is not compactness). This continuation follows those findings without issuing another review verdict or claiming a newly discovered error.

For E26, the missing ring theorem must keep a single lower bound a for every target E_n: colim Hom(P,E_n)≅Hom(P,colim E_n) for pseudo-coherent P and E_n∈D^{≥a}. A finite perfect approximation Q→P with cone in D^{≤a−2} removes the negative tail for Hom in degree zero and its adjacent degree. Establish finite-perfect compactness and exact filtered-colimit/t-structure compatibility before applying that reduction. Without a common lower bound the infinite resolution of k over k[ε]/ε² and E_n=⊕_{i≤n}k[i] produce direct-sum versus product Hom groups. The affine theorem is decomposed into the four proof nodes below; its implementation and scheme globalization remain explicit obligations; the source’s geometric application stays with its six-functor owner.

Pilloni’s completed infinite-rank minimal complexes use completed free modules R^(I), not products R^I; no finite-free cancellation theorem here supplies that topological construction. The P7 Tor spectral sequence, duality, derived-completion comparison, finite-coefficient inverse limits with retained lim¹ and compatible chain actions remain on the worklist. Generic Milnor/ML comes from ArithmeticGaloisDuality:R02.1 as accepted RS-08 requires. R03.3 imports exactly ModularCurves 4D’s local regularity/completion statements, without interpreting that stage as a complete depth theory.


### The affine uniformly lower-bounded Hom comparison

The affine part of reviewed Boxer–Pilloni E26 can be decomposed without inventing a generic derived-colimit functor. Work with actual filtered diagrams of cochain complexes and their degreewise colimit. ModuleCat is AB5 at the pin, and Tau Ceti already has the R-linear Hom complex with its signed differential. The resulting comparison is on morphisms in the existing derived category.

#### finite-free-tail-approximation

Let F be a bounded above finite-free cochain complex over a commutative ring and let a be an integer. Its brutal truncation Q=σ_{≥a−1}F is bounded finite free. There is a chain map j:Q→F equal to the identity in degrees ≥a−1. Its quotient complex has terms zero in degrees >a−2. For any E with terms zero in degrees <a, precomposition gives a bijection Hom_D(R)(F,E)→Hom_D(R)(Q,E).

Use brutal truncation for the finite approximation, not the smart truncation: the latter has a cokernel term that need not be projective. F upper bounded; E termwise lower bounded.

1. Use the pinned stupidTrunc along embeddingUpIntGE(a−1). The inclusion natural transformation is a TODO in that file, so construct j in P7 by identity/zero components and prove its chain-map equation.
2. Finite free terms and the inherited upper bound make Q perfect. F/Q is strictly ≤a−2.
3. In the Hom cochain groups of degrees −1,0,1, the only possibly nonzero components F^i→E^{i+n} have i≥a−n. These all lie in Q. Precomposition therefore identifies the three groups and both differentials controlling H⁰.
4. Use the pinned HomComplex cohomology-to-homotopy comparison and K-projective-to-derived comparison for F and Q. Both are upper bounded projective complexes. This proves the Hom bijection without postulating a generic RHom functor.

Acceptance. Over dual numbers, truncate the infinite free resolution of k at a−1; it gives the same degree-zero derived Hom into any complex starting in degree a. At cutoff a, the degree-one Hom group can lose its i=a−1 component; the extra term is essential to control the cokernel/cocycle condition.

#### finite-perfect-hom-filtered-colimit

For a bounded finite-projective C and a small filtered diagram E_j of cochain complexes of R-modules, the canonical map colim_j Hom_D(R)(Q(C),Q(E_j))→Hom_D(R)(Q(C),Q(colim_j E_j)) is bijective. The target uses the degreewise complex colimit. No uniform bound on the E_j is needed for this finite source.

R commutative; C termwise finite projective and bounded on both sides; small filtered shape with the required colimits.

1. A finite-projective module P is a summand of R^r. Hom_R(P,−) is correspondingly a natural summand of the r-fold finite product of the target module, so it commutes with filtered colimits.
2. Each degree of the existing linear Hom complex from C is a finite product of those functors: C has a fixed finite interval of nonzero terms. The canonical comparison is an isomorphism of Hom complexes, with the signed differential unchanged.
3. Filtered colimits in ModuleCat are exact by the pinned AB5 instance; taking H⁰ therefore commutes. Use the existing linearHomComplex comparison to Mathlib and its cohomology classes.
4. Use the pinned K-projective comparison to interpret those classes as derived morphisms.

Acceptance. For C=R[0], this is ordinary cohomology commuting with a filtered colimit of module complexes. A bounded complex with an infinite-free term is not enough: Hom from ⊕_nR is an infinite product and can fail to commute with filtered colimits.

#### lower-bounded-target-replacement

For a filtered diagram E_j of module complexes with H^i(E_j)=0 for every i<a and one fixed a, the smart truncations τ_{≥a}E_j form a diagram of complexes strictly supported ≥a. The natural maps E_j→τ_{≥a}E_j are quasi-isomorphisms, as is the induced map on degreewise filtered colimits. The colimit itself has no cohomology below a.

One common a is required for the final strict-bound comparison. No target termwise finiteness or boundedness above. This is an application of existing smart truncation and exact filtered colimits, not a second truncation construction.

1. Use CochainComplex.truncGE, truncGEMap, and quasiIso_πTruncGE_iff. Their functoriality supplies the entire truncated diagram, not separately chosen isomorphic objects.
2. Use ModuleCat AB5 to commute kernels/cokernels and homology with filtered colimits. The colimit of the natural quasi-isomorphisms is a quasi-isomorphism.
3. The truncated diagram has all terms below a zero, so its degreewise colimit has the same strict lower bound.

Acceptance. A family whose lower bounds tend to −∞ does not yield a single strictly lower-bounded colimit. Smart truncation of [R --π→R] at zero has O/π as its boundary term, unlike its brutal truncation.

#### pseudo-coherent-hom-uniform-colimit

Let P be pseudo-coherent over any commutative ring R, and let E_j be a small filtered diagram of module complexes with H^i(E_j)=0 for all i<a, for one common a. Then the canonical map colim_j Hom_D(R)(P,Q(E_j))→Hom_D(R)(P,Q(colim_j E_j)) is bijective. It is natural in P, in the diagram and in compatible diagram maps. In particular every morphism P→Q(colim E_j) factors through some stage; equality of two stage representatives holds at a common later stage.

Pseudo-coherence of P; filteredness and a single uniform cohomological lower bound on every target. No Noetherianity or local hypothesis. The degreewise complex colimit is a model; no arbitrary colimit in a triangulated category is postulated.

1. Choose a bounded above finite-free F representing P, and transport the canonical comparison through that derived isomorphism.
2. Replace the target diagram functorially by smart truncations ≥a using lower-bounded-target-replacement. Its colimit remains quasi-isomorphic to the original one.
3. Apply finite-free-tail-approximation with cutoff a−1. This gives natural Hom bijections from F to its bounded finite-free Q for all truncated stages and their colimit.
4. Apply finite-perfect-hom-filtered-colimit to Q. Naturality identifies the composite with the canonical map for P.
5. Surjectivity is stage factorization; injectivity is eventual equality in a filtered set colimit. This is an equality of morphisms in D(R), not a canonical choice of factor or a strict compatible Hecke action.

Acceptance. Over k[ε]/ε², P=k[0] and E_n=⊕_{i=0}^n k[i] violate the common lower bound. The colimit Hom map is ⊕_i k→∏_i k and misses the all-ones sequence. When P is perfect, finite-perfect-hom-filtered-colimit removes the lower-bound hypothesis. Constant diagrams have their identity Hom comparison; the zero source has the unique zero factorization.

Read the complete proof of [Stacks 0G8W](https://stacks.math.columbia.edu/tag/0G8W), which treats module targets. The extension to complexes is justified above by finite products in the Hom complex and the common lower bound; it is not attributed to Stacks as a verbatim theorem. The general ring theorem is planned here as the issue directs. The scheme/six-functor and solid/discrete comparison remains a separate owner application. No strict coherent action is manufactured from a factorization of a derived morphism.


## 9. Positivity of the cumulative polynomial — codex-rtOQ9t

The common object remains the actual extended module length
`H(q,M,n) = Module.length A (M / q^(n+1)M)` and the previously planned rational cumulative polynomial. The exponent is positive even at n=0. The module may have dimension zero. The reserved general multiplicity definition and its intrinsic/ambient normalization are retained unchanged.

The proof chain separates a sign statement for rational polynomials from local finite-module nonvanishing. It does not assume a degree/dimension formula to prove the polynomial is nonzero. It does not turn positivity into integrality: that is still the separate finite-difference argument in Section 5b.

### R03.3/positive-leading-coefficient-on-natural-tail: Positive leading coefficient from a natural tail

Proposed declaration: `TauCeti.HilbertSamuel.leadingCoeff_pos_of_nat_tail_nonneg`.

Let P∈ℚ[T] be nonzero. If there is N∈ℕ such that P(n)≥0 for every natural n≥N, then leadingCoeff(P)>0. The hypothesis is only on the natural tail, not on every real or rational input; constants are included.

Hypotheses. P is a rational polynomial with P≠0; N is a natural number and all natural n≥N have P(n)≥0.

Proof route.

1. If natDegree P=0, use the pinned constant-polynomial theorem. Evaluation at N makes its constant nonnegative; nonzero leading coefficient makes it positive.

2. For positive natural degree, suppose the leading coefficient is nonpositive. The pinned polynomial theorem gives P(x)→−∞ as rational x→+∞.

3. Compose with the pinned natural-cast limit to get P(n)→−∞. Beyond some natural threshold P(n)<0, contradicting the nonnegative tail at the maximum of the two thresholds.

4. This proves a strict sign, not integrality or an exact evaluation formula. The zero polynomial cannot be admitted.

Dependencies: `mathlib:Polynomial.tendsto_atBot_of_leadingCoeff_nonpos`, `mathlib:tendsto_natCast_atTop_atTop`, `mathlib:Polynomial.eq_C_of_natDegree_eq_zero`, `mathlib:Polynomial.leadingCoeff_ne_zero`, `mathlib:Polynomial.natDegree_pos_iff_degree_pos`.

Acceptance requirements. Positive constants must pass without assuming positive degree. X²−100X is negative at1 but is nonnegative at every natural n≥100; an all-input condition would be too strong. A positive rational leading coefficient need not give integral multiplicity without integer-valued tail data.

- `HilbertSamuelPosTest.constant` (computation): P=C(3/2) has leading coefficient3/2>0; positive degree is unnecessary.
- `HilbertSamuelPosTest.delayed` (computation): P=X²−100X has leading coefficient1, P(1)=−99 and P(n)≥0 for all natural n≥100.
- `HilbertSamuelPosTest.zero` (non-example): The zero polynomial has leading coefficient0 and fails strict positivity despite its nonnegative values everywhere.
- `HilbertSamuelPosTest.rational` (non-example): P=(1/3)X+1 has positive leading coefficient1/3, which is not the rational cast of any integer. Positivity alone supplies no integrality.

These four cases have full native `example` forms in the suggested file. They are additional lemma acceptance examples; they do not change the checker's 35 definition/construction unit-test count.

Sources: [HS-POS-PIN](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Polynomial/Basic.lean), Polynomial/Basic.lean 81–83 and AtTopBot/Archimedean.lean 44–47; Degree/Operations.lean 486–487. An explicit deduction from the actual pinned sign limit and natural-cast limit, with the constant branch treated separately.

### R03.3/positive-finite-adic-length: Positive finite adic quotient lengths

Proposed declaration: `TauCeti.HilbertSamuel.function_toNat_pos`.

For a nonzero finite module M over a Noetherian local A and an ideal q with radical q=m, H(q,M,n).toNat>0 for every n∈ℕ. Both positivity of the actual quotient and its finite length are proved before converting the extended value.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated. M is nonzero.

Proof route.

1. For I=q^(n+1), positive powers satisfy I⊆q⊆m. If I·M=M, the native finite-submodule Nakayama theorem applies to top: I is inside the Jacobson radical of its annihilator by maximalIdeal_le_jacobson. It would make M zero, a contradiction.

2. The native quotient nontriviality criterion makes M/I·M nontrivial. Module.length_pos gives strictly positive extended length.

3. The existing finite-adic-quotient-length node excludes infinity. Only now use ENat.toNat_pos, keeping its two separate premises.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-function`, `DeformationAndDerivedPatchingAlgebra:R03.3/finite-adic-quotient-length`, `mathlib:Ideal.pow_le_self`, `mathlib:Ideal.le_radical`, `mathlib:Submodule.eq_bot_of_eq_ideal_smul_of_le_jacobson_annihilator`, `mathlib:IsLocalRing.maximalIdeal_le_jacobson`, `mathlib:Submodule.Quotient.nontrivial_iff`, `mathlib:Module.length_pos`, `mathlib:ENat.toNat_pos`.

Acceptance requirements. The zero module is excluded; n=0 still gives M/qM, not M/M. Finiteness of M is essential: for a nonfield DVR A and fraction field K, mK=K although K≠0. Extended positive length can be infinity. The finite-length hypothesis is required before toNat.

Sources: [HS-POS-LOCAL](https://stacks.math.columbia.edu/tag/00K4), Opening quotient-length formulas; Definition10.59.8; leading-coefficient paragraph of Lemma10.59.10. The source observes leading-coefficient nonnegativity. The four-node continuation separates Nakayama, finite positive lengths, nonzero polynomial and the precise tail-sign deduction. [HS-POS-NAK](https://stacks.math.columbia.edu/tag/00DV), Lemma10.20.1(2), proof through(1). Apply the already-built local Nakayama theorem to the finite module; no second Nakayama theorem is planned.

### R03.3/nonzero-hilbert-samuel-polynomial: The nonzero cumulative polynomial

Proposed declaration: `TauCeti.HilbertSamuel.polynomial_ne_zero`.

For nonzero finite M under the local ideal-of-definition hypotheses, the chosen cumulative Hilbert–Samuel polynomial P(q,M) is nonzero. This conclusion does not use the degree/support-dimension theorem.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated. M is nonzero.

Proof route.

1. Take the eventual evaluation threshold supplied by hilbert-samuel-polynomial.

2. Evaluate at that natural threshold. positive-finite-adic-length makes the actual natural quotient length strictly positive; its rational cast is positive.

3. The zero polynomial would evaluate to zero there, a contradiction. No associated-graded or dimension theorem is used in this deduction, but the existing polynomial-existence prerequisite retains its open proof obligations.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-polynomial`, `DeformationAndDerivedPatchingAlgebra:R03.3/positive-finite-adic-length`.

Acceptance requirements. A nonzero finite-length module has a nonzero constant polynomial, so positive degree is not imposed. The zero-module polynomial remains zero, with bottom degree/support dimension.

Sources: [HS-POS-LOCAL](https://stacks.math.columbia.edu/tag/00K4), Opening quotient-length formulas; Definition10.59.8; leading-coefficient paragraph of Lemma10.59.10. The source observes leading-coefficient nonnegativity. The four-node continuation separates Nakayama, finite positive lengths, nonzero polynomial and the precise tail-sign deduction.

### R03.3/positive-hilbert-samuel-leading-coefficient: Positive Hilbert–Samuel leading coefficient

Proposed declaration: `TauCeti.HilbertSamuel.polynomial_leadingCoeff_pos`.

For nonzero finite M under the local ideal-of-definition hypotheses, leadingCoeff(P(q,M))>0. This is the sign input to intrinsic multiplicity; it is not the degree comparison or the integrality theorem.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated. M is nonzero.

Proof route.

1. The nonzero-polynomial node supplies P≠0 without invoking its degree.

2. The eventual evaluation API makes P(n) a cast of a natural length on a common natural tail, hence nonnegative there.

3. Apply positive-leading-coefficient-on-natural-tail. Constants, including all nonzero finite-length modules, use its constant branch.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-polynomial`, `DeformationAndDerivedPatchingAlgebra:R03.3/nonzero-hilbert-samuel-polynomial`, `DeformationAndDerivedPatchingAlgebra:R03.3/positive-leading-coefficient-on-natural-tail`.

Acceptance requirements. Dimension-zero modules are included. The ambient multiplicity of a lower-dimensional module may still be zero; this theorem concerns its intrinsic leading coefficient.

Sources: [HS-POS-LOCAL](https://stacks.math.columbia.edu/tag/00K4), Opening quotient-length formulas; Definition10.59.8; leading-coefficient paragraph of Lemma10.59.10. The source observes leading-coefficient nonnegativity. The four-node continuation separates Nakayama, finite positive lengths, nonzero polynomial and the precise tail-sign deduction. [HS-POS-PIN](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Polynomial/Basic.lean), Polynomial/Basic.lean 81–83 and AtTopBot/Archimedean.lean 44–47; Degree/Operations.lean 486–487. An explicit deduction from the actual pinned sign limit and natural-cast limit, with the constant branch treated separately.

### Fresh inspection and verification boundary

All eight applicable AUDIT-17 layer entries and the relevant accepted RS-08 ownership decisions were read before this continuation. The complete GrothendieckEulerForms and Multiquadratic upstream documents were read in this continuing session. The actual roadmap extract, its touching stage edges, and the ModularCurves 7D/R03.1 overlap were screened. Generic multiplicity stays in R03.3; this proof imports no automorphic application or new coarse-stage dependency.

The twelve newly registered baseline declaration statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, including their ambient parameters. Their precise modules and contracts are in the packet. The existing 87 references and prior P7 receipts are retained; they are not presented as a fresh inspection of all inherited results. [Stacks 00DV](https://stacks.math.columbia.edu/tag/00DV) was read in full; [Stacks 00K4](https://stacks.math.columbia.edu/tag/00K4) was read at the selected quotient-length, definition and leading-coefficient locators. Download hashes and read boundaries are in the three new source records.

The new forms use rational polynomials, actual ideals and module quotients, and `[Nontrivial M]` for nonzero modules. They remain unchecked. No existing combined build at both pinned commits was available, so the changed file was not compiled. No new Lake project, cache download, library build or language server was started. The handoff records the packet, intake, preservation, dependency and exact-arithmetic checks actually run. No formalization or stage closure is claimed.

The partial projection retains a source-registry dependency from `R03.3/free-of-maximal-depth-regular-local` to the integrated `R03.3/depth-auslander-buchsbaum-and-dimension-bounds` node. Normal layer replacement does not render that old input as a stage; the complete packet must carry forward and split it. The handoff distinguishes this inherited limitation from the four new nodes, whose prerequisites all resolve within this packet or the pinned baseline.

## 10. Graded quotient lengths and rational cumulative summation

### Conventions and ownership

The degree-n module is the already built subtype quotient F_n/(q·top_{F_n}), where F_n=q^nM. Its native inclusion into M/q^(n+1)M is injective. The range is the kernel of the native quotient transition to M/q^nM. These maps need not split. This gives the cumulative identity over arbitrary commutative rings, with extended-natural lengths, before any local Noetherian or finite-generation hypothesis is needed.

Use the existing quotient-ring module action. Its scalar formula and the explicit torsion-witness scalar tower justify restricting from A/q to A. The graded Hilbert function is a numerical adapter on these native modules, not a new associated-graded carrier. Tau Ceti's word-filtration associated graded is increasing and does not supply the decreasing adic ring. The entire ring/module structure on the direct sum remains a named obligation.

The rational summation polynomial uses Mathlib's existing Bernoulli polynomials and power-sum identity. It is an auxiliary adapter for Hilbert–Samuel existence, not a second Bernoulli theory or a claim to general abelian-group-valued numerical polynomials. The actual finite initial segment changes its constant. In particular an eventually zero graded polynomial can yield a nonzero constant cumulative polynomial.

### Graded Hilbert quotient-length function

DeformationAndDerivedPatchingAlgebra:R03.3/graded-hilbert-function — definition; unchecked.

Proposed declaration: `TauCeti.HilbertSamuel.gradedFunction`.

For F_n=q^n·top_M, use the native quotient G_n=F_n/(q·top_{F_n}). Define φ(q,M,n)=length_A(G_n) in ℕ∞. The subtype inclusion sends its denominator to q^(n+1)M, so this is the actual length of q^nM/q^(n+1)M. The already existing A/q-module structure on G_n is reused, not newly constructed.

Hypotheses:

- A is a commutative ring, M is an A-module, q is any ideal, and n is a natural number. No finiteness or local hypothesis is imposed unless stated.

Prerequisites:

- `mathlib:Module.length`
- `mathlib:Submodule.powSMulQuotInclusion`
- `mathlib:Module.isTorsionBySet_quotient_ideal_smul`
- `mathlib:Module.Quotient.mk_smul_mk`
- `mathlib:Module.length_eq_of_surjective`
- `mathlib:Module.IsTorsionBySet.isScalarTower`

Proof or construction:

1. Take the existing ideal action, subtype module, submodule quotient and Module.length. The native powSMulQuotInclusion with a=n, b=1, c=n+1 identifies G_n with the kernel of M/q^(n+1)M→M/q^nM; its scalar maps are the native ones.
2. Module.isTorsionBySet_quotient_ideal_smul and the existing quotient module instance supply the A/q action. Module.Quotient.mk_smul_mk checks compatibility with A. Module.length_eq_of_surjective identifies the two lengths when the quotient action is used.

Acceptance:

- Do not replace φ(n) by H(n). Over a DVR they are 1 and n+1 for q=m.
- Keep ∞ as ∞ until finite graded quotient length is established.

API:

- `TauCeti.HilbertSamuel.gradedFunction_eq_length` (characterisation): φ(q,M,n)=length_A(F_n/(q·top_{F_n})) with the native subtype and quotient.
- `TauCeti.HilbertSamuel.gradedFunction_zero` (simp): If M=0 then φ(q,M,n)=0 for every q and n.
- `TauCeti.HilbertSamuel.gradedFunction_zero_degree` (compatibility): φ(q,M,0)=H(q,M,0), via F_0=top_M and the induced quotient equivalence.
- `TauCeti.HilbertSamuel.gradedFunction_congr` (functoriality): An A-linear equivalence M≃N preserves φ(q,-,n) for the same ideal q and every n.
- `TauCeti.HilbertSamuel.gradedFunction_top` (simp): For q=A the raw graded function is identically zero.

Unit tests:

- `HilbertSamuelGradedTest.field_rank` (computation): For a field k, q=0 and M=k^r, φ(0,M,0)=r and φ(0,M,n+1)=0 for every n, including r=0.
- `HilbertSamuelGradedTest.dvr_power` (computation): For a DVR O and q=m^s with s>0, φ(q,O,n)=s for every n, not s(n+1).
- `HilbertSamuelGradedTest.zero` (degenerate): For the zero A-module, φ(q,0,n)=0 for any q and n.
- `HilbertSamuelGradedTest.infinite` (non-example): For A=ℤ, M=ℤ and q=0, φ(q,M,0)=∞ and φ(q,M,n+1)=0. Its cumulative extended length is still ∞; applying toNat before finiteness would destroy that information.

Uses:

- Stacks §10.59 opening and Proposition 10.59.5: Distinguish coefficient lengths from the cumulative function and supply the exact-sequence summation.
- R03.3/eventual-hilbert-samuel-polynomial: State the precise remaining graded polynomiality contract on actual quotient modules.

Sources:

- [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), §10.59 opening formulas, ideal-of-definition variant, and Proposition 10.59.5: “ideal of definition”. Use the actual graded quotient lengths and their cumulative sum; the graded and cumulative polynomials have different indexing.
- [HS-CUMUL-PIN](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Quotient/PowTransition.lean), PowTransition.lean, powSMulQuotInclusion and factorPowSucc; Length.lean, length_eq_add_of_exact: “The canonical inclusion”. Native inclusion and quotient-transition maps give a genuine exact sequence; no splitting or associated-graded direct-sum carrier is assumed.


### Length of one adic quotient transition

DeformationAndDerivedPatchingAlgebra:R03.3/adic-quotient-length-step — lemma; unchecked.

Proposed declaration: `TauCeti.HilbertSamuel.quotient_length_succ`.

Put L_n=length_A(M/q^nM), so L_0=0. For every n, L_(n+1)=φ(q,M,n)+L_n in ℕ∞, with no finite-length hypothesis. This comes from 0→G_n→M/q^(n+1)M→M/q^nM→0.

Hypotheses:

- A is a commutative ring, M is an A-module, q is any ideal, and n is a natural number. No finiteness or local hypothesis is imposed unless stated.

Prerequisites:

- `DeformationAndDerivedPatchingAlgebra:R03.3/graded-hilbert-function`
- `mathlib:Submodule.powSMulQuotInclusion_injective`
- `mathlib:Submodule.range_powSMulQuotInclusion`
- `mathlib:Submodule.powSMulQuotInclusion_mk`
- `mathlib:Submodule.factorPowSucc`
- `mathlib:Submodule.ker_mapQ`
- `mathlib:Submodule.factor_surjective`
- `mathlib:Module.length_eq_add_of_exact`

Proof or construction:

1. Set j_n=Submodule.powSMulQuotInclusion for a=n, b=1, c=n+1 and N=top; simplify q^1=q. Set π_n=Submodule.factorPowSucc q M n. The inclusion sends the class of x∈F_n to its class in M/q^(n+1)M.
2. The native inclusion theorem gives injectivity and range(j_n)=F_n.map(mkQ F_(n+1)). Submodule.ker_mapQ applied to the identity map gives this same submodule as ker(π_n). Submodule.factor_surjective gives surjectivity. Hence the range/kernel criterion gives Function.Exact j_n π_n.
3. Apply Module.length_eq_add_of_exact. No section, direct-sum decomposition or finite natural subtraction is used.

Acceptance:

- For M=ℤ/4 and q=(2), the n=1 transition has length 2=1+1 but is nonsplit as an ℤ-module sequence.
- At n=0 the right-hand quotient is M/M, and the equation is H(0)=φ(0)+0.

Sources:

- [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), §10.59 opening formulas, ideal-of-definition variant, and Proposition 10.59.5: “ideal of definition”. Use the actual graded quotient lengths and their cumulative sum; the graded and cumulative polynomials have different indexing.
- [HS-CUMUL-PIN](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Quotient/PowTransition.lean), PowTransition.lean, powSMulQuotInclusion and factorPowSucc; Length.lean, length_eq_add_of_exact: “The canonical inclusion”. Native inclusion and quotient-transition maps give a genuine exact sequence; no splitting or associated-graded direct-sum carrier is assumed.


### Cumulative length is the sum of graded lengths

DeformationAndDerivedPatchingAlgebra:R03.3/cumulative-graded-length — theorem; unchecked.

Proposed declaration: `TauCeti.HilbertSamuel.function_eq_sum_graded`.

For every commutative ring A, A-module M, ideal q and n≥0, H(q,M,n)=Σ_{i=0}^n φ(q,M,i) in ℕ∞. The finite sum includes i=0 and i=n.

Hypotheses:

- A is a commutative ring, M is an A-module, q is any ideal, and n is a natural number. No finiteness or local hypothesis is imposed unless stated.

Prerequisites:

- `DeformationAndDerivedPatchingAlgebra:R03.3/graded-hilbert-function`
- `DeformationAndDerivedPatchingAlgebra:R03.3/adic-quotient-length-step`
- `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-function`

Proof or construction:

1. Start at L_0=length(M/M)=0. Induct on n using adic-quotient-length-step and the finite-sum recursion.
2. Identify L_(n+1) with the existing H(q,M,n). Associativity and commutativity of extended-natural addition suffice even when a graded length is infinite.

Acceptance:

- For a field and q=0, only degree zero contributes, so the cumulative value is rank(M), not zero.
- For ℤ and q=0 the degree-zero ∞ survives every cumulative sum.

Sources:

- [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), §10.59 opening formulas, ideal-of-definition variant, and Proposition 10.59.5: “ideal of definition”. Use the actual graded quotient lengths and their cumulative sum; the graded and cumulative polynomials have different indexing.


### Finiteness of each graded quotient length

DeformationAndDerivedPatchingAlgebra:R03.3/finite-graded-piece-length — lemma; unchecked.

Proposed declaration: `TauCeti.HilbertSamuel.gradedFunction_ne_top`.

Under the local Noetherian finite-module hypotheses and radical(q)=m, φ(q,M,n)≠∞ for every n.

Hypotheses:

- A is a commutative Noetherian local ring with maximal ideal m, M is a finite A-module, and radical(q)=m.

Prerequisites:

- `DeformationAndDerivedPatchingAlgebra:R03.3/graded-hilbert-function`
- `DeformationAndDerivedPatchingAlgebra:R03.3/finite-adic-quotient-length`
- `mathlib:Submodule.powSMulQuotInclusion_injective`
- `mathlib:Module.length_le_of_injective`

Proof or construction:

1. The native inclusion j_n:G_n→M/q^(n+1)M is injective. Module.length_le_of_injective bounds φ(n) by H(n).
2. The existing finite-adic-quotient-length node proves H(n)≠∞. The order bound gives φ(n)≠∞. This argument does not require an associated-graded ring, Hilbert–Serre theorem, or polynomial-existence node.

Acceptance:

- The zero module is allowed.
- For ℤ with q=0 the local ideal-of-definition hypotheses fail; φ(0)=∞ is not coerced to zero.

Sources:

- [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), §10.59 opening formulas, ideal-of-definition variant, and Proposition 10.59.5: “ideal of definition”. Use the actual graded quotient lengths and their cumulative sum; the graded and cumulative polynomials have different indexing.
- [HS-CUMUL-PIN](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Quotient/PowTransition.lean), PowTransition.lean, powSMulQuotInclusion and factorPowSucc; Length.lean, length_eq_add_of_exact: “The canonical inclusion”. Native inclusion and quotient-transition maps give a genuine exact sequence; no splitting or associated-graded direct-sum carrier is assumed.


### Finite cumulative length conversion

DeformationAndDerivedPatchingAlgebra:R03.3/cumulative-natural-length — lemma; unchecked.

Proposed declaration: `TauCeti.HilbertSamuel.function_toNat_eq_sum_graded`.

If φ(q,M,i)≠∞ for every i, then H(q,M,n).toNat=Σ_{i=0}^n φ(q,M,i).toNat for every n. In particular this applies under the local Noetherian finite-module ideal-of-definition hypotheses, by finite-graded-piece-length.

Hypotheses:

- A is a commutative ring, M is an A-module, q is any ideal, and n is a natural number. No finiteness or local hypothesis is imposed unless stated.
- Every graded length is finite; the theorem also accepts this directly as a hypothesis outside the local regime.

Prerequisites:

- `DeformationAndDerivedPatchingAlgebra:R03.3/cumulative-graded-length`
- `mathlib:ENat.toNat_add`

Proof or construction:

1. Use cumulative-graded-length. Inductively each finite partial sum in ℕ∞ is finite.
2. Apply ENat.toNat_add only after proving both summands finite at that step. Iterate the identity; natural and rational cast sums are routine.

Acceptance:

- The excluded ℤ,q=0 example has an infinite degree-zero term, so toNat(∞)=0 is not a proof of this finite-length conversion.
- For a DVR with q=m^s, obtain H(n).toNat=(n+1)s.

Sources:

- [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), §10.59 opening formulas, ideal-of-definition variant, and Proposition 10.59.5: “ideal of definition”. Use the actual graded quotient lengths and their cumulative sum; the graded and cumulative polynomials have different indexing.


### Normalized rational summation polynomial

DeformationAndDerivedPatchingAlgebra:R03.3/summatory-polynomial — construction; unchecked.

Proposed declaration: `TauCeti.HilbertSamuel.summatoryPolynomial`.

For P∈ℚ[T], define S(P)=Σ_{j∈support(P)} (coeff_j(P)/(j+1))·(B_(j+1)(T+1)−B_(j+1)(0)), where B_j is the existing Mathlib Bernoulli polynomial. This normalization sums P(0),…,P(n), not P(1),…,P(n), and has S(P)(−1)=0.

Hypotheses:

- P is a rational polynomial. The positive denominator j+1 is inverted in ℚ, not in a general coefficient ring.

Prerequisites:

- `mathlib:Polynomial.bernoulli`
- `mathlib:Polynomial.bernoulli_eval_zero`
- `mathlib:Polynomial.bernoulli_comp_one_add_X`
- `mathlib:Polynomial.eq_of_infinite_eval_eq`

Proof or construction:

1. Use Polynomial.bernoulli, polynomial substitution, rational constants and a finite coefficient-support sum. No Bernoulli object or binomial-polynomial structure is newly planned.
2. The native bernoulli_eval_zero fixes the normalization. The native power-sum theorem and coefficient expansion supply the separately named evaluation lemma. The native bernoulli_comp_one_add_X verifies the forward difference.
3. For uniqueness among polynomials with the same forward difference and value at −1, compare evaluations recursively at 0,1,… and use the pinned infinite-evaluation equality theorem. This is an API characterization, not an assumption used to define S.

Acceptance:

- S(1)=T+1, S(T)=T(T+1)/2 and S(0)=0.
- S(P)(−1)=0 fixes the arbitrary constant before the actual filtration initial segment is restored.

API:

- `TauCeti.HilbertSamuel.summatoryPolynomial_eq` (characterisation): S(P) is the displayed finite sum of Bernoulli substitutions with coefficient_j(P)/(j+1).
- `TauCeti.HilbertSamuel.summatoryPolynomial_zero` (simp): S(0)=0.
- `TauCeti.HilbertSamuel.summatoryPolynomial_add` (functoriality): S(P+Q)=S(P)+S(Q) for rational polynomials P and Q.
- `TauCeti.HilbertSamuel.summatoryPolynomial_smul` (functoriality): For c∈ℚ and P∈ℚ[T], S(c·P)=c·S(P).
- `TauCeti.HilbertSamuel.summatoryPolynomial_C` (simp): For c∈ℚ, S(c)=c(T+1).
- `TauCeti.HilbertSamuel.summatoryPolynomial_eval_neg_one` (simp): S(P)(−1)=0 for every P.
- `TauCeti.HilbertSamuel.summatoryPolynomial_difference` (relation): S(P)(T+1)−S(P)(T)=P(T+1) as rational polynomials.
- `TauCeti.HilbertSamuel.summatoryPolynomial_unique` (characterisation): If R(−1)=0 and R(T+1)−R(T)=P(T+1), then R=S(P).

Unit tests:

- `HilbertSamuelSumTest.zero` (degenerate): S(0)=0, including evaluation at every natural number.
- `HilbertSamuelSumTest.one` (computation): S(1)=T+1 and S(1)(0)=1.
- `HilbertSamuelSumTest.linear` (computation): S(T)=T(T+1)/2; in particular S(T)(3)=6.
- `HilbertSamuelSumTest.normalization` (non-example): For P=1, the polynomial T has the same forward difference as S(P), but T(−1)=−1 and T(0)=0; it is not S(P).

Uses:

- Stacks Proposition 10.59.5 and Lemma 10.58.5: Convert eventual rational graded polynomiality into cumulative polynomiality while retaining the initial constant.
- Pinned sum_range_pow_eq_bernoulli_sub: Reuse the existing power-sum theorem for a finite coefficient expansion; do not re-plan Bernoulli arithmetic owned by other consumers.

Sources:

- [HS-SUM-PIN](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/BernoulliPolynomials.lean), BernoulliPolynomials.lean, bernoulli, bernoulli_eval_zero, sum_range_pow_eq_bernoulli_sub: “The Bernoulli polynomials are defined in terms of the negative Bernoulli numbers.”. The proposed rational summation adapter uses the pinned Bernoulli convention and the existing power-sum theorem, rather than planning Bernoulli polynomials again.
- [STACKS-ANTIDIFFERENCE](https://stacks.math.columbia.edu/tag/00JZ), Lemma 10.58.5, complete proof: “eventually constant”. Retain the constant contributed by the finite initial segment. The rational Bernoulli adapter supplies the polynomial summation needed here; this does not replace the general abelian-group-valued numerical-polynomial theory.


### Evaluation of the rational summation polynomial

DeformationAndDerivedPatchingAlgebra:R03.3/summatory-polynomial-evaluation — lemma; unchecked.

Proposed declaration: `TauCeti.HilbertSamuel.summatoryPolynomial_eval`.

For every P∈ℚ[T] and n≥0, S(P)(n)=Σ_{i=0}^n P(i) in ℚ.

Hypotheses:

- P is a rational polynomial and n a natural number.

Prerequisites:

- `DeformationAndDerivedPatchingAlgebra:R03.3/summatory-polynomial`
- `mathlib:Polynomial.as_sum_support_C_mul_X_pow`
- `mathlib:Polynomial.sum_range_pow_eq_bernoulli_sub`
- `mathlib:Polynomial.bernoulli_eval_zero`
- `mathlib:Polynomial.eval_comp`

Proof or construction:

1. Expand P as Σ_{j∈support(P)} coeff_j(P)T^j using Polynomial.as_sum_support_C_mul_X_pow, and evaluate the finite sum.
2. For each j apply Polynomial.sum_range_pow_eq_bernoulli_sub at n+1. Divide by the nonzero rational j+1 and identify the constant B_(j+1)(0) using bernoulli_eval_zero. Evaluate the substituted polynomial using eval_comp.
3. Interchange the two finite sums and factor the rational coefficients. Recombine the coefficient expansion at each i.

Acceptance:

- For P=1 the sum is n+1, including the i=0 term.
- For P=T and n=3 the value is 0+1+2+3=6.

Sources:

- [HS-SUM-PIN](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/BernoulliPolynomials.lean), BernoulliPolynomials.lean, bernoulli, bernoulli_eval_zero, sum_range_pow_eq_bernoulli_sub: “The Bernoulli polynomials are defined in terms of the negative Bernoulli numbers.”. The proposed rational summation adapter uses the pinned Bernoulli convention and the existing power-sum theorem, rather than planning Bernoulli polynomials again.


### Cumulative polynomial from a graded polynomial tail

DeformationAndDerivedPatchingAlgebra:R03.3/cumulative-polynomial-from-graded-tail — theorem; unchecked.

Proposed declaration: `TauCeti.HilbertSamuel.cumulativePolynomial_from_graded_tail`.

Assume every φ(q,M,i) is finite, and choose Q∈ℚ[T] and N≥0 such that Q(i)=φ(q,M,i).toNat for all i≥N. Set c_N=Σ_{i=0}^{N−1}(φ(q,M,i).toNat−Q(i)) in ℚ, with the sum empty when N=0. Then for every n≥N, (S(Q)+c_N)(n)=H(q,M,n).toNat. All subtractions in c_N take place after rational casts, never as truncated natural subtraction.

Hypotheses:

- A is a commutative ring, M is an A-module, q is any ideal, and n is a natural number. No finiteness or local hypothesis is imposed unless stated.
- All graded lengths are finite. Q is supplied with its eventual graded-value equality from N onwards; existence of such Q is not asserted by this theorem.

Prerequisites:

- `DeformationAndDerivedPatchingAlgebra:R03.3/graded-hilbert-function`
- `DeformationAndDerivedPatchingAlgebra:R03.3/cumulative-natural-length`
- `DeformationAndDerivedPatchingAlgebra:R03.3/summatory-polynomial-evaluation`

Proof or construction:

1. Use cumulative-natural-length and cast its sum to ℚ. Split the sum over 0,…,n into 0,…,N−1 and N,…,n.
2. On the latter interval replace φ(i).toNat by Q(i). The difference of the two full sums is exactly c_N, since n≥N. The finite-range splitting and regrouping are ordinary finite-sum algebra.
3. Apply summatory-polynomial-evaluation to the full sum of Q. Thus S(Q)+c_N has the required eventual cumulative evaluations. No assumption about gr_q(A), graded generation or Hilbert–Serre is hidden here.

Acceptance:

- If φ(0)=1, φ(1)=2 and φ(i)=1 for i≥2, take Q=1,N=2,c_N=1: the cumulative polynomial is T+2, not T+1. At n=0 its value 2 is not the actual cumulative length 1.
- For N=0 the correction is zero. For an eventually zero graded function the cumulative polynomial is a constant, not necessarily zero.
- For φ(0)=3 and φ(i)=1 for i≥1, Q=1,N=1 gives c_N=2 and the cumulative polynomial T+3.
- If φ(0)=1 and φ(i)=3 for i≥1, take Q=3,N=1,c_N=−2: the cumulative polynomial is 3T+1. Truncated natural subtraction would incorrectly set the correction to zero.

Sources:

- [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), §10.59 opening formulas, ideal-of-definition variant, and Proposition 10.59.5: “ideal of definition”. Use the actual graded quotient lengths and their cumulative sum; the graded and cumulative polynomials have different indexing.
- [STACKS-ANTIDIFFERENCE](https://stacks.math.columbia.edu/tag/00JZ), Lemma 10.58.5, complete proof: “eventually constant”. Retain the constant contributed by the finite initial segment. The rational Bernoulli adapter supplies the polynomial summation needed here; this does not replace the general abelian-group-valued numerical-polynomial theory.
- [HS-SUM-PIN](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/BernoulliPolynomials.lean), BernoulliPolynomials.lean, bernoulli, bernoulli_eval_zero, sum_range_pow_eq_bernoulli_sub: “The Bernoulli polynomials are defined in terms of the negative Bernoulli numbers.”. The proposed rational summation adapter uses the pinned Bernoulli convention and the existing power-sum theorem, rather than planning Bernoulli polynomials again.

### Current closure boundary and source receipts

The cumulative-existence node in Section 5b consumes finite graded lengths and the conditional graded-to-cumulative theorem. Its unchanged mathematical output still has open proof inputs: the associated-graded ring/module structure and graded numerical-polynomial induction. The two narrowed gap groups are:

- Associated-graded ring/module structure and graded finiteness: The native degree pieces, quotient scalar actions, transition maps, coefficient-length finiteness and cumulative identity are now accounted for by the new nodes and baselineCoverage. What remains is constructing the decreasing-adic direct-sum ring gr_q(A) and module gr_q(M), multiplication and action well-definedness, degree-zero identification, degree-one ring generation, Noetherianity and finite graded-module generation. Tau Ceti's increasing word-filtration AssociatedGraded is not a direct supplier. Inspect the pinned Rees algebra and graded-ring interfaces before adding carriers; neither a rational-series Hilbert polynomial nor the new summation adapter supplies this structure.

- Graded numerical-polynomial induction: The rational antidifference needed by the cumulative existence theorem is now supplied by summatory-polynomial and its evaluation lemma, with the finite initial constant restored by cumulative-polynomial-from-graded-tail. Remaining: decompose Stacks 10.58.7 into x-torsion stabilization, its nilpotent filtration, shifted degree-one multiplication exact sequences and induction on degree-one generators, with actual graded lengths. The new theorem assumes a graded polynomial tail; it does not prove one exists. No general abelian-group-valued numerical-polynomial API or K0 surrogate is claimed.

Fresh source inspection covers the pinned adic transition/inclusion file, the selected native quotient, length, torsion-action and finite-conversion statements, and the Bernoulli power-sum and polynomial-expansion statements listed in HS-CUMUL-PIN and HS-SUM-PIN. Stacks [00K4](https://stacks.math.columbia.edu/tag/00K4) and [00JZ](https://stacks.math.columbia.edu/tag/00JZ) were reread at the cited passages; downloaded HTML hashes are `e3d86d2fc7e6a9df48e73e4e8d12629cdb08f9e0fb9d15e35472d7bc21629932` and `9e111a9d48c6a3bb8ede444e6f7e92c4b4bd0ec28898427bea06b1da4e6dccf8`.

No fresh full rereading of all inherited deformation or P7 papers is claimed. Their sources, source issues, supplier requests and remaining stage targets are retained. The only inherited mathematical node refined is the cumulative-existence proof route. Forty-three inherited nodes are unchanged. The changed suggested file is not compiled: no existing pinned build was available, and no build, cache download or language server was started. Historical successful compilation receipts do not cover these forms.

## 11. Adic graded ring through the native Rees quotient — codex-J6LwjP

Partial continuation: preserve all 52 inherited nodes exactly and add nine R03.3 declarations comparing the native Rees quotient with the ordinary adic graded ring, its homogeneous pieces, multiplication, finite direct-sum expansion and degree-one generation. Reuse native Rees ring/module and finiteness APIs. All eight stages remain open; module/action comparison, Hilbert–Serre, dimension and the remaining source worklists are explicit gaps. Full Mathlib-only suggested file elaborates; every implementation remains unchecked.

Use Gr_q(A)=Rees(q)/(q Rees(q)), with the actual A/q scalar map. Rees ring/module and finiteness are pinned baseline inputs. The comparison to the ordinary graded ring is established by the named proof route below; mathematical proofs are unchecked. This is an ordinary adic specialization, not a second generic DD.1 filtered/Rees carrier.

### Adic graded ring from the native Rees quotient

Declaration: `TauCeti.HilbertSamuel.adicGradedRing` (`DeformationAndDerivedPatchingAlgebra:R03.3/adic-graded-ring`).

Define Gr_q(A)=Rees(q)/(q.map(algebraMap A Rees(q))), using the existing Rees subalgebra of A[T] and the existing ideal quotient. The coefficient map gives its actual A/q-algebra structure. This ring is identified with the direct sum of q^n/q^(n+1) by the separate comparison nodes, not assumed as a record property.

Hypotheses: A is an arbitrary commutative ring with identity, q is any ideal, and degrees are natural numbers. No local, Noetherian, domain or proper-ideal premise is imposed unless explicitly stated.

Proof route:

1. Use reesAlgebra q, whose coefficient-n condition is a_n∈q^n, and form the mapped coefficient ideal J=q Rees(q). Take the existing quotient ring Rees(q)/J; multiplication and ring laws are inherited.
2. Ideal.le_comap_map and algebraQuotientOfLEComap give the actual A/q scalar structure. For q=0 only constants remain in Rees(q); for q=A the quotient is the zero ring.
3. For a Noetherian A, use the existing Noetherian Rees instance and existing Noetherian quotient instance. This specialization introduces no new general Noetherian theorem.

Prerequisites: `mathlib:reesAlgebra`, `mathlib:Ideal.map`, `mathlib:Ideal.Quotient.algebraQuotientOfLEComap`, `mathlib:reesAlgebra.fg`, `mathlib:Ideal.Quotient.isNoetherianRing`.

Acceptance: Gr_0(A)≃A, whereas Gr_A(A)=0. For A=Z/4 and q=(2), the degree-one class of 2 is nonzero with square zero; the graded ring is not merely A/q.

API:

- `TauCeti.HilbertSamuel.adicGradedRing_zero` (compatibility): For q=0 the native Rees quotient is isomorphic to A as an A-algebra.
- `TauCeti.HilbertSamuel.adicGradedRing_top` (simp): For q=A the native Rees quotient is subsingleton.
- `TauCeti.HilbertSamuel.adicGradedRing_noetherian` (compatibility): For Noetherian A, the native quotient is Noetherian, by the existing Rees and ideal-quotient instances.

Typed tests:

- `HilbertSamuelAdicTest.field_zero_ideal` (computation): For a field k, Gr_0(k) is k as a k-algebra.
- `HilbertSamuelAdicTest.unit_ideal` (degenerate): For any A and q=A, Gr_q(A) is the zero ring.
- `HilbertSamuelAdicTest.dual_numbers_nonfield` (non-example): For A=Z/4 and q=(2), Gr_q(A) has a nonzero square-zero element, distinguishing it from A/q=F2.

### Coefficients of the Rees coefficient ideal

Declaration: `TauCeti.HilbertSamuel.mem_reesCoefficientIdeal_iff` (`DeformationAndDerivedPatchingAlgebra:R03.3/rees-coefficient-ideal`).

For p∈Rees(q), p∈q Rees(q) if and only if its coefficient in every degree n belongs to q^(n+1).

Hypotheses: A is an arbitrary commutative ring with identity, q is any ideal, and degrees are natural numbers. No local, Noetherian, domain or proper-ideal premise is imposed unless explicitly stated.

Proof route:

1. The mapped ideal is the span of constant images of elements of q. An ideal-span induction shows each product C(a)p has coefficient a·p_n∈q·q^n=q^(n+1); sums preserve the condition.
2. Conversely expand p into finitely many monomials. For p_n∈q^(n+1)=q·q^n, use smul_induction_on to express it as a finite sum of a·b with a∈q,b∈q^n. Each monomial is C(a) times the native degree-n Rees monomial bT^n. Sum the expressions over the finite polynomial support. This uses no finite generation of q.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-graded-ring`, `mathlib:Ideal.map`, `mathlib:Submodule.smul_induction_on`, `mathlib:Ideal.mul_mem_mul`, `mathlib:Polynomial.as_sum_support`, `mathlib:reesAlgebra.monomial_mem`.

Acceptance: Use q^(n+1), not q^n, in the denominator criterion. For q=(2) in Z/4, 2T lies in Rees(q) but not q Rees(q).

### Monomial map into the adic graded ring

Declaration: `TauCeti.HilbertSamuel.adicMonomial` (`DeformationAndDerivedPatchingAlgebra:R03.3/adic-monomial-map`).

For n≥0, define an A-linear map μ_n:q^n→Gr_q(A) sending a to the class of aT^n in the native Rees quotient.

Hypotheses: A is an arbitrary commutative ring with identity, q is any ideal, and degrees are natural numbers. No local, Noetherian, domain or proper-ideal premise is imposed unless explicitly stated.

Proof route:

1. Form the actual polynomial monomial with its reesAlgebra.monomial_mem proof. Compose with Ideal.Quotient.mk; the native definition specifies this function exactly.
2. Additivity and A-linearity follow from polynomial monomial linearity, the Rees subtype scalar action and quotient scalar action. The separately named kernel theorem is needed to descend through the native degree quotient.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-graded-ring`, `mathlib:reesAlgebra.monomial_mem`.

Acceptance: For q=0 and n=0 this is the coefficient algebra map. For q=(2)⊂Z/4, μ_1(2) survives; for q=A every monomial class vanishes.

API:

- `TauCeti.HilbertSamuel.adicMonomial_eq` (characterisation): μ_n(a) is exactly the native ideal-quotient class of the native Rees monomial aT^n.

Typed tests:

- `HilbertSamuelAdicTest.monomial_degree_zero` (compatibility): For q=0, μ_0(a) agrees with algebraMap A Gr_0(A).
- `HilbertSamuelAdicTest.monomial_two_survives` (computation): For q=(2) in Z/4, μ_1(2)≠0.
- `HilbertSamuelAdicTest.monomial_top_zero` (degenerate): For q=A and every n, μ_n(a)=0 for all a∈q^n.

### Kernel of the adic monomial map

Declaration: `TauCeti.HilbertSamuel.adicMonomial_ker` (`DeformationAndDerivedPatchingAlgebra:R03.3/adic-monomial-kernel`).

The kernel of μ_n:q^n→Gr_q(A) is q·top_{q^n}, the native submodule of the ideal subtype. Under the subtype inclusion its elements are exactly q^(n+1).

Hypotheses: A is an arbitrary commutative ring with identity, q is any ideal, and degrees are natural numbers. No local, Noetherian, domain or proper-ideal premise is imposed unless explicitly stated.

Proof route:

1. Use Ideal.Quotient.eq_zero_iff_mem and rees-coefficient-ideal for the single monomial: its only possibly nonzero coefficient is a in degree n.
2. Identify q·top_{q^n} with those a∈q^n lying in q·q^n=q^(n+1). In the forward direction induct on scalar sums; in the reverse direction lift each summand a·b, b∈q^n, to the actual ideal subtype and sum. No ambient quotient of the wrong type is used.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-monomial-map`, `DeformationAndDerivedPatchingAlgebra:R03.3/rees-coefficient-ideal`, `mathlib:Ideal.Quotient.eq_zero_iff_mem`, `mathlib:Submodule.smul_induction_on`.

Acceptance: At n=0 the kernel corresponds to q inside A. The degree-one denominator for q=(2)⊂Z/4 is zero.

### Native degree-piece inclusion

Declaration: `TauCeti.HilbertSamuel.adicPieceInclusion` (`DeformationAndDerivedPatchingAlgebra:R03.3/adic-piece-inclusion`).

Let G_n=(q^n)/(q·top_{q^n}), using the existing ideal subtype, quotient and A/q action. Descend μ_n to an injective A-linear map ι_n:G_n→Gr_q(A).

Hypotheses: A is an arbitrary commutative ring with identity, q is any ideal, and degrees are natural numbers. No local, Noetherian, domain or proper-ideal premise is imposed unless explicitly stated.

Proof route:

1. Use Submodule.liftQ with adic-monomial-kernel. The value on a quotient representative is exactly μ_n(a).
2. If the image is zero, kernel equality places the representative in the denominator, giving injectivity. The inherited graded-function quotient for M=A is canonically linearly equivalent after identifying q^n·top_A with q^n; that scalar-transport adapter is retained as a requirement in the gap, not claimed definitionally equal.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-monomial-kernel`, `mathlib:Submodule.liftQ`.

Acceptance: Do not use q^n as a denominator in the ambient A rather than as the quotient carrier. Positive-degree pieces for a zero ideal vanish; the degree-one Z/4 class survives; all unit-ideal pieces vanish.

API:

- `TauCeti.HilbertSamuel.adicPieceInclusion_mk` (compatibility): ι_n([a])=μ_n(a) on native quotient representatives.
- `TauCeti.HilbertSamuel.adicPieceInclusion_injective` (characterisation): The native piece inclusion is injective for every q and n.

Typed tests:

- `HilbertSamuelAdicTest.piece_field_higher_zero` (computation): For a field k and q=0, every G_(n+1) is zero.
- `HilbertSamuelAdicTest.piece_two_injective` (non-example): For q=(2) in Z/4 the degree-one map is injective and takes [2] to a nonzero element.
- `HilbertSamuelAdicTest.piece_unit_zero` (degenerate): For q=A every native degree piece is zero.

### Multiplication of homogeneous adic classes

Declaration: `TauCeti.HilbertSamuel.adicMonomial_mul` (`DeformationAndDerivedPatchingAlgebra:R03.3/adic-homogeneous-product`).

For a∈q^n and b∈q^m, μ_n(a)μ_m(b)=μ_(n+m)(ab), with ab∈q^(n+m). This fixes the multiplicative grading on the quotient ring.

Hypotheses: A is an arbitrary commutative ring with identity, q is any ideal, and degrees are natural numbers. No local, Noetherian, domain or proper-ideal premise is imposed unless explicitly stated.

Proof route:

1. Use Ideal.mul_mem_mul and pow_add for the degree n+m membership proof. Apply the native Polynomial.monomial_mul_monomial identity in Rees(q), then map it through Ideal.Quotient.mk.
2. Changing either representative by its q^(degree+1) denominator changes the product by q^(n+m+1); kernel equality therefore descends the formula to pieces. Under the direct-sum equivalence the transported ring multiplication has degree addition.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-monomial-map`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-monomial-kernel`, `mathlib:Polynomial.monomial_mul_monomial`, `mathlib:Ideal.mul_mem_mul`.

Acceptance: The exponent is n+m, never max(n,m). For Z/4,q=(2), μ_1(2)^2=0 although μ_1(2)≠0.

### Bijectivity of finite homogeneous expansion

Declaration: `TauCeti.HilbertSamuel.adicExpansion_bijective` (`DeformationAndDerivedPatchingAlgebra:R03.3/adic-expansion-bijective`).

The existing direct-sum linear map Σ_nι_n:⊕_(n≥0)G_n→Gr_q(A) is bijective. Only finitely supported sums occur.

Hypotheses: A is an arbitrary commutative ring with identity, q is any ideal, and degrees are natural numbers. No local, Noetherian, domain or proper-ideal premise is imposed unless explicitly stated.

Proof route:

1. Build adicExpansion by DirectSum.toModule applied to ι_n. Surjectivity: choose a Rees polynomial representing the quotient class and expand its finitely many coefficients by Polynomial.as_sum_support.
2. Injectivity: represent the finitely many nonzero direct-sum coordinates by coefficients a_n∈q^n. If their monomial sum lies in q Rees(q), the coefficient criterion gives each a_n∈q^(n+1); the kernel theorem then kills every quotient coordinate. Choices are finite and only prove the comparison, not a new ring carrier.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-piece-inclusion`, `DeformationAndDerivedPatchingAlgebra:R03.3/rees-coefficient-ideal`, `mathlib:DirectSum.toModule`, `mathlib:DirectSum.toModule_lof`, `mathlib:Polynomial.as_sum_support`.

Acceptance: The direct sum must not be replaced by a product permitting infinitely many coefficients. The unit ideal gives zero on both sides, so bijectivity requires no nontrivial-ring hypothesis.

### Direct-sum comparison for the adic graded ring

Declaration: `TauCeti.HilbertSamuel.adicDirectSumEquiv` (`DeformationAndDerivedPatchingAlgebra:R03.3/adic-graded-direct-sum`).

Define the A-linear equivalence E:⊕_nG_n≃Gr_q(A) from the actual expansion map and its bijectivity. It sends the n-th homogeneous inclusion to ι_n. Transporting ring multiplication through E yields the ordinary adic graded ring of Stacks 10.59.5, with the product law fixed by adic-homogeneous-product.

Hypotheses: A is an arbitrary commutative ring with identity, q is any ideal, and degrees are natural numbers. No local, Noetherian, domain or proper-ideal premise is imposed unless explicitly stated.

Proof route:

1. Use LinearEquiv.ofBijective on adicExpansion. The comparison is with the already defined Rees quotient, so it does not create a second independent associated-graded carrier.
2. Use DirectSum.toModule_lof for the homogeneous generator law. Transport the native quotient ring structure along E; adic-homogeneous-product gives degree n+m multiplication. The generic DirectSum/graded carrier and generic filtered/Rees theory are imported rather than newly designed.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-expansion-bijective`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-homogeneous-product`, `mathlib:LinearEquiv.ofBijective`, `mathlib:DirectSum.toModule_lof`.

Acceptance: Retain only finite support in the ordinary direct sum. The equivalence fixes the representative formula, not merely equality of dimensions or cardinalities.

API:

- `TauCeti.HilbertSamuel.adicDirectSumEquiv_lof` (compatibility): E(lofn(x))=ι_n(x) for each native homogeneous quotient class.
- `TauCeti.HilbertSamuel.adicDirectSumEquiv_coe` (characterisation): The underlying linear map of E is exactly the finite homogeneous expansion map.

Typed tests:

- `HilbertSamuelAdicTest.expansion_degree_zero` (compatibility): For q=0, E sends the degree-zero inclusion to ι_0.
- `HilbertSamuelAdicTest.expansion_nilpotent_degree` (non-example): For Z/4,q=(2), some degree-one direct-sum element maps to a nonzero graded-ring element.
- `HilbertSamuelAdicTest.expansion_unit_zero` (degenerate): For q=A the whole ordinary direct sum is zero.

### Degree-one generation of the adic graded ring

Declaration: `TauCeti.HilbertSamuel.adicGradedRing_generated_degree_one` (`DeformationAndDerivedPatchingAlgebra:R03.3/adic-degree-one-generation`).

Gr_q(A), as an A/q-algebra, is generated by the degree-one classes μ_1(a), a∈q, for every ideal q. No finite-generation assumption is made.

Hypotheses: A is an arbitrary commutative ring with identity, q is any ideal, and degrees are natural numbers. No local, Noetherian, domain or proper-ideal premise is imposed unless explicitly stated.

Proof route:

1. The existing adjoin_monomial_eq_reesAlgebra states that the native Rees algebra is generated over A by degree-one monomials. Map this equality through the surjective ideal-quotient map.
2. Each coefficient in A maps through the actual A/q algebra map. Thus a finite algebra expression in native degree-one monomials descends to an expression over A/q in μ_1(q), proving Algebra.adjoin(A/q,range μ_1)=top. This is generation by the whole degree-one set; a finite generating list requires q.FG.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-monomial-map`, `mathlib:adjoin_monomial_eq_reesAlgebra`, `mathlib:Ideal.Quotient.algebraQuotientOfLEComap`.

Acceptance: For q=0 the generator set is zero and the coefficient algebra already supplies everything. A Noetherian q has a finite generating list; do not preassume this for arbitrary rings.

### Remaining comparison and source boundary

The nine new ring nodes give an explicit Rees-quotient comparison, homogeneous law, direct-sum expansion and degree-one generation plan; their implementation proofs remain unchecked. Native Rees algebra, Noetherianity and Ideal.Filtration Rees-module carriers/generation/finiteness are already baseline. Remaining: form the native quotient of the stable adic Rees module by q, prove its coefficient denominator, identify each degree with the inherited G_n for arbitrary M, construct the action of this same quotient ring and its A/q scalar towers, carry native degree-zero generation/finiteness to the quotient, and supply the graded-ring/module interfaces required by Hilbert–Serre. For M=A compare q^n·top_A with the ideal subtype q^n explicitly. Do not construct another generic Rees or filtered/stable-category carrier, or claim the increasing Tau Ceti word filtration supplies the decreasing adic object.

Fresh source reading: complete mathematical statements/proofs of [Stacks 00K4](https://stacks.math.columbia.edu/tag/00K4), and complete Definition 10.70.1 in [052P](https://stacks.math.columbia.edu/tag/052P). The Rees quotient and coefficient proofs are explicit derivations; the source is not attributed a verbatim theorem it does not state here. Pinned ReesAlgebra was read in full and Filtration at the packet’s recorded passages. Earlier paper-version and errata receipts remain historical. No new source issue, external dependency or ownership transfer is claimed.

The full current Mathlib-only suggested file compiled with zero errors and only admitted-proof warnings; final receipts are in the handoff. All eight stages, every routed-source obligation and both supplier requests remain open.

Additional specialized API laws, with native signatures:

- `TauCeti.HilbertSamuel.adicMonomial_add` (relation): μ_n(a+b)=μ_n(a)+μ_n(b) for elements of q^n.
- `TauCeti.HilbertSamuel.adicMonomial_smul` (compatibility): μ_n(c·a)=c·μ_n(a) for every c∈A and a∈q^n.
- `TauCeti.HilbertSamuel.adicPieceInclusion_zero` (simp): The native degree-piece inclusion sends zero to zero.
- `TauCeti.HilbertSamuel.adicDirectSumEquiv_symm_inclusion` (compatibility): E⁻¹(ι_n(x))=lofn(x), fixing the inverse comparison on every homogeneous piece.

## 12. The ordinary associated graded module — codex-5ebb6f
This continuation starts from the merged 61-node checkpoint. Its purpose is the module displayed in the complete proof of Stacks Proposition 10.59.5. The ring in Section 11 is already fixed: Rq is the native Rees subalgebra of A[T], J is the extension of q to Rq, and Gr_q(A)=Rq/J. For an arbitrary A-module M, the native stable adic filtration has F_n=q^nM. Its existing polynomial Rees-module subtype consists of finite polynomials whose degree-n coefficient lies in F_n. The new quotient is by J acting on that actual subtype.

These are ordinary module quotients and finite direct sums. There is no completeness, locality, Noetherianity or freeness premise on the carrier comparisons. In particular, a finite module over A need not be free. Finite generation of the whole associated graded module will follow for any ideal q if M is finite; finiteness of each adic piece over A is a separate assertion with stronger hypotheses. The graded numerical-polynomial induction and the dimension comparison remain required work.

Native quotient scalar descent is existing mathematics. The suggested file explicitly selects its scalar ring on the Rees subtype and exposes the same native module action. It does not create another generic Rees carrier. Generic derived filtered/Rees constructions remain owned by DerivedDeRhamCohomology DD.1. The pinned Tau Ceti word-filtration associated graded is increasing and indexed by products of words, so it cannot be substituted for this decreasing adic module.

### The ordinary adic graded module as a native quotient
`DeformationAndDerivedPatchingAlgebra:R03.3/adic-graded-module` — `TauCeti.HilbertSamuel.adicGradedModule`. Let Rq be the existing Rees algebra, J=q.map(A→Rq), and Rq(M) the subtype of the native polynomial module attached to stableFiltration(q,top_M). Define Gr_q(M)=Rq(M)/(J·top_Rq(M)), using native submodule quotients. Reuse the native module action by Gr_q(A)=Rq/J. Restriction along A/q→Gr_q(A) gives its residue-ring action; both scalar towers agree with the inherited A-action.

A is any commutative ring with identity, q is any ideal, M is any A-module, and degrees are natural numbers. No locality, Noetherianity, proper-ideal, domain or freeness premise unless explicitly added.

Proof outline: Use the existing Filtration.submodule for the stable adic filtration. Its scalar ring is exactly the existing Rees algebra; the denominator is a submodule of this subtype, not of the ambient polynomial module. Reuse Module.isTorsionBySet_quotient_ideal_smul and its quotient-ring module instance for J. Restrict this actual Gr_q(A)-action along the coefficient algebra map using Module.compHom. On quotient representatives the action is [r]·[f]=[r·f]. Quotient induction and the native polynomial scalar tower prove the A/q and A scalar compatibilities; the ideal-map coefficient relation makes different coefficient representatives agree.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-graded-ring`, `mathlib:Ideal.stableFiltration`, `mathlib:Ideal.Filtration.submodule`, `mathlib:Module.isTorsionBySet_quotient_ideal_smul`, `mathlib:Module.Quotient.mk_smul_mk`, `mathlib:Module.compHom`, `mathlib:Submodule.hasQuotient`.

API:

- `TauCeti.HilbertSamuel.adicGradedModule_mk_smul` (compatibility): [r]·[f]=[r·f] for native Rees representatives.
- `TauCeti.HilbertSamuel.adicGradedModule_residue_smul` (compatibility): [a]·x=a·x for a∈A under the actual A/q action.
- `TauCeti.HilbertSamuel.adicGradedModule_top` (example): Gr_top(M) is zero for every M.
- `TauCeti.HilbertSamuel.adicGradedModule_residueTower` (instance): The A/q→Gr_q(A) scalar tower acts on this same quotient.
- `TauCeti.HilbertSamuel.adicGradedModule_baseTower` (instance): The inherited A-action agrees with restriction of the A/q-action.

Uses: R03.3/eventual-hilbert-samuel-polynomial; Stacks 10.59.5 — Supply the actual associated graded module, its degree pieces, scalar action and finite generation for the still missing graded Hilbert–Serre induction. R03.3/graded-hilbert-function and finite-graded-piece-length — Identify the same native quotient carrier whose length defines the graded function. No alternative filtration or presumed Hilbert polynomial is introduced.

Tests:

- `HilbertSamuelAdicModuleTest.zero_ideal_module` (compatibility): For q=0, Gr_q(M) is A-linearly equivalent to M.
- `HilbertSamuelAdicModuleTest.unit_ideal_module` (degenerate): For q=A, Gr_q(M) is zero.
- `HilbertSamuelAdicModuleTest.residue_module_degree_one_action` (non-example): For A=Z/4,q=(2),M=A/q, the nonzero graded-ring class μ_1(2) annihilates every graded-module element. Thus the graded module is not silently replaced by the graded ring.

Acceptance: q=top gives the zero module. For q=(2) in Z/4 the residue module M=A/q has only degree zero although the graded ring has a nonzero degree-one class.

### The coefficient denominator in the adic Rees module
`DeformationAndDerivedPatchingAlgebra:R03.3/rees-module-coefficient-denominator` — `TauCeti.HilbertSamuel.mem_adicModuleDenominator_iff`. For f∈Rq(M), membership in J·top_Rq(M) is equivalent to coeff_n(f)∈q^(n+1)M for every n.

A is any commutative ring with identity, q is any ideal, M is any A-module, and degrees are natural numbers. No locality, Noetherianity, proper-ideal, domain or freeness premise unless explicitly added.

Proof outline: For a generator r·g with r∈J, use rees-coefficient-ideal and PolynomialModule.smul_apply: each convolution summand has coefficient in q^(i+1)·q^jM=q^(i+j+1)M. Additive/ideal-action induction gives the forward implication. For the reverse implication expand f as its finite sum of native single_n(coeff_n f). Since q^(n+1)M=q·(q^nM), express each coefficient as a finite sum a·m with a∈q and m∈q^nM using submodule scalar induction. The corresponding polynomial single_n(a·m) equals the constant Rees coefficient a acting on single_n(m), so belongs to J·top. Sum over the finite coefficient support. No finite generating list for q or M is assumed.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-graded-module`, `DeformationAndDerivedPatchingAlgebra:R03.3/rees-coefficient-ideal`, `mathlib:PolynomialModule.smul_apply`, `mathlib:PolynomialModule.monomial_smul_single`, `mathlib:Submodule.smul_induction_on`, `mathlib:PolynomialModule.coeffLinearEquiv`.

Acceptance: The exponent is n+1, not n. For a residue module annihilated by q all positive-degree carriers vanish.

### Homogeneous classes of actual adic module elements
`DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-monomial-map` — `TauCeti.HilbertSamuel.adicModuleMonomial`. Define ν_n:q^nM→Gr_q(M), A-linear, by m↦[single_n(m)] using the native subtype q^n·top_M and the actual Rees-module quotient.

A is any commutative ring with identity, q is any ideal, M is any A-module, and degrees are natural numbers. No locality, Noetherianity, proper-ideal, domain or freeness premise unless explicitly added.

Proof outline: The polynomial single has its coefficient in degree n equal to m and every other coefficient zero. Native Filtration.mem_submodule proves that it lies in Rq(M). Compose this native single map with the quotient map. Native PolynomialModule.lsingle and the quotient map give additivity and A-linearity.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-graded-module`, `mathlib:PolynomialModule.lsingle`, `mathlib:Ideal.Filtration.mem_submodule`.

API:

- `TauCeti.HilbertSamuel.adicModuleMonomial_eq` (characterisation): ν_n(m) is exactly the native quotient class of single_n(m), with its native filtration membership proof.
- `TauCeti.HilbertSamuel.adicModuleMonomial_add` (relation): ν_n(m+m′)=ν_n(m)+ν_n(m′).
- `TauCeti.HilbertSamuel.adicModuleMonomial_smul` (compatibility): ν_n(a·m)=a·ν_n(m) for every a∈A.

Uses: R03.3/eventual-hilbert-samuel-polynomial; Stacks 10.59.5 — Supply the actual associated graded module, its degree pieces, scalar action and finite generation for the still missing graded Hilbert–Serre induction. R03.3/graded-hilbert-function and finite-graded-piece-length — Identify the same native quotient carrier whose length defines the graded function. No alternative filtration or presumed Hilbert polynomial is introduced.

Tests:

- `HilbertSamuelAdicModuleTest.monomial_zero_degree_injective` (compatibility): For q=0, ν_0 is injective.
- `HilbertSamuelAdicModuleTest.monomial_regular_two_survives` (computation): For A=M=Z/4,q=(2), some degree-one element has nonzero ν_1.
- `HilbertSamuelAdicModuleTest.monomial_residue_degree_one_zero` (non-example): For A=Z/4,q=(2),M=A/q, every ν_1 is zero.

Acceptance: Degree zero for q=0 gives an injective copy of M. For M=A=Z/4 and q=(2), ν_1(2) survives; for M=A/q every degree-one class is zero.

### Kernel of a homogeneous adic module map
`DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-monomial-kernel` — `TauCeti.HilbertSamuel.adicModuleMonomial_ker`. The kernel of ν_n on the subtype F_n=q^nM is exactly q·top_F_n. Its image under F_n→M is q^(n+1)M.

A is any commutative ring with identity, q is any ideal, M is any A-module, and degrees are natural numbers. No locality, Noetherianity, proper-ideal, domain or freeness premise unless explicitly added.

Proof outline: A native quotient class is zero exactly when its representative belongs to its denominator. Apply the coefficient-denominator criterion to single_n(m). Submodule.mem_smul_top_iff identifies membership in q·top_F_n with membership of the underlying element in q·F_n; associativity of ideal action identifies this with q^(n+1)M.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-monomial-map`, `DeformationAndDerivedPatchingAlgebra:R03.3/rees-module-coefficient-denominator`, `mathlib:Submodule.Quotient.mk_eq_zero`, `mathlib:Submodule.mem_smul_top_iff`.

Acceptance: At degree zero the kernel is qM. No quotient of M by an incorrectly typed subtype denominator is formed.

### Inclusion of the native graded length piece
`DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-piece-inclusion` — `TauCeti.HilbertSamuel.adicModulePieceInclusion`. For the inherited G_n=F_n/(q·top_F_n), descend ν_n to an injective A-linear map ι^M_n:G_n→Gr_q(M). It also respects the native A/q-actions. This G_n is exactly the carrier in graded-hilbert-function.

A is any commutative ring with identity, q is any ideal, M is any A-module, and degrees are natural numbers. No locality, Noetherianity, proper-ideal, domain or freeness premise unless explicitly added.

Proof outline: Use Submodule.liftQ with the equality adic-module-monomial-kernel. Its formula on quotient representatives is ν_n. The same kernel equality proves injectivity. For residue-ring linearity lift the scalar from A/q to A and use the quotient scalar formula together with ν_n A-linearity.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-monomial-kernel`, `DeformationAndDerivedPatchingAlgebra:R03.3/graded-hilbert-function`, `mathlib:Submodule.liftQ`, `mathlib:Module.Quotient.mk_smul_mk`.

API:

- `TauCeti.HilbertSamuel.adicModulePieceInclusion_mk` (compatibility): ι^M_n([m])=ν_n(m).
- `TauCeti.HilbertSamuel.adicModulePieceInclusion_injective` (characterisation): ι^M_n is injective for every n.
- `TauCeti.HilbertSamuel.adicModulePieceInclusion_residue_smul` (compatibility): ι^M_n(c·x)=c·ι^M_n(x) for every c∈A/q.

Uses: R03.3/eventual-hilbert-samuel-polynomial; Stacks 10.59.5 — Supply the actual associated graded module, its degree pieces, scalar action and finite generation for the still missing graded Hilbert–Serre induction. R03.3/graded-hilbert-function and finite-graded-piece-length — Identify the same native quotient carrier whose length defines the graded function. No alternative filtration or presumed Hilbert polynomial is introduced.

Tests:

- `HilbertSamuelAdicModuleTest.piece_length_same_carrier` (compatibility): gradedFunction(q,M,n) is the length of the very same native adicModulePiece(q,M,n).
- `HilbertSamuelAdicModuleTest.piece_regular_two_injective` (computation): For A=M=Z/4,q=(2), the degree-one inclusion is injective and has a nonzero value.
- `HilbertSamuelAdicModuleTest.piece_residue_higher_zero` (non-example): For A=Z/4,q=(2),M=A/q, every positive-degree native piece is zero.

Acceptance: The length of this carrier is the already defined gradedFunction. The ring/module distinction persists on the actual degree-one quotient.

### The same graded ring acts in the sum of degrees
`DeformationAndDerivedPatchingAlgebra:R03.3/adic-homogeneous-module-action` — `TauCeti.HilbertSamuel.adicModuleMonomial_smul_monomial`. For a∈q^r and m∈q^nM, a·m∈q^(r+n)M and μ_r(a)·ν_n(m)=ν_(r+n)(a·m). The action is the native action of the already defined Gr_q(A), not an independently chosen action on a direct sum.

A is any commutative ring with identity, q is any ideal, M is any A-module, and degrees are natural numbers. No locality, Noetherianity, proper-ideal, domain or freeness premise unless explicitly added.

Proof outline: Use the product of ideal powers and associativity of their action to place a·m in q^(r+n)M. Use the native PolynomialModule.monomial_smul_single at degrees r,n, then Module.Quotient.mk_smul_mk. Both sides use exactly the existing ring quotient and new module quotient.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-monomial-map`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-monomial-map`, `mathlib:PolynomialModule.monomial_smul_single`, `mathlib:Module.Quotient.mk_smul_mk`.

Acceptance: Degree index is r+n. The nonzero degree-one Z/4 ring class acts by zero on Gr_q(A/q), even though it acts nontrivially on degree zero of Gr_q(A).

### Bijective finite homogeneous expansion of the adic module
`DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-expansion-bijective` — `TauCeti.HilbertSamuel.adicModuleExpansion_bijective`. The native A-linear direct-sum expansion Σ_nι^M_n:⊕_nG_n→Gr_q(M) is bijective.

A is any commutative ring with identity, q is any ideal, M is any A-module, and degrees are natural numbers. No locality, Noetherianity, proper-ideal, domain or freeness premise unless explicitly added.

Proof outline: Surjectivity: lift a quotient class to f∈Rq(M), expand its finite coefficient support, and project each single_n(coeff_n f) through ι^M_n. Injectivity: choose representatives for the finitely many nonzero degree classes. If their expansion is zero, its finite polynomial sum belongs to J·top. The coefficient-denominator criterion and monomial kernel theorem put every degree representative in its own denominator, so every coordinate is zero. No infinite product or convergence assertion is used.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-piece-inclusion`, `DeformationAndDerivedPatchingAlgebra:R03.3/rees-module-coefficient-denominator`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-monomial-kernel`, `mathlib:DirectSum.toModule`, `mathlib:PolynomialModule.coeffLinearEquiv`.

Acceptance: Only finite support is involved. For q=A both sides vanish.

### Native direct-sum comparison for the adic module
`DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-direct-sum` — `TauCeti.HilbertSamuel.adicModuleDirectSumEquiv`. Define E_M:⊕_nG_n≃_A Gr_q(M) from the actual expansion map and its proved bijectivity. Transport the actual Gr_q(A)-module action across this equivalence. Its homogeneous action is fixed by adic-homogeneous-module-action, and its residue action by the native piece inclusions.

A is any commutative ring with identity, q is any ideal, M is any A-module, and degrees are natural numbers. No locality, Noetherianity, proper-ideal, domain or freeness premise unless explicitly added.

Proof outline: Apply LinearEquiv.ofBijective to the existing DirectSum.toModule expansion map. This specifies the forward comparison exactly. The native lof evaluation and inverse identities give the three API formulas. Transport of the existing module structure preserves the homogeneous law by the separately listed action lemma; it does not assume a graded polynomial tail.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-expansion-bijective`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-homogeneous-module-action`, `mathlib:LinearEquiv.ofBijective`, `mathlib:DirectSum.toModule_lof`.

API:

- `TauCeti.HilbertSamuel.adicModuleDirectSumEquiv_lof` (compatibility): E_M(lofn(x))=ι^M_n(x).
- `TauCeti.HilbertSamuel.adicModuleDirectSumEquiv_coe` (characterisation): The underlying linear map is exactly the finite expansion map.
- `TauCeti.HilbertSamuel.adicModuleDirectSumEquiv_symm_inclusion` (compatibility): E_M inverse sends ι^M_n(x) back to lofn(x).

Uses: R03.3/eventual-hilbert-samuel-polynomial; Stacks 10.59.5 — Supply the actual associated graded module, its degree pieces, scalar action and finite generation for the still missing graded Hilbert–Serre induction. R03.3/graded-hilbert-function and finite-graded-piece-length — Identify the same native quotient carrier whose length defines the graded function. No alternative filtration or presumed Hilbert polynomial is introduced.

Tests:

- `HilbertSamuelAdicModuleTest.expansion_zero_degree` (compatibility): For q=0, the direct-sum degree-zero inclusion has exactly the native piece-inclusion image.
- `HilbertSamuelAdicModuleTest.expansion_regular_degree_one` (computation): For A=M=Z/4,q=(2), a degree-one direct-sum element has nonzero image.
- `HilbertSamuelAdicModuleTest.expansion_residue_higher_zero` (non-example): For A=Z/4,q=(2),M=A/q, each positive-degree direct-sum inclusion maps to zero.

Acceptance: The degree-zero comparison for q=0 recovers M. M=A/q can have fewer nonzero pieces than the ring.

### Degree-zero generation descends to the graded module
`DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-degree-zero-generation` — `TauCeti.HilbertSamuel.adicGradedModule_generated_degree_zero`. For any A,q,M, the Gr_q(A)-submodule spanned by the range of ν_0 is all of Gr_q(M). No finiteness premise is required.

A is any commutative ring with identity, q is any ideal, M is any A-module, and degrees are natural numbers. No locality, Noetherianity, proper-ideal, domain or freeness premise unless explicitly added.

Proof outline: Apply the native Filtration.submodule_eq_span_le_iff_stable_ge with n₀=0 to the stable adic filtration. Its stability holds in every degree by q·q^nM=q^(n+1)M. F_0=top_M. This existing theorem generates Rq(M) by native degree-zero singles. Project a finite spanning expression through the actual quotient map. Its coefficients descend from Rq to Rq/J and each degree-zero generator maps to ν_0. Surjectivity gives the stated top-submodule equality.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-monomial-map`, `mathlib:Ideal.Filtration.submodule_eq_span_le_iff_stable_ge`, `mathlib:Ideal.stableFiltration_stable`, `mathlib:Module.Quotient.mk_smul_mk`.

Acceptance: Zero and unit ideals are included. Generation uses the degree-zero module, not the ring degree-one generating set.

### Finite generation of the adic graded module
`DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-finite` — `TauCeti.HilbertSamuel.adicGradedModule_finite`. If M is finite over A, then Gr_q(M) is finite as a module over Gr_q(A), for any q. A need not be Noetherian and q need not be finitely generated.

A is any commutative ring with identity, q is any ideal, M is any A-module, and degrees are natural numbers. No locality, Noetherianity, proper-ideal, domain or freeness premise unless explicitly added.

Proof outline: Choose a finite A-spanning set of M from Module.Finite. Since F_0=top_M, A-linearity of ν_0 shows that its full range is in the Gr_q(A)-span of the images of this finite set. Use adic-module-degree-zero-generation to identify that finite span with top. This proves finite generation over Gr_q(A). No claim that each F_n is finite over A is needed; that stronger component finiteness requires separate hypotheses.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-degree-zero-generation`, `mathlib:Module.Finite`, `mathlib:Module.Finite.exists_fin`, `mathlib:Submodule.FG.map`.

Acceptance: This statement does not need the Noetherian component assumption of the existing general filtration FG criterion. A residue module over Z/4 provides a finite nonfree example.

### The regular-module specialization is the same graded ring
`DeformationAndDerivedPatchingAlgebra:R03.3/adic-regular-module-comparison` — `TauCeti.HilbertSamuel.adicRegularModuleComparison`. For M=A there exists a Gr_q(A)-linear equivalence Gr_q(A as module)≃Gr_q(A as ring). It sends ν_n(m) to μ_n(m) under the explicit identification q^n·top_A=q^n, so it is compatible with every homogeneous piece.

A is any commutative ring with identity, q is any ideal, M is any A-module, and degrees are natural numbers. No locality, Noetherianity, proper-ideal, domain or freeness premise unless explicitly added.

Proof outline: The native PolynomialModule.equivPolynomialSelf identifies the polynomial module on A with A[T]. The equality q^n·top_A=q^n follows from Ideal.smul_eq_mul and Ideal.mul_top. Restrict this native polynomial equivalence to the actual Rees-module and Rees-ring subtypes. This Rees-linear equivalence sends J·top to the ideal J: multiply by 1 for the reverse inclusion, and ideal closure for the forward one. Use Submodule.Quotient.equiv, and the native quotient scalar formula to upgrade the descended equivalence to Rq/J-linearity. Its single-to-monomial formula gives the degree compatibility.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-monomial-map`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-monomial-map`, `mathlib:PolynomialModule.equivPolynomialSelf`, `mathlib:Ideal.smul_eq_mul`, `mathlib:Ideal.mul_top`, `mathlib:Submodule.Quotient.equiv`, `mathlib:Module.Quotient.mk_smul_mk`.

Acceptance: For Z/4,q=(2), both regular-module and ring degree-one classes survive. This comparison is restricted to M=A; it fails for M=A/q when the ring degree-one piece is nonzero.

### Source, ownership and validation receipts

Fresh reading covers the entire mathematical statements and proofs of Stacks 00K4, and the complete Definition 10.70.1 in 052P. The module quotient comparison is worked out from the actual displayed graded module and native pinned interfaces; it is not a quoted theorem from the blowup section. The downloaded HTML versions have the same SHA-256 hashes as the inherited receipts: 00K4 e3d86d2fc7e6a9df48e73e4e8d12629cdb08f9e0fb9d15e35472d7bc21629932; 052P 709ee80c7830e0c429fee54d1df78efaabbd6c6ef4dbdc00220f5a77c80d83bd. The seventeen added baseline declarations have individual pinned source hashes and precise statement receipts in the packet. HS-MODULE-PIN records the actual declaration passages read.

The eight AUDIT-17 entries, accepted RS-08 narrowing decisions and 53 touching RS-08 links, campaign and atlas stage descriptions, key-definition brief, integrated depth/Auslander–Buchsbaum supplier and ModularCurves coefficient-category overlap were screened. The external EXT-01 decomposition is a lead, not an independently accepted replacement. This worker already read complete JacobianChallenge and StableReduction upstream documents earlier in the continuous session. No new full reading of all inherited papers, closure of their routed statements, independent review or exhaustive library-absence claim is made.

Finite regression computation enumerates actual rings and cyclic quotient modules, adic coefficient sets, truncated Rees polynomials, their ideal/submodule products and quotient classes. It checks the coefficient denominator independently against J·Rq(M), compares quotient cardinalities with the direct sum of degree-piece quotients, verifies scalar descent and associativity, checks the sum-of-degrees action and closes the actual degree-zero generators under the ring action. Bounds are degree three except zero and unit ideals over Z/4, which use degree two. The 12,344 assertions pass in nine cases. The script SHA-256 is ca94bc5b602afc382de4a70fa0b7c9b7d66471262b8f14a580a1f57fdbb2f495. These finite regressions do not prove the unrestricted declarations.

| A; q; M | Cardinalities of G_0,G_1,G_2,G_3 | Gr_q(M) | Gr_q(A) |
| --- | --- | --- | --- |
| Z/4; (2); A | 2,2,1,1 | 4 | 4 |
| Z/4; (2); A/(2) | 2,1,1,1 | 2 | 4 |
| Z/8; (2); A | 2,2,2,1 | 8 | 8 |
| Z/8; (2); A/(2) | 2,1,1,1 | 2 | 8 |
| Z/4; 0; A | 4,1,1 (degree ≤2) | 4 | 4 |
| Z/4; A; A | 1,1,1 (degree ≤2) | 1 | 1 |
| F2[x,y]/(x,y)^2; (x,y); A | 2,4,1,1 | 8 | 8 |
| F2[x,y]/(x,y)^2; (x,y); A/(x) | 2,2,1,1 | 4 | 8 |
| F2[x,y]/(x,y)^2; (x,y); A/(x,y) | 2,1,1,1 | 2 | 8 |

The nonprincipal ideal distinguishes generation by a whole ideal from a chosen principal generator. The residue-module cases distinguish a module annihilated by degree one from the regular module. Z/8 has two positive nonzero pieces, detecting a mistaken degree shift or a premature nilpotence claim.

The final full suggested file compiled at the existing Mathlib pin with Lean v4.34.0-rc2: zero errors, 203 admitted-proof warnings, no other warnings, 92 examples, 14.412 seconds. Suggested-file SHA-256: 5bf28b17772787776e37d2185200157e74485f1c236d122c1d7c6e0f31aa5fc2. Compilation-log SHA-256: 7c17b599a8daf70b0af06acc8654f5bfb0b38cf30086975d28de506bdac1c596. No libraries were built, cache fetched, project created or language server started. This is a signature-elaboration receipt; every mathematical implementation remains unchecked.

### Exact remaining work

All inherited node objects, baseline prefix entries, source issues, requests, key-definition boundary, historical validation/source receipts and thirteen planets are preserved. R03.3 already has six planets, so this continuation adds none. The intrinsic support-dimension and ambient ring-dimension normalizations remain distinct.

The module gap now requires registration of the transported direct-sum grading at the precise graded-ring/module API needed by Hilbert–Serre: homogeneous projections, graded submodule and shift maps. The eleven new comparison proofs still need implementation. Next decompose the x-torsion stabilization, nilpotent filtration, multiplication exact sequence and generator induction of Stacks 10.58.7. Do not supply the graded polynomial as a hidden input to its own existence proof. All degree/dimension, Artin–Rees, localization, plane-curve order, Nagata, parameter-ideal and completion comparisons remain open, as do every original P7–P9/R03.1–R03.5 paper-route and patching obligation.

The Mathlib design screen found open [PR #33220](https://github.com/leanprover-community/mathlib4/pull/33220), with ring/algebra companions [#33218](https://github.com/leanprover-community/mathlib4/pull/33218) and [#33219](https://github.com/leanprover-community/mathlib4/pull/33219). The complete module diff was read at head 70572cd62395e933e8f6476bcedcee366a5b5e82 (file SHA-256 76f51cbee7816a9fd1b0c9a38413e9eb350674593f3a26e854c82fda9492fdd0). Its proposed GradedPiece, hasGSMul and direct-sum action should supply the shape of the outstanding grading registration; the pinned DirectSum.Gmodule is already the native graded-action interface. Do not introduce a competing generic associated-graded carrier. For the decreasing adic family, prove its order-dual natural-index filtration and compare its native denominator with the proposed generic degree quotient. These proofs remain in the explicit gap. The present new declarations are the adic Rees-quotient adapters, not a duplicate generic filtered construction. An open PR is not a pinned declaration or a reason to wait.

The complete [Zulip discussion of associated graded objects](https://leanprover-community.github.io/archive/stream/113489-new-members/topic/Associated.20graded.20objects.20%28modules.2Frings%29.html) was also screened (HTML SHA-256 186583b6e46635cafa31d0bf6d893fdf5dfae0f71be4ed4ba44718302e4633ae). It discusses filtration direction and quotienting by all strictly earlier indices. No consensus or exhaustive absence conclusion is inferred from this discussion. The recorded design source is not an additional mathematical prerequisite for the eleven current nodes.

## Native homogeneous grading continuation

Codex — codex-5ebb6f, 2 October 2026. Partial source-decomposed adic adapters; every implementation remains unchecked. The preceding paragraphs and compilation receipts are historical. All original declarations, paper routes, thirteen planets and the intrinsic/ambient multiplicity boundary remain.

### Homogeneous submodules of the native adic ring

`DeformationAndDerivedPatchingAlgebra:R03.3/adic-ring-homogeneous-components` — `TauCeti.HilbertSamuel.adicRingComponents`. For the existing quotient S=Rees(q)/(q Rees(q)), define S_n=range(ι_n) as an A-submodule of S. Identify G_n=q^n/(q·top_(q^n)) with S_n by the existing injectivity of ι_n. Compose the inverse finite expansion S→⊕G_n with the direct sum of these range equivalences to obtain the actual A-linear map d:S→⊕S_n.

A is any commutative ring with identity, q any ideal, M any A-module, and degrees natural numbers. No locality, Noetherianity, proper-ideal, domain, finite-generation or free-module premise is required.

Proof outline:

1. Take LinearMap.range of the existing adicPieceInclusion, not a new quotient or abstract component type. LinearEquiv.ofInjective gives e_n:G_n≃range(ι_n), whose underlying value is ι_n.
2. Define d=(DirectSum.congrLinearEquiv e)∘adicDirectSumEquiv.symm. Both maps use native finitely supported direct sums; no infinite product is allowed. This fixes the candidate decomposition before the native grading is registered.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-piece-inclusion`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-graded-direct-sum`, `mathlib:LinearEquiv.ofInjective`, `mathlib:LinearEquiv.ofInjective_apply`, `mathlib:DirectSum.congrLinearEquiv`.

API:

- `TauCeti.HilbertSamuel.adicRingComponentEquiv`: The existing degree-n quotient is A-linearly equivalent to the actual image submodule S_n.
- `TauCeti.HilbertSamuel.adicRingComponentEquiv_coe`: The ambient value of e_n(x) is exactly ι_n(x).
- `TauCeti.HilbertSamuel.adicRingDecompose`: The A-linear map d is the inverse finite expansion followed by the direct sum of range equivalences.

Tests:

- `HilbertSamuelAdicGradingTest.ring_zero_degree`: For q=0, the ambient value of the degree-zero component equivalence equals the existing degree-zero inclusion.
- `HilbertSamuelAdicGradingTest.ring_nonzero_positive`: For Z/4,q=(2), S_1 contains a nonzero ambient element.
- `HilbertSamuelAdicGradingTest.ring_unit_components`: For q=top every S_n is subsingleton.

### The adic ring decomposition on each homogeneous class

`DeformationAndDerivedPatchingAlgebra:R03.3/adic-ring-homogeneous-decomposition` — `TauCeti.HilbertSamuel.adicRingDecompose_inclusion`. The actual candidate d sends ι_n(x) to lof_n(e_n(x)) for every native quotient class x∈G_n.

A is any commutative ring with identity, q any ideal, M any A-module, and degrees natural numbers. No locality, Noetherianity, proper-ideal, domain, finite-generation or free-module premise is required.

Proof outline:

1. Apply the existing inverse-expansion inclusion formula to ι_n(x).
2. The native direct-sum congruence is its coordinatewise lmap; DirectSum.lmap_lof evaluates it on the homogeneous inclusion. This is the generator identity needed for the canonical recomposition inverse, not an arbitrary chosen bijection.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-ring-homogeneous-components`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-graded-direct-sum`, `mathlib:DirectSum.congrLinearEquiv`, `mathlib:DirectSum.lmap_lof`.

Acceptance: the formula retains the native quotient representative and uses a finitely supported sum.

### The native grading of the adic Rees quotient

`DeformationAndDerivedPatchingAlgebra:R03.3/adic-ring-grading-registration` — `TauCeti.HilbertSamuel.adicRingGrading`. Register GradedAlgebra(S_n) on the same S. Its native decomposition is exactly d and its canonical inverse is summation of the submodule inclusions. The unit is in S_0 and S_i S_j⊆S_(i+j). Define π_n:S→S using GradedAlgebra.proj; it is A-linear.

A is any commutative ring with identity, q any ideal, M any A-module, and degrees natural numbers. No locality, Noetherianity, proper-ideal, domain, finite-generation or free-module premise is required.

Proof outline:

1. For the decomposition inverse laws, compare the canonical recomposition with adicDirectSumEquiv composed with the inverse direct-sum range equivalences. The preceding generator identity, range equivalence evaluation and finite linear-map extensionality identify the maps; the inverse laws of the existing linear equivalences finish.
2. Represent 1 by the constant Rees monomial of coefficient 1∈q^0, hence it belongs to S_0. For multiplication, choose representatives of the two native quotient classes, use adic-homogeneous-product, and descend the representative identity through the quotient. Thus the product belongs to the actual range S_(i+j).
3. Use these four fields to register GradedRing/GradedAlgebra. Reuse GradedAlgebra.proj for projections and its native decomposition formula. The decomposition identity on ι_j fixes π_i(ι_j x) to ι_j x for i=j and zero otherwise. Homogeneous multiplication then gives the displayed projection product law.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-ring-homogeneous-components`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-ring-homogeneous-decomposition`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-homogeneous-product`, `mathlib:GradedAlgebra`, `mathlib:GradedRing`, `mathlib:DirectSum.Decomposition`, `mathlib:GradedAlgebra.proj`, `mathlib:GradedAlgebra.proj_apply`, `mathlib:DirectSum.decompose_coe`, `mathlib:DirectSum.linearMap_ext`.

API:

- `TauCeti.HilbertSamuel.adicRingGrading_decompose`: The native DirectSum.decompose map is precisely adicRingDecompose.
- `TauCeti.HilbertSamuel.adicRingProjection`: The projection π_n is the native GradedAlgebra.proj of the actual image submodule grading, bundled as an A-linear endomorphism.
- `TauCeti.HilbertSamuel.adicRingProjection_inclusion`: π_i(ι_j x)=ι_j x if i=j and zero otherwise.
- `TauCeti.HilbertSamuel.adicRingProjection_mul`: For x∈S_i,y∈S_j, π_(i+j)(xy)=xy in the original Rees quotient.

Tests:

- `HilbertSamuelAdicGradingTest.ring_unit_degree_zero`: π_0(1)=1 for every q.
- `HilbertSamuelAdicGradingTest.ring_positive_projection`: For Z/4,q=(2), some x has π_1(x)≠0 and π_0(x)=0.
- `HilbertSamuelAdicGradingTest.ring_degree_one_square`: For Z/4,q=(2), some nonzero x∈S_1 has π_2(x²)=0.

### Homogeneous submodules of the native adic module

`DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-homogeneous-components` — `TauCeti.HilbertSamuel.adicModuleComponents`. For the existing module L=Rq(M)/(q Rq·top), define L_n=range(ι_n^M) as an A-submodule of this same quotient. The native degree quotient G_n(M) is A-linearly equivalent to L_n. Composing inverse finite expansion with direct-sum range equivalences gives d_M:L→⊕L_n.

A is any commutative ring with identity, q any ideal, M any A-module, and degrees natural numbers. No locality, Noetherianity, proper-ideal, domain, finite-generation or free-module premise is required.

Proof outline:

1. Use the actual range of the existing adicModulePieceInclusion. Apply LinearEquiv.ofInjective to its inherited injectivity to get e_n^M, with ambient value ι_n^M(x).
2. Define d_M=(DirectSum.congrLinearEquiv e^M)∘adicModuleDirectSumEquiv.symm. It retains the original A action and finite support. It does not identify L with the graded ring unless M=A.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-piece-inclusion`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-direct-sum`, `mathlib:LinearEquiv.ofInjective`, `mathlib:LinearEquiv.ofInjective_apply`, `mathlib:DirectSum.congrLinearEquiv`.

API:

- `TauCeti.HilbertSamuel.adicModuleComponentEquiv`: The existing module degree quotient G_n(M) is A-linearly equivalent to its actual image L_n.
- `TauCeti.HilbertSamuel.adicModuleComponentEquiv_coe`: The ambient value of e_n^M(x) is exactly the inherited module piece inclusion.
- `TauCeti.HilbertSamuel.adicModuleDecompose`: The A-linear d_M uses the inverse existing finite expansion followed by the direct sum of range equivalences.

Tests:

- `HilbertSamuelAdicGradingTest.module_zero_degree`: For q=0 the ambient value of e_0^M agrees with the existing piece inclusion.
- `HilbertSamuelAdicGradingTest.module_regular_positive`: For Z/4,q=(2),M=A, L_1 contains a nonzero ambient element.
- `HilbertSamuelAdicGradingTest.module_residue_positive_zero`: For Z/4,q=(2),M=A/q, every L_(n+1) is subsingleton.

### The adic module decomposition on each homogeneous class

`DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-homogeneous-decomposition` — `TauCeti.HilbertSamuel.adicModuleDecompose_inclusion`. The actual d_M sends ι_n^M(x) to lof_n(e_n^M(x)) for every native module quotient class.

A is any commutative ring with identity, q any ideal, M any A-module, and degrees natural numbers. No locality, Noetherianity, proper-ideal, domain, finite-generation or free-module premise is required.

Proof outline:

1. Use the existing inverse module-expansion formula on the piece inclusion.
2. Evaluate the coordinatewise direct-sum range equivalences with DirectSum.lmap_lof. This pins the native decomposition to the original quotient representatives.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-homogeneous-components`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-direct-sum`, `mathlib:DirectSum.congrLinearEquiv`, `mathlib:DirectSum.lmap_lof`.

Acceptance: the formula retains the native quotient representative and uses a finitely supported sum.

### The native adic homogeneous scalar action

`DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-homogeneous-scalar-action` — `TauCeti.HilbertSamuel.adicModuleGradedSMul`. For the actual image component families of the native Rees quotients, register SetLike.GradedSMul(S_n,L_n): a∈S_i and x∈L_j imply a·x∈L_(i+j) under the inherited quotient action.

A is any commutative ring with identity, q any ideal, M any A-module, and degrees natural numbers. No locality, Noetherianity, proper-ideal, domain, finite-generation or free-module premise is required.

Proof outline:

1. Choose representatives in the native degree quotients using range membership. Quotient induction reduces to the inherited adic-homogeneous-module-action identity on Rees monomials; that formula supplies membership in the actual degree-(i+j) range.
2. Use this membership as the single field of the native SetLike.GradedSMul instance. No new scalar action or shifted-map definition is introduced.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-ring-homogeneous-components`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-homogeneous-components`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-homogeneous-module-action`, `mathlib:SetLike.GradedSMul`.

Acceptance: the formula retains the native quotient representative and uses a finitely supported sum.

### The native grading and action of the adic Rees module

`DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-grading-registration` — `TauCeti.HilbertSamuel.adicModuleDecomposition`. Register DirectSum.Decomposition(L_n) using d_M and SetLike.GradedSMul(S_n,L_n) using the existing action of S=gr_q(A) on L=gr_q(M). Thus S_i·L_j⊆L_(i+j) for that same action. With the precise native GradedModule.isModule instance, GradedModule.linearEquiv gives L≃ₗ[S]⊕L_n. Define the A-linear ambient projection π_n^M by native decomposition, DFinsupp.lapply and the image-submodule inclusion.

A is any commutative ring with identity, q any ideal, M any A-module, and degrees natural numbers. No locality, Noetherianity, proper-ideal, domain, finite-generation or free-module premise is required.

Proof outline:

1. Identify the canonical recomposition with the existing module expansion composed with inverse range equivalences. Check on each lof using the previous homogeneous-decomposition identity and ambient range formula; finite linear extensionality and equivalence inverse laws give both inverse identities required by DirectSum.Decomposition.ofLinearMap.
2. Import the separately registered native homogeneous scalar-action lemma. The existing quotient action, rather than a transported alternative, is the input to the native external graded action.
3. Use GradedModule.isModule explicitly for the external direct sum. The native GradedModule.linearEquiv is S-linear, whereas d_M and the individual ambient projections are A-linear. Individual degree projections are generally not S-linear: positive-degree scalars shift degree.
4. Compose DirectSum.decomposeLinearEquiv with DFinsupp.lapply n and the subtype linear map. The homogeneous inclusion identity gives π_i^M(ι_j^M x)=ι_j^M x if i=j, else zero. The graded scalar law gives π_(i+j)^M(a·x)=a·x for homogeneous inputs.

Prerequisites: `DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-homogeneous-components`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-homogeneous-decomposition`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-ring-grading-registration`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-homogeneous-module-action`, `mathlib:DirectSum.Decomposition.ofLinearMap`, `mathlib:SetLike.GradedSMul`, `mathlib:GradedModule.isModule`, `mathlib:GradedModule.linearEquiv`, `mathlib:DirectSum.decomposeLinearEquiv`, `mathlib:DFinsupp.lapply`, `mathlib:DirectSum.decompose_coe`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-module-homogeneous-scalar-action`, `mathlib:DirectSum.linearMap_ext`.

API:

- `TauCeti.HilbertSamuel.adicModuleSumModule`: Use precisely GradedModule.isModule(S_n,L_n) on the external direct sum; the suggested file installs this instance locally to make the scalar choice explicit.
- `TauCeti.HilbertSamuel.adicModuleGradedEquiv`: The native internally/externally graded comparison is linear over the original graded ring S.
- `TauCeti.HilbertSamuel.adicModuleGradedEquiv_inclusion`: The S-linear equivalence sends the existing degree-n inclusion to the native direct-sum inclusion of e_n^M(x).
- `TauCeti.HilbertSamuel.adicModuleProjection`: π_n^M is an A-linear ambient projection using native decomposition, coordinate evaluation and subtype inclusion.
- `TauCeti.HilbertSamuel.adicModuleProjection_inclusion`: π_i^M(ι_j^M x)=ι_j^M x if i=j, else zero.
- `TauCeti.HilbertSamuel.adicModuleProjection_smul`: For a∈S_i and x∈L_j, π_(i+j)^M(a·x)=a·x for the original quotient action.

Tests:

- `HilbertSamuelAdicGradingTest.module_zero_higher_projection`: For q=0 every positive-degree ambient module projection is zero.
- `HilbertSamuelAdicGradingTest.module_regular_positive_projection`: For Z/4,q=(2),M=A, some x has π_1^M(x)≠0 and π_0^M(x)=0.
- `HilbertSamuelAdicGradingTest.module_residue_action_zero`: For Z/4,q=(2),M=A/q, every a∈S_1 acts as zero on all of L.

The ring grading and module grading now have native declarations on their original quotient carriers. Their instances and compatibility proofs still use admitted proofs in the suggested file. No generic graded ring, generic Rees object, internal grading wrapper or shifted-map theory is newly planned. The individual projections are A-linear; positive-degree scalars prevent them from being linear over the whole graded ring. The external comparison is linear over that ring using the exact native GradedModule.isModule action.

For the chosen length-valued Hilbert–Serre consumer, follow the predecessor kernel/cokernel proof rather than leaving its old largest-power-torsion route as a required extra obligation. Both ker(x) and M/xM must receive actual homogeneous components and the S/(x) action before induction. The signed recurrence includes the kernel term; the induction must provide its anchor constant and threshold. The generator-count bound does not identify polynomial degree with support dimension. The ten subsequent refinement items in the preceding proof receipt remain for canonical integration. All degree/dimension, Artin–Rees, associativity, formal-curve, Nagata, parameter, completion, coefficient and derived/patching obligations remain open.

### Fresh validation and source boundary

The complete suggested file elaborates at the existing exact Mathlib pin with Lean v4.34.0-rc2: zero errors, 225 admitted-proof warnings and no other warnings; 104 native examples, 21.91 seconds. Its SHA-256 is 959ab431e3d44c4eaaa1f206f05834c553ceeb6185ced824789fc9c2c4270427; the full log SHA-256 is 59edb31b332841c9a5145f528245b9ad0c0a75707ed20b0755fb156a3724c782. No mathematical implementation is certified.

The indexed blueprint checker has zero errors and warnings. All 72 original node objects and every original source, baseline prefix, planet, request, coverage row and key-definition boundary are preserved. The 79-node current declaration graph and the normal read-only atlas stage graph, including its existing external supplier endpoints, are acyclic. All 79 declarations are listed by the actual atlas assembly, with no skipped link for this roadmap. This does not check all accepted declaration graphs.

Fresh finite cyclic grading regressions pass 15,171 assertions in eleven actual cyclic ring/module cases, checking quotient representative independence, projection orthogonality, degree sums and the original quotient action. The standalone script and output hashes are 965bb6babe5eaa998561d7de2fe2e1aedd60eb581d129e11ddf26e14575c5ed9 and 737f279a26f532bf4d9652bce40259fac040d18540871cd247c1ae4169451f56. The predecessor Hilbert–Serre reproduction also freshly passes all 24,317 assertions in 151 models with exactly its published hashes. Finite checks support the examples and detect incorrect definitions; they do not prove the unrestricted grading or polynomial induction. The current handoff gives durable reproduction links and the new standalone program.

Fresh primary reading covers complete Stacks 00K1 and 00K4 mathematical statements/proofs, plus the nineteen individual pinned grading/decomposition references in the packet. No new whole-paper erratum audit or completion of the inherited coefficient/patching sources is claimed. The reviewed AUDIT-17 R03.3 record and accepted RS-08 ownership were reread; upstream generic grading and shifted-map APIs are reused.

## 2026-10-02 continuation: actual shifted finite-jet maps

Codex — codex-a71f92. Partial canonical integration of the merged plane-curve
[proof handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/eb645dc85df65608c56fafc4d9ed0e71ab0ca3ce/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md),
§§3–4 and worklist J01/J04–J06. The six new nodes below preserve every one
of the 79 inherited node objects, all 13 planets, all old sources/findings
and requests, and the reserved general Hilbert–Samuel definition.
Every implementation is unchecked; none of the eight stages is closed.

The finite-variable formulation is an explicit extension of the two-variable
handoff. The membership lemma and right-exactness need only a commutative
coefficient ring; exact-order injectivity needs no zero divisors. The
variable ideal is not called the maximal ideal over arbitrary coefficients.
For a field and two variables it is the plane-curve jet ideal from the
handoff; its local/residue-field identification is not built into a new
carrier.

### Baseline and ownership

The exact Mathlib pin already supplies MvPowerSeries.order_mul, including
its zero-factor cases. Its full weightedOrder_mul proof was read; no new
generic order-multiplicativity node is planned. The native
Submodule.mapQ, Submodule.factor and LinearMap.mulLeft provide the actual
maps, not just requested types. In particular the relevant denominator is
a Submodule.comap under a linear map: Ideal.comap would require a ring
homomorphism and is the wrong interface. The native ENat order keeps the
zero series at infinity; it is never converted with toNat.

The finite-variable native truncTotalAlgHom already lands in a polynomial
variable-ideal quotient, and native adic completeness is already built.
Those are continuation inputs, not additional maps or completion theories
to reconstruct here. No total truncation algebra homomorphism into the
unquotiented polynomial ring is asserted.

All eight current AUDIT-17 scope records and the accepted RS-08 relevant
keeps, review, owners, link-map overlap and stage edges were read.
R03.3 retains general module depth/complete-intersection/support work and
imports ModularCurves 4D's accepted local regularity/completion/flatness
scope. This jet specialization belongs to its existing multiplicity
strand, not to a replacement coefficient category or curve-specific
definition of multiplicity. Complete nearby upstream roadmap readings
include the earlier stable-reduction/Jacobian readings and the current
GrothendieckEulerForms roadmap. These are density/ownership inputs, not
claims that their unrelated theories were extracted anew.

### Declaration-level mathematical proof plan

In the following statements, R is the existing finite-variable power-series
ring and v is the algebraic ideal generated by its existing X variables.
The maps use ordinary quotient modules with their actual R actions.

#### Variable-ideal powers and total order

Identifier: DeformationAndDerivedPatchingAlgebra:R03.3/variable-ideal-power-order.
Proposed declaration: TauCeti.HilbertSamuel.mem_variableIdeal_pow_iff.

For finite σ, any commutative ring k, R=MvPowerSeries σ k and v=span{X_i | i∈σ}, a series g lies in v^r if and only if (r:ℕ∞)≤order(g), for every r≥0. This includes g=0, r=0, the empty variable set and coefficient rings with zero divisors.

Hypotheses:

- σ is finite, k is any commutative ring, R=MvPowerSeries σ k and v is the algebraically generated ideal span{X_i | i∈σ}. All degrees are natural numbers.

Proof/construction:

1. Forward: each variable has no constant term. Expanding a product of r variables times a series, the coefficient convolution has no term of total degree below r. The same vanishing is preserved by finite sums and R-multiples, hence by the algebraic ideal power. Translate coefficient vanishing to the native ENat order using nat_le_order.
2. Reverse, r=0: v^0=R, so every series belongs. For r>0 fix a finite enumeration of σ. For each exponent α of degree at least r, greedily allocate r units from its coordinates in that enumeration, obtaining β(α)≤α of degree r. The set B_r of such β is finite: every coordinate is at most r. If σ is empty then B_r is empty and the vanishing condition forces g=0.
3. For each β∈B_r define the formal series h_β by setting its coefficient at γ to coeff_(β+γ)(g) when β(β+γ)=β, and zero otherwise. Then coefficientwise g=Σ_(β∈B_r) X^β h_β. Each X^β is a product of exactly r native variables, so lies in v^r. The sum is finite; no closure under an infinite sum or ideal topology is assumed.
4. Native coeff_of_lt_order gives the reverse vanishing implication. Keep order(0)=∞: no ENat.toNat is used. This extends the predecessor's explicit two-variable allocation to finite σ and does not identify v with a local maximal ideal over an arbitrary coefficient ring.

Prerequisites: mathlib:MvPowerSeries.order, mathlib:MvPowerSeries.coeff_of_lt_order, mathlib:MvPowerSeries.nat_le_order.

Source: merged handoff §3, first paragraph; finite-variable allocation extension explicitly derived here. An adapter between algebraic powers of the variable ideal and native total order, not a new order definition.

Acceptance checks:

- For σ=Fin 2, k=ℚ, X_0∈v but X_0∉v².
- For k=Z/4 the same membership statement holds although order equality for products can fail.
- For the empty variable set and r>0 the only member of v^r is zero.

#### Shifted jet denominator containment

Identifier: DeformationAndDerivedPatchingAlgebra:R03.3/shifted-jet-denominator.
Proposed declaration: TauCeti.HilbertSamuel.shiftedJet_denominator.

With finite σ, commutative k and v as above, let d≤N and (d:ℕ∞)≤order(f). Multiplication by f sends v^(N+1−d) into v^(N+1), equivalently the source submodule is contained in the preimage of the target submodule under the native R-linear multiplication map.

Hypotheses:

- σ is finite, k is any commutative ring, R=MvPowerSeries σ k and v is the algebraically generated ideal span{X_i | i∈σ}. All degrees are natural numbers.
- d≤N and (d:ℕ∞)≤order(f). The construction deliberately permits f=0 and d=0; injectivity has stricter separate hypotheses.

Proof/construction:

1. Apply variable-ideal-power-order to a source element g. The native product-order lower bound gives order(fg)≥order(f)+order(g)≥d+(N+1−d)=N+1 in ENat.
2. The equality of natural exponents follows from d≤N, so the natural subtraction is legitimate. The zero representative and f=0 are covered directly by extended-natural inequalities.
3. Apply variable-ideal-power-order to fg. Express the conclusion as Submodule.comap of LinearMap.mulLeft R f, not Ideal.comap: multiplication by f is generally not a ring homomorphism.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/variable-ideal-power-order, mathlib:MvPowerSeries.le_order_mul, mathlib:LinearMap.mulLeft.

Source: merged handoff §4, displayed sequence (6) and following well-definedness paragraph. Only the lower order bound is needed; finite exact order and a domain are reserved for injectivity.

Acceptance checks:

- For d=N the source ideal is v, not v^0.
- No no-zero-divisors hypothesis is needed for well-definedness.

#### Shifted multiplication on finite jets

Identifier: DeformationAndDerivedPatchingAlgebra:R03.3/shifted-jet-map.
Proposed declaration: TauCeti.HilbertSamuel.shiftedJetMap.

Under d≤N and (d:ℕ∞)≤order(f), construct the actual R-linear map μ_f:R/v^(N+1−d)→R/v^(N+1), [g]↦[fg], by native Submodule.mapQ of LinearMap.mulLeft R f and shifted-jet-denominator. Its projection API is the native factor π_f:R/v^(N+1)→R/((f)+v^(N+1)), [g]↦[g]. No jet carrier, dimension datum, or algebra-homomorphism multiplication stand-in is introduced.

Hypotheses:

- σ is finite, k is any commutative ring, R=MvPowerSeries σ k and v is the algebraically generated ideal span{X_i | i∈σ}. All degrees are natural numbers.
- d≤N and (d:ℕ∞)≤order(f). The construction deliberately permits f=0 and d=0; injectivity has stricter separate hypotheses.

Proof/construction:

1. Take the displayed actual ideal quotients with their native R-module structures. Descend the native multiplication map using the denominator containment, fixing its value, not merely postulating a map with a type.
2. Take Submodule.factor for v^(N+1)≤(f)+v^(N+1) as the canonical quotient projection. Its quotient-representative formula is native factor_mk.
3. Both representative formulas are definitional. Native linearity, map_zero and map_add are inherited from LinearMap; do not re-plan the generic quotient or linear-map APIs. Injectivity, range-kernel identity and small-index behavior are separate lemma nodes below.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/shifted-jet-denominator, mathlib:Submodule.mapQ, mathlib:Submodule.mapQ_apply, mathlib:Submodule.factor, mathlib:Submodule.factor_mk.

Source: merged handoff §4, sequence (6) and its two actual maps. The full native quotient construction records the chosen representative maps; this is canonical integration of the handoff, not a new multiplicity definition.

API derived from the exact-sequence and quotient-length consumers:

- TauCeti.HilbertSamuel.shiftedJetMap_apply (simp): For every g∈R, μ_f([g]_(v^(N+1−d)))=[fg]_(v^(N+1)).
- TauCeti.HilbertSamuel.jetProjection (projection): The canonical R-linear projection π_f:R/v^(N+1)→R/((f)+v^(N+1)) is native Submodule.factor of the displayed ideal inclusion.
- TauCeti.HilbertSamuel.jetProjection_apply (simp): For every g∈R, π_f([g]_(v^(N+1)))=[g]_((f)+v^(N+1)).

Uses:

- Plane-curve handoff §4, exact sequence (6), and §11 J04–J06: Fix the actual shifted jet multiplication and quotient projection used for the jet length computation; distinguish well-definedness from injectivity.
- DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-function and reserved multiplicity geometric comparison: Eventually identify the projection target with (R/(f))/n^(N+1), then transfer finite lengths. That quotient-of-quotient/scalar comparison is not silently assumed here.

Discriminating tests, all with native examples in the suggested file:

- HilbertSamuelJetTest.linear_equation (computation): For k=ℚ, σ=Fin 2, f=X_0 and d=N=1, μ_f sends [1] modulo v to the nonzero class [X_0] modulo v².
- HilbertSamuelJetTest.unit_equation (degenerate): For k=ℚ, σ=Fin 2, f=1, d=0 and every N, μ_f is the identity of R/v^(N+1), for any proof of the order lower bound. This is an adapter boundary case, not a nontrivial curve.
- HilbertSamuelJetTest.nonreduced_equation (computation): For k=F₂, σ=Fin 2, f=X_0^4 and d=N=4, its native order equals 4, μ_f([1] modulo v)=[X_0^4] modulo v^5 is nonzero, and μ_f is injective. The curve equation need not be reduced.
- HilbertSamuelJetTest.zero_equation (degenerate): For any finite σ and commutative k, f=0 and admissible d≤N, μ_f is the zero linear map. It satisfies the order lower bound but not the exact finite-order premise of the injectivity lemma.

Acceptance checks:

- A zero multiplication stand-in fails the nonzero image tests.
- Replacing the source by R/v^(N+1) fails injectivity in the linear equation test.
- Neither polynomial evaluation nor a rectangular cutoff may replace the actual total-degree ideal quotients.

#### Injectivity at the exact equation order

Identifier: DeformationAndDerivedPatchingAlgebra:R03.3/shifted-jet-injective.
Proposed declaration: TauCeti.HilbertSamuel.shiftedJetMap_injective.

If σ is finite, k is a commutative ring with no zero divisors, f has exact native order d∈ℕ and d≤N, then the actual shifted jet map μ_f:R/v^(N+1−d)→R/v^(N+1) is injective. Completeness, finite residue field, irreducibility and characteristic-zero hypotheses are unnecessary.

Hypotheses:

- σ is finite, k is any commutative ring, R=MvPowerSeries σ k and v is the algebraically generated ideal span{X_i | i∈σ}. All degrees are natural numbers.
- k has no zero divisors, order(f)=(d:ℕ∞), and d≤N. Exact finite order already excludes f=0; d=0 is allowed.

Proof/construction:

1. For a representative g of a kernel class, μ_f([g])=0 means fg∈v^(N+1), by the actual representative formula and native quotient equality.
2. Use the built native MvPowerSeries.order_mul, not a new order-multiplicativity theorem: order(fg)=d+order(g). If g=0 the source class is zero. Otherwise its order is finite and ENat cancellation of the finite d gives order(g)≥N+1−d.
3. Apply variable-ideal-power-order to get g in the source denominator. Thus the kernel is zero, hence the linear map is injective. Equivalently kernel_mapQ transports the same preimage equality.
4. An order lower bound alone is insufficient: a series of order larger than d can kill a nonzero source class, even over a field. Over Z/4 take f=2X_0 and g=2: both relevant low classes are nonzero but fg=0.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/variable-ideal-power-order, DeformationAndDerivedPatchingAlgebra:R03.3/shifted-jet-map, mathlib:MvPowerSeries.order_mul, mathlib:MvPowerSeries.order_eq_top_iff, mathlib:Submodule.ker_mapQ.

Source: merged handoff §4, injectivity proof following (6); reuse of the pinned order_mul is a fresh library correction to the worklist. The written proof supplies the kernel argument. General order multiplication is already built at the pin, so only this quotient adapter is planned.

Discriminating tests, all with native examples in the suggested file:

- HilbertSamuelJetTest.zero_divisor_base (non-example): For k=Z/4, σ=Fin 2, f=2X_0 and d=N=1, the order lower bound holds but μ_f is not injective: it kills the nonzero residue class of 2.

Acceptance checks:

- For k=F₂ and f=X_0^4, d=N=4 the map is injective despite a nonreduced equation.
- The coefficient-ring no-zero-divisors assumption rejects f=2X_0 over Z/4.

#### Range and cokernel of shifted jet multiplication

Identifier: DeformationAndDerivedPatchingAlgebra:R03.3/shifted-jet-exact.
Proposed declaration: TauCeti.HilbertSamuel.shiftedJetMap_exact.

For finite σ, commutative k, d≤N and (d:ℕ∞)≤order(f), range(μ_f)=ker(π_f) and π_f is surjective, for the exact native maps in shifted-jet-map. Thus R/((f)+v^(N+1)) is their actual cokernel quotient. This right-exact assertion does not require exact finite order or a coefficient domain.

Hypotheses:

- σ is finite, k is any commutative ring, R=MvPowerSeries σ k and v is the algebraically generated ideal span{X_i | i∈σ}. All degrees are natural numbers.
- d≤N and (d:ℕ∞)≤order(f). The construction deliberately permits f=0 and d=0; injectivity has stricter separate hypotheses.

Proof/construction:

1. Surjectivity is native factor_surjective. A class [h] in the middle quotient lies in the projection kernel exactly when h belongs to (f)+v^(N+1).
2. For any kernel class choose h=fg+r with r∈v^(N+1), using singleton ideal span membership and the sum-ideal membership criterion. Then [h]=μ_f([g]) for the actual source class, proving kernel⊆range.
3. Conversely the projection kills every fg because fg∈(f). Native range_mapQ records that the range is the image of the principal ideal under the middle quotient map, yielding the reverse inclusion.
4. Only after shifted-jet-injective is added under its stricter hypotheses is this a short exact sequence. The further quotient-of-quotient equivalence with A/n^(N+1) and the length/dimension comparisons remain explicit continuation work; do not assert an A-linear structure on the shifted source.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/shifted-jet-map, mathlib:Submodule.range_mapQ, mathlib:Submodule.factor_surjective.

Source: merged handoff §4, paragraph identifying the middle kernel and the cokernel of (6). The principal-image proof works over any commutative coefficient ring; the left injectivity and the eventual A-scalar comparison are kept separate.

Acceptance checks:

- For f=0 both multiplication image and projection kernel are zero.
- For f=1,d=0 the multiplication is the identity and the projection target is zero.

#### Jets below the equation order

Identifier: DeformationAndDerivedPatchingAlgebra:R03.3/jet-below-equation-order.
Proposed declaration: TauCeti.HilbertSamuel.jetProjection_below_order.

For finite σ, commutative k, N<d and (d:ℕ∞)≤order(f), one has (f)+v^(N+1)=v^(N+1), and the actual projection π_f:R/v^(N+1)→R/((f)+v^(N+1)) is bijective. This is the small-index branch and asserts no shifted injective multiplication sequence.

Hypotheses:

- σ is finite, k is any commutative ring, R=MvPowerSeries σ k and v is the algebraically generated ideal span{X_i | i∈σ}. All degrees are natural numbers.
- N<d and (d:ℕ∞)≤order(f); no domain, nonzero or exact-order hypothesis is required.

Proof/construction:

1. Since N+1≤d≤order(f), variable-ideal-power-order gives f∈v^(N+1). The generated principal ideal lies in this power, so their sum is the same power.
2. The canonical factor under this equality has identical source and target quotient relations. Its representative formula proves injectivity; its native factor_surjective proves surjectivity.
3. For f=X_0^4,N=0 the projection is the residue-jet bijection, while the tempting multiplication R/v→R/v sends everything to zero. Guard the shifted construction with d≤N and never use truncated natural subtraction to extend injectivity to N<d.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/variable-ideal-power-order, DeformationAndDerivedPatchingAlgebra:R03.3/shifted-jet-map, mathlib:Submodule.factor_surjective.

Source: merged handoff §4, small-index comparison (7) and the f=x^4,N=0 counterexample. No natural-subtraction shortcut is used. This adapts the actual native factor map, not a new jet isomorphism carrier.

Discriminating tests, all with native examples in the suggested file:

- HilbertSamuelJetTest.small_index_not_shifted (non-example): For k=ℚ, σ=Fin 2, f=X_0^4 and N=0, π_f is bijective, but multiplication by the class of f on R/v is not injective, since that class is zero and [1]≠0.

Acceptance checks:

- The zeroth jet of f=X_0^4 over ℚ is unaffected by the equation.
- The false unguarded shifted map kills the nonzero class of 1.

### Validation and exact boundary

The entire Mathlib-only suggested file elaborates against the existing
exact Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 build with Lean
v4.34.0-rc2: 0 errors, 234 admitted-proof warnings and no other warnings,
110 native examples, 21.73 seconds and maximum RSS 3,527,296 KiB.
Available memory before the successful run was 70 GiB. No Tau Ceti module
was imported or built, and no project, cache or language server was created.
Its SHA-256 is
e3164f12e7f6f3719fdf4c61fd6abae12d009eaf1ec3441215f4f0203fd7f274;
the full output SHA-256 is
aa871b8d5295369575cc5a75f222677098ab37a65f53f1fc3055f9a5b5fc04ce.
The substantial membership, denominator, injectivity, exactness and
small-index proofs are still admitted; elaboration checks the actual
signatures and carriers, not the mathematical implementations.

The predecessor's standalone finite plane-curve program was freshly
reproduced unchanged: 507 cases and 25,148 assertions, with exactly its
published script SHA-256
ed9dc3d82ba5b988e95634bfd035821efcd4ebda2e552465c757e38b9df73a35
and output SHA-256
058a580c33c92c372851ded432b1740fb069243fa5e19a24943c6a3c86b182d5.
The full program is still in the handoff. This supports the finite examples
and indexing counterexamples; it is not a proof of arbitrary series,
length restriction, or the general Hilbert–Samuel construction.

Only the first jet-map strand is canonically integrated. The total-jet
basis and polynomial-jet quotient equivalence, finite length versus
coefficient-field dimension, actual quotient-of-quotient comparison with
A/n^(N+1), full tangent-cone kernel, exact all-index quotient-length
formula and comparison with the existing cumulative polynomial and
intrinsic/ambient multiplicities remain work. Unit equations give the
zero curve ring, and zero equations give the ambient ring; neither is a
nontrivial one-dimensional curve with finite positive equation order.

The independent general graded Hilbert–Serre kernel/cokernel induction
still needs canonical homogeneous K and Q adapters, the degree recurrence,
its correct anchor and threshold. Its generator-count bound must not be
confused with support dimension. The degree/dimension, Artin–Rees,
associativity, Nagata, parameter, completion, coefficient, derived and
patching gaps all remain. All routed papers still require their recorded
full source/declaration closure. No new whole-paper erratum finding or
independent review is claimed. Fresh primary reading of
[Stacks 10.59](https://stacks.math.columbia.edu/tag/00K4) and
[43.15](https://stacks.math.columbia.edu/tag/0AZU) preserves the distinction
between the graded and cumulative functions; the
[power-series dimension remark](https://stacks.math.columbia.edu/tag/032C)
is only a future dimension input, not a discharged native multivariate
dimension theorem.

The actual indexed checker and intake file checks pass with zero errors or
warnings. A final read-only atlas assembly at publication parent
b9239798babb94f290b4302764f457bacfe87d36 lists all 85 declarations from this part
(138 for the whole multi-part roadmap), with no skipped links. Its 2,952
stages and 8,623 stage edges are acyclic; the reachable current declaration
graph has 260 vertices and 130 own declaration edges and is also acyclic.
This is not a check of every accepted declaration graph. Fresh preflight
confirmed all four target blobs and binding instructions/owner inputs were
unchanged since the initial read base; no unrelated contribution is
overwritten.


## Total-degree jets and their actual monomial coordinates — codex-rtOQ9t

For a finite variable set σ and any commutative coefficient ring k, put
R=k[[X_i]], v=span{X_i} in R and p=idealOfVars in k[X_i]. These are algebraic
ideals in the native rings. Over an arbitrary k, v is not asserted to be a
maximal ideal. The cutoff r means total degree strictly below r. Hilbert–Samuel
index N uses r=N+1, so the surface jet count is binom(N+2,2).

The built `MvPowerSeries.truncTotalAlgHom` maps R into k[X_i]/p^r and is an
algebra map over k[X_i]. `truncTotal` into the entire polynomial ring is a
linear map; multiplication is preserved after the ideal quotient.

| Declaration | Exact new contract |
| --- | --- |
| `truncTotalAlgHom_ker` | Its actual kernel is v^r, including r=0, zero series and empty σ. |
| `totalJetEquiv` | The induced k-algebra equivalence R/v^r ≃ k[X_i]/p^r sends [g] to [truncTotal(r,g)] and sends a polynomial class back to its native series class. |
| `totalJetBasis` | The basis is indexed by exponent vectors of total degree less than r, its vectors are the actual monomial classes and its representation coefficients are the coefficients of a representative series. |
| `planeTotalJet_finrank` | For any field k and two variables, finrank_k(R/v^r)=binom(r+1,2), for every r≥0. |

The kernel proof reads coefficients of degree below r using the built
polynomial ideal-power criterion and then the preceding native order/variable
ideal adapter. Polynomial representatives prove surjectivity, so the native
algebra first isomorphism theorem supplies the equivalence. The inverse is
polynomial inclusion; no completeness or characteristic hypothesis is added.

For the basis, the built finite set of low-degree exponent vectors supplies
finitely supported coordinates. A tuple maps to its finite monomial sum.
Taking low coefficients of a series is well-defined modulo v^r. Both composites
are identities: coefficients recover the tuple, while subtracting the finite
sum leaves a series in v^r. Transport the native `Finsupp.basisSingleOne`
through this coordinate equivalence. The APIs give basis-vector values,
representation coefficients and native k-module finiteness. For two variables,
degree t has t+1 exponent pairs; summing t=0,…,r−1 gives binom(r+1,2).
The built `Module.length_eq_finrank` then gives this same finite **k-length**.

The construction tests require the zero ring quotient and empty basis at r=0;
at r=1 the constant class survives and each variable dies. At r=2, X_0X_1
vanishes, whereas inclusive rectangular truncation with bound (1,1) retains it.
At r=3 over F₂, its class survives and X_0³ vanishes, giving field length six.
At r=1 over Z/4, the coordinate 2 and its constant class are nonzero. Thus the
basis cannot require a coefficient domain, and it cannot omit mixed monomials.
All six API items and all seven new packet tests have native suggested
signatures; all proposed bodies are admitted.

**Built quotient and scalar comparisons.** If I=(f), A=R/I and n=map(v),
the native `Ideal.map_pow` and `DoubleQuot.quotQuotEquivQuotSupₐ` already give
A/n^r ≃ R/(I+v^r), as R-algebras. The native surjectivity of R→A and
`Module.length_eq_of_surjective` give length_R(A/n^r)=length_A(A/n^r).
These generic declarations receive baseline citations, rather than new nodes.
Separate checked native applications use only the usual kernel axioms;
their immutable experiment receipt is linked in the handoff. The two final
acceptance signatures are admitted like the other proposed tests.

**Dependencies and acceptance.** These declarations realise R03.3 and use its
existing variable-ideal-power/order node. They support the shifted jet sequence
and the general Hilbert–Samuel owner; they add no stage edge. Accepted RS-08
continues to assign general local algebra to R03.3 and completion/regularity
comparisons to ModularCurves 4D. The generic perfect-complex, Milnor and other
paper suppliers retain their existing owners and unread obligations.

**Remaining proof boundary.** The k-length calculation does not identify
R-module length with k-dimension: k→R is not surjective. Prove that comparison
for finite R-modules killed by v^r using the finite v-filtration and the actual
residue-field scalar action, then combine the built A-scalar and quotient
comparisons with the shifted sequence. The all-index curve lengths, full
tangent-cone kernel, dimension and general intrinsic/ambient multiplicity
comparison remain required. The reserved Hilbert–Samuel definition retains
its general finite-module scope and exact ID. The assembler graph is acyclic
with unchanged stage edges and no skipped links for this roadmap; the inherited
LocalFields layer-0 → R03.4 supplier path is absent in the assembled stage graph
and remains a request, as recorded in the handoff.


## Native residue fields and series-module lengths — codex-5ebb6f

Let k be a field and R=k[[X_i]] for any variable type σ. Use the native local
ring and κ(R)=R/maximalIdeal R, with the quotient's inherited coefficient
algebra. The built constant-coefficient unit criterion makes constantCoeff
local. Its native residue lift is bijective with section a↦residue(C(a)),
so it gives an actual k-algebra equivalence κ(R)≃k.

The coefficient map k→κ(R) is therefore onto. This is the surjectivity used
for the residue degree; the coefficient map k→R need not be onto. The built
local-extension theorem says length_k M=length_R M times the residue degree.
That degree is one, including its actual κ(k)-scalar interpretation. Thus
length_R M=length_k M for every compatible R-module, including infinite
length. If M is finite over k, the already-built field-length theorem gives
length_R M=finrank_k M. Finite generation over R alone does not give that
finite-dimensional conclusion.

This directly resolves the residue/length proof leaf left by the previous
checkpoint. Its proposed finite variable-ideal filtration proof is replaced
by an application of the already-built general local-ring theorem. The
[Stacks finite-length formula](https://stacks.math.columbia.edu/tag/02M0)
was freshly read with its proof; the unrestricted extended-natural branch
comes from the stronger pinned Mathlib statement and proof. No routed paper
has received a new whole-paper reading or closure claim.

The existing totalJetBasis_finite API is promoted because the new quotient
length node consumes it. Applying the finite-dimensional length result to
R/v^r gives its native R-module length. The inherited two-variable dimension
count then gives binom(r+1,2), including r=0. These last two adapters still
need the inherited, unchecked actual jet basis and count. The characteristic
two cutoff-three test asks for ring-module length six, complementing the
previous coefficient-field-length test. It remains an admitted acceptance
signature in the submitted sketch.

A separate immutable proof archive in the handoff contains the seven
residue/length foundation declarations and six tests with complete proofs.
Their axiom audits contain only propext, Classical.choice and Quot.sound.
The variable test quantifies over every field and variable, so it includes
positive characteristic. A concrete ZMod 2 residue elaboration exhausted
heartbeats and is not reported as passing; the field-uniform test checks
successfully. All new submitted bodies are admitted under PROTOCOL section
13, and implementationStatus remains unchecked.

The 89 inherited node objects and the reserved general Hilbert–Samuel
multiplicity definition are unchanged. Historical paragraphs describing the
length adapter as a gap predate this appendix. The curve quotient all-index
length, full tangent-cone kernel, eventual polynomial, dimension and intrinsic/
ambient multiplicity comparison are still open. The general Hilbert–Serre,
completion, perfect-complex, patching and routed-source obligations remain.
The inherited LocalFields layer-0 to R03.4 supplier-path gap is retained.

### Coefficient field of formal series

Identifier: DeformationAndDerivedPatchingAlgebra:R03.3/series-residue-equivalence. Proposed declaration: TauCeti.HilbertSamuel.seriesResidueEquiv.

Construct the actual k-algebra equivalence κ(R)≃k descending constantCoeff. Its inverse sends a∈k to the native residue class of C(a). This fixes the native maximal-ideal quotient and coefficient scalar action, rather than supplying an unrelated isomorphic field.

Hypotheses:

- σ is any type, k is a field, R=MvPowerSeries σ k, and κ=IsLocalRing.ResidueField R with the native coefficient k-algebra structure. Neither finite σ nor any characteristic, algebraic-closure, completeness or finite-field assumption is imposed.

Proof/construction:

1. The built unit criterion makes constantCoeff:R→k a local ring homomorphism: a unit constant coefficient implies the series is a unit. The native local-ring instance of R and native residue field are reused.
2. Descend constantCoeff through the built ResidueField.lift. It commutes with the coefficient algebra map because lift(residue(C(a)))=constantCoeff(C(a))=a.
3. The lifted map between fields is injective by the built RingHom.injective. It is surjective with preimage residue(C(a)). Apply the built AlgEquiv.ofBijective.
4. The quotient representative formula is the native lift formula. Injectivity and the coefficient-section calculation determine the inverse, while algebra commutation is inherited from the constructed AlgEquiv.

Prerequisites: mathlib:IsLocalRing.ResidueField, mathlib:IsLocalRing.residue, mathlib:IsLocalRing.ResidueField.lift, mathlib:IsLocalRing.ResidueField.lift_residue_apply, mathlib:MvPowerSeries.constantCoeff, mathlib:MvPowerSeries.isUnit_iff_constantCoeff, mathlib:RingHom.injective, mathlib:AlgEquiv.ofBijective.

API outline:

- TauCeti.HilbertSamuel.seriesResidueEquiv_residue (simp): For every native series g, E(residue(g))=constantCoeff(g).
- TauCeti.HilbertSamuel.seriesResidueEquiv_symm (simp): For every coefficient a, E⁻¹(a)=residue(C(a)).
- TauCeti.HilbertSamuel.seriesResidueEquiv_algebraMap (compatibility): For every a∈k, E(algebraMap k κ(R) a)=a, with the inherited coefficient algebra on the actual residue field.

Native test signatures:

- HilbertSamuelResidueTest.coefficient_section (compatibility): For every a∈k, E(residue(C(a)))=a and E⁻¹(a)=residue(C(a)); the native coefficient inclusion is the chosen section.
- HilbertSamuelResidueTest.empty_variables (degenerate): For σ=Empty and k=ℚ, E(residue(C(3)))=3; the construction requires no inhabited or finite variable type.
- HilbertSamuelResidueTest.variable_not_identity (non-example): For every variable i∈σ over any field, E(residue(X_i))=0 while the native series X_i≠0. An identity map on series fails the residue assertion, and a zero replacement fails the coefficient-section assertion.

Uses:

- Plane-curve handoff §3 and worklist J03, J06–J07: Fix the actual residue coefficient field and its scalar action when interpreting native R-module length.
- DeformationAndDerivedPatchingAlgebra:R03.3/series-residue-coefficients-surjective and series-module-length: The constructed algebra equivalence supplies injectivity and built algebra commutation; no separate nilpotent-filtration theorem is introduced.

Source: ResidueField/Basic.lean lift and lift_residue_apply; Inverse.lean isUnit_iff_constantCoeff; native coefficient section. Specialize existing native constructions and theorems to series over a field; no generic residue field, scalar restriction or module-length theorem is replanned.

### Coefficients surject onto the series residue field

Identifier: DeformationAndDerivedPatchingAlgebra:R03.3/series-residue-coefficients-surjective. Proposed declaration: TauCeti.HilbertSamuel.seriesResidue_coeff_surjective.

The native algebraMap k κ(R) is surjective for a formal series ring over a field; the coefficient map k→R itself is not asserted to be surjective.

Hypotheses:

- σ is any type, k is a field, R=MvPowerSeries σ k, and κ=IsLocalRing.ResidueField R with the native coefficient k-algebra structure. Neither finite σ nor any characteristic, algebraic-closure, completeness or finite-field assumption is imposed.

Proof/construction:

1. For x∈κ(R), choose a=seriesResidueEquiv(x). Under the native algebra equivalence, algebraMap(a) and x both map to a by standard algebra commutation.
2. Injectivity of the equivalence proves algebraMap(a)=x. This uses the AlgEquiv structure of the preceding construction; its optional representative APIs are not extra prerequisites.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/series-residue-equivalence.

Source: Native AlgEquiv commutation and injectivity after the specialized residue equivalence. Specialize existing native constructions and theorems to series over a field; no generic residue field, scalar restriction or module-length theorem is replanned.

### Series length equals coefficient-field length

Identifier: DeformationAndDerivedPatchingAlgebra:R03.3/series-module-length. Proposed declaration: TauCeti.HilbertSamuel.seriesModule_length_eq_coeff_length.

For every compatible R-module M, Module.length R M=Module.length k M in extended naturals. Infinite lengths are included. The residue coefficient field has degree one, so no finite generation or nilpotent variable-ideal filtration premise is needed.

Hypotheses:

- σ is any type, k is a field, R=MvPowerSeries σ k, and κ=IsLocalRing.ResidueField R with the native coefficient k-algebra structure. Neither finite σ nor any characteristic, algebraic-closure, completeness or finite-field assumption is imposed.
- M is an additive commutative group with R-module and k-module structures and IsScalarTower k R M for the native coefficient algebra k→R.

Proof/construction:

1. By the surjective native coefficient map onto κ(R), the built scalar restriction theorem identifies length_k κ(R) with length_κ(R) κ(R)=1.
2. By surjectivity of the native residue map k→κ(k), the same module length over κ(k) is one. All scalar towers are the inherited quotient/algebra towers, not newly assigned actions.
3. Apply the built IsLocalRing.length_restrictScalars to A=k, B=R and M. The coefficient map is local because its source is a field. Its residue factor is one; multiplication by one in extended naturals gives the stated equality.
4. The built proof handles finite-length composition series and the infinite-length branch. No new generic filtration or local-extension-length theorem is planned. The coefficient inclusion k→R need not be onto.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/series-residue-coefficients-surjective, mathlib:IsLocalRing.residue_surjective, mathlib:IsLocalRing.length_restrictScalars, mathlib:Module.length_eq_of_surjective, mathlib:Module.length_eq_one.

Source: LocalRing/Length.lean length_restrictScalars with A=k, B=R; native quotient scalars. Specialize existing native constructions and theorems to series over a field; no generic residue field, scalar restriction or module-length theorem is replanned.

### Finite series-module length from coefficient dimension

Identifier: DeformationAndDerivedPatchingAlgebra:R03.3/series-module-finite-length. Proposed declaration: TauCeti.HilbertSamuel.seriesModule_length_eq_finrank.

For any compatible R-module M finite over k, length_R M=(finrank_k M:ℕ∞). Finiteness over R alone is insufficient for this conclusion.

Hypotheses:

- σ is any type, k is a field, R=MvPowerSeries σ k, and κ=IsLocalRing.ResidueField R with the native coefficient k-algebra structure. Neither finite σ nor any characteristic, algebraic-closure, completeness or finite-field assumption is imposed.
- M is an additive commutative group with R-module and k-module structures and IsScalarTower k R M for the native coefficient algebra k→R.
- Module.Finite k M.

Proof/construction:

1. Apply series-module-length to compare the actual R-module length with k-module length.
2. Use the built Module.length_eq_finrank over the coefficient field with the stated finite k-module hypothesis. The natural finrank is explicitly cast to extended naturals.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/series-module-length, mathlib:Module.length_eq_finrank.

Native test signatures:

- HilbertSamuelResidueTest.residue_module_length (computation): For the actual residue R-module κ(R), length_R κ(R)=1.
- HilbertSamuelResidueTest.zero_module_length (degenerate): For the native zero module Fin 0→κ(R), length_R(Fin 0→κ(R))=0.
- HilbertSamuelResidueTest.residue_pair_length (computation): For the native product κ(R)×κ(R) with componentwise R-action, length_R(κ(R)×κ(R))=2, using its actual finite coefficient module structure.

Source: Length.lean finite field length after the local-ring specialization. Specialize existing native constructions and theorems to series over a field; no generic residue field, scalar restriction or module-length theorem is replanned.

### Finiteness of the native total jet

Identifier: DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-finite. Proposed declaration: TauCeti.HilbertSamuel.totalJetBasis_finite.

For any finite σ, any commutative k and every r≥0, the actual ideal quotient R/v^r is a finite k-module, where v is the algebraic ideal span of the native variables. Promote the existing totalJetBasis_finite API to a node because the ring-length adapter consumes it.

Hypotheses:

- σ is finite, k is a commutative ring, R=MvPowerSeries σ k, v=span{X_i}, and r is a natural cutoff; r=0 is included.

Proof/construction:

1. Use the existing total-jet-monomial-basis construction indexed by exponent vectors of degree<r.
2. The index is finite by the built finite_of_degree_lt. Apply the native Module.Finite.of_basis to this finite actual basis. This is the same existing API declaration, not a second finiteness construction.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-monomial-basis, mathlib:Finsupp.finite_of_degree_lt, mathlib:Module.Finite.of_basis.

Source: Existing totalJetBasis_finite API; same actual quotient and finite basis. Specialize existing native constructions and theorems to series over a field; no generic residue field, scalar restriction or module-length theorem is replanned.

### Ring-module length of a total jet

Identifier: DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-ring-length. Proposed declaration: TauCeti.HilbertSamuel.totalJet_length_eq_finrank.

For a field k, finite σ and every r≥0, length_R(R/v^r)=finrank_k(R/v^r), in extended naturals, using the actual quotient R-action. No numerical monomial count is assumed in this statement.

Hypotheses:

- σ is finite, k is a field, R=MvPowerSeries σ k, v=span{X_i}, r∈ℕ; the native coefficient/quotient scalar tower is used.

Proof/construction:

1. Install exactly the finite k-module instance supplied by the promoted total-jet-finite node.
2. Apply series-module-finite-length to the actual quotient with its native R-action, coefficient k-action and inherited scalar tower. This specializes the generic built length comparison through the explicit residue-degree-one proof.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-finite, DeformationAndDerivedPatchingAlgebra:R03.3/series-module-finite-length.

Source: Native quotient module structure plus the promoted finite-basis API. Specialize existing native constructions and theorems to series over a field; no generic residue field, scalar restriction or module-length theorem is replanned.

### Length of a two-variable total jet

Identifier: DeformationAndDerivedPatchingAlgebra:R03.3/plane-total-jet-ring-length. Proposed declaration: TauCeti.HilbertSamuel.planeTotalJet_length.

For every field k and every r≥0, R=k[[X_0,X_1]] with v=(X_0,X_1) satisfies length_R(R/v^r)=binom(r+1,2), cast to extended naturals. This is the native R-module length, including the zero cutoff.

Hypotheses:

- k is a field, σ=Fin 2, R=MvPowerSeries (Fin 2) k, v=span{X_0,X_1}, and r∈ℕ. No assumption on characteristic, algebraic closure, perfectness or an equation f.

Proof/construction:

1. Apply total-jet-ring-length with σ=Fin 2 to compare the actual ring-module length with coefficient dimension.
2. Use the existing plane-total-jet-finrank node, whose basis count is binom(r+1,2). Cast its natural equality into extended naturals.
3. For Hilbert–Samuel index N use r=N+1, giving binom(N+2,2). This ambient jet length alone does not compute a curve quotient or intrinsic/ambient multiplicity.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-ring-length, DeformationAndDerivedPatchingAlgebra:R03.3/plane-total-jet-finrank.

Native test signatures:

- HilbertSamuelResidueTest.ring_jet_length_six (computation): For k=F₂, σ=Fin 2 and r=3, length_R(R/v³)=6 using the actual native R-action; a rectangular cutoff gives 9 and fails.

Source: Inherited two-variable count combined with the residue-aware R-length adapter. Specialize existing native constructions and theorems to series over a field; no generic residue field, scalar restriction or module-length theorem is replanned.


Validation of this continuation: the indexed packet checker and four-file
intake check pass with zero errors and warnings. The entire Mathlib-only
suggested file has zero Lean errors, 270 admitted-proof warnings and no other
warnings, with 126 examples. It checked in 22.51 seconds at maximum RSS
3,540,004 KiB after 67 GiB available memory was measured. Its SHA-256 is
`a574278b8c31753aff401ffd3312ce400c28e40bb90172005cef7a51efbfebec`.
The separate complete residue/length prototype has zero errors or warnings,
seven canonical-signature matches, seven axiom audits and six proved examples;
it checked in 1.60 seconds at maximum RSS 2,505,544 KiB. The handoff gives the
immutable source and extraction recipe. No library build, project setup,
cache download or language server was used.

The actual assembler lists 149 declarations for the whole roadmap, 96 for
this part, and nineteen/thirteen planets respectively, with no skipped links
for this roadmap. The stage graph (3,003 vertices, 8,623 edges), own declaration
graph (96 vertices, 143 edges) and combined graph (3,087 vertices, 8,863 edges)
are acyclic. All 89 old node objects, stage edges and other skipped-link records
match the control. Twelve of thirteen scope/request stage pairs are reachable;
the inherited LocalFields layer-0 to R03.4 path remains absent and recorded.

## Actual plane-curve jets and sharp cumulative postulation

Fix a field k, the native two-variable formal series ring R=k[[x,y]], the variable ideal v=(x,y), an equation f, its principal ideal I, the actual quotient A=R/I and the image ideal q. For finite order d=ord(f), retain d=0 (a unit), positive characteristic and nonreduced equations. The zero equation has infinite order and receives its own statement. No perfectness, algebraic closure or reducedness is imposed.

Write H(N)=length_A(A/q^(N+1)) and G(N)=length_A(q^N/q^(N+1)), using the existing function and native successive-subquotient gradedFunction. All lengths begin in extended naturals. The shift N+1 is part of the cumulative convention. The scalar comparison below concerns the surjection R→A; the inclusion k→R is not surjective.

For N≥d, multiplication by f acts on R/v^(N+1−d), followed by the actual quotient projection from R/v^(N+1). Order multiplicativity makes this map injective; its image is exactly the projection kernel. Length additivity gives a sum before subtraction. The ambient monomial basis has total degree below the cutoff, giving binom(r+1,2); rectangular truncation would count incorrectly. The target is a quotient of this finite ambient jet, hence has finite length. Only then convert to natural values and subtract. For N<d the equation already belongs to v^(N+1), so the quotient equals the ambient jet; do not assert an injective multiplication map at this cutoff.

The native double-quotient equivalence and ideal-image power identity identify A/q^(N+1) with R/((f)+v^(N+1)), preserving its restricted R-action. The surjective scalar-length theorem then compares length over A with length over R. This adapter is registered separately from the numerical formula so its action, carrier and denominator cannot disappear into a dimension assumption.

For every N≥0 the cumulative function is binom(N+2,2)−binom(N+2−d,2), using truncated natural subtraction before the extended-natural cast. Its successive native quotient has length min(N+1,d). At N=0 the last term in quotient_length_succ is A/top=0; no negative-index value or extra zero-degree API is used.

The rational polynomial is P_d(T)=d(T+1)−d(d−1)/2. In this expression all subtractions are ordinary rational subtraction, independent of the characteristic of k. The exact defect H(N)−P_d(N) is binom(d−N−1,2), with the binomial argument truncated naturally. Consequently H(N)=P_d(N) exactly when d≤N+2. The least cumulative agreement index is max(0,d−2), while the graded function stabilizes at max(0,d−1). For d=4, H at N=0,1,2,3,4 is 1,3,6,10,14, P is −2,2,6,10,14 and G is 1,2,3,4,4.

The polynomial specialization uses the existing constructor and the uniqueness in its existence theorem directly. Its actual quotient must carry the explicit Noetherian/local instances and q must have radical equal to the maximal ideal. The jet computations themselves do not require these hypotheses or assert a nontrivial local-ring structure on a unit equation's zero quotient. The zero equation instead has the ambient quadratic function binom(N+2,2).

### Length balance for a shifted equation jet

Declaration: `TauCeti.HilbertSamuel.planeEquationJet_length_balance`; node `DeformationAndDerivedPatchingAlgebra:R03.3/plane-equation-jet-length-balance`.

If d≤N and order(f)=d, length_R(R/v^(N+1)) = length_R(R/v^(N+1−d)) + length_R(R/((f)+v^(N+1))) in extended naturals.

Hypotheses: k is any field; R=MvPowerSeries (Fin 2) k, v=span of its two variables, I=(f), A=R/I, q=v.map(R→A), N,d∈ℕ. The equation-order hypothesis order(f)=d in extended naturals excludes f=0 and includes units d=0. No reducedness, irreducibility, perfectness, algebraic-closure or characteristic assumption.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/shifted-jet-map`, `DeformationAndDerivedPatchingAlgebra:R03.3/shifted-jet-injective`, `DeformationAndDerivedPatchingAlgebra:R03.3/shifted-jet-exact`, `mathlib:Module.length_eq_add_of_exact`.

Proof plan:

1. Use exactly shiftedJetMap f d N and jetProjection f N, on source cutoff N+1−d and target cutoff N+1. The listed injectivity and exactness nodes supply the three hypotheses of the built length theorem.
2. Apply Module.length_eq_add_of_exact over R before taking natural values. This identity needs no cancellation of an infinite length and asserts no injection in the separate N<d branch.

Acceptance: d=0 is allowed; N=d is the first shifted cutoff. Never use the same unshifted source and target.

Source: credited mathematical checkpoint §2.2–2.3, equation (1) in [the immutable predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/ab76ddae905be2ec38836c070c5495c6d1c4e3c0/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md).

### All-index length of an equation jet

Declaration: `TauCeti.HilbertSamuel.planeEquationJet_length`; node `DeformationAndDerivedPatchingAlgebra:R03.3/plane-equation-jet-length`.

If order(f)=d, length_R(R/((f)+v^(N+1))) = binom(N+2,2) − binom(N+2−d,2), with truncated natural subtraction before the extended-natural cast.

Hypotheses: k is any field; R=MvPowerSeries (Fin 2) k, v=span of its two variables, I=(f), A=R/I, q=v.map(R→A), N,d∈ℕ. The equation-order hypothesis order(f)=d in extended naturals excludes f=0 and includes units d=0. No reducedness, irreducibility, perfectness, algebraic-closure or characteristic assumption.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/plane-equation-jet-length-balance`, `DeformationAndDerivedPatchingAlgebra:R03.3/plane-total-jet-ring-length`, `DeformationAndDerivedPatchingAlgebra:R03.3/jet-below-equation-order`, `mathlib:Module.length_le_of_surjective`.

Proof plan:

1. Split d≤N from N<d. In the first branch use the extended-natural length balance and the ambient jet length at cutoffs N+1 and N+1−d.
2. The actual jetProjection is surjective; its target length is bounded by the finite ambient jet length. Thus the target is not infinity. Take natural values only now; cancel the finite additive identity in ℕ. The source count is binom(N+2−d,2).
3. In the second branch jetProjection_below_order makes (f)+v^(N+1)=v^(N+1). Its length is the ambient triangular count. N+2−d≤1 makes the subtracted binomial zero. For d=0 both counts cancel.

Acceptance: Includes unit equations, low cutoffs and nonreduced equations over finite fields. Does not treat the zero equation as order zero.

Source: credited mathematical checkpoint §2.2–2.3, equations (1)–(2) in [the immutable predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/ab76ddae905be2ec38836c070c5495c6d1c4e3c0/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md).

### Native curve-jet length comparison

Declaration: `TauCeti.HilbertSamuel.planeCurve_jet_length`; node `DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-jet-length`.

For every f, including f=0 and units, the actual cumulative function H_q,A(N) equals length_R(R/((f)+v^(N+1))) in extended naturals.

Hypotheses: k is any field, R=k[[x,y]], v=(x,y), f is arbitrary, A=R/(f), q is the image of v and N∈ℕ.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-function`, `mathlib:Ideal.smul_top_eq_map`, `mathlib:Ideal.map_pow`, `mathlib:DoubleQuot.quotQuotEquivQuotSupₐ`, `mathlib:Module.length_eq_of_surjective`, `mathlib:LinearEquiv.length_eq`, `DeformationAndDerivedPatchingAlgebra:R03.3/quotient-ring-function`.

Proof plan:

1. Specialize quotient-ring-function to the ambient commutative ring k[[x,y]], the equation ideal (f), the variable ideal v and index N. This is the actual existing function and actual quotient-ring image ideal.
2. The resulting extended-natural identity is exactly the stated native curve-jet comparison. Unit and zero equations are included without a local or finite-length assumption. The built quotient/scalar facts in the inherited prerequisite list supply the generic adapter; no jet count, shifted-map or variable-ideal/order theorem is consumed here.

Acceptance: No finite-length, Noetherian or nontrivial local-ring hypothesis is needed for this extended-natural identity.

Source: credited mathematical checkpoint §2.3, actual curve quotient comparison in [the immutable predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/ab76ddae905be2ec38836c070c5495c6d1c4e3c0/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md).

### Cumulative function of a formal plane curve

Declaration: `TauCeti.HilbertSamuel.planeCurve_function`; node `DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-function`.

If order(f)=d, H_q,A(N)=binom(N+2,2)−binom(N+2−d,2) in extended naturals for every N≥0.

Hypotheses: k is any field; R=MvPowerSeries (Fin 2) k, v=span of its two variables, I=(f), A=R/I, q=v.map(R→A), N,d∈ℕ. The equation-order hypothesis order(f)=d in extended naturals excludes f=0 and includes units d=0. No reducedness, irreducibility, perfectness, algebraic-closure or characteristic assumption.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-jet-length`, `DeformationAndDerivedPatchingAlgebra:R03.3/plane-equation-jet-length`.

Proof plan:

1. Rewrite the actual function using planeCurve_jet_length and apply planeEquationJet_length. The finite natural cast proves each function value is finite before later toNat conversions.

Acceptance: For f=x, H(N)=N+1. For f=x⁴, H(0),H(1),H(2),H(4)=1,3,6,14. For a unit all values vanish.

Source: credited mathematical checkpoint §2.3, equation (2) in [the immutable predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/ab76ddae905be2ec38836c070c5495c6d1c4e3c0/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md).

### Graded function of a formal plane curve

Declaration: `TauCeti.HilbertSamuel.planeCurve_gradedFunction`; node `DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-graded-function`.

If order(f)=d, the existing native successive-quotient gradedFunction q N equals min(N+1,d), cast to extended naturals.

Hypotheses: k is any field; R=MvPowerSeries (Fin 2) k, v=span of its two variables, I=(f), A=R/I, q=v.map(R→A), N,d∈ℕ. The equation-order hypothesis order(f)=d in extended naturals excludes f=0 and includes units d=0. No reducedness, irreducibility, perfectness, algebraic-closure or characteristic assumption.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/graded-hilbert-function`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-quotient-length-step`, `DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-function`.

Proof plan:

1. Use quotient_length_succ on the actual A-module A. For N≥1 its left term is H(N) and its last term is H(N−1); at N=0 that last quotient is A/top with length zero. This handles the boundary without an undeclared negative index or a separately consumed gradedFunction_zero_degree API.
2. The sum equals finite H(N), so both summands are finite; convert to natural values, then subtract. Apply the all-index binomial formula at the appropriate nonnegative indices.
3. Split N+1≤d and d<N+1; the differences of adjacent triangular numbers give respectively N+1 and d. With d=0 every value is zero. The carrier remains the native quotient inside the actual q^N submodule.

Acceptance: Graded stabilization starts at max(0,d−1), one index later than cumulative agreement for d≥2. Over F₂, f=x⁴ gives G(2)=3 and G(3)=4.

Source: credited mathematical checkpoint §2.4, equation (3) in [the immutable predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/ab76ddae905be2ec38836c070c5495c6d1c4e3c0/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md).

### Exact cumulative postulation defect

Declaration: `TauCeti.HilbertSamuel.planeCurve_postulation_defect`; node `DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-postulation-defect`.

If order(f)=d, H_q,A(N).toNat − [d(N+1)−d(d−1)/2] = binom(d−N−1,2) in ℚ, where subtraction inside binomial arguments is natural, and all polynomial arithmetic is rational.

Hypotheses: k is any field; R=MvPowerSeries (Fin 2) k, v=span of its two variables, I=(f), A=R/I, q=v.map(R→A), N,d∈ℕ. The equation-order hypothesis order(f)=d in extended naturals excludes f=0 and includes units d=0. No reducedness, irreducibility, perfectness, algebraic-closure or characteristic assumption.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-function`.

Proof plan:

1. The function formula is a finite natural cast, so its toNat is exactly the binomial difference. Do not use toNat on an unproved infinite length.
2. Split d≤N+2 from N+2<d. In the first case expand the two binomials using choose(n,2)=n(n−1)/2 and the cutoff cases 0,1; the defect is zero. In the second case the source binomial is zero and expanding the ambient triangular number leaves (d−N−1)(d−N−2)/2.
3. Carry the minus signs in ℚ; clearing denominator 2 is valid regardless of the field characteristic because lengths have been converted to rational numbers.

Acceptance: For d=4, N=0,1,2 the defects are 3,1,0. A negative polynomial value at N=0 does not truncate rational subtraction.

Source: credited mathematical checkpoint §3, equation (4) and its two-branch arithmetic proof in [the immutable predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/ab76ddae905be2ec38836c070c5495c6d1c4e3c0/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md).

### Sharp cumulative agreement threshold

Declaration: `TauCeti.HilbertSamuel.planeCurve_postulation_iff`; node `DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-postulation-iff`.

If order(f)=d, H_q,A(N).toNat = d(N+1)−d(d−1)/2 in ℚ if and only if d≤N+2.

Hypotheses: k is any field; R=MvPowerSeries (Fin 2) k, v=span of its two variables, I=(f), A=R/I, q=v.map(R→A), N,d∈ℕ. The equation-order hypothesis order(f)=d in extended naturals excludes f=0 and includes units d=0. No reducedness, irreducibility, perfectness, algebraic-closure or characteristic assumption.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-postulation-defect`.

Proof plan:

1. The defect identity makes agreement equivalent to choose(d−N−1,2)=0. For natural m, choose(m,2)=0 exactly when m≤1; use the 0,1 cases and positivity for m≥2.
2. Natural truncated-subtraction arithmetic identifies d−N−1≤1 with d≤N+2. Thus the least cumulative agreement index is max(0,d−2), including d=0,1,2.

Acceptance: For f=x⁴, cumulative agreement first holds at N=2, while the graded value at N=2 is still 3.

Source: credited mathematical checkpoint §3, equation (5) and sharpness paragraph in [the immutable predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/ab76ddae905be2ec38836c070c5495c6d1c4e3c0/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md).

### Cumulative polynomial of a formal plane curve

Declaration: `TauCeti.HilbertSamuel.planeCurve_polynomial`; node `DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-polynomial`.

For the actual A=R/(f) supplied with IsNoetherianRing and IsLocalRing and q.radical=maximalIdeal(A), and order(f)=d, the existing cumulative polynomial q is d(T+1)−d(d−1)/2 in ℚ[T].

Hypotheses: k is any field; R=MvPowerSeries (Fin 2) k, v=span of its two variables, I=(f), A=R/I, q=v.map(R→A), N,d∈ℕ. The equation-order hypothesis order(f)=d in extended naturals excludes f=0 and includes units d=0. No reducedness, irreducibility, perfectness, algebraic-closure or characteristic assumption. Additionally A has the stated Noetherian/local instances and q.radical=maximalIdeal(A).

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-polynomial`, `DeformationAndDerivedPatchingAlgebra:R03.3/eventual-hilbert-samuel-polynomial`, `DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-postulation-iff`.

Proof plan:

1. Form the displayed explicit rational polynomial. Its evaluation is the rational expression in planeCurve_postulation_iff. For N≥d, d≤N+2 supplies an eventual-equality witness (the sharper d−2 witness also works).
2. Use uniqueness directly in existsUnique_polynomial to compare this witness with the Classical.choose witness defining the existing polynomial. No additional polynomial_unique API is consumed or redefined.
3. The local and Noetherian instances and radical equality are explicit assumptions on this actual quotient. The finite-jet formula itself did not require them. A unit equation does not supply a nontrivial IsLocalRing instance on the zero quotient.

Acceptance: No new polynomial carrier or caller-supplied Hilbert polynomial; this specialization does not prove the general existence node or native curve dimension.

Source: credited mathematical checkpoint §3, paragraph identifying the existing polynomial in [the immutable predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/ab76ddae905be2ec38836c070c5495c6d1c4e3c0/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md).

### Cumulative function of the zero equation

Declaration: `TauCeti.HilbertSamuel.planeZeroEquation_function`; node `DeformationAndDerivedPatchingAlgebra:R03.3/plane-zero-equation-function`.

For f=0, A=R/(0), q=image(v), the actual H_q,A(N)=binom(N+2,2) in extended naturals.

Hypotheses: k is any field, R=k[[x,y]], f=0, A=R/(0), q=image(v), N∈ℕ.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-jet-length`, `DeformationAndDerivedPatchingAlgebra:R03.3/plane-total-jet-ring-length`.

Proof plan:

1. Use planeCurve_jet_length without a finite-order hypothesis. The ideal generated by zero is zero, so its sum with v^(N+1) is v^(N+1). Apply the ambient plane total-jet length.

Acceptance: Over F₂, H(2)=6. Zero has infinite native order and never belongs in the d=0 unit case.

Source: credited mathematical checkpoint §2.3, zero-equation paragraph in [the immutable predecessor handoff](https://github.com/CBirkbeck/tauceti-explorer/blob/ab76ddae905be2ec38836c070c5495c6d1c4e3c0/research/blueprint/handoff/BP-DeformationAndDerivedPatchingAlgebra--P7.md).

### Acceptance examples and proof boundary

- `PlaneCurveAcceptance.unit_boundary` (degenerate): For k=ℚ, f=1 and every N, the actual curve function is zero.
- `PlaneCurveAcceptance.zero_equation_six` (computation): For k=F₂, f=0 and N=2, the actual function equals 6.
- `PlaneCurveAcceptance.smooth_linear` (computation): For k=ℚ, f=x and every N, the actual function equals N+1.
- `PlaneCurveAcceptance.nonreduced_cumulative` (non-example): For k=F₂, f=x⁴, H(0)=1, H(1)=3, H(2)=6 and H(4)=14; a formula imposing polynomial agreement at N=0 fails.
- `PlaneCurveAcceptance.nonreduced_graded` (non-example): For k=F₂, f=x⁴, G(2)=3 and G(3)=4; confusing cumulative and graded stabilization fails.
- `PlaneCurveAcceptance.below_equation_order` (degenerate): For k=ℚ, f=x¹⁰⁰ and N=2, H(2)=6; unshifted multiplication cannot provide the injective map at this cutoff.

These six statements appear as admitted examples on actual native quotients in the suggested file. Exact arithmetic on finite jets is an additional regression; it proves no infinite-series assertion. The actual curve-jet comparison, shifted length balance, all-index cumulative/graded formulas, rational defect, sharp agreement and explicit cumulative-polynomial specialization now have separate native signatures and mathematical proof plans. Their submitted bodies and inherited ideal-power/order, shifted-sequence and jet basis/count bodies remain unchecked. Prove those native bodies, the tangent-cone kernel, curve dimension and intrinsic/ambient multiplicity comparisons. General Hilbert–Serre induction, degree/dimension, completion, Artin–Rees, associativity suppliers and all routed-paper obligations remain open.

The 96 inherited node objects, reserved multiplicity definition, owner imports, requests, source issues, paper routes and planet choices remain unchanged. This computation creates no new multiplicity definition and does not assert curve dimension through polynomial degree. Source reading and current compilation receipts are in the handoff; historical reader receipts describe their original checkpoints.

## Quotient-ring Hilbert–Samuel functions — codex-rtOQ9t

The plane-curve comparison is an instance of a general equation-ideal calculation. Keep the raw cumulative index n+1 and extended-natural length. Existing ideal quotients, the third isomorphism theorem and scalar descent supply all carriers; this continuation adds their reusable Hilbert–Samuel interface. It neither assumes nor supplies numerical jet dimensions.

### Quotient-ring Hilbert–Samuel comparison

Declaration: `TauCeti.HilbertSamuel.function_ringQuotient`; node `DeformationAndDerivedPatchingAlgebra:R03.3/quotient-ring-function`.

For B=A/I and q=image(J), H(q,B,n)=length_A(A/(I+J^(n+1))) for every n≥0. The left side is length over B and the right side is length over A.

Hypotheses: A is any commutative ring with identity, I and J are any ideals, B=A/I with its native quotient algebra structure, q=J.map(A→B), and n is a natural number. All lengths use the native scalar actions and take values in extended naturals. No field, local, Noetherian, proper-ideal or finite-length assumption.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-function`, `mathlib:Ideal.smul_top_eq_map`, `mathlib:Ideal.map_pow`, `mathlib:Ideal.Quotient.mk_surjective`, `mathlib:DoubleQuot.quotQuotEquivQuotSupₐ`, `mathlib:Module.length_eq_of_surjective`, `mathlib:LinearEquiv.length_eq`.

Proof plan:

1. Unfold the raw quotient-length function on the regular B-module. The existing ideal action on its top submodule is its actual ideal q^(n+1); transport the quotient along this equality.
2. Use Ideal.map_pow to identify q^(n+1) with the image of J^(n+1) under the native quotient map. Apply DoubleQuot.quotQuotEquivQuotSupₐ with coefficient ring A and ideals I,J^(n+1); its underlying A-linear equivalence identifies the actual double quotient with A/(I+J^(n+1)).
3. Ideal.Quotient.mk_surjective proves that A→B is surjective. Module.length_eq_of_surjective compares the B-length of the double quotient with its restricted A-length. LinearEquiv.length_eq then transports that length through the existing equivalence. No finite-length conversion or coefficient-field comparison is used.

Acceptance: For I=A the quotient is zero and the function is zero, with no nontrivial local-ring instance. For I=0 recover the ambient regular-module function, even when that value is infinite.

### Equation ideals below a jet cutoff

Declaration: `TauCeti.HilbertSamuel.function_ringQuotient_of_le`; node `DeformationAndDerivedPatchingAlgebra:R03.3/quotient-ring-function-below-ideal`.

If I⊆J^(n+1), then H(image(J),A/I,n)=length_A(A/J^(n+1)). Thus an equation ideal already contained in the cutoff denominator leaves this actual jet length unchanged.

Hypotheses: A is any commutative ring with identity, I and J are any ideals, B=A/I with its native quotient algebra structure, q=J.map(A→B), and n is a natural number. All lengths use the native scalar actions and take values in extended naturals. No field, local, Noetherian, proper-ideal or finite-length assumption. I⊆J^(n+1).

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/quotient-ring-function`.

Proof plan:

1. Apply quotient-ring-function to the actual quotient and image ideal.
2. The assumed containment gives I+J^(n+1)=J^(n+1). Rewrite only this denominator; no equation-order or basis theorem is required.

Acceptance: For A=(Z/4)[[x,y]], J=(x,y), I=(x³) and n=0, the same identity holds although the coefficient ring has zero divisors. The containment is in the actual ideal power; no asserted order or dimension datum substitutes for it.

### Hilbert–Samuel antitonicity in the equation ideal

Declaration: `TauCeti.HilbertSamuel.function_ringQuotient_antitone`; node `DeformationAndDerivedPatchingAlgebra:R03.3/quotient-ring-function-antitone`.

If I⊆I′, then H(image(J),A/I′,n)≤H(image(J),A/I,n), with each ideal image formed in its own actual quotient ring. This is an inequality in extended naturals and may be strict.

Hypotheses: A is any commutative ring with identity, I and J are any ideals, B=A/I with its native quotient algebra structure, q=J.map(A→B), and n is a natural number. All lengths use the native scalar actions and take values in extended naturals. No field, local, Noetherian, proper-ideal or finite-length assumption. I′ is another ideal of A and I⊆I′.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/quotient-ring-function`, `mathlib:Submodule.factor`, `mathlib:Submodule.factor_surjective`, `mathlib:Module.length_le_of_surjective`.

Proof plan:

1. Apply quotient-ring-function separately to I and I′.
2. The containment gives I+J^(n+1)⊆I′+J^(n+1). Use the existing A-linear Submodule.factor between these actual quotients, which is surjective by Submodule.factor_surjective.
3. Apply Module.length_le_of_surjective over A. All scalar rings now agree, so no comparison between unrelated quotient-ring module lengths is assumed.

Acceptance: For A=F₂, J=0, n=0, I=0 and I′=A, the resulting inequality is strictly 0<1. Equal equation ideals give equality; reversing the containment reverses the applicable quotient map.

### API uses and discriminating examples

The existing `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-function` definition exports all three declarations above as its API. The curve-jet node consumes the first; low-index jets consume the containment specialization after proving the independent ideal/order input; imposing more equations consumes the antitone comparison. The four original API items and four original tests remain unchanged.

- `HilbertSamuelQuotientTest.unit_equation` (degenerate): For every commutative A, ideal J and n≥0, H(image(J),A/A,n)=0, including a zero quotient ring.
- `HilbertSamuelQuotientTest.zero_equation` (compatibility): For every commutative A, ideal J and n≥0, H(image(J),A/0,n)=H(J,A,n) in extended naturals.
- `HilbertSamuelQuotientTest.field_one` (computation): For A=F₂, I=J=0 and every n≥0, H(image(J),A/I,n)=1, including the zeroth jet.
- `HilbertSamuelQuotientTest.strict_quotient` (non-example): For A=F₂, J=0, n=0, I=0 and I′=A, H(image(J),A/I′,0)<H(image(J),A/I,0): the values are 0<1. Reversing quotient antitonicity is false.
- `HilbertSamuelQuotientTest.nonreduced_coefficients` (compatibility): For A=(Z/4)[[x,y]], J=(x,y), I=(x³) and n=0, H(image(J),A/I,0)=length_A(A/J¹). No coefficient-domain hypothesis is available.
- `HilbertSamuelQuotientTest.nonsurjective_coefficients` (non-example): For the native coefficient inclusion ℝ→ℂ, length_ℝ(ℂ)=2 while length_ℂ(ℂ)=1. Dropping the surjectivity premise from scalar-length equality is false.

### Source and implementation boundary

[Stacks 10.52](https://stacks.math.columbia.edu/tag/00IU), Definition 10.52.1 and Lemmas 10.52.3 and 10.52.5, supplies ordinary extended length and the surjective scalar comparison. [Stacks 10.59](https://stacks.math.columbia.edu/tag/00K4), opening formulas and the ideal-of-definition variant, fixes the cumulative index. The native third-isomorphism quotient comparison is a derived argument above, not a claim that Stacks states this named Hilbert–Samuel lemma. The six new baseline records are built facts, used chiefly in the actual examples, not new blueprint definitions. Exact pins and repeatable proof/validation receipts are in the current handoff.

This continuation preserves all 105 inherited node statements, hypotheses, acceptance clauses and source citations, and all complete objects except the function API/uses/tests and the plane-curve proof/prerequisite refinement. There are 108 nodes, 114 API items, 98 definition/construction tests (115 total test records), 13 planets, 225 baseline references, 15 gaps and 2 requests. The reserved general multiplicity definition is unchanged. All eight stages keep their partial/not_read status. The standalone native comparison and examples have checked proofs; canonical signatures retain admitted bodies and all implementations remain unchecked. The general quotient-ring comparison, equation-containment adapter, quotient antitonicity and exact existing plane-curve scalar comparison now have admission-free native proof prototypes and six checked boundary examples. Canonical signatures remain admitted and all nodes unchecked. The numerical jet counts, ideal-power/order theorem, shifted multiplication/exactness, tangent-cone kernel, curve dimension, intrinsic/ambient multiplicity, general Hilbert–Serre, completion, Artin–Rees, associativity and every inherited routed-paper obligation remain open.


## Principal-ideal multiplication before the series-order comparison

The finite-jet length argument uses a ring-level exactness statement which is independent of the series-order calculation. Let A be any commutative ring, J and K actual ideals, and f∈A with fJ⊆K. Define **TauCeti.HilbertSamuel.quotientMulMap** as the native A-linear multiplication map μ:A/J→A/K, [g]↦[fg]. Its projection **principalQuotientProjection** is the native factor π:A/K→A/((f)+K), [g]↦[g]. The APIs **quotientMulMap_apply** and **principalQuotientProjection_apply** fix these representatives. No alternative jet carrier or algebra-homomorphism multiplication is used.

The lemma **quotientMulMap_exact** proves range μ=ker π and surjectivity of π for every such J. A kernel representative x lies in (f)+K, so x=af+b with b∈K; its source preimage is the actual class [a]_J. Conversely π kills every multiple of f. This proves the right-exact assertion over arbitrary rings, including rings with zero divisors and the zero equation. It neither assumes nor concludes injectivity. Its actual quotient target can subsequently be compared with a quotient-ring Hilbert–Samuel function by the preceding quotient-ring length adapter.

The lemma **quotientMulMap_injective_iff** identifies the additional condition: fg∈K must imply g∈J for every g∈A. Equivalently J is exactly the submodule preimage of K under native linear multiplication by f. This is the condition the shifted series proof must obtain from exact finite order, order additivity and the variable-ideal-power-order comparison. Even if A is a domain, the choice of source ideal matters: multiplication by 2 on ℤ/(4) kills the nonzero class of 2. Over ℤ/4 with J=K=0 and f=2, the maps are right exact and π is surjective, while μ is not injective.

The lemma **pow_mul_denominator** supplies an algebraic denominator route. For any ideal q, d≤n and f∈q^d, multiplication sends q^(n−d) into q^n, by ideal multiplication membership and q^d q^(n−d)=q^n. At d=n the source is q^0=A; at n=d=0 all f are allowed. Specializing n=N+1 connects this to the existing guarded shifted-jet map once its separate order-to-ideal adapter proves f∈v^d. Over ℤ/4, q=(2), d=1,n=2, the actual shifted map sends [1] modulo q to the nonzero class [2] modulo q². This distinguishes the intended map from a zero-map replacement.

If f∈K, **principalQuotientProjection_bijective** gives (f)+K=K and bijectivity of the actual projection. This is the algebra behind the small-index branch; the series proof still has to establish f∈v^(N+1). It supplies no unguarded shifted injectivity assertion for N<d.

The construction has five registered tests: **HilbertSamuelPrincipalJetTest.zero_equation**, **unit_equation**, **zero_divisor_noninjective**, **nonzero_shift** and **wrong_source_domain**. The denominator lemma also records **endpoint_denominator** and **zero_cutoff**. They respectively check the zero map and zero projection kernel, unit identity and full projection kernel, right exactness without injectivity, a genuinely nonzero shifted image, the domain/source-denominator distinction, and both zero-exponent boundaries. Every test uses the native ideal quotients and actual chosen maps.

These five declaration-sized nodes refine the source handoff’s §4 principal-image argument and are imported by the existing denominator, exactness, injectivity and small-index proof outlines. All incoming statements and acceptance contracts are preserved. The admission-free prototype checks this ring-level strand only. The canonical suggested file contains admitted signatures, all implementation statuses remain unchecked, and the variable-ideal-power-order theorem, total-jet kernel/equivalence/basis/count, plane-curve lengths and general Hilbert–Samuel multiplicity development remain required. No stage or routed paper is declared closed.

## Algebraic variable-ideal powers: finite factorization continuation

This is a partial continuation by Codex — codex-a71f92, 2 October 2026,
on issue #551, after the principal-quotient multiplication checkpoint. It
refines one prerequisite of the formal-curve comparison and does not replace
the general Hilbert–Samuel key definition. Every canonical node remains
unchecked and every stage remains open. Earlier “still unchecked” prototype
remarks concerning the variable-ideal/order adapter describe the predecessor;
the new admission-free prototype below checks precisely that adapter and its
three supporting lemmas, not the later jet or multiplicity theorems.

Let k be any commutative ring, R=MvPowerSeries σ k, and
v=Ideal.span(range(MvPowerSeries.X)), the algebraic ideal generated by the
variables. Total degree is the native additive Finsupp.degree, not a
coordinatewise cutoff. Total order is the native extended-natural order, so
order(0)=∞. No order-to-natural conversion appears. Over a finite variable set,
the comparison is g∈v^r iff r≤order(g). A field, a domain, a local-ring
structure and a residue-field interpretation of k are all unnecessary. The
forward implication and monomial membership even hold for an infinite
variable set. Finiteness is used exactly where the reverse proof sums over
the degree-r exponent fibre; it must not be erased from that implication.

The reviewed AUDIT-17 rows and accepted RS-08 owner decision keep this generic
local-algebra extension in R03.3. It neither reconstructs the upstream
ModularCurves 4D completion/regularity results nor changes any supplier edge.
The current link-packet records mentioning this roadmap were screened at the
immutable audit base. The statements concern native algebraic power series
and ideal powers, not Huber completion. Other-part promoted declarations,
including R03.6, must stay present in the actual atlas validation.

### The finite sum and its coefficient proof

Native Finsupp.exists_le_degree_eq already proves that an exponent α with
degree α≥r admits β≤α with degree β=r, without requiring finitely many
variables. This is an implementation input, not a new selector node.
Internally choose such a β=pick(α); below degree r choose zero.
Native Finsupp.finite_of_degree_eq supplies a finite set B_r of degree-r
exponents when σ is finite. Nothing here constructs a second exponent
carrier or a public choice API.

For β in B_r define a genuine native formal series by its coefficient
function: h_β(γ)=coeff_(β+γ)(g) when pick(β+γ)=β, and zero otherwise.
The claimed identity is the finite sum g=Σ_(β∈B_r) monomial β 1·h_β.
This is an equality of native formal power series. It is not the assertion
that an algebraic ideal is closed under an infinite sum, and it uses neither
a topology on R nor convergence.

At coefficient α with degree α≥r, native coeff_monomial_mul says that the
β summand contributes zero unless β≤α. In the latter case it contributes
h_β(α−β), since the monomial coefficient is one. The native exponent
identity β+(α−β)=α then says that this value is coeff_α(g) precisely
when β=pick(α), and zero otherwise. pick(α) belongs to B_r by the
library selection theorem, so finite sum_eq_single proves the equality at
that coefficient. At degree α<r, the order bound gives coeff_α(g)=0.
No β∈B_r can satisfy β≤α, since native degree_mono would imply
r≤degree α. Thus all coefficients of the finite sum vanish in that
branch. Native ext finishes the proof.

At r=0, B_0 consists of the zero exponent and the same argument gives the
constant monomial times the original series. For empty σ and r>0, B_r is
empty and every coefficient lies below r, so g=0 and the empty sum works.
A zero coefficient ring is allowed, as are zero divisors. These boundaries
are not dealt with by discarding infinity or by requiring a nonzero series.

Each monomial β 1 belongs to v^degree β. Native monomial_one_eq expresses
it as the product over the finite support of β of X_i^(β_i).
Induction over that support, pow_mem_pow and mul_mem_mul put the product
in the power indexed by the sum of exponents; native degree_apply supplies
that sum. Multiplying by h_β stays in the same ideal. Closing under the
finite sum proves the reverse implication.

For the forward implication, constantCoeff kills every variable and span_le
puts v inside its kernel. Native one_le_order_iff_constCoeff_eq_zero gives
order at least one on v. Induction on r uses the actual algebraic
v^(r+1)=v^r*v and native Submodule.mul_induction_on: products are controlled
by le_order_mul, and sums by min_order_le_add. Only the lower inequality
for product order is needed. Equality of product orders is a different
result with stronger coefficient hypotheses and is not smuggled into this
argument.

### Declaration-sized additions and tests

#### Monomials in algebraic variable-ideal powers

`DeformationAndDerivedPatchingAlgebra:R03.3/monomial-variable-ideal-power` — `TauCeti.HilbertSamuel.monomial_mem_variableIdeal_pow_degree`.

For any variable set σ, any commutative coefficient ring k, β:σ→₀ℕ and v=Ideal.span(range(X)), the native series monomial β 1 belongs to v^degree(β). No finiteness of σ or domain/nontriviality of k is required.

Hypotheses: σ is any type, k is any commutative ring, and β is a finitely supported natural exponent; v is the native algebraic variable ideal.

Proof:

1. Use native monomial_one_eq to write monomial β 1 as the product over the finite support of β of X_i^(β_i).
2. Induct over that finite support: the empty product belongs to v^0; each X_i belongs to v by subset_span, so X_i^(β_i) belongs to v^(β_i) by pow_mem_pow. Combine memberships by mul_mem_mul and pow_add.
3. Native degree_apply identifies the sum of coordinate exponents with degree β. There is no enumeration of all variables and no topological ideal closure.

Prerequisites:

- `mathlib:MvPowerSeries.monomial_one_eq`
- `mathlib:Finsupp.degree_apply`
- `mathlib:Ideal.subset_span`
- `mathlib:Ideal.pow_mem_pow`
- `mathlib:Ideal.mul_mem_mul`

Tests:

- `HilbertSamuelVariableIdealTest.constant_monomial`: The coefficient-one degree-zero monomial belongs to v^0 over every commutative k.
- `HilbertSamuelVariableIdealTest.mixed_total_degree`: Over Z/4 in two variables, the monomial with exponent 2e_0+3e_1 belongs to v^5.
- `HilbertSamuelVariableIdealTest.variable_membership`: Over Z/4 in two variables, X_0 belongs to v.

#### Order bound for algebraic variable-ideal powers

`DeformationAndDerivedPatchingAlgebra:R03.3/variable-ideal-power-order-bound` — `TauCeti.HilbertSamuel.order_lower_bound_of_mem_variableIdeal_pow`.

For any variable set σ, any commutative ring k, series g:MvPowerSeries σ k and r∈ℕ, membership g∈v^r implies (r:ℕ∞)≤g.order, where v=Ideal.span(range(X)). The implication does not require finite σ.

Hypotheses: σ is any type; k is any commutative ring, including rings with zero divisors and the zero ring. r is a natural number and g∈v^r.

Proof:

1. The native constantCoeff ring homomorphism kills every X_i. Native span_le therefore puts v in its kernel; one_le_order_iff_constCoeff_eq_zero gives order at least one on v.
2. Induct on r. The zero-power bound is 0≤order g. For v^(r+1)=v^r*v, use native Submodule.mul_induction_on on the actual algebraic product, not on a topological closure.
3. For a product a*b, combine the induction bound r≤order a and 1≤order b with le_order_mul. For an addition, combine both bounds with min_order_le_add. Keep all inequalities in ℕ∞; never replace order(0)=∞ by zero.

Prerequisites:

- `mathlib:MvPowerSeries.constantCoeff`
- `mathlib:MvPowerSeries.constantCoeff_X`
- `mathlib:Ideal.span_le`
- `mathlib:MvPowerSeries.one_le_order_iff_constCoeff_eq_zero`
- `mathlib:Submodule.mul_induction_on`
- `mathlib:MvPowerSeries.le_order_mul`
- `mathlib:MvPowerSeries.min_order_le_add`

Tests:

- `HilbertSamuelVariableIdealTest.infinite_variables_forward`: For σ=ℕ,k=Z/4, g∈v^r implies r≤order g.
- `HilbertSamuelVariableIdealTest.zero_power`: Every series lies in v^0 for arbitrary σ and commutative k.

#### Finite degree-monomial factorization

`DeformationAndDerivedPatchingAlgebra:R03.3/finite-degree-monomial-factorization` — `TauCeti.HilbertSamuel.exists_degree_monomial_factorization`.

For finite σ, any commutative ring k, native series g and r∈ℕ with (r:ℕ∞)≤g.order, there is a family h:(σ→₀ℕ)→MvPowerSeries σ k such that g=Σ_{β∈B_r} monomial β 1·h(β), where B_r={β | degree β=r} is the native finite degree fibre. The sum is finite, including r=0 and an empty B_r.

Hypotheses: σ is finite; k is any commutative ring, without a domain or nontriviality assumption. g:MvPowerSeries σ k; r∈ℕ; (r:ℕ∞)≤g.order.

Proof:

1. Use baseline finite_of_degree_eq to take the finite sum over B_r. For each exponent α of degree at least r, baseline exists_le_degree_eq supplies pick(α)≤α of degree r; below r choose zero. The choice is internal to the proof, not a new public selector or alternate exponent carrier.
2. On the native coefficient-function carrier define h(β)(γ)=coeff_(β+γ)(g) if pick(β+γ)=β, and zero otherwise. Native ext reduces the asserted finite-sum equality to equality of each coefficient.
3. If degree α≥r, use coeff_monomial_mul and β+(α−β)=α when β≤α. Exactly the summand β=pick(α) contributes coeff_α(g); every other summand vanishes. Use finite sum_eq_single.
4. If degree α<r, coeff_of_lt_order makes coeff_α(g)=0. No β∈B_r can satisfy β≤α, by degree_mono; every coefficient of the finite sum is zero. This also proves the empty-variable and r=0 boundaries without separate infinite-series convergence assertions.

Prerequisites:

- `mathlib:Finsupp.degree`
- `mathlib:Finsupp.finite_of_degree_eq`
- `mathlib:Finsupp.exists_le_degree_eq`
- `mathlib:Finsupp.degree_mono`
- `mathlib:MvPowerSeries.coeff`
- `mathlib:MvPowerSeries.ext`
- `mathlib:MvPowerSeries.coeff_monomial_mul`
- `mathlib:MvPowerSeries.coeff_of_lt_order`

Tests:

- `HilbertSamuelVariableIdealTest.zero_degree_factorization`: For every finite σ and commutative k, every series has the finite degree-zero factorization.
- `HilbertSamuelVariableIdealTest.sum_factorization`: Over Z/4 in two variables, X_0²+X_1² has a finite degree-two monomial factorization.

#### Existing comparison, now importing those lemmas

`DeformationAndDerivedPatchingAlgebra:R03.3/variable-ideal-power-order` — `TauCeti.HilbertSamuel.mem_variableIdeal_pow_iff`.

For finite σ, any commutative ring k, R=MvPowerSeries σ k and v=span{X_i | i∈σ}, a series g lies in v^r if and only if (r:ℕ∞)≤order(g), for every r≥0. This includes g=0, r=0, the empty variable set and coefficient rings with zero divisors.

Its existing hypotheses and acceptance criteria are unchanged. Its proof
imports the three additions above, and its direct ideal-multiplication leaf
is retained. No replacement key definition or wrapper ideal is introduced.

- `HilbertSamuelVariableIdealTest.zero_series`: For every finite σ and commutative k, the zero series belongs to every v^r.
- `HilbertSamuelVariableIdealTest.empty_variables`: For empty σ and k=ℚ, g∈v^r iff g=0 whenever r>0.
- `HilbertSamuelVariableIdealTest.variable_not_square`: Over Z/4 in two variables, X_0 does not belong to v².
- `HilbertSamuelVariableIdealTest.zero_coefficient_ring`: With coefficient ring ZMod 1, every series belongs to every variable-ideal power.

### Sources, checks and exact remaining work

The mathematical motivation is ChatGPT — gpt6astra-20261002-7d2f90's
DDPA-JET-HANDOFF, immutable section 3's finite-sum paragraph
(`d6bb818403e28967bc241c039a37fc503492d926159c6fcf89c8317ac7119f3c`).
That paragraph is a bounded fresh read; whole-document reads and the earlier
36,686-case finite computation are historical and are not claimed as rerun.
The finite-variable, arbitrary-coefficient extension and the explicit native
proofs are by Codex — codex-a71f92. HS-VARIABLE-IDEAL-PIN records the exact
Mathlib commit, selected statements/local assumptions and complete-file
hashes. The native coefficient/finiteness/order APIs are cited and reused,
not planned again.

The admission-free native prototype contains these three lemmas and the
existing iff, eleven boundary examples and four axiom audits. The canonical
suggested file contains matching signatures with admitted bodies and the
eleven regression statements. The handoff records exact reproducible hashes,
compiler and actual checker/intake/atlas receipts; no library implementation
or independent-review acceptance is claimed.

Next integrate the actual total-jet kernel with this comparison, construct
the quotient coefficient equivalence and monomial basis, and prove the
two-variable count. Separately establish shifted series multiplication's
injectivity from exact finite order and a suitable no-zero-divisors
coefficient hypothesis, assemble the already planned principal-quotient
exactness maps, and derive every-index curve-jet lengths. The tangent-cone
kernel, curve dimension, intrinsic-versus-ambient multiplicity comparison
and all general Hilbert–Serre, Artin–Rees, associativity/localization,
completion and routed-paper obligations remain open. The full general
finite-module/ideal-of-definition key node is unchanged. No stage is closed.

## Coefficient coordinates and finite total-jet bases

This continuation supplies the coefficient proof behind the existing native
total-jet equivalence and monomial basis. Write R=k[[X_i]] for a finite
variable type σ, v for its algebraic variable ideal, and B_r for the exponent
vectors of total degree strictly below r. The coefficient ring k is any
commutative ring. The constructions include r=0, empty σ and the zero ring.
No topological closure of an ideal is used.

The checked ideal-power/order comparison reduces equality in R/v^r to
equality of low coefficients. Descend those coefficients to a k-linear map
C_r:R/v^r→(B_r→k). Injectivity is exactly this equality criterion. For any
tuple c, the formal series whose low coefficients are c and whose other
coefficients are zero proves surjectivity. These are actual native quotient
and series carriers. The resulting linear equivalence feeds the native
finite-coordinate basis constructor; its basis vectors are the classes of
monomials with coefficient one, and its representation evaluates the
original series coefficients.

The algebra equivalence with the polynomial quotient is a separate
compatibility: the native total-truncation algebra map has kernel v^r and
is surjective because it commutes with polynomial inclusion. Its inverse
sends a polynomial class to its formal-series class. Multiplicativity holds
in the quotient.

In two variables, an exponent vector corresponds to (t,i), where t is its
total degree below r and 0≤i≤t is its first exponent. The inverse exponents
are i and t−i. Counting these dependent finite fibres gives
Σ_(t<r)(t+1)=binom(r+1,2). The native basis-cardinality theorem then gives
the coefficient-field rank of the actual quotient. At r=3 its length over
F₂ is 6; a rectangular cutoff would instead give 9.

The following six new declarations separate the non-routine proof steps.
The four existing total-jet declarations retain their complete statement,
hypothesis and API contracts, with refined proof dependencies.

### Kernel of total-degree truncation

`TauCeti.HilbertSamuel.truncTotalAlgHom_ker` — DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-kernel

For each r≥0, ker(truncTotalAlgHom σ k r)=v^r as actual ideals of R. The target is the native polynomial ideal quotient k[X_i]/p^r; the truncation map itself is already built.

Hypotheses: σ is finite, k is a commutative ring, R=MvPowerSeries σ k, v is the algebraic ideal span of its native variables and p=MvPolynomial.idealOfVars σ k. The cutoff r is a natural number; r=0 and the empty variable set are allowed.

Proof: Use native quotient vanishing and polynomial ideal-power membership to identify the kernel with vanishing of all truncation coefficients below r. The native coeff_truncTotal formula transfers these to the original series coefficients. Native nat_le_order and its strict coefficient converse identify precisely the order bound r≤order(g). Import the checked variable-ideal-power/order adapter, valid for arbitrary commutative coefficients and finite variables. The r=0 and zero-series branches are included.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/variable-ideal-power-order`, `mathlib:MvPowerSeries.truncTotalAlgHom`, `mathlib:MvPolynomial.mem_pow_idealOfVars_iff'`, `mathlib:MvPowerSeries.coeff_truncTotal`, `mathlib:MvPowerSeries.nat_le_order`.

### Polynomial and formal total jets

`TauCeti.HilbertSamuel.totalJetEquiv` — DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-equivalence

Define the canonical k-algebra equivalence E_r:R/v^r ≃ k[X_i]/p^r, by descending the built truncTotalAlgHom. It sends [g] to [truncTotal(r,g)] and its inverse sends the class of a polynomial to the class of its native formal-series inclusion. Both formulas, and multiplication, use the actual ideal quotients.

Hypotheses: σ is finite, k is a commutative ring, R=MvPowerSeries σ k, v is the algebraic ideal span of its native variables and p=MvPolynomial.idealOfVars σ k. The cutoff r is a natural number; r=0 and the empty variable set are allowed.

Proof: Import the separately named total-jet-kernel and total-jet-truncation-surjective lemmas for the native polynomial-valued quotient map. Restrict its scalar base from the polynomial algebra to k and apply native quotientKerAlgEquivOfSurjective. Transport the denominator through the proved kernel equality using native quotientEquivAlgOfEq. The forward formula is representative evaluation. For the inverse polynomial formula, use injectivity and the native algebra-map commutation with polynomial inclusion. Multiplication is inherited from the actual algebra equivalence.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-kernel`, `mathlib:MvPowerSeries.truncTotalAlgHom`, `mathlib:Ideal.quotientKerAlgEquivOfSurjective`, `mathlib:Ideal.quotientKerAlgEquivOfSurjective_mk`, `mathlib:Ideal.quotientEquivAlgOfEq`, `DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-truncation-surjective`.

API:

- `TauCeti.HilbertSamuel.totalJetEquiv_mk`: E_r([g])=[truncTotal(r,g)] for every g∈R.
- `TauCeti.HilbertSamuel.totalJetEquiv_symm_mk`: E_r⁻¹([a])=[a viewed as a native formal series] for every polynomial a.
- `TauCeti.HilbertSamuel.totalJetEquiv_mul`: E_r(a·b)=E_r(a)·E_r(b) for the actual quotient multiplications.

Acceptance tests:

- `HilbertSamuelTotalJetTest.zero_cutoff`: For k=ℚ, σ=Fin 2 and r=0, R/v^0 is zero and the degree<0 exponent index is empty.
- `HilbertSamuelTotalJetTest.residue_cutoff`: For k=ℚ, σ=Fin 2 and r=1, E_1([1])=1 and E_1([X_0])=0.
- `HilbertSamuelTotalJetTest.total_not_rectangular`: For k=ℚ, σ=Fin 2 and r=2, [X_0X_1]=0 in the total jet. Native rectangular truncation trunc′ with inclusive bound (1,1) retains the nonzero polynomial X_0X_1. A rectangular replacement fails this test.
- `HilbertSamuelJetCoordinatesTest.polynomial_inverse`: For any polynomial over any commutative coefficient ring, the inverse total-jet equivalence returns its native formal-series quotient class.

Uses: Plane-curve handoff §3 and J02–J03; shifted-jet length comparison in §4: Replace actual finite series jets by native polynomial ideal quotients with their multiplication and coefficients fixed. DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-function and reserved general multiplicity definition: Supply the finite-jet model used for the plane-curve comparison, without redefining the general Hilbert–Samuel function.

### Total-jet monomial basis

`TauCeti.HilbertSamuel.totalJetBasis` — DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-monomial-basis

For each r≥0 define the k-module basis of R/v^r indexed by B_r={α:σ→₀ℕ | degree(α)<r}, whose vector at α is the actual class of monomial(α,1). Its representation of [g] at α is coeff_α(g). In particular the native quotient is finite as a k-module. A field or reduced coefficient ring is unnecessary.

Hypotheses: σ is finite, k is a commutative ring, R=MvPowerSeries σ k, v is the algebraic ideal span of its native variables and p=MvPolynomial.idealOfVars σ k. The cutoff r is a natural number; r=0 and the empty variable set are allowed.

Proof: The native exponent set B_r is finite by finite_of_degree_lt. Import the actual low-coefficient linear equivalence total-jet-coordinates. Apply native Basis.ofEquivFun. Its representation agrees with the original low-coefficient map, so the coefficient formula holds on every quotient representative. Compare basis representations to identify the α-th basis vector with the native quotient class of monomial(α,1); all its coordinates are the Kronecker delta. Native Module.Finite.of_basis proves finiteness. All statements include empty B_0, empty variable sets and nonreduced coefficient rings. No independent vector-space or length assumption is used.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-equivalence`, `DeformationAndDerivedPatchingAlgebra:R03.3/variable-ideal-power-order`, `mathlib:Finsupp.finite_of_degree_lt`, `mathlib:Finsupp.basisSingleOne`, `mathlib:MvPolynomial.mem_pow_idealOfVars_iff'`, `DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-coordinates`, `mathlib:Module.Basis.ofEquivFun`, `mathlib:Module.Basis.ofEquivFun_repr_apply`, `mathlib:Module.Finite.of_basis`.

API:

- `TauCeti.HilbertSamuel.totalJetBasis_apply`: The α-th basis vector is [monomial(α,1)] for α of total degree below r.
- `TauCeti.HilbertSamuel.totalJetBasis_repr_mk`: repr([g])(α)=coeff_α(g), independently of the representative.
- `TauCeti.HilbertSamuel.totalJetBasis_finite`: Module.Finite k (R/v^r), for every finite σ, commutative k and cutoff r.

Acceptance tests:

- `HilbertSamuelTotalJetTest.basis_zero_cutoff`: For ℚ and two variables at r=0, every quotient vector has zero coordinate tuple.
- `HilbertSamuelTotalJetTest.basis_dual_variable`: Over F₂ and two variables at r=3, [X_0X_1]≠0 and [X_0³]=0. A basis indexed only by pure powers fails the first assertion; a rectangular basis fails the second.
- `HilbertSamuelTotalJetTest.basis_zero_divisors`: Over Z/4 at r=1, the constant coefficient 2 of [C(2)] is a basis coordinate and [C(2)]≠0, despite 2²=0. The construction must not assume a coefficient domain.
- `HilbertSamuelJetCoordinatesTest.basis_zero_cutoff`: For arbitrary commutative coefficients and finite variables, every native jet at cutoff zero has zero basis representation.
- `HilbertSamuelJetCoordinatesTest.basis_mixed_monomial`: Over F₂ with two variables at cutoff three, the class of X₀X₁ is nonzero and the class of X₀³ is zero; a pure-power-only or rectangular basis fails.

Uses: Plane-curve handoff §3 and J02–J03; shifted-jet length comparison in §4: Replace actual finite series jets by native polynomial ideal quotients with their multiplication and coefficients fixed. DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-function and reserved general multiplicity definition: Supply the finite-jet model used for the plane-curve comparison, without redefining the general Hilbert–Samuel function. DeformationAndDerivedPatchingAlgebra:R03.3/plane-total-jet-finrank: Certify finiteness and count the actual monomial basis before computing field length.

### Dimension of a two-variable total jet

`TauCeti.HilbertSamuel.planeTotalJet_finrank` — DeformationAndDerivedPatchingAlgebra:R03.3/plane-total-jet-finrank

For a field k, R=k[[X_0,X_1]], v=(X_0,X_1) and every cutoff r≥0, finrank_k(R/v^r)=binom(r+1,2). Its k-module length is the same finite number by the built length_eq_finrank. This is field length, not yet R-module length.

Hypotheses: k is any field, σ=Fin 2 and r≥0. No characteristic, algebraic-closure or perfectness hypothesis.

Proof: The existing actual totalJetBasis supplies a basis of the native two-variable series quotient. Native Module.finrank_eq_nat_card_basis identifies its finrank with the cardinality of its exponent index type. Apply the separate plane-jet-index-card lemma to obtain binom(r+1,2), including r=0. Finite coefficient-field length is a separate application of the built length_eq_finrank theorem after finiteness has been proved; no arbitrary change of scalar length is inferred.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-monomial-basis`, `mathlib:Module.finrank_eq_card_basis'`, `mathlib:Module.length_eq_finrank`, `DeformationAndDerivedPatchingAlgebra:R03.3/plane-jet-index-card`, `mathlib:Module.finrank_eq_nat_card_basis`.

Acceptance tests:

- `HilbertSamuelTotalJetTest.field_length_six`: For k=F₂ and r=3, length_k(R/v³)=6. The rectangular cutoff would give 9 rather than 6.
- `HilbertSamuelJetCoordinatesTest.field_length_six`: Over F₂ in two variables, the native quotient R/v³ has coefficient-field module length 6.

### Equality of total jets by coefficients

`TauCeti.HilbertSamuel.jet_mk_eq_iff` — DeformationAndDerivedPatchingAlgebra:R03.3/jet-coefficient-equality

For f,g∈R, their classes in R/v^r are equal exactly when coeff_α(f)=coeff_α(g) for every exponent α with degree α<r.

Hypotheses: σ is a finite type and k an arbitrary commutative ring. R is the native MvPowerSeries σ k, v the algebraic ideal spanned by its variables, r a natural cutoff and B_r the native finitely supported exponent vectors of total degree strictly less than r. The zero ring, r=0 and the empty variable set are allowed.

Proof: Native quotient equality is equivalent to f−g belonging to v^r. Import the preceding finite-variable ideal-power/order equivalence. In the forward direction, the strict low-degree coefficient vanishing theorem applied to f−g gives equality of its two coefficients. In the reverse direction, their equality makes each low coefficient of f−g zero, so nat_le_order gives the required order bound. At cutoff zero the quantifier is empty and v^0 is the full ideal, so the criterion still states the actual quotient equality.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/variable-ideal-power-order`, `mathlib:Ideal.Quotient.eq`, `mathlib:MvPowerSeries.coeff_of_lt_order`, `mathlib:MvPowerSeries.nat_le_order`.

### Surjectivity of total-jet truncation

`TauCeti.HilbertSamuel.truncTotalAlgHom_surjective` — DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-truncation-surjective

For every r, the native truncTotalAlgHom from R to k[X_i]/p^r is surjective, where p is the native polynomial variable ideal.

Hypotheses: σ is a finite type and k an arbitrary commutative ring. R is the native MvPowerSeries σ k, v the algebraic ideal spanned by its variables, r a natural cutoff and B_r the native finitely supported exponent vectors of total degree strictly less than r. The zero ring, r=0 and the empty variable set are allowed.

Proof: Choose a polynomial representative of a quotient class using native quotient surjectivity. Include that polynomial into its formal power series ring. The built truncation algebra homomorphism is an algebra map over the polynomial ring, so its commutation with scalars maps the included representative to its original quotient class. This uses quotient multiplication; unquotiented total truncation is not asserted to be multiplicative.

Dependencies: `mathlib:Ideal.Quotient.mk_surjective`, `mathlib:MvPowerSeries.truncTotalAlgHom`.

### Low coefficients of total jets

`TauCeti.HilbertSamuel.totalJetCoefficients` — DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-coefficients

Define the k-linear map C_r:R/v^r → (B_r→k) by C_r([g])(α)=coeff_α(g). Its domain is the native algebraic ideal quotient, with scalar action restricted from R to k.

Hypotheses: σ is a finite type and k an arbitrary commutative ring. R is the native MvPowerSeries σ k, v the algebraic ideal spanned by its variables, r a natural cutoff and B_r the native finitely supported exponent vectors of total degree strictly less than r. The zero ring, r=0 and the empty variable set are allowed.

Proof: Form the native product linear map of the coefficient maps indexed by B_r. Restrict the ideal v^r from R-scalars to k-scalars; its quotient is the same native quotient carrier. For an element of v^r, the ideal-power/order comparison and α.degree<r force each selected coefficient to vanish. Native Submodule.liftQ therefore descends the product coefficient map. The representative and monomial formulas follow from native quotient-lift and monomial-coefficient formulas. The zero criterion imports the separate bijectivity lemma; it does not assume the desired basis.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/variable-ideal-power-order`, `mathlib:MvPowerSeries.coeff`, `mathlib:LinearMap.pi`, `mathlib:Submodule.liftQ`, `mathlib:MvPowerSeries.coeff_of_lt_order`.

API:

- `TauCeti.HilbertSamuel.totalJetCoefficients_mk`: C_r([g])(α)=coeff_α(g) for α∈B_r.
- `TauCeti.HilbertSamuel.totalJetCoefficients_monomial`: C_r([monomial(β,a)])(α) is a if α=β and zero otherwise, including β outside B_r.
- `TauCeti.HilbertSamuel.totalJetCoefficients_eq_zero_iff`: C_r(x)=0 if and only if the actual jet x is zero; this uses the separate coefficient-map bijectivity lemma.

Acceptance tests:

- `HilbertSamuelJetCoordinatesTest.coefficients_zero_cutoff`: For arbitrary finite σ and commutative k, the coefficient tuple of every series jet at cutoff zero is zero.
- `HilbertSamuelJetCoordinatesTest.coefficients_constant_nilpotent`: For two variables over Z/4 at cutoff one, the constant coefficient of the jet of C(2) is 2.
- `HilbertSamuelJetCoordinatesTest.coefficients_exact_cutoff`: For two variables over Z/4 at cutoff two, the coefficient tuple of the degree-two monomial X₀² is zero: the boundary is strict.
- `HilbertSamuelJetCoordinatesTest.representative_independence`: Adding any element of v^r to a series does not change its actual low-coefficient tuple.

Uses: DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-monomial-basis: Supply actual representative-independent low coefficients as the basis representation. DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-coordinates and the plane-curve jet length argument: Detect equality and vanishing in the native jet, including mixed monomials and nilpotent coefficient values.

### Bijectivity of total-jet coefficients

`TauCeti.HilbertSamuel.totalJetCoefficients_bijective` — DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-coefficients-bijective

For every r, the actual k-linear low-coefficient map C_r:R/v^r → (B_r→k) is bijective.

Hypotheses: σ is a finite type and k an arbitrary commutative ring. R is the native MvPowerSeries σ k, v the algebraic ideal spanned by its variables, r a natural cutoff and B_r the native finitely supported exponent vectors of total degree strictly less than r. The zero ring, r=0 and the empty variable set are allowed.

Proof: For injectivity choose representatives f,g of two jets and evaluate equality of their coefficient functions at every α∈B_r. The jet-coefficient-equality lemma identifies their quotient classes. For surjectivity, given a tuple c:B_r→k define a native formal series g by g(α)=c(α) when degree α<r and g(α)=0 otherwise. This is an actual series, not an unspecified infinite polynomial sum. Its jet maps to c by the representative formula. The same construction covers the empty index set and zero coefficient ring.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-coefficients`, `DeformationAndDerivedPatchingAlgebra:R03.3/jet-coefficient-equality`, `mathlib:Ideal.Quotient.mk_surjective`, `mathlib:MvPowerSeries.coeff`.

### Total-jet coordinate equivalence

`TauCeti.HilbertSamuel.totalJetCoordinates` — DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-coordinates

Define the k-linear equivalence E_r:R/v^r ≃ (B_r→k) from the actual low-coefficient map C_r and its proved bijectivity.

Hypotheses: σ is a finite type and k an arbitrary commutative ring. R is the native MvPowerSeries σ k, v the algebraic ideal spanned by its variables, r a natural cutoff and B_r the native finitely supported exponent vectors of total degree strictly less than r. The zero ring, r=0 and the empty variable set are allowed.

Proof: Apply native LinearEquiv.ofBijective to C_r and total-jet-coefficients-bijective; the forward function remains the same map. Its forward representative formula is the coefficient formula. Evaluation after inverse reconstruction returns the supplied tuple; applying the inverse to all low coefficients of any series returns its actual quotient class. Native finite exponent-set finiteness permits Basis.ofEquivFun to turn this equivalence into the existing totalJetBasis. No new jet carrier, standalone dimension or arbitrary chosen abstract equivalence is substituted.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-coefficients-bijective`, `mathlib:LinearEquiv.ofBijective`.

API:

- `TauCeti.HilbertSamuel.totalJetCoordinates_mk`: E_r([g])(α)=coeff_α(g).
- `TauCeti.HilbertSamuel.totalJetCoordinates_symm_apply`: For any tuple c and α∈B_r, E_r(E_r⁻¹(c))(α)=c(α).
- `TauCeti.HilbertSamuel.totalJetCoordinates_symm_coeff`: E_r⁻¹(α↦coeff_α(g))=[g] in the native quotient for every formal series g.

Acceptance tests:

- `HilbertSamuelJetCoordinatesTest.coordinates_reconstruction`: For every series and every cutoff, inverse coordinates of its low coefficients recover its actual native quotient class.
- `HilbertSamuelJetCoordinatesTest.coordinates_empty_variables`: With no variables over Z/4 at cutoff one, the sole coordinate of the class of C(a) is a.
- `HilbertSamuelJetCoordinatesTest.coordinates_zero_ring`: Over Z/1, the coordinate tuple of every two-variable jet is zero at every cutoff.

Uses: DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-monomial-basis: Use the native Basis.ofEquivFun constructor to produce the specified monomial basis with a coefficient-valued representation. DeformationAndDerivedPatchingAlgebra:R03.3/total-jet-finite and plane-total-jet-finrank: Provide the finite free coordinate model required before cardinality can be interpreted as module rank or length.

### Number of plane total-degree monomials

`TauCeti.HilbertSamuel.planeJetIndex_card` — DeformationAndDerivedPatchingAlgebra:R03.3/plane-jet-index-card

For every natural r, the native exponent subtype {α:Fin 2→₀ℕ | degree α<r} has cardinality binom(r+1,2).

Hypotheses: r is any natural number. Exponents are the native finitely supported functions Fin 2→₀ℕ, filtered by strict total degree; r=0 is included.

Proof: Identify an exponent vector α with the pair consisting of t=α(0)+α(1)<r and i=α(0)≤t. The target is the dependent finite sum over t∈Fin r of Fin(t+1). The inverse sends (t,i) to the native finitely supported vector with entries i and t−i. Verify both inverse laws; i≤t is retained before natural subtraction. Use native cardinality invariance under equivalence and cardinality of a dependent finite sum, obtaining Σ_(t<r)(t+1). For r=0 the sum is empty. For r=n+1 apply native sum_range_add_choose at k=1 to get binom(r+1,2).

Dependencies: `mathlib:Finsupp.finite_of_degree_lt`, `mathlib:Finsupp.degree_eq_sum`, `mathlib:Nat.card_congr`, `mathlib:Fintype.card_sigma`, `mathlib:Nat.sum_range_add_choose`.

Acceptance tests:

- `HilbertSamuelJetCoordinatesTest.count_zero`: The two-variable exponent index at cutoff zero has cardinality 0.
- `HilbertSamuelJetCoordinatesTest.count_one`: The two-variable exponent index at cutoff one has cardinality 1.
- `HilbertSamuelJetCoordinatesTest.count_three`: The two-variable exponent index at cutoff three has cardinality 6, not the rectangular count 9.

### Sources and remaining obligations

The source argument is DDPA-JET-HANDOFF §3 (J02–J03), with §4 explaining
its use in the shifted plane-curve sequence. This is a fresh bounded read
of those sections. The finite-variable arbitrary-coefficient extension is
justified by the displayed coefficient proof and the exact pinned native
interfaces recorded in HS-JET-COORDINATE-PIN. The entire preceding checked
217-line algebraic ideal-power proof was recovered, read, hash-verified and
reused unchanged; its authorship remains Codex — codex-a71f92.

The general cumulative Hilbert–Samuel function still uses the exponent
n+1, and remains distinct from the graded function in
[Stacks 00K4](https://stacks.math.columbia.edu/tag/00K4). The present jet
basis does not establish the general Hilbert–Serre polynomial, its degree
comparison with support dimension, or either multiplicity normalization.

The public handoff records the actual proof and compiler evidence. The
canonical suggested bodies remain admitted and every implementation status
is unchecked. The preceding prototype omissions for kernel, polynomial
equivalence, coordinates, basis, finiteness and plane-jet count are supplied.
Shifted series exact-order injectivity and exactness, all-index curve lengths,
tangent cone, curve dimension, intrinsic/ambient multiplicity, general
Hilbert–Serre, Artin–Rees, completion and associativity remain obligations.
All eight stage targets, original requests and routed-paper obligations
remain; no stage is closed by this continuation.

Current upstream work to reconcile for the remaining general strand:
[Mathlib #9819](https://github.com/leanprover-community/mathlib4/pull/9819)
contains graded Hilbert–Serre and Hilbert-polynomial work (the 131-line
HilbertPolynomial file was read, not its 1010-line theorem proof), while
[Mathlib #35561](https://github.com/leanprover-community/mathlib4/pull/35561)
proves regularity of finite-variable series over regular local rings (its
70-line file was read). The exact heads and read boundaries are recorded
in jetCoordinatesContinuation. Neither is a pinned baseline proof used here.


## Actual graded plane-curve lengths and sharp postulation — codex-rtOQ9t

The incoming 125 mathematical contracts and reserved general multiplicity definition remain. Five new arithmetic/curve lemmas complete the exact finite-jet proof frontier without replacing any quotient, function, polynomial or length carrier. The two existing graded/defect nodes gain only a separately named arithmetic prerequisite and proof step. Their exact native signatures, the generic quotient transition and both cumulative/graded formulas have now been checked with admission-free proofs. All implementations remain unchecked.

For R=k[[x,y]], A=R/(f), q=image(x,y), write H_N for the actual cumulative function and G_N for the actual successive-quotient length. When order(f)=d is finite, H_N=choose(N+2,2)−choose(N+2−d,2) and G_N=min(N+1,d). The first equality is a natural difference before the extended-natural cast. The native exact sequence gives H_N=G_N+H_(N−1) at positive indices; its N=0 right quotient is A/top with length zero. Finiteness is proved from the sum before converting G_N to a natural value. The rational defect is choose(d−N−1,2), so cumulative agreement starts at max(0,d−2), while G_N=d starts at max(0,d−1). For f=x⁴ over F₂ these are indices two and three. Units d=0 have zero lengths without a local-ring instance on their zero quotient. For f=0, native order is infinity and G_N=N+1.

### Rational defect of the plane-jet count

`TauCeti.HilbertSamuel.planeJetCount_defect` (`DeformationAndDerivedPatchingAlgebra:R03.3/plane-jet-binomial-defect`). For all natural d,N, cast [choose(N+2,2)−choose(N+2−d,2)] to ℚ and subtract d(N+1)−d(d−1)/2 in ℚ. The result is choose(d−N−1,2), cast to ℚ. Every subtraction inside a binomial argument and the first count difference is natural; subtraction in the polynomial and defect is rational.

Hypotheses: d,N are arbitrary natural numbers; all rational arithmetic takes place in ℚ independently of any coefficient characteristic.

Proof: Use monotonicity to justify casting the natural count difference to a rational difference. When d≤N+2 the opposite defect binomial vanishes. Expand the two native binomials with the rational cast formula and substitute the exact natural-subtraction cast; the polynomial identity follows. When N+2<d, the second source binomial vanishes. Cast d−N−1 using the proved subtraction bounds and expand the remaining two binomials. Rational arithmetic proves the identity without a condition on the coefficient field characteristic.

Dependencies: `mathlib:Nat.cast_choose_two`, `mathlib:Nat.choose_le_choose`, `mathlib:Nat.choose_eq_zero_of_lt`.

`CurvePostulationTests.negative_polynomial` (non-example): For the same actual characteristic-two quartic, H(0).toNat−(−2)=3 in ℚ. Rational polynomial values and rational subtraction are not truncated at zero.

`CurvePostulationTests.unit_defect` (degenerate): For d=0 and every N, the native natural plane-jet count difference is zero before its rational cast.

`CurvePostulationTests.small_cutoff_defect` (non-example): For d=100,N=2, the small ambient jet count 6 minus the rational polynomial value equals choose(97,2); the low-cutoff defect is retained.

### Successive plane-jet count difference

`TauCeti.HilbertSamuel.planeJetCount_step` (`DeformationAndDerivedPatchingAlgebra:R03.3/plane-jet-count-step`). For all natural d,N, choose(N+2,2)−choose(N+2−d,2) = min(N+1,d) + [choose(N+1,2)−choose(N+1−d,2)] in ℕ. All subtractions are natural, including the small cutoffs and d=0.

Hypotheses: d,N are arbitrary natural numbers; all rational arithmetic takes place in ℚ independently of any coefficient characteristic.

Proof: Apply the existing Pascal recurrence to the ambient triangular number. For d≤N+1, the second triangular argument is also a successor. Monotonicity bounds the subtracted binomial, and the two recurrences give the required equality with min=d. For N+1<d, both subtracted binomials vanish and min=N+1. This separately retains d=0, N=0 and the low-index branch.

Dependencies: `mathlib:Nat.choose_succ_succ`, `mathlib:Nat.choose_le_choose`, `mathlib:Nat.choose_eq_zero_of_lt`.

### Sharp graded stabilization of a formal plane curve

`TauCeti.HilbertSamuel.planeCurve_graded_stable_iff` (`DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-graded-stable`). If native order(f)=d, then the actual successive-quotient length G_N of A=k[[x,y]]/(f) at the image q of (x,y) equals d in ℕ∞ if and only if d≤N+1. Hence its first stable index is max(0,d−1), distinct from the cumulative agreement index max(0,d−2).

Hypotheses: k is an arbitrary field. All rings, ideals, submodules, quotients, scalar actions, functions and lengths are the actual native carriers in the inherited definitions. No reducedness, irreducibility, algebraic closure, perfection or characteristic-zero assumption is imposed. For a finite-order statement, f∈MvPowerSeries (Fin 2) k and native order(f)=(d:ℕ∞); this excludes f=0 and includes units d=0. The predecessor-defect theorem additionally requires 3≤d. The zero-equation theorem has f=0 and no finite d.

Proof: Apply the proved native graded-function formula G_N=min(N+1,d), without replacing its actual quotient module. The minimum equals the right term exactly when d≤N+1; natural casts preserve and reflect this inequality. Units d=0 remain included without asserting a local-ring instance on their zero quotient.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-graded-function`.

`CurvePostulationTests.char_two_thresholds` (non-example): For actual A=F₂[[x,y]]/(x⁴), H(2).toNat=6 while G(2)≠4 and G(3)=4. Cumulative agreement at index two does not imply graded stabilization there.

`CurvePostulationTests.graded_threshold` (characterisation): For the actual characteristic-two quartic and every N, G(N)=4 if and only if 3≤N.

`CurvePostulationTests.unit_graded` (degenerate): For actual A=F₂[[x,y]]/(1) and every N, G(N)=0. No nontrivial local-ring instance on this zero ring is assumed.

`CurvePostulationTests.smooth_graded` (computation): For actual A=F₂[[x,y]]/(x) and every N, G(N)=1.

### Unit postulation defect before sharp agreement

`TauCeti.HilbertSamuel.planeCurve_postulation_predecessor` (`DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-postulation-predecessor`). If native order(f)=d and 3≤d, then the actual cumulative function at N=d−3, converted to a natural number only after the finite-jet theorem, has rational defect exactly 1 from d(N+1)−d(d−1)/2. Thus agreement cannot begin one index before max(0,d−2).

Hypotheses: k is an arbitrary field. All rings, ideals, submodules, quotients, scalar actions, functions and lengths are the actual native carriers in the inherited definitions. No reducedness, irreducibility, algebraic closure, perfection or characteristic-zero assumption is imposed. For a finite-order statement, f∈MvPowerSeries (Fin 2) k and native order(f)=(d:ℕ∞); this excludes f=0 and includes units d=0. The predecessor-defect theorem additionally requires 3≤d. The zero-equation theorem has f=0 and no finite d.

Proof: Specialize the exact rational postulation-defect formula to N=d−3. The assumption 3≤d gives d−(d−3)−1=2 in natural arithmetic; the native binomial choose(2,2)=1 proves sharpness. The argument uses actual cumulative lengths, not a prescribed numerical function.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-postulation-defect`.

`CurvePostulationTests.sharp_predecessor` (computation): For the actual characteristic-two quartic at N=1, H(1).toNat−2=1, exactly the last nonzero cumulative defect.

`CurvePostulationTests.cumulative_threshold` (characterisation): For the actual characteristic-two quartic and every N, H(N).toNat=4(N+1)−6 in ℚ if and only if 2≤N.

### Successive-quotient lengths for the zero equation

`TauCeti.HilbertSamuel.planeZeroEquation_gradedFunction` (`DeformationAndDerivedPatchingAlgebra:R03.3/plane-zero-equation-graded`). For every N and the actual A=k[[x,y]]/(0), q=image(x,y), the native gradedFunction q N equals N+1 cast to ℕ∞. The zero equation has infinite native order and belongs to this separate regular-surface branch, rather than the finite-order unit branch.

Hypotheses: k is an arbitrary field. All rings, ideals, submodules, quotients, scalar actions, functions and lengths are the actual native carriers in the inherited definitions. No reducedness, irreducibility, algebraic closure, perfection or characteristic-zero assumption is imposed. For a finite-order statement, f∈MvPowerSeries (Fin 2) k and native order(f)=(d:ℕ∞); this excludes f=0 and includes units d=0. The predecessor-defect theorem additionally requires 3≤d. The zero-equation theorem has f=0 and no finite d.

Proof: Use the actual native quotient-transition exact sequence over A, with cumulative zero-equation lengths choose(N+2,2). At N=0 the right quotient is A/top and has length zero. At a successor the graded summand is finite because the cumulative sum is a finite natural cast; establish this before using toNat. Take the natural values of the extended-natural sum, apply Pascal recurrence to the two triangular counts, and recover the graded extended-natural value N+1.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/plane-zero-equation-function`, `DeformationAndDerivedPatchingAlgebra:R03.3/adic-quotient-length-step`, `mathlib:Nat.choose_succ_succ`, `mathlib:ENat.toNat_add`, `mathlib:ENat.natCast_toNat_eq_self`, `mathlib:ENat.natCast_ne_top`.

`CurvePostulationTests.zero_equation_growth` (non-example): For actual A=F₂[[x,y]]/(0), native order(0)=∞ and G(N)=N+1 for every N. The zero equation cannot be assigned the finite order zero of a unit.

The source calculations are credited to DDPA-CURVE-POSTULATION §§1–3, freshly read on 2026-10-03; the native exact sequence and numerical identities are now separately checked. Stacks 00K4 fixes the cumulative/graded convention. None of this asserts general graded Hilbert–Serre existence, the degree/dimension theorem, curve dimension, tangent-cone comparison or the full intrinsic/ambient multiplicity key.

The actual native graded function, general quotient-transition length proof, exact rational postulation defect, sharp cumulative threshold, sharp graded threshold, unit defect just before agreement, and separate zero-equation graded branch now have admission-free proof prototypes. All ten new named tests use actual characteristic-two quotient modules or the exact native integer/rational count expressions. Canonical bodies remain admitted and all nodes unchecked. Still prove the full tangent-cone kernel and dimension of the actual curve ring, compare with the existing cumulative polynomial/intrinsic and ambient multiplicities without assuming generic existence, and discharge general Hilbert–Serre induction, support/degree, Artin–Rees, localization lengths, completion, associativity, all eight stage targets and every inherited routed-paper obligation. The graded and cumulative sharp thresholds are distinct; the zero equation has no finite order.

The current handoff records the exact public native proof archive, complete reconstruction and validator scripts, both complete-file Lean checks, and the scoped atlas comparison. The canonical file is a planning signature file: its 367 expected admission warnings do not certify implementation. The native prototype has nine mathematical proofs and ten new named tests with no admissions; all 130 packet nodes remain unchecked.


# Explicit rational polynomials of actual plane quotient lengths

For an arbitrary field k, write R=k[[x,y]], v=(x,y), A=R/(f) and
q=image(v) in the actual quotient ring. All length functions and quotients
are the inherited native objects. If native order(f)=d∈ℕ, define the
closed-form rational polynomial P_d=d(T+1)−d(d−1)/2. Its evaluation
equals H_q,A(N).toNat precisely when d≤N+2, so the sharp permanent tail
begins at max(0,d−2). The coefficient field need not have characteristic
zero: the polynomial records integer lengths in ℚ. No division by two
is performed in k. Units d=0 give P₀=0 and the actual zero quotient.

A rational polynomial agreeing with these actual cumulative lengths on
any tail N≥K equals P_d. Indeed the natural interval N≥max(K,d−2) is
infinite, its image in ℚ is infinite by injectivity of the natural cast,
and both polynomials agree there. Apply Mathlib’s already proved
infinite-evaluation uniqueness theorem. Supplying P_d and the actual
sharp-tail theorem proves existence and uniqueness for this special case
without a general Hilbert–Serre existence premise. This is an actual
quotient-length proof, not a polynomial prescribed by a numerical test.

At d>0, P_d has natural degree one and leading coefficient d. At d=0 it
is the zero polynomial, with degree −∞, natural degree zero and leading
coefficient zero. For all d, its natural-degree factorial times leading
coefficient is d. This arithmetic does not assign dimension zero to a
zero module. The general reserved multiplicity definition remains
unchanged and still requires its general existence and support-degree
theorems. Equality with the existing general polynomial constructor must
use that constructor’s eventual-value specification; no checked native
proof of that unfinished general constructor is asserted here.

For f=0, the actual A=R/(0) has cumulative lengths choose(N+2,2) at every
index. Its unique rational polynomial is instead Q=(T+1)(T+2)/2, of
natural degree two and leading coefficient 1/2. Its factorial coefficient
is one. The zero equation has infinite order and cannot be assigned the
finite order zero of a unit. Native Krull dimensions and the tangent-cone
kernel are independent obligations; polynomial degrees are not claimed
as proofs of them.

These calculations build on the credited DDPA-CURVE-POSTULATION §§1–3
finite-jet argument. The uniqueness adapter follows the exact pinned
Mathlib HilbertPoly proof, with its generic Roots uniqueness and native
infinite intervals, and consumes Mathlib’s linear/quadratic polynomial
API. Stacks 00K4 supplies the graded/cumulative convention and general
existence target; it is not cited as the author of this special calculation.
No generic polynomial, dimension or local-ring carrier is duplicated.

## Explicit cumulative polynomial of equation order

DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial — TauCeti.HilbertSamuel.planeCurvePolynomial.

For every natural d, form P_d=d(T+1)−d(d−1)/2 in the existing rational polynomial ring. Both d casts precede rational subtraction. This is the explicit closed form for the cumulative function of a finite-order plane equation, not a new general Hilbert–Samuel polynomial constructor.

Hypotheses: Polynomial arithmetic is in ℚ. All equation coefficient fields are arbitrary; no algebraic closure, perfectness, reducedness, irreducibility or characteristic-zero assumption is imposed. For finite-order statements, native order(f)=(d:ℕ∞), which excludes the zero equation and includes unit equations. Actual rings, ideal images, module actions, quotient lengths and previously proved finite-value conversions are used exactly as in the inherited plan. No curve Krull dimension or general Hilbert–Serre existence theorem is assumed.

Proof: Form the displayed element of the native polynomial ring over ℚ. The parameter is an arbitrary natural number, including zero. No equation ring or length carrier is defined here.

Prerequisites: existing rational polynomial ring and ordinary arithmetic.

API TauCeti.HilbertSamuel.planeCurvePolynomial_eval (simp): For d∈ℕ and t∈ℚ, P_d(t)=d(t+1)−d(d−1)/2 with all arithmetic in ℚ.

API TauCeti.HilbertSamuel.planeCurvePolynomial_zero (simp): P_0=0 as a rational polynomial. Its degree is −∞, while native natDegree(0)=0; no dimension-zero interpretation of the zero module follows.

API TauCeti.HilbertSamuel.planeCurvePolynomial_natDegree (characterisation): For d≠0, natDegree(P_d)=1. This is a polynomial degree assertion, not a theorem asserting the Krull dimension of k[[x,y]]/(f).

API TauCeti.HilbertSamuel.planeCurvePolynomial_leadingCoeff (compatibility): For every d∈ℕ, leadingCoeff(P_d)=d in ℚ, including d=0.

API TauCeti.HilbertSamuel.planeCurvePolynomial_factorial_leadingCoeff (compatibility): For all d, natDegree(P_d)!·leadingCoeff(P_d)=d in ℚ. This arithmetic extraction from the explicit polynomial does not redefine multiplicity or certify the general multiplicity object.

Test CurvePolynomialTests.quartic_formula (computation): For d=4 the explicit rational polynomial is 4T−2, of natural degree one and leading coefficient four.

Test CurvePolynomialTests.unit_zero (degenerate): At d=0 the explicit polynomial is zero with degree −∞ and factorial-leading-coefficient extraction zero; native natural degree zero is not interpreted as dimension zero.

Test CurvePolynomialTests.smooth_polynomial (computation): For d=1 the explicit cumulative polynomial is T+1.

Test CurvePolynomialTests.cumulative_not_graded (non-example): P₄ is not the constant polynomial 4, although the actual graded length of the characteristic-two quartic at index 3 equals 4.

Test CurvePolynomialTests.coefficient_characteristic_is_not_length (non-example): The expression 4T−2 in F₂[T] vanishes, while the actual quartic quotient has cumulative length one at N=0. Integer quotient lengths cannot be read in the coefficient field.

## Evaluation of the explicit curve polynomial

DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial-eval — TauCeti.HilbertSamuel.planeCurvePolynomial_eval.

For d∈ℕ and t∈ℚ, P_d(t)=d(t+1)−d(d−1)/2 with all arithmetic in ℚ.

Hypotheses: Polynomial arithmetic is in ℚ. All equation coefficient fields are arbitrary; no algebraic closure, perfectness, reducedness, irreducibility or characteristic-zero assumption is imposed. For finite-order statements, native order(f)=(d:ℕ∞), which excludes the zero equation and includes unit equations. Actual rings, ideal images, module actions, quotient lengths and previously proved finite-value conversions are used exactly as in the inherited plan. No curve Krull dimension or general Hilbert–Serre existence theorem is assumed.

Proof: Evaluate native constants, the variable, addition, multiplication and subtraction. This identity is used before comparing with actual quotient lengths.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial.

## Zero polynomial at unit equation order

DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial-zero — TauCeti.HilbertSamuel.planeCurvePolynomial_zero.

P_0=0 as a rational polynomial. Its degree is −∞, while native natDegree(0)=0; no dimension-zero interpretation of the zero module follows.

Hypotheses: Polynomial arithmetic is in ℚ. All equation coefficient fields are arbitrary; no algebraic closure, perfectness, reducedness, irreducibility or characteristic-zero assumption is imposed. For finite-order statements, native order(f)=(d:ℕ∞), which excludes the zero equation and includes unit equations. Actual rings, ideal images, module actions, quotient lengths and previously proved finite-value conversions are used exactly as in the inherited plan. No curve Krull dimension or general Hilbert–Serre existence theorem is assumed.

Proof: Evaluate the parameter-zero closed form in the native polynomial ring. The native zero-polynomial degree conventions are retained.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial.

## Degree of the positive-order curve polynomial

DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial-degree — TauCeti.HilbertSamuel.planeCurvePolynomial_natDegree.

For d≠0, natDegree(P_d)=1. This is a polynomial degree assertion, not a theorem asserting the Krull dimension of k[[x,y]]/(f).

Hypotheses: Polynomial arithmetic is in ℚ. All equation coefficient fields are arbitrary; no algebraic closure, perfectness, reducedness, irreducibility or characteristic-zero assumption is imposed. For finite-order statements, native order(f)=(d:ℕ∞), which excludes the zero equation and includes unit equations. Actual rings, ideal images, module actions, quotient lengths and previously proved finite-value conversions are used exactly as in the inherited plan. No curve Krull dimension or general Hilbert–Serre existence theorem is assumed.

Proof: Expand P_d as dT+[d−d(d−1)/2]. The coefficient d is nonzero in ℚ. Apply the existing native linear-polynomial degree theorem, without imposing characteristic zero on the equation coefficient field.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial, mathlib:Polynomial.natDegree_linear.

## Leading coefficient for every equation order

DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial-leading-coefficient — TauCeti.HilbertSamuel.planeCurvePolynomial_leadingCoeff.

For every d∈ℕ, leadingCoeff(P_d)=d in ℚ, including d=0.

Hypotheses: Polynomial arithmetic is in ℚ. All equation coefficient fields are arbitrary; no algebraic closure, perfectness, reducedness, irreducibility or characteristic-zero assumption is imposed. For finite-order statements, native order(f)=(d:ℕ∞), which excludes the zero equation and includes unit equations. Actual rings, ideal images, module actions, quotient lengths and previously proved finite-value conversions are used exactly as in the inherited plan. No curve Krull dimension or general Hilbert–Serre existence theorem is assumed.

Proof: At d=0 use the zero-polynomial identity. Otherwise expand into the linear normal form and apply the native leading-coefficient theorem with the rational nonzero leading term.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial, DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial-zero, mathlib:Polynomial.leadingCoeff_linear.

## Degree factorial normalization of the curve polynomial

DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial-normalization — TauCeti.HilbertSamuel.planeCurvePolynomial_factorial_leadingCoeff.

For all d, natDegree(P_d)!·leadingCoeff(P_d)=d in ℚ. This arithmetic extraction from the explicit polynomial does not redefine multiplicity or certify the general multiplicity object.

Hypotheses: Polynomial arithmetic is in ℚ. All equation coefficient fields are arbitrary; no algebraic closure, perfectness, reducedness, irreducibility or characteristic-zero assumption is imposed. For finite-order statements, native order(f)=(d:ℕ∞), which excludes the zero equation and includes unit equations. Actual rings, ideal images, module actions, quotient lengths and previously proved finite-value conversions are used exactly as in the inherited plan. No curve Krull dimension or general Hilbert–Serre existence theorem is assumed.

Proof: At d=0 the leading coefficient vanishes, including the native 0!=1 convention. At d≠0 use native degree one, 1!=1 and leading coefficient d.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial-degree, DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial-leading-coefficient, DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial-zero.

## Explicit cumulative polynomial of the zero equation

DeformationAndDerivedPatchingAlgebra:R03.3/plane-surface-explicit-polynomial — TauCeti.HilbertSamuel.planeSurfacePolynomial.

Form Q(T)=(T²+3T+2)/2 in the existing rational polynomial ring, equivalently (T+1)(T+2)/2. This is the cumulative polynomial of the actual zero-equation quotient, distinct from P_0.

Hypotheses: Polynomial arithmetic is in ℚ. All equation coefficient fields are arbitrary; no algebraic closure, perfectness, reducedness, irreducibility or characteristic-zero assumption is imposed. For finite-order statements, native order(f)=(d:ℕ∞), which excludes the zero equation and includes unit equations. Actual rings, ideal images, module actions, quotient lengths and previously proved finite-value conversions are used exactly as in the inherited plan. No curve Krull dimension or general Hilbert–Serre existence theorem is assumed.

Proof: Build the native rational polynomial C(1/2)T²+C(3/2)T+1. Rational denominators are used only for integer lengths, never inverted in the coefficient field of a formal series.

Prerequisites: existing rational polynomial ring and ordinary arithmetic.

API TauCeti.HilbertSamuel.planeSurfacePolynomial_eval (simp): For every N∈ℕ, Q(N)=choose(N+2,2) cast to ℚ.

API TauCeti.HilbertSamuel.planeSurfacePolynomial_natDegree (characterisation): natDegree(Q)=2 in the native rational polynomial ring.

API TauCeti.HilbertSamuel.planeSurfacePolynomial_leadingCoeff (compatibility): leadingCoeff(Q)=1/2 in ℚ.

API TauCeti.HilbertSamuel.planeSurfacePolynomial_factorial_leadingCoeff (compatibility): natDegree(Q)!·leadingCoeff(Q)=1 in ℚ. This follows from degree two and leading coefficient 1/2 and is only an arithmetic polynomial extraction.

Test CurvePolynomialTests.surface_shape (compatibility): Q=(T+1)(T+2)/2, with natural degree two and leading coefficient 1/2 in ℚ.

Test CurvePolynomialTests.surface_all_lengths (compatibility): Over F₂ and for every N, Q(N) equals the actual zero-equation cumulative quotient length and its factorial-leading-coefficient extraction is one.

Test CurvePolynomialTests.zero_and_unit_quotients (non-example): Actual F₂[[x,y]]/(0) has cumulative value one at N=0, while F₂[[x,y]]/(1) has value zero; Q≠P₀. No nontrivial local-ring instance is imposed on the unit quotient.

## Binomial evaluations of the surface polynomial

DeformationAndDerivedPatchingAlgebra:R03.3/plane-surface-explicit-polynomial-eval — TauCeti.HilbertSamuel.planeSurfacePolynomial_eval.

For every N∈ℕ, Q(N)=choose(N+2,2) cast to ℚ.

Hypotheses: Polynomial arithmetic is in ℚ. All equation coefficient fields are arbitrary; no algebraic closure, perfectness, reducedness, irreducibility or characteristic-zero assumption is imposed. For finite-order statements, native order(f)=(d:ℕ∞), which excludes the zero equation and includes unit equations. Actual rings, ideal images, module actions, quotient lengths and previously proved finite-value conversions are used exactly as in the inherited plan. No curve Krull dimension or general Hilbert–Serre existence theorem is assumed.

Proof: Use the native rational choose-two cast formula and evaluate the actual polynomial. Rational algebra gives (N+2)(N+1)/2, with no subtraction before casts.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/plane-surface-explicit-polynomial, mathlib:Nat.cast_choose_two.

## Degree of the surface cumulative polynomial

DeformationAndDerivedPatchingAlgebra:R03.3/plane-surface-explicit-polynomial-degree — TauCeti.HilbertSamuel.planeSurfacePolynomial_natDegree.

natDegree(Q)=2 in the native rational polynomial ring.

Hypotheses: Polynomial arithmetic is in ℚ. All equation coefficient fields are arbitrary; no algebraic closure, perfectness, reducedness, irreducibility or characteristic-zero assumption is imposed. For finite-order statements, native order(f)=(d:ℕ∞), which excludes the zero equation and includes unit equations. Actual rings, ideal images, module actions, quotient lengths and previously proved finite-value conversions are used exactly as in the inherited plan. No curve Krull dimension or general Hilbert–Serre existence theorem is assumed.

Proof: Its rational quadratic coefficient 1/2 is nonzero. Reuse the pinned quadratic-polynomial degree theorem.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/plane-surface-explicit-polynomial, mathlib:Polynomial.natDegree_quadratic.

## Leading coefficient of the surface cumulative polynomial

DeformationAndDerivedPatchingAlgebra:R03.3/plane-surface-explicit-polynomial-leading-coefficient — TauCeti.HilbertSamuel.planeSurfacePolynomial_leadingCoeff.

leadingCoeff(Q)=1/2 in ℚ.

Hypotheses: Polynomial arithmetic is in ℚ. All equation coefficient fields are arbitrary; no algebraic closure, perfectness, reducedness, irreducibility or characteristic-zero assumption is imposed. For finite-order statements, native order(f)=(d:ℕ∞), which excludes the zero equation and includes unit equations. Actual rings, ideal images, module actions, quotient lengths and previously proved finite-value conversions are used exactly as in the inherited plan. No curve Krull dimension or general Hilbert–Serre existence theorem is assumed.

Proof: Its rational quadratic coefficient is nonzero. Reuse the pinned quadratic leading-coefficient theorem; do not use a denominator in the possibly characteristic-two equation field.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/plane-surface-explicit-polynomial, mathlib:Polynomial.leadingCoeff_quadratic.

## Explicit polynomial and actual cumulative agreement

DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-polynomial-eval-iff — TauCeti.HilbertSamuel.planeCurvePolynomial_eval_iff.

For any field k, f∈k[[x,y]] with native order(f)=d∈ℕ and every N, P_d(N)=length_A(A/q^(N+1)).toNat in ℚ if and only if d≤N+2, where A=k[[x,y]]/(f) and q is the actual image of the variable ideal.

Hypotheses: Polynomial arithmetic is in ℚ. All equation coefficient fields are arbitrary; no algebraic closure, perfectness, reducedness, irreducibility or characteristic-zero assumption is imposed. For finite-order statements, native order(f)=(d:ℕ∞), which excludes the zero equation and includes unit equations. Actual rings, ideal images, module actions, quotient lengths and previously proved finite-value conversions are used exactly as in the inherited plan. No curve Krull dimension or general Hilbert–Serre existence theorem is assumed.

Proof: Evaluate P_d and apply the already proved actual postulation equivalence. Finiteness was established in the inherited plane-curve-function proof before converting lengths to naturals.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-explicit-polynomial-eval, DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-postulation-iff.

## Sharp permanent agreement with actual curve lengths

DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-polynomial-tail — TauCeti.HilbertSamuel.planeCurvePolynomial_tail.

With these actual carriers and exact finite order d, for every N≥d−2, P_d(N)=length_A(A/q^(N+1)).toNat in ℚ. The subtraction in the natural cutoff d−2 is truncated.

Hypotheses: Polynomial arithmetic is in ℚ. All equation coefficient fields are arbitrary; no algebraic closure, perfectness, reducedness, irreducibility or characteristic-zero assumption is imposed. For finite-order statements, native order(f)=(d:ℕ∞), which excludes the zero equation and includes unit equations. Actual rings, ideal images, module actions, quotient lengths and previously proved finite-value conversions are used exactly as in the inherited plan. No curve Krull dimension or general Hilbert–Serre existence theorem is assumed.

Proof: Natural arithmetic gives d≤N+2 at precisely this tail. Apply the actual agreement equivalence; small orders d=0,1,2 have cutoff zero.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-polynomial-eval-iff.

Test CurvePolynomialTests.sharp_tail (non-example): For the actual characteristic-two quartic, agreement with P₄ holds at every natural N≥2, but fails at N=1.

## Uniqueness from an arbitrary actual curve tail

DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-polynomial-unique — TauCeti.HilbertSamuel.planeCurvePolynomial_unique.

For the actual finite-order plane curve, if P∈ℚ[T] agrees with its cumulative quotient lengths for every N≥K for some K∈ℕ, then P=P_d. No degree bound or caller-provided existence hypothesis on the actual function is needed.

Hypotheses: Polynomial arithmetic is in ℚ. All equation coefficient fields are arbitrary; no algebraic closure, perfectness, reducedness, irreducibility or characteristic-zero assumption is imposed. For finite-order statements, native order(f)=(d:ℕ∞), which excludes the zero equation and includes unit equations. Actual rings, ideal images, module actions, quotient lengths and previously proved finite-value conversions are used exactly as in the inherited plan. No curve Krull dimension or general Hilbert–Serre existence theorem is assumed.

Proof: Take the infinite natural interval N≥max(K,d−2). Its image under the injective natural cast to ℚ is infinite. On it, the supplied equality and the proved actual tail give P(N)=P_d(N). Apply the existing native infinite-evaluation uniqueness theorem, following the pinned HilbertPoly uniqueness proof. No new generic polynomial uniqueness theory is planned.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-polynomial-tail, mathlib:Polynomial.eq_of_infinite_eval_eq, mathlib:Set.Ici_infinite, mathlib:Set.infinite_image_iff, mathlib:Nat.cast_injective.

Test CurvePolynomialTests.characteristic_two_unique (characterisation): For actual A=F₂[[x,y]]/(x⁴), every rational polynomial eventually agreeing with the actual quotient lengths equals 4T−2, even though the coefficient field is finite.

## Native existence and uniqueness for plane-curve lengths

DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-native-polynomial-existence — TauCeti.HilbertSamuel.planeCurve_existsUnique_polynomial.

For every field k and actual equation f of exact finite order d, there exists exactly one rational polynomial agreeing eventually with N↦length_A(A/q^(N+1)).toNat. It is P_d, with the explicit witness d−2. This includes unit equations and their zero quotient without a nontrivial local-ring instance.

Hypotheses: Polynomial arithmetic is in ℚ. All equation coefficient fields are arbitrary; no algebraic closure, perfectness, reducedness, irreducibility or characteristic-zero assumption is imposed. For finite-order statements, native order(f)=(d:ℕ∞), which excludes the zero equation and includes unit equations. Actual rings, ideal images, module actions, quotient lengths and previously proved finite-value conversions are used exactly as in the inherited plan. No curve Krull dimension or general Hilbert–Serre existence theorem is assumed.

Proof: Supply the actual explicit polynomial with the already proved sharp tail as existence witness. Apply the actual tail uniqueness theorem for any competing polynomial. This special-case existence proof uses no general Noetherian/local Hilbert–Serre theorem.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-polynomial-tail, DeformationAndDerivedPatchingAlgebra:R03.3/plane-curve-polynomial-unique.

## Surface polynomial equals every actual zero-equation length

DeformationAndDerivedPatchingAlgebra:R03.3/plane-zero-equation-polynomial-eval — TauCeti.HilbertSamuel.planeZeroEquation_polynomial_eval.

For any field k, A=k[[x,y]]/(0), q=image(x,y), and every N≥0, Q(N)=length_A(A/q^(N+1)).toNat in ℚ. The zero equation has infinite order and is not the unit-order branch.

Hypotheses: Polynomial arithmetic is in ℚ. All equation coefficient fields are arbitrary; no algebraic closure, perfectness, reducedness, irreducibility or characteristic-zero assumption is imposed. For finite-order statements, native order(f)=(d:ℕ∞), which excludes the zero equation and includes unit equations. Actual rings, ideal images, module actions, quotient lengths and previously proved finite-value conversions are used exactly as in the inherited plan. No curve Krull dimension or general Hilbert–Serre existence theorem is assumed.

Proof: Apply the inherited actual zero-equation cumulative function theorem, an explicitly finite natural cast. Convert that cast to its natural value and apply the native binomial evaluation of Q.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/plane-surface-explicit-polynomial-eval, DeformationAndDerivedPatchingAlgebra:R03.3/plane-zero-equation-function, mathlib:ENat.toNat_natCast.

## Uniqueness for the zero-equation cumulative function

DeformationAndDerivedPatchingAlgebra:R03.3/plane-zero-equation-polynomial-unique — TauCeti.HilbertSamuel.planeZeroEquation_polynomial_unique.

For the actual zero-equation quotient over any field, any rational polynomial agreeing with cumulative lengths on an arbitrary natural tail equals Q.

Hypotheses: Polynomial arithmetic is in ℚ. All equation coefficient fields are arbitrary; no algebraic closure, perfectness, reducedness, irreducibility or characteristic-zero assumption is imposed. For finite-order statements, native order(f)=(d:ℕ∞), which excludes the zero equation and includes unit equations. Actual rings, ideal images, module actions, quotient lengths and previously proved finite-value conversions are used exactly as in the inherited plan. No curve Krull dimension or general Hilbert–Serre existence theorem is assumed.

Proof: Use the infinite rational image of the supplied natural tail. The all-index actual length equality identifies both evaluations there. Apply native infinite-evaluation uniqueness. Infinite order of the zero series is retained.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/plane-zero-equation-polynomial-eval, mathlib:Polynomial.eq_of_infinite_eval_eq, mathlib:Set.Ici_infinite, mathlib:Set.infinite_image_iff, mathlib:Nat.cast_injective.

Test CurvePolynomialTests.surface_unique (characterisation): Any rational polynomial agreeing eventually with the actual zero-equation cumulative quotient lengths over F₂ equals Q.

## Native polynomial existence for the zero equation

DeformationAndDerivedPatchingAlgebra:R03.3/plane-zero-equation-native-polynomial-existence — TauCeti.HilbertSamuel.planeZeroEquation_existsUnique_polynomial.

The actual cumulative quotient-length function of k[[x,y]]/(0) has a unique eventual rational polynomial Q. The existence witness is zero, since every nonnegative index already agrees.

Hypotheses: Polynomial arithmetic is in ℚ. All equation coefficient fields are arbitrary; no algebraic closure, perfectness, reducedness, irreducibility or characteristic-zero assumption is imposed. For finite-order statements, native order(f)=(d:ℕ∞), which excludes the zero equation and includes unit equations. Actual rings, ideal images, module actions, quotient lengths and previously proved finite-value conversions are used exactly as in the inherited plan. No curve Krull dimension or general Hilbert–Serre existence theorem is assumed.

Proof: Supply Q and the proved all-index actual evaluation theorem. Any second eventual witness equals Q by the native uniqueness specialization.

Prerequisites: DeformationAndDerivedPatchingAlgebra:R03.3/plane-zero-equation-polynomial-eval, DeformationAndDerivedPatchingAlgebra:R03.3/plane-zero-equation-polynomial-unique.

All eight stages remain partial and every implementation status remains unchecked. The native unique-polynomial proof boundary is distinct from the still-required general Hilbert–Serre theorem, native curve dimension, tangent-cone kernel, completion and the full intrinsic/ambient multiplicity comparison. No inherited target, supplier request, gap, source finding or planet is removed.

## Degree-wise initial relations on actual equation jets

Codex — codex-a71f92, 3 October 2026; continuation of #551 at mathematical
base `7a0839ba10a362fba9724a9704e986412ea03aa8`. This section adds ten
declaration nodes, one actual projection construction, five API items and six
typed acceptance examples. It preserves all eight incoming stage statuses (three partial and five
not_read), with every implementation status unchecked. The full suggested file remains an admitted
planning interface; a separately archived native prototype proves these adapters
together with the complete incoming finite-jet and polynomial proof prefix.

Let σ be finite, k a commutative ring, R=k[[X_i]] and v the actual algebraic
ideal generated by the variables. Write HC_n for Mathlib's existing
power-series-valued homogeneous component. No generic component operation,
quotient carrier, Rees algebra, or graded ring is replanned.

The coefficient criterion first gives, for g∈v^n,

    HC_n(g)=0  iff  g∈v^(n+1).

The membership assumption matters: a lower-degree term has zero degree-n
component but need not belong to the next ideal power. A homogeneous w of
degree r belongs to v^r by the already checked algebraic ideal/order
equivalence, not by treating an ideal as closed under an unspecified infinite
sum. These adapters work with zero divisors in the coefficient ring.

Now impose NoZeroDivisors k, native order(f)=d, and d≤n. For g∈v^n,

    g∈(f)+v^(n+1)
      iff HC_n(g)=HC_d(f)·w for some homogeneous w of degree n−d.

For the forward direction write g=f·a+b. The actual next-power term b
has zero degree-n component. Because f·a∈v^n, exact-order cancellation
puts a in v^(n−d); then take w=HC_(n−d)(a). Native component
multiplicativity supplies the equality. For the reverse direction, w
lies in v^(n−d), so f·w∈v^n. The component equality makes
g−f·w belong to v^(n+1), giving actual ideal-sum membership. Both
directions are proved, including a=0, n=d, n=0 and unit equations when
the exact-order premise applies. No division in the coefficient ring is used.

When n<d and only d≤order(f) is known, f already lies in v^(n+1).
Thus the denominator is simply v^(n+1), and vanishing is HC_n(g)=0.
This branch needs neither product-order cancellation nor a domain. The zero
equation is handled separately at every index without replacing its infinite
order by order.toNat.

The actual map used in the statement is

    φ_f,n : ↥(v^n) →ₗ[k] R/((f)+v^(n+1)),   g ↦ [g].

It is the composition of the native subtype and quotient maps with scalar
restriction. Its definition and representative/denominator API need no
finiteness of σ. It is not an algebra homomorphism, and it is not claimed
surjective onto the whole cumulative jet. Its degree-wise kernel is now
characterized, but identifying its image with the existing q^n/q^(n+1)
layer of A=R/(f), converting series components to homogeneous polynomials,
and assembling a multiplicatively compatible graded algebra map remain
separate obligations. This checkpoint does not assert the full tangent-cone
isomorphism, curve dimension, or intrinsic/ambient multiplicity comparison.

The mathematical source is the credited DDPA-JET-HANDOFF §5, equation (9)
and both directions of its degree-wise argument, with §§3–4 supplying actual
powers and native initial components. The finite-variable and no-zero-divisors
generalization is an authored deduction from the inherited exact-order
preimage theorem and pinned component formula. This is not presented as a
printed general theorem or as a fresh full-paper extraction. Selected native
declarations were read with their ambient assumptions at Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174; exact source hashes and bounded
upstream screens are recorded in HS-INITIAL-RELATION-PIN-a71f92.

### Declaration-by-declaration proof boundary

#### Homogeneous series in the matching ideal power

`DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-variable-ideal-membership` — `TauCeti.HilbertSamuel.homogeneous_mem_variableIdeal_pow`.

For finite σ, every degree-n homogeneous series g over any commutative ring belongs to the algebraic variable-ideal power v^n, including zero, n=0 and zero-divisor coefficients.

1. Use native IsHomogeneous.coeff_eq_zero to kill every coefficient of degree strictly below n.

2. Apply native nat_le_order, then the existing algebraic variable-ideal-power/order equivalence. No topological closure or infinite ideal sum is introduced.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/variable-ideal-power-order`, `mathlib:MvPowerSeries.IsHomogeneous.coeff_eq_zero`, `mathlib:MvPowerSeries.nat_le_order`.

#### Degree component detects the next variable-ideal power

`DeformationAndDerivedPatchingAlgebra:R03.3/degree-component-next-power` — `TauCeti.HilbertSamuel.homogeneousComponent_eq_zero_iff_mem_next`.

For finite σ, any commutative ring k and g∈v^n, HC_n(g)=0 if and only if g∈v^(n+1), where HC is the existing power-series-valued homogeneous-component linear map.

1. Convert g∈v^n to its order lower bound. For HC_n(g)=0, coefficients below n vanish by order and degree-n coefficients vanish by the native component coefficient formula.

2. For a coefficient degree below n+1, split strictly below n from degree exactly n; apply native nat_le_order and the existing ideal-power equivalence.

3. Conversely membership in v^(n+1) gives n<order(g), so the already built homogeneous component vanishes. The g∈v^n premise is essential.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/variable-ideal-power-order`, `mathlib:MvPowerSeries.coeff_of_lt_order`, `mathlib:MvPowerSeries.coeff_homogeneousComponent`, `mathlib:MvPowerSeries.homogeneousComponent_of_lt_order_eq_zero`, `mathlib:MvPowerSeries.nat_le_order`.

#### Principal equation relation in a fixed degree

`DeformationAndDerivedPatchingAlgebra:R03.3/principal-degree-initial-relation` — `TauCeti.HilbertSamuel.mem_principal_add_next_iff_initial`.

For finite σ and no-zero-divisors commutative coefficients, if order(f)=d, d≤n and g∈v^n, then g∈(f)+v^(n+1) iff there is a degree-(n−d) homogeneous series w with HC_n(g)=HC_d(f)·w.

1. Write g=a·f+b with b∈v^(n+1) using native principal-ideal sum membership. Since g and b lie in v^n, f·a lies in v^n.

2. Use the exact-order ideal preimage to obtain a∈v^(n−d), with d+(n−d)=n justified by d≤n. Select the native homogeneous component w=HC_(n−d)(a).

3. Apply native component multiplicativity at the two order lower bounds, and kill HC_n(b) by the next-power adapter. This proves the forward implication even when a=0.

4. Conversely homogeneity puts w in v^(n−d). Hence f·w∈v^n, and native component multiplicativity identifies its degree-n component with HC_d(f)·w.

5. The assumed component equality makes HC_n(g−f·w)=0. The next-power adapter yields g−f·w∈v^(n+1), supplying an actual witness of principal-ideal sum membership.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/variable-ideal-power-order`, `DeformationAndDerivedPatchingAlgebra:R03.3/exact-order-mul-ideal-preimage`, `DeformationAndDerivedPatchingAlgebra:R03.3/homogeneous-variable-ideal-membership`, `DeformationAndDerivedPatchingAlgebra:R03.3/degree-component-next-power`, `mathlib:Ideal.mem_span_singleton_sup`, `mathlib:Ideal.pow_le_pow_right`, `mathlib:MvPowerSeries.isHomogeneous_homogeneousComponent`, `mathlib:MvPowerSeries.isHomogeneous_iff_eq_homogeneousComponent`, `mathlib:MvPowerSeries.homogeneousComponent_mul_of_le_order`.

#### Equation invisible strictly below its order

`DeformationAndDerivedPatchingAlgebra:R03.3/principal-degree-below-order` — `TauCeti.HilbertSamuel.mem_principal_add_next_below_order`.

For finite σ and arbitrary commutative k, n<d≤order(f) and g∈v^n imply g∈(f)+v^(n+1) iff HC_n(g)=0. Only an order lower bound is needed; no product-order cancellation or domain hypothesis is used.

1. From n<d obtain n+1≤d≤order(f), so f belongs to v^(n+1). Native principal-ideal containment collapses (f)+v^(n+1) to v^(n+1).

2. Apply the next-power component criterion. Do not use truncated n−d to assert the upper-branch witness theorem at a small index.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/variable-ideal-power-order`, `DeformationAndDerivedPatchingAlgebra:R03.3/degree-component-next-power`, `mathlib:Ideal.span_singleton_le_iff_mem`.

#### Actual degree-n projection into the equation jet

`DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-projection` — `TauCeti.HilbertSamuel.curveDegreeProjection`.

For every variable type σ and commutative k, φ_f,n:↥(v^n)→ₗ[k]R/((f)+v^(n+1)) sends a native ideal-power element g to its actual quotient class. This is a coefficient-linear map, not an algebra homomorphism or a claimed surjection onto the entire jet.

1. Compose the native submodule subtype with the native quotient projection, restricting both scalar structures from R to k.

2. The target is the existing equation-jet quotient, not a prescribed Hilbert function or an alternative definition of the associated graded ring. Constructing its image comparison with the q^n/q^(n+1) layer remains a separate leaf.

Inputs: `mathlib:Submodule.subtype`, `mathlib:Submodule.mkQ`, `mathlib:LinearMap.restrictScalars`, `mathlib:LinearMap.comp`.

#### Projection on its actual representative

`DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-projection-apply` — `TauCeti.HilbertSamuel.curveDegreeProjection_apply`.

For every σ, CommRing k, n and g∈v^n as a native subtype element, φ_f,n(g) is Submodule.mkQ((f)+v^(n+1))(g).

1. Unfold the composition and scalar restriction; both preserve the underlying native functions, so the representative formula is definitional.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-projection`.

#### Projection vanishes exactly on the actual denominator

`DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-projection-vanishing` — `TauCeti.HilbertSamuel.curveDegreeProjection_eq_zero_iff`.

For every σ and commutative k, φ_f,n(g)=0 iff the ambient representative g belongs to the actual ideal (f)+v^(n+1).

1. Apply the native Submodule.Quotient.mk_eq_zero statement to the actual representative formula; no field or finite-length assumption is needed.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-projection`, `DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-projection-apply`, `mathlib:Submodule.Quotient.mk_eq_zero`.

#### Actual projection kernel above equation order

`DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-projection-kernel` — `TauCeti.HilbertSamuel.curveDegreeProjection_kernel`.

For finite σ and no-zero-divisors commutative k, order(f)=d≤n and g:↥(v^n), φ_f,n(g)=0 iff HC_n(g)=HC_d(f)·w for some degree-(n−d) homogeneous series w.

1. Use the actual quotient vanishing API, then apply the proved principal-degree initial relation to the subtype's own membership proof.

2. This characterizes the full kernel of the specified coefficient-linear degree map. It is not yet ker(k[X_i]→gr_q(R/(f)))=(in(f)); that statement still needs polynomial comparison, assembly, multiplicative compatibility and native graded quotient interfaces.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-projection-vanishing`, `DeformationAndDerivedPatchingAlgebra:R03.3/principal-degree-initial-relation`.

#### Actual projection kernel below equation order

`DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-projection-below-order` — `TauCeti.HilbertSamuel.curveDegreeProjection_below_order`.

For finite σ, arbitrary commutative k, n<d≤order(f) and g:↥(v^n), φ_f,n(g)=0 iff HC_n(g)=0.

1. Combine the actual quotient vanishing API and the small-index principal-ideal collapse. A weak order bound is sufficient and is kept distinct from exact finite order in the upper branch.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-projection-vanishing`, `DeformationAndDerivedPatchingAlgebra:R03.3/principal-degree-below-order`.

#### Zero-equation degree projection without finite order

`DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-projection-zero-equation` — `TauCeti.HilbertSamuel.curveDegreeProjection_zero_equation`.

For finite σ and every commutative coefficient ring, φ_0,n(g)=0 iff HC_n(g)=0 for every g:↥(v^n). This includes the zero equation of infinite order without order.toNat.

1. The actual ideal generated by zero is bottom. Reduce its denominator sum to v^(n+1) and apply the next-power component criterion.

2. Keep this statement separate from the finite-order principal equation argument; no nontrivial local-ring instance on a unit quotient is required.

Inputs: `DeformationAndDerivedPatchingAlgebra:R03.3/curve-degree-projection-vanishing`, `DeformationAndDerivedPatchingAlgebra:R03.3/degree-component-next-power`, `mathlib:Ideal.span_singleton_eq_bot`.

### Projection API and discriminating examples

`TauCeti.HilbertSamuel.curveDegreeProjection_apply` (simp): For every σ, CommRing k, n and g∈v^n as a native subtype element, φ_f,n(g) is Submodule.mkQ((f)+v^(n+1))(g).

`TauCeti.HilbertSamuel.curveDegreeProjection_eq_zero_iff` (characterisation): For every σ and commutative k, φ_f,n(g)=0 iff the ambient representative g belongs to the actual ideal (f)+v^(n+1).

`TauCeti.HilbertSamuel.curveDegreeProjection_kernel` (characterisation): For finite σ and no-zero-divisors commutative k, order(f)=d≤n and g:↥(v^n), φ_f,n(g)=0 iff HC_n(g)=HC_d(f)·w for some degree-(n−d) homogeneous series w.

`TauCeti.HilbertSamuel.curveDegreeProjection_below_order` (compatibility): For finite σ, arbitrary commutative k, n<d≤order(f) and g:↥(v^n), φ_f,n(g)=0 iff HC_n(g)=0.

`TauCeti.HilbertSamuel.curveDegreeProjection_zero_equation` (compatibility): For finite σ and every commutative coefficient ring, φ_0,n(g)=0 iff HC_n(g)=0 for every g:↥(v^n). This includes the zero equation of infinite order without order.toNat.

`InitialRelationTests.zero_input` (degenerate): For every commutative k, equation f and index n, the actual map φ_f,n sends the zero element of the native v^n subtype to zero.

`InitialRelationTests.unit_equation` (degenerate): For f=1, every actual ideal-power representative maps to zero, for every index, because the equation ideal is top; no IsLocalRing instance on the zero quotient is assumed.

`InitialRelationTests.zero_equation_survives` (computation): For k=ℚ, f=0 and n=1, the actual class of X₀ from v survives in R/v²; zero equation is not interpreted as a finite-order unit.

`InitialRelationTests.nonreduced_survives` (non-example): For k=F₂, f=X₀² and n=1, the actual class of X₀ survives in R/(X₀²,v²). Passing to a radical equation ideal would wrongly kill it.

`InitialRelationTests.nonreduced_square_vanishes` (computation): For k=F₂, f=X₀² and n=2, the actual degree-two representative X₀² belongs to v² and maps to zero in R/(X₀²,v³); both this and the surviving degree-one class are required.

`InitialRelationTests.equation_order_boundary` (compatibility): For every finite-order equation f over no-zero-divisors commutative k in two variables, at n=d its actual representative maps to zero and HC_d(f) is a homogeneous degree-zero multiple of itself. The boundary is d≤n, not d<n.

These tests use native series and ideal quotients, not a record storing its
expected answer. In characteristic two, the surviving degree-one X₀ class
and the vanishing degree-two X₀² relation are checked separately. They
reject radicalization; they do not independently assemble the still-missing
graded multiplication comparison. Unit and zero equations remain distinct,
and the n=d example rejects the incorrect strict-boundary rule.

### Closure and next mathematical work

The codex-a71f92 continuation proves the actual degree-wise series/ideal kernel adapters and coefficient-linear equation-jet projection, including both principal relation directions, small-index, zero/unit and characteristic-two nonreduced tests. It preserves the complete incoming proof prefix. Still construct the polynomial-valued homogeneous comparison, identify the map's image with the existing q^n/q^(n+1) carrier, and assemble the multiplicatively compatible full tangent-cone graded isomorphism. Curve/support dimension, comparison with the general Hilbert–Samuel constructor, intrinsic/ambient multiplicities, general Hilbert–Serre, Artin–Rees, completion, localization, associativity, all eight stage targets and every routed source obligation remain required; canonical bodies remain admitted and every node remains unchecked and every stage retains its incoming partial or not_read status.

All 147 incoming node objects, source issues, requests, gaps, route records,
accepted ownership boundaries and the sibling R03.6 packet are retained.
This section supersedes historical omissions only for these native
degree-wise adapters. The earlier reader and handoff remain available as
credited history. No canonical implementation, mathematical closure of
the roadmap, or blanket source coverage is inferred from elaboration.

### Public checked evidence and assembly receipt

The [exact proof and check archive](https://github.com/CBirkbeck/tauceti-explorer/commit/1ee3d626cd226cffc0ee869aff618df03e133c65)
is retained as the PR head's second parent. Its suggested-file comment contains
the complete 2251-line native proof, including the unchanged 2018-line
incoming prefix. The archive handoff retains normalized compiler logs and
the exact immutable-view and actual-checker/intake/assembly validator scripts.
It adds no artifact path outside the issue's four permitted deliverables.

The native file passed at the exact existing Mathlib pin with 129 axiom
audits limited to propext, Classical.choice and Quot.sound, no warnings,
no errors and no admissions. The complete 3134-line canonical suggested
file elaborated with 411 expected placeholder warnings and 207 examples.
The separate native file retains 64 anonymous inherited examples and all
named tests; canonical admission is not represented as library implementation.

At publication base `9c8a340faae54f977214d1a159764c3ca25a1e0e`, the actual indexed
packet checker and intake file rules pass. Actual build.assemble retains
the R03.6 sibling and gives 210 declarations for the whole roadmap.
Both own and scoped combined dependency DAGs are acyclic, with no unresolved
references. All 65 applicable accepted restructure pairs are reachable;
12 of 13 required supplier pairs are reachable. The inherited missing
LocalFieldsRamification layer-0 → R03.4 path is unchanged. Incoming and
candidate stage edges and other roadmaps' skipped/pending links compare
equal. These checks validate structure and preservation, not source closure.
