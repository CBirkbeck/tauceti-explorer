# Motivic and étale K-theory: differential symbols, towers and regulators

This document is the definitive mathematical plan for the six-stage part M.5d, M.6, M.6a, M.6b, M.7 and M.8. The suggested file proposes names and signatures and is not exhaustive. Every declaration is unchecked. The pass is complete at target level under PROTOCOL §0: all six stages are planned, and none is closed. The source and supplier gaps below remain proof obligations; an independent review decides whether to accept this plan.

Target-level completion of the six-stage M.5d–M.8 part: characteristic-p BGK and prime-power Witt comparison, prime-to-characteristic coefficient induction/reductions, the actual homotopy-coniveau K tower and convergent motivic sequence, rational Adams weights, étale/Quillen–Lichtenbaum comparisons with arithmetic and real-place exceptions, and early Chern/Deligne/regulator, integral, Euler-family and determinant interfaces. The eighteen inherited differential-symbol nodes are preserved with supplier updates. Every stage is planned, not closed: eleven explicit proof/source gaps and 34 precise supplier requests remain. All declarations are unchecked prototypes; no conjectural Tamagawa assertion is a proved theorem.

## Conventions and scope

Milnor K-theory is imported from K2SymbolsBrauer:T.2 and is distinct from finite-coefficient homotopy groups of a Quillen K-spectrum. An additive quotient A/mA has a right-exact coefficient row; a spectrum with coefficients also has a Tor/Bockstein term. The residue-characteristic differential comparison uses absolute Kähler forms, their additive exact-form quotient and the genuine logarithmic Witt étale sheaf. Its target is not a vector subspace and is not defined to be the image of the symbol.

The motivic tower is built from support K-spectra on smooth, finite-dimensional, separated schemes of finite type over a perfect field. Generic spectra, exact couples and limit machinery are imports. The cycle complex and higher Chow operations belong to M.4. Arithmetic/Dedekind and arbitrary-field extensions have their own explicit proof gap and cannot silently enlarge this scheme class.

The motivic page has E₂^(a,b)=H^(a−b)(X,Z(−b)), total K-degree −a−b and differential (r,1−r). The étale descent page has E₂^(s,t)=H_et^s(X,Z/ℓ^r(t/2)), t even, total K-degree t−s and differential (r,r−1). Continuous ℓ-adic cohomology and K-completion use derived inverse limits. Identifying completed K with K⊗Z_ℓ requires the cited finite-generation theorem. Ordinary real Galois cohomology has infinite dyadic cohomological dimension; real-place correction is part of the construction.

Positive-degree integral Chern maps, rational Chern characters, integral motivic groups, torsion-free lattices and rational integral parts are separate exports. At positive K-degree the normalized weight-i character is (−1)^(i−1)c_i/(i−1)!, while the K₀ Newton polynomial uses i!. Finite coefficients do not permit arbitrary division by these factorials. Geometric Frobenius is used in the Tate/elliptic polynomial dictionary; Euler relations explicitly reconcile this with the inverse-Frobenius convention of their supplier. The Tamagawa-number conjecture asks for a leading-value and integral-basis condition. No node asserts its unconditional truth.

## Library and ownership boundaries

The pinned baseline is Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 and Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. The reviewed AUDIT-30 records cover 26 scoped targets; none supplies the complete comparison tower or regulator infrastructure. The actual statements of the 23 inherited baseline declarations and three additional torsion/p-adic declarations were read at the pins. The Kähler module, universal additive derivation, exterior powers, tensor lift, additive quotient and kernel constructions are reused. No missing supplier is treated as an implemented library declaration.

Accepted RS-08 assigns generic continuous cohomology and duality, cycle complexes, motives and Selmer complexes to their existing owners. RS-28 assigns the prime-power/reduction interface here, with the independent BGK theorem supplied by the present differential node. RS-33 assigns generic filtered spectra, exact couples, Bocksteins and limits to StableHomotopyKTheory:H.6. Scheme support K-theory and λ/Adams operations stay in SchemeKTheoryOperations. The Hodge, elliptic and profinite Tau Ceti roadmaps are imported, never replanned.

The dependency split inside M.8 matters: finite-etale-chern and number-field-deligne-normalization are early exports. Neither depends on D.2 or R.7. The regulator-determinant-comparison imports the Borel factor-two theorem and p-adic comparisons. Thus R.7 can consume the early Deligne map without a declaration cycle. Generic Selmer mapping fibres belong to L2, finite-condition propagation to L4, the rational finite condition to PadicHodgeRegulators:L1, determinants to PadicMeasuresIwasawaAlgebras:L5, and period/fundamental lines to PS.4.

## Target coverage

| Stage | Status | Nodes | Main exports |
| --- | --- | ---: | --- |
| M.5d | planned | 27 | Differential and Witt symbols, BGK, prime-power induction and field reductions |
| M.6 | planned | 2 | Convergent motivic sequence and rational weight comparison |
| M.6a | planned | 6 | Actual support tower, moving/excision, cycle layers and global comparison target |
| M.6b | planned | 5 | Exact couple, connectivity/limits, products, Adams operations and rational degeneration |
| M.7 | planned | 14 | Complex comparisons, étale K, Quillen–Lichtenbaum, arithmetic degrees and real corrections |
| M.8 | planned | 13 | Early Chern/Deligne maps, supported classes, integral structures, Euler families and conditional determinant interfaces |

Each target is a node or uses the exact supplier/export request below. Refinement stops at this target-level coverage, as PROTOCOL §0 requires. All stages retain the specific remaining items listed at the end.

## Declarations and proof plans

### M.5d

#### Logarithmic one-form

Identifier: MotivicEtaleKTheory:M.5d/logarithmic-one-form. Kind: construction.

Define logOne:F× (written additively)→Ω_(F/Z) by a↦a⁻¹ da. Its map structure encodes dlog(ab)=dlog(a)+dlog(b); zero is excluded by the unit domain.

Hypotheses and conventions: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z). All symbol entries are units; degree n is a nonnegative integer.

Proof/construction plan:

1. Use the existing universal derivation D, not a new differential-module carrier.
2. Apply Derivation.leibniz and commute field scalars: (ab)⁻¹(a db+b da)=b⁻¹ db+a⁻¹ da.
3. Derive the identity, inverse and natural-power formulas from this additive homomorphism.

Direct prerequisites: mathlib:KaehlerDifferential.D, mathlib:Derivation.leibniz, mathlib:Derivation.map_one_eq_zero.

Planning API:

- **TauCeti.DifferentialSymbol.logOne_apply** (simp): For a∈F×, logOne(a)=a⁻¹ da.
- **TauCeti.DifferentialSymbol.logOne_mul** (relation): For units a,b, logOne(ab)=logOne(a)+logOne(b).
- **TauCeti.DifferentialSymbol.logOne_inv** (simp): For a unit a, logOne(a⁻¹)=−logOne(a).
- **TauCeti.DifferentialSymbol.logOne_pow** (simp): For a unit a and m≥0, logOne(a^m)=m logOne(a).

Discriminating examples:

- **logOne_test_one** (degenerate): logOne(1)=0.
- **logOne_test_nonzero** (non-example): If da≠0 for a unit a, then logOne(a)≠0; the zero homomorphism fails this test.
- **logOne_test_inverse** (compatibility): logOne(a⁻¹)+logOne(a)=0 for every unit a.

Consumers:

- Bloch–Kato §2, Theorem 2.1 and its diagram (2.3.1): Supplies the differential symbol and its Cartier-kernel target before the injectivity/surjectivity arguments.
- MotivicEtaleKTheory:M.5d and HigherLocalFieldsAndHigherClassFieldTheory:HL.2: Provides the residue-characteristic symbol interface; the characteristic-p target must be separate from prime-to-p Galois symbols.

Acceptance: The statement has the displayed degree and characteristic hypotheses and uses the imported carriers.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7, differential symbol and Lemma 7.7, printed pp.250–251 (PDF pp.258–259). Locator excerpt: “dlog”. The source gives the differential-symbol construction; this declaration separates the indicated step and its reusable interface.

Atlas planet: Logarithmic differential.

#### Naturality of the logarithmic differential

Identifier: MotivicEtaleKTheory:M.5d/logarithmic-one-form-natural. Kind: lemma.

For a Z-algebra homomorphism f:F→E between fields and a∈F×, the existing semilinear Kaehler map sends logOne(a) to logOne(fa).

Hypotheses and conventions: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z). All symbol entries are units; degree n is a nonnegative integer.

Proof/construction plan:

1. Expand the evaluation formula for logOne.
2. Apply mapSemilinear_smul and mapSemilinear_D, and f(a⁻¹)=f(a)⁻¹.

Direct prerequisites: MotivicEtaleKTheory:M.5d/logarithmic-one-form, tauceti:KaehlerDifferential.mapSemilinear, tauceti:KaehlerDifferential.mapSemilinear_D, tauceti:KaehlerDifferential.mapSemilinear_smul.

Acceptance: Taking f to be the identity recovers logOne(a). The scalar moves through f; no F-linearity is asserted for an arbitrary field homomorphism.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7, differential symbol and Lemma 7.7, printed pp.250–251 (PDF pp.258–259). Locator excerpt: “dlog”. The source gives the differential-symbol construction; this declaration separates the indicated step and its reusable interface.

#### Tensor differential symbol

Identifier: MotivicEtaleKTheory:M.5d/tensor-differential-symbol. Kind: construction.

For n≥0, tensorSymbol is the Z-linear map (F×)^(⊗n)→Ω_F^n sending the pure tensor (a₁,…,a_n) to dlog(a₁)∧…∧dlog(a_n). Empty wedge means 1∈F under the existing degree-zero exterior equivalence.

Hypotheses and conventions: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z). All symbol entries are units; degree n is a nonnegative integer.

Proof/construction plan:

1. Compose each input with logOne, and then apply the existing alternating map into the exterior power.
2. Restrict its multilinearity to Z, using logOne as a homomorphism of additive groups.
3. Apply PiTensorProduct.lift. Its uniqueness supplies the extensionality rule.

Direct prerequisites: MotivicEtaleKTheory:M.5d/logarithmic-one-form, mathlib:PiTensorProduct.lift, mathlib:exteriorPower.ιMulti, mathlib:exteriorPower.zeroEquiv, mathlib:exteriorPower.oneEquiv.

Planning API:

- **TauCeti.DifferentialSymbol.tensorSymbol_pure** (simp): Evaluate a pure tensor as the wedge of its logarithmic differentials.
- **TauCeti.DifferentialSymbol.tensorSymbol_unique** (universal-property): Any Z-linear map with the same values on every pure tensor equals tensorSymbol.
- **TauCeti.DifferentialSymbol.tensorSymbol_update_mul** (relation): Replacing the ith unit by bc gives the sum of the values with b and c in that position.

Discriminating examples:

- **tensorSymbol_test_zero** (degenerate): In degree zero the empty tensor maps to 1, not 0.
- **tensorSymbol_test_one** (compatibility): Under exteriorPower.oneEquiv the degree-one value is logOne(a).
- **tensorSymbol_test_repeated** (computation): In degree two the tensor (a,a) maps to zero, in every characteristic.

Consumers:

- Bloch–Kato §2, Theorem 2.1 and its diagram (2.3.1): Supplies the differential symbol and its Cartier-kernel target before the injectivity/surjectivity arguments.
- MotivicEtaleKTheory:M.5d and HigherLocalFieldsAndHigherClassFieldTheory:HL.2: Provides the residue-characteristic symbol interface; the characteristic-p target must be separate from prime-to-p Galois symbols.

Acceptance: The statement has the displayed degree and characteristic hypotheses and uses the imported carriers.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7, differential symbol and Lemma 7.7, printed pp.250–251 (PDF pp.258–259). Locator excerpt: “dlog”. The source gives the differential-symbol construction; this declaration separates the indicated step and its reusable interface.

#### Vanishing on Steinberg tensors

Identifier: MotivicEtaleKTheory:M.5d/steinberg-vanishing. Kind: lemma.

If i≠j and a_i+a_j=1 in F for a tuple of units, tensorSymbol(a₁⊗…⊗a_n)=0. This includes characteristic two.

Hypotheses and conventions: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z). All symbol entries are units; degree n is a nonnegative integer.

Proof/construction plan:

1. From D(1)=0 and additivity derive da_j=−da_i.
2. Write the two logarithmic entries as the field scalars a_i⁻¹ and −a_j⁻¹ multiplying the same differential da_i.
3. Pull both scalars out of the alternating map; apply AlternatingMap.map_eq_zero_of_eq. No division by 2 is used.

Direct prerequisites: MotivicEtaleKTheory:M.5d/tensor-differential-symbol, MotivicEtaleKTheory:M.5d/logarithmic-one-form, mathlib:Derivation.map_one_eq_zero, mathlib:AlternatingMap.map_eq_zero_of_eq.

Acceptance: For n=2 the pair (a,1−a), a≠0,1, has zero image. Consecutive positions suffice for the imported presentation; arbitrary distinct positions also vanish in forms.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7, differential symbol and Lemma 7.7, printed pp.250–251 (PDF pp.258–259). Locator excerpt: “dlog”. The source gives the differential-symbol construction; this declaration separates the indicated step and its reusable interface.

#### Differential symbol on Milnor K-theory

Identifier: MotivicEtaleKTheory:M.5d/milnor-differential-symbol. Kind: construction.

There is a unique additive differentialSymbol:K_n^M(F)→Ω_F^n taking {a₁,…,a_n} to the wedge of dlog(a_i). The source is the existing T.2 tensor/Steinberg presentation, not an exterior algebra on F×.

Hypotheses and conventions: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z). All symbol entries are units; degree n is a nonnegative integer.

Proof/construction plan:

1. Use tensorSymbol and steinberg-vanishing on the consecutive Steinberg generators of the T.2 relation module.
2. Linearity kills their Z-span; use Submodule.liftQ to descend.
3. Uniqueness on generators follows from the tensor universal property and surjectivity of the quotient map.

Direct prerequisites: K2SymbolsBrauer:T.2/milnor-k-theory, MotivicEtaleKTheory:M.5d/tensor-differential-symbol, MotivicEtaleKTheory:M.5d/steinberg-vanishing, mathlib:Submodule.liftQ.

Planning API:

- **TauCeti.DifferentialSymbol.differentialSymbol_symbol** (simp): The value of {a₁,…,a_n} is dlog(a₁)∧…∧dlog(a_n).
- **TauCeti.DifferentialSymbol.differentialSymbol_quotient** (compatibility): Composing with the tensor quotient projection is tensorSymbol.
- **TauCeti.DifferentialSymbol.differentialSymbol_unique** (extensionality): An additive map from K_n^M(F) with these values on all symbols equals differentialSymbol.

Discriminating examples:

- **differentialSymbol_test_zero** (degenerate): The empty Milnor symbol maps to 1∈Ω_F^0=F.
- **differentialSymbol_test_one** (compatibility): Under Ω_F^1≃Ω_(F/Z), {a} maps to a⁻¹ da.
- **differentialSymbol_test_repeated** (non-example): The image of {a,a} is zero. This imposes no assertion that the integral Milnor symbol itself is zero.

Consumers:

- Bloch–Kato §2, Theorem 2.1 and its diagram (2.3.1): Supplies the differential symbol and its Cartier-kernel target before the injectivity/surjectivity arguments.
- MotivicEtaleKTheory:M.5d and HigherLocalFieldsAndHigherClassFieldTheory:HL.2: Provides the residue-characteristic symbol interface; the characteristic-p target must be separate from prime-to-p Galois symbols.

Acceptance: The statement has the displayed degree and characteristic hypotheses and uses the imported carriers.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7, differential symbol and Lemma 7.7, printed pp.250–251 (PDF pp.258–259). Locator excerpt: “dlog”. The source gives the differential-symbol construction; this declaration separates the indicated step and its reusable interface.

Atlas planet: Milnor differential symbol.

#### Naturality of the Milnor differential symbol

Identifier: MotivicEtaleKTheory:M.5d/milnor-symbol-natural. Kind: lemma.

For every field homomorphism f:F→E, dlog_E∘K_n^M(f)=Ω^n(f)∘dlog_F as additive homomorphisms; Ω^n(f) is semilinear over f.

Hypotheses and conventions: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z). All symbol entries are units; degree n is a nonnegative integer.

Proof/construction plan:

1. Check the formula on every symbol using logarithmic-one-form-natural and the imported DD.2 pullback on pure wedges.
2. Use the symbol generators in the imported T.2 presentation to extend equality to the entire additive group.

Direct prerequisites: K2SymbolsBrauer:T.2/milnor-k-theory, MotivicEtaleKTheory:M.5d/milnor-differential-symbol, MotivicEtaleKTheory:M.5d/logarithmic-one-form-natural, DerivedDeRhamCohomology:DD.2/forms-pullback, DerivedDeRhamCohomology:DD.2/pullback-differential.

Acceptance: Identity and composite field maps agree with the imported functor laws.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7, differential symbol and Lemma 7.7, printed pp.250–251 (PDF pp.258–259). Locator excerpt: “dlog”. The source gives the differential-symbol construction; this declaration separates the indicated step and its reusable interface.

#### Products of differential symbols

Identifier: MotivicEtaleKTheory:M.5d/milnor-symbol-product. Kind: lemma.

For x∈K_i^M(F) and y∈K_j^M(F), dlog(xy)=dlog(x)∧dlog(y) in Ω_F^(i+j), with x placed before y.

Hypotheses and conventions: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z). All symbol entries are units; degree n is a nonnegative integer.

Proof/construction plan:

1. On symbols the T.2 product concatenates the ordered lists.
2. The DD.2 exterior product concatenates the corresponding pure wedges.
3. Extend by additivity in each variable; the empty list agrees with the multiplicative identity.

Direct prerequisites: K2SymbolsBrauer:T.2/milnor-k-theory, MotivicEtaleKTheory:M.5d/milnor-differential-symbol, DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex, DerivedDeRhamCohomology:DD.2/differential-graded-leibniz.

Acceptance: Degree-zero multiplication is integer scalar multiplication on forms. In degree (1,1) the value is da/a∧db/b with that order.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.7, differential symbol and Lemma 7.7, printed pp.250–251 (PDF pp.258–259). Locator excerpt: “dlog”. The source gives the differential-symbol construction; this declaration separates the indicated step and its reusable interface.

#### Characteristic annihilates absolute forms

Identifier: MotivicEtaleKTheory:M.5d/characteristic-annihilation. Kind: lemma.

For every n≥0 and every ω∈Ω_F^n in characteristic p, pω=0.

Hypotheses and conventions: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z). All symbol entries are units; degree n is a nonnegative integer. p is prime and F has characteristic p.

Proof/construction plan:

1. The exterior power is an F-module.
2. Identify p-fold addition with multiplication by (p:F)=0. This is a scalar calculation and does not use BGK.

Direct prerequisites: mathlib:exteriorPower.ιMulti.

Acceptance: In degree zero this is p·a=0 in F.

Source: [Spencer Bloch and Kazuya Kato, p-adic étale cohomology](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), §2 opening definition of k_q(F) and differential symbol, printed p.113 (PDF p.8). Locator excerpt: “k”. The source gives the differential-symbol construction; this declaration separates the indicated step and its reusable interface.

#### Differential symbol modulo p

Identifier: MotivicEtaleKTheory:M.5d/mod-p-differential-symbol. Kind: construction.

Write k_n(F)=K_n^M(F)/pK_n^M(F), the additive quotient by the range of multiplication by p. Define modPSymbol:k_n(F)→Ω_F^n as the unique map whose composite with reduction is differentialSymbol.

Hypotheses and conventions: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z). All symbol entries are units; degree n is a nonnegative integer. p is prime and F has characteristic p.

Proof/construction plan:

1. For x∈K_n^M(F), additivity gives dlog(px)=p dlog(x)=0 by characteristic-annihilation.
2. Apply the existing additive quotient lift.
3. Surjectivity of reduction gives uniqueness; the pure-symbol formula is inherited.

Direct prerequisites: MotivicEtaleKTheory:M.5d/milnor-differential-symbol, MotivicEtaleKTheory:M.5d/characteristic-annihilation, mathlib:QuotientGroup.lift, mathlib:QuotientGroup.mk'.

Planning API:

- **TauCeti.DifferentialSymbol.modPSymbol_reduce** (compatibility): modPSymbol([x])=differentialSymbol(x).
- **TauCeti.DifferentialSymbol.modPSymbol_unique** (universal-property): An additive map k_n(F)→Ω_F^n whose composite with reduction is dlog equals modPSymbol.
- **TauCeti.DifferentialSymbol.modPSymbol_symbol** (simp): The class of {a₁,…,a_n} maps to the wedge of the logarithmic differentials.

Discriminating examples:

- **modPSymbol_test_zero** (degenerate): The class of the empty symbol maps to 1, even in characteristic p.
- **modPSymbol_test_p_multiple** (computation): For any x the class of px maps to zero.
- **modPSymbol_test_one** (compatibility): The class of {a} maps to a⁻¹ da under the degree-one exterior equivalence.

Consumers:

- Bloch–Kato §2, Theorem 2.1 and its diagram (2.3.1): Supplies the differential symbol and its Cartier-kernel target before the injectivity/surjectivity arguments.
- MotivicEtaleKTheory:M.5d and HigherLocalFieldsAndHigherClassFieldTheory:HL.2: Provides the residue-characteristic symbol interface; the characteristic-p target must be separate from prime-to-p Galois symbols.

Acceptance: The statement has the displayed degree and characteristic hypotheses and uses the imported carriers.

Source: [Spencer Bloch and Kazuya Kato, p-adic étale cohomology](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), §2 opening display, printed p.113 (PDF p.8). Locator excerpt: “2. The differential symbol”. The source gives the differential-symbol construction; this declaration separates the indicated step and its reusable interface.

#### Artin–Schreier differential operator

Identifier: MotivicEtaleKTheory:M.5d/artin-schreier-differential. Kind: construction.

Let B_F^0=0 and B_F^n=dΩ_F^(n−1) for n>0 as ADDITIVE subgroups. Import the ordinary de Rham differential and inverse Cartier C⁻¹:Ω_F^n→Ω_F^n/B_F^n. Define the additive homomorphism wp=C⁻¹−projection. Its logarithmic coefficient formula is the next lemma. In general wp is not F-linear.

Hypotheses and conventions: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z). All symbol entries are units; degree n is a nonnegative integer. p is prime and F has characteristic p.

Proof/construction plan:

1. Use the actual exterior-power carriers and DD.2 differential and additive quotient.
2. Use the DD.3 Frobenius-semilinear inverse Cartier, with its value on logarithmic wedges.
3. Subtract the additive quotient projection. The sign is opposite to BK’s 1−C⁻¹ and has exactly the same kernel.

Direct prerequisites: DerivedDeRhamCohomology:DD.3, MotivicEtaleKTheory:M.5d/logarithmic-one-form, mathlib:QuotientGroup.lift, mathlib:QuotientGroup.mk', DerivedDeRhamCohomology:DD.2/ordinary-differential.

Planning API:

- **TauCeti.DifferentialSymbol.artinSchreier_apply** (data): wp(ω)=C⁻¹(ω)−[ω].
- **TauCeti.DifferentialSymbol.artinSchreier_logarithmic** (simp): For x∈F and units a_i, wp(x∧_i dlog(a_i))=[(x^p−x)∧_i dlog(a_i)].
- **TauCeti.DifferentialSymbol.artinSchreier_add** (structure): wp(ω+η)=wp(ω)+wp(η).

