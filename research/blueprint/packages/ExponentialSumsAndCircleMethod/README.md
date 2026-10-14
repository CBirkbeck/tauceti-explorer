# Roadmap: exponential sums, decoupling and the circle method

**Summary.** Build finite and real oscillation estimates, character-sum bounds, Fourier counting,
critical moment-curve decoupling, and the local densities needed by the circle method. The main
representation theorems are the classical and optimized Waring asymptotics, the weighted
three-prime theorem, weighted quadratic asymptotics and almost-all integral representation on
Markoff surfaces. Coefficient-uniform determinant bounds and binary-form collision estimates
provide a complementary way to control sparse algebraic sets. Each theorem below specifies its
range and uniformity; the generic cubic discussion specifies hypotheses rather than an
unconditional fullness theorem.

## Scope and ownership

This roadmap owns the analytic estimates and their arithmetic counting applications: finite
interval completion and differencing, smooth-modulus cancellation, moment-curve decoupling,
major and minor arcs, singular series, polynomial-fiber densities, and the selected determinant
bounds. Character constructors, conductor classification, prime-distribution inputs, projective
intersection theory and rational approximation are supplied by their owners below.

Use Tau Ceti's smooth Morse charts for stationary phase. Use IntegralLattices for integral
local carriers, local forms, Jordan analysis and odd-prime orthogonal bases, and
OrthogonalSpinGroups for quadratic-space isometries. The integral hyperbolic splitting input
extends IntegralLattices; it does not construct another lattice theory. GeometryOfNumbersAndQuadraticArithmetic
owns covolumes, minima, general integral quadratic and hermitian lattices and their genus masses.
Its hermitian representation densities and the stabilizer densities of IntegralLattices retain
their own normalizations. Here the local quantities count solutions of polynomial equations;
the comparisons below identify the overlapping scalar specializations before they are used.

The function-field work here stops at the independent arithmetic minor-count estimate.
The symmetric-lattice shrinking theorem belongs to FunctionFieldLatticesAndShrinking, Part II;
the independent affine dimension, polynomial-box and Padé inputs belong to the early part of
GeometricCircleMethodAndMappingSpaces. Mapping spaces and their cohomology are consumers.
ArithmeticDynamics, Part II owns the Markoff action, congruence classification and orbit
comparison used by the class-number endpoint. AnalyticNumberTheory owns divisor estimates and
Siegel–Walfisz; ClassicalArithmeticCompletion owns the conductor facts; the precise finite-field
correlation and sieve contracts below distinguish elementary character theory from the stronger
inputs needed here. None of these ownership statements supplies a proof of an extension.

## Conventions

- Write `e(t)=exp(2πit)`. The torus is Mathlib's `AddCircle (1 : ℝ)`, with its probability
  Haar measure, and `fourier m` has positive phase. Coefficient extraction multiplies by
  the negative target character. Product tori use the product probability measure.
- A discrete interval `(M,M+N]` contains integers with the stated real or integral endpoints.
  In particular `(k/2,k]` means `(⌊k/2⌋,k]` on integers, including odd `k`.
  Positive Waring tuples are ordered and every coordinate is at least one.
- Dirichlet characters use Mathlib's zero extension to nonunits. At level one the native
  principal character is one even at zero. Ambient modulus, inducing modulus and conductor
  are distinct parameters. An induced character retains the zeros imposed by its ambient
  modulus. Primitive characters at coprime levels multiply through the existing CRT map.
- Reduced arc representatives have `1≤q≤Q`, `0≤a<q` and `gcd(a,q)=1`. Major arcs are closed
  metric balls on the torus, so they wrap at zero. `majorArcs` uses common radius `η`;
  `denominatorMajorArcs` uses radius `η/q`. Minor arcs are complements with the matching
  convention. Radius zero includes the centers; a negative radius gives the empty ball.
- Euclidean extension operators use Lebesgue measure and the positive `2π` phase.
  For a ball of radius `R>0`, `w_B(x)=(1+‖x-c‖/R)^{-E}`. A normalized weighted norm
  divides its powered integral by the ordinary ball volume. It does not divide by the
  weight's total mass. Dyadic partitions cover `[0,1]` with endpoint overlaps of measure zero.
- For `r` equations in `n` variables, normalize a residue count by `q^{n-r}` with an integer
  exponent, including overdetermined systems. A real tube uses `(2ε)^{-r}` and a limit
  from `ε>0`. Quadratic half-norm conventions are fixed at the integral-lattice boundary:
  `Q(x)=B(x,x)/2` requires an even integral pairing, especially at two.
- Native `tsum`, `tprod`, Bochner integrals and `Filter.limUnder` are total operations.
  Prove summability, multipliability, integrability or convergence before interpreting them
  as analytic values. `Nat.card` agrees with counting only after finiteness is established;
  expanding-region theorems use bounded regions. An empty finite tuple space has its native
  cardinality, so zero-variable systems require separate checks.
- In function fields use `|T|=q`; a polynomial box is `deg u<D`, and the fractional
  condition is strictly `<q^{-C}`. Symmetric degree-`k` polarization includes `k!`.
  Inverting it requires characteristic greater than `k`. Smoothness and dimensions are
  geometric, over an algebraic closure, rather than tests only on rational points.
- Implicit constants have exactly the dependencies displayed in each target. Fixed-form
  estimates, coefficient-uniform estimates and averaged local tails are separate statements.
  No uniform Markoff two-adic tail is asserted as common discriminant valuations grow.

## Exact supplier contracts

### From Mathlib

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. Use `DirichletCharacter`,
`MulChar`, `ZMod`, `ZMod.stdAddChar`, the DFT and its inverse, `AddCircle.haarAddCircle`,
`fourier`, `EuclideanSpace`, native Bochner integration, `eLpNorm`, `Summable`, `Multipliable`,
`Polynomial` and `MvPolynomial`. Each target names the particular declaration it consumes.
`ZMod.dft` has negative phase and inverse DFT positive phase; completion includes the factor
`q^{-1}`. Integrals of nonzero Fourier monomials vanish under probability Haar measure.
Finite sums and count subtypes use native `Finset` and `Fintype.card`, including empty cases.

For analytic transfers use integrable finite sums, dominated convergence and finite product
measure integrals, not a second integration framework. Partial derivatives and homogeneous
components are native polynomial operations. Rational and integral zero loci use the same
evaluation maps; geometric assertions base change to an algebraic closure. Existing APIs are
inputs, while quantitative estimates absent from those APIs are stated as mathematical targets
in the relevant layer.

### From Tau Ceti and its roadmaps

The pinned Tau Ceti baseline is `f790474821cf4256814db967cb154e7af3d0c369`. Also use the
subsequent current declarations at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` where explicitly
named: `TauCeti.IsNondegenerateCriticalPoint.exists_normal_form` and `.exists_morse_chart` in
`Analysis/Calculus/Morse/NormalForm.lean` provide smooth local charts and the Hessian normal
form; the stationary-phase target adds quantitative cutoff and Jacobian bounds.
`TauCeti.exists_contDiff_hasCompactSupport_fourier_nonneg` in `Analysis/Fourier/NonnegTestFunction.lean`
provides a smooth compactly supported function with nonnegative real Fourier transform and
positive transform at zero. The small Fourier support of a square root needed by decoupling
is an additional localization target.

IntegralLattices Layer 3 supplies `IntegralLattice.LocalCarrier`, `localIntegralForm`, the
orthogonal local basis at odd primes, and its unit-times-prime-power coefficient description.
Its Layer 3 Jordan and dyadic interfaces and OrthogonalSpinGroups' isometry interfaces are the
starting point for local calculations. The extension required from **IntegralLattices, Part II**
is precise: an integral nondegenerate quadratic lattice over `ℤ_p` is maximal when no proper
overlattice in its rational quadratic space has integral quadratic values; every such maximal
lattice of rank at least five contains an integral hyperbolic plane with quadratic form `xy`,
including `p=2`. Match this assertion to the half-norm convention before using it. This input
is stronger than odd-prime diagonalization. The scalar solution-density comparison with
GeometryOfNumbersAndQuadraticArithmetic Layer 3 and the positivity consequence are proved
in Layer 4 here; no group mass is substituted for a representation density.

### Arithmetic suppliers

From **AnalyticNumberTheory `AN.5`**, consume the explicit divisor estimate
`τ(n)≤max(1,(ε log 2)^{-1})^B n^ε` for `ε>0`, `B≥exp(1/ε)`, and its uniform subpower
consequence with constant at least one. From **ClassicalArithmeticCompletion `CA.1`**, consume
primitivity of the CRT product at positive coprime levels, squarefreeness of the odd part of a
primitive quadratic conductor, and the bound `v₂(cond χ)≤3` with its actual possible values
`0,2,3`. Products of general induced factors retain ambient nonunit masks.

From **FiniteFieldsAndCharacterSums `FF.1`**, consume power counting by multiplicative
characters, Gauss-sum norms and the odd-prime quadratic Gauss square including `χ(-1)`.
Specify the classical value at zero separately: it is one for the trivial character and zero
for a nontrivial character; the native multiplicative character has value zero at zero.
For `d|(q-1)`, the classical sum over `χ^d=1` counts `d`-th roots, also at zero.
For nontrivial additive `ψ`, a nontrivial multiplicative Gauss sum has norm `√q` and the
trivial multiplicative sum is `-1`; for trivial `ψ` the nontrivial multiplicative sum is zero.
These contracts do not supply composite two-power calculations.

From **FiniteFieldsAndCharacterSums `FF.2`**, require the complete `2r`-th character moment
used in Burgess and the iterated complete correlations used in Graham–Ringrose. They must
separate exceptional repeated factors from the square-root cases, retain a primitive
distinguished character, and record dependence on `r`. A generic Weil estimate without the
exceptional tuples does not supply either interface. The complete Burgess and Graham–Ringrose
arguments are analytic targets of Layer 1, beyond quoted endpoint inequalities.

From **AnalyticNumberTheory `AN.2`**, consume Siegel–Walfisz for primes in reduced residue
classes, with ineffective constants. Its required extension is the `Λ`-weighted version,
uniform over all subintervals of `[1,N]` and `q≤log^B N`, with main term length divided by
`φ(q)`, arbitrary logarithmic saving, and an explicit treatment of nonunit prime-power classes.
From **SieveMethodsAndPrimePatterns `SV.2`**, consume the exact finite Vaughan identity and
its coefficient energies: thresholds are positive, `B=⌊N/(V+1)⌋`, the incomplete logarithmic
coefficient is retained, and the two energies are bounded by `(M-L)(log M)^2` and `M-L`.
Layer 5 proves the exponential type I and II estimates using these identities.

The elementary `FF.1` character portion is also used under AnalyticNumberTheory `AN.1`, and
the large-sieve/bilinear portion of `SV.2` under ArithmeticStatistics `ST.2`; those existing
ownership transfers are compatible with the contracts here. The stronger `FF.2` correlation
theorems are not consequences of elementary character constructors.

From **DiophantineApproximationAndTranscendence `DT.1`**, consume Roth in lower-bound form:
for a real algebraic irrational `α` and `κ>2`, there is an ineffective `c(α,κ)>0` such that
every reduced rational `a/q` satisfies `|α-a/q|≥c q^{-κ}`. State the height and positivity
conventions when it is applied to a discrete phase.

### Function-field and geometric suppliers

The independent contract from **FunctionFieldLatticesAndShrinking, Part II** is the symmetric
`γ` estimate for integers `a`, `c>0` and `s≥0`,
`N_{γ,a,c}≤q^{ns+n max(⌊(a-c)/2⌋,0)}N_{γ,a-s,c+s}` with its strict polynomial and fractional
balls and adjoint-minimum normalization. It uses its own lattice carrier and does not use the
circle-method minor-count estimate it supplies. Apply it one vector slot at a time in Layer 1.
The early **GeometricCircleMethodAndMappingSpaces** contract gives componentwise affine
intersection dimension, the coefficient-uniform bound
`#W(F_q[T]_{<D})≤C(N,degree)q^{D dim W}` including `D=0`, and the independent Padé/Hankel
equivalence. For the latter, match its excluded kernel exactly to polynomials `h` of degree
at most `m` with the first `kd-m` negative coefficients of `αh` zero. No mapping-space
cohomology enters either proof.

From **SchemeAndStackFoundations `SF.5`**, consume the isolated plane Bézout inequality:
for nonzero homogeneous polynomials of degrees `m,n` over an algebraically closed field,
the sum of isolated local intersection multiplicities is at most `mn`, even if there are
common components; equality applies in the coprime case. The additional geometric contract
is degree-controlled generic projection of a geometrically integral curve, generic irreducible
plane sections of a geometrically integral surface, and elimination bounds for the exceptional
section locus and Fano line locus. Use existing schemes and Grassmannians. Bézout alone is
not this geometric input. Determinant bounds in Layer 6 use these contracts with constants
independent of the coefficients.

From **ArithmeticDynamics, Part II**, require the Markoff integral action with sign and
permutation conventions, the congruence-admissibility classification, geometric density of
the applicable integral fibers, and the generic orbit-growth comparison. The analytic sector
and variance estimates here do not establish those arithmetic action statements.

## How to read the build

Layer 1 supplies oscillation and differencing, including the function-field count before it is
used. Layer 2 turns finite and summable weights into coefficient counts and separates arcs.
Layer 3 proves decoupling and derives mean-value estimates; the stronger mean-value Weyl
bound is placed after this input. Layer 4 constructs the singular factors and proves the local
comparisons. Layer 5 combines the estimates into representation theorems with each problem's
own weight and uniformity. Layer 6 builds determinant bounds and representation statistics.
The paragraphs state mathematical targets; the short `Suggested.lean` records selected
definitions and endpoint signatures that use existing carriers.

## Layer 1: finite oscillation and differencing

Start with oscillation on finite intervals and on the real line. Completion and character factorization retain
the ambient zero masks; the numerical estimates then give a uniform cancellation saving. The function-field
branch expresses differencing through explicit polynomial coefficients and shrinks this count before any
minor-arc geometry is used.

### 1.1 Real and discrete oscillation

