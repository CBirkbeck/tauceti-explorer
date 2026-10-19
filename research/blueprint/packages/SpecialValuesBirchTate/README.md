# Roadmap: Birch–Tate and special values of Dedekind zeta functions at negative integers

This roadmap states and proves the Birch–Tate formula ζ_F(−1) = (−1)^{[F:ℚ]}·#K₂(𝓞_F)/w₂(F) for every totally real number field F, and the special-value formulas around it. It starts from the continued Dedekind zeta function, the classical K₂ of a ring, the even K-groups of rings of integers with their comparison to étale cohomology, the twisted roots of unity W_n(F) = H⁰(F, ℚ/ℤ(n)), and the main conjectures of Iwasawa theory, all of which other roadmaps build. On top of them it develops the analytic side (the sign and rationality of ζ_F(1 − n) for even n, its vanishing at −1 when F has a complex place, Deligne–Ribet integrality of w_n(F)ζ_F(1 − n), and the reconstruction of a positive rational number from its prime valuations), two independent numerical checks (ℚ and ℚ(√5)), the S-integral form with its Euler factors, the odd-primary theorem of Wiles through étale Euler characteristics in every even weight, the 2-primary part for totally real abelian fields by Kolster's reduction to Federer's main conjecture and Greither's theorem, the 2-primary part for every totally real field from Kurihara's determinant main conjecture at p = 2 through Kolster's cohomological argument, and the higher special values: the Lichtenbaum formulas at negative integers, their proof for totally real fields in every even weight, the real-place correction at 2 and the equivariant Tamagawa-number statement for Tate motives.

**Summary.** The end theorem is `TauCeti.BirchTate.birchTateFormula_of_isTotallyReal` (§7.4: the Birch–Tate formula for every totally real F). On the way the roadmap proves the odd-primary identity `padicValNat_card_K2_odd` (§5.3, Wiles), the full formula for totally real F abelian over ℚ by the classical route, `birchTateFormula_of_isAbelianGalois` (§6.6, Kolster–Federer–Greither), the 2-primary identity `padicValNat_two_card_K2_of_isTotallyReal` (§7.3, Kurihara), Federer's conjecture for every totally real field `federerMainConjecture_of_isTotallyReal` (§7.5), the S-integral formula `birchTateFormula_iff_sInteger` (§4.4), and in every even weight n = 2k the formula ζ_F(1 − n) = (−1)^{k r₁}·2^{r₁}·#K_{2n−2}(𝓞_F)/#K_{2n−1}(𝓞_F) for every totally real F, `higherLichtenbaum_of_isTotallyReal` (§8.5), with its cohomological form |ζ_F(1 − n)| = h_n(F)/w_n(F) (§8.3). The definitions are the predicate `BirchTateFormula` (§1.1), the quadratic character `chiFive` (§3.2), the Euler-factor deletion `sEulerFactor` and the S-modified zeta function `sModifiedZeta` (§4.1), Kolster's 2-adic zeta series and Federer's predicate `FedererMainConjecture` (§6.1), the cohomological order `hInvariant` (§8.1), the motivic regulator covolume and the two Lichtenbaum predicates (§8.2), and the Tate-motive Tamagawa statement `TateMotiveETNC` (§8.6). Every sign, twist and normalisation is pinned by a computed witness over ℚ, and ℚ(√5) is an independent check: ζ_{ℚ(√5)}(−1) = 1/30, w₂(ℚ(√5)) = 120 and #K₂(𝓞_{ℚ(√5)}) = 4.

`README.md` is normative. `Suggested.lean` records the light definitions and the theorem signatures that can be stated against the pinned libraries, with the `example` checks named below; it is not exhaustive, and its docstrings cite the subsections of this file as §k.n. New declarations are proposed under the prefix `TauCeti.BirchTate`; in `Suggested.lean` the statable ones live in the namespace `TauCetiRoadmap.SpecialValuesBirchTate`. Every definition comes with the API it needs and with checks that a plausible wrong definition fails; every theorem carries its exact hypotheses, its source, and the earlier statements or library declarations it rests on. Nothing here is optional.

## Scope and ownership

The roadmap owns:

- the Birch–Tate predicate for an arbitrary number field, with its multiplicative, absolute-value and primewise forms, the nonvanishing it forces, and its failure for fields with a complex place (Layers 1–2);
- the analytic consequences of the functional equation that the arithmetic needs: the regular values of the real archimedean factor at negative odd and positive even integers, the positivity of ζ_F on the real half-line σ > 1, the sign, rationality and nonvanishing of ζ_F(1 − n) for totally real F and even n ≥ 2, and the specialisation of Deligne–Ribet integrality to w_n(F)ζ_F(1 − n) ∈ ℤ (Layer 2);
- the reconstruction of a positive rational number from its prime valuations and its use to split the formula into a sign and one identity per prime (Layer 2);
- the two independent examples: Birch–Tate for ℚ from ζ(−1) = −1/12, K₂(ℤ) ≅ ℤ/2 and w₂(ℚ) = 24, and the check for ℚ(√5) from L(−1, χ₅) = −2/5, w₂(ℚ(√5)) = 120 and the certified order #K₂(𝓞_{ℚ(√5)}) = 4 (Layer 3);
- the deletion of Euler factors at a finite set of primes, the S-modified zeta function at negative integers, the order of K₂ of a ring of S-integers, the S-integral formula, its compatibility with enlarging S, and the naturality of the arithmetic comparisons under change of S (Layer 4);
- at odd primes: Galois codescent for extensions of degree prime to ℓ, the étale form of the special-value formula for L_S(1 − n, χ) (Kolster's Theorem 3.3), and Wiles's odd-primary Birch–Tate theorem (Layer 5);
- Kolster's 2-adic reduction for totally real fields: the 2-adic zeta series, Federer's predicate, Kolster's exact sequence for the 2-Sylow subgroup of K₂ and his Theorem 1, Lemma 2 and Theorem 5, the second-kind twist in Greither's variable, the comparison of the norm-kernel minus module with the quotient by 1 + j, Federer's conjecture for totally real abelian fields and Birch–Tate for those fields (Layer 6);
- the modern 2-adic route: Kurihara's characteristic ideal over F, the 2-adic special values in every even weight, the 2-part of Birch–Tate for every totally real field, the end theorem, and the comparison with Kolster's formulation including Federer's conjecture for every totally real field (Layer 7);
- the higher special values: the cohomological order h_n(F), the motivic regulator covolume, the K-theoretic (odd part) and motivic Lichtenbaum predicates, their proof for totally real fields in even weight, the real-place correction at 2, and the Tate-motive specialisation of the equivariant Tamagawa-number statement (Layer 8).

It leaves to named roadmaps:

- the continued and completed Dedekind zeta functions, the functional equation Λ_F(1 − s) = Λ_F(s), uniqueness of meromorphic continuation, the comparison card for ℚ and the factorisation of the Dedekind zeta function of a quadratic field into ζ·L(χ_D) at the coefficient, convergent and continued levels, to **TauCetiRoadmap.LFunctions**, Layers 3, 4 and 8;
- the exact order of vanishing of ζ_F at 1 − n, the leading coefficient ζ*_F(1 − n), the leading-term functional equation, the Borel regulator and its covolume, Borel's rational proportionality and the factor two between the Borel and Beilinson regulators, to **TauCetiRoadmap.BorelRegulators**, Layers R.4, R.5 and R.7;
- classical K₂ of a ring, Steinberg symbols, the tame symbol and the relative localisation sequence for S-integers, and K₂(ℤ) ≅ ℤ/2, to **TauCetiRoadmap.K2SymbolsBrauer**, Layers T.1 and T.5;
- the localisation sequence of a Dedekind domain, finite generation, Borel's ranks and finiteness of the even K-groups of S-integers, the invariants w_i(F) with their computation from the cyclotomic character, the e-invariant, the identification of the ℓ-primary even K-groups with étale H² (with Rognes–Weibel's two-primary corrections), the order ratio 2^{r₁}#K_{2i−2}/#K_{2i−1} = ∏#H²/∏#H¹ for totally real fields, the order certificates, and the certified tame kernel of ℚ(√5), to **TauCetiRoadmap.ArithmeticKTheory**, Layers N.2–N.8;
- Quillen's computation of the K-groups of finite fields, to **TauCetiRoadmap.KTheoryFiniteLocalFields**, Layer L.1;
- the finite generation, ranks and torsion of the ℓ-adic cohomology of rings of S-integers (H¹ torsion = W_n(F){ℓ} for n ≠ 0), Tate's degree-two Galois-symbol comparison for S-integers and its residue compatibility, the Quillen–Lichtenbaum comparison, and the integral motivic groups with their Chern classes and regulators, to **TauCetiRoadmap.MotivicEtaleKTheory**, Layers M.2, M.3, M.7 and M.8;
- Iwasawa modules of cyclotomic towers, weak Leopoldt and the absence of finite submodules, the minus modules at p = 2 with Federer's theorem, the Deligne–Ribet dictionary to power series, twisted coinvariant descent and coinvariant evaluation, Wiles's main conjecture at odd primes and its special-value endpoint, the compact-support complexes, Kurihara's determinant main conjecture at every prime and its characteristic-ideal form, the classical–modern module dictionary at p = 2 and the Ferrero–Washington theorem, to **TauCetiRoadmap.IntegralIwasawaTheory**, Layers I.1–I.5, I.8–I.10 and L4;
- the Deligne–Ribet p-adic L-functions of totally real fields with their interpolation and integrality, to **TauCetiRoadmap.AutomorphicPadicLFunctions**, Layer L3; the Kubota–Leopoldt functions to **TauCetiRoadmap.DirichletPadicLFunctions**, Layer L2; Greither's main conjecture for abelian fields at every prime to **TauCetiRoadmap.EulerSystemsCyclotomicMainConjecture**, Layer L4; Weierstrass theory and characteristic ideals over ℤ_p⟦T⟧ to **TauCetiRoadmap.PadicMeasuresIwasawaAlgebras**, Layer 4;
- the Kronecker–Weber theorem, to **TauCetiRoadmap.ClassFieldTheory**, Layer 13, and abelian Chebotarev density, to **TauCetiRoadmap.Chebotarev**, Layer 9;
- regulator determinants and leading-term lines, integral fundamental lines and the equivariant Tamagawa-number conjecture, to **TauCetiRoadmap.PeriodsAndSpecialValues**, Layers PS.3–PS.5, with relative K₀ of an order to **TauCetiRoadmap.GeneralAlgebraicKTheory**, Layer K.5.

Already stated or built elsewhere, and therefore cited rather than stated here:

- The Dirichlet series of the S-modified function: Tau Ceti `TauCeti.LSeries_ofBadPrimes` (current Tau Ceti, `TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Restrict.lean`) proves that on Re s > 1 the L-series of the indicator of the ideals prime to a finite set S of primes is `dedekindZeta K s * ∏ P ∈ S, (1 - (Ideal.absNorm P.asIdeal : ℂ) ^ (-s))`, using `TauCeti.MultiplicativeIdealWeight.ofBadPrimes`; its continuation across Re s = 1 is `TauCeti.exists_differentiableOn_eq_LSeries_ofBadPrimes_sub` (`TauCeti/NumberTheory/NumberField/DedekindZeta.lean`). §4.1 uses exactly this product and adds only the continuation to the plane and the values at negative integers.
- The quadratic factorisation ζ_{ℚ(√5)} = ζ·L(χ₅), with the ideal count Σ_{d∣n} χ₅(d), is the case D = 5 of LFunctions Layer 4 ("factorization of Dedekind zeta for quadratic … fields at coefficient, convergent series, and continued-function levels"); §3.2 evaluates it at −1 and does not prove it again.
- The identification of the continued Dedekind zeta function of ℚ with Mathlib's `riemannZeta` is the K = ℚ comparison card of LFunctions (Layer 1, mandatory check `completedDedekindZeta ℚ` = `completedRiemannZeta`; Layer 8 comparison cards); §3.1 reads ζ_ℚ(−1) off it.
- The order of vanishing of ζ_F at −1 (r₂) and the leading-term functional equation are BorelRegulators R.5; §2.3 and §2.4 specialise them and do not repeat the gamma-factor argument.
- The arithmetic of ℚ(√5) itself (𝓞 = ℤ[(1 + √5)/2], discriminant 5, total reality, the fundamental unit, class number one, the splitting law by the residue of p modulo 5, the inertia degree two at 2): Tau Ceti `NumberField.adjoin_halfGen_eq_top_of_mod_four_eq_one` at the pin, and in current Tau Ceti the worked example `TauCeti.NumberField.Sqrt5` (`discr_eq_five`, `isTotallyReal`, `classNumber_eq_one`, `torsionOrder_eq_two`, `ncard_primesOver_eq_two_iff_mod_five`, `inertiaDeg_eq_two_of_mem_primesOver_two`), for a field generated by θ with `minpoly ℤ θ = X ^ 2 - X - 1`.
- The identification K₂(𝓞_F){ℓ} ≅ H²(𝓞_F[1/ℓ], ℤ_ℓ(2)) at every prime ℓ, including the passage from 𝓞_F to 𝓞_F[1/ℓ]: ArithmeticKTheory N.6 (even K-groups at odd primes; at ℓ = 2 the row n = 2 of its two-primary corrections), built on Tate's theorem in MotivicEtaleKTheory M.3. Layers 5 and 7 use it and do not prove it again.
- The torsion of H¹(𝓞_F[1/ℓ], ℤ_ℓ(n)) is H⁰(F, ℚ_ℓ/ℤ_ℓ(n)) = W_n(F){ℓ} for n ≠ 0, with the ranks from Tate's Euler characteristic formula: MotivicEtaleKTheory M.2 (ℓ-adic cohomology of S-integers).
- The Iwasawa computation behind Kolster's Theorem 3.3, v_ℓ(#X_ψ(−n)_Γ) = d_χ·v_ℓ(L_S(1 − n, χ)) + v_ℓ(#H⁰), is IntegralIwasawaTheory I.5 (special-value endpoint), with the descent to H² in I.4; §5.2 converts it into étale cohomology over F.
- The 2-adic formula ζ_F(1 − n) ∼₂ #H²/#H¹ for 𝓞_F[1/2], under the hypothesis that the 2-adic main conjecture holds for F and the trivial character, is stated in IntegralIwasawaTheory I.4 (dyadic statement) and, in weight two, I.10 (finite Euler-characteristic comparison); §7.2 discharges the hypothesis with Kurihara's theorem.
- The order ratio 2^{r₁}·#K_{2i−2}(𝓞_S)/#K_{2i−1}(𝓞_S) = ∏_ℓ #H²/∏_ℓ #H¹ for totally real fields, with Rognes–Weibel's two-primary corrections: ArithmeticKTheory N.6; §8.4 records only its 2-adic valuation in the form Layer 8 uses.
- The independent order K₂(ℤ) ≅ ℤ/2 (lower bound by the real sign symbol, upper bound by the integral generation theorem) is K2SymbolsBrauer T.5; the certified tame kernel K₂(𝓞_{ℚ(√5)}) ≅ (ℤ/2)², generated by {−1, −1} and {−1, ε} with both bounds, is ArithmeticKTheory N.8. Neither uses the Birch–Tate formula.

## Conventions

F is a number field, `[Field F] [NumberField F]`, of degree [F : ℚ] = `Module.finrank ℚ F`, with r₁ = `NumberField.InfinitePlace.nrRealPlaces F` real and r₂ = `nrComplexPlaces F` complex places, so r₁ + 2r₂ = [F : ℚ]; F is totally real when `NumberField.IsTotallyReal F`, and then r₂ = 0 and r₁ = [F : ℚ]. d_F = `NumberField.discr F` is the discriminant; it is never zero, so |d_F| ≥ 1. 𝓞_F is `𝓞 F`. A finite prime is v : `IsDedekindDomain.HeightOneSpectrum (𝓞 F)`, with norm Nv = `Ideal.absNorm v.asIdeal` = #(𝓞_F/v) ≥ 2. S is a finite set of finite primes, `Finset (HeightOneSpectrum (𝓞 F))`; it never contains archimedean places, and the archimedean gamma factors are never deleted. 𝓞_{F,S} is Mathlib's ring of S-integers `Set.integer`; 𝓞_F[1/ℓ] is the case S = S_ℓ, the primes above ℓ.

ζ_F denotes the continued Dedekind zeta function of LFunctions Layer 3 (`dedekindZetaC F`), meromorphic on ℂ with a single simple pole at s = 1 and equal to Mathlib's `NumberField.dedekindZeta F` on Re s > 1; Mathlib's function itself is an L-series and is never evaluated outside its half-plane of convergence. The completed function is

```text
Λ_F(s) = |d_F|^{s/2} · Γ_ℝ(s)^{r₁} · Γ_ℂ(s)^{r₂} · ζ_F(s),   Λ_F(1 − s) = Λ_F(s),
Γ_ℝ(s) = π^{−s/2} Γ(s/2) (`Complex.Gammaℝ`),   Γ_ℂ(s) = 2(2π)^{−s} Γ(s) (`Complex.Gammaℂ`),
```

as in LFunctions Layer 1 and BorelRegulators R.5. Mathlib's Γ is totalised (Γ(−k) = 0 at the poles), so no value of ζ_F at a pole of a gamma factor is computed by dividing Λ_F by that factor; such values come from BorelRegulators R.5 (exact order of vanishing and leading coefficient ζ*_F(1 − n)). For n ≥ 2, ζ*_F(1 − n) is the first nonzero Taylor coefficient of ζ_F at 1 − n, of exact order r₂ for even n and r₁ + r₂ for odd n.

K₂(R) is classical K₂ of a ring (the kernel of the stable Steinberg group onto the elementary group), K2SymbolsBrauer Layer T.1; it is functorial in ring maps. #A is `Nat.card A`, which is the order when A is finite and 0 when A is infinite; every use of #K₂ is accompanied by a finiteness statement (ArithmeticKTheory N.3) so the junk value never enters. W_n(F) = H⁰(F, ℚ/ℤ(n)), the n-fold Tate twist of the torsion of the multiplicative group of a separable closure, with the cyclotomic action, and w_n(F) = #W_n(F) (ArithmeticKTheory N.4, Lean name `TauCeti.wInvariant F n`); for n ≠ 0 it is finite and positive. W₂(F) is not the group of roots of unity of F: w₁(F) = `NumberField.Units.torsionOrder F` and w₂(ℚ) = 24 ≠ 2 = w₁(ℚ).

The sign convention of the formula is (−1)^{[F:ℚ]}, which equals (−1)^{r₁} for totally real F. After deleting the Euler factors at a finite set S of finite primes the sign is (−1)^{[F:ℚ] + |S|}, because each deleted factor contributes 1 − Nv^{1} = −(Nv − 1) at s = −1. The two-term witness that pins both conventions: for F = ℚ, ζ(−1) = −1/12 = (−1)¹·2/24; for F = ℚ and S = {(2)}, ζ_{ℚ,S}(−1) = (−1/12)(1 − 2) = 1/12 = (−1)^{1+1}·#K₂(ℤ[1/2])/24 with #K₂(ℤ[1/2]) = 2.

Valuations: v_ℓ is `padicValNat ℓ` on natural numbers and `padicValRat ℓ` on rationals; for rationals a and b, a ∼_ℓ b means v_ℓ(a) = v_ℓ(b), and for ℓ-adic numbers it means equal ℓ-adic valuation. A{ℓ} is the ℓ-primary subgroup of a finite abelian group A, and w_n^{(ℓ)}(F) = #W_n(F){ℓ}.

