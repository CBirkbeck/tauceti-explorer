# Locally analytic distributions, growth and scalar Mellin evaluation

**Current checkpoint:** 214 unchecked nodes: 7 definitions, 22 constructions,
123 lemmas, 41 theorems and 21 comparisons; 122 API items, 103 packet tests,
15 planets and 248 baseline citations. Ten gaps, six requests, two inherited
source findings and zero planned or closed stages remain. Every stage L0–L4
is partial. This continuation adds fifteen L1/L3 nodes; all 199 prior nodes
are preserved. Numerical summaries and completion statements in the earlier
checkpoint developments below are historical.

## One-variable scalar Mellin checkpoint (Codex codex-yAUVaO)

This continuation adds six L1 and nine L3 declarations. It preserves every
previous node, including the thirteen L4 decomposition declarations. The new
module is `TauCeti/NumberTheory/Padics/Mellin`, namespace `TauCeti.Mellin`.
The series and measure carriers are native Mathlib objects. Character
representability, the component charts and their universal character belong to
PadicMeasuresIwasawaAlgebras L0a. Generic analytic-family actions remain in LAD
L4, as required by the accepted RS-16 restructuring.

### Sources and the boundary of this read

The fresh source reads are Rodrigues Jacinto–Williams,
[arXiv:2309.15692v2](https://arxiv.org/pdf/2309.15692v2), §§3.7–3.8,
pp. 23–26, and §5.3, pp. 34–35; and Colmez,
[*Fonctions d'une variable p-adique*](https://webusers.imj-prg.fr/~pierre.colmez/fonctionsdunevariable.pdf),
§I.6, pp. 27–28, §II.2 including the proofs on p. 30, and §II.4,
pp. 34–36. Remark 3.47 describes character evaluation on the components of
weight space and the clearing-factor expression for a pseudomeasure. The
formula in §5.3 fixes the unshifted branch parameter. Colmez supplies the
open-disc coefficient model and the local-character context. The six native
series adapters below are explicitly worker decompositions of estimates used
by those results; the papers do not give them six separate numbered statements.

The pinned-library audit already distinguishes the native one-dimensional
continuous-character correspondence from a representing rigid space. The
latter is an imported request, so this checkpoint makes no claim that a
function on coefficient-field points constructs that space. It also does not
claim a fresh read of the Schneider–Teitelbaum, Loeffler, Colmez–Nizioł,
Pilloni, BCGP or Pan passages. Their assigned work stays in the coverage lists.

### L1: native series, radius and evaluation

Let K be a finite extension of Q_p with the normalized ultrametric absolute
value. The elementary series statements hold more generally over a complete,
nontrivially normed ultrametric field. Write F=Σ a_n T^n for a native power
series. In this section an **open-disc series** means that ||a_n||R^n tends to
zero for every real radius 0<R<1. This is the native restrictedness predicate at
each radius, and is the coefficient model of the already planned R⁺. Write
E(F,t) for Mathlib's scalar formal-multilinear-series sum of these coefficients.
Analytic interpretations always require ||t||<1; the underlying total sum
operation does not assert convergence at boundary points.

`L1/open-disc-native-radius` compares this model with the native analytic
radius. Restrictedness at S<1 bounds ||a_n||S^n. The native scalar coefficient
norm and radius bound then give radius at least S, hence at least 1. This
comparison reuses `FormalMultilinearSeries.ofScalars` and its sum, rather than
planning another summation or analyticity theory.

`L1/open-disc-summability` makes the pointwise convergence obligation explicit.
For ||t||<1 choose ||t||<S<1. The terms have norms bounded by
||a_n||S^n(||t||/S)^n and tend to zero. Completeness and the nonarchimedean
summability criterion give a sum. The baseline index records the
multiplicative generating declaration; its source explicitly generates the
additive summability theorem. The geometric series is a useful boundary test:
it converges on this open disc, while its terms at t=1 are constantly one.

`L1/open-disc-uniform-tail` strengthens convergence for later interchange of
limits. If 0<R<S<1, M≥0 and ||a_n||S^n≤M for all n, then, for ||t||≤R,

‖E(F,t) − Σ_{n<N} a_n t^n‖ ≤ M(R/S)^N.

Every tail term has this bound; finite ultrametric sums and their limit retain
it. Thus the polynomial truncations converge uniformly on the smaller closed
disc. This argument uses a coefficient estimate and makes no compactness
assumption on that disc. At N=0 it bounds the whole value by M; the monomial
T^N tests the location of the first omitted term.

`L1/open-disc-evaluation-analytic` applies the native analyticity theorem on
the extended-metric ball of the scalar series' radius. It states precisely
that E(F,−) is analytic at every point with norm less than one.
`L1/open-disc-evaluation-mul` uses the native product-of-sums result and the
finite fibres i+j=n to identify the Cauchy product. Evaluation preserves
multiplication there; additivity and scalar linearity follow from summability.
These laws are what allow clearing relations to survive evaluation.

`L1/open-disc-evaluation-map` is the coefficient-extension adapter. If φ:K→K′
is an isometric field homomorphism into a complete ultrametric field, then

E(map(φ,F),φ(t)) = φ(E(F,t)) for ||t||<1.

The isometry preserves restrictedness, and continuity transports the finite
partial-sum limit. Identity and composition reduce to the native power-series
map laws. This scalar statement does not construct extension of locally
analytic distribution spaces, a remaining L3 target.

The suggested file includes four additional native-evaluation examples: the
zero series, a linear polynomial a+bT, the geometric series with value
(1−t)⁻¹ inside the disc, and nonsummability of the constant-one terms at the
boundary. These support the series adapters; they do not increase the packet's
definition/construction test count.

### L3: a Mellin component on an imported chart

`L3/finite-character-component-mellin` takes as input a compact space G, a
finite discrete set Δ, an imported chart H:G≃Δ×Z_p and a function ν:Δ→K. In
character-space applications H is a group chart and ν is a finite character;
the adapter itself needs only the continuous chart and the finite value
function. For a native bounded measure μ on G put

F_{μ,ν,H}(T) = Σ_{n≥0} μ(g ↦ ν(H(g)_Δ) binom(H(g)_Z,n)) T^n.

The binomial value is transported by the native algebra map Z_p→K. Its test
function is continuous: the finite factor is discrete and the Mahler function
is native and continuous. Apply μ to each such function, then use the native
power-series coefficient constructor. This is a component adapter of the
existing bounded Amice transform. It does not redefine bounded measures or
construct the character chart.

The construction's six API entries specify its constructor, coefficient
projection, additivity in μ, scalar linearity in μ, the Dirac-mass formula, and
the zeroth coefficient μ(ν∘H_Δ). Its four tests distinguish the finite factor
and the generator coordinate: a zero measure gives zero; the atom at (δ,0)
gives the constant ν(δ); the atom at (δ,1) gives ν(δ)(1+T); and a singleton
finite factor with ν=1 gives exactly the native bounded Amice transform.
The first new L3 planet is **Component Mellin transform**.

`L3/component-mellin-coefficient-bound` fixes the boundedness proof. If C≥0
bounds every ||ν(δ)||, then

||coeff_n(F_{μ,ν,H})|| ≤ ||μ|| C.

Here ||μ|| is the native continuous-linear-functional operator norm. The
Mahler function has sup norm one, and the bounded scalar action gives the same
upper bound after transport to K. Thus its weighted pullback has sup norm at
most C. For a finite character in a splitting field, C=1 is available.

`L3/component-mellin-open-disc` multiplies this uniform coefficient bound by
R^n for each R<1 and applies the restrictedness criterion. Analytic evaluation
follows from the L1 adapter. This is the forward bounded-measure comparison.
The converse, including finite-character inversion and its topology, remains
to be derived from the exact PMIA `L2/field-bounded-amice-isometry` node and the
requested finite-component interface.

`L3/component-mellin-evaluation` is the scalar Mellin identity. For ||t||<1,
let κ_t be the native additive character on Z_p with κ_t(1)=1+t. Then

E(F_{μ,ν,H},t) = μ(g ↦ ν(H(g)_Δ) κ_t(H(g)_Z)).

The native character is the Mahler series with coefficients t^n. Its weighted
pullback is uniformly summable in the continuous-function norm, with term
norms at most C||t||^n. Apply the native measure's continuous linear map to
this sum. The coefficient formula identifies the resulting scalar series.
When H and ν have their imported group meanings, the right side is integration
against the corresponding character. At t=0 it is the finite-character mass;
for an atom at the generator it is ν(δ)(1+t).

### Arithmetic branches and their domain

`L3/branch-mellin` defines B_{F,q}(s)=E(F,κ_q(s)−1), where ||q||<1 and
s∈Z_p. It uses native p-adic exponentiation through the character κ_q. The
construction's API is the defining formula, its constructor, the value
B(0)=coeff_0 F, the value B(1)=E(F,q), and additivity in F. Its four tests are
zero F, constant F, B_{T,q}(1)=q, and B_{1+T,q}(0)=1. The planet is
**Mellin branch**.

`L3/branch-coordinate-domain` supplies the missing domain condition:
||κ_q(s)−1||≤||q||<1. Remove the constant term of the native Mahler expansion;
all remaining terms have norm at most ||q||^n≤||q||. The ultrametric limit
retains the bound. `L3/branch-integer-evaluation` then gives
B_{F,q}(n)=E(F,(1+q)^n−1) for n≥0 by the character law.

In RJW's standard odd-prime unit chart take γ=1+p, q=γ−1 and ν=ω^i. This gives
Mel_{μ,i}(s)=∫ω(x)^i〈x〉^s dμ. At p=2 the requested chart uses the finite
factor {±1}, principal units 1+4Z_2 and γ=5. No odd-prime component count is
asserted there. Recovering x^k also requires k≡i modulo p−1, or the appropriate
dyadic parity. The chart-to-arithmetic-character comparison is an explicit
supplier obligation. The zeta-function shift s↦1−s belongs to the downstream
Dirichlet p-adic L-function normalization; it is not inserted in this branch.
Local analyticity and weight derivatives, including their log(γ) factor,
remain to be decomposed separately.

### Clearing factors and meromorphic overlap

`L3/meromorphic-mellin-clearing` constructs the chart expression
Q_{F,D}(t)=E(F,t)/E(D,t), with mathematical domain ||t||<1 and E(D,t)≠0.
For an actual PMIA pseudomeasure λ cleared by ([a]−[1]), F comes from the
genuine bounded-measure numerator and D represents κ_t(a)−1. PMIA owns those
numerators and their algebraic cross-product relations. LAD owns the analytic
expression and its eventual gluing on character components.

Its API comprises the constructor, quotient formula, the guarded identity
E(D,t)Q=E(F,t), denominator-one compatibility, and zero numerator. The four
tests are Q_{F,1}=E(F,t), Q_{1,T}=t⁻¹ at t≠0, Q_{T,T}=1 on the punctured
disc, and E(T,0)=0 excluding the trivial character from that chart. A total
field division operation has a value at zero denominator, but that value is
not asserted to be a pseudomeasure evaluation. A removable expression on a
punctured disc is not by itself an extension theorem. The planet is
**Meromorphic Mellin evaluation**.

`L3/meromorphic-clearing-independence` assumes four open-disc series with
FD′=F′D. At a point where both evaluated denominators are nonzero, evaluation
multiplicativity gives Q_{F,D}=Q_{F′,D′}. This is one overlap lemma, conditional
on the exact imported algebraic relation. Geometric gluing, genuine clearing
denominators and pole-order bounds still need their own declarations. A
generator clearing factor can have its exceptional zero at the trivial
character; a general clearing element can vanish at additional characters,
so the domain keeps the entire nonvanishing condition.

### What this checkpoint leaves open

All five stages are partial. L3 now has a bounded scalar entry point. Its full
unbounded Mellin equivalence still needs the finite-factor decomposition of
locally analytic functions and their duals, transported through the existing
L1 Amice equivalence, with its Fréchet topology. Twists, weight derivatives,
multivariable/ray-class functoriality and analytic-versus-adic comparison are
explicit remaining work. The geometric disc and gluing interface is imported
from AdicSpaces Layer 5.

L1's earlier source-decomposed status applied to the older source scope. The
new Colmez–Nizioł Appendix A assignment and refinement of its inherited
composite APIs require partial status. L0 must include the appropriate
nonarchimedean locally convex/left-heart setting, with spherical completeness
or the precise outer-term separability assumptions. L1 must include the
surjective derivative on LA(Z_p) without continuous section and the associated
tR⁺ nonsplitting input. These statements are not derived in this checkpoint.

L4 retains every earlier decomposition node. RT-AREA-iwasawa-2 and
RT-AREA-iwasawa-5 remain unresolved: the new derived finite-slope input must
specify projective Banach complex representatives and compact endomorphisms,
the nonalternating product characteristic series, homotopy/localization
compatibility, corrected slope endpoints and Stein/quasi-Stein descent.
Pilloni §13, BCGP 2021 §6.1.1, BCGP 2025 §§2.2/4.6 and Pan Example 2.2.2 are
assigned sources still to read, rather than citations validated by this
continuation. Solid/discrete-module higher Coleman machinery stays outside
this Banach-complex input.

## Layers L0–L2 (Claude Code, session cc-39fac3)

Library module: `TauCeti/NumberTheory/Padics/LocallyAnalytic`. The sources are:
- Colmez, *Fonctions d'une variable p-adique* (author's PDF): §§I.4, I.5, II.1–II.4.
- Rodrigues Jacinto–Williams, arXiv:2309.15692v2: §3.7 and Appendix B.
- Schneider–Teitelbaum, *p-adic Fourier theory*, arXiv:math/0102012: §1.

RS-16's narrowed keeps are followed, and bounded measures are imported from PadicMeasuresIwasawaAlgebras.

**L0: Banach spaces of locally analytic functions.**
- `disc-analytic-functions`: An(B(a, r), L). The Gauss valuation is multiplicative and satisfies the maximum principle.
- `locally-analytic-radius` (planet):
  - LA_h, with orthonormal basis e_{h,n} and scalar extension.
  - A uniform radius, by compactness.
  - LA = lim→ LA_h.
- `amice-mahler-basis` (planet): Amice's theorem. [n/p^h]!·C(x, n) is an orthonormal basis of LA_h, and φ is locally
  analytic if and only if lim inf v_p(a_n(φ))/n > 0.
- `locally-analytic-topology`: the inductive-limit topology is strictly finer than the C⁰ topology. The separating
  sequence is p^nC(x, p^{2n}).
- `locally-analytic-distributions` (planet): the Fréchet dual, as a projective limit of Banach duals, with the
  injection of bounded measures.
- `field-analytic-functions`: F-analytic against ℚ_p-analytic functions on 𝒪_F. The F-analytic ones are cut out by the
  Cauchy–Riemann equations, and the dual map is a quotient; x ↦ σ(x) is ℚ_p-analytic but not F-analytic.

**L1: the Amice transform.**
- `amice-transform` (planet): D(ℤ_p, L) ≅ R⁺ as Fréchet spaces, with v_{B(0,u_h)}(A_μ) ≥ v_{LA_h}(μ) ≥
  v_{B(0,u_{h+1})}(A_μ) − 1. It is compatible with the bounded transform (RJW Theorem 3.43).
- `distribution-operations`: the toolbox extended continuously: Dirac masses, multiplication (∂), restriction,
  derivative (log(1 + T)), σ_a, φ, ψ and convolution.
- `division-by-x-and-primitives`:
  - Division by x is defined up to δ₀, and is unique on unit-supported distributions.
  - ∂^{−k} is ambiguous up to polynomials in log(1 + T), and the ambiguity cancels at p-power roots of unity.
  - Primitives of functions exist only modulo the closure of the locally constant functions.

**L2: admissible growth and uniqueness (one variable).**
- `c-r-functions`: C^r, with its Mahler and wavelet bases. Locally polynomial functions of degree ≤ [r] are dense.
- `order-r-distributions` (planet): distributions of order r = h-admissible distributions. The equivalent descriptions
  are:
  - Amice coefficients: v_p(b_n) + rℓ(n) is bounded below.
  - Radius-wise growth.
  - Pollack–Stevens' growth: ‖μ‖ = O(p^{rn}) on radius p^{−n}.
  - Riemann-sum bounds.
- `order-zero-measures`: order 0 is exactly the bounded measures.
- `amice-velu-vishik` (planet): Colmez Theorem II.3.2. It gives extension and uniqueness from locally polynomial
  functions of degree ≤ N when N ≥ [r], i.e. r < N + 1. At r = N + 1 the distribution d^{N+1}δ₀ is a counterexample:
  this is the critical-slope obstruction.

**Remaining:**
- L0 and L2 in several variables: finite products of local integer rings (charts, tensor products), vector radii and
  the corresponding uniqueness theorem.
- L3: character spaces and Mellin transforms.
- L4's recorded gaps.

**Lean:** the L0–L2 section of the suggested file (a signature comment block and three proved examples) was compiled
on its own against the pinned Mathlib. The whole file imports four pinned Tau Ceti modules, which are not built on this
server, so it was not re-elaborated in this checkpoint.

## L4: entire functional input at fixed characteristic degree

Let A be a nontrivial complete normed commutative ring, with norm(1)=1 and
ultrametric norm. The coefficients can be nonreduced. Let B be an entire
power series and P a polynomial with P(0)=1. Choose an explicit rank n at
least natDegree(P). Neither a field, a splitting of P nor B(0)=0 is assumed
for the fixed-rank construction.

Write Q_n=reflect_n(P), the native reflection at the chosen exponent n.
It is monic of degree n, including the padded zero roots. The previous entire
monic division gives a native polynomial remainder

R_(Q_n)(B)=trunc_n(B−Q_n S_(Q_n)(B)).

Define the fixed-rank spectral polynomial by

E_n(B,P)=D_(n,n)(R_(Q_n)(B),P),

using the preceding polynomial spectral resultant D. This uses the existing
native polynomial and power-series types and the previously constructed
entire quotient. It requires no normed structure on the finite quotient algebra.
The output has degree at most n and constant coefficient one.

For polynomial B, reducing it modulo Q_n leaves the spectral polynomial
unchanged: the classes of 1−T B and 1−T R agree in the native monic quotient
over A[T], so their algebra norms agree. Thus the construction agrees with
the preceding polynomial spectral transform for every valid auxiliary bound.

The analytic point is that this reduction fixes the dimension. If
B_N=trunc_(N+1)(B), every coefficient of its monic remainder tends to the
corresponding coefficient of R_(Q_n)(B). The spectral coefficients are finite
polynomial expressions in those finitely many remainder coordinates, as the
native Sylvester determinant shows. Consequently

coeff_k D_(n,N)(B_N,P) → coeff_k E_n(B,P).

All these spectral polynomials have degree at most n. A fixed-degree
coefficient limit converges in every Gauss radius: bound its weighted
coefficient supremum by the finite sum through degree n. This argument needs
neither ultrametricity nor completeness once coefficient convergence is given.
It is compatible with the preceding moving-monomial counterexample, whose
degrees grow without bound.

If B(0)=0, the source's simultaneous truncation sequence has the same limit
E_(natDegree(P))(B,P). Once N reaches natDegree(P), the characteristic
truncation is exactly P, and the finite padding-stability identity removes
all excess rank. The remaining sequence is the fixed-rank sequence above.
The general entire characteristic input is still open: its truncation degrees
grow, so this proof supplies no estimate uniform in that degree.

Passing through the finite polynomial identities gives three further laws:

- E_(n+1)(B,P)=E_n(B,P)(1−B(0)T). Rank independence requires B(0)=0.
- E_(n+k)(B,PQ)=E_n(B,P)E_k(B,Q), for normalized polynomial factors with the
  stated degree bounds. B may have nonzero constant coefficient.
- E_1(B,1−aT)=1−B(a)T, where B(a) is the actual entire evaluation.

The first two follow coefficientwise, because each coefficient of a product
uses only finitely many coefficients. The last uses truncation convergence
at a Gauss radius at least norm(a) and the preceding uniform-evaluation
criterion. No compactness of the evaluation ball is asserted.

These are the polynomial-characteristic-input part of the limiting definition
and factor identity in Coleman Appendix A3. The complete published pages
435–436 were freshly read, with the preceding complete pages 432–436 reading
retained. The degree bounds, fixed-coordinate reduction and Gauss argument
are worker decompositions. The two inherited source findings retain their
existing version and review qualifications. General entire characteristic
input, the full A3.8 identities and infinite-operator A3.9 transport remain
explicit obligations. Scalar character spaces stay with PMIA L0a and
slope-adapted geometry with PadicFamilies.

## Declarations, dependencies and acceptance cases

The analytic entries use the hypotheses above; the first three finite
algebraic entries state their weaker ring hypotheses explicitly. Every entry
is a proof plan and remains unchecked.

### Reduction of the functional polynomial at fixed characteristic rank

`TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant_modByMonic` (lemma). If P(0)=1, natDegree(P)≤n and natDegree(B)≤m, then D_(n,m)(B,P)=D_(n,n)(B modByMonic reflect_n(P),P).

The existing reversal lemma makes Q_n monic of degree n. Native monic division shows that B and its remainder have the same class in AdjoinRoot Q_n. After mapping coefficients into R[T], the classes of 1−T B and 1−T remainder also agree. Use the existing spectral quotient-norm comparison on each representative. The remainder has degree less than n, so its natural degree is at most n, including the zero remainder for n=0. The resulting norms and hence spectral polynomials agree. For the zero coefficient ring use uniqueness of all polynomials; no nontriviality is silently added.

Prerequisites: `LocallyAnalyticDistributions:L4/spectral-reversed-degree`, `LocallyAnalyticDistributions:L4/spectral-quotient-norm`, `mathlib:Polynomial.modByMonic_add_div`, `mathlib:Polynomial.degree_modByMonic_lt`.

Acceptance: The right output has a fixed auxiliary bound n even as m grows.

### The finite spectral output has degree at most its rank

`TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant_natDegree_le` (lemma). For any B,P and any n,m, natDegree(D_(n,m)(B,P))≤n.

Unfold the existing bounded resultant into its native Sylvester determinant over R[T]. Its first n columns come from 1−T B and have entries of output degree at most1; the other m columns come from reflected P and have constant entries. In the native determinant permutation expansion, every term uses exactly one entry in each column. Thus every product has degree at most n, and so does their finite sum. The zero polynomial has natural degree0, so n=0 is valid.

Prerequisites: `LocallyAnalyticDistributions:L4/polynomial-spectral-resultant`, `mathlib:Polynomial.sylvester`, `mathlib:Polynomial.resultant`, `mathlib:Matrix.det_apply`.

Acceptance: This holds without degree bounds or normalization of B or P. The two output and resultant variables must not be confused.

### Continuity of finite spectral coefficients

`TauCeti.NonarchimedeanFredholm.continuous_polynomialSpectralResultant_coeff` (lemma). Over a topological commutative ring R, fix n,m,k and P. The kth coefficient of D_(n,m)(ofFn_(m+1)(b),P) is continuous as a function of b∈R^(m+1).

Native ofFn coefficients are the specified coordinates below m+1 and zero above. Each Sylvester entry is constant or affine in the output variable, with coefficient functions continuous in b. Expand the finite determinant and then its fixed output coefficient. Polynomial product coefficients are finite sums; all resulting expressions are finite sums and products of coordinate functions. Native topological-ring operations give continuity. No topology on R[T] or degree constancy is needed.

Prerequisites: `LocallyAnalyticDistributions:L4/polynomial-spectral-resultant`, `mathlib:Polynomial.sylvester`, `mathlib:Polynomial.resultant`, `mathlib:Matrix.det_apply`, `mathlib:Polynomial.ofFn`, `mathlib:Polynomial.ofFn_coeff_eq_val_of_lt`, `mathlib:Polynomial.ofFn_coeff_eq_zero_of_ge`.

Acceptance: No claim that evaluation on R-points detects polynomials is used; the proof works over finite and nonreduced rings.

### Gauss convergence of bounded-degree coefficient limits

`TauCeti.NonarchimedeanFredholm.tendsto_gaussNorm_of_bounded_degree` (lemma). For any filter l, polynomials F_i and f over a normed commutative ring with all natural degrees≤d, and coefficientwise F_i→f along l, one has G_R(F_i−f)→0 for every R>0.

Above d all coefficient differences vanish. Native gaussNorm_eq bounds the supremum by the finite sum of nonnegative weighted norms over k≤d. Each norm difference tends to0 by its coefficient limit. The finite sum therefore tends to0; Gauss nonnegativity and squeezing give the claim. No ultrametricity or completeness is needed.

Prerequisites: `mathlib:PowerSeries.gaussNorm_eq`, `mathlib:PowerSeries.gaussNorm_nonneg`, `mathlib:Polynomial.coeff_coe`.

Acceptance: The common finite degree bound is essential. The inherited moving-monomial example has coefficient limit0 but Gauss norm1 at radius1.

### Spectral transform with entire functional input and fixed polynomial input

`TauCeti.NonarchimedeanFredholm.entirePolynomialSpectral` (construction). Define E_n(B,P)=D_(n,n)(R_(Q_n)(B),P), a native polynomial, using the existing entire monic remainder and Q_n=reflect_n(P).

The construction takes the native degree-n truncation of B−Q_n S_(Q_n)(B), then applies the existing finite polynomial spectral construction with both bounds n. No quotient topology, limit carrier or new power-series type is introduced. When B is entire and P is normalized with degree bounded by n, the preceding monic-division theorem identifies this truncation as the actual remainder. The finite spectral degree bound gives output degree at most n. The finite constant-coefficient formula gives output constant1. For B=0 the reciprocal-tail quotient vanishes; finite right-bound independence and the zero-functional formula give E_n(0,P)=1.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-monic-quotient`, `LocallyAnalyticDistributions:L4/entire-monic-division-remainder`, `LocallyAnalyticDistributions:L4/polynomial-spectral-resultant`, `LocallyAnalyticDistributions:L4/spectral-output-degree`, `LocallyAnalyticDistributions:L4/spectral-polynomial-constant`, `LocallyAnalyticDistributions:L4/spectral-right-bound`, `mathlib:PowerSeries.trunc`.

API:

- `entirePolynomialSpectral_def`: The value is D_(n,n) of trunc_n(B−Q_n S_(Q_n)(B)) and P.
- `entirePolynomialSpectral_constantCoeff`: For P(0)=1, the output constant coefficient is1.
- `entirePolynomialSpectral_zero`: For normalized P of degree at most n, E_n(0,P)=1.

Typed acceptance cases:

- `FixedSpectralTests.empty_rank`: E_0(B,1)=1 for every B.
- `FixedSpectralTests.zero_function`: The zero functional input gives1.
- `FixedSpectralTests.constant_padding`: For B=c constant and P=1, E_2(B,1)=(1−cT)^2, retaining both padded zero roots.
- `FixedSpectralTests.linear_value`: E_1(B,1−aT)=1−B(a)T for entire B.
- `FixedSpectralTests.nilpotent_coefficients`: If e²=0, E_2(T,1−eT²)=1−eT²; nilpotent coefficients remain visible.
- `FixedSpectralTests.unit_input_zero_constant`: For entire B with B(0)=0, E_n(B,1)=1 at every rank.

Acceptance: The formula is defined for native inputs; analytic correctness is asserted under the stated complete ultrametric hypotheses. Rank is part of the input and cannot be replaced by the actual degree when B(0)≠0.

### Agreement with the polynomial spectral construction

`TauCeti.NonarchimedeanFredholm.entirePolynomialSpectral_polynomial` (comparison). For polynomial B with natDegree(B)≤m, E_n(B,P)=D_(n,m)(B,P).

The preceding entire-monic-quotient polynomial comparison and monic-division remainder identify R_(Q_n)(B) with native B modByMonic Q_n. Apply the new finite reduction identity. All rank and auxiliary bounds remain explicit.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-fixed-polynomial-spectral`, `LocallyAnalyticDistributions:L4/entire-monic-quotient-polynomial`, `LocallyAnalyticDistributions:L4/entire-monic-division-remainder`, `LocallyAnalyticDistributions:L4/spectral-reduce-functional-polynomial`.

Acceptance: Retain the fixed rank and all explicitly stated hypotheses, including degree-zero cases.

### Coefficient limits at fixed characteristic rank

`TauCeti.NonarchimedeanFredholm.tendsto_spectral_fixed_polynomial_coeff` (lemma). For every k, coeff_k D_(n,N)(trunc_(N+1)(B),P) tends to coeff_k E_n(B,P) as N→∞.

Native truncation gives the required degree bound N on B_N. Reduce its functional polynomial modulo the fixed Q_n by spectral-reduce-functional-polynomial. The preceding entire-remainder-truncation-limit says every coefficient of B_N modByMonic Q_n converges to the corresponding entire remainder coefficient. Both polynomials have degree less than n, hence they are recovered by native ofFn on their first n+1 coefficients. Convergence of this finite vector and the new spectral coefficient continuity give the claimed output coefficient limit. The argument includes n=0.

Prerequisites: `LocallyAnalyticDistributions:L4/spectral-reduce-functional-polynomial`, `LocallyAnalyticDistributions:L4/spectral-reversed-degree`, `LocallyAnalyticDistributions:L4/entire-remainder-truncation-limit`, `LocallyAnalyticDistributions:L4/entire-fixed-polynomial-spectral`, `LocallyAnalyticDistributions:L4/spectral-coefficient-coordinate-continuity`, `mathlib:Polynomial.ofFn_coeff_eq_val_of_lt`, `mathlib:Polynomial.ofFn_coeff_eq_zero_of_ge`, `mathlib:PowerSeries.coeff_trunc`.

Acceptance: Retain the fixed rank and all explicitly stated hypotheses, including degree-zero cases.

### All-radius Gauss convergence at fixed characteristic rank

`TauCeti.NonarchimedeanFredholm.tendsto_spectral_fixed_polynomial_gauss` (theorem). For every R>0, G_R(D_(n,N)(trunc_(N+1)(B),P)−E_n(B,P)) tends to0.

The finite spectral output-degree theorem bounds every polynomial in the sequence and its defined limit by the same n. Combine the preceding coefficient limit with the bounded-degree Gauss convergence lemma. The result holds at every positive radius with that radius fixed.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-fixed-spectral-coefficient-limit`, `LocallyAnalyticDistributions:L4/spectral-output-degree`, `LocallyAnalyticDistributions:L4/bounded-degree-gauss-limit`.

Acceptance: The resulting limit is already a polynomial and therefore entire. This avoids any unsupported passage from a general coefficientwise limit to uniform evaluation.

### Simultaneous truncation convergence for polynomial characteristic input

`TauCeti.NonarchimedeanFredholm.tendsto_spectral_simultaneous_fixed_polynomial_gauss` (theorem). If also B(0)=0, the simultaneous D_(N,N)(trunc_(N+1)(B),trunc_(N+1)(P)) converges in every G_R to E_(natDegree(P))(B,P).

For N at least natDegree(P), the second truncation is P itself. The first truncation has constant coefficient0. The existing finite padding-stability theorem reduces rank N to the fixed rank natDegree(P). The required auxiliary bound N remains valid for the first truncation. The tail of the sequence is therefore exactly the fixed-rank sequence in the preceding Gauss limit. Eventual equality transfers convergence.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-fixed-spectral-gauss-limit`, `LocallyAnalyticDistributions:L4/spectral-padding-stability`, `mathlib:PowerSeries.coeff_trunc`.

Acceptance: This proves the source simultaneous limit for polynomial P only. For general entire P, the degrees are unbounded and the same proof does not apply.

### The exact zero-root padding law for entire functional input

`TauCeti.NonarchimedeanFredholm.entirePolynomialSpectral_padding` (lemma). E_(n+1)(B,P)=E_n(B,P)(1−B(0)T).

Apply the existing finite padding formula to B_N. Its constant coefficient is B(0) for every N because trunc_(N+1) retains degree0. Pass to each output coefficient using the fixed-rank coefficient limits at n and n+1. Multiplication by the displayed fixed linear factor involves only two coefficients, so limits pass through it. Hausdorff uniqueness gives equality of every coefficient.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-fixed-spectral-coefficient-limit`, `LocallyAnalyticDistributions:L4/spectral-zero-padding`, `mathlib:PowerSeries.coeff_trunc`.

Acceptance: The factor equals1 precisely under the relevant zero-constant hypothesis; no unqualified rank independence is asserted.

### Factor products for polynomial characteristic inputs

`TauCeti.NonarchimedeanFredholm.entirePolynomialSpectral_mul` (theorem). If Q is also normalized with natDegree(Q)≤k, then E_(n+k)(B,PQ)=E_n(B,P)E_k(B,Q).

For every polynomial truncation B_N, apply the existing finite factor-product law with ranks n,k and auxiliary bound N. All three sequences converge coefficientwise by the fixed-rank theorem; the degree of PQ is at most n+k and its constant coefficient is1. A fixed coefficient of the product is a finite sum of products of convergent coefficients. Pass to the limit and use native polynomial extensionality.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-fixed-spectral-coefficient-limit`, `LocallyAnalyticDistributions:L4/spectral-factor-product`.

Acceptance: This is Coleman A3.8(10) with polynomial characteristic factors and entire B. Entire characteristic factors and infinite-operator transport remain separate obligations.

### Linear characteristic input evaluates the entire function

`TauCeti.NonarchimedeanFredholm.entirePolynomialSpectral_linear` (theorem). For a∈A, E_1(B,1−aT)=1−B(a)T, with the preceding actual entire evaluation.

The finite linear-factor formula identifies the Nth approximant with 1−B_N(a)T. The fixed-rank coefficient limit controls its output. Truncations converge in every Gauss radius. Choose any positive radius at least norm(a), then use the existing uniform-evaluation theorem to obtain B_N(a)→B(a). The constant, linear and higher coefficients of the displayed limit are explicit. Uniqueness of coefficient limits proves the polynomial identity.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-fixed-spectral-coefficient-limit`, `LocallyAnalyticDistributions:L4/spectral-linear-factor`, `LocallyAnalyticDistributions:L4/entire-gauss-truncation-convergence`, `LocallyAnalyticDistributions:L4/entire-gauss-uniform-evaluation`.

Acceptance: No compactness of the evaluation ball or field hypothesis is needed. At a=0 the formula records the rank-one padded zero root.

## Earlier Fredholm and entire-series developments

**Historical entire-convergence checkpoint:** 174 unchecked nodes: 3 definitions,
17 constructions, 106 lemmas, 29 theorems and 19 comparisons; 89 API items
(85 on definitions/constructions), 117 packet tests (70 on definitions and
constructions), 117 typed examples, 6 planets and 228 baseline citations.
Eight gaps, five requests, two inherited source findings and zero closed
stages remain.

## Entire limits measured by native Gauss norms

Let A be a normed commutative ring. For a power series F and positive real R,
write G_R(F) for the existing native Gauss norm: the supremum of
‖coeff_k(F)‖R^k over k≥0. Before bounding a coefficient by this supremum, one
must know the weighted coefficients are bounded. Native `HasGaussNorm` is
exactly that condition; the conditional real supremum does not supply it.

The comparison `isEntire_iff_forall_isRestricted` identifies the preceding
entire-series predicate with native `PowerSeries.IsRestricted` at every
positive radius. The native univariate theorem already converts its cofinite
indexing into the natural-number atTop filter. Tau Ceti's existing
`hasGaussNorm_of_isRestricted` therefore supplies boundedness at every radius.
Its stronger Gauss multiplicativity theorem assumes a multiplicative coefficient
norm; that additional assumption is not made here.

The comparison `gaussSize_eq_gaussNorm` identifies the preceding packet's
`gaussSize` expression with the native Gauss norm. All new estimates use that
native function. These are adapters for existing interfaces, with no new
power-series carrier, Gauss norm, or topology.

Native truncation at N keeps precisely the coefficients of degrees less than
N. The lemma `gaussNorm_sub_trunc_le` gives, for 0<R≤S and F bounded at S,

G_R(F−trunc_N(F)) ≤ G_S(F)(R/S)^N.

Below N the coefficient is zero. At k≥N, multiply the coefficient bound at S
by (R/S)^k and use (R/S)^k≤(R/S)^N. Taking the supremum proves the estimate.
No completeness or ultrametric hypothesis is needed for this step. The exponent
is N, and the boundary R=S is allowed. To obtain convergence, however, increase
the radius: with S=2R the right side is G_(2R)(F)2^(−N). The lemma
`tendsto_gaussNorm_sub_trunc` thus gives convergence of the truncations of an
entire F at every positive radius.

The lemma `isEntire_of_coeff_tendsto_of_gauss_bounded` addresses a different
limit. Suppose F_i is a sequence of entire series whose coefficients converge
to those of a formal series f. Suppose also that for every S>0 there is C_S≥0
with G_S(F_i)≤C_S for every i. Passing each coefficient inequality to its limit
gives ‖coeff_k(f)‖S^k≤C_S. For a target radius R choose S=2R to deduce
‖coeff_k(f)‖R^k≤C_(2R)2^(−k). Thus f is entire. Completeness is unnecessary
here because the coefficient limits are supplied explicitly.

Assume now that A is ultrametric. The theorem
`tendsto_gaussNorm_of_coeff_tendsto_of_gauss_bounded` strengthens the preceding
result to G_R(F_i−f)→0 for every R>0. At S=2R the same C bounds f and all F_i.
The ultrametric inequality bounds their differences at S by C. Split each
difference into a finite head and a tail at N. The tail is at most C2^(−N),
uniformly in i. For fixed N, coefficientwise convergence makes the finite head
small. The maximum bound for addition combines these estimates. Bounds at
larger radii are the essential input beyond coefficientwise convergence.

This gives an explicit completeness criterion. First,
`gauss_bounded_of_cauchy` shows that a sequence Cauchy in G_R is bounded in G_R.
Use the Cauchy condition with error 1 and a fixed late term, then enlarge its
bound to cover the finite initial segment. If A is complete, the theorem
`existsUnique_entire_gauss_limit` says that a sequence of entire series Cauchy
in every G_R has a unique entire limit in all those Gauss norms. At radius 1,
each coefficient sequence is Cauchy, hence has a limit in A. Native
`PowerSeries.mk` collects these coefficients. The preceding boundedness and
limit theorems supply entireness and convergence. Uniqueness follows coefficient
by coefficient from the radius-one estimate. This is a sequential criterion;
it does not install a completeness instance for an unspecified topology.

For complete ultrametric A, the theorem
`tendstoUniformlyOn_entire_eval_of_gauss` gives the needed evaluation result.
It applies to any filter l. If F_i and f are entire and G_R(F_i−f)→0 along l,
then their evaluations converge uniformly for ‖a‖≤R. The existing evaluation
homomorphism and bound give

‖eval_a(F_i)−eval_a(f)‖ ≤ G_R(F_i−f)

with an upper bound independent of a. The native metric uniform-convergence
criterion finishes the argument. The closed ball need not be compact. The
existing evaluation-homomorphism signature now explicitly retains completeness
of A, already required in its mathematical statement, so its coefficient sums
converge in the actual coefficient ring.

The lemma `tendsto_gaussNorm_mul` gives multiplication of limits at each fixed
positive radius. If F_i→f and H_i→h in G_R, then H_i is eventually bounded in
G_R. Expand the error as

F_iH_i−fh=(F_i−f)H_i+f(H_i−h).

The native submultiplicative Gauss bound and ultrametric addition bound reduce
this to a maximum of two null bounds. No multiplicative norm on A is required,
so nonreduced coefficient rings remain allowed.

## Gauss continuity of the existing monic division

For the existing monic-division construction also assume A is nontrivial,
complete and norm-one. Let Q be monic of degree d and S_Q(F) the preceding
entire monic quotient. Choose C≥1 so that
‖coeff_i(Q.reverse)‖≤C^i for every i. Such a C exists by finite support and the
constant coefficient 1 of the reversal. The lemma
`gaussNorm_entireMonicQuotient_le` gives, whenever C≤S and 0<R≤S,

G_R(S_Q(F)) ≤ G_S(F)/S^d.

Insert G_S(F) into the preceding reciprocal-tail coefficient bound, multiply
the kth coefficient estimate by R^k, and use (R/S)^k≤1 before taking the
supremum. The case Q=1 has d=0 and is included.

The lemma `tendsto_gaussNorm_entireMonicQuotient` now proves continuity of this
fixed division operation in every Gauss radius. For each output R choose
S≥max(C,R). The existing linearity API identifies the quotient difference with
S_Q(F_i−f); the displayed bound and the input convergence at S give output
convergence at R. This strengthens the preceding coefficientwise convergence
of the quotient without introducing a different division algorithm.

The eight typed tests, under `EntireGaussTests`, distinguish the conventions:

- `native_polynomial` compares the existing polynomial inclusion and native Gauss norm.
- `tail_boundary` gives the exact tail norm ‖a‖R^N for aT^N truncated at N.
- `zero_truncation` checks that truncation at zero removes no tail coefficient.
- `moving_monomials` shows that T^N tends coefficientwise to zero while its
  radius-one Gauss norm and its evaluation at 1 are always 1.
- `radius_loss` computes G_(1/2)(T^N)=(1/2)^N and G_2(T^N)=2^N.
- `nilpotent_product` takes e≠0 with e²=0: for f=eT and R>0,
  G_R(f²)=0 although G_R(f)²>0.
- `quotient_identity` checks S_1(F)=F.
- `uniform_truncation_evaluation` applies the actual truncation and evaluation
  theorems uniformly on every closed ball of positive radius.

These twelve L4 declarations reuse native restrictedness, Gauss bounds,
truncation, Cauchy limits and uniform convergence, together with the preceding
entire evaluation and monic division. Their analytic source is the complete
published Coleman Appendix A3, printed 432–436. The quantitative convergence
arguments are worker decompositions of the source's limiting requirements.

The general spectral series D(B,P) remains unconstructed. Its simultaneous
finite truncations still need coefficient estimates proving a Cauchy property
at every radius, or coefficient limits together with the uniform larger-radius
bounds above. After that, uniform evaluation and the already supplied scalar
resultant limit identify its value at 1 in A3.8(11). Multiplicativity A3.8(10),
infinite-operator transport A3.9, finite-module topology, completed tensors and
actual distribution families retain their precise gaps. Historical checkpoint
counts below describe their respective additions; the current counts are above.


**Historical reciprocal-resultant checkpoint:** 162 unchecked nodes:3 definitions,17 constructions,99 lemmas,26 theorems and17 comparisons;89 API items (85 on definitions/constructions),109 packet tests (70 on definitions/constructions),109 typed examples,6 planets and214 baseline citations. Eight gaps,five requests,two inherited source findings and zero closed stages remain.

## Reciprocal resultants and the scalar truncation limit

Fix a nontrivial complete ultrametric normed commutative ring A with
norm(1)=1, a monic polynomial Q of degree d, and an entire series F. Write
F_n=trunc(n+1,F), so the truncation includes degree n. Let Q*=Q.reverse,
B=1−Q*, and use the preceding finite spectral transform D_(n,m).

The finite identity, valid over every commutative ring, is

D_(n,d)(1−Q*,P)(1)=Res(Q,P) whenever P.natDegree≤n.

The proof uses the native bounded Sylvester matrix. Its first m columns
contain translates of g and its last n columns translates of f. Reversing
both axes simultaneously swaps the reflected factors. The determinant is
unchanged because both axes use the same permutation, giving
Res(reflect_m f,reflect_n g;m,n)=Res(g,f;n,m). This also handles empty matrices,
zero rings and coefficients with nilpotents. Specializing the existing finite
spectral transform at1 and using native monic bound-independence proves the
displayed identity. There is no separate permutation-sign calculation.

The fixed right bound d is important. The identity itself does not require
P(0)=1. For Q=T² and P=2, the bound d=2 gives D_(0,2)(0,2)(1)=4; replacing it
by the actual degree0 of B gives D_(0,0)(0,2)(1)=1. The normalized condition
P(0)=1 remains necessary when changing that auxiliary bound.

For the analytic step, use the existing monic entire quotient S_Q(F), defined
by reciprocal tails. Its kth coefficient is the convergent sum
Σ_j a_(k+d+j)b_j, where b_j is a coefficient of the inverse of Q*. For F_n,
this is exactly the initial sum through k+d+j≤n. Ordinary convergence of
partial sums proves convergence of every quotient coefficient. Finite
coefficient convolution then proves that every coefficient of F_n mod Q
converges to the coefficient of the existing remainder R_Q(F).

The resultant can be computed from these remainders using a fixed-size
Sylvester matrix. Native quotient-class equality and the norm/resultant
comparison give

Res(Q,F_n)=Res(Q,F_n mod Q;d,d).

Encode the remainder by its coefficients0,…,d in a native finite product.
For fixed bounds, every Sylvester entry is a coefficient projection, a fixed
coefficient of Q or0. The existing continuity of finite determinants proves
continuity of this function of the coefficient vector. Consequently
Res(Q,F_n) converges to Res(Q,R_Q(F)), which is the preceding entire resultant
Res(Q,F) by its quotient-norm definition. No topology on AdjoinRoot Q or
continuity of its algebra norm is assumed.

Thus D_(n,d)(B,F_n)(1) converges to Res(Q,F). If F(0)=1, the simultaneous
source sequence has the same limit: eventually trunc(n+1,B)=B, and the existing
monic-reversal and right-bound API identifies D_(n,n)(B,F_n) with D_(n,d)(B,F_n).
This proves the scalar limiting step in Coleman A3.8(11).

The general entire series D(B,F) still needs its own construction and
quantitative coefficient estimates. Coefficientwise convergence alone would
not justify evaluating the limit at1. The scalar sequence theorem here will
identify that value once the required entire convergence and evaluation
comparison are supplied. Multiplicativity A3.8(10), the infinite-operator
A3.9 theorem and the existing finite-module topology and rank questions remain
separate targets.

## Preceding Fredholm and finite spectral interfaces

Earlier checkpoint counts and validation paragraphs below describe their historical scopes. All preceding mathematical node objects are retained.

> Current checkpoint: the final “Universal finite characteristic comparison” section
> supersedes the earlier open finite-matrix comparison. Earlier checkpoint
> sections and validation counts are retained as history. The infinite analytic
> transform and the remaining L4 gaps are still open; L0–L3 remain not_read.

**Historical packet:** 124 unchecked nodes (13 comparison, 15 construction, 3 definition, 70 lemma, 23 theorem), 80 API entries, 86 packet tests (63 on definitions/constructions), 86 typed examples, 6 planets and 151 baseline records. Eight gaps, five requests, two findings and zero closed stages remain.

Twelve finite spectral-transform declarations extend the preceding checkpoint. Earlier validation below is historical; current evidence follows at the end.

**Entire quotient and resultant checkpoint, 27 September 2026.**
112 unchecked nodes (12 comparisons, 14 constructions, 3 definitions, 60 lemmas, 23 theorems), 70 API entries, 82 packet tests,
82 typed examples, six planets and 128 baseline citations. Eight nodes
are added. Existing entire-resultants and resultant-unit are refined in place;
the other 102 preceding node objects, all 110 baseline objects and both source
findings are preserved whole. Eight gaps, five requests and zero closed stages
remain. Earlier checkpoint sections below retain their historical counts and
scope; this section supersedes their ordinary-resultant interface gap.

## L4 continuation: the entire quotient and the ordinary resultant

The coefficient algebra A is a nontrivial complete commutative normed ring with
norm(1)=1 and the ultrametric inequality. Its norm is submultiplicative. The
existing subring A{T} consists of native formal series whose weighted
coefficients tend to zero at every positive real radius. We impose no
Noetherian, field, domain, reducedness or splitting hypothesis. Q is monic,
with degree d, allowing d=0 and Q=1. Completeness and the ultrametric inequality
are explicit hypotheses of the new reduction map and the revised resultant
signatures; they are not inferred from the word "entire".

The preceding monic-division theorem provides a unique entire S and polynomial
R of degree below d with F=QS+R. The polynomial inclusion i is the existing
native polynomial-to-power-series ring homomorphism corestricted to the
existing entire subring. Native polynomial division and analytic uniqueness
show that i(Q) divides i(P) in A{T} exactly when Q divides P in A[T]. In this
argument the quotient must be entire: arbitrary formal-series divisibility
would make T-a a unit for nonzero a over a field, which destroys the conclusion.

Define rho_Q(F) to be the native AdjoinRoot class of R. For any two polynomial
representatives, their difference is analytically divisible by Q, hence
polynomially divisible by Q by the preceding lemma. Native mk_eq_mk makes their
classes equal. This proves independence even for representatives of unrestricted
degree. Addition respects representatives. For multiplication, the explicit
identity

(QS+R)(QT+U)=Q(QST+SU+TR)+RU

makes the correction factor entire and supplies the ring law. Thus rho_Q is an
actual ring homomorphism into native AdjoinRoot Q, not a formal substitution
at a root. Its kernel is the principal ideal generated by i(Q); every target
class lifts through a polynomial representative. The native first-isomorphism
theorem supplies A{T}/(Q) isomorphic to A[T]/(Q). No second generic quotient,
basis or first-isomorphism construction is proposed.

Pinned Tau Ceti already proves AdjoinRoot.norm_mk_eq_resultant for monic Q over
an arbitrary commutative ring. Its exact conclusion uses native Polynomial.resultant
Q P Q.natDegree P.natDegree. We use this declaration directly; its Sylvester
block argument, signs and degree-bound normalization are existing mathematics.
The native AdjoinRoot.powerBasis' supplies the basis indexed by Fin d. The
retained entire resultant is native Algebra.norm(rho_Q(F)), equivalently its
multiplication determinant in that basis. The monoid law of norm gives
multiplicativity, and rho_Q(Q)=0 gives invariance under adding an entire multiple
of Q. For Q=T-a the earlier convergent evaluated-tail division identifies the
class with the scalar F(a); the native scalar norm formula in rank one gives
Res(T-a,F)=F(a). For Q=1 the quotient is the zero ring and the basis is empty,
so Res(1,F)=1 even at F=0.

Coleman's A3.5 also has an explicit coefficient bound. Divide F=QS+R. For d>0,
native polynomial Bezout for the resultant supplies Q U+R H=Res(Q,R), with
degree H<d. Substituting the division identity yields

Res(Q,F)=Q(U-HS)+HF.

The coefficient U-HS is entire and H is polynomial of degree below d. The
minus sign is essential. The native polynomial theorem has a nonzero-degree
side condition, so the d=0 case is handled separately with G=1,H=0. Polynomial
degree(0) is bottom, so its bound below natural degree zero still holds.

Native determinant invertibility and invertibility of left multiplication
identify a unit resultant with a unit rho_Q(F). Lift the inverse through rho_Q.
Its product with F differs from one by an element of the kernel, so the kernel
lemma gives the entire Bezout equation. Conversely any such equation reduces
to a quotient inverse. Equivalently normalize the preceding scalar-resultant
certificate by the inverse of the unit resultant. This uses a unit, not just
a nonzero determinant. Over nonreduced coefficients, nilpotents and nonunits
must remain visible; for Q=T^2 and F=a+bT the resultant is a^2.

### Sources, ownership and remaining obligations

Coleman's published A3 printed432–435/PDF16–19 was read in full, with images of
printed434/435 checked for the displayed quotient, norm and Bezout statements.
The scan hash is unchanged. The current source findings E1 and E2 are preserved
without new verdicts. This slice uses the corrected entire setting and does
not infer an error in the later resultant conclusions. The source's alternative
multivariable symmetric-function construction and spectral D(B,P) are not
silently supplied by the ordinary quotient norm.

Reviewed AUDIT-25 and accepted RS-16 retain this entire coefficient algebra in
LAD L4. The adjacent ProfiniteProPGroups bounded integral division and Tau Ceti
ideal-adic Weierstrass APIs keep their own hypotheses and ownership. Native
polynomial quotients, finite bases, resultants, determinants and norms are
imported. The stronger spectral/Fredholm comparison, finite-projective rank and
determinant, completed tensors, canonical finite-module topology and actual
distribution families remain gaps. No source-wide or stage-wide closure is
asserted.

### Polynomial inclusion in the entire-series ring

`LocallyAnalyticDistributions:L4/entire-polynomial-inclusion` (construction); proposed declaration `TauCeti.NonarchimedeanFredholm.entirePolynomial`.

Bundle the existing polynomialSeries inclusion as the ring homomorphism i:A[T] to A{{T}}. Its underlying native formal series is the native polynomial coercion. This corestricts an existing map; it introduces no new entire or formal-series carrier.

Hypotheses:

- A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Q is a monic polynomial, including Q=1. F belongs to the existing entire-series subring, meaning weighted coefficients tend to zero at every positive real radius. No field, reducedness, Noetherianity or splitting assumption is imposed.

Proof outline:

1. Use the existing polynomial-entireness theorem to corestrict the native polynomial-to-power-series ring homomorphism to the existing entireSeries subring.
2. The native eval₂_C_X_eq_coe theorem identifies polynomialSeries with that coercion. Ring laws come from the native map and injectivity from native Polynomial.coe_injective.

Prerequisites: `LocallyAnalyticDistributions:L4/polynomial-series-entire`, `mathlib:Polynomial.coeToPowerSeries.ringHom`, `mathlib:Polynomial.coe_injective`, `mathlib:Polynomial.eval₂_C_X_eq_coe`.

Uses:

- Coleman A3 quotient interpretation and the entire quotient class below: Identify polynomial representatives and the actual generator Q of the analytic principal ideal.
- resultant-unit and entire-resultant-bezout: State the analytic Bezout equation in the existing entire-series ring.

Planning API:

- `entirePolynomial_coe`: The underlying formal series of i(P) is polynomialSeries(P), equal to the native polynomial coercion.
- `entirePolynomial_injective`: The ring homomorphism i is injective.
- `entirePolynomial_C`: The underlying formal series of i(C(a)) is PowerSeries.C(a).

Unit tests:

- `entire_polynomial_zero`: i(0)=0.
- `entire_polynomial_square`: The underlying formal series of i(T^2) is T^2.
- `entire_polynomial_native_injective`: For native polynomials P,S, i(P)=i(S) if and only if P=S.

Acceptance:

- The polynomial inclusion is multiplicative and injective even with zero divisors. It is not the constant-term map.

Sources:

- Coleman-PadicBanach-published-1997, Appendix A3, printed434–435/PDF18–19: quotient-norm interpretation and Lemmas A3.5,A3.7. Worker decomposition of the stated quotient interpretation and proof, using the native monic quotient and resultant APIs. The source does not separately state this declaration or its weakened complete ultrametric ring hypotheses.

### Polynomial divisibility detected inside entire series

`LocallyAnalyticDistributions:L4/entire-polynomial-divisibility` (lemma); proposed declaration `TauCeti.NonarchimedeanFredholm.entirePolynomial_dvd_iff`.

For monic Q and any native polynomial P, i(Q) divides i(P) in A{{T}} if and only if Q divides P in A[T].

Hypotheses:

- A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Q is a monic polynomial, including Q=1. F belongs to the existing entire-series subring, meaning weighted coefficients tend to zero at every positive real radius. No field, reducedness, Noetherianity or splitting assumption is imposed.

Proof outline:

1. Native polynomial division gives P=Q(P divByMonic Q)+(P modByMonic Q), with remainder degree below d. Include this identity into the entire ring.
2. Given i(P)=i(Q)G with G entire, compare that decomposition with remainder zero to the native polynomial decomposition using the uniqueness clause of entire-division. The native remainder must be zero, hence native divisibility.
3. Conversely include a polynomial factorization. The proof never cancels Q in an arbitrary formal-series ring and remains valid for d=0.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-polynomial-inclusion`, `LocallyAnalyticDistributions:L4/entire-division`, `mathlib:Polynomial.modByMonic_add_div`, `mathlib:Polynomial.degree_modByMonic_lt`, `mathlib:Polynomial.modByMonic_eq_zero_iff_dvd`.

Acceptance:

- The entire hypothesis is indispensable: over Q_p a polynomial T-a with nonzero a can be a formal power-series unit, while it cannot divide 1 in the entire ring.

Sources:

- Coleman-PadicBanach-published-1997, Appendix A3, printed434–435/PDF18–19: quotient-norm interpretation and Lemmas A3.5,A3.7. Worker decomposition of the stated quotient interpretation and proof, using the native monic quotient and resultant APIs. The source does not separately state this declaration or its weakened complete ultrametric ring hypotheses.

### Entire series in the native monic quotient

`LocallyAnalyticDistributions:L4/entire-quotient-class` (construction); proposed declaration `TauCeti.NonarchimedeanFredholm.entireAdjoinRoot`.

For monic Q, define the ring homomorphism rho_Q:A{{T}} to native AdjoinRoot Q=A[T]/(Q) by entire division F=i(Q)S+i(R) and rho_Q(F)=AdjoinRoot.mk Q R. The value is independent of every such polynomial representative, even if its degree is not normalized.

Hypotheses:

- A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Q is a monic polynomial, including Q=1. F belongs to the existing entire-series subring, meaning weighted coefficients tend to zero at every positive real radius. No field, reducedness, Noetherianity or splitting assumption is imposed.

Proof outline:

1. Choose the unique quotient and normalized remainder from entire-division, and send the remainder through native AdjoinRoot.mk.
2. If F=i(Q)S+i(R)=i(Q)Sprime+i(Rprime), then i(R-Rprime) is divisible by i(Q) with an entire quotient. Apply entire-polynomial-divisibility and native mk_eq_mk to identify the two quotient classes.
3. Addition of representatives gives the additive law. For products, (QS+R)(QT+U)=Q(QST+SU+TR)+RU; the correction factor is entire by subring closure. Representative independence and native mk multiplication give the multiplicative law. The representatives 0,1 and arbitrary polynomials give the zero,one and polynomial equations.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-division`, `LocallyAnalyticDistributions:L4/entire-polynomial-inclusion`, `LocallyAnalyticDistributions:L4/entire-polynomial-divisibility`, `mathlib:AdjoinRoot.mk_eq_mk`.

Uses:

- Coleman A3 printed434 quotient-norm interpretation: Construct the analytic reduction map and obtain the actual quotient identification from native first isomorphism once kernel and surjectivity are supplied.
- entire-resultants, entire-resultant-polynomial and resultant-unit: Reduce entire arguments into the finite native algebra before taking norm or lifting units.

Planning API:

- `entireAdjoinRoot_polynomial`: rho_Q(i(P))=AdjoinRoot.mk Q P for every native polynomial P.
- `entireAdjoinRoot_of_decomposition`: If F=i(Q)G+i(R) with G entire and R any polynomial, rho_Q(F)=AdjoinRoot.mk Q R; no degree bound on R is required.
- `entireAdjoinRoot_eq_zero_iff`: rho_Q(F)=0 if and only if i(Q) divides F in the entire ring; promoted to its own node.
- `entireAdjoinRoot_surjective`: rho_Q is surjective; promoted to its own node.
- `entireAdjoinRoot_linear`: For Q=T-a, rho_Q(F)=AdjoinRoot.of Q (F(a)); promoted to its own node.

Unit tests:

- `quotient_constant_divisor`: For Q=1, rho_1(F)=0 for every entire F; 0=1 in the target.
- `quotient_nilpotent_square`: rho_(T^2)(i(T^2))=0.
- `quotient_nilpotent_generator_nonzero`: For nontrivial A, rho_(T^2)(i(T)) is nonzero, although its square is zero.
- `quotient_native_remainder`: For every native polynomial P, rho_Q(i(P))=AdjoinRoot.mk Q (P modByMonic Q).

Acceptance:

- There is no evaluation of an arbitrary formal series at AdjoinRoot.root. The finite algebra need not be a domain or reduced. At Q=1 the target is the zero ring.

Sources:

- Coleman-PadicBanach-published-1997, Appendix A3, printed434–435/PDF18–19: quotient-norm interpretation and Lemmas A3.5,A3.7. Worker decomposition of the stated quotient interpretation and proof, using the native monic quotient and resultant APIs. The source does not separately state this declaration or its weakened complete ultrametric ring hypotheses.

### Kernel of analytic reduction modulo a monic polynomial

`LocallyAnalyticDistributions:L4/entire-quotient-class-kernel` (lemma); proposed declaration `TauCeti.NonarchimedeanFredholm.entireAdjoinRoot_eq_zero_iff`.

For F in A{{T}}, rho_Q(F)=0 if and only if i(Q) divides F in A{{T}}. Equivalently the kernel ideal is the principal ideal generated by i(Q).

Hypotheses:

- A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Q is a monic polynomial, including Q=1. F belongs to the existing entire-series subring, meaning weighted coefficients tend to zero at every positive real radius. No field, reducedness, Noetherianity or splitting assumption is imposed.

Proof outline:

1. Write F=i(Q)S+i(R). If rho_Q(F)=0, native mk_eq_zero supplies a polynomial H with R=QH; then F=i(Q)(S+i(H)).
2. Conversely rho_Q(i(Q)) is native mk(Q)=0. Apply the ring homomorphism to an entire factorization. The equivalence is the principal-ideal membership equation; there is no cancellation or inverse-of-Q step.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-quotient-class`, `mathlib:AdjoinRoot.mk_eq_zero`.

Acceptance:

- For Q=1 the kernel is the whole entire ring. For Q=T-a it recovers the existing entire root-factor criterion.

Sources:

- Coleman-PadicBanach-published-1997, Appendix A3, printed434–435/PDF18–19: quotient-norm interpretation and Lemmas A3.5,A3.7. Worker decomposition of the stated quotient interpretation and proof, using the native monic quotient and resultant APIs. The source does not separately state this declaration or its weakened complete ultrametric ring hypotheses.

### Polynomial representatives lift every quotient class

`LocallyAnalyticDistributions:L4/entire-quotient-class-surjective` (lemma); proposed declaration `TauCeti.NonarchimedeanFredholm.entireAdjoinRoot_surjective`.

The map rho_Q:A{{T}} to native AdjoinRoot Q is surjective. Together with the kernel theorem, native RingHom.quotientKerEquivOfSurjective identifies A{{T}}/(i(Q)) with the native polynomial quotient. No second quotient-equivalence construction is planned.

Hypotheses:

- A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Q is a monic polynomial, including Q=1. F belongs to the existing entire-series subring, meaning weighted coefficients tend to zero at every positive real radius. No field, reducedness, Noetherianity or splitting assumption is imposed.

Proof outline:

1. For x in AdjoinRoot Q, use native mk_surjective to choose P with mk(P)=x. The existing inclusion i(P) maps to x by the polynomial equation of rho_Q.
2. Apply the native first-isomorphism equivalence and rewrite the kernel with the preceding theorem whenever the quotient interpretation is needed. Scalar compatibility follows from the polynomial equation on constants.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-quotient-class`, `LocallyAnalyticDistributions:L4/entire-quotient-class-kernel`, `mathlib:AdjoinRoot.mk_surjective`, `mathlib:RingHom.quotientKerEquivOfSurjective`.

Acceptance:

- The native finite power basis is reused after this identification. Surjectivity does not require Q to split or its roots to be simple.

Sources:

- Coleman-PadicBanach-published-1997, Appendix A3, printed434–435/PDF18–19: quotient-norm interpretation and Lemmas A3.5,A3.7. Worker decomposition of the stated quotient interpretation and proof, using the native monic quotient and resultant APIs. The source does not separately state this declaration or its weakened complete ultrametric ring hypotheses.

### Linear analytic reduction is convergent evaluation

`LocallyAnalyticDistributions:L4/entire-quotient-class-linear` (comparison); proposed declaration `TauCeti.NonarchimedeanFredholm.entireAdjoinRoot_linear`.

For arbitrary a in A and entire F, rho_(T-a)(F)=AdjoinRoot.of (T-a) (F(a)), where F(a) is the existing convergent entire evaluation.

Hypotheses:

- A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Q is a monic polynomial, including Q=1. F belongs to the existing entire-series subring, meaning weighted coefficients tend to zero at every positive real radius. No field, reducedness, Noetherianity or splitting assumption is imposed.

Proof outline:

1. The existing evaluated-tail division gives F=(T-a)Q_a(F)+F(a), and the existing quotient-entireness theorem puts Q_a(F) inside the entire ring.
2. Apply the representative equation for rho to the constant polynomial C(F(a)). Native mk_C is the scalar map, giving the displayed equality.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-quotient-class`, `LocallyAnalyticDistributions:L4/entire-linear-division`, `LocallyAnalyticDistributions:L4/entire-linear-quotient-entire`.

Acceptance:

- No small-norm restriction on a is imposed; evaluation on merely formal series is not used.

Sources:

- Coleman-PadicBanach-published-1997, Appendix A3, printed434–435/PDF18–19: quotient-norm interpretation and Lemmas A3.5,A3.7. Worker decomposition of the stated quotient interpretation and proof, using the native monic quotient and resultant APIs. The source does not separately state this declaration or its weakened complete ultrametric ring hypotheses.

### Entire resultant agrees with the native polynomial resultant

`LocallyAnalyticDistributions:L4/entire-resultant-polynomial` (comparison); proposed declaration `TauCeti.NonarchimedeanFredholm.entireResultant_polynomial`.

For monic Q and every native polynomial P, the existing entire resultant of Q and i(P) equals native Polynomial.resultant Q P Q.natDegree P.natDegree, with exactly this argument order and degree bounds.

Hypotheses:

- A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Q is a monic polynomial, including Q=1. F belongs to the existing entire-series subring, meaning weighted coefficients tend to zero at every positive real radius. No field, reducedness, Noetherianity or splitting assumption is imposed.

Proof outline:

1. The norm characterization of the existing entire resultant and rho_Q(i(P))=mk_Q(P) reduce the comparison to a native finite-algebra norm.
2. Apply pinned Tau Ceti AdjoinRoot.norm_mk_eq_resultant. Its commutative-ring monic theorem already proves the Sylvester sign and degree bookkeeping, including d=0; do not reproduce it as proposed mathematics.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-resultants`, `LocallyAnalyticDistributions:L4/entire-quotient-class`, `tauceti:AdjoinRoot.norm_mk_eq_resultant`.

Acceptance:

- For Q=T-a the value is P(a). For Q=T^2 and P=a+bT it is a^2, even with nilpotent b or a.

Sources:

- Coleman-PadicBanach-published-1997, Appendix A3, printed434–435/PDF18–19: quotient-norm interpretation and Lemmas A3.5,A3.7. Worker decomposition of the stated quotient interpretation and proof, using the native monic quotient and resultant APIs. The source does not separately state this declaration or its weakened complete ultrametric ring hypotheses.

### Bounded polynomial coefficient in the resultant Bezout identity

`LocallyAnalyticDistributions:L4/entire-resultant-bezout` (lemma); proposed declaration `TauCeti.NonarchimedeanFredholm.entireResultant_bezout`.

For monic Q of degree d and entire F, there exist entire G and polynomial H with degree H<d such that i(C(Res(Q,F)))=i(Q)G+i(H)F. At d=0, Q=1 and one may take G=1,H=0.

Hypotheses:

- A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Q is a monic polynomial, including Q=1. F belongs to the existing entire-series subring, meaning weighted coefficients tend to zero at every positive real radius. No field, reducedness, Noetherianity or splitting assumption is imposed.

Proof outline:

1. Divide F=i(Q)S+i(R). The quotient-class definition makes Res(Q,F)=Res(Q,i(R)); the polynomial comparison identifies it with the native polynomial resultant of Q,R.
2. For d>0 invoke native exists_mul_add_mul_eq_C_resultant with m=d and n=R.natDegree. It supplies polynomial U,H with Q U+R H=C(Res), and degree H<d. The native nonzero-degree side condition holds because d>0.
3. Substitute R=F-QS to obtain Res=Q(U-HS)+HF. Take G=i(U)-i(H)S, which is entire by subring closure. This fixes the minus sign in the analytic coefficient.
4. For d=0, monic Q=1 and the quotient has empty basis, so Res=1. Choose G=1,H=0; degree(0) is bottom and is below the natural degree zero viewed in WithBot.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-division`, `LocallyAnalyticDistributions:L4/entire-polynomial-inclusion`, `LocallyAnalyticDistributions:L4/entire-resultants`, `LocallyAnalyticDistributions:L4/entire-resultant-polynomial`, `mathlib:Polynomial.exists_mul_add_mul_eq_C_resultant`.

Acceptance:

- The degenerate case cannot be obtained by calling the native Bezout-resultant theorem with both degree bounds zero; its explicit disjunction would fail.

Sources:

- Coleman-PadicBanach-published-1997, Appendix A3, printed434–435/PDF18–19: quotient-norm interpretation and Lemmas A3.5,A3.7. Worker decomposition of the stated quotient interpretation and proof, using the native monic quotient and resultant APIs. The source does not separately state this declaration or its weakened complete ultrametric ring hypotheses.

### Resultant of a monic polynomial and an entire series

`LocallyAnalyticDistributions:L4/entire-resultants` (construction); proposed declaration `TauCeti.NonarchimedeanFredholm.entireResultant`.

For monic Q of degree d and entire F, define the existing Res(Q,F) to be native Algebra.norm A (rho_Q(F)), equivalently the determinant of multiplication by rho_Q(F) in the native AdjoinRoot.powerBasis' basis indexed by Fin d. This refines the original finite-quotient determinant definition in place. It includes d=0, whose empty determinant is one.

Hypotheses:

- A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Q is a monic polynomial, including Q=1. F belongs to the existing entire-series subring, meaning weighted coefficients tend to zero at every positive real radius. No field, reducedness, Noetherianity or splitting assumption is imposed.

Proof outline:

1. Use entire-quotient-class and its kernel/surjectivity identification to realize the analytic quotient as native AdjoinRoot Q. Select the existing native powerBasis' for monic Q; no basis construction is planned.
2. Compose rho_Q with native Algebra.norm. Native norm_eq_matrix_det identifies this value with the existing determinant definition. The norm monoid homomorphism and rho ring homomorphism give multiplicativity; rho(Q)=0 gives invariance under adding Q times an entire series.
3. For Q=T-a use entire-quotient-class-linear. Native norm_algebraMap_of_basis on the rank-one basis gives F(a). For Q=1 the basis is empty and the value is one. For positive-degree Q, rho(Q)=0 makes the multiplication matrix zero in positive dimension, so Res(Q,Q)=0.
4. The spectral resultant D(B,P), the multivariable symmetric-function construction and their Fredholm transport remain separate gaps. No generic resultant or determinant is reconstructed.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-quotient-class`, `LocallyAnalyticDistributions:L4/entire-quotient-class-surjective`, `LocallyAnalyticDistributions:L4/entire-quotient-class-linear`, `mathlib:AdjoinRoot.powerBasis'`, `mathlib:Algebra.norm`, `mathlib:Algebra.norm_eq_matrix_det`, `mathlib:Algebra.norm_algebraMap_of_basis`.

Uses:

- resultant-unit, fredholm-resolvent and finite-slope-summands: Turn analytic coprimality into a unit statement in A and connect polynomial functional calculus to the Fredholm series.

Planning API:

- `entireResultant_remainder`: The resultant depends only on P modulo Q.
- `entireResultant_mul`: Res(Q,P1 P2)=Res(Q,P1) Res(Q,P2).
- `entireResultant_linear`: Res(T-a,P)=P(a).
- `entireResultant_norm`: Res(Q,F)=Algebra.norm A (rho_Q(F)) in the native monic quotient.
- `entireResultant_polynomial`: For native polynomial P the value is native Polynomial.resultant Q P Q.natDegree P.natDegree; promoted to its own comparison node.

Unit tests:

- `constant_divisor`: Res(1,P)=1, including P=0.
- `linear_evaluation`: Res(T-a,1-bT)=1-ba.
- `common_factor`: For positive-degree monic Q, Res(Q,Q)=0.
- `resultant_nilpotent_linear`: For Q=T^2 and P=a+bT, Res(Q,P)=a^2 over A, without reducedness or domain hypotheses.

Acceptance:

- Preserve the integrated resultant node, but do not hide the substantially harder D(B,P) construction in its hypotheses.

Sources:

- Coleman-PadicBanach-1997, Appendix A3, definition of resultant and Lemma A3.7. The finite quotient-algebra determinant; the separate spectral resultant is honestly kept unresolved.
- Coleman-PadicBanach-published-1997, printed434–435/PDF18–19, norm interpretation and Lemmas A3.5,A3.7. The retained node is decomposed through the analytic reduction map and exact native finite-algebra interfaces. No new source error or independent-review verdict is asserted.

### Resultant detects analytic coprimality

`LocallyAnalyticDistributions:L4/resultant-unit` (lemma); proposed declaration `TauCeti.NonarchimedeanFredholm.entireResultant_isUnit_iff`.

For monic Q and entire P, Res(Q,P) is a unit in A exactly when Q and P generate the unit ideal of A{{T}}.

Hypotheses:

- A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Q is a monic polynomial, including Q=1. F belongs to the existing entire-series subring, meaning weighted coefficients tend to zero at every positive real radius. No field, reducedness, Noetherianity or splitting assumption is imposed.

Proof outline:

1. The native finite power basis supplies Module.Free and Module.Finite. Unfold native Algebra.norm as the determinant of left multiplication; combine native LinearMap.isUnit_iff_isUnit_det and Algebra.lmul_isUnit_iff to get IsUnit(Res(Q,F)) exactly when rho_Q(F) is a unit. This is a composition of existing algebra lemmas, not a new generic norm theorem.
2. Lift the inverse of rho_Q(F) through the surjective rho_Q to an entire B. Then rho_Q(1-FB)=0, so the kernel theorem gives 1-FB=QG. Rearranging produces the actual entire Bezout equation GQ+BF=1. Conversely reduce any such equation to get an inverse of rho_Q(F).
3. For polynomial inputs, native Polynomial.isUnit_resultant_iff_isCoprime supplies the identical criterion through the polynomial comparison. The preceding resultant-Bezout certificate gives a second explicit forward construction: multiply its two coefficients by the scalar inverse of the unit Res. The coefficient of F remains a polynomial of degree below d. At Q=1 use G=1,B=0.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-resultants`, `LocallyAnalyticDistributions:L4/entire-quotient-class-kernel`, `LocallyAnalyticDistributions:L4/entire-quotient-class-surjective`, `LocallyAnalyticDistributions:L4/entire-resultant-bezout`, `mathlib:LinearMap.isUnit_iff_isUnit_det`, `mathlib:Algebra.lmul_isUnit_iff`, `mathlib:Polynomial.isUnit_resultant_iff_isCoprime`, `mathlib:isUnit_iff_exists_inv`, `mathlib:IsCoprime`.

Acceptance:

- Nonzero resultant is not enough over A; it must be a unit.

Sources:

- Coleman-PadicBanach-1997, Lemma A3.7 and proof. The unit criterion, isolated from the spectral-mapping theorem.
- Coleman-PadicBanach-published-1997, printed434–435/PDF18–19, norm interpretation and Lemmas A3.5,A3.7. The retained node is decomposed through the analytic reduction map and exact native finite-algebra interfaces. No new source error or independent-review verdict is asserted.

### Validation boundary

The complete suggested file compiles with zero errors and 240 proof-placeholder
warnings only. Its source audit reaches 2203 byte-checked Mathlib modules
and four actual pinned Tau Ceti modules; those four modules were separately
compiled from the pinned source into an isolated build. No planned supplier
module is imported. All implementation statuses remain unchecked.

Six separate scratch lemmas compile with no errors, warnings or placeholders,
using 1713 audited Mathlib modules and the same four Tau Ceti modules.
They prove the native norm/unit composition, native polynomial resultant/unit
comparison, unit lifting through a surjective map with explicitly supplied
principal kernel, its finite-algebra norm adapter, representative multiplication
and the polynomial-to-entire Bezout algebra adapter. The last adapters have
explicit ring-map, kernel or decomposition hypotheses; they do not implement
the planned analytic reduction map or its kernel theorem.

Independent exact arithmetic passes 3,534 assertions across 320 systems over
(Z/mZ)[epsilon]/epsilon^2 for m=4,8,9,25 and monic degrees zero through four.
The independent Sylvester and quotient-multiplication determinants agree;
remainder and product invariance, actual adjugate Bezout certificates, unit
normalization, nilpotent and nonzero-nonunit controls pass. Finite arithmetic
does not prove infinite convergence or the analytic division theorem.

## Earlier checkpoint material

**Historical monic-division checkpoint:** 104 unchecked nodes (12 constructions,3 definitions,56 lemmas,23 theorems,10 comparisons),60 API entries,74 packet tests (51 on definitions/constructions),74 typed examples,six planets and110 baseline references. Two source findings,eight gaps,five requests and zero closed stages remain. Historical checkpoint counts and validations below retain their earlier scope.

**Entire linear-division checkpoint, 27 September 2026.** The packet now has
92 unchecked nodes (8 comparisons, 11 constructions, 3 definitions, 49 lemmas, 21 theorems), 57 API entries, 70 packet tests,
70 typed examples, six planets and 94 baseline references. All 80 preceding
nodes and 84 baseline objects are preserved whole. Twelve new nodes and two
published-source findings are added. Eight gaps, five requests and zero closed
stages remain. Counts and validation statements in earlier checkpoint sections
below describe those historical checkpoints.

## L4 continuation: dividing entire series by a linear factor

Write F=sum c_n T^n in the existing native power-series ring A[[T]]. The predicate
IsEntire continues to mean that norm(c_n)R^n tends to zero for every real R>0.
This continuation uses a complete commutative normed ring A with submultiplicative
norm and norm(1)=1, and assumes the ultrametric inequality precisely in the
quotient bound, its entireness and the results that consume them. The parameter
a is any element of A. Neither a field structure, reducedness nor Noetherianity
is used. This is a weaker contract than the standing Noetherian K-Banach setup
of the Fredholm operator nodes.

The quotient is explicit:

q_n = sum_(k>=0) c_(n+1+k) a^k, and Q_a(F)=sum_(n>=0) q_n T^n.

Every tail converges for entire F. To see this, choose S>max(1,norm(a)). The
weighted coefficients at S tend to zero and are bounded by some M>=0. The kth
summand in the mth evaluated tail is bounded by
(M/S^m)(norm(a)/S)^k, an ordinary convergent geometric series of real norms.
This proves summability without an ultrametric assumption. The construction
uses native PowerSeries.mk and the total native tsum, so it has a value even
outside the entire subring; no additive, scalar or analytic interpretation is
claimed there unless separately justified.

For ultrametric A, a sharper bound gives norm(q_n)<=M/S^(n+1) whenever
norm(a)<=S and norm(c_m)S^m<=M. The existing native ultrametric infinite-sum
bound supplies this directly. Its total-sum convention also proves the bound
on arbitrary formal inputs; that is distinct from proving their convergence.
For an entire input and a desired radius R, choose S>max(R,norm(a),1). Then

norm(q_n) R^n <= (M/S)(R/S)^n,

which tends to zero. Thus the quotient is entire at every radius. Taking S=R
would only give a uniform bound, so the larger radius is essential.

Splitting the first term of each convergent tail gives
q_n=c_(n+1)+a q_(n+1). The same operation on evaluation gives
F(a)=c_0+a q_0. Coefficientwise these two equations prove

F=(T-a)Q_a(F)+F(a).

The sign, the one-step coefficient shift and the constant remainder are all
fixed by this identity. In particular Q_a(T^2)=T+a. At a=0 the construction
agrees with the native shifted-coefficient series appearing in
PowerSeries.eq_X_mul_shift_add_const; no new generic formal division operator
is introduced.

Uniqueness is an analytic statement even though the identity lives in native
formal series. If (T-a)H=b is constant and H is entire, its coefficients satisfy
h_n=a h_(n+1), hence h_n=a^k h_(n+k). Fix R>=max(1,norm(a)). Entireness implies
that R^(-n) norm(h_(n+k))R^(n+k) tends to zero, while it bounds norm(h_n) from
above. Thus every coefficient vanishes, then b=0. Apply this to the difference
of two entire quotients to obtain simultaneous uniqueness of quotient and
constant remainder. This does not cancel a nonunit or discard a nilpotent.

Native Polynomial.divByMonic and its remainder-at-a theorem already give the
polynomial division identity. Polynomial coefficients have finite support,
so the existing polynomial inclusion is entire. Comparing that identity with
the tail quotient by analytic uniqueness proves exact compatibility with the
native polynomial quotient. Finally, F(a)=0 is equivalent to divisibility of F
by T-a with an entire quotient; the converse follows by uniqueness of the
constant remainder. No evaluation operation on arbitrary formal substitutions
is assumed.

### Ownership and remaining scope

Accepted RS-16 leaves these Fredholm/entire-polynomial helpers in L4. The
reviewed AUDIT-25 rows and current upstream models were checked. The existing
ProfiniteProPGroups Layer9 linear Weierstrass division has a different contract:
bounded integral Z_p series and a topologically nilpotent parameter. It is not
reconstructed here. The DiophantineApproximationAndTranscendence division nodes
concern complex entire functions (and several complex variables), rather than
the coefficient-decay algebra over a Banach ring.

Pinned native PowerSeries.WeierstrassPreparation provides ideal-adic division
under IsWeierstrassDivisorAt and IsAdicComplete. It does not supply arbitrary-a
entire Banach-ring division, so it is a documented near miss rather than a
claimed baseline implementation. Existing native coefficient constructors,
infinite-sum bounds, geometric convergence and polynomial division are reused.

The earlier general monic division node is preserved. Its degree>=2 quotient
and finite-dimensional remainder recurrences still require decomposition, as
do the quotient-basis/resultant interfaces, spectral resultant transport and
finite-projective determinant/rank arguments. These twelve declarations do not
close L4, and they add no planet beyond its existing six.

### Summability of every evaluated coefficient tail

`LocallyAnalyticDistributions:L4/entire-tail-summable` (lemma); proposed declaration `TauCeti.NonarchimedeanFredholm.entire_tail_summable`.

If F=sum c_n T^n is entire and a is any element of A, then for every m>=0 the series sum_(k>=0) c_(m+k) a^k is summable. The case m=0 is evaluation at a.

Hypotheses and conventions:

- A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

Proof outline:

1. Choose S>max(1,norm(a)). Entireness at S makes norm(c_j)S^j converge to zero; the native bounded-range theorem supplies M>=0 bounding every term.
2. Submultiplicativity and norm_pow_le bound norm(c_(m+k)a^k) by (M/S^m)(norm(a)/S)^k. The ratio lies in [0,1).
3. Use the native summable geometric series, scalar multiplication and norm-dominated summability in the complete normed additive group. This argument does not require the ultrametric inequality.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:Filter.Tendsto.bddAbove_range`, `mathlib:norm_pow_le`, `mathlib:summable_geometric_of_lt_one`, `mathlib:Summable.of_norm_bounded_eventually_nat`.

Acceptance:

- At a=0 only k=0 survives. For m=0 this supplies the actual convergence needed to split entire_eval, not merely a total tsum value.

Sources:

- Coleman-PadicBanach-published-1997, Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Tail quotient for division by a linear factor

`LocallyAnalyticDistributions:L4/entire-linear-quotient` (construction); proposed declaration `TauCeti.NonarchimedeanFredholm.entireLinearQuotient`.

For a in A and a native formal series F=sum c_n T^n, define Q_a(F) by coefficient q_n=sum_(k>=0) c_(n+1+k)a^k, using the total native infinite sum. Its analytic quotient interpretation and additive/scalar laws below are asserted for entire F, where every tail converges. No new carrier for entire series is introduced.

Hypotheses and conventions:

- A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

Proof outline:

1. Apply native PowerSeries.mk to the displayed total coefficient function. The preceding tail-summability node justifies its convergent interpretation on the existing entire-series subring.
2. Derive zero, constants and the zero-parameter shift coefficientwise. For entire inputs, summability permits additivity and multiplication by a scalar. The promoted coefficient, recurrence, norm, entireness and polynomial comparison nodes expose the interface used by later declarations.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-series`, `LocallyAnalyticDistributions:L4/entire-tail-summable`, `mathlib:PowerSeries.mk`, `mathlib:PowerSeries.coeff_mk`.

Uses:

- Coleman A3, proof of Lemma A3.5 and the quotient-algebra interpretation on printed434: Provide the linear-factor analytic quotient and its polynomial remainder.
- L4/entire-linear-root-factor and existing entireResultant_linear API: Identify the entire ideal generated by T-a and the remainder F(a), without assuming evaluation on an arbitrary formal series converges.

Planning API:

- `entireLinearQuotient_coeff`: The coefficient q_n is the convergent tail sum_(k>=0)c_(n+1+k)a^k for entire F; the total coefficient equality holds for every F. Promoted to its own node.
- `entireLinearQuotient_zero`: Q_a(0)=0.
- `entireLinearQuotient_add`: For entire F,G, Q_a(F+G)=Q_a(F)+Q_a(G).
- `entireLinearQuotient_C_mul`: For entire F and any b in A, Q_a(bF)=b Q_a(F).
- `entireLinearQuotient_C`: Q_a(b)=0 for any constant b.
- `entireLinearQuotient_at_zero`: Q_0(F) is the native shifted series with coefficient c_(n+1), for every formal F.
- `entireLinearQuotient_entire`: If F is entire and A is ultrametric, Q_a(F) is entire. Promoted to its own node.
- `entireLinearQuotient_polynomial`: For a polynomial P, Q_a(P) is the native monic polynomial quotient P divided by T-a, included in the native power-series ring. Promoted to its own comparison node.

Typed tests:

- `linear_quotient_constant`: For any a,b in A, Q_a(b)=0.
- `linear_quotient_quadratic`: For any a in A, Q_a(T^2)=T+a.
- `linear_quotient_zero_shift`: For every formal F, Q_0(F)=PowerSeries.mk of the shifted coefficients c_(n+1).
- `linear_quotient_native_polynomial`: For ultrametric A, any a and polynomial P, Q_a(P)=the native polynomial quotient P divByMonic (T-a) included in A[[T]].
- `linear_quotient_zero_divisor`: For e in A with e^2=0, Q_e(eT^2)=eT. Nonzero nilpotents need not be discarded.

Acceptance:

- Q_a(T^2)=T+a; replacing n+1+k by n+k or changing a to -a fails this test.
- Neither a topologically nilpotent parameter nor a domain hypothesis is introduced.

Sources:

- Coleman-PadicBanach-published-1997, Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Coefficient formula for the tail quotient

`LocallyAnalyticDistributions:L4/entire-linear-quotient-coeff` (lemma); proposed declaration `TauCeti.NonarchimedeanFredholm.entireLinearQuotient_coeff`.

For every formal F, a and n, coeff_n(Q_a(F))=sum_(k>=0)c_(n+1+k)a^k as an equality of total native sums; for entire F the sum converges.

Hypotheses and conventions:

- A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

Proof outline:

1. Unfold only the constructor and apply the native coefficient-of-mk equation. Summability on entire inputs is provided by the construction prerequisite.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-linear-quotient`, `mathlib:PowerSeries.coeff_mk`.

Acceptance:

- The first quotient coefficient starts at c_1, not c_0.

Sources:

- Coleman-PadicBanach-published-1997, Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Recurrence for linear-quotient coefficients

`LocallyAnalyticDistributions:L4/entire-linear-quotient-recurrence` (lemma); proposed declaration `TauCeti.NonarchimedeanFredholm.entireLinearQuotient_recurrence`.

For entire F, q_n=c_(n+1)+a q_(n+1) for every n>=0.

Hypotheses and conventions:

- A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

Proof outline:

1. Use the generated additive Summable.tsum_eq_zero_add from the indexed native multiplicative declaration to split k=0 from the convergent tail.
2. Reindex the remaining k+1 terms, use a^(k+1)=a a^k and commute the scalar a with the sum.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-linear-quotient-coeff`, `LocallyAnalyticDistributions:L4/entire-tail-summable`, `mathlib:Multipliable.tprod_eq_zero_mul`, `mathlib:Summable.tsum_mul_left`.

Acceptance:

- For F=T^2 the recurrence gives q_1=1 and q_0=a, fixing both sign and indexing.

Sources:

- Coleman-PadicBanach-published-1997, Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Ultrametric bound for each quotient coefficient

`LocallyAnalyticDistributions:L4/entire-linear-quotient-bound` (lemma); proposed declaration `TauCeti.NonarchimedeanFredholm.entireLinearQuotient_bound`.

Suppose A is ultrametric, S>0, norm(a)<=S and M>=0 satisfies norm(c_m) S^m<=M for all m. Then norm(coeff_n(Q_a(F)))<=M/S^(n+1) for every n. This bound is valid for the total construction even without an entireness assumption; it does not by itself assert tail convergence.

Hypotheses and conventions:

- A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

Proof outline:

1. Multiply the norm of the kth summand by S^(n+1). Submultiplicativity and norm(a)^k<=S^k give norm(c_(n+1+k))S^(n+1+k)<=M. Divide by the positive S^(n+1).
2. Install the native ultrametric instance and apply the generated additive norm_tsum_le_of_forall_le_of_nonneg. Its total-sum convention makes the bound valid even for a nonsummable input; analytic use separately invokes entire-tail-summable.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-linear-quotient-coeff`, `mathlib:norm_pow_le`, `mathlib:IsUltrametricDist.isUltrametricDist_of_isNonarchimedean_norm`, `mathlib:IsUltrametricDist.norm_tprod_le_of_forall_le_of_nonneg`.

Acceptance:

- At n=0 the loss is M/S, not M. The boundary norm(a)=S is allowed in the bound.

Sources:

- Coleman-PadicBanach-published-1997, Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Entireness of the linear quotient

`LocallyAnalyticDistributions:L4/entire-linear-quotient-entire` (lemma); proposed declaration `TauCeti.NonarchimedeanFredholm.entireLinearQuotient_entire`.

Over ultrametric A, for every a and entire F the quotient Q_a(F) is entire.

Hypotheses and conventions:

- A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

Proof outline:

1. Fix R>0 and choose S>max(R,norm(a),1). Boundedness of the coefficient sequence at S supplies M>=0.
2. The quotient bound gives norm(q_n)R^n <= (M/S)(R/S)^n. Since 0<R/S<1, the native geometric limit and squeezing give convergence to zero. Repeat for every positive R.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-linear-quotient-bound`, `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:Filter.Tendsto.bddAbove_range`, `mathlib:tendsto_pow_atTop_nhds_zero_of_lt_one`.

Acceptance:

- There is no restriction norm(a)<1. A larger radius than the tested radius is essential; boundedness at R alone is insufficient.

Sources:

- Coleman-PadicBanach-published-1997, Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Division identity with evaluation as remainder

`LocallyAnalyticDistributions:L4/entire-linear-division` (theorem); proposed declaration `TauCeti.NonarchimedeanFredholm.entire_linear_division`.

For entire F and arbitrary a, F=(T-a)Q_a(F)+F(a) in native A[[T]], where F(a)=sum_(n>=0)c_n a^n and the remainder is a constant series.

Hypotheses and conventions:

- A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

Proof outline:

1. For coefficient n+1 the displayed identity is exactly q_n-a q_(n+1)=c_(n+1), the preceding recurrence.
2. For coefficient zero, split the convergent evaluation sum to obtain F(a)=c_0+a q_0. The scalar term then cancels -a q_0.
3. Apply native coefficient extensionality. The identity itself uses normed-ring summability; the separate entireness node supplies the analytic quotient over an ultrametric ring.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-linear-quotient-recurrence`, `LocallyAnalyticDistributions:L4/entire-tail-summable`, `mathlib:PowerSeries.ext`, `mathlib:PowerSeries.coeff_succ_X_mul`, `mathlib:PowerSeries.coeff_C_mul`, `mathlib:Multipliable.tprod_eq_zero_mul`, `mathlib:Summable.tsum_mul_left`.

Acceptance:

- At a=0 this is the existing native shift identity F=T shift(F)+c_0. A formal substitution with nonzero constant is never applied to a general series.

Sources:

- Coleman-PadicBanach-published-1997, Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### An entire linear product cannot be a nonzero constant

`LocallyAnalyticDistributions:L4/entire-linear-product-constant` (lemma); proposed declaration `TauCeti.NonarchimedeanFredholm.entire_linear_product_constant`.

If H is entire and (T-a)H=b is a constant series, then H=0 and b=0. This holds over a complete commutative normed ring without a domain assumption.

Hypotheses and conventions:

- A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

Proof outline:

1. Positive-degree coefficients give h_n=a h_(n+1), hence induction gives h_n=a^k h_(n+k) for every k.
2. Choose R>=max(1,norm(a)). For fixed n, norm(h_n)<=R^(-n) norm(h_(n+k))R^(n+k), whose right side tends to zero by entireness at R and a shifted natural-index limit. The native closed-order limit lemma forces norm(h_n)=0.
3. All coefficients vanish; coefficient zero in the product identity now gives b=0. This is the linear-factor corrected entire case of the issue in Coleman A3.1; no claim is made for all restricted series.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:PowerSeries.coeff_succ_X_mul`, `mathlib:PowerSeries.coeff_C_mul`, `mathlib:PowerSeries.ext`, `mathlib:norm_pow_le`, `mathlib:le_of_tendsto`.

Typed tests:

- `linear_entire_uniqueness_boundary`: For any a in A, the native formal geometric series H=sum a^n T^n satisfies (1-aT)H=1. At a=p in Q_p it is restricted but not entire, disproving the unrestricted replacement in Coleman A3.1.

Acceptance:

- For A=Q_p, H=sum p^n T^n is restricted and (1-pT)H=1. It is not entire: at radius p its weighted coefficients are all one. Thus restricted convergence cannot replace entireness.

Sources:

- Coleman-PadicBanach-published-1997, Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.
- Coleman-PadicBanach-published-1997, Lemma A3.1, printed432/PDF16; corrected linear entire case, finding LocallyAnalyticDistributions/E1. Mathematical transcription of the displayed notation in the scanned page. The stated restricted-series assertion is false; the node assumes entire H and proves its own linear case.

### Uniqueness of the entire quotient and constant remainder

`LocallyAnalyticDistributions:L4/entire-linear-division-unique` (theorem); proposed declaration `TauCeti.NonarchimedeanFredholm.entire_linear_division_unique`.

If F=(T-a)G+b=(T-a)H+c with entire G,H and b,c in A, then G=H and b=c.

Hypotheses and conventions:

- A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

Proof outline:

1. Subtract the two identities. The existing entire-series subring is closed under subtraction, so G-H is entire.
2. Apply the preceding product-constant lemma to (T-a)(G-H)=c-b; conclude both differences vanish.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-linear-product-constant`, `LocallyAnalyticDistributions:L4/entire-series`.

Acceptance:

- The statement permits zero divisors and arbitrary a. It never cancels T-a inside all formal series.

Sources:

- Coleman-PadicBanach-published-1997, Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Native polynomials are entire

`LocallyAnalyticDistributions:L4/polynomial-series-entire` (lemma); proposed declaration `TauCeti.NonarchimedeanFredholm.polynomialSeries_entire`.

The existing polynomialSeries inclusion sends every polynomial P in A[T] to an entire series. This promotes the existing polynomials_are_entire test to a named prerequisite.

Hypotheses and conventions:

- A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

Proof outline:

1. Identify the existing eval-based polynomialSeries map with the native polynomial-to-power-series inclusion by polynomial induction. Its nth coefficient is P.coeff n by the baseline coefficient comparison.
2. Above the finite polynomial degree all coefficients are zero, so at each positive radius the weighted coefficient sequence is eventually zero.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:Polynomial.coeff_coe`.

Acceptance:

- Constants and the zero polynomial are included. No analytic convergence estimate is required.

Sources:

- Coleman-PadicBanach-published-1997, Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Agreement with native monic polynomial division

`LocallyAnalyticDistributions:L4/entire-linear-quotient-polynomial` (comparison); proposed declaration `TauCeti.NonarchimedeanFredholm.entireLinearQuotient_polynomial`.

For ultrametric A, arbitrary a and polynomial P, Q_a(polynomialSeries(P)) equals polynomialSeries(P divByMonic (T-a)).

Hypotheses and conventions:

- A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

Proof outline:

1. The native monic-division identity writes P=(T-a)(P divByMonic (T-a))+P(a). Map it into native power series; both polynomial terms are entire by the preceding lemma.
2. The entire division identity gives a second decomposition, with an entire tail quotient. Uniqueness equates the quotients and also the remainders. No separate evaluation comparison for a polynomial is needed to apply uniqueness with these two constants.

Prerequisites: `LocallyAnalyticDistributions:L4/polynomial-series-entire`, `LocallyAnalyticDistributions:L4/entire-linear-quotient-entire`, `LocallyAnalyticDistributions:L4/entire-linear-division`, `LocallyAnalyticDistributions:L4/entire-linear-division-unique`, `mathlib:Polynomial.divByMonic`, `mathlib:Polynomial.modByMonic_add_div`, `mathlib:Polynomial.modByMonic_X_sub_C_eq_C_eval`.

Acceptance:

- For P=T^2, native division gives T+a; for P constant it gives zero. The polynomial operation is imported rather than recreated.

Sources:

- Coleman-PadicBanach-published-1997, Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Roots and linear factors in the entire-series ring

`LocallyAnalyticDistributions:L4/entire-linear-root-factor` (theorem); proposed declaration `TauCeti.NonarchimedeanFredholm.entire_root_iff_linear_factor`.

For ultrametric A, arbitrary a and entire F, F(a)=0 if and only if there exists an entire G with F=(T-a)G.

Hypotheses and conventions:

- A is a complete commutative normed ring with submultiplicative norm and norm(1)=1. The named series is entire when explicitly required; a is any element of A. No field, reducedness, Noetherianity or small-norm condition on a is assumed.

Proof outline:

1. If F(a)=0, take G=Q_a(F); entireness and the division identity supply the factorization.
2. Conversely compare the asserted decomposition with constant remainder zero to the constructed entire decomposition with constant remainder F(a). Uniqueness forces F(a)=0.

Prerequisites: `LocallyAnalyticDistributions:L4/entire-linear-division`, `LocallyAnalyticDistributions:L4/entire-linear-quotient-entire`, `LocallyAnalyticDistributions:L4/entire-linear-division-unique`.

Acceptance:

- The factor must be entire; a merely formal factor can exist when evaluation is nonzero. Over Q_p, T-p^(-1) is a unit in Q_p[[T]], but it does not divide 1 in Q_p{{T}}.

Sources:

- Coleman-PadicBanach-published-1997, Section A3, printed p.434/PDF18, proof of Lemma A3.5; linear-factor specialization. Worker deduction supplying the explicit linear-factor division input to this passage. The source does not state the coefficient formula or this weaker Banach-ring generality.

### Published source findings awaiting independent review

The fresh source reading covered the full published printed430–435/PDF14–19,
with separate image checks of printed432 and433, and the author copy PDF22–28.
The published scan and author copy are separately identified and hashed in
sourceVersions. These findings are recorded without an author-supplied or
independent-review verdict. The bounded correction search is documented below;
"new" records that no correction was found in that search.

#### LocallyAnalyticDistributions/E1: error affecting a stated result

Published Lemma A3.1, printed432/PDF16; also author-copy PDF22–23. Display notation checked on both page images.

Printed: H(T) is in A⟨T⟩ and G(T)H(T) is in A, then either G(T) is constant or H(T)=0. (Mathematical transcription of the scanned display.)

Correction: Replace the restricted-series hypothesis H in A⟨T⟩ by the entire-series hypothesis H in A{{T}} for the stated rescaling proof. The new nodes prove the linear-factor entire case directly.

Reason: Take A=Q_p, G=1-pT and H=sum_(n>=0)p^n T^n. The leading coefficient -p is multiplicative, H is a nonzero restricted series, and GH=1; G is nonconstant. H is not entire because at radius p the weighted coefficients are all1. Rescaling T to a^M T to make the leading term dominate does not in general preserve restricted convergence, whereas entire convergence survives every fixed rescaling. This falsifies the auxiliary lemma as stated; it does not refute the later entire-series division or resultant conclusions.

#### LocallyAnalyticDistributions/E2: misprint affecting the proof

Published proof of Lemma A3.4, printed433/PDF17; also author-copy PDF24. Published formula checked on the page image.

Printed: K(T)=sum_(i=1)^n (-1)^i c_i T^(n-i). (Mathematical transcription of the scanned display.)

Correction: Insert the missing leading term: K(T)=T^n+sum_(i=1)^n(-1)^i c_i T^(n-i).

Reason: The preceding Q is monic and the proof constructs a universal splitting algebra by imposing K(T)=product_i(T-b_i). As printed K has zero T^n coefficient; equating coefficients imposes0=1, giving the zero ring and no way to infer the claimed identity in C. The monic correction is the intended polynomial and restores the splitting-algebra argument. The displayed slip alone does not disprove Lemma A3.4.

Correction search:

- 27September2026: opened the Springer version-of-record landing page https://link.springer.com/article/10.1007/s002220050127; no correction link found. Read the published scan from the recorded public mirror and the separately hashed public author copy.
- Targeted public searches for the title with erratum/correction and Coleman A3.1 with error/entire, and Coleman A3.4 with correction/erratum; no relevant correction located. This was a bounded search, not proof that none exists.
- Searched the atlas source-issues registry and research/errata/REGISTER.md for the exact title and author-copy identifier: no existing finding found. The wstein memorial directory did not open and its paper endpoint returned403, so no successful reading of that page is claimed.

For A3.1 the counterexample meets the source's multiplicative-leading-coefficient
condition: every nonzero element of Q_p has multiplicative norm. Its rescaling
argument works for entire H because every fixed rescaling remains convergent.
The local new uniqueness lemma proves its own linear case directly. For A3.4
the missing monic term collapses the displayed coefficient quotient to the zero
ring; restoring it gives the intended universal splitting polynomial. Neither
finding is represented as a disproof of the later entire resultant conclusions.

### Validation boundary

The complete suggested file compiles with zero errors and 197 proof-placeholder
warnings only, against 1,983 byte-checked pinned Mathlib sources. It contains
seventeen newly named declarations and six new typed examples. All implementation
statuses remain unchecked. There are no actual planned-supplier or Tau Ceti imports.

A separate scratch file proves eleven lemmas using one native quotient
construction, with no errors, warnings or proof placeholders, against 2,795
byte-checked Mathlib sources. Three lemmas take explicit summability hypotheses
to verify addition, the recurrence and the division identity; another proves
iteration from an explicit coefficient recurrence. The other seven verify
native coefficients, zero/shift behavior, ultrametric sum and weighted bounds,
polynomial division and the formal geometric counterexample. These checks do
not implement the planned entire convergence or analytic uniqueness theorems.

Independent exact arithmetic passes 17,775 assertions over 640 finite polynomial
systems for primes2,3,5,7, using rational coefficient pairs modeling the
nonreduced ring Q_p[epsilon]/epsilon^2. It compares descending Euclidean division
with the coefficient-tail formula, checks Horner evaluation, norm/radius bounds,
scalar/additive laws, sign/index controls and both source findings. Finite
truncation tests are not used as a proof about infinite series.

## Earlier checkpoint material

**Fredholm coefficient checkpoint, 27 September 2026.** The current packet has
80 unchecked nodes, 49 API entries, 64 packet tests and typed examples,
6 planets and 84 baseline declarations. Eight gaps, five requests and no
closed stages remain. The coefficient section below gives the current proof
dependencies of the four existing Fredholm declarations. Earlier counts and
validation reports are historical.

# Locally analytic distributions, growth, and character spaces

Current checkpoint:75 nodes; the finite-projectivity continuation and current validation are below. Earlier validation paragraphs are explicitly historical. The roadmap remains partial, with no closed stage.

This is a **partial blueprint** for the five layers L0–L4. It preserves the thirteen reviewed operator-theory nodes already integrated in the atlas and refines their dependencies. No layer is marked closed. The construction of actual distribution families is not supplied by the abstract Fredholm theory alone.

The ownership decisions of accepted restructuring RS-16 are binding. The base roadmap is **Padic measures and Iwasawa algebras** (`PadicMeasuresIwasawaAlgebras`). Its layer L0a owns scalar character-space representability, component decompositions, universal characters and coordinate changes. This roadmap imports those objects. It owns the unbounded distribution transform, growth theory and distribution-family coefficient actions, including the uniform local radii needed to evaluate a universal character on an affinoid coefficient module. There is no reverse dependency making the scalar character-space construction depend on those distribution families.

## Conventions and existing libraries

Work over a complete nontrivially valued nonarchimedean field K. For the operator theory, A is a nonzero commutative Noetherian K-Banach algebra with a compatible submultiplicative ultrametric norm. Banach A-modules are complete and Hausdorff and have compatible bounded scalar action. A need not be a field, reduced or affinoid. Treat the zero algebra as a separate trivial case.

An operator norm on an A-linear map is its norm after restricting scalars to K. **Finite rank means that the image lies in a finitely generated A-submodule.** It does not mean finite dimension over K or that the containing module is free. Complete continuity means approximation in that operator norm by finite-A-image maps.

The pinned library baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The packet lists 66 Mathlib declarations whose actual source statements and surrounding hypotheses were inspected in source files verified against the pinned Git tree. In particular, reuse the following rather than reconstructing them:

* `ZeroAtInftyContinuousMap`, its extensionality theorem and completeness instance. For a discrete index type I this is the carrier c_A(I), with its sup norm. I is arbitrary, not necessarily countable.
* `NonarchimedeanAddGroup.summable_iff_tendsto_cofinite_zero` and `HasSum.mul_of_nonarchimedean`. These supply unconditional summability and multiplication of sums, not just convergence of a chosen enumeration.
* `ContinuousLinearMap.exists_preimage_norm_le` and `ContinuousLinearMap.isOpenMap`. These already apply over nontrivially normed fields, so the Banach open-mapping part of the nonarchimedean argument is not new work.
* `Matrix.det_mul` for finite matrices over a commutative ring.

The inspected definition `IsCompactOperator` is a related but different notion: some neighbourhood has relatively compact image. It is not substituted for complete continuity over A. For example, the A-linear identity of A is finite A-rank even when A is an infinite-dimensional K-affinoid algebra. This is not a claim that its image of a neighbourhood is relatively compact.

All five LAD rows of the reviewed aggregate `data/library-coverage.json` were read, together with the integrated thirteen-node decomposition, its accepted review, the LAD decisions of RS-16 and all applicable link records. Its Tau Ceti search results remain leads, not a fresh exhaustive audit. The native operator, Noetherian module and c0 interfaces listed in the packet are targeted statement checks.

## L0. Banach spaces of locally analytic functions

**Imports:** `PadicMeasuresIwasawaAlgebras:L0` and `:L2`.

The target is the fixed-radius Banach space of functions analytic on each residue ball, with its Gauss norm, over finite extensions of Q_p and finite-dimensional p-adic analytic manifolds. The declarations must prove uniform radius on compact manifolds, independence of charts, restrictions, tensor products and continuous inclusions. Construct the locally convex inductive-limit topology and compare its strong continuous dual with the projective system of Banach duals. The continuous-function dual from the base roadmap supplies the bounded-measure injection, not the locally analytic topology by definition.

The Q_p-locally analytic and F-locally analytic notions must be distinguished on O_F and its products. Equality of underlying functions does not identify their locally convex topologies. The source proofs for this layer have not yet been decomposed; its coverage is `not_read`. The operator-theory construction of c0 in L4 does not count as coverage of L0.

## L1. Amice's unbounded transform

**Imports:** L0 and the bounded transform and operator conventions from `PadicMeasuresIwasawaAlgebras:L2`.

Prove the unbounded Amice transform, including the Frechet topology comparison, in RJW Theorem 3.43. Its target series converge at every radius r<1, which is different from the entire series required by Fredholm theory. Extend restriction, twisting, phi, psi and differentiation with exact norm and domain statements. Division by x is constructed on distributions supported on units; it does not use a globally defined analytic inverse of x on Z_p.

Primitives on admitted balls are unique modulo locally constant functions. A single global additive constant requires a separate continuation theorem. Applications at p-power roots of unity must establish the logarithm's domain and cancellation of apparent poles. RJW was identified as arXiv:2309.15692, but its proof text was not read in this pass. This layer remains `not_read`.

## L2. Admissible growth and uniqueness

**Import:** L1.

Define order-h admissibility by explicit small-ball norms on locally polynomial test functions and compare it with coefficient growth. State the Amice–Velu/Vishik extension and uniqueness theorem with its strict degree bound. Prove that order zero agrees with bounded measures in the intended setting. Do not apply strict small-slope uniqueness at critical slope.

In several variables, retain vectors of radii and growth bounds. A specified collection of arithmetic characters determines a distribution only after the required density or admissibility theorem has been proved. No general principle identifying arbitrary analytic functions from unspecified arithmetic points is admitted. This layer remains `not_read`.

## L3. Character spaces and Mellin transforms

**Imports:** L2; `PadicMeasuresIwasawaAlgebras:L0a` and `:L3`.

Import, rather than reconstruct, the scalar character-space functor, its representability, universal character, generator changes, odd-prime components and the dyadic decomposition. The work here is the scalar Mellin transform, evaluation under coefficient extension, weight derivatives, twists and functoriality for the relevant ray-class group maps. Distinguish bounded functions arising from measures and meromorphic functions arising from pseudo-measures, with explicit evaluation domains.

The geometric comparison uses affinoid constructions and open gluing. Diamonds are not needed. General completed tensor products are not silently requested from the foundational AdicSpaces roadmap, whose stated scope excludes them. Source decomposition of this layer remains `not_read`.

## L4. Families and operator theory

### 4.1. Orthonormal coordinates and complete continuity

Use the source convention

\[
 u(e_i)=\sum_j a_{ij}e_j,\qquad r_j(u)=\sup_i\|a_{ij}\|.
\]

Thus i is an input index and j an output index. Let pi_S retain a finite set S of output coordinates.

A chosen orthonormalization is an A-linear isometry to c_A(I). A potential orthonormalization is a continuous A-linear equivalence with continuous inverse; equivalently, the module becomes ONable after replacing its norm by an equivalent norm. Do not confuse this with an algebraic basis of an infinite-dimensional module.

**Definition API.** `orthonormalization_coordinates` reconstructs an element from its coordinates; `potentiallyON_iff_equivalentNorm` gives the two-sided norm-bound characterization; `coordinateProjection_norm_le` states that finite coordinate projections are contractions in an ON chart. Unit tests: `empty_basis` gives the zero module; `finite_basis` compares with the max norm on A^n; `potential_not_isometric` uses a rescaled one-dimensional K-norm whose scale lies outside the value group, giving a potential but not unit-length ON basis for that norm.

**Bounded-family extension.** A bounded family m_i in M determines a unique continuous A-linear map c_A(I) to M by summing x_i m_i. The cofinite-null property of x and the boundedness of m give unconditional summability. Under the normalized action bound its norm is sup_i norm(m_i). The API is `c0Lift_apply`, `c0Lift_single`, `c0Lift_unique`. Tests are `zero_family`, `basis_family`, and `unbounded_family`: the images rho^(-i), with 0<norm(rho)<1, cannot be the basis images of a bounded functional.

**Imported complete-continuity API.** `finiteImage_isCompletelyContinuous` admits finite-A-image maps; `isCompletelyContinuous_comp` gives the two-sided ideal property; `isClosed_completelyContinuous` identifies the closed approximation class. Tests: `identity_on_A` is admitted even for infinite K-dimension; `identity_on_infinite_c0` is rejected over nonzero A; `decaying_diagonal` admits diag(rho^n) without requiring finite K-rank.

The finite-submodule argument is split into canonical topology, algebraic finite-coordinate detection, the inverse norm bound and uniform coordinate approximation. For a finite submodule Q and epsilon>0, prove

\[
 \|q-\pi_Tq\|\leq\epsilon\|q\|\quad(q\in Q)
\]

for a common finite T. The bounded-preimage theorem supplies uniformly controlled coefficients relative to finitely many generators. Their simultaneous small tails give the estimate. This is a uniform assertion on Q, not just a test on generators. The BGR canonical-topology and closed-submodule proofs still require full decomposition.

It follows that complete continuity of u is equivalent to cofinite decay of r_j(u), and pi_S u then converges to u in operator norm. The Noetherian hypothesis is retained in the finite-image-to-column-decay direction. Source: Buzzard Lemma 2.3 and Proposition 2.4.

### 4.2. Determinants, entire series and two different product rules

For a completely continuous endomorphism define

\[
 P_u(T)=\sum_{n\geq0}c_n(u)T^n,\quad c_0=1,
 \qquad c_n=(-1)^n\sum_{|S|=n}\det(a_{ij})_{i,j\in S}.
\]

The family of minors of each fixed size tends to zero outside finite subsets of its index set. Use unconditional summability to construct the formal series; prove entireness separately.

**Determinant API.** `fredholmSeries_coeff`, `fredholmSeries_constant`, `fredholmSeries_isEntire`. Tests: `zero_operator` gives one; `rank_one_scalar` gives 1-aT; `nonzero_nilpotent` gives one for a nonzero two-by-two nilpotent block. The last test prevents a false equivalence between determinant one and the zero operator.

Define A{{T}} by norm(c_n)R^n tending to zero for **every** R>0. Its topology uses the family of Gauss seminorms; do not call it complete for the single radius-one norm. The API is `mem_entireSeries`, `entire_eval`, `entire_eval_bound`. Tests: `polynomials_are_entire`, `superexponential_coefficients` with c_n=rho^(n*n), and `geometric_nonexample` with c_n=1. The geometric series distinguishes this algebra from L1's open-unit-disc algebra.

If u has image in the coordinate module A^S, all minors meeting its complement vanish. Its determinant therefore equals the ordinary determinant on A^S. General finite free submodule comparison, chart independence, equivalent-norm invariance and the cyclic identity P_uv=P_vu follow the reviewed Buzzard Lemma 2.5–2.7 route. In the cyclic proof only u is completely continuous. Truncate v on the finite relevant image; **do not assert that its global coordinate truncations converge to v**.

The new proof chain makes evaluation in the product identity explicit.

**Uniform minor tails.** Suppose one cofinite-null bounded family b_j bounds the output-column norms of an entire family of matrices. Given R>0 and 0<q<1, choose finite T with Rb_j<=q outside T. Put m=card(T) and B=max(1,R sup_j b_j). Then, uniformly in the matrix,

\[
 \|c_n\|R^n\leq B^m q^{\max(n-m,0)}.
\]

Every product in a principal n-minor uses distinct output columns. At most m are exceptional. Ultrametricity introduces neither a factorial nor a factor counting permutations. Passing through the unconditional sum preserves the bound.

For fixed n>=1 and norm(u),norm(v)<=C with C>=1, telescoping the difference of determinant products gives

\[
 \|c_n(u)-c_n(v)\|\leq\|u-v\|C^{n-1}.
\]

Consequently an operator-norm convergent family with a common column majorant has determinants converging in every R-Gauss seminorm. Choose a uniformly small tail in degree, then handle the finitely many remaining coefficients. For R>=1 this justifies evaluation at T=1. Coefficientwise convergence alone would not do so.

**Evaluated product identity.** Set w=u+v-uv, with uv meaning u composed with v. For common finite coordinate sets S, set u_S=pi_Su, v_S=pi_Sv and w_S=u_S+v_S-u_Sv_S. All three approximants have image in the same A^S and converge in norm. A common column majorant is

\[
 b_j=\max\{r_j(u),r_j(v),\|v\|r_j(u)\}.
\]

The output column in the composition estimate belongs to u. Apply ordinary `Matrix.det_mul` to (1-u_S)(1-v_S), then use the Gauss convergence proved above. This yields

\[
 P_{u+v-uv}(1)=P_u(1)P_v(1),
\]

without a commutation assumption. For a (Pr) module use one splitting i,r with ri=1 for both operators. The lift u to iur preserves sums and products and reduces the assertion to c0.

The rank-one regression u=v=1 is essential: P_{u+v-uv}(T)=1-T, whereas P_u(T)P_v(T)=(1-T)^2. This is not a whole-series identity for u+v-uv. By contrast, the direct-sum identity P_(u plus v)=P_u P_v really is an identity of series.

### 4.3. Property (Pr), scalar extension and its determinant

Define (Pr) by a continuous split embedding into a potentially ONable module, or equivalently into some c_A(I). It does not include finite generation or constant rank. Prove its equivalent lifting property for **surjective** continuous maps of Banach modules, using norm-controlled lifts of basis images. A bare choice of lifts is not enough to prove continuity. A finite (Pr) module is algebraically projective by splitting a finite free presentation.

**Property API.** `hasPr_of_potentiallyON`, `hasPr_retract`, `hasPr_iff_split_c0`. Tests: `zero_hasPr`, `finite_free_hasPr`, and `projective_not_free`. The last uses A=K times K and e=(1,0): eA is a continuous summand of A, but its component ranks differ, so it is not free.

Define the determinant on M with (Pr) by extending u by zero on a complement. The cyclic identity compares different complements. Its API is `fredholmSeriesPr_split`, `fredholmSeriesPr_agrees_ON`, `fredholmSeriesPr_baseChange`. Tests: `pr_zero_operator`, `add_zero_complement`, and `variable_rank_projective`. For id on eA the determinant is 1-eT. Its leading coefficient is not a unit, although the operator is invertible.

Completed scalar extension must identify the completed extension of c_A(I) with c_B(I) for a **continuous**, not necessarily contractive, algebra map A to B. Transfer column estimates and convergent coefficient sums. The completed tensor carrier, BGR 2.1.7 proof and the extension of retractions in Buzzard Lemmas 2.12–2.13 remain open decomposition tasks; they are not fields of an assumed eigenvariety structure.

### 4.4. Resultants, resolvents and finite-slope summands

For monic Q, establish unique division P=QS+R with S entire and degree R<degree Q. The recurrence estimates proving an entire quotient require an explicit source expansion. Define Res(Q,P) as the determinant of multiplication by the remainder of P on the finite free quotient A[T]/(Q). Its API is `entireResultant_remainder`, `entireResultant_mul`, `entireResultant_linear`. Tests: `constant_divisor` gives Res(1,P)=1, even for P=0; `linear_evaluation` gives Res(T-a,1-bT)=1-ba; `common_factor` gives Res(Q,Q)=0 for positive-degree monic Q.

The determinant/adjugate criterion and analytic division give: Res(Q,P) is a **unit** exactly when P and Q generate the unit ideal of A{{T}}. Being nonzero is not enough over A. The spectral resultant D(B,P), and its identification with the determinant of polynomial functional calculus, is a separate construction whose transport from Coleman A3.8–A3.9 is still unresolved here.

Define the Fredholm resolvent by v_0=1 and v_n=c_n 1+u v_(n-1). Serre's adjugate-minor estimate gives entire convergence of the operator-valued series; the recurrence by itself does not. Prove both identities (1-Tu)F_u=F_u(1-Tu)=P_u(T)1. API: `resolventCoeff_zero`, `resolventCoeff_succ`, `resolvent_entire`, `resolvent_identity`. Tests: `rank_one_resolvent` is one; `diagonal_two` is diag(1-bT,1-aT); `nilpotent_two` is 1+TN for a square-zero two-by-two block.

The reviewed polynomial criterion says Q is coprime to P_u exactly when Q*(u) is invertible. The new evaluated product theorem supplies a formerly implicit step in its converse. If L=Q*(u) is invertible, then v=1-L and w=1-L^(-1) are completely continuous, (1-v)(1-w)=1, and P_v(1)P_w(1)=1. **Identifying this value with the appropriate resultant still needs the spectral-mapping theorem.** Closing the product gap does not close all of Lemma 3.1.

At a Hasse root a of order h, differentiate the resolvent identity with Hasse derivatives and evaluate. Put z_s=Delta^s F_u(a), c=Delta^h P_u(a), e=c^(-1)(1-au)z_h and f=-c^(-1)u z_(h-1). The relations e+f=1 and f e^h=0 give complementary projectors e^h and 1-e^h. They lie in the operator-norm closure of A[u]. On their summands, (1-au)^h is respectively invertible and zero. Handle h=0 separately.

On the nilpotent summand the identity is a polynomial in u without constant term, hence completely continuous. A sufficiently close finite-A-image approximation is invertible by the Neumann series, proving finite generation. Property (Pr) then gives projectivity.

The rank argument must not conceal either of two pitfalls. First, an invertible operator on a finite projective module does not by itself give a determinant polynomial with unit leading coefficient before constant rank is known: id on eA is the counterexample above. Prove rank h on each maximal-ideal fibre from the exact Hasse order and the complementary factor's invertibility, then use the constant-rank determinant and analytic division argument. Second, equality on all residue fields is not equality over a nonreduced ring: 1+epsilon T over K[epsilon]/(epsilon^2) is a regression test.

For P_u=QS with Q(0)=S(0)=1, Q polynomial with unit leading coefficient and Q,S analytically coprime, obtain the finite projective slope summand N of rank degree Q. The initial root construction gives power-annihilation by Q*(u). The final determinant comparison P_(u|N)=Q and finite-projective Cayley–Hamilton are needed to prove that Q*(u) itself kills N. This final step is retained from Buzzard Theorem 3.3.

### 4.5. Distribution families and acceptance boundary

The actual affinoid-valued analytic functions and distributions, integral models, completed tensor products, specialization maps, universal-character actions and their uniform local radii remain part of L4. They are not supplied by naming an abstract Banach module. The semigroup operators used in modular symbols and automorphic cohomology require their own continuity and complete-continuity estimates. Specialization must preserve a stated slope-adapted factorization, not an arbitrary pointwise numerical slope cutoff.

Exports are required by the atlas consumers in PadicFamilies, ModularSymbolsPadicLFunctions, AutomorphicPadicLFunctions, AutomorphicGaloisRepresentationsPartII and PhiGammaModulesAndIwasawaCohomology. The acceptance suite must include an order-zero comparison, a positive-order distribution that is not a bounded measure, multivariable growth tests, strict-slope uniqueness and universal-character evaluation under scalar extension.

## Coordinate detection and the finite-generation criterion

The elementary interfaces below refine the operator theory without asserting that all its analytic foundations are settled. In particular, the finite-coordinate lemma is algebraic, whereas closedness of a finite submodule in a Banach module still uses the BGR input.

### One complete-continuity predicate

`AdicSpacesPartII:R3/completely-continuous-map` already owns the finite-range approximation predicate and its composition, addition and closure API. This packet imports that predicate. The existing `completely-continuous` ID is retained as a comparison, so its consumers and the reviewed Fredholm graph are preserved. The suggested file labels the supplier signature as a stub and uses a local abbreviation for it.

There are two conventions to compare. Buzzard calls an operator finite rank when its image is contained in a finite A-submodule. The supplier asks that the image itself be finitely generated. Over a Noetherian ring A these agree: `Submodule.FG.of_le` applies to the image contained in the finite submodule, and the reverse direction takes the image itself as the containing module. This argument does not use freeness or finite K-dimension. Without Noetherianity, a submodule of a finite module need not be finite, so the comparison must retain that hypothesis.

The supplier's mathematical contract currently assumes affinoid coefficients. Its suggested ordinary predicate has a broader signature, but a broad signature alone is not a proof plan for the required generality. The request to R3 asks for the ordinary predicate and ideal/closure API over commutative Noetherian K-Banach algebras and compatible complete modules. The strict complete-continuity variant is not part of this import. This request is an explicit dependency boundary for the generic Fredholm theory.

`isCompletelyContinuous_iff_containing_finite` is the comparison API. The original tests are preserved: the identity of A has finite A-image, the identity on infinite c0 does not, and a decaying diagonal does. These tests prevent the imported notion from being replaced by finite K-rank or by `IsCompactOperator`.

### The existing c0 carrier supports ring coefficients

Mathlib supplies `ZeroAtInftyContinuousMap`, its pointwise module operations and the norm inherited from bounded continuous functions. Its field-valued `NormedSpace` instance does not directly give the missing continuous A-action when A is only a normed ring. The scalar-bound node supplies the precise interface:

\[
\|a x\|\leq\|a\|\,\|x\|.
\]

For each coordinate, submultiplicativity bounds the product by the right-hand side. `BoundedContinuousFunction.norm_coe_le_norm` bounds each coordinate of x, and `BoundedContinuousFunction.norm_le` passes the uniform bound to the existing norm. Its nonnegative-bound condition handles an empty domain correctly. `IsBoundedSMul.of_norm_smul_le` and `IsBoundedSMul.continuousSMul` then give joint continuity. No field structure on A and no replacement sequence-space carrier are required.

The instance API is `c0ContinuousSMul`. Besides the inherited coordinate tests, `scalar_empty` checks the zero-index norm and `scalar_single` checks a times the vector with coefficient b equals the vector with coefficient ab. The repaired Lean signatures permit coordinate index types and coefficient types to inhabit different universes. This matters for the finite and countable examples with an arbitrary coefficient algebra.

### Algebraic finite-coordinate detection

Let B be any commutative Noetherian ring and Q a finite submodule of the full product B^I, where I is arbitrary. Choose generators q_1,...,q_r. For i in I, form the column

\[
v_i=(q_1(i),\ldots,q_r(i))\in B^r.
\]

The module B^r is Noetherian. Therefore the span of all the columns is finitely generated. The pinned finite-subset-of-generators theorem chooses a finite collection of the actual columns that spans it; choose their indices as S. This uses Noetherianity of the finite product B^r, not of the generally much larger product B^I.

If x and y in Q agree on S, express x-y as a linear combination of the q_alpha. Its coefficients define a linear functional on B^r. It vanishes on the selected columns, hence on their span, hence on every v_i. Every coordinate of x-y is therefore zero. This proves `finite_coordinate_detection` and the algebraic part of Buzzard Lemma 2.3(a).

The empty submodule needs no coordinates. The constant vector (1,0) in (K times K)^N gives a test with a nonfree finite submodule: coordinate zero detects it. Conversely a coordinate vector supported outside S is nonzero while all its S-coordinates vanish. This last test rules out an assertion that an arbitrary finite coordinate set detects every finite submodule.

For a finite submodule of c_A(I), apply the lemma to its image under the coordinate embedding; finite generation of this image is `Submodule.FG.map`. Proving that its induced norm is equivalent to the canonical finite-module norm remains dependent on BGR closedness and topology. The algebraic lemma does not conceal that analytic step.

### Complete continuity of the identity

The pointwise approximation predicate is equivalent to strict approximation in the K-operator norm. For the forward implication, approximate with pointwise error epsilon/2 and use `ContinuousLinearMap.opNorm_le_bound`. For the reverse implication, `ContinuousLinearMap.le_opNorm` bounds each value. `Metric.mem_closure_iff` identifies this with the norm-closure formulation. Strict error less than zero is impossible, which tests the positive-radius condition.

Now suppose the identity of M is completely continuous. Choose a finite-A-image operator alpha with norm(id-alpha)<1. Work in the existing complete normed ring of continuous K-linear endomorphisms and apply `isUnit_one_sub_of_norm_lt_one` to beta=id-alpha. The result says that alpha, after scalar restriction, is invertible. The native bijectivity criterion gives surjectivity of its underlying function. For this argument there is no need to construct a separate norm on the A-linear endomorphism ring or to prove that the inverse is A-linear.

The image of alpha is contained in a finite A-submodule Q. Surjectivity forces Q=M, so `Module.finite_def` gives finite generation over A. Conversely a finite A-module has a finite-range identity and a constant approximating family. Thus complete continuity of the identity is equivalent to finite A-generation, without potential ONability or property (Pr). The zero module, arbitrary endomorphisms of finite A-modules and the identity on a nonfinite A-module provide the three tests.

This closes the Neumann-series interface in the proof plan for Buzzard Proposition 3.2. The subsequent projectivity and rank arguments still have their separately recorded dependencies.

### Tests for norms and varying rank

All three inherited tests missing from the original prototype now have Lean example signatures. For the rescaled-line test, take an actual normed K-line M with an algebraic coordinate e and norm(x)=c norm(e(x)), for c>0 outside the value group of K. The coordinate gives a continuous equivalence, but an isometry would make c the norm of a nonzero scalar, a contradiction. The test states the rescaling law explicitly; it does not assume the desired failure of isometry.

For the other two tests, use the actual submodule generated by (1,0) inside A=K times K. Projection onto the first component gives a continuous splitting, so eA has (Pr). It is nonzero and the nonzero scalar (0,1) annihilates it; a nonzero free A-module is faithful, so eA cannot be free. Extending its identity by zero on the complementary factor is multiplication by e on the free rank-one module A. Its Fredholm determinant is consequently 1-eT. The leading coefficient is a nonunit, despite invertibility of the identity on eA. These are concrete safeguards for the later constant-rank argument.

## L4 continuation: Hasse calculus for the Riesz projectors

The source proof differentiates an entire operator-valued resolvent. This bridge
requires a formal operation, a norm estimate and an actual convergent evaluation.
Keep these separate. Polynomial Hasse derivatives already exist at the pin; the
new construction extends them to the native power-series carrier. All formulas
admit positive characteristic. Completeness enters evaluation, not the formal
coefficient construction or its norm bound.

The analytic statements below retain the explicit bounded scalar-action constant
C and the K-operator norm. In particular, the proof does not silently replace a
bounded A-action by a contractive one. The operator-valued adjugate estimate now has the separate finite-matrix,
truncation and retraction chain below; its convergence is not inferred from
the algebraic recurrence.

### Hasse derivatives of formal power series

**Declaration:** `LocallyAnalyticDistributions:L4/hasse-series` (construction).

For any possibly noncommutative semiring B and s in N, construct the additive B-linear operation Delta_s on the existing B[[T]] by coefficient_n(Delta_s f)=choose(n+s,s) times coefficient_(n+s)(f). Multiplication by the natural number means repeated addition, with no inverse factorial and no convergence assumption.

**Hypotheses:** B is a semiring; s and coefficient indices are natural numbers. The variable T is central.

**Dependencies:** `mathlib:PowerSeries.mk`, `mathlib:PowerSeries.coeff_mk`.

**Proof/construction.** Apply the native power-series constructor to the displayed coefficient sequence. Coefficient extensionality and distributivity prove additivity and left B-linearity; natural-number multiplication commutes with left scalar multiplication. Order zero uses choose(n,0)=1. A monomial of degree d<s has every coefficient zero; at d=s its Hasse derivative is the constant coefficient. These finite computations do not shift a formal series by a nonzero constant.

**Uses:** LocallyAnalyticDistributions:L4/hasse-product: Differentiates the formal two-sided resolvent identity. LocallyAnalyticDistributions:L4/resolvent-hasse-evaluation: Supplies the coefficient sequence to be summed after convergence is proved.

**API**

- `hasseSeries_coeff` (characterisation): Coefficient n is choose(n+s,s) times coefficient n+s.
- `hasseSeries_zero` (simp): Delta_0 f=f.
- `hasseSeries_add` (compatibility): Delta_s(f+g)=Delta_s f+Delta_s g.
- `hasseSeries_smul` (compatibility): Delta_s(b f)=b Delta_s f, including noncommutative B.

**Unit tests**

- `hasse_order_zero` (degenerate): Delta_0 fixes every series.
- `hasse_degree_boundary` (non-example): Delta_s(b T^d)=0 whenever d<s.
- `hasse_top_monomial` (characterisation): Delta_s(b T^s)=b, not s factorial times b.
- `hasse_characteristic_two` (non-example): Over Z/2, Delta_2(T^2)=1 although the second ordinary polynomial derivative is zero.

**Acceptance:** Do not define this by dividing an iterated derivative by s factorial. Formal substitution T+a is not performed on arbitrary formal power series.

**Sources:** Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Polynomial and series Hasse derivatives agree

**Declaration:** `LocallyAnalyticDistributions:L4/hasse-polynomial-comparison` (comparison).

The native inclusion of B[T] in B[[T]] carries Polynomial.hasseDeriv s p to Delta_s of the included polynomial, for every semiring B.

**Hypotheses:** No topology, characteristic restriction or commutativity of B.

**Dependencies:** `LocallyAnalyticDistributions:L4/hasse-series`, `mathlib:Polynomial.hasseDeriv`, `mathlib:Polynomial.hasseDeriv_coeff`, `mathlib:Polynomial.coeff_coe`.

**Proof/construction.** Compare coefficient n on both sides. The pinned polynomial formula is choose(n+s,s) times coefficient n+s. Natural-number scalar multiplication is its natural cast multiplied on the left. This is an adapter to the existing polynomial operation, not a new polynomial differentiation theory.

**Acceptance:** Preserve the order of coefficient multiplication over noncommutative semirings.

**Sources:** Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Hasse product formula for power series

**Declaration:** `LocallyAnalyticDistributions:L4/hasse-product` (lemma).

For f,g in B[[T]] and s in N, Delta_s(fg)=sum over i+j=s of (Delta_i f)(Delta_j g), with f before g in every product.

**Hypotheses:** B is any semiring; the sum over pairs of natural numbers with i+j=s is finite.

**Dependencies:** `LocallyAnalyticDistributions:L4/hasse-polynomial-comparison`, `mathlib:Polynomial.hasseDeriv_mul`, `mathlib:PowerSeries.coeff_trunc`, `mathlib:PowerSeries.coeff_mul_eq_coeff_trunc_mul_trunc`.

**Proof/construction.** Fix the coefficient n to be compared and truncate both f and g at N=n+s+1. All coefficients used on the left have degree at most n+s. On the right a contributing convolution pair r+t=n and Hasse pair i+j=s uses coefficients r+i and t+j, both less than N. Replace each by its polynomial truncation coefficient. Apply the existing polynomial Hasse product theorem and the polynomial comparison. Coefficient extensionality concludes the formal identity without any infinite rearrangement.

**Acceptance:** A noncommutative coefficient test must distinguish fg from gf.

**Sources:** Serre-EndomorphismesCC-1962, Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14); Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Hasse coefficient radius bound

**Declaration:** `LocallyAnalyticDistributions:L4/hasse-coefficient-bound` (lemma).

For a normed ring B, f in B[[T]], s,n in N and real R>0, norm(coefficient_n(Delta_s f)) R^n is at most R^(-s) norm(coefficient_(n+s)(f)) (2R)^(n+s).

**Hypotheses:** B need not be commutative, complete, ultrametric or norm-one. R is strictly positive.

**Dependencies:** `LocallyAnalyticDistributions:L4/hasse-series`, `mathlib:norm_pow_le_mul_norm`, `mathlib:Nat.choose_le_two_pow`.

**Proof/construction.** The additive counterpart norm_nsmul_le of the indexed multiplicative declaration bounds repeated addition by choose(n+s,s) times the coefficient norm. Bound the binomial coefficient by 2^(n+s). Multiply by the nonnegative R^n and rewrite 2^(n+s) R^n as R^(-s)(2R)^(n+s). Positivity of R justifies cancellation.

**Acceptance:** The right radius is 2R; a fixed radius argument alone does not prove entireness. The zero operator ring is admitted; no norm-one identity is used.

**Sources:** Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Hasse derivatives preserve entireness

**Declaration:** `LocallyAnalyticDistributions:L4/hasse-entire` (lemma).

If for every real R>0 the sequence norm(f_n) R^n tends to zero, the same holds for the coefficients of Delta_s f, for each fixed s. This applies to a possibly noncommutative normed coefficient ring.

**Hypotheses:** B is a normed ring; no completeness is needed for this coefficient limit statement.

**Dependencies:** `LocallyAnalyticDistributions:L4/hasse-coefficient-bound`, `LocallyAnalyticDistributions:L4/entire-series`.

**Proof/construction.** Apply the original decay at 2R to the shifted index n+s, which tends to infinity. Multiply by the fixed factor R^(-s). The Hasse coefficient norm is nonnegative and bounded by this sequence. Squeeze to zero, for each R>0. On commutative A this is exactly membership in the existing entire-series carrier.

**Acceptance:** Entireness means all positive radii, not merely radii less than one.

**Sources:** Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Evaluated Hasse derivatives of the resolvent

**Declaration:** `LocallyAnalyticDistributions:L4/resolvent-hasse-evaluation` (construction).

For a in A and s in N, construct z_s(a)=sum_n choose(n+s,s) a^n v_(n+s) as a continuous A-linear endomorphism of M, where v_n are the existing Fredholm resolvent coefficients. The sum converges in the native K-operator norm.

**Hypotheses:** Standing Banach hypotheses; M has (Pr) and u is completely continuous. Use the norm after restriction to K. The compatible A-action has an explicit bound norm(bx) <= C norm(b) norm(x) for some C>0; C is not assumed to be one.

**Dependencies:** `LocallyAnalyticDistributions:L4/resolvent-series`, `LocallyAnalyticDistributions:L4/hasse-entire`, `mathlib:ContinuousLinearMap.instCompleteSpace`, `mathlib:ContinuousLinearMap.opNorm_le_bound`, `mathlib:ContinuousLinearMap.le_opNorm`, `mathlib:Summable.of_norm_bounded_eventually_nat`, `mathlib:summable_geometric_of_lt_one`.

**Proof/construction.** Form the Hasse coefficient series in the existing complete normed ring of continuous K-linear endomorphisms. The previous entireness lemma applies to the norm after scalar restriction. Choose rho>max(norm(a),0). Hasse entireness makes norm(w_n) rho^n eventually at most one. The scalar-action bound and operator-norm inequality give norm(a^n w_n) <= C (norm(a)/rho)^n eventually. Thus the norms and the operators are summable by the real geometric series and completeness. Every partial sum is A-linear. Operator-norm convergence implies pointwise convergence, and continuity of scalar multiplication lets the A-linearity equality pass to the limit. Package the limit as the native continuous A-linear map; uniqueness of limits makes it independent of the chosen bound and radius. At s=0 compare term by term with the existing resolvent evaluation. At a=0 the only surviving term is v_s. This uses no change of module norm and creates no competing operator carrier.

**Uses:** LocallyAnalyticDistributions:L4/evaluated-hasse-resolvent: Evaluates the formal differentiated identity. LocallyAnalyticDistributions:L4/riesz-root-projectors: Constructs the operators z_h and z_(h-1) entering the projectors.

**API**

- `resolventHasseAt_hasSum` (characterisation): The binomially weighted resolvent coefficient sequence has this sum in the native K-operator norm, with the explicit bounded-action hypothesis.
- `resolventHasseAt_zero` (compatibility): Hasse order zero agrees with the existing resolventAt.
- `resolventHasseAt_at_zero` (simp): At a=0 the value is exactly v_s.

**Unit tests**

- `hasse_scalar_resolvent` (degenerate): On the line A with u=a, the resolvent numerator is constant one, so z_1(t)=0.
- `hasse_diagonal_resolvent` (characterisation): For diag(a,b), z_1(t)=diag(-b,-a), independent of t.
- `hasse_nilpotent_resolvent` (non-example): For the nonzero nilpotent two-by-two Jordan block N, z_1(t)=N even though P_N=1.

**Acceptance:** This construction consumes resolvent-series entireness, now supported by resolvent-recurrence-entire and its separate adjugate/truncation/retraction chain. The recurrence alone cannot supply convergence.

**Sources:** Serre-EndomorphismesCC-1962, Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14); Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Evaluated Hasse resolvent recurrence

**Declaration:** `LocallyAnalyticDistributions:L4/evaluated-hasse-resolvent` (lemma).

For every s>=0 and a in A, (1-au) z_(s+1)(a) - u z_s(a) = Delta_(s+1) P_u(a) times 1, and z_(s+1)(a)(1-au) - z_s(a)u has the same value. The order-zero identity is the existing two-sided resolvent identity, using z_0(a)=F_u(a).

**Hypotheses:** Standing Banach hypotheses; M has (Pr) and u is completely continuous. Use the norm after restriction to K. The compatible A-action has an explicit bound norm(bx) <= C norm(b) norm(x) for some C>0; C is not assumed to be one.

**Dependencies:** `LocallyAnalyticDistributions:L4/hasse-product`, `LocallyAnalyticDistributions:L4/resolvent-hasse-evaluation`, `LocallyAnalyticDistributions:L4/hasse-polynomial-comparison`, `LocallyAnalyticDistributions:L4/resolvent-series`, `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:HasSum.mul_left`, `mathlib:HasSum.mul_right`.

**Proof/construction.** Apply the formal product formula to (1-Tu)F_u=P_u times 1. Its only nonzero derivatives on the first factor have orders zero and one, with Delta_1(1-Tu)=-u. This gives the left formal recurrence; start with F_u(1-Tu) for the right recurrence. The Hasse evaluation construction gives absolute norm summability at a. Continuous left/right multiplication may therefore pass through the sum. The extra T shifts the index with an explicit zero constant term, and multiplication by a is the bounded scalar operator. Coefficient-wise scalar identities evaluate to Delta_(s+1) P_u(a) times the identity: the map b to scalar multiplication by b is bounded by C. Preserve both product orders until commutation is established separately.

**Acceptance:** At a Hasse root of order h the right side vanishes for s+1<h and equals the specified unit c at s+1=h. The s=0 identity is not obtained by using a negative derivative order.

**Sources:** Serre-EndomorphismesCC-1962, Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14); Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Hasse resolvent values lie in the polynomial closure

**Declaration:** `LocallyAnalyticDistributions:L4/hasse-polynomial-closure` (lemma).

For every a in A and s in N, the restricted K-linear map z_s(a) belongs to the closure, in the native K-operator norm, of the set of finite polynomial expressions sum_i b_i u^i with b_i in A.

**Hypotheses:** Standing Banach hypotheses; M has (Pr) and u is completely continuous. Use the norm after restriction to K. The compatible A-action has an explicit bound norm(bx) <= C norm(b) norm(x) for some C>0; C is not assumed to be one.

**Dependencies:** `LocallyAnalyticDistributions:L4/resolvent-hasse-evaluation`, `LocallyAnalyticDistributions:L4/resolvent-series`, `mathlib:hasSum_iff_tendsto_nat_of_summable_norm`.

**Proof/construction.** Induct on n in v_0=1 and v_(n+1)=c_(n+1) times 1+u v_n to express v_n as a polynomial in u with scalar A-coefficients. Each finite partial sum defining z_s(a) remains a polynomial in u; the binomial and a powers are scalar coefficients. The construction proves norm summability, hence convergence of initial partial sums to z_s(a). A limit of elements of the polynomial set lies in its closure. There is no use of a norm on A-linear endomorphisms independent of scalar restriction.

**Acceptance:** The topology is operator norm, not pointwise convergence. The zero module is included.

**Sources:** Serre-EndomorphismesCC-1962, Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14); Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Hasse resolvent values commute

**Declaration:** `LocallyAnalyticDistributions:L4/hasse-resolvent-commutation` (lemma).

Each z_s(a) commutes with u and with every z_t(b), for all a,b in A and s,t in N.

**Hypotheses:** Standing Banach hypotheses; M has (Pr) and u is completely continuous. Use the norm after restriction to K. The compatible A-action has an explicit bound norm(bx) <= C norm(b) norm(x) for some C>0; C is not assumed to be one.

**Dependencies:** `LocallyAnalyticDistributions:L4/hasse-polynomial-closure`, `mathlib:ContinuousLinearMap.toNormedRing`.

**Proof/construction.** A-linearity of u makes every scalar multiplication by A commute with u; commutativity of A then makes all finite polynomials in u commute with one another. For a fixed polynomial operator q, the equation xq=qx defines a closed set because multiplication in the native K-operator ring is continuous. Taking the first limit shows z_s(a) commutes with each polynomial. Fix z_s(a) and take a second limit through the same closed commutation equation. This proves commutation with z_t(b); choosing q=u proves the first assertion. Faithfulness of scalar restriction returns the A-linear equalities.

**Acceptance:** Use two successive limits, not an unproved assertion that arbitrary limits preserve products uniformly.

**Sources:** Serre-EndomorphismesCC-1962, Section 7, Proposition 12 proof, printed pp. 80-81 (PDF pp. 13-14).

### Roots of an entire series with unit constant are units

**Declaration:** `LocallyAnalyticDistributions:L4/entire-root-unit` (lemma).

If f in A{{T}} has constant coefficient one and f(a)=0, then a is a unit with inverse -sum_(n>=0) f_(n+1) a^n. In particular a positive-order Hasse root of a Fredholm determinant is a unit.

**Hypotheses:** A is a complete commutative normed ring; no field, reducedness, Noetherianity or characteristic hypothesis is needed.

**Dependencies:** `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:Summable.of_norm_bounded_eventually_nat`, `mathlib:summable_geometric_of_lt_one`, `mathlib:HasSum.mul_left`.

**Proof/construction.** Choose rho>max(norm(a),0). Decay of norm(f_(n+1)) rho^(n+1) bounds the shifted coefficient norm by a constant times rho^(-n). Thus the shifted tail evaluated at a is absolutely summable by a geometric comparison. Separate the constant term in the convergent evaluation and shift the tail: 0=f(a)=1+a sum_n f_(n+1) a^n. Moving terms gives a times the displayed negative tail equal to one. Commutativity supplies the reverse product identity and therefore a unit with this inverse. The argument does not infer equality from residue fields.

**Unit tests**

- `root_nonunit_constant` (non-example): The entire polynomial T vanishes at zero, which is not a unit in a nonzero coefficient algebra.

**Acceptance:** The constant-coefficient assumption is essential: f=T has the nonunit root zero. For Hasse order zero no root vanishing is assumed, and this lemma is not applied.

**Sources:** Buzzard-Eigenvarieties-2006, Section 3, p. 22, Hasse derivatives and roots; Proposition 3.2, pp. 23-24.

### Return to the Riesz proof

For h>0, the determinant has constant term one and vanishes at a, so the new
unit-root lemma gives an explicit inverse of a. Put c=Delta_h P_u(a), which is
assumed to be a unit. The evaluated recurrence gives e=c^(-1)(1-au)z_h and
f=-c^(-1)u z_(h-1), with e+f=1. Its vanishing equations inductively give
(1-au)^(s+1)z_s=0 for s<h. The commutation lemma therefore gives f e^h=0.
Expanding (e+f)^h proves that p=e^h and q=1-p are complementary idempotents.
Their polynomial-closure property now has explicit analytic prerequisites.

The finite-projective rank and exact determinant arguments retain the existing
nonreduced-coefficient safeguards. The Hasse nodes alone do not establish these arguments or the adjugate
coefficient estimate. The separate chain below supplies the latter; completed
tensors, spectral resultants and actual distribution families remain open. At order h=0
the root-vanishing/unit argument is not used.

## L4 continuation: the explicit Riesz decomposition

Write v=1-au, z_s=Delta_s F_u(a), and let c=Delta_h P_u(a) be a unit,
with all earlier Hasse values zero. Put b=c⁻¹z_h, p=(vb)^h and E=1-p.
The projector E selects the generalized root space N; its complement p selects F.
These are continuous A-linear endomorphisms on the existing module. The result is
N=ker(v^h), F=image(v^h), with a continuous inverse b for v on F.
No reducedness or scalar-field hypothesis on A is added.

The source proof has three distinct steps: Hasse calculus, the explicit
projector split, and finite-projective rank/determinant. This continuation
specifies the middle step. It imports native idempotents, kernel/image and
continuous projections, and retains every remaining analytic and rank gap.
The general ring and module facts used to verify the formulas are scratch
proofs, not a second proposed projection library.

### Lower Hasse resolvent annihilation

`LocallyAnalyticDistributions:L4/hasse-lower-annihilation` (lemma).

For every s<h, v^(s+1) z_s=0.

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/evaluated-hasse-resolvent`, `LocallyAnalyticDistributions:L4/hasse-resolvent-commutation`, `LocallyAnalyticDistributions:L4/resolvent-series`.

Proof or construction:

1. For h>0 the order-zero identity v z_0=P_u(a) I is zero. For s+1<h the Hasse recurrence gives v z_(s+1)=u z_s.
2. Induct: v^(s+2)z_(s+1)=v^(s+1)u z_s=u v^(s+1)z_s=0. Commutation follows since v=1-au. For h=0 the conclusion has no instances.

Acceptance: Use the exact s+1 exponent, including the s=0 boundary; no factorials.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

### Normalized Hasse resolvent identity

`LocallyAnalyticDistributions:L4/hasse-normalized-annihilation` (lemma).

The actual b=c^(-1)z_h commutes with v, and v^h(1-vb)=0, including h=0.

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/hasse-lower-annihilation`, `LocallyAnalyticDistributions:L4/evaluated-hasse-resolvent`, `LocallyAnalyticDistributions:L4/hasse-resolvent-commutation`, `LocallyAnalyticDistributions:L4/resolvent-series`.

Proof or construction:

1. For h>0 the top recurrence is v z_h-u z_(h-1)=c I. Multiply by the inverse scalar to get 1-vb=-c^(-1)u z_(h-1).
2. The lower-annihilation lemma at h-1 kills this after multiplication by v^h; scalar multiplication is central in the ring of A-linear endomorphisms. Commutation of v with b follows from commutation of u with z_h.
3. For h=0 use v z_0=P_u(a)I=cI directly, giving vb=1. This avoids a fictitious z_(-1) and supplies invertibility even though there is no root.

Acceptance: The nonzero coefficient must be a unit, not merely nonzero. For diag(1,3) over Z/4 at a=1, the first Hasse value is 2 and cannot be inverted. This finite-ring control tests the algebra, not the standing Banach hypotheses.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

### Explicit Hasse Riesz projector

`LocallyAnalyticDistributions:L4/riesz-projector-formula` (construction).

Define rieszRootProjector(u,Pr,cc,a,h,c)=E=1-((1-au)(c^(-1)z_h))^h as a native continuous A-linear endomorphism; its complement is p=1-E. The formula exists for every a,h and chosen unit c; its spectral properties require the exact Hasse-order hypotheses.

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/resolvent-hasse-evaluation`.

Proof or construction:

1. Use composition, powers, scalar multiplication and subtraction on the existing ring of continuous A-linear endomorphisms. There is no new operator carrier.
2. At h=0 the formula gives E=0 and p=1. Under the root hypotheses, the following lemmas identify it with the source projector onto N, while Serre calls its complement p.

Acceptance: The sign and choice of summand are fixed by the diagonal test. Retain generalized eigenspaces.

Uses:

- `LocallyAnalyticDistributions:L4/riesz-root-projectors`: Supplies explicit continuous projectors for the analytic split before finite generation and projectivity.
- `LocallyAnalyticDistributions:L4/finite-slope-summands`: The root splitting applied to a polynomial in u is the intermediate step; exact Q-star annihilation and rank remain separate.
- `PadicFamilies:L2a`: The existing consumer ultimately needs canonical finite-slope summands; this checkpoint supplies only the algebraic projector component of that chain.

API:

- `rieszRootProjector_formula`: Equality with 1-((1-au)(c^(-1)z_h))^h on the existing continuous-linear-map carrier.
- `rieszRootProjector_zero_order`: For h=0 the projector is zero for every a and chosen unit c.
- `rieszRootProjector_fixed_iff`: Under the exact Hasse-order hypotheses, E x=x if and only if v^h x=0.
- `rieszRootProjector_eq_projectionL`: Under the exact Hasse-order hypotheses, there is a native topological-complement proof for ker(v^h) and image(v^h), and E equals its existing Submodule.projectionL.

Unit tests:

- `riesz_order_zero` (degenerate): At order zero the formula gives E=0 on every M, even without the root hypotheses.
- `riesz_scalar_root` (computation): For u=identity on A, a=1, h=1 and c=-1, E is the identity.
- `riesz_diagonal_root` (characterisation): For u=diag(1,0) on the native two-coordinate c0 module, a=1, h=1, c=-1, E=diag(1,0), not its regular complement.
- `riesz_jordan_root` (non-example): For u=I+N with the nonzero two-by-two nilpotent Jordan block N, a=1, h=2, c=1, E=I although 1-u is nonzero. The full generalized eigenspace is required.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

### Idempotence of the Hasse projector

`LocallyAnalyticDistributions:L4/riesz-projector-idempotence` (lemma).

Under the exact Hasse-order hypotheses, E is idempotent; p=1-E is its complementary idempotent.

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/riesz-projector-formula`, `LocallyAnalyticDistributions:L4/hasse-normalized-annihilation`, `mathlib:Commute.mul_pow`, `mathlib:one_sub_dvd_one_sub_pow`, `mathlib:IsIdempotentElem.one_sub`.

Proof or construction:

1. Use vb=bv to write e^h=v^h b^h. The normalized identity and commutation give (1-e)e^h=0, equivalently e^h(1-e)=0.
2. The pinned geometric-sum divisibility gives 1-e^h=(1-e)d. Multiplying by e^h gives e^h(1-e^h)=0, so p^2=p; apply the existing one_sub idempotent lemma to E.
3. The same factorization and v^h(1-e)=0 give v^h E=0. Products Ep=pE=0 and E+p=1 use the baseline idempotent API.

Acceptance: Do not assume e itself idempotent. For the source root of u=J_2(1) plus scalar 2 over Z/3, e is nonzero nilpotent on the first block; 1-e is not idempotent while 1-e^2 is.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

### Canonical kernel and image summands

`LocallyAnalyticDistributions:L4/riesz-kernel-image` (lemma).

The projector has image(E)=ker(v^h) and ker(E)=image(v^h); equivalently image(p)=image(v^h). These identify the summands of the root splitting canonically.

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/riesz-projector-idempotence`, `LocallyAnalyticDistributions:L4/hasse-normalized-annihilation`, `mathlib:Commute.mul_pow`, `mathlib:LinearMap.IsIdempotentElem.range_eq_ker_one_sub`, `mathlib:LinearMap.IsIdempotentElem.ker_eq_range_one_sub`, `mathlib:LinearMap.IsIdempotentElem.mem_range_iff`.

Proof or construction:

1. v^h E=0 gives image(E) contained in ker(v^h). If v^h x=0 then p x=v^h b^h x=b^h v^h x=0, so E x=x and the reverse inclusion follows.
2. Since p=v^h b^h, image(p) is contained in image(v^h). Conversely v^h E=0 implies v^h=v^h p=p v^h, so p is the identity on image(v^h).
3. Use the baseline image/kernel identities of complementary idempotents to identify ker(E)=image(p). The fixed-vector API follows from the baseline characterization of an idempotent image.

Acceptance: At h=0, ker(v^0)=0 and image(v^0)=M. Uniqueness uses these actual submodules, without choosing a basis or a finite-rank approximation.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

### Topological Riesz decomposition

`LocallyAnalyticDistributions:L4/riesz-topological-splitting` (theorem).

N=ker(v^h) and F=image(v^h) are closed native A-submodules and topological complements. The constructed E agrees with the native continuous projection onto N along F.

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/riesz-kernel-image`, `LocallyAnalyticDistributions:L4/riesz-projector-idempotence`, `mathlib:ContinuousLinearMap.IsIdempotentElem.isTopCompl`, `mathlib:ContinuousLinearMap.IsIdempotentElem.isClosed_range`, `mathlib:ContinuousLinearMap.IsIdempotentElem.eq_projectionL`.

Proof or construction:

1. The baseline isTopCompl theorem for a continuous idempotent supplies the topological direct sum, not merely an algebraic complement. Transport it along the kernel/image identifications.
2. The two continuous idempotents have closed images in the Hausdorff module. The baseline projectionL identity gives the native comparison with no new splitting structure.

Acceptance: Closedness of image(v^h) is proved through its idempotent presentation. Do not import real/complex Riesz closed-range theorems, or infer closed range for arbitrary continuous maps. This statement contains no claim of finite generation, projectivity or rank.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

### Inverse on the regular Riesz summand

`LocallyAnalyticDistributions:L4/riesz-regular-inverse` (theorem).

Both v and b preserve F=image(v^h), and v(bx)=b(vx)=x for every x in F. Their restrictions are mutually inverse continuous A-linear maps of F.

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/riesz-kernel-image`, `LocallyAnalyticDistributions:L4/hasse-normalized-annihilation`, `LocallyAnalyticDistributions:L4/riesz-projector-idempotence`.

Proof or construction:

1. Commutation with v^h proves that v and b map its image into itself. From (1-e)p=0 obtain vb p=p; commutation gives bv p=p as well.
2. Write x=p y on F and evaluate those identities. Restrict the existing continuous A-linear maps to the invariant submodule. This exhibits a continuous inverse, without invoking an open mapping theorem.
3. Serre displays c^(-h)v^(h-1)z_h^h on F when h>0. It equals b on F: b^h v^(h-1)=b(vb)^(h-1), and vb is the identity there. Treat h=0 by vb=bv=1 on M.

Acceptance: The inverse is asserted only on F. In the Jordan test v is nilpotent on N and has no inverse there.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

### Polynomial closure of Riesz projectors

`LocallyAnalyticDistributions:L4/riesz-projector-closure` (lemma).

E and p belong to the K-operator-norm closure of the actual A-polynomials in u, represented by the existing finite polynomial evaluation formula.

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/riesz-projector-formula`, `LocallyAnalyticDistributions:L4/hasse-polynomial-closure`.

Proof or construction:

1. Each z_h is in that closure by the prior analytic lemma. The identity, scalar endomorphisms and u belong to the polynomial set.
2. In the complete normed ring of K-linear endomorphisms, continuous addition, multiplication and the bounded scalar action show that this closure is closed under subtraction, multiplication and scalar multiplication. Apply these operations to the displayed finite formula for E; p=1-E follows.
3. This uses the already constructed A-linear Hasse value, not a formal infinite Taylor substitution. No convergence or adjugate estimate is inferred from the algebraic formula.

Acceptance: Keep the topology on the actual K-operator norm, as in the Hasse predecessor. No abstract substitute for A[u] is introduced.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

### Stability under commuting operators

`LocallyAnalyticDistributions:L4/riesz-commuting-stability` (lemma).

Every continuous A-linear endomorphism t commuting with u commutes with E and p, and preserves N=ker(v^h) and F=image(v^h).

Hypotheses: Standing Banach hypotheses; M has (Pr), u is completely continuous; use the actual Fredholm series and evaluated Hasse resolvent. The A-action has a bound norm(bx) <= C norm(b) norm(x), with C>0. For a in A, h>=0, all Hasse values Delta_s P_u(a) vanish for s<h, and c=Delta_h P_u(a) is a unit of A. Set v=1-au, z_s=Delta_s F_u(a), b=c^(-1)z_h, e=vb, p=e^h, E=1-p. No reducedness or field hypothesis on A.

Dependencies: `LocallyAnalyticDistributions:L4/riesz-projector-closure`, `LocallyAnalyticDistributions:L4/riesz-kernel-image`, `LocallyAnalyticDistributions:L4/riesz-projector-idempotence`, `mathlib:ContinuousLinearMap.IsIdempotentElem.commute_iff`.

Proof or construction:

1. A-linear t commutes with each A-polynomial in u. The commutant is closed in the K-operator norm because left and right multiplication by its scalar restriction are continuous.
2. Pass the polynomial commutation equality to E in the closure and then to p=1-E. Apply the existing idempotent commute_iff theorem and the kernel/image identifications for invariance.

Acceptance: No complete-continuity hypothesis on t and no extra source of finite projectivity. This is the stability needed by commuting Hecke operators in the existing slope consumer.

Sources: Serre, Proposition 12, printed pp. 80–81; Buzzard, Proposition 3.2, manuscript p. 23.

## L4 continuation: the adjugate coefficient estimate

The resolvent recurrence has an algebraic part and an analytic part. Induction
alone gives its formal identity. Entire convergence uses a stronger estimate:
the n-th coefficient is bounded by products of n distinct output-column
majorants. Expanding finite adjugates gives this estimate without a factorial
loss. Finite coordinate projections and coefficient continuity then carry it
to arbitrary orthonormalizable modules, including uncountable coordinate sets.

There is an essential support condition in this passage. If u has finite
output support J, a restriction used to test V_n(e_i) must include i as well
as J. For diag(a,0), the degree-one adjugate coefficient vanishes on the image
coordinate and equals −a on its complement. A bound on the image alone cannot
bound the full operator. The comparison below consequently quantifies over
all finite L containing J and uses L=J∪{i} for norm detection.

The intermediate statements apply to any actual sequence of native continuous
linear maps satisfying the recurrence with the actual Fredholm coefficients.
They assume no convergence or coefficient bound. The resulting dependency
chain precedes resolvent-series and its Hasse/Riesz consumers. Passing to a
(Pr) module uses its actual retraction and retains the fixed norm factor
‖r‖‖i‖. A nonisometric retraction cannot be treated as a contraction.

### Finite coordinate truncation

`LocallyAnalyticDistributions:L4/finite-coordinate-projection` — `coordinateProjection` (construction).

For a finite T⊆I, the existing helper π_T is the native continuous A-linear endomorphism of c_A(I) that retains coordinates in T and sets every other coordinate to zero. Its value is the finite sum Σ_{j∈T}x_j e_j; the carrier remains the native C0 space.

**Hypotheses:** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars.

**Proof outline:**

1. The finite-support function is continuous because I is discrete, and vanishes at infinity because its support lies in finite T. This constructs an element of the native ZeroAtInftyContinuousMap carrier.
2. Linearity is pointwise. Transfer the native supremum norm through toBCF and bound the difference pointwise by the norm of the original difference, giving continuity without choosing a basis enumeration.
3. The empty projection, intersection composition and basis-vector formulas follow coordinatewise. The evaluation and norm API items are promoted below before use in the analytic estimates.

**Prerequisites:** `mathlib:ZeroAtInftyContinuousMap`, `mathlib:ZeroAtInftyContinuousMap.ext`, `mathlib:ZeroAtInftyContinuousMap.toBCF`, `mathlib:ZeroAtInftyContinuousMap.norm_toBCF_eq_norm`, `mathlib:BoundedContinuousFunction.norm_le`, `mathlib:BoundedContinuousFunction.norm_coe_le_norm`.

**Uses:**

- compact-matrix-criterion and resolvent-coefficient-bound: The actual finite-coordinate approximation is π_T composed with u; its image has finite A-support and its output columns retain the common majorant.
- c0-lift and orthonormalizable-modules: Finite-support truncations approximate each native c0 vector and give the coordinate norm and basis tests.

**API:**

- `coordinateProjection_apply` (projection): At coordinate j, π_T(x)_j is x_j if j∈T and zero otherwise; promoted to finite-coordinate-projection-evaluation.
- `coordinateProjection_norm_le` (compatibility): For every x, ‖π_T x‖≤‖x‖; the existing signature is promoted to finite-coordinate-projection-bound.
- `coordinateProjection_empty` (simp): π_∅=0 as a native continuous A-linear map.
- `coordinateProjection_inter` (functoriality): π_T composed with π_S is π_(T∩S); hence each finite projection is idempotent.
- `coordinateProjection_single` (simp): π_T(a e_j)=a e_j if j∈T, and zero if j∉T.

**Unit tests:**

- `projection_empty_support` (computation): For every x, π_∅x=0.
- `projection_selected_coordinate` (computation): π_{j}(a e_j)=a e_j.
- `projection_rejected_coordinate` (non-example): If i≠j, π_{i}(a e_j)=0.

**Acceptance:** This promotes the existing suggested helper; it does not define a second c0 carrier. Empty T gives zero, and the identity on an infinite c0 space is not a finite projection.

**Sources:** Buzzard-Eigenvarieties-2006, §2, pp.7–12 for coordinates; §3, full manuscript p.22 freshly reread on27 September2026 for the Fredholm resolvent over (Pr) modules. The coordinate maps use the existing C0 carrier. The source invokes Serre Proposition10 for a Noetherian Banach algebra and a (Pr) module; the explicit finite-coordinate and retraction steps are decomposed here rather than assumed from the recurrence.

### Evaluation of a finite coordinate projection

`LocallyAnalyticDistributions:L4/finite-coordinate-projection-evaluation` — `coordinateProjection_apply` (lemma).

For T finite, x∈c_A(I) and j∈I, (π_T x)_j=x_j when j∈T, and (π_T x)_j=0 otherwise.

**Hypotheses:** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars.

**Proof outline:**

1. Evaluate the defining finite-support function. This is the promoted projection formula, so subsequent coordinate arguments use an exact node.

**Prerequisites:** `LocallyAnalyticDistributions:L4/finite-coordinate-projection`.

**Acceptance:** The formula treats selected and unselected coordinates and implies that π_Tu has output support in T.

**Sources:** Serre-EndomorphismesCC-1962, §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Contractivity of coordinate truncation

`LocallyAnalyticDistributions:L4/finite-coordinate-projection-bound` — `coordinateProjection_norm_le` (lemma).

For every finite T⊆I and every x∈c_A(I), ‖π_T x‖≤‖x‖.

**Hypotheses:** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars.

**Proof outline:**

1. Use finite-coordinate-projection-evaluation to bound each coordinate by ‖x‖, using zero outside T.
2. Apply the native bounded-function norm characterization and the C0-to-bounded-function norm equality.

**Prerequisites:** `LocallyAnalyticDistributions:L4/finite-coordinate-projection-evaluation`, `mathlib:BoundedContinuousFunction.norm_le`, `mathlib:BoundedContinuousFunction.norm_coe_le_norm`, `mathlib:ZeroAtInftyContinuousMap.norm_toBCF_eq_norm`.

**Acceptance:** This proves operator norm at most one after restricting scalars to K; it does not assert that every projection has norm one, since T can be empty.

**Sources:** Serre-EndomorphismesCC-1962, §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Operator bound from the coordinate vectors

`LocallyAnalyticDistributions:L4/c0-operator-norm-criterion` — `c0_operator_norm_le_iff` (lemma).

For a continuous A-linear f:c_A(I)→c_A(I) and C≥0, ‖f‖_K≤C if and only if ‖f(e_i)‖≤C for every i∈I.

**Hypotheses:** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars.

**Proof outline:**

1. A coordinate vector has norm one when it exists. The forward implication follows from the native le_opNorm bound and the native C0 supremum norm.
2. For the reverse implication, use c0-lift on the bounded family f(e_i). Its norm formula, normalized A-action and uniqueness identify the resulting map with f and bound it by C. This includes empty I, where both the module and the operator norm are zero.

**Prerequisites:** `LocallyAnalyticDistributions:L4/c0-lift`, `LocallyAnalyticDistributions:L4/c0-scalar-bound`, `mathlib:ContinuousLinearMap.le_opNorm`, `mathlib:ContinuousLinearMap.opNorm_le_bound`.

**Acceptance:** No countability or algebraic spanning assertion for the infinite c0 module is assumed. Finite-support density is used through the already planned bounded-family extension.

**Sources:** Serre-EndomorphismesCC-1962, §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Coefficients of the finite adjugate

`LocallyAnalyticDistributions:L4/finite-adjugate-recurrence` — `finite_adjugate_recurrence` (lemma).

For a d×d matrix D over A, put H(T)=I−TD, c_n=coeff_n det(H), and B_n=(coeff_n adj(H)_ij)_ij. Then B₀=I and B_(n+1)=c_(n+1)I+B_nD. This order is compatible with the input-first operator convention.

**Hypotheses:** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars.

**Proof outline:**

1. Apply the native identity adj(H)H=det(H)I over the existing polynomial ring. Taking degree n+1 gives B_(n+1)−B_nD=c_(n+1)I by the polynomial product coefficient formula.
2. The constant coefficient is adj(I)=I; extract it by evaluation at zero, or directly from the cofactor formula. Include d=0, where the matrix carrier is a subsingleton and the determinant is one.

**Prerequisites:** `mathlib:Matrix.adjugate`, `mathlib:Matrix.adjugate_mul`, `mathlib:Matrix.adjugate_one`, `mathlib:Polynomial.coeff_mul`.

**Unit tests:**

- `adjugate_rank_one` (computation): For the one-by-one matrix (a), adj(I−TD)=I.
- `adjugate_diagonal_two` (computation): For diag(a,b), the adjugate is diag(1−bT,1−aT).
- `adjugate_nilpotent_two` (computation): For the nonzero two-by-two nilpotent Jordan matrix N, adj(I−TN)=I+TN.

**Acceptance:** The adjugate is a numerator, not an inverse obtained by dividing by a determinant. In the input-first convention, f composed with V corresponds to the matrix of V multiplied on the right by D.

**Sources:** Serre-EndomorphismesCC-1962, §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Distinct-column bound for adjugate coefficients

`LocallyAnalyticDistributions:L4/finite-adjugate-coefficient-bound` — `finite_adjugate_coeff_bound` (lemma).

Let D be a d×d matrix, b_j≥0 with ‖D_ij‖≤b_j, n≥0 and C≥0. Assume ∏_{j∈S}b_j≤C for every n-element subset S of its column index set. Every coefficient of degree n of every entry of adj(I−TD) then has norm at most C.

**Hypotheses:** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars.

**Proof outline:**

1. For d=0 the entry assertion is empty. For d>0 use the native cofactor formula adjugate_fin_succ_eq_det_submatrix, after the usual finite-index identification.
2. Expand the cofactor determinant by permutations and each product by Polynomial.coeff_mul. Every nonzero degree-n contribution selects n distinct columns of D, with coefficient a sign and the remaining factors from identity entries. Thus each contribution has norm at most a product of n distinct b_j.
3. Use submultiplicativity, norm one for signs and the ultrametric finite-sum inequality. There is no factorial multiplier. For n above the cofactor degree all contributions vanish. For n=0 the empty product is one.

**Prerequisites:** `mathlib:Matrix.adjugate_fin_succ_eq_det_submatrix`, `mathlib:Matrix.det_apply`, `mathlib:Polynomial.coeff_mul`, `mathlib:IsUltrametricDist.norm_prod_le_of_forall_le_of_nonneg`.

**Acceptance:** Repeated columns are not allowed in the product majorant. The estimate holds over nonreduced Banach algebras and uses no eigenvalues or division by n!.

**Sources:** Serre-EndomorphismesCC-1962, §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Resolvent recurrence on finite coordinates

`LocallyAnalyticDistributions:L4/finite-coordinate-resolvent-comparison` — `finite_coordinate_resolvent_comparison` (comparison).

Let u:c_A(I)→c_A(I) be completely continuous, with output support in a finite J. Let V₀=I and V_(n+1)=c_(n+1)(u)I+uV_n, where c_n(u) are the actual Fredholm coefficients. For every finite L⊇J, the entries of V_n between coordinates i,j∈L equal the degree-n coefficients of adj(I−T D_L), where D_L=(u_ij)_(i,j∈L).

**Hypotheses:** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars.

**Proof outline:**

1. The operator u preserves the coordinate submodule A^L because its entire output lies in A^J⊆A^L. The finite-coordinate-determinant comparison identifies the actual Fredholm series with det(I−TD_L), including the additional zero directions in L.
2. Restriction of V₀ is identity. Inductively restrict the recurrence to A^L. In the input-first convention uV_n has matrix B_nD_L. Apply finite-adjugate-recurrence and uniqueness of the algebraic recurrence.
3. This statement does not bound the whole operator by restricting only to J. In the following norm proof L is chosen to contain the tested input coordinate as well as J.

**Prerequisites:** `LocallyAnalyticDistributions:L4/finite-coordinate-determinant`, `LocallyAnalyticDistributions:L4/finite-adjugate-recurrence`.

**Unit tests:**

- `finite_output_support_is_not_enough_for_input` (non-example): For diag(a,0), coefficient one of the (1,1) entry of adj(I−TD) is −a, whereas that of the (0,0) entry is zero, using indices0,1.

**Acceptance:** For diag(a,0), the degree-one adjugate coefficient on the second coordinate is −a, even though it is zero on the image coordinate.

**Sources:** Serre-EndomorphismesCC-1962, §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Resolvent bound for finite output support

`LocallyAnalyticDistributions:L4/finite-output-resolvent-bound` — `finite_output_resolvent_bound` (lemma).

Suppose u has output support in finite J. Let b_j≥0 bound its output-column norms, fix n≥0 and C≥0, and assume every product of n distinct b_j is at most C. Then ‖V_n‖_K≤C.

**Hypotheses:** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars. V is any sequence of native continuous A-linear endomorphisms with V₀=I and V_(n+1)=c_(n+1)(u)I+uV_n, where c_n(u) are the actual Fredholm coefficients. These are algebraic recurrence hypotheses; no analytic estimate or entireness is assumed.

**Proof outline:**

1. For each input coordinate i choose L=J∪{i}. The recurrence preserves A^L and finite-coordinate-resolvent-comparison gives the exact adjugate entries of V_n(e_i).
2. Apply finite-adjugate-coefficient-bound to D_L with the restricted b. Its n-element subsets give n-element subsets of I, so the same C applies. The finite supremum norm gives ‖V_n(e_i)‖≤C.
3. Apply c0-operator-norm-criterion. This treats every input coordinate, including those outside J, and avoids the incorrect inference from a bound on V_n restricted only to the image support.

**Prerequisites:** `LocallyAnalyticDistributions:L4/finite-coordinate-resolvent-comparison`, `LocallyAnalyticDistributions:L4/finite-adjugate-coefficient-bound`, `LocallyAnalyticDistributions:L4/c0-operator-norm-criterion`.

**Acceptance:** The uniform C is independent of L and of the input i. Arbitrary index sets and empty support are included.

**Sources:** Serre-EndomorphismesCC-1962, §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Continuity of the finite recurrence

`LocallyAnalyticDistributions:L4/resolvent-coefficient-continuity` — `recurrence_coefficient_tendsto` (lemma).

Let α carry any filter l. Suppose u_α→u in K-operator norm on c_A(I), and c_(α,n)→c_n in A for each n. Define sequences V_(α,n) and V_n by initial identity and V_(α,n+1)=c_(α,n+1)I+u_αV_(α,n), respectively V_(n+1)=c_(n+1)I+uV_n. For every fixed n, V_(α,n)→V_n in K-operator norm.

**Hypotheses:** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars.

**Proof outline:**

1. Induct on n. The initial identity is constant. Addition and multiplication are continuous in the native K-operator ring.
2. The coefficient action a↦aI on c_A(I) is bounded by ‖a‖, using c0-scalar-bound and the native operator norm criterion. Its continuity carries the scalar coefficient limits into operator limits.
3. Apply the recurrence and the induction hypothesis. The filter is arbitrary, so the result applies to finite subsets of an uncountable I ordered by inclusion.

**Prerequisites:** `LocallyAnalyticDistributions:L4/c0-scalar-bound`, `mathlib:ContinuousLinearMap.toNormedRing`, `mathlib:ContinuousLinearMap.opNorm_le_bound`.

**Acceptance:** Only finitely many coefficient limits are used for a fixed n; no interchange with an infinite sum or evaluation is made.

**Sources:** Serre-EndomorphismesCC-1962, §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Adjugate bound for the Fredholm resolvent

`LocallyAnalyticDistributions:L4/resolvent-coefficient-bound` — `resolvent_recurrence_norm_bound` (theorem).

Let u be completely continuous on c_A(I), and let b_j≥0 bound its output-column norms. For n≥0 and C≥0, if every product of n distinct b_j is at most C, then ‖V_n‖_K≤C.

**Hypotheses:** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars. V is any sequence of native continuous A-linear endomorphisms with V₀=I and V_(n+1)=c_(n+1)(u)I+uV_n, where c_n(u) are the actual Fredholm coefficients. These are algebraic recurrence hypotheses; no analytic estimate or entireness is assumed.

**Proof outline:**

1. Take u_T=π_Tu over the directed set of finite T⊆I. The promoted projection formula gives finite output support and the same majorant b. Its image is contained in the span of finitely many coordinate vectors, so it is completely continuous by the defining finite-image approximation criterion.
2. The existing compact-matrix-criterion gives u_T→u in operator norm. The projection bound gives a common operator-norm bound; apply coefficient-continuity to each fixed Fredholm coefficient.
3. Define V_(T,n) by the finite algebraic recurrence. Apply resolvent-coefficient-continuity to obtain V_(T,n)→V_n for each fixed n. Each V_(T,n) has norm at most C by finite-output-resolvent-bound.
4. Pass this closed norm inequality to the limit using le_of_tendsto. The finite-subset filter is nonempty and directed. No decreasing enumeration of column sizes is needed.

**Prerequisites:** `LocallyAnalyticDistributions:L4/finite-coordinate-projection-evaluation`, `LocallyAnalyticDistributions:L4/finite-coordinate-projection-bound`, `LocallyAnalyticDistributions:L4/compact-matrix-criterion`, `LocallyAnalyticDistributions:L4/coefficient-continuity`, `LocallyAnalyticDistributions:L4/finite-output-resolvent-bound`, `LocallyAnalyticDistributions:L4/resolvent-coefficient-continuity`, `mathlib:le_of_tendsto`.

**Acceptance:** This supplies the analytic estimate missing from the old resolvent node. The recurrence alone would give a geometric bound and does not establish this distinct-column bound.

**Sources:** Serre-EndomorphismesCC-1962, §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Entire tail estimate for resolvent coefficients

`LocallyAnalyticDistributions:L4/resolvent-tail-bound` — `resolvent_recurrence_tail_bound` (lemma).

Let b_j≥0 bound the output-column norms of completely continuous u and satisfy b_j≤L. Fix R>0, 0<q<1 and finite T with Rb_j≤q off T. Put m=|T| and B=max(1,RL). Then ‖V_n‖_K Rⁿ≤B^m q^(max(n−m,0)) for every n≥0.

**Hypotheses:** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars. V is any sequence of native continuous A-linear endomorphisms with V₀=I and V_(n+1)=c_(n+1)(u)I+uV_n, where c_n(u) are the actual Fredholm coefficients. These are algebraic recurrence hypotheses; no analytic estimate or entireness is assumed.

**Proof outline:**

1. For any n-element subset S, split it into its intersection with T and its complement. At most m factors Rb_j are bounded by B; all others are bounded by q. Since B≥1 and 0<q<1, the product is at most B^m q^(max(n−m,0)).
2. Apply resolvent-coefficient-bound with C=B^m q^(max(n−m,0))/Rⁿ, which is nonnegative; Rⁿ is strictly positive. Multiply through by Rⁿ.
3. The constant B^m is independent of n. If b is cofinite-null, such T exists for every R and q, and the geometric right side tends to zero. The bound is also uniform for any family with the same b,L,T.

**Prerequisites:** `LocallyAnalyticDistributions:L4/resolvent-coefficient-bound`, `mathlib:tendsto_pow_atTop_nhds_zero_of_lt_one`.

**Acceptance:** The exponent is truncated at zero for n≤m. There is no factorial factor, summation over input coordinates, or normed-field hypothesis on A itself.

**Sources:** Serre-EndomorphismesCC-1962, §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Compression of the coefficient recurrence

`LocallyAnalyticDistributions:L4/resolvent-retraction-comparison` — `recurrence_retraction` (lemma).

Let i:M→c_A(I) and r:c_A(I)→M be native continuous A-linear maps with ri=I. For u:M→M put U=iur. For any scalar sequence c_n, suppose V₀=I_M, W₀=I_c0, V_(n+1)=c_(n+1)I_M+uV_n and W_(n+1)=c_(n+1)I_c0+UW_n. Then rW_n i=V_n for every n.

**Hypotheses:** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars. M is a Banach A-module with compatible K-action. The stated continuous retraction is actual data; no claim that every finite module has such a retraction is made.

**Proof outline:**

1. At n=0 this is exactly ri=I. Apply r on the left and i on the right to the next recurrence.
2. Use A-linearity to move c_(n+1) through r and i; use ri=I in the product term, and then the induction hypothesis. This is purely algebraic and works for any scalar sequence.

**Prerequisites:** `LocallyAnalyticDistributions:L4/projective-banach-modules`.

**Acceptance:** The zero extension has identity on the whole ambient module at degree zero. It is the compression rW₀i that equals identity on M; do not replace W₀ by ir.

**Sources:** Serre-EndomorphismesCC-1962, §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.

### Entireness of the recurrence on a projective Banach module

`LocallyAnalyticDistributions:L4/resolvent-recurrence-entire` — `resolvent_recurrence_entire` (theorem).

Let M have (Pr), u:M→M be completely continuous, and c_n be its actual summand Fredholm coefficients. For any V₀=I and V_(n+1)=c_(n+1)I+uV_n, and every R>0, ‖V_n‖_K Rⁿ tends to zero.

**Hypotheses:** K is a complete nontrivially valued nonarchimedean field and A is a nonzero commutative Noetherian K-Banach algebra with norm one for 1 and its normalized submultiplicative ultrametric norm. All module structures are compatible. I is an arbitrary discrete set and c_A(I) is the existing C0(I,A), with its supremum norm. The matrix entry u_ij is coordinate j of u(e_i): inputs come first and outputs second. Operator norms mean the native K-operator norm after restriction of scalars. M is a complete Banach A-module with compatible bounded coefficient action as in the standing roadmap hypotheses; property (Pr) supplies actual continuous inclusion and retraction data.

**Proof outline:**

1. Choose the actual retraction i:M→c_A(I), r:c_A(I)→M from property (Pr). Approximate u by finite-A-image maps g at error ε/(1+‖i‖‖r‖); the maps igr still have finite A-image, and the composition norm bound gives approximation of U=iur. Thus U is completely continuous directly from the imported definition. The summand-fredholm-theory comparison identifies its Fredholm coefficients with the given c_n.
2. For U use its column-norm family b_j. It is bounded by ‖U‖ and cofinite-null by compact-matrix-criterion; normalized basis/evaluation bounds justify the column bound. Take q=1/2 and apply resolvent-tail-bound for every R to the recurrence W_n on c_A(I).
3. The geometric estimate gives ‖W_n‖Rⁿ→0. Apply resolvent-retraction-comparison and the native composition norm bound twice: ‖V_n‖Rⁿ≤‖r‖‖i‖‖W_n‖Rⁿ. The fixed nonnegative factor preserves convergence to zero.
4. Instantiate this theorem with the existing resolvent coefficient construction and its initial/successor equations. This proof does not use resolvent-series, its entireness API or any Hasse/Riesz theorem as a prerequisite.

**Prerequisites:** `LocallyAnalyticDistributions:L4/projective-banach-modules`, `LocallyAnalyticDistributions:L4/summand-fredholm-theory`, `LocallyAnalyticDistributions:L4/completely-continuous`, `LocallyAnalyticDistributions:L4/compact-matrix-criterion`, `LocallyAnalyticDistributions:L4/c0-operator-norm-criterion`, `LocallyAnalyticDistributions:L4/resolvent-tail-bound`, `LocallyAnalyticDistributions:L4/resolvent-retraction-comparison`, `mathlib:ContinuousLinearMap.opNorm_comp_le`, `mathlib:Submodule.FG.map`, `mathlib:tendsto_pow_atTop_nhds_zero_of_lt_one`.

**Acceptance:** No isometric retraction is assumed: the factors ‖r‖ and ‖i‖ remain in the transfer. This analytic coefficient estimate does not establish finite-projectivity, constant rank or determinant equality of a root summand.

**Sources:** Serre-EndomorphismesCC-1962, §6, Proposition10 and Lemma3(a)–(c), printed78–79 / PDF11–12; full fresh reading and printed79 page image checked on27 September2026. The source separates the finite adjugate estimate, finite output support and norm-limit passage. These nodes express its distinct-column bound without choosing a decreasing enumeration. Extension from the valued field to the stated Banach algebra uses only ultrametricity and submultiplicativity, with the (Pr) transfer supplied through explicit retractions.; Buzzard-Eigenvarieties-2006, §2, pp.7–12 for coordinates; §3, full manuscript p.22 freshly reread on27 September2026 for the Fredholm resolvent over (Pr) modules. The coordinate maps use the existing C0 carrier. The source invokes Serre Proposition10 for a Noetherian Banach algebra and a (Pr) module; the explicit finite-coordinate and retraction steps are decomposed here rather than assumed from the recurrence.

## L4 continuation: finite projectivity of the root kernel

Fix a continuous A-linear endomorphism u, a coefficient a and an integer h≥0.
Write v=1−au and N=ker(v^h). Once a continuous complement F has been obtained,
the passage to finite projectivity has three different inputs: a geometric
left inverse for u on N, finite-image approximation of identity on N, and
inheritance of (Pr). The existing Riesz splitting supplies the complement;
the following declarations expose the remaining finite-projectivity paragraph
of Buzzard Proposition 3.2. They preserve the existing native kernel,
projection, continuous equivalence and algebraic projectivity carriers.

The finite geometric sum B=a(1+v+⋯+v^(h−1)) satisfies Bu=uB=1−v^h.
In particular u is continuously invertible on N before we know that N is
finite. No inverse of a is used: this observation also applies to root kernels
which do not arise from a Fredholm root of constant order. For h=0, N is zero.
For a=0, N is zero for every h. The construction and all estimates include
these boundary cases.

The analytic point is that an approximant α to u need not preserve N. If
π:M→N is the native projection along F and i:N→M is inclusion, put l=πB.
Then lui=identity_N, so β=lαi approximates identity_N and has finite A-image.
Its error is at most D times the error of α, with D=‖l‖_K‖i‖_K. Neither factor
is silently replaced by one. Choosing the input tolerance ε/(D+1) works even
when D=0. Complete continuity of identity_N then invokes the existing
compact-identity-finite theorem; it is not a second Neumann-series argument.

Property (Pr) passes through the actual continuous retraction πi=identity.
The already planned finite-pr-projective theorem then gives algebraic
projectivity. Its canonical finite-module-topology prerequisite remains an
explicit gap. The new nodes give the declaration graph for this paragraph,
not a claim that its whole dependency chain is implemented or closed.

A useful counterexample keeps the hypotheses precise. Over A=K×K take u=1,
a=(1,0) and h=1. The root kernel is (1,0)A. It is finite projective, with rank
one on the first component and zero on the second, while a is not a unit.
Thus neither the geometric inverse nor finite projectivity implies a unit
root parameter, freeness or constant rank. The full Hasse-root theorem has
additional hypotheses, and its remaining nonreduced determinant/rank proof
must still be supplied.

### Finite geometric factor for the root operator

`LocallyAnalyticDistributions:L4/riesz-geometric-factor` (lemma); proposed declaration `riesz_geometric_factor`.

For every continuous A-linear u, a∈A and h≥0, the single finite sum B=a Σ_{0≤j<h}(1−au)^j satisfies uB=Bu=1−(1−au)^h.

Hypotheses and conventions:

- A is a commutative normed ring; M is a normed additive commutative group with an A-module structure and jointly continuous scalar multiplication. All maps are native continuous A-linear maps.
- Write v=1−a u, N=ker(v^h), B=a Σ_{0≤j<h}v^j, and i:N→M for the native inclusion. The exponent h is any natural number, including zero. No unit hypothesis on a is imposed.

Proof or construction:

1. The finite geometric identities give (1−v)Σv^j=Σv^j(1−v)=1−v^h in the endomorphism ring. The right identity is the native geom_sum_mul_neg; the left follows from mul_geom_sum by changing the sign, or directly by induction.
2. Use 1−v=au and centrality of the A-scalar action to move the scalar a across composition. Both factor identities hold without division by a.

Prerequisites: `mathlib:geom_sum_mul_neg`, `mathlib:mul_geom_sum`.


Acceptance:

- For h=0 both products and 1−v^0 are zero. For a=1 and u=1+j with j²=0, h=2 gives B=1−j.

Source: Proposition 3.2, complete proof on manuscript pp.23–24. The source makes the identity on N a polynomial in u with no constant term. This explicit geometric factor and its generality without a unit parameter are worker deductions of that step.

### Continuous inverse on the root kernel

`LocallyAnalyticDistributions:L4/riesz-kernel-operator-equiv` (construction); proposed declaration `rieszKernelOperatorEquiv`.

Define rieszKernelOperatorEquiv(u,a,h) to be the native continuous A-linear automorphism of N whose forward map is the restriction of u and whose inverse is the restriction of B=a Σ_{j<h}(1−au)^j.

Hypotheses and conventions:

- A is a commutative normed ring; M is a normed additive commutative group with an A-module structure and jointly continuous scalar multiplication. All maps are native continuous A-linear maps.
- Write v=1−a u, N=ker(v^h), B=a Σ_{0≤j<h}v^j, and i:N→M for the native inclusion. The exponent h is any natural number, including zero. No unit hypothesis on a is imposed.

Proof or construction:

1. The endomorphisms u and B commute with v and hence v^h; applying the commutation relation to a vector killed by v^h shows that both preserve N. Use the native ContinuousLinearMap.restrict for these two maps.
2. On N, the two products from riesz-geometric-factor are identity because v^h vanishes. Apply ContinuousLinearEquiv.equivOfInverse to the actual continuous restrictions. The inverse uses a finite sum, so it has no convergence hypothesis.

Prerequisites: `LocallyAnalyticDistributions:L4/riesz-geometric-factor`, `mathlib:ContinuousLinearMap.restrict`, `mathlib:ContinuousLinearEquiv.equivOfInverse`, `mathlib:Commute.smul_right`.

API:

- `rieszKernelOperatorEquiv_apply` (coercion): For x∈N the image under the equivalence, viewed in M, is u(x).
- `rieszKernelOperatorEquiv_symm_apply` (simp): For x∈N the inverse image, viewed in M, is B(x).
- `rieszKernelOperatorEquiv_subtype` (compatibility): Composing the equivalence with the native inclusion i equals u composed with i, as continuous A-linear maps N→M.

Uses:

- Buzzard Proposition3.2, manuscript p.24: Identify the actual continuous inverse of u on the nilpotent root summand before considering its finite-projective determinant.
- riesz-compressed-approximation and finite-slope-summands: The underlying geometric factor gives the left inverse on the included root kernel; the native equivalence records that no inverse of the root parameter is needed.

Unit tests:

- `riesz_inverse_order_zero` (degenerate): At h=0 every x∈ker(v^0) is zero, and its image under the equivalence is zero.
- `riesz_inverse_zero_parameter` (degenerate): At a=0, for every h, every x∈N is zero and its inverse image is zero.
- `riesz_inverse_identity` (compatibility): For u=identity and a=1, both the equivalence and its inverse fix every element of N, for every h.
- `riesz_inverse_jordan` (computation): If j²=0, u=1+j, a=1 and h=2, the inverse on N acts by 1−j, including in characteristic two.

Acceptance:

- The construction does not replace N by a chosen finite free model and does not assume finite generation, a unit root parameter, a Fredholm series or complete continuity.

Source: Proposition 3.2, complete proof on manuscript pp.23–24. The source uses invertibility on N on p.24. The finite geometric inverse is made explicit here and is valid before any rank or determinant argument.

### Property (Pr) under continuous retractions

`LocallyAnalyticDistributions:L4/pr-continuous-retract` (lemma); proposed declaration `hasPr_retract`.

If P has (Pr) and continuous A-linear maps i:M→P and r:P→M satisfy ri=identity, then M has (Pr). This is the existing hasPr_retract API promoted before consumption.

Hypotheses and conventions:

- A is a commutative normed ring; M is a normed additive commutative group with an A-module structure and jointly continuous scalar multiplication. All maps are native continuous A-linear maps.
- P is another normed A-module in the same universe as M; no finite-generation hypothesis is needed.

Proof or construction:

1. Choose the defining continuous split inclusion s:P→c_A(I) and retraction t:c_A(I)→P. The composite maps si and rt are continuous and their product is rtsi=ri=identity.
2. Reuse the existing HasPr definition and existing hasPr_retract declaration; no second notion of a projective Banach module is introduced.

Prerequisites: `LocallyAnalyticDistributions:L4/projective-banach-modules`.


Acceptance:

- Taking i=r=identity retains the original property. No conclusion of algebraic projectivity is made without the finite-generation hypothesis.

Source: Definition of (Pr), full manuscript pp.18–19, and use of Lemma2.11 on p.23. The source defines (Pr) by a continuous direct summand of a potentially ONable module. Transitivity of its split inclusion is the existing API proof, now given its own dependency node.

### Property (Pr) of the complemented root kernel

`LocallyAnalyticDistributions:L4/riesz-kernel-pr` (lemma); proposed declaration `riesz_kernel_hasPr`.

If M has (Pr) and N=ker((1−au)^h) has a native topological complement F, then N has (Pr).

Hypotheses and conventions:

- A is a commutative normed ring; M is a normed additive commutative group with an A-module structure and jointly continuous scalar multiplication. All maps are native continuous A-linear maps.
- Write v=1−a u, N=ker(v^h), B=a Σ_{0≤j<h}v^j, and i:N→M for the native inclusion. The exponent h is any natural number, including zero. No unit hypothesis on a is imposed.
- F is an A-submodule with the native topological-complement relation between N and F. Let π:M→N be Submodule.projectionOntoL along F, and put l=πB.

Proof or construction:

1. Use the native inclusion i and projection π onto N along F. The library projectionOntoL_apply_left gives πi=identity on N.
2. Apply pr-continuous-retract to this actual continuous retraction. In the Hasse Riesz setting riesz-topological-splitting supplies F=image(v^h) and the required topological complement.

Prerequisites: `LocallyAnalyticDistributions:L4/pr-continuous-retract`, `mathlib:Submodule.projectionOntoL`, `mathlib:Submodule.projectionOntoL_apply_left`.


Acceptance:

- This does not require u to be completely continuous. At h=0 the kernel is zero and the statement still applies.

Source: Proposition 3.2, complete proof on manuscript pp.23–24. Expands the finite-generation and projectivity paragraph using the existing native closed root kernel and continuous splitting; no constant-rank or determinant conclusion is imported.

### Finite-image approximation of the root identity

`LocallyAnalyticDistributions:L4/riesz-compressed-approximation` (lemma); proposed declaration `riesz_compressed_approximation`.

For any α:M→M with finite A-image, define β=lαi:N→N using l=πB. Then β has finite A-image and ‖identity_N−β‖_K≤D‖u−α‖_K, where D=‖l‖_K‖i‖_K. The map α need not preserve N.

Hypotheses and conventions:

- K is a complete nontrivially normed field; A is a nonzero complete Noetherian normed K-algebra with norm one for 1. M is a complete normed K-space and an A-module with compatible scalar tower and continuous A-action. Norms of A-linear maps mean the native K-operator norms after restriction of scalars.
- Write v=1−a u, N=ker(v^h), B=a Σ_{0≤j<h}v^j, and i:N→M for the native inclusion. The exponent h is any natural number, including zero. No unit hypothesis on a is imposed.
- F is an A-submodule with the native topological-complement relation between N and F. Let π:M→N be Submodule.projectionOntoL along F, and put l=πB.

Proof or construction:

1. The geometric factor gives Bui=i, because v^h i=0. Apply πi=identity to obtain lui=identity_N. This is a kernel-specific adapter, not a new generic complete-continuity composition theorem.
2. If range(α) lies in a finitely generated A-submodule Q of M, range(β) lies in l(Q). The native Submodule.FG.map makes l(Q) finitely generated. Thus α is composed with πB rather than restricted to a submodule it may not preserve.
3. Subtract composites to obtain identity_N−β=l(u−α)i. Restrict scalars to K and apply ContinuousLinearMap.opNorm_comp_le twice. Retain both norm factors; the projection need not be contractive.

Prerequisites: `LocallyAnalyticDistributions:L4/riesz-geometric-factor`, `LocallyAnalyticDistributions:L4/finite-image-range-comparison`, `mathlib:Submodule.projectionOntoL`, `mathlib:Submodule.projectionOntoL_apply_left`, `mathlib:Submodule.FG.map`, `mathlib:ContinuousLinearMap.opNorm_comp_le`.


Acceptance:

- On K² with u=diag(1,0), a=1, h=1 and the coordinate complement, an approximant sending e₁ to e₁+εe₂ does not preserve N. Its compression β nevertheless equals identity_N.
- The finite-image condition is over A, not finite K-rank. D may be zero on the zero module; the following tolerance choice includes that case.

Source: Proposition 3.2, complete proof on manuscript pp.23–24. Expands the finite-generation and projectivity paragraph using the existing native closed root kernel and continuous splitting; no constant-rank or determinant conclusion is imported.

### Complete continuity of the root identity

`LocallyAnalyticDistributions:L4/riesz-kernel-compact-identity` (lemma); proposed declaration `riesz_kernel_identity_completelyContinuous`.

If u is completely continuous and N=ker((1−au)^h) has a native topological complement F, then identity_N is completely continuous in the imported ordinary complete-continuity sense.

Hypotheses and conventions:

- K is a complete nontrivially normed field; A is a nonzero complete Noetherian normed K-algebra with norm one for 1. M is a complete normed K-space and an A-module with compatible scalar tower and continuous A-action. Norms of A-linear maps mean the native K-operator norms after restriction of scalars.
- Write v=1−a u, N=ker(v^h), B=a Σ_{0≤j<h}v^j, and i:N→M for the native inclusion. The exponent h is any natural number, including zero. No unit hypothesis on a is imposed.
- F is an A-submodule with the native topological-complement relation between N and F. Let π:M→N be Submodule.projectionOntoL along F, and put l=πB.

Proof or construction:

1. Fix ε>0 and put D=‖πB‖_K‖i‖_K≥0. The existing norm-approximation comparison supplies finite-A-image α with ‖u−α‖_K<ε/(D+1).
2. Compress α by riesz-compressed-approximation. Its error is at most D‖u−α‖_K, which is strictly less than ε: bound it by (D+1)‖u−α‖_K and multiply the strict approximation inequality by the positive D+1. This proof also handles D=0.
3. Apply completely-continuous-norm-approximation to identity_N. N is complete by the native completeSpace_ker instance. The predicate and its generality remain owned by AdicSpacesPartII:R3; this result is only its Riesz-kernel application.

Prerequisites: `LocallyAnalyticDistributions:L4/riesz-compressed-approximation`, `LocallyAnalyticDistributions:L4/completely-continuous-norm-approximation`, `mathlib:ContinuousLinearMap.completeSpace_ker`.


Acceptance:

- No countable approximating sequence or invariant approximant is assumed. The h=0 and a=0 kernels are zero.

Source: Proposition 3.2, complete proof on manuscript pp.23–24. Expands the finite-generation and projectivity paragraph using the existing native closed root kernel and continuous splitting; no constant-rank or determinant conclusion is imported.

### Finite generation of the root kernel

`LocallyAnalyticDistributions:L4/riesz-kernel-finite` (theorem); proposed declaration `riesz_kernel_finite`.

If u is completely continuous and N=ker((1−au)^h) has a native topological complement F, then N is a finite A-module.

Hypotheses and conventions:

- K is a complete nontrivially normed field; A is a nonzero complete Noetherian normed K-algebra with norm one for 1. M is a complete normed K-space and an A-module with compatible scalar tower and continuous A-action. Norms of A-linear maps mean the native K-operator norms after restriction of scalars.
- Write v=1−a u, N=ker(v^h), B=a Σ_{0≤j<h}v^j, and i:N→M for the native inclusion. The exponent h is any natural number, including zero. No unit hypothesis on a is imposed.
- F is an A-submodule with the native topological-complement relation between N and F. Let π:M→N be Submodule.projectionOntoL along F, and put l=πB.

Proof or construction:

1. Use riesz-kernel-compact-identity and the native completeness of the closed kernel. Apply the already planned compact-identity-finite equivalence.
2. This invokes the existing Neumann approximation proof once; do not re-plan it or substitute a real/complex compact-operator theorem. Neither (Pr) nor finite K-dimension is required for this conclusion.

Prerequisites: `LocallyAnalyticDistributions:L4/riesz-kernel-compact-identity`, `LocallyAnalyticDistributions:L4/compact-identity-finite`, `mathlib:ContinuousLinearMap.completeSpace_ker`.


Acceptance:

- The conclusion is Module.Finite over the coefficient ring A; for infinite-dimensional A over K, this does not imply finite-dimensionality over K.

Source: Proposition 3.2, complete proof on manuscript pp.23–24. Expands the finite-generation and projectivity paragraph using the existing native closed root kernel and continuous splitting; no constant-rank or determinant conclusion is imported.

### Projectivity of the finite root kernel

`LocallyAnalyticDistributions:L4/riesz-kernel-projective` (theorem); proposed declaration `riesz_kernel_projective`.

If M has (Pr), u is completely continuous and N=ker((1−au)^h) has a native topological complement F, then N is an algebraically projective A-module; together with riesz-kernel-finite it is finite projective.

Hypotheses and conventions:

- K is a complete nontrivially normed field; A is a nonzero complete Noetherian normed K-algebra with norm one for 1. M is a complete normed K-space and an A-module with compatible scalar tower and continuous A-action. Norms of A-linear maps mean the native K-operator norms after restriction of scalars.
- Write v=1−a u, N=ker(v^h), B=a Σ_{0≤j<h}v^j, and i:N→M for the native inclusion. The exponent h is any natural number, including zero. No unit hypothesis on a is imposed.
- F is an A-submodule with the native topological-complement relation between N and F. Let π:M→N be Submodule.projectionOntoL along F, and put l=πB.

Proof or construction:

1. Apply riesz-kernel-pr and riesz-kernel-finite to N with the given continuous projection. The native closed-kernel instance supplies its completeness.
2. Invoke the existing finite-pr-projective theorem, whose proof lifts identity through a continuous finite-free surjection and forgets topology. Its finite-module-topology dependency remains an explicit gap; this checkpoint does not establish that supplier.
3. In riesz-root-projectors specialize F to image(v^h) using riesz-topological-splitting. The root order and Hasse conditions are needed to construct that complement, not in the present finite-projectivity adapter.

Prerequisites: `LocallyAnalyticDistributions:L4/riesz-kernel-pr`, `LocallyAnalyticDistributions:L4/riesz-kernel-finite`, `LocallyAnalyticDistributions:L4/finite-pr-projective`, `mathlib:ContinuousLinearMap.completeSpace_ker`, `mathlib:Module.Projective`.


Acceptance:

- For A=K×K, u=identity and a=(1,0), h=1 gives N=(1,0)A, a finite projective module with varying component rank. The parameter a is not a unit; no freeness or constant rank follows from this theorem.
- The constant-rank h and exact determinant assertions of the full Fredholm-root theorem require its remaining nonreduced determinant argument.

Source: Lemma2.11, manuscript p.19, and Proposition3.2 proof, pp.23–24. Separates the finite-generation and (Pr) inputs from the remaining rank/determinant proof. The native algebraic projectivity carrier is reused.

### Executable and source boundary

The suggested file now includes the existing finite-pr-projective theorem as
`projective_of_finite_hasPr`, with native Module.Finite and Module.Projective.
The pre-existing `hasPr_retract` signature is reused once; it is promoted to
its own node because the root-kernel argument consumes it. Generic complete
continuity remains owned by AdicSpacesPartII:R3, with the existing request for
Noetherian Banach-algebra generality. No strict variant or second predicate is
introduced.

This follow-up freshly reads Buzzard manuscript pp.18–20 and23–25 and Serre
printed pp.80–82 (PDF13–15). The public PDFs have the hashes recorded below.
The explicit finite geometric inverse and approximant compression are worker
deductions of Buzzard's finite-projectivity paragraph. Serre's dimension
argument over a field is not transferred to a Banach coefficient algebra.
No new source error or review verdict is asserted.

## Current checkpoint and continuation

The packet has **75 nodes**: 3 definitions, 10 constructions, 37 lemmas,
18 theorems and7 comparisons. It has **49 API entries**, **60 packet tests**,
**60 typed examples**, **6 planets**, **75 baseline references**, **8 gaps**,
**5 requests** and**0 closed stages**. The thirteen definitions/constructions
have45 API entries and42 tests. All67 predecessor statements, hypotheses,
APIs and tests are preserved;66 predecessor node objects are unchanged.
Only the composite root theorem's third proof step and three prerequisites
are updated to consume the new chain. All13 adjugate nodes are unchanged.

The entire suggested file compiles with **zero errors and165 proof-placeholder
warnings only**. All1,890 reached Mathlib sources match the pinned commit.
There are no actual Tau Ceti or planned-supplier imports; the explicitly
labelled complete-continuity stub remains. This checks signatures, not proofs.
A separate scratch file proves11 complete lemmas and constructs the native
kernel equivalence with zero errors, warnings or placeholders, against1,633
byte-checked Mathlib sources. It checks both geometric factors, invariance,
the actual compressed identity, finite generation of mapped images and the
operator error estimate. It does not prove the final finite-projectivity
chain against implemented suppliers.

An exact finite regression passes611 assertions over primes2,3 and5. It checks
left and right geometric identities, Jordan inverses, and18 approximants that
do not preserve the kernel. With an oblique complement the actual projection
norm is necessary:18 controls fail if that factor is omitted. A product-ring
control retains the nonunit-parameter, varying-rank example. These finite
checks do not prove an infinite-dimensional theorem. Earlier adjugate and
Riesz validation below is historical and was not rerun for this follow-up.

Continue with canonical finite-module topology and inverse norm bounds, the
finite-projective determinant/rank proof over nonreduced coefficients,
Cayley–Hamilton, polynomial division, the (Pr) exercises and completed tensors,
and Coleman spectral-resultant transport. L0–L3 and the actual L4 distribution
families, coefficient action, uniform radii, semigroup estimates and
specialization remain open. Preserve the RS-16 owners and existing suppliers.

## Previous adjugate checkpoint: historical validation

The packet has **67 nodes**: 3 definitions, 9 constructions, 32 lemmas,
16 theorems and 7 comparisons. All 54 predecessor statements and hypotheses,
49 complete node objects, 13 integrated reviewed IDs and 19 links are retained.
Five earlier nodes gain precise dependencies, proof details or acceptance
text, and the resolvent gains its initial-coefficient API. Totals are
**46 API entries**, **56 packet tests and typed examples**, **6 planets**,
**66 baseline references**, **8 gaps**, **5 requests**, **0 closed stages**.
The twelve definitions/constructions have 42 API items and 38 tests.
All implementations remain unchecked.

At that checkpoint the suggested file compiled with **zero errors and 150 proof-placeholder
warnings only**. All 1,890 reached Mathlib source files match the pin.
No actual Tau Ceti or planned supplier module is imported. The explicitly
labelled AdicSpacesPartII complete-continuity signature stub and its generality
request are unchanged. Compilation checks types, not the proposed proofs.

A separate scratch file proves seven complete lemmas with no errors, warnings
or placeholders: the two-dimensional polynomial adjugate and its coefficients,
the determinant and recurrence, and compression of the native continuous-linear
recurrence through a genuine retraction. It reaches 1,635 source-audited Mathlib
modules. Exact finite arithmetic passes **56,192 assertions** over **2,190
systems** in dimensions one through three and primes 2, 3 and 5, using the
nonreduced normed coefficient rings Q_p[ε]/ε². These check the recurrence,
distinct-column bounds, uniform tail estimates and the necessary retraction
norm factors. Controls retain the missing-input-coordinate example, nilpotent
nonzero resolvents, nonreduced coefficients and degree-zero empty products.
These checks do not prove infinite-dimensional convergence or finite rank.
Earlier Riesz scratch proofs and finite regressions remain historical evidence.

That continuation freshly reads Buzzard's full manuscript p.22 and Serre's
full printed pp.78–79 (PDF11–12), including a rendered p.79 check. Both public
PDFs match the recorded hashes. The earlier reading scopes below are prior
provenance; no new source error is alleged.

## Sources

The packet records the read sections and public versions of [Buzzard, Eigenvarieties](https://www.ma.imperial.ac.uk/~buzzard/maths/research/papers/eigenvarieties.pdf), [Serre, Endomorphismes complètement continus](https://www.numdam.org/item/PMIHES_1962__12__69_0.pdf), and [Coleman, P-adic Banach Spaces and Families of Modular Forms](https://math.uchicago.edu/~fcale/Files/Cole2.pdf). BGR was not acquired. No new published error is asserted; the finite-projective and nonreduced examples above are guards against invalid proof shortcuts in a formalization.

The Buzzard manuscript was fetched again on 27 September 2026 and its SHA-256 verified as `0c54243868e2da8849452c4cc5a3d4e7b118cf17dd04487d4af137ab167ef57d`. The preceding continuation read manuscript/physical pp. 7–12 and 22–24. The current continuation freshly read full Buzzard pp. 22–24 and Serre printed pp. 78–81 (PDF pp. 11–14), rendering printed p. 81 to check the formulas. The Serre PDF hash is `67a032c129ad2a36adeeadc4b4ccb3c0ab17c5a1ef8de83f7dda85f2115fe402`. Earlier Coleman reading remains inherited provenance; downloading its PDF here is not claimed as a fresh source reading.

The Riesz algebra follow-up freshly read full Buzzard manuscript pp. 23–24 and Serre printed pp. 80–81 from the same hash-verified public PDFs. Earlier broader source readings remain predecessor provenance. No new source error or independent-review verdict is asserted. The native projection declarations were read at the exact Mathlib pin. Tau Ceti's finite-length Fitting result and the real/complex closed-range part of Riesz theory do not provide this Banach-algebra Hasse decomposition.


## Principal minors and Fredholm coefficients

The finite algebra works over a normed commutative ring with norm one and an
ultrametric norm. Completeness enters when cofinite decay is converted into
unconditional summability. Noetherianity enters through the earlier theorem
that identifies complete continuity with cofinite decay of the output-column
norms. Neither condition belongs in the finite matrix estimates themselves.

Keep the source convention u(e_i)=sum_j a_ij e_j, with input index first and
output index second. A term of a principal determinant uses every output
column once. Submultiplicativity bounds that term by the product of its column
majorants, and the ultrametric sum inequality preserves the same bound through
the permutation sum. Integer-unit signs preserve norms. There is no factorial
factor, and the empty determinant equals one.

For each positive degree n, choose a common column bound C≥1. Given ε>0,
only finitely many columns have size at least ε/C^(n−1). Only finitely many
n-element subsets lie entirely among those exceptional columns. Every other
minor contains a small column and has norm less than ε. This proves cofinite
decay on the actual fixed-cardinality subset type, without an enumeration of
the index set. In degree zero that type is a singleton and its cofinite filter
is bottom; its sole determinant is still one. Completeness and the native
nonarchimedean summability criterion give the coefficients of the formal series.

There are two separate estimates after this construction. For continuity in
one fixed degree, subtract two finite products and induct by adding one factor.
The ultrametric bound has one difference factor and n−1 factors bounded by C.
The corresponding determinant estimate passes through the summable family of
principal minors. For entireness, split a finite set of columns into those in
a fixed exceptional set T and those outside it. At radius R, use B≥1 on T and
q≤1 elsewhere. This gives B^card T q^max(n−card T,0), uniformly for every matrix
with the same column majorant. Taking q<1 gives the required tail decay.

The finite-coordinate comparison uses an existing Mathlib theorem:
`Matrix.coeff_det_one_add_X_smul_eq_sum_minors`. Apply it to the negative
matrix, then use `Matrix.det_neg`. Principal minors meeting a zero output
column vanish by `Matrix.det_eq_zero_of_column_eq_zero`. The polynomial
comparison therefore reduces to native finite algebra. An arbitrary finite
free image still requires the separately recorded topology and transport
arguments; this comparison does not identify such an image with a coordinate
submodule.

### Fredholm determinant in an orthonormal chart

`LocallyAnalyticDistributions:L4/fredholm-determinant` (construction).

For completely continuous u on c_A(I), construct the formal power series P_u with c_0=1 and c_n=(-1)^n sum_{S subset I, card S=n} det(a_ij)_{i,j in S}. Entireness and chart independence are the separately named ensuing theorems.

**Hypotheses:** Standing Banach hypotheses and complete continuity.

**Proof outline:**

1. Apply compact-matrix-criterion to obtain bounded cofinite-null output-column sizes. The fixed-degree-minors-null lemma supplies cofinite decay of the minor family at every n, including the singleton degree-zero family.
2. Install the native ultrametric-distance instance from the stated norm inequality and apply the generated additive form of NonarchimedeanGroup.multipliable_iff_tendsto_cofinite_one. Completeness gives the unconditional sum over the actual fixed-cardinality subset type.
3. Assemble the signed coefficients in the existing power-series carrier. The empty minor gives c_0=1. Entireness, basis independence and spectral properties remain ensuing theorems.

**Prerequisites:** `LocallyAnalyticDistributions:L4/compact-matrix-criterion`, `mathlib:NonarchimedeanGroup.multipliable_iff_tendsto_cofinite_one`, `LocallyAnalyticDistributions:L4/fixed-degree-minors-null`, `mathlib:IsUltrametricDist.isUltrametricDist_of_isNonarchimedean_norm`.

**Uses:**

- determinant-invariance, gauss-convergence and summand-fredholm-theory: The primary determinant, with analytic properties proved rather than assumed.

**API:**

- `fredholmSeries_coeff` (characterisation): The n-th coefficient is the signed principal-minor sum.
- `fredholmSeries_constant` (simp): The constant coefficient is one.
- `fredholmSeries_isEntire` (compatibility): The minor-tail-estimate proves decay at every positive real radius.

**Unit tests:**

- `zero_operator` (characterisation): P_0=1.
- `rank_one_scalar` (characterisation): For multiplication by a on A, P_u=1-aT.
- `nonzero_nilpotent` (characterisation): For the nonzero two-by-two nilpotent Jordan block, P_u=1; determinant one does not mean u=0.

**Acceptance:** The sign is (-1)^n and the constant coefficient is one, including the zero module.

**Sources:** Buzzard-Eigenvarieties-2006, Definition following Proposition 2.4, p. 12 The signed principal-minor construction, separated from its later invariance and growth statements.

### Uniform entire tail bound from column majorants

`LocallyAnalyticDistributions:L4/minor-tail-estimate` (lemma).

Suppose a family of completely continuous matrices has output-column norms bounded by one bounded cofinite-null family b_j>=0. Fix R>0 and 0<q<1, choose finite T with R b_j<=q outside T, m=card T and B=max(1,R sup_j b_j). Uniformly throughout the family, norm(c_n) R^n<=B^m q^max(n-m,0).

**Hypotheses:** Standing Banach hypotheses; coefficients c_n use the signed principal-minor construction.

**Proof outline:**

1. Apply ultrametric-determinant-bound to each principal minor, then multiply by R^n and rewrite as the product of the n distinct scaled column majorants R b_j.
2. Apply distinct-column-product-tail to these scaled majorants, B=max(1,R L) for any common upper bound L. It yields B^card T q^max(n−card T,0), independent of the matrix in the family.
3. Divide by the positive factor R^n, apply the native additive unconditional-sum bound to the minor family, and restore R^n. The sign (-1)^n preserves the norm.
4. For 0<q<1 the bound tends to zero as n increases; this gives the required entire tail, uniformly for a family with the same majorant.

**Prerequisites:** `LocallyAnalyticDistributions:L4/fredholm-determinant`, `LocallyAnalyticDistributions:L4/entire-series`, `LocallyAnalyticDistributions:L4/ultrametric-determinant-bound`, `LocallyAnalyticDistributions:L4/distinct-column-product-tail`, `mathlib:IsUltrametricDist.norm_tprod_le_of_forall_le_of_nonneg`, `mathlib:norm_units_zsmul`.

**Acceptance:** The bound applies to a family, not merely to one limit matrix; this distinction is needed to interchange evaluation and approximation.

**Sources:** Serre-EndomorphismesCC-1962, Proposition 7(b) and its column-product estimate, pp. 75-76; Proposition 8, p. 77 Explicit finite-exception formulation of the minor-product estimate; the argument uses only ultrametricity and submultiplicativity and therefore applies to A. The uniform-family formulation is proved here rather than attributed verbatim.

### Lipschitz bound in each determinant degree

`LocallyAnalyticDistributions:L4/coefficient-continuity` (lemma).

For completely continuous u,v in the same ON chart with norm(u),norm(v)<=C and C>=1, n>=1, norm(c_n(u)-c_n(v))<=norm(u-v) C^(n-1).

**Hypotheses:** Standing Banach hypotheses.

**Proof outline:**

1. In the common ON chart, bound every entry of u,v by C and their difference by the K-operator norm of u−v, using the basis vector of norm one and coordinate evaluation of norm at most one.
2. Apply ultrametric-determinant-perturbation to every n-element principal minor. The same bound holds for each difference.
3. Both minor families are summable by fixed-degree-minors-null and the native complete nonarchimedean criterion. Subtract their unconditional sums, then use the native additive unconditional-sum bound. The common sign preserves norm; degree zero is the separate constant-one case.

**Prerequisites:** `LocallyAnalyticDistributions:L4/fredholm-determinant`, `LocallyAnalyticDistributions:L4/ultrametric-determinant-perturbation`, `LocallyAnalyticDistributions:L4/fixed-degree-minors-null`, `LocallyAnalyticDistributions:L4/c0-operator-norm-criterion`, `mathlib:IsUltrametricDist.norm_tprod_le_of_forall_le_of_nonneg`, `mathlib:norm_units_zsmul`.

**Acceptance:** Handle the constant coefficient separately; it is identically one.

**Sources:** Serre-EndomorphismesCC-1962, Proposition 8 proof, p. 77 Isolates the telescoping estimate used before uniform control of all degrees.

### Determinant of a finite-coordinate operator

`LocallyAnalyticDistributions:L4/finite-coordinate-determinant` — `finite_coordinate_determinant` (comparison).

If u(c_A(I)) is contained in the coordinate submodule A^S for a finite S, then P_u is the ordinary characteristic polynomial det(1-T u|A^S).

**Hypotheses:** Standing Banach hypotheses; S is finite.

**Proof outline:**

1. If a principal subset meets the complement of S, choose an output index in that complement. Its column is identically zero by the image-support hypothesis, and Matrix.det_eq_zero_of_column_eq_zero makes the minor vanish.
2. The remaining unconditional sum is the finite sum over subsets of S of the specified cardinality. Reindex through their inclusion in I.
3. Apply the already implemented Matrix.coeff_det_one_add_X_smul_eq_sum_minors to the negative of the finite restricted matrix; Matrix.det_neg supplies (-1)^n. Compare coefficients of power series. No new finite determinant coefficient theorem is planned.

**Prerequisites:** `LocallyAnalyticDistributions:L4/fredholm-determinant`, `mathlib:Matrix.det_eq_zero_of_column_eq_zero`, `mathlib:Matrix.coeff_det_one_add_X_smul_eq_sum_minors`, `mathlib:Matrix.det_neg`, `mathlib:Finset.mem_powersetCard`.

**Unit tests:**

- `native_finite_coefficient_formula` (compatibility): For a finite matrix D, the coefficient of degree k in det(1+T D) is exactly the native sum of principal k-minors; applying it to -D supplies the Fredholm sign.

**Acceptance:** Apply only to the named finite coordinate module; do not silently identify a general finite image with a free module.

**Sources:** Buzzard-Eigenvarieties-2006, Lemma 2.5(b), pp. 12-13 The finite-coordinate comparison needed for the product-limit argument.

### Ultrametric perturbation of a finite product

`LocallyAnalyticDistributions:L4/ultrametric-product-perturbation` — `ultrametric_product_perturbation` (lemma).

Let S be a finite set, f,g:S→A, C≥1 and δ≥0. If norm(f_i),norm(g_i)≤C and norm(f_i−g_i)≤δ for every i, then norm(product f_i−product g_i)≤δ C^max(card S−1,0).

**Hypotheses:** A is any normed commutative ring with norm(1)=1 and an ultrametric norm; completeness, a coefficient field and Noetherianity are unnecessary.

**Proof outline:**

1. Induct on S. The empty product difference is zero; handle the singleton before the positive-cardinality induction step.
2. For an inserted index a, expand the difference as (f_a−g_a) product f + g_a(product f−product g). The native finite-product norm inequality bounds the first product by C^card S; the induction hypothesis bounds the difference in the second.
3. Apply the ultrametric two-term bound. Each term is at most δ C^card S, so no factor card S appears.

**Prerequisites:** `mathlib:Finset.norm_prod_le`, `mathlib:IsUltrametricDist.isUltrametricDist_of_isNonarchimedean_norm`.

**Unit tests:**

- `product_empty_difference` (degenerate): For empty S, the difference of the two empty products has norm zero, hence is at most every δ≥0.

**Acceptance:** For one factor this is precisely the assumed difference bound. For no factors it is 0≤δ. The two terms must be combined with a maximum, not an ordinary sum.

**Sources:** Serre-EndomorphismesCC-1962, Proposition 8 proof, printed p. 77 (PDF p. 10) Extracts the product-difference step and gives its explicit uniform C-bound over a normed ring; it uses only the displayed telescoping identity, submultiplicativity and ultrametricity.

### Determinant bound by distinct output columns

`LocallyAnalyticDistributions:L4/ultrametric-determinant-bound` — `ultrametric_determinant_bound` (lemma).

For a square matrix D indexed by a finite type J, let b_j≥0 satisfy norm(D_ij)≤b_j for all i,j. Then norm(det D)≤product_{j in J} b_j, including J empty.

**Hypotheses:** A is a normed commutative ring with norm(1)=1 and an ultrametric norm. No multiplicativity of the norm, reducedness, field hypothesis or completeness is required.

**Proof outline:**

1. Expand the native determinant as the permutation sum of signs times products D_(σ(j),j). Each product uses each output column exactly once.
2. Use the native product norm bound termwise and norm preservation under integer-unit signs. The common bound is nonnegative.
3. Apply the generated additive ultrametric finite-sum bound. For an empty matrix the unique empty permutation contributes one and the product bound is one.

**Prerequisites:** `mathlib:Matrix.det_apply`, `mathlib:Finset.norm_prod_le`, `mathlib:norm_units_zsmul`, `mathlib:IsUltrametricDist.isUltrametricDist_of_isNonarchimedean_norm`, `mathlib:IsUltrametricDist.norm_prod_le_of_forall_le_of_nonneg`.

**Unit tests:**

- `singleton_determinant_bound` (computation): The determinant of the one-by-one matrix (a) is a, so its norm is at most any bound on norm(a).
- `determinant_empty_bound` (degenerate): The determinant of the identity matrix on an empty finite type has norm one.

**Acceptance:** A diagonal matrix can attain the bound. A zero column gives zero. Nilpotent nonreduced coefficients remain in the determinant; no residue-field reduction is used.

**Sources:** Serre-EndomorphismesCC-1962, Proposition 7(a,b), printed pp. 75–76 (PDF pp. 8–9) Spells out the distinct-column estimate over the coefficient-ring generality used by Buzzard; the source proves the field case.

### Uniform finite determinant perturbation

`LocallyAnalyticDistributions:L4/ultrametric-determinant-perturbation` — `ultrametric_determinant_perturbation` (lemma).

Let D,E be square matrices on a finite type J, C≥1 and δ≥0. If every entry of D and E has norm at most C and every corresponding difference has norm at most δ, then norm(det D−det E)≤δ C^max(card J−1,0).

**Hypotheses:** A is a normed commutative ring with norm(1)=1 and an ultrametric norm. The empty-index case is allowed.

**Proof outline:**

1. Subtract the two native permutation expansions using the same permutations and signs.
2. Apply ultrametric-product-perturbation to each permutation product. Integer-unit signs preserve norms.
3. The native ultrametric finite-sum inequality preserves the same bound. For an empty type both determinants are one and their difference is zero.

**Prerequisites:** `LocallyAnalyticDistributions:L4/ultrametric-product-perturbation`, `mathlib:Matrix.det_apply`, `mathlib:norm_units_zsmul`, `mathlib:IsUltrametricDist.isUltrametricDist_of_isNonarchimedean_norm`, `mathlib:IsUltrametricDist.norm_prod_le_of_forall_le_of_nonneg`.

**Acceptance:** For degree one the estimate has constant one. The general estimate contains neither card J nor its factorial.

**Sources:** Serre-EndomorphismesCC-1962, Proposition 8 proof, printed p. 77 (PDF p. 10) Isolates the finite determinant estimate needed before taking the summable principal-minor difference.

### Cofinite decay of fixed-degree principal minors

`LocallyAnalyticDistributions:L4/fixed-degree-minors-null` — `fixed_degree_minors_null` (lemma).

Let I be any index type and a:I×I→A. Suppose norm(a_ij)≤b_j, where b_j≥0 is bounded and tends to zero along the cofinite filter on I. For every n≥0 the family det(a_ij) indexed by the finite subsets S of I with card S=n tends to zero along the cofinite filter on that family of subsets.

**Hypotheses:** A is a normed commutative ring with norm(1)=1 and an ultrametric norm. I need not be countable. Completeness is needed only when the ensuing construction invokes unconditional summability.

**Proof outline:**

1. For n=0 the index type has the single element empty; its cofinite filter is bottom, so convergence imposes no vanishing condition on that one determinant.
2. For n>0 choose C≥1 bounding every b_j. Given ε>0, the cofinite decay provides a finite T outside which b_j<ε/C^(n−1).
3. Except for the finite family T.powersetCard n, each S contains some j outside T. The determinant column bound gives norm(det a_S)≤b_j C^(n−1)<ε, using the other n−1 columns and their uniform C-bound.
4. Translate this finite-exception estimate into cofinite convergence. When A is complete, the native additive nonarchimedean summability criterion supplies the unconditional sum, with no chosen enumeration.

**Prerequisites:** `LocallyAnalyticDistributions:L4/ultrametric-determinant-bound`, `mathlib:Finset.mem_powersetCard`.

**Acceptance:** The constant coefficient comes from the sole empty minor equal to one; it is not forced to vanish. A single nonzero column can occur at an arbitrary index and must not require a countable enumeration.

**Sources:** Buzzard-Eigenvarieties-2006, Definition following Proposition 2.4, manuscript p. 12 Decomposes the asserted convergence of the principal-minor sum, retaining the arbitrary index set and explicitly separating the degree-zero boundary.

### Finite exceptional-set product estimate

`LocallyAnalyticDistributions:L4/distinct-column-product-tail` — `distinct_column_product_tail` (lemma).

Let S,T be finite subsets of an arbitrary set I. Let b:I→R satisfy 0≤b_j≤B with B≥1, and suppose b_j≤q outside T where 0≤q≤1. Then product_{j in S} b_j≤B^card(T) q^max(card(S)−card(T),0).

**Hypotheses:** The coefficient family in this lemma is real and nonnegative. It need not tend to zero; this is a finite product statement, valid also at q=0 and q=1.

**Proof outline:**

1. Split S into S intersect T and S minus T. Bound the product on the intersection by B^r and the remaining product by q^s.
2. The native cardinality identity gives r+s=card S and r≤card T, hence s≥max(card S−card T,0).
3. Since B≥1, increase r to card T; since q lies in [0,1], decrease s to max(card S−card T,0). Retain the empty-product convention, including 0^0=1.

**Prerequisites:** `mathlib:Finset.card_sdiff_add_card_inter`.

**Acceptance:** For T empty the bound is q^card S. If q=0 and card S>card T, a zero factor forces the product to vanish. Repeated column indices would invalidate the argument.

**Sources:** Serre-EndomorphismesCC-1962, Proposition 7(b), printed p. 76 (PDF p. 9) A finite-exception form of the distinct-column product bound; this avoids selecting a decreasing enumeration and works for arbitrary index types.

### Validation and continuation

All 75 predecessor statements and hypotheses, 71 whole node objects,
75 baseline records, six planets and five requests are preserved. Five new
lemma nodes and nine native baseline references refine the coefficient
argument. Four existing declarations gain exact proof dependencies; the
finite-coordinate comparison gains its typed conclusion. The packet contains
3 definitions, 10 constructions, 42 lemmas, 18 theorems and 7 comparisons.
Definitions and constructions account for 45 API entries and 42 tests.

The complete suggested file compiles with zero errors and 175 expected
proof-placeholder warnings only, reaching 1,983 byte-verified pinned Mathlib
sources. It imports no actual Tau Ceti or supplier module. The labelled
AdicSpacesPartII:R3 signature stub and generality request remain unchanged.
Seven complete scratch lemmas compile with zero errors, warnings or
placeholders, reaching 1,803 pinned Mathlib sources. Independent exact tests
pass 31,013 assertions in 1,200 finite matrix systems over rational dual-number
coefficients with the p-adic max norm, for p=2,3,5,7. The tests include finite
exceptional sets and q=0, q=1 boundary cases. These checks do not prove the
infinite-dimensional topology or close any roadmap stage.

Continue with arbitrary finite-free-image determinant comparison, finite
projective determinants and constant rank, BGR finite-module topology and
inverse bounds, spectral-resultant transport, and the actual completed tensor
carrier. The existing Riesz kernel finiteness/projectivity chain remains.
L0–L3 and the analytic distribution families and specialization in L4 still
require their full source decomposition. Preserve the PMIA suppliers and
RS-16 ownership boundaries.


## General monic division of entire series

Let Q be monic of degree d over a nontrivial complete commutative ultrametric
normed ring A with norm(1)=1. Its reversed polynomial has constant coefficient
one. Use its native formal inverse B_Q, and write b_k for the inverse's
coefficients. This reciprocal need not be entire. Its coefficients instead
satisfy an exponential estimate: choose C≥1 with every reversed coefficient
bounded by C^i; then norm(b_k)≤C^k. Such a C exists because only finitely many
nonconstant polynomial coefficients need bounding. Native inverse recursion,
strong induction and the ultrametric finite-sum inequality prove this estimate.

For entire F=sum f_n T^n, define the quotient by
s_n=sum_(k≥0) f_(n+d+k)b_k. At any radius S>C, the summands have the geometric
majorant (M/S^(n+d))(C/S)^k, where M bounds F's coefficients weighted by S.
Thus the actual tails converge. The ultrametric bound gives
norm(s_n)≤M/S^(n+d). Testing at a smaller arbitrary radius R<S proves the
quotient entire. The definition uses the total native sum for general formal
inputs, while its analytic laws state the convergence hypotheses explicitly.

The reciprocal identity Q.reverse times B_Q=1 yields the coefficient recurrence
f_(n+d)=s_n+sum_(i<d)Q_i s_(n+d-i). Finite-sum interchange is justified by the
summability of every shifted tail. Hence F−Q S_Q(F) has no coefficients at or
above degree d. The remainder is its native polynomial truncation at d.
The native polynomial degree bound includes d=0, where Q=1, the quotient is F
and the remainder is zero.

Uniqueness uses entireness, including over rings with zero divisors. If QH has
degree below d, its high coefficients give a recurrence expressing each h_n
in terms of future coefficients. Choose S larger than the reversed coefficient
bound C. The nonnegative weighted sequence x_n=norm(h_n)S^n has a finite
supremum M by entireness. The recurrence gives x_n≤(C/S)M for every n, so
M≤(C/S)M. Since C/S<1, M=0 and H=0. This proves the corrected entire case of
the monic product obstruction without rescaling the variable by a unit in A.
It does not use the false restricted-series assertion recorded in E1.

Compare two entire quotient/remainder pairs to obtain uniqueness. Native
polynomial division and the previous linear-tail division therefore agree
with this quotient. The existing integrated `L4/entire-division` node is
refined in place with this proof chain; no second top-level division theorem,
entire-series carrier,formal inverse or polynomial division algorithm is planned.

The quotient-algebra determinant comparison, the spectral resultant D(B,P),
its operator comparison and the finite-projective slope arguments remain
separate obligations. The general monic division helper supplies one of their
inputs. The other four stages and all existing supplier requests remain open.

### Division of entire series by a monic polynomial

`LocallyAnalyticDistributions:L4/entire-division` — `entire_monic_division_existsUnique` (theorem).

For monic Q in A[T] of degree d and P in A{{T}}, there are unique S in A{{T}} and R in A[T] with degree R<d and P=QS+R; for Q=1, R=0.

**Hypotheses:** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed.

**Proof outline:**

1. Take S=S_Q(P) and the native truncation remainder provided by entire-monic-division-remainder. The quotient is entire by entire-monic-quotient-entire and the remainder has degree below d.
2. Apply entire-monic-division-unique to any competing pair. When Q=1 the native truncation at zero is zero and the quotient is P.

**Prerequisites:** `LocallyAnalyticDistributions:L4/entire-monic-division-remainder`, `LocallyAnalyticDistributions:L4/entire-monic-quotient-entire`, `LocallyAnalyticDistributions:L4/entire-monic-division-unique`.

**Acceptance:** The quotient is entire, not merely a formal Laurent series.

**Sources:** Coleman-PadicBanach-1997, Appendix A3, division preceding Lemmas A3.5 and A3.7 Exposes the polynomial-division input to the resultants, with the transport and convergence boundary retained.; Coleman-PadicBanach-published-1997, printed434/PDF18, norm interpretation and proof of LemmaA3.5 The retained composite theorem now has explicit reciprocal-tail convergence, coefficient recurrence and entire uniqueness prerequisites. This completes its monic one-variable division proof plan, without claiming the resultant comparisons or spectral resultant.

### Exponential bound for the reciprocal reversal

`LocallyAnalyticDistributions:L4/monic-reciprocal-bound` — `monic_reciprocal_coeff_bound` (lemma).

For every k≥0, norm(b_k)≤C^k.

**Hypotheses:** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed. C is a real number with C≥1 and norm(coeff_i(Q.reverse))≤C^i for every i. Such a C exists because the reversal is a polynomial with constant coefficient1: choose C≥1 bounding its finitely many nonconstant coefficient norms.

**Proof outline:**

1. Use the existing invOfUnit with the unit1; its constant coefficient is1. For k>0, native coeff_invOfUnit writes b_k as minus the finite sum of coeff_i(Q.reverse)b_j over i+j=k,j<k.
2. Strong induction bounds each term by C^i C^j=C^k. Apply the native ultrametric finite-sum bound; no factor equal to the number of summands appears.

**Prerequisites:** `mathlib:Polynomial.reverse`, `mathlib:Polynomial.coeff_zero_reverse`, `mathlib:PowerSeries.invOfUnit`, `mathlib:PowerSeries.coeff_invOfUnit`, `mathlib:IsUltrametricDist.norm_prod_le_of_forall_le_of_nonneg`.

**Acceptance:** The bound concerns the formal reciprocal of Q.reverse, not a formal inverse of Q. Q may have zero constant coefficient.

**Sources:** Coleman-PadicBanach-published-1997, Appendix A3, printed434/PDF18: quotient-algebra interpretation and proof of LemmaA3.5; published432–435/PDF16–19 and authorPDF22–26 read in full. Worker decomposition of the existing monic entire-division input. The reciprocal-tail formula and quantitative estimates are not separately stated in the source. The proof permits nonreduced coefficients and uses the corrected entire hypothesis recorded in E1.

### Convergence of reciprocal-weighted entire tails

`LocallyAnalyticDistributions:L4/monic-reciprocal-tail-summable` — `monic_reciprocal_tail_summable` (lemma).

For every entire F and every m≥0, the series Σ_(k≥0) coeff_(m+k)(F)b_k is summable.

**Hypotheses:** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed.

**Proof outline:**

1. Choose a coefficient bound C as in monic-reciprocal-bound and a real radius S>C. Entireness at S gives M≥0 bounding norm(coeff_j(F))S^j for every j.
2. The kth summand has norm at most (M/S^m)(C/S)^k by the reciprocal coefficient bound and submultiplicativity. The ratio lies in [0,1).
3. Apply native geometric summability and norm-dominated summability in the complete normed additive group. This supplies every shifted tail used in the recurrence, including m=0.

**Prerequisites:** `LocallyAnalyticDistributions:L4/monic-reciprocal-bound`, `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:Filter.Tendsto.bddAbove_range`, `mathlib:summable_geometric_of_lt_one`, `mathlib:Summable.of_norm_bounded_eventually_nat`.

**Acceptance:** No root of Q or inverse of its constant coefficient is chosen.

**Sources:** Coleman-PadicBanach-published-1997, Appendix A3, printed434/PDF18: quotient-algebra interpretation and proof of LemmaA3.5; published432–435/PDF16–19 and authorPDF22–26 read in full. Worker decomposition of the existing monic entire-division input. The reciprocal-tail formula and quantitative estimates are not separately stated in the source. The proof permits nonreduced coefficients and uses the corrected entire hypothesis recorded in E1.

### Reciprocal-tail quotient by a monic polynomial

`LocallyAnalyticDistributions:L4/entire-monic-quotient` — `entireMonicQuotient` (construction).

For native formal F, define S_Q(F) by coefficient s_n=Σ_(k≥0) coeff_(n+d+k)(F)b_k using the total native infinite sum. Analytic interpretation and linear laws are asserted for entire inputs.

**Hypotheses:** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed.

**Proof outline:**

1. Use native PowerSeries.mk on the displayed coefficient function. The definition accepts any Q; all analytic assertions here require Q monic. The preceding summability theorem justifies it for entire F.
2. Zero follows coefficientwise. On entire inputs, native summability allows addition and multiplication by a scalar through each sum. Subsequent nodes promote coefficient evaluation, bounds, entireness, division and comparisons.

**Prerequisites:** `LocallyAnalyticDistributions:L4/monic-reciprocal-tail-summable`, `mathlib:PowerSeries.mk`, `mathlib:PowerSeries.coeff_mk`, `mathlib:PowerSeries.invOfUnit`, `mathlib:Polynomial.reverse`.

**API:**

- `entireMonicQuotient_zero` (simp): S_Q(0)=0.
- `entireMonicQuotient_add` (structure): For entire F,G and monic Q, S_Q(F+G)=S_Q(F)+S_Q(G).
- `entireMonicQuotient_C_mul` (structure): For entire F and monic Q, S_Q(cF)=cS_Q(F) for every c∈A.

**Uses:**

- L4/entire-division and entire-resultants: Provides the actual entire quotient by the monic polynomial used to represent classes in the finite polynomial quotient.
- Coleman LemmaA3.5 and the norm interpretation immediately before it: Supplies the justified analytic division and native polynomial remainder needed for the resultant comparison.
- Existing linear-division nodes: Specializes compatibly to the existing tail quotient for T-a; does not introduce a second entire-series carrier.

**Tests:**

- `monic_quotient_one` (degenerate): For every formal F, S_1(F)=F.
- `monic_quotient_power_shift` (compatibility): For d≥0 and every formal F, S_(T^d)(F) is the native series with nth coefficient coeff_(n+d)(F).
- `monic_quotient_quadratic` (computation): For Q=T^2+aT+b and F=T^3, S_Q(F)=T-a.
- `monic_quotient_nilpotent` (computation): If e^2=0, then S_(T^2-e)(T^4)=T^2+e and the remainder is zero, including nonzero nilpotent e.

**Acceptance:** The shift is n+d+k and the coefficients come from the inverse of the reversal. Inverting Q itself would fail for zero constant coefficient and would not compute this analytic quotient.

**Sources:** Coleman-PadicBanach-published-1997, Appendix A3, printed434/PDF18: quotient-algebra interpretation and proof of LemmaA3.5; published432–435/PDF16–19 and authorPDF22–26 read in full. Worker decomposition of the existing monic entire-division input. The reciprocal-tail formula and quantitative estimates are not separately stated in the source. The proof permits nonreduced coefficients and uses the corrected entire hypothesis recorded in E1.

### Coefficients of the monic tail quotient

`LocallyAnalyticDistributions:L4/entire-monic-quotient-coeff` — `entireMonicQuotient_coeff` (lemma).

For every formal F, coeff_n(S_Q(F))=Σ_(k≥0)coeff_(n+d+k)(F)b_k. For entire F and monic Q this sum converges.

**Hypotheses:** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed.

**Proof outline:**

1. Apply the native coefficient-of-mk formula. Convergence on the asserted analytic domain comes from the construction prerequisite.

**Prerequisites:** `LocallyAnalyticDistributions:L4/entire-monic-quotient`, `mathlib:PowerSeries.coeff_mk`.

**Acceptance:** The equality of total sums alone is not a summability statement outside the analytic domain.

**Sources:** Coleman-PadicBanach-published-1997, Appendix A3, printed434/PDF18: quotient-algebra interpretation and proof of LemmaA3.5; published432–435/PDF16–19 and authorPDF22–26 read in full. Worker decomposition of the existing monic entire-division input. The reciprocal-tail formula and quantitative estimates are not separately stated in the source. The proof permits nonreduced coefficients and uses the corrected entire hypothesis recorded in E1.

### Weighted bound for the monic quotient

`LocallyAnalyticDistributions:L4/entire-monic-quotient-bound` — `entireMonicQuotient_bound` (lemma).

If S≥C, M≥0 and norm(coeff_j(F))S^j≤M for every j, then norm(coeff_n(S_Q(F)))≤M/S^(n+d).

**Hypotheses:** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed. C is a real number with C≥1 and norm(coeff_i(Q.reverse))≤C^i for every i. Such a C exists because the reversal is a polynomial with constant coefficient1: choose C≥1 bounding its finitely many nonconstant coefficient norms.

**Proof outline:**

1. S≥C≥1 makes S positive. Each kth summand is bounded by M C^k/S^(n+d+k)≤M/S^(n+d).
2. Apply the native ultrametric infinite-sum bound. Its total-sum convention permits this inequality even when F is not entire; convergence is invoked separately when using the division identity.

**Prerequisites:** `LocallyAnalyticDistributions:L4/entire-monic-quotient-coeff`, `LocallyAnalyticDistributions:L4/monic-reciprocal-bound`, `mathlib:IsUltrametricDist.norm_tprod_le_of_forall_le_of_nonneg`.

**Acceptance:** The loss is exactly d powers of S. The boundary S=C is permitted in the inequality, but the separate summability proof chooses S>C.

**Sources:** Coleman-PadicBanach-published-1997, Appendix A3, printed434/PDF18: quotient-algebra interpretation and proof of LemmaA3.5; published432–435/PDF16–19 and authorPDF22–26 read in full. Worker decomposition of the existing monic entire-division input. The reciprocal-tail formula and quantitative estimates are not separately stated in the source. The proof permits nonreduced coefficients and uses the corrected entire hypothesis recorded in E1.

### Entireness of the monic quotient

`LocallyAnalyticDistributions:L4/entire-monic-quotient-entire` — `entireMonicQuotient_entire` (lemma).

If F is entire and Q monic, then S_Q(F) is entire.

**Hypotheses:** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed.

**Proof outline:**

1. Choose C controlling the reciprocal as above. For an arbitrary tested radius R>0 choose S>max(R,C). Entireness of F at S supplies M.
2. The coefficient estimate gives norm(s_n)R^n≤(M/S^d)(R/S)^n. Native geometric convergence and squeezing show the left side tends to zero.
3. This holds at every R>0, which is the existing entire predicate. No single-radius completion replaces it.

**Prerequisites:** `LocallyAnalyticDistributions:L4/entire-monic-quotient-bound`, `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:Filter.Tendsto.bddAbove_range`, `mathlib:tendsto_pow_atTop_nhds_zero_of_lt_one`.

**Acceptance:** Arbitrarily large coefficient norms of Q are allowed by increasing S.

**Sources:** Coleman-PadicBanach-published-1997, Appendix A3, printed434/PDF18: quotient-algebra interpretation and proof of LemmaA3.5; published432–435/PDF16–19 and authorPDF22–26 read in full. Worker decomposition of the existing monic entire-division input. The reciprocal-tail formula and quantitative estimates are not separately stated in the source. The proof permits nonreduced coefficients and uses the corrected entire hypothesis recorded in E1.

### The monic quotient coefficient recurrence

`LocallyAnalyticDistributions:L4/entire-monic-quotient-recurrence` — `entireMonicQuotient_recurrence` (lemma).

For entire F and every n≥0, coeff_(n+d)(F)=s_n+Σ_(i<d)coeff_i(Q)s_(n+d-i).

**Hypotheses:** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed.

**Proof outline:**

1. Monicity identifies the constant coefficient of Q.reverse with1, so native mul_invOfUnit gives Q.reverse times B_Q=1. Comparing coefficient ell gives b_ell+Σ_(1≤j≤min(d,ell))coeff_(d-j)(Q)b_(ell-j)=1 for ell=0 and0 otherwise.
2. Expand the asserted right side using the convergent tail formulas. Set j=d-i in the finite lower-degree sum and ell=j+k in each shifted tail.
3. Every shifted series is summable by monic-reciprocal-tail-summable. Native finite-sum interchange and scalar multiplication justify gathering the coefficient of coeff_(n+d+ell)(F). It is the displayed reciprocal convolution, so only ell=0 survives.
4. The case d=0 has an empty finite sum and Q=1; it gives coeff_n(F)=s_n.

**Prerequisites:** `LocallyAnalyticDistributions:L4/entire-monic-quotient-coeff`, `LocallyAnalyticDistributions:L4/monic-reciprocal-tail-summable`, `mathlib:PowerSeries.mul_invOfUnit`, `mathlib:PowerSeries.coeff_mul`, `mathlib:Polynomial.coeff_reverse`, `mathlib:Polynomial.coeff_zero_reverse`, `mathlib:Polynomial.reverse_natDegree_le`, `mathlib:Multipliable.tprod_finsetProd`, `mathlib:Summable.tsum_mul_left`.

**Acceptance:** The indices n+d-i always exceed n for i<d. This direction is essential to both the tail formula and uniqueness.

**Sources:** Coleman-PadicBanach-published-1997, Appendix A3, printed434/PDF18: quotient-algebra interpretation and proof of LemmaA3.5; published432–435/PDF16–19 and authorPDF22–26 read in full. Worker decomposition of the existing monic entire-division input. The reciprocal-tail formula and quantitative estimates are not separately stated in the source. The proof permits nonreduced coefficients and uses the corrected entire hypothesis recorded in E1.

### The native polynomial remainder

`LocallyAnalyticDistributions:L4/entire-monic-division-remainder` — `entireMonicQuotient_division` (theorem).

For entire F, let R be the native degree-d truncation of F-Q S_Q(F). Then F=Q S_Q(F)+R in A[[T]] and degree(R)<d.

**Hypotheses:** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed.

**Proof outline:**

1. The recurrence says all coefficients of F-Q S_Q(F) in degrees n+d vanish. Thus the difference agrees coefficientwise with its native truncation at d.
2. Below d, coeff_trunc gives precisely the original difference; at and above d, both coefficients are zero. Apply native power-series extensionality and rearrange.
3. Native degree_trunc_lt proves the polynomial degree bound, also for d=0 where the remainder is zero and its degree is minus infinity.

**Prerequisites:** `LocallyAnalyticDistributions:L4/entire-monic-quotient-recurrence`, `mathlib:PowerSeries.coeff_mul`, `mathlib:PowerSeries.trunc`, `mathlib:PowerSeries.coeff_trunc`, `mathlib:PowerSeries.degree_trunc_lt`, `mathlib:Polynomial.coeff_coe`.

**Acceptance:** Use polynomial degree, not natDegree, for the zero remainder. No new remainder carrier or arbitrary choice is introduced.

**Sources:** Coleman-PadicBanach-published-1997, Appendix A3, printed434/PDF18: quotient-algebra interpretation and proof of LemmaA3.5; published432–435/PDF16–19 and authorPDF22–26 read in full. Worker decomposition of the existing monic entire-division input. The reciprocal-tail formula and quantitative estimates are not separately stated in the source. The proof permits nonreduced coefficients and uses the corrected entire hypothesis recorded in E1.

### A monic entire product cannot lower degree

`LocallyAnalyticDistributions:L4/entire-monic-product-low-degree` — `entire_monic_product_low_degree` (lemma).

If H is entire, R is a polynomial of degree less than d and QH=R in A[[T]], then H=0 and R=0.

**Hypotheses:** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed.

**Proof outline:**

1. If d=0, monicity gives Q=1 and the degree bound gives R=0, so H=0. For d>0 compare coefficients at n+d: h_n=−Σ_(i<d)coeff_i(Q)h_(n+d-i). This uses only the leading coefficient1 and the remainder degree bound.
2. Choose C≥1 so norm(coeff_(d-j)(Q))≤C^j for j=1,...,d, and S>C. The nonnegative sequence x_n=norm(h_n)S^n tends to zero by entireness and hence has a bounded range. Let M be its real supremum, finite and nonnegative.
3. Put theta=C/S<1. Submultiplicativity and the ultrametric finite-sum estimate give x_n≤max_(1≤j≤d)theta^j x_(n+j)≤theta M. Taking the supremum yields M≤theta M, so M=0.
4. All coefficients h_n vanish. Native power-series extensionality gives H=0; the product identity and injectivity of the native polynomial inclusion then give R=0.

**Prerequisites:** `LocallyAnalyticDistributions:L4/entire-series`, `mathlib:PowerSeries.coeff_mul`, `mathlib:Polynomial.coeff_coe`, `mathlib:Polynomial.coeff_eq_zero_of_degree_lt`, `mathlib:IsUltrametricDist.norm_prod_le_of_forall_le_of_nonneg`, `mathlib:Filter.Tendsto.bddAbove_range`, `mathlib:le_csSup`, `mathlib:csSup_le`, `mathlib:Polynomial.coe_injective`.

**Acceptance:** This proves the monic corrected entire case behind source findingE1 without rescaling by a unit of A. It remains valid with zero divisors. Restricted convergence at radius1 is insufficient.

**Sources:** Coleman-PadicBanach-published-1997, Appendix A3, printed434/PDF18: quotient-algebra interpretation and proof of LemmaA3.5; published432–435/PDF16–19 and authorPDF22–26 read in full. Worker decomposition of the existing monic entire-division input. The reciprocal-tail formula and quantitative estimates are not separately stated in the source. The proof permits nonreduced coefficients and uses the corrected entire hypothesis recorded in E1.

### Uniqueness of monic entire division

`LocallyAnalyticDistributions:L4/entire-monic-division-unique` — `entire_monic_division_unique` (theorem).

If F=QG+R=QH+S, G,H are entire and polynomial R,S have degree less than d, then G=H and R=S.

**Hypotheses:** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed.

**Proof outline:**

1. Subtract the two decompositions. The existing entire subring makes G-H entire. The polynomial S-R has degree below d, including zero remainders.
2. Apply entire-monic-product-low-degree to Q(G-H)=S-R, then conclude both equalities.

**Prerequisites:** `LocallyAnalyticDistributions:L4/entire-monic-product-low-degree`, `LocallyAnalyticDistributions:L4/entire-series`.

**Acceptance:** The proof never cancels a nonunit polynomial inside the full formal-series ring.

**Sources:** Coleman-PadicBanach-published-1997, Appendix A3, printed434/PDF18: quotient-algebra interpretation and proof of LemmaA3.5; published432–435/PDF16–19 and authorPDF22–26 read in full. Worker decomposition of the existing monic entire-division input. The reciprocal-tail formula and quantitative estimates are not separately stated in the source. The proof permits nonreduced coefficients and uses the corrected entire hypothesis recorded in E1.

### Compatibility with native polynomial division

`LocallyAnalyticDistributions:L4/entire-monic-quotient-polynomial` — `entireMonicQuotient_polynomial` (comparison).

For every polynomial P, S_Q(P)=P divByMonic Q under native polynomial inclusion, and the constructed native truncation remainder equals P modByMonic Q.

**Hypotheses:** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed.

**Proof outline:**

1. The native monic polynomial division identity provides a polynomial quotient and remainder, with the remainder degree below d. Include the equality in native power series; polynomials are entire by the existing lemma.
2. Compare it with the constructed entire division. Uniqueness identifies both quotients and both remainders.

**Prerequisites:** `LocallyAnalyticDistributions:L4/entire-monic-division-remainder`, `LocallyAnalyticDistributions:L4/entire-monic-quotient-entire`, `LocallyAnalyticDistributions:L4/entire-monic-division-unique`, `LocallyAnalyticDistributions:L4/polynomial-series-entire`, `mathlib:Polynomial.modByMonic_add_div`, `mathlib:Polynomial.degree_modByMonic_lt`.

**Acceptance:** This is compatibility with the already-existing divByMonic and modByMonic, not a new polynomial division algorithm.

**Sources:** Coleman-PadicBanach-published-1997, Appendix A3, printed434/PDF18: quotient-algebra interpretation and proof of LemmaA3.5; published432–435/PDF16–19 and authorPDF22–26 read in full. Worker decomposition of the existing monic entire-division input. The reciprocal-tail formula and quantitative estimates are not separately stated in the source. The proof permits nonreduced coefficients and uses the corrected entire hypothesis recorded in E1.

### Compatibility with the existing linear tail quotient

`LocallyAnalyticDistributions:L4/entire-monic-quotient-linear` — `entireMonicQuotient_linear` (comparison).

For every a∈A and entire F, S_(T-a)(F) equals the existing entireLinearQuotient(a,F).

**Hypotheses:** A is a nontrivial complete commutative ultrametric normed ring with submultiplicative norm and norm(1)=1. Native PowerSeries and Polynomial carriers are used. Q is monic of degree d, allowing d=0 and Q=1. Write B_Q for native invOfUnit(Q.reverse,1), using the native polynomial inclusion, and b_k for its kth coefficient. The reversal has constant coefficient1. No domain, reducedness, Noetherianity, field or splitting hypothesis is imposed.

**Proof outline:**

1. Both quotient constructions are entire and give division of F by the same native monic linear polynomial. The linear construction has constant remainder F(a); the native degree-one truncation is also constant.
2. Apply the general uniqueness theorem. It identifies the quotients and, as a consequence, the native remainder with the existing evaluation constant.

**Prerequisites:** `LocallyAnalyticDistributions:L4/entire-monic-division-remainder`, `LocallyAnalyticDistributions:L4/entire-monic-quotient-entire`, `LocallyAnalyticDistributions:L4/entire-monic-division-unique`, `LocallyAnalyticDistributions:L4/entire-linear-division`, `LocallyAnalyticDistributions:L4/entire-linear-quotient-entire`.

**Acceptance:** No new evaluation functional or competing linear quotient is defined.

**Sources:** Coleman-PadicBanach-published-1997, Appendix A3, printed434/PDF18: quotient-algebra interpretation and proof of LemmaA3.5; published432–435/PDF16–19 and authorPDF22–26 read in full. Worker decomposition of the existing monic entire-division input. The reciprocal-tail formula and quantitative estimates are not separately stated in the source. The proof permits nonreduced coefficients and uses the corrected entire hypothesis recorded in E1.

### Current validation and continuation

Ninety-one predecessor node objects remain whole. The existing entire-division
node retains its identifier and conclusion, and now names its explicit proof
prerequisites. All94 earlier baseline objects,two findings,six planets,
five requests and previous suggested-file bytes are preserved. Twelve nodes,
the refined theorem,three API signatures and four typed examples are appended.
The full seed compiles with0 errors and217 placeholder warnings only,against
2,057 byte-verified pinned Mathlib modules; no Tau Ceti or planned supplier is
imported by this seed. Every implementation status remains unchecked.

A complete scratch proof establishes the reciprocal coefficient estimate by
strong induction using the actual native invOfUnit recurrence. It also proves
the constant and product identities and the real supremum contraction argument
used in uniqueness, and checks the actual quotient constructor and its
unit-divisor case. These proofs validate key steps; the entire convergence and
full division theorem remain a blueprint plan. Exact finite arithmetic compares
an independent monic long-division algorithm with reciprocal-tail coefficients
in Q[epsilon]/(epsilon^2),using its maximum p-adic coefficient norm. All62,415
assertions pass in960 systems at p=2,3,5,7 and divisor degrees0 through5.
These checks include weighted bounds,recurrences,degree-zero divisors,
quadratic signs and nonzero nilpotents; they do not prove infinite convergence.

Fresh full source reads: published Coleman printed432–435/physicalPDF16–19
and author physicalPDF22–26. Both fetched PDFs match the recorded hashes.
The inherited E1/E2 findings remain unchanged and await independent review.
No new finding or fresh whole-paper audit is claimed. Sixteen added baseline
statements and their hypotheses were read at the pin.

During this work PMIA209→225 supplied this session's finite-coordinate
checkpoint,then225→232 added seven dilation/substitution nodes. All seven
new complete node objects were read; they preserve the entire coefficient
algebra boundary and are not new prerequisites for this division theorem.
The source registry's new QSeries/E208 periodicity finding was read in full;
all earlier registry objects were unchanged and the finding does not alter
monic entire division.

Resume with the finite-free quotient-algebra/resultant comparison and spectral
resultant D(B,P),followed by its operator and finite-projective determinant/rank
transport. Canonical finite-module topology,completed tensor interfaces and
actual locally analytic distribution modules retain the precise eight gaps
and five requests. The general monic division helper itself now has a fully
decomposed proof plan; no whole stage is closed.


## Finite polynomial spectral transform

The finite stage of Coleman's spectral transform belongs to ordinary
commutative algebra. Let A be a commutative ring, P and B polynomials, and
choose bounds n≥degree(P) and m≥degree(B), with P(0)=1. Reverse P at the
specified exponent n, obtaining the monic polynomial Q_n(Y). Define
D_(n,m)(B,P) as the native bounded resultant over A[T] of Q_n(Y) and
1−T B(Y), with bounds n,m. The two polynomial variables play different roles:
Y is eliminated by the resultant, while T is the output variable.

Keeping n visible is essential. If P=1, reversal at n gives Y^n, which
retains n zero roots. Multiplication of normalized input factors adds their
bounds and multiplies the transform. Increasing n by one multiplies it by
1−B(0)T. Thus B(0)=0 makes the transform independent of added degree padding;
without it the assertion is false, already for B=P=1. Independence of m is
the existing pinned Tau Ceti theorem for a monic left resultant argument.
No generic resultant theorem is planned again.

The construction commutes with every coefficient ring homomorphism when the
bounds are retained. This includes maps that kill leading coefficients.
Its constant coefficient is1, and its value at t is the ordinary bounded
resultant of Q_n and1−tB. A single factor P=1−aY gives1−B(a)T.
Finite products therefore give the exact source root-product formula,
including repeated roots and a=0. Over ZMod4, the factor with a=2 and B=Y²
has transform1. Over ZMod8, B=Y+Y² and P=(1−2Y)² give1+4T+4T².
These computations preserve nilpotents and multiplicities.

The native AdjoinRoot quotient over A[T] identifies the same resultant with
the algebra norm of the class of1−T B(Y). It has a native finite power basis.
This comparison requires no topology, reducedness or root decomposition.
The infinite entire-series limit, its coefficient estimates, the finite
endomorphism characteristic-polynomial comparison, and the full operator
spectral-mapping theorem remain separate obligations. In particular the
finite product formula alone does not prove A3.8 for arbitrary entire series
or A3.9 for completely continuous operators.

### Monic reversal of a normalized polynomial

`LocallyAnalyticDistributions:L4/spectral-reversed-degree` — `TauCeti.NonarchimedeanFredholm.spectralReversal_monic` (lemma).

If A is nontrivial, Q_n is monic of degree exactly n, even when degree(P)<n.

**Hypotheses:** A is any commutative ring, including rings with zero divisors. B and P are native polynomials over A; T is the output variable and Y the resultant variable. Unless a statement explicitly weakens them, assume P(0)=1, degree(P)≤n and degree(B)≤m, where n,m are natural numbers. Write Q_n(Y)=reflect_n(P), the native reversal at the specified exponent n, and K_B(T,Y)=1−T B(Y). Neither n nor m is silently replaced by an actual degree. The degree equality requires A nontrivial; the other spectral laws below include the zero ring by its unique-element case.

**Proof outline:**

1. Native coeff_reflect makes coefficient n equal P(0)=1. Native natDegree_reflect_le bounds its degree by n.
2. A nonzero coefficient in degree n forces equality of degrees; that same coefficient proves monicity. The coefficient proof establishes both conclusions together.

**Prerequisites:** `mathlib:Polynomial.coeff_reflect`, `mathlib:Polynomial.natDegree_reflect_le`.

**Acceptance:** P=1 gives Q_n=Y^n. Using only the actual-degree reversal would lose the padded zero roots.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed434–436/PDF18–20: finite definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27 September2026. Worker decomposition of the finite polynomial stage through native bounded resultants. The explicit second degree bound, padding law and arbitrary commutative-ring generality make the finite definition and specialization precise. This does not assert the infinite-series limit or the operator spectral-mapping theorem.

### The finite polynomial spectral transform

`LocallyAnalyticDistributions:L4/polynomial-spectral-resultant` — `TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant` (construction).

Define D_(n,m)(B,P) as the native resultant over A[T] of Q_n(Y), with its coefficients included as constants, and K_B(T,Y)=1−T B(Y), with degree bounds n,m. Its value is a native polynomial in T. The expression is total; its spectral interpretation uses the stated degree bounds and P(0)=1.

**Hypotheses:** A is any commutative ring, including rings with zero divisors. B and P are native polynomials over A; T is the output variable and Y the resultant variable. Unless a statement explicitly weakens them, assume P(0)=1, degree(P)≤n and degree(B)≤m, where n,m are natural numbers. Write Q_n(Y)=reflect_n(P), the native reversal at the specified exponent n, and K_B(T,Y)=1−T B(Y). Neither n nor m is silently replaced by an actual degree.

**Proof outline:**

1. Use native Polynomial.reflect, coefficient inclusion into A[T], and the native bounded Sylvester resultant. No new polynomial, root-algebra or determinant carrier is introduced.
2. The resultant-variable degree of K_B is at most degree(B): subtraction, constant multiplication and coefficient mapping do not increase the relevant degree. The reversal lemma makes the left argument monic of exact degree n in the nontrivial case.
3. Retain both bounds in the definition so specialization to a ring where coefficients vanish preserves the actual expression. The separate bound-independence and padding theorems identify valid presentations.

**Prerequisites:** `LocallyAnalyticDistributions:L4/spectral-reversed-degree`, `mathlib:Polynomial.reflect`, `mathlib:Polynomial.resultant`, `mathlib:Polynomial.natDegree_sub_le`, `mathlib:Polynomial.natDegree_C_mul_le`, `mathlib:Polynomial.natDegree_map_le`, `mathlib:Polynomial.resultant_zero_right_deg`, `mathlib:Polynomial.resultant_zero_left_deg`.

**Uses:**

- Coleman A3 finite definition and A3.8: Supplies the finite polynomial transform and its product law before the analytic limiting argument.
- Coleman A3.9, A4.1 and LAD fredholm-resolvent: Provides the finite quotient-norm expression required before comparing a functional-calculus operator with its characteristic series.

**API:**

- `polynomialSpectralResultant_def` (data): The value is the native bounded resultant over A[T] of the mapped reversal and1−T B(Y), with the two displayed bounds.
- `polynomialSpectralResultant_eval` (simp): Evaluation at t is the bounded resultant Res(Q_n,1−tB); promoted.
- `polynomialSpectralResultant_constantCoeff` (simp): For P(0)=1 the constant coefficient is1; promoted.
- `polynomialSpectralResultant_zero` (example): For B=0 and m=0 the value is1, with any P and n.
- `polynomialSpectralResultant_oneInput` (example): For P=1 and n=0 the value is1, for any B and m.
- `polynomialSpectralResultant_linear` (simp): For P=1−aY,n=1 the value is1−B(a)T; promoted.
- `polynomialSpectralResultant_mul` (compatibility): Multiplication in P adds its two degree bounds and multiplies D; promoted.
- `polynomialSpectralResultant_padding` (compatibility): Increasing n by one multiplies D by1−B(0)T; promoted.
- `polynomialSpectralResultant_map` (functoriality): Fixed-bound construction commutes with every coefficient ring map; promoted.
- `polynomialSpectralResultant_norm` (compatibility): The value is a native finite-quotient algebra norm; promoted.

**Tests:**

- `SpectralTests.rank_zero` (degenerate): D_(0,0)(1,1)=1 over the integers.
- `SpectralTests.nonzero_constant_padding` (non-example): D_(1,0)(1,1)=1−T over the integers, although D_(0,0)(1,1)=1. Thus B(0)=0 cannot be omitted from padding stability.
- `SpectralTests.nilpotent_linear` (computation): Over ZMod4, D_(1,2)(Y^2,1−2Y)=1, because the squared nilpotent eigenvalue is zero.
- `SpectralTests.repeated_root` (computation): Over ZMod8, D_(2,2)(Y+Y^2,(1−2Y)^2)=1+4T+4T^2. Repeated roots and nonreduced coefficients are retained.

**Acceptance:** These are finite polynomial data. Existence, entireness and coefficientwise convergence of D on arbitrary entire inputs remain explicit gaps.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed434–436/PDF18–20: finite definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27 September2026. Worker decomposition of the finite polynomial stage through native bounded resultants. The explicit second degree bound, padding law and arbitrary commutative-ring generality make the finite definition and specialization precise. This does not assert the infinite-series limit or the operator spectral-mapping theorem.

### Specializing the spectral parameter

`LocallyAnalyticDistributions:L4/spectral-polynomial-evaluation` — `TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant_eval` (lemma).

For every t∈A, D_(n,m)(B,P)(t)=Res_A(Q_n,1−tB;n,m). This formula requires no degree or constant-coefficient hypotheses.

**Hypotheses:** A is any commutative ring, including rings with zero divisors. B and P are native polynomials over A; T is the output variable and Y the resultant variable. Unless a statement explicitly weakens them, assume P(0)=1, degree(P)≤n and degree(B)≤m, where n,m are natural numbers. Write Q_n(Y)=reflect_n(P), the native reversal at the specified exponent n, and K_B(T,Y)=1−T B(Y). Neither n nor m is silently replaced by an actual degree.

**Proof outline:**

1. Apply native resultant_map_map to the evaluation ring homomorphism A[T]→A.
2. The two composed constant-inclusion/evaluation maps are the identity on A. The kernel specializes to1−tB, with the same explicit degree bounds.

**Prerequisites:** `LocallyAnalyticDistributions:L4/polynomial-spectral-resultant`, `mathlib:Polynomial.resultant_map_map`, `mathlib:Polynomial.map_map`.

**Acceptance:** The specialization preserves the bounds even when actual degrees fall.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed434–436/PDF18–20: finite definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27 September2026. Worker decomposition of the finite polynomial stage through native bounded resultants. The explicit second degree bound, padding law and arbitrary commutative-ring generality make the finite definition and specialization precise. This does not assert the infinite-series limit or the operator spectral-mapping theorem.

### Normalization of the finite transform

`LocallyAnalyticDistributions:L4/spectral-polynomial-constant` — `TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant_constantCoeff` (lemma).

If P(0)=1, the constant coefficient of D_(n,m)(B,P) is1 for every B,n,m, without degree hypotheses.

**Hypotheses:** A is any commutative ring, including rings with zero divisors. B and P are native polynomials over A; T is the output variable and Y the resultant variable. Unless a statement explicitly weakens them, assume P(0)=1, degree(P)≤n and degree(B)≤m, where n,m are natural numbers. Write Q_n(Y)=reflect_n(P), the native reversal at the specified exponent n, and K_B(T,Y)=1−T B(Y). Neither n nor m is silently replaced by an actual degree.

**Proof outline:**

1. Evaluate the preceding formula at0. The right polynomial becomes1.
2. Native resultant_one_right gives coefficient n of Q_n raised to m. Native reversal identifies that coefficient with P(0)=1.

**Prerequisites:** `LocallyAnalyticDistributions:L4/spectral-polynomial-evaluation`, `mathlib:Polynomial.resultant_one_right`, `mathlib:Polynomial.coeff_reflect`, `mathlib:Polynomial.coeff_zero_eq_eval_zero`.

**Acceptance:** The case n=m=0 is included; the empty determinant gives1.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed434–436/PDF18–20: finite definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27 September2026. Worker decomposition of the finite polynomial stage through native bounded resultants. The explicit second degree bound, padding law and arbitrary commutative-ring generality make the finite definition and specialization precise. This does not assert the infinite-series limit or the operator spectral-mapping theorem.

### Independence of the auxiliary degree bound

`LocallyAnalyticDistributions:L4/spectral-right-bound` — `TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant_rightBound` (lemma).

For any m≥degree(B), D_(n,m)(B,P)=D_(n,degree(B))(B,P).

**Hypotheses:** A is any commutative ring, including rings with zero divisors. B and P are native polynomials over A; T is the output variable and Y the resultant variable. Unless a statement explicitly weakens them, assume P(0)=1, degree(P)≤n and degree(B)≤m, where n,m are natural numbers. Write Q_n(Y)=reflect_n(P), the native reversal at the specified exponent n, and K_B(T,Y)=1−T B(Y). Neither n nor m is silently replaced by an actual degree.

**Proof outline:**

1. In the nontrivial case, the reversed left polynomial is monic of degree n, and its constant-coefficient inclusion preserves that degree.
2. Apply the existing pinned TauCeti Monic.resultant_of_le separately to the bounds m and degree(B); both reduce to the same native resultant. The zero-ring case has a unique result.

**Prerequisites:** `LocallyAnalyticDistributions:L4/polynomial-spectral-resultant`, `LocallyAnalyticDistributions:L4/spectral-reversed-degree`, `mathlib:Polynomial.Monic.map`, `mathlib:Polynomial.Monic.natDegree_map`, `tauceti:Polynomial.Monic.resultant_of_le`.

**Acceptance:** No second proof of the generic monic resultant degree-bound theorem is planned.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed434–436/PDF18–20: finite definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27 September2026. Worker decomposition of the finite polynomial stage through native bounded resultants. The explicit second degree bound, padding law and arbitrary commutative-ring generality make the finite definition and specialization precise. This does not assert the infinite-series limit or the operator spectral-mapping theorem.

### A single polynomial eigenvalue

`LocallyAnalyticDistributions:L4/spectral-linear-factor` — `TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant_linear` (lemma).

For a∈A and m≥degree(B), D_(1,m)(B,1−aY)=1−B(a)T, including a=0.

**Hypotheses:** A is any commutative ring, including rings with zero divisors. B and P are native polynomials over A; T is the output variable and Y the resultant variable. Unless a statement explicitly weakens them, assume P(0)=1, degree(P)≤n and degree(B)≤m, where n,m are natural numbers. Write Q_n(Y)=reflect_n(P), the native reversal at the specified exponent n, and K_B(T,Y)=1−T B(Y). Neither n nor m is silently replaced by an actual degree.

**Proof outline:**

1. Native bounded reversal sends1−aY toY−a, including when a=0 and the actual degree of the input is zero.
2. Native resultant_X_sub_C_left evaluates K_B at the constant image of a. Native evaluation under the coefficient map gives B(a), with the displayed orientation.

**Prerequisites:** `LocallyAnalyticDistributions:L4/polynomial-spectral-resultant`, `mathlib:Polynomial.coeff_reflect`, `mathlib:Polynomial.resultant_X_sub_C_left`, `mathlib:Polynomial.eval_map_apply`.

**Acceptance:** This is multiplication by the eigenvalue B(a), not substitution T↦B(T) in the original polynomial.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed434–436/PDF18–20: finite definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27 September2026. Worker decomposition of the finite polynomial stage through native bounded resultants. The explicit second degree bound, padding law and arbitrary commutative-ring generality make the finite definition and specialization precise. This does not assert the infinite-series limit or the operator spectral-mapping theorem.

### Multiplication of finite characteristic factors

`LocallyAnalyticDistributions:L4/spectral-factor-product` — `TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant_mul` (lemma).

For normalized P,Q with degree(P)≤n,degree(Q)≤k and degree(B)≤m, D_(n+k,m)(B,PQ)=D_(n,m)(B,P)D_(k,m)(B,Q).

**Hypotheses:** A is any commutative ring, including rings with zero divisors. B and P are native polynomials over A; T is the output variable and Y the resultant variable. Unless a statement explicitly weakens them, assume P(0)=1, degree(P)≤n and degree(B)≤m, where n,m are natural numbers. Write Q_n(Y)=reflect_n(P), the native reversal at the specified exponent n, and K_B(T,Y)=1−T B(Y). Neither n nor m is silently replaced by an actual degree.

**Proof outline:**

1. Native reflect_mul identifies the reversed product at bound n+k with the product of the two reversals at bounds n,k.
2. The reversal lemma and native monic coefficient-map degree law identify the two actual degrees as n,k. Apply native resultant_mul_left with the kernel degree bound.
3. If A is the zero ring the equality is automatic. No roots, distinctness, domain or coprimality assumption is used.

**Prerequisites:** `LocallyAnalyticDistributions:L4/polynomial-spectral-resultant`, `LocallyAnalyticDistributions:L4/spectral-reversed-degree`, `mathlib:Polynomial.reflect_mul`, `mathlib:Polynomial.Monic.natDegree_map`, `mathlib:Polynomial.resultant_mul_left`.

**Acceptance:** This proves the finite polynomial form of A3.8(10). Passing to entire inputs remains separate.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed434–436/PDF18–20: finite definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27 September2026. Worker decomposition of the finite polynomial stage through native bounded resultants. The explicit second degree bound, padding law and arbitrary commutative-ring generality make the finite definition and specialization precise. This does not assert the infinite-series limit or the operator spectral-mapping theorem.

### The exact zero-root padding factor

`LocallyAnalyticDistributions:L4/spectral-zero-padding` — `TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant_padding` (lemma).

D_(n+1,m)(B,P)=D_(n,m)(B,P)(1−B(0)T).

**Hypotheses:** A is any commutative ring, including rings with zero divisors. B and P are native polynomials over A; T is the output variable and Y the resultant variable. Unless a statement explicitly weakens them, assume P(0)=1, degree(P)≤n and degree(B)≤m, where n,m are natural numbers. Write Q_n(Y)=reflect_n(P), the native reversal at the specified exponent n, and K_B(T,Y)=1−T B(Y). Neither n nor m is silently replaced by an actual degree.

**Proof outline:**

1. Apply the factor-product theorem to P and the polynomial1, using degree bounds n and1.
2. Regard1 as1−0Y and apply the linear-factor theorem to obtain the extra factor1−B(0)T.

**Prerequisites:** `LocallyAnalyticDistributions:L4/spectral-factor-product`, `LocallyAnalyticDistributions:L4/spectral-linear-factor`.

**Acceptance:** For B=1,P=1, padding once changes the value from1 to1−T. The constant-term hypothesis is mathematically necessary.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed434–436/PDF18–20: finite definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27 September2026. Worker decomposition of the finite polynomial stage through native bounded resultants. The explicit second degree bound, padding law and arbitrary commutative-ring generality make the finite definition and specialization precise. This does not assert the infinite-series limit or the operator spectral-mapping theorem.

### Stability when the operator series vanishes at zero

`LocallyAnalyticDistributions:L4/spectral-padding-stability` — `TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant_stable` (lemma).

If B(0)=0, then D_(n+k,m)(B,P)=D_(n,m)(B,P) for every k≥0. Hence any two valid bounds on degree(P) give the same transform.

**Hypotheses:** A is any commutative ring, including rings with zero divisors. B and P are native polynomials over A; T is the output variable and Y the resultant variable. Unless a statement explicitly weakens them, assume P(0)=1, degree(P)≤n and degree(B)≤m, where n,m are natural numbers. Write Q_n(Y)=reflect_n(P), the native reversal at the specified exponent n, and K_B(T,Y)=1−T B(Y). Neither n nor m is silently replaced by an actual degree. B(0)=0 for this assertion.

**Proof outline:**

1. Induct on k using the exact padding law. The factor1−B(0)T is1.
2. For two unrelated valid bounds compare each with their maximum. Together with right-bound independence this yields the canonical finite transform without choosing a splitting algebra.

**Prerequisites:** `LocallyAnalyticDistributions:L4/spectral-zero-padding`, `LocallyAnalyticDistributions:L4/spectral-right-bound`.

**Acceptance:** The hypothesis B(0)=0 matches the entire functional-calculus setting; it is not required for the finite fixed-bound construction itself.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed434–436/PDF18–20: finite definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27 September2026. Worker decomposition of the finite polynomial stage through native bounded resultants. The explicit second degree bound, padding law and arbitrary commutative-ring generality make the finite definition and specialization precise. This does not assert the infinite-series limit or the operator spectral-mapping theorem.

### Coefficient maps preserve the finite transform

`LocallyAnalyticDistributions:L4/spectral-scalar-extension` — `TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant_map` (lemma).

For every homomorphism f:A→S of commutative rings, mapping the coefficients of D_(n,m)(B,P) by f gives D_(n,m)(f(B),f(P)). No degree or constant-coefficient hypotheses are needed for this fixed-bound identity.

**Hypotheses:** A is any commutative ring, including rings with zero divisors. B and P are native polynomials over A; T is the output variable and Y the resultant variable. Unless a statement explicitly weakens them, assume P(0)=1, degree(P)≤n and degree(B)≤m, where n,m are natural numbers. Write Q_n(Y)=reflect_n(P), the native reversal at the specified exponent n, and K_B(T,Y)=1−T B(Y). Neither n nor m is silently replaced by an actual degree.

**Proof outline:**

1. Use native reflect_map and the commuting square between coefficient mapping and constant inclusion to identify the first resultant argument after mapping.
2. The same square identifies the mapped kernel with1−T f(B). Apply native resultant_map_map with the induced map A[T]→S[T].

**Prerequisites:** `LocallyAnalyticDistributions:L4/polynomial-spectral-resultant`, `mathlib:Polynomial.reflect_map`, `mathlib:Polynomial.resultant_map_map`, `mathlib:Polynomial.map_map`.

**Acceptance:** The equality includes noninjective maps and specialization to nonreduced rings. Fixed degree bounds prevent accidental degree loss.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed434–436/PDF18–20: finite definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27 September2026. Worker decomposition of the finite polynomial stage through native bounded resultants. The explicit second degree bound, padding law and arbitrary commutative-ring generality make the finite definition and specialization precise. This does not assert the infinite-series limit or the operator spectral-mapping theorem.

### Finite spectral transform as a native algebra norm

`LocallyAnalyticDistributions:L4/spectral-quotient-norm` — `TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant_norm` (comparison).

D_(n,m)(B,P) is Algebra.norm over A[T] of the class of1−T B(Y) in native AdjoinRoot(Q_n mapped into A[T][Y]).

**Hypotheses:** A is any commutative ring, including rings with zero divisors. B and P are native polynomials over A; T is the output variable and Y the resultant variable. Unless a statement explicitly weakens them, assume P(0)=1, degree(P)≤n and degree(B)≤m, where n,m are natural numbers. Write Q_n(Y)=reflect_n(P), the native reversal at the specified exponent n, and K_B(T,Y)=1−T B(Y). Neither n nor m is silently replaced by an actual degree.

**Proof outline:**

1. The reversal and native monic map facts make the quotient polynomial monic of degree n.
2. Native Monic.resultant_of_le removes the valid auxiliary bound m. Apply pinned AdjoinRoot.norm_mk_eq_resultant in the coefficient ring A[T].
3. The native monic quotient power basis supplies the finite free algebra and determinant interpretation. The zero ring is handled by uniqueness, not by a nontriviality assumption hidden in a basis argument.

**Prerequisites:** `LocallyAnalyticDistributions:L4/polynomial-spectral-resultant`, `LocallyAnalyticDistributions:L4/spectral-reversed-degree`, `LocallyAnalyticDistributions:L4/spectral-right-bound`, `mathlib:Polynomial.Monic.map`, `mathlib:Polynomial.Monic.natDegree_map`, `tauceti:AdjoinRoot.norm_mk_eq_resultant`.

**Acceptance:** This is a finite polynomial quotient. No normed topology or entire evaluation in that quotient is asserted by this algebraic statement.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed434–436/PDF18–20: finite definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27 September2026. Worker decomposition of the finite polynomial stage through native bounded resultants. The explicit second degree bound, padding law and arbitrary commutative-ring generality make the finite definition and specialization precise. This does not assert the infinite-series limit or the operator spectral-mapping theorem.

### The finite root-product formula

`LocallyAnalyticDistributions:L4/spectral-split-factors` — `TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant_split` (lemma).

For a finite index set I, arbitrary elements a_i∈A and m≥degree(B), D_(|I|,m)(B,∏_i(1−a_iY))=∏_i(1−B(a_i)T). Repetitions and zero a_i are allowed.

**Hypotheses:** A is any commutative ring, including rings with zero divisors. B and P are native polynomials over A; T is the output variable and Y the resultant variable. Unless a statement explicitly weakens them, assume P(0)=1, degree(P)≤n and degree(B)≤m, where n,m are natural numbers. Write Q_n(Y)=reflect_n(P), the native reversal at the specified exponent n, and K_B(T,Y)=1−T B(Y). Neither n nor m is silently replaced by an actual degree.

**Proof outline:**

1. Native degree-of-product and constant-coefficient-of-product facts give the hypotheses for each partial product. Each linear factor has degree at most1 and constant coefficient1.
2. Induct on the finite set, applying factor-product and the linear-factor formula. The empty product uses the n=0 resultant formula.
3. This agrees with the source finite symmetric-polynomial formula whenever factors are supplied. It does not assume every polynomial splits in A or construct an analytic splitting extension.

**Prerequisites:** `LocallyAnalyticDistributions:L4/spectral-factor-product`, `LocallyAnalyticDistributions:L4/spectral-linear-factor`, `LocallyAnalyticDistributions:L4/polynomial-spectral-resultant`, `mathlib:Polynomial.natDegree_prod_le`, `mathlib:Polynomial.coeff_zero_prod`, `mathlib:Polynomial.resultant_zero_left_deg`.

**Acceptance:** The root multiset is retained. A distinct-root set would lose multiplicities and fail the repeated-root test over ZMod8.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed434–436/PDF18–20: finite definition of D(B,P), LemmaA3.8 and TheoremA3.9; complete printed432–436 freshly read27 September2026. Worker decomposition of the finite polynomial stage through native bounded resultants. The explicit second degree bound, padding law and arbitrary commutative-ring generality make the finite definition and specialization precise. This does not assert the infinite-series limit or the operator spectral-mapping theorem.

### Current validation and continuation

All112 predecessor node objects,128 baseline records,two source findings,
five requests,six planets and all preceding suggested Lean bytes are preserved.
All five reviewed AUDIT25 rows, accepted RS16 layer boundaries/review and the
current handoff were read. The eight added and two refined entire-resultant
nodes were reread in full, including their exact native-quotient conventions.
Binding protocols, expansion protocol,two upstream model documents and all28
touching link files match their preceding complete reads. The source-registry
and register inputs retain the concurrent reading/screening provenance from
the immediately preceding PMIA checkpoint; no relevant finding changed.

Complete published Coleman printed432–436/PDF16–20 was freshly read, including
A3.8,A3.9 and the A4.1 application. Published scan:
https://kundudeb.github.io/1997_Coleman.pdf
SHA25632ff34f60fc2ef4608506daa169c3cc61e07520f019d63928e86b093a16b1973.
The finite commutative-ring decomposition is a worker deduction from this
source, not a new finding. The existing E1/E2 source findings await review.
Twenty-four exact indexed native declarations and their hypotheses were read,
adding23 baseline records. The generic bounded resultant, reversal, finite
quotient and norm are native library objects.

A bounded upstream search screened31 open resultant hits and20 Fredholm hits;
the full bodies of PR26283,39274 and41858 were read. They concern generic
resultants and Fredholm-operator predicates. No exact competing finite spectral
transform was identified in this screen. The pinned TauCeti exact spectral/
Fredholm-determinant search found no match; this is not a global absence claim.

Indexed blueprint:0 errors/0 warnings. Four-file intake:0 problems. Versioned
errata,preservation,reader/API/signature/test parity and exact scope checks pass.
The dependency graph has124 reachable nodes,498 acyclic edges and148 native
baseline leaves. Its only stage leaf is the preserved AdicSpacesPartII:R3
generality request; the other recorded requests and eight gaps remain.

The complete proposed suggested file compiles with0 errors and259 warnings,
all proof placeholders. Its recursive source audit covers2,203 pinned Mathlib
modules and four pinned TauCeti modules. Those four native modules were rebuilt
from pinned sources with0 errors and0 warnings. There are no proposed supplier
imports. The file contains86 typed examples,including four new controls.

A separate independent complete native proof file has two constructions and
21 proved lemmas,0 errors,0 warnings and no placeholders. It proves the actual
finite resultant evaluation,normalization,linear factors,bound independence,
product,padding,stability,scalar extension,norm and finite split-product laws.
It also proves the zero-padding counterexample and the ZMod4/ZMod8 nilpotent
and repeated-root controls. Its recursive audit covers2,794 pinned Mathlib
and the same four pinned TauCeti modules. All public implementation statuses
remain unchecked; no infinite convergence or operator theorem is inferred.

Before publication the PMIA232→249 input was compared with the exact preceding
own merged PR3243 and matched. The registry7,564→7,568 adds four findings in
other roadmaps; all four records and the full generated register delta were
read. Every prior registry record is unchanged. No LAD supplier or finding
changed in these refreshes.


Use this finite construction to prove the characteristic-polynomial
comparison for finite endomorphisms, with multiplicities and arbitrary
commutative coefficient rings. Then prove convergence and entireness of the
simultaneous polynomial truncation limit, justify the product law under that
limit, and establish A3.8(11), including reversal/resultant normalization.
Transport A3.9 through actual finite approximations and into the existing (Pr)
framework. Canonical finite-module topology, completed tensors, finite-projective
rank/determinant comparisons and actual affinoid distribution families remain
in the preserved gaps. No stage is closed by this finite slice.


## Finite characteristic comparison under triangularization

137 unchecked nodes (16 comparison, 15 construction, 3 definition, 80 lemma, 23 theorem), 80 API entries, 90 packet tests, 90 typed examples, six planets and 171 baseline records. Eight gaps, five requests, two source findings and zero closed stages remain.

The native reverse characteristic polynomial P_M(T)=det(1−TM) is used directly.
Its rank parameter is the matrix size N, even if its actual polynomial degree
falls. All scalar-extension statements preserve that rank. The comparison
D_(N,m)(B,P_M)=P_(B(M)) is established here with explicit triangularization
hypotheses over arbitrary commutative rings; repeated and zero diagonal entries
and nilpotent coefficients are retained. No condition B(0)=0 is needed at fixed
finite rank. Such a condition remains essential for rank-padding stability and
the infinite functional-calculus problem.

The proof first treats an upper triangular matrix, then a matrix with a given
triangularizing unit, then descends an equality from a given injective scalar
extension with a triangularizing unit. These are distinct, explicit hypotheses.
An arbitrary ring need not embed into a field, and split characteristic
polynomials over rings do not automatically provide triangularizing bases.
Specialization only to residue fields does not detect nilpotents. The
unrestricted finite theorem therefore remains a separate obligation.
### Fixed-rank reflection of the characteristic series

`LocallyAnalyticDistributions:L4/spectral-matrix-reflection` — `Matrix.reflect_charpolyRev` (lemma).

Reflecting P_M at N gives χ_M, even when the actual degree of P_M is smaller than N.

**Hypotheses:** A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant.

**Proof outline:**

1. For a nontrivial coefficient ring, native reverse_charpoly and charpoly_natDegree_eq_dim identify P_M with reflection of χ_M at N. Apply native reflect_reflect.
2. In the zero ring both polynomials are equal by uniqueness. The rank bound is kept fixed rather than replaced by the degree of P_M.

**Prerequisites:** `mathlib:Matrix.charpolyRev`, `mathlib:Matrix.reverse_charpoly`, `mathlib:Matrix.charpoly_natDegree_eq_dim`, `mathlib:Polynomial.reverse`, `mathlib:Polynomial.reflect_reflect`.

**Acceptance:** The zero matrix of size N has P_M=1 and reflection at N equal to Y^N.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF 19–20, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete printed 432–436 freshly reread. Worker deduction making the finite triangular-matrix case and faithful descent precise using pinned matrix and resultant APIs. The source states the unrestricted finite step; this checkpoint proves only the explicitly stated triangularization cases. No analytic limiting assertion is inferred.

### Degree bound for the characteristic series

`LocallyAnalyticDistributions:L4/spectral-matrix-degree` — `Matrix.charpolyRev_natDegree_le` (lemma).

The degree of P_M is at most N.

**Hypotheses:** A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant.

**Proof outline:**

1. In the nontrivial case express P_M as the reflection of χ_M at N by the native reverse-characteristic identity.
2. Use native natDegree_reflect_le and the exact degree of χ_M. The zero-ring case has degree zero and satisfies the same bound.

**Prerequisites:** `mathlib:Matrix.reverse_charpoly`, `mathlib:Matrix.charpoly_natDegree_eq_dim`, `mathlib:Polynomial.reverse`, `mathlib:Polynomial.natDegree_reflect_le`.

**Acceptance:** Equality need not hold: zero eigenvalues lower the degree of P_M.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF 19–20, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete printed 432–436 freshly reread. Worker deduction making the finite triangular-matrix case and faithful descent precise using pinned matrix and resultant APIs. The source states the unrestricted finite step; this checkpoint proves only the explicitly stated triangularization cases. No analytic limiting assertion is inferred.

### Scalar extension of the characteristic series

`LocallyAnalyticDistributions:L4/spectral-matrix-coefficients` — `Matrix.charpolyRev_map` (lemma).

For every ring homomorphism f:A→S, P_(f(M)) is the coefficient image f(P_M). No injectivity or nontriviality hypothesis is required.

**Hypotheses:** A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant.

**Proof outline:**

1. Reflect both sides at the fixed rank N. Use the matrix reflection lemma, native reflect_map and native charpoly_map.
2. Reflect once more and use involutivity. This avoids an invalid assumption that coefficient maps preserve actual polynomial degree.

**Prerequisites:** `LocallyAnalyticDistributions:L4/spectral-matrix-reflection`, `mathlib:Polynomial.reflect_map`, `mathlib:Polynomial.reflect_reflect`, `mathlib:Matrix.charpoly_map`.

**Acceptance:** Reduction of nilpotent coefficients and specialization to the zero ring are admitted.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF 19–20, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete printed 432–436 freshly reread. Worker deduction making the finite triangular-matrix case and faithful descent precise using pinned matrix and resultant APIs. The source states the unrestricted finite step; this checkpoint proves only the explicitly stated triangularization cases. No analytic limiting assertion is inferred.

### Similarity invariance of the characteristic series

`LocallyAnalyticDistributions:L4/spectral-matrix-conjugation` — `Matrix.charpolyRev_units_conj` (lemma).

For a native matrix unit U, P_(UMU⁻¹)=P_M.

**Hypotheses:** A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant.

**Proof outline:**

1. Use native reverse_charpoly to reduce to the usual characteristic polynomial.
2. Apply native charpoly_units_conj, then return to the reverse characteristic polynomial.

**Prerequisites:** `mathlib:Matrix.reverse_charpoly`, `mathlib:Matrix.charpoly_units_conj`.

**Acceptance:** Only U must be invertible; M may be singular or nilpotent.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF 19–20, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete printed 432–436 freshly reread. Worker deduction making the finite triangular-matrix case and faithful descent precise using pinned matrix and resultant APIs. The source states the unrestricted finite step; this checkpoint proves only the explicitly stated triangularization cases. No analytic limiting assertion is inferred.

### Diagonal entries of a triangular product

`LocallyAnalyticDistributions:L4/spectral-triangular-diagonal-product` — `Matrix.IsUpperTriangular.mul_apply_diag` (lemma).

If M and L are upper triangular, then (ML)_(i,i)=M_(i,i)L_(i,i) for every i.

**Hypotheses:** A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant. I has a linear order, and both matrices are upper triangular for that order.

**Proof outline:**

1. Expand the product entry with native mul_apply.
2. Every summand indexed by j≠i vanishes: for j<i the M entry vanishes, and for i<j the L entry vanishes. The remaining summand is the stated product.

**Prerequisites:** `mathlib:Matrix.IsUpperTriangular`, `mathlib:Matrix.mul_apply`.

**Acceptance:** Both triangular hypotheses are required; arbitrary matrix products have off-diagonal contributions.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF 19–20, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete printed 432–436 freshly reread. Worker deduction making the finite triangular-matrix case and faithful descent precise using pinned matrix and resultant APIs. The source states the unrestricted finite step; this checkpoint proves only the explicitly stated triangularization cases. No analytic limiting assertion is inferred.

### Polynomial evaluation preserves upper triangularity

`LocallyAnalyticDistributions:L4/spectral-triangular-evaluation` — `Matrix.IsUpperTriangular.aeval` (lemma).

If M is upper triangular, then B(M) is upper triangular for every polynomial B over A.

**Hypotheses:** A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant. I has a linear order, and M is upper triangular.

**Proof outline:**

1. Use native polynomial induction. Constant scalar matrices are triangular by blockTriangular_algebraMap.
2. Sums preserve the vanishing entries. Each monomial is the product of a scalar matrix with a power of M; apply native BlockTriangular.pow and BlockTriangular.mul.

**Prerequisites:** `mathlib:Matrix.IsUpperTriangular`, `mathlib:Polynomial.induction_on`, `mathlib:Matrix.blockTriangular_algebraMap`, `mathlib:Matrix.BlockTriangular.pow`, `mathlib:Matrix.BlockTriangular.mul`.

**Acceptance:** Constant and zero polynomials are included; no condition on B(0) is imposed.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF 19–20, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete printed 432–436 freshly reread. Worker deduction making the finite triangular-matrix case and faithful descent precise using pinned matrix and resultant APIs. The source states the unrestricted finite step; this checkpoint proves only the explicitly stated triangularization cases. No analytic limiting assertion is inferred.

### The diagonal of a polynomial in a triangular matrix

`LocallyAnalyticDistributions:L4/spectral-triangular-evaluation-diagonal` — `Matrix.IsUpperTriangular.aeval_apply_diag` (lemma).

If M is upper triangular, then the i-th diagonal entry of B(M) is B(M_(i,i)).

**Hypotheses:** A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant. I has a linear order, and M is upper triangular.

**Proof outline:**

1. Induct on the exponent using triangular product diagonals and native triangular powers to prove that the diagonal of M^k is the k-th power of the diagonal.
2. Apply native polynomial induction. The scalar algebra-map entry formula treats constants; sums are entrywise; monomials use the product-diagonal lemma and the power calculation.

**Prerequisites:** `LocallyAnalyticDistributions:L4/spectral-triangular-diagonal-product`, `mathlib:Matrix.BlockTriangular.pow`, `mathlib:Matrix.blockTriangular_algebraMap`, `mathlib:Matrix.algebraMap_matrix_apply`, `mathlib:Polynomial.induction_on`.

**Acceptance:** Off-diagonal entries of B(M) need not vanish; only its diagonal is specified.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF 19–20, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete printed 432–436 freshly reread. Worker deduction making the finite triangular-matrix case and faithful descent precise using pinned matrix and resultant APIs. The source states the unrestricted finite step; this checkpoint proves only the explicitly stated triangularization cases. No analytic limiting assertion is inferred.

### Characteristic factors of a triangular matrix

`LocallyAnalyticDistributions:L4/spectral-triangular-characteristic` — `Matrix.charpolyRev_of_isUpperTriangular` (lemma).

If M is upper triangular, P_M(T)=∏_(i∈I)(1−M_(i,i)T).

**Hypotheses:** A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant. I has a linear order, and M is upper triangular.

**Proof outline:**

1. Unfold the native reverse characteristic polynomial once. The matrix 1−TM remains upper triangular over A[T], since its entries below the diagonal are zero.
2. Apply native det_of_isUpperTriangular and compute its diagonal entries. This direct determinant proof does not need roots or a domain hypothesis.

**Prerequisites:** `mathlib:Matrix.charpolyRev`, `mathlib:Matrix.IsUpperTriangular`, `mathlib:Matrix.det_of_isUpperTriangular`.

**Acceptance:** The empty product is one; repeated and zero diagonal entries keep their full multiplicities.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF 19–20, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete printed 432–436 freshly reread. Worker deduction making the finite triangular-matrix case and faithful descent precise using pinned matrix and resultant APIs. The source states the unrestricted finite step; this checkpoint proves only the explicitly stated triangularization cases. No analytic limiting assertion is inferred.

### Finite spectral mapping for triangular matrices

`LocallyAnalyticDistributions:L4/spectral-triangular-comparison` — `TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant_charpolyRev_of_isUpperTriangular` (comparison).

If M is upper triangular and degree(B)≤m, then D_(N,m)(B,P_M)=P_(B(M)).

**Hypotheses:** A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant. I has a linear order, M is upper triangular, and m bounds the degree of B.

**Proof outline:**

1. Write P_M as its product of N diagonal linear factors. Apply the existing finite spectral split-product law, allowing repetitions and zero diagonal entries.
2. Polynomial evaluation remains triangular and evaluates each diagonal entry by B. Apply the triangular characteristic-factor lemma to B(M) and identify the products.
3. The rank is N throughout; B(0) need not vanish because the finite matrix rank is specified.

**Prerequisites:** `LocallyAnalyticDistributions:L4/spectral-triangular-characteristic`, `LocallyAnalyticDistributions:L4/spectral-triangular-evaluation`, `LocallyAnalyticDistributions:L4/spectral-triangular-evaluation-diagonal`, `LocallyAnalyticDistributions:L4/spectral-split-factors`.

**Tests:**

- `CharacteristicTests.empty_matrix` (degenerate): Over the integers, the empty matrix with B=1 gives D_(0,0)(1,P_M)=1.
- `CharacteristicTests.constant_operator` (non-example): Over the integers, for the zero matrix of size two and B=1, D_(2,0)(1,P_M)=(1−T)^2. Replacing the rank bound by degree(P_M)=0 would incorrectly give one.
- `CharacteristicTests.jordan_transform` (computation): Over ZMod8, let J have rows (2,1) and (0,2), and let B(Y)=Y+Y^2. Then D_(2,2)(B,P_J)=1+4T+4T^2.
- `CharacteristicTests.jordan_aeval` (computation): For the same J and B over ZMod8, B(J) has rows (6,5) and (0,6). Its nonzero off-diagonal entry is retained by the native polynomial calculus.

**Acceptance:** This is a finite polynomial instance of the operator step in A3.9. It does not prove existence of a triangularizing basis for an arbitrary matrix.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF 19–20, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete printed 432–436 freshly reread. Worker deduction making the finite triangular-matrix case and faithful descent precise using pinned matrix and resultant APIs. The source states the unrestricted finite step; this checkpoint proves only the explicitly stated triangularization cases. No analytic limiting assertion is inferred.

### Similarity commutes with polynomial calculus

`LocallyAnalyticDistributions:L4/spectral-evaluation-conjugation` — `Matrix.aeval_units_conj` (lemma).

For a matrix unit U and every polynomial B, B(UMU⁻¹)=UB(M)U⁻¹.

**Hypotheses:** A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant.

**Proof outline:**

1. Prove the power identity by induction, cancelling adjacent U⁻¹U. The exponent-zero case uses UU⁻¹=1.
2. Apply native polynomial induction. Scalar matrices are central, expressed through the scalar action on the identity; distribute conjugation over sums and use the power identity on monomials.

**Prerequisites:** `mathlib:Polynomial.induction_on`, `mathlib:Algebra.algebraMap_eq_smul_one`.

**Acceptance:** No characteristic, invertibility of M, degree or constant-term restriction is imposed.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF 19–20, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete printed 432–436 freshly reread. Worker deduction making the finite triangular-matrix case and faithful descent precise using pinned matrix and resultant APIs. The source states the unrestricted finite step; this checkpoint proves only the explicitly stated triangularization cases. No analytic limiting assertion is inferred.

### Scalar extension of matrix polynomial calculus

`LocallyAnalyticDistributions:L4/spectral-evaluation-coefficients` — `Matrix.aeval_map` (lemma).

For every ring homomorphism f:A→S, entrywise mapping of B(M) gives f(B)(f(M)).

**Hypotheses:** A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant.

**Proof outline:**

1. Use the native ring homomorphism mapMatrix. The scalar-entry formula proves that the two coefficient algebra maps commute with f.
2. Apply native map_aeval_eq_aeval_map to that commuting square. No new evaluation or matrix-map carrier is defined.

**Prerequisites:** `mathlib:RingHom.mapMatrix`, `mathlib:Matrix.algebraMap_matrix_apply`, `mathlib:Polynomial.map_aeval_eq_aeval_map`.

**Acceptance:** Noninjective coefficient maps are allowed; both the matrix and polynomial coefficients must be mapped.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF 19–20, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete printed 432–436 freshly reread. Worker deduction making the finite triangular-matrix case and faithful descent precise using pinned matrix and resultant APIs. The source states the unrestricted finite step; this checkpoint proves only the explicitly stated triangularization cases. No analytic limiting assertion is inferred.

### Spectral mapping from a triangularizing similarity

`LocallyAnalyticDistributions:L4/spectral-similarity-comparison` — `TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant_charpolyRev_of_conj` (comparison).

Suppose U is a matrix unit and UMU⁻¹ is upper triangular. For degree(B)≤m, D_(N,m)(B,P_M)=P_(B(M)).

**Hypotheses:** A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant. I has a linear order; a matrix unit U is given such that UMU⁻¹ is upper triangular; degree(B)≤m.

**Proof outline:**

1. Apply the triangular comparison to UMU⁻¹.
2. Use similarity invariance of the characteristic series on the input, conjugation compatibility of polynomial calculus on the output, and characteristic-series similarity invariance again.

**Prerequisites:** `LocallyAnalyticDistributions:L4/spectral-triangular-comparison`, `LocallyAnalyticDistributions:L4/spectral-matrix-conjugation`, `LocallyAnalyticDistributions:L4/spectral-evaluation-conjugation`.

**Acceptance:** A triangularizing unit is an explicit hypothesis, not hidden in a proof step.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF 19–20, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete printed 432–436 freshly reread. Worker deduction making the finite triangular-matrix case and faithful descent precise using pinned matrix and resultant APIs. The source states the unrestricted finite step; this checkpoint proves only the explicitly stated triangularization cases. No analytic limiting assertion is inferred.

### Faithful descent of finite spectral mapping

`LocallyAnalyticDistributions:L4/spectral-faithful-comparison` — `TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant_charpolyRev_of_faithful` (comparison).

Let f:A→S be injective and U a matrix unit over S such that U f(M) U⁻¹ is upper triangular. If degree(B)≤m, then D_(N,m)(B,P_M)=P_(B(M)) over A.

**Hypotheses:** A and S are arbitrary commutative rings, including the zero ring and rings with nilpotents. I is a finite index type and N is its cardinality. Matrices are native square matrices on I. Write χ_M for the native characteristic polynomial and P_M for native Matrix.charpolyRev, namely det(1−TM). The polynomial functional calculus B(M) is native algebra evaluation; D_(N,m) is the already planned bounded spectral resultant. I has a linear order; the coefficient map f is injective; a triangularizing matrix unit U over S is supplied; degree(B)≤m.

**Proof outline:**

1. Apply the injectivity of the induced polynomial coefficient map.
2. The existing spectral scalar-extension law, the characteristic-series coefficient law and the matrix-calculus coefficient law identify the two images with the corresponding expressions for f(M) and f(B).
3. The mapped polynomial still has degree at most m by native natDegree_map_le. Apply the similarity comparison over S. No existence of f or U is asserted.

**Prerequisites:** `LocallyAnalyticDistributions:L4/spectral-similarity-comparison`, `LocallyAnalyticDistributions:L4/spectral-scalar-extension`, `LocallyAnalyticDistributions:L4/spectral-matrix-coefficients`, `LocallyAnalyticDistributions:L4/spectral-evaluation-coefficients`, `mathlib:Polynomial.map_injective`, `mathlib:Polynomial.natDegree_map_le`.

**Acceptance:** Injectivity is essential for this descent argument. Specializing only to residue fields cannot detect nilpotent coefficient errors.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF 19–20, finite definition of D and the finite-operator step in the proof of Theorem A3.9; complete printed 432–436 freshly reread. Worker deduction making the finite triangular-matrix case and faithful descent precise using pinned matrix and resultant APIs. The source states the unrestricted finite step; this checkpoint proves only the explicitly stated triangularization cases. No analytic limiting assertion is inferred.

### Validation and exact continuation boundary

All 124 preceding whole node objects, 151 baseline records, both findings,
five requests, six planets and all prior suggested Lean bytes are preserved.
The five reviewed AUDIT25 rows, accepted RS16 boundaries and prior handoff were
read. Binding rules, expansion protocol, two upstream model documents and all
28 touching link files match the preceding complete readings. This checkpoint
creates no new mathematical carrier, construction, planet or source finding.

The complete published Coleman printed432–436/PDF16–20 was freshly reread,
including the full A3.9 proof and A4.1 application. The published PDF at
https://kundudeb.github.io/1997_Coleman.pdf has
SHA25632ff34f60fc2ef4608506daa169c3cc61e07520f019d63928e86b093a16b1973.
The triangular-matrix adapters are worker deductions making one finite part of
the source precise. Twenty exact indexed native declarations and their ambient
hypotheses were read, adding twenty baseline records. Native reverse
characteristic polynomials, triangular matrices, algebra evaluation and bounded
resultants are reused.

The bounded upstream title screen found zero open charpoly PRs and five open
triangular PRs. Mathlib PR39834 at head40f737f29fcf7fd0b4ec5706db1aad8bcbc8f078
uses native flags and block-triangular matrices for field triangularization;
PR39837 at head8578d0ce997a6020fac0188a45a716768166098a specializes to inner
products. Their bodies and relevant patches were read; neither supplies a
pinned theorem here. The linked prerequisite PR39829 was screened. A targeted
Zulip search found no exact spectral-comparison discussion. This is a bounded
screen, not a global absence claim. No upstream code was copied and no new
triangularizability predicate is introduced. Needed field triangularization
must be built in that API shape without waiting for an upstream merge.

Indexed blueprint: zero errors and warnings. Four-file intake: zero problems.
Versioned errata, whole-predecessor preservation, reader/signature/test parity
and scope checks pass. The graph has 137 reachable nodes,
546 acyclic edges and 166 native baseline leaves.
The only stage leaf remains the preserved AdicSpacesPartII:R3 generality request.

The complete suggested file compiles with zero errors and 276 warnings, all
proof placeholders. Its recursive source audit covers 2,203 pinned Mathlib
modules and four pinned TauCeti modules. All four TauCeti modules were rebuilt
from pinned sources with zero errors and warnings. There are no proposed
supplier imports. All 90 typed examples elaborate, including four new controls.

A separate complete native proof file contains two constructions and 38 proved
lemmas, with zero errors, warnings or placeholders. Twenty-one lemmas and the
two constructions reproduce the preceding finite spectral algebra proof; the
seventeen additions prove all thirteen new statements and four tests. Its
recursive audit covers 2,794 pinned Mathlib modules and the same four native
TauCeti modules. The tests include an empty matrix, the fixed-rank B=1 zero
matrix, and the nonzero off-diagonal Jordan block over ZMod8, for which
B(Y)=Y+Y² gives rows (6,5),(0,6) and characteristic series1+4T+4T².
These checks do not turn the public blueprint into an implementation claim.

Before publication, the PMIA249→265 supplier refresh was matched byte-for-byte
to own merged PR3252. Registry7,575→7,576 adds DirichletPadicLFunctions/E10,
a consumer record of the previously read PMIA/E13 smoothing-denominator issue;
the full new record and generated register delta were read. All7,575 prior
records are unchanged. No LAD finding, hypothesis or supplier boundary changed.


The finite characteristic comparison is now decomposed for upper triangular matrices, matrices with a supplied triangularizing similarity, and matrices admitting such a similarity after a supplied injective coefficient map. Prove the unrestricted comparison for every finite matrix over an arbitrary commutative ring. One route is a universal matrix over an integral polynomial ring, an injective map to an algebraic closure of its fraction field, triangularization there, faithful descent to the universal ring, and specialization to every target ring; each universal polynomial identity and specialization step must be justified. Do not assert that an arbitrary ring embeds into a field, that a split characteristic polynomial over a ring implies triangularizability, or that checking residue fields detects nilpotents. Build any needed triangularization API here in the shape of the cited upstream work, without waiting for it. The entire-input limit, coefficient estimates, A3.8(11), A3.9 and the preserved topology, tensor and distribution-family gaps remain.


## Universal finite characteristic comparison

This continuation supplies a proof plan for the finite identity
D_(N,m)(B,P_M)=P_(B(M)) for every matrix over every commutative coefficient ring.
The rank parameter N is the cardinality of the matrix index set. It is retained
under specialization, even when the characteristic series has smaller degree.
There is no B(0)=0 assumption in this fixed-rank theorem. Such an assumption
still controls zero-root padding and the infinite compact-operator theorem.

Two independent sets of variables make the universal argument valid for all
inputs. C_m is the integer polynomial ring on b₀,…,b_m; U_(N,m) is the polynomial
ring over C_m on the N² matrix entries. Both are native multivariate polynomial
rings. The matrix G is native Matrix.mvPolynomialX; the polynomial B_(N,m) has
coefficients b_i. A nested evaluation homomorphism sends the entries to M and
the coefficients to those of B. The map need not be injective.

A different specialization sends G to the rational diagonal matrix with entries
0,…,N−1 and all b_i to zero. Its characteristic roots are distinct, so its
characteristic discriminant is nonzero. Monic discriminant base change detects
a nonzero discriminant in the universal ring. This does not assert separability
in that ring: a nonzero discriminant over a domain need not be a unit. The
pinned Tau Ceti criterion gives separability after the universal ring is
embedded into a field. In the algebraic closure of its fraction field, the
characteristic polynomial splits with distinct roots. Choose their nonzero
eigenvectors, use native independence and dimension to obtain a basis, and
write the change-of-basis matrices as an actual unit and its inverse.

The preceding faithful triangular comparison applies to this diagonalization.
It gives the identity over U_(N,m), and arbitrary coefficient specialization
then gives the desired theorem over the target ring. This argument preserves
nilpotents; no test only on residue fields is used. General matrices with
repeated roots are not claimed to have an eigenbasis. The eigenbasis is needed
only at the generic field stage. For empty matrices the characteristic polynomial
is1, the root set and basis are empty, and all the same interfaces apply.

The algebraic closure, discriminant, generic matrix, root set, basis and
polynomial functional calculus all use their native types. No replacement
triangularizability or diagonalizability predicate is introduced. The local
notations in the suggested file abbreviate types only.

### Universal polynomial coefficients

`LocallyAnalyticDistributions:L4/spectral-universal-polynomial` — `TauCeti.NonarchimedeanFredholm.spectralUniversalPolynomial` (construction).

Define B_(N,m)(Y)=Σ_(i=0)^m b_iY^i in U_(N,m)[Y], using coefficient inclusion from C_m and native Polynomial.ofFn of length m+1.

**Hypotheses:** For natural numbers N,m put C_m=ℤ[b₀,…,b_m] and U_(N,m)=C_m[xᵢⱼ: i,j∈Fin N], both native multivariate polynomial rings. Write G for native Matrix.mvPolynomialX over C_m, so Gᵢⱼ=xᵢⱼ. Coefficient variables b_i and matrix-entry variables xᵢⱼ are distinct. P_M(T)=det(1−TM) is native Matrix.charpolyRev. D_(N,m) is the existing bounded spectral resultant, with matrix rank N retained even if the actual degree of P_M drops.

**Proof outline:**

1. Use the native coefficient-vector constructor on the vector whose ith value is the constant-in-matrix-variables copy of b_i. This is a polynomial in Y over U_(N,m), not a new polynomial type.
2. The low and high coefficient formulas are precisely the two native ofFn coefficient lemmas. These formulas pin the constant coefficient, zero-dimensional matrix case and the separation of the two families of variables.

**Prerequisites:** `mathlib:Polynomial.ofFn`, `mathlib:Polynomial.ofFn_coeff_eq_val_of_lt`, `mathlib:Polynomial.ofFn_coeff_eq_zero_of_ge`.

**Uses:**

- Coleman A3.9 finite step: Makes every coefficient of the functional-calculus polynomial independent of the matrix entries before universal descent.
- spectral-specialization-polynomial: The coefficient formula recovers every bounded-degree target polynomial under specialization.

**API:**

- `spectralUniversalPolynomial_def` (data): The polynomial is native ofFn of length m+1 with coefficient vector i↦b_i included into U_(N,m).
- `spectralUniversalPolynomial_coeff` (simp): Its coefficient at i≤m is the included variable b_i.
- `spectralUniversalPolynomial_natDegree_le` (characterisation): Its natural degree is at most m; promoted as spectral-universal-degree.

**Tests:**

- `UniversalTests.constant` (computation): For N=2,m=0 the universal polynomial is the constant polynomial b₀.
- `UniversalTests.high_coefficient` (degenerate): For N=2,m=1 its coefficient at2 is zero.
- `UniversalTests.empty_matrix` (compatibility): For N=0,m=1 its coefficient at1 is still b₁, included into the empty-entry polynomial ring.

**Acceptance:** All mathematical statuses remain unchecked; specialization retains nilpotent coefficients and the explicit rank.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### Degree bound for the universal polynomial

`LocallyAnalyticDistributions:L4/spectral-universal-degree` — `TauCeti.NonarchimedeanFredholm.spectralUniversalPolynomial_natDegree_le` (lemma).

The natural degree of B_(N,m) is at most m, including m=0 and N=0.

**Hypotheses:** For natural numbers N,m put C_m=ℤ[b₀,…,b_m] and U_(N,m)=C_m[xᵢⱼ: i,j∈Fin N], both native multivariate polynomial rings. Write G for native Matrix.mvPolynomialX over C_m, so Gᵢⱼ=xᵢⱼ. Coefficient variables b_i and matrix-entry variables xᵢⱼ are distinct. P_M(T)=det(1−TM) is native Matrix.charpolyRev. D_(N,m) is the existing bounded spectral resultant, with matrix rank N retained even if the actual degree of P_M drops.

**Proof outline:**

1. Apply the native ofFn natural-degree bound at the positive length m+1 to the coefficient vector defining B_(N,m).
2. Convert natural degree less than m+1 to natural degree at most m. No degree equality or nonvanishing of the top specialized coefficient is needed.

**Prerequisites:** `LocallyAnalyticDistributions:L4/spectral-universal-polynomial`, `mathlib:Polynomial.ofFn_natDegree_lt`.

**Acceptance:** All mathematical statuses remain unchecked; specialization retains nilpotent coefficients and the explicit rank.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### Simultaneous coefficient and matrix specialization

`LocallyAnalyticDistributions:L4/spectral-specialization` — `TauCeti.NonarchimedeanFredholm.spectralSpecialization` (construction).

For a commutative ring R, a matrix M on Fin N and any B∈R[Y], define the ring homomorphism σ_(m,M,B):U_(N,m)→R by b_i↦coeff_i(B), xᵢⱼ↦Mᵢⱼ and the canonical integer map. This map is defined without a degree bound on B.

**Hypotheses:** For natural numbers N,m put C_m=ℤ[b₀,…,b_m] and U_(N,m)=C_m[xᵢⱼ: i,j∈Fin N], both native multivariate polynomial rings. Write G for native Matrix.mvPolynomialX over C_m, so Gᵢⱼ=xᵢⱼ. Coefficient variables b_i and matrix-entry variables xᵢⱼ are distinct. P_M(T)=det(1−TM) is native Matrix.charpolyRev. D_(N,m) is the existing bounded spectral resultant, with matrix rank N retained even if the actual degree of P_M drops. R and S are arbitrary commutative rings, with no nontriviality, characteristic or reducedness hypothesis.

**Proof outline:**

1. First use native eval₂Hom to send C_m to R by the integer map and the first m+1 coefficients of B.
2. Use eval₂Hom again, with that homomorphism on constants and the matrix entries as the outer variables. The native C and X formulas give both generator equations.
3. For a ring map f:R→S, apply native comp_eval₂Hom twice. Integer maps agree and polynomial coefficients map entrywise, so f composed with σ_(m,M,B) is σ_(m,f(M),f(B)). This statement permits noninjective maps.

**Prerequisites:** `mathlib:MvPolynomial.eval₂Hom`, `mathlib:MvPolynomial.eval₂Hom_C`, `mathlib:MvPolynomial.eval₂Hom_X'`, `mathlib:MvPolynomial.comp_eval₂Hom`.

**Uses:**

- Coleman A3.9 finite step: Specializes the universal identity to all matrices and all bounded-degree polynomials over the target ring, preserving nilpotents.
- spectral-generic-discriminant: Supplies the rational diagonal specialization that detects a nonzero universal discriminant.

**API:**

- `spectralSpecialization_def` (data): The homomorphism is the nested native eval₂Hom with integer coefficients, the first m+1 coefficients of B, and the entries of M.
- `spectralSpecialization_entry` (simp): The image of xᵢⱼ is Mᵢⱼ.
- `spectralSpecialization_coefficient` (simp): The image of the included b_i is coeff_i(B) for i≤m.
- `spectralSpecialization_comp` (functoriality): Composition with f:R→S equals specialization at the entrywise mapped matrix and coefficientwise mapped polynomial; identity and successive composition follow.
- `spectralSpecialization_matrix` (compatibility): Entrywise specialization of native G is M; promoted.
- `spectralSpecialization_polynomial` (compatibility): If natural degree(B)≤m, specialization of B_(N,m) is B; promoted.

**Tests:**

- `SpecializationTests.entry` (computation): Over ZMod8, with M=[[2,1],[2,2]], m=1 and B=3+5Y, σ(x₀₁)=1.
- `SpecializationTests.coefficient` (computation): For the same inputs, σ(b₁)=5, distinguishing polynomial coefficients from matrix entries.
- `SpecializationTests.empty` (degenerate): For the empty integer matrix, m=1 and B=Y+1, specialization of B_(0,1) is Y+1.
- `SpecializationTests.noninjective` (non-example): For the zero 1×1 matrix over ZMod8, m=0 and B=0, σ(8)=0. Specialization is not assumed injective.

**Acceptance:** All mathematical statuses remain unchecked; specialization retains nilpotent coefficients and the explicit rank.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### Specialization of the native generic matrix

`LocallyAnalyticDistributions:L4/spectral-specialization-matrix` — `TauCeti.NonarchimedeanFredholm.spectralSpecialization_matrix` (lemma).

Entrywise application of σ_(m,M,B) sends G to M for every commutative ring R, every matrix M and every polynomial B.

**Hypotheses:** For natural numbers N,m put C_m=ℤ[b₀,…,b_m] and U_(N,m)=C_m[xᵢⱼ: i,j∈Fin N], both native multivariate polynomial rings. Write G for native Matrix.mvPolynomialX over C_m, so Gᵢⱼ=xᵢⱼ. Coefficient variables b_i and matrix-entry variables xᵢⱼ are distinct. P_M(T)=det(1−TM) is native Matrix.charpolyRev. D_(N,m) is the existing bounded spectral resultant, with matrix rank N retained even if the actual degree of P_M drops.

**Proof outline:**

1. Unfold only the displayed specialization homomorphism. Apply native Matrix.mvPolynomialX_map_eval₂ with the inner coefficient homomorphism.
2. The result is entrywise equality, with no degree hypothesis on B and no injectivity condition.

**Prerequisites:** `LocallyAnalyticDistributions:L4/spectral-specialization`, `mathlib:Matrix.mvPolynomialX`, `mathlib:Matrix.mvPolynomialX_map_eval₂`.

**Acceptance:** All mathematical statuses remain unchecked; specialization retains nilpotent coefficients and the explicit rank.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### Recovery of a bounded polynomial

`LocallyAnalyticDistributions:L4/spectral-specialization-polynomial` — `TauCeti.NonarchimedeanFredholm.spectralSpecialization_polynomial` (lemma).

If B∈R[Y] has natural degree at most m, then coefficientwise application of σ_(m,M,B) to B_(N,m) is B.

**Hypotheses:** For natural numbers N,m put C_m=ℤ[b₀,…,b_m] and U_(N,m)=C_m[xᵢⱼ: i,j∈Fin N], both native multivariate polynomial rings. Write G for native Matrix.mvPolynomialX over C_m, so Gᵢⱼ=xᵢⱼ. Coefficient variables b_i and matrix-entry variables xᵢⱼ are distinct. P_M(T)=det(1−TM) is native Matrix.charpolyRev. D_(N,m) is the existing bounded spectral resultant, with matrix rank N retained even if the actual degree of P_M drops.

**Proof outline:**

1. Compare coefficients. For i<m+1, the native ofFn formula and the specialization equation for b_i give coeff_i(B).
2. For i≥m+1, the native high coefficient formula gives zero; the degree bound on B makes its coefficient zero too. This proves equality even when coefficients vanish under a further ring map.
3. The condition controls only polynomial recovery. The specialization homomorphism itself is defined for all B.

**Prerequisites:** `LocallyAnalyticDistributions:L4/spectral-universal-polynomial`, `LocallyAnalyticDistributions:L4/spectral-specialization`, `mathlib:Polynomial.ofFn_coeff_eq_val_of_lt`, `mathlib:Polynomial.ofFn_coeff_eq_zero_of_ge`.

**Acceptance:** All mathematical statuses remain unchecked; specialization retains nilpotent coefficients and the explicit rank.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### Nonzero discriminant of the generic matrix

`LocallyAnalyticDistributions:L4/spectral-generic-discriminant` — `TauCeti.NonarchimedeanFredholm.spectralGeneric_discr_ne_zero` (lemma).

The discriminant of the characteristic polynomial of G over U_(N,m) is nonzero.

**Hypotheses:** For natural numbers N,m put C_m=ℤ[b₀,…,b_m] and U_(N,m)=C_m[xᵢⱼ: i,j∈Fin N], both native multivariate polynomial rings. Write G for native Matrix.mvPolynomialX over C_m, so Gᵢⱼ=xᵢⱼ. Coefficient variables b_i and matrix-entry variables xᵢⱼ are distinct. P_M(T)=det(1−TM) is native Matrix.charpolyRev. D_(N,m) is the existing bounded spectral resultant, with matrix rank N retained even if the actual degree of P_M drops.

**Proof outline:**

1. Specialize into ℚ by taking B=0 and the diagonal matrix with ith entry the integer i. Native matrix specialization, charpoly_map and monic discriminant base change identify the image of the generic discriminant with that diagonal matrix’s characteristic discriminant.
2. The diagonal characteristic polynomial is the product of Y−i for i∈Fin N. The map i↦(i:ℚ) is injective. Native separable_prod_X_sub_C_iff makes this product separable, and the pinned field discriminant criterion makes its discriminant nonzero.
3. If the original discriminant were zero, every ring homomorphism would send it to zero, contradicting this rational specialization. At N=0 the product is1, separable with discriminant1, so the same argument covers the empty matrix.

**Prerequisites:** `LocallyAnalyticDistributions:L4/spectral-specialization-matrix`, `mathlib:Matrix.charpoly_map`, `mathlib:Matrix.charpoly_monic`, `mathlib:Matrix.charpoly_diagonal`, `mathlib:Polynomial.separable_prod_X_sub_C_iff`, `tauceti:Polynomial.Monic.discr_map`, `tauceti:Polynomial.Monic.discr_ne_zero_iff`.

**Acceptance:** The statement is nonvanishing in the universal integral domain. It does not assert ring-level separability over U_(N,m): nonzero discriminant need not be a unit.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### Generic separability in a faithful field extension

`LocallyAnalyticDistributions:L4/spectral-generic-separability` — `TauCeti.NonarchimedeanFredholm.spectralGeneric_separable` (lemma).

For a field K and an injective ring homomorphism f:U_(N,m)→K, the characteristic polynomial of f(G) is separable over K.

**Hypotheses:** For natural numbers N,m put C_m=ℤ[b₀,…,b_m] and U_(N,m)=C_m[xᵢⱼ: i,j∈Fin N], both native multivariate polynomial rings. Write G for native Matrix.mvPolynomialX over C_m, so Gᵢⱼ=xᵢⱼ. Coefficient variables b_i and matrix-entry variables xᵢⱼ are distinct. P_M(T)=det(1−TM) is native Matrix.charpolyRev. D_(N,m) is the existing bounded spectral resultant, with matrix rank N retained even if the actual degree of P_M drops. K is a field and the displayed ring homomorphism f from the universal ring is injective.

**Proof outline:**

1. The previous node gives a nonzero discriminant in U_(N,m), hence a nonzero image under the specified injective map f.
2. Apply the pinned monic separable_map_iff_map_discr_ne_zero to the monic characteristic polynomial of G, then use native charpoly_map to identify its mapped polynomial with the characteristic polynomial of f(G).

**Prerequisites:** `LocallyAnalyticDistributions:L4/spectral-generic-discriminant`, `mathlib:Matrix.charpoly_monic`, `mathlib:Matrix.charpoly_map`, `tauceti:Polynomial.Monic.separable_map_iff_map_discr_ne_zero`.

**Acceptance:** There is no conclusion about separability after arbitrary specialization; repeated characteristic roots in target rings are allowed.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### Numbering distinct characteristic roots

`LocallyAnalyticDistributions:L4/spectral-distinct-root-enumeration` — `Matrix.exists_injective_roots_charpoly` (lemma).

Let M be an N×N matrix over a field K. If its characteristic polynomial is separable and splits over K, there is an injective function r:Fin N→K whose values are roots of that polynomial.

**Hypotheses:** K is a field; M is a square matrix indexed by Fin N; its native characteristic polynomial is separable and splits in K.

**Proof outline:**

1. Apply the native cardinality theorem for the root set to the separable characteristic polynomial and its splitting over K. Native charpoly_natDegree_eq_dim identifies its degree with N.
2. Choose a finite-set equivalence from Fin N to the native root set; composing with subtype inclusion gives the injective function. Native mem_rootSet identifies each selected value as a root, using the nonzero monic characteristic polynomial.
3. For N=0 the root set is empty and the unique empty function works; no nonempty-index assumption is introduced.

**Prerequisites:** `mathlib:Polynomial.card_rootSet_eq_natDegree`, `mathlib:Polynomial.mem_rootSet`, `mathlib:Matrix.charpoly_natDegree_eq_dim`, `mathlib:Matrix.charpoly_monic`.

**Acceptance:** Both splitting and separability are explicit. No claim is made for a nonsplit polynomial or a repeated root.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### An eigenbasis from distinct characteristic roots

`LocallyAnalyticDistributions:L4/spectral-eigenbasis` — `Matrix.exists_eigenbasis_of_injective_roots` (lemma).

For an N×N matrix M over a field K and an injective function r:Fin N→K whose values are characteristic roots, there exists a native basis b of K^N indexed by Fin N satisfying M b_i=r_i b_i for every i.

**Hypotheses:** K is a field; r is injective and all its N values are characteristic roots of M.

**Proof outline:**

1. Regard M as the native endomorphism mulVecLin. Native charpoly_mulVecLin and hasEigenvalue_iff_isRoot_charpoly turn every specified root into an eigenvalue.
2. Choose a nonzero eigenvector for each eigenvalue using HasEigenvalue.exists_hasEigenvector. Native eigenvectors_linearIndependent′ proves independence because r is injective.
3. The native finrank of K^N is N. Apply basisOfLinearIndependentOfCardEqFinrank′, whose primed version covers the empty-index case; its vectors are exactly the chosen ones. Native HasEigenvector.apply_eq_smul gives the displayed equations.

**Prerequisites:** `mathlib:Matrix.charpoly_mulVecLin`, `mathlib:Module.End.hasEigenvalue_iff_isRoot_charpoly`, `mathlib:Module.End.HasEigenvalue.exists_hasEigenvector`, `mathlib:Module.End.eigenvectors_linearIndependent'`, `mathlib:basisOfLinearIndependentOfCardEqFinrank'`, `mathlib:Module.finrank_fintype_fun_eq_card`, `mathlib:Module.End.HasEigenvector.apply_eq_smul`.

**Acceptance:** The conclusion uses the native basis type and is existential. No new eigenbasis carrier or generic diagonalizability predicate is defined.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### Diagonal similarity from an eigenbasis

`LocallyAnalyticDistributions:L4/spectral-eigenbasis-conjugation` — `Matrix.exists_units_conj_diagonal_of_eigenbasis` (lemma).

Given a native basis b of K^N and scalars r_i with M b_i=r_i b_i, there is a matrix unit U such that UMU⁻¹ is the diagonal matrix with entries r_i.

**Hypotheses:** K is a field; b is a native basis of K^N indexed by Fin N; the displayed eigenvector equations are given. Distinctness is not required for this basis-change lemma.

**Proof outline:**

1. Let E be the standard basis and set U=b.toMatrix(E), with inverse E.toMatrix(b). The two native basis change products equal1, giving a unit rather than merely a nonzero determinant.
2. The native basis-change formula identifies UMU⁻¹ with the matrix of mulVecLin M in b. Evaluate that matrix on basis vectors; the supplied eigenvector equations make column i equal r_i times the ith standard vector, so the matrix is diagonal.
3. The direction of conjugation is fixed by choosing coordinates from E into b for U. The empty basis gives the empty matrix unit.

**Prerequisites:** `mathlib:Module.Basis.toMatrix_mul_toMatrix_flip`, `mathlib:basis_toMatrix_mul_linearMap_toMatrix_mul_basis_toMatrix`.

**Acceptance:** The unit is U=b.toMatrix(E), not the matrix with b as columns; interchanging them reverses the conjugation formula.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### The universal finite spectral identity

`LocallyAnalyticDistributions:L4/spectral-universal-comparison` — `TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant_generic` (lemma).

Over U_(N,m), D_(N,m)(B_(N,m),P_G)=P_(B_(N,m)(G)).

**Hypotheses:** For natural numbers N,m put C_m=ℤ[b₀,…,b_m] and U_(N,m)=C_m[xᵢⱼ: i,j∈Fin N], both native multivariate polynomial rings. Write G for native Matrix.mvPolynomialX over C_m, so Gᵢⱼ=xᵢⱼ. Coefficient variables b_i and matrix-entry variables xᵢⱼ are distinct. P_M(T)=det(1−TM) is native Matrix.charpolyRev. D_(N,m) is the existing bounded spectral resultant, with matrix rank N retained even if the actual degree of P_M drops.

**Proof outline:**

1. U_(N,m) is an integral domain by the native integer and multivariate-polynomial instances. Use the native fraction field and its algebraic closure K. Compose the injective localization map with the field embedding into K to obtain an injective ring map f:U_(N,m)→K.
2. The generic separability lemma and the native algebraic-closure splitting property provide the hypotheses of the distinct-root numbering lemma for f(G). The eigenbasis lemma and its conjugation lemma then provide a unit diagonalizing f(G). A diagonal matrix is upper triangular by its entry formula.
3. Apply the retained spectral-faithful-comparison node to G, B_(N,m), f and this diagonalizing unit, using the universal degree bound. This descends the equality to the universal domain, with the explicit rank N.
4. Only the universal domain is embedded into a field. The final target ring does not occur in this step; no equality is inferred merely by testing its residue fields.

**Prerequisites:** `LocallyAnalyticDistributions:L4/spectral-universal-degree`, `LocallyAnalyticDistributions:L4/spectral-generic-separability`, `LocallyAnalyticDistributions:L4/spectral-distinct-root-enumeration`, `LocallyAnalyticDistributions:L4/spectral-eigenbasis`, `LocallyAnalyticDistributions:L4/spectral-eigenbasis-conjugation`, `LocallyAnalyticDistributions:L4/spectral-faithful-comparison`, `mathlib:FractionRing`, `mathlib:IsFractionRing.injective`, `mathlib:AlgebraicClosure`, `mathlib:RingHom.injective`, `mathlib:IsAlgClosed`.

**Acceptance:** All mathematical statuses remain unchecked; specialization retains nilpotent coefficients and the explicit rank.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### Finite spectral mapping over any coefficient ring

`LocallyAnalyticDistributions:L4/spectral-finite-specialization` — `TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant_charpolyRev_fin` (lemma).

For every commutative ring R, every N×N matrix M, and every B∈R[Y] with natural degree at most m, D_(N,m)(B,P_M)=P_(B(M)).

**Hypotheses:** R is any commutative ring; M is indexed by Fin N; B has natural degree at most m. No condition B(0)=0 is imposed at fixed finite rank.

**Proof outline:**

1. Apply coefficient mapping by σ_(m,M,B) to the universal comparison equality.
2. On the left, the retained fixed-bound scalar-extension law for D commutes with this map; native-matrix specialization, universal-polynomial recovery and the retained characteristic-series scalar-extension lemma identify the input as B and P_M.
3. On the right, retained polynomial-calculus scalar extension and characteristic-series scalar extension identify the image with P_(B(M)). The specialization homomorphism is permitted to have a kernel, so the argument applies to zero divisors, nilpotents and the zero ring.

**Prerequisites:** `LocallyAnalyticDistributions:L4/spectral-universal-comparison`, `LocallyAnalyticDistributions:L4/spectral-specialization-matrix`, `LocallyAnalyticDistributions:L4/spectral-specialization-polynomial`, `LocallyAnalyticDistributions:L4/spectral-scalar-extension`, `LocallyAnalyticDistributions:L4/spectral-matrix-coefficients`, `LocallyAnalyticDistributions:L4/spectral-evaluation-coefficients`.

**Acceptance:** All mathematical statuses remain unchecked; specialization retains nilpotent coefficients and the explicit rank.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### Reindexing a characteristic series

`LocallyAnalyticDistributions:L4/spectral-characteristic-reindex` — `Matrix.charpolyRev_reindex` (lemma).

For a bijection e:I→J between finite index types, P_(reindex_e M)=P_M.

**Hypotheses:** R is a commutative ring; I and J are finite types with decidable equality; e is a bijection.

**Proof outline:**

1. Use the native reverse_charpoly identity on each matrix and the native charpoly_reindex theorem. Apply polynomial reversal to that equality.
2. Reindexing does not change matrix rank. The argument is algebraic and includes empty indices and the zero ring.

**Prerequisites:** `mathlib:Matrix.reverse_charpoly`, `mathlib:Matrix.charpoly_reindex`.

**Acceptance:** All mathematical statuses remain unchecked; specialization retains nilpotent coefficients and the explicit rank.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### Reindexing polynomial matrix calculus

`LocallyAnalyticDistributions:L4/spectral-evaluation-reindex` — `Matrix.aeval_reindex` (lemma).

Reindexing B(M) along e:I→J equals B(reindex_e M).

**Hypotheses:** R is a commutative ring; I and J are finite types with decidable equality; e is a bijection; B is any polynomial.

**Proof outline:**

1. Use the native reindexAlgEquiv as an algebra homomorphism over R.
2. Native aeval_algHom_apply states exactly that algebra evaluation commutes with this map; identify its underlying map with reindex.

**Prerequisites:** `mathlib:Matrix.reindexAlgEquiv`, `mathlib:Polynomial.aeval_algHom_apply`.

**Acceptance:** All mathematical statuses remain unchecked; specialization retains nilpotent coefficients and the explicit rank.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### Finite characteristic spectral mapping

`LocallyAnalyticDistributions:L4/spectral-matrix-comparison` — `TauCeti.NonarchimedeanFredholm.polynomialSpectralResultant_charpolyRev` (theorem).

For a finite square matrix M over any commutative ring R and B∈R[Y] of natural degree at most m, D_(|I|,m)(B,P_M)=P_(B(M)). The index set need not have an order, and B(0) may be nonzero.

**Hypotheses:** R is any commutative ring, including the zero ring; I is a finite type with decidable equality; natural degree(B)≤m. N is |I|, not the degree of P_M.

**Proof outline:**

1. Choose the native equivalence I≃Fin |I| and apply the finite-specialization theorem to the reindexed matrix.
2. Use characteristic-series reindexing on both sides and polynomial-calculus reindexing on the output. This removes the chosen enumeration from the equality.
3. This is the unrestricted finite matrix comparison required by the finite step in Coleman A3.9. It does not by itself prove continuity or entireness of the infinite transform or transport the identity to compact operators.

**Prerequisites:** `LocallyAnalyticDistributions:L4/spectral-finite-specialization`, `LocallyAnalyticDistributions:L4/spectral-characteristic-reindex`, `LocallyAnalyticDistributions:L4/spectral-evaluation-reindex`.

**Tests:**

- `UniversalComparisonTests.dense_nilpotent` (computation): Over ZMod8, M=[[2,1],[2,2]] and B=Y+Y² give D_(2,2)(B,P_M)=1+6T². Here B(M)=[[0,5],[2,0]], P_M=1+4T+2T² and its discriminant is zero.
- `UniversalComparisonTests.constant` (computation): For the zero 2×2 matrix over ZMod8 and B=2, D_(2,0)(2,1)=1+4T+4T²; the rank remains2 although P_M has degree0.
- `UniversalComparisonTests.empty` (degenerate): For the empty integer matrix and B=1, D_(0,0)(1,P_M)=1.
- `UniversalComparisonTests.zero_ring` (degenerate): For any 2×2 matrix over ZMod1 and B=Y, D_(2,1)(Y,P_M)=P_M.

**Acceptance:** No diagonalization or embedding hypothesis is imposed on the final target matrix or ring. Nonzero B(0) is allowed in this finite theorem; the earlier B(0)=0 requirement for padding and the infinite problem remains.

**Source:** Coleman-PadicBanach-published-1997, Appendix A3, printed 435–436/PDF19–20, finite definition of D and finite-operator step in Theorem A3.9; full printed432–436 freshly read 27 September2026. Worker deduction supplying the unrestricted finite matrix identity over arbitrary commutative rings by a universal polynomial argument. Coleman motivates the finite step; the nested universal coefficients, generic discriminant and specialization proof are the worker’s decomposition, not a claim that the source prints this construction. The analytic limit is outside this slice.

### Reading, validation and continuation

All137 preceding whole node objects,171 baseline records, both source findings,
five requests and six planets are preserved. All preceding suggested-file
bytes are preserved between additional imports and the appended declarations.
The reviewed AUDIT25 rows, accepted RS16 boundaries and full prior handoff
were read. The48 guarded input files retain continuous-reading provenance;
WORKERS, PMIA276, the source registry and errata register are the four changes
from the preceding LAD checkpoint, all already read in the preceding jobs.

The complete published Coleman printed432–436/PDF16–20 was freshly read,
including A3.9 and its A4.1 application. The source is
[the published article](https://kundudeb.github.io/1997_Coleman.pdf), SHA256
32ff34f60fc2ef4608506daa169c3cc61e07520f019d63928e86b093a16b1973,
accessed27 September2026. The universal coefficient proof is a worker deduction
of its finite step. No new source issue is recorded and neither inherited
finding is independently reviewed here.

Thirty-five additional indexed baseline declarations and their ambient
hypotheses were read. In particular Tau Ceti already supplies monic discriminant
base change and the field separability criterion. Mathlib already supplies
distinct-eigenvector independence, the native basis constructor including empty
indices, root-set cardinality and generic-matrix specialization. These are
baseline citations rather than new mathematical nodes. A bounded catalogue
phrase search found no exact planned supplier for this generic finite comparison;
simultaneous orthonormal Hecke eigenbases and semilinear slope bases have
different hypotheses and targets. The predecessor’s upstream flag and Schur PR
observations remain historical evidence; no current upstream merge is assumed.

The indexed blueprint checker reports zero errors and warnings. The dependency
graph has152 reachable packet nodes,610 edges and201 baseline leaves, is acyclic,
and has exactly one requested stage leaf, AdicSpacesPartII:R3. All137 preceding
whole nodes,171 preceding baseline objects,2 findings and5 requests are unchanged.
The reader, packet declarations, API and11 added typed tests agree.

The entire suggested file elaborates with Lean4.34.0-rc2 at the pinned baseline:
zero errors and308 warnings, all the required proof placeholders. Its import
audit covers2206 Mathlib modules and4 existing pinned TauCeti modules. No native
library was built, no Lake project was created, and no actual supplier module
was imported. The existing explicit AdicSpacesPartII:R3 signature stub and its
generality request are preserved. The discriminant proof lemmas were read in
the pinned TauCeti source; this signature check does not compile their future
uses in proofs. All15 new nodes remain proof plans, with no completed-proof claim.
Suggested-file SHA256:88ef0c5b0038c12a513771c79295925d2db3fa489475b90a3fa1b8447266b260.

Independent finite-ring arithmetic compares the bounded Sylvester determinant
with det(1−T B(M)) in336 cases over ZMod1,2,3,4,8,9,25, ranks0–3 and bounds0–2.
The dense ZMod8 example, constant-polynomial rank retention, empty matrix,
zero ring and failure of padding stability for B(0)≠0 are checked separately.
These calculations support the conventions and tests; they do not prove the
universal theorem or the analytic limit. The four-file intake check and both
preserved findings in the versioned errata wrapper pass.


The unrestricted finite matrix identity is now decomposed through native generic matrices, independent universal polynomial coefficients, a rational specialization detecting the generic discriminant, an eigenbasis over the algebraic closure of the universal fraction field, faithful descent and arbitrary-ring specialization. Continue with the entire-input definition and limit of D, quantitative coefficient estimates, Coleman A3.8(11) and the infinite-operator A3.9 transport. Preserve the distinction between fixed-rank finite mapping (no B(0)=0 hypothesis) and rank padding or infinite compact-operator transport (B(0)=0 required). Canonical finite-module topology, completed tensor products, determinant/rank over nonreduced coefficients and actual distribution families remain separate gaps.


## Reciprocal-resultant declarations

### Simultaneous reflection of the Sylvester matrix

`LocallyAnalyticDistributions:L4/spectral-sylvester-reflection` — `sylvester_reflect_swap` (lemma).

Reindex both axes of Sylvester(f,g;m,n) by the global reversal of Fin(m+n), followed by the canonical cast to Fin(n+m). The result is Sylvester(reflect_n(g),reflect_m(f);n,m).

**Hypotheses:** R is any commutative ring. The natural numbers m,n are explicit bounds for native Sylvester matrices and resultants; they are not silently replaced by actual degrees. A reflection is the native reflect at its specified exponent. Unless explicitly required, no degree, normalization, domain or nontriviality assumption is imposed.

**Proof outline:**

1. Read the native convention: the first m columns consist of shifted coefficients of g and the last n columns of shifted coefficients of f. Reversing the column order swaps these blocks and reverses each block.
2. At each row and column, the global row reversal sends the allowed coefficient window to the reflected window. Use coeff_reflect and the explicit Sylvester entry formula, splitting on the two column blocks and the finite window inequalities.
3. Both reindexings use the same equivalence. No separate permutation-sign formula is needed; empty blocks are covered by the same finite-index statement.

**Prerequisites:** `mathlib:Polynomial.sylvester`, `mathlib:Polynomial.coeff_reflect`, `mathlib:Fin.revPerm`.

**Acceptance:** The reflection is at the supplied bounds. No actual-degree hypothesis is needed because the bounded matrix reads only its coefficient windows.

**Source:** Appendix A3, printed434–435/PDF18–19: resultant norm interpretation, reciprocity(9), and the full proof of LemmaA3.8(11). Complete printed433–435 freshly read from the published copy. Worker decomposition of the scalar limiting step in A3.8(11). Native simultaneous reversal/swap and finite remainder-coordinate continuity justify the exact comparison and its limit. This does not construct the general entire spectral transform or infer continuity of evaluation from the coefficientwise topology.

### Reciprocal resultant with swapped factors

`LocallyAnalyticDistributions:L4/spectral-resultant-reflection` — `resultant_reflect_swap` (lemma).

Res(reflect_m(f),reflect_n(g);m,n)=Res(g,f;n,m).

**Hypotheses:** R is any commutative ring. The natural numbers m,n are explicit bounds for native Sylvester matrices and resultants; they are not silently replaced by actual degrees. A reflection is the native reflect at its specified exponent. Unless explicitly required, no degree, normalization, domain or nontriviality assumption is imposed.

**Proof outline:**

1. Apply the preceding matrix identity to the reflected inputs and take determinants.
2. Native det_reindex_self removes the simultaneous permutation. Native reflect_reflect restores the original polynomials, and the native resultant definition identifies the determinants.
3. The reflected factors are swapped in the conclusion. This is exactly the cancellation of the two customary resultant signs, valid over rings with nilpotents and in characteristic2.

**Prerequisites:** `LocallyAnalyticDistributions:L4/spectral-sylvester-reflection`, `mathlib:Matrix.det_reindex_self`, `mathlib:Polynomial.reflect_reflect`, `mathlib:Polynomial.resultant`.

**Acceptance:** A formula with the reflected factors in the original order would generally retain a sign; this swapped formula has none.

**Source:** Appendix A3, printed434–435/PDF18–19: resultant norm interpretation, reciprocity(9), and the full proof of LemmaA3.8(11). Complete printed433–435 freshly read from the published copy. Worker decomposition of the scalar limiting step in A3.8(11). Native simultaneous reversal/swap and finite remainder-coordinate continuity justify the exact comparison and its limit. This does not construct the general entire spectral transform or infer continuity of evaluation from the coefficientwise topology.

### Finite reciprocal spectral evaluation

`LocallyAnalyticDistributions:L4/spectral-reciprocal-evaluation` — `polynomialSpectralResultant_one_sub_reverse_eval` (comparison).

For monic Q of degree d and P.natDegree≤n, D_(n,d)(1−Q.reverse,P)(1)=Res(Q,P;d,P.natDegree).

**Hypotheses:** R is any commutative ring. The natural numbers m,n are explicit bounds for native Sylvester matrices and resultants; they are not silently replaced by actual degrees. A reflection is the native reflect at its specified exponent. Unless explicitly required, no degree, normalization, domain or nontriviality assumption is imposed. Q is monic; d=Q.natDegree; P.natDegree≤n. The finite statement itself does not require P(0)=1.

**Proof outline:**

1. Use spectral-polynomial-evaluation at t=1. The second resultant argument becomes Q.reverse and the first remains reflect_n(P), with bounds n,d.
2. Native reverse is reflection at actual degree d. Apply spectral-resultant-reflection with f=P and g=Q to obtain Res(Q,P;d,n).
3. Use native Monic.resultant_of_le with the valid bound P.natDegree≤n to replace its right degree bound by P.natDegree. No normalization of P is needed for this fixed-bound identity.

**Prerequisites:** `LocallyAnalyticDistributions:L4/spectral-polynomial-evaluation`, `LocallyAnalyticDistributions:L4/spectral-resultant-reflection`, `mathlib:Polynomial.reverse`, `tauceti:Polynomial.Monic.resultant_of_le`.

**Tests:**

- `ReciprocalLimitTests.unit_divisor` (degenerate): For every n and P over ℤ, D_(n,0)(0,P)(1)=1, agreeing with the empty resultant for Q=1.
- `ReciprocalLimitTests.linear_sign` (computation): Over ℤ, D_(1,1)(3T,1−2T)(1)=−5, the value of1−2T at3.
- `ReciprocalLimitTests.padding` (compatibility): Over ZMod8, D_(5,1)(2T,1+T²)(1)=5; the supplied rank5 may exceed the actual degree2.
- `ReciprocalLimitTests.unnormalized` (nonexample): Over ℤ, D_(0,2)(0,2)(1)=4 but D_(0,0)(0,2)(1)=1. The absence of P(0)=1 prevents auxiliary-bound independence.

**Acceptance:** The right bound is d even when 1−Q.reverse has smaller degree. Without P(0)=1 that bound cannot generally be lowered.

**Source:** Appendix A3, printed434–435/PDF18–19: resultant norm interpretation, reciprocity(9), and the full proof of LemmaA3.8(11). Complete printed433–435 freshly read from the published copy. Worker decomposition of the scalar limiting step in A3.8(11). Native simultaneous reversal/swap and finite remainder-coordinate continuity justify the exact comparison and its limit. This does not construct the general entire spectral transform or infer continuity of evaluation from the coefficientwise topology.

### A fixed-size resultant of the monic remainder

`LocallyAnalyticDistributions:L4/resultant-remainder-fixed-bound` — `resultant_modByMonic_fixedBound` (lemma).

For monic Q of degree d and every polynomial P, Res(Q,P;d,P.natDegree)=Res(Q,P modByMonic Q;d,d).

**Hypotheses:** R is any commutative ring. The natural numbers m,n are explicit bounds for native Sylvester matrices and resultants; they are not silently replaced by actual degrees. A reflection is the native reflect at its specified exponent. Unless explicitly required, no degree, normalization, domain or nontriviality assumption is imposed. Q is monic of degree d.

**Proof outline:**

1. The native monic division identity shows that P and P modByMonic Q have the same class in AdjoinRoot Q.
2. Apply the existing native norm_mk_eq_resultant to both representatives. Their algebra norms agree because their quotient classes agree; no topology on that quotient is invoked.
3. The native degree bound for the remainder implies its natural degree is at most d (also when d=0 and the remainder is0). Apply Monic.resultant_of_le to replace the right degree bound by d.

**Prerequisites:** `tauceti:AdjoinRoot.norm_mk_eq_resultant`, `mathlib:Polynomial.modByMonic_add_div`, `mathlib:Polynomial.degree_modByMonic_lt`, `tauceti:Polynomial.Monic.resultant_of_le`.

**Tests:**

- `ReciprocalLimitTests.zero_polynomial` (degenerate): Over ℤ, Res(T,0;1,0)=0; only the degree-zero divisor has resultant1 against zero.

**Acceptance:** The matrix size in the final expression depends only on Q, even as the degree of P grows.

**Source:** Appendix A3, printed434–435/PDF18–19: resultant norm interpretation, reciprocity(9), and the full proof of LemmaA3.8(11). Complete printed433–435 freshly read from the published copy. Worker decomposition of the scalar limiting step in A3.8(11). Native simultaneous reversal/swap and finite remainder-coordinate continuity justify the exact comparison and its limit. This does not construct the general entire spectral transform or infer continuity of evaluation from the coefficientwise topology.

### Continuity of a fixed coefficient resultant

`LocallyAnalyticDistributions:L4/resultant-coordinate-continuity` — `continuous_resultant_ofFn` (lemma).

For fixed Q and m,n, the function v↦Res(Q,Polynomial.ofFn(n+1,v);m,n) from the native finite product R^(n+1) to R is continuous.

**Hypotheses:** R is any topological commutative ring with continuous addition and multiplication. Q is a fixed native polynomial and m,n are fixed natural numbers. The domain has the native finite product topology.

**Proof outline:**

1. The existing ofFn coefficient formulas say that each coefficient of the encoded polynomial is a coordinate projection or0. Classical decidable coefficient equality is used only to express that native constructor.
2. In the native Sylvester matrix, each entry is therefore a constant depending on Q, a coordinate projection, or0, selected by a fixed finite-index inequality. Thus the matrix-valued function is continuous.
3. Apply native Continuous.matrix_det and the native definition of the bounded resultant. This avoids imposing any topology on Polynomial R, AdjoinRoot Q or the algebra norm.

**Prerequisites:** `mathlib:Polynomial.ofFn_coeff_eq_val_of_lt`, `mathlib:Polynomial.ofFn_coeff_eq_zero_of_ge`, `mathlib:Polynomial.sylvester`, `mathlib:Polynomial.resultant`, `mathlib:Continuous.matrix_det`.

**Acceptance:** The dimensions m,n are fixed. This lemma does not assert convergence of resultants with unbounded matrix size.

**Source:** Appendix A3, printed434–435/PDF18–19: resultant norm interpretation, reciprocity(9), and the full proof of LemmaA3.8(11). Complete printed433–435 freshly read from the published copy. Worker decomposition of the scalar limiting step in A3.8(11). Native simultaneous reversal/swap and finite remainder-coordinate continuity justify the exact comparison and its limit. This does not construct the general entire spectral transform or infer continuity of evaluation from the coefficientwise topology.

### Truncation limit of each monic quotient coefficient

`LocallyAnalyticDistributions:L4/entire-quotient-truncation-limit` — `tendsto_entireMonicQuotient_trunc_coeff` (lemma).

For every k≥0, coeff_k(S_Q(F_n)) converges to coeff_k(S_Q(F)) as n tends to infinity.

**Hypotheses:** A is a nontrivial complete normed commutative ring, with norm(1)=1 and ‖a+b‖≤max(‖a‖,‖b‖). Q is a monic native polynomial, d=Q.natDegree (including Q=1,d=0), and F is an existing entire power series: its weighted coefficients tend to zero at every positive radius. No field, splitting, reducedness or Noetherian hypothesis is used. Write F_n=PowerSeries.trunc(n+1,F), so coefficients through degree n are retained. S_Q(F) is the preceding entireMonicQuotient, and R_Q(F)=trunc_d(F−Q S_Q(F)) is its existing native polynomial remainder. Write Res(Q,F) for the preceding entireResultant, defined by the native finite-algebra norm.

**Proof outline:**

1. Let b_j be the coefficients of the native inverse of Q.reverse. The preceding quotient formula expresses the kth coefficient as the convergent sum of a_(k+d+j)b_j.
2. For F_n, the native truncation formula retains precisely the terms with k+d+j≤n. Its quotient coefficient is the finite initial sum over j<n+1−(k+d); outside that range every summand is zero.
3. The preceding monic-reciprocal-tail-summable theorem proves summability of the untruncated sequence. Native partial-sum convergence, composed with the cofinal cutoff n+1−(k+d), gives the limit. This step uses actual summability rather than exchanging an infinite sum with a pointwise limit.

**Prerequisites:** `LocallyAnalyticDistributions:L4/entire-monic-quotient-coeff`, `LocallyAnalyticDistributions:L4/monic-reciprocal-tail-summable`, `mathlib:PowerSeries.coeff_trunc`, `mathlib:HasProd.tendsto_prod_nat`.

**Tests:**

- `ReciprocalLimitTests.quotient_one` (compatibility): For Q=1, coeff_k(S_1(F_n)) converges to coeff_k(F), for every entire F and k.

**Acceptance:** Only individual quotient coefficients are asserted to converge; the bound and entireness nodes remain separate. Includes d=0 and k=0.

**Source:** Appendix A3, printed434–435/PDF18–19: resultant norm interpretation, reciprocity(9), and the full proof of LemmaA3.8(11). Complete printed433–435 freshly read from the published copy. Worker decomposition of the scalar limiting step in A3.8(11). Native simultaneous reversal/swap and finite remainder-coordinate continuity justify the exact comparison and its limit. This does not construct the general entire spectral transform or infer continuity of evaluation from the coefficientwise topology.

### Truncation limit of each monic remainder coefficient

`LocallyAnalyticDistributions:L4/entire-remainder-truncation-limit` — `tendsto_modByMonic_trunc_coeff` (lemma).

For every k≥0, coeff_k(F_n modByMonic Q) converges to coeff_k(R_Q(F)).

**Hypotheses:** A is a nontrivial complete normed commutative ring, with norm(1)=1 and ‖a+b‖≤max(‖a‖,‖b‖). Q is a monic native polynomial, d=Q.natDegree (including Q=1,d=0), and F is an existing entire power series: its weighted coefficients tend to zero at every positive radius. No field, splitting, reducedness or Noetherian hypothesis is used. Write F_n=PowerSeries.trunc(n+1,F), so coefficients through degree n are retained. S_Q(F) is the preceding entireMonicQuotient, and R_Q(F)=trunc_d(F−Q S_Q(F)) is its existing native polynomial remainder. Write Res(Q,F) for the preceding entireResultant, defined by the native finite-algebra norm.

**Proof outline:**

1. The existing entire-monic-quotient-polynomial comparison identifies the polynomial remainder of F_n with trunc_d(F_n−Q S_Q(F_n)).
2. At k<d the coefficient of this difference is a_(n,k) minus a finite sum of fixed coefficients of Q times coefficients of S_Q(F_n). The native truncation coefficient is eventually a_k, and the preceding quotient-coefficient limits handle the finite sum.
3. Continuity of finite sums, multiplication and subtraction gives the limit. At k≥d both truncated coefficients vanish by the existing degree bounds. This includes d=0, where the entire remainder is0.

**Prerequisites:** `LocallyAnalyticDistributions:L4/entire-monic-quotient-polynomial`, `LocallyAnalyticDistributions:L4/entire-quotient-truncation-limit`, `LocallyAnalyticDistributions:L4/entire-monic-division-remainder`, `mathlib:PowerSeries.coeff_trunc`, `mathlib:PowerSeries.coeff_mul`.

**Acceptance:** This is convergence of the native remainder coefficients, not a topology claim for the entire quotient algebra.

**Source:** Appendix A3, printed434–435/PDF18–19: resultant norm interpretation, reciprocity(9), and the full proof of LemmaA3.8(11). Complete printed433–435 freshly read from the published copy. Worker decomposition of the scalar limiting step in A3.8(11). Native simultaneous reversal/swap and finite remainder-coordinate continuity justify the exact comparison and its limit. This does not construct the general entire spectral transform or infer continuity of evaluation from the coefficientwise topology.

### Entire resultant as a limit of polynomial resultants

`LocallyAnalyticDistributions:L4/entire-resultant-truncation-limit` — `tendsto_resultant_trunc` (theorem).

Res(Q,F_n;d,F_n.natDegree) converges to the existing entire resultant Res(Q,F).

**Hypotheses:** A is a nontrivial complete normed commutative ring, with norm(1)=1 and ‖a+b‖≤max(‖a‖,‖b‖). Q is a monic native polynomial, d=Q.natDegree (including Q=1,d=0), and F is an existing entire power series: its weighted coefficients tend to zero at every positive radius. No field, splitting, reducedness or Noetherian hypothesis is used. Write F_n=PowerSeries.trunc(n+1,F), so coefficients through degree n are retained. S_Q(F) is the preceding entireMonicQuotient, and R_Q(F)=trunc_d(F−Q S_Q(F)) is its existing native polynomial remainder. Write Res(Q,F) for the preceding entireResultant, defined by the native finite-algebra norm.

**Proof outline:**

1. Replace each polynomial resultant by the fixed-bound resultant of F_n modByMonic Q using resultant-remainder-fixed-bound. Its matrix dimensions are now d,d independently of n.
2. Take the vector of coefficients0,…,d of each remainder. By entire-remainder-truncation-limit and native tendsto_pi_nhds, these vectors converge to the corresponding vector for R_Q(F). Native ofFn coefficient formulas reconstruct these polynomials because all coefficients above d vanish.
3. Apply resultant-coordinate-continuity with dimensions d,d. Native monic bound-independence identifies the limiting fixed-bound resultant with the ordinary resultant of Q and R_Q(F).
4. The existing entire division decomposition and entireAdjoinRoot_of_decomposition identify rho_Q(F) with the class of R_Q(F). Native norm_mk_eq_resultant and the existing entireResultant_norm identify this ordinary resultant with Res(Q,F). No continuity of the native algebra norm on an untopologized quotient is assumed.

**Prerequisites:** `LocallyAnalyticDistributions:L4/resultant-remainder-fixed-bound`, `LocallyAnalyticDistributions:L4/entire-remainder-truncation-limit`, `LocallyAnalyticDistributions:L4/resultant-coordinate-continuity`, `LocallyAnalyticDistributions:L4/entire-monic-division-remainder`, `LocallyAnalyticDistributions:L4/entire-monic-quotient-entire`, `LocallyAnalyticDistributions:L4/entire-quotient-class`, `LocallyAnalyticDistributions:L4/entire-resultants`, `tauceti:AdjoinRoot.norm_mk_eq_resultant`, `tauceti:Polynomial.Monic.resultant_of_le`, `mathlib:tendsto_pi_nhds`, `mathlib:Polynomial.ofFn_coeff_eq_val_of_lt`, `mathlib:Polynomial.ofFn_coeff_eq_zero_of_ge`.

**Acceptance:** Includes Q=1 with limit1, zero F with a positive-degree divisor and nonreduced coefficients. F need not have constant coefficient1.

**Source:** Appendix A3, printed434–435/PDF18–19: resultant norm interpretation, reciprocity(9), and the full proof of LemmaA3.8(11). Complete printed433–435 freshly read from the published copy. Worker decomposition of the scalar limiting step in A3.8(11). Native simultaneous reversal/swap and finite remainder-coordinate continuity justify the exact comparison and its limit. This does not construct the general entire spectral transform or infer continuity of evaluation from the coefficientwise topology.

### Scalar spectral limit with a fixed reciprocal polynomial

`LocallyAnalyticDistributions:L4/spectral-reciprocal-limit` — `tendsto_spectral_one_sub_reverse_eval` (lemma).

D_(n,d)(1−Q.reverse,F_n)(1) converges to Res(Q,F).

**Hypotheses:** A is a nontrivial complete normed commutative ring, with norm(1)=1 and ‖a+b‖≤max(‖a‖,‖b‖). Q is a monic native polynomial, d=Q.natDegree (including Q=1,d=0), and F is an existing entire power series: its weighted coefficients tend to zero at every positive radius. No field, splitting, reducedness or Noetherian hypothesis is used. Write F_n=PowerSeries.trunc(n+1,F), so coefficients through degree n are retained. S_Q(F) is the preceding entireMonicQuotient, and R_Q(F)=trunc_d(F−Q S_Q(F)) is its existing native polynomial remainder. Write Res(Q,F) for the preceding entireResultant, defined by the native finite-algebra norm.

**Proof outline:**

1. The native degree bound for trunc(n+1,F) gives F_n.natDegree≤n.
2. Apply spectral-reciprocal-evaluation at every n to replace the displayed value by the ordinary polynomial resultant of Q and F_n. Apply entire-resultant-truncation-limit.

**Prerequisites:** `LocallyAnalyticDistributions:L4/spectral-reciprocal-evaluation`, `LocallyAnalyticDistributions:L4/entire-resultant-truncation-limit`, `mathlib:PowerSeries.natDegree_trunc_lt`.

**Tests:**

- `ReciprocalLimitTests.linear_limit` (compatibility): For Q=T−a, D_(n,1)(aT,F_n)(1) converges to the existing convergent evaluation F(a).

**Acceptance:** This proves the actual scalar sequence limit, including unnormalized F; it does not define D on general entire pairs.

**Source:** Appendix A3, printed434–435/PDF18–19: resultant norm interpretation, reciprocity(9), and the full proof of LemmaA3.8(11). Complete printed433–435 freshly read from the published copy. Worker decomposition of the scalar limiting step in A3.8(11). Native simultaneous reversal/swap and finite remainder-coordinate continuity justify the exact comparison and its limit. This does not construct the general entire spectral transform or infer continuity of evaluation from the coefficientwise topology.

### The normalized scalar limit in Coleman A3.8

`LocallyAnalyticDistributions:L4/spectral-simultaneous-truncation-limit` — `tendsto_spectral_simultaneous_trunc_eval` (theorem).

Assume F(0)=1 and let B=1−Q.reverse and B_n=trunc(n+1,B). Then D_(n,n)(B_n,F_n)(1) converges to Res(Q,F).

**Hypotheses:** A is a nontrivial complete normed commutative ring, with norm(1)=1 and ‖a+b‖≤max(‖a‖,‖b‖). Q is a monic native polynomial, d=Q.natDegree (including Q=1,d=0), and F is an existing entire power series: its weighted coefficients tend to zero at every positive radius. No field, splitting, reducedness or Noetherian hypothesis is used. Write F_n=PowerSeries.trunc(n+1,F), so coefficients through degree n are retained. S_Q(F) is the preceding entireMonicQuotient, and R_Q(F)=trunc_d(F−Q S_Q(F)) is its existing native polynomial remainder. Write Res(Q,F) for the preceding entireResultant, defined by the native finite-algebra norm. F.coeff0=1. B is the fixed native polynomial1−Q.reverse; its source truncations use coefficients through degree n.

**Proof outline:**

1. Since Q is monic, Q.reverse has constant coefficient1, hence B(0)=0; its natural degree is at most d. For n sufficiently large, native trunc_coe_eq_self gives B_n=B.
2. Native coeff_trunc gives F_n(0)=1, and the natural degree of F_n is at most n. Its rank-n reversal is therefore monic, as in the preceding finite construction.
3. For large n both n and d are valid right bounds for B. The existing spectral-right-bound theorem identifies D_(n,n)(B,F_n) and D_(n,d)(B,F_n), even if B has degree less than d.
4. The simultaneous sequence is thus eventually equal to the fixed-B scalar sequence in spectral-reciprocal-limit. They have the same limit. This is precisely the scalar limiting equality required for A3.8(11), before the general entire D and its evaluation-continuity theorem are supplied.

**Prerequisites:** `LocallyAnalyticDistributions:L4/spectral-reciprocal-limit`, `LocallyAnalyticDistributions:L4/spectral-right-bound`, `LocallyAnalyticDistributions:L4/spectral-reversed-degree`, `mathlib:Polynomial.reverse`, `mathlib:Polynomial.natDegree_reflect_le`, `mathlib:PowerSeries.trunc_coe_eq_self`, `mathlib:PowerSeries.coeff_trunc`, `mathlib:PowerSeries.natDegree_trunc_lt`.

**Tests:**

- `ReciprocalLimitTests.constant_entire` (degenerate): For F=1, the simultaneous scalar sequence converges to1 for every monic Q, including Q=1.

**Acceptance:** Retain F(0)=1 when comparing auxiliary bounds. No coefficientwise-series convergence is used to justify evaluation at1. A full D(1−Q*,F)(1) theorem still requires constructing entire D with the appropriate convergence.

**Source:** Appendix A3, printed434–435/PDF18–19: resultant norm interpretation, reciprocity(9), and the full proof of LemmaA3.8(11). Complete printed433–435 freshly read from the published copy. Worker decomposition of the scalar limiting step in A3.8(11). Native simultaneous reversal/swap and finite remainder-coordinate continuity justify the exact comparison and its limit. This does not construct the general entire spectral transform or infer continuity of evaluation from the coefficientwise topology.

### Remaining analytic target

The scalar truncation equality in Coleman A3.8(11) is now decomposed: native Sylvester reflection/swap gives the finite reciprocal identity; convergent monic-quotient tails give remainder coefficient convergence; fixed-size resultant continuity gives Res(Q,F_n)→Res(Q,F); and normalization gives the simultaneous spectral scalar limit. Construct the general entire D(B,P), prove convergence with quantitative coefficient estimates in an entire topology that makes evaluation continuous, and then identify its value at1 using the supplied scalar limit. Prove A3.8(10) and the infinite-operator A3.9 transport. Do not infer evaluation continuity from coefficientwise convergence or identify a scalar limit with an unconstructed series. The canonical finite-module topology, finite-projective determinants/rank over nonreduced coefficients, completed tensors and actual distribution families remain separate gaps.


### Reciprocal-resultant validation

The full suggested file compiles at the pinned baseline with0 errors and326
warnings, all and only the expected placeholders. Its source closure checks
2207 Mathlib modules and4 previously built pinned TauCeti modules. No native
library was built and no planned supplier module is imported. The existing
AdicSpacesPartII:R3 signature stub and its generality request are preserved.
No full proof of the ten new declarations is claimed. Suggested SHA256:
1ad621fce22f80c52d095d7ab1eeaee6c074cddda53ba11dce94974246776d41.

Indexed blueprint:0 errors,0 warnings. Four-file intake:0 problems. Errata,
whitespace, whole-object preservation, reader/signature/test parity and scope
checks pass. The graph has162 reachable nodes,662 acyclic edges,209 baseline
leaves and exactly the preserved AdicSpacesPartII:R3 stage request leaf.
Eight explicit gaps and five requests remain.

Exact arithmetic checks560 simultaneous Sylvester reversals,560 reciprocal
resultant identities and448 finite spectral evaluations over ZMod1,2,3,4,8,9,25.
Forty exact rational finite-truncation remainder/resultant comparisons and36
successive remainder valuations check the series Σ2^(k²)T^k at four monic
divisors, including nonintegral dyadic roots. These computations validate
conventions and finite examples, not the general convergence theorem.


At publication main ef2687ade0070151552d31cac1632d7fec022dab,47 of48 guarded input blobs and all
four predecessor deliverables are unchanged. The PMIA276→282 change is exactly
our preceding PR3276, merged automatically asae513df953f34c808ccadc5115c53e079c838cd0; all six
coefficient-algebra moment additions were authored and read in this session.
The issue body and the bot's exact fresh claim confirmation were checked
again. Exactly four authorized files are submitted from the own job branch.