Prove `finite_completion` (completion of finite sums). For q≥1, f:ℤ/qℤ→ℂ and a finite integer set I, Σ_{m∈I}f(m
mod q)=q⁻¹Σ_{h mod q}(dft f)(h)Σ_{m∈I}exp(2πihm/q). Consequently its norm is at most q⁻¹Σ_h |dft
f(h)|·|Σ_{m∈I}exp(2πihm/q)|. The h=0 term is retained. The transform is unnormalized with a negative sign; its
inverse has a positive sign. ([Mathlib](#mathlibpin), Analysis/Fourier/ZMod.lean, dft_apply and invDFT_apply,
lines108–121 at the pin.)

*Needs:* Mathlib `ZMod.dft`; Mathlib `ZMod.invDFT_apply`; Mathlib `ZMod.dft_apply`.

Prove `second_derivative_sum` (second derivative exponential-sum bound). For every A>1 there is C(A)>0 such that
for integers a<b with b−a>1, a real phase f of class C² on a neighborhood of [a,b], and lam>0 satisfying
lam≤|f″(x)|≤Alam throughout [a,b], |Σ_{a<m≤b}exp(2πif(m))|≤C(A)((b−a)√lam+lam⁻¹/²). C is independent of
f,a,b,lam. ([Baier](#baierexponentiallectures), Theorem 7 p.6, proof pp.8–9.)

*Needs:* Layer 1 `kusmin_landau`.

Prove `kusmin_landau` (kusmin–landau inequality). There is an absolute C>0 such that if f is C¹ near [a,b], f′
is monotone there, and for some δ∈(0,1/2] every derivative value is at distance at least δ from ℤ, then
|Σ_{a<m≤b}exp(2πif(m))|≤C/δ. Here a,b are integers and a≤b. ([Baier](#baierexponentiallectures), Lemma 10 p.8;
its proof is referred to Montgomery, Theorem2.1.)

*Needs:* the standing native real and complex scalar, interval and finite-sum APIs.

Prove `van_der_corput_a` (van der corput a process). For integers a<b, I=(a,b]∩ℤ, N=b−a, arbitrary f:ℤ→ℝ and
1≤H≤N, |Σ_I exp(2πif(m))|²≤2N²/H+(2N/H)Σ_{0<|h|<H}|Σ_{m∈I, m+h∈I}exp(2πi(f(m+h)−f(m)))|. All intersections
retain the half-open endpoint convention. ([Baier](#baierexponentiallectures), Lemma11 and Theorem12 pp.9–11.)

*Needs:* Layer 1 `q_vdc_energy_bound`.

Prove `oscillatory_integral_derivative` (van der corput integral derivative bound). For each integer k≥2 there
is C(k)>0 such that if a≤b, c,lam>0, φ is smooth near [a,b], and |φ^(k)(x)|≥c there, then |∫_a^b
exp(ilamφ(x))dx|≤C(k)(clam)^(−1/k). For k=1 the same bound C/(clam) requires φ′ monotone as well. These are
Lebesgue integrals on [a,b]. ([Tao, oscillatory integrals](#taostationary2007), Lemmas2.4–2.5 p.5 and proofs.)

*Needs:* the standing native real and complex scalar, interval and finite-sum APIs.

Prove `stationary_phase_leading` (one-dimensional stationary phase). Let a:ℝ→ℂ be smooth and compactly
supported, and φ:ℝ→ℝ smooth. Suppose φ′(x₀)=0, φ″(x₀)≠0, and x₀ is the only zero of φ′ in the closed topological
support tsupport(a). Then for lam≥1, ∫ℝ a(x)exp(ilamφ(x))dx equals a(x₀)exp(ilamφ(x₀)+iπ
sign(φ″(x₀))/4)√(2π/(lam|φ″(x₀)|)) with an error at most C(a,φ)lam^(−3/2). The constant depends on finitely many
derivatives on a compact neighborhood of the support; this assertion does not give uniformity over arbitrary
phases. ([Tao, oscillatory integrals](#taostationary2007), Lemmas2.6–2.8 pp.6–8, leading coefficient of (10).)

Uniqueness of the stationary point is required on the closed topological support, including points where a
vanishes. HasCompactSupport makes that closed support compact.

*Needs:* Layer 1 `oscillatory_integral_derivative`.

Prove `van_der_corput_b` (van der corput b process). Fix A≥1. There is C(A)>0 such that for N,F>0, integers a<b
with [a,b]⊆[N,2N], and a C⁴ real phase f satisfying F/(AN²)≤f″≤AF/N², |f‴|≤AF/N³ and |f⁽⁴⁾|≤AF/N⁴, put α=f′(a),
β=f′(b) and let x_h∈[a,b] be the unique point with f′(x_h)=h. The difference between Σ_{a<m≤b}exp(2πif(m)) and
Σ_{h∈ℤ∩[α,β]}exp(2πi(f(x_h)−hx_h+1/8))/√f″(x_h) has norm at most C(A)(log(2+F/N)+N/√F). Endpoint stationary
terms may have full weight because their discrepancy is included in N/√F. ([Baier](#baierexponentiallectures),
Theorem21 and proof sketch pp.21–22; Lemma16 pp.13–14 and Theorem20 pp.20–21.)

*Needs:* Layer 1 `stationary_phase_leading`.

### 1.2 Dirichlet kernels and complete monomial sums

Define `symmetricDirichletKernel` (symmetric dirichlet kernel). D_H(α)=Σ_{−H≤m≤H}fourier(m)(α) for H∈ℕ and
α∈ℝ/ℤ. This uses native positive-sign Fourier characters and probability Haar measure.
([Skorobogatov–Sofos](#skorobogatovsofos2023), §3, definitions before (3.2), pp.691–692.)

The basic API consists of the following statements.

- `symmetricDirichletKernel_zero`: H=0 gives the constant 1.
- `symmetricDirichletKernel_at_zero`: At α=0 the value is 2H+1.
- `symmetricDirichletKernel_continuous`: The function is continuous and integrable on the probability torus.
- `symmetricDirichletKernel_lift`: On a real lift x the summands are exp(2πimx); integer shifts do not change the
  value.

**Checks.**

- H=0 gives 1, distinguishing whether frequency zero is included.
- At H=1 and α=1/2 the value is −1.
- At H=2 and α=0 the value is 5.

*Needs:* Mathlib `fourier`.

Define `oneSidedDirichletKernel` (one-sided dirichlet kernel). D_H⁺(α)=Σ_{1≤m≤H}fourier(m)(α) for H∈ℕ and α∈ℝ/ℤ.
This uses native positive-sign Fourier characters and probability Haar measure.
([Skorobogatov–Sofos](#skorobogatovsofos2023), §3, definitions before (3.2), pp.691–692.)

The basic API consists of the following statements.

- `oneSidedDirichletKernel_zero`: H=0 gives the constant 0.
- `oneSidedDirichletKernel_at_zero`: At α=0 the value is H.
- `oneSidedDirichletKernel_continuous`: The function is continuous and integrable on the probability torus.
- `oneSidedDirichletKernel_lift`: On a real lift x the summands are exp(2πimx); integer shifts do not change the
  value.

**Checks.**

- H=0 gives 0, distinguishing whether frequency zero is included.
- At H=1 and α=1/2 the value is −1.
- At H=2 and α=0 the value is 2.

*Needs:* Mathlib `fourier`.

Prove `dirichlet_kernel_l1` (dirichlet-kernel l¹ bounds). There is an absolute C>0 such that for every H≥0, both
∫_{ℝ/ℤ}|D_H| and ∫_{ℝ/ℤ}|D_H⁺| are at most C log(2+H). The measure is probability Haar. The positive logarithm
covers H=0 and H=1; the one-sided bound does not follow by identifying its kernel with the symmetric kernel.
([Skorobogatov–Sofos](#skorobogatovsofos2023), §3, (3.2) pp.691–692; positive logarithm at the finite endpoint
is an explicit correction.)

*Needs:* Layer 1 `symmetricDirichletKernel`; Layer 1 `oneSidedDirichletKernel`.

Define `completePowerSum` (complete monomial exponential sum). completePowerSum(d,q,a)=Σ_{x mod
q}exp(2πiax^d/q), represented by the native finite residue range x=0,…,q−1 and native fourier(ax^d) evaluated
at1/q in AddCircle1. The zero residue is included. q=0 is an empty sum by definition; analytical moduli are
positive. No additive-character, finite-field or cyclic Fourier carrier is reconstructed.
([Assing](#assingcircle2022), §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46.)

d,q are natural and a is integer. At q=1 there is one residue and the sum is1. The sum at q>0 is independent of
the choice of complete representatives.

The basic API consists of the following statements.

- `completePowerSum_zero_modulus`: q=0 gives0.
- `completePowerSum_one_modulus`: q=1 gives1.
- `completePowerSum_zero_frequency`: a=0 gives q, cast to complex.
- `completePowerSum_conjugate`: Conjugation changes a to−a.
- `completePowerSum_residue_formula`: The native Fourier expression equals the source real-lift exponential sum.

**Checks.**

- d=3,q=0,a=1 gives0.
- d=3,q=1,a=7 gives1.
- d=1,q=2,a=1 gives0, agreeing with complete additive orthogonality.
- d=2,q=3,a=1 gives i√3.

*Needs:* Mathlib `fourier`; Mathlib `fourier_coe_apply`; Mathlib `fourier_neg`; Mathlib `fourier_zero`.

Prove `complete_power_bound` (complete monomial sum bound). For every d≥3 there is C_d>0 such that for all q≥1
and integers a with gcd(|a|,q)=1, |completePowerSum(d,q,a)|≤C_dq^{1−1/d}. The constant is independent of a and
q. This is the monomial composite-modulus bound used to obtain a simple Waring singular-series convergence
range, not the general finite-field Weil theorem. ([Assing](#assingcircle2022), §6.1 pp.35–39 and §6.2 pp.39–47,
statements and proofs; pp.45–46.)

Degree two is excluded from this source proof because the blanket two-adic recurrence fails at modulus eight.
That degree has a separate proof obligation.

*Needs:* Layer 1 `completePowerSum`; `FiniteFieldsAndCharacterSums:FF.1/power-count-via-characters`;
`FiniteFieldsAndCharacterSums:FF.1/gauss-sum-absolute-value`;
`FiniteFieldsAndCharacterSums:FF.1/trivial-character-conventions`.

### 1.3 Short character sums

Prove `burgess_character_bound` (burgess short-character estimate). For r≥1 and ε>0 there is C(r,ε)>0 such that
for every nonprincipal character χ modulo q≥2, all M∈ℤ and N≥1, |Σ_{M<m≤M+N}χ(m)|≤C N^(1−1/r) q^((r+1)/(4r²)+ε),
provided q is cube-free or r≤3. For real nonprincipal characters the same estimate holds for every fixed r and
arbitrary q, after treating their bounded two-adic conductor and induced zero factors. Primitivity is not
silently inferred from nonprincipality. ([Friedlander–Iwaniec–Mazur–Rubin](#fimr2012), §9, (9.2), Corollary9.1
and qualification pp.39–40; [Duke–İmamoğlu–Tóth](#dukeimamoglutoth2016), Proposition2 and proof pp.968–969.)

Duke–İmamoğlu–Tóth Proposition 2 uses Burgess for L-function subconvexity. It motivates that application; the
short-interval character estimate is the input proved here from Friedlander–Iwaniec–Mazur–Rubin's stated Burgess
bound and the complete moment contract.

*Needs:* `FiniteFieldsAndCharacterSums:FF.2`.

Define `shortCharacterHypothesis` (fimr short-character hypothesis). shortCharacterHypothesis(n,δ) means n≥3,
δ>0, and: for each ε>0 there is C(n,δ,ε)>0 such that for every integer Q≥3, every real nonprincipal character χ
modulo 1≤q≤Q, every M∈ℤ and 1≤N≤Q^(1/n), |Σ_{M<m≤M+N}χ(m)|≤C Q^((1−δ)/n+ε). All shifts and moduli share the same
C. C_n is the existential assertion that such a δ exists. For n≥4 it is a conjectural hypothesis.
([Friedlander–Iwaniec–Mazur–Rubin](#fimr2012), §9, ConjectureC_n (9.4) pp.39–40; Koymans–Milovic §2.5 pp.6–7.)

The basic API consists of the following statements.

- `shortCharacterHypothesis_range`: The predicate implies n≥3 and δ>0.
- `shortCharacterHypothesis_bound`: For ε>0, extract one constant valid for all admitted Q,q,χ,M,N.
- `shortCharacterHypothesis_weaken`: If 0<δ′≤δ then the hypothesis with δ implies the hypothesis with δ′.
- `shortCharacterHypothesis_progression`: For a progression modulus coprime to q, reindexing gives the same bound
  uniformly in the progression residue and interval shift.

**Checks.**

- The predicate is false for n=2, for every δ.
- The predicate with δ=0 is false, for every n.
- For n=3,δ=1/48 the predicate holds by the cubic Burgess specialization below; declaring every case false
  would fail this control.
- For every n and δ>1 it is false. Use the nonprincipal character modulo3 on the singleton interval (0,1],
  whose sum is1, and let Q grow with ε=(δ−1)/(2n) when n≥3. The asserted upper bound then tends to0.
- Its bound applies to an interval beginning at M=−20 as well as at zero; one extracted constant works for both
  shifts.

*Needs:* Mathlib `MulChar.IsQuadratic`.

Prove `burgess_cubic_hypothesis` (unconditional cubic short-character hypothesis).
shortCharacterHypothesis(3,1/48) holds. Indeed the real-character r=6 estimate is C(ε)N^(5/6)q^(7/144+ε); for
N≤Q^(1/3),q≤Q the combined exponent is 47/144+ε=(1−1/48)/3+ε. ([Friedlander–Iwaniec–Mazur–Rubin](#fimr2012),
Corollary9.1 (9.3) and (9.5), pp.39–40.)

*Needs:* Layer 1 `burgess_character_bound`; Layer 1 `shortCharacterHypothesis`.

Prove `short_jacobi_progression` (conditional jacobi progression estimate). Assume
shortCharacterHypothesis(n,δ). For every ε>0 there is C(n,δ,ε)>0 such that for every odd squarefree q>1, its
primitive quadratic character χ_q, every nonzero integer k with q∤k, every l,M∈ℤ and 1≤N≤q^(1/n), |Σ_{M<m≤M+N,
k∣m−l}χ_q(m)|≤C q^((1−δ)/n+ε). The constant is uniform in k,l,M. This ε-loss version retains the same δ.
Shrinking δ absorbs ε to recover a fixed positive saving, as in the quoted corollary.
([Koymans–Milovic](#koymansmilovic2018), §2.5 Corollary2.2 p.7; FIMR (9.7) p.40 treats the coprime case.)

*Needs:* Layer 1 `shortCharacterHypothesis`.

Prove `graham_ringrose_bound` (graham–ringrose smooth-modulus estimate). Let r≥1, q₁>1 squarefree, and
q₁,…,q_r≥1 pairwise coprime. Let π_i be Dirichlet characters at these ambient moduli, with π₁ primitive. Put
R₀=max(q₂,…,q_r,q₁^(1/4))q₁^(5/4), where the maximum is q₁^(1/4) if r=1. For real M and R≥R₀,
|Σ_{M<m≤M+R}∏_iπ_i(m)|≤4R(τ(q₁)^(r²)/q₁)^(2^(−r)). Ambient moduli of factors are preserved; the theorem does not
require every factor primitive. ([Bennett–Siksek](#bennettsiksek2020), §8.1, Theorem6 pp.376–377, quoting
Graham–Ringrose and Iwaniec–Kowalski Theorem12.13.)

*Needs:* Layer 1 `q_vdc_uniform_correlation`; `FiniteFieldsAndCharacterSums:FF.2`.

Prove `distinct_quadratic_cancellation` (distinct quadratic character cancellation). For every c>0 there is an
effective K(c) such that for every integer k≥K(c) and distinct primitive quadratic Dirichlet characters χ₁,χ₂ of
conductors N₁,N₂≤k^c, if the largest prime factor of N₁N₂ is at most k^(7/16), then
|Σ_{k/2<m≤k}χ₁(m)χ₂(m)|≤k^(1−γ), where γ=2^(−10c−6). The interval has real lower endpoint k/2 and integral m, so
its integer version is (⌊k/2⌋,k]. ([Bennett–Siksek](#bennettsiksek2020), Proposition8.2 and both proof cases,
pp.377–379.)

*Needs:* Layer 1 `graham_ringrose_bound`; Layer 1 `small_conductor_product_cancellation`; Layer 1
`large_conductor_character_blocks`.

### 1.4 Periodic intervals and Möbius masks

Prove `periodic_interval_remainder` (zero-mean periodic interval remainder). For f:N→C, q>0, f(n+q)=f(n) and
Σ_{0≤j<q}f(j)=0, and any natural A,B, Σ_{A<m≤B}f(m)=Σ_{0≤j<(B−A) mod q}f(A+j+1). Subtraction is truncated
natural subtraction. ([Bennett–Siksek](#bennettsiksek2020), §8.1, proof of Proposition 8.2, Case 2, pp.378–379;
the incomplete η-sums on p.379.)

No ordering assumption on A,B. No norm bound on f is needed.

*Needs:* Mathlib `Function.Periodic`; Mathlib `Nat.card_Ioc`.

Prove `periodic_interval_norm` (norm bound by the residual interval length). Under the hypotheses of
periodic-interval-remainder, also assume ‖f(n)‖≤1 for every natural n. Then ‖Σ_{A<m≤B}f(m)‖≤((B−A) mod q), with
the natural remainder cast to R. ([Bennett–Siksek](#bennettsiksek2020), §8.1, proof of Proposition 8.2, Case 2,
pp.378–379; the bound for each inner η-sum on p.379.)

q>0; zero mean over a complete period; pointwise norm at most one.

*Needs:* Layer 1 `periodic_interval_remainder`; Mathlib `norm_sum_le`.

Prove `character_interval_bound` (incomplete nonprincipal character bound). For q>0 and a nonprincipal complex
Dirichlet character χ modulo q, ‖Σ_{A<m≤B}χ(m)‖≤q for all natural A,B. Values are taken by natural casting into
ZMod q. ([Bennett–Siksek](#bennettsiksek2020), §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.379, inner
sums indexed by k/(2d)<n≤k/d.)

Nonprincipal means χ≠1 in the existing character monoid. Neither primitive nor quadratic is assumed.

*Needs:* Layer 1 `periodic_interval_norm`; Mathlib `DirichletCharacter`; Mathlib `ZMod.natCast_self`; Mathlib
`MulChar.sum_eq_zero_of_ne_one`; Mathlib `DirichletCharacter.norm_le_one`.

Prove `divisible_interval_reindex` (reindexing divisible interval entries). For f:N→C, natural A,B and d>0,
Σ_{m∈(A,B], d|m}f(m)=Σ_{A div d<n≤B div d}f(dn), where div is natural floor division.
([Bennett–Siksek](#bennettsiksek2020), §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.379, change from m
to nd.)

d>0 is required for injectivity and division. Both interval endpoints are divided, and the lower endpoint
remains open.

*Needs:* Mathlib `Nat.card_Ioc`.

Prove `coprime_moebius_expansion` (weighted coprimality expansion). For f:N→C and natural A,B,M with M>0,
Σ_{A<m≤B}1_{gcd(m,M)=1}f(m)=Σ_{d|M}μ(d) Σ_{A<m≤B,d|m}f(m), with μ(d) cast from Z to C and d ranging over
M.divisors. ([Bennett–Siksek](#bennettsiksek2020), §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.378,
Möbius divisor identity; p.379, first finite interchange.)

M>0; no squarefreeness assumption. The coprimality factor means f(m) if Nat.Coprime m M and zero otherwise, not
a newly defined carrier.

*Needs:* Mathlib `ArithmeticFunction.moebius`; Mathlib `ArithmeticFunction.moebius_mul_coe_zeta`; Mathlib
`ArithmeticFunction.coe_mul_zeta_apply`; Mathlib `ArithmeticFunction.one_apply`; Mathlib `Nat.divisors`; Mathlib
`Nat.mem_divisors`.

Prove `character_exclusion_expansion` (möbius expansion of an excluded character sum). For a complex Dirichlet
character χ modulo any natural q and M>0, Σ_{A<m≤B}1_{gcd(m,M)=1}χ(m)=Σ_{d|M}μ(d)χ(d)Σ_{A div d<n≤B div d}χ(n).
([Bennett–Siksek](#bennettsiksek2020), §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.379, final Möbius
expansion.)

q may be zero for this algebraic identity; positivity is imposed only for the subsequent finite-period bound. M
may share prime factors with q and may be nonsquarefree.

*Needs:* Layer 1 `coprime_moebius_expansion`; Layer 1 `divisible_interval_reindex`; Mathlib
`DirichletCharacter`; Mathlib `Nat.pos_of_mem_divisors`.

Prove `character_exclusion_bound` (divisor-weighted character bound). For q>0, nonprincipal χ modulo q, M>0, and
natural A,B, ‖Σ_{A<m≤B}1_{gcd(m,M)=1}χ(m)‖≤τ(M)q, where τ(M)=card(M.divisors).
([Bennett–Siksek](#bennettsiksek2020), §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.379, final
displayed character-sum bound.)

No primitivity, quadraticity, squarefreeness or gcd(q,M)=1 assumption. The inequality is non-strict and uniform
in both endpoints.

*Needs:* Layer 1 `character_exclusion_expansion`; Layer 1 `character_interval_bound`; Mathlib
`ArithmeticFunction.abs_moebius_le_one`; Mathlib `DirichletCharacter.norm_le_one`; Mathlib `norm_sum_le`.

Prove `exclusion_complete_period` (zero mean for the excluded product period). For q>0, nonprincipal χ modulo q
and M>0, Σ_{0<m≤qM}1_{gcd(m,M)=1}χ(m)=0. The integer qM is a period, not an assertion about primitive conductor.
([Bennett–Siksek](#bennettsiksek2020), §8.1, proof of Proposition 8.2, Case 2, pp.378–379; p.378, direct period
estimate in Case 2.)

No gcd(q,M)=1 or squarefree M restriction.

*Needs:* Layer 1 `character_exclusion_expansion`; Layer 1 `periodic_interval_remainder`; Mathlib
`ZMod.natCast_self`; Mathlib `MulChar.sum_eq_zero_of_ne_one`; Mathlib `Nat.mem_divisors`.

Prove `exclusion_direct_period_bound` (product-period character bound). For q>0, nonprincipal χ modulo q, M>0,
and natural A,B, ‖Σ_{A<m≤B}1_{gcd(m,M)=1}χ(m)‖≤qM. ([Bennett–Siksek](#bennettsiksek2020), §8.1, proof of
Proposition 8.2, Case 2, pp.378–379; p.378, the direct bound preceding the assumption on M₂.)

qM is only a valid period; it need not be the least period or an ambient conductor.

*Needs:* Layer 1 `exclusion_complete_period`; Layer 1 `periodic_interval_norm`; Mathlib
`Nat.coprime_add_mul_right_right`; Mathlib `DirichletCharacter.norm_le_one`; Mathlib `ZMod.natCast_self`.

Prove `small_conductor_power_saving` (small-conductor square-root saving). Let c>0, C≥1 and assume τ(M)≤C
M^(1/(64c)) for every positive natural M. If k≥1 is natural with 8C≤k^(17/64), q>0, χ modulo q is nonprincipal,
M>0, q≤8k^(7/32), and M≤k^c, then ‖Σ_{k div 2<m≤k}1_{gcd(m,M)=1}χ(m)‖≤k^(1/2). All powers in the hypotheses and
conclusion are real powers of nonnegative casts. ([Bennett–Siksek](#bennettsiksek2020), §8.1, proof of
Proposition 8.2, Case 2, pp.378–379; pp.378–379, end of Case 2, using the corrected divisor estimate.)

The divisor estimate is an explicit hypothesis of this conditional adapter; the unconditional estimates below
import it from AN.5. The conclusion is this small-conductor branch, not the full distinct-quadratic-character
proposition.

*Needs:* Layer 1 `character_exclusion_bound`; Mathlib `Real.rpow_le_rpow`; Mathlib `Real.rpow_mul`; Mathlib
`Real.rpow_add`.

Prove `character_exclusion_explicit_subpower_bound` (explicit excluded-character subpower bound). For ε>0 and a
natural B≥exp(1/ε), every nonprincipal complex character χ modulo q>0, positive exclusion modulus M and natural
endpoints A,Z satisfy ‖Σ_{A<m≤Z}1_{gcd(m,M)=1}χ(m)‖≤D^B q M^ε, where D=max(1,(ε log2)⁻¹).
([Bennett–Siksek](#bennettsiksek2020), §8.1, Case2, printed pp.378–379; [Tao, divisor bound](#taodivisor2008),
Small/large-prime proof; the explicit and uniform divisor estimates of AN.5.)

ε>0; B natural with exp(1/ε)≤B; q>0; χ≠1; M>0; A,Z natural with no ordering assumption.

*Needs:* Layer 1 `character_exclusion_bound`; `AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound`.

Prove `small_conductor_explicit_threshold` (explicit small-conductor threshold). Let c>0, B∈ℕ with B≥exp(64c),
and put D=max(1,((64c)⁻¹ log2)⁻¹), C=D^B. For natural k≥1 with (8C)^(64/17)≤k, every nonprincipal complex
character χ modulo q>0 and M>0 satisfying q≤8k^(7/32) and M≤k^c obeys ‖Σ_{k
div2<m≤k}1_{gcd(m,M)=1}χ(m)‖≤k^(1/2). ([Bennett–Siksek](#bennettsiksek2020), §8.1, Case2, printed pp.378–379;
[Tao, divisor bound](#taodivisor2008), Small/large-prime proof; the explicit and uniform divisor estimates of
AN.5.)

c>0; B natural with exp(64c)≤B; k≥1; the displayed explicit size threshold; q>0; χ≠1; M>0; the two growth
bounds.

*Needs:* Layer 1 `small_conductor_power_saving`; `AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound`;
Mathlib `Real.rpow_le_rpow`; Mathlib `Real.rpow_mul`.

Prove `eventual_small_conductor_power_saving` (uniform eventual small-conductor cancellation). For each real c>0
there exists a natural K≥1 such that for all k≥K, all positive q, all nonprincipal complex Dirichlet characters
χ modulo q, and all M>0, the inequalities q≤8k^(7/32) and M≤k^c imply ‖Σ_{k
div2<m≤k}1_{gcd(m,M)=1}χ(m)‖≤k^(1/2). K depends only on c, not on q,χ,M or k.
([Bennett–Siksek](#bennettsiksek2020), §8.1, Case2, printed pp.378–379; [Tao, divisor bound](#taodivisor2008),
Small/large-prime proof; the explicit and uniform divisor estimates of AN.5.)

c>0; the universal variables satisfy the displayed positivity, nonprincipality and growth conditions.

*Needs:* Layer 1 `small_conductor_power_saving`; `AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound`;
Mathlib `exists_nat_ge`; Mathlib `Real.rpow_le_rpow`; Mathlib `Real.rpow_mul`.

### 1.5 Primitive inducing characters

Prove `ambient_product_evaluation` (integer evaluation of the ambient product). For positive N1,N2, complex
Dirichlet characters χi modulo Ni and every integer a, the existing character σ=χ1.mul χ2 modulo M=lcm(N1,N2)
satisfies σ(a)=χ1(a)χ2(a). ([Bennett–Siksek](#bennettsiksek2020), §8.1, proof of Proposition 8.2, printed
p.377.)

No primitivity, quadraticity, distinctness or coprimality of the moduli is required. Evaluations cast the same
integer to each residue ring, including nonunits.

*Needs:* Mathlib `DirichletCharacter.mul`; Mathlib `DirichletCharacter.changeLevel_eq_cast_of_dvd'`; Mathlib
`DirichletCharacter.apply_eq_zero_iff`; Mathlib `Nat.Prime.dvd_lcm`; Mathlib `Nat.Prime.not_coprime_iff_dvd`.

Prove `primitive_exclusion_coprime` (coprimality of conductor and excluded primes). For any complex character σ
modulo M>0, put q=cond(σ) and R=∏{p prime : p divides M and p does not divide q}p. Then gcd(q,R)=1.
([Bennett–Siksek](#bennettsiksek2020), §8.1, proof of Proposition 8.2, printed p.377.)

The finite prime set is the existing primeFactors(M) filtered by p not dividing q; the empty product is 1. σ may
be principal or imprimitive.

*Needs:* Mathlib `Nat.primeFactors`; Mathlib `Nat.mem_primeFactors`; Mathlib `Nat.coprime_prod_right_iff`.

Prove `primitive_exclusion_period_divides` (the reduced product divides the ambient modulus). For σ modulo M>0,
q=cond(σ) and R the product of prime divisors of M absent from q, qR divides M.
([Bennett–Siksek](#bennettsiksek2020), §8.1, proof of Proposition 8.2, printed p.377.)

No assertion that qR=M or that qR is a primitive conductor. All prime factors in R occur once; q>0 is supplied
by conductor_ne_zero.

*Needs:* Layer 1 `primitive_exclusion_coprime`; Mathlib `DirichletCharacter.conductor_dvd_level`; Mathlib
`DirichletCharacter.conductor_ne_zero`; Mathlib `Finset.prod_dvd_prod_of_subset`; Mathlib
`Nat.prod_primeFactors_dvd`.

Prove `primitive_exclusion_evaluation` (the primitive character with its exclusion mask). For every complex
character σ modulo M>0 and integer a, let q=cond(σ), η=σ.primitiveCharacter and R the product of prime divisors
of M absent from q. Then σ(a)=η(a) if gcd(|a|,R)=1, and σ(a)=0 otherwise. ([Bennett–Siksek](#bennettsiksek2020),
§8.1, proof of Proposition 8.2, printed p.377.)

No nonprincipality or primitivity hypothesis on σ; q=1 is allowed. The mask uses coprimality of integers,
equivalent to natural coprimality for nonnegative inputs.

*Needs:* Mathlib `DirichletCharacter.primitiveCharacter`; Mathlib
`DirichletCharacter.primitiveCharacter_apply_of_isCoprime`; Mathlib `DirichletCharacter.apply_eq_zero_iff`;
Mathlib `DirichletCharacter.conductor_dvd_level`; Mathlib `Nat.mem_primeFactors`; Mathlib
`Nat.Prime.not_coprime_iff_dvd`; Mathlib `Nat.isCoprime_iff_coprime`.

Prove `cancelled_prime_common_support` (cancelled primes divide both original conductors). Let χ1,χ2 be
primitive complex Dirichlet characters of positive moduli N1,N2. Set M=lcm(N1,N2), σ=χ1.mul χ2, q=cond(σ), and R
the product of prime divisors of M not dividing q. Then R divides gcd(N1,N2).
([Bennett–Siksek](#bennettsiksek2020), §8.1, proof of Proposition 8.2, printed p.377.)

Quadraticity and distinctness are unnecessary, but primitivity of both inputs is required.

*Needs:* Mathlib `DirichletCharacter.IsPrimitive`; Mathlib `DirichletCharacter.conductor_changeLevel`; Mathlib
`DirichletCharacter.conductor_inv`; Mathlib `DirichletCharacter.conductor_mul_dvd_lcm_conductor`; Mathlib
`Nat.Prime.dvd_lcm`; Mathlib `Nat.mem_primeFactors`; Mathlib `Finset.prod_dvd_prod_of_subset`; Mathlib
`Nat.prod_primeFactors_dvd`.

Prove `primitive_product_quadratic` (quadraticity survives primitive reduction). For positive N1,N2 and
quadratic complex Dirichlet characters χi modulo Ni, the existing primitive product η=χ1.primitive_mul χ2 is
quadratic. ([Bennett–Siksek](#bennettsiksek2020), §8.1, proof of Proposition 8.2, printed p.377.)

Quadratic means the existing predicate that every value is 0, 1 or −1; it includes the principal character. No
input primitivity or distinctness is required.

*Needs:* Mathlib `DirichletCharacter.mul`; Mathlib `DirichletCharacter.primitive_mul`; Mathlib
`DirichletCharacter.changeLevel`; Mathlib `DirichletCharacter.changeLevel_injective`; Mathlib
`DirichletCharacter.changeLevel_primitiveCharacter`; Mathlib `MulChar.IsQuadratic`; Mathlib
`MulChar.IsQuadratic.sq_eq_one`; Mathlib `MulChar.isQuadratic_iff_sq_eq_one`.

Prove `primitive_product_nonprincipal` (distinct primitive quadratic inputs give a nonprincipal inducer). For
positive N1,N2, primitive quadratic complex characters χi modulo Ni, and an integer a with χ1(a)≠χ2(a), the
primitive product η=χ1.primitive_mul χ2 is not principal. ([Bennett–Siksek](#bennettsiksek2020), §8.1, proof of
Proposition 8.2, printed p.377.)

Distinctness is as functions on integers; moduli may coincide. The interface retains both source quadratic
hypotheses; the proof only needs the second input to square to the principal character.

*Needs:* Mathlib `DirichletCharacter.primitive_mul`; Mathlib
`DirichletCharacter.changeLevel_primitiveCharacter`; Mathlib `DirichletCharacter.changeLevel_injective`; Mathlib
`DirichletCharacter.conductor_changeLevel`; Mathlib `DirichletCharacter.IsPrimitive`; Mathlib
`MulChar.IsQuadratic.sq_eq_one`.

Prove `small_conductor_product_cancellation` (small-conductor cancellation for the original product). For each
real c>0 there is a natural K≥1 such that, for every k≥K and every pair of distinct primitive quadratic complex
Dirichlet characters χi of positive moduli Ni≤k^c, if q=cond(χ1.mul χ2)≤8k^(7/32), then ‖Σ_{k
div2<a≤k}χ1(a)χ2(a)‖≤k^(1/2). The threshold K depends only on c. ([Bennett–Siksek](#bennettsiksek2020), §8.1,
proof of Proposition 8.2, printed p.377 and Case 2, pp.378–379.)

Distinctness means an integer witness of different values; the moduli may be equal. There is no prime-factor
smoothness hypothesis in this small-conductor branch. The theorem does not cover q>8k^(7/32), or assert full
Proposition 8.2.

*Needs:* Layer 1 `ambient_product_evaluation`; Layer 1 `primitive_exclusion_evaluation`; Layer 1
`cancelled_prime_common_support`; Layer 1 `primitive_product_nonprincipal`; Layer 1
`eventual_small_conductor_power_saving`; Mathlib `DirichletCharacter.conductor_ne_zero`; Mathlib
`DirichletCharacter.primitive_mul_isPrimitive`; Mathlib `Nat.isCoprime_iff_coprime`.

### 1.6 Packing smooth moduli

Prove `smooth_divisor_window` (divisor in a smooth-modulus window). Let T > 1 be real and N a natural number
with T ≤ N. If every prime p dividing N satisfies p ≤ T², then there is a natural divisor d of N with T ≤ d ≤
T². ([Bennett–Siksek](#bennettsiksek2020), §8.1, printed pp.377–378, Case 1, factor conditions (a)–(c).)

N is automatically positive. Squarefreeness is not required for this divisor-extraction step. Bounds on natural
numbers are comparisons after casting to ℝ.

*Needs:* Mathlib `Nat.ne_one_iff_exists_prime_dvd`.

Prove `squarefree_modulus_blocks` (pairwise-coprime bounded blocks of a squarefree modulus). Let T > 1, let N be
squarefree, and suppose every prime divisor p of N is at most T². There exist a list B of natural numbers and a
residual integer u with 0 < u < T, u·∏B = N, every b in B in [T,T²], the entries of B pairwise coprime, and
gcd(u,∏B) = 1. ([Bennett–Siksek](#bennettsiksek2020), §8.1, printed pp.377–378, Case 1, factor conditions
(a)–(e).)

The list and residual use the existing List, product, Squarefree and Nat.Coprime carriers. No new factorization
object is defined. N = 1 is allowed and gives B empty, u = 1. The residual may equal one. Since T > 1, every
listed block exceeds one.

*Needs:* Layer 1 `smooth_divisor_window`; Mathlib `Nat.squarefree_mul_iff`; Mathlib
`Nat.coprime_of_squarefree_mul`; Mathlib `Nat.coprime_list_prod_right_iff`; Mathlib
`Squarefree.squarefree_of_dvd`; Mathlib `Odd.of_dvd_nat`.

Prove `bounded_crt_modulus_blocks` (bounded crt modulus blocks). Let T ≥ 8 and a,Q,R be natural numbers with 0 <
a ≤ 8, Q and R squarefree, Q odd, Q ≥ T, gcd(Q,R) = 1 and gcd(a,QR) = 1. Suppose every prime divisor of Q or R
is at most T². Then there exist q and a list B such that q divides Q, q is odd and squarefree, T ≤ q ≤ T², the
product of q::B is aQR, its entries are pairwise coprime and all in (1,T²], and at most two entries of B are
less than T. ([Bennett–Siksek](#bennettsiksek2020), §8.1, printed pp.377–378, Case 1, (a)–(e) and r−2 bound.)

This is a pure modulus-packing theorem. In the intended application a is the bounded 2-primary factor of the
primitive conductor, Q its odd part, and R the excluded-prime product. The theorem does not prove that a given
character has such a conductor decomposition. R = 1 is explicitly permitted. Unit factors are removed. The
distinguished factor comes from Q, not from the principal exclusion modulus.

*Needs:* Layer 1 `squarefree_modulus_blocks`; Mathlib `List.prod_filter_bne_one`; Mathlib
`Nat.coprime_list_prod_right_iff`; Mathlib `Squarefree.squarefree_of_dvd`; Mathlib `Odd.of_dvd_nat`.

Prove `bounded_factor_count` (factor count with two exceptional blocks). Let k > 1, c > 0, qᵢ ≥ 1 for i in Fin
r, and let E be a subset of Fin r with at most two members. Suppose qᵢ ≥ k^(7/32) whenever i is outside E, and
∏ᵢqᵢ ≤ k^(2c). Then r < 10c + 2. All inequalities and the product bound are interpreted in ℝ.
([Bennett–Siksek](#bennettsiksek2020), §8.1, printed p.378, displayed r−2 logarithmic bound.)

The exceptional set is an input identifying the at most two residual blocks from `bounded_crt_modulus_blocks`.
The result also permits r = 0 or 1. Neither distinctness nor primality of the qᵢ is needed for this numerical
bound. Positivity follows from qᵢ ≥ 1.

*Needs:* Layer 1 `bounded_crt_modulus_blocks`; Mathlib `Real.log_prod`; Mathlib `Real.log_le_log`; Mathlib
`Real.log_nonneg`; Mathlib `Real.log_pos`; Mathlib `Real.log_rpow`.

Prove `graham_ringrose_interval_threshold` (interval length for the smooth-modulus estimate). Let k > 2⁶⁴ be
real, let 0 ≤ q ≤ k^(7/16), and let L ≤ k^(7/16). Then max(L,q^(1/4))·q^(5/4) ≤ k^(63/64) < k/2.
([Bennett–Siksek](#bennettsiksek2020), §8.1, printed p.378, displayed R₀ inequality.)

In the application L is an upper bound for the other moduli; L = 0 is allowed when there are no other factors.
No character estimate is a hypothesis or a conclusion. The first inequality only needs k > 1. The displayed
combined contract uses the explicit strict threshold k > 2⁶⁴ for the second inequality.

*Needs:* Mathlib `Real.rpow_le_rpow`; Mathlib `Real.rpow_lt_rpow`; Mathlib `Real.rpow_le_rpow_of_exponent_le`;
Mathlib `Real.rpow_mul`; Mathlib `Real.rpow_add`; Mathlib `Real.rpow_natCast`.

### 1.7 CRT factorization and conductor bookkeeping

Define `crtCharacterEquiv` (crt decomposition of dirichlet characters). For a finite index type I, pairwise
coprime natural moduli nᵢ and a commutative monoid with zero C, put N=∏ᵢnᵢ. Define crtCharacterEquiv(n) from
Dirichlet characters C of level N to families of characters C of levels nᵢ, as a multiplicative equivalence. Let
E be the native unit-group CRT equivalence from (ZMod N)× to ∏ᵢ(ZMod nᵢ)×. The i-th factor has unit homomorphism
u ↦ χ(E⁻¹(eᵢ(u))), where eᵢ places u in coordinate i and one elsewhere; extend by zero at nonunits using the
native unit-character equivalence. The inverse multiplies the coordinate characters on CRT units and extends by
zero. No new character or conductor carrier is introduced. ([Bennett–Siksek](#bennettsiksek2020), §8.1, proof of
Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377.)

I is finite, with decidable equality for the coordinate inclusions; nᵢ are pairwise coprime. No positivity is
needed for this algebraic equivalence; all conductor statements below require nᵢ>0. C is any commutative monoid
with zero. Empty I has N=1; modulus-one coordinates are allowed.

The basic API consists of the following statements.

- `crtCharacterEquiv_apply_unit`: With E and eᵢ as in the definition, the unit homomorphism of the i-th factor
  sends u to χ.toUnitHom(E⁻¹(eᵢ(u))). This fixes the coordinate order.
- `crtCharacterEquiv_symm_unit`: For a family φᵢ and a unit u modulo N, the inverse character at u equals
  ∏ᵢφᵢ(reductionᵢ(u)), using the native ZMod.unitsMap for nᵢ|N.
- `crtCharacterEquiv_one`: The principal character maps to the family of principal characters, with their native
  zero values at nonunits.
- `crtCharacterEquiv_mul`: The image of χψ is the coordinatewise product of the images of χ and ψ.
- `crtCharacterEquiv_ext`: Two characters of level N are equal if and only if every corresponding CRT factor is
  equal.
- `crt_inverse_product`: The inverse of φ is ∏ᵢ changeLevel(nᵢ|N)(φᵢ), an equality of native characters at N.
- `crt_integer_evaluation`: For every integer a, χ(a)=∏ᵢ(crtCharacterEquiv(n)(χ))ᵢ(a), including nonunits and
  negative a.

**Checks.**

- For I=Fin 0 and its empty family, the inverse character evaluates to 1 at every integer a.
- For the singleton modulus-one family, the factor of the principal character evaluates to 1 at zero.
- For the singleton modulus-seven family and arbitrary χ, the unique factor agrees with χ at every integer.
- At the two moduli (3,4), the inverse of the principal family evaluates to 0 at 2; it is not the constant
  function one.
- At the two moduli (3,4), the inverse of the principal family evaluates to 1 at −1.
- The inverse of the principal family at (3,4) has native conductor 1, despite ambient modulus 12.

*Needs:* Mathlib `ZMod.prodEquivPi`; Mathlib `MulChar.mulEquivToUnitHom`; Mathlib `Units.mapEquiv`; Mathlib
`MulEquiv.piUnits`; Mathlib `MulEquiv.monoidHomCongrLeft`; Mathlib `Pi.monoidHomMulEquiv`; Mathlib
`MulEquiv.piCongrRight`.

Prove `crt_inverse_product` (crt reconstruction as a product of level lifts). For the finite pairwise-coprime
family nᵢ, N=∏ᵢnᵢ and characters φᵢ with values in a commutative monoid with zero C,
crtCharacterEquiv(n)⁻¹(φ)=∏ᵢ changeLevel(nᵢ|N)(φᵢ), as characters modulo N.
([Bennett–Siksek](#bennettsiksek2020), §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on
pp.376–377.)

Same finite family and coefficient assumptions as crt-character-equivalence; zero moduli and empty families are
allowed here.

*Needs:* Layer 1 `crtCharacterEquiv`; Mathlib `ZMod.prodEquivPi_apply`; Mathlib
`DirichletCharacter.changeLevel_toUnitHom`; Mathlib `MulChar.mulEquivToUnitHom`.

Prove `crt_integer_evaluation` (all-integer crt reconstruction). For every integer z and character χ at N=∏ᵢnᵢ
with values in a commutative monoid with zero C, χ(z)=∏ᵢφᵢ(z), where φ=crtCharacterEquiv(n)(χ). No coprimality
hypothesis on z is imposed. ([Bennett–Siksek](#bennettsiksek2020), §8.1, proof of Proposition 8.2, printed
pp.377–378; Theorem 6 on pp.376–377.)

I finite and the nᵢ pairwise coprime. Empty I and modulus-one coordinates are included.

*Needs:* Layer 1 `crtCharacterEquiv`; Mathlib `ZMod.prodEquivPi_apply`; Mathlib `Pi.isUnit_iff`; Mathlib
`MulChar.map_nonunit`.

Prove `crt_primitive_family` (finite crt products of primitive factors). Let nᵢ>0 be a finite pairwise-coprime
family and φᵢ native Dirichlet characters with values in a commutative monoid with zero C. If every φᵢ is
primitive at nᵢ, then crtCharacterEquiv(n)⁻¹(φ) is primitive at ∏ᵢnᵢ. ([Bennett–Siksek](#bennettsiksek2020),
§8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377.)

All nᵢ>0. The index set may be empty and some nᵢ may equal one.

*Needs:* Layer 1 `crt_inverse_product`;
`ClassicalArithmeticCompletion:CA.1/primitivity-of-a-product-at-coprime-levels`; Mathlib
`DirichletCharacter.isPrimitive_one_level_one`; Mathlib `DirichletCharacter.changeLevel_trans`; Mathlib
`Nat.coprime_prod_right_iff`.

Prove `crt_product_conductor` (conductor of a finite crt product). For positive pairwise-coprime nᵢ and
arbitrary characters φᵢ valued in a commutative monoid with zero C, the conductor of crtCharacterEquiv(n)⁻¹(φ)
equals ∏ᵢ cond(φᵢ). ([Bennett–Siksek](#bennettsiksek2020), §8.1, proof of Proposition 8.2, printed pp.377–378;
Theorem 6 on pp.376–377.)

All nᵢ>0; neither primitivity nor nonprincipality of φᵢ is required.

*Needs:* Layer 1 `crt_inverse_product`; Layer 1 `crt_primitive_family`; Mathlib
`DirichletCharacter.conductor_dvd_level`; Mathlib `DirichletCharacter.conductor_ne_zero`; Mathlib
`DirichletCharacter.primitiveCharacter_isPrimitive`; Mathlib
`DirichletCharacter.changeLevel_primitiveCharacter`; Mathlib `DirichletCharacter.changeLevel_trans`; Mathlib
`DirichletCharacter.conductor_changeLevel`.

Prove `crt_component_conductor` (conductor of one crt factor). For χ of positive level N=∏ᵢnᵢ with positive
pairwise-coprime nᵢ, the conductor of its i-th CRT factor equals gcd(cond(χ),nᵢ). In particular a block nᵢ
dividing cond(χ) has a primitive factor; a block coprime to cond(χ) has a principal factor.
([Bennett–Siksek](#bennettsiksek2020), §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on
pp.376–377.)

C is a commutative monoid with zero; every nᵢ>0. The two consequences use the native IsPrimitive and
principal-character criteria.

*Needs:* Layer 1 `crt_product_conductor`; Layer 1 `crtCharacterEquiv`; Mathlib
`DirichletCharacter.conductor_dvd_level`; Mathlib `Nat.coprime_prod_right_iff`; Mathlib
`Nat.gcd_mul_of_coprime_of_dvd`; Mathlib `DirichletCharacter.IsPrimitive`; Mathlib
`DirichletCharacter.eq_one_iff_conductor_eq_one`.

Prove `crt_quadratic_components` (quadratic crt factors). Every CRT factor of a complex quadratic Dirichlet
character is quadratic in the native MulChar.IsQuadratic sense, which includes principal characters.
([Bennett–Siksek](#bennettsiksek2020), §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6 on
pp.376–377.)

A finite pairwise-coprime family; χ is a complex-valued native quadratic character at its product level.

*Needs:* Layer 1 `crtCharacterEquiv`; Mathlib `MulChar.isQuadratic_iff_sq_eq_one`.

Prove `change_level_exclusion` (level lifting as an exclusion mask). For any natural D,R, any complex Dirichlet
character η modulo D and any integer z, changeLevel(D|DR)(η)(z) equals η(z) if z and R are coprime as integers,
and zero otherwise. No coprimality between D and R, and no positivity assumption, is needed for this evaluation
identity. ([Bennett–Siksek](#bennettsiksek2020), §8.1, proof of Proposition 8.2, printed pp.377–378; Theorem 6
on pp.376–377.)

Native integer evaluation and IsCoprime are used, including D=0 or R=0; analytic applications have D,R>0.

*Needs:* Mathlib `DirichletCharacter.changeLevel`; Mathlib `DirichletCharacter.changeLevel_eq_cast_of_dvd'`;
Mathlib `DirichletCharacter.apply_eq_zero_iff`; Mathlib `IsCoprime.mul_right_iff`.

Prove `bounded_crt_character_factors` (characters on the bounded crt blocks). Let T≥8, 0<a≤8, Q odd squarefree
with Q≥T, and R squarefree, with gcd(Q,R)=1 and gcd(a,QR)=1. Every prime dividing Q or R is at most T². Let η be
a primitive complex character modulo aQ. There exist a natural r, positive moduli nᵢ indexed by Fin(r+1), and
characters φᵢ modulo nᵢ, with: the moduli pairwise coprime and product aQR; n₀|Q, n₀ odd squarefree and T≤n₀;
every 1<nᵢ≤T²; at most two indices i≠0 have nᵢ<T; cond(φᵢ)=gcd(aQ,nᵢ), so φ₀ is primitive; and η(z) times the
coprimality mask for R equals ∏ᵢφᵢ(z) for every integer z. ([Bennett–Siksek](#bennettsiksek2020), §8.1, proof of
Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377.)

The native primitive η and arithmetic hypotheses are supplied. No quadraticity is needed for this factor
construction. R=1 is allowed; all modulus-one blocks have already been discarded. Other factors need not all be
primitive or principal for an arbitrary admissible grouping; their exact gcd conductors are stated.

*Needs:* Layer 1 `bounded_crt_modulus_blocks`; Layer 1 `crtCharacterEquiv`; Layer 1 `crt_component_conductor`;
Layer 1 `crt_integer_evaluation`; Layer 1 `change_level_exclusion`; Mathlib
`DirichletCharacter.conductor_changeLevel`.

Prove `large_conductor_character_blocks` (large-conductor character blocks and interval threshold). Fix c>0 and
a natural k>2⁶⁴. Let σ be any complex quadratic character at a positive ambient modulus M≤k^(2c), whose
conductor D satisfies D≥8k^(7/32). Suppose every prime divisor of M is at most k^(7/16). Then there exist r≥0,
pairwise-coprime moduli nᵢ indexed by Fin(r+1), and quadratic characters φᵢ modulo nᵢ, such that ∏ᵢnᵢ divides M,
every 1<nᵢ≤k^(7/16), n₀ is odd squarefree and at least k^(7/32), φ₀ is primitive, σ(z)=∏ᵢφᵢ(z) for every integer
z, and r+1<10c+2. If L=max{nᵢ:i≠0}, with L=0 for the empty set, then max(L,n₀^(1/4))n₀^(5/4)<k/2. All displayed
nonintegral powers are real powers of nonnegative real casts. ([Bennett–Siksek](#bennettsiksek2020), §8.1, proof
of Proposition 8.2, printed pp.377–378; Theorem 6 on pp.376–377.)

σ need not be primitive at M. The large lower bound already excludes a principal σ. This theorem supplies the
factors and the size hypotheses for Theorem 6; it contains no character-sum estimate.

*Needs:* Layer 1 `bounded_crt_character_factors`; Layer 1 `primitive_exclusion_coprime`; Layer 1
`primitive_exclusion_period_divides`; Layer 1 `primitive_exclusion_evaluation`; Layer 1
`crt_quadratic_components`; Layer 1 `bounded_factor_count`; Layer 1 `graham_ringrose_interval_threshold`;
`ClassicalArithmeticCompletion:CA.1/odd-part-of-a-quadratic-conductor-is-squarefree`;
`ClassicalArithmeticCompletion:CA.1/two-adic-conductor-bound`; Mathlib
`DirichletCharacter.primitiveCharacter_isPrimitive`; Mathlib
`DirichletCharacter.changeLevel_primitiveCharacter`; Mathlib `DirichletCharacter.changeLevel_injective`; Mathlib
`DirichletCharacter.changeLevel`; Mathlib `DirichletCharacter.conductor_dvd_level`; Mathlib
`DirichletCharacter.conductor_ne_zero`; Mathlib `MulChar.isQuadratic_iff_sq_eq_one`; Mathlib `Nat.ordProj_dvd`;
Mathlib `Nat.not_dvd_ordCompl`; Mathlib `Nat.coprime_ordCompl`; Mathlib `Nat.squarefree_mul_iff`; Mathlib
`Real.rpow_mul`; Mathlib `Real.rpow_le_rpow`; Mathlib `Real.rpow_pos_of_pos`; Mathlib
`Nat.ordProj_mul_ordCompl_eq_self`; Mathlib `Nat.ordProj_pos`; Mathlib
`Finset.squarefree_prod_of_pairwise_isCoprime`.

### 1.8 Uniform numerical savings

Prove `bounded_divisor_power` (the bounded squared divisor factor). For q>0 and natural 1≤R and r≤R, let C≥1 and
suppose τ(q)≤C q^(1/(4R²)), where τ(q)=card(q.divisors). Then τ(q)^(r²)≤C^(R²) q^(1/4). All powers with
nonintegral exponents are real powers. ([Bennett–Siksek](#bennettsiksek2020), §8.1, Case 1, printed p.378,
divisor-factor saving and the final c₃ calculation.)

q is natural and positive; R,r are natural; R≥1; r≤R; C is real and C≥1. The displayed divisor estimate is a
hypothesis furnished by AN.5.

*Needs:* Mathlib `pow_le_pow_left₀`; Mathlib `pow_le_pow_right₀`; Mathlib `Real.one_le_rpow`; Mathlib
`Real.rpow_natCast`; Mathlib `Real.rpow_mul`.

Prove `large_conductor_divisor_saving` (strict saving in the divisor factor). Under bounded-divisor-power’s
hypotheses, if q>1 and C^(4R²)<q, then τ(q)^(r²)<q^(1/2). The constant and strict threshold cannot be discarded.
([Bennett–Siksek](#bennettsiksek2020), §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃
calculation.)

The same q,R,r,C and divisor input as bounded-divisor-power; q>1; C^(4R²)<q.

*Needs:* Layer 1 `bounded_divisor_power`; Mathlib `Real.rpow_lt_rpow`; Mathlib `Real.rpow_mul`; Mathlib
`Real.rpow_natCast`; Mathlib `Real.rpow_add`.

Prove `large_conductor_explicit_divisor_threshold` (an explicit large-conductor divisor threshold). Let R≥1 and
r≤R be natural and choose B∈ℕ with exp(4R²)≤B. Put C=max(1,((1/(4R²)) log 2)⁻¹)^B. For real
k>max(1,(C^(4R²))^(32/7)) and positive natural q with k^(7/32)≤q, one has τ(q)^(r²)<q^(1/2).
([Bennett–Siksek](#bennettsiksek2020), §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃
calculation.)

R,r,B are natural; R≥1; r≤R. The displayed C is a local expression, not a new carrier or unspecified constant.

*Needs:* Layer 1 `large_conductor_divisor_saving`; `AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound`;
Mathlib `Real.rpow_lt_rpow`; Mathlib `Real.rpow_mul`.

Prove `large_conductor_eventual_divisor_saving` (one divisor threshold for the bounded factor family). For every
real c>0 there exists a natural K≥2 such that, for every natural k≥K, positive natural q with k^(7/32)≤q, and
natural r with r<10c+2, one has τ(q)^(r²)<q^(1/2). The same K works for all permitted q and r.
([Bennett–Siksek](#bennettsiksek2020), §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃
calculation.)

c>0. Natural k,q,r; q>0. The factor-count hypothesis is an inequality after casting r to ℝ.

*Needs:* Layer 1 `large_conductor_explicit_divisor_threshold`; Layer 1 `bounded_factor_count`; Mathlib
`exists_nat_ge`; Mathlib `exists_nat_gt`.

Prove `graham_ringrose_saving_kernel` (the numerical graham–ringrose saving factor). For real k≥0, q>0, t≥0 and
S, and natural r, if t≤q^(1/2) and S≤2k(t/q)^(2^(−r)), then S≤2k/q^(2^(−r−1)). This is a numerical implication;
an analytic estimate for a character sum is not a conclusion. ([Bennett–Siksek](#bennettsiksek2020), §8.1, Case
1, printed p.378, divisor-factor saving and the final c₃ calculation.)

k,q,t,S are real; k≥0; q>0; t≥0; r is natural. The nested exponent 2^(−r) is a real power, not natural
subtraction.

*Needs:* Mathlib `Real.rpow_le_rpow`; Mathlib `Real.rpow_pos_of_pos`; Mathlib `Real.rpow_mul`; Mathlib
`Real.rpow_sub`; Mathlib `Real.rpow_neg`.

Prove `large_conductor_denominator_conversion` (converting the modulus saving to the interval scale). For real
k>0, q≥k^(7/32), S, and natural r, the bound S≤2k/q^(2^(−r−1)) implies S≤2k^(1−(7/32)2^(−r−1)).
([Bennett–Siksek](#bennettsiksek2020), §8.1, Case 1, printed p.378, divisor-factor saving and the final c₃
calculation.)

All bases are positive: k>0 and q≥k^(7/32)>0; r is natural.

*Needs:* Mathlib `Real.rpow_le_rpow`; Mathlib `Real.rpow_mul`; Mathlib `Real.rpow_sub`.

Prove `large_conductor_exponent_margin` (margin above bennett–siksek’s stated exponent). For c>0 and natural
r<10c+2, put γ=2^(−10c−6) and d=(7/32)2^(−r−1). Then d>(7/4)γ. In particular the exponent margin d−γ exceeds
(3/4)γ>0. ([Bennett–Siksek](#bennettsiksek2020), §8.1, Case 1, printed p.378, divisor-factor saving and the
final c₃ calculation.)

c is real and positive; r is natural with its stated strict real upper bound; γ and d are explicit real
expressions.

*Needs:* Mathlib `Real.rpow_lt_rpow_of_exponent_lt`; Mathlib `Real.rpow_add`; Mathlib `Real.rpow_pos_of_pos`.

Prove `large_conductor_constant_absorption` (absorbing the remaining factor two). For real k≥1, γ>0, d≥(7/4)γ
and S≤2k^(1−d), if k≥2^(4/(3γ)), then S≤k^(1−γ). ([Bennett–Siksek](#bennettsiksek2020), §8.1, Case 1, printed
p.378, divisor-factor saving and the final c₃ calculation.)

The threshold is non-strict; the bases and exponent γ are positive. No character or modulus hypothesis is needed
in this numerical lemma.

*Needs:* Mathlib `Real.rpow_le_rpow`; Mathlib `Real.rpow_mul`; Mathlib `Real.rpow_add`; Mathlib
`Real.rpow_le_rpow_of_exponent_le`.

Prove `large_conductor_numeric_threshold` (uniform conditional large-conductor cancellation). For every c>0, put
γ=2^(−10c−6). There exists a natural K≥2 such that for all natural k≥K, q>0 and r<10c+2 with k^(7/32)≤q, and
every real S satisfying S≤2k(τ(q)^(r²)/q)^(2^(−r)), one has S≤k^(1−γ). The analytic inequality for S is an
explicit premise, not a proved character-sum estimate. ([Bennett–Siksek](#bennettsiksek2020), §8.1, Case 1,
printed p.378, divisor-factor saving and the final c₃ calculation.)

Natural k,q,r; c>0; q>0; the displayed lower bound and factor-count bound. S is real; γ is local notation.

*Needs:* Layer 1 `large_conductor_eventual_divisor_saving`; Layer 1 `graham_ringrose_saving_kernel`; Layer 1
`large_conductor_denominator_conversion`; Layer 1 `large_conductor_exponent_margin`; Layer 1
`large_conductor_constant_absorption`; Mathlib `exists_nat_ge`; Mathlib `Real.rpow_pos_of_pos`.

### 1.9 Finite interval correlations

Define `intervalCorrelation` (finite interval correlation). For A∈ℤ, N∈ℕ, b:ℤ→ℂ and t∈ℤ define
intervalCorrelation(A,N,b,t)=Σ_{n∈(A,A+N]} b(n+t) conjugate(b(n)). This finite expression is defined without a
support hypothesis. Its autocorrelation identities require b to vanish outside (A,A+N]. No cyclic wraparound is
used. ([Polymath](#polymath2014), Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging
through (4-23).)

A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and
H−h are natural subtraction. The second factor, not the shifted first factor, is conjugated.

The basic API consists of the following statements.

- `intervalCorrelation_empty`: intervalCorrelation(A,0,b,t)=0 for arbitrary A,b,t.
- `interval_correlation_zero`: C(0) is the real energy Σ_{n∈I}‖b(n)‖², cast into ℂ.
- `interval_correlation_neg`: If b vanishes outside I, then C(−t)=conjugate(C(t)).
- `interval_correlation_vanish`: If b vanishes outside I and N≤|t|, then C(t)=0.
- `intervalCorrelation_scale`: For z∈ℂ, intervalCorrelation(A,N,z b,t)=‖z‖² intervalCorrelation(A,N,b,t). No
  support hypothesis is needed.
- `intervalCorrelation_translate`: For s∈ℤ, intervalCorrelation(A−s,N,n↦b(n+s),t)=intervalCorrelation(A,N,b,t). No
  support hypothesis is needed.

**Checks.**

- For arbitrary b and t, intervalCorrelation(−3,0,b,t)=0.
- For b(1)=1,b(2)=i and b zero elsewhere, intervalCorrelation(0,2,b,0)=2.
- For that b, intervalCorrelation(0,2,b,1)=i, not −i or 1.
- For that b, intervalCorrelation(0,2,b,−1)=−i.
- For that b, intervalCorrelation(0,2,b,2)=0, not 2.
- For b(−1)=i and b zero elsewhere, intervalCorrelation(−2,1,b,0)=1.

*Needs:* Mathlib `Int.card_Ioc`; Mathlib `Complex.mul_conj'`.

Prove `interval_correlation_zero` (zero-lag correlation energy). For arbitrary A,N,b,
intervalCorrelation(A,N,b,0)=(Σ_{n∈I}‖b(n)‖²:ℝ), cast into ℂ. In particular its imaginary part is zero and its
real part is nonnegative. ([Polymath](#polymath2014), Proof of Proposition 4.12(ii), printed pp.2108–2109,
translation averaging through (4-23).)

A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and
H−h are natural subtraction. No support hypothesis is required.

*Needs:* Layer 1 `intervalCorrelation`; Mathlib `Complex.mul_conj'`.

Prove `interval_correlation_neg` (hermitian correlation symmetry). If b vanishes outside I, then
intervalCorrelation(A,N,b,−t)=conjugate(intervalCorrelation(A,N,b,t)) for every integer t.
([Polymath](#polymath2014), Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through
(4-23).)

A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and
H−h are natural subtraction. b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness,
multiplicativity or modulus factorization is required.

*Needs:* Layer 1 `intervalCorrelation`; Mathlib `Finset.prod_bij`; Mathlib `Finset.prod_subset`.

Prove `interval_correlation_vanish` (disjoint-shift correlation vanishing). If b vanishes outside I and N≤|t|,
then intervalCorrelation(A,N,b,t)=0. ([Polymath](#polymath2014), Proof of Proposition 4.12(ii), printed
pp.2108–2109, translation averaging through (4-23).)

A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and
H−h are natural subtraction. b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness,
multiplicativity or modulus factorization is required.

*Needs:* Layer 1 `intervalCorrelation`.

Prove `shift_support_envelope` (support of the averaged shifts). Assume H>0 and b vanishes outside I. If k<H and
n∉J, then b(n+kr)=0. Thus every shift in 0,…,H−1 is supported in J, whose cardinality is exactly W=N+(H−1)r.
([Polymath](#polymath2014), Proof of Proposition 4.12(ii), printed pp.2108–2109, translation averaging through
(4-23).)

A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and
H−h are natural subtraction. b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness,
multiplicativity or modulus factorization is required. H>0; r≥0 by its natural type.

*Needs:* Mathlib `Int.card_Ioc`.

Prove `supported_shift_sum` (translation of a supported finite sum). For H>0, k<H and any f:ℤ→ℂ vanishing
outside I, Σ_{n∈J} f(n+kr)=Σ_{m∈I} f(m). ([Polymath](#polymath2014), Proof of Proposition 4.12(ii), printed
pp.2108–2109, translation averaging through (4-23).)

A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and
H−h are natural subtraction. b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness,
multiplicativity or modulus factorization is required. The support hypothesis applies to f; b is not used in
this lemma. H>0 and k<H.

*Needs:* Layer 1 `shift_support_envelope`; Mathlib `Finset.prod_bij`; Mathlib `Finset.prod_subset`.

Prove `periodic_shift_averaging` (periodic-factor shift averaging). Let a:ℤ→ℂ satisfy a(n+r)=a(n) for every
integer n, let b vanish outside I and let H>0. Set S=Σ_{n∈I}a(n)b(n). Then H S=Σ_{n∈J} a(n)(Σ_{k=0}^{H−1}
b(n+kr)), with H cast into ℂ. ([Polymath](#polymath2014), Proof of Proposition 4.12(ii), printed pp.2108–2109,
translation averaging through (4-23).)

A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and
H−h are natural subtraction. b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness,
multiplicativity or modulus factorization is required. Function.Periodic a r; H>0. No bound on a or b is
required for this identity.

*Needs:* Layer 1 `supported_shift_sum`; Mathlib `Function.Periodic.nat_mul`.

Prove `shift_pair_correlation` (shift-pair correlation reindexing). Let H>0, k,l<H and b vanish outside I. Then
Σ_{n∈J} b(n+kr) conjugate(b(n+lr))=intervalCorrelation(A,N,b,(k−l)r), where k−l is computed in ℤ, not by natural
subtraction. ([Polymath](#polymath2014), Proof of Proposition 4.12(ii), printed pp.2108–2109, translation
averaging through (4-23).)

A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and
H−h are natural subtraction. b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness,
multiplicativity or modulus factorization is required. H>0; k,l<H.

*Needs:* Layer 1 `intervalCorrelation`; Layer 1 `supported_shift_sum`.

Prove `shift_pair_lag_count` (multiplicity of ordered shift differences). For every natural H and every F:ℤ→ℂ,
Σ_{k=0}^{H−1}Σ_{l=0}^{H−1} F(k−l)=H F(0)+Σ_{h=1}^{H−1}(H−h)(F(h)+F(−h)), with differences in ℤ and
multiplicities cast into ℂ. ([Polymath](#polymath2014), Proof of Proposition 4.12(ii), printed pp.2108–2109,
translation averaging through (4-23).)

H∈ℕ may be zero. The positive-lag sum is over the natural interval [1,H).

*Needs:* Mathlib `Finset.prod_bij`.

Prove `shift_energy_expansion` (energy of the averaged shifts). For H>0 and b supported in I,
Σ_{n∈J}‖Σ_{k=0}^{H−1} b(n+kr)‖²=H D+2Σ_{h=1}^{H−1}(H−h) Re C(hr), where D=Σ_{n∈I}‖b(n)‖² and
C(t)=intervalCorrelation(A,N,b,t). ([Polymath](#polymath2014), Proof of Proposition 4.12(ii), printed
pp.2108–2109, translation averaging through (4-23).)

A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and
H−h are natural subtraction. b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness,
multiplicativity or modulus factorization is required. H>0. The right side is real; individual Re C(hr) may be
negative.

*Needs:* Layer 1 `shift_pair_correlation`; Layer 1 `shift_pair_lag_count`; Layer 1 `interval_correlation_neg`;
Layer 1 `interval_correlation_zero`; Mathlib `Complex.mul_conj'`; Mathlib `Finset.sum_mul_sum`.

Prove `q_vdc_energy_bound` (finite q–van der corput energy bound). Let H>0, a be r-periodic with ‖a(n)‖≤1 for
every integer n, and b vanish outside I. Then H²‖Σ_{n∈I}a(n)b(n)‖²≤W Σ_{n∈J}‖Σ_{k=0}^{H−1}b(n+kr)‖², where
W=N+(H−1)r. ([Polymath](#polymath2014), Proof of Proposition 4.12(ii), printed pp.2108–2109, translation
averaging through (4-23).)

A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and
H−h are natural subtraction. b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness,
multiplicativity or modulus factorization is required. H>0; a is r-periodic and bounded in norm by one.

*Needs:* Layer 1 `periodic_shift_averaging`; Layer 1 `shift_support_envelope`; Mathlib `norm_sum_le`; Mathlib
`Finset.sum_mul_sq_le_sq_mul_sq`.

Prove `q_vdc_lag_bound` (finite q–van der corput lag bound). Under q-vdc-energy-bound's hypotheses,
H²‖Σ_{n∈I}a(n)b(n)‖²≤W(H D+2Σ_{h=1}^{H−1}(H−h)‖C(hr)‖), where D=Σ_{n∈I}‖b(n)‖²,
C(t)=intervalCorrelation(A,N,b,t), and W=N+(H−1)r. ([Polymath](#polymath2014), Proof of Proposition 4.12(ii),
printed pp.2108–2109, translation averaging through (4-23).)

A∈ℤ; N,r,H∈ℕ. I=(A,A+N]∩ℤ. When H>0, J=(A−(H−1)r,A+N]∩ℤ and W=N+(H−1)r. All interval sums are finite; H−1 and
H−h are natural subtraction. b:ℤ→ℂ vanishes outside I whenever the support hypothesis is stated. No smoothness,
multiplicativity or modulus factorization is required. H>0; a is r-periodic and bounded in norm by one.

*Needs:* Layer 1 `q_vdc_energy_bound`; Layer 1 `shift_energy_expansion`; Mathlib `Complex.re_le_norm`.

Prove `q_vdc_uniform_correlation` (one-step q–van der corput estimate). Suppose 1≤r≤N, a:ℤ→ℂ is r-periodic,
‖a(n)‖≤1, b vanishes outside I=(A,A+N], and ‖b(n)‖≤1 for n∈I. Put H=N div r. If T≥0 and
‖intervalCorrelation(A,N,b,hr)‖≤T for every natural 1≤h<H, then ‖Σ_{n∈I}a(n)b(n)‖²≤4Nr+2NT. All terms in this
inequality are real casts; div is natural floor division. ([Polymath](#polymath2014), Proof of Proposition
4.12(ii), printed pp.2108–2110, K=⌊N/r⌋ and (4-22)–(4-24).)

A∈ℤ; N,r∈ℕ with 1≤r≤N; T∈ℝ with T≥0. The correlation assumption retains the zero-extended finite interval; it is
not a complete sum or a periodic wraparound correlation.

*Needs:* Layer 1 `q_vdc_lag_bound`; Mathlib `Int.card_Ioc`; Mathlib `Finset.sum_range_id_mul_two`.

### 1.10 Polar forms and function-field differencing

Define `polarForm` (polar forms). For a commutative ring R, n,r≥0, a tensor c indexed by (r+1)-tuples of n
coordinate indices, and r vectors u, define polarForm(c,u)_j=(r+1)!Σ_{a∈(Fin n)^r}c(a₁,…,a_r,j)∏_{t=1}^r
u^(t)_{a_t}. For a symmetric tensor of a degree-k homogeneous form, r=k−1. Over characteristic p>k the factorial
is a unit; it must not be cancelled in characteristic dividing k!. ([Browning–Sawin](#browningsawin2020), §5
p.932 and §6 p.936, definition of Ψ_j.)

The basic API consists of the following statements.

- `polarForm_zero_tensor`: The zero coefficient tensor gives zero.
- `polarForm_add_slot`: Each vector slot is additive.
- `polarForm_smul_slot`: Multiplying a slot by a scalar multiplies the result by that scalar.
- `polarForm_diagonal`: For symmetric c of f₀ and k=r+1, the diagonal value is r! times ∂_j f₀.
- `polarForm_map`: A ring homomorphism commutes with polarForm on both coefficients and vectors.

**Checks.**

- For R=ℚ,n=1,r=2,c=1 and both vectors equal1, the value is6.
- The same cubic tensor with its first vector zero gives0.
- In F₃ the same tensor and unit vectors give0, so the factorial cannot be cancelled.

*Needs:* Mathlib `Finset.sum_mul`; Mathlib `Finset.prod_mul_distrib`.

Prove `multivariate_polarization` (top-degree polarization identity). Let k=r+1≥1, f=f₀+L with deg L≤r, and
f₀(X)=Σ_{a∈(Fin n)^k}c(a)∏_tX_{a_t} with symmetric c. For r vectors u, the r successive differences
Δ_{u¹}⋯Δ_{uʳ}f evaluated at x, minus their value at0, equal Σ_j polarForm(c,u)_j x_j. Lower-degree terms
contribute only a constant and disappear from this linear part. No factorial is inverted in this identity.
([Browning–Sawin](#browningsawin2020), §5, paragraph following Proposition5.5 p.932.)

*Needs:* Layer 1 `polarForm`; Mathlib `fwdDiff`.

Define `polarZeroLocus` (common polar-zero locus). polarZeroLocus(c) is the native set of r vector tuples u for
which polarForm(c,u)_j=0 for every j. It is the common zero set of n multihomogeneous polynomials, each degree1
in every vector block. For r≥1 the zero tuple belongs; equality with the diagonal singular locus uses the
polarization identity and invertibility of k!. ([Browning–Sawin](#browningsawin2020), §6 p.939, common Ψ_j-zero
variety used in Proposition6.2.)

The basic API consists of the following statements.

- `mem_polarZeroLocus`: Membership means all polar coordinates vanish.
- `polarZeroLocus_zero_tensor`: A zero tensor gives the whole space.
- `zero_mem_polarZeroLocus`: For r≥1 the zero tuple belongs.
- `polarZeroLocus_smul_slot`: Scalar multiplication in a single block preserves membership.

**Checks.**

- Over ℚ, n=1,r=2,c=1, the pair(1,1) does not belong.
- For the same tensor the pair(0,1) belongs.
- The zero tensor gives the whole tuple space.

*Needs:* Layer 1 `polarForm`.

Prove `function_field_top_phase` (top-degree coefficient phase). For a symmetric degree-k tensor c, coefficient
vectors a_{i,j} (0≤i<d), and α=Σ_{l=1}^{kd}b_lT^(−l), the degree-k part in a of [T^(−1)]αf(xT^d+Σ_{i<d}a_iT^i)
is Σ_{j₁,…,j_k}Σ_{i₁,…,i_k<d} c(j)b_{1+Σi_t}∏_ta_{i_t,j_t}. Lower-degree terms of f and fixed leading-vector
terms contribute only lower degree in a. The formula describes the top-degree part, not the whole phase.
([Browning–Sawin](#browningsawin2020), §6 p.935, G_b and F₀ displays.)

*Needs:* Layer 1 `multivariate_polarization`; Mathlib `Polynomial.coeff`.

Define `functionFieldPolarCount` (function-field differencing count). For finite F_q, tensor c of degree k=r+1,
b_l∈F_q, box cutoff D≥0 and coefficient cutoff C≥0, functionFieldPolarCount(c,b,D,C) counts arrays
a∈F_q^{r×n×D}. Write u^(t)_j=Σ_{i<D}a_{t,j,i}T^i. Admit a exactly when, for every j and 1≤l≤C, Σ_{v∈supp Ψ_j(u)}
b_{v+l}coeff_v(Ψ_j(u))=0. Thus the box is deg u<D and the fractional condition is ||αΨ_j(u)||<q^(−C), with both
boundaries strict. N=N(c,b,d,d) and N_s=N(c,b,d−s,d+rs). ([Browning–Sawin](#browningsawin2020), Lemma6.1 p.936;
definition of N_s p.938.)

The basic API consists of the following statements.

- `functionFieldPolarCount_zero_phase`: b=0 gives q^(rnD).
- `functionFieldPolarCount_no_constraints`: C=0 gives q^(rnD).
- `functionFieldPolarCount_zero_box`: For r≥1, D=0 gives1.
- `functionFieldPolarCount_pos`: For r≥1 the zero array shows the count is positive.
- `functionFieldPolarCount_cutoff_antitone`: Increasing C weakly decreases the count at fixed D.
- `functionFieldPolarCount_coefficients`: Its equations are precisely the first C negative Laurent coefficients of
  αΨ_j.

**Checks.**

- In F₅,n=1,r=2,D=C=1,c=1,b=0 the count is25.
- For the same parameters, b₁=1 and other b_l=0 gives9.
- For b₂=1 and other b_l=0, C=1 gives25 while C=2 gives9.
- For D=0,r≥1, the count is1 even with a nonzero phase.

*Needs:* Layer 1 `polarForm`; Mathlib `Polynomial.coeff`; Mathlib `Polynomial.support`; Mathlib `Fintype.card`.

Prove `function_field_count_identity` (differencing coefficient-count identity). Assume char F_q=p>k=r+1. For
the coefficient-space top-degree phase, its common polar equations indexed by (i,j),0≤i<d, are
k!Σ_{a,v}c(a,j)b_{1+i+Σv_t}∏_ta_{t,a_t,v_t}=0. Their number of F_q-solutions is
functionFieldPolarCount(c,b,d,d). Cancelling k! is valid only under p>k. ([Browning–Sawin](#browningsawin2020),
Lemma6.1 and complete proof p.936.)

*Needs:* Layer 1 `function_field_top_phase`; Layer 1 `functionFieldPolarCount`.

Prove `iterated_function_field_shrinking` (iterated multilinear shrinking). For symmetric c, char F_q>k=r+1≥3,
d≥0 and 0≤s≤d, N(c,b,d,d)≤q^(rns)N(c,b,d−s,d+rs). The multiplier is q^(rns); neither the tightened fractional
cutoff nor the changed box may be omitted. ([Browning–Sawin](#browningsawin2020), §6 after Lemma6.4 p.938.)

*Needs:* Layer 1 `functionFieldPolarCount`; Layer 1 `polarForm`.

Prove `short_polar_values_zero` (minor-arc exclusion forces polar values to vanish). Put L=kd, d≤m≤kd/2, r=k−1≥2
and s=d−floor(m/r). Suppose b lies outside the closed Hankel major arc A_m: equivalently there is no nonzero
polynomial h of degree≤m whose first L−m negative coefficients in αh vanish. Every tuple counted by
N(c,b,d−s,d+rs) then satisfies Ψ_j(u)=0 for every j. ([Browning–Sawin](#browningsawin2020), Proof of
Proposition6.2 pp.938–939; Lemma2.4(4) pp.903–904.)

*Needs:* Layer 1 `functionFieldPolarCount`.

Prove `polar_dimension_bound` (polar-zero dimension bound). Let char F_q>k≥3 and let the homogeneous leading
form f₀ define a smooth projective hypersurface. Then the common polar-zero scheme W⊆A^{n(k−1)} has dimension at
most n(k−2). More generally it suffices that its common diagonal polar zeros over an algebraic closure consist
only of0. The bound refers to geometric Krull dimension, not the number of rational zeros.
([Browning–Sawin](#browningsawin2020), Proof of Proposition6.2 p.939.)

*Needs:* Layer 1 `polarZeroLocus`; Layer 1 `multivariate_polarization`.

### 1.11 Classical polynomial Weyl bounds

Prove `polynomial_weyl_inequality` (polynomial weyl inequality). For every degree d≥2 and ε>0 there is C(d,ε)>0
such that for every real polynomial f of degree d, every integer a and positive q with gcd(|a|,q)=1 and
|leadingCoeff(f)−a/q|≤q^{−2}, and every N≥1,
|Σ_{m=1}^Nexp(2πif(m))|≤CN^{1+ε}(N^{−1}+q^{−1}+qN^{−d})^{1/2^{d−1}}. The constant is independent of the lower
coefficients, a,q,N and the leading coefficient subject to the approximation hypothesis.
([Assing](#assingcircle2022), Lemma5.1 and proof pp.28–31; Lemma5.2 and proof pp.31–32.)

The approximation is to the actual native leading coefficient. All powers with nonintegral exponents are real
rpow; positive N,q make divisions legitimate. This classical bound is distinct from the stronger VMV-driven
exponent1/[d(d−1)].

*Needs:* Mathlib `fwdDiff`; Mathlib `Complex.mul_conj'`; Mathlib `Finset.sum_mul_sum`; Mathlib
`Complex.norm_exp_ofReal_mul_I`; Mathlib `Int.card_Ioc`; Mathlib `Polynomial.fwdDiff_iter_degree_eq_factorial`;
Mathlib `Polynomial.natDegree`; Mathlib `Polynomial.leadingCoeff`; Mathlib `Polynomial.eval`; Mathlib
`Nat.divisors`; `AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound`; Mathlib `AddCircle.norm_eq`; Mathlib
`Real.log_pos`.

### Examples

- For `completePowerSum`, including x=0 makes the linear nontrivial sum zero, rather than−1.
- For `completePowerSum`, this monomial complete-sum adapter does not assume a Weil estimate for arbitrary
  composite q.
- For `complete_power_bound`, at prime p with gcd(d,p−1)=1 the complete sum is0 for a coprime to p.
- For `complete_power_bound`, the finitely many primes dividing d are included in C_d, not silently discarded.
- For `periodic_interval_remainder`, for f(n)=(0,1,−1) indexed by n mod 3, the interval (0,2] sums to zero and
  (1,2] sums to −1.
- For `periodic_interval_remainder`, when q divides B−A, the sum is zero for every starting point.
- For `periodic_interval_remainder`, for B<A, both sides are zero; no signed-interval convention is used.
- For `periodic_interval_norm`, the χ3 table on (1,2] has norm 1 and remainder length 1, so equality occurs.
- For `periodic_interval_norm`, a length-q interval has bound zero, not q.
- For `periodic_interval_norm`, scaling a nonzero zero-mean sequence by 2 can violate the bound: the pointwise
  hypothesis is essential.
- For `character_interval_bound`, the nonprincipal character modulo 3 has values (0,1,−1), and its (1,2] sum is
  −1.
- For `character_interval_bound`, the principal character modulo 3 sums to 8 on (0,12], exceeding q=3.
- For `character_interval_bound`, an imprimitive but nonprincipal character is allowed; conductor need not equal
  q.
- For `divisible_interval_reindex`, for f(n)=n, A=2,B=7,d=3, both sides sum 3+6=9.
- For `divisible_interval_reindex`, for A=3,B=6,d=3, only m=6 survives; including the lower endpoint would wrongly
  add 3.
- For `divisible_interval_reindex`, for A=1,B=2,d=3 there are no terms; rounding an upper endpoint upward gives a
  wrong term.
- For `coprime_moebius_expansion`, m=1 retains every term, since its only divisor is 1 with μ(1)=1.
- For `coprime_moebius_expansion`, for M=4, μ(4)=0 and the expansion is still correct; squarefreeness is not
  needed.
- For `coprime_moebius_expansion`, m=0 is excluded: its library divisor set is empty, but the interval containing
  m=1 can have a nonzero coprime contribution.
- For `character_exclusion_expansion`, for χ3, M=2 and interval (0,2], the excluded sum is 1, not the unrestricted
  sum zero.
- For `character_exclusion_expansion`, for χ3 and M=3, divisors containing 3 contribute χ(3)=0; no coprimality
  hypothesis between q and M is required.
- For `character_exclusion_expansion`, replacing M=2 by M=4 leaves the coprimality filter unchanged; μ(4)=0 makes
  the divisor expression compatible.
- For `character_exclusion_bound`, m=1 gives the ordinary bound q, since τ(1)=1.
- For `character_exclusion_bound`, for M=6 there are four divisor terms and the stated upper bound is 4q, not 2q.
- For `character_exclusion_bound`, τ(120)=16; the estimate makes no use of a false all-q logarithmic upper bound
  for τ.
- For `exclusion_complete_period`, for χ3 and M=2, the interval (0,6] contributes 1−1=0.
- For `exclusion_complete_period`, for M=1 this is the usual complete-period cancellation.
- For `exclusion_complete_period`, for χ3 and M=3 the interval (0,9] also sums to zero, despite shared prime
  factors.
- For `exclusion_direct_period_bound`, for χ3 and M=4, the bound is 12 although the masked sequence already has
  period 6; least-period minimality is not claimed.
- For `exclusion_direct_period_bound`, m=1 returns the ordinary q bound.
- For `exclusion_direct_period_bound`, the character identity χ8χ−8=χ−4 has ambient lcm 8 but primitive conductor
  4; period and conductor cannot be conflated.
- For `small_conductor_power_saving`, the exact exponent identity is 7/32+1/64+17/64=1/2.
- For `small_conductor_power_saving`, for odd k=7 the index interval begins after floor(7/2)=3, so it contains
  4,5,6,7.
- For `small_conductor_power_saving`, neither c=0 nor deletion of the lower-threshold condition is permitted; the
  reciprocal exponent and constant absorption need the stated hypotheses.
- For `character_exclusion_explicit_subpower_bound`, the same constant works for every character and both
  endpoints.
- For `character_exclusion_explicit_subpower_bound`, m=1 yields the coarser D^B q bound; the original sharper q
  theorem is retained.
- For `character_exclusion_explicit_subpower_bound`, shared prime factors of q,M and nonsquarefree M remain
  allowed.
- For `small_conductor_explicit_threshold`, equality at the threshold is permitted.
- For `small_conductor_explicit_threshold`, for C≥1 the size condition cannot hold at k=1; dropping it is
  detectable.
- For `small_conductor_explicit_threshold`, b may be any certified integer upper bound, so exact real ceilings are
  not required.
- For `eventual_small_conductor_power_saving`, the quantifier order is ∀c>0 ∃K ∀k,q,χ,M; separate thresholds per
  character are weaker.
- For `eventual_small_conductor_power_saving`, at c=1/64 the imported exponent is exactly1.
- For `eventual_small_conductor_power_saving`, this is only the small-conductor branch; it does not assert the
  full product-character proposition.
- For `ambient_product_evaluation`, do not apply the coprime change-level formula at a nonunit.
- For `ambient_product_evaluation`, distinct characters of equal modulus are allowed.
- For `primitive_exclusion_coprime`, m=8,q=4 gives R=1.
- For `primitive_exclusion_coprime`, m=q=1 has an empty excluded-prime set and satisfies the result.
- For `primitive_exclusion_period_divides`, the 2-adic example gives strict divisibility 4|8.
- For `primitive_exclusion_period_divides`, for the principal character modulo 12, qR=6|12.
- For `primitive_exclusion_evaluation`, at M=15,q=5 the mask must remove multiples of 3 even when η is nonzero
  there.
- For `primitive_exclusion_evaluation`, at M=12 for the principal character, η is the character modulo 1 and R=6;
  the masked identity includes a=0.
- For `primitive_exclusion_evaluation`, the formula is valid for R=1; do not require a nonempty principal-factor
  family.
- For `cancelled_prime_common_support`, do not infer the claim merely from q dividing M; the reverse conductor
  bounds are essential.
- For `cancelled_prime_common_support`, the imprimitive principal modulo 8 paired with modulo 1 is a
  counterexample without primitivity.
- For `cancelled_prime_common_support`, r is bounded by either original modulus, not merely by their product.
- For `primitive_product_quadratic`, the diagonal product may become principal and is still quadratic.
- For `primitive_product_quadratic`, primitivity of η is already primitive_mul_isPrimitive; do not introduce a new
  existence theorem.
- For `primitive_product_nonprincipal`, equal primitive inputs give a principal product and must be excluded.
- For `primitive_product_nonprincipal`, distinct conjugate order-three characters modulo 7 have principal product;
  distinctness without quadraticity is insufficient.
- For `primitive_product_nonprincipal`, the χ8,χ−8 example has equal moduli and different character values, so
  distinct-modulus hypotheses would be too restrictive.
- For `small_conductor_product_cancellation`, preserve the quantifier order ∀c>0 ∃K ∀k,N1,N2,χ1,χ2.
- For `small_conductor_product_cancellation`, the strict source Case 2 condition implies the stated non-strict
  bound; equality at the conductor threshold is harmless.
- For `small_conductor_product_cancellation`, r=1 needs no exceptional case. Equal inputs fail the nonprincipal
  reduction.
- For `smooth_divisor_window`, t = 3, N = 30 permits d = 6; primality of the selected block is not required.
- For `smooth_divisor_window`, t = 5, N = 6 permits d = N, illustrating the final induction branch.
- For `smooth_divisor_window`, t = 3, N = 11 has no divisor in [3,9]; the bound on prime factors cannot be
  dropped.
- For `squarefree_modulus_blocks`, t = 3, N = 210: B = [3,5,7], u = 2 satisfies all assertions.
- For `squarefree_modulus_blocks`, t = 8, N = 1: the list is empty and u = 1. No nonempty-family convention is
  imposed.
- For `squarefree_modulus_blocks`, n = 36, T = 3 can yield [3,3,4] by unrestricted repeated extraction; pairwise
  coprimality fails without squarefreeness.
- For `bounded_crt_modulus_blocks`, t = 8, a = 4, Q = 11, R = 3 gives q::B = [11,4,3]. Both residual blocks are
  small: an r−1 large-block count would be false.
- For `bounded_crt_modulus_blocks`, t = 8, a = 1, Q = 105, R = 1 permits [15,7]; the principal family contributes
  no factor.
- For `bounded_crt_modulus_blocks`, t = 8, a = 1, Q = 11, R = 1 permits the one-factor list [11]. Empty maxima in
  the analytic threshold must then be handled by the distinguished q term alone.
- For `bounded_crt_modulus_blocks`, a residual au = 8·7 = 56 at T = 8 lies below T² = 64; retaining the bounded a
  in a separate extra small block would lose the sharp two-exception count.
- For `bounded_factor_count`, for r ≤ 2 the result is consistent even if all factors are exceptional.
- For `bounded_factor_count`, the coefficient is 64/7, not 32/7, because the ambient product bound is k^(2c).
- For `bounded_factor_count`, three small factors cannot be allowed: take k = 2³², c = 3/64, and q₁=q₂=q₃=2. The
  product is k^(2c)=8, but 3 < 10c+2 is false.
- For `graham_ringrose_interval_threshold`, at k = 2⁶⁴ the second comparison is equality, so the strict threshold
  cannot be weakened to k ≥ 2⁶⁴.
- For `graham_ringrose_interval_threshold`, at k = 2¹²⁸ the comparison is 2¹²⁶ < 2¹²⁷.
- For `graham_ringrose_interval_threshold`, l = 0 retains the q^(1/4) term for a one-factor decomposition; an
  undefined empty maximum is not used.
- For `crtCharacterEquiv`, an empty family reconstructs the unique character modulo one, whose value is one even
  at zero.
- For `crtCharacterEquiv`, a singleton family recovers its input character; at moduli 3 and 4 the principal family
  reconstructs a character zero at 2 and one at −1.
- For `crt_inverse_product`, empty product is the principal character modulo one.
- For `crt_inverse_product`, the right side is a product after all factors are lifted to N, not the mixed-level
  binary mul constructor.
- For `crt_integer_evaluation`, principal modulo 12 vanishes at 2, so reconstruction must retain nonunit zeros.
- For `crt_integer_evaluation`, the formula applies at z=0 and z=−1; N=1 gives value one at both.
- For `crt_primitive_family`, the empty family is primitive at level one.
- For `crt_primitive_family`, primitivity at level one does not require nonprincipality.
- For `crt_primitive_family`, without coprimality, squaring a nonprincipal quadratic character gives a principal
  product; the conclusion fails.
- For `crt_product_conductor`, a principal family has product conductor one regardless of its ambient moduli.
- For `crt_product_conductor`, a mixture of a primitive factor modulo 4 and a principal factor modulo 3 has
  conductor 4 and ambient level 12.
- For `crt_component_conductor`, at ambient level 12 and conductor 4, the mod-3 factor is principal and the mod-4
  factor primitive.
- For `crt_component_conductor`, a principal character at a block of size greater than one is not primitive there.
- For `crt_quadratic_components`, a principal component satisfies this predicate.
- For `crt_quadratic_components`, no claim that all components are nonprincipal or have exact order two is made.
- For `change_level_exclusion`, r=1 gives equality at every integer, including nonunits modulo D.
- For `change_level_exclusion`, repeated prime factors in R do not change the mask; coprimality of D and R is
  unnecessary.
- For `bounded_crt_character_factors`, for a=4,Q=11,R=1,T=8, use moduli (11,4); both factors of a primitive η
  modulo 44 are primitive and the principal family is empty.
- For `bounded_crt_character_factors`, for a=4,Q=11,R=3,T=8, moduli (11,4,3) exhibit two small blocks; the mod-3
  factor is principal and the mod-11 factor primitive.
- For `bounded_crt_character_factors`, a singleton family has r=0; its maximum over the other moduli is the empty
  maximum zero in the endpoint below.
- For `large_conductor_character_blocks`, for σ=χ₁.mul χ₂ at M=lcm(N₁,N₂), the earlier ambient-product-evaluation
  and primitive-product-quadratic arguments give the source summand and quadraticity; M≤N₁N₂≤k^(2c), so the
  statement supplies Case 1 factors without assuming M=D R.
- For `large_conductor_character_blocks`, the source has r factors; this signature uses Fin(r+1), so its count is
  r+1 throughout.
- For `large_conductor_character_blocks`, singleton factors use L=0. Empty principal families and conductor
  shrinkage at 2 remain valid.
- For `large_conductor_character_blocks`, the strict k>2⁶⁴ threshold is retained; equality would only give R₀≤k/2
  from the inherited scalar bound.
- For `bounded_divisor_power`, at R=1 and r=0 the left side is one, which is still bounded.
- For `bounded_divisor_power`, the restriction R≥1 prevents a zero denominator in the selected exponent.
- For `large_conductor_divisor_saving`, at q=1 the asserted strict saving would read 1<1 and is false.
- For `large_conductor_divisor_saving`, the arithmetic boundary C=2,R=r=1,q=16,t=4 satisfies t=Cq^(1/4), C^4=q and
  t=q^(1/2); it rules out strict absorption from a non-strict threshold.
- For `large_conductor_explicit_divisor_threshold`, for R=1 the AN exponent is 1/4 and the B cutoff is exp 4.
- For `large_conductor_explicit_divisor_threshold`, the reciprocal exponent product (32/7)(7/32)=1 is exact; the
  lower modulus bound is essential.
- For `large_conductor_eventual_divisor_saving`, for c=1 one may choose R=12 because r<12 implies r≤12.
- For `large_conductor_eventual_divisor_saving`, replacing the family by unbounded r is invalid even at a fixed
  positive q>1.
- For `graham_ringrose_saving_kernel`, at r=1 the resulting denominator exponent is 1/4, not 1/2.
- For `graham_ringrose_saving_kernel`, at k=0 the implication preserves the upper bound S≤0.
- For `large_conductor_denominator_conversion`, the factor 7/32 remains in the exponent; omitting it gives a
  stronger unsupported saving.
- For `large_conductor_exponent_margin`, for c=1 and r=11, γ=2^(−16) and d=7·2^(−17)=(7/2)γ.
- For `large_conductor_exponent_margin`, if the excluded boundary r=10c+2 is integral, the displayed comparison
  becomes equality d=(7/4)γ, so strictness uses the strict factor count.
- For `large_conductor_constant_absorption`, at γ=1/4, d=7/16 and k=2^(16/3), the absorption comparison is
  equality.
- For `large_conductor_constant_absorption`, at k=1 and S=2, the conclusion S≤1 fails if the threshold is removed.
- For `large_conductor_numeric_threshold`, the statement keeps q and r universally quantified after K, expressing
  uniformity.
- For `large_conductor_numeric_threshold`, there is no assertion that every nonnegative S satisfies the
  analytic-size premise.
- For `intervalCorrelation`, for b(1)=1,b(2)=i and b zero elsewhere, C(1)=i and C(−1)=−i.
- For `intervalCorrelation`, n=0 gives zero for all b and shifts.
- For `interval_correlation_zero`, b(1)=i on I={1} gives energy one; the unconjugated square would be −1.
- For `interval_correlation_neg`, for the two-point values (1,i), the lags 1 and −1 are i and −i.
- For `interval_correlation_neg`, without support, take I={1}, b(1)=b(2)=1,b(0)=0: C(1)=1 but C(−1)=0.
- For `interval_correlation_vanish`, at |t|=N the correlation is already zero.
- For `interval_correlation_vanish`, n=1 and t=0 is not a vanishing case for a nonzero singleton.
- For `shift_support_envelope`, n=2,r=3,H=2 gives J=(A−3,A+2] with five points, although the two shifted supports
  are disjoint.
- For `shift_support_envelope`, h=1 gives J=I; r=0 also gives J=I.
- For `shift_support_envelope`, for N=0 all shifted values vanish even if J is nonempty.
- For `supported_shift_sum`, for f supported only at A+1, the term with k=H−1 is at the leftmost permitted integer
  A+1−(H−1)r.
- For `supported_shift_sum`, using I instead of J loses translated terms at the boundary.
- For `periodic_shift_averaging`, r=0 is permitted and gives repeated identical shifts.
- For `periodic_shift_averaging`, h=1 is the original sum; H=0 is excluded from this averaging contract.
- For `shift_pair_correlation`, k=0,l=1 produces the negative lag −r.
- For `shift_pair_correlation`, at k=l the equality recovers diagonal energy.
- For `shift_pair_lag_count`, h=0 gives zero; H=1 gives F(0).
- For `shift_pair_lag_count`, h=3 gives 3F(0)+2(F(1)+F(−1))+F(2)+F(−2).
- For `shift_energy_expansion`, for b=1 on an interval of N=2, r=1,H=2, energy is 6, not the diagonal-only value
  4.
- For `shift_energy_expansion`, for b values (1,−1), N=2,r=1,H=2, energy is 2, so the real parts cannot be
  replaced by norms inside this equality.
- For `q_vdc_energy_bound`, h=1 reduces to the interval Cauchy–Schwarz bound.
- For `q_vdc_energy_bound`, n=0 has S=0 and zero energy, even when W>0.
- For `q_vdc_energy_bound`, the hypothesis on a cannot be omitted: a=2,b supported at one point,H=N=1 gives 4≤1
  falsely.
- For `q_vdc_lag_bound`, the coefficient of positive-lag norms is two and their multiplicity is H−h.
- For `q_vdc_lag_bound`, for H=1 the off-diagonal sum is empty.
- For `q_vdc_lag_bound`, this estimates an arbitrary supported b; it does not assume b is a multiplicative
  character.
- For `q_vdc_uniform_correlation`, r=N gives H=1 and an empty correlation premise; the non-sharp 4N² bound is
  valid.
- For `q_vdc_uniform_correlation`, for N=0 or r=0 the theorem is not invoked; those cases are already covered by
  the undivided energy bound.
- For `q_vdc_uniform_correlation`, in the Polymath application a is the r-periodic factor and b is the remaining
  factor multiplied by its supported weight. A separate bound for C(hr) is still needed; no Weil or
  Graham–Ringrose estimate is hidden in T.
- For `polynomial_weyl_inequality`, for rational leading coefficient with small denominator the estimate retains
  q^{−1}; no uniform cancellation is asserted at every phase.
- For `polynomial_weyl_inequality`, the d! product is included before grouping, and the root exponent
  is2^{−(d−1)}, not2^{−d}.

### Dependencies

Use the native Mathlib APIs listed at each target and the supplier contracts `AnalyticNumberTheory:AN.5`,
`ClassicalArithmeticCompletion:CA.1`, `FiniteFieldsAndCharacterSums:FF.1`, `FiniteFieldsAndCharacterSums:FF.2`.

The complete Graham–Ringrose and Burgess arguments are proof targets, rather than consequences of the quotations in Bennett–Siksek §8.1 or Friedlander–Iwaniec–Mazur–Rubin §9. Acquire the precise iterated character correlations specified above, including repeated-factor exceptions, and prove their passage to induced real characters with bounded two-adic conductor and ambient nonunit masks. The empty principal family, modulus one and a singleton distinguished factor are valid branches. For the cancellation proposition, prove an effective uniform threshold for the integer interval `(⌊k/2⌋,k]`, not only even endpoints.

For the derivative estimates, prove Kusmin–Landau with endpoint errors, the truncated Poisson formula on a finite interval, and quantitative finite-interval stationary phase under the derivative bounds used in the B process. Baier's abbreviated proof does not remove these obligations. Use the smooth Morse charts already supplied by Tau Ceti; prove Jacobian derivative bounds, compact-cutoff change of variables and the leading remainder here. Uniqueness of the stationary point is on the closed topological support. Tao's leading Fresnel term is used without adopting an uncorrected higher coefficient.

The symmetric lattice theorem and affine-dimension theorem in the supplier contracts are independent of these analytic consumers. Prove the explicit Laurent-coefficient correspondence before applying shrinking. The real symmetric-lattice estimate used later by Birch has different scalars and is not supplied by the function-field estimate.

## Layer 2: fourier counting and arc partitions

Use finite characters to express weighted equation counts as torus integrals, then extend to absolutely summable
weights. The same normalization gives the Vinogradov counting integral. Closed major arcs and their complements
form the exact partitions needed by the later Waring and prime arguments; the independent function-field branch
finishes its minor-count theorem.

### 2.1 Weighted coefficient extraction

Define `weightedTorusSum` (weighted torus exponential sum). For any finite subset A of a type ι, integral
frequency map Φ:ι→ℤⁿ and complex weights w:ι→ℂ, define weightedTorusSum(A,Φ,w)(α)=Σ_{a∈A} w(a)∏_{j∈Fin n}
fourier(Φ(a)ⱼ)(αⱼ), for α∈(ℝ/ℤ)ⁿ. All torus characters and probability Haar measures are the existing Mathlib
objects. No cyclic finite Fourier transform is redefined. ([Bourgain–Demeter–Guth](#bdg2016), §1 p.633 and
Theorem4.1 pp.637–638.)

n≥0 is natural; A is finite; no positivity or multiplicativity is assumed for w. Coordinates are indexed by Fin
n. Empty products equal one.

The basic API consists of the following statements.

- `weightedTorusSum_empty`: For A empty, weightedTorusSum is identically zero.
- `weightedTorusSum_singleton`: For A={a}, the value is w(a)∏ⱼfourier(Φ(a)ⱼ)(αⱼ).
- `weightedTorusSum_zero`: At α=0 the value is the sum of the weights.
- `weightedTorusSum_add_weights`: For weights u+v the sum is the sum of the two weighted torus sums.
- `weightedTorusSum_continuous`: The function of α is continuous, and hence integrable for the product probability
  Haar measure.
- `weightedTorusSum_integer_phase`: For a real lift x∈ℝⁿ, its value is Σ_a w(a)exp(2πi ΣⱼΦ(a)ⱼxⱼ), independent of
  the lift.
- `weightedTorusSum_zero_dimension`: For n=0 the function on the one-point torus is Σ_aw(a).

**Checks.**

- The empty set gives zero, not a constant one character.
- For n=1, A={0}, Φ(0)=−1, w(0)=2 and α=1/4, the value is −2i.
- For a singleton of weight one and frequency m in dimension one the function is the existing fourier(m).
- In dimension zero two weights 2 and −3 give value −1, not zero.

*Needs:* Mathlib `fourier`; Mathlib `fourier_coe_apply`; Mathlib `fourier_add`; Mathlib `fourier_neg`; Mathlib
`fourier_eval_zero`; Mathlib `fourier_zero`; Mathlib `AddCircle.haarAddCircle`; Mathlib
`MeasureTheory.Measure.pi`; Mathlib `Continuous.integrable_of_hasCompactSupport`.

Prove `torus_coefficient_extraction` (torus coefficient-counting identity). For the preceding A,Φ,w and b∈ℤⁿ,
the integral of weightedTorusSum(A,Φ,w)(α)∏ⱼfourier(−bⱼ)(αⱼ), with respect to the product probability Haar
measure, equals Σ_{a∈A,Φ(a)=b}w(a). The equality is complex-valued and exact; it requires neither a limiting
integral nor an asymptotic hypothesis. ([Bourgain–Demeter–Guth](#bdg2016), §1 p.633 and Theorem4.1 pp.637–638.)

All input sums are finite; product measure is ΠⱼhaarAddCircle at period one. Complex signed weights are allowed.

*Needs:* Layer 2 `weightedTorusSum`; Mathlib `fourierCoeff`; Mathlib `fourierCoeff_fourier`; Mathlib
`MeasureTheory.integral_fintype_prod_eq_prod`; Mathlib `MeasureTheory.Measure.pi`; Mathlib
`MeasureTheory.integral_finsetSum`.

Define `momentWeylSum` (moment-curve weyl sum). For n,N≥0 natural, momentWeylSum(n,N)(α)=Σ_{1≤m≤N}∏_{j∈Fin
n}fourier(m^(j+1))(αⱼ). It is weightedTorusSum on the positive natural interval with weights one and moment
frequencies m,m²,…,mⁿ. The exponent j+1 excludes an accidental constant-frequency coordinate; zero is not
included in the summation interval. ([Bourgain–Demeter–Guth](#bdg2016), §1 p.633; §5 p.639.)

The value is a complex function on the product of n copies of AddCircle(1). N=0 and n=0 are defined explicitly
by native empty-sum/product conventions.

The basic API consists of the following statements.

- `momentWeylSum_eq_weightedTorusSum`: The specialization of weightedTorusSum uses Φ(m)ⱼ=m^(j+1) and w(m)=1.
- `momentWeylSum_zero_cutoff`: For N=0 the function is zero.
- `momentWeylSum_zero_phase`: For α=0 its value is the natural N cast into ℂ.
- `momentWeylSum_zero_dimension`: For n=0 its value is N at the unique torus point.
- `momentWeylSum_real_lift`: For x∈ℝⁿ the value is Σ_{1≤m≤N}exp(2πi Σ_{j=1}ⁿxⱼmʲ).

**Checks.**

- For every n, N=0 gives zero.
- For n=2,N=3 and α=(0,0), the value is 3.
- For n=1,N=1 the function agrees with the existing frequency-one Fourier monomial.
- For n=1,N=2 and α=1/2 the sum is zero; adding m=0 would incorrectly give one.

*Needs:* Layer 2 `weightedTorusSum`; Mathlib `fourier`; Mathlib `fourier_coe_apply`; Mathlib `fourier_add`;
Mathlib `fourier_neg`; Mathlib `fourier_eval_zero`; Mathlib `fourier_zero`.

Define `vinogradovMeanValue` (vinogradov mean value). Define vinogradovMeanValue(n,s,N) as the number of ordered
pairs (x,y)∈{1,…,N}ˢ×{1,…,N}ˢ satisfying Σ_ixᵢʲ=Σ_iyᵢʲ for every j=1,…,n. Its carrier is the native finite
subtype of pairs of Fin s→Fin N maps, with entries interpreted as val+1. In particular n=0 imposes no equations
and s=0 has exactly the empty pair. No quotient by permutations is taken. ([Bourgain–Demeter–Guth](#bdg2016), §1
p.633, opening definition.)

n,s,N are natural. The main bound below requires n≥2 and s≥1, but the definition includes all boundary cases.

The basic API consists of the following statements.

- `vinogradovMeanValue_source_count`: For n≥2,s≥1,N≥2 this is exactly the published J_s,n(N).
- `vinogradovMeanValue_zero_variables`: For s=0, the count is 1 for every n,N.
- `vinogradovMeanValue_zero_degree`: For n=0 the count is N^(2s), with 0^0=1.
- `vinogradovMeanValue_one_variable`: For n≥1 and s=1 the count is N.
- `vinogradovMeanValue_one_cutoff`: For N=1 the count is 1 for every n,s.
- `vinogradovMeanValue_zero_cutoff`: For N=0 and s>0 the count is zero.
- `vinogradovMeanValue_mono_degree`: Increasing n can only decrease the count, for fixed s,N.

**Checks.**

- For n=2,s=2,N=2 the count is 6.
- For s=0 and N=0 the count is 1, not zero.
- For n≥1,s=1 the count equals the cardinality of [1,N].
- For n=2,s=3,N=2 the count is 20, the central binomial coefficient, not an unordered partition count.

*Needs:* Mathlib `Fintype.card`.

Prove `vinogradov_counting_integral` (vinogradov counting integral). For all natural n,s,N,
vinogradovMeanValue(n,s,N)=∫_{(ℝ/ℤ)ⁿ}‖momentWeylSum(n,N)(α)‖^(2s)dα. The left side is cast into ℝ, and dα is the
product of the native probability Haar measures. Ordered tuples, positive entries and all n moment equations
match exactly. ([Bourgain–Demeter–Guth](#bdg2016), §1 p.633, analytic representation.)

This finite identity also covers n=0,s=0 and N=0; the convention is 0⁰=1. No mean-value estimate is assumed.

*Needs:* Layer 2 `torus_coefficient_extraction`; Layer 2 `momentWeylSum`; Layer 2 `vinogradovMeanValue`; Mathlib
`fourier`; Mathlib `fourier_coe_apply`; Mathlib `fourier_add`; Mathlib `fourier_neg`; Mathlib
`fourier_eval_zero`; Mathlib `fourier_zero`; Mathlib `Fintype.card`; Mathlib `MeasureTheory.Measure.pi`; Mathlib
`MeasureTheory.integral_finsetSum`.

Define `powerWeylSum` (monomial weyl sum). powerWeylSum(d,N,α)=Σ_{x=1}^N fourier(x^d)(α) on native AddCircle1.
This is the single-frequency monomial sum, not the n-dimensional momentWeylSum, whose phase contains every
degree1..n. It is the specialization of weightedTorusSum to one coordinate and unit weights.
([Assing](#assingcircle2022), §6.1 pp.34–39, statements and full proofs.)

d,N are natural; α is a torus point. The empty positive interval N=0 gives zero, even at d=0. Degree-zero
nonempty phases are N times the frequency-one character.

The basic API consists of the following statements.

- `powerWeylSum_eq_sum`: The sum is over the positive native interval1..N with phase x^d.
- `powerWeylSum_zero_cutoff`: N=0 gives zero.
- `powerWeylSum_zero_phase`: At α=0 the value is N.
- `powerWeylSum_zero_degree`: At d=0 it is N fourier(1)(α).
- `powerWeylSum_conjugate`: Conjugation equals evaluation at−α.

**Checks.**

- For d=3,N=0,α=0 the sum is0, not1.
- For d=1,N=2,α=1/2 the sum is0.
- For d=3,N=4,α=0 the sum is4.
- For d=2,N=3 it agrees exactly with weightedTorusSum in dimension1 and phase x².

*Needs:* Layer 2 `weightedTorusSum`; Mathlib `fourier`; Mathlib `fourier_neg`; Mathlib `fourier_eval_zero`.

Define `mangoldtExponentialSum` (von mangoldt exponential sum). mangoldtExponentialSum(N,α)=Σ_{1≤n≤N}Λ(n)e(nα),
with native nonnegative real von Mangoldt coefficients. Prime powers remain in the sum; replacing it by an
unweighted prime sum requires its own partial-summation/error adapter. ([Tao, prime circle
method](#taoprimes2015), Introduction and §1 Proposition18.)

The basic API consists of the following statements.

- `mangoldtExponentialSum_zero`: N=0 gives0.
- `mangoldtExponentialSum_at_zero`: Atα=0 it is the sum ofΛ on1..N.
- `mangoldtExponentialSum_increment`: IncreasingN by1 addsΛ(N+1)e((N+1)α).
- `mangoldtExponentialSum_conj`: Negatingα conjugates the value.

**Checks.**

- N=0 gives0.
- N=4,α=0 gives2log2+log3, includingΛ(4)=log2.
- N=3,α=1/2 giveslog2−log3.

*Needs:* Layer 2 `weightedTorusSum`; Mathlib `ArithmeticFunction.vonMangoldt`.

Prove `summable_torus_counting` (summable weighted fourier extraction). For a countable typeA, integer phase map
Φ:A→ℤⁿ and summable complex weightsw, the uniformly absolutely convergent torus series
S(α)=Σ_aw(a)∏_je(Φ_j(a)α_j) is integrable on probability Haar measure, and its b-th Fourier coefficient is
Σ_{Φ(a)=b}w(a). Finite box cutoffs converge uniformly and in L¹. Gaussian/compact smoothing is an instance only
after the actual lattice weight is proved summable. ([Tao, prime circle method](#taoprimes2015), §1
equations(3)–(5), summable extension by absolute convergence.)

*Needs:* Layer 2 `torus_coefficient_extraction`; Mathlib `MeasureTheory.integral`; Mathlib `tprod`; Mathlib
`Multipliable`.

### 2.2 Reduced fractions and closed torus arcs

Define `reducedArcIndices` (reduced rational arc indices). For a natural denominator cutoff Q,
reducedArcIndices(Q) is the finite set of pairs (a,q) with 1≤q≤Q, 0≤a<q and gcd(a,q)=1. Use a filtered native
finite product. The pair (0,1) is the unique zero centre, representing the source fraction 1/1 modulo one. The
numerator q is excluded, and nonreduced presentations are not counted twice. ([Assing](#assingcircle2022), §6.1
p.34, Farey fractions and arc definitions.)

Q is natural, possibly zero. Both components are natural; a=0 is permitted only at q=1 by coprimality.

The basic API consists of the following statements.

- `mem_reducedArcIndices`: (a,q) is indexed iff 1≤q≤Q, a<q and Nat.Coprime a q.
- `reducedArcIndices_zero`: The zero cutoff gives the empty finite set.
- `reducedArcIndices_one`: The cutoff one gives {(0,1)}.
- `reducedArcIndices_mono`: Q≤R implies the Q index set is a subset of the R index set.

**Checks.**

- The cutoff zero has cardinality zero, not one.
- The cutoff one is {(0,1)}, not {(1,1)}.
- The cutoff three is {(0,1),(1,2),(1,3),(2,3)}.
- At cutoff four (1,2) is present and (2,4) is absent, matching reduced rational representatives.

*Needs:* Mathlib `Finset.product`; Mathlib `Finset.filter`.

Define `majorArc` (rational major arc). For a pair (a,q) of natural numbers and a real radius η,
majorArc((a,q),η) is the native closed metric ball of radius η about (a/q mod 1) in AddCircle(1). Only indices
in reducedArcIndices(Q) are used by the circle-method family. Definition at q=0 is totalized native division,
but no admissible index has q=0. Real lifts are all intervals [a/q+z−η,a/q+z+η], z∈ℤ.
([Assing](#assingcircle2022), §6.1 p.34, Farey fractions and arc definitions.)

No new torus, circle metric or arc carrier is introduced. η<0 gives the empty set; η≥1/2 gives the whole torus.
The analytical application uses 0≤η<1/2.

The basic API consists of the following statements.

- `mem_majorArc`: α belongs exactly when dist(α,a/q mod1)≤η.
- `majorArc_lift`: A real lift x belongs iff there is z∈ℤ with |x−a/q−z|≤η.
- `majorArc_negative`: If η<0 then the arc is empty.
- `majorArc_centre_mem`: For η≥0 the rational centre belongs.
- `majorArc_measurable`: The arc is closed, hence measurable for the torus Borel space.

**Checks.**

- The real lift 19/20 belongs to the zero arc of radius 1/10.
- The real lift 1/4 belongs to the zero closed arc of radius 1/4.
- A radius −1 arc is empty, including at its centre.
- Every arc is exactly Metric.closedBall at the corresponding native rational torus point.

*Needs:* Layer 2 `reducedArcIndices`; Mathlib `Metric.closedBall`; Mathlib `AddCircle.norm_eq`; Mathlib
`AddCircle.coe_real_preimage_closedBall_eq_iUnion`; Mathlib `dist_triangle`; Mathlib
`Metric.isClosed_closedBall`.

Define `majorArcs` (major arcs). majorArcs(Q,η) is the finite union of majorArc((a,q),η) over
reducedArcIndices(Q), as a native Set(AddCircle(1)). This definition alone neither asserts disjointness nor
prescribes a relation between Q and η. ([Assing](#assingcircle2022), §6.1 p.34, Farey fractions and arc
definitions.)

Q is natural; η is real. In the Waring application Q=⌊P^δ⌋ and η=P^(−d+δ), with P large and 0<δ<d/3 to make
2ηQ²<1.

The basic API consists of the following statements.

- `mem_majorArcs`: Membership is existence of an admissible reduced pair whose arc contains α.
- `majorArcs_zero`: majorArcs(0,η)=∅.
- `majorArcs_one`: majorArcs(1,η)=majorArc((0,1),η).
- `majorArcs_mono`: If Q≤R and η≤θ then majorArcs(Q,η)⊆majorArcs(R,θ).
- `majorArcs_measurable`: The union is closed and hence measurable.

**Checks.**

- Q=0 and η=1 gives an empty major set, not the full torus.
- At Q=1,η=1/10 the lift 19/20 belongs.
- At Q=2,η=0 the point 1/2 is present.
- The union over Q=3 is exactly the four native closed balls at 0,1/2,1/3,2/3.

*Needs:* Layer 2 `reducedArcIndices`; Layer 2 `majorArc`; Mathlib `Metric.closedBall`; Mathlib
`AddCircle.norm_eq`; Mathlib `AddCircle.coe_real_preimage_closedBall_eq_iUnion`; Mathlib `dist_triangle`;
Mathlib `Metric.isClosed_closedBall`.

Define `denominatorMajorArcs` (major arcs with denominator-dependent widths). denominatorMajorArcs(Q,η) is the
finite union of native closed torus balls majorArc((a,q),η/q) over reducedArcIndices(Q). Equivalently the
circular distance to a/q is at most η/q. The denominator is positive at every indexed pair. Its complement is
the minor domain for the optimized Waring estimates. ([Assing](#assingcircle2022), §9.1 p.83 and §9.2 p.89,
major-arc definitions for Proposition9.2 and Theorem9.9.)

Q is natural and η is real. For the optimized Waring application take Q=floor(N/(2k)) and η=N^(1−k)/(2k), with
integer N≥1 and k≥3.

The basic API consists of the following statements.

- `mem_denominatorMajorArcs`: Membership is existence of an indexed (a,q) with dist(α,a/q)≤η/q.
- `denominatorMajorArcs_zero`: At Q=0 the set is empty for every η.
- `denominatorMajorArcs_one`: At Q=1 it equals majorArc((0,1),η).
- `denominatorMajorArcs_mono`: If Q≤R and η≤θ then denominatorMajorArcs(Q,η)⊆denominatorMajorArcs(R,θ).
- `denominatorMajorArcs_negative`: For η<0 the set is empty.
- `denominatorMajorArcs_measurable`: The finite union is closed and measurable.

**Checks.**

- Q=0,η=1 gives the empty set.
- Q=1,η=1/10 contains the point with lift 19/20.
- Q=2,η=1/10 excludes the lift 23/40: its distance from 1/2 is3/40, exceeding η/2=1/20, and it is outside the zero
  arc.
- Q=2,η=0 contains 1/2.

*Needs:* Layer 2 `reducedArcIndices`; Layer 2 `majorArc`.

Define `minorArcs` (minor arcs). minorArcs(Q,η) is the native set complement of majorArcs(Q,η) in AddCircle(1).
In particular all major-arc boundary points are excluded from the minor set. No representative interval endpoint
is omitted from the underlying torus. ([Assing](#assingcircle2022), §6.1 p.34, Farey fractions and arc
definitions.)

The complement is taken in the entire period-one torus. Parameters are the same Q and η as in the major set.

The basic API consists of the following statements.

- `mem_minorArcs`: α is minor iff no admissible pair has dist(α,a/q mod1)≤η.
- `minorArcs_zero`: minorArcs(0,η)=Set.univ.
- `minorArcs_measurable`: The minor set is measurable, indeed open.
- `minorArcs_antitone`: If Q≤R and η≤θ then minorArcs(R,θ)⊆minorArcs(Q,η).

**Checks.**

- With Q=0, zero belongs to the minor set.
- At Q=1,η=0 zero is not minor.
- At Q=1,η=1/10 the point 1/2 is minor.
- At Q=1,η=1/4 the lift 1/4 belongs only to major arcs, matching the closed-ball convention.

*Needs:* Layer 2 `majorArcs`.

Prove `reduced_centre_separation` (reduced rational centre separation). For distinct reduced pairs (a,q),(b,r)
in reducedArcIndices(Q), their torus centres have distance at least 1/(qr), and hence at least 1/Q². In
particular the two centres are unequal. All divisions are real, and the positive denominators follow from
membership. ([Assing](#assingcircle2022), §6.1 p.34, Farey fractions and arc definitions.)

The pairs are distinct as ordered pairs and each is reduced with numerator in [0,denominator). Q≥1 follows from
nonempty membership.

*Needs:* Layer 2 `reducedArcIndices`; Mathlib `AddCircle.norm_eq`.

Prove `major_arcs_disjoint` (major-arc separation). If Q≥1, η≥0 and 2ηQ²<1, then the closed major arcs indexed
by reducedArcIndices(Q) are pairwise disjoint. This is a sufficient strict size condition, not a claim of
disjointness for every δ>0 in the source parametrization. ([Assing](#assingcircle2022), §6.1 p.34, Farey
fractions and arc definitions.)

Arcs are closed. Strict inequality is used because two closed balls may meet at a boundary when twice the radius
equals the distance of their centres.

*Needs:* Layer 2 `majorArc`; Layer 2 `reduced_centre_separation`; Mathlib `dist_triangle`.

Prove `major_minor_counting_partition` (major–minor arc counting partition). For an integrable complex function
F on the probability torus, Q≥1, η≥0 and 2ηQ²<1, its full integral equals the sum of its restricted integrals
over all indexed majorArc((a,q),η), plus its restricted integral over minorArcs(Q,η). Without the size condition
one may still split into the major union and its complement, but may not replace the union integral by a sum
over overlapping arcs. ([Assing](#assingcircle2022), §6.1 p.34, Farey fractions and arc definitions.)

Use AddCircle.haarAddCircle at period one. Integrable F is an explicit hypothesis; finite torus exponential
polynomials satisfy it by continuity on the compact torus.

*Needs:* Layer 2 `majorArcs`; Layer 2 `minorArcs`; Layer 2 `major_arcs_disjoint`; Layer 2
`torus_coefficient_extraction`; Mathlib `MeasureTheory.integral_add_compl`; Mathlib
`MeasureTheory.integral_biUnion_finset`.

### 2.3 Uniform function-field minor counts

Prove `uniform_function_field_minor_count` (uniform arithmetic minor-arc count). For d≥k−1,k≥3,n≥1 there is
C(d,k,n)>0, independent of the finite field, tensor coefficients and b, such that for char F_q>k, a smooth
leading degree-k form, d≤m≤kd/2, and b outside the closed A_m⊆A^{kd}, N(c,b,d,d)≤C(d,k,n)q^(dn(k−1)−n
floor(m/(k−1))). The same statement uses the equivalent explicit Hankel-kernel exclusion and
common-diagonal-zero smoothness condition. ([Browning–Sawin](#browningsawin2020), Proposition6.2 p.936 and proof
pp.938–939.)

*Needs:* Layer 1 `iterated_function_field_shrinking`; Layer 1 `short_polar_values_zero`; Layer 1
`polar_dimension_bound`.

### Examples

- For `weightedTorusSum`, at α=0 the value is Σ_{a∈A}w(a).
- For `weightedTorusSum`, a singleton at a nonzero frequency distinguishes the sign convention.
- For `torus_coefficient_extraction`, if w=1 the result counts precisely the fibre Φ⁻¹(b).
- For `torus_coefficient_extraction`, replacing −b by +b gives the wrong fibre in a nonsymmetric example.
- For `momentWeylSum`, the zero-torus value is N.
- For `momentWeylSum`, in dimension zero the function is constant N, not a new zero-dimensional oscillatory
  object.
- For `vinogradovMeanValue`, the count at n=2,s=2,N=2 is 6, not 3.
- For `vinogradovMeanValue`, a constant moment map is not interchangeable with the positive moment map.
- For `vinogradov_counting_integral`, for n=2,s=2,N=2 the integral is 6.
- For `vinogradov_counting_integral`, unnormalized period-T volume would introduce Tⁿ; the use of normalized Haar
  prevents that error.
- For `powerWeylSum`, the zero-variable contribution is not inserted into this sum.
- For `powerWeylSum`, a degree-three sum has only the cubic frequency, not three independent torus coordinates.
- For `reducedArcIndices`, q=0 has no indices; Q=1 has just (0,1).
- For `reducedArcIndices`, the two equivalent centres 1/2 and 2/4 are never both indexed.
- For `majorArc`, the arc about zero contains points immediately below one as well as immediately above zero.
- For `majorArc`, closed boundary points belong to the arc; a negative radius gives no points.
- For `majorArcs`, the zero cutoff gives an empty major set even when η is nonnegative.
- For `majorArcs`, at cutoff one the union is exactly the wrapped zero arc.
- For `denominatorMajorArcs`, widths must depend on q; the fixed-radius majorArcs definition is a different
  partition.
- For `denominatorMajorArcs`, torus distance keeps the arc at zero wrapped. No disjointness or asymptotic
  approximation is asserted by the definition.
- For `minorArcs`, every torus point belongs to precisely one side of the partition.
- For `minorArcs`, with Q=0 the minor set is the whole torus.
- For `reduced_centre_separation`, at Q=3 the centres 1/2 and 1/3 have distance 1/6, so a denominator-dependent
  positive gap is required.
- For `reduced_centre_separation`, wraparound centres near zero are treated by the integer z; ordinary real
  distance is not substituted.
- For `major_arcs_disjoint`, for Q=2 and η=1/4 the point 1/4 lies in both the zero and half arcs; disjointness
  without a size condition is false.
- For `major_arcs_disjoint`, the sufficient condition is not presented as necessary; it uses the coarse Q² bound.
- For `major_minor_counting_partition`, the formula keeps the minor contribution, which may have either complex
  sign.
- For `major_minor_counting_partition`, no rational centre or wrapped portion of the zero arc is counted twice.

### Dependencies

Use Layer 1. Use the native Mathlib APIs listed at each target.

Absolute convergence supplies the infinite Fourier-extraction adapter: bound each monomial by one, use the summable norm envelope and pass finite integrals to the limit. The finite Vinogradov count is defined here before its integral identity and before any mean-value bound. For prime-power sums, keep composite prime-power stationary phase distinct from finite-field Gauss estimates. In particular the unrestricted quadratic two-adic recurrence is false: the modulus-eight sum is `4 exp(iπ/4)` while the modulus-two sum is zero. Use corrected bases before any degree-two singular-series argument.

For the function-field endpoint, match the geometric polynomial-box supplier with strict degree cutoff, including its zero-box case. The count multiplier is `q^{rns}` after iteration; keeping the larger fractional cutoff is essential. No geometric mapping-space theorem is used to prove the arithmetic input to that theory.

Use the early GeometricCircleMethodAndMappingSpaces affine dimension, polynomial-box and Padé/Hankel contracts specified above; their proofs are independent of this minor-count consumer.

## Layer 3: decoupling and mean values

Build the geometric inequality and the analytic localization required for critical moment-curve decoupling.
Scale induction, lower-dimensional decoupling and ball inflation produce the critical estimate, which yields
discrete restriction and the Vinogradov mean-value bound. The sparse-curve transfer is a distinct quantitative
target before the improved monomial mean value is used.

### 3.1 Brascamp–Lieb geometry

Define `brascampLiebBound` (brascamp–lieb inequality predicate). For Euclidean H,H_j,continuous linear
L_j,positive exponents a_j and C≥0, brascampLiebBound(L,a,C) means that every family of nonnegative integrable
f_j has integrable product ∏f_j(L_jx)^a_j and integral≤C∏(∫f_j)^a_j. Use native canonical Euclidean volume and
Bochner integrals. ([Bennett–Carbery–Christ–Tao](#bcct2005), §1 and Theorem2.1 pp.1–2; BBFL§1 p.1 L¹-power
formulation.)

The basic API consists of the following statements.

- `brascampLiebBound_iff`: Expand the quantified integrability and bound.
- `brascampLiebBound_mono`: Increasing C preserves the bound.
- `brascampLiebBound_identity`: A single identity map with a=1 has C=1.
- `brascampLiebBound_no_zero_map`: In dimension1, L=0,a=1 has no finite bound.

**Checks.**

- The one-dimensional identity datum satisfies C=1.
- The zero map ℝ→ℝ fails every finite C.
- The identity datum with a=2 fails every finite C.

*Needs:* Mathlib `MeasureTheory.integral`.

Prove `brascamp_lieb_finiteness` (brascamp–lieb finiteness criterion). For surjective L_j:H→H_j and 0<a_j≤1, a
finite BL bound exists iff dimH=Σa_jdimH_j and dimV≤Σa_jdim(L_jV) for every subspaceV⊆H.
([Bennett–Carbery–Christ–Tao](#bcct2005), Theorem2.1 p.2; full proof §4 pp.5–8 and necessity §5.)

*Needs:* Layer 3 `brascampLiebBound`.

Prove `brascamp_lieb_stability` (local boundedness of the bl constant). Fix a surjective datumL⁰ with finite BL
bound and 0<a_j≤1. There are η,C>0 such that max_j‖L_j−L⁰_j‖<η implies brascampLiebBound(L,a,C). This is local
boundedness, not continuity. ([Bennett–Bez–Flock–Lee](#bbfl2018), Theorem1.1 p.2; proof via Theorem2.1 §2.2
pp.7–9.)

*Needs:* Layer 3 `brascamp_lieb_finiteness`.

Prove `moment_transversality` (moment-curve osculating transversality). For n≥2,1≤k<n,M=n!, and distinct
t_j∈[0,1], let V_j spanγ′(t_j),…,γ^(k)(t_j) and π_j be its orthogonal projection. Every V⊆ℝⁿ satisfies
dimV≤n/(kM)Σdimπ_jV. Thus this projection datum has finite BL bound. ([Bourgain–Demeter–Guth](#bdg2016),
Theorem6.3 and proof pp.640–642.)

*Needs:* Layer 3 `momentCurve`; Layer 3 `brascamp_lieb_finiteness`.

Prove `uniform_moment_bl` (uniform separated moment bl bound). For K≥2n!,M=n! nonconsecutive K-grid intervals
I_j and t_j∈I_j, the preceding projection data have a uniform BL bound C(n,k,K), also in a sufficiently small
common neighborhood. ([Bourgain–Demeter–Guth](#bdg2016), Proposition6.4 and proof pp.642–643.)

*Needs:* Layer 3 `moment_transversality`; Layer 3 `brascamp_lieb_stability`.

Prove `perturbed_plate_kakeya` (perturbed brascamp–lieb plate kakeya). For finite BL datum(L,a),0<a_j≤1,onℝⁿ and
ε>0, there areη,C>0 such that for0<δ≤1, finite families of δ-neighborhoods T_{j,α} of affine translates of
kerL_{j,α}, with‖L_{j,α}−L_j‖<η, satisfy ∫_{[-1,1]ⁿ}∏(Σ_α1_T)^a_j≤Cδ^{n−ε}∏(#family_j)^a_j. Duplicates count
with multiplicity; distance is Euclidean. ([Bennett–Bez–Flock–Lee](#bbfl2018), Theorem1.2 p.5; full induction
§3.1 pp.14–15; BDG Theorem6.5 p.643 tangent-plate rescaling.)

*Needs:* Layer 3 `brascamp_lieb_stability`; Layer 3 `uniform_moment_bl`.

### 3.2 Moment-curve extension and weights

Define `momentCurve` (moment curve). momentCurve(n,t) is (t,t²,…,tⁿ) in native EuclideanSpace ℝ (Fin n),
constructed by WithLp.toLp 2. Coordinate j has exponent j+1. The analytical curve is its restriction to t∈[0,1];
the polynomial map itself is defined for all real t and includes n=0. ([Bourgain–Demeter–Guth](#bdg2016), §1
pp.634–635 and §3 p.637.)

n is natural; t is real. The ambient metric is Euclidean, not the native sup norm on an unwrapped Pi type.

The basic API consists of the following statements.

- `momentCurve_apply`: The j-th coordinate is t^(j+1).
- `momentCurve_zero`: The image of t=0 is the zero vector.
- `momentCurve_continuous`: The polynomial map into native Euclidean space is continuous.
- `momentCurve_first_injective`: For n≥1 it is injective because the first coordinate is t.

**Checks.**

- At n=2,t=2 the coordinates are (2,4).
- At n=0,t=3 the vector is zero.
- At n=1 its sole coordinate is the identity t, agreeing with the linear moment map.

*Needs:* Mathlib `EuclideanSpace`; Mathlib `PiLp.toLp_apply`.

Define `decouplingWeight` (decoupling weight). For a native Euclidean centre c, real radius R>0 and natural E,
decouplingWeight(n,E,c,R)(x)=(1+‖x−c‖/R)^(−E). The spatial weighted measure is the native
volume.withDensity(ENNReal.ofReal∘weight), and weighted norms are native eLpNorm. The endpoint uses E≥100n and
keeps the same E on both sides. ([Bourgain–Demeter–Guth](#bdg2016), §1 pp.634–635 and §3 p.637.)

R>0 for geometric properties; E may be zero in the definition. Native inversion and division make the expression
total, but R≤0 is not an analytical radius. No custom measure or Lp carrier is introduced.

The basic API consists of the following statements.

- `decouplingWeight_centre`: The centre value is one.
- `decouplingWeight_bounds`: For R>0 its value is strictly positive and at most one.
- `decouplingWeight_continuous`: For R>0 the weight is continuous.
- `decouplingWeight_translate`: Translate c and x by the same vector to leave the value unchanged.
- `decouplingWeight_zero_exponent`: At E=0 the weight is the constant one function.

**Checks.**

- In dimension one, c=0,R=1,E=2,x=1 gives1/4.
- At c=0,R=2,E=2,x=2 the value is again1/4.
- In positive dimension E=0 gives one, not a decaying density.

*Needs:* Mathlib `EuclideanSpace`; Mathlib `MeasureTheory.eLpNorm`; Mathlib `MeasureTheory.MemLp`; Mathlib
`MeasureTheory.Measure.withDensity`.

Define `momentExtension` (moment-curve extension operator). For a real interval [a,b], complex amplitude g and
x∈EuclideanSpace ℝ (Fin n), momentExtension(n,a,b,g)(x)=∫_[a,b]g(t)exp(2πiΣ_jx_jt^(j+1))dt, using native
Lebesgue measure and Bochner integration. For analytical claims g is IntegrableOn [a,b]; in the decoupling
theorem it is IntegrableOn [0,1]. The source’s interval operator is an adapter to native integration, not a new
Fourier transform. ([Bourgain–Demeter–Guth](#bdg2016), §1 pp.634–635 and §3 p.637.)

a,b are real. If b<a the interval is empty. Integrability is exposed on continuity, norm bounds and additive
APIs; the totalized native definition is not interpreted as a meaningful nonintegrable oscillatory integral.

The basic API consists of the following statements.

- `momentExtension_empty`: If b<a the function is zero.
- `momentExtension_zero_amplitude`: Zero amplitude gives zero.
- `momentExtension_add`: For amplitudes integrable on the interval, extension is additive.
- `momentExtension_smul`: Complex scalar multiplication commutes with the native extension integral.
- `momentExtension_zero_spatial`: At x=0 the value is ∫_[a,b]g.
- `momentExtension_norm_bound`: For integrable g, every spatial value has norm at most ∫_[a,b]|g|.
- `momentExtension_continuous`: For integrable g the spatial function is continuous.
- `momentExtension_partition`: For M≥1, extension on[0,1] is the sum of its M adjacent equal-interval extensions;
  their endpoints have zero measure.

**Checks.**

- For amplitude one on[0,1] and x=0 the value is1.
- The interval[1,0] gives zero.
- For amplitude−1 on[0,1] and x=0 the result is−1, not the integral of its norm.
- In dimension zero the operator agrees with the native integral of g.

*Needs:* Layer 3 `momentCurve`; Mathlib `MeasureTheory.integral`; Mathlib `MeasureTheory.IntegrableOn`; Mathlib
`Complex.norm_exp_ofReal_mul_I`; Mathlib `MeasureTheory.norm_integral_le_integral_norm`.

Prove `weighted_extension_finite` (weighted extension integrability). If R>0, E>n, 1≤p<∞ and g is integrable
on[a,b], then momentExtension(n,a,b,g) belongs to native MemLp at exponent p for the measure
volume.withDensity(weight). Thus its eLpNorm is finite; no invalid conversion of +∞ to real zero is used.
([Bourgain–Demeter–Guth](#bdg2016), §1 p.634, weight-exponent discussion.)

E is natural, p is real, c is any Euclidean centre. There is no finite-volume-ball restriction on the integral;
the weight is integrated on the whole space.

*Needs:* Layer 3 `momentExtension`; Layer 3 `decouplingWeight`; Mathlib `MeasureTheory.MemLp`; Mathlib
`MeasureTheory.eLpNorm`; Mathlib `MeasureTheory.Measure.withDensity`.

### 3.3 The parabola and induction on scales

Prove `parabola_decoupling_base` (parabola critical decoupling base). For E≥200,ε>0 the n=2,M-grid
critical-decoupling inequality holds at exponent6, with C(E,ε)M^ε. This is the analytic base, separate from
elementary integer n=2 counting. ([Bourgain–Demeter, parabola](#bd2015), Theorem1.1 pp.351–352; full §5
pp.370–377 and §6 pp.377–383.)

*Needs:* Layer 3 `momentExtension`; Layer 3 `decouplingWeight`; Layer 3 `perturbed_plate_kakeya`.

Prove `weighted_l2_decoupling` (weighted l² interval decoupling). For E≥100n,R≥1 and an interval I partitioned
into adjacent lengthR^{-1} intervalsΔ, ‖E_Ig‖²_{L²(w_B)}≤C(n,E)Σ_Δ‖E_Δg‖²_{L²(w_B)} on a radius-R ball; C is
independent ofR,I,g. ([Bourgain–Demeter–Guth](#bdg2016), Lemma8.1 and proof pp.654–655.)

*Needs:* Layer 3 `momentExtension`; Layer 3 `decouplingWeight`.

Prove `lower_dimensional_decoupling` (lower-dimensional slicing). For3≤k≤n,p≥2, the(k−1)-dimensional decoupling
bound at scaleR^{-1/(k−1)} gives the same bound, up to C(n,E), for E^(n)_Ig on a radius-R ball with I
partitioned at that scale. The same decay exponentE is used in both dimensions.
([Bourgain–Demeter–Guth](#bdg2016), Lemma8.2 and proof pp.655–656.)

*Needs:* Layer 3 `momentExtension`; Layer 3 `decouplingWeight`.

Prove `ball_inflation` (ball inflation). Fix1≤k<n,p≥2n,K≥2n!,M=n!,separated K-grid intervals I_i,0<ρ<K^{-1}. B
has radiusρ^{-k−1}, and {Δ} is a standard bounded-overlap radiusρ^{-k} cover. Withq=pk/n and normalized weighted
L♯_q(B)=|B|^{-1/q}L_q(w_B),
average_Δ[∏_i(Σ_{J⊆I_i,|J|=ρ}L♯_q(E_Jg,Δ)²)^{1/2}]^{p/M}≤C(n,p,E,K,ε)ρ^{-ε}[∏_i(Σ_JL♯_q(E_Jg,B)²)^{1/2}]^{p/M}.
Cover geometry and normalization are required. ([Bourgain–Demeter–Guth](#bdg2016), Theorem6.6 and full proof
pp.643–647.)

*Needs:* Layer 3 `perturbed_plate_kakeya`; Layer 3 `momentExtension`; Layer 3 `decouplingWeight`.

Prove `linear_multilinear_conversion` (linear–multilinear decoupling conversion). For 0<δ<1,
ForE≥100n,p≥2,K≥2n!, letV_p(δ) be the least linear weighted decoupling constant andV_p(δ,K) the M=n!
separated-interval multilinear constant. ThenV_p(δ)≤C(n,p,E,K)δ^{-ε_p(K)}sup_{δ≤δ′<1}V_p(δ′,K), whereε_p(K)>0
tends to0 asK→∞. Both constants use the same weights, partitions and integrable amplitudes. The scale δ=1 is
handled separately by V_p(1)=1; the displayed supremum must not be used at that endpoint.
([Bourgain–Demeter–Guth](#bdg2016), Theorem7.6 and complete proof pp.652–654.)

*Needs:* Layer 3 `momentExtension`; Layer 3 `decouplingWeight`.

Prove `multiscale_decoupling_iteration` (multiscale decoupling iteration). Forn≥3,p<n(n+1) near critical,
assuming critical decoupling in smaller dimensions, everyW>0 admits finiteb_I,γ_I>0 withΣγ_I<1,Σb_Iγ_I>W. Foru>0
small enough,δ∈(0,1], useD_p(q,B)=(∏_{i=1}^{n!}(Σ_{J⊆I_i,|J|=δ^q}L♯_p(E_Jg,B)²)^{1/2})^{1/n!},
A_p(q,B,s)=(average_{B_s⊆B}D₂(q,B_s)^p)^{1/p}. Then
A_p(u,B_n,u)≤Cδ^{-ε}V_p(δ)^{1−Σγ_I}D_p(1,B_n)^{1−Σγ_I}∏_IA_p(ub_I,B_n,ub_I)^{γ_I}. B_r has radiusδ^{-r}; all
covers are standard bounded-overlap covers. ([Bourgain–Demeter–Guth](#bdg2016), Theorem8.3 pp.657–658; general-n
Theorem8.14 pp.674–675; Appendix Theorem10.1 pp.679–681.)

*Needs:* Layer 3 `ball_inflation`; Layer 3 `weighted_l2_decoupling`; Layer 3 `lower_dimensional_decoupling`;
Layer 3 `parabola_decoupling_base`.

Prove `decoupling_exponent_collapse` (decoupling exponent collapse). The multiscale inequality and
linear/multilinear comparison imply growth exponentη_p=0 forp<n(n+1) near critical. A Bernstein/Hölder limiting
argument givesη_{n(n+1)}=0 and critical decoupling for everyε>0. ([Bourgain–Demeter–Guth](#bdg2016),
Theorem9.1,Lemma9.2 and complete final proof pp.675–678.)

*Needs:* Layer 3 `multiscale_decoupling_iteration`; Layer 3 `linear_multilinear_conversion`.

### 3.4 Critical decoupling and its arithmetic consequences

Prove `critical_decoupling` (critical moment-curve decoupling theorem). For n≥2, natural E≥100n and ε>0 there is
C(n,E,ε)>0 such that for every integer M≥1, every centre c and every amplitude g integrable on[0,1], with R=M^n,
‖E_[0,1]g‖_L^{n(n+1)}(w_{c,R,E})≤CM^ε(Σ_{j=0}^{M−1}‖E_[j/M,(j+1)/M]g‖_L^{n(n+1)}(w_{c,R,E})²)^{1/2}. The norms
integrate over the entire Euclidean space with weighted Lebesgue measure. C is independent of M,c,g.
([Bourgain–Demeter–Guth](#bdg2016), Theorem1.2 p.635; weight extension p.637; §§6–10.)

The same E is retained in all weighted norms. Intervals are exactly the reciprocal-integer partition specified
after source Theorem1.2. There is no source claim here of arbitrary noninteger partition data or automatic
interpolation of every p.

*Needs:* Layer 3 `momentCurve`; Layer 3 `decouplingWeight`; Layer 3 `momentExtension`; Layer 3
`weighted_extension_finite`; Layer 3 `decoupling_exponent_collapse`; Layer 3 `parabola_decoupling_base`.

Prove `discrete_restriction_critical` (critical discrete restriction estimate). For n≥2,E≥100n,ε>0 there is
C(n,E,ε)>0 so that for N≥1, points (i−1)/N<t_i≤i/N, arbitrary complex coefficients a_i and any ball B of radius
N^n, the normalized weighted L^{n(n+1)} norm of Σ_i a_i exp(2πiΣ_jx_jt_i^j) is at most CN^ε(Σ_i|a_i|²)^{1/2}.
Normalized means dividing the weighted p-th-power integral by the ordinary Lebesgue volume of B, not by the
weight’s total mass. ([Bourgain–Demeter–Guth](#bdg2016), Theorem4.1 and proof pp.637–638.)

The ordered points lie in their separate bins but no additional uniform separation distance is assumed. Bin
boundaries use the source half-open convention. The full source Theorem4.1 also covers R≳N^n and all finite p≥2;
the milestone here is the stated critical exponent and radius N^n.

*Needs:* Layer 3 `critical_decoupling`; Layer 3 `weighted_extension_finite`; Layer 3 `momentExtension`.

Prove `vinogradov_main_bound` (vinogradov mean-value theorem). For n≥2,s≥1 and ε>0 there exists C(n,s,ε)>0 such
that for every integer N≥2, J_{s,n}(N)≤C(N^{s+ε}+N^{2s−n(n+1)/2+ε}). Here J is the concrete ordered
positive-integer tuple count. Both expected terms are retained, and the real exponent in the second term is not
truncated by natural subtraction. ([Bourgain–Demeter–Guth](#bdg2016), Theorem1.1 p.633; Corollary4.2
pp.638–639.)

The constant is uniform in N. This is an upper bound with ε loss, not an asymptotic or a local-solubility
conclusion. Degree one is separate. Source n=2 arithmetic proof is only mentioned, so its use requires either a
new divisor proof contract or the explicitly external n=2 decoupling base.

*Needs:* Layer 2 `vinogradovMeanValue`; Layer 2 `vinogradov_counting_integral`; Layer 3
`discrete_restriction_critical`.

Prove `linear_mean_bound` (linear vinogradov mean-value bound). For s≥1 and all N≥0, J_{s,1}(N)≤N^{2s−1}. In
degree one the only condition is equality of tuple sums, and specifying all but the final y coordinate
determines that remaining coordinate uniquely. This elementary bound has constant one and no ε loss.
([Bourgain–Demeter–Guth](#bdg2016), §1 p.633, source system specialized to n=1.)

The tuples are ordered and entries are1..N. The exponent2s−1 is positive when s≥1; N=0 gives zero.

*Needs:* Layer 2 `vinogradovMeanValue`.

Prove `hua_mean_value` (hua mean-value inequality). For each d≥2,1≤v≤d and ε>0 there is C(d,v,ε)>0 such that for
every N≥1, the normalized-Haar integral on AddCircle(1) of |Σ_{m=1}^Nfourier(m^d)(α)|^{2^v} is at most
CN^{2^v−v+ε}. It is a one-frequency monomial sum, not the n-dimensional full moment-curve sum and not the sharp
Vinogradov critical theorem. ([Assing](#assingcircle2022), Lemma5.1 and proof pp.28–31; Lemma5.2 and proof
pp.31–32.)

Positive entries1..N are used; d is the monomial degree and v the differencing level. The native probability
Haar at period one is explicit. The allowed upper endpoint is v=d, not every v.

*Needs:* Layer 2 `torus_coefficient_extraction`; Mathlib `AddCircle.haarAddCircle`; Mathlib
`fourierCoeff_fourier`; `AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound`; Mathlib `fwdDiff`; Mathlib
`Polynomial.fwdDiff_iter_degree_eq_factorial`; Mathlib `Nat.divisors`; Mathlib `Complex.norm_exp_ofReal_mul_I`;
Mathlib `Finset.sum_mul_sum`.

Prove `nondegenerate_curve_critical_transfer` (critical discrete decoupling for the sparse monomial curve). For
integers1≤t≤k and ε>0, let γ(u)=(u^k,u^{t−1},…,u),u∈[1,2]. For one point per interval of length1/N and complex
coefficientsa_i, normalized weighted L^{t(t+1)} on balls of radius≥N^t is at most C(k,t,E,ε)N^ε‖a‖₂, with
E≥100t. For t=1 this is ordinary L² separation. For t≥2 the Wronskian does not vanish on[1,2]; a quantitative
Taylor/perturbation transfer of critical moment-curve decoupling is required. The older Bourgain–Demeter2015
general-curve theorem gives only p≤4t−2 and cannot supply this exponent. ([Assing](#assingcircle2022), §8.1
Corollary8.5 pp.76–77 and Theorem8.6 p.77; BDG critical input; [Bourgain–Demeter, nondegenerate
curves](#bdnondegeneratecurves2015), Theorem1.4 p.3.)

*Needs:* Layer 3 `critical_decoupling`; Layer 3 `discrete_restriction_critical`.

Prove `improved_hua_moment` (improved monomial mean value). For k≥1,1≤t≤k,ε>0,N≥1,
∫₀¹|Σ_{1≤n≤N}e(αn^k)|^{t(t+1)}dα≤C(k,t,ε)N^{t²+ε}. The exponent is t² rather than the VMV exponent t(t+1)/2
because the lower coefficients are integrated out with kernels and the top coordinate is rescaled.
([Assing](#assingcircle2022), Theorem8.9 and full proof pp.82–83.)

*Needs:* Layer 3 `nondegenerate_curve_critical_transfer`; Layer 2 `torus_coefficient_extraction`.

Prove `vmv_weyl_bound` (mean-value weyl bound). For k≥3,ε>0, real coefficientsα₁,…,α_k, and a reduced rational
approximation |α_j−a/q|≤q^{-2} for any2≤j≤k, the lengthN polynomial sum is bounded by
C(k,ε)N^{1+ε}(q^{-1}+N^{-1}+qN^{-j})^{1/(k(k−1))}. The classical differencing exponent2^{1−k} is a separate
result. ([Assing](#assingcircle2022), Theorem8.8 and proof pp.79–82.)

*Needs:* Layer 3 `vinogradov_main_bound`; Layer 1 `polynomial_weyl_inequality`.

### Examples

- For `momentCurve`, at degree two, t=2 gives (2,4), not (1,2).
- For `momentCurve`, at degree zero there is just the zero vector in the zero-dimensional native space.
- For `decouplingWeight`, the dimension-dependent exponent is not changed when passing to a lower-dimensional
  inequality.
- For `decouplingWeight`, for E=0 the weight is constant one and has infinite total mass when n>0.
- For `momentExtension`, at x=0 the result is exactly the amplitude integral.
- For `momentExtension`, the frequency starts with t, not a constant coordinate.
- For `weighted_extension_finite`, constant amplitude produces a bounded extension; finite weighted mass is still
  a required step.
- For `weighted_extension_finite`, this result does not apply to E=0 in positive dimension.
- For `critical_decoupling`, the critical exponent is n(n+1), not its half.
- For `discrete_restriction_critical`, at critical exponent the second N-power term of source Theorem4.1 is
  another N^ε and is absorbed in C.
- For `discrete_restriction_critical`, normalization uses ordinary ball volume; a zero-radius ball is excluded by
  N≥1.
- For `vinogradov_main_bound`, for s=1 the exact count is N, making the N^s term indispensable.
- For `vinogradov_main_bound`, an exponent such as2s−n(n+1)/2 may be negative and is represented with real rpow.
- For `linear_mean_bound`, at s=1 the bound is equality N.
- For `linear_mean_bound`, at s=2,N=3 the count is19≤27, not an unordered count.
- For `hua_mean_value`, at d=2,v=2,N=2 the fourth moment is6.
- For `hua_mean_value`, zero-inclusive sums would change the exact base count; the definition does not include
  m=0.

### Dependencies

Use Layer 1, Layer 2. Use the native Mathlib APIs listed at each target and the supplier contracts
`AnalyticNumberTheory:AN.5`.

Prove `gaussian_brascamp_lieb_extremality`: for a finite Brascamp–Lieb datum `(L_j,a_j)` with positive exponents, its optimal constant is the supremum, over positive-definite `A_j` on the target spaces, of `∏_j det(A_j)^{a_j/2} / det(∑_j a_j L_j^* A_j L_j)^{1/2}`. Finiteness of the Brascamp–Lieb constant forces the common kernel of the `L_j` to be zero; positivity of the exponents and `A_j` then makes the denominator matrix positive definite, so its determinant is nonzero. Use determinant one in dimension zero. This is the Gaussian extremality input to the stability proof (Bennett–Bez–Flock–Lee, §2.2, pp.7–9). Bennett–Bez–Flock–Lee use Lieb, Inventiones 102 (1990), Theorem 6.2 for this step. Give its complete proof or a precise native supplier before using stability. Prove `transverse_multilinear_restriction` and the wave-packet decomposition used by the parabola argument. For `d≥2`, `d` compact smooth hypersurface patches with bounded `C²` parametrizations and normals whose determinant has absolute value at least `ν>0`, `q≥2d/(d−1)`, `p′≤(d−1)q/d`, `ε>0` and `R≥1`, require `‖∏_j E_j g_j‖_{L^{q/d}(B(0,R))}≤C R^ε ∏_j ‖g_j‖_{L^p}`. The constant depends on the derivative bound, transversality, exponents and dimension. This is [Bennett–Carbery–Tao](#bctrestriction) Theorem 1.16 (author version, p.6; reduction in §2, pp.7–9), the external restriction input to Bourgain–Demeter, rather than a consequence of integer mean values.

Construct the native localization adapters used in the targets: canonical grids at nonintegral scales, covers with bounded overlap and comparable cardinalities, compact Fourier-support Bernstein inequalities, positive Schwartz cutoffs with prescribed small square-root Fourier support, and affine changes of variables with their Jacobians. Reuse Tau Ceti's nonnegative-Fourier test function for the part of localization it supplies. Define the finite D/A quantities and least decoupling constants only after their eLpNorm values are finite. Their normalization checks are the single-interval identity, zero amplitude, and invariance under translation of the ball with translated amplitude. Covers are geometrically specified; an arbitrary cover is not an admissible input to ball inflation.

The critical perturbation transfer for the fixed sparse monomial curve is an additional theorem. Control its nonzero Wronskian on `[1,2]`, Taylor normalization and the constant in scale induction. The older general-curve range `p≤4t−2` does not give `p=t(t+1)`. For the cube version use radius `N^t` and normalization `N^{-t²}`.

## Layer 4: singular series and representation densities

Define the arithmetic series and normalized real and residue counts before combining them into asymptotics.
Prove convergence rather than relying on totalized infinite operations. The quadratic and Markoff local
calculations keep bad primes, dyadic cases, target valuations and half-norm conventions visible.

### 4.1 Waring coefficients and local factors

Define `waringSeriesCoeff` (waring singular-series coefficient). For degree d, number of variables s and integer
target m≥0, A_{d,s,m}(q)=Σ_{a mod q,gcd(a,q)=1}(q^{-1}completePowerSum(d,q,a))^s exp(−2πiam/q). Use native
finite residues and the negative target-frequency sign. Define A(0)=0 by the empty sum; at q=1 its sole reduced
residue is0 and A(1)=1. ([Assing](#assingcircle2022), §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs;
pp.45–46.)

All four parameters are natural. At q>0 this agrees with the source reduced representatives1≤a≤q. The
coefficient may be negative; it is not defined by absolute values.

The basic API consists of the following statements.

- `waringSeriesCoeff_zero`: A(0)=0.
- `waringSeriesCoeff_one`: A(1)=1.
- `waringSeriesCoeff_conjugate`: Complex conjugation fixes A(q).
- `waringSeriesCoeff_periodic_target`: A_{m+q}(q)=A_m(q).

**Checks.**

- d=3,s=7,m=1,q=0 gives0.
- d=3,s=7,m=1,q=1 gives1.
- d=2,s=2,m=1,q=3 gives1/3.
- d=2,s=2,m=0,q=3 gives−2/3, not2/3.

*Needs:* Layer 1 `completePowerSum`; Mathlib `fourier_neg`; Mathlib `fourier_add`.

Prove `waring_series_multiplicative` (singular-series coefficient multiplicativity). For positive coprime u,v,
A_{d,s,m}(uv)=A_{d,s,m}(u)A_{d,s,m}(v), for every natural d,s,m. This is exact coefficient multiplicativity,
independent of absolute convergence of the infinite series. ([Assing](#assingcircle2022), §6.1 pp.35–39 and §6.2
pp.39–47, statements and proofs; pp.45–46.)

Both moduli are positive and coprime. The correspondence between unit target frequencies uses a/(uv)≡a₁/u+a₂/v
modulo one.

*Needs:* Layer 1 `completePowerSum`; Layer 4 `waringSeriesCoeff`; Mathlib `ZMod.prodEquivPi`; Mathlib
`Finset.sum_mul_sum`.

Define `waringSingularSeries` (waring singular series). waringSingularSeries(d,s,m)=Σ_{q≥1}A_{d,s,m}(q),
implemented with native tsum over all naturals and A(0)=0. A summability proof is required before treating this
native totalized value as an analytic singular series: nonsummable input gives native zero and is not evidence
for a vanishing arithmetic density. ([Assing](#assingcircle2022), §6.1 pp.35–39 and §6.2 pp.39–47, statements
and proofs; pp.45–46.)

The convergence theorem below uses d≥3,s≥2d+1. Other ranges require their own proven hypotheses; the definition
alone has no positivity or convergence content.

The basic API consists of the following statements.

- `waringSingularSeries_eq_tsum`: The value is the native tsum of the coefficient family with A0=0.
- `waringSingularSeries_hasSum`: Summable coefficients have this value as their native HasSum limit.
- `waringSingularSeries_real`: Under summability its imaginary part is zero.

**Checks.**

- For d=1,s=2 and any m the series is1, since every coefficient q>1 vanishes.
- For d=1,s=0,m=0 the native value is0: A(q)=φ(q) for q≥1 is not summable. A divergent sequence of positive
  partial sums cannot be substituted for the totalized tsum.
- For d=4,s=9,m=15 the value is0 despite absolute convergence. Fourth powers are0 or1 modulo16, so nine
  variables cannot give15; the two-adic local factor vanishes. This rejects an always-positive series.

*Needs:* Layer 4 `waringSeriesCoeff`; Mathlib `tprod`; Mathlib `Multipliable`.

Prove `waring_series_absolute_convergence` (waring singular-series absolute convergence). For d≥3 and s≥2d+1,
the family q↦|A_{d,s,m}(q)| is summable for every m, with a bound uniform in m. In particular the complex
singular series exists as an actual sum. ([Assing](#assingcircle2022), §6.1 pp.35–39 and §6.2 pp.39–47,
statements and proofs; pp.45–46.)

This is the simple source Theorem6.18 range; it is not falsely substituted for the sharper §9 range that depends
on fixed target m and more delicate prime-power estimates.

*Needs:* Layer 4 `waringSeriesCoeff`; Layer 1 `complete_power_bound`; Mathlib `Multipliable`; Mathlib `tprod`.

Define `waringSingularIntegral` (waring singular integral). I_{d,s}=∫_{β∈ℝ}(∫_{0≤t≤1}exp(2πiβt^d)dt)^s
exp(−2πiβ)dβ, using native Lebesgue measure and Bochner integration. For d≥1 and s>d the integrand is absolutely
integrable. This is the real local factor at normalized target1 for positive power variables, not a p-adic
density or the volume of an unweighted arbitrary real solution set. ([Assing](#assingcircle2022), §6.1 pp.35–39
and §6.2 pp.39–47, statements and proofs; pp.45–46.)

The definition is native and totalized, but the valid analytic domain is d≥1,s>d. Parameter and frequency
endpoints use full Lebesgue integration; there is no unproved cutoff removal.

The basic API consists of the following statements.

- `waringSingularIntegral_eq_integral`: The value is the specified native two-step integral with phase
  normalization2π.
- `waringSingularIntegral_integrable`: For d≥1,s>d the full-line integrand is integrable.
- `waringSingularIntegral_positive`: On the valid domain its real part is positive, by the Gamma evaluation
  theorem.

**Checks.**

- d=1,s=2 gives1.
- d=1,s=3 gives1/2.
- d=2,s=3 givesπ/4, matching the Gamma ratio with the native2π convention.

*Needs:* Mathlib `MeasureTheory.integral`; Mathlib `MeasureTheory.IntegrableOn`.

Prove `waring_singular_integral_evaluation` (waring singular integral evaluation). For d≥1 and s>d,
I_{d,s}=Γ(1+1/d)^s/Γ(s/d), cast into ℂ. Its imaginary part is zero and its real part is strictly positive.
([Assing](#assingcircle2022), §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46.)

The arguments of native Real.Gamma are strictly positive; its totalization at poles is not used. The positivity
conclusion is archimedean only.

*Needs:* Layer 4 `waringSingularIntegral`; Mathlib `Real.Gamma`; Mathlib `Real.Gamma_pos_of_pos`.

Define `waringCongruenceCount` (waring congruence solution count). For a positive natural modulus q,
waringCongruenceCount(d,s,m,q) is the native cardinality of the subtype of x∈(ZMod q)^s with Σ_ix_i^d=m modq.
Residues are unrestricted, including zero; tuples are ordered. Use native ZMod and its existing finite instance
under NeZero q. ([Assing](#assingcircle2022), §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46.)

q>0 via NeZero; q=0 cannot be given a finite residue count because native ZMod0 is infinite. s=0 is permitted
and leaves only the empty tuple.

The basic API consists of the following statements.

- `waringCongruenceCount_one`: At modulus1 the count is1 for all d,s,m.
- `waringCongruenceCount_empty_tuple`: For s=0 it is1 if m=0modq and0 otherwise.
- `waringCongruenceCount_linear_one`: For d=1,s=1 the count is1 for every positive q and target.
- `waringCongruenceCount_periodic_target`: Replacing m by m+q does not change the count.

**Checks.**

- d=3,s=7 and q=1 gives1 for every m.
- For d=2,s=2,m=1,q=3 the count is4.
- For q=2,s=0 the targets0and1 have counts1and0.
- For d=1,s=1 it agrees with the cardinality of the singleton prescribed residue.

*Needs:* Mathlib `ZMod.fintype`; Mathlib `Fintype.card`; Mathlib `ZMod.natCast_self`.

Define `waringLocalFactor` (waring local factor). For a prime p, χ_{d,s,m}(p)=Σ_{e≥0}A_{d,s,m}(p^e), using
native tsum. The e=0 term isA(1)=1. Only once local summability and the normalized-count limit are proved is
this interpreted as a p-adic solution density. The native totalized value for a divergent family is not a chosen
density. ([Assing](#assingcircle2022), §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46.)

The expression is defined for natural p, but analytical uses require p prime. The simple global convergence
range d≥3,s≥2d+1 supplies local convergence. Degree-one special tests are elementary independent cases.

The basic API consists of the following statements.

- `waringLocalFactor_eq_tsum`: The value is the native prime-power coefficient series including e=0.
- `waringLocalFactor_hasSum`: Under local Summable this value is the native HasSum limit.
- `waringLocalFactor_real`: Under local Summable its imaginary part is zero.

**Checks.**

- At d=1,s=2,m=1,p=3 the value is1.
- At d=4,s=9,m=15,p=2 the value is0: there is no solution modulo16, and hence none modulo any higher power.
  This is a vanishing local obstruction, rather than positivity supplied by the definition.
- For d=2,s=2,m=1,p=3 the factor is4/3: there are4 solutions modulo3, all primitive, and4·3^{e−1} modulo3^e. This
  separates the correct q^{s−1} normalization from q^s and detects omission of the e=0 term.

*Needs:* Layer 4 `waringSeriesCoeff`; Layer 4 `waringCongruenceCount`; Mathlib `tprod`; Mathlib `Multipliable`;
Mathlib `Filter.Tendsto`.

Prove `waring_local_density_limit` (waring p-adic density limit). For d≥3,s≥2d+1 and every prime p,
M(p^e)/p^{e(s−1)} tends to Reχ_{d,s,m}(p) as e→∞. In fact for every e the normalized count
equalsΣ_{v=0}^eA(p^v), a real number; therefore the limit exists and is nonnegative.
([Assing](#assingcircle2022), §6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46.)

All residues are counted in native ZMod(p^e). The exponent e(s−1) is interpreted as a signed integer before any
totalized boundary convention, though the theorem’s range has s≥1. Prime p>0 makes its denominator nonzero.

*Needs:* Layer 4 `waringCongruenceCount`; Layer 4 `waringLocalFactor`; Layer 4
`waring_series_absolute_convergence`; Mathlib `fourierCoeff_fourier`; Mathlib `Filter.Tendsto`.

Prove `waring_series_euler_product` (waring singular-series euler product). For d≥3,s≥2d+1 and any target m, the
singular series equals the native infinite product of χ_{d,s,m}(p) over the subtype of prime naturals. The
series and product are absolutely convergent; each factor is real and nonnegative. ([Assing](#assingcircle2022),
§6.1 pp.35–39 and §6.2 pp.39–47, statements and proofs; pp.45–46.)

Infinite rearrangement is justified by absolute convergence, not by formal multiplicativity alone. A factor may
vanish in a locally insoluble case.

*Needs:* Layer 4 `waringSingularSeries`; Layer 4 `waringLocalFactor`; Layer 4 `waring_series_multiplicative`;
Layer 4 `waring_series_absolute_convergence`; Mathlib `tprod`.

Prove `waring_major_arc_approximation` (monomial major-arc approximation). For d≥1 there is C_d>0 such that for
P≥1,q≥1, any integer a and real β, the difference between powerWeylSum(d,P,a/q+β) and
q^{-1}completePowerSum(d,q,a) times∫_0^P exp(2πiβt^d)dt has norm at most C_dq(1+|β|P^d). Thus on
q≤P^δ,|β|≤P^{−d+δ} it is O_d(P^{2δ}) when δ≥0. ([Assing](#assingcircle2022), Lemma6.3 and proof pp.35–36.)

No coprimality is needed for this exact residue decomposition estimate. Its sharp §9 stationary-phase refinement
is a separate theorem and is not asserted here.

*Needs:* Layer 2 `powerWeylSum`; Layer 1 `completePowerSum`; Mathlib `MeasureTheory.integral`; Mathlib
`MeasureTheory.IntegrableOn`; Mathlib `Complex.norm_exp_ofReal_mul_I`.

Prove `waring_primitive_local_positivity` (primitive waring local positivity). Let d≥3,s≥2d+1,p prime,d=p^τu
with p∤u, and γ=τ+1 for odd p orτ+2 for p=2. IfΣ_i x_i^d=m modp^γ has a solution with at least one unit
coordinate, then Reχ_{d,s,m}(p)≥p^{−γ(s−1)}>0. The hypothesis is primitive solubility at the indicated depth,
not arbitrary solubility modulo p. ([Assing](#assingcircle2022), §6.2 Lemmas6.10–6.13 pp.41–44, statements and
proofs.)

The native residues are in ZMod(p^γ). The prime-power exponent and the derivative valuation are not replaced by
a nonsingularity assumption at level1 when p divides d.

*Needs:* Layer 4 `waringCongruenceCount`; Layer 4 `waring_local_density_limit`; Layer 4 `waringLocalFactor`;
Mathlib `IsUnit`.

Prove `waring_uniform_series_positivity` (uniform waring singular-series positivity). For d≥3 and s≥2^d+1 there
is c(d,s)>0 such that ReS_{d,s}(m)≥c(d,s) for every natural target m. This is the classical Waring range of
Theorem6.13 with its degree-two proof boundary excluded, not a claim that the mere existence of Euler factors
implies positivity. ([Assing](#assingcircle2022), §6.2 Lemmas6.10–6.13 pp.41–44, statements and proofs.)

The bound is uniform in m. The numerical source local-solubility thresholds are2d for odd d and4d for even d;
the claimed s range dominates both when d≥3.

*Needs:* Layer 4 `waring_primitive_local_positivity`; Layer 4 `waring_series_euler_product`; Layer 1
`complete_power_bound`; Layer 4 `waring_series_absolute_convergence`.

Prove `waring_refined_major_arcs` (refined waring major arcs). For k≥3 and s≥max(5,k+1),
M=denominatorMajorArcs(floor(N/(2k)),N^(1−k)/(2k)) give ∫_M T_k(α)^s e(−mα)dα=Γ(1+1/k)^s/Γ(s/k)
S_{s,k}(m)m^{s/k−1}+O_{k,s}(m^{s/k−1−δ}) for someδ>0, N=floor(m^{1/k}). This requires refined rational Gauss
blocks and weighted singular-series tails; the elementary small-arc approximation alone does not prove it.
([Assing](#assingcircle2022), Lemma9.5 pp.89–91; Lemmas9.6–9.8 pp.92–94; Theorem9.9 pp.94–95.)

*Needs:* Layer 1 `completePowerSum`; Layer 4 `waringSingularSeries`; Layer 4
`waring_singular_integral_evaluation`; `FiniteFieldsAndCharacterSums:FF.1`; Layer 2 `denominatorMajorArcs`.

Prove `waring_linear_range_positivity` (uniform waring local positivity in the linear range). For degree k≥3,
the singular series converges absolutely when s≥2k+1 and is bounded below by c(k,s)>0 uniformly in the positive
targetm if s≥2k+1 for oddk or s≥4k for evenk. This is the local range used by the optimized endpoint,
independent of the classical2^k+1 analytic range. ([Assing](#assingcircle2022), Lemmas6.10–6.12 pp.41–44 and
Theorem6.18 p.47.)

*Needs:* Layer 4 `waring_primitive_local_positivity`; Layer 1 `complete_power_bound`; Layer 4
`waring_series_euler_product`.

### 4.2 Polynomial fibers and normalized densities

Define `formCongruenceCount` (polynomial-system congruence count). For n variables, r integral polynomial
equations F_j and integral target m_j, formCongruenceCount(n,r,q,F,m) is the cardinality of x∈(ℤ/qℤ)ⁿ with
F_j(x)=m_j for all j. Require q≥1; q=1 gives1. The raw count is not a density and includes singular solutions.
([Shankar–Shankar–Tang–Tayou](#sstt2022), §4.1 pp.14–16; generic normalization specializes the quadratic
density; Ghosh–Sarnak(9.7),(9.19),(9.22) pp.28–30.)

The basic API consists of the following statements.

- `formCongruenceCount_one`: Modulus1 gives1.
- `formCongruenceCount_no_equations`: With r=0 the count is qⁿ.
- `formCongruenceCount_projection`: For F=X₀,n≥1,r=1 the count is q^{n−1}.
- `formCongruenceCount_periodic`: Shifting targets by q does not change the count.
- `formCongruenceCount_crt`: For coprime positive q,q′ the count at qq′ is the product.

**Checks.**

- n=2,r=1,F=X₀,q=5,m=2 gives5.
- The constant-zero equation with target1 has no solutions mod5.
- Two identical X₀ equations with the same target still give5, not1, for n=2,q=5.

*Needs:* Mathlib `MvPolynomial.eval₂`; Mathlib `Fintype.card`.

Define `formNormalizedCount` (normalized polynomial-system residue mass). For q≥1 put
formNormalizedCount=q^{−(n−r)}formCongruenceCount. The exponent n−r is an integer: redundant equations do not
secretly change the normalization to rank, and r>n does not saturate subtraction at0. The dimension expected by
a nonsingular codimension-r system is part of its hypotheses. ([Shankar–Shankar–Tang–Tayou](#sstt2022), §4.1
p.15, t(p,m,ν)=p^{−ν(n−1)}count; generic codimension-r extension is the elementary normalization.)

The basic API consists of the following statements.

- `formNormalizedCount_nonneg`: The normalized mass is nonnegative.
- `formNormalizedCount_one`: q=1 gives1.
- `formNormalizedCount_crt`: It is multiplicative in coprime positive moduli.
- `formNormalizedCount_projection`: A coordinate projection equation has normalized mass1.

**Checks.**

- The n=2,r=1 coordinate projection at q=5 gives1.
- Repeating that equation with n=r=2 gives mass5.
- n=1,r=2 repeated X₀ equations at q=5 give mass5, using the negative normalization exponent.

*Needs:* Layer 4 `formCongruenceCount`.

Define `formPadicDensity` (polynomial-system p-adic representation density). formPadicDensity(F,m,p) is the
native real limit choice of formNormalizedCount at p^t,t→∞. Require p prime and separately prove limit existence
before using it. It is a representation density of a fiber; it is distinct from a lattice isometry stabilizer
density. Convergence may fail for degenerate systems. ([Shankar–Shankar–Tang–Tayou](#sstt2022), §4.1 definition
of μ_p pp.14–15; Ghosh–Sarnak(9.19) p.30.)

The basic API consists of the following statements.

- `formPadicDensity_eq_of_tendsto`: If normalized prime-power masses tend to L, the density is L.
- `formPadicDensity_nonneg`: A proved finite limit is nonnegative.
- `formPadicDensity_projection`: The coordinate-projection density is1.
- `formPadicDensity_inconsistent`: A constant-zero equation with target1 has density0.

**Checks.**

- n=2,r=1,F=X₀,target2,p=5 has density1.
- F=0,target1,p=5 has density0.
- F=XY,target1,n=2,r=1,p=5 has density4/5, since both factors must be units.

*Needs:* Layer 4 `formNormalizedCount`; Mathlib `Filter.limUnder`.

Define `weightedRealDensity` (weighted real fiber density). For F:ℝⁿ→ℝʳ,targetm and real weightw,
weightedRealDensity is lim_{ε→0+}(2ε)^{−r}∫_{∀j|F_j(x)−m_j|<ε}w(x)dx, implemented by the native limit choice and
with separate existence hypotheses. The symmetric tube uses(2ε)^{-r}. At a regular value, smooth compactly
supported w gives the coarea fiber integral; a singular value needs separate analysis.
([Shankar–Shankar–Tang–Tayou](#sstt2022), §4.2 p.19 μ∞; Ghosh–Sarnak(9.20) p.30, corrected symmetric-tube
factor.)

The basic API consists of the following statements.

- `weightedRealDensity_eq_of_tendsto`: A proved tube limit identifies the value.
- `weightedRealDensity_add`: Add weights when their restrictions to every sufficiently small positive tube are
  integrable and both normalized tube limits exist.
- `weightedRealDensity_smul`: Scalar multiplication commutes with a proved limit.
- `weightedRealDensity_equation_scale`: Scaling a scalar equation and target by nonzero a multiplies the density
  by|a|^{-1}.
- `weightedRealDensity_weight_zero`: A zero weight gives0.

**Checks.**

- n=r=1,F(x)=x,w=1_[0,1],m=1/2 gives1.
- The same equation/weight at m=0 gives1/2.
- At m=2 it gives0.

*Needs:* Mathlib `Filter.limUnder`; Mathlib `MeasureTheory.integral`.

Define `formAdmissible` (congruence admissibility). An integral polynomial f in n variables and integerk are
congruence-admissible when f(x)=k has a solution in(ℤ/qℤ)ⁿ for every positive integerq. CRT reduces this to
prime powers. Compact inverse-limit compatibility identifies it with solubility over everyℤ_p; that
identification requires a proof and is not encoded into the definition. ([Ghosh–Sarnak](#ghoshsarnak2022), §1
p.1–2 and Proposition6.1 p.19; generic vocabulary.)

The basic API consists of the following statements.

- `formAdmissible_projection`: Coordinate projections are admissible for all targets.
- `formAdmissible_of_point`: An integral point implies admissibility.
- `formAdmissible_prime_powers`: Admissibility is equivalent to solubility at every prime power.
- `formAdmissible_target_congruence`: Admissibility implies every single-modulus solubility condition.

**Checks.**

- f=x₁,target2 is admissible.
- f=x²,target2 is not admissible: no square is2mod4.
- f=x²,target1 is admissible.

*Needs:* Mathlib `MvPolynomial.eval₂`.

### 4.3 Quadratic stabilization and maximal lattices

Prove `quadratic_local_stability` (quadratic density stabilization). For a fixed nondegenerate integral
quadratic form Q in n≥5 variables, targetm≠0 and primep, the normalized residue masses have a finite limit
μ_p(Q,m). The finite-level tail is O_Q(p^{2−3 floor(t/2)}), uniformly in m, and |μ_p−1|≤C_Q/p. This individual
O(p^{-1}) bound does not assert absolute convergence of the product over p.
([Shankar–Shankar–Tang–Tayou](#sstt2022), Lemma4.4 and Lemma4.5 with proofs pp.16–17.)

Shankar–Shankar–Tang–Tayou Lemma 4.4 concerns maximal integral lattices, and Lemma 4.5 concerns good primes. The
arbitrary integral quadratic form statement here is a stronger target: first reduce it using the
integral-lattice interfaces, then prove the bad-prime stabilization and its uniform dependence explicitly.

*Needs:* Layer 4 `formPadicDensity`.

Prove `maximal_lattice_local_positivity` (maximal-lattice local positivity). For a maximal integral
nondegenerate quadratic lattice of rankn≥5 and a positive integer m, every p-adic lattice contains an integral
hyperbolic plane. Consequently μ_p(Q,m)≥1/2 and the representation product is bounded below uniformly in m by a
positive constant depending only on the lattice. Use the current IntegralLattices carrier and local form, with
quadratic-space isometries owned by OrthogonalSpinGroups. The integral hyperbolic-plane assertion is the local
splitting contract specified under Exact supplier contracts; the representation-density inequality is proved
here using it. ([Shankar–Shankar–Tang–Tayou](#sstt2022), Lemma4.6 and proof pp.17–18; Corollary4.7 p.18.)

*Needs:* Layer 4 `quadratic_local_stability`.

### 4.4 Markoff residue masses and local calculations

Define `markoffResidueMass` (markoff finite residue mass). For q≥1,
δ_q(k)=q^{-2}#{x∈(ℤ/qℤ)³:x₁²+x₂²+x₃²+x₁x₂x₃=k}. This specializes formNormalizedCount with n=3,r=1. Changing the
sign of x₃ identifies it with the standard minus-sign Markoff form. No convergence or positive density is
assumed. ([Ghosh–Sarnak](#ghoshsarnak2022), (9.7) p.28; (B.1)–(B.2) pp.45–46.)

The basic API consists of the following statements.

- `markoffResidueMass_nonneg`: The mass is nonnegative.
- `markoffResidueMass_one`: Modulus1 gives1.
- `markoffResidueMass_periodic`: It depends only on k modulo q.
- `markoffResidueMass_crt`: It is multiplicative for coprime positive moduli.

**Checks.**

- q=4,k=3 gives0.
- q=8,k=1 gives3/4.
- q=8,k=5 gives9/4; the two odd classes have different masses.

*Needs:* Layer 4 `formNormalizedCount`.

Define `markoffPairMass` (quaternary markoff pair mass). For q≥1 let
δ_q(a,b)=q^{-3}#{x,y∈(ℤ/qℤ)²:g_a(x)−g_b(y)=b²−a²}, g_a(u,v)=u²+v²+auv. This is the representation density of one
equation in four variables, not the mass of a homogeneous zero fiber. ([Ghosh–Sarnak](#ghoshsarnak2022),
(9.19),(9.22) p.30; (B.7) p.47.)

The basic API consists of the following statements.

- `markoffPairMass_one`: q=1 gives1.
- `markoffPairMass_nonneg`: The mass is nonnegative.
- `markoffPairMass_symm`: Interchanging a,b and x,y preserves the mass.
- `markoffPairMass_crt`: It is multiplicative in coprime moduli.

**Checks.**

- q=1,a=4,b=3 gives1.
- q=4,a=4,b=3 gives5/4, not1.
- q=32,a=3,b=5 gives93/64, consistent with valuation4.

*Needs:* Layer 4 `formNormalizedCount`.

Prove `markoff_odd_local_density` (odd-prime markoff densities). For odd prime p and k≠0,4, δ_{p^t}(k)
converges. Write χ for the quadratic character modp, η_j(u)=1_{p^j|u}. Its increment N₁=χ(k−4)(3+χ(k))/p+1/p².
For odd l≥3 the nonzero increments are4p^{−(l+1)/2}χ((k−4)/p^{l−1}) on p^{l−1}|k−4 and
χ(−1)p^{−(l+1)/2}χ(k/p^{l−1}) on p^{l−1}|k. For even l≥2 they are−p^{−(l+2)/2}(4η_{l−1}(k−4)+η_{l−1}(k)) when
p^{l−1} exactly divides k(k−4), and p^{−l/2}(1−1/p)(4η_l(k−4)+η_l(k)) when p^l divides that product; otherwise0.
Thus the good-prime limit is1+N₁, p∥k gives1+3χ(−1)/p, and p∥k−4 gives1−3/p². At p=3 the limit vanishes exactly
for k≡3,6 mod9. The χ(−1) sign is essential. ([Ghosh–Sarnak](#ghoshsarnak2022), PropositionsB.1–B.2 pp.46–47.)

*Needs:* Layer 4 `markoffResidueMass`; `FiniteFieldsAndCharacterSums:FF.1`.

Prove `markoff_two_adic_density` (two-adic markoff densities). For k≠0,4 the sequence δ_{2^t}(k) converges, its
limit is0 iff k≡3 mod4, and otherwise it is≥3/4. For odd k≡1 mod4 the value is(3/8)(1+χ₄(k))(2−χ₈(k)), hence3/4
in class1mod8 and9/4 in class5mod8. If2∥k the value is1. The other higher-valuation explicit cases are not
imported from the erroneous printed table; only their convergence and positive lower bound are targets here.
([Ghosh–Sarnak](#ghoshsarnak2022), LemmasB.7–B.10 and PropositionB.12 pp.48–50.)

*Needs:* Layer 4 `markoffResidueMass`; `FiniteFieldsAndCharacterSums:FF.1`.

Prove `markoff_pair_local_density` (markoff pair local factors). For a,b≥3,a≠b, δ_{p^t}(a,b) has a finite
positive limit for every primep. At odd good primes p∤(a²−4)(b²−4)(a²−b²), it equals1−χ((a²−4)(b²−4))/p². If
both discriminants are units and μ=v_p(a²−b²)≥1, it equals(1+1/p)(1−p^{−μ−1}); if exactly one discriminant is
divisible it equals1+1/p. If η_i=v_p(a_i²−4)≥1 and η=minη_i, the three bad cases are: different
valuations,1+η−(η−1)/p; equal valuationsη=μ,1+η−η/p−χ((a²−4)/p^η)χ((b²−4)/p^η)/p²;
equalη<μ,1+η−(η−1)/p−p^{−(μ−η+1)}(1+1/p). At2, odd a,b with η=v₂(a²−b²) give(3/2)(1−2^{−η−1}); even a and odd b
give5/4 when v₂(a²/4−1)=0 and3/2 when this valuation≥3. The even-even target is its bound
δ₂=θ+O(1),θ=v₂(gcd(a²−4,b²−4)), and convergence for each fixed pair. Finite-level tail constants must retain
their dependence on the discriminant valuations; an absolute pair-uniform O(2^{−B}) bound is false. In
particular, the erroneous intermediate increment table is not used. ([Ghosh–Sarnak](#ghoshsarnak2022),
PropositionsB.4–B.5 pp.47–48; B.14/CorollaryB.15 pp.51–53.)

*Needs:* Layer 4 `markoffPairMass`; `FiniteFieldsAndCharacterSums:FF.1`.

### Examples

- For `waringSeriesCoeff`, a(1)=1 is the initial Euler-product term.
- For `waringSeriesCoeff`, negative coefficients are needed for exact local densities.
- For `waring_series_multiplicative`, the case u=1 leaves the coefficient unchanged.
- For `waring_series_multiplicative`, without coprimality the CRT product identity is not asserted.
- For `waringSingularSeries`, the modulus-zero term has no contribution.
- For `waringSingularSeries`, the series is not replaced by a sum of norms.
- For `waring_series_absolute_convergence`, the constant does not depend on the integer target.
- For `waring_series_absolute_convergence`, the claim does not extend to arbitrary s merely because every
  individual coefficient is finite.
- For `waringSingularIntegral`, the target-frequency sign is negative.
- For `waringSingularIntegral`, the source full-frequency cutoff is symmetric; a one-sided unbounded truncation is
  not substituted.
- For `waring_singular_integral_evaluation`, at d=2,s=3 the ratio isπ/4.
- For `waring_singular_integral_evaluation`, this does not show positivity of any p-adic factor or of the whole
  singular series.
- For `waringCongruenceCount`, finite congruence counts do not impose positive representative restrictions from
  the bounded global Waring count.
- For `waringCongruenceCount`, the singular-density normalization is by q^{s−1}, not by the total number q^s of
  all tuples.
- For `waringLocalFactor`, the e=0 term is not lost.
- For `waringLocalFactor`, a p-adic density is a normalized convergent limit, not an unnormalized finite count.
- For `waring_local_density_limit`, the normalization is p^{e(s−1)}, not p^{es}.
- For `waring_local_density_limit`, nonnegativity alone does not imply strict positivity.
- For `waring_series_euler_product`, a vanishing local factor gives a zero product, not a Hasse principle.
- For `waring_series_euler_product`, strict positivity requires an additional nonsingular local-solubility
  argument at every prime.
- For `waring_major_arc_approximation`, at β=0 the discrepancy is bounded by a constant times q.
- For `waring_major_arc_approximation`, no composite-modulus complete-sum cancellation follows from this
  approximation.
- For `waring_primitive_local_positivity`, at primes dividing d, a solution merely modulo p need not meet the
  stated hypothesis.
- For `waring_primitive_local_positivity`, the explicit lower bound remains positive even when γ>1.
- For `waring_uniform_series_positivity`, no local-global conclusion is claimed for a general form.
- For `waring_uniform_series_positivity`, the quadratic degree does not follow merely from the unproved n=2
  extension of the source’s argument.

### Dependencies

Use Layer 1, Layer 2. Use the native Mathlib APIs listed at each target and the supplier contracts
`FiniteFieldsAndCharacterSums:FF.1`.

Prove the native sum–integral adapter with bounded variation, quantitative absolute-series tails and full-frequency integral tails used in Waring. The singular-integral evaluation uses simplex beta convolution and Fourier inversion of the sine kernel, with symmetric frequency cutoffs. At bad primes prove complete monomial prime-power Gauss blocks, including the corrected two-adic quadratic bases; finite-field Gauss norms do not give these blocks. These are ingredients for the estimates below, not fields of a record assuming the desired asymptotic.

For arbitrary fixed nondegenerate integral quadratic forms, extend the maximal-lattice lifting argument to nonmaximal and dyadic blocks and keep coefficient-valuation losses in a form-dependent constant uniform in the nonzero target. The lemmas of Shankar–Shankar–Tang–Tayou are special-case templates: the maximality and good-prime hypotheses cannot be silently dropped. Establish the integral hyperbolic-plane supplier contract before using maximal-lattice positivity. A single `O(p^{-1})` estimate is insufficient to prove absolute convergence or a positive uniform lower bound for the full product; use the sharper good-prime estimates and the finite bad-prime factors.

Compute the odd-prime Markoff blocks with the `χ(-1)` Gauss factor and the two-adic blocks directly. The fixed-pair dyadic tail depends on the common valuations of `a²−4` and `b²−4`. Prove its valuation-dependent bound before summing over pairs; the family `a=2+2^L`, `b=2+2^{L+1}` rules out an absolute pair-uniform `O(2^{-B})` tail. Reciprocal-product comparisons require bounds on the other local factors as well as the individual two-adic error.

Use IntegralLattices Layer 3 and its Part II integral hyperbolic splitting contract, and compare scalar representation densities with GeometryOfNumbersAndQuadraticArithmetic Layer 3. These lattice inputs preserve the quadratic half-norm convention.

## Layer 5: circle-method representation theorems

Assemble each representation theorem with its own major-arc approximation, minor-arc saving and local
positivity. Weighted fixed quadratic forms, moving Markoff coefficients and prime triples have different
uniformity requirements. Arithmetic density and orbit statements use their separate action supplier; generic
cubic fullness remains conditional on a precise second-moment input.

### 5.1 Positive Waring representations

Define `waringPositiveCount` (positive waring representation count). waringPositiveCount(d,s,m) is the native
finite cardinality of ordered tuples x∈(Fin m)^s satisfyingΣ_i(x_i.val+1)^d=m. For d≥1 it counts all
representations of m by s positive integral d-th powers: every positive coordinate of a solution is at most m.
This is not the nonnegative-variable count and does not identify tuples up to permutations.
([Assing](#assingcircle2022), §6.1 pp.34–39, statements and full proofs.)

d,s,m are natural. The interpretation as all positive representations requires d≥1. At s=0 the count is1 for m=0
and0 otherwise; at m=0,s>0 it is0.

The basic API consists of the following statements.

- `waringPositiveCount_eq_card`: The count is the cardinality of the concrete ordered finite subtype.
- `waringPositiveCount_empty_tuple`: At s=0 it is1 exactly at m=0.
- `waringPositiveCount_zero_target`: At m=0,s>0 it is0.
- `waringPositiveCount_one_variable`: For d≥1,s=1 it is1 iff m is a positive d-th power, and0 otherwise.
- `waringPositiveCount_cutoff`: For d≥1 and m≤P^d, replacing Fin m by Fin P leaves the count unchanged.

**Checks.**

- d=1,s=2,m=4 gives3.
- d=2,s=2,m=5 gives2.
- At s=0 targets0and1 give1and0 respectively.
- d=1,s=2,m=2 gives1, rather than the nonnegative count3.

*Needs:* Mathlib `Fintype.card`; Mathlib `Finset.sum_mul_sum`.

Prove `waring_counting_integral` (waring counting identity). For d≥1,m≤P^d, the integral over AddCircle1 of
powerWeylSum(d,P,α)^s times fourier(−m)(α), with probability Haar measure, equals waringPositiveCount(d,s,m),
cast to complex. The tuples are ordered and positive. Empty s=0 and m=0 are included with the native
zero-th-power convention. ([Assing](#assingcircle2022), §6.1 pp.34–39, statements and full proofs.)

The integer target uses the negative Fourier sign and native normalized Haar measure. There is no limiting
passage in this finite identity.

*Needs:* Layer 2 `powerWeylSum`; Layer 5 `waringPositiveCount`; Layer 2 `torus_coefficient_extraction`; Mathlib
`fourier_add`; Mathlib `fourierCoeff_fourier`.

Prove `waring_classical_minor_arcs` (classical waring minor-arc estimate). Let d≥3,s≥2^d+1 and0<δ<1/10. Put
Q=floor(P^δ),η=P^{−d+δ}. There is C(d,s,δ)>0 such that for every integer P≥2,
∫_{minorArcs(Q,η)}|powerWeylSum(d,P,α)|^s dα≤CP^{s−d−δ/2^d}. The measure is probability Haar on AddCircle1.
([Assing](#assingcircle2022), Lemma6.1 and proof pp.34–35.)

The radii and denominator cutoff are explicit. Strict separation holds for sufficiently large P because3δ<d;
small P are absorbed in C.

*Needs:* Layer 2 `powerWeylSum`; Layer 2 `minorArcs`; Layer 1 `polynomial_weyl_inequality`; Layer 3
`hua_mean_value`; Mathlib `Nat.floor`.

Prove `waring_classical_asymptotic` (classical waring asymptotic). For integers d≥3 and s≥2^d+1 there exist
σ(d,s)>0,C(d,s)>0 and M₀ such that for every m≥M₀, |r^+_{d,s}(m)−[Γ(1+1/d)^s/Γ(s/d)]
ReS_{d,s}(m)m^{s/d−1}|≤Cm^{s/d−1−σ}. Here r^+ is the concrete ordered positive representation count. The source
asserts a positive saving; no numerical optimized exponent is claimed. ([Assing](#assingcircle2022), §6.1
pp.34–39, statements and full proofs.)

The Gamma factor uses the positive-variable archimedean normalization. σ,C,M₀ are independent of m; this is not
a theorem about arbitrary forms or prime variables.

*Needs:* Layer 5 `waringPositiveCount`; Layer 5 `waring_counting_integral`; Layer 5
`waring_classical_minor_arcs`; Layer 4 `waring_major_arc_approximation`; Layer 2
`major_minor_counting_partition`; Layer 4 `waring_singular_integral_evaluation`; Layer 4
`waring_series_absolute_convergence`.

Prove `waring_eventual_representation` (eventual positive waring representation). For d≥3,s≥2^d+1 there exists
M₀ such that every integer m≥M₀ is a sum of s positive d-th powers. The conclusion is existence of an ordered
tuple, not an asymptotic for an arbitrary locally soluble Diophantine problem. ([Assing](#assingcircle2022),
§6.1 pp.34–39, statements and full proofs.)

The theorem uses the uniform strictly positive singular series and the Gamma factor in this particular classical
range.

*Needs:* Layer 5 `waring_classical_asymptotic`; Layer 4 `waring_uniform_series_positivity`; Mathlib
`Real.Gamma_pos_of_pos`; Mathlib `Fintype.card`.

Prove `waring_optimized_minor_arcs` (optimized waring minor arcs). Fix k≥3 and1≤t<k. Set
M=denominatorMajorArcs(floor(N/(2k)),N^(1−k)/(2k)), equivalently q≤N/(2k) and |qα−a|≤N^{1−k}/(2k), with
reduceda/q and circular distance. If k²−t(k−t−1)/(k+1−t)<s≤k(k+1), there isδ(k,t,s)>0 with
∫_{Mᶜ}|Σ_{n≤N}e(αn^k)|^s dα≤C(k,t,s)N^{s−k−δ}. One can take any δ<η−k, where
a=t(t+1),b=k(k+1),η=b−(b−t²−1)(b−s)/(b−a); the ε-loss must be chosen smaller than the margin.
([Assing](#assingcircle2022), Proposition9.2 and Corollary9.3 pp.84–87; Theorem9.4 p.88.)

*Needs:* Layer 3 `improved_hua_moment`; Layer 3 `vinogradov_main_bound`; Layer 2 `torus_coefficient_extraction`;
Layer 2 `denominatorMajorArcs`.

Prove `waring_optimized_asymptotic` (optimized waring asymptotic and eventual representation). For
k≥3,1≤t<k,integer s with k²−t(k−t−1)/(k+1−t)<s≤k(k+1), there areδ,C>0 with R_{s,k}(m)=Γ(1+1/k)^s
S_{s,k}(m)m^{s/k−1}/Γ(s/k)+O_{k,t,s}(m^{s/k−1−δ}). The local range above is satisfied at the minimum s. Hence
all sufficiently large integers are sums of s positivek-th powers. In particular the minimum sufficient integer
is k²+1−max_{1≤t≤k}ceil(t(k−t−1)/(k+1−t)). This is a sufficient bound, not an assertion that G(k) equals it.
([Assing](#assingcircle2022), Theorem9.1 p.83 and completion §9.3 pp.95–96.)

*Needs:* Layer 5 `waring_optimized_minor_arcs`; Layer 4 `waring_refined_major_arcs`; Layer 4
`waring_linear_range_positivity`; Layer 5 `waringPositiveCount`.

### 5.2 Prime-weighted counting

Define `mangoldtTripleCount` (ordered von mangoldt triple count).
mangoldtTripleCount(N)=Σ_{a,b,c≥1,a+b+c=N}Λ(a)Λ(b)Λ(c), using ordered triples. Fourier extraction identifies it
with theN-th coefficient of mangoldtExponentialSum(N,α)^3. There is no division by6. ([Tao, prime circle
method](#taoprimes2015), Theorem2 and §3 first counting display.)

The basic API consists of the following statements.

- `mangoldtTripleCount_small`: ForN≤5 it is0 sinceΛ(1)=0.
- `mangoldtTripleCount_nonneg`: All coefficients are nonnegative.
- `mangoldtTripleCount_fourier`: The ordered triple count is the stated cube Fourier coefficient.
- `mangoldtTripleCount_pos_iff`: It is positive iffN is a sum of three prime powers.

**Checks.**

- N=5 gives0.
- N=6 gives(log2)^3 from(2,2,2).
- N=7 gives3(log2)^2log3 from the three permutations of(2,2,3).

*Needs:* Layer 2 `mangoldtExponentialSum`; Layer 2 `torus_coefficient_extraction`.

Define `ternaryPrimeSeries` (ternary prime singular series). ternaryPrimeSeries(N) is the native product over
primes of1−(p−1)^{-2} whenp|N, and1+(p−1)^{-3} otherwise; nonprimes contribute1. Prove multipliability before
usingtprod. Thep=2 factor gives0 for evenN and2 for oddN. For oddN the product is uniformly bounded below
by2∏_{p≥3}(1−(p−1)^{-2})>0. ([Tao, prime circle method](#taoprimes2015), Theorem2, equation(1), and §3 Euler
factors.)

The basic API consists of the following statements.

- `ternaryPrimeSeries_product`: The displayed sequence over natural indices is multipliable.
- `ternaryPrimeSeries_even`: Even targets have series0.
- `ternaryPrimeSeries_odd_lower`: Odd targets have a positive uniform lower bound.
- `ternaryPrimeSeries_divisibility`: The factor atp is selected byp|N.

**Checks.**

- N=8 has series0, so even targets cannot have the odd main term.
- Atp=2 the factors forN=7,8 are2,0.
- Atp=3 the factors forN=9,7 are3/4,9/8.

*Needs:* Mathlib `tprod`; Mathlib `Multipliable`.

Prove `prime_bilinear_estimates` (exponential type i and type ii estimates). There is an absoluteC≥1 such that
the following inverse estimates hold for M,N≥1,δ∈(0,1],θ∈ℝ/ℤ and a finite product intervalI. TypeI: a bounded
sequencea_m and a real monotone sequenceb_n with bilinear sum>δMN‖a‖∞‖b‖∞ force N≤Cδ^{-2} or a positiveq≤Cδ^{-1}
with ‖qθ‖≤Cδ^{-2}/(MN). TypeII: sum>δ√(MN)‖a‖₂‖b‖₂ forces min(M,N)≤Cδ^{-4} or q≤Cδ^{-2},‖qθ‖≤Cδ^{-4}/(MN).
([Tao, prime circle method](#taoprimes2015), Theorem14 and complete proof §1; Lemmas12–13.)

*Needs:* Layer 1 `kusmin_landau`; Layer 1 `finite_completion`.

Prove `prime_minor_arc_estimate` (von mangoldt minor-arc saving). For everyA>0 there isB>0 such that for
everyN≥3 andα outside arcs q≤(logN)^B, |qα−a|≤(logN)^B/N, theΛ-weighted sum over any subinterval of[1,N] is
O_A(N(logN)^{−A}). Constants in this minor-arc branch are effective. The dependenceB(A) absorbs the logarithms
and inverse powersδ in the bilinear inverse bounds. ([Tao, prime circle method](#taoprimes2015), Proposition18
and complete proof §1.)

*Needs:* Layer 5 `prime_bilinear_estimates`; `SieveMethodsAndPrimePatterns:SV.2/vaughan-type-i-ii`;
`SieveMethodsAndPrimePatterns:SV.2/vaughan-coefficient-energy`.

Prove `prime_major_arc_approximation` (von mangoldt major-arc approximation). For
N≥3,1≤u≤v≤N,q≥1,gcd(a,q)=1,θ=a/q+ξ/q, one has Σ_{u≤n≤v}Λ(n)e(nθ)=μ(q)/φ(q)∫_u^v
e(ξx/q)dx+O_A((q+N|ξ|)N(logN)^{-A}). The implied constant is ineffective. End-point changes of length≤1 are
absorbed in the error. This analytic input is imported from the exact AN Siegel–Walfisz theorem and partial
summation, not from VMV. ([Tao, prime circle method](#taoprimes2015), Proposition24 and complete proof §2.)

*Needs:* `AnalyticNumberTheory:AN.2/siegel-walfisz`; Layer 1 `finite_completion`; `AnalyticNumberTheory:AN.2`.

Prove `vinogradov_three_prime_asymptotic` (vinogradov weighted three-prime asymptotic). For everyA>0 andN≥3,
mangoldtTripleCount(N)=ternaryPrimeSeries(N)N²/2+O_A(N²(logN)^{-A}); the constant is ineffective. For
sufficiently large oddN, the contribution containing a nonprime prime power is O(N^{3/2}(logN)^3), soN is a sum
of three primes. The argument supplies no effective numerical threshold and does not assert the full weak
Goldbach theorem for every oddN>5. ([Tao, prime circle method](#taoprimes2015), Theorems1–2; complete proof §3;
Introduction prime-power removal.)

*Needs:* Layer 5 `mangoldtTripleCount`; Layer 5 `prime_minor_arc_estimate`; Layer 5
`prime_major_arc_approximation`; Layer 5 `ternaryPrimeSeries`; Layer 2 `summable_torus_counting`.

### 5.3 Quadratic weights, expanding regions and Birch

Define `weightedQuadraticCount` (weighted integral quadratic representation count). For integral polynomial Q of
degree2,targetm>0,real compactly supported weightw, weightedQuadraticCount is Σ_{x∈ℤⁿ,Q(x)=m}w(x/√m). The native
tsum has finite support after compact support and m>0 are proved. Weight, equation and target are inputs; no
replacement lattice or theta series is defined. ([Shankar–Shankar–Tang–Tayou](#sstt2022), §4.2 pp.19–20, w_m and
weighted count before Theorem4.9.)

The basic API consists of the following statements.

- `weightedQuadraticCount_zero_weight`: Zero weight gives0.
- `weightedQuadraticCount_add`: Add compact weights at m>0.
- `weightedQuadraticCount_smul`: Scalar multiplication scales the count.
- `weightedQuadraticCount_finite_support`: Compact support and m>0 make the summand finitely supported.
- `weightedQuadraticCount_unary_square`: For Q=x²,m=1 the count is w(1)+w(−1).

**Checks.**

- Q=x²,m=1,w=1_[−2,2] gives2.
- Zero weight gives0 for every Q,m.
- Q=x²,m=4,w=1_[−3/2,3/2] gives2 since the arguments are±1, not±2.

*Needs:* Layer 4 `weightedRealDensity`; Mathlib `MvPolynomial.eval₂`.

Prove `heath_brown_quadratic_asymptotic` (weighted quadratic-form asymptotic). Fix a nondegenerate integral
quadratic form Q in n≥5 variables and w∈C∞_c(ℝⁿ). For every ε>0 and all integers m≥1, the representation Euler
product converges and weightedQuadraticCount(Q,m,w)=μ∞(Q−1,w)m^{n/2−1}∏_pμ_p(Q,m)+O_{Q,w,ε}(m^{(n−1)/4+ε}). The
constant is uniform in m, not in the coefficients of Q or arbitrary basis changes. A bounded family of
derivative seminorms supplies the standard weight-class uniformity. ([Shankar–Shankar–Tang–Tayou](#sstt2022),
Theorem4.9 and Corollary4.10 p.20; [Heath–Brown 1996](#heathbrown1996), Theorem4, author pp.7–8, and
Corollary1, author p.8.)

*Needs:* Layer 5 `weightedQuadraticCount`; Layer 4 `quadratic_local_stability`; Layer 4 `weightedRealDensity`.

Prove `maximal_lattice_eventual_representation` (eventual representation by maximal lattices). A fixed maximal
integral nondegenerate quadratic lattice of rankn≥5 whose real quadratic form represents1 represents every
sufficiently large positive integer. The threshold depends on the lattice. Choose a nonnegative smooth compact
weight with positive real density; the main term exponent n/2−1 exceeds the error exponent(n−1)/4.
([Shankar–Shankar–Tang–Tayou](#sstt2022), Corollary4.7 p.18 and its proof from the weighted asymptotic.)

*Needs:* Layer 4 `maximal_lattice_local_positivity`; Layer 5 `heath_brown_quadratic_asymptotic`.

Define `scaledRegionCount` (integral fiber count in a dilated region). scaledRegionCount(f,m,S,P) is the number
of integerx with f(x)=m and x∈P·S, whereS is a native real Euclidean set andP a real scalar. The definition uses
Nat.card of the native subtype; boundedness ofS proves it finite for every finiteP. Dilation is an image, so
atP=0 the only possible point is0, even if the region contains a neighborhood of0. No division byP is used.
([Niedermowwe](#niedermowwe2010), §1 pp.91–92,R_{1_{PB}}(N), native count formulation.)

The basic API consists of the following statements.

- `scaledRegionCount_finite`: A bounded region gives a finite integer solution subtype.
- `scaledRegionCount_empty`: The empty region gives0.
- `scaledRegionCount_mono`: For boundedS⊆T, the count inS is≤the count inT.
- `scaledRegionCount_zero_scale`: For nonempty boundedS,P=0 gives1 iff f(0)=m, otherwise0.

**Checks.**

- f=0,m=0,S=[−1,1]²,P=0 gives1, not an infinite count.
- f=X₀,m=0,S=[−1,1]²,P=1 gives3.
- An empty region gives0 even for f=0,m=0.

*Needs:* Mathlib `MvPolynomial.eval₂`; Mathlib `Fintype.card`.

Prove `niedermowwe_gaussian_asymptotic` (quadratic gaussian-weight asymptotic). Fix an integral nondegenerate
quadraticF in n≥4 variables, a nonzero integer targetm, a bounded centerx₀ andA>0. PutK=logP and
w_P(x)=π^{-n/2}K^{An}exp(−|x−Px₀|²P^{-2}K^{2A}). For everyε>0 the weighted count is I_{w_P}(m)
S_F(m)+O_{F,m,A,x₀,ε}(P^{(n−1)/2+ε}), whereI is the real oscillatory density ofF−m andS_F is the representation
series. The stated fixed-target version follows from the source; no uniformity in movingF is claimed. The
Gaussian is smooth with rapid decay and has integralP^n, rather than compact support or total mass1.
([Niedermowwe](#niedermowwe2010), §2 weight(1) p.92; Lemmas2.1–2.7 pp.93–100 and Theorem2.8 p.101.)

*Needs:* Layer 2 `summable_torus_counting`; Layer 4 `weightedRealDensity`; Layer 4 `formPadicDensity`.

Prove `niedermowwe_expanding_box` (niedermowwe sharp expanding-box count). Fix an integral nondegenerate
quadraticF in n≥4 variables and nonzero integerm. LetM be a real orthogonal diagonalizing matrix forF, and
choose a fixed bounded boxB such thatMᵀB is aligned with the coordinate axes. For everyD>0, asP→∞,
scaledRegionCount(F,m,B,P)=I_{1_{PB}}(m)S_F(m)+O_{F,m,B,D}(P^{n−2}(logP)^{−D}). The real factor is the density
ofF−m with the actual indicator ofPB, not an asserted positive constant. The theorem itself supplies neither
positivity nor a moving-coefficient estimate. ([Niedermowwe](#niedermowwe2010), Lemmas3.2–3.5 pp.103–108 and
Theorem3.6 p.109.)

*Needs:* Layer 5 `scaledRegionCount`; Layer 5 `niedermowwe_gaussian_asymptotic`.

Prove `birch_single_form_asymptotic` (birch single-form asymptotic). LetF be a fixed integral homogeneous
polynomial of degreed≥2 in n variables. Letσ be the geometric affine dimension of {∇F=0}; if n−σ>(d−1)2^d, then
for a fixed bounded coordinate boxB and P→∞, the zero-fiber count has asymptotic
σ∞(F,B)(∏_pσ_p(F,0))P^{n−d}+O_{F,B}(P^{n−d−δ}),δ>0. The series and oscillatory integral converge absolutely. A
nonsingular real zero in the interior ofB and nonsingular integralp-adic zeros for everyp make the main
coefficient positive and give a nonzero integral zero for largeP. The box is chosen away from0 for that last
conclusion. This is a fixed-form theorem; it does not give a uniform small-variable affine cubic fullness
estimate. ([Browning–Heath-Brown](#browningheathbrown2015), §1 equation(1.2) p.3; Theorem1.2 pp.4–5 and
same-degree specialization; §2 pp.14–16; §§4–8 pp.19–41.)

*Needs:* Layer 5 `scaledRegionCount`; Layer 1 `multivariate_polarization`; Layer 4 `formPadicDensity`; Layer 4
`weightedRealDensity`.

### 5.4 Moving Markoff sectors and the variance argument

Define `markoffSector` (markoff moving-plane sector). For d>0 let S_d⊂ℝ² consist of s₁,s₂≥0 with 0≤s₁²−ds₂²≤1
and 2√d s₂≤s₁≤3√d s₂. It is a compact sector of area C/√d, C=¼log(3/2). Under s₁=2x₁+ax₂,s₂=x₂, d=a²−4, the
original x-region has half this area. The transformed integral lattice satisfies s₁−as₂≡0 mod2, including even
a. ([Ghosh–Sarnak](#ghoshsarnak2022), (9.1)–(9.4), pp.25–26.)

The basic API consists of the following statements.

- `markoffSector_mem`: Membership is exactly the four displayed inequalities.
- `markoffSector_volume`: For d>0 its area is C/√d.
- `markoffSector_compact`: S_d is compact for d>0.
- `markoffSector_origin`: The origin belongs to S_d.

**Checks.**

- (0,0)∈S₁.
- (2,1)∉S₁ because s₁²−s₂²=3>1.
- (1/2,1/4)∈S₁.

*Needs:* Mathlib `MeasureTheory.integral`.

Define `markoffRepresentationCount` (sector-restricted markoff count). For integers a≥3, K≥1 and 1≤k≤K let
r_a(K,k) count integral x₁,x₂≥0 with x₁²+x₂²+ax₁x₂+a²=k and (2x₁+ax₂,x₂)∈√(4K)S_{a²−4}. Implement it as the
finite count in 0≤x_i≤2K and extend it by0 outside 1≤k≤K. The finite bounds lose no point of this sector. A
point counted gives an integral point of the plus-sign Markoff form, conjugate to the usual minus-sign form by
changing one coordinate sign. ([Ghosh–Sarnak](#ghoshsarnak2022), (9.1)–(9.4) pp.25–26.)

The basic API consists of the following statements.

- `markoffRepresentationCount_outside`: The count is0 unless 1≤k≤K.
- `markoffRepresentationCount_eq_sector`: For a≥3 the finite rectangle equals the sector fiber.
- `markoffRepresentationCount_le`: The count is at most(2K+1)².
- `markoffRepresentationCount_point`: A positive count supplies a Markoff integral point.

**Checks.**

- a=3,K=k=14 gives1, from(1,1).
- a=3,K=13,k=14 gives0.
- a=4,K=k=29 gives1, from(2,1); the even-a parity convention is retained.

*Needs:* Layer 5 `markoffSector`; Mathlib `Fintype.card`.

Define `markoffAggregate` (moving-plane aggregate). For integers A,K≥0, b_A(K,k)=Σ_{3≤a≤A,√A≤a}r_a(K,k). The
lower bound3 ensures nondegenerate binary sectors; it is automatic in the asymptotic parameter range. Its
support is 1≤k≤K. ([Ghosh–Sarnak](#ghoshsarnak2022), (9.4), pp.26–27.)

The basic API consists of the following statements.

- `markoffAggregate_zero`: A<3 gives0.
- `markoffAggregate_outside`: Outside1≤k≤K the aggregate is0.
- `markoffAggregate_positive_iff`: It is positive iff some allowed slice count is positive.
- `markoffAggregate_sum`: Exchange the finite sums over a and k.

**Checks.**

- A=2 gives0 for all K,k.
- A=3,K=k=14 gives1.
- K=0 gives0.

*Needs:* Layer 5 `markoffRepresentationCount`.

Define `markoffVariance` (moving-plane variance). For K,A≥0,q≥1 and real c, V(K,A,q,c)=Σ_{1≤k≤K}(b_A(K,k)−c(log
A)δ_q(k))². The endpoint uses c=C=¼log(3/2) and the prescribed slowly growing modulus. The square is taken after
casting the count to ℝ. ([Ghosh–Sarnak](#ghoshsarnak2022), (9.8)–(9.15), pp.28–29.)

The basic API consists of the following statements.

- `markoffVariance_nonneg`: Every variance is nonnegative.
- `markoffVariance_zero_length`: K=0 gives0.
- `markoffVariance_expand`: It equals Σb²−2c logAΣbδ+c²log²AΣδ².
- `markoffVariance_zero_iff`: It vanishes iff all K summands vanish.

**Checks.**

- K=0 gives0.
- A=1 gives0, since no slice occurs and log1=0.
- K=1,A=3,q=1,c=1 gives(log3)².

*Needs:* Layer 5 `markoffAggregate`; Layer 4 `markoffResidueMass`; Layer 4 `markoffPairMass`.

Prove `markoff_sector_first_moment` (sector counts and their first moment). Let ε>0, 3≤a≤A, √A≤a, (log K)²<A≤K^ε
with ε sufficiently small. Uniformly in a, residue class α modm and the slowly growing m of the variance
theorem, the sector count in that class equals2CK/(√(a²−4)m²)+O_ε(K^{3/4+ε}). The unrestricted slice count
is2CK/√(a²−4)+O_ε(K^{1/2+ε}). Summing slices givesΣ_{k≤K}b_A(K,k)=CK logA+O(KA^{-1/2}+A K^{1/2+ε}). The latter
error is absorbed in the stated parameter regime after shrinking ε. The printed unrestricted harmonic-sum error
KA^{-1} is corrected to KA^{-1/2}. ([Ghosh–Sarnak](#ghoshsarnak2022), Lemmas9.2–9.3 and Corollary9.4 pp.26–27;
equation(9.5) p.27.)

*Needs:* Layer 5 `markoffAggregate`; Layer 5 `markoffSector`.

Prove `markoff_diagonal_energy` (markoff diagonal second moment). In the same K,A range,
Σ_{√A≤a≤A}Σ_{1≤k≤K}r_a(K,k)²≤C K logA with an absolute constant for sufficiently largeK. The input binary
estimate isΣ_{k≤K}R_d(k)²≪K/√d+K logK τ(d)/d. ([Ghosh–Sarnak](#ghoshsarnak2022), Lemma9.5 p.29, using
[Blomer–Granville](#blomergranville2006), Theorem2, author p.5; proof §5, pp.19–22.)

*Needs:* Layer 5 `markoffRepresentationCount`.

Prove `markoff_pair_asymptotic` (uniform moving quaternary asymptotic). There exist ε₀,ε₁>0 such that
for(logK)²<A≤K^{ε₁} and distinct a,b∈[√A,A], Σ_{1≤k≤K}r_a(K,k)r_b(K,k)=δ∞^{(K)}(a,b)∏_pδ_p(a,b)+O(K^{1−ε₀}),
uniformly in a,b. Here δ∞ is the symmetric-tube density with factor(2ε)^{-1} on the two original-coordinate
sectors, and the equation is g_a(x)−g_b(y)=b²−a². Its real factor is(4C²K/(ab))(1+O(A^{-1})). This is a
four-variable, moving-coefficient, nonzero-target theorem; the fixed n≥5 quadratic theorem does not provide it.
([Ghosh–Sarnak](#ghoshsarnak2022), (9.17)–(9.21), pp.29–30.)

*Needs:* Layer 4 `weightedRealDensity`; Layer 4 `markoff_pair_local_density`; Layer 5
`markoffRepresentationCount`.

Prove `markoff_pair_truncation` (weighted truncation of markoff pair series). Let Φ(A)=½√(loglogA/logloglogA),
L=floor((logA/loglogA)Φ(A)), B=floor(loglogA/Φ(A)²), and m=∏_{p≤L}p^B, for A sufficiently large. In the
parameter range of the pair theorem, replacing the pair Euler product by δ_m(a,b) in the weighted sum over
distinct a,b costs O((logA)²/Φ(A)). Constants in this averaged target are absolute, but individual local tail
bounds depend on the discriminant valuations. Prove this averaged estimate using valuation-dependent local tails
and a separate treatment of pairs with large common discriminant valuation. ([Ghosh–Sarnak](#ghoshsarnak2022),
(9.23)–(9.29), pp.30–32.)

*Needs:* Layer 4 `markoff_pair_local_density`; Layer 4 `markoffPairMass`.

Prove `markoff_variance_bound` (markoff variance bound). With C=¼log(3/2), Φ,L,B,m as above and(logK)²<A≤K^{ε₁}
for sufficiently small fixedε₁, V(K,A,m,C)≤C₁ K(logA)²/Φ(A) for all sufficiently largeK. The choice Φ tends to∞
and satisfies Φ²≪2^B=o(L); the rounded integers leave the bound unchanged up to fixed constants.
([Ghosh–Sarnak](#ghoshsarnak2022), Proposition9.6 and(9.9)–(9.29), pp.28–32.)

*Needs:* Layer 5 `markoffVariance`; Layer 5 `markoff_sector_first_moment`; Layer 5 `markoff_diagonal_energy`;
Layer 5 `markoff_pair_asymptotic`; Layer 5 `markoff_pair_truncation`.

Prove `markoff_reciprocal_mass` (reciprocal markoff mass estimate). For the same slowly growing m and admissible
integers1≤k≤K (k≢3mod4 and k≢3,6mod9), Σ_k1/δ_m(k)≤C₂K for sufficiently largeK. Consequently
#{admissiblek≤K:δ_m(k)<ε}≤C₂εK for everyε>0. The admissibility characterization is imported from the Markoff
arithmetic owner. ([Ghosh–Sarnak](#ghoshsarnak2022), (9.31)–(9.36), pp.32–33.)

*Needs:* Layer 4 `markoff_odd_local_density`; Layer 4 `markoff_two_adic_density`; Layer 4 `markoffResidueMass`.

Prove `markoff_almost_all_representation` (almost-all markoff representation). As K→∞, the number of admissible
integers k with|k|≤K having no integral point on x₁²+x₂²+x₃²−x₁x₂x₃=k is o(K). For almost all admissible k its
integral points are Zariski dense. The first assertion is an analytic representation endpoint; the second
imports the Markoff orbit-density theorem. The negative-k proof uses its own sector with ratios1/3 and1/2, not
the positive sector unchanged. ([Ghosh–Sarnak](#ghoshsarnak2022), Theorem1.2(ii) p.5; §9.1 pp.32–34; Remark9.1
p.26.)

*Needs:* Layer 5 `markoff_variance_bound`; Layer 5 `markoff_reciprocal_mass`.

Prove `markoff_orbit_growth` (generic markoff class-number growth). For every fixed t≥0, the number of generic
integersk with0<|k|≤K and Markoff orbit count h_M(k)=t is o(K). Thus h_M(k)→∞ along a density-one subset of the
generic admissible integers. This requires the imported orbit/fundamental-set theorem in addition to the
variance argument. ([Ghosh–Sarnak](#ghoshsarnak2022), End of§9 p.34 and Theorem1.1 pp.3–5.)

*Needs:* Layer 5 `markoff_almost_all_representation`.

### 5.5 Affine fibers and cubic invariants

Define `isAffineForm` (essential absolutely irreducible affine form). isAffineForm(f) requires positive total
degree, essential dependence of its leading homogeneous part on every variable, and absolute irreducibility of
f−k for every geometric constantk. In characteristic0 essential dependence is expressed by: if a rational
directional derivative of the leading part vanishes identically, its direction is0. This is equivalent to not
reducing the number of variables by an invertible linear change. The all-geometric-constant convention is
explicit; it is stronger than checking only integral fibers. Perfectness and fullness remain separate predicates
on arbitrary polynomials. ([Ghosh–Sarnak](#ghoshsarnak2022), §1 first paragraph p.1, affine-form convention.)

The basic API consists of the following statements.

- `isAffineForm_degree`: Its degree is positive.
- `isAffineForm_essential`: A vanishing directional derivative of the leading part has zero direction.
- `isAffineForm_fiber`: Every geometric fiber polynomial is irreducible.
- `isAffineForm_affine_equiv`: Invertible integral affine substitution preserves the predicate.

**Checks.**

- The one-variable identityX is an affine form.
- X³ is not an affine form: its zero fiber is reducible.
- X₀ in two variables fails essential dependence although all its fibers are irreducible.

*Needs:* Mathlib `MvPolynomial.homogeneousComponent`; Mathlib `MvPolynomial.pderiv`; Mathlib
`MvPolynomial.eval₂`.

Define `formZariskiDense` (algebraic density of integral fibers). For an integral polynomialf and targetk,
formZariskiDense means that every polynomialg over an algebraic closure ofℚ vanishing on all embedded integral
solutions f(x)=k also vanishes on the entire geometric fiber. This is the polynomial-vanishing characterization
of Zariski density; it uses no analytic topology on the coefficient field. ([Ghosh–Sarnak](#ghoshsarnak2022), §1
pp.1–2, density in the definition of perfectness.)

The basic API consists of the following statements.

- `formZariskiDense_iff`: The value is exactly the stated polynomial-vanishing criterion.
- `formZariskiDense_projection`: A coordinate fiber has dense integral points.
- `formZariskiDense_no_integer_point`: An empty integral fiber with a nonempty geometric fiber is not dense.
- `formZariskiDense_affine_equiv`: An invertible integral affine change preserves density.

**Checks.**

- The line x₁=2 in two variables has dense integral points.
- The two-point fiber x²=1 is entirely integral and is dense.
- x²=2 has geometric points and no integral points, so is not dense.

*Needs:* Mathlib `MvPolynomial.eval₂`.

Define `formPerfect` (perfect affine polynomial). An integral polynomialf is perfect when only finitely many
admissible integersk have a fiber whose integral points are not Zariski dense. This is a predicate on the native
polynomial; geometric irreducibility and essential dependence on all variables are separate hypotheses when
invoking results about affine forms. ([Ghosh–Sarnak](#ghoshsarnak2022), §1 pp.1–2.)

The basic API consists of the following statements.

- `formPerfect_iff`: Only finitely many admissible fibers fail density.
- `formPerfect_of_all_dense`: Density for every admissible target implies perfectness.
- `formPerfect_projection`: Coordinate projections are perfect.
- `formPerfect_implies_almost`: Perfectness implies almost-perfectness when the admissible target counts tend to∞.

**Checks.**

- f=x₁ in two variables is perfect.
- f=x in one variable is perfect, even though its fibers each have only one point.
- f=0 is perfect: its sole admissible target0 has a dense integer lattice.
- f=XY is not perfect. Every nonzero integer k is admissible through (1,k), but XY=k has finitely many
  integral divisor pairs on an infinite geometric curve, so infinitely many admissible fibers fail density.

*Needs:* Layer 4 `formAdmissible`; Layer 5 `formZariskiDense`.

Define `formAlmostPerfect` (almost-perfect affine polynomial). An integral polynomialf is almost perfect when,
in the symmetric interval|k|≤K, the proportion of admissible targets failing integral-point Zariski density
tends to0. The denominator is the number of admissible targets, not2K+1. When admissibility has positive natural
density, this is equivalent to an absolute o(K) exceptional count. ([Ghosh–Sarnak](#ghoshsarnak2022), §1 pp.1–2
and Theorem1.2(ii).)

The basic API consists of the following statements.

- `formAlmostPerfect_iff`: The relative admissible exceptional ratio tends to0.
- `formAlmostPerfect_of_all_dense`: If all admissible fibers are dense, it holds.
- `formAlmostPerfect_projection`: Coordinate projections are almost perfect.
- `formAlmostPerfect_absolute`: With a positive-density admissible set, it is equivalent to an absolute o(K)
  count.

**Checks.**

- f=x₁ in two variables is almost perfect.
- f=x is almost perfect.
- f=0 is almost perfect: the admissible denominator is1, not divergent, and the numerator is0.
- f=XY is not almost perfect: every nonzero admissible fiber fails density, so the exceptional proportion
  tends to1, rather than0.

*Needs:* Layer 5 `formZariskiDense`; Layer 4 `formAdmissible`.

Define `formFull` (full affine polynomial). An integral polynomialf is full when for every naturalT the
proportion of admissible|k|≤K with fewer thanT distinct integral representations tends to0. Express at leastT
representations by a finite set of integral points of cardinality≥T; this correctly includes infinite fibers and
avoids Nat.card’s value0 on infinite types. ([Ghosh–Sarnak](#ghoshsarnak2022), §1 pp.1–2 and fullness claims
pp.7–8.)

The basic API consists of the following statements.

- `formFull_iff`: Every fixed finite point-count threshold has a density-zero exceptional set.
- `formFull_of_infinite_fibers`: Infinite fibers at all admissible targets imply fullness.
- `formFull_projection`: A coordinate projection in dimension≥2 is full.
- `formFull_not_identity`: The one-variable identity is not full, since each target has exactly one point.

**Checks.**

- f=x₁ in two variables is full.
- f=x in one variable is not full, although it is perfect.
- f=0 in one variable is full: target0 has infinitely many points.

*Needs:* Layer 4 `formAdmissible`.

Define `cubicHInvariant` (cubic h-invariant). For a rational homogeneous cubicF, h(F) is the least number of
products L_iQ_i whose sum isF, where L_i are homogeneous linear and Q_i homogeneous quadratic polynomials overℚ.
For F=0 takeh=0. The decomposition always exists by grouping monomials, and h≤n. Equivalently n−h is the maximal
dimension of a rational linear subspace on whichF vanishes. This is a property of the leading homogeneous cubic,
not of lower-degree terms. ([Ghosh–Sarnak](#ghoshsarnak2022), AppendixA,(A.1), p.45.)

The basic API consists of the following statements.

- `cubicHInvariant_zero`: The zero cubic has h=0.
- `cubicHInvariant_le`: A homogeneous cubic in n variables has h≤n.
- `cubicHInvariant_le_iff`: h≤r iff there is a decomposition with r products, allowing zero summands.
- `cubicHInvariant_one_iff`: A nonzero homogeneous cubic has h=1 iff it has a rational linear factor.
- `cubicHInvariant_linear_equiv`: Invertible rational linear substitution preserves h.

**Checks.**

- The zero cubic in three variables has h=0.
- X₁X₂X₃ has h=1.
- X₁³+X₂³ has h=1, using(X₁+X₂)(X₁²−X₁X₂+X₂²), rather than counting variables.

*Needs:* Mathlib `MvPolynomial.IsHomogeneous`.

Define `affineDegreeInvariant` (exact-degree affine restriction invariant). For rational polynomialf and d=1
or2, affineDegreeInvariant(f,d) is the maximum dimension s≤n of an injectively parametrized rational affine
subspace on which the pulled-back polynomial has exact total degreed; take0 if no such subspace exists. l(f) is
d=1 and q(f) is d=2. Constants are excluded from both. The pullback uses a native linear injection A:ℚˢ→ℚⁿ and
translationb. A degree≤2 invariant would be a different notion. ([Ghosh–Sarnak](#ghoshsarnak2022), AppendixA
p.45, with the erroneous sum-of-cubes example excluded.)

The basic API consists of the following statements.

- `affineDegreeInvariant_le`: The value is≤n.
- `affineDegreeInvariant_zero_constant`: For d>0 a constant polynomial gives0.
- `affineDegreeInvariant_ge_iff`: For s≥1 the value≥s iff some dimension≥s admits an injective exact-degree
  restriction.
- `affineDegreeInvariant_affine_equiv`: Invertible rational affine substitutions preserve the value.

**Checks.**

- In two variables f=X₁ has l=2 and q=0.
- f=X₁²+X₂² has q=2 and l=0 overℚ.
- A constant polynomial has l=q=0, despite being degree≤2 on the entire ambient space.

*Needs:* Mathlib `MvPolynomial.totalDegree`; Mathlib `MvPolynomial.eval₂`.

Prove `cubic_invariant_comparisons` (cubic invariant comparisons and regression). For a nonzero rational
homogeneous cubicF, h(F)=1 iffF is reducible overℚ, and n−h(F) is its maximal rational zero-subspace dimension.
For an affine cubicf whose leading part essentially depends on all n variables, a rational hyperplane
restriction of degree≤2 exists iffh=1. The stronger exact-degree q=n−1 conclusion requires that such a
restriction has a nonzero quadratic part. The source’s sum-of-three-cubes example is false:
F=(X₁+X₂)(X₁²−X₁X₂+X₂²)+X₃X₃² givesh≤2, and f(t,1−t,0)=3t²−3t+1 givesq≥1. These identities already refute the
printed h=3,q=0 without any Fermat theorem. ([Ghosh–Sarnak](#ghoshsarnak2022), AppendixA,(A.1)–(A.2) and
example(1), p.45.)

*Needs:* Layer 5 `cubicHInvariant`; Layer 5 `affineDegreeInvariant`.

Specify `cubic_fullness_hypotheses` (announced cubic fullness and markoff growth claims). The source announces,
without a supplied proof, fullness for its nondegenerate irreducible-fiber affine cubics with reducible leading
homogeneous part, and fullness under an unspecified circle-method estimate for tentacled counts f(x)=f(y). It
also conjectures a power-law count C_tK^θ of admissible Markoff targets of each fixed orbit countt, with1/2<θ<1.
These announcements motivate a separate specification of a quantitative tentacled second-moment hypothesis. They
supply no unconditional fullness theorem. The unconditional representation endpoint in this roadmap is the
almost-all Markoff theorem. ([Ghosh–Sarnak](#ghoshsarnak2022), Remark1.3 pp.7–8; Conjecture10.2 pp.34–35.)

*Needs:* Layer 5 `formFull`; Layer 5 `cubicHInvariant`; Layer 5 `markoff_almost_all_representation`; Layer 5
`isAffineForm`.

### Examples

- For `waringPositiveCount`, for d=1,s=2,m=4 the count is3; including zero would give5.
- For `waringPositiveCount`, for d=2,s=2,m=5 the two ordered tuples are(1,2),(2,1).
- For `waring_counting_integral`, for d=1,s=2,m=2,P=2 the integral is1, not3.
- For `waring_counting_integral`, at s=0 the integral is1 at m=0 and0 at a positive integer target.
- For `waring_classical_minor_arcs`, this estimate concerns the unweighted monomial sum.
- For `waring_classical_minor_arcs`, it supplies no TypeI/II or arithmetic-progression estimate for a
  prime-weighted sum.
- For `waring_classical_asymptotic`, at d=3 the stated range starts at s=9; it does not claim the best known
  variable threshold.
- For `waring_classical_asymptotic`, an optimized §9 asymptotic is a distinct source theorem with distinct arcs
  and inputs.
- For `waring_eventual_representation`, a nonnegative series or an upper point bound does not suffice for this
  conclusion.
- For `cubic_fullness_hypotheses`, specify and prove the quantitative tentacled second-moment input before
  deducing any fullness assertion; the stated conjectures are motivation, with no theorem or axiom attached.

### Dependencies

Use Layer 1, Layer 2, Layer 3, Layer 4. Use the native Mathlib APIs listed at each target and the supplier
contracts `AnalyticNumberTheory:AN.2`, `SieveMethodsAndPrimePatterns:SV.2`.

For the optimized Waring range prove positive-trapezoidal-kernel coefficient reconstruction, target-dependent weighted coefficient tails, and the radius and arc comparisons at nonintegral cutoffs. These are stronger than the classical `2^k+1` argument. For primes, combine the exact weighted Siegel–Walfisz and Vaughan contracts with the type I/II estimates, then remove prime powers with an error small relative to the positive odd main term.

The fixed quadratic endpoint requires the complete δ-method input used by [Heath–Brown 1996](#heathbrown1996), Theorem 4 and Corollary 1, author pp.7–8: the native δ-symbol expansion, complete composite-modulus Kloosterman estimates, weighted-frequency integral bounds and Euler-product convergence. For Niedermowwe's Gaussian and sharp-box results prove the Gaussian Poisson normalization, the composite Kloosterman/Salié convention and the rotated-box boundary comparison. In the quadratic sum bound retain the squarefree/squarefull decomposition and the factor `gcd(q₁,m)^{1/2}`. Ordinary Kloosterman estimates belong to the existing modular-form supplier; the required quadratic composite variant and normalization are the analytic adapter here.

The moving Markoff second moment needs a four-variable weighted δ-method estimate uniform in coefficients, target, smoothing thickness and weight derivatives. A fixed-form theorem for rank at least five is not that estimate. Supply the sector-diagonal binary input of [Blomer–Granville](#blomergranville2006), Theorem 2, author p.5 and proof §5, pp.19–22, including the passage from primitive positive-definite forms and counts up to their automorphisms to the sector's lattice count, and prove the sharp-to-smooth comparison with its losses. Separate pairs with large common discriminant valuation before making the averaged local-product comparison at the specified `B` and `Φ(A)`. Preserve every logarithmic loss. The negative-target sector has the same uniformity obligations with ratios `1/3` and `1/2`; the arithmetic-action supplier supplies congruence and orbit facts independently of the unweighted count.

For Birch use the real symmetric-lattice input `N(Z₂)≤C(n)(Z₂/Z₁)^n N(Z₁)` for `0<Z₁≤Z₂≤1`, with `N(Z)=#{u∈ℤⁿ:|u|<aZ, ‖(Lu)_i‖<a^{-1}Z}`, `a>1` and real symmetric `L`. Match its geometry-of-numbers proof and the bounded-degree affine integer-box estimate, then prove the rank-defect Weyl bounds and absolutely convergent residue series. Nonsingular local positivity requires Hensel lifting and regular real coarea; the admissibility predicate alone supplies neither. The generic cubic application requires a fully quantified tentacled second-moment hypothesis and proof before any fullness conclusion, and creates no unconditional theorem or axiom.

For `formZariskiDense`, `formPerfect` and `formAlmostPerfect`, the polynomial `xy` gives a negative control: every nonzero integral target is admissible via `(1,k)`, but has finitely many integral divisor pairs on an infinite geometric curve. Thus those fibers are not dense, and `xy` is neither perfect nor almost perfect. The coordinate projection remains the positive control.

## Layer 6: determinant bounds and representation statistics

Use p-adic determinant divisibility to cover bounded rational points by auxiliary hypersurfaces, then apply the
geometric intersection inputs. Preserve degree and coefficient uniformity in the curve and surface bounds.
Rational symmetries and collision counts give the binary-form statistics, without converting an upper bound into
a positive asymptotic.

### 6.1 Primitive projective representatives and auxiliary covers

Define `boundedProjectivePointCount` (bounded projective point count). boundedProjectivePointCount(F,B) counts
integer vectors x with |x_i|≤B_i, F(x)=0, gcd_i|x_i|=1, and first nonzero coordinate positive. F is a native
integer MvPolynomial in finitely many coordinates; B_i are natural box sizes. The concrete finite carrier uses
coordinate k_i∈Fin(2B_i+1) and x_i=k_i−B_i. For a homogeneous nonzero form, these are unique primitive
representatives of rational projective points, not every scalar multiple or both signs.
([Heath-Brown](#heathbrown2002), §1 pp.553–555 and562; §2 p.564; complete §3 pp.567–575 in the specified arXiv
reprint.)

The definition permits zero box sizes and the zero polynomial for boundary tests; determinant bounds require
B_i≥1 and a homogeneous form irreducible over the specified field. The zero vector is never primitive.

The basic API consists of the following statements.

- `boundedProjectivePointCount_eq_card`: The count equals the native finite subtype cardinality with the displayed
  evaluation/gcd/sign conditions.
- `boundedProjectivePointCount_zero_box`: With every B_i=0 the count is0.
- `boundedProjectivePointCount_one_polynomial`: The constant-one polynomial has count0.
- `boundedProjectivePointCount_scale`: A nonzero integer scalar multiple of F has the same count.
- `boundedProjectivePointCount_mono`: Increasing every box size can only increase the count.

**Checks.**

- For F=X₀ in three coordinates and unit box the count is4.
- For every F the all-zero box has count0.
- For the native form X₀X₂−X₁² and unit box, the count is4.
- For the zero polynomial in three coordinates and unit box the count is13, not26: both signs are not counted.

*Needs:* Mathlib `MvPolynomial.eval`; Mathlib `MvPolynomial.map`; Mathlib `MvPolynomial.totalDegree`; Mathlib
`MvPolynomial.IsHomogeneous`; Mathlib `MvPolynomial.support`; Mathlib `Finset.gcd`; Mathlib `Irreducible`;
Mathlib `Fintype.card`.

Prove `ternary_coefficient_height_alternative` (ternary coefficient-height alternative). For every degree d≥1
there is C_d>0 such that for every primitive-coefficient integral ternary homogeneous form F of degree d
irreducible over ℚ and B≥1, either N(F;B,B,B)≤d² or max|coeff(F)|≤C_dB^{d(d+1)(d+2)/2}. The height is the native
supremum of coefficient absolute values on support, not an unspecified projective or logarithmic height.
([Heath-Brown](#heathbrown2002), §1 pp.553–555 and562; §2 p.564; complete §3 pp.567–575 in the specified arXiv
reprint.)

Primitivity is gcd of all coefficient absolute values equal to1. Irreducibility is after native coefficient
extension ℤ→ℚ; it is not weakened to irreducibility over ℤ for a form with nontrivial content.

*Needs:* Layer 6 `boundedProjectivePointCount`; Mathlib `MvPolynomial.eval`; Mathlib `MvPolynomial.map`; Mathlib
`MvPolynomial.totalDegree`; Mathlib `MvPolynomial.IsHomogeneous`; Mathlib `MvPolynomial.support`; Mathlib
`Finset.gcd`; Mathlib `Irreducible`.

Prove `determinant_auxiliary_cover` (determinant-method auxiliary hypersurface cover). For n≥3,d≥2,ε>0 there are
C(n,d,ε)>0 and D(n,d,ε) such that for every degree-d integral homogeneous F irreducible over ℚ, with
H=max|coeff(F)|≥2, and B_i≥1, set V=∏B_i and T=max_{e∈support F}∏B_i^{e_i}. There is a finite set of integral
homogeneous auxiliary forms G_j of degrees≤D, none divisible by F after native coefficient extension to ℚ,
covering every primitive normalized integer zero in the box, and its cardinality is at most
C(V^d/T)^{d^{−(n−1)/(n−2)}}V^ε(log H)^{2n−3}. C,D are independent of F and the B_i. For H=1 apply the theorem
to2F, giving a log(2H) convention; the unmodified zero logarithm is excluded. ([Heath-Brown](#heathbrown2002),
§1 pp.553–555 and562; §2 p.564; complete §3 pp.567–575 in the specified arXiv reprint.)

This is the exact source quantitative cover, with bounded degree and nondivisibility both essential.
Irreducibility is over ℚ. No smoothness assumption on F is imposed: its singular points are handled separately.
Nondivisibility is over ℚ, not merely over ℤ: otherwise a nonprimitive scalar multiple of F would permit an
auxiliary form defining the entire same hypersurface.

*Needs:* Layer 6 `boundedProjectivePointCount`; Mathlib `MvPolynomial.eval`; Mathlib `MvPolynomial.map`; Mathlib
`MvPolynomial.totalDegree`; Mathlib `MvPolynomial.IsHomogeneous`; Mathlib `MvPolynomial.support`; Mathlib
`Finset.gcd`; Mathlib `Irreducible`.

Prove `uniform_ternary_curve_bound` (uniform rational plane-curve bound). For degree d≥2 and ε>0 there is
C(d,ε)>0 such that for every integral ternary homogeneous F of degree d irreducible over ℚ and every B_i≥1,
N(F;B₁,B₂,B₃)≤CT^{−1/d²}V^{1/d+ε}. In particular N(F;B,B,B)≤C′(d,ε)B^{2/d+ε} for all B≥1. Constants are
independent of every coefficient of F; no positive lower bound or asymptotic is asserted.
([Heath-Brown](#heathbrown2002), §1 pp.553–555 and562; §2 p.564; complete §3 pp.567–575 in the specified arXiv
reprint.)

V and T have the same source definitions as the auxiliary cover. Absolute irreducibility is not required. For
the cubic homogeneous form the cube exponent is2/3+ε; height-one coefficient cases use the corrected logarithmic
convention.

*Needs:* Layer 6 `boundedProjectivePointCount`; Layer 6 `determinant_auxiliary_cover`; Layer 6
`ternary_coefficient_height_alternative`; Mathlib `MvPolynomial.eval`; Mathlib `MvPolynomial.map`; Mathlib
`MvPolynomial.totalDegree`; Mathlib `MvPolynomial.IsHomogeneous`; Mathlib `MvPolynomial.support`; Mathlib
`Finset.gcd`; Mathlib `Irreducible`.

### 6.2 Integral curves and surfaces

Prove `integral_plane_curve_bound` (uniform integral plane-curve bound). For each degreed≥2 andε>0 there
isC(d,ε) independent of all coefficients such that for every integral polynomialf(X,Y) of exact total degreed
irreducible overℚ, andB≥1, #{(x,y)∈ℤ²:|x|,|y|≤B,f(x,y)=0}≤C(d,ε)B^{1/d+ε}. Homogenize and apply the anisotropic
ternary theorem with(B,B,1); the monomial-height parameterT≥B^d. This is an upper bound, not a point-count
asymptotic. ([Heath-Brown](#heathbrown2002), Theorem3,(1.8),p.555 and integral specialization pp.554–555; proof
§§3–4 pp.565–579.)

*Needs:* Layer 6 `uniform_ternary_curve_bound`.

Prove `projective_space_curve_bound` (uniform space-curve bound). An irreducible geometric projective curveC⊆ℙ³
of degreed≥2 has at mostC(d,ε)B^{2/d+ε} rational points of standard primitive height≤B. C need not be defined
overℚ. The uniform constant does not depend onC. Choose a bounded-height projection with finite degree1 onC and
apply the plane-curve estimate; native schemes, degree and generic projection are imported from algebraic
foundations. ([Heath-Brown](#heathbrown2002), Theorem5 p.556; Lemma7 and full proof §4 pp.575–579.)

*Needs:* Layer 6 `uniform_ternary_curve_bound`; `SchemeAndStackFoundations:SF.5/isolated-plane-bezout`;
`SchemeAndStackFoundations:SF.5`.

Prove `surface_linefree_bound` (uniform line-free surface bound). For an integral homogeneousF of degreed≥3 that
is absolutely irreducible overℚ, the rational points of primitive height≤B onF=0 inℙ³ which lie on no geometric
line contained inF=0 number at mostC(d,ε)B^{52/27+ε}, uniformly inF. Removing only a chosen list of obvious
rational lines is insufficient; the geometric line locus defines the count. ([Heath-Brown](#heathbrown2002),
Theorem6 p.557; complete §6 proof pp.581–583.)

*Needs:* Layer 6 `uniform_ternary_curve_bound`; `SchemeAndStackFoundations:SF.5/isolated-plane-bezout`;
`SchemeAndStackFoundations:SF.5`.

Prove `surface_all_points_bound` (uniform surface point bound). For every degreed≥2,ε>0, an absolutely
irreducible integral formF in four variables has boundedProjectivePointCount(F,B)≤C(d,ε)B^{2+ε}. The result
includes points on lines, unlike the line-free estimate. It is uniform in coefficients and remains only an upper
bound. ([Heath-Brown](#heathbrown2002), Theorem9 p.559; quadratic §5 pp.579–581 and general §6 pp.583–585.)

*Needs:* Layer 6 `surface_linefree_bound`; Layer 6 `projective_space_curve_bound`; Layer 6
`boundedProjectivePointCount`; `SchemeAndStackFoundations:SF.5`.

### 6.3 Binary-form representations and collisions

Define `binaryFormEquivalent` (equivalence of binary-form representations). For rational binary formG and
integral vectorsx,y, binaryFormEquivalent(G,x,y) means that some invertible rational linear mapM preservesG
identically and sendsx toy. The map need not preserve the entire integer lattice. This is exactly the
equivalence relation used by Heath–Brown’s representation statistics; equality ofG-values alone is weaker.
([Heath-Brown](#heathbrown2002), Definition before Theorem8 p.558; §7 lines and automorphisms pp.588–589.)

The basic API consists of the following statements.

- `binaryFormEquivalent_refl`: Every integral vector is equivalent to itself.
- `binaryFormEquivalent_symm`: Inversion of the rational symmetry reverses equivalence.
- `binaryFormEquivalent_trans`: Composition proves transitivity.
- `binaryFormEquivalent_value`: Equivalent representations have equalG-values.
- `binaryFormEquivalent_zero`: Zero is equivalent only to zero.

**Checks.**

- ForG=X³+Y³,(1,0) and(0,1) are equivalent by swapping coordinates.
- For the sameG,(1,1) and(2,0) are not equivalent because their values are2 and8.
- Even forG=0,zero is not equivalent to(1,0), sinceM is invertible.

*Needs:* Mathlib `MvPolynomial.eval₂`.

Prove `binary_form_representation_statistics` (binary-form value and collision bounds). LetG∈ℤ[X,Y] be a fixed
homogeneous binary form of degreed≥3 with no geometric linear factor of multiplicity≥d/2 andG(1,0)>0. Its
rational linear symmetry group is finite of order≤d·d!. The number of positive integersm≤X represented byG is
bounded above and below by positiveG-dependent multiples ofX^{2/d}. For everyε>0 at mostC(G,ε)X^{52/(1+26d)+ε}
have two inequivalent integral representations in binaryFormEquivalent. Constants depend onG and may be
ineffective through Roth. This supplies the analytic transfer to arithmetic statistics, without re-planning a
generic statistical framework. ([Heath-Brown](#heathbrown2002), Theorem8 p.558; full §7 pp.585–589.)

*Needs:* Layer 6 `binaryFormEquivalent`; Layer 6 `surface_linefree_bound`;
`DiophantineApproximationAndTranscendence:DT.1/roth-theorem-lower-bound-form`.

### Examples

- For `boundedProjectivePointCount`, at F=X₀ in three coordinates and B=(1,1,1) the count is4, not8 or9.
- For `boundedProjectivePointCount`, multiplying F by a nonzero integer leaves its zeros and count unchanged.
- For `ternary_coefficient_height_alternative`, scaling F changes coefficient height but not N, so coefficient
  primitivity is essential.
- For `ternary_coefficient_height_alternative`, the theorem is a quantitative alternative, not a positive point
  asymptotic.
- For `determinant_auxiliary_cover`, the theorem covers points by bounded-degree proper intersections, not by
  forms whose degrees grow with height.
- For `determinant_auxiliary_cover`, at coefficient height1 the expression log H=0 cannot be used as a cardinality
  bound.
- For `uniform_ternary_curve_bound`, the estimate is uniform in F. Reducible forms containing lines do not satisfy
  the irreducibility hypothesis.
- For `uniform_ternary_curve_bound`, no local-solubility conclusion follows from this upper bound.

### Dependencies

Use the native Mathlib APIs listed at each target and the supplier contracts
`DiophantineApproximationAndTranscendence:DT.1`, `SchemeAndStackFoundations:SF.5`.

The determinant proof requires native projective Bézout, bounded-minor integral kernel vectors, the unit-derivative p-adic implicit multivariable graph, determinant valuation and monomial counts, and the prime-selection estimate of Heath-Brown's Lemma 4. Prove those adapters using existing polynomial, integer matrix and p-adic carriers. The auxiliary cover is a conclusion, not a bundled premise. The logarithmic coefficient bound uses `log(2H)` and excludes nondivisibility only over the rational coefficient field.

Use the independent degree-controlled projection, section and Fano-locus contracts in the supplier section for the ambient projective curve and surface statements. State the excluded line locus before applying a line-free bound. The binary statistics argument requires its root-multiplicity estimate and rational symmetry group comparison; equivalent representations are defined by a rational invertible map preserving the polynomial identically. Upper bounds here do not imply a positive density or an asymptotic.

## Downstream consumers

Analytic number theory consumes the finite character bounds and exponential bilinear estimates.
Arithmetic statistics consumes the coefficient-uniform determinant bounds and binary collision estimate.
Geometric circle methods consume the independent function-field minor-count theorem. Waring, prime,
quadratic and Markoff applications use the same Fourier convention but retain their own weights,
local-density ranges and uniformity in parameters.

## References

Page numbers below use the linked version. An author reprint is cited in its own pagination;
no identification with a different published pagination is intended.

<a id="bennettsiksek2020"></a>

- **Bennett–Siksek**. Michael A. Bennett and Samir Siksek, [A conjecture of Erdős, supersingular primes and
short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf). Annals of
Mathematics 191 (2020), 355–392; published version of record.

<a id="mathlibpin"></a>

- **Mathlib**. The Mathlib contributors, [Pinned characters, Möbius arithmetic and finite-interval
APIs](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib).
Commit 082e2d37e8b0463410cdb532e111cd43d5a66174

<a id="taodivisor2008"></a>

- **Tao, divisor bound**. Terence Tao, [The divisor
bound](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/). Author post, 23 September 2008, updated 24
September

<a id="polymath2014"></a>

- **Polymath**. D. H. J. Polymath, [New equidistribution estimates of Zhang
type](https://msp.org/ant/2014/8-9/ant-v8-n9-p03-s.pdf). Algebra & Number Theory 8 (2014), no. 9, 2067–2199;
published version

<a id="bdg2016"></a>

- **Bourgain–Demeter–Guth**. Jean Bourgain; Ciprian Demeter; Larry Guth, [Proof of the main conjecture in
Vinogradov’s Mean Value Theorem for degrees higher than
three](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n2-p07-p.pdf). Published Annals of
Mathematics 184 (2016), 633–682; revised 18 April 2016

<a id="assingcircle2022"></a>

- **Assing**. Edgar Assing, [The circle method and Waring’s
problem](https://www.math.uni-bonn.de/people/assing/lectures/circle_method.pdf). Author-hosted Bonn winter-term
2021/22 lecture notes, dated 1 April 2022, 120-page PDF

<a id="heathbrown2002"></a>

- **Heath-Brown**. D. R. Heath-Brown; appendix by J.-L. Colliot-Thélène, [The density of rational points on
curves and surfaces](https://arxiv.org/pdf/math/0405392). Annals155(2002),553–598, as reproduced in arXiv
math/0405392v1 dated20May2004; this reprint is not independently collated with the publisher scan.

<a id="baierexponentiallectures"></a>

- **Baier**. Stephan Baier, [Lectures on exponential
sums](https://www.atmschools.org/sites/default/files/Baier-Lectures_on_expo_sums.pdf). Author lecture notes;
undated 35-page supplied PDF

<a id="taostationary2007"></a>

- **Tao, oscillatory integrals**. Terence Tao, [Lecture notes 8: oscillatory
integrals](https://www.math.ucla.edu/~tao/247b.1.07w/notes8.pdf). 247B, Winter 2007, author notes

<a id="fimr2012"></a>

- **Friedlander–Iwaniec–Mazur–Rubin**. John Friedlander; Henryk Iwaniec; Barry Mazur; Karl Rubin, [Spins of
prime ideals](https://arxiv.org/pdf/1110.6331v2). Author arXiv v2, 2012; page numbers refer to this author
version

<a id="koymansmilovic2018"></a>

- **Koymans–Milovic**. Peter Koymans; Djordjo Milovic, [Joint distribution of
spins](https://arxiv.org/pdf/1809.09597v1). Author arXiv v1, 25 September 2018; not collated with Duke 170
(2021)

<a id="skorobogatovsofos2023"></a>

- **Skorobogatov–Sofos**. Alexei Skorobogatov; Efthymios Sofos, [Schinzel Hypothesis on average and rational
points](https://eprints.gla.ac.uk/292484/1/292484.pdf). Published Inventiones 231 (2023), 673–739

<a id="browningsawin2020"></a>

- **Browning–Sawin**. Tim Browning; Will Sawin, [A geometric version of the circle
method](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p04-s.pdf). Published Annals191
(2020),893–948

<a id="bcct2005"></a>

- **Bennett–Carbery–Christ–Tao**. Jonathan Bennett; Anthony Carbery; Michael Christ; Terence Tao, [Finite bounds
for Hölder–Brascamp–Lieb multilinear inequalities](https://arxiv.org/pdf/math/0505691). Author v1,31 May2005;
published Math. Res. Lett.17(2010),647–666

<a id="bbfl2018"></a>

- **Bennett–Bez–Flock–Lee**. Jonathan Bennett; Neal Bez; Taryn C. Flock; Sanghyuk Lee, [Stability of the
Brascamp–Lieb constant and applications](https://arxiv.org/pdf/1508.07502v2). Author v2,22 May2018; published
Amer. J. Math.140(2018),543–569

<a id="bd2015"></a>

- **Bourgain–Demeter, parabola**. Jean Bourgain; Ciprian Demeter, [The proof of the ℓ² decoupling
conjecture](https://annals.math.princeton.edu/wp-content/uploads/annals-v182-n1-p09-p.pdf). Published
Annals182(2015),351–389

<a id="sstt2022"></a>

- **Shankar–Shankar–Tang–Tayou**. Ananth N. Shankar; Arul Shankar; Yunqing Tang; Salim Tayou, [Reductions of K3
surfaces and abelian varieties](https://web.math.princeton.edu/~yunqingt/ArithGSpin.pdf). Author version;
locators are its 48-page pagination

<a id="ghoshsarnak2022"></a>

- **Ghosh–Sarnak**. Amit Ghosh; Peter Sarnak, [Integral points on Markoff type cubic
surfaces](https://arxiv.org/pdf/1706.06712v3). Author final arXiv v3, 30 May 2022; 55-page pagination, not
collated with the published text

<a id="taoprimes2015"></a>

- **Tao, prime circle method**. Terence Tao, [254A, Notes 8: The Hardy–Littlewood circle method and Vinogradov’s
theorem](https://terrytao.wordpress.com/2015/03/30/254a-notes-8-the-hardy-littlewood-circle-method-and-vinogradovs-theorem/).
Public author blog post, 30 March 2015.

<a id="niedermowwe2010"></a>

- **Niedermowwe**. N. Niedermowwe, [The circle method with weights for the representation of integers by
quadratic forms](https://ftp.pdmi.ras.ru/pub/publicat/znsl/v377/p091.pdf). Published Zapiski Nauchnykh Seminarov
POMI377(2010),91–110

<a id="browningheathbrown2015"></a>

- **Browning–Heath-Brown**. T.D. Browning; D.R. Heath-Brown, [Forms in many variables and differing
degrees](https://arxiv.org/pdf/1403.5937v2). Author v2,2 February2015; PDF date30May2018; published
JEMS19(2017),357–394

<a id="dukeimamoglutoth2016"></a>

- **Duke–İmamoğlu–Tóth**. William Duke; Özlem İmamoğlu; Árpád Tóth, [Geometric invariants for real quadratic
fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf). Published
Annals184(2016),949–990

<a id="bdnondegeneratecurves2015"></a>

- **Bourgain–Demeter, nondegenerate curves**. Jean Bourgain; Ciprian Demeter, [ℓ² decouplings for hypersurfaces
with nonzero Gaussian curvature and nondegenerate curves](https://arxiv.org/pdf/1409.1634v2). Author v2;
published JEMS19(2017),483–506


<a id="bctrestriction"></a>

- **Bennett–Carbery–Tao**. Jonathan Bennett; Anthony Carbery; Terence Tao, [On the multilinear restriction and Kakeya conjectures](https://www.maths.ed.ac.uk/~carbery/analysis/papers/Carbery/MRKbct_revised7.pdf). Author version, Theorem 1.16, p.6; §2, pp.7–9.

<a id="heathbrown1996"></a>

- **Heath–Brown 1996**. D. R. Heath-Brown, [A new form of the circle method, and its application to quadratic forms](https://ora.ox.ac.uk/objects/uuid:bbd3c62f-f010-44b5-8be5-87e903fb0084/files/m7ec02df6e1b8303a66e7a6015ecb6044). Public author version, Theorem4, pp.7–8; Corollary1, p.8. Published J. reine angew. Math. 481 (1996), 149–206; locators here use the author pagination.

<a id="blomergranville2006"></a>

- **Blomer–Granville**. Valentin Blomer; Andrew Granville, [Estimates for representation numbers of quadratic forms](https://dms.umontreal.ca/~andrew/PDF/quadraticforms.pdf). Public author draft dated 27 June 2006, Theorem2, p.5; proof §5, pp.19–22. Published Duke Mathematical Journal 135 (2006), 261–302; locators here use the author pagination.
