# K2SymbolsBrauer — T.3

Residues, reciprocity and the arithmetic of K_2, planned from Weibel's K-book, chapters III and V. T.3:symbols builds the tame symbol of a discrete valuation in the roadmap's normalisation, the inverse of the K-book's, with independence of the uniformiser, bimultiplicativity and the Steinberg relation by the source's case analysis, the induced homomorphism on K_2 and the ramification formula; it also hosts the Milnor residue theory the localisation sub-stage's text lists — Serre's residue algebra and the higher Milnor residues (Π on the right, so that in degree two they are T.3's symbol and in degree n they are (−1)^{n−1} times Theorem III.7.3's) with their product formula, specialisation, finite support and rigidity — so that T.4 can use it (RT-AREA-ktheory-1/28). T.4 proves Milnor's exact sequence for F(t) as the K-book does, builds the Milnor transfer through the residue at infinity with its projection, degree and base-change formulas, proves the elementary norm/residue identities and then Kato's independence theorem, the general norm–residue formula, and Suslin's reciprocity law in every degree for a proper curve over any field, over the places of its regular model with Kato's norms for inseparable residue extensions (exported to MotivicEtaleKTheory M.4), its tame-symbol form and its disjoint-support case, compared with EllipticCurves Layer 2's f(div g) = g(div f); the closed-point–place dictionary is imported from AlgebraicCurves Layer 12. T.3:localization-comparison, after T.4, identifies the tame symbols with the boundary of the localisation sequence of a discrete valuation ring and of a Dedekind domain, proves the norm–residue square for Quillen's transfers and compares T.4's Milnor norm with Quillen's transfer on K_2, and supplies these to SchemeKTheoryOperations S.3 and EllipticKTheory E.3 (RS-18). T.5 defines the unramified subgroup, derives the tame-kernel sequences of O_{F,S} (residues outside S) and O_F and the relative sequence (residues in S) through the Dedekind localisation sequence with SK_1 = 0 from KTheoryLowDegrees U.4, and computes K_2(ℤ) and K_2(ℚ), which ArithmeticKTheory N.2 and N.8 import; the certificate engine is N.6's, and K_2 of a finite field is the companion part's T.2 node. T.6 owns the Dennis–Stein symbols under 1 − rs invertible, their relations, the presentation theorems under their hypotheses and the Keune–Loday relative group. T.7 imports the Galois symbol and Tate's theorems from their single owner MotivicEtaleKTheory M.3 and keeps the symbol formula against the pinned Kummer map and cup product, the classical local symbols, the change-of-root rule, the Brauer-valued symbol, the local Hilbert/invariant comparison, a reciprocity adapter over ClassFieldTheory Layers 10 and 14 and ClassicalArithmeticCompletion CA.1, and the Chern clause as a compatibility. Nothing here is formalised; implementationStatus is unchecked throughout. Round2 FIX-RT-AREA-ktheory-1~2 expands the proof inputs described in the fix report, updates source-reading boundaries and retains precisely named supplier gaps. The revised plan awaits independent review; it is not a formalization.

FIX-RT-AREA-ktheory-1~2, issue #5541. Codex, session codex-5ebb6f, 2026-10-02. The five revised packets await independent review. Earlier review decisions are preserved as history. This document is the planning roadmap; the suggested Lean signatures remain unchecked and were not compiled.

This packet has 77 nodes, 127 API items, 80 unit-test obligations and 4 explicitly remaining gaps. A complete disposition of an assigned fix does not assert closure of the entire roadmap.

## Scope and pinned library inputs

`K2SymbolsBrauer:T.3`, `K2SymbolsBrauer:T.3:localization-comparison`, `K2SymbolsBrauer:T.3:symbols`, `K2SymbolsBrauer:T.4`, `K2SymbolsBrauer:T.5`, `K2SymbolsBrauer:T.6`, `K2SymbolsBrauer:T.7`

Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.

- `tauceti:Valuation.exists_eq_zpow_mul_unit_of_surjective` — TauCeti/RingTheory/Valuation/Discrete/Order.lean. For a surjective v : F → ℤᵐ⁰ with nontrivial value group and a uniformiser t, every f ≠ 0 is t^(ord v f) times a unit of the valuation subring. The declaration is in namespace Valuation, not TauCeti. statement read at the pinned commit (Order.lean:252)

- `mathlib:IsDiscreteValuationRing.exists_units_eq_smul_zpow_of_irreducible` — Mathlib/RingTheory/DiscreteValuationRing/Basic.lean. For a DVR R with fraction field K and an irreducible ϖ, every x ≠ 0 in K is u • (algebraMap ϖ)^n with u : Rˣ, n : ℤ. statement read at the pinned commit (Basic.lean:349)

- `mathlib:ValuationSubring.unitGroupToResidueFieldUnits` — Mathlib/RingTheory/Valuation/ValuationSubring.lean. The monoid homomorphism A.unitGroup →* (ResidueField A)ˣ. statement read at the pinned commit (ValuationSubring.lean:722)

- `tauceti:TauCeti.Place.residueUnit` — TauCeti/FieldTheory/FunctionField/Place/Residue.lean. The residue at a place P of f ∈ Fˣ with P.ord f = 0, as a unit of the residue field; it is unitGroupToResidueFieldUnits at f. statement read at the pinned commit (Residue.lean:113)

- `tauceti:TauCeti.Place.finite_setOf_ord_ne_zero` — TauCeti/FieldTheory/FunctionField/Place/Zeros.lean. {P | P.ord x ≠ 0} is finite, under the hypothesis IsFunctionField k F (F finite over k(x) for a transcendental x): the function-field case only. statement read at the pinned commit (Zeros.lean:461)

- `tauceti:TauCeti.Place.ratFuncEquiv` — TauCeti/FieldTheory/FunctionField/Place/RatFunc/Basic.lean. Option (HeightOneSpectrum k[X]) ≃ Place k (RatFunc k), none ↦ the place at infinity. statement read at the pinned commit (RatFunc/Basic.lean:330)

- `tauceti:TauCeti.Place.heightOneSpectrumEquiv` — TauCeti/FieldTheory/FunctionField/AffineModel/Prime.lean. The bijection between places finite on an affine model R and HeightOneSpectrum R. The matching of valuations and residue degrees is not part of it: it is TauCeti.Place.valuation_ofPrime (Prime.lean:100) and TauCeti.Place.degree_ofPrime (Prime.lean:286) in the same file. statement read at the pinned commit (Prime.lean:140)

- `mathlib:Ideal.sum_ramification_inertia_eq_finrank` — Mathlib/RingTheory/RamificationInertia/Basic.lean. For a domain R, S finite and flat over R and p a prime of R, ∑_{q over p} e(q) f(q) = Module.finrank R S — the rank of S over R, not the field degree; for a DVR and its integral closure in a finite separable extension the two agree by IsIntegralClosure.rank (Mathlib/RingTheory/DedekindDomain/IntegralClosure.lean:192). The module is RingTheory, not NumberTheory; the NumberTheory file has only the deprecated Ideal.sum_ramification_inertia. statement read at the pinned commit (RingTheory/RamificationInertia/Basic.lean:72)

- `mathlib:Ideal.relNorm_singleton` — Mathlib/RingTheory/Ideal/Norm/RelNorm.lean. For Dedekind R ⊆ S, S finite and torsion-free over R, relNorm R (span {r}) = span {Algebra.intNorm R S r}: the integral norm, which is the field norm on integral elements by Algebra.algebraMap_intNorm (IntegralRestrict.lean:410). statement read at the pinned commit (RelNorm.lean:301)

- `mathlib:Algebra.norm` — Mathlib/RingTheory/Norm/Defs.lean. The norm S →* R of an R-algebra (1 when S is not finite free). statement read at the pinned commit (Defs.lean:61)

- `mathlib:Algebra.norm_norm` — Mathlib/RingTheory/Norm/Transitivity.lean. norm R (norm S a) = norm R a for a tower R → S → A with S free over R and A free over S. statement read at the pinned commit (Transitivity.lean:207)

- `tauceti:TauCeti.Divisor.eval_eq_prod_normResidue` — TauCeti/FieldTheory/FunctionField/Divisor/Eval.lean. For f a unit at every place of D, f(D) = ∏_{P ∈ supp D} N(f(P))^{n_P}. statement read at the pinned commit (Eval.lean:192)

- `mathlib:AlgebraicGeometry.Scheme.ord` — Mathlib/AlgebraicGeometry/OrderOfVanishing.lean. The order of vanishing of f in the function field of a locally Noetherian integral scheme at a point z, with junk value 0 unless coheight z = 1. statement read at the pinned commit (OrderOfVanishing.lean:52)

- `mathlib:TrivSqZeroExt` — Mathlib/Algebra/TrivSqZeroExt/Basic.lean. The trivial square-zero extension R ⊕ M, the test ring of T.6. statement read at the pinned commit (Basic.lean:69)

- `tauceti:TauCeti.kummerMap` — TauCeti/FieldTheory/GaloisCohomology/Kummer.lean. For n invertible in K, the Kummer map Kˣ →* Multiplicative (H¹(G_K, KummerCoeff K n)), the connecting map of the Kummer sequence; surjectivity (Hilbert 90) is not in the library. statement read at the pinned commit (Kummer.lean:187)

- `tauceti:TauCeti.ContCohomology.explicitCup11` — TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/Product.lean. The (1,1) cup H¹(G, M) →+ H¹(G, N) →+ H²(G, P) for a G-equivariant, jointly continuous biadditive pairing M →+ N →+ P, on explicit continuous cochains. statement read at the pinned commit (Cup/Product.lean:577)

- `mathlib:Units` — Mathlib/Algebra/Group/Units/Defs.lean. The group of units of a monoid. statement read at the pinned commit (Defs.lean:49)

- `mathlib:ZMod` — Mathlib/Data/ZMod/Defs.lean. The integers modulo n, the scalar module of the trivialisations of T.7. statement read at the pinned commit (ZMod/Defs.lean:142)

- `tauceti:Valuation.ord` — TauCeti/RingTheory/Valuation/Discrete/Order.lean. The additive order ord_v f = −log v(f) of a ℤᵐ⁰-valued valuation (junk value 0 at 0), the exponent in the tame symbol. statement read at the pinned commit (TauCeti/RingTheory/Valuation/Discrete/Order.lean:32)

- `tauceti:Valuation.exists_isUniformizer_of_surjective` — TauCeti/RingTheory/Valuation/Discrete/Order.lean. A surjective ℤᵐ⁰-valued valuation has a uniformiser, the t fixed in the definition of the tame symbol. statement read at the pinned commit (TauCeti/RingTheory/Valuation/Discrete/Order.lean:238)

- `tauceti:Valuation.ord_mul` — TauCeti/RingTheory/Valuation/Discrete/Order.lean. ord_v(fg) = ord_v f + ord_v g for f, g ≠ 0: bimultiplicativity and the homomorphism d_t. statement read at the pinned commit (TauCeti/RingTheory/Valuation/Discrete/Order.lean:61)

- `tauceti:Valuation.ord_zpow` — TauCeti/RingTheory/Valuation/Discrete/Order.lean. ord_v(f^n) = n·ord_v f, used to see that f^{ord g}g^{−ord f} has order zero. statement read at the pinned commit (TauCeti/RingTheory/Valuation/Discrete/Order.lean:83)

- `tauceti:Valuation.isUnit_iff_ord_eq_zero` — TauCeti/RingTheory/Valuation/Discrete/Order.lean. An element of the valuation subring is a unit iff its order is zero: the uniformiser-free form of the tame symbol and the change unit t′/t. statement read at the pinned commit (TauCeti/RingTheory/Valuation/Discrete/Order.lean:244)

- `tauceti:Valuation.mem_maximalIdeal_iff_ord_pos` — TauCeti/RingTheory/Valuation/Discrete/Order.lean. An element is in the maximal ideal iff its order is positive: the cases of the Steinberg relation. statement read at the pinned commit (TauCeti/RingTheory/Valuation/Discrete/Order.lean:272)

- `tauceti:Valuation.ord_add_eq_min_of_ord_ne` — TauCeti/RingTheory/Valuation/Discrete/Order.lean. The strict triangle equality ord(f + g) = min(ord f, ord g) when the orders differ: ord(1 − r) = ord r for ord r < 0. statement read at the pinned commit (TauCeti/RingTheory/Valuation/Discrete/Order.lean:148)

- `mathlib:ValuationSubring.surjective_unitGroupToResidueFieldUnits` — Mathlib/RingTheory/Valuation/ValuationSubring.lean. The residue map from the units of a valuation subring to the units of its residue field is onto: surjectivity of the tame symbol and of the higher residues. statement read at the pinned commit (Mathlib/RingTheory/Valuation/ValuationSubring.lean:739)

- `mathlib:ValuationSubring.ker_unitGroupToResidueFieldUnits` — Mathlib/RingTheory/Valuation/ValuationSubring.lean. The kernel of that residue map is the principal unit group 1 + 𝔪: the kernel of Serre's map. statement read at the pinned commit (Mathlib/RingTheory/Valuation/ValuationSubring.lean:731)

- `mathlib:IsDedekindDomain.HeightOneSpectrum.Support.finite` — Mathlib/RingTheory/DedekindDomain/FiniteAdeleRing.lean. An element of the fraction field of a Dedekind domain has a pole at only finitely many height-one primes; applied to f and f⁻¹ it gives finiteness of {v : ord_v f ≠ 0}. statement read at the pinned commit (Mathlib/RingTheory/DedekindDomain/FiniteAdeleRing.lean:51)

- `tauceti:TauCeti.HenselianRing.exists_pow_eq_and_sub_one_mem_of_sub_one_mem` — TauCeti/RingTheory/Henselian.lean. In a ring Henselian at J, for n invertible and I ≤ J, every w ≡ 1 mod I is a^n with a ≡ 1 mod I: q-divisibility of the principal units in rigidity. statement read at the pinned commit (TauCeti/RingTheory/Henselian.lean:46)

- `mathlib:HenselianRing` — Mathlib/RingTheory/Henselian.lean. Rings Henselian at an ideal; Mathlib's instance IsAdicComplete.henselianRing (same file, line 170; an instance, absent from the declaration index) makes an adically complete ring Henselian at its ideal. statement read at the pinned commit (Mathlib/RingTheory/Henselian.lean:94)

- `tauceti:TauCeti.Place.adicOfIrreducibleResidueFieldEquiv` — TauCeti/FieldTheory/FunctionField/Place/RatFunc/Basic.lean. The residue field of the finite place of an irreducible q ∈ k[X] is k[X]/(q), as a k-algebra equivalence. statement read at the pinned commit (TauCeti/FieldTheory/FunctionField/Place/RatFunc/Basic.lean:259)

- `tauceti:TauCeti.Place.isUniformizer_adicOfIrreducible` — TauCeti/FieldTheory/FunctionField/Place/RatFunc/Basic.lean. An irreducible polynomial is a uniformiser of its own finite place of k(x). statement read at the pinned commit (TauCeti/FieldTheory/FunctionField/Place/RatFunc/Basic.lean:246)

- `tauceti:TauCeti.Place.ord_infty` — TauCeti/FieldTheory/FunctionField/Place/RatFunc/Basic.lean. The order at infinity is minus the degree: ord_∞ f = −intDegree f. statement read at the pinned commit (TauCeti/FieldTheory/FunctionField/Place/RatFunc/Basic.lean:125)

- `tauceti:TauCeti.Place.isUniformizer_infty` — TauCeti/FieldTheory/FunctionField/Place/RatFunc/Basic.lean. x⁻¹ is a uniformiser at the place at infinity. statement read at the pinned commit (TauCeti/FieldTheory/FunctionField/Place/RatFunc/Basic.lean:131)

- `tauceti:TauCeti.Place.inftyResidueFieldEquiv` — TauCeti/FieldTheory/FunctionField/Place/RatFunc/Basic.lean. The residue field at infinity is k. statement read at the pinned commit (TauCeti/FieldTheory/FunctionField/Place/RatFunc/Basic.lean:199)

- `tauceti:TauCeti.Place.restrict` — TauCeti/FieldTheory/FunctionField/Place/Extension/Basic.lean. The place of F/k that a place of a finite extension F′/k′ lies over. statement read at the pinned commit (TauCeti/FieldTheory/FunctionField/Place/Extension/Basic.lean:283)

- `tauceti:TauCeti.Place.finite_setOf_restrict_eq` — TauCeti/FieldTheory/FunctionField/Place/Extension/Fibre.lean. A place has only finitely many extensions to a finite extension of function fields. statement read at the pinned commit (TauCeti/FieldTheory/FunctionField/Place/Extension/Fibre.lean:316)

- `tauceti:TauCeti.Place.normResidue` — TauCeti/FieldTheory/FunctionField/Place/Residue.lean. The norm to k of the residue of a function that is a unit at a place (Algebra.normUnits of residueUnit). statement read at the pinned commit (TauCeti/FieldTheory/FunctionField/Place/Residue.lean:140)

- `tauceti:TauCeti.Divisor.principal` — TauCeti/FieldTheory/FunctionField/Divisor/Principal.lean. The principal divisor div z = Σ_P ord_P(z)·P of a nonzero function. statement read at the pinned commit (TauCeti/FieldTheory/FunctionField/Divisor/Principal.lean:134)

- `mathlib:Module.Relations` — Mathlib/Algebra/Module/Presentation/Basic.lean. Generators and relations for a module: index types G, R and the relation vectors in G →₀ A. statement read at the pinned commit (Mathlib/Algebra/Module/Presentation/Basic.lean:55)

- `mathlib:Module.Relations.Solution` — Mathlib/Algebra/Module/Presentation/Basic.lean. Elements of a module satisfying the given relations. statement read at the pinned commit (Mathlib/Algebra/Module/Presentation/Basic.lean:127)

- `mathlib:Module.Relations.Solution.fromQuotient` — Mathlib/Algebra/Module/Presentation/Basic.lean. The linear map from the presented module to the target induced by a solution. statement read at the pinned commit (Mathlib/Algebra/Module/Presentation/Basic.lean:172)

- `mathlib:Module.Relations.Solution.surjective_fromQuotient_iff_surjective_π` — Mathlib/Algebra/Module/Presentation/Basic.lean. fromQuotient is onto iff the map from the free module is onto. statement read at the pinned commit (Mathlib/Algebra/Module/Presentation/Basic.lean:268)

- `mathlib:Module.Relations.Solution.surjective_π_iff_span_eq_top` — Mathlib/Algebra/Module/Presentation/Basic.lean. The map from the free module is onto iff the values of the generators span. statement read at the pinned commit (Mathlib/Algebra/Module/Presentation/Basic.lean:274)

- `mathlib:Module.Relations.Solution.IsPresentation` — Mathlib/Algebra/Module/Presentation/Basic.lean. The solution is a presentation: fromQuotient is bijective. statement read at the pinned commit (Mathlib/Algebra/Module/Presentation/Basic.lean:283)

- `mathlib:Module.Presentation` — Mathlib/Algebra/Module/Presentation/Basic.lean. A presentation of a module by generators and relations, bundling relations, a solution and IsPresentation. statement read at the pinned commit (Mathlib/Algebra/Module/Presentation/Basic.lean:494)

- `mathlib:Function.Surjective.bijective_of_nat_card_le` — Mathlib/SetTheory/Cardinal/Finite.lean. A surjection from a finite set onto a set of at least the same cardinality is bijective. statement read at the pinned commit (Mathlib/SetTheory/Cardinal/Finite.lean:132)

- `mathlib:Set.integer` — Mathlib/RingTheory/DedekindDomain/SInteger.lean. The S-integers of the fraction field of a Dedekind domain, for a set S of height-one primes. statement read at the pinned commit (Mathlib/RingTheory/DedekindDomain/SInteger.lean:65)

- `mathlib:IsDedekindDomain.HeightOneSpectrum` — Mathlib/RingTheory/DedekindDomain/Ideal/Lemmas.lean. The nonzero prime ideals of a Dedekind domain. statement read at the pinned commit (Mathlib/RingTheory/DedekindDomain/Ideal/Lemmas.lean:493)

- `mathlib:IsDedekindDomain.HeightOneSpectrum.valuation` — Mathlib/RingTheory/DedekindDomain/AdicValuation.lean. The v-adic valuation on the fraction field attached to a height-one prime. statement read at the pinned commit (Mathlib/RingTheory/DedekindDomain/AdicValuation.lean:321)

- `mathlib:NumberField.RingOfIntegers` — Mathlib/NumberTheory/NumberField/Basic.lean. The ring of integers of a number field. statement read at the pinned commit (Mathlib/NumberTheory/NumberField/Basic.lean:104)

- `mathlib:NumberField.InfinitePlace.IsReal` — Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean. A real infinite place of a number field. statement read at the pinned commit (Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean:185)

- `mathlib:Algebra.norm_eq_prod_roots` — Mathlib/RingTheory/Norm/Transitivity.lean. The norm of x is the product of the roots of its minimal polynomial in a splitting field, to the power [L : K⟮x⟯]. statement read at the pinned commit (Mathlib/RingTheory/Norm/Transitivity.lean:258)

- `mathlib:Polynomial.resultant_eq_prod_eval` — Mathlib/RingTheory/Polynomial/Resultant/Basic.lean. If f splits, Res(f, g) = lead(f)^n · ∏ g(α) over the roots α of f. statement read at the pinned commit (Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:478)

- `mathlib:IntermediateField.adjoinRootEquivAdjoin` — Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean. AdjoinRoot (minpoly F α) ≃ₐ[F] F⟮α⟯ for α integral. statement read at the pinned commit (Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean:417)

- `mathlib:Polynomial.modByMonic` — Mathlib/Algebra/Polynomial/Div.lean. Remainder on division by a monic polynomial. statement read at the pinned commit (Mathlib/Algebra/Polynomial/Div.lean:137)

- `mathlib:Polynomial.degree_modByMonic_lt` — Mathlib/Algebra/Polynomial/Div.lean. The remainder modulo a monic q has degree less than that of q. statement read at the pinned commit (Mathlib/Algebra/Polynomial/Div.lean:147)

- `mathlib:Sylow` — Mathlib/GroupTheory/Sylow.lean. Sylow p-subgroups of a group. statement read at the pinned commit (Mathlib/GroupTheory/Sylow.lean:55)

- `mathlib:TrivSqZeroExt.commRing` — Mathlib/Algebra/TrivSqZeroExt/Basic.lean. TrivSqZeroExt R M is a commutative ring for R commutative and M an R-module with the central Rᵐᵒᵖ-action. statement read at the pinned commit (Basic.lean:665)

- `mathlib:TrivSqZeroExt.kerIdeal` — Mathlib/Algebra/TrivSqZeroExt/Ideal.lean. The ideal 0 ⊕ M of TrivSqZeroExt R M, the kernel of fstHom. statement read at the pinned commit (Ideal.lean:30)

- `mathlib:TrivSqZeroExt.kerIdeal_sq` — Mathlib/Algebra/TrivSqZeroExt/Ideal.lean. kerIdeal R M ^ 2 = ⊥. statement read at the pinned commit (Ideal.lean:38)

- `mathlib:TrivSqZeroExt.isUnit_iff_isUnit_fst` — Mathlib/Algebra/TrivSqZeroExt/Basic.lean. x is a unit of TrivSqZeroExt R M iff x.fst is a unit of R. statement read at the pinned commit (Basic.lean:756)

- `tauceti:TauCeti.KummerCoeff` — TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean. μₙ = rootsOfUnity n Kˢ written additively, a discrete G_K-module (kummerCoeff_continuousSMul): the weight-one twist, fixed once as the Kummer coefficient module. statement read at the pinned commit (Coefficients.lean:107)

- `tauceti:TauCeti.ker_kummerMap` — TauCeti/FieldTheory/GaloisCohomology/Kummer.lean. The kernel of kummerMap is the subgroup of n-th powers. statement read at the pinned commit (Kummer.lean:260)

- `tauceti:TauCeti.ContCohomology.explicitCup11_eq_neg_flip` — TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/Product.lean. explicitCup11 μ a b = −explicitCup11 μ.flip b a on classes. statement read at the pinned commit (Cup/Product.lean:760)

- `mathlib:modularCyclotomicCharacter` — Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean. For L with n n-th roots of unity, (L ≃+* L) →* (ZMod n)ˣ with g(t) = t^(χ g) on μₙ (modularCyclotomicCharacter.spec). statement read at the pinned commit (CyclotomicCharacter.lean:212)

- `mathlib:IsPrimitiveRoot.zmodEquivZPowers` — Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean. For ζ primitive of order k, ZMod k ≃+ Additive (Subgroup.zpowers ζ). statement read at the pinned commit (PrimitiveRoots.lean:462)

- `mathlib:IsPrimitiveRoot.zpowers_eq` — Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean. In a domain, the powers of a primitive k-th root of unity (as a unit) are all of rootsOfUnity k R. statement read at the pinned commit (PrimitiveRoots.lean:517)

- `mathlib:rootsOfUnity` — Mathlib/RingTheory/RootsOfUnity/Basic.lean. The subgroup {ζ : Mˣ | ζ^k = 1}, the target μ_m of the norm residue symbol. statement read at the pinned commit (RootsOfUnity/Basic.lean:56)

- `tauceti:IsDedekindDomain.integerHeightOneSpectrumEquiv` — TauCeti/RingTheory/DedekindDomain/SInteger/Spectrum.lean. For a Dedekind domain R with fraction field K and a set S of height-one primes, {v : HeightOneSpectrum R // v ∉ S} ≃ HeightOneSpectrum (S.integer K): the primes of the S-integers are exactly the primes of R outside S. The declaration is in namespace IsDedekindDomain, not TauCeti. statement read at the pinned commit (Spectrum.lean:180)

- `tauceti:WeierstrassCurve.Affine.isFunctionField` — TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/Finrank.lean. For a Weierstrass curve W over a field F, TauCeti.IsFunctionField F W.FunctionField: the function field of W is an algebraic function field of one variable over F (no ellipticity hypothesis). statement read at the pinned commit (Finrank.lean:183)

- `tauceti:TauCeti.Divisor.eval` — TauCeti/FieldTheory/FunctionField/Divisor/Eval.lean. f(D) ∈ kˣ for a divisor D and f ∈ Fˣ, the product over the support of N_{k(P)/k}(f(P))^{coeff D P}, with local factor 1 where f is not a unit; classical exactly on admissible divisors. statement read at the pinned commit (Eval.lean:118)

- `tauceti:TauCeti.Divisor.isUnitAtSupport_iff_disjoint` — TauCeti/FieldTheory/FunctionField/Divisor/Eval.lean. For hF : IsFunctionField k F, a divisor D and f ∈ Fˣ: IsUnitAtSupport D f ↔ Disjoint D.support (principal hF f).support. statement read at the pinned commit (Eval.lean:310)

- `tauceti:TauCeti.Place.sum_ramificationIdx_mul_relativeDegree_eq_finrank_of_isSeparable` — TauCeti/FieldTheory/FunctionField/Place/Extension/Fundamental.lean. For a finite separable extension F'/F of function fields and a place P of F/k, Σ_{P'|P} e(P'|P)·f(P'|P) = [F' : F]; the file records that separability is used only for the finiteness of the integral closure. statement read at the pinned commit (Fundamental.lean:77)

- `tauceti:TauCeti.IsIntegralClosure.finite_mvPolynomial_of_isPurelyInseparable` — TauCeti/RingTheory/IntegralClosure/PurelyInseparable.lean. For a field k, P = k[X_1, …, X_r] with fraction field K and a finite purely inseparable extension M/K, every integral closure of P in M is a finite P-module (Stacks 032O); no separability is assumed. The declaration is in namespace TauCeti. statement read at the pinned commit (PurelyInseparable.lean:167)

- `mathlib:rootsOfUnity_one` — Mathlib/RingTheory/RootsOfUnity/Basic.lean. rootsOfUnity 1 M = ⊥; the same file supplies Subsingleton (rootsOfUnity 1 M), so every first-root-valued symbol and finite-place family is 1. statement and subsingleton instance read at the pinned commit (Basic.lean:78 and 111), FIX-RT-BP-K2SymbolsBrauer--T.3

- `mathlib:DualNumber` — Mathlib/Algebra/DualNumber.lean. DualNumber R abbreviates TrivSqZeroExt R R. Iterating it over ZMod 3 supplies the actual ring F_3[x,y]/(x²,y²) of the relative D3 non-example. definition read at the pinned commit (DualNumber.lean:46), FIX-RT-BP-K2SymbolsBrauer--T.3

- `mathlib:DualNumber.eps` — Mathlib/Algebra/DualNumber.lean. The element TrivSqZeroExt.inr 1 of DualNumber R; eps_mul_eps and eps_pow_two in the same file assert it squares to zero. definition and square-zero statements read at the pinned commit (DualNumber.lean:50, 82), FIX-RT-BP-K2SymbolsBrauer--T.3

- `mathlib:IsLocalRing.ResidueField.map` — Mathlib/RingTheory/LocalRing/ResidueField/Basic.lean. A ring homomorphism between local rings induces a residue-field map only with an IsLocalHom instance; positivity of the valuation ramification index supplies that instance. map_residue is the compatibility used in its test. map and map_residue statements read at the pinned commit (Basic.lean:96, 121), FIX-RT-BP-K2SymbolsBrauer--T.3

- `mathlib:Ideal.mul_mem_left` — Mathlib/RingTheory/Ideal/Defs.lean. If b ∈ I, then a*b ∈ I; derives the relative D3 pair witnesses from the entry-in-ideal guard. statement read at the pinned commit (Defs.lean:61), FIX-RT-BP-K2SymbolsBrauer--T.3

- `mathlib:Ideal.mul_mem_right` — Mathlib/RingTheory/Ideal/Defs.lean. For a two-sided ideal and a ∈ I, a*b ∈ I; commutative-ring ideals have this instance. Derives the remaining relative D3 pair witnesses. statement and commutative instance read at the pinned commit (Defs.lean:64), FIX-RT-BP-K2SymbolsBrauer--T.3

- `mathlib:IsIntegralClosure.finite` — Mathlib/RingTheory/DedekindDomain/IntegralClosure.lean. Finite separable extension of the fraction field of a normal Noetherian domain: its integral closure is a finite module; full statement and trace-dual proof read at pin,lines147–178. statement read at pinned commits2026-10-02

- `tauceti:TauCeti.IsIntegralClosure.tower_bot` — TauCeti/RingTheory/IntegralClosure/Transfer.lean. If A is integral over R and C is its integral closure in B, C is also the R-closure;full statement/proof readlines45–60. statement read at pinned commits2026-10-02

- `tauceti:TauCeti.IsIntegralClosure.finite_of_injective` — TauCeti/RingTheory/IntegralClosure/Transfer.lean. Over Noetherian A, finite integral closure descends along an injective A-algebra map of top rings;full statement/proof readlines65–82. statement read at pinned commits2026-10-02

- `mathlib:AdicCompletion.ofTensorProductEquivOfFiniteNoetherian` — Mathlib/RingTheory/AdicCompletion/AsTensorProduct.lean. For finite M over Noetherian R, completion(R)⊗R M is linearly equivalent to completion(M);readlines320–345. Algebra structure and finite-product splitting are additional proof obligations, not already provided by this linear equivalence. statement read at pinned commits2026-10-02

- `mathlib:Submodule.natAbs_det_basis_change` — Mathlib/LinearAlgebra/FreeModule/Finite/CardQuotient.lean. For a full-rank Z-submodule N with a basis indexed like the ambient finite free module, the absolute determinant of the basis-change matrix equals Nat.card(M/N). Full statement and proof read at the mathlib pin,lines33–95,2026-10-02. statement and proof read at pinned commit

## Sources and actual reading coverage

### The K-book: An Introduction to Algebraic K-theory

Charles A. Weibel. Author-hosted combined draft dated 29 August 2013 (published as Graduate Studies in Mathematics 145, American Mathematical Society, 2013)..

[Source](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf)

SHA-256: `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.

**Read scope.**

- III.5.10-III.5.11.1: the Steinberg symbol and the Dennis-Stein symbols with their relations and presentation (PDF pp. 233-234)
- III.6.2.2-III.6.4.2: Hilbert symbols, norm-residue symbols, Moore's theorem, the tame symbol with its proof and the ramification formula, and the Bass-Tate divisibility theorems (PDF pp. 241-243)
- III.7.3-III.7.3.1: higher tame symbols, specialisation maps and rigidity (PDF p. 254)
- III.1.5.4 (PDF p. 193): a Dedekind domain with nonzero SK_1
- III.2.5 (PDF p. 202): the Bass-Milnor-Serre theorem, statement
- III.5.2.2 (PDF p. 226): K_2(Z) cyclic of order two, cited to Milnor
- III.6.1-III.6.2.1 (PDF pp. 239-240): Matsumoto, K_2 of finite fields, Lemma 6.1.4, the sign symbol
- III.6.5-III.6.5.3 (PDF p. 244): localisation for Dedekind domains, K_2(Q), function fields, Weil reciprocity on the projective line
- III Exercises 6.2 and 6.4 (PDF p. 251)
- III.7.1-III.7.6.4 (PDF pp. 253-258): Milnor K-theory, leading coefficients, Theorem 7.4 (Milnor) with Lemmas 7.4.1-7.4.2, Definitions 7.5-7.6, Weil's formula 7.5.1, the projection formula 7.5.2 and Corollary 7.5.3, Kato's theorem with Lemma 7.6.2, Corollary 7.6.3 and Proposition 7.6.4
- III Exercises 7.1-7.10 (PDF pp. 265-266)
- V.6.1-V.6.1.2 (PDF p. 414): the localization sequence and its boundary on units
- V.6.6-V.6.6.4 and V.6.8 (PDF pp. 417-420): localisation for Dedekind domains, the boundary is the tame symbol, Soulé's theorem
- V.6.12-V.6.12.1 (PDF pp. 424-425): Weil reciprocity for a projective curve (Gillet)
- III.5.7-III.5.7.1 (PDF pp. 230-231): the relative Steinberg group and the relative exact sequence
- III.5.11.1(b) (PDF p. 235) and Exercises III.5.13-III.5.14 (PDF pp. 237-238)
- III.6.9-III.6.10.4 (PDF pp. 248-251): the Galois symbol, roots of unity and Tate's comparison
- III Exercises 6.7-6.8 (PDF p. 252)
- IV.1.11 (PDF pp. 275-276): the relative groups as homotopy fibres
- V.11.9-V.11.10 (PDF p. 464): étale Chern classes on K_1 and K_2
- The author's errata list for the published edition (Wayback copy of Kbook.errata.pdf; see sourceVersions)

### The K-book: An introduction to algebraic K-theory, Chapter III: K1 and K2 of a ring

Charles A. Weibel. Author's online chapter file Kbook.III.pdf; the page numbers cited are the chapter's own printed page numbers (III.6.5 is on p. 52), which differ from the combined draft's PDF pages..

[Source](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.III.pdf)

SHA-256: `ba1bc2d25680ab25c4baadc5ab28e39d1077dc66bb12ca4e2174b6cb55f81307`.

**Read scope.**

- III.1.7-III.1.7.1 (pp. 8-9): transfer maps on K_1, and the transfer of a finite field extension is the norm
- III.5.6-III.5.6.3 (p. 39): the finite transfer on K_2 and restriction followed by transfer
- III Exercise 5.6 (p. 46): the projection formula for the K_2 transfer
- III.6.1.4-III.6.1.6 (p. 49): K_2 of a quadratic extension and its transfer
- III.6.5-III.6.5.3 (pp. 52-53): the localisation theorem for K_2 of a Dedekind domain, K_2(Q), function fields, Weil's formula
- III.7.5-III.7.6.4 and the proof of Theorem 7.6.1 (pp. 63-66): the Milnor transfer, Weil's formula 7.5.1, Kato's theorem with Lemma 7.6.2, Corollary 7.6.3 and Proposition 7.6.4
- III Exercises 7.5-7.10 (pp. 72-73)

### The K-book: An introduction to algebraic K-theory, Chapter V: The fundamental theorems of higher K-theory

Charles A. Weibel. Author's online chapter file Kbook.V.pdf; the page numbers cited are the chapter's own printed page numbers (V.6.6 is on p. 41)..

[Source](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf)

SHA-256: `52dcc8ee3a1764e5ea309c59f093ac8e2a1ea64f3b94bacc05e6a2b6125b1da8`.

**Read scope.**

- V.6.1-V.6.1.2 (p. 38): the localisation sequence for S^{-1}R and its boundary on units
- V.6.6-V.6.6.4 (pp. 41-42): localisation for Dedekind domains, the boundary is the tame symbol, and the morphism of localisation sequences for a finite extension of Dedekind domains
- V.6.7-V.6.8.1 (pp. 42-45): the split sequences for a discrete valuation ring containing a field, and Soule's theorem
- V.6.12-V.6.12.1 (p. 48): the localisation sequence of a curve and Gillet's Weil reciprocity for a projective curve

### The Milnor ring of a global field, with Tate’s appendix

Hyman Bass and John Tate; appendix by John Tate. Published chapter in Algebraic K-theory II, Lecture Notes in Mathematics342 (1973), pp.349–446. The downloaded file is the entire536-page volume, not a standalone article..

[Source](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/SLN342.pdf)

SHA-256: `cb73e6fc75fe941510b8999176b1c952d0d088b4f599d16d0b9b77ba8de15b55`.

**Read scope.**

- ChapterII §3, own pp.56–60/PDF413–417, the S-unit filtration and Lemma3.2 proof; own pp.63–64/PDF420–421, Claim2 and its norm-congruence proof. AppendixA1–A8/PDF439–446, global-unit criterion, geometric bound and Gaussian computation, read in full. ImagesA5/PDF443 andA8/PDF446 verify the inequalities and three Gaussian relations. Other quadratic computations in A9–A18 are not used or claimed read.

### Central Simple Algebras and Galois Cohomology

Philippe Gille and Tamás Szamuely. Cambridge Studies in Advanced Mathematics101,first edition2006; professor-hosted PDF.

[Source](https://www.math.ens.psl.eu/~benoist/refs/Gille-Szamuely.pdf)

SHA-256: `3697582f57a11547addeb8d5d63764d788b9d670e2bd76bd7401b9f3994f1e63`.

**Read scope.**

- Section7.3, pp196–203/PDF210–217, and7.4.1–7.4.4, pp204–206/PDF218–220, full proofs read2026-10-02. AppendixA.6, pp312–314/PDF326–328, statements/references read; Serre’s referenced normalization proof was not read. The all-finite base-change multiplicity on p197 needs the correction recorded in sourceIssues. Residues use uniformizer-first; transport to last by(−1)^(n−1).

### Japanese rings and normal algebraic extensions

The Stacks Project Authors. Online tags032N,032L,032O and030M accessed2026-10-02.

[Source](https://stacks.math.columbia.edu/tag/032N)

**Read scope.**

- Full032N and032L proofs;032O proof;030M statement and its “details omitted” proof boundary. The orbit argument in mixed-function-field-normalization is a worker completion of the needed direction.

### Groupes arithmétiques et K-théorie des anneaux d’entiers de corps de nombres

Christophe Soulé. Author-hosted typeset thesis transcription; original thesis1979. This copy has unresolved bibliography placeholders; it is not asserted identical to the Inventiones article..

[Source](https://www.ihes.fr/~/soule/documents/These_Christophe_Soule.pdf)

SHA-256: `19bb0877616c262fcb83c9fe6ad88f98747f117f23805b6154e19174dbb659a7`.

**Read scope.**

- 2.2.1.1 pp33–34;2.2.2.1–2.2.2.3 pp39–45, full product-rule proof;2.2.4.3.1 formula and2.2.4.4 symbol paragraph pp52–53 read2026-10-02. The local/global Tate theorem and later S-integer proof are not claimed proved/read here.

### Class Field Theory

James S. Milne. Version4.03,6August2020; author PDF fetched2026-10-02.

[Source](https://www.jmilne.org/math/CourseNotes/CFT.pdf)

SHA-256: `50d79af78250a9f1117ad9d337e0b231704a533fc707966ed1bfa52e13d498f5`.

**Read scope.**

- III.3 pp107–109 andIII.4 pp110–114 read2026-10-02. Proposition3.6’s character-evaluation identity is stated and cited to Serre, not proved in these notes. The Hilbert-symbol comparison below imports that precise CFT supplier identity, and explicitly records this proof boundary.

### Cardinal of quotient of finite free integer modules

Anne Baanen, Alex J. Best and Xavier Roblot. Mathlib pin082e2d37e8b0463410cdb532e111cd43d5a66174.

[Source](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/FreeModule/Finite/CardQuotient.lean)

**Read scope.**

- Full determinant/cardinality proof and basis-change corollary,lines33–95, read2026-10-02. Submodule.smithNormalForm statement/implementation was also read in FreeModule/PID.lean524–548.

## Declarations and proof obligations

### The tame symbol of a discrete valuation

`K2SymbolsBrauer:T.3/tame-symbol` · definition · parent `K2SymbolsBrauer:T.3:symbols` · implementation unchecked

Let v be a discrete valuation on the field F, taken as a surjective valuation v : F → ℤᵐ⁰ with additive order ord_v (Tau Ceti's Valuation.ord, so a uniformiser has order one), valuation ring R, residue field k and residue map R^× → k^×, u ↦ ū. Fix a uniformiser t. Every f ∈ F^× is uniquely f = t^{ord_v f}·u_f with u_f ∈ R^×. For f, g ∈ F^× define ∂_v{f,g} = (−1)^{ord_v(f)·ord_v(g)} · ū_f^{ord_v(g)} · ū_g^{−ord_v(f)} ∈ k^×. Since f^{v(g)}/g^{v(f)} = u_f^{v(g)}·u_g^{−v(f)}, this is the roadmap's (−1)^{v(f)v(g)}·(f^{v(g)}/g^{v(f)})‾, and the residue map is applied only to the units u_f and u_g. With this convention ∂_v{u,t} = ū and ∂_v{t,u} = ū^{−1} for u ∈ R^×. The K-book's tame symbol (Lemma III.6.3), ∂_v({r,s}) = (−1)^{v(r)v(s)}·(s^{v(r)}/r^{v(s)})‾, equals ∂_v{s,r} = ∂_v{r,s}^{−1} in this notation: it is the inverse of this one. Independence of t is the next node.

**Hypotheses.**

- v : F → ℤᵐ⁰ is a surjective (normalised) discrete valuation on the field F, with valuation ring R, residue field k and a chosen uniformiser t (ord_v t = 1).
- f and g are nonzero elements of F.

**Proof outline.**

1. Choose t by Valuation.exists_isUniformizer_of_surjective, and for f ≠ 0 take u_f ∈ R^× with f = t^{ord_v f}·u_f from Valuation.exists_eq_zpow_mul_unit_of_surjective; it is unique, since u_f = f·t^{−ord_v f}. For a DVR presented as a ring with an irreducible ϖ, IsDiscreteValuationRing.exists_units_eq_smul_zpow_of_irreducible gives the same decomposition.
2. Define ∂_v{f,g} by the displayed formula, applying ValuationSubring.unitGroupToResidueFieldUnits to u_f and u_g only; the integer exponents are taken in the group k^×.
3. Evaluate on the mixed pairs: for u ∈ R^× one has u_u = u and u_t = 1, so ∂_v{u,t} = ū and ∂_v{t,u} = ū^{−1}; for two units both exponents vanish and ∂_v{u,w} = 1.
4. Record the relation to the source: substituting r = f, s = g in Lemma III.6.3 gives (−1)^{v(f)v(g)}·(g^{v(f)}/f^{v(g)})‾ = ∂_v{g,f} = ∂_v{f,g}^{−1}. No formula below is silently reversed; every comparison with the source states this inversion.

**Acceptance.**

- ∂_v{u,t} = ū and ∂_v{t,u} = ū^{−1} for every u ∈ R^×; these two values pin the convention.
- On ℚ with the 5-adic valuation and t = 5: ∂{2,5} = 2, ∂{5,2} = 3, ∂{5,5} = −1 = 4 and ∂{10,5} = 3 in F_5^×. Lemma III.6.3's formula gives ∂_5(5,2) = 2, so the two conventions differ at (5,2).
- The residue map is applied only to the unit parts u_f, u_g ∈ R^×, never to f^{v(g)}/g^{v(f)} regarded as an element of F.

**Prerequisites.**

- `tauceti:Valuation.ord`
- `tauceti:Valuation.exists_isUniformizer_of_surjective`
- `tauceti:Valuation.exists_eq_zpow_mul_unit_of_surjective`
- `mathlib:ValuationSubring.unitGroupToResidueFieldUnits`
- `mathlib:IsDiscreteValuationRing.exists_units_eq_smul_zpow_of_irreducible`
- `tauceti:TauCeti.Place.residueUnit`
- `mathlib:Units`
- `mathlib:IsLocalRing.ResidueField.map`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `tameSymbol` | constructor | For a surjective v : F → ℤᵐ⁰ and f, g ∈ F^×, tameSymbol v f g := (−1)^{ord f·ord g}·res(u_f)^{ord g}·res(u_g)^{−ord f} ∈ k_v^×, with unit parts taken against a uniformiser fixed by choice. |
| `tameSymbol_eq_residue` | characterisation | tameSymbol v f g = (−1)^{ord f·ord g}·res(f^{ord g}·g^{−ord f}), the element f^{ord g}g^{−ord f} lying in R^× (node T.3/tame-symbol-uniformizer-independence). |
| `tameSymbol_unit_uniformizer` | simp | If ord u = 0 and ord t = 1 then tameSymbol v u t = res u. |
| `tameSymbol_uniformizer_unit` | simp | If ord u = 0 and ord t = 1 then tameSymbol v t u = (res u)^{−1}. |
| `tameSymbol_of_ord_eq_zero` | simp | If ord f = ord g = 0 then tameSymbol v f g = 1. |
| `tameSymbol_swap` | relation | tameSymbol v g f = (tameSymbol v f g)^{−1}. |
| `tameSymbol_self` | relation | tameSymbol v f f = (−1)^{ord f}. |
| `tameSymbol_neg_self` | relation | tameSymbol v f (−f) = 1. |
| `tameSymbol_kbook` | compatibility | The K-book's ∂_v({r,s}) of Lemma III.6.3 is tameSymbol v s r = (tameSymbol v r s)^{−1}. |
| `tameSymbol_dvr` | compatibility | For a DVR R with fraction field F and irreducible ϖ, writing f = u_f·ϖ^{n_f}, tameSymbol (the valuation of R) f g = (−1)^{n_f n_g}·ū_f^{n_g}·ū_g^{−n_f}. |
| `tameSymbol_place` | compatibility | For a place P of a function field, a uniformiser t at P and f with P.ord f = 0: tameSymbol P f t = Place.residueUnit P f. |
| `TauCeti.TameSymbol.valuationSubringMap` | functoriality | For a field embedding F → E and discrete valuations with ord_w(f(r)) = e·ord_v(r), e ∈ ℕ, the restricted ring map 𝒪_v →+* 𝒪_w is defined without a finiteness assumption. |
| `TauCeti.TameSymbol.residueFieldMap` | functoriality | For the same embedding, require he : 0 < e. The valuation-ring map is local, since ord_w(f(r)) > 0 iff ord_v(r) > 0 for r ≠ 0, and IsLocalRing.ResidueField.map yields k_v →+* k_w. No finite-dimensionality assumption is used. |

**Consumers.**

- T.3/tame-symbol-hom — the homomorphism out of K^M_2(F) and K_2(F) is induced by this pairing
- T.4's reciprocity — the reciprocity product is over the tame symbols at the closed points
- T.5's tame kernel — the unramified subgroup is cut out by the vanishing of these symbols
- T.3/localization-boundary — the localisation boundary is this symbol with its arguments swapped, i.e. its inverse

**Unit tests.**

- `tameSymbol_rat_five` (computation) — On ℚ with the 5-adic valuation: tameSymbol 2 5 = 2 and tameSymbol 5 2 = 3 in F_5^×.
- `tameSymbol_rat_five_sign` (computation) — On ℚ at 5: tameSymbol 5 5 = 4 = −1 and tameSymbol 10 5 = 3; a definition without the factor (−1)^{v(f)v(g)} gives 1 and 2.
- `tameSymbol_units` (degenerate) — On ℚ at 5: tameSymbol 2 3 = 1, and tameSymbol f 1 = 1 for every f.
- `tameSymbol_ratFunc` (compatibility) — On k(t) at the place t − b (b ∈ k): tameSymbol a (t − b) = a for a ∈ k^×, whereas the K-book's Weil reciprocity 6.5.3 (PDF p. 244) uses ∂_{t−b}(a, t − b) = a^{−1} in its normalisation.
- `tameSymbol_not_kbook` (non-example) — tameSymbol 5 2 = 3 ≠ 2 = ∂_5(5,2) of Lemma III.6.3: a silent use of the source's formula fails this.
- `TauCeti.TameSymbol.residueFieldMap_residue` (compatibility) — For e > 0 and a ∈ 𝒪_v, residueFieldMap v w e he hvw (res_v a) = res_w (valuationSubringMap v w e hvw a).
- `TauCeti.TameSymbol.residueFieldMap_requires_positive` (non-example) — For ℚ → ℚ(u) with w the u-adic valuation, ord_w is zero on every nonzero rational (e = 0). The 5-adic nonunit 5 maps to a unit of 𝒪_w, so the valuation-ring map is not local and no residue-field map F_5 → ℚ is asserted.

**Sources.**

- `Kbook.2013`: Lemma III.6.3 (PDF p. 242). The source's tame symbol, with r, s in the roles of f, g. Its formula is the inverse of the roadmap's (it has s^{v(r)}/r^{v(s)} where the roadmap has f^{v(g)}/g^{v(f)}); this node defines the roadmap's and records the inversion. Surjectivity is proved in T.3/tame-symbol-hom.

### Independence from the uniformiser

`K2SymbolsBrauer:T.3/tame-symbol-uniformizer-independence` · lemma · parent `K2SymbolsBrauer:T.3:symbols` · implementation unchecked

For f, g ∈ F^× the element f^{ord_v g}·g^{−ord_v f} has order zero, hence lies in R^×, and ∂_v{f,g} = (−1)^{ord_v(f)·ord_v(g)}·res(f^{ord_v g}·g^{−ord_v f}). The right-hand side involves no uniformiser, so ∂_v does not depend on the uniformiser t used to form the unit parts: this is the stage's displayed formula, with the bar applied to a unit.

**Hypotheses.**

- v is a surjective discrete valuation on F with valuation ring R and residue field k; t and t′ are uniformisers.
- f and g are nonzero elements of F.

**Proof outline.**

1. ord_v(f^{ord g}·g^{−ord f}) = ord g·ord f − ord f·ord g = 0 by Valuation.ord_mul and Valuation.ord_zpow, so the element lies in R^× (Valuation.isUnit_iff_ord_eq_zero).
2. With f = t^{a}u_f and g = t^{b}u_g (a = ord f, b = ord g): f^{b}g^{−a} = t^{ab}u_f^{b}·t^{−ab}u_g^{−a} = u_f^{b}u_g^{−a}.
3. The residue map R^× → k^× is a group homomorphism, so res(u_f^{b}u_g^{−a}) = ū_f^{b}ū_g^{−a}, and ∂_v{f,g} equals the uniformiser-free expression.
4. For a second uniformiser t′ the same computation gives the same expression; the sign depends only on the orders.

**Acceptance.**

- On ℚ at 5, computing with t = 5 (u_{10} = 2, u_5 = 1) and with t = 10 (u_{10} = 1, u_5 = 1/2) both give ∂{10,5} = 3.
- The sign (−1)^{ord f·ord g} depends only on the orders.
- The residue is taken of a unit of R, as the stage requires.

**Prerequisites.**

- `K2SymbolsBrauer:T.3/tame-symbol`
- `tauceti:Valuation.ord_mul`
- `tauceti:Valuation.ord_zpow`
- `tauceti:Valuation.isUnit_iff_ord_eq_zero`
- `mathlib:ValuationSubring.unitGroupToResidueFieldUnits`

**Sources.**

- `Kbook.2013`: Lemma III.6.3, proof (PDF p. 242). The source computes the symbol through unit parts against one parameter π and never discusses another; the uniformiser-free form of this node is what makes the choice irrelevant. The source's ū2^{v1}/ū1^{v2} is the inverse of the roadmap's ū_f^{ord g}ū_g^{−ord f}.

### The tame symbol is bilinear and satisfies the Steinberg relation

`K2SymbolsBrauer:T.3/tame-symbol-steinberg` · theorem · parent `K2SymbolsBrauer:T.3:symbols` · implementation unchecked

The pairing ∂_v is bimultiplicative, ∂_v{ff′,g} = ∂_v{f,g}·∂_v{f′,g} and ∂_v{f,gg′} = ∂_v{f,g}·∂_v{f,g′}, and satisfies the Steinberg relation ∂_v{r, 1 − r} = 1 for every r ∈ F \ {0,1}. (The induced homomorphism out of K^M_2(F) and K_2(F), and its surjectivity, are T.3/tame-symbol-hom.)

**Hypotheses.**

- v is a surjective discrete valuation on F with valuation ring R, maximal ideal 𝔪 and residue field k.
- f, f′, g, g′ ∈ F^×; r ∈ F with r ≠ 0, 1.

**Proof outline.**

1. Bimultiplicativity: for a fixed uniformiser, u_{ff′} = u_f u_{f′} and ord(ff′) = ord f + ord f′ (Valuation.ord_mul); the sign satisfies (−1)^{(a+a′)b} = (−1)^{ab}(−1)^{a′b} and the residue map is a homomorphism. The second variable is the same.
2. Let s = 1 − r, a = ord r, b = ord s. The cases below are exhaustive: if a ≥ 0 then r ∈ R, so s ∈ R and b ≥ 0; hence a = 0 with b < 0 cannot occur, and a > 0; b > 0 (then a = 0); a = b = 0; a < 0 cover everything.
3. a > 0: r ∈ 𝔪 (Valuation.mem_maximalIdeal_iff_ord_pos), so s is a unit with s̄ = 1 and b = 0; then ∂_v{r,s} = s̄^{−a} = 1. The exponent is −a in this normalisation; the source's ∂_v(r,s) = s̄^{v1} is its inverse, and both are 1.
4. b > 0: symmetrically a = 0, r̄ = 1 and ∂_v{r,s} = r̄^{b} = 1.
5. a = b = 0: all exponents vanish and ∂_v{r,s} = 1.
6. a < 0: ord(1/r) > 0, so ord(1 − r) = ord r (Valuation.ord_add_eq_min_of_ord_ne, as ord 1 = 0 ≠ ord r), i.e. b = a. By the uniformiser-free form, ∂_v{r,s} = (−1)^{a²}·res((r/s)^{a}), and r/s = (−1 + 1/r)^{−1} ≡ −1 mod 𝔪, so ∂_v{r,s} = (−1)^{a}(−1)^{a} = 1.

**Acceptance.**

- The four cases are exhaustive because r ∈ R forces 1 − r ∈ R; all four are written out.
- On ℚ at 5, with r = 1/5 and 1 − r = 4/5 (both of order −1): ∂{1/5, 4/5} = (−1)^{1}·res((1/5)^{−1}·(4/5)^{1}) = −4 = 1 in F_5^×; the formula without the sign factor would give 4.
- The relation holds in both normalisations, each being the other's inverse.

**Prerequisites.**

- `K2SymbolsBrauer:T.3/tame-symbol`
- `K2SymbolsBrauer:T.3/tame-symbol-uniformizer-independence`
- `tauceti:Valuation.ord_mul`
- `tauceti:Valuation.mem_maximalIdeal_iff_ord_pos`
- `tauceti:Valuation.ord_add_eq_min_of_ord_ne`

**Sources.**

- `Kbook.2013`: Lemma III.6.3, proof (PDF p. 242). The first three cases. In the roadmap's normalisation the value in the case v1 > 0 is s̄^{−v1}, the inverse of the source's.
- `Kbook.2013`: Lemma III.6.3, proof (PDF p. 242). The case of negative valuation, where the two orders agree and the sign cancels the residue −1.

### Behaviour under a valued field embedding: the ramification formula

`K2SymbolsBrauer:T.3/ramification-formula` · lemma · parent `K2SymbolsBrauer:T.3:symbols` · implementation unchecked

Let F → E be any field embedding, v and w normalised surjective discrete valuations with ord_w(f(r)) = e·ord_v(r) and e ≥ 1; the induced local map of valuation rings gives k_v → k_w. No finite-dimensionality assumption is needed. Then tameSymbol w r₁ r₂ = (tameSymbol v r₁ r₂)^e in k_w^× for r₁, r₂ ∈ F^×; equivalently ∂_w ∘ res_{E/F} = (·)^e ∘ ∂_v on K^M_2(F). For the finite-extension refinement only, if E/F is finite and w₁, …, w_n are the valuations of E over v (the primes of the integral closure S of R over 𝔪_v) and all e_i = 1, the diagonal k_v^× → ∏_i k_{w_i}^× carries ∂_v(x) to (∂_{w_i}(x))_i. The formula reads the same in the roadmap's and in the K-book's normalisation, both sides being inverted.

**Hypotheses.**

- F → E is a field embedding; v and w are normalised surjective discrete valuations with ord_w(f(r)) = e·ord_v(r), e ≥ 1.
- For the unramified refinement only: E/F is finite, w₁, …, w_n are all its valuations over v and each e_i = 1.

**Proof outline.**

1. The order identity gives an inclusion 𝒪_v → 𝒪_w. Positivity e > 0 gives the equivalence of positive orders for nonzero elements, hence a local map and the residue-field embedding k_v → k_w; units stay units and their residues commute with this map. This argument uses no finite-dimensionality.
2. By the uniformiser-free form (T.3/tame-symbol-uniformizer-independence): tameSymbol w r₁ r₂ = (−1)^{e²ab}·res_w(r₁^{eb}r₂^{−ea}) = ((−1)^{ab})^{e}·(res_v(r₁^{b}r₂^{−a}))^{e}, with a = ord_v r₁, b = ord_v r₂, using e² ≡ e (mod 2) for the sign.
3. On K^M_2(F): both sides are homomorphisms (T.3/tame-symbol-hom and the functoriality of K^M_2 in K2SymbolsBrauer:T.2/milnor-k-theory) agreeing on symbols.
4. The unramified refinement is the case e_i = 1 at each w_i, collected into the product.

**Acceptance.**

- ℚ ⊂ ℚ(√5), v 5-adic, w over 5 with e = 2 and k_w = F_5: tameSymbol w 5 5 = 1 = (−1)² and tameSymbol w 2 5 = 4 = 2².
- ℚ ⊂ ℚ(i) at 5 (5 splits, e₁ = e₂ = 1, residue fields F_5): both w_i give tameSymbol 2 5 = 2, the diagonal image of 2.
- The sign transforms uniformly because e² ≡ e (mod 2); no case split on the parity of e is needed.
- The formula concerns classes from F; for classes of E the relevant statement is the norm–residue formula (T.3/transfer-and-norm-residue).
- Infinite example: ℚ → ℚ(u), v the 5-adic valuation and w its Gauss extension (minimum coefficient order), e = 1, k_w = F_5(u): ∂_w{2,5} = 2. The map with w the u-adic valuation instead has trivial restriction and is not this positive-e case.

**Prerequisites.**

- `K2SymbolsBrauer:T.3/tame-symbol-uniformizer-independence`
- `K2SymbolsBrauer:T.3/tame-symbol-hom`
- `K2SymbolsBrauer:T.2/milnor-k-theory`
- `tauceti:Valuation.ord`

**Sources.**

- `Kbook.2013`: Remark III.6.3.1 (PDF p. 242). The ramification index. The embedding-general statement is derived here from the order/unit calculation, not quoted from the finite source.
- `Kbook.2013`: Remark III.6.3.1 (PDF p. 242). The formula, stated in the source's normalisation; inverting both sides gives it in the roadmap's. The embedding-general statement is derived here from the order/unit calculation, not quoted from the finite source.
- `Kbook.2013`: Remark III.6.3.1, continued (PDF p. 243). The unramified refinement.

### Finite support of the residues

`K2SymbolsBrauer:T.3/finite-support` · lemma · parent `K2SymbolsBrauer:T.3:symbols` · implementation unchecked

Let V be a set of discrete valuations on F such that every f ∈ F^× has ord_v f ≠ 0 for only finitely many v ∈ V — for instance the places of a function field, or the height-one primes of a Dedekind domain with fraction field F. Then for x ∈ K^M_n(F) (n ≥ 1) written as a finite sum of symbols {f_{j,1}, …, f_{j,n}}, ∂_v(x) = 0 for every v ∈ V outside the finite union of the sets {v : ord_v f_{j,i} ≠ 0}. In degree two this is the statement for tameSymbolHom; in particular tameSymbol v f g = 1 whenever ord_v f = ord_v g = 0.

**Hypotheses.**

- V is a set of discrete valuations on F in which each nonzero element has nonzero order at only finitely many members.
- x ∈ K^M_n(F) is given as a finite sum of symbols.

**Proof outline.**

1. Import the finiteness: TauCeti.Place.finite_setOf_ord_ne_zero for the places of a function field; for a Dedekind domain, IsDedekindDomain.HeightOneSpectrum.Support.finite applied to f and to f⁻¹ (the support of f is the set of its poles, so {v : ord_v f ≠ 0} is the union of the supports of f and f⁻¹).
2. If ord_v f_i = 0 for every entry, then d_t{f_1, …, f_n} = {f̄_1, …, f̄_n} has no Π-component, so ∂_v{f_1, …, f_n} = 0 (T.3/higher-milnor-residues).
3. Hence the support of one symbol lies in the union — not the intersection — of the supports of its entries (on ℚ at 5, ord 5 = 1 ≠ 0 = ord 2 and tameSymbol 2 5 = 2 ≠ 1), and the support of a finite sum lies in the finite union over its summands.

**Acceptance.**

- The support of {f, g} lies in the union of the supports of f and g, and can contain points where only one of them has nonzero order ({2,5} at 5).
- The support of a finite sum of symbols lies in the union of the supports of the summands.
- For units of a Dedekind domain R (order zero everywhere) the symbols are trivial at every height-one prime.
- This is what makes the maps into the direct sums of Theorem III.6.5 and Theorem III.7.4 well defined.

**Prerequisites.**

- `K2SymbolsBrauer:T.3/higher-milnor-residues`
- `K2SymbolsBrauer:T.3/tame-symbol-hom`
- `tauceti:TauCeti.Place.finite_setOf_ord_ne_zero`
- `mathlib:IsDedekindDomain.HeightOneSpectrum.Support.finite`

**Sources.**

- `Kbook.2013`: Localization Theorem III.6.5 (PDF p. 244). The sum of the tame symbols lands in the coproduct over the primes; that presupposes the finite support this node proves.
- `Kbook.2013`: Theorem III.7.4 (PDF p. 255). The same presupposition for the higher residues, in every degree.

### Higher tame symbols and specialisation maps

`K2SymbolsBrauer:T.3/higher-milnor-residues` · construction · parent `K2SymbolsBrauer:T.3:symbols` · implementation unchecked

For a surjective discrete valuation v on F with uniformiser t and residue field k, the homomorphism d_t of T.3/serre-map-steinberg extends uniquely to a graded ring homomorphism d_t : K^M_*(F) → L(k). Writing d_t(x) = λ_t(x) + ∂_v(x)·Π with Π on the right defines the specialisation λ_t : K^M_n(F) → K^M_n(k), a graded ring homomorphism depending on t, and the higher residue ∂_v : K^M_n(F) → K^M_{n−1}(k). On symbols, λ_t{u_1t^{i_1}, …, u_nt^{i_n}} = {ū_1, …, ū_n}, ∂_v{u_1, …, u_{n−1}, t} = {ū_1, …, ū_{n−1}} and ∂_v{u_1, …, u_n} = 0; in degree one ∂_v{f} = ord_v f, and in degree two ∂_v = tameSymbolHom of T.3/tame-symbol-hom, with no inversion. Both maps are surjective. Theorem III.7.3 reads off the coefficient with Π on the left, ∂^{Wb}{t, u_2, …, u_n} = {ū_2, …, ū_n}; since Π·y = (−1)^{n−1}y·Π for y ∈ K^M_{n−1}(k), ∂^{Wb} = (−1)^{n−1}·∂_v on K^M_n(F): the two agree in odd degree and differ by a sign in even degree, and in degree two ∂^{Wb} is the K-book's tame symbol, the inverse of T.3's.

**Hypotheses.**

- v is a surjective discrete valuation on F with valuation ring R, residue field k and a chosen uniformiser t.

**Proof outline.**

1. By T.3/serre-map-steinberg and the universal property of the tensor algebra, d_t extends to a ring homomorphism T(F^×) → L(k) killing the Steinberg ideal, hence to d_t : K^M_*(F) → L(k) (K2SymbolsBrauer:T.2/milnor-k-theory); it is graded.
2. Define λ_t and ∂_v as the two components of d_t(x) ∈ L(k)_n = K^M_n(k) ⊕ K^M_{n−1}(k)·Π (T.3/serre-residue-algebra). λ_t = lambdaHom ∘ d_t is a graded ring homomorphism.
3. On symbols: d_t{u_1t^{i_1}, …} = ∏_j({ū_j} + i_jΠ); with all i_j = 0 the product is {ū_1, …, ū_n}, and d_t{u_1, …, u_{n−1}, t} = {ū_1, …, ū_{n−1}}·Π.
4. Degree two: ({ū_f} + aΠ)({ū_g} + bΠ) = {ū_f, ū_g} + (b{ū_f} − a{ū_g} + ab{−1})Π, so ∂_v{f,g} = (−1)^{ab}ū_f^{b}ū_g^{−a} = tameSymbol v f g (a = ord f, b = ord g).
5. Comparison with the source: Π·y = (−1)^{n−1}y·Π for y of degree n − 1, so the left coefficient is (−1)^{n−1} times the right one.
6. Surjectivity: L(k)_n is generated by {ū_1, …, ū_n} = d_t{u_1, …, u_n} and {ū_1, …, ū_{n−1}}Π = d_t{u_1, …, u_{n−1}, t}, and R^× → k^× is onto (ValuationSubring.surjective_unitGroupToResidueFieldUnits); so d_t, λ_t and ∂_v are onto. Independence of ∂_v from t and the dependence of λ_t on t are T.3/specialisation-change-of-uniformiser; the product signs are T.3/milnor-residue-product-formula.

**Acceptance.**

- Degree two: ∂_v = tameSymbolHom, so ∂_{v_5}{5, 2} = 3 in F_5^× over ℚ, whereas Theorem III.7.3's ∂ gives 2 there.
- Degree one: ∂_v{f} = ord_v f and λ_t{f} = res(f·t^{−ord f}).
- Both maps are onto.
- For v_∞ on F(t) with uniformiser t^{−1}, λ is the leading-coefficient map of Example III.7.3.2.

**Prerequisites.**

- `K2SymbolsBrauer:T.3/serre-residue-algebra`
- `K2SymbolsBrauer:T.3/serre-map-steinberg`
- `K2SymbolsBrauer:T.3/tame-symbol-hom`
- `K2SymbolsBrauer:T.2/milnor-k-theory`
- `mathlib:ValuationSubring.surjective_unitGroupToResidueFieldUnits`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `serreMap` | constructor | The graded ring homomorphism d_t : K^M_*(F) → L(k) with d_t{f} = {ū_f} + ord(f)·Π. |
| `milnorResidue` | constructor | ∂_v : K^M_n(F) → K^M_{n−1}(k), the Π-coefficient of d_t with Π on the right. |
| `milnorSpecialisation` | constructor | λ_t : K^M_n(F) → K^M_n(k), the Π-free part of d_t. |
| `milnorResidue_symbol_units_uniformizer` | simp | ∂_v{u_1, …, u_{n−1}, t} = {ū_1, …, ū_{n−1}}. |
| `milnorResidue_symbol_units` | simp | ∂_v{u_1, …, u_n} = 0 for units u_i. |
| `milnorSpecialisation_symbol` | simp | λ_t{u_1t^{i_1}, …, u_nt^{i_n}} = {ū_1, …, ū_n}. |
| `milnorSpecialisation_mul` | structure | λ_t is a graded ring homomorphism. |
| `milnorResidue_one` | compatibility | In degree one ∂_v{f} = ord_v f. |
| `milnorResidue_two` | compatibility | In degree two ∂_v = tameSymbolHom v. |
| `milnorResidue_kbook` | compatibility | Theorem III.7.3's residue equals (−1)^{n−1}·∂_v on K^M_n(F). |
| `milnorResidue_surjective` | characterisation | ∂_v is onto. |
| `milnorSpecialisation_surjective` | characterisation | λ_t is onto. |
| `milnorResidue_indep` | characterisation | ∂_v does not depend on t (T.3/specialisation-change-of-uniformiser). |
| `milnorResidue_mul` | relation | The product formula (T.3/milnor-residue-product-formula). |

**Consumers.**

- T.4/bass-tate-sequence — the sequence is assembled from the residues at the places of the rational function field
- T.4/simple-transfer — the transfer is defined by −∂_∞ = Σ_p N_p ∂_p
- HigherLocalFieldsAndHigherClassFieldTheory HL.1 — the iterated residues along a residue tower are built from these, with the sign of the position of the parameter recorded
- Polylogarithms P.3 — the residues of the weight-three polylogarithmic complex use the degree-three case

**Unit tests.**

- `milnorResidue_degree_one` (computation) — Over ℚ at 5 with t = 5: ∂_v{50} = 2 and λ_5{50} = 2 in F_5^×.
- `milnorResidue_degree_two` (compatibility) — Over ℚ at 5: ∂_v{5, 2} = 3 = tameSymbol 5 2 and ∂_v{2, 5} = 2.
- `milnorResidue_degree_three_position` (computation) — Over ℚ(t) with the t-adic valuation: ∂{t, 5, 2} = {5, 2} and ∂{5, t, 2} = −{5, 2} in K^M_2(ℚ); they differ, since the tame symbol at 5 sends {5, 2} to 3 and −{5, 2} to 2.
- `milnorResidue_units` (degenerate) — ∂_v{u_1, …, u_n} = 0 for units u_i; for F = ℚ(t) with the t-adic valuation, ∂_t vanishes on the image of K^M_n(ℚ) and λ_t restricts to the identity there.
- `milnorSpecialisation_depends_on_uniformizer` (characterisation) — Over ℚ at 5: λ_5{5} = 1 but λ_{10}{5} = 3 in F_5^×, while ∂_v{5} = 1 for both.
- `milnorResidue_needs_serre_relation` (non-example) — With Π² = 0 in place of Π² = {−1}Π, d{5, −5} = {−1}Π ≠ 0 over F_5 although {5, −5} = 0 in K^M_2(ℚ): the construction does not descend without the relation.

**Sources.**

- `Kbook.2013`: Theorem III.7.3 (PDF p. 254). The two surjections.
- `Kbook.2013`: Theorem III.7.3 (PDF p. 254). The formulas on symbols in the source's normalisation (Π on the left); the roadmap's residue is (−1)^{n−1} times it, and equals T.3's tame symbol in degree two.
- `Kbook.2013`: Theorem III.7.3, proof (PDF p. 254). The extension of d to K^M_*(F) and the splitting into λ and ∂_v.

### Rigidity for a complete discretely valued field

`K2SymbolsBrauer:T.3/rigidity` · theorem · parent `K2SymbolsBrauer:T.3:symbols` · implementation unchecked

Let v be a discrete valuation on F with valuation ring R, uniformiser t and residue field k, and suppose F is complete with respect to v (R is 𝔪-adically complete). For every integer q ≥ 1 prime to char(k) (any q ≥ 1 if char k = 0) and every n ≥ 0, (λ_t, ∂_v) : K^M_n(F)/q → K^M_n(k)/q ⊕ K^M_{n−1}(k)/q is an isomorphism.

**Hypotheses.**

- F is complete with respect to the discrete valuation v, with residue field k.
- q is a positive integer prime to the characteristic of k.

**Proof outline.**

1. (λ_t, ∂_v) is d_t followed by L(k)_n ≅ K^M_n(k) ⊕ K^M_{n−1}(k) (T.3/serre-residue-algebra); d_t is onto (T.3/higher-milnor-residues) with kernel U¹·K^M_{n−1}(F) (T.3/serre-map-kernel).
2. R complete implies R Henselian at 𝔪 (Mathlib's instance IsAdicComplete.henselianRing for HenselianRing); q is a unit of R, its image in k being nonzero. So every a ∈ U¹ is b^q with b ∈ U¹ (TauCeti.HenselianRing.exists_pow_eq_and_sub_one_mem_of_sub_one_mem).
3. Hence U¹·K^M_{n−1}(F) is q-divisible: {a}·y = q·({b}·y).
4. Apply − ⊗ ℤ/q to 0 → U¹K^M_{n−1}(F) → K^M_n(F) → L(k)_n → 0: the first term becomes zero, so K^M_n(F)/q ≅ L(k)_n/q.

**Acceptance.**

- The statement is modulo q, not integral: K^M_1(ℚ_p) = ℚ_p^× is not k^× ⊕ ℤ, U¹ being uncountable.
- n = 1: F^×/q ≅ k^×/q ⊕ ℤ/q.
- The hypothesis on q is needed: for F = ℚ_p (p odd), n = 1 and q = p, F^×/p ≅ (ℤ/p)² while F_p^×/p ⊕ ℤ/p ≅ ℤ/p.
- The proof uses only that R is Henselian; the node keeps the source's completeness hypothesis.

**Prerequisites.**

- `K2SymbolsBrauer:T.3/higher-milnor-residues`
- `K2SymbolsBrauer:T.3/serre-map-kernel`
- `K2SymbolsBrauer:T.3/serre-residue-algebra`
- `tauceti:TauCeti.HenselianRing.exists_pow_eq_and_sub_one_mem_of_sub_one_mem`
- `mathlib:HenselianRing`

**Sources.**

- `Kbook.2013`: Corollary III.7.3.1 (PDF p. 254). The corollary, with the source's hypotheses.
- `Kbook.2013`: Corollary III.7.3.1, proof (PDF p. 255). The proof: Hensel's lemma and the kernel of d (Ex. III.7.2, node T.3/serre-map-kernel).

### The norm–residue formula for Milnor norms of a finite extension

`K2SymbolsBrauer:T.3/transfer-and-norm-residue` · theorem · parent `K2SymbolsBrauer:T.4` · implementation unchecked

Let E/F be a finite extension, v a discrete valuation on F with valuation ring R, and suppose the integral closure S of R in E is a finite R-module (equivalently Σ_{w|v} e_w f_w = [E : F]; automatic if E/F is separable or F is complete; for the inseparable extensions K/F(t) that T.4/weil-reciprocity may meet over an imperfect F it is Noether's finiteness, see the gap on integral closures). Let w run over the valuations of E over v, with residue fields k_w ⊇ k_v (possibly inseparable over k_v). Then ∂_v ∘ N_{E/F} = Σ_{w|v} N_{k_w/k_v} ∘ ∂_w on K^M_n(E), with N_{E/F} and N_{k_w/k_v} the Milnor norms of T.4/milnor-transfer-transitivity (Kato's norms, defined for every finite extension, separable or not). In degree one this is ord_v(N_{E/F} x) = Σ_w f_w·ord_w(x); residue degrees enter through N_{k_w/k_v}, and the ramification indices do not appear (they enter only the restriction formula T.3/higher-ramification-formula). This is the general Milnor norm/residue square that RS-28 assigns to T.3:localization-comparison, stated for T.4's norms and parented in T.4 because T.4/weil-reciprocity uses it; its comparison with Quillen's transfer and the localisation boundary is T.3/milnor-quillen-transfer-comparison.

**Hypotheses.**

- E/F is a finite field extension and v a discrete valuation on F.
- The integral closure of the valuation ring of v in E is a finite module over it (Σ_w e_w f_w = [E : F]). Without it the formula fails: in degree one, for x = π ∈ F, it would read [E : F] = Σ_w e_w f_w.

**Proof outline.**

1. Apply general-milnor-norm-residue, whose complete prime case, all-finite complete extension, completion splitting and global two-square comparison are separately decomposed. Keep the normalization-finiteness hypothesis.

**Acceptance.**

- Degree one: ord_v(N_{E/F}x) = Σ_w f_w ord_w(x), e.g. ℚ(i)/ℚ at 5: N(2 + i) = 5 and the two places over 5 give 1 + 0.
- For classes from F the formula combines with T.3/higher-ramification-formula and T.4/restriction-transfer-degree into [E : F] = Σ e_w f_w, the finiteness hypothesis.
- The formula is the same in both normalisations of the residue (each side changes by (−1)^{n−1}).

**Prerequisites.**

- `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`
- `K2SymbolsBrauer:T.4/kato-complete-residue`
- `K2SymbolsBrauer:T.4/transfer-base-change`
- `K2SymbolsBrauer:T.4/restriction-transfer-degree`
- `K2SymbolsBrauer:T.3/higher-milnor-residues`
- `mathlib:Ideal.sum_ramification_inertia_eq_finrank`
- `mathlib:Ideal.relNorm_singleton`
- `mathlib:Algebra.norm`
- `K2SymbolsBrauer:T.3/general-milnor-norm-residue`

**Consumers.**

- T.4/weil-reciprocity — the reduction of reciprocity on a curve to the projective line pushes residues forward along k(X)/k(t)
- HigherLocalFieldsAndHigherClassFieldTheory HL.1 — norm–residue compatibility along a residue tower of complete fields
- T.5/unramified-subgroup — the transfer of a finite extension of number fields maps unramified classes to unramified classes
- T.3/milnor-quillen-transfer-comparison — in degree two it is compared with the norm–residue square of Quillen's transfer
- MotivicEtaleKTheory M.4 — Suslin's reciprocity law (T.4/weil-reciprocity), which the Nesterenko–Suslin/Totaro diagonal comparison uses, rests on it

**Sources.**

- `Kbook.2013`: Ex. III.7.9 (PDF p. 266). The formula for F(t), a valuation trivial on F and E/F normal of prime degree; the general statement of this node is not in the source read (gap).
- `Kbook.2013`: Corollary III.7.6.3 (PDF p. 257). The complete case for a normal extension of prime degree (node T.4/kato-complete-residue).

### Identification with the boundary of the localisation sequence

`K2SymbolsBrauer:T.3/localization-boundary` · comparison · parent `K2SymbolsBrauer:T.3:localization-comparison` · implementation unchecked

Let R be a discrete valuation ring with fraction field F, residue field k and uniformiser π, and let ∂ : K_2(F) → K_1(k) = k^× be the boundary of the localisation sequence ⋯ → K_2(R) → K_2(F) → K_1(k) → K_1(R) → K_1(F) → K_0(k) → ⋯ (GeneralAlgebraicKTheory K.3: localisation for the torsion modules, dévissage, resolution). With the K-book's normalisation — ∂ right K_*(R)-linear, ∂(x·y) = ∂(x)·ȳ for y ∈ K_*(R) (GeneralAlgebraicKTheory K.7), and ∂[π] = [R/πR] = 1 ∈ K_0(k) — one has, on symbols (through K^M_2(F) → K_2(F)), ∂{f,g} = tameSymbol v g f = (tameSymbol v f g)^{−1}: this is the right-linear boundary convention computed in V.6.6.1, the inverse of this roadmap’s uniformizer-last symbol. With the left-linear normalisation ∂(y·x) = ȳ·∂(x) instead, ∂{f,g} = tameSymbol v f g. The node states both and fixes the sign here, not in the symbol formula. It builds no localisation sequence; SchemeKTheoryOperations S.3 and EllipticKTheory E.3 import this comparison (RS-18), and T.3/dedekind-localization-boundary extends it to a Dedekind domain, prime by prime.

**Hypotheses.**

- R is a discrete valuation ring with fraction field F, residue field k, uniformiser π and valuation v.
- The localisation sequence and the K_*(R)-module structure of its terms are those of GeneralAlgebraicKTheory K.3 and K.7, with the side of the action fixed.

**Proof outline.**

1. K_2(F) is generated by Steinberg symbols (K2SymbolsBrauer:T.2/matsumoto); expanding {u_1π^a, u_2π^b} bilinearly, it is generated by the image of K_2(R) together with {π, u} (u ∈ R^×) and {π, π}.
2. ∂ vanishes on the image of K_2(R), by exactness.
3. Right linearity and ∂[π] = [R/πR]: ∂{π, u} = [R/πR]·[ū] = [ū] in K_1(k), [R/πR] being the unit of K_0(k).
4. {π, π} = {π, −1}, so ∂{π, π} = [−1].
5. tameSymbol v π u = ū^{−1} and tameSymbol v π π = −1, so ∂ and the inverse of tameSymbolHom agree on generators; both are homomorphisms, so ∂ = (tameSymbolHom)^{−1}, i.e. ∂{f,g} = tameSymbol v g f.
6. With left linearity, ∂{u, π} = [ū], so ∂{π, u} = [ū]^{−1} = tameSymbol v π u and ∂ = tameSymbolHom.
7. Kernels agree in both normalisations, so the exactness statements of T.5 do not depend on the choice.

**Acceptance.**

- With the K-book's normalisation, on ℤ_(5) ⊂ ℚ: ∂{5, 2} = 2 whereas tameSymbol 5 2 = 3; ∂{2, 5} = 3.
- ∂{π, π} = −1 in both normalisations.
- Degree one: ∂[f] = ord_v(f)·[k], the valuation; this normalisation is an input (gap: its owner under RS-18 is S.3, which imports this node).
- No second localisation sequence is built.

**Prerequisites.**

- `K2SymbolsBrauer:T.3/tame-symbol-hom`
- `K2SymbolsBrauer:T.2/matsumoto`
- `K2SymbolsBrauer:T.2/graded-map`
- `GeneralAlgebraicKTheory:K.3/dvr-degree-one-boundary`
- `GeneralAlgebraicKTheory:K.3/localization-product-boundary`

**Sources.**

- `Kbook.2013`: V.6.6.1 (PDF p. 417). The source's claim that the localisation boundary is its tame symbol.
- `Kbook.2013`: V.6.6.1, proof (PDF p. 417). The computation: with the K_*(R)-linearity the source uses (on the right, since ∂{π, u} = ∂(π)·[u]), the boundary is the K-book's tame symbol, the inverse of the roadmap's. ('∂ in K∗(R)-linear' is the source's 'is'.)
- `Kbook.2013`: Example V.6.1.2 (PDF p. 414). The degree-one normalisation ∂[π] = [R/πR] used in the computation.

### The localisation theorem for K₂ of a Dedekind domain: the boundary is the tame symbol at each prime

`K2SymbolsBrauer:T.3/dedekind-localization-boundary` · theorem · parent `K2SymbolsBrauer:T.3:localization-comparison` · implementation unchecked

Let R be a Dedekind domain with fraction field F and, for each nonzero prime 𝔭, residue field k(𝔭) = R/𝔭 and valuation v_𝔭. The finitely generated torsion R-modules form a Serre subcategory of the finitely generated R-modules with quotient the finite-dimensional F-vector spaces; Quillen's localisation theorem, dévissage (K_*(torsion modules) ≅ ⊕_𝔭 K_*(k(𝔭))) and resolution (R and F are regular) give the exact sequence ⊕_𝔭 K_2(k(𝔭)) → K_2(R) → K_2(F) −∂→ ⊕_𝔭 K_1(k(𝔭)) → K_1(R) → K_1(F), whose maps out of the residue-field terms are the transfers along R → k(𝔭). The 𝔭-component of ∂ is the boundary of the discrete valuation ring R_𝔭, so on symbols (Steinberg K_2(F) = Quillen K_2(F) by K2SymbolsBrauer:T.1/k2-pi2) ∂{f, g} = (tameSymbol v_𝔭 g f)_𝔭 = ((tameSymbol v_𝔭 f g)^{−1})_𝔭 in the K-book's right K_*(R)-linear normalisation, and (tameSymbol v_𝔭 f g)_𝔭 in the left-linear one (T.3/localization-boundary); the values lie in the direct sum by T.3/finite-support. Hence ker ∂ is the image of K_2(R) and coker ∂ ≅ ker(K_1(R) → K_1(F)). This is the K-book's Localization Theorem III.6.5, proved in V.6.6: the degree-two boundary comparison the stage text asks of this layer, which T.5 imports. It builds no sequence beyond GeneralAlgebraicKTheory K.3's.

**Hypotheses.**

- R is a Dedekind domain with fraction field F; 𝔭 runs over the nonzero primes of R.
- Localisation, dévissage, resolution and transfers are GeneralAlgebraicKTheory K.3's; the K_*(R)-module structure used in the discrete-valuation-ring comparison is K.7's (through T.3/localization-boundary).
- The sign is the one fixed in T.3/localization-boundary; kernels and cokernels do not depend on it.

**Proof outline.**

1. The finitely generated S-torsion modules, S = R ∖ {0}, form a Serre subcategory of M(R) with quotient M(F) (K-book V.6.1, citing II.6.4.1); apply Quillen's localisation theorem for a Serre subcategory (GeneralAlgebraicKTheory:K.3/abelian-localization-theorem).
2. Dévissage (GeneralAlgebraicKTheory:K.3/devissage-theorem): a finitely generated torsion module has a finite filtration with quotients R/𝔭, so K_*(torsion modules) ≅ ⊕_𝔭 K_*(k(𝔭)); composed with the map to G_*(R) each summand is the transfer along R → k(𝔭) (GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula).
3. Resolution (GeneralAlgebraicKTheory:K.3/resolution-theorem): R, F and the k(𝔭) are regular, so G_* = K_*; this is the sequence (6.6) of K-book V.6.6, of which the displayed segment is (6.6.1).
4. Naturality along the flat map R → R_𝔭 gives a morphism of localisation sequences which is the identity on K_2(F) and the projection onto the 𝔭-summand on the residue terms (a torsion module localises to its 𝔭-primary part); so the 𝔭-component of ∂ is the boundary of R_𝔭 ⊂ F.
5. Apply T.3/localization-boundary to R_𝔭, whose residue field is k(𝔭) and whose valuation is v_𝔭; T.3/finite-support puts the sum in the direct sum.
6. Exactness at ⊕_𝔭 K_1(k(𝔭)) gives coker ∂ ≅ ker(K_1(R) → K_1(F)); identifying it with SK_1(R) through the determinant is KTheoryLowDegrees U.3's, and T.5 uses only U.4's statement that the map K_1(O_{F,S}) → K_1(F) is injective.

**Acceptance.**

- For R = ℤ the segment is ⊕_p K_2(𝔽_p) → K_2(ℤ) → K_2(ℚ) → ⊕_p 𝔽_p^× → K_1(ℤ) → K_1(ℚ); in the K-book's normalisation ∂{5, 2} has 5-component 2, where T.3's tameSymbol gives 3.
- For a discrete valuation ring (one prime) it is the degree-two part of the sequence in T.3/localization-boundary.
- coker ∂ is not zero in general: for the Dedekind domain ℝ[x, y]/(x² + y² − 1) it is the nonzero SK_1 of K-book Example III.1.5.4, although every tame symbol is onto.
- No second localisation sequence is built: ArithmeticKTheory N.2's all-degree Dedekind sequence restricts in degrees at most two to this one.

**Prerequisites.**

- `K2SymbolsBrauer:T.3/localization-boundary`
- `K2SymbolsBrauer:T.3/finite-support`
- `K2SymbolsBrauer:T.1/k2-pi2`
- `GeneralAlgebraicKTheory:K.3/abelian-localization-theorem`
- `GeneralAlgebraicKTheory:K.3/devissage-theorem`
- `GeneralAlgebraicKTheory:K.3/resolution-theorem`
- `GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula`
- `mathlib:IsDedekindDomain.HeightOneSpectrum`

**Sources.**

- `Weibel.KBook.III`: III.6.5, Localization Theorem 6.5 (p. 52). The statement is quoted in chapter III and proved in chapter V; the local rings R_𝔭 give the tame symbols.
- `Weibel.KBook.V`: V.6.6 (p. 41). The Dedekind sequence as the localisation sequence of V.6.1 with S = R ∖ {0}, after resolution.
- `Weibel.KBook.V`: V.6.6.1 and the claim after it (p. 41). The reduction to the discrete valuation ring R_𝔭; the source's 'K2(R) → K2(Rp)' is read as the morphism of localisation sequences induced by R → R_𝔭, which is how the proof uses it.
- `Weibel.KBook.V`: V.6.1 (p. 38). The Serre quotient identification used in the first step.

### Quillen transfers and the localisation boundary: the norm–residue square

`K2SymbolsBrauer:T.3/quillen-transfer-norm-residue` · theorem · parent `K2SymbolsBrauer:T.3:localization-comparison` · implementation unchecked

Let R ⊆ R′ be Dedekind domains with R′ finitely generated as an R-module, F ⊆ F′ their fraction fields (so F′/F is finite), and for a nonzero prime 𝔭 of R let 𝔭′ run over the primes of R′ above 𝔭. The transfers of GeneralAlgebraicKTheory K.3 along R → R′, F → F′ and k(𝔭) → k(𝔭′) (restriction of scalars; R′ is finitely generated and torsion-free, hence projective, over R) form a morphism from the localisation sequence of T.3/dedekind-localization-boundary for R′ to that for R. In particular ∂_𝔭 ∘ N_{F′/F} = Σ_{𝔭′|𝔭} N_{k(𝔭′)/k(𝔭)} ∘ ∂_{𝔭′} on K_n(F′): residue degrees enter through the transfers of the residue extensions and no ramification index appears (ramification enters restriction, T.3/ramification-formula). In degree two, the boundaries being the inverse tame symbols and the K_1-transfer of a finite field extension the field norm, tameSymbol_{v_𝔭}(N_{F′/F} x) = ∏_{𝔭′|𝔭} N_{k(𝔭′)/k(𝔭)}(tameSymbol_{v_𝔭′} x) for x ∈ K_2(F′), with N_{F′/F} Quillen's transfer; the identity holds in both normalisations. Moreover, for a finite field extension E/F restriction followed by transfer is multiplication by [E : F] on K_n(F), the projection formula applied to the class [E] = [E : F] of K_0(F) = ℤ. The Milnor-side statements are T.4's (T.3/transfer-and-norm-residue, T.4/restriction-transfer-degree, T.4/milnor-projection-formula); their agreement with these is T.3/milnor-quillen-transfer-comparison.

**Hypotheses.**

- R ⊆ R′ are Dedekind domains, R′ is a finitely generated R-module, and F ⊆ F′ are their fraction fields.
- Transfers are those of GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula; for fields they are the finite transfers of the forgetful functor (K-book III.1.7.1 and III.5.6.3).

**Proof outline.**

1. Restriction of scalars carries finitely generated torsion R′-modules, finitely generated R′-modules and F′-vector spaces to the corresponding R-objects; these exact functors commute with the inclusion of torsion modules and with localisation, giving the homotopy-commutative diagram of localisation fibrations (K-book V.(6.6.3)) and so the morphism of long exact sequences V.(6.6.4).
2. On the residue terms, after dévissage, restriction of scalars sends the simple module k(𝔭′) to the k(𝔭)-vector space k(𝔭′), of dimension f(𝔭′|𝔭); the induced map ⊕_{𝔭′} K_*(k(𝔭′)) → ⊕_𝔭 K_*(k(𝔭)) is therefore ⊕ N_{k(𝔭′)/k(𝔭)}, and no ramification index appears.
3. Degree two: combine with T.3/dedekind-localization-boundary for R and for R′ (boundaries = inverse tame symbols) and with the K-book's identification of the K_1-transfer of a finite field extension with the field norm (III.1.7.1 and the paragraph after it).
4. Restriction followed by transfer: by the projection formula of GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula, N(res(x)·1) = x·N(1) = x·[E], and [E] = [E : F] in K_0(F) = ℤ (K-book III.5.6.3 in degree two).

**Acceptance.**

- Degree one: ord_𝔭(N_{F′/F} y) = Σ_{𝔭′|𝔭} f(𝔭′|𝔭)·ord_{𝔭′}(y); for ℚ(i)/ℚ at the ramified prime 2, N(1 + i) = 2 has ord_2 = 1 = f·ord_{(1+i)}(1 + i) with f = 1, while a formula with the ramification index e = 2 would give 2.
- For x = res(y) with y ∈ K_2(F), with T.3/ramification-formula this gives tameSymbol_{v_𝔭}(y)^{Σ e f} = tameSymbol_{v_𝔭}(y)^{[F′:F]}, the fundamental identity.
- For fields, restriction followed by transfer on K_2 is multiplication by [E : F] (K-book III.5.6.3).
- The theorem concerns Quillen's transfer; T.4's Milnor norm is compared with it in T.3/milnor-quillen-transfer-comparison, not identified with it by definition.

**Prerequisites.**

- `K2SymbolsBrauer:T.3/dedekind-localization-boundary`
- `GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula`
- `GeneralAlgebraicKTheory:K.3/devissage-theorem`
- `GeneralAlgebraicKTheory:K.3/abelian-localization-theorem`
- `mathlib:Algebra.norm`

**Sources.**

- `Weibel.KBook.V`: V.(6.6.3)-(6.6.4) (p. 42). The compatibility of the transfers with the localisation sequences; the diagram (6.6.4) has the residue transfers N_{p′/p} as its third column.
- `Weibel.KBook.III`: III.1.7.1 and the paragraph after it (p. 9). The K_1-transfer of a finite field extension is the field norm.
- `Weibel.KBook.III`: III.5.6.3 (p. 39). Restriction followed by transfer in degree two.

### T.4's Milnor norm is Quillen's transfer on K₂

`K2SymbolsBrauer:T.3/milnor-quillen-transfer-comparison` · comparison · parent `K2SymbolsBrauer:T.3:localization-comparison` · implementation unchecked

For a finite field extension E/F, under Matsumoto's isomorphisms K^M_2(E) ≅ K_2(E), K^M_2(F) ≅ K_2(F) (K2SymbolsBrauer:T.2/matsumoto) and the identification of Steinberg with Quillen K_2 (K2SymbolsBrauer:T.1/k2-pi2), the Milnor norm N_{E/F} of T.4/milnor-transfer-transitivity corresponds to Quillen's transfer of GeneralAlgebraicKTheory K.3. Consequently, in degree two and under the boundary identification of T.3/dedekind-localization-boundary, the Milnor norm/residue formula T.3/transfer-and-norm-residue and the Quillen norm/residue square T.3/quillen-transfer-norm-residue are the same statement, as are T.4/restriction-transfer-degree and the restriction–transfer clause of T.3/quillen-transfer-norm-residue. This is the comparison of T.3:localization-comparison's 'transfer' clause: the Milnor norms are imported from T.4 and the K-theory transfers from GeneralAlgebraicKTheory K.3, and neither is constructed here. The general comparison is now supplied by general-transfer-comparison, using the exact-functor base-change proof and Kato’s uniqueness reduction; it is a worker derivation from the read inputs.

**Hypotheses.**

- E/F is a finite field extension.
- The two norms are compared on K_2 = K^M_2 through Matsumoto's theorem; in degrees zero and one both are the degree and the field norm.

**Proof outline.**

1. Apply general-transfer-comparison, whose arbitrary-Artin base change and p-primary descent are independent of residues.
2. Transport the separately proved Milnor norm-residue square and the Quillen localization square through Matsumoto’s natural isomorphism. Both degree-two boundaries differ by the same inverse convention, so the norm formula is unchanged.

**Acceptance.**

- For ℂ/ℝ both norms send {r, e^{iθ}} to 1 and {r, s} to {r, s}² (K-book Example III.6.1.6 and Corollary III.6.1.5).
- In degree one both are the field norm: N(1 + i) = 2 for ℚ(i)/ℚ.
- The comparison is a theorem, not a definition: T.4's norm is defined through the Bass–Tate sequence, Quillen's through restriction of scalars.

**Prerequisites.**

- `K2SymbolsBrauer:T.3/general-transfer-comparison`
- `K2SymbolsBrauer:T.3/dedekind-localization-boundary`
- `K2SymbolsBrauer:T.3/quillen-transfer-norm-residue`

**Sources.**

- `Weibel.KBook.III`: III.6.1.5, Corollary 6.1.5 (p. 49). The quadratic case: the K_2 transfer is determined by the projection formula and the norm.
- `Weibel.KBook.III`: III, Exercise 5.6 (p. 46). The projection formula for the finite K_2 transfer.
- `Weibel.KBook.III`: III.7.6, Definition 7.6 and Theorem 7.6.1 (p. 64). The Milnor norm compared here is the Bass–Tate/Kato one, defined in chapter III without reference to Quillen's transfer.

### The tame symbol as a homomorphism out of K₂

`K2SymbolsBrauer:T.3/tame-symbol-hom` · construction · parent `K2SymbolsBrauer:T.3:symbols` · implementation unchecked

The pairing ∂_v of T.3/tame-symbol-steinberg induces a group homomorphism ∂_v : K^M_2(F) → k^× (source written additively) with ∂_v{f,g} = tameSymbol v f g, and, through Matsumoto's isomorphism K^M_2(F) ≅ K_2(F), a homomorphism K_2(F) → k^× with the same value on Steinberg symbols. It is surjective: ∂_v{ũ, t} = u for any lift ũ ∈ R^× of u ∈ k^×.

**Hypotheses.**

- v is a surjective discrete valuation on F with valuation ring R, residue field k and uniformiser t.

**Proof outline.**

1. Bimultiplicativity gives a homomorphism F^× ⊗ F^× → k^×. The homogeneous Steinberg ideal of K2SymbolsBrauer:T.2/milnor-k-theory meets degree two in the subgroup generated by the r ⊗ (1 − r), which go to 1 by the Steinberg relation, so the map descends to K^M_2(F).
2. Compose with the inverse of Matsumoto's isomorphism (K2SymbolsBrauer:T.2/matsumoto) to obtain the map on K_2(F).
3. Surjectivity: the residue map R^× → k^× is onto (ValuationSubring.surjective_unitGroupToResidueFieldUnits) and ∂_v{ũ, t} = u.

**Acceptance.**

- ∂_v is onto k^×.
- It vanishes on symbols of two units, so on the image of symbols from R^× ⊗ R^×.
- The K-book's tame symbol on K_2(F) is ∂_v composed with the swap {f,g} ↦ {g,f}, i.e. −∂_v in additive notation.

**Prerequisites.**

- `K2SymbolsBrauer:T.3/tame-symbol-steinberg`
- `K2SymbolsBrauer:T.2/milnor-k-theory`
- `K2SymbolsBrauer:T.2/matsumoto`
- `mathlib:ValuationSubring.surjective_unitGroupToResidueFieldUnits`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `tameSymbolHom` | constructor | The homomorphism K^M_2(F) →+ Additive k^× induced by tameSymbol v. |
| `tameSymbolHom_symbol` | simp | tameSymbolHom v {f, g} = tameSymbol v f g. |
| `tameSymbolHom_surjective` | characterisation | tameSymbolHom v is surjective. |
| `tameSymbolHomK2` | compatibility | The homomorphism K_2(F) → k^× obtained through Matsumoto's isomorphism, with the same value on Steinberg symbols. |
| `tameSymbolHom_symbol_units` | simp | tameSymbolHom v {u, w} = 0 (the trivial unit) for u, w ∈ R^×. |
| `tameSymbolHom_kbook` | compatibility | The K-book's ∂_v on K_2(F) equals −tameSymbolHom v (additively). |

**Consumers.**

- T.5/unramified-subgroup — the unramified subgroup of K_2(F) is the intersection of the kernels of these homomorphisms at the finite places
- T.3/localization-boundary — the localisation boundary is compared with this homomorphism
- T.3/higher-milnor-residues — in degree two the higher residue equals this homomorphism

**Unit tests.**

- `tameSymbolHom_rat_five` (computation) — On ℚ at 5: tameSymbolHom {5, 2} = 3 and tameSymbolHom {2, 5} = 2 in F_5^×.
- `tameSymbolHom_units` (degenerate) — On ℚ at 5: tameSymbolHom {2, 3} = 0, the trivial unit.
- `tameSymbolHom_generates` (characterisation) — On ℚ at 5: tameSymbolHom {2, 5} = 2 generates F_5^×, so the map is onto.
- `tameSymbolHom_needs_sign` (non-example) — The unsigned formula res(f^{v(g)}g^{−v(f)}) sends the Steinberg element {1/5, 4/5} of K^M_2(ℚ) to 4 ≠ 1, so it does not descend; the signed one sends it to 1.
- `tameSymbolHom_self` (compatibility) — {5,5} = {5,−1} in K^M_2(ℚ) and both go to −1 = 4 in F_5^×.

**Sources.**

- `Kbook.2013`: Lemma III.6.3 (PDF p. 242). The source's Steinberg symbol K_2(F) → k_v^× and its surjectivity; the value ∂_v(π, u) = ū is the source's normalisation, whose roadmap counterpart is ∂_v{ũ, t} = u.
- `Kbook.2013`: III.7.1 (PDF p. 253). The identification K^M_2(F) = K_2(F) through which the homomorphism is transported.

### Serre's algebra L(k) with the indeterminate Π

`K2SymbolsBrauer:T.3/serre-residue-algebra` · construction · parent `K2SymbolsBrauer:T.3:symbols` · implementation unchecked

For a field k let L(k) be the graded abelian group with L(k)_n = K^M_n(k) ⊕ K^M_{n−1}(k), the second summand written b·Π, with multiplication (a + bΠ)(c + dΠ) = ac + (ad + (−1)^{|c|}bc + (−1)^{|d|}bd·{−1})Π for homogeneous a, b, c, d. It is an associative, unital, graded-commutative ring (xy = (−1)^{|x||y|}yx), containing K^M_*(k) as the subring b = 0, and Π = (0, 1) ∈ L(k)_1 satisfies Π·Π = {−1}·Π and Π·{c} = −{c}·Π. The maps a + bΠ ↦ a (the λ-part) and a + bΠ ↦ a + b{−1} (the ρ-part) are graded ring homomorphisms L(k) → K^M_*(k), and for c ∈ k^× the assignment Π ↦ Π − {c} extends to a graded ring automorphism σ_c of L(k) over K^M_*(k). This is the 'graded K^M_*(k_v)-algebra generated by an indeterminate Π in L1, with the relation {Π, Π} = {−1, Π}' of the source, made explicit.

**Hypotheses.**

- k is a field; K^M_*(k) is the graded ring of K2SymbolsBrauer:T.2/milnor-k-theory, graded-commutative by K2SymbolsBrauer:T.2/milnor-alternating.

**Proof outline.**

1. Derive the multiplication from the rules Π·c = (−1)^{|c|}c·Π and Π·Π = {−1}·Π, and check associativity and the unit on homogeneous elements; the checks use graded commutativity of K^M_*(k) and 2·{−1} = 0.
2. Graded commutativity of L(k): it holds on K^M_*(k) (K2SymbolsBrauer:T.2/milnor-alternating) and between Π and K^M_*(k) by construction; for Π with itself it holds because Π·Π is its own negative, 2·{−1} = 0.
3. The λ-part map kills Π·L(k) and is multiplicative by the formula; the ρ-part map is multiplicative because {−1}·{−1} = {−1}·{−1} and {−1} anticommutes with degree-one elements.
4. σ_c respects the relation: (Π − {c})² = {−1}Π + {c,c} and {−1}(Π − {c}) = {−1}Π − {−1,c}, and {c,c} = {c,−1} = −{−1,c} in K^M_2(k); its inverse is σ_{c^{−1}}.

**Acceptance.**

- Over k = F_5, Π·Π = {−1}·Π ≠ 0 because {−1} = 4 ≠ 1 in F_5^× = K^M_1(F_5); over a field of characteristic two, Π·Π = 0.
- L(k)_n ≅ K^M_n(k) ⊕ K^M_{n−1}(k) as groups: the source's 'direct sum' is part of the construction, not an assumption.
- Π·{c} = −{c}·Π, so L(k) is not commutative in the ungraded sense.

**Prerequisites.**

- `K2SymbolsBrauer:T.2/milnor-k-theory`
- `K2SymbolsBrauer:T.2/milnor-alternating`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `serreAlgebra` | data | The graded ring L(k) with L(k)_n = K^M_n(k) × K^M_{n−1}(k). |
| `serreAlgebra.Π` | constructor | The element Π = (0, 1) of degree one. |
| `serreAlgebra.of` | constructor | The graded ring embedding K^M_*(k) → L(k), a ↦ (a, 0). |
| `serreAlgebra.mul_def` | simp | (a + bΠ)(c + dΠ) = ac + (ad + (−1)^{\|c\|}bc + (−1)^{\|d\|}bd{−1})Π. |
| `serreAlgebra.Π_mul_Π` | simp | Π·Π = {−1}·Π. |
| `serreAlgebra.Π_mul` | relation | Π·x = (−1)^{\|x\|}·x·Π for x ∈ K^M_*(k). |
| `serreAlgebra.gradedComm` | structure | L(k) is graded-commutative. |
| `serreAlgebra.decompose` | equivalence | L(k)_{n+1} ≃ K^M_{n+1}(k) ⊕ K^M_n(k) for n ≥ 0, and L(k)_0 = K^M_0(k). |
| `serreAlgebra.lambdaHom` | projection | The graded ring homomorphism L(k) → K^M_*(k), a + bΠ ↦ a. |
| `serreAlgebra.rhoHom` | projection | The graded ring homomorphism L(k) → K^M_*(k), a + bΠ ↦ a + b·{−1}. |
| `serreAlgebra.shift` | functoriality | For c ∈ k^×, the graded ring automorphism with Π ↦ Π − {c}; shift c ∘ shift c′ = shift (cc′). |
| `serreAlgebra.map` | functoriality | A field homomorphism k → k′ induces L(k) → L(k′) fixing Π, with map_id and map_comp. |

**Consumers.**

- T.3/serre-map-steinberg — the target of the map d
- T.3/higher-milnor-residues — the residue and specialisation are the two components of d
- T.3/specialisation-change-of-uniformiser — changing the uniformiser is the automorphism shift
- T.3/milnor-residue-product-formula — the product formula is the multiplication rule of L(k)

**Unit tests.**

- `serreAlgebra_pi_sq_F5` (computation) — Over F_5: Π·Π = {4}·Π, and {4} ≠ 0 in K^M_1(F_5).
- `serreAlgebra_pi_sq_char_two` (degenerate) — Over F_2 (or any field of characteristic two): Π·Π = 0.
- `serreAlgebra_anticomm_F5` (characterisation) — Over F_5: Π·{2} = {3}·Π (as −{2} = {2^{−1}} = {3}), and Π·{2} ≠ {2}·Π.
- `serreAlgebra_lambda` (compatibility) — lambdaHom ∘ of = id on K^M_*(k) and lambdaHom Π = 0.
- `serreAlgebra_not_square_zero` (non-example) — With Π·Π = 0 instead, the map d of T.3/serre-map-steinberg would send {5, −5}, which is 0 in K^M_2(ℚ), to Π·({−1} + Π) = {−1}·Π ≠ 0 over F_5; in L(k) it goes to {−1}Π + {−1}Π = 0.

**Sources.**

- `Kbook.2013`: Theorem III.7.3, proof (PDF p. 254). The algebra L and the map d; this node constructs L explicitly.
- `Kbook.2013`: Theorem III.7.3, proof (PDF p. 254). The direct-sum decomposition of L_n that the construction provides.

### Serre's map kills the Steinberg elements

`K2SymbolsBrauer:T.3/serre-map-steinberg` · lemma · parent `K2SymbolsBrauer:T.3:symbols` · implementation unchecked

For a surjective discrete valuation v on F with uniformiser t, the map d_t : F^× → L(k)_1, d_t(u·t^i) = {ū} + i·Π (u ∈ R^×, i ∈ ℤ), is a group homomorphism with d_t(r)·d_t(1 − r) = 0 in L(k)_2 for every r ∈ F \ {0, 1}.

**Hypotheses.**

- v is a surjective discrete valuation on F with valuation ring R, maximal ideal 𝔪, residue field k and uniformiser t.

**Proof outline.**

1. d_t is a homomorphism: unit parts multiply and orders add (Valuation.ord_mul).
2. r ∈ R^×, r ≠ 1: if 1 − r ∈ R^× then d(r)d(1 − r) = {r̄}{1 − r̄} = 0 by the Steinberg relation in K^M_2(k) (r̄ ≠ 0, 1); if ord(1 − r) > 0 then r̄ = 1 and d(r) = {1} = 0.
3. ord r > 0: 1 − r ∈ R^× with residue 1 (Valuation.mem_maximalIdeal_iff_ord_pos), so d(1 − r) = 0.
4. r ∉ R: 1 − r = −r·(1 − r^{−1}), so d(1 − r) = d(−r) + d(1 − r^{−1}), and d(r)d(1 − r^{−1}) = −d(r^{−1})d(1 − r^{−1}) = 0 by the previous step; hence d(r)d(1 − r) = d(r)d(−r).
5. d(x)d(−x) = 0 for every x = u·t^i: ({ū} + iΠ)({−ū} + iΠ) = {ū,−ū} + i({ū} − {−ū})Π + i²{−1}Π = (i + i²){−1}Π = 0, using {ū, −ū} = 0 in K^M_2(k) (K2SymbolsBrauer:T.2/milnor-alternating), Π{a} = −{a}Π, Π² = {−1}Π, {ū} − {−ū} = {−1}, and that i + i² is even while 2{−1} = 0. This is where the relation on Π is used.

**Acceptance.**

- The case analysis covers r ∈ R^×, ord r > 0 and r ∉ R, and reduces the last to d(x)d(−x) = 0.
- With Π² = 0 the last step fails: over F_5, d(5)d(−5) = {−1}Π ≠ 0 (T.3/serre-residue-algebra, non-example).

**Prerequisites.**

- `K2SymbolsBrauer:T.3/serre-residue-algebra`
- `K2SymbolsBrauer:T.3/tame-symbol`
- `K2SymbolsBrauer:T.2/milnor-k-theory`
- `K2SymbolsBrauer:T.2/milnor-alternating`
- `tauceti:Valuation.ord_mul`
- `tauceti:Valuation.mem_maximalIdeal_iff_ord_pos`

**Sources.**

- `Kbook.2013`: Theorem III.7.3, proof (PDF p. 254). The cases r ∈ R^× and v(r) > 0.
- `Kbook.2013`: Theorem III.7.3, proof (PDF p. 254). The reduction of r ∉ R to d(x)d(−x) = 0 and the use of the relation on Π; the source's '{r, −r}' is {r̄, −r̄} in K^M_2(k_v).

### The kernel of Serre's map

`K2SymbolsBrauer:T.3/serre-map-kernel` · lemma · parent `K2SymbolsBrauer:T.3:symbols` · implementation unchecked

For every n ≥ 1 the kernel of d_t : K^M_n(F) → L(k)_n is U¹·K^M_{n−1}(F), the subgroup generated by the products {a}·y with a ∈ U¹ = 1 + 𝔪 (the principal units) and y ∈ K^M_{n−1}(F).

**Hypotheses.**

- v is a surjective discrete valuation on F with valuation ring R, maximal ideal 𝔪, residue field k and uniformiser t; n ≥ 1.

**Proof outline.**

1. ⊇: for a ∈ U¹, d_t{a} = {ā} = {1} = 0, since U¹ is the kernel of the residue map on R^× (ValuationSubring.ker_unitGroupToResidueFieldUnits), and d_t is multiplicative.
2. Generation: expanding f_j = u_jt^{i_j} multilinearly and using {t, t} = {t, −1} and graded commutativity (K2SymbolsBrauer:T.2/milnor-alternating), K^M_n(F) is generated by the symbols {u_1, …, u_n} and {u_1, …, u_{n−1}, t} with u_i ∈ R^×.
3. Lift: define ψ : L(k)_n → K^M_n(F)/U¹K^M_{n−1}(F) by {ū_1, …, ū_n} ↦ {u_1, …, u_n} and {ū_1, …, ū_{n−1}}Π ↦ {u_1, …, u_{n−1}, t}. It is well defined on the presentations of K^M_n(k) and K^M_{n−1}(k): changing a lift by a principal unit changes the symbol by an element of U¹K^M_{n−1}(F) (move the principal unit to the front by graded commutativity), and if ū_i + ū_{i+1} = 1 then u_{i+1} = (1 − u_i)·a with a ∈ U¹, so the Steinberg relation holds modulo U¹K^M_{n−1}(F).
4. ψ ∘ d_t is the quotient map on the generators of the second step, hence everywhere; so ker d_t ⊆ U¹K^M_{n−1}(F).

**Acceptance.**

- n = 1: the kernel of f ↦ ({ū_f}, ord f) on F^× is U¹.
- The kernel does not depend on t, since U¹ does not.
- Consequently ker λ_t = U¹K^M_{n−1}(F) + {t}·K^M_{n−1}(F), the second statement of Ex. III.7.2.

**Prerequisites.**

- `K2SymbolsBrauer:T.3/higher-milnor-residues`
- `K2SymbolsBrauer:T.3/serre-residue-algebra`
- `K2SymbolsBrauer:T.2/milnor-k-theory`
- `K2SymbolsBrauer:T.2/milnor-alternating`
- `mathlib:ValuationSubring.ker_unitGroupToResidueFieldUnits`

**Sources.**

- `Kbook.2013`: Ex. III.7.2 (PDF p. 265). The source leaves this as an exercise and uses it in the proof of Corollary III.7.3.1; this node supplies the proof.

### The product formula for the higher residue

`K2SymbolsBrauer:T.3/milnor-residue-product-formula` · lemma · parent `K2SymbolsBrauer:T.3:symbols` · implementation unchecked

For x ∈ K^M_i(F) and y ∈ K^M_j(F): ∂_v(x·y) = λ_t(x)·∂_v(y) + (−1)^j·∂_v(x)·ρ_t(y), where ρ_t : K^M_*(F) → K^M_*(k) is the graded ring homomorphism rhoHom ∘ d_t, characterised by ρ_t{u·t^m} = {(−1)^m ū}. In particular ∂_v(x·y) = x̄·∂_v(y) when x is a product of symbols of units, so ∂_v is a homomorphism of left modules over the image of K^M_*(R^×). This is Ex. III.7.10 as printed, which holds for the roadmap's normalisation; for Theorem III.7.3's normalisation the formula is ∂^{Wb}(x·y) = (−1)^i λ_t(x)·∂^{Wb}(y) + ∂^{Wb}(x)·ρ_t(y) (recorded as a source issue).

**Hypotheses.**

- v is a surjective discrete valuation on F with uniformiser t and residue field k; x ∈ K^M_i(F), y ∈ K^M_j(F).

**Proof outline.**

1. Write d_t(x) = λ(x) + ∂(x)Π and d_t(y) = λ(y) + ∂(y)Π and multiply in L(k) (T.3/serre-residue-algebra): the Π-coefficient of d_t(xy) = d_t(x)d_t(y) is λ(x)∂(y) + (−1)^j∂(x)λ(y) + (−1)^{j−1}∂(x)∂(y){−1}.
2. ρ_t(y) = λ(y) + ∂(y){−1}, and since 2{−1} = 0 the last two terms equal (−1)^j∂(x)ρ_t(y).
3. For x a product of unit symbols, ∂(x) = 0 and λ(x) = x̄.
4. Theorem III.7.3's residue is (−1)^{n−1}∂_v on K^M_n(F) (T.3/higher-milnor-residues); substituting gives the formula in that normalisation.

**Acceptance.**

- Over ℚ at 5, x = {5}, y = {2}: ∂{5, 2} = 0 − 1·{2} = −{2}, i.e. 3 in F_5^×, matching tameSymbol 5 2 = 3.
- x = {2}, y = {5}: ∂{2, 5} = {2}·1 − 0 = {2}, i.e. 2.
- Read with Theorem III.7.3's normalisation, the printed formula would give ∂^{Wb}{5, 2} = 3, contradicting ∂^{Wb}{5, 2} = 2 from Theorem III.7.3.

**Prerequisites.**

- `K2SymbolsBrauer:T.3/higher-milnor-residues`
- `K2SymbolsBrauer:T.3/serre-residue-algebra`

**Sources.**

- `Kbook.2013`: Ex. III.7.10 (PDF p. 266). The product formula; it holds as printed for the roadmap's normalisation and needs the sign (−1)^i on the first term for Theorem III.7.3's (source issue).

### The residue is independent of the uniformiser; the specialisation is not

`K2SymbolsBrauer:T.3/specialisation-change-of-uniformiser` · lemma · parent `K2SymbolsBrauer:T.3:symbols` · implementation unchecked

Let t′ = c·t be a second uniformiser (c ∈ R^×). Then ∂_v computed with t′ equals ∂_v computed with t, and λ_{t′}(x) = λ_t(x) − ∂_v(x)·{c̄} for x ∈ K^M_n(F) (product in K^M_*(k)). In particular λ depends on the uniformiser: in degree one λ_{t′}{t} = −{c̄}, i.e. c̄^{−1}. This corrects Ex. III.7.1, which asserts that λ is independent of π; Weibel's errata make the same correction.

**Hypotheses.**

- v is a surjective discrete valuation on F with valuation ring R and residue field k; t and t′ = c·t are uniformisers, c ∈ R^×.

**Proof outline.**

1. c = t′/t has order zero, so lies in R^× (Valuation.isUnit_iff_ord_eq_zero).
2. In degree one, u·t^i = (u c^{−i})·t′^i, so d_{t′}(u t^i) = {ū} − i{c̄} + iΠ = shift_c(d_t(u t^i)), where shift_c is the automorphism Π ↦ Π − {c̄} of T.3/serre-residue-algebra.
3. Both d_{t′} and shift_c ∘ d_t are graded ring homomorphisms out of K^M_*(F) agreeing in degree one, so they agree.
4. shift_c(λ + ∂Π) = (λ − ∂{c̄}) + ∂Π: the Π-coefficient is unchanged and the Π-free part changes by −∂_v(x)·{c̄}.

**Acceptance.**

- Over ℚ at 5 with t = 5, t′ = 10 (c = 2): λ_5{5} = 1 and λ_{10}{5} = 3 = 2^{−1} in F_5^×; ∂{5} = 1 for both.
- ∂_v is independent of the uniformiser, confirming the first half of Ex. III.7.1.
- λ_t is unchanged when c̄ = 1, i.e. when t′ ≡ t modulo 𝔪².

**Prerequisites.**

- `K2SymbolsBrauer:T.3/higher-milnor-residues`
- `K2SymbolsBrauer:T.3/serre-residue-algebra`
- `tauceti:Valuation.isUnit_iff_ord_eq_zero`

**Sources.**

- `Kbook.2013`: Ex. III.7.1 (PDF p. 265). The exercise's claim for ∂_v is right; its claim for λ is false (the example above), and Weibel's errata to GSM 145 (p. 280, Ex. 7.1) state that λ depends on the choice. Recorded as a source issue with that erratum as known.

### Ramification and the higher residue

`K2SymbolsBrauer:T.3/higher-ramification-formula` · lemma · parent `K2SymbolsBrauer:T.4` · implementation unchecked

Let F → E be any field embedding and v, w normalised surjective discrete valuations satisfying ord_w(f(r)) = e·ord_v(r), e ≥ 1, with the induced residue-field embedding k_v → k_w. No finite-dimensionality hypothesis is imposed. For x ∈ K^M_n(F): ∂_w(res_{E/F} x) = e·res_{k_w/k_v}(∂_v x) in K^M_{n−1}(k_w). In degree two this is T.3/ramification-formula. The statement reads the same in both normalisations, each side changing by (−1)^{n−1}. The finite-extension special case is Exercise III.7.8; the same elementary uniformiser/unit proof gives the stated embedding generalisation, one of the elementary Milnor residue identities Kato's proof uses (with Exercises III.7.7 and III.7.9 and Corollary III.7.6.3); it is parented in T.4, before T.4/milnor-transfer-transitivity, and realises the ramification clause of T.3:localization-comparison.

**Hypotheses.**

- F → E is an arbitrary field embedding, v and w are normalised surjective discrete valuations, ord_w(f(r)) = e·ord_v(r), and e ≥ 1. A valuation on E trivial on F is a separate case, not a positive-e extension of v.

**Proof outline.**

1. First construct the local valuation-ring map and residue-field embedding using e > 0 (T.3/tame-symbol, residueFieldMap). Choose uniformisers t for v and s for w; then f(t) = c·s^e with c a unit of the valuation ring of w. No step uses [E : F] or algebraicity.
2. K^M_n(F) is generated by symbols {u_1, …, u_n} and {u_1, …, u_{n−1}, t} with u_i ∈ R^× (the generation step of T.3/serre-map-kernel).
3. ∂_w{u_1, …, u_n} = 0 = e·∂_v{u_1, …, u_n}; and ∂_w{u_1, …, u_{n−1}, c s^e} = ∂_w{u_1, …, u_{n−1}, c} + e·∂_w{u_1, …, u_{n−1}, s} = 0 + e·{ū_1, …, ū_{n−1}} = e·res(∂_v{u_1, …, u_{n−1}, t}).
4. For a valuation w on E whose restriction to F is trivial, every f(a), a ∈ F^×, is a unit of 𝒪_w. The residue of each imported symbol vanishes by higher-milnor-residues (milnorResidue_symbol_units), and therefore ∂_w ∘ res = 0 on the whole Milnor group by generation. Do not construct a residue-field map for e = 0.

**Acceptance.**

- n = 1: ord_w(r) = e·ord_v(r).
- n = 2: the e-th power formula of T.3/ramification-formula.
- The residue fields enter only through res_{k_w/k_v}; the inertia degree does not appear.
- Infinite constant extension F(t) → F(u)(t): at the place t, e = 1 and k_v = F → F(u) = k_w; ∂_w{a,t} is the image of a for a ∈ F^×. For F = ℚ and a = 2 this is 2, not its inverse.
- Completion F → F̂_v has e = 1 and the same residue field, so the formula gives ∂_{v̂} ∘ res = ∂_v without requiring the completion to be finite over F.
- Trivial-restriction case: the place t−u of F(u)(t) is trivial on F(t), because every nonzero polynomial p(t) ∈ F[t] has p(u) ≠ 0. Every imported Milnor symbol therefore has zero residue there.

**Prerequisites.**

- `K2SymbolsBrauer:T.3/higher-milnor-residues`
- `K2SymbolsBrauer:T.3/serre-map-kernel`
- `K2SymbolsBrauer:T.3/ramification-formula`
- `K2SymbolsBrauer:T.2/milnor-k-theory`

**Unit tests.**

- `TauCeti.MilnorK.higher_ramification_infinite` (compatibility) — Instantiate higher_ramification_formula at ℚ → ℚ(u), the 5-adic valuation and its e = 1 Gauss extension: the residues commute in every degree, with k_w = F_5(u). The suggested instance has the actual RatFunc ℚ carrier and no FiniteDimensional hypothesis.
- `TauCeti.MilnorK.higher_residue_trivial_restriction` (degenerate) — For any field embedding F → E and surjective discrete w trivial on F^×, the residue of every imported symbol {a_1,…,a_{n+1}} is 0. In particular this applies to F(t) → F(u)(t) at t−u, which has no positive ramification index over a nontrivial place of F(t).

**Sources.**

- `Kbook.2013`: Ex. III.7.8 (PDF p. 265). The statement, left as an exercise in the source. The arbitrary-embedding extension is derived by the displayed uniformiser/unit calculation; the printed exercise only assumes a finite extension.

### The Bass–Tate (Milnor) exact sequence for a rational function field

`K2SymbolsBrauer:T.4/bass-tate-sequence` · theorem · parent `K2SymbolsBrauer:T.4` · implementation unchecked

For a field F and n ≥ 1 the sequence 0 → K^M_n(F) → K^M_n F(t) −∂→ ⊕_π K^M_{n−1}(F[t]/(π)) → 0, with π over the monic irreducible polynomials (the finite places of F(t)) and ∂ = (∂_π)_π the higher residues of T.3/higher-milnor-residues, is exact, natural in F, and split by the leading-coefficient map λ of T.4/leading-coefficient-splitting. The residue ∂_∞ at the place at infinity is not a component of ∂; since ∂_∞ vanishes on K^M_n(F), exactness makes it factor uniquely through ∂, which defines the transfers (T.4/simple-transfer) and gives the reciprocity formula for the projective line (T.4/projective-line-reciprocity). The K-book proves the sequence (Theorem III.7.4, attributed to Milnor); the roadmap calls it the Bass–Tate sequence.

**Hypotheses.**

- F is a field, t an indeterminate and n ≥ 1; for n = 0 the sequence is 0 → ℤ → ℤ → 0 → 0.
- The sum is over the finite places of F(t); the place at infinity is not among them.
- Residues are those of T.3/higher-milnor-residues; the sequence is the same for the K-book's ∂^{Wb} = (−1)^{n−1}∂, every residue in a given degree changing by the same sign.

**Proof outline.**

1. Identify the finite places of F(t) with the monic irreducible polynomials and their residue fields with F[t]/(π) (pinned ratFuncEquiv and adicOfIrreducibleResidueFieldEquiv); the remaining place is ∞.
2. The residue sum lands in the direct sum: a symbol has nonzero residue only at the finitely many π dividing a numerator or denominator of an entry (the residue of a symbol of units vanishes; pinned finiteness of the support of ord).
3. L_0 is the image of K^M_n(F), split off by λ (T.4/leading-coefficient-splitting), and K^M_n F(t) is the union of the L_d of T.4/degree-reduction.
4. Induction on d with T.4/filtration-quotients: the residues at the π of degree ≤ d map L_d onto their direct sum with kernel L_0, because the degree-d residues vanish on L_{d−1} and induce an isomorphism on L_d/L_{d−1}; the union gives exactness in the middle and on the right.
5. Naturality in F: along F → F′ each π factors over F′ and the residues correspond with the multiplicities of the higher ramification formula (T.3/higher-ramification-formula).
6. Record the role of ∞ as in the statement.

**Acceptance.**

- In degree one it is 0 → F^× → F(t)^× → ⊕_π ℤ → 0, the divisor sequence of the affine line.
- In degree two it is the split exact sequence of Application III.6.5.2.
- Non-example: with ∂_∞ added the map is not onto; in degree one its image is the kernel of the degree map on divisors of ℙ¹, so the divisor of the single point ∞ is not in the image.

**Prerequisites.**

- `K2SymbolsBrauer:T.4/leading-coefficient-splitting`
- `K2SymbolsBrauer:T.4/filtration-quotients`
- `K2SymbolsBrauer:T.4/degree-reduction`
- `K2SymbolsBrauer:T.3/higher-milnor-residues`
- `K2SymbolsBrauer:T.3/finite-support`
- `K2SymbolsBrauer:T.3/higher-ramification-formula`
- `K2SymbolsBrauer:T.2/milnor-k-theory`
- `tauceti:TauCeti.Place.ratFuncEquiv`
- `tauceti:TauCeti.Place.adicOfIrreducibleResidueFieldEquiv`
- `tauceti:TauCeti.Place.finite_setOf_ord_ne_zero`

**Sources.**

- `Kbook.2013`: III.7.4, Theorem 7.4 (PDF p. 255; book p. 247). The theorem, attributed by the source to Milnor.
- `Kbook.2013`: III.7.4, proof of Theorem 7.4 (PDF p. 255; book p. 247). The proof by the degree filtration, whose steps are the lemmas above; 'fr' is a misprint for 'fn'.
- `Kbook.2013`: III.6.5.2, Application 6.5.2 (PDF p. 244; book p. 236). The degree-two case (the display 1 → K2(F) → K2F(t) → ∐(F[t]/p)× → 1 follows it).

### Milnor norms of finite extensions and Kato's transitivity theorem

`K2SymbolsBrauer:T.4/milnor-transfer-transitivity` · theorem · parent `K2SymbolsBrauer:T.4` · implementation unchecked

For a finite extension E = F(a_1, …, a_r), the composite N_{a_1/F} ∘ N_{a_2/F(a_1)} ∘ ⋯ ∘ N_{a_r/F(a_1, …, a_{r−1})} of the simple transfers of T.4/simple-transfer (Definition III.7.6) does not depend on the choice of generators (Kato). Hence the Milnor norm N_{E/F} : K^M_*(E) → K^M_*(F) is well defined, N_{E/F} = N_{F′/F} ∘ N_{E/F′} for every intermediate field F′, it is multiplication by [E : F] in degree zero and Algebra.norm F in degree one, and for a simple extension N_{E/F} = N_{a/F} for every generator a.

**Hypotheses.**

- E/F is a finite field extension.

**Proof outline.**

1. Define the composite along a chain of generators (Definition III.7.6).
2. The indeterminacy is annihilated by [E : F]: compare after restriction to E (T.4/transfer-base-change with F′ = E) and use restriction followed by transfer (T.4/simple-transfer). By T.4/prime-to-p-closure it therefore suffices, for each prime p, to prove independence when every finite extension of F has p-power degree.
3. For such F every extension of degree p is normal (a subgroup of index p in a p-group is normal), so the steps of a maximal tower (all of degree p) have well-defined transfers by T.4/kato-prime-degree.
4. Two maximal towers with different first steps F_1 ≠ F′ are compared by T.4/kato-commuting-square (with E = F′F_1); induction on [E : F] gives independence of the maximal tower.
5. A simple step F ⊂ F′ = F(a) refined by a maximal tower F ⊂ F_1 ⊂ F′ satisfies N_{a/F} = N_{F_1/F} ∘ N_{F′/F_1}: this is T.4/kato-commuting-square with E = F_1 and E′ = F′.
6. Degree one: each simple step is Algebra.norm (T.4/transfer-low-degrees), and the composite is Algebra.norm by the pinned transitivity Algebra.norm_norm.

**Acceptance.**

- In degree one N_{E/F} is Algebra.norm F and transitivity is the pinned Algebra.norm_norm.
- For a simple extension N_{E/F} = N_{a/F} for every generator a, which is not part of the definition of T.4/simple-transfer.
- Independence is a theorem: the reduction to towers of prime degree and the comparison of two towers are its substance.
- Kato's independence of the chain of generators is stated here, not assumed; MotivicEtaleKTheory M.4 imports the norm with this independence (edge T.4 → M.4).

**Prerequisites.**

- `K2SymbolsBrauer:T.4/simple-transfer`
- `K2SymbolsBrauer:T.4/prime-to-p-closure`
- `K2SymbolsBrauer:T.4/kato-prime-degree`
- `K2SymbolsBrauer:T.4/kato-commuting-square`
- `K2SymbolsBrauer:T.4/transfer-base-change`
- `K2SymbolsBrauer:T.4/transfer-low-degrees`
- `mathlib:Algebra.norm_norm`

**Sources.**

- `Kbook.2013`: III.7.6, Definition 7.6 (PDF p. 257; book p. 249). The definition by composition along generators.
- `Kbook.2013`: III.7.6.1, Theorem 7.6.1 (PDF p. 257; book p. 249). Kato's theorem.
- `Kbook.2013`: III.7.6.1, proof of Theorem 7.6.1 (PDF p. 258; book p. 250). The reduction to towers of degree-p steps.

### Suslin's reciprocity law: Weil reciprocity in every degree for a proper curve over any field

`K2SymbolsBrauer:T.4/weil-reciprocity` · theorem · parent `K2SymbolsBrauer:T.4` · implementation unchecked

Let F be any field and K a function field of one variable over F (IsFunctionField F K), for instance the function field of a proper integral curve C over F. The places P of K/F are the closed points of the normalisation of C, which is the regular proper model of K/F (T.4/valuation-comparison, importing AlgebraicCurves Layer 12); it is regular but need not be smooth over F when F is imperfect, and each residue field k(P) is a finite extension of F, possibly inseparable. For x ∈ K^M_{n+1}(K) the residue ∂_P(x) vanishes at all but finitely many places P, and Σ_P N_{k(P)/F} ∂_P(x) = 0 in K^M_n(F), where ∂_P is the higher residue of T.3/higher-milnor-residues and N_{k(P)/F} is Kato's Milnor norm (T.4/milnor-transfer-transitivity), defined for every finite extension, separable or not. This is Suslin's reciprocity law in all degrees; its degree-two form with the roadmap's tame symbol and field norms is T.4/weil-reciprocity-symbol-form. It is stated over places (equivalently over the closed points of the regular model), never over the points of a possibly singular C and never under a smoothness hypothesis. MotivicEtaleKTheory M.4 imports it, with T.4's norms, for the Nesterenko–Suslin/Totaro comparison of Milnor K-theory with the diagonal higher Chow groups.

**Hypotheses.**

- F is a field, of any characteristic and not necessarily perfect, and K/F is a function field of one variable; residues are normalised as in T.3/higher-milnor-residues.
- The sum is over the places of K/F, the closed points of the regular proper model (the normalisation of any proper model); no smoothness over F is assumed, and the residue extensions k(P)/F may be inseparable.

**Proof outline.**

1. Finite support: an element has nonzero order at finitely many places (pinned finite_setOf_ord_ne_zero), and the residue of a symbol of units vanishes (T.3/finite-support).
2. Choose t ∈ K transcendental over F, so that K/F(t) is finite; each place P of K lies over exactly one place v of F(t), and each fibre is finite (pinned restrict and finite_setOf_restrict_eq). When K/F is separably generated t can be chosen with K/F(t) separable; when it is not, which happens only over an imperfect F, K/F(t) is inseparable for every t.
3. The finiteness hypothesis of T.3/transfer-and-norm-residue holds at every place v of F(t): its valuation ring is a localisation of F[t] or of F[t^{−1}], so it suffices that the integral closure of F[t] (and of F[t^{−1}]) in K is a finite module. For K/F(t) separable this is pinned in the form Σ_{P|v} e(P|v) f(P|v) = [K : F(t)] (TauCeti.Place.sum_ramificationIdx_mul_relativeDegree_eq_finrank_of_isSeparable); for K/F(t) purely inseparable the finiteness is pinned (TauCeti.IsIntegralClosure.finite_mvPolynomial_of_isPurelyInseparable with r = 1); the general inseparable case, Noether's finiteness theorem, is not pinned in this form (gap 'Finiteness of integral closures in inseparable extensions of function fields').
4. Apply the norm–residue formula ∂_v ∘ N_{K/F(t)} = Σ_{P|v} N_{k(P)/k(v)} ∘ ∂_P (T.3/transfer-and-norm-residue; the general formula is itself not proved in the source read, see that gap) to x; the residue extensions k(P)/k(v) may be inseparable, and their norms are Kato's.
5. Apply T.4/projective-line-reciprocity to N_{K/F(t)}(x), and use N_{k(v)/F} ∘ N_{k(P)/k(v)} = N_{k(P)/F} (Kato's transitivity, T.4/milnor-transfer-transitivity), noting that for a finite place v the simple transfer N_{t̄/F} used there is Kato's N_{k(v)/F}.
6. Read the sum over closed points of the regular proper model through T.4/valuation-comparison (AlgebraicCurves Layer 12).
7. Record the source statement: the K-book proves the same formula in Quillen K-theory for a projective curve over any field (Gillet, V.6.12.1) through the curve localisation sequence and the proper transfer. Identifying the two in degree two needs T.3/milnor-quillen-transfer-comparison, which lies downstream of this layer and is not used here.

**Acceptance.**

- For K = F(t) it is T.4/projective-line-reciprocity.
- In degree one (n = 0) it says that a principal divisor has degree zero, Σ_P deg(P)·ord_P(f) = 0, the pinned Tau Ceti product formula TauCeti.Divisor.degree_principal.
- Inseparable residue fields occur and need Kato's norm: for F = 𝔽_p(s) and K = F(s^{1/p})(t), every place of K/F has residue field containing F(s^{1/p}), purely inseparable of degree p over F, and in degree one N_{F(s^{1/p})/F}(α) = α^p.
- Only finitely many terms are nonzero.
- Consumers: EllipticKTheory E.2 and EllipticRegulators use the degree-two form to construct and descend regulator classes; HigherLocalFields HL.6 uses the relation along a curve; MotivicEtaleKTheory M.4 uses it in every degree to kill the boundaries in the inverse of the diagonal cycle map (edge T.4 → M.4).

**Prerequisites.**

- `K2SymbolsBrauer:T.4/projective-line-reciprocity`
- `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`
- `K2SymbolsBrauer:T.3/transfer-and-norm-residue`
- `K2SymbolsBrauer:T.4/valuation-comparison`
- `K2SymbolsBrauer:T.3/finite-support`
- `K2SymbolsBrauer:T.3/higher-milnor-residues`
- `tauceti:TauCeti.Place.restrict`
- `tauceti:TauCeti.Place.finite_setOf_restrict_eq`
- `tauceti:TauCeti.Place.finite_setOf_ord_ne_zero`
- `tauceti:TauCeti.Place.sum_ramificationIdx_mul_relativeDegree_eq_finrank_of_isSeparable`
- `tauceti:TauCeti.IsIntegralClosure.finite_mvPolynomial_of_isPurelyInseparable`
- `K2SymbolsBrauer:T.4/mixed-function-field-normalization`

**Sources.**

- `Kbook.2013`: V.6.12.1, Weil Reciprocity Formula 6.12.1 (PDF p. 424; book p. 416), proof on PDF p. 425. The curve formula in Quillen K-theory, proved by Gillet's argument; for n + 1 = 2 it is this node's statement, and in higher degrees the Milnor form is proved by the transfer argument of the proof steps.
- `Kbook.2013`: V.6.12, the paragraph before 6.12.1 (PDF p. 424; book p. 416). The source presents it as the generalisation of III.6.5.3.
- `Kbook.2013`: III.7.5.1, Weil Reciprocity Formula 7.5.1 (PDF p. 256; book p. 248). The projective-line case in Milnor K-theory.
- `Weibel.KBook.III`: III.7.6.1, Theorem 7.6.1 (p. 64). Kato's norm is defined for every finite extension E/F, with no separability hypothesis; the residue-field norms of the reciprocity law are these.

### Closed points of the regular proper model against places: AlgebraicCurves Layer 12 imported, tame symbols transported

`K2SymbolsBrauer:T.4/valuation-comparison` · comparison · parent `K2SymbolsBrauer:T.4` · implementation unchecked

Let K be a function field of one variable over F and X the proper regular integral curve with function field K (the normalisation of ℙ¹_F in K, AlgebraicCurves Layer 12B; any proper integral curve with function field K has X as its normalisation). AlgebraicCurves Layer 12 supplies, and this node imports rather than proves: ord_x : K^× → ℤ at each regular closed point through the discrete valuation ring O_{X,x} (12A); the bijection x ↦ P_x between closed points of X and places of K/F, with Scheme.ord at x equal to the order at P_x and κ(x) ≃ₐ[F] k(P_x), degrees matching (12A–12B); and Weil divisors on X ≅ Divisor F K, matching degrees and principal divisors (12D). X is regular but need not be smooth over F when F is imperfect (Layer 12's 'regular, not smooth' convention, adopted here). What this node adds is the transport of the K_2 data: the roadmap's tame symbol at x, formed with ord_x and κ(x), is carried to the tame symbol at P_x, N_{κ(x)/F} = N_{k(P_x)/F}, and div f on X is Tau Ceti's Divisor.principal f; so the reciprocity product over X^{(1)} is the product over the places of K/F.

**Hypotheses.**

- X is integral, proper (hence projective, Layer 12B), regular and of dimension one over F; no smoothness over F is assumed.
- The dictionary is AlgebraicCurves Layer 12's (12A, 12B, 12D), imported as stated there.

**Proof outline.**

1. Import from AlgebraicCurves Layer 12 the closed-point/place bijection with Scheme.ord equal to the place order and κ(x) ≃ₐ[F] k(P_x) (12A–12B), and the identification of Weil divisors on X with Divisor F K, principal divisors included (12D).
2. The tame symbol depends only on the discrete valuation and its residue map (T.3/tame-symbol-uniformizer-independence), so equal valuations and compatible residue maps give equal symbols, transported along κ(x) ≃ₐ[F] k(P_x).
3. Field norms, and Kato's norms in every degree, are invariant under an F-algebra equivalence of residue fields.
4. No comparison of valuations is proved here: the valuation dictionary is Layer 12's, and this node only transports the symbols along it.

**Acceptance.**

- For X = ℙ¹_F the places are those of the pinned ratFuncEquiv, including ∞.
- On an affine chart Spec R the comparison is the pinned correspondence between the places finite on R and the height-one primes of R.
- The comparison is of discrete valuations together with their residue maps: equality of orders alone would not identify the residues of the tame symbols.
- Regular, not smooth: over F = 𝔽_p(s), p odd, the curve y² = x^p − s is regular at the closed point y = 0, x^p = s (its maximal ideal is generated by y) but not smooth there (both partial derivatives vanish), and its residue field F(s^{1/p}) is purely inseparable over F.

**Prerequisites.**

- `mathlib:AlgebraicGeometry.Scheme.ord`
- `K2SymbolsBrauer:T.3/tame-symbol`
- `K2SymbolsBrauer:T.3/tame-symbol-uniformizer-independence`
- `tauceti:TauCeti.Place.heightOneSpectrumEquiv`
- `tauceti:TauCeti.Place.ratFuncEquiv`
- `tauceti:TauCeti.Divisor.principal`

**Sources.**

- `Kbook.2013`: V.6.12, Smooth Curves 6.12 (PDF p. 424; book p. 416). The closed points and their residue fields, as the source uses them for Weil reciprocity.
- `Kbook.2013`: III.6.3 (PDF p. 242; book p. 234). The valuation-theoretic side: the tame symbol is attached to a discrete valuation ring.

### The projection formula for the transfer

`K2SymbolsBrauer:T.4/milnor-projection-formula` · lemma · parent `K2SymbolsBrauer:T.4` · implementation unchecked

For E = F(a), x ∈ K^M_*(F) and y ∈ K^M_*(E): N_{a/F}(res_{E/F}(x)·y) = x·N_{a/F}(y). By Definition III.7.6 and Kato's theorem the same holds for N_{E/F} for every finite E/F.

**Hypotheses.**

- E = F(a) is a finite extension; x ∈ K^M_i(F), y ∈ K^M_j(E).

**Proof outline.**

1. For x ∈ K^M_*(F) and any valuation q of F(t) trivial on F (finite or ∞), the entries of x have order zero, so ∂_q(x·z) = x̄·∂_q(z) by T.3/milnor-residue-product-formula (∂_q(x) = 0, λ(x) = x̄).
2. Choose z ∈ K^M_{j+1}F(t) with ∂_p z = y and ∂_q z = 0 for q ≠ p; then x·z has ∂_p(xz) = res(x)·y and ∂_q(xz) = 0, so N_{a/F}(res(x)·y) = −∂_∞(xz) = −x·∂_∞(z) = x·N_{a/F}(y).

**Acceptance.**

- y = 1 ∈ K^M_0(E) gives N_{a/F}(res x) = [E : F]·x (T.4/restriction-transfer-degree).
- Degree one with y = 1: N_{E/F}(x) = x^{[E:F]} for x ∈ F^×, the field-norm identity.
- The formula holds in both normalisations of the residue.

**Prerequisites.**

- `K2SymbolsBrauer:T.4/simple-transfer`
- `K2SymbolsBrauer:T.3/milnor-residue-product-formula`
- `K2SymbolsBrauer:T.4/bass-tate-sequence`

**Sources.**

- `Kbook.2013`: Projection Formula III.7.5.2 (PDF p. 256). The statement.
- `Kbook.2013`: Projection Formula III.7.5.2, proof (PDF p. 256). The source's proof; the module property of ∂_p is the product formula with a unit factor (T.3/milnor-residue-product-formula), not Theorem III.7.4 itself.

### Restriction followed by transfer is multiplication by the degree

`K2SymbolsBrauer:T.4/restriction-transfer-degree` · lemma · parent `K2SymbolsBrauer:T.4` · implementation unchecked

For E = F(a) of degree d, N_{a/F} ∘ res_{E/F} = d·id on K^M_*(F); hence the kernel of res_{E/F} : K^M_*(F) → K^M_*(E) is killed by d. By composition along a generating tower the same holds for N_{E/F} and every finite E/F, degrees multiplying.

**Hypotheses.**

- E = F(a) is a finite extension of degree d.

**Proof outline.**

1. Apply T.4/milnor-projection-formula with y = 1 ∈ K^M_0(E): N(res x) = x·N(1).
2. N(1) = d by the degree-zero case of T.4/simple-transfer.

**Acceptance.**

- Degree one: N_{E/F}(x) = x^d for x ∈ F^×.
- Degree zero: the composite ℤ → ℤ → ℤ is multiplication by d.

**Prerequisites.**

- `K2SymbolsBrauer:T.4/milnor-projection-formula`
- `K2SymbolsBrauer:T.4/simple-transfer`

**Sources.**

- `Kbook.2013`: Corollary III.7.5.3 (PDF p. 256). The statement.

### Leading coefficients split K^M_n(F) off K^M_n F(t) (Example III.7.3.2)

`K2SymbolsBrauer:T.4/leading-coefficient-splitting` · lemma · parent `K2SymbolsBrauer:T.4` · implementation unchecked

Let F be a field and, for nonzero f ∈ F(t), let lead(f) be the quotient of the leading coefficients of its numerator and denominator. Let λ: K^M_n F(t) → K^M_n(F) be the specialisation map of T.3/higher-milnor-residues at the place at infinity (order −deg, residue field F) with respect to the uniformiser t^{−1}. Then λ{f_1, …, f_n} = {lead(f_1), …, lead(f_n)}, λ is the identity on the image of K^M_n(F), so K^M_n(F) → K^M_n F(t) is a split injection in every degree, and the residue ∂_∞ vanishes on that image.

**Hypotheses.**

- F is a field and n ≥ 0.
- The specialisation is taken with respect to the uniformiser t^{−1}; with another uniformiser it changes, so the uniformiser is part of the data.

**Proof outline.**

1. Write a nonzero f as u·(t^{−1})^{i} with i = ord_∞(f) = −deg(f) and u a unit at infinity whose residue is lead(f), using the pinned order and uniformiser at infinity and the pinned identification of the residue field at infinity with F.
2. Apply the value of the specialisation on symbols, λ{u_1π^{i_1}, …, u_nπ^{i_n}} = {ū_1, …, ū_n} (T.3/higher-milnor-residues); no separate check of the Steinberg relation is needed, since λ is already a homomorphism on K^M_n F(t).
3. A constant c has lead(c) = c, so λ is a left inverse of the natural map.
4. Constants are units at infinity and the residue of a symbol of units vanishes, so ∂_∞ is zero on the image of K^M_n(F).

**Acceptance.**

- In degree one λ is the homomorphism f ↦ lead(f) from F(t)^× to F^×.
- In degree two λ is the leading-coefficient map of Example III.6.1.2, which the companion node K2SymbolsBrauer:T.2/rational-function-field plans for K_2; the author's errata list corrects that example's three-case check when lead(f) = 1, a case this route does not need.
- Non-example: over ℚ, with the uniformiser 2t^{−1} instead of t^{−1}, the specialisation sends {t} ∈ K^M_1 to 2 rather than 1, so the formula is tied to t^{−1} (compare the author's erratum to Exercise III.7.1: λ depends on the uniformiser).

**Prerequisites.**

- `K2SymbolsBrauer:T.3/higher-milnor-residues`
- `K2SymbolsBrauer:T.2/milnor-k-theory`
- `tauceti:TauCeti.Place.ord_infty`
- `tauceti:TauCeti.Place.isUniformizer_infty`
- `tauceti:TauCeti.Place.inftyResidueFieldEquiv`

**Sources.**

- `Kbook.2013`: III.7.3.2, Example 7.3.2 (PDF p. 255; book p. 247). The statement, with the place at infinity and its parameter t^{−1}; here f = u·t^{−i} with i = v∞(f) = −deg f.
- `Kbook.2013`: III.7.3.2, Example 7.3.2 (PDF p. 255; book p. 247). The formula for λ and the splitting.

### Degree reduction for symbols of polynomials (Exercise III.6.2, corrected)

`K2SymbolsBrauer:T.4/degree-reduction` · lemma · parent `K2SymbolsBrauer:T.4` · implementation unchecked

Let F be a field, d ≥ 1, and L_d ⊂ K^M_n F(t) the subgroup generated by the symbols {f_1, …, f_n} whose entries are nonzero polynomials of degree at most d. (i) If e_1 ≠ e_2 are monic polynomials of degree d and h = e_1 − e_2 (nonzero, of degree < d), then {e_1, e_2} = {h, e_2} − {h, e_1} + {e_1, −1} in K^M_2 F(t). (ii) Consequently L_d is generated by L_{d−1} together with the symbols {π, a_2, …, a_n} with π monic irreducible of degree d and each a_i a nonzero polynomial of degree < d. The source's Exercise III.6.2, which allows only e_1 as an entry of degree d, is false as printed; (i) is what the source's proof of Lemma III.7.4.2 uses.

**Hypotheses.**

- F is a field, t an indeterminate, d ≥ 1 and n ≥ 1; L_0 is the image of K^M_n(F).

**Proof outline.**

1. (i): h/e_1 + e_2/e_1 = 1 with h ≠ 0 and h ≠ e_1, so the Steinberg relation gives {h/e_1, e_2/e_1} = 0; expand by multiplicativity and use {e_1, e_1} = {e_1, −1}. For d = 1 this is the computation of Lemma III.6.1.4.
2. (ii): scale every entry of a generator of L_d to be monic; the constants lie in L_0 ⊂ L_{d−1}.
3. While two entries have degree d, bring them next to each other by the alternating property, apply (i) multiplied by the remaining entries, and note that each resulting symbol has fewer entries of degree d.
4. A reducible entry of degree d is a product of polynomials of degree < d, which puts the symbol in L_{d−1}; an irreducible one is moved to the first place by the alternating property, at the cost of a sign.

**Acceptance.**

- Over ℚ(t), {t, t − 2} has residue 1/2 at the place t = 2 (K-book normalisation), while every symbol {t, c} or {c, c′} with c, c′ ∈ ℚ^× has trivial residue there; so {t, t − 2} is not a product of such symbols, as the printed exercise would require, but (i) writes it as {2, t − 2} − {2, t} + {t, −1}.
- For d = 1, (i) is Lemma III.6.1.4.
- (ii) is exactly the generation statement that the proof of Lemma III.7.4.2 cites from Exercise III.6.2.

**Prerequisites.**

- `K2SymbolsBrauer:T.2/milnor-k-theory`
- `K2SymbolsBrauer:T.2/milnor-alternating`
- `K2SymbolsBrauer:T.2/symbol-consequences`

**Sources.**

- `Kbook.2013`: III, Exercise 6.2 (PDF p. 251; book p. 243). The exercise the proof of Lemma III.7.4.2 cites. As printed it is false (see the source issue recorded by this review); the node states the corrected form.
- `Kbook.2013`: III.6.1.4, Lemma 6.1.4 and its proof (PDF p. 240; book p. 232). The case d = 1, which is correct as printed.
- `Kbook.2013`: III.6.1.4, Lemma 6.1.4 and its proof (PDF p. 240; book p. 232). The computation that (i) generalises.
- `Kbook.2013`: III.7.4.2, proof of Lemma 7.4.2 (PDF p. 256; book p. 248). How the source uses the exercise: only the generation statement (ii) is needed.

### The section h_π on the degree filtration (Lemma III.7.4.1)

`K2SymbolsBrauer:T.4/residue-section` · lemma · parent `K2SymbolsBrauer:T.4` · implementation unchecked

Let π ∈ F[t] be monic irreducible of degree d ≥ 1, k_π = F[t]/(π), and L_d as in T.4/degree-reduction. There is a unique homomorphism h_π : K^M_{n−1}(k_π) → L_d/L_{d−1} sending {ā_1, …, ā_{n−1}} to the class of {a_1, …, a_{n−1}, π}, where a_i ∈ F[t] is the unique representative of ā_i of degree < d. The source's h_π puts π first; the two differ by the sign (−1)^{n−1}, the same sign by which Theorem III.7.3's residue ∂^{Wb} differs from the residue ∂ of T.3/higher-milnor-residues, so each is a section of its own residue.

**Hypotheses.**

- F is a field, n ≥ 1 and π is monic irreducible of degree d; for n = 1 the source group is K^M_0(k_π) = ℤ and h_π(1) is the class of {π}.

**Proof outline.**

1. The steps below are written, as in the source, with π in the first slot; moving π to the last slot multiplies every symbol by (−1)^{n−1} and changes none of the arguments.
2. Representatives of degree < d exist and are unique: reduction modulo the monic π (pinned modByMonic and its degree bound).
3. Multiplicativity in ā_2: if ā_2 = ā′_2·ā″_2 and a_2 ≠ a′_2a″_2, write a_2 = a′_2a″_2 + fπ with f a nonzero polynomial of degree < d; the Steinberg relation {fπ/a_2, a′_2a″_2/a_2} = 0, multiplied by {a_3, …, a_n}, gives {π, a′_2a″_2/a_2, a_3, …, a_n} ≡ 0 modulo L_{d−1}, because the remaining terms of the expansion have all entries of degree < d. The same argument works in every slot.
4. Steinberg relation: if ā_i + ā_{i+1} = 1 in k_π then a_i + a_{i+1} − 1 has degree < d and is divisible by π, so a_i + a_{i+1} = 1 in F[t] (the source says 'in F') and the symbol vanishes.
5. The multilinear map descends through the presentation of K^M_{n−1}(k_π) (T.2/milnor-k-theory); uniqueness holds because the symbols generate.

**Acceptance.**

- For n = 1, h_π(1) is the class of {π} and ∂_π{π} = 1 in ℤ.
- For d = 1, π = t − b and k_π = F, h_π{c_2, …, c_n} is the class of {c_1, …, c_{n−1}, t − b}.
- Followed by the residue ∂_π it is the identity (T.4/filtration-quotients), which pins its normalisation.

**Prerequisites.**

- `K2SymbolsBrauer:T.4/degree-reduction`
- `K2SymbolsBrauer:T.2/milnor-k-theory`
- `mathlib:Polynomial.modByMonic`
- `mathlib:Polynomial.degree_modByMonic_lt`

**Sources.**

- `Kbook.2013`: III.7.4.1, Lemma 7.4.1 and the paragraph before it (PDF p. 255; book p. 247). The statement, with the choice of representatives of degree < d.
- `Kbook.2013`: III.7.4.1, proof of Lemma 7.4.1 (PDF p. 255; book p. 247). The linearity argument; its last step 'ai + ai+1 = 1 in F' should read 'in F[t]' (see the source issue).

### The graded pieces of the degree filtration (Lemma III.7.4.2)

`K2SymbolsBrauer:T.4/filtration-quotients` · lemma · parent `K2SymbolsBrauer:T.4` · implementation unchecked

For d ≥ 1 the maps h_π of T.4/residue-section, over the monic irreducible π of degree d, induce an isomorphism ⊕_{deg π = d} K^M_{n−1}(k_π) ≅ L_d/L_{d−1} whose inverse is induced by the residues ∂_π: each ∂_π with deg π = d vanishes on L_{d−1}, ∂_π ∘ h_π is the identity, and ∂_{π′} ∘ h_π = 0 for π′ ≠ π of degree d. Residues are those of T.3/higher-milnor-residues, ∂_π{u_1, …, u_{n−1}, π} = {ū_1, …, ū_{n−1}}, which in degree two is the roadmap's tame symbol; with Theorem III.7.3's ∂^{Wb} and the source's h_π (π first) the statement is the same.

**Hypotheses.**

- F is a field, n ≥ 1, d ≥ 1; the residue field of the place of π is identified with F[t]/(π) by the pinned equivalence.

**Proof outline.**

1. π divides no nonzero polynomial of degree < d, so every entry of a generator of L_{d−1} is a unit at π and ∂_π vanishes on L_{d−1}.
2. On h_π{ā_1, …} = [{a_1, …, π}]: ∂_π gives {ā_1, …} by the formula of T.3/higher-milnor-residues, and for π′ ≠ π of degree d every entry is a unit at π′.
3. So ⊕∂̄_π ∘ ⊕h_π is the identity, and ⊕h_π is onto by T.4/degree-reduction (ii).

**Acceptance.**

- For d = 1 and F algebraically closed, L_1/L_0 ≅ ⊕_{b ∈ F} K^M_{n−1}(F), which in degree two is Example III.6.1.7.
- In degree one (n = 1) it says that the monic irreducible polynomials of degree d form a basis of the free abelian group L_d/L_{d−1}.
- ∂_π vanishes on L_{d−1} but not on L_d, which is what drives the induction on d.

**Prerequisites.**

- `K2SymbolsBrauer:T.4/residue-section`
- `K2SymbolsBrauer:T.4/degree-reduction`
- `K2SymbolsBrauer:T.3/higher-milnor-residues`
- `tauceti:TauCeti.Place.adicOfIrreducibleResidueFieldEquiv`
- `tauceti:TauCeti.Place.isUniformizer_adicOfIrreducible`

**Sources.**

- `Kbook.2013`: III.7.4.2, Lemma 7.4.2 (PDF p. 255; book p. 247). The statement.
- `Kbook.2013`: III.7.4.2, proof of Lemma 7.4.2 (PDF p. 256; book p. 248). The proof, first half.
- `Kbook.2013`: III.7.4.2, proof of Lemma 7.4.2 (PDF p. 256; book p. 248). The proof, second half: surjectivity through Exercise 6.2, here T.4/degree-reduction.

### The Milnor transfer of a simple extension (Definition III.7.5)

`K2SymbolsBrauer:T.4/simple-transfer` · construction · parent `K2SymbolsBrauer:T.4` · implementation unchecked

Let E = F(a) be a finite extension, π the minimal polynomial of a, and E ≅ F[t]/(π) by t ↦ a. Since ∂_∞ vanishes on K^M_{n+1}(F) and the residue sum is surjective with kernel K^M_{n+1}(F) (T.4/bass-tate-sequence), there are unique homomorphisms N_p : K^M_n(F[t]/p) → K^M_n(F), p over the monic irreducible polynomials, with −∂_∞ = Σ_p N_p ∘ ∂_p on K^M_{n+1}F(t). The transfer N_{a/F} : K^M_n(E) → K^M_n(F) is N_π transported to E; equivalently N_{a/F}(x) = −∂_∞(y) for any y with ∂_π(y) = x and ∂_p(y) = 0 for p ≠ π. In degree zero it is multiplication by [E : F]. The projection formula and the degree formula N_{a/F} ∘ res = [E : F] are T.4/milnor-projection-formula and T.4/restriction-transfer-degree. Between the roadmap's normalisation of the residues and Theorem III.7.3's, every residue on K^M_{n+1}F(t) changes by the same sign (−1)^n, so N_{a/F} is the same in both. Independence of the generator a is Kato's theorem (T.4/milnor-transfer-transitivity), not part of this definition.

**Hypotheses.**

- E/F is a finite field extension generated by a; residues are normalised as in T.3/higher-milnor-residues.

**Proof outline.**

1. Existence and uniqueness of the N_p: −∂_∞ factors uniquely through the residue sum by exactness of T.4/bass-tate-sequence in degree n + 1 and the vanishing of ∂_∞ on K^M_{n+1}(F) (T.4/leading-coefficient-splitting).
2. Transport N_π to E along the pinned equivalence AdjoinRoot (minpoly F a) ≃ₐ[F] F⟮a⟯, the residue field of the place of π being F[t]/(π).
3. Computation formula: a y with ∂_π(y) = x and all other finite residues zero exists by surjectivity of the residue sum.
4. Degree zero: for x = 1 take y = π; then ∂_π(π) = 1, ∂_p(π) = 0 for p ≠ π and ∂_∞(π) = −deg π, so N_{a/F}(1) = [E : F].

**Acceptance.**

- In degree zero it is multiplication by [E : F].
- If a ∈ F it is the identity.
- In degree one it is the field norm (T.4/transfer-low-degrees).

**Prerequisites.**

- `K2SymbolsBrauer:T.4/bass-tate-sequence`
- `K2SymbolsBrauer:T.4/leading-coefficient-splitting`
- `K2SymbolsBrauer:T.3/higher-milnor-residues`
- `tauceti:TauCeti.Place.ratFuncEquiv`
- `mathlib:IntermediateField.adjoinRootEquivAdjoin`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `milnorTransferSimple` | constructor | For a integral over F: N_{a/F} : K^M_n(F⟮a⟯) →+ K^M_n(F), defined through the residue at infinity. |
| `milnorTransferSimple_eq_neg_residueInfty` | characterisation | If ∂_π(y) = x and ∂_p(y) = 0 for every monic irreducible p ≠ π, then N_{a/F}(x) = −∂_∞(y). |
| `residueInfty_eq_neg_sum_transfer` | relation | For y ∈ K^M_{n+1}F(t), −∂_∞(y) = Σ_p N_p(∂_p y), a finite sum (Weil's formula III.7.5.1). |
| `milnorTransferSimple_degree_zero` | simp | In degree zero N_{a/F}(m) = [F⟮a⟯ : F]·m. |
| `milnorTransferSimple_of_mem` | simp | If a ∈ F then N_{a/F} is the identity of K^M_n(F). |
| `milnorTransferSimple_mul_restrict` | relation | Projection formula: N_{a/F}(res(x)·y) = x·N_{a/F}(y) for x ∈ K^M_*(F) and y ∈ K^M_*(F⟮a⟯). (T.4/milnor-projection-formula) |
| `milnorTransferSimple_restrict` | relation | N_{a/F}(res x) = [F⟮a⟯ : F]·x for x ∈ K^M_n(F). (T.4/restriction-transfer-degree) |
| `milnorTransferSimple_one_eq_norm` | compatibility | In degree one N_{a/F} is Algebra.norm F on F⟮a⟯ˣ (proved in T.4/transfer-low-degrees). |
| `milnorTransferSimple_kbook` | compatibility | N_{a/F} is the same whether the residues are normalised as in the roadmap or as in Theorem III.7.3. |

**Consumers.**

- T.4/milnor-transfer-transitivity — the transfer of any finite extension is the composite of these along a chain of generators, and Kato's theorem makes it independent of the chain
- T.4/milnor-projection-formula and T.4/restriction-transfer-degree — the projection formula and the degree formula are proved for N_{a/F}
- T.4/projective-line-reciprocity — the defining identity −∂_∞ = Σ N_p ∂_p is Weil's formula for the projective line
- T.3/transfer-and-norm-residue — the norm-residue, projection and degree formulas for the general transfer start from the simple case
- HigherLocalFieldsAndHigherClassFieldTheory HL.1 — Milnor norms of extensions of higher local fields are these transfers
- MotivicEtaleKTheory M.4 — the norms N_{k(x)/F} in the inverse of the diagonal cycle map CH^n(F, n) → K^M_n(F) are Kato's norms built from these transfers

**Unit tests.**

- `milnorTransferSimple_degree_zero_eq` (computation) — For [F⟮a⟯ : F] = d, N_{a/F}(1) = d in K^M_0(F) = ℤ, from y = π: ∂_π(π) = 1, the other finite residues vanish, and ∂_∞(π) = −d.
- `milnorTransferSimple_of_mem_eq_id` (degenerate) — If a ∈ F (π = t − a) then N_{a/F} = id: for x ∈ K^M_n(F), y = {x, t − a} has ∂_{t−a}(y) = x, no other finite residue, and ∂_∞(y) = −x.
- `milnorTransferSimple_one_eq_algebraNorm` (compatibility) — In degree one N_{a/F} = Algebra.norm F on F⟮a⟯ˣ; for ℚ(i)/ℚ, N(1 + i) = 2.
- `milnorTransferSimple_sign` (non-example) — The sign is forced: the maps defined by +∂_∞ = Σ N_p ∂_p would give N_{a/F}(1) = −[F⟮a⟯ : F] in degree zero.
- `milnorTransferSimple_projection_linear` (characterisation) — For c ∈ F^× and d ∈ F, N_{a/F}{c, a − d} = {c, N(a − d)}, from the projection formula and the degree-one case (the formula of Corollary III.6.1.5 for a quadratic extension).

**Sources.**

- `Kbook.2013`: III.7.5, paragraph before Definition 7.5 (PDF p. 256; book p. 248). The unique N_p through −∂∞ = Σ Np∂p.
- `Kbook.2013`: III.7.5, Definition 7.5 (PDF p. 256; book p. 248). The definition.
- `Kbook.2013`: III.7.5, after Definition 7.5 (PDF p. 256; book p. 248). The computation formula and the degree-zero case.
- `Kbook.2013`: III.7.5.2, Projection Formula 7.5.2 (PDF p. 256; book p. 248). The projection formula for N_{a/F}.
- `Kbook.2013`: III.7.5.3, Corollary 7.5.3 (PDF p. 256; book p. 248). Restriction followed by transfer.

### The simple transfer in degree one is the field norm (Exercise III.7.5)

`K2SymbolsBrauer:T.4/transfer-low-degrees` · lemma · parent `K2SymbolsBrauer:T.4` · implementation unchecked

For a finite extension E = F(a), the transfer N_{a/F} : K^M_1(E) = E^× → K^M_1(F) = F^× of T.4/simple-transfer is the field norm Algebra.norm F. (The degree-zero case, multiplication by [E : F], is part of T.4/simple-transfer.)

**Hypotheses.**

- E = F(a) is a finite extension; π is the minimal polynomial of a, of degree d.

**Proof outline.**

1. Induction on d; for d = 1 both sides are the identity.
2. For b ∈ E^× choose g ∈ F[t] of degree e < d with g(a) = b and apply the defining identity to y = {π, g} ∈ K^M_2 F(t): ∂_π(y) = b, ∂_q(y) = (π mod q)^{−ord_q g} at the monic irreducible factors q of g, and ∂_∞(y) = (−1)^{de}·lead(g)^{−d} (K-book normalisation; π is monic).
3. Hence N_{a/F}(b) = (−1)^{de}·lead(g)^{d}·∏_q N_q(π mod q)^{ord_q g}, and by induction (deg q < d) each N_q is the field norm of F[t]/(q).
4. Compare with the field norm: Algebra.norm F (g(a)) is the product of g over the roots of π (pinned norm_eq_prod_roots), that is the resultant of π and g, which equals (−1)^{de}·lead(g)^{d}·∏_{g(β)=0} π(β) (pinned resultant_eq_prod_eval); grouping the roots β by the factors q gives the same product.

**Acceptance.**

- For ℚ(i)/ℚ, N(1 + i) = 2.
- For ℚ(∛2)/ℚ and b = ∛2 (g = t, d = 3, e = 1), the factor at q = t is π(0) = −2 and the sign (−1)^{de} = −1 gives the norm 2; without the sign the answer would be wrong.
- For a constant c ∈ F^×, N_{a/F}(c) = c^{[E:F]}, which is also the projection formula applied to c and 1.

**Prerequisites.**

- `K2SymbolsBrauer:T.4/simple-transfer`
- `K2SymbolsBrauer:T.3/higher-milnor-residues`
- `mathlib:Algebra.norm`
- `mathlib:Algebra.norm_eq_prod_roots`
- `mathlib:Polynomial.resultant_eq_prod_eval`

**Sources.**

- `Kbook.2013`: III, Exercise 7.5 (PDF p. 265; book p. 257). The exercise; the source leaves the proof to the reader, and the node's steps supply it.
- `Kbook.2013`: III.7.5, after Definition 7.5 (PDF p. 256; book p. 248). The degree-zero case, stated after Definition 7.5.

### Weil reciprocity on the projective line (III.7.5.1 and III.6.5.3)

`K2SymbolsBrauer:T.4/projective-line-reciprocity` · theorem · parent `K2SymbolsBrauer:T.4` · implementation unchecked

For a field F and x ∈ K^M_{n+1}F(t): Σ_v N_v ∂_v(x) = 0 in K^M_n(F), the sum over all places v of F(t) trivial on F, where N_π = N_{t̄/F} is the simple transfer of F[t]/(π) = F(t̄) and N_∞ is the identity; only finitely many terms are nonzero. In degree two, for f, g ∈ F(t)^× and the roadmap's tame symbol, ∏_v N_{k(v)/F}(∂_v{f, g}) = 1 in F^× with N the field norm.

**Hypotheses.**

- F is a field; residues are normalised as in T.3/higher-milnor-residues. In degree two either normalisation may be used, since inverting every factor does not change a product equal to 1.

**Proof outline.**

1. The identity is the defining relation −∂_∞ = Σ_π N_π ∂_π of T.4/simple-transfer; the generator t̄ of F[t]/(π) is fixed, so no independence of generators is used.
2. Finiteness: a symbol has nonzero residue only at the places dividing a numerator or denominator of an entry, and at ∞.
3. Degree two: N_π is the field norm (T.4/transfer-low-degrees) and the degree-two residue equals the roadmap's tame symbol; the product form follows.
4. Record the source's independent check in degree two: extend scalars to an algebraic closure, where K_2 F̄(t) is generated modulo K_2(F̄) by the symbols {a, t − b}, with (a, t − b)_∞ = a and ∂_{t−b}(a, t − b) = a^{−1}.

**Acceptance.**

- For {a, t − b} the factor at ∞ is a and the factor at t − b is a^{−1} (K-book normalisation); all other factors are 1.
- The place at infinity is needed: over ℚ, {2, t} has factor 1/2 at the place t and 2 at ∞ (K-book normalisation), so the finite places alone do not give 1.
- In degree one (n = 0) it says that a principal divisor on the projective line has degree zero, Σ_v deg(v)·ord_v(f) = 0.
- Roadmap convention check at 5 over ℚ: both the degree-two higher residue and tameSymbol send {2,5} to 2 in F_5^×; its inverse is 3. Only the separately named K-book residue is inverse.

**Prerequisites.**

- `K2SymbolsBrauer:T.4/simple-transfer`
- `K2SymbolsBrauer:T.4/transfer-low-degrees`
- `K2SymbolsBrauer:T.4/bass-tate-sequence`
- `K2SymbolsBrauer:T.3/finite-support`
- `K2SymbolsBrauer:T.3/higher-milnor-residues`
- `tauceti:TauCeti.Place.ratFuncEquiv`
- `tauceti:TauCeti.Place.normResidue`

**Sources.**

- `Kbook.2013`: III.7.5.1, Weil Reciprocity Formula 7.5.1 (PDF p. 256; book p. 248). The statement in all degrees, as a consequence of Definition 7.5.
- `Kbook.2013`: III.6.5.3, Weil Reciprocity Formula 6.5.3 (PDF p. 244; book p. 236). The degree-two form with field norms.
- `Kbook.2013`: III.6.5.3, proof of the Weil Reciprocity Formula (PDF p. 244; book p. 236). The source's proof of the degree-two form.

### Weil reciprocity for the tame symbol on a proper regular curve

`K2SymbolsBrauer:T.4/weil-reciprocity-symbol-form` · theorem · parent `K2SymbolsBrauer:T.4` · implementation unchecked

Let X be a proper regular integral curve over F with function field K, and f, g ∈ K^×. Then ∂_x{f, g} = 1 for all but finitely many closed points x, and ∏_{x ∈ X^{(1)}} N_{k(x)/F}(∂_x{f, g}) = 1 in F^×, where ∂_x is the roadmap's tame symbol (T.3/tame-symbol) at the discrete valuation of the local ring at x and N is the field norm. Equivalently, over the places P of K/F: ∏_P N_{k(P)/F}(∂_P{f, g}) = 1. The disjoint-support case f(div g) = g(div f), and its agreement with EllipticCurves Layer 2's milestone, is T.4/disjoint-support-reciprocity.

**Hypotheses.**

- X is integral, proper and regular of dimension one over F; f and g are nonzero rational functions.

**Proof outline.**

1. Transport the product over X^{(1)} to the product over the places of K/F, with equal tame symbols, residue fields and norms (T.4/valuation-comparison).
2. Take n = 1 in T.4/weil-reciprocity: K^M_2(K) = K_2(K) by Matsumoto, and the degree-two residue is exactly the roadmap's tame symbol (uniformiser last), so the additive residue sum is this multiplicative product.
3. Identify N_{k(P)/F} in degree one with the field norm: along a chain of simple extensions each step is Algebra.norm (T.4/transfer-low-degrees) and the composite is Algebra.norm by the pinned transitivity; with the pinned normResidue each factor is the norm of a residue.

**Acceptance.**

- For X = ℙ¹ it is Weil's formula (f, g)_∞ · ∏_p N_p(f, g)_p = 1 of III.6.5.3.
- The sign (−1)^{v(f)v(g)} matters: on ℙ¹ over ℚ with f = t and g = t − 1 the factors are −1 at 0, 1 at 1 and −1 at ∞, with product 1; dropping the sign changes the factor at ∞, where v(f)v(g) = 1, and gives −1.
- Only finitely many factors differ from 1.
- Convention test over ℚ at 5: ∂{2,5} = 2 in 𝔽₅ˣ. Its inverse 3 is the K-book convention, not this node’s residue.

**Prerequisites.**

- `K2SymbolsBrauer:T.4/weil-reciprocity`
- `K2SymbolsBrauer:T.4/valuation-comparison`
- `K2SymbolsBrauer:T.4/transfer-low-degrees`
- `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`
- `K2SymbolsBrauer:T.3/tame-symbol`
- `K2SymbolsBrauer:T.3/higher-milnor-residues`
- `mathlib:Algebra.norm_norm`
- `tauceti:TauCeti.Place.normResidue`

**Sources.**

- `Kbook.2013`: V.6.12, the paragraph before 6.12.1 (PDF p. 424; book p. 416). The source states the curve formula as the generalisation of III.6.5.3 for symbols {f, g} ∈ K_2(F): n = 1 in V.6.12.1.
- `Kbook.2013`: III.6.5.3, Weil Reciprocity Formula 6.5.3 (PDF p. 244; book p. 236). The projective-line case with field norms.

### Disjoint supports: f(div g) = g(div f), and EllipticCurves Layer 2's Weil reciprocity

`K2SymbolsBrauer:T.4/disjoint-support-reciprocity` · theorem · parent `K2SymbolsBrauer:T.4` · implementation unchecked

Let K be a function field of one variable over F and f, g ∈ K^× whose principal divisors (Tau Ceti's Divisor.principal) have disjoint supports. At a place P in the support of div g one has ord_P f = 0 and the roadmap's tame symbol is ∂_P{f, g} = f(P)^{ord_P g}; at a place P in the support of div f it is ∂_P{f, g} = g(P)^{−ord_P f}; elsewhere it is 1 (T.3/tame-symbol; the sign (−1)^{ord_P f · ord_P g} is 1 on both supports). Applying the residue-field norms N_{k(P)/F} and taking the product, T.4/weil-reciprocity-symbol-form becomes f(div g)·g(div f)^{−1} = 1, that is f(div g) = g(div f) for Tau Ceti's evaluation Divisor.eval, whose local factors are the norms N_{k(P)/F}(f(P)). In particular, for an elliptic curve — a Weierstrass curve W over F with W.IsElliptic, K = W.FunctionField, a function field of one variable by WeierstrassCurve.Affine.isFunctionField — this is the milestone 'Weil reciprocity f(div g) = g(div f)' of EllipticCurves Layer 2, a prerequisite of its divisor construction of the Weil pairing: that milestone is the disjoint-support, degree-two special case of T.4's theorem, stated with the same evaluation and the same principal divisors, and the two must be stated compatibly. The general theorem, in every degree and for every function field of one variable, stays T.4's (T.4/weil-reciprocity); the elliptic statement is a special case, not a proof of reciprocity for other curves. In the K-book's normalisation every local factor is inverted (∂^{Wb}_P{f, g} = f(P)^{−ord_P g} on the support of div g) and the identity is unchanged.

**Hypotheses.**

- K/F is a function field of one variable and f, g ∈ K^× have principal divisors with disjoint supports.
- For the elliptic instance, W is a Weierstrass curve over F with W.IsElliptic and K = W.FunctionField; its places and divisors are those of Tau Ceti's function-field library, on which EllipticCurves Layer 0 builds.

**Proof outline.**

1. Disjoint supports are admissibility: f is a unit at every place of div g and g at every place of div f (pinned TauCeti.Divisor.isUnitAtSupport_iff_disjoint).
2. Local factors: where ord_P f = 0 and ord_P g = m, ∂_P{f, g} = (−1)^0·(f^m/g^0)‾ = f(P)^m; where ord_P g = 0 and ord_P f = m′, it is (g^{−m′})‾ = g(P)^{−m′}; where both orders vanish it is 1 (T.3/tame-symbol).
3. Norms: N_{k(P)/F}(f(P)) is Tau Ceti's normResidue, and on an admissible divisor Divisor.eval is the product of these local norms raised to the coefficients (pinned TauCeti.Divisor.eval_eq_prod_normResidue); hence ∏_P N_{k(P)/F}(∂_P{f, g}) = Divisor.eval (div g) f · (Divisor.eval (div f) g)^{−1}.
4. Apply T.4/weil-reciprocity-symbol-form over the places of K/F.
5. Elliptic instance: WeierstrassCurve.Affine.isFunctionField makes W.FunctionField a function field of one variable over F, so the previous steps apply; EllipticCurves Layer 2's milestone is this statement for K = W.FunctionField, its points being the degree-one places (EllipticCurves Layer 0), while places of higher degree contribute through their residue-field norms.

**Acceptance.**

- On ℙ¹ over ℚ with f = t and g = (t − 1)/(t − 2): f(div g) = f(1)/f(2) = 1/2 and g(div f) = g(0)/g(∞) = (1/2)/1 = 1/2.
- On the elliptic curve y² = x³ − x over ℚ, f = x/(x − 2) and g = (x − 3)/(x − 5) have div f = 2(0, 0) − P₂ and div g = P₃ − P₅, where P_c is the inert place x = c of degree two (residue fields ℚ(√6), ℚ(√6), ℚ(√30) for c = 2, 3, 5). Then f(div g) = N(3)·N(5/3)^{−1} = 9·(9/25) = 81/25 and g(div f) = (3/5)²·N(1/3)^{−1} = (9/25)·9 = 81/25; without the residue-field norms the two sides would be 9/5 and 27/25.
- In the K-book's normalisation each local factor is inverted and the identity still holds.
- A special case, not the theorem: T.4/weil-reciprocity is the statement in every degree for every function field of one variable, and this node does not replace it.

**Prerequisites.**

- `K2SymbolsBrauer:T.4/weil-reciprocity-symbol-form`
- `K2SymbolsBrauer:T.3/tame-symbol`
- `tauceti:TauCeti.Divisor.eval`
- `tauceti:TauCeti.Divisor.eval_eq_prod_normResidue`
- `tauceti:TauCeti.Divisor.isUnitAtSupport_iff_disjoint`
- `tauceti:TauCeti.Divisor.principal`
- `tauceti:TauCeti.Place.normResidue`
- `tauceti:WeierstrassCurve.Affine.isFunctionField`

**Sources.**

- `Kbook.2013`: III.6.5.3, Weil Reciprocity Formula 6.5.3 (PDF p. 244; book p. 236). The degree-two reciprocity with residue-field norms, of which this node is the disjoint-support case; EllipticCurves Layer 2's milestone is read in the atlas's stage text, not in this source.

### Passing to a prime-to-p closure (Kato's key trick)

`K2SymbolsBrauer:T.4/prime-to-p-closure` · lemma · parent `K2SymbolsBrauer:T.4` · implementation unchecked

For a field F and a prime p there is an algebraic extension F′/F that is the union of its finite subextensions of degree prime to p and such that every finite extension of F′ has p-power degree. For such F′ and every n, every element of the kernel of K^M_n(F) → K^M_n(F′) is killed by an integer prime to p; in particular the kernel has no p-torsion.

**Hypotheses.**

- F is a field and p a prime.

**Proof outline.**

1. Existence: by Zorn's lemma choose, inside an algebraic closure, a maximal subfield F′ that is a directed union of finite extensions of F of degree prime to p.
2. Every finite extension L/F′ has p-power degree: for L separable, the fixed field of a Sylow p-subgroup of the Galois group of its Galois closure has degree prime to p over F′ and is generated over F′ by an element whose minimal polynomial is defined over a finite prime-to-p subextension of F, so maximality makes it F′; for L purely inseparable its degree is a power of the characteristic, which maximality forces to be p.
3. Kernel: an element dying in K^M_n(F′) dies in K^M_n(F″) for a finite F ⊂ F″ ⊂ F′ (Milnor K-theory commutes with directed unions of fields, from its presentation), and along a chain of simple extensions from F to F″ restriction followed by the composite of the simple transfers is multiplication by [F″ : F] (T.4/restriction-transfer-degree), which is prime to p.

**Acceptance.**

- If F is algebraically closed, F′ = F.
- For F = 𝔽_q, F′ is the union of the 𝔽_{q^m} with m prime to p.
- The kernel need not vanish: for p odd the prime-to-p closure of ℝ is ℂ, and {−1, −1} ∈ K^M_2(ℝ) dies in K^M_2(ℂ); it is killed by 2, which is prime to p.

**Prerequisites.**

- `K2SymbolsBrauer:T.4/simple-transfer`
- `K2SymbolsBrauer:T.2/milnor-k-theory`
- `mathlib:Sylow`
- `K2SymbolsBrauer:T.4/restriction-transfer-degree`

**Sources.**

- `Kbook.2013`: III.7.6.1, the paragraph after Theorem 7.6.1 (PDF p. 257; book p. 249). The trick, as the source states it.

### Base change of the simple transfer (Exercise III.7.7)

`K2SymbolsBrauer:T.4/transfer-base-change` · lemma · parent `K2SymbolsBrauer:T.4` · implementation unchecked

Let E = F(a) be finite with minimal polynomial π, F′/F any field extension, π = ∏_i π_i^{e_i} in F′[t] with distinct monic irreducible π_i, and E_i = F′(a_i) with a_i a root of π_i. Then res_{F′/F} ∘ N_{a/F} = Σ_i e_i · N_{a_i/F′} ∘ res_i on K^M_n(E), where res_i is induced by the F-embedding E → E_i sending a to a_i.

**Hypotheses.**

- F′/F is an arbitrary field extension (finite in the source); the multiplicities e_i are those of the factorisation of π over F′.

**Proof outline.**

1. Choose y ∈ K^M_{n+1}F(t) with ∂_π(y) = x and no other finite residue (T.4/bass-tate-sequence).
2. Along the constant-extension embedding F(t) → F′(t), a finite place w with nontrivial restriction to F(t) lies over a finite π′ with positive index e_w; by the embedding-general higher ramification formula (T.3/higher-ramification-formula), its residue is e_w times the image of ∂_{π′}(y). Hence at each factor π_i of π it is e_i·res_i(x), and at other such finite places it is zero. A finite place w restricting trivially to F(t) makes every imported nonzero entry a unit, so ∂_w(y′) = 0 by milnorResidue_symbol_units and generation; no e = 0 residue-field map is used. Infinity has index 1 with residue embedding F → F′, so ∂_∞(y′) = res ∂_∞(y). This includes transcendental constant extensions and completions.
3. Apply the computation formula of T.4/simple-transfer over F′ to y′.

**Acceptance.**

- In degree zero it is deg π = Σ_i e_i·deg π_i.
- If π stays irreducible over F′, it says res ∘ N_{a/F} = N_{a/F′} ∘ res.
- For F′ = E and E/F normal it expresses res_{E/F} ∘ N_{a/F} as a sum over the conjugates of a, which is what Lemma III.7.6.2 uses.
- For F′ = F(u) transcendental and π = t²−2 over F = ℚ, π remains irreducible and the residue/transfer comparison is available without finite-dimensionality of F′(t)/F(t). The extra place t−u has trivial restriction and zero residue on imported classes.
- For F′ = F̂_v, use the e = 1 residue comparison for completion; F̂_v/F need not be finite. This preserves the completion input required by Exercise III.7.9 and sourceIssue E10.

**Prerequisites.**

- `K2SymbolsBrauer:T.4/simple-transfer`
- `K2SymbolsBrauer:T.4/bass-tate-sequence`
- `K2SymbolsBrauer:T.3/higher-ramification-formula`
- `K2SymbolsBrauer:T.3/higher-milnor-residues`

**Sources.**

- `Kbook.2013`: III, Exercise 7.7 (PDF p. 265; book p. 257). The exercise, for finite F′; the argument uses only the naturality of Theorem III.7.4 and the ramification formula, so the node states it for any F′, which Exercise III.7.9 needs for completions.

### Generation by symbols with one entry outside the base (Exercise III.7.6)

`K2SymbolsBrauer:T.4/p-closed-generation` · lemma · parent `K2SymbolsBrauer:T.4` · implementation unchecked

If every finite extension of F has p-power degree and E/F has degree p, then for n ≥ 1 the group K^M_n(E) is generated by the symbols {y, x_2, …, x_n} with y ∈ E^× and x_2, …, x_n ∈ F^×.

**Hypotheses.**

- Every finite extension of F has p-power degree; [E : F] = p; n ≥ 1.

**Proof outline.**

1. E = F(u) since the degree is prime, and every element of E is a polynomial in u of degree < p, which splits into linear factors over F because F has no extension of degree between 2 and p − 1.
2. By Lemma III.6.1.4 (the case d = 1 of T.4/degree-reduction (i), correct as printed), a symbol of two linear polynomials in u is a product of symbols {c, d} and {c, u − d} with c, d ∈ F.
3. Apply this to adjacent pairs of entries, using the alternating property, until at most one entry lies outside F^×.

**Acceptance.**

- For F = ℝ and E = ℂ (p = 2), K^M_2(ℂ) is generated by the {r, z} with r ∈ ℝ^× and z ∈ ℂ^×, as in Example III.6.1.6.
- In degree one the statement is trivial.
- The hypothesis on F is used in the first step: over ℚ, with E = ℚ(∛2), the element 1 + ∛2 + ∛4 is a quadratic polynomial in ∛2 that does not split over ℚ, so the argument does not apply.

**Prerequisites.**

- `K2SymbolsBrauer:T.4/degree-reduction`
- `K2SymbolsBrauer:T.2/milnor-alternating`

**Sources.**

- `Kbook.2013`: III, Exercise 7.6 (PDF p. 265; book p. 257). The exercise; it cites Exercise 6.2, whose correct case d = 1 (Lemma III.6.1.4) is what is used.
- `Kbook.2013`: III.6.1.4, Lemma 6.1.4 and its proof (PDF p. 240; book p. 232). The linear case.

### Independence of the generator for a normal extension of prime degree (Lemma III.7.6.2)

`K2SymbolsBrauer:T.4/kato-prime-degree` · lemma · parent `K2SymbolsBrauer:T.4` · implementation unchecked

If E/F is normal of prime degree p and E = F(a) = F(b), then N_{a/F} = N_{b/F} : K^M_*(E) → K^M_*(F).

**Hypotheses.**

- E/F is normal (separable or purely inseparable) of prime degree p.

**Proof outline.**

1. δ = N_{a/F} − N_{b/F} is annihilated by p: by T.4/transfer-base-change with F′ = E, res_{E/F} ∘ N_{a/F} and res_{E/F} ∘ N_{b/F} are the same sum over the F-automorphisms (with the inseparable multiplicity), so res_{E/F}∘δ = 0, and N_{a/F} ∘ res_{E/F} is multiplication by p (T.4/restriction-transfer-degree).
2. If δ(x) ≠ 0 it stays nonzero in K^M_n(F′) for the prime-to-p closure F′ of F (T.4/prime-to-p-closure), and δ is compatible with the base change to F′ (T.4/transfer-base-change; EF′/F′ is again of degree p).
3. Over F′, K^M_n(EF′) is generated by symbols {y, x_2, …, x_n} with x_i ∈ F′^× (T.4/p-closed-generation), and the projection formula (T.4/milnor-projection-formula) gives N{y, x_2, …} = {N(y), x_2, …} with N(y) the field norm (T.4/transfer-low-degrees), which does not depend on the generator; so δ vanishes over F′, a contradiction.

**Acceptance.**

- In degree one it is the independence of the field norm from the generator.
- In degree zero both transfers are multiplication by p.
- It is the base case of Kato's induction over maximal towers.

**Prerequisites.**

- `K2SymbolsBrauer:T.4/simple-transfer`
- `K2SymbolsBrauer:T.4/transfer-low-degrees`
- `K2SymbolsBrauer:T.4/transfer-base-change`
- `K2SymbolsBrauer:T.4/prime-to-p-closure`
- `K2SymbolsBrauer:T.4/p-closed-generation`
- `K2SymbolsBrauer:T.4/milnor-projection-formula`
- `K2SymbolsBrauer:T.4/restriction-transfer-degree`

**Sources.**

- `Kbook.2013`: III.7.6.2, Lemma 7.6.2 (PDF p. 257; book p. 249). The statement.
- `Kbook.2013`: III.7.6.2, proof of Lemma 7.6.2 (PDF p. 257; book p. 249). The first step of the proof.

### Residues commute with the transfer over a complete field (Corollary III.7.6.3)

`K2SymbolsBrauer:T.4/kato-complete-residue` · lemma · parent `K2SymbolsBrauer:T.4` · implementation unchecked

Let F be complete for a discrete valuation v with residue field k_v, E/F normal of prime degree p, and w the unique extension of v to E, with residue field k_w. Then ∂_v ∘ N_{E/F} = N_{k_w/k_v} ∘ ∂_w on K^M_n(E), where N_{E/F} is well defined by T.4/kato-prime-degree and N_{k_w/k_v} is the identity if k_w = k_v and otherwise the transfer of the normal extension k_w/k_v of degree p.

**Hypotheses.**

- F complete for v; E/F normal of prime degree p; residues normalised as in T.3/higher-milnor-residues.

**Proof outline.**

1. The difference of the two sides is killed by a power of p: after restriction to E the transfer becomes the sum over the conjugates (T.4/transfer-base-change) and the residues scale by the ramification index (T.3/higher-ramification-formula). The source leaves this step implicit; it is what lets a prime-to-p base change detect the difference.
2. After a finite base change F′/F of degree prime to p (T.4/prime-to-p-closure; F′ is complete and w extends uniquely), the image of u ∈ K^M_n(E) is a sum of symbols {y, x_2, …, x_n} with y ∈ (EF′)^× and x_i ∈ F′^× (T.4/p-closed-generation); both sides are compatible with the base change.
3. For such a symbol the projection formula (T.4/milnor-projection-formula) gives N{y, x_2, …} = {N(y), x_2, …} with N(y) the field norm (T.4/transfer-low-degrees), and both residues are computed from Theorem III.7.3's formulas with the product formula (T.3/milnor-residue-product-formula), which reduces them to the degree-one facts ord_v(N y) = f·ord_w(y) and res(N u) = N(ū)^e (the source's 'easy computation'; gap: not pinned).
4. Replace the old “easy computation” by Gille–Szamuely7.3.10’s four cases for{y,x2,…,xn}, with the base xi units for i>2. With valuations of y and x2 equal to0/1: unit/unit gives0; uniformizer/unit gives f times the reduced base symbol; unit/uniformizer gives −e times the reduced symbol with residue norm, using complete-field-degree-one-norm.
5. For uniformizer/uniformizer, write π_F=u′π_E^e and Nπ_E=uπ_F^f. The equality to check is(−1)^(ef)N(ū′)=(−1)^f ū⁻¹. For an unramified normal prime extension take the same parameter; for totally ramified degreep take the constant coefficient of the Eisenstein polynomial, giving u=(−1)^p and ū′=−1. Transport the sign when moving the uniformizer from first (the source) to last (this packet).
6. The discrepancy δ is killed by an integer prime to p after descending a finite prime-to-p level where the generators have that form. Base change to E kills pδ or p²δ: the separable case splits into p factors; the inseparable tensor algebra has lengthp and a single residue field. Bézout then givesδ=0. These are separate multiplicity and sign checks, not an unqualified projection-formula assertion.

**Acceptance.**

- In degree one it is v(N_{E/F}(y)) = f·w(y), with f = [k_w : k_v].
- For E/F unramified and n = 2 it says that the tame symbol of a norm is the norm of the tame symbol.
- Completeness is used: for a field that is not complete there may be several places above v, and the formula becomes the sum of T.4/constant-extension-residue or of T.3/transfer-and-norm-residue.

**Prerequisites.**

- `K2SymbolsBrauer:T.4/kato-prime-degree`
- `K2SymbolsBrauer:T.4/p-closed-generation`
- `K2SymbolsBrauer:T.4/prime-to-p-closure`
- `K2SymbolsBrauer:T.4/transfer-base-change`
- `K2SymbolsBrauer:T.4/transfer-low-degrees`
- `K2SymbolsBrauer:T.3/higher-ramification-formula`
- `K2SymbolsBrauer:T.3/higher-milnor-residues`
- `K2SymbolsBrauer:T.4/milnor-projection-formula`
- `K2SymbolsBrauer:T.3/milnor-residue-product-formula`
- `K2SymbolsBrauer:T.3/complete-field-degree-one-norm`

**Sources.**

- `Kbook.2013`: III.7.6.3, Corollary 7.6.3 (PDF p. 257; book p. 249). The statement (the diagram ∂_v ∘ N = N ∘ ∂_w).
- `Kbook.2013`: III.7.6.3, proof of Corollary 7.6.3 (PDF p. 257; book p. 249). The reduction and the computation, as the source gives them.
- `GilleSzamuely.CSAGC.2006`: Proposition7.3.9,Lemma7.3.10 full proof,pp199–202. Full four-case and two-annihilator proof read. Source uses uniformizer-first; the packet transports by(−1)^(n−1).

### The norm-residue formula for a constant extension of prime degree (Exercise III.7.9)

`K2SymbolsBrauer:T.4/constant-extension-residue` · lemma · parent `K2SymbolsBrauer:T.4` · implementation unchecked

Let E/F be normal of prime degree p and v a place of F(t) trivial on F. Then ∂_v ∘ N_{E(t)/F(t)} = Σ_{w|v} N_{E(w)/F(v)} ∘ ∂_w on K^M_{n+1}E(t), the sum over the places w of E(t) above v; N_{E(t)/F(t)} and the residue-field transfers are well defined by T.4/kato-prime-degree, each extension involved being normal of degree 1 or p.

**Hypotheses.**

- E/F normal of prime degree p; v a place of F(t) trivial on F.

**Proof outline.**

1. ∂_v factors through the completion F(t)_v and each ∂_w through E(t)_w: residues are computed from unit parts and uniformisers, which the completion preserves.
2. Base change N_{a/F(t)} (E = F(a)) to F′ = F(t)_v by T.4/transfer-base-change: the minimal polynomial of a factors over F(t)_v as ∏ π_i^{e_i}, the factors corresponding to the places w above v with E(t)_w = F(t)_v(a_i).
3. Apply T.4/kato-complete-residue to each F(t)_v(a_i)/F(t)_v and sum.
4. The correspondence between the places above v and the irreducible factors of the minimal polynomial over the completion is the standard description of the extensions of a complete valuation; it is used here and is to be located in the pinned libraries or proved with this node.

**Acceptance.**

- In degree zero (n + 1 = 1) it is v(N_{E(t)/F(t)}(y)) = Σ_{w|v} f(w|v)·w(y).
- If v is inert (a single w with [E(w) : F(v)] = p) it is the complete formula without completion.
- For v = ∞ it gives ∂_∞ ∘ N_{E(t)/F(t)} = N_{E/F} ∘ ∂_∞, the identity used in Proposition III.7.6.4.

**Prerequisites.**

- `K2SymbolsBrauer:T.4/transfer-base-change`
- `K2SymbolsBrauer:T.4/kato-complete-residue`
- `K2SymbolsBrauer:T.4/kato-prime-degree`
- `K2SymbolsBrauer:T.3/higher-milnor-residues`
- `tauceti:TauCeti.Place.restrict`
- `tauceti:TauCeti.Place.finite_setOf_restrict_eq`

**Sources.**

- `Kbook.2013`: III, Exercise 7.9 (PDF p. 266; book p. 258). The exercise and its hint, which the node follows.

### Kato's commuting square (Proposition III.7.6.4)

`K2SymbolsBrauer:T.4/kato-commuting-square` · lemma · parent `K2SymbolsBrauer:T.4` · implementation unchecked

Let E/F be normal of prime degree p, F′ = F(a) finite and E′ = E(a). Then N_{E/F} ∘ N_{a/E} = N_{a/F} ∘ N_{E′/F′} on K^M_*(E′), the norms N_{E/F} and N_{E′/F′} being well defined by T.4/kato-prime-degree.

**Hypotheses.**

- E/F normal of prime degree p; F′ = F(a) a finite simple extension.

**Proof outline.**

1. Let π′ ∈ E[t] be the minimal polynomial of a over E; for x ∈ K^M_n(E′) choose y ∈ K^M_{n+1}E(t) with ∂_{π′}(y) = x and no other finite residue, so that N_{a/E}(x) = −∂_∞(y).
2. By T.4/constant-extension-residue, ∂_v(N_{E(t)/F(t)} y) is N_{E′/F′}(x) at v = v_π, N_{E/F}(∂_∞ y) at v = ∞ and 0 elsewhere.
3. Two applications of the computation formula of T.4/simple-transfer give N_{a/F}(N_{E′/F′}x) = −∂_∞(N_{E(t)/F(t)}y) = −N_{E/F}(∂_∞ y) = N_{E/F}(N_{a/E}x); the source prints the last term as N_{E/F}(N_{a/F}x), which the author's errata list corrects.

**Acceptance.**

- In degree one both sides are the field norm N_{E′/F}.
- If a ∈ F both sides reduce to N_{E/F}.
- In degree zero both sides are multiplication by [E′ : F].

**Prerequisites.**

- `K2SymbolsBrauer:T.4/kato-prime-degree`
- `K2SymbolsBrauer:T.4/constant-extension-residue`
- `K2SymbolsBrauer:T.4/simple-transfer`

**Sources.**

- `Kbook.2013`: III.7.6.4, Proposition 7.6.4 (PDF p. 258; book p. 250). The statement.
- `Kbook.2013`: III.7.6.4, proof of Proposition 7.6.4 (PDF p. 258; book p. 250). The final computation, whose last term is corrected in the author's errata list (p. 272 of the published edition).

### The unramified subgroup of K_2 of a field

`K2SymbolsBrauer:T.5/unramified-subgroup` · definition · parent `K2SymbolsBrauer:T.5` · implementation unchecked

Let F be a field with a family (v_i)_{i∈I} of discrete valuations — in the arithmetic case R is a Dedekind domain with fraction field F, I = HeightOneSpectrum R and v_𝔭 is the 𝔭-adic valuation; for a number field R = O_F and I is the set of finite places. The unramified subgroup U_I(F) ⊂ K_2(F) is the intersection over i of the kernels of the tame symbols ∂_{v_i} : K_2(F) → k(v_i)^× of T.3; for S ⊂ I the subgroup unramified outside S is the intersection over i ∉ S. The definition uses no localisation theorem; for a number field its identification with K_2(O_F) is T.5/tame-kernel-sequence.

**Hypotheses.**

- Each v_i is a discrete valuation of F with residue field k(v_i).
- When every element of F^× has nonzero valuation at only finitely many v_i (a Dedekind domain, the places of a function field), U_I(F) is the kernel of the residue sum K_2(F) → ⊕_i k(v_i)^×.

**Proof outline.**

1. Define U_I(F) as the infimum over i of the kernels of the homomorphisms ∂_{v_i} (T.3/tame-symbol-steinberg).
2. Under finite support (T.3/finite-support) the residue sum is defined and its kernel is U_I(F).
3. Restriction along a finite extension whose family lies over the family of F maps U into U, by the ramification formula (T.3/ramification-formula); the transfer maps U back into U by the norm-residue formula (T.3/transfer-and-norm-residue).
4. For a Dedekind domain R the image of K_2(R) → K_2(F) lies in U: the map factors through K_2(R_𝔭), which is generated by Steinberg symbols of units (K2SymbolsBrauer:T.2/symbols-generate for the local ring R_𝔭), and the tame symbol of two units is trivial.

**Acceptance.**

- A class coming from K_2(O_F) is unramified, the easy inclusion of the localisation theorem.
- The symbol of two units of O_F is unramified everywhere.
- The definition does not presuppose the localisation theorem.

**Prerequisites.**

- `K2SymbolsBrauer:T.3/tame-symbol-steinberg`
- `K2SymbolsBrauer:T.3/finite-support`
- `K2SymbolsBrauer:T.3/ramification-formula`
- `K2SymbolsBrauer:T.3/transfer-and-norm-residue`
- `K2SymbolsBrauer:T.2/symbols-generate`
- `K2SymbolsBrauer:T.1/k2-definition`
- `mathlib:IsDedekindDomain.HeightOneSpectrum`
- `mathlib:IsDedekindDomain.HeightOneSpectrum.valuation`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `unramifiedSubgroup` | data | For a family v : I → discrete valuations of F, ⨅ i, ker(∂_{v i}) as a subgroup of K_2(F). |
| `mem_unramifiedSubgroup_iff` | characterisation | x ∈ U ↔ ∀ i, ∂_{v i} x = 1. |
| `unramifiedOutside` | data | For S ⊆ I, ⨅ i ∉ S, ker(∂_{v i}); unramifiedOutside ∅ = unramifiedSubgroup, and it is monotone in S. |
| `unramifiedSubgroup_eq_ker_residueSum` | characterisation | Under finite support, U = ker(K_2(F) → ⨁ i, k(v i)ˣ). |
| `symbol_mem_unramifiedSubgroup` | simp | If u and w are units at every v_i then {u, w} ∈ U. |
| `range_K2_le_unramifiedSubgroup` | compatibility | For a Dedekind domain R with fraction field F and I = HeightOneSpectrum R, the image of K_2(R) → K_2(F) lies in U. |
| `unramifiedSubgroup_map_le` | functoriality | Restriction along a finite extension carrying the family into the family maps U into U. |
| `transfer_mem_unramifiedSubgroup` | relation | The transfer of a finite extension of number fields maps the unramified subgroup of the larger field into that of the smaller. |
| `unramifiedSubgroup_heightOneSpectrum` | compatibility | For I = HeightOneSpectrum R, v_𝔭 is Mathlib's HeightOneSpectrum.valuation F and k(v_𝔭) is identified with R ⧸ 𝔭. |

**Consumers.**

- T.5/s-integer-tame-kernel-sequence and T.5/tame-kernel-sequence — the image of K_2(O_{F,S}) in K_2(F) is the subgroup unramified outside S, and that of K_2(O_F) is this subgroup
- ArithmeticKTheory N.2 — N.2 specialises its all-degree localisation sequence to T.5's degree-two rows, which identify this subgroup with K_2(O_F)
- SpecialValuesBirchTate B.1 and B.7 — the orders #K_2(O_F) and #K_2(O_{F,S}) are those of this subgroup and of its outside-S variant, through T.5/tame-kernel-sequence and T.5/relative-s-integer-sequence
- ArithmeticKTheory N.6 — N.6's certificate engine presents the tame kernel, which is this subgroup; the certificate format is N.6's
- T.7's Hilbert-symbol comparison — the local symbols are evaluated on classes whose ramification is controlled

**Unit tests.**

- `neg_one_neg_one_mem` (computation) — For F = ℚ with the family of all primes, {−1, −1} ∈ U, since −1 is a unit at every prime.
- `neg_one_p_not_mem` (non-example) — For an odd prime p, {−1, p} ∉ U over ℚ: its tame symbol at p is −1 ≠ 1 in 𝔽_p^×; a definition testing only symbols of units, or only one place, misses this.
- `three_three_not_mem` (non-example) — {3, 3} ∉ U over ℚ: the sign (−1)^{v(f)v(g)} makes its tame symbol at 3 equal to −1; a symbol without the sign would wrongly put {3, 3} in U.
- `two_neg_one_mem` (degenerate) — {2, −1} = 1 by the Steinberg relation (2 + (−1) = 1); correspondingly its tame symbol at 2 is −1 = 1 in 𝔽_2^× and all others are 1.
- `empty_family` (degenerate) — For the empty family U = K_2(F), and unramifiedOutside I = K_2(F).
- `mem_iff_residueSum_rat` (characterisation) — For ℚ and the primes, x ∈ U exactly when the residue sum of x in ⨁_p 𝔽_p^× vanishes.
- `heightOneSpectrum_int` (compatibility) — For R = ℤ the valuation Mathlib attaches to (p) ∈ HeightOneSpectrum ℤ is the p-adic valuation and ℤ ⧸ (p) ≅ ZMod p, so the tame symbol at (p) lands in (ZMod p)ˣ.

**Sources.**

- `Kbook.2013`: III.6.3, Lemma 6.3 (PDF p. 242; book p. 234). The symbols whose simultaneous vanishing defines the subgroup.
- `Kbook.2013`: III.6.5, Localization Theorem 6.5 (PDF p. 244; book p. 236). The kernel of the residue sum, which the localisation theorem identifies with the image of K_2(R) modulo the image of ∐ K_2(R/p).

### The tame-kernel sequence of the S-integers: residues at the primes outside S

`K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence` · theorem · parent `K2SymbolsBrauer:T.5` · implementation unchecked

Let F be a number field, S a finite set of nonzero primes of O_F (S = ∅ allowed) and O_{F,S} = Set.integer S F. The nonzero primes of O_{F,S} are the 𝔭O_{F,S} with 𝔭 ∉ S, with residue fields k(𝔭) = O_F/𝔭 (Tau Ceti's IsDedekindDomain.integerHeightOneSpectrumEquiv). Then 0 → K_2(O_{F,S}) → K_2(F) −(∂_𝔭)_{𝔭∉S}→ ⊕_{𝔭∉S} k(𝔭)^× → 0 is exact: the sum is over the finite primes OUTSIDE S. Equivalently K_2(O_{F,S}) → K_2(F) is injective with image the subgroup unramified outside S (T.5/unramified-subgroup), and the residue sum over the primes outside S is onto. The sequence is derived through the actual maps of the Dedekind localisation sequence, whose boundary is the tame symbol at each prime (T.3/dedekind-localization-boundary, from T.3:localization-comparison): injectivity because K_2 of each finite residue field vanishes, surjectivity because the cokernel of the residue sum is ker(K_1(O_{F,S}) → K_1(F)), which is zero by the Bass–Milnor–Serre theorem SK_1(O_{F,S}) = 0 (KTheoryLowDegrees U.4). The relative sequence comparing O_F with O_{F,S}, whose residues are at the primes IN S, is T.5/relative-s-integer-sequence.

**Hypotheses.**

- F is a number field and S a finite set of nonzero primes of O_F.
- K_2 is the classical group of T.1, identified with Quillen's K_2 by T.1/k2-pi2; the sign of the boundary is fixed in T.3/localization-boundary and does not affect kernels or images.

**Proof outline.**

1. O_{F,S} is a Dedekind domain with fraction field F, a localisation of O_F; its height-one primes are the 𝔭O_{F,S} with 𝔭 ∉ S (IsDedekindDomain.integerHeightOneSpectrumEquiv), and O_{F,S}/𝔭O_{F,S} = O_F/𝔭.
2. Apply T.3/dedekind-localization-boundary to R = O_{F,S}: ⊕_{𝔭∉S} K_2(k(𝔭)) → K_2(O_{F,S}) → K_2(F) −∂→ ⊕_{𝔭∉S} k(𝔭)^× → K_1(O_{F,S}) → K_1(F) is exact, the 𝔭-component of ∂ being the inverse of the tame symbol at 𝔭.
3. Injectivity: K_2(k(𝔭)) = 0 for the finite fields k(𝔭) (K2SymbolsBrauer:T.2/k2-finite-field).
4. Image: ker ∂ is the subgroup unramified outside S, a tame symbol and its inverse having the same kernel (T.5/unramified-subgroup, unramifiedOutside S).
5. Surjectivity: coker ∂ ≅ ker(K_1(O_{F,S}) → K_1(F)), and this map is injective because SK_1(O_{F,S}) = 0 and O_{F,S}^× ⊆ F^× (KTheoryLowDegrees U.4). The surjectivity of each tame symbol and finite support do not suffice (Example III.1.5.4).

**Acceptance.**

- For F = ℚ and S = {p}: 0 → K_2(ℤ[1/p]) → K_2(ℚ) → ⊕_{ℓ≠p} 𝔽_ℓ^× → 0; the residue at p is not in the sum.
- For S = ∅ it is T.5/tame-kernel-sequence.
- Indexing test: {5, 2} ∈ K_2(ℚ) has nonzero tame symbol only at 5 (value 3 with T.3's normalisation), so it lies in the image of K_2(ℤ[1/5]) and not in that of K_2(ℤ[1/2]).

**Prerequisites.**

- `K2SymbolsBrauer:T.3/dedekind-localization-boundary`
- `K2SymbolsBrauer:T.3/localization-boundary`
- `K2SymbolsBrauer:T.5/unramified-subgroup`
- `K2SymbolsBrauer:T.2/k2-finite-field`
- `K2SymbolsBrauer:T.1/k2-pi2`
- `KTheoryLowDegrees:U.4`
- `mathlib:Set.integer`
- `tauceti:IsDedekindDomain.integerHeightOneSpectrumEquiv`

**Sources.**

- `Weibel.KBook.III`: III.6.5, Localization Theorem 6.5 (p. 52). The localisation theorem for any Dedekind domain, applied to O_{F,S}, whose primes are those of O_F outside S.
- `Kbook.2013`: V.6.8, Theorem 6.8 (PDF p. 420; book p. 412). Soulé's theorem for n = 2 applies to every Dedekind domain with global fraction field, in particular to O_{F,S} as well as O_F.
- `Kbook.2013`: V.6.8, proof of Theorem 6.8 (PDF p. 420; book p. 412). Where Bass–Milnor–Serre enters.

### The tame-kernel exact sequence for the ring of integers

`K2SymbolsBrauer:T.5/tame-kernel-sequence` · theorem · parent `K2SymbolsBrauer:T.5` · implementation unchecked

For a number field F with ring of integers O_F the sequence 0 → K_2(O_F) → K_2(F) −⊕∂_𝔭→ ⊕_𝔭 k(𝔭)^× → 0 is exact, the sum over all nonzero primes of O_F and the third map the residue sum of the tame symbols (sign fixed in T.3/localization-boundary): K_2(O_F) → K_2(F) is injective with image the unramified subgroup of T.5/unramified-subgroup, and the residue sum is onto. It is the case S = ∅ of T.5/s-integer-tame-kernel-sequence: injectivity from K_2(k(𝔭)) = 0, surjectivity from SK_1(O_F) = 0 through the Dedekind localisation sequence (T.3/dedekind-localization-boundary and KTheoryLowDegrees U.4). ArithmeticKTheory N.2 imports this row and specialises its all-degree localisation sequence to it (RT-AREA-ktheory-1/9); T.5 does not import it from N.2. Surjectivity does not follow from the surjectivity of the individual tame symbols.

**Hypotheses.**

- F is a number field; 𝔭 runs over the nonzero primes of O_F and k(𝔭) = O_F/𝔭.
- K_2 is the classical group of T.1, identified with Quillen's K_2 by T.1/k2-pi2.

**Proof outline.**

1. Take S = ∅ in T.5/s-integer-tame-kernel-sequence: Set.integer ∅ F consists of the elements of F integral at every prime of O_F, which is O_F (mathlib:NumberField.RingOfIntegers).
2. State the sequence with the residue sum of T.5/unramified-subgroup as third map; exactness in the middle says that the image of K_2(O_F) is the unramified subgroup.
3. Record where each half comes from: injectivity from K_2(k(𝔭)) = 0 (K2SymbolsBrauer:T.2/k2-finite-field); surjectivity from SK_1(O_F) = 0 (KTheoryLowDegrees U.4) through the exact segment ⊕_𝔭 k(𝔭)^× → K_1(O_F) → K_1(F) of T.3/dedekind-localization-boundary. The surjectivity of each tame symbol does not suffice: for the Dedekind domain ℝ[x, y]/(x² + y² − 1) every tame symbol is onto, but the cokernel of the residue sum is its SK_1, which is nonzero (Example III.1.5.4).

**Acceptance.**

- For F = ℚ it is 1 → K_2(ℤ) → K_2(ℚ) → ⊕_p 𝔽_p^× → 1 (Application III.6.5.1).
- The third map is onto, but not because each tame symbol is: Example III.1.5.4 gives surjective tame symbols with a nonzero cokernel.
- The same sequence holds for every Dedekind domain whose fraction field is a global field (Soulé's Theorem V.6.8, n = 2).

**Prerequisites.**

- `K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence`
- `K2SymbolsBrauer:T.5/unramified-subgroup`
- `K2SymbolsBrauer:T.3/dedekind-localization-boundary`
- `K2SymbolsBrauer:T.2/k2-finite-field`
- `KTheoryLowDegrees:U.4`
- `mathlib:NumberField.RingOfIntegers`
- `mathlib:Set.integer`

**Sources.**

- `Kbook.2013`: III.6.5, Localization Theorem 6.5 (PDF p. 244; book p. 236). The localisation sequence for a Dedekind domain: the cokernel of the residue sum is SK_1(R).
- `Kbook.2013`: V.6.8, Theorem 6.8 (PDF p. 420; book p. 412). The case of a global field.
- `Kbook.2013`: V.6.8, proof of Theorem 6.8 (PDF p. 420; book p. 412). Where Bass–Milnor–Serre enters.
- `Kbook.2013`: III.1.5.4, Example 1.5.4 (PDF p. 193; book p. 185). A Dedekind domain with nonzero SK_1: per-prime surjectivity does not give surjectivity of the sum.

### The relative sequence comparing K₂(O_F) with K₂(O_{F,S}): residues at the primes in S

`K2SymbolsBrauer:T.5/relative-s-integer-sequence` · theorem · parent `K2SymbolsBrauer:T.5` · implementation unchecked

Let F be a number field and S a finite set of nonzero primes of O_F. Then 0 → K_2(O_F) → K_2(O_{F,S}) −(∂_𝔭)_{𝔭∈S}→ ⊕_{𝔭∈S} k(𝔭)^× → 0 is exact, the first map induced by O_F ⊆ O_{F,S} and the residues taken at the primes IN S (read on the image of K_2(O_{F,S}) in K_2(F)). The tame-kernel sequence of O_{F,S} itself, T.5/s-integer-tame-kernel-sequence, has its residues at the primes OUTSIDE S; the two are distinct statements. Consequently #K_2(O_{F,S}) = #K_2(O_F)·∏_{𝔭∈S}(N𝔭 − 1) whenever K_2(O_F) is finite. This is the stage text's 'exact sequence comparing their tame kernel with the integral one'.

**Hypotheses.**

- F is a number field and S a finite set of nonzero primes of O_F.

**Proof outline.**

1. By T.5/tame-kernel-sequence and T.5/s-integer-tame-kernel-sequence, K_2(O_F) and K_2(O_{F,S}) inject into K_2(F) with images the unramified subgroup U and the subgroup U_S unramified outside S (T.5/unramified-subgroup); K_2(O_F) → K_2(O_{F,S}) → K_2(F) is K_2(O_F) → K_2(F) by functoriality, so the first map is injective with image corresponding to U ⊆ U_S.
2. U is the kernel of the residues at S restricted to U_S, which is exactness in the middle.
3. Surjectivity: given (y_𝔭)_{𝔭∈S}, extend it by 1 at the primes outside S and lift it through the surjective residue sum of T.5/tame-kernel-sequence; the lift is unramified outside S, so it lies in U_S, the image of K_2(O_{F,S}).

**Acceptance.**

- For F = ℚ and S = {p}: 0 → K_2(ℤ) → K_2(ℤ[1/p]) → 𝔽_p^× → 0, so K_2(ℤ[1/p]) has order 2(p − 1); ArithmeticKTheory N.8 demonstrates this sequence and imports it.
- Indexing: the residues are at the primes in S; for S = ∅ the sequence is the identity of K_2(O_F).
- The order formula #K_2(O_{F,S}) = #K_2(O_F)·∏_{v∈S}(Nv − 1) that SpecialValuesBirchTate B.7 consumes follows because #k(𝔭)^× = N𝔭 − 1.

**Prerequisites.**

- `K2SymbolsBrauer:T.5/tame-kernel-sequence`
- `K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence`
- `K2SymbolsBrauer:T.5/unramified-subgroup`
- `mathlib:Set.integer`

**Sources.**

- `Kbook.2013`: V.6.8, Theorem 6.8 (PDF p. 420; book p. 412). The case of a global field.

### The real sign symbol (Example III.6.2.1)

`K2SymbolsBrauer:T.5/real-sign-symbol` · construction · parent `K2SymbolsBrauer:T.5` · implementation unchecked

For x, y ∈ ℝ^× put (x, y)_∞ = −1 if x < 0 and y < 0, and +1 otherwise. It is bilinear and (x, 1 − x)_∞ = 1 for x ≠ 0, 1, so by Matsumoto's theorem it defines a homomorphism K_2(ℝ) → {±1}, onto because (−1, −1)_∞ = −1. For a field F with an embedding σ : F → ℝ (a real place of a number field) the composite K_2(F) → K_2(ℝ) → {±1} is the sign symbol at σ.

**Hypotheses.**

- The target {±1} is ℤˣ; σ is a ring embedding into ℝ.

**Proof outline.**

1. (x, y)_∞ = (−1)^{ε(x)ε(y)} with ε(x) ∈ ℤ/2 the sign bit, which is a homomorphism ℝ^× → ℤ/2; hence the pairing is bilinear.
2. Steinberg identity: x and 1 − x are never both negative.
3. Descend through Matsumoto's presentation (K2SymbolsBrauer:T.2/matsumoto); surjectivity from (−1, −1)_∞ = −1.
4. Compose with the functoriality of K_2 along σ for the sign symbol at a real place.

**Acceptance.**

- (−1, −1)_∞ = −1, so {−1, −1} ≠ 1 in K_2(ℝ).
- For a number field with r_1 real places the r_1 sign symbols give a surjection K_2(F) → {±1}^{r_1} (Exercise III.6.4).
- It is the degree-two part of the graded map K^M_*(ℝ) → (ℤ/2)[t] of Examples III.7.2(c) (K2SymbolsBrauer:T.2/milnor-examples), and it equals the Hilbert symbol of ℝ (Example III.6.2.2; T.7/classical-local-symbols proves that comparison).

**Prerequisites.**

- `K2SymbolsBrauer:T.2/matsumoto`
- `K2SymbolsBrauer:T.1/k2-definition`
- `K2SymbolsBrauer:T.2/milnor-examples`
- `mathlib:NumberField.InfinitePlace.IsReal`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `realSignSymbol` | constructor | The homomorphism K_2(ℝ) →* ℤˣ with {x, y} ↦ −1 if x < 0 and y < 0, and 1 otherwise. |
| `realSignSymbol_symbol` | simp | Its value on a symbol {x, y}. |
| `realSignSymbol_neg_one_neg_one` | simp | realSignSymbol {−1, −1} = −1. |
| `realSignSymbol_surjective` | characterisation | It is onto ℤˣ. |
| `signSymbolAt` | functoriality | For σ : F →+* ℝ, the composite of K_2(σ) with realSignSymbol; for a number field one for each real place. |
| `realSignSymbol_eq_milnorExamples` | compatibility | Through Matsumoto's theorem, on K^M_2(ℝ): {x, y} ↦ −1 exactly when x < 0 and y < 0, which is the degree-two part of the graded map K^M_*(ℝ) → (ℤ/2)[t] of K2SymbolsBrauer:T.2/milnor-examples (a lemma with no API name to compare with). |

**Consumers.**

- T.5/k2-of-the-integers — it shows that {−1, −1} is nonzero, the lower bound of the order-two statement
- T.5/k2-of-the-rationals — it splits the tame-kernel sequence of ℚ
- ArithmeticKTheory N.6 — the model lower bound of an order certificate, a surjection onto a group of known order; the certificate format is N.6's
- T.7/classical-local-symbols — the Hilbert symbol of ℝ is this symbol

**Unit tests.**

- `realSignSymbol_values` (computation) — (−2, −3)_∞ = −1 and (−2, 3)_∞ = 1.
- `realSignSymbol_one` (degenerate) — (x, 1)_∞ = (1, y)_∞ = 1 for all x, y ∈ ℝ^×.
- `orSign_not_steinberg` (non-example) — The pairing equal to −1 when at least one entry is negative is not a Steinberg symbol: it is −1 at (2, −1) although 2 + (−1) = 1.
- `signSymbolAt_rat` (characterisation) — For the real embedding of ℚ, signSymbolAt sends {−1, −1} to −1 and {p, q} to 1 for positive p, q.
- `realSignSymbol_hilbert` (compatibility) — (x, y)_∞ = 1 exactly when x·a² + y·b² = 1 has a real solution, the Hilbert symbol of ℝ.

**Sources.**

- `Kbook.2013`: III.6.2.1, Example 6.2.1 (PDF p. 240; book p. 232). The definition and the Steinberg identity.
- `Kbook.2013`: III.6.2.1, Example 6.2.1, continued (PDF p. 240; book p. 232). Surjectivity and the consequence for K_2(ℤ).
- `Kbook.2013`: III, Exercise 6.4 (PDF p. 251; book p. 243). The sign symbols at the real places of a number field.

### K_2 of the integers is cyclic of order two, generated by {−1, −1}

`K2SymbolsBrauer:T.5/k2-of-the-integers` · theorem · parent `K2SymbolsBrauer:T.5` · implementation unchecked

K_2(ℤ) is cyclic of order two with generator {−1, −1}. The lower bound is proved here: the image of {−1, −1} in K_2(ℝ) has sign symbol −1, so it is nonzero. The upper bound is proved by integer-tame-kernel-upper-generation: the Tate residue-step criterion strips every odd prime from finite symbol support, and the remaining dyadic symbols reduce to {−1,−1}. This is independent of the real-sign lower bound; Milnor’s §10 is the source’s alternative historical proof. Consequently K_2(ℤ) → K_2(ℝ) → {±1} is an isomorphism and K_2(ℤ) is a direct summand of K_2(ℝ).

**Hypotheses.**

- K_2 is the classical K_2 of T.1; {−1, −1} is the Steinberg symbol of the unit −1 of ℤ with itself.

**Proof outline.**

1. {−1, −1} ∈ K_2(ℤ) is a Steinberg symbol of units, and 2·{−1, −1} = {1, −1} = 0.
2. By functoriality of K_2 its image in K_2(ℝ) is {−1, −1}, which T.5/real-sign-symbol sends to −1; so {−1, −1} ≠ 1.
3. Upper bound: apply integer-tame-kernel-upper-generation, using the rational-field residue representatives and the Tate unit-kernel criterion.
4. The composite K_2(ℤ) → K_2(ℝ) → {±1} is then an isomorphism, which splits K_2(ℤ) → K_2(ℝ).

**Acceptance.**

- {−1, −1} ≠ 1 in K_2(ℤ), while {−1, −1}² = 1.
- A real place is one way, not the only way, to detect {−1, −1}: in K_2(ℤ[i]) it vanishes ({−1, −1} = {i, −1}² = 1), yet K_2(ℤ[√−7]) is cyclic of order two generated by {−1, −1} although ℚ(√−7) has no real place (Tate, cited in III.5.2.2).
- In N.6’s certificate format: one generator {−1,−1}, relation2g=0, span by the Tate residue-step upper bound, and independent lower bound by the real sign. N.8 imports this completed mathematical certificate; no Lean implementation is claimed.

**Prerequisites.**

- `K2SymbolsBrauer:T.5/real-sign-symbol`
- `K2SymbolsBrauer:T.2/steinberg-symbol`
- `K2SymbolsBrauer:T.1/k2-definition`
- `K2SymbolsBrauer:T.5/integer-tame-kernel-upper-generation`

**Sources.**

- `Kbook.2013`: III.5.2.2, Example 5.2.2 (PDF p. 226; book p. 218). The statement and its cited proof; the source does not prove the upper bound.
- `Kbook.2013`: III.6.2.1, Example 6.2.1, continued (PDF p. 240; book p. 232). The non-triviality and the splitting.
- `Kbook.2013`: III.5.2.2, Example 5.2.2, second paragraph (PDF p. 226; book p. 218). The imaginary quadratic examples used in the acceptance.
- `BassTate.MilnorRing.1973`: Appendix Proposition1 A2–A3/PDF440–441, rational-field specialization in the prerequisite nodes. Alternative upper-generation proof supplied explicitly from the read general criterion; not a claim to have read Milnor§10.

### K_2 of the rationals (Application III.6.5.1)

`K2SymbolsBrauer:T.5/k2-of-the-rationals` · theorem · parent `K2SymbolsBrauer:T.5` · implementation unchecked

The residue sum of the tame symbols gives a split exact sequence 1 → K_2(ℤ) → K_2(ℚ) → ⊕_p 𝔽_p^× → 1, split by the real sign symbol through the isomorphism K_2(ℤ) ≅ {±1} of T.5/k2-of-the-integers; hence K_2(ℚ) ≅ K_2(ℤ) ⊕ ⊕_p 𝔽_p^× ≅ ℤ/2 ⊕ ⊕_{p odd} 𝔽_p^× (𝔽_2^× being trivial), and K_2(ℚ) is infinite. ArithmeticKTheory N.8 imports this computation rather than repeating it.

**Hypotheses.**

- p runs over all primes (𝔽_2^× is trivial); exactness is the tame-kernel sequence for ℚ, which uses K_2(ℤ/p) = 1 and SK_1(ℤ) = 1.

**Proof outline.**

1. Instance of T.5/tame-kernel-sequence for F = ℚ: HeightOneSpectrum ℤ is the set of primes and ℤ/(p) ≅ ZMod p.
2. Retraction: compose K_2(ℚ) → K_2(ℝ), the real sign symbol, and the inverse of the isomorphism K_2(ℤ) ≅ {±1}; a split short exact sequence of abelian groups gives the direct sum.
3. Infinite: there are infinitely many primes p ≥ 3, each with 𝔽_p^× ≠ 1, and the residue sum is onto.

**Acceptance.**

- {2, 3} is not in the image of K_2(ℤ): its tame symbol at 3 is −1 ≠ 1 in 𝔽_3^×.
- For an odd prime p, {−1, p} maps to the element −1 of 𝔽_p^× in the p-component and to 1 elsewhere.
- K_2(ℚ) is infinite while K_2(ℤ) has order two, the check ArithmeticKTheory N.8 asks for; the splitting uses the real place, and (p, q)_∞ = 1 for positive p, q.

**Prerequisites.**

- `K2SymbolsBrauer:T.5/tame-kernel-sequence`
- `K2SymbolsBrauer:T.5/k2-of-the-integers`
- `K2SymbolsBrauer:T.5/real-sign-symbol`
- `K2SymbolsBrauer:T.2/k2-finite-field`
- `KTheoryLowDegrees:U.4`
- `K2SymbolsBrauer:T.1/k2-definition`

**Sources.**

- `Kbook.2013`: III.6.5.1, Application 6.5.1 (PDF p. 244; book p. 236). The computation with its splitting.

### Dennis-Stein symbols

`K2SymbolsBrauer:T.6/dennis-stein-symbol` · definition · parent `K2SymbolsBrauer:T.6` · implementation unchecked

For an associative unital ring R and commuting elements r, s of R with 1 − rs a unit, the Dennis-Stein symbol is ⟨r, s⟩ = x_ji(−s(1 − rs)⁻¹) x_ij(−r) x_ji(s) x_ij((1 − rs)⁻¹ r) (h_ij(1 − rs))⁻¹ in the stable Steinberg group St(R), for distinct indices i, j, where w_ij(u) = x_ij(u) x_ji(−u⁻¹) x_ij(u) and h_ij(u) = w_ij(u) w_ij(−1). Its image in E(R) is trivial — in the 2×2 block at (i, j) the four elementary factors multiply to diag(1 − rs, (1 − rs)⁻¹), which h_ij(1 − rs) cancels — so ⟨r, s⟩ lies in K_2(R). It does not depend on the choice of i ≠ j, it is 1 when r = 0 or s = 0, and when r is a unit it equals the Steinberg symbol {r, 1 − rs}; hence every Steinberg symbol {u, v} of commuting units is ⟨u, u⁻¹(1 − v)⟩. The convention is the modern one of the source. The pre-1980 symbol, defined when 1 + rs is a unit (the `1+ab` hypothesis of the stage text), is ⟨−r, s⟩⁻¹ in this notation; it is a different element and is not introduced as a second definition. The relations (D1)–(D3) are the node dennis-stein-relations and the relative symbol is in relative-steinberg-group.

**Hypotheses.**

- R is an associative unital ring; r and s commute and 1 − rs is a unit of R.
- i ≠ j are indices; the word is read in the stable Steinberg group St(R), and the element does not depend on i, j.
- The stage text's `1 + ab` invertibility hypothesis is the pre-1980 convention: for commuting a, b with 1 + ab a unit the old symbol is ⟨−a, b⟩⁻¹ in the notation used here, so that hypothesis is met through a ↦ −a.

**Proof outline.**

1. Write the word in St(R) from the generators x_ij (K2SymbolsBrauer:T.1/steinberg-group-finite-rank, stabilised by K2SymbolsBrauer:T.1/stabilisation) and the elements w_ij, h_ij of K2SymbolsBrauer:T.2/steinberg-symbol.
2. Compute its image in E(R): with u = 1 − rs, the product e_ji(−s u⁻¹) e_ij(−r) e_ji(s) e_ij(u⁻¹ r) is diag(u, u⁻¹) at (i, j) — a direct 2×2 multiplication in which the off-diagonal entries vanish because rs = sr and u⁻¹ commutes with r and s — and φ(h_ij(u)) is the same diagonal matrix (K-book Example III.5.10.1). So the image is 1 and ⟨r, s⟩ ∈ K_2(R) (K2SymbolsBrauer:T.1/k2-definition).
3. Independence of i ≠ j: conjugate by w = w_ik(1) w_jl(1) w_kl(1)², which carries the word for (i, j) to the word for (k, l) by the identities of K-book Ex. III.5.8 (this is Ex. III.5.11); an element of K_2(R) is central (K2SymbolsBrauer:T.1/k2-is-centre), so the conjugate is the same element.
4. Degenerate values: x_ij(0) = 1 and h_ij(1) = w_ij(1) w_ij(−1) = 1 (Ex. III.5.8(a)), so ⟨r, 0⟩ = x_ij(−r) x_ij(r) = 1 and ⟨0, s⟩ = x_ji(−s) x_ji(s) = 1.
5. Unit case: for r a unit, rewrite the word with Ex. III.5.8 and Ex. III.5.9 into h_ij-form and compare with {r, s'} = h_ij(rs') h_ij(s')⁻¹ h_ij(r)⁻¹ to get ⟨r, s⟩ = {r, 1 − rs}, as Ex. III.5.11 asks; substituting s = u⁻¹(1 − v) gives {u, v} = ⟨u, u⁻¹(1 − v)⟩.
6. Record the convention: the modern ⟨r, s⟩ is ⟨−r, s⟩⁻¹ of the pre-1980 literature (K-book III.5.11), and state that translation as a lemma rather than defining a second symbol.

**Acceptance.**

- ⟨r, s⟩ lies in K_2(R) and does not depend on i ≠ j.
- ⟨r, 0⟩ = ⟨0, s⟩ = 1.
- For a unit r, ⟨r, s⟩ = {r, 1 − rs}; for commuting units, {u, v} = ⟨u, u⁻¹(1 − v)⟩.
- In K_2(ℤ), ⟨−1, −2⟩ = {−1, −1} ≠ 1, while the pre-1980 symbol at the same pair is trivial in K_2(ℚ).

**Prerequisites.**

- `K2SymbolsBrauer:T.1/steinberg-group-finite-rank`
- `K2SymbolsBrauer:T.1/stabilisation`
- `K2SymbolsBrauer:T.1/k2-definition`
- `K2SymbolsBrauer:T.1/k2-is-centre`
- `K2SymbolsBrauer:T.2/steinberg-symbol`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.K2.dennisStein` | constructor | For commuting r, s : R and a proof that 1 − r s is a unit, the element ⟨r, s⟩ : K₂(R). |
| `TauCeti.K2.coe_dennisStein` | characterisation | (⟨r, s⟩ : St(R)) = x_ji(−s u⁻¹) x_ij(−r) x_ji(s) x_ij(u⁻¹ r) h_ij(u)⁻¹ with u = 1 − r s, for any i ≠ j. |
| `TauCeti.K2.dennisStein_index_indep` | characterisation | The words for (i, j) and for (k, l) are equal in St(R). |
| `TauCeti.K2.phi_dennisSteinWord` | characterisation | The image in E(R) of x_ji(−s u⁻¹) x_ij(−r) x_ji(s) x_ij(u⁻¹ r) is diag(u, u⁻¹) at (i, j). |
| `TauCeti.K2.dennisStein_zero_left` | simp | ⟨0, s⟩ = 1. |
| `TauCeti.K2.dennisStein_zero_right` | simp | ⟨r, 0⟩ = 1. |
| `TauCeti.K2.dennisStein_eq_steinbergSymbol` | compatibility | For a unit r, ⟨r, s⟩ = {r, 1 − r s}. |
| `TauCeti.K2.steinbergSymbol_eq_dennisStein` | compatibility | For commuting units u, v, {u, v} = ⟨u, u⁻¹ (1 − v)⟩. |
| `TauCeti.K2.map_dennisStein` | functoriality | For a ring homomorphism f : R → R', K₂(f) ⟨r, s⟩ = ⟨f r, f s⟩. |
| `TauCeti.K2.dennisStein_neg_inv` | relation | The translation of the pre-1980 hypothesis: if 1 + ab is a unit then so is 1 − (−a)b, so the old symbol of (a, b) is ⟨−a, b⟩⁻¹. No second symbol is defined, so this is a statement about hypotheses, not an identity. |

**Consumers.**

- T.6, the presentation theorem — K₂ of a field or a commutative local ring is presented by these symbols and (D1)–(D3)
- T.6, relative-steinberg-group and the square-zero tests — the relative symbol ⟨r, s⟩ ∈ K₂(R, I), s ∈ I, is this word read in the relative Steinberg group
- K-book Ex. III.5.13 — K₂(ℤ/4) ≅ {±1} on {−1, −1} = ⟨−1, −2⟩ = ⟨2, 2⟩
- RefinedTraceMethods RT.3 — RT.3 compares its square-zero boundary maps with the low-degree K₂ symbol calculations: it consumes T.6 and is not a prerequisite of it

**Unit tests.**

- `TauCeti.K2.phi_dennisSteinWord_two` (characterisation) — In GL₂(R), with u = 1 − r s a unit and r s = s r, e₂₁(−s u⁻¹) e₁₂(−r) e₂₁(s) e₁₂(u⁻¹ r) = diag(u, u⁻¹); a word with one sign or one factor changed fails this.
- `TauCeti.K2.dennisStein_zero` (degenerate) — ⟨r, 0⟩ = 1 and ⟨0, s⟩ = 1 for all r, s.
- `TauCeti.K2.dennisStein_neg_one_neg_two` (computation) — In K₂(ℤ): ⟨−1, −2⟩ = {−1, 1 − (−1)(−2)} = {−1, −1}, which is non-trivial because the sign symbol of K2SymbolsBrauer:T.5/real-sign-symbol sends it to −1.
- `TauCeti.K2.dennisStein_not_old_convention` (non-example) — At (−1, −2) in ℚ the pre-1980 symbol is ⟨1, −2⟩⁻¹ = {1, 3}⁻¹ = 1 (1 + (−1)(−2) = 3 is a unit), while the modern ⟨−1, −2⟩ = {−1, −1} ≠ 1 in K₂(ℚ); and over ℤ the modern symbol is defined at (1, 2) because 1 − 2 = −1 is a unit, where the old hypothesis 1 + 2 = 3 fails. An implementation of the old convention fails both.
- `TauCeti.K2.steinbergSymbol_two_three` (compatibility) — In K₂(ℚ), {2, 3} = ⟨2, −1⟩, the case u = 2, v = 3 of {u, v} = ⟨u, u⁻¹(1 − v)⟩.

**Sources.**

- `Kbook.2013`: III.5.11 (PDF p. 234). The definition, membership in K2, independence of the indices and the unit case; the displayed word is written out in the statement.
- `Kbook.2013`: III.5.11 (PDF p. 234). The modern convention and its translation from the pre-1980 one, which the stage text's 1 + ab hypothesis belongs to.

### Presentation of K_2 of a field or a commutative local ring by Dennis-Stein symbols

`K2SymbolsBrauer:T.6/dennis-stein-presentation` · theorem · parent `K2SymbolsBrauer:T.6` · implementation unchecked

Theorem III.5.11.1(a). Let R be a commutative local ring, or a field. Then the homomorphism to K₂(R) from the abelian group D(R) generated by symbols ⟨r, s⟩ (r, s ∈ R with 1 − rs a unit) subject only to (D1), (D2) and (D3), sending each generator to the Dennis-Stein symbol, is an isomorphism. For a field this is equivalent to Matsumoto's theorem through ⟨r, s⟩ ↦ {r, 1 − rs} for r ≠ 0, ⟨0, s⟩ ↦ 1, and {a, b} ↦ ⟨a, a⁻¹(1 − b)⟩, and it is proved that way. For a commutative local ring that is not a field it is the theorem the source attributes to Maazen, Stienstra and van der Kallen, with Keune [103] as the correct reference; it is cited, not proved. No presentation is asserted for any other ring, and the source states none under a stable-range hypothesis.

**Hypotheses.**

- R is a commutative local ring, or a field.

**Proof outline.**

1. The map D(R) → K₂(R) is well defined by K2SymbolsBrauer:T.6/dennis-stein-relations.
2. Field case, inverse map: through Matsumoto's presentation (K2SymbolsBrauer:T.2/matsumoto) send {a, b} to ⟨a, a⁻¹(1 − b)⟩, which is defined because 1 − a·a⁻¹(1 − b) = b. It is multiplicative in b by (D2), since with s = a⁻¹(1 − b), t = a⁻¹(1 − c) one has s + t − ast = a⁻¹(1 − bc). It is multiplicative in a by (D3) with (r, s, t) = (a, b, (ab)⁻¹(1 − c)) and (D1): ⟨a, a⁻¹(1 − c)⟩ = ⟨ab, (ab)⁻¹(1 − c)⟩⟨b⁻¹(1 − c), b⟩ and ⟨b⁻¹(1 − c), b⟩ = ⟨b, b⁻¹(1 − c)⟩⁻¹. It kills {a, 1 − a} because ⟨a, 1⟩ = 1.
3. Field case, the composites are identities: {a, b} ↦ ⟨a, a⁻¹(1 − b)⟩ ↦ {a, b} by the unit case; ⟨r, s⟩ ↦ {r, 1 − rs} ↦ ⟨r, s⟩ for r ≠ 0; and ⟨0, s⟩ = 1 already in D(F), because (D3) with (r, s, t) = (0, 0, s) reads ⟨0, 0⟩ = ⟨0, s⟩⟨0, 0⟩.
4. Commutative local ring that is not a field: cite Theorem III.5.11.1(a) as the source does; the proof (Keune [103]; Maazen–Stienstra; van der Kallen) was not obtained and is recorded as a gap.
5. Record the boundary the stage text asks for: the source's presentation theorems are (a) for commutative local rings and fields and (b) for radical ideals (K2SymbolsBrauer:T.6/relative-presentation); no stable-range version is stated there, none is planned, and Matsumoto's field presentation is not extended to any other ring.

**Acceptance.**

- For a field the Dennis-Stein and Matsumoto presentations correspond under {a, b} ↔ ⟨a, a⁻¹(1 − b)⟩, with ⟨0, s⟩ = 1.
- For a local ring that is not a field the statement is cited, with the reference the source names.
- No presentation is asserted outside the stated hypotheses.

**Prerequisites.**

- `K2SymbolsBrauer:T.6/dennis-stein-symbol`
- `K2SymbolsBrauer:T.6/dennis-stein-relations`
- `K2SymbolsBrauer:T.2/matsumoto`

**Sources.**

- `Kbook.2013`: III.5.11.1(a) (PDF p. 234). The theorem with its hypotheses, verbatim.
- `Kbook.2013`: III.5.11 (PDF p. 234). The attribution; the source gives no proof. [103] is F. Keune, The relativization of K2, J. Algebra 54 (1978), 159–177.

### Square-zero ideals: the simplified relations and the source's test values

`K2SymbolsBrauer:T.6/relative-square-zero` · application · parent `K2SymbolsBrauer:T.6` · implementation unchecked

Let A be a commutative ring and I an ideal with I² = 0; the test instance is A = TrivSqZeroExt R M (R commutative, M an R-module) with I = TrivSqZeroExt.kerIdeal R M, whose square is zero. Then I is a radical ideal; every ⟨a, s⟩ with a ∈ A, s ∈ I is defined, since 1 − as has inverse 1 + as; ⟨s, a⟩ = ⟨a, s⟩⁻¹; and s ↦ ⟨a, s⟩ is additive on I, because the term ast of (D2) lies in I² = 0. So by K2SymbolsBrauer:T.6/relative-presentation, K₂(A, I) is generated by the ⟨a, s⟩ with a ∈ A and s ∈ I. The source's test values, all stated as exercises, are: a surjection K₂(A, I) → I ⊗_A Ω¹_{A/I}, ⟨x, r⟩ ↦ x ⊗ dr, for any radical ideal (Ex. III.5.14(a)); for I² = 0 its kernel is generated by the ⟨x, y⟩ with x, y ∈ I (Ex. III.5.14(b)); for the dual numbers R[ε] with 1/2 ∈ R the map K₂(R[ε], ε) → Ω¹_R is an isomorphism (van der Kallen, Ex. III.5.14(c)); and K₂(ℤ/2ⁿ) ≅ K₂(ℤ/4) ≅ {±1} for n ≥ 2, on {−1, −1} = ⟨−1, −2⟩ = ⟨2, 2⟩ (Ex. III.5.13). These test the relative theory, and GeneralAlgebraicKTheory K.5's relative K₂ through the Keune–Loday comparison; they extend no field presentation to a general ring.

**Hypotheses.**

- A is a commutative ring and I ⊆ A an ideal with I² = 0 (Theorem III.5.11.1(b) needs A commutative).
- The test ring is Mathlib's TrivSqZeroExt R M with I = TrivSqZeroExt.kerIdeal R M, for R commutative and M an R-module with the central bimodule structure, so that TrivSqZeroExt R M is commutative.

**Proof outline.**

1. I lies in the Jacobson radical because each s ∈ I has s² = 0; for a ∈ A and s ∈ I, (1 − as)(1 + as) = 1 − a²s² = 1.
2. For s, t ∈ I, (D2) reads ⟨a, s⟩⟨a, t⟩ = ⟨a, s + t⟩ because ast ∈ I² = 0, and (D1) gives ⟨s, a⟩ = ⟨a, s⟩⁻¹; so the generators with first entry in I are redundant, and K₂(A, I) is generated by the ⟨a, s⟩, s ∈ I (K2SymbolsBrauer:T.6/relative-presentation).
3. Instantiate A = TrivSqZeroExt R M: it is commutative (TrivSqZeroExt.commRing), kerIdeal R M has square zero (TrivSqZeroExt.kerIdeal_sq), and an element is a unit exactly when its first coordinate is (TrivSqZeroExt.isUnit_iff_isUnit_fst).
4. State the source's test values (Ex. III.5.13, Ex. III.5.14(a)–(c)) as acceptance statements. They are exercises in the source and their proofs are not supplied here, except ⟨2, 2⟩ = ⟨−1, −2⟩ = {−1, −1} in K₂(ℤ/4), which K2SymbolsBrauer:T.6/dennis-stein-relations derives.
5. The comparison of these computations with the boundary maps of the trace comparison is RefinedTraceMethods RT.3's own test, and RT.3 consumes this node; it is not performed here.

**Acceptance.**

- For I = 0 the relative group is trivial.
- For s, t ∈ I, ⟨a, s⟩⟨a, t⟩ = ⟨a, s + t⟩.
- For A = ℤ/4 and I = 2ℤ/4: I² = 0 and Ω¹ of 𝔽₂ is 0, so by Ex. III.5.14(a),(b) K₂(ℤ/4, I) is generated by ⟨2, 2⟩, which maps to {−1, −1} in K₂(ℤ/4).
- For the dual numbers, K₂(ℚ[ε], ε) ≅ Ω¹ of ℚ = 0, while K₂(ℚ(t)[ε], ε) ≅ Ω¹ of ℚ(t) ≠ 0 (⟨ε, t⟩ ↦ dt), by the van der Kallen isomorphism of Ex. III.5.14(c) as cited.
- No presentation of K₂ of a general ring is claimed.

**Prerequisites.**

- `K2SymbolsBrauer:T.6/relative-steinberg-group`
- `K2SymbolsBrauer:T.6/relative-presentation`
- `K2SymbolsBrauer:T.6/dennis-stein-relations`
- `mathlib:TrivSqZeroExt`
- `mathlib:TrivSqZeroExt.commRing`
- `mathlib:TrivSqZeroExt.kerIdeal`
- `mathlib:TrivSqZeroExt.kerIdeal_sq`
- `mathlib:TrivSqZeroExt.isUnit_iff_isUnit_fst`
- `GeneralAlgebraicKTheory:K.5`

**Sources.**

- `Kbook.2013`: III.5.11.1(b) (PDF p. 235). Part (b) of the theorem with its hypotheses; stated, not proved.
- `Kbook.2013`: Ex. III.5.14(a) (PDF p. 237). The Kähler-differential lower bound, stated as an exercise.
- `Kbook.2013`: Ex. III.5.14(b),(c) (PDF p. 238). The square-zero and dual-number test values, stated as exercises ('1 2' is the printed fraction 1/2).
- `Kbook.2013`: Ex. III.5.13 (PDF p. 237). The nilpotent relative example; the identity of the three elements is derived in dennis-stein-relations.

### The Dennis-Stein relations (D1)–(D3)

`K2SymbolsBrauer:T.6/dennis-stein-relations` · theorem · parent `K2SymbolsBrauer:T.6` · implementation unchecked

For a commutative ring R the Dennis-Stein symbols satisfy (D1) ⟨r, s⟩⟨s, r⟩ = 1 when 1 − rs is a unit; (D2) ⟨r, s⟩⟨r, t⟩ = ⟨r, s + t − rst⟩ when 1 − rs and 1 − rt are units, the right side being defined because 1 − r(s + t − rst) = (1 − rs)(1 − rt); and (D3) ⟨r, st⟩ = ⟨rs, t⟩⟨tr, s⟩ when 1 − rst is a unit. Consequently ⟨r, 1⟩ = 1 whenever 1 − r is a unit (D3 with s = t = 1), which the source prints as ⟨r, 1⟩ = 0. When every entry involved is a unit or zero — in particular over a field — the relations follow from the unit case of the definition together with bilinearity and the Steinberg identity of Steinberg symbols. For a general commutative ring they are the identities of Dennis and Stein, which the source cites and does not prove.

**Hypotheses.**

- R is a commutative ring. The source displays (D1)–(D3) without hypotheses and cites Dennis–Stein, who work with commutative rings; the relations are not asserted for merely commuting elements of a noncommutative ring.
- Each symbol written is defined: the relevant 1 − rs, 1 − rt, 1 − rst are units.

**Proof outline.**

1. Entries units or zero: a symbol with a zero entry is 1 (dennisStein_zero_left/right), and both sides of each relation are then 1 (for (D3) with r = 0 it reads 1 = 1·1). Otherwise substitute ⟨r, s⟩ = {r, 1 − rs}: (D1) {r, 1 − rs}{s, 1 − rs} = {rs, 1 − rs} = 1 by bilinearity and the Steinberg identity; (D2) {r, 1 − rs}{r, 1 − rt} = {r, (1 − rs)(1 − rt)} = {r, 1 − r(s + t − rst)}; (D3) {rs, 1 − rst}{tr, 1 − rst} = {r²st, 1 − rst} = {r, 1 − rst}{rst, 1 − rst} = {r, 1 − rst}.
2. General commutative ring: import (D1)–(D3) from Dennis and Stein (K-book reference [48], LNM 342), as the source does. The proof is a computation in St(R) that the source does not reproduce; recorded as a gap.
3. Derive ⟨r, 1⟩ = 1 from (D3) with s = t = 1 when 1 − r is a unit, and ⟨1, s⟩ = {1, 1 − s} = 1 from the unit case when 1 − s is a unit.

**Acceptance.**

- In K₂(ℤ/4): (D3) with (r, s, t) = (2, 1, 1) gives ⟨2, 1⟩ = 1; (D2) with (2, 1, 2) gives ⟨2, 1⟩⟨2, 2⟩ = ⟨2, −1⟩; (D3) with (2, −1, −1) gives ⟨2, −1⟩² = ⟨2, 1⟩ = 1 (since −2 = 2); (D1) gives ⟨2, −1⟩ = ⟨−1, 2⟩⁻¹ = ⟨−1, 2⟩; and 2 = −2, so ⟨2, 2⟩ = ⟨−1, −2⟩ = {−1, −1}, the identity of K-book Ex. III.5.13.
- ⟨r, 1⟩ = 1 when 1 − r is a unit; it is not a separate generator and not '0'.
- Over a field the relations are consequences of the Steinberg relations; no relation beyond (D1)–(D3) is claimed.

**Prerequisites.**

- `K2SymbolsBrauer:T.6/dennis-stein-symbol`
- `K2SymbolsBrauer:T.2/steinberg-symbol`
- `K2SymbolsBrauer:T.2/steinberg-identity`

**Sources.**

- `Kbook.2013`: III.5.11 (PDF p. 234). The three relations, which the source cites to Dennis and Stein without proof.
- `Kbook.2013`: III.5.11 (PDF p. 234). The consequence of (D3); the printed '=0' is a misprint for '= 1' (source issue), valid when 1 − r is a unit.
- `Kbook.2013`: Ex. III.5.13 (PDF p. 237). The nilpotent relative example; the identity of the three elements is derived in dennis-stein-relations.

### The relative Steinberg group and relative K_2 of an ideal

`K2SymbolsBrauer:T.6/relative-steinberg-group` · definition · parent `K2SymbolsBrauer:T.6` · implementation unchecked

For a ring R and a two-sided ideal I, let R ⊕ I be the double ring with multiplication (r, x)(s, y) = (rs, ry + xs + xy), with pr(r, x) = r and add(r, x) = r + x. St′(R, I) is the normal subgroup of St(R ⊕ I) generated by the x_ij(0, v), v ∈ I; it is the kernel of St(pr). The relative Steinberg group St(R, I) is the quotient of St′(R, I) by the normal subgroup generated by the cross-commutators [x_ij(0, u), x_kl(v, −v)], u, v ∈ I (Keune and Loday's definition). St(add) induces St(R, I) → St(R), whose image is the normal subgroup generated by the x_ij(v), v ∈ I, and whose composite with St(R) → E(R) lands in E(R, I). K₂(R, I) is the kernel of St(R, I) → E(R, I). For s ∈ I and r commuting with s with 1 − rs a unit, the relative Dennis-Stein symbol ⟨r, s⟩ ∈ K₂(R, I) is the class of the Dennis-Stein word of ((r, 0), (0, s)) in St(R ⊕ I); it lies in St′(R, I) because pr sends it to ⟨r, 0⟩ = 1, and add sends it to ⟨r, s⟩ ∈ K₂(R). K₂(R, I) fits into the exact sequence K₂(R, I) → K₂(R) → K₂(R/I) → K₁(R, I) → K₁(R) → K₁(R/I) of Theorem III.5.7.1. Its identification with π₂ of the homotopy fibre of K(R) → K(R/I) (GeneralAlgebraicKTheory K.5) is due to Keune and Loday, cited in the source, and is a gap here.

**Hypotheses.**

- R is an associative unital ring and I a two-sided ideal; E(R, I), GL(I) and K₁(R, I) are those of KTheoryLowDegrees U.5.
- For the relative symbol: s ∈ I, r ∈ R commutes with s, and 1 − rs is a unit of R.

**Proof outline.**

1. Form R ⊕ I, pr and add; St(pr) is split by St of the inclusion r ↦ (r, 0), and its kernel is the normal closure of the x_ij(0, v), giving the exact sequence 1 → St′(R, I) → St(R ⊕ I) → St(R) → 1 of the source (functoriality of K2SymbolsBrauer:T.1/stabilisation).
2. St(add) kills the cross-commutators, since it sends x_ij(0, u) to x_ij(u) and x_kl(v, −v) to x_kl(0) = 1, so it descends to St(R, I) → St(R); its image is the normal closure of the x_ij(v), v ∈ I.
3. Define K₂(R, I) as the kernel of St(R, I) → E(R, I) ⊆ E(R) (KTheoryLowDegrees:U.5).
4. Relative symbol: 1 − (r, 0)(0, s) = (1, −rs) is a unit of R ⊕ I with inverse (1, rs(1 − rs)⁻¹), which lies in 1 ⊕ I because I is an ideal; so the Dennis-Stein word of ((r, 0), (0, s)) is defined, lies in St′(R, I), and has trivial image in E(R, I).
5. Exactness (Theorem III.5.7.1): the Snake Lemma on the commutative diagram with rows K₂ → St → GL → K₁ for (R, I), R and R/I, with Ex. III.5.1, as in the source.

**Acceptance.**

- K₂(R, 0) is trivial.
- The image of K₂(R, I) → K₂(R) is the kernel of K₂(R) → K₂(R/I).
- For s ∈ I the relative symbol maps to the absolute Dennis-Stein symbol ⟨r, s⟩.

**Prerequisites.**

- `K2SymbolsBrauer:T.1/steinberg-group-finite-rank`
- `K2SymbolsBrauer:T.1/stabilisation`
- `K2SymbolsBrauer:T.1/k2-definition`
- `K2SymbolsBrauer:T.6/dennis-stein-symbol`
- `KTheoryLowDegrees:U.5`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.K2.RelSteinberg` | data | St(R, I): the normal closure of the x_ij(0, v) in St(R ⊕ I), modulo the cross-commutators [x_ij(0, u), x_kl(v, −v)]. |
| `TauCeti.K2.RelSteinberg.add` | projection | The homomorphism St(R, I) → St(R) induced by add. |
| `TauCeti.K2.RelSteinberg.range_add` | characterisation | Its range is the normal subgroup of St(R) generated by the x_ij(v), v ∈ I. |
| `TauCeti.K2.relK2` | data | K₂(R, I), the kernel of St(R, I) → E(R, I). |
| `TauCeti.K2.relK2.toK2` | projection | The map K₂(R, I) → K₂(R). |
| `TauCeti.K2.relK2.exact` | structure | Exactness of K₂(R, I) → K₂(R) → K₂(R/I) → K₁(R, I) → K₁(R) → K₁(R/I) (Theorem III.5.7.1). |
| `TauCeti.K2.relK2.map` | functoriality | A ring homomorphism f : R → R' with f(I) ⊆ I' induces K₂(R, I) → K₂(R', I'), with map_id and map_comp. |
| `TauCeti.K2.relK2_bot` | simp | K₂(R, ⊥) is trivial. |
| `TauCeti.K2.relDennisStein` | constructor | For s ∈ I, r commuting with s and 1 − r s a unit, the relative symbol ⟨r, s⟩ ∈ K₂(R, I). |
| `TauCeti.K2.toK2_relDennisStein` | compatibility | relK2.toK2 ⟨r, s⟩ = ⟨r, s⟩. |

**Consumers.**

- T.6, relative-presentation — Theorem III.5.11.1(b) presents this group for a radical ideal
- T.6, relative-square-zero — the square-zero test values are computations of K₂(A, I) for I² = 0
- GeneralAlgebraicKTheory K.5 — the homotopy-fibre relative K₂ of the pair is compared with this group (Keune–Loday), which is what makes the T.6 examples tests of K.5

**Unit tests.**

- `TauCeti.K2.relK2_zero_ideal` (degenerate) — For I = 0, St′(R, 0) is generated by x_ij(0, 0) = 1, so St(R, 0) and K₂(R, 0) are trivial.
- `TauCeti.K2.relK2_Z4` (computation) — For R = ℤ/4 and I = 2ℤ/4: K₂(ℤ/2) = 1 (K2SymbolsBrauer:T.2/k2-finite-field), so by exactness K₂(ℤ/4, I) → K₂(ℤ/4) is onto, and the relative symbol ⟨2, 2⟩ maps to ⟨2, 2⟩ = {−1, −1}.
- `TauCeti.K2.RelSteinberg.range_add_top` (characterisation) — For I = R the range of St(R, R) → St(R) is all of St(R), and for I = 0 it is trivial.

**Sources.**

- `Kbook.2013`: III.5.7 (PDF p. 230). The subgroup St′(R, I) of the double ring's Steinberg group.
- `Kbook.2013`: III.5.7 (PDF p. 230). The definition, verbatim (Keune and Loday's, modifying Milnor's).
- `Kbook.2013`: III.5.7 (PDF p. 230). The relative K2.
- `Kbook.2013`: III.5.7.1 (PDF p. 231). The exact sequence, proved in the source by the Snake Lemma.
- `Kbook.2013`: III.5.11 (PDF p. 234). The relative Dennis-Stein symbol.
- `Kbook.2013`: IV.1.11 (PDF p. 276). The comparison of the homotopy-fibre relative K2 with Definition III.5.7, cited, not proved.

### Presentation of relative K_2 of a radical ideal

`K2SymbolsBrauer:T.6/relative-presentation` · theorem · parent `K2SymbolsBrauer:T.6` · implementation unchecked

Theorem III.5.11.1(b). Let I be a radical ideal (contained in the Jacobson radical) of a commutative ring R. Then K₂(R, I) is the abelian group generated by the relative Dennis-Stein symbols ⟨r, s⟩ with r ∈ R and s ∈ I, or r ∈ I and s ∈ R, subject only to (D1), (D2), and (D3) whenever r, s or t lies in I. For such pairs 1 − rs is automatically a unit, since rs lies in I and so in the Jacobson radical. The source states this theorem with part (a), attributes it as there, and does not prove it.

**Hypotheses.**

- R is a commutative ring and I ⊆ R an ideal contained in the Jacobson radical of R.

**Proof outline.**

1. Generators: the symbols with s ∈ I are the relative symbols of K2SymbolsBrauer:T.6/relative-steinberg-group; those with r ∈ I are the words of ((0, r), (s, 0)) in St(R ⊕ I), whose image under pr is ⟨0, s⟩ = 1.
2. The relations hold in K₂(R, I): use the relative form of T.6/dennis-stein-relations. In D3 require hI3 : r ∈ I ∨ s ∈ I ∨ t ∈ I, as III.5.11.1(b) does. Derive the three pair-membership witnesses by ideal closure; their admissibility alone is not a hypothesis permitting D3. For quotient descent, check D1 and D2 as before and split D3 on hI3, using D1 to swap ideal entries where needed. This checks only the source-allowed relation set; completeness remains the cited-source gap.
3. Completeness of the relations: cite Theorem III.5.11.1(b); the proof (Keune [103]; Maazen–Stienstra) was not obtained and is recorded as a gap.

**Acceptance.**

- For I = 0 the presentation gives the trivial group.
- For I² = 0 it specialises to K2SymbolsBrauer:T.6/relative-square-zero.
- It is asserted only for a radical ideal of a commutative ring.
- Non-example: R = F_3[x,y]/(x²,y²), z = xy, I = (z), r = x, s = y, t = x+y. Here I² = 0 and I lies in the Jacobson radical; rs = st = tr = z but no entry is in I, so this triple is not admitted as relative D3. In the differential detector I ⊗_R Ω¹_{(R/I)/ℤ} ≅ F_3², ⟨x,z⟩−⟨z,x+y⟩−⟨z,y⟩ has image (1,1), not 0.

**Prerequisites.**

- `K2SymbolsBrauer:T.6/relative-steinberg-group`
- `K2SymbolsBrauer:T.6/dennis-stein-relations`
- `mathlib:DualNumber`
- `mathlib:DualNumber.eps`
- `mathlib:Ideal.mul_mem_left`
- `mathlib:Ideal.mul_mem_right`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.K2.RelDSGen` | data | The subtype of R × R with at least one entry in I. |
| `TauCeti.K2.relDSRel` | relation | D1 and D2 on relative generators and D3 only for r ∈ I ∨ s ∈ I ∨ t ∈ I. The three generator witnesses for D3 are derived from that entry condition, never used as a weaker substitute. |
| `TauCeti.K2.relDennisSteinGroup` | data | FreeAbelianGroup (RelDSGen I) modulo AddSubgroup.closure (relDSRel I), with the guarded D3 set. |
| `TauCeti.K2.relDennisSteinGroup.toRelK2` | compatibility | For I ≤ Ideal.jacobson ⊥, the relative generator map descends through exactly the source-allowed D1–D3 relations. Bijectivity is relative_presentation; its cited completeness proof remains unobtained. |

**Unit tests.**

- `TauCeti.K2.relative_D3_guard` (non-example) — On the actual ring DualNumber (DualNumber (ZMod 3)), let x be the inner epsilon, y the outer epsilon and I = (xy). The three D3 pairs for (x,y,x+y) are admissible but x, y and x+y are outside I; the corrected D3 clause rejects the triple.
- `TauCeti.K2.relative_D3_detector` (computation) — For the same ring/ideal, in the basis xy⊗dx, xy⊗dy of I ⊗_R Ω¹_{(R/I)/ℤ}, δ⟨x,xy⟩ = (2,0), δ⟨xy,x+y⟩ = (1,1), δ⟨xy,y⟩ = (0,1). The extra D3 defect is (1,1) ≠ 0; all source-allowed D1/D2/D3 defects vanish.
- `TauCeti.K2.relative_presentation_bot` (degenerate) — For I = ⊥, relDennisSteinGroup I and relative K₂ are trivial; the guarded quotient has no spurious nonzero generators.

**Sources.**

- `Kbook.2013`: III.5.11.1(b) (PDF p. 235). Part (b) of the theorem with its hypotheses; stated, not proved.
- `Kbook.2013`: III.5.11 (PDF p. 234). The attribution; the source gives no proof. [103] is F. Keune, The relativization of K2, J. Algebra 54 (1978), 159–177.
- `Kbook.2013`: Exercise III.5.14(a), PDF p. 237 (printed p. 229). Primary-source differential detector δ⟨i,a⟩ = i⊗dā for the relative-D3 non-example; the F_3² tensor calculation and exhaustive finite-ring checks are derived here, not quoted as a worked example from the source.

### The symbol formula, read in the pinned Kummer map and cup product

`K2SymbolsBrauer:T.7/symbol-formula` · comparison · parent `K2SymbolsBrauer:T.7` · implementation unchecked

For a field F and an integer m invertible in F, the Galois symbol h_F : K₂(F)/m → H²(F, μ_m^{⊗2}) of MotivicEtaleKTheory M.3 sends {a, b} to κ(a) ∪ κ(b), the cup product of the two Kummer classes for the canonical equivariant pairing μ_m × μ_m → μ_m^{⊗2} (K-book (6.10.2) and Proposition III.6.10.3). This node identifies that cup product with the one the pinned library computes: κ is Tau Ceti's kummerMap F m, with values in H¹(G_F, KummerCoeff F m), and the cup is explicitCup11 at the tensor pairing KummerCoeff F m × KummerCoeff F m → μ_m^{⊗2}, which is equivariant for the diagonal action and, the modules being discrete, jointly continuous. MotivicEtaleKTheory M.3 is the single owner of the Galois symbol, of its symbol formula and of the cohomological Steinberg relation κ(a) ∪ κ(1 − a) = 0 that makes h_F well defined on K₂(F) through Matsumoto's presentation (the source proves it by factoring t^m − a and the projection formula), and of Tate's local, global and S-integer theorems (RT-AREA-ktheory-1/8). T.7 constructs none of these and proves no Tate theorem: it imports the map for a general field, before M.3's arithmetic specialisation, and identifies its formula with the pinned Kummer map and cup product. No primitive root is chosen.

**Hypotheses.**

- F is a field, m ≥ 1 is invertible in F, and a, b ∈ F^×.
- μ_m^{⊗2} is the twice-twisted module of MotivicEtaleKTheory M.1, a discrete G_F-module with the diagonal action; no primitive root is chosen.

**Proof outline.**

1. Import the Galois symbol, its symbol formula and its Steinberg relation from MotivicEtaleKTheory:M.3, their single owner (its stage text lists 'the symbol formula' among its required public statements); nothing of M.3's is rebuilt here.
2. Identify M.3's Kummer class with Tau Ceti's kummerMap, the connecting map of the Kummer sequence; ker_kummerMap identifies its kernel with (F^×)^m, so κ descends to F^×/F^×m.
3. Identify M.3's cup product in bidegree (1, 1) with explicitCup11 at the tensor pairing, which is equivariant because G_F acts diagonally on μ_m^{⊗2}.
4. Conclude h_F{a, b} = explicitCup11 (κ a) (κ b), and record that explicitCup11 is graded-commutative with sign −1 in bidegree (1, 1) (explicitCup11_eq_neg_flip), consistent with {b, a} = {a, b}⁻¹.

**Acceptance.**

- h_F{a, b} is the explicit (1, 1) cup of the two Tau Ceti Kummer classes in H²(F, μ_m^{⊗2}), with no primitive root chosen.
- h_F{a, 1 − a} = 0, imported from M.3.
- h_F{a, b} = 0 when b ∈ (F^×)^m, because κ(b) = 0 (ker_kummerMap).

**Prerequisites.**

- `MotivicEtaleKTheory:M.3`
- `MotivicEtaleKTheory:M.1`
- `K2SymbolsBrauer:T.2/matsumoto`
- `tauceti:TauCeti.kummerMap`
- `tauceti:TauCeti.ker_kummerMap`
- `tauceti:TauCeti.KummerCoeff`
- `tauceti:TauCeti.ContCohomology.explicitCup11`
- `tauceti:TauCeti.ContCohomology.explicitCup11_eq_neg_flip`

**Sources.**

- `Kbook.2013`: III.6.10.2 (PDF p. 250). The cup product of two Kummer classes into the twice-twisted module.
- `Kbook.2013`: III.6.10.3 (PDF p. 250). The symbol formula and its Steinberg property; the proof (factor t^m − a, projection formula) follows on pp. 250-251.

### The m-th power norm residue symbol of a local field

`K2SymbolsBrauer:T.7/classical-local-symbols` · definition · parent `K2SymbolsBrauer:T.7` · implementation unchecked

Let F be a nonarchimedean local field whose group of roots of unity is μ_m, with m invertible in F. The m-th power norm residue symbol ( , )_F : F^× × F^× → μ_m is defined as in K-book Example III.6.2.3: F^×/F^×m is finite, so the Kummer extension K generated by the m-th roots of all elements of F is finite abelian of exponent m; Kummer theory identifies Gal(K/F) with Hom(F^×, μ_m), g ↦ (a ↦ g(x)/x, x^m = a); local class field theory identifies F^×/N_{K/F}K^× with Gal(K/F); and (x, y)_F is the value at y of the homomorphism attached to x. It is bilinear and nondegenerate on F^×/F^×m, it satisfies (a, 1 − a)_F = 1, and it therefore defines a homomorphism K₂(F) → μ_m by Matsumoto's theorem. The construction uses only μ_m ⊆ F, and global-reciprocity uses it in that generality; the source's hypothesis μ(F) = μ_m is what the split surjectivity needs. The split surjectivity and Moore's structure theorem are KTheoryFiniteLocalFields L.3's, and the quadratic Hilbert symbol is the node hilbert-symbol-steinberg. ClassicalArithmeticCompletion CA.1 owns the m-th power Hilbert-symbol reciprocity law (RS-03); T.7 imports it in global-reciprocity for symbols defined by this local construction, and the request to CA.1 records the normalisation it must use.

**Hypotheses.**

- F is a nonarchimedean local field (complete for a discrete valuation with finite residue field), μ(F) = μ_m (μ_m ⊆ F suffices for the construction), and m is invertible in F.
- Local reciprocity is ClassFieldTheory Layer 6's localArtinEquiv in its normResidue form, with its arithmetic-Frobenius normalisation; the symbol inherits that normalisation, and the variable order is the source's, x ↦ (x, −)_F.

**Proof outline.**

1. F^×/F^×m is finite, by the power-class count of LocalFieldsRamification Layer 1.
2. Kummer theory: μ_m ⊆ F gives H¹(G_F, μ_m) = Hom(G_F, μ_m), and the Kummer isomorphism H¹(G_F, μ_m) ≅ F^×/F^×m (ProfiniteCohomology Layer 9; its surjectivity is Hilbert 90, which the pinned kummerMap lacks) dualises to Gal(K/F) ≅ Hom(F^×/F^×m, μ_m).
3. Local reciprocity: F^×/N_{K/F}K^× ≅ Gal(K/F) (ClassFieldTheory Layer 6); since Gal(K/F) has exponent m and both groups have order #(F^×/F^×m), N_{K/F}K^× = F^×m.
4. Define (x, y)_F and prove bilinearity and nondegeneracy from the two isomorphisms.
5. Steinberg identity: for E = F(x), x^m = a, the element 1 − a is a norm from E (it is the product of the norms of 1 − x_i over the irreducible factors of t^m − a, and F(x_i) = E because x_i/x ∈ μ_m ⊆ F); by functoriality of reciprocity under the norm (ClassFieldTheory Layer 4, artinMap_groundNorm) the Galois element attached to 1 − a fixes E, so (1 − a, a)_F = g(x)/x = 1, which is the Steinberg identity with a replaced by 1 − a.
6. Descend to K₂(F) → μ_m through Matsumoto's theorem (K2SymbolsBrauer:T.2/matsumoto).

**Acceptance.**

- (x, y)_F = 1 for all y if and only if x ∈ F^×m: the source's 'norm residue' property, read with (x, y)_F in place of the printed {x, y}.
- (a, 1 − a)_F = 1 for a ≠ 0, 1.
- For m = 2 the symbol is the Hilbert symbol of hilbert-symbol-steinberg.
- Split surjectivity onto μ_m and Moore's theorem are not claimed here: they are KTheoryFiniteLocalFields L.3's (which requires T.7).

**Prerequisites.**

- `K2SymbolsBrauer:T.2/matsumoto`
- `tauceti:TauCeti.kummerMap`
- `tauceti:TauCeti.KummerCoeff`
- `mathlib:rootsOfUnity`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.NormResidueSymbol.normResidueSymbol` | constructor | (x, y)_F ∈ μ_m for x, y ∈ F^×, F a nonarchimedean local field with μ_m ⊆ F and m invertible in F. |
| `TauCeti.NormResidueSymbol.normResidueSymbol_apply` | characterisation | (x, y)_F = σ_x(η)/η for any η in the separable closure with η^m = y, where σ_x is the image of x under local reciprocity. |
| `TauCeti.NormResidueSymbol.normResidueSymbol_mul_left` | relation | (x x', y)_F = (x, y)_F (x', y)_F. |
| `TauCeti.NormResidueSymbol.normResidueSymbol_mul_right` | relation | (x, y y')_F = (x, y)_F (x, y')_F. |
| `TauCeti.NormResidueSymbol.normResidueSymbol_pow_right` | simp | (x, y^m)_F = 1. |
| `TauCeti.NormResidueSymbol.forall_normResidueSymbol_eq_one_iff` | characterisation | (∀ y, (x, y)_F = 1) ↔ x ∈ (F^×)^m. |
| `TauCeti.NormResidueSymbol.normResidueSymbol_one_sub` | relation | (a, 1 − a)_F = 1 for a ≠ 0, 1. |
| `TauCeti.NormResidueSymbol.normResidueK2` | constructor | The homomorphism K₂(F) → μ_m, {x, y} ↦ (x, y)_F. |
| `TauCeti.NormResidueSymbol.normResidueSymbol_two` | compatibility | For m = 2, (a, b)_F = hilbertSymbol a b of QuadraticFormInvariants 6C. |

**Consumers.**

- KTheoryFiniteLocalFields L.3 — L.3 builds the map K₂(F) → μ(F) from these local symbols and proves the split surjection and Moore's structure theorem; L.3 requires T.7
- T.7, local-comparison — compared with the Kummer cup product followed by the local invariant, under a named primitive root
- T.7, global-reciprocity — the product over all places of these symbols is 1

**Unit tests.**

- `TauCeti.NormResidueSymbol.normResidueSymbol_pow` (degenerate) — (x, y^m)_F = 1 and (x, 1)_F = 1 for all x, y.
- `TauCeti.NormResidueSymbol.normResidueSymbol_Q2` (computation) — For F = ℚ₂ (μ(ℚ₂) = {±1}, m = 2), (−1, −1)_F = −1, the source's Example III.6.2.5.
- `TauCeti.NormResidueSymbol.normResidueSymbol_Q3` (characterisation) — For F = ℚ₃ (m = 2), (3, −1)_F = −1: ℚ₃(√−1) is the unramified quadratic extension, whose norms have even valuation, so 3 is not a norm from it and its reciprocity image moves √−1. The non-square 3 pairs non-trivially, as nondegeneracy requires.
- `TauCeti.NormResidueSymbol.normResidueSymbol_not_tame` (non-example) — For F = ℚ₂ and m = 2 the tame symbol of (−1, −1) is 1, both entries being units, but (−1, −1)_F = −1: when the residue characteristic divides m the norm residue symbol is not a character of the tame symbol.
- `TauCeti.NormResidueSymbol.normResidueSymbol_eq_tame_odd` (compatibility) — For F = ℚ_p, p odd, m = 2: (r, s)_F = ε(∂(r, s)) with ε : 𝔽_p^× → {±1} the surjection and ∂ the tame symbol of K2SymbolsBrauer:T.3/tame-symbol (K-book Ex. III.6.7; the inversion between the roadmap's and the source's tame symbol is invisible because ε takes values ±1).

**Sources.**

- `Kbook.2013`: III.6.2.3 (PDF p. 241). The Kummer half of the construction.
- `Kbook.2013`: III.6.2.3 (PDF p. 241). The definition of the pairing through local reciprocity, with its variable order.
- `Kbook.2013`: III.6.2.3 (PDF p. 241). The Steinberg identity and the norm argument.

### Trivialising a twist by a primitive root, and the change-of-root rule

`K2SymbolsBrauer:T.7/twisted-roots-of-unity` · construction · parent `K2SymbolsBrauer:T.7` · implementation unchecked

Let F be a field, m ≥ 1 invertible in F, and μ_m^{⊗j} (j ∈ ℤ) the finite Tate twists of MotivicEtaleKTheory M.1, built on Tau Ceti's KummerCoeff F m (j = 1) with the diagonal action on tensor powers, so that G_F acts on μ_m^{⊗j} through χ^j, χ the mod-m cyclotomic character. A primitive m-th root of unity ζ ∈ F determines the trivialisation τ_ζ^{(j)} : ℤ/m → μ_m^{⊗j}, 1 ↦ ζ^{⊗j} (through the dual for j < 0). It is an isomorphism of abelian groups, and it is G_F-equivariant — an isomorphism of discrete G_F-modules — because ζ ∈ F; without a primitive root in F, μ_m and ℤ/m need not be isomorphic G_F-modules. Change of root: if ζ' = ζ^u with u ∈ (ℤ/m)^×, then τ_{ζ'}^{(j)} = τ_ζ^{(j)} ∘ (u^j ·). So a statement that passes through τ_ζ names ζ, and a composite in which τ_ζ and τ_ζ⁻¹ each enter once is independent of ζ. The twists themselves are M.1's; this node owns the trivialisation and the rule, which the stage text assigns to T.7.

**Hypotheses.**

- F is a field, m ≥ 1 is invertible in F, and ζ ∈ F is a primitive m-th root of unity wherever τ_ζ is used.
- μ_m^{⊗j} carries the diagonal action, i.e. the action through χ^j; it is never identified with ℤ/m without naming ζ.

**Proof outline.**

1. Import μ_m^{⊗j} from MotivicEtaleKTheory:M.1, with its weight-one piece the pinned KummerCoeff F m; the action on μ_m is through Mathlib's modularCyclotomicCharacter.
2. Define τ_ζ^{(1)} from IsPrimitiveRoot.zmodEquivZPowers and IsPrimitiveRoot.zpowers_eq (the powers of ζ are all of μ_m), and τ_ζ^{(j)} by tensor powers and duality.
3. Equivariance: g(ζ) = ζ for every g ∈ G_F since ζ ∈ F, so G_F fixes ζ^{⊗j} and τ_ζ^{(j)} is equivariant.
4. Change of root: τ_{ζ^u}^{(1)}(1) = ζ^u = τ_ζ^{(1)}(u), so τ_{ζ^u}^{(1)} = τ_ζ^{(1)} ∘ (u ·), hence τ_{ζ^u}^{(j)} = τ_ζ^{(j)} ∘ (u^j ·), for negative j through the dual.
5. Record where the rule is applied: the natural isomorphism H²(F, μ_m^{⊗2}) ≅ mBr(F) ⊗ μ_m (K-book Example III.6.10.1) needs no root, while brauer-valued-symbol and local-comparison pass through τ_ζ^{(1)} once.

**Acceptance.**

- τ_ζ^{(0)} is the identity, for every ζ.
- A change of root by u changes the degree-two trivialisation by u², and the degree-one trivialisation by u.
- No statement identifies a twist with ℤ/m without naming ζ.

**Prerequisites.**

- `MotivicEtaleKTheory:M.1`
- `tauceti:TauCeti.KummerCoeff`
- `mathlib:ZMod`
- `mathlib:modularCyclotomicCharacter`
- `mathlib:IsPrimitiveRoot.zmodEquivZPowers`
- `mathlib:IsPrimitiveRoot.zpowers_eq`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.Twist.trivialisation` | constructor | For ζ ∈ F primitive of order m and j ∈ ℤ, τ_ζ^{(j)} : ZMod m ≃+ μ_m^{⊗j}, 1 ↦ ζ^{⊗j}. |
| `TauCeti.Twist.trivialisation_one` | simp | τ_ζ^{(j)} 1 = ζ^{⊗j}. |
| `TauCeti.Twist.trivialisation_zero` | simp | τ_ζ^{(0)} is the identity of ZMod m. |
| `TauCeti.Twist.trivialisation_equivariant` | characterisation | τ_ζ^{(j)} is G_F-equivariant, ζ being in F. |
| `TauCeti.Twist.trivialisation_pow` | relation | τ_{ζ^u}^{(j)} = τ_ζ^{(j)} ∘ (u^j ·) for u ∈ (ZMod m)ˣ. |
| `TauCeti.Twist.trivialisation_tensor` | compatibility | τ_ζ^{(i)} ⊗ τ_ζ^{(j)} = τ_ζ^{(i+j)} under ZMod m ⊗ ZMod m ≅ ZMod m and μ_m^{⊗i} ⊗ μ_m^{⊗j} ≅ μ_m^{⊗(i+j)}. |
| `TauCeti.Twist.trivialisation_one_eq` | compatibility | τ_ζ^{(1)} is IsPrimitiveRoot.zmodEquivZPowers followed by IsPrimitiveRoot.zpowers_eq, read in KummerCoeff F m. |

**Consumers.**

- T.7, brauer-valued-symbol — H²(F, μ_m^{⊗2}) is identified with H²(F, μ_m) through τ_ζ^{(1)} on one factor
- T.7, local-comparison — the comparison with the norm residue symbol is made under a named ζ and shown independent of it by this rule
- ClassFieldTheory Layer 5 — kummerCupPairing ζ is the pairing μ_m × μ_m → μ_m obtained from τ_ζ^{(1)}; the rule relates the pairings for different ζ

**Unit tests.**

- `TauCeti.Twist.trivialisation_zero_indep` (degenerate) — τ_ζ^{(0)} = id for every ζ; in particular it does not depend on ζ.
- `TauCeti.Twist.trivialisation_two` (computation) — For m = 2 the only primitive root is −1, so τ^{(j)} is canonical for every j, the case ClassFieldTheory Layer 5 uses at kummerCupPairing (−1).
- `TauCeti.Twist.trivialisation_pow_five` (characterisation) — For m = 5 and ζ' = ζ²: τ_{ζ'}^{(1)} = τ_ζ^{(1)} ∘ (2 ·) and τ_{ζ'}^{(2)} = τ_ζ^{(2)} ∘ (4 ·) = τ_ζ^{(2)} ∘ (−1 ·).
- `TauCeti.Twist.twist_Q_three` (non-example) — Over ℚ with m = 3, μ_3 is not isomorphic to ℤ/3 as a G_ℚ-module (H⁰(ℚ, μ_3) = 1 but H⁰(ℚ, ℤ/3) = ℤ/3), whereas μ_3^{⊗2} ≅ ℤ/3 because the mod-3 cyclotomic character takes values ±1 and its square is trivial: a twist defined with the action χ instead of χ^j fails this.

**Sources.**

- `Kbook.2013`: III.6.10 (PDF p. 250). The twisted module with the diagonal action and the reason a trivialisation needs a root of unity in F.
- `Kbook.2013`: III.6.10.4 (PDF p. 251). The trivialisation by a chosen root and the comparison with the cyclic-algebra symbol, cited to Tate [198] (On the torsion in K2 of fields, Kyoto 1976).

### The Hilbert symbol as a Steinberg symbol

`K2SymbolsBrauer:T.7/hilbert-symbol-steinberg` · construction · parent `K2SymbolsBrauer:T.7` · implementation unchecked

For unit arguments r, s ∈ F^× and a nonarchimedean local field F in which 2 is invertible, the source's Hilbert symbol c_F(r, s) ∈ {±1}, which is +1 exactly when rx² + sy² = 1 has a solution in F, equals the Hilbert symbol hilbertSymbol r s of QuadraticFormInvariants Layer 6C (+1 exactly when s = x² − ry² is solvable), which that layer defines and proves bimultiplicative and symmetric. It satisfies c_F(r, 1 − r) = 1 (x = y = 1), so by Matsumoto's theorem it defines a Steinberg symbol K₂(F) → {±1}. For F = ℝ and r, s ∈ ℝ^×, c_ℝ is the sign symbol. The total auxiliary conicSymbol allows all field elements, but its value at (0,0) is −1 and is not governed by the strict-negative Hilbert criterion. The definition makes sense over any field of characteristic different from 2 but is not bilinear there, and no Steinberg symbol is claimed.

**Hypotheses.**

- F is a nonarchimedean local field with 2 invertible; for the real comparison, F = ℝ. The Hilbert/Steinberg comparisons require unit inputs (equivalently nonzero field elements); the total conic helper is not a symbol on all field elements.

**Proof outline.**

1. Show c_F(r, s) = hilbertSymbol r s: both say that the ternary form rX² + sY² − Z², equivalently X² − rY² − sZ² up to the factor −1, is isotropic. A solution of rx² + sy² = 1 is an isotropic vector with Z = 1, and an isotropic vector with Z = 0 makes ⟨r, s⟩ hyperbolic, so that it represents 1; s = x² − ry² is the same statement for the second form.
2. Import bimultiplicativity and symmetry from QuadraticFormInvariants Layer 6C (its milestones 3 and 5), in place of the O'Meara citation of the source.
3. Steinberg identity: x = y = 1 solves rx² + (1 − r)y² = 1.
4. Descend to K₂(F) → {±1} through Matsumoto's theorem (K2SymbolsBrauer:T.2/matsumoto).
5. For F = ℝ and nonzero r, s, rx² + sy² = 1 is solvable unless r < 0 and s < 0, so c_ℝ is the sign symbol (K-book Example III.6.2.1), which is a Steinberg symbol because x and 1 − x are never both negative. The same map is constructed as K2SymbolsBrauer:T.5/real-sign-symbol, the lower bound for K₂(ℤ); it is not imported from there. Contrary to an earlier revision of this node, no stage cycle forbids importing it: with the edges proposed for RT-AREA-ktheory-1 both T.5 → T.7 and T.7 → T.5 are acyclic, so the choice of the owner of the real sign symbol is left to the maintainer; the test hilbertSymbol_real checks that the two maps agree.

**Acceptance.**

- c_{ℚ₂}(−1, −1) = −1.
- On ℝ^× × ℝ^×, c_ℝ is the sign symbol; the zero-input total helper is a separate non-example.
- Over ℚ the conic definition is not bilinear.

**Prerequisites.**

- `K2SymbolsBrauer:T.2/matsumoto`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.NormResidueSymbol.hilbertSymbol_eq_one_iff_conic` | characterisation | For r, s ∈ F^×, hilbertSymbol r s = 1 ↔ ∃ x y : F, r x² + s y² = 1. |
| `TauCeti.NormResidueSymbol.hilbertK2` | constructor | The Steinberg symbol K₂(F) → ℤˣ, {r, s} ↦ hilbertSymbol r s. |
| `TauCeti.NormResidueSymbol.hilbertK2_symbol` | simp | hilbertK2 {r, s} = hilbertSymbol r s. |
| `TauCeti.NormResidueSymbol.hilbertK2_real` | compatibility | For r, s ∈ ℝ^×, outside the nonarchimedean local-field hypotheses of hilbertK2, the conic symbol agrees with the real Steinberg sign: value −1 exactly when both unit entries are negative. |
| `TauCeti.NormResidueSymbol.hilbertK2_eq_normResidueK2` | compatibility | For m = 2 it equals normResidueK2. |

**Consumers.**

- KTheoryFiniteLocalFields L.3 — the Hilbert-symbol components of the map out of K₂ of a local field
- K-book Ex. III.6.8 — quadratic reciprocity over ℚ is the product formula for these symbols with the real and 2-adic ones

**Unit tests.**

- `TauCeti.NormResidueSymbol.hilbertSymbol_Q2` (computation) — c_{ℚ₂}(−1, −1) = −1, since x² + y² = −1 has no solution in ℚ₂ (K-book Example III.6.2.5).
- `TauCeti.NormResidueSymbol.hilbertSymbol_real` (compatibility) — For r, s ∈ ℝ^×, c_ℝ(r, s) = −1 exactly when (r : ℝ) < 0 and (s : ℝ) < 0: it is the sign symbol of K-book Example III.6.2.1, agreeing with T.5/real-sign-symbol. Zero inputs are excluded.
- `TauCeti.NormResidueSymbol.hilbertSymbol_eq_qfi` (compatibility) — c_F(r, s) = hilbertSymbol r s (QuadraticFormInvariants 6C) for every nonarchimedean local F with 2 invertible.
- `TauCeti.NormResidueSymbol.hilbertSymbol_degenerate` (degenerate) — c_F(1, s) = 1 (x = 1, y = 0) and c_F(r, 1 − r) = 1 (x = y = 1).
- `TauCeti.NormResidueSymbol.conicSymbol_Q_not_bilinear` (non-example) — Over ℚ, c_ℚ(3, −1) = c_ℚ(7, −1) = c_ℚ(21, −1) = −1: clearing denominators, 3a² = b² + c², 7a² = b² + c² and 21a² = b² + c² force b and c to be divisible by 3, 7 and 3 respectively (−1 is not a square modulo 3 or 7), and then a as well. So c_ℚ(21, −1) ≠ c_ℚ(3, −1) c_ℚ(7, −1), and the local-field hypothesis cannot be dropped.
- `TauCeti.NormResidueSymbol.conicSymbol_zero_not_hilbert` (non-example) — The total helper has conicSymbol ℝ 0 0 = −1, while ¬(0 < 0 ∧ 0 < 0). Thus its strict-negative comparison cannot be extended to arbitrary real inputs; the all-real no-solution criterion would use nonpositivity.

**Sources.**

- `Kbook.2013`: III.6.2.2 (PDF p. 241). The definition by the conic, verbatim ('1 2' is the printed 1/2); bilinearity is cited to O'Meara.
- `Kbook.2013`: III.6.2.2 (PDF p. 241). The general-field caveat and the real case.
- `Kbook.2013`: III.6.2.5 (PDF p. 242). The 2-adic worked example.

### The Brauer-valued symbol attached to a primitive root

`K2SymbolsBrauer:T.7/brauer-valued-symbol` · construction · parent `K2SymbolsBrauer:T.7` · implementation unchecked

For a field F with m invertible and a primitive m-th root of unity ζ ∈ F, the Brauer-valued symbol β_ζ : K₂(F)/m → mBr(F) is the Galois symbol h_F of symbol-formula followed by H²(F, μ_m^{⊗2}) = H²(F, μ_m ⊗ μ_m) → H²(F, μ_m), induced by id ⊗ (τ_ζ^{(1)})⁻¹, and by the injection H²(G_F, μ_m) → H²(G_F, (F^s)^×) = Br(F) with image the m-torsion (K-book Example III.6.10.1). Replacing ζ by ζ^u multiplies β_ζ by u⁻¹. The source identifies β_ζ, citing Tate [198], with the m-th power norm residue symbol {α, β} ↦ [A_ζ(α, β)] of cyclic algebras (Proposition III.6.9.2, Remark III.6.10.4); the cohomological symbol is the required exported carrier; the optional algebra presentation remains QFI7B’s comparison and is not used to prove the local sign. This is the 'Brauer-valued symbol' the roadmap document's T.7 contract exports after the change-of-root scalar. It is built in the cohomological Brauer group H²(G_F, (F^s)^×); exporting it as a class of central simple algebras (the algebraic Brauer group) uses QuadraticFormInvariants Layer 7B's crossed-product comparison of the two, and for m = 2 and ζ = −1 that layer's ι[(a, b)] = (a) ∪ (b) identifies β_{−1}{a, b} with the class of the quaternion algebra (a, b).

**Hypotheses.**

- F is a field, m ≥ 1 invertible in F, and ζ ∈ F a primitive m-th root of unity.

**Proof outline.**

1. Compose h_F (K2SymbolsBrauer:T.7/symbol-formula) with the coefficient map id ⊗ (τ_ζ^{(1)})⁻¹ : μ_m ⊗ μ_m → μ_m (K2SymbolsBrauer:T.7/twisted-roots-of-unity), which is equivariant, on H².
2. Compose with H²(G_F, μ_m) → Br(F), injective with image the m-torsion by the Kummer sequence and Hilbert 90 (ProfiniteCohomology Layer 9, h2KummerToUnits).
3. Change of root: (τ_{ζ^u}^{(1)})⁻¹ = u⁻¹ (τ_ζ^{(1)})⁻¹, so β_{ζ^u} = u⁻¹ β_ζ.
4. Record the cyclic-algebra comparison of Remark III.6.10.4 as cited (Tate [198]); it is not needed by any node here.

**Acceptance.**

- β_ζ{a, 1 − a} = 0 and β_ζ{a, b} = 0 when b ∈ (F^×)^m, inherited from h_F.
- β_{ζ^u} = u⁻¹ β_ζ.
- For m = 2 and ζ = −1, β_{−1}{a, b} is the class of the quaternion algebra (a, b) under QuadraticFormInvariants' comparison; in particular β_{−1}{a, 1 − a} = 0 matches Tau Ceti's splitting of (a, 1 − a) (TauCeti.QuaternionAlgebra.steinbergEquivMatrix).

**Prerequisites.**

- `K2SymbolsBrauer:T.7/symbol-formula`
- `K2SymbolsBrauer:T.7/twisted-roots-of-unity`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `TauCeti.NormResidueSymbol.brauerSymbol` | constructor | For ζ ∈ F primitive of order m, β_ζ : K₂(F) →* Multiplicative (Br F), Br F written additively, with values of order dividing m. |
| `TauCeti.NormResidueSymbol.brauerSymbol_symbol` | simp | β_ζ {a, b} = the image of (id ⊗ τ_ζ⁻¹)_*(κ a ∪ κ b) in Br(F). |
| `TauCeti.NormResidueSymbol.brauerSymbol_pow_root` | relation | β_{ζ^u} = u⁻¹ • β_ζ for u ∈ (ZMod m)ˣ. |
| `TauCeti.NormResidueSymbol.nsmul_brauerSymbol` | simp | m • β_ζ x = 0. |
| `TauCeti.NormResidueSymbol.brauerSymbol_algebraic` | compatibility | Under QuadraticFormInvariants 7B's isomorphism between BrauerGroup F and H²(G_F, (F^s)^×), β_ζ lands in the m-torsion of BrauerGroup F; for m = 2 and ζ = −1, β_{−1}{a, b} is the quaternion class (a, b). |

**Consumers.**

- T.7, local-comparison — the local invariant of β_ζ is compared with the norm residue symbol
- T.7, global-reciprocity — the sum of the local invariants of the global β_ζ is zero
- QuadraticFormInvariants Layer 7B — the comparison of the algebraic Brauer group with H² exports β_ζ as a class of central simple algebras, and identifies β_{−1}{a, b} with the quaternion class

**Unit tests.**

- `TauCeti.NormResidueSymbol.brauerSymbol_steinberg` (degenerate) — β_ζ{a, 1 − a} = 0 and β_ζ{a, c^m} = 0.
- `TauCeti.NormResidueSymbol.brauerSymbol_pow_root_five` (characterisation) — For m = 5, β_{ζ²} = 3 • β_ζ, since 2⁻¹ = 3 in ZMod 5.
- `TauCeti.NormResidueSymbol.brauerSymbol_real` (computation) — For F = ℝ, m = 2, ζ = −1: β{−1, −1} is the non-trivial element of Br(ℝ) ≅ ℤ/2, because κ(−1) generates H¹(ℤ/2, 𝔽₂) and its square generates H²(ℤ/2, 𝔽₂) (the cohomology ring is 𝔽₂[t]); and β{a, b} = 0 unless a < 0 and b < 0, positive reals being squares. Under the cited identification this is the class of the Hamilton quaternions, the cyclic algebra A_{−1}(−1, −1) of K-book Example III.6.9.
- `TauCeti.NormResidueSymbol.brauerSymbol_depends_on_root` (non-example) — For m = 3 and F = ℚ(μ_3), β_{ζ²} = −β_ζ, so a definition that does not name ζ cannot be well defined unless it is 0.

**Sources.**

- `Kbook.2013`: III.6.10.1 (PDF p. 250). The Kummer sequences identifying H2(F, µm) with the m-torsion of the Brauer group.
- `Kbook.2013`: III.6.10.4 (PDF p. 251). The trivialisation by a chosen root and the comparison with the cyclic-algebra symbol, cited to Tate [198] (On the torsion in K2 of fields, Kyoto 1976).
- `Kbook.2013`: III.6.9.2 (PDF p. 249). The Brauer-valued symbol in its cyclic-algebra form.

### The norm residue symbol against the local invariant of the Kummer cup product

`K2SymbolsBrauer:T.7/local-comparison` · comparison · parent `K2SymbolsBrauer:T.7` · implementation unchecked

For arithmetic-Frobenius local reciprocity and invariant, the source variable order NRS(a,b)=Artin(a)(b^(1/m))/b^(1/m) gives NRS(a,b)=ζ^(−e_m(inv_F(β_ζ{a,b}))). Equivalently it is the inverse of the cup-invariant localSymbol(a,b). Here e_m:(Q/Z)[m]≃Z/m takes r/m to r mod m; multiplication by m in Q/Z is not this coordinate. The right side is independent of the primitive root ζ. For m=2 the inverse is invisible and the upstream Hilbert/quaternion comparison is recovered.

**Hypotheses.**

- F is nonarchimedean local, m invertible in F, μ_m⊂F, ζ primitive.
- Import the normalized finite-character evaluation identity inv(χ∪κ(b))=χ(Artin(b))/m from the CFT5/6 supplier. MilneIII.3.6 cites its proof to Serre; that source proof has not been read by this worker. The exact supplier obligation is recorded in requests/upstreamNotes.

**Proof outline.**

1. Trivialize κ(a) as a finite character χ_a by ζ; β_ζ{a,b} is the image of χ_a∪κ(b) under the coefficient inclusion.
2. The imported character-evaluation identity gives ζ^e(inv β)=Artin(b)(a^(1/m))/a^(1/m). This is Milne’s Hilbert symbol, with the reciprocity variable second.
3. The packet’s norm-residue symbol has the reciprocity variable first. Graded skew commutativity of the two Kummer cups therefore gives the inverse, fixing ε=−1.
4. Changing ζ to ζ^u rescales β by u⁻¹ and its exponent by u⁻¹; raising ζ^u to this exponent cancels the change.
5. In F7((t)) with m=3 and ζ=2, arithmetic Frobenius acts on a cube root of3 by factor3²=2. Hence NRS(t,3)=2, NRS(3,t)=4 and e3(inv β{3,t})=1. This detects the inverse that the m=2 test cannot detect.

**Acceptance.**

- The comparison names ζ, and its right side is proved independent of ζ.
- At m = 2 it reduces to the two upstream quadratic comparisons.
- The sign ε is fixed, not left implicit.
- The F7((t)),m=3,(3,t) test yields4 whereas the cup-invariant symbol yields2.
- Both maps are1 at m=1.

**Prerequisites.**

- `K2SymbolsBrauer:T.7/classical-local-symbols`
- `K2SymbolsBrauer:T.7/brauer-valued-symbol`
- `K2SymbolsBrauer:T.7/twisted-roots-of-unity`

**Sources.**

- `Kbook.2013`: III.6.10.4 (PDF p. 251). The trivialisation by a chosen root and the comparison with the cyclic-algebra symbol, cited to Tate [198] (On the torsion in K2 of fields, Kyoto 1976).
- `Milne.CFT.4.03`: III.3.6 (quoted identity),III.4 Steps2–4 andRemark4.5, pp109,112–114. Read the definition and variable-order formula. The character-evaluation proof is quoted to Serre and imported as an explicit supplier obligation, not falsely claimed read.

### Global reciprocity for symbols in K₂ of a number field: an adapter over the imported laws

`K2SymbolsBrauer:T.7/global-reciprocity` · theorem · parent `K2SymbolsBrauer:T.7` · implementation unchecked

Let F be a number field containing μ_m, ζ ∈ F a primitive m-th root of unity and x ∈ K₂(F). For each place v let (x)_v ∈ μ_m(F) be the image of x under the local symbol of F_v: at a finite place the norm residue symbol of classical-local-symbols (which needs only μ_m ⊆ F_v), at a real place the constant 1 symbol if m = 1 and the sign symbol if m = 2 (there are no real places if m > 2), at a complex place 1; each μ_m(F) → μ_m(F_v) is an isomorphism. Then (a) (x)_v = 1 for all but finitely many v and ∏_v (x)_v = 1: on a symbol x = {a, b} this is the m-th power Hilbert reciprocity law ∏_v (a, b)_v = 1, imported from ClassicalArithmeticCompletion CA.1 (its 'source-scoped higher reciprocity through class field theory'), and for m = 2 from ClassFieldTheory Layer 14's hilbertProductFormula through QuadraticFormInvariants 6E's sign dictionary; (b) Σ_v inv_v(res_v β_ζ(x)) = 0, ClassFieldTheory Layer 10's sumLocalInv_eq_zero applied to the Brauer class β_ζ(x) of brauer-valued-symbol, with the real-place invariants of Layer 10; (c) under local-comparison, (a) and (b) are the same statement, with ζ and the sign ε explicit. T.7 proves (c) and the passage from symbols to K₂(F) (Matsumoto); it does not prove the reciprocity laws themselves. For F = ℚ and m = 2, (a) is quadratic reciprocity in the form of K-book Ex. III.6.8.

**Hypotheses.**

- F is a number field with μ_m ⊆ F, ζ ∈ F a primitive m-th root of unity, and x ∈ K₂(F).
- The local symbols carry the normalisation of classical-local-symbols (arithmetic Frobenius, variable order x ↦ (x, −)_v); CA.1's law is used in that normalisation or converted to it.
- m ≥ 1; the real local factor is 1 for m = 1 and the quadratic sign for m = 2. A real embedding cannot contain a primitive m-th root when m > 2.

**Proof outline.**

1. The local symbols define a homomorphism K₂(F) → ⊕_v μ_m(F): each is a Steinberg symbol (classical-local-symbols; the constant 1 symbol for m = 1, the sign symbol for m = 2 at the real places), and (a, b)_v = 1 at every finite v not dividing m at which a and b are units, because the Kummer extension of F_v generated by an m-th root of a unit is unramified and units are norms from unramified extensions (ClassFieldTheory Layer 6); only finitely many v divide m or have v(a) ≠ 0 or v(b) ≠ 0 (mathlib:IsDedekindDomain.HeightOneSpectrum.Support.finite). Symbols generate K₂(F) (K2SymbolsBrauer:T.2/matsumoto).
2. (a): import the m-th power Hilbert reciprocity law ∏_v (a, b)_v = 1 from ClassicalArithmeticCompletion:CA.1, read in the normalisation of classical-local-symbols (if CA.1 fixes the opposite variable order, every local factor is inverted and the product formula is unchanged); for m = 2 it is ClassFieldTheory Layer 14's hilbertProductFormula, translated into signs by QuadraticFormInvariants 6E; extend from symbols to K₂(F) by multiplicativity.
3. (b): β_ζ(x) ∈ Br(F) (brauer-valued-symbol), its restrictions to the completions are the local Brauer-valued symbols because restriction commutes with Kummer classes and the cup product (ProfiniteCohomology Layers 6 and 8), and ClassFieldTheory Layer 10's sumLocalInv_eq_zero gives Σ_v inv_v = 0.
4. For m = 1, μ_1 is trivial, β_1 = 0 and every factor (including the real factors) is 1, independently of the unresolved local-comparison sign. For m = 2, the real quadratic sign agrees with Layer 10's archimedean invariant; for m > 2 a primitive m-th root cannot embed in ℝ, so there are no real places. At finite places use local-comparison, reading the invariant through the coordinate map (ℚ/ℤ)[m] ≅ ZMod m, [a/m] ↦ a (not multiplication by m inside ℚ/ℤ), and the named ζ and sign ε. The resulting product/sum compatibility still rests on the recorded local-comparison source gap.
5. Check m = 2 and F = ℚ against Ex. III.6.8.

**Acceptance.**

- (x)_v = 1 for almost all v, and ∏_v (x)_v = 1.
- For m = 2 and F = ℚ: (r, s)_∞ (r, s)_2 ∏_{p odd} (r, s)_p = +1 (K-book Ex. III.6.8), which is ClassFieldTheory Layer 14's quadratic reciprocity.
- No reciprocity law is proved here: the m-th power law is CA.1's, the quadratic law is ClassFieldTheory Layer 14's, and the vanishing of the sum of invariants is Layer 10's; T.7 contributes the statement on K₂(F) and the compatibility (c).
- m = 1, F = ℚ, x = {−1, −1}: every factor is 1, including the real place. An unconditional quadratic real factor would incorrectly make the product −1.
- m = 2, F = ℚ, x = {−1,−1}: the real factor and the dyadic factor are each −1 and cancel; each odd-prime factor is 1. This is not the m = 1 law.

**Prerequisites.**

- `K2SymbolsBrauer:T.7/local-comparison`
- `K2SymbolsBrauer:T.7/brauer-valued-symbol`
- `K2SymbolsBrauer:T.7/classical-local-symbols`
- `K2SymbolsBrauer:T.2/matsumoto`
- `ClassicalArithmeticCompletion:CA.1`
- `mathlib:IsDedekindDomain.HeightOneSpectrum.Support.finite`
- `mathlib:rootsOfUnity_one`

**Unit tests.**

- `TauCeti.NormResidueSymbol.global_reciprocity_one` (degenerate) — For m = 1, every finite-place family c valued in rootsOfUnity 1 F is identically 1 and has empty multiplicative support; the conditional real product is also 1. Instantiate the whole corrected law at F = ℚ, a = b = −1.
- `TauCeti.NormResidueSymbol.global_reciprocity_two_real_dyadic` (computation) — For F = ℚ, m = 2 and {−1,−1}, conicSymbol ℝ (−1) (−1) = −1, conicSymbol ℚ_2 (−1) (−1) = −1, and their product is 1; at odd p both entries are units and the quadratic factor is 1.

**Sources.**

- `Kbook.2013`: Ex. III.6.8 (PDF p. 252). The only reciprocity law the source states: the quadratic case over Q, as an exercise.

### Compatibility of the imported Galois symbol with the imported degree-two Chern class

`K2SymbolsBrauer:T.7/chern-class-agreement` · comparison · parent `K2SymbolsBrauer:T.7` · implementation unchecked

For the Grothendieck–Soulé normalization, the imported degree-two étale Chern class is c_(2,2)=−h_F on K2(F)/m. The sign is fixed by chern-product-sign, whose source explicitly gives the negative cup. The general classes are M.8’s, the Galois symbol and Tate local/global/S-integer theorems M.3’s; T7 only proves this comparison.

**Hypotheses.**

- F is a field and m is invertible in F.
- c_{2,2} is the étale Chern class exported by MotivicEtaleKTheory M.3 on Quillen K₂; the comparison with Steinberg K₂ is K2SymbolsBrauer:T.1/k2-pi2, which is why the stage requires T.1:plus.

**Proof outline.**

1. Apply chern-product-sign.
2. Transport along T1/k2-pi2 and use Matsumoto generation.
3. Use coefficient CRT naturality for arbitrary invertible m. No scheme/function-field cohomology identification is used.

**Acceptance.**

- c_{2,2} = −h_F on K₂(F)/m, in the stated Grothendieck–Soulé normalization.
- In degree one the Chern class is the pinned Kummer map.
- The ring statement is attributed to M.3 through the étale localisation sequence, not through the blanket assertion the stage text forbids.

**Prerequisites.**

- `K2SymbolsBrauer:T.7/symbol-formula`
- `MotivicEtaleKTheory:M.3`
- `K2SymbolsBrauer:T.1/k2-pi2`
- `K2SymbolsBrauer:T.2/matsumoto`
- `tauceti:TauCeti.kummerMap`
- `K2SymbolsBrauer:T.7/chern-product-sign`

**Sources.**

- `Kbook.2013`: V.11.10 (PDF p. 464). Grothendieck's étale Chern classes on K-theory with finite coefficients.
- `Kbook.2013`: V.11.10 (PDF p. 464). The degree-one Chern class is the Kummer map.
- `Kbook.2013`: V.11.9 (PDF p. 464). The product rule on symbols for Gillet's Zariski classes, the model for the sign of the étale c2,2 on symbols.

### The S-unit symbol filtration inside field K-two

`K2SymbolsBrauer:T.5/S-unit-symbol-filtration` · construction · parent `K2SymbolsBrauer:T.5` · implementation unchecked

For a number field F with principal integer ring, order finite primes by nondecreasing residue norm, breaking ties arbitrarily. Let U_S be the S-unit group and K₂^S(F)⊂K₂(F) the subgroup generated by {u,v}, u,v∈U_S. If S′=S∪{v} and π generates v, K₂^{S′}/K₂^S is generated by {u,π} for u∈U_S; the tame residue sends this class to ū∈k(v)×. Every field symbol belongs to some finite filtration stage.

**Hypotheses.**

- Use Matsumoto/Milnor K₂ and its T.2 comparison with classical field K₂. The ring of integers is a PID, so U_{S′}=U_S×π^ℤ. The residue convention is uniformizer-last.

**Proof outline.**

1. Define the subgroup using the bilinear Steinberg symbols. PID factorization shows a nonzero field element is a unit times a finite product of prime generators, hence every pair has finite support.
2. Expand a symbol with the decomposition U_{S′}=U_S×π^ℤ. Anticommutativity changes {π,u} to−{u,π}, and {π,π}={−1,π}. The remaining symbol of two old units lies in K₂^S, proving the displayed generators.
3. At v all old units have valuation0. The formula ∂_v{u,π}=ū and ∂_v{u,w}=1 defines the quotient map. Symbols of S-units are unramified outside S.

**Acceptance.**

- K₂^S is a subgroup of field K₂ defined by symbols. It is not identified with ring K₂(O_S) without the separate localization comparison.

**Prerequisites.**

- `K2SymbolsBrauer:T.2/steinberg-symbol`
- `K2SymbolsBrauer:T.5/unramified-subgroup`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `SUnitK2` | constructor | Subgroup of field K₂ generated by pairs of S-units. |
| `SUnitK2.mono` | functoriality | S⊂S′ gives an inclusion. |
| `SUnitK2.residueStep` | projection | The quotient map to k(v)× with {u,π}↦ū. |
| `SUnitK2.finiteSupport` | characterisation | Every symbol has a finite S support. |

**Consumers.**

- T.5 integer generation and N.8 Gaussian certificate — The actual residue-step quotient provides upper generation; it is separate from any Birch–Tate order formula.

**Unit tests.**

- `integer_initial` (computation) — For F=ℚ and S=∅, U_S={±1}, so the subgroup is generated by {−1,−1}.
- `gaussian_dyadic` (computation) — For F=ℚ(i), S={(1−i)}, U_S=⟨i,1−i⟩ and bilinearity leaves three unordered symbol pairs.
- `uninverted_prime` (non-example) — π∉U_S when v∉S, so {u,π} is a new-step generator rather than an old S-unit symbol by definition.

**Sources.**

- `BassTate.MilnorRing.1973`: ChapterII §3, own pp.56–59/PDF413–416. The filtration definition and the surjectivity of the symbol generator map are read from the main proof.

### Tate’s unit-kernel criterion for a residue step

`K2SymbolsBrauer:T.5/tate-unit-residue-criterion` · lemma · parent `K2SymbolsBrauer:T.5` · implementation unchecked

Let U₁⊂U_S be generated by (1+πU_S)∩U_S. Suppose finite sets W,C,G⊂U_S satisfy: W generates U_S and W⊂CU₁; CG⊂CU₁ and Ḡ generates k(v)×; and1∈C with C∩ker(U_S→k(v)×)⊂U₁. Then U₁ is the reduction kernel and ∂_v:K₂^{S′}/K₂^S→k(v)× is an isomorphism.

**Hypotheses.**

- PID and principal v as in S-unit-symbol-filtration. Set products denote ordinary unit multiplication.

**Proof outline.**

1. Surjectivity follows from Ḡ. From CG⊂CU₁ obtain CG^n⊂CU₁ for all n≥0. For each c∈C express c̄⁻¹ as a product of elements of Ḡ; a corresponding c′∈C with c times that product∈c′U₁ has residue1, so c′∈U₁. This makes CU₁ closed under multiplication/inverses.
2. The set CU₁ contains W, hence equals U_S. The condition on residue1 representatives now identifies ker reduction with U₁.
3. The onto map α:U_S→K₂^{S′}/K₂^S sends u to{u,π}. A generator x=1+πu of U₁ satisfies0={x,1−x}={x,−u}+{x,π}; its first term is an old-unit symbol. Thus U₁⊂kerα. The quotient U_S/U₁≅k(v)× factors α and its tame residue is identity, proving the isomorphism.

**Acceptance.**

- The criterion proves injectivity as well as surjectivity; a list of residue representatives alone is insufficient.

**Prerequisites.**

- `K2SymbolsBrauer:T.5/S-unit-symbol-filtration`

**Sources.**

- `BassTate.MilnorRing.1973`: Appendix Proposition1, A2–A3/PDF440–441; main Lemma3.2 own pp.58–59/PDF415–416. Read full group argument. Its degree-two Steinberg consequence is written explicitly here.

### Congruent units with a small norm difference

`K2SymbolsBrauer:T.5/small-norm-congruent-units` · lemma · parent `K2SymbolsBrauer:T.5` · implementation unchecked

If a,b∈O_F∩U_S have the same nonzero residue at v and0<|N(a−b)|<(Nv)², while S contains all primes of norm<Nv, then a/b∈U₁. If a=b the same conclusion is immediate.

**Hypotheses.**

- The integer ring is a PID. Norms of principal ideals equal absolute field norms.

**Proof outline.**

1. Write (a−b)=v·𝔞. The norm of𝔞 is |N(a−b)|/Nv<Nv, so every prime factor of𝔞 belongs toS.
2. PID factorization gives a−b=πu with u∈U_S. Therefore a/b=1+π(u/b) belongs to the generating set of U₁. Separate a=b before forming its nonzero ideal.

**Acceptance.**

- Both norm inequalities are strict; primes of norm exactly Nv cannot be admitted as factors of𝔞 by this argument.

**Prerequisites.**

- `K2SymbolsBrauer:T.5/tate-unit-residue-criterion`

**Sources.**

- `BassTate.MilnorRing.1973`: Main proof Claim2, own pp.63–64/PDF420–421; Appendix Lemma1 A3/PDF441. Read Claim2 and its ideal-norm proof; this is its n=2 unit form, with the zero-difference case explicit.

### Every odd-prime residue step over the rationals is an isomorphism

`K2SymbolsBrauer:T.5/integer-prime-residue-steps` · lemma · parent `K2SymbolsBrauer:T.5` · implementation unchecked

For F=ℚ and every prime p≥3, with S all primes<p, ∂_p:K₂^{S∪{p}}(ℚ)/K₂^S(ℚ)→𝔽_p× is an isomorphism. The same remains true if some primes of equal norm have been ordered earlier, vacuously forℚ.

**Hypotheses.**

- The norm on ℚ is the ordinary absolute value and the integer ring is a PID.

**Proof outline.**

1. Take W={−1}∪{primes<p}, C={a∈ℤ:0<|a|≤(p−1)/2}, and G=C. All these integers are S-units and C represents every nonzero residue. W generates U_S.
2. For w∈W choose c∈C with the same residue. If w≠c, |w−c|≤(p−1)+(p−1)/2<p², so small-norm-congruent-units gives w/c∈U₁.
3. For c,g∈C choose c′∈C with the residue of cg. The bound |cg−c′|≤(p−1)²/4+(p−1)/2=(p²−1)/4<p² gives cg/c′∈U₁, treating equality separately. The only member of C with residue1 is1. Apply the Tate criterion.

**Acceptance.**

- This is a worker derivation from the general criterion, with explicit balanced residue representatives; it does not invoke Birch–Tate or a Euclidean unit-generation theorem for arbitrary rings.

**Prerequisites.**

- `K2SymbolsBrauer:T.5/tate-unit-residue-criterion`
- `K2SymbolsBrauer:T.5/small-norm-congruent-units`

**Sources.**

- `BassTate.MilnorRing.1973`: Appendix Proposition1 A2–A3/PDF440–441 and main Claim2 pp.63–64/PDF420–421. The general source criterion is applied to the displayed rational-field sets; the inequalities are the worker’s elementary specialization.

### The rational tame kernel is generated by the negative-unit symbol

`K2SymbolsBrauer:T.5/integer-tame-kernel-upper-generation` · lemma · parent `K2SymbolsBrauer:T.5` · implementation unchecked

The kernel of all finite tame residues in K₂(ℚ) is generated by {−1,−1} and has order at most2.

**Hypotheses.**

- Use the S-unit symbol filtration and the odd-prime residue-step isomorphisms.

**Proof outline.**

1. An element in the tame kernel lies in a finite S-unit stage. If its largest supported prime p is≥3, the residue-step isomorphism and zero tame residue show that it lies in the preceding stage. Repeat finitely, leaving S⊂{2}.
2. U_{ {2} }=⟨−1,2⟩. Bilinearity, anticommutativity and {2,2}={−1,2} reduce its symbol subgroup to{−1,−1} and{−1,2}. The Steinberg relation for−1 and1−(−1)=2 kills the latter.
3. Finally2{−1,−1}={1,−1}=0. Identify this unramified subgroup with K₂(ℤ) by the separate T.5 tame-kernel localization sequence. The real-sign test supplies the independent lower bound.

**Acceptance.**

- Only a largest prime in finite symbol support is stripped; an infinite descending argument is not used.

**Prerequisites.**

- `K2SymbolsBrauer:T.5/integer-prime-residue-steps`
- `K2SymbolsBrauer:T.5/S-unit-symbol-filtration`
- `K2SymbolsBrauer:T.5/tame-kernel-sequence`

**Sources.**

- `BassTate.MilnorRing.1973`: Appendix criterion A2–A3/PDF440–441, applied with the rational-field residue sets above. New proof of the upper generation from the read Tate criterion. Milnor’s §10 proof remains a separate uninspected historical route.

### An exact lattice certificate for a unit residue kernel

`K2SymbolsBrauer:T.5/unit-kernel-lattice-certificate` · construction · parent `K2SymbolsBrauer:T.5` · implementation unchecked

Let U be presented by generators w₀,…,wᵣ with only w₀²=1, so U≅ℤ^(r+1)/⟨2e₀⟩, and suppose reduction U→k× is onto. A finite list of vectors v_j, each witnessed by a/b=1+πu with a,b,u∈U, certifies ker reduction=U₁ if the gcd of some nonzero maximal minors of the matrix [2e₀,v_j] is |k×|. Each vector is an integer exponent vector, including its w₀ exponent before reduction modulo2.

**Hypotheses.**

- The actual S-unit generators and absence of further relations have been proved. π has valuation1 at the new prime and0 at uninverted primes. Every displayed vector has residue1.

**Proof outline.**

1. Let L be generated by2e0 and the exact unit-kernel witness vectors. Apply relation-minor-index-divisibility: the quotient order divides the selected-minor gcd. Reduction is onto and factors through this quotient, so |k×| divides its order. If the selected gcd is |k×|, equality follows. This uses the pinned determinant/index theorem; the full gcd-of-all-minors theorem is unnecessary.
2. The image of L in U lies in U₁⊂ker reduction by its exact witnesses. Equality of indices makes all three subgroups equal. Use the Steinberg argument of tate-unit-residue-criterion to identify the symbol residue-step quotient with k×. No completeness assertion about the full field-symbol relation lattice is needed.

**Acceptance.**

- Check exact integer determinants and exact algebraic identities, not numerical rank. It suffices to record a set of minors with gcd |k×|; no claim that these are all minors is needed.

**Prerequisites.**

- `K2SymbolsBrauer:T.5/tate-unit-residue-criterion`
- `K2SymbolsBrauer:T.5/S-unit-symbol-filtration`
- `K2SymbolsBrauer:T.5/relation-minor-index-divisibility`

**Planning API.**

| Name | Role | Contract |
| --- | --- | --- |
| `UnitKernelCertificate` | constructor | Actual unit-generator presentation, surjective residue map, finite witness vectors and maximal-minor determinants. |
| `UnitKernelCertificate.witness` | data | For each v, give a,b,u with a/b=1+πu and exponent vectorv. |
| `UnitKernelCertificate.kernel` | characterisation | The checked lattice equals the reduction kernel. |
| `UnitKernelCertificate.residueStep` | equivalence | The induced field-symbol quotient is k×. |

**Consumers.**

- N.8 independent quadratic order certificate — Supplies a checkable upper-generation argument before the independent real-sign lower bound is compared.

**Unit tests.**

- `inert_two_q5` (computation) — For Qsqrt5 at2, the certified lattice has index3, equal to|F4×|.
- `missing_sign_relation` (non-example) — Forcing2e₀ into every selected minor can yield gcd6 rather than3; all relevant maximal minors must be allowed.
- `rank_only` (non-example) — Full rank with determinant6 does not certify a residue kernel of index3.

**Sources.**

- `BassTate.MilnorRing.1973`: Appendix Proposition1 A2–A3/PDF440–441, combined with elementary integer-lattice index theory. Worker certificate reformulation of the read unit-kernel/Steinberg criterion.

### Valuation and unit reduction of a finite complete-field norm

`K2SymbolsBrauer:T.3/complete-field-degree-one-norm` · lemma · parent `K2SymbolsBrauer:T.3` · implementation unchecked

Proposed parent: `K2SymbolsBrauer:T.4`; maintainer integration is pending.

For a finite extension E/F of complete discretely valued fields, with ramification index e and residue degree f, v_F(N_(E/F)y)=f v_E(y), and for a unit u, reduction of N_(E/F)u equals N_(kE/kF)(ū)^e. Residue extensions may be inseparable.

**Hypotheses.**

- The integral closure B of the complete DVR A is finite and is the unique complete DVR extending it. Normalized integer valuations are used.

**Proof outline.**

1. B is a finite torsion-free A-module, hence free. For an integral nonzero y, multiplication by y has determinant the field norm. Smith normal form over the DVR gives v(det y)=length_A(B/yB).
2. The B-module B/yB has v_E(y) simple kE factors, each of A-length f. This proves the valuation equality. Clear a denominator to cover all y≠0.
3. Reduce multiplication by u on B/π_F B. Its filtration by the powers of π_E has e subquotients kE. The determinant on each kF-vector subquotient is the residue field norm of ū. Determinants of filtered linear maps multiply, giving N(ū)^e; this also covers inseparable kE/kF.

**Acceptance.**

- Compare the actual maps, including their multiplicities and the chosen uniformizer-last residue convention.

**Prerequisites.**

- `mathlib:Algebra.norm`
- `K2SymbolsBrauer:T.3/tame-symbol`

**Sources.**

- `GilleSzamuely.CSAGC.2006`: Lemma7.3.10 full four-case proof pp200–201 andAppendixA.6.8(2)p313;the determinant/length argument here fills its degree-one computation. Read the indicated source proof. Additional elementary matrix/tower details are a worker derivation and are identified as such; no unread proof is claimed read.

### The norm-residue identity for every finite complete-field extension

`K2SymbolsBrauer:T.3/finite-complete-norm-residue` · lemma · parent `K2SymbolsBrauer:T.3` · implementation unchecked

Proposed parent: `K2SymbolsBrauer:T.4`; maintainer integration is pending.

For every finite E/F of complete discretely valued fields and n≥1, ∂_F N_(E/F)=N_(kE/kF) ∂_E on Milnor K_n. There is no ramification factor in this norm formula.

**Hypotheses.**

- Residue and norm conventions are those of T4. The valuation extends uniquely at each finite complete-field level.

**Proof outline.**

1. Split E/F into separable followed by purely inseparable. The latter is a finite tower of radical degree-characteristic extensions; apply the already proved normal prime case at each step and compose residue norms.
2. For the separable part fix any prime p. Pass to a maximal prime-to-p extension; its finite tensor factors have p-power degree and admit towers of normal degreep extensions by the p-closed field lemma. The preceding prime case and norm transitivity give the identity there.
3. All symbols and tower data descend to a finite level. The base-change formula and restriction–transfer degree show the discrepancy is annihilated by an integer prime to p. Since this holds for every p, the discrepancy is zero: its order has no possible prime divisor.
4. The same sign(−1)^(n−1) changes both source and target residues from first to last, so the commuting square is unchanged.

**Acceptance.**

- Compare the actual maps, including their multiplicities and the chosen uniformizer-last residue convention.

**Prerequisites.**

- `K2SymbolsBrauer:T.4/kato-complete-residue`
- `K2SymbolsBrauer:T.4/finite-artin-norm-base-change`
- `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`
- `K2SymbolsBrauer:T.4/prime-to-p-closure`

**Sources.**

- `GilleSzamuely.CSAGC.2006`: Proposition7.4.1 full proof p204/PDF218. Read the indicated source proof. Additional elementary matrix/tower details are a worker derivation and are identified as such; no unread proof is claimed read.

### Split a finite normalization after DVR completion

`K2SymbolsBrauer:T.3/finite-normalization-completion-splitting` · lemma · parent `K2SymbolsBrauer:T.3` · implementation unchecked

Proposed parent: `K2SymbolsBrauer:T.4`; maintainer integration is pending.

If the integral closure B of a DVR A in a finite E/F is finite over A, then E⊗F F̂_v≅∏_(w|v)Ê_w as F̂_v-algebras. Its factors are reduced fields even when E/F is inseparable under this finiteness hypothesis.

**Hypotheses.**

- Use the actual completions of B at its finitely many maximal ideals, not an assumed separable-only tensor decomposition.

**Proof outline.**

1. B is semilocal Dedekind and π_A B=∏m_w^e_w. Pairwise comaximality gives B/π_A^nB≅∏B/m_w^(ne_w) by CRT.
2. The sequences ne_w are cofinal in the positive integers; inverse limits therefore identify the π-adic completion of B with the product of m_w-adic completions of B_(m_w).
3. Apply pinned AdicCompletion.ofTensorProductEquivOfFiniteNoetherian to the finite A-module B. Its natural tensor map is multiplicative and unital on elementary tensors, so the linear equivalence upgrades to an algebra equivalence.
4. Invert π_A. Every completed local DVR has the corresponding completed fraction field; localization commutes with the finite product and with B⊗A Â. This yields the claimed decomposition and the valuations/residue maps of each factor.

**Acceptance.**

- Compare the actual maps, including their multiplicities and the chosen uniformizer-last residue convention.

**Prerequisites.**

- `mathlib:AdicCompletion.ofTensorProductEquivOfFiniteNoetherian`
- `K2SymbolsBrauer:T.3/higher-milnor-residues`

**Sources.**

- `GilleSzamuely.CSAGC.2006`: AppendixA.6.4(1),p312/PDF326 (statement refers to Serre);the CRT/inverse-limit proof here is a worker derivation. Read the indicated source proof. Additional elementary matrix/tower details are a worker derivation and are identified as such; no unread proof is claimed read.

### Globalize the Milnor norm-residue square

`K2SymbolsBrauer:T.3/general-milnor-norm-residue` · lemma · parent `K2SymbolsBrauer:T.3` · implementation unchecked

Proposed parent: `K2SymbolsBrauer:T.4`; maintainer integration is pending.

For E/F finite and a discrete valuation v of F whose integral closure in E is finite, ∂_v N_(E/F)=Σ_(w|v)N_(κw/κv)∂_w on K_n^M(E), n≥1. In degree2 this is the product of field norms of the uniformizer-last tame symbols.

**Hypotheses.**

- Normalization finiteness is essential in the completion argument; it is separately supplied for the function-field applications below.

**Proof outline.**

1. Base change the finite norm to F̂_v. finite-normalization-completion-splitting has field factors, each of local algebra length1, so the arbitrary-base-change norm formula gives the sum of their complete-field norms.
2. Apply finite-complete-norm-residue to each factor. Completion does not change the residue fields or normalized valuations.
3. The resulting two-square diagram has identity on the lower residue field. Thus its outer square is the stated formula before completion. Ramification indices belong to restriction of residues, not to the right-hand norm sum.

**Acceptance.**

- Compare the actual maps, including their multiplicities and the chosen uniformizer-last residue convention.

**Prerequisites.**

- `K2SymbolsBrauer:T.3/finite-complete-norm-residue`
- `K2SymbolsBrauer:T.3/finite-normalization-completion-splitting`
- `K2SymbolsBrauer:T.4/finite-artin-norm-base-change`

**Sources.**

- `GilleSzamuely.CSAGC.2006`: Corollary7.4.3 full proof p205;Corollary7.3.11 diagram9 pp202. Read the indicated source proof. Additional elementary matrix/tower details are a worker derivation and are identified as such; no unread proof is claimed read.

### Finite normalization of F[t] in a mixed field extension

`K2SymbolsBrauer:T.4/mixed-function-field-normalization` · lemma · parent `K2SymbolsBrauer:T.4` · implementation unchecked

For any field F and finite E/F(t), including mixed inseparable extensions, the integral closure of F[t] in E is a finite F[t]-module. The same holds at every polynomial prime and at infinity after replacing t by t⁻¹.

**Hypotheses.**

- This assembles the pinned pure-polynomial and separable-normalization results; it does not reuse them in the unsupported separable-then-pure order.

**Proof outline.**

1. Enlarge E to a finite normal algebraic hull M/F(t). Let P=M^Aut(M/F(t)). The normal-field decomposition gives P/F(t) purely inseparable and M/P separable: for a fixed element x, its sufficiently high characteristic power is separable over the base, hence fixed separable elements lie in the base; the orbit polynomials over P are separable. This is Stacks030M; its source says details omitted, and this orbit argument supplies the needed direction.
2. The integral closure A′ of F[t] in P is finite by TauCeti.IsIntegralClosure.finite_mvPolynomial_of_isPurelyInseparable (one variable). It is normal and Noetherian. Its fraction field is P.
3. Apply Mathlib IsIntegralClosure.finite to the separable M/P over A′. The resulting closure C is finite over A′ and therefore over F[t]. TauCeti.IsIntegralClosure.tower_bot identifies it with the F[t]-closure in M.
4. TauCeti.IsIntegralClosure.finite_of_injective descends finiteness from M to E. Integral closure commutes with localization; tensor/localization of finite modules gives the finite closure of every F[t]_(π). Repeat with F[t⁻¹] for infinity.
5. A nonconstant function on a proper regular integral curve gives a finite map to P1; its valuations lie over these polynomial/infinite places by the imported regular-place dictionary. This supplies the finite normalization hypothesis without assuming the curve is smooth over an imperfect field.

**Acceptance.**

- Compare the actual maps, including their multiplicities and the chosen uniformizer-last residue convention.

**Prerequisites.**

- `tauceti:TauCeti.IsIntegralClosure.finite_mvPolynomial_of_isPurelyInseparable`
- `mathlib:IsIntegralClosure.finite`
- `tauceti:TauCeti.IsIntegralClosure.tower_bot`
- `tauceti:TauCeti.IsIntegralClosure.finite_of_injective`
- `K2SymbolsBrauer:T.4/valuation-comparison`

**Sources.**

- `Stacks.Normalization.2026`: 032N full proof;030M statement and omitted-proof boundary;032L trace proof;032O;all read2026-10-02. Read the indicated source proof. Additional elementary matrix/tower details are a worker derivation and are identified as such; no unread proof is claimed read.

### Compare all finite Milnor and Quillen K-two transfers

`K2SymbolsBrauer:T.3/general-transfer-comparison` · lemma · parent `K2SymbolsBrauer:T.3` · implementation unchecked

Proposed parent: `K2SymbolsBrauer:T.3:localization-comparison`; maintainer integration is pending.

For every finite E/F, Matsumoto’s K2^M≅K2 identifies the Milnor norm with the exact-projective Quillen transfer, including inseparable extensions. The comparison is natural in field maps and has the same finite-Artin multiplicities.

**Hypotheses.**

- Use the early K3 finite-field-transfer-base-change, not a finite-extension-only residue statement.

**Proof outline.**

1. Both transfers are transitive, satisfy the projection formula and restrict/transfer by the finite degree. Early K3 proves arbitrary field base change for Quillen transfer by the exact bimodule filtration; T4 supplies the same formula for Milnor norms.
2. Over a p-closed base every finite extension has a tower of normal prime-degree extensions. In degreep, T4/p-closed-generation expresses K2(E) by symbols {y,x} with x in F. Both transfers send this to{N_E/F(y),x}, so they agree. Compose through the tower.
3. For a fixed α the difference of the two maps restricts to zero over an algebraic closure by Artin tensor base change, hence is torsion after descent to a finite level. For each p restrict to the maximal prime-to-p extension; the preceding tower argument kills the p-primary discrepancy. Restriction on that p-primary part is injective because restriction–transfer multiplies by a degree prime to p.
4. Every p-primary part vanishes, so the difference is zero. No norm-residue comparison is used to prove this comparison, avoiding a circular dependency with the Quillen residue square.

**Acceptance.**

- Compare the actual maps, including their multiplicities and the chosen uniformizer-last residue convention.

**Prerequisites.**

- `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`
- `K2SymbolsBrauer:T.4/finite-artin-norm-base-change`
- `K2SymbolsBrauer:T.4/p-closed-generation`
- `K2SymbolsBrauer:T.4/prime-to-p-closure`
- `K2SymbolsBrauer:T.4/restriction-transfer-degree`
- `GeneralAlgebraicKTheory:K.3/finite-field-transfer-base-change`
- `GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula`
- `K2SymbolsBrauer:T.2/matsumoto`

**Sources.**

- `GilleSzamuely.CSAGC.2006`: §7.3.4–7.3.8 p196–199 reduction;worker application of its two-norm uniqueness proof to the read exact-functor Quillen base-change adapter. Read the indicated source proof. Additional elementary matrix/tower details are a worker derivation and are identified as such; no unread proof is claimed read.

### Arbitrary finite norms use Artin composition lengths

`K2SymbolsBrauer:T.4/finite-artin-norm-base-change` · lemma · parent `K2SymbolsBrauer:T.4` · implementation unchecked

For any finite E/F and any field F′/F, writing E⊗F F′=∏B_j with residue fields E_j and local composition lengths ℓ_j, res N_(E/F)=Σℓ_j N_(E_j/F′) res_j on Milnor K_n, including n=0.

**Hypotheses.**

- The integer ℓ_j is dim_(F′)(B_j)/[E_j:F′], not the nilpotence exponent of its maximal ideal.

**Proof outline.**

1. Choose a finite tower of simple extensions generating E. Apply the already proved simple-transfer arbitrary-base-change formula at each step.
2. Decompose each intermediate finite tensor algebra into local factors. Passing to a composition series, the length of a final factor is the sum of the products of the successive simple-factor lengths weighted by the intermediate residue degrees. This follows by counting each simple residue-vector subquotient in the finite-dimensional tensor module.
3. Norm transitivity combines the summands; restriction functoriality identifies the final residue embeddings. Thus the coefficient is the final composition length, independently of the chosen tower.
4. This repairs the general wording of GS7.3.6. The simple uniserial case, separable factors of length1 and one radical degree-p factor of lengthp used in the prime reduction remain valid.

**Acceptance.**

- Check the actual maps and the stated scope, rather than only equality of cardinalities.
- For separable E/F all local factors have length1.
- For a radical degree-p simple extension the unique geometric factor has lengthp.
- For Fp(s,t)⊂Fp(s^(1/p),t^(1/p)) and base change to E the coefficient is p², not2p−1.

**Prerequisites.**

- `K2SymbolsBrauer:T.4/transfer-base-change`
- `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`

**Sources.**

- `GilleSzamuely.CSAGC.2006`: Lemma7.3.6 pp197–198, full induction proof read with the p197 multiplicity correction recorded above. Read at the stated locator; worker deductions and quoted upstream inputs are distinguished in the proof outline.

**Source issues.**

- `K2SymbolsBrauer/E-artin-base-change-multiplicity`

### The degree-two étale Chern sign on Steinberg symbols

`K2SymbolsBrauer:T.7/chern-product-sign` · lemma · parent `K2SymbolsBrauer:T.7` · implementation unchecked

With Grothendieck–Soulé Chern classes and c_(1,1)=the Kummer map, c_(2,2)({a,b})=−κ(a)∪κ(b). Consequently c_(2,2)=−h_F on K2(F)/m for every m invertible in F.

**Hypotheses.**

- The general Chern-class construction remains M.8’s. M.3 supplies its K2 interface; T7 checks the normalized formula.

**Proof outline.**

1. Read Soulé2.2.2.3: on the reduced K-theory smash product the universal tensor-product Chern polynomial gives coefficient −(i+j−1)!/((i−1)!(j−1)!). The unreduced rank terms disappear on the smash quotient; this is why multiplying two first classes gives a negative second class.
2. For two K1 inputs and output cohomological degree2, the only possible positive weights are i=j=1. The coefficient is −1, requiring no division or odd-prime hypothesis.
3. Soulé2.2.4.3.1 identifies c11 with the Kummer connecting map composed with determinant, and2.2.4.4 explicitly states the negative cup on a Steinberg symbol. Pull the external product back along multiplication F⊗Z F→F.
4. The source treats prime powers. For arbitrary invertible m decompose coefficients by the canonical CRT idempotents and use coefficient naturality of the Chern and Kummer maps imported from M.3/M.8. Each prime-power projection agrees, so the integral modulo-m maps agree.
5. Matsumoto’s symbols generate K2(F); the two homomorphisms agree on all symbols, so they agree on the quotient. This proves an adapter, not Tate’s isomorphism theorem.

**Acceptance.**

- Check the actual maps and the stated scope, rather than only equality of cardinalities.
- For m=1 the coefficient module and both maps are zero.
- For m=2 the negative sign is invisible; this test alone cannot choose the sign.
- For a symbol whose cup has order3, c22 is its negative and differs from h; retain an odd-order sign test.

**Prerequisites.**

- `K2SymbolsBrauer:T.7/symbol-formula`
- `K2SymbolsBrauer:T.2/matsumoto`
- `MotivicEtaleKTheory:M.3`

**Sources.**

- `Soule.Thesis.1979`: Proposition2.2.2.3 full proof pp42–44 and2.2.4.4 first paragraph p53; c11 formula p52. Read at the stated locator; worker deductions and quoted upstream inputs are distinguished in the proof outline.

### Relation minors bound the finite unit-kernel index

`K2SymbolsBrauer:T.5/relation-minor-index-divisibility` · lemma · parent `K2SymbolsBrauer:T.5` · implementation unchecked

For a lattice L⊂Z^r generated by finitely many integer vectors, if one r-column minor is nonzero then Z^r/L is finite and its order divides every r-column determinant. Hence it divides the gcd of any selected such determinants.

**Hypotheses.**

- This is an application of the pinned determinant/index theorem, not a new plan for Smith normal form.

**Proof outline.**

1. One nonzero minor spans a full-rank sublattice L0⊂L. This gives full rank and finiteness for L; select a Z-basis of L using the existing PID submodule API.
2. Express each selected collection of relation vectors in that basis, giving a square integer coefficient matrix C. The ambient determinant factors as det(basis L)·det(C).
3. Submodule.natAbs_det_basis_change identifies |det(basis L)| with the quotient cardinality, which thus divides every selected determinant and their gcd. This argument only needs selected minors, not a search for all of them.
4. If reduction Z^r→k× is onto and annihilates L, |k×| divides the quotient cardinality. When the selected gcd equals |k×|, the two divisibilities force equality and identify L with the kernel.

**Acceptance.**

- For r=1, vectors6 and10 give index2, not either individual determinant.
- A rank-deficient relation matrix has no nonzero maximal minor and cannot certify a finite quotient.
- For the norm4 golden-field step, forcing the torsion column into every selected minor gives gcd6 and fails the desired equality3; the valid selected minors give6 and−3.

**Prerequisites.**

- `mathlib:Submodule.natAbs_det_basis_change`

**Sources.**

- `Pinned.Mathlib.CardQuotient`: Mathlib/LinearAlgebra/FreeModule/Finite/CardQuotient.lean33–95 at082e2d3, full statement/proof read2026-10-02. Direct application of the pinned theorem; determinant factorization and the selected-minor gcd are the worker arithmetic adapter.

## Remaining gaps

### The twisted coefficient module is missing from both libraries

Checked at the pinned commits: neither library has μ_m^{⊗j} for j ≠ 0, 1. Tau Ceti has the weight-one module TauCeti.KummerCoeff (Coefficients.lean:107) with its discrete G_K-action, and Mathlib has modularCyclotomicCharacter (CyclotomicCharacter.lean:212). The tensor-power twists are MotivicEtaleKTheory M.1's target ('Import finite/continuous Tate twists…'; the reviewed audit AUDIT-30 lists 'Finite and continuous Tate-twist coefficient modules mu_(l^r)^(x)j' under M.1), and M.1 is upstream of T.7 through M.3. They are therefore requested from M.1, not constructed in T.7. This entry is superseded by that request and should be deleted when the request is answered; ClassFieldTheory Layer 5 does not supply the module (it pairs μ_n × μ_n → μ_n through kummerCupPairing ζ).

Needed by: `K2SymbolsBrauer:T.7/twisted-roots-of-unity`, `K2SymbolsBrauer:T.7/symbol-formula`, `K2SymbolsBrauer:T.7/brauer-valued-symbol`.

### The normalized CFT character-evaluation supplier proof remains quoted

The Chern product sign is now fixed and its source proof is read: Soulé thesis2.2.2.3,2.2.4.3.1 and2.2.4.4 give c22=−h. The local adapter is decomposed and ε=−1 is fixed from the source variable order. Its remaining imported identity is inv(χ∪κ(b))=χ(Artin(b))/m. MilneIII.3.6 quotes Serre’s AnnexeXI rather than proving it; this packet records the exact CFT5/6 export request and upstream note, including an odd-order sign test. The global higher-power reciprocity adapter requires the exact CA1 theorem with this normalization; it is not inferred from CA1’s title. M3 still owns Tate’s local/global/S-integer proofs, not this packet.

Needed by: `K2SymbolsBrauer:T.7/chern-class-agreement`, `K2SymbolsBrauer:T.7/local-comparison`, `K2SymbolsBrauer:T.7/global-reciprocity`, `K2SymbolsBrauer:T.7/brauer-valued-symbol`.

### The Dennis-Stein relations and the presentation theorems are cited, not proved

K-book III.5.11 (PDF p. 234) cites (D1)–(D3) to Dennis–Stein ([48], K2 of radical ideals and semilocal rings revisited, LNM 342, 1973) and attributes Theorem III.5.11.1 to Maazen, Stienstra and van der Kallen with Keune ([103], The relativization of K2, J. Algebra 54 (1978), 159–177) as the reference; neither proof is in the source. The nodes derive the field cases from Matsumoto's theorem; the relations for a general commutative ring, part (a) for local rings that are not fields, and part (b) remain open. NEXT SOURCE ACTION: obtain Keune 1978 and Dennis–Stein 1973.

Needed by: `K2SymbolsBrauer:T.6/dennis-stein-relations`, `K2SymbolsBrauer:T.6/dennis-stein-presentation`, `K2SymbolsBrauer:T.6/relative-presentation`.

### The Keune-Loday comparison with the homotopy-fibre relative group is cited, not proved

The stage text makes the square-zero examples 'tests of K.5', whose relative K-theory is the homotopy fibre of K(A) → K(A/I). The comparison of its π₂ with the relative group K₂(R, I) of K-book Definition III.5.7 is attributed to Keune and Loday in K-book IV.1.11 (PDF p. 276) and not proved there, and neither GeneralAlgebraicKTheory K.5's text nor this packet owns it. Until it is supplied the T.6 computations test the classical relative group only.

Needed by: `K2SymbolsBrauer:T.6/relative-steinberg-group`, `K2SymbolsBrauer:T.6/relative-square-zero`.

## Requests to existing owners

- `K2SymbolsBrauer:T.2:symbols` — From the companion packet K2SymbolsBrauer--T.1: expose w_ij(u) = x_ij(u) x_ji(−u⁻¹) x_ij(u) and h_ij(u) = w_ij(u) w_ij(−1) as API items of K2SymbolsBrauer:T.2/steinberg-symbol, with φ(h_ij(u)) = diag(u, u⁻¹) at (i, j) and h_ij(1) = 1; the Dennis-Stein word uses h_ij(1 − rs)⁻¹. Every other input from the companion part is cited by node id.

- `ArithmeticKTheory:N.2` — Consumer note, not a supply (RT-AREA-ktheory-1/9 and /26): T.5 derives its degree-two rows itself — T.5/s-integer-tame-kernel-sequence (residues at the primes outside S), T.5/tame-kernel-sequence (S = ∅) and T.5/relative-s-integer-sequence (residues at the primes in S) — from GeneralAlgebraicKTheory K.3 through T.3/dedekind-localization-boundary and KTheoryLowDegrees U.4, and imports nothing from N.2; the earlier request for N.2's localisation sequence is withdrawn. N.2 imports these rows (edge T.5 → N.2) and specialises its all-degree Dedekind sequence to them: in degrees at most two N.2/localisation-sequence-for-a-dedekind-domain should restrict to T.3/dedekind-localization-boundary, and N.2/the-three-classical-rows (b) should cite the T.5 nodes instead of being cited by them.

- `ArithmeticKTheory:N.6` — Consumer note, not a supply (RT-AREA-ktheory-1/9): the certificate engine — the order-certificate format on Mathlib's Module.Relations and Module.Presentation with independent upper and lower bounds, and the rule that an upper bound with a surjective presentation is not an isomorphism — is N.6's. The former node T.5/certified-presentation is deleted from this packet and its statement, API and tests are for N.6 to own; N.6/certificate-driven-computation, which lists T.5/certified-presentation as a prerequisite, must cite N.6's own format instead. T.5 supplies N.6 (edge T.5 → N.6) with groups and sequences only: T.5/unramified-subgroup, T.5/tame-kernel-sequence, T.5/s-integer-tame-kernel-sequence, T.5/relative-s-integer-sequence and the lower-bound symbol T.5/real-sign-symbol. No T.5 node depends on N.6, and T.5 needs no finite-generation theorem.

- `ArithmeticKTheory:N.8` — Consumer note, not a supply (RT-AREA-ktheory-1/9): N.8 imports rather than recomputes K_2(ℤ) ≅ ℤ/2 with generator {−1, −1} (T.5/k2-of-the-integers), K_2(ℚ) ≅ K_2(ℤ) ⊕ ⊕_{p odd} 𝔽_p^× with K_2(ℚ) infinite (T.5/k2-of-the-rationals), K_2(𝔽_q) = 0 (K2SymbolsBrauer:T.2/k2-finite-field, this roadmap's owner of that calculation) and, for its ℤ[1/p] example, 0 → K_2(ℤ) → K_2(ℤ[1/p]) → 𝔽_p^× → 0 (T.5/relative-s-integer-sequence, residues at p ∈ S) together with T.5/s-integer-tame-kernel-sequence (residues outside S). N.8's certificate for K_2(ℤ) instantiates N.6's format with the bounds of T.5/k2-of-the-integers; K_1(ℤ) and K_0(ℤ) are KTheoryLowDegrees U.6's and Z.6's.

- `SpecialValuesBirchTate:B.7` — Consumer note, not a supply: B.7 derives #K_2(O_{F,S}) = #K_2(O_F)·∏_{v∈S}(Nv − 1) ('prove from localisation') from T.5/relative-s-integer-sequence, whose residues are at the primes in S (the tame-kernel sequence of O_{F,S}, with residues outside S, is T.5/s-integer-tame-kernel-sequence). B.7 lies downstream of T.5 (B.7 requires B.6, …, B.2, B.1, and B.1 requires K2SymbolsBrauer:T.5), so no T.5 node may list it as a prerequisite.

- `KTheoryFiniteLocalFields:L.1` — Compatibility note: L.1's 'field-symbol calculation in degree two' must agree with K2SymbolsBrauer:T.2/k2-finite-field (Matsumoto's presentation) under the comparison of T.1:plus. No T.5 node needs L.1: K_2(𝔽_q) = 0 is K2SymbolsBrauer:T.2/k2-finite-field.

- `MotivicEtaleKTheory:M.3` — M.3 is the single owner (RT-AREA-ktheory-1/8) of: (i) the Galois symbol h_F : K₂(F)/m → H²(F, μ_m^{⊗2}) for any field F with m invertible, with the symbol formula {a, b} ↦ κ(a) ∪ κ(b) and the cohomological Steinberg relation κ(a) ∪ κ(1 − a) = 0 (K-book Proposition III.6.10.3), exported for a general field as its own declaration before the arithmetic specialisation (the verifier of RT-AREA-ktheory-1/8; RT-AREA-ktheory-1/14 decides where in MotivicEtaleKTheory the general-field symbol sits); (ii) its norm-residue/Chern description, the degree-two étale Chern class c_{2,2} on π₂ K(F) with its value on a product of two K₁-classes and its sign; (iii) Tate's theorems, as separate declarations with their hypotheses: the local-field theorem, the global-field theorem, and the S-integer comparison K₂(O_{F,S})/ℓ^r ≅ H²_ét(O_{F,S}, μ_{ℓ^r}^{⊗2}) with the primes above ℓ in S, proved through the étale localisation sequence. T.7 constructs none of these and proves no Tate theorem; it keeps only the comparison with the Kummer map and cup product, the Hilbert/local-invariant normalisation, the change-of-root rule, the reciprocity adapter and the Chern compatibility. The 'global reciprocity' M.3's text uses must come from ClassFieldTheory Layer 10, not from K2SymbolsBrauer:T.7/global-reciprocity, which would close a cycle M.3 → T.7 → M.3. Round2 fixes the Grothendieck–Soulé sign to c22=−h and requires prime-power/CRT coefficient naturality; Soulé thesis2.2.2.3 and2.2.4.4 are read primary inputs. Keep the local/global Tate theorem proofs separate.

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality` — invMap on Br F with its arithmetic-Frobenius normalisation, h2MuEquivZMod_mixed, kummerCupPairing ζ and localSymbol, for the comparison of the norm residue symbol with the Kummer cup product followed by the local invariant. Layer 5 does not build μ_n ⊗ μ_n (its text: 'Two Kummer classes naturally cup into μ_n ⊗ μ_n, not μ_n … A primitive root supplies the additional pairing'), so the twisted module is requested from MotivicEtaleKTheory M.1 instead. This import is the promoted link CFT-L68 (ClassFieldTheory Layer 5 → T.7), which is kept; the node now lists the stage as a prerequisite. For all invertible m and primitive ζ, export inv(χ∪κ(b))=χ(localArtin(b))/m for finite characters χ; use arithmetic Frobenius and the coordinate map on m-torsion Q/Z. This is the missing normalized identity, not merely a quadratic comparison. T7 transports it to the inverse cup symbol because its reciprocity variable is first. The m=3 test over F7((t)) must give NRS(t,3)=2 and NRS(3,t)=4.

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-14-hilbert-reciprocity-and-quadratic-reciprocity` — hilbertProductFormula in its additive cohomological form (the local ZMod 2 invariants of the quaternion symbol sum to zero) and its multiplicative form ∏_v (a, b)_v = 1, with quadratic reciprocity for ℚ: the m = 2 case of T.7's reciprocity adapter, read through QuadraticFormInvariants 6E's sign dictionary. Layer 14 owns only the quadratic law ('higher power reciprocity laws (Artin–Tate XII) are follow-on work using the same symbols'); the m-th power law is requested from ClassicalArithmeticCompletion CA.1.

- `GeneralAlgebraicKTheory:K.3` — The localisation, dévissage, resolution and transfer theorems are cited through the K.3 nodes of the GeneralAlgebraicKTheory--K.1 packet (abelian-localization-theorem, devissage-theorem, resolution-theorem, transfer-maps-and-projection-formula). Still needed from the stage: (i) the degree-one boundary ∂[s] = [R/sR] ∈ K_0(R/sR) for a non-zero-divisor s (K-book Example V.6.1.2), see the gap on the degree-one normalisation; (ii) the identification of the Serre quotient of finitely generated R-modules by the S-torsion ones with M(S^{-1}R) (K-book V.6.1, citing II.6.4.1), which T.3/dedekind-localization-boundary uses with S = R ∖ {0}; (iii) for T.3/milnor-quillen-transfer-comparison, the base-change formula for restriction-of-scalars transfers along a finite field extension and an arbitrary extension of the base (the analogue of T.4/transfer-base-change).

- `GeneralAlgebraicKTheory:K.7` — The K_*(R)-module structure of the localisation sequence of a DVR with the side of the action fixed, ∂(x·y) = ∂(x)·ȳ for x ∈ K_*(F) and y ∈ K_*(R), and the identification of the product of two units in K_2 with their Steinberg symbol. K.7's text: 'Prove compatibility with relative groups, localisation boundaries and transfers. Export the comparison with tensor products on K₀ and multiplication of units on K₁.'

- `KTheoryLowDegrees:U.4` — SK_1(O_{F,S}) = 0 for a number field F and a finite set S of nonzero primes (S = ∅ included, so SK_1(ℤ) = 0) — the Bass–Milnor–Serre theorem — in the form T.5 uses: the map K_1(O_{F,S}) → K_1(F) induced by the inclusion is injective (determinant identifications K_1(O_{F,S}) ≅ O_{F,S}^× ⊆ F^× ≅ K_1(F)). U.4's text: 'Prove the Bass–Milnor–Serre result needed for SK₁(O_{F,S})=0, with F a number field and S finite.' Through the exact segment ⊕_𝔭 k(𝔭)^× → K_1(O_{F,S}) → K_1(F) of T.3/dedekind-localization-boundary it is what makes the residue sums of T.5 onto (RT-AREA-ktheory-1/26). The KTheoryLowDegrees--U.1 blueprint, not yet accepted, plans these statements as U.4/bass-milnor-serre and U.4/K1-S-integers-into-field; the prerequisite can be narrowed to them once it is.

- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts` — The Layer 12 dictionary, imported explicitly rather than re-proved (RT-AREA-ktheory-1/32; the link AC-L40 already exists): 12A, ord_x : k(X)^× → ℤ at a regular closed point through the discrete valuation ring O_{X,x}, and closed points ↔ places with matching residue fields and degrees; 12B, the proper regular model as the normalisation of ℙ¹_F in K, projective, with k(X_F) ≃ₐ[F] K; 12D, Weil divisors on the regular model ≅ Divisor F K with principal divisors and degrees matching. Layer 12's 'regular, not smooth' convention is kept: over an imperfect F the model need not be smooth. Already pinned and reused: Mathlib's Ring.ordFrac_eq_valuation_inv (Mathlib/RingTheory/OrderOfVanishing/Noetherian.lean:183) and Tau Ceti's Place.heightOneSpectrumEquiv (TauCeti/FieldTheory/FunctionField/AffineModel/Prime.lean:140); no pinned declaration mentions both Scheme.ord and Place.

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity` — localArtinEquiv with its normResidue form K^×/N L^× ≅ Gal(L/K) for a finite abelian extension of a nonarchimedean local field, the unramified case in which units are norms, and localArtinMap_quadratic_eq_hilbertSymbol as the m = 2 check. For all invertible m and primitive ζ, export inv(χ∪κ(b))=χ(localArtin(b))/m for finite characters χ; use arithmetic Frobenius and the coordinate map on m-torsion Q/Z. This is the missing normalized identity, not merely a quadratic comparison. T7 transports it to the inverse cup symbol because its reciprocity variable is first. The m=3 test over F7((t)) must give NRS(t,3)=2 and NRS(3,t)=4.

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-4-the-abstract-artin-map` — artinMap_groundNorm, the compatibility of the Artin map with the norm of a finite extension, used in the Steinberg identity of the norm residue symbol.

- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants` — sumLocalInv_eq_zero (exactness in the middle of Br K → ⊕_v Br K_v → ℚ/ℤ, with the real-place invariants) and the localisation maps Br K → Br K_v. This import is the promoted link CFT-L69 (ClassFieldTheory Layer 10 → T.7), which is kept; the node now lists the stage as a prerequisite.

- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant` — hilbertSymbol with symmetry and bimultiplicativity (6C's milestones), for the Steinberg symbol K₂(F) → {±1} of hilbert-symbol-steinberg. 6C freezes the comparison hilbertSymbol_eq_cohomological, which 6E proves and which is requested from 6E.

- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory` — hilbert90, the Kummer isomorphism kummerIso : Kˣ/(Kˣ)ⁿ ≅ H¹(G_K, μₙ), and h2KummerToUnits : H²(G_K, μₙ) ↪ H²(G_K, (Kˢ)ˣ) with image the n-torsion.

- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-6-change-of-groups` — Restriction of continuous cohomology to the decomposition groups (the completions F_v), compatible with the Kummer map.

- `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-8-cup-products-in-low-degrees` — Compatibility of the (1,1) cup product with restriction.

- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group` — The power-class count #(K^×/K^×n) = n · #μ_n(K) · q^(natCastValuation K n) for a nonarchimedean local field, giving finiteness of F^×/F^×m.

- `MotivicEtaleKTheory:M.1` — The finite Tate twists μ_m^{⊗j} (j ∈ ℤ) of a field F with m invertible, as discrete G_F-modules built on Tau Ceti's KummerCoeff F m, with the equivariant tensor pairings μ_m^{⊗i} × μ_m^{⊗j} → μ_m^{⊗(i+j)}, so that explicitCup11 of two Kummer classes lands in H²(F, μ_m^{⊗2}).

- `GeneralAlgebraicKTheory:K.5` — Relative K-theory of a pair (A, I) as the homotopy fibre of K(A) → K(A/I), with its long exact sequence and π₂ K(A, I); and, if K.5 accepts it, the Keune–Loday identification of π₂ K(A, I) with the relative group of K-book III.5.7 (cited in K-book IV.1.11), against which the T.6 square-zero examples are tests.

- `KTheoryLowDegrees:U.5` — The relative elementary group E(A, I), the congruence subgroup GL(I) and K₁(A, I), with the start of the relative exact sequence, used to define K₂(R, I) = ker(St(R, I) → E(R, I)).

- `MotivicEtaleKTheory:M.4` — Consumer note, not a supply (RT-AREA-ktheory-1/12): M.4's Nesterenko–Suslin/Totaro comparison of field Milnor K-theory with the diagonal higher Chow groups imports from T.4 the all-degree Milnor norms with Kato's independence of the chain of generators (T.4/milnor-transfer-transitivity) and Suslin's reciprocity law Σ_w N_{κ(w)/F} ∂_w(x) = 0 for x ∈ K^M_{n+1}(F(C)), C a proper curve over any field (T.4/weil-reciprocity), stated over the closed points of the regular proper model (the normalisation), with possibly inseparable residue extensions and without smoothness. M.4 owns the two inverse maps and the boundary calculation. The needed stage edge is T.4 → M.4; M.4 is downstream, so no T.4 node lists it.

- `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68` — The milestone 'Weil reciprocity f(div g) = g(div f)' of Layer 2's divisor construction of the Weil pairing, with Layer 0's places, principal divisors and evaluation of a function on a divisor of disjoint support (Tau Ceti's Divisor.principal and Divisor.eval, whose local factors are residue-field norms). T.4/disjoint-support-reciprocity proves that T.4's symbol-form reciprocity specialises to this statement for W.FunctionField (RT-AREA-ktheory-1/32), so the elliptic milestone and T.4's theorem must be stated compatibly; T.4 keeps the general theorem. Needed stage edge: EllipticCurves Layer 2 → T.4 (acyclic: no EllipticCurves layer depends on T.4).

- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6e-the-two-hasse-invariants-agree-and-both-are-the-invariant-map` — hilbertSymbol_eq_cohomological, 6E's Milestone 2: (a, b)_K = hilbertSign(localSymbol (a) (b)) at ClassFieldTheory's arithmetic-Frobenius normalisation, with hilbertSign 0 ↦ +1, 1 ↦ −1, and ε([D]) = localHasse for the quaternion division algebra D — the exponent-2 comparison of T.7's norm residue symbol (m = 2, ζ = −1, where kummerCupPairing (−1) is canonical) with ClassFieldTheory's localSymbol and with the quaternion/norm-equation symbol (RT-AREA-ktheory-1/27).

- `tauceti:TauCetiRoadmap/QuadraticFormInvariants#7b-the-comparison-with-h²` — The comparison of the algebraic Brauer group with H²(G_K, (K^s)^×) (7B's crossed-product package, milestone 3) and the symbol as a cup product ι[(a, b)] = (a) ∪ (b) (milestone 6, brauerCohomologyEquiv_quaternionClass): T.7's Brauer-valued symbol β_ζ is built in the cohomological Brauer group, and exporting it as a class of central simple algebras, with β_{−1}{a, b} the quaternion class (a, b), uses this comparison (RT-AREA-ktheory-1/27; Layer 7 owns the comparison of the algebraic Brauer group with H²).

- `ClassicalArithmeticCompletion:CA.1` — The m-th power Hilbert reciprocity law for a number field F containing μ_m: for a, b ∈ F^×, (a, b)_v = 1 for almost all places v and ∏_v (a, b)_v = 1, including the places above m and the real places (m ≤ 2) — CA.1's 'source-scoped higher reciprocity through class field theory', which RS-03 keeps in CA.1 ('Higher reciprocity and power-residue/Hilbert-symbol extensions, including the place 2, infinite places and ramification conventions'). ClassFieldTheory Layer 14 owns only the quadratic law. T.7/global-reciprocity reads the law in the normalisation of T.7/classical-local-symbols (local reciprocity of ClassFieldTheory Layer 6 with the arithmetic Frobenius, variable order x ↦ (x, −)_v); CA.1 should state its local symbol by the same construction, or record the conversion. CA.1 cannot import T.7's symbol (T.7 now imports CA.1), so which of the two owns the local m-th power Hilbert symbol is left to the maintainer (RT-AREA-ktheory-1/27).

## Stage proposals awaiting maintainer integration

### Two groups of nodes moved out of the companion T.1 part

An earlier revision of the packet for the T.1 part of this roadmap placed the higher tame symbols with their rigidity corollary, and the Dennis-Stein symbols with their presentation theorem, under T.2:symbols. The roadmap assigns higher Milnor residues, specialisation with a uniformiser and their product signs to T.3:localization-comparison, and the Dennis-Stein symbols to T.6. Both groups are owned here instead, and the companion packet was corrected before review rather than left as a duplication. No restructuring of the atlas is proposed: the stage texts already say where these belong, and this entry records the correction so that a reviewer of either part can see it.



### The localisation comparison is supplied to S.3 and E.3, not imported from them

The accepted restructuring RS-18 makes K2SymbolsBrauer:T.3:localization-comparison the owner of 'Classical tame-symbol comparison with ring K-theory localization', narrows SchemeKTheoryOperations:S.3 to 'identify the scheme symbol boundary with the imported classical tame symbol/localization normalization' and EllipticKTheory:E.3 to its curve segment, and adds the links T.3:localization-comparison → S.3 and → E.3. The packet's localization-boundary listed S.3 and E.3 as prerequisites and requested the boundary identification from S.3: both closed two-stage cycles with RS-18's links (and E.3 → E.2 → T.4 → T.3:localization-comparison a longer one). The node now rests on GeneralAlgebraicKTheory K.3, which the layer's atlas entry already requires, and K.7; the requests to S.3 and E.3 are withdrawn.



### Milnor residues in T.3:symbols, Milnor norms and their identities in T.4, the Quillen comparison in T.3:localization-comparison

RT-AREA-ktheory-1/28 (confirmed) requires the elementary all-degree Milnor norm/residue identities inside T.4, before Kato's transitivity theorem, and the edge T.4 → T.3:localization-comparison, so that the localisation comparison imports Milnor norms from T.4 and K-theory transfers from GeneralAlgebraicKTheory K.3 instead of constructing a transfer. T.4's Bass–Tate sequence is built from the higher Milnor residues, which the stage text lists under T.3:localization-comparison; with that placement the new edge closes the cycle T.3:localization-comparison → T.4 → T.3:localization-comparison that an earlier revision of this packet avoided by proposing the opposite edge. Applied here: the residue theory (Serre's algebra and map, the higher residues and specialisations, the product formula, the change of uniformiser, the kernel of Serre's map, finite support and rigidity) is parented in T.3:symbols and still realises T.3:localization-comparison; the ramification formula for higher residues (Ex. III.7.8) joins Ex. III.7.7, III.7.9 and Corollary III.7.6.3 in T.4; the general Milnor norm–residue formula stays parented in T.4 (T.4/weil-reciprocity uses it); T.3:localization-comparison keeps the discrete-valuation-ring and Dedekind boundary comparisons, the Quillen norm–residue square and the comparison of the Milnor norm with Quillen's transfer. Stage changes: add T.4 → T.3:localization-comparison, withdraw the proposed T.3:localization-comparison → T.4, and move the sentences on higher Milnor residues and finite support to T.3:symbols' text. RS-28's owner line 'Higher algebraic residue maps and norm/residue projection comparisons → T.3:localization-comparison' is refined accordingly: residue maps in T.3:symbols' nodes, Milnor norm/residue identities in T.4, comparisons with Quillen K-theory in T.3:localization-comparison.



### K_2 of a finite field is owned by T.2

K2SymbolsBrauer:T.2/k2-finite-field (companion packet) plans K_2(𝔽_q) = 1 with the source's counting proof, and T.2/rational-function-field and T.2/milnor-examples build on it, so it cannot move to T.5 without a stage cycle. T.5's target 'K₂(F_q)=0' is realised by that node; T.5/k2-of-a-finite-field is removed as a duplicate, and its verbatim excerpts (Corollary III.6.1.1, PDF p. 239) should replace the companion node's one-line excerpt. KTheoryFiniteLocalFields L.1 recovers the same statement in its own model and is a compatibility check, not a second owner.



### The degree-two tame-kernel rows, K_2(ℤ) and K_2(ℚ) are owned by T.5

T.5's text asks to prove the tame-kernel sequence, its S-integer comparison, K₂(ℤ) ≅ ℤ/2 and the calculation of K₂(ℚ). RT-AREA-ktheory-1/9 and /26 (confirmed) make T.5 their single owner and require T.5 to derive the rows itself: T.5 imports T.3:localization-comparison's Dedekind boundary comparison and KTheoryLowDegrees U.4's SK_1(O_{F,S}) = 0, and no longer imports ArithmeticKTheory N.2's localisation sequence; N.2 imports T.5's rows (T.5 → N.2) and specialises its all-degree sequence to them, and N.8 imports K₂(ℤ), K₂(ℚ), K₂(𝔽_q) and the ℤ[1/p] sequence (T.5 → N.8). The verifier's indexing is applied: the tame-kernel sequence of O_{F,S} sums over the primes outside S (T.5/s-integer-tame-kernel-sequence), the relative sequence comparing O_F with O_{F,S} has its residues at the primes in S (T.5/relative-s-integer-sequence), and both are stated. SpecialValuesBirchTate B.7 consumes the relative sequence; B.7 lies downstream of T.5 (B.7 → B.6 → … → B.1 → T.5), so the packet's former import of the S-integer sequence from B.7 was a stage cycle. K₂(𝔽_q) = 0 stays with T.2/k2-finite-field (restructure entry above).



### The certificate engine is ArithmeticKTheory N.6's

RT-AREA-ktheory-1/9 (confirmed; the verifier: 'Keep the certificate engine and its independent upper/lower bounds in N.6, and remove the competing certificate-proof obligation from T.5'). The node T.5/certified-presentation, which an earlier revision planned on Mathlib's Module.Relations and Module.Presentation, is deleted; its statement, API and tests are for N.6 to own, and N.6/certificate-driven-computation must cite N.6's format instead of it. T.5 supplies N.6 with the groups and sequences (T.5 → N.6) and no longer needs the finite-generation theorem. T.5's stage text should lose its certified-presentation paragraph.



### The curve–place dictionary is AlgebraicCurves Layer 12's

T.4's text asks to 'compare the divisor valuation with the valuation already used in AlgebraicCurves'. Tau Ceti's AlgebraicCurves Layer 12 plans this dictionary — orders of vanishing at the regular closed points (12A), the regular proper model as the normalisation of ℙ¹ in F with closed points = places and matching residue fields (12A–12B), and Weil divisors = Divisor k F (12D) — and the link AC-L40 (Layer 12 → T.4) exists. RT-AREA-ktheory-1/32 (confirmed, narrowed by the verifier) asks that T.4 import it explicitly: T.4/valuation-comparison now lists Layer 12 as a prerequisite, proves no valuation comparison of its own and only transports the tame symbols and norms, keeping Layer 12's 'regular, not smooth' convention. The same finding adds T.4/disjoint-support-reciprocity, which proves that T.4's symbol-form reciprocity specialises to EllipticCurves Layer 2's milestone f(div g) = g(div f); that needs the stage edge EllipticCurves Layer 2 → T.4. T.4 keeps the general theorem.



### The Galois symbol and Tate's theorems are MotivicEtaleKTheory M.3's

RT-AREA-ktheory-1/8 (confirmed): M.3 is the single owner of the Galois symbol K₂(F)/m → H²(F, μ_m^{⊗2}), its symbol formula and cohomological Steinberg relation, and Tate's local, global and O_{F,S} theorems (the primes above m inverted), as separate declarations; by the verifier the general-field symbol is to be isolated before M.3's arithmetic specialisation. No T.7 node constructs these or proves a Tate theorem: symbol-formula imports the map and identifies its formula with the pinned Kummer map and cup product, and chern-class-agreement is only the compatibility of M.3's imported map and classes on Steinberg K₂. T.7 keeps the Hilbert/local-invariant comparison, the change-of-root rule and the reciprocity adapter. Consumers that cite T.7 for Tate's theorem (ArithmeticKTheory N.6, KTheoryFiniteLocalFields L.3, SpecialValuesBirchTate B.4) should cite M.3. The request to M.3 states the exports.



### Global reciprocity for K₂-symbols is an adapter over ClassFieldTheory and ClassicalArithmeticCompletion

RT-AREA-ktheory-1/27 (confirmed only for the remaining gaps): the promoted links ClassFieldTheory Layer 5 → T.7 (CFT-L68) and Layer 10 → T.7 (CFT-L69) exist and are kept, now as node prerequisites; the missing imports are added: ClassFieldTheory Layer 14 (hilbertProductFormula, the quadratic law only), QuadraticFormInvariants 6E (the exponent-2 comparison hilbertSymbol_eq_cohomological), QuadraticFormInvariants Layer 7B (the algebraic Brauer group against H², for the Brauer-valued export) and ClassicalArithmeticCompletion CA.1 (the m-th power Hilbert reciprocity law, owned there under RS-03). T.7/global-reciprocity no longer derives the reciprocity law: it states it for classes of K₂(F), imports the laws and proves their compatibility through local-comparison, with the primitive root and the Tate-twist pairing explicit. No L.3 → T.7 edge is added: L.3 consumes T.7. Whether CA.1 or T.7/classical-local-symbols owns the local m-th power Hilbert symbol is left to the maintainer; CA.1 cannot import T.7's.



### Milnor norms and Suslin reciprocity are exported to MotivicEtaleKTheory M.4

RT-AREA-ktheory-1/12 (confirmed, with a field-scope obligation): T.4 owns the all-degree Milnor norms with Kato's independence of the chain of generators and Suslin's reciprocity law for K^M_{n+1} of the function field of a proper curve over any field, which M.4's Nesterenko–Suslin/Totaro comparison imports (edge T.4 → M.4). T.4/weil-reciprocity is that law, stated over the places of the regular proper model (the normalisation) with Kato's norms for possibly inseparable residue extensions, never under a smoothness hypothesis; the finiteness it needs over an imperfect field is recorded as a gap.



### Milnor norm proofs precede their Quillen transfer adapter



The stable-id complete-field-degree-one-norm, finite-complete-norm-residue, finite-normalization-completion-splitting and general-milnor-norm-residue nodes belong to T.4, as their proposedParentStageId records. They use the elementary T.3:symbols residues. The general-transfer-comparison belongs to T.3:localization-comparison after T.4 and early K.3. Keep T.3:symbols → T.4 → T.3:localization-comparison; do not put the Milnor norm proofs in an umbrella T.3 stage depending on T.4.

## Source discrepancies

### K2SymbolsBrauer/E1

III.5.11, the paragraph after (D1)–(D3), PDF p. 234 (draft p. 226), author-hosted draft of 29 August 2013

By (D3), ⟨r, 1⟩ = 1 for every r with 1 − r a unit.

(D1)–(D3) are written multiplicatively ((D1) reads ⟨r, s⟩⟨s, r⟩ = 1), and (D3) with s = t = 1 gives ⟨r, 1⟩ = ⟨r, 1⟩⟨r, 1⟩, so ⟨r, 1⟩ is the identity 1, not 0; for a unit r this agrees with ⟨r, 1⟩ = {r, 1 − r} = 1 (Lemma III.5.10.2). The symbol ⟨r, 1⟩ is defined only when 1 − r is a unit, so 'for all r' must be restricted.

new

- Weibel's errata list for the K-book (Wayback copy of the author's Kbook.errata.pdf): no entry for III.5.11

### K2SymbolsBrauer/E2

III.6.2.3 (Example 6.2.3, norm residue symbols), PDF p. 241 (draft p. 233)

… the map y ↦ (x, y)_F is trivial if and only if x ∈ NK×.

With the Steinberg symbol {x, y} ∈ K₂(F) the 'if' direction is false. Here NK^× = F^×m (local reciprocity, as Gal(K/F) has exponent m and order #(F^×/F^×m)). If {a^m, y} = {a, y}^m were 1 for all a, y, then K₂(F), generated by symbols, would be m-torsion, forcing the uniquely divisible summand U of Moore's Theorem 6.2.4 to vanish; but K₂(F) is uncountable (Corollary III.6.3.2, since a local field contains ℚ(t) or 𝔽_p(t₁, t₂)) while μ_m is finite. With (x, y)_F the statement is the nondegeneracy of the pairing, which is how the next sentence uses it ('(ζ, x)_F ≠ 1').

new

- Weibel's errata list for the K-book (Wayback copy of the author's Kbook.errata.pdf): no entry for III.6.2.3

### K2SymbolsBrauer/E3

III.6.2.3 (Example 6.2.3), last two sentences before Moore's Theorem 6.2.4, PDF p. 241 (draft p. 233)

Since μ_m is the whole group of roots of unity of F, ζ has order exactly m in F^×/F^×m = F^×/NK^× (if ζ^{m/p} = y^m for a prime p | m, then y would be a root of unity in F of order mp). By nondegeneracy the homomorphism (ζ, −)_F : F^× → μ_m therefore has order m and is onto, so there is x ∈ F^× with (ζ, x)_F = ζ; for such x, ζ^i ↦ {ζ^i, x} is a section (a right inverse) of the norm residue symbol.

(ζ, x)_F ≠ 1 only says that (ζ, x)_F is a non-trivial root of unity, which for composite m need not generate μ_m: for F = ℚ₅ (μ(F) = μ₄) and ζ = i, if (i, x₀)_F = i then x = x₀² has (i, x)_F = −1 ≠ 1, and ζ^i ↦ {ζ^i, x₀²} is not a section. The map is a section, not an inverse, since its kernel U is non-zero.

new

- Weibel's errata list for the K-book (Wayback copy of the author's Kbook.errata.pdf): no entry for III.6.2.3

### K2SymbolsBrauer/E4

III.6.2.3 (Example 6.2.3), proof of the Steinberg identity, PDF p. 241 (draft p. 233)

The element g of Gal(K/F) attached to 1 − a — whose homomorphism is (1 − a, −)_F under the stated adjunction x ↦ (x, −)_F — lies in Gal(K/E) because 1 − a is a norm from E; so g fixes x, and (1 − a, a)_F = g(x)/x = 1. Replacing a by 1 − a gives (a, 1 − a)_F = 1.

Under the adjunction the source fixes one line earlier, x ↦ (x, −)_F, the element attached to 1 − a gives the homomorphism (1 − a, −)_F, not y ↦ (y, 1 − a)_F, so the variables are in the wrong order; and 'ζ(x)^m' evaluates an extension of ζ at x ∈ E, which the Kummer description over F does not provide, since x need not have an m-th root in K. The conclusion is right and the corrected argument is one line.

new

- Weibel's errata list for the K-book (Wayback copy of the author's Kbook.errata.pdf): no entry for III.6.2.3

### K2SymbolsBrauer/E5

Chapter III, Exercise 6.2, PDF p. 251 (book p. 243) of the author-hosted draft of 29 August 2013

{e1, e2} = {h, e2}{h, e1}^{−1}{e1, −1} with h = e1 − e2 of degree < d, so {e1, e2} is a product of symbols each having at most one entry of degree d (that entry being e1 or e2); consequently the subgroup L_d of K_2 F(t) generated by symbols of polynomials of degree ≤ d is generated by L_{d−1} and the symbols {π, a} with π irreducible of degree d and deg a < d.

Counterexample with E = ℚ(t), u = t, d = 1, e1 = t, e2 = t − 2: the tame symbol of {t, t − 2} at the place t = 2 is 1/2 (Lemma III.6.3), while every symbol {t, c} and {c, c′} with c, c′ ∈ ℚ^× is a unit at that place and has trivial tame symbol there, so {t, t − 2} is not such a product. The book's own Lemma III.6.1.4, which the exercise claims to generalise, produces a factor {a, y} with y = u − a2 of degree d. The corrected identity follows from the Steinberg relation for h/e1 + e2/e1 = 1.

new

- The author's errata list for the published edition (Wayback copy of Kbook.errata.pdf, SHA-256 ef7ed6d08a5f99d0f0a0b08aff0284bc6670ee76def317804706d89474a0ca5e), which has no entry for Exercise III.6.2

### K2SymbolsBrauer/E6

III.7.4, proof of Theorem 7.4, PDF p. 255 (book p. 247)

{f1, . . . , fn}: the symbols lie in K^M_n F(t).

L_d is defined inside K^M_n F(t), whose symbols have n entries; r is not otherwise defined.

new

- The author's errata list (Wayback copy of Kbook.errata.pdf), no entry for this line

### K2SymbolsBrauer/E7

III.7.4.1, proof of Lemma 7.4.1, PDF p. 255 (book p. 247)

then ai + ai+1 = 1 in F[t].

The a_i are the representatives in F[t] of degree < d; a_i + a_{i+1} − 1 has degree < d and is divisible by π, so it vanishes in F[t]. The a_i need not be constants.

new

- The author's errata list (Wayback copy of Kbook.errata.pdf), no entry for this line

### K2SymbolsBrauer/E8

III.7.6.4, proof of Proposition 7.6.4, last display, PDF p. 258 (book p. 250 of the draft; p. 272 of the published edition)

The last term is NE/F(Na/E x).

x lies in K^M_n(E′) and N_{a/E} : K^M_n(E′) → K^M_n(E) is the map in the top row of the square being proved; N_{a/F} x is not defined.

The author's errata list for the published edition: 'p.272 l.-1: Na/F x should be Na/E x'

- The author's errata list (Wayback copy of Kbook.errata.pdf, SHA-256 ef7ed6d0…)

### K2SymbolsBrauer/E9

Exercise III.7.1 (PDF p. 265; GSM 145 p. 280 per the errata)

∂v is independent of π; λ is not. For π′ = cπ, λ_{π′}(x) = λ_π(x) − ∂v(x)·{c̄} in the roadmap's normalisation ({c̄}·∂v(x) with a sign in Theorem III.7.3's); in degree one λ_π(π) = 1 but λ_{π′}(π) = c̄^{−1}.

On ℚ with the 5-adic valuation, λ_5{5} = 1 while λ_{10}{5} = res(5/10) = 3 in F_5^×.

Weibel's errata to GSM 145: 'p.280 Ex.7.1: The map ∂ is independent of the choice of π, but the specialization map λ does depend on this choice.' (Wayback Machine copy, SHA-256 ef7ed6d0…)

- Weibel's errata to GSM 145 (Wayback Machine copy)

### K2SymbolsBrauer/E10

Exercises III.7.7 and III.7.9 (PDF pp. 265–266)

Ex. III.7.7 is stated for 'finite field extensions' F′ of F, but the hint of Ex. III.7.9 applies it with F′ = F(t)_v, a completion, which is not finite over F(t). The statement holds for every field extension F′/F (the argument through Milnor's sequence for F′(t), node T.4/transfer-base-change, does not use finiteness), and that is the form the hint needs. 'Lemma 7.6.3' in the hint is Corollary 7.6.3.

The completion F(t)_v has infinite degree over F(t), so the left square of the hinted diagram is not an instance of Ex. III.7.7 as stated.

new

- Weibel's errata to GSM 145 (Wayback Machine copy): its entry 'p.281 l.-5' corrects the degrees in the diagram of Ex. 7.9 (the draft already prints n+1), not the hypothesis of Ex. 7.7

### K2SymbolsBrauer/E11

Exercise III.7.10 (PDF p. 266; p. 258 in the draft's own page numbering)

With Theorem III.7.3's normalisation ∂v{π, u2, …, un} = {ū2, …, ūn}, the formula is ∂v(xy) = (−1)^i λ(x)∂v(y) + ∂v(x)ρ(y) for x ∈ KM_i(F), y ∈ KM_j(F). The printed formula holds for the opposite normalisation ∂v{u1, …, u_{n−1}, π} = {ū1, …, ū_{n−1}}, which is (−1)^{n−1} times Theorem III.7.3's ∂v on KM_n(F) and is the one this roadmap uses.

Take F = ℚ, v the 5-adic valuation, π = 5, x = {5}, y = {2} (i = j = 1). Theorem III.7.3 gives ∂v{5, 2} = {2̄}, i.e. 2 in F_5^×. The printed formula gives λ{5}∂v{2} − ∂v{5}ρ{2} = 0 − {2̄}, i.e. 2^{−1} = 3 in F_5^×. In the algebra L of the proof of Theorem III.7.3, d(x) = λ(x) + Π·∂v(x) with Π on the left (as ∂v{π, u2, …} = {ū2, …} requires); expanding d(x)d(y) with Π·a = (−1)^{|a|}a·Π and Π² = {−1}Π gives the corrected formula, while reading the coefficient of Π on the right gives the printed one.

new

- Weibel's errata to the published GSM 145 printing (Wayback Machine copy of https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf, SHA-256 ef7ed6d08a5f99d0f0a0b08aff0284bc6670ee76def317804706d89474a0ca5e): it corrects Ex. 7.1 and the diagram of Ex. 7.9 but has no entry for Ex. 7.10
- the author-hosted draft of 29 August 2013 itself

### K2SymbolsBrauer/E-artin-base-change-multiplicity

First edition2006, p197 before and inLemma7.3.6, PDF211; SHA-2563697582f57a11547addeb8d5d63764d788b9d670e2bd76bd7401b9f3994f1e63; text and image read2026-10-02

For a general finite extension replace e_j by the composition length of the local Artin algebra R_j as a module over itself. For a simple extension the two coincide, so the earlier simple-polynomial formula is unaffected.

In characteristic p, F=Fp(s,t), E=F(s^(1/p),t^(1/p)), F′=E gives E⊗F E=E[X,Y]/(X^p,Y^p). Its length is p² whereas its maximal ideal has nilpotence exponent2p−1. On K0^M=Z, the base-change formula sends1 to the degree p² and the printed exponent gives2p−1. For p=2 these are4 and3; for p=3 they are9 and5. A tower of simple extensions multiplies the lengths, not the nilpotence exponents.

No matching correction located in the two author errata lists read; novelty is not established. Only the hashed first-edition copy is implicated, not the uninspected second-edition book.

- Author publications page https://pagine.dm.unipi.it/tamas/publ.html, accessed2026-10-02, identifies the first and second editions and their errata.
- https://pagine.dm.unipi.it/tamas/erratams.pdf (six pages, dated4December2020), fully read2026-10-02: no p197 entry. It does correct the inverse tame-symbol convention on p187.
- https://pagine.dm.unipi.it/tamas/erratams2nd.pdf (one page, dated4December2020), fully read2026-10-02: no matching multiplicity entry.

### Upstream note: ClassFieldTheory

The normalized finite-character evaluation identity is needed by T7/local-comparison. Required contract: inv(χ∪κ(b))=χ(localArtin(b))/m with arithmetic Frobenius, compatible with the existing finite local Artin and invariant maps. MilneCFT4.03 III.3.6 quotes Serre for the proof. This worker does not replan or edit Tau Ceti’s roadmap. Exporting only the quadratic comparison will not detect the inverse; use the F7((t)),m=3 test recorded in T7.