Discriminating examples:

- **artinSchreier_test_zero** (degenerate): In degree zero wp(0)=0.
- **artinSchreier_test_unit** (computation): In degree zero wp(1)=0.
- **artinSchreier_test_not_zero_map** (non-example): If x^p≠x in F then wp(x)≠0 in degree zero, since B_F^0=0.

Consumers:

- Bloch–Kato §2, Theorem 2.1 and its diagram (2.3.1): Supplies the differential symbol and its Cartier-kernel target before the injectivity/surjectivity arguments.
- MotivicEtaleKTheory:M.5d and HigherLocalFieldsAndHigherClassFieldTheory:HL.2: Provides the residue-characteristic symbol interface; the characteristic-p target must be separate from prime-to-p Galois symbols.

Acceptance: The statement has the displayed degree and characteristic hypotheses and uses the imported carriers.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Definition III.7.7.1, printed p.251 (PDF p.259). Locator excerpt: “ν”. The coefficient formula defines the same kernel as BK; the ordinary differential and Cartier theory stay with DD.2/DD.3.

#### Artin–Schreier operator on logarithmic wedges

Identifier: MotivicEtaleKTheory:M.5d/artin-schreier-logarithmic-formula. Kind: lemma.

For p prime, F of characteristic p, n≥0, x∈F and units a₁,…,a_n, wp(x dlog(a₁)∧…∧dlog(a_n)) is the class of (x^p−x)dlog(a₁)∧…∧dlog(a_n) in Ω_F^n/B_F^n. For n=0 the wedge is 1 and B_F^0=0.

Hypotheses and conventions: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z). All symbol entries are units; degree n is a nonnegative integer. p is prime and F has characteristic p.

Proof/construction plan:

1. Apply the requested DD.3 inverse Cartier formula on logarithmic wedges, including its Frobenius action on the scalar.
2. Subtract the ordinary quotient projection and use additivity. This does not require exact forms to be an F-subspace: each form is scaled before taking its additive quotient class.

Direct prerequisites: MotivicEtaleKTheory:M.5d/artin-schreier-differential, DerivedDeRhamCohomology:DD.3, MotivicEtaleKTheory:M.5d/logarithmic-one-form.

Acceptance: For coefficient 1 the result is zero. Degree zero recovers x^p−x, so a non-Frobenius-fixed x detects the sign and nonzero operator.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Definition III.7.7.1, printed p.251 (PDF p.259). Locator excerpt: “ν”. The coefficient formula defines the same kernel as BK; the ordinary differential and Cartier theory stay with DD.2/DD.3.

#### Logarithmic differential forms

Identifier: MotivicEtaleKTheory:M.5d/logarithmic-differential-group. Kind: definition.

Define ν_n(F)=ker(wp:Ω_F^n→Ω_F^n/B_F^n) as an additive subgroup of Ω_F^n. Its elements satisfy C⁻¹ω=[ω]. The field-map action is the restriction of DD.2 pullback; it preserves the kernel by naturality of inverse Cartier. No F-module structure on ν_n is asserted.

Hypotheses and conventions: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z). All symbol entries are units; degree n is a nonnegative integer. p is prime and F has characteristic p.

Proof/construction plan:

1. Take the existing AddMonoidHom kernel of artinSchreier.
2. Use DD.2 pullback on forms and DD.3 Cartier naturality to restrict pullback to this subgroup.
3. Prove equality in the subgroup by equality of underlying forms; pullback identity and composition follow from DD.2.

Direct prerequisites: MotivicEtaleKTheory:M.5d/artin-schreier-differential, DerivedDeRhamCohomology:DD.3, mathlib:MonoidHom.ker, DerivedDeRhamCohomology:DD.2/ordinary-differential.

Planning API:

- **TauCeti.DifferentialSymbol.logarithmicForms_mem** (characterisation): ω lies in ν_n(F) exactly when C⁻¹ω=[ω].
- **TauCeti.DifferentialSymbol.logarithmicFormsMap** (functoriality): For a field map f:F→E of characteristic p, restrict Ω^n(f) to an additive map ν_n(F)→ν_n(E).
- **TauCeti.DifferentialSymbol.logarithmicFormsMap_coe** (coercion): The underlying form of the image is Ω^n(f)(ω).
- **TauCeti.DifferentialSymbol.logarithmicFormsMap_id** (functoriality): The identity field map induces the identity on ν_n.
- **TauCeti.DifferentialSymbol.logarithmicFormsMap_comp** (functoriality): The map on ν_n for g∘f is the composite of those for f and g.

Discriminating examples:

- **logarithmicForms_test_zero** (degenerate): The zero form belongs to ν_n(F) in every degree.
- **logarithmicForms_test_degree_zero** (characterisation): Under Ω_F^0=F, x∈ν_0(F) if and only if x^p=x.
- **logarithmicForms_test_not_F_submodule** (non-example): If x^p≠x, the scalar multiple x·1 does not belong to ν_0(F), though 1 does.

Consumers:

- Bloch–Kato §2, Theorem 2.1 and its diagram (2.3.1): Supplies the differential symbol and its Cartier-kernel target before the injectivity/surjectivity arguments.
- MotivicEtaleKTheory:M.5d and HigherLocalFieldsAndHigherClassFieldTheory:HL.2: Provides the residue-characteristic symbol interface; the characteristic-p target must be separate from prime-to-p Galois symbols.

Acceptance: The statement has the displayed degree and characteristic hypotheses and uses the imported carriers.

Source: [Spencer Bloch and Kazuya Kato, p-adic étale cohomology](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), §2 definition of ν, printed p.113 (PDF p.8). Locator excerpt: “2. The differential symbol”. The source gives the differential-symbol construction; this declaration separates the indicated step and its reusable interface.

#### Differential symbols are Cartier fixed

Identifier: MotivicEtaleKTheory:M.5d/differential-symbol-fixed. Kind: lemma.

For every x∈K_n^M(F), differentialSymbol(x) belongs to ν_n(F).

Hypotheses and conventions: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z). All symbol entries are units; degree n is a nonnegative integer. p is prime and F has characteristic p.

Proof/construction plan:

1. For a symbol, apply the wp coefficient formula with coefficient 1: 1^p−1=0.
2. Extend over the additive symbol presentation; wp and dlog are additive.

Direct prerequisites: K2SymbolsBrauer:T.2/milnor-k-theory, MotivicEtaleKTheory:M.5d/milnor-differential-symbol, MotivicEtaleKTheory:M.5d/artin-schreier-differential, MotivicEtaleKTheory:M.5d/logarithmic-differential-group, MotivicEtaleKTheory:M.5d/artin-schreier-logarithmic-formula.

Acceptance: The empty symbol is Cartier fixed. This proves membership, not injectivity or surjectivity.

Source: [Spencer Bloch and Kazuya Kato, p-adic étale cohomology](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), §2 symbol ψ with codomain ν, printed p.113 (PDF p.8). Locator excerpt: “2. The differential symbol”. The source gives the differential-symbol construction; this declaration separates the indicated step and its reusable interface.

#### Logarithmic symbol modulo p

Identifier: MotivicEtaleKTheory:M.5d/logarithmic-symbol. Kind: construction.

Define logarithmicSymbol:k_n(F)→ν_n(F) by corestricting modPSymbol to the Cartier kernel. Its underlying form is the wedge of logarithmic differentials on each symbol. This construction makes no assertion yet that it is an isomorphism.

Hypotheses and conventions: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z). All symbol entries are units; degree n is a nonnegative integer. p is prime and F has characteristic p.

Proof/construction plan:

1. Choose a lift of a class along reduction only for proving membership, not for defining a different output.
2. Use modPSymbol_reduce and differential-symbol-fixed to show that the already-defined modPSymbol lands in the subgroup.
3. Corestrict the additive map; injectivity of subgroup inclusion gives uniqueness.

Direct prerequisites: MotivicEtaleKTheory:M.5d/mod-p-differential-symbol, MotivicEtaleKTheory:M.5d/differential-symbol-fixed, MotivicEtaleKTheory:M.5d/logarithmic-differential-group.

Planning API:

- **TauCeti.DifferentialSymbol.logarithmicSymbol_coe** (coercion): The underlying differential form of logarithmicSymbol(x) is modPSymbol(x).
- **TauCeti.DifferentialSymbol.logarithmicSymbol_unique** (universal-property): Any additive map k_n(F)→ν_n(F) with this underlying form equals logarithmicSymbol.
- **TauCeti.DifferentialSymbol.logarithmicSymbol_symbol** (simp): The underlying form of the class of {a₁,…,a_n} is ∧_i dlog(a_i).

Discriminating examples:

- **logarithmicSymbol_test_zero** (degenerate): The class of the empty symbol maps to the element with underlying form 1∈F.
- **logarithmicSymbol_test_one** (compatibility): The class of {a} has underlying one-form a⁻¹ da.
- **logarithmicSymbol_test_repeated** (computation): The class of {a,a} has zero image in ν_2(F).

Consumers:

- Bloch–Kato §2, Theorem 2.1 and its diagram (2.3.1): Supplies the differential symbol and its Cartier-kernel target before the injectivity/surjectivity arguments.
- MotivicEtaleKTheory:M.5d and HigherLocalFieldsAndHigherClassFieldTheory:HL.2: Provides the residue-characteristic symbol interface; the characteristic-p target must be separate from prime-to-p Galois symbols.

Acceptance: The statement has the displayed degree and characteristic hypotheses and uses the imported carriers.

Source: [Spencer Bloch and Kazuya Kato, p-adic étale cohomology](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), §2 definition of ψ preceding Theorem 2.1, printed p.113 (PDF p.8). Locator excerpt: “2. The differential symbol”. The source gives the differential-symbol construction; this declaration separates the indicated step and its reusable interface.

#### Degree-zero differential comparison

Identifier: MotivicEtaleKTheory:M.5d/weight-zero-comparison. Kind: theorem.

For every field F of characteristic p, logarithmicSymbol:k_0(F)→ν_0(F) is bijective; under k_0(F)=Z/p and ν_0(F)=F_p it is the identity on the prime field.

Hypotheses and conventions: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z). All symbol entries are units; degree n is a nonnegative integer. p is prime and F has characteristic p.

Proof/construction plan:

1. Use T.2 degree zero K_0^M(F)=Z and Int.range_nsmulAddMonoidHom to identify the reduction quotient with Z/p via Int.quotientZMultiplesNatEquivZMod.
2. Use exteriorPower.zeroEquiv and B_F^0=0 to identify the Cartier kernel with {x∈F:x^p=x}.
3. Use Subfield.mem_bot_iff_pow_eq_self to identify this set with the prime subfield; the empty-symbol formula sends 1 to 1. Its additive multiples exhaust that subfield.

Direct prerequisites: K2SymbolsBrauer:T.2/milnor-k-theory, MotivicEtaleKTheory:M.5d/logarithmic-symbol, MotivicEtaleKTheory:M.5d/artin-schreier-differential, mathlib:exteriorPower.zeroEquiv, mathlib:Int.range_nsmulAddMonoidHom, mathlib:Int.quotientZMultiplesNatEquivZMod, mathlib:Subfield.mem_bot_iff_pow_eq_self, MotivicEtaleKTheory:M.5d/artin-schreier-logarithmic-formula, mathlib:mem_bot_iff_intCast.

Acceptance: For F=F_p the map is the identity Z/p→F_p. For F=F_p(t), the target is F_p, not all of F.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Theorem III.7.7.2, n=0 specialization, printed p.251 (PDF p.259). Locator excerpt: “n”. An elementary base case of the theorem, proved here without invoking the general BGK theorem.

#### Positive-degree forms over a perfect field

Identifier: MotivicEtaleKTheory:M.5d/perfect-field-differentials. Kind: lemma.

Assume the pth-power map on F is surjective. For every n>0, Ω_F^n=0.

Hypotheses and conventions: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z). All symbol entries are units; degree n is a nonnegative integer. p is prime and F has characteristic p.

Proof/construction plan:

1. For each a∈F choose b with a=b^p. Derivation.leibniz_pow and characteristic p give da=0.
2. KaehlerDifferential.span_range_derivation shows Ω_(F/Z)=0.
3. Pure wedges span Ω_F^n; when n>0 every pure wedge has a zero slot, so all vanish.

Direct prerequisites: mathlib:Derivation.leibniz_pow, mathlib:KaehlerDifferential.span_range_derivation, mathlib:exteriorPower.ιMulti_span, MotivicEtaleKTheory:M.5d/characteristic-annihilation, mathlib:AlternatingMap.map_coord_zero.

Acceptance: Applies to finite fields and algebraic closures of F_p. The hypothesis n>0 is necessary: Ω_F^0=F.

Source: [Spencer Bloch and Kazuya Kato, p-adic étale cohomology](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), Corollary 2.2.1 base field, printed p.114 (PDF p.9). Locator excerpt: “perfect”. Elementary perfect-field base calculation used before the pure-transcendental induction.

#### Milnor groups modulo p over a perfect field

Identifier: MotivicEtaleKTheory:M.5d/perfect-field-milnor-mod-p. Kind: lemma.

If the pth-power map on F is surjective, then k_n(F)=0 for every n>0, independently of BGK.

Hypotheses and conventions: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z). All symbol entries are units; degree n is a nonnegative integer. p is prime and F has characteristic p.

Proof/construction plan:

1. Every Milnor group is generated additively by symbols from T.2.
2. For a symbol in positive degree, choose a pth root b of its first unit entry; b is nonzero.
3. Multilinearity gives {b^p,a₂,…,a_n}=p{b,a₂,…,a_n}; reduction kills it.

Direct prerequisites: K2SymbolsBrauer:T.2/milnor-k-theory, mathlib:QuotientGroup.mk'.

Acceptance: For F=F_p and n=1 this says F_p×/(F_p×)^p=0. The conclusion excludes n=0, where k_0(F)=Z/p.

Source: [Spencer Bloch and Kazuya Kato, p-adic étale cohomology](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), Corollary 2.2.1 base field, printed p.114 (PDF p.9). Locator excerpt: “perfect”. The elementary Milnor-side calculation needed for the perfect-field base case.

#### Injectivity of the degree-one differential symbol

Identifier: MotivicEtaleKTheory:M.5d/weight-one-injectivity. Kind: lemma.

For every field F of characteristic p, logarithmicSymbol:k_1(F)→ν_1(F) is injective.

Hypotheses and conventions: F is a field; all Milnor tensor products are over Z; Ω_F^n means the nth exterior power over F of Ω_(F/Z). All symbol entries are units; degree n is a nonnegative integer. p is prime and F has characteristic p.

Proof/construction plan:

1. Use the T.2 degree-one identification with F× to represent each class by a unit a.
2. If its image is zero, the logOne formula and invertibility of a give da=0.
3. Use the requested DD.3 degree-zero Cartier calculation ker(D:F→Ω_(F/Z))=F^p. Write a=b^p with b nonzero.
4. The unit class of b^p is p times that of b and is zero in k_1(F). This proves a trivial kernel, hence injectivity.

Direct prerequisites: K2SymbolsBrauer:T.2/milnor-k-theory, MotivicEtaleKTheory:M.5d/logarithmic-symbol, MotivicEtaleKTheory:M.5d/logarithmic-one-form, DerivedDeRhamCohomology:DD.3, mathlib:exteriorPower.oneEquiv.

Acceptance: The exact kernel of a↦da/a is (F×)^p. For a perfect field both the source and positive-degree target vanish.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Theorem III.7.7.2, degree-one injectivity specialization, printed p.251 (PDF p.259). Locator excerpt: “dlog”. The elementary injectivity step isolated from full BGK; the nontrivial Cartier input is an explicit supplier request.

#### Bloch–Gabber–Kato theorem

Identifier: MotivicEtaleKTheory:M.5d/bloch-gabber-kato. Kind: theorem.

For every field F of characteristic p>0 and q≥0, dlog:K^M_q(F)/p → ν_q(F)=ker(C⁻¹−1:Ω_F^q→Ω_F^q/dΩ_F^(q−1)) is an isomorphism of abelian groups, natural for field embeddings and compatible with products. The target is an additive group, not an F-vector space.

Hypotheses and conventions: p prime; F arbitrary, including imperfect fields; exact forms in degree zero are zero.

Proof/construction plan:

1. Injectivity: BK Lemma 2.2 gives the differential-residue injection; use the split Bass–Tate sequence over perfect rational fields, then realize a finitely generated F as the residue of a DVR with rational fraction field and the relative diagram (2.3.1).
2. Surjectivity: BK Proposition 2.4 uses the relative group k_q(R)=ker(all residues), its unit-symbol presentation/specialization, prime-to-p norm/trace descent, and an adapted p-basis. Lemma 2.5 and (2.6) perform finite lexicographic elimination. The Kato 1982 §1 input is recorded as an unread proof gap.
3. Pass to arbitrary fields by filtered colimits, using finite presentations of symbols/forms and finite étale descent of logarithmic sections. None of M.5a–M.5c is used.

Direct prerequisites: MotivicEtaleKTheory:M.5d/logarithmic-symbol, MotivicEtaleKTheory:M.5d/weight-zero-comparison, MotivicEtaleKTheory:M.5d/weight-one-injectivity, K2SymbolsBrauer:T.3/higher-milnor-residues, K2SymbolsBrauer:T.4/bass-tate-sequence, K2SymbolsBrauer:T.4/restriction-transfer-degree, DerivedDeRhamCohomology:DD.3, MotivicEtaleKTheory:M.5d/filtered-colimit-comparisons.

Proposed declaration: TauCeti.MotivicEtale.bloch_gabber_kato.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Spencer Bloch and Kazuya Kato, p-adic étale cohomology](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), §2, Theorem 2.1, Lemma 2.2, diagram (2.3.1), Proposition 2.4 and Lemma 2.5, printed pp.113–118. Locator excerpt: “Theorem (2.1)”. Characteristic-p field differential comparison, independent of motivic norm varieties.

Atlas planet: Bloch–Gabber–Kato theorem.

#### Witt logarithmic symbol

Identifier: MotivicEtaleKTheory:M.5d/witt-logarithmic-symbol. Kind: construction.

For r≥1 and q≥0 define h_r:K^M_q(F)/p^r→H⁰_et(Spec F,W_rΩ^q_log) by {a₁,…,a_q}↦dlog[a₁]∧…∧dlog[a_q], where [a] is the Teichmüller unit. Degree zero sends 1 to 1∈Z/p^r. The target is the genuine étale logarithmic Witt sheaf group supplied by CR.4, independently of the image of h_r.

Hypotheses and conventions: F characteristic p, p prime; W_r is p-typical; r≥1; additive Z-module target.

Proof/construction plan:

1. Import de Rham–Witt forms, Teichmüller lifts and the logarithmic sheaf. Multilinearity and Steinberg vanishing descend the symbol; p^r annihilation gives the quotient factor.
2. CR.4 supplies j:W₁Ω_log^q→W_rΩ_log^q with j(dlog₁ a)=p^(r−1)dlog_r a and restriction R:W_r→W_(r−1). Global sections are left/middle exact; surjectivity of R on global sections is proved only using BGK induction.

Direct prerequisites: K2SymbolsBrauer:T.2/milnor-k-theory, CrystallineCohomology:CR.4.

Proposed declaration: TauCeti.MotivicEtale.wittSymbol.

Planning API:

- **TauCeti.MotivicEtale.wittSymbol_symbol** (simp): h_r of a pure Milnor symbol is the displayed wedge of Teichmüller logarithms.
- **TauCeti.MotivicEtale.wittSymbol_restrict** (compatibility): For r≥2, R∘h_r=h_(r−1)∘ρ, with ρ coefficient reduction.
- **TauCeti.MotivicEtale.wittSymbol_insert** (compatibility): For r≥2, h_r∘i=j∘h₁, where i([a])=[p^(r−1)a].

Discriminating examples:

- **wittSymbol_test_zero** (computation): At q=0, h_r is the canonical Z/p^r identity.
- **wittSymbol_test_perfect** (degenerate): For perfect F and q>0 the source and logarithmic target vanish.
- **wittSymbol_test_teichmuller** (non-example): In W₂(F₃)=Z/9, [2]+[2]=7 whereas [1]=1; replacing Teichmüller lifts by an additive map is invalid.

Consumers:

- BK Corollary 2.8: Inducts logarithmic comparison from p to p^r.
- HigherLocalFieldsAndHigherClassFieldTheory:HL.2: Supplies the residue-characteristic prime-power symbol.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Spencer Bloch and Kazuya Kato, p-adic étale cohomology](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), Corollary 2.8, printed pp.117–118. Locator excerpt: “(2.8)”. Characteristic-p field differential comparison, independent of motivic norm varieties.

Source: [Luc Illusie, Complexe de de Rham–Witt et cohomologie cristalline](https://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf), I §5.7, pp.596–598, Corollary 5.7.5. Locator excerpt: “COROLLAIRE 5.7.5.”. Defines the étale logarithmic Witt sheaf and supplies its p-power quotient statement; passage to arbitrary fields requires the CR.4 colimit interface.

Atlas planet: Witt logarithmic symbol.

#### Milnor coefficient row

Identifier: MotivicEtaleKTheory:M.5d/milnor-coefficient-row. Kind: lemma.

For every abelian group A and r≥2, C_r=A/p^rA has the right-exact row C₁ --i→ C_r --ρ→ C_(r−1)→0, i([a])=[p^(r−1)a], ρ reduction. ker i=(A[p^(r−1)]+pA)/pA. The Tor map A[p^r]→A[p^(r−1)] induced by reduction is multiplication by p.

Hypotheses and conventions: A arbitrary abelian group; p prime; r≥2.

Proof/construction plan:

1. Use the two-term free resolutions of Z/p^r and Z/p^(r−1); reduction is identity in chain degree zero and multiplication by p in degree one.
2. Compute ker ρ= p^(r−1)A/p^rA and the displayed kernel of i. Do not assume i injective or replace i by multiplication by p at all r.

Direct prerequisites: StableHomotopyKTheory:H.6/moore-spectrum-change-of-coefficients, StableHomotopyKTheory:H.6/bockstein-long-exact-sequence.

Proposed declaration: TauCeti.MotivicEtale.milnor_coefficient_row.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Spencer Bloch and Kazuya Kato, p-adic étale cohomology](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), Corollary 2.8 diagram and its induction, pp.117–118. Locator excerpt: “(2.8)”. Characteristic-p field differential comparison, independent of motivic norm varieties.

#### Prime-power Bloch–Gabber–Kato theorem

Identifier: MotivicEtaleKTheory:M.5d/prime-power-bgk. Kind: theorem.

For every characteristic-p field F, r≥1 and q≥0, h_r:K^M_q(F)/p^r≃H⁰_et(F,W_rΩ_log^q). In the diagram of the coefficient row and 0→B₁ --j→B_r --R→B_(r−1), both rows become short exact after the induction; all h_r commute with coefficient reduction.

Hypotheses and conventions: p prime; no perfectness assumption.

Proof/construction plan:

1. Start with h₁=BGK. Given h_(r−1), injectivity of j and h₁ implies injectivity of i. To prove R surjective, lift an element of B_(r−1) via h_(r−1) and the surjection ρ.
2. For injectivity of h_r, reduce to ker ρ=im i; then use the square h_r i=j h₁ and injectivity. For surjectivity, lift the restriction and correct the difference in im j.
3. This elementary diagram argument proves global R surjectivity; it is not assumed from surjectivity of sheaves.

