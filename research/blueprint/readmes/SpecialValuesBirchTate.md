# Birch–Tate and arithmetic special-value formulas

This target-level planning pass covers B.1–B.8. It retains the 44 declarations of
the preceding checkpoints and adds seven targets, including rationality independent
of Birch–Tate, denominator integrality, change of S, the real-place correction at
two and the integral equivariant statement. The packet is complete as a planning
pass: all eight stages are **planned**, with explicit supplier requests and three
recorded gaps. No stage is closed and no declaration is claimed implemented.

The [packet](../packets/SpecialValuesBirchTate.json) fixes the declaration ids,
direct dependencies, sources, API and tests. The
[suggested signatures](../suggested/SpecialValuesBirchTate.lean) are non-exhaustive
prototypes. Their native Mathlib portion elaborates; signatures needing unlanded
supplier objects are explicit comments, as the campaign's review contract requires.
The unavailable Tau Ceti object files prevent checking the original three-import
prototype. This is evidence about the executable portion only.

## Conventions and ownership

The baseline is Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and
Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**. The reviewed library audit
was read before extending the plan, and the statements and hypotheses of all 69
baseline citations were inspected at those commits. Native ideal/L-series,
quadratic-ring, gamma, Bernoulli and valuation APIs are reused. The two upstream
style references read in full are ArithmeticDirichletSeries and GlobalNumberFields.

