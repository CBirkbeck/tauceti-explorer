# Small ramification and the base cases for Serre modularity

This is the first blueprint checkpoint. It covers R25.1 (explicit discriminant bounds) and R25.2 (the Tate–Serre small-characteristic representations). Every declaration is a plan. R25.2 is closed. R25.1 is partial: the torsion-field bounds of Fontaine's and Schoof's arguments remain. R25.3–R25.6 are not read in this checkpoint. The layer boundaries follow the accepted restructuring RS-06, which keeps this roadmap and narrows R25.1 and R25.2. The generic finite-flat ramification bound, the local tame and Weil–Deligne carrier, the finite GL₂/PGL₂ image classification and the coefficient-field descent are imported from R07.6, R01.2, R01.4 and R01.1.

## Scope, ownership and conventions

The targets of this checkpoint are two theorems. Tate's theorem says that there is no continuous, absolutely irreducible ρ̄ : G_ℚ → GL₂(F) with F finite of characteristic 2 and unramified outside 2. Serre's theorem is the odd analogue in characteristic 3. Together they are Dieulefait–Pacetti's Theorem 1.1, the base case used by Khare's level-one theorem (ClassicalSerreModularity R26) and by the modern proof (R33, Paso 6). The plan follows Tate's method: a local bound for the discriminant at p, a global lower bound, and group theory.

Owned elsewhere and imported, never planned again:

- Dickson's classification of finite subgroups of PGL₂(F̄_p), the Borel normal form of a group normalising a nontrivial p-subgroup, and the reducibility of finite abelian subgroups: ArithmeticGaloisRepresentations R01.4.
- Finite image and finite coefficient fields of residual representations: R01.1. Decomposition and inertia groups, unramifiedness at ℓ, oddness and restriction to a decomposition group: R01.2.
- The different exponent, the upper ramification filtration, Herbrand functions and the discriminant in upper numbering: Tau Ceti's LocalFieldsRamification, Layer 3. The tame quotient with σ τ σ⁻¹ = τ^q is Layer 4, and the unit filtration is Layer 1.
- Local class field theory, with the reciprocity map carrying U^{(n)} onto the n-th upper ramification group: Tau Ceti's ClassFieldTheory, Layer 7.
- Global different exponents computed at completions: Tau Ceti's NumberFieldArithmetic, Layers 5–6.
- The explicit formula for log |d_K| (Odlyzko 1990, (2.3)): AnalyticNumberTheory AN.3, on the completed Dedekind zeta function of AN.4.

Conventions pinned here:

- The local root-discriminant exponent is δ(E) = d(E/ℚ_p)/e(E/ℚ_p) = v_p(disc E/ℚ_p)/[E:ℚ_p]: the different normalised by v_p(p) = 1, which is Jones's 'mean slope'. For a Galois number field unramified outside p, rd_K = p^{δ(K_𝔭)}.
- Upper numbering is Serre's, with G^0 the inertia group; the discriminant exponent of a Galois E/ℚ_p is Σ_{i ≥ −1} ([G : G^{i+}] − [G : G^i])(i + 1).
- A residual representation has a finite coefficient field F with the discrete topology. F̄_p-valued representations are reduced to this case through their finite image. Absolute irreducibility is irreducibility over F̄. 'Odd' means det ρ̄(c) = −1 for complex conjugation c; in characteristic 2 this is automatic.
- Minkowski's bound is Mathlib's `NumberField.abs_discr_ge'`. The analytic bound uses the kernel g(x) = (1 − |x|)cos πx + sin π|x|/π on [−1, 1], a self-convolution with nonnegative Fourier transform. It is not Tartar's optimal kernel; the two thresholds needed here have comfortable margins with g.

What the plan changes relative to Tate's paper, as far as the published accounts show:

- At p = 2 the local bound is δ ≤ 2, not Tate's δ ≤ 5/2 − 2/|P|. The Frobenius acts freely on the wild inertia when the decomposition group is non-abelian, and in the abelian case local class field theory over ℚ₂ gives |P| ≤ 4. With δ ≤ 2, Minkowski's bound alone finishes the proof: rd > 4 for n ≥ 12, and the dihedral case has δ ≤ 3/2 < log₂ 3.
- At p = 3 the local bound is δ ≤ 13/6 − 1/|P|. The tame quadratic automorphism acts on the graded pieces of the unit filtration by (−1)^v, which kills the even levels. Dickson's classification gives 24 | n with either |P| = 3 or n ≥ 720. Two certified rows of the Odlyzko–Poitou bound then suffice: rd > 10 for totally complex n ≥ 24, and rd > 12 for n ≥ 36.
- Neither prime needs a list of number fields.

Tate's paper (Contemp. Math. 174 (1994), 153–156) and Serre's note (Œuvres III, p. 710) were not accessible. The plan was checked against Dieulefait–Pacetti, Khare, Moon–Taguchi, Jones and Ghitza–Yamauchi, and every local value was recomputed on explicit fields (ℚ₂(√−1, √2), ℚ₂(√2), ℚ₃(ζ₃, ∛3), ℚ₃(ζ₉)⁺).

In the suggested Lean file the imported objects are placeholders named after their owners' planned declarations (`differentExponent`, `upperRamificationGroup`, `localArtinMap`, `IsUnramifiedAt`, `IsOdd`, `IsAbsolutelyIrreducible`), so that the statements below have their final signatures.

## Explicit discriminant bounds (R25.1)

### The local root-discriminant exponent δ(E/ℚ_p)

Declaration: TauCeti.SmallRamification.localRootDiscrExp (definition). Node: SmallRamificationAndAbelianVarietyBaseCases:R25.1/local-root-discriminant-exponent. Planet: Local root-discriminant exponent.

Let p be a prime and E/ℚ_p a finite extension with ramification index e(E/ℚ_p) and different exponent d(E/ℚ_p) = v_E(𝔡_{E/ℚ_p}) (LocalFieldsRamification, Layer 3). The local root-discriminant exponent is the rational number δ(E) = d(E/ℚ_p)/e(E/ℚ_p). Equivalently δ(E) = v_p(disc(E/ℚ_p))/[E:ℚ_p], the p-adic valuation of the different normalised by v_p(p) = 1. It is the exponent with which p enters the root discriminant of a Galois number field whose completion at a prime above p is E (R25.1/root-discriminant-of-galois-field).

Hypotheses: p prime; E/ℚ_p a finite extension, carrying the unique extension of the p-adic valuation. d and e are the different exponent and ramification index of LocalFieldsRamification Layer 3, not the global objects.

Proof or construction:

1. Definition: δ(E) := (d(E/ℚ_p) : ℚ)/e(E/ℚ_p); e ≥ 1, so the quotient is defined.
2. The discriminant form: the local discriminant exponent is f(E/ℚ_p)·d(E/ℚ_p) (LocalFieldsRamification Layer 3, discriminantExponent_eq_inertiaDegree_mul_differentExponent) and e·f = [E:ℚ_p], so v_p(disc)/[E:ℚ_p] = f d/(e f) = δ(E).
3. Upper-numbering form, for E/ℚ_p Galois with group G and upper filtration G^u (Jones (1), requested from LocalFieldsRamification Layer 3): δ(E) = Σ_u (1/|G^{u+}| − 1/|G^u|)(u + 1), the sum over the finitely many jumps u ≥ 0 of the upper filtration.
4. Tame form: if p ∤ e then d = e − 1 (the exact tame exponent, Tau Ceti), so δ(E) = 1 − 1/e < 1.
5. δ(E) = 0 exactly when e = 1, since d = 0 iff E/ℚ_p is unramified; δ is unchanged under an unramified extension E'/E, because then d and e are unchanged.

The required uses are:

- SmallRamificationAndAbelianVarietyBaseCases:R25.1/root-discriminant-of-galois-field: The root discriminant of a Galois number field is the product of p^{δ(K_𝔭)} over the ramified p.
- SmallRamificationAndAbelianVarietyBaseCases:R25.1/two-adic-different-bound: The quantity bounded: δ(E) ≤ 2 for the 2-adic fields cut out by mod-2 representations.
- SmallRamificationAndAbelianVarietyBaseCases:R25.1/three-adic-different-bound: The quantity bounded: δ(E) ≤ 13/6 − 1/|P| for the 3-adic fields cut out by mod-3 representations.
- SmallRamificationAndAbelianVarietyBaseCases:R25.2/tame-level-one-excluded: The tame formula δ = 1 − 1/e < 1 bounds the root discriminant by p.
- SmallRamificationAndAbelianVarietyBaseCases:R25.3: Fontaine's bound for the torsion fields of an abelian scheme over ℤ is δ < 1 + 1/(p − 1) (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6), applied in the next checkpoint.

The API supplies:

- TauCeti.SmallRamification.localRootDiscrExp (constructor): localRootDiscrExp p E : ℚ := (differentExponent ℚ_[p] E : ℚ) / ramificationIndex ℚ_[p] E.
- TauCeti.SmallRamification.localRootDiscrExp_eq_discriminantExponent_div (characterisation): localRootDiscrExp p E = discriminantExponent ℚ_[p] E / [E : ℚ_[p]].
- TauCeti.SmallRamification.localRootDiscrExp_eq_sum_upper (characterisation): For E/ℚ_p Galois with group G: localRootDiscrExp p E = Σ over the jumps u of the upper filtration of (1/|G^{u+}| − 1/|G^u|)(u + 1).
- TauCeti.SmallRamification.localRootDiscrExp_eq_zero_iff (characterisation): localRootDiscrExp p E = 0 ↔ E/ℚ_p is unramified.
- TauCeti.SmallRamification.localRootDiscrExp_of_tame (other): If p ∤ e(E/ℚ_p) then localRootDiscrExp p E = 1 − 1/e(E/ℚ_p).
- TauCeti.SmallRamification.localRootDiscrExp_of_isUnramified (compatibility): If E'/E is unramified then localRootDiscrExp p E' = localRootDiscrExp p E.
- TauCeti.SmallRamification.localRootDiscrExp_congr (relation): An isomorphism E ≃ₐ[ℚ_p] E' gives equal exponents.

Discriminating tests:

- TauCeti.SmallRamification.localRootDiscrExp_two_adic_i (value): localRootDiscrExp 2 ℚ_2(√−1) = 1 (discriminant 2², degree 2).
- TauCeti.SmallRamification.localRootDiscrExp_two_adic_sqrt_two (value): localRootDiscrExp 2 ℚ_2(√2) = 3/2. The unnormalised different exponent is 3 and the discriminant exponent is 3, so a definition dividing by neither or by the wrong one of e and [E:ℚ_p] fails.
- TauCeti.SmallRamification.localRootDiscrExp_three_adic_pure_cubic (value): localRootDiscrExp 3 ℚ_3(ζ_3, ∛3) = 11/6: degree 6, totally ramified, discriminant exponent 11 = 2·5 + 1 from the tower ℚ_3 ⊂ ℚ_3(∛3) ⊂ ℚ_3(∛3, √−3).
- TauCeti.SmallRamification.localRootDiscrExp_self (degenerate): localRootDiscrExp p ℚ_p = 0, and the exponent of the unramified quadratic extension of ℚ_p is 0.

