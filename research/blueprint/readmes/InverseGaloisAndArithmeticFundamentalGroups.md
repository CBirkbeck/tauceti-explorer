# Belyi maps, dessins d’enfants, and three-point covers, Part II: inverse Galois theory and arithmetic fundamental groups

The first prerequisite is [Belyi maps, dessins d’enfants, and three-point covers](../../../content/tau-ceti/BelyiMaps/README.md), atlas identifier tauceti:TauCetiRoadmap/BelyiMaps. This continuation builds general arithmetic fundamental groups, Hilbert specialization, rigidity for general branch sets, arithmetic embedding problems and Hurwitz-space methods on those existing three-point constructions. The ownership boundaries follow RS-29. The general inverse Galois problem over ℚ is open; neither Belyi’s theorem nor a polynomial specialization interface resolves it.

The document retains IG.0 through IG.6. Its declaration graph supplies an elementary component of IG.2, closing from the two pinned libraries to rational-coefficient polynomial specialization and simultaneous finite avoidance. It does not close IG.2 or any other stage. The remaining source arguments are listed under each layer. All declarations have implementation status unchecked. The accompanying suggested file checks the shape of signatures and examples, and supplies no proofs.

## Scope, notation and intended use

Fix a field K, with arbitrary characteristic. Write T for the parameter in K(T), represented by the native RatFunc type, and Y for the variable of a polynomial in K(T)[Y]. The distinction is part of the interface: substituting T=t must leave Y unchanged. A single parameter and a single polynomial variable suffice for this component; the Hilbertian-field target retains arbitrary positive numbers of parameters and polynomial variables. No equivalence between these scopes is assumed.

For a rational function f, num(f) and denom(f) are the native normalized numerator and monic reduced denominator. The denominator is always a nonzero polynomial, and denom(0)=1. Evaluating that denominator at a parameter can nevertheless give zero. Define f to be regular at t precisely when denom(f)(t)≠0. This is an intrinsic condition on a rational function, not a condition on whichever fraction happened to present it. The function (T²−1)/(T−1) is T+1 and is regular at 1.

Native RatFunc.eval is a total field-valued function: its value at a genuine pole is zero, because field division by zero has value zero. Its totality must not be confused with an everywhere-defined ring specialization. In particular, at zero the individual values of T and T⁻¹ are zero, whereas the value of their product is one. The native addition and multiplication theorems carry exactly the denominator hypotheses needed below.

There are two complementary polynomial interfaces. A polynomial over the subring of functions regular at t can be mapped along an actual ring homomorphism. A polynomial over all of K(T) can be specialized coefficient by coefficient by a total function, with conditional ring laws. The comparison between those interfaces is a theorem, and the existing Polynomial.toSubring performs the lift. This uses one polynomial representation throughout and introduces no replacement fraction field, polynomial type or generic localization theory.

The final existence theorem needs K infinite. The subring, its evaluation, the coefficient specialization, the guard and the finite bad-set theorem work over every field. No characteristic-zero, separability, generic irreducibility, positive degree or Galois hypothesis is inserted into them. Keeping these assumptions separate lets the arithmetic arguments reuse the same elementary algebra without overstating their conclusions.

## Baseline and design boundaries

The pins are Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The packet lists 43 native declarations, each inspected in its pinned source. Native subrings supply the inherited ring operations and inclusion; native ring homomorphisms supply their general algebraic laws. RatFunc supplies reduced fractions and evaluation. Polynomial supplies finite coefficient sums, support, coefficient maps, lifting to subrings, degree tests and finite root sets. The plan adds their precise specialization interface.

A tempting duplicate is the construction of a polynomial with coefficients in a subring. Polynomial.toSubring already accepts the exact coefficient-containment hypothesis, and Polynomial.map_toSubring recovers the polynomial after inclusion. The conditional ring-law proofs therefore invoke that construction directly. The new comparison lemma only identifies its evaluation with the chosen total coefficient function.

The reviewed AUDIT-09 also identifies existing abstract Galois-category classification. IG.0 must construct the actual finite-étale scheme category and verify its fibre-functor hypotheses before applying that library. An abstract classification does not itself provide an étale fundamental group for every desired scheme. This distinction is preserved in the remaining work rather than filled by a new abstract stand-in.