Direct prerequisites: MotivicEtaleKTheory:M.5d/bloch-gabber-kato, MotivicEtaleKTheory:M.5d/witt-logarithmic-symbol, MotivicEtaleKTheory:M.5d/milnor-coefficient-row, CrystallineCohomology:CR.4.

Proposed declaration: TauCeti.MotivicEtale.prime_power_bgk.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Spencer Bloch and Kazuya Kato, p-adic étale cohomology](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), Corollary 2.8, pp.117–118. Locator excerpt: “(2.8)”. Characteristic-p field differential comparison, independent of motivic norm varieties.

Atlas planet: Prime-power differential comparison.

#### Divisibility of residue-characteristic torsion

Identifier: MotivicEtaleKTheory:M.5d/milnor-torsion-divisible. Kind: theorem.

The p-primary torsion subgroup of K^M_q(F) is p-divisible for characteristic-p F. This does not assert that it is zero, nor that K^M_q(F) itself is p-divisible for imperfect F.

Hypotheses and conventions: q≥0; F characteristic p.

Proof/construction plan:

1. For x killed by p^m, its class in C₁ lies in ker i for r=m+1; injectivity of i implies x=py. Then y is killed by p^(m+1).
2. A Prüfer p-group is a nonzero divisible torsion group with all C_r zero, so torsion-freeness requires a separate theorem.

Direct prerequisites: MotivicEtaleKTheory:M.5d/prime-power-bgk, MotivicEtaleKTheory:M.5d/milnor-coefficient-row.

Proposed declaration: TauCeti.MotivicEtale.milnor_torsion_divisible.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Spencer Bloch and Kazuya Kato, p-adic étale cohomology](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), Corollary 2.8 proof, pp.117–118. Locator excerpt: “(2.8)”. Characteristic-p field differential comparison, independent of motivic norm varieties.

#### Mod-prime motivic comparison

Identifier: MotivicEtaleKTheory:M.5d/mod-prime-motivic-comparison. Kind: theorem.

Let ℓ≠char F be prime and assume the mod-ℓ norm-residue theorem for all finitely generated extensions of F and all weights up to j, with its motivic transfers input. Then Z/ℓ(j)→Rα_*μ_ℓ^⊗j on smooth F-schemes is a quasi-isomorphism through degree j, equivalently Z/ℓ(j)≃τ≤jRα_*μ_ℓ^⊗j. This is the resolution-free Geisser–Levine form of the Suslin–Voevodsky implication.

Hypotheses and conventions: j≥0; α:étale→Zariski; use the genuine M.4 cycle complex and M.5a motivic comparison.

Proof/construction plan:

1. Apply the field diagonal Milnor identification, transfers and semilocal acyclicity to the cone of the cycle map; stalkwise vanishing through weight j gives the truncation equivalence.
2. SV2000 Theorem 7.4 alone assumes resolution of singularities; Geisser–Levine 2001 removes it. The latter original PDF was unavailable and its exact resolution-free proof input is an explicit gap, corroborated by Geisser 2004 §5.

Direct prerequisites: MotivicEtaleKTheory:M.4, MotivicEtaleKTheory:M.5a, MotivicEtaleKTheory:M.5c.

Proposed declaration: TauCeti.MotivicEtale.mod_prime_motivic_comparison.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Andrei Suslin and Vladimir Voevodsky, Bloch–Kato conjecture and motivic cohomology with finite coefficients](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/susvoenew.pdf), §7, Theorem 7.4, pp.52–53. Locator excerpt: “Theorem 7.4”. The resolution-dependent original implication; its hypothesis is retained.

Source: [Thomas Geisser, Motivic cohomology over Dedekind rings](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf), §5 proof of Theorem 1.2, pp.787–789. Locator excerpt: “Beilinson-Lichtenbaum conjecture over a field”. Explicitly cites the resolution-free field implication [8,9]; not claimed to replace reading its proof.

#### Prime-power norm-residue comparison

Identifier: MotivicEtaleKTheory:M.5d/prime-power-norm-residue. Kind: theorem.

For ℓ≠char F prime, r≥1 and j≥0, the Galois symbol K^M_j(F)/ℓ^r→H^j(F,Z/ℓ^r(j)) is an isomorphism, natural for field maps and compatible with products and the coefficient Bocksteins. The coefficient object is T_ℓ^⊗j/ℓ^r, not a naive tensor of the inclusion μ_ℓ→μ_ℓ^r.

Hypotheses and conventions: M.5c supplies mod-ℓ norm residue for every field extension and all weights; M.4 supplies the diagonal motivic identification.

Proof/construction plan:

1. Use mod-prime motivic comparison, and the exact coefficient triangles Z/ℓ(j)→Z/ℓ^r(j)→Z/ℓ^(r−1)(j) with first map ℓ^(r−1), on both motivic and étale sides.
2. The comparison cones have no cohomology in degrees ≤j and are extension-stable, so induction proves the prime-power truncation comparison. On a field H^j(F,Z/ℓ^r(j))=K^M_j(F)/ℓ^r because H^(j+1)(F,Z(j))=0.
3. Retain full long exact rows: neither the Milnor row nor the degree-j Galois row is assumed left exact. In Q×, the class of −1 shows why the p-characteristic short-row argument cannot be copied at ℓ=2.

Direct prerequisites: MotivicEtaleKTheory:M.5d/mod-prime-motivic-comparison, MotivicEtaleKTheory:M.4, MotivicEtaleKTheory:M.1, StableHomotopyKTheory:H.6/bockstein-long-exact-sequence.

Proposed declaration: TauCeti.MotivicEtale.prime_power_norm_residue.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI §4, Beilinson–Lichtenbaum theorem 4.1, pp.480–481. Locator excerpt: “Theorem 4.1.”. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

Atlas planet: Prime-power norm-residue theorem.

#### Filtered-colimit comparison

Identifier: MotivicEtaleKTheory:M.5d/filtered-colimit-comparisons. Kind: theorem.

For a filtered union of fields F=colim F_i, the maps colim K^M_q(F_i)/m→K^M_q(F)/m and colim H^q(F_i,Z/m(j))→H^q(F,Z/m(j)) are isomorphisms when m is invertible; in characteristic p, colim ν_q(F_i)≃ν_q(F) and colim H⁰_et(F_i,W_rΩ_log^q)≃H⁰_et(F,W_rΩ_log^q). All symbol maps commute with these isomorphisms.

Hypotheses and conventions: q,j≥0, m≥1; filtered system of field embeddings; fixed finite r in the Witt assertion.

Proof/construction plan:

1. Milnor symbols and relations involve finitely many elements. Kähler forms/exterior powers and exact-form quotients commute with filtered colimits; filtered colimits of groups preserve kernels.
2. Descend finite étale covers, cocycles and logarithmic sections to a finite stage and apply finite-presentation limit descent. Never commute an infinite derived inverse limit with a colimit without an additional theorem.

Direct prerequisites: K2SymbolsBrauer:T.2/milnor-k-theory, DerivedDeRhamCohomology:DD.2/ordinary-de-rham-complex, CrystallineCohomology:CR.4, MotivicEtaleKTheory:M.1, tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees.

Proposed declaration: TauCeti.MotivicEtale.filtered_colimit_comparisons.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Spencer Bloch and Kazuya Kato, p-adic étale cohomology](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf), §2 after Theorem 2.1, p.113. Locator excerpt: “Theorem (2.1)”. Characteristic-p field differential comparison, independent of motivic norm varieties.

Source: [Thomas Geisser, Motivic cohomology over Dedekind rings](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf), Lemma 2.1, pp.775–776. Locator excerpt: “Lemma 2.1.”. Noetherian étale-site limit argument; the exact field-colimit interface is requested.

#### Permitted field reductions

Identifier: MotivicEtaleKTheory:M.5d/inseparable-and-characteristic-reductions. Kind: theorem.

For a purely inseparable extension E/F in characteristic p and m coprime to p, restriction is an isomorphism K^M_q(F)/m≃K^M_q(E)/m and H^q(F,Z/m(j))≃H^q(E,Z/m(j)). General fields reduce to finitely generated prime-field extensions by the colimit theorem. These reductions do not identify a residue-characteristic symbol with a prime-to-characteristic one or specialize across characteristics without a henselian/smooth comparison theorem.

Hypotheses and conventions: q,j≥0; m prime to p; arbitrary purely inseparable extensions obtained by filtered union.

Proof/construction plan:

1. For finite exponent e, every symbol over E has p^(eq)-multiple from F; invert p modulo m for surjectivity. Restriction followed by norm is [E:F], a p-power, for injectivity.
2. Purely inseparable extensions give equivalent finite étale categories and identical absolute Galois groups. Apply filtered colimits for the infinite extension.

Direct prerequisites: MotivicEtaleKTheory:M.5d/filtered-colimit-comparisons, K2SymbolsBrauer:T.4/restriction-transfer-degree, ArithmeticGaloisDuality:R02.2.

Proposed declaration: TauCeti.MotivicEtale.inseparable_and_characteristic_reductions.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI §4 Theorem 4.1 and its characteristic restrictions, p.480. Locator excerpt: “Theorem 4.1.”. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

### M.6a

#### Admissible K-theory supports

Identifier: MotivicEtaleKTheory:M.6a/admissible-k-supports. Kind: definition.

For X smooth of finite type over a perfect field k and p,r≥0, S_X^(p)(r) is the filtered poset of closed W⊂X×Δ^r such that codim_(X×F)(W∩(X×F))≥p for every face F of Δ^r, including the whole simplex. Use Perf_W(X×Δ^r) and its support K-theory spectrum from S.3/S.4; pullbacks along simplex maps give the simplicial support diagram.

Hypotheses and conventions: X smooth, finite-dimensional, separated of finite type over perfect k; codimension interpreted componentwise; an empty intersection has infinite codimension.

Proof/construction plan:

1. Take the finite union poset of admissible closed supports. Proper face intersections ensure face/degeneracy pullbacks preserve the required support condition.
2. Import the actual perfect-complex support categories and pullback K-theory; no support category is defined from the expected spectral sequence.

Direct prerequisites: SchemeKTheoryOperations:S.4/codimension-support-filtration, SchemeKTheoryOperations:S.4/coniveau-layer-fibre-sequence, MotivicEtaleKTheory:M.4.

Proposed declaration: TauCeti.MotivicEtale.admissibleSupports.

Planning API:

- **TauCeti.MotivicEtale.admissibleSupports_iff** (characterisation): Membership is exactly the codimension inequality for every face.
- **TauCeti.MotivicEtale.admissibleSupports_union** (structure): Finite unions are admissible, giving a filtered indexing poset.
- **TauCeti.MotivicEtale.admissibleSupports_face** (functoriality): Face pullback induces the indicated support-poset map with the simplicial identities.

Discriminating examples:

- **admissibleSupports_test_empty** (degenerate): The empty support is admissible in every p,r.
- **admissibleSupports_test_zero** (computation): At p=0 every closed support is admissible.
- **admissibleSupports_test_face** (non-example): For X=Spec k, a vertex in Δ¹ has codimension 1 in Δ¹ but codimension 0 on that face, so it is excluded at p=1.

Consumers:

- Levine §1.3 and §4.1: Builds the simplicial tower and permits moving for arbitrary smooth pullback.
- MotivicEtaleKTheory:M.6b: Controls the connectivity bound before convergence.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Marc Levine, The homotopy coniveau tower](https://arxiv.org/pdf/math/0510334), §1.2–1.3, support conditions and simplicial spectra, pp.5–7. Locator excerpt: “homotopy coniveau”. The homotopy coniveau construction is defined on actual support K-theory spectra before identifying its layers.

Atlas planet: Admissible supports.

#### Homotopy coniveau tower

Identifier: MotivicEtaleKTheory:M.6a/homotopy-coniveau-tower. Kind: construction.

Define K^(p)(X,r)=hocolim_(W∈S_X^(p)(r))K^W(X×Δ^r), and K^(p)(X)=|r↦K^(p)(X,r)|. Inclusion of supports defines K^(p+1)→K^(p); the layer is cofib(K^(p+1)→K^(p)), and K→K^(0) is the A¹ augmentation. Nisnevich regularization with supports adapted to each map gives a functorial tower on Sm/k.

Hypotheses and conventions: Same smooth perfect-field class as admissible supports; K is the genuine connective regular-scheme spectrum, with support fibres; finite k requires A3, verified by finite restriction/transfer after inverting the extension degree.

Proof/construction plan:

1. Build the hocolim and geometric realization using H.5, then apply K homotopy invariance and Nisnevich excision.
2. For arbitrary smooth morphisms restrict to supports whose inverse images remain admissible, apply moving, and regularize the entire tower via the Dwyer–Kan construction of Levine Theorem 4.1.1; do not infer pullback on arbitrary supports.

Direct prerequisites: MotivicEtaleKTheory:M.6a/admissible-k-supports, SchemeKTheoryOperations:S.5/homotopy-invariance-regular, SchemeKTheoryOperations:S.4/nisnevich-excision-square, EnhancedDerivedSheaves:E5:abstract.

Proposed declaration: TauCeti.MotivicEtale.coniveauTower.

Planning API:

- **TauCeti.MotivicEtale.coniveauTower_level** (data): The level is the displayed realization of the support hocolimit.
- **TauCeti.MotivicEtale.coniveauTower_transition** (projection): The transition is induced by S^(p+1)⊂S^(p), commuting with augmentation.
- **TauCeti.MotivicEtale.coniveauTower_pullback** (functoriality): Adapted-support moving induces pullback for smooth-scheme maps, with identity and composition in the homotopy category.

Discriminating examples:

- **coniveauTower_test_zero** (characterisation): K→K^(0) is an equivalence by A¹ invariance.
- **coniveauTower_test_dimension** (degenerate): K^(p)(X,r)=0 for p>dim X+r before realization.
- **coniveauTower_test_field_layer** (computation): For Spec k the weight-zero layer is HZ, so the constant zero tower is excluded.

Consumers:

- Levine Theorem 6.4.2: Provides actual K layers to compare with cycles.
- MotivicEtaleKTheory:M.6 and M.7: Produces the motivic filtered spectrum and finite coefficient comparison.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Marc Levine, The homotopy coniveau tower](https://arxiv.org/pdf/math/0510334), §1.3, Theorem 4.1.1 and proof, pp.6–7 and 20–22. Locator excerpt: “Theorem 4.1.1.”. The homotopy coniveau construction is defined on actual support K-theory spectra before identifying its layers.

Atlas planet: Homotopy coniveau tower.

#### Moving and excision theorem

Identifier: MotivicEtaleKTheory:M.6a/moving-and-excision. Kind: theorem.

On the stated smooth perfect-field K-theory setting, the adapted-support inclusion for f:Y→X induces equivalences K^(p)(X)_f≃K^(p)(X), and the localized support sequence for a closed Z⊂X and U=X−Z is a fibre sequence. The induced layer maps are natural in the corresponding good-position supports.

Hypotheses and conventions: K satisfies A1 homotopy invariance, A2 Nisnevich excision and A3 finite-field degree descent; localization uses the base restrictions in Levine Theorem 3.2.1 (over a field its infinite-residue version, finite fields via A3).

Proof/construction plan:

1. Use generic projection to move supports into good position; homotopies compare projections and yield equivalences on stable homology/connective truncations.
2. Use A2 to remove the exceptional locus; extend from infinite to finite fields by transfer for two coprime extension degrees.
3. Apply the moving map to relative supports and then fibre/cofibre sequences; regularize the diagrams simultaneously, as in Theorem 4.1.1.

Direct prerequisites: MotivicEtaleKTheory:M.6a/homotopy-coniveau-tower, SchemeKTheoryOperations:S.4/nisnevich-excision-square, SchemeKTheoryOperations:S.6/support-product-pairings.

Proposed declaration: TauCeti.MotivicEtale.moving_and_excision.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Marc Levine, The homotopy coniveau tower](https://arxiv.org/pdf/math/0510334), Theorem 3.2.1 proof, pp.14–17; Theorem 4.1.1, pp.20–22. Locator excerpt: “Theorem 3.2.1.”. The homotopy coniveau construction is defined on actual support K-theory spectra before identifying its layers.

Atlas planet: Coniveau moving theorem.

#### Well-connected K-theory

Identifier: MotivicEtaleKTheory:M.6a/k-theory-well-connected. Kind: theorem.

K on smooth perfect-field schemes is well connected: support spectra used in the tower are connective, and the P¹-loop iterates have no nonzero homotopy in degrees other than zero on the indicated multirelative semilocal simplices. Their degree-zero cycle maps give the codimension-p cycle generators.

Hypotheses and conventions: Levine Definition 6.1.1 well-connectedness; semilocal Δ with all faces and their boundary; regular ambient schemes, not arbitrary singular K-theory.

Proof/construction plan:

1. K satisfies homotopy invariance and excision; K₀ regular ambient→K₀ open is surjective, so its support fibre is connective.
2. Identify Ω_TK≃K through the projective-bundle formula. For semilocal simplices with normal-crossing boundary, apply the Vorst K₁ input and K/KH comparison and Mayer–Vietoris requested from the scheme owner.
3. Apply Corollary 5.3.2 to the resulting connective layer and cycle generators. The generic KH/boundary input remains an explicit supplier gap.

Direct prerequisites: MotivicEtaleKTheory:M.6a/moving-and-excision, SchemeKTheoryOperations:S.5/projective-bundle-theorem, SchemeKTheoryOperations:S.5/negative-k-vanishing-regular.

Proposed declaration: TauCeti.MotivicEtale.k_theory_well_connected.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Marc Levine, The homotopy coniveau tower](https://arxiv.org/pdf/math/0510334), §6.4 proof of Theorem 6.4.2, pp.35–37. Locator excerpt: “Theorem 6.4.2.”. The homotopy coniveau construction is defined on actual support K-theory spectra before identifying its layers.

#### Coniveau cycle-layer comparison

Identifier: MotivicEtaleKTheory:M.6a/coniveau-cycle-layer. Kind: theorem.

For p≥0 and X in the smooth perfect-field class, cofib(K^(p+1)(X)→K^(p)(X))≃H(z^p(X,•)), the Eilenberg–Mac Lane spectrum of Bloch’s homological cycle complex. Therefore π_m of this layer is CH^p(X,m)=H^(2p−m)(X,Z(p)). Face maps have the intersection multiplicities of the cycle complex.

Hypotheses and conventions: Bloch cycle complex and motivic identification imported from M.4; no resolution-of-singularities assumption in Levine 2008 Theorem 6.4.2.

Proof/construction plan:

1. Use well-connectedness and Corollary 5.3.2 to identify layers with degree-zero classes supported at good codimension-p points.
2. Dévissage maps a length-one generic coherent sheaf to its cycle. Moving ensures every cycle occurs; naturality of Tor intersection multiplicities identifies face and degeneracy maps.
3. Apply the source’s simplicial cycle-layer weak equivalence, then the M.4 shift convention.

Direct prerequisites: MotivicEtaleKTheory:M.6a/k-theory-well-connected, MotivicEtaleKTheory:M.6a/moving-and-excision, MotivicEtaleKTheory:M.4.

Proposed declaration: TauCeti.MotivicEtale.coniveau_cycle_layer.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Marc Levine, The homotopy coniveau tower](https://arxiv.org/pdf/math/0510334), Theorem 6.4.2, pp.35–37; Remark 11.3.4, p.65. Locator excerpt: “Theorem 6.4.2.”. The homotopy coniveau construction is defined on actual support K-theory spectra before identifying its layers.

Atlas planet: Coniveau cycle-layer comparison.

#### Global motivic model comparison

Identifier: MotivicEtaleKTheory:M.6a/global-model-comparison. Kind: theorem.

For smooth quasi-projective X over a perfect field, the regularized homotopy-coniveau model and the Friedlander–Suslin global support model admit a natural filtered zigzag of equivalences compatible with K augmentation and the cycle maps. Hence their reindexed spectral sequences agree. This claim requires a filtered comparison, not merely agreement of E₂ pages.

Hypotheses and conventions: Common smooth quasi-projective perfect-field range; global Zariski/Nisnevich derived sections, actual tower maps and their homotopies.

Proof/construction plan:

1. Compare the adapted and quasi-finite support subcategories by the moving theorem, preserving the entire inclusion tower.
2. Use local cycle-layer comparisons and support descent to glue the levelwise comparison; verify compatibility with transitions and augmentation.
3. FS2002 gives the global exact couple (Theorem 13.13, Proposition 13.17); an explicit filtered zigzag matching the Levine model is not proved in the read passages and remains a precise comparison gap. Do not appeal to equal associated gradeds alone.

Direct prerequisites: MotivicEtaleKTheory:M.6a/homotopy-coniveau-tower, MotivicEtaleKTheory:M.6a/coniveau-cycle-layer, SchemeKTheoryOperations:S.4/descent-coniveau-e2-comparison.

Proposed declaration: TauCeti.MotivicEtale.global_model_comparison.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Eric M. Friedlander and Andrei Suslin, The spectral sequence relating algebraic K-theory to motivic cohomology](https://dornsife.usc.edu/ericmfriedlander/wp-content/uploads/sites/233/2023/06/23.pdf), Introduction pp.1–2, §13 Theorem 13.13 and Proposition 13.17, pp.68–71. Locator excerpt: “Theorem 13.13.”. Constructs the genuine global tower and convergent exact couple; the comparison to the Levine tower is an explicit proof obligation.

Source: [Marc Levine, The homotopy coniveau tower](https://arxiv.org/pdf/math/0510334), §4.1 and §11.3, pp.20–22,64–65. Locator excerpt: “Theorem 4.1.1.”. The homotopy coniveau construction is defined on actual support K-theory spectra before identifying its layers.

Atlas planet: Global motivic comparison.

### M.6b

#### Motivic exact couple

Identifier: MotivicEtaleKTheory:M.6b/motivic-exact-couple. Kind: construction.

Apply the generic tower exact-couple functor to K^(p+1)→K^(p)→L^p. With D₁^(p,m)=π_mK^(p), E₁^(p,m)=π_mL^p, take i:D₁^(p+1,m)→D₁^(p,m), j:D₁^(p,m)→E₁^(p,m), k:E₁^(p,m)→D₁^(p+1,m−1). Derivation gives d_s:E_s^(p,m)→E_s^(p+s,m−1), and after the conventional page renumbering E₂^(a,b)=H^(a−b)(X,Z(−b)).

Hypotheses and conventions: Actual support tower; H.6 exact-couple convention transported by s=−p, with the motivic E₂ page equal to the raw tower E₁; q=−b, m=−a−b.

Proof/construction plan:

1. Apply π to the layer triangles and import generic exact-couple derivation.
2. Transport the raw homological indexing into the motivic convention and verify d_r:E_r^(a,b)→E_r^(a+r,b−r+1); the raw d₁ becomes motivic d₂.

Direct prerequisites: MotivicEtaleKTheory:M.6a/coniveau-cycle-layer, StableHomotopyKTheory:H.6/exact-couple, StableHomotopyKTheory:H.6/filtered-spectrum-spectral-sequence.

Proposed declaration: TauCeti.MotivicEtale.motivicCouple.

Planning API:

- **TauCeti.MotivicEtale.motivicCouple_D** (data): D is the homotopy of the tower level in the stated raw indexing.
- **TauCeti.MotivicEtale.motivicCouple_E** (data): E is the homotopy of the actual cycle layer.
- **TauCeti.MotivicEtale.motivicCouple_differential** (projection): Differentials come from k, iterated lifts through i, then j; motivic bidegree is (r,1−r).

Discriminating examples:

- **motivicCouple_test_indices** (computation): a=−m+j,b=−j gives H^(2j−m)(X,Z(j)) and total K_m.
- **motivicCouple_test_boundary** (compatibility): At the raw first page the map is j∘k and squares to zero by triangle exactness.
- **motivicCouple_test_zero_weight** (degenerate): Weight j=0 has no incoming negative-weight layer; it is not a second independent K-spectrum.

Consumers:

- MotivicEtaleKTheory:M.6: Assembles the spectral sequence from actual maps.
- MotivicEtaleKTheory:M.7: Compares finite coefficient pages with étale descent.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Marc Levine, The homotopy coniveau tower](https://arxiv.org/pdf/math/0510334), Proposition 2.1.3 and §11.3, pp.10–12,64–65. Locator excerpt: “Proposition 2.1.3.”. The homotopy coniveau construction is defined on actual support K-theory spectra before identifying its layers.

Source: [Eric M. Friedlander and Andrei Suslin, The spectral sequence relating algebraic K-theory to motivic cohomology](https://dornsife.usc.edu/ericmfriedlander/wp-content/uploads/sites/233/2023/06/23.pdf), Proposition 13.17, p.71. Locator excerpt: “Proposition 13.17.”. Pins the delooped global exact couple and page reindexing.

Atlas planet: Motivic exact couple.

#### Strong convergence of the motivic tower

Identifier: MotivicEtaleKTheory:M.6b/motivic-strong-convergence. Kind: theorem.

For X smooth of dimension d over a perfect field and each m≥0, π_mK^(p)(X)=0 for p>d+m. K^(0)(X)≃K(X), and holim_p K^(p)(X)=0, including its Milnor lim¹ obstruction. The induced filtration on K_m(X) is finite, exhaustive and separated; the motivic spectral sequence strongly converges to K_m(X).

Hypotheses and conventions: Finite d; connective support K spectra and geometric realization; no such claim for an arbitrary unbounded spectrum or an infinite-dimensional scheme.

Proof/construction plan:

1. At simplicial degree r<p−d there are no supports. Since the support spectra are connective, realization is at least (p−d)-connective; deduce vanishing in the stated range.
2. For each m, both π_m and π_(m+1) tower systems are eventually zero, hence lim and lim¹ vanish. The Milnor sequence proves holim is contractible.
3. Use the generic exact couple and finite filtration to obtain strong convergence. Compare the FS bound on RΓ(X,Ω⁻¹K^p) in Lemma 13.12, respecting the delooping shift.

Direct prerequisites: MotivicEtaleKTheory:M.6a/k-theory-well-connected, MotivicEtaleKTheory:M.6a/homotopy-coniveau-tower, MotivicEtaleKTheory:M.6b/motivic-exact-couple, StableHomotopyKTheory:H.6/milnor-sequence.

Proposed declaration: TauCeti.MotivicEtale.motivic_strong_convergence.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Marc Levine, The homotopy coniveau tower](https://arxiv.org/pdf/math/0510334), Proposition 2.1.3, pp.10–12. Locator excerpt: “Proposition 2.1.3.”. The homotopy coniveau construction is defined on actual support K-theory spectra before identifying its layers.

Source: [Eric M. Friedlander and Andrei Suslin, The spectral sequence relating algebraic K-theory to motivic cohomology](https://dornsife.usc.edu/ericmfriedlander/wp-content/uploads/sites/233/2023/06/23.pdf), Lemma 13.12 and Theorem 13.13, pp.67–68. Locator excerpt: “Lemma 13.12.”. Supplies finite dimension connectivity of the global model.

Atlas planet: Motivic strong convergence.

#### Filtered motivic products

Identifier: MotivicEtaleKTheory:M.6b/filtered-motivic-products. Kind: theorem.

The support tensor product and moving of pairs give K^(p)(X)∧K^(q)(X)→K^(p+q)(X), compatible with the tower and layer cup products. Thus the motivic spectral sequence is multiplicative and d_r is a graded derivation; it acts as a module spectral sequence on finite coefficients. An intrinsic product on finite coefficients requires its actual chosen multiplication and coherence. The imported Moore-spectrum ring theorem supplies this for prime powers outside {2,3,4,8}; the module action of integral K on coefficients does not require such a coefficient-ring structure.

Hypotheses and conventions: Smooth perfect-field X; product supports must first be moved into proper intersection; finite coefficient coherence stated separately. No unital product is inferred on S/2; no associative/commutative product is inferred from the imported theorem at the exceptional levels 3,4,8. Any stronger K-specific product needs a separate supplier theorem.

Proof/construction plan:

1. Move the two support families simultaneously; derived tensor product has support in their intersection, with codimensions adding in good position.
2. Compare on cycle generators to the M.4 intersection product and apply the generic product exact-couple construction.
3. Retain the integral action at every m; do not deduce an associative mod-2 multiplication from the integral action.

Direct prerequisites: MotivicEtaleKTheory:M.6a/moving-and-excision, MotivicEtaleKTheory:M.6b/motivic-exact-couple, SchemeKTheoryOperations:S.6/support-product-pairings, StableHomotopyKTheory:H.6/moore-spectrum-multiplication, MotivicEtaleKTheory:M.4.

Proposed declaration: TauCeti.MotivicEtale.filtered_motivic_products.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Addendum 4.2.1, p.481. Locator excerpt: “Addendum 4.2.1.”. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

Source: [Marc Levine, K-theory and motivic cohomology of schemes, I](https://www.esaga.uni-due.de/f/marc.levine/publ/KthyMotI12.01.pdf), §11 and Appendix D product construction; Theorem 12.12, pp.58–59. Locator excerpt: “Theorem 12.12.”. Read Theorem 12.12 and its proof; detailed product construction is a recorded source-read gap.

Atlas planet: Filtered motivic product.

#### Filtered Adams operations

Identifier: MotivicEtaleKTheory:M.6b/filtered-adams-operations. Kind: theorem.

For k≥2, the imported Adams operation ψ^k on K extends to the motivic support tower in the proven regular finite-dimensional smooth-field setting. It commutes with transition/boundary maps and acts by k^j on E₂^(a,−j)=H^(a+j)(X,Z(j)). The operation on the abutment is the actual scheme ψ^k.

Hypotheses and conventions: Same scheme class; support operations and Adams–Riemann–Roch normalizations imported from S.6/S.7.

Proof/construction plan:

1. Apply support λ-operations to the simplicial support diagrams and their Zariski descent; compatibility with localization gives an exact-couple endomorphism.
2. On the codimension-j generic cycle generator, Adams–Riemann–Roch gives the factor k^j; use the cycle-layer equivalence to identify the entire page.
3. Levine Theorem 12.12 printed page indices differ from the adopted E₂ indexing; weight is the positive codimension j.

Direct prerequisites: MotivicEtaleKTheory:M.6a/coniveau-cycle-layer, MotivicEtaleKTheory:M.6b/motivic-exact-couple, SchemeKTheoryOperations:S.6/scheme-adams-multiplicative, SchemeKTheoryOperations:S.7/gamma-chern-character.

Proposed declaration: TauCeti.MotivicEtale.filtered_adams_operations.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Marc Levine, K-theory and motivic cohomology of schemes, I](https://www.esaga.uni-due.de/f/marc.levine/publ/KthyMotI12.01.pdf), Theorem 12.12 and proof, pp.58–59. Locator excerpt: “Theorem 12.12.”. Filtered λ/Adams construction and the codimension weight calculation.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Theorem 4.9 and proof, pp.485–486. Locator excerpt: “Theorem 4.9.”. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

Atlas planet: Filtered Adams operations.

#### Rational motivic degeneration

Identifier: MotivicEtaleKTheory:M.6b/rational-motivic-degeneration. Kind: theorem.

After tensoring by Q all differentials d_r for r≥2 vanish. For fixed total degree m the finite filtration on K_m(X)_Q splits canonically into Adams eigenspaces of weights 0≤j≤d+m. The weight-j piece is its cycle-layer quotient.

Hypotheses and conventions: Smooth perfect-field X of dimension d; m≥0; rational coefficients, with ψ^k for k≥2.

Proof/construction plan:

1. d_r changes weight j to j+r−1. Commutativity with ψ^k gives (k^j−k^(j+r−1))d_r=0, whose nonzero scalar is invertible over Q.
2. Convergence gives a finite filtration. Polynomial projectors for the distinct eigenvalues k^0,…,k^(d+m) split it; identify simultaneous Adams weights and prove independence of k.
3. No integral degeneration is inferred; Levine Theorem 14.7 instead records bounded denominators and torsion differentials.

Direct prerequisites: MotivicEtaleKTheory:M.6b/filtered-adams-operations, MotivicEtaleKTheory:M.6b/motivic-strong-convergence.

Proposed declaration: TauCeti.MotivicEtale.rational_motivic_degeneration.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Theorem 4.9, p.486. Locator excerpt: “Theorem 4.9.”. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

Source: [Marc Levine, K-theory and motivic cohomology of schemes, I](https://www.esaga.uni-due.de/f/marc.levine/publ/KthyMotI12.01.pdf), Theorems 14.5 and 14.7, pp.71–73. Locator excerpt: “Theorem 14.7.”. Finite filtration and integral denominator control imply the stated rational splitting.

Atlas planet: Rational motivic degeneration.

### M.6

#### Motivic spectral sequence

Identifier: MotivicEtaleKTheory:M.6/motivic-spectral-sequence. Kind: construction.

Assemble the actual coniveau exact couple, cycle-layer comparison and strong convergence into E₂^(a,b)=H^(a−b)(X,Z(−b))⇒K_(−a−b)(X), b≤0, with d_r of bidegree (r,1−r). This is the same tower, not another definition of K or motivic cohomology.

Hypotheses and conventions: X smooth separated finite type over a perfect field, dim X finite; m=−a−b≥0; for the FS comparison require quasi-projectivity.

Proof/construction plan:

1. Transport the generic tower spectral object and use the proved layer and convergence theorems; verify the M.4 cycle shift.
2. For nonregular schemes the analogous construction abuts to G-theory, not vector-bundle K. Extension to arbitrary fields/regular arithmetic bases requires the precise source descent/limit theorem recorded as a gap.

Direct prerequisites: MotivicEtaleKTheory:M.6b/motivic-exact-couple, MotivicEtaleKTheory:M.6a/coniveau-cycle-layer, MotivicEtaleKTheory:M.6b/motivic-strong-convergence, MotivicEtaleKTheory:M.6b/filtered-motivic-products, MotivicEtaleKTheory:M.6b/filtered-adams-operations.

Proposed declaration: TauCeti.MotivicEtale.motivicSequence.

Planning API:

- **TauCeti.MotivicEtale.motivicSequence_pageTwo** (equivalence): The displayed E₂ page is motivic cohomology with its cycle-complex shift.
- **TauCeti.MotivicEtale.motivicSequence_abutment** (equivalence): The finite filtration abuts to the genuine K_m(X) in the stated range.
- **TauCeti.MotivicEtale.motivicSequence_pullback** (functoriality): Smooth-scheme pullbacks preserve the filtered sequence; identity/composition agree with the tower maps.

Discriminating examples:

- **motivicSequence_test_field_diagonal** (computation): For a field and a=0,b=−j the page term is K^M_j(F), using M.4.
- **motivicSequence_test_weight_zero** (degenerate): At a=b=0 the term is H⁰(X,Z(0)); the rank edge is the usual K₀ rank.
- **motivicSequence_test_finite_field** (compatibility): For F_q, the finite-field motivic input recovers K_(2j−1)(F_q)=Z/(q^j−1) and K_(2j)(F_q)=0 for j≥1.

Consumers:

- MotivicEtaleKTheory:M.7: Compares finite coefficient motivic terms with the étale sequence.
- Polylogarithms:P.3: Supplies the rational weight-three comparison.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Theorem 4.2 and Addendum 4.2.1, pp.481–482. Locator excerpt: “Theorem 4.2.”. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

Atlas planet: Motivic spectral sequence.

#### Rational K-theory weight comparison

Identifier: MotivicEtaleKTheory:M.6/rational-weight-comparison. Kind: theorem.

For the stated smooth finite-dimensional perfect-field X, m,j≥0, K_m(X)_Q^(j)≃H^(2j−m)(X,Q(j)), natural for smooth-scheme maps and products. Both sides vanish for j>d+m. The isomorphism is the normalized higher motivic Chern character, with no factorial ambiguity.

Hypotheses and conventions: The eigenspace is simultaneous ψ^k=k^j, k≥2; normalization in positive K degree is ch_(j,m)=(-1)^(j−1)c_(j,m)/(j−1)! for j≥1, while degree-zero ch_j uses Newton polynomials/j!.

Proof/construction plan:

1. Apply rational degeneration and the canonical eigenprojectors to the layer equivalence.
2. Compare the cycle generator and the universal higher Chern class: the diagonal Milnor symbol has factor (-1)^(j−1)(j−1)!, so the normalized character is the identity on it.
3. Use products and Adams operations to identify this comparison with the γ-Chern character imported from S.7 followed by the cycle-layer isomorphism. For m=0 recover the S.7 geometric Chow Chern character.

Direct prerequisites: MotivicEtaleKTheory:M.6b/rational-motivic-degeneration, MotivicEtaleKTheory:M.6/motivic-spectral-sequence, SchemeKTheoryOperations:S.7/gamma-chern-character, SchemeKTheoryOperations:S.7/chern-character, SchemeKTheoryOperations:S.7/chern-character-ring-homomorphism.

Proposed declaration: TauCeti.MotivicEtale.rational_weight_comparison.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Theorem 4.9; V Lemma 11.3 and Theorem 11.11, pp.452–453,457,486. Locator excerpt: “Theorem 4.9.”. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

Atlas planet: Rational K-theory weights.

### M.7

#### Beilinson–Lichtenbaum comparison

Identifier: MotivicEtaleKTheory:M.7/beilinson-lichtenbaum. Kind: theorem.

For X smooth over a field, m≥1 invertible in the field and j≥0, the motivic cycle map gives Z/m(j)≃τ≤jRα_*μ_m^⊗j. Consequently H^a(X,Z/m(j))→H_et^a(X,μ_m^⊗j) is an isomorphism for a≤j and an injection for a=j+1. This is the explicit bridge from norm residue and cycle complexes to finite coefficient E₂ pages.

Hypotheses and conventions: Genuine M.4 motivic complex; α étale→Zariski; full prime-power norm residue and the resolution-free field implication.

Proof/construction plan:

1. Apply the mod-prime motivic comparison and coefficient-triangle induction for each prime divisor of m, then Chinese remainder decomposition.
2. Identify stalks using semilocal motivic complexes and the M.5a transfer/cycle comparison. Apply hypercohomology to the truncation equivalence; the cone bound gives the injection in the next degree.
3. Do not infer a low-degree complex comparison solely from the diagonal Milnor symbol theorem.

Direct prerequisites: MotivicEtaleKTheory:M.5d/mod-prime-motivic-comparison, MotivicEtaleKTheory:M.5d/prime-power-norm-residue, MotivicEtaleKTheory:M.4, MotivicEtaleKTheory:M.5a.

Proposed declaration: TauCeti.MotivicEtale.beilinson_lichtenbaum.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Theorem 4.1, p.480. Locator excerpt: “Theorem 4.1.”. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

Source: [Andrei Suslin and Vladimir Voevodsky, Bloch–Kato conjecture and motivic cohomology with finite coefficients](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/susvoenew.pdf), §7, Theorem 7.4, pp.52–53. Locator excerpt: “Theorem 7.4”. Original motivic bridge with resolution; the resolution-free input remains identified as a gap.

Atlas planet: Beilinson–Lichtenbaum theorem.

#### Dedekind motivic comparison

Identifier: MotivicEtaleKTheory:M.7/dedekind-motivic-comparison. Kind: theorem.

Let B be a Dedekind scheme, X equidimensional and essentially smooth over B, and m invertible on B. The cycle map Z/m(j)_et≃μ_m^⊗j is a quasi-isomorphism; H^a(X,Z/m(j))→H_et^a(X,μ_m^⊗j) is an isomorphism for a≤j. In particular these assertions hold on Spec O_(F,S)[1/ℓ] for m=ℓ^r.

Hypotheses and conventions: j≥0; use the genuine mixed-base cycle complex and its localization/purity statements; Geisser 2004 Theorem 1.2 is conditional on norm residue, now supplied.

Proof/construction plan:

1. Compare the generic-fibre and closed-fibre localization triangles. Field Beilinson–Lichtenbaum, motivic purity and étale absolute purity identify the outside maps.
2. Geisser Theorem 1.2(2) gives the integral comparison through j+1; its coefficient long exact sequence yields the finite comparison through j. Theorem 1.2(4) identifies the étale cycle sheaf.
3. Neither an unqualified smooth-field theorem nor rational weights alone proves the S-integer comparison.

Direct prerequisites: MotivicEtaleKTheory:M.7/beilinson-lichtenbaum, MotivicEtaleKTheory:M.4, ArithmeticGaloisDuality:R02.3.

Proposed declaration: TauCeti.MotivicEtale.dedekind_motivic_comparison.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Thomas Geisser, Motivic cohomology over Dedekind rings](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf), Theorem 1.2(1),(2),(4), pp.774–775; §5 proof, pp.787–789. Locator excerpt: “Theorem 1.2.”. Read the full localizing-triangle proof and retained its base and coefficient hypotheses.

#### Finite étale K-theory

Identifier: MotivicEtaleKTheory:M.7/finite-etale-k-theory. Kind: construction.

For the stated schemes and m invertible, define K^et(X;Z/m) as derived étale sections of the hypercomplete periodic finite-coefficient K-theory sheaf. The canonical map K(X)/m→K^et(X;Z/m) comes from sheafification and Bott periodicization. Its local homotopy sheaves are μ_m^⊗j in degree 2j, for all integer j, and zero in odd degrees. Coefficients/completion are those of H.6, not underived tensor products of K-groups.

Hypotheses and conventions: For descent/convergence here restrict to fields of finite ℓ-cd with the stated Thomason field hypothesis, or O_(F,S)[1/ℓ] at odd ℓ (and totally imaginary F at ℓ=2); m=ℓ^r. The carrier/construction of hypercomplete sheaves of spectra is requested from E5.

Proof/construction plan:

1. Import finite K spectra, étale hyperdescent and sheafification. Gabber rigidity and the separably closed computation identify homotopy sheaves; local Bott elements glue via Tate twists.
2. Map the genuine K spectrum through the hypercomplete periodic sheaf and take derived global sections. Include coefficient reduction and étale-site base change.

Direct prerequisites: KTheoryFiniteLocalFields:L.2/gabber-rigidity, StableHomotopyKTheory:H.6/coefficient-spectrum, EnhancedDerivedSheaves:E5:abstract.

Proposed declaration: TauCeti.MotivicEtale.etaleK.

Planning API:

- **TauCeti.MotivicEtale.etaleK_compare** (projection): The ordinary-to-étale comparison is induced by the sheafification and periodicization maps.
- **TauCeti.MotivicEtale.etaleK_hyperdescent** (characterisation): Derived sections send an étale hypercover to the corresponding homotopy limit.
- **TauCeti.MotivicEtale.etaleK_coefficients** (compatibility): Reduction maps commute with comparison and the coefficient Bockstein triangles.

Discriminating examples:

- **etaleK_test_separable_closed** (computation): On a separably closed field with ℓ invertible, π_(2j)=Z/ℓ^r(j), π_(2j+1)=0 for every integer j.
- **etaleK_test_rank** (compatibility): In degree zero over that field the comparison sends the unit class to 1.
- **etaleK_test_periodic** (non-example): Its π_(-2) is Z/ℓ^r(−1); a connective K spectrum with negative groups zero fails this test.

Consumers:

- MotivicEtaleKTheory:M.7: Constructs the target of Quillen–Lichtenbaum.
- Calmes et al. Lemma 3.2.4: Provides the descent target for the duality action.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Tony Feng, Søren Galatius and Akshay Venkatesh, The Galois action on symplectic K-theory](https://math.berkeley.edu/~fengt/Galois_action_on_KSp.pdf), §2.6.1 and Remark 2.8, pp.11–12. Locator excerpt: “hyperdescent spectral sequence”. Odd-prime Bott inversion, Thomason descent, Adams operations and arithmetic transfer comparison in the source’s stated range.

Source: [Baptiste Calmès, Emanuele Dotto, Yonatan Harpaz, Fabian Hebestreit, Markus Land, Kristian Moi, Denis Nardin, Thomas Nikolaus and Wolfgang Steimle, Hermitian K-theory for stable ∞-categories III: Grothendieck–Witt groups of rings](https://arxiv.org/pdf/2009.07225v4), Lemma 3.2.4 proof, pp.56–57 of arXiv v4. Locator excerpt: “3.2.4. Lemma.”. The étale sheaf computation and number-ring ℓ-adic descent used in the routed lemma.

Atlas planet: Étale K-theory.

#### Bott-inverted étale descent

Identifier: MotivicEtaleKTheory:M.7/bott-etale-descent. Kind: theorem.

For X=Spec F with finite ℓ-cohomological dimension and Thomason’s Tate–Tsen filtration hypothesis, or X=Spec O_(F,S)[1/ℓ] at odd ℓ, Bott-inverted K(X;Z/ℓ^r) agrees with the periodic étale target. The convergent descent sequence is E₂^(s,t)=H_et^s(X,Z/ℓ^r(t/2))⇒K^et_(t−s)(X;Z/ℓ^r), t even, s≥0, with d_r of bidegree (r,r−1).

Hypotheses and conventions: ℓ odd in the FGV Bott-telescope proof; for dyadic totally imaginary schemes use the separately requested Thomason version, not an odd-prime telescope without modification. Finite ℓ-cd is the convergence bound.

Proof/construction plan:

1. FGV Remark 2.8 constructs the intrinsic telescope of the Adams self-map on S/ℓ^r of degree 2ℓ^(r−1)(ℓ−1); if roots exist this agrees with inversion of the corresponding power of β.
2. Thomason’s étale descent identifies that telescope with the periodic hypercomplete sheaf. Postnikov hyperdescent gives the displayed pages, and finite cohomological dimension gives convergence.
3. The original general Thomason proof is not read; retain its field hypothesis and a precise source/proof gap rather than replacing “mild hypotheses” by all schemes.

Direct prerequisites: MotivicEtaleKTheory:M.7/finite-etale-k-theory, StableHomotopyKTheory:H.6/filtered-spectrum-spectral-sequence, ArithmeticGaloisDuality:R02.3.

Proposed declaration: TauCeti.MotivicEtale.bott_etale_descent.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Tony Feng, Søren Galatius and Akshay Venkatesh, The Galois action on symplectic K-theory](https://math.berkeley.edu/~fengt/Galois_action_on_KSp.pdf), Remark 2.8 and §2.6.1, pp.11–12. Locator excerpt: “Remark 2.8.”. Odd-prime Bott inversion, Thomason descent, Adams operations and arithmetic transfer comparison in the source’s stated range.

Atlas planet: Thomason étale descent.

#### Quillen–Lichtenbaum field range

Identifier: MotivicEtaleKTheory:M.7/quillen-lichtenbaum-field-range. Kind: theorem.

For a field F with ℓ invertible, finite d=cd_ℓ(F) and the preceding Thomason field hypothesis, K_n(F;Z/ℓ^r)→K^et_n(F;Z/ℓ^r) is an isomorphism for n≥d−1 and an injection for n=d−2, in nonnegative degrees. The ℓ-adic spectrum comparison in this range is obtained by derived inverse limits with the boundary range checked one degree higher.

Hypotheses and conventions: ℓ odd for the read FGV proof; r≥1; d finite; extension to every admissible dyadic field needs the specified Thomason proof.

Proof/construction plan:

1. Compare the actual motivic sequence and the étale descent sequence using Beilinson–Lichtenbaum. With cohomological degree s and weight j, the first potentially missing étale term is (s,j)=(d,d−1), of total degree d−2.
2. Use finite convergent filtrations and the page comparison to obtain the stated isomorphism/injection. Induct r through coefficient triangles, retaining connecting maps.
3. To pass to holim_r, compare both π_n and π_(n+1) systems and their Milnor lim¹ terms. Never identify completion with tensoring until finite generation is invoked.

Direct prerequisites: MotivicEtaleKTheory:M.7/beilinson-lichtenbaum, MotivicEtaleKTheory:M.6/motivic-spectral-sequence, MotivicEtaleKTheory:M.7/bott-etale-descent, StableHomotopyKTheory:H.6/milnor-sequence.

Proposed declaration: TauCeti.MotivicEtale.quillen_lichtenbaum_field_range.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Tony Feng, Søren Galatius and Akshay Venkatesh, The Galois action on symplectic K-theory](https://math.berkeley.edu/~fengt/Galois_action_on_KSp.pdf), §2.6.2 proof of Theorem 2.9, p.12. Locator excerpt: “Tate-Tsen filtration”. Odd-prime Bott inversion, Thomason descent, Adams operations and arithmetic transfer comparison in the source’s stated range.

Atlas planet: Quillen–Lichtenbaum theorem.

#### S-integer comparison range

Identifier: MotivicEtaleKTheory:M.7/s-integer-comparison-range. Kind: theorem.

For a number field F, finite S, and odd ℓ, set R=O_(F,S)[1/ℓ]. K_n(R;Z/ℓ^r)→K^et_n(R;Z/ℓ^r) is an isomorphism for n≥1 and an injection for n=0. The map K_n(O_(F,S))^∧_ℓ→K_n(R)^∧_ℓ is an isomorphism for n≥2; it is not asserted in degree one. At ℓ=2 the analogous finite-cd formulation requires F totally imaginary.

Hypotheses and conventions: r≥1; genuine derived ℓ-completion; finite residue-field K calculation and arithmetic cd=2 supplied by their owners.

Proof/construction plan:

1. Use the Dedekind motivic bridge and localization, comparing number fields of cd_ℓ=2 with finite residue fields of cd_ℓ=1.
2. Invert primes above ℓ using localization; their positive finite-coefficient K groups vanish in residue characteristic ℓ, leaving a degree-zero support contribution to K₁.
3. Pass to derived completion via the Milnor sequence. The totally imaginary dyadic branch is kept dependent on the unread Thomason version.

Direct prerequisites: MotivicEtaleKTheory:M.7/dedekind-motivic-comparison, MotivicEtaleKTheory:M.7/quillen-lichtenbaum-field-range, KTheoryFiniteLocalFields:L.1/finite-field-mod-m-groups, GeneralAlgebraicKTheory:K.3/abelian-localization-theorem, GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula, ArithmeticGaloisDuality:R02.3.

Proposed declaration: TauCeti.MotivicEtale.s_integer_comparison_range.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Tony Feng, Søren Galatius and Akshay Venkatesh, The Galois action on symplectic K-theory](https://math.berkeley.edu/~fengt/Galois_action_on_KSp.pdf), Theorem 2.9, Lemma 2.10 and their proofs, pp.12–13. Locator excerpt: “Lemma 2.10.”. Odd-prime Bott inversion, Thomason descent, Adams operations and arithmetic transfer comparison in the source’s stated range.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Theorem 8.2, pp.513–514. Locator excerpt: “Theorem 8.2.”. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

#### Arithmetic ℓ-adic comparison

Identifier: MotivicEtaleKTheory:M.7/arithmetic-adic-degrees. Kind: theorem.

For R=O_(F,S)[1/ℓ], ℓ odd (or ℓ=2 and F totally imaginary) and j≥2, π_(2j−1)(K(R)^∧_ℓ)≃H¹_cont(R,Z_ℓ(j)) and π_(2j−2)(K(R)^∧_ℓ)≃H²_cont(R,Z_ℓ(j)). Finite generation further identifies these completed homotopy groups with K_(2j−1)(R)⊗Z_ℓ and K_(2j−2)(R)⊗Z_ℓ. The same n≥2 outputs apply before inverting ℓ.

Hypotheses and conventions: Continuous cohomology uses derived inverse limit of μ_ℓ^r^⊗j; arithmetic H⁰ positive-twist invariants vanish; H^s=0 for s>2 in this coefficient regime.

Proof/construction plan:

1. Apply the comparison range and ℓ-adic descent. Only s=1,2 survive because H⁰(R,Z_ℓ(j))=0 for j>0 and cd=2; parity leaves exactly one term in each displayed degree.
2. Use finite generation of the two adjacent K groups to remove the completion Tor/Tate-module and lim¹ terms through H.6/completion-finite-type.
3. Retain j≥2: units, Picard and rank at K₀/K₁ require their separate low-degree calculations.

Direct prerequisites: MotivicEtaleKTheory:M.7/s-integer-comparison-range, StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence, StableHomotopyKTheory:H.6/completion-finite-type, ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers, MotivicEtaleKTheory:M.1, ArithmeticGaloisDuality:R02.3.

Proposed declaration: TauCeti.MotivicEtale.arithmetic_adic_degrees.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Theorem 8.2 proof, pp.513–514. Locator excerpt: “Theorem 8.2.”. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

Source: [Baptiste Calmès, Emanuele Dotto, Yonatan Harpaz, Fabian Hebestreit, Markus Land, Kristian Moi, Denis Nardin, Thomas Nikolaus and Wolfgang Steimle, Hermitian K-theory for stable ∞-categories III: Grothendieck–Witt groups of rings](https://arxiv.org/pdf/2009.07225v4), Lemma 3.2.4 proof, p.57. Locator excerpt: “3.2.4. Lemma.”. Explicitly identifies the two completed degrees and the vanishing of positive-twist H⁰.

Atlas planet: Arithmetic ℓ-adic comparison.

#### Étale Adams weights

Identifier: MotivicEtaleKTheory:M.7/etale-adams-weights. Kind: theorem.

For a prime-to-ℓ integer a, ψ^a acts on the finite periodic étale homotopy sheaf Z/ℓ^r(j) by a^j and therefore on every descent term by the same scalar. Dualization ψ^(−1) acts by (−1)^j. The comparison map intertwines these operations.

Hypotheses and conventions: Same finite coefficient and descent range; a is a unit modulo ℓ; operations with a divisible by ℓ are not asserted to preserve Bott inversion.

Proof/construction plan:

1. Apply Adams operations to the actual Bott telescope; since a is invertible modulo ℓ, Bott powers remain invertible.
2. Compute on the Bott generator and identify the Tate homotopy sheaves by rigidity; natural hyperdescent transports the scalar to the sequence.

Direct prerequisites: MotivicEtaleKTheory:M.7/bott-etale-descent, MotivicEtaleKTheory:M.6b/filtered-adams-operations.

Proposed declaration: TauCeti.MotivicEtale.etale_adams_weights.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Tony Feng, Søren Galatius and Akshay Venkatesh, The Galois action on symplectic K-theory](https://math.berkeley.edu/~fengt/Galois_action_on_KSp.pdf), §2.6.1 after equation (2.6), p.12. Locator excerpt: “Adams operations”. Odd-prime Bott inversion, Thomason descent, Adams operations and arithmetic transfer comparison in the source’s stated range.

#### Étale K-theory transfer comparison

Identifier: MotivicEtaleKTheory:M.7/etale-k-transfer. Kind: theorem.

For finite étale f:Y→X in the stated regular finite-cd setting, the genuine K-theory transfer and étale corestriction form a map of the Bott/étale descent sequences. Under the arithmetic single-term identifications, transfer on K_(2j−1)^∧_ℓ and K_(2j−2)^∧_ℓ is corestriction on H¹(Z_ℓ(j)) and H²(Z_ℓ(j)). A ramified Dedekind transfer requires the finite-perfect pushforward and supported purity comparison, and is not assumed to commute with duality without its different-line correction.

Hypotheses and conventions: Finite étale first; for number-field transfer localize every ramified prime in S. Projection formula and Tate twists use one arithmetic Frobenius convention.

Proof/construction plan:

1. Use the transfer map of the hypercomplete K sheaf and the finite étale trace on its homotopy sheaves; compare Postnikov towers before taking sections.
2. FGV’s transfer proof cites Blumberg–Mandell §10; the original coherent transfer descent proof is an explicit source gap.
3. For ramified ring extensions dualization changes by the relative dualizing/different line; FGV uses a principal different and a specified generator in its cyclotomic example.

Direct prerequisites: MotivicEtaleKTheory:M.7/bott-etale-descent, MotivicEtaleKTheory:M.7/arithmetic-adic-degrees, SchemeKTheoryOperations:S.6/finite-etale-transfer-adams, GeneralAlgebraicKTheory:K.3/abelian-localization-theorem, GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula, ArithmeticGaloisDuality:R02.2.

Proposed declaration: TauCeti.MotivicEtale.etale_k_transfer.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Tony Feng, Søren Galatius and Akshay Venkatesh, The Galois action on symplectic K-theory](https://math.berkeley.edu/~fengt/Galois_action_on_KSp.pdf), Transfer compatibility proof immediately before §2.8, pp.16–17. Locator excerpt: “Section 10 of [BM15]”. Odd-prime Bott inversion, Thomason descent, Adams operations and arithmetic transfer comparison in the source’s stated range.

#### Number-ring duality sign

Identifier: MotivicEtaleKTheory:M.7/number-ring-duality-sign. Kind: theorem.

For O a ring of S-integers in a number field and n≥2, the C₂-actions on K induced by the symmetric Poincaré structures Q^s and Q^s_− on perfect complexes both act as multiplication by (−1)^n on K_(2n−1)(O)[1/2] and K_(2n−2)(O)[1/2]. This plans only the routed Lemma 3.2.4, not general hermitian K-theory.

Hypotheses and conventions: O as stated; inversion of 2; underlying dualizing equivalences for the two Poincaré structures coincide.

Proof/construction plan:

1. Both structures have the same underlying duality; reduce to Q^s. Arithmetic finite generation detects equality on all odd-prime completions.
2. Localize at ℓ, apply the arithmetic ℓ-adic degree comparison and ψ^(−1) equivariance. cd_ℓ=2 and positive-twist H⁰=0 leave H¹/H² of twist n, on which duality is (−1)^n.
3. Descend the detected equality to the finitely generated Z[1/2]-module; do not confuse the displayed completion with the integral group.

Direct prerequisites: MotivicEtaleKTheory:M.7/arithmetic-adic-degrees, MotivicEtaleKTheory:M.7/etale-adams-weights, ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers, GeneralAlgebraicKTheory:K.2.

Proposed declaration: TauCeti.MotivicEtale.number_ring_duality_sign.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Baptiste Calmès, Emanuele Dotto, Yonatan Harpaz, Fabian Hebestreit, Markus Land, Kristian Moi, Denis Nardin, Thomas Nikolaus and Wolfgang Steimle, Hermitian K-theory for stable ∞-categories III: Grothendieck–Witt groups of rings](https://arxiv.org/pdf/2009.07225v4), Lemma 3.2.4 and proof, pp.56–57 arXiv:2009.07225v4. Locator excerpt: “3.2.4. Lemma.”. Exact routed assertion and proof; original source’s completed notation is restored in the sketch.

#### Suslin real comparison

Identifier: MotivicEtaleKTheory:M.7/suslin-real-comparison. Kind: theorem.

For every m≥1 and n≥1, the comparison from algebraic to topological real K-theory gives K_n(R;Z/m)≃π_n(BO;Z/m). This statement precedes all dyadic real-place calculations and uses the real BO/KO Bott-periodic carrier supplied by RefinedTraceMethods.

Hypotheses and conventions: R is the real numbers; finite coefficients are Moore homotopy coefficients, not π_n(BO)⊗Z/m; degree zero handled separately by rank.

Proof/construction plan:

1. Use Gabber rigidity on the universal henselized cosimplicial GL coordinate ring to prove the finite-homology vanishing of sufficiently small Lie-group neighbourhoods (K-book Lemmas 3.5–3.6).
2. Apply homological stability and the Milnor Lie-group comparison to show GL(R)^δ→GL(R)^top is a mod-m homology equivalence after stabilization (Lemmas 3.7–3.8).
3. Pass through the simply connected plus models BSL⁺ and BSO to finite homotopy; degrees 1 and 2 are the explicit classical calculation. The original neighbourhood/stability input is recorded as a proof gap.

Direct prerequisites: KTheoryFiniteLocalFields:L.2/gabber-rigidity, GeneralAlgebraicKTheory:K.2, RefinedTraceMethods:RT.4.

Proposed declaration: TauCeti.MotivicEtale.suslin_real_comparison.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Theorem 3.1(c) and proof, pp.475–479. Locator excerpt: “Theorem 3.1.”. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

Atlas planet: Suslin real comparison.

#### Real mod-2 motivic sequence

Identifier: MotivicEtaleKTheory:M.7/real-mod-two-sequence. Kind: theorem.

For R, the mod-2 motivic sequence has E₂^(a,b)=F₂ in b≤a≤0. Its d₂ maps with nonzero source in columns a≡1,2 mod 4 are isomorphisms, and it degenerates at E₃. For n≥1, K_n(R;Z/2) has period-eight orders 2,4,2,2,1,1,1,2 for n≡1,2,3,4,5,6,7,0 respectively; K_(8k+2)(R;Z/2)=Z/4 is the nontrivial extension.

Hypotheses and conventions: M.4 supplies the real motivic page, H.6 supplies finite coefficient homotopy, and RT.4 supplies real Bott periodicity. Use integral spectral-sequence module action, not a nonexistent natural mod-2 K-ring product.

Proof/construction plan:

1. Suslin plus real Bott periodicity determines the abutment. Write page generators η^sβ_j. The forced nonzero d₂(β₂)=η³ and d₂(β₃)=η³β₁ propagate by the integral η action and periodicity.
2. Eliminate the displayed columns; use the real KO finite-coefficient calculation to determine the nonsplit Z/4 extension. Associated graded F₂⊕F₂ alone would be insufficient.

Direct prerequisites: MotivicEtaleKTheory:M.7/suslin-real-comparison, MotivicEtaleKTheory:M.6/motivic-spectral-sequence, MotivicEtaleKTheory:M.6b/filtered-motivic-products, MotivicEtaleKTheory:M.4, RefinedTraceMethods:RT.4.

Proposed declaration: TauCeti.MotivicEtale.real_mod_two_sequence.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Theorem 9.1, Table 9.1.1 and proof, pp.517–518. Locator excerpt: “Theorem 9.1.”. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

#### Real-place correction sequence

Identifier: MotivicEtaleKTheory:M.7/real-place-correction. Kind: construction.

For R=O_(F,S) with 1/2∈R and r₁ real embeddings, form the map of motivic K coefficient towers K(R;Z/2^∞)→⊕_σK(R;Z/2^∞). On cohomology write α_s(j):H^s(R,Q₂/Z₂(j))→⊕_σH^s(R,Q₂/Z₂(j)) and H̃¹=ker α₁. Its fibre long exact sequence is the corrected real-place comparison; retain the connecting maps and the induced filtration extensions.

Hypotheses and conventions: Arithmetic real-place Tate/Poitou–Tate comparison from M.2/D7; ordinary real Galois cohomology has infinite cd₂, so it is not the finite-cd odd-prime argument. Finite direct sum of real spectra.

Proof/construction plan:

1. Apply all real embeddings to actual spectra and take their fibre; generic homotopy exactness gives the correction sequence.
2. On the motivic E₂ page the map is α_(a−b)(−b). Arithmetic duality identifies α_s for s≥3 and the special s=2 range.
3. Compare differentials with the real calculation and leave the H⁰/H¹ diagonals and connecting maps visible.

Direct prerequisites: MotivicEtaleKTheory:M.7/real-mod-two-sequence, MotivicEtaleKTheory:M.2, ArithmeticGaloisDuality:D7, StableHomotopyKTheory:H.6/qp-zp-coefficients.

Proposed declaration: TauCeti.MotivicEtale.realCorrection.

Planning API:

- **TauCeti.MotivicEtale.realCorrection_triangle** (structure): The correction spectrum sits in the defining fibre triangle and its long exact homotopy sequence.
- **TauCeti.MotivicEtale.realCorrection_pageMap** (compatibility): The page map is α_(a−b)(−b), with the stated ordinary/Tate real-place conventions.
- **TauCeti.MotivicEtale.realCorrection_kernel** (characterisation): The critical cohomology term H̃¹ is precisely ker α₁, without a chosen complement.

Discriminating examples:

- **realCorrection_test_imaginary** (degenerate): If r₁=0 the real target is zero and the correction fibre is K(R;Z/2∞).
- **realCorrection_test_real_higher** (computation): For s≥3, α_s is an isomorphism in the Tate/Poitou–Tate range used by the source.
- **realCorrection_test_extension** (non-example): At n≡5 mod 8 a quotient and kernel do not specify a direct-sum decomposition; the extension class must be retained.

Consumers:

- ArithmeticKTheory:N.5: Supplies corrected dyadic sequences and extension data.
- MotivicEtaleKTheory:M.7: Replaces the finite-cd comparison at real places.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI formulas (9.2), Lemma 9.3 and Theorem 9.4 proof, pp.518–519. Locator excerpt: “Theorem 9.4.”. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

#### Dyadic S-integer extensions

Identifier: MotivicEtaleKTheory:M.7/dyadic-s-integer-extensions. Kind: theorem.

For F with r₁>0 real places and R=O_(F,S) containing 1/2, K_n(R;Q₂/Z₂) has the following mod-eight description: n=8k: Z/w_(4k)(F){2}; 8k+1: H¹(R,Q₂/Z₂(4k+1)); 8k+2: Z/2; 8k+3: H¹(R,Q₂/Z₂(4k+2)); 8k+4: Z/(2w_(4k+2)(F){2})⊕(Z/2)^(r₁−1); 8k+5: an extension 0→(Z/2)^(r₁−1)→K_n→H¹(R,Q₂/Z₂(4k+3))→0; 8k+6:0; 8k+7:H̃¹(R,Q₂/Z₂(4k+4)). In the n=0 slot H⁰(R,Q₂/Z₂(0))=Q₂/Z₂ replaces the finite positive-weight notation. No splitting is asserted in the 8k+5 case.

Hypotheses and conventions: n≥0; k≥0; w_j(F){2}=|H⁰(F,Q₂/Z₂(j))| for j>0; modified real and coefficient conventions as in the correction construction.

Proof/construction plan:

1. Use the map to the r₁ real sequences. Tate–Poitou duality identifies the higher diagonal maps, so the forced real differentials determine E₃=E∞ except the critical low diagonals.
2. At 8k+4 the extension is nontrivial by comparison with R, producing the factor 2 in the cyclic summand. At 8k+5 retain the abelian-group extension.
3. Strong approximation makes α₁(4k+4) surjective after enlarging S; finite even K groups and localization make the relevant K coefficient group independent of S, proving the 8k+6 zero case.

Direct prerequisites: MotivicEtaleKTheory:M.7/real-place-correction, MotivicEtaleKTheory:M.7/real-mod-two-sequence, ArithmeticGaloisDuality:R02.4, ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers.

Proposed declaration: TauCeti.MotivicEtale.dyadic_s_integer_extensions.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI Theorem 9.4 and its proof, pp.519–520. Locator excerpt: “Theorem 9.4.”. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

### M.8

#### Finite étale Chern maps

Identifier: MotivicEtaleKTheory:M.8/finite-etale-chern. Kind: construction.

For a regular scheme X with m invertible, i≥1 and n≥1, construct the additive higher Chern map c_(i,n):K_n(X;Z/m)→H_et^(2i−n)(X,μ_m^⊗i). It is defined from universal equivariant Chern classes, independently of p-adic Hodge theory and Borel regulators. The n=0 ordinary Chern classes obey Whitney sum rather than additivity. On the Milnor diagonal c_(i,i) sends a pure symbol to (−1)^(i−1)(i−1)! times the cup of its Kummer classes.

Hypotheses and conventions: Use schemes admitted by the universal projective-bundle and twisted-duality constructions; m≥2 is invertible on X; no division by a factorial in Z/m. Finite-coefficient products are only used for m odd or 8 dividing m, as in the source.

Proof/construction plan:

1. Construct the universal Chern classes on B•GL from projective-bundle classes and the Whitney formula. Use the primitive homology class and plus-construction suspension of V §§11.5–11.8 to obtain additive positive-degree maps with Moore coefficients.
2. For finite coefficient classes retain the source’s Bockstein construction and universal product rule. In particular c_(1,2)(β)=ζ and c_(1,2) kills the image K₂(X)/m.
3. The ordinary higher Chern maps themselves are not ring maps; the diagonal factorial and sign are retained. This is the early export requested by HB.1/HB.2/D2 and the verified routing RT-AREA-ktheory-2/18.

Direct prerequisites: GeneralAlgebraicKTheory:K.2, SchemeKTheoryOperations:S.7/gamma-chern-character, MotivicEtaleKTheory:M.1, MotivicEtaleKTheory:M.4, StableHomotopyKTheory:H.6/bockstein-long-exact-sequence.

Proposed declaration: TauCeti.MotivicEtale.finiteChern.

Planning API:

- **TauCeti.MotivicEtale.finiteChern_natural** (compatibility): Pullback commutes with c_(i,n) whenever the K/cohomology pullbacks are defined.
- **TauCeti.MotivicEtale.finiteChern_bockstein** (compatibility): For i=1,n=2, c_(1,2) is the coefficient boundary applied to determinant, as in the displayed Bockstein diagram.
- **TauCeti.MotivicEtale.finiteChern_milnor** (simp): On a degree-i Milnor symbol, c_(i,i)=(−1)^(i−1)(i−1)! times the cup-Kummer symbol.

Discriminating examples:

- **finiteChern_test_unit** (computation): c_(1,1)(u) is the Kummer class of det(u).
- **finiteChern_test_bott** (compatibility): For a primitive m-th root ζ and its Bott lift β, c_(1,2)(β)=ζ, while c_(1,2)(image K₂/m)=0.
- **finiteChern_test_factorial** (non-example): c_(2,2) on a two-unit symbol is minus the cup-Kummer symbol; treating every c_(i,n) as a multiplicative character fails this sign test.

Consumers:

- HabiroNumberFields:HB.1 and HB.2: Provides early finite étale Chern inputs, without waiting for Hermitian/Borel comparisons.
- PadicHodgeRegulators:D.2: Consumes the finite-coefficient maps and the tower-compatible realization, not an analytic regulator.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V §§11.5–11.8 and Example 11.10, Lemma 11.10.1, pp.452–457. Locator excerpt: “Lemma 11.10.1.”. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

Atlas planet: Finite étale Chern maps.

#### Motivic Chern character

Identifier: MotivicEtaleKTheory:M.8/motivic-chern-character. Kind: construction.

For smooth quasi-projective X over a field, construct integral c_(i,n):K_n(X)→H_M^(2i−n)(X,Z(i)) for n≥1 and the rational additive character ch_(i,n):K_n(X)⊗Q→H_M^(2i−n)(X,Q(i)). Its positive-degree normalization is ch_(i,n)=(−1)^(i−1)c_(i,n)/(i−1)!; at n=0 it is the Newton polynomial in ordinary Chern classes divided by i!. The total character respects products and rational Adams weights and identifies the rational weight-j summand from M.6.

Hypotheses and conventions: i≥1 for positive-degree displayed normalization; weight zero at K₀ is rank; smooth quasi-projective scheme class from the cited theorem.

Proof/construction plan:

1. Construct integral universal classes by the projective-bundle relation of Theorem 11.11, with Whitney and splitting-principle proof. Import the existing γ-graded character for K₀ from S.7 rather than redefine γ operations.
2. Rationalize the universal primitive classes with the displayed normalization. Compare the resulting rational operation with the layer equivalence and Adams eigenspaces in M.6; product compatibility uses the actual filtered product.
3. The motivic class is integral but the normalized character generally is rational. No inverse factorial is asserted integrally or at a prime dividing that factorial.

Direct prerequisites: MotivicEtaleKTheory:M.6/rational-weight-comparison, MotivicEtaleKTheory:M.6b/filtered-motivic-products, MotivicEtaleKTheory:M.4, SchemeKTheoryOperations:S.7/gamma-chern-character, SchemeKTheoryOperations:S.7/grothendieck-riemann-roch.

Proposed declaration: TauCeti.MotivicEtale.motivicChern.

Planning API:

- **TauCeti.MotivicEtale.motivicChern_positive** (simp): For n>0, (i−1)! ch_(i,n)=(−1)^(i−1)c_(i,n) after rationalization.
- **TauCeti.MotivicEtale.motivicChern_product** (compatibility): ch_i(xy)=Σ_(a+b=i) ch_a(x)∪ch_b(y), with degrees 2a−m and 2b−n adding to 2i−m−n.
- **TauCeti.MotivicEtale.motivicChern_weight** (characterisation): On K_m(X)_Q^(j), ch_j is the M.6 weight-j comparison and ch_i=0 for i≠j.

Discriminating examples:

- **motivicChern_test_rank** (degenerate): At m=i=0, ch₀ is rank.
- **motivicChern_test_line** (computation): For a line bundle L, ch_i([L])=c₁(L)^i/i!.
- **motivicChern_test_milnor** (compatibility): The normalized degree-i character sends a Milnor symbol to itself in H_M^i(F,Q(i)); the integral Chern class retains (−1)^(i−1)(i−1)!.

Consumers:

- MotivicEtaleKTheory:M.8: Supplies the regulator source and the rational weight projection.
- PeriodsAndSpecialValues:PS.0: Provides rational motivic classes with explicit normalization.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V Theorem 11.11, Examples 11.12, Lemma 11.13 and its proof, pp.457–459. Locator excerpt: “Theorem 11.11.”. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

Atlas planet: Motivic Chern character.

#### Supported cycle Chern character

Identifier: MotivicEtaleKTheory:M.8/supported-cycle-character. Kind: theorem.

Let 𝒳 be regular, proper and flat over O_K with smooth generic fibre, and let ℓ be invertible in its residue characteristic. The supported Gillet cycle-character map cl gives F^dK₀^Z(𝒳)→H_Z^(2d)(𝒳,Q_ℓ(d)); on the generic fibre X the map agrees with the refined étale cycle class of a codimension-d cycle, by Lemma B.6. The lemma is not asserted for arbitrary vertical cycles on 𝒳. Supported products land in Z₁∩Z₂ and weight d₁+d₂, with the refined intersection/Gysin compatibility. This is the exact Appendix-B input of Li–Liu, not an unnormalized ordinary c_d.

Hypotheses and conventions: Admit the support intersections and refined Gysin morphisms of the source; rational coefficients for γ-filtration multiplication; no universal singular-scheme Riemann–Roch.

Proof/construction plan:

1. Import the support K₀ filtration and finite-perfect operations from S.3/S.7. Construct the supported character using Gillet’s twisted duality theory and Li–Liu’s S_Z pairings.
2. Use Li–Liu Lemma B.6 on the generic fibre to identify cycle realization; footnote 22 proves the support intersection product via S_(Z₁∩Z₂)=S_Z₁∧S_Z₂ and ΩBQP multiplication.
3. Gillet Definition 2.34(ii), Theorem 3.1 and §2.35 and Gillet–Soulé Proposition 5.5 remain precise unread-source proof gaps, not inferred from the Li–Liu application.

Direct prerequisites: MotivicEtaleKTheory:M.8/motivic-chern-character, SchemeKTheoryOperations:S.3, SchemeKTheoryOperations:S.7/scheme-gamma-filtration, SchemeAndStackFoundations:SF.5.

Proposed declaration: TauCeti.MotivicEtale.supported_cycle_character.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Chao Li and Yifeng Liu, Chow groups and L-derivatives of automorphic motives for unitary groups](https://www.math.columbia.edu/~chaoli/AIPF.pdf), Appendix B, pp.57–62, Lemma B.6 and footnote 22. Locator excerpt: “Lemma B.6.”. Routed supported character and refined cycle-class application, including the supported product explanation.

#### Deligne regulator

Identifier: MotivicEtaleKTheory:M.8/deligne-regulator. Kind: construction.

For smooth projective X/C, use the genuine Deligne complex Z(j)_D=[Z(j)→O_X→Ω_X¹→⋯→Ω_X^(j−1)] with Z(j)=(2πi)^j Z in degree zero. Realization of the motivic class defines c_D:K_m(X)→H_D^(2j−m)(X,Z(j)); composing the normalized rational character gives r_D:K_m(X)⊗Q→H_D^(2j−m)(X,Q(j)), and its real version. For nonproper X use the logarithmic mixed-Hodge Deligne–Beilinson complex supplied by the Hodge owner, not ordinary analytic Deligne cohomology.

Hypotheses and conventions: j≥1; m≥0; the displayed simple complex applies to proper smooth X; open varieties require a good compactification and the logarithmic/mixed-Hodge comparison.

Proof/construction plan:

1. Import Deligne/mixed-Hodge complexes and their product/real structures; construct the multiplicative motivic realization before taking cohomology.
2. Compose the integral or rational motivic classes with this realization, keeping the 2πi lattice and the distinction between integral c_D and rational r_D.
3. For a good compactification j:X→X̄ with normal-crossings boundary D, use cone(Rj_*Λ(j)⊕F^jΩ_X̄(log D)→j_*Ω_X)[−1], map (r,f)↦r−f. Independence of compactification and the general motivic realization require the Hodge/MC.2 supplier and unread Huber proof. Burgos §10.1 supplies the cone and point calculation.

Direct prerequisites: MotivicEtaleKTheory:M.8/motivic-chern-character, tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne, MotivesAndAlgebraicCycles:MC.2.

Proposed declaration: TauCeti.MotivicEtale.deligneRegulator.

Planning API:

- **TauCeti.MotivicEtale.deligneRegulator_natural** (compatibility): Pullback of admitted smooth varieties commutes with r_D.
- **TauCeti.MotivicEtale.deligneRegulator_product** (compatibility): The total rational r_D carries K products to Deligne cup products with the same weight/degree sum as ch.
- **TauCeti.MotivicEtale.deligneRegulator_real** (compatibility): For X over R, descent is through conjugation on the Tate lattice and forms; conjugation acts on R(j) by (−1)^j.

Discriminating examples:

- **deligneRegulator_test_point** (computation): For Spec C and j≥1, H_D¹(C,R(j))=C/(2πi)^jR.
- **deligneRegulator_test_integral_point** (non-example): H_D¹(C,Z(j))=C/(2πi)^jZ; replacing this by the real quotient destroys the integral lattice.
- **deligneRegulator_test_line** (compatibility): For a line bundle on a smooth projective curve, c_D maps under Betti realization to the ordinary integral first Chern class.

Consumers:

- BorelRegulators:R.7: Receives the independent early universal Deligne character.
- PeriodsAndSpecialValues:PS.0: Receives normalized real/rational regulator maps before analytic comparisons.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V Example 11.12(3), p.458. Locator excerpt: “Deligne-Beilinson.”. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

Source: [José Ignacio Burgos Gil, The Regulators of Beilinson and Borel](https://www.icmat.es/miembros/burgos/files/brbr.pdf), §10.1, Definition 10.1, equations (10.2)–(10.5), Definitions 10.3 and Examples 10.4–10.5, pp.89–92. Locator excerpt: “Definition 10.1.”. Gives the actual logarithmic Deligne–Beilinson cone and its real descent; not just an ordinary analytic complex for open X.

Atlas planet: Deligne regulator.

#### Number-field Deligne normalization

Identifier: MotivicEtaleKTheory:M.8/number-field-deligne-normalization. Kind: theorem.

For a number field F and j≥2, identify H_D¹(F⊗R,R(j)) with (∏_(σ:F→C)R(j−1))^conjugation using C/R(j)≃R(j−1) and the conjugate pairing. The universal rational K_(2j−1) character is the normalized suspension of the universal topological Chern character, ch_j=(2πi)^j pr_j/j! before suspension. The simplicial first-infinitesimal-diagonal realization, Adams weight, products and embeddings commute with this map. This export has no R.7 or D2 prerequisite.

Hypotheses and conventions: pr_j is the primitive Newton class with the stated topological normalization; after positive-degree suspension the relation is the (j−1)! normalization of the preceding node. j≥2; no Borel analytic normalization assumed.

Proof/construction plan:

1. Use Burgos (10.2) and Examples 10.4–10.5 to identify point Deligne cohomology and take conjugation invariants across all embeddings.
2. The universal class is the unique Deligne lift of ch_j under (10.10). Apply simplicial evaluation ev to B•GL(C)^δ and the plus-space Hurewicz pairing of Definition 10.7, then the embedding product of Definition 10.8. Remark 4.25 fixes suspension and the (j−1)! factor.
3. For the infinitesimal-diagonal interface, use the squared identity ideal J in §10.4, normalize its cosimplicial structure, and import the general differential/Weil algebra identifications from §§8.1–8.3. The original general Weil-algebra comparison proof remains with its supplier; the displayed real/complex diagram pins the map. This construction precedes the Borel factor-two theorem.

Direct prerequisites: MotivicEtaleKTheory:M.8/deligne-regulator, MotivicEtaleKTheory:M.8/motivic-chern-character, GeneralAlgebraicKTheory:K.2, tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne.

Proposed declaration: TauCeti.MotivicEtale.number_field_deligne_normalization.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [José Ignacio Burgos Gil, The Regulators of Beilinson and Borel](https://www.icmat.es/miembros/burgos/files/brbr.pdf), §4.4, Remark 4.25; §10.1 Examples 10.4–10.5; §§10.2–10.4 through the diagram on p.97. Locator excerpt: “Definition 10.7.”. Direct early definition from the universal Deligne class, point quotient, simplicial evaluation and Hurewicz map; no Borel comparison used.

#### Chern realization functoriality

Identifier: MotivicEtaleKTheory:M.8/chern-functoriality. Kind: theorem.

The normalized motivic, finite étale and Deligne maps commute with admitted pullbacks and products. For a smooth codimension-c immersion they intertwine localization residues with the boundary H^(a)(U,B(j))→H^(a−2c+1)(Z,B(j−c)); finite étale transfers correspond to cohomological traces without a Todd factor. General proper pushforward uses the existing GRR formula with its Todd correction. Rational Adams ψ^a on weight j agrees with multiplication by a^j.

Hypotheses and conventions: Use only existing support/purity and coherent realization morphisms; finite coefficients retain the product regime m odd or 8|m; Deligne uses the admitted scheme class.

Proof/construction plan:

1. Construct the maps at the support-spectrum/cohomology-complex level before passing to groups, so naturality and localization boundaries are visible.
2. Use the supported character and S.7 GRR to distinguish finite étale trace from general pushforward. Check the degree shift and Tate twist through the localization triangle.
3. The full coherent boundary comparison is requested from M.4/MC.2/SF.5; it is not inferred merely from naturality on group homomorphisms.

Direct prerequisites: MotivicEtaleKTheory:M.8/finite-etale-chern, MotivicEtaleKTheory:M.8/motivic-chern-character, MotivicEtaleKTheory:M.8/deligne-regulator, MotivicEtaleKTheory:M.8/supported-cycle-character, MotivicEtaleKTheory:M.7/etale-k-transfer, SchemeKTheoryOperations:S.7/grothendieck-riemann-roch, MotivicEtaleKTheory:M.4, MotivesAndAlgebraicCycles:MC.2, SchemeAndStackFoundations:SF.5.

Proposed declaration: TauCeti.MotivicEtale.chern_functoriality.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V Theorem 11.11 proof, pp.458–459. Locator excerpt: “Theorem 11.11.”. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

Source: [Chao Li and Yifeng Liu, Chow groups and L-derivatives of automorphic motives for unitary groups](https://www.math.columbia.edu/~chaoli/AIPF.pdf), Appendix B, footnote 22. Locator excerpt: “the product C1”. Supported pairings supply the exact product support; general proper comparison remains with the GRR owner.

#### Integral motivic structures

Identifier: MotivicEtaleKTheory:M.8/integral-motivic-structures. Kind: construction.

For a specified regular arithmetic model 𝒳 with generic fibre X, retain H_Z=H_M^a(𝒳,Z(j)), the subgroup I=im(H_Z→H_M^a(X,Z(j))), its torsion-free quotient L=I/I_tors, and the rational integral part I_Q=im(H_Z⊗Q→H_M^a(X,Q(j))). A regulator lattice is the image of L in a real or ℓ-adic realization after proving finite generation and injectivity in the specified case. No integral part is defined as the entire rational space by default.

Hypotheses and conventions: Model 𝒳 and the restriction/realization map are part of the data; lattice claims require finite generation and torsion-kernel/injectivity facts. Number-field positive-weight cases import arithmetic finiteness and Borel rank; arbitrary motives do not.

Proof/construction plan:

1. Use the existing motivic groups, restriction, torsion subgroup and rationalization to form image, quotient and scalar-extension image.
2. Separate the integral group, torsion-free abelian group and rational vector-space image. Apply the case-specific finiteness/rank theorem only when constructing a lattice.
3. Regulators kill torsion in characteristic-zero vector spaces; this does not identify two integral groups that differ by torsion. Model dependence is preserved until localization proves independence.

Direct prerequisites: MotivicEtaleKTheory:M.4, MotivicEtaleKTheory:M.8/chern-functoriality, ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers, BorelRegulators:R.4/regulator-lattice, mathlib:CommGroup.torsion, mathlib:QuotientGroup.mk'.

Proposed declaration: TauCeti.MotivicEtale.integralStructures.

Planning API:

- **TauCeti.MotivicEtale.integralStructures_image** (characterisation): I is the image of model restriction and I_Q is its scalar-extension image in rational generic-fibre cohomology.
- **TauCeti.MotivicEtale.integralStructures_torsion** (characterisation): The map I→L has kernel exactly I_tors; a characteristic-zero regulator factors through L.
- **TauCeti.MotivicEtale.integralStructures_lattice** (compatibility): In the stated finite-generation and injectivity case, L is a free finite-rank Z-lattice in its rational span.

Discriminating examples:

- **integralStructures_test_torsion** (degenerate): If I=Z/m, then L=0 and I_Q=0 although I is nonzero for m>1.
- **integralStructures_test_free** (computation): For I=Z^r embedded in Q^r, L=Z^r and I_Q=Q^r.
- **integralStructures_test_index** (non-example): The images Z and 2Z in Q have the same rational integral part and different integral lattices; rational equality does not determine covolume.

Consumers:

- BorelRegulators:R.4: Provides the integral/torsion/rational dictionary for regulator lattices.
- PeriodsAndSpecialValues:PS.4: Provides the actual integral line entering determinant and period comparisons.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Kazuya Kato, Tamagawa Number Conjecture for zeta Values](https://arxiv.org/pdf/math/0304233v1), §2.1(a)–(d), pp.167–168. Locator excerpt: “K-groups (or motivic cohomology”. Tamagawa determinant and realization conventions; conjectural arithmetic assertions are not claimed proved.

Source: [Charles A. Weibel, The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI §8 Theorems 8.2–8.3, pp.513–514. Locator excerpt: “Theorem 8.2.”. The cited construction or theorem fixes the coefficient, degree and normalization conventions.

Atlas planet: Integral motivic structures.

#### Tate and elliptic realization dictionary

Identifier: MotivicEtaleKTheory:M.8/tate-elliptic-realization-dictionary. Kind: application.

Use the motive and realization exports for Q(j) and h¹(E)(j) of an elliptic curve E over a number field F, with cohomological variance. At an unramified good place v, q=Nv, geometric Frobenius on Q_ℓ(j) has Euler polynomial 1−q^(−j)T, and on H¹_et(Ē,Q_ℓ)(j) it has 1−a_v q^(−j)T+q^(1−2j)T², where a_v=q+1−|E(k_v)|. Integral Tate lattices and elliptic ℓ-adic lattices, Betti/de Rham realizations and their comparison maps are imported; dual homological T_ℓE has the corresponding dual Frobenius convention.

Hypotheses and conventions: ℓ≠residue characteristic, good reduction for E; specify geometric Frobenius throughout this node; j integer. Bad-place factors require the existing inertia/local-comparison owner and are not replaced by the good-place polynomial.

Proof/construction plan:

1. Import Tate and pointed-curve projectors/realizations from MC.1–MC.2; specialize them, rather than reconstruct motives or elliptic curves.
2. Use finite-field point counts and smooth proper base change to compute geometric Frobenius on H¹; twist multiplies eigenvalues by q^(−j).
3. Export this realization dictionary to the Euler-system and determinant nodes. Never infer a Chow equality or a numerical-motive realization from equality of ℓ-adic characteristic polynomials.

Direct prerequisites: MotivesAndAlgebraicCycles:MC.1, MotivesAndAlgebraicCycles:MC.2, tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68, ClassicalAdicEtaleCohomology:H3, MotivicEtaleKTheory:M.1, tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1, tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv.

Proposed declaration: TauCeti.MotivicEtale.tate_elliptic_realization_dictionary.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Kazuya Kato, Tamagawa Number Conjecture for zeta Values](https://arxiv.org/pdf/math/0304233v1), §2.1, example following (2.1.5), pp.167–168. Locator excerpt: “motives”. Tamagawa determinant and realization conventions; conjectural arithmetic assertions are not claimed proved.

#### Norm-compatible regulator families

Identifier: MotivicEtaleKTheory:M.8/norm-compatible-regulator-families. Kind: construction.

Given a directed tower of admitted finite extensions F_n/F and finite coefficient levels with actual compatible K-theory norm maps, form the subgroup of ∏_n K_m(O_(F_n,S_n);Z/p^n) of families x_n satisfying coefficient reduction followed by norm equals x_n. The levelwise étale Chern/regulator maps induce a map to the corresponding continuous-cohomology inverse limit, with corestriction on the cohomology side. For cyclotomic units u_n and compatible roots ζ_n, Soulé’s x_n=N_n(u_n β_n^(i−1)) gives the explicit K_(2i−1) family for i≥1.

Hypotheses and conventions: For the explicit Soulé product family p is odd, all ramified primes are included in S_n, and finite-coefficient products have the actual coherence supplied by H.6. Use the cofinal levels p^n outside {2,3,4,8}; for p=3 start at n≥2 and obtain level one by reduction. The norm/coefficient square is supplied by the generic K-transfer owner. Retain derived completion/lim¹ when interpreting a homotopy group of the inverse-limit spectrum.

Proof/construction plan:

1. Use the supplier inverse-limit/coefficient and transfer APIs; define the equalizer of the norm/reduction transition maps on the product of actual K groups.
2. Apply the finite Chern maps and the norm/corestriction square levelwise. Their compatibility produces the continuous-cohomology family.
3. For Soulé’s construction, the projection formula and β_(n+1) reducing to β_n reduce the norm identity to norm coherence of u_n. This is a specific family construction, not a theorem of existence of every desired Euler system. Construct powers on the cofinal admissible coefficient levels and use reduction to define the remaining levels, rather than assuming a coherent unital Moore product at every n.

Direct prerequisites: MotivicEtaleKTheory:M.8/finite-etale-chern, MotivicEtaleKTheory:M.7/etale-k-transfer, StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence, EulerSystemsCyclotomicMainConjecture:L0, StableHomotopyKTheory:H.6/moore-spectrum-multiplication.

Proposed declaration: TauCeti.MotivicEtale.normFamilies.

Planning API:

- **TauCeti.MotivicEtale.normFamilies_projection** (constructor): The level-n projection of a compatible family is x_n and satisfies norm(reduce x_(n+1))=x_n.
- **TauCeti.MotivicEtale.normFamilies_regulator** (compatibility): At every level the regulator of the family is the regulator of its level component, and transitions are corestrictions.
- **TauCeti.MotivicEtale.normFamilies_soule** (simp): The Soulé family in degree 2i−1 is N_n(u_n β_n^(i−1)), with c_(i,2i−1) retaining its higher-Chern normalization.

Discriminating examples:

- **normFamilies_test_constant** (degenerate): For the constant identity-transition tower A_n=A, compatible families identify with A.
- **normFamilies_test_degree** (computation): For i=1 the Soulé construction is the norm-compatible unit family in K₁; for i=2 its degree is K₃.
- **normFamilies_test_transfer** (compatibility): For an unramified finite extension the regulator transition square is the actual K norm versus cohomological corestriction; using restriction on both sides fails it.

Consumers:

- MotivicEtaleKTheory:M.8: Provides regulator images of concrete K-theory norm families.
- SelmerIwasawaCohomology:L4: Receives the cohomological family together with its norm relations.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Christophe Soulé, Éléments cyclotomiques en K-théorie](https://www.numdam.org/item/AST_1987__147-148__225_0.pdf), §4.1–§4.4, printed pp.238–240. Locator excerpt: “4.1.”. Explicit compatible-unit and Bott construction; its normalization and projection formula determine the K-degree.

Atlas planet: Norm-compatible regulator families.

#### Euler-factor regulator compatibility

Identifier: MotivicEtaleKTheory:M.8/euler-factor-regulator-compatibility. Kind: theorem.

If a K-theory family satisfies N_(Mv/M)(x_(Mv))=P_v(Fr_v^(−1))x_M for its actual coefficient/Adams Galois action and the declared local Euler polynomial, its étale regulator image satisfies the identical corestriction relation. The Tate and elliptic polynomials are those of the realization dictionary; a plain norm-compatible family is only the case P_v=1 and does not automatically become an Euler system.

Hypotheses and conventions: The Euler relation is supplied as a hypothesis from the existing Euler-system owner. Geometric/arithmetic Frobenius and dualization conventions must be reconciled explicitly; the inverse in the relation is not silently changed.

Proof/construction plan:

1. Use the finite-level norm/regulator square and the Galois/Adams equivariance of the realization maps; pass the polynomial through the map term by term.
2. Pass to inverse limits only using the specified transition system. Package the exported relation for the L4 Euler-system construction, without redefining its generic notion.

Direct prerequisites: MotivicEtaleKTheory:M.8/norm-compatible-regulator-families, MotivicEtaleKTheory:M.8/tate-elliptic-realization-dictionary, MotivicEtaleKTheory:M.8/chern-functoriality, MotivicEtaleKTheory:M.7/etale-adams-weights, SelmerIwasawaCohomology:L4.

Proposed declaration: TauCeti.MotivicEtale.euler_factor_regulator_compatibility.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Kazuya Kato, Tamagawa Number Conjecture for zeta Values](https://arxiv.org/pdf/math/0304233v1), §2.1, after (2.1.5), p.167. Locator excerpt: “Euler systems”. Tamagawa determinant and realization conventions; conjectural arithmetic assertions are not claimed proved.

Source: [Christophe Soulé, Éléments cyclotomiques en K-théorie](https://www.numdam.org/item/AST_1987__147-148__225_0.pdf), §4.1–§4.4, pp.238–240. Locator excerpt: “4.1.”. The explicit unit/Bott norm family supplies the concrete compatibility test, not arbitrary elliptic Euler-system existence.

#### Selmer regulator factorization

Identifier: MotivicEtaleKTheory:M.8/selmer-regulator-factorization. Kind: comparison.

For a chosen Tate or elliptic realization V with integral lattice T, a global regulator class in H¹(G_(F,S),V) factors through the existing Selmer group exactly after proving its localizations satisfy the selected local conditions. At v∤p use the unramified condition when the class extends over O_v; at v|p the Bloch–Kato finite/geometric condition is imposed in the p-adic Hodge regime admitted by D2–D5. Give the induced map of the existing Selmer mapping-fibre complexes before using determinant functoriality.

Hypotheses and conventions: The local comparison theorem and local conditions are supplied, not inferred merely from being a motivic class. Integral and rational local conditions are distinguished, and real places use the chosen ordinary/modified convention.

Proof/construction plan:

1. Import the genuine L2 Selmer complex and L4 local/Euler-system APIs. At every place use supported localization and the selected realization comparison to prove membership.
2. Assemble the local homotopies into a map of mapping-fibre complexes; taking H¹ gives the factorization. Its determinant is reserved for the following conditional comparison.
3. The full local p-adic proof is a supplier request/gap. No generic Selmer complex or Bloch–Kato condition is redefined here.

Direct prerequisites: MotivicEtaleKTheory:M.8/tate-elliptic-realization-dictionary, MotivicEtaleKTheory:M.8/chern-functoriality, SelmerIwasawaCohomology:L2, SelmerIwasawaCohomology:L4, PadicHodgeRegulators:D.2, PadicHodgeRegulators:D.3, PadicHodgeRegulators:D.5, PadicHodgeRegulators:L1, SelmerIwasawaCohomology:L2/unramified-condition.

Proposed declaration: TauCeti.MotivicEtale.selmer_regulator_factorization.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Kazuya Kato, Tamagawa Number Conjecture for zeta Values](https://arxiv.org/pdf/math/0304233v1), §2.1(a)–(d), pp.167–168. Locator excerpt: “p-adic”. Tamagawa determinant and realization conventions; conjectural arithmetic assertions are not claimed proved.

#### Arithmetic fundamental line

Identifier: MotivicEtaleKTheory:M.8/arithmetic-fundamental-line. Kind: construction.

For the supplied perfect compactly supported arithmetic cohomology complex C_c(T) over Z_p (or the supplied coefficient order), set Δ_p(T)=det^(−1) C_c(T) using the determinant functor from PadicMeasuresIwasawaAlgebras:L5. Retain its integral invertible module, rationalization and base-change/triangle isomorphisms. For a Tate or elliptic motive, the rational fundamental line and its Betti/de Rham/K-theory factors are the exact chosen period-line construction of PS.4; comparison maps/trivializations are separate data. The Tamagawa-number statement asks for a rational zeta element whose p-adic image is a basis of Δ_p(T) and whose real-period image is the specified leading L-value, with all finiteness and realization assumptions explicit.

Hypotheses and conventions: Perfectness, boundedness and coefficient-ring hypotheses supplied by determinant/cohomology owners; no unconditional existence of zeta elements or solution of the Tamagawa conjecture. The rational/real comparison can itself require conjectural motivic finiteness or regulators.

Proof/construction plan:

1. Import compact cohomology and determinant lines, then apply det^(−1) with the source’s sign convention. Base change and localization use the existing determinant functor, not a dimension count.
2. Import the rational fundamental line together with the selected realization isomorphisms; retain an actual proposed element and ask whether it is an integral basis and has the predicted real image.
3. State the conjecture as an arithmetic condition in the reader; the suggested file prototypes the line and actual elements/maps and omits the currently unavailable analytic L-value condition.

Direct prerequisites: MotivicEtaleKTheory:M.8/selmer-regulator-factorization, MotivicEtaleKTheory:M.8/integral-motivic-structures, PadicMeasuresIwasawaAlgebras:L5, PeriodsAndSpecialValues:PS.4, SelmerIwasawaCohomology:L2, ArithmeticGaloisDuality:D7, mathlib:PadicInt, mathlib:PadicInt.isUnit_iff.

Proposed declaration: TauCeti.MotivicEtale.fundamentalLine.

Planning API:

- **TauCeti.MotivicEtale.fundamentalLine_baseChange** (compatibility): Derived coefficient base change induces the supplied determinant-line isomorphism on Δ_p.
- **TauCeti.MotivicEtale.fundamentalLine_triangle** (structure): A distinguished triangle gives the supplied tensor-product determinant isomorphism with the inverse-determinant convention.
- **TauCeti.MotivicEtale.fundamentalLine_basis** (characterisation): An element z is an integral basis precisely when the multiplication map Z_p→Δ_p(T), a↦a z, is an isomorphism; rational nonzero is weaker.

Discriminating examples:

- **fundamentalLine_test_zero** (degenerate): For the zero perfect complex the determinant and inverse determinant are the coefficient ring.
- **fundamentalLine_test_shift** (compatibility): Shifting a perfect complex by one dualizes its determinant line.
- **fundamentalLine_test_nonunit** (non-example): In the line Z_p, the nonzero element p becomes a rational basis but is not an integral basis.

Consumers:

- PeriodsAndSpecialValues:PS.4: Receives the specialized integral and rational comparison lines.
- SelmerIwasawaCohomology:L4: Relates Euler/zeta elements to the specialized determinant line, conditionally.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Kazuya Kato, Tamagawa Number Conjecture for zeta Values](https://arxiv.org/pdf/math/0304233v1), §1.2 and §2.1 equations (2.1.1)–(2.1.5), pp.165–168. Locator excerpt: “determinant module”. Tamagawa determinant and realization conventions; conjectural arithmetic assertions are not claimed proved.

Atlas planet: Arithmetic fundamental line.

#### Regulator determinant comparison

Identifier: MotivicEtaleKTheory:M.8/regulator-determinant-comparison. Kind: comparison.

For the admitted number-field Tate cases, compare the early Deligne regulator with the existing Borel regulator using R.7’s explicit factor-two normalization, and transport the actual integral lattice/determinant comparison from R.4. For Tate and elliptic realizations with the required Selmer, p-adic Hodge, motivic-finiteness and period comparison inputs, the induced determinant maps identify the specialized rational fundamental line with the real period line and Δ_p(T)⊗Q_p. This is a conditional infrastructure comparison, not the Tamagawa-number conjecture.

Hypotheses and conventions: All required comparison isomorphisms, perfectness and finiteness hypotheses listed; R.7 is used only here, downstream of the early Deligne export. Integral basis statements also require the integral local/Tamagawa factors.

Proof/construction plan:

1. Use the named R.7 comparison rather than identify Borel and Deligne normalizations by fiat. Keep rational span, torsion-free lattice and covolume data separate.
2. Apply the determinant functor to the supplied regulator map of Selmer/realization complexes and the PS.4 period comparison; check localization triangles, twists and duals.
3. An isomorphism of rational one-dimensional spaces does not prove an integral-basis claim. Record the Tamagawa leading-value/basis condition separately in the arithmetic fundamental-line node.

Direct prerequisites: MotivicEtaleKTheory:M.8/number-field-deligne-normalization, MotivicEtaleKTheory:M.8/arithmetic-fundamental-line, MotivicEtaleKTheory:M.8/selmer-regulator-factorization, BorelRegulators:R.7/regulator-factor-two, BorelRegulators:R.4/regulator-lattice, BorelRegulators:R.4/regulator-transfer, BorelRegulators:R.4/regulator-determinant, PeriodsAndSpecialValues:PS.4, PadicMeasuresIwasawaAlgebras:L5.

Proposed declaration: TauCeti.MotivicEtale.regulator_determinant_comparison.

Acceptance: Use the indicated genuine supplier carriers, the displayed coefficient and degree conventions, and the stated scheme class; the suggested signatures are prototypes.

Source: [Kazuya Kato, Tamagawa Number Conjecture for zeta Values](https://arxiv.org/pdf/math/0304233v1), §2.1(a)–(d), pp.167–168. Locator excerpt: “K-groups (or motivic cohomology”. Tamagawa determinant and realization conventions; conjectural arithmetic assertions are not claimed proved.

## Supplier export requests

A request identifies the mathematical interface used by the node. Requests to existing upstream stages ask to import their stated exports, and do not propose another construction. Partial supplier packets are not treated as finished implementations.

### DerivedDeRhamCohomology:DD.3

Inverse Cartier for absolute forms of every characteristic-p field, including imperfect fields; additive naturality, pure logarithmic wedge formula and the exact-form quotient. Current DD.3 covers a polynomial relative case, not this field statement.

Needed by: MotivicEtaleKTheory:M.5d/bloch-gabber-kato, MotivicEtaleKTheory:M.5d/artin-schreier-differential.

### CrystallineCohomology:CR.4

Actual p-typical de Rham–Witt logarithmic étale sheaves over arbitrary characteristic-p fields via smooth perfect-base approximation: Teichmüller logarithms, Steinberg/product rules, p^r annihilation, restriction and injection 0→W₁Ω_log^q --p^(r−1)→W_rΩ_log^q→W_(r−1)Ω_log^q, with initial sheaf exactness and field-colimit interface. This is not the abstract CR.0 Witt quotient.

Needed by: MotivicEtaleKTheory:M.5d/witt-logarithmic-symbol, MotivicEtaleKTheory:M.5d/prime-power-bgk, MotivicEtaleKTheory:M.5d/filtered-colimit-comparisons.

### K2SymbolsBrauer:T.4

Norm/trace differential compatibility and the relative unit-symbol/specialization presentation for k_q(R)=ker(K^M_q(Frac R)/p→K^M_(q−1)(κ)/p) at the BK discrete valuation rings; use the existing Bass–Tate/norm nodes and do not assume coefficient left exactness.

Needed by: MotivicEtaleKTheory:M.5d/bloch-gabber-kato, MotivicEtaleKTheory:M.5d/inseparable-and-characteristic-reductions.

### MotivicEtaleKTheory:M.4

Actual cycle complexes, field diagonal H^j(F,Z(j))=K^M_j(F), H^(j+1)(F,Z(j))=0, semilocal localization, products, projective-bundle universal classes and support/purity realization triangles with shift 2c and twist c. Arithmetic extension uses the Geisser Dedekind base hypotheses.

Needed by: MotivicEtaleKTheory:M.5d/mod-prime-motivic-comparison, MotivicEtaleKTheory:M.5d/prime-power-norm-residue, MotivicEtaleKTheory:M.6a/coniveau-cycle-layer, MotivicEtaleKTheory:M.8/motivic-chern-character, MotivicEtaleKTheory:M.8/supported-cycle-character, MotivicEtaleKTheory:M.8/chern-functoriality, MotivicEtaleKTheory:M.8/integral-motivic-structures.

### MotivicEtaleKTheory:M.5a

Transfer-compatible comparison between the chosen cycle complex and the semilocal/Nisnevich motivic model used in Suslin–Voevodsky/Geisser–Levine, sufficient to deduce the low-degree complex comparison from mod-prime norm residue, not merely the diagonal field symbol.

Needed by: MotivicEtaleKTheory:M.5d/mod-prime-motivic-comparison, MotivicEtaleKTheory:M.7/beilinson-lichtenbaum.

### MotivicEtaleKTheory:M.5c

Mod-prime norm-residue isomorphism for all finitely generated field extensions and all weights used by the resolution-free motivic-complex comparison; this is a prerequisite only for the prime-to-characteristic branch, not BGK.

Needed by: MotivicEtaleKTheory:M.5d/mod-prime-motivic-comparison, MotivicEtaleKTheory:M.5d/prime-power-norm-residue.

### MotivicEtaleKTheory:M.1

Finite/adic Tate twists as coherent coefficient objects, coefficient triangles with the correct inclusion map, field-limit/purely inseparable étale invariance, and continuous étale hypercohomology after derived inverse limits.

Needed by: MotivicEtaleKTheory:M.5d/filtered-colimit-comparisons, MotivicEtaleKTheory:M.5d/inseparable-and-characteristic-reductions, MotivicEtaleKTheory:M.7/arithmetic-adic-degrees, MotivicEtaleKTheory:M.8/finite-etale-chern.

### SchemeKTheoryOperations:S.3

Support perfect-complex K spectra, maps for support inclusion and proper face pullback, and regular-scheme dévissage to connective G(W), used to prove the degreewise connectivity bound rather than assume every support fibre is connective.

Needed by: MotivicEtaleKTheory:M.6a/admissible-k-supports, MotivicEtaleKTheory:M.6b/motivic-strong-convergence, MotivicEtaleKTheory:M.8/supported-cycle-character.

### EnhancedDerivedSheaves:E5:abstract

Coherent stable diagram colimits, geometric realization, sheafification/hypercompletion and étale Postnikov descent on the actual K-coefficient sheaf; preserve functoriality of the entire filtered diagram.

Needed by: MotivicEtaleKTheory:M.6a/homotopy-coniveau-tower, MotivicEtaleKTheory:M.7/finite-etale-k-theory.

### MotivicEtaleKTheory:M.2

The exact arithmetic finite-cd and real-place Tate/Poitou–Tate cohomology page comparisons used in K-book VI §§8–9, including α_s(j), α_s isomorphism for s≥3, and the special low-degree real conditions.

Needed by: MotivicEtaleKTheory:M.7/s-integer-comparison-range, MotivicEtaleKTheory:M.7/arithmetic-adic-degrees, MotivicEtaleKTheory:M.7/real-place-correction, MotivicEtaleKTheory:M.7/dyadic-s-integer-extensions.

### RefinedTraceMethods:RT.4

Real topological BO/KO finite-coefficient comparison carrier and Bott period eight, including the nonsplit π_(8k+2)(BO;Z/2)=Z/4 calculation. Current RT.4 plans complex ku/KU; request its Part II in the same topological K direction, not a local BO definition in M.7.

Needed by: MotivicEtaleKTheory:M.7/suslin-real-comparison, MotivicEtaleKTheory:M.7/real-mod-two-sequence, MotivicEtaleKTheory:M.7/real-place-correction.

### MotivesAndAlgebraicCycles:MC.1

Tate objects and the pointed-elliptic-curve h¹ projector with cohomological variance, supplied as actual motives; do not treat a representation alone as a constructed motive.

Needed by: MotivicEtaleKTheory:M.8/tate-elliptic-realization-dictionary.

### MotivesAndAlgebraicCycles:MC.2

Motivic-to-Deligne/logarithmic and étale realizations preserving products, supports, trace, twists and universal Chern classes; specialize the Tate and elliptic objects and reconcile cohomological H¹ with the dual homological Tate module. The elliptic good-reduction characteristic polynomial is imported from Tau Ceti EllipticCurves Layers 2–4.

Needed by: MotivicEtaleKTheory:M.8/deligne-regulator, MotivicEtaleKTheory:M.8/number-field-deligne-normalization, MotivicEtaleKTheory:M.8/chern-functoriality, MotivicEtaleKTheory:M.8/tate-elliptic-realization-dictionary.

### tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne

Part II export for the actual logarithmic Deligne–Beilinson complex, compactification independence, products and real conjugation, with the simplicial first-infinitesimal-diagonal realization. Generic Weil/normalized cosimplicial identifications are imported in the owning differential/Hodge direction, not re-planned by the regulator application.

Needed by: MotivicEtaleKTheory:M.8/deligne-regulator, MotivicEtaleKTheory:M.8/number-field-deligne-normalization.

### SelmerIwasawaCohomology:L2

The actual generic Selmer mapping-fibre complex with local-condition maps and H⁰ correction; the current L2 node unramified-condition supplies the H¹ away-p predicate only, not the derived mapping-fibre carrier.

Needed by: MotivicEtaleKTheory:M.8/selmer-regulator-factorization, MotivicEtaleKTheory:M.8/arithmetic-fundamental-line.

### SelmerIwasawaCohomology:L4

Propagation of the imported finite local condition on V (from PadicHodgeRegulators:L1) to T and V/T, and the Euler-system relation interface. Specify integral versus rational local maps for the Tate/elliptic regulator application.

Needed by: MotivicEtaleKTheory:M.8/norm-compatible-regulator-families, MotivicEtaleKTheory:M.8/euler-factor-regulator-compatibility, MotivicEtaleKTheory:M.8/selmer-regulator-factorization.

### PadicHodgeRegulators:D.2

Local syntomic-to-étale regulator comparison and proof that the admitted motivic classes satisfy the finite local condition, with exact weights, residue characteristic and crystalline/semistable hypotheses. This is used after the early finite étale Chern construction.

Needed by: MotivicEtaleKTheory:M.8/selmer-regulator-factorization, MotivicEtaleKTheory:M.8/regulator-determinant-comparison.

### PadicHodgeRegulators:D.5

The Tate/elliptic higher-weight local realization and regulator comparisons in the stated reduction regimes, giving the local maps/homotopies needed for the Selmer complex and period comparison.

Needed by: MotivicEtaleKTheory:M.8/selmer-regulator-factorization, MotivicEtaleKTheory:M.8/regulator-determinant-comparison.

### PadicMeasuresIwasawaAlgebras:L5

Determinant functor on perfect arithmetic complexes, inverse line, distinguished-triangle multiplicativity, derived coefficient base change, and actual integral-basis versus rational-trivialization criteria. The present L1–L3 packet has no L5 determinant construction.

Needed by: MotivicEtaleKTheory:M.8/arithmetic-fundamental-line, MotivicEtaleKTheory:M.8/regulator-determinant-comparison.

### PeriodsAndSpecialValues:PS.4

The exact rational fundamental line for the chosen Tate/elliptic realization, with its Betti/de Rham and motivic K factors, integral lattice choices, and conditional real and p-adic comparison maps. Include every finiteness/period hypothesis; no assertion of a general zeta element.

Needed by: MotivicEtaleKTheory:M.8/integral-motivic-structures, MotivicEtaleKTheory:M.8/arithmetic-fundamental-line, MotivicEtaleKTheory:M.8/regulator-determinant-comparison.

### GeneralAlgebraicKTheory:K.2

Actual plus-space K carrier, stabilization, Hurewicz and universal characteristic-class evaluation used by the Suslin and early Chern/Deligne constructions. Existing checkpoints do not yet give the full coherent universal class construction.

Needed by: MotivicEtaleKTheory:M.7/suslin-real-comparison, MotivicEtaleKTheory:M.8/finite-etale-chern, MotivicEtaleKTheory:M.8/number-field-deligne-normalization, MotivicEtaleKTheory:M.7/number-ring-duality-sign.

### ArithmeticGaloisDuality:R02.2

The precise restriction/corestriction and compact-coefficient projection formula, with pure-inseparable field-category invariance imported from the field/Galois interface.

Needed by: MotivicEtaleKTheory:M.5d/inseparable-and-characteristic-reductions, MotivicEtaleKTheory:M.7/etale-k-transfer.

### ArithmeticGaloisDuality:R02.3

Restricted-ramification finite-cd and finiteness for odd primes, or totally imaginary dyadic fields; positive-twist H⁰ vanishing, and the real-place exclusions for the étale comparison.

Needed by: MotivicEtaleKTheory:M.7/dedekind-motivic-comparison, MotivicEtaleKTheory:M.7/bott-etale-descent, MotivicEtaleKTheory:M.7/s-integer-comparison-range, MotivicEtaleKTheory:M.7/arithmetic-adic-degrees.

### ArithmeticGaloisDuality:R02.4

The real-place Tate/Poitou–Tate page identities and surjectivity after enlarging S in the exact K-book VI §9 argument, with its specified low-degree exceptions.

Needed by: MotivicEtaleKTheory:M.7/dyadic-s-integer-extensions.

### ArithmeticGaloisDuality:D7

Actual compact-support arithmetic fibre complex, modified real-place complexes and perfection in the selected lattice regimes, imported without reconstructing generic duality.

Needed by: MotivicEtaleKTheory:M.7/real-place-correction, MotivicEtaleKTheory:M.8/arithmetic-fundamental-line.

### PadicHodgeRegulators:D.3

Only the stated unramified p>3 local regulator theorem is consumed in that regime; no ramified or dyadic extension is inferred from it.

Needed by: MotivicEtaleKTheory:M.8/selmer-regulator-factorization.

### PadicHodgeRegulators:L1

The Bloch–Kato finite condition on the rational representation and its period-ring local map, in the selected crystalline/semistable hypotheses; L4 propagates it to lattices.

Needed by: MotivicEtaleKTheory:M.8/selmer-regulator-factorization.

### EulerSystemsCyclotomicMainConjecture:L0

The existing Euler-system normalization interface and cyclotomic norm-compatible units/roots needed for Soulé’s specific K-theory family; preserve its Frobenius conventions.

Needed by: MotivicEtaleKTheory:M.8/norm-compatible-regulator-families.

### ClassicalAdicEtaleCohomology:H3

Existing smooth proper curve base-change, trace and duality realization identifying H¹_et(E) with the cohomological dual of the Tate module, with geometric Frobenius convention.

Needed by: MotivicEtaleKTheory:M.8/tate-elliptic-realization-dictionary.

### tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-10-continuous-cohomology-in-all-degrees

Use the existing all-degree discrete cohomology and finite-quotient colimit interface; the field-system finite-presentation descent application stays in the present colimit node, not a second cochain definition.

Needed by: MotivicEtaleKTheory:M.5d/filtered-colimit-comparisons.

### tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68

Use the existing elliptic Tate module, Weil pairing and its dual cohomological realization; no elliptic curve or Tate module is replanned.

Needed by: MotivicEtaleKTheory:M.8/tate-elliptic-realization-dictionary.

### tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1

Use the existing Frobenius polynomial 1−a_vT+qT² on H¹ of good finite-field reduction, a_v=q+1−pointCount.

Needed by: MotivicEtaleKTheory:M.8/tate-elliptic-realization-dictionary.

### tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv

Use the existing good-reduction and unramified local realization to carry the finite-field Frobenius polynomial to the number-field place; bad-place cases retain their own inertia hypotheses.

Needed by: MotivicEtaleKTheory:M.8/tate-elliptic-realization-dictionary.

### SchemeAndStackFoundations:SF.5

Existing refined intersection, supported cycle classes, purity/Gysin maps and geometric GRR in the admitted regular smooth/projective scheme setting, with Todd normalization; the higher regulator comparison imports these maps.

Needed by: MotivicEtaleKTheory:M.8/supported-cycle-character, MotivicEtaleKTheory:M.8/chern-functoriality.

## Recorded proof and source gaps

### BGK elimination and relative proof engines

Acquire/read Kato 1982, Galois cohomology of complete discrete valuation fields, LNM 967 §1, pp.215–238. Refine BK Proposition 2.4 into adapted-p-basis, relative diagram and lexicographic-elimination nodes; the six inherited KF2000 source issues remain unreviewed. BK §2 was read, but its cited Kato proof input is not replaced by the defective supplementary sketch.

Needed by: MotivicEtaleKTheory:M.5d/bloch-gabber-kato.

### Resolution-free Beilinson–Lichtenbaum input

Geisser–Levine 2001, Invent. Math. 143, pp.55–113: original author PDF BlochKato.pdf returned 404. Read its resolution-free cone/truncation proof and extract the exact semilocal transfer hypotheses. SV2000 Theorem 7.4 was read with resolution of singularities and does not supply the unconditional version by itself; Geisser Dedekind §5 supplies only the cited application.

Needed by: MotivicEtaleKTheory:M.5d/mod-prime-motivic-comparison, MotivicEtaleKTheory:M.7/beilinson-lichtenbaum, MotivicEtaleKTheory:M.5d/prime-power-norm-residue.

### Global filtered-model comparison

Read the complete comparison between Levine homotopy coniveau and the Friedlander–Suslin global multi-relative K tower, and construct a filtered zigzag with augmentation/layer compatibility. Levine Theorem 6.4.1 and FS Theorem 13.13 each give their own layers; equality of E₂ pages is not the missing global equivalence.

Needed by: MotivicEtaleKTheory:M.6a/global-model-comparison.

### Filtered multiplicative comparison proof

Read Levine, K-theory and motivic cohomology of schemes, §11 and Appendix D in full and extract the simultaneous-moving pair product and its coherent cycle comparison. The source statements, support diagram and degree conventions were read; a general multiplicative filtered diagram is not established just by a binary product on K groups.

Needed by: MotivicEtaleKTheory:M.6b/filtered-motivic-products, MotivicEtaleKTheory:M.6b/filtered-adams-operations.

### Admitted base-field and arithmetic tower extension

The constructed tower and elementary convergence bound are for smooth finite-dimensional schemes over a perfect field. Read/resolve the continuity and arithmetic-base filtered construction needed for arbitrary fields and the Dedekind arithmetic motivic sequence; Geisser Theorem 1.2 gives the arithmetic low-degree complexes, not the entire filtered K tower.

Needed by: MotivicEtaleKTheory:M.6/motivic-spectral-sequence, MotivicEtaleKTheory:M.7/quillen-lichtenbaum-field-range, MotivicEtaleKTheory:M.7/s-integer-comparison-range, MotivicEtaleKTheory:M.7/dedekind-motivic-comparison.

### Thomason general descent proof

Read Thomason 1985/1988 original Bott-inverted étale descent theorem and its Tate–Tsen filtration assumptions. FGV §§2.6–2.8 was read and the number-ring odd-prime case is explicit; do not promote its “mild hypothesis” to all fields or regular schemes. The totally imaginary dyadic extension requires the exact original coefficient/descent theorem.

Needed by: MotivicEtaleKTheory:M.7/bott-etale-descent, MotivicEtaleKTheory:M.7/quillen-lichtenbaum-field-range, MotivicEtaleKTheory:M.7/s-integer-comparison-range.

### Coherent étale transfer source

Read Blumberg–Mandell 2015 §10, cited by FGV transfer proof, for the map of étale descent towers. Refine ramified finite-perfect transfers with the relative dualizing/different-line correction; FGV’s principal-different cyclotomic example is not a proof for every ramified ring extension.

Needed by: MotivicEtaleKTheory:M.7/etale-k-transfer, MotivicEtaleKTheory:M.8/chern-functoriality, MotivicEtaleKTheory:M.8/norm-compatible-regulator-families.

### Suslin neighbourhood and stability inputs

The complete K-book VI §3 sketch and its reductions were read. Acquire the original Suslin/Lie-group small-neighbourhood homology and stabilization proof inputs cited in Lemmas 3.5–3.8, then refine them in the appropriate topology/rigidity owner. Do not use the real mod-2 table as a proof of the initial real comparison.

Needed by: MotivicEtaleKTheory:M.7/suslin-real-comparison.

### Supported universal character original

Acquire/read Gillet 1981 Definition 2.34(ii), Theorem 3.1 and §2.35, and Gillet–Soulé 1987 Proposition 5.5. Li–Liu Appendix B and its supported pairings were read but do not replace the universal supported Chern/γ-filtration proof.

Needed by: MotivicEtaleKTheory:M.8/supported-cycle-character, MotivicEtaleKTheory:M.8/finite-etale-chern, MotivicEtaleKTheory:M.8/chern-functoriality.

### General motivic Deligne realization

Read Huber’s mixed realization construction cited by K-book V Example 11.12 and its multiplicative realization of the cycle complex. Burgos §§10.1–10.4 supplies the actual logarithmic cone and early number-field map; generic compactification independence and the comparison with the integral motivic class still require the Hodge/MC.2 supplier.

Needed by: MotivicEtaleKTheory:M.8/deligne-regulator, MotivicEtaleKTheory:M.8/number-field-deligne-normalization, MotivicEtaleKTheory:M.8/chern-functoriality.

### Local regulator and determinant case hypotheses

Refine the selected Tate/elliptic local comparison proof and PS.4 fundamental-line factors with precise motivic finiteness, perfectness and period/regulator assumptions. Kato §2.1 states these as part of conjectural infrastructure; no unconditional elliptic Tamagawa leading-value or integral-basis theorem is planned as proved.

Needed by: MotivicEtaleKTheory:M.8/selmer-regulator-factorization, MotivicEtaleKTheory:M.8/arithmetic-fundamental-line, MotivicEtaleKTheory:M.8/regulator-determinant-comparison.

## Remaining refinements

### MotivicEtaleKTheory:M.5d

- Refine BGK relative/p-basis/elimination engines after reading Kato 1982 §1; retain independent review of all six inherited source issues.
- Supply arbitrary-field Cartier/logarithmic de Rham–Witt imports and the exact field-colimit interface.
- Read resolution-free Geisser–Levine proof; refine semilocal coefficient-comparison chains.

### MotivicEtaleKTheory:M.6

- Resolve/refine the filtered global-model, arbitrary-field/arithmetic-base and multiplicative comparison gaps in M.6a/M.6b; compare normalized universal higher character with S.7.

### MotivicEtaleKTheory:M.6a

- Construct the full filtered zigzag between homotopy-coniveau and FS global models, with augmentation/layer compatibility.
- Resolve support/dévissage and coherent stable-diagram supplier requests; extend the perfect-field scheme class only with the source theorem.

### MotivicEtaleKTheory:M.6b

- Read and refine §11/Appendix D coherent simultaneous-moving product proof and filtered Adams comparison.
- Resolve supplier carriers while preserving the explicit p>d+m connectivity bound, finite filtration and lim¹ argument; no generic exact-couple duplication.

### MotivicEtaleKTheory:M.7

- Read/refine original Thomason and Suslin/Lie-neighbourhood inputs and coherent transfer descent.
- Resolve the arithmetic filtered-sequence extension and the real BO/KO Part II request; refine the low-degree and dyadic connecting/extension maps.

### MotivicEtaleKTheory:M.8

- Read/refine Gillet/Gillet–Soulé supported character and Huber general motivic Deligne realization; supply logarithmic compactification independence.
- Resolve actual Tate/elliptic realization, local Selmer and D.2/D.5 regulator comparisons with precise regime/finiteness hypotheses.
- Supply L5 determinants and PS.4 fundamental lines/period maps; refine the conditional integral comparison and the Tamagawa statement without asserting existence of a zeta element.

## Source ledger and inherited source issues

The ledger distinguishes target-level source reading from complete proof acquisition. The downloaded edition and SHA-256 identify the exact text; a date in the inherited source-version ledger is evidence from the previous checkpoint, not a claim of a new independent comparison. Original proof inputs that were unavailable or not fully read are listed as gaps. The six KF2000 source findings are preserved pending independent review; this plan does not add a review verdict.

### Kbook2013

[The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf) — Charles A. Weibel. Author draft dated 29 August 2013.

SHA-256: a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845.

- III.7 differential symbol, Definition 7.7.1 and Theorem 7.7.2, printed pp.250–251; Izhboldin continuation only a lead, no extra target
- V §§11.2–11.12, printed pp.451–458, and the universal motivic-class proof through p.459; Lemma 11.13 normalization
- VI §3 Theorem 3.1 and proof/sketch through Lemmas 3.5–3.8, pp.475–479; VI §4 Theorems 4.1–4.9 and proofs, pp.480–486
- VI §8 Theorems 8.1–8.5 and arithmetic degree calculation, pp.513–514; VI §9 through entire proof of Theorem 9.4, pp.517–520

### BK1986

[p-adic étale cohomology](https://www.numdam.org/item/PMIHES_1986__63__107_0.pdf) — Spencer Bloch and Kazuya Kato. Publications Mathématiques de l’IHÉS 63 (1986), 107–152, published scan.

SHA-256: 51cf9c3fe85c3d55a6af56c9789c831b810cdd4c9b2c275057dcde6c14730dc8.

- Entire §2, printed pp.113–118, re-read in this run, including Lemmas 2.2/2.3.2/2.5, Proposition 2.4 and Corollary 2.8
- Kato 1982 §1 is a cited original input that remains unread; no claim of full BK paper coverage

### KF2000

[Appendix to Section 2](https://msp.org/gtm/2000/03/gtm-2000-03-003p.pdf) — Masato Kurihara and Ivan Fesenko; A2 by Ivan Fesenko. Geometry & Topology Monographs 3 (2000), appendix pp.31–41; published publisher PDF.

SHA-256: 3fc22f399e587fbd689270de87e501f839258276b3926bc0a5acf395529a9b95.

- Entire appendix A1–A2, printed pp.31–41 / PDF pp.1–11, read on 2026-09-26; key formulas on printed pp.31, 33, 36, 37, 38 and 40 visually checked.
- Compared the recorded source-issue passages with arXiv math/0012134v1. A2 remains a supplementary account with unresolved proof obligations, not a completed BGK proof.
- 2026-10-06 continuation: reread the six inherited source-issue passages at pp.31,33,36–40 and the supplement argument; their v1 comparison/search remains the prior worker’s ledger, not a new independent verification.

### Levine2008

[The homotopy coniveau tower](https://arxiv.org/pdf/math/0510334) — Marc Levine. arXiv:math/0510334v1, 16 October 2005; publication 2008; locators here use the 67-page preprint.

SHA-256: 5f268002b5ec36a74932a48ac051712c9c19c41a8b76e5bcb5dcdf0800538190.

- Introduction §1.3; §2.1 support construction and convergence discussion
- Theorem 3.2.1 statement and opening proof; §4.1 Theorem 4.1.1 and proof; §5.3 Theorem 5.3.1/Corollary 5.3.2
- Entire §6.4 K-theory layer comparison; §§11.2–11.3 statements, not all earlier moving proofs

### LevineSchemes

[K-theory and motivic cohomology of schemes, I](https://www.esaga.uni-due.de/f/marc.levine/publ/KthyMotI12.01.pdf) — Marc Levine. Author preprint December 2001, 86 pages.

SHA-256: 67affc5d6f837a78281c824d21723be9af1180bb77d44e8cff9cca5b0b2ef820.

- Introduction and §2.3–§2.5 support/face definitions
- Theorem 12.12 and its proof, pp.58–59; Theorems 14.5 and 14.7 statements, pp.71–73
- §11 and Appendix D multiplicative proof not read; explicit gap

### FGV2022

[The Galois action on symplectic K-theory](https://math.berkeley.edu/~fengt/Galois_action_on_KSp.pdf) — Tony Feng, Søren Galatius and Akshay Venkatesh. Author PDF, published 2022.

SHA-256: 5d717b2a94288593049be2aed34e38dbde10750beba4bd3d3387820d038e8807.

- §§2.6–2.8, including Remark 2.8, Theorem 2.9, Lemma 2.10, Adams/transfer conventions and cited transfer proof
- Only these ordinary/étale K-theory inputs are routed here; no KSp construction planned

### LiLiu2021

[Chow groups and L-derivatives of automorphic motives for unitary groups](https://www.math.columbia.edu/~chaoli/AIPF.pdf) — Chao Li and Yifeng Liu. Annals of Mathematics 194 (2021); author PDF AIPF.pdf.

SHA-256: 6ef2d63ea2cf55d8a2648f71ed7ac84e4d32f77e9e7eaeb62b47e584e4e5e566.

- Appendix B, pp.57–62, including Lemma B.6, support Chern map and footnote 22
- No other automorphic or height-theoretic assertions routed to this packet

### SV2000

[Bloch–Kato conjecture and motivic cohomology with finite coefficients](https://www.math.ias.edu/vladimir/sites/math.ias.edu.vladimir/files/susvoenew.pdf) — Andrei Suslin and Vladimir Voevodsky. The arithmetic and geometry of algebraic cycles (2000), author PDF.

SHA-256: 4f29e999c004da03de80d80e3acc4b4318a18c95951629d9f899e27164fd5fad.

- §7, pp.52–53, Theorem 7.4 and its resolution-of-singularities hypothesis; general proof not fully read

### Illusie1979

[Complexe de de Rham–Witt et cohomologie cristalline](https://www.numdam.org/item/ASENS_1979_4_12_4_501_0.pdf) — Luc Illusie. Annales scientifiques de l’École normale supérieure 12 (1979), 501–661, published scan.

SHA-256: bf9b783b4f5f255133c68ccb544aec029f25828aa943a744ccb6958d51f218d8.

- I §5.7, printed pp.596–598, statements 5.7.1–5.7.9 and proof of Corollary 5.7.5
- This is I(5.7.5), not part II; full general de Rham–Witt theory stays with CR.4

### GeisserDedekind

[Motivic cohomology over Dedekind rings](https://www2.rikkyo.ac.jp/web/geisser/Dedekind.pdf) — Thomas Geisser. Mathematische Zeitschrift 248 (2004), 773–794, author/published PDF.

SHA-256: 88b92df6124b0e3a2be09ac24250c2b811572628d17a6282e787e0883160091f.

- Introduction, exact Theorem 1.2; Lemma 2.1 and Proposition 2.2
- Entire §5 proof of Theorem 1.2, pp.787–789; cited Geisser–Levine original unavailable

### Calmes2026

[Hermitian K-theory for stable ∞-categories III: Grothendieck–Witt groups of rings](https://arxiv.org/pdf/2009.07225v4) — Baptiste Calmès, Emanuele Dotto, Yonatan Harpaz, Fabian Hebestreit, Markus Land, Kristian Moi, Denis Nardin, Thomas Nikolaus and Wolfgang Steimle. arXiv:2009.07225v4, 27 April 2026; routed Annals 204 (2026).

SHA-256: 1e4b6720055ebdce0012f5780bfc7cdb5b853e32f29b17224a1be0bc676f770c.

- Lemma 3.2.4 and entire proof, pp.56–57 only; no other hermitian K results claimed

### FS2002

[The spectral sequence relating algebraic K-theory to motivic cohomology](https://dornsife.usc.edu/ericmfriedlander/wp-content/uploads/sites/233/2023/06/23.pdf) — Eric M. Friedlander and Andrei Suslin. Annales scientifiques de l’École normale supérieure 35 (2002), author-hosted PDF.

SHA-256: d716deea11cf2e9e56d04b78eb777b10037bef4573fcc32db957d2cf6c4735a3.

- Introduction; §13 Lemma 13.12 and Theorem 13.13, pp.67–68; Propositions 13.17–13.18, pp.71–72
- Earlier full multi-relative comparison/moving proofs not read; global filtered-zigzag gap retained

### Soule1987

[Éléments cyclotomiques en K-théorie](https://www.numdam.org/item/AST_1987__147-148__225_0.pdf) — Christophe Soulé. Astérisque 147–148 (1987), 225–257, published scan.

SHA-256: 714881bf6d8d10db209d9a3f03835fb048e4fc85ae103942daaefc3924efb0b7.

- §4.1–§4.4, printed pp.238–240: compatible units, Bott powers and K-degree/norm conventions

### Kato2003

[Tamagawa Number Conjecture for zeta Values](https://arxiv.org/pdf/math/0304233v1) — Kazuya Kato. ICM 2002 proceedings, 163–171; arXiv:math/0304233v1, 16 April 2003.

SHA-256: 6d7f3a5924fd5291bc23870547b05552ba7fb1e39413d551f11daf052fbcf12b.

- §§1.1–1.3 and §2.1 through its fundamental-line discussion, pp.163–168; examples §§2.2–2.3, p.169
- No proof of the characteristic-zero conjectural zeta-element/basis assertions is claimed

### Burgos2002

[The Regulators of Beilinson and Borel](https://www.icmat.es/miembros/burgos/files/brbr.pdf) — José Ignacio Burgos Gil. CRM Monograph Series 15 (2002), author PDF.

SHA-256: da6ba8c4b08bf447d1575788c33b96c52d8d0d0a377e8f2990ead6aed73f65ea.

- §4.4 and Remark 4.25 normalization, pp.31–32
- §10.1–§10.3 in full, pp.89–94; §10.4 infinitesimal-diagonal construction and diagram through p.97 before Lemma 10.10
- §8.1 Lemmas 8.6–8.7 proof passage only; Theorems 8.12/8.15 and the full general Weil-algebra comparison are supplier inputs, not claimed fully read

### MotivicEtaleKTheory/E1

A2.2, printed p.40 (PDF p.10), definition of k_n(O). The residue decreases degree. Bloch–Kato (2.3), printed p.114, displays the degree-(q−1) target explicitly; confusing it with specialization destroys the diagram.

Proposed correction: The defining map is the tame residue k_n(E)→k_(n−1)(k). The subsequent specialization from its kernel to k_n(k) is a separate map.

Review status: inherited, pending independent review; correction/search provenance remains in the packet.

### MotivicEtaleKTheory/E2

A2.2, printed p.40 (PDF p.10), definition of ν_n(O). BK (2.3), printed p.114, specifies 1−C⁻¹. The kernel of projection in degree zero is zero, whereas the logarithmic kernel contains 1. The intended arithmetic target would be lost.

Proposed correction: Label the arrow 1−C⁻¹ (or its negative), rather than leaving a quotient projection as the only evident map.

Review status: inherited, pending independent review; correction/search provenance remains in the packet.

### MotivicEtaleKTheory/E3

A2.1 Definitions–Properties (1), printed p.36, followed by the ordering of S in the proof on p.37 (PDF pp.6–7). The printed componentwise strict partial order does not totally order increasing tuples: (1,4) and (2,3) are incomparable. Consequently all increasing 2-tuples from four indices cannot be enumerated as the asserted strict chain.

Proposed correction: Use the lexicographic order of BK Proposition 2.4, printed p.115, and recheck every lower-term assertion against that order. This identifies the failed enumeration, not a certification of the whole supplementary proof.

Review status: inherited, pending independent review; correction/search provenance remains in the packet.

### MotivicEtaleKTheory/E501

A1.1, generators-and-relations description of differentials, printed p.31 / PDF p.1. Leibniz and annihilation of base scalars do not imply additivity. Take A=ℚ, B=ℚ(t), M=B and define δ(f)=f·ord_t(f) for f≠0, δ(0)=0. Valuation additivity gives δ(fg)=fδ(g)+gδ(f), and δ annihilates ℚ, but δ(t+1)=0 whereas δ(t)+δ(1)=t. Thus the displayed relations alone admit a nonadditive map and do not present Kähler differentials.

Proposed correction: Include the additive relation d(x+y)=dx+dy for all x,y∈B. The preceding derivation universal property is the correct specification, and the roadmap should use the existing Kähler differential module with additive derivation.

Review status: inherited, pending independent review; correction/search provenance remains in the packet.

### MotivicEtaleKTheory/E502

A1.1, second symbol relation, printed p.33 / PDF p.3. The relation comes from a·dlog(b₁b₂)=a·dlog(b₁)+a·dlog(b₂). The printed a₂ is free and unrelated to a. For example over ℚ(t), a=0, a₂=1, b₁=1, b₂=t gives zero on the left and dt/t on the right if the printed relation is imposed.

Proposed correction: The final term is [a,b₂}; the same coefficient a occurs in both terms.

Review status: inherited, pending independent review; correction/search provenance remains in the packet.

### MotivicEtaleKTheory/E504

A2.1 proof of Proposition, definition of r on p.38 and top-degree forms on p.39 / PDF pp.8–9. The displayed definitions give [k₁:k₀]=p. Thus the printed r omits one p-basis element. Already for p=2, k=𝔽₂(b₁,b₂), n=2 and s=(1,2), the printed r is 1 although the interval has two elements: it asks for m(r−n)=m(−1), and Ω¹(k₂/k₀)/d(k₂) has dimension five over k₀, not one (Ω¹ has dimension eight and d(k₂) has dimension three). With r=2 the empty complement and the top-degree one-dimensional cohomology have the intended sizes.

Proposed correction: Define pʳ=[k₂:k₀], using the p-basis indices in the full interval from s(1) through s(n), rather than [k₂:k₁]. Then r is the degree of the top differential form and r−n is the number of complementary indices.

Review status: inherited, pending independent review; correction/search provenance remains in the packet.

## Proposed supplier extensions

M.7 requires real BO/KO and its finite-coefficient period-eight extension calculation. The current RT.4 provides complex ku/KU, so the real carrier is an additional supplier obligation, not a second topological K construction here.

Refined trace methods, Part II: Real topological K-theory. First prerequisite RefinedTraceMethods:RT.4; add real BO/KO, real Bott periodicity and finite-coefficient boundary/extension calculations; export to M.7/suslin-real-comparison and real-mod-two-sequence. Keep M.7 responsible only for the algebraic-real comparison and arithmetic application.

The upstream mixed-Hodge layer is imported as existing work. The logarithmic Deligne–Beilinson cone, compactification independence and multiplicative motivic realization required by M.8 are additional exports; no upstream layer is replanned or changed.

Hodge structures, Part II: Deligne–Beilinson realization. First prerequisite tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne; supply the actual logarithmic cone, compactification-independent realization, products and real conjugation. Extend the existing Hodge-direction Part II owner rather than creating a competing generic realization library. M.8 owns only K-theory regulator applications and the early number-field normalization.

## Validation and suggested signatures

The packet checker passes with zero errors and zero warnings. The packet contains 67 nodes, 63 API items, 60 tests, 30 planets, 26 baseline declarations, 34 requests and 11 gaps. Every stage is planned and every implementation status remains unchecked. Internal prerequisite cycles and source-excerpt/locator consistency are checked separately from the packet schema.

The suggested file keeps the original differential-symbol prototypes on native Kähler/exterior/tensor/quotient carriers. Unavailable higher spectra, sheaves, cycle complexes, realizations and determinant functors are explicit supplier parameters. Each section records the semantic conditions omitted from the typed prototype; missing conditions are never represented by arbitrary proposition fields. Its definition/API/example names correspond to this document and the packet. Elaboration checks types and signatures and does not prove the placeholder theorems. The compilation result is recorded in the handoff and packet checks. The shared build lacks the compiled Tau Ceti Kähler semilinear-map module, so that one existing API is passed through its native semilinear-map type rather than redefined.
