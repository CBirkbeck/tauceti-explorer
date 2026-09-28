# Birch–Tate and arithmetic special-value formulas

This is the first blueprint checkpoint. It covers B.1 (the formula and its inputs), B.2 (sign and equivalent formulations), B.3 (ℚ and the real quadratic example ℚ(√5)) and B.7 (S-integers and Euler factors). Every declaration is a plan. B.1 is closed; B.2, B.3 and B.7 are partial; B.4–B.6 and B.8 are not read in this checkpoint.

## Scope, ownership and conventions

The formula is ζ_F(−1) = (−1)^{[F:ℚ]} · #K₂(𝓞_F)/w₂(F) for a totally real number field F (Weibel, *K-book* VI.8.6; Kolster, Park City notes, Conjecture 3.5, which leaves the sign as ±). Its three ingredients are owned elsewhere and imported, never re-planned:

- the continued Dedekind zeta function ζ_F and its completed functional equation: AutomorphicLFunctionsAndLocalFactors AL.1 (requested; BorelRegulators R.5 imports the same objects). Mathlib's `NumberField.dedekindZeta` is only the L-series, and is 0 by convention off Re s > 1, so it cannot be evaluated at −1;
- K₂(𝓞_F), its finiteness and the tame-kernel sequences: K2SymbolsBrauer T.1/k2-definition and T.5, ArithmeticKTheory N.3/finiteness-and-ranks-combined;
- w₂(F) = #H⁰(F, ℚ/ℤ(2)), with its finiteness, w₂(ℚ) = 24 and the cyclotomic criterion: ArithmeticKTheory N.4. It is the twisted invariant, never `NumberField.Units.torsionOrder F` = w₁(F).

Conventions pinned here:

- The sign is (−1)^{[F:ℚ]}, which equals the K-book's (−1)^{r_1} for totally real F. After removing a finite set S of primes the sign is (−1)^{[F:ℚ]+|S|}.
- Γ_ℝ(s) = π^{−s/2}Γ(s/2) and Γ_ℂ(s) = 2(2π)^{−s}Γ(s) are Mathlib's `Complex.Gammaℝ` and `Complex.Gammaℂ`, and Λ_F(s) = |d_F|^{s/2} Γ_ℝ(s)^{r_1} Γ_ℂ(s)^{r_2} ζ_F(s). A value of ζ_F at a pole of a gamma factor is read from ζ_F = |d_F|^{−s/2} (Γ_ℝ⁻¹)^{r_1} (Γ_ℂ⁻¹)^{r_2} Λ_F with the entire reciprocal gamma factors (B.2/zeta-via-reciprocal-gamma), never by dividing by a gamma value that Lean totalises to 0.
- For a field with a complex place ζ_F has a zero of order r_2 at −1. The K-book's VI.8.6 and the note after VI.8.7 print 'pole'; this is already recorded as ArithmeticKTheory/E18 and is not adopted. The formula is false for such fields (B.2/formula-fails-with-complex-place).
- The S-modified zeta function removes the Euler factors: ζ_{F,S}(s) = ζ_F(s) ∏_{v∈S}(1 − Nv^{−s}).

In the suggested Lean file the imported objects are placeholders named after their owners' planned declarations (`dedekindZetaCont`, `K2`, `wInvariant`), so that the statements below already have their final signatures.

## The statement and its inputs (B.1)

### The Birch–Tate formula for a number field

Declaration: TauCeti.BirchTate.BirchTateFormula (definition). Node: SpecialValuesBirchTate:B.1/birch-tate-formula. Planet: Birch–Tate formula.

Let F be a number field, ζ_F : ℂ → ℂ its Dedekind zeta function continued to ℂ ∖ {1} (AutomorphicLFunctionsAndLocalFactors AL.1; on Re s > 1 it is Mathlib's NumberField.dedekindZeta F), K₂(𝓞_F) the classical K₂ of its ring of integers (K2SymbolsBrauer T.1/k2-definition), a finite group by ArithmeticKTheory N.3/finiteness-and-ranks-combined, and w₂(F) = #H⁰(F, ℚ/ℤ(2)) the order of the twisted roots of unity (ArithmeticKTheory N.4/the-w-invariant), a positive integer by N.4/finiteness-of-the-w-invariant. BirchTateFormula(F) is the proposition ζ_F(−1) = (−1)^{[F:ℚ]} · #K₂(𝓞_F) / w₂(F) in ℂ, with [F:ℚ] = Module.finrank ℚ F and #K₂(𝓞_F) = Nat.card K₂(𝓞_F). The Birch–Tate conjecture is the statement that BirchTateFormula(F) holds for every totally real F (NumberField.IsTotallyReal F); for totally real F, (−1)^{[F:ℚ]} = (−1)^{r_1}. The proposition is defined for every number field so that its failure with a complex place can be stated (B.2/formula-fails-with-complex-place); the conjecture is never asserted there. In the suggested Lean file the three imported objects appear as placeholders named after their owners' planned declarations (dedekindZetaCont F, K2 R, wInvariant i F), so that BirchTateFormula F has its final signature.

Hypotheses: F is a number field; ζ_F, K₂(𝓞_F) and w₂(F) are the imported objects named in the statement. w₂(F) is the twisted invariant #H⁰(F, ℚ/ℤ(2)), never NumberField.Units.torsionOrder F = w₁(F).

Proof or construction:

1. The definition is the displayed equation; it needs no proof. What makes it well-posed: #K₂(𝓞_F) is finite (N.3/finiteness-and-ranks-combined, n = 2 even), so Nat.card is the order rather than the junk value 0 of an infinite type, and w₂(F) ≥ 1 (N.4/finiteness-of-the-w-invariant), so the division is by a nonzero number.
2. birchTateFormula_iff_mul: since w₂(F) ≠ 0, the formula is equivalent to w₂(F) · ζ_F(−1) = (−1)^{[F:ℚ]} · #K₂(𝓞_F), which is the form the proofs of B.2, B.3 and B.7 use.
3. zeta_ne_zero: if the formula holds then ζ_F(−1) ≠ 0, because #K₂(𝓞_F) ≥ 1 (a group is nonempty and finite).

The required uses are:

- SpecialValuesBirchTate:B.2/birch-tate-iff-valuations: Split into its sign and its prime valuations.
- SpecialValuesBirchTate:B.3/birch-tate-for-the-rationals: Proved for ℚ from independent inputs.
- SpecialValuesBirchTate:B.7/birch-tate-for-s-integers: Shown equivalent to the S-modified formula.
- SpecialValuesBirchTate:B.4: The odd-primary theorem proves its ℓ-adic valuation for every odd ℓ.
- SpecialValuesBirchTate:B.5: The abelian theorem proves it for totally real abelian F/ℚ.
- ArithmeticKTheory:N.8/real-quadratic-example-and-birch-tate: The certified examples compare their K₂ orders with it.

The API supplies:

- TauCeti.BirchTate.BirchTateFormula (constructor): BirchTateFormula F : Prop := dedekindZetaCont F (−1) = (−1)^(finrank ℚ F) * Nat.card (K2 (𝓞 F)) / wInvariant 2 F.
- TauCeti.BirchTate.birchTateFormula_iff_mul (characterisation): BirchTateFormula F ↔ w₂(F) * ζ_F(−1) = (−1)^(finrank ℚ F) * Nat.card (K2 (𝓞 F)), using w₂(F) ≥ 1.
- TauCeti.BirchTate.BirchTateFormula.zeta_ne_zero (other): BirchTateFormula F → ζ_F(−1) ≠ 0, since K₂(𝓞_F) is finite and nonempty and w₂(F) ≥ 1.
- TauCeti.BirchTate.BirchTateFormula.w2_mul_zeta_eq_intCast (other): BirchTateFormula F → w₂(F) * ζ_F(−1) = ((−1)^(finrank ℚ F) * Nat.card (K2 (𝓞 F)) : ℤ), an integer (B.2/denominator-consequence).

Discriminating tests:

- TauCeti.BirchTate.birchTateFormula_rat_of_values (value): If ζ_ℚ(−1) = −1/12, Nat.card (K2 (𝓞 ℚ)) = 2 and wInvariant 2 ℚ = 24, then BirchTateFormula ℚ.
- TauCeti.BirchTate.not_birchTateFormula_rat_twist_one (non-example): With ζ_ℚ(−1) = −1/12, #K₂(𝓞_ℚ) = 2 and wInvariant 1 ℚ = 2, the formula with w₁(ℚ) in place of w₂(ℚ) is false: −1 ≠ −1/12.
- TauCeti.BirchTate.not_birchTateFormula_rat_unsigned (non-example): With the same values and w₂(ℚ) = 24, ζ_ℚ(−1) = +2/24 is false: dropping the sign (−1)^{[F:ℚ]} breaks the formula for ℚ.
- TauCeti.BirchTate.not_birchTateFormula_rat_field (degenerate): K₂ of the field ℚ is infinite (ArithmeticKTheory N.8/the-rationals-infinite-against-finite), so Nat.card (K2 ℚ) = 0 and the formula with K2 ℚ in place of K2 (𝓞 ℚ) would force ζ_ℚ(−1) = 0, which is false: the ring of integers, not the field, is required.
- TauCeti.BirchTate.not_birchTateFormula_of_zeta_eq_zero (non-example): If ζ_F(−1) = 0 the formula fails; this is the case of ℚ(i), where ζ_{ℚ(i)}(−1) = 0 and K₂(ℤ[i]) = 0 (ArithmeticKTheory N.8/gaussian-and-imaginary-quadratic).

Acceptance:

- For F = ℚ the formula reads −1/12 = (−1)·2/24 and holds (B.3/birch-tate-for-the-rationals).
- Replacing w₂ by w₁ = #μ(F), or the ring of integers by the field, or dropping the sign, makes the formula false for ℚ (the unit tests).

Depends on: AutomorphicLFunctionsAndLocalFactors:AL.1, K2SymbolsBrauer:T.1/k2-definition, ArithmeticKTheory:N.3/finiteness-and-ranks-combined, ArithmeticKTheory:N.4/the-w-invariant, ArithmeticKTheory:N.4/finiteness-of-the-w-invariant.

Library: `NumberField.dedekindZeta`, `NumberField.IsTotallyReal`, `Module.finrank`, `NumberField.RingOfIntegers`.

Source: Kbook.2013, VI.8.6, Birch–Tate Conjecture 8.6, PDF p. 523 (book p. 515); kolster-park-city-2009, Lecture 2, §3, Birch-Tate Conjecture 3.5, p. 15; kolster-park-city-2009, Lecture 2, §3, before Corollary 3.4, p. 15.

## Rationality, sign and equivalent formulations (B.2)

### The real gamma factor at −1 and at 2

Declaration: TauCeti.BirchTate.gammaℝ_neg_one (lemma). Node: SpecialValuesBirchTate:B.2/gamma-factor-values.

Mathlib's real archimedean factor Γ_ℝ(s) = π^{−s/2} Γ(s/2) (Complex.Gammaℝ) satisfies Γ_ℝ(−1) = −2π and Γ_ℝ(2) = 1/π. In particular −1 is not a pole of Γ_ℝ: its poles are 0, −2, −4, … (Complex.Gammaℝ_eq_zero_iff describes the totalised zeros of Mathlib's version at exactly these points).