The open Mathlib proposal [#31603](https://github.com/leanprover-community/mathlib4/pull/31603), inspected at head c3c4dd2bc13e0711723f507b24e7bf97e21f527f, changes the underlying representation of RatFunc to a fraction-field abbreviation. This component uses its public operations and does not choose a competing representation. Public open-PR searches for Hilbertian and specialization and Zulip archive searches supplied no other matching interface. A search result is evidence about the search performed, not a proof that unpublished work does not exist.

ArithmeticDynamics:DY.6 owns specialization of projective rational maps through primitive homogeneous lifts and their resultant. That construction guarantees a projective map of the intended degree. Here a coefficient polynomial in one affine variable is being specialized; its leading coefficient and coefficient poles govern a different degree statement. DT.5’s regular Mahler points impose regularity along an infinite forward orbit, and CA.2’s rational power series compare power-series and Laurent-series carriers. Those outputs remain with their owners.

## IG.2 — the declaration graph

The following nodes are listed in dependency order. Each stated proof uses only its listed prerequisite nodes and pinned declarations, together with elementary algebra, finite sums, extensionality and finite-set induction. The graph has four constructions, eight lemmas and three theorems. The two atlas planets are the regular subring and rational-coefficient polynomial specialization.
### 1. Rational functions regular at a point

Declaration: TauCeti.RationalSpecialization.regularSubring. Node: InverseGaloisAndArithmeticFundamentalGroups:IG.2/regular-subring.

For t ∈ K, construct the native subring Rₜ of K(T) whose elements are exactly f with denom(f)(t) ≠ 0, using the monic reduced denominator. Its operations and inclusion are inherited from K(T).

Proof route:

1. Use RatFunc.denom_zero and denom_one for the nullary operations.
2. RatFunc.denom_add_dvd and denom_mul_dvd reduce closure under addition and multiplication to nonvanishing of the product of the input denominators. Evaluation of a divisor of a polynomial with nonzero value is nonzero.
3. For negation, write −f = (−num(f))/denom(f) using RatFunc.num_div_denom; RatFunc.denom_dvd shows that denom(−f) divides denom(f). Bundle these closure facts with the native Subring constructor.

Prerequisites: mathlib:Subring, mathlib:Subring.subtype, mathlib:RatFunc.denom, mathlib:RatFunc.num, mathlib:RatFunc.denom_zero, mathlib:RatFunc.denom_one, mathlib:RatFunc.denom_ne_zero, mathlib:RatFunc.denom_add_dvd, mathlib:RatFunc.denom_mul_dvd, mathlib:RatFunc.denom_dvd, mathlib:RatFunc.num_div_denom, mathlib:RatFunc.denom_algebraMap, mathlib:Polynomial.evalRingHom.

Uses:

- Dèbes §5.2.2, specialization-map step in Proposition 5.2.5, printed p.138: Select a ring on which evaluation respects algebra, by excluding reduced coefficient poles.
- IG.2 rational specialization: Provide a native subring for Polynomial.toSubring and for the restriction of native evaluation.

Planning API:

- TauCeti.RationalSpecialization.mem_regularSubring (characterisation): For f ∈ K(T), f belongs to Rₜ exactly when denom(f)(t) ≠ 0; this API item is the following membership node.
- TauCeti.RationalSpecialization.algebraMap_mem_regularSubring (coercion): Every image of q ∈ K[T] in K(T) belongs to Rₜ, since its reduced denominator is one.
- TauCeti.RationalSpecialization.regularSubring_le_iff (characterisation): For a native subring A of K(T), A ≤ Rₜ exactly when denom(f)(t) ≠ 0 for every f ∈ A. Use inherited Subring extensionality and operation laws.

Definition tests:

- TauCeti.RationalSpecialization.regularSubring.zero_test (degenerate): The zero rational function belongs to R₀ over ℚ.
- TauCeti.RationalSpecialization.regularSubring.cancellation_test (compatibility): Over ℚ, (T²−1)/(T−1) belongs to R₁ because its reduced representative is T+1.
- TauCeti.RationalSpecialization.regularSubring.pole_test (non-example): Over ℚ, T⁻¹ does not belong to R₀.

Acceptance:

- Reduction must cancel removable factors before deciding regularity.
- Rₜ is a subring, and the value zero alone does not certify a pole.

Sources: mathlib-ratfunc, RatFunc.eval, eval_add and eval_mul; Basic reduced-denominator API; debes, §5.2.1–5.2.2, printed pp.136–138.

### 2. Membership by reduced denominator

Declaration: TauCeti.RationalSpecialization.mem_regularSubring. Node: InverseGaloisAndArithmeticFundamentalGroups:IG.2/regular-membership.

For t ∈ K and f ∈ K(T), f ∈ Rₜ if and only if denom(f)(t) ≠ 0.

Proof route:

1. Unfold the carrier of regularSubring; the inherited subring structure does not change membership.

Prerequisites: InverseGaloisAndArithmeticFundamentalGroups:IG.2/regular-subring.

Acceptance:

- Both directions use the reduced denominator, including denom(0)=1.

Sources: mathlib-ratfunc, RatFunc.eval, eval_add and eval_mul; Basic reduced-denominator API; debes, §5.2.1–5.2.2, printed pp.136–138.

### 3. Evaluation on the regular subring

Declaration: TauCeti.RationalSpecialization.evalRegular. Node: InverseGaloisAndArithmeticFundamentalGroups:IG.2/regular-evaluation.

Construct eₜ : Rₜ → K as a native ring homomorphism, with eₜ(f)=RatFunc.eval(id,t,f). Thus its value is num(f)(t)/denom(f)(t).

Proof route:

1. Use regular-membership to supply the two nonvanishing hypotheses in each of RatFunc.eval_add and eval_mul.
2. Use RatFunc.eval_zero and eval_one for the remaining homomorphism fields. The underlying function is the existing evaluation, restricted to Rₜ.

Prerequisites: InverseGaloisAndArithmeticFundamentalGroups:IG.2/regular-subring, InverseGaloisAndArithmeticFundamentalGroups:IG.2/regular-membership, mathlib:RingHom, mathlib:RatFunc.eval, mathlib:RatFunc.eval_zero, mathlib:RatFunc.eval_one, mathlib:RatFunc.eval_add, mathlib:RatFunc.eval_mul, mathlib:RatFunc.eval_algebraMap.

Uses:

- IG.2 specialization-map-regular and conditional ring laws: Map the lifted coefficient polynomial along a genuine ring homomorphism.
- Dèbes §5.2.2, printed p.138: Supply the rational-coefficient part of a specialization morphism; extending across algebraic roots remains a separate obligation.

Planning API:

- TauCeti.RationalSpecialization.evalRegular_apply (compatibility): For f ∈ Rₜ, eₜ(f) equals the native RatFunc.eval(id,t,f), including its normalized numerator and denominator convention.
- TauCeti.RationalSpecialization.evalRegular_polynomial (compatibility): For q ∈ K[T], evaluate its image in Rₜ using the canonical polynomial-membership proof: eₜ(q)=q(t).
- TauCeti.RationalSpecialization.evalRegular_surjective (other): The map eₜ is surjective onto K: a ∈ K is attained by the constant polynomial a. Ring-map operation laws come from the native bundle.

Definition tests:

- TauCeti.RationalSpecialization.evalRegular.one_test (degenerate): Over ℚ, e₀(1)=1.
- TauCeti.RationalSpecialization.evalRegular.parameter_test (computation): Over ℚ, e₃(T)=3, with T carried into R₃ by the polynomial inclusion.
- TauCeti.RationalSpecialization.evalRegular.kernel_test (non-example): Over ℚ, e₂(T−2)=0, so this ring map must allow a nontrivial kernel.

Acceptance:

- The evaluation map need not be injective: T−t is in its kernel.
- It is surjective since every constant value is attained.

Sources: mathlib-ratfunc, RatFunc.eval, eval_add and eval_mul; Basic reduced-denominator API; debes, §5.2.1–5.2.2, printed pp.136–138.

### 4. Rational-coefficient polynomial specialization

Declaration: TauCeti.RationalSpecialization.specialize. Node: InverseGaloisAndArithmeticFundamentalGroups:IG.2/polynomial-specialization.

For t ∈ K and p=Σₙ cₙ(T)Yⁿ ∈ K(T)[Y], define spₜ(p)=Σₙ RatFunc.eval(id,t,cₙ)Yⁿ ∈ K[Y], using a finite sum over the native support of p. This is a total function. Ring laws are asserted only when all input coefficients are regular at t.

Proof route:

1. Use Polynomial.sum with monomial n (RatFunc.eval(id,t,cₙ)); no new polynomial carrier is introduced.
2. RatFunc.eval_zero ensures that coefficients outside the original support remain zero. Keep the total coefficient function distinct from the ring map defined on Rₜ.

Prerequisites: mathlib:Polynomial.sum, mathlib:RatFunc.eval, mathlib:RatFunc.eval_zero, mathlib:Polynomial.coeff_monomial.

Uses:

- Dèbes §5.2.1 Hilbert subsets, printed p.136: Give a precise one-parameter, one-variable meaning to P(t,Y) using the existing reduced-fraction evaluation.
- IG.2 specialization-degree and IG.6 explicit specializations: Keep the outer variable and its coefficients visible, so degree loss can be checked before arithmetic conclusions are transported.

Planning API:

- TauCeti.RationalSpecialization.coeff_specialize (projection): The coefficient of Yⁿ in spₜ(p) is RatFunc.eval(id,t,p.coeff(n)); this API item is the following coefficient node.
- TauCeti.RationalSpecialization.specialize_C (simp): For f ∈ K(T), spₜ(C(f))=C(RatFunc.eval(id,t,f)).
- TauCeti.RationalSpecialization.specialize_X (simp): Specialization fixes Y, the outer polynomial variable, for every t.
- TauCeti.RationalSpecialization.specialize_zero (simp): Specialization sends the zero polynomial to zero for every t.
- TauCeti.RationalSpecialization.specialize_polynomialCoefficients (compatibility): For p ∈ K[T][Y], first map its coefficients into K(T) and then specialize; the result equals the native Polynomial.map along evaluation K[T] → K at t.

Definition tests:

- TauCeti.RationalSpecialization.specialize.zero_test (degenerate): Over ℚ, sp₀(0)=0.
- TauCeti.RationalSpecialization.specialize.quadratic_test (computation): Over ℚ, sp₂(Y²−T)=Y²−2.
- TauCeti.RationalSpecialization.specialize.pole_multiplication_test (non-example): Over ℚ at t=0, sp₀(C(T)C(T⁻¹))=1 while sp₀(C(T))sp₀(C(T⁻¹))=0.
- TauCeti.RationalSpecialization.specialize.degree_drop_test (non-example): Over ℚ, sp₀(TY+1)=1 has natural degree zero even though TY+1 has degree one and every coefficient is regular at zero.

Acceptance:

- The variable T is replaced by t; the polynomial variable Y is unchanged.
- At poles the total function still returns a polynomial, but its multiplication law can fail.

Sources: mathlib-ratfunc, RatFunc.eval, eval_add and eval_mul; Basic reduced-denominator API; debes, §5.2.1–5.2.2, printed pp.136–138.

### 5. Coefficients after specialization

Declaration: TauCeti.RationalSpecialization.coeff_specialize. Node: InverseGaloisAndArithmeticFundamentalGroups:IG.2/specialization-coefficients.

For every t ∈ K, p ∈ K(T)[Y] and n ∈ ℕ, the coefficient of Yⁿ in spₜ(p) is RatFunc.eval(id,t,p.coeff(n)).

Proof route:

1. Apply Polynomial.coeff_sum and coeff_monomial to the finite defining sum.
2. At an index in p.support only its own term survives; outside support the coefficient is zero by Polynomial.mem_support_iff and RatFunc.eval_zero.

Prerequisites: InverseGaloisAndArithmeticFundamentalGroups:IG.2/polynomial-specialization, mathlib:Polynomial.coeff_sum, mathlib:Polynomial.coeff_monomial, mathlib:Polynomial.mem_support_iff, mathlib:RatFunc.eval_zero.

Acceptance:

- The statement holds at a pole as a statement about the total function.

Sources: mathlib-polynomial, Polynomial.coeff_sum, coeff_monomial and mem_support_iff; debes, §5.2.1–5.2.2, printed pp.136–138.

### 6. Compatibility with polynomial coefficient maps

Declaration: TauCeti.RationalSpecialization.specialize_map_regular. Node: InverseGaloisAndArithmeticFundamentalGroups:IG.2/specialization-map-regular.

For q ∈ Rₜ[Y], spₜ(map(inclusion,q))=map(eₜ,q), where inclusion is the native map Rₜ → K(T).

Proof route:

1. Use specialization-coefficients on the left and Polynomial.coeff_map on both polynomial maps.
2. The resulting coefficient equality is the defining underlying function of evalRegular. Apply Polynomial.ext.

Prerequisites: InverseGaloisAndArithmeticFundamentalGroups:IG.2/regular-subring, InverseGaloisAndArithmeticFundamentalGroups:IG.2/regular-evaluation, InverseGaloisAndArithmeticFundamentalGroups:IG.2/specialization-coefficients, mathlib:Subring.subtype, mathlib:Polynomial.map, mathlib:Polynomial.coeff_map, mathlib:Polynomial.ext.

Acceptance:

- The right side is an actual polynomial ring map on a domain where evaluation is defined.

Sources: mathlib-polynomial, Polynomial.coeff_map and Polynomial.ext; debes, §5.2.1–5.2.2, printed pp.136–138.

### 7. Specialization preserves addition

Declaration: TauCeti.RationalSpecialization.specialize_add. Node: InverseGaloisAndArithmeticFundamentalGroups:IG.2/specialization-add.

For p,q ∈ K(T)[Y] whose every coefficient has nonzero denominator at t, spₜ(p + q)=spₜ(p) + spₜ(q).

Proof route:

1. Use regular-membership to lift p and q with the existing Polynomial.toSubring; Polynomial.map_toSubring recovers p and q under inclusion.
2. Apply Polynomial.map_add to the lifted polynomials, then specialization-map-regular to their sum.
3. Apply Polynomial.map_add for eₜ and identify both factors using specialization-map-regular. No unrestricted ring map K(T) → K is constructed.

Prerequisites: InverseGaloisAndArithmeticFundamentalGroups:IG.2/regular-membership, InverseGaloisAndArithmeticFundamentalGroups:IG.2/specialization-map-regular, mathlib:Polynomial.toSubring, mathlib:Polynomial.map_toSubring, mathlib:Polynomial.map_add.

Acceptance:

- Every coefficient-regularity hypothesis is retained; the multiplication pole test fails if it is removed.

Sources: mathlib-polynomial, Polynomial.toSubring, map_toSubring and map_add; debes, §5.2.1–5.2.2, printed pp.136–138.

### 8. Specialization preserves multiplication

Declaration: TauCeti.RationalSpecialization.specialize_mul. Node: InverseGaloisAndArithmeticFundamentalGroups:IG.2/specialization-mul.

For p,q ∈ K(T)[Y] whose every coefficient has nonzero denominator at t, spₜ(p · q)=spₜ(p) · spₜ(q).

Proof route:

1. Use regular-membership to lift p and q with the existing Polynomial.toSubring; Polynomial.map_toSubring recovers p and q under inclusion.
2. Apply Polynomial.map_mul to the lifted polynomials, then specialization-map-regular to their product.
3. Apply Polynomial.map_mul for eₜ and identify both factors using specialization-map-regular. No unrestricted ring map K(T) → K is constructed.

Prerequisites: InverseGaloisAndArithmeticFundamentalGroups:IG.2/regular-membership, InverseGaloisAndArithmeticFundamentalGroups:IG.2/specialization-map-regular, mathlib:Polynomial.toSubring, mathlib:Polynomial.map_toSubring, mathlib:Polynomial.map_mul.

Acceptance:

- Every coefficient-regularity hypothesis is retained; the multiplication pole test fails if it is removed.

Sources: mathlib-polynomial, Polynomial.toSubring, map_toSubring and map_mul; debes, §5.2.1–5.2.2, printed pp.136–138.

### 9. Denominator product of a polynomial

Declaration: TauCeti.RationalSpecialization.denominatorProduct. Node: InverseGaloisAndArithmeticFundamentalGroups:IG.2/denominator-product.

For p ∈ K(T)[Y], define D(p) ∈ K[T] to be the product over n ∈ p.support of denom(p.coeff(n)). It is a product with repetitions, not a least common denominator. The empty product for p=0 is one.

Proof route:

1. Use the native finite coefficient support and RatFunc.denom; multiplication occurs in K[T].
2. The choice of native reduced denominator makes D intrinsic to p. Coefficients that are zero contribute no support index; their denominator would be one.

Prerequisites: mathlib:RatFunc.denom, mathlib:RatFunc.denom_zero, mathlib:RatFunc.denom_algebraMap, mathlib:Polynomial.mem_support_iff.

Uses:

- IG.2 specialization-guard and finite-bad-specializations: Replace all coefficient-domain conditions by one nonzero polynomial whose root set is finite.
- Dèbes Proposition 5.2.5, printed pp.137–138: Isolate the elementary rational-coefficient contribution to the finite exceptional set, without claiming to account for algebraic-root specialization.

Planning API:

- TauCeti.RationalSpecialization.denominatorProduct_zero (simp): D(0)=1.
- TauCeti.RationalSpecialization.denominatorProduct_C (simp): For f ∈ K(T), D(C(f))=denom(f), including f=0.
- TauCeti.RationalSpecialization.denominatorProduct_polynomialCoefficients (compatibility): For p ∈ K[T][Y], the polynomial obtained by mapping coefficients into K(T) has denominator product one.

Definition tests:

- TauCeti.RationalSpecialization.denominatorProduct.zero_test (degenerate): Over ℚ, D(0)=1.
- TauCeti.RationalSpecialization.denominatorProduct.repeated_pole_test (computation): Over ℚ, D(T⁻¹Y+T⁻¹)=T², not T.
- TauCeti.RationalSpecialization.denominatorProduct.cancellation_test (compatibility): Over ℚ, D(C((T²−1)/(T−1)))=1.

Acceptance:

- Repeated denominator factors remain repeated in D.
- Apparent poles removed by cancellation contribute no factor.

Sources: mathlib-ratfunc, RatFunc.eval, eval_add and eval_mul; Basic reduced-denominator API; debes, §5.2.1–5.2.2, printed pp.136–138.

### 10. Nonvanishing denominator product

Declaration: TauCeti.RationalSpecialization.denominatorProduct_ne_zero. Node: InverseGaloisAndArithmeticFundamentalGroups:IG.2/denominator-product-nonzero.

For every p ∈ K(T)[Y], D(p) is a nonzero polynomial in K[T], including p=0.

Proof route:

1. Every factor is nonzero by RatFunc.denom_ne_zero. A finite product in the domain K[T] is nonzero, with empty product one.

Prerequisites: InverseGaloisAndArithmeticFundamentalGroups:IG.2/denominator-product, mathlib:RatFunc.denom_ne_zero.

Acceptance:

- This theorem does not say D(p)(t) is nonzero at every t.

Sources: mathlib-ratfunc, RatFunc.eval, eval_add and eval_mul; Basic reduced-denominator API; debes, §5.2.1–5.2.2, printed pp.136–138.

### 11. The exact coefficient-regularity locus

Declaration: TauCeti.RationalSpecialization.denominatorProduct_eval_ne_zero_iff. Node: InverseGaloisAndArithmeticFundamentalGroups:IG.2/denominator-product-domain.

For all p ∈ K(T)[Y] and t ∈ K, D(p)(t) ≠ 0 if and only if denom(p.coeff(n))(t) ≠ 0 for every n ∈ ℕ.

Proof route:

1. Polynomial.eval_prod turns D(p)(t) into a finite product of denominator values. A product over a field is nonzero exactly when each factor is nonzero.
2. Outside p.support the coefficient is zero, so RatFunc.denom_zero supplies denominator one. Extend the finite conjunction to all n.

Prerequisites: InverseGaloisAndArithmeticFundamentalGroups:IG.2/denominator-product, mathlib:Polynomial.eval_prod, mathlib:Polynomial.mem_support_iff, mathlib:RatFunc.denom_zero.

Acceptance:

- For p=0 the equivalence has two true sides.

Sources: mathlib-polynomial, Polynomial.eval_prod and mem_support_iff; debes, §5.2.1–5.2.2, printed pp.136–138.

### 12. Degree preservation by the leading coefficient

Declaration: TauCeti.RationalSpecialization.natDegree_specialize. Node: InverseGaloisAndArithmeticFundamentalGroups:IG.2/specialization-degree.

If RatFunc.eval(id,t,leadingCoeff(p)) ≠ 0, then natDegree(spₜ(p))=natDegree(p). This sufficient condition needs no additional hypothesis on lower coefficients for the total coefficient function.

Proof route:

1. Above natDegree(p), Polynomial.coeff_eq_zero_of_natDegree_lt and RatFunc.eval_zero make all specialized coefficients zero; apply Polynomial.natDegree_le_iff_coeff_eq_zero.
2. At natDegree(p), specialization-coefficients identifies the coefficient with the assumed nonzero leading-coefficient value. Apply Polynomial.natDegree_eq_of_le_of_coeff_ne_zero.

Prerequisites: InverseGaloisAndArithmeticFundamentalGroups:IG.2/specialization-coefficients, mathlib:Polynomial.coeff_eq_zero_of_natDegree_lt, mathlib:Polynomial.natDegree_le_iff_coeff_eq_zero, mathlib:Polynomial.natDegree_eq_of_le_of_coeff_ne_zero, mathlib:RatFunc.eval_zero.

Acceptance:

- TY+1 at t=0 fails the hypothesis and loses degree.
- At a regular point a vanishing leading coefficient can give a lower-degree irreducible polynomial; irreducibility alone does not preserve degree.

Sources: mathlib-polynomial, Polynomial.natDegree_eq_of_le_of_coeff_ne_zero and high-coefficient tests; debes, §5.2.1–5.2.2, printed pp.136–138.

### 13. A polynomial guard for regular specialization

Declaration: TauCeti.RationalSpecialization.specialization_guard. Node: InverseGaloisAndArithmeticFundamentalGroups:IG.2/specialization-guard.

If (D(p)·num(leadingCoeff(p)))(t) ≠ 0, then every coefficient of p is regular at t and natDegree(spₜ(p))=natDegree(p).

Proof route:

1. The nonzero product value gives D(p)(t) ≠ 0 and num(leadingCoeff(p))(t) ≠ 0. Apply denominator-product-domain.
2. Apply coefficient regularity at n=natDegree(p) to its leading coefficient. The defining fraction in RatFunc.eval is nonzero since both numerator and denominator values are nonzero.
3. Apply specialization-degree.

Prerequisites: InverseGaloisAndArithmeticFundamentalGroups:IG.2/denominator-product-domain, InverseGaloisAndArithmeticFundamentalGroups:IG.2/specialization-degree, mathlib:RatFunc.eval, mathlib:RatFunc.num, mathlib:Polynomial.evalRingHom.

Acceptance:

- For p=TY+1 the guard includes T, so t=0 is excluded.
- The guard ensures degree and regularity; it does not ensure irreducibility.

Sources: mathlib-ratfunc, RatFunc.eval, eval_add and eval_mul; Basic reduced-denominator API; debes, §5.2.1–5.2.2, printed pp.136–138.

### 14. Finiteness of bad specialization parameters

Declaration: TauCeti.RationalSpecialization.finite_bad_specializations. Node: InverseGaloisAndArithmeticFundamentalGroups:IG.2/finite-bad-specializations.

For nonzero p ∈ K(T)[Y], the set of t ∈ K where either a coefficient has a pole or natDegree(spₜ(p)) differs from natDegree(p) is finite.

Proof route:

1. The polynomial G=D(p)·num(leadingCoeff(p)) is nonzero: use denominator-product-nonzero, Polynomial.leadingCoeff_ne_zero and RatFunc.num_ne_zero.
2. The contrapositive of specialization-guard puts every bad parameter in the root set of G.
3. Apply Polynomial.finite_setOfPred_isRoot and Set.Finite.subset. This is valid over finite fields too, without asserting existence of a good parameter.

Prerequisites: InverseGaloisAndArithmeticFundamentalGroups:IG.2/denominator-product-nonzero, InverseGaloisAndArithmeticFundamentalGroups:IG.2/specialization-guard, mathlib:Polynomial.leadingCoeff_ne_zero, mathlib:RatFunc.num_ne_zero, mathlib:Polynomial.finite_setOfPred_isRoot, mathlib:Set.Finite.subset.

Acceptance:

- Y²−T is regular and degree two at every t, although its irreducibility changes.
- Over F₂, (T²−T)Y+1 loses degree at every parameter; finiteness remains true.

Sources: mathlib-roots, Polynomial.finite_setOfPred_isRoot and Set.Finite.subset; debes, §5.2.1–5.2.2, printed pp.136–138.

### 15. Simultaneous avoidance for a finite polynomial family

Declaration: TauCeti.RationalSpecialization.exists_simultaneous_specialization. Node: InverseGaloisAndArithmeticFundamentalGroups:IG.2/simultaneous-finite-avoidance.

Let K be infinite, s a finite set of nonzero polynomials in K(T)[Y], and A a finite subset of K. There exists t ∈ K outside A such that every coefficient of every p ∈ s is regular at t and every spₜ(p) has the same natural degree as p.

Proof route:

1. For each p ∈ s, finite-bad-specializations supplies a finite bad set. Induct on s using Set.Finite.union to unite them and A.
2. Use Set.Finite.exists_notMem in the infinite field K to choose t outside that union. Its nonmembership gives each regularity and degree assertion.

Prerequisites: InverseGaloisAndArithmeticFundamentalGroups:IG.2/finite-bad-specializations, mathlib:Set.Finite.union, mathlib:Set.Finite.exists_notMem.

Acceptance:

- The empty family reduces to avoiding A.
- The statement must not be read as preserving irreducibility, prescribed Galois groups or linear disjointness.

Sources: mathlib-roots, Set.Finite.union and Set.Finite.exists_notMem; debes, §5.2.1–5.2.2, printed pp.136–138.

## Why the degree guard has two parts

The polynomial D(p) controls coefficient poles. Its value is nonzero exactly when every coefficient has a nonzero denominator at the chosen parameter, even though the definition uses only the finite support. The missing indices represent zero coefficients and have denominator one. The product keeps repeated factors; no minimal-denominator or squarefree assertion belongs to this definition.

Regularity is sufficient to specialize addition, multiplication and polynomial factorizations whose factors are regular. It is insufficient to preserve degree. For p=TY+1, every coefficient is regular at zero, but specialization is the nonzero constant polynomial 1. The leading numerator is therefore a separate factor of the guard G(p)=D(p)·num(leadingCoeff(p)). When p is nonzero, both factors of G(p) are nonzero polynomials. Away from its root set, the leading coefficient has nonzero evaluated numerator and denominator, so the coefficient at the original highest exponent survives.

The guard is sufficient and need not be the smallest possible excluded polynomial. Its role is to give a finite bound on the bad set, with a transparent proof from a finite root theorem. There is no claim that its roots coincide exactly with degree drops. In particular, D can have repeated factors, and a zero of G can be harmless for the numerical natural degree of a constant polynomial. The finite-bad-set theorem is obtained by inclusion in the root set, not equality with it.

Over a finite field, a nonzero polynomial may vanish at every parameter. For example, in F₂ the nonzero parameter polynomial T²−T vanishes at 0 and 1, so (T²−T)Y+1 loses degree at every F₂-point. This invalidates any unconditional existence conclusion over an arbitrary field, while leaving the finite-bad-set theorem correct. The infinite-field hypothesis enters only when selecting a point outside a finite union.

Nor does avoidance prove an irreducible specialization exists. The polynomial Y²−T specializes with constant degree two everywhere. Over ℚ its values at 2 and 4 are respectively irreducible and reducible. Hilbert’s theorem supplies an arithmetic restriction that cannot be replaced by the nonvanishing of the elementary guard. Full Galois-group preservation, disjointness from a prescribed extension and prescribed local behavior require their own arguments.

## The Hilbertian target beyond this component

Dèbes distinguishes parameter variables T₁,…,Tᵣ from polynomial variables Y₁,…,Yₛ. For a finite list of polynomials irreducible over k(T₁,…,Tᵣ), the associated Hilbert subset consists of parameter values where the specializations are defined and remain irreducible in k[Y₁,…,Yₛ]. The full target quantifies over positive r and s and finite nonempty lists, and asks that each such set avoid any prescribed nonzero parameter hypersurface. For one parameter this becomes infinitude of Hilbert subsets. A definition using only the degree-preserving locus would be a different subset unless its relationship with the standard convention were proved.

The present guard handles the rational coefficient domain and degree restriction for the one-parameter, one-variable case. It does not clear arbitrary multivariate denominators, construct specialization homomorphisms through algebraic roots, or prove the reductions to one variable. These are exact boundaries of the component. No Hilbertian-field class with assumed theorem fields is introduced to disguise those missing arguments.

Proposition 5.2.5 reduces irreducibility to root avoidance for a finite list of monic polynomials, up to a finite exceptional set. Its proof considers proper nonempty subsets of generic roots and a coefficient of the corresponding factor outside k(T), then uses a minimal polynomial after an integral scaling. A complete decomposition must justify the integral model, the root-specialization map, every excluded denominator and leading coefficient, and the finite collection of possible subsets. The rational coefficient ring map specified here supplies only one part of that route. The strengthened separable and geometrically irreducible form also needs its source argument and field hypotheses.

The full Hilbert–Dörge argument over ℚ, the multivariate reductions, stability under finite extension, and specialization with full Galois group remain IG.2. The same layer owns its avoidance and linearly disjoint specialization refinements. Their precise statements must then be exported to IG.6 with their parameter exclusions and arithmetic assumptions attached.

## Other layers and ownership contracts

### IG.0 — finite-étale fibre functors and arithmetic groups

Use the existing abstract Galois-category machinery with a connected locally noetherian scheme and an actual geometric fibre functor. Construct the scheme-specific category, its exactness and finiteness properties, and the ordinary geometric-basepoint comparison. The Spec K comparison with finite continuous absolute-Galois sets comes from ModularCurves 0d. BelyiMaps layer 12 supplies the field-theoretic three-punctured-line group and its topological comparison, which become fixed targets for a scheme-to-field comparison here. The characteristic-zero multiplicative-group example must retain its Tate twist.

Arithmetic path torsors and tangential basepoints belong to AnabelianGeometryAndNonabelianChabauty:NC.0. Ordinary basepoint comparison supplies an input to that owner; it is not an excuse to reconstruct its arithmetic extension in IG.0. The packet’s elementary IG.2 nodes do not need this categorical work, so no artificial request is placed in their dependency graph.

### IG.1 — arithmetic exact sequences and specialization

The general scheme arithmetic exact sequence requires its actual hypotheses on the base field, geometric connectedness and chosen geometric point. Rational points supply sections in their proper setting. The finite-field computation and Frobenius convention need a scheme-specific comparison, while the three-point sequence and peripheral inertia are imported from BelyiMaps 12.

AlgebraicCurves 8 supplies finite function-field decomposition, inertia and lower ramification with its residue qualifications. LocalFieldsRamification 2–4 supplies the unramified Frobenius correspondence, tame and wild filtrations and the local-field tame absolute-Galois quotient. Their finite-residue-field assumptions cannot be silently generalized to arbitrary residue fields. General scheme inertia, tame specialization and smooth proper specialization remain work here. Wild inertia can be trivial; a claim that it is universally nonzero is excluded. Residue characteristic and fraction-field characteristic are recorded separately whenever they affect the tame quotient.

### IG.3 — general branch cycles and rigidity

The three-point combinatorial carriers belong to BelyiMaps 0–3: ordered triples, passports, dessins and character counts. The three-point topological and analytic constructions belong to layers 5–8. Algebraization, Belyi’s theorem and positive effective descent belong to layers 9–11, and the cyclotomic branch-cycle constraint belongs to layer 12. This continuation imports each result rather than reconstructing it under another namespace.

The new work concerns arbitrary finite branch sets, Nielsen classes with explicit equivalence conventions, braid actions, rational rigidity and the passage from moduli to actual fields of definition. The branch-cycle statement concerns conjugacy classes; it does not license simultaneous powering of an entire tuple without the required conjugations. The obstruction example must actually exhibit a field of moduli that is not a field of definition, rather than merely give a predicate saying such an obstruction could occur.

### IG.4 — arithmetic embedding problems and solvable groups

ProfiniteProPGroups layer 5 owns the generic finite embedding problem and its continuous weak-solution predicate. A proper solution here adds surjectivity on that same carrier; a weak solution is insufficient for a claimed realization. Arithmetic local conditions, global duality, the solvable realization argument and its cyclic and dihedral cases belong to this layer. The Grunwald–Wang exceptions are part of the mathematics and are not supplied by an unrestricted local-to-global lifting slogan.

The routed Harpaz–Wittenberg items remain six separate obligations. Item /122 requires the rational local-to-global fourth-power statement and its Poitou–Tate consequence for Sha²(ℚ,ℤ/4). Items /123 and /124 require cyclic degree-eight lifts of the quadratic fields generated by √p and √(2q), for distinct positive primes p,q congruent to 1 modulo 8, and the actual local argument. Away from 2,p,q the characters are unramified or split; at p and q the relevant fourth roots of unity are squares; at 2 the square classes of p and q and the Hilbert-symbol calculation are essential. A global lifting statement must name the duality input and its obstruction group.

Item /126 requires the two degree-eight characters to give a surjection onto (ℤ/8)², using independence after reduction modulo 2. Its kernel field has degree 64, with exactly the three quadratic subfields generated by √p, √(2q) and √(2pq). Item /130 is the general number-field Grunwald–Wang consequence that Sha¹(K,μₘ) is trivial or cyclic of order two for every positive integer m. The proof referenced by the paper, Artin–Tate Chapter Ten, Theorem 1, must be read and decomposed; the restricted source reading here does not supply it.

Item /136 requires Sha¹(ℚ,μ₈)=0 and its dual Sha²(ℚ,ℤ/8)=0. Rational prime valuations and the real place govern the elementary power statement. The number 16 is not an eighth power in ℚ₂. Its role in the counterexample uses a different field or a twisted module; it is not a counterexample to the rational all-places assertion. These distinctions preserve the routed source without asserting that the full Massey-product proof has been covered.

### IG.5 — Hurwitz spaces and function-field methods

Hurwitz moduli need their actual objects, rigidifications, automorphism conventions, components and fields of definition. General covers with arbitrary finite branch loci are not obtained merely by naming the already-owned three-point carrier. The proof linking function-field covers to arithmetic specializations must identify the finite models and specialization maps it uses.

Tame and wild patching remain full source arguments, with the complete-field, residue and local-model hypotheses written out. Generic weak embedding-problem machinery and the particular large-field inputs of LPV.5 do not discharge those patching constructions. The Hurwitz-space and patching references still require primary reading before declaration-level claims are made.

### IG.6 — explicit outputs and downstream interfaces

The output is a checked polynomial or extension accompanied by the hypotheses and conclusions of the exact realization theorem used. For specialization, that means importing the full IG.2 group-preservation and avoidance result, not only its coefficient guard. PolynomialGaloisGroups layer 9 supplies the existing explicit Sₙ family over ℚ. BelyiMaps 11–13 supplies arithmetic actions, branch cycles and the specified faithfulness theorem. NC.0 supplies arithmetic path torsors.

The continuation transports those results to its new scheme-theoretic interfaces and records solved families. It preserves the scope of each faithfulness theorem and does not infer unproved anabelian reconstruction. All IG.6 targets remain present under the accepted ownership structure, even though an older audit called the layer process-oriented.

## Coverage and exact resumption boundaries

### InverseGaloisAndArithmeticFundamentalGroups:IG.0 — not_read

- Apply existing abstract Galois-category classification only after constructing the finite-étale category of a connected locally noetherian scheme and its geometric fibre functor with all hypotheses.
- Construct ordinary basepoint comparison; import the Spec K finite-Galois-set comparison from ModularCurves 0d and the three-punctured-line field group from BelyiMaps 12. Compare G_m in characteristic zero with its Tate twist.

### InverseGaloisAndArithmeticFundamentalGroups:IG.1 — not_read

- Prove the SGA arithmetic fundamental-group exact sequence with geometric connectedness and basepoint hypotheses; prove the finite-field instance and sections from rational points.
- Develop general scheme inertia and tame/wild specialization and smooth proper specialization. Import BelyiMaps 12, AlgebraicCurves 8 and LocalFieldsRamification 2–4 only in their stated settings; wild inertia is not universally nonzero, and local-field residue finiteness cannot be dropped.

### InverseGaloisAndArithmeticFundamentalGroups:IG.2 — partial

- Define general Hilbert subsets for finitely many irreducible polynomials in k(T₁,…,Tᵣ)[Y₁,…,Yₛ], with r,s>0, a precise coefficient domain, and avoidance of a prescribed nonzero parameter polynomial.
- Read and decompose the full Hilbert–Dörge proof over ℚ, Chapter 9 multivariable reductions and stability under finite extensions; prove Hilbertianity of number fields.
- Decompose Proposition 5.2.5 through actual integral models, root-specialization maps and the finite list of proper factor subsets; rational coefficient specialization alone does not construct those maps.
- Prove full Galois-group specialization, finite avoidance and linearly disjoint specialization with all ramification and regularity hypotheses. General parameter spaces, scalar-extension compatibility, denominator clearing and discriminant preservation still require exact source arguments.

### InverseGaloisAndArithmeticFundamentalGroups:IG.3 — not_read

- Import BelyiMaps 0–3 and 5–12 for triples, dessins, counting, three-point existence, algebraization, descent and branch cycles.
- Construct general branch-set Nielsen classes and braid actions, prove the rational rigidity criterion with centralizer and rational-conjugacy hypotheses, and construct a field-of-moduli-not-definition obstruction example beyond the imported positive theorem.

### InverseGaloisAndArithmeticFundamentalGroups:IG.4 — partial

- Import the generic finite embedding problem and weak continuous solutions from ProfiniteProPGroups layer 5; add surjective properness and arithmetic local constraints on that carrier.
- Decompose the solvable realization theorem and its cyclic/dihedral cases, with the global duality and Grunwald–Wang inputs and their exceptional cases.
- Retain all six routed PAPER-HARPAZ-WITTENBERG-23 items: /122 local-to-global fourth powers and Sha²(ℚ,ℤ/4)=0; /123 degree-eight cyclic lifts; /124 the local Hilbert-symbol and duality argument; /126 the degree-64 field and its three quadratic subfields; /130 the general trivial-or-C₂ Grunwald–Wang kernel; /136 local-to-global eighth powers and Sha²(ℚ,ℤ/8)=0.

### InverseGaloisAndArithmeticFundamentalGroups:IG.5 — not_read

- Construct Hurwitz moduli with their actual rigidifications, components and arithmetic fields of definition; relate function-field covers and specialization.
- Read and decompose tame and wild patching with precise complete-field hypotheses. Large-field generic embedding machinery and LPV.5 are not substitutes for the full patching targets.

### InverseGaloisAndArithmeticFundamentalGroups:IG.6 — not_read

- Export checked specialized polynomials or extensions with the IG.2 full-group and avoidance hypotheses; import the existing S_n family from PolynomialGaloisGroups layer 9.
- Import BelyiMaps 11–13 for arithmetic actions, branch cycles and the stated faithfulness scope, and NC.0 for arithmetic path torsors; preserve all conventions at the new scheme interface.
- Separate solved families from the open general inverse Galois problem over ℚ. This layer remains in scope under RS-29 despite the older audit process designation.

## Sources and inspection limits

Dèbes’s author working text supplies the specialization motivation and the next Hilbert-set proof route. Physical pages 147–150 are printed pages 135–138. The typo immediately before Definition 5.2.2 uses r as the polynomial index bound although there are n polynomials; the intended bound is n. Source issue E1 records the visual check, exact source hash and correction search. This finding is confined to that author working text and changes no intended mathematical theorem.

The Harpaz–Wittenberg source is the 33-page author copy, not the 41-page publisher layout. Its author-copy pages 28–31 were inspected to preserve the six IG.4 obligations. The stored PDF matched the accepted extraction’s SHA-256 after the current author URL failed DNS resolution. SGA1, NSW, the general Hurwitz-space references, the remaining Dèbes chapters and the external proofs invoked by the routed paper are source-acquisition and decomposition boundaries. Serre was acquired as a lead but has not been used as an inspected proof source.

The sources below state exactly what was read. A local or indexed mention of a reference is not treated as reading its proof. The full Multiquadratic and Completed/EffectiveBounds upstream documents informed the field-generic statements, distinct hypotheses and concrete tests; their mathematical targets remain their own. The BelyiMaps introduction and ownership table informed the extension boundary; its entire long document was not read for this elementary component.

- [Arithmétique des revêtements de la droite](https://pro.univ-lille.fr/fileadmin/user_upload/pages_pros/pierre_debes/V2-ArithRevDte-v2.pdf), Pierre Dèbes. 303-page author-hosted working text V2-ArithRevDte-v2.pdf; PDF creation metadata 2024-05-16; accessed 2026-09-27. Title page and physical pages 147–150, printed pages 135–138: §5.2.1, Definition 5.2.2, Remark 5.2.3, Theorem 5.2.4, Proposition 5.2.5, Example 5.2.6 and its proof. The Hilbert–Dörge proof, full-group specialization and Chapter 9 reductions have not been decomposed. Physical page 148 was also inspected visually. SHA-256: 7b07f882c9f7c9f7b5daa3b3a7ee7ecd5fed0484addd6b55fe93cc8fedc34374.
- [Reduced rational functions and their evaluation](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/RatFunc/AsPolynomial.lean), The Mathlib contributors. Pinned Mathlib source, Apache-2.0; read 2026-09-27. AsPolynomial lines 22–88 and 108–211; Basic lines 880–920, 929–1005, 1040–1073. Evaluation is total but its ring laws have denominator hypotheses. The planned regular subring bundles precisely these hypotheses.
- [Polynomial coefficients, subring lifts and degree bounds](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Polynomial/Subring.lean), The Mathlib contributors. Pinned Mathlib source, Apache-2.0; read 2026-09-27. Subring lines 27–93 in full; Lifts lines 28–93 as a duplicate-construction screen; Basic coefficient, support, extensionality and sum statements; Coeff coefficient-sum and product statements; Eval/Defs map and evaluation statements; Eval/Coeff lines 22–86; Degree/Defs leading coefficient and Degree/Operations degree tests; Degree/Lemmas lines 74–82.
- [Finitely many roots and finite-set avoidance](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Polynomial/Roots.lean), The Mathlib contributors. Pinned Mathlib source, Apache-2.0; read 2026-09-27. Roots lines 106–157, including finite_setOfPred_isRoot; Data/Set/Finite/Basic lines 496–510 and 825–848.
- [The Massey vanishing conjecture for number fields](https://www.math.univ-paris13.fr/~wittenberg/globalmassey.pdf), Yonatan Harpaz and Olivier Wittenberg. Author final copy revised 9 December 2021, 33 pages, of Duke Mathematical Journal 172 (2023), 1–41, DOI 10.1215/00127094-2022-0004; not publisher pagination. Physical/printed author-copy pp.28–31, using the matching stored source after the author host failed DNS resolution. Lemma 7.6 and its proof, the degree-64 field construction in Lemma 7.7, the Grunwald–Wang consequence on p.30 and the final duality step on p.31. These support the six retained IG.4 source obligations, not the IG.2 component. The rest of the paper was not read for this checkpoint. SHA-256: d95100ebd7210600873351ffbe1f3f1dc0fd3f36b815ca70286884801afc546f.
