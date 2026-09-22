# Mistakes in Duke–Imamoḡlu–Tóth, *Geometric invariants for real quadratic fields*

Job ERRATA-PAPER-DUKE-IMAMOGLU-TOTH-16. Worker: Claude Code, session `cc-fb70e5`, 22 September 2026. The findings are in `PAPER-DUKE-IMAMOGLU-TOTH-16.json` beside this file.

**Paper and version read.** W. Duke, Ö. Imamoḡlu and Á. Tóth, Annals of Mathematics 184 (2016), 949–990, DOI 10.4007/annals.2016.184.3.8.
- Read: the publisher PDF (SHA-256 `a67de715…5f61`), as by the extraction. Every passage below was re-read there, and each formula was checked on the page image.
- Collated: the author preprint of 29 July 2016 on W. Duke's page (`geometric.pdf`, SHA-256 `f1f042ad…cfcf`). It has the same text at every locator.

**Earlier work.** The extraction PAPER-DUKE-IMAMOGLU-TOTH-16 (partial) found E1–E4 and E6–E10:
- E6 in its section "The spectral norm gate";
- the others in its "Corrections and proof qualifications".

It also checked the endpoint order in (3.5), p.958, and found it correct. E5 is new here.

**Existing corrections.** None was found:
- the Annals page links no erratum;
- W. Duke's page lists corrections for other papers but not this one;
- the paper is not on arXiv;
- a web search found nothing.

One later paper touches E5: Humphries–Nordentoft, arXiv 2211.05890v2, Remark 3.22.

**Effect.** The main results stand:
- Theorem 1;
- the equidistribution Theorem 2;
- the Hecke and Katok–Sarnak type formulas, Theorems 3 and 4, apart from the uniqueness clause of Theorem 4 (E2).

E6 is a gap in the proof of Theorem 2, repaired by normalizing the cusp forms correctly. E5 is a false remark that nothing uses. The rest are misprints.

## E1. The Laplacian (misprint)

On p.961 the paper says E(z, s) is an eigenfunction of "Δ = −y^{−2}(∂²_x + ∂²_y)" with eigenvalue s(1 − s). The hyperbolic Laplacian is −y²(∂²_x + ∂²_y). Only that operator is Γ-invariant and has Δ(y^s) = s(1 − s)y^s. The paper's (7.10), p.972, uses the correct operator.

## E2. Uniqueness in Theorem 4 (error)

Theorem 4 asserts a *unique* nonzero weight-1/2 form F with ⟨F, F⟩ = 1 that satisfies (5.16) for all coprime fundamental d′, d and the Shimura relation. Every condition is invariant under F ↦ uF for |u| = 1:
- the norm is unchanged;
- the Shimura relation is linear;
- the left side of (5.16), 12√π|D|^{3/4} b(d′)\overline{b(d)}, is unchanged.

So −F is a second solution. The correct statement is uniqueness up to a unimodular constant, or uniqueness after fixing, say, b(d₀) > 0 for one d₀ with b(d₀) ≠ 0. Existence and the formula itself are unaffected. The proof produces F as a member of a chosen orthonormal basis B_r (Proposition 6).

## E3. The eigenvalue 1/2 + r² (misprint)

The numerical example on p.966 says "λ = 190.13154731 ··· = 1/2 + r², where r/2 = 6.889875675". Proposition 6 and its proof on pp.981–982 also write "Laplace eigenvalue 1/2 + r²". The paper's convention (5.6) is λ = 1/4 + r², and the numbers agree with it: r = 13.77975135 gives 1/4 + r² = 190.131547…, while 1/2 + r² = 190.381547….

## E4. The factor π in (6.2) (misprint)

(6.2) reads Σ area(F_A) = Σ ℓ_A. Theorem 1 gives area(F_A) = πℓ_A, so the right side is πΣℓ_A. The proof only needs a lower bound up to a constant, so nothing changes.

## E5. The upper bound for ℓ_A (error)

The Remark on p.968 says Eichler's argument gives ℓ_A < c log ε_D for an explicit c. Here ℓ_A is the length of the minus continued fraction period. The bound is false.