Write \(\mathcal O_F\) for the ring of integers, \(r_1,r_2\) for its signature,
\(Nv=\#k(v)\), and \(S\) for a finite set of finite primes. The analytically
continued and completed zeta functions come from
**BorelRegulators:R.5/completed-zeta-conventions**. On \(\Re(s)>1\) their
uncompleted function agrees with Mathlib's Dedekind L-series. The archimedean
factors are Mathlib's \(\Gamma_{\mathbb R}(s)=\pi^{-s/2}\Gamma(s/2)\) and
\(\Gamma_{\mathbb C}(s)=2(2\pi)^{-s}\Gamma(s)\); reciprocal factors, rather than
division by a totalised pole, are used in continuation arguments.

Classical \(K_2\), its Steinberg comparison and the tame localization maps are
K2SymbolsBrauer's objects. The finite positive even groups are imported from
**ArithmeticKTheory:N.3:ranks/even-K-groups-of-S-integers-are-finite**.
\(W_n(F)=H^0(F,\mathbb Q/\mathbb Z(n))\), its cardinal \(w_n\) and its
cyclotomic action are **N.4**'s; \(W_2\) is not the ordinary roots of unity.
These direct imports resolve **RT-AREA-ktheory-1/10**. Positivity follows from
the nonempty finite group; no second finiteness construction is planned here.

**N.8/real-quadratic-example-and-birch-tate** owns the independent quadratic
tame-kernel certificate and the class-group/unit bounds. B.3 owns the zeta-value,
\(w_2\) and equality check; it consumes that certificate and inherits its upper-bound
gap. This resolves **RT-AREA-ktheory-1/11** without deriving an independent test
from the formula being tested.

Under accepted **RS-16**, **IntegralIwasawaTheory:I.9** owns Kurihara's determinant
theorem and **I.10** owns the old/new module dictionary and finite descent diagram.
B.6 applies those outputs to the \(K_2/W_2\) identity. Its retained dictionary id is
a special-value adapter, not a second construction. At \(2\), the minus module is
the kernel of the norm; an eigenspace cannot silently replace it.

The higher arithmetic Chern/real-place comparisons are **MotivicEtaleKTheory:M.3,
M.7**'s. Integral motivic \(H^1,H^2\) and the regulator lattice are **M.8/PS.3**'s;
matching p-adic completions does not determine an integral lattice and its maps.
**PeriodsAndSpecialValues:PS.4–PS.5** and **GeneralAlgebraicKTheory:K.5** own the
fundamental-line, ETNC and relative-K infrastructure. B.8 only specializes the
ETNC predicate to Tate motives.

The inherited source corrections are retained and rechecked against the recorded
versions. The old Handbook/K-book source status at two is not a statement about
the newer Kurihara theorem. Conversely, the modern determinant theorem does not
establish the finite comparison merely by existing.

## Target coverage and planets

Each stage below has a node for every target. Smaller proof steps remain in their
outlines; this pass stops at target granularity. The general motivic and ETNC
assertions are conjecture statements with defined inputs, not theorem claims.

| Stage | Status | Targets / planets | Principal gate |
| --- | --- | --- | --- |
| B.1 | planned | 1 targets; Birch–Tate formula | The imported continuation/completion adapter is BorelRegulators:R.5/completed-zeta-conventions (latest supplier review needs_changes). K₂ finiteness and W₂ positivity are exact N.3:ranks/N.4 imports; no duplicate construction is planned. |
| B.2 | planned | 11 targets; Sign of ζ_F(−1); Primewise Birch–Tate | Discharge the exact Deligne–Ribet untruncated integrality request to L3. Rationality is now a target node using the Borel rank-zero supplier; validate that supplier’s normalization in its review. |
| B.3 | planned | 9 targets; Birch–Tate for ℚ | Close T.5’s independent K₂(ℤ) upper bound and N.8’s independent quadratic generation upper bound before claiming the two independent examples complete. The D=5 factorization is fully outlined from Cohen and the native L-series API; a general quadratic family is outside the stated example target. |
| B.4 | planned | 5 targets; Odd-primary Birch–Tate (Wiles) | Discharge the M.3 natural Tate comparison, N.6 coefficient/descent and I.2/I.5/L2/L3 finite Euler-characteristic inputs, including the trivial-character pole term. No full higher norm-residue theorem is used here. |
| B.5 | planned | 7 targets; Federer's 2-adic main conjecture; Kolster's 2-primary Birch–Tate implication; Birch–Tate for totally real abelian fields | Discharge the exact Kolster 1987 finite sequence (N.6), Iwasawa unit cohomology and compact-dual no-finite-submodule theorem (I.2), twist/evaluation (L2), Ferrero–Washington (L4) and second-kind character convention (DirichletPadicLFunctions L2). The arbitrary-ramification auxiliary-tower comparison is a source-based proof outline, not a checked equivalence. |
| B.6 | planned | 5 targets; Birch–Tate conjecture (totally real) | I.10 must supply entries (a),(b),(f),(i) of the exact comparison and finite-specialization diagram, including all finite/Tor contributions; the all-prime Birch–Tate theorem remains a proof target dependent on this gap. I.9’s theorem is imported, not rebuilt. |
| B.7 | planned | 6 targets; S-modified zeta function; S-integral Birch–Tate | Discharge naturality of the actual M.3/M.7 Chern/residue maps and I.10 compact-support descent under S enlargement, with real corrections at 2. Regulator compatibility uses the integral torsion-free localization isomorphism and normalized R.4/R.7 covolume. |
| B.8 | planned | 7 targets; Odd-primary Lichtenbaum formula (totally real); Real-place correction at two; Abelian higher special-value formula; Integral equivariant special-value statement | Discharge M.7’s two congruence-class real-place comparison sequences; prove the derived scalar correction from those maps. M.8/PS.3 must fix the actual integral motivic lattice and regulator normalization. PS.4–PS.5/K.5 must supply the relative-K/fundamental-line statement objects and Coherence/perfectness interface. The general motivic and ETNC formulas are conjecture statements, not unresolved theorem claims. |

## B.1 — The statement and its imported inputs

<a id="B-1-birch-tate-formula"></a>

### The Birch–Tate formula for a number field

**Definition** `SpecialValuesBirchTate:B.1/birch-tate-formula`. Declaration: `TauCeti.BirchTate.BirchTateFormula`.

Let F be a number field, ζ_F : ℂ → ℂ its Dedekind zeta function continued to ℂ ∖ {1} (BorelRegulators R.5/completed-zeta-conventions; on Re s > 1 it is Mathlib's NumberField.dedekindZeta F), K₂(𝓞_F) the classical K₂ of its ring of integers (K2SymbolsBrauer T.1/k2-definition), a finite group by ArithmeticKTheory N.3:ranks/even-K-groups-of-S-integers-are-finite, and w₂(F) = #H⁰(F, ℚ/ℤ(2)) the order of the twisted roots of unity (ArithmeticKTheory N.4/the-w-invariant), a positive integer by N.4/finiteness-of-the-w-invariant. BirchTateFormula(F) is the proposition ζ_F(−1) = (−1)^{[F:ℚ]} · #K₂(𝓞_F) / w₂(F) in ℂ, with [F:ℚ] = Module.finrank ℚ F and #K₂(𝓞_F) = Nat.card K₂(𝓞_F). The Birch–Tate conjecture is the statement that BirchTateFormula(F) holds for every totally real F (NumberField.IsTotallyReal F); for totally real F, (−1)^{[F:ℚ]} = (−1)^{r_1}. The proposition is defined for every number field so that its failure with a complex place can be stated (B.2/formula-fails-with-complex-place); the conjecture is never asserted there.

**Hypotheses and boundary.** F is a number field; ζ_F, K₂(𝓞_F) and w₂(F) are the imported objects named in the statement. w₂(F) is the twisted invariant #H⁰(F, ℚ/ℤ(2)), never NumberField.Units.torsionOrder F = w₁(F).

**Construction or proof.**

1. The definition is the displayed equation; it needs no proof. What makes it well-posed: #K₂(𝓞_F) is finite (N.3:ranks/even-K-groups-of-S-integers-are-finite, n = 2), so Nat.card is the order rather than the junk value 0 of an infinite type, and w₂(F) ≥ 1 (N.4/finiteness-of-the-w-invariant), so the division is by a nonzero number.
2. birchTateFormula_iff_mul: since w₂(F) ≠ 0, the formula is equivalent to w₂(F) · ζ_F(−1) = (−1)^{[F:ℚ]} · #K₂(𝓞_F), which is the form the proofs of B.2, B.3 and B.7 use.
3. zeta_ne_zero: if the formula holds then ζ_F(−1) ≠ 0, because #K₂(𝓞_F) ≥ 1 (a group is nonempty and finite).

**Uses that determine the API.**

- `SpecialValuesBirchTate:B.2/birch-tate-iff-valuations`: Split into its sign and its prime valuations..
- `SpecialValuesBirchTate:B.3/birch-tate-for-the-rationals`: Proved for ℚ from independent inputs..
- `SpecialValuesBirchTate:B.7/birch-tate-for-s-integers`: Shown equivalent to the S-modified formula..
- `SpecialValuesBirchTate:B.4`: The odd-primary theorem proves its ℓ-adic valuation for every odd ℓ..
- `SpecialValuesBirchTate:B.5`: The abelian theorem proves it for totally real abelian F/ℚ..
- `ArithmeticKTheory:N.8/real-quadratic-example-and-birch-tate`: The certified examples compare their K₂ orders with it..

**Working API.**

- `TauCeti.BirchTate.BirchTateFormula` (constructor): The predicate BirchTateFormula(F) is the equality ζ_F(−1) = (−1)^[F:ℚ] · #K₂(𝓞_F)/w₂(F).
- `TauCeti.BirchTate.birchTateFormula_iff_mul` (characterisation): BirchTateFormula F ↔ w₂(F) * ζ_F(−1) = (−1)^(finrank ℚ F) * Nat.card (K2 (𝓞 F)), using w₂(F) ≥ 1.
- `TauCeti.BirchTate.BirchTateFormula.zeta_ne_zero` (other): BirchTateFormula F → ζ_F(−1) ≠ 0, since K₂(𝓞_F) is finite and nonempty and w₂(F) ≥ 1.
- `TauCeti.BirchTate.BirchTateFormula.w2_mul_zeta_eq_intCast` (other): BirchTateFormula F → w₂(F) * ζ_F(−1) = ((−1)^(finrank ℚ F) * Nat.card (K2 (𝓞 F)) : ℤ), an integer (B.2/denominator-consequence).

**Discriminating tests.** Each named test is an example in the suggested file.

- `TauCeti.BirchTate.birchTateFormula_rat_of_values` (computation): If ζ_ℚ(−1) = −1/12, Nat.card (K2 (𝓞 ℚ)) = 2 and wInvariant 2 ℚ = 24, then BirchTateFormula ℚ.
- `TauCeti.BirchTate.not_birchTateFormula_rat_twist_one` (non-example): With ζ_ℚ(−1) = −1/12, #K₂(𝓞_ℚ) = 2 and wInvariant 1 ℚ = 2, the formula with w₁(ℚ) in place of w₂(ℚ) is false: −1 ≠ −1/12.
- `TauCeti.BirchTate.not_birchTateFormula_rat_unsigned` (non-example): With the same values and w₂(ℚ) = 24, ζ_ℚ(−1) = +2/24 is false: dropping the sign (−1)^{[F:ℚ]} breaks the formula for ℚ.
- `TauCeti.BirchTate.not_birchTateFormula_rat_field` (degenerate): K₂ of the field ℚ is infinite (ArithmeticKTheory N.8/the-rationals-infinite-against-finite), so Nat.card (K2 ℚ) = 0 and the formula with K2 ℚ in place of K2 (𝓞 ℚ) would force ζ_ℚ(−1) = 0, which is false: the ring of integers, not the field, is required.
- `TauCeti.BirchTate.not_birchTateFormula_of_zeta_eq_zero` (non-example): If ζ_F(−1) = 0 the formula fails; this is the case of ℚ(i), where ζ_{ℚ(i)}(−1) = 0 and K₂(ℤ[i]) = 0 (ArithmeticKTheory N.8/gaussian-and-imaginary-quadratic).

**Direct dependencies.** `BorelRegulators:R.5/completed-zeta-conventions`, `K2SymbolsBrauer:T.1/k2-definition`, `ArithmeticKTheory:N.3:ranks/even-K-groups-of-S-integers-are-finite`, `ArithmeticKTheory:N.4/the-w-invariant`, `ArithmeticKTheory:N.4/finiteness-of-the-w-invariant`, `mathlib:NumberField.dedekindZeta`, `mathlib:NumberField.IsTotallyReal`, `mathlib:Module.finrank`, `mathlib:NumberField.RingOfIntegers`.

**Source passages.** [The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.6, Birch–Tate Conjecture 8.6, PDF p. 523 (book p. 515): The formula of B.1, with (−1)^{r_1} = (−1)^{[F:ℚ]} for totally real F.; [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 2, §3, Birch-Tate Conjecture 3.5, p. 15: The same conjecture with the sign left open; the sign is B.2/zeta-minus-one-sign.; [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 2, §3, before Corollary 3.4, p. 15: w₂(F) is the order of H⁰(F, ℚ/ℤ(2)), the N.4 invariant, not the number of roots of unity in F.

**Acceptance.** For F = ℚ the formula reads −1/12 = (−1)·2/24 and holds (B.3/birch-tate-for-the-rationals). Replacing w₂ by w₁ = #μ(F), or the ring of integers by the field, or dropping the sign, makes the formula false for ℚ (the unit tests).

**Stage status: planned.** The imported continuation/completion adapter is BorelRegulators:R.5/completed-zeta-conventions (latest supplier review needs_changes). K₂ finiteness and W₂ positivity are exact N.3:ranks/N.4 imports; no duplicate construction is planned.

## B.2 — Rationality, sign and primewise reconstruction

<a id="B-2-gamma-factor-values"></a>

### The real gamma factor at −1 and at 2

**Lemma** `SpecialValuesBirchTate:B.2/gamma-factor-values`. Declaration: `TauCeti.BirchTate.gammaℝ_neg_one`.

Mathlib's real archimedean factor Γ_ℝ(s) = π^{−s/2} Γ(s/2) (Complex.Gammaℝ) satisfies Γ_ℝ(−1) = −2π and Γ_ℝ(2) = 1/π. In particular −1 is not a pole of Γ_ℝ: its poles are 0, −2, −4, … (Complex.Gammaℝ_eq_zero_iff describes the totalised zeros of Mathlib's version at exactly these points).

**Hypotheses and boundary.** None.

**Construction or proof.**

1. Γ_ℝ(−1) = π^{1/2} Γ(−1/2). By Complex.Gamma_add_one at s = −1/2 (s ≠ 0), Γ(1/2) = (−1/2) Γ(−1/2), so Γ(−1/2) = −2 Γ(1/2) = −2 π^{1/2} (Complex.Gamma_one_half_eq). Hence Γ_ℝ(−1) = π^{1/2} · (−2π^{1/2}) = −2π.
2. Γ_ℝ(2) = π^{−1} Γ(1) = 1/π (Complex.Gamma_one).

**Direct dependencies.** `mathlib:Complex.Gammaℝ`, `mathlib:Complex.Gamma_add_one`, `mathlib:Complex.Gamma_one_half_eq`, `mathlib:Complex.Gammaℝ_eq_zero_iff`, `mathlib:Complex.Gamma_one`.

**Source passages.** [The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.8, proof, PDF p. 524 (book p. 516): The sign theorem at k = 1; the proof below derives it from the functional equation.

**Acceptance.** Γ_ℝ(−1) is a negative real number; a sign slip here reverses the sign theorem for every field of odd degree, and ℚ detects it (ζ(−1) = −1/12 < 0).

<a id="B-2-dedekind-zeta-real-positive"></a>

### ζ_F is real and at least one on the real half-line σ > 1

**Lemma** `SpecialValuesBirchTate:B.2/dedekind-zeta-real-positive`. Declaration: `TauCeti.BirchTate.one_le_dedekindZeta_ofReal`.

For every number field F and real σ > 1, NumberField.dedekindZeta F σ is a real number and 1 ≤ ζ_F(σ); in particular ζ_F(2) > 0.

**Hypotheses and boundary.** F a number field; σ ∈ ℝ with σ > 1.

**Construction or proof.**

1. ζ_F(σ) = Σ_{n ≥ 1} a_n n^{−σ} with a_n = TauCeti.dedekindZetaCoeff F n, the number of ideals of 𝓞_F of absolute norm n (TauCeti.dedekindZeta_eq_LSeries_dedekindZetaCoeff); the series converges absolutely for σ > 1 (TauCeti.LSeriesSummable_dedekindZetaCoeff_iff).
2. Every term a_n n^{−σ} is a nonnegative real, and a_1 = 1 because the only ideal of norm 1 is 𝓞_F itself (Ideal.absNorm_eq_one_iff). A summable series of nonnegative reals is at least any one of its terms, so ζ_F(σ) ≥ a_1 = 1.

**Direct dependencies.** `tauceti:TauCeti.dedekindZeta_eq_LSeries_dedekindZetaCoeff`, `tauceti:TauCeti.dedekindZetaCoeff`, `tauceti:TauCeti.LSeriesSummable_dedekindZetaCoeff_iff`, `mathlib:Ideal.absNorm_eq_one_iff`, `mathlib:LSeries`.

**Source passages.** [The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.8, proof, PDF p. 524 (book p. 516): The sign theorem at k = 1; the proof below derives it from the functional equation.

**Acceptance.** For F = ℚ and σ = 2 the value is ζ(2) = π²/6 ≈ 1.645 ≥ 1 (riemannZeta_two).

<a id="B-2-zeta-via-reciprocal-gamma"></a>

### ζ_F from the completed zeta function through the reciprocal gamma factors

**Lemma** `SpecialValuesBirchTate:B.2/zeta-via-reciprocal-gamma`. Declaration: `TauCeti.BirchTate.dedekindZeta_eq_inv_gamma_mul_completed`.

Let F be a number field with r_1 real and r_2 complex places, d_F its discriminant and Λ_F(s) = |d_F|^{s/2} Γ_ℝ(s)^{r_1} Γ_ℂ(s)^{r_2} ζ_F(s) its completed zeta function (R.5/completed-zeta-conventions; Γ_ℝ, Γ_ℂ are Mathlib's Complex.Gammaℝ and Complex.Gammaℂ), holomorphic on ℂ ∖ {0, 1} with Λ_F(1 − s) = Λ_F(s). Then for every s ∈ ℂ ∖ {0, 1}, ζ_F(s) = |d_F|^{−s/2} · (Γ_ℝ(s)⁻¹)^{r_1} · (Γ_ℂ(s)⁻¹)^{r_2} · Λ_F(s), where Γ_ℝ⁻¹ and Γ_ℂ⁻¹ = (2π)^s/(2Γ(s)) are the entire reciprocal gamma factors. The value of ζ_F at a pole of a gamma factor is obtained from this identity of holomorphic functions, never by evaluating Λ_F divided by a gamma factor that Lean totalises to zero.

**Hypotheses and boundary.** F a number field; ζ_F and Λ_F as imported from R.5/completed-zeta-conventions.

**Construction or proof.**

1. On Re s > 1 all gamma factors are nonzero (Complex.Gammaℝ_ne_zero_of_re_pos and Γ(s) ≠ 0), and the identity is the definition of Λ_F rearranged.
2. Both sides are holomorphic on U = ℂ ∖ {0, 1}: the left by R.5/completed-zeta-conventions, the right because Γ_ℝ⁻¹ (Complex.differentiable_Gammaℝ_inv) and 1/Γ (Complex.differentiable_one_div_Gamma) are entire and Λ_F is holomorphic on U.
3. U is connected (the complement of a finite set in ℂ), so the identity principle AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq, applied at a point of Re s > 1, extends the equality to all of U.

**Direct dependencies.** `BorelRegulators:R.5/completed-zeta-conventions`, `mathlib:Complex.Gammaℝ`, `mathlib:Complex.Gammaℂ`, `mathlib:Complex.Gammaℝ_ne_zero_of_re_pos`, `mathlib:Complex.differentiable_Gammaℝ_inv`, `mathlib:Complex.differentiable_one_div_Gamma`, `mathlib:AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, `mathlib:NumberField.discr`.

**Source passages.** [The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.8, proof, PDF p. 524 (book p. 516): The sign theorem at k = 1; the proof below derives it from the functional equation.; [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 2, §3, after Conjecture 3.5, p. 15: For n = 2 the order is r_2, so ζ_F(−1) = 0 as soon as F has a complex place.

**Acceptance.** At s = −1 and r_2 ≥ 1 the right side vanishes because 1/Γ(−1) = 0, which is the zero of ζ_F at −1; at s = −1 and r_2 = 0 no gamma factor has a pole and the right side is |d_F|^{1/2} Γ_ℝ(−1)^{−r_1} Λ_F(2).

<a id="B-2-zeta-minus-one-sign"></a>

### The sign of ζ_F(−1) for a totally real field

**Theorem** `SpecialValuesBirchTate:B.2/zeta-minus-one-sign`. Declaration: `TauCeti.BirchTate.neg_one_pow_mul_dedekindZeta_neg_one_pos`.

Let F be a totally real number field of degree n = [F:ℚ] and discriminant d_F. Then ζ_F(−1) = (−1)^n · |d_F|^{3/2} · ζ_F(2) / (2π²)^n. Consequently ζ_F(−1) is a nonzero real number and (−1)^n ζ_F(−1) > 0.

**Hypotheses and boundary.** F totally real (NumberField.IsTotallyReal F), so r_1 = n and r_2 = 0.

**Construction or proof.**

1. r_2 = 0 (NumberField.IsTotallyReal.nrComplexPlaces_eq_zero) and r_1 = n (NumberField.InfinitePlace.card_add_two_mul_card_eq_rank).
2. B.2/zeta-via-reciprocal-gamma at s = −1: ζ_F(−1) = |d_F|^{1/2} Γ_ℝ(−1)^{−n} Λ_F(−1), and the functional equation gives Λ_F(−1) = Λ_F(2).
3. At s = 2 every factor is regular: Λ_F(2) = |d_F| Γ_ℝ(2)^n ζ_F(2) = |d_F| π^{−n} ζ_F(2) (B.2/gamma-factor-values).
4. With Γ_ℝ(−1) = −2π (B.2/gamma-factor-values): ζ_F(−1) = |d_F|^{1/2} (−2π)^{−n} |d_F| π^{−n} ζ_F(2) = (−1)^n |d_F|^{3/2} ζ_F(2)/(2π²)^n.
5. ζ_F(2) is a real number ≥ 1 (B.2/dedekind-zeta-real-positive), and |d_F| ≥ 1, so (−1)^n ζ_F(−1) is a positive real.

**Direct dependencies.** `SpecialValuesBirchTate:B.2/zeta-via-reciprocal-gamma`, `SpecialValuesBirchTate:B.2/gamma-factor-values`, `SpecialValuesBirchTate:B.2/dedekind-zeta-real-positive`, `BorelRegulators:R.5/completed-zeta-conventions`, `mathlib:NumberField.IsTotallyReal.nrComplexPlaces_eq_zero`, `mathlib:NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`, `mathlib:NumberField.discr`.

**Source passages.** [The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.8, proof, PDF p. 524 (book p. 516): The sign theorem at k = 1; the proof below derives it from the functional equation.; [The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.6, Birch–Tate Conjecture 8.6, PDF p. 523 (book p. 515): The formula of B.1, with (−1)^{r_1} = (−1)^{[F:ℚ]} for totally real F.

**Acceptance.** For F = ℚ (n = 1, d = 1): ζ(−1) = −ζ(2)/(2π²) = −(π²/6)/(2π²) = −1/12, agreeing with B.3/zeta-of-the-rationals-at-minus-one. For F = ℚ(√5) (n = 2, d = 5): the sign is +, agreeing with ζ_{ℚ(√5)}(−1) = 1/30 (B.3/sqrt-five-zeta-at-minus-one).

<a id="B-2-formula-fails-with-complex-place"></a>

### The formula is false for a field with a complex place

**Theorem** `SpecialValuesBirchTate:B.2/formula-fails-with-complex-place`. Declaration: `TauCeti.BirchTate.not_birchTateFormula_of_nrComplexPlaces_pos`.

Let F be a number field with r_2 ≥ 1 complex places. Then ζ_F(−1) = 0, and BirchTateFormula(F) is false. This is why the conjecture is stated for totally real fields only; the vanishing at −1 has order exactly r_2 (BorelRegulators R.5), which is a zero and not the pole printed in the K-book (ArithmeticKTheory/E18).

**Hypotheses and boundary.** F a number field with NumberField.InfinitePlace.nrComplexPlaces F ≥ 1.

**Construction or proof.**

1. By B.2/zeta-via-reciprocal-gamma at s = −1, ζ_F(−1) contains the factor (Γ_ℂ(−1)⁻¹)^{r_2} with Γ_ℂ(−1)⁻¹ = (2π)^{−1}/(2Γ(−1)) read through the entire function 1/Γ, which vanishes at −1 (Γ has a pole there). With r_2 ≥ 1 the product is 0.
2. The right side of the formula is ± #K₂(𝓞_F)/w₂(F) with #K₂(𝓞_F) ≥ 1 (a finite group, ArithmeticKTheory N.3/finiteness-and-ranks-combined) and w₂(F) ≥ 1, hence nonzero (B.1/birch-tate-formula, zeta_ne_zero).

**Direct dependencies.** `SpecialValuesBirchTate:B.2/zeta-via-reciprocal-gamma`, `SpecialValuesBirchTate:B.1/birch-tate-formula`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `ArithmeticKTheory:N.4/finiteness-of-the-w-invariant`, `mathlib:Complex.differentiable_one_div_Gamma`, `mathlib:Complex.Gamma_neg_nat_eq_zero`.

**Source passages.** [The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.6, PDF p. 523 (book p. 515); corrected in ArithmeticKTheory/E18: Read with the correction recorded as ArithmeticKTheory/E18: a zero, not a pole, of order r_2.; [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 2, §3, after Conjecture 3.5, p. 15: For n = 2 the order is r_2, so ζ_F(−1) = 0 as soon as F has a complex place.

**Acceptance.** For F = ℚ(i): ζ_{ℚ(i)}(−1) = 0 while #K₂(ℤ[i])/w₂(ℚ(i)) = 1/24 (ArithmeticKTheory N.8/gaussian-and-imaginary-quadratic).

<a id="B-2-positive-rational-from-valuations"></a>

### A positive rational number is determined by its prime valuations

**Lemma** `SpecialValuesBirchTate:B.2/positive-rational-from-valuations`. Declaration: `TauCeti.BirchTate.rat_eq_iff_forall_padicValRat_eq`.

For positive rational numbers q and r: q = r if and only if padicValRat p q = padicValRat p r for every prime p.

**Hypotheses and boundary.** q > 0 and r > 0 in ℚ.

**Construction or proof.**

1. Write q = a/b and r = c/d in lowest terms with a, b, c, d positive naturals (Rat.num_div_den; positivity makes the numerators positive). Then padicValRat p q = v_p(a) − v_p(b) and similarly for r (padicValRat.div, padicValRat.of_nat).
2. Equal valuations give v_p(a·d) = v_p(c·b) for every prime p (padicValRat.mul), so a·d = c·b by Nat.eq_iff_prime_padicValNat_eq (both products nonzero), hence q = r. The converse is immediate.

**Direct dependencies.** `mathlib:padicValRat`, `mathlib:padicValRat.div`, `mathlib:padicValRat.mul`, `mathlib:padicValRat.of_nat`, `mathlib:Nat.eq_iff_prime_padicValNat_eq`, `mathlib:Rat.num_div_den`.

**Source passages.** [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 2, §3, Birch-Tate Conjecture 3.5, p. 15: The same conjecture with the sign left open; the sign is B.2/zeta-minus-one-sign.

**Acceptance.** Positivity is needed: q = −1 and r = 1 have the same valuation 0 at every prime. 2/24 and 1/12 have the same valuations (v_2 = −2, v_3 = −1, all others 0), as the lemma requires.

<a id="B-2-birch-tate-iff-absolute-value"></a>

### The absolute-value form of the formula

**Theorem** `SpecialValuesBirchTate:B.2/birch-tate-iff-absolute-value`. Declaration: `TauCeti.BirchTate.birchTateFormula_iff_abs`.

For a totally real number field F: BirchTateFormula(F) holds if and only if |ζ_F(−1)| = #K₂(𝓞_F)/w₂(F).

**Hypotheses and boundary.** F totally real.

**Construction or proof.**

1. By B.2/zeta-minus-one-sign, ζ_F(−1) = (−1)^{[F:ℚ]} |ζ_F(−1)|, so the formula is equivalent to (−1)^{[F:ℚ]}|ζ_F(−1)| = (−1)^{[F:ℚ]} #K₂(𝓞_F)/w₂(F); cancel the unit (−1)^{[F:ℚ]}.

**Direct dependencies.** `SpecialValuesBirchTate:B.1/birch-tate-formula`, `SpecialValuesBirchTate:B.2/zeta-minus-one-sign`.

**Source passages.** [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 2, §3, Birch-Tate Conjecture 3.5, p. 15: The same conjecture with the sign left open; the sign is B.2/zeta-minus-one-sign.; [The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.6, Birch–Tate Conjecture 8.6, PDF p. 523 (book p. 515): The formula of B.1, with (−1)^{r_1} = (−1)^{[F:ℚ]} for totally real F.

**Acceptance.** The analytic sign is used once, here; the arithmetic (B.4–B.6) proves only the absolute value, prime by prime.

<a id="B-2-birch-tate-iff-valuations"></a>

### The primewise form of the Birch–Tate formula

**Theorem** `SpecialValuesBirchTate:B.2/birch-tate-iff-valuations`. Declaration: `TauCeti.BirchTate.birchTateFormula_iff_padicValRat`.

Let F be totally real and let q ∈ ℚ with ζ_F(−1) = q (B.2/zeta-minus-one-rationality). Then BirchTateFormula(F) holds if and only if, for every prime ℓ, v_ℓ(#K₂(𝓞_F)) = v_ℓ(w₂(F)) + v_ℓ(|q|), with v_ℓ = padicValNat on the naturals and padicValRat on |q|.

**Hypotheses and boundary.** F totally real; q ∈ ℚ with (q : ℂ) = ζ_F(−1).

**Construction or proof.**

1. By B.2/birch-tate-iff-absolute-value the formula is |q| = #K₂(𝓞_F)/w₂(F), an equation between positive rationals (q ≠ 0 by B.2/zeta-minus-one-sign; #K₂ ≥ 1, w₂ ≥ 1).
2. By B.2/positive-rational-from-valuations it holds if and only if v_ℓ(|q|) = v_ℓ(#K₂(𝓞_F)/w₂(F)) = v_ℓ(#K₂(𝓞_F)) − v_ℓ(w₂(F)) for all ℓ (padicValRat.div, padicValRat.of_nat).

**Direct dependencies.** `SpecialValuesBirchTate:B.2/birch-tate-iff-absolute-value`, `SpecialValuesBirchTate:B.2/positive-rational-from-valuations`, `SpecialValuesBirchTate:B.2/zeta-minus-one-sign`, `ArithmeticKTheory:N.4/finiteness-of-the-w-invariant`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `mathlib:padicValRat.div`, `mathlib:padicValRat.of_nat`, `SpecialValuesBirchTate:B.2/zeta-minus-one-rationality`.

**Source passages.** [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 2, §3, Birch-Tate Conjecture 3.5, p. 15: The same conjecture with the sign left open; the sign is B.2/zeta-minus-one-sign.; [The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.6, Birch–Tate Conjecture 8.6, PDF p. 523 (book p. 515): The formula of B.1, with (−1)^{r_1} = (−1)^{[F:ℚ]} for totally real F.

**Acceptance.** For ℚ: q = −1/12, #K₂ = 2, w₂ = 24: v_2: 1 = 3 + (−2); v_3: 0 = 1 + (−1); all other ℓ: 0 = 0 + 0. This is the form the odd-primary theorem (B.4) proves for each odd ℓ, keeping the sign apart.

<a id="B-2-denominator-consequence"></a>

### The denominator of ζ_F(−1) divides w₂(F), given the formula

**Theorem** `SpecialValuesBirchTate:B.2/denominator-consequence`. Declaration: `TauCeti.BirchTate.BirchTateFormula.w2_mul_zeta_eq_intCast`.

Let F be totally real and suppose BirchTateFormula(F). Then w₂(F) · ζ_F(−1) = (−1)^{[F:ℚ]} #K₂(𝓞_F) is an integer; hence ζ_F(−1) is rational and, written in lowest terms, its denominator divides w₂(F). The consequence is drawn from the identity; it is not used to prove the identity, and it is not a substitute for the independent Deligne–Ribet integrality (requested from AutomorphicPadicLFunctions L3).

**Hypotheses and boundary.** F totally real; BirchTateFormula(F).

**Construction or proof.**

1. Multiply the formula by w₂(F) ≠ 0 (B.1/birch-tate-formula, birchTateFormula_iff_mul).
2. If w·z = m ∈ ℤ with w ≥ 1 then z = m/w ∈ ℚ and its reduced denominator divides w (Rat.den_dvd).

**Direct dependencies.** `SpecialValuesBirchTate:B.1/birch-tate-formula`, `ArithmeticKTheory:N.4/finiteness-of-the-w-invariant`, `mathlib:Rat.den_dvd`.

**Source passages.** [The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.6, Birch–Tate Conjecture 8.6, PDF p. 523 (book p. 515): The formula of B.1, with (−1)^{r_1} = (−1)^{[F:ℚ]} for totally real F.

**Acceptance.** For ℚ: 24 · (−1/12) = −2 ∈ ℤ, and the denominator 12 divides 24.

<a id="B-2-zeta-minus-one-rationality"></a>

### Rationality of the negative zeta value

**Theorem** `SpecialValuesBirchTate:B.2/zeta-minus-one-rationality`. Declaration: `TauCeti.BirchTate.exists_rat_dedekindZeta_neg_one`.

For a totally real number field F there is a unique nonzero rational q_F with ζ_F(−1) = q_F. Its sign is (−1)^[F:ℚ].

**Hypotheses and boundary.** F is totally real.

**Construction or proof.**

1. BorelRegulators:R.5/zeta-zero-order gives order zero at −1, so the leading coefficient is the value.
2. The degree-three K-group has rank r₂ = 0, so BorelRegulators:R.4/regulator-covolume equals 1. BorelRegulators:R.5/borel-zeta-proportionality makes |ζ_F(−1)| rational.
3. B.2/zeta-minus-one-sign restores the sign, gives nonvanishing, and makes the rational value unique. This is independent of Birch–Tate; Cohen’s Siegel theorem supplies the historical alternative.

**Direct dependencies.** `SpecialValuesBirchTate:B.2/zeta-minus-one-sign`, `BorelRegulators:R.4/regulator-covolume`, `BorelRegulators:R.5/zeta-zero-order`, `BorelRegulators:R.5/zeta-leading-coefficient`, `BorelRegulators:R.5/borel-zeta-proportionality`, `ArithmeticKTheory:N.3:ranks/borel-rank-theorem`.

**Source passages.** [Number Theory, Volume II: Analytic and Modern Tools](https://maths.dur.ac.uk/users/herbert.gangl/ch.pdf), §10.5.1, Theorem 10.5.3, p. 218: Siegel’s rationality theorem for totally real negative odd integers.; [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 2 §3, p. 15: Rank-zero case of the leading-term and regulator conventions.

**Acceptance.** For ℚ, q_F = −1/12; for ℚ(√5), q_F = 1/30. No K₂ order enters the rationality proof.

<a id="B-2-independent-denominator-integrality"></a>

### Deligne–Ribet denominator integrality

**Theorem** `SpecialValuesBirchTate:B.2/independent-denominator-integrality`. Declaration: `TauCeti.BirchTate.wInvariant_two_mul_zeta_neg_one_integral`.

For totally real F, the rational value q_F = ζ_F(−1) satisfies w₂(F)q_F ∈ ℤ, hence its reduced denominator divides w₂(F), independently of Birch–Tate.

**Hypotheses and boundary.** F totally real; q_F is the independently established rational value.

**Construction or proof.**

1. Use the Deligne–Ribet integrality theorem Ann_{ℤ[G]} H⁰(E,ℚ/ℤ(n)) · θ^S_{E/F}(1−n) ⊆ ℤ[G] in AutomorphicPadicLFunctions:L3.
2. Specialize to E = F, G trivial, n = 2 and the untruncated value. The annihilator of the finite cyclic W₂(F) is w₂(F)ℤ.
3. The reduced denominator divides w₂(F) by rational denominator arithmetic. This uses the integral theorem, rather than guessing that an expected tame-kernel order is integral.

**Direct dependencies.** `SpecialValuesBirchTate:B.2/zeta-minus-one-rationality`, `ArithmeticKTheory:N.4/the-w-invariant`, `ArithmeticKTheory:N.4/finiteness-of-the-w-invariant`, `AutomorphicPadicLFunctions:L3`, `mathlib:Rat.den_dvd`.

**Source passages.** [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 2 §4, p. 16, Deligne–Ribet integrality preceding Conjecture 4.1: The annihilator-integrality assertion specializes to the denominator bound at the trivial extension.

**Acceptance.** 24·(−1/12)=−2; 120·(1/30)=4. These are denominator checks, not independent computations of tame-kernel orders.

**Stage status: planned.** Discharge the exact Deligne–Ribet untruncated integrality request to L3. Rationality is now a target node using the Borel rank-zero supplier; validate that supplier’s normalization in its review.

## B.3 — Independent rational and real quadratic examples

<a id="B-3-dedekind-zeta-of-the-rationals"></a>

### The continued Dedekind zeta function of ℚ is the Riemann zeta function

**Theorem** `SpecialValuesBirchTate:B.3/dedekind-zeta-of-the-rationals`. Declaration: `TauCeti.BirchTate.dedekindZeta_rat_eq_riemannZeta`.

The continued Dedekind zeta function of ℚ (R.5/completed-zeta-conventions) equals Mathlib's riemannZeta on ℂ ∖ {1}.

**Hypotheses and boundary.** None.

**Construction or proof.**

1. On Re s > 1: NumberField.dedekindZeta ℚ s = LSeries (dedekindZetaCoeff ℚ) s (TauCeti.dedekindZeta_eq_LSeries_dedekindZetaCoeff); every coefficient is 1 (TauCeti.dedekindZetaCoeff_rat; the n = 0 term, which counts the zero ideal, is not part of an LSeries), so it is LSeries 1 s = riemannZeta s (LSeries_one_eq_riemannZeta).
2. Both functions are holomorphic on the connected set ℂ ∖ {1} (R.5/completed-zeta-conventions; riemannZeta by differentiableAt_riemannZeta), so they agree there by the identity principle.

**Direct dependencies.** `BorelRegulators:R.5/completed-zeta-conventions`, `tauceti:TauCeti.dedekindZeta_eq_LSeries_dedekindZetaCoeff`, `tauceti:TauCeti.dedekindZetaCoeff_rat`, `mathlib:LSeries_one_eq_riemannZeta`, `mathlib:differentiableAt_riemannZeta`, `mathlib:AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`.

**Source passages.** [The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.6, the paragraph after Conjecture 8.6, PDF p. 523 (book p. 515): The three independent inputs of Birch–Tate for ℚ.

**Acceptance.** The comparison is with Mathlib's continued riemannZeta, so ζ_ℚ(−1) comes from the existing Bernoulli theory and not from the Birch–Tate formula.

<a id="B-3-zeta-of-the-rationals-at-minus-one"></a>

### ζ_ℚ(−1) = −1/12

**Lemma** `SpecialValuesBirchTate:B.3/zeta-of-the-rationals-at-minus-one`. Declaration: `TauCeti.BirchTate.dedekindZeta_rat_neg_one`.

The continued Dedekind zeta function of ℚ takes the value −1/12 at s = −1.

**Hypotheses and boundary.** None.

**Construction or proof.**

1. By B.3/dedekind-zeta-of-the-rationals, ζ_ℚ(−1) = riemannZeta(−1).
2. riemannZeta_neg_nat_eq_bernoulli at k = 1 gives riemannZeta(−1) = (−1)^1 · bernoulli 2 / 2, and bernoulli_two gives bernoulli 2 = 1/6, so the value is −1/12.

**Direct dependencies.** `SpecialValuesBirchTate:B.3/dedekind-zeta-of-the-rationals`, `mathlib:riemannZeta_neg_nat_eq_bernoulli`, `mathlib:bernoulli_two`.

**Source passages.** [The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.6, the paragraph after Conjecture 8.6, PDF p. 523 (book p. 515): The three independent inputs of Birch–Tate for ℚ.

**Acceptance.** The sign is negative, as B.2/zeta-minus-one-sign requires for [ℚ:ℚ] = 1.

<a id="B-3-k2-of-the-rationals-ring-of-integers"></a>

### #K₂(𝓞_ℚ) = 2

**Lemma** `SpecialValuesBirchTate:B.3/k2-of-the-rationals-ring-of-integers`. Declaration: `TauCeti.BirchTate.natCard_K2_ringOfIntegers_rat`.

Nat.card K₂(𝓞_ℚ) = 2.

**Hypotheses and boundary.** None.

**Construction or proof.**

1. Rat.ringOfIntegersEquiv : 𝓞_ℚ ≃+* ℤ, and K₂ is a functor (K2SymbolsBrauer T.1/k2-definition, K2.map), so it carries ring isomorphisms to group isomorphisms and #K₂(𝓞_ℚ) = #K₂(ℤ).
2. K₂(ℤ) is cyclic of order two, generated by {−1, −1} (K2SymbolsBrauer T.5/k2-of-the-integers); that computation does not use the Birch–Tate formula.

**Direct dependencies.** `K2SymbolsBrauer:T.1/k2-definition`, `K2SymbolsBrauer:T.5/k2-of-the-integers`, `mathlib:Rat.ringOfIntegersEquiv`.

**Source passages.** [The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.6, the paragraph after Conjecture 8.6, PDF p. 523 (book p. 515): The three independent inputs of Birch–Tate for ℚ.

**Acceptance.** The upper bound in T.5/k2-of-the-integers (Milnor's computation in St(ℤ)) is recorded there as a gap, and this lemma inherits it.

<a id="B-3-birch-tate-for-the-rationals"></a>

### The Birch–Tate formula for ℚ

**Theorem** `SpecialValuesBirchTate:B.3/birch-tate-for-the-rationals`. Declaration: `TauCeti.BirchTate.birchTateFormula_rat`.

BirchTateFormula(ℚ) holds: ζ_ℚ(−1) = −1/12 = (−1)^1 · 2/24, from three independently established values: ζ_ℚ(−1) = −1/12 (B.3/zeta-of-the-rationals-at-minus-one), #K₂(ℤ) = 2 (B.3/k2-of-the-rationals-ring-of-integers) and w₂(ℚ) = 24 (ArithmeticKTheory N.4/w2-of-the-rationals-and-the-divisibility-tests).

**Hypotheses and boundary.** None.

**Construction or proof.**

1. [ℚ:ℚ] = 1 (Module.finrank_self).
2. Substitute the three values: (−1)^1 · 2/24 = −1/12.

**Direct dependencies.** `SpecialValuesBirchTate:B.1/birch-tate-formula`, `SpecialValuesBirchTate:B.3/zeta-of-the-rationals-at-minus-one`, `SpecialValuesBirchTate:B.3/k2-of-the-rationals-ring-of-integers`, `ArithmeticKTheory:N.4/w2-of-the-rationals-and-the-divisibility-tests`, `mathlib:Module.finrank_self`.

**Source passages.** [The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.6, the paragraph after Conjecture 8.6, PDF p. 523 (book p. 515): The three independent inputs of Birch–Tate for ℚ.; [The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.6, Birch–Tate Conjecture 8.6, PDF p. 523 (book p. 515): The formula of B.1, with (−1)^{r_1} = (−1)^{[F:ℚ]} for totally real F.

**Acceptance.** Sign: the unsigned right side +1/12 is wrong. Twist: w₁(ℚ) = 2 in place of w₂(ℚ) = 24 gives −1. Denominator: 12 divides w₂(ℚ) = 24 (B.2/denominator-consequence). Each is a unit test of B.1/birch-tate-formula.

<a id="B-3-sqrt-five-ideal-count"></a>

### Ideals of ℚ(√5) of norm n are counted by the character mod 5

**Lemma** `SpecialValuesBirchTate:B.3/sqrt-five-ideal-count`. Declaration: `TauCeti.BirchTate.dedekindZetaCoeff_sqrtFive_eq_convolution`.

Let F = ℚ(√5) and χ₅ the quadratic character mod 5, χ₅(n) = legendreSym 5 n (zero on multiples of 5), viewed as a Dirichlet character ℂ-valued of level 5. For every n ≥ 1 the number of ideals of 𝓞_F of absolute norm n is Σ_{d | n} χ₅(d); that is, dedekindZetaCoeff F = 1 ⍟ χ₅ on n ≥ 1 (Dirichlet convolution).

**Hypotheses and boundary.** F = ℚ(√5), with θ = √5, minpoly ℤ θ = X² − 5, 5 squarefree and 5 ≡ 1 (mod 4).

**Construction or proof.**

1. 𝓞_F = ℤ[ω] with ω = (1 + √5)/2 (Tau Ceti NumberField.adjoin_halfGen_eq_top_of_mod_four_eq_one), and ω has minimal polynomial X² − X − 1 of discriminant 5.
2. Both sides are multiplicative in n: the ideal count by unique factorisation of ideals and multiplicativity of the absolute norm (the Euler product of TauCeti.dedekindZeta_eulerProduct_hasProd), the divisor sum as a convolution of multiplicative functions. So it suffices to take n = p^k.
3. Splitting of p in 𝓞_F by Kummer–Dedekind (KummerDedekind.normalizedFactorsMapEquivNormalizedFactorsMinPolyMk; the conductor of ℤ[ω] is the whole ring): p = 5 ramifies (X² − X − 1 ≡ (X − 3)² mod 5); p = 2 is inert (X² + X + 1 is irreducible mod 2) and χ₅(2) = −1; for odd p ≠ 5, p splits exactly when 5 is a square mod p, which by quadratic reciprocity (legendreSym.quadratic_reciprocity_one_mod_four, 5 ≡ 1 mod 4) is χ₅(p) = 1, and is inert when χ₅(p) = −1.
4. Count ideals of norm p^k: split, k + 1 = Σ_{j ≤ k} 1^j; inert, 1 if k is even and 0 if odd = Σ_{j ≤ k} (−1)^j; ramified, 1 = 1 + 0 + ⋯. In each case this is Σ_{d | p^k} χ₅(d).

**Direct dependencies.** `tauceti:NumberField.adjoin_halfGen_eq_top_of_mod_four_eq_one`, `tauceti:TauCeti.dedekindZetaCoeff`, `tauceti:TauCeti.dedekindZeta_eulerProduct_hasProd`, `mathlib:KummerDedekind.normalizedFactorsMapEquivNormalizedFactorsMinPolyMk`, `mathlib:legendreSym`, `mathlib:legendreSym.quadratic_reciprocity_one_mod_four`, `mathlib:LSeries.convolution`, `mathlib:DirichletCharacter`, `mathlib:Ideal.absNorm`.

**Source passages.** [Number Theory, Volume II: Analytic and Modern Tools](https://maths.dur.ac.uk/users/herbert.gangl/ch.pdf), §10.5.2, Proposition 10.5.5, printed p. 219: Quadratic splitting at every prime gives ζ_F = ζ·L(χ_D); specialize the fundamental discriminant to D = 5.

**Acceptance.** n = 4: one ideal (2𝓞_F, as 2 is inert), and Σ_{d | 4} χ₅(d) = 1 − 1 + 1 = 1. n = 11: two ideals (11 = (4 + √5)(4 − √5) up to units), and χ₅(1) + χ₅(11) = 2.

<a id="B-3-sqrt-five-zeta-factorisation"></a>

### ζ_{ℚ(√5)} = ζ · L(χ₅)

**Theorem** `SpecialValuesBirchTate:B.3/sqrt-five-zeta-factorisation`. Declaration: `TauCeti.BirchTate.dedekindZeta_sqrtFive_eq_mul_LFunction`.

For F = ℚ(√5), the continued Dedekind zeta function satisfies ζ_F(s) = riemannZeta(s) · L(s, χ₅) for every s ≠ 1, where L(s, χ₅) is Mathlib's continued DirichletCharacter.LFunction χ₅.

**Hypotheses and boundary.** F = ℚ(√5).

**Construction or proof.**

1. On Re s > 1: both series converge absolutely, so LSeries (1 ⍟ χ₅) s = LSeries 1 s · LSeries χ₅ s (LSeries_convolution'), which is riemannZeta s · L(s, χ₅) (LSeries_one_eq_riemannZeta, DirichletCharacter.LFunction_eq_LSeries). By B.3/sqrt-five-ideal-count the left side is NumberField.dedekindZeta F s.
2. L(·, χ₅) is entire because χ₅ ≠ 1 (DirichletCharacter.differentiable_LFunction), riemannZeta is holomorphic off 1, and ζ_F is holomorphic off 1 (R.5/completed-zeta-conventions); the identity principle on the connected set ℂ ∖ {1} finishes.

**Direct dependencies.** `SpecialValuesBirchTate:B.3/sqrt-five-ideal-count`, `BorelRegulators:R.5/completed-zeta-conventions`, `mathlib:LSeries_convolution'`, `mathlib:LSeries_one_eq_riemannZeta`, `mathlib:DirichletCharacter.LFunction_eq_LSeries`, `mathlib:DirichletCharacter.differentiable_LFunction`, `mathlib:DirichletCharacter.LFunction`, `mathlib:AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`.

**Source passages.** [Number Theory, Volume II: Analytic and Modern Tools](https://maths.dur.ac.uk/users/herbert.gangl/ch.pdf), §10.5.2, Proposition 10.5.5, printed p. 219: Quadratic splitting at every prime gives ζ_F = ζ·L(χ_D); specialize the fundamental discriminant to D = 5.

**Acceptance.** On the convergence half-plane the equality is the existing L-series convolution identity; continuation gives the equality at −1. The D = 5 example includes the ramified prime 5 and the inert prime 2.

<a id="B-3-sqrt-five-zeta-at-minus-one"></a>

### ζ_{ℚ(√5)}(−1) = 1/30

**Lemma** `SpecialValuesBirchTate:B.3/sqrt-five-zeta-at-minus-one`. Declaration: `TauCeti.BirchTate.dedekindZeta_sqrtFive_neg_one`.

For F = ℚ(√5): L(−1, χ₅) = −2/5, and ζ_F(−1) = (−1/12)·(−2/5) = 1/30.

**Hypotheses and boundary.** F = ℚ(√5).

**Construction or proof.**

1. χ₅ is even, so ZMod.LFunction_def_even gives L(−1, χ₅) = 5^{1} Σ_{j ∈ ZMod 5} χ₅(j) · hurwitzZetaEven(j/5, −1); since χ₅ is even the odd Hurwitz parts cancel and this equals 5 Σ_{j=1}^{4} χ₅(j) ζ(j/5, −1).
2. HurwitzZeta.hurwitzZeta_neg_nat at k = 1: ζ(x, −1) = −B₂(x)/2 with B₂(x) = x² − x + 1/6. With χ₅(1) = χ₅(4) = 1 and χ₅(2) = χ₅(3) = −1, Σ χ₅(j) B₂(j/5) = (1 + 16 − 4 − 9)/25 − (1 + 4 − 2 − 3)/5 = 4/25, so L(−1, χ₅) = 5 · (−1/2) · 4/25 = −2/5.
3. B.3/sqrt-five-zeta-factorisation at s = −1 and ζ(−1) = −1/12 (riemannZeta_neg_nat_eq_bernoulli, bernoulli_two) give 1/30.

**Direct dependencies.** `SpecialValuesBirchTate:B.3/sqrt-five-zeta-factorisation`, `mathlib:ZMod.LFunction_def_even`, `mathlib:HurwitzZeta.hurwitzZeta_neg_nat`, `mathlib:Polynomial.bernoulli`, `mathlib:riemannZeta_neg_nat_eq_bernoulli`, `mathlib:bernoulli_two`.

**Source passages.** [The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.6, PDF p. 523 (book p. 515): Birch–Tate is a theorem for ℚ(√5), which is abelian over ℚ; the example must still compute #K₂ independently.; [Number Theory, Volume II: Analytic and Modern Tools](https://maths.dur.ac.uk/users/herbert.gangl/ch.pdf), §10.5.2, Proposition 10.5.5, p. 219; §10.3 negative-integer Dirichlet values: The quadratic factorization followed by the explicit Bernoulli-polynomial sum gives the value, independently of K₂.

**Acceptance.** The sign is + = (−1)^2, as B.2/zeta-minus-one-sign requires for a real quadratic field. The value is exact; no numerical approximation is compared with a rational candidate.

<a id="B-3-sqrt-five-w2"></a>

### w₂(ℚ(√5)) = 120

**Lemma** `SpecialValuesBirchTate:B.3/sqrt-five-w2`. Declaration: `TauCeti.BirchTate.wInvariant_two_sqrtFive`.

For F = ℚ(√5): w₂^{(2)}(F) = 8, w₂^{(3)}(F) = 3, w₂^{(5)}(F) = 5 and w₂^{(ℓ)}(F) = 1 for ℓ ≥ 7, so w₂(F) = 120.

**Hypotheses and boundary.** F = ℚ(√5).

**Construction or proof.**

1. Criterion (ArithmeticKTheory N.4/computing-w-from-the-cyclotomic-character, and N.4/two-primary-w-invariant at 2): ℓ^ν divides w₂(F) exactly when Gal(F(μ_{ℓ^ν})/F) has exponent dividing 2.
2. ℓ = 5: ℚ(√5) ⊂ ℚ(μ₅), so Gal(F(μ₅)/F) has order 2 and 5 | w₂; Gal(F(μ₂₅)/F) is cyclic of order 10, so 25 ∤ w₂.
3. ℓ = 3: F ∩ ℚ(μ₉) = ℚ, so Gal(F(μ₃)/F) ≅ (ℤ/3)^× has order 2 and Gal(F(μ₉)/F) ≅ (ℤ/9)^× is cyclic of order 6: w₂^{(3)} = 3.
4. ℓ = 2: F ∩ ℚ(μ₁₆) = ℚ (the quadratic subfields of ℚ(μ₁₆) are ℚ(i), ℚ(√2), ℚ(√−2)), so Gal(F(μ₈)/F) ≅ (ℤ/8)^× has exponent 2 and Gal(F(μ₁₆)/F) ≅ (ℤ/16)^× has exponent 4: w₂^{(2)} = 8.
5. ℓ ≥ 7: Gal(F(μ_ℓ)/F) is cyclic of order ℓ − 1 or (ℓ − 1)/2, at least 3, so ℓ ∤ w₂ (and N.4/finiteness-of-the-w-invariant bounds the primes: ℓ − 1 ≤ 2·2).

**Direct dependencies.** `ArithmeticKTheory:N.4/computing-w-from-the-cyclotomic-character`, `ArithmeticKTheory:N.4/two-primary-w-invariant`, `ArithmeticKTheory:N.4/finiteness-of-the-w-invariant`, `ArithmeticKTheory:N.4/the-w-invariant`, `mathlib:IsCyclotomicExtension`.

**Source passages.** [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 2, §3, before Corollary 3.4, p. 15: w₂(F) is the order of H⁰(F, ℚ/ℤ(2)), the N.4 invariant, not the number of roots of unity in F.

**Acceptance.** w₂(ℚ(√5)) = 5 · w₂(ℚ): the prime 5 enters because ℚ(√5) is the quadratic subfield of ℚ(μ₅), a check that w₂ is not NumberField.Units.torsionOrder (which is 2 here).

<a id="B-3-sqrt-five-birch-tate-check"></a>

### The Birch–Tate check for ℚ(√5)

**Application** `SpecialValuesBirchTate:B.3/sqrt-five-birch-tate-check`. Declaration: `TauCeti.BirchTate.birchTateFormula_sqrtFive`.

Given the independently certified order #K₂(𝓞_{ℚ(√5)}) = 4 (ArithmeticKTheory N.8/real-quadratic-example-and-birch-tate, using N.6’s certificate format), BirchTateFormula(ℚ(√5)) holds: 1/30 = (−1)^2 · 4/120. The check uses ζ_F(−1) = 1/30 from B.3/sqrt-five-zeta-at-minus-one and w₂(F) = 120 from B.3/sqrt-five-w2. If instead the order 4 is read off from the formula (which is a theorem for this abelian field), the result is a corollary and not a test, under N.8's labelling rule.

**Hypotheses and boundary.** F = ℚ(√5); the K₂ certificate does not use the Birch–Tate formula. The N.8 supplier currently proves the lower bound only. Its independent generation proof for the upper bound remains a recorded supplier gap; this conditional check does not fill it.

**Construction or proof.**

1. [F:ℚ] = 2, so the sign is +1.
2. 4/120 = 1/30.

**Direct dependencies.** `SpecialValuesBirchTate:B.1/birch-tate-formula`, `SpecialValuesBirchTate:B.3/sqrt-five-zeta-at-minus-one`, `SpecialValuesBirchTate:B.3/sqrt-five-w2`, `ArithmeticKTheory:N.8/real-quadratic-example-and-birch-tate`.

**Source passages.** [The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.6, PDF p. 523 (book p. 515): Birch–Tate is a theorem for ℚ(√5), which is abelian over ℚ; the example must still compute #K₂ independently.; [The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.6, Birch–Tate Conjecture 8.6, PDF p. 523 (book p. 515): The formula of B.1, with (−1)^{r_1} = (−1)^{[F:ℚ]} for totally real F.

**Acceptance.** The three numbers 1/30, 4 and 120 come from three independent computations. N.8 owns the unit/class-group bounds and the certificate; B.3 owns only the independent ζ-value, w₂ computation and the resulting equality test (RT-AREA-ktheory-1/11).

**Stage status: planned.** Close T.5’s independent K₂(ℤ) upper bound and N.8’s independent quadratic generation upper bound before claiming the two independent examples complete. The D=5 factorization is fully outlined from Cohen and the native L-series API; a general quadratic family is outside the stated example target.

## B.4 — The historical odd-primary theorem

<a id="B-4-k2-ell-part-unchanged-by-inverting-ell"></a>

### Inverting ℓ does not change the ℓ-part of K₂

**Lemma** `SpecialValuesBirchTate:B.4/k2-ell-part-unchanged-by-inverting-ell`. Declaration: `TauCeti.BirchTate.padicValNat_card_K2_localization`.

Let F be a number field, ℓ a prime and S_ℓ the set of primes of 𝓞_F above ℓ. Then v_ℓ(#K₂(𝓞_F[1/ℓ])) = v_ℓ(#K₂(𝓞_F)).

**Construction or proof.**

1. B.7/k2-order-of-s-integers gives #K₂(𝓞_{F,S_ℓ}) = #K₂(𝓞_F)·∏_{v|ℓ}(Nv − 1). This is the localisation sequence 0 → K₂(𝓞_F) → K₂(𝓞_{F,S}) → ⊕_{v∈S} k(v)^× → 0 of K2SymbolsBrauer T.5, whose third term is the tame-symbol diagram.
2. Each Nv is a power of ℓ, so Nv − 1 ≡ −1 mod ℓ, and v_ℓ of the product is 0.

**Direct dependencies.** `SpecialValuesBirchTate:B.7/k2-order-of-s-integers`, `mathlib:padicValNat.mul`, `mathlib:padicValNat.eq_zero_of_not_dvd`.

**Source passages.** [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 2, §3, before Theorem 3.3, p. 14: Kolster works with 𝓞_F[1/p] throughout; the passage to 𝓞_F is this lemma.

**Acceptance.** ℓ = 2, F = ℚ: #K₂(ℤ[1/2]) = #K₂(ℤ)·(2 − 1) = 2. The lemma is valuation-only: #K₂(𝓞_F[1/ℓ]) itself differs from #K₂(𝓞_F) by the prime-to-ℓ factor ∏(Nv − 1).

<a id="B-4-k2-ell-part-as-etale-cohomology"></a>

### The ℓ-part of K₂(𝓞_F) is H²_ét(𝓞_F[1/ℓ], ℤ_ℓ(2)) (Tate)

**Lemma** `SpecialValuesBirchTate:B.4/k2-ell-part-as-etale-cohomology`. Declaration: `TauCeti.BirchTate.K2_tensor_padic_equiv_etale`.

Let F be a number field and ℓ an odd prime. Then K₂(𝓞_F) ⊗ ℤ_ℓ ≅ H²_ét(𝓞_F[1/ℓ], ℤ_ℓ(2)). In particular v_ℓ(#K₂(𝓞_F)) = v_ℓ(#H²_ét(𝓞_F[1/ℓ], ℤ_ℓ(2))).

**Hypotheses and boundary.** ℓ odd keeps the real places out of the étale cohomology of 𝓞_F[1/ℓ]. The stage takes the degree-two comparison from T.7 and M.3, not from the general norm-residue theorem.

**Construction or proof.**

1. Tate's comparison for S-integers (MotivicEtaleKTheory M.3), with S ⊇ S_ℓ: K₂(𝓞_{F,S})/ℓ^r ≅ H²_ét(𝓞_{F,S}, μ_{ℓ^r}^{⊗2}) for every r, compatibly in r.
2. K₂(𝓞_{F,S}) is finite (ArithmeticKTheory N.3), so K₂(𝓞_{F,S}) ⊗ ℤ_ℓ = lim_r K₂(𝓞_{F,S})/ℓ^r. The groups H¹_ét(𝓞_{F,S}, μ_{ℓ^r}^{⊗2}) are finite, so the limit is H²_ét(𝓞_{F,S}, ℤ_ℓ(2)) with no lim¹ term.
3. Take S = S_ℓ and pass from 𝓞_F[1/ℓ] to 𝓞_F by the previous lemma.

**Direct dependencies.** `SpecialValuesBirchTate:B.4/k2-ell-part-unchanged-by-inverting-ell`, `MotivicEtaleKTheory:M.3`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`.

**Source passages.** [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 2, §3, after Corollary 3.4, p. 15: H²(𝓞_F, ℤ(2)) ≅ K₂(𝓞_F), citing Tate [35].

**Acceptance.** F = ℚ, ℓ = 3: K₂(ℤ) ≅ ℤ/2 has trivial 3-part, so H²_ét(ℤ[1/3], ℤ_3(2)) = 0.

<a id="B-4-w2-ell-part-as-etale-cohomology"></a>

### The ℓ-part of w₂(F) as the torsion of H¹_ét(𝓞_F[1/ℓ], ℤ_ℓ(2))

**Lemma** `SpecialValuesBirchTate:B.4/w2-ell-part-as-etale-cohomology`. Declaration: `TauCeti.BirchTate.card_etaleH1_torsion_eq_wInvariant`.

Let F be a number field and ℓ an odd prime. The coefficient sequence 0 → ℤ_ℓ(2) → ℚ_ℓ(2) → ℚ_ℓ/ℤ_ℓ(2) → 0 gives H¹_ét(𝓞_F[1/ℓ], ℤ_ℓ(2))_tors ≅ H⁰(𝓞_F[1/ℓ], ℚ_ℓ/ℤ_ℓ(2)) = H⁰(F, ℚ_ℓ/ℤ_ℓ(2)) = W₂(F)_ℓ, of order w₂^{(ℓ)}(F). If F is totally real, H¹_ét(𝓞_F[1/ℓ], ℤ_ℓ(2)) is finite, so it is itself ≅ W₂(F)_ℓ.

**Hypotheses and boundary.** The isomorphism uses that H⁰(F, ℚ_ℓ/ℤ_ℓ(2)) has no divisible part, which holds because it is finite (N.4). For the twist n = 0 the analogous statement is false; see source issue E5.

**Construction or proof.**

1. The kernel of δ₁: H⁰(ℚ_ℓ/ℤ_ℓ(2)) → H¹(ℤ_ℓ(2)) is the maximal divisible subgroup of H⁰, the image of H⁰(ℚ_ℓ(2)). Its image is H¹(ℤ_ℓ(2))_tors, because H¹(ℚ_ℓ(2)) = H¹(ℤ_ℓ(2)) ⊗ ℚ_ℓ is torsion-free.
2. H⁰(F, ℚ_ℓ/ℤ_ℓ(2)) = W₂(F)_ℓ is finite (N.4/finiteness-of-the-w-invariant), so its divisible part is 0 and δ₁ is an isomorphism onto the torsion. H⁰ over 𝓞_F[1/ℓ] equals H⁰ over F, since μ_{ℓ^∞} is unramified outside ℓ.
3. For F totally real, rk_{ℤ_ℓ} H¹(F, ℤ_ℓ(2)) = r₂ = 0 (Kolster, Proposition 2.1(5)), so H¹ is finite, hence equal to its torsion.

**Direct dependencies.** `ArithmeticKTheory:N.4/the-w-invariant`, `ArithmeticKTheory:N.4/finiteness-of-the-w-invariant`, `ArithmeticKTheory:N.6`.

**Source passages.** [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 1, §2, the coefficient sequence, p. 9: H¹_tors ≅ H⁰(ℚ_p/ℤ_p(n)); stated for every n, but it needs n ≠ 0 (source issue E5).; [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 1, §2, Proposition 2.1, p. 10: The ranks, rk H¹(F, ℤ_p(n)) = r₂ for even n.

**Acceptance.** F = ℚ, ℓ = 3: H¹_ét(ℤ[1/3], ℤ_3(2)) ≅ W₂(ℚ)_3 = ℤ/3, matching w₂(ℚ) = 24. Twist 0: H⁰(ℚ_ℓ/ℤ_ℓ) = ℚ_ℓ/ℤ_ℓ is divisible, and H¹(𝓞_F[1/ℓ], ℤ_ℓ) is torsion-free, so the finiteness of W₂ is what makes the lemma work.

<a id="B-4-etale-euler-characteristic-and-zeta"></a>

### The ℓ-adic valuation of ζ_F(−1) as an étale Euler characteristic (Kolster, Theorem 3.3 at χ = 1, n = 2)

**Theorem** `SpecialValuesBirchTate:B.4/etale-euler-characteristic-and-zeta`. Declaration: `TauCeti.BirchTate.padicValRat_zeta_neg_one_eq_etale`.

Let F be a totally real number field and ℓ an odd prime. Then v_ℓ(|ζ_F(−1)|) = v_ℓ(#H²_ét(𝓞_F[1/ℓ], ℤ_ℓ(2))) − v_ℓ(#H⁰(F, ℚ_ℓ/ℤ_ℓ(2))).

**Hypotheses and boundary.** Kolster states Theorem 3.3 for a 'real field'; totally real is meant (Wiles's main conjecture and the parity argument need it).

**Construction or proof.**

1. Let E = F(μ_ℓ); G = Gal(E/F) has order dividing ℓ − 1, prime to ℓ. Put ψ = ω² as a character of G, so that χ = ψω^{−2} is trivial. Let X be the Iwasawa module of the maximal abelian ℓ-extension of E_∞ unramified outside ℓ, and Λ = ℤ_ℓ[[T]], T = γ − 1.
2. Wiles's main conjecture (IntegralIwasawaTheory I.5), with his μ = μ(G_ψ) (Theorem 1.4 of the 1990 paper), gives char(X_ψ) = (G_ψ(T)) when ψ ≠ 1. Here L_ℓ(1 − s, ψ) = G_ψ(κ(γ)^s − 1)/H_ψ(κ(γ)^s − 1), with H_ψ = 1 unless ψ = 1.
3. Descent (Proposition 3.1): Hom(X, ℚ_ℓ/ℤ_ℓ(2)) = H¹_ét(𝓞_{E_∞}[1/ℓ], ℚ_ℓ/ℤ_ℓ(2)), Galois descent to E, and Corollary 2.2. Together they give (X_ψ(−2)_Γ)^∨ ≅ H²_ét(𝓞_E[1/ℓ], ℤ_ℓ(2))^{χ^{−1}} = H²_ét(𝓞_E[1/ℓ], ℤ_ℓ(2))^G ≅ H²_ét(𝓞_F[1/ℓ], ℤ_ℓ(2)), by codescent (Proposition 2.3(2)) since ℓ ∤ |G|.
4. Evaluation (Proposition 3.2): X_ψ(−2) has no nonzero finite Λ-submodule, so its Γ-invariants vanish and |X_ψ(−2)_Γ| ~ f(κ(γ)² − 1), where f(κ(γ)²(1 + T) − 1) is its characteristic polynomial (Lemma 1.2). By the main conjecture this is ~ L_ℓ(−1, ψ) = ζ_F(−1)·∏_{v|ℓ}(1 − Nv), and each factor 1 − Nv is an ℓ-adic unit.
5. The trivial character. ψ = ω²|_G is trivial exactly when [F(μ_ℓ):F] divides 2, which is exactly when W₂(F)_ℓ ≠ 0. In that case the pole factor H_1(T) = T contributes |H⁰(E, ℚ_ℓ/ℤ_ℓ(2))^{ω²}| = |H⁰(F, ℚ_ℓ/ℤ_ℓ(2))| ~ κ(γ)² − 1. Otherwise H⁰(F, ℚ_ℓ/ℤ_ℓ(2)) = 0. Either way the displayed identity follows (Theorem 3.3).

**Direct dependencies.** `IntegralIwasawaTheory:I.5`, `IntegralIwasawaTheory:I.2`, `IntegralIwasawaTheory:L2`, `ArithmeticKTheory:N.6`, `AutomorphicPadicLFunctions:L3`, `SpecialValuesBirchTate:B.2/birch-tate-iff-valuations`.

**Source passages.** [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 2, §3, the set-up, p. 13: E = F_ψ(μ_p), G of order prime to p.; [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 2, §3, Proposition 3.1, p. 14: The descent.; [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 2, §3, Theorem 3.3, p. 15: The theorem, applied with χ = 1, n = 2 and S = S_ℓ.; [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 1, §1, Iwasawa's Main Conjecture 1.3 (Wiles), p. 9: Wiles's theorem, the input from IntegralIwasawaTheory I.5.

**Acceptance.** F = ℚ, ℓ = 3: v_3(1/12) = −1 = 0 − 1, with H² = 0 and H⁰ = ℤ/3. F = ℚ(√5), ℓ = 5: ζ_F(−1) = 1/30, v_5 = −1; [F(μ_5):F] = 2, so H⁰(F, ℚ_5/ℤ_5(2)) = ℤ/5 and H² has trivial 5-part.

<a id="B-4-odd-primary-birch-tate"></a>

### The odd-primary Birch–Tate formula for totally real fields (Wiles)

**Theorem** `SpecialValuesBirchTate:B.4/odd-primary-birch-tate`. Declaration: `TauCeti.BirchTate.padicValNat_card_K2_odd`.

Let F be a totally real number field and ℓ an odd prime. Then v_ℓ(#K₂(𝓞_F)) = v_ℓ(w₂(F)) + v_ℓ(|ζ_F(−1)|).

**Construction or proof.**

1. By the Tate lemma, v_ℓ(#K₂(𝓞_F)) = v_ℓ(#H²_ét(𝓞_F[1/ℓ], ℤ_ℓ(2))).
2. By the W₂ lemma, #H⁰(F, ℚ_ℓ/ℤ_ℓ(2)) = w₂^{(ℓ)}(F), so its valuation is v_ℓ(w₂(F)).
3. Substitute both into the étale Euler-characteristic identity.

**Direct dependencies.** `SpecialValuesBirchTate:B.4/k2-ell-part-as-etale-cohomology`, `SpecialValuesBirchTate:B.4/w2-ell-part-as-etale-cohomology`, `SpecialValuesBirchTate:B.4/etale-euler-characteristic-and-zeta`, `ArithmeticKTheory:N.4/the-w-invariant`.

**Source passages.** [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 2, §3, Corollary 3.4 and Birch–Tate Conjecture 3.5, p. 15: The odd part of Birch–Tate from Corollary 3.4.

**Acceptance.** F = ℚ: ℓ = 3 gives 0 = 1 + (−1); ℓ ≥ 5 gives 0 = 0 + 0 (w₂(ℚ) = 24, ζ(−1) = −1/12). F = ℚ(√5): ℓ = 3 and ℓ = 5 both give 0 = 1 + (−1) (w₂ = 120, ζ_F(−1) = 1/30), so #K₂ is a power of 2, matching 4 (B.3).

**Stage status: planned.** Discharge the M.3 natural Tate comparison, N.6 coefficient/descent and I.2/I.5/L2/L3 finite Euler-characteristic inputs, including the trivial-character pole term. No full higher norm-residue theorem is used here.

## B.5 — The classical totally real abelian theorem

<a id="B-5-federer-main-conjecture"></a>

### Federer's main conjecture at 2 (Kolster, Conjecture 3)

**Definition** `SpecialValuesBirchTate:B.5/federer-main-conjecture`. Declaration: `TauCeti.BirchTate.FedererMainConjecture`.

Let F be a totally real number field. Put F_0 = F(√−1). Let e ≥ 2 be maximal with ζ_{2^e} ∈ F_0, F_n = F(ζ_{2^{n+e}}) for n ≥ 1, and F_∞ = ∪F_n, the cyclotomic ℤ_2-extension of F_0. Let Γ = Gal(F_∞/F_0) = Gal(F_∞^+/F) ≅ ℤ_2, with topological generator γ_0 and u ∈ ℤ_2^× defined by γ_0(ζ) = ζ^u on μ_{2^∞}, so u = 1 + 2^e·ε with ε ∈ ℤ_2^×. Let A_n^- be the kernel of the surjective norm from the 2-part A_n of the class group of F_n to that of F_n^+, A_∞^- = lim→ A_n^-, and Ǎ_∞^- = Hom_{ℤ_2}(A_∞^-, ℚ_2/ℤ_2) with (γφ)(x) = φ(γx). Let Λ = ℤ_2[[T]] with T = γ_0 − 1. Let f_F(T) ∈ Λ be the characteristic polynomial of Ǎ_∞^-, and G_F(T) ∈ Λ the unique power series with L_2(χ_0, s) = G_F(u^s − 1)/(u^s − u), where L_2(χ_0, s) is the 2-adic L-function of the trivial character χ_0 of Gal(F_0/F), that is, the 2-adic zeta function of F. G_F ∈ 2^{[F:ℚ]}Λ by Deligne–Ribet. FedererMainConjecture(F) is the proposition that G_F and 2^{[F:ℚ]}·f_F generate the same ideal of Λ.

**Hypotheses and boundary.** Kolster does not state the Λ-action on the dual. The convention (γφ)(x) = φ(γx) fixed here is the one under which his twist f(u^{−1}(1 + T) − 1) for Ǎ_∞^-(−1) is right; with the contragredient action the twist would be f(u(1 + T) − 1).

**Construction or proof.**

1. Ǎ_∞^- is a finitely generated torsion Λ-module (IntegralIwasawaTheory I.2), so f_F is defined up to a unit of Λ, and the ideal (f_F) is well defined.
2. G_F is unique: s ↦ u^s − 1 maps ℤ_2 onto 2^eℤ_2, and a power series vanishing on this infinite set of points of the open disc is zero.
3. Another generator γ_0′ = γ_0^c (c ∈ ℤ_2^×) changes T by the automorphism 1 + T ↦ (1 + T)^c of Λ, and u by u^c. f_F and G_F transform by the same automorphism, up to units of Λ (for G_F the denominator changes by the unit ((1 + T)^c − u^c)/((1 + T) − u)), so the proposition does not depend on γ_0.

**Uses that determine the API.**

- `SpecialValuesBirchTate:B.5/federer-implies-two-primary-birch-tate`: the hypothesis of Kolster's Theorem 5.
- `SpecialValuesBirchTate:B.5/federer-conjecture-for-abelian-fields`: the conclusion derived from Greither's main conjecture.

**Working API.**

- `TauCeti.BirchTate.FedererMainConjecture` (constructor): The equality of principal ideals (G_F) = (2^[F:ℚ] f_F) in Λ, on the tower, class module and p-adic series imported from I.2 and L3.
- `TauCeti.BirchTate.federerMainConjecture_iff_associated` (characterisation): Since Λ is a domain, the principal-ideal equality is equivalent to G_F and 2^[F:ℚ] f_F being associated.
- `TauCeti.BirchTate.federerMainConjecture_mul_unit` (compatibility): Replacing f_F by ε f_F, with ε a unit of Λ, leaves the predicate unchanged.
- `TauCeti.BirchTate.federerMainConjecture_change_generator` (compatibility): Under the Iwasawa coordinate isomorphism associated to γ′ = γ^c, c ∈ ℤ₂×, and the corresponding unit correction of the pole factor, the predicate is equivalent in the two coordinates.

**Discriminating tests.** Each named test is an example in the suggested file.

- `TauCeti.BirchTate.twoAdicZetaSeries_rat_valuation` (computation): F = ℚ: e = 2, A_∞^- = 0 (the class numbers of ℚ(ζ_{2^n}) are odd), so f = 1; G(u^{−1} − 1) = ζ_{ℚ,2}(−1)·(u^{−1} − u) = (1/12)(u^{−1} − u), and u^{−1} − u ~ 2³, so v_2(G(u^{−1} − 1)) = 1 = [ℚ:ℚ], as the conjecture predicts. For u = 5 the value is (1/12)(1/5 − 5) = −2/5.
- `TauCeti.BirchTate.twoAdicZetaSeries_sqrtTwo_valuation` (computation): F = ℚ(√2) = ℚ(ζ_8)^+: e = 3, F_∞ = ℚ(μ_{2^∞}), so f = 1. ζ_F(−1) = ζ(−1)·L(−1, χ_8) = (−1/12)(−B_{2,χ_8}/2) = 1/12 with B_{2,χ_8} = 2. L_2(χ_0, −1) = ζ_F(−1)·(1 − 2) and u^{−1} − u ~ 2⁴, so v_2(G(u^{−1} − 1)) = 2 = [F:ℚ].
- `TauCeti.BirchTate.not_federerMainConjecture_unnormalised_rat` (non-example): Dropping 2^{[F:ℚ]} gives a false statement for F = ℚ: (G_ℚ) = (2) while (f) = (1).

**Direct dependencies.** `IntegralIwasawaTheory:I.2`, `AutomorphicPadicLFunctions:L3`, `mathlib:NumberField.IsTotallyReal`, `mathlib:PowerSeries`, `mathlib:PadicInt`, `mathlib:Ideal.span`, `mathlib:Module.finrank`.

**Source passages.** [A relation between the 2-primary parts of the main conjecture and the Birch–Tate-conjecture](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/BBA978AE0673CACCF3656F4E23200201/S0008439500000862a.pdf/a-relation-between-the-2-primary-parts-of-the-main-conjecture-and-the-birch-tate-conjecture.pdf), Conjecture 3 and the definition of G(T), p. 250: Federer's conjecture as Kolster states it.; [A relation between the 2-primary parts of the main conjecture and the Birch–Tate-conjecture](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/BBA978AE0673CACCF3656F4E23200201/S0008439500000862a.pdf/a-relation-between-the-2-primary-parts-of-the-main-conjecture-and-the-birch-tate-conjecture.pdf), the tower F_n, Γ, γ_0 and u, p. 248: The abstract; the tower is set up on the same page.

**Acceptance.** The factor 2^{[F:ℚ]} is part of the conjecture: without it the statement fails already for F = ℚ. The definition makes sense for every totally real F; B.5 proves it for F abelian over ℚ, and B.6 for all F.

<a id="B-5-tame-kernel-two-part-via-iwasawa"></a>

### The 2-part of the tame kernel from the minus class module (Kolster, Theorem 1)

**Theorem** `SpecialValuesBirchTate:B.5/tame-kernel-two-part-via-iwasawa`. Declaration: `TauCeti.BirchTate.card_K2_two_part_eq`.

Let F be a totally real number field, F_0 = F(√−1), e ≥ 2 maximal with ζ_{2^e} ∈ F_0, F_n = F(ζ_{2^{n+e}}) and F_∞ = ∪F_n, the cyclotomic ℤ_2-extension of F_0. Let Γ = Gal(F_∞/F_0) = Gal(F_∞^+/F) ≅ ℤ_2, with a topological generator γ_0, and u ∈ ℤ_2^× with γ_0(ζ) = ζ^u on μ_{2^∞}, so u = 1 + 2^e·ε with ε ∈ ℤ_2^×. Let A_n^- be the kernel of the surjective norm map from the 2-part A_n of the class group of F_n to that of F_n^+, A_∞^- = lim→ A_n^-, 𝒯 = lim← μ_{2^n}, Λ = ℤ_2[[T]] with T = γ_0 − 1, and f_F, G_F ∈ Λ as in Federer's main conjecture. Then |K_2(o_F)(2)| = 2^{[F:ℚ]}·|(𝒯 ⊗_{ℤ_2} A_∞^-)^Γ|, where K_2(o_F)(2) is the 2-primary part of K_2(o_F).

**Hypotheses and boundary.** The theorem holds for every totally real F; abelian F is not needed. B.6 reuses it.

**Construction or proof.**

1. Kolster's exact sequence of finite groups (The structure of the 2-Sylow subgroup of K_2(o), II, K-theory 1 (1987), Theorem 3.7) is 0 → (μ_2 ⊗ U_∞^+)^Γ → K_2(o)(2) → (𝒯 ⊗ A_∞^-)^Γ → H¹(Γ, μ_2 ⊗ U_∞^+) → 0, where U_∞^+ = lim→ U_n^+. So the claim is |(μ_2 ⊗ U_∞^+)^Γ| = 2^{[F:ℚ]}·|H¹(Γ, μ_2 ⊗ U_∞^+)|.
2. Let ℰ = U_∞^+/μ_2, the free part. The sequence 0 → μ_2 ⊗ μ_2 → μ_2 ⊗ U_∞^+ → μ_2 ⊗ ℰ → 0 shows that |(μ_2 ⊗ U_∞^+)^Γ|/|H¹(Γ, μ_2 ⊗ U_∞^+)| = |(μ_2 ⊗ ℰ)^Γ|/|H¹(Γ, μ_2 ⊗ ℰ)|.
3. ℰ is free abelian, so squaring gives 0 → ℰ → ℰ → μ_2 ⊗ ℰ → 0 and a long exact cohomology sequence through H¹(Γ, ℰ) and H²(Γ, ℰ).
4. Iwasawa (On cohomology groups of units for ℤ_p-extensions, Amer. J. Math. 105 (1983), Proposition 2) gives H¹(Γ, ℰ) ≅ B ⊕ (ℚ_2/ℤ_2)^r with B finite and H²(Γ, ℰ) ≅ (ℚ_2/ℤ_2)^{r−1}, for some 1 ≤ r ≤ d, where d is the number of dyadic primes of F_∞^+. With 2^s = |B[2]| = |B/2B|, this gives |(μ_2 ⊗ ℰ)^Γ|/|μ_2 ⊗ ℰ^Γ| = 2^{s+r} and |H¹(Γ, μ_2 ⊗ ℰ)| = 2^{s+r−1}.
5. ℰ^Γ is free of rank [F:ℚ] − 1 by the unit theorem for the totally real F, so |μ_2 ⊗ ℰ^Γ| = 2^{[F:ℚ]−1}, and the ratio is 2^{[F:ℚ]}.

**Direct dependencies.** `SpecialValuesBirchTate:B.5/federer-main-conjecture`, `SpecialValuesBirchTate:B.1/birch-tate-formula`, `ArithmeticKTheory:N.6`, `IntegralIwasawaTheory:I.2`, `mathlib:NumberField.Units.finrank_eq`, `mathlib:NumberField.Units.rank`, `mathlib:NumberField.IsTotallyReal.nrComplexPlaces_eq_zero`.

**Source passages.** [A relation between the 2-primary parts of the main conjecture and the Birch–Tate-conjecture](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/BBA978AE0673CACCF3656F4E23200201/S0008439500000862a.pdf/a-relation-between-the-2-primary-parts-of-the-main-conjecture-and-the-birch-tate-conjecture.pdf), Theorem 1, p. 249: Theorem 1.; [A relation between the 2-primary parts of the main conjecture and the Birch–Tate-conjecture](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/BBA978AE0673CACCF3656F4E23200201/S0008439500000862a.pdf/a-relation-between-the-2-primary-parts-of-the-main-conjecture-and-the-birch-tate-conjecture.pdf), proof of Theorem 1, p. 249: Kolster's exact sequence.; [A relation between the 2-primary parts of the main conjecture and the Birch–Tate-conjecture](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/BBA978AE0673CACCF3656F4E23200201/S0008439500000862a.pdf/a-relation-between-the-2-primary-parts-of-the-main-conjecture-and-the-birch-tate-conjecture.pdf), proof of Theorem 1, p. 249: Iwasawa's Proposition 2.

**Acceptance.** F = ℚ: A_∞^- = 0 and the formula gives |K_2(ℤ)(2)| = 2, matching K_2(ℤ) ≅ ℤ/2 (B.3).

<a id="B-5-minus-module-coinvariant-order"></a>

### The order of (𝒯 ⊗ A⁻_∞)^Γ from the characteristic polynomial (Kolster, Lemma 2)

**Lemma** `SpecialValuesBirchTate:B.5/minus-module-coinvariant-order`. Declaration: `TauCeti.BirchTate.card_twistedMinusInvariants`.

Let F be a totally real number field, F_0 = F(√−1), e ≥ 2 maximal with ζ_{2^e} ∈ F_0, F_n = F(ζ_{2^{n+e}}) and F_∞ = ∪F_n, the cyclotomic ℤ_2-extension of F_0. Let Γ = Gal(F_∞/F_0) = Gal(F_∞^+/F) ≅ ℤ_2, with a topological generator γ_0, and u ∈ ℤ_2^× with γ_0(ζ) = ζ^u on μ_{2^∞}, so u = 1 + 2^e·ε with ε ∈ ℤ_2^×. Let A_n^- be the kernel of the surjective norm map from the 2-part A_n of the class group of F_n to that of F_n^+, A_∞^- = lim→ A_n^-, 𝒯 = lim← μ_{2^n}, Λ = ℤ_2[[T]] with T = γ_0 − 1, and f_F, G_F ∈ Λ as in Federer's main conjecture. Then |(𝒯 ⊗_{ℤ_2} A_∞^-)^Γ| ~ f_F(u^{−1} − 1), where a ~ b means that the 2-adic numbers a and b have the same 2-adic valuation.

**Construction or proof.**

1. With (γφ)(x) = φ(γx), the dual of 𝒯 ⊗ A_∞^- is Ǎ_∞^-(−1), and γ_0 acts on it as u·γ_0 does on Ǎ_∞^-. So its characteristic polynomial is f_F(u^{−1}(1 + T) − 1) (Lichtenbaum, Lemma 4.1).
2. Pontryagin duality gives |(𝒯 ⊗ A_∞^-)^Γ| = |(Ǎ_∞^-(−1))_Γ|; this group is finite by Theorem 1.
3. Ǎ_∞^- has no nonzero finite Λ-submodule (Federer). So Ǎ_∞^-(−1) has none, and its Γ-invariants, being finite, vanish.
4. For a finitely generated torsion Λ-module M with M_Γ finite and M^Γ = 0, |M_Γ| ~ char_M(0). With M = Ǎ_∞^-(−1) this is f_F(u^{−1} − 1).

**Direct dependencies.** `SpecialValuesBirchTate:B.5/federer-main-conjecture`, `SpecialValuesBirchTate:B.5/tame-kernel-two-part-via-iwasawa`, `IntegralIwasawaTheory:I.2`, `IntegralIwasawaTheory:L2`.

**Source passages.** [A relation between the 2-primary parts of the main conjecture and the Birch–Tate-conjecture](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/BBA978AE0673CACCF3656F4E23200201/S0008439500000862a.pdf/a-relation-between-the-2-primary-parts-of-the-main-conjecture-and-the-birch-tate-conjecture.pdf), Lemma 2 and its proof, p. 250: Federer's input, stated for A_∞^- where the dual is meant (source issue E2).

**Acceptance.** The lemma needs the dual Ǎ_∞^- to have no nonzero finite submodule. A_∞^- itself is a union of finite Λ-submodules whenever it is nonzero.

<a id="B-5-federer-implies-two-primary-birch-tate"></a>

### Federer's conjecture implies the 2-part of Birch–Tate (Kolster, Theorem 5)

**Theorem** `SpecialValuesBirchTate:B.5/federer-implies-two-primary-birch-tate`. Declaration: `TauCeti.BirchTate.padicValNat_two_card_K2_of_federer`.

Let F be a totally real number field with FedererMainConjecture(F). Then |K_2(o_F)| ~ w_2(F)·ζ_F(−1), that is, v_2(#K_2(o_F)) = v_2(w_2(F)) + v_2(|ζ_F(−1)|): the ℓ = 2 case of the primewise form of BirchTateFormula(F).

**Hypotheses and boundary.** Kolster writes L_2(χ_0, −1) ~ ζ_e(−1); ζ_F(−1) is meant (source issue E1).

**Construction or proof.**

1. F is totally real, so it has a real place and is exceptional. N.4 (two-primary w-invariant, case (c) with i = 2, b = 1) gives w_2^{(2)}(F) = 2^{e+1}.
2. u = 1 + 2^e·ε gives u^{−1} − u = (1 − u²)/u = −2^{e+1}ε(1 + 2^{e−1}ε)/u, and 1 + 2^{e−1}ε is odd since e ≥ 2. So w_2(F) ~ 2^{e+1} ~ u^{−1} − u.
3. The trivial character's twist ω^{−2} is trivial, so L_2(χ_0, −1) = ζ_F(−1)·∏_{𝔭|2}(1 − N𝔭). Each factor is odd, so L_2(χ_0, −1) ~ ζ_F(−1).
4. Hence w_2(F)·ζ_F(−1) ~ L_2(χ_0, −1)·(u^{−1} − u) = G_F(u^{−1} − 1). The conjecture gives ~ 2^{[F:ℚ]}·f_F(u^{−1} − 1), Lemma 2 gives ~ 2^{[F:ℚ]}·|(𝒯 ⊗ A_∞^-)^Γ|, and Theorem 1 gives ~ |K_2(o_F)|.
5. Since u^{−1} − 1 ∈ 4ℤ_2, evaluation of G_F and f_F there converges, and the ideal equality gives equal valuations.

**Direct dependencies.** `SpecialValuesBirchTate:B.5/federer-main-conjecture`, `SpecialValuesBirchTate:B.5/tame-kernel-two-part-via-iwasawa`, `SpecialValuesBirchTate:B.5/minus-module-coinvariant-order`, `SpecialValuesBirchTate:B.2/birch-tate-iff-valuations`, `ArithmeticKTheory:N.4/two-primary-w-invariant`, `ArithmeticKTheory:N.4/exceptional-fields-at-two`, `AutomorphicPadicLFunctions:L3`.

**Source passages.** [A relation between the 2-primary parts of the main conjecture and the Birch–Tate-conjecture](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/BBA978AE0673CACCF3656F4E23200201/S0008439500000862a.pdf/a-relation-between-the-2-primary-parts-of-the-main-conjecture-and-the-birch-tate-conjecture.pdf), Theorem 5, p. 250: Theorem 5.; [A relation between the 2-primary parts of the main conjecture and the Birch–Tate-conjecture](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/BBA978AE0673CACCF3656F4E23200201/S0008439500000862a.pdf/a-relation-between-the-2-primary-parts-of-the-main-conjecture-and-the-birch-tate-conjecture.pdf), proof of Theorem 5, p. 250: The chain of ~.

**Acceptance.** Only the 2-adic valuation is compared: the odd primes and the sign come from B.4 and B.2.

<a id="B-5-federer-conjecture-for-abelian-fields"></a>

### Federer's conjecture for totally real abelian fields from Greither's main conjecture

**Comparison** `SpecialValuesBirchTate:B.5/federer-conjecture-for-abelian-fields`. Declaration: `TauCeti.BirchTate.federerMainConjecture_of_isAbelianGalois`.

Let F be a totally real number field, abelian over ℚ. Then FedererMainConjecture(F) holds.

**Hypotheses and boundary.** Neither Kolster nor Greither writes this comparison; Greither asserts the consequence. The steps below are the proof planned here. Greither's Theorem 3.2 needs the base field unramified at 2, which F need not be; the first step replaces F by such a field with the same F_∞.

**Construction or proof.**

1. Reduction to a field unramified at 2. F ⊂ ℚ(μ_{m2^∞}) with m odd, and F(μ_{2^∞}) = F′(μ_{2^∞}) for F′ = F(μ_{2^∞}) ∩ ℚ(μ_m), which is abelian and unramified at 2 but possibly imaginary (F = ℚ(√6) gives F′ = ℚ(√−3)). Put K_0 = F′(√−1), Δ′ = Gal(K_0/ℚ) ∋ j and Γ′ = Gal(K_∞/K_0) with generator γ′ and u′ = κ(γ′). Then F_∞ = K_∞ and Gal(F_∞/ℚ) = Δ′ × Γ′.
2. Kolster's Γ = Gal(F_∞/F(√−1)) is procyclic and open, so Γ = {(φ(γ), γ) : γ ∈ Γ′^{2^b}} for some b ≥ 0 and some homomorphism φ: Γ′^{2^b} → Δ′ fixing √−1. Let γ_1 generate Γ′^{2^b}; then γ_0 = (φ(γ_1), γ_1) and u = u′^{2^b}. Gal(F_∞/F) = ⟨j⟩ × Γ, so the even characters of F are the products χ̌·ρ, with χ̌ an even character of Δ′ and ρ a character of Γ′ such that ρ(γ_1) = χ̌(φ(γ_1))^{−1}. Since φ fixes √−1, χ̌(φ(γ_1)) = χ(φ(γ_1))^{−1} for χ = ωχ̌^{−1}, so the condition is ρ(γ_1) = χ(φ(γ_1)). There are 2^b such ρ for each χ̌, so [F:ℚ] = 2^b·|Δ′|/2.
3. Same module. A_∞^- is the direct limit over the common tower, so it is one ℤ_2[[Δ′ × Γ′]]-module; f_F is its dual's characteristic polynomial for the subgroup Γ. Minus parts taken as kernels of norms or as quotients by (1 + j) differ by finite groups, which do not change characteristic ideals. By Greither's Lemma 3.3, X = lim← A_2(K_n) is quasi-isomorphic to Ǎ_∞ with the action (σφ)(x) = φ(σx). So for each odd χ of Δ′, ℚ_2 ⊗ X_χ ≅ ℚ_2 ⊗ Ǎ_{∞,χ}^-.
4. Zeros of f_F. μ(f_F) = 0 by Ferrero–Washington at p = 2 (IntegralIwasawaTheory L4). So f_F = unit·Q with Q distinguished, and the roots of Q are the eigenvalues minus 1 of γ_0 on ℂ_2 ⊗ Ǎ_∞^-. This space is the sum of its χ-isotypic parts, χ odd, and there γ_0 acts as χ(φ(γ_1))·γ_1. By Greither's Theorem 3.2, char(X_χ) = (½G_2(T′, χ̌)), with ½G_2(T′, 1)·(T′ − q_0) for χ = ω, where q_0 = u′ − 1. So the eigenvalues of γ_1 on the χ-part are 1 + y for the zeros y of G_2(·, χ̌), and those of γ_0 are χ(φ(γ_1))·(1 + y)^{2^b}, with multiplicity.
5. Zeros of G_F. For abelian F, ζ_{F,2}(s) = ∏_ψ L_2(s, ψ) with the Euler factors at 2 removed. For ψ = χ̌ρ the twist by the second-kind character ρ substitutes the root of unity attached to ρ(γ′) into G_2(·, χ̌) (Washington, Theorem 7.10, with the convention fixed by DirichletPadicLFunctions L2). As a function of 1 + T = u^s = (u′^s)^{2^b}, the zeros of ∏_ρ L_2(s, χ̌ρ) over the 2^b admissible ρ are exactly the χ(φ(γ_1))·(1 + y)^{2^b}. The pole factors multiply to ∏_ρ(ζ_ρu′^s − u′) = ±(u^s − u), Kolster's denominator.
6. μ-invariants. Each ½G_2(·, χ̌) has μ = 0, because X_χ is a quotient of X^- ⊗ ℤ_2(χ) and so is finitely generated over ℤ_2. Root-of-unity substitutions preserve μ, and there are [F:ℚ] pairs (χ̌, ρ), each contributing one factor 2. So G_F = 2^{[F:ℚ]}·unit·P with P distinguished.
7. P and Q have the same roots with multiplicity, so (G_F) = (2^{[F:ℚ]}·f_F) in Λ, which is FedererMainConjecture(F).

**Direct dependencies.** `SpecialValuesBirchTate:B.5/federer-main-conjecture`, `EulerSystemsCyclotomicMainConjecture:L4/greither-main-conjecture-all-p`, `EulerSystemsCyclotomicMainConjecture:L4/greither-kummer-duality`, `EulerSystemsCyclotomicMainConjecture:L4/greither-chi-parts`, `IntegralIwasawaTheory:L4`, `DirichletPadicLFunctions:L2`, `AutomorphicPadicLFunctions:L3`.

**Source passages.** [Class groups of abelian fields, and the main conjecture](http://www.numdam.org/item/AIF_1992__42_3_449_0.pdf), §1, closing remark, p. 454: Greither's statement that his theorem and Kolster's give the 2-part of Birch–Tate.; [Class groups of abelian fields, and the main conjecture](http://www.numdam.org/item/AIF_1992__42_3_449_0.pdf), §3, Lemma 3.3, p. 469: The comparison of X with the dual of A_∞.; [Class groups of abelian fields, and the main conjecture](http://www.numdam.org/item/AIF_1992__42_3_449_0.pdf), §1, the Main Conjecture (= Theorem 3.2), p. 452: Greither's main conjecture with the one-half normalisation.

**Acceptance.** The abelian hypothesis is on F/ℚ itself; the auxiliary field F′ is abelian because F is. F = ℚ(√2): F′ = ℚ, b = 1 and φ is trivial; both sides are (2²) = (4), with f = 1.

<a id="B-5-two-part-birch-tate-abelian"></a>

### The 2-part of the Birch–Tate formula for totally real abelian fields

**Theorem** `SpecialValuesBirchTate:B.5/two-part-birch-tate-abelian`. Declaration: `TauCeti.BirchTate.padicValNat_two_card_K2_of_isAbelianGalois`.

Let F be a totally real number field, abelian over ℚ. Then v_2(#K_2(o_F)) = v_2(w_2(F)) + v_2(|ζ_F(−1)|).

**Construction or proof.**

1. Federer's conjecture holds for F by the comparison with Greither's main conjecture, and Kolster's Theorem 5 turns it into the valuation identity at 2.

**Direct dependencies.** `SpecialValuesBirchTate:B.5/federer-conjecture-for-abelian-fields`, `SpecialValuesBirchTate:B.5/federer-implies-two-primary-birch-tate`.

**Source passages.** [Class groups of abelian fields, and the main conjecture](http://www.numdam.org/item/AIF_1992__42_3_449_0.pdf), §1, closing remark, p. 454: The claim.; [A relation between the 2-primary parts of the main conjecture and the Birch–Tate-conjecture](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/BBA978AE0673CACCF3656F4E23200201/S0008439500000862a.pdf/a-relation-between-the-2-primary-parts-of-the-main-conjecture-and-the-birch-tate-conjecture.pdf), Theorem 5, p. 250: The implication used.

**Acceptance.** F = ℚ(√2): w_2(F) = 48 and ζ_F(−1) = 1/12, so v_2(#K_2(ℤ[√2])) = 4 − 2 = 2.

<a id="B-5-birch-tate-for-real-abelian-fields"></a>

### The Birch–Tate formula for totally real abelian fields

**Theorem** `SpecialValuesBirchTate:B.5/birch-tate-for-real-abelian-fields`. Declaration: `TauCeti.BirchTate.birchTateFormula_of_isAbelianGalois`.

Let F be a totally real number field, abelian over ℚ. Then BirchTateFormula(F) holds: ζ_F(−1) = (−1)^{[F:ℚ]}·#K₂(𝓞_F)/w₂(F).

**Construction or proof.**

1. For odd ℓ the valuation identity is the odd-primary theorem (B.4/odd-primary-birch-tate). For abelian F its Iwasawa input is the Mazur–Wiles main conjecture.
2. For ℓ = 2 it is the previous node.
3. The primewise form (B.2/birch-tate-iff-valuations), with ζ_F(−1) ∈ ℚ and its sign, gives BirchTateFormula(F).

**Direct dependencies.** `SpecialValuesBirchTate:B.5/two-part-birch-tate-abelian`, `SpecialValuesBirchTate:B.4/odd-primary-birch-tate`, `SpecialValuesBirchTate:B.2/birch-tate-iff-valuations`.

**Source passages.** [Class groups of abelian fields, and the main conjecture](http://www.numdam.org/item/AIF_1992__42_3_449_0.pdf), §1, closing remark, p. 454: The full Birch–Tate formula for real abelian fields.

**Acceptance.** This is the historical endpoint the stage keeps separately available: it uses only the abelian main conjectures (Mazur–Wiles at odd ℓ, Greither at 2), not the modern all-prime theorem of B.6. F = ℚ(√5) is abelian, and the formula gives #K₂(𝓞_F) = w₂(F)·ζ_F(−1) = 120·(1/30) = 4 (B.3).

**Stage status: planned.** Discharge the exact Kolster 1987 finite sequence (N.6), Iwasawa unit cohomology and compact-dual no-finite-submodule theorem (I.2), twist/evaluation (L2), Ferrero–Washington (L4) and second-kind character convention (DirichletPadicLFunctions L2). The arbitrary-ramification auxiliary-tower comparison is a source-based proof outline, not a checked equivalence.

## B.6 — The modern route and exact finite descent

The compact-support complex has \(H^2=X_{F_\infty,S}\) and \(H^3=\mathbb Z_2\).
The augmentation factor from \(H^3\) and the real-place/finite corrections must
be retained. In particular, \(\Lambda/(2,T)\) has unit characteristic ideal but
its specialization at \(T=0\) has order two. Height-one localization loses
exactly the information a finite arithmetic order can need.

The comparison table is a map-level interface to I.10. Entries (a), (b), (f),
and (i) remain an explicit supplier gap. Each requires the specified actual maps:

| Entry | Objects and required comparison | Evidence / gate |
| --- | --- | --- |
| (a) Module | \(\operatorname{char}(\iota_uX)=(2^{[F:\mathbb Q]}f_F)\) | I.10 exact module diagram; open |
| (b) Dual/twist | Norm-kernel minus class module, dual action \((\gamma\phi)(x)=\phi(\gamma x)\) and Kummer duality | Lemma 4.2(1)'s order-two cokernel retained; I.10 |
| (c) Compact support | \(R\Gamma_c(\mathcal O_{F_\infty,S},\mathbb Z_2(1))\), \(H^2=X\), \(H^3=\mathbb Z_2\) | I.9 source-qualified output |
| (d) Character | \(\kappa^2\), \(g(u^2-1)=\zeta_{F,S}(-1)\), against \(G_F(u^{-1}-1)\) | Interpolation and I.10's dictionary |
| (e) Pole | \((\gamma-1)\), transported to \(T+1-u\) up to a unit | The \(H^3\) term cannot be omitted |
| (f) Archimedean | Explicit real-place correction complex, characteristic contribution \((2^{[F:\mathbb Q]})\) | I.10 must identify maps; no invented submodule of \(X\) |
| (g) Euler | \(\prod_{v\mid2}(1-Nv)\) is odd | B.7; actual localization/cohomology maps |
| (h) Denominator | \(w_2^{(2)}(F)=2^{e+1}\sim_2 u^{-1}-u\) | N.4 and the tower calculation |
| (i) Finite descent | Derived \(\kappa^2\) specialization, finite \(K_2/W_2\) cohomology, Kolster invariants/coinvariants | I.10; Tor, finite kernels/cokernels and the order-two term retained |

The table is tested over \(\mathbb Q\) with \(u=5\). That numerical test verifies
the signs and valuation factors; it does not prove a comparison for every field.
The all-prime endpoint below is the resulting proof target, conditional on filling
this recorded comparison gap.

<a id="B-6-kurihara-kolster-series-dictionary"></a>

### Kurihara's p-adic zeta function and Kolster's power series

**Comparison** `SpecialValuesBirchTate:B.6/kurihara-kolster-series-dictionary`. Declaration: `TauCeti.BirchTate.twoAdicZetaSeries_eq_kurihara`.

Let F be a totally real number field, p = 2, S = S_2 ∪ S_∞ the dyadic and infinite places of F, F_∞/F the cyclotomic ℤ_2-extension (Kolster's F_∞^+), Λ = ℤ_2[[Gal(F_∞/F)]] = ℤ_2[[T]] with T = γ − 1, and K_∞ = F(μ_{2^∞}) (Kolster's F_∞). Choose γ to be the restriction of Kolster's γ_0 ∈ Gal(K_∞/F(√−1)), so that u = κ(γ_0). Let g = g_{F_∞/F,S} be Kurihara's Deligne–Ribet pseudo-measure, with (γ − 1)g ∈ Λ, and ι_u the automorphism of Λ with γ ↦ κ(γ)γ^{−1}, i.e. T ↦ u(1 + T)^{−1} − 1. Let X_{F_∞,S} be the Galois group of the maximal abelian pro-2 extension of F_∞ unramified outside S. Then Kolster's G_F satisfies G_F(T) = (T + 1 − u)·g(u(1 + T)^{−1} − 1) in Λ. Equivalently (G_F) = ι_u((γ − 1)g)·Λ.

**Hypotheses and boundary.** S-truncation: Kurihara's L_S removes the Euler factors at the dyadic places, as Kolster's 2-adic L-function does. This is the B.6 special-value adapter of the dictionary owned by IntegralIwasawaTheory:I.10 (accepted RS-16); I.10 exports the coefficient-ring map and convergence/uniqueness result. It is not a second construction of the dictionary.

**Construction or proof.**

1. Kurihara (§4.1): κ^nψ(g_{K_∞/F,S}) = L_S(1 − n, ψ) for finite-order ψ and n ≥ 1. For even n, κ^n is trivial on complex conjugation, so it factors through Gal(F_∞/F). With ψ = 1, κ^n(g) = g(u^n − 1) = ζ_{F,S}(1 − n).
2. Kolster: L_2(χ_0, 1 − n) = ζ_{F,S}(1 − n) for even n (ω^{−n} = 1), and L_2(χ_0, s) = G(u^s − 1)/(u^s − u). So G(u^{1−n} − 1) = (u^{1−n} − u)·g(u^n − 1) for every even n ≥ 2.
3. h(T) = (T + 1 − u)·g(u(1 + T)^{−1} − 1) = −(1 + T)·ι_u((γ − 1)g) lies in Λ, and at T = u^{1−n} − 1 it equals (u^{1−n} − u)·g(u^n − 1).
4. G and h agree at the infinitely many points u^{1−n} − 1 (n even), which accumulate at u − 1 ∈ 4ℤ_2. A nonzero element of ℤ_2[[T]] has finitely many zeros in the open disc (Weierstrass), so G = h.

**Direct dependencies.** `SpecialValuesBirchTate:B.5/federer-main-conjecture`, `IntegralIwasawaTheory:I.9`, `AutomorphicPadicLFunctions:L3`, `mathlib:PowerSeries`, `IntegralIwasawaTheory:I.10`.

**Source passages.** [On class groups and Iwasawa modules of CM-fields](https://kurihara.math.keio.ac.jp/ClassGroupsIwasawaModules.pdf), §4.1, the p-adic L-function g_{K∞/k,S}, p. 23: The set-up of §4.1, with p = 2 allowed.; [A relation between the 2-primary parts of the main conjecture and the Birch–Tate-conjecture](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/BBA978AE0673CACCF3656F4E23200201/S0008439500000862a.pdf/a-relation-between-the-2-primary-parts-of-the-main-conjecture-and-the-birch-tate-conjecture.pdf), Conjecture 3 and the definition of G(T), p. 250: Kolster's G with L₂(χ₀, s) = G(u^s − 1)/(u^s − u).

**Acceptance.** F = ℚ: G(u^{−1} − 1) = ζ_{ℚ,S}(−1)·(u^{−1} − u) and g(u² − 1) = ζ_{ℚ,S}(−1) = (1 − 2)ζ(−1) = 1/12; with u = 5 these are −2/5 and 1/12, and (u^{−1} − u)·(1/12) = −2/5.

<a id="B-6-kurihara-main-conjecture-over-f"></a>

### Kurihara's main conjecture for the trivial extension at p = 2

**Application** `SpecialValuesBirchTate:B.6/kurihara-main-conjecture-over-f`. Declaration: `TauCeti.BirchTate.char_X_eq_kurihara`.

Let F be a totally real number field, p = 2, S = S_2 ∪ S_∞ the dyadic and infinite places of F, F_∞/F the cyclotomic ℤ_2-extension (Kolster's F_∞^+), Λ = ℤ_2[[Gal(F_∞/F)]] = ℤ_2[[T]] with T = γ − 1, and K_∞ = F(μ_{2^∞}) (Kolster's F_∞). Choose γ to be the restriction of Kolster's γ_0 ∈ Gal(K_∞/F(√−1)), so that u = κ(γ_0). Let g = g_{F_∞/F,S} be Kurihara's Deligne–Ribet pseudo-measure, with (γ − 1)g ∈ Λ, and ι_u the automorphism of Λ with γ ↦ κ(γ)γ^{−1}, i.e. T ↦ u(1 + T)^{−1} − 1. Let X_{F_∞,S} be the Galois group of the maximal abelian pro-2 extension of F_∞ unramified outside S. Then X_{F_∞,S} is a finitely generated torsion Λ-module and char_Λ(X_{F_∞,S}) = ((γ − 1)·g).

**Hypotheses and boundary.** This is I.9's theorem with k = F and F/k trivial, as the stage prescribes.

**Construction or proof.**

1. Apply the I.9 determinant/characteristic-ideal output for k = F, trivial finite extension, p = 2, and S = S₂ ∪ S∞. The H³ = ℤ₂ term is retained in that supplier output. This node only specializes the theorem; it does not re-plan the height-one proof.
2. Its finite-module invariance is about characteristic ideals only. Before using the equality in a finite arithmetic order computation, consume I.10’s exact derived specialization diagram, with its finite kernels and cokernels.

**Direct dependencies.** `IntegralIwasawaTheory:I.9`.

**Source passages.** [On class groups and Iwasawa modules of CM-fields](https://kurihara.math.keio.ac.jp/ClassGroupsIwasawaModules.pdf), §4.2, Theorem 4.1, p. 24: Theorem 4.1, for every p including 2.; [On class groups and Iwasawa modules of CM-fields](https://kurihara.math.keio.ac.jp/ClassGroupsIwasawaModules.pdf), §4.2, the remarks after the proof, p. 27: (γ − 1)g at the augmentation prime.

**Acceptance.** The finite cokernel in Kurihara Lemma 4.2(1) vanishes at height-one localization, but its finite-specialization Euler characteristic must still be accounted for.

<a id="B-6-kolster-kurihara-comparison-table"></a>

### The comparison table between Kurihara's and Kolster's formulations

**Comparison** `SpecialValuesBirchTate:B.6/kolster-kurihara-comparison-table`. Declaration: `TauCeti.BirchTate.kurihara_kolster_comparison`.

Let F be a totally real number field, p = 2, S = S_2 ∪ S_∞ the dyadic and infinite places of F, F_∞/F the cyclotomic ℤ_2-extension (Kolster's F_∞^+), Λ = ℤ_2[[Gal(F_∞/F)]] = ℤ_2[[T]] with T = γ − 1, and K_∞ = F(μ_{2^∞}) (Kolster's F_∞). Choose γ to be the restriction of Kolster's γ_0 ∈ Gal(K_∞/F(√−1)), so that u = κ(γ_0). Let g = g_{F_∞/F,S} be Kurihara's Deligne–Ribet pseudo-measure, with (γ − 1)g ∈ Λ, and ι_u the automorphism of Λ with γ ↦ κ(γ)γ^{−1}, i.e. T ↦ u(1 + T)^{−1} − 1. Let X_{F_∞,S} be the Galois group of the maximal abelian pro-2 extension of F_∞ unramified outside S. Let Ǎ_∞^- and f_F be Kolster's minus class module and its characteristic polynomial (B.5). The comparison consists of the following entries, each with a map-level theorem:
(a) Module: char(ι_u·X_{F_∞,S}) = (2^{[F:ℚ]}·f_F), where ι_u·X is X with γ acting through κ(γ)γ^{−1}.
(b) Dual and twist: Kummer duality between X_{F_∞,S} and the minus part of lim→ A(F(μ_{2^n})), with Kurihara's Lemma 4.2(1) injection of cokernel order 2 at p = 2, with the finite kernel/cokernel retained before arithmetic specialization.
(c) Compact support: C = RΓ_c(𝒪_{F_∞,S}, ℤ_2(1)) of Burns–Flach, with H²(C) = X_{F_∞,S} and H³(C) = ℤ_2.
(d) Specialisation: the character κ² (s = −1), g(u² − 1) = ζ_{F,S}(−1), against Kolster's evaluation G(u^{−1} − 1).
(e) Trivial-character term: H³(C) = ℤ_2 gives the factor (γ − 1), which ι_u turns into Kolster's (T + 1 − u).
(f) Real places: the [F:ℚ] real places of F, each split completely in F_∞, supply an explicit archimedean correction complex whose characteristic contribution is (2^{[F:ℚ]}); its maps, not an asserted submodule or quotient of X, must be identified.
(g) S-Euler factors: ζ_{F,S}(−1) = ζ_F(−1)·∏_{v|2}(1 − Nv), with odd factors.
(h) W₂: w₂^{(2)}(F) = 2^{e+1} ~ u^{−1} − u.
(i) Finite descent: I.10 identifies the derived specialization of the compact-support complex at κ², its finite cohomology with the K₂/W₂ groups and the Kolster invariant/coinvariant calculation, including Tor and the order-two cokernel of Lemma 4.2(1). The resulting Euler-characteristic equality, rather than a characteristic-ideal equality alone, justifies the arithmetic order.

**Hypotheses and boundary.** The map-level entries (a), (b), (f) and (i) are requested from I.10. None is discharged by reading the two main-conjecture statements. A norm-kernel at 2 is not replaced by an eigenspace. Kolster’s no-finite-submodule input on the compact dual is separately requested from I.2, and must hold before the coinvariant evaluation is used.

**Construction or proof.**

1. (c) and (e): Kurihara §4.1 and the previous node; ι_u(γ − 1) = −γ^{−1}(γ − u).
2. (d): the dictionary lemma, since κ²(g) = g(u² − 1).
3. (g): each 1 − Nv is odd.
4. (h): the proof of Kolster's Theorem 5 (B.5).
5. Test on ℚ: Ǎ_∞^- = 0, so f = 1. G_ℚ ~ 2 (B.5's test), so the dictionary and Kurihara give char(X_{ℚ_∞,{2,∞}}) = (2) = (2^{[ℚ:ℚ]}·f). This matches entry (f): one real place, μ = 1.
6. For (a), (b), (f), (i), consume the I.10 exact diagram. Record each finite term and its specialization contribution. The order-two cokernel cannot be removed merely because it vanishes at height-one primes. The ℚ computation tests the normalization but is not a proof of the general module comparison.

**Direct dependencies.** `SpecialValuesBirchTate:B.6/kurihara-kolster-series-dictionary`, `SpecialValuesBirchTate:B.6/kurihara-main-conjecture-over-f`, `SpecialValuesBirchTate:B.5/federer-main-conjecture`, `SpecialValuesBirchTate:B.5/federer-implies-two-primary-birch-tate`, `IntegralIwasawaTheory:I.10`, `ArithmeticKTheory:N.4/two-primary-w-invariant`.

**Source passages.** [On class groups and Iwasawa modules of CM-fields](https://kurihara.math.keio.ac.jp/ClassGroupsIwasawaModules.pdf), §4.2, Lemma 4.2(1), p. 25: The order-2 cokernel at p = 2.; [On class groups and Iwasawa modules of CM-fields](https://kurihara.math.keio.ac.jp/ClassGroupsIwasawaModules.pdf), §4.1, the complex RΓc, p. 22: The compact-support convention of §4.

**Acceptance.** The table is tested on ℚ before being applied in general, as the stage requires. For M = Λ/(2,T), char_Λ(M) is the unit ideal but M/TM has order 2; this prevents any proof that discards finite modules before evaluating an order.

<a id="B-6-federer-conjecture-all-totally-real"></a>

### Federer's conjecture for every totally real field

**Theorem** `SpecialValuesBirchTate:B.6/federer-conjecture-all-totally-real`. Declaration: `TauCeti.BirchTate.federerMainConjecture_of_isTotallyReal`.

Let F be a totally real number field. Then FedererMainConjecture(F) holds.

**Hypotheses and boundary.** For F abelian over ℚ this is also B.5/federer-conjecture-for-abelian-fields, the independent second proof the stage keeps. Proof target: the exact I.10 comparison and finite descent must be proved; the source-qualified main conjecture alone does not establish this conclusion.

**Construction or proof.**

1. By the dictionary, (G_F) = ι_u((γ − 1)g).
2. By Kurihara over F, ((γ − 1)g) = char(X_{F_∞,S}), so (G_F) = char(ι_u·X_{F_∞,S}).
3. By the comparison table (a), char(ι_u·X_{F_∞,S}) = (2^{[F:ℚ]}·f_F).

**Direct dependencies.** `SpecialValuesBirchTate:B.6/kurihara-kolster-series-dictionary`, `SpecialValuesBirchTate:B.6/kurihara-main-conjecture-over-f`, `SpecialValuesBirchTate:B.6/kolster-kurihara-comparison-table`, `SpecialValuesBirchTate:B.5/federer-main-conjecture`.

**Source passages.** [On class groups and Iwasawa modules of CM-fields](https://kurihara.math.keio.ac.jp/ClassGroupsIwasawaModules.pdf), §4.2, Theorem 4.1, p. 24: The input over an arbitrary totally real base.

**Acceptance.** F = ℚ: both sides are (2).

<a id="B-6-birch-tate-all-totally-real"></a>

### The Birch–Tate formula for every totally real field

**Theorem** `SpecialValuesBirchTate:B.6/birch-tate-all-totally-real`. Declaration: `TauCeti.BirchTate.birchTateFormula_of_isTotallyReal`.

Let F be a totally real number field. Then BirchTateFormula(F) holds: ζ_F(−1) = (−1)^{[F:ℚ]}·#K₂(𝓞_F)/w₂(F).

**Hypotheses and boundary.** Proof target depending on the recorded I.10 comparison gap; no claim that the all-prime implication has been established by this planning pass.

**Construction or proof.**

1. Odd ℓ: B.4/odd-primary-birch-tate.
2. ℓ = 2: Federer's conjecture (previous node) and Kolster's Theorem 5 (B.5).
3. The primewise form (B.2) with the rationality and sign of ζ_F(−1).

**Direct dependencies.** `SpecialValuesBirchTate:B.4/odd-primary-birch-tate`, `SpecialValuesBirchTate:B.5/federer-implies-two-primary-birch-tate`, `SpecialValuesBirchTate:B.6/federer-conjecture-all-totally-real`, `SpecialValuesBirchTate:B.2/birch-tate-iff-valuations`.

**Source passages.** [A relation between the 2-primary parts of the main conjecture and the Birch–Tate-conjecture](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/BBA978AE0673CACCF3656F4E23200201/S0008439500000862a.pdf/a-relation-between-the-2-primary-parts-of-the-main-conjecture-and-the-birch-tate-conjecture.pdf), Theorem 5, p. 250: Kolster's implication, applied to every totally real F.

**Acceptance.** For F abelian this agrees with B.5/birch-tate-for-real-abelian-fields, which is the second proof. ℚ, ℚ(√5), ℚ(√2): 1/12 = 2/24, 1/30 = 4/120, 1/12 = 4/48 (up to the sign (−1)^{[F:ℚ]}).

**Stage status: planned.** I.10 must supply entries (a),(b),(f),(i) of the exact comparison and finite-specialization diagram, including all finite/Tor contributions; the all-prime Birch–Tate theorem remains a proof target dependent on this gap. I.9’s theorem is imported, not rebuilt.

## B.7 — S-integers, Euler factors and naturality

<a id="B-7-s-modified-dedekind-zeta"></a>

### The S-modified Dedekind zeta function

**Definition** `SpecialValuesBirchTate:B.7/s-modified-dedekind-zeta`. Declaration: `TauCeti.BirchTate.sModifiedZeta`.

Let F be a number field and S a finite set of maximal ideals of 𝓞_F (IsDedekindDomain.HeightOneSpectrum (𝓞 F)), with Nv = Ideal.absNorm v. The S-modified Dedekind zeta function is ζ_{F,S}(s) = ζ_F(s) · ∏_{v∈S} (1 − Nv^{−s}), for the continued ζ_F of R.5/completed-zeta-conventions. On Re s > 1 it is the L-series of the ideal count restricted to ideals prime to S, which is Tau Ceti's EulerProductData.restrictAway applied to the trivial Euler-product data.

**Hypotheses and boundary.** F a number field; S a finite set of height-one primes of 𝓞_F.

**Construction or proof.**

1. The definition is the displayed product.
2. Compatibility on Re s > 1: by the Euler product (TauCeti.dedekindZeta_eulerProduct_hasProd) ζ_F(s) = ∏_v (1 − Nv^{−s})^{−1}; multiplying by ∏_{v∈S}(1 − Nv^{−s}) removes the factors at S, leaving the Euler product of the data restricted away from S (TauCeti.EulerProductData.restrictAway_apply).

**Uses that determine the API.**

- `SpecialValuesBirchTate:B.7/birch-tate-for-s-integers`: Its value at −1 is compared with #K₂(𝓞_{F,S})/w₂(F)..
- `SpecialValuesBirchTate:B.4`: The passage from 𝓞_F to 𝓞_F[1/ℓ] takes S to be the primes above ℓ..
- `IntegralIwasawaTheory:I.10`: The S-Euler factors in the B.6 comparison table are these factors at s = −1..
- `ArithmeticKTheory:N.8/s-integer-sequence-for-one-inverted-prime`: The S-integer examples compare with ζ_{ℚ,{p}}(−1)..

**Working API.**

- `TauCeti.BirchTate.sModifiedZeta` (constructor): sModifiedZeta F S s = dedekindZetaCont F s * ∏ v ∈ S, (1 − (absNorm v : ℂ)^(−s)).
- `TauCeti.BirchTate.sModifiedZeta_empty` (simp): sModifiedZeta F ∅ = dedekindZetaCont F.
- `TauCeti.BirchTate.sModifiedZeta_insert` (relation): For v ∉ S: sModifiedZeta F (insert v S) s = sModifiedZeta F S s * (1 − Nv^(−s)).
- `TauCeti.BirchTate.sModifiedZeta_eq_LSeries_restrictAway` (compatibility): On Re s > 1 sModifiedZeta F S equals the L-series of the Euler-product data restricted away from S (TauCeti.EulerProductData.restrictAway).
- `TauCeti.BirchTate.sModifiedZeta_neg_one` (characterisation): sModifiedZeta F S (−1) = (−1)^#S * dedekindZetaCont F (−1) * ∏ v ∈ S, (Nv − 1) (B.7/euler-factors-at-minus-one).

**Discriminating tests.** Each named test is an example in the suggested file.

- `TauCeti.BirchTate.sModifiedZeta_empty_eq` (degenerate): With S = ∅ the function is dedekindZetaCont F itself.
- `TauCeti.BirchTate.sModifiedZeta_rat_two_neg_one` (computation): For ℚ and S = {(2)}: ζ_{ℚ,S}(−1) = (−1/12)(1 − 2) = 1/12; the sign changes.
- `TauCeti.BirchTate.sModifiedZeta_rat_three_neg_one` (computation): For ℚ and S = {(3)}: ζ_{ℚ,S}(−1) = (−1/12)(1 − 3) = 1/6, whereas multiplying by the inverse factor would give 1/24.
- `TauCeti.BirchTate.sModifiedZeta_rat_eq_LSeries` (compatibility): For ℚ and S = {(2)}, on Re s > 1 the function is Σ_{n odd} n^{−s} = (1 − 2^{−s}) riemannZeta s, matching Mathlib's riemannZeta.

**Direct dependencies.** `BorelRegulators:R.5/completed-zeta-conventions`, `tauceti:TauCeti.EulerProductData.restrictAway`, `tauceti:TauCeti.EulerProductData.restrictAway_apply`, `tauceti:TauCeti.dedekindZeta_eulerProduct_hasProd`, `mathlib:IsDedekindDomain.HeightOneSpectrum`, `mathlib:Ideal.absNorm`, `mathlib:Finset.prod`.

**Source passages.** [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 1, §1, p. 8: The S-modified zeta function is ζ_F with the Euler factors at S removed.

**Acceptance.** The Euler factor is removed, not doubled: ζ_{F,S} = ζ_F · ∏(1 − Nv^{−s}), never ζ_F · ∏(1 − Nv^{−s})^{−1}.

<a id="B-7-euler-factors-at-minus-one"></a>

### The Euler factors at s = −1

**Lemma** `SpecialValuesBirchTate:B.7/euler-factors-at-minus-one`. Declaration: `TauCeti.BirchTate.sModifiedZeta_neg_one`.

For a number field F and a finite set S of maximal ideals of 𝓞_F: ζ_{F,S}(−1) = (−1)^{|S|} · ζ_F(−1) · ∏_{v∈S} (Nv − 1).

**Hypotheses and boundary.** S finite.

**Construction or proof.**

1. At s = −1 each factor is 1 − Nv^{1} = −(Nv − 1); the product over S of the signs is (−1)^{|S|} (Finset.prod_pow_eq_pow_sum or induction on S).

**Direct dependencies.** `SpecialValuesBirchTate:B.7/s-modified-dedekind-zeta`, `mathlib:Finset.prod`.

**Source passages.** [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 1, §1, p. 8: The S-modified zeta function is ζ_F with the Euler factors at S removed.

**Acceptance.** Each Nv − 1 ≥ 1, since Nv = #(𝓞_F/v) ≥ 2.

<a id="B-7-k2-order-of-s-integers"></a>

### #K₂(𝓞_{F,S}) = #K₂(𝓞_F) · ∏_{v∈S}(Nv − 1)

**Theorem** `SpecialValuesBirchTate:B.7/k2-order-of-s-integers`. Declaration: `TauCeti.BirchTate.natCard_K2_sInteger`.

Let F be a number field, S a finite set of maximal ideals of 𝓞_F and 𝓞_{F,S} the S-integers (Mathlib's Set.integer). Then Nat.card K₂(𝓞_{F,S}) = Nat.card K₂(𝓞_F) · ∏_{v∈S} (Nv − 1).

**Hypotheses and boundary.** S finite.

**Construction or proof.**

1. K2SymbolsBrauer:T.5/relative-s-integer-sequence gives 0 → K₂(𝓞_F) → K₂(𝓞_{F,S}) → ⊕_{v∈S} k(v)× → 0, through the canonical inclusion and the residue maps at primes IN S. The distinct outside-S tame-kernel sequence is not substituted for it.
2. An exact sequence of groups 1 → A → B → C → 1 with A and C finite gives #B = #A · #C (Subgroup.card_mul_index, with the index of the image of A equal to #C by QuotientGroup.quotientKerEquivOfSurjective); B is then finite.
3. #k(v)^× = #k(v) − 1 = Nv − 1 (Nat.card_units; #k(v) = Ideal.absNorm v), and the direct sum over the finite set S has order the product (Nat.card_pi).

**Direct dependencies.** `K2SymbolsBrauer:T.5/relative-s-integer-sequence`, `K2SymbolsBrauer:T.1/k2-definition`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `mathlib:Set.integer`, `mathlib:Subgroup.card_mul_index`, `mathlib:QuotientGroup.quotientKerEquivOfSurjective`, `mathlib:Nat.card_units`, `mathlib:Nat.card_pi`, `mathlib:Ideal.absNorm`.

**Source passages.** [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 1, §1, p. 8: The S-modified zeta function is ζ_F with the Euler factors at S removed.

**Acceptance.** For ℚ and S = {(2)}: #K₂(ℤ[1/2]) = 2 · 1 = 2; for S = {(3)}: 2 · 2 = 4.

<a id="B-7-birch-tate-for-s-integers"></a>

### The S-integral Birch–Tate formula

**Theorem** `SpecialValuesBirchTate:B.7/birch-tate-for-s-integers`. Declaration: `TauCeti.BirchTate.birchTateFormula_iff_sInteger`.

Let F be a number field and S a finite set of maximal ideals of 𝓞_F. Then BirchTateFormula(F) holds if and only if ζ_{F,S}(−1) = (−1)^{[F:ℚ] + |S|} · #K₂(𝓞_{F,S}) / w₂(F).

**Hypotheses and boundary.** S finite.

**Construction or proof.**

1. By B.7/euler-factors-at-minus-one and B.7/k2-order-of-s-integers, the S-formula reads (−1)^{|S|} ζ_F(−1) P = (−1)^{[F:ℚ]+|S|} #K₂(𝓞_F) P / w₂(F) with P = ∏_{v∈S}(Nv − 1) ≥ 1.
2. Cancel the nonzero factor (−1)^{|S|} P.

**Direct dependencies.** `SpecialValuesBirchTate:B.1/birch-tate-formula`, `SpecialValuesBirchTate:B.7/euler-factors-at-minus-one`, `SpecialValuesBirchTate:B.7/k2-order-of-s-integers`, `ArithmeticKTheory:N.4/finiteness-of-the-w-invariant`.

**Source passages.** [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 1, §1, p. 8: The S-modified zeta function is ζ_F with the Euler factors at S removed.; [The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.6, Birch–Tate Conjecture 8.6, PDF p. 523 (book p. 515): The formula of B.1, with (−1)^{r_1} = (−1)^{[F:ℚ]} for totally real F.

**Acceptance.** For ℚ and S = {(2)}: 1/12 = (+1) · 2/24; for S = {(3)}: 1/6 = (+1) · 4/24. Keeping the unmodified sign (−1)^{[F:ℚ]} after removing a prime gives −1/12 ≠ 1/12.

<a id="B-7-enlarging-s"></a>

### Compatibility under enlargement of S

**Theorem** `SpecialValuesBirchTate:B.7/enlarging-s`. Declaration: `TauCeti.BirchTate.sModifiedZeta_enlarge`.

For finite S ⊆ T of finite primes of F, ζ_{F,T}(s) = ζ_{F,S}(s) ∏_{v∈T∖S}(1−Nv^(−s)), and #K₂(𝓞_{F,T}) = #K₂(𝓞_{F,S}) ∏_{v∈T∖S}(Nv−1). At −1 the extra sign is (−1)^|T∖S|. Both identities compose for S ⊆ T ⊆ U.

**Hypotheses and boundary.** F a number field; S and T finite, S ⊆ T.

**Construction or proof.**

1. Split the finite product over T into S and T∖S. Each norm is at least 2.
2. Divide the two instances of B.7/k2-order-of-s-integers, cancelling the positive product over S. The maps are the canonical inclusions and residue maps of T.5/relative-s-integer-sequence.
3. For S ⊆ T ⊆ U the set differences are disjoint and their products multiply; the canonical ring inclusions compose.

**Direct dependencies.** `SpecialValuesBirchTate:B.7/s-modified-dedekind-zeta`, `SpecialValuesBirchTate:B.7/k2-order-of-s-integers`, `K2SymbolsBrauer:T.5/relative-s-integer-sequence`.

**Source passages.** [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 1 §1, printed p. 8; Lecture 2 §3, pp. 13–15: Euler removal and the arithmetic comparison are compatible with finite S.

**Acceptance.** Over ℚ, remove 2 then 3: ζ_{ℚ,{2,3}}(−1)=−1/6 and #K₂(ℤ[1/6])=4. The extra two signs recover a negative value. S=T gives the identity, including product 1 and sign 1.

<a id="B-7-localisation-comparison-naturality"></a>

### Naturality of arithmetic comparisons when changing S

**Comparison** `SpecialValuesBirchTate:B.7/localisation-comparison-naturality`. Declaration: `TauCeti.BirchTate.chern_localisation_square`.

For finite S ⊆ T containing the primes above ℓ, the Chern/Tate maps from K₂(𝓞_{F,S})⊗ℤ_ℓ to H²_ét(𝓞_{F,S},ℤ_ℓ(2)) commute with inclusion to T, cohomology restriction and each residue boundary. For ℓ odd the two rows are identified exact localization rows. At 2 with real places use M.7’s corrected complexes and their real-place maps. The denominator W₂(F) map is the identity. For n ≥ 2 the rational higher-K comparisons and archimedean regulators commute with the same inclusions; the induced odd-degree torsion-free lattice map is an isomorphism, hence its normalized regulator covolume is unchanged.

**Hypotheses and boundary.** S ⊆ T finite, primes above ℓ included; degree two uses M.3, higher weights M.7; at 2 the real-place corrected comparison is required. The regulator assertion is for K_{2n−1}, n ≥ 2. It is not the degree-one S-unit formula.

**Construction or proof.**

1. Use M.3’s natural Chern maps and compatible coefficient/residue maps on the Dedekind localization sequence supplied by N.2 and T.5. Tensor the finite degree-two row with ℤ_ℓ and take the compatible coefficient limits.
2. M.7 gives the corrected real-place diagram at 2; its archimedean terms are unchanged by removing finite primes. I.10 supplies the same compatibility in the compact-support/descent comparison of B.6.
3. In degree 2n−1, finite-field K_{2n−2} vanishes, so the higher localization map is surjective with finite kernel. It induces an isomorphism on torsion-free integral lattices. Apply the natural regulator map from R.4/R.7 and its coordinate measure.
4. The ζ leading coefficient is multiplied by ∏_{v∈T∖S}(1−Nv^(n−1)), a nonzero real factor; its order of vanishing is unchanged. Track this factor alongside the finite localization terms, without inferring an integral K-isomorphism from rationalization.

**Direct dependencies.** `SpecialValuesBirchTate:B.7/enlarging-s`, `K2SymbolsBrauer:T.5/relative-s-integer-sequence`, `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `ArithmeticKTheory:N.3/finite-S-localisation-defect`, `ArithmeticKTheory:N.3/canonical-rational-S-integer-equivalence`, `MotivicEtaleKTheory:M.3`, `MotivicEtaleKTheory:M.7`, `IntegralIwasawaTheory:I.10`, `BorelRegulators:R.4/borel-regulator`, `BorelRegulators:R.4/regulator-covolume`, `BorelRegulators:R.7/regulator-factor-two`, `KTheoryFiniteLocalFields:L.1`.

**Source passages.** [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 1 §1, printed p. 8; Lecture 2 §3, pp. 13–15: The cohomological descent and main-conjecture evaluation retain the same finite-S Euler factors.; [The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.11.11 proof and V.11.12(4); VI.9.4–9.5: V.11 constructs the natural étale Chern maps. VI.9.4 uses the natural real-place restriction map, and VI.9.5 identifies the odd higher groups for S-integers. Residue compatibility and corrected integral comparisons are imported from M.3/M.7, not inferred from rationalized ranks.

**Acceptance.** For ℚ, ℓ=3, S={(3)}, T={(2),(3)}, the added norm factor 2−1=1 leaves the 3-primary row unchanged while the zeta sign flips. Adding a prime of norm q with ℓ | q−1 gives a nontrivial residue ℓ-part; the theorem cannot claim invariance of that primary group.

**Stage status: planned.** Discharge naturality of the actual M.3/M.7 Chern/residue maps and I.10 compact-support descent under S enlargement, with real corrections at 2. Regulator compatibility uses the integral torsion-free localization isomorphism and normalized R.4/R.7 covolume.

## B.8 — Higher values and integral conjecture statements

For all \(n\ge2\), the leading order is \(d_n=r_2\) for even \(n\) and
\(d_n=r_1+r_2\) for odd \(n\). The coefficient of \((s-(1-n))^{d_n}\)
is \(\zeta_F^*(1-n)\), with no extra factorial. The Borel covolume uses R.4's
coordinate measure and equals one in rank zero. Borel rational proportionality,
the odd-primary finite-order formula, the full motivic scalar formula and the
integral equivariant predicate have distinct strengths.

For totally real \(F\) and even \(n\), the real-place comparison gives
\[
\frac{\#H^2_{\mathrm{et}}(\mathcal O_F[1/2],\mathbb Z_2(n))}
     {\#H^1_{\mathrm{et}}(\mathcal O_F[1/2],\mathbb Z_2(n))}
=2^{r_1}\frac{\#K_{2n-2}(\mathcal O_F)\{2\}}{\#K_{2n-1}(\mathcal O_F)\{2\}}.
\]
At \(n\equiv2\pmod4\), the even group is \(H^2\) and the odd torsion has
order \(2^{r_1}w_n\{2\}\). At \(n\equiv0\pmod4\), the even group is the kernel
of the surjective real restriction \(H^2\to(\mathbb Z/2)^{r_1}\), and the odd
torsion has order \(w_n\{2\}\). The maps and surjectivity are M.7's comparison
outputs, not an inference from degree two.

The classical even-weight abelian consequence uses Rognes–Weibel's Kolster
appendix, A.1–A.3; it does not extend B.6's modern weight-two gate by replacing
subscripts. In the equivariant statement the Tate motive is
\(h^0(\operatorname{Spec}L)(1-n)\), the semisimple algebra is \(\mathbb Q[G]\),
and the integral order is \(\mathbb Z[G]\). Under Coherence, the ETNC class is
\(\widehat\delta^1(L^*)+R\Omega\), with a **plus** sign. Rationality is membership
in \(K_0(\mathbb Z[G],\mathbb Q)\); integrality is vanishing. The local class
includes the reduced-norm correction and the determinant is graded. The general
conjecture is stated, not proved by Borel's rationality result.

<a id="B-8-cohomological-h2-model"></a>

### The cohomological order used in special-value formulas

**Definition** `SpecialValuesBirchTate:B.8/cohomological-h2-model`. Declaration: `TauCeti.BirchTate.hInvariant`.

For n ≥ 2, import the actual integral motivic groups from M.8/PS.3 and their arithmetic étale comparisons from N.6/M.3 and define h_n(F) as the order of H²(𝓞_F,ℤ(n)), the product of the finite groups H²_ét(𝓞_F[1/p],ℤ_p(n)), almost all trivial. H¹ and its lattice are supplier objects, not chosen from their completions. Its rank is r₁+r₂ for odd n and r₂ for even n, and its torsion order is w_n(F). The adapter has h₂(F) = #K₂(𝓞_F).

**Hypotheses and boundary.** Only the ℓ-adic pieces are used: #H²(𝓞_F, ℤ(n))_ℓ = #H²_ét(𝓞_F[1/ℓ], ℤ_ℓ(n)) and #H¹(𝓞_F, ℤ(n))_{tors,ℓ} = w_n^{(ℓ)}(F). No global motivic complex is constructed here. Kolster's p. 11 prints the ranks as r₂ for odd n and r₁ + r₂ for even n. That contradicts his Proposition 2.1(5) and Borel's ranks (p. 15); the node uses the corrected ranks (source issue E6). The integral H¹ object and its regulator lattice must come from the motivic supplier. A finitely generated group picked solely to match all p-adic completions does not fix that lattice or its maps.

**Construction or proof.**

1. Finiteness: H²_ét(𝓞_F[1/p], ℤ_p(n)) is finite, and trivial for almost all p (Proposition 2.1(4), N.6).
2. Ranks: rk_{ℤ_p} H¹_ét(𝓞_F[1/p], ℤ_p(n)) = rk H¹(F, ℤ_p(n)) = r₁ + r₂ or r₂ for odd or even n (Proposition 2.1(3), (5)).
3. Torsion: the coefficient sequence gives H¹(ℤ_p(n))_tors ≅ H⁰(ℚ_p/ℤ_p(n)) for n ≠ 0 (B.4's w₂ lemma with twist n), of order w_n^{(p)}(F).
4. n = 2: B.4/k2-ell-part-as-etale-cohomology at odd ℓ, and Tate's theorem at 2 (M.3).

**Uses that determine the API.**

- `SpecialValuesBirchTate:B.8/lichtenbaum-formula-statements`: the motivic form of the conjecture.
- `SpecialValuesBirchTate:B.8/odd-primary-even-weight-euler-characteristic`: the ℓ-parts of h_n and w_n.

**Working API.**

- `TauCeti.BirchTate.hInvariant` (data): h_n(F) = #H²(𝓞_F,ℤ(n)), for the supplier’s actual cohomological group.
- `TauCeti.BirchTate.padicValNat_hInvariant` (compatibility): For n ≥ 2 and prime ℓ, v_ℓ(h_n(F)) equals v_ℓ(#H²_ét(𝓞_F[1/ℓ],ℤ_ℓ(n))).
- `TauCeti.BirchTate.rank_etaleH1Model` (characterisation): The imported integral H¹ lattice has rank r₁+r₂ for odd n and r₂ for even n.
- `TauCeti.BirchTate.card_torsion_etaleH1Model` (characterisation): The imported H¹ torsion has order w_n(F).
- `TauCeti.BirchTate.hInvariant_two` (relation): h₂(F) = #K₂(𝓞_F), through Tate’s actual comparison, including its degree-two case at 2.

**Discriminating tests.** Each named test is an example in the suggested file.

- `TauCeti.BirchTate.hInvariant_two_rat` (computation): h_2(ℚ) = #K₂(ℤ) = 2.
- `TauCeti.BirchTate.rank_etaleH1Model_rat_two` (computation): For ℚ and n = 2 the rank is r₂ = 0 (K₃(ℤ) ≅ ℤ/48 is finite), not r₁ + r₂ = 1 as Kolster prints (E6).
- `TauCeti.BirchTate.card_torsion_etaleH1Model_rat_two` (non-example): #H¹(ℤ, ℤ(2))_tors = w₂(ℚ) = 24 differs from #K₃(ℤ)_tors = 48: the cohomological model and K-theory differ at 2.

**Direct dependencies.** `ArithmeticKTheory:N.6`, `ArithmeticKTheory:N.4/the-w-invariant`, `ArithmeticKTheory:N.4/finiteness-of-the-w-invariant`, `MotivicEtaleKTheory:M.3`, `SpecialValuesBirchTate:B.4/k2-ell-part-as-etale-cohomology`, `SpecialValuesBirchTate:B.4/w2-ell-part-as-etale-cohomology`, `MotivicEtaleKTheory:M.8`, `PeriodsAndSpecialValues:PS.3`.

**Source passages.** [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 1, §2, the global models, p. 11: H²(𝓞_F, ℤ(n)) as a product; its order h_n(F).; [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 1, §2, the group H¹(𝓞_F, ℤ(n)), p. 11: The printed ranks are interchanged (source issue E6).

**Acceptance.** For ℚ and n = 2: h_2(ℚ) = #K₂(ℤ) = 2 and #H¹(ℤ, ℤ(2))_tors = w₂(ℚ) = 24, while K₃(ℤ) ≅ ℤ/48. So the torsion of the cohomological H¹ is not that of K₃ at 2.

<a id="B-8-lichtenbaum-formula-statements"></a>

### The Lichtenbaum formulas at negative integers (Kolster, Conjectures 3.6 and 3.7)

**Definition** `SpecialValuesBirchTate:B.8/lichtenbaum-formula-statements`. Declaration: `TauCeti.BirchTate.LichtenbaumFormulaOddPart`.

Let F be a number field and n ≥ 2. Let ζ*_F(1 − n) be the leading coefficient of ζ_F at s = 1 − n; the order of vanishing is r₂ for even n and r₁ + r₂ for odd n (BorelRegulators R.5). Let R_n^B(F) be Borel's regulator covolume of K_{2n−1}(𝓞_F) (BorelRegulators R.4), with R_n^B(F) = 1 when that rank is 0. LichtenbaumFormulaOddPart(F, n) is the proposition that for every odd prime ℓ, v_ℓ(ζ*_F(1 − n)/R_n^B(F)) = v_ℓ(#K_{2n−2}(𝓞_F)) − v_ℓ(#K_{2n−1}(𝓞_F)_tors). This is Conjecture 3.6 away from 2; the quotient is rational by Borel's theorem. MotivicLichtenbaumFormula(F, n) is the proposition |ζ*_F(1 − n)| = #H²(𝓞_F, ℤ(n))/#H¹(𝓞_F, ℤ(n))_tors · R_n^M(F), Conjecture 3.7, where R_n^M differs from R_n^B by a power of 2.

**Hypotheses and boundary.** F any number field, n ≥ 2; the leading coefficient, positive Borel covolume and integral motivic lattice have the exact supplier normalizations. The odd-primary K-theoretic formula, full motivic scalar formula and equivariant integral statement are distinct predicates. The latter two are conjectural in the generality stated. The real-place correction below is derived from M.7, not inferred from degree two.

**Construction or proof.**

1. Well-posedness: R.5 gives the order of vanishing and a nonzero leading coefficient, and Borel's theorem makes ζ*_F(1 − n)/R_n^B(F) rational and nonzero. K_{2n−2}(𝓞_F) and the torsion of K_{2n−1}(𝓞_F) are finite (N.3). So the ℓ-adic valuations are defined.
2. For n = 2 and F totally real, R = 1 and ζ* = ζ_F(−1). The odd part of #K₃(𝓞_F)_tors is that of w₂(F) (N.5), so LichtenbaumFormulaOddPart(F, 2) is the odd part of the Birch–Tate formula.

**Uses that determine the API.**

- `SpecialValuesBirchTate:B.8/odd-primary-lichtenbaum-totally-real`: the statement proved for totally real F and even n.

**Working API.**

- `TauCeti.BirchTate.LichtenbaumFormulaOddPart` (constructor): ∀ ℓ odd prime, v_ℓ(ζ*_F(1 − n)/R_n^B(F)) = v_ℓ #K_{2n−2}(𝓞_F) − v_ℓ #K_{2n−1}(𝓞_F)_tors.
- `TauCeti.BirchTate.MotivicLichtenbaumFormula` (constructor): |ζ*_F(1 − n)| = #H²(𝓞_F, ℤ(n))/#H¹(𝓞_F, ℤ(n))_tors · R_n^M(F).
- `TauCeti.BirchTate.lichtenbaumFormulaOddPart_two_iff` (characterisation): For F totally real, LichtenbaumFormulaOddPart(F, 2) ↔ the Birch–Tate valuation identity at every odd ℓ.

**Discriminating tests.** Each named test is an example in the suggested file.

- `TauCeti.BirchTate.lichtenbaumFormulaOddPart_rat_two` (computation): ℚ, n = 2: ζ(−1) = −1/12, #K₂(ℤ) = 2, #K₃(ℤ) = 48, R = 1. At ℓ = 3, −1 = 0 − 1; at ℓ ≥ 5, 0 = 0 − 0.
- `TauCeti.BirchTate.not_lichtenbaum_rat_two_at_two` (non-example): The K-theoretic formula including 2 would say 1/12 = 2/48 = 1/24, which is false.
- `TauCeti.BirchTate.motivicLichtenbaumFormula_rat_two` (computation): ℚ, n = 2: #H²(ℤ, ℤ(2)) = 2 and #H¹(ℤ, ℤ(2))_tors = w₂(ℚ) = 24 give 2/24 = 1/12 = |ζ(−1)|.
- `TauCeti.BirchTate.lichtenbaumFormulaOddPart_rat_four` (computation): ℚ, n = 4: ζ(−3) = 1/120 and #K₇(ℤ)_tors = w₄(ℚ) = 240, so the formula predicts that the odd part of #K₆(ℤ) is 1 (v₃: −1 = 0 − 1, v₅: −1 = 0 − 1).
- `TauCeti.BirchTate.lichtenbaum_complex_place_requires_leading_term` (non-example): For F = ℚ(i), n = 2, r₂ = 1: ζ_F(−1)=0 but ζ*_F(−1) and the normalized rank-one regulator covolume are nonzero. Substituting the raw value for the leading coefficient makes the positive formula false.

**Direct dependencies.** `BorelRegulators:R.4/regulator-covolume`, `SpecialValuesBirchTate:B.8/cohomological-h2-model`, `SpecialValuesBirchTate:B.1/birch-tate-formula`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `mathlib:padicValRat`, `BorelRegulators:R.5/zeta-zero-order`, `BorelRegulators:R.5/zeta-leading-coefficient`, `BorelRegulators:R.5/borel-zeta-proportionality`, `MotivicEtaleKTheory:M.8`, `PeriodsAndSpecialValues:PS.3`.

**Source passages.** [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 2, §3, Lichtenbaum Conjecture 3.6, p. 15: The K-theoretic form.; [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 2, §3, the order of vanishing, p. 15: Orders of vanishing and Borel's ranks.; [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 2, §3, Motivic Lichtenbaum Conjecture 3.7, p. 16: The motivic form.; [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 2, §3, the regulators, p. 16: R_n^M against R_n^B.

**Acceptance.** The K-theoretic form genuinely needs 'up to powers of 2': see the ℚ, n = 2 non-example. The motivic form holds exactly for ℚ and n = 2.

<a id="B-8-odd-primary-even-weight-euler-characteristic"></a>

### The odd-primary value of ζ_F(1 − n) for totally real F and even n (Kolster, Theorem 3.3 and Corollary 3.4)

**Theorem** `SpecialValuesBirchTate:B.8/odd-primary-even-weight-euler-characteristic`. Declaration: `TauCeti.BirchTate.padicValRat_zeta_one_sub_eq_etale`.

Let F be totally real, n ≥ 2 even and ℓ an odd prime. Then v_ℓ(|ζ_F(1 − n)|) = v_ℓ(#H²_ét(𝓞_F[1/ℓ], ℤ_ℓ(n))) − v_ℓ(#H⁰(F, ℚ_ℓ/ℤ_ℓ(n))) = v_ℓ(h_n(F)) − v_ℓ(w_n(F)).

**Hypotheses and boundary.** For even n and totally real F, ζ_F does not vanish at 1 − n (order r₂ = 0), so ζ* = ζ_F(1 − n) ∈ ℚ^×.

**Construction or proof.**

1. This is B.4/etale-euler-characteristic-and-zeta with the twist 2 replaced by n. E = F(μ_ℓ); ψ = ω^n as a character of G = Gal(E/F), so χ = ψω^{−n} = 1.
2. Descent: (X_ψ(−n)_Γ)^∨ ≅ H²_ét(𝓞_E[1/ℓ], ℤ_ℓ(n))^G ≅ H²_ét(𝓞_F[1/ℓ], ℤ_ℓ(n)) (Proposition 3.1, codescent). For totally real F and even n, H¹(ℚ_ℓ/ℤ_ℓ(n)) ≅ H²(ℤ_ℓ(n)) (Corollary 2.2(a)).
3. Evaluation: X_ψ(−n) has no nonzero finite submodule, and its characteristic polynomial is f(κ(γ)^n(1 + T) − 1). So |X_ψ(−n)_Γ| ~ f(κ(γ)^n − 1) ~ L_ℓ(1 − n, ψ) = ζ_F(1 − n)·∏_{v|ℓ}(1 − Nv^{n−1}), and the Euler factors are ℓ-adic units.
4. ψ = ω^n|_G is trivial exactly when W_n(F)_ℓ ≠ 0; then the pole factor contributes #H⁰(F, ℚ_ℓ/ℤ_ℓ(n)) ~ κ(γ)^n − 1. Otherwise W_n(F)_ℓ = 0.

**Direct dependencies.** `IntegralIwasawaTheory:I.5`, `IntegralIwasawaTheory:I.2`, `IntegralIwasawaTheory:L2`, `ArithmeticKTheory:N.6`, `AutomorphicPadicLFunctions:L3`, `SpecialValuesBirchTate:B.8/cohomological-h2-model`.

**Source passages.** [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 2, §3, Theorem 3.3, p. 15: Theorem 3.3 with χ = 1.; [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 2, §3, Corollary 3.4, p. 15: Corollary 3.4.

**Acceptance.** n = 2 is B.4/etale-euler-characteristic-and-zeta. ℚ, n = 4, ℓ = 5: ζ(−3) = 1/120, v₅ = −1; w₄(ℚ) = 240 (v₅ = 1), so H²_ét(ℤ[1/5], ℤ_5(4)) has trivial 5-part.

<a id="B-8-odd-primary-lichtenbaum-totally-real"></a>

### The odd part of the Lichtenbaum formula for totally real fields in even weight

**Theorem** `SpecialValuesBirchTate:B.8/odd-primary-lichtenbaum-totally-real`. Declaration: `TauCeti.BirchTate.lichtenbaumFormulaOddPart_of_isTotallyReal`.

Let F be totally real and n ≥ 2 even. Then LichtenbaumFormulaOddPart(F, n) holds: for every odd prime ℓ, v_ℓ(|ζ_F(1 − n)|) = v_ℓ(#K_{2n−2}(𝓞_F)) − v_ℓ(#K_{2n−1}(𝓞_F)_tors).

**Hypotheses and boundary.** The comparison K_{2n−2}(𝓞_F) ⊗ ℤ_ℓ ≅ H²_ét(𝓞_F[1/ℓ], ℤ_ℓ(n)) for odd ℓ and n ≥ 2 is Quillen–Lichtenbaum, requested from MotivicEtaleKTheory M.7. It rests on the norm-residue theorem (M.5), not on the degree-two comparison alone.

**Construction or proof.**

1. For totally real F and even n, rk K_{2n−1}(𝓞_F) = r₂ = 0, so R_n^B = 1 and ζ* = ζ_F(1 − n).
2. M.7 at odd ℓ gives K_{2n−2}(𝓞_F) ⊗ ℤ_ℓ ≅ H²_ét(𝓞_F[1/ℓ], ℤ_ℓ(n)), and the ℓ-part of K_{2n−1}(𝓞_F)_tors is that of ℤ/w_n(F) (N.5's table; the factors 2 there are prime to ℓ).
3. Substitute into the previous node.

**Direct dependencies.** `SpecialValuesBirchTate:B.8/odd-primary-even-weight-euler-characteristic`, `SpecialValuesBirchTate:B.8/lichtenbaum-formula-statements`, `MotivicEtaleKTheory:M.7`, `ArithmeticKTheory:N.5/e-invariant-kernel-cokernel`.

**Source passages.** [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 1, §2, the comparison with K-theory, p. 11: K_{2n−i} against motivic and étale cohomology.; [Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Lecture 2, §3, Lichtenbaum Conjecture 3.6, p. 15: The statement proved away from 2.

**Acceptance.** n = 2 recovers B.4/odd-primary-birch-tate through Tate's comparison. ℚ, n = 4: the odd part of #K₆(ℤ) is 1.

<a id="B-8-real-place-two-correction"></a>

### The higher real-place correction at two

**Theorem** `SpecialValuesBirchTate:B.8/real-place-two-correction`. Declaration: `TauCeti.BirchTate.padicValRat_higher_two_correction`.

For totally real F, even n ≥ 2 and R=𝓞_F[1/2], let a = v₂(#K_{2n−2}(𝓞_F)) and b = v₂(#K_{2n−1}(𝓞_F)); these groups are finite. Then v₂(#H²_ét(R,ℤ₂(n))) − v₂(#H¹_ét(R,ℤ₂(n))) = r₁ + a − b. Equivalently #H²/#H¹ = 2^r₁·#K_{2n−2}{2}/#K_{2n−1}{2}.

**Hypotheses and boundary.** F totally real; n even and n ≥ 2. This finite-group formula is not asserted for arbitrary parity or signature.

**Construction or proof.**

1. Consume M.7’s actual Chern/real-restriction comparison and N.5/e-invariant-kernel-cokernel; no new étale K-theory is constructed here.
2. If n ≡ 2 mod 4, the even K group is H², while the odd K group has torsion order 2^r₁ w_n. If n ≡ 0 mod 4, the even K group is ker(H² → (ℤ/2)^r₁) with surjective real restriction, and the odd group has torsion order w_n. H¹ has order w_n in both cases.
3. Compute the finite orders in these two map-level sequences. Inverting dyadic primes does not change the 2-primary K groups because the residue orders q^j−1 are odd.

**Direct dependencies.** `MotivicEtaleKTheory:M.7`, `ArithmeticKTheory:N.5/e-invariant-kernel-cokernel`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `ArithmeticKTheory:N.4/the-w-invariant`.

**Source passages.** [Two-primary algebraic K-theory of rings of integers in number fields](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/RognesWeibel.pdf), Theorem 0.1, p. 1; Theorems 0.3 and 0.6, pp. 2–4: The even-weight order ratio follows from the actual 2-adic arithmetic comparison and the two congruence classes.

**Acceptance.** ℚ, n=2: 2·2/48=1/12, while 2/48=1/24 is wrong. ℚ, n=4: K₆(ℤ) is the trivial group of order 1 and #K₇(ℤ)=240, so the corrected ratio is 1/120; H² has order 2 and H¹ order 240.

<a id="B-8-higher-values-real-abelian"></a>

### Higher values for totally real abelian fields

**Theorem** `SpecialValuesBirchTate:B.8/higher-values-real-abelian`. Declaration: `TauCeti.BirchTate.higherLichtenbaum_of_isAbelianGalois`.

For F totally real and abelian over ℚ and even n=2k≥2, ζ_F(1−n) = (−1)^(k r₁)·2^r₁·#K_{2n−2}(𝓞_F)/#K_{2n−1}(𝓞_F).

**Hypotheses and boundary.** F/ℚ abelian and totally real; n even, n ≥ 2. All displayed K groups are finite.

**Construction or proof.**

1. B.8/odd-primary-lichtenbaum-totally-real supplies all odd valuations.
2. Use Kolster’s appendix to Rognes–Weibel: A.2/A.3 transfer the classical 2-adic character main conjecture over ℚ to the trivial character over a totally real abelian F. A.1 evaluates at κⁿ−1: interpolation identifies ζ_F(1−n) up to a 2-adic unit; the analytic class number formula equates the two μ-invariants for the trivial character; I.2 supplies no finite submodules for X(−n); the finite coinvariant order is evaluated by L2, and M.7’s coefficient/Hochschild–Serre maps identify it with H². Combine with the real-place correction to obtain the K-group valuation. This classical even-weight argument is not inferred from the modern weight-two comparison.
3. Use the functional-equation sign (−1)^(k r₁), then rational reconstruction. The gamma computation for even weights is supplied by the analytic owner, rather than assumed from n=2.

**Direct dependencies.** `SpecialValuesBirchTate:B.8/odd-primary-lichtenbaum-totally-real`, `SpecialValuesBirchTate:B.8/real-place-two-correction`, `EulerSystemsCyclotomicMainConjecture:L4/greither-main-conjecture-all-p`, `BorelRegulators:R.5/leading-term-functional-equation`, `BorelRegulators:R.5/borel-zeta-proportionality`, `SpecialValuesBirchTate:B.2/positive-rational-from-valuations`, `IntegralIwasawaTheory:I.2`, `IntegralIwasawaTheory:L2`, `IntegralIwasawaTheory:I.10`, `AutomorphicPadicLFunctions:L3`, `MotivicEtaleKTheory:M.7`.

**Source passages.** [The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.8, printed pp. 515–516: The full corrected finite-group equality for totally real abelian fields.; [Two-primary algebraic K-theory of rings of integers in number fields](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/RognesWeibel.pdf), Theorem 0.2, p. 2; Kolster appendix, Theorem A.1 and proof, Theorem A.2 and Corollary A.3, pp. 45–47: The classical 2-primary special-value consequence holds for even weight and totally real abelian fields.

**Acceptance.** At n=2 the odd K-group order is 2^r₁ w₂, so this reduces to Birch–Tate. ℚ, n=4: ζ(−3)=1/120=2·1/240.

<a id="B-8-integral-equivariant-tate-statement"></a>

### Integral equivariant special-value statement

**Definition** `SpecialValuesBirchTate:B.8/integral-equivariant-tate-statement`. Declaration: `TauCeti.BirchTate.tateMotive_etnc_statement`.

Define tateMotive_etnc_statement(L/E,n) by specializing the PS.5 ETNC predicate to the following data. For a finite Galois extension L/E with G=Gal(L/E), n≥2, take the Tate motive M=h⁰(Spec L)(1−n) with action A=ℚ[G], integral order 𝒜=ℤ[G] and a projective 𝒜-structure. Assuming Burns–Flach’s Coherence hypothesis and the required analytic continuation/order assertions, the imported ETNC predicate is TΩ(M,𝒜)=δ̂¹_{𝒜,ℝ}(L*(A M,0))+RΩ(M,𝒜)=0 in K₀(𝒜,ℝ). Its rationality part is membership in K₀(𝒜,ℚ); its integral part is vanishing. The local equivalent uses the perfect compact-support complex, comparison trivialization and reduced-norm correction in K₀(𝒜_p,ℚ_p). The twist 1−n puts the Dedekind/Artin value at 1−n when the motive is evaluated at s=0.

**Hypotheses and boundary.** L/E finite Galois; integral lattice/projective structure, perfectness and Coherence are supplied by PS.4–PS.5. The general assertion is a conjecture, not a theorem deduced from Borel rational proportionality. Noncommutative coefficients require the center-valued leading term, reduced norm and extended boundary. An ordinary determinant or scalar valuation cannot replace them.

**Construction or proof.**

1. Consume PeriodsAndSpecialValues:PS.5’s ETNC predicate with PS.4’s integral fundamental line, its graded determinant trivialization and finite/local corrections; relative K theory is GeneralAlgebraicKTheory:K.5’s.
2. Specialize Burns–Flach Conjecture 4 with the stated Tate motive; preserve the plus sign in the definition of TΩ. Lemma 9 supplies the extended boundary; Conjectures 5–6 give the rational/local formulations.
3. At G trivial take the determinant-line statement before applying a positive absolute-value map. The rational regulator proportionality only determines a nonzero rational scalar; the torsion factors, real-place corrections and integral lattice index are additional content. For complex places use the nonzero leading coefficient of exact order d_n and the normalized covolume, not ζ_F(1−n) when it vanishes.
4. Under change of lattice, use PS.4’s finite-complex correction to make TΩ intrinsic. Do not infer an integral generator from its image after rationalization.

**Uses that determine the API.**

- `SpecialValuesBirchTate:B.8/lichtenbaum-formula-statements`: This integral/equivariant statement is recorded alongside the positive scalar formula. Taking a scalar image loses information and has no automatic converse..

**Working API.**

- `TauCeti.BirchTate.tateMotive_etnc_statement` (constructor): The PS.5 ETNC predicate evaluated on the Tate motive h⁰(Spec L)(1−n), A=ℚ[G], 𝒜=ℤ[G] and the PS.4 projective structure. Its input data explicitly records n≥2, the projective structure, Coherence and the analytic/order assertions.
- `TauCeti.BirchTate.tateMotive_etnc_statement_iff_class_zero` (characterisation): Under Coherence and analytic/order hypotheses, the predicate is equivalent to δ̂¹(L*)+RΩ=0 in K₀(𝒜,ℝ).
- `TauCeti.BirchTate.tateMotive_etnc_statement_iff_local` (compatibility): Under rationality and Coherence, the predicate is equivalent to vanishing of the corrected local class in K₀(𝒜_p,ℚ_p) for every prime p.
- `TauCeti.BirchTate.tateMotive_etnc_statement_lattice_invariant` (compatibility): Under Coherence and the analytic/order hypotheses, two projective structures on the same Tate motive give the same corrected TΩ, hence equivalent predicates. Use the compact-support finite-quotient trivialization of Burns–Flach Lemma 5 and the global gluing of Lemma 6; the corrections compose under a third change. This is not invariance of an arbitrary uncorrected integral section under scaling.

**Discriminating tests.** Each named test is an example in the suggested file.

- `TauCeti.BirchTate.tateMotive_etnc_trivial_group_weight_two` (compatibility): For G trivial, F=ℚ, n=2, the positive scalar image uses h₂/w₂=2/24=1/12; the K-theoretic image is 2·2/48=1/12. These are images of the determinant statement, not converses.
- `TauCeti.BirchTate.tateMotive_etnc_complex_leading_term` (non-example): For L=ℚ(i), E=ℚ, n=2 the exact leading order is one. The input is the nonzero leading coefficient, whereas the scalar Dedekind value ζ_L(−1)=0 is not a unit and cannot be passed to δ̂¹.
- `TauCeti.BirchTate.tateMotive_etnc_integral_index` (non-example): For the order ℤ and a rank-one integral line with basis e, the rational section 2e has index 2. Its relative K₀(ℤ,ℚ) class has nonzero 2-component; a predicate that merely asks for nonzero rational proportionality would accept it incorrectly.

**Direct dependencies.** `PeriodsAndSpecialValues:PS.4`, `PeriodsAndSpecialValues:PS.5`, `GeneralAlgebraicKTheory:K.5`, `BorelRegulators:R.4/regulator-determinant`, `BorelRegulators:R.4/regulator-covolume`, `BorelRegulators:R.5/zeta-zero-order`, `BorelRegulators:R.5/zeta-leading-coefficient`, `SpecialValuesBirchTate:B.8/lichtenbaum-formula-statements`, `SpecialValuesBirchTate:B.8/real-place-two-correction`.

**Source passages.** [Tamagawa numbers for motives with (non-commutative) coefficients](https://ems.press/content/serial-article-files/25892?nt=1), §4.2, Lemmas 5–6 and their consequence, pp. 527–529; Lemma 9, pp. 534–535; §4.3, Conjectures 4–6 and Remark 9, pp. 535–537: The precise relative-K-group conjecture, sign convention, local correction and graded determinant framework.

**Acceptance.** For G trivial, n=2 and ℚ, the scalar weight-two check is 2/24=1/12; expressing the same K-theoretic ratio as 2/48 requires the real-place factor 2. For ℚ(i), n=2, order d_n=1: ζ_F(−1)=0, while the leading coefficient and rank-one regulator are nonzero. A rational section twice an integral basis is nonzero after scalar extension but does not generate the integral line; rational proportionality is strictly weaker than this predicate.

**Stage status: planned.** Discharge M.7’s two congruence-class real-place comparison sequences; prove the derived scalar correction from those maps. M.8/PS.3 must fix the actual integral motivic lattice and regulator normalization. PS.4–PS.5/K.5 must supply the relative-K/fundamental-line statement objects and Coherence/perfectness interface. The general motivic and ETNC formulas are conjecture statements, not unresolved theorem claims.

## Exact supplier requests and remaining gaps

The following requests are dependencies of this plan. They do not assert that the supplier has finished the output.

### `AutomorphicPadicLFunctions:L3`

Deligne–Ribet annihilator integrality independently of Birch–Tate. Also, at p = 2 for a totally real F: the 2-adic zeta function L₂(χ₀, s) = G_F(u^s − 1)/(u^s − u) with G_F ∈ 2^{[F:ℚ]}ℤ₂[[T]] (Deligne–Ribet), its interpolation L₂(χ₀, −1) = ζ_F(−1)·∏_{𝔭|2}(1 − N𝔭), and for F abelian over ℚ its factorisation ζ_{F,2}(s) = ∏_ψ L₂(s, ψ) into Kubota–Leopoldt L-functions. Also, for odd p: the power series G_ψ, H_ψ with L_p(1 − s, ψ) = G_ψ(κ(γ)^s − 1)/H_ψ(κ(γ)^s − 1) for totally real F, and the interpolation L_p(−1, ω²) = ζ_F(−1)·∏_{v|p}(1 − Nv) at the trivial character twisted by ω². For every even n ≥ 2 also the interpolation L_p(1 − n, ω^n) = ζ_F(1 − n)·∏_{v|p}(1 − Nv^{n−1}). The independent denominator target is the precise untruncated trivial-extension specialization w₂(F)ζ_F(−1)∈ℤ of Deligne–Ribet annihilator integrality; an unspecified bound or truncated-only value is insufficient. For the classical 2-adic even-weight abelian consequence, supply the trivial-character κⁿ interpolation and equality of the analytic and algebraic μ-invariants from the analytic class number formula (Rognes–Weibel appendix, Remark A.4(b)). Rationality at n=2 is imported from B.2, not requested here.

Consumers: `SpecialValuesBirchTate:B.5/federer-main-conjecture`, `SpecialValuesBirchTate:B.5/federer-implies-two-primary-birch-tate`, `SpecialValuesBirchTate:B.5/federer-conjecture-for-abelian-fields`, `SpecialValuesBirchTate:B.4/etale-euler-characteristic-and-zeta`, `SpecialValuesBirchTate:B.8/odd-primary-even-weight-euler-characteristic`, `SpecialValuesBirchTate:B.6/kurihara-kolster-series-dictionary`, `SpecialValuesBirchTate:B.2/independent-denominator-integrality`, `SpecialValuesBirchTate:B.8/higher-values-real-abelian`.

### `ArithmeticKTheory:N.6`

Kolster's exact sequence for a totally real field E (The structure of the 2-Sylow subgroup of K₂(o), II, K-theory 1 (1987), Theorem 3.7): 0 → (μ₂ ⊗ U_∞^+)^Γ → K₂(o)(2) → (𝒯 ⊗_{ℤ₂} A_∞^-)^Γ → H¹(Γ, μ₂ ⊗ U_∞^+) → 0, for the cyclotomic ℤ₂-tower F_n = E(ζ_{2^{n+e}}), as the 2-adic case of the stage's comparison of even K-groups with arithmetic cohomology. Also, for ℓ odd and n ≥ 2 (Kolster's Park City notes, Proposition 2.1, Corollary 2.2 and Proposition 2.3): H⁰ and H^{≥3} of 𝓞_F[1/ℓ] with ℤ_ℓ(n) vanish; H¹(𝓞_F[1/ℓ], ℤ_ℓ(n)) ≅ H¹(F, ℤ_ℓ(n)) of rank r₁ + r₂ or r₂ for n odd or even; H² is finite; the boundary description of the coefficient sequence; H¹(𝓞_F[1/ℓ], ℚ_ℓ/ℤ_ℓ(n)) ≅ H²(𝓞_F[1/ℓ], ℤ_ℓ(n)) for F totally real and n even; and Galois descent and codescent for E/F of degree prime to ℓ. For the numerical adapter provide actual cohomological groups, primary-factor orders and finiteness with almost-all vanishing; H¹ rank/torsion uses the nonzero Tate twist. The integral motivic lattice itself is imported from M.8/PS.3.

Consumers: `SpecialValuesBirchTate:B.5/tame-kernel-two-part-via-iwasawa`, `SpecialValuesBirchTate:B.4/w2-ell-part-as-etale-cohomology`, `SpecialValuesBirchTate:B.4/etale-euler-characteristic-and-zeta`, `SpecialValuesBirchTate:B.8/cohomological-h2-model`, `SpecialValuesBirchTate:B.8/odd-primary-even-weight-euler-characteristic`.

### `IntegralIwasawaTheory:I.2`

For a totally real E and p = 2, the cyclotomic tower F_n = E(ζ_{2^{n+e}}): the minus class module A_∞^- = lim→ ker(A(F_n) → A(F_n^+)) with its dual Ǎ_∞^- a finitely generated torsion ℤ₂[[T]]-module; Federer's theorem that Ǎ_∞^- has no nonzero finite Λ-submodule; and Iwasawa's Proposition 2 (Amer. J. Math. 105 (1983)) on H¹(Γ, ℰ) ≅ B ⊕ (ℚ₂/ℤ₂)^r and H²(Γ, ℰ) ≅ (ℚ₂/ℤ₂)^{r−1} for the free part ℰ of lim→ U_n^+. Also, for odd p and E/F abelian of degree prime to p containing μ_p, with E_∞ its cyclotomic ℤ_p-extension: Hom(X_S, ℚ_p/ℤ_p(n)) = H¹_ét(𝓞^S_{E_∞}, ℚ_p/ℤ_p(n)), and the twists X_ψ(−n) of the even components have no nonzero finite Λ-submodule. Also at p=2, for the S-ramified X(F) of a totally real F, X and the even twists X(−n) have no nonzero finite Λ-submodules; use the explicit duality to Galois cohomology in Rognes–Weibel Appendix A.1.

Consumers: `SpecialValuesBirchTate:B.5/federer-main-conjecture`, `SpecialValuesBirchTate:B.5/tame-kernel-two-part-via-iwasawa`, `SpecialValuesBirchTate:B.5/minus-module-coinvariant-order`, `SpecialValuesBirchTate:B.4/etale-euler-characteristic-and-zeta`, `SpecialValuesBirchTate:B.8/odd-primary-even-weight-euler-characteristic`, `SpecialValuesBirchTate:B.8/higher-values-real-abelian`.

### `IntegralIwasawaTheory:L2`

The coinvariant lemma: for a finitely generated torsion ℤ_p[[T]]-module M with M_Γ finite and M^Γ = 0, |M_Γ| ~ char_M(0); and the twist rule char(M(−1))(T) = char(M)(u^{−1}(1 + T) − 1) for the action (γφ)(x) = φ(γx) (Lichtenbaum, Lemma 4.1). Supply the general twist n rule and finite evaluation at κⁿ−1, for the classical even-weight consequence.

Consumers: `SpecialValuesBirchTate:B.5/minus-module-coinvariant-order`, `SpecialValuesBirchTate:B.4/etale-euler-characteristic-and-zeta`, `SpecialValuesBirchTate:B.8/odd-primary-even-weight-euler-characteristic`, `SpecialValuesBirchTate:B.8/higher-values-real-abelian`.

### `IntegralIwasawaTheory:L4`

The Ferrero–Washington theorem at p = 2 for the cyclotomic ℤ₂-extension of an abelian field: μ(X^-) = 0.

Consumers: `SpecialValuesBirchTate:B.5/federer-conjecture-for-abelian-fields`.

### `DirichletPadicLFunctions:L2`

Twists by characters of the second kind at p = 2: for χ of the first kind and ρ of finite order on Γ, L₂(s, χρ) = G₂(ζu^s − 1, χ)/(ζu^s − u)^{δ(χ)}, with ζ the root of unity attached to ρ(γ) and δ(χ) = 1 exactly for trivial χ (Washington, Theorem 7.10), with the convention for ζ (ρ(γ) or its inverse) fixed explicitly.

Consumers: `SpecialValuesBirchTate:B.5/federer-conjecture-for-abelian-fields`.

### `IntegralIwasawaTheory:I.5`

Wiles's main conjecture for a totally real field F and an odd prime p (Kolster, Iwasawa's Main Conjecture 1.3): for every 1-dimensional p-adic Artin character ψ of type S, the distinguished polynomial of G_{ψ,S} equals the characteristic polynomial of γ − 1 on the ψ-part of X_S ⊗ ℚ_p; with Wiles's μ(X_ψ) = μ(G_ψ) (1990, Theorem 1.4), so char(X_ψ) = (G_ψ(T)) for ψ ≠ 1 of order prime to p.

Consumers: `SpecialValuesBirchTate:B.4/etale-euler-characteristic-and-zeta`, `SpecialValuesBirchTate:B.8/odd-primary-even-weight-euler-characteristic`.

### `MotivicEtaleKTheory:M.3`

Tate's degree-two comparison for S-integers: for a number field F, a prime ℓ and S ⊇ {v | ℓ}, K₂(𝓞_{F,S})/ℓ^r ≅ H²_ét(𝓞_{F,S}, μ_{ℓ^r}^{⊗2}), compatibly in r (the stage's public statement), for ℓ odd. Supply naturality for S⊆T and all residue/coefficient maps, and the Tate degree-two H² identification at 2 as used in h₂ (not an uncorrected higher-degree formula).

Consumers: `SpecialValuesBirchTate:B.4/k2-ell-part-as-etale-cohomology`, `SpecialValuesBirchTate:B.8/cohomological-h2-model`, `SpecialValuesBirchTate:B.7/localisation-comparison-naturality`.

### `MotivicEtaleKTheory:M.7`

The Quillen–Lichtenbaum outputs at odd ℓ and n ≥ 2 for rings of integers: K_{2n−2}(𝓞_F) ⊗ ℤ_ℓ ≅ H²_ét(𝓞_F[1/ℓ], ℤ_ℓ(n)) and K_{2n−1}(𝓞_F) ⊗ ℤ_ℓ ≅ H¹_ét(𝓞_F[1/ℓ], ℤ_ℓ(n)) (the stage's 'expected arithmetic outputs'); and, for the correction at 2 with real places, the corrected sequences. Specifically for F totally real and even n, provide the two congruence-class sequences of Rognes–Weibel Theorem 0.6: n≡2 mod4, K_{2n−2}{2}≅H² and #K_{2n−1}{2}=2^r₁w_n{2}; n≡0 mod4, K_{2n−2}{2}≅ker(H²→(ℤ/2)^r₁) with surjective real restriction and #K_{2n−1}{2}=w_n{2}. Their maps commute with finite-S localization. Include the coefficient and Hochschild–Serre identifications in Appendix A.1, relating finite X(−n) coinvariants to H²_ét, with H¹ order w_n for totally real F and even n.

Consumers: `SpecialValuesBirchTate:B.8/odd-primary-lichtenbaum-totally-real`, `SpecialValuesBirchTate:B.7/localisation-comparison-naturality`, `SpecialValuesBirchTate:B.8/real-place-two-correction`, `SpecialValuesBirchTate:B.8/higher-values-real-abelian`.

### `IntegralIwasawaTheory:I.9`

Kurihara's Theorem 4.1 at p = 2 with k = F totally real and F/k trivial, S = S_2 ∪ S_∞: Det(RΓ_c(𝒪_{F_∞,S}, ℤ_2(1)))^{−1} = g_{F_∞/F,S}Λ, H² = X_{F_∞,S}, H³ = ℤ_2, and the resulting char(X_{F_∞,S}) = ((γ − 1)g_{F_∞/F,S}); with the interpolation κ^nψ(g) = L_S(1 − n, ψ).

Consumers: `SpecialValuesBirchTate:B.6/kurihara-kolster-series-dictionary`, `SpecialValuesBirchTate:B.6/kurihara-main-conjecture-over-f`.

### `IntegralIwasawaTheory:I.10`

Accepted RS-16’s comparison: the exact old/new coefficient-ring and module dictionary, dual action and norm-kernel (not eigenspace) convention at 2; characteristic contribution (2^[F:ℚ]) from an explicit real-place correction diagram; κ² derived specialization and its K₂/W₂ finite cohomology. Retain Kurihara Lemma 4.2(1)’s order-two cokernel and every finite kernel, cokernel and Tor contribution. Prove the finite Euler-characteristic equality needed for Kolster’s implication, rather than discard finite modules because height-one localization kills them. Export compatibility under finite S enlargement. Separately supply the classical character-induction/going-up comparison of Rognes–Weibel Appendix A.2–A.3 for an abelian extension of ℚ, as used in the even-weight theorem; this request does not assert that the modern weight-two comparison extends to every weight.

Consumers: `SpecialValuesBirchTate:B.6/kurihara-kolster-series-dictionary`, `SpecialValuesBirchTate:B.6/kolster-kurihara-comparison-table`, `SpecialValuesBirchTate:B.7/localisation-comparison-naturality`, `SpecialValuesBirchTate:B.8/higher-values-real-abelian`.

### `PeriodsAndSpecialValues:PS.3`

The normalized integral motivic H¹ lattice and its regulator determinant/covolume R_n^M, with the actual K/motivic comparison and the exact power-of-two change relative to R.4’s Borel measure. Do not construct a lattice by choosing groups from p-adic completions.

Consumers: `SpecialValuesBirchTate:B.8/cohomological-h2-model`, `SpecialValuesBirchTate:B.8/lichtenbaum-formula-statements`.

### `MotivicEtaleKTheory:M.8`

The actual integral arithmetic H¹/H² motivic groups, their regulator and Chern maps, with arithmetic localization and the integral-lattice comparison used in the full motivic scalar formula.

Consumers: `SpecialValuesBirchTate:B.8/cohomological-h2-model`, `SpecialValuesBirchTate:B.8/lichtenbaum-formula-statements`.

### `PeriodsAndSpecialValues:PS.4`

For the Tate motive h⁰(Spec L)(1−n) over ℤ[G], the perfect global/local complexes, projective lattice, Coherence hypothesis and graded real comparison trivialization defining RΩ. Track finite kernel/cokernel, dyadic real-place and local Euler corrections under changes of S and lattice. In particular, supply the actual finite-quotient determinant trivialization and global gluing from Burns–Flach Lemmas 5–6 for independence of the corrected object from the projective structure.

Consumers: `SpecialValuesBirchTate:B.8/integral-equivariant-tate-statement`.

### `PeriodsAndSpecialValues:PS.5`

Burns–Flach 2001 §4.3 Conjecture 4 and its Conjectures 5–6 local equivalents: TΩ = δ̂¹(L*)+RΩ, the extended reduced-norm boundary and rationality/integrality predicates in relative K₀, specialized to h⁰(Spec L)(1−n). Supply this statement infrastructure, not a proof of the general conjecture. Expose the Tate-motive input data (projective structure, n≥2, Coherence and analytic/order inputs) in the suggested interface; the local equivalence additionally requires rationality. The proposed TateETNCData record exposes those inputs; TateETNCRationality is the separate local-equivalence hypothesis, and SameTateRationalData fixes the rational comparison while changing the projective structure.

Consumers: `SpecialValuesBirchTate:B.8/integral-equivariant-tate-statement`.

### `GeneralAlgebraicKTheory:K.5`

Relative K₀(𝒜,ℝ) for an order in a semisimple ℚ-algebra, its localization boundary from K₁(𝒜_ℝ), functoriality, and the perfect-complex/trivialization class used by the PS.4–PS.5 adapter.

Consumers: `SpecialValuesBirchTate:B.8/integral-equivariant-tate-statement`.

### `KTheoryFiniteLocalFields:L.1`

Finite-field K_{2j}=0 for j≥1 and the finite positive odd groups, as used to prove that localization on K_{2n−1}, n≥2, is surjective with finite kernel. This supplies the integral torsion-free lattice isomorphism before taking a regulator determinant.

Consumers: `SpecialValuesBirchTate:B.7/localisation-comparison-naturality`.

### Gap: The upper bound in K₂(ℤ) ≅ ℤ/2

K2SymbolsBrauer T.5/k2-of-the-integers proves #K₂(ℤ) ≥ 2 through the sign symbol and records Milnor's Euclidean-algorithm computation of the upper bound as a gap. Birch–Tate for ℚ needs the exact order 2, so it rests on that gap until T.5 closes it.

Affects: `SpecialValuesBirchTate:B.3/k2-of-the-rationals-ring-of-integers`, `SpecialValuesBirchTate:B.3/birch-tate-for-the-rationals`.

### Gap: Independent upper bound for the quadratic tame kernel

ArithmeticKTheory:N.8/real-quadratic-example-and-birch-tate supplies the sign-symbol lower bound #K₂(𝓞_{ℚ(√5)}) ≥ 4. Its missing independent generation proof must establish the upper bound ≤ 4 and discharge N.6’s certificate span obligation. The B.5 theorem can give order 4 as a corollary, but cannot certify this independent test.

Affects: `SpecialValuesBirchTate:B.3/sqrt-five-birch-tate-check`.

### Gap: The exact modern-to-classical finite descent diagram

IntegralIwasawaTheory:I.10 owns the missing exact comparison under RS-16: norm-kernel minus module, dual action, κ² specialization, order-two cokernel, real-place correction and Tor/finite cohomology terms. Kurihara §4.2 proves a height-one determinant identity, not the unstated arithmetic-specialization equivalence. B.6 records the formula as a proof target depending on that diagram.

Affects: `SpecialValuesBirchTate:B.6/kolster-kurihara-comparison-table`, `SpecialValuesBirchTate:B.6/federer-conjecture-all-totally-real`, `SpecialValuesBirchTate:B.6/birch-tate-all-totally-real`.

## Source register and corrections

Download hashes and version records are fixed in the packet. This register distinguishes fresh source reads from the inherited checkpoint provenance.

### Kbook.2013

[The K-book: An Introduction to Algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Charles A. Weibel. Author-hosted combined draft dated 29 August 2013 (published as Graduate Studies in Mathematics 145, American Mathematical Society, 2013); printed page = PDF page − 8; accessed 2026-09-28

Read date: Inherited 2026-09-29 provenance; cited passages rechecked 2026-10-06. Sections: VI.8.1–8.8 (PDF pp. 522–524, book pp. 514–516): Classical Data 8.1, the Birch–Tate Conjecture 8.6 and the paragraph after it, Wiles's Theorem 8.7 with its note, Theorem 8.8 and the first paragraph of its proof (the sign from the functional equation). Fresh read 2026-10-06: VI.8.6–8.8, printed pp. 515–516. Fresh read 2026-10-06: V.11.11 proof and V.11.12(4), construction/naturality and ℓ-adic étale Chern classes; VI.9.4 proof and VI.9.5 statement/proof, real-place restriction and odd higher S-integer groups.

### kolster-park-city-2009

[Special values of L-functions at negative integers](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf), Manfred Kolster. Lecture notes, IAS/Park City Mathematics Series (author preprint, 2009, 22 pages); printed page = PDF page; accessed 2026-09-28

Read date: Inherited 2026-09-29 provenance; cited passages rechecked 2026-10-06. Sections: Introduction (p. 3); Lecture 1 §1 through the imprimitive p-adic L-functions (pp. 5–8); Lecture 2 §3, Theorem 3.3 to the Motivic Lichtenbaum Conjecture 3.7 (pp. 15–16). Fresh read 2026-10-06: Lecture 1 §2 pp. 9–11 and Lecture 2 §3–start §4 pp. 13–16. E3–E6 are scoped to this author preprint; no version of record was obtained. Fresh read 2026-10-06 also rechecked the finite-S Iwasawa/L-function conventions in Lecture 1 §1 (printed pp. 7–8).

### KOLSTER-1989

[A relation between the 2-primary parts of the main conjecture and the Birch–Tate-conjecture](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/BBA978AE0673CACCF3656F4E23200201/S0008439500000862a.pdf/a-relation-between-the-2-primary-parts-of-the-main-conjecture-and-the-birch-tate-conjecture.pdf), Manfred Kolster. Canad. Math. Bull. 32 (2) (1989), 248–251; Cambridge Core PDF, 4 pages, printed page = PDF page + 247. Formulas were checked on the page images. Re-downloaded 2026-10-06; the Cambridge wrapper hash differs from the inherited 2026-09-29 download, and printed p. 250 was rechecked on the page image.

Read date: 2026-10-06. Sections: The whole note: introduction and set-up (p. 248), Theorem 1 and its proof (pp. 249–250), Lemma 2, Conjecture 3 (Federer), Conjecture 4 and Theorem 5 with its proof (p. 250)

### GREITHER-1992

[Class groups of abelian fields, and the main conjecture](http://www.numdam.org/item/AIF_1992__42_3_449_0.pdf), Cornelius Greither. Ann. Inst. Fourier (Grenoble) 42 (1992), no. 3, 449–499; Numdam scan with OCR text layer (journal page = PDF page + 447).

Read date: 2026-09-29. Sections: §1: the Main Conjecture (= Theorem 3.2) and the closing remark on Birch–Tate (pp. 452–454) §3: Lemma 3.3 (p. 469). The whole article is decomposed in EulerSystemsCyclotomicMainConjecture L4, whose nodes are imported. Fresh read 2026-10-06: Theorem 3.2 and its introductory consequences (pp. 452–454), Lemma 3.3 (p. 469).

### KURIHARA-2025

[On class groups and Iwasawa modules of CM-fields](https://kurihara.math.keio.ac.jp/ClassGroupsIwasawaModules.pdf), Masato Kurihara. Author copy (2025), 37 pages, printed page = PDF page; the copy in the programme's reference catalogue.

Read date: 2026-09-29. Sections: §4 in full: §4.1 the formulation (pp. 22–24), Theorem 4.1, §4.2 the proof with Lemma 4.2 and the three remarks, Corollary 4.3 (pp. 24–28), §4.3 Proposition 4.4 (p. 28) Fresh read 2026-10-06: §4.1–§4.2 (pp. 22–27); the inherited complete §4 reading remains provenance, not a claim to a second full read.

### ROGNES-WEIBEL-2000

[Two-primary algebraic K-theory of rings of integers in number fields](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/RognesWeibel.pdf), John Rognes and Charles A. Weibel; appendix by Manfred Kolster. J. Amer. Math. Soc. 13 (2000), 1–54; author-hosted journal copy

Read date: 2026-10-06. Sections: Introduction, Theorems 0.1–0.3 and 0.6 (pp. 1–4); Kolster appendix, Theorem A.1 and proof, Theorem A.2 and Corollary A.3 (pp. 45–47). The full K/cohomology comparison proof remains M.7’s.

### BURNS-FLACH-2001

[Tamagawa numbers for motives with (non-commutative) coefficients](https://ems.press/content/serial-article-files/25892?nt=1), David Burns and Matthias Flach. Documenta Mathematica 6 (2001), 501–570; publisher PDF

Read date: 2026-10-06. Sections: §4.2 Lemma 9 and §4.3 Conjectures 4–6, Remark 9 (pp. 534–537); general determinant constructions remain PS.4–PS.5’s. Fresh read 2026-10-06: conclusion of Lemma 5 and Lemma 6 with proof, pp. 527–529, and the consequence that Ξ(M)ℤ and RΩ are independent of S and the projective structure under Coherence.

### COHEN-ANT-2007

[Number Theory, Volume II: Analytic and Modern Tools](https://maths.dur.ac.uk/users/herbert.gangl/ch.pdf), Henri Cohen. Graduate Texts in Mathematics 240, Springer, 2007; university-hosted book PDF

Read date: 2026-10-06. Sections: §10.5.1 Theorem 10.5.3 (p. 218); §10.5.2 Proposition 10.5.5 and its Euler-factor proof (p. 219); §10.3.1 Theorem 10.3.1 and Corollary 10.3.3 with proof (pp. 186–189).

Kolster 1989 printed p. 250 was also inspected on the page image. The re-downloaded Cambridge PDF has a different wrapper hash; both downloads remain documented. E3–E6 concern the 2009 author preprint: the published Park City volume was not obtained. Searches found no erratum for the inherited findings; they still require independent review. No new source error is asserted by this pass.

### SpecialValuesBirchTate/E1 — misprint

**Version and locator.** KOLSTER-1989; proof of Theorem 5, p. 250 (Cambridge Core PDF of the published note)

**Printed.** Since L₂(χ₀, −1) ~ ζ_e(−1), we get w₂(E)·ζ_E(−1) ~ …

**Correction.** Since L₂(χ₀, −1) ~ ζ_E(−1), …

**Reason.** e is the integer with F₀ = E(ζ_{2^e}); the zeta function is that of the base field E, as in Conjecture 4 and in the same line. L₂(χ₀, −1) = ζ_E(−1)·∏_{𝔭|2}(1 − N𝔭) with odd factors.

Affects: nothing. Known correction: new. Searched: Cambridge Core article page for Canad. Math. Bull. 32 (1989) 248–251 (no erratum linked); web search for an erratum to Kolster's note (none found).

### SpecialValuesBirchTate/E2 — misprint

**Version and locator.** KOLSTER-1989; before Lemma 2, p. 250

**Printed.** Since A_∞^- has no non-trivial finite Λ-submodules (cf. [4]), the order of (𝒯 ⊗_{ℤ₂} A_∞^-)^Γ … is as usual determined by evaluating the characteristic polynomial at T = 0.

**Correction.** Since Ǎ_∞^- has no non-trivial finite Λ-submodules (cf. [4]), …

**Reason.** A_∞^- = lim→ A_n^- is a union of the images of the finite Λ-modules A_n^-, so it has nonzero finite Λ-submodules whenever it is nonzero. The evaluation argument needs the compact dual Ǎ_∞^- (hence Ǎ_∞^-(−1)) to have none, so that Ǎ_∞^-(−1)^Γ = 0 and |Ǎ_∞^-(−1)_Γ| ~ f(u^{−1} − 1). The OCR and the page image both show A_∞^- without the accent.

Affects: nothing. Known correction: new. Searched: Cambridge Core article page for Canad. Math. Bull. 32 (1989) 248–251 (no erratum linked); web search for an erratum to Kolster's note (none found).

### SpecialValuesBirchTate/E3 — misprint

**Version and locator.** kolster-park-city-2009; Lecture 2, §3, after the Motivic Lichtenbaum Conjecture 3.7, p. 16 (author copy)

**Printed.** This conjecture is known to be true (assuming Bloch-Kato) if F is totally real abelian and n ≥ 2 is even (cp. Theorem 3.4) and in a few other cases.

**Correction.** (cp. Corollary 3.4)

**Reason.** The notes have no Theorem 3.4; the statement for totally real F and even n ≥ 2 is Corollary 3.4 (p. 15), and the numbered items of §3 are Proposition 3.1, Proposition 3.2, Theorem 3.3, Corollary 3.4 and Conjectures 3.5–3.7.

Affects: nothing. Known correction: new. Searched: the author's copy at maine-quebec.mat.ulaval.ca (the version read; no revision is posted there); the published volume (IAS/Park City Mathematics Series) was not accessed; research/errata/REGISTER.md: no entry for these notes.

### SpecialValuesBirchTate/E4 — misprint

**Version and locator.** kolster-park-city-2009; Lecture 1, §2, p. 9 (author copy)

**Printed.** the torsion subgroup of H¹_ét(o′_F, ℤ_p(n)) is isomorphic to H⁰_ét(o′_F, ℚ_p/ℤ_p(n)) = H⁰(f, ℚ_p/ℤ_p(n))

**Correction.** … = H⁰(F, ℚ_p/ℤ_p(n))

**Reason.** F is the number field; f is not defined in the notes (checked on the page image).

Affects: nothing. Known correction: new. Searched: the author's copy at maine-quebec.mat.ulaval.ca (the version read; no revision is posted there); the published volume (IAS/Park City Mathematics Series) was not accessed; research/errata/REGISTER.md: no entry for these notes.

### SpecialValuesBirchTate/E5 — error

**Version and locator.** kolster-park-city-2009; Lecture 1, §2, p. 9 (author copy)

**Printed.** We note the following: For each n ∈ ℤ the exact sequence 0 → ℤ_p(n) → ℚ_p(n) → ℚ_p(n)/ℤ_p(n) → 0 gives rise to a long exact sequence … In particular this implies that the torsion subgroup of H¹_ét(o′_F, ℤ_p(n)) is isomorphic to H⁰_ét(o′_F, ℚ_p/ℤ_p(n))

**Correction.** The isomorphism H¹_ét(o′_F, ℤ_p(n))_tors ≅ H⁰_ét(o′_F, ℚ_p/ℤ_p(n)) holds for n ≠ 0. In general H¹_tors is H⁰(ℚ_p/ℤ_p(n)) modulo its maximal divisible subgroup.

**Reason.** By the preceding sentence the kernel of δ₁ is the maximal divisible subgroup of H⁰(ℚ_p/ℤ_p(n)). For n = 0 this is all of H⁰(o′_F, ℚ_p/ℤ_p) = ℚ_p/ℤ_p, while H¹_ét(o′_F, ℤ_p) = Hom_cts(G_F^{(p)}, ℤ_p) is torsion-free. For n ≠ 0 the cyclotomic character has infinite image, so H⁰ is finite and the isomorphism holds. The notes use it only for n ≥ 2.

Affects: nothing. Known correction: new. Searched: the author's copy at maine-quebec.mat.ulaval.ca (the version read; no revision is posted there); the published volume (IAS/Park City Mathematics Series) was not accessed; research/errata/REGISTER.md: no entry for these notes.

### SpecialValuesBirchTate/E6 — error

**Version and locator.** kolster-park-city-2009; Lecture 1, §2, p. 11 (author copy)

**Printed.** The resulting group H¹(o_F, ℤ(n)) is an analog of the group of units. It is a finitely generated abelian group of rank r₂ if n ≥ 3 is odd, r₁ + r₂ if n ≥ 2 is even

**Correction.** … of rank r₁ + r₂ if n ≥ 3 is odd, r₂ if n ≥ 2 is even

**Reason.** The same paragraph requires H¹(o_F, ℤ(n)) ⊗ ℤ_p ≅ H¹_ét(o′_F, ℤ_p(n)), whose rank is r₁ + r₂ for odd n and r₂ for even n by the notes' own Proposition 2.1(5) (p. 10); these are also Borel's ranks of K_{2n−1}(o_F) (p. 15). For F = ℚ and n = 2 the printed rank is 1, but H¹_ét(ℤ[1/p], ℤ_p(2)) is finite (r₂ = 0), matching K₃(ℤ) ≅ ℤ/48. Checked on the page image.

Affects: nothing. Known correction: new. Searched: the author's copy at maine-quebec.mat.ulaval.ca (the version read; no revision is posted there); the published volume (IAS/Park City Mathematics Series) was not accessed; research/errata/REGISTER.md: no entry for these notes.

## Pinned baseline inputs

These declarations supply only the indicated inputs, not the missing arithmetic special-value conclusions. Each statement was read at the pinned commit; a name search alone was not treated as evidence.

| Declaration | Module | Provides |
| --- | --- | --- |
| `mathlib:AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` | `Mathlib/Analysis/Analytic/Uniqueness.lean` | The identity principle for analytic functions on a connected set. |
| `mathlib:Complex.Gamma_add_one` | `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean` | Γ(s + 1) = sΓ(s) for s ≠ 0. |
| `mathlib:Complex.Gamma_neg_nat_eq_zero` | `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean` | Mathlib's totalised Γ is 0 at the nonpositive integers (the value a proof must not rely on). |
| `mathlib:Complex.Gamma_one` | `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean` | Γ(1) = 1. |
| `mathlib:Complex.Gamma_one_half_eq` | `Mathlib/Analysis/SpecialFunctions/Gaussian/GaussianIntegral.lean` | Γ(1/2) = π^{1/2}. |
| `mathlib:Complex.Gammaℂ` | `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean` | Deligne's complex archimedean factor 2(2π)^{−s}Γ(s). |
| `mathlib:Complex.Gammaℝ` | `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean` | Deligne's real archimedean factor π^{−s/2}Γ(s/2). |
| `mathlib:Complex.Gammaℝ_eq_zero_iff` | `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean` | Mathlib's totalised Γ_ℝ vanishes exactly at 0, −2, −4, …. |
| `mathlib:Complex.Gammaℝ_ne_zero_of_re_pos` | `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean` | Γ_ℝ(s) ≠ 0 for Re s > 0. |
| `mathlib:Complex.differentiable_Gammaℝ_inv` | `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean` | The reciprocal Γ_ℝ⁻¹ is entire. |
| `mathlib:Complex.differentiable_one_div_Gamma` | `Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean` | The reciprocal 1/Γ is entire. |
| `mathlib:DirichletCharacter` | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean` | Dirichlet characters. |
| `mathlib:DirichletCharacter.LFunction` | `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean` | The continued Dirichlet L-function. |
| `mathlib:DirichletCharacter.LFunction_eq_LSeries` | `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean` | The continued L-function is the L-series on Re s > 1. |
| `mathlib:DirichletCharacter.differentiable_LFunction` | `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean` | L(s, χ) is entire for χ ≠ 1. |
| `mathlib:Finset.prod` | `Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean` | Finite products over S. |
| `mathlib:HurwitzZeta.hurwitzZeta_neg_nat` | `Mathlib/NumberTheory/LSeries/HurwitzZetaValues.lean` | ζ(x, −k) = −B_{k+1}(x)/(k+1) for k ≥ 1 and x ∈ [0, 1]. |
| `mathlib:Ideal.absNorm` | `Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean` | The absolute norm Nv = #(𝓞_F/v). |
| `mathlib:Ideal.absNorm_eq_one_iff` | `Mathlib/RingTheory/Ideal/Norm/AbsNorm.lean` | An ideal has absolute norm 1 iff it is the whole ring. |
| `mathlib:IsCyclotomicExtension` | `Mathlib/NumberTheory/Cyclotomic/Basic.lean` | Cyclotomic extensions, for the fields F(μ_{ℓ^ν}). |
| `mathlib:IsDedekindDomain.HeightOneSpectrum` | `Mathlib/RingTheory/DedekindDomain/Ideal/Lemmas.lean` | The maximal ideals (finite places) of 𝓞_F. |
| `mathlib:KummerDedekind.normalizedFactorsMapEquivNormalizedFactorsMinPolyMk` | `Mathlib/NumberTheory/KummerDedekind.lean` | Kummer–Dedekind: prime factors of p𝓞 against factors of the minimal polynomial mod p. |
| `mathlib:LSeries` | `Mathlib/NumberTheory/LSeries/Basic.lean` | The L-series of an arithmetic sequence. |
| `mathlib:LSeries.convolution` | `Mathlib/NumberTheory/LSeries/Convolution.lean` | Dirichlet convolution of sequences. |
| `mathlib:LSeries_convolution'` | `Mathlib/NumberTheory/LSeries/Convolution.lean` | The L-series of a convolution is the product of the L-series where both converge. |
| `mathlib:LSeries_one_eq_riemannZeta` | `Mathlib/NumberTheory/LSeries/Dirichlet.lean` | The L-series of the constant 1 is riemannZeta on Re s > 1. |
| `mathlib:Module.finrank` | `Mathlib/LinearAlgebra/Dimension/Finrank.lean` | The degree [F:ℚ]. |
| `mathlib:Module.finrank_self` | `Mathlib/LinearAlgebra/Dimension/StrongRankCondition.lean` | [ℚ:ℚ] = 1. |
| `mathlib:Nat.card_pi` | `Mathlib/SetTheory/Cardinal/Finite.lean` | The order of a finite product is the product of the orders. |
| `mathlib:Nat.card_units` | `Mathlib/Algebra/GroupWithZero/Units/Fintype.lean` | #(k^×) = #k − 1 for a finite field k. |
| `mathlib:Nat.eq_iff_prime_padicValNat_eq` | `Mathlib/Data/Nat/Factorization/Basic.lean` | Two positive naturals are equal iff all their prime valuations agree. |
| `mathlib:NumberField.InfinitePlace.card_add_two_mul_card_eq_rank` | `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean` | r_1 + 2r_2 = [F:ℚ]. |
| `mathlib:NumberField.IsTotallyReal` | `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean` | The hypothesis that every infinite place is real. |
| `mathlib:NumberField.IsTotallyReal.nrComplexPlaces_eq_zero` | `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean` | A totally real field has no complex places. |
| `mathlib:NumberField.RingOfIntegers` | `Mathlib/NumberTheory/NumberField/Basic.lean` | The ring of integers 𝓞_F. |
| `mathlib:NumberField.dedekindZeta` | `Mathlib/NumberTheory/NumberField/DedekindZeta.lean` | The Dedekind zeta function as the L-series of the ideal count (meaningful on Re s > 1). |
| `mathlib:NumberField.discr` | `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean` | The discriminant d_F. |
| `mathlib:Polynomial.bernoulli` | `Mathlib/NumberTheory/BernoulliPolynomials.lean` | The Bernoulli polynomials. |
| `mathlib:QuotientGroup.quotientKerEquivOfSurjective` | `Mathlib/GroupTheory/QuotientGroup/Basic.lean` | First isomorphism theorem for a surjective homomorphism. |
| `mathlib:Rat.den_dvd` | `Mathlib/Data/Rat/Lemmas.lean` | The reduced denominator of a/b divides b. |
| `mathlib:Rat.num_div_den` | `Mathlib/Algebra/Ring/Rat.lean` | A rational number is its numerator over its denominator. |
| `mathlib:Rat.ringOfIntegersEquiv` | `Mathlib/NumberTheory/NumberField/Basic.lean` | 𝓞_ℚ ≃+* ℤ. |
| `mathlib:Set.integer` | `Mathlib/RingTheory/DedekindDomain/SInteger.lean` | The ring of S-integers. |
| `mathlib:Subgroup.card_mul_index` | `Mathlib/GroupTheory/Index.lean` | #H · [G:H] = #G. |
| `mathlib:ZMod.LFunction_def_even` | `Mathlib/NumberTheory/LSeries/ZMod.lean` | L(s, Φ) for even Φ as a sum of even Hurwitz zeta functions. |
| `mathlib:bernoulli_two` | `Mathlib/NumberTheory/Bernoulli.lean` | B_2 = 1/6. |
| `mathlib:differentiableAt_riemannZeta` | `Mathlib/NumberTheory/LSeries/RiemannZeta.lean` | riemannZeta is holomorphic away from 1. |
| `mathlib:legendreSym` | `Mathlib/NumberTheory/LegendreSymbol/Basic.lean` | The Legendre symbol, the character χ₅ = (·/5). |
| `mathlib:legendreSym.quadratic_reciprocity_one_mod_four` | `Mathlib/NumberTheory/LegendreSymbol/QuadraticReciprocity.lean` | Quadratic reciprocity for a prime ≡ 1 (mod 4). |
| `mathlib:padicValRat` | `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` | The p-adic valuation of a rational number. |
| `mathlib:padicValRat.div` | `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` | v_p(q/r) = v_p(q) − v_p(r) for nonzero q, r. |
| `mathlib:padicValRat.mul` | `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` | v_p(qr) = v_p(q) + v_p(r) for nonzero q, r. |
| `mathlib:padicValRat.of_nat` | `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` | padicValRat agrees with padicValNat on naturals. |
| `mathlib:riemannZeta_neg_nat_eq_bernoulli` | `Mathlib/NumberTheory/LSeries/HurwitzZetaValues.lean` | ζ(−k) = (−1)^k B_{k+1}/(k+1). |
| `tauceti:NumberField.adjoin_halfGen_eq_top_of_mod_four_eq_one` | `TauCeti/NumberTheory/NumberField/Quadratic/RingOfIntegers.lean` | 𝓞_{ℚ(√d)} = ℤ[(1+√d)/2] for squarefree d ≡ 1 (mod 4). |
| `tauceti:TauCeti.EulerProductData.restrictAway` | `TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Data.lean` | Euler-product data restricted away from a set of primes. |
| `tauceti:TauCeti.EulerProductData.restrictAway_apply` | `TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Data.lean` | The restricted data vanish on ideals not prime to S. |
| `tauceti:TauCeti.LSeriesSummable_dedekindZetaCoeff_iff` | `TauCeti/NumberTheory/ArithmeticDirichletSeries/Estimates.lean` | The Dedekind zeta series converges exactly on Re s > 1. |
| `tauceti:TauCeti.dedekindZetaCoeff` | `TauCeti/NumberTheory/ArithmeticDirichletSeries/Trivial.lean` | The number of ideals of 𝓞_F of norm n. |
| `tauceti:TauCeti.dedekindZetaCoeff_rat` | `TauCeti/NumberTheory/ArithmeticDirichletSeries/Trivial.lean` | Over ℚ there is exactly one ideal of each norm. |
| `tauceti:TauCeti.dedekindZeta_eq_LSeries_dedekindZetaCoeff` | `TauCeti/NumberTheory/ArithmeticDirichletSeries/Trivial.lean` | Mathlib's dedekindZeta is the L-series of dedekindZetaCoeff. |
| `tauceti:TauCeti.dedekindZeta_eulerProduct_hasProd` | `TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.lean` | The Euler product of the Dedekind zeta function on Re s > 1. |
| `mathlib:PowerSeries` | `Mathlib/RingTheory/PowerSeries/Basic.lean` | Formal power series R⟦X⟧; Λ = ℤ_2⟦T⟧. |
| `mathlib:PadicInt` | `Mathlib/NumberTheory/Padics/PadicIntegers.lean` | The p-adic integers ℤ_[p]. |
| `mathlib:Ideal.span` | `Mathlib/RingTheory/Ideal/Span.lean` | The ideal generated by a set. |
| `mathlib:NumberField.Units.finrank_eq` | `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean` | Dirichlet's unit theorem: the free rank of (𝓞 K)ˣ is Units.rank K. |
| `mathlib:NumberField.Units.rank` | `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean` | rank K = card (InfinitePlace K) − 1. |
| `mathlib:padicValNat.mul` | `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` | v_p(ab) = v_p(a) + v_p(b) for nonzero a, b. |
| `mathlib:padicValNat.eq_zero_of_not_dvd` | `Mathlib/NumberTheory/Padics/PadicVal/Basic.lean` | v_p(n) = 0 when p ∤ n. |