Acceptance:

- δ(ℚ_2(√−1)) = 1, δ(ℚ_2(√2)) = 3/2, δ(ℚ_3(ζ_3, ∛3)) = 11/6, and δ(E) = 0 for E/ℚ_p unramified.
- For a Galois number field K unramified outside p, rd_K = p^{δ(K_𝔭)} (R25.1/root-discriminant-of-galois-field).

Library: `Padic`, `differentIdeal`.

Source: Jones10-preprint, §1.1, equation (1), p. 2; Jones10-preprint, §1.1, equation (3), p. 3.

### The root discriminant of a Galois number field is local

Declaration: TauCeti.SmallRamification.rootDiscr_eq_prod_rpow_localRootDiscrExp (theorem). Node: SmallRamificationAndAbelianVarietyBaseCases:R25.1/root-discriminant-of-galois-field.

Let K/ℚ be a finite Galois extension of degree n, p a prime, 𝔭 a prime of 𝓞_K above p and K_𝔭 the completion. Then v_p(|d_K|) = n·δ(K_𝔭), where δ is R25.1/local-root-discriminant-exponent; δ(K_𝔭) does not depend on 𝔭. Consequently rd_K = ∏_{p ∣ d_K} p^{δ(K_𝔭)}, and if K is unramified at every prime other than p then rd_K = p^{δ(K_𝔭)}.

Hypotheses: K/ℚ finite Galois (IsGalois ℚ K); p prime; 𝔭 ∣ p.

Proof or construction:

1. |d_K| = N(𝔡_K), the absolute norm of the different ideal of 𝓞_K over ℤ (NumberField.absNorm_differentIdeal).
2. 𝔡_K = ∏_𝔓 𝔓^{d_𝔓}, and the exponent d_𝔓 at a prime above p is the local different exponent d(K_𝔓/ℚ_p) (NumberFieldArithmetic Layer 6, requested). Gal(K/ℚ) permutes the primes above p transitively, so d_𝔓, e and f are the same for all of them, and the g primes above p satisfy e f g = n.
3. v_p(N(𝔡_K)) = Σ_{𝔓∣p} f·d = g f d = n·d/e = n·δ(K_𝔭).
4. By NumberField.not_dvd_discr_iff_isUnramifiedIn only the ramified p divide d_K; take n-th roots (NumberField.rootDiscr_def).

Acceptance:

- For K = ℚ(√−3): n = 2, δ(ℚ_3(√−3)) = 1/2 and rd_K = 3^{1/2} = √3 = |−3|^{1/2}.
- For K = ℚ(ζ_9)^+: n = 3, δ = 4/3 and |d_K| = 3^4 = 81.

Depends on: R25.1/local-root-discriminant-exponent.

Library: `NumberField.absNorm_differentIdeal`, `NumberField.not_dvd_discr_iff_isUnramifiedIn`, `NumberField.rootDiscr_def`, `NumberField.discr`, `IsGalois`.

Source: MoonTaguchi07-arXiv, §3, proof of the Theorem, pp. 6–7; Jones10-preprint, §1.1, equation (1), p. 2.

### Local characters of order prime to p have inertia image of order dividing p − 1

Declaration: TauCeti.SmallRamification.orderOf_map_inertia_dvd_sub_one (lemma). Node: SmallRamificationAndAbelianVarietyBaseCases:R25.1/prime-to-p-character-inertia.

Let E/ℚ_p be a finite Galois extension with group D, inertia subgroup I and wild inertia subgroup P ⊆ I, and let ψ : D → F^× be a homomorphism, F a finite field of characteristic p. Then ψ(P) = 1 and ψ(I) is cyclic of order dividing p − 1. In particular for p = 2 every such ψ is unramified, and for p = 3, ψ(I) ⊆ {±1}.

Hypotheses: F finite of characteristic p, so F^× has order prime to p.

Proof or construction:

1. P is a p-group (LocalFieldsRamification Layer 3) and |F^×| = |F| − 1 is prime to p, so ψ(P) = 1.
2. I/P is cyclic and a Frobenius lift φ ∈ D acts on it by τ ↦ τ^p (the tame quotient, LocalFieldsRamification Layer 4, requested).
3. F^× is abelian, so ψ(τ) = ψ(φτφ^{−1}) = ψ(τ^p) = ψ(τ)^p, hence ψ(τ)^{p−1} = 1 for every τ ∈ I.

Acceptance:

- p = 2: the characters ψ_1, ψ_2 on the diagonal of a mod-2 local representation are unramified (Tate's 'tame degree 1').
- p = 3: the mod-3 cyclotomic character ω restricted to I_3 has image exactly {±1}, so the bound p − 1 = 2 is attained.

Library: `IsPGroup`.

Source: MoonTaguchi07-arXiv, §2, after (2.1), p. 2; Jones10-preprint, §2.2, p. 9.

### The p-th power map on principal units in the three small cases

Declaration: TauCeti.SmallRamification.principalUnits_pow_subset (lemma). Node: SmallRamificationAndAbelianVarietyBaseCases:R25.1/unit-filtration-power-maps.

Write U^{(i)} = 1 + 𝔪^i for the principal units of a finite extension of ℚ_p. (a) If E_0/ℚ_2 is unramified then U^{(3)} ⊆ (U^{(1)})², and U^{(2)}·(U^{(1)})² has index at most 2 over U^{(3)}·(U^{(1)})² = (U^{(1)})². (b) If E_0/ℚ_3 is unramified then U^{(2)} ⊆ (U^{(1)})³. (c) If E_1/ℚ_3 has absolute ramification index 2 then (U^{(1)})³ ⊆ U^{(3)}, U^{(4)} ⊆ (U^{(1)})³, and U^{(3)} has index at most 3 over U^{(4)}·(U^{(3)} ∩ (U^{(1)})³). (d) If moreover E_1/E_0 is a ramified quadratic extension with nontrivial automorphism τ, then for u ∈ U^{(i)}, τ(u) ≡ u^{(−1)^i} modulo U^{(i+1)}.

Hypotheses: Complete discretely valued fields of characteristic 0 with finite residue field of characteristic p ∈ {2, 3}.

Proof or construction:

1. All four parts are Fesenko–Vostokov I.(5.7)–(5.8) with e the absolute ramification index: the p-th power maps U^{(i)} onto U^{(i+e)} for i > e/(p − 1), and U^{(i)} ⊆ (U^{(i−e)})^p for i > pe/(p − 1) (Corollary 2 of (5.8)).
2. (a) e = 1, p = 2: pe/(p − 1) = 2, so U^{(3)} ⊆ (U^{(2)})² ⊆ (U^{(1)})². The squares of 1 + 2x are 1 + 4(x + x²) modulo 8, so the image of U^{(2)} in U^{(1)}/(U^{(1)})² is the cokernel of the Artin–Schreier map x ↦ x² + x on the residue field, which has order 2 (case (2) of (5.7), θ_0 = 1).
3. (b) e = 1, p = 3: 3e/2 = 3/2 < 2, so U^{(2)} ⊆ (U^{(1)})³.
4. (c) e = 2, p = 3: e/(p − 1) = 1, so cubing sends U^{(1)} into U^{(3)} (case (2) of (5.7): (1 + aπ)³ ≡ 1 + (a³ + θ_0 a)π³ modulo π⁴); U^{(4)} ⊆ (U^{(2)})³ since 4 > pe/(p − 1) = 3; and the cokernel of the additive map a ↦ a³ + θ_0 a on the residue field has order at most 3 because its kernel has order at most 3.
5. (d) E_1 = E_0(π) with π² ∈ E_0 a uniformiser of E_0 up to a unit square (p odd, tame), so τ(π) = −π; τ is trivial on the residue field, so τ(1 + aπ^i) ≡ 1 + a(−π)^i modulo π^{i+1}.

Acceptance:

- (a) is attained over ℚ_2: 5 = 1 + 4·1 is not a square in ℚ_2, and (1 + 2x)² ∈ 1 + 8ℤ_2 for x even.
- (c) is attained over ℚ_3(√−3): the Kummer class of 3 has conductor exponent 4 and that of 2 = −(1 − 3) has conductor exponent 2.

Source: FesenkoVostokov-LF, Ch. I, (5.7) Proposition, pp. 14–15; FesenkoVostokov-LF, Ch. I, (5.8) Corollary 2, p. 16; MoonTaguchi07-arXiv, §2, proof of Lemma 1, p. 3.

### Tate's 2-adic bound: δ(E) ≤ 2 for fields cut out by mod-2 representations

Declaration: TauCeti.SmallRamification.localRootDiscrExp_le_two_of_char_two (theorem). Node: SmallRamificationAndAbelianVarietyBaseCases:R25.1/two-adic-different-bound. Planet: Tate's 2-adic bound.

Let F be a finite field of characteristic 2, E/ℚ_2 a finite Galois extension with group D, inertia I and wild inertia P ⊆ I, and ι : D → GL_2(F) an injective homomorphism. (i) If P = 1 then E/ℚ_2 is tame and δ(E) = 1 − 1/|I| < 1. (ii) If P ≠ 1 then I = P, P is an elementary abelian 2-group, and after conjugation in GL_2(F̄) the image ι(D) is upper triangular with ι(P) unipotent and unramified diagonal characters ψ_1, ψ_2. (iii) If P ≠ 1 and D is non-abelian then δ(E) = 2 − 2/|P|. (iv) If P ≠ 1 and D is abelian then |P| ≤ 4 and δ(E) ≤ 2. In every case δ(E) ≤ 2, and δ(E) ≤ 3/2 when |P| ≤ 2.

Hypotheses: F finite, characteristic 2; E/ℚ_2 finite Galois; ι injective. δ is R25.1/local-root-discriminant-exponent.

Proof or construction:

1. (i) With P = 1 the extension is tame, and δ = 1 − 1/e with e = |I| (local-root-discriminant-exponent, tame form).
2. (ii) A nontrivial 2-subgroup of GL_2(F̄) fixes a unique line, and its normaliser lies in the stabiliser of that line, the Borel subgroup; its 2-elements are unipotent (ArithmeticGaloisRepresentations R01.4, requested). P is normal in D, so ι(D) is upper triangular with diagonal characters ψ_1, ψ_2 : D → F̄^×. By R25.1/prime-to-p-character-inertia (p = 2) both are unramified, so ι(I) is unipotent: I = P ≅ a subgroup of (F̄, +), elementary abelian.
3. Let E_0 = E^I, the maximal unramified subextension. E/E_0 is totally ramified abelian with group P of exponent 2. By local class field theory (ClassFieldTheory Layer 7, requested; Fesenko–Vostokov IV.(3.5)) the reciprocity map U_{E_0} → P is onto and sends U^{(n)} onto the upper ramification group P^{(n)} of E/E_0; it kills squares and the prime-to-2 part of U_{E_0}. So P^{(1)} = P, P^{(3)} = 1 by R25.1/unit-filtration-power-maps (a), and a := |P^{(2)}| ∈ {1, 2}.
4. E_0/ℚ_2 is unramified, so on inertia the upper filtration of D over ℚ_2 is that of P over E_0 (the Herbrand function of an unramified extension is the identity). The upper-numbering formula for δ gives, with jumps at u = 1 and u = 2, δ(E) = 2(1/a − 1/|P|) + 3(1 − 1/a) = 3 − 1/a − 2/|P|, which is 2 − 2/|P| if a = 1 and 5/2 − 2/|P| if a = 2.
5. (iii) If D is non-abelian then ψ_1 ≠ ψ_2 on D, so λ = (ψ_1ψ_2^{−1})(φ) ≠ 1 for a Frobenius lift φ; λ has odd order. Conjugation by φ acts on P ⊆ (F̄, +) as multiplication by λ, which fixes no nonzero vector. The reciprocity map is equivariant for the Frobenius of E_0/ℚ_2, which preserves each U^{(n)}, so P^{(2)} is λ-stable. A λ-stable subgroup {0, x} of order 2 would force λx = x; hence a = 1 and δ(E) = 2 − 2/|P|.
6. (iv) If D is abelian then E/ℚ_2 is abelian and, by local class field theory over ℚ_2, I = P is a quotient of ℤ_2^×/(ℤ_2^×)² ≅ (ℤ/2)², so |P| ≤ 4 and δ(E) ≤ 5/2 − 2/4 = 2.
7. Finally, 3 − 1/a − 2/|P| ≤ 3/2 when |P| ≤ 2 (then a ≤ |P|, and a = |P| = 2 gives 3/2).

Acceptance:

- ℚ_2(√−1, √2), with D = (ℤ/2)² embedded as the unipotent group of GL_2(𝔽_4), has δ = 2: the four characters of (ℤ/2)² have conductor exponents 0, 2, 3, 3 and (0 + 2 + 3 + 3)/4 = 2. So the bound δ ≤ 2 is sharp.
- ℚ_2(√2) embedded in the unipotent group of GL_2(𝔽_2) has δ = 3/2, the bound for |P| ≤ 2.

Depends on: R25.1/local-root-discriminant-exponent, R25.1/prime-to-p-character-inertia, R25.1/unit-filtration-power-maps, ArithmeticGaloisRepresentations:R01.4.

Library: `Matrix.GeneralLinearGroup`, `IsPGroup`, `Subgroup.normalizer`.

Source: MoonTaguchi07-arXiv, §2, before Lemma 1, p. 2; MoonTaguchi07-arXiv, §2, proof of Lemma 3, pp. 4–5; MoonTaguchi07-arXiv, §2, proof of Lemma 1, p. 3; Jones10-preprint, §2.2, pp. 8–9.

### The 3-adic bound: δ(E) ≤ 13/6 − 1/|P| for fields cut out by mod-3 representations

Declaration: TauCeti.SmallRamification.localRootDiscrExp_le_of_char_three (theorem). Node: SmallRamificationAndAbelianVarietyBaseCases:R25.1/three-adic-different-bound. Planet: 3-adic bound.

Let F be a finite field of characteristic 3, E/ℚ_3 a finite Galois extension with group D, inertia I and wild inertia P ⊆ I, and ι : D → GL_2(F) an injective homomorphism. (i) If P = 1 then δ(E) = 1 − 1/|I| < 1. (ii) If P ≠ 1 then P is an elementary abelian 3-group, [I : P] ∈ {1, 2}, and δ(E) ≤ 13/6 − 1/|P|. More precisely: if I = P then δ(E) = 2 − 2/|P|; if [I : P] = 2 then δ(E) = 5/2 − 1/|P| − 1/a with a ∈ {1, 3} when the tame inertia acts on P by −1, and δ(E) = 2 − 3/(2|P|) when it acts trivially.

Hypotheses: F finite, characteristic 3; E/ℚ_3 finite Galois; ι injective.

Proof or construction:

1. (i) As in the 2-adic case: tame, δ = 1 − 1/e.
2. (ii) Borel normal form as in R25.1/two-adic-different-bound, step (ii), with p = 3: ι(D) upper triangular, ι(P) unipotent, so P is elementary abelian. By R25.1/prime-to-p-character-inertia (p = 3), ψ_1(I), ψ_2(I) ⊆ {±1}, so e_0 := [I : P] ∈ {1, 2}.
3. e_0 = 1: E/E_0 (E_0 = E^I, unramified over ℚ_3) is totally ramified abelian of exponent 3. By local class field theory the upper groups are P^{(n)} = rec(U^{(n)}_{E_0}); by R25.1/unit-filtration-power-maps (b), P^{(2)} = 1. The only jump is u = 1, and δ = 2(1 − 1/|P|).
4. e_0 = 2: let E_1 = E^P, a ramified quadratic extension of E_0 with automorphism τ, and τ̃ ∈ I a lift. P = Gal(E/E_1) is abelian of exponent 3 and rec : U^{(1)}_{E_1} → P is onto, with rec(U^{(v)}) = P^{(v)} (upper numbering over E_1). By R25.1/unit-filtration-power-maps (c), P^{(4)} = 1 and |P^{(3)}| ≤ 3.
5. Equivariance: rec(τ(u)) = τ̃ rec(u) τ̃^{−1} = rec(u)^ε with ε = (ψ_1ψ_2^{−1})(τ̃) ∈ {±1}. For u ∈ U^{(v)}, R25.1/unit-filtration-power-maps (d) gives τ(u) = u^{(−1)^v} w with w ∈ U^{(v+1)}, so rec(u)^{ε − (−1)^v} ∈ P^{(v+1)}. If ε ≠ (−1)^v the exponent is ±2, invertible modulo 3, so P^{(v)} = P^{(v+1)}. Hence ε = −1 gives P^{(2)} = P^{(3)} =: A, and ε = +1 gives P^{(1)} = P^{(2)} = P and P^{(3)} = 1.
6. Herbrand: the upper filtration of D over ℚ_3 is D^0 = I, D^u = P^{(2u)} for u > 0, since φ_{E_1/E_0}(x) = x/2 for x ≥ 0 (tame quadratic) and E_0/ℚ_3 is unramified.
7. Upper-numbering formula: the u = 0 jump contributes 1/|P| − 1/(2|P|) = 1/(2|P|). For ε = −1, with a = |A|: δ = 1/(2|P|) + (3/2)(1/a − 1/|P|) + (5/2)(1 − 1/a) = 5/2 − 1/|P| − 1/a ≤ 13/6 − 1/|P|. For ε = +1: δ = 1/(2|P|) + 2(1 − 1/|P|) = 2 − 3/(2|P|) < 13/6 − 1/|P|. Also 2 − 2/|P| < 13/6 − 1/|P|.

Acceptance:

- ℚ_3(ζ_3, ∛3), with D ≅ S_3 embedded as {(±1, b; 0, 1)} ⊆ GL_2(𝔽_3), has δ = 11/6 = 13/6 − 1/3: the bound is sharp for |P| = 3.
- ℚ_3(ζ_9)^+, with D = ℤ/3 unipotent in GL_2(𝔽_3), has e_0 = 1 and δ = 2 − 2/3 = 4/3, matching |d| = 81 for ℚ(ζ_9)^+.

Depends on: R25.1/local-root-discriminant-exponent, R25.1/prime-to-p-character-inertia, R25.1/unit-filtration-power-maps, R25.1/two-adic-different-bound, ArithmeticGaloisRepresentations:R01.4.

Library: `Matrix.GeneralLinearGroup`.

Source: GhitzaYamauchi25-arXiv, §2.3, Lemma 2.6, p. 5; DP23-arXiv, §1.1, proof of Theorem 1.1, p. 3; FesenkoVostokov-LF, Ch. IV, (3.5) Theorem, p. 135.

### Minkowski thresholds for the root discriminant

Declaration: TauCeti.SmallRamification.two_lt_rootDiscr (lemma). Node: SmallRamificationAndAbelianVarietyBaseCases:R25.1/minkowski-root-discriminant-thresholds.

For every number field K of degree n: if n ≥ 3 then rd_K > 2; if n ≥ 6 then rd_K > 3; if n ≥ 12 then rd_K > 4.

Hypotheses: K a number field of degree n = [K:ℚ]; rd_K = NumberField.rootDiscr K.

Proof or construction:

1. NumberField.abs_discr_ge': |d_K| ≥ M_{r_2}(n) := n^{2n}/((4/π)^{2r_2} (n!)²). Since 2r_2 ≤ n and π/4 < 1, M_{r_2}(n) ≥ M(n) := (π/4)^n (n^n/n!)².
2. rd_K > c is equivalent to |d_K| > c^n (NumberField.rootDiscr_def), so it suffices that M(n) > c^n.
3. Base cases, with π > 3.14 (Real.pi_gt_d2): M(3) > 0.785³·(9/2)² > 9.79 > 8 = 2³; M(6) > 0.785⁶·64.8² > 983 > 729 = 3⁶; M(12) > 0.785¹²·(12¹²/12!)² > 1.89·10⁷ > 4¹² = 16777216.
4. Induction: M(n+1)/M(n) = (π/4)(1 + 1/n)^{2n} ≥ 0.785·(64/27)² > 4.41 for n ≥ 3, since (1 + 1/n)^n is increasing; 4.41 > c for c ∈ {2, 3, 4}, so M(n) > c^n propagates from the base case.

Acceptance:

- For n = 11 with r_2 = 5 the Minkowski bound 4.56·10⁶ already exceeds 4¹¹ = 4194304, and for n = 10 it does not (6.8·10⁵ < 4¹⁰); the threshold 12 is the one used.
- The thresholds are consistent with the smallest fields: ℚ(√−3) (n = 2, rd = 1.73) and the totally complex sextic of discriminant −9747 (rd = 4.61 > 3).

Library: `NumberField.abs_discr_ge'`, `NumberField.rootDiscr_def`, `NumberField.InfinitePlace.nrComplexPlaces`, `Real.pi_gt_d2`, `Nat.factorial`.

Source: Odlyzko90-JTNB, §1, p. 119; GhitzaYamauchi25-arXiv, §3, proof of Proposition 3.2, p. 7.

### The kernel g(x) = (1 − |x|)cos πx + sin π|x|/π

Declaration: TauCeti.SmallRamification.odlyzkoKernel (definition). Node: SmallRamificationAndAbelianVarietyBaseCases:R25.1/odlyzko-kernel.

The even function g : ℝ → ℝ with g(x) = (1 − |x|) cos(πx) + sin(π|x|)/π for |x| ≤ 1 and g(x) = 0 for |x| ≥ 1. Equivalently g = 2·(h ⋆ h), the convolution square of h(x) = cos(πx)·1_{[−1/2, 1/2]}(x). Hence g is continuous, continuously differentiable (g′(x) = −π(1 − x) sin(πx) on [0, 1]), nonnegative, supported in [−1, 1], positive definite (its Fourier transform 2|ĥ|² is nonnegative), and g(0) = 1.

Hypotheses: None: g is an explicit real function.

Proof or construction:

1. Definition by cases on |x| ≤ 1, with Real.cos, Real.sin and Real.pi.
2. Convolution identity: for 0 ≤ x ≤ 1, (h ⋆ h)(x) = ∫_{x−1/2}^{1/2} cos(πy) cos(π(x − y)) dy = ½(1 − x) cos(πx) + ½ ∫_{x−1/2}^{1/2} cos(π(2y − x)) dy = ½[(1 − x) cos(πx) + sin(πx)/π]; for x ≥ 1 the supports are disjoint; both sides are even.
3. Nonnegativity: h ≥ 0, so h ⋆ h ≥ 0. Positive definiteness: h ⋆ h̃ with h̃(x) = h(−x) = h(x) is positive definite (Σ c_i c̄_j (h ⋆ h̃)(v_i − v_j) = ∫ |Σ c_i h(v_i − y)|² dy ≥ 0), which is TauCeti.IsPositiveDefiniteSub.
4. g(0) = 2∫ cos²(πy) dy over [−1/2, 1/2] = 1, and ∫_0^1 g = ∫_0^1 (1 − x) cos(πx) dx + ∫_0^1 sin(πx)/π dx = 2/π² + 2/π² = 4/π².

The required uses are:

- SmallRamificationAndAbelianVarietyBaseCases:R25.1/poitou-lower-bound: The test function F(x) = g(x/b)/cosh(x/2) in the explicit formula.
- SmallRamificationAndAbelianVarietyBaseCases:R25.1/poitou-kernel-positivity: Supplies f = g(·/b) ≥ 0 with nonnegative Fourier transform.
- SmallRamificationAndAbelianVarietyBaseCases:R25.1/totally-complex-root-discriminant-thresholds: The certified evaluations at b = 13/2 and b = 8 integrate this explicit g.

The API supplies:

- TauCeti.SmallRamification.odlyzkoKernel (constructor): odlyzkoKernel x = if |x| ≤ 1 then (1 − |x|) * cos (π * x) + sin (π * |x|) / π else 0.
- TauCeti.SmallRamification.odlyzkoKernel_eq_two_mul_convolution (characterisation): odlyzkoKernel = 2 • (h ⋆ h) for h = indicator [−1/2, 1/2] (fun y => cos (π * y)).
- TauCeti.SmallRamification.odlyzkoKernel_nonneg (other): 0 ≤ odlyzkoKernel x.
- TauCeti.SmallRamification.odlyzkoKernel_zero (simp): odlyzkoKernel 0 = 1.
- TauCeti.SmallRamification.odlyzkoKernel_neg (simp): odlyzkoKernel (−x) = odlyzkoKernel x.
- TauCeti.SmallRamification.odlyzkoKernel_eq_zero_of_one_le_abs (other): 1 ≤ |x| → odlyzkoKernel x = 0.
- TauCeti.SmallRamification.isPositiveDefiniteSub_odlyzkoKernel (other): IsPositiveDefiniteSub (fun x => (odlyzkoKernel x : ℂ)).
- TauCeti.SmallRamification.contDiff_odlyzkoKernel (other): ContDiff ℝ 1 odlyzkoKernel.
- TauCeti.SmallRamification.integral_odlyzkoKernel_Ioi (other): ∫ x in Ioi 0, odlyzkoKernel x = 4 / π^2.

Discriminating tests:

- TauCeti.SmallRamification.odlyzkoKernel_zero (value): odlyzkoKernel 0 = 1 (normalisation F(0) = 1 of the explicit formula).
- TauCeti.SmallRamification.odlyzkoKernel_half (value): odlyzkoKernel (1/2) = 1/π.
- TauCeti.SmallRamification.odlyzkoKernel_three_quarters_pos (non-example): 0 < odlyzkoKernel (3/4); the variant without the sine term, (1 − |x|) cos(πx), is negative at 3/4 and fails.
- TauCeti.SmallRamification.odlyzkoKernel_one (degenerate): odlyzkoKernel 1 = 0 and odlyzkoKernel 2 = 0 (support in [−1, 1]).
- TauCeti.SmallRamification.integral_odlyzkoKernel_Ioi (value): ∫ x in Ioi 0, odlyzkoKernel x = 4/π²; a variant with sin(π|x|) instead of sin(π|x|)/π integrates to 2/π² + 2/π and fails.

Acceptance:

- g(3/4) = √2/(2π) − √2/8 ≈ 0.0483 > 0, while (1 − |x|) cos(πx) alone is negative on (1/2, 1): the sine term is what makes g ≥ 0.
- ∫_0^1 g = 4/π², which produces the pole term 16b/π² in R25.1/poitou-lower-bound.

Library: `Real.cos`, `Real.sin`, `MeasureTheory.convolution`, `TauCeti.IsPositiveDefiniteSub`.

Source: Odlyzko90-JTNB, §2, (2.4)–(2.5), p. 122.

### Positivity of the test function F = f/cosh(x/2) on primes and zeros

Declaration: TauCeti.SmallRamification.re_poitouTransform_nonneg (lemma). Node: SmallRamificationAndAbelianVarietyBaseCases:R25.1/poitou-kernel-positivity.

Let f : ℝ → ℝ be even, continuous, compactly supported, f ≥ 0 and positive definite. Put F(x) = f(x)/cosh(x/2) and Φ(s) = ∫_ℝ F(x) e^{(s−1/2)x} dx. Then F ≥ 0, F(−x) = F(x), and Re Φ(s) ≥ 0 for every s with 0 ≤ Re s ≤ 1.

Hypotheses: f even, continuous, compactly supported, nonnegative and positive definite (TauCeti.IsPositiveDefiniteSub).

Proof or construction:

1. F ≥ 0 and F even are immediate; compact support gives the decay (2.1) of the explicit formula, and Φ is entire.
2. Write s = 1/2 + a + it with |a| ≤ 1/2. Since F is even, the odd part sinh(ax) cos(tx) integrates to 0 and Re Φ(s) = ∫ f(x) (cosh(ax)/cosh(x/2)) cos(tx) dx.
3. For |a| < 1/2 the function x ↦ cosh(ax)/cosh(x/2) is positive definite: its Fourier transform is 4π cos(πa) cosh(πξ)/(cos(2πa) + cosh(2πξ)) > 0. For |a| = 1/2 it is the constant 1.
4. The product f(x) cosh(ax)/cosh(x/2) is continuous, integrable and positive definite (TauCeti.IsPositiveDefiniteSub.mul). By Bochner's theorem (TauCeti.bochner) it is the Fourier transform of a finite positive measure; being integrable, that measure has a nonnegative density, which is its Fourier transform. Its value at t is Re Φ(s), so Re Φ(s) ≥ 0.

Acceptance:

- With f = odlyzkoKernel(·/b), F is the test function of R25.1/poitou-lower-bound.
- Without the factor 1/cosh(x/2), f alone does not give Re Φ(s) ≥ 0 off the critical line, because e^{ax} is not positive definite.

Library: `TauCeti.IsPositiveDefiniteSub`, `TauCeti.IsPositiveDefiniteSub.mul`, `TauCeti.bochner`, `Real.cosh`.

Source: Odlyzko90-JTNB, §2, text before (2.4), p. 122.

### The Poitou–Odlyzko lower-bound function P(n, r₁, b)

Declaration: TauCeti.SmallRamification.poitouLowerBound (definition). Node: SmallRamificationAndAbelianVarietyBaseCases:R25.1/poitou-lower-bound.

For natural numbers n, r₁ and a real b > 0, let F_b(x) = g(x/b)/cosh(x/2) with g = R25.1/odlyzko-kernel, and set P(n, r₁, b) = r₁π/2 + n(γ + log 8π) − n·I₁(b) − r₁·I₂(b) − 16b/π², where γ is Euler's constant, I₁(b) = ∫_0^∞ (1 − F_b(x))/(2 sinh(x/2)) dx and I₂(b) = ∫_0^∞ (1 − F_b(x))/(2 cosh(x/2)) dx. The term 16b/π² equals 4∫_0^∞ F_b(x) cosh(x/2) dx.

Hypotheses: b > 0; the integrands are integrable: near 0, 1 − F_b(x) = O(x²) against 1/sinh(x/2) = O(1/x); for x ≥ b, F_b = 0 and the integrands decay like e^{−x/2}.

Proof or construction:

1. Definition as displayed, with Real.eulerMascheroniConstant, Real.log, Real.pi and set integrals over (0, ∞).
2. Tail evaluation: for x ≥ b, 1 − F_b = 1, and ∫_b^∞ dx/(2 sinh(x/2)) = −log tanh(b/4), ∫_b^∞ dx/(2 cosh(x/2)) = π − 2 arctan(e^{b/2}); so only integrals over [0, b] need numerical work.
3. Pole term: 4∫_0^∞ F_b(x) cosh(x/2) dx = 4∫_0^∞ g(x/b) dx = 4b·(4/π²) = 16b/π² (odlyzkoKernel API, integral_odlyzkoKernel_Ioi).
4. For fixed r₁/n and b, P(n, r₁, b)/n is increasing in n, because only −16b/(π² n) depends on n.

The required uses are:

- SmallRamificationAndAbelianVarietyBaseCases:R25.1/poitou-odlyzko-inequality: log |d_K| ≥ P(n, r₁, b) for every number field K and every b > 0.
- SmallRamificationAndAbelianVarietyBaseCases:R25.1/totally-complex-root-discriminant-thresholds: Certified lower bounds for P(n, 0, b)/n at two parameters.

The API supplies:

- TauCeti.SmallRamification.poitouLowerBound (constructor): poitouLowerBound n r₁ b = r₁ * π / 2 + n * (γ + log (8 * π)) − n * I₁ b − r₁ * I₂ b − 16 * b / π ^ 2.
- TauCeti.SmallRamification.integrableOn_poitouIntegrand_sinh (other): For 0 < b, the I₁ integrand is integrable on (0, ∞); similarly for I₂.
- TauCeti.SmallRamification.poitouLowerBound_eq_explicit (characterisation): poitouLowerBound n r₁ b = r₁π/2 + n(γ + log 8π) − n∫(1 − F_b)/(2 sinh) − r₁∫(1 − F_b)/(2 cosh) − 4∫_0^∞ F_b(x) cosh(x/2) dx, the explicit-formula right-hand side without zeros and primes.
- TauCeti.SmallRamification.poitouIntegral_sinh_eq (other): I₁ b = ∫ x in 0..b, (1 − F_b x)/(2 sinh(x/2)) − log (tanh (b/4)).
- TauCeti.SmallRamification.poitouLowerBound_div_mono (relation): For fixed b, n ≤ m → poitouLowerBound n 0 b / n ≤ poitouLowerBound m 0 b / m.

Discriminating tests:

- TauCeti.SmallRamification.poitouLowerBound_rat_nonpos (value): poitouLowerBound 1 1 b ≤ 0 for b ∈ {1/2, 1, 2}, as it must be since log |d_ℚ| = 0; numerically −0.051, −0.083 and −0.883.
- TauCeti.SmallRamification.poitouLowerBound_sqrt_neg_three (value): poitouLowerBound 2 0 1 ≤ log 3 (the field ℚ(√−3)); numerically exp(P/2) ≈ 1.698 < √3. With the sign of the pole term reversed the value exceeds log 3 (exp(P/2) ≈ 8.59), so that wrong definition fails.
- TauCeti.SmallRamification.poitouLowerBound_sqrt_five (value): poitouLowerBound 2 2 (3/2) ≤ log 5 (the field ℚ(√5)); numerically exp(P/2) ≈ 2.2226 < √5 ≈ 2.2361, which checks the r₁ terms.
- TauCeti.SmallRamification.poitouLowerBound_div_mono (degenerate): At fixed b the normalised bound increases with n, and as n → ∞ it tends to γ + log 8π − I₁(b), below log(4πe^γ).

Acceptance:

- exp(P(24, 0, 13/2)/24) ≈ 10.63 and exp(P(36, 0, 8)/36) ≈ 12.48 (R25.1/totally-complex-root-discriminant-thresholds).
- The asymptotic value is consistent with Odlyzko (2.5): for totally complex fields the main term is below 4πe^γ ≈ 22.38, which no kernel can exceed.

Depends on: R25.1/odlyzko-kernel.

Library: `Real.eulerMascheroniConstant`, `Real.cosh`, `Real.sinh`.

Source: Odlyzko90-JTNB, §2, (2.3), p. 122.

### The Odlyzko–Poitou unconditional discriminant bound

Declaration: TauCeti.SmallRamification.poitouLowerBound_le_log_abs_discr (theorem). Node: SmallRamificationAndAbelianVarietyBaseCases:R25.1/poitou-odlyzko-inequality. Planet: Odlyzko–Poitou bound.

For every number field K of degree n with r₁ real places and every b > 0: log |d_K| ≥ P(n, r₁, b), with P = R25.1/poitou-lower-bound. In particular rd_K ≥ exp(P(n, r₁, b)/n).

Hypotheses: K a number field; b > 0. No Riemann hypothesis is assumed.

Proof or construction:

1. Apply the explicit formula for log |d_K| (Odlyzko (2.3); requested from AnalyticNumberTheory AN.3, which rests on the completed Dedekind zeta function of AN.4) to F_b(x) = g(x/b)/cosh(x/2). F_b is even, F_b(0) = 1 and, g being C¹ with compact support, F_b satisfies the decay hypothesis (2.1).
2. By R25.1/poitou-kernel-positivity with f = g(·/b) (nonnegative and positive definite by the odlyzko-kernel API), F_b ≥ 0 and Re Φ(ρ) ≥ 0 for every zero ρ in the critical strip. So the zero sum Σ′ Φ(ρ) (ρ and ρ̄ together, a real number) and the prime sum 2Σ (log N𝔓/N𝔓^{m/2}) F_b(m log N𝔓) are both ≥ 0.
3. Dropping them leaves log |d_K| ≥ r₁π/2 + n(γ + log 8π) − n I₁(b) − r₁ I₂(b) − 4∫_0^∞ F_b(x) cosh(x/2) dx = P(n, r₁, b), by the poitou-lower-bound characterisation.

Acceptance:

- For K = ℚ the statement is P(1, 1, b) ≤ 0, and for ℚ(√−3) and ℚ(√5) it gives the unit tests of R25.1/poitou-lower-bound.
- For totally complex fields of degree 8 the best value over b is rd ≥ 5.65, below the smallest actual value 5.79 (discriminant 1257728).

Depends on: R25.1/poitou-lower-bound, R25.1/poitou-kernel-positivity, R25.1/odlyzko-kernel, AnalyticNumberTheory:AN.3.

Library: `NumberField.discr`.

Source: Odlyzko90-JTNB, §2, (2.3)–(2.5), p. 122; Odlyzko90-JTNB, §1, p. 121; MoonTaguchi07-arXiv, §3, p. 6.

### Certified thresholds: rd_K > 10 for n ≥ 24 and rd_K > 12 for n ≥ 36 (K totally complex)

Declaration: TauCeti.SmallRamification.ten_lt_rootDiscr_of_isTotallyComplex (lemma). Node: SmallRamificationAndAbelianVarietyBaseCases:R25.1/totally-complex-root-discriminant-thresholds.

Let K be a totally complex number field of degree n. If n ≥ 24 then rd_K > 10; if n ≥ 36 then rd_K > 12.

Hypotheses: K totally complex (NumberField.IsTotallyComplex), so r₁ = 0 (NumberField.nrRealPlaces_eq_zero_iff).

Proof or construction:

1. By R25.1/poitou-odlyzko-inequality, log rd_K ≥ P(n, 0, b)/n for every b > 0, and P(n, 0, b)/n is increasing in n (poitou-lower-bound API). So it suffices that P(24, 0, 13/2)/24 > log 10 and P(36, 0, 8)/36 > log 12.
2. Certified evaluation: P(n, 0, b)/n = γ + log 8π − I₁(b) − 16b/(π² n). Bound γ below by an explicit term of Real.eulerMascheroniSeq (Real.eulerMascheroniSeq_lt_eulerMascheroniConstant; n = 100 gives γ > 0.5722), π by Real.pi_gt_d2 and Real.pi_lt_d2, and I₁(b) above by −log tanh(b/4) plus a certified quadrature of the integrand over [0, b] (partition into 2000 intervals with an explicit Lipschitz bound, or interval arithmetic).
3. Target values, computed with composite Simpson quadrature and stable to eight digits under refinement: I₁(13/2) = 0.99897…, giving exp(P(24, 0, 13/2)/24) = 10.6266…; I₁(8) = 0.91713…, giving exp(P(36, 0, 8)/36) = 12.4784…. The margins log(10.6266/10) = 0.061 and log(12.478/12) = 0.039 absorb the certified error.

Acceptance:

- The thresholds exceed the 3-adic bounds used in R25.2: 3^{11/6} ≈ 7.49 < 10 and 3^{13/6} ≈ 10.81 < 12.
- They are consistent with Odlyzko's asymptotic value 22.38 for totally complex fields and with the smallest known fields.

Depends on: R25.1/poitou-odlyzko-inequality, R25.1/poitou-lower-bound.

Library: `NumberField.IsTotallyComplex`, `NumberField.nrRealPlaces_eq_zero_iff`, `Real.eulerMascheroniSeq_lt_eulerMascheroniConstant`, `Real.eulerMascheroniSeq`, `Real.pi_gt_d2`, `Real.pi_lt_d2`, `NumberField.rootDiscr`.

Source: Odlyzko90-JTNB, §2, (2.5), p. 122; GhitzaYamauchi25-arXiv, §3, proof of Proposition 3.3, p. 7.

## Tate–Serre small-characteristic representations (R25.2)

### Level-one residual representations IsLevelOneResidual p ρ̄

Declaration: TauCeti.SmallRamification.IsLevelOneResidual (definition). Node: SmallRamificationAndAbelianVarietyBaseCases:R25.2/level-one-residual-representation. Planet: Level-one residual representation.

Let p be a prime, F a finite field of characteristic p (discrete topology) and ρ̄ : G_ℚ → GL_2(F) a continuous homomorphism, G_ℚ = Field.absoluteGaloisGroup ℚ. ρ̄ is a level-one residual representation (IsLevelOneResidual p ρ̄) if (a) it is absolutely irreducible: F̄² has no G_ℚ-stable line after extending scalars to an algebraic closure F̄; (b) it is odd: det ρ̄(c) = −1 for a complex conjugation c ∈ G_ℚ; (c) it is unramified outside p: ρ̄(I_ℓ) = 1 for every prime ℓ ≠ p and every inertia subgroup I_ℓ above ℓ. Condition (c) says the prime-to-p Artin conductor N(ρ̄) is 1, which is Khare's 'level 1'. For p = 2, (b) holds for every ρ̄, since −1 = 1 in F. The representations, their inertia subgroups and the oddness condition are the carriers of ArithmeticGaloisRepresentations R01.1–R01.2.

Hypotheses: p prime; F finite of characteristic p; ρ̄ continuous for the Krull topology on G_ℚ and the discrete topology on GL_2(F).

Proof or construction:

1. Definition: the conjunction of (a), (b), (c), each a predicate supplied by ArithmeticGaloisRepresentations R01.1–R01.2 (absolute irreducibility, oddness, unramifiedness at ℓ).
2. Kernel field: ρ̄ has finite image (G_ℚ compact, GL_2(F) finite and discrete), so K = ℚ̄^{ker ρ̄} is a finite Galois extension with Gal(K/ℚ) ≅ ρ̄(G_ℚ). Condition (c) holds iff K/ℚ is unramified at every ℓ ≠ p (Ideal.isUnramifiedAt_iff_inertia_eq_bot at the primes above ℓ).
3. For p odd, (b) gives ρ̄(c) ≠ 1, so every complex conjugation acts nontrivially on the Galois field K: K is totally complex.
4. Scalar extension along F ⊆ F′ preserves (a)–(c): (a) is defined over F̄ ⊇ F′, and (b), (c) are equalities of matrices.

The required uses are:

- SmallRamificationAndAbelianVarietyBaseCases:R25.2/tate-serre-base-case: The hypothesis whose satisfiability is refuted for p = 2, 3.
- SmallRamificationAndAbelianVarietyBaseCases:R25.2/tate-theorem: Conditions (a) and (c) at p = 2.
- SmallRamificationAndAbelianVarietyBaseCases:R25.2/serre-mod-three-theorem: Conditions (a)–(c) at p = 3; (b) makes the kernel field totally complex.
- SmallRamificationAndAbelianVarietyBaseCases:R25.6: The base-case table records the rows p = 2 and p = 3 of level one with this predicate.
- ClassicalSerreModularity:R26.1: Khare's level-one induction starts from these two characteristics.
- ClassicalSerreModularity:R33.4: Paso 6 of the modern proof reduces a system to a residual representation unramified outside 3 and applies the p = 3 case.

The API supplies:

- TauCeti.SmallRamification.IsLevelOneResidual (constructor): IsLevelOneResidual p ρ̄ := IsAbsolutelyIrreducible ρ̄ ∧ IsOdd ρ̄ ∧ ∀ ℓ ≠ p, IsUnramifiedAt ℓ ρ̄.
- TauCeti.SmallRamification.isLevelOneResidual_iff_kernelField (characterisation): IsLevelOneResidual p ρ̄ ↔ the kernel field K is unramified at every ℓ ≠ p, Gal(K/ℚ) ≅ ρ̄(G_ℚ) acts absolutely irreducibly, and det ρ̄(c) = −1.
- TauCeti.SmallRamification.IsLevelOneResidual.map (compatibility): IsLevelOneResidual p ρ̄ ↔ IsLevelOneResidual p (ρ̄ extended along a field embedding F → F′).
- TauCeti.SmallRamification.IsLevelOneResidual.conj (relation): The predicate is invariant under conjugation by GL_2(F).
- TauCeti.SmallRamification.isOdd_of_ringChar_two (other): If ringChar F = 2 then every ρ̄ is odd.
- TauCeti.SmallRamification.IsLevelOneResidual.isTotallyComplex (other): For p odd the kernel field of a level-one residual representation is totally complex.

Discriminating tests:

- TauCeti.SmallRamification.not_isLevelOneResidual_one_add_omega (non-example): p = 3: ρ̄ = 1 ⊕ ω̄ is continuous, odd (det = ω̄, ω̄(c) = −1) and unramified outside 3, but not absolutely irreducible; so IsLevelOneResidual fails and irreducibility is a real hypothesis.
- TauCeti.SmallRamification.not_isLevelOneResidual_X0_eleven_two_torsion (non-example): p = 2: the representation on E[2] for E : y² + y = x³ − x² − 10x − 20 is absolutely irreducible (4x³ − 4x² − 40x − 79 has no rational root, image S₃ ≅ GL_2(𝔽_2)) and ramified at 11 (its splitting field contains ℚ(√−11)); so IsLevelOneResidual fails through (c).
- TauCeti.SmallRamification.isOdd_of_ringChar_two (degenerate): For F = 𝔽_2 every continuous ρ̄ is odd, since det ρ̄(c) = 1 = −1.
- TauCeti.SmallRamification.IsLevelOneResidual.map (compatibility): For ρ̄ : G_ℚ → GL_2(𝔽_2) and its extension to GL_2(𝔽_4), one satisfies the predicate iff the other does: the coefficient field is not part of the condition.

Acceptance:

- 1 ⊕ ω̄ (p = 3, ω̄ the mod-3 cyclotomic character) satisfies (b) and (c) but not (a).
- The mod-2 representation on E[2] for E : y² + y = x³ − x² − 10x − 20 (conductor 11) satisfies (a) but not (c).

Depends on: ArithmeticGaloisRepresentations:R01.1, ArithmeticGaloisRepresentations:R01.2.

Library: `Field.absoluteGaloisGroup`, `ContinuousMonoidHom`, `Matrix.GeneralLinearGroup`, `AlgebraicClosure`, `Representation.IsIrreducible`, `Ideal.isUnramifiedAt_iff_inertia_eq_bot`.

Source: Khare05-arXiv, §1, p. 2; DP23-arXiv, §1.1, Theorem 1.1, p. 3.

### A mod-2 representation unramified outside 2 has trivial determinant

Declaration: TauCeti.SmallRamification.det_eq_one_of_char_two (lemma). Node: SmallRamificationAndAbelianVarietyBaseCases:R25.2/determinant-level-one-mod-two.

Let F be a finite field of characteristic 2 and ρ̄ : G_ℚ → GL_2(F) continuous and unramified outside 2. Then det ρ̄ = 1, so ρ̄ takes values in SL_2(F).

Hypotheses: F finite of characteristic 2; ρ̄ continuous and unramified at every ℓ ≠ 2.

Proof or construction:

1. det ρ̄ : G_ℚ → F^× has finite image, a subgroup of F^× of odd order dividing |F| − 1; its kernel field L is cyclic of odd degree over ℚ.
2. L is unramified at every ℓ ≠ 2 by hypothesis. At 2, the inertia image of det ρ̄ is trivial by R25.1/prime-to-p-character-inertia with p = 2, applied to the completion of L at a prime above 2.
3. So L/ℚ is unramified at every prime and d_L = ±1 (NumberField.not_dvd_discr_iff_isUnramifiedIn); by NumberField.abs_discr_gt_two, [L:ℚ] = 1, and det ρ̄ is trivial.

Acceptance:

- In odd characteristic the analogue fails: for p = 3 the determinant of a level-one representation is the ramified character ω̄.

Depends on: R25.1/prime-to-p-character-inertia.

Library: `NumberField.not_dvd_discr_iff_isUnramifiedIn`, `NumberField.abs_discr_gt_two`, `Matrix.SpecialLinearGroup`.

Source: MoonTaguchi07-arXiv, §3, p. 5.

### The tame case: no absolutely irreducible ρ̄ tamely ramified at p ∈ {2, 3}

Declaration: TauCeti.SmallRamification.not_isAbsolutelyIrreducible_of_tame (lemma). Node: SmallRamificationAndAbelianVarietyBaseCases:R25.2/tame-level-one-excluded.

Let p ∈ {2, 3}, F finite of characteristic p, and ρ̄ : G_ℚ → GL_2(F) continuous, unramified outside p, with ρ̄ trivial on the wild inertia subgroup at p. Then ρ̄ is not absolutely irreducible.

Hypotheses: p ∈ {2, 3}; the image of the wild inertia at p is trivial.

Proof or construction:

1. Let K be the kernel field, n = [K:ℚ] = |ρ̄(G_ℚ)|. K is unramified outside p and tamely ramified at p, so δ(K_𝔭) = 1 − 1/e < 1 (R25.1/local-root-discriminant-exponent, tame form) and rd_K = p^{δ} < p (R25.1/root-discriminant-of-galois-field).
2. By R25.1/minkowski-root-discriminant-thresholds: for p = 2, rd_K < 2 forces n ≤ 2; for p = 3, rd_K < 3 forces n ≤ 5.
3. Every group of order at most 5 is abelian. A finite abelian subgroup of GL_2(F̄) of commuting matrices has a common eigenvector over the algebraically closed F̄, so ρ̄ ⊗ F̄ has a stable line: ρ̄ is not absolutely irreducible.

Acceptance:

- The irreducible ρ̄ with image of order prime to p (for instance dihedral images at p = 3) are all tame at p and are excluded here, without class field theory.

Depends on: R25.1/local-root-discriminant-exponent, R25.1/root-discriminant-of-galois-field, R25.1/minkowski-root-discriminant-thresholds, R25.2/level-one-residual-representation.

Source: GhitzaYamauchi25-arXiv, §3, Proposition 3.2 and proof, p. 7.

### Irreducible finite subgroups of SL_2(F̄_2)

Declaration: TauCeti.SmallRamification.dihedral_or_SL2_of_irreducible_char_two (lemma). Node: SmallRamificationAndAbelianVarietyBaseCases:R25.2/irreducible-subgroups-characteristic-two.

Let G ⊆ SL_2(F̄_2) be a finite subgroup acting irreducibly on F̄_2². Then either G is dihedral of order 2r with r odd, r ≥ 3, and every subgroup Q ⊆ G of order 2 is its own normaliser in G; or G is conjugate to SL_2(𝔽_q) for some q = 2^j ≥ 4, and |G| = q(q² − 1) ≥ 60.

Hypotheses: G finite, irreducible on F̄_2².

Proof or construction:

1. In characteristic 2, SL_2(F̄_2) ≅ PSL_2(F̄_2) ≅ PGL_2(F̄_2). Dickson's classification (ArithmeticGaloisRepresentations R01.4, requested) lists its finite subgroups: subgroups of a Borel, cyclic groups, dihedral groups D_{2r} with r odd, and conjugates of SL_2(𝔽_q); A_4 and S_4 do not occur irreducibly (A_4 has a normal Klein four-group, a 2-group, so lies in a Borel; S_4 has a non-abelian Sylow 2-subgroup, while those of SL_2(F̄_2) are elementary abelian), and A_5 ≅ SL_2(𝔽_4).
2. Irreducibility excludes Borel and cyclic subgroups (a cyclic group has an eigenvector). D_6 ≅ S_3 ≅ SL_2(𝔽_2) is dihedral with r = 3.
3. In D_{2r} with r odd a reflection commutes only with itself and 1, so a subgroup of order 2 is self-normalising.

Acceptance:

- SL_2(𝔽_2) ≅ S_3 appears as the dihedral case r = 3, and SL_2(𝔽_4) ≅ A_5 of order 60 is the smallest non-dihedral case.

Depends on: ArithmeticGaloisRepresentations:R01.4.

Library: `Matrix.SpecialLinearGroup`, `Subgroup.normalizer`.

Source: Jones10-preprint, §2.2, pp. 8–9; MoonTaguchi07-arXiv, §3, p. 5.

### Irreducible finite subgroups of GL_2(F̄_3) of order divisible by 3

Declaration: TauCeti.SmallRamification.twentyFour_dvd_card_of_irreducible_char_three (lemma). Node: SmallRamificationAndAbelianVarietyBaseCases:R25.2/irreducible-subgroups-characteristic-three.

Let G ⊆ GL_2(F̄_3) be a finite subgroup acting irreducibly on F̄_3² with 3 ∣ |G|. Then −1 ∈ G, 24 ∣ |G|, and either the 3-part of |G| is 3 or |G| ≥ 720.

Hypotheses: G finite, irreducible, 3 ∣ |G|.

Proof or construction:

1. Let Z = G ∩ F̄_3^× (scalars, of order prime to 3) and H = G/Z ⊆ PGL_2(F̄_3). By Dickson (ArithmeticGaloisRepresentations R01.4, requested) H is cyclic, dihedral, A_4 ≅ PSL_2(𝔽_3), S_4 ≅ PGL_2(𝔽_3), A_5, PSL_2(𝔽_q) or PGL_2(𝔽_q) with q = 3^j, or lies in a Borel.
2. Irreducibility excludes the Borel and cyclic cases. For dihedral H = D_{2r}: if 3 ∣ r the normal cyclic subgroup contains a unipotent element and H lies in a Borel; if 3 ∤ r then 3 ∤ |H| = |G|/|Z|, contradicting 3 ∣ |G|.
3. Each remaining H contains a Klein four-group V. Lift two distinct commuting involutions of V to g_1, g_2 ∈ G. If they commuted, being semisimple of order prime to 3, they would be simultaneously diagonal, and the only nonscalar diagonal involution up to scalars is diag(1, −1), so their images in H would coincide. Hence g_1g_2g_1^{−1}g_2^{−1} is a nontrivial scalar of determinant 1, that is −1 ∈ Z.
4. So |Z| is even, and |G| = |H|·|Z| with 12 ∣ |H|, hence 24 ∣ |G|. The 3-part of |H| is 3 for A_4, S_4, A_5 and for q = 3; for q ≥ 9, |H| ≥ |PSL_2(𝔽_9)| = 360 and |G| ≥ 720.

Acceptance:

- SL_2(𝔽_3) (order 24, projective image A_4) and GL_2(𝔽_3) (order 48) are the smallest cases.
- The dihedral and small-order irreducible groups have order prime to 3 and are handled by R25.2/tame-level-one-excluded.

Depends on: ArithmeticGaloisRepresentations:R01.4.

Library: `Matrix.GeneralLinearGroup`.

Source: DP23-arXiv, §1.1, proof of Theorem 1.3, p. 3; GhitzaYamauchi25-arXiv, §3, proof of Proposition 3.3, p. 7.

### Tate's theorem: no absolutely irreducible mod-2 representation unramified outside 2

Declaration: TauCeti.SmallRamification.tate_no_levelOne_char_two (theorem). Node: SmallRamificationAndAbelianVarietyBaseCases:R25.2/tate-theorem. Planet: Tate's theorem.

Let F be a finite field of characteristic 2. There is no continuous, absolutely irreducible ρ̄ : G_ℚ → GL_2(F) unramified outside 2. (Oddness is automatic in characteristic 2 and is not assumed.)

Hypotheses: F finite of characteristic 2.

Proof or construction:

1. Suppose ρ̄ exists; let K be its kernel field, G = ρ̄(G_ℚ) ≅ Gal(K/ℚ), n = |G|. By R25.2/determinant-level-one-mod-two, G ⊆ SL_2(F).
2. If ρ̄ is trivial on wild inertia at 2, R25.2/tame-level-one-excluded gives a contradiction. Otherwise let E = K_𝔭 for 𝔭 ∣ 2, D = Gal(E/ℚ_2) ≅ the decomposition group, P ≠ 1 its wild inertia. R25.1/two-adic-different-bound gives δ(E) ≤ 2, and δ(E) ≤ 3/2 if |P| ≤ 2; by R25.1/root-discriminant-of-galois-field, rd_K = 2^{δ(E)}.
3. By R25.2/irreducible-subgroups-characteristic-two, G is dihedral of order 2r ≥ 6 or conjugate to SL_2(𝔽_q) with q ≥ 4.
4. Dihedral case: the 2-subgroups of a dihedral group of order 2r with r odd have order at most 2, so |P| = 2 (indeed D ⊆ N_G(P) = P) and rd_K ≤ 2^{3/2} < 3. But n = 2r ≥ 6, so rd_K > 3 by R25.1/minkowski-root-discriminant-thresholds.
5. SL_2(𝔽_q) case: n ≥ 60 ≥ 12, so rd_K > 4 ≥ 2^{δ(E)} = rd_K by the same lemma. Both cases are contradictory.

Acceptance:

- The proof uses only Minkowski's bound, not the analytic Odlyzko bound, because R25.1/two-adic-different-bound sharpens Tate's 5/2 − 2/|P| to 2.
- The mod-2 representation of the conductor-11 curve (R25.2/level-one-residual-representation, second non-example) is ramified at 11 and is not a counterexample.

Depends on: R25.2/determinant-level-one-mod-two, R25.2/tame-level-one-excluded, R25.2/irreducible-subgroups-characteristic-two, R25.1/two-adic-different-bound, R25.1/root-discriminant-of-galois-field, R25.1/minkowski-root-discriminant-thresholds, R25.2/level-one-residual-representation.

Source: DP23-arXiv, §1.1, proof of Theorem 1.1, p. 3; Khare05-arXiv, §1.1, p. 2; MoonTaguchi07-arXiv, §3, pp. 5–7.

### Serre's theorem: no odd absolutely irreducible mod-3 representation unramified outside 3

Declaration: TauCeti.SmallRamification.serre_no_levelOne_char_three (theorem). Node: SmallRamificationAndAbelianVarietyBaseCases:R25.2/serre-mod-three-theorem. Planet: Serre's mod-3 theorem.

Let F be a finite field of characteristic 3. There is no continuous, odd, absolutely irreducible ρ̄ : G_ℚ → GL_2(F) unramified outside 3.

Hypotheses: F finite of characteristic 3; ρ̄ odd (det ρ̄(c) = −1).

Proof or construction:

1. Suppose ρ̄ exists; K, G, n as before. Oddness makes K totally complex (R25.2/level-one-residual-representation API).
2. If ρ̄ is trivial on wild inertia at 3, R25.2/tame-level-one-excluded gives a contradiction. Otherwise 3 ∣ n and, by R25.2/irreducible-subgroups-characteristic-three, 24 ∣ n and either v_3(n) = 1 or n ≥ 720.
3. Let E = K_𝔭 (𝔭 ∣ 3) with wild inertia P ≠ 1, |P| ≤ 3^{v_3(n)}. R25.1/three-adic-different-bound gives δ(E) ≤ 13/6 − 1/|P|, and rd_K = 3^{δ(E)} (R25.1/root-discriminant-of-galois-field).
4. If v_3(n) = 1 then |P| = 3, rd_K ≤ 3^{11/6} < 7.5, while n ≥ 24 gives rd_K > 10 (R25.1/totally-complex-root-discriminant-thresholds).
5. If n ≥ 720 then rd_K < 3^{13/6} < 10.81, while n ≥ 36 gives rd_K > 12. Both cases are contradictory.

Acceptance:

- The analytic input is needed: 3^{11/6} ≈ 7.49 exceeds Minkowski's asymptotic value πe²/4 ≈ 5.80 for totally complex fields.
- The reducible 1 ⊕ ω̄ is odd and unramified outside 3; irreducibility is essential.

Depends on: R25.2/level-one-residual-representation, R25.2/tame-level-one-excluded, R25.2/irreducible-subgroups-characteristic-three, R25.1/three-adic-different-bound, R25.1/root-discriminant-of-galois-field, R25.1/totally-complex-root-discriminant-thresholds.

Source: DP23-arXiv, §1.1, proof of Theorem 1.1, p. 3; Khare05-arXiv, §1.1, p. 2.

### The Tate–Serre base case of Serre's conjecture

Declaration: TauCeti.SmallRamification.not_isLevelOneResidual_of_le_three (theorem). Node: SmallRamificationAndAbelianVarietyBaseCases:R25.2/tate-serre-base-case. Planet: Tate–Serre base case.

For p ∈ {2, 3} and every finite field F of characteristic p there is no continuous ρ̄ : G_ℚ → GL_2(F) with IsLevelOneResidual p ρ̄. Equivalently, there is no continuous, odd, absolutely irreducible ρ̄ : G_ℚ → GL_2(F̄_p) unramified outside p, where F̄_p carries the discrete topology.

Hypotheses: p ∈ {2, 3}.

Proof or construction:

1. p = 2: R25.2/tate-theorem (oddness unused). p = 3: R25.2/serre-mod-three-theorem.
2. Coefficient field: a continuous ρ̄ into GL_2(F̄_p) has finite image, so it takes values in GL_2(F) for the finite subfield F generated by its matrix entries (ArithmeticGaloisRepresentations R01.1, requested), and absolute irreducibility, oddness and unramifiedness do not depend on the choice of F (R25.2/level-one-residual-representation API).

Acceptance:

- The statement is DP23 Theorem 1.1 and the p = 2, 3 input of Khare's level-one theorem.
- The analogue fails for p = 11: the reduction of the representation attached to Δ is absolutely irreducible, odd and unramified outside 11. The method gives nothing unconditional beyond p = 3.

Depends on: R25.2/tate-theorem, R25.2/serre-mod-three-theorem, R25.2/level-one-residual-representation, ArithmeticGaloisRepresentations:R01.1.

Source: DP23-arXiv, §1.1, Theorem 1.1, p. 3; Khare05-arXiv, §8, pp. 29–30.

## The layers not read in this checkpoint

- R25.3: Read FONTAINE85 (Invent. Math. 81 (1985), 515–538) and plan: the ramification bound for ℚ(A[p]) via R07.6, the resulting degree bounds, and the step from the torsion restrictions to a contradiction in every dimension.
- R25.4: Read SCHOOF05 (Compositio Math. 141 (2005)) Theorem 1.1 and plan: the classification of the relevant finite flat group schemes over ℤ[1/ℓ] and their extensions for ℓ ∈ {2, 3, 5, 7, 13}, and the global argument from torsion to the abelian variety; the negative tests at ℓ = 11 and for non-semistable reduction.
- R25.5: Read DP23 Paso 6 and Theorems 1.7–1.9 and Khare's weight-reduction terminal cases, and plan the geometric realisation of the weight-two compatible systems and the local crystalline-to-ordinary checks at the terminal weights (importing R21.5, R21.6, R24.6).
- R25.6: Assemble the base-case table for R26 and R33: each row with characteristic, weight, ramification, image, coefficient field and supplier. The rows p = 2, 3 of level one are R25.2/tate-serre-base-case.

## Requests to other roadmaps

- ArithmeticGaloisRepresentations:R01.4: Finite linear groups in characteristic p ∈ {2, 3}: (1) Dickson's classification of the finite subgroups of PGL_2(F̄_p) (cyclic, dihedral, A_4, S_4, A_5, PSL_2(𝔽_q), PGL_2(𝔽_q), subgroups of a Borel), and of SL_2(F̄_2) ≅ PGL_2(F̄_2); (2) a nontrivial p-subgroup of GL_2(F̄_p) fixes a unique line, its normaliser lies in the stabilising Borel, and its elements are unipotent; (3) a finite abelian subgroup of GL_2(F̄) has a common eigenvector. RS-06 assigns the generic finite GL_2/PGL_2 image classification to R01.4. Needed by: R25.1/two-adic-different-bound, R25.1/three-adic-different-bound, R25.2/irreducible-subgroups-characteristic-two, R25.2/irreducible-subgroups-characteristic-three, R25.2/tame-level-one-excluded.
- ArithmeticGaloisRepresentations:R01.1: Coefficient-field descent for residual representations: a continuous ρ̄ : G_ℚ → GL_2(F̄_p) (discrete topology) has finite image and takes values in GL_2(F) for a finite subfield F; absolute irreducibility is defined over F̄ and invariant under extension of scalars along F ⊆ F′. RS-06 assigns the finite coefficient-field carrier to R01.1. Needed by: R25.2/level-one-residual-representation, R25.2/tate-serre-base-case.
- ArithmeticGaloisRepresentations:R01.2: The local carriers of a continuous ρ̄ : G_ℚ → GL_2(F): decomposition and inertia subgroups at a prime ℓ, the predicate 'unramified at ℓ' (ρ̄(I_ℓ) = 1), wild inertia at p, oddness det ρ̄(c) = −1 for complex conjugation, and the identification of ρ̄ restricted to a decomposition group at p with an injective homomorphism Gal(K_𝔭/ℚ_p) → GL_2(F) for the kernel field K, carrying inertia and wild inertia to their images. Needed by: R25.2/level-one-residual-representation, R25.2/tame-level-one-excluded, R25.2/tate-theorem, R25.2/serre-mod-three-theorem.
- tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration: For a finite extension E/ℚ_p: the different exponent d(E/ℚ_p), the ramification index, discriminantExponent = f·d, the exact tame exponent d = e − 1, and for E/ℚ_p Galois the upper ramification filtration with Herbrand functions (the identity for unramified extensions and x ↦ x/2 on [0, ∞) for a tame quadratic one), and the discriminant exponent in upper numbering, c = Σ_{i ≥ −1} ([G : G^{i+}] − [G : G^i])(i + 1) (Jones (1)). Upstream Layer 3 plans the different, the Hilbert valuation formula and the upper numbering; the displayed formula is the form consumed here. Needed by: R25.1/local-root-discriminant-exponent, R25.1/two-adic-different-bound, R25.1/three-adic-different-bound.
- tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group: The tame quotient: I/P is procyclic and a Frobenius lift σ acts on it by τ ↦ τ^q (upstream Layer 4, 'σ τ σ⁻¹ = τ^q'), in the finite form for Gal(E/ℚ_p). Needed by: R25.1/prime-to-p-character-inertia.
- tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group: The unit filtration U(K, i) of a nonarchimedean local field, on which R25.1/unit-filtration-power-maps proves the p-th power inclusions of Fesenko–Vostokov I.(5.7)–(5.8) in the three small cases used here. Needed by: R25.1/unit-filtration-power-maps.
- tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors: Local class field theory for a finite abelian extension L/K of p-adic fields: the reciprocity map K^× → Gal(L/K), onto from units when L/K is totally ramified, carrying U^{(n)} onto the upper ramification group Gal(L/K)^{(n)} (Fesenko–Vostokov IV.(3.5)), and equivariant for automorphisms: rec(σ(u)) = σ̃ rec(u) σ̃^{−1} when L/K′ is Galois with K/K′ Galois and σ̃ lifts σ ∈ Gal(K/K′). Over ℚ_2 this gives: the inertia group of a finite abelian extension of exponent 2 is a quotient of ℤ_2^×/(ℤ_2^×)². Needed by: R25.1/two-adic-different-bound, R25.1/three-adic-different-bound.
- tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-6-global-ramification-consequences: For a finite Galois number field K and a prime 𝔓 of 𝓞_K above p: the exponent of 𝔓 in the different ideal equals the local different exponent d(K_𝔓/ℚ_p), and (with Layer 5) Gal(K_𝔓/ℚ_p) is identified with the decomposition group of 𝔓, compatibly with inertia and ramification groups. Needed by: R25.1/root-discriminant-of-galois-field.
- AnalyticNumberTheory:AN.3: The explicit formula for the discriminant (Odlyzko 1990, (2.3)): for a number field K and an even differentiable F : ℝ → ℝ with F(0) = 1 and |F(x)|, |F′(x)| ≤ c e^{−(1/2+ε)|x|}, log |d_K| = r₁π/2 + n(γ + log 8π) − n∫_0^∞ (1 − F)/(2 sinh(x/2)) − r₁∫_0^∞ (1 − F)/(2 cosh(x/2)) − 4∫_0^∞ F(x) cosh(x/2) dx + Σ′_ρ Φ(ρ) + 2Σ_𝔓 Σ_{m≥1} (log N𝔓/N𝔓^{m/2}) F(m log N𝔓), with Φ(s) = ∫ F(x) e^{(s−1/2)x} dx and ρ over the nontrivial zeros of ζ_K. It rests on the completed Dedekind zeta function of AnalyticNumberTheory AN.4 (continuation, functional equation, Hadamard product). AN.3 plans the explicit formulas. Needed by: R25.1/poitou-odlyzko-inequality.

## Gaps

None in the two layers planned here. The comparison with the unread primary sources is recorded in the handoff note.

## Coverage

- R25.1: partial. Remaining: The torsion-field bounds of FONTAINE85 and SCHOOF05: the root discriminant of ℚ(A[p]) for an abelian scheme over ℤ, and for a semistable abelian variety with good reduction outside one prime ℓ, from FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6's bound δ < 1 + 1/(p − 1) for finite flat group schemes, at the primes p those sources use, with the global comparison rows they need (Minkowski or R25.1/poitou-odlyzko-inequality). Any finite exceptional list of number fields used by FONTAINE85 or SCHOOF05, with its completeness proof and validation. R25.2 as planned here uses no list.
- R25.2: closed.
- R25.3: not_read. Remaining: Read FONTAINE85 (Invent. Math. 81 (1985), 515–538) and plan: the ramification bound for ℚ(A[p]) via R07.6, the resulting degree bounds, and the step from the torsion restrictions to a contradiction in every dimension.
- R25.4: not_read. Remaining: Read SCHOOF05 (Compositio Math. 141 (2005)) Theorem 1.1 and plan: the classification of the relevant finite flat group schemes over ℤ[1/ℓ] and their extensions for ℓ ∈ {2, 3, 5, 7, 13}, and the global argument from torsion to the abelian variety; the negative tests at ℓ = 11 and for non-semistable reduction.
- R25.5: not_read. Remaining: Read DP23 Paso 6 and Theorems 1.7–1.9 and Khare's weight-reduction terminal cases, and plan the geometric realisation of the weight-two compatible systems and the local crystalline-to-ordinary checks at the terminal weights (importing R21.5, R21.6, R24.6).
- R25.6: not_read. Remaining: Assemble the base-case table for R26 and R33: each row with characteristic, weight, ramification, image, coefficient field and supplier. The rows p = 2, 3 of level one are R25.2/tate-serre-base-case.

## Sources

- DP23-arXiv: Luis Dieulefait and Ariel Pacetti, *A simplified proof of Serre's conjecture*. arXiv:2108.07577v2 (3 May 2022); published in RACSAM 117 (2023), article 153; accessed 2026-09-28. https://arxiv.org/abs/2108.07577. Read: §1.1, Theorems 1.1 and 1.2 with their proofs (p. 3). §2, Paso 6 (p. 14 of the arXiv text): the use of Theorem 1.1 at p = 3.
- Khare05-arXiv: Chandrashekhar Khare, *On Serre's modularity conjecture for 2-dimensional mod p representations of Gal(Q̄/Q) unramified outside p*. arXiv:math/0504080v1 (5 April 2005); published as 'Serre's modularity conjecture: the level one case', Duke Math. J. 134 (2006), 557–589; accessed 2026-09-28. https://arxiv.org/abs/math/0504080. Read: §1 and §1.1 (p. 2): the definition of level one and the history of the cases p = 2, 3. §§7.2 and 8 (pp. 29–30): the remarks on discriminant bounds and on the limits of Tate's method.
- MoonTaguchi07-arXiv: Hyunsuk Moon and Yuichiro Taguchi, *The non-existence of certain mod 2 Galois representations of some small quadratic fields*. arXiv:0710.1319v1 (5 October 2007); accessed 2026-09-28. https://arxiv.org/abs/0710.1319. Read: §2 (pp. 2–5): the Borel normal form (2.1) and Lemmas 1–3 with their proofs. §3 (pp. 5–7): the solvable and non-solvable cases of their theorem.
- Jones10-preprint: John W. Jones, *Wild ramification bounds and simple group Galois extensions ramified only at 2*. Author preprint (PDF dated 2 April 2010), hosted at hobbes.la.asu.edu; the published version was not consulted; accessed 2026-09-28. https://hobbes.la.asu.edu/papers/simple2.pdf. Read: §1.1, equations (1)–(3) (pp. 2–3): the discriminant exponent in terms of the upper ramification filtration. §2.2 (pp. 8–9): the comparison with Moon's and Tate's bounds.
- GhitzaYamauchi25-arXiv: Alexandru Ghitza and Takuya Yamauchi, *The non-existence of some Galois representations of moderate dimension in small characteristic*. arXiv:2509.00635v2 (31 October 2025); accessed 2026-09-28. https://arxiv.org/abs/2509.00635. Read: §2.2–2.3 (pp. 4–6): Corollary 2.5, Lemma 2.6 and Proposition 2.7 (Moon's discriminant bound). §3, Propositions 3.2 and 3.3 with proofs (p. 7).
- Odlyzko90-JTNB: Andrew M. Odlyzko, *Bounds for discriminants and related estimates for class numbers, regulators and zeros of zeta functions: a survey of recent results*. Journal de Théorie des Nombres de Bordeaux 2 (1990), 119–141, Numdam copy; accessed 2026-09-28. https://www.numdam.org/item/JTNB_1990__2_1_119_0/. Read: §1 (pp. 119–121): Stark's identity and the bound (1.5). §2, (2.1)–(2.5) (pp. 121–122): the explicit formula for log D, the positivity requirement and the asymptotic unconditional bound.
- FesenkoVostokov-LF: Ivan B. Fesenko and Sergei V. Vostokov, *Local Fields and Their Extensions (second edition)*. Author-hosted PDF of the second edition (American Mathematical Society, 2002), 355 pages; accessed 2026-09-28. https://ivanfesenko.org/wp-content/uploads/2021/10/vol.pdf. Read: Ch. I, (5.7)–(5.8) (pp. 14–16): the p-th power map on the unit filtration. Ch. IV, (3.5) Theorem and proof (pp. 135–136): the reciprocity map carries U_n to the n-th upper ramification group.
