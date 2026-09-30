# ArithmeticKTheory — N.1 to N.6

The blueprint for the first six layers of the K-theory of number fields and
S-integers. This document is definitive; the packet
`research/blueprint/packets/ArithmeticKTheory--N.1.json` is its machine form and
the suggested Lean file is a naming proposal, not an implementation. The last two
layers, regular primes and certified examples, are the companion packet
`ArithmeticKTheory--N.7`.

Pins: Mathlib `082e2d3`, Tau Ceti `f790474`.

## The sources

> Charles A. Weibel, *The K-book: An Introduction to Algebraic K-theory*. Author-hosted combined draft dated 29 August 2013 (published as Graduate Studies in Mathematics 145, American Mathematical Society, 2013)
> <https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf>,
> SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`, accessed 2026-09-25.

Sections read:

- I.3, Dedekind domains and Ex. I.3.8 (PDF pp. 29–31 and 37): the class group, finiteness of Pic(O_F), projectivity of torsion-free modules, relative class groups for a localisation.
- II.2.6–2.6.3 and Ex. II.2.2 (PDF pp. 82–83 and 86): K₀ of a one-dimensional noetherian ring, the projection formula and f_∗f^∗ = multiplication by [A].
- III.1.3.5–1.3.6, III.1.5.4, III.2.5–2.5.1 (PDF pp. 191, 193, 202–203): K₁ of fields, Bass–Milnor–Serre, SK₁ of the circle ring.
- III.6.5–6.5.1 (PDF p. 244): the localisation sequence for K₂ and K₂(ℚ).
- V.4.1–4.4, V.5.2, V.6.1–6.1.2 (PDF pp. 408–409, 413–414): dévissage, torsion modules as a colimit, the localisation sequence with coefficients, ∂(s) = [R/sR].
- V.6.6–6.6.4 (PDF pp. 417–418): the sequence (6.6), (6.6.1), the tame symbol, Corollary 6.6.2 and the transfer morphism (6.6.3)–(6.6.4).
- V.6.8, 6.8.1 and 6.8.2 with both proofs in full (PDF pp. 420–421).
- IV.1.12–1.13 (PDF p. 277; book p. 269): Quillen's finite-field calculation.
- IV.1.17–1.18, Regulator Maps 1.18.1 and Example 1.18.2 (PDF pp. 279–280; book pp. 271–272): Borel's theorems, the definition of an order, the degrees of the primitive generators, and the degree-one warning for group rings. The earlier entry's 'PDF pp. 270 to 271' is off by nine.
- IV.6.8–6.9 (PDF p. 333; book p. 325): Bass' conjecture, Quillen's criterion and Theorem 6.9. The earlier 'PDF p. 324' is off by nine.
- VI.1.4–1.7.1 (PDF pp. 474–476): Harris–Segal's Theorem 1.5, Corollary 1.5.2, the Tate twist µ(i) and the Galois module K_{2i−1}(F̄)_tors.
- VI.2 in full, through Exercise 2.6 (PDF pp. 477–483; book pp. 469–475): Definition 2.1, Examples 2.1.1–2.1.2, Remark 2.1.3, Proposition 2.2 with Lemma 2.2.1 and Example 2.2.2, exceptional fields, Proposition 2.3, Example 2.3.1, Lemma 2.4 with the Bernoulli numbers and Remark 2.4.2, the Harris–Segal Theorem 2.5 with its proof, Remark 2.5.1, Theorem 2.6 and Example 2.7. The earlier 'PDF pp. 469 to 473' is off by eight or nine.
- VI.8.1 and the Birch–Tate paragraph VI.8.6 (PDF pp. 521 and 523; book pp. 513 and 515). The earlier 'PDF pp. 512 to 514' is off by nine; VI.9.5 is on PDF p. 527.
- VI.8 (PDF pp. 521–524; book pp. 513–516), read by the review's checker C3: Classical Data 8.1 with (8.1.1), Theorem 8.2 with its whole proof, Corollary 8.3 and Examples 8.3.1–8.3.2, Theorem 8.4 with its proof and the preceding remark, 8.6–8.8 with the proof of 8.8, Exercises 8.1–8.6. The packet's earlier 'PDF pp. 512 to 514' are book pages.
- VI.9 (PDF pp. 525–534; book pp. 517–526): Theorem 9.1 with Variants 9.1.2–9.1.3, (9.2), Lemma 9.3, Theorem 9.4 with its proof, Theorem 9.5 with its proof and Example 9.5.1, 9.6 to Lemma 9.6.3, Theorem 9.7 (statement), Corollaries 9.8–9.10 with Examples 9.9.1–9.10.1 and Question 9.10.2, Theorem 9.11 with its proof, Theorem 9.12 with its proof, Exercises 9.1–9.6.
- Bibliography (PDF p. 576): [161] Rognes–Weibel, J. AMS 13 (2000); [225] Weibel, 'Higher wild kernels and divisibility in the K-theory of number fields', J. Pure Appl. Algebra 206 (2006) 222–244.
- Page convention: PDF page = book page + 8. The packet's locators labelled 'PDF p.' were book pages, some one page low (VI.8.4 is on book p. 514, VI.8.7–8.8 on p. 515, VI.9.5 on p. 519, VI.9.11 on p. 524, VI.9.12 on p. 525, V.6.8.2 on p. 413); the corrected locators give both.
- Re-read 2026-09-30 for the fix of RT-AREA-ktheory-1 (same file, SHA-256 a04f53c9…): IV.6.8–6.9 (PDF p. 333; book p. 325), Quillen's criterion and Theorem 6.9; VI.3.1 (PDF p. 483; book p. 475), Suslin's theorem on K_*(ℝ) with finite coefficients; VI.9.1–9.4 (PDF pp. 525–527; book pp. 517–519), the use of Suslin's calculation in the real-place spectral sequences; III.5.2.2 (PDF p. 226), III.6.2.1 (PDF p. 240) and Ex. III.6.4 (PDF p. 251; book p. 243), the order-two computation of K₂(ℤ), the real symbol and the surjection K₂(F) → {±1}^{r_1}.

> Bruno Kahn, *Around Quillen's theorem A*. arXiv:1108.2441v3 [math.KT], dated 2 July 2014
> <https://arxiv.org/pdf/1108.2441>,
> SHA-256 `71b5da651ba9feca4c1abcc58f566afbf11019dda465cbc3a95aace7cb1e2406`, accessed 2026-09-30.

Sections read:

- Introduction (pp. 1–2): the exact sequences of Quillen's Theorem 3 assemble into the rank spectral sequence.
- 1.3.5, 1.4.2–1.4.6 (pp. 5–7): homology with coefficients, the Grothendieck construction, Thomason's theorem, the spectral sequence E²_{p,q} = H_p(D, H_q(F_T)) ⇒ H_{p+q}(C).
- 2.1.4, 2.2.1–2.2.3, 2.3.1–2.3.7, 2.4.1 (pp. 8–12): reduced homology with coefficients, cellular functors, the homotopy cocartesian square and long exact sequence, the spectral sequence of a cellular filtration.
- 3.1–3.2 (pp. 13–14) in outline: Quillen's decomposition of T(V) and the Solomon–Tits theorem.
- 4.1–4.3.4 (pp. 15–18) in full: the rank filtration Q_n of Q(X), the groupoids Q_n − Q_{n−1}, pure subsheaves and subspaces (4.2.4), the comma categories as posets of proper layers (4.2.6), the Dedekind case (4.2.7), the fibres as suspended buildings (4.3.1–4.3.2), the E¹ term (4.3.3) and the comparison with Quillen's Theorem 3 (4.3.4).

> Andrew Putman and Daniel Studenmund, *The dualizing module and top-dimensional cohomology group of GL_n(O)*. arXiv:1909.01217v4 [math.NT], dated 23 April 2021
> <https://arxiv.org/pdf/1909.01217v4>,
> SHA-256 `3421bcfaffc1e05198ae8323971872ca3774bd73c067077e94f46ed5d073d7ad`, accessed 2026-09-30.

Sections read:

- §1 (pp. 2–5): the vcd of GL_n(O), the virtual duality H^{vcd−i}(G; M) ≅ H_i(G; M ⊗ D) for finite-index G (integral coefficients when G is torsion-free), the Tits building and Steinberg module, Example 1.4 (the untwisted Steinberg module is not the dualizing module of GL_2(ℤ)) and Theorem C.
- §2 (pp. 7–10): Proposition 2.1 (the Borel–Serre bordification of GL_n(O), its boundary ≃ T_n(K), its dimension, and orientation reversal exactly when n is even and χ(g) = −1), Lemmas 2.2–2.3 and the start of the proof of Theorem C.
- §4.1 (p. 17): intersections of subspaces of Q ⊗ K with a projective O-module Q are direct summands; Lemma 4.1, det(GL(P)) ⊂ O^× through an embedding GL(P) ↪ GL(O^m).

> Fei Sun, *Algebraic K-theory and modular symbols*. arXiv:1604.04700v1 [math.AT], dated 16 April 2016
> <https://arxiv.org/pdf/1604.04700>,
> SHA-256 `c0585949df902e30b7368c235210e8b20a0dea344ed88a9e7a65577ec681e793`, accessed 2026-09-30.

Sections read:

- pp. 4–7: the rank spectral sequence for torsion-free modules over an integral noetherian domain, the suspension model of the Tits building, the reduced Steinberg module (Definition 0.2) and the remark that unreduced homology is wrong in dimension two, and Quillen's conditions (1)–(2) with the Hochschild–Serre passage through a normal subgroup of finite index.

The K-book is the source of every layer; Kahn's note supplies the rank filtration and its spectral sequence that the K-book only names (N.3:finite-generation), Putman–Studenmund the correctly twisted dualizing module of GL_n(O) on which the arithmetic input requested from BorelRegulators R.1 rests, and Sun's paper the reduced Steinberg module in rank two. Quillen's 1973 paper itself was not obtained (it is behind a publisher's wall); where a node relies on a statement of it, the statement is taken from Kahn's citation and says so.

## What the pinned libraries already have

`AUDIT-27` records all six texts as *not built*; there is no integrated decomposition for this roadmap. Every declaration below was read at the pinned commits and is cited, never re-planned:

- `mathlib:ClassGroup` (`Mathlib/RingTheory/ClassGroup/Basic.lean`) — The ideal class group of a domain: invertible fractional ideals modulo principal ones; the torsion of the degree-zero computation.
- `mathlib:IsCyclotomicExtension` (`Mathlib/NumberTheory/Cyclotomic/Basic.lean`) — The predicate that B is generated over A by primitive n-th roots of unity for n in S; the cyclotomic extensions in which N.4 computes the invariant.
- `mathlib:IsDedekindDomain.HeightOneSpectrum` (`Mathlib/RingTheory/DedekindDomain/Ideal/Lemmas.lean`) — The nonzero prime ideals of a Dedekind domain, which index the localisation sequence.
- `mathlib:IsLocalization` (`Mathlib/RingTheory/Localization/Defs.lean`) — The localisation predicate (an abbrev for IsLocalization'), in which N.1 states that the S-integers of a number field are a localisation of the ring of integers.
- `mathlib:NumberField.InfinitePlace.nrRealPlaces` (`Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean`) — r_1, the number of real infinite places.
- `mathlib:NumberField.IsTotallyComplex` (`Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean`) — The class asserting that every infinite place is complex: the totally imaginary hypothesis of N.5 and N.6.
- `mathlib:NumberField.RingOfIntegers` (`Mathlib/NumberTheory/NumberField/Basic.lean`) — The ring of integers 𝓞 K (integral closure of ℤ), the base of every carrier in this packet.
- `mathlib:NumberField.Units.rank` (`Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean`) — Only the number card (InfinitePlace K) − 1 = r_1 + r_2 − 1 (a definition). Dirichlet's theorem that it is the rank of the units is NumberField.Units.finrank_modTorsion, which the nodes citing the unit rank should add.
- `mathlib:NumberField.Units.torsion` (`Mathlib/NumberTheory/NumberField/Units/Basic.lean`) — The torsion subgroup of (𝓞 K)ˣ, that is the roots of unity μ(F), cyclic; N.4 insists it is not W_i(F).
- `mathlib:Set.integer` (`Mathlib/RingTheory/DedekindDomain/SInteger.lean`) — The subalgebra of S-integers of the fraction field of a Dedekind domain: v(x) ≤ 1 for every v ∉ S.
- `mathlib:Set.unit` (`Mathlib/RingTheory/DedekindDomain/SInteger.lean`) — The subgroup of S-units: v(x) = 1 for every v ∉ S.
- `mathlib:Set.unitEquivUnitsInteger` (`Mathlib/RingTheory/DedekindDomain/SInteger.lean`) — S.unit K ≃* (S.integer K)ˣ, the S-units as the units of the ring of S-integers.
- `mathlib:rootsOfUnity` (`Mathlib/RingTheory/RootsOfUnity/Basic.lean`) — The subgroup of k-th roots of unity of a commutative monoid, the untwisted coefficients of N.4.
- `tauceti:IsDedekindDomain.finite_integer_classGroup` (`TauCeti/RingTheory/DedekindDomain/SInteger/ClassGroup.lean`) — Instance: Finite (ClassGroup R) → Finite (ClassGroup (S.integer K)).
- `tauceti:IsDedekindDomain.integerClassGroupEquiv` (`TauCeti/RingTheory/DedekindDomain/SInteger/ClassGroup.lean`) — ClassGroup (S.integer K) ≃* ClassGroup R ⧸ ⟨classes of the primes of S⟩.
- `tauceti:IsDedekindDomain.ker_integer_extendedHom` (`TauCeti/RingTheory/DedekindDomain/SInteger/ClassGroup.lean`) — The kernel of extension Cl(R) → Cl(O_S) is generated by the classes of the primes of S: exactness at Cl(R) of the degree-zero row in classical form.
- `tauceti:Set.unitValuation_ker` (`TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean`) — The kernel of the valuation map S.unit K → (S → Multiplicative ℤ) is the ∅-units, i.e. exactness of 1 → Rˣ → O_Sˣ → ∏_{v∈S} ℤ at O_Sˣ only; exactness at ℤ^S (image equal to the kernel of ℤ^S → Cl(R)) is not pinned, and S need not be finite.
- `tauceti:Set.unit_mono` (`TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean`) — S ⊆ S' → S.unit K ≤ S'.unit K, monotonicity of the S-unit group.
- `tauceti:TauCeti.KummerCoeff` (`TauCeti/FieldTheory/GaloisCohomology/Coefficients.lean`) — For each n, the n-th roots of unity μ_n of the separable closure, written additively, as a discrete G_K-module; the untwisted finite coefficients (not all roots of unity at once).
- `mathlib:IsDedekindDomain.HeightOneSpectrum.Support.finite` (`Mathlib/RingTheory/DedekindDomain/FiniteAdeleRing.lean`) — An element of K has v(x) > 1 at only finitely many height-one primes.
- `mathlib:IsDedekindDomain.HeightOneSpectrum.mem_integers_of_valuation_le_one` (`Mathlib/RingTheory/DedekindDomain/AdicValuation.lean`) — An element of K with v(x) ≤ 1 at every height-one prime lies in R.
- `mathlib:IsDedekindDomain.HeightOneSpectrum.valuation_lt_one_iff_mem` (`Mathlib/RingTheory/DedekindDomain/AdicValuation.lean`) — v(r) < 1 iff r ∈ v, for r ∈ R.
- `mathlib:IsDedekindDomain.integer_empty` (`Mathlib/RingTheory/DedekindDomain/SInteger.lean`) — The ∅-integers are R (as the bottom R-subalgebra of K).
- `tauceti:Set.mem_integer_iff` (`TauCeti/RingTheory/DedekindDomain/SInteger/Basic.lean`) — Membership in Set.integer is the valuation condition.
- `tauceti:IsDedekindDomain.integer_map_asIdeal_eq_top` (`TauCeti/RingTheory/DedekindDomain/SInteger/Basic.lean`) — For v ∈ S, v extends to the unit ideal of the S-integers.
- `mathlib:NumberField.RingOfIntegers.instFintypeClassGroup` (`Mathlib/NumberTheory/NumberField/ClassNumber.lean`) — Finiteness of the class group of 𝓞_K: hypothesis (1) of Quillen's criterion.
- `mathlib:isOfFinOrder_of_finite` (`Mathlib/GroupTheory/OrderOfElement.lean`) — Every element of a finite group has finite order.
- `mathlib:ClassGroup.mk0_eq_one_iff` (`Mathlib/RingTheory/ClassGroup/Basic.lean`) — The class of a nonzero ideal is trivial iff the ideal is principal.
- `mathlib:IsLocalization.isLocalization_of_submonoid_le` (`Mathlib/RingTheory/Localization/LocalizationLocalization.lean`) — If M ≤ N, IsLocalization M S and IsLocalization N T with a scalar tower, then T is the localisation of S at the image of N.
- `mathlib:IsIntegralClosure` (`Mathlib/RingTheory/IntegralClosure/IsIntegralClosure/Defs.lean`) — The predicate that a ring is the integral closure of R in an algebra.
- `mathlib:IsIntegralClosure.finite` (`Mathlib/RingTheory/DedekindDomain/IntegralClosure.lean`) — The integral closure of an integrally closed noetherian domain in a finite separable extension of its fraction field is finite over it.
- `mathlib:IsIntegralClosure.isLocalization` (`Mathlib/RingTheory/DedekindDomain/IntegralClosure.lean`) — L is the localisation of the integral closure at the non-zero elements of the base.
- `mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot` (`Mathlib/RingTheory/Flat/TorsionFree.lean`) — A module over a Dedekind domain is flat iff it is torsion-free.
- `mathlib:Module.Flat.projective_of_finitePresentation` (`Mathlib/RingTheory/Flat/EquationalCriterion.lean`) — A flat finitely presented module is projective.
- `mathlib:ClassGroup.extendedHom` (`Mathlib/RingTheory/ClassGroup/ExtendedHom.lean`) — Extension of ideal classes along an injective extension of domains.
- `tauceti:ClassGroup.relNorm` (`TauCeti/RingTheory/ClassGroup/RelNorm.lean`) — The relative norm on class groups of a finite extension of Dedekind domains.
- `tauceti:ClassGroup.relNorm_extendedHom` (`TauCeti/RingTheory/ClassGroup/RelNorm.lean`) — relNorm (extendedHom c) = c ^ finrank: the composite on class groups.
- `mathlib:Algebra.norm` (`Mathlib/RingTheory/Norm/Defs.lean`) — The field norm of a finite extension.
- `tauceti:Set.unit_fg_of_units` (`TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean`) — Instance: [Finite S] [Monoid.FG Rˣ] → Group.FG (S.unit K), finite generation of the S-units (the file notes it is not Dirichlet's S-unit theorem: no rank); to be cited where the nodes need finite generation for a general S.
- `mathlib:padicValRat` (`Mathlib/NumberTheory/Padics/PadicVal/Basic.lean`) — The p-adic valuation on ℚ.
- `mathlib:Nat.exists_infinite_primes` (`Mathlib/Data/Nat/Prime/Infinite.lean`) — There are infinitely many primes.
- `tauceti:IsDedekindDomain.HeightOneSpectrum.finite_setOfPred_valuation_ne_one` (`TauCeti/RingTheory/DedekindDomain/SelmerGroup.lean`) — A nonzero element of K has v(x) ≠ 1 at only finitely many primes: finite support of the divisor.
- `tauceti:IsDedekindDomain.integerHeightOneSpectrumEquiv` (`TauCeti/RingTheory/DedekindDomain/SInteger/Spectrum.lean`) — The height-one primes of the S-integers are the primes of R not in S, via v ↦ v·O_S.
- `tauceti:IsDedekindDomain.integer_extendedHom_surjective` (`TauCeti/RingTheory/DedekindDomain/SInteger/ClassGroup.lean`) — Extension of ideal classes Cl(R) → Cl(O_S) is surjective.
- `mathlib:ClassGroup.equivPic` (`Mathlib/RingTheory/PicardGroup.lean`) — The class group of a domain is its Picard group.
- `mathlib:NumberField.InfinitePlace.nrComplexPlaces` (`Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean`) — r_2, the number of complex infinite places, the rank of the odd K-groups of a totally imaginary field.
- `mathlib:cyclotomicCharacter` (`Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean`) — The ℓ-adic cyclotomic character (L ≃+* L) →* ℤ_[ℓ]ˣ, through which G_F acts on ℚ_ℓ/ℤ_ℓ(i) by χ_ℓ^i.
- `mathlib:modularCyclotomicCharacter` (`Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean`) — The mod-n cyclotomic character (L ≃+* L) →* (ZMod n)ˣ, with g t = t ^ χ(g) on n-th roots of unity (spec, line 222).
- `mathlib:isCyclic_subgroup_units` (`Mathlib/RingTheory/IntegralDomain.lean`) — A finite subgroup of the units of an integral domain is cyclic; gives cyclicity of W_i(F).
- `mathlib:CommMonoid.primaryComponent` (`Mathlib/GroupTheory/Torsion.lean`) — The p-primary component (additive form by to_additive), for W_i^{(ℓ)}(F).
- `mathlib:IsPrimitiveRoot.autToPow_injective` (`Mathlib/NumberTheory/Cyclotomic/Gal.lean`) — Gal(L/K) → (ZMod n)ˣ is injective for a cyclotomic extension L/K.
- `mathlib:IsPrimitiveRoot.autToPow_eq_modularCyclotomicCharacter` (`Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean`) — autToPow agrees with the modular cyclotomic character.
- `mathlib:Monoid.exponent` (`Mathlib/GroupTheory/Exponent.lean`) — The exponent of a group, for the criterion of Lemma VI.2.2.1.
- `mathlib:ZMod.isCyclic_units_of_prime_pow` (`Mathlib/RingTheory/ZMod/UnitsCyclic.lean`) — (ZMod (p^n))ˣ is cyclic for an odd prime p.
- `mathlib:ZMod.isCyclic_units_two_pow_iff` (`Mathlib/RingTheory/ZMod/UnitsCyclic.lean`) — (ZMod (2^n))ˣ is cyclic iff n ≤ 2; the reason exceptional fields exist.
- `mathlib:IsCyclotomicExtension.autEquivPow` (`Mathlib/NumberTheory/Cyclotomic/Gal.lean`) — Gal(L/K) ≃* (ZMod n)ˣ when the cyclotomic polynomial is irreducible over K (for K = ℚ always).
- `mathlib:IsCyclotomicExtension.Rat.finrank` (`Mathlib/NumberTheory/NumberField/Cyclotomic/Basic.lean`) — [ℚ(ζ_k) : ℚ] = φ(k); gives r = ℓ − 1 over ℚ and the degree bound in the finiteness theorem.
- `mathlib:Module.finrank_mul_finrank` (`Mathlib/LinearAlgebra/Dimension/Free.lean`) — The tower law for finrank.
- `mathlib:AddCommGroup.equiv_free_prod_directSum_zmod` (`Mathlib/GroupTheory/FiniteAbelian/Basic.lean`) — Structure theorem: a finitely generated abelian group is ℤ^n × a finite direct sum of cyclic groups of prime-power order; the free-plus-torsion shape of the tables.
- `tauceti:TauCeti.AbsoluteGaloisGroup` (`TauCeti/FieldTheory/Galois/AbsoluteGaloisGroup.lean`) — G_K = Gal(Kˢ/K), the group at which Tau Ceti states Galois cohomology.
- `tauceti:TauCeti.ContCohomology.H0` (`TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean`) — H⁰(G, M) = FixedPoints.addSubgroup G M, the carrier of W_i(F).
- `tauceti:TauCeti.ContCohomology.explicitRes0` (`TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean`) — Restriction H⁰(G, M) → H⁰(U, M), the inclusion of fixed points.
- `tauceti:TauCeti.ContCohomology.explicitCor0` (`TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction.lean`) — Corestriction H⁰(U, M) → H⁰(G, M) for a finite-index subgroup, the norm over G/U.
- `tauceti:TauCeti.ContCohomology.explicitCor0_comp_res0` (`TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction.lean`) — cor⁰ ∘ res⁰ = (G : U) • id.
- `mathlib:NumberField.nrRealPlaces_eq_zero_iff` (`Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean`) — nrRealPlaces K = 0 ↔ IsTotallyComplex K, connecting the hypothesis r_1 = 0 with the class.
- `mathlib:Module.Relations` (`Mathlib/Algebra/Module/Presentation/Basic.lean`) — Generators and relations for a module, with Quotient, Solution and IsPresentation; the base of K2SymbolsBrauer T.5's order certificates.
- `mathlib:Module.Presentation` (`Mathlib/Algebra/Module/Presentation/Basic.lean`) — A presentation of a module (relations with a solution that is a presentation).
- `mathlib:IsDedekindDomain.selmerGroup` (`Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean`) — K⟮S, n⟯: classes in Kˣ/(Kˣ)^n with valuation ≡ 0 mod n at every v ∉ S; for n = 2 and 1/2 ∈ O_S this is H^1_et(O_S; μ_2), the domain of α^1 in the signature defect.
- `mathlib:DivisibleBy` (`Mathlib/GroupTheory/Divisible.lean`) — The class of divisible groups (a division function with n • div a n = a for n ≠ 0); there is no subgroup of divisible elements, which N.6/divisible-subgroup adds.
- `tauceti:TauCeti.GlobalNumberFields.signHom` (`TauCeti/NumberTheory/NumberField/Units/Signature/Integer.lean`) — The total sign homomorphism Kˣ → ({real places} → ℤˣ), the map α^1 on classes of elements.
- `tauceti:NumberField.fieldUnitSignature_surjective` (`TauCeti/NumberTheory/NumberField/Units/Signature/Surjective.lean`) — The signature map Kˣ → ∏_{real} ℝˣ/ℝ_{>0} is surjective (approximation at the real places); gives j(O_S) = 0 for S large.
- `tauceti:NumberField.NarrowClassGroup.twoRank` (`TauCeti/NumberTheory/NumberField/NarrowClassGroup/ElementaryTwoQuotient.lean`) — dim_{ZMod 2} Cl⁺(K)/Cl⁺(K)², the u of Definition VI.9.6.1 for R = 𝓞 K.
- `tauceti:TauCeti.ClassGroup.twoRank` (`TauCeti/NumberTheory/ClassGroup/ElementaryTwoQuotient.lean`) — dim_{ZMod 2} Cl(R)/Cl(R)², the t of Definition VI.9.6.1.
- `mathlib:groupHomology` (`Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean`) — groupHomology A n : ModuleCat k, the homology of the inhomogeneous chains of a k-linear G-representation A (line 230); with k = ℤ and A the Steinberg module of Aut(P) it is the E¹ term of the rank spectral sequence.
- `mathlib:Submodule` (`Mathlib/Algebra/Module/Submodule/Defs.lean`) — Submodules (for a field, subspaces), the carrier of the layer poset J(V) and of the flags of the Tits building (line 41).
- `mathlib:Module.Relations.Solution` (`Mathlib/Algebra/Module/Presentation/Basic.lean`) — Solutions in a module M of the equations of relations : Relations A (line 127).
- `mathlib:Module.Relations.Quotient` (`Mathlib/Algebra/Module/Presentation/Basic.lean`) — The module presented by generators and relations, (G →₀ A) ⧸ span(range relation) (line 70).
- `mathlib:Module.Relations.Solution.fromQuotient` (`Mathlib/Algebra/Module/Presentation/Basic.lean`) — The linear map relations.Quotient →ₗ M induced by a solution (line 172).
- `mathlib:Module.Relations.Solution.surjective_fromQuotient_iff_surjective_π` (`Mathlib/Algebra/Module/Presentation/Basic.lean`) — fromQuotient is onto iff the map π from the free module is onto (line 268).
- `mathlib:Module.Relations.Solution.surjective_π_iff_span_eq_top` (`Mathlib/Algebra/Module/Presentation/Basic.lean`) — π is onto iff the values of the generators span (line 274).
- `mathlib:Module.Relations.Solution.IsPresentation` (`Mathlib/Algebra/Module/Presentation/Basic.lean`) — The solution is a presentation: fromQuotient is bijective (line 283).
- `mathlib:Module.Presentation.ofIsPresentation` (`Mathlib/Algebra/Module/Presentation/Basic.lean`) — The Module.Presentation built from a solution with IsPresentation (line 501).
- `mathlib:Function.Surjective.bijective_of_nat_card_le` (`Mathlib/SetTheory/Cardinal/Finite.lean`) — A surjection f : α → β with α finite and Nat.card α ≤ Nat.card β is bijective (line 132).

Absent at both pins, and therefore this blueprint's own work or an import: any K-group beyond degree zero; the localisation sequence; the Q-construction and its rank filtration; the Tits building and the Steinberg module; `ℚ/ℤ(j)` and every twisted coefficient module; étale cohomology of arithmetic schemes; the tame and wild kernels; the stable general linear group and the plus construction; and Quillen's computation of `K_*(F_q)`.

## N.1 — Arithmetic carriers and degree zero/one

The carrier, and the two computations this layer imports.

**What N.1 owns** is the carrier: for a *number field* the ring of S-integers is a localisation of the ring of integers — Tau Ceti's own file records that this is false for a general Dedekind domain — together with independence of the presentation and monotonicity in S. **What it imports** are `K₀ ≅ ℤ ⊕ Cl` from `KTheoryLowDegrees:Z.4` and `K₁ ≅ O_{F,S}ˣ` from `KTheoryLowDegrees:U.4`.

**`K₁(F) = Fˣ` is not the S-unit group.** The first is not finitely generated, the second is.

Coverage: **source_decomposed**.

Seven nodes. The carrier is Mathlib's Set.integer, already a Dedekind domain with its class group computed in Tau Ceti, so N.1 plans the three statements its text asks for about it: the criterion for a submonoid to present O_S as a localisation, which gives independence of the presentation (N.1/S-integers-as-a-localisation); that M_S presents it when the class group is torsion, as for number fields (N.1/S-integers-localisation-of-torsion-class-group); and compatibility with enlarging S (N.1/S-integers-monotone). K₀(O_{F,S}) ≅ ℤ ⊕ Cl(O_{F,S}) and K₁(O_{F,S}) ≅ O_{F,S}^× are imported ('Import Z and U'): the former node N.1/K0-of-S-integers was a register of Z.4's statement and is deleted in favour of the request to KTheoryLowDegrees Z.4, and U.4's statement is imported by N.1/K1-of-S-integers-and-the-determinant, which keeps K₁(F) = F^× distinct from the finitely generated S-units by proving that F^× is not finitely generated. The comparison of norms and extension of ideals with transfer and pullback is N.1/norms-transfers-and-pullbacks on K₀, with the Steinitz class, and N.1/transfer-and-norm-on-units on K₁, both resting on N.1/S-integers-in-a-finite-extension.

### When the ring of S-integers is a localisation, and independence of the presentation

`ArithmeticKTheory:N.1/S-integers-as-a-localisation` · *theorem*

Let R be a Dedekind domain with fraction field K, S any set of height-one primes of R, and O_S = S.integer K the ring of S-integers (Mathlib's Set.integer: the x ∈ K with v(x) ≤ 1 for every v ∉ S), an R-subalgebra of K. Let M_S ⊆ R be the submonoid of the r ∈ R whose image in O_S is a unit, equivalently r ≠ 0 and v(r) = 1 for every v ∉ S (the preimage of the units of O_S, Mathlib's Submonoid.comap of IsUnit.submonoid). For a submonoid M of R the following are equivalent: (i) O_S is the localisation of R at M (Mathlib's IsLocalization M O_S); (ii) M ⊆ M_S and every v ∈ S contains an element of M. Consequently a presentation of O_S as a localisation of R, when one exists, is any submonoid satisfying (ii), and every such presentation yields the same subring O_S of K: the ring does not depend on the presentation. No finiteness of S is needed. The carrier itself, its Dedekind property and its class group are already in the pinned libraries and are not re-planned.

**Hypotheses.**

- R is a Dedekind domain (Mathlib's IsDedekindDomain) with fraction field K; valuations are Mathlib's HeightOneSpectrum.valuation, written multiplicatively, so v(r) ≤ 1 for r ∈ R and v(r) < 1 iff r ∈ v.
- S is an arbitrary set of height-one primes; the stage's O_{F,S} is the case R = 𝓞_F, S finite.
- O_S is Mathlib's Set.integer S K; Tau Ceti already proves that it is a Dedekind domain (TauCeti/RingTheory/DedekindDomain/SInteger/Basic.lean:271, an anonymous instance) and computes its class group (IsDedekindDomain.integerClassGroupEquiv), so neither is planned here.
- Whether (ii) can be met is a class-group question: the next node shows M_S meets it when Cl(R) is torsion, and Tau Ceti's SInteger/Basic.lean docstring gives a Dedekind domain with Cl(R) ≅ ℤ where it cannot.

**Proof outline.**

1. (i) ⇒ (ii), first half: the elements of M become units of O_S, and a unit of O_S has valuation 1 at every v ∉ S (Set.unitEquivUnitsInteger, Set.mem_integer_iff), so M ⊆ M_S.
2. (i) ⇒ (ii), second half: if some v ∈ S met M in no element, then M ⊆ R ∖ v, so M⁻¹R ⊆ R_v and the extension of v to M⁻¹R is proper; but v·O_S = O_S (Tau Ceti's IsDedekindDomain.integer_map_asIdeal_eq_top), a contradiction.
3. (ii) ⇒ (i), units: M ⊆ M_S. Kernel: R → K is injective, so the kernel condition of IsLocalization is vacuous.
4. (ii) ⇒ (i), surjectivity: for x ∈ O_S the set of v with v(x) > 1 is finite (Mathlib's HeightOneSpectrum.Support.finite) and contained in S; for each such v choose m_v ∈ M ∩ v, so v(m_v) < 1 (valuation_lt_one_iff_mem) and w(m_v) ≤ 1 for all w; for k large, y = x·∏ m_v^k has w(y) ≤ 1 for every w, hence y ∈ R (mem_integers_of_valuation_le_one) and x = y/∏ m_v^k.
5. Independence: under (ii) the ring M⁻¹R is, as a subring of K, the fixed ring S.integer K, whatever M is.

**Acceptance.**

- S = ∅: M = {1} satisfies (ii) vacuously and O_∅ = R, which is Mathlib's IsDedekindDomain.integer_empty.
- S = all height-one primes: M = R ∖ {0} satisfies (ii) and O_S = K, Mathlib's IsDedekindDomain.integer_univ.
- R = ℤ, S = {(p)}: M = {p^k} satisfies (ii), so O_S = ℤ[1/p]; M = {1} does not.
- R = 𝓞 of ℚ(√−5), S = {𝔭₂} with 𝔭₂ = (2, 1 + √−5) non-principal and 𝔭₂² = (2): M = {2^k} satisfies (ii) (2 ∈ 𝔭₂ and v(2) = 1 for v ≠ 𝔭₂), so O_S = 𝓞[1/2]; M = {1} does not.
- If Cl(R) ≅ ℤ is generated by the class of a prime v and S = {v} (Tau Ceti's docstring example), then M_S = R^× and no M satisfies (ii): O_S is not a localisation of R.

**Prerequisites.** `mathlib:Set.integer`, `mathlib:IsLocalization`, `mathlib:IsDedekindDomain.HeightOneSpectrum`, `mathlib:IsDedekindDomain.HeightOneSpectrum.Support.finite`, `mathlib:IsDedekindDomain.HeightOneSpectrum.mem_integers_of_valuation_le_one`, `mathlib:IsDedekindDomain.HeightOneSpectrum.valuation_lt_one_iff_mem`, `mathlib:Set.unitEquivUnitsInteger`, `tauceti:Set.mem_integer_iff`, `tauceti:IsDedekindDomain.integer_map_asIdeal_eq_top`, `mathlib:IsDedekindDomain.integer_empty`

**Sources.**

- K-book, Ex. I.3.8, Relative Class groups (PDF p. 37; book p. 29). The K-book treats rings of S-integers as localisations S⁻¹R whose lost primes are those meeting the multiplicative set; condition (ii) is that property for a submonoid of R. The K-book states no theorem of this form: the node follows the library (Mathlib's Set.integer, and Tau Ceti's SInteger/Basic.lean docstring, which records that O_S need not be a localisation).

  > 3.8. Relative Class groups. Suppose that R is a Krull domain and that R_S = S^{−1}R for some multiplicatively closed set S in R. Let D(R, R_S) denote the free abelian group on the height 1 primes 𝔭 of R such that 𝔭 ∩ S ≠ φ.

### K₁ of the S-integers inside K₁ of the field: the S-units, and a group that is not finitely generated

`ArithmeticKTheory:N.1/K1-of-S-integers-and-the-determinant` · *comparison*

Let F be a number field and S a finite set of nonzero primes of 𝓞_F. Under the determinant identifications K₁(O_{F,S}) ≅ O_{F,S}^× (KTheoryLowDegrees U.4, Bass–Milnor–Serre) and K₁(F) ≅ F^× (KTheoryLowDegrees U.3), the map K₁(O_{F,S}) → K₁(F) is the inclusion of the S-unit group (Mathlib's Set.unit S F, identified with (S.integer F)^× by Set.unitEquivUnitsInteger). Its image is finitely generated (Tau Ceti's Set.unit_fg_of_units, from Mathlib's Monoid.FG (𝓞 F)^×) of rank r₁ + r₂ + |S| − 1 with torsion μ(F) (U.4), whereas F^× = K₁(F) is not finitely generated. So the map is injective but never surjective, and no statement about the rank or the finite generation of K₁(O_{F,S}) transfers to K₁(F). The identifications and the rank are imported from U.4; what this node adds is that F^× is not finitely generated and the comparison of the two groups.

**Hypotheses.**

- F is a number field, S a finite set of nonzero primes of 𝓞_F; O_{F,S} = S.integer F.
- SK₁(O_{F,S}) = 0, the determinant identification and the S-unit rank are KTheoryLowDegrees U.4's; K₁ of a field is U.3's ('Prove SK₁ vanishing for fields').
- Mathlib has Dirichlet's theorem only for S = ∅ (NumberField.Units.rank = r₁ + r₂ − 1); Tau Ceti's Set.unit_fg_of_units gives finite generation for finite S but no rank (TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean:195–207).

**Proof outline.**

1. Import from U.4 the determinant isomorphism K₁(O_{F,S}) ≅ O_{F,S}^×, the S-unit rank and the comparison with the unit inclusion into K₁(F); import K₁(F) ≅ F^× from U.3.
2. Identify O_{F,S}^× with Mathlib's Set.unit S F (Set.unitEquivUnitsInteger); finite generation is Tau Ceti's Set.unit_fg_of_units with Mathlib's instance Monoid.FG (𝓞 F)^×.
3. F^× is not finitely generated: ℚ^× ⊆ F^×, and ℚ^× maps onto the free abelian group ⊕_{p prime} ℤ by the p-adic valuations (padicValRat; p ↦ e_p), which has infinite rank since there are infinitely many primes (Nat.exists_infinite_primes); a subgroup of a finitely generated abelian group is finitely generated (ℤ is noetherian), and a quotient of one is too.
4. Hence the inclusion O_{F,S}^× ⊂ F^× is proper, and K₁(O_{F,S}) → K₁(F) is injective with a finitely generated image in a group that is not finitely generated.

**Acceptance.**

- F = ℚ, S = ∅: K₁(ℤ) = {±1} → K₁(ℚ) = ℚ^× is the inclusion of {±1} (III.1.3.5).
- F = ℚ, S = {p}: the image is {±1} × p^ℤ, of rank 1 = r₁ + r₂ + |S| − 1.
- F^× is not finitely generated, already for F = ℚ.
- The rank r₁ + r₂ + |S| − 1 is U.4's; Classical Data VI.8.1 misprints it as r₂ + |S| − 1 (known erratum; see sourceIssues).

**Prerequisites.** `KTheoryLowDegrees:U.4`, `KTheoryLowDegrees:U.3`, `mathlib:Set.unit`, `mathlib:Set.unitEquivUnitsInteger`, `tauceti:Set.unit_fg_of_units`, `mathlib:NumberField.Units.rank`, `mathlib:NumberField.Units.torsion`, `mathlib:padicValRat`, `mathlib:Nat.exists_infinite_primes`

**Sources.**

- K-book, III.1.3.5 (PDF p. 191; book p. 183). K₁ of the field is its multiplicative group.

  > Example 1.3.5. If F is a field then K1(F) = F×, because we have already seen that E(F) = SL(F).

- K-book, III.1.3.6 (PDF p. 191; book p. 183). Bass–Milnor–Serre: K₁ of the S-integers is their unit group; this is the part imported from U.4.

  > Example 1.3.6. If F is a finite field extension of Q (a number field) and R is an integrally closed subring of F, then Bass, Milnor and Serre proved in [19, 4.3] that SK1(R) = 0, so that K1(R) ≅ R×.

- K-book, III.1.3.6 (PDF p. 191; book p. 183). Finite generation and the rank s − 1 of K₁(O_{F,S}), with s = r₁ + r₂ + |S| the places at infinity for O_{F,S}; the finitely generated group this node contrasts with F^×.

  > We mention that if R is finitely generated over Z then, by the Dirichlet Unit Theorem, K1(R) = R× is a finitely generated abelian group isomorphic to µ(F) ⊕ Z^{s−1}, where µ(F) denotes the cyclic group of all roots of unity in F and s is the number of “places at infinity” for R.

### Extension of ideals and the relative norm against pullback and transfer on K₀ of S-integers

`ArithmeticKTheory:N.1/norms-transfers-and-pullbacks` · *comparison*

Let F′/F be an extension of number fields of degree d, S a finite set of nonzero primes of 𝓞_F, S′ the primes of 𝓞_{F′} over S, and i : O_{F,S} → O_{F′,S′} the inclusion, which makes O_{F′,S′} a finitely generated projective O_{F,S}-module of rank d (N.1/S-integers-in-a-finite-extension). Write K₀ ≅ ℤ ⊕ Cl via (rank, det) (KTheoryLowDegrees Z.4), Cl multiplicatively, and let 𝔰 = det_{O_{F,S}}(O_{F′,S′}) ∈ Cl(O_{F,S}) be the Steinitz class. Then the pullback i^* (base change) is (n, c) ↦ (n, ext(c)), with ext Mathlib's ClassGroup.extendedHom (extension of ideals), and the transfer i_* (restriction of scalars) is (n, c′) ↦ (d·n, N(c′)·𝔰^n), with N Tau Ceti's ClassGroup.relNorm (the relative norm), by Z.4's formula det(Res P) = Norm(det P)·𝔰^{rank P}. Consequently i_*∘i^* is multiplication by the class [O_{F′,S′}] = (d, 𝔰) ∈ K₀(O_{F,S}): (n, c) ↦ (d·n, c^d·𝔰^n). On the class-group summand it is c ↦ c^d (Tau Ceti's ClassGroup.relNorm_extendedHom), but on K₀ it is multiplication by the degree only when 𝔰 = 1.

**Hypotheses.**

- F′/F is a finite extension of number fields (hence separable) of degree d; S is finite and S′ is the set of primes of 𝓞_{F′} lying over a prime of S.
- K₀ ≅ ℤ ⊕ Pic by rank and determinant, the comparison of Pic with the class group, and the restriction-of-scalars determinant formula are KTheoryLowDegrees Z.4's ('The transfer of an ideal class requires the determinant/norm formula; it is not just multiplication by the extension degree on every summand'). The projection formula against K₀ is U.5's.
- The transfer exists because O_{F′,S′} is finitely generated projective over O_{F,S}; that is the lemma N.1/S-integers-in-a-finite-extension, not an assumption.

**Proof outline.**

1. Pullback: base change P ↦ P ⊗ O_{F′,S′} preserves rank and sends det P to its extension, which on classes is ClassGroup.extendedHom.
2. Transfer: restriction of scalars sends a projective of rank n to one of rank d·n with determinant Norm(det P)·𝔰^n (Z.4's formula); on the rank-zero part this is ClassGroup.relNorm.
3. Composite: i_*i^*(n, c) = (d·n, N(ext c)·𝔰^n) = (d·n, c^d·𝔰^n) by relNorm_extendedHom; equivalently i_*i^* is multiplication by i_*(1) = [O_{F′,S′}] (projection formula, U.5; Ex. II.2.2(b)).
4. Compare with the K₀ ring structure of Z.4, (m, a)(n, b) = (mn, a^n b^m): multiplication by (d, 𝔰) is the displayed map.

**Acceptance.**

- F = ℚ, F′ = ℚ(i), S = {2}: O_{F,S} = ℤ[1/2], O_{F′,S′} = ℤ[i][1/2] is free with basis 1, i, so 𝔰 = 1 and i_*i^* is multiplication by 2 on K₀(ℤ[1/2]) ≅ ℤ.
- On the class-group summand i_*i^* is c ↦ c^d for every extension (ClassGroup.relNorm_extendedHom).
- i_*(1) = (d, 𝔰), not (d, 1) in general: a formalisation that makes i_*i^* multiplication by d on all of K₀ is wrong whenever the Steinitz class is non-trivial.
- i^* on Cl(O_{F,S}) is compatible with Tau Ceti's integerClassGroupEquiv for F and F′.

**Prerequisites.** `ArithmeticKTheory:N.1/S-integers-in-a-finite-extension`, `KTheoryLowDegrees:Z.4/rank-pic-equivalence`, `KTheoryLowDegrees:Z.4`, `KTheoryLowDegrees:U.5`, `mathlib:ClassGroup.extendedHom`, `tauceti:ClassGroup.relNorm`, `tauceti:ClassGroup.relNorm_extendedHom`, `tauceti:IsDedekindDomain.integerClassGroupEquiv`

**Sources.**

- K-book, Ex. II.2.2, Projection Formula (PDF p. 86; book p. 78). The setting: A = O_{F′,S′} is finitely generated projective of rank d over R = O_{F,S}.

  > 2.2. Projection Formula. Let R be a commutative ring, and A an R-algebra which as an R-module is finitely generated projective of rank n.

- K-book, Ex. II.2.2(b) (PDF p. 86; book p. 78). The composite f_∗f^∗ is multiplication by the class [A], not by the rank: the source of the Steinitz-class correction.

  > (b) Show that both compositions f^∗f_∗ and f_∗f^∗ are multiplication by [A].

- K-book, V.6.6.3 (PDF p. 418; book p. 410). Restriction of scalars along R ⊂ R′ defines the transfer; the node applies it to O_{F,S} ⊂ O_{F′,S′}.

  > Suppose that R ⊂ R′ is an inclusion of Dedekind domains, with R′ finitely generated as an R-module. Then the fraction field F′ of R′ is finite over F, so the exact functors M(R′) → M(R) and M(F′) → M(F) inducing the transfer maps (IV.6.3.3) are compatible.

### With a torsion class group, the S-integers are the localisation at M_S

`ArithmeticKTheory:N.1/S-integers-localisation-of-torsion-class-group` · *theorem*

Let R be a Dedekind domain with fraction field K whose class group is torsion — for instance finite, as for R = 𝓞_F with F a number field (Mathlib's NumberField.RingOfIntegers.instFintypeClassGroup). For every set S of height-one primes, the submonoid M_S of N.1/S-integers-as-a-localisation satisfies its condition (ii), so S.integer K is the localisation of R at M_S. Concretely, if h_v is the order of the class of v ∈ S and v^{h_v} = (a_v), any submonoid M with {a_v : v ∈ S} ⊆ M ⊆ M_S presents S.integer K; for finite S, S.integer K = R[1/∏_{v∈S} a_v].

**Hypotheses.**

- R is a Dedekind domain with torsion class group; S is any set of height-one primes.
- The a_v are not canonical; by the previous node nothing depends on them.

**Proof outline.**

1. For v ∈ S the class [v] has finite order h ≥ 1 (isOfFinOrder_of_finite for a finite class group), so v^h = (a) is principal (ClassGroup.mk0_eq_one_iff).
2. a ∈ v since h ≥ 1, and w(a) = 1 for every w ≠ v since (a) = v^h; hence a ∈ M_S ∩ v.
3. So M_S, and any submonoid between {a_v} and M_S, satisfies condition (ii); apply N.1/S-integers-as-a-localisation.
4. For finite S the submonoid generated by a = ∏ a_v gives R[1/a].

**Acceptance.**

- ℚ(√−5), S = {𝔭₂}: h = 2 and a = 2, so O_S = 𝓞[1/2], and Cl(O_S) = Cl(𝓞)/⟨[𝔭₂]⟩ = 1 by Tau Ceti's integerClassGroupEquiv, [𝔭₂] generating Cl(𝓞) ≅ ℤ/2.
- R = ℤ, S = {(p) : p ∈ P} for any set P of primes: O_S = ℤ[1/p : p ∈ P]; for P all primes this is ℚ, so S need not be finite.
- The hypothesis cannot be dropped: Tau Ceti's SInteger/Basic.lean docstring example (Cl(R) ≅ ℤ, S = {v}).

**Prerequisites.** `ArithmeticKTheory:N.1/S-integers-as-a-localisation`, `mathlib:NumberField.RingOfIntegers.instFintypeClassGroup`, `mathlib:isOfFinOrder_of_finite`, `mathlib:ClassGroup.mk0_eq_one_iff`, `mathlib:ClassGroup`

**Sources.**

- K-book, I.3, Dedekind domains (PDF p. 30; book p. 22). Finiteness of the class group of 𝓞_F, the hypothesis that makes a power of each prime principal.

  > In Number Theory, Pic(O_F) is called the ideal class group of the number field F. A fundamental theorem states that Pic(O_F) is always a finite group

- K-book, VI.8.2, proof (PDF p. 521; book p. 513). The source uses the presentation O_S[1/ℓ] of a larger ring of S-integers as a localisation.

  > Set R = O_S[1/ℓ]. For each prime ideal 𝔭 over ℓ, K_{n−1}(R/𝔭) has no ℓ-torsion by IV.1.13. By the localization sequence (V, (6.6) or 6.8), K_n(O_S)_(ℓ) = K_n(R)_(ℓ). Thus we may replace O_S by R = O_S[1/ℓ].

### Enlarging S: the rings grow and the presentations are compatible

`ArithmeticKTheory:N.1/S-integers-monotone` · *lemma*

Let R be a Dedekind domain with fraction field K and S ⊆ S′ sets of height-one primes. Then S.integer K ≤ S′.integer K as R-subalgebras of K. If the class group of R is torsion, S′.integer K is moreover the localisation of S.integer K at the image of M_{S′} (IsLocalization (M_{S′}.map (algebraMap R (S.integer K))) (S′.integer K)), so a presentation of O_{S′} is obtained from one of O_S by inverting further elements.

**Hypotheses.**

- S ⊆ S′; the second statement uses the torsion class group through the previous node.

**Proof outline.**

1. Monotonicity: the condition v(x) ≤ 1 for all v ∉ S′ is weaker than for all v ∉ S (as in Tau Ceti's Set.unit_mono for the units).
2. M_S ≤ M_{S′}, and R → S.integer K → S′.integer K is a scalar tower.
3. By the previous node R → S.integer K and R → S′.integer K are the localisations at M_S and M_{S′}; Mathlib's IsLocalization.isLocalization_of_submonoid_le gives the localisation of S.integer K at the image of M_{S′}.

**Acceptance.**

- S = ∅ ⊆ S′: 𝓞 ≤ O_{S′}, the inclusion of the ring of integers.
- R = ℤ, S = {2} ⊆ S′ = {2, 3}: ℤ[1/2] ≤ ℤ[1/6], and ℤ[1/6] is ℤ[1/2] with 3 inverted.
- The unit groups grow too (Tau Ceti's Set.unit_mono), compatibly with Set.unitEquivUnitsInteger.

**Prerequisites.** `ArithmeticKTheory:N.1/S-integers-localisation-of-torsion-class-group`, `mathlib:Set.integer`, `tauceti:Set.mem_integer_iff`, `tauceti:Set.unit_mono`, `mathlib:IsLocalization.isLocalization_of_submonoid_le`

**Sources.**

- K-book, VI.9.4 (PDF p. 527; book p. 519). The source compares rings of S-integers by inclusion (O_S ⊇ O_F[1/2]), which is this lemma.

  > Theorem 9.4. Let F be a real number field, and let O_S be a ring of S-integers in F containing O_F[1/2].

- K-book, VI.8.2, proof (PDF p. 521; book p. 513). Enlarging S by the primes over ℓ is inverting ℓ in O_S.

  > Set R = O_S[1/ℓ]. For each prime ideal 𝔭 over ℓ, K_{n−1}(R/𝔭) has no ℓ-torsion by IV.1.13. By the localization sequence (V, (6.6) or 6.8), K_n(O_S)_(ℓ) = K_n(R)_(ℓ). Thus we may replace O_S by R = O_S[1/ℓ].

### The S-integers of a finite extension are finite projective over those of the base

`ArithmeticKTheory:N.1/S-integers-in-a-finite-extension` · *lemma*

Let F′/F be a finite extension of number fields, S a set of nonzero primes of 𝓞_F and S′ the primes of 𝓞_{F′} lying over a prime of S. Then S.integer F ⊆ S′.integer F′, and S′.integer F′ is the integral closure of S.integer F in F′ (Mathlib's IsIntegralClosure); it is a finitely generated projective S.integer F-module of rank [F′ : F].

**Hypotheses.**

- F′/F is finite, hence separable; S is any set of nonzero primes of 𝓞_F.
- Only the class group of 𝓞_F is used, through N.1/S-integers-localisation-of-torsion-class-group; the class group of 𝓞_{F′} is not needed.

**Proof outline.**

1. The image of M_S in 𝓞_{F′} lies in M_{S′}: an m ∈ 𝓞_F outside every v ∉ S lies in no w ∉ S′, since w ∩ 𝓞_F ∉ S; and each w ∈ S′ contains a_v for v = w ∩ 𝓞_F ∈ S. By N.1/S-integers-as-a-localisation (applied to 𝓞_{F′}), S′.integer F′ = M_S⁻¹𝓞_{F′}; in particular S.integer F = M_S⁻¹𝓞_F ⊆ S′.integer F′.
2. Integrality: 𝓞_{F′} is integral over 𝓞_F and the elements of M_S are units of S.integer F, so M_S⁻¹𝓞_{F′} is integral over S.integer F; conversely S′.integer F′ is integrally closed with fraction field F′ (Tau Ceti's instance), so it is the integral closure.
3. Finiteness: Mathlib's IsIntegralClosure.finite (S.integer F is integrally closed and noetherian).
4. Projectivity: finitely generated and torsion-free over a Dedekind domain, hence flat (IsDedekindDomain.flat_iff_torsion_eq_bot) and finitely presented, hence projective (Module.Flat.projective_of_finitePresentation).
5. Rank: F′ is the localisation of S′.integer F′ at the non-zero elements of S.integer F (IsIntegralClosure.isLocalization), so the rank is [F′ : F].

**Acceptance.**

- F = ℚ, F′ = ℚ(i), S = {2}: S′ = {(1 + i)} and S′.integer F′ = ℤ[i][1/2], free over ℤ[1/2] with basis 1, i.
- S = ∅: 𝓞_{F′} is the integral closure of 𝓞_F in F′, as Mathlib has.
- The hypothesis of V.6.6.3 (R′ finitely generated as an R-module) holds for O_{F,S} ⊂ O_{F′,S′}.

**Prerequisites.** `ArithmeticKTheory:N.1/S-integers-as-a-localisation`, `ArithmeticKTheory:N.1/S-integers-localisation-of-torsion-class-group`, `mathlib:IsIntegralClosure`, `mathlib:IsIntegralClosure.finite`, `mathlib:IsIntegralClosure.isLocalization`, `mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot`, `mathlib:Module.Flat.projective_of_finitePresentation`, `mathlib:NumberField.RingOfIntegers`

**Sources.**

- K-book, V.6.6.3 (PDF p. 418; book p. 410). The hypothesis the transfers of N.1 and N.2 need; this lemma supplies it for rings of S-integers.

  > Suppose that R ⊂ R′ is an inclusion of Dedekind domains, with R′ finitely generated as an R-module. Then the fraction field F′ of R′ is finite over F, so the exact functors M(R′) → M(R) and M(F′) → M(F) inducing the transfer maps (IV.6.3.3) are compatible.

- K-book, I.3, Dedekind domains (PDF p. 29; book p. 21). The projectivity step.

  > Another property of Dedekind domains is that every finitely generated torsionfree R-module M is projective.

### Transfer and pullback on K₁ of S-integers are the norm and the inclusion of units

`ArithmeticKTheory:N.1/transfer-and-norm-on-units` · *comparison*

In the setting of N.1/norms-transfers-and-pullbacks (F′/F of degree d, S finite, S′ over S), under K₁ = units (KTheoryLowDegrees U.4) the pullback i^* : K₁(O_{F,S}) → K₁(O_{F′,S′}) is the inclusion O_{F,S}^× ⊂ O_{F′,S′}^×, and the transfer i_* is the field norm N_{F′/F} (Mathlib's Algebra.norm) restricted to S′-units, which takes values in O_{F,S}^×. Hence i_*i^*(u) = u^d, which is multiplication by [O_{F′,S′}] ∈ K₀(O_{F,S}) acting on K₁ (the Steinitz class acts trivially on units).

**Hypotheses.**

- U.5 owns the transfer by restriction of scalars and its agreement with the field norm on a field's unit group; U.4 owns K₁(O_{F,S}) = O_{F,S}^× and its injection into K₁(F).
- S finite; S′ the primes over S.

**Proof outline.**

1. Pullback: base change of an automorphism of O_{F,S} is its extension; on units the inclusion.
2. Transfer: restriction of scalars commutes with inverting the non-zero elements of O_{F,S} (O_{F′,S′} ⊗ F = F′), so i_* is compatible with the transfer K₁(F′) → K₁(F) through the injections K₁(O_{F,S}) ↪ K₁(F) and K₁(O_{F′,S′}) ↪ K₁(F′) (U.4); on F′^× the transfer is N_{F′/F} (U.5).
3. N_{F′/F} maps S′-units to S-units: v(N x) = Σ_{w|v} f_w·w(x) = 0 for v ∉ S.
4. i_*i^*(u) = N_{F′/F}(u) = u^d for u ∈ F^×.

**Acceptance.**

- F = ℚ, F′ = ℚ(i), S = {2}: i_*(1 + i) = N(1 + i) = 2 ∈ ℤ[1/2]^×, and i_*i^*(2) = N(2) = 4 = 2².
- S = ∅: i_*(i) = N(i) = 1 and i_*i^*(−1) = (−1)² = 1 for ℚ(i)/ℚ.
- The composite is u ↦ u^d on K₁ even when the Steinitz class is non-trivial, unlike on K₀.

**Prerequisites.** `ArithmeticKTheory:N.1/S-integers-in-a-finite-extension`, `KTheoryLowDegrees:U.4`, `KTheoryLowDegrees:U.5`, `mathlib:Algebra.norm`, `mathlib:Set.unitEquivUnitsInteger`

**Sources.**

- K-book, Ex. II.2.2(b) (PDF p. 86; book p. 78). The composite is multiplication by [A]; in degree one [A] acts through its rank.

  > (b) Show that both compositions f^∗f_∗ and f_∗f^∗ are multiplication by [A].

- K-book, V.6.6.3 (PDF p. 418; book p. 410). The transfer along O_{F,S} ⊂ O_{F′,S′}.

  > Suppose that R ⊂ R′ is an inclusion of Dedekind domains, with R′ finitely generated as an R-module. Then the fraction field F′ of R′ is finite over F, so the exact functors M(R′) → M(R) and M(F′) → M(F) inducing the transfer maps (IV.6.3.3) are compatible.

## N.2 — Localisation and finite support

One sequence and its low-degree rows.

The class-group sequence, the S-unit valuation sequence and the tame-kernel sequence are **the degree-zero, degree-one and degree-two rows of a single localisation sequence**. The first two are pinned in classical form in Tau Ceti (and are *not* derived there from a K-theoretic sequence). The third, with its injectivity and surjectivity, is `K2SymbolsBrauer:T.5`'s: N.2 imports it and identifies it with the degree-two segment of its sequence instead of proving it a second time (RT-AREA-ktheory-1/9).

**Exactness gives no injectivity.** The term preceding `Kₙ(O_{F,S}) → Kₙ(F)` is the residue sum, which need not map to zero. Injectivity in even degrees `≥ 4` is Quillen's `K_{2j}(𝔽_q) = 0`; in degree two it is T.5's; in odd degrees it is Soulé's theorem, which lives in N.5 because it needs finite generation; in degree zero it is false.

Coverage: **partial**.

Six nodes. Finite support first (N.2/finite-support), by dévissage for each s and a colimit over rings; then the sequence (N.2/localisation-sequence-for-a-dedekind-domain) with its specialisation to the primes outside S; its compatibility with finite extensions through transfers (N.2/localisation-sequence-and-finite-extensions); the interpretation in degrees 0–2 (N.2/the-three-classical-rows); and the S-unit valuation and class-group sequences derived from it (N.2/S-unit-and-class-group-sequence). The degree-two row, the tame-kernel exact sequence with its injectivity and surjectivity, is K2SymbolsBrauer T.5's and is imported, not derived here (RT-AREA-ktheory-1/9): T.5 proves it from T.3's comparison of the localisation boundary with the tame symbols and U.4's SK₁(O_{F,S}) = 0 (RT-AREA-ktheory-1/26), and N.2/the-three-classical-rows identifies it with the degree-two segment of (6.6); the stage text's 'Derive the tame-kernel exact sequence ... from this one construction' is met by that identification. Of the injectivity theorems the text asks for, N.2 proves the even-degree one for n ≥ 4 from K_{2j}(𝔽_q) = 0 and imports degree two from T.5 (N.2/even-degree-injectivity), which replaces the note N.2/exactness-gives-no-injectivity; the odd-degree isomorphism is Soulé's theorem, moved to N.5 (N.5/soule-theorem) because its proof needs N.3:finite-generation.

Remaining:

- The contravariant compatibility of the localisation sequence with base change along a finite extension (ramification indices on the residue terms) is not in the source read (gap).
- Gap: 'Compatibility of the localisation sequence with base change along a finite extension'.

### The localisation sequence for a Dedekind domain

`ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain` · *theorem* · planet **Localization sequence for a Dedekind domain**

Let R be a Dedekind domain with fraction field F. There is a long exact sequence of K_*(R)-modules (6.6) ⋯ → K_{n+1}(F) →∂ ⊕_𝔭 K_n(R/𝔭) →⊕(i_𝔭)_* K_n(R) → K_n(F) →∂ ⊕_𝔭 K_{n−1}(R/𝔭) → ⋯ → K₀(R) → K₀(F) → 0, the sums over the nonzero primes 𝔭, (i_𝔭)_* the transfer along R → R/𝔭 and ∂ the boundary of N.2/finite-support, with values in the direct sum. For R = O_{F,S} = S.integer F with F a number field, the nonzero primes of O_{F,S} are the 𝔭·O_{F,S} with 𝔭 ∉ S (Tau Ceti's integerHeightOneSpectrumEquiv) and O_{F,S}/𝔭O_{F,S} = 𝓞_F/𝔭 = k(𝔭), so the sums run over 𝔭 ∉ S: this is the sequence displayed in the stage text.

**Hypotheses.**

- R is a Dedekind domain; R, R[1/s], F and the R/𝔭 are regular in the sense needed by the resolution theorem: every finitely generated module has a projective resolution of length at most one.
- The sequence is obtained from K.3's localisation theorem for the Serre subcategories M_s(R) and a filtered colimit over s (N.2/finite-support), not from a localisation theorem for arbitrary exact subcategories.
- K-groups are those of GeneralAlgebraicKTheory K.1 (π_{n+1} of the Q-construction).

**Proof outline.**

1. Regularity: a submodule of a finitely generated free R-module is finitely generated and torsion-free, hence flat (Mathlib's IsDedekindDomain.flat_iff_torsion_eq_bot) and finitely presented, hence projective (Module.Flat.projective_of_finitePresentation); so every finitely generated module over R, R[1/s] or a field has projective dimension ≤ 1, and K = G by K.3's resolution theorem.
2. For each s ≠ 0 take the sequence of R → R[1/s] with fibre ⊕_{𝔭 ∋ s} K_n(R/𝔭) (N.2/finite-support).
3. Pass to the filtered colimit over s (K.7, filtered colimits for rings; a filtered colimit of exact sequences is exact), obtaining (6.6).
4. The maps: (i_𝔭)_* is restriction of scalars along R → R/𝔭 (V.3.3.2), defined because R/𝔭 has projective dimension ≤ 1 over R; the K_*(R)-module structure comes from the action of P(R) on M(R) and its compatibility with localisation boundaries (V.6.1.1; K.7).
5. S-integers: by N.1/S-integers-localisation-of-torsion-class-group, O_{F,S} = M_S⁻¹𝓞_F, and for 𝔭 ∉ S the images of M_S in the field 𝓞_F/𝔭 are units, so O_{F,S}/𝔭O_{F,S} = 𝓞_F/𝔭; the primes correspond by Tau Ceti's integerHeightOneSpectrumEquiv.

**Acceptance.**

- R = ℤ, degrees ≤ 1: ⊕_p 𝔽_p^× → K₁(ℤ) = {±1} → ℚ^× → ⊕_p ℤ → K₀(ℤ) = ℤ → K₀(ℚ) = ℤ → 0, the first map zero (SK₁(ℤ) = 1 and {±1} ↪ ℚ^×), ℚ^× → ⊕_p ℤ the valuations with kernel {±1}, and ℤ → ℤ the identity.
- For R = O_{F,S} the sums run over 𝔭 ∉ S; the primes of S do not appear.
- It is a sequence of K_*(R)-modules: ∂(x·y) = ∂(x)·ȳ for y ∈ K_*(R), with the side fixed as in K2SymbolsBrauer T.3/localization-boundary.
- K₀(R) → K₀(F) = ℤ is the rank; its kernel is Pic(R), so the sequence does not make K₀(R) → K₀(F) injective (N.2/even-degree-injectivity).

**Prerequisites.** `ArithmeticKTheory:N.2/finite-support`, `GeneralAlgebraicKTheory:K.3`, `GeneralAlgebraicKTheory:K.7`, `GeneralAlgebraicKTheory:K.1`, `ArithmeticKTheory:N.1/S-integers-localisation-of-torsion-class-group`, `mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot`, `mathlib:Module.Flat.projective_of_finitePresentation`, `tauceti:IsDedekindDomain.integerHeightOneSpectrumEquiv`, `mathlib:IsDedekindDomain.HeightOneSpectrum`

**Sources.**

- K-book, V.6.6, Dedekind Domains (PDF p. 417; book p. 409). The sequence (6.6) for a Dedekind domain. 'R and F and regular' is the source's misprint for 'are regular' (sourceIssues).

  > Suppose that R is a Dedekind domain with fraction field F. Then R and F and regular, as are the residue fields R/𝔭, so K∗(R) ≅ G∗(R), etc. Hence the localization sequence of 6.1 with S = R − {0} becomes the long exact sequence:

- K-book, V.6.6 (PDF p. 417; book p. 409). The primes and the transfer maps.

  > Here 𝔭 runs over the nonzero prime ideals of R, and the maps (i𝔭)∗ : Kn(R/𝔭) → Kn(R) are the transfer maps of 3.3.2.

- K-book, V.6.1 (PDF p. 414; book p. 406). The Serre subcategory and quotient to which the localisation theorem is applied.

  > We saw in II.6.4.1 that the category M_S(R) of finitely generated S-torsion modules is a Serre subcategory of M(R) with quotient category M(S^{−1}R).

### Finite support: the boundary lands in the direct sum

`ArithmeticKTheory:N.2/finite-support` · *lemma*

Let R be a Dedekind domain with fraction field F. For 0 ≠ s ∈ R, the localisation sequence of R → R[1/s] (GeneralAlgebraicKTheory K.3, for the Serre subcategory M_s(R) of finitely generated modules killed by a power of s, with quotient M(R[1/s])) has fibre term K_n(M_s(R)) ≅ ⊕_{𝔭 ∋ s} K_n(R/𝔭), a finite sum, by dévissage; for s | s′ the sequences are compatible, the map of fibre terms being the inclusion of summands. Since K_{n+1}(F) = colim_s K_{n+1}(R[1/s]), every x ∈ K_{n+1}(F) comes from K_{n+1}(R[1/s]) for some s, and its boundary lies in ⊕_{𝔭 ∋ s} K_n(R/𝔭): the boundary ∂ : K_{n+1}(F) → ⊕_𝔭 K_n(R/𝔭) is defined into the direct sum, each class having non-zero components at only finitely many primes. In degree one ∂[f] = (ord_𝔭 f)_𝔭 (V.6.1.2).

**Hypotheses.**

- R is a Dedekind domain with fraction field F; the colimit is over s ∈ R ∖ {0} ordered by divisibility.
- Finite support is a property of each class, not a uniform bound on the group.
- The colimit is taken over rings (K.7: 'filtered-colimit compatibility for rings'); no colimit of exact categories is needed, because each M_s(R) has a finite semisimple dévissage.

**Proof outline.**

1. For s ≠ 0, M_s(R) is a Serre subcategory of M(R) with quotient M(R[1/s]) (V.6.1), so K.3's localisation theorem gives the sequence of R → R[1/s].
2. Every object of M_s(R) has finite length; its simple objects are the R/𝔭 with s ∈ 𝔭, finitely many; dévissage (K.3) and the finite-product compatibility (K.7) give K(M_s(R)) ≃ ⊕_{𝔭 ∋ s} K(R/𝔭) (V.4.3, V.4.4).
3. For s | s′ the inclusions M_s(R) ⊂ M_{s′}(R) and R[1/s] → R[1/s′] give a map of sequences, which on fibre terms is the inclusion of summands.
4. F is the filtered colimit of the R[1/s], so K_{n+1}(F) = colim_s K_{n+1}(R[1/s]) (K.7); the boundaries ∂_s assemble into ∂ with values in colim_s ⊕_{𝔭 ∋ s} K_n(R/𝔭) = ⊕_𝔭 K_n(R/𝔭).
5. Degree one: ∂[s] = [R/sR] (V.6.1.2), which by dévissage is Σ_𝔭 ord_𝔭(s)·[R/𝔭]; its finite support is Tau Ceti's IsDedekindDomain.HeightOneSpectrum.finite_setOfPred_valuation_ne_one.

**Acceptance.**

- R = ℤ, x = [12] ∈ K₁(ℚ) = ℚ^×: ∂x = 2·[𝔽₂] + 1·[𝔽₃], supported on {2, 3}.
- A class coming from K_{n+1}(R[1/s]) has boundary supported on the primes containing s.
- The target is the direct sum: the next map ⊕_𝔭 K_n(R/𝔭) → K_n(R) is only defined on finitely supported families, so a formalisation with the product would not have the sequence.

**Prerequisites.** `GeneralAlgebraicKTheory:K.3`, `GeneralAlgebraicKTheory:K.7`, `mathlib:IsDedekindDomain.HeightOneSpectrum`, `tauceti:IsDedekindDomain.HeightOneSpectrum.finite_setOfPred_valuation_ne_one`

**Sources.**

- K-book, V.4.4, Application 4.4 (PDF p. 409; book p. 401). The torsion category is the filtered colimit of the categories supported at one element s.

  > If S is a central multiplicatively closed set in R, the exact category M_S(R) is the filtered colimit over s ∈ S of the M_s(R).

- K-book, V.4.3, Application 4.3 (PDF p. 409; book p. 401). Dévissage to semisimple objects applies to finitely generated torsion modules over a Dedekind domain, giving the finite direct sum.

  > This applies to finitely generated torsion modules over Dedekind domains and curves, and more generally to finitely generated modules of finite support over any commutative ring or scheme.

- K-book, V.6.1.2 (PDF p. 414; book p. 406). The degree-one boundary is the divisor.

  > In particular, when R is a domain we have ∂(s) = [R/sR].

### The low-degree end of the localisation sequence: divisors, Picard group and tame symbols

`ArithmeticKTheory:N.2/the-three-classical-rows` · *comparison*

For a Dedekind domain R with fraction field F, the end of (6.6) is identified with the classical sequences. (a) Degrees one and zero: with K₁(R) = R^× ⊕ SK₁(R) and K₁(F) = F^× (determinant, KTheoryLowDegrees U.3), K₀(R/𝔭) = ℤ·[R/𝔭], K₀(R) ≅ ℤ ⊕ Pic(R) and K₀(F) = ℤ (Z.4), the boundary K₁(F) → ⊕_𝔭 ℤ is the divisor f ↦ (ord_𝔭 f)_𝔭, and ⊕_𝔭 ℤ → K₀(R) sends e_𝔭 to [R/𝔭] = [R] − [𝔭], which is (0, [𝔭]⁻¹); restricting K₁(R) to R^× (SK₁(R) is the kernel of K₁(R) → K₁(F)) this is the exact sequence 1 → R^× → F^× →div ⊕_𝔭 ℤ → K₀(R) → ℤ → 0 of I.3.6, and in particular the ideal-class-group sequence F^× → ⊕_𝔭 ℤ → Pic(R) → 0, whose class map is e_𝔭 ↦ [𝔭]⁻¹. (b) Degrees two and one, for R = O_{F,S} with F a number field and S finite: the segment ⊕_{𝔭∉S} K₂(k(𝔭)) → K₂(O_{F,S}) → K₂(F) →∂ ⊕_{𝔭∉S} k(𝔭)^× → SK₁(O_{F,S}) → 1 of (6.6) is the tame-kernel sequence 0 → K₂(O_{F,S}) → K₂(F) → ⊕_{𝔭∉S} k(𝔭)^× → 0, which N.2 imports from K2SymbolsBrauer T.5 with its injectivity and its surjectivity (T.5/tame-kernel-sequence for S = ∅, T.5/s-integer-tame-kernel-sequence for finite S) and does not re-prove: in degrees at most two (6.6) is the Dedekind localisation sequence of K2SymbolsBrauer T.3/dedekind-localization-boundary (the same instance of GeneralAlgebraicKTheory K.3's theorem), whose boundary is the residue sum of the tame symbols with the sign fixed in T.3/localization-boundary, and T.5 states its third map that way. The relative sequence 0 → K₂(𝓞_F) → K₂(O_{F,S}) → ⊕_{𝔭∈S} k(𝔭)^× → 0, with residues at the primes in S, is T.5/relative-s-integer-sequence. Consequently ⊕_{𝔭∉S} K₂(k(𝔭)) → K₂(O_{F,S}) is zero and ∂ is onto in (6.6). For a general Dedekind domain only the exactness of this segment is claimed here.

**Hypotheses.**

- R is a Dedekind domain with fraction field F; in (b), R = O_{F,S} with F a number field and S a finite set of finite places, which is the generality of T.5's sequence.
- The degree-two row is K2SymbolsBrauer T.5's (RT-AREA-ktheory-1/9): T.5 derives it from the comparison of tame residues with the localisation boundary (K2SymbolsBrauer T.3/dedekind-localization-boundary and T.3/localization-boundary, built on GeneralAlgebraicKTheory K.3) and from SK₁(O_{F,S}) = 0 (KTheoryLowDegrees U.4), not from N.2 (RT-AREA-ktheory-1/26). The import is acyclic because T.5's nodes do not list ArithmeticKTheory:N.2 as a prerequisite (checked against the K2SymbolsBrauer packet revised for the same findings).
- The sign in (a) is a convention the node fixes: with ∂ = div, the map to Pic is e_𝔭 ↦ [𝔭]⁻¹.

**Proof outline.**

1. Identify K₁ of R, F and the residue fields by the determinant (U.3), and K₀(R) by rank and determinant (Z.4).
2. ∂ on K₁(F): ∂[s] = [R/sR] for 0 ≠ s ∈ R (V.6.1.2), which by dévissage is Σ ord_𝔭(s)[R/𝔭]; extend multiplicatively to F^× (U.5 records the valuation convention for the boundary of a discrete valuation field).
3. The class of R/𝔭 in K₀(R) is [R] − [𝔭] by 0 → 𝔭 → R → R/𝔭 → 0; its determinant is [𝔭]⁻¹.
4. Extract (a) using R^× ↪ F^×; compare with I.3.6.
5. (b): import T.5/tame-kernel-sequence and T.5/s-integer-tame-kernel-sequence; match the maps with the segment of (6.6) for O_{F,S} (N.2/localisation-sequence-for-a-dedekind-domain), which in degrees at most two is the sequence of T.3/dedekind-localization-boundary; exactness of T.5's sequence then says that ⊕_{𝔭∉S} K₂(k(𝔭)) → K₂(O_{F,S}) is zero and that ∂ is onto.
6. Specialise (a) to O_{F,S} by N.2/localisation-sequence-for-a-dedekind-domain.

**Acceptance.**

- R = ℤ: (a) reads 1 → {±1} → ℚ^× → ⊕_p ℤ → ℤ → ℤ → 0, with Pic(ℤ) = 0.
- R = 𝓞 of ℚ(√−5): e_{𝔭₂} ↦ (0, [𝔭₂]⁻¹) = (0, [𝔭₂]), the non-trivial class (Tau Ceti's classNumber_eq_two_of_minpoly_eq_X_sq_add_five), so ⊕_𝔭 ℤ → K₀(R) is not zero.
- Sign: a formalisation with class map e_𝔭 ↦ [𝔭] must also replace div by −div.
- For F = ℚ, (b) is T.5's 1 → K₂(ℤ) → K₂(ℚ) → ⊕_p 𝔽_p^× → 1 (Application III.6.5.1), imported, not proved again: the degree-two segment of (6.6) for ℤ agrees with it.

**Prerequisites.** `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `KTheoryLowDegrees:Z.4/rank-pic-equivalence`, `KTheoryLowDegrees:U.3`, `KTheoryLowDegrees:U.5`, `GeneralAlgebraicKTheory:K.1`, `K2SymbolsBrauer:T.5/tame-kernel-sequence`, `K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence`, `K2SymbolsBrauer:T.3/dedekind-localization-boundary`, `K2SymbolsBrauer:T.3/localization-boundary`, `mathlib:ClassGroup.equivPic`

**Sources.**

- K-book, V.6.6 (PDF p. 417; book p. 409). The identification (a) of the end of (6.6).

  > Writing K1(R) = R× ⊕ SK1(R) (see III.1.1.1), the formula 6.1.2 allows us to identify the ending with the sequence 1 → R× → F× →div D(R) → K0(R) → Z → 0 of I.3.6.

- K-book, V.6.6.1 (PDF p. 417; book p. 409). The segment (6.6.1) of (b), whose identification with the tame symbol and whose exactness (the tame-kernel sequence) are imported from K2SymbolsBrauer T.3 and T.5.

  > We claim that ∂ is the tame symbol of III.6.3 and that the above continues the sequence of III.6.5.

- K-book, V.6.1.2 (PDF p. 414; book p. 406). The degree-one boundary, ∂(s) = [R/sR].

  > In particular, when R is a domain we have ∂(s) = [R/sR].

### Compatibility of the localisation sequence with finite extensions

`ArithmeticKTheory:N.2/localisation-sequence-and-finite-extensions` · *theorem*

Let R ⊂ R′ be an inclusion of Dedekind domains with R′ finitely generated as an R-module, with fraction fields F ⊂ F′. Restriction of scalars M(R′) → M(R), M(F′) → M(F) and on torsion modules are compatible exact functors, so they give a morphism from the localisation sequence (6.6) of R′ to that of R: the transfers N_{R′/R} : K_n(R′) → K_n(R), N_{F′/F} : K_n(F′) → K_n(F) and, on residue terms, N̄ = ⊕ N_{𝔭′/𝔭} : ⊕_{𝔭′} K_{n−1}(R′/𝔭′) → ⊕_𝔭 K_{n−1}(R/𝔭), N_{𝔭′/𝔭} the transfer of the finite field extension R/𝔭 ⊂ R′/𝔭′ (𝔭 = 𝔭′ ∩ R), commute with all maps of the sequences, ∂ included. For O_{F,S} ⊂ O_{F′,S′} the hypothesis holds by N.1/S-integers-in-a-finite-extension.

**Hypotheses.**

- R ⊂ R′ Dedekind with R′ finitely generated as an R-module; F′/F is then finite.
- The source proves the transfer (covariant) compatibility (6.6.3)–(6.6.4); compatibility with base change along F → F′, where the residue terms acquire ramification indices, is not stated in the sections read (gap).

**Proof outline.**

1. The exact functors M(R′) → M(R), M(F′) → M(F) and M_tors(R′) → M_tors(R) are compatible, giving the homotopy commutative diagram (6.6.3) of fibration sequences.
2. Take homotopy groups to get the morphism of long exact sequences (6.6.4).
3. On residue terms: R′/𝔭′ restricted to R is killed by 𝔭 and is a finite-dimensional R/𝔭-vector space; under dévissage the induced map K(R′/𝔭′) → K(R/𝔭) is the transfer of the residue field extension.

**Acceptance.**

- Degree one, F′ = ℚ(i), F = ℚ, x = 1 + 2i: N x = 5; the only prime of ℤ[i] with ord ≠ 0 is (1 + 2i), over 5 with residue degree 1, and ord_5(N x) = 1 = f·ord_{(1+2i)}(x).
- In degree one N̄ on ⊕ K₀ is multiplication by the residue degrees f(𝔭′|𝔭).
- For R′ = R the morphism is the identity.

**Prerequisites.** `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `ArithmeticKTheory:N.1/S-integers-in-a-finite-extension`, `GeneralAlgebraicKTheory:K.3`, `GeneralAlgebraicKTheory:K.1`

**Sources.**

- K-book, V.6.6.3–6.6.4 (PDF p. 418; book p. 410). The morphism of localisation sequences induced by restriction of scalars.

  > Suppose that R ⊂ R′ is an inclusion of Dedekind domains, with R′ finitely generated as an R-module. Then the fraction field F′ of R′ is finite over F, so the exact functors M(R′) → M(R) and M(F′) → M(F) inducing the transfer maps (IV.6.3.3) are compatible.

### The S-unit valuation sequence and the class-group sequence from the localisation sequence

`ArithmeticKTheory:N.2/S-unit-and-class-group-sequence` · *theorem*

Let F be a number field, S a finite set of nonzero primes of 𝓞_F and O_{F,S} = S.integer F. The flat map 𝓞_F → O_{F,S} induces a morphism from the localisation sequence (6.6) of 𝓞_F to that of O_{F,S}, the identity on K_*(F) and, on residue terms, the projection ⊕_𝔭 K_n(k(𝔭)) → ⊕_{𝔭∉S} K_n(k(𝔭)). Applied to N.2/the-three-classical-rows (a) for both rings, the snake lemma gives the exact sequence 1 → 𝓞_F^× → O_{F,S}^× →(ord_𝔭)_{𝔭∈S} ⊕_{𝔭∈S} ℤ → Cl(𝓞_F) → Cl(O_{F,S}) → 0, whose last map is extension of ideal classes and whose middle map is e_𝔭 ↦ [𝔭]⁻¹: the S-unit valuation sequence and the ideal-class-group sequence, derived from the one construction. Exactness at O_{F,S}^× is Tau Ceti's Set.unitValuation_ker, exactness at Cl(𝓞_F) is IsDedekindDomain.ker_integer_extendedHom and surjectivity at the end is IsDedekindDomain.integer_extendedHom_surjective, all proved there without K-theory; exactness at ⊕_{𝔭∈S} ℤ is not pinned.

**Hypotheses.**

- F a number field, S finite; the class group is Mathlib's ClassGroup, compared with Pic by ClassGroup.equivPic.
- The sign of the middle map follows N.2/the-three-classical-rows; exactness does not depend on it.
- Tau Ceti's Set.unitValuation records −ord_v, not ord_v; in its coordinates the pinned class map e_𝔭 ↦ [𝔭]⁻¹ reads f ↦ ∏_v [v]^{f(v)}, with no inverse.

**Proof outline.**

1. Naturality: base change along the flat map 𝓞_F → O_{F,S} is exact and preserves torsion modules; k(𝔭) ⊗ O_{F,S} = k(𝔭) for 𝔭 ∉ S and 0 for 𝔭 ∈ S (𝔭·O_{F,S} = O_{F,S}, Tau Ceti's integer_map_asIdeal_eq_top).
2. In degrees ≤ 1 this is a map between the sequences 0 → F^×/R^× → ⊕ ℤ → Pic(R) → 0 for R = 𝓞_F and R = O_{F,S}, with vertical maps the quotient F^×/𝓞_F^× → F^×/O_{F,S}^× (kernel O_{F,S}^×/𝓞_F^×), the projection (kernel ⊕_{𝔭∈S} ℤ, onto) and extension of classes.
3. Snake lemma: 0 → O_{F,S}^×/𝓞_F^× → ⊕_{𝔭∈S} ℤ → Cl(𝓞_F) → Cl(O_{F,S}) → 0, the connecting cokernel being 0 because the first vertical map is onto; add 1 → 𝓞_F^× → O_{F,S}^×.
4. Compare with the pinned classical pieces named in the statement.

**Acceptance.**

- F = ℚ, S = {p}: 1 → {±1} → {±1} × p^ℤ → ℤ → 0 → 0 → 0, the valuation onto.
- F = ℚ(√−5), S = {𝔭₂}: O_{F,S}^× = {±1} × 2^ℤ and ord_{𝔭₂}(2) = 2, so the image of the valuation is 2ℤ and the cokernel ℤ/2 ≅ Cl(𝓞) maps to Cl(O_{F,S}) = 1: the middle exactness is where the class group enters.
- The composite ⊕_{𝔭∈S} ℤ → Cl(𝓞_F) → Cl(O_{F,S}) is trivial.

**Prerequisites.** `ArithmeticKTheory:N.2/the-three-classical-rows`, `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `tauceti:Set.unitValuation_ker`, `tauceti:IsDedekindDomain.ker_integer_extendedHom`, `tauceti:IsDedekindDomain.integer_extendedHom_surjective`, `tauceti:IsDedekindDomain.integer_map_asIdeal_eq_top`, `mathlib:ClassGroup.extendedHom`, `mathlib:ClassGroup.equivPic`

**Sources.**

- K-book, Ex. I.3.8(a) (PDF p. 37; book p. 29). The classical sequence for a localisation R_S = S⁻¹R, here with R = 𝓞_F and R_S = O_{F,S}.

  > (a) Show that the group Pic(R, R_S) of Ex. 3.7 is a subgroup of D(R, R_S), and that there is an exact sequence compatible with Ex. 3.7 1 → R^× → R^×_S → D(R, R_S) → Cl(R) → Cl(R_S) → 0.

- K-book, V.6.6 (PDF p. 417; book p. 409). The end of (6.6) whose naturality is used.

  > Writing K1(R) = R× ⊕ SK1(R) (see III.1.1.1), the formula 6.1.2 allows us to identify the ending with the sequence 1 → R× → F× →div D(R) → K0(R) → Z → 0 of I.3.6.

### Injectivity into the field in even degrees, and why exactness alone does not give it

`ArithmeticKTheory:N.2/even-degree-injectivity` · *theorem*

Let R be a Dedekind domain with fraction field F all of whose residue fields are finite (for instance R = O_{F,S}). Then K_n(R) → K_n(F) is injective for every even n ≥ 4, and for n = 2 when R = O_{F,S}. By exactness of (6.6) its kernel is the image of ⊕_𝔭 K_n(R/𝔭), and for n ≥ 4 this vanishes here only because K_n(𝔽_q) = 0 for even n ≥ 2 (Quillen; KTheoryFiniteLocalFields L.1). In degree two the injectivity is the left half of K2SymbolsBrauer T.5's tame-kernel sequence, imported through N.2/the-three-classical-rows (b) and not proved again. In the other degrees the kernel is not zero for formal reasons: in degree zero it is Pic(R); in degree one it is SK₁(R), which vanishes for O_{F,S} by the Bass–Milnor–Serre theorem (KTheoryLowDegrees U.4); in odd degrees n ≥ 3 its vanishing is Soulé's theorem (N.5/soule-theorem), whose proof uses finite generation.

**Hypotheses.**

- All residue fields R/𝔭 are finite.
- Degree two is imported from K2SymbolsBrauer T.5 (RT-AREA-ktheory-1/9), which proves it for rings of S-integers of number fields from K₂(𝔽_q) = 0; the argument for n ≥ 4 is the same shape, with Quillen's K_{2j}(𝔽_q) = 0.
- This is the injectivity N.2 can prove from its own inputs; the odd-degree isomorphism needs N.3:finite-generation, which the atlas places after N.2.

**Proof outline.**

1. Exactness of (6.6) at K_n(R): ker(K_n(R) → K_n(F)) = image of ⊕_𝔭 K_n(R/𝔭).
2. K_n(𝔽_q) = 0 for even n ≥ 2 (L.1); hence the kernel is zero for even n ≥ 4.
3. n = 2, R = O_{F,S}: the injectivity in T.5/tame-kernel-sequence (S = ∅) and T.5/s-integer-tame-kernel-sequence, matched with (6.6) by N.2/the-three-classical-rows (b).

**Acceptance.**

- n = 2, R = ℤ: K₂(ℤ) → K₂(ℚ) is injective, as in Application III.6.5.1 (T.5's sequence, imported).
- n = 4, R = ℤ[1/p]: K₄(ℤ[1/p]) → K₄(ℚ) is injective, since K₄(𝔽_ℓ) = 0 for every prime ℓ ≠ p.
- Degree zero: for R = 𝓞 of ℚ(√−5), ker(K₀(R) → K₀(F)) = Pic(R) ≅ ℤ/2, containing [R/𝔭₂] = [R] − [𝔭₂].
- Degree one without the arithmetic input fails: for the Dedekind domain ℝ[x, y]/(x² + y² − 1) (infinite residue fields), SK₁ ≠ 0 (Example III.1.5.4), so K₁(R) → K₁(F) is not injective.
- No statement of injectivity in odd degrees follows from this node.

**Prerequisites.** `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `ArithmeticKTheory:N.2/the-three-classical-rows`, `K2SymbolsBrauer:T.5/tame-kernel-sequence`, `KTheoryFiniteLocalFields:L.1`, `KTheoryLowDegrees:U.4`, `KTheoryLowDegrees:Z.4/rank-pic-equivalence`

**Sources.**

- K-book, V.6.8, proof (PDF p. 420; book p. 412). The source's even-degree step, which uses only K_*(𝔽_q); the finite generation it cites is needed for the odd degrees only.

  > From the computation of Kn(Fq) in IV.1.13 and the fact that Kn(R) is finitely generated (IV.6.9), we see that SKn(R) is 0 for n > 0 even, and is finite for n odd.

- K-book, V.6.6 (PDF p. 417; book p. 409). The case n = 2, which the source derives from K₂(R/𝔭) = 0; here it is imported from K2SymbolsBrauer T.5.

  > First, if all of the residue fields R/𝔭 are finite, then K2(R/𝔭) = 0 and we obtain the exact sequence:

- K-book, III.1.5.4 (PDF p. 193; book p. 185). The degree-one non-example.

  > The ring R = ℝ[x, y]/(x2 + y2 − 1) may be embedded in the ring ℝ^{S1} by x ↦ cos(θ), y ↦ sin(θ). Since the matrix (x −y; y x) maps to A, it represents a nontrivial element of SK1(R).

## N.3:finite-generation — Finiteness

Quillen's rank filtration, and the one input it imports.

Filter the Q-construction of `P(A)` by rank. The inclusions are *cellular*, the strata are the groupoids of the automorphism groups `Aut(P)`, and the comma categories are posets of layers, homotopy equivalent to suspended Tits buildings. So the relative terms are `H_*(Aut P; St(P ⊗ F))`, shifted by the rank, and in each total degree only finitely many of them contribute.

**What is imported** (RT-AREA-ktheory-1/1): the building, the Solomon–Tits theorem, the Steinberg module and — the one genuinely arithmetic input — the finite generation of `H_*(Γ; St_n(F))` for arithmetic groups `Γ`, all from `BorelRegulators:R.1`. That finiteness comes from Borel–Serre duality with the **twisted** dualizing module `St_n(F) ⊗ ℤ_χ^{⊗(n−1)}`, `χ = N_{F/ℚ} ∘ det` (Putman–Studenmund), not from any finiteness of the classifying space: `St_n(F)` is free of infinite rank. **What N.3 keeps**: the filtration, its spectral sequence, the passage from `GL_n(𝓞_F)` to `Aut(P)` for nonfree `P`, the low ranks, the assembly and the finite-S localisation.

**Integral, not rational.** The criterion needs the homology of `Aut(P)` finitely generated over `ℤ`; rational duality would give only ranks.

Coverage: **partial**.

Nine nodes (RT-AREA-ktheory-1/1). N.3:finite-generation keeps Quillen's Q-construction rank filtration and the assembly, and imports the arithmetic-group input. The filtration Q_m of Q(P(A)) by rank for a Dedekind domain A (rank-filtration: cellular inclusions, strata the groupoids ⊔ Aut(P), finitely many classes per rank when Pic(A) is finite, nonfree projectives included); the poset J(V) of proper layers (layer-poset); the comma categories Q_{n−1} ↓ P ≃ J(P ⊗ F) (comma-category-is-the-layer-poset); J(V) ≃ ΣT(V), with the low ranks n = 1 (two points, St = ℤ) and n = 2 (reduced homology) made explicit (layer-poset-is-the-suspended-building); the rank spectral sequence E¹_{p,q} = ⊕ H_q(Aut P; St(P ⊗ F)) ⇒ H_{p+q}(BQ), which is Quillen's Theorem 3 in Kahn's form (rank-spectral-sequence); the criterion, now decomposed (quillen-finiteness-criterion: finitely many columns in each total degree, then Serre's theorem for the H-space BQ); the arithmetic hypothesis for 𝓞_F, where Aut(P) is shown commensurable with GL_n(𝓞_F) and the integral finiteness of Steinberg homology is imported from BorelRegulators R.1 with its twisted dualizing module St_n(F) ⊗ ℤ_χ^{⊗(n−1)} (steinberg-homology-of-automorphism-groups); Quillen's theorem for rings of integers (quillen-finite-generation-theorem); and the finite-S localisation step (finite-generation-of-K-of-S-integers). R.1 owns the building, the Solomon–Tits theorem, the Steinberg module and the arithmetic duality/finiteness interface (request); the stage's clause 'Develop the arithmetic-group finiteness and finite-type homotopy input in Quillen's proof' is R.1's and is not planned here, and 'the relation to stable general linear groups' (plus = Q) is not used by the Q-construction route. The former gap 'The arithmetic-group input to finite generation has no source here' is closed: the rank filtration is decomposed from Kahn (arXiv:1108.2441v3, §4) and the arithmetic input is requested from R.1 with the dualizing module read in Putman–Studenmund (arXiv:1909.01217v4, Theorem C).

Remaining:

- Receive from BorelRegulators R.1 the building, the Solomon–Tits theorem, the Steinberg module and the integral finiteness of H_i(Γ; St_n(F)) for arithmetic Γ (request).
- Receive from StableHomotopyKTheory H.2 the cellular-functor spectral sequence and from H.6 Serre's theorem for simple spaces (requests); from H.1 the nerve and local-coefficient comparisons (request).

### Finite generation of the K-groups of rings of S-integers

`ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers` · *theorem*

Let F be a number field and S a finite set of finite primes of 𝓞_F. Then K_n(𝓞_{F,S}) is a finitely generated abelian group for every n ≥ 0 (the stage asks for n ≥ 1; degree zero holds as well). It is deduced from Quillen's theorem for 𝓞_F through the localisation sequence of 𝓞_F ⊂ 𝓞_{F,S} = 𝓞_F[1/s], whose residue terms are the K-groups of the finitely many residue fields k(𝔭), 𝔭 ∈ S; these are finite in positive degrees and Z in degree zero by Quillen's finite-field calculation.

**Hypotheses.**

- F is a number field and S a finite set of finite primes; 𝓞_{F,S} = 𝓞_F[1/s] for an s ∈ 𝓞_F whose prime divisors are exactly the primes of S (N.1/S-integers-as-a-localisation, which uses the finiteness of the class group).
- S finite is used: for infinite S the residue term ⊕_{𝔭∈S} K_0(k(𝔭)) is free of infinite rank, and inverting every prime gives K_1 = F^×, which is not finitely generated.
- The source's Theorem IV.6.9 does not cover 𝓞_{F,S} directly when S ≠ ∅ (it is not finite over Z); the passage is the stage's own route: 'Obtain finite generation for S-integers using localisation and the finite-field calculation'.
- Finite generation is integral: K_n(𝓞_{F,S}) is a finitely generated abelian group, not merely of finite rank.

**Proof outline.**

1. Write 𝓞_{F,S} = 𝓞_F[1/s] (N.1/S-integers-as-a-localisation).
2. Apply the localisation sequence for the multiplicative set {s^n} (K-book V.6.1, (6.1.1)): … → G_n(𝓞_F/s) → K_n(𝓞_F) → K_n(𝓞_{F,S}) → G_{n−1}(𝓞_F/s) → …, where G = K for the regular rings 𝓞_F and 𝓞_{F,S} and, by dévissage, G_*(𝓞_F/s) ≅ ⊕_{𝔭∈S} K_*(k(𝔭)). This is the Dedekind-domain localisation of N.2/localisation-sequence-for-a-dedekind-domain for 𝓞_F → 𝓞_{F,S} instead of 𝓞_{F,S} → F; the general theorem (localisation, dévissage, resolution) is GeneralAlgebraicKTheory K.3's.
3. By Quillen's finite-field calculation (KTheoryFiniteLocalFields L.1; K-book IV.1.13) K_m(k(𝔭)) is finite for m ≥ 1 and is Z for m = 0; S being finite, ⊕_{𝔭∈S} K_{n−1}(k(𝔭)) is finitely generated.
4. K_n(𝓞_F) is finitely generated (quillen-finite-generation-theorem). In the exact segment K_n(𝓞_F) → K_n(𝓞_{F,S}) → ⊕_{𝔭∈S} K_{n−1}(k(𝔭)) the middle group is an extension of a subgroup of a finitely generated group by a quotient of a finitely generated group, hence finitely generated.
5. Cross-check degrees zero and one with the pinned libraries: Pic(𝓞_{F,S}) is finite (tauceti:IsDedekindDomain.finite_integer_classGroup, with Mathlib's finiteness of Cl(𝓞_F) as its hypothesis) and the S-unit group is finitely generated (tauceti:Set.unit_fg_of_units, with Mathlib's finite generation of (𝓞 F)ˣ as its hypothesis); with K_0 = Z ⊕ Pic and K_1 = units (N.1) these are the classical cases.

**Acceptance.**

- K_n(𝓞_{F,S}) is finitely generated for every n ≥ 0 and every finite S.
- For Z[1/p] the sequence K_n(Z) → K_n(Z[1/p]) → K_{n−1}(F_p) exhibits K_n(Z[1/p]) as finitely generated; in degree one it reads Z/2 = K_1(Z) ↪ K_1(Z[1/p]) = {±1} × p^Z → K_0(F_p) = Z, the p-adic valuation.
- For infinite S the conclusion fails already in degree one (the units of the ring obtained by inverting every prime are F^×, N.1).
- The K-groups of the FIELD are not finitely generated in positive even degrees: N.3:ranks/even-K-groups-of-the-field-are-infinite-torsion.

**Prerequisites.** `ArithmeticKTheory:N.3:finite-generation/quillen-finite-generation-theorem`, `ArithmeticKTheory:N.1/S-integers-as-a-localisation`, `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `GeneralAlgebraicKTheory:K.3`, `KTheoryFiniteLocalFields:L.1`, `tauceti:IsDedekindDomain.finite_integer_classGroup`, `tauceti:Set.unit_fg_of_units`

**Sources.**

- K-book, IV.6.9 (PDF p. 333; book p. 325). Quillen's theorem, verbatim; with 'finite over Z' it covers 𝓞_F, and this node derives the S-integer case from it.

  > Theorem 6.9. (Quillen) Let R be either an integrally closed subring of a number field F, finite over Z, or else the coordinate ring of a smooth affine curve over a finite field. Then K_n(R) is a finitely generated group for all n.

- K-book, V.6.1, Application 6.1 and (6.1.1) (PDF p. 414; book p. 406). The localisation sequence for R → R[1/s] (cross-reference tags dropped, the elided sentence identifies G(R/sR) with the fibre), applied with R = 𝓞_F.

  > The prototype is the case when S = {s^n}. [...] Thus the long exact Localization sequence (5.1.1) becomes: · · · → G_{n+1}(R[s^{−1}]) →∂ G_n(R/sR) →i_* G_n(R) → G_n(R[s^{−1}]) →∂ · · · .

- K-book, IV.1.13 (PDF p. 277; book p. 269). Quillen's finite-field calculation, which makes the residue terms finite in positive degrees.

  > Corollary 1.13. For every finite field F_q, and n ≥ 1, we have K_n(F_q) = π_n BGL(F_q)^+ ≅ Z/(q^i − 1) for n = 2i − 1, 0 for n even.

### Quillen's rank filtration of the Q-construction of a Dedekind domain

`ArithmeticKTheory:N.3:finite-generation/rank-filtration` · *construction*

Let A be a Dedekind domain with fraction field F, P(A) the exact category of finitely generated projective A-modules and Q = Q(P(A)) its Q-construction (GeneralAlgebraicKTheory K.1: a morphism M → N is an admissible subobject N₂ ↣ N with an admissible epimorphism N₂ ↠ M, i.e. an isomorphism of M with an admissible subquotient N₂/N₁ of N). For P ∈ P(A) put rank P = dim_F(P ⊗_A F). For m ≥ 0 let Q_m ⊂ Q be the full subcategory on the modules of rank ≤ m. Then: (a) a morphism M → N of Q has rank M ≤ rank N, with equality only when it is an isomorphism; hence Q_{m−1} ⊂ Q_m is fully faithful and Q_m has no morphism from an object of rank m to an object of Q_{m−1} (the inclusion is cellular in the sense of Kahn, Definition 2.3.2); (b) the full subcategory Q_m − Q_{m−1} of the objects of rank exactly m is a groupoid, equivalent to the disjoint union over the isomorphism classes [P] of rank-m projectives of the one-object groupoids Aut_A(P); (c) Q is the union of the Q_m, so the nerve of Q is the union of the nerves of the Q_m and H_*(BQ) = colim_m H_*(BQ_m); (d) Q_0 has one object, 0, and only its identity, so BQ_0 is a point; (e) if Pic(A) is finite, each rank m ≥ 1 has exactly #Pic(A) isomorphism classes of projectives (Steinitz: P ≅ A^{m−1} ⊕ I, determined by rank and det P ∈ Pic(A)).

**Hypotheses.**

- A is a Dedekind domain with fraction field F; P(A) carries its split exact structure (all short exact sequences of projectives), imported as GeneralAlgebraicKTheory K.2's P(R) = finiteProjectiveModules.
- Rank is additive on short exact sequences of projectives and a finitely generated projective module of rank zero over a domain is zero; these two facts give (a).
- The filtration is taken on P(A), not on all finitely generated modules: in Q(M(A)) the rank-zero objects are the torsion modules and Q_0 is not a point (see the non-example test).

**Construction.**

1. Define Q_m as the full subcategory of GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction on the objects of rank ≤ m.
2. (a) If M ≅ N₂/N₁ with N₁ ↣ N₂ ↣ N admissible, rank M = rank N₂ − rank N₁ ≤ rank N₂ ≤ rank N. Equality forces rank N₁ = 0 and rank N/N₂ = 0, so N₁ = 0 and N₂ = N (projectives of rank zero vanish), and the morphism is the image of an isomorphism M ≅ N of P(A), an isomorphism of Q (K.1: the isomorphisms of Q(A) are those of A).
3. Cellularity: Q_{m−1} ⊂ Q_m is full by definition, and a morphism from an object of rank m to one of rank < m would contradict (a).
4. (b) By (a) every morphism between objects of rank m is an isomorphism; choosing one object in each isomorphism class gives the equivalence with ⊔_{[P]} Aut_A(P).
5. (c) Every simplex of the nerve of Q involves finitely many objects, hence lies in the nerve of some Q_m; homology of simplicial sets commutes with this filtered union (StableHomotopyKTheory H.1).
6. (d) A morphism 0 → 0 is an admissible subquotient of 0, so it is the identity.
7. (e) Steinitz's classification (KTheoryLowDegrees Z.4/steinitz and Z.4/projective-classification).

**Acceptance.**

- A = ℤ: Q_m − Q_{m−1} is equivalent to the one-object groupoid of GL_m(ℤ).
- A = 𝓞 of ℚ(√−5) (class number two): the rank-one stratum has two isomorphism classes, 𝓞 and 𝔭₂ = (2, 1 + √−5), each with automorphism group 𝓞^× = {±1}.
- BQ_0 is a point, while π₁ BQ(P(ℤ)) = K₀(ℤ) = ℤ (GeneralAlgebraicKTheory K.1/pi1-BQ-equals-K0): the filtration is not constant from rank one on.

**Prerequisites.** `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `KTheoryLowDegrees:Z.4/steinitz`, `KTheoryLowDegrees:Z.4/projective-classification`, `StableHomotopyKTheory:H.1`, `mathlib:ClassGroup`

**API.**

| name | role | statement |
| --- | --- | --- |
| `QCat.rankFiltration` | data | For a Dedekind domain A and m : ℕ, the full subcategory Q_m of QCat (P(A)) on the modules of rank ≤ m. |
| `QCat.rankFiltration_mono` | structure | m ≤ m' → Q_m ⊆ Q_{m'}. |
| `QCat.rank_le_of_hom` | characterisation | For a morphism M ⟶ N of QCat (P(A)), rank M ≤ rank N, and if rank M = rank N the morphism is an isomorphism. |
| `QCat.rankFiltration_cellular` | other | The inclusion Q_{m−1} ⥤ Q_m is fully faithful and there is no morphism from an object of rank m to an object of Q_{m−1}. |
| `QCat.rankStratum` | data | Q_m − Q_{m−1}, the full subcategory on the objects of rank exactly m, as a groupoid. |
| `QCat.rankStratumEquiv` | equivalence | Q_m − Q_{m−1} is equivalent to the disjoint union, over the isomorphism classes [P] of rank-m projectives, of the one-object groupoids of Aut_A(P). |
| `QCat.iSup_rankFiltration` | characterisation | Q = ⋃_m Q_m; the nerve of Q is the union of the nerves of the Q_m. |
| `QCat.rankFiltration_zero` | simp | Q_0 is the category with the single object 0 and its identity. |
| `QCat.finite_rankStratum_classes` | other | If Pic(A) is finite, for m ≥ 1 the rank-m stratum has exactly Nat.card (ClassGroup A) isomorphism classes. |

**Used by.**

- *K-book IV.6.8–6.9 (PDF p. 333)* — 'Quillen used a filtration of the Q–construction' to prove finite generation
- *Kahn, 'Around Quillen's theorem A', 4.1 and 2.4.1* — the filtration by rank is a sequence of cellular functors, which gives the rank spectral sequence
- *N.3:finite-generation/comma-category-is-the-layer-poset* — the comma categories Q_{m−1} ↓ P of the cellular inclusions
- *N.3:finite-generation/rank-spectral-sequence* — the strata Q_m − Q_{m−1} give the E¹ terms
- *N.3:finite-generation/quillen-finiteness-criterion* — finitely many components per rank when Pic(A) is finite, and the exhaustion Q = ⋃ Q_m

**Unit tests.**

- `rankFiltration_zero_isPoint` (degenerate) — Q_0 (P(A)) is the one-object one-morphism category, for every Dedekind domain A.
- `rankStratum_int` (computation) — For A = ℤ the stratum Q_m − Q_{m−1} is equivalent to the one-object groupoid of GL_m(ℤ): one isomorphism class, ℤ^m.
- `rankStratum_one_sqrt_neg_five` (computation) — For A = 𝓞 of ℚ(√−5) the rank-one stratum has two isomorphism classes (Pic(A) ≅ ℤ/2), each with automorphism group {±1}.
- `rankFiltration_allModules_not_cellular` (non-example) — On Q(M(A)) for all finitely generated A-modules the rank-zero part contains every torsion module, e.g. A/𝔭, so it is not a point; the construction must be made on P(A) (equivalently on torsion-free modules, Kahn 4.2.7).
- `rank_le_of_hom_zero` (characterisation) — For every P, the morphisms 0 → P of Q(P(A)) are the admissible subobjects of P (K.1's QCat.hom_zero), and rank 0 ≤ rank P.

**Library.** module `TauCeti/KTheory/Arithmetic/RankFiltration`, namespace `TauCeti.QCat`.

**Sources.**

- K-book, IV.6.8–6.9, the paragraph between Bass' Conjecture 6.8 and Theorem 6.9 (PDF p. 333; book p. 325). The filtration of the Q-construction that Quillen uses; the source does not give it.

  > Quillen used a filtration of the Q–construction to prove in [154] that the groups K_n(R) are finitely generated for any Dedekind domain R such that (1) Pic(R) is finite and (2) the homology groups H_n(Aut(P), st(P ⊗_R F)) are finitely generated.

- Kahn, 4.1 (arXiv:1108.2441v3, p. 15). The filtration by rank, and the property (a) that makes the inclusions cellular; Kahn states it for locally free sheaves on a scheme, of which P(A) is the affine case.

  > Let Qn = Qn(X) be the full subcategory of Q(X) consisting of locally free sheaves of rank ≤n. Then the assumptions of Theorem 2.4.1 are satisfied because, in Q(X), there are no morphisms from a locally free sheaf of rank n to a locally free sheaf of rank < n.

- Kahn, 4.1, after (4.1) is introduced (arXiv:1108.2441v3, p. 15). Property (b).

  > Note that Qn −Qn−1 is a groupoid

- Kahn, 2.3.2, Definition (arXiv:1108.2441v3, p. 10). The notion of cellular functor used in (a).

  > Let T : C →D be a functor. We say that T is cellular if • T is fully faithful. • For any d ∈D −C and any c ∈C, D(d, c) = ∅.

### The poset of proper layers of a vector space

`ArithmeticKTheory:N.3:finite-generation/layer-poset` · *definition*

Let V be a finite-dimensional vector space over a field F. The poset J(V) of proper layers of V has as elements the pairs (W₀, W₁) of subspaces with W₀ ⊆ W₁ ⊆ V and (W₀, W₁) ≠ (0, V), ordered by (W₀, W₁) ≤ (W₀', W₁') if and only if W₀' ⊆ W₀ ⊆ W₁ ⊆ W₁' (a layer is below the layers that contain it as a subquotient). GL(V) acts on J(V) by order automorphisms, and a linear isomorphism V ≅ V' induces an isomorphism J(V) ≅ J(V'). The subposets J₀(V) = {W₀ ≠ 0} and J₁(V) = {W₁ ≠ V} cover J(V), no chain of J(V) meets both J(V) ∖ J₀(V) and J(V) ∖ J₁(V), and J₀(V) ∩ J₁(V) = {0 ≠ W₀ ⊆ W₁ ≠ V}. For dim V = 1, J(V) = {(0, 0), (V, V)} is two incomparable points; for V = 0 it is empty.

**Hypotheses.**

- V is finite-dimensional over a field F; subspaces are Mathlib's Submodule F V.
- The excluded pair (0, V) is the largest element of the full poset of layers; including it makes the poset contractible, which is why it is excluded.

**Construction.**

1. Define J(V) as a subtype of Submodule F V × Submodule F V with the stated order; check reflexivity, transitivity and antisymmetry from those of ⊆.
2. The action of g ∈ GL(V) is (W₀, W₁) ↦ (gW₀, gW₁); functoriality in linear isomorphisms likewise.
3. Covering: (W₀, W₁) ∉ J₀ ∪ J₁ would mean W₀ = 0 and W₁ = V.
4. No chain meets both complements: (0, W₁) ≤ (W₀', V) forces W₀' = 0 and so (0, V); (W₀', V) ≤ (0, W₁) forces W₁ = V and so (0, V); both are excluded.
5. dim V = 1: the only subspaces are 0 and V.

**Acceptance.**

- dim V = 1: J(V) has exactly the two incomparable elements (0, 0) and (V, V).
- dim V = 2: the elements are (0, 0), (V, V), and for each line L the three layers (0, L), (L, L), (L, V), with (0, 0) ≤ (0, L) ≥ (L, L) ≤ (L, V) ≥ (V, V): one path from (0, 0) to (V, V) through each line, the suspension of the discrete set of lines.
- Adding (0, V) back gives a poset with a largest element, hence contractible.

**Prerequisites.** `mathlib:Submodule`

**API.**

| name | role | statement |
| --- | --- | --- |
| `LayerPoset` | data | For a finite-dimensional F-vector space V, the poset of pairs (W₀, W₁) of subspaces with W₀ ≤ W₁ and (W₀, W₁) ≠ (⊥, ⊤). |
| `LayerPoset.le_iff` | characterisation | (W₀, W₁) ≤ (W₀', W₁') ↔ W₀' ≤ W₀ ∧ W₁ ≤ W₁'. |
| `LayerPoset.map` | functoriality | A linear equivalence e : V ≃ₗ[F] V' induces an order isomorphism LayerPoset V ≃o LayerPoset V'; map_refl and map_trans hold. |
| `LayerPoset.glAction` | instance | The action of GL(V) = (V ≃ₗ[F] V) on LayerPoset V by order automorphisms, (W₀, W₁) ↦ (gW₀, gW₁). |
| `LayerPoset.lowerPart` | data | J₀(V), the subposet of layers with W₀ ≠ ⊥. |
| `LayerPoset.upperPart` | data | J₁(V), the subposet of layers with W₁ ≠ ⊤. |
| `LayerPoset.lowerPart_sup_upperPart` | relation | J₀(V) ∪ J₁(V) = J(V), and no chain of J(V) meets both complements. |
| `LayerPoset.of_finrank_eq_one` | simp | If finrank F V = 1, LayerPoset V is the two-element antichain {(⊥, ⊥), (⊤, ⊤)}. |

**Used by.**

- *Kahn, 'Around Quillen's theorem A', 4.2.6 and 4.3.1* — the comma categories of the rank filtration are equivalent to the posets of proper layers
- *N.3:finite-generation/comma-category-is-the-layer-poset* — target of the equivalence Q_{n−1} ↓ P ≃ J(P ⊗ F)
- *N.3:finite-generation/layer-poset-is-the-suspended-building* — J(V) ≃ ΣT(V)

**Unit tests.**

- `layerPoset_zero` (degenerate) — LayerPoset (0 : F-vector space) is empty: the only pair (⊥, ⊥) equals (⊥, ⊤).
- `layerPoset_dim_one` (computation) — For finrank F V = 1, LayerPoset V has two elements and they are incomparable.
- `layerPoset_dim_two_card` (computation) — For V = 𝔽₂², LayerPoset V has 2 + 3·3 = 11 elements (three lines, three layers through each).
- `layerPoset_with_top_contractible` (non-example) — The poset of all layers, (⊥, ⊤) included, has a largest element, so its nerve is contractible; a definition that forgot to exclude (⊥, ⊤) would make every fibre of the rank filtration trivial.
- `layerPoset_map_gl` (compatibility) — For g ∈ GL(V), LayerPoset.map g sends (W₀, W₁) to (W₀.map g, W₁.map g) (Mathlib's Submodule.map).

**Library.** module `TauCeti/KTheory/Arithmetic/RankFiltration`, namespace `TauCeti`.

**Sources.**

- Sun, p. 5 (arXiv:1604.04700v1). The definition of J(V) with its order, verbatim (spacing of the text layer kept).

  > We denote by J(V ) the ordered set of proper layers in V . This consists of pairs (W0, W1) of subspaces of V , with W0 ⊂W1, excluding the pair (0, V ), and where (W0, W1) ≤(W ′ 0, W ′ 1) if W ′ 0 ⊂W0 ⊂W1 ⊂W ′ 1.

- Kahn, 4.3.2 (arXiv:1108.2441v3, p. 17). The dimension-one case.

  > In Corollary 4.2.6, suppose n = 1. Then Qn−1(K) ↓EK has two elements: 0 →EK and EK →0.

### The comma categories of the rank filtration are posets of layers

`ArithmeticKTheory:N.3:finite-generation/comma-category-is-the-layer-poset` · *lemma*

Let A be a Dedekind domain with fraction field F, P a finitely generated projective A-module of rank n ≥ 1 and V = P ⊗_A F. The comma category Q_{n−1} ↓ P of the inclusion Q_{n−1} ⊂ Q(P(A)) (objects: morphisms M → P of Q with rank M ≤ n − 1) is equivalent, Aut_A(P)-equivariantly, to the poset J(V) of proper layers of V: a morphism M → P is an admissible layer P₁ ↣ P₂ ↣ P with P₂/P₁ ≅ M, it is sent to (P₁ ⊗ F, P₂ ⊗ F), and rank M ≤ n − 1 says exactly that (P₁ ⊗ F, P₂ ⊗ F) ≠ (0, V). The inverse sends a subspace W ⊆ V to the pure submodule W ∩ P, which is a direct summand of P.

**Hypotheses.**

- A is a Dedekind domain; P ∈ P(A) has rank n ≥ 1; Aut_A(P) acts on V = P ⊗ F and on both sides.
- The admissible monomorphisms of P(A) into P are the injections with projective cokernel, i.e. the pure submodules of P (a finitely generated torsion-free module over a Dedekind domain is projective).

**Proof outline.**

1. A morphism M → P of Q is an admissible layer P₁ ⊆ P₂ ⊆ P with an isomorphism P₂/P₁ ≅ M (GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction); morphisms of the comma category are inclusions of layers, so Q_{n−1} ↓ P is equivalent to the poset of admissible layers with rank P₂/P₁ < n (Kahn 4.2.6, proof).
2. Pure submodules of P correspond to subspaces of V: W ↦ W ∩ P and N ↦ N ⊗ F are inverse (Kahn 4.2.4); P/(W ∩ P) embeds in V/W, so it is finitely generated and torsion-free, hence flat (mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot) and finitely presented, hence projective (mathlib:Module.Flat.projective_of_finitePresentation), and W ∩ P is a direct summand (Putman–Studenmund §4.1).
3. A layer has rank P₂/P₁ = n exactly when P₁ = 0 and P₂ = P, i.e. when its image is (0, V).
4. Equivariance: g ∈ Aut_A(P) acts on layers and on J(V) through g ⊗ F, and the bijection commutes with it.

**Acceptance.**

- n = 1: Q_0 ↓ P has two objects, 0 ↣ P (the subobject 0) and P ↠ 0 (the quotient of P onto 0), matching J(V) = {(0, 0), (V, V)}.
- A = ℤ, P = ℤ²: the lines of ℚ² correspond to the rank-one direct summands of ℤ², i.e. to primitive vectors up to sign.
- A non-pure submodule such as 2ℤ ⊂ ℤ is not an admissible subobject of ℤ in P(ℤ): its cokernel ℤ/2 is not projective.

**Prerequisites.** `ArithmeticKTheory:N.3:finite-generation/rank-filtration`, `ArithmeticKTheory:N.3:finite-generation/layer-poset`, `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`, `mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot`, `mathlib:Module.Flat.projective_of_finitePresentation`

**Sources.**

- Kahn, 4.2.4, Proposition (arXiv:1108.2441v3, p. 16). Pure submodules of P ↔ subspaces of V (for X = Spec A); the text layer renders ↦ as '7→'.

  > Let E be a (coherent) torsion-free sheaf on X, with generic ﬁbre EK. Then the map F 7→FK deﬁnes a bijection from the set Gr(E) of pure subsheaves of E to the set Gr(EK) of subvector spaces of EK.

- Kahn, 4.2.6, Corollary, with its proof (arXiv:1108.2441v3, p. 16). The equivalence of the comma category with the poset of proper layers.

  > Then the functor j∗: Qtf n−1(X) ↓E →Qn−1(K) ↓EK is an equivalence of categories. Proof. These categories are equivalent to the ordered sets of proper layers of torsion-free subsheaves of E and j∗E

- Kahn, 4.2.7, Example (arXiv:1108.2441v3, p. 17). For a Dedekind domain the torsion-free and the projective versions agree.

  > As is well-known, a coherent sheaf F over a Dedekind scheme is torsion-free if and only if it is locally free.

- Putman–Studenmund, §4.1, 'Subspace stabilizers and projective modules' (arXiv:1909.01217v4, p. 17). W ∩ P is a direct summand, with the same one-line proof.

  > For a subspace V of Kn = Q ⊗K, the intersection V ∩Q is a direct summand of Q.

### The layer poset is the suspension of the Tits building

`ArithmeticKTheory:N.3:finite-generation/layer-poset-is-the-suspended-building` · *lemma*

Let V be an F-vector space of dimension n ≥ 1 and T(V) its Tits building, the poset of proper non-zero subspaces (empty for n = 1), imported from BorelRegulators R.1. Then the nerve of J(V) is GL(V)-equivariantly homotopy equivalent to the unreduced suspension ΣT(V) (two points for n = 1). Consequently J(V) has the homotopy type of a wedge of (n − 1)-spheres, its reduced integral homology is concentrated in degree n − 1, and H̃_{n−1}(J(V); ℤ) ≅ St(V) := H̃_{n−2}(T(V); ℤ) as ℤ[GL(V)]-modules, with St(V) = ℤ (trivial action) for n = 1. For n = 2, T(V) is the discrete set of lines and St(V) is the kernel of the augmentation ℤ[lines] → ℤ, the reduced homology, not H₀(T(V)).

**Hypotheses.**

- n = dim V ≥ 1. The building T(V), the Solomon–Tits theorem (T(V) is a wedge of (n − 2)-spheres for n ≥ 2) and the Steinberg module St(V) with its GL(V)-action are BorelRegulators R.1's (RT-AREA-ktheory-1/1); this node uses them and proves only the comparison with J(V).
- Homology is reduced homology: with unreduced H₀ the rank-two term would be wrong (Sun's remark on Ash–Rudolph).

**Proof outline.**

1. J₀(V) is contractible: (W₀, W₁) ≤ (W₀, V) ≥ (V, V) in J₀(V), a zigzag of monotone maps to a constant (StableHomotopyKTheory H.1: comparable monotone maps induce homotopic maps of nerves); likewise J₁(V) through (W₀, W₁) ≤ (0, W₁) ≥ (0, 0).
2. J₀(V) ∩ J₁(V) = {0 ≠ W₀ ⊆ W₁ ≠ V} is the poset of closed intervals [W₀, W₁] of T(V) ordered by inclusion; the map (W₀, W₁) ↦ W₁ to T(V) is order-preserving, and the preimage of T(V)_{≤W} is contractible, since (W₀, W₁) ≤ (W₀, W) ≥ (W, W) there; by Quillen's Theorem A (StableHomotopyKTheory H.2) it is a homotopy equivalence.
3. Since no chain of J(V) meets both complements (N.3:finite-generation/layer-poset), the nerve of J(V) is the union of the nerves of J₀(V) and J₁(V) along that of their intersection: two cones on T(V), i.e. ΣT(V). Every step is GL(V)-equivariant.
4. Apply the Solomon–Tits theorem (R.1): ΣT(V) is a wedge of (n − 1)-spheres, so H̃_*(J(V)) is St(V) in degree n − 1 and zero elsewhere; for n = 1 the two points give H̃₀ = ℤ with trivial action.

**Acceptance.**

- n = 1: J(V) is two points, H̃₀ = ℤ = St(V).
- n = 2, F = ℚ: H̃₁(J(V)) ≅ St(V) = ker(ℤ[ℙ¹(ℚ)] → ℤ), a free abelian group of infinite rank.
- n = 3, F = 𝔽₂ (a finite field, as a check of the building side): T(V) is the incidence graph of the Fano plane, a wedge of 2³ = 8 circles, and J(V) ≃ a wedge of eight 2-spheres.

**Prerequisites.** `ArithmeticKTheory:N.3:finite-generation/layer-poset`, `BorelRegulators:R.1`, `StableHomotopyKTheory:H.1`, `StableHomotopyKTheory:H.2`

**Sources.**

- Kahn, 4.3.1 (arXiv:1108.2441v3, p. 17). The statement, with Quillen's proposition as Kahn cites it (Quillen's paper itself was not read; the proof steps are this packet's).

  > By [12, Prop. p. 188], the classifying space of the poset Qn−1(K) ↓EK = J(EK) is GL(EK)-weakly equivalent to the suspension of nerve of the Tits building of EK, which in turn is weakly equivalent to a wedge of (n −2)-spheres by the Solomon-Tits theorem

- Sun, p. 6 (arXiv:1604.04700v1). Why the Steinberg module in rank two must be reduced homology.

  > However, their deﬁnition takes the homology of Tits buildings rather than reduced homologies. So there is a slight mistake in the paper [1] in the case of n = dim(V ) = 2.

- Putman–Studenmund, §1, 'Special linear group and the Steinberg module' (arXiv:1909.01217v4, p. 3). Solomon–Tits and the definition of the Steinberg module ('eH' is the text layer's H̃), which R.1 supplies.

  > The Solomon–Tits theorem [18, 6] says that Tn(K) is homotopy equivalent to a wedge of (n−2)-spheres. The Steinberg module Stn(K) is eHn−2(Tn(K)).

### Quillen's rank spectral sequence

`ArithmeticKTheory:N.3:finite-generation/rank-spectral-sequence` · *theorem* · planet **Quillen's rank spectral sequence**

Let A be a Dedekind domain with fraction field F. There is a spectral sequence of homological type E¹_{p,q} = ⊕_{[P], rank P = p} H_q(Aut_A(P); St(P ⊗_A F)) ⇒ H_{p+q}(BQ(P(A)); ℤ) for p ≥ 1, with E¹_{0,q} = H_q(BQ_0) = ℤ for q = 0 and 0 otherwise, where [P] runs over the isomorphism classes of projectives of rank p and H_q is group homology (Mathlib's groupHomology of the ℤ-linear representation St(P ⊗ F)). Equivalently, for each n ≥ 1 there is a long exact sequence ⋯ → H_i(BQ_{n−1}) → H_i(BQ_n) → ⊕_{[P], rank P = n} H_{i−n}(Aut_A(P); St(P ⊗ F)) → H_{i−1}(BQ_{n−1}) → ⋯, which is Quillen's Theorem 3 (1973). The E¹ term vanishes for q < 0, and in total degree i only the columns 0 ≤ p ≤ i contribute.

**Hypotheses.**

- A is a Dedekind domain; the coefficients are integral. No finiteness of Pic(A) is needed for the spectral sequence itself.
- St(P ⊗ F) is the reduced Steinberg module of N.3:finite-generation/layer-poset-is-the-suspended-building, with St = ℤ in rank one; Aut_A(P) acts through Aut_A(P) ⊂ GL(P ⊗ F).
- The homotopy theory of categories used, Thomason's homotopy-colimit theorem and the cofibre sequence of a cellular functor, is requested from StableHomotopyKTheory H.2; the comparison of the homology of a one-object groupoid with local coefficients with group homology is H.1's.

**Proof outline.**

1. The inclusions Q_{n−1} ⊂ Q_n are cellular and Q = ⋃ Q_n (N.3:finite-generation/rank-filtration), so the cellular-filtration spectral sequence (Kahn, Theorem 2.4.1, from Corollary 2.3.7) gives E¹_{p,q} = H_{p+q−1}(Q_p − Q_{p−1}, F̃_p) ⇒ H_{p+q}(BQ), with F̃_p the reduced coefficient system P ↦ C_*(Q_{p−1} ↓ P) on the groupoid Q_p − Q_{p−1}.
2. Q_p − Q_{p−1} ≃ ⊔_{[P]} Aut_A(P) (rank-filtration (b)), so the homology with coefficients splits as a direct sum over [P] of the homology of the one-object groupoid Aut_A(P) with coefficients in the reduced chains of Q_{p−1} ↓ P (H.1).
3. Q_{p−1} ↓ P ≃ J(P ⊗ F) (N.3:finite-generation/comma-category-is-the-layer-poset), whose reduced homology is St(P ⊗ F) concentrated in degree p − 1 (N.3:finite-generation/layer-poset-is-the-suspended-building). The hyperhomology spectral sequence (Kahn, Lemma 1.3.5) collapses: H_{p+q−1}(Aut P, C̃_*(J)) ≅ H_q(Aut P; St).
4. The long exact sequences are the exact couple of the filtration; Kahn's Remark 4.3.4 (Vogel's argument) shows that they agree with Quillen's.

**Acceptance.**

- A = ℤ, total degree one: E¹_{0,1} = 0 and E¹_{1,0} = H₀(GL₁(ℤ); ℤ) = ℤ, and H₁(BQ(P(ℤ))) = π₁(BQ)^{ab} = K₀(ℤ) = ℤ; so the differential d¹ : E¹_{2,0} → E¹_{1,0} vanishes.
- Rank two over ℤ, rationally: by virtual duality with Putman–Studenmund's dualizing module St₂(ℚ) ⊗ ℤ_det (Theorem C; vcd GL₂(ℤ) = 1), H_q(GL₂(ℤ); St₂(ℚ) ⊗ ℚ) ≅ H^{1−q}(GL₂(ℤ); ℚ_det), which vanishes for q = 0, 1 (H¹(SL₂(ℤ); ℚ) = 0 and det is non-trivial); with the untwisted module the identification would be wrong (their Example 1.4).
- In total degree i only p ≤ i contributes: H_i(BQ_n) → H_i(BQ) is onto for n ≥ i and bijective for n ≥ i + 1.

**Prerequisites.** `ArithmeticKTheory:N.3:finite-generation/rank-filtration`, `ArithmeticKTheory:N.3:finite-generation/comma-category-is-the-layer-poset`, `ArithmeticKTheory:N.3:finite-generation/layer-poset-is-the-suspended-building`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `StableHomotopyKTheory:H.1`, `StableHomotopyKTheory:H.2`, `mathlib:groupHomology`

**Sources.**

- Kahn, 4.3.3, Theorem (arXiv:1108.2441v3, p. 17). The E¹ term, verbatim up to the typesetting of the direct sum; for X = Spec A with A Dedekind the torsion-free sheaves are the projectives (4.2.7).

  > If X is an integral scheme, then the E1-terms of the rank spectral sequence (4.2) (with Z-coeﬃcients) are E1 p,q = ⊕ Eα Hq(Aut(Eα), st(Eα)) where Eα runs through the isomorphism classes of torsion-free sheaves of rank p, and st(Eα) = ˜Hp−1((Fp)|Eα) is the [reduced] Steinberg module

- Kahn, 2.4.1, Theorem (arXiv:1108.2441v3, p. 12). The spectral sequence of a cellular filtration (step 1).

  > The functors Tn : Qn−1 →Qn are cellular (2.3.2). • Q = lim −→Qn. Write Fn for FTn. Then, for any abelian group A, there is a spectral sequence of homological type E1 p,q = Hp+q−1(Qp −Qp−1, ˜Fp; A) ⇒Hp+q(Q, A).

- Kahn, 4.3.4, Remark (arXiv:1108.2441v3, p. 17). Identification with Quillen's Theorem 3.

  > By an argument of Vogel, the exact sequences from Corollary 2.3.7 then coincide with those of Quillen in [12, Th. 3 p. 181].

- Kahn, Introduction (arXiv:1108.2441v3, p. 1). Quillen's exact sequences assemble into this spectral sequence.

  > Inspection shows immediately that the exact sequences of [12, Th. 3], used by Quillen to prove that the K-groups of A are finitely generated when A is a ring of S-integers in a global field, assemble to define an exact couple, hence a spectral sequence converging to the homology of KA.

### Quillen's finiteness criterion for a Dedekind domain

`ArithmeticKTheory:N.3:finite-generation/quillen-finiteness-criterion` · *theorem*

Let R be a Dedekind domain with fraction field F. Suppose that (1) Pic(R) is finite, and (2) for every finitely generated projective R-module P of positive rank and every q ≥ 0 the group H_q(Aut_R(P); St(P ⊗_R F)) is a finitely generated abelian group. Then H_i(BQ(P(R)); ℤ) is finitely generated for every i, and K_n(R) is a finitely generated abelian group for every n ≥ 0. This node is the assembly: it combines the rank spectral sequence with the two hypotheses and passes from homology to homotopy; hypothesis (2) for R = 𝓞_F is N.3:finite-generation/steinberg-homology-of-automorphism-groups.

**Hypotheses.**

- R is a Dedekind domain with fraction field F; K_n(R) = π_{n+1} BQ(P(R)) (GeneralAlgebraicKTheory K.1/K-groups-of-exact-categories).
- Pic(R) is finite (hypothesis (1) of the source).
- For every finitely generated projective P of positive rank and every q, H_q(Aut_R(P); St(P ⊗_R F)) is finitely generated (hypothesis (2), written st(P ⊗_R F) in the source), with integral coefficients.
- The passage from homology to homotopy is Serre's theorem for simple spaces, requested from StableHomotopyKTheory H.6; BQ(P(R)) is simple because direct sum makes it a connected H-space.

**Proof outline.**

1. Total degree i of the rank spectral sequence (N.3:finite-generation/rank-spectral-sequence): E¹_{p,q} with p + q = i, q ≥ 0 and p ≥ 0, so 0 ≤ p ≤ i — finitely many columns.
2. Each E¹_{p,q} is a finite direct sum (by (1), finitely many isomorphism classes of each rank, N.3:finite-generation/rank-filtration (e)) of groups that are finitely generated by (2); E¹_{0,q} is ℤ or 0.
3. The filtration of H_i(BQ) is finite and exhaustive (rank-filtration (c)), with subquotients subquotients of E¹ terms of total degree i; so H_i(BQ; ℤ) is finitely generated.
4. Direct sum ⊕ : P(R) × P(R) → P(R) is exact, so it induces Q(P(R)) × Q(P(R)) → Q(P(R)) and, since the nerve and realisation preserve finite products (StableHomotopyKTheory H.1), a multiplication BQ × BQ → BQ with unit 0 up to the homotopy given by the natural isomorphism 0 ⊕ M ≅ M; BQ is connected (π₀ is one point), so it is a connected H-space, hence simple.
5. Serre's theorem (StableHomotopyKTheory H.6, request): for a simple space with finitely generated integral homology in every degree, every homotopy group is finitely generated. Hence K_n(R) = π_{n+1} BQ is finitely generated.

**Acceptance.**

- For R = ℤ both hypotheses hold (Pic(ℤ) = 0; hypothesis (2) for GL_m(ℤ) by N.3:finite-generation/steinberg-homology-of-automorphism-groups), so K_n(ℤ) is finitely generated for every n.
- A finiteness hypothesis on Pic(R) cannot be dropped: K_0(R) = ℤ ⊕ Pic(R) (KTheoryLowDegrees Z.4), and for the coordinate ring R of an elliptic curve over ℂ with one point removed Pic(R) ≅ E(ℂ) is not finitely generated, so neither is K_0(R).
- Rational finiteness of (2) would give only finite-dimensionality of H_i(BQ) ⊗ ℚ and so of K_n(R) ⊗ ℚ; integral finite generation needs (2) integrally.

**Prerequisites.** `ArithmeticKTheory:N.3:finite-generation/rank-spectral-sequence`, `ArithmeticKTheory:N.3:finite-generation/rank-filtration`, `KTheoryLowDegrees:Z.4/projective-classification`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `StableHomotopyKTheory:H.1`, `StableHomotopyKTheory:H.6`

**Sources.**

- K-book, IV.6.8–6.9, the paragraph between Bass' Conjecture 6.8 and Theorem 6.9 (PDF p. 333; book p. 325). The criterion with both hypotheses, verbatim (reference numbers kept, cross-reference tags dropped); the source gives no proof, which is decomposed here from Kahn's rank spectral sequence.

  > Quillen used a filtration of the Q–construction to prove in [154] that the groups K_n(R) are finitely generated for any Dedekind domain R such that (1) Pic(R) is finite and (2) the homology groups H_n(Aut(P), st(P ⊗_R F)) are finitely generated.

- Kahn, Introduction (arXiv:1108.2441v3, p. 1). Quillen's proof runs through these exact sequences.

  > Inspection shows immediately that the exact sequences of [12, Th. 3], used by Quillen to prove that the K-groups of A are finitely generated when A is a ring of S-integers in a global field, assemble to define an exact couple, hence a spectral sequence converging to the homology of KA.

- Sun, p. 7 (arXiv:1604.04700v1). The two hypotheses in the form used here.

  > Actually, Quillen showed that A satisﬁes (1) Pic(A) is ﬁnite (this is actually a classical result). (2) If d is a ﬁnitely generated projective A-module and V = d ⊗A K, then Hi(Aut(d), St(V )) is a ﬁnitely generated Abelian group for every i.

### Finite generation of the Steinberg homology of Aut(P), nonfree P included

`ArithmeticKTheory:N.3:finite-generation/steinberg-homology-of-automorphism-groups` · *lemma*

Let F be a number field, A = 𝓞_F and P a finitely generated projective A-module of rank n ≥ 1 (free or not), V = P ⊗_A F. Choosing an F-basis V ≅ Fⁿ, the group Aut_A(P) ⊂ GL(V) ≅ GL_n(F) is commensurable with GL_n(𝓞_F): Aut_A(P) ∩ GL_n(𝓞_F) has finite index in both. Hence, by BorelRegulators R.1's finiteness of the Steinberg homology of arithmetic groups, H_i(Aut_A(P); St(V)) is a finitely generated abelian group for every i ≥ 0 — integrally, not only after ⊗ ℚ. In rank one Aut_A(P) = 𝓞_F^× and St(V) = ℤ. This is hypothesis (2) of Quillen's criterion for A = 𝓞_F.

**Hypotheses.**

- F a number field, A = 𝓞_F, n = rank P ≥ 1; the identification St(V) ≅ St_n(F) is induced by the chosen basis and is equivariant for Aut_A(P) → GL_n(F).
- R.1 supplies (request): for every n ≥ 1 and every subgroup Γ ⊂ GL_n(F) commensurable with GL_n(𝓞_F), H_i(Γ; St_n(F)) is finitely generated for all i, proved from the duality of torsion-free finite-index subgroups with the twisted dualizing module St_n(F) ⊗ ℤ_χ^{⊗(n−1)}, χ = N_{F/ℚ} ∘ det (Putman–Studenmund, Theorem C), and descent through a normal subgroup of finite index. Rational duality alone would give only finite-dimensionality of H_i ⊗ ℚ, which does not suffice.
- The node owns the passage from GL_n(𝓞_F) to Aut_A(P) for nonfree P and the low ranks; it does not re-prove the arithmetic finiteness.

**Proof outline.**

1. Under V ≅ Fⁿ, L = 𝓞_Fⁿ and P are two 𝓞_F-lattices spanning V; there is a nonzero N ∈ ℤ with N·L ⊆ P ⊆ N⁻¹·L (both are finitely generated and span V).
2. The principal congruence subgroup Γ_L(N²) = ker(GL(L) → GL(L/N²L)) preserves P: for x ∈ P ⊆ N⁻¹L and g ∈ Γ_L(N²), (g − 1)x ∈ N²·N⁻¹L = N·L ⊆ P, and likewise for g⁻¹; it has finite index in GL(L) = GL_n(𝓞_F) because L/N²L is finite. Symmetrically Γ_P(N²) ⊆ GL(L) has finite index in Aut_A(P). So the two groups are commensurable.
3. Apply R.1's finiteness of H_i(Γ; St_n(F)) to Γ = Aut_A(P), transported along the equivariant identification St(V) ≅ St_n(F).
4. Rank one: End_A(P) = A for an invertible module P, so Aut_A(P) = 𝓞_F^× = GL₁(𝓞_F), and St(V) = ℤ (N.3:finite-generation/layer-poset-is-the-suspended-building); this is R.1's case n = 1, the homology of the finitely generated abelian group 𝓞_F^×.

**Acceptance.**

- A = ℤ, P = ℤⁿ: Aut(P) = GL_n(ℤ) itself.
- A = 𝓞 of ℚ(√−5), P = 𝓞 ⊕ 𝔭₂ (rank two, not free, since det P = [𝔭₂] is the non-trivial class): Aut(P) is an arithmetic group commensurable with GL₂(𝓞), containing the principal congruence subgroup of level N² of GL₂(𝓞) for N = 2 (since 2·𝓞² ⊆ P ⊆ 𝓞²).
- Rank one: H_i(𝓞_F^×; ℤ) is finitely generated for every i because 𝓞_F^× ≅ μ(F) × ℤ^{r_1+r_2−1}.
- The untwisted Steinberg module is not the dualizing module of GL₂(ℤ) (Putman–Studenmund, Example 1.4); the finiteness statement imported from R.1 is insensitive to the twist, but its proof must use the right module.

**Prerequisites.** `ArithmeticKTheory:N.3:finite-generation/layer-poset-is-the-suspended-building`, `BorelRegulators:R.1`, `KTheoryLowDegrees:Z.4/steinitz`, `mathlib:NumberField.RingOfIntegers`

**Sources.**

- K-book, IV.6.8–6.9, the paragraph between Bass' Conjecture 6.8 and Theorem 6.9 (PDF p. 333; book p. 325). Hypothesis (2), whose verification for rings of integers this node assembles from R.1.

  > Quillen used a filtration of the Q–construction to prove in [154] that the groups K_n(R) are finitely generated for any Dedekind domain R such that (1) Pic(R) is finite and (2) the homology groups H_n(Aut(P), st(P ⊗_R F)) are finitely generated.

- K-book, IV.6.8–6.9, the sentence before Theorem 6.9 (PDF p. 333; book p. 325). Quillen's verification of (2) for number fields, which the source does not reproduce.

  > He then veriﬁed (2) in [154] (number ﬁeld case) and [75] (aﬃne curves).

- Sun, p. 7 (arXiv:1604.04700v1). The statement for every projective d, and the descent through a normal subgroup of finite index that R.1's proof uses.

  > (2) If d is a ﬁnitely generated projective A-module and V = d ⊗A K, then Hi(Aut(d), St(V )) is a ﬁnitely generated Abelian group for every i. In particular, for Γ = Aut(d) and d ∈D −C we may ﬁnd a normal subgroup Γ′ of Γ of ﬁnite index so that there is a Hochschild-Serre spectral sequence

- Putman–Studenmund, Theorem C (arXiv:1909.01217v4, p. 4). The correctly twisted dualizing module on which R.1's finiteness rests (RT-AREA-ktheory-1/1, verifier).

  > Letting χ: GLn(O) →{±1} be the composition of the determinant homomorphism with the norm map O× →{±1}, we then have D ∼= Stn(K) ⊗(Zχ)⊗(n−1).

### Quillen's finite generation theorem for rings of integers

`ArithmeticKTheory:N.3:finite-generation/quillen-finite-generation-theorem` · *theorem* · planet **Quillen's finite generation theorem**

Let R be an integrally closed subring of a number field F which is finite over Z. Then K_n(R) is a finitely generated abelian group for every n ≥ 0. Being integral over Z and integrally closed, such an R is the ring of integers of its fraction field, so this is the theorem for rings of integers 𝓞_F. The source's Theorem IV.6.9 also covers the coordinate ring of a smooth affine curve over a finite field; that half is outside this roadmap and is not planned here.

**Hypotheses.**

- R ⊂ F is integrally closed and finitely generated as a Z-module, as the source's 'finite over Z' says; hence R = 𝓞_{F'} with F' = Frac(R).
- A ring of S-integers with S non-empty is not finite over Z (Z[1/2] is not a finitely generated Z-module), so it is not covered by this theorem as printed; it is the next node, finite-generation-of-K-of-S-integers.

**Proof outline.**

1. Hypothesis (1) of quillen-finiteness-criterion: the class group of a ring of integers is finite (mathlib:NumberField.RingOfIntegers.instFintypeClassGroup).
2. Hypothesis (2): for every finitely generated projective 𝓞_F-module P of positive rank, H_q(Aut(P); St(P ⊗ F)) is finitely generated (N.3:finite-generation/steinberg-homology-of-automorphism-groups, which imports the arithmetic finiteness from BorelRegulators R.1; the source: 'He then verified (2) in [154] (number field case)').
3. Apply quillen-finiteness-criterion.

**Acceptance.**

- K_n(Z) is finitely generated for every n.
- Degree zero: K_0(𝓞_F) = Z ⊕ Cl(𝓞_F) is finitely generated because the class group is finite.
- Degree one: K_1(𝓞_F) = 𝓞_F^× (SK_1(𝓞_F) = 0, KTheoryLowDegrees U.4) is finitely generated, in agreement with Mathlib's Dirichlet unit theorem (the Monoid.FG instance for (𝓞 F)ˣ in NumberTheory/NumberField/Units/DirichletTheorem.lean).

**Prerequisites.** `ArithmeticKTheory:N.3:finite-generation/quillen-finiteness-criterion`, `ArithmeticKTheory:N.3:finite-generation/steinberg-homology-of-automorphism-groups`, `mathlib:NumberField.RingOfIntegers.instFintypeClassGroup`

**Sources.**

- K-book, IV.6.9 (PDF p. 333; book p. 325). The theorem, verbatim; this node states its number-field half. 'Finite over Z' makes R a ring of integers.

  > Theorem 6.9. (Quillen) Let R be either an integrally closed subring of a number field F, finite over Z, or else the coordinate ring of a smooth affine curve over a finite field. Then K_n(R) is a finitely generated group for all n.

- K-book, IV.6.8–6.9, the sentence before Theorem 6.9 (PDF p. 333). The verification of hypothesis (2) for rings of integers, assembled in N.3:finite-generation/steinberg-homology-of-automorphism-groups from BorelRegulators R.1.

  > He then verified (2) in [154] (number field case) and [75] (affine curves).

## N.3:ranks — Rank comparison

The passage from the ring of integers to the S-integers, and the degree it does not cover.

| n mod 4 | rank Kₙ(O_{F,S}), n ≥ 2 |
| --- | --- |
| 1 | r₁ + r₂ |
| 3 | r₂ |
| even | 0 |

Borel's theorem for the order `𝓞_F` is `BorelRegulators:R.3`'s; this layer owns only the passage to `O_{F,S}` (RT-AREA-ktheory-1/7), by the localisation sequence with finite residue terms.

**Degree one is not covered.** There the rank is the S-unit rank `r₁ + r₂ + |S| − 1` of Dirichlet's S-unit theorem (`KTheoryLowDegrees:U.4`), which differs from the table already for `S = ∅`.

**The ring is not the field.** The positive even groups of `O_{F,S}` are finite; those of `F` are infinite. The K-book's Classical Data VI.8.1 prints `K_n(F)` where it means `K_n(O_S)` (source issue E15).

Coverage: **source_decomposed**.

Three nodes (RT-AREA-ktheory-1/7). borel-rank-theorem is narrowed to the passage from 𝓞_F to 𝓞_{F,S}: for n ≥ 2, K_n(𝓞_F) → K_n(𝓞_{F,S}) → K_n(F) are rational isomorphisms by the localisation sequences of N.2 and the finiteness of K_m(𝔽_q) (L.1), so rank K_n(𝓞_{F,S}) = rank K_n(𝓞_F), which is imported from BorelRegulators R.3 (Borel's theorem for orders, 𝓞_F included); in degree one the passage fails and the rank is the S-unit rank r_1 + r_2 + |S| − 1 of KTheoryLowDegrees U.4's Dirichlet S-unit theorem (RT-AREA-ktheory-1/24), which carries the stage's 'The rank of K₁ is the S-unit rank, not the n≡1 formula'. even-K-groups-of-S-integers-are-finite states 'Thus positive even groups of S-integers are finite' for the ring (not for the field, where the K-book's VI.8.1 misprints it, E15); SpecialValuesBirchTate B.1 imports it for the finiteness of K₂(𝓞_F) (RT-AREA-ktheory-1/10). even-K-groups-of-the-field-are-infinite-torsion proves 'The positive even groups of the field itself are generally infinite torsion groups, as N.2 makes visible' (in fact for every i ≥ 1) without Soulé's theorem. The former non-example node the-first-K-group-is-not-covered is deleted: it restated U.4's rank.

### Ranks of the K-groups of S-integers: the passage from the ring of integers, and the degree-one exception

`ArithmeticKTheory:N.3:ranks/borel-rank-theorem` · *theorem* · planet **Ranks of K-groups of S-integers**

Let F be a number field with r_1 real and r_2 complex places (Mathlib's nrRealPlaces and nrComplexPlaces), S a finite set of nonzero primes of 𝓞_F and 𝓞_{F,S} = S.integer F. (a) For every n ≥ 2 the maps K_n(𝓞_F) → K_n(𝓞_{F,S}) → K_n(F) become isomorphisms after ⊗ ℚ; hence rank K_n(𝓞_{F,S}) = rank K_n(𝓞_F), which by Borel's theorem for the order 𝓞_F (imported from BorelRegulators R.3; K-book IV.1.17–1.18) is r_1 + r_2 if n ≡ 1 (mod 4), r_2 if n ≡ 3 (mod 4) and 0 if n is even. (b) In degree one the passage fails: K_1(𝓞_F) → K_1(𝓞_{F,S}) is injective with cokernel of rank |S|, because the residue terms K_0(k(𝔭)) = ℤ are not torsion, and rank K_1(𝓞_{F,S}) = r_1 + r_2 + |S| − 1, the rank of Dirichlet's S-unit theorem (KTheoryLowDegrees U.4), not the n ≡ 1 value r_1 + r_2. This node owns only the passage from 𝓞_F to 𝓞_{F,S} and to F; the rank theorem for 𝓞_F and for orders is R.3's.

**Hypotheses.**

- n ≥ 2 in (a). The rank is dim_ℚ K_n ⊗ ℚ; since K_n(𝓞_{F,S}) is finitely generated (N.3:finite-generation) it is the rank of a finitely generated abelian group.
- 𝓞_{F,S} with S ≠ ∅ is not an order in the source's sense ('a subring of A which is finitely generated over Z and has R ⊗ Q = A'), so Borel's Theorem IV.1.17 does not apply to it; the passage from 𝓞_F is this node's (RT-AREA-ktheory-1/7), by the localisation sequence of 𝓞_F ⊂ 𝓞_{F,S} = 𝓞_F[1/s] with the finitely many residue fields k(𝔭), 𝔭 ∈ S.
- The finiteness of the positive even groups is for the ring, not for the field: K_{2i}(F) is infinite (N.3:ranks/even-K-groups-of-the-field-are-infinite-torsion), and the K-book's Classical Data VI.8.1 prints K_n(F) there by mistake (sourceIssues ArithmeticKTheory/E15).

**Proof outline.**

1. Import from BorelRegulators R.3 Borel's theorem for the order 𝓞_F of the number field F (K-book IV.1.17 with A = F, R = 𝓞_F, and IV.1.18 with A = F): for n ≥ 2, K_n(𝓞_F) ⊗ ℚ ≅ K_n(F) ⊗ ℚ has dimension r_1 + r_2, r_2 or 0 according as n ≡ 1 (mod 4), n ≡ 3 (mod 4) or n is even.
2. Write 𝓞_{F,S} = 𝓞_F[1/s] with the primes dividing s exactly those of S (N.1/S-integers-as-a-localisation). The localisation sequence of 𝓞_F → 𝓞_F[1/s] (N.2/finite-support: its fibre term is ⊕_{𝔭∈S} K_*(k(𝔭))) reads ⋯ → ⊕_{𝔭∈S} K_n(k(𝔭)) → K_n(𝓞_F) → K_n(𝓞_{F,S}) → ⊕_{𝔭∈S} K_{n−1}(k(𝔭)) → ⋯.
3. For n ≥ 2 both residue terms are finite (K_m(𝔽_q) is finite for m ≥ 1, KTheoryFiniteLocalFields L.1); ⊗ ℚ is exact, so K_n(𝓞_F) ⊗ ℚ ≅ K_n(𝓞_{F,S}) ⊗ ℚ.
4. The same argument with the sequence (6.6) of 𝓞_{F,S} ⊂ F (N.2/localisation-sequence-for-a-dedekind-domain), whose residue terms are torsion in the relevant degrees, gives K_n(𝓞_{F,S}) ⊗ ℚ ≅ K_n(F) ⊗ ℚ, compatibly with step 1.
5. Conclude with finite generation (N.3:finite-generation/finite-generation-of-K-of-S-integers): the rank of the finitely generated group K_n(𝓞_{F,S}) is dim_ℚ K_n(𝓞_{F,S}) ⊗ ℚ.
6. (b) Degree one: K_1 = units (N.1/K1-of-S-integers-and-the-determinant), and the degree-one end of the relative sequence is the S-unit sequence 1 → 𝓞_F^× → 𝓞_{F,S}^× → ⊕_{𝔭∈S} ℤ → Cl(𝓞_F) (N.2/S-unit-and-class-group-sequence); Cl(𝓞_F) is finite, so the image in ⊕_{𝔭∈S} ℤ has finite index and the cokernel of K_1(𝓞_F) → K_1(𝓞_{F,S}) has rank |S|. With Dirichlet's S-unit theorem (KTheoryLowDegrees U.4) this is rank r_1 + r_2 + |S| − 1.

**Acceptance.**

- K_3(ℤ), K_7(ℤ) and every K_{2j}(ℤ), j ≥ 1, have rank 0, while K_5(ℤ) and K_9(ℤ) have rank 1 (r_1 = 1, r_2 = 0); the same holds for ℤ[1/p], since K_n(ℤ) → K_n(ℤ[1/p]) is a rational isomorphism for n ≥ 2.
- For F = ℚ(√−1) (r_1 = 0, r_2 = 1) every K_n(ℤ[√−1]) with n odd and n ≥ 3 has rank 1.
- For a real quadratic field (r_1 = 2, r_2 = 0), rank K_5 = 2 and rank K_3 = 0; for an imaginary quadratic field rank K_3 = rank K_5 = 1.
- For n ≥ 2 the rank does not depend on S.
- Degree one is excluded, and must be excluded by the hypothesis n ≥ 2 rather than by a check of values: rank K_1(𝓞_{F,S}) = r_1 + r_2 + |S| − 1, which equals the n ≡ 1 value r_1 + r_2 exactly when |S| = 1. For ℤ it is 0 against 1, for ℤ[1/6] it is 2 against 1, and for ℤ[1/2] both are 1; K_1(ℤ) = {±1} → K_1(ℤ[1/2]) = {±1} × 2^ℤ has cokernel ℤ, of rank |S| = 1.
- The source's own degree-one warning: for the group ring ℤ[C_p] of a cyclic group of prime order p ≥ 3, r_1 + r_2 = (p + 1)/2 while K_1(ℤ[C_p]) has rank (p − 3)/2.

**Prerequisites.** `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`, `ArithmeticKTheory:N.1/S-integers-as-a-localisation`, `ArithmeticKTheory:N.1/K1-of-S-integers-and-the-determinant`, `ArithmeticKTheory:N.2/finite-support`, `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `ArithmeticKTheory:N.2/S-unit-and-class-group-sequence`, `BorelRegulators:R.3`, `KTheoryFiniteLocalFields:L.1`, `KTheoryLowDegrees:U.4`, `mathlib:NumberField.InfinitePlace.nrRealPlaces`, `mathlib:NumberField.InfinitePlace.nrComplexPlaces`

**Sources.**

- K-book, IV.1.18 (PDF p. 279; book p. 271). Borel's theorem, verbatim with its cases display written on one line; imported from R.3 with A = F.

  > Theorem 1.18. (Borel) Let F be a number field, and A a central simple F-algebra. Then for n ≥ 2 we have K_n(A) ⊗ Q ≅ K_n(F) ⊗ Q and rank K_n(A) ⊗ Q = r_2, n ≡ 3 (mod 4); r_1 + r_2, n ≡ 1 (mod 4); 0, else.

- K-book, IV.1.17 (PDF p. 279; book p. 271). Borel's comparison for orders, imported from R.3 for the order 𝓞_F; 𝓞_{F,S} with S ≠ ∅ is not an order, which is why this node passes from 𝓞_F to 𝓞_{F,S} itself.

  > Theorem 1.17. (Borel) Let A be a finite dimensional semisimple Q-algebra. Then for every order R in A we have K_n(R) ⊗ Q ≅ K_n(A) ⊗ Q for all n ≥ 2.

- K-book, Before IV.1.17 (PDF p. 279). The definition of an order, which excludes 𝓞_{F,S} for S ≠ ∅; hence the localisation step.

  > Now suppose that A is a finite dimensional semisimple algebra over Q, such as a number field, and that R is a subring of A which is finitely generated over Z and has R ⊗ Q = A (R is an order).

- K-book, Before IV.1.18 (PDF p. 279). The degrees of the primitive generators, from which the period-four pattern is read off (numerical check of the rank formula).

  > is a tensor product of r_1 exterior algebras having generators x_i in degrees 4i + 1 (i ≥ 1) and r_2 exterior algebras having generators x_j in degrees 2j + 1 (j ≥ 1).

- K-book, IV.1.18.2, Example 1.18.2 (PDF p. 280; book p. 272). The source's warning that degree one does not follow the pattern.

  > The rank of K_1(Z[G]) was given in III.1.8, and does not follow this pattern. For example, if C_p is a cyclic group of prime order p ≥ 3 then r_1 + r_2 = (p + 1)/2 yet K_1(Z[C_p]) has rank (p − 3)/2.

### The positive even K-groups of rings of S-integers are finite

`ArithmeticKTheory:N.3:ranks/even-K-groups-of-S-integers-are-finite` · *theorem*

Let F be a number field and S a finite set of nonzero primes of 𝓞_F. For every i ≥ 1 the group K_{2i}(𝓞_{F,S}) is finite; in particular K_2(𝓞_F) is finite. The statement is about the ring: the corresponding groups K_{2i}(F) of the field are infinite torsion groups (N.3:ranks/even-K-groups-of-the-field-are-infinite-torsion), and the K-book's Classical Data VI.8.1, which prints the finiteness for K_n(F), is misprinted there (sourceIssues ArithmeticKTheory/E15).

**Hypotheses.**

- F a number field, S finite (S = ∅ allowed), i ≥ 1.
- This is the finiteness theorem for K_2(𝓞_F) that SpecialValuesBirchTate B.1 uses (RT-AREA-ktheory-1/10); it is exported from this stage, N.3:ranks.

**Proof outline.**

1. K_{2i}(𝓞_{F,S}) is finitely generated (N.3:finite-generation/finite-generation-of-K-of-S-integers).
2. Its rank is 0 (N.3:ranks/borel-rank-theorem (a), n = 2i even).
3. A finitely generated abelian group of rank 0 is finite (mathlib:AddCommGroup.equiv_free_prod_directSum_zmod).

**Acceptance.**

- K_2(ℤ) has order two (K2SymbolsBrauer T.5/k2-of-the-integers) and K_2(ℤ[1/p]) has order 2(p − 1) (T.5/s-integer-tame-kernel-sequence); both are finite, as they must be.
- K_4(ℤ) and K_6(ℤ) are finite.
- Non-example: K_2(ℚ) is infinite (T.5/k2-of-the-rationals); the theorem is false for the field.

**Prerequisites.** `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`, `ArithmeticKTheory:N.3:ranks/borel-rank-theorem`, `mathlib:AddCommGroup.equiv_free_prod_directSum_zmod`

**Sources.**

- K-book, IV.1.18, last sentence (PDF p. 279; book p. 271). Torsion of the even groups of an order; with finite generation and the passage to 𝓞_{F,S} this gives finiteness.

  > By Theorem 1.17, this also gives the rank of K_n(R) for every order R. In particular, these groups are torsion for every even n ≥ 2.

- K-book, VI.8.1, Classical Data 8.1 (PDF p. 521; book p. 513). The finiteness statement with the misprint K_n(F) for K_n(O_S) (sourceIssues ArithmeticKTheory/E15); this node states it for the ring.

  > By Chapter IV, 1.18 and 6.9, the groups K_n(F) are finite when n is even and nonzero

### The positive even K-groups of a number field are infinite torsion groups

`ArithmeticKTheory:N.3:ranks/even-K-groups-of-the-field-are-infinite-torsion` · *theorem*

Let F be a number field and i ≥ 1. Then K_{2i}(F) is a torsion group, and it is infinite. Torsion: in the localisation sequence K_{2i}(𝓞_F) → K_{2i}(F) → ⊕_𝔭 K_{2i−1}(k(𝔭)) the left term is finite (N.3:ranks/even-K-groups-of-S-integers-are-finite) and the right term is torsion. Infinite: in the localisation sequence of 𝓞_F the boundary K_{2i}(F) → ⊕_𝔭 K_{2i−1}(k(𝔭)) ≅ ⊕_𝔭 Z/(N𝔭^i − 1) has infinite image, because the next map lands in the finitely generated group K_{2i−1}(𝓞_F). By contrast K_{2i}(𝓞_{F,S}) is finite for every finite S (N.3/finiteness-and-ranks-combined).

**Hypotheses.**

- F is a number field and i ≥ 1; the direct sum runs over all non-zero primes 𝔭 of 𝓞_F, and N𝔭 = #k(𝔭).
- The argument does not use Soulé's theorem, which would give the sharper exact sequence 0 → K_{2i}(𝓞_F) → K_{2i}(F) → ⊕_𝔭 K_{2i−1}(k(𝔭)) → 0; Soulé's proof itself uses finite generation (see restructure), so this node avoids it.

**Proof outline.**

1. Torsion: the localisation sequence of 𝓞_F (N.2) gives an exact segment K_{2i}(𝓞_F) → K_{2i}(F) → ⊕_𝔭 K_{2i−1}(k(𝔭)); K_{2i}(𝓞_F) is finite (N.3:ranks/even-K-groups-of-S-integers-are-finite) and the direct sum is torsion (KTheoryFiniteLocalFields L.1), so K_{2i}(F) is torsion.
2. The localisation sequence of 𝓞_F (N.2) gives an exact segment K_{2i}(F) → ⊕_𝔭 K_{2i−1}(k(𝔭)) → K_{2i−1}(𝓞_F).
3. Each K_{2i−1}(k(𝔭)) ≅ Z/(N𝔭^i − 1) (KTheoryFiniteLocalFields L.1) is non-zero as soon as N𝔭^i > 2, which excludes only the primes of norm 2 when i = 1; infinitely many 𝔭 remain, so the direct sum is an infinite torsion group.
4. Its image in the finitely generated group K_{2i−1}(𝓞_F) (N.3:finite-generation) is a finitely generated torsion group, hence finite; so the kernel, which is the image of the boundary, is infinite, and K_{2i}(F) is infinite.

**Acceptance.**

- K_2(Q) is infinite (its boundary maps onto ⊕_p F_p^×, the tame symbol of N.2), while K_2(Z) ≅ Z/2 is finite (K2SymbolsBrauer T.5).
- K_4(Q) is an infinite torsion group although K_4(Z) is finite.
- The contrast is special to even degrees: for odd n ≥ 3 the groups of the ring and of the field agree (Soulé) and are finitely generated.

**Prerequisites.** `ArithmeticKTheory:N.3:ranks/even-K-groups-of-S-integers-are-finite`, `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`, `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `KTheoryFiniteLocalFields:L.1`

**Sources.**

- K-book, V.6.8, Theorem 6.8 (PDF p. 420; book p. 412). The even-degree sequences exhibit K_n(F) as an extension of the infinite group ⊕_p K_{n−1}(R/p) by K_n(R); this node proves the weaker statement it needs without Soulé's theorem.

  > Theorem 6.8. (Soulé [171]) Let R be a Dedekind domain whose field of fractions F is a global field. Then K_n(R) ≅ K_n(F) for all odd n ≥ 3; for even n ≥ 2 the localization sequence breaks up into exact sequences: 0 → K_n(R) → K_n(F) → ⊕_p K_{n−1}(R/p) → 0.

- K-book, IV.1.18, last sentence (PDF p. 279). Torsion of the even groups, for orders and, through Theorem 1.18 with A = F, for the field.

  > By Theorem 1.17, this also gives the rank of K_n(R) for every order R. In particular, these groups are torsion for every even n ≥ 2.

## N.3 — Finiteness and ranks (the aggregate)

Together: every group is free of the tabulated rank plus a finite group, and every positive even group of the S-integers is finite.

**And that is all it gives.** The finite part and the extension are the subject of N.4, N.5 and N.6; the splitting is not natural.

Coverage: **partial**.

One node of its own, finiteness-and-ranks-combined: for n ≥ 2, K_n(𝓞_{F,S}) ≅ Z^{ρ(n)} ⊕ (finite), with the positive even groups finite (N.3:ranks/even-K-groups-of-S-integers-are-finite), which is the form N.5 and N.6 consume. The rank does not determine the torsion or the extension data: N.4 computes the numbers w_i(F), N.5 the odd groups (e.g. Z^{r_2} ⊕ Z/2w_i(F) ⊕ (Z/2)^{r_1−1} for n ≡ 3 (mod 8), Theorem VI.9.5), N.6 the even groups. The former note node what-the-combination-does-not-give is deleted; this paragraph carries its content.

Remaining:

- The remaining items of the sub-stages N.3:finite-generation and N.3:ranks.

### Finite generation and the ranks together

`ArithmeticKTheory:N.3/finiteness-and-ranks-combined` · *theorem*

For a number field F, a finite set S of finite primes and n ≥ 2, K_n(𝓞_{F,S}) is a finitely generated abelian group of rank ρ(n), where ρ(n) = r_1 + r_2, r_2 or 0 according as n ≡ 1 (mod 4), n ≡ 3 (mod 4) or n is even. Hence K_n(𝓞_{F,S}) ≅ Z^{ρ(n)} ⊕ T_n with T_n = K_n(𝓞_{F,S})_tors finite; in particular every positive even K-group of 𝓞_{F,S} is finite, and every odd one in degree at least three is Z^{ρ(n)} plus a finite group. The torsion subgroup T_n is canonical; a complement to it is not.

**Hypotheses.**

- F a number field, S a finite set of finite primes, n ≥ 2.
- Degrees zero and one are K_0 = Z ⊕ Pic(𝓞_{F,S}) and K_1 = 𝓞_{F,S}^× ≅ µ(F) ⊕ Z^{r_1+r_2+|S|−1} (N.1, from KTheoryLowDegrees Z.4 and U.4's Dirichlet S-unit theorem) and are not covered by ρ.
- The decomposition is the structure theorem for finitely generated abelian groups and is not natural.

**Proof outline.**

1. K_n(𝓞_{F,S}) is finitely generated (N.3:finite-generation/finite-generation-of-K-of-S-integers) of rank ρ(n) (N.3:ranks/borel-rank-theorem).
2. Apply Mathlib's structure theorem (AddCommGroup.equiv_free_prod_directSum_zmod) to obtain Z^{ρ(n)} ⊕ T_n with T_n finite; for n even ρ(n) = 0 and the group is finite (N.3:ranks/even-K-groups-of-S-integers-are-finite).
3. Record that only T_n is canonical: no later statement may depend on a chosen splitting.

**Acceptance.**

- K_2(Z), K_4(Z) and K_6(Z) are finite; K_3(Z) is finite (ρ(3) = r_2 = 0) and K_5(Z) has rank 1.
- For n even T_n is all of K_n(𝓞_{F,S}), while K_n(F) is infinite (N.3:ranks/even-K-groups-of-the-field-are-infinite-torsion).
- The rank does not determine T_n or the extension data; N.4 to N.6 compute them (for instance K_n(F) ≅ Z^{r_2} ⊕ Z/2w_i(F) ⊕ (Z/2)^{r_1−1} for n ≡ 3 (mod 8) and r_1 > 0, Theorem VI.9.5).

**Prerequisites.** `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`, `ArithmeticKTheory:N.3:ranks/borel-rank-theorem`, `ArithmeticKTheory:N.3:ranks/even-K-groups-of-S-integers-are-finite`, `mathlib:AddCommGroup.equiv_free_prod_directSum_zmod`

**Sources.**

- K-book, VI.8.1, Classical Data 8.1 (PDF p. 521; book p. 513). The combined statement, verbatim, with a misprint: 'the groups K_n(F) are finite when n is even and nonzero' must read K_n(O_S) (K_2(Q) is infinite); see source issue. The odd half is right for F by Soulé's theorem and is stated here for O_S.

  > Let O_S be a ring of integers in a number field F. By Chapter IV, 1.18 and 6.9, the groups K_n(F) are finite when n is even and nonzero; if n is odd and n ≥ 3 the groups K_n(F) are the direct sum of a finite group and Z^r, where r is r_2 when n ≡ 3 (mod 4) and r_1 + r_2 when n ≡ 1 (mod 4).

- K-book, IV.1.18, last sentence (PDF p. 279; book p. 271). The torsion of the even groups of an order, which with finite generation gives their finiteness.

  > By Theorem 1.17, this also gives the rank of K_n(R) for every order R. In particular, these groups are torsion for every even n ≥ 2.

## N.4 — Roots of unity with twists

The invariant `W_j(F) = H⁰(F, ℚ/ℤ(j))`, its order `w_j(F)`, and the dyadic exceptions.

**It is not `μ(F)`.** Over `ℚ` the roots of unity have order 2 and `w₂(ℚ) = 24`. Mathlib has `μ(F)` complete and nothing of the twisted module, which is exactly why the confusion is available and must be blocked.

**At 2 the single-tower description fails.** A field is *exceptional* when the Galois groups of its 2-power cyclotomic extensions are not cyclic for large exponent. `ℝ` and `ℚ₂` are exceptional, hence so is every real number field — and some totally imaginary ones, such as `ℚ(√−7)`.

**Exported.** `SpecialValuesBirchTate:B.1` is to import `W₂(F)`, the finiteness and positivity of `w₂(F)` and the cyclotomic computation from these nodes rather than re-plan them (RT-AREA-ktheory-1/10).

Coverage: **source_decomposed**.

Seven nodes, none using K-theory, matching the stage's single requirement MotivicEtaleKTheory M.1, from which the twists ℚ/ℤ(j) are requested (K2SymbolsBrauer T.7 is not their owner). The definition W_i(F) = H⁰(F, ℚ/ℤ(i)) with its primary decomposition, cyclicity, w_i(F) only under finiteness, and restriction and transfer on Tau Ceti's degree-zero restriction and corestriction ('prove restriction/transfer formulas'); the exponent criterion, Lemma VI.2.2.1, which is 'the general cyclotomic-subfield tests for divisibility by prime powers'; Proposition VI.2.2 ('Compute it from the cyclotomic character'); finiteness for number fields and i ≠ 0 ('prove finiteness for positive j'); exceptional fields and Proposition VI.2.3 ('At 2 retain the exceptional-field and real-embedding distinctions'); and w_i(Q) with w_2(Q) = 24. 'Distinguish this invariant from |μ(F)|' is a non-example test of the definition (orders 24 and 2 over Q), replacing the deleted note node the-invariant-is-not-the-roots-of-unity. The e-invariant and the Harris–Segal summand moved to N.5. SpecialValuesBirchTate B.3 consumes w₂(ℚ) = 24 from N.4/w2-of-the-rationals-and-the-divisibility-tests; it lies downstream (B.3 → B.2 → N.4), so it is not a supplier. The nodes are exportable as they stand (RT-AREA-ktheory-1/10): SpecialValuesBirchTate B.1 should import N.4/the-w-invariant for W₂(F) = H⁰(F, ℚ/ℤ(2)) — the invariants of the twist, not the roots of unity of F — N.4/finiteness-of-the-w-invariant for finiteness and positivity of w₂(F), and N.4/computing-w-from-the-cyclotomic-character with N.4/two-primary-w-invariant for the cyclotomic computation, instead of re-planning them; that needs the atlas edge N.4 → B.1 (maintainer).

### The group W_i(F) = H⁰(F, ℚ/ℤ(i)) and its order w_i(F)

`ArithmeticKTheory:N.4/the-w-invariant` · *definition* · planet **The numbers w_i(F)**

Let F be a field with separable closure F^s and absolute Galois group G_F = Gal(F^s/F), and i ∈ Z. Let µ(i) be the i-th Tate twist of µ = µ(F^s): the group µ with g ∈ G_F acting by ζ ↦ g^i(ζ), that is, on µ_{ℓ^ν} by ζ ↦ ζ^{χ_ℓ(g)^i} for the ℓ-adic cyclotomic character χ_ℓ (K-book Definition VI.1.7); it is ℚ/ℤ(i) (its prime-to-p part in characteristic p), imported from MotivicEtaleKTheory M.1. Define W_i(F) = H⁰(G_F, µ(i)) = µ(i)^{G_F} and, for a prime ℓ ≠ char F, W_i^{(ℓ)}(F) = (ℤ/ℓ^∞(i))^{G_F}, so that W_i(F) = ⊕_ℓ W_i^{(ℓ)}(F). When W_i(F) is finite it is cyclic, and w_i(F) = #W_i(F), w_i^{(ℓ)}(F) = #W_i^{(ℓ)}(F), with w_i(F) = ∏_ℓ w_i^{(ℓ)}(F); these numbers are written only under a finiteness hypothesis. For a finite separable extension E/F there are restriction W_i(F) → W_i(E) and transfer W_i(E) → W_i(F) with transfer ∘ restriction = [E : F]. No K-theory enters the definition; W_i(F) is the target of the e-invariant of N.5.

**Hypotheses.**

- F is a field and i ∈ Z; for the applications F is a number field and i ≥ 1, where W_i(F) is finite (N.4/finiteness-of-the-w-invariant).
- The twist is MotivicEtaleKTheory M.1's primewise-compatible ℚ/ℤ(i) ('Q/Z(j) uses primewise compatible twists, not the ordinary tensor power of Q/Z'); in weight one it is the colimit of Tau Ceti's KummerCoeff F ℓ^ν. K2SymbolsBrauer T.7 does not own it: its reviewed packet imports the twists from M.1.
- For i = 0 the action is trivial, W_0(F) = µ(F^s) is infinite and w_0 is not defined.

**Construction.**

1. Import µ(i) = ℚ/ℤ(i) as a discrete G_F-module from MotivicEtaleKTheory M.1, with g acting on µ_{ℓ^ν}(i) through χ_ℓ(g)^i, χ_ℓ being Mathlib's cyclotomicCharacter (its reduction modulo ℓ^ν is modularCyclotomicCharacter).
2. Define W_i(F) as Tau Ceti's ContCohomology.H0 of G_F (TauCeti.AbsoluteGaloisGroup) acting on µ(i), and W_i^{(ℓ)}(F) as its ℓ-primary component (Mathlib's primaryComponent).
3. Primary decomposition: µ(i) is torsion, so W_i(F) is the internal direct sum of the W_i^{(ℓ)}(F), ℓ ≠ char F.
4. Cyclicity: the underlying group of µ(i) is µ(F^s) ⊂ (F^s)^×, so a finite subgroup is cyclic (Mathlib's isCyclic_subgroup_units); each finite W_i^{(ℓ)}(F) is µ_{ℓ^m}(i) for a unique m.
5. Define w_i(F) and w_i^{(ℓ)}(F) as cardinalities under a finiteness hypothesis and prove w_i(F) = ∏_ℓ w_i^{(ℓ)}(F).
6. Restriction and transfer: for E/F finite separable, G_E is an open subgroup of index [E : F] in G_F; restriction is Tau Ceti's explicitRes0 (the inclusion of fixed points, injective), transfer is explicitCor0 (the norm over G_F/G_E), and explicitCor0_comp_res0 gives transfer ∘ restriction = [E : F]. Hence w_i(F) divides w_i(E) when both are finite.

**Acceptance.**

- W_1(F) = µ(F); for a number field w_1(F) is the order of the torsion of 𝓞_F^×.
- W_i(F_q) is cyclic of order q^i − 1 for i ≥ 1.
- w_i(Q) = 2 for odd i, and w_2(Q) = 24 (N.4/w2-of-the-rationals-and-the-divisibility-tests).
- W_i(F) is not the group of roots of unity of F: the two agree for i = 1 and differ already for Q and i = 2 (orders 24 and 2).

**Prerequisites.** `MotivicEtaleKTheory:M.1`, `mathlib:cyclotomicCharacter`, `mathlib:modularCyclotomicCharacter`, `mathlib:rootsOfUnity`, `mathlib:isCyclic_subgroup_units`, `mathlib:CommMonoid.primaryComponent`, `tauceti:TauCeti.KummerCoeff`, `tauceti:TauCeti.AbsoluteGaloisGroup`, `tauceti:TauCeti.ContCohomology.H0`, `tauceti:TauCeti.ContCohomology.explicitRes0`, `tauceti:TauCeti.ContCohomology.explicitCor0`, `tauceti:TauCeti.ContCohomology.explicitCor0_comp_res0`

**API.**

| name | role | statement |
| --- | --- | --- |
| `TauCeti.WInvariant` | data | W_i(F) = H⁰(G_F, ℚ/ℤ(i)), the fixed points of G_F on M.1's twist ℚ/ℤ(i), as an additive subgroup. |
| `TauCeti.WInvariant.primary` | data | For a prime ℓ ≠ char F, W_i^{(ℓ)}(F) = (ℤ/ℓ^∞(i))^{G_F}, the ℓ-primary component of W_i(F). |
| `TauCeti.WInvariant.isInternal_primary` | structure | W_i(F) is the internal direct sum of the W_i^{(ℓ)}(F) over the primes ℓ ≠ char F. |
| `TauCeti.WInvariant.isCyclic` | instance | If W_i(F) is finite it is cyclic (a finite subgroup of µ(F^s) ⊂ (F^s)^×). |
| `TauCeti.wInvariant` | data | w_i(F) = #W_i(F); every statement about it carries the hypothesis that W_i(F) is finite, since the cardinality of an infinite group is not the source's w_i(F). |
| `TauCeti.wInvariant_eq_prod_primary` | relation | If W_i(F) is finite, w_i(F) = ∏_ℓ w_i^{(ℓ)}(F), a finite product. |
| `TauCeti.WInvariant.neg_eq` | characterisation | W_{−i}(F) = W_i(F) as subgroups of µ(F^s): χ(g)^i x = x if and only if x = χ(g)^{−i} x. |
| `TauCeti.WInvariant.zero_eq_top` | example | W_0(F) is all of µ(F^s) (the action is trivial); it is infinite. |
| `TauCeti.WInvariant.oneEquivRootsOfUnity` | compatibility | W_1(F) ≅ µ(F), the roots of unity of F; for a number field, W_1(F) ≅ Additive (NumberField.Units.torsion F). |
| `TauCeti.WInvariant.res` | functoriality | For an intermediate field E of F^s/F, restriction W_i(F) →+ W_i(E), built on TauCeti.ContCohomology.explicitRes0; it is injective. For an abstract extension E the map depends on the embedding E → F^s when i ≠ 1: two embeddings differ by ζ ↦ ζ^{χ(σ)}, which is non-trivial on W_2(ℚ) = μ_24. |
| `TauCeti.WInvariant.cor` | functoriality | For a finite intermediate field E of F^s/F, transfer W_i(E) →+ W_i(F), built on TauCeti.ContCohomology.explicitCor0 (the norm over G_F/G_E). |
| `TauCeti.WInvariant.cor_comp_res` | relation | cor ∘ res = [E : F] • id on W_i(F) for a finite intermediate field E of F^s/F (from explicitCor0_comp_res0). |
| `TauCeti.wInvariant_dvd_of_finite` | relation | For E/F finite separable with W_i(E) finite, W_i(F) is finite and w_i(F) divides w_i(E). |

**Used by.**

- *N.5, e-invariant and Harris-Segal summand* — W_i(F) is the target of the e-invariant, and the Harris-Segal summand is cyclic of order w_i^{(ℓ)}(F).
- *N.5, the odd tables (K-book VI.8.4, VI.9.5)* — the torsion of K_{2i−1}(𝓞_{F,S}) is Z/w_i(F), Z/2w_i(F) ⊕ (Z/2)^{r_1−1} or Z/(w_i(F)/2).
- *N.6, even groups* — the cohomological descriptions are stated at the same twists ℤ_ℓ(i + 1).
- *SpecialValuesBirchTate B.1–B.3* — B.1 imports W_2(F) = H⁰(F, ℚ/ℤ(2)) — the invariants of the twist ℚ/ℤ(2), not the roots of unity of F — from this node, with its finiteness and positivity from N.4/finiteness-of-the-w-invariant and the cyclotomic computation from N.4/computing-w-from-the-cyclotomic-character (RT-AREA-ktheory-1/10; atlas edge N.4 → B.1); the Birch-Tate formula ζ_F(−1) = (−1)^{[F:Q]} #K_2(𝓞_F)/w_2(F) uses w_2(F), and B.3 uses w_2(Q) = 24.

**Unit tests.**

- `TauCeti.wInvariant_finiteField` (computation) — For i ≥ 1, w_i(F_q) = q^i − 1: the Frobenius acts on µ(i) by ζ ↦ ζ^{q^i}, whose fixed points are µ_{q^i−1}. An untwisted action would give q − 1 for every i.
- `TauCeti.wInvariant_rat_of_odd` (computation) — For odd i, w_i(Q) = 2.
- `TauCeti.wInvariant_gaussian_of_odd` (computation) — For odd i, w_i(Q(√−1)) = 4.
- `TauCeti.wInvariant_one_eq_torsionOrder` (compatibility) — For a number field F, w_1(F) = NumberField.Units.torsionOrder F; for the n-th cyclotomic field this is n for n even and 2n for n odd (IsCyclotomicExtension.Rat.torsionOrder_eq).
- `TauCeti.WInvariant.zero_infinite` (degenerate) — W_0(F) is infinite for every field F, so w_0(F) is not defined.
- `TauCeti.wInvariant_two_rat_ne_torsionOrder` (non-example) — w_2(Q) = 24 while NumberField.Units.torsionOrder ℚ = 2 (NumberField.Units.torsionOrder_eq_two_of_odd_finrank): a definition by the roots of unity of F fails.
- `TauCeti.WInvariant.not_tensorPower` (non-example) — The ordinary tensor power ℚ/ℤ ⊗_ℤ ℚ/ℤ is zero, so defining ℚ/ℤ(2) as it would give W_2(Q) = 0 instead of a cyclic group of order 24.
- `TauCeti.WInvariant.neg_eq_rat` (characterisation) — W_{−2}(Q) = W_2(Q) as subgroups of µ(Q̄), of order 24.

**Sources.**

- K-book, VI.1.7, Definition 1.7 (PDF p. 476; book p. 468). The Tate twist µ(i), verbatim; g^i(ζ) = ζ^{χ(g)^i}.

  > Definition 1.7. For all i ∈ Z, we shall write µ(i) for the abelian group µ, made into a Aut(F)-module by letting g ∈ Aut(F) act as ζ ↦ g^i(ζ). (This modified module structure is called the ith Tate twist of the cyclotomic module µ.)

- K-book, VI.2, before Definition 2.1 (PDF p. 477; book p. 469). The primary decomposition of the invariants.

  > The target group µ(i)^G is always the direct sum of its ℓ-primary Sylow subgroups µ^{(ℓ)}(i)^G ≅ Z/ℓ^∞(i)^G.

- K-book, VI.2.1, Definition 2.1, second half (PDF p. 477). Cyclicity, the notation w_i(F) only for a finite group, and the product formula, verbatim.

  > If µ(i)^G is a finite group it is cyclic, and we write w_i(F) for its order, so that µ(i)^G ≅ Z/w_i(F). If ℓ is a prime, we write w^{(ℓ)}_i(F) for the order of µ^{(ℓ)}(i)^G. Thus the target of the e-invariant is ⊕_ℓ Z/w^{(ℓ)}_i(F), and w_i(F) = ∏ w^{(ℓ)}_i(F).

- K-book, VI.2.1.1 (PDF p. 478; book p. 470). The finite-field value, used as a test; 'for all i' means i ≥ 1 (see source issue).

  > Example 2.1.1 (finite fields). It is a pleasant exercise to show that w_i(F_q) = q^i − 1 for all i. Since this is the order of K_{2i−1}(F_q) by IV.1.13, we see that in this case, the e-invariant is an isomorphism.

- K-book, VI.2.1.2 (PDF p. 478). The values over Q and Q(√−1), used as tests.

  > Example 2.1.2. If i is odd, w_i(Q) = 2 and w_i(Q(√−1)) = 4. If i is even then w_i(Q) = w_i(Q(√−1)), and ℓ|w_i(Q) exactly when (ℓ−1) divides i.

### Computing w_i^{(ℓ)}(F) at odd primes from the cyclotomic character (Proposition VI.2.2)

`ArithmeticKTheory:N.4/computing-w-from-the-cyclotomic-character` · *theorem*

Fix a prime ℓ ≠ 2 and a field F of characteristic ≠ ℓ. Let a ≤ ∞ be maximal such that F(ζ_ℓ) contains a primitive ℓ^a-th root of unity, and let r = [F(ζ_ℓ) : F], a divisor of ℓ − 1. Write i = cℓ^b with ℓ ∤ c (i ≠ 0). Then w_i^{(ℓ)}(F) = ℓ^{a+b} if r | i, and 1 otherwise: (a) if ζ_ℓ ∈ F then w_i^{(ℓ)} = ℓ^{a+b}; (b) if ζ_ℓ ∉ F and r | i then w_i^{(ℓ)} = ℓ^{a+b}; (c) if ζ_ℓ ∉ F and r ∤ i then w_i^{(ℓ)} = 1. When a = ∞ and r | i the ℓ-primary part is infinite.

**Hypotheses.**

- ℓ is odd; the prime 2 is N.4/two-primary-w-invariant and is genuinely different, since (ℤ/2^ν)^× is not cyclic for ν ≥ 3.
- char F ≠ ℓ, and a ≤ ∞ as in the source; a is finite for a number field.
- i ≠ 0, so that b = v_ℓ(i) is defined.

**Proof outline.**

1. For ν ≥ a (a finite), [F(ζ_{ℓ^ν}) : F(ζ_ℓ)] = ℓ^{ν−a}: the image of Gal(F(ζ_{ℓ^ν})/F(ζ_ℓ)) in the cyclic group 1 + ℓ^a ℤ/ℓ^ν of order ℓ^{ν−a} cannot lie in its maximal proper subgroup 1 + ℓ^{a+1} ℤ/ℓ^ν, which fixes ζ_{ℓ^{a+1}} ∉ F(ζ_ℓ).
2. So Gal(F(ζ_{ℓ^ν})/F) is a subgroup of the cyclic group (ℤ/ℓ^ν)^× (Mathlib's ZMod.isCyclic_units_of_prime_pow), hence cyclic, of order rℓ^{ν−a}, and its exponent is its order; for 1 ≤ ν ≤ a, F(ζ_{ℓ^ν}) = F(ζ_ℓ) and the group is Gal(F(ζ_ℓ)/F), cyclic of order r.
3. By the exponent criterion, ℓ^ν | w_i^{(ℓ)}(F) exactly when rℓ^{ν−a} | cℓ^b for ν ≥ a, that is r | i and ν ≤ a + b (r is prime to ℓ); and for 1 ≤ ν ≤ a exactly when r | i. This gives ℓ^{a+b} if r | i and 1 otherwise.
4. Derive the cyclotomic example (Example VI.2.2.2) and the value over Q (a = 1, r = ℓ − 1).

**Acceptance.**

- F = Q: a = 1 and r = ℓ − 1, so w_i^{(ℓ)}(Q) = ℓ^{1+v_ℓ(i)} when (ℓ − 1) | i and 1 otherwise; for example w_2^{(3)}(Q) = 3, w_6^{(3)}(Q) = 9, w_6^{(7)}(Q) = 7 and w_4^{(5)}(Q) = 5.
- F = Q(ζ_{p^a}), p odd: w_i^{(p)}(F) = p^{a+b} for i = cp^b, and for ℓ ≠ 2, p, w_i^{(ℓ)}(F) = w_i^{(ℓ)}(Q) (Example VI.2.2.2).
- F = Q(√−7), ℓ = 7: Q(√−7) ⊂ Q(ζ_7), so a = 1 and r = 3, and w_3^{(7)}(Q(√−7)) = 7 while w_3^{(7)}(Q) = 1.
- F = Q(ζ_3), ℓ = 3: ζ_3 ∈ F and a = 1, so w_3^{(3)}(F) = 9 and w_1^{(3)}(F) = 3.

**Prerequisites.** `ArithmeticKTheory:N.4/the-w-invariant`, `ArithmeticKTheory:N.4/exponent-criterion`, `mathlib:IsCyclotomicExtension`, `mathlib:ZMod.isCyclic_units_of_prime_pow`

**Sources.**

- K-book, VI.2.2, Proposition 2.2 (PDF pp. 478–479; book pp. 470–471). The proposition, verbatim (a ≤ ∞ kept); the cases (a)–(c) follow on PDF p. 479.

  > Proposition 2.2. Fix a prime ℓ ≠ 2, and let F be a field of characteristic ≠ ℓ. Let a ≤ ∞ be maximal such that F(ζ_ℓ) contains a primitive ℓ^a th root of unity and set r = [F(ζ_ℓ) : F]. If i = cℓ^b, where ℓ ∤ c, then the numbers w^{(ℓ)}_i = w^{(ℓ)}_i(F) are ℓ^{a+b} if r | i, and 1 otherwise.

- K-book, VI.2.2, the proof (PDF p. 479). The first step of the proof, verbatim.

  > Proof. Since ℓ is odd, G = Gal(F(ζ_{ℓ^ν})/F) is a cyclic group of order rℓ^{ν−a} for all ν ≥ a.

- K-book, VI.2.2.2, Example 2.2.2 (PDF p. 479). The cyclotomic example, verbatim.

  > Example 2.2.2. Consider F = Q(ζ_{p^a}). If i = cp^b then w^{(p)}_i(F) = p^{a+b} (p ≠ 2). If ℓ ≠ 2, p then w^{(ℓ)}_i(F) = w^{(ℓ)}_i(Q) for all i. This number is 1 unless (ℓ−1) | i; if (ℓ−1)|i but ℓ ∤ i then w^{(ℓ)}_i(F) = ℓ.

### Exceptional fields

`ArithmeticKTheory:N.4/exceptional-fields-at-two` · *definition* · planet **Exceptional fields**

A field F is exceptional if char F = 0 and the Galois groups Gal(F(ζ_{2^ν})/F) are not cyclic for all large ν; otherwise F is non-exceptional. For a number field F this holds exactly when F ∩ Q(ζ_{2^∞}), taken in an algebraic closure of F, is totally real, i.e. when the image of G_F under the 2-adic cyclotomic character contains −1. Every number field with a real place is exceptional, and so are some totally imaginary fields, such as Q(√−7) and Q(√−3); Q(√−1) and Q(√−2) are non-exceptional. The distinction is needed only at ℓ = 2, where (ℤ/2^ν)^× is not cyclic for ν ≥ 3.

**Hypotheses.**

- F is a field; exceptionality requires char F = 0.
- For a number field F, Gal(F(ζ_{2^ν})/F) ≅ Gal(Q(ζ_{2^ν})/F ∩ Q(ζ_{2^ν})), a subgroup H_ν of (ℤ/2^ν)^× ≅ {±1} × ⟨5⟩; for ν ≥ 3, H_ν is non-cyclic exactly when it contains −1 and has order at least 4, which gives the characterisation.
- The source also asserts that R is exceptional; under the definition as printed it is not (Gal(C/R) ≅ ℤ/2 is cyclic). Nothing in this roadmap uses R (source issue).

**Construction.**

1. Define IsExceptional F as in the source, with the Galois groups of the cyclotomic extensions F(ζ_{2^ν})/F.
2. For a number field, identify Gal(F(ζ_{2^ν})/F) with the subgroup H_ν of (ℤ/2^ν)^× fixing F ∩ Q(ζ_{2^ν}) (IsCyclotomicExtension.autEquivPow over Q), and prove that a subgroup of (ℤ/2^ν)^×, ν ≥ 3, is cyclic unless it contains −1 and has order at least 4 (an abelian 2-group with a unique involution is cyclic; ±(1 + 2^{ν−1}) are both in H once −1 and 1 + 2^{ν−1} are).
3. Real places: complex conjugation for a real embedding acts on µ_{2^∞} as −1, and |H_ν| → ∞, so every number field with a real place is exceptional.
4. √−1 ∈ F: H_ν ⊂ 1 + 4ℤ/2^ν = ⟨5⟩ is cyclic, so F is non-exceptional.
5. Subfields: if E/F is an extension and E is exceptional, then Gal(E(ζ_{2^ν})/E) embeds in Gal(F(ζ_{2^ν})/F), so F is exceptional.

**Acceptance.**

- Q and every real number field are exceptional.
- Q(√−7) is exceptional, as the source says, and so is Q(√−3).
- Q(√−1) and Q(√−2) are non-exceptional.

**Prerequisites.** `mathlib:IsCyclotomicExtension`, `mathlib:IsCyclotomicExtension.autEquivPow`, `mathlib:ZMod.isCyclic_units_two_pow_iff`, `mathlib:cyclotomicCharacter`, `mathlib:NumberField.InfinitePlace.nrRealPlaces`

**API.**

| name | role | statement |
| --- | --- | --- |
| `TauCeti.IsExceptional` | data | F is exceptional: char F = 0 and Gal(F(ζ_{2^ν})/F) is not cyclic for all sufficiently large ν. |
| `TauCeti.IsExceptional.charZero` | projection | An exceptional field has characteristic zero. |
| `TauCeti.IsExceptional.iff_inf_cyclotomic_isTotallyReal` | characterisation | For a number field F: F is exceptional if and only if F ∩ Q(ζ_{2^∞}) is totally real, if and only if −1 lies in the image of G_F under the 2-adic cyclotomic character. |
| `TauCeti.IsExceptional.of_nrRealPlaces_pos` | characterisation | A number field with nrRealPlaces F > 0 is exceptional. |
| `TauCeti.IsExceptional.not_of_sqrt_neg_one_mem` | characterisation | If −1 is a square in F, F is non-exceptional. |
| `TauCeti.IsExceptional.of_extension` | functoriality | If E/F is a field extension and E is exceptional, then F is exceptional. |
| `TauCeti.IsExceptional.rat` | example | Q is exceptional. |

**Used by.**

- *N.4/two-primary-w-invariant (K-book Proposition VI.2.3)* — cases (c) and (d) of the 2-primary formula differ by exceptionality.
- *N.5/harris-segal-summand (K-book Theorem VI.2.5, Remark 2.5.1)* — the Harris-Segal theorem at ℓ = 2 is proved for non-exceptional fields only.
- *N.5/the-real-case-modulo-eight and N.6* — every real number field is exceptional, so the dyadic corrections are the general case there, not a corner case.

**Unit tests.**

- `TauCeti.IsExceptional.rat` (computation) — Q is exceptional: Gal(Q(ζ_{2^ν})/Q) ≅ (ℤ/2^ν)^× (IsCyclotomicExtension.autEquivPow with Polynomial.cyclotomic.irreducible_rat), which is not cyclic for ν ≥ 3 (ZMod.isCyclic_units_two_pow_iff).
- `TauCeti.IsExceptional.not_gaussian` (computation) — Q(√−1) is non-exceptional: Gal(Q(ζ_{2^ν})/Q(√−1)) is the subgroup of classes ≡ 1 (mod 4), generated by 5.
- `TauCeti.IsExceptional.sqrt_neg_seven` (computation) — Q(√−7) is exceptional: 7 ramifies in Q(√−7) and not in Q(ζ_{2^ν}), so Q(√−7) ∩ Q(ζ_{2^ν}) = Q and Gal(Q(√−7, ζ_{2^ν})/Q(√−7)) ≅ (ℤ/2^ν)^×.
- `TauCeti.IsExceptional.not_sqrt_neg_two` (non-example) — Q(√−2) is totally imaginary, does not contain √−1, and is non-exceptional: Q(√−2) ⊂ Q(ζ_8) and Gal(Q(ζ_{2^ν})/Q(√−2)) is the cyclic subgroup of classes ≡ 1, 3 (mod 8), generated by 3. So neither 'exceptional = √−1 ∉ F' nor 'exceptional = has a real place' is the definition (the latter fails on Q(√−7)).
- `TauCeti.IsExceptional.not_of_charP` (degenerate) — A field of positive characteristic, e.g. F_3, is non-exceptional; Gal(F_3(ζ_{2^ν})/F_3) is in any case cyclic, generated by the Frobenius.

**Sources.**

- K-book, VI.2, after Example 2.2.2 (PDF p. 479; book p. 471). The definition, verbatim; 'two involutions' is a misprint for three (source issue).

  > The situation is more complicated when ℓ = 2, because Aut(µ_{2^ν}) = (Z/2^ν)^× contains two involutions if ν ≥ 3. We say that a field F is exceptional if char(F) = 0 and the Galois groups Gal(F(ζ_{2^ν})/F) are not cyclic for large ν. If F is not exceptional, we say that it is non-exceptional.

- K-book, VI.2, after Proposition 2.3 (PDF p. 479). Which fields are exceptional, verbatim; correct for number fields and for Q_2 and its subfields, not for R (source issue).

  > Both R and Q_2 are exceptional, and so are each of their subfields. In particular, real number fields (like Q) are exceptional, and so are some totally imaginary number fields, like Q(√−7).

### The numbers w_i(ℚ), and w₂(ℚ) = 24

`ArithmeticKTheory:N.4/w2-of-the-rationals-and-the-divisibility-tests` · *theorem*

w_i(Q) = 2 for odd i. For even i ≠ 0, w_i(Q) = 2^{2+v_2(i)} · ∏ ℓ^{1+v_ℓ(i)}, the product over the odd primes ℓ with (ℓ − 1) | i. In particular w_2(Q) = 2^3 · 3 = 24, with w_2^{(2)}(Q) = 8, w_2^{(3)}(Q) = 3 and w_2^{(ℓ)}(Q) = 1 for ℓ ≥ 5. The divisibility test by prime powers is N.4/exponent-criterion; for Q it reads ℓ^ν | w_i(Q) if and only if (ℤ/ℓ^ν)^× has exponent dividing i.

**Hypotheses.**

- The field is Q; i ∈ Z, i ≠ 0.
- Q is exceptional (N.4/exceptional-fields-at-two) and does not contain √−1, so the 2-part is case (b) or (c) of Proposition VI.2.3.

**Proof outline.**

1. Odd primes (N.4/computing-w-from-the-cyclotomic-character with F = Q): a = 1, since Q(ζ_ℓ) contains ζ_ℓ but not ζ_{ℓ^2}, and r = [Q(ζ_ℓ) : Q] = ℓ − 1 (IsCyclotomicExtension.Rat.finrank); so w_i^{(ℓ)}(Q) = ℓ^{1+v_ℓ(i)} if (ℓ − 1) | i and 1 otherwise. For i = 2 only ℓ = 3 qualifies, with v_3(2) = 0, giving 3.
2. The prime 2 (N.4/two-primary-w-invariant): a = 2, since Q(√−1) contains ζ_4 but not ζ_8; so w_i^{(2)}(Q) = 2 for odd i and 2^{2+v_2(i)} for even i, which is 8 for i = 2.
3. The product is finite (N.4/finiteness-of-the-w-invariant): w_2(Q) = 8 · 3 = 24.

**Acceptance.**

- w_2(Q) = 24, w_4(Q) = 240 = 2^4 · 3 · 5, w_6(Q) = 504 = 2^3 · 3^2 · 7, w_8(Q) = 480 = 2^5 · 3 · 5, w_10(Q) = 264 = 2^3 · 3 · 11, w_12(Q) = 65520 = 2^4 · 3^2 · 5 · 7 · 13.
- Cross-check with Lemma VI.2.4: for i = 2k these are the denominators of B_k/4k with the topologists' Bernoulli numbers B_1, …, B_6 = 1/6, 1/30, 1/42, 1/30, 5/66, 691/2730; in particular B_5/20 = 1/264. The source's Example VI.2.1.2 prints w_10 = 1320 = 2^3 · 3 · 5 · 11, contradicting Lemma VI.2.4 and its own rule (5 − 1 = 4 does not divide 10); see source issue.
- w_2(Q) = 24 is not the order 2 of the group of roots of unity of Q.
- SpecialValuesBirchTate B.3 consumes w_2(Q) = 24, with |K_2(Z)| = 2 and ζ_Q(−1) = −1/12 = (−1)^1 · 2/24; this node does not depend on B.3, which lies downstream of N.4.

**Prerequisites.** `ArithmeticKTheory:N.4/computing-w-from-the-cyclotomic-character`, `ArithmeticKTheory:N.4/two-primary-w-invariant`, `ArithmeticKTheory:N.4/exceptional-fields-at-two`, `ArithmeticKTheory:N.4/finiteness-of-the-w-invariant`, `mathlib:IsCyclotomicExtension.Rat.finrank`

**Sources.**

- K-book, VI.2.1.2, Example 2.1.2 (PDF p. 478; book p. 470). The values for even i, verbatim; all are correct except w_10, which is 264 (source issue).

  > We have: w_2 = 24, w_4 = 240, w_6 = 504 = 2^3 · 3^2 · 7, w_8 = 480 = 2^5 · 3 · 5, w_10 = 1320 = 2^3 · 3 · 5 · 11, and w_12 = 65,520 = 2^4 · 3^2 · 5 · 7 · 13.

- K-book, VI.2.4, Lemma 2.4 (PDF p. 480; book p. 472). The Bernoulli description used as the cross-check.

  > Lemma 2.4. If i = 2k is even then w_i(Q) is the denominator of B_k/4k. The prime ℓ divides w_i(Q) exactly when (ℓ−1) divides i.

- K-book, VI.2, before Lemma 2.4 (PDF p. 480). The Bernoulli convention and values used in the cross-check.

  > (We use the topologists’ B_k from [135], all of which are positive. Number theorists would write it as (−1)^{k+1}B_{2k}.) The first few Bernoulli numbers are: B_1 = 1/6, B_2 = 1/30, B_3 = 1/42, B_4 = 1/30, B_5 = 5/66, B_6 = 691/2730

- K-book, VI.8.6, after Birch-Tate Conjecture 8.6 (PDF p. 523; book p. 515). The value 24 in the Birch-Tate example, verbatim.

  > For example, when F = Q we have ζ_Q(−1) = −1/12, |K_2(Z)| = 2 and w_2(Q) = 24; see the Classical Data 8.1

### The exponent criterion for w_i^{(ℓ)}(F)

`ArithmeticKTheory:N.4/exponent-criterion` · *lemma*

Let F be a field, ℓ a prime different from char F, i ∈ Z and ν ≥ 0. Then µ_{ℓ^ν}(i) ⊆ W_i(F) (equivalently, ℓ^ν divides w_i^{(ℓ)}(F) when it is finite) if and only if the Galois group Gal(F(ζ_{ℓ^ν})/F) has exponent dividing i. Hence w_i^{(ℓ)}(F) = max{ℓ^ν : Gal(F(ζ_{ℓ^ν})/F) has exponent dividing i} (K-book Lemma VI.2.2.1). This is the stage's 'cyclotomic-subfield test for divisibility by prime powers': for F = Q it reads ℓ^ν | w_i(Q) if and only if (ℤ/ℓ^ν)^× has exponent dividing i.

**Hypotheses.**

- ℓ ≠ char F; the lemma holds for ℓ = 2 as well as for odd ℓ.
- F(ζ_{ℓ^ν}) is the cyclotomic extension of F generated by a primitive ℓ^ν-th root of unity in F^s.

**Proof outline.**

1. µ_{ℓ^ν}(i) is cyclic, generated by a primitive ℓ^ν-th root of unity ζ; it lies in W_i(F) if and only if g acts trivially on ζ for every g ∈ G_F, that is χ(g)^i ≡ 1 (mod ℓ^ν), where χ(g) mod ℓ^ν is modularCyclotomicCharacter(g).
2. G_F maps onto Gal(F(ζ_{ℓ^ν})/F), and Gal(F(ζ_{ℓ^ν})/F) → (ℤ/ℓ^ν)^× is injective (IsPrimitiveRoot.autToPow_injective, identified with the cyclotomic character by IsPrimitiveRoot.autToPow_eq_modularCyclotomicCharacter); so the condition says that every element of Gal(F(ζ_{ℓ^ν})/F) has order dividing i, i.e. its Monoid.exponent divides i.
3. W_i^{(ℓ)}(F) is a subgroup of the ℓ-primary cyclic group ℤ/ℓ^∞(i), hence equal to µ_{ℓ^m}(i) for the largest admissible m, or to all of ℤ/ℓ^∞(i); this is the max formula.
4. The source's proof ends 'has exponent i', which must read 'has exponent dividing i' (source issue).

**Acceptance.**

- F = Q, ℓ = 3, i = 2: (ℤ/3)^× has exponent 2, which divides 2, and (ℤ/9)^× has exponent 6, which does not; so w_2^{(3)}(Q) = 3.
- F = Q, ℓ = 2, i = 2: (ℤ/8)^× has exponent 2 and (ℤ/16)^× has exponent 4; so w_2^{(2)}(Q) = 8.
- F = Q, ℓ = 5, i = 2: (ℤ/5)^× has exponent 4, which does not divide 2; so 5 does not divide w_2(Q).
- F = F_q, ℓ ∤ q: Gal(F_q(ζ_{ℓ^ν})/F_q) is generated by the Frobenius, of order the order of q modulo ℓ^ν, and the criterion returns the ℓ-part of q^i − 1.

**Prerequisites.** `ArithmeticKTheory:N.4/the-w-invariant`, `mathlib:IsCyclotomicExtension`, `mathlib:modularCyclotomicCharacter`, `mathlib:IsPrimitiveRoot.autToPow_injective`, `mathlib:IsPrimitiveRoot.autToPow_eq_modularCyclotomicCharacter`, `mathlib:Monoid.exponent`

**Sources.**

- K-book, VI.2.2.1, Lemma 2.2.1 (PDF p. 479; book p. 471). The criterion, verbatim.

  > Lemma 2.2.1. w^{(ℓ)}_i(F) = max{ℓ^ν | Gal(F(ζ_{ℓ^ν})/F) has exponent dividing i}

- K-book, VI.2.2.1, the proof (PDF p. 479). The proof, verbatim; its last clause has a misprint ('exponent i' for 'exponent dividing i').

  > Proof. Set ζ = ζ_{ℓ^ν}. Then ζ^{⊗i} is invariant under g ∈ Gal(F̄/F) precisely when g^i(ζ) = ζ, and ζ^{⊗i} is invariant under all of G precisely when the group Gal(F(ζ_{ℓ^ν})/F) has exponent i.

### Finiteness of W_i(F) for a number field

`ArithmeticKTheory:N.4/finiteness-of-the-w-invariant` · *theorem*

Let F be a number field and i ≠ 0. Then W_i(F) is finite. More precisely, every W_i^{(ℓ)}(F) is finite, and W_i^{(ℓ)}(F) = 0 whenever ℓ − 1 > |i|·[F : Q]; hence w_i(F) = ∏_{ℓ ≤ |i|[F:Q] + 1} w_i^{(ℓ)}(F) is a positive integer. This is the stage's 'prove finiteness for positive j', for all non-zero j. Positivity is part of the statement: w_i(F) ≥ 1 because W_i(F) is a finite group. SpecialValuesBirchTate B.1 imports this node for the finiteness and positivity of w_2(F) (RT-AREA-ktheory-1/10) and does not re-prove them.

**Hypotheses.**

- F is a number field (finite over Q) and i ≠ 0.
- For i = 0, or for F of infinite degree such as Q(µ_{ℓ^∞}), the statement fails.

**Proof outline.**

1. For each ℓ, F(ζ_ℓ) is a number field and so has finitely many roots of unity (Mathlib's finiteness of NumberField.Units.torsion); hence a < ∞, and w_i^{(ℓ)}(F) is finite by Proposition VI.2.2 for odd ℓ and Proposition VI.2.3 for ℓ = 2.
2. Let ℓ be a prime with ℓ − 1 > |i|·[F : Q]. Then [F(ζ_ℓ) : Q] ≥ [Q(ζ_ℓ) : Q] = ℓ − 1 (IsCyclotomicExtension.Rat.finrank) and the tower law (Module.finrank_mul_finrank) give r = [F(ζ_ℓ) : F] ≥ (ℓ − 1)/[F : Q] > |i|, so r does not divide i and ζ_ℓ ∉ F.
3. By the exponent criterion with ν = 1 (Gal(F(ζ_ℓ)/F) is cyclic of order r), ℓ does not divide w_i^{(ℓ)}(F), i.e. W_i^{(ℓ)}(F) = 0.
4. Only finitely many primes remain, each with a finite component, so W_i(F) is finite.

**Acceptance.**

- w_i(Q) involves only primes ℓ ≤ |i| + 1; for example w_12(Q) = 65520 = 2^4 · 3^2 · 5 · 7 · 13, and 13 = 12 + 1.
- W_0(F) = µ(F^s) is infinite.
- For F = Q(µ_{ℓ^∞}), which is not a number field, the ℓ-part of W_i(F) is infinite for every i with r | i.
- F_q is not a number field, but W_i(F_q) is finite of order q^i − 1 for i ≥ 1 (Example VI.2.1.1).

**Prerequisites.** `ArithmeticKTheory:N.4/exponent-criterion`, `ArithmeticKTheory:N.4/computing-w-from-the-cyclotomic-character`, `ArithmeticKTheory:N.4/two-primary-w-invariant`, `mathlib:NumberField.Units.torsion`, `mathlib:IsCyclotomicExtension.Rat.finrank`, `mathlib:Module.finrank_mul_finrank`

**Sources.**

- K-book, VI.2, Exercise 2.1 (PDF p. 482; book p. 474). The ℓ-primary finiteness, verbatim; the vanishing for large ℓ, which the global statement needs, is derived from Proposition 2.2(c) in the proof steps.

  > 2.1. For every prime ℓ with 1/ℓ ∈ F, show that the following are equivalent: (i) F(ζ_ℓ) has only finitely many ℓ-primary roots of 1; (ii) w^{(ℓ)}_i(F) is finite for some i ≡ 0 (mod 2(ℓ−1)); (iii) w^{(ℓ)}_i(F) is finite for all i > 0.

- K-book, VI.2.1, Definition 2.1, second half (PDF p. 477). The source writes w_i(F) only for a finite group; this node supplies finiteness for number fields.

  > If µ(i)^G is a finite group it is cyclic, and we write w_i(F) for its order, so that µ(i)^G ≅ Z/w_i(F). If ℓ is a prime, we write w^{(ℓ)}_i(F) for the order of µ^{(ℓ)}(i)^G. Thus the target of the e-invariant is ⊕_ℓ Z/w^{(ℓ)}_i(F), and w_i(F) = ∏ w^{(ℓ)}_i(F).

### The 2-primary numbers w_i^{(2)}(F) (Proposition VI.2.3)

`ArithmeticKTheory:N.4/two-primary-w-invariant` · *theorem*

Let F be a field of characteristic ≠ 2, a maximal such that F(√−1) contains a primitive 2^a-th root of unity (so a ≥ 2), and i = c2^b with c odd. Then (a) if √−1 ∈ F, w_i^{(2)}(F) = 2^{a+b} for all i; (b) if √−1 ∉ F and i is odd, w_i^{(2)}(F) = 2; (c) if √−1 ∉ F, F is exceptional and i is even, w_i^{(2)}(F) = 2^{a+b}; (d) if √−1 ∉ F, F is non-exceptional and i is even, w_i^{(2)}(F) = 2^{a+b−1}. This is where the description by a single cyclic tower at odd primes stops covering the dyadic cases.

**Hypotheses.**

- char F ≠ 2; a ≤ ∞, and the values are infinite when a = ∞ (case (b) excepted).
- In case (c) F has characteristic zero (exceptional fields do).

**Proof outline.**

1. Let G ⊂ ℤ_2^× be the image of G_F under the 2-adic cyclotomic character and H the image of G_{F(√−1)}; as in Proposition VI.2.2, H = 1 + 2^a ℤ_2, and [G : H] = 1 or 2 according as √−1 ∈ F or not.
2. (a): G = 1 + 2^a ℤ_2 and v_2((1 + 2^a)^i − 1) = a + b for a ≥ 2; apply the exponent criterion.
3. (b): √−1 ∉ F gives g ∈ G with g ≡ 3 (mod 4), so g^i ≡ 3 (mod 4) for odd i and only µ_2 is fixed.
4. (c), the source's Exercise VI.2.2: an exceptional F has −1 ∈ G, so G = ±(1 + 2^a ℤ_2), and for even i the condition reduces to (1 + 2^a)^i ≡ 1 (mod 2^ν), i.e. ν ≤ a + b.
5. (d): a non-exceptional F with √−1 ∉ F has G topologically cyclic, generated by some g ≡ 3 (mod 4) with g^2 generating 1 + 2^a ℤ_2, so v_2(g^i − 1) = a + (b − 1) for even i.

**Acceptance.**

- Q: exceptional, √−1 ∉ Q and a = 2, so w_i^{(2)}(Q) = 2 for odd i and 2^{2+v_2(i)} for even i: 8 for i = 2, 16 for i = 4.
- Q(√−1): a = 2, so w_i^{(2)} = 4 for odd i and 8 for i = 2.
- Q(√−2): non-exceptional with a = 3 (Q(√−2, √−1) = Q(ζ_8)), so w_2^{(2)}(Q(√−2)) = 2^{3+1−1} = 8; case (c) would wrongly give 16.
- Q(√2): real, hence exceptional, with a = 3, so w_2^{(2)}(Q(√2)) = 16 and w_2(Q(√2)) = 48.
- F_3 (characteristic 3, non-exceptional): a = 3 because F_9 ⊃ µ_8, so w_2^{(2)}(F_3) = 8, the 2-part of 3^2 − 1.

**Prerequisites.** `ArithmeticKTheory:N.4/the-w-invariant`, `ArithmeticKTheory:N.4/exponent-criterion`, `ArithmeticKTheory:N.4/exceptional-fields-at-two`, `mathlib:cyclotomicCharacter`

**Sources.**

- K-book, VI.2.3, Proposition 2.3 (PDF p. 479; book p. 471). The proposition and case (a), verbatim.

  > Proposition 2.3. (ℓ = 2) Let F be a field of characteristic ≠ 2. Let a be maximal such that F(√−1) contains a primitive 2^a th root of unity. If i = c2^b, where 2 ∤ c, then the 2-primary numbers w^{(2)}_i = w^{(2)}_i(F) are: (a) If √−1 ∈ F then w^{(2)}_i = 2^{a+b} for all i.

- K-book, VI.2.3, Proposition 2.3 (PDF p. 479). Cases (b)–(d), verbatim.

  > (b) If √−1 ∉ F and i is odd then w^{(2)}_i = 2. (c) If √−1 ∉ F, F is exceptional and i is even then w^{(2)}_i = 2^{a+b}. (d) If √−1 ∉ F, F is non–exceptional and i is even then w^{(2)}_i = 2^{a+b−1}.

- K-book, VI.2.3, after the proposition (PDF p. 479). The source's proof, which leaves (c) to an exercise.

  > The proof of Proposition 2.3(a,b,d) is almost identical to that of 2.2 with r = 1. The proof in the exceptional case (c) is relegated to Exercise 2.2.

- K-book, VI.2, Exercise 2.2 (PDF p. 483; book p. 475). The exercise proving (c), with its hint.

  > 2.2. Prove Proposition 2.3(c), giving the formula w^{(2)}_i(F) = 2^{a+b} when i is even and F is exceptional. Hint: Consider µ(i)^H, H = Gal(F̄/F(√−1)).

## N.5 — Odd groups, including extension data

The integral structure, not merely the rank or the completion.

For `F` totally imaginary and `n = 2j−1 ≥ 3`: `ℤ^{r₂} ⊕ ℤ/w_j(F)`. For `r₁ > 0` the answer depends on `n` modulo **eight**, with a doubled cyclic factor and an elementary abelian factor at `n ≡ 3`, and a halved one at `n ≡ 5` — where the needed divisibility is part of the theorem.

**The splittings are not natural; the maps are.** What must be carried is the e-invariant, the Chern maps, their kernels and the extension classes. A proof by matching cardinalities is not a proof.

**The dyadic calculation is imported.** The real two-primary computation — the spectral sequences of `ℝ`, whose differentials are fixed by Suslin's `K_n(ℝ; ℤ/m) ≅ π_n(BO; ℤ/m)`, and Theorem VI.9.4 with its real-place maps and extensions — is `MotivicEtaleKTheory:M.7`'s; N.5 uses its output and does no second dyadic calculation (RT-AREA-ktheory-1/3).

Coverage: **partial**.

K_{2j−1}(O_{F,S}) ≅ K_{2j−1}(F) for j ≥ 2 is N.5/soule-theorem, with its finite-coefficient input N.5/soule-mod-l-surjectivity; both moved from N.2, since the proof needs finite generation (restructure). The former restatement of it in N.5 is deleted. The odd rows of Theorem VI.8.2 at a prime where the cohomological dimension is two, with the identification of the ℓ-primary torsion with W_i(F){ℓ} through the natural comparison maps of MotivicEtaleKTheory M.7/M.8; the table for a totally imaginary field, ℤ^{r_2} ⊕ ℤ/w_j(F), covering ℓ = 2 and exceptional fields; and the four rows modulo eight for r_1 > 0, with the divisibility in the class n ≡ 5 from w_i^{(2)}(F) = 2 for odd i, the two-primary part read off from Theorem VI.9.4 (imported from M.7, which AUDIT-27 names as owner of the real two-primary calculation), and the rule that orders alone prove nothing. The former node 'what is natural and what is not' was a rule, not a declaration, and is deleted: the non-naturality of the splittings and the cardinality warning are in the-real-case-modulo-eight, the naturality of the identifications in odd-torsion-at-a-prime-where-cd-is-two and the M.7/M.8 requests, the extension data in Theorem VI.9.4 (M.7) and N.6/the-two-primary-corrections. The dyadic real-place calculation is imported from MotivicEtaleKTheory M.7, not repeated (RT-AREA-ktheory-1/3): M.7 owns Theorem VI.9.4 with the spectral sequences of ℝ, whose differentials it fixes from Suslin's theorem K_n(ℝ; ℤ/m) ≅ π_n(BO; ℤ/m) (K-book VI.3.1) and real topological K-theory; N.5/the-real-case-modulo-eight uses only its output, the real-place maps and the extension data.

Remaining:

- The real two-primary calculation, Theorem VI.9.4 with Lemma VI.9.3, is imported from MotivicEtaleKTheory M.7 (open request).
- The comparison of N.4's e-invariant with the identification K_{2i−1}(O_S){ℓ} ≅ W_i(F){ℓ}, and its kernel on the two-primary torsion in the class n ≡ 3 (mod 8), are not decomposed; the source shows only that e : K_3(ℚ) → ℤ/24 and e : K_{8k+3}(ℚ) → ℤ/w_{4k+2}(ℚ) are not injective (Example VI.2.1.2, Remark VI.2.1.3).
- Gap: 'K-theory with finite coefficients has no supplier stage'.
- Gap: 'No stage names Suslin's computation of the torsion of K_*(F^s)'.
- Gap: 'Harris and Segal's theorem is quoted, not proved'.

### The odd K-groups of a totally imaginary field (Theorem VI.8.4, odd rows; Theorem VI.9.5(a))

`ArithmeticKTheory:N.5/totally-imaginary-integral-structure` · *theorem* · planet **Odd K-groups of totally imaginary fields**

Let F be a totally imaginary number field (no real place) with r_2 complex places and O_S the ring of S-integers for a finite set S of finite places. For every n = 2i − 1 ≥ 3, K_n(O_S) ≅ K_n(F) ≅ ℤ^{r_2} ⊕ ℤ/w_i(F), where w_i(F) is the order of W_i(F) = H^0(F; ℚ/ℤ(i)) of N.4. The torsion subgroup is cyclic of order w_i(F), its ℓ-primary part being identified with W_i(F){ℓ} for every prime ℓ including ℓ = 2 (N.5/odd-torsion-at-a-prime-where-cd-is-two, available at 2 because F has no real place); the free summand is not canonical. The theorem covers exceptional totally imaginary fields such as ℚ(√−7). The other rows of Theorem VI.8.4 are owned elsewhere: n = 0 and n = 1 by N.1 (K_0 = ℤ ⊕ Pic(O_S), K_1 = O_S^× ≅ ℤ^{r_2+|S|−1} ⊕ μ(F) with μ(F) cyclic of order w_1(F)), and n = 2i ≥ 2 by N.6/even-groups-of-a-totally-imaginary-field, which N.5 cannot import because N.6 lies downstream of N.5.

**Hypotheses.**

- F is a number field with NumberField.IsTotallyComplex F, equivalently nrRealPlaces F = 0 (mathlib:NumberField.nrRealPlaces_eq_zero_iff); r_2 = nrComplexPlaces F.
- S is a finite set of finite places; for odd n ≥ 3 the group does not depend on S (N.5/soule-theorem).
- n = 2i − 1 ≥ 3, that is i ≥ 2.

**Proof outline.**

1. K_n(O_S) ≅ K_n(F) for odd n ≥ 3 (N.5/soule-theorem).
2. K_n(O_S) is finitely generated of rank r_2: for r_1 = 0 both classes n ≡ 1 and n ≡ 3 (mod 4) of N.3/finiteness-and-ranks-combined give r_2. By the structure theorem (mathlib:AddCommGroup.equiv_free_prod_directSum_zmod) K_n(O_S) ≅ ℤ^{r_2} ⊕ T with T finite.
3. T = ⊕_ℓ T{ℓ} and T{ℓ} ≅ ℤ/w_i^{(ℓ)}(F) for every prime ℓ by N.5/odd-torsion-at-a-prime-where-cd-is-two, whose hypothesis at ℓ = 2 holds because F is totally imaginary.
4. w_i(F) = ∏_ℓ w_i^{(ℓ)}(F) (N.4/the-w-invariant), so ⊕_ℓ ℤ/w_i^{(ℓ)}(F) ≅ ℤ/w_i(F) by the Chinese remainder theorem.

**Acceptance.**

- K_3(ℤ[i]) ≅ ℤ ⊕ ℤ/24, K_7(ℤ[i]) ≅ ℤ ⊕ ℤ/240 and K_{4k+1}(ℤ[i]) ≅ ℤ ⊕ ℤ/4 for k > 0 (Exercise VI.8.5): r_2 = 1, w_2(ℚ(i)) = w_2(ℚ) = 24, w_4 = 240 and w_i(ℚ(i)) = 4 for odd i (Example VI.2.1.2).
- Exceptional totally imaginary fields such as ℚ(√−7) are covered; no non-exceptionality hypothesis is used.
- This is not the real-embedding table read at r_1 = 0: for ℚ(i) and n = 3 the torsion is ℤ/24 = ℤ/w_2, not ℤ/2w_2, and for n = 5 it is ℤ/4 = ℤ/w_3, not ℤ/(w_3/2).

**Prerequisites.** `ArithmeticKTheory:N.5/soule-theorem`, `ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `ArithmeticKTheory:N.4/the-w-invariant`, `mathlib:NumberField.IsTotallyComplex`, `mathlib:NumberField.nrRealPlaces_eq_zero_iff`, `mathlib:NumberField.InfinitePlace.nrComplexPlaces`, `mathlib:AddCommGroup.equiv_free_prod_directSum_zmod`

**Sources.**

- K-book, VI.8.4, Theorem 8.4 (PDF p. 522; book p. 514). Theorem 8.4; this node states its odd row n = 2i − 1 ≥ 3, the rows n = 0, 1 being N.1's and the row n = 2i ≥ 2 N.6's.

  > Theorem 8.4. Let F be a totally imaginary number field, and let OS be the ring of S-integers in F for some set S of finite places. Then: Kn(OS) ≅ Z ⊕ Pic(OS), for n = 0; Zr2+|S|−1 ⊕ Z/w1(F), for n = 1; ⊕ℓH2et(OS[1/ℓ]; Zℓ(i + 1)) for n = 2i ≥ 2; Zr2 ⊕ Z/wi(F) for n = 2i − 1 ≥ 3.

- K-book, VI.8.4, proof (PDF p. 522; book p. 514). The proof: ranks from the classical data, torsion from Theorem 8.2 (proof steps 2 and 3).

  > Proof. The cases n = 0, 1 and the ranks of Kn are part of the Classical Data 8.1. Since F is totally imaginary, the torsion comes from Theorem 8.2.

- K-book, VI.8.4, the sentence before the theorem (PDF p. 522; book p. 514). The scope of the theorem, which includes exceptional totally imaginary fields.

  > Combining Theorems 8.1 and 8.2, we obtain a description of K∗(OS) when F is totally imaginary. This includes exceptional number fields such as Q(√−7).

- K-book, VI.9.5, Theorem 9.5, opening and part (a) (PDF p. 527; book p. 519). The same row restated as Theorem 9.5(a), with K_n(O_S) ≅ K_n(F).

  > Theorem 9.5. Let OS be a ring of S-integers in a number field F. Then for each odd n ≥ 3, the group Kn(OS) ≅ Kn(F) is given by: (a) If F is totally imaginary, Kn(F) ≅ Zr2 ⊕ Z/wi(F);

- K-book, VI, Exercise 8.5 (PDF p. 524; book p. 516). The worked instances used in the acceptance.

  > 8.5. Show that K3(Z[i]) ≅ Z ⊕ Z/24, K7(Z[i]) ≅ Z ⊕ Z/240 and K4k+1(Z[i]) ≅ Z ⊕ Z/4 for all k > 0.

### The odd K-groups of a number field with a real embedding (Theorem VI.9.5(b))

`ArithmeticKTheory:N.5/the-real-case-modulo-eight` · *theorem* · planet **Odd K-groups of real number fields**

Let F be a number field with r_1 > 0 real embeddings and r_2 complex places, and O_S a ring of S-integers in F. For each odd n ≥ 3, with i = (n + 1)/2, K_n(O_S) ≅ K_n(F) and K_n(F) ≅ ℤ^{r_1+r_2} ⊕ ℤ/w_i(F) for n ≡ 1 (mod 8); ℤ^{r_2} ⊕ ℤ/2w_i(F) ⊕ (ℤ/2)^{r_1−1} for n ≡ 3 (mod 8); ℤ^{r_1+r_2} ⊕ ℤ/(w_i(F)/2) for n ≡ 5 (mod 8); ℤ^{r_2} ⊕ ℤ/w_i(F) for n ≡ 7 (mod 8). In the class n ≡ 5 (mod 8) the index i is odd, so w_i^{(2)}(F) = 2 and w_i(F)/2 is an odd integer: K_n(F) has no two-primary torsion. These groups are determined by r_1, r_2 and w_i(F). The direct-sum decompositions are of abstract groups and are not natural; what is natural is the identification of the ℓ-primary torsion through the comparison maps (N.5/odd-torsion-at-a-prime-where-cd-is-two for ℓ odd, and for ℓ = 2 the ℚ_2/ℤ_2-coefficient computation of MotivicEtaleKTheory M.7, Theorem VI.9.4, induced by the morphism to the real places), including the non-split extension that produces ℤ/2w_i(F) ⊕ (ℤ/2)^{r_1−1}.

**Hypotheses.**

- r_1 = nrRealPlaces F > 0. The hypothesis is essential: for a totally imaginary field the classes n ≡ 3 and n ≡ 5 (mod 8) have torsion ℤ/w_i(F) (N.5/totally-imaginary-integral-structure), and (ℤ/2)^{r_1−1} is undefined for r_1 = 0.
- O_S is any ring of S-integers; since n is odd, K_n(O_S) ≅ K_n(F) ≅ K_n(O_S[1/2]) (N.5/soule-theorem), so one may assume 1/2 ∈ O_S, which Theorem VI.9.4 requires.
- w_i(F) = ∏_ℓ w_i^{(ℓ)}(F). Every real number field is exceptional and does not contain √−1, so w_i^{(2)}(F) = 2 for odd i (Proposition VI.2.3(b), N.4/exceptional-fields-at-two).
- The dyadic calculation is MotivicEtaleKTheory M.7's and is imported, not repeated (RT-AREA-ktheory-1/3): Theorem VI.9.4 with Lemma VI.9.3, the spectral sequences of ℝ (Theorem VI.9.1, Variant VI.9.1.2), whose differentials M.7 fixes from Suslin's K_n(ℝ; ℤ/m) ≅ π_n(BO; ℤ/m) for n ≥ 1 (K-book VI.3.1) and real topological K-theory, and the real-place maps α^n_S(i) with the extension data they detect. This node uses only that output: the groups K_{n+1}(R; ℚ_2/ℤ_2), the maps to ⊕_{real} K_*(ℝ; ℚ_2/ℤ_2) and the extensions, and performs no second spectral-sequence computation.

**Proof outline.**

1. Replace O_S by R = O_S[1/2], which contains O_F[1/2] (N.5/soule-theorem).
2. Rank: r_1 + r_2 for n ≡ 1 (mod 4) and r_2 for n ≡ 3 (mod 4) (N.3/finiteness-and-ranks-combined), so K_n(R) ≅ ℤ^r ⊕ T with T finite (mathlib:AddCommGroup.equiv_free_prod_directSum_zmod).
3. Odd torsion: T{ℓ} ≅ ℤ/w_i^{(ℓ)}(F) for every odd ℓ (N.5/odd-torsion-at-a-prime-where-cd-is-two).
4. Two-primary torsion: K_{n+1}(R) is finite, so T{2} ≅ K_{n+1}(R; ℚ_2/ℤ_2) by the universal coefficient sequence (StableHomotopyKTheory H.6). Read it off from Theorem VI.9.4, imported from MotivicEtaleKTheory M.7 together with its real-place maps and extension data (no spectral-sequence computation here) in degree n + 1 ≡ 2, 4, 6, 0 (mod 8): ℤ/2 = ℤ/w_i^{(2)}(F) for i = 4k + 1; ℤ/2w_{4k+2}^{(2)}(F) ⊕ (ℤ/2)^{r_1−1}; 0; and ℤ/w_{4k+4}^{(2)}(F) (the row n + 1 = 8(k + 1) of Theorem VI.9.4, where the source's w_{4k}(F) is the two-primary w^{(2)}), using w_i^{(2)}(F) = 2 for odd i (N.4/exceptional-fields-at-two).
5. Assemble T = T{2} ⊕ ⊕_{ℓ odd} T{ℓ} with the Chinese remainder theorem: for n ≡ 3 (mod 8) the factor ℤ/2w_i^{(2)} combines with the odd parts to ℤ/2w_i(F); for n ≡ 5 (mod 8) the two-primary part is 0 and the odd part is ℤ/(w_i(F)/2), an integer because w_i^{(2)}(F) = 2.

**Acceptance.**

- K_3(ℤ) ≅ ℤ/48 = ℤ/2w_2(ℚ) (r_1 = 1, r_2 = 0, (ℤ/2)^0 = 0), the value of Lee and Szczarba quoted in Example VI.2.1.2.
- K_5(ℚ) ≅ ℤ since w_3(ℚ) = 2 (Example VI.9.5.1); K_7(ℤ) ≅ ℤ/240 = ℤ/w_4(ℚ); K_9(ℤ) ≅ ℤ ⊕ ℤ/2 since w_5(ℚ) = 2.
- F = ℚ(√2), r_1 = 2, r_2 = 0, n = 3: w_2(F) = 48 (two-primary part 2^{a+b} = 2^{3+1} = 16 by Proposition VI.2.3(c) with a = 3 because F(√−1) = ℚ(ζ_8), three-part 3 by Proposition VI.2.2, and no other prime), so K_3(ℤ[√2]) ≅ ℤ/96 ⊕ ℤ/2.
- The hypothesis r_1 > 0 cannot be dropped: for ℚ(i) the classes n = 3 and n = 5 give ℤ ⊕ ℤ/24 and ℤ ⊕ ℤ/4 (Exercise VI.8.5), not ℤ ⊕ ℤ/48 ⊕ (ℤ/2)^{−1} and ℤ ⊕ ℤ/2.
- Matching orders is not a proof: ℤ/2w_i ⊕ (ℤ/2)^{r_1−1} and ℤ/2^{r_1}w_i have the same order; the proof identifies the torsion through the comparison maps of N.5/odd-torsion-at-a-prime-where-cd-is-two and MotivicEtaleKTheory M.7.

**Prerequisites.** `ArithmeticKTheory:N.5/soule-theorem`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `ArithmeticKTheory:N.3:ranks/borel-rank-theorem`, `ArithmeticKTheory:N.4/the-w-invariant`, `ArithmeticKTheory:N.4/exceptional-fields-at-two`, `ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two`, `MotivicEtaleKTheory:M.7`, `StableHomotopyKTheory:H.6`, `mathlib:NumberField.InfinitePlace.nrRealPlaces`, `mathlib:AddCommGroup.equiv_free_prod_directSum_zmod`

**Sources.**

- K-book, VI.9.5, Theorem 9.5, opening and part (a) (PDF p. 527; book p. 519). The opening of Theorem 9.5, with K_n(O_S) ≅ K_n(F).

  > Theorem 9.5. Let OS be a ring of S-integers in a number field F. Then for each odd n ≥ 3, the group Kn(OS) ≅ Kn(F) is given by: (a) If F is totally imaginary, Kn(F) ≅ Zr2 ⊕ Z/wi(F);

- K-book, VI.9.5, Theorem 9.5(b) (PDF p. 527; book p. 519). The four rows modulo eight, which this node states.

  > (b) If F has r1 > 0 real embeddings then, setting i = (n + 1)/2, Kn(F) ≅ Zr1+r2 ⊕ Z/wi(F), n ≡ 1 (mod 8) Zr2 ⊕ Z/2wi(F) ⊕ (Z/2)r1−1, n ≡ 3 (mod 8) Zr1+r2 ⊕ Z/½wi(F), n ≡ 5 (mod 8) Zr2 ⊕ Z/wi(F), n ≡ 7 (mod 8).

- K-book, VI.9.5, the remark after the theorem (PDF p. 527; book p. 519). What the groups are determined by; the abstract groups, not the maps.

  > Note that these groups are determined only by the number r1, r2 of real and complex places of F and the integers wi(F).

- K-book, VI.9.5, proof (PDF p. 528; book p. 520). The proof: odd torsion from Theorem 8.2, two-primary torsion from Theorem 9.4 through universal coefficients (proof steps 3 and 4).

  > The odd torsion is given by Theorem 8.2, so we need only worry about the 2-primary torsion. Since Kn+1(OS) is finite, it follows from Ex. IV.2.6 that the 2-primary subgroup of Kn(OS) is Kn+1(OS; Z/2∞), which we can read off from Theorem 9.4, recalling from 2.3(b) that w(2)i(F) = 2 for odd i.

- K-book, VI.9.5.1, Example 9.5.1 (PDF p. 528; book p. 520). The divisibility in the class n ≡ 5 (mod 8): w_i(F)/2 is odd.

  > Example 9.5.1. Kn(Q) ≅ Z for all n ≡ 5 (mod 8) as wi(Q) = 2; see 2.1.2. More generally, if F has a real embedding and n ≡ 5 (mod 8), then Kn(F) has no 2-primary torsion, because ½wi(F) is an odd integer when i is odd; see 2.3(b).

- K-book, VI.2.3, Proposition 2.3(b) and the remark after it (PDF p. 479; book p. 471). w_i^{(2)}(F) = 2 for odd i when √−1 ∉ F, and every real number field is exceptional.

  > (b) If √−1 ∉ F and i is odd then w(2)i = 2. ... In particular, real number fields (like Q) are exceptional, and so are some totally imaginary number fields, like Q(√−7).

- K-book, VI.2.1.2, Example 2.1.2, second paragraph (PDF p. 478; book p. 470). The value K_3(ℤ) ≅ ℤ/48 used in the acceptance.

  > In [108], Lee and Szczarba used a variant of the formula K3(R) = H3(St(R); Z) (Ex. IV.1.9) to show that K3(Z) ≅ K3(Q) ≅ Z/48.

### Soulé's theorem: the K-groups of the S-integers and of the field agree in odd degrees

`ArithmeticKTheory:N.5/soule-theorem` · *theorem* · planet **Soulé's theorem**

Let F be a number field, S a finite set of nonzero primes of 𝓞_F and R = O_{F,S}. Then K_n(R) → K_n(F) is an isomorphism for every odd n ≥ 3, and for every even n ≥ 2 the localisation sequence breaks up into short exact sequences 0 → K_n(R) → K_n(F) → ⊕_{𝔭∉S} K_{n−1}(k(𝔭)) → 0; equivalently SK_n(R) := ker(K_n(R) → K_n(F)) = 0 for all n ≥ 1. This is an additional theorem, not a consequence of exactness. The source states it for every Dedekind domain whose fraction field is a global field; this node states the case of rings of S-integers of number fields, which is the roadmap's.

**Hypotheses.**

- F is a number field and S finite. The function-field case needs Bass–Milnor–Serre's Variant III.2.5.1 and Quillen's theorem for affine curves over finite fields, which KTheoryLowDegrees U.4 (number fields only) does not supply.
- For Dedekind domains not of finite type, such as ℤ_(p), the source's proof cites IV.6.9 outside its hypotheses (K₁(ℤ_(p)) = ℤ_(p)^× is not finitely generated); the statement follows there by a filtered colimit over rings of S-integers (sourceIssues).
- The node lives in N.5, whose text asks for it ('Prove K_{2j−1}(O_{F,S}) ≅ K_{2j−1}(F) for j≥2'): its proof uses N.3:finite-generation, and a proof in N.2 would close the stage cycle N.2 → N.3:finite-generation → N.2.

**Proof outline.**

1. Reduction: if SK_n(R) = 0 for all n ≥ 1, the maps ⊕ K_n(k(𝔭)) → K_n(R) vanish and (6.6) breaks into 0 → K_n(R) → K_n(F) → ⊕ K_{n−1}(k(𝔭)) → 0; for odd n ≥ 3 the right-hand term is 0 (n − 1 even, L.1), so K_n(R) ≅ K_n(F).
2. n = 1: SK₁(O_{F,S}) = 0, Bass–Milnor–Serre (U.4).
3. n even: N.2/even-degree-injectivity.
4. n = 2i − 1 ≥ 3: SK_n(R) is the image of the torsion group ⊕ K_n(k(𝔭)) and K_n(R) is finitely generated (N.3:finite-generation), so SK_n(R) is finite; choose ℓ annihilating the torsion of K_n(R), so that SK_n(R) injects into K_n(R)/ℓ ⊆ K_n(R; ℤ/ℓ).
5. K_n(R; ℤ/ℓ) → K_n(F; ℤ/ℓ) is injective for odd n: by the mod-ℓ localisation sequence this is the surjectivity of ∂ in N.5/soule-mod-l-surjectivity.
6. SK_n(R) maps to 0 in K_n(F), hence in K_n(F; ℤ/ℓ), so it is 0.

**Acceptance.**

- n = 2: 0 → K₂(O_{F,S}) → K₂(F) → ⊕_{𝔭∉S} k(𝔭)^× → 0, which K2SymbolsBrauer T.5 proves directly from K₂(𝔽_q) = 0 and SK₁ = 0; the two must agree.
- The corresponding statement in degree zero is false: ker(K₀(R) → K₀(F)) = Pic(R), ≅ ℤ/2 for 𝓞 of ℚ(√−5).
- Both O_F and O_{F,S} have the odd K-groups of F in degrees ≥ 3, so K_n(O_F) ≅ K_n(O_{F,S}) there.

**Prerequisites.** `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `ArithmeticKTheory:N.2/even-degree-injectivity`, `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`, `ArithmeticKTheory:N.5/soule-mod-l-surjectivity`, `KTheoryLowDegrees:U.4`, `KTheoryFiniteLocalFields:L.1`

**Sources.**

- K-book, V.6.8 (PDF p. 420; book p. 412). The theorem, in the source's generality.

  > Theorem 6.8. (Soulé [171]) Let R be a Dedekind domain whose field of fractions F is a global field. Then Kn(R) ≅ Kn(F) for all odd n ≥ 3; for even n ≥ 2 the localization sequence breaks up into exact sequences: 0 → Kn(R) → Kn(F) → ⊕𝔭 Kn−1(R/𝔭) → 0.

- K-book, V.6.8, proof (PDF p. 420; book p. 412). The reduction and the degree-one case.

  > Let SKn(R) denote the kernel of Kn(R) → Kn(F); from (6.6), it suffices to prove that SKn(R) = 0 for n ≥ 1. For n = 1 this is the Bass-Milnor-Serre Theorem III.2.5 (and III.2.5.1).

- K-book, V.6.8, proof (PDF p. 420; book p. 412). The odd-degree argument.

  > Fixing n = 2i − 1 ≥ 1, we may choose a positive integer ℓ annihilating the (finite) torsion subgroup of Kn(R). Thus SKn(R) injects into the subgroup Kn(R)/ℓ of Kn(R; Z/ℓ), which in turn injects into Kn(F; Z/ℓ) by Proposition 6.8.1 below.

### Soulé's surjectivity of the boundary with finite coefficients

`ArithmeticKTheory:N.5/soule-mod-l-surjectivity` · *theorem*

Let F be a number field, S a finite set of nonzero primes and R = O_{F,S} (the source: any Dedekind domain whose fraction field is a global field). For every ℓ ≥ 2 and every even n ≥ 2 the boundary ∂ : K_n(F; ℤ/ℓ) → ⊕_𝔭 K_{n−1}(R/𝔭; ℤ/ℓ) of the localisation sequence with ℤ/ℓ coefficients is onto; equivalently K_{n−1}(R; ℤ/ℓ) → K_{n−1}(F; ℤ/ℓ) is injective.

**Hypotheses.**

- K-theory with ℤ/ℓ coefficients, its localisation sequence (V.5.2), the product on K_*(R; ℤ/ℓ) for ℓ ≢ 2 (mod 4) (IV.2.8) and the Bott element (IV.2.5.2) have no supplier stage in the atlas (gap).
- The analogue for n = 1 fails exactly when Pic(R)/ℓ ≠ 0 (the source says it is false; sourceIssues).

**Proof outline.**

1. Replace ℓ by 2ℓ if necessary so that ℓ ≢ 2 (mod 4): K_{n−1}(R/𝔭)/2ℓ surjects onto K_{n−1}(R/𝔭)/ℓ, and the product on K_*(R; ℤ/ℓ) is defined.
2. n = 2: K₁(R; ℤ/ℓ) → K₁(F; ℤ/ℓ) is injective (Ex. IV.2.3), which is the claim.
3. n = 2i, ζ_ℓ ∈ R: with β ∈ K₂(R; ℤ/ℓ) the Bott element, multiplication by β^{i−1} is onto ⊕ K_{2i−1}(R/𝔭; ℤ/ℓ) from ⊕ K₁(R/𝔭)/ℓ (IV.1.13, L.1); lift a ∈ ⊕ K₁(R/𝔭)/ℓ to s ∈ K₂(F; ℤ/ℓ) by the case n = 2; then ∂(β^{i−1}s) = β^{i−1}∂(s) = β^{i−1}a by K_*(R)-linearity of ∂.
4. General case: pass to R′, the integral closure of R in F′ = F(ζ_ℓ); every 𝔭 has a 𝔭′ over it and the transfers K_{2i−1}(R′/𝔭′) → K_{2i−1}(R/𝔭) are onto (IV.1.13, L.1); conclude by the morphism of localisation sequences with coefficients (N.2/localisation-sequence-and-finite-extensions).

**Acceptance.**

- n = 2, R = ℤ: ∂ : K₂(ℚ; ℤ/ℓ) → ⊕_p 𝔽_p^×/ℓ is onto.
- The statement is about coefficients: the integral boundary K_n(F) → ⊕ K_{n−1}(R/𝔭) is onto for even n by N.5/soule-theorem, whose proof uses this node.
- For n = 1 and R = 𝓞 of ℚ(√−5), ℓ = 2, the analogous map K₁(F; ℤ/2) → ⊕ ℤ/2 is not onto, its cokernel being Pic(R)/2 ≅ ℤ/2.

**Prerequisites.** `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `ArithmeticKTheory:N.2/localisation-sequence-and-finite-extensions`, `KTheoryFiniteLocalFields:L.1`, `ArithmeticKTheory:N.1/S-integers-in-a-finite-extension`

**Sources.**

- K-book, V.6.8.1 (PDF p. 420; book p. 412). The proposition.

  > Proposition 6.8.1. (Soulé) Let R be a Dedekind domain whose field of fractions F is a global field. Then for each ℓ and each even n ≥ 2, the boundary map ∂ : Kn(F; Z/ℓ) → ⊕Kn−1(R/𝔭; Z/ℓ) is onto in the localization sequence with coefficients Z/ℓ.

- K-book, V.6.8.1, proof (PDF p. 421; book p. 413). The first reduction.

  > Since Kn−1(R/𝔭)/2ℓ = Kn−1(R/𝔭; Z/2ℓ) surjects onto Kn−1(R/𝔭)/ℓ = Kn−1(R/𝔭; Z/ℓ) for each 𝔭, we may increase ℓ to assume that ℓ ≢ 2 (mod 4), so that the product (IV.2.8) is defined on K∗(R; Z/ℓ).

- K-book, V.6.8.1, proof (PDF p. 421; book p. 413). The passage to F(ζ_ℓ).

  > In the general case, we pass to the integral closure R′ of R in the field F′ = F(ζℓ). Every prime ideal 𝔭 of R has a prime ideal 𝔭′ of R′ lying over it, and the transfer maps K2i−1(R′/𝔭′) → K2i−1(R/𝔭) are all onto by IV.1.13.

### The e-invariant

`ArithmeticKTheory:N.5/e-invariant` · *definition*

For a field F with separable closure F^s, G = Gal(F^s/F), and i ≥ 1, the e-invariant is the natural map e : K_{2i−1}(F)_tors → K_{2i−1}(F^s)^G_tors ≅ µ(i)^G = W_i(F) induced by F → F^s; it is defined because K_*(F) → K_*(F^s) is G-equivariant with G acting trivially on K_*(F), and the identification of K_{2i−1}(F^s)_tors with µ(i) as a G-module is Suslin's (K-book Proposition VI.1.7.1 and Exercise VI.1.1). Its ℓ-primary component is e^{(ℓ)} : K_{2i−1}(F){ℓ} → W_i^{(ℓ)}(F). For a ring of S-integers it is composed with K_{2i−1}(𝓞_{F,S}) → K_{2i−1}(F). The e-invariant is natural in F.

**Hypotheses.**

- F is a field and i ≥ 1; the arithmetic cases are number fields and their rings of S-integers.
- The G-isomorphism K_{2i−1}(F^s)_tors ≅ µ(i) is imported; see the gap on its owner.
- This node belongs to N.5, not N.4: N.4's stage text defines W_j(F) without K-theory, while N.5's text requires 'the e-invariant/Chern maps, their kernels and the extension classes used to obtain them' to be natural.

**Construction.**

1. Functoriality of K-theory along F → F^s and along the automorphisms of F^s (GeneralAlgebraicKTheory K.1) makes K_{2i−1}(F) → K_{2i−1}(F^s)^G well defined, and it preserves torsion.
2. Import the G-isomorphism K_{2i−1}(F^s)_tors ≅ µ(i) (Proposition VI.1.7.1, through the rigidity theorems of MotivicEtaleKTheory M.7).
3. Compose with µ(i)^G = W_i(F) (N.4/the-w-invariant).
4. Naturality: for E/F finite separable, e_E composed with K_{2i−1}(F) → K_{2i−1}(E) equals the restriction W_i(F) → W_i(E) composed with e_F.

**Acceptance.**

- For F_q, e is an isomorphism K_{2i−1}(F_q) ≅ Z/(q^i − 1) (Example VI.2.1.1).
- For Q and i = 2, e : K_3(Q) ≅ Z/48 → W_2(Q) ≅ Z/24 is not injective (Example VI.2.1.2).

**Prerequisites.** `ArithmeticKTheory:N.4/the-w-invariant`, `MotivicEtaleKTheory:M.7`, `GeneralAlgebraicKTheory:K.1`

**API.**

| name | role | statement |
| --- | --- | --- |
| `TauCeti.eInvariant` | data | e : K_{2i−1}(F)_tors →+ W_i(F), for i ≥ 1. |
| `TauCeti.eInvariant.primary` | projection | Its ℓ-primary component K_{2i−1}(F){ℓ} →+ W_i^{(ℓ)}(F). |
| `TauCeti.eInvariant_natural` | functoriality | For E/F finite separable, e_E ∘ K_{2i−1}(F → E) = WInvariant.res ∘ e_F. |
| `TauCeti.eInvariant_one` | compatibility | For i = 1, under K_1(F) = F^×, e is the identity of µ(F) = W_1(F). |
| `TauCeti.eInvariant_finiteField_bijective` | example | For F_q, e : K_{2i−1}(F_q) → W_i(F_q) is a bijection. |

**Used by.**

- *N.5/harris-segal-summand (K-book Theorem VI.2.5)* — the Harris-Segal summand is the one on which e is an isomorphism.
- *N.5/the-real-case-modulo-eight and N.6/the-two-primary-corrections* — the stage text requires the e-invariant and the Chern maps to be natural; the natural identifications are imported from MotivicEtaleKTheory M.7 and M.8, and the tables are proved through them.

**Unit tests.**

- `TauCeti.eInvariant_finiteField_bijective` (computation) — For F_q and i ≥ 1, e : K_{2i−1}(F_q) ≅ Z/(q^i − 1) → W_i(F_q) ≅ Z/(q^i − 1) is an isomorphism.
- `TauCeti.eInvariant_rat_three_not_injective` (non-example) — For Q and i = 2, K_3(Q) ≅ Z/48 and W_2(Q) ≅ Z/24, so e is not injective; it kills the symbol {−1, −1, −1} (Remark VI.2.1.3).
- `TauCeti.eInvariant_sepClosed` (degenerate) — If F is separably closed, G is trivial and e is the identification K_{2i−1}(F)_tors ≅ µ(i).
- `TauCeti.eInvariant_one` (compatibility) — For i = 1, e : µ(F) = K_1(F)_tors → W_1(F) = µ(F) is the identity.

**Sources.**

- K-book, VI.2.1, Definition 2.1, first half (PDF p. 477; book p. 469). The definition, verbatim.

  > Definition 2.1. Let F be a field, with separable closure F̄ and Galois group G = Gal(F̄/F). Since K_*(F) → K_*(F̄) is a homomorphism of G-modules, with G acting trivially on K_n(F), it follows that there is a natural map e : K_{2i−1}(F)_tors → K_{2i−1}(F̄)^G_tors ≅ µ(i)^G.

- K-book, VI.1.7.1 (PDF p. 476; book p. 468). The identification the definition uses, verbatim.

  > Proposition 1.7.1. If F is algebraically closed and i > 0, the torsion submodule of K_{2i−1}(F) is isomorphic to µ(i) as an Aut(F)-module.

- K-book, VI.2.1.2 (PDF p. 478). The non-injectivity for Q, verbatim.

  > In [108], Lee and Szczarba used a variant of the formula K_3(R) = H_3(St(R); Z) (Ex. IV.1.9) to show that K_3(Z) ≅ K_3(Q) ≅ Z/48. It follows that the e-invariant K_3(Q) → Z/24 cannot be an injection.

### The Harris–Segal summand

`ArithmeticKTheory:N.5/harris-segal-summand` · *theorem* · planet **Harris–Segal summand**

Let F be a number field, ℓ a prime and i ≥ 1; if ℓ = 2 assume F non-exceptional. Put w = w_i^{(ℓ)}(F). Then K_{2i−1}(F) has a direct summand isomorphic to Z/w on which the e-invariant is an isomorphism onto W_i^{(ℓ)}(F), and so has K_{2i−1}(𝓞_{F,S}) for every finite S. For an exceptional F at ℓ = 2 only the weaker Remark VI.2.5.1 is available: a cyclic summand of order w_i(F), 2w_i(F) or w_i(F)/2; for real number fields Theorem VI.2.6 (extracted from Theorem VI.9.5, N.5/the-real-case-modulo-eight) says which.

**Hypotheses.**

- F is a number field. The source states the theorem for any field with 1/ℓ ∈ F and for integrally closed domains with fraction field F, but its proof reduces to subrings of cyclotomic fields and so covers characteristic zero only; this node is restricted to number fields and their rings of S-integers.
- At ℓ = 2, F is non-exceptional (N.4/exceptional-fields-at-two); every real number field is exceptional and is excluded.

**Proof outline.**

1. Case ζ_ℓ ∈ F (ζ_4 ∈ F if ℓ = 2): with m = ℓ^a the number of ℓ-primary roots of unity in F, w_i^{(ℓ)}(Q(ζ_m)) = w (Propositions VI.2.2 and VI.2.3), which reduces the claim to R = Z[ζ_m].
2. Choose a prime p ≢ 1 (mod ℓ^{a+1}) and 𝔭 over p; the residue field is F_q = F_p(ζ_m) with w_i^{(ℓ)}(F_q) = w, and for the local field E = Q_p(ζ_m) the e-invariant K_{2i−1}(E){ℓ} → Z/w is an isomorphism (Example VI.2.3.1 and Exercise VI.1.3; KTheoryFiniteLocalFields L.2).
3. By Corollary VI.1.5.2 (Harris and Segal's theorem, quoted as Theorem VI.1.5, together with Soulé's K_{2i−1}(Z[ζ_m]) ≅ K_{2i−1}(Q(ζ_m)), N.2), K_{2i−1}(R) has a cyclic summand A of order w mapping isomorphically onto the ℓ-part of K_{2i−1}(F_q) (KTheoryFiniteLocalFields L.1); hence A ≅ K_{2i−1}(E){ℓ} and e is an isomorphism on A.
4. Case ζ_ℓ ∉ F: reduce (Exercise VI.2.5) to F ⊂ Q(ζ_m) = F(ζ_ℓ) with r = [Q(ζ_m) : F] dividing i; for the transfer f_* along the Galois extension (N.1/norms-transfers-and-pullbacks), f^* f_* is multiplication by r on the Galois-fixed summand A, so f_*(A) is a summand of K_{2i−1}(R) on which e is an isomorphism.
5. Case ℓ = 2, F non-exceptional and √−1 ∉ F: F has index 2 in Q(ζ_m) = F(√−1), w_i^{(2)}(Q(ζ_m)) = 2w, and the image under f_* of the summand of order 2w is a summand of order w (the source's diagram).
6. Harris and Segal's theorem on K_*(B(µ_m ≀ Σ_∞)^+) is quoted by the source, not proved; see the gap.

**Acceptance.**

- For Q, ℓ = 3 and i = 2, K_3(Q) ≅ Z/48 has a summand Z/3 detected by e (w_2^{(3)}(Q) = 3).
- For Q(√−1) and i = 2 (non-exceptional, √−1 ∈ F), K_3(Q(√−1)) has summands Z/8 (ℓ = 2) and Z/3 (ℓ = 3), together Z/24 = Z/w_2(Q(√−1)), in agreement with K_3(Q(i)) ≅ Z ⊕ Z/24 in N.8.
- For Q at ℓ = 2 the theorem does not apply (Q is exceptional); there the Harris-Segal summand of K_3(Q) ≅ Z/48 is Z/2w_2(Q) (Theorem VI.2.6(2), i ≡ 2 (mod 4)).

**Prerequisites.** `ArithmeticKTheory:N.5/e-invariant`, `ArithmeticKTheory:N.4/computing-w-from-the-cyclotomic-character`, `ArithmeticKTheory:N.4/two-primary-w-invariant`, `ArithmeticKTheory:N.4/exceptional-fields-at-two`, `ArithmeticKTheory:N.5/soule-theorem`, `ArithmeticKTheory:N.1/norms-transfers-and-pullbacks`, `KTheoryFiniteLocalFields:L.1`, `KTheoryFiniteLocalFields:L.2`

**Sources.**

- K-book, VI.2.5, Harris-Segal Theorem 2.5 (PDF p. 481; book p. 473). The theorem for the field, verbatim.

  > Harris-Segal Theorem 2.5. Let F be a field with 1/ℓ ∈ F; if ℓ = 2, we also suppose that F is non-exceptional. Set w_i = w^{(ℓ)}_i(F). Then each K_{2i−1}(F) has a direct summand isomorphic to Z/w_i, detected by the e-invariant.

- K-book, VI.2.5, Harris-Segal Theorem 2.5, continued (PDF p. 481). The ring form, verbatim.

  > If F is the field of fractions of an integrally closed domain R then K_{2i−1}(R) also has a direct summand isomorphic to Z/w_i(F), detected by the e-invariant.

- K-book, VI.2.5, the proof (PDF p. 481). The first reduction of the proof, verbatim.

  > Suppose first that either ℓ ≠ 2 and ζ_ℓ ∈ R, or that ℓ = 2 and ζ_4 ∈ R. If R has m = ℓ^a ℓ-primary roots of unity, then w^{(ℓ)}_i(Q(ζ_m)) equals w_i = w^{(ℓ)}_i(F) by 2.2 and 2.3. Thus there is no loss in generality in assuming that R = Z[ζ_m].

- K-book, VI.1.5.2 (PDF p. 475; book p. 467). The input from Harris and Segal's theorem, verbatim.

  > Corollary 1.5.2. If q ≡ 1 (mod ℓ) and m is the order of µ^{(ℓ)}(F_q) then each group K_{2i−1}(Z[ζ_m]) ≅ K_{2i−1}(Q(ζ_m)) contains a cyclic summand mapping isomorphically onto the ℓ-primary component of K_{2i−1}(F_q) ≅ Z/(q^i − 1).

- K-book, VI.2.5.1, Remark 2.5.1 (PDF p. 482; book p. 474). The exceptional case, verbatim.

  > Remark 2.5.1. If F is an exceptional field, a transfer argument using F(√−1) shows that there is a cyclic summand in K_{2i−1}(F) whose order is either w_i(F), 2w_i(F) or w_i(F)/2. (Exercise 2.4); we will also call these Harris-Segal summands.

- K-book, VI.2.6, Theorem 2.6 (PDF p. 482). The orders for real number fields (display flattened, the 'i.e.' clauses elided).

  > Theorem 2.6. Let F be a real number field. Then the Harris-Segal summands in K_{2i−1}(F) and K_{2i−1}(O_F) are isomorphic to: (1) Z/w_i(F), if i ≡ 0 (mod 4) or i ≡ 1 (mod 4), [...] (2) Z/2w_i(F), if i ≡ 2 (mod 4), [...] (3) Z/ (1/2)w_i(F), if i ≡ 3 (mod 4)

### The odd K-groups at a prime where the cohomological dimension is two (Theorem VI.8.2, odd rows)

`ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two` · *theorem*

Let F be a number field with r_1 real and r_2 complex places, O_S a ring of S-integers in F, and ℓ a prime; if ℓ = 2 suppose F totally imaginary. For every n = 2i − 1 ≥ 3 the localisation of K_n(O_S) at ℓ is K_n(O_S)_(ℓ) ≅ ℤ_(ℓ)^{r_2} ⊕ ℤ/w_i^{(ℓ)}(F) when i is even and ℤ_(ℓ)^{r_1+r_2} ⊕ ℤ/w_i^{(ℓ)}(F) when i is odd. Equivalently the ℓ-primary torsion K_n(O_S){ℓ} is cyclic of order w_i^{(ℓ)}(F), and it is identified with H^0_et(O_S[1/ℓ]; ℚ_ℓ/ℤ_ℓ(i)) = W_i(F){ℓ} through K_{2i−1}(R){ℓ} ≅ K_{2i}(R; ℚ_ℓ/ℤ_ℓ) ≅ H^0(R; ℚ_ℓ/ℤ_ℓ(i)), R = O_S[1/ℓ]; these identifications are induced by the comparison maps of MotivicEtaleKTheory M.7 (the étale Chern classes of M.8) and are natural for O_S ⊂ O_{S'}. The free summand is not canonical.

**Hypotheses.**

- ℓ is any prime; for ℓ = 2 the field is totally imaginary. This is exactly the case in which the étale ℓ-cohomological dimension of O_S[1/ℓ] is two: for ℓ odd it is two for every number field, for ℓ = 2 it is two unless F has a real embedding (source, proof of VI.8.2).
- n = 2i − 1 ≥ 3; the ranks are Borel's (N.3); degree one is N.1's S-unit group and is not covered.
- w_i^{(ℓ)}(F) is the order of W_i(F){ℓ} = H^0(F; ℚ_ℓ/ℤ_ℓ(i)), finite for i ≥ 1 (N.4/the-w-invariant).

**Proof outline.**

1. Set R = O_S[1/ℓ]. For each prime 𝔭 of O_S over ℓ the groups K_m(O_S/𝔭), m ≥ 1, are finite of order prime to ℓ (Quillen's computation, KTheoryFiniteLocalFields L.1: K_{2j}(𝔽_q) = 0 and K_{2j−1}(𝔽_q) ≅ ℤ/(q^j − 1) with q a power of ℓ), so the localisation sequence of N.2/localisation-sequence-for-a-dedekind-domain for O_S ⊂ R gives K_n(O_S)_(ℓ) ≅ K_n(R)_(ℓ). (The source writes K_{n−1}(R/𝔭); R/𝔭 = 0, and the residue field meant is O_S/𝔭.)
2. K_n(R) is finitely generated of the rank of N.3/finiteness-and-ranks-combined, and K_{n+1}(R) is finite; by the universal coefficient sequence for ℚ_ℓ/ℤ_ℓ coefficients (StableHomotopyKTheory H.6; the source's Ex. IV.2.6) K_n(R){ℓ} ≅ K_{n+1}(R; ℚ_ℓ/ℤ_ℓ).
3. Import from MotivicEtaleKTheory M.7: since the ℓ-cohomological dimension of R is two and H^2(R; ℚ_ℓ/ℤ_ℓ(i)) = 0 (source Ex. VI.8.1), the descent spectral sequence with ℚ_ℓ/ℤ_ℓ coefficients has one nonzero term in each total degree and K_{2i}(R; ℚ_ℓ/ℤ_ℓ) ≅ H^0(R; ℚ_ℓ/ℤ_ℓ(i)) for i ≥ 1, naturally in R.
4. H^0(R; ℚ_ℓ/ℤ_ℓ(i)) = H^0(F; ℚ_ℓ/ℤ_ℓ(i)) is cyclic of order w_i^{(ℓ)}(F) (N.4/the-w-invariant). Combine with the rank and the structure theorem for finitely generated abelian groups (mathlib:AddCommGroup.equiv_free_prod_directSum_zmod) after localising at ℓ.

**Acceptance.**

- F = ℚ, ℓ odd, n = 3: K_3(ℤ){ℓ} ≅ ℤ/w_2^{(ℓ)}(ℚ), which is ℤ/3 for ℓ = 3 and 0 for ℓ ≥ 5, since w_2(ℚ) = 24 = 8 · 3 (Example VI.2.1.2); this is the odd part of K_3(ℤ) ≅ ℤ/48.
- F = ℚ(i), ℓ = 2, n = 3: K_3(ℤ[i]){2} ≅ ℤ/8, since w_2(ℚ(i)) = w_2(ℚ) = 24 (Example VI.2.1.2), in agreement with K_3(ℤ[i]) ≅ ℤ ⊕ ℤ/24 (Exercise VI.8.5).
- The hypothesis at ℓ = 2 cannot be dropped: K_3(ℤ){2} ≅ ℤ/16 (Corollary VI.9.8), while w_2^{(2)}(ℚ) = 8.
- The rank depends on the parity of i: for F = ℚ, K_5(ℤ) has rank one (i = 3 odd, r_1 + r_2 = 1) and K_3(ℤ), K_7(ℤ) have rank zero (r_2 = 0).

**Prerequisites.** `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `KTheoryFiniteLocalFields:L.1`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `StableHomotopyKTheory:H.6`, `MotivicEtaleKTheory:M.7`, `MotivicEtaleKTheory:M.8`, `ArithmeticKTheory:N.4/the-w-invariant`, `mathlib:AddCommGroup.equiv_free_prod_directSum_zmod`

**Sources.**

- K-book, VI.8.2, Theorem 8.2, the odd rows (PDF p. 521; book p. 513). The odd rows of Theorem 8.2 with its hypothesis at the prime two, which this node states.

  > Theorem 8.2. Let F be a number field, and let OS be a ring of integers in F. Fix a prime ℓ; if ℓ = 2 we suppose F totally imaginary. Then for all n ≥ 2: Kn(OS)(ℓ) ≅ ... Zr2(ℓ) ⊕ Z/w(ℓ)i(F) for n = 2i − 1, i even; Zr2+r1(ℓ) ⊕ Z/w(ℓ)i(F) for n = 2i − 1, i odd.

- K-book, VI.8.2, proof, first paragraph (PDF p. 521; book p. 513). The reduction from O_S to O_S[1/ℓ] through the localisation sequence and Quillen's finite-field computation (proof step 1; the printed R/p is the misprint recorded in sourceIssues).

  > Proof. Set R = OS[1/ℓ]. For each prime ideal p over ℓ, Kn−1(R/p) has no ℓ-torsion by IV.1.13. By the localization sequence (V, (6.6) or 6.8), Kn(OS)(ℓ) = Kn(R)(ℓ). Thus we may replace OS by R = OS[1/ℓ].

- K-book, VI.8.2, proof, second paragraph (PDF p. 521; book p. 513). Why the hypothesis at two is the cohomological-dimension hypothesis.

  > If F is a number field, the étale ℓ-cohomological dimension of R (and of F) is 2, unless ℓ = 2 and r1 > 0 (F has a real embedding).

- K-book, VI.8.2, proof, end of second paragraph (PDF p. 521; book p. 513). The identification of the ℓ-primary torsion of K_{2i−1}(R) with H^0(R; ℚ_ℓ/ℤ_ℓ(i)) = ℤ/w_i^{(ℓ)}(F) (proof steps 2 to 4).

  > Kn(R; Z/ℓ∞) ≅ H0(R; Z/ℓ∞(i)) = Z/w(ℓ)i(F) for n = 2i ≥ 2, H1(R; Z/ℓ∞(i)) for n = 2i − 1 ≥ 1. The description of K2i−1(R){ℓ} = K2i(R; Z/ℓ∞) follows.

- K-book, VI.9.8, Corollary 9.8, the table (PDF p. 530; book p. 522). The non-example at ℓ = 2 for ℚ: the two-primary part of K_3(ℤ) is ℤ/16, not ℤ/w_2^{(2)}(ℚ) = ℤ/8.

  > n (mod 8) 1 2 3 4 5 6 7 8 Kn(Z){2} Z/2 Z/2 Z/16 0 0 0 Z/16k 0

## N.6 — Even groups and arithmetic cohomology

Cohomological descriptions, the two-primary corrections, the two kernels, and the certificate engine.

The clean description holds at a prime where `cd_ℓ(O_S) = 2` — which at `ℓ = 2` is *why* the field must be totally imaginary. With a real embedding the answer is an eight-fold table containing an **extension**, not a direct sum, and an intermediate rank `ρ` that the theorem does not determine.

**The certificate engine is N.6's** (RT-AREA-ktheory-1/9). An order certificate is a finite presentation whose generators span — the upper bound — together with an *independent* lower bound, a surjection onto a group of the presented order. The cohomological descriptions supply such a lower bound in every even degree (with `ρ` as an input in degree `8k + 4`); a zeta value is admitted only through a proved theorem, never as the definition of an order. The tame kernel itself is `K2SymbolsBrauer:T.5`'s; the wild kernel and the divisible subgroup are this layer's. N.8 instantiates the engine.

Coverage: **partial**.

Eleven nodes. The even row of Theorem VI.8.2 with its ℤ_ℓ-coefficient passage; the even row of Theorem VI.8.4 for totally imaginary fields; Corollary VI.8.3 and Example VI.8.3.1, the ℓ-ranks of the even groups from the class group and |S|; the signature defect; Theorem VI.9.11, the two-primary table with real places, its extension in degree 8k+4 and the integer ρ that r_1 does not determine, with Tate's theorem K₂/2^ν ≅ H² imported from MotivicEtaleKTheory M.3, not K2SymbolsBrauer T.7 (RT-AREA-ktheory-1/8); Theorem VI.9.12, the order formula for totally real fields; the wild kernel, with the tame kernel group and its sequence imported from K2SymbolsBrauer T.5; the subgroup of divisible elements; the comparison of the two, which corrects the K-book by the exception of Weibel 2006 for special fields and odd i; and the certificate engine, which N.6 owns (RT-AREA-ktheory-1/9): the order-certificate format with independent upper and lower bounds (N.6/order-certificate, moved from K2SymbolsBrauer T.5/certified-presentation) and its cohomological lower bound in every even degree, with ρ as an input in degree 8k+4 (N.6/certificate-driven-computation), zeta values admitted only through proved theorems. ArithmeticKTheory N.8 instantiates the engine. N.6 also keeps the comparisons of the wild kernel with divisible subgroups and with Selmer/cohomological kernels (the latter still to be decomposed, below).

Remaining:

- Corollary VI.9.9 (the 2-ranks r_1+s+t−1, j+s+t−1, j+s+t−1 and s+t−1 of K_n(O_S) for n ≡ 2, 4, 6, 8 mod 8) with Theorem VI.9.7 and Lemma VI.9.6.3, the source's computation of the even groups at 2 from class-group and unit data, are not yet nodes.
- Local norm groups, named in N.6's text, are not used by any node.
- The comparison with Selmer/cohomological kernels (V.6.8.2's description of div K_n(F) as the kernel of K_n(R; ℤ/ℓ) → K_n(F; ℤ/ℓ), and Weibel 2006, Lemma 0.3 and Corollary 0.4) is not decomposed.
- Theorem A of Weibel 2006 and the comparison of the two definitions of the wild kernel (gap: The comparison of the divisible subgroup with the wild kernel rests on Weibel 2006, which corrects the K-book).

### The even K-groups at a prime where the cohomological dimension is two (Theorem VI.8.2, even row)

`ArithmeticKTheory:N.6/even-groups-at-odd-primes` · *theorem* · planet **Even K-groups at primes where cd = 2**

Let F be a number field, O_S a ring of S-integers in F and ℓ a prime; if ℓ = 2 suppose F totally imaginary. For every i ≥ 1 the group K_{2i}(O_S) is finite and its ℓ-primary part K_{2i}(O_S){ℓ} = K_{2i}(O_S)_(ℓ) is isomorphic to H^2_et(O_S[1/ℓ]; ℤ_ℓ(i+1)). The isomorphism is the composite of K_{2i}(O_S){ℓ} ≅ K_{2i}(R){ℓ} = K_{2i}(R; ℤ_ℓ), R = O_S[1/ℓ], with MotivicEtaleKTheory M.7's comparison K_{2i}(R; ℤ_ℓ) ≅ H^2(R; ℤ_ℓ(i+1)), and is natural for O_S ⊂ O_{S'}. This is the cohomological description with its inverse-limit (ℤ_ℓ-coefficient) passage; at ℓ = 2 with a real embedding it is replaced by N.6/the-two-primary-corrections, and the odd rows of the same theorem are N.5/odd-torsion-at-a-prime-where-cd-is-two.

**Hypotheses.**

- ℓ is any prime; for ℓ = 2 the field is totally imaginary, which is exactly when the étale 2-cohomological dimension of O_S[1/2] is two.
- The coefficients are ℤ_ℓ(i+1) = lim_ν μ_{ℓ^ν}^{⊗(i+1)} on O_S[1/ℓ]; for i ≥ 1, H^n(R; ℤ_ℓ(i+1)) = 0 for n ≠ 1, 2 and H^2 is finite (source Ex. VI.8.1–8.2, imported with M.7).
- i ≥ 1; K_0 is N.1's.

**Proof outline.**

1. Replace O_S by R = O_S[1/ℓ]: K_{2i}(O_S)_(ℓ) ≅ K_{2i}(R)_(ℓ) by the localisation sequence (N.2/localisation-sequence-for-a-dedekind-domain), since K_m(O_S/𝔭) has no ℓ-torsion for m ≥ 1 and 𝔭 over ℓ (KTheoryFiniteLocalFields L.1).
2. K_{2i}(R) is finite (N.3/finiteness-and-ranks-combined), so K_{2i}(R){ℓ} = K_{2i}(R)_(ℓ) ≅ K_{2i}(R; ℤ_ℓ) (StableHomotopyKTheory H.6: the ℓ-adic completion of a finite group is its ℓ-part, and the lim^1 term vanishes).
3. Import from MotivicEtaleKTheory M.7: the ℤ_ℓ-coefficient descent spectral sequence degenerates because H^n(R; ℤ_ℓ(j)) = 0 for n ≠ 1, 2 and j > 0, giving K_{2i}(R; ℤ_ℓ) ≅ H^2(R; ℤ_ℓ(i+1)).

**Acceptance.**

- F = ℚ, ℓ odd, i = 1: H^2(ℤ[1/ℓ]; ℤ_ℓ(2)) ≅ K_2(ℤ){ℓ} = 0, since K_2(ℤ) ≅ ℤ/2 (K2SymbolsBrauer T.5).
- For an odd regular prime ℓ, K_{2i}(ℤ[ζ_ℓ]) has no ℓ-torsion for every i ≥ 1 (Example VI.8.3.2; see N.6/l-rank-from-class-group-data).
- The totally imaginary hypothesis at ℓ = 2 cannot be dropped: for F = ℚ and i = 3, K_6(ℤ){2} = 0 (Corollary VI.9.8) while H^2(ℤ[1/2]; ℤ_2(4)) has order 2, the two-primary part of K_6 being the kernel H̃^2 of the surjection α^2(4) onto (ℤ/2)^{r_1} = ℤ/2 (Theorem VI.9.11).

**Prerequisites.** `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `KTheoryFiniteLocalFields:L.1`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `StableHomotopyKTheory:H.6`, `MotivicEtaleKTheory:M.7`

**Sources.**

- K-book, VI.8.2, Theorem 8.2, the even row (PDF p. 521; book p. 513). The even row of Theorem 8.2 with its hypothesis at the prime two, which this node states.

  > Theorem 8.2. Let F be a number field, and let OS be a ring of integers in F. Fix a prime ℓ; if ℓ = 2 we suppose F totally imaginary. Then for all n ≥ 2: Kn(OS)(ℓ) ≅ H2et(OS[1/ℓ]; Zℓ(i + 1)) for n = 2i > 0;

- K-book, VI.8.2, proof, first paragraph (PDF p. 521; book p. 513). The reduction from O_S to O_S[1/ℓ] (proof step 1).

  > Proof. Set R = OS[1/ℓ]. For each prime ideal p over ℓ, Kn−1(R/p) has no ℓ-torsion by IV.1.13. By the localization sequence (V, (6.6) or 6.8), Kn(OS)(ℓ) = Kn(R)(ℓ). Thus we may replace OS by R = OS[1/ℓ].

- K-book, VI.8.2, proof, last paragraph (PDF p. 522; book p. 514). The ℤ_ℓ-coefficient argument that gives K_{2i}(R; ℤ_ℓ) ≅ H^2(R, ℤ_ℓ(i+1)) (proof steps 2 and 3).

  > The same argument works for ℓ-adic coefficients Zℓ; for i > 0 we have Hnet(R, Zℓ(i)) = 0 for n ≠ 1, 2, so the spectral sequence (4.2) degenerates to yield K2i−1(R; Zℓ) ≅ H1et(R, Zℓ(i)) and K2i(R; Zℓ) ≅ H2et(R, Zℓ(i + 1)) (which is a finite group by Exercise 8.2).

- K-book, VI.8.2, proof, second paragraph (PDF p. 521; book p. 513). The cohomological-dimension hypothesis.

  > If F is a number field, the étale ℓ-cohomological dimension of R (and of F) is 2, unless ℓ = 2 and r1 > 0 (F has a real embedding).

- K-book, VI.8.3.2, Example 8.3.2 (PDF p. 522; book p. 514). The regular-prime instance used in the acceptance.

  > Example 8.3.2. If ℓ ≠ 2 is a regular prime (see 2.4.1), we claim that K2i(Z[ζℓ]) has no ℓ-torsion.

### The two-primary part of the K-groups of a number field with a real embedding (Theorem VI.9.11)

`ArithmeticKTheory:N.6/the-two-primary-corrections` · *theorem* · planet **Two-primary K-groups of real number fields**

Let F be a number field with r_1 ≥ 1 real embeddings and R = O_S a ring of S-integers in F containing 1/2; let j = j(R) be its signature defect (N.6/signature-defect) and write w_m = w_m^{(2)}(F). There is an integer ρ with j ≤ ρ ≤ r_1 − 1 such that for all n ≥ 2 the two-primary subgroup K_n(O_S){2} is isomorphic to: H^2_et(R; ℤ_2(4k+1)) for n = 8k; ℤ/2 for n = 8k+1; H^2_et(R; ℤ_2(4k+2)) for n = 8k+2; (ℤ/2)^{r_1−1} ⊕ ℤ/2w_{4k+2} for n = 8k+3; an extension of H^2_et(R; ℤ_2(4k+3)) by (ℤ/2)^ρ for n = 8k+4; 0 for n = 8k+5; H̃^2_et(R; ℤ_2(4k+4)), the kernel of α^2(4k+4) : H^2_et(R; ℤ_2(4k+4)) → (ℤ/2)^{r_1}, for n = 8k+6; and ℤ/w_{4k+4} for n = 8k+7. The integer ρ is the rank of the image of K^M_4(F) ≅ (ℤ/2)^{r_1} in K_4(F) (Corollary VI.9.10); it depends on F and not on S, and it is not determined by r_1: it is 0 for ℚ(√2) and 1 for ℚ(√7), both with r_1 = 2. The row n = 8k+4 is an extension, not a direct sum, and the theorem does not decide it.

**Hypotheses.**

- r_1 ≥ 1 and 1/2 ∈ R. For F totally imaginary the two-primary part is given by N.6/even-groups-at-odd-primes and N.5/totally-imaginary-integral-structure.
- j = j(R) (Definition VI.9.6.1) and w_m = w_m^{(2)}(F).
- In the source's notation A ⋊ B is an abelian group extension of B by A; (ℤ/2)^ρ ⋊ H^2 is an extension 0 → (ℤ/2)^ρ → K → H^2 → 0.
- ρ satisfies j ≤ ρ ≤ r_1 − 1; the source asks whether ρ can be less than min(r_1 − 1, j + s + t − 1) (Question VI.9.10.2), so ρ is data of F and is not a function of r_1 and j.

**Proof outline.**

1. Odd n = 2i − 1: the two-primary part of N.5/the-real-case-modulo-eight, using w_i^{(2)}(F) = 2 for n ≡ 1 (mod 4) (Proposition VI.2.3(b), N.4/exceptional-fields-at-two).
2. n = 2: K_2(O_S){2} ≅ H^2(R; ℤ_2(2)) by Tate's theorem K_2(O_S)/2^ν ≅ H^2(R; μ_{2^ν}^{⊗2}) for rings of S-integers with 2 inverted, which MotivicEtaleKTheory M.3 owns (RT-AREA-ktheory-1/8; not K2SymbolsBrauer T.7), and finiteness of K_2(O_S). (The source cites III.6.9.3 here.)
3. Even n = 2m ≥ 4: K_{n+1}(O_S) has rank r = r_1 + r_2 or r_2 (N.3/finiteness-and-ranks-combined), and the universal coefficient sequence 0 → (ℚ_2/ℤ_2)^r → K_{n+1}(O_S; ℚ_2/ℤ_2) → K_n(O_S){2} → 0 (StableHomotopyKTheory H.6) identifies K_n(O_S){2} with the finite part of K_{n+1}(O_S; ℚ_2/ℤ_2).
4. Import Theorem VI.9.4 from MotivicEtaleKTheory M.7: K_{n+1}(O_S; ℚ_2/ℤ_2) is H^1(R; ℚ_2/ℤ_2(m+1)) for n + 1 ≡ 1, 3 (mod 8), its subgroup H̃^1 for n + 1 ≡ 7 (mod 8), and an extension of H^1(R; ℚ_2/ℤ_2(4k+3)) by (ℤ/2)^{r_1−1} for n + 1 = 8k + 5. The finite part of H^1(R; ℚ_2/ℤ_2(m+1)) is H^2(R; ℤ_2(m+1)); α^1 vanishes on the divisible part and induces α^2, so the finite part of H̃^1 is H̃^2 (MotivicEtaleKTheory M.2). (The source writes the twist as i although n = 2i + 2; the twist of the row n = 2m is m + 1.)
5. n = 8k + 4: by mod-2 periodicity the image of H^4(O_S; ℤ/2(4)) ≅ (ℤ/2)^{r_1} in Hom(ℤ/2, K_n(O_S)) has rank ρ, which gives the (ℤ/2)^ρ; the bounds j(O_S) ≤ ρ ≤ r_1 − 1 are Corollary VI.9.10, whose proof uses {−1, −1, −1, −1} = 0 in K_4(F) and the edge map of the motivic spectral sequence (imported with MotivicEtaleKTheory M.7).

**Acceptance.**

- F = ℚ, R = ℤ[1/2] (r_1 = 1, j = ρ = 0): K_n(ℤ){2} for n ≥ 2 and n ≡ 1, …, 8 (mod 8) is ℤ/2, ℤ/2, ℤ/16, 0, 0, 0, ℤ/2^ν, 0, with 2^ν the two-primary part of 16k for n = 8k − 1 (Corollary VI.9.8); here w_{4k+2}^{(2)}(ℚ) = 8 (Proposition VI.2.3(c) with a = 2, b = 1).
- The row n = 8k+4 needs ρ: for F = ℚ(√7) and R = ℤ[√7, 1/2] (j = ρ = 1) the two-primary part of K_4(ℤ[√7]) is ℤ/2, generated by the image of {−1, −1, −1, √7} ∈ K^M_4(F) (Example VI.9.10.1), although H^2(R; ℤ_2(3)) = 0.
- For F = ℚ(√2) (j = 0, r_1 = 2), K_4(ℤ[√2]) has odd order and ρ = 0 (Example VI.9.9.2).
- K_n(O_S){2} = 0 for n ≡ 5 (mod 8), in agreement with Example VI.9.5.1.
- The odd rows agree with N.5/the-real-case-modulo-eight.

**Prerequisites.** `ArithmeticKTheory:N.6/signature-defect`, `ArithmeticKTheory:N.5/the-real-case-modulo-eight`, `ArithmeticKTheory:N.4/exceptional-fields-at-two`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `MotivicEtaleKTheory:M.7`, `MotivicEtaleKTheory:M.2`, `MotivicEtaleKTheory:M.3`, `StableHomotopyKTheory:H.6`

**Sources.**

- K-book, VI.9.11, Theorem 9.11, hypotheses (PDF p. 532; book p. 524). The hypotheses of Theorem 9.11 and the integer ρ with j ≤ ρ < r_1.

  > Theorem 9.11. Let F be a number field with at least one real embedding, and let R = OS denote a ring of integers in F containing 1/2. Let j be the signature defect of R, and write wi for w(2)i(F). Then there is an integer ρ, j ≤ ρ < r1, such that, for all n ≥ 2, the two-primary subgroup Kn(OS){2}

- K-book, VI.9.11, Theorem 9.11, the eight rows (PDF p. 532; book p. 524). The eight rows, which this node states with the twists.

  > H2et(R; Z2(4k + 1)) for n = 8k, Z/2 for n = 8k + 1, H2et(R; Z2(4k + 2)) for n = 8k + 2, (Z/2)r1−1 ⊕ Z/2w4k+2 for n = 8k + 3, (Z/2)ρ ⋊ H2et(R; Z2(4k + 3)) for n = 8k + 4, 0 for n = 8k + 5, H̃2et(R; Z2(4k + 4)) for n = 8k + 6, Z/w4k+4 for n = 8k + 7.

- K-book, VI.9, the sentence before Theorem 9.4 (PDF p. 526; book p. 518). The meaning of ⋊: an extension, not a product.

  > When n ≡ 5 (mod 8), we have an unknown group extension; to express it, we write A ⋊ B for an abelian group extension of B by A.

- K-book, VI.9.11, proof (PDF p. 532; book p. 524). The proof: the case n = 2 and the universal coefficient sequence for even n (proof steps 2 and 3).

  > When n = 2 it is III.6.9.3. To determine the two-primary subgroup Kn(OS){2} of the finite group K2i+2(OS) when n = 2i + 2, we use the universal coefficient sequence 0 → (Z/2∞)r → K2i+3(OS; Z/2∞) → K2i+2(OS){2} → 0,

- K-book, VI.9.11, end of the proof (PDF p. 533; book p. 525). Where ρ comes from (proof step 5).

  > By mod 2 periodicity 4.8.1, the integer ρ of 9.10 equals the rank of the image of H4(OS, Z/2(4)) ≅ H4(OS, Z/2(4k + 4)) ≅ (Z/2)r1 in Hom(Z/2, Kn(OS)), considered as a quotient of Kn+1(OS; Z/2).

- K-book, VI.9.10, Corollary 9.10 and the definition of ρ (PDF p. 531; book p. 523). The definition of ρ and its bounds.

  > Let ρ denote the rank of the image of the group KM4(F) ≅ (Z/2)r1 in K4(F). Corollary 9.10. Let F be a real number field. Then j(OF[1/2]) ≤ ρ ≤ r1 − 1.

- K-book, VI.9.10.1, Example 9.10.1, continued (PDF p. 532; book p. 524). The instance ρ = 1 for ℚ(√7) in the acceptance.

  > Hence the image of KM4(F) ≅ (Z/2)2 in K4(Z[√7]) is Z/2 on the symbol σ = {−1, −1, −1, √7}, and this is all of the 2-primary torsion in K4(Z[√7]) by 9.9.

- K-book, VI.9.9.2, Example 9.9.2, last paragraph (PDF p. 531; book p. 523). The instance ρ = 0 for ℚ(√2).

  > A useful example is F = Q(√2). Note that KM4(F) ≅ (Z/2)2 is generated by the Steinberg symbols {−1, −1, −1, −1} and {−1, −1, −1, 1 + √2}. Both symbols must vanish in K4(Z[√2]), since this group has odd order. This is the case j = 0, r1 = 2 of Corollary 9.10.

- K-book, VI.9.8, Corollary 9.8, the table (PDF p. 530; book p. 522). The table for ℤ used in the acceptance.

  > n (mod 8) 1 2 3 4 5 6 7 8 Kn(Z){2} Z/2 Z/2 Z/16 0 0 0 Z/16k 0

### The wild kernel, and its place inside the tame kernel

`ArithmeticKTheory:N.6/tame-and-wild-kernels` · *definition* · planet **Wild kernel**

Let F be a number field and i ≥ 1. The wild kernel WK_{2i}(F) is the intersection, over all places v of F, of the kernels of the maps K_{2i}(F) → K_{2i}(F_v) to the K-groups of the completions (the source's definition). It lies in the image of K_{2i}(O_F) and is therefore finite. In degree two it lies in the tame kernel, which is K2SymbolsBrauer T.5's unramified subgroup of K_2(F), identified there with K_2(O_F), and it equals the kernel of the norm-residue (Hilbert) symbols at the finite and real places, because K_2(F_v) is μ(F_v) plus a uniquely divisible group (Moore's theorem) and K_2(F) is torsion. The tame kernel is not redefined here. The two are distinct objects already for ℚ: the tame kernel is K_2(ℤ) ≅ ℤ/2, generated by {−1, −1}, while WK_2(ℚ) = 0.

**Hypotheses.**

- F is a number field; v runs over all places, the real ones included, as the source's 'all valuations v on F' and Weibel 2006, Definition 0.2 (where the real places contribute (ℤ/2)^{r_1} for i ≡ 1 mod 4) require.
- The completions F_v and the maps K_{2i}(F) → K_{2i}(F_v), with their compatibility with the localisation boundary and with restriction, are KTheoryFiniteLocalFields L.7's.
- Weibel 2006 defines the higher wild kernel through the maps K_{2i}(F) → K_{2i}(F_v) → H^2(F_v; μ^{⊗(i+1)}) ≅ μ^{⊗i}(F_v); the two definitions agree for i = 1 by Moore's theorem, and their agreement for i ≥ 2 is part of the recorded gap.

**Construction.**

1. Define WK_{2i}(F) as the infimum over places v of the kernels of the homomorphisms K_{2i}(F) → K_{2i}(F_v) (functoriality of K-theory along F → F_v; KTheoryFiniteLocalFields L.7).
2. Containment in K_{2i}(O_F): for a finite place v the boundary K_{2i}(F) → K_{2i−1}(k(v)) of N.2's localisation sequence factors through K_{2i}(F_v) (L.7), so WK_{2i}(F) lies in the kernel of the boundary, which is the image of K_{2i}(O_F) by N.5/soule-theorem; K_{2i}(O_F) is finite (N.3/finiteness-and-ranks-combined).
3. Degree two: each tame symbol factors through K_2(F_v), so WK_2(F) is contained in K2SymbolsBrauer T.5/unramified-subgroup, which T.5/tame-kernel-sequence identifies with K_2(O_F). K_2(F) is torsion (the tame-kernel sequence has finite kernel and torsion cokernel), and by Moore's theorem (KTheoryFiniteLocalFields L.3) the torsion of K_2(F_v) maps isomorphically to μ(F_v) under the Hilbert symbol (K2SymbolsBrauer T.7/classical-local-symbols), so WK_2(F) is the kernel of the Hilbert symbols.
4. Restriction along a finite extension E/F maps WK_{2i}(F) into WK_{2i}(E), because K_{2i}(F) → K_{2i}(E_w) factors through K_{2i}(F_v) for w over v.

**Acceptance.**

- WK_2(ℚ) = 0, while the tame kernel K_2(ℤ) ≅ ℤ/2 is generated by {−1, −1}, whose Hilbert symbols at 2 and at ∞ are −1.
- WK_{2i}(F) is a subgroup of the image of K_{2i}(O_F), hence finite.
- For F = ℚ(√−14), {−1, −1} is a nonzero element of WK_2(F) (Weibel 2006, Example 5.6, after Hutchinson), so the wild kernel can be nonzero.

**Prerequisites.** `KTheoryFiniteLocalFields:L.7`, `KTheoryFiniteLocalFields:L.3`, `K2SymbolsBrauer:T.5/unramified-subgroup`, `K2SymbolsBrauer:T.5/tame-kernel-sequence`, `K2SymbolsBrauer:T.7/classical-local-symbols`, `ArithmeticKTheory:N.5/soule-theorem`, `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`

**API.**

| name | role | statement |
| --- | --- | --- |
| `wildKernel` | data | For a number field F and i ≥ 1, ⨅ v, ker (K_{2i}(F) → K_{2i}(F_v)) as an AddSubgroup of K_{2i}(F). |
| `mem_wildKernel_iff` | characterisation | x ∈ wildKernel F i ↔ ∀ v, the image of x in K_{2i}(F_v) is 0. |
| `wildKernel_le_ker` | compatibility | wildKernel F i ≤ ker (K_{2i}(F) → K_{2i}(F_v)) for each place v. |
| `wildKernel_le_range` | relation | wildKernel F i ≤ range (K_{2i}(O_F) → K_{2i}(F)); in particular it is finite. |
| `wildKernel_two_le_unramifiedSubgroup` | relation | wildKernel F 1 ≤ K2SymbolsBrauer's unramifiedSubgroup of K_2(F) for the family of finite places (the tame kernel). |
| `wildKernel_two_eq_ker_hilbert` | characterisation | wildKernel F 1 = ker (K_2(F) → ⨁_{v finite or real} μ(F_v)), the kernel of the Hilbert symbols. |
| `wildKernel_restrict_le` | functoriality | For a finite extension E/F the restriction K_{2i}(F) → K_{2i}(E) maps wildKernel F i into wildKernel E i. |

**Used by.**

- *N.6's text* — 'Develop tame and wild kernels as distinct objects, and compare localisation to completions'
- *K2SymbolsBrauer T.5* — the tame kernel (unramified subgroup) is imported, not redefined
- *N.6/divisible-subgroup-and-the-wild-kernel* — the divisible subgroup is compared with it
- *N.8, the certified examples* — a computation of an even group states which of the two kernels it bounds

**Unit tests.**

- `wildKernel_two_rat` (computation) — wildKernel ℚ 1 = 0: it lies in K_2(ℤ) = {1, {−1, −1}}, and {−1, −1} maps to the nontrivial element of K_2(ℝ) under the real sign symbol (K2SymbolsBrauer T.5/real-sign-symbol).
- `wildKernel_ne_tameKernel_rat` (non-example) — The tame kernel of ℚ contains {−1, −1} and the wild kernel does not: a definition using only the tame symbols (the residue maps at the finite places) instead of the whole maps to K_2(ℚ_p) and K_2(ℝ) would give K_2(ℤ) ≅ ℤ/2, missing that the Hilbert symbols (−1, −1)_2 and (−1, −1)_∞ are −1.
- `wildKernel_two_gaussian` (degenerate) — wildKernel ℚ(i) 1 = 0, since it lies in K_2(ℤ[i]) = 1 (Tate, quoted in Example III.5.2.2).
- `wildKernel_two_hilbert` (compatibility) — For every number field, wildKernel F 1 is the kernel of the Hilbert symbols of K2SymbolsBrauer T.7/classical-local-symbols at the finite places together with the real sign symbols, the classical wild kernel of the Moore sequence.
- `wildKernel_two_Q_sqrt_neg14` (characterisation) — For F = ℚ(√−14), {−1, −1} ∈ wildKernel F 1 and {−1, −1} ≠ 1 (Weibel 2006, Example 5.6).

**Library.** module `TauCeti/NumberTheory/KTheory/WildKernel`, namespace `TauCeti.ArithmeticK`.

**Sources.**

- K-book, V.6.8.2, Wild Kernels 6.8.2 (PDF p. 421; book p. 413). The definition of the wild kernel as the intersection of the kernels of the maps to the completions; the identification with div K_{2i}(F) claimed in the same sentence is corrected in N.6/divisible-subgroup-and-the-wild-kernel.

  > In fact, divK2i(F) is isomorphic to the wild kernel, defined as the intersection (over all valuations v on F) of the kernels of all maps K2i(F) → K2i(Fv). This is proven in [225].

### Order certificates: a finite presentation with independent upper and lower bounds

`ArithmeticKTheory:N.6/order-certificate` · *definition*

For an abelian group A (a ℤ-module), an order certificate consists of: relations rel : Module.Relations ℤ with finitely many generators and relations and finite presented group rel.Quotient; a solution s : rel.Solution A whose values span A, so that s.fromQuotient : rel.Quotient → A is onto (the upper bound Nat.card A ≤ Nat.card rel.Quotient); and a lower bound, a surjective homomorphism φ : A → B onto a finite group B with Nat.card B = Nat.card rel.Quotient. Soundness: s is then a presentation (Mathlib's IsPresentation), A ≃ rel.Quotient and Nat.card A = Nat.card B. The two bounds are independent obligations: without the lower bound, or a complete kernel argument (IsPresentation itself), only the upper bound holds, and an upper bound with a surjective presentation is never reported as an isomorphism. This is the certificate engine of N.6's text ('supply a finite presentation, verify relations and surjectivity, and certify the kernel/order through cohomology or a second independently proved bound'); the lower bound may come from symbols (the real sign, tame or Hilbert symbols), from cohomology (N.6/certificate-driven-computation) or from another proved order statement, but never from a formula for which the certified group is to serve as the independent test (RT-AREA-ktheory-1/9, /11). The format moves here from K2SymbolsBrauer T.5/certified-presentation, whose competing certificate obligation T.5 drops.

**Hypotheses.**

- A is an abelian group; the intended instances are tame kernels K_2(O_F), the K_2 of rings of S-integers and the finite even K-groups K_{2i}(O_S).
- Generation (span) and the lower bound are separate fields carried with their proofs; neither may be inferred from the other or from a numerical coincidence.

**Construction.**

1. Define the certificate as a structure on top of Mathlib's Module.Relations and Module.Relations.Solution; do not introduce a second presentation type.
2. Upper bound: surjectivity of s.fromQuotient from the span condition (mathlib:Module.Relations.Solution.surjective_π_iff_span_eq_top and mathlib:Module.Relations.Solution.surjective_fromQuotient_iff_surjective_π).
3. Soundness: the composite rel.Quotient → A → B is a surjection between finite sets of equal cardinality, hence bijective (mathlib:Function.Surjective.bijective_of_nat_card_le), so s.fromQuotient is injective and s is a presentation.
4. Package a certificate as a Mathlib Module.Presentation ℤ A (mathlib:Module.Presentation.ofIsPresentation), and a complete kernel argument (IsPresentation with finite quotient) as a certificate with B = A and φ = id.

**Acceptance.**

- A certificate without its lower bound gives Nat.card A ≤ Nat.card rel.Quotient and nothing more.
- K_2(ℤ): one generator {−1, −1}, the relation 2g = 0, span by Milnor's bound and lower bound the real sign symbol onto ℤˣ (both K2SymbolsBrauer T.5's) — the model instance, used by N.8.
- For a tame kernel with a claimed order the certificate carries both bounds, which is N.6's and N.8's acceptance condition.

**Prerequisites.** `mathlib:Module.Relations`, `mathlib:Module.Relations.Solution`, `mathlib:Module.Relations.Quotient`, `mathlib:Module.Relations.Solution.fromQuotient`, `mathlib:Module.Relations.Solution.surjective_fromQuotient_iff_surjective_π`, `mathlib:Module.Relations.Solution.surjective_π_iff_span_eq_top`, `mathlib:Module.Relations.Solution.IsPresentation`, `mathlib:Module.Presentation`, `mathlib:Module.Presentation.ofIsPresentation`, `mathlib:Function.Surjective.bijective_of_nat_card_le`

**API.**

| name | role | statement |
| --- | --- | --- |
| `OrderCertificate` | structure | For an abelian group A: rel : Module.Relations ℤ with Finite rel.G and Finite rel.R, s : rel.Solution A with span_eq_top, a finite group B in the universe of A with a surjective φ : A →+ B, and card_quotient_eq : Nat.card B = Nat.card rel.Quotient with rel.Quotient finite. |
| `OrderCertificate.fromQuotient_surjective` | projection | The upper bound: s.fromQuotient is surjective, so Nat.card A ≤ Nat.card rel.Quotient. |
| `OrderCertificate.isPresentation` | characterisation | Soundness: s.IsPresentation. |
| `OrderCertificate.toPresentation` | compatibility | The Mathlib Module.Presentation ℤ A with relations rel and solution s. |
| `OrderCertificate.card_eq` | simp | Nat.card A = Nat.card B = Nat.card rel.Quotient. |
| `OrderCertificate.linearEquiv` | equivalence | rel.Quotient ≃ₗ[ℤ] A, from IsPresentation.linearEquiv. |
| `OrderCertificate.ofIsPresentation` | constructor | A complete kernel argument (s.IsPresentation with rel.Quotient finite) gives a certificate with B = A and φ = id. |

**Used by.**

- *N.6's text* — 'Construct certificate-driven computations: supply a finite presentation, verify relations and surjectivity, and certify the kernel/order through cohomology or a second independently proved bound'
- *N.6/certificate-driven-computation* — the cohomological lower bound completes a certificate of this format
- *ArithmeticKTheory N.8, the certified examples* — K₂(ℤ[i]) = 0 and the real quadratic tame kernel are certificates of this format, exported to SpecialValuesBirchTate B.3
- *K2SymbolsBrauer T.5/k2-of-the-integers* — its proof of K₂(ℤ) ≅ ℤ/2 (Milnor's bound and the sign symbol) is the model instance; T.5 is upstream of N.6 and does not import the format

**Unit tests.**

- `orderCertificate_k2_int` (computation) — For K_2(ℤ): one generator g ↦ {−1, −1}, one relation 2g = 0, span from Milnor's bound (K2SymbolsBrauer T.5's recorded gap), lower bound the real sign symbol onto ℤˣ; the certificate gives K_2(ℤ) ≃ ℤ/2.
- `orderCertificate_trivial` (degenerate) — No generators and no relations certify the trivial group: rel.Quotient = 0, span_eq_top forces A = 0 (for instance K_2(𝔽_q)), and B = 0.
- `upper_bound_not_iso` (non-example) — One generator with the relation 4g = 0, sent to the generator of ℤ/2, spans and satisfies the relation, but ℤ/4 → ℤ/2 is not injective, and no surjection from ℤ/2 onto a group of order 4 exists: the certificate cannot be completed.
- `orderCertificate_isPresentation` (characterisation) — From any certificate, Mathlib's predicate s.IsPresentation holds, so A ≃ rel.Quotient.
- `orderCertificate_toPresentation` (compatibility) — toPresentation.toRelations = rel and toPresentation.toSolution = s.

**Library.** module `TauCeti/Algebra/Module/OrderCertificate`, namespace `TauCeti`.

**Sources.**

- K-book, III.5.2.2, Example 5.2.2 (PDF p. 226; book p. 218). The model upper bound: the order-two statement comes from a computation in the Steinberg group, which the source cites.

  > Example 5.2.2. The group K2(Z) is cyclic of order 2. This calculation uses the Euclidean algorithm to rewrite elements of St(Z), and is given in §10 of Milnor [131].

- K-book, III.6.2.1, Example 6.2.1 (PDF p. 240; book p. 232). The model lower bound: a surjection onto a group of known order.

  > The resulting map K2(R) →{±1} is onto because (−1, −1)∞= −1.

### The cohomological lower bound for order certificates of even K-groups, in every even degree

`ArithmeticKTheory:N.6/certificate-driven-computation` · *construction*

Let F be a number field, O_S a ring of S-integers and i ≥ 1, so that A = K_{2i}(O_S) is finite. Given the upper half of an order certificate for A (a finite presentation with span, N.6/order-certificate), a finite set L of primes containing every prime factor of the order of the presented group, and for each ℓ ∈ L a certified value h_ℓ of #K_{2i}(O_S){ℓ} computed from cohomology — h_ℓ = #H²_et(O_S[1/ℓ]; ℤ_ℓ(i+1)) when ℓ is odd, or ℓ = 2 and F is totally imaginary (N.6/even-groups-at-odd-primes); and, for ℓ = 2 and r_1 > 0 with R = O_S[1/2], h_2 = #H²_et(R; ℤ_2(i+1)) for 2i ≡ 0, 2 (mod 8), #H̃²_et(R; ℤ_2(i+1)) for 2i ≡ 6 (mod 8), and 2^ρ · #H²_et(R; ℤ_2(4k+3)) for 2i = 8k + 4, with ρ a separately certified input, j(R) ≤ ρ ≤ r_1 − 1 (N.6/the-two-primary-corrections) — with ∏_{ℓ∈L} h_ℓ equal to that order, the projection φ : K_{2i}(O_S) → ⊕_{ℓ∈L} K_{2i}(O_S){ℓ} is onto a group of order ∏ h_ℓ and completes the certificate. So the cohomological order computation is available in every even degree; in degree 8k + 4 with real places it needs ρ, which neither r_1 nor j determines. A zeta value is never an input: Theorems VI.8.7 and VI.8.8 enter only through a proved theorem supplying the order, and a match of orders between an unproved formula and a presentation certifies nothing.

**Hypotheses.**

- F is a number field, O_S a ring of S-integers and i ≥ 1; K_{2i}(O_S) is finite (N.3:ranks/even-K-groups-of-S-integers-are-finite).
- The format, with its upper-bound half (presentation, relations, span), is N.6/order-certificate; this node supplies a lower bound from cohomology.
- The cohomology orders h_ℓ, and ρ in degree 8k + 4, are inputs to be certified (by the class-group and unit data of N.6/l-rank-from-class-group-data and the Brauer group, or otherwise); the construction does not compute them.

**Construction.**

1. Import OrderCertificate from N.6/order-certificate, with its soundness lemma and its packaging as mathlib:Module.Presentation.
2. For ℓ ∈ L the projection of the finite group K_{2i}(O_S) onto its ℓ-primary component is surjective; N.6/even-groups-at-odd-primes (or N.6/the-two-primary-corrections at ℓ = 2 with real places) gives its order h_ℓ: H² or H̃² in the rows 2i ≡ 0, 2, 6 (mod 8), and 2^ρ · #H²(R; ℤ_2(4k+3)) in the row 2i = 8k + 4, the extension of H² by (ℤ/2)^ρ having that order whatever its class.
3. The presented group surjects onto K_{2i}(O_S), which surjects onto B = ⊕_{ℓ∈L} K_{2i}(O_S){ℓ} of order ∏ h_ℓ; equality with the presented order fills the lower-bound field, and soundness makes both maps bijective.
4. Record why ρ is an input in degree 8k + 4: Theorem VI.9.11 determines only j ≤ ρ ≤ r_1 − 1, and ρ is 0 for ℚ(√2) and 1 for ℚ(√7) with the same r_1 = 2.

**Acceptance.**

- The certificate for K_2(ℤ) (one generator {−1, −1}, relation 2g = 0) is completed equally by the real sign symbol and by the cohomological bound with L = {2}, h_2 = #H²(ℤ[1/2]; ℤ_2(2)) = 2 (degree 2 ≡ 2 mod 8, Theorem VI.9.11); both give order 2.
- Without the lower bound only Nat.card K_{2i}(O_S) ≤ Nat.card of the presented group follows.
- For ℚ(√7), 2i = 4: h_2 = 2^ρ · #H²(ℤ[√7, 1/2]; ℤ_2(3)) = 2 · 1 with ρ = 1 (Example VI.9.10.1); taking h_2 = #H² alone would undercount by 2^ρ.
- A zeta value alone certifies nothing: ζ(−1) = −1/12 gives |K_2(ℤ)| = 2 only through the proved Theorem VI.8.8 for abelian fields (for ℚ, k = 1: −1/12 = −2 · |K_2(ℤ)|/|K_3(ℤ)| with |K_3(ℤ)| = 48).

**Prerequisites.** `ArithmeticKTheory:N.6/order-certificate`, `ArithmeticKTheory:N.6/even-groups-at-odd-primes`, `ArithmeticKTheory:N.6/the-two-primary-corrections`, `ArithmeticKTheory:N.6/signature-defect`, `ArithmeticKTheory:N.3:ranks/even-K-groups-of-S-integers-are-finite`, `mathlib:Module.Relations`, `mathlib:Module.Presentation`

**API.**

| name | role | statement |
| --- | --- | --- |
| `OrderCertificate.ofCohomology` | constructor | For a presentation of K_{2i}(O_S) with span, a finite set L of primes containing the prime factors of its order, and certified orders h_ℓ of the ℓ-primary parts computed from cohomology with ∏_{ℓ∈L} h_ℓ equal to that order, the OrderCertificate (N.6/order-certificate) whose lower bound is the projection onto ⊕_{ℓ∈L} K_{2i}(O_S){ℓ}. |
| `evenK_toPrimaryCohomology_surjective` | projection | K_{2i}(O_S) → ⊕_{ℓ∈L} K_{2i}(O_S){ℓ}, the ℓ-primary projections, is surjective, and for ℓ odd (or F totally imaginary) its ℓ-component is identified with H²_et(O_S[1/ℓ]; ℤ_ℓ(i+1)) by N.6/even-groups-at-odd-primes. |
| `OrderCertificate.ofCohomology_card` | simp | Nat.card K_{2i}(O_S) = ∏_{ℓ∈L} h_ℓ. |
| `OrderCertificate.ofCohomology_two_real` | constructor | For F with a real embedding and 2 ∈ L: the two-primary factor is h_2 = #H²_et(R; ℤ_2(i+1)) for 2i ≡ 0, 2 (mod 8), #H̃²_et(R; ℤ_2(i+1)) for 2i ≡ 6 (mod 8), and 2^ρ · #H²_et(R; ℤ_2(4k+3)) for 2i = 8k + 4 with ρ a certified input (N.6/the-two-primary-corrections). |
| `OrderCertificate.ofCohomology_toPresentation` | compatibility | The Mathlib Module.Presentation of the resulting certificate has the given relations and solution (OrderCertificate.toPresentation of N.6/order-certificate). |

**Used by.**

- *N.6's text* — 'certify the kernel/order through cohomology or a second independently proved bound. This is a reusable calculation method, not an oracle defining the group order from a zeta value'
- *N.6/order-certificate* — the format, now owned by N.6 (RT-AREA-ktheory-1/9); K2SymbolsBrauer T.5 drops its competing certificate obligation
- *N.8, the certified examples* — its even-group and tame-kernel certificates are built with this lower bound or with symbol bounds, and exported to SpecialValuesBirchTate B.3
- *SpecialValuesBirchTate* — a proved zeta-value theorem may supply a second lower bound in the same format

**Unit tests.**

- `ofCohomology_K2_int` (compatibility) — For K_2(ℤ) the cohomological certificate (L = {2}, h_2 = 2) and the sign-symbol certificate (N.6/order-certificate's test orderCertificate_k2_int) give the same Nat.card = 2.
- `ofCohomology_trivial` (degenerate) — The empty presentation with L = ∅ (empty product 1) certifies K_{2i}(O_S) = 0.
- `ofCohomology_missing_prime` (non-example) — For K_2(ℤ) with L = ∅ the product is 1 ≠ 2, the order of the presented group ⟨g | 2g⟩, so no certificate is produced: every prime factor of the presented order must be in L.
- `ofCohomology_two_row_four` (characterisation) — For F = ℚ(√7), R = ℤ[√7, 1/2] and 2i = 4, the two-primary part of K_4(ℤ[√7]) is ℤ/2 while H²(R; ℤ_2(3)) = 0 (Example VI.9.10.1, ρ = 1): ofCohomology_two_real with ρ = 1 gives h_2 = 2, while a variant using #H²(R; ℤ_2(3)) alone would give 1 and undercount by 2^ρ.
- `ofCohomology_isPresentation` (characterisation) — The certificate produced satisfies Mathlib's IsPresentation, so K_{2i}(O_S) is isomorphic to the presented group.

**Sources.**

- K-book, VI.8.2, Theorem 8.2, the even row (PDF p. 521; book p. 513). The isomorphism K_{2i}(O_S){ℓ} ≅ H^2_et(O_S[1/ℓ]; ℤ_ℓ(i+1)) that supplies the lower bound.

  > Theorem 8.2. Let F be a number field, and let OS be a ring of integers in F. Fix a prime ℓ; if ℓ = 2 we suppose F totally imaginary. Then for all n ≥ 2: Kn(OS)(ℓ) ≅ H2et(OS[1/ℓ]; Zℓ(i + 1)) for n = 2i > 0;

- K-book, VI.9.11, Theorem 9.11, the eight rows (PDF p. 532; book p. 524). The two-primary rows usable at ℓ = 2 with real places, and the row n = 8k + 4 that is not.

  > H2et(R; Z2(4k + 1)) for n = 8k, Z/2 for n = 8k + 1, H2et(R; Z2(4k + 2)) for n = 8k + 2, (Z/2)r1−1 ⊕ Z/2w4k+2 for n = 8k + 3, (Z/2)ρ ⋊ H2et(R; Z2(4k + 3)) for n = 8k + 4, 0 for n = 8k + 5, H̃2et(R; Z2(4k + 4)) for n = 8k + 6, Z/w4k+4 for n = 8k + 7.

- K-book, VI.8.7, Theorem 8.7 (PDF p. 523; book p. 515). Wiles's theorem relating zeta values to orders of étale cohomology (denominator |H^1| elided), admissible only as a proved bound.

  > Theorem 8.7. (Wiles) Let F be a totally real number field. If ℓ is odd and OS = OF[1/ℓ], then for all even integers 2k > 0 there is a rational number uk, prime to ℓ, such that: ζF(1 − 2k) = uk |H2et(OS, Zℓ(2k)| ... |H1et(OS, Zℓ(2k)|.

- K-book, VI.8.8, Theorem 8.8 (PDF p. 523; book p. 515). Theorem 8.8 relating ζ_F(1 − 2k) to |K_{4k−2}(O_F)|/|K_{4k−1}(O_F)| for abelian F (denominator elided), admissible only as a proved bound.

  > Theorem 8.8. If F is totally real, and Gal(F/Q) is abelian, then for all k ≥ 1: ζF(1 − 2k) = (−1)kr1 2r1 |K4k−2(OF)| ... |K4k−1(OF)|.

### The even K-groups of a totally imaginary field (Theorem VI.8.4, even row)

`ArithmeticKTheory:N.6/even-groups-of-a-totally-imaginary-field` · *theorem*

Let F be a totally imaginary number field and O_S the ring of S-integers for a finite set S of finite places. For every i ≥ 1, K_{2i}(O_S) ≅ ⊕_ℓ H^2_et(O_S[1/ℓ]; ℤ_ℓ(i+1)), the sum over all primes ℓ, a finite group with only finitely many nonzero summands.

**Hypotheses.**

- F is totally imaginary, so N.6/even-groups-at-odd-primes applies at every prime including ℓ = 2.
- i ≥ 1.

**Proof outline.**

1. K_{2i}(O_S) is finite (N.3/finiteness-and-ranks-combined), hence the direct sum of its ℓ-primary parts, only finitely many of them nonzero.
2. For every ℓ the ℓ-primary part is H^2_et(O_S[1/ℓ]; ℤ_ℓ(i+1)) by N.6/even-groups-at-odd-primes.

**Acceptance.**

- F = ℚ(i): K_{2i}(ℤ[i]) has odd order for every i ≥ 1, since H^2(ℤ[1/2, i]; μ_4) = 0 forces H^2(ℤ[1/2, i]; ℤ_2(i+1)) = 0 (Exercise VI.8.4).
- The formula fails for fields with a real embedding at ℓ = 2 (N.6/the-two-primary-corrections).

**Prerequisites.** `ArithmeticKTheory:N.6/even-groups-at-odd-primes`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `mathlib:NumberField.IsTotallyComplex`

**Sources.**

- K-book, VI.8.4, Theorem 8.4 (PDF p. 522; book p. 514). Theorem 8.4; this node states its row n = 2i ≥ 2.

  > Theorem 8.4. Let F be a totally imaginary number field, and let OS be the ring of S-integers in F for some set S of finite places. Then: Kn(OS) ≅ Z ⊕ Pic(OS), for n = 0; Zr2+|S|−1 ⊕ Z/w1(F), for n = 1; ⊕ℓH2et(OS[1/ℓ]; Zℓ(i + 1)) for n = 2i ≥ 2; Zr2 ⊕ Z/wi(F) for n = 2i − 1 ≥ 3.

- K-book, VI, Exercise 8.4 (PDF p. 524; book p. 516). The instance for ℤ[i] used in the acceptance.

  > 8.4. It is well known that Z[i] is a principal ideal domain. Show that the finite group Kn(Z[i]) has odd order for all even n > 0. Hint: Show that H2et(Z[½, i], µ4) = 0.

### The even K-groups modulo ℓ (Corollary VI.8.3)

`ArithmeticKTheory:N.6/even-groups-modulo-l` · *theorem*

Let F be a number field, O_S a ring of S-integers in F and i > 0. For every odd prime ℓ, K_{2i}(O_S)/ℓ ≅ H^2_et(O_S[1/ℓ]; μ_ℓ^{⊗(i+1)}); the same holds for ℓ = 2 when F is totally imaginary.

**Hypotheses.**

- ℓ odd, or ℓ = 2 and F totally imaginary; the cohomological dimension of O_S[1/ℓ] is then two.
- i > 0.

**Proof outline.**

1. K_{2i}(O_S) is finite, so K_{2i}(O_S)/ℓ = K_{2i}(O_S){ℓ}/ℓ ≅ H^2(R; ℤ_ℓ(i+1))/ℓ with R = O_S[1/ℓ] (N.6/even-groups-at-odd-primes).
2. The coefficient sequence 0 → ℤ_ℓ(i+1) → ℤ_ℓ(i+1) → μ_ℓ^{⊗(i+1)} → 0 (multiplication by ℓ; MotivicEtaleKTheory M.1) and H^3(R; ℤ_ℓ(i+1)) = 0 (cohomological dimension two; MotivicEtaleKTheory M.2) give H^2(R; ℤ_ℓ(i+1))/ℓ ≅ H^2(R; μ_ℓ^{⊗(i+1)}).

**Acceptance.**

- The hypothesis at 2 cannot be dropped: for F = ℚ and i = 3, K_6(ℤ)/2 = 0 (Corollary VI.9.8), while H^2(ℤ[1/2]; μ_2) ≅ ℤ/2 (Pic(ℤ[1/2]) = 0 and the two-torsion of Br(ℤ[1/2]) ≅ ℤ/2, from (8.1.1) with S = {2}).
- F = ℚ(i), ℓ = 2: K_{2i}(ℤ[i])/2 = 0 corresponds to H^2(ℤ[1/2, i]; μ_2) = 0, the vanishing behind Exercise VI.8.4.

**Prerequisites.** `ArithmeticKTheory:N.6/even-groups-at-odd-primes`, `MotivicEtaleKTheory:M.1`, `MotivicEtaleKTheory:M.2`

**Sources.**

- K-book, VI.8.3, Corollary 8.3 with its proof (PDF p. 522; book p. 514). Corollary 8.3 with its one-line proof, which this node states and expands.

  > Corollary 8.3. For all odd ℓ and i > 0, K2i(OS)/ℓ ≅ H2et(OS[1/ℓ], µ⊗i+1ℓ). The same formula holds for ℓ = 2 if F is totally imaginary. Proof. Immediate from 8.2 since H2et(R, Zℓ(i + 1))/ℓ ≅ H2et(R, µ⊗i+1ℓ).

- K-book, VI.9.8, Corollary 9.8, the table (PDF p. 530; book p. 522). K_6(ℤ) has no two-primary torsion, used in the non-example.

  > n (mod 8) 1 2 3 4 5 6 7 8 Kn(Z){2} Z/2 Z/2 Z/16 0 0 0 Z/16k 0

- K-book, VI.8.1, the sequence (8.1.1) (PDF p. 521; book p. 513). The Brauer group of O_S, used in the non-example with S = {2}.

  > The Brauer group of OS is determined by the sequence 0 → Br(OS) → (Z/2)r1 ⊕ ∐v∈S finite (Q/Z) add −→ Q/Z → 0.

### The ℓ-rank of the even K-groups from class-group data (Example VI.8.3.1)

`ArithmeticKTheory:N.6/l-rank-from-class-group-data` · *application*

Let ℓ be an odd prime, F a number field containing a primitive ℓ-th root of unity, S the set of primes of O_F over ℓ, and t the 𝔽_ℓ-rank of Pic(O_S)/ℓ. Then H^2_et(O_S; μ_ℓ) has 𝔽_ℓ-rank t + |S| − 1; hence for every i ≥ 1, K_{2i}(O_S)/ℓ has rank t + |S| − 1, and the ℓ-primary subgroup of the finite group K_{2i}(O_F) is a direct sum of exactly t + |S| − 1 nonzero cyclic groups.

**Hypotheses.**

- ℓ is odd and ζ_ℓ ∈ F, so F is totally imaginary (r_1 = 0).
- S is the set of primes over ℓ, which is non-empty, as (8.1.1) requires.

**Proof outline.**

1. Kummer sequence on O_S (1/ℓ ∈ O_S): 0 → Pic(O_S)/ℓ → H^2(O_S; μ_ℓ) → ℓBr(O_S) → 0 (MotivicEtaleKTheory M.1); Pic(O_S) is the class group of O_S (mathlib:ClassGroup, with tauceti:IsDedekindDomain.integerClassGroupEquiv).
2. By (8.1.1) with r_1 = 0 and S non-empty, ℓBr(O_S) ≅ ker((ℤ/ℓ)^{|S|} → ℤ/ℓ) has rank |S| − 1 (class field theory, MotivicEtaleKTheory M.2).
3. Since ζ_ℓ ∈ F, μ_ℓ^{⊗i} ≅ ℤ/ℓ as Galois modules over O_S (the trivialisation K2SymbolsBrauer T.7/twisted-roots-of-unity), so H^2(O_S; μ_ℓ^{⊗(i+1)}) ≅ H^2(O_S; μ_ℓ) ⊗ μ_ℓ^{⊗i} has the same rank; N.6/even-groups-modulo-l gives the rank of K_{2i}(O_S)/ℓ.
4. By N.5/soule-theorem, 0 → K_{2i}(O_F) → K_{2i}(O_S) → ⊕_{𝔭∈S} K_{2i−1}(k(𝔭)) → 0, and the right-hand term has order prime to ℓ (KTheoryFiniteLocalFields L.1), so the ℓ-primary parts of K_{2i}(O_F) and K_{2i}(O_S) agree; a finite ℓ-group whose quotient by ℓ has rank r is a sum of r nonzero cyclic groups.

**Acceptance.**

- Regular primes (Example VI.8.3.2): F = ℚ(ζ_ℓ), S = {(1 − ζ_ℓ)}, t = 0, so K_{2i}(ℤ[ζ_ℓ]) has no ℓ-torsion for all i ≥ 1.
- ℓ = 37, which is irregular (Example VI.2.4.1): 37 divides the class number of ℚ(ζ_37) and (1 − ζ_37) is principal, so t ≥ 1 and |S| = 1, and K_{2i}(ℤ[ζ_37]) has nonzero 37-torsion for every i ≥ 1.

**Prerequisites.** `ArithmeticKTheory:N.6/even-groups-modulo-l`, `ArithmeticKTheory:N.5/soule-theorem`, `KTheoryFiniteLocalFields:L.1`, `MotivicEtaleKTheory:M.1`, `MotivicEtaleKTheory:M.2`, `K2SymbolsBrauer:T.7/twisted-roots-of-unity`, `mathlib:ClassGroup`, `tauceti:IsDedekindDomain.integerClassGroupEquiv`

**Sources.**

- K-book, VI.8.3.1, Example 8.3.1 (PDF p. 522; book p. 514). The rank of H^2(O_S, μ_ℓ) from the class group and |S|.

  > Example 8.3.1. Let F be a number field containing a primitive ℓth root of unity, ℓ ≠ 2, and let S be the set of primes over ℓ in OF. If t is the rank of Pic(OS)/ℓ, then H2et(OS, µℓ) has rank t + |S| − 1 by (8.1.1).

- K-book, VI.8.3.1, Example 8.3.1, conclusion (PDF p. 522; book p. 514). The consequence for K_{2i}(O_F).

  > Hence the ℓ-primary subgroup of the finite group K2i(OF) has t + |S| − 1 nonzero summands for each i ≥ 1.

- K-book, VI.8.1, the sequence (8.1.1) (PDF p. 521; book p. 513). The Brauer group sequence used in proof step 2 (valid here because S is non-empty; see sourceIssues).

  > The Brauer group of OS is determined by the sequence 0 → Br(OS) → (Z/2)r1 ⊕ ∐v∈S finite (Q/Z) add −→ Q/Z → 0.

- K-book, VI.8.3.2, Example 8.3.2 (PDF p. 522; book p. 514). The regular-prime instance.

  > Example 8.3.2. If ℓ ≠ 2 is a regular prime (see 2.4.1), we claim that K2i(Z[ζℓ]) has no ℓ-torsion.

### The signature defect of a ring of S-integers (Definition VI.9.6.1)

`ArithmeticKTheory:N.6/signature-defect` · *definition* · planet **Signature defect**

Let F be a number field with r_1 real places and R = O_S a ring of S-integers in F. The signature defect j(R) is r_1 − dim_{𝔽_2} sign(F⟮S, 2⟯), the codimension in (ℤ/2)^{r_1} of the signs of the Selmer group F⟮S, 2⟯ of classes x·F^{×2} with even valuation at every prime not in S (Mathlib's IsDedekindDomain.selmerGroup; the sign map is Tau Ceti's signHom on representatives). When 1/2 ∈ R, Kummer theory identifies F⟮S, 2⟯ with H^1_et(R; μ_2) = H^1_et(R; ℤ/2) and the sign map with the restriction α^1 : H^1_et(R; ℤ/2) → ⊕_{σ real} H^1(ℝ; ℤ/2) ≅ (ℤ/2)^{r_1}, so j(R) is the 𝔽_2-dimension of the cokernel of α^1: Definition VI.9.6.1, in the setting of Theorem VI.9.11. Without 1/2 ∈ R the étale form differs: for R = ℤ, H^1_et(ℤ; ℤ/2) = 0 and its cokernel has dimension 1 = r_1, while j(ℤ) = 0. Equivalently j(R) = u − t, where t and u are the 𝔽_2-dimensions of Pic(R)/2 and of the narrow Picard group Pic^+(R)/2.

**Hypotheses.**

- F is a number field; for r_1 = 0 the target is zero and j(R) = 0.
- R = O_S; the étale description of j(R) needs 1/2 ∈ R, which is the case Theorem VI.9.11 uses; the Selmer form defines j(R) for every S, and it is the form under which the API below holds.

**Construction.**

1. Define j(R) as finrank_{ZMod 2} of the cokernel of α^1, with H^1_et(R; ℤ/2) and the real-place maps imported from MotivicEtaleKTheory M.1 and M.2.
2. Bounds: the class of −1 maps to (1, …, 1) ≠ 0 when r_1 > 0, so the image is nonzero and 0 ≤ j(R) < r_1.
3. Monotonicity: for S ⊆ S' the Selmer group grows, so j(O_{S'}) ≤ j(O_S); and since the sign map F^× → (ℤ/2)^{r_1} is onto (tauceti:NumberField.fieldUnitSignature_surjective), j(O_S) = 0 for S large (the source's j(F) = 0).
4. Kummer description for 1/2 ∈ R: H^1_et(R; μ_2) ≅ F⟮S, 2⟯ and α^1 is the sign map (MotivicEtaleKTheory M.1; mathlib:IsDedekindDomain.selmerGroup; tauceti:TauCeti.GlobalNumberFields.signHom).
5. Narrow-Picard description: the exact sequence (9.6.2) 0 → H̃^1(R; ℤ/2) → H^1(R; ℤ/2) → (ℤ/2)^{r_1} → Pic^+(R)/2 → Pic(R)/2 → 0 (source Ex. VI.9.3) gives u = t + j(R); for R = O_F compare with Tau Ceti's narrow class group.

**Acceptance.**

- j(ℤ[1/2]) = 0 (proof of Corollary VI.9.8).
- F = ℚ(√7), R = ℤ[√7, 1/2]: j(R) = 1 (Example VI.9.10.1).
- 0 ≤ j(R) < r_1 when r_1 > 0.

**Prerequisites.** `MotivicEtaleKTheory:M.1`, `MotivicEtaleKTheory:M.2`, `mathlib:IsDedekindDomain.selmerGroup`, `mathlib:Set.integer`, `mathlib:NumberField.InfinitePlace.nrRealPlaces`, `tauceti:TauCeti.GlobalNumberFields.signHom`, `tauceti:NumberField.fieldUnitSignature_surjective`, `tauceti:NumberField.NarrowClassGroup.twoRank`, `tauceti:TauCeti.ClassGroup.twoRank`

**API.**

| name | role | statement |
| --- | --- | --- |
| `signatureDefect` | data | For R = O_S in a number field F, the 𝔽_2-dimension of the cokernel of the sign map F⟮S, 2⟯ → ({σ : real places} → ℤˣ). |
| `signatureDefect_eq_sub_finrank_selmer` | characterisation | signatureDefect R = nrRealPlaces F − finrank (ZMod 2) (sign '' F⟮S, 2⟯); when 1/2 ∈ R this is the dimension of the cokernel of α^1 on H^1_et(R; ℤ/2), by Kummer theory (MotivicEtaleKTheory M.1). |
| `signatureDefect_lt_nrRealPlaces` | relation | If 0 < nrRealPlaces F then signatureDefect R < nrRealPlaces F. |
| `signatureDefect_antitone` | functoriality | S ⊆ S' → signatureDefect (O_{S'}) ≤ signatureDefect (O_S). |
| `signatureDefect_eventually_eq_zero` | relation | There is a finite S₀ with signatureDefect (O_S) = 0 for every S ⊇ S₀. |
| `add_signatureDefect_eq` | characterisation | dim (Pic(R)/2) + signatureDefect R = dim (Pic^+(R)/2). |
| `signatureDefect_ringOfIntegers` | compatibility | signatureDefect (𝓞 F) = NumberField.NarrowClassGroup.twoRank F − TauCeti.ClassGroup.twoRank (𝓞 F). |
| `signatureDefect_of_isTotallyComplex` | simp | If F is totally complex then signatureDefect R = 0. |

**Used by.**

- *Theorem VI.9.11* — j is the lower bound for the integer ρ of the two-primary table
- *Corollary VI.9.9* — the 2-ranks j + s + t − 1 of K_n(O_S) for n ≡ 4, 6 (mod 8)
- *Corollary VI.9.10* — j(O_F[1/2]) ≤ ρ ≤ r_1 − 1

**Unit tests.**

- `signatureDefect_int_half` (computation) — signatureDefect ℤ[1/2] = 0: the class of −1 has sign −1 at the unique real place.
- `signatureDefect_sqrt7_half` (computation) — For F = ℚ(√7) and R = ℤ[√7, 1/2] (class number one), F⟮S, 2⟯ is spanned by −1, the totally positive fundamental unit 8 + 3√7 and the totally positive generator 3 + √7 of the prime over 2; their sign patterns span a line in (ℤ/2)^2, so signatureDefect R = 1.
- `signatureDefect_sqrt7_fourteen` (computation) — For F = ℚ(√7) and R = ℤ[√7, 1/14], the element √7 has signs (+, −), so the signs span (ℤ/2)^2 and signatureDefect R = 0: the defect drops as S grows.
- `signatureDefect_ringOfIntegers_sqrt7` (compatibility) — For F = ℚ(√7): the class group is trivial and the narrow class group has order 2 (the fundamental unit has norm +1), so NarrowClassGroup.twoRank F − ClassGroup.twoRank (𝓞 F) = 1 − 0 = 1 = signatureDefect ℤ[√7], agreeing with j = 1 for O_F in Example VI.9.9.1 (p = 7).
- `signatureDefect_not_unit_sign_codim` (non-example) — The defect is not r_1 minus the rank of the signs of the units: for F = ℚ(√34) and R = O_F[1/2] the units ±1, the totally positive fundamental unit 35 + 6√34 and the totally positive generator 6 + √34 of the prime over 2 have signs (−,−) or (+,+), but x = 5 + √34 (norm −9, (x) = 𝔭_3^2 with 𝔭_3 non-principal since a^2 − 34b^2 = ±3 has no solution modulo 17) lies in F⟮S, 2⟯ with signs (+,−); so signatureDefect R = 0 while the unit-only formula gives 1.
- `signatureDefect_totallyComplex` (degenerate) — For F = ℚ(i) the target of α^1 is zero and signatureDefect R = 0 for every S.

**Library.** module `TauCeti/NumberTheory/NumberField/SignatureDefect`, namespace `TauCeti.ArithmeticK`.

**Sources.**

- K-book, VI.9.6.1, Definition 9.6.1 (PDF p. 528; book p. 520). The definition, its bounds and monotonicity.

  > Definition 9.6.1. The signature defect j(R) of R is defined to be the dimension of the cokernel of α1. Since the sign of −1 nontrivial, we have 0 ≤ j(R) < r1. Note that j(F) = 0, and that j(OS) ≤ j(OF) for all S.

- K-book, VI.9.6, before (9.6) (PDF p. 528; book p. 520). The map α^1 whose cokernel is taken, on H^1_et(R, ℤ/2).

  > Since the sign map σ factors through F×/F×2 = H1et(F, Z/2), the restriction to R× also factors through α1 :H1et(R, Z/2) → (Z/2)r1.

- K-book, VI.9.6.2, after (9.6.2) (PDF p. 529; book p. 521). The narrow-Picard characterisation u = t + j(R).

  > Thus the signature defect j(R) of R is also the dimension of the kernel of Pic+(R)/2 → Pic(R)/2. If we let t and u denote the dimensions of Pic(R)/2 and Pic+(R)/2, respectively, then this means that u = t + j(R).

- K-book, VI.9.10.1, Example 9.10.1 (PDF p. 532; book p. 524). The value j = 1 for ℤ[√7][1/2] used in the tests.

  > Example 9.10.1. (ρ = 1) Consider F = Q(√7), OF = Z[√7] and R = OF[1/2]; here s = 1, t = 0 and j(R) = ρ = 1 (the fundamental unit u = 8+3√7 is totally positive).

- K-book, VI.9.8, proof (PDF p. 530; book p. 522). The value j = 0 for ℤ[1/2].

  > For R = Z[1/2] we have s = 1 and t = u = j = 0.

### Orders of K-groups and of étale cohomology for a totally real field (Theorem VI.9.12)

`ArithmeticKTheory:N.6/order-ratio-for-totally-real-fields` · *theorem*

Let F be a totally real number field with r_1 real embeddings and O_S a ring of S-integers in F. For every even i > 0, 2^{r_1} · |K_{2i−2}(O_S)| / |K_{2i−1}(O_S)| = ∏_ℓ |H^2_et(O_S[1/ℓ]; ℤ_ℓ(i))| / ∏_ℓ |H^1_et(O_S[1/ℓ]; ℤ_ℓ(i))|, all groups being finite and only finitely many factors differing from 1.

**Hypotheses.**

- F totally real (r_2 = 0) and i even: 2i − 1 ≡ 3 (mod 4), so K_{2i−1}(O_S) has rank r_2 = 0 and every group in the formula is finite.
- i > 0 even; O_S any ring of S-integers.

**Proof outline.**

1. Finiteness from N.3/finiteness-and-ranks-combined and, for the cohomology, MotivicEtaleKTheory M.7 (source Ex. VI.8.2–8.3). Write h^{n,i}(ℓ) = |H^n_et(O_S[1/ℓ]; ℤ_ℓ(i))|.
2. h^{1,i}(ℓ) = w_i^{(ℓ)}(F): for ℓ odd this is the source's Exercise VI.8.3; for ℓ = 2 it follows from the Bockstein sequence of MotivicEtaleKTheory M.1, since H^0(O_S[1/2]; ℤ_2(i)) = 0 for i ≠ 0 and H^1 is finite, so H^1(ℤ_2(i)) ≅ H^0(ℚ_2/ℤ_2(i)) (the source cites Exercise VI.8.3, stated only for odd ℓ, in this case; recorded in sourceIssues).
3. The ℓ-primary part of K_{2i−1}(O_S) has order h^{1,i}(ℓ) for ℓ odd (N.5/odd-torsion-at-a-prime-where-cd-is-two) and for ℓ = 2 except that for 2i − 1 ≡ 3 (mod 8) it is 2^{r_1} h^{1,i}(2) (N.5/the-real-case-modulo-eight).
4. The ℓ-primary part of K_{2i−2}(O_S) has order h^{2,i}(ℓ) for ℓ odd (N.6/even-groups-at-odd-primes) and for ℓ = 2 (N.6/the-two-primary-corrections) except that for 2i − 2 ≡ 6 (mod 8) it is H̃^2, of order h^{2,i}(2)/2^{r_1} because α^2(i) is onto (the source prints h^{1,i}(2)/2^{r_1}, a misprint recorded in sourceIssues).
5. Multiply over ℓ: for i ≡ 2 (mod 4) the factor 2^{r_1} occurs in |K_{2i−1}|, for i ≡ 0 (mod 4) as the divisor of |K_{2i−2}{2}|, and in both cases 2^{r_1} · |K_{2i−2}| / |K_{2i−1}| = ∏ h^{2,i}(ℓ) / ∏ h^{1,i}(ℓ).

**Acceptance.**

- F = ℚ, i = 2: 2 · |K_2(ℤ)| / |K_3(ℤ)| = 2 · 2 / 48 = 1/12, and the right side is |H^2(ℤ[1/2]; ℤ_2(2))| / w_2(ℚ) = 2/24, the odd H^2 vanishing because K_2(ℤ) has no odd torsion.
- F = ℚ, i = 4: K_7(ℤ) ≅ ℤ/240 = ℤ/w_4(ℚ) and K_6(ℤ){2} = 0 (Corollary VI.9.8), so |H^2(ℤ[1/2]; ℤ_2(4))| = 2^{r_1} · |K_6(ℤ){2}| = 2; the printed h^{1,4}(2)/2^{r_1} = 16/2 = 8 would give K_6(ℤ){2} of order 8.
- With Theorem VI.8.8 (proved for abelian F; owned by SpecialValuesBirchTate) the ratio is |ζ_F(1 − 2k)|: for F = ℚ and k = 1, ζ(−1) = −1/12 = −2 · 2/48.

**Prerequisites.** `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two`, `ArithmeticKTheory:N.5/the-real-case-modulo-eight`, `ArithmeticKTheory:N.6/even-groups-at-odd-primes`, `ArithmeticKTheory:N.6/the-two-primary-corrections`, `ArithmeticKTheory:N.4/the-w-invariant`, `MotivicEtaleKTheory:M.7`, `MotivicEtaleKTheory:M.1`

**Sources.**

- K-book, VI.9.12, Theorem 9.12 (PDF p. 533; book p. 525). Theorem 9.12; the displayed fraction is printed as a quotient, rendered here with the numerator and denominator separated.

  > Theorem 9.12. Let F be a totally real number field, with r1 real embeddings, and let OS be a ring of integers in F. Then for all even i > 0 2r1 · |K2i−2(OS)| ... |K2i−1(OS)| = ∏ℓ |H2et(OS[1/ℓ]; Zℓ(i))| ... ∏ℓ |H1et(OS[1/ℓ]; Zℓ(i))|.

- K-book, VI.9.12, proof (PDF p. 533; book p. 525). h^{1,i}(ℓ) = w_i^{(ℓ)}(F), cited to Exercise 8.3.

  > Write hn,i(ℓ) for the order of Hnet(OS[1/ℓ]; Zℓ(i)). By Ex. 8.3, h1,i(ℓ) = w(ℓ)i(F).

- K-book, VI.9.12, proof, second paragraph (PDF p. 533; book p. 525). The order of the ℓ-primary part of K_{2i−2}, with the printed misprint h^{1,i}(2)/2^{r_1}.

  > By Theorems 8.2 and 9.11, the ℓ-primary subgroup of K2i−2(OS) has order h2,i(ℓ) for all ℓ, except when ℓ = 2 and 2i−2 ≡ 6 (mod 8) when it is h1,i(2)/2r1.

- K-book, VI, Exercise 8.3 (PDF p. 524; book p. 516). Exercise 8.3, stated for odd ℓ only.

  > 8.3. Let ℓ be an odd prime and F a number field. If i > 1, show that for every ring OS of integers in F containing 1/ℓ, H1et(OS, Zℓ(i)) ≅ H1et(F, Zℓ(i)) ≅ Zrℓ ⊕ Z/w(ℓ)i(F),

- K-book, VI.8.8, Theorem 8.8 (PDF p. 523; book p. 515). The zeta-value theorem that this order formula feeds, owned by SpecialValuesBirchTate.

  > Theorem 8.8. If F is totally real, and Gal(F/Q) is abelian, then for all k ≥ 1: ζF(1 − 2k) = (−1)kr1 2r1 |K4k−2(OF)| ... |K4k−1(OF)|.

### The subgroup of divisible elements

`ArithmeticKTheory:N.6/divisible-subgroup` · *definition*

For an abelian group A, the subgroup of divisible elements is div A = ⋂_{m ≥ 1} m·A, the elements that map to zero in every quotient A/mA. It contains every divisible subgroup of A, is functorial for homomorphisms, commutes with direct sums, and is zero for a finite group. For a field F and n ≥ 1 it is applied to A = K_n(F), giving the source's div K_n(F); Tate observed that div K_2(F) can be nonzero for a number field.

**Hypotheses.**

- A is any abelian group (an additive commutative group); Mathlib has the class DivisibleBy of divisible groups but no subgroup of divisible elements.
- div A need not itself be divisible, so it is in general larger than the maximal divisible subgroup.

**Construction.**

1. Define div A as the infimum over m ≥ 1 of the subgroups m·A (the range of multiplication by m).
2. Functoriality: f(m·A) ≤ m·B for f : A → B, so f(div A) ≤ div B.
3. Direct sums: an element of ⊕ A_i has finitely many nonzero components, so it is divisible by m exactly when each component is; hence div(⊕ A_i) = ⊕ div A_i.
4. Finite A: m = |A| gives m·A = 0.
5. Compatibility with mathlib:DivisibleBy: a subgroup D with DivisibleBy D ℤ lies in div A.

**Acceptance.**

- div(ℚ/ℤ) = ℚ/ℤ, div ℤ = 0 and div A = 0 for A finite.
- div K_2(ℚ) = 0 (test divisibleSubgroup_K2_rat).

**Prerequisites.** `mathlib:DivisibleBy`

**API.**

| name | role | statement |
| --- | --- | --- |
| `divisibleSubgroup` | data | For an abelian group A, ⨅ m ≥ 1, (m • ⊤ : AddSubgroup A). |
| `mem_divisibleSubgroup_iff` | characterisation | x ∈ divisibleSubgroup A ↔ ∀ m ≥ 1, ∃ y, m • y = x. |
| `divisibleSubgroup_map_le` | functoriality | For f : A →+ B, (divisibleSubgroup A).map f ≤ divisibleSubgroup B. |
| `divisibleSubgroup_directSum` | relation | divisibleSubgroup (⨁ i, A i) is the direct sum of the divisibleSubgroup (A i). |
| `divisibleSubgroup_eq_bot_of_finite` | simp | If A is finite then divisibleSubgroup A = ⊥. |
| `le_divisibleSubgroup_of_divisibleBy` | compatibility | If D ≤ A carries DivisibleBy D ℤ then D ≤ divisibleSubgroup A. |

**Used by.**

- *V.6.8.2* — div K_n(F), the elements of K_n(F) mapping to zero in each K_n(F)/ℓ
- *N.6/divisible-subgroup-and-the-wild-kernel* — compared with the wild kernel
- *Weibel 2006, Theorem A* — div K_{2i}(F) ⊆ K^w_{2i}(F) with index at most two

**Unit tests.**

- `divisibleSubgroup_ratCircle` (computation) — divisibleSubgroup (ℚ ⧸ ℤ) = ⊤.
- `divisibleSubgroup_int` (degenerate) — divisibleSubgroup ℤ = ⊥, and divisibleSubgroup A = ⊥ for every finite A.
- `divisibleSubgroup_ne_maxDivisible` (non-example) — For a prime p, the p-group A generated by a and b_1, b_2, … with p·a = 0 and p^k·b_k = a has divisibleSubgroup A = ⟨a⟩ ≅ ℤ/p, which is not divisible; so div A is not the maximal divisible subgroup (which is 0 here).
- `divisibleSubgroup_K2_rat` (compatibility) — divisibleSubgroup K_2(ℚ) = 0: K_2(ℚ) ≅ ℤ/2 ⊕ ⨁_p 𝔽_p^× (K2SymbolsBrauer T.5, Application III.6.5.1) is a direct sum of finite groups; in particular {−1, −1} is not divisible, since the real sign symbol K_2(ℚ) → {±1} kills 2·K_2(ℚ) and sends {−1, −1} to −1.
- `mem_divisibleSubgroup_iff_quotients` (characterisation) — x ∈ divisibleSubgroup A exactly when the image of x in A/mA is 0 for every m ≥ 1 (the source's formulation).

**Library.** module `TauCeti/GroupTheory/DivisibleSubgroup`, namespace `TauCeti`.

**Sources.**

- K-book, V.6.8.2, Wild Kernels 6.8.2 (PDF p. 421; book p. 413). The definition of div K_n(F) as the elements vanishing in every K_n(F)/ℓ, and Tate's observation.

  > In fact the subgroup divKn(F) of elements of Kn(F) which map to zero in each quotient Kn(F)/ℓ · Kn(F) lies in the torsion subgroup T of Kn(R) (by 6.8.1) and if ℓ · T = 0 then divKn(F) is the kernel of Kn(R; Z/ℓ) → Kn(F; Z/ℓ). Tate observed that divKn(F) can be nonzero even for K2.

### The divisible subgroup inside the wild kernel, with the exception for special fields

`ArithmeticKTheory:N.6/divisible-subgroup-and-the-wild-kernel` · *theorem*

Let F be a number field and i ≥ 1. Then div K_{2i}(F) ⊆ WK_{2i}(F), with index at most two. The two are equal when i is even or F is not special; when i is odd and F is special, div K_{2i}(F) has index two in WK_{2i}(F). Here F is special when it is exceptional (N.4/exceptional-fields-at-two) and for every prime 𝔭 of F over 2 there is a 2-primary root of unity ζ with ζ ∈ F_𝔭(√−1) but ζ ∉ F(√−1) (Hutchinson; Weibel 2006, Definition 5.2). The K-book states that div K_{2i}(F) is isomorphic to the wild kernel with no exception; that is false for special F and odd i (both groups are finite and their orders differ), and the exception is the exceptional dyadic case in which the stage text forbids asserting equality.

**Hypotheses.**

- F is a number field; WK_{2i}(F) is the wild kernel of N.6/tame-and-wild-kernels; div is N.6/divisible-subgroup.
- Special fields are among the exceptional ones; for quadratic fields ℚ(√d), F is special exactly when d ≡ −1 (mod 8) with d ≠ −1, or d ≡ ±2 (mod 16) with d ≠ ±2 (Weibel 2006, Example 5.3, after Hutchinson).
- The theorem is Weibel 2006, Theorem A (for i = 1, Tate and Hutchinson); it is not proved in the K-book, and it is stated with that paper's definition of the wild kernel, whose agreement with the K-book's is recorded in the gap.

**Proof outline.**

1. div K_{2i}(F) ⊆ WK_{2i}(F): each map defining the wild kernel in Weibel 2006, Definition 0.2, takes values in a finite group, μ^{⊗i}(F_v) or ℤ/2, where divisible elements are zero (Weibel 2006, the sentence after Definition 0.2).
2. The ℓ-primary parts agree for ℓ odd (Schneider; Banaszak–Kolster; Weibel 2006, §1), using N.6/even-groups-at-odd-primes and MotivicEtaleKTheory M.7.
3. The two-primary comparison, index at most two, and the characterisation of equality by i even or F not special (Weibel 2006, Theorem A, §§3–6; for i = 1 Hutchinson [Hu1, 4.4]): recorded as a gap, to be decomposed from that paper.

**Acceptance.**

- F = ℚ: div K_2(ℚ) = WK_2(ℚ) = 0 (ℚ is exceptional but not special: μ_{2^∞}(ℚ_2(i)) = μ_4 ⊂ ℚ(i)).
- F = ℚ(√−14) (special, −14 ≡ 2 mod 16): {−1, −1} lies in WK_2(F) but not in div K_2(F), and WK_2(F) ≅ div K_2(F) ⊕ ℤ/2 (Weibel 2006, Example 5.6, after Hutchinson [Hu2, 3.1]); so the two groups are not isomorphic.
- For i even the two always agree, even for special F.

**Prerequisites.** `ArithmeticKTheory:N.6/divisible-subgroup`, `ArithmeticKTheory:N.6/tame-and-wild-kernels`, `ArithmeticKTheory:N.6/even-groups-at-odd-primes`, `ArithmeticKTheory:N.4/exceptional-fields-at-two`, `MotivicEtaleKTheory:M.7`, `KTheoryFiniteLocalFields:L.7`

**Sources.**

- K-book, V.6.8.2, Wild Kernels 6.8.2 (PDF p. 421; book p. 413). The source's claim that div K_{2i}(F) is isomorphic to the wild kernel, attributed to [225] = Weibel, 'Higher wild kernels and divisibility in the K-theory of number fields', J. Pure Appl. Algebra 206 (2006) 222–244, whose Theorem A proves the corrected statement of this node (see sourceIssues).

  > In fact, divK2i(F) is isomorphic to the wild kernel, defined as the intersection (over all valuations v on F) of the kernels of all maps K2i(F) → K2i(Fv). This is proven in [225].

## Gaps

### K-theory with finite coefficients has no supplier stage

Needed by: `ArithmeticKTheory:N.5/soule-mod-l-surjectivity`, `ArithmeticKTheory:N.5/soule-theorem`.

Soulé's proof (V.6.8, PDF p. 420) and Proposition 6.8.1 (PDF pp. 420–421) have now been read in full. They use K-theory with ℤ/ℓ coefficients: its localisation sequence (V.5.2), the product on K_*(R; ℤ/ℓ) for ℓ ≢ 2 (mod 4) (IV.2.8), the Bott element β ∈ K₂(R; ℤ/ℓ) when ζ_ℓ ∈ R (IV.2.5.2), and the injectivity K₁(R; ℤ/ℓ) → K₁(F; ℤ/ℓ) (Ex. IV.2.3). No stage of data/atlas.json states these (searched: GeneralAlgebraicKTheory K.1–K.7, KTheoryFiniteLocalFields L.1–L.2, MotivicEtaleKTheory M.1–M.3, StableHomotopyKTheory H.2–H.3). NEXT ACTION: assign an owner, GeneralAlgebraicKTheory K.7 or KTheoryFiniteLocalFields L.1 being the natural candidates, and import from it.

### The comparison of the divisible subgroup with the wild kernel rests on Weibel 2006, which corrects the K-book

Needed by: `ArithmeticKTheory:N.6/divisible-subgroup-and-the-wild-kernel`, `ArithmeticKTheory:N.6/tame-and-wild-kernels`.

V.6.8.2 states that div K_{2i}(F) is isomorphic to the wild kernel and cites [225] = C. Weibel, 'Higher wild kernels and divisibility in the K-theory of number fields', J. Pure Appl. Algebra 206 (2006) 222–244. The author's preprint (dated 23 July 2004; https://sites.math.rutgers.edu/~weibel/archive/papers-dir/wildkernel.pdf, SHA-256 2675756f…) was read on its pages 1–2 and 13–15: Theorem A says that div K_{2i}(F) has index 2 in K^w_{2i}(F) when i is odd and F is special, and that they are equal when i is even or F is not special; Example 5.6 (after Hutchinson) gives F = ℚ(√d), d < 0, d ≡ 2 (mod 16), with {−1, −1} ∈ K^w_2(F) ∖ div K_2(F). Two things are not established here: the proof of Theorem A (§§1–6 of that paper, and Hutchinson [Hu1, 4.4] for i = 1), and the agreement of the K-book's wild kernel (kernels of K_{2i}(F) → K_{2i}(F_v)) with Weibel's Definition 0.2 (kernels of the Dwyer–Friedlander maps K_{2i}(F) → K_{2i}(F_v) → H^2(F_v; μ^{⊗(i+1)}) ≅ μ^{⊗i}(F_v) at finite places, and to ℤ/2 at real places), which holds for i = 1 by Moore's theorem but is not proved for i ≥ 2 in either text. NEXT SOURCE ACTION: add the paper to the packet's sources, decompose Theorem A, and prove or cite the comparison of the two definitions; until then N.6/divisible-subgroup-and-the-wild-kernel is conditional on this gap.

### Compatibility of the localisation sequence with base change along a finite extension

Needed by: `ArithmeticKTheory:N.2/localisation-sequence-and-finite-extensions`.

N.2's text asks for 'compatibility with extensions of fields'. The K-book proves the transfer (covariant) compatibility, (6.6.3)–(6.6.4) (PDF p. 418), which N.2/localisation-sequence-and-finite-extensions states. The contravariant compatibility, base change along R → R′ with the ramification index e(𝔭′|𝔭) multiplying the residue terms, is not stated in the sections read. NEXT SOURCE ACTION: find a source for it, or derive it from dévissage (R/𝔭 ⊗ R′ = ∏ R′/𝔭′^{e}) and record the derivation as a node.

### No stage names Suslin's computation of the torsion of K_*(F^s)

Needed by: `ArithmeticKTheory:N.5/e-invariant`.

The e-invariant needs the Aut(F^s)-isomorphism K_{2i−1}(F^s)_tors ≅ µ(i) (K-book Proposition VI.1.7.1 and Exercise VI.1.1, proved from K_*(F^s; Z/m) ≅ Z/m[β] by rigidity, VI.1.3–1.4). MotivicEtaleKTheory M.7 ('Prove the relevant rigidity and étale descent theorems') is the nearest owner and is cited, but no stage text names this statement. NEXT ACTION: confirm with M.7 (or KTheoryFiniteLocalFields L.2, 'Prove rigidity ...') that it owns Suslin's theorem, and read K-book VI.1.1–1.7 to decompose it there.

### Harris and Segal's theorem is quoted, not proved

Needed by: `ArithmeticKTheory:N.5/harris-segal-summand`.

The proof of the Harris–Segal Theorem VI.2.5 rests on Corollary VI.1.5.2, which rests on Theorem VI.1.5, quoted from Harris–Segal [HS, Thm. 3.1] ('Ki groups of rings of algebraic integers', Ann. of Math. 101 (1975)): the surjectivity of π_*(B(µ_m ≀ Σ_∞)^+) → K_*(F_q) on ℓ-parts. NEXT SOURCE ACTION: read Harris–Segal §3 and decide its owner (it is K-theory of finite fields and of B(µ_m ≀ Σ_∞)^+, closest to KTheoryFiniteLocalFields L.1).

## Requests

- **`KTheoryLowDegrees:Z.4`** — (1) K₀(A) ≅ ℤ ⊕ Pic(A) by rank and determinant for a Dedekind domain A (KTheoryLowDegrees:Z.4/rank-pic-equivalence), used for A = S.integer F, with Pic compared to the class group (Mathlib's ClassGroup.equivPic) and Cl(O_{F,S}) ≅ Cl(𝓞_F)/⟨[𝔭] : 𝔭 ∈ S⟩ taken from Tau Ceti's IsDedekindDomain.integerClassGroupEquiv; this is N.1's target 'Import Z ... to obtain K₀(O_{F,S}) ≅ Z ⊕ Cl(O_{F,S})', and the former node N.1/K0-of-S-integers is deleted in its favour. (2) The restriction-of-scalars formula det_R(Res P) = Norm(det P)·det_R(R′)^{rank P} for the finite projective extension O_{F,S} ⊂ O_{F′,S′}. Z.4: 'Specialise to O_F and O_{F,S}, using the actual localised ring and the quotient of the class group by classes of primes in S. Compute the induced maps under localisation, extension of number fields and finite-flat restriction of scalars. The transfer of an ideal class requires the determinant/norm formula'. Z.4 is upstream of N.1, so its specialisation should be stated for Mathlib's Set.integer, which Tau Ceti already makes a Dedekind domain; the presentation of O_{F,S} as a localisation and its independence are N.1's ('Prove independence of a chosen presentation of O_{F,S} as a localisation') and must not be re-planned in Z.4's remaining item 'the number-field S-integer ring identification'. (3) The Steinitz classification P ≅ A^{n−1} ⊕ I, with P determined by rank and det P (Z.4/steinitz, Z.4/projective-classification), which counts the components of the strata of Quillen's rank filtration (N.3:finite-generation/rank-filtration) and the classes used in N.3:finite-generation/steinberg-homology-of-automorphism-groups. Needed by: `ArithmeticKTheory:N.1/norms-transfers-and-pullbacks`, `ArithmeticKTheory:N.2/the-three-classical-rows`, `ArithmeticKTheory:N.2/even-degree-injectivity`, `ArithmeticKTheory:N.3:finite-generation/quillen-finiteness-criterion`, `ArithmeticKTheory:N.3:finite-generation/rank-filtration`, `ArithmeticKTheory:N.3:finite-generation/steinberg-homology-of-automorphism-groups`.

- **`KTheoryLowDegrees:U.4`** — SK₁(O_{F,S}) = 0 (Bass–Milnor–Serre), K₁(O_{F,S}) ≅ O_{F,S}^× by the determinant, O_{F,S}^× ≅ μ(F) ⊕ ℤ^{r₁+r₂+|S|−1}, and the comparison with the unit inclusion into K₁(F). U.4: 'Prove the Bass–Milnor–Serre result needed for SK₁(O_{F,S})=0, with F a number field and S finite ... Combine determinant with Dirichlet's S-unit theorem to identify K₁(O_{F,S}) ≅ O_{F,S}^×, O_{F,S}^× ≅ μ(F)⊕ℤ^{r₁+r₂+|S|−1} ... Compare finite-field and local-ring specialisations and the unit inclusion into K₁(F).' U.4 is upstream of N.1 through U.5, which the atlas lists. N.3:ranks cites U.4's Dirichlet S-unit theorem for the rank r₁ + r₂ + |S| − 1 of K₁(O_{F,S}), the degree-one exception to the period-four pattern (RT-AREA-ktheory-1/24 and /7); the checkpointed KTheoryLowDegrees U.1 packet plans it as U.4/s-unit-theorem, which this packet will cite by id once that packet is accepted. Needed by: `ArithmeticKTheory:N.1/K1-of-S-integers-and-the-determinant`, `ArithmeticKTheory:N.5/soule-theorem`, `ArithmeticKTheory:N.1/transfer-and-norm-on-units`, `ArithmeticKTheory:N.2/even-degree-injectivity`, `ArithmeticKTheory:N.3:ranks/borel-rank-theorem`.

- **`BorelRegulators:R.1`** — The arithmetic-group input to Quillen's finite generation theorem, with R.1 as its single owner (RT-AREA-ktheory-1/1): (i) the Tits building T(V) of a finite-dimensional F-vector space V (the poset of proper non-zero subspaces, empty when dim V = 1), functorial in linear isomorphisms and GL(V)-equivariant; (ii) the Solomon–Tits theorem, T(V) ≃ a wedge of (dim V − 2)-spheres for dim V ≥ 2; (iii) the Steinberg module St(V) = H̃_{dim V−2}(T(V); ℤ), a free abelian group with its GL(V)-action (St(V) = ℤ for dim V = 1; reduced homology in dimension two); (iv) the correctly twisted arithmetic duality: for a number field F with r₁ real and r₂ complex places and a torsion-free subgroup G of finite index in GL_n(𝓞_F), H^{vcd−i}(G; M) ≅ H_i(G; M ⊗ D) with vcd = r₁·n(n+1)/2 + r₂·n² − n and integral coefficients, where D = St_n(F) ⊗ ℤ_χ^{⊗(n−1)} and χ = N_{F/ℚ} ∘ det : GL_n(𝓞_F) → {±1} (Putman–Studenmund, arXiv:1909.01217v4, Theorem C, p. 4, and the duality display, p. 2; the untwisted St_n(F) is wrong when n is even and 𝓞_F^× has an element of norm −1, their Example 1.4), or equivalently the untwisted duality for G ⊂ ker χ followed by descent; built on the Borel–Serre bordification from ArithmeticLocallySymmetricSpaces ALS.2 and its finite-level cohomology, with boundary ≃ T_n(F) and the orientation behaviour of their Proposition 2.1; (v) the finiteness consequence that N.3 imports: for every n ≥ 1 and every subgroup Γ ⊂ GL_n(F) commensurable with GL_n(𝓞_F), H_i(Γ; St_n(F)) is a finitely generated abelian group for every i ≥ 0 — integrally, not only after ⊗ ℚ — by (iv) for a torsion-free normal subgroup G ⊂ Γ ∩ GL_n(𝓞_F) of finite index (a finite K(G, 1) from the compact Borel–Serre quotient makes H^*(G; M) finitely generated for finitely generated M) and the Hochschild–Serre spectral sequence H_p(Γ/G; H_q(G; St)) ⇒ H_{p+q}(Γ; St) for the finite group Γ/G; n = 1 is the elementary case Γ ⊂ F^× commensurable with 𝓞_F^×. N.3 keeps the rank filtration, the commensurability of Aut_A(P) with GL_n(𝓞_F) for nonfree P, the low ranks and the assembly, and does not re-prove (i)–(v). R.1's text claims 'the finite-type homotopy consequences needed by K-theory'; what K-theory needs is exactly (v), and N.3's stage text should drop its clause 'Develop the arithmetic-group finiteness and finite-type homotopy input' (maintainer). Atlas edge R.1 → N.3:finite-generation exists; no cycle. Needed by: `ArithmeticKTheory:N.3:finite-generation/layer-poset-is-the-suspended-building`, `ArithmeticKTheory:N.3:finite-generation/steinberg-homology-of-automorphism-groups`.

- **`BorelRegulators:R.3`** — Borel's rank theorem for orders, 𝓞_F included (K-book IV.1.17 and IV.1.18): for an order R in a finite-dimensional semisimple ℚ-algebra A, K_n(R) ⊗ ℚ ≅ K_n(A) ⊗ ℚ for n ≥ 2; for a number field F with r_1 real and r_2 complex places, dim_ℚ K_n(𝓞_F) ⊗ ℚ = dim_ℚ K_n(F) ⊗ ℚ = r_1 + r_2, r_2 or 0 for n ≥ 2 according as n ≡ 1 (mod 4), n ≡ 3 (mod 4) or n even. Used with A = F and R = 𝓞_F. The S-integer case is N.3:ranks's (RT-AREA-ktheory-1/7): 𝓞_{F,S} with S ≠ ∅ is not an order, and the passage uses N.2's localisation sequence and L.1, which are not R.3's ancestors; R.3's text should drop 'Include the commutative order and S-integer cases via the appropriate comparison/localisation results' for the S-integer part (maintainer; BorelRegulators' blueprint job). The higher regulator is not needed here; it is R.4's. Atlas edge R.3 → N.3:ranks exists; no cycle. Needed by: `ArithmeticKTheory:N.3:ranks/borel-rank-theorem`.

- **`GeneralAlgebraicKTheory:K.1`** — The K-groups K_n(C) = π_{n+1}(|NQ(C)|, 0) of an exact category, natural in exact functors, with π₁NQ(C) identified with ExactK0 and K_n(R) = K_n(P(R)) for a ring: used by N.2's localisation sequences and finite support, by Quillen's finiteness criterion (whose proof filters Q(P(R)) by rank) and by the e-invariant. K.1: 'Define K_n(C)=π_(n+1)(|NQ(C)|,0) for every natural number ... natural in exact functors ... Prove that π₁ NQ(C) is the existing ExactK0'. Two things the earlier request asked of K.1 are not in its text: Quillen's computation of K_*(𝔽_q) is KTheoryFiniteLocalFields L.1's, and compatibility with filtered colimits is GeneralAlgebraicKTheory K.7's. The rank filtration also uses the node K.1/exact-categories-and-Q-construction (morphisms of Q(A) as admissible layers, the isomorphisms of Q(A) as those of A, QCat.hom_zero) and K.1/K-groups-of-exact-categories (K_n = π_{n+1} BQ), cited by id. Needed by: `ArithmeticKTheory:N.2/finite-support`, `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`, `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `ArithmeticKTheory:N.2/the-three-classical-rows`, `ArithmeticKTheory:N.2/localisation-sequence-and-finite-extensions`, `ArithmeticKTheory:N.3:finite-generation/quillen-finiteness-criterion`, `ArithmeticKTheory:N.5/e-invariant`, `ArithmeticKTheory:N.3:finite-generation/rank-filtration`, `ArithmeticKTheory:N.3:finite-generation/comma-category-is-the-layer-poset`, `ArithmeticKTheory:N.3:finite-generation/rank-spectral-sequence`.

- **`GeneralAlgebraicKTheory:K.3`** — Quillen localisation for the Serre subcategory M_s(R) ⊂ M(R) with quotient M(R[1/s]), dévissage for finite-length torsion modules, and the resolution theorem giving K = G for Dedekind domains and fields. K.3: 'Prove dévissage for an appropriate full abelian subcategory closed under subobjects and quotients, with a finite filtration of every object ... Prove the resolution theorem ... Prove Quillen localisation for a Serre subcategory of a small abelian category and its quotient.' The projection formula, which this request also asked of K.3, is not in K.3's text; it is KTheoryLowDegrees U.5's (against K₀) and GeneralAlgebraicKTheory K.7's ('compatibility with ... transfers'). Needed by: `ArithmeticKTheory:N.1/norms-transfers-and-pullbacks`, `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `ArithmeticKTheory:N.2/finite-support`, `ArithmeticKTheory:N.2/localisation-sequence-and-finite-extensions`, `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`.

- **`K2SymbolsBrauer:T.5`** — The tame kernel as a group and its exact sequences, which N.2 and N.6 import (RT-AREA-ktheory-1/9): T.5/unramified-subgroup (the tame kernel, defined by the vanishing of the tame symbols), T.5/tame-kernel-sequence (0 → K_2(O_F) → K_2(F) → ⊕_𝔭 k(𝔭)^× → 0, with injectivity from K_2(𝔽_q) = 0 and surjectivity from SK_1(O_F) = 0) T.5/s-integer-tame-kernel-sequence (0 → K_2(O_{F,S}) → K_2(F) → ⊕_{𝔭∉S} k(𝔭)^× → 0, residues at the primes outside S) and T.5/relative-s-integer-sequence (0 → K_2(O_F) → K_2(O_{F,S}) → ⊕_{𝔭∈S} k(𝔭)^× → 0, residues at the primes in S), stated separately. N.2/the-three-classical-rows identifies the degree-two segment of its localisation sequence with these sequences and does not re-prove them; the import is acyclic because T.5 derives them from K2SymbolsBrauer T.3/dedekind-localization-boundary and KTheoryLowDegrees U.4 (RT-AREA-ktheory-1/26) and lists no ArithmeticKTheory:N.2 prerequisite (the K2SymbolsBrauer packet revised for the same findings; its request to N.2 is withdrawn). The certificate format is no longer requested: it is N.6/order-certificate, and T.5 drops its competing certificate paragraph and T.5/certified-presentation (RT-AREA-ktheory-1/9). Needed by: `ArithmeticKTheory:N.2/the-three-classical-rows`, `ArithmeticKTheory:N.2/even-degree-injectivity`, `ArithmeticKTheory:N.6/tame-and-wild-kernels`.

- **`K2SymbolsBrauer:T.7`** — T.7/classical-local-symbols (the Hilbert symbols of local fields, with their normalisation) and T.7/twisted-roots-of-unity (the trivialisation of μ_ℓ^{⊗i} by a root of unity in F). Tate's comparison K_2/m ≅ H² and its S-integer extension are no longer requested from T.7: MotivicEtaleKTheory M.3 owns them (RT-AREA-ktheory-1/8; request to M.3). The twisted coefficient modules themselves are MotivicEtaleKTheory M.1's (reviewed T.7/twisted-roots-of-unity: 'The twists themselves are M.1's'), so N.4 imports them from M.1 (a separate request); no N.4 node depends on T.7. Needed by: `ArithmeticKTheory:N.6/tame-and-wild-kernels`, `ArithmeticKTheory:N.6/l-rank-from-class-group-data`.

- **`MotivicEtaleKTheory:M.7`** — (a) For ℓ odd, or ℓ = 2 with F totally imaginary, and R = O_S[1/ℓ], i ≥ 1: K_{2i}(R; ℚ_ℓ/ℤ_ℓ) ≅ H^0(R; ℚ_ℓ/ℤ_ℓ(i)), K_{2i−1}(R; ℚ_ℓ/ℤ_ℓ) ≅ H^1(R; ℚ_ℓ/ℤ_ℓ(i)), K_{2i−1}(R; ℤ_ℓ) ≅ H^1(R; ℤ_ℓ(i)) and K_{2i}(R; ℤ_ℓ) ≅ H^2(R; ℤ_ℓ(i+1)), natural in R, with the vanishing and finiteness statements of the source's Exercises VI.8.1–8.3 (proof of VI.8.2). M.7's text: 'At odd ℓ and j≥2 the expected arithmetic outputs identify K_{2j−1} with H¹ of twist j and K_{2j−2} with H² of twist j after the stated ℓ-adic passage.' (b) At 2 with real places, Theorem VI.9.4: for O_S ⊇ O_F[1/2], α^1_S(4k) is onto for k > 0 and K_n(O_S; ℚ_2/ℤ_2) is given by the eight-row table, with the non-split extension in degree 8k+4 detected by comparison with ℝ and the undetermined extension in degree 8k+5, all induced by the natural morphism of descent spectral sequences to r_1 copies of that of ℝ (with Lemma VI.9.3 and the spectral sequences of ℝ, Theorem VI.9.1 and Variant VI.9.1.2); M.7's text: 'At 2 with real places, prove the corrected long exact sequences and extension data'. AUDIT-27 records M.7 as the owner of N.5's real two-primary calculation. (c) The bounds j(O_F[1/2]) ≤ ρ ≤ r_1 − 1 of Corollary VI.9.10 from the edge map of the mod-2 spectral sequence. M.7 owns the whole dyadic calculation (RT-AREA-ktheory-1/3): the real-place spectral sequences whose differentials are fixed by Suslin's theorem K_n(ℝ; ℤ/m) ≅ π_n(BO; ℤ/m) for n ≥ 1 (K-book VI.3.1, PDF p. 483; degree zero identified separately) and real topological K-theory, as used in VI.9.1–9.4; N.5 and N.6 import its output — the groups of Theorem VI.9.4, the real-place maps α^n_S(i) to ⊕_{real} H^n(ℝ; −) and to K_*(ℝ; ℚ_2/ℤ_2), and the extension data, with their naturality — and perform no second dyadic calculation. Needed by: `ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two`, `ArithmeticKTheory:N.5/the-real-case-modulo-eight`, `ArithmeticKTheory:N.6/even-groups-at-odd-primes`, `ArithmeticKTheory:N.6/the-two-primary-corrections`, `ArithmeticKTheory:N.6/order-ratio-for-totally-real-fields`, `ArithmeticKTheory:N.6/divisible-subgroup-and-the-wild-kernel`, `ArithmeticKTheory:N.5/e-invariant`.

- **`MotivicEtaleKTheory:M.8`** — The étale Chern classes K_{2i−1}(O_S; ℤ_ℓ) → H^1(O_S[1/ℓ]; ℤ_ℓ(i)) and their agreement with M.7's comparison maps, compatible with the maps induced by O_S ⊂ O_{S'} and by finite extensions (M.8's text: 'Construct étale Chern classes ... Prove compatibility with the higher K-theory Chern character, residues, norms and products'). This is the naturality of the identifications that N.5's text requires ('the e-invariant/Chern maps, their kernels and the extension classes used to obtain them must be natural'); AUDIT-27 records M.8 as its owner. M.8 is not in N.5's atlas requirements; the edge M.8 → N.5 is acyclic in the atlas, but K3BlochGroups' packet imports N.5 into V.2, which with Polylogarithms P.2 → BorelRegulators R.7 → M.8 closes a cycle (see restructure). Needed by: `ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two`.

- **`KTheoryLowDegrees:U.3`** — The determinant splitting K₁(A) = A^× ⊕ SK₁(A) for commutative A and SK₁ = 0 for fields, so that K₁(F) = F^× and K₁(k(𝔭)) = k(𝔭)^×. U.3: 'For commutative A construct the stable determinant and its section from Aˣ. Define SK₁(A) as its kernel and prove the split decomposition as abelian groups. Prove SK₁ vanishing for fields and commutative semilocal rings'. U.3 is upstream of N.1 (U.3 → U.4 → U.5 → N.1). Needed by: `ArithmeticKTheory:N.1/K1-of-S-integers-and-the-determinant`, `ArithmeticKTheory:N.2/the-three-classical-rows`.

- **`KTheoryLowDegrees:U.5`** — Transfer by restriction of scalars for the finite projective extension O_{F,S} ⊂ O_{F′,S′}, its agreement with the field norm on units, the projection formula against K₀, and the valuation convention for the degree-one boundary. U.5: 'For a finite projective algebra extension construct transfer by restriction of scalars. Prove that, on a field's unit group, this agrees with the field norm. Prove the projection formula against K₀, and the boundary map from a discrete valuation field's units to K₀ of its residue field equals the valuation with the chosen convention.' The atlas lists U.5 as a prerequisite of N.1. Needed by: `ArithmeticKTheory:N.1/norms-transfers-and-pullbacks`, `ArithmeticKTheory:N.1/transfer-and-norm-on-units`, `ArithmeticKTheory:N.2/the-three-classical-rows`.

- **`GeneralAlgebraicKTheory:K.7`** — Filtered-colimit compatibility of K-theory for rings (K_n(F) = colim_s K_n(R[1/s])), finite-product compatibility, and products compatible with localisation boundaries and transfers (the K_*(R)-module structure of (6.6) and the projection formula in all degrees). K.7: 'Prove Morita invariance, finite-product compatibility, filtered-colimit compatibility for rings ... Prove compatibility with relative groups, localisation boundaries and transfers.' The atlas lists K.7 as a prerequisite of N.1. Needed by: `ArithmeticKTheory:N.2/finite-support`, `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`.

- **`KTheoryFiniteLocalFields:L.1`** — Quillen's finite-field calculation K₀(𝔽_q) = ℤ, K_{2j}(𝔽_q) = 0 and K_{2j−1}(𝔽_q) ≅ ℤ/(q^j − 1) for j ≥ 1 (K-book IV.1.13), with the determinant in degree one and the restriction and transfer maps for finite extensions. It gives the residue terms of the localisation sequences in N.2 and N.3 (at primes over ℓ they have no ℓ-torsion), the even-degree injectivity and Soulé's theorem, Corollary VI.1.5.2 in N.5, and the odd-prime computations of N.6. L.1: 'Prove, for every finite field with q elements and every j≥1, K₀(𝔽_q)=ℤ, K_{2j}(𝔽_q)=0, K_{2j−1}(𝔽_q)≅ℤ/(q^j−1) ... Construct the restriction and transfer maps for finite extensions and prove their formulas'. The atlas lists L.1 as a prerequisite of N.2; no cycle. Needed by: `ArithmeticKTheory:N.2/even-degree-injectivity`, `ArithmeticKTheory:N.5/soule-theorem`, `ArithmeticKTheory:N.5/soule-mod-l-surjectivity`, `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`, `ArithmeticKTheory:N.3:ranks/borel-rank-theorem`, `ArithmeticKTheory:N.3:ranks/even-K-groups-of-the-field-are-infinite-torsion`, `ArithmeticKTheory:N.5/harris-segal-summand`, `ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two`, `ArithmeticKTheory:N.6/even-groups-at-odd-primes`, `ArithmeticKTheory:N.6/l-rank-from-class-group-data`.

- **`MotivicEtaleKTheory:M.1`** — The Tate twists ℚ/ℤ(j), j ∈ Z, of a field F as discrete G_F-modules: ℚ/ℤ(j) = ⊕_{ℓ ≠ char F} ℚ_ℓ/ℤ_ℓ(j), ℚ_ℓ/ℤ_ℓ(j) = colim_ν µ_{ℓ^ν}^{⊗j}, with g ∈ G_F acting through χ_ℓ(g)^j for Mathlib's cyclotomicCharacter; equivalently the K-book's µ(j) of Definition VI.1.7 (the group µ(F^s) with g acting by ζ ↦ g^j(ζ)); weight one is the colimit of Tau Ceti's KummerCoeff F ℓ^ν. M.1's text: 'Import finite/continuous Tate twists ... Q/Z(j) uses primewise compatible twists, not the ordinary tensor power of Q/Z.' Atlas: N.4 requires MotivicEtaleKTheory:M.1; no cycle. N.6 also needs, from the same stage, the finite and continuous twists μ_m^{⊗j}, ℤ_ℓ(j) and ℚ_ℓ/ℤ_ℓ(j) with the coefficient and Bockstein sequences for ℤ_ℓ(j) → ℤ_ℓ(j) → μ_ℓ^{⊗j}; the étale cohomology of O_S[1/ℓ] with these coefficients and the Kummer sequence are requested from MotivicEtaleKTheory M.2. Needed by: `ArithmeticKTheory:N.4/the-w-invariant`, `ArithmeticKTheory:N.4/exponent-criterion`, `ArithmeticKTheory:N.6/even-groups-modulo-l`, `ArithmeticKTheory:N.6/l-rank-from-class-group-data`, `ArithmeticKTheory:N.6/signature-defect`, `ArithmeticKTheory:N.6/order-ratio-for-totally-real-fields`.

- **`StableHomotopyKTheory:H.2`** — Quillen's Theorems A and B and the long exact homotopy sequence of a homotopy fibre, and the homotopy theory of categories that the rank spectral sequence of N.3:finite-generation uses: (a) Theorem A for maps of posets, applied to the poset of layers J(V) and to the interval poset of the Tits building; (b) Thomason's theorem δN(D, F) ≃ N(D ∫ F) for a functor F : D → Cat and the resulting spectral sequence E²_{p,q} = H_p(D, H_q(T ↓ −)) ⇒ H_{p+q}(C) for a functor T : C → D (Kahn, arXiv:1108.2441v3, 1.4.3–1.4.6); (c) for a cellular functor T : C → D (fully faithful, no morphism from D − C to C) the homotopy cocartesian square and long exact sequence ⋯ → H_i(D − C, F̃_T) → H_i(C) → H_i(D) → H_{i−1}(D − C, F̃_T) → ⋯, and the spectral sequence of a sequence of cellular functors with Q = colim Q_n (Kahn 2.3.6, 2.3.7, 2.4.1). H.2's text: 'Prove Quillen's Theorem A from contractible comma categories. Prove Theorem B with its homotopy-fibre hypothesis on transition functors ... Develop the bisimplicial diagonal/iterated-realisation comparison and the levelwise-equivalence theorem'. Atlas edge H.2 → N.3:finite-generation exists; no cycle. Needed by: `ArithmeticKTheory:N.3:finite-generation/layer-poset-is-the-suspended-building`, `ArithmeticKTheory:N.3:finite-generation/rank-spectral-sequence`.

- **`KTheoryFiniteLocalFields:L.2`** — The prime-to-p part of the K-theory of a p-adic local field E with residue field F_q: K_{2i−1}(E){ℓ} ≅ Z/w_i^{(ℓ)}(E) for ℓ ≠ p, detected by the e-invariant (K-book Example VI.2.3.1 and Exercise VI.1.3), used in the proof of the Harris–Segal theorem. L.2's text: 'Deduce the prime-to-residue-characteristic part of local-field K-theory.' L.2's upstream contains no ArithmeticKTheory stage; no cycle. Needed by: `ArithmeticKTheory:N.5/harris-segal-summand`.

- **`KTheoryFiniteLocalFields:L.7`** — The maps K_{2i}(F) → K_{2i}(F_v) to the completions of a number field, their compatibility with the localisation boundary K_{2i}(F) → K_{2i−1}(k(v)) and with restriction along finite extensions (L.7's text: 'Prove compatibility of local restriction/transfer, arithmetic Chern classes, Hilbert symbols, and cyclotomic traces with completion of a number field at a finite place. This supplies N's local conditions'). N.6's atlas entry already requires L.7. Needed by: `ArithmeticKTheory:N.6/tame-and-wild-kernels`, `ArithmeticKTheory:N.6/divisible-subgroup-and-the-wild-kernel`.

- **`KTheoryFiniteLocalFields:L.3`** — Moore's theorem for a nonarchimedean local field E: K_2(E) is μ(E) plus a uniquely divisible group, the projection being the Hilbert symbol (L.3's text: 'the uniquely divisible kernel and the finite roots-of-unity quotient'), so that the kernel of K_2(F) → K_2(F_v) is the kernel of the Hilbert symbol at v. Needed by: `ArithmeticKTheory:N.6/tame-and-wild-kernels`.

- **`MotivicEtaleKTheory:M.2`** — Tate–Poitou duality and the real places for O_S[1/ℓ]: cd_ℓ = 2 unless ℓ = 2 and r_1 > 0; the maps α^n_S(i) to ⊕_{real} H^n(ℝ; −) and the modified groups H̃^n = ker α^n, with α^2(4k) onto (M.2's text: 'Keep ordinary, positive and modified cohomology separate'); and the Brauer group sequence (8.1.1) for S containing a finite place. Needed by: `ArithmeticKTheory:N.6/even-groups-modulo-l`, `ArithmeticKTheory:N.6/l-rank-from-class-group-data`, `ArithmeticKTheory:N.6/signature-defect`, `ArithmeticKTheory:N.6/the-two-primary-corrections`.

- **`MotivicEtaleKTheory:M.3`** — The Galois symbol K_2(F)/m → H²(F; μ_m^{⊗2}) with its symbol formula, and Tate's theorems: the local and global cases and the S-integer form K_2(O_{F,S})/ℓ^r ≅ H²_et(O_{F,S}; μ_{ℓ^r}^{⊗2}) when ℓ is invertible in O_{F,S} (M.3's text), used at ℓ = 2 for the row n = 2 of Theorem VI.9.11. M.3 is the single owner (RT-AREA-ktheory-1/8); N.6 cites it and not K2SymbolsBrauer T.7 for this theorem. Needed by: `ArithmeticKTheory:N.6/the-two-primary-corrections`.

- **`StableHomotopyKTheory:H.6`** — The universal coefficient sequence 0 → π_n(E)/m → π_n(E/m) → π_{n−1}(E)[m] → 0 and its ℚ_ℓ/ℤ_ℓ and ℤ_ℓ limits (H.6's text), applied to K(R): if K_{n+1}(R) is finite then K_n(R){ℓ} ≅ K_{n+1}(R; ℚ_ℓ/ℤ_ℓ), and if K_n(R) is finite then K_n(R){ℓ} ≅ K_n(R; ℤ_ℓ) (the source's Ex. IV.2.6 and IV.2.9). Also Serre's theorem for the class of finitely generated abelian groups: for a simple space X (in particular a connected H-space) the integral homology groups H_i(X; ℤ), i ≥ 1, are all finitely generated if and only if the homotopy groups π_i(X), i ≥ 1, are; used to pass from the finitely generated homology of BQ(P(R)) to K_n(R) = π_{n+1} BQ(P(R)) in N.3:finite-generation/quillen-finiteness-criterion (with the rational Hurewicz theory of the same owner, RT-AREA-ktheory-1/33). H.6 → N.3:finite-generation is a new atlas edge; it is acyclic. Needed by: `ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two`, `ArithmeticKTheory:N.5/the-real-case-modulo-eight`, `ArithmeticKTheory:N.6/even-groups-at-odd-primes`, `ArithmeticKTheory:N.6/the-two-primary-corrections`, `ArithmeticKTheory:N.3:finite-generation/quillen-finiteness-criterion`.

- **`StableHomotopyKTheory:H.1`** — Nerves of small categories and posets with their realisations, homotopies from comparable monotone maps, compatibility with finite products and with increasing unions of subcategories (homology commuting with the union), and the comparison of the homology of a one-object groupoid with local coefficients with group homology (H.1's text: 'Construct local coefficient systems and the comparison of bar homology with singular homology of BG'). Used by Quillen's rank filtration and its spectral sequence, and for the H-space structure on BQ(P(R)) given by direct sum. H.1 → N.3:finite-generation is a new atlas edge; it is acyclic. Needed by: `ArithmeticKTheory:N.3:finite-generation/rank-filtration`, `ArithmeticKTheory:N.3:finite-generation/layer-poset-is-the-suspended-building`, `ArithmeticKTheory:N.3:finite-generation/rank-spectral-sequence`, `ArithmeticKTheory:N.3:finite-generation/quillen-finiteness-criterion`.

## Structural proposals

### N.1's two computations are imports, and the stage text should name their owners

*note-duplicate-boundary*

N.1's text says 'Import Z and U' for its two computations, and AUDIT-27 confirms that KTheoryLowDegrees Z.4 and U.4 own them. What N.1 owns is the carrier: the S-integers as a localisation of the ring of integers for a NUMBER FIELD, the independence of the presentation and the monotonicity in S, none of which is pinned; Tau Ceti's SInteger/Basic.lean says the S-integers are not in general a localisation of R. The stage text should name the two owners explicitly, as the other layers of this roadmap do, so that a reader does not plan the computations here. (Title corrected: N.1 is not a register; it owns the carrier theorems.)

### The totally imaginary hypothesis is a cohomological-dimension hypothesis and should be named as one

*note-hypothesis-boundary*

N.5's odd-torsion node and N.6's even-groups node hold at the prime two only when the field is totally imaginary, because then the étale 2-cohomological dimension of O_S[1/2] is two; with a real embedding it is infinite (source: proof of VI.8.2, 'the étale ℓ-cohomological dimension of R (and of F) is 2, unless ℓ = 2 and r1 > 0', and the opening of VI.9). N.6's text speaks of 'real-place ... corrections' and N.5's text gives the r_1 > 0 table without the reason; both should say that the corrections are forced by the cohomological dimension, which is what explains the eight-fold tables.

### Soulé's odd isomorphism is proved in N.5, not N.2

*ownership*

N.2's text ('In particular the odd-degree isomorphism for n≥3 is an additional theorem') and N.5's ('Prove K_{2j−1}(O_{F,S}) ≅ K_{2j−1}(F) for j≥2') both name it. Its proof (V.6.8, PDF p. 420: 'the fact that Kn(R) is finitely generated (IV.6.9)') needs N.3:finite-generation, which requires N.2 in the atlas, so a proof in N.2 closes the stage cycle N.2 → N.3:finite-generation → N.2. The theorem is planned as N.5/soule-theorem with its finite-coefficient input N.5/soule-mod-l-surjectivity; N.2 keeps the injectivity it can prove from its own inputs (N.2/even-degree-injectivity). N.2's text should point to N.5 for the odd-degree theorem. The N.3 nodes avoid Soulé's theorem for the same reason, and the former restatement N.5/odd-groups-of-ring-and-field-agree is removed in favour of N.5/soule-theorem.

### The tame-kernel sequence is K2SymbolsBrauer T.5's, and N.2 imports it

*ownership*

N.2's text ('Derive the tame-kernel exact sequence ... from this one construction') and T.5's ('Prove 0 → K₂(O_F) → K₂(F) → ⊕ k(𝔭)^× → 0 ... For S-integers allow residues at S') both name it. RT-AREA-ktheory-1/9 (confirmed) makes T.5 the single owner of the degree-two tame-kernel sequences with their injectivity and surjectivity, and RT-AREA-ktheory-1/26 makes T.5 derive them from K2SymbolsBrauer T.3:localization-comparison and KTheoryLowDegrees U.4 rather than from N.2. N.2/the-three-classical-rows and N.2/even-degree-injectivity now import T.5/tame-kernel-sequence and T.5/s-integer-tame-kernel-sequence (edge T.5 → N.2). This reverses the earlier direction N.2 → T.5; it is acyclic because T.5's nodes no longer list ArithmeticKTheory:N.2 as a prerequisite (the K2SymbolsBrauer side of the same findings, which also adds T.3/dedekind-localization-boundary and T.5/relative-s-integer-sequence).

### The localisation presentation of O_{F,S} is N.1's; KTheoryLowDegrees Z.4 uses Set.integer

*ownership*

KTheoryLowDegrees Z.4's coverage lists as remaining 'Decompose actual localization, its class-group quotient by inverted prime classes, the number-field S-integer ring identification, and extension of number fields'. N.1's text owns 'independence of a chosen presentation of O_{F,S} as a localisation and compatibility with enlarging S', and Z.4 is upstream of N.1, so Z.4 should specialise its K₀ theorem to Mathlib's Set.integer (a Dedekind domain by Tau Ceti) with the class-group quotient taken from Tau Ceti's integerClassGroupEquiv, and not re-plan the presentation.

### BorelRegulators R.3 and N.3:ranks both claim the S-integer rank formula

*note-duplicate-boundary*

R.3's text: 'Include the commutative order and S-integer cases via the appropriate comparison/localisation results.' N.3:ranks's text: 'Apply R's independent stable cohomology theorem to deduce, for n≥2, rank K_n(O_{F,S}) = ...'. Confirmed as RT-AREA-ktheory-1/7: R.3 keeps Borel's rank theorem for orders, 𝓞_F included (K-book IV.1.17–1.18), and drops the S-integer case; N.3:ranks/borel-rank-theorem owns the passage from 𝓞_F to 𝓞_{F,S} through N.2's localisation sequence and L.1, with the degree-one S-unit exception (U.4). The localisation input is upstream of N.3:ranks and not among R.3's requirements, so no edge is added backwards into R.3.

### SpecialValuesBirchTate B.1 re-plans W_2(F) and its finiteness

*note-duplicate-boundary*

B.1's text: 'define W_2(F)=H^0(F,Q/Z(2)), w_2(F)=#W_2(F). Use N's actual cyclotomic Galois module ... Prove finiteness and positivity of w₂. Use ... K₂(O_F) ... and its finiteness theorem.' Confirmed as RT-AREA-ktheory-1/10. The owners are N.4 (N.4/the-w-invariant, N.4/finiteness-of-the-w-invariant — finiteness and positivity —, N.4/computing-w-from-the-cyclotomic-character, N.4/two-primary-w-invariant) and N.3:ranks for the finiteness of K₂(𝓞_F) (N.3:ranks/even-K-groups-of-S-integers-are-finite). Proposal: add the atlas edges ArithmeticKTheory:N.4 → SpecialValuesBirchTate:B.1 and ArithmeticKTheory:N.3:ranks → B.1 (both acyclic) and have B.1 import those nodes instead of re-planning them. W₂ is the invariants of ℚ/ℤ(2), not the roots of unity of F.

### The e-invariant and the Harris–Segal summand belong to N.5

*note-move*

The packet planned the e-invariant inside N.4/the-w-invariant and the Harris–Segal theorem inside N.4/exceptional-fields-at-two. Both are K-theory (they need K_{2i−1}(F) and Suslin's computation of the torsion of K_*(F^s)), N.4's only atlas requirement is MotivicEtaleKTheory M.1, and N.5's text is the one that names 'the e-invariant/Chern maps'. They are now N.5/e-invariant and N.5/harris-segal-summand, and N.4 contains no K-theory.

### Theorems VI.8.2 and VI.8.4 are split by degree between N.5 and N.6

*ownership*

N.6 lies downstream of N.5 (N.6/the-two-primary-corrections imports N.5), but the proofs of N.5's tables use the odd rows of Theorem VI.8.2, which the packet had placed in N.6 without listing them as prerequisites. The odd rows are now N.5/odd-torsion-at-a-prime-where-cd-is-two and the even row stays in N.6/even-groups-at-odd-primes (the source proves them by two separate spectral-sequence arguments, with ℚ_ℓ/ℤ_ℓ and with ℤ_ℓ coefficients). Theorem VI.8.4 is split likewise: its odd row is N.5/totally-imaginary-integral-structure, its even row N.6/even-groups-of-a-totally-imaginary-field, and its rows n = 0, 1 are N.1's.

### The mod-2^∞ K-theory of real S-integers is MotivicEtaleKTheory M.7's

*ownership*

Theorem VI.9.4 (with Lemma VI.9.3 and the spectral sequences of ℝ) is the 'corrected long exact sequences and extension data at 2 with real places' of M.7's text, and AUDIT-27 records M.7 as the owner of N.5's real two-primary calculation. N.5 and N.6 import it through the M.7 request, stated there in full, and do the passage to the integral groups (Theorems VI.9.5(b) and VI.9.11).

### The certificate engine is N.6's; K2SymbolsBrauer T.5 supplies the tame kernel it is applied to

*ownership*

RT-AREA-ktheory-1/9 (confirmed, with the verifier's correction 'Keep the certificate engine and its independent upper/lower bounds in N.6, and remove the competing certificate-proof obligation from T.5') reverses the earlier arrangement, in which the format was T.5/certified-presentation and N.6 only added the cohomological lower bound. N.6 now owns the format (N.6/order-certificate, with the API and tests of the former T.5 node, on Mathlib's Module.Relations and Module.Presentation) and its cohomological lower bound in every even degree (N.6/certificate-driven-computation); T.5 → N.6 supplies the tame kernel group and sequence, not a second certificate engine; N.8 instantiates N.6's engine. T.5's paragraph 'Give certified finite presentations ...' and the node T.5/certified-presentation should be removed on the K2SymbolsBrauer side. Tau Ceti's ExactK0 presentation is not cited: it presents a Grothendieck group, not an arbitrary abelian group.

### The tame kernel is K2SymbolsBrauer T.5's; N.6 owns the wild kernel and the divisible subgroup

*ownership*

N.6/tame-and-wild-kernels bundled the tame kernel, the wild kernel, the divisible subgroup and the comparison theorem in one definition node. The tame kernel is T.5/unramified-subgroup with T.5/tame-kernel-sequence and is imported; the node is re-scoped to the wild kernel (id kept), and the divisible subgroup (N.6/divisible-subgroup) and the comparison (N.6/divisible-subgroup-and-the-wild-kernel) are separate nodes. The subgroup of divisible elements of an abelian group is a general notion absent from Mathlib (which has only DivisibleBy); it is planned in its general form and could move to a foundational owner. RT-AREA-ktheory-1/9 confirms the split: N.6 keeps the wild kernel, the comparisons with divisible subgroups and Selmer/cohomological kernels, and the cohomological order computations in every even degree.

### Two stage cycles removed: N.2 ↔ K2SymbolsBrauer T.5, and N.4 ↔ SpecialValuesBirchTate B.2/B.3

*ownership*

N.2/the-three-classical-rows listed K2SymbolsBrauer:T.5 as a prerequisite while the reviewed T.5 (PR #2893) imports N.2's localisation sequence (T.5/tame-kernel-sequence, T.5/s-integer-tame-kernel-sequence): the cycle N.2 → T.5 → N.2, which in the atlas-plus-packet graph also passed through N.3, N.5 and N.6. The prerequisite is dropped; the degree-two row is exported to T.5 (if the boundary–tame-symbol identification is wanted in N.2, K2SymbolsBrauer T.3/localization-boundary is upstream and acyclic). N.4/w2-of-the-rationals-and-the-divisibility-tests listed SpecialValuesBirchTate:B.3, but the atlas has N.4 → B.2 → B.3; the prerequisite and the B.3 request are dropped, and B.3 consumes N.4's w_2(ℚ) = 24. Update (fix of RT-AREA-ktheory-1/9 and /26): the N.2–T.5 pair is now resolved the other way, with T.5 → N.2 (see 'The tame-kernel sequence is K2SymbolsBrauer T.5's, and N.2 imports it'); T.5 no longer imports N.2, so it is acyclic. With the current node prerequisites of the K2SymbolsBrauer packet, T.3:localization-comparison → N.2 closes no cycle either: T.2/graded-map-degree-three no longer imports K3BlochGroups V.2.

### K3BlochGroups V.2 imports N.3 and N.5, which closes cycles with other packets

*note-external-cycle*

K3BlochGroups:V.2/k3-rank-borel lists ArithmeticKTheory:N.5 (for K_3(O_F) ≅ K_3(F)), N.3:ranks and N.3:finite-generation as prerequisites, although the atlas has N.5 → K3BlochGroups V.6, not V.2. With all packets on main this closes two loops. (1) N.5 → MotivicEtaleKTheory M.8 (this packet's import for the natural Chern maps) → BorelRegulators R.7 → Polylogarithms P.2 → K3BlochGroups V.3 → V.2 → N.5. (2) Through K2SymbolsBrauer's T.1 packet, where T.2/graded-map-degree-three uses V.2: N.2 → K2SymbolsBrauer T.3:localization-comparison → T.2:graded-map → V.2 → N.3:finite-generation → N.2. This packet removed its edge of (2): N.2/the-three-classical-rows no longer imports T.3/localization-boundary. The rest lies in the K3BlochGroups packet. V.2 needs only the rank of K_3 of the field, which Borel's theorem for fields (K-book IV.1.18 with A = F; BorelRegulators R.3) gives without N.3 or N.5, so re-routing V.2/k3-rank-borel to R.3 breaks both loops. Update 2026-09-30: loop (2) no longer closes, since K2SymbolsBrauer T.2/graded-map-degree-three now imports only T.2/graded-map; loop (1) still does.

### The arithmetic-group input to Quillen's theorem is BorelRegulators R.1's

*ownership*

RT-AREA-ktheory-1/1 (confirmed, with the verifier's essential correction): Quillen's proof needs the Tits building, the Solomon–Tits theorem, the Steinberg module and the integral finiteness of the Steinberg homology of arithmetic groups, which comes from Borel–Serre duality with the correctly twisted dualizing module St_n(F) ⊗ ℤ_χ^{⊗(n−1)}, χ = N_{F/ℚ} ∘ det (Putman–Studenmund, Theorem C), or from descent from a torsion-free subgroup in ker χ — not from a 'finite-type homotopy' of arithmetic groups, St_n(F) being free of infinite rank. R.1 is the single owner of that package (request); N.3:finite-generation keeps the rank filtration of Q(P(A)), its spectral sequence, the commensurability of Aut(P) with GL_n(𝓞_F) for nonfree P, the low ranks, the assembly and the finite-S localisation step. Proposal for the stage texts: delete N.3's clause 'Develop the arithmetic-group finiteness and finite-type homotopy input in Quillen's proof, with the relation to stable general linear groups' and let R.1's 'Prove the finite-type homotopy consequences needed by K-theory' read 'Prove the integral finiteness of the Steinberg homology of arithmetic subgroups of GL_n needed by K-theory'.

## Mistakes found in the source

The packet's `sourceIssues` record, with the reasons and the searches for existing corrections; the nodes use the corrected statements.

- **ArithmeticKTheory/E1** (misprint, affects nothing) — III.2.5 (Bass–Milnor–Serre), PDF p. 202 (book p. 194). Printed: “Theorem 2.5 (Bass-Milnor-Serre). Let R be an integrally closed subring of a number field F, and I an ideal of R. Then (1) If F has any embedding into ℝ then SK1(R, I) = 0. … The exponent ord_p n of p in the integer n is the minimum over all prime ideals 𝔭 of R containing I of the integer” Correction: I should be a nonzero ideal (and the formula in (2) read for I ≠ R); for I = R the theorem is SK₁(R) = 0, as III.1.3.6 states.
- **ArithmeticKTheory/E2** (misprint, affects nothing) — V.6.6, Dedekind Domains, PDF p. 417 (book p. 409). Printed: “Then R and F and regular, as are the residue fields R/𝔭” Correction: Then R and F are regular, as are the residue fields R/𝔭
- **ArithmeticKTheory/E3** (misprint, affects nothing) — V.6.6.1, the paragraph after (6.6.1), PDF p. 417 (book p. 409). Printed: “In this case, we know that ∂ in K∗(R)-linear” Correction: In this case, we know that ∂ is K∗(R)-linear
- **ArithmeticKTheory/E4** (gap, affects the proof) — V.6.8, proof of Theorem 6.8, PDF p. 420 (book p. 412). Printed: “From the computation of Kn(Fq) in IV.1.13 and the fact that Kn(R) is finitely generated (IV.6.9), we see that SKn(R) is 0 for n > 0 even, and is finite for n odd.” Correction: For R not of finite type over ℤ or 𝔽_q the finite generation of K_n(R) is not supplied by IV.6.9; reduce to that case by writing R as the filtered union of rings of S-integers with S finite (ℤ_(p) = colim ℤ[1/N], p ∤ N) and using that K_* and the kernel SK_n commute with filtered colimits.
- **ArithmeticKTheory/E5** (error, affects nothing) — V.6.8, the remark after Proposition 6.8.1, PDF p. 420 (book p. 412). Printed: “The conclusion of 6.8.1 is false for n = 1. Indeed, the kernel of K0(R) → K0(F) is the finite group Pic(R), so K1(F; Z/ℓ) → ⊕K0(R/𝔭; Z/ℓ) is not onto.” Correction: The conclusion of 6.8.1 can fail for n = 1: the cokernel of ∂ : K₁(F; ℤ/ℓ) → ⊕K₀(R/𝔭; ℤ/ℓ) is Pic(R)/ℓ, so ∂ is onto exactly when Pic(R)/ℓ = 0.
- **ArithmeticKTheory/E6** (misprint, affects nothing) — V.6.8.1, proof, second paragraph, PDF p. 421 (book p. 413). Printed: “then multiplication by β^{i−1} induces an isomorphism ⊕Z/ℓ ≅ ⊕K1(R/𝔭)/ℓ → ⊕K2i−1(R/𝔭) by IV.1.13. That is, every element of ⊕K2i−1(R/𝔭) has the form β^{i−1}a for a in ⊕K1(R/𝔭). … Lifting a to s ∈ K2(F), the element x = β^{i−1}s of K2i(F; Z/ℓ) satisfies ∂(x) = β^{i−1}∂(x) = β^{i−1}a, as desired.” Correction: Multiplication by β^{i−1} is an isomorphism ⊕K₁(R/𝔭)/ℓ → ⊕K_{2i−1}(R/𝔭; ℤ/ℓ), every element of ⊕K_{2i−1}(R/𝔭; ℤ/ℓ) has the form β^{i−1}a, and ∂(x) = β^{i−1}∂(s) = β^{i−1}a.
- **ArithmeticKTheory/E7** (error, affects a stated result) — V.6.8.2, Wild Kernels 6.8.2 (PDF p. 421; book p. 413), in the author-hosted combined draft of 29 August 2013. Printed: “In fact, divK2i(F) is isomorphic to the wild kernel, defined as the intersection (over all valuations v on F) of the kernels of all maps K2i(F) → K2i(Fv). This is proven in [225].” Correction: div K_{2i}(F) is a subgroup of the wild kernel of index at most two; they are equal when i is even or F is not special, and div K_{2i}(F) has index two in the wild kernel when i is odd and F is special (Hutchinson's condition). For K_2, div K_2(F) ≠ WK_2(F) exactly when F is special.
- **ArithmeticKTheory/E8** (misprint, affects nothing) — VI.2.1.1, Example 2.1.1, PDF p. 478 (book p. 470), author-hosted draft of 29 August 2013. Printed: “It is a pleasant exercise to show that w_i(F_q) = q^i − 1 for all i.” Correction: ... for all i ≥ 1 (and w_{−i} = w_i; W_0(F_q) is infinite).
- **ArithmeticKTheory/E9** (error, affects a stated result) — VI.2.1.2, Example 2.1.2, PDF p. 478 (book p. 470), author-hosted draft of 29 August 2013. Printed: “w_10 = 1320 = 2^3 · 3 · 5 · 11” Correction: w_10(Q) = 264 = 2^3 · 3 · 11.
- **ArithmeticKTheory/E10** (misprint, affects nothing) — VI.2.1.3, Remark 2.1.3, PDF p. 478 (book p. 470), author-hosted draft of 29 August 2013. Printed: “Since the map from π_{8k+3}(BO) = Z to π_{8k+3}(BU) = Z has image 2Z” Correction: Since the map from π_{8k+4}(BO) = Z to π_{8k+4}(BU) = Z has image 2Z
- **ArithmeticKTheory/E11** (misprint, affects nothing) — VI.2.2.1, proof of Lemma 2.2.1, PDF p. 479 (book p. 471), author-hosted draft of 29 August 2013. Printed: “ζ^{⊗i} is invariant under all of G precisely when the group Gal(F(ζ_{ℓ^ν})/F) has exponent i.” Correction: ... precisely when the group Gal(F(ζ_{ℓ^ν})/F) has exponent dividing i.
- **ArithmeticKTheory/E12** (misprint, affects nothing) — VI.2, the paragraph after Example 2.2.2, PDF p. 479 (book p. 471), author-hosted draft of 29 August 2013. Printed: “Aut(µ_{2^ν}) = (Z/2^ν)^× contains two involutions if ν ≥ 3.” Correction: (Z/2^ν)^× contains three involutions (−1 and 2^{ν−1} ± 1) if ν ≥ 3; the point is that it is not cyclic.
- **ArithmeticKTheory/E13** (error, affects nothing) — VI.2, the paragraph after Proposition 2.3, PDF p. 479 (book p. 471), author-hosted draft of 29 August 2013. Printed: “Both R and Q_2 are exceptional, and so are each of their subfields.” Correction: Q_2 and its subfields are exceptional, and so is every number field embeddable in R; R itself is non-exceptional under the definition given (as is the infinite subfield Q(ζ_{2^∞})^+ of R).
- **ArithmeticKTheory/E14** (misprint, affects a stated result) — VI.8.1, Classical Data 8.1 (PDF p. 521; book p. 513); published GSM 145, p. 564. Printed: “The formulas for K0(OS) = Z ⊕ Pic(OS) and K1(OS) = O×S ≅ Zr2+|S|−1 ⊕ µ(F) are different;” Correction: K_1(O_S) = O_S^× ≅ ℤ^{r_1+r_2+|S|−1} ⊕ μ(F).
- **ArithmeticKTheory/E15** (misprint, affects a stated result) — VI.8.1, Classical Data 8.1, PDF p. 521 (book p. 513), author-hosted draft of 29 August 2013. Printed: “By Chapter IV, 1.18 and 6.9, the groups K_n(F) are finite when n is even and nonzero” Correction: ... the groups K_n(O_S) are finite when n is even and nonzero; the groups K_n(F) are infinite torsion groups for even n > 0.
- **ArithmeticKTheory/E16** (error, affects a stated result) — VI.8.1, the sequence (8.1.1) (PDF p. 521; book p. 513). Printed: “The Brauer group of OS is determined by the sequence 0 → Br(OS) → (Z/2)r1 ⊕ ∐v∈S finite (Q/Z) add −→ Q/Z → 0.” Correction: The sum map is onto Q/Z only when S contains a finite place; for S = ∅ the sequence is 0 → Br(O_F) → (ℤ/2)^{r_1} → ℤ/2 (onto if r_1 > 0), i.e. Br(O_F) ≅ (ℤ/2)^{max(r_1 − 1, 0)}.
- **ArithmeticKTheory/E17** (misprint, affects nothing) — VI.8.2, proof (PDF p. 521; book p. 513). Printed: “Set R = OS[1/ℓ]. For each prime ideal p over ℓ, Kn−1(R/p) has no ℓ-torsion by IV.1.13.” Correction: K_{n−1}(O_S/𝔭) (the residue field of O_S at 𝔭; the argument also needs K_n(O_S/𝔭), which has no ℓ-torsion for the same reason).
- **ArithmeticKTheory/E18** (error, affects a stated result) — VI.8.6, Birch–Tate Conjecture 8.6, PDF p. 523 (book p. 515); also the remark after Theorem 8.7 on the same page, author-hosted draft of 29 August 2013. Printed: “If F is a number field, the zeta function ζ_F(s) has a pole of order r_2 at s = −1.” Correction: ζ_F(s) has a zero of order r_2 at s = −1 (and, after Theorem 8.7, a zero of order r_2 at s = 1 − 2k when F is not totally real).
- **ArithmeticKTheory/E19** (misprint, affects nothing) — VI.8.8, proof (PDF p. 524; book p. 516). Printed: “By Theorem 9.12 in the next section, the power of 2 on the right side equals |H2et(OF[1/ℓ], Z2(2k))|/|H1et(OF[1/ℓ], Z2(2k))|.” Correction: |H^2_et(O_F[1/2]; ℤ_2(2k))| / |H^1_et(O_F[1/2]; ℤ_2(2k))|.
- **ArithmeticKTheory/E20** (misprint, affects nothing) — VI.9.4, Theorem 9.4, row n = 8k (PDF p. 527; book p. 519). Printed: “Kn(OS; Z/2∞) ≅ Z/w4k(F) for n = 8k,” Correction: ℤ/w^{(2)}_{4k}(F), the two-primary part (for k = 0 the group is K_0(O_S; ℚ_2/ℤ_2) ≅ ℚ_2/ℤ_2).
- **ArithmeticKTheory/E21** (misprint, affects nothing) — VI.9.11, proof (PDF p. 532; book p. 524). Printed: “To determine the two-primary subgroup Kn(OS){2} of the finite group K2i+2(OS) when n = 2i + 2, … we note that H1(OS, Z/2∞(i)) is the direct sum of (Z/2∞)r and a finite group, which must be H2(OS, Z2(i))” Correction: With n = 2i + 2 the group compared with K_{2i+3}(O_S; ℤ/2^∞) is H^1(O_S; ℤ/2^∞(i+2)), whose finite part is H^2(O_S; ℤ_2(i+2)).
- **ArithmeticKTheory/E22** (misprint, affects nothing) — VI.9.11, proof (PDF pp. 532–533; book pp. 524–525). Printed: “Since α1S(i) : H1(R; Z2(i)) → (Z/2)r1 must vanish on the divisible group (Z/2∞)r,” Correction: α^1_S(i) : H^1(R; ℤ/2^∞(i)) → (ℤ/2)^{r_1}; the divisible subgroup (ℤ/2^∞)^r lies in H^1 with ℚ_2/ℤ_2 coefficients, whose finite part is H^2(R; ℤ_2(i)).
- **ArithmeticKTheory/E23** (misprint, affects the proof) — VI.9.12, proof (PDF p. 533; book p. 525). Printed: “By Theorems 8.2 and 9.11, the ℓ-primary subgroup of K2i−2(OS) has order h2,i(ℓ) for all ℓ, except when ℓ = 2 and 2i−2 ≡ 6 (mod 8) when it is h1,i(2)/2r1.” Correction: … when it is h^{2,i}(2)/2^{r_1}.
- **ArithmeticKTheory/E24** (gap, affects the proof) — VI.9.12, proof (PDF p. 533; book p. 525). Printed: “Write hn,i(ℓ) for the order of Hnet(OS[1/ℓ]; Zℓ(i)). By Ex. 8.3, h1,i(ℓ) = w(ℓ)i(F).” Correction: The identity h^{1,i}(2) = w_i^{(2)}(F), used for ℓ = 2, needs its own argument: for F totally real and i even, H^1(O_S[1/2]; ℤ_2(i)) is finite (rank r_2 = 0) and H^0(O_S[1/2]; ℤ_2(i)) = 0, so the Bockstein sequence gives H^1(ℤ_2(i)) ≅ H^0(ℚ_2/ℤ_2(i)) = ℤ/w_i^{(2)}(F).

## What this blueprint does not claim

No Lean was compiled for this revision. Every `implementationStatus` is `unchecked`, the suggested Lean file is a naming proposal whose proofs are all `sorry` and whose statements needing carriers that the pins lack are recorded as comments, and nothing here is claimed to be formalised.

This document was re-rendered from the packet in the fix of RT-AREA-ktheory-1 (2026-09-30). The previous text described an earlier, pre-review version of the packet (it named nodes the reviewed packet had deleted or merged, such as `N.2/soule-odd-isomorphism` and `N.3:finite-generation/the-two-inputs-and-their-owners`), so the sections of every layer now follow the packet node by node.