Iwasawa conventions at p = 2 (Kolster's normalisation, Layer 6). F₀ = F(√−1); e ≥ 2 is maximal with a primitive 2^e-th root of unity in F₀; F_n = F(ζ_{2^{n+e}}) and F_∞ = ∪F_n is the cyclotomic ℤ₂-extension of F₀, with maximal totally real subfield F_∞^+, the cyclotomic ℤ₂-extension of F. Γ = Gal(F_∞/F₀) ≅ Gal(F_∞^+/F) ≅ ℤ₂ with a topological generator γ₀, and u ∈ ℤ₂ˣ is defined by γ₀(ζ) = ζ^u on 2-power roots of unity, so u = 1 + 2^e ε with ε ∈ ℤ₂ˣ. Λ = ℤ₂⟦T⟧ with T = γ₀ − 1. The minus part of the 2-class group A_n of F_n is the kernel A_n^− of the (surjective) norm to F_n^+; at p = 2 it is never replaced by an eigenspace of complex conjugation. The Pontryagin dual of a discrete Λ-module A is Ǎ = Hom(A, ℚ₂/ℤ₂) with the covariant action (γφ)(x) = φ(γx); twisting by 𝒯 = lim μ_{2^n} multiplies the action on the dual by u, so a characteristic series f becomes f(u^{−1}(1 + T) − 1). The contragredient convention used for the S-ramified modules X (Layers 5, 7, 8) is the usual one: X(−n) has γ acting by κ(γ)^{−n}γ, and its characteristic series is f(κ(γ)^n(1 + T) − 1). The two actions are kept distinct.

Iwasawa conventions at odd ℓ (Layer 5): E is a finite abelian extension of F of degree prime to ℓ containing μ_ℓ, ω is the Teichmüller character, κ the cyclotomic character, X the Galois group of the maximal abelian pro-ℓ extension of the cyclotomic ℤ_ℓ-extension E_∞ unramified outside the primes above ℓ (and any further S), and for an even character ψ of Gal(E/F), X_ψ is its ψ-component; the Deligne–Ribet series satisfy L_ℓ(1 − s, ψ) = G_ψ(κ(γ)^s − 1)/H_ψ(κ(γ)^s − 1) with H_ψ = 1 unless ψ = 1, when H_1(T) = T (up to a unit).

## Exact supplier contracts

The pinned libraries are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`; `Suggested.lean` elaborates against them. Declarations marked "current Tau Ceti" are in Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and later, not at the pin; they are cited, and nothing in `Suggested.lean` depends on them. A prerequisite on a roadmap layer refers to that layer's stated development.

### From Mathlib

| Use here | Exact declarations |
|---|---|
| Dedekind zeta in its half-plane | `NumberField.dedekindZeta` (the L-series of the ideal count), `NumberField.dedekindZeta_residue`, `LSeries`, `LSeries_one_eq_riemannZeta`, `LSeries_convolution'`, `LSeries.convolution` |
| archimedean factors | `Complex.Gammaℝ`, `Complex.Gammaℂ`, `Complex.Gammaℝ_eq_zero_iff`, `Complex.Gammaℝ_ne_zero_of_re_pos`, `Complex.differentiable_Gammaℝ_inv`, `Complex.Gamma_add_one`, `Complex.Gamma_one`, `Complex.Gamma_one_half_eq`, `Complex.Gamma_neg_nat_eq_zero`, `Complex.differentiable_one_div_Gamma` |
| Riemann, Hurwitz and Dirichlet functions | `riemannZeta`, `riemannZeta_two`, `riemannZeta_neg_nat_eq_bernoulli`, `bernoulli_two`, `Polynomial.bernoulli`, `HurwitzZeta.hurwitzZeta_neg_nat`, `DirichletCharacter`, `DirichletCharacter.Even`, `DirichletCharacter.LFunction`, `DirichletCharacter.LFunction_eq_LSeries`, `DirichletCharacter.differentiable_LFunction`, `ZMod.LFunction_def_even`, `quadraticChar`, `MulChar.ringHomComp`, `legendreSym` |
| number fields | `NumberField.IsTotallyReal`, `NumberField.IsTotallyReal.nrComplexPlaces_eq_zero`, `NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`, `NumberField.discr`, `NumberField.discr_ne_zero`, `NumberField.RingOfIntegers`, `Rat.ringOfIntegersEquiv`, `NumberField.Units.torsionOrder`, `NumberField.Units.rank`, `NumberField.Units.finrank_eq`, `IsDedekindDomain.HeightOneSpectrum`, `Ideal.absNorm`, `Ideal.absNorm_eq_one_iff`, `Ideal.pow_inertiaDeg`, `Ideal.inertiaDeg_pos`, `Set.integer`, `IsCyclotomicExtension`, `IsCyclotomicExtension.Rat.galEquivZMod`, `IsCyclotomicExtension.Rat.galEquivZMod_restrictNormal_apply`, `IsAbelianGalois` |
| valuations and counting | `padicValNat`, `padicValNat.mul`, `padicValNat.eq_zero_of_not_dvd`, `padicValRat`, `padicValRat.div`, `padicValRat.mul`, `padicValRat.of_nat`, `Nat.eq_iff_prime_padicValNat_eq`, `Rat.num_div_den`, `Rat.den_dvd`, `Nat.card_pi`, `Nat.card_units`, `Subgroup.card_mul_index`, `QuotientGroup.quotientKerEquivOfSurjective` |
| analytic continuation | `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` |
| power series and p-adic integers | `PowerSeries`, `PadicInt`, `Ideal.span`, `Associated`, `Ideal.span_singleton_eq_span_singleton` |

### From Tau Ceti

| Use here | Exact declarations |
|---|---|
| the ideal count and the Euler product (at the pin) | `TauCeti.dedekindZetaCoeff`, `TauCeti.dedekindZeta_eq_LSeries_dedekindZetaCoeff`, `TauCeti.dedekindZetaCoeff_rat`, `TauCeti.LSeriesSummable_dedekindZetaCoeff_iff`, `TauCeti.dedekindZeta_eulerProduct_hasProd`, `TauCeti.dedekindZeta_ne_zero_of_one_lt_re`, `TauCeti.EulerProductData.restrictAway` with `restrictAway_apply`, `TauCeti.MultiplicativeIdealWeight.ofBadPrimes` |
| quadratic rings of integers (at the pin) | `NumberField.adjoin_halfGen_eq_top_of_mod_four_eq_one`, `NumberField.discr_eq_of_squarefree_of_mod_four_eq_one`, `NumberField.ncard_primesOver_quadratic_iff` |
| the S-deleted Dirichlet series (current Tau Ceti) | `TauCeti.LSeries_ofBadPrimes`, `TauCeti.exists_differentiableOn_eq_LSeries_ofBadPrimes_sub`, `TauCeti.exists_differentiableOn_eq_dedekindZeta_sub` |
| the worked example ℚ(√5) (current Tau Ceti) | `TauCeti.NumberField.Sqrt5.discr_eq_five`, `isTotallyReal`, `nrRealPlaces_eq_two`, `classNumber_eq_one`, `torsionOrder_eq_two`, `ncard_primesOver_eq_two_iff_mod_five`, `inertiaDeg_eq_two_of_mem_primesOver_two`, `dedekindZeta_residue_eq` |

### From TauCetiRoadmap.LFunctions, Layers 1, 3, 4 and 8

The continued Dedekind zeta function `dedekindZetaC F` and the completed function `completedDedekindZeta F` with Λ_F(s) = |d_F|^{s/2}Γ_ℝ(s)^{r₁}Γ_ℂ(s)^{r₂}ζ_F(s); agreement with `NumberField.dedekindZeta` on Re s > 1; meromorphic continuation with a unique simple pole of ζ_F at 1; the functional equation Λ_F(1 − s) = Λ_F(s) off the poles and as germs; uniqueness of meromorphic continuation (`eq_of_meromorphic_of_eqOn_halfPlane`, `eventuallyEq_of_meromorphic_of_eqOn_halfPlane`); the K = ℚ comparison with Mathlib's `completedRiemannZeta` and `riemannZeta`; and the factorisation ζ_K = ζ·L(χ_D) for a quadratic field K of discriminant D at the coefficient, convergent-series and continued-function levels, stated off s = 1. Everything here that evaluates ζ_F at a negative integer evaluates `dedekindZetaC`.

### From TauCetiRoadmap.ClassFieldTheory, Layer 13, and TauCetiRoadmap.Chebotarev, Layer 9

ClassFieldTheory Layer 13: the Kronecker–Weber theorem, every finite abelian extension of ℚ embeds in a cyclotomic field, with the least cyclotomic level equal to the finite conductor; §6.5 uses it to place a totally real abelian F inside ℚ(μ_{m2^a}) with m odd. Chebotarev Layer 9: abelian Chebotarev, every element of the Galois group of a finite abelian extension is the Frobenius of infinitely many unramified primes; §2.8 uses it in F(μ_{p^{m+1}})/F.

### From TauCetiRoadmap.BorelRegulators, Layers R.4, R.5 and R.7

R.5 adopts the completion above and supplies, for j ≥ 2: the exact vanishing order d_j of ζ_F at 1 − j (r₂ for even j, r₁ + r₂ for odd j); the leading coefficient ζ*_F(1 − j) as a named definition; the leading-term functional equation ζ*_F(1 − j) = |d_F|^{j−1/2} A_F(j) ζ_F(j)/a_{F,j}, with A_F = Γ_ℝ^{r₁}Γ_ℂ^{r₂} and a_{F,j} the leading coefficient of A_F at 1 − j; and Borel's rational proportionality R_{Bo,j}(F) ∼_ℚ |ζ*_F(1 − j)|. R.4 supplies the Borel regulator on K_{2j−1}(𝓞_F), its determinant on an integral basis and its covolume R_{Bo,j}(F) > 0, equal to 1 in rank zero. R.7 supplies R_{Bo,j} = 2^{d_j} R_{Be,j} against the Beilinson regulator.

### From TauCetiRoadmap.K2SymbolsBrauer, Layers T.1 and T.5

T.1: classical K₂(R) as the kernel of the stable Steinberg group onto E(R), with `K2.map` along ring maps (so a ring isomorphism induces a group isomorphism). T.5: Steinberg and tame symbols; K₂(ℤ) is cyclic of order two generated by {−1, −1}, with both bounds proved without the Birch–Tate formula; and the relative S-integer sequence 0 → K₂(𝓞_F) → K₂(𝓞_{F,S}) → ⊕_{v∈S} k(v)ˣ → 0, the first map induced by 𝓞_F ⊆ 𝓞_{F,S} and the second given by the tame residues at the primes in S. The distinct tame-kernel sequence of 𝓞_{F,S}, with residues outside S, is not used in its place.

### From TauCetiRoadmap.ArithmeticKTheory, Layers N.2–N.8

N.2: the localisation sequence of a Dedekind domain. N.3: for finite S and i ≥ 1, K_{2i}(𝓞_{F,S}) is finite; K_n(𝓞_{F,S}) is finitely generated of rank r₁ + r₂ (n ≡ 1 mod 4, n ≥ 5), r₂ (n ≡ 3 mod 4) and 0 for even n ≥ 2; the finite localisation defect under S ⊆ T and the rational isomorphism ℚ ⊗ K_n(𝓞_F) ≅ ℚ ⊗ K_n(𝓞_{F,S}) for n ≥ 2. N.4: W_i(F) and w_i(F) for every integer i, finiteness and positivity for i ≠ 0 (with W_i^{(ℓ)}(F) = 0 once ℓ − 1 > |i|[F : ℚ]), the computation of the ℓ-part from Gal(F(μ_{ℓ^∞})/F), the 2-primary formula with the exceptional/non-exceptional distinction (for totally real F and even i = c·2^b with c odd, w_i^{(2)}(F) = 2^{e+b}, e as in the Conventions), and the values over ℚ (w₂(ℚ) = 24, w₄(ℚ) = 240, w₆(ℚ) = 504). N.5: the e-invariant on the torsion of K_{2j−1}(𝓞_F), whose kernel and cokernel are 2-groups, so the odd part of #K_{2j−1}(𝓞_F)_tors is that of w_j(F). N.6: for every i ≥ 1 and every prime ℓ (ℓ = 2 with a real place excepted), K_{2i}(𝓞_S){ℓ} ≅ H²(𝓞_S[1/ℓ], ℤ_ℓ(i + 1)), natural in S; at ℓ = 2 with real places, Rognes–Weibel's two-primary corrections (K_n(𝓞_S){2} by the residue of n modulo 8, in particular K₂(𝓞_S){2} ≅ H²(𝓞_S[1/2], ℤ₂(2)), #K_{8k+3}(𝓞_S){2} = 2^{r₁}w_{4k+2}^{(2)}, K_{8k+6}(𝓞_S){2} the kernel of the real restriction on H², #K_{8k+7}(𝓞_S){2} = w_{4k+4}^{(2)}); the order ratio 2^{r₁}·#K_{2i−2}(𝓞_S)/#K_{2i−1}(𝓞_S) = ∏_ℓ #H²(𝓞_S[1/ℓ], ℤ_ℓ(i))/∏_ℓ #H¹(𝓞_S[1/ℓ], ℤ_ℓ(i)) for totally real F and even i > 0; the finiteness of H²(𝓞_F[1/ℓ], ℤ_ℓ(n)) with H² = 0 for almost all ℓ and the vanishing of H^{≥3} for odd ℓ; and the order-certificate format. N.8: the certified tame kernel K₂(𝓞_{ℚ(√5)}) ≅ (ℤ/2)², with lower bound from the real sign symbols and upper bound from its generation theorem, independent of special values; and the split sequence 0 → K₂(ℤ) → K₂(ℤ[1/p]) → 𝔽_pˣ → 0.

### From TauCetiRoadmap.KTheoryFiniteLocalFields, Layer L.1

Quillen's computation K_{2i}(𝔽_q) = 0 and K_{2i−1}(𝔽_q) ≅ ℤ/(q^i − 1) for i ≥ 1 and every prime power q, including characteristic two.

### From TauCetiRoadmap.MotivicEtaleKTheory, Layers M.2, M.3, M.7 and M.8

M.2: for R = 𝓞_{F,S} with S ⊇ S_∞ ∪ S_ℓ and every j, H^n_cont(R, ℤ_ℓ(j)) is finitely generated, its torsion is described by the coefficient sequence, in particular H¹_cont(R, ℤ_ℓ(j))_tors ≅ H⁰(R, ℚ_ℓ/ℤ_ℓ(j)) = ℤ/w_j^{(ℓ)}(F) for j ≠ 0, and Tate's Euler characteristic formula gives rank H¹ − rank H² = r₂ for even j and r₁ + r₂ for odd j, for every prime ℓ. M.3: for a number field F, a prime ℓ and a finite set S_tot of places containing the archimedean places and the primes above ℓ, Tate's Galois-symbol isomorphism h_S : K₂(𝓞_{F,S}) ⊗ ℤ_ℓ ≅ H²_cont(𝓞_{F,S}, ℤ_ℓ(2)) (for every ℓ, including ℓ = 2), its finite-coefficient versions for every r ≥ 1, their naturality for S ⊆ T and compatibility with restriction to F, and the residue compatibility ∂_v ∘ h = −κ_{k(v)} ∘ ∂_v^{tame} at a prime v ∤ ℓ. M.7: for odd ℓ (or ℓ = 2 and F totally imaginary) and j ≥ 2, K_{2j−1}(𝓞_F) ⊗ ℤ_ℓ ≅ H¹(𝓞_F[1/ℓ], ℤ_ℓ(j)) and K_{2j−2}(𝓞_F) ⊗ ℤ_ℓ ≅ H²(𝓞_F[1/ℓ], ℤ_ℓ(j)); the Beilinson–Lichtenbaum comparison, which identifies the ℓ-adic completions of the integral motivic H¹ and H² of 𝓞_F with H¹ and H² of 𝓞_F[1/ℓ]; and the corrected real-place comparison at 2. M.8: the integral motivic structures of a regular arithmetic model (the image of integral motivic cohomology, its torsion-free part and its regulator lattice), the regulator determinant comparison, and the étale Chern classes c_{i,n} with c_{i,i} equal to (−1)^{i−1}(i − 1)! times the cup product of Kummer classes on symbols, so c_{2,2} = −h.

### From TauCetiRoadmap.IntegralIwasawaTheory, Layers I.1–I.5, I.8–I.10 and L4

I.1: the cyclotomic ℤ_p-extensions, the Iwasawa algebra coordinate T = γ − 1 and the change of generator γ′ = γ^c (T ↦ (1 + T′)^{c^{−1}} − 1, u′ = u^c). I.2: weak Leopoldt for the cyclotomic ℤ_p-extension (for totally real K, 𝔛_S(K_∞) is a finitely generated torsion Λ-module with no nonzero finite Λ-submodule, ramification at the real places allowed at p = 2); the minus class modules of a CM tower, with the norm-kernel convention at p = 2 and Federer's theorem that the dual of A_∞^− has no nonzero finite Λ-submodule; Iwasawa's description of H¹(Γ, ℰ) and H²(Γ, ℰ) for the free part ℰ of the direct limit of the units of the real layers. I.3: the transport of the Deligne–Ribet pseudo-measure to g_{K_∞/k,S}, with κ^nψ(g) = L_S(1 − n, ψ) for n ≥ 1, uniqueness, Euler factors under enlarging S, restriction, and the power-series form G_{ψ,S}/H_ψ. I.4: twisted coinvariant descent (Hom(X, ℚ_p/ℤ_p(n)) = H¹(G_S(E_∞), ℚ_p/ℤ_p(n)); for odd p and n ≥ 2, #H²(𝓞^S_E, ℤ_p(n))_{χ^{−1}} = #X_ψ(−n)_Γ on the finite eigenspaces; for F itself, p = 2 and even n, #X(F)(−n)_Γ = #H²(𝓞_F[1/2], ℤ₂(n))); finite coinvariant evaluation, #M_Γ = #(O/f(0)) for a torsion module without finite submodules, in the contragredient convention (evaluation of the twist at u^n − 1) and Kolster's covariant convention (at u^{−n} − 1); and the dyadic statement ζ_F(1 − n) ∼₂ #H²/#H¹ for 𝓞_F[1/2] given the 2-adic main conjecture for F and the trivial character. I.5: Wiles's main conjecture for totally real F, odd p and even characters of type S, with μ(X_ψ) = μ(G_ψ) for ψ of order prime to p, so char(X_ψ) = (G_ψ); its special-value endpoint v_p(#X_ψ(−n)_Γ) = d_χ·v_p(L_S(1 − n, χ)) + v_p(#H⁰(E, ℚ_p/ℤ_p(n))_{χ^{−1}}) for ψ = χω^n; and the going-up induction for the main conjecture. I.8–I.9: the Burns–Flach compact-support complex RΓ_c(𝓞_{F_∞,S}, ℤ_p(1)) with H² = X_{F_∞,S} and H³ = ℤ_p; Kurihara's determinant main conjecture Det(RΓ_c)^{−1} = g_{F_∞/k,S}Λ for every prime p, totally real k and finite abelian totally real F/k (F = k included); Kurihara's Lemma 4.2(1) (the injection of the minus Selmer module into X_{F_∞,S} with cokernel of order 2 at p = 2). I.10: the characteristic-ideal form char(X_{F_∞,S}) = ((γ − 1)g_{F_∞/F,S}) at F = k and p = 2; the classical–modern module dictionary at p = 2 (Kummer duality with the norm-kernel minus module of F(μ_{2^∞}), the real-place inertia, char(ι_u X_{F_∞,S}) = (2^{[F:ℚ]}f_F), compatibility with enlarging S); and the finite Euler-characteristic comparison of the κ²-specialisation with H² and H¹ of 𝓞_F[1/2]. L4: the Ferrero–Washington theorem μ = 0 for the cyclotomic ℤ_p-extension of an abelian field, p = 2 included.

### From the p-adic L-function roadmaps and TauCetiRoadmap.PadicMeasuresIwasawaAlgebras, Layer 4

TauCetiRoadmap.AutomorphicPadicLFunctions, Layer L3: for totally real F of degree r and every prime p, the Deligne–Ribet measure μ_𝔠 for an auxiliary ideal 𝔠, with ∫ε·N^{k−1}dμ_𝔠 = Δ_𝔠(1 − k, ε) for k ≥ 1, where Δ_𝔠(s, ε) is the 𝔠-smoothed partial zeta function (so Δ_𝔠(1 − n, 1) = (1 − N𝔠^n)·ζ_{F,S_p}(1 − n) for the trivial function); Deligne–Ribet integrality (if Σ_k ε_k N^{k−1} is ℤ_p-valued then Σ_k Δ_𝔠(1 − k, ε_k) ∈ ℤ_p); the 2-adic refinement (integrals of odd functions lie in 2^{r−1}ℤ̂, and in 2^rℤ̂ outside the exceptional case); the pseudo-measure with L_p(1 − n, ψ) interpolation, and at odd p the series G_ψ, H_ψ with L_p(1 − s, ψ) = G_ψ(κ(γ)^s − 1)/H_ψ(κ(γ)^s − 1) and L_p(1 − n, ω^n) = ζ_F(1 − n)∏_{v∣p}(1 − Nv^{n−1}). TauCetiRoadmap.DirichletPadicLFunctions, Layer L2: the Kubota–Leopoldt functions of all Dirichlet characters as integrals against their measures. TauCetiRoadmap.EulerSystemsCyclotomicMainConjecture, Layer L4: Greither's main conjecture for abelian F unramified at p, every prime p including 2, with his χ-parts and Kummer duality, the meromorphic 𝒢₂ distinct from its pole-cleared numerator P₂ = (T − q₀)𝒢₂ with P₂/2 integral, and the exceptional character χ = ω, for which char(X_ω) = (1). TauCetiRoadmap.PadicMeasuresIwasawaAlgebras, Layer 4: Weierstrass preparation over ℤ_p⟦T⟧ (a nonzero power series has finitely many zeros in the open disc), the structure theorem, characteristic ideals and μ- and λ-invariants.

### From TauCetiRoadmap.PeriodsAndSpecialValues, Layers PS.3–PS.5, and TauCetiRoadmap.GeneralAlgebraicKTheory, Layer K.5

PS.3: regulator determinants of lattices on determinant lines with a fixed coordinate measure, and their specialisations to the Borel and Beilinson regulators. PS.4: perfect global and local complexes, projective lattice structures, the Coherence hypothesis and the graded real comparison trivialisation defining RΩ(M, 𝒜), with the finite-lattice and local Euler corrections. PS.5: the equivariant Tamagawa-number statement TΩ(M, 𝒜) = δ̂¹_{𝒜,ℝ}(L*(_A M, 0)) + RΩ(M, 𝒜) = 0 in K₀(𝒜, ℝ), with its rationality part (membership in K₀(𝒜, ℚ)) and its local form. K.5: relative K₀(𝒜, ℝ) of an order 𝒜 in a semisimple ℚ-algebra, its boundary from K₁(𝒜_ℝ) and functoriality.

## How to read the build

The layers are built in the order Layer 1 → 2 → 3 → 4 → 5 → 6 → 7 → 8, and each `### k.n` subsection lists its statements in dependency order; *Needs:* at the end of a statement names the earlier statements, by Lean name or by subsection, and the library declarations and roadmap layers it rests on. Layer 1 defines the formula and its trivial reformulations. Layer 2 supplies the analytic facts (sign, rationality, vanishing with a complex place, integrality) and the reduction of the formula to one valuation identity per prime. Layer 3 checks the formula on ℚ and ℚ(√5) from independent inputs. Layer 4 passes to S-integers and fixes the sign and Euler factors there. Layer 5 proves every odd-primary identity, in every even weight, from the main conjecture at odd primes. Layer 6 proves the 2-primary identity for totally real abelian fields by Kolster's reduction to Federer's conjecture and Greither's theorem, and assembles Birch–Tate for those fields. Layer 7 proves the 2-primary identity for every totally real field, in every even weight, from Kurihara's theorem and Kolster's cohomological argument, assembles the end theorem, and compares the result with Kolster's formulation, proving Federer's conjecture for every totally real field. Layer 8 states the Lichtenbaum formulas and the equivariant statement, and proves the Lichtenbaum formula for totally real fields in every even weight, with the real-place correction at 2. Each definition gives its API as named lemmas and its checks as a `**Checks.**` list, whose key items are the `example`s of `Suggested.lean`; every layer ends with its examples and its dependencies.

## Layer 1: the Birch–Tate formula

This layer defines the Birch–Tate formula as a proposition about an arbitrary number field and proves the reformulations that every later layer uses. The proposition is defined without assuming F totally real, so that its failure for a field with a complex place (§2.3) is a statement about the same predicate; the Birch–Tate conjecture is the assertion that it holds for every totally real F, which is the end theorem of §7.4.

Standing assumptions for this layer: F is a number field; ζ_F is LFunctions' continued `dedekindZetaC F`; K₂ is K2SymbolsBrauer's classical K₂; w₂(F) = `TauCeti.wInvariant F 2`.

### 1.1 The formula as a predicate

References: K-book VI.8.6, Birch–Tate Conjecture 8.6, book p. 515 (PDF p. 523), for the formula with the sign (−1)^{r₁}; Kolster 2009, Lecture 2 §3, Birch–Tate Conjecture 3.5, p. 15, for the formula stated with the sign left open and for w₂(F) as the order of H⁰(F, ℚ/ℤ(2)) (the paragraph before Corollary 3.4, p. 15). Built on LFunctions Layer 3 (`dedekindZetaC`), K2SymbolsBrauer T.1 (`K2`), ArithmeticKTheory N.3 (finiteness of K₂(𝓞_F)) and N.4 (`wInvariant`, its positivity), and Mathlib `Module.finrank`, `NumberField.RingOfIntegers`, `Nat.card`.

**The Birch–Tate predicate.** Define `TauCeti.BirchTate.BirchTateFormula F : Prop` as the equality in ℂ

```text
ζ_F(−1) = (−1)^{[F:ℚ]} · #K₂(𝓞_F) / w₂(F),
```

with [F : ℚ] = `Module.finrank ℚ F`, #K₂(𝓞_F) = `Nat.card (K2 (𝓞 F))` and w₂(F) = `wInvariant F 2`, both cast to ℂ. It is well posed: K₂(𝓞_F) is finite (ArithmeticKTheory N.3, even K-groups of S-integers are finite, with S = ∅ and i = 1), so `Nat.card` is its order and not the value 0 of an infinite type, and w₂(F) ≥ 1 (ArithmeticKTheory N.4), so the division is by a nonzero number. The Birch–Tate conjecture is `∀ F, NumberField.IsTotallyReal F → BirchTateFormula F`; it is never asserted for a field with a complex place. Its API is `birchTateFormula_iff_mul`, `BirchTateFormula.zeta_ne_zero` and `BirchTateFormula.w2_mul_zeta_eq_intCast` (§1.2), `birchTateFormula_iff_abs` and `birchTateFormula_iff_padicValRat` (§2.7), `not_birchTateFormula_of_nrComplexPlaces_pos` (§2.3), `birchTateFormula_iff_sInteger` (§4.4), and the transport lemma `birchTateFormula_congr`: an isomorphism F ≃ₐ[ℚ] F′ of number fields gives BirchTateFormula F ↔ BirchTateFormula F′, because ζ_F, the order of K₂ of the ring of integers (through `K2.map` of the induced ring isomorphism), w₂ and the degree are all invariant. *Needs:* LFunctions Layer 3, K2SymbolsBrauer T.1, ArithmeticKTheory N.3 and N.4.

**Checks.**
- (computation) If ζ_ℚ(−1) = −1/12, #K₂(𝓞_ℚ) = 2 and w₂(ℚ) = 24, then BirchTateFormula ℚ holds: (−1)¹·2/24 = −1/12.
- (non-example, twist) With the same values but w₁(ℚ) = 2 in place of w₂(ℚ), the right side is (−1)·2/2 = −1 ≠ −1/12: a definition that used the roots of unity of F (`NumberField.Units.torsionOrder`) instead of the twisted invariant fails over ℚ.
- (non-example, sign) With w₂(ℚ) = 24, the unsigned right side 2/24 = 1/12 ≠ −1/12: dropping (−1)^{[F:ℚ]} fails over ℚ.
- (non-example, ring) K₂ of the field ℚ is infinite (ArithmeticKTheory N.8, the rationals against the integers), so `Nat.card (K2 ℚ) = 0` and the formula with the field in place of its ring of integers would force ζ_ℚ(−1) = 0, which is false.
- (non-example, vanishing) If ζ_F(−1) = 0 then BirchTateFormula F is false; this is the case of ℚ(i), where ζ_{ℚ(i)}(−1) = 0 while #K₂(ℤ[i])/w₂(ℚ(i)) = 1/24 (ArithmeticKTheory N.8, Gaussian and imaginary quadratic fields).

### 1.2 The multiplicative form, nonvanishing and integrality of the product

References: K-book VI.8.6, book p. 515. Built on §1.1 and ArithmeticKTheory N.3, N.4.

**The multiplicative form.** Prove `birchTateFormula_iff_mul`: BirchTateFormula F holds if and only if

```text
w₂(F) · ζ_F(−1) = (−1)^{[F:ℚ]} · #K₂(𝓞_F)   in ℂ.
```

The proof multiplies or divides by the complex cast of w₂(F), which is nonzero by ArithmeticKTheory N.4. This is the form used in §2.9, §3.1 and §4.4. For ℚ it reads 24·(−1/12) = −2 = (−1)¹·2. *Needs:* `BirchTateFormula`, ArithmeticKTheory N.4 (w₂(F) ≥ 1).

**Nonvanishing forced by the formula.** Prove `BirchTateFormula.zeta_ne_zero`: if BirchTateFormula F holds then ζ_F(−1) ≠ 0, for every number field F. K₂(𝓞_F) is a finite group, hence nonempty, so #K₂(𝓞_F) ≥ 1; w₂(F) ≥ 1; the signed quotient of two positive integers is nonzero. By contraposition the formula fails whenever ζ_F(−1) = 0, with no total-reality hypothesis. *Needs:* `BirchTateFormula`, ArithmeticKTheory N.3 (finiteness) and N.4 (positivity).

**The product is an integer.** Prove `BirchTateFormula.w2_mul_zeta_eq_intCast`: if BirchTateFormula F holds then w₂(F)·ζ_F(−1) equals the cast of the integer (−1)^{[F:ℚ]}·#K₂(𝓞_F). This is the input of §2.9. *Needs:* `birchTateFormula_iff_mul`.

### Examples

- Over ℚ the multiplicative form is 24·(−1/12) = −2 = (−1)·2, and the product w₂(ℚ)ζ_ℚ(−1) = −2 is an integer.
- Over ℚ(√5) it is 120·(1/30) = 4 = (+1)·4 (§3.2).
- Over ℚ(i) the formula fails: the left side of the multiplicative form is 0 and the right side is (−1)²·1 = 1.

### Dependencies

LFunctions Layer 3 (the continued ζ_F); K2SymbolsBrauer T.1 (K₂ and its functoriality); ArithmeticKTheory N.3 (finiteness of K₂(𝓞_F)), N.4 (w₂ and its positivity) and N.8 (the infinite K₂(ℚ) and the Gaussian field, for the checks); Mathlib `Module.finrank`, `Nat.card`, `NumberField.RingOfIntegers`.

## Layer 2: sign, rationality, integrality and primewise reconstruction

This layer collects the analytic facts about ζ_F(1 − n) that the arithmetic needs, in every even weight n ≥ 2, and reduces the Birch–Tate formula to a sign, which comes from the functional equation, and one valuation identity for each prime ℓ, which is what the arithmetic layers prove. It also states the two integrality facts that must be kept apart: Deligne–Ribet's theorem, which bounds the denominator of ζ_F(1 − n) independently of K-theory, and the consequence of the formula itself.

Standing assumptions for this layer: F is a number field; n ≥ 2 is an integer and k = n/2 when n is even; ζ_F, Λ_F and ζ*_F(1 − n) are as in the Conventions; R_{Bo,n}(F) is BorelRegulators' covolume of the Borel regulator on K_{2n−1}(𝓞_F).

### 2.1 The real archimedean factor at negative odd integers and at positive even integers

References: K-book VI.8.8 and the first paragraph of its proof, book pp. 515–516 (the sign of ζ_F(1 − 2k) from the functional equation). Built on Mathlib `Complex.Gammaℝ`, `Complex.Gamma_add_one`, `Complex.Gamma_one_half_eq`, `Complex.Gamma_one`, `Complex.Gammaℝ_eq_zero_iff`.

Prove `gammaℝ_neg_one`: Γ_ℝ(−1) = −2π, and `gammaℝ_two`: Γ_ℝ(2) = 1/π. For the first, Γ_ℝ(−1) = π^{1/2}Γ(−1/2), and the recurrence at s = −1/2 (where s ≠ 0) gives Γ(1/2) = (−1/2)Γ(−1/2), so Γ(−1/2) = −2π^{1/2}; for the second, Γ_ℝ(2) = π^{−1}Γ(1). In general prove `gammaℝ_one_sub_two_mul`: for k ≥ 1, Γ_ℝ(1 − 2k) is a nonzero real number of sign (−1)^k, and `gammaℝ_two_mul_pos`: Γ_ℝ(2k) is a positive real number. The points 1 − 2k are not poles of Γ_ℝ, whose totalised zeros are exactly 0, −2, −4, … (`Complex.Gammaℝ_eq_zero_iff`), so these are honest values and not artefacts of totalisation. *Needs:* the Mathlib declarations above.

**Checks.**
- (computation) Γ_ℝ(−1) = −2π and Γ_ℝ(2) = 1/π.
- (computation) Γ_ℝ(−3) = π^{3/2}Γ(−3/2) = (4/3)π², positive, the sign (−1)² of `gammaℝ_one_sub_two_mul` at k = 2.
- (non-example) Γ_ℝ(−2) = 0 in Mathlib's totalised function, although −2 is a pole of the meromorphic Γ_ℝ: a computation that divides by Γ_ℝ at an even nonpositive integer is meaningless, which is why §2.3 uses BorelRegulators' order of vanishing instead.

### 2.2 Positivity on the real half-line

References: K-book VI.8.8, proof, book p. 516, where positivity of ζ_F(2k) enters the sign. Built on Tau Ceti `TauCeti.dedekindZeta_eq_LSeries_dedekindZetaCoeff`, `TauCeti.dedekindZetaCoeff`, `TauCeti.LSeriesSummable_dedekindZetaCoeff_iff` and Mathlib `Ideal.absNorm_eq_one_iff`, `LSeries`.

Prove `one_le_dedekindZeta_ofReal`: for every number field F and real σ > 1, Mathlib's `NumberField.dedekindZeta F σ` is a real number, and that real number is at least 1; in particular ζ_F(n) > 0 for every integer n ≥ 2. The series Σ_{n≥1} a_n n^{−σ}, with a_n the number of ideals of norm n, converges absolutely for σ > 1, all its terms are nonnegative reals, and a₁ = 1 because the only ideal of norm one is 𝓞_F. The n = 0 slot of the coefficient function counts the zero ideal and is not part of the L-series. *Needs:* the Tau Ceti and Mathlib declarations above.

**Checks.**
- (computation) For F = ℚ and σ = 2 the value is ζ(2) = π²/6 ≈ 1.645 ≥ 1 (`riemannZeta_two`).
- (degenerate) The lower bound 1 is the contribution of the unit ideal alone, attained in the limit σ → ∞.
- (non-example) For σ = 1/2 the series does not converge and Mathlib's `dedekindZeta` is a junk value; the hypothesis σ > 1 cannot be dropped.

### 2.3 Vanishing at negative integers with a complex place

References: Kolster 2009, Lecture 2 §3, the orders of vanishing after Conjecture 3.5, p. 15; K-book VI.8.6, book p. 515, read with the correction that the behaviour of ζ_F at −1 for r₂ > 0 is a zero, not a pole, of order r₂. Built on BorelRegulators R.5 (exact order of vanishing) and §1.2.

**Vanishing.** Prove `dedekindZetaC_one_sub_eq_zero_iff`: for even n ≥ 2, ζ_F(1 − n) = 0 if and only if r₂ ≥ 1, and for odd n ≥ 3, ζ_F(1 − n) = 0 always. This is BorelRegulators R.5's exact order of vanishing d_n (r₂ for even n, r₁ + r₂ for odd n) read at the value: a holomorphic function vanishes at a point exactly when its order there is positive, and r₁ + r₂ ≥ 1. *Needs:* BorelRegulators R.5 (exact vanishing order).

**The formula fails with a complex place.** Prove `not_birchTateFormula_of_nrComplexPlaces_pos`: if F has a complex place, then BirchTateFormula F is false. By the vanishing statement at n = 2, ζ_F(−1) = 0, and §1.2 shows the formula forces ζ_F(−1) ≠ 0. This is why the conjecture is restricted to totally real fields, and why at a complex place the meaningful statement is the leading-term formula of §8.3. *Needs:* `dedekindZetaC_one_sub_eq_zero_iff`, `BirchTateFormula.zeta_ne_zero`.

**Checks.**
- (computation) For F = ℚ(i), r₂ = 1 and ζ_{ℚ(i)}(−1) = 0, while #K₂(ℤ[i])/w₂(ℚ(i)) = 1/24 ≠ 0.
- (degenerate) For F = ℚ, r₂ = 0 and ζ(−1) = −1/12 ≠ 0; for odd n = 3, ζ(−2) = 0, a trivial zero of order r₁ + r₂ = 1.
- (non-example) Reading the K-book's "pole of order r₂ at −1" literally would make ζ_{ℚ(i)}(−1) infinite; the order is that of a zero.

### 2.4 The sign of ζ_F(1 − n) for totally real F and even n

References: K-book VI.8.8, proof, book p. 516 ("the sign of ζ_F(1 − 2k) is (−1)^{k r₁}"); K-book VI.8.6, book p. 515, for n = 2. Built on BorelRegulators R.5 (leading-term functional equation), §2.1, §2.2, Mathlib `NumberField.IsTotallyReal.nrComplexPlaces_eq_zero`, `NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`, `NumberField.discr_ne_zero`.

Prove `dedekindZetaC_one_sub_eq`: for totally real F of degree d and even n = 2k ≥ 2,

```text
ζ_F(1 − n) = |d_F|^{n − 1/2} · (Γ_ℝ(n) / Γ_ℝ(1 − n))^{d} · ζ_F(n),
```

and `neg_one_pow_mul_dedekindZetaC_one_sub_pos`: (−1)^{k d} ζ_F(1 − n) is a positive real number. The first is BorelRegulators R.5's leading-term functional equation at j = n with r₂ = 0: the vanishing order is 0, so the leading coefficient is the value, A_F = Γ_ℝ^{d}, and a_{F,n} = Γ_ℝ(1 − n)^{d} is a regular nonzero value by §2.1. The second follows because |d_F| ≥ 1, its real power is positive, Γ_ℝ(n) > 0, Γ_ℝ(1 − n) has sign (−1)^k (§2.1) and ζ_F(n) ≥ 1 (§2.2). At n = 2, with Γ_ℝ(2)/Γ_ℝ(−1) = −1/(2π²), the formula reads

```text
ζ_F(−1) = (−1)^{[F:ℚ]} · |d_F|^{3/2} · ζ_F(2) / (2π²)^{[F:ℚ]},
```

which is `neg_one_pow_mul_dedekindZetaC_neg_one_pos` with (−1)^{[F:ℚ]}ζ_F(−1) > 0. The sign of the Birch–Tate formula comes from here and only from here; the arithmetic layers prove absolute values prime by prime. *Needs:* BorelRegulators R.5 (leading-term functional equation, vanishing order), `gammaℝ_neg_one`, `gammaℝ_two`, `gammaℝ_one_sub_two_mul`, `gammaℝ_two_mul_pos`, `one_le_dedekindZeta_ofReal`.

**Checks.**
- (computation) F = ℚ, n = 2: ζ(−1) = −ζ(2)/(2π²) = −(π²/6)/(2π²) = −1/12, negative as (−1)¹ requires.
- (computation) F = ℚ, n = 4: Γ_ℝ(4)/Γ_ℝ(−3) = (π^{−2})/((4/3)π²) = 3/(4π⁴) and ζ(4) = π⁴/90, so ζ(−3) = 1/120, positive as (−1)^{2·1} requires.
- (computation) F = ℚ(√5), n = 2: d_F = 5, so 1/30 = 5^{3/2}ζ_F(2)/(4π⁴), that is ζ_{ℚ(√5)}(2) = 2π⁴/(75√5), and the sign is + = (−1)².
- (non-example) Using Γ_ℝ(−1) = +2π would make ζ(−1) positive over ℚ, contradicting −1/12; any field of odd degree detects the error.

### 2.5 Rationality of ζ_F(1 − n) for totally real F and even n

References: Cohen, *Number Theory II*, §10.5.1, Theorem 10.5.3, p. 218 (Siegel's theorem: ζ_F(1 − 2k) ∈ ℚ for totally real F); Kolster 2009, Lecture 2 §3, p. 15, for the rank-zero case of the regulator conventions. Built on BorelRegulators R.4 (covolume equal to 1 in rank zero) and R.5 (vanishing order, leading coefficient, Borel's rational proportionality), ArithmeticKTheory N.3 (Borel's ranks), and §2.4.

Prove `exists_rat_dedekindZetaC_one_sub`: for totally real F and even n ≥ 2 there is a unique rational number q_{F,n}, nonzero and of sign (−1)^{(n/2)[F:ℚ]}, with ζ_F(1 − n) = q_{F,n}. For totally real F and even n the group K_{2n−1}(𝓞_F) has rank r₂ = 0 (ArithmeticKTheory N.3), so R_{Bo,n}(F) = 1 (BorelRegulators R.4), the vanishing order is 0 and ζ*_F(1 − n) = ζ_F(1 − n) (BorelRegulators R.5); Borel's rational proportionality then makes |ζ_F(1 − n)| rational, and §2.4 restores the sign and gives nonvanishing. Write `rat_dedekindZetaC_neg_one F` for q_{F,2}. No K-group order enters. *Needs:* BorelRegulators R.4 and R.5, ArithmeticKTheory N.3, `neg_one_pow_mul_dedekindZetaC_one_sub_pos`.

**Checks.**
- (computation) q_{ℚ,2} = −1/12, q_{ℚ,4} = 1/120, q_{ℚ,6} = −1/252 (from Mathlib's `riemannZeta_neg_nat_eq_bernoulli`), with signs −, +, − as (−1)^{k} requires.
- (computation) q_{ℚ(√5),2} = 1/30 (§3.2).
- (non-example) For F = ℚ and odd n = 3 the value ζ(−2) = 0 is rational but not in ℚ^×: the evenness hypothesis is what gives nonvanishing.

### 2.6 A positive rational number is determined by its prime valuations

References: Kolster 2009, Lecture 2 §3, Conjecture 3.5, p. 15, where the conjecture is stated prime by prime up to sign. Built on Mathlib `padicValRat`, `padicValRat.div`, `padicValRat.mul`, `padicValRat.of_nat`, `Nat.eq_iff_prime_padicValNat_eq`, `Rat.num_div_den`.

Prove `rat_eq_iff_forall_padicValRat_eq`: for rationals q > 0 and r > 0, q = r if and only if `padicValRat p q = padicValRat p r` for every prime p. Write q = a/b and r = c/d in lowest terms with positive numerators; equal valuations give v_p(ad) = v_p(cb) for every p, hence ad = cb. Prove also the form used by §2.7, `abs_eq_natCast_div_iff_forall_padicVal`: for a nonzero rational q and positive natural numbers k and w, |q| = k/w if and only if v_ℓ(k) = v_ℓ(w) + v_ℓ(|q|) for every prime ℓ. *Needs:* the Mathlib declarations above.

**Checks.**
- (non-example) Positivity is needed: q = −1 and r = 1 have valuation 0 at every prime and are different.
- (computation) 2/24 and 1/12 have the same valuations (v₂ = −2, v₃ = −1, all others 0), and are equal.
- (non-example) In the second form, q ≠ 0 is needed: q = 0 and k = w = 1 satisfy v_ℓ(k) = v_ℓ(w) + v_ℓ(0) for every ℓ (all three are 0) although |0| ≠ 1.

### 2.7 The absolute-value and primewise forms of the formula

References: Kolster 2009, Lecture 2 §3, Conjecture 3.5 and Corollary 3.4, p. 15; K-book VI.8.6, book p. 515. Built on §1.1, §2.4, §2.5, §2.6, ArithmeticKTheory N.3 and N.4.

**Absolute value.** Prove `birchTateFormula_iff_abs`: for totally real F, BirchTateFormula F holds if and only if |ζ_F(−1)| = #K₂(𝓞_F)/w₂(F). By §2.4, ζ_F(−1) = (−1)^{[F:ℚ]}|ζ_F(−1)|, and the unit (−1)^{[F:ℚ]} cancels. *Needs:* `BirchTateFormula`, `neg_one_pow_mul_dedekindZetaC_neg_one_pos`.

**Primewise form.** Prove `birchTateFormula_iff_padicValRat`: for totally real F, with q = `rat_dedekindZetaC_neg_one F` (§2.5), BirchTateFormula F holds if and only if for every prime ℓ

```text
v_ℓ(#K₂(𝓞_F)) = v_ℓ(w₂(F)) + v_ℓ(|q|).
```

The absolute-value form is an equality of positive rationals (q ≠ 0, #K₂ ≥ 1, w₂ ≥ 1), and `abs_eq_natCast_div_iff_forall_padicVal` turns it into the valuation identities. This is the form in which §5.3 proves every odd ℓ, and §6.4 (for abelian F) and §7.3 (for every totally real F) the prime 2. *Needs:* `birchTateFormula_iff_abs`, `exists_rat_dedekindZetaC_one_sub`, `abs_eq_natCast_div_iff_forall_padicVal`, ArithmeticKTheory N.3 and N.4.

**Checks.**
- (computation) F = ℚ, q = −1/12, #K₂ = 2, w₂ = 24: at ℓ = 2, 1 = 3 + (−2); at ℓ = 3, 0 = 1 + (−1); at every other ℓ, 0 = 0 + 0.
- (computation) F = ℚ(√5), q = 1/30, #K₂ = 4, w₂ = 120: at ℓ = 2, 2 = 3 + (−1); at ℓ = 3 and ℓ = 5, 0 = 1 + (−1).
- (non-example) The primewise identities do not see the sign: they hold for ℚ with q replaced by +1/12, which is why the sign theorem of §2.4 is a separate input.

### 2.8 Deligne–Ribet integrality in every even weight

References: Kolster 2009, Lecture 2 §4, the integrality statement preceding Conjecture 4.1, p. 16 (Ann_{ℤ[G]}(H⁰(E, ℚ/ℤ(n)))·θ^S_{E/F}(1 − n) ⊆ ℤ[G]). Built on AutomorphicPadicLFunctions L3 (the Deligne–Ribet measure and its integrality), TauCetiRoadmap.Chebotarev Layer 9 (abelian Chebotarev), ArithmeticKTheory N.4, §2.5, Mathlib `Rat.den_dvd`, `padicValRat`.

**Smoothed integrality at one prime.** Prove `padicValRat_smoothed_zeta_nonneg`: for totally real F, a prime p, an even integer n ≥ 2 and an integral ideal 𝔠 of 𝓞_F prime to p, the number (1 − N𝔠^n)·ζ_F(1 − n) is p-integral. AutomorphicPadicLFunctions L3 gives, for the trivial locally constant function and k = n, that the smoothed value Δ_𝔠(1 − n, 1) = (1 − N𝔠^{n})·ζ_{F,S_p}(1 − n) lies in ℤ_p (Deligne–Ribet integrality (0.4)); and ζ_{F,S_p}(1 − n) = ζ_F(1 − n)∏_{v∣p}(1 − Nv^{n−1}) with p-adic unit factors, since Nv is a power of p (the truncation of the Euler product at the primes above p is part of the interpolation property in L3). *Needs:* AutomorphicPadicLFunctions L3, `exists_rat_dedekindZetaC_one_sub`.

**A prime with the extremal norm.** Prove `exists_prime_padicValNat_norm_pow_sub_one_eq`: for a number field F, a prime p and n ≥ 1 there is a prime ideal 𝔠 ∤ p of 𝓞_F with v_p(N𝔠^n − 1) = v_p(w_n(F)). Put m = v_p(w_n(F)). By ArithmeticKTheory N.4, κ(σ)^n ≡ 1 mod p^m for every σ ∈ Gal(F(μ_{p^{m+1}})/F) and some σ has κ(σ)^n ≢ 1 mod p^{m+1}, where κ is the cyclotomic character; abelian Chebotarev (TauCetiRoadmap.Chebotarev, Layer 9) applied to the abelian extension F(μ_{p^{m+1}})/F gives an unramified prime 𝔠 ∤ p whose Frobenius is σ, and κ(Frob_𝔠) = N𝔠 mod p^{m+1}. *Needs:* ArithmeticKTheory N.4 (W_n through the cyclotomic character), TauCetiRoadmap.Chebotarev Layer 9.

**The integrality.** Prove `wInvariant_mul_dedekindZetaC_one_sub_integral`: for totally real F and even n ≥ 2, w_n(F)·q_{F,n} ∈ ℤ; consequently the reduced denominator of ζ_F(1 − n) divides w_n(F). At each prime p, the two lemmas give v_p(q_{F,n}) ≥ −v_p(N𝔠^n − 1) = −v_p(w_n(F)). This is the trivial-extension case E = F, G = 1 of Deligne–Ribet's annihilator statement with S the archimedean places, so the value is the untruncated ζ_F(1 − n); the annihilator of the finite cyclic group W_n(F) in ℤ is w_n(F)ℤ. The bound is proved without the Birch–Tate formula and is not a substitute for it. *Needs:* `padicValRat_smoothed_zeta_nonneg`, `exists_prime_padicValNat_norm_pow_sub_one_eq`, `exists_rat_dedekindZetaC_one_sub`, Mathlib `Rat.den_dvd`.

**Checks.**
- (computation) 24·(−1/12) = −2 and 120·(1/30) = 4 for n = 2 over ℚ and ℚ(√5).
- (computation) n = 4 over ℚ: w₄(ℚ)·ζ(−3) = 240/120 = 2; n = 6: w₆(ℚ)·ζ(−5) = 504·(−1/252) = −2.
- (computation) Over ℚ with p = 2 and n = 2, the prime 𝔠 = (3) has v₂(3² − 1) = v₂(8) = 3 = v₂(24), and the smoothed value (1 − 9)(−1/12)(1 − 2) = −2/3 is 2-integral.
- (non-example) The untruncated value at the trivial extension is what is bounded; the truncated value θ^{S∪{(3)}}(−1) = ζ(−1)(1 − 3) = 1/6 over ℚ also satisfies 24·(1/6) = 4 ∈ ℤ, but it is a different number and says nothing about the denominator 12 of ζ_ℚ(−1) at the prime 3.

### 2.9 The denominator consequence of the formula

References: K-book VI.8.6, book p. 515. Built on `BirchTateFormula.w2_mul_zeta_eq_intCast` and Mathlib `Rat.den_dvd`.

Prove `BirchTateFormula.den_dvd_wInvariant`: if F is totally real and BirchTateFormula F holds, then the reduced denominator of `rat_dedekindZetaC_neg_one F` divides w₂(F). If w·z = m with w ≥ 1 and m ∈ ℤ, then z = m/w and its reduced denominator divides w. This is drawn from the identity; it is never used to prove the identity, and §2.8 is the independent bound. *Needs:* `BirchTateFormula.w2_mul_zeta_eq_intCast`, `exists_rat_dedekindZetaC_one_sub`, Mathlib `Rat.den_dvd`.

### Examples

- ℚ: ζ(−1) = −1/12, negative; 12 ∣ 24; 2 = 2³·(1/2²) primewise.
- ℚ, n = 4: ζ(−3) = 1/120 > 0 and 120 ∣ 240.
- ℚ(√5): ζ_F(−1) = 1/30 > 0 and 30 ∣ 120.
- ℚ(i): ζ(−1) = 0 and the formula fails.

### Dependencies

Layer 1; LFunctions Layer 3; BorelRegulators R.4 (covolume in rank zero) and R.5 (vanishing order, leading coefficient, leading-term functional equation, rational proportionality); ArithmeticKTheory N.3 and N.4; AutomorphicPadicLFunctions L3 (Deligne–Ribet integrality); TauCetiRoadmap.Chebotarev Layer 9; Tau Ceti `dedekindZetaCoeff` with its L-series and summability; Mathlib's archimedean factors, `padicValRat`, `Nat.eq_iff_prime_padicValNat_eq`, `Rat.den_dvd`.

## Layer 3: independent examples over ℚ and ℚ(√5)

This layer checks the formula on two fields from inputs that are each established without the Birch–Tate formula: the zeta value from Bernoulli numbers or a Dirichlet L-value, the order of K₂ from a symbol computation, and w₂ from cyclotomic Galois groups. Agreement of a numerical approximation with a rational candidate is never used. Over ℚ(√5) the formula is also a theorem (the field is abelian, §6.6), but reading #K₂ off that theorem would make the check circular, so the order 4 is taken from ArithmeticKTheory N.8's certificate.

Standing assumptions for this layer: ℚ(√5) is a number field K with an element θ ∈ 𝓞_K, `minpoly ℤ θ = X ^ 2 - X - 1` and `Algebra.adjoin ℚ {(θ : K)} = ⊤`, the presentation of Tau Ceti's worked example `TauCeti.NumberField.Sqrt5` (θ = (1 + √5)/2); equivalently a generator of square 5. χ₅ is the quadratic character modulo 5.

### 3.1 The rationals

References: K-book VI.8.6 and the paragraph after it, book p. 515 (ζ_ℚ(−1) = −1/12, #K₂(ℤ) = 2, w₂(ℚ) = 24); K-book VI.8.1, Classical Data, book p. 514. Built on LFunctions (the K = ℚ comparison card), Mathlib `riemannZeta_neg_nat_eq_bernoulli`, `bernoulli_two`, `Rat.ringOfIntegersEquiv`, `Module.finrank_self`, K2SymbolsBrauer T.1 and T.5, ArithmeticKTheory N.4.

**The zeta value.** Prove `dedekindZetaC_rat_neg_one`: ζ_ℚ(−1) = −1/12. LFunctions' K = ℚ card identifies `completedDedekindZeta ℚ` with Mathlib's `completedRiemannZeta` off 0 and 1; dividing both by Γ_ℝ(−1) = −2π ≠ 0 (§2.1) identifies ζ_ℚ(−1) with Mathlib's `riemannZeta (-1)`, and `riemannZeta_neg_nat_eq_bernoulli` at k = 1 with `bernoulli_two` gives (−1)¹·(1/6)/2 = −1/12. The value comes from Bernoulli numbers, never from the formula being tested. *Needs:* LFunctions K = ℚ card, `gammaℝ_neg_one`, Mathlib `riemannZeta_neg_nat_eq_bernoulli`, `bernoulli_two`.

**The order of K₂.** Prove `natCard_K2_ringOfIntegers_rat`: #K₂(𝓞_ℚ) = 2. `Rat.ringOfIntegersEquiv : 𝓞 ℚ ≃+* ℤ` induces a group isomorphism K₂(𝓞_ℚ) ≅ K₂(ℤ) by `K2.map` (K2SymbolsBrauer T.1), and K₂(ℤ) is cyclic of order two generated by {−1, −1} (K2SymbolsBrauer T.5), with the lower bound from the real sign symbol and the upper bound from the integral generation theorem, neither of which uses a zeta value. *Needs:* K2SymbolsBrauer T.1 and T.5, Mathlib `Rat.ringOfIntegersEquiv`.

**The formula for ℚ.** Prove `birchTateFormula_rat`: BirchTateFormula ℚ holds. With [ℚ : ℚ] = 1 (`Module.finrank_self`), w₂(ℚ) = 24 (ArithmeticKTheory N.4, values over the rationals) and the two lemmas above, the right side is (−1)¹·2/24 = −1/12. *Needs:* `BirchTateFormula`, `dedekindZetaC_rat_neg_one`, `natCard_K2_ringOfIntegers_rat`, ArithmeticKTheory N.4.

### 3.2 The real quadratic field ℚ(√5)

References: K-book VI.8.6, book p. 515 (Birch–Tate holds for abelian fields, so the example must compute #K₂ independently); Cohen, *Number Theory II*, §10.5.2, Proposition 10.5.5, p. 219, for the quadratic factorisation at D = 5, and §10.3.1, Theorem 10.3.1 and Corollary 10.3.3, pp. 186–189, for values of Dirichlet L-functions at negative integers by Bernoulli polynomials; Kolster 2009, Lecture 2 §3, before Corollary 3.4, p. 15, for w₂ as the order of H⁰(F, ℚ/ℤ(2)). Built on Mathlib `quadraticChar`, `MulChar.ringHomComp`, `DirichletCharacter.LFunction`, `ZMod.LFunction_def_even`, `HurwitzZeta.hurwitzZeta_neg_nat`, `Polynomial.bernoulli`, `IsCyclotomicExtension.Rat.galEquivZMod`, `IsCyclotomicExtension.Rat.galEquivZMod_restrictNormal_apply`; LFunctions Layer 4; ArithmeticKTheory N.4 and N.8.

**The quadratic character modulo 5.** Define `TauCeti.BirchTate.chiFive : DirichletCharacter ℂ 5` as Mathlib's quadratic character of the field ZMod 5, `quadraticChar (ZMod 5)`, composed with the cast ℤ → ℂ (`MulChar.ringHomComp`). Its API is `chiFive_apply_one`, `chiFive_apply_two`, `chiFive_apply_three`, `chiFive_apply_four` and `chiFive_apply_zero` (the values 1, −1, −1, 1, 0), `chiFive_eq_legendreSym` (χ₅(a) = `legendreSym 5 a` for every integer a), `chiFive_even` (`chiFive.Even`, since χ₅(−1) = χ₅(4) = 1), and `chiFive_ne_one`. The character is the one attached to ℚ(√5) by the splitting law: an odd prime p ≠ 5 splits exactly when χ₅(p) = 1 (current Tau Ceti `TauCeti.NumberField.Sqrt5.ncard_primesOver_eq_two_iff_mod_five`), 2 is inert and 5 ramifies. *Needs:* Mathlib `quadraticChar`, `MulChar.ringHomComp`, `legendreSym`.

**Checks.**
- (computation) χ₅(2) = −1, matching the inertia of 2 in ℚ(√5) (current Tau Ceti `inertiaDeg_eq_two_of_mem_primesOver_two`), and χ₅(11) = χ₅(1) = 1, matching 11 = (4 + √5)(4 − √5) up to units.
- (degenerate) χ₅(5) = χ₅(0) = 0: the ramified prime contributes the Euler factor 1 to L(s, χ₅).
- (non-example) χ₅ is not the trivial character modulo 5, whose L-function is ζ(s)(1 − 5^{−s}) and has a pole at 1; and χ₅ is even, whereas an odd character χ has L(−1, χ) = 0 (Mathlib `DirichletCharacter.Odd.LFunction_neg_two_mul_nat_sub_one`), so a parity error would give ζ_{ℚ(√5)}(−1) = 0.

**The L-value.** Prove `LFunction_chiFive_neg_one`: L(−1, χ₅) = −2/5, for Mathlib's continued `DirichletCharacter.LFunction chiFive`. Since χ₅ is even, `ZMod.LFunction_def_even` writes L(−1, χ₅) = 5¹·Σ_{j ∈ ZMod 5} χ₅(j)·ζ(j/5, −1) with the even Hurwitz functions, and the odd parts cancel; `HurwitzZeta.hurwitzZeta_neg_nat` at k = 1 gives ζ(x, −1) = −B₂(x)/2 with B₂(x) = x² − x + 1/6 for x ∈ [0, 1]. With χ₅(1) = χ₅(4) = 1 and χ₅(2) = χ₅(3) = −1,

```text
Σ χ₅(j)·B₂(j/5) = (1 + 16 − 4 − 9)/25 − (1 + 4 − 2 − 3)/5 + 0 = 4/25,
L(−1, χ₅) = 5 · (−1/2) · 4/25 = −2/5.
```

The value is the generalised Bernoulli value −B_{2,χ₅}/2 with B_{2,χ₅} = 4/5 (Cohen Corollary 10.3.3, pp. 188–189). *Needs:* `chiFive`, `chiFive_even`, Mathlib `ZMod.LFunction_def_even`, `HurwitzZeta.hurwitzZeta_neg_nat`, `Polynomial.bernoulli`.

**The zeta value.** Prove `dedekindZetaC_sqrtFive_neg_one`: ζ_{ℚ(√5)}(−1) = 1/30. LFunctions Layer 4 gives ζ_{ℚ(√5)}(s) = ζ(s)·L(s, χ₅) as continued functions off s = 1 (the quadratic factorisation at D = 5); at s = −1 this is (−1/12)·(−2/5) = 1/30. The sign + = (−1)² agrees with §2.4. *Needs:* LFunctions Layer 4, `dedekindZetaC_rat_neg_one`, `LFunction_chiFive_neg_one`.

**The twisted roots of unity.** Prove `wInvariant_two_sqrtFive`: w₂(ℚ(√5)) = 120, with w₂^{(2)} = 8, w₂^{(3)} = 3, w₂^{(5)} = 5 and w₂^{(ℓ)} = 1 for ℓ ≥ 7. ArithmeticKTheory N.4 says ℓ^ν divides w₂(F) exactly when Gal(F(μ_{ℓ^ν})/F) has exponent dividing 2, and bounds the primes: W₂^{(ℓ)}(F) = 0 once ℓ − 1 > 2[F : ℚ] = 4.
- ℓ = 5: with ζ a primitive fifth root of unity and t = ζ + ζ^{−1}, t² + t − 1 = 0 and (2t + 1)² = 5, so F is the quadratic subfield of ℚ(μ₅). By the explicit Galois equivalence `IsCyclotomicExtension.Rat.galEquivZMod` and its restriction compatibility, Gal(F(μ₅)/F) is cyclic of order 2 and Gal(F(μ₂₅)/F) cyclic of order 10, so 5 divides w₂ and 25 does not.
- ℓ = 3: ℚ(μ₉) is cyclic of degree 6 over ℚ, so its only quadratic subfield is ℚ(√−3) ≠ F, and F ∩ ℚ(μ₉) = ℚ; hence Gal(F(μ₃)/F) ≅ C₂ and Gal(F(μ₉)/F) ≅ C₆, and w₂^{(3)} = 3.
- ℓ = 2: the quadratic subfields of ℚ(μ₁₆) are ℚ(i), ℚ(√2) and ℚ(√−2); F is none of them (it is real and 5/2 is not a rational square), so F ∩ ℚ(μ₁₆) = ℚ and the exponents are those over ℚ: 2 at level 8, 4 at level 16, so w₂^{(2)} = 8.
- ℓ ≥ 7: Gal(F(μ_ℓ)/F) is cyclic of order ℓ − 1 or (ℓ − 1)/2 ≥ 3.
These are finite cyclotomic computations for this field. *Needs:* ArithmeticKTheory N.4 (the criterion and the bound), Mathlib `IsCyclotomicExtension`, `IsCyclotomicExtension.Rat.galEquivZMod`, `IsCyclotomicExtension.Rat.galEquivZMod_restrictNormal_apply`.

**The check.** Prove `birchTateFormula_sqrtFive`: BirchTateFormula ℚ(√5) holds, from #K₂(𝓞_{ℚ(√5)}) = 4 (ArithmeticKTheory N.8: K₂(𝓞_{ℚ(√5)}) ≅ (ℤ/2)², generated by {−1, −1} and {−1, ε} with ε = (1 + √5)/2, the lower bound from the signs at the two real places and the upper bound from its generation theorem), ζ_{ℚ(√5)}(−1) = 1/30 and w₂ = 120: (−1)²·4/120 = 1/30. *Needs:* `BirchTateFormula`, `dedekindZetaC_sqrtFive_neg_one`, `wInvariant_two_sqrtFive`, ArithmeticKTheory N.8.

### Examples

- ℚ: −1/12 = (−1)·2/24. Dropping the sign gives +1/12; using w₁(ℚ) = 2 gives −1; using K₂ of the field gives 0.
- ℚ(√5): 1/30 = 4/120. The prime 5 enters w₂ because ℚ(√5) is the quadratic subfield of ℚ(μ₅), so w₂(ℚ(√5)) = 5·w₂(ℚ) while `NumberField.Units.torsionOrder` is 2 for this field.
- ℚ(√2) (used in Layers 6 and 7): ζ_{ℚ(√2)}(−1) = ζ(−1)·L(−1, χ₈) = (−1/12)(−1) = 1/12 with B_{2,χ₈} = 2; w₂(ℚ(√2)) = 48 because ℚ(√2) ⊂ ℚ(μ₈) makes the 2-part 16; the formula gives #K₂(ℤ[√2]) = 48/12 = 4.

### Dependencies

Layers 1–2; LFunctions (the K = ℚ card and Layer 4 quadratic factorisation); K2SymbolsBrauer T.1 and T.5; ArithmeticKTheory N.4 and N.8; current Tau Ceti `TauCeti.NumberField.Sqrt5` for the arithmetic of ℚ(√5); Mathlib's Riemann, Hurwitz and Dirichlet functions, `quadraticChar` and the cyclotomic Galois equivalences.

## Layer 4: S-integers, Euler factors and naturality

This layer passes from 𝓞_F to rings of S-integers 𝓞_{F,S}, for S a finite set of finite primes: it deletes the Euler factors at S from ζ_F, computes the deleted factors at negative integers, counts K₂(𝓞_{F,S}), proves that the Birch–Tate formula is equivalent to its S-integral form with the sign (−1)^{[F:ℚ]+|S|}, and records the naturality of the arithmetic comparisons under enlarging S that Layers 5, 7 and 8 use. The archimedean places are never removed.

Standing assumptions for this layer: F is a number field; S ⊆ T are finite sets of finite primes (`Finset (HeightOneSpectrum (𝓞 F))`); for v a finite prime, Nv = `Ideal.absNorm v.asIdeal` and k(v) = 𝓞_F/v; n ≥ 2.

### 4.1 Deleting Euler factors

References: Kolster 2009, Lecture 1 §1, p. 8 (the S-modified zeta function is ζ_F with the Euler factors at S removed). Built on Mathlib `Ideal.absNorm`, `Finset.prod`, `Complex.cpow`; current Tau Ceti `TauCeti.LSeries_ofBadPrimes` and `TauCeti.MultiplicativeIdealWeight.ofBadPrimes`; LFunctions Layer 3.

**The Euler factor of a finite set of primes.** Define `TauCeti.BirchTate.sEulerFactor F S : ℂ → ℂ` by

```text
sEulerFactor F S s = ∏_{v ∈ S} (1 − Nv^{−s}),
```

the complex power of the natural number Nv ≥ 2. It is the factor that current Tau Ceti's `LSeries_ofBadPrimes` multiplies `dedekindZeta` by, written with the same expression `∏ P ∈ S, (1 - (Ideal.absNorm P.asIdeal : ℂ) ^ (-s))`. Its API is `sEulerFactor_empty` (the empty product is 1), `sEulerFactor_insert` (for v ∉ S, sEulerFactor F (insert v S) s = sEulerFactor F S s·(1 − Nv^{−s})), `sEulerFactor_union` (for disjoint S and T the factors multiply), `differentiable_sEulerFactor` (it is entire), `sEulerFactor_one_sub_natCast` (at s = 1 − n, with n a natural number, it is ∏_{v∈S}(1 − Nv^{n−1})), `sEulerFactor_neg_one` (at s = −1 it is (−1)^{|S|}∏_{v∈S}(Nv − 1)) and `sEulerFactor_one_sub_ne_zero` (for n ≥ 2 the value at 1 − n is nonzero, since each Nv^{n−1} ≥ 2). *Needs:* Mathlib `Ideal.absNorm`, `Finset.prod_insert`, `Complex.cpow_natCast`, `Complex.cpow_neg`.

**Checks.**
- (degenerate) For S = ∅ the factor is the constant 1.
- (computation) For F = ℚ and S = {(2), (3)}, the value at −1 is (1 − 2)(1 − 3) = 2 = (−1)²·(1·2).
- (degenerate) At s = 0 every factor is 1 − 1 = 0, so for S ≠ ∅ the factor vanishes at s = 0: the hypothesis n ≥ 2 in `sEulerFactor_one_sub_ne_zero` cannot be weakened to n ≥ 1.
- (non-example) The deleted factor is 1 − Nv^{−s}, not its inverse: for F = ℚ and S = {(3)} at s = −1 the factor is −2, whereas the inverse would give −1/2.

**The S-modified zeta function.** Define `TauCeti.BirchTate.sModifiedZeta F S s = ζ_F(s)·sEulerFactor F S s`, with ζ_F LFunctions' continued function. Its API is `sModifiedZeta_empty` (sModifiedZeta F ∅ = ζ_F), `sModifiedZeta_insert` (the relation of `sEulerFactor_insert`), `sModifiedZeta_eq_LSeries_ofBadPrimes` (on Re s > 1 it is the L-series of the indicator of the ideals prime to S, by LFunctions' agreement with `dedekindZeta` and current Tau Ceti's `LSeries_ofBadPrimes`), `sModifiedZeta_one_sub` and `sModifiedZeta_neg_one` (§4.2), and `meromorphic_sModifiedZeta` (meromorphic on ℂ, holomorphic off s = 1, a product of LFunctions' continuation and an entire function). *Needs:* `sEulerFactor`, LFunctions Layer 3, current Tau Ceti `TauCeti.LSeries_ofBadPrimes`.

**Checks.**
- (degenerate) S = ∅ gives ζ_F itself.
- (compatibility) For F = ℚ and S = {(2)}, on Re s > 1 the function is Σ_{m odd} m^{−s} = (1 − 2^{−s})ζ(s), Mathlib's `riemannZeta` times the deleted factor.
- (computation) For F = ℚ and S = {(2)}, ζ_{ℚ,S}(−1) = (−1/12)(1 − 2) = 1/12: the sign changes.
- (computation) For F = ℚ and S = {(3)}, ζ_{ℚ,S}(−1) = (−1/12)(1 − 3) = 1/6, whereas multiplying by the inverse factor would give 1/24.

### 4.2 The Euler factors at negative integers

References: Kolster 2009, Lecture 1 §1, p. 8. Built on §4.1 and BorelRegulators R.5.

Prove `sModifiedZeta_one_sub`: for every natural number n ≥ 2, ζ_{F,S}(1 − n) = ζ_F(1 − n)·∏_{v∈S}(1 − Nv^{n−1}), and `sModifiedZeta_neg_one`: ζ_{F,S}(−1) = (−1)^{|S|}·ζ_F(−1)·∏_{v∈S}(Nv − 1). Prove also `sModifiedZeta_leadingCoeff_one_sub`: ζ_{F,S} has the same order of vanishing d_n as ζ_F at 1 − n, and its leading coefficient is ζ*_F(1 − n)·∏_{v∈S}(1 − Nv^{n−1}), because the deleted factor is holomorphic and nonzero there (`sEulerFactor_one_sub_ne_zero`). Each Nv − 1 ≥ 1. *Needs:* `sModifiedZeta`, `sEulerFactor_one_sub_natCast`, `sEulerFactor_neg_one`, `sEulerFactor_one_sub_ne_zero`, BorelRegulators R.5 (order and leading coefficient).

### 4.3 The order of K₂ of a ring of S-integers

References: K-book V.6.8 (Soulé), book pp. 411–412 (PDF pp. 419–420): for a ring of S-integers the even-degree localisation sequence is short exact. Built on K2SymbolsBrauer T.5 (relative S-integer sequence), ArithmeticKTheory N.3 (finiteness), Mathlib `Set.integer`, `Subgroup.card_mul_index`, `QuotientGroup.quotientKerEquivOfSurjective`, `Nat.card_units`, `Nat.card_pi`, `Ideal.absNorm`.

Prove `natCard_K2_sInteger`: K₂(𝓞_{F,S}) is finite and

```text
#K₂(𝓞_{F,S}) = #K₂(𝓞_F) · ∏_{v∈S} (Nv − 1).
```

K2SymbolsBrauer T.5 gives the exact sequence 0 → K₂(𝓞_F) → K₂(𝓞_{F,S}) → ⊕_{v∈S} k(v)ˣ → 0 through the inclusion and the tame residues at the primes in S. A short exact sequence of groups with finite ends has finite middle term of order the product (`Subgroup.card_mul_index` with the first isomorphism theorem); #k(v)ˣ = #k(v) − 1 = Nv − 1 (`Nat.card_units`), and the direct sum over the finite set S has order the product (`Nat.card_pi`). *Needs:* K2SymbolsBrauer T.5 (relative sequence), ArithmeticKTheory N.3, the Mathlib declarations above.

**Checks.**
- (computation) F = ℚ, S = {(2)}: #K₂(ℤ[1/2]) = 2·1 = 2; S = {(3)}: #K₂(ℤ[1/3]) = 2·2 = 4; S = {(2), (3)}: #K₂(ℤ[1/6]) = 2·1·2 = 4 (compare ArithmeticKTheory N.8's sequence for ℤ[1/p], which splits).
- (degenerate) S = ∅ returns #K₂(𝓞_F).
- (non-example) The tame-kernel sequence of 𝓞_{F,S} itself has its residues at the primes outside S; substituting it would replace the finite product over S by an infinite direct sum, and K₂(𝓞_{F,S}) is not the kernel of the residues at S.

### 4.4 The S-integral formula

References: Kolster 2009, Lecture 1 §1, p. 8; K-book VI.8.6, book p. 515. Built on §1.1, §4.2, §4.3, ArithmeticKTheory N.4.

Prove `birchTateFormula_iff_sInteger`: for every number field F and every finite set S of finite primes,

```text
BirchTateFormula F  ⟺  ζ_{F,S}(−1) = (−1)^{[F:ℚ] + |S|} · #K₂(𝓞_{F,S}) / w₂(F).
```

By `sModifiedZeta_neg_one` and `natCard_K2_sInteger` the right side reads (−1)^{|S|}ζ_F(−1)P = (−1)^{[F:ℚ]+|S|}#K₂(𝓞_F)P/w₂(F) with P = ∏_{v∈S}(Nv − 1) ≥ 1; cancel the nonzero factor (−1)^{|S|}P. The denominator w₂(F) is unchanged: W₂ is an invariant of F, not of the ring. *Needs:* `BirchTateFormula`, `sModifiedZeta_neg_one`, `natCard_K2_sInteger`, ArithmeticKTheory N.4.

**Checks.**
- (computation) F = ℚ, S = {(2)}: 1/12 = (+1)·2/24; S = {(3)}: 1/6 = (+1)·4/24.
- (computation) F = ℚ, S = {(2), (3)}: ζ_{ℚ,S}(−1) = −1/6 = (−1)³·4/24.
- (non-example) Keeping the unmodified sign (−1)^{[F:ℚ]} after deleting one prime gives −1/12 ≠ 1/12 over ℚ with S = {(2)}.

### 4.5 Enlarging S

References: Kolster 2009, Lecture 1 §1, p. 8, and Lecture 2 §3, pp. 13–15, where descent and evaluation are carried out for any finite S. Built on §4.1–§4.3, K2SymbolsBrauer T.5.

Prove `sModifiedZeta_enlarge`: for S ⊆ T, ζ_{F,T}(s) = ζ_{F,S}(s)·∏_{v∈T∖S}(1 − Nv^{−s}), and `natCard_K2_sInteger_enlarge`: #K₂(𝓞_{F,T}) = #K₂(𝓞_{F,S})·∏_{v∈T∖S}(Nv − 1). At −1 the extra sign is (−1)^{|T∖S|}. Both identities compose along S ⊆ T ⊆ U, the differences being disjoint and the ring inclusions composing; at S = T they are the identity. The first splits the finite product; the second divides the two instances of `natCard_K2_sInteger`, the maps being the canonical inclusions and the residues of K2SymbolsBrauer T.5. *Needs:* `sEulerFactor_union`, `natCard_K2_sInteger`.

**Checks.**
- (computation) Over ℚ, deleting 2 and then 3: ζ_{ℚ,{2,3}}(−1) = −1/6 and #K₂(ℤ[1/6]) = 4; the two extra signs restore a negative value.
- (degenerate) S = T: the product is empty, the sign is +1 and both identities are equalities.

### 4.6 Naturality of the arithmetic comparisons under change of S

References: Kolster 2009, Lecture 1 §1, p. 8, and Lecture 2 §3, pp. 13–15; K-book V.11.11 (proof) and V.11.12(4), book pp. 457–459, for étale Chern classes and their naturality, V.11.13, p. 458, for the sign of the degree-two Chern–symbol composite, and VI.9.4–9.5, book pp. 519–520, for real-place restriction and the odd higher K-groups of S-integers; K-book V.6.8, book pp. 411–412. Built on MotivicEtaleKTheory M.3, M.7 and M.8, K2SymbolsBrauer T.5, ArithmeticKTheory N.2 and N.3, KTheoryFiniteLocalFields L.1, BorelRegulators R.4 and R.7, IntegralIwasawaTheory I.10.

Prove `tateMap_localisation_square`: for a prime ℓ and finite sets S ⊆ T of finite primes containing the primes above ℓ, the Galois-symbol isomorphisms h_S : K₂(𝓞_{F,S}) ⊗ ℤ_ℓ → H²_cont(𝓞_{F,S}, ℤ_ℓ(2)) of MotivicEtaleKTheory M.3 (applied with the place sets S ∪ S_∞ and T ∪ S_∞) commute with the maps induced by 𝓞_{F,S} ⊆ 𝓞_{F,T}, with cohomological restriction, and with coefficient transitions; and at a finite coefficient level m = ℓ^r and a prime v ∈ T ∖ S, the boundary square commutes with the sign fixed by M.3: ∂_v ∘ h_{F,m} = −κ_{k(v)} ∘ ∂_v^{tame}, where κ_{k(v)} : k(v)ˣ/m ≅ H¹(k(v), μ_m) is the Kummer map. The compatible limits give the ℓ-adic localisation comparison. Expressing this through Chern classes uses MotivicEtaleKTheory M.8's normalised agreement c_{2,2} = −h on symbols, natural under S ⊆ T; the Tate map is not renamed a Chern class without it. The map on W₂(F) is the identity.

Prove also `regulatorCovolume_sInteger_eq`: for n ≥ 2, the map K_{2n−1}(𝓞_F) → K_{2n−1}(𝓞_{F,S}) is surjective with finite kernel (its cokernel injects into ⊕_{v∈S} K_{2n−2}(k(v)) = 0 by KTheoryFiniteLocalFields L.1, and its kernel is the image of the finite ⊕_{v∈S} K_{2n−1}(k(v)), by ArithmeticKTheory N.2 and N.3), so it induces an isomorphism of the torsion-free quotients and the normalised Borel covolume (BorelRegulators R.4, and R.7 for the Beilinson normalisation) is unchanged; Soulé's theorem (K-book V.6.8) even makes the map an isomorphism, which is not needed. The higher corrected real-place comparisons at 2 (MotivicEtaleKTheory M.7) and the compact-support descent of IntegralIwasawaTheory I.10 are compatible with enlarging S in the same way, their archimedean terms being untouched. The leading coefficient ζ*_{F,S}(1 − n) changes by the nonzero factor ∏_{v∈T∖S}(1 − Nv^{n−1}) of §4.2, tracked beside the finite localisation terms; no integral isomorphism of K-groups is inferred from rational ones. *Needs:* `sModifiedZeta_enlarge`, `natCard_K2_sInteger_enlarge`, MotivicEtaleKTheory M.3 (Galois symbols, finite levels, naturality, residue compatibility), M.7, M.8, K2SymbolsBrauer T.5, ArithmeticKTheory N.2 and N.3 (localisation and the finite defect), KTheoryFiniteLocalFields L.1, BorelRegulators R.4 and R.7, IntegralIwasawaTheory I.10.

**Checks.**
- (computation) F = ℚ, ℓ = 3, S = {(3)}, T = {(2), (3)}: the added factor 2 − 1 = 1 leaves the 3-primary part of K₂ unchanged while the sign of ζ_{ℚ,·}(−1) flips.
- (non-example) Adding a prime of norm q with ℓ ∣ q − 1 (for ℓ = 3, the prime 7) adds a nontrivial ℓ-part 𝔽₇ˣ{3} ≅ ℤ/3 to K₂; the comparison is natural, not an invariance of the ℓ-primary group.
- (non-example) The residue sign is visible at odd coefficients: for k(v) = 𝔽₇ and m = 3, with u a unit whose residue generates 𝔽₇ˣ and π a uniformiser, κ(ū) has order 3, so ∂h{u, π} = −κ(ū) ≠ κ(ū); a square drawn with +κ fails.

### Examples

- ℚ with S = {(2)}, {(3)}, {(2), (3)}: ζ_{ℚ,S}(−1) = 1/12, 1/6, −1/6 and #K₂(𝓞_{ℚ,S}) = 2, 4, 4, all satisfying the S-integral formula with w₂ = 24.
- ℚ(√5) with S = {(2)} (2 inert, N = 4): ζ_{F,S}(−1) = (1/30)(1 − 4) = −1/10 and #K₂(𝓞_F[1/2]) = 4·3 = 12, so (−1)^{2+1}·12/120 = −1/10.
- ℚ, n = 4, S = {(2)}: the leading coefficient changes from ζ(−3) = 1/120 to (1/120)(1 − 2³) = −7/120.

### Dependencies

Layers 1–2; LFunctions Layer 3; BorelRegulators R.4, R.5 and R.7; K2SymbolsBrauer T.5; ArithmeticKTheory N.2, N.3 and N.4; KTheoryFiniteLocalFields L.1; MotivicEtaleKTheory M.3, M.7 and M.8; IntegralIwasawaTheory I.10; current Tau Ceti `TauCeti.LSeries_ofBadPrimes`; Mathlib `Ideal.absNorm`, `Set.integer`, `Nat.card_units`, `Nat.card_pi`, `Subgroup.card_mul_index`.

## Layer 5: the odd-primary theorem

This layer proves the ℓ-adic valuation identity of the Birch–Tate formula for every odd prime ℓ and every totally real F (Wiles). It composes three comparisons. The ℓ-part of K₂(𝓞_F) is H²(𝓞_F[1/ℓ], ℤ_ℓ(2)): this is ArithmeticKTheory N.6 (through Tate's Galois symbol, MotivicEtaleKTheory M.3, and the passage from 𝓞_F to 𝓞_F[1/ℓ], which does not change ℓ-parts because the residue groups k(v)ˣ at v ∣ ℓ have order prime to ℓ, §4.3). The torsion of H¹(𝓞_F[1/ℓ], ℤ_ℓ(n)) is W_n(F){ℓ} for n ≠ 0: this is MotivicEtaleKTheory M.2. And the main conjecture computes the orders of finite Iwasawa coinvariants as L-values: IntegralIwasawaTheory I.5 with the descent of I.4. What this layer adds is Galois codescent for extensions of degree prime to ℓ, the resulting étale form of the special-value formula, stated in the generality of its source for a character χ of order prime to ℓ and every weight n ≥ 2 of the right parity, and the theorem. No higher norm-residue theorem is used: in weight two Tate's theorem suffices.

Standing assumptions for this layer: F is a number field, totally real where stated; ℓ is an odd prime; S is a finite set of finite primes of F containing the primes above ℓ, and 𝓞^S_E is the ring of S-integers of a finite extension E of F (primes above S); H^i(𝓞^S_E, M) is continuous Galois cohomology of the Galois group of the maximal extension of E unramified outside S and the archimedean places, which is étale cohomology of Spec 𝓞^S_E for odd ℓ; n ≥ 2.

### 5.1 Codescent for extensions of degree prime to ℓ

References: Kolster 2009, Lecture 1 §2, Proposition 2.3, p. 12 (descent and codescent from the Hochschild–Serre and Tate spectral sequences), with the vanishing of H^{≥3} for odd ℓ from Proposition 2.1, p. 10. Built on ArithmeticKTheory N.6 (finiteness of H², vanishing of H^{≥3} for odd ℓ) and MotivicEtaleKTheory M.2 (finite generation of H^i(𝓞^S_E, ℤ_ℓ(n))).

Prove `etaleCohomology_codescent`: let E/F be a finite Galois extension of number fields with group G of order prime to ℓ, S containing the primes above ℓ and the primes ramified in E, and n an integer. Then

```text
H¹(E, ℤ_ℓ(n))^G ≅ H¹(F, ℤ_ℓ(n)),   H²(𝓞^S_E, ℤ_ℓ(n))_G ≅ H²(𝓞^S_E, ℤ_ℓ(n))^G ≅ H²(𝓞^S_F, ℤ_ℓ(n)),
Ĥ^k(G, H¹(E, ℤ_ℓ(n))) ≅ Ĥ^k(G, H²(𝓞^S_E, ℤ_ℓ(n)))   for every k,
```

the maps being restriction and corestriction. Since #G is invertible on ℓ-primary modules, H^q(G, M) = 0 for q ≥ 1 and invariants equal coinvariants; the Hochschild–Serre spectral sequence for 𝓞^S_E over 𝓞^S_F collapses, and the vanishing of H^{≥3} for odd ℓ gives the coinvariant statement in the top degree. For a character χ of G, the χ-component M^χ of a ℤ_ℓ[G]-module (with ℤ_ℓ[χ]-coefficients) is an exact functor, and the trivial component is M^G. *Needs:* ArithmeticKTheory N.6, MotivicEtaleKTheory M.2.

**Checks.**
- (degenerate) For G trivial every map is the identity.
- (computation) E = ℚ(μ₃), F = ℚ, ℓ = 3: #G = 2 is prime to 3, so for n = 2, H²(ℤ[μ₃, 1/3], ℤ₃(2))^G ≅ H²(ℤ[1/3], ℤ₃(2)) = 0, as K₂(ℤ){3} = 0.
- (non-example) The proof uses that corestriction after restriction is multiplication by #G, invertible on ℓ-primary modules exactly when ℓ ∤ #G. For the cubic field E = ℚ(μ₉)^+ over F = ℚ and ℓ = 3 it is multiplication by 3, and Ĥ⁰(G, ℤ₃) = ℤ/3 ≠ 0 for the trivial action: the order hypothesis cannot be dropped.

### 5.2 Étale Euler characteristics and L-values at odd primes

References: Kolster 2009, Lecture 2 §3: the set-up, p. 13; Proposition 3.1 (descent) and Proposition 3.2 (evaluation, for ψ ≠ 1), p. 14; Theorem 3.3, p. 15 (stated for a "real field": totally real is meant, since the main conjecture and the parity argument need it); Lecture 1 §1, Iwasawa's Main Conjecture 1.3 (Wiles), p. 9; K-book VI.8.7 (Wiles), book p. 515, for the weight-2k form ζ_F(1 − 2k) = u_k·#H²/#H¹ with u_k prime to ℓ. Built on IntegralIwasawaTheory I.4 (twisted coinvariant descent, coinvariant evaluation) and I.5 (Wiles's main conjecture and its special-value endpoint), IntegralIwasawaTheory I.3 and AutomorphicPadicLFunctions L3 (the Deligne–Ribet series and interpolation), MotivicEtaleKTheory M.2, ArithmeticKTheory N.4, §4.2, §5.1.

**The general theorem.** Prove `padicValRat_LFunction_one_sub_eq_etale`: let F be totally real, ℓ odd, n ≥ 2, χ a one-dimensional Artin character of F of order prime to ℓ with χ(−1) = (−1)^n, E a finite abelian extension of F of degree prime to ℓ containing F_χ and μ_ℓ, G = Gal(E/F), S as in the standing assumptions and containing the primes ramified in E, and d_χ = [ℤ_ℓ[χ] : ℤ_ℓ]. Then

```text
d_χ · v_ℓ(L_S(1 − n, χ)) = v_ℓ(#H²(𝓞^S_E, ℤ_ℓ(n))^{χ^{−1}}) − v_ℓ(#H⁰(E, ℚ_ℓ/ℤ_ℓ(n))^{χ^{−1}}),
```

with v_ℓ normalised by v_ℓ(ℓ) = 1 on the ℓ-adic completion of ℚ(χ) at a fixed embedding. The H⁰ term is nonzero only when χ = ω^{−n} on G. Put ψ = χω^n, an even character of G of order prime to ℓ, and X the Galois group of the maximal abelian pro-ℓ extension of E_∞ unramified outside S. IntegralIwasawaTheory I.5's special-value endpoint (Wiles's main conjecture with μ(X_ψ) = μ(G_ψ), coinvariant evaluation of the twist X_ψ(−n), which has no nonzero finite submodule, in the contragredient convention, and the trivial-character pole term) gives v_ℓ(#X_ψ(−n)_Γ) = d_χ·v_ℓ(L_S(1 − n, χ)) + v_ℓ(#H⁰(E, ℚ_ℓ/ℤ_ℓ(n))_{χ^{−1}}); IntegralIwasawaTheory I.4's twisted coinvariant descent identifies #X_ψ(−n)_Γ with #H²(𝓞^S_E, ℤ_ℓ(n))^{χ^{−1}}, the χ^{−1}-component of H¹(𝓞^S_E, ℚ_ℓ/ℤ_ℓ(n)) being finite because χ has parity (−1)^n (Kolster Corollary 2.2). The composite is the displayed identity. *Needs:* IntegralIwasawaTheory I.4 and I.5, `etaleCohomology_codescent` (exactness of χ-components).

**The trivial character in even weight.** Prove `padicValRat_zeta_one_sub_eq_etale`: for F totally real, ℓ odd and n ≥ 2 even,

```text
v_ℓ(ζ_F(1 − n)) = v_ℓ(#H²(𝓞_F[1/ℓ], ℤ_ℓ(n))) − v_ℓ(w_n(F)).
```

Take χ = 1 (allowed since n is even), S = S_ℓ and E = F(μ_ℓ), so G has order dividing ℓ − 1 and the only ramification is above ℓ. L_S(1 − n, 1) = ζ_F(1 − n)·∏_{v∣ℓ}(1 − Nv^{n−1}) with ℓ-adic unit factors (`sModifiedZeta_one_sub`); the trivial component of H²(𝓞_E[1/ℓ], ℤ_ℓ(n)) is H²(𝓞_F[1/ℓ], ℤ_ℓ(n)) by codescent (§5.1); and the trivial component of H⁰(E, ℚ_ℓ/ℤ_ℓ(n)) is H⁰(F, ℚ_ℓ/ℤ_ℓ(n)) = W_n(F){ℓ} (ArithmeticKTheory N.4). The pole term is present exactly when ω^n is trivial on G, which is when W_n(F){ℓ} ≠ 0. *Needs:* `padicValRat_LFunction_one_sub_eq_etale`, `etaleCohomology_codescent`, `sModifiedZeta_one_sub`, ArithmeticKTheory N.4.

**Checks.**
- (computation) F = ℚ, n = 2, ℓ = 3: v₃(ζ(−1)) = v₃(−1/12) = −1 = 0 − 1, with H²(ℤ[1/3], ℤ₃(2)) = 0 and W₂(ℚ){3} = ℤ/3.
- (computation) F = ℚ(√5), n = 2, ℓ = 5: ζ_F(−1) = 1/30 has v₅ = −1; [F(μ₅) : F] = 2, so W₂(F){5} = ℤ/5 and H²(𝓞_F[1/5], ℤ₅(2)) has trivial 5-part.
- (computation) F = ℚ, n = 4, ℓ = 5: ζ(−3) = 1/120 has v₅ = −1 = 0 − 1, since v₅(w₄(ℚ)) = v₅(240) = 1, so H²(ℤ[1/5], ℤ₅(4)) is trivial.
- (non-example) Without the pole term the formula would read v₃(ζ(−1)) = v₃(#H²) = 0 for ℚ, contradicting v₃(−1/12) = −1: the H⁰ denominator enters exactly when ω^n is trivial on Gal(F(μ_ℓ)/F).
- (non-example) For an odd character χ and even n the parity condition fails; for F = ℚ, χ = χ₋₄ and n = 2, L(−1, χ₋₄) = 0 (Mathlib `DirichletCharacter.Odd.LFunction_neg_two_mul_nat_sub_one`), and no finite cohomological order can equal it.

### 5.3 The odd-primary Birch–Tate theorem

References: K-book VI.8.6, book p. 515 (the odd part, proved by Wiles using Tate's computation), and VI.8.7, book p. 515; Kolster 2009, Lecture 2 §3, Corollary 3.4 and Conjecture 3.5, p. 15. Built on ArithmeticKTheory N.6 (even K-groups at odd primes), §5.2, ArithmeticKTheory N.4.

Prove `padicValNat_card_K2_odd`: for every totally real F and every odd prime ℓ,

```text
v_ℓ(#K₂(𝓞_F)) = v_ℓ(w₂(F)) + v_ℓ(|ζ_F(−1)|).
```

ArithmeticKTheory N.6 (even K-groups at odd primes, at i = 1 and S = ∅) identifies K₂(𝓞_F){ℓ} with H²(𝓞_F[1/ℓ], ℤ_ℓ(2)), so v_ℓ(#K₂(𝓞_F)) = v_ℓ(#H²(𝓞_F[1/ℓ], ℤ_ℓ(2))); §5.2 at n = 2 makes this v_ℓ(ζ_F(−1)) + v_ℓ(w₂(F)). Together with §2.7 this proves the formula up to its 2-part. *Needs:* ArithmeticKTheory N.6, `padicValRat_zeta_one_sub_eq_etale`, ArithmeticKTheory N.4.

**Checks.**
- (computation) F = ℚ: at ℓ = 3, 0 = 1 + (−1); at ℓ ≥ 5, 0 = 0 + 0.
- (computation) F = ℚ(√5): at ℓ = 3 and ℓ = 5, 0 = 1 + (−1); so #K₂(𝓞_F) is a power of 2, matching the certified order 4.
- (non-example) At ℓ = 2 the same identity is not proved here: the identification of K₂(𝓞_F){2} with H² holds at 2 (MotivicEtaleKTheory M.3, ArithmeticKTheory N.6's two-primary corrections), but the main-conjecture input of §5.2 is for odd ℓ; the 2-part is Layers 6–7.

### Examples

- ℚ, ℓ = 3: K₂(ℤ){3} = 0, H¹(ℤ[1/3], ℤ₃(2)) = ℤ/3, ζ(−1) ∼₃ 1/3.
- ℚ(√5), ℓ = 5: H²(𝓞_F[1/5], ℤ₅(2)) = 0 and W₂(F){5} = ℤ/5, so ζ_F(−1) ∼₅ 1/5.
- ℚ, n = 6, ℓ = 7: ζ(−5) = −1/252 has v₇ = −1, and v₇(w₆(ℚ)) = v₇(504) = 1, so H²(ℤ[1/7], ℤ₇(6)) is trivial.

### Dependencies

Layers 2 and 4; ArithmeticKTheory N.4 and N.6; MotivicEtaleKTheory M.2 and M.3; IntegralIwasawaTheory I.3, I.4 and I.5; AutomorphicPadicLFunctions L3.

## Layer 6: the 2-part for totally real abelian fields (Kolster and Greither)

This layer proves the 2-adic valuation identity of the Birch–Tate formula for every totally real F abelian over ℚ by the classical route, and assembles the full formula for those fields. Kolster reduces the 2-part of K₂(𝓞_F) to the Γ-invariants of the Tate twist of the minus class module of the cyclotomic ℤ₂-tower over F(√−1) (Theorem 1), evaluates those invariants by the characteristic series (Lemma 2), and shows that Federer's main conjecture at 2 turns this into the 2-part of the formula (Theorem 5). For F abelian over ℚ, Federer's conjecture follows from Greither's main conjecture for abelian fields at p = 2. The route is kept beside the modern one of Layer 7 because it is a second, independent proof for abelian fields and fixes the classical normalisations (the factor 2^{[F:ℚ]}, the covariant dual action, the pole factor u^s − u) that Layer 7 compares with.

Standing assumptions for this layer: F is a totally real number field; the tower F₀ = F(√−1), e, F_n, F_∞, Γ, γ₀, u, Λ = ℤ₂⟦T⟧ and the minus modules A_n^−, A_∞^− = lim→ A_n^−, Ǎ_∞^− = Hom(A_∞^−, ℚ₂/ℤ₂) with the covariant action are as in the Conventions; 𝒯 = lim μ_{2^n} is the Tate module of 2-power roots of unity; K₂(𝓞_F)(2) = K₂(𝓞_F){2}; U_n^+ is the unit group of F_n^+ and U_∞^+ = lim→ U_n^+; for an element f of Λ and a point t of 4ℤ₂, f(t) is its evaluation, which converges.

### 6.1 The 2-adic zeta series and Federer's main conjecture

References: Kolster 1989, the tower F_n, Γ, γ₀ and u, p. 248, and Conjecture 3 with the definition of G(T), p. 250. Built on AutomorphicPadicLFunctions L3 (the Deligne–Ribet 2-adic L-function and its 2-adic refinement), IntegralIwasawaTheory I.3 (dictionary to power series) and I.2 (the minus module, its dual, Federer's theorem), IntegralIwasawaTheory I.1 (the coordinate T = γ₀ − 1 and change of generator), TauCetiRoadmap.PadicMeasuresIwasawaAlgebras Layer 4 (Weierstrass theory, characteristic ideals), Mathlib `PowerSeries`, `PadicInt`, `Ideal.span`, `Associated`.

**The 2-adic zeta series.** Prove `exists_unique_twoAdicZetaSeries`: there is a unique G_F ∈ Λ with

```text
L₂(χ₀, s) = G_F(u^s − 1) / (u^s − u)   for s ∈ ℤ₂, s ≠ 1,
```

where L₂(χ₀, s) is the 2-adic zeta function of F (the Deligne–Ribet 2-adic L-function of the trivial character χ₀ of Gal(F₀/F), AutomorphicPadicLFunctions L3, in Kolster's normalisation), and G_F ∈ 2^{[F:ℚ]}Λ (Kolster p. 250, from Deligne–Ribet's 2-adic refinement in L3). Uniqueness: s ↦ u^s − 1 maps ℤ₂ onto 2^eℤ₂, and a nonzero element of ℤ₂⟦T⟧ has only finitely many zeros in the open unit disc (Weierstrass preparation). Write `twoAdicZetaSeries F` for G_F. Its interpolation at negative integers is L₂(χ₀, 1 − n) = ζ_F(1 − n)·∏_{v∣2}(1 − Nv^{n−1}) for even n, the twist ω^{−n} being trivial at p = 2 for even n. *Needs:* AutomorphicPadicLFunctions L3, IntegralIwasawaTheory I.3, PadicMeasuresIwasawaAlgebras Layer 4.

**Checks.**
- (computation) F = ℚ: e = 2, and G_ℚ(u^{−1} − 1) = L₂(χ₀, −1)·(u^{−1} − u) = ζ(−1)(1 − 2)(u^{−1} − u) = (1/12)(u^{−1} − u); for u = 5 this is (1/12)(1/5 − 5) = −2/5, of 2-adic valuation 1 = [ℚ : ℚ].
- (computation) F = ℚ(√2) = ℚ(ζ₈)^+: e = 3 and F_∞ = ℚ(μ_{2^∞}); ζ_F(−1) = 1/12, L₂(χ₀, −1) = (1/12)(1 − 2), and v₂(u^{−1} − u) = e + 1 = 4 (for u = 9, u^{−1} − u = −80/9), so v₂(G_F(u^{−1} − 1)) = −2 + 4 = 2 = [F : ℚ].
- (non-example) Without the pole factor (u^s − u) the function G_F would not be a power series: L₂(χ₀, s) has a pole at s = 1.

**Federer's main conjecture at 2.** Define `TauCeti.BirchTate.FedererMainConjecture F : Prop` as the equality of principal ideals

```text
(G_F) = (2^{[F:ℚ]} · f_F)   in Λ,
```

where f_F is a characteristic series of the finitely generated torsion Λ-module Ǎ_∞^− (IntegralIwasawaTheory I.2), defined up to a unit of Λ, so the ideal (f_F) is well defined. Its API is `federerMainConjecture_iff_associated` (since Λ is a domain, the predicate is equivalent to G_F and 2^{[F:ℚ]}f_F being associated, Mathlib `Ideal.span_singleton_eq_span_singleton`), `federerMainConjecture_mul_unit` (replacing f_F by εf_F for a unit ε of Λ does not change the predicate) and `federerMainConjecture_change_generator`: for γ′ = γ₀^c with c ∈ ℤ₂ˣ, T′ = γ′ − 1 and u′ = u^c, the old coordinate is T = (1 + T′)^{c^{−1}} − 1 (IntegralIwasawaTheory I.1); the characteristic series transports by this substitution φ, and the zeta series by G′_F(T′) = Q(T′)·φ(G_F), where Q(T′) = ((1 + T′) − u^c)/((1 + T′)^{c^{−1}} − u) is a unit of Λ once the common zero T′ = u^c − 1 of numerator and denominator is cancelled (its value there is c·u^{c−1}, and the remaining denominator has unit constant term ≡ c^{−1} mod 2); so the predicates in the two coordinates are equivalent. *Needs:* `twoAdicZetaSeries`, IntegralIwasawaTheory I.1 and I.2, PadicMeasuresIwasawaAlgebras Layer 4.

**Checks.**
- (computation) F = ℚ: the class numbers of ℚ(ζ_{2^n}) are odd, so A_∞^− = 0 and f_ℚ = 1; G_ℚ ∼ 2, so FedererMainConjecture ℚ holds with both ideals equal to (2).
- (computation) F = ℚ(√2): F_∞ = ℚ(μ_{2^∞}), f = 1, and both ideals are (4) = (2^{[F:ℚ]}).
- (non-example) Dropping the factor 2^{[F:ℚ]} gives a false statement already for ℚ: (G_ℚ) = (2) while (f_ℚ) = (1).

### 6.2 Kolster's Theorem 1: the 2-part of K₂ from the minus module

References: Kolster 1989, Theorem 1 and its proof, p. 249, which uses Kolster's exact sequence for the 2-Sylow subgroup of K₂ (Kolster, "The structure of the 2-Sylow subgroup of K₂(o), II", K-Theory 1 (1987), Theorem 3.7, as stated in Kolster 1989, p. 249) and Iwasawa's description of the Galois cohomology of the units ("On cohomology groups of units for ℤ_p-extensions", Amer. J. Math. 105 (1983), Proposition 2, as stated in Kolster 1989, p. 249). Built on IntegralIwasawaTheory I.2 (the minus module, the unit cohomology), ArithmeticKTheory N.3 (finiteness of K₂(𝓞_F)), Mathlib `NumberField.Units.rank`, `NumberField.Units.finrank_eq`, `NumberField.IsTotallyReal.nrComplexPlaces_eq_zero`.

**Kolster's exact sequence.** Prove `kolster_twoSylow_sequence`: for totally real F there is an exact sequence of finite groups

```text
0 → (μ₂ ⊗ U_∞^+)^Γ → K₂(𝓞_F)(2) → (𝒯 ⊗_{ℤ₂} A_∞^−)^Γ → H¹(Γ, μ₂ ⊗ U_∞^+) → 0.
```

The map K₂(𝓞_F)(2) → (𝒯 ⊗ A_∞^−)^Γ comes from Tate's description of K₂ of the ring of integers of F_n through the Galois symbol and the Kummer pairing of the tower (MotivicEtaleKTheory M.3, ArithmeticKTheory N.6), passed to the limit along F_n; the outer terms measure the failure of Galois descent for the unit modules. *Needs:* MotivicEtaleKTheory M.3, ArithmeticKTheory N.3 and N.6, IntegralIwasawaTheory I.2.

**The unit cohomology factor.** Prove `card_unitInvariants_div_card_unitH1`: #(μ₂ ⊗ U_∞^+)^Γ = 2^{[F:ℚ]}·#H¹(Γ, μ₂ ⊗ U_∞^+). Let ℰ = U_∞^+/{±1}, a torsion-free group. Since Tor(μ₂, ℰ) = 0, the sequence 0 → μ₂ ⊗ μ₂ → μ₂ ⊗ U_∞^+ → μ₂ ⊗ ℰ → 0 is exact; for the procyclic Γ the quotient #M^Γ/#H¹(Γ, M) is multiplicative along short exact sequences of finite modules and equals 1 for ℤ/2 with trivial action, so the claim is #(μ₂ ⊗ ℰ)^Γ = 2^{[F:ℚ]}·#H¹(Γ, μ₂ ⊗ ℰ). Squaring gives 0 → ℰ → ℰ → μ₂ ⊗ ℰ → 0 and a long exact sequence through H¹(Γ, ℰ) and H²(Γ, ℰ). Iwasawa's Proposition 2 (IntegralIwasawaTheory I.2) gives H¹(Γ, ℰ) ≅ B ⊕ (ℚ₂/ℤ₂)^r and H²(Γ, ℰ) ≅ (ℚ₂/ℤ₂)^{r−1} with B finite and 1 ≤ r ≤ d, d the number of dyadic primes of F_∞^+; with 2^s = #B[2] = #B/2B, the sequence gives #(μ₂ ⊗ ℰ)^Γ = #(ℰ^Γ/2)·2^{s+r} and #H¹(Γ, μ₂ ⊗ ℰ) = 2^{s+r−1}. Finally ℰ^Γ is free of rank [F : ℚ] − 1 by Dirichlet's unit theorem for the totally real F, so #(ℰ^Γ/2) = 2^{[F:ℚ]−1}. *Needs:* IntegralIwasawaTheory I.2 (Iwasawa's Proposition 2), Mathlib `NumberField.Units.finrank_eq`, `NumberField.Units.rank`.

**Kolster's Theorem 1.** Prove `card_K2_two_part_eq`: for every totally real F (no abelian hypothesis),

```text
#K₂(𝓞_F)(2) = 2^{[F:ℚ]} · #(𝒯 ⊗_{ℤ₂} A_∞^−)^Γ.
```

Count the four terms of `kolster_twoSylow_sequence` and substitute `card_unitInvariants_div_card_unitH1`. Layer 7's comparison reuses this theorem. *Needs:* `kolster_twoSylow_sequence`, `card_unitInvariants_div_card_unitH1`.

**Checks.**
- (computation) F = ℚ: A_∞^− = 0, so #K₂(ℤ)(2) = 2¹·1 = 2, matching K₂(ℤ) ≅ ℤ/2.
- (computation) F = ℚ(√2): A_∞^− = 0 (the class numbers of ℚ(μ_{2^n}) are odd), so #K₂(ℤ[√2])(2) = 2² = 4, matching #K₂(ℤ[√2]) = 4 from the formula (§3 examples).
- (non-example) Omitting the unit factor would give #K₂(ℤ)(2) = 1 for ℚ, contradicting the sign symbol {−1, −1} ≠ 1.

### 6.3 Kolster's Lemma 2: the invariants from the characteristic series

References: Kolster 1989, Lemma 2 and its proof, p. 250 (stated there for A_∞^− where its compact dual is meant: the direct limit A_∞^− is a union of finite Λ-submodules whenever it is nonzero, so the absence of finite submodules is a property of Ǎ_∞^−). Built on IntegralIwasawaTheory I.2 (Federer: Ǎ_∞^− has no nonzero finite Λ-submodule) and I.4 (finite coinvariant evaluation, in Kolster's covariant convention), §6.2.

Prove `card_twistedMinusInvariants`: for every totally real F,

```text
#(𝒯 ⊗_{ℤ₂} A_∞^−)^Γ ∼₂ f_F(u^{−1} − 1).
```

With the covariant action (γφ)(x) = φ(γx), the Pontryagin dual of 𝒯 ⊗ A_∞^− is the twist Ǎ_∞^−(−1), on which γ₀ acts as u·γ₀ does on Ǎ_∞^−, so its characteristic series is f_F(u^{−1}(1 + T) − 1). Pontryagin duality gives #(𝒯 ⊗ A_∞^−)^Γ = #(Ǎ_∞^−(−1))_Γ, finite by §6.2. Ǎ_∞^−(−1) has no nonzero finite Λ-submodule because Ǎ_∞^− has none (Federer), so its finite Γ-invariants vanish, and IntegralIwasawaTheory I.4 evaluates the coinvariants at T = 0: #M_Γ ∼₂ char_M(0). *Needs:* IntegralIwasawaTheory I.2 and I.4, `card_K2_two_part_eq` (finiteness).

**Checks.**
- (computation) F = ℚ: f = 1 and the invariants are trivial, of order 1 = f(u^{−1} − 1).
- (non-example) In the contragredient convention the twist would be evaluated at u − 1 instead of u^{−1} − 1; the two conventions are related by the involution γ ↦ γ^{−1} and must not be mixed (IntegralIwasawaTheory I.4).
- (non-example) For a Λ-module with a nonzero finite submodule, such as Λ/(2, T), the characteristic ideal is Λ but the coinvariants have order 2: the absence of finite submodules is used, not assumed away.

### 6.4 Kolster's Theorem 5: Federer's conjecture implies the 2-part

References: Kolster 1989, Theorem 5 and its proof, p. 250 (the proof writes ζ_e(−1) where ζ_F(−1) of the base field is meant). Built on §6.1–§6.3, ArithmeticKTheory N.4 (the 2-primary w-invariant for exceptional fields), AutomorphicPadicLFunctions L3 (interpolation), §2.7.

Prove `padicValNat_two_card_K2_of_federer`: if F is totally real and FedererMainConjecture F holds, then

```text
v₂(#K₂(𝓞_F)) = v₂(w₂(F)) + v₂(|ζ_F(−1)|).
```

A totally real F has a real place and is exceptional at 2, and ArithmeticKTheory N.4 gives w₂^{(2)}(F) = 2^{e+1}. From u = 1 + 2^eε with e ≥ 2, u^{−1} − u = (1 − u²)/u = −2^{e+1}ε(1 + 2^{e−1}ε)/u with 1 + 2^{e−1}ε odd, so w₂(F) ∼₂ u^{−1} − u. The Euler factors 1 − Nv at v ∣ 2 are odd, so L₂(χ₀, −1) ∼₂ ζ_F(−1). Hence w₂(F)ζ_F(−1) ∼₂ L₂(χ₀, −1)(u^{−1} − u) = G_F(u^{−1} − 1), which by the conjecture is ∼₂ 2^{[F:ℚ]}f_F(u^{−1} − 1), by §6.3 ∼₂ 2^{[F:ℚ]}·#(𝒯 ⊗ A_∞^−)^Γ, and by §6.2 equals #K₂(𝓞_F)(2). Since u^{−1} − 1 ∈ 4ℤ₂ the evaluations converge, and associated power series have evaluations of equal valuation. *Needs:* `FedererMainConjecture`, `twoAdicZetaSeries`, `card_K2_two_part_eq`, `card_twistedMinusInvariants`, ArithmeticKTheory N.4, AutomorphicPadicLFunctions L3.

**Checks.**
- (computation) F = ℚ, u = 5: w₂(ℚ)ζ(−1) = −2 and G_ℚ(1/5 − 1) = −2/5 have v₂ = 1 = v₂(#K₂(ℤ)).
- (computation) the identity 1 − (1 + 2^{e}ε)² = −2^{e+1}ε(1 + 2^{e−1}ε) for integers, which fixes the valuation e + 1.
- (non-example) Only the 2-adic valuation is compared; the odd primes come from Layer 5 and the sign from §2.4.

### 6.5 Federer's conjecture for totally real abelian fields

References: Greither 1992, §1, the Main Conjecture (= Theorem 3.2), p. 452, and the closing remark on Birch–Tate, p. 454; §3, Lemma 3.3 (the comparison of X with the dual of A_∞, in the covariant action), p. 469, and the exceptional character χ = ω in the proof of Theorem 3.2, p. 470 (the exclusion χ ≠ ω printed in the statement of Theorem 3.2 on p. 469 would delete the branch proved on p. 470; the inclusive statement is the one on p. 452); Rognes–Weibel, Appendix A (Kolster), Theorem A.2 and its proof, pp. 45–49, for the induction of characters and the location of roots in the variable u^{1−s}. Built on EulerSystemsCyclotomicMainConjecture L4 (Greither's main conjecture for every prime, its χ-parts and Kummer duality, the exceptional character), IntegralIwasawaTheory I.2 (minus modules) and L4 (Ferrero–Washington), DirichletPadicLFunctions L2 (Kubota–Leopoldt functions), AutomorphicPadicLFunctions L3, TauCetiRoadmap.ClassFieldTheory Layer 13 (Kronecker–Weber), §6.1.

Greither's theorem needs the base field unramified at 2, which F need not be; the comparison replaces F by an auxiliary field with the same tower, and three auxiliary statements are proved first.

**The auxiliary field.** Prove `exists_auxiliary_unramified_at_two`: for F totally real and abelian over ℚ, Kronecker–Weber (ClassFieldTheory Layer 13, in its conductor form) places F in ℚ(μ_{m2^a}) with m odd; F′ = F(μ_{2^∞}) ∩ ℚ(μ_m) is abelian over ℚ and unramified at 2 (it may be imaginary), and F(μ_{2^∞}) = F′(μ_{2^∞}) because the cyclotomic factors are disjoint. With K₀ = F′(√−1), Δ′ = Gal(K₀/ℚ), K_∞ the cyclotomic ℤ₂-extension of K₀, Γ′ = Gal(K_∞/K₀) with generator γ′ and u′ = κ(γ′), the tower K_∞ is Kolster's F_∞ and its Galois group over ℚ is Δ′ × Γ′. Kolster's Γ = Gal(F_∞/F₀) is an open procyclic subgroup, of the form {(φ(γ), γ) : γ ∈ Γ′^{2^b}} for some b ≥ 0 and a homomorphism φ : Γ′^{2^b} → Δ′ fixing √−1; one may take γ₀ = (φ(γ₁), γ₁) with γ₁ = γ′^{2^b} and u = u′^{2^b}. The even characters of F are the products χ̌ρ with χ̌ an even character of Δ′ and ρ a character of Γ′ with ρ(γ₁) = χ(φ(γ₁)) for χ = ωχ̌^{−1}; there are 2^b of them for each χ̌, so [F : ℚ] = 2^b·#Δ′/2. *Needs:* ClassFieldTheory Layer 13, Mathlib `IsAbelianGalois`, `IsCyclotomicExtension`.

**The second-kind twist in Greither's variable.** Prove `kubotaLeopoldt_secondKind_twist`: for an even character ψ of Δ′ and a character ρ of Γ′ (of the second kind), with Greither's meromorphic function 𝒢₂(T, ψ) satisfying L₂(s, ψ) = 𝒢₂(u′^s − 1, ψ) and its pole-cleared numerator P₂(T, ψ) = (T − (u′ − 1))^δ·𝒢₂(T, ψ), δ = 1 exactly when ψ is trivial,

```text
L₂(s, ψρ) = 𝒢₂(ρ(γ′)^{−1}·u′^s − 1, ψ) = P₂(ρ(γ′)^{−1}u′^s − 1, ψ) / (ρ(γ′)^{−1}u′^s − u′)^δ.
```

The multiplier is ρ(γ′)^{−1}: writing the Kubota–Leopoldt function as an integral of ⟨x⟩^{−s} against the measure of ψ (DirichletPadicLFunctions L2), the factor ρ(x) combines with ⟨x⟩^{−s} into (ρ(γ′)^{−1}u′^s)^{−log⟨x⟩/log u′}. This fixes the convention left open by the variable u^{1−s} of Rognes–Weibel A.2, which must be translated before use. There is exactly one trivial-character pole, and P₂/2 is the integral normalisation. *Needs:* DirichletPadicLFunctions L2, EulerSystemsCyclotomicMainConjecture L4.

**The norm-kernel and the quotient by 1 + j.** Prove `minusModule_normKernel_quotient_comparison`: for a CM field K with real subfield K^+ and complex conjugation j, and its cyclotomic ℤ₂-tower, the norm-kernel minus module A_∞^− = lim→ ker(N : A(K_n) → A(K_n^+)) and the quotient M/(1 + j)M of M = lim→ A(K_n) are related by explicit maps: the inclusion ker N ⊆ ker(1 + j) (whose cokernel is killed by 2, since the composite of the extension map A(K_n^+) → A(K_n) with the norm is multiplication by 2), the natural map ker(1 + j) → M/(1 + j)M, and the map M/(1 + j)M → ker(1 + j) induced by 1 − j, the two composites being multiplication by 2; so all the kernels and cokernels are killed by 2, and if μ = 0 for the tower (IntegralIwasawaTheory L4: Ferrero–Washington for abelian fields, which passes to the minus module, a submodule of A_∞, so its dual is a quotient of the dual of A_∞) these kernels and cokernels are finite; dually for the compact modules. Consequently the two give the same characteristic ideal and the same rational χ-eigenspaces, but finite groups are never erased in a finite-order computation. *Needs:* IntegralIwasawaTheory I.2 (minus modules, both conventions) and L4.

**Checks.**
- (computation) For F = ℚ(√2), F′ = ℚ, b = 1 and φ is trivial; the even characters of F are χ̌ = 1 with the two characters ρ of Γ′/Γ′², and [F : ℚ] = 2·2/2 = 2.
- (computation) For ρ of order 2 with ρ(γ′) = −1, the twisted variable is −u′^s − 1, so the root of P₂ corresponding to a zero 1 + y of the module eigenvalue matches −u′^s = 1 + y; with the opposite multiplier ρ(γ′) the two would agree only when ρ(γ′)² = 1, which hides the error at order 2 and exposes it at order 4.
- (non-example) Applying a μ = 0 statement to the meromorphic 𝒢₂ at its pole is meaningless; μ is computed on the integral numerators P₂/2.

**Federer's conjecture for abelian fields.** Prove `federerMainConjecture_of_isAbelianGalois`: if F is totally real and abelian over ℚ, then FedererMainConjecture F holds. In the coordinates of the auxiliary field, Greither's main conjecture (EulerSystemsCyclotomicMainConjecture L4, at p = 2, F′ unramified at 2) gives char(X_χ) = (P₂(T′, χ̌)/2) for every odd character χ of Δ′, χ̌ = ωχ^{−1}, including the exceptional χ = ω, where X_ω is finite and char(X_ω) = (1); by Greither's Lemma 3.3 and `minusModule_normKernel_quotient_comparison`, X is the covariant dual of the minus module, so the γ′-eigenvalues of Ǎ_∞^− are the 1 + y for roots y of the P₂, and γ₀ = (φ(γ₁), γ₁) has eigenvalues χ(φ(γ₁))(1 + y)^{2^b}. On the analytic side, ζ_{F,2}(s) = ∏_ψ L₂(s, ψ) over the even characters ψ = χ̌ρ of F, with the dyadic Euler factors removed (AutomorphicPadicLFunctions L3); by `kubotaLeopoldt_secondKind_twist`, a zero of L₂(s, χ̌ρ) at ρ(γ′)^{−1}u′^s = 1 + y gives u^s = χ(φ(γ₁))(1 + y)^{2^b}, the same eigenvalue; only χ̌ = 1 contributes poles, and its 2^b characters ρ multiply them to a unit times u^s − u, exactly once. The μ-invariants of the integral numerators P₂/2 vanish (Ferrero–Washington, IntegralIwasawaTheory L4, together with Greither's exceptional unit), and each of the [F : ℚ] analytic factors contributes one factor 2, so G_F = 2^{[F:ℚ]}·unit·P with P distinguished; the root computation identifies P with the distinguished part of f_F, and (G_F) = (2^{[F:ℚ]}f_F). *Needs:* `exists_auxiliary_unramified_at_two`, `kubotaLeopoldt_secondKind_twist`, `minusModule_normKernel_quotient_comparison`, `twoAdicZetaSeries`, `FedererMainConjecture`, EulerSystemsCyclotomicMainConjecture L4, IntegralIwasawaTheory I.2 and L4, AutomorphicPadicLFunctions L3.

**Checks.**
- (computation) F = ℚ(√2): both sides are (4), with f = 1.
- (computation) F = ℚ: F′ = ℚ, b = 0, and both sides are (2).
- (non-example) The abelian hypothesis is on F/ℚ itself; the auxiliary F′ is abelian because F is, and need not be real.

### 6.6 Birch–Tate for totally real abelian fields

References: Greither 1992, §1, closing remark, p. 454; Kolster 1989, Theorem 5, p. 250; K-book VI.8.6, book p. 515 (the full conjecture for abelian F). Built on §2.7, §5.3, §6.4, §6.5.

Prove `padicValNat_two_card_K2_of_isAbelianGalois`: for F totally real and abelian over ℚ, v₂(#K₂(𝓞_F)) = v₂(w₂(F)) + v₂(|ζ_F(−1)|), by §6.5 and §6.4. Then prove `birchTateFormula_of_isAbelianGalois`: for F totally real and abelian over ℚ, BirchTateFormula F holds. The odd primes are §5.3 (whose Iwasawa input for abelian F is the Mazur–Wiles main conjecture), the prime 2 is the preceding statement, and §2.7 (with the rationality and sign of ζ_F(−1)) assembles the formula. This endpoint uses only the classical abelian main conjectures (Mazur–Wiles at odd primes, Greither at 2), not the theorem of Layer 7. *Needs:* `padicValNat_two_card_K2_of_federer`, `federerMainConjecture_of_isAbelianGalois`, `padicValNat_card_K2_odd`, `birchTateFormula_iff_padicValRat`.

**Checks.**
- (computation) F = ℚ(√2): w₂(F) = 48 and ζ_F(−1) = 1/12, so v₂(#K₂(ℤ[√2])) = 4 − 2 = 2.
- (computation) F = ℚ(√5): #K₂(𝓞_F) = w₂(F)ζ_F(−1) = 120·(1/30) = 4, a corollary here, while §3.2 checks the same number from the independent certificate.
- (non-example) "Abelian" without "totally real" is not enough: ℚ(i) is abelian and the formula fails there (§2.3).

### Examples

- ℚ: A_∞^− = 0, f = 1, G_ℚ ∼₂ 2, #K₂(ℤ)(2) = 2.
- ℚ(√2): e = 3, w₂ = 48, ζ_F(−1) = 1/12, A_∞^− = 0, #K₂(ℤ[√2])(2) = 4 = 2².
- ℚ(√5): F(√−1) = ℚ(√5, i), e = 2 (ℚ(√5, i) contains no primitive eighth root of unity), and v₂(#K₂(𝓞_F)) = v₂(120) + v₂(1/30) = 3 − 1 = 2.

### Dependencies

Layers 2, 3 and 5; EulerSystemsCyclotomicMainConjecture L4; IntegralIwasawaTheory I.1, I.2, I.3, I.4 and L4; AutomorphicPadicLFunctions L3; DirichletPadicLFunctions L2; MotivicEtaleKTheory M.3; ArithmeticKTheory N.3, N.4 and N.6; TauCetiRoadmap.ClassFieldTheory Layer 13; TauCetiRoadmap.PadicMeasuresIwasawaAlgebras Layer 4; Mathlib `PowerSeries`, `PadicInt`, `NumberField.Units`.

## Layer 7: the 2-part for every totally real field, and the end theorem

This layer proves the 2-part of the Birch–Tate formula, and its analogue in every even weight, for every totally real F, and assembles the end theorem. The input is Kurihara's determinant main conjecture at p = 2 over an arbitrary totally real base, read as the characteristic ideal of the S-ramified Iwasawa module X_{F_∞,S} of the cyclotomic ℤ₂-extension, with ramification at the real places allowed. Kolster's cohomological argument (Rognes–Weibel, Appendix A, Theorem A.1) turns that main conjecture into ζ_F(1 − n) ∼₂ #H²/#H¹ for 𝓞_F[1/2] and every even n; in weight two, Tate's comparison identifies H² with the 2-part of K₂(𝓞_F). The layer ends with the comparison with Kolster's classical formulation: Kurihara's series and Kolster's G_F are related by an explicit change of variable, and Federer's conjecture holds for every totally real field.

Standing assumptions for this layer: F is a totally real number field; p = 2 and S = S₂ ∪ S_∞; F_∞/F is the cyclotomic ℤ₂-extension (Kolster's F_∞^+), Γ_F = Gal(F_∞/F) with generator γ, the restriction of Kolster's γ₀, so that κ(γ₀) = u and κ²(γ) = u² for the cyclotomic character κ (κ² is trivial on complex conjugation and factors through Γ_F); Λ = ℤ₂⟦Γ_F⟧ = ℤ₂⟦T⟧ with T = γ − 1; X = X_{F_∞,S} is the Galois group of the maximal abelian pro-2 extension of F_∞ unramified outside S (ramification at the real places allowed); g = g_{F_∞/F,S} is the Deligne–Ribet pseudo-measure of IntegralIwasawaTheory I.3, with (γ − 1)g ∈ Λ and κ^n(g) = L_S(1 − n, 1) = ζ_F(1 − n)∏_{v∣2}(1 − Nv^{n−1}) for even n ≥ 2; ι_u is the automorphism of Λ with γ ↦ κ(γ)γ^{−1} restricted to the even part, that is T ↦ u(1 + T)^{−1} − 1.

### 7.1 Kurihara's main conjecture over F at p = 2

References: Kurihara 2025, §4.1, the formulation with the Burns–Flach compact-support complex (H² = X_{F_∞,S}, H³ = ℤ_p), p. 22, Theorem 4.1, p. 24, its proof in §4.2, pp. 24–26, and the first remark after the proof, p. 27 (the characteristic ideal at the augmentation prime is ((γ − 1)g)). Built on IntegralIwasawaTheory I.9 (the determinant main conjecture, every prime, F = k included) and I.10 (its characteristic-ideal form at F = k), I.2 (weak Leopoldt: X is a finitely generated torsion Λ-module without nonzero finite Λ-submodules).

Prove `char_X_eq_kurihara`: for every totally real F, X_{F_∞,S} is a finitely generated torsion Λ-module with no nonzero finite Λ-submodule, and

```text
char_Λ(X_{F_∞,S}) = ((γ − 1)·g_{F_∞/F,S}).
```

This is IntegralIwasawaTheory I.10's characteristic-ideal form of Kurihara's theorem (I.9) for k = F, the trivial extension, p = 2: away from the augmentation ideal γ − 1 is a unit and the local Fitting ideals are those of g; at the augmentation ideal the term H³ = ℤ₂ of the compact-support complex contributes the factor γ − 1. The statement is about characteristic ideals; finite modules are invisible to it, and §7.2 uses it only together with the absence of finite submodules. *Needs:* IntegralIwasawaTheory I.2, I.9 and I.10.

**Checks.**
- (computation) F = ℚ: the maximal pro-2 extension of ℚ unramified outside {2, ∞} has Galois group the free pro-2 product of ℤ/2 (complex conjugation) and ℤ₂; over ℚ_∞ the abelianised normal closure of the conjugation is X = 𝔽₂⟦Γ_ℚ⟧ = Λ/(2), so char(X) = (2); on the other side (γ − 1)g evaluated at κ² is (u² − 1)·ζ(−1)(1 − 2) = 24·(1/12) = 2 for u = 5, of valuation 1, consistent with (2).
- (non-example) For the module Λ/(2, T), which is finite, the characteristic ideal is (1) but the coinvariants have order 2: a characteristic-ideal equality alone does not compute a finite order, and the absence of finite submodules in X is what licenses §7.2.
- (non-example) With ramification at the real places forbidden the module changes: for F = ℚ it becomes 0, with characteristic ideal (1) ≠ (2); the real places must be allowed to ramify.

### 7.2 The 2-adic special values in every even weight

References: Rognes–Weibel 2000, Appendix A (Kolster), Theorem A.1, p. 45, and its proof, p. 47 (ζ_F(1 − n) ∼₂ #H²(𝓞_F[1/2], ℤ₂(n))/#H¹(𝓞_F[1/2], ℤ₂(n)) for even n ≥ 2, given the 2-adic main conjecture for F and the trivial character, with the μ-invariants equal by Remark A.4(b), p. 47); K-book VI.8.8, proof, book p. 516. Built on §7.1, IntegralIwasawaTheory I.3 (interpolation), I.4 (twisted coinvariant descent at p = 2, coinvariant evaluation, the dyadic statement), MotivicEtaleKTheory M.2 (the torsion of H¹ and its rank), ArithmeticKTheory N.4 (the 2-primary w-invariant), §4.2.

Prove `padicValRat_two_zeta_one_sub_eq_etale`: for every totally real F and every even n ≥ 2,

```text
v₂(ζ_F(1 − n)) = v₂(#H²(𝓞_F[1/2], ℤ₂(n))) − v₂(#H¹(𝓞_F[1/2], ℤ₂(n))),   and   #H¹(𝓞_F[1/2], ℤ₂(n)) = w_n^{(2)}(F).
```

IntegralIwasawaTheory I.4 states the first identity under the hypothesis that the 2-adic main conjecture holds for F and the trivial character; §7.1 discharges that hypothesis for every totally real F. In detail: the characteristic series of X(−n) is h(κ(γ)^n(1 + T) − 1) with h = (γ − 1)g (contragredient convention); X(−n) has no nonzero finite submodule, so X(−n)^Γ = 0 and #X(−n)_Γ ∼₂ h(κ(γ)^n − 1) = (u^n − 1)·ζ_F(1 − n)·∏_{v∣2}(1 − Nv^{n−1}), finite because ζ_F(1 − n) ≠ 0 (§2.4); the Euler factors are odd; and since κ^n is trivial on G_S(F_∞) for even n, descent gives #X(−n)_Γ = #H¹(𝓞_F[1/2], ℚ₂/ℤ₂(n)) = #H²(𝓞_F[1/2], ℤ₂(n)) (IntegralIwasawaTheory I.4(d)). For the second identity, H¹(𝓞_F[1/2], ℤ₂(n)) has rank r₂ = 0 and torsion W_n(F){2} (MotivicEtaleKTheory M.2), and v₂(u^n − 1) = e + v₂(n) = v₂(w_n(F)) (ArithmeticKTheory N.4 for exceptional fields). *Needs:* `char_X_eq_kurihara`, IntegralIwasawaTheory I.3 and I.4, MotivicEtaleKTheory M.2, ArithmeticKTheory N.4, `neg_one_pow_mul_dedekindZetaC_one_sub_pos`.

**Checks.**
- (computation) F = ℚ, n = 2: X(−2)_Γ = 𝔽₂⟦T⟧/(u^{−2}(1 + T) − 1) = ℤ/2 (since u ≡ 1 mod 4), so #H²(ℤ[1/2], ℤ₂(2)) = 2; #H¹ = w₂^{(2)}(ℚ) = 8; v₂(−1/12) = −2 = 1 − 3.
- (computation) F = ℚ, n = 4: #X(−4)_Γ = 2 and (u⁴ − 1)·ζ(−3)(1 − 2³) = 624·(−7/120) has v₂ = 4 − 3 = 1; #H¹ = w₄^{(2)}(ℚ) = 16; v₂(1/120) = −3 = 1 − 4.
- (non-example) Replacing H¹ by the 2-part of K_{2n−1}(𝓞_F) changes the answer by the real-place factor: for ℚ and n = 2, #K₃(ℤ){2} = 16 ≠ 8 (§8.5).

### 7.3 The 2-part of the Birch–Tate formula for every totally real field

References: K-book VI.8.6, book p. 515 (the 2-part follows from the 2-adic main conjecture, through Kolster's appendix to Rognes–Weibel); Rognes–Weibel 2000, Theorem 0.6, pp. 3–4, at n = 2 (K₂(𝓞_F){2} ≅ H²(𝓞_F[1/2], ℤ₂(2))). Built on §7.2, ArithmeticKTheory N.6 (two-primary corrections, row n = 2; even groups of S-integers), MotivicEtaleKTheory M.3, §4.3.

Prove `padicValNat_two_card_K2_of_isTotallyReal`: for every totally real F,

```text
v₂(#K₂(𝓞_F)) = v₂(w₂(F)) + v₂(|ζ_F(−1)|).
```

The residue groups k(v)ˣ at the dyadic primes have odd order, so K₂(𝓞_F){2} ≅ K₂(𝓞_F[1/2]){2} (§4.3), and Tate's comparison at ℓ = 2 (MotivicEtaleKTheory M.3; ArithmeticKTheory N.6, the row n = 2 of the two-primary corrections) identifies K₂(𝓞_F[1/2]){2} with H²(𝓞_F[1/2], ℤ₂(2)), with no real-place correction in this degree. Substitute §7.2 at n = 2. *Needs:* `padicValRat_two_zeta_one_sub_eq_etale`, `natCard_K2_sInteger`, ArithmeticKTheory N.6, MotivicEtaleKTheory M.3.

**Checks.**
- (computation) F = ℚ: v₂(2) = 1 = 3 + (−2).
- (computation) F = ℚ(√5): v₂(4) = 2 = 3 + (−1).
- (computation) F = ℚ(√2): v₂(4) = 2 = 4 + (−2), agreeing with the abelian route of §6.6.

### 7.4 The Birch–Tate formula for every totally real field

References: K-book VI.8.6, Birch–Tate Conjecture 8.6, book p. 515; Kolster 2009, Lecture 2 §3, Conjecture 3.5, p. 15; Kurihara 2025, Theorem 4.1, p. 24. Built on §2.4, §2.5, §2.7, §5.3, §7.3.

Prove `birchTateFormula_of_isTotallyReal`: for every totally real number field F,

```text
ζ_F(−1) = (−1)^{[F:ℚ]} · #K₂(𝓞_F) / w₂(F).
```

The odd primes are §5.3, the prime 2 is §7.3, and §2.7 (with the rationality of §2.5 and the sign of §2.4) assembles the formula from its valuations. For F abelian over ℚ this agrees with §6.6, which is a second proof. *Needs:* `padicValNat_card_K2_odd`, `padicValNat_two_card_K2_of_isTotallyReal`, `birchTateFormula_iff_padicValRat`.

**Checks.**
- (computation) ℚ, ℚ(√5), ℚ(√2): −1/12 = (−1)·2/24, 1/30 = 4/120, 1/12 = 4/48.
- (degenerate) F = ℚ is the case [F : ℚ] = 1 with no dyadic Euler factor beyond (1 − 2).
- (non-example) The hypothesis "totally real" cannot be dropped: §2.3.

### 7.5 Comparison with Kolster's formulation and Federer's conjecture for every totally real field

References: Kurihara 2025, §4.1, the p-adic L-function g_{K_∞/k,S} and its interpolation, p. 23, and Lemma 4.2(1), p. 25 (the injection of the minus Selmer module into X_{F_∞,S}, with cokernel of order 2 at p = 2); Kolster 1989, Conjecture 3 and the definition of G(T), p. 250. Built on §6.1, §7.1, IntegralIwasawaTheory I.3, I.9 and I.10 (the classical–modern module dictionary), ArithmeticKTheory N.4.

**The series dictionary.** Prove `twoAdicZetaSeries_eq_kurihara`: Kolster's G_F (§6.1) and Kurihara's g satisfy

```text
G_F(T) = (T + 1 − u) · g(u(1 + T)^{−1} − 1)   in Λ,   hence   (G_F) = ι_u((γ − 1)g)·Λ.
```

Kurihara's interpolation at the trivial character gives g(u^n − 1) = ζ_{F,S}(1 − n) for even n ≥ 2 (κ^n factors through Γ_F); Kolster's gives G_F(u^{1−n} − 1) = (u^{1−n} − u)·ζ_{F,S}(1 − n). The power series h(T) = (T + 1 − u)·g(u(1 + T)^{−1} − 1) lies in Λ, equals −(1 + T)·ι_u((γ − 1)g), and takes the value (u^{1−n} − u)·g(u^n − 1) at T = u^{1−n} − 1; so G_F and h agree at infinitely many points of 4ℤ₂, which accumulate at u − 1, and a nonzero element of ℤ₂⟦T⟧ has finitely many zeros in the open disc. The dyadic Euler factors are removed on both sides. *Needs:* `twoAdicZetaSeries`, IntegralIwasawaTheory I.3, PadicMeasuresIwasawaAlgebras Layer 4 (Weierstrass).

**Checks.**
- (computation) F = ℚ, u = 5: G(u^{−1} − 1) = −2/5 and g(u² − 1) = ζ_{ℚ,S}(−1) = (1 − 2)ζ(−1) = 1/12, with (u^{−1} − u)·(1/12) = −2/5.
- (computation) ι_u(γ − 1) = uγ^{−1} − 1 = −γ^{−1}(γ − u), which is the factor T + 1 − u up to the unit −γ^{−1}.
- (non-example) Using γ ↦ κ(γ)^{−1}γ in place of ι_u moves the pole factor to T + 1 − u^{−1}, which does not vanish at Kolster's pole s = 1.

**The comparison theorem.** Prove `kurihara_kolster_comparison`: for every totally real F the following hold, each as a map-level statement.
- (a) Module: char_Λ(ι_u X_{F_∞,S}) = (2^{[F:ℚ]}·f_F), where ι_u X is X with γ acting through κ(γ)γ^{−1}. This is IntegralIwasawaTheory I.10's classical–modern module dictionary: Kummer duality between X_{F_∞,S} and the minus Selmer module of F(μ_{2^∞}), the injection with cokernel of order 2 of Kurihara's Lemma 4.2(1), the identification of the part split at infinity with the covariant dual of Kolster's norm-kernel minus module (§6.5's comparison of the norm kernel with the quotient by 1 + j), and the real-place inertia, a quotient of ⊕_{v real} Λ/(2) of characteristic ideal (2^{[F:ℚ]}).
- (b) Compact support: X_{F_∞,S} = H² and ℤ₂ = H³ of the Burns–Flach compact-support complex RΓ_c(𝓞_{F_∞,S}, ℤ₂(1)) (IntegralIwasawaTheory I.8–I.9).
- (c) Specialisation: the character κ² evaluates g at u² − 1 to ζ_{F,S}(−1), against Kolster's evaluation of G_F at u^{−1} − 1.
- (d) Pole: H³ = ℤ₂ contributes γ − 1, which ι_u turns into Kolster's T + 1 − u up to a unit.
- (e) Euler factors: ζ_{F,S}(−1) = ζ_F(−1)∏_{v∣2}(1 − Nv), with odd factors (§4.2).
- (f) Denominator: w₂^{(2)}(F) = 2^{e+1} ∼₂ u^{−1} − u ∼₂ u² − 1 (ArithmeticKTheory N.4, §6.4).
- (g) Finite descent: the derived specialisation of the compact-support complex at κ² has finite cohomology computing #H²(𝓞_F[1/2], ℤ₂(2)) and #H¹(𝓞_F[1/2], ℤ₂(2)) (IntegralIwasawaTheory I.10's finite Euler-characteristic comparison), and its comparison with Kolster's invariants #(𝒯 ⊗ A_∞^−)^Γ and #K₂(𝓞_F)(2) = 2^{[F:ℚ]}#(𝒯 ⊗ A_∞^−)^Γ (§6.2) retains the Tor terms, the order-two cokernel of Lemma 4.2(1) and the factor 2^{[F:ℚ]}.
Entries (b)–(f) are proved here from the cited statements; (a) and (g) are IntegralIwasawaTheory I.10's dictionary and finite Euler-characteristic comparison. *Needs:* `twoAdicZetaSeries_eq_kurihara`, `char_X_eq_kurihara`, `card_K2_two_part_eq`, IntegralIwasawaTheory I.8, I.9 and I.10, ArithmeticKTheory N.4.

**Checks.**
- (computation) F = ℚ: Ǎ_∞^− = 0, f = 1, and char(X) = (2) = (2^{[ℚ:ℚ]}·f) from §7.1; one real place, μ = 1.
- (non-example) Λ/(2, T) has characteristic ideal (1) and coinvariants of order 2, so the order-two cokernel of Lemma 4.2(1) cannot be dropped in (g) on the ground that it vanishes at height-one primes.
- (non-example) Replacing the norm-kernel minus module by the −1-eigenspace of j is not available at p = 2: for a module on which j acts trivially and which is killed by 2, the "eigenspace" is everything while the norm kernel can be 0.

**Federer's conjecture for every totally real field.** Prove `federerMainConjecture_of_isTotallyReal`: for every totally real F, FedererMainConjecture F holds. By the dictionary, (G_F) = ι_u((γ − 1)g); by §7.1, ((γ − 1)g) = char(X), so (G_F) = char(ι_u X); by the comparison (a), char(ι_u X) = (2^{[F:ℚ]}f_F). For F abelian over ℚ this is also §6.5. *Needs:* `twoAdicZetaSeries_eq_kurihara`, `char_X_eq_kurihara`, `kurihara_kolster_comparison`.

**Checks.**
- (computation) F = ℚ: both sides are (2).
- (computation) F = ℚ(√2): both sides are (4).
- (non-example) Kolster's Theorem 5 applied to this result gives §7.3 again, but §7.3 does not depend on it: the end theorem §7.4 uses only §7.1–§7.3.

### Examples

- ℚ: X = Λ/(2), char(X) = (2), #H²(ℤ[1/2], ℤ₂(2)) = 2, #H¹ = 8, ζ(−1) ∼₂ 2/8.
- ℚ(√5): #K₂(𝓞_F) = 4, w₂ = 120, ζ_F(−1) = 1/30; the 2-adic identity 2 = 3 − 1.
- ℚ, n = 6: ζ(−5) = −1/252 has v₂ = −2, w₆^{(2)}(ℚ) = 8 (v₂(6) = 1, e = 2), so #H²(ℤ[1/2], ℤ₂(6)) = 2.

### Dependencies

Layers 2, 4, 5 and 6; IntegralIwasawaTheory I.2, I.3, I.4, I.8, I.9 and I.10; MotivicEtaleKTheory M.2 and M.3; ArithmeticKTheory N.4 and N.6; TauCetiRoadmap.PadicMeasuresIwasawaAlgebras Layer 4.

## Layer 8: higher special values and the equivariant statement

This layer states the special-value formulas at every negative integer and proves the ones that the earlier layers make available. For n ≥ 2 the order of vanishing of ζ_F at 1 − n is d_n = r₂ for even n and r₁ + r₂ for odd n (BorelRegulators R.5), and its leading coefficient ζ*_F(1 − n) is compared with a quotient of finite orders times a regulator. Three statements of different strength are kept apart: Borel's rational proportionality (BorelRegulators R.5), which says nothing about the rational factor; the Lichtenbaum formulas, scalar statements with finite orders; and the equivariant Tamagawa-number statement, an integral statement in a relative K-group. For totally real F and even n the regulator is 1 and the formulas become ζ_F(1 − n) = ±h_n(F)/w_n(F) = ±2^{r₁}#K_{2n−2}(𝓞_F)/#K_{2n−1}(𝓞_F), which this layer proves for every totally real F; the degree-two case is Birch–Tate.

Standing assumptions for this layer: F is a number field, totally real where stated; n ≥ 2, and k = n/2 when n is even; ζ*_F(1 − n) and R_{Bo,n}(F) are BorelRegulators' leading coefficient and Borel covolume; H^i(𝓞_F[1/p], ℤ_p(n)) is continuous cohomology as in Layer 5; for a finite abelian group A, A{ℓ} is its ℓ-primary part.

### 8.1 The cohomological order h_n(F)

References: Kolster 2009, Lecture 1 §2, the global models H²(𝓞_F, ℤ(n)) as a product and H¹(𝓞_F, ℤ(n)) of the stated ranks, p. 11 (the ranks are printed interchanged there: Proposition 2.1(5) on p. 10 and Borel's ranks on p. 15 give r₁ + r₂ for odd n and r₂ for even n); Proposition 2.1, p. 10. Built on ArithmeticKTheory N.6 (finiteness of H², vanishing for almost all p, even K-groups and their two-primary corrections), MotivicEtaleKTheory M.2 (finite generation, torsion of H¹, ranks) and M.8 (integral motivic groups), Mathlib `Nat.card`, `padicValNat`, `Finset.prod`.

**The order.** Define `TauCeti.BirchTate.hInvariant F n : ℕ` as the product over all primes p of #H²(𝓞_F[1/p], ℤ_p(n)): each factor is finite and almost all are 1 (ArithmeticKTheory N.6, Kolster Proposition 2.1(4), valid also at p = 2), so the product is a finite product over the primes p at which the factor is nontrivial. h_n(F) is the order of Kolster's model H²(𝓞_F, ℤ(n)) = ∏_p H²(𝓞_F[1/p], ℤ_p(n)), and, through the Beilinson–Lichtenbaum comparison of MotivicEtaleKTheory M.7, which identifies the p-adic completion of the integral motivic H²(𝓞_F, ℤ(n)) with H²(𝓞_F[1/p], ℤ_p(n)), the order of the integral motivic H². Its API is `padicValNat_hInvariant` (for every prime ℓ, v_ℓ(h_n(F)) = v_ℓ(#H²(𝓞_F[1/ℓ], ℤ_ℓ(n))), the other factors being prime to ℓ), `hInvariant_two` (h₂(F) = #K₂(𝓞_F), from K₂(𝓞_F){ℓ} ≅ H²(𝓞_F[1/ℓ], ℤ_ℓ(2)) at every prime ℓ: ArithmeticKTheory N.6 at odd ℓ and its row n = 2 of the two-primary corrections at ℓ = 2, with §4.3 for inverting ℓ), `hInvariant_pos` (h_n(F) ≥ 1), and, for the companion H¹-model, `rank_motivicH1` (the integral motivic H¹(𝓞_F, ℤ(n)) of MotivicEtaleKTheory M.8, whose p-adic completions are H¹(𝓞_F[1/p], ℤ_p(n)) by M.7, has rank r₁ + r₂ for odd n and r₂ for even n, by M.2's Euler characteristic and the finiteness of H²) and `card_torsion_motivicH1` (its torsion has order w_n(F), from M.2's identification of the torsion of H¹(𝓞_F[1/p], ℤ_p(n)) with W_n(F){p} for every p). The H¹ lattice is M.8's; a group chosen only to match its p-adic completions does not determine the lattice or its maps. *Needs:* ArithmeticKTheory N.6, MotivicEtaleKTheory M.2, M.7 and M.8, §4.3.

**Checks.**
- (computation) h₂(ℚ) = #K₂(ℤ) = 2, with v₂ = 1 and every odd valuation 0.
- (computation) For ℚ and n = 2 the H¹-model has rank r₂ = 0, not r₁ + r₂ = 1 as printed on Kolster's p. 11 (K₃(ℤ) ≅ ℤ/48 is finite).
- (non-example) #H¹(ℤ, ℤ(2))_tors = w₂(ℚ) = 24 differs from #K₃(ℤ)_tors = 48: the cohomological model and K-theory differ at 2 by the real-place factor of §8.4.

### 8.2 The Lichtenbaum formulas at negative integers

References: Kolster 2009, Lecture 2 §3, the order of vanishing, p. 15; Lichtenbaum Conjecture 3.6, p. 15 (the K-theoretic formula up to powers of 2); Motivic Lichtenbaum Conjecture 3.7, p. 16, and the remark that the motivic and Borel regulators differ by a power of 2. Built on BorelRegulators R.4, R.5 and R.7, ArithmeticKTheory N.3 and N.5, MotivicEtaleKTheory M.8, PeriodsAndSpecialValues PS.3, §8.1.

**The motivic regulator.** Define `TauCeti.BirchTate.motivicRegulatorCovolume F n` = R_n^M(F) as the covolume, for BorelRegulators R.4's coordinate measure on V_n(F), of the image of the torsion-free quotient of MotivicEtaleKTheory M.8's integral motivic H¹(𝓞_F, ℤ(n)) under the Beilinson regulator (MotivicEtaleKTheory M.8, BorelRegulators R.7), with R_n^M(F) = 1 when the rank is 0; PeriodsAndSpecialValues PS.3 supplies the regulator determinant on the corresponding determinant line. Prove `borelCovolume_div_motivicCovolume_eq_two_pow`: R_{Bo,n}(F)/R_n^M(F) is an integral power of 2, since R_{Bo,n} = 2^{d_n}R_{Be,n} on K_{2n−1}(𝓞_F) (BorelRegulators R.7) and the comparison K_{2n−1}(𝓞_F)/tors → H¹_M(𝓞_F, ℤ(n))/tors of M.8 has finite kernel and cokernel of 2-power order (Kolster 2009, p. 11). *Needs:* BorelRegulators R.4 and R.7, MotivicEtaleKTheory M.8, PeriodsAndSpecialValues PS.3.

**The predicates.** Define `TauCeti.BirchTate.LichtenbaumFormulaOddPart F n : Prop`: for every odd prime ℓ,

```text
v_ℓ(ζ*_F(1 − n) / R_{Bo,n}(F)) = v_ℓ(#K_{2n−2}(𝓞_F)) − v_ℓ(#K_{2n−1}(𝓞_F)_tors),
```

the quotient ζ*_F(1 − n)/R_{Bo,n}(F) being a nonzero rational number (BorelRegulators R.5, rational proportionality) and the K-groups finite or finitely generated (ArithmeticKTheory N.3). Define `TauCeti.BirchTate.MotivicLichtenbaumFormula F n : Prop`:

```text
|ζ*_F(1 − n)| = h_n(F) / #H¹_M(𝓞_F, ℤ(n))_tors · R_n^M(F),
```

with h_n(F) as in §8.1. Their API is `lichtenbaumFormulaOddPart_two_iff` (for totally real F, LichtenbaumFormulaOddPart F 2 holds if and only if the Birch–Tate valuation identity of §2.7 holds at every odd ℓ, because R_{Bo,2} = 1, ζ* = ζ_F(−1) and the odd part of #K₃(𝓞_F) is that of w₂(F), ArithmeticKTheory N.5), `motivicLichtenbaumFormula_two_iff` (for totally real F, MotivicLichtenbaumFormula F 2 ↔ |ζ_F(−1)| = #K₂(𝓞_F)/w₂(F), by `hInvariant_two` and `card_torsion_motivicH1`), and the well-posedness lemma `lichtenbaum_wellPosed` (the order of vanishing and the nonzero leading coefficient of R.5, positivity of R_{Bo,n} and R_n^M, finiteness of the K-groups and of h_n). These are statements; the general cases are conjectures, and only the cases of §8.3 and §8.5 are proved here. *Needs:* BorelRegulators R.4 and R.5, ArithmeticKTheory N.3 and N.5, `hInvariant`, `motivicRegulatorCovolume`.

**Checks.**
- (computation) ℚ, n = 2: ζ(−1) = −1/12, #K₂(ℤ) = 2, #K₃(ℤ) = 48, R = 1; at ℓ = 3, −1 = 0 − 1; at ℓ ≥ 5, 0 = 0 − 0.
- (non-example) Including 2 in the K-theoretic formula would assert 1/12 = 2/48 = 1/24 over ℚ, which is false: the K-theoretic predicate is genuinely "away from 2".
- (computation) ℚ, n = 2, motivic: h₂(ℚ) = 2 and #H¹_M(ℤ, ℤ(2))_tors = 24 give 2/24 = 1/12 = |ζ(−1)|.
- (computation) ℚ, n = 4: ζ(−3) = 1/120 and #K₇(ℤ) = w₄(ℚ) = 240, so the odd-part formula predicts that the odd part of #K₆(ℤ) is 1 (v₃: −1 = 0 − 1; v₅: −1 = 0 − 1).
- (non-example) F = ℚ(i), n = 2, r₂ = 1: ζ_F(−1) = 0 while ζ*_F(−1) and the rank-one regulator are nonzero; putting the value in place of the leading coefficient makes both formulas false.

### 8.3 The odd part in even weight for totally real fields

References: Kolster 2009, Lecture 1 §2, the comparison of K_{2n−i} with motivic and étale cohomology, p. 11, and Lecture 2 §3, Corollary 3.4 and Conjecture 3.6, p. 15; K-book VI.8.7 and the proof of VI.8.8, book pp. 515–516. Built on §5.2, ArithmeticKTheory N.6 (even K-groups at odd primes), MotivicEtaleKTheory M.7 (the Quillen–Lichtenbaum comparison in odd degree at odd ℓ) and M.2, BorelRegulators R.4.

Prove `lichtenbaumFormulaOddPart_of_isTotallyReal`: for F totally real and n ≥ 2 even, LichtenbaumFormulaOddPart F n holds: for every odd prime ℓ, v_ℓ(ζ_F(1 − n)) = v_ℓ(#K_{2n−2}(𝓞_F)) − v_ℓ(#K_{2n−1}(𝓞_F)). For totally real F and even n, K_{2n−1}(𝓞_F) has rank r₂ = 0, so R_{Bo,n} = 1 and ζ* = ζ_F(1 − n). ArithmeticKTheory N.6 gives K_{2n−2}(𝓞_F){ℓ} ≅ H²(𝓞_F[1/ℓ], ℤ_ℓ(n)); MotivicEtaleKTheory M.7 gives K_{2n−1}(𝓞_F) ⊗ ℤ_ℓ ≅ H¹(𝓞_F[1/ℓ], ℤ_ℓ(n)), of order w_n^{(ℓ)}(F) (M.2); substitute into §5.2. This rests on the norm-residue theorem through M.7 in weights n ≥ 3; in weight two Tate's theorem suffices, and the statement recovers §5.3. Prove also `abs_dedekindZetaC_one_sub_eq_hInvariant_div`: for F totally real and n ≥ 2 even, |ζ_F(1 − n)| = h_n(F)/w_n(F), the cohomological form, whose ℓ-adic valuations are §5.2 at odd ℓ and §7.2 at ℓ = 2, assembled by §2.6; since R_n^M(F) = 1 in rank zero and the torsion of the motivic H¹ has order w_n(F) (`card_torsion_motivicH1`), this is MotivicLichtenbaumFormula F n for totally real F and even n (Kolster's Corollary 3.4 with its 2-part). *Needs:* `padicValRat_zeta_one_sub_eq_etale`, `padicValRat_two_zeta_one_sub_eq_etale`, `padicValNat_hInvariant`, `rat_eq_iff_forall_padicValRat_eq`, `exists_rat_dedekindZetaC_one_sub`, ArithmeticKTheory N.6, MotivicEtaleKTheory M.2 and M.7.

**Checks.**
- (computation) n = 2 recovers §5.3 at odd ℓ and, for the cohomological form, the Birch–Tate formula in absolute value through `hInvariant_two`.
- (computation) ℚ, n = 4: the odd part of #K₆(ℤ) is 1; ℚ, n = 6: ζ(−5) = −1/252 = −1/(4·63) and w₆(ℚ) = 504 = 8·63, so the odd part of #K₁₀(ℤ) is 1 and h₆(ℚ) = 504/252 = 2.
- (non-example) For odd n the zeta value vanishes (§2.3) and the leading coefficient carries a nontrivial regulator; the even-weight hypothesis is what removes it.

### 8.4 The real-place correction at 2

References: Rognes–Weibel 2000, Theorem 0.1, p. 1, and Theorems 0.3 and 0.6, pp. 2–4 (the two-primary K-groups of rings of integers of totally real fields, by the residue of the weight modulo 4). Built on ArithmeticKTheory N.6 (two-primary corrections and the order ratio for totally real fields), N.3 and N.4, MotivicEtaleKTheory M.2.

Prove `padicValRat_higher_two_correction`: for F totally real, n ≥ 2 even and R = 𝓞_F[1/2], with a = v₂(#K_{2n−2}(𝓞_F)) and b = v₂(#K_{2n−1}(𝓞_F)) (both groups finite),

```text
v₂(#H²(R, ℤ₂(n))) − v₂(#H¹(R, ℤ₂(n))) = r₁ + a − b,   i.e.   #H²/#H¹ = 2^{r₁}·#K_{2n−2}{2}/#K_{2n−1}{2}.
```

This is the 2-adic valuation of ArithmeticKTheory N.6's order ratio 2^{r₁}·#K_{2n−2}(𝓞_S)/#K_{2n−1}(𝓞_S) = ∏_ℓ #H²/∏_ℓ #H¹ for totally real fields, whose odd-ℓ factors have odd order. In terms of N.6's two-primary corrections it reads: for n ≡ 2 mod 4, K_{2n−2}(𝓞_F){2} ≅ H²(R, ℤ₂(n)) and #K_{2n−1}(𝓞_F){2} = 2^{r₁}w_n^{(2)}(F); for n ≡ 0 mod 4, K_{2n−2}(𝓞_F){2} is the kernel of the surjective real restriction H²(R, ℤ₂(n)) → (ℤ/2)^{r₁} and #K_{2n−1}(𝓞_F){2} = w_n^{(2)}(F); in both cases #H¹(R, ℤ₂(n)) = w_n^{(2)}(F) (M.2). Inverting the dyadic primes does not change the 2-primary K-groups, the residue orders q^j − 1 being odd. These are 2-primary orders; the full orders enter only after the odd primes. *Needs:* ArithmeticKTheory N.3, N.4 and N.6, MotivicEtaleKTheory M.2.

**Checks.**
- (computation) ℚ, n = 2: #H²(ℤ[1/2], ℤ₂(2)) = 2, #H¹ = w₂^{(2)}(ℚ) = 8, #K₃(ℤ){2} = 16, and 2/8 = 1/4 = 2·2/16.
- (computation) ℚ, n = 4: K₆(ℤ) = 0, #H² = 2, #H¹ = w₄^{(2)}(ℚ) = 16, #K₇(ℤ){2} = 16, and 2/16 = 1/8 = 2·1/16.
- (non-example) The full order 240 = #K₇(ℤ) is not the order of the 2-primary H¹ group, which is 16; mixing full and 2-primary orders gives the false 2/240.

### 8.5 Higher values for every totally real field

References: K-book VI.8.8 and its proof, book pp. 515–516 (the formula for totally real abelian F, where the abelian hypothesis enters only through the 2-adic main conjecture); Rognes–Weibel 2000, Theorem 0.2, p. 2, and Appendix A, Theorem A.1, p. 45, Theorem A.2 and Corollary A.3, pp. 45–49; Kurihara 2025, Theorem 4.1, p. 24 (the 2-adic main conjecture over every totally real base). Built on §2.4, §2.5, §2.6, §7.2, §8.3, §8.4, BorelRegulators R.5.

Prove `higherLichtenbaum_of_isTotallyReal`: for every totally real F and even n = 2k ≥ 2,

```text
ζ_F(1 − n) = (−1)^{k r₁} · 2^{r₁} · #K_{2n−2}(𝓞_F) / #K_{2n−1}(𝓞_F).
```

All groups are finite (rank r₂ = 0 in odd degree for totally real F and even n). At an odd prime ℓ the valuations agree by §8.3 (2^{r₁} is prime to ℓ); at ℓ = 2, §7.2 gives v₂(ζ_F(1 − n)) = v₂#H²(𝓞_F[1/2], ℤ₂(n)) − v₂#H¹(𝓞_F[1/2], ℤ₂(n)), which is r₁ + a − b by §8.4; the sign is (−1)^{k r₁} by §2.4, and §2.6 with the rationality of §2.5 reconstructs the value. For F abelian over ℚ this is `higherLichtenbaum_of_isAbelianGalois`, with the classical proof in which the 2-adic main conjecture is Wiles's theorem over ℚ transported to F by the going-up theorem of Rognes–Weibel A.2 (IntegralIwasawaTheory I.5, going-up induction) and the μ-invariants of the trivial character agree by the analytic class number formula (Rognes–Weibel Remark A.4(b), p. 47). At n = 2 the odd-degree group has order 2^{r₁}w₂(F) up to odd factors equal to those of w₂(F), and the formula is Birch–Tate (§7.4). *Needs:* `lichtenbaumFormulaOddPart_of_isTotallyReal`, `padicValRat_two_zeta_one_sub_eq_etale`, `padicValRat_higher_two_correction`, `neg_one_pow_mul_dedekindZetaC_one_sub_pos`, `exists_rat_dedekindZetaC_one_sub`, `rat_eq_iff_forall_padicValRat_eq`, ArithmeticKTheory N.3.

**Checks.**
- (computation) ℚ, n = 2: ζ(−1) = (−1)¹·2·2/48 = −1/12.
- (computation) ℚ, n = 4: ζ(−3) = (+1)·2·1/240 = 1/120.
- (non-example) Without the factor 2^{r₁} the formula gives −1/24 for ℚ at n = 2; without the sign it gives +1/12.

### 8.6 The equivariant Tamagawa-number statement for Tate motives

References: Burns–Flach 2001, §3.4, Lemma 5, pp. 526–528, Lemma 6 and its consequence, pp. 528–529 (the finite-quotient trivialisation and the global gluing that make the corrected class independent of S and of the projective structure); §4.2, Lemma 9, pp. 534–535 (the extended boundary); §4.3, Conjectures 4–6 and Remark 9, pp. 535–537 (the conjecture TΩ = 0, its rationality and its local form). Built on PeriodsAndSpecialValues PS.4 (integral fundamental lines and local corrections) and PS.5 (the ETNC predicate), GeneralAlgebraicKTheory K.5 (relative K₀), BorelRegulators R.4 and R.5, §8.2.

**The statement.** For a finite Galois extension L/E of number fields with group G and n ≥ 2, define `TauCeti.BirchTate.TateMotiveETNC L E n : Prop` as PeriodsAndSpecialValues PS.5's equivariant Tamagawa-number predicate evaluated on the motive M = h⁰(Spec L)(1 − n) over E with coefficients A = ℚ[G] and integral order 𝒜 = ℤ[G], for a projective 𝒜-structure supplied by PS.4: under Burns–Flach's Coherence hypothesis and the analytic continuation and order statements of the L-functions,

```text
TΩ(M, 𝒜) = δ̂¹_{𝒜,ℝ}(L*(_A M, 0)) + RΩ(M, 𝒜) = 0   in K₀(𝒜, ℝ),
```

with the plus sign, the extended reduced-norm boundary δ̂¹ of Lemma 9, the center-valued leading term L* and the graded determinant trivialisation RΩ of PS.4. The twist 1 − n places the Artin values at 1 − n when the motive is evaluated at s = 0. Its rationality part is membership of TΩ in K₀(𝒜, ℚ); its integral part is its vanishing. The input data, recorded as `TateMotiveETNCData`, are n ≥ 2, the projective structure, Coherence and the analytic inputs; the local form (`TateMotiveETNCRationality`) additionally assumes rationality. Its API is `tateMotiveETNC_iff_class_zero` (under Coherence and the analytic inputs, the predicate is the vanishing of δ̂¹(L*) + RΩ in K₀(𝒜, ℝ)), `tateMotiveETNC_iff_local` (under rationality and Coherence, it is equivalent to the vanishing of the corrected local class in K₀(𝒜_p, ℚ_p) for every prime p, Conjectures 5–6), and `tateMotiveETNC_lattice_invariant`: two projective structures on the same Tate motive give the same corrected TΩ, hence equivalent predicates; prove this from Burns–Flach Lemma 5 (the finite-quotient determinant trivialisation) and Lemma 6 (global gluing), the corrections composing under a third change, which is not the invariance of an uncorrected integral section under scaling. The general statement is a conjecture, not a consequence of Borel's rational proportionality. For noncommutative G the leading term is center-valued with the reduced norm and the extended boundary; an ordinary determinant or a scalar valuation cannot replace them, and for nontrivial G the order of vanishing is a function on the simple components of the center. *Needs:* PeriodsAndSpecialValues PS.4 and PS.5, GeneralAlgebraicKTheory K.5, BorelRegulators R.4 and R.5.

**Checks.**
- (compatibility) For G trivial, E = L = ℚ and n = 2, the positive scalar image of the statement is h₂/w₂ = 2/24 = 1/12, and its K-theoretic image is 2·2/48 = 1/12; these are images of the determinant statement, not equivalent to it.
- (non-example) For L = ℚ(i), E = ℚ and n = 2, the scalar Dedekind order is 1, while the center-valued Artin orders on the trivial and quadratic components of ℚ[C₂] are (0, 1); the extended boundary receives the pair of nonzero componentwise leading coefficients, and the raw center-valued value, with a zero quadratic component, is not a central unit.
- (non-example) For the order ℤ and a rank-one integral line with basis e, the rational section 2e has index 2; its class in K₀(ℤ, ℚ) has nonzero 2-component, and a predicate asking only for nonzero rational proportionality would accept it.

### Examples

- ℚ, n = 2: h₂ = 2, w₂ = 24, #K₂ = 2, #K₃ = 48, ζ(−1) = −1/12 = −2/24 = −2·2/48.
- ℚ, n = 4: h₄ = 2, w₄ = 240, #K₆ = 1, #K₇ = 240, ζ(−3) = 1/120 = 2/240 = 2·1/240.
- ℚ(√5), n = 2: h₂ = 4, w₂ = 120, r₁ = 2, and #K₃(𝓞_F) = 2^{r₁}·w₂(F) = 480 (its 2-part 2²·8 = 32 by §8.4, its odd part that of w₂ by ArithmeticKTheory N.5), so 1/30 = 4/120 = 2²·4/480.

### Dependencies

Layers 2, 4, 5 and 7; BorelRegulators R.4, R.5 and R.7; ArithmeticKTheory N.3, N.4, N.5 and N.6; MotivicEtaleKTheory M.2, M.7 and M.8; IntegralIwasawaTheory I.5 (going-up, for the classical abelian proof); PeriodsAndSpecialValues PS.3, PS.4 and PS.5; GeneralAlgebraicKTheory K.5.

## Worked examples

| Field and weight | ζ_F(1 − n) | w_n(F) | finite orders | the formula |
|---|---|---|---|---|
| ℚ, n = 2 | −1/12 (§3.1) | 24 | #K₂(ℤ) = 2, #K₃(ℤ) = 48, h₂ = 2 | −1/12 = (−1)·2/24 = −2·2/48 |
| ℚ with S = {(2)}, n = 2 | ζ_{ℚ,S}(−1) = 1/12 | 24 | #K₂(ℤ[1/2]) = 2 | 1/12 = (+1)·2/24 |
| ℚ with S = {(2), (3)}, n = 2 | −1/6 | 24 | #K₂(ℤ[1/6]) = 4 | −1/6 = (−1)³·4/24 |
| ℚ(√5), n = 2 | 1/30 (§3.2) | 120 | #K₂ = 4 (certified), #K₃ = 480 | 1/30 = 4/120 |
| ℚ(√2), n = 2 | 1/12 | 48 | #K₂(ℤ[√2]) = 4 | 1/12 = 4/48 |
| ℚ(i), n = 2 | 0 | 24 | #K₂(ℤ[i]) = 1 | the formula fails (§2.3) |
| ℚ, n = 4 | 1/120 | 240 | #K₆(ℤ) = 1, #K₇(ℤ) = 240, h₄ = 2 | 1/120 = 2/240 = 2·1/240 |
| ℚ, n = 6 | −1/252 | 504 | h₆ = 2 | −1/252 = −2/504 |

The 2-adic Iwasawa data over ℚ are: e = 2, u = 5, X_{ℚ_∞,{2,∞}} = Λ/(2) with characteristic ideal (2), Ǎ_∞^− = 0, G_ℚ ∼₂ 2, and #H²(ℤ[1/2], ℤ₂(n)) = 2 for n = 2, 4, 6. Over ℚ(√2) they are e = 3, u = 9, Ǎ_∞^− = 0 and G ∼₂ 4.

## Downstream consumers

MotivicEtaleKTheory (its Galois-symbol layer M.3 is tested against Layer 5's use of Tate's comparison), ArithmeticKTheory (the certified examples of N.8 are compared with §3.2 and with the S-integer formula of §4.4; N.6's order ratio is read through §8.4), K2SymbolsBrauer (the relative S-integer sequence of T.5 is consumed by §4.3), BorelRegulators (the regulator covolume of R.4 is evaluated in rank zero by §2.5 and against the motivic covolume in §8.2), IntegralIwasawaTheory (the special-value endpoints of I.5 and the finite Euler-characteristic comparison of I.10 are turned into statements about K-groups in §5.2, §7.2 and §7.3), AutomorphicPadicLFunctions (its Deligne–Ribet integrality is specialised in §2.8 and its 2-adic zeta function normalised in §6.1), EllipticRegulators and EllipticKTheory (the Beilinson-type statements for elliptic curves use the Lichtenbaum predicates and their conventions of §8.2 as the number-field model), and Polylogarithms (Zagier's conjecture and the weight-two regulator use ζ*_F(−1) and the leading-term conventions of §8.2).

## References

- C. A. Weibel, *The K-book: An Introduction to Algebraic K-theory*, Graduate Studies in Mathematics 145, American Mathematical Society, 2013; author-hosted version of 29 August 2013, https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf (printed page = PDF page − 8). Cited: IV.1.13 (p. 269), V.6.8 (pp. 411–412), V.11.11–V.11.13 (pp. 457–459), VI.8.1 and VI.8.6–VI.8.8 (pp. 514–516), VI.9.4–VI.9.5 (pp. 519–520).
- M. Kolster, *Special values of L-functions at negative integers*, lecture notes, IAS/Park City Mathematics Series, 2009; author copy, https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf. Cited: Lecture 1 §1 (pp. 7–9), §2 (pp. 9–12: the coefficient sequence, Proposition 2.1, Corollary 2.2, Proposition 2.3, the global models); Lecture 2 §3 (pp. 13–16: Propositions 3.1–3.2, Theorem 3.3, Corollary 3.4, Conjectures 3.5–3.7) and §4 (p. 16).
- M. Kolster, A relation between the 2-primary parts of the main conjecture and the Birch–Tate-conjecture, *Canad. Math. Bull.* 32 (1989), 248–251, https://doi.org/10.4153/CMB-1989-036-8. Cited: the set-up (p. 248), Theorem 1 (p. 249), Lemma 2, Conjecture 3 and Theorem 5 (p. 250).
- M. Kolster, The structure of the 2-Sylow subgroup of K₂(o), II, *K-Theory* 1 (1987); Theorem 3.7, as stated in Kolster 1989, p. 249.
- K. Iwasawa, On cohomology groups of units for ℤ_p-extensions, *Amer. J. Math.* 105 (1983); Proposition 2, as stated in Kolster 1989, p. 249.
- C. Greither, Class groups of abelian fields, and the main conjecture, *Ann. Inst. Fourier (Grenoble)* 42 (1992), 449–499, http://www.numdam.org/item/AIF_1992__42_3_449_0.pdf. Cited: §1 (pp. 451–454), §3, Theorem 3.2 and Lemma 3.3 (pp. 469–470).
- M. Kurihara, *On class groups and Iwasawa modules of CM-fields*, author copy (2025), https://kurihara.math.keio.ac.jp/ClassGroupsIwasawaModules.pdf. Cited: §4.1 (pp. 22–24), Theorem 4.1 (p. 24), §4.2 with Lemma 4.2 and the remarks after the proof (pp. 24–27).
- J. Rognes and C. A. Weibel, with an appendix by M. Kolster, Two-primary algebraic K-theory of rings of integers in number fields, *J. Amer. Math. Soc.* 13 (2000), 1–54; author-hosted copy, https://sites.math.rutgers.edu/~weibel/archive/papers-dir/RognesWeibel.pdf. Cited: Theorems 0.1–0.3 and 0.6 (pp. 1–4); Appendix A, Theorem A.1, Theorem A.2, Corollary A.3, Remark A.4 and the proofs (pp. 45–49).
- D. Burns and M. Flach, Tamagawa numbers for motives with (non-commutative) coefficients, *Documenta Math.* 6 (2001), 501–570, https://ems.press/content/serial-article-files/25892. Cited: §3.4, Lemmas 5–6 (pp. 526–529); §4.2, Lemma 9 (pp. 534–535); §4.3, Conjectures 4–6 and Remark 9 (pp. 535–537).
- H. Cohen, *Number Theory, Volume II: Analytic and Modern Tools*, Graduate Texts in Mathematics 240, Springer, 2007; university-hosted copy, https://maths.dur.ac.uk/users/herbert.gangl/ch.pdf (printed page = PDF page − 23). Cited: §10.3.1, Theorem 10.3.1 and Corollary 10.3.3 (pp. 186–189); §10.5.1, Theorem 10.5.3 (p. 218); §10.5.2, Proposition 10.5.5 (p. 219).
- P. Deligne and K. Ribet, Values of abelian L-functions at negative integers over totally real fields, *Invent. Math.* 59 (1980), 227–286; through TauCetiRoadmap.AutomorphicPadicLFunctions, Layer L3 (the main theorem (8.2), the integrality statement (0.4) and the 2-adic refinement (8.11)).
- A. Wiles, The Iwasawa conjecture for totally real fields, *Ann. of Math.* 131 (1990), 493–540; through TauCetiRoadmap.IntegralIwasawaTheory, Layer I.5.
- J. Tate, Relations between K₂ and Galois cohomology, *Invent. Math.* 36 (1976), 257–274; through TauCetiRoadmap.MotivicEtaleKTheory, Layer M.3.
