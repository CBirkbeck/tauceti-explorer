# Mistakes in Duke–Imamoḡlu–Tóth, *Geometric invariants for real quadratic fields*

Original worker: Claude Code, session `cc-fb70e5`, 22 September 2026. Independent reviewer: Codex, session `codex-7e92bd`, job `REV-ERRATA-PAPER-DUKE-IMAMOGLU-TOTH-16`, 23 September 2026. The adjacent JSON records **thirteen confirmed findings and one rejected candidate**.

The review collated the [published article](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Annals 184 (2016), 949–990, with the [29 July 2016 author preprint](https://www.math.ucla.edu/~wdduke/preprints/geometric.pdf). The relevant errors occur in both. SHA-256 hashes:

- Publisher, 42 pages: `a67de7157f76ee700bc2e6a0034a920adc390022d4ff528aa80084f829f35f61`.
- Author preprint, 33 pages: `f1f042adf06eafd410b43b819e076c24c9be8f928f0a8a7927f7569ef8b5cfcf`.

On 23 September 2026, the [journal page](https://annals.math.princeton.edu/2016/184-3/p08), [Crossref record](https://api.crossref.org/works/10.4007/annals.2016.184.3.8), [Duke's publication list](https://www.math.ucla.edu/~wdduke/), and title/arXiv/correction searches yielded no separate erratum or corrected DIT16 version. This is a bounded search. [Humphries–Nordentoft v2](https://arxiv.org/pdf/2211.05890v2), Remark 3.22, does identify the coding problem in E5; it does not give the counterexample family below. No global novelty claim is made for that family.

| ID | Published page; author page | Verdict and correction |
|---|---|---|
| E1 | 961; 11 | Confirmed: hyperbolic Laplacian uses y². |
| E2 | 965; 14 | Confirmed: the normalized lift is unique only up to a unit complex scalar. |
| E3 | 966, 981–982; 15, 27–28 | Confirmed: five occurrences need 1/4+r². |
| E4 | 968; 16 | Confirmed: restore π in the area sum. |
| E5 | 968; 17 | Confirmed: the uniform logarithmic upper bound for ℓ_A is false. |
| E6 | 968–969; 17 | Confirmed gap: retain the spectral norm factor or use unit vectors. |
| E7 | 970; 18 | Confirmed: include the character in each Euler factor. |
| E8 | 981–982; 27–28 | Confirmed: use the absolute value of D for all permitted signs. |
| E9 | 984; 30 | Confirmed: the sine integral needs 2^(ν−1) in the denominator. |
| E10 | 985; 30 | Confirmed: the intermediate Bessel series needs √2. |
| E11 | 983–985; 29–30 | Rejected as a substantive gap: the displayed Frobenius expansions suffice. |
| E12 | 961; 11 | Confirmed: the norm integrates φ(z), not φ(x). |
| E13 | 962; 11 | Confirmed: retain z in the completed Eisenstein functional equation. |
| E14 | 963; 12 | Confirmed: use n throughout the Eisenstein L-series sum. |

E1–E10 retain the original errata IDs. E11 records the rejected extraction E11 candidate. Errata E12 and E13 correspond to extraction E15 and E16. Extraction E12–E14 concern DIT11 and Biró, so were not copied into this paper's errata. E14 was found during this review. The extraction files remain unchanged.

## Independent mathematical checks

**E1–E4.** Acting on y^s distinguishes the two Laplacians immediately; (7.10) already uses the correct one. Multiplication of F by any scalar of modulus one preserves its norm, the linear Shimura relation, and the product b(d′)overline(b(d)); even −F disproves the stated uniqueness. A basis chosen in Proposition 6 fixes a representative but is not part of Theorem 4's conditions. Numerically, r=13.77975135 gives 1/4+r²≈190.13154727, whereas the half-shift gives 190.38154727. Finally, (3.3) supplies π times the period length for each area, so summing must preserve that factor.

**E5: an unbounded family, not just a numerical pattern.** Let a≥3 be odd and D=a²+4 squarefree. Set u=(a+√D)/2 and w=u+1. Then u has norm −1, w is reduced, and wZ+Z=O_K represents the principal narrow class. Its primitive minus cycle consists of a+2 followed by a−1 twos. There is only one digit different from two, so this cycle is primitive and ℓ_I=a. For N(n)=[[n,−1],[1,0]], the monodromy is

\[
N(a+2)N(2)^{a-1}=
\begin{pmatrix}a^2+a+1&-a^2\\a&1-a\end{pmatrix}.
\]

Its determinant is one, its trace is a²+2, and its expanding eigenvalue is (a²+2+a√D)/2=u². The product formula (6.3) identifies this with ε_D. Consequently

\[
\frac{\ell_I}{\log\epsilon_D}
=\frac{a}{2\operatorname{arsinh}(a/2)}\longrightarrow\infty.
\]

[Friedlander–Iwaniec, Theorem 2.1](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/F7023D0C01F0F50F6BDDCB6586475B63/S0013091508000989a.pdf/squarefree_values_of_quadratic_polynomials.pdf), applied with their fixed parameter D=4, supplies a positive density of squarefree a²+4. The local factor at 2 is 1/2, while all other factors are positive and their deviations from one are summable. Every squarefree value here comes from odd a, giving infinitely many fundamental discriminants. This verifies the asymptotic assertion without assuming infinitely many prime values of a quadratic polynomial.

Exact arithmetic checked the complete cycles and products for a=5,7,13,21,51,101,201,401,1001; all nine discriminants are squarefree. The ratio rises from about 1.52 to 72.44. These computations supplement the general argument. The erroneous upper bound is a stated assertion even though unnumbered, so `affects` is corrected to `a stated result`; the equidistribution proof uses the lower bound instead.

**E6: normalization and the actual missing estimate.** Read [Duke 1988](https://www.math.ucla.edu/~wdduke/preprints/hyperbolic.pdf), pp.77–79 and 85. His Fourier expansion uses the same Whittaker normalization, and his spectral cusp forms have norm one. Theorem 5 contributes cosh(πt/2), with t=r/2 here. The product of two coefficients in DIT16 (5.16) therefore contributes cosh²(πr/4). The cited results do not justify dropping this factor for φ/‖φ‖².

The level-one specialization of [Humphries–Nordentoft (4.2), (4.5)](https://arxiv.org/pdf/2211.05890v2), p.21, gives

\[
\|\phi\|^2=\frac{2L(1,\operatorname{ad}\phi)}{\cosh(\pi r)}.
\]

The leading coefficient is one in their Whittaker convention because [DLMF 13.18.9](https://dlmf.nist.gov/13.18.E9) converts that convention to DIT16's factor 2 in front of √y K. On replacing φ/‖φ‖² by u=φ/‖φ‖, the multiplier ‖φ‖ cancels the exponential growth: cosh²(πr/4)/√cosh(πr) is bounded. Any polynomial upper bound for the adjoint L-value, such as the standard convexity bound, can be absorbed into the unspecified exponent C. No r^ε bound is needed for this repair.

Equivalently retain the exponential in the original coordinates and use

\[
c(\phi)=\|\phi\|\langle f,u\rangle,
\qquad |c(\phi)|\le\|\phi\|(1/4+r^2)^{-N}\|\Delta^Nf\|_2.
\]

This follows by integration by parts and Cauchy–Schwarz. The previous errata explanation overstated the normalization problem with c(φ): polynomial decay can hold for the Hecke-normalized coefficients too, but suppressing their norm factor hides the needed cancellation. The unit-vector proof supplies the equidistribution bound. E6 remains a gap in the stated deduction, not a separately proved counterexample to the printed uniform estimate.

**E7–E10.** Multiplicativity determines the missing character in the Euler product. The definition of T includes negative discriminants and (5.16) has the absolute value, identifying E8's intended correction. At ν=3, β=0 the sine integral equals π/2, while the printed expression is 2π. The full correction follows from [DLMF 5.12.6](https://dlmf.nist.gov/5.12.E6). For E10, [DLMF 10.2.2](https://dlmf.nist.gov/10.2.E2) gives the Bessel series, and multiplying by t^(1/2) leaves the missing √2. The corrected intermediate expressions yield the existing (A.2) and (A.3).

**E11: why the extra gap is rejected.** The integral is generally not an ordinary Taylor series at zero, but the paper explicitly displays it as t^s times a power series in (A.2), and does the same for the Bessel side in (A.3). It compares the coefficients of t^s, t^(s+1), t^(s+2), so no ordinary regular-point uniqueness theorem is being invoked.

More explicitly, put f=t^s H. The Whittaker series makes H entire in t: on each compact t-set, the integrand after removing t^s is bounded by a constant times sin(θ)^(Re(s)−1), and Re(s)>0 makes this integrable. This also justifies differentiation and the endpoint integration by parts; the boundary expression decays as sin(θ)^Re(s). The common differential equation gives

\[
tH''+2sH'+tH=0,
\qquad 2s c_1=0,\qquad
n(n+2s-1)c_n=-c_{n-2}\quad(n\ge2).
\]

Every denominator is nonzero in the stated half-plane. Thus c₀ alone determines H, also when s=1/2 or c₀=0. The explicit series and elementary recurrence already make the coefficient comparison valid; an explanatory recurrence would improve exposition, but is not a new mathematical hypothesis or substantive repair. This rejection leaves E9–E10 intact. Five high-precision integral checks, including s=1/2, vanishing leading coefficient, and complex parameters, support the calculation but are not its proof.

**E12–E13.** Both variable slips were confirmed on the published images and author p.11. They do not change the intended norm or functional equation.

**E14.** Both page images mix n and m in the summand. Replacing m by n recovers the identity: write n=dk in the divisor sum to obtain Σ_(d,k≥1) d^(−s−it)k^(−s+it)=ζ(s+it)ζ(s−it), absolutely convergently for Re(s)>1 and real t.

The review checks these findings and their local repairs; it does not claim a fresh line-by-line review of every theorem in the paper. No Lean file was required or compiled.