Hypotheses: None.

Proof or construction:

1. Γ_ℝ(−1) = π^{1/2} Γ(−1/2). By Complex.Gamma_add_one at s = −1/2 (s ≠ 0), Γ(1/2) = (−1/2) Γ(−1/2), so Γ(−1/2) = −2 Γ(1/2) = −2 π^{1/2} (Complex.Gamma_one_half_eq). Hence Γ_ℝ(−1) = π^{1/2} · (−2π^{1/2}) = −2π.
2. Γ_ℝ(2) = π^{−1} Γ(1) = 1/π (Complex.Gamma_one).

Acceptance:

- Γ_ℝ(−1) is a negative real number; a sign slip here reverses the sign theorem for every field of odd degree, and ℚ detects it (ζ(−1) = −1/12 < 0).

Library: `Complex.Gammaℝ`, `Complex.Gamma_add_one`, `Complex.Gamma_one_half_eq`, `Complex.Gammaℝ_eq_zero_iff`, `Complex.Gamma_one`.

Source: Kbook.2013, VI.8.8, proof, PDF p. 524 (book p. 516).

### ζ_F is real and at least one on the real half-line σ > 1

Declaration: TauCeti.BirchTate.one_le_dedekindZeta_ofReal (lemma). Node: SpecialValuesBirchTate:B.2/dedekind-zeta-real-positive.

For every number field F and real σ > 1, NumberField.dedekindZeta F σ is a real number and 1 ≤ ζ_F(σ); in particular ζ_F(2) > 0.

Hypotheses: F a number field; σ ∈ ℝ with σ > 1.

Proof or construction:

1. ζ_F(σ) = Σ_{n ≥ 1} a_n n^{−σ} with a_n = TauCeti.dedekindZetaCoeff F n, the number of ideals of 𝓞_F of absolute norm n (TauCeti.dedekindZeta_eq_LSeries_dedekindZetaCoeff); the series converges absolutely for σ > 1 (TauCeti.LSeriesSummable_dedekindZetaCoeff_iff).
2. Every term a_n n^{−σ} is a nonnegative real, and a_1 = 1 because the only ideal of norm 1 is 𝓞_F itself (Ideal.absNorm_eq_one_iff). A summable series of nonnegative reals is at least any one of its terms, so ζ_F(σ) ≥ a_1 = 1.

Acceptance:

- For F = ℚ and σ = 2 the value is ζ(2) = π²/6 ≈ 1.645 ≥ 1 (riemannZeta_two).

Library: `TauCeti.dedekindZeta_eq_LSeries_dedekindZetaCoeff`, `TauCeti.dedekindZetaCoeff`, `TauCeti.LSeriesSummable_dedekindZetaCoeff_iff`, `Ideal.absNorm_eq_one_iff`, `LSeries`.

Source: Kbook.2013, VI.8.8, proof, PDF p. 524 (book p. 516).

### ζ_F from the completed zeta function through the reciprocal gamma factors

Declaration: TauCeti.BirchTate.dedekindZeta_eq_inv_gamma_mul_completed (lemma). Node: SpecialValuesBirchTate:B.2/zeta-via-reciprocal-gamma.