- **The family.** Take a odd with D = a² + 4 squarefree, for example a = 13 (D = 173) or a = 101 (D = 10205 = 5·13·157). Such D is a fundamental discriminant, and a positive proportion of a qualify.
- **The period.** For the principal class, (a + √D)/2 has regular continued fraction [a; a, a, …]. Each regular partial quotient a in an odd position becomes a run of a − 1 twos in the minus continued fraction. The reduced period is therefore ((a + 2, 2, …, 2)), and ℓ_A = a ≈ √D.
- **The unit.** ε_D = ((a + √D)/2)², so log ε_D ≈ 2 log a ≈ log D. Hence ℓ_A / log ε_D → ∞.
- **Computation.** For a = 5, 7, 13, 21, 51, 101, 201, 401, a direct computation gives ℓ_A = a. In each case the product of the reduced w over the period equals ε_D, as in the paper's (6.3), which confirms that ℓ_A is the paper's quantity.

Humphries and Nordentoft (arXiv 2211.05890v2, Remark 3.22) observed that Eichler's argument bounds the geometric code of a closed geodesic rather than ℓ_A, the arithmetic code, so the remark is unsupported. The counterexample family is new here. Only the paper's lower bound (6.4), ℓ_A > log ε_D / log(√D + 1), is proved and used.

## E6. The normalization in (6.6) (gap)

Proposition 2 states Weyl(⟨φ, φ⟩^{−1}φ, χ) ≪ r^C |D|^{13/28+ε} and says this "follows straight from Theorem 4 and Theorem 5 of [12]".

**What the cited results give.** The cusp forms are normalized by a(1) = 1 ((5.7), p.962). Duke's Theorem 5 (1988, p.85, checked on the page image) bounds the coefficients of a spectral weight-1/2 form of eigenvalue 1/4 + t² by |λ|^A ch(πt/2)|n|^{−2/7+ε}, with t = r/2 here. So Theorem 4 gives only

  |Weyl(⟨φ, φ⟩^{−1}φ, χ)| ≪ r^C cosh²(πr/4) |D|^{13/28+ε}.

**Why the factor matters.** The exponential cannot be discarded. For a(1) = 1, Rankin–Selberg unfolding gives ⟨φ, φ⟩ ≍ L(1, sym²φ)/cosh(πr), so ⟨φ, φ⟩^{−1}φ is about e^{πr/2} times the unit vector u = φ/‖φ‖.

**The repair.** State (6.6) for u. Then the exponentials cancel:

  Weyl(u, χ) = ‖φ‖ Weyl(⟨φ, φ⟩^{−1}φ, χ) ≪ L(1, sym²φ)^{1/2} r^C |D|^{13/28+ε}, with L(1, sym²φ) ≪ r^ε.

This is what the proof of Theorem 2 needs, because the spectral term is c(φ)⟨φ, φ⟩^{−1}φ = ⟨f, u⟩u, and the bound c(φ) ≪ |r|^{−A} quoted on p.969 holds for u. Theorem 2 stands.

## E7. The Euler product of L(s, χ) (misprint)

On p.970, "L(s, χ) = Σ_a χ(a)N(a)^{−s} = ∏_p (1 − N(p)^{−s})^{−1}". The Euler factor must be (1 − χ(p)N(p)^{−s})^{−1}; as printed the product is the Dedekind zeta function of K.

## E8. |D|^{3/4} in Proposition 6 (misprint)

Proposition 6 gives T(φ, χ) = 12π^{1/2} D^{3/4} b(d′)\overline{b(d)} for all non-square D = d′d, including D < 0, which it needs in order to prove Theorem 4 in those cases. The factor must be |D|^{3/4}, as in (5.16).

## E9. The sine-power integral in Appendix A (misprint)

On p.984 the formula quoted from Gradshteyn–Ryzhik 3.892(1) omits 2^{ν−1} from the denominator. The correct formula is

  ∫_0^π e^{iβx} sin^{ν−1}x dx = π e^{iπβ/2} Γ(ν) / (2^{ν−1} Γ((ν+β+1)/2) Γ((ν−β+1)/2)).

For ν = 3, β = 0 the integral is π/2, while the printed formula gives 2π. (A.2) is correct: with ν = n + s the factor 2^{n+s−1} cancels (2t)^{n+s} and leaves the printed 2π.

## E10. The Bessel series in Appendix A (misprint)

On p.985, "t^{1/2} J_{s−1/2}(t) = Σ (−1)^r (t/2)^{s+2r} / (r! Γ(s + 1/2 + r))" lacks a factor √2, since t^{1/2}(t/2)^{s−1/2+2r} = √2 (t/2)^{s+2r}. (A.3) is correct with the √2, and its leading coefficient agrees with that of (A.2) by the duplication formula. Lemma 7 stands.