Let F be a number field with r_1 real and r_2 complex places, d_F its discriminant and Λ_F(s) = |d_F|^{s/2} Γ_ℝ(s)^{r_1} Γ_ℂ(s)^{r_2} ζ_F(s) its completed zeta function (AL.1; Γ_ℝ, Γ_ℂ are Mathlib's Complex.Gammaℝ and Complex.Gammaℂ), holomorphic on ℂ ∖ {0, 1} with Λ_F(1 − s) = Λ_F(s). Then for every s ∈ ℂ ∖ {0, 1}, ζ_F(s) = |d_F|^{−s/2} · (Γ_ℝ(s)⁻¹)^{r_1} · (Γ_ℂ(s)⁻¹)^{r_2} · Λ_F(s), where Γ_ℝ⁻¹ and Γ_ℂ⁻¹ = (2π)^s/(2Γ(s)) are the entire reciprocal gamma factors. The value of ζ_F at a pole of a gamma factor is obtained from this identity of holomorphic functions, never by evaluating Λ_F divided by a gamma factor that Lean totalises to zero.

Hypotheses: F a number field; ζ_F and Λ_F as imported from AL.1.

Proof or construction:

1. On Re s > 1 all gamma factors are nonzero (Complex.Gammaℝ_ne_zero_of_re_pos and Γ(s) ≠ 0), and the identity is the definition of Λ_F rearranged.
2. Both sides are holomorphic on U = ℂ ∖ {0, 1}: the left by AL.1, the right because Γ_ℝ⁻¹ (Complex.differentiable_Gammaℝ_inv) and 1/Γ (Complex.differentiable_one_div_Gamma) are entire and Λ_F is holomorphic on U.
3. U is connected (the complement of a finite set in ℂ), so the identity principle AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq, applied at a point of Re s > 1, extends the equality to all of U.

Acceptance:

- At s = −1 and r_2 ≥ 1 the right side vanishes because 1/Γ(−1) = 0, which is the zero of ζ_F at −1; at s = −1 and r_2 = 0 no gamma factor has a pole and the right side is |d_F|^{1/2} Γ_ℝ(−1)^{−r_1} Λ_F(2).

Depends on: AutomorphicLFunctionsAndLocalFactors:AL.1.

Library: `Complex.Gammaℝ`, `Complex.Gammaℂ`, `Complex.Gammaℝ_ne_zero_of_re_pos`, `Complex.differentiable_Gammaℝ_inv`, `Complex.differentiable_one_div_Gamma`, `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, `NumberField.discr`.

Source: Kbook.2013, VI.8.8, proof, PDF p. 524 (book p. 516); kolster-park-city-2009, Lecture 2, §3, after Conjecture 3.5, p. 15.

### The sign of ζ_F(−1) for a totally real field

Declaration: TauCeti.BirchTate.neg_one_pow_mul_dedekindZeta_neg_one_pos (theorem). Node: SpecialValuesBirchTate:B.2/zeta-minus-one-sign. Planet: Sign of ζ_F(−1).

Let F be a totally real number field of degree n = [F:ℚ] and discriminant d_F. Then ζ_F(−1) = (−1)^n · |d_F|^{3/2} · ζ_F(2) / (2π²)^n. Consequently ζ_F(−1) is a nonzero real number and (−1)^n ζ_F(−1) > 0.

Hypotheses: F totally real (NumberField.IsTotallyReal F), so r_1 = n and r_2 = 0.

Proof or construction:

1. r_2 = 0 (NumberField.IsTotallyReal.nrComplexPlaces_eq_zero) and r_1 = n (NumberField.InfinitePlace.card_add_two_mul_card_eq_rank).
2. B.2/zeta-via-reciprocal-gamma at s = −1: ζ_F(−1) = |d_F|^{1/2} Γ_ℝ(−1)^{−n} Λ_F(−1), and the functional equation gives Λ_F(−1) = Λ_F(2).
3. At s = 2 every factor is regular: Λ_F(2) = |d_F| Γ_ℝ(2)^n ζ_F(2) = |d_F| π^{−n} ζ_F(2) (B.2/gamma-factor-values).
4. With Γ_ℝ(−1) = −2π (B.2/gamma-factor-values): ζ_F(−1) = |d_F|^{1/2} (−2π)^{−n} |d_F| π^{−n} ζ_F(2) = (−1)^n |d_F|^{3/2} ζ_F(2)/(2π²)^n.
5. ζ_F(2) is a real number ≥ 1 (B.2/dedekind-zeta-real-positive), and |d_F| ≥ 1, so (−1)^n ζ_F(−1) is a positive real.

Acceptance:

- For F = ℚ (n = 1, d = 1): ζ(−1) = −ζ(2)/(2π²) = −(π²/6)/(2π²) = −1/12, agreeing with B.3/zeta-of-the-rationals-at-minus-one.
- For F = ℚ(√5) (n = 2, d = 5): the sign is +, agreeing with ζ_{ℚ(√5)}(−1) = 1/30 (B.3/sqrt-five-zeta-at-minus-one).

Depends on: SpecialValuesBirchTate:B.2/zeta-via-reciprocal-gamma, SpecialValuesBirchTate:B.2/gamma-factor-values, SpecialValuesBirchTate:B.2/dedekind-zeta-real-positive, AutomorphicLFunctionsAndLocalFactors:AL.1.

Library: `NumberField.IsTotallyReal.nrComplexPlaces_eq_zero`, `NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`, `NumberField.discr`.

Source: Kbook.2013, VI.8.8, proof, PDF p. 524 (book p. 516); Kbook.2013, VI.8.6, Birch–Tate Conjecture 8.6, PDF p. 523 (book p. 515).

### The formula is false for a field with a complex place

Declaration: TauCeti.BirchTate.not_birchTateFormula_of_nrComplexPlaces_pos (theorem). Node: SpecialValuesBirchTate:B.2/formula-fails-with-complex-place.

Let F be a number field with r_2 ≥ 1 complex places. Then ζ_F(−1) = 0, and BirchTateFormula(F) is false. This is why the conjecture is stated for totally real fields only; the vanishing at −1 has order exactly r_2 (BorelRegulators R.5), which is a zero and not the pole printed in the K-book (ArithmeticKTheory/E18).

Hypotheses: F a number field with NumberField.InfinitePlace.nrComplexPlaces F ≥ 1.

Proof or construction:

1. By B.2/zeta-via-reciprocal-gamma at s = −1, ζ_F(−1) contains the factor (Γ_ℂ(−1)⁻¹)^{r_2} with Γ_ℂ(−1)⁻¹ = (2π)^{−1}/(2Γ(−1)) read through the entire function 1/Γ, which vanishes at −1 (Γ has a pole there). With r_2 ≥ 1 the product is 0.
2. The right side of the formula is ± #K₂(𝓞_F)/w₂(F) with #K₂(𝓞_F) ≥ 1 (a finite group, ArithmeticKTheory N.3/finiteness-and-ranks-combined) and w₂(F) ≥ 1, hence nonzero (B.1/birch-tate-formula, zeta_ne_zero).

Acceptance:

- For F = ℚ(i): ζ_{ℚ(i)}(−1) = 0 while #K₂(ℤ[i])/w₂(ℚ(i)) = 1/24 (ArithmeticKTheory N.8/gaussian-and-imaginary-quadratic).

Depends on: SpecialValuesBirchTate:B.2/zeta-via-reciprocal-gamma, SpecialValuesBirchTate:B.1/birch-tate-formula, ArithmeticKTheory:N.3/finiteness-and-ranks-combined, ArithmeticKTheory:N.4/finiteness-of-the-w-invariant.

Library: `Complex.differentiable_one_div_Gamma`, `Complex.Gamma_neg_nat_eq_zero`.

Source: Kbook.2013, VI.8.6, PDF p. 523 (book p. 515); corrected in ArithmeticKTheory/E18; kolster-park-city-2009, Lecture 2, §3, after Conjecture 3.5, p. 15.

### A positive rational number is determined by its prime valuations

Declaration: TauCeti.BirchTate.rat_eq_iff_forall_padicValRat_eq (lemma). Node: SpecialValuesBirchTate:B.2/positive-rational-from-valuations.

For positive rational numbers q and r: q = r if and only if padicValRat p q = padicValRat p r for every prime p.

Hypotheses: q > 0 and r > 0 in ℚ.

Proof or construction:

1. Write q = a/b and r = c/d in lowest terms with a, b, c, d positive naturals (Rat.num_div_den; positivity makes the numerators positive). Then padicValRat p q = v_p(a) − v_p(b) and similarly for r (padicValRat.div, padicValRat.of_nat).
2. Equal valuations give v_p(a·d) = v_p(c·b) for every prime p (padicValRat.mul), so a·d = c·b by Nat.eq_iff_prime_padicValNat_eq (both products nonzero), hence q = r. The converse is immediate.

Acceptance:

- Positivity is needed: q = −1 and r = 1 have the same valuation 0 at every prime.
- 2/24 and 1/12 have the same valuations (v_2 = −2, v_3 = −1, all others 0), as the lemma requires.

Library: `padicValRat`, `padicValRat.div`, `padicValRat.mul`, `padicValRat.of_nat`, `Nat.eq_iff_prime_padicValNat_eq`, `Rat.num_div_den`.

Source: kolster-park-city-2009, Lecture 2, §3, Birch-Tate Conjecture 3.5, p. 15.

### The absolute-value form of the formula

Declaration: TauCeti.BirchTate.birchTateFormula_iff_abs (theorem). Node: SpecialValuesBirchTate:B.2/birch-tate-iff-absolute-value.

For a totally real number field F: BirchTateFormula(F) holds if and only if |ζ_F(−1)| = #K₂(𝓞_F)/w₂(F).

Hypotheses: F totally real.

Proof or construction:

1. By B.2/zeta-minus-one-sign, ζ_F(−1) = (−1)^{[F:ℚ]} |ζ_F(−1)|, so the formula is equivalent to (−1)^{[F:ℚ]}|ζ_F(−1)| = (−1)^{[F:ℚ]} #K₂(𝓞_F)/w₂(F); cancel the unit (−1)^{[F:ℚ]}.

Acceptance:

- The analytic sign is used once, here; the arithmetic (B.4–B.6) proves only the absolute value, prime by prime.

Depends on: SpecialValuesBirchTate:B.1/birch-tate-formula, SpecialValuesBirchTate:B.2/zeta-minus-one-sign.

Source: kolster-park-city-2009, Lecture 2, §3, Birch-Tate Conjecture 3.5, p. 15; Kbook.2013, VI.8.6, Birch–Tate Conjecture 8.6, PDF p. 523 (book p. 515).

### The primewise form of the Birch–Tate formula

Declaration: TauCeti.BirchTate.birchTateFormula_iff_padicValRat (theorem). Node: SpecialValuesBirchTate:B.2/birch-tate-iff-valuations. Planet: Primewise Birch–Tate.

Let F be totally real and let q ∈ ℚ with ζ_F(−1) = q (the rationality of ζ_F(−1), requested from AutomorphicPadicLFunctions L3). Then BirchTateFormula(F) holds if and only if, for every prime ℓ, v_ℓ(#K₂(𝓞_F)) = v_ℓ(w₂(F)) + v_ℓ(|q|), with v_ℓ = padicValNat on the naturals and padicValRat on |q|.

Hypotheses: F totally real; q ∈ ℚ with (q : ℂ) = ζ_F(−1).

Proof or construction:

1. By B.2/birch-tate-iff-absolute-value the formula is |q| = #K₂(𝓞_F)/w₂(F), an equation between positive rationals (q ≠ 0 by B.2/zeta-minus-one-sign; #K₂ ≥ 1, w₂ ≥ 1).
2. By B.2/positive-rational-from-valuations it holds if and only if v_ℓ(|q|) = v_ℓ(#K₂(𝓞_F)/w₂(F)) = v_ℓ(#K₂(𝓞_F)) − v_ℓ(w₂(F)) for all ℓ (padicValRat.div, padicValRat.of_nat).

Acceptance:

- For ℚ: q = −1/12, #K₂ = 2, w₂ = 24: v_2: 1 = 3 + (−2); v_3: 0 = 1 + (−1); all other ℓ: 0 = 0 + 0.
- This is the form the odd-primary theorem (B.4) proves for each odd ℓ, keeping the sign apart.

Depends on: SpecialValuesBirchTate:B.2/birch-tate-iff-absolute-value, SpecialValuesBirchTate:B.2/positive-rational-from-valuations, SpecialValuesBirchTate:B.2/zeta-minus-one-sign, AutomorphicPadicLFunctions:L3, ArithmeticKTheory:N.4/finiteness-of-the-w-invariant, ArithmeticKTheory:N.3/finiteness-and-ranks-combined.

Library: `padicValRat.div`, `padicValRat.of_nat`.

Source: kolster-park-city-2009, Lecture 2, §3, Birch-Tate Conjecture 3.5, p. 15; Kbook.2013, VI.8.6, Birch–Tate Conjecture 8.6, PDF p. 523 (book p. 515).

### The denominator of ζ_F(−1) divides w₂(F), given the formula

Declaration: TauCeti.BirchTate.BirchTateFormula.w2_mul_zeta_eq_intCast (theorem). Node: SpecialValuesBirchTate:B.2/denominator-consequence.

Let F be totally real and suppose BirchTateFormula(F). Then w₂(F) · ζ_F(−1) = (−1)^{[F:ℚ]} #K₂(𝓞_F) is an integer; hence ζ_F(−1) is rational and, written in lowest terms, its denominator divides w₂(F). The consequence is drawn from the identity; it is not used to prove the identity, and it is not a substitute for the independent Deligne–Ribet integrality (requested from AutomorphicPadicLFunctions L3).

Hypotheses: F totally real; BirchTateFormula(F).

Proof or construction:

1. Multiply the formula by w₂(F) ≠ 0 (B.1/birch-tate-formula, birchTateFormula_iff_mul).
2. If w·z = m ∈ ℤ with w ≥ 1 then z = m/w ∈ ℚ and its reduced denominator divides w (Rat.den_dvd).

Acceptance:

- For ℚ: 24 · (−1/12) = −2 ∈ ℤ, and the denominator 12 divides 24.

Depends on: SpecialValuesBirchTate:B.1/birch-tate-formula, ArithmeticKTheory:N.4/finiteness-of-the-w-invariant.

Library: `Rat.den_dvd`.

Source: Kbook.2013, VI.8.6, Birch–Tate Conjecture 8.6, PDF p. 523 (book p. 515).

## The base example and independent computations (B.3)

### The continued Dedekind zeta function of ℚ is the Riemann zeta function

Declaration: TauCeti.BirchTate.dedekindZeta_rat_eq_riemannZeta (theorem). Node: SpecialValuesBirchTate:B.3/dedekind-zeta-of-the-rationals.

The continued Dedekind zeta function of ℚ (AL.1) equals Mathlib's riemannZeta on ℂ ∖ {1}.

Hypotheses: None.

Proof or construction:

1. On Re s > 1: NumberField.dedekindZeta ℚ s = LSeries (dedekindZetaCoeff ℚ) s (TauCeti.dedekindZeta_eq_LSeries_dedekindZetaCoeff); every coefficient is 1 (TauCeti.dedekindZetaCoeff_rat; the n = 0 term, which counts the zero ideal, is not part of an LSeries), so it is LSeries 1 s = riemannZeta s (LSeries_one_eq_riemannZeta).
2. Both functions are holomorphic on the connected set ℂ ∖ {1} (AL.1; riemannZeta by differentiableAt_riemannZeta), so they agree there by the identity principle.

Acceptance:

- The comparison is with Mathlib's continued riemannZeta, so ζ_ℚ(−1) comes from the existing Bernoulli theory and not from the Birch–Tate formula.

Depends on: AutomorphicLFunctionsAndLocalFactors:AL.1.

Library: `TauCeti.dedekindZeta_eq_LSeries_dedekindZetaCoeff`, `TauCeti.dedekindZetaCoeff_rat`, `LSeries_one_eq_riemannZeta`, `differentiableAt_riemannZeta`, `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`.

Source: Kbook.2013, VI.8.6, the paragraph after Conjecture 8.6, PDF p. 523 (book p. 515).

### ζ_ℚ(−1) = −1/12

Declaration: TauCeti.BirchTate.dedekindZeta_rat_neg_one (lemma). Node: SpecialValuesBirchTate:B.3/zeta-of-the-rationals-at-minus-one.

The continued Dedekind zeta function of ℚ takes the value −1/12 at s = −1.

Hypotheses: None.

Proof or construction:

1. By B.3/dedekind-zeta-of-the-rationals, ζ_ℚ(−1) = riemannZeta(−1).
2. riemannZeta_neg_nat_eq_bernoulli at k = 1 gives riemannZeta(−1) = (−1)^1 · bernoulli 2 / 2, and bernoulli_two gives bernoulli 2 = 1/6, so the value is −1/12.

Acceptance:

- The sign is negative, as B.2/zeta-minus-one-sign requires for [ℚ:ℚ] = 1.

Depends on: SpecialValuesBirchTate:B.3/dedekind-zeta-of-the-rationals.

Library: `riemannZeta_neg_nat_eq_bernoulli`, `bernoulli_two`.

Source: Kbook.2013, VI.8.6, the paragraph after Conjecture 8.6, PDF p. 523 (book p. 515).

### #K₂(𝓞_ℚ) = 2

Declaration: TauCeti.BirchTate.natCard_K2_ringOfIntegers_rat (lemma). Node: SpecialValuesBirchTate:B.3/k2-of-the-rationals-ring-of-integers.

Nat.card K₂(𝓞_ℚ) = 2.

Hypotheses: None.

Proof or construction:

1. Rat.ringOfIntegersEquiv : 𝓞_ℚ ≃+* ℤ, and K₂ is a functor (K2SymbolsBrauer T.1/k2-definition, K2.map), so it carries ring isomorphisms to group isomorphisms and #K₂(𝓞_ℚ) = #K₂(ℤ).
2. K₂(ℤ) is cyclic of order two, generated by {−1, −1} (K2SymbolsBrauer T.5/k2-of-the-integers); that computation does not use the Birch–Tate formula.

Acceptance:

- The upper bound in T.5/k2-of-the-integers (Milnor's computation in St(ℤ)) is recorded there as a gap, and this lemma inherits it.

Depends on: K2SymbolsBrauer:T.1/k2-definition, K2SymbolsBrauer:T.5/k2-of-the-integers.

Library: `Rat.ringOfIntegersEquiv`.

Source: Kbook.2013, VI.8.6, the paragraph after Conjecture 8.6, PDF p. 523 (book p. 515).

### The Birch–Tate formula for ℚ

Declaration: TauCeti.BirchTate.birchTateFormula_rat (theorem). Node: SpecialValuesBirchTate:B.3/birch-tate-for-the-rationals. Planet: Birch–Tate for ℚ.

BirchTateFormula(ℚ) holds: ζ_ℚ(−1) = −1/12 = (−1)^1 · 2/24, from three independently established values: ζ_ℚ(−1) = −1/12 (B.3/zeta-of-the-rationals-at-minus-one), #K₂(ℤ) = 2 (B.3/k2-of-the-rationals-ring-of-integers) and w₂(ℚ) = 24 (ArithmeticKTheory N.4/w2-of-the-rationals-and-the-divisibility-tests).

Hypotheses: None.

Proof or construction:

1. [ℚ:ℚ] = 1 (Module.finrank_self).
2. Substitute the three values: (−1)^1 · 2/24 = −1/12.

Acceptance:

- Sign: the unsigned right side +1/12 is wrong. Twist: w₁(ℚ) = 2 in place of w₂(ℚ) = 24 gives −1. Denominator: 12 divides w₂(ℚ) = 24 (B.2/denominator-consequence). Each is a unit test of B.1/birch-tate-formula.

Depends on: SpecialValuesBirchTate:B.1/birch-tate-formula, SpecialValuesBirchTate:B.3/zeta-of-the-rationals-at-minus-one, SpecialValuesBirchTate:B.3/k2-of-the-rationals-ring-of-integers, ArithmeticKTheory:N.4/w2-of-the-rationals-and-the-divisibility-tests.

Library: `Module.finrank_self`.

Source: Kbook.2013, VI.8.6, the paragraph after Conjecture 8.6, PDF p. 523 (book p. 515); Kbook.2013, VI.8.6, Birch–Tate Conjecture 8.6, PDF p. 523 (book p. 515).

### Ideals of ℚ(√5) of norm n are counted by the character mod 5

Declaration: TauCeti.BirchTate.dedekindZetaCoeff_sqrtFive_eq_convolution (lemma). Node: SpecialValuesBirchTate:B.3/sqrt-five-ideal-count.

Let F = ℚ(√5) and χ₅ the quadratic character mod 5, χ₅(n) = legendreSym 5 n (zero on multiples of 5), viewed as a Dirichlet character ℂ-valued of level 5. For every n ≥ 1 the number of ideals of 𝓞_F of absolute norm n is Σ_{d | n} χ₅(d); that is, dedekindZetaCoeff F = 1 ⍟ χ₅ on n ≥ 1 (Dirichlet convolution).

Hypotheses: F = ℚ(√5), with θ = √5, minpoly ℤ θ = X² − 5, 5 squarefree and 5 ≡ 1 (mod 4).

Proof or construction:

1. 𝓞_F = ℤ[ω] with ω = (1 + √5)/2 (Tau Ceti NumberField.adjoin_halfGen_eq_top_of_mod_four_eq_one), and ω has minimal polynomial X² − X − 1 of discriminant 5.
2. Both sides are multiplicative in n: the ideal count by unique factorisation of ideals and multiplicativity of the absolute norm (the Euler product of TauCeti.dedekindZeta_eulerProduct_hasProd), the divisor sum as a convolution of multiplicative functions. So it suffices to take n = p^k.
3. Splitting of p in 𝓞_F by Kummer–Dedekind (KummerDedekind.normalizedFactorsMapEquivNormalizedFactorsMinPolyMk; the conductor of ℤ[ω] is the whole ring): p = 5 ramifies (X² − X − 1 ≡ (X − 3)² mod 5); p = 2 is inert (X² + X + 1 is irreducible mod 2) and χ₅(2) = −1; for odd p ≠ 5, p splits exactly when 5 is a square mod p, which by quadratic reciprocity (legendreSym.quadratic_reciprocity_one_mod_four, 5 ≡ 1 mod 4) is χ₅(p) = 1, and is inert when χ₅(p) = −1.
4. Count ideals of norm p^k: split, k + 1 = Σ_{j ≤ k} 1^j; inert, 1 if k is even and 0 if odd = Σ_{j ≤ k} (−1)^j; ramified, 1 = 1 + 0 + ⋯. In each case this is Σ_{d | p^k} χ₅(d).

Acceptance:

- n = 4: one ideal (2𝓞_F, as 2 is inert), and Σ_{d | 4} χ₅(d) = 1 − 1 + 1 = 1.
- n = 11: two ideals (11 = (4 + √5)(4 − √5) up to units), and χ₅(1) + χ₅(11) = 2.

Library: `NumberField.adjoin_halfGen_eq_top_of_mod_four_eq_one`, `TauCeti.dedekindZetaCoeff`, `TauCeti.dedekindZeta_eulerProduct_hasProd`, `KummerDedekind.normalizedFactorsMapEquivNormalizedFactorsMinPolyMk`, `legendreSym`, `legendreSym.quadratic_reciprocity_one_mod_four`, `LSeries.convolution`, `DirichletCharacter`, `Ideal.absNorm`.

Source: Kbook.2013, VI.8.6, PDF p. 523 (book p. 515).

### ζ_{ℚ(√5)} = ζ · L(χ₅)

Declaration: TauCeti.BirchTate.dedekindZeta_sqrtFive_eq_mul_LFunction (theorem). Node: SpecialValuesBirchTate:B.3/sqrt-five-zeta-factorisation.

For F = ℚ(√5), the continued Dedekind zeta function satisfies ζ_F(s) = riemannZeta(s) · L(s, χ₅) for every s ≠ 1, where L(s, χ₅) is Mathlib's continued DirichletCharacter.LFunction χ₅.

Hypotheses: F = ℚ(√5).

Proof or construction:

1. On Re s > 1: both series converge absolutely, so LSeries (1 ⍟ χ₅) s = LSeries 1 s · LSeries χ₅ s (LSeries_convolution'), which is riemannZeta s · L(s, χ₅) (LSeries_one_eq_riemannZeta, DirichletCharacter.LFunction_eq_LSeries). By B.3/sqrt-five-ideal-count the left side is NumberField.dedekindZeta F s.
2. L(·, χ₅) is entire because χ₅ ≠ 1 (DirichletCharacter.differentiable_LFunction), riemannZeta is holomorphic off 1, and ζ_F is holomorphic off 1 (AL.1); the identity principle on the connected set ℂ ∖ {1} finishes.

Acceptance:

- This is the factorisation into Riemann and Dirichlet L-functions that B.3 asks for, in the one case needed; the general quadratic field needs the Kronecker character, which neither library has, and is left to the coverage record.

Depends on: SpecialValuesBirchTate:B.3/sqrt-five-ideal-count, AutomorphicLFunctionsAndLocalFactors:AL.1.

Library: `LSeries_convolution'`, `LSeries_one_eq_riemannZeta`, `DirichletCharacter.LFunction_eq_LSeries`, `DirichletCharacter.differentiable_LFunction`, `DirichletCharacter.LFunction`, `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`.

Source: Kbook.2013, VI.8.6, PDF p. 523 (book p. 515).

### ζ_{ℚ(√5)}(−1) = 1/30

Declaration: TauCeti.BirchTate.dedekindZeta_sqrtFive_neg_one (lemma). Node: SpecialValuesBirchTate:B.3/sqrt-five-zeta-at-minus-one.

For F = ℚ(√5): L(−1, χ₅) = −2/5, and ζ_F(−1) = (−1/12)·(−2/5) = 1/30.

Hypotheses: F = ℚ(√5).

Proof or construction:

1. χ₅ is even, so ZMod.LFunction_def_even gives L(−1, χ₅) = 5^{1} Σ_{j ∈ ZMod 5} χ₅(j) · hurwitzZetaEven(j/5, −1); since χ₅ is even the odd Hurwitz parts cancel and this equals 5 Σ_{j=1}^{4} χ₅(j) ζ(j/5, −1).
2. HurwitzZeta.hurwitzZeta_neg_nat at k = 1: ζ(x, −1) = −B₂(x)/2 with B₂(x) = x² − x + 1/6. With χ₅(1) = χ₅(4) = 1 and χ₅(2) = χ₅(3) = −1, Σ χ₅(j) B₂(j/5) = (1 + 16 − 4 − 9)/25 − (1 + 4 − 2 − 3)/5 = 4/25, so L(−1, χ₅) = 5 · (−1/2) · 4/25 = −2/5.
3. B.3/sqrt-five-zeta-factorisation at s = −1 and ζ(−1) = −1/12 (riemannZeta_neg_nat_eq_bernoulli, bernoulli_two) give 1/30.

Acceptance:

- The sign is + = (−1)^2, as B.2/zeta-minus-one-sign requires for a real quadratic field.
- The value is exact; no numerical approximation is compared with a rational candidate.

Depends on: SpecialValuesBirchTate:B.3/sqrt-five-zeta-factorisation.

Library: `ZMod.LFunction_def_even`, `HurwitzZeta.hurwitzZeta_neg_nat`, `Polynomial.bernoulli`, `riemannZeta_neg_nat_eq_bernoulli`, `bernoulli_two`.

Source: Kbook.2013, VI.8.6, PDF p. 523 (book p. 515).

### w₂(ℚ(√5)) = 120

Declaration: TauCeti.BirchTate.wInvariant_two_sqrtFive (lemma). Node: SpecialValuesBirchTate:B.3/sqrt-five-w2.

For F = ℚ(√5): w₂^{(2)}(F) = 8, w₂^{(3)}(F) = 3, w₂^{(5)}(F) = 5 and w₂^{(ℓ)}(F) = 1 for ℓ ≥ 7, so w₂(F) = 120.

Hypotheses: F = ℚ(√5).

Proof or construction:

1. Criterion (ArithmeticKTheory N.4/computing-w-from-the-cyclotomic-character, and N.4/two-primary-w-invariant at 2): ℓ^ν divides w₂(F) exactly when Gal(F(μ_{ℓ^ν})/F) has exponent dividing 2.
2. ℓ = 5: ℚ(√5) ⊂ ℚ(μ₅), so Gal(F(μ₅)/F) has order 2 and 5 | w₂; Gal(F(μ₂₅)/F) is cyclic of order 10, so 25 ∤ w₂.
3. ℓ = 3: F ∩ ℚ(μ₉) = ℚ, so Gal(F(μ₃)/F) ≅ (ℤ/3)^× has order 2 and Gal(F(μ₉)/F) ≅ (ℤ/9)^× is cyclic of order 6: w₂^{(3)} = 3.
4. ℓ = 2: F ∩ ℚ(μ₁₆) = ℚ (the quadratic subfields of ℚ(μ₁₆) are ℚ(i), ℚ(√2), ℚ(√−2)), so Gal(F(μ₈)/F) ≅ (ℤ/8)^× has exponent 2 and Gal(F(μ₁₆)/F) ≅ (ℤ/16)^× has exponent 4: w₂^{(2)} = 8.
5. ℓ ≥ 7: Gal(F(μ_ℓ)/F) is cyclic of order ℓ − 1 or (ℓ − 1)/2, at least 3, so ℓ ∤ w₂ (and N.4/finiteness-of-the-w-invariant bounds the primes: ℓ − 1 ≤ 2·2).

Acceptance:

- w₂(ℚ(√5)) = 5 · w₂(ℚ): the prime 5 enters because ℚ(√5) is the quadratic subfield of ℚ(μ₅), a check that w₂ is not NumberField.Units.torsionOrder (which is 2 here).

Depends on: ArithmeticKTheory:N.4/computing-w-from-the-cyclotomic-character, ArithmeticKTheory:N.4/two-primary-w-invariant, ArithmeticKTheory:N.4/finiteness-of-the-w-invariant, ArithmeticKTheory:N.4/the-w-invariant.

Library: `IsCyclotomicExtension`.

Source: kolster-park-city-2009, Lecture 2, §3, before Corollary 3.4, p. 15.

### The Birch–Tate check for ℚ(√5)

Declaration: TauCeti.BirchTate.birchTateFormula_sqrtFive (application). Node: SpecialValuesBirchTate:B.3/sqrt-five-birch-tate-check.

Given the independently certified order #K₂(𝓞_{ℚ(√5)}) = 4 (a certified tame-kernel presentation, requested from K2SymbolsBrauer T.5, in the format of ArithmeticKTheory N.8/certified-example-format), BirchTateFormula(ℚ(√5)) holds: 1/30 = (−1)^2 · 4/120. The check uses ζ_F(−1) = 1/30 from B.3/sqrt-five-zeta-at-minus-one and w₂(F) = 120 from B.3/sqrt-five-w2. If instead the order 4 is read off from the formula (which is a theorem for this abelian field), the result is a corollary and not a test, under N.8's labelling rule.

Hypotheses: F = ℚ(√5); the K₂ certificate does not use the Birch–Tate formula.

Proof or construction:

1. [F:ℚ] = 2, so the sign is +1.
2. 4/120 = 1/30.

Acceptance:

- The three numbers 1/30, 4 and 120 come from three independent computations.

Depends on: SpecialValuesBirchTate:B.1/birch-tate-formula, SpecialValuesBirchTate:B.3/sqrt-five-zeta-at-minus-one, SpecialValuesBirchTate:B.3/sqrt-five-w2, K2SymbolsBrauer:T.5.

Source: Kbook.2013, VI.8.6, PDF p. 523 (book p. 515); Kbook.2013, VI.8.6, Birch–Tate Conjecture 8.6, PDF p. 523 (book p. 515).

## S-integers and Euler factors (B.7)

### The S-modified Dedekind zeta function

Declaration: TauCeti.BirchTate.sModifiedZeta (definition). Node: SpecialValuesBirchTate:B.7/s-modified-dedekind-zeta. Planet: S-modified zeta function.

Let F be a number field and S a finite set of maximal ideals of 𝓞_F (IsDedekindDomain.HeightOneSpectrum (𝓞 F)), with Nv = Ideal.absNorm v. The S-modified Dedekind zeta function is ζ_{F,S}(s) = ζ_F(s) · ∏_{v∈S} (1 − Nv^{−s}), for the continued ζ_F of AL.1. On Re s > 1 it is the L-series of the ideal count restricted to ideals prime to S, which is Tau Ceti's EulerProductData.restrictAway applied to the trivial Euler-product data.

Hypotheses: F a number field; S a finite set of height-one primes of 𝓞_F.

Proof or construction:

1. The definition is the displayed product.
2. Compatibility on Re s > 1: by the Euler product (TauCeti.dedekindZeta_eulerProduct_hasProd) ζ_F(s) = ∏_v (1 − Nv^{−s})^{−1}; multiplying by ∏_{v∈S}(1 − Nv^{−s}) removes the factors at S, leaving the Euler product of the data restricted away from S (TauCeti.EulerProductData.restrictAway_apply).

The required uses are:

- SpecialValuesBirchTate:B.7/birch-tate-for-s-integers: Its value at −1 is compared with #K₂(𝓞_{F,S})/w₂(F).
- SpecialValuesBirchTate:B.4: The passage from 𝓞_F to 𝓞_F[1/ℓ] takes S to be the primes above ℓ.
- IntegralIwasawaTheory:I.10: The S-Euler factors in the B.6 comparison table are these factors at s = −1.
- ArithmeticKTheory:N.8/s-integer-sequence-for-one-inverted-prime: The S-integer examples compare with ζ_{ℚ,{p}}(−1).

The API supplies:

- TauCeti.BirchTate.sModifiedZeta (constructor): sModifiedZeta F S s = dedekindZetaCont F s * ∏ v ∈ S, (1 − (absNorm v : ℂ)^(−s)).
- TauCeti.BirchTate.sModifiedZeta_empty (simp): sModifiedZeta F ∅ = dedekindZetaCont F.
- TauCeti.BirchTate.sModifiedZeta_insert (relation): For v ∉ S: sModifiedZeta F (insert v S) s = sModifiedZeta F S s * (1 − Nv^(−s)).
- TauCeti.BirchTate.sModifiedZeta_eq_LSeries_restrictAway (compatibility): On Re s > 1 sModifiedZeta F S equals the L-series of the Euler-product data restricted away from S (TauCeti.EulerProductData.restrictAway).
- TauCeti.BirchTate.sModifiedZeta_neg_one (characterisation): sModifiedZeta F S (−1) = (−1)^#S * dedekindZetaCont F (−1) * ∏ v ∈ S, (Nv − 1) (B.7/euler-factors-at-minus-one).

Discriminating tests:

- TauCeti.BirchTate.sModifiedZeta_empty_eq (degenerate): With S = ∅ the function is dedekindZetaCont F itself.
- TauCeti.BirchTate.sModifiedZeta_rat_two_neg_one (value): For ℚ and S = {(2)}: ζ_{ℚ,S}(−1) = (−1/12)(1 − 2) = 1/12; the sign changes.
- TauCeti.BirchTate.sModifiedZeta_rat_three_neg_one (value): For ℚ and S = {(3)}: ζ_{ℚ,S}(−1) = (−1/12)(1 − 3) = 1/6, whereas multiplying by the inverse factor would give 1/24.
- TauCeti.BirchTate.sModifiedZeta_rat_eq_LSeries (comparison): For ℚ and S = {(2)}, on Re s > 1 the function is Σ_{n odd} n^{−s} = (1 − 2^{−s}) riemannZeta s, matching Mathlib's riemannZeta.

Acceptance:

- The Euler factor is removed, not doubled: ζ_{F,S} = ζ_F · ∏(1 − Nv^{−s}), never ζ_F · ∏(1 − Nv^{−s})^{−1}.

Depends on: AutomorphicLFunctionsAndLocalFactors:AL.1.

Library: `TauCeti.EulerProductData.restrictAway`, `TauCeti.EulerProductData.restrictAway_apply`, `TauCeti.dedekindZeta_eulerProduct_hasProd`, `IsDedekindDomain.HeightOneSpectrum`, `Ideal.absNorm`, `Finset.prod`.

Source: kolster-park-city-2009, Lecture 1, §1, p. 8.

### The Euler factors at s = −1

Declaration: TauCeti.BirchTate.sModifiedZeta_neg_one (lemma). Node: SpecialValuesBirchTate:B.7/euler-factors-at-minus-one.

For a number field F and a finite set S of maximal ideals of 𝓞_F: ζ_{F,S}(−1) = (−1)^{|S|} · ζ_F(−1) · ∏_{v∈S} (Nv − 1).

Hypotheses: S finite.

Proof or construction:

1. At s = −1 each factor is 1 − Nv^{1} = −(Nv − 1); the product over S of the signs is (−1)^{|S|} (Finset.prod_pow_eq_pow_sum or induction on S).

Acceptance:

- Each Nv − 1 ≥ 1, since Nv = #(𝓞_F/v) ≥ 2.

Depends on: SpecialValuesBirchTate:B.7/s-modified-dedekind-zeta.

Library: `Finset.prod`.

Source: kolster-park-city-2009, Lecture 1, §1, p. 8.

### #K₂(𝓞_{F,S}) = #K₂(𝓞_F) · ∏_{v∈S}(Nv − 1)

Declaration: TauCeti.BirchTate.natCard_K2_sInteger (theorem). Node: SpecialValuesBirchTate:B.7/k2-order-of-s-integers.

Let F be a number field, S a finite set of maximal ideals of 𝓞_F and 𝓞_{F,S} the S-integers (Mathlib's Set.integer). Then Nat.card K₂(𝓞_{F,S}) = Nat.card K₂(𝓞_F) · ∏_{v∈S} (Nv − 1).

Hypotheses: S finite.

Proof or construction:

1. K2SymbolsBrauer T.5/s-integer-tame-kernel-sequence gives the exact sequence 0 → K₂(𝓞_F) → K₂(𝓞_{F,S}) → ⊕_{v∈S} k(v)^× → 0.
2. An exact sequence of groups 1 → A → B → C → 1 with A and C finite gives #B = #A · #C (Subgroup.card_mul_index, with the index of the image of A equal to #C by QuotientGroup.quotientKerEquivOfSurjective); B is then finite.
3. #k(v)^× = #k(v) − 1 = Nv − 1 (Nat.card_units; #k(v) = Ideal.absNorm v), and the direct sum over the finite set S has order the product (Nat.card_pi).

Acceptance:

- For ℚ and S = {(2)}: #K₂(ℤ[1/2]) = 2 · 1 = 2; for S = {(3)}: 2 · 2 = 4.

Depends on: K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence, K2SymbolsBrauer:T.1/k2-definition, ArithmeticKTheory:N.3/finiteness-and-ranks-combined.

Library: `Set.integer`, `Subgroup.card_mul_index`, `QuotientGroup.quotientKerEquivOfSurjective`, `Nat.card_units`, `Nat.card_pi`, `Ideal.absNorm`.

Source: kolster-park-city-2009, Lecture 1, §1, p. 8.

### The S-integral Birch–Tate formula

Declaration: TauCeti.BirchTate.birchTateFormula_iff_sInteger (theorem). Node: SpecialValuesBirchTate:B.7/birch-tate-for-s-integers. Planet: S-integral Birch–Tate.

Let F be a number field and S a finite set of maximal ideals of 𝓞_F. Then BirchTateFormula(F) holds if and only if ζ_{F,S}(−1) = (−1)^{[F:ℚ] + |S|} · #K₂(𝓞_{F,S}) / w₂(F).

Hypotheses: S finite.

Proof or construction:

1. By B.7/euler-factors-at-minus-one and B.7/k2-order-of-s-integers, the S-formula reads (−1)^{|S|} ζ_F(−1) P = (−1)^{[F:ℚ]+|S|} #K₂(𝓞_F) P / w₂(F) with P = ∏_{v∈S}(Nv − 1) ≥ 1.
2. Cancel the nonzero factor (−1)^{|S|} P.

Acceptance:

- For ℚ and S = {(2)}: 1/12 = (+1) · 2/24; for S = {(3)}: 1/6 = (+1) · 4/24. Keeping the unmodified sign (−1)^{[F:ℚ]} after removing a prime gives −1/12 ≠ 1/12.

Depends on: SpecialValuesBirchTate:B.1/birch-tate-formula, SpecialValuesBirchTate:B.7/euler-factors-at-minus-one, SpecialValuesBirchTate:B.7/k2-order-of-s-integers, ArithmeticKTheory:N.4/finiteness-of-the-w-invariant.

Source: kolster-park-city-2009, Lecture 1, §1, p. 8; Kbook.2013, VI.8.6, Birch–Tate Conjecture 8.6, PDF p. 523 (book p. 515).

## The layers not read in this checkpoint

- **B.4.** Tate's K₂–Galois-cohomology comparison (K2SymbolsBrauer T.7, MotivicEtaleKTheory M.3), the localisation sequence to 𝓞_F[1/ℓ] (ArithmeticKTheory N.2), the Euler characteristic of IntegralIwasawaTheory I.5 and the ℓ-adic unit Nv − 1: plan the odd-primary valuation identity of B.2/birch-tate-iff-valuations from K-book VI.8.7 and Kolster Lecture 2 Theorem 3.3.
- **B.5.** The totally real abelian case with its 2-primary part (Wiles for abelian F/ℚ, Kolster's appendix to Rognes–Weibel).
- **B.6.** Kolster 1989 (Canad. Math. Bull. 32), Conjecture 3, Lemma 2 and Theorem 5, and the comparison table with IntegralIwasawaTheory I.9–I.10.
- **B.8.** Lichtenbaum statements at all negative integers with BorelRegulators R.5's leading terms, and the motivic form (Kolster Conjectures 3.6–3.7).

## Requests to other roadmaps

- **AutomorphicLFunctionsAndLocalFactors:AL.1.** The Dedekind zeta function of a number field F continued to ℂ: a function ζ_F : ℂ → ℂ, holomorphic on ℂ ∖ {1}, equal to Mathlib's NumberField.dedekindZeta F on Re s > 1; and the completed function Λ_F(s) = |d_F|^{s/2} Γ_ℝ(s)^{r_1} Γ_ℂ(s)^{r_2} ζ_F(s), with Mathlib's Complex.Gammaℝ and Complex.Gammaℂ, holomorphic on ℂ ∖ {0, 1} and satisfying Λ_F(1 − s) = Λ_F(s). AL.1: 'Prove the global integral Euler factorization, continuation and functional equation using Poisson summation, retaining the trivial-character poles'; BorelRegulators R.5 imports the same objects from AL.1. Needed by: B.1/birch-tate-formula, B.2/zeta-via-reciprocal-gamma, B.2/zeta-minus-one-sign, B.3/dedekind-zeta-of-the-rationals, B.3/sqrt-five-zeta-factorisation, B.7/s-modified-dedekind-zeta.
- **AutomorphicPadicLFunctions:L3.** For a totally real field F and k ≥ 1, ζ_F(1 − 2k) ∈ ℚ (Siegel–Klingen; the 'algebraicity of negative critical values' in L3's Deligne–Ribet construction), and the Deligne–Ribet integrality statement bounding the denominator of ζ_F(−1), proved independently of the Birch–Tate formula. Needed by: B.2/birch-tate-iff-valuations, B.2/denominator-consequence.
- **K2SymbolsBrauer:T.5.** A certified presentation of the tame kernel K₂(𝓞_F) for F = ℚ(√5), 𝓞_F = ℤ[(1+√5)/2], giving #K₂(𝓞_F) = 4 (the group is (ℤ/2)²), proved without the Birch–Tate formula and in the format of ArithmeticKTheory N.8/certified-example-format. T.5 plans 'a certified tame-kernel presentation of a nontrivial arithmetic example'; ArithmeticKTheory N.8/real-quadratic-example-and-birch-tate asks for a real quadratic example, and this field serves both. Needed by: B.3/sqrt-five-birch-tate-check.

## Gaps

- **The upper bound in K₂(ℤ) ≅ ℤ/2.** K2SymbolsBrauer T.5/k2-of-the-integers proves #K₂(ℤ) ≥ 2 through the sign symbol and records Milnor's Euclidean-algorithm computation of the upper bound as a gap. Birch–Tate for ℚ needs the exact order 2, so it rests on that gap until T.5 closes it.

## Coverage

- SpecialValuesBirchTate:B.1: closed. Nothing remains.
- SpecialValuesBirchTate:B.2: partial. Rationality of ζ_F(−1) and Deligne–Ribet integrality are requested from AutomorphicPadicLFunctions L3; B.2/birch-tate-iff-valuations takes the rational value as a hypothesis until then.
- SpecialValuesBirchTate:B.3: partial. #K₂(𝓞_{ℚ(√5)}) = 4 with its certificate (requested from K2SymbolsBrauer T.5). The factorisation ζ_F = ζ · L(χ_D) for a general quadratic field needs the Kronecker character of D as a Dirichlet character, which neither library has; only D = 5 is planned.
- SpecialValuesBirchTate:B.4: not_read. Tate's K₂–Galois-cohomology comparison (K2SymbolsBrauer T.7, MotivicEtaleKTheory M.3), the localisation sequence to 𝓞_F[1/ℓ] (ArithmeticKTheory N.2), the Euler characteristic of IntegralIwasawaTheory I.5 and the ℓ-adic unit Nv − 1: plan the odd-primary valuation identity of B.2/birch-tate-iff-valuations from K-book VI.8.7 and Kolster Lecture 2 Theorem 3.3.
- SpecialValuesBirchTate:B.5: not_read. The totally real abelian case with its 2-primary part (Wiles for abelian F/ℚ, Kolster's appendix to Rognes–Weibel).
- SpecialValuesBirchTate:B.6: not_read. Kolster 1989 (Canad. Math. Bull. 32), Conjecture 3, Lemma 2 and Theorem 5, and the comparison table with IntegralIwasawaTheory I.9–I.10.
- SpecialValuesBirchTate:B.7: partial. That changing S commutes with the cohomological comparisons of B.4–B.6; this waits for those layers.
- SpecialValuesBirchTate:B.8: not_read. Lichtenbaum statements at all negative integers with BorelRegulators R.5's leading terms, and the motivic form (Kolster Conjectures 3.6–3.7).

## Sources

- Charles A. Weibel, *The K-book: An Introduction to Algebraic K-theory*, Author-hosted combined draft dated 29 August 2013 (published as Graduate Studies in Mathematics 145, American Mathematical Society, 2013); printed page = PDF page − 8; accessed 2026-09-28. https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf (SHA-256 a04f53c9393b…). Read: VI.8.1–8.8 (PDF pp. 522–524, book pp. 514–516): Classical Data 8.1, the Birch–Tate Conjecture 8.6 and the paragraph after it, Wiles's Theorem 8.7 with its note, Theorem 8.8 and the first paragraph of its proof (the sign from the functional equation).
- Manfred Kolster, *Special values of L-functions at negative integers*, Lecture notes, IAS/Park City Mathematics Series (author preprint, 2009, 22 pages); printed page = PDF page; accessed 2026-09-28. https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf (SHA-256 5772ace94ba4…). Read: Introduction (p. 3); Lecture 1 §1 through the imprimitive p-adic L-functions (pp. 5–8); Lecture 2 §3, Theorem 3.3 to the Motivic Lichtenbaum Conjecture 3.7 (pp. 15–16).
