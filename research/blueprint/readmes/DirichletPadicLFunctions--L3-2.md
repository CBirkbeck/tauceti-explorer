# Dirichlet p-adic L-functions: branches, logarithms and poles

This is the second planning pass for **DirichletPadicLFunctions:L3**. It extends the accepted [first L3 packet](../packets/DirichletPadicLFunctions--L3.json), whose declarations remain the supplier for the cyclotomic constants, the complex value at one, Morita's Gamma function and Robert's Gross–Koblitz comparison. This pass completes the target ledger for the arithmetic branches, logarithmic special values, poles and Ferrero–Greenberg formula. The coverage is **planned**. The exact supplier interfaces and the arithmetic nonvanishing proof below remain open; neither the packet nor its suggested signatures claim implementations.

## Objects and conventions

Let p be prime, including 2, and let K be a complete finite extension of Q_p with its normalized ultrametric norm and compatible scalar maps. Use the native topological group U=Z_p^× and native K-valued continuous dual AbstractMeasure. The chart, restriction, coefficient extension and pseudomeasure evaluation belong to **PadicMeasuresIwasawaAlgebras**, abbreviated PMIA. The scalar power-series evaluations and analytic Mellin transforms belong to **LocallyAnalyticDistributions**, abbreviated LAD. The common logarithm belongs to **ColemanIntegration:L0/iwasawa-logarithm**: it is normalized by log_p(p)=0, kills roots of unity, and is compatible with coefficient embeddings. No independent logarithm or new character, measure, distribution or weight-space carrier is introduced here.

For odd p write u=ω_p(u)〈u〉 with 〈u〉 in 1+pZ_p, and choose γ=1+p. At p=2 let ω_2 be the sign determined by reduction modulo 4, put 〈u〉=ω_2(u)^(-1)u in 1+4Z_2, and choose γ=5. The imported standard chart has a continuous additive coordinate h:U→Z_p with γ^h(u)=〈u〉. An arbitrary continuous h is sufficient for the adapter signature; it does not construct the arithmetic chart. The packet therefore requests the actual chart, its coefficient maps and its laws from PMIA L0a.

The inherited Iwasawa pseudomeasure ζ has actual clearing numerator λ_a=(δ_a−δ_1)ζ. For a finite character ν and integral s set

\[
 \kappa_s(u)=\nu(u)\langle u\rangle^{1-s},\qquad
 N_a(s)=\int_U\kappa_s\,d\lambda_a,\qquad
 L_a(s)=\frac{N_a(s)}{\kappa_s(a)-1}.
\]

The angular power is the existing native Mahler additive character with value γ at 1, pulled back along (1−s)h. It is defined on all integral weights without first evaluating a logarithm. For analytic comparison, absorb the full ν:U→K into μν=AbstractMeasure.weight ν μ using PMIA L2, and apply LAD’s component Mellin transform to μν with trivial finite torsion factor. This gives coefficients μ(ν binom(h,n)) and evaluation μ(νκ_t(h)). Wild ν need not factor through the torsion group; the weighting step is what covers it. The coefficient bound is ||μν.toCLMEquiv||≤||μ.toCLMEquiv|| ||ν||_sup, with ||ν||_sup=1 for finite-order characters. The quotient represents arithmetic evaluation only when κ_s(a)≠1. Different choices of a change both the numerator and denominator, and the native double-clearing identity gives the same value on their common admissible locus. The scalar field's totalized division gives zero at a zero denominator; this is expressly excluded as an arithmetic value.

The branch convention is Rodrigues Jacinto–Williams (RJW), angle^(1−s) against the zeta measure. Against the underlying tame measure, whose x-weight is the zeta measure, it is χω^(-1)angle^(−s). The inverse ω factor is essential. At s=1−k the measure integrand becomes χω^(-k)x^(k−1). This uses the independently confirmed inherited E14 correction to RJW Theorem 5.20.

## Integral branches and interpolation

The declarations `rjw-test`, `rjw-numerator` and `rjw-cleared` form the native continuous test, integral and scalar clearing adapter. Their API supplies evaluation, central value, multiplicativity or additivity, and cancellation on the admissible locus. The actual arithmetic identification is a separate declaration, `arithmetic-evaluation`, resting on PMIA's admissible evaluation of the existing pseudomeasure module. The requested K-valued extension must preserve that module; it cannot be a map from the whole total quotient ring to K.

For a primitive nontrivial character θ and k≥1, let ψ be the primitive inducer of θω^(-k). Then

\[
 L_p(\theta,1-k)
   =(1-\psi(p)p^{k-1})L(\psi,1-k).
\]

The complex expression on the right denotes the common algebraic generalized-Bernoulli value with its specified complex and p-adic embeddings. It is never a scalar map from C to K. Twisting can change the conductor, so ψ(p) must be evaluated at its primitive conductor. A level-inflated character would give the wrong zero Euler factor. The proof uses the exact L2 common-value nodes, including `intrinsic-tame-common-character-value`, and the unit-character calculation above.

For odd p the i-th zeta component is ν=ω^i, i modulo p−1. If k≡i modulo p−1 then ψ has conductor 1, and the formula becomes (1−p^(k−1))ζ(1−k). The principal component is i=0, corresponding to RJW's label i=p−1. At p=2 there are two components indexed modulo 2, not modulo p−1=1. The sign component is identically zero by evenness of the actual pseudomeasure; cancellation of 2 occurs in Q_2, where it is nonzero, and does not assert that it is an integral unit. The principal component is treated by the pole calculation below.

## Analytic coordinates and the actual pole

Import LAD's actual finite-character Mellin series F of the bounded numerator. Its coefficients satisfy a uniform bound from the continuous-dual operator norm and the finite-character bound. Native scalar-series evaluation E(F,t) consequently converges on every closed radius less than 1. Let

\[
 L=\log_p\gamma,\quad A=\log_p\langle a\rangle,\quad c=\nu(a),
\quad N_F(s)=E(F,\exp((1-s)L)-1),
\quad d(s)=c\exp((1-s)A)-1.
\]

Keep L and A distinct. The exponential has a p-adic convergence germ; a totalized value outside it proves no analytic statement. The LAD L1 request specifies positive radius, analyticity, derivative at zero, and agreement with the existing Mahler character on integral exponents. The actual LAD Mellin evaluation then identifies N_F/d with the integral clearing quotient. Its numerator is analytic near 1, d(1)=c−1, and d′(1)=−cA. For a nontrivial finite component choose a with c≠1: analytic division gives a regular branch near 1. This case has its own declaration and does not inherit a principal pole.

For the principal component take the actual λ_(p+1), so a=p+1 and c=1. The accepted `principal-numerator-logarithmic-series` gives the arithmetic mass

\[
 N_F(1)=\operatorname{coeff}_0F
       =-(1-p^{-1})\log_p(p+1)=-(1-p^{-1})A.
\]

This uses the independent k=1 smoothed Coleman primitive and its actual measure/rotation comparison, retaining those supplier obligations. It does not use a subsequent positive L-value theorem. The inherited norm calculation gives ||A||=1/p for odd p and 1/4 for p=2, hence A≠0. At p=2 the smoothing unit is 3 while the Mellin generator is 5; log_2(〈3〉)=log_2(−3)=log_2(3). The first two terms of log(1+2) cancel, so the odd-prime logarithm norm cannot be copied.

Because d(1)=0 and d′(1)=−A≠0, its native analytic order is 1. Write d(s)=(s−1)b(s) with analytic b and b(1)=−A. Then H=N_F/b is analytic and

\[
 H(1)=1-p^{-1}\ne0,\qquad
 L_p(s)=\frac{H(s)}{s-1}
\]

on a punctured neighborhood. This gives native meromorphic order −1 and the actual residue 1−p^(-1). A punctured limit alone would not establish meromorphicity; the analytic numerator, nonzero log and denominator factorization are separately supplied. Under s=φ(t), φ(t_0)=1, φ′(t_0)=c≠0, the function residue is (1−p^(-1))/c. The differential residue is invariant. In the exponent coordinate t=1−s the function residue changes sign. These distinctions are explicit acceptance conditions.

## Primitive cyclotomic logarithms and Leopoldt's formula

Use the inherited `cyclotomic-logarithmic-constant`, with θ primitive nontrivial of conductor N, a chosen primitive N-th root ε, and the Gauss sum G(θ^(-1)) formed with the same ε:

\[
 C_\theta=-G(\theta^{-1})^{-1}
       \sum_{c\in(\mathbf Z/N)^\times}
       \theta^{-1}(c)\log_p(1-\epsilon^c).
\]

The inherited complex theorem is the analogous formula for L(θ,1) with the specified complex logarithm. Its modulus is the primitive conductor N, including a p-part; the p-adic proof is independent. Root changes must transport both ε and the Gauss sum. The existing joint-root transport and log-branch independence declarations are imported intact. Values in different completions are two realizations of cyclotomic algebraic data, not an identification of complex and p-adic transcendental numbers.

The arithmetic comparison is split into all three conductor cases N=Dp^n, p∤D.

* **Tame, n=0 and N=D>1.** The inherited full primitive C(C_θ)+H_θ differentiates to the actual tame measure; its constant is C_θ, whereas H_θ alone has constant zero. Its inverse unit moment is its central value minus its p-root trace. The finite product over ξ in μ_p of (ξε^c−1) equals ε^(pc)−1 up to a sign killed by log. Reindexing c↦pc introduces θ(p), hence the trace is p^(-1)θ(p)C_θ. This explicitly proves the powered-log input to the inherited trace-eigenvalue declaration. The result is (1−θ(p)p^(-1))C_θ.
* **Pure p-power, D=1 and n≥1.** Choose a genuine smoothing unit a with χ(a)≠1. The existing smoothed k=1 primitive Φ_a is analytic at its center with Φ_a(1)=−log_p(a); the unsmoothed singular log(T) is forbidden. Finite Gauss twisting has coefficient +1/G. Its weighted central logarithm sum is (χ(a)−1)C_χ. The weighted p-root trace vanishes: for n=1 all averages coincide and Σχ^(-1)=0; for n≥2 they are constant on reduction fibers and χ is nontrivial on the reduction kernel. Thus the actual clearing numerator is (χ(a)−1)C_χ and cancellation gives C_χ. This includes the n=1 boundary and all primes when the requested actual coefficient/rotation comparison is supplied. The inherited odd-prime value-as-smoothed-moment theorem is not imported as a dyadic theorem.
* **Mixed, D>1 and n≥1.** The full nontrivial tame primitive C(C_η)+H_η remains analytic after the p-power twists. The same reduction-fiber cancellation kills its trace, giving C_θ. Its actual primitive conductor is divisible by p, so θ(p)=0.

Combining the cases yields the actual Leopoldt formula

\[
 L_p(\theta,1)=(1-\theta(p)p^{-1})C_\theta.
\]

This argument precedes the Coleman positive-polylog special-value comparison and avoids that dependency cycle. The source's pure-power singular primitive and sign slips are the accepted Coleman E17/E18/E19 corrections, rather than new findings of this pass. Primitivity, nontriviality and the chosen-root nonzero Gauss sum are retained throughout.

## Morita Gamma and Gross–Koblitz normalization

The accepted predecessor already owns the native continuous function Γ_p:Z_p→Z_p^× extending

\[
 \Gamma_p(n)=(-1)^n\prod_{1\le j<n,\ p\nmid j}j.
\]

Its existence, uniqueness by density and both recurrences are imported, rather than repeated: Γ_p(x+1)=−xΓ_p(x) on units and −Γ_p(x) on pZ_p. Morita's 1975 source writes an unsigned natural product before extending the signed one; the convention here is the signed continuous function. The all-prime recurrences include 2. This satisfies the Gamma part of RT-AREA-iwasawa-2/1 through the existing owner nodes.

For odd p the predecessor constructs π in the actual local integer ring with π^(p−1)=−p and π=t+t²a, t=ζ−1. This pass adds the integral bridge: 1+ta is a unit, so (π)=(t) and (π²)=(t²). Hence ζ≡1+π modulo π², exactly the compatible additive-root convention requested by the red-team finding. Congruence in a field is vacuous and is not used. At 2 take π=−2 and ζ=−1; both equations are exact. The 1979 Gross–Koblitz paper assumes odd p, so its theorem is not cited as a dyadic proof.

The actual negative Gauss sum and Robert comparison are the inherited declarations. They retain the precise RD.6 coefficient estimate and splitting-value equality for the actual Dwork series and actual Teichmüller lift. The chosen additive root cannot be dropped. The negative Gauss sum at exponents 0 and q−1 is 1; the theorem's range 0≤a<q−1 excludes the upper endpoint. For q=2 only exponent 0 is in that range. The general dyadic formula stays conditional on the all-prime RD.6 exports. These dependencies are the predecessor's open requests, not a repeated construction.

## Ferrero–Greenberg: finite periods to a derivative

Let χ be primitive odd of conductor N>1 prime to p, and let θ=χω_p be the even p-adic character. At 2, ω_2 has conductor 4. Use the actual Morita Gamma and the common normalized log; a/N is the native integral element a times the inverse of the unit N. Define the finite Gamma sum

\[
 S_\Gamma=\sum_{1\le a<N}\chi(a)\log_p\Gamma_p(a/N),
 \qquad B_{1,\chi}=N^{-1}\sum_{1\le a<N}\chi(a)a.
\]

This is a new finite arithmetic adapter around the existing Gamma, not a new Gamma definition. Its API gives the exact sum, invariance under agreement of the logarithms at these values, and zero-log degeneration. The last is a deliberate non-example: arbitrary supplied Gamma/log data cannot prove arithmetic nonvanishing.

Zhao's primary proof gives a declaration-level route that does not import the derivative formula itself. First identify the native measure of rational Amice kernel Σχ(a)(1+T)^a/((1+T)^N−1) with the existing tame measure, including the precise sign and x-weight. For its cylinder at m+p^rZ_p the period is

\[
 \mu_\chi(m+p^r\mathbf Z_p)=N^{-1}\sum_{1\le a<N}\chi(m+p^ra)a.
\]

When p^r≡1 modulo N this is B_(1,χ)+Σ_(1≤a<m_N^flat)χ(a), with the flat residue in [0,N). The actual Riemann-sum comparison gives −L_p(χω,−s) as the limit of the character-weighted sums of angle(m)^s. The constant period contribution tends to zero. For the outer χ-weighted sum one may replace flat by positive residues; the only difference comes from multiples of N and its outer coefficient is Σχ(a)=0. This does not give the same individual flat-residue limit.

Choose f>0 with p^f≡1 modulo N and B=p^(fn). On M={1≤m<B:p∤m}, write m=a+hN with a=m_N^sharp in {1,…,N}. The actual finite permutation is

\[
 \iota(m)=h+1+(N-a)(B-1)/N.
\]

Separate declarations prove its range, congruence Nι(m)≡m modulo B, injectivity and the filtration equivalence a_0<m_N^sharp iff Nι(m)<(N−a_0)B. These supply a native finite equivalence. At p=5,N=3,B=25 the tests require 1↦17, 3↦1 and 24↦8, detecting the positive-residue endpoint. For B≤1 the interval is empty. For N=1 the formula is the identity, although it is outside the arithmetic conductor hypothesis.

The normalized continuous counting antidifference is

\[
 C_p(x)=x-1-V(x-1),\qquad
 V(y)=\frac{y-a_0(y)}p,
\]

where a_0 is the existing native reduction digit. Its natural value counts 1≤m<n prime to p; its normalization is C_p(0)=0. The second antidifference is log_p Γ_p(x), with value 0 at 0 and difference log_p x on units, zero on nonunits. This follows from the two inherited Morita recurrences. Generic continuous-antidifference existence and uniqueness belong to LAD L1 and are requested via native Mahler coefficient shift.

Reindexing the first logarithmic coefficient gives

\[
 \lim_n\sum_{m\in M_n,\ m_N^\sharp>a}\log_p m
    =C_p(a/N)\log_p N+\log_p\Gamma_p(a/N).
\]

The strict upper bound after reindexing has ceiling ((N−a)B_n+a)/N, which tends p-adically to a/N. The congruent unit logarithms differ uniformly by a quantity tending to zero. Ultrametric finite summation contributes no real cardinality factor. Appendix B.2 prints an inconsistent upper endpoint and Γ_p(x+1); finding E37 corrects these to m<n and Γ_p(x). Equation (4.4) already has the correct Gamma argument. At p=5,x=2 the corrected value is 0, while the printed value is log_5(2)≠0. The version-of-record page and preprint were collated; no correction was found in the publisher metadata, arXiv history or author article list.

Differentiation requires more than pointwise convergence. For every k the logarithmic coefficient limit is obtained from the same continuous-antidifference method. Unit logs have norm at most δ=1/p for odd p and δ=1/4 at 2. Their Taylor coefficients are uniformly bounded by Cδ^k/||k!||. On a closed radius r with rδ<p^(−1/(p−1)), this is a summable majorant, and the requested LAD analytic coefficient-limit theorem justifies the first derivative. The left side −L_p(−s) has first derivative +L_p′(0). The count-character carry calculation then proves

\[
 \sum_{1\le a<N}\chi(a)C_p(a/N)=(1-\chi(p))B_{1,\chi}.
\]

Consequently the full derivative formula is

\[
 L_p'(\chi\omega,0)=S_\Gamma
      +(1-\chi(p))B_{1,\chi}\log_p N
    =S_\Gamma-(1-\chi(p))L(\chi,0)\log_p N.
\]

RT-AREA-iwasawa-2/2 is thus handled after Leopoldt's formula, with the actual even character χω, the Gamma/log convention and the explicit Euler correction. Under the exceptional hypothesis χ(p)=1, interpolation gives L_p(χω,0)=0 and the derivative formula reduces to S_Γ. These are separate declarations.

## Arithmetic nonvanishing and open work

Nonvanishing is a distinct arithmetic theorem. When χ(p)=1, group Gamma factors in p-orbits and apply the inherited chosen-root Gross–Koblitz comparison. The common logarithm of π vanishes because π^(p−1)=−p, so S_Γ is the χ-weighted log projection of actual algebraic negative Gauss sums. There is no factor 1/f: an orbit product already accounts for its Gamma sum.

Gross–Dasgupta cites Brumer for the nonvanishing consequence, but its account does not decompose the necessary χ-projection of Gauss/Jacobi ideal relations. The packet requests the generic ideal factorization from IntegralIwasawaTheory L0 and Baker–Brumer independence from L4. A recorded Dirichlet gap must produce a multiplicatively independent basis modulo the normalized log-kernel and prove that the primitive odd χ-weight vector is nonzero. The independence theorem alone cannot prove that fact. Only after this arithmetic input does analyticity, the interpolation zero and nonzero derivative give analytic order 1 at zero. No unconditional nonvanishing is claimed by a scalar prototype.

The eight requests also include PMIA L0a/L3 standard chart and finite-extension admissible evaluation, PMIA L2 actual cylinder/rotation comparisons, and three precise LAD L1 analytic/difference/limit exports. The predecessor's RD.6 inputs and Kubert source frontier remain open, with its original gaps and requests intact. The target ledger is planned; a follow-up must resolve these interfaces and the arithmetic projection, then refine the inherited Kubert strand.

## Declaration ledger, API and acceptance tests

Every declaration below realizes L3. Names carry the fresh `rjw2-` prefix in the packet so they cannot replace predecessor nodes. The nine definitions each have three promoted API lemma nodes and at least three tests. The tests use native Dirac evaluation, exact central coefficients, sign and dyadic boundaries, the forbidden zero-denominator point, natural counts and the finite permutation examples. The suggested file is a native signature probe; when actual supplier objects are unavailable, it exposes conditional scalar consequences and identifies that boundary. The suggested file elaborated on 2026-10-05 at the pinned Mathlib, with only the expected placeholder warnings. Elaboration checks the types of these probes and proves none of the planned mathematics.


### The RJW integral test character

**DirichletPadicLFunctions:L3/rjw2-rjw-test** · definition

For s∈Z_p define κ_s(u)=ν(u) κ_r((1−s)h(u)) as a native continuous test function; κ_r is the existing Mahler additive character with κ_r(1)=1+r. For the standard chart r=gamma−1 this is ν(u)angle(u)^(1−s).

Hypotheses: p is prime; U is the existing topological unit group of Z_p. K is a complete ultrametric finite extension of Q_p with compatible native scalar maps. Measures are native AbstractMeasure U K K, not real-valued measures. The standard chart has torsion factor omega_p and angular coordinate gamma^h(u), with gamma=1+p for odd p, and sign omega_2 of conductor4 and gamma=5 for p=2. Its continuous additive coordinate h:U→Z_p is imported from PMIA L0a. A supplied arbitrary h gives only the displayed adapter, not the arithmetic branch.

Proof: Multiply the finite continuous-character value by the pullback of the existing continuous additive character along u↦(1−s)h(u). The imported chart and density of natural exponents identify the second factor with the actual angular power. No log at arbitrary unit is needed to define this integral family.

Dependencies: `mathlib:PadicInt.addChar_of_value_at_one`, `mathlib:PadicInt.continuous_addChar_of_value_at_one`, `PadicMeasuresIwasawaAlgebras:L0a`.

Acceptance: For s∈Z_p define κ_s(u)=ν(u) κ_r((1−s)h(u)) as a native continuous test function; κ_r is the existing Mahler additive character with κ_r(1)=1+r. For the standard chart r=gamma−1 this is ν(u)angle(u)^(1−s).


API:

- `DirichletL3.rjw_test_apply`: κ_s(u)=ν(u)κ_r((1−s)h(u)).
- `DirichletL3.rjw_test_one`: κ_1=ν.
- `DirichletL3.rjw_test_mul`: If ν(uv)=ν(u)ν(v) and h(uv)=h(u)+h(v), then κ_s(uv)=κ_s(u)κ_s(v).

Tests:

- `DirichletL3Tests.rjw_test_weight_one` (degenerate): At weight s=1 the angular factor is1 and κ_1(u)=ν(u).
- `DirichletL3Tests.rjw_test_zero_chart` (non-example): For h=0, κ_s=ν for every s, so no arithmetic chart is claimed.
- `DirichletL3Tests.rjw_test_torsion` (compatibility): If h(u)=0, κ_s(u)=ν(u), preserving the torsion factor.
- `DirichletL3Tests.rjw_test_generator` (computation): If h(u)=1 and s=0, the actual angular test is ν(u)(1+r), so a constant-in-s adapter fails.

### The RJW integral test character: apply

**DirichletPadicLFunctions:L3/rjw2-rjw-test-apply** · lemma

κ_s(u)=ν(u)κ_r((1−s)h(u)).

Hypotheses: p is prime; U is the existing topological unit group of Z_p. K is a complete ultrametric finite extension of Q_p with compatible native scalar maps. Measures are native AbstractMeasure U K K, not real-valued measures. The standard chart has torsion factor omega_p and angular coordinate gamma^h(u), with gamma=1+p for odd p, and sign omega_2 of conductor4 and gamma=5 for p=2. Its continuous additive coordinate h:U→Z_p is imported from PMIA L0a. A supplied arbitrary h gives only the displayed adapter, not the arithmetic branch.

Proof: Unfold the continuous-map product and composition.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-test`.

Acceptance: κ_s(u)=ν(u)κ_r((1−s)h(u)).

### The RJW integral test character: one

**DirichletPadicLFunctions:L3/rjw2-rjw-test-one** · lemma

κ_1=ν.

Hypotheses: p is prime; U is the existing topological unit group of Z_p. K is a complete ultrametric finite extension of Q_p with compatible native scalar maps. Measures are native AbstractMeasure U K K, not real-valued measures. The standard chart has torsion factor omega_p and angular coordinate gamma^h(u), with gamma=1+p for odd p, and sign omega_2 of conductor4 and gamma=5 for p=2. Its continuous additive coordinate h:U→Z_p is imported from PMIA L0a. A supplied arbitrary h gives only the displayed adapter, not the arithmetic branch.

Proof: Use the native additive-character value at zero.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-test`.

Acceptance: κ_1=ν.

### The RJW integral test character: mul

**DirichletPadicLFunctions:L3/rjw2-rjw-test-mul** · lemma

If ν(uv)=ν(u)ν(v) and h(uv)=h(u)+h(v), then κ_s(uv)=κ_s(u)κ_s(v).

Hypotheses: p is prime; U is the existing topological unit group of Z_p. K is a complete ultrametric finite extension of Q_p with compatible native scalar maps. Measures are native AbstractMeasure U K K, not real-valued measures. The standard chart has torsion factor omega_p and angular coordinate gamma^h(u), with gamma=1+p for odd p, and sign omega_2 of conductor4 and gamma=5 for p=2. Its continuous additive coordinate h:U→Z_p is imported from PMIA L0a. A supplied arbitrary h gives only the displayed adapter, not the arithmetic branch.

Proof: Distribute (1−s) over h(u)+h(v), use AddChar.map_add_eq_mul, and commute scalar factors.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-test`.

Acceptance: If ν(uv)=ν(u)ν(v) and h(uv)=h(u)+h(v), then κ_s(uv)=κ_s(u)κ_s(v).

### The actual clearing numerator integral

**DirichletPadicLFunctions:L3/rjw2-rjw-numerator** · definition

N_μ(s)=μ(κ_s) for the preceding native test. In arithmetic uses μ is the actual coefficient-extended intrinsic numerator λ_a=(δ_a−δ_1)ζ from L1/L2; for a tame measure μ is its actual intrinsic restriction.

Hypotheses: p is prime; U is the existing topological unit group of Z_p. K is a complete ultrametric finite extension of Q_p with compatible native scalar maps. Measures are native AbstractMeasure U K K, not real-valued measures. The standard chart has torsion factor omega_p and angular coordinate gamma^h(u), with gamma=1+p for odd p, and sign omega_2 of conductor4 and gamma=5 for p=2. Its continuous additive coordinate h:U→Z_p is imported from PMIA L0a. A supplied arbitrary h gives only the displayed adapter, not the arithmetic branch.

Proof: Apply the existing continuous dual to the test, keeping the arithmetic numerator supplied by L1/L2 visible.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-test`, `mathlib:AbstractMeasure`, `mathlib:AbstractMeasure.dirac_apply`.

Acceptance: N_μ(s)=μ(κ_s) for the preceding native test. In arithmetic uses μ is the actual coefficient-extended intrinsic numerator λ_a=(δ_a−δ_1)ζ from L1/L2; for a tame measure μ is its actual intrinsic restriction.


API:

- `DirichletL3.rjw_numerator_apply`: N_μ(s)=μ(κ_s).
- `DirichletL3.rjw_numerator_one`: N_μ(1)=μ(ν).
- `DirichletL3.rjw_numerator_add`: N_(μ+η)(s)=N_μ(s)+N_η(s).

Tests:

- `DirichletL3Tests.rjw_numerator_zero` (degenerate): The zero measure has identically zero numerator.
- `DirichletL3Tests.rjw_numerator_dirac` (computation): For δ_u, N(s)=κ_s(u), detecting a missing angular or finite factor.
- `DirichletL3Tests.rjw_numerator_mass` (compatibility): With ν=1 at s=1, N(1) is actual total mass.

### The actual clearing numerator integral: apply

**DirichletPadicLFunctions:L3/rjw2-rjw-numerator-apply** · lemma

N_μ(s)=μ(κ_s).

Hypotheses: p is prime; U is the existing topological unit group of Z_p. K is a complete ultrametric finite extension of Q_p with compatible native scalar maps. Measures are native AbstractMeasure U K K, not real-valued measures. The standard chart has torsion factor omega_p and angular coordinate gamma^h(u), with gamma=1+p for odd p, and sign omega_2 of conductor4 and gamma=5 for p=2. Its continuous additive coordinate h:U→Z_p is imported from PMIA L0a. A supplied arbitrary h gives only the displayed adapter, not the arithmetic branch.

Proof: Unfold only this arithmetic adapter.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-numerator`.

Acceptance: N_μ(s)=μ(κ_s).

### The actual clearing numerator integral: one

**DirichletPadicLFunctions:L3/rjw2-rjw-numerator-one** · lemma

N_μ(1)=μ(ν).

Hypotheses: p is prime; U is the existing topological unit group of Z_p. K is a complete ultrametric finite extension of Q_p with compatible native scalar maps. Measures are native AbstractMeasure U K K, not real-valued measures. The standard chart has torsion factor omega_p and angular coordinate gamma^h(u), with gamma=1+p for odd p, and sign omega_2 of conductor4 and gamma=5 for p=2. Its continuous additive coordinate h:U→Z_p is imported from PMIA L0a. A supplied arbitrary h gives only the displayed adapter, not the arithmetic branch.

Proof: Use rjw_test_one.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-numerator`.

Acceptance: N_μ(1)=μ(ν).

### The actual clearing numerator integral: add

**DirichletPadicLFunctions:L3/rjw2-rjw-numerator-add** · lemma

N_(μ+η)(s)=N_μ(s)+N_η(s).

Hypotheses: p is prime; U is the existing topological unit group of Z_p. K is a complete ultrametric finite extension of Q_p with compatible native scalar maps. Measures are native AbstractMeasure U K K, not real-valued measures. The standard chart has torsion factor omega_p and angular coordinate gamma^h(u), with gamma=1+p for odd p, and sign omega_2 of conductor4 and gamma=5 for p=2. Its continuous additive coordinate h:U→Z_p is imported from PMIA L0a. A supplied arbitrary h gives only the displayed adapter, not the arithmetic branch.

Proof: Apply the native pointwise additive measure law.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-numerator`.

Acceptance: N_(μ+η)(s)=N_μ(s)+N_η(s).

### The arithmetic clearing quotient

**DirichletPadicLFunctions:L3/rjw2-rjw-cleared** · definition

On κ_s(a)≠1 set Q_a(s)=N_(λ_a)(s)/(κ_s(a)−1). Its native totalized scalar formula is also defined elsewhere, but a zero-denominator value is never an L-value.

Hypotheses: p is prime; U is the existing topological unit group of Z_p. K is a complete ultrametric finite extension of Q_p with compatible native scalar maps. Measures are native AbstractMeasure U K K, not real-valued measures. The standard chart has torsion factor omega_p and angular coordinate gamma^h(u), with gamma=1+p for odd p, and sign omega_2 of conductor4 and gamma=5 for p=2. Its continuous additive coordinate h:U→Z_p is imported from PMIA L0a. A supplied arbitrary h gives only the displayed adapter, not the arithmetic branch.

Proof: Divide the actual intrinsic numerator by the actual character clearing factor. The imported admissible pseudomeasure evaluation identifies this quotient on its nonvanishing locus. It extends only the Iwasawa pseudomeasure module, not the whole total quotient ring.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-numerator`, `DirichletPadicLFunctions:L3/rjw2-rjw-test`, `DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-clearing`, `PadicMeasuresIwasawaAlgebras:L3`.

Acceptance: On κ_s(a)≠1 set Q_a(s)=N_(λ_a)(s)/(κ_s(a)−1). Its native totalized scalar formula is also defined elsewhere, but a zero-denominator value is never an L-value.


API:

- `DirichletL3.rjw_cleared_apply`: Q_a(s)=N_μ(s)/(κ_s(a)−1).
- `DirichletL3.rjw_cleared_one`: If ν(a)≠1, Q_a(1)=μ(ν)/(ν(a)−1).
- `DirichletL3.rjw_cleared_cancel`: If κ_s(a)≠1, (κ_s(a)−1)Q_a(s)=N_μ(s).

Tests:

- `DirichletL3Tests.rjw_cleared_zero` (degenerate): A zero numerator measure gives a zero quotient on the admissible locus.
- `DirichletL3Tests.rjw_cleared_dirac` (computation): A Dirac numerator gives κ_s(u)/(κ_s(a)−1).
- `DirichletL3Tests.rjw_cleared_excluded_center` (non-example): When ν(a)=1 the totalized formula gives Q_a(1)=0, which is expressly excluded as a meromorphic value.

### The arithmetic clearing quotient: apply

**DirichletPadicLFunctions:L3/rjw2-rjw-cleared-apply** · lemma

Q_a(s)=N_μ(s)/(κ_s(a)−1).

Hypotheses: p is prime; U is the existing topological unit group of Z_p. K is a complete ultrametric finite extension of Q_p with compatible native scalar maps. Measures are native AbstractMeasure U K K, not real-valued measures. The standard chart has torsion factor omega_p and angular coordinate gamma^h(u), with gamma=1+p for odd p, and sign omega_2 of conductor4 and gamma=5 for p=2. Its continuous additive coordinate h:U→Z_p is imported from PMIA L0a. A supplied arbitrary h gives only the displayed adapter, not the arithmetic branch.

Proof: Unfold the scalar quotient.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-cleared`.

Acceptance: Q_a(s)=N_μ(s)/(κ_s(a)−1).

### The arithmetic clearing quotient: one

**DirichletPadicLFunctions:L3/rjw2-rjw-cleared-one** · lemma

If ν(a)≠1, Q_a(1)=μ(ν)/(ν(a)−1).

Hypotheses: p is prime; U is the existing topological unit group of Z_p. K is a complete ultrametric finite extension of Q_p with compatible native scalar maps. Measures are native AbstractMeasure U K K, not real-valued measures. The standard chart has torsion factor omega_p and angular coordinate gamma^h(u), with gamma=1+p for odd p, and sign omega_2 of conductor4 and gamma=5 for p=2. Its continuous additive coordinate h:U→Z_p is imported from PMIA L0a. A supplied arbitrary h gives only the displayed adapter, not the arithmetic branch.

Proof: Apply both weight-one numerator and test formulas; admissibility is retained.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-cleared`.

Acceptance: If ν(a)≠1, Q_a(1)=μ(ν)/(ν(a)−1).

### The arithmetic clearing quotient: cancel

**DirichletPadicLFunctions:L3/rjw2-rjw-cleared-cancel** · lemma

If κ_s(a)≠1, (κ_s(a)−1)Q_a(s)=N_μ(s).

Hypotheses: p is prime; U is the existing topological unit group of Z_p. K is a complete ultrametric finite extension of Q_p with compatible native scalar maps. Measures are native AbstractMeasure U K K, not real-valued measures. The standard chart has torsion factor omega_p and angular coordinate gamma^h(u), with gamma=1+p for odd p, and sign omega_2 of conductor4 and gamma=5 for p=2. Its continuous additive coordinate h:U→Z_p is imported from PMIA L0a. A supplied arbitrary h gives only the displayed adapter, not the arithmetic branch.

Proof: Cancel the nonzero field denominator.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-cleared`.

Acceptance: If κ_s(a)≠1, (κ_s(a)−1)Q_a(s)=N_μ(s).

### The numerator in the RJW s-coordinate

**DirichletPadicLFunctions:L3/rjw2-rjw-analytic-numerator** · definition

For the actual component Mellin series F and L=log_p(gamma), put N_F(s)=E(F,exp((1−s)L)−1). This is the arithmetic coordinate pullback of LAD’s component Mellin series.

Hypotheses: K is as in the integral branch. First form μν=AbstractMeasure.weight ν μ using PMIA L2, where ν:U→K is the full continuous finite-character value function, including its wild part. F is LAD L3’s component Mellin series of μν with trivial finite torsion character and the standard chart. Thus coeff_n F=μ(u↦ν(u) binom(h(u),n)); ν need not factor through the finite torsion group. E(F,t) means native FormalMultilinearSeries.ofScalarsSum(coeff F)(t), on ||t||<1. L=log_p(gamma); A=log_p(angle(a)); c is the finite-character value at a. The common logarithm is Coleman L0, normalized by log_p(p)=0. The exponential is the native NormedSpace.exp, with its p-adic convergence/derivative laws imported; no second exponential or logarithm is defined.

Proof: Absorb the full continuous ν, including any wild part, into μν by the existing measure weighting operator; apply LAD componentMellin to μν with trivial torsion factor. Its coefficient/evaluation formulas are μ(ν binom(h,n)) and μ(νκ_t(h)). Use the existing scalar-series evaluation and native exponential; retain the shift1−s. Convergence is proved separately; total series values outside their convergence domain are not arithmetic specializations.

Dependencies: `PadicMeasuresIwasawaAlgebras:L2/weight`, `PadicMeasuresIwasawaAlgebras:L2/weight-evaluation`, `LocallyAnalyticDistributions:L3/finite-character-component-mellin`, `LocallyAnalyticDistributions:L1/open-disc-native-radius`, `ColemanIntegration:L0/iwasawa-logarithm`, `mathlib:NormedSpace.exp`, `mathlib:FormalMultilinearSeries.ofScalarsSum`, `mathlib:PowerSeries.coeff`, `mathlib:PowerSeries.C`.

Acceptance: For the actual component Mellin series F and L=log_p(gamma), put N_F(s)=E(F,exp((1−s)L)−1). This is the arithmetic coordinate pullback of LAD’s component Mellin series.


API:

- `DirichletL3.rjw_analytic_numerator_apply`: N_F(s)=E(F,exp((1−s)L)−1).
- `DirichletL3.rjw_analytic_numerator_one`: N_F(1)=coeff_0 F.
- `DirichletL3.rjw_analytic_numerator_zero`: The zero power series gives zero numerator.

Tests:

- `DirichletL3Tests.rjw_analytic_numerator_constant` (computation): For constant series C b, N_F(s)=b for every s.
- `DirichletL3Tests.rjw_analytic_numerator_origin` (compatibility): At s=1 the numerator is the literal constant coefficient, without a minus sign.
- `DirichletL3Tests.rjw_analytic_numerator_zero_log` (degenerate): If L=0 the coordinate is identically0 and N_F is constant.
- `DirichletL3Tests.rjw_analytic_numerator_linear` (computation): For F=X the numerator is exp((1−s)L)−1; using only coeff0 would give0.

### The numerator in the RJW s-coordinate: apply

**DirichletPadicLFunctions:L3/rjw2-rjw-analytic-numerator-apply** · lemma

N_F(s)=E(F,exp((1−s)L)−1).

Hypotheses: K is as in the integral branch. First form μν=AbstractMeasure.weight ν μ using PMIA L2, where ν:U→K is the full continuous finite-character value function, including its wild part. F is LAD L3’s component Mellin series of μν with trivial finite torsion character and the standard chart. Thus coeff_n F=μ(u↦ν(u) binom(h(u),n)); ν need not factor through the finite torsion group. E(F,t) means native FormalMultilinearSeries.ofScalarsSum(coeff F)(t), on ||t||<1. L=log_p(gamma); A=log_p(angle(a)); c is the finite-character value at a. The common logarithm is Coleman L0, normalized by log_p(p)=0. The exponential is the native NormedSpace.exp, with its p-adic convergence/derivative laws imported; no second exponential or logarithm is defined.

Proof: Unfold the shifted coordinate adapter.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-analytic-numerator`.

Acceptance: N_F(s)=E(F,exp((1−s)L)−1).

### The numerator in the RJW s-coordinate: one

**DirichletPadicLFunctions:L3/rjw2-rjw-analytic-numerator-one** · lemma

N_F(1)=coeff_0 F.

Hypotheses: K is as in the integral branch. First form μν=AbstractMeasure.weight ν μ using PMIA L2, where ν:U→K is the full continuous finite-character value function, including its wild part. F is LAD L3’s component Mellin series of μν with trivial finite torsion character and the standard chart. Thus coeff_n F=μ(u↦ν(u) binom(h(u),n)); ν need not factor through the finite torsion group. E(F,t) means native FormalMultilinearSeries.ofScalarsSum(coeff F)(t), on ||t||<1. L=log_p(gamma); A=log_p(angle(a)); c is the finite-character value at a. The common logarithm is Coleman L0, normalized by log_p(p)=0. The exponential is the native NormedSpace.exp, with its p-adic convergence/derivative laws imported; no second exponential or logarithm is defined.

Proof: At s=1 the exponential argument is0 and the disc coordinate is0; evaluate the native scalar series at0.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-analytic-numerator`.

Acceptance: N_F(1)=coeff_0 F.

### The numerator in the RJW s-coordinate: zero

**DirichletPadicLFunctions:L3/rjw2-rjw-analytic-numerator-zero** · lemma

The zero power series gives zero numerator.

Hypotheses: K is as in the integral branch. First form μν=AbstractMeasure.weight ν μ using PMIA L2, where ν:U→K is the full continuous finite-character value function, including its wild part. F is LAD L3’s component Mellin series of μν with trivial finite torsion character and the standard chart. Thus coeff_n F=μ(u↦ν(u) binom(h(u),n)); ν need not factor through the finite torsion group. E(F,t) means native FormalMultilinearSeries.ofScalarsSum(coeff F)(t), on ||t||<1. L=log_p(gamma); A=log_p(angle(a)); c is the finite-character value at a. The common logarithm is Coleman L0, normalized by log_p(p)=0. The exponential is the native NormedSpace.exp, with its p-adic convergence/derivative laws imported; no second exponential or logarithm is defined.

Proof: Every coefficient and every scalar-series term iszero.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-analytic-numerator`.

Acceptance: The zero power series gives zero numerator.

### The finite-character clearing denominator

**DirichletPadicLFunctions:L3/rjw2-rjw-analytic-denominator** · definition

d_(c,A)(s)=c exp((1−s)A)−1, where c=ν(a) and A=log_p(angle(a)). For the principal component c=1; A is the smoothing logarithm, not automatically log_p(gamma).

Hypotheses: K is as in the integral branch. First form μν=AbstractMeasure.weight ν μ using PMIA L2, where ν:U→K is the full continuous finite-character value function, including its wild part. F is LAD L3’s component Mellin series of μν with trivial finite torsion character and the standard chart. Thus coeff_n F=μ(u↦ν(u) binom(h(u),n)); ν need not factor through the finite torsion group. E(F,t) means native FormalMultilinearSeries.ofScalarsSum(coeff F)(t), on ||t||<1. L=log_p(gamma); A=log_p(angle(a)); c is the finite-character value at a. The common logarithm is Coleman L0, normalized by log_p(p)=0. The exponential is the native NormedSpace.exp, with its p-adic convergence/derivative laws imported; no second exponential or logarithm is defined.

Proof: Apply the same RJW shift to the clearing character at its actual a. Use distinct letters L and A because the Mellin generator and smoothing unit can differ (notably gamma=5 and a=3 at p=2).

Dependencies: `mathlib:NormedSpace.exp`, `ColemanIntegration:L0/iwasawa-logarithm`.

Acceptance: d_(c,A)(s)=c exp((1−s)A)−1, where c=ν(a) and A=log_p(angle(a)). For the principal component c=1; A is the smoothing logarithm, not automatically log_p(gamma).


API:

- `DirichletL3.rjw_analytic_denominator_apply`: d(s)=c exp((1−s)A)−1.
- `DirichletL3.rjw_analytic_denominator_one`: d(1)=c−1.
- `DirichletL3.rjw_analytic_denominator_zero_log`: If A=0 the denominator is constantly c−1.

Tests:

- `DirichletL3Tests.rjw_analytic_denominator_principal_center` (degenerate): The principal denominator vanishes at s=1.
- `DirichletL3Tests.rjw_analytic_denominator_nonprincipal_center` (computation): With c=−1, its central value is−2, including in Q_2.
- `DirichletL3Tests.rjw_analytic_denominator_no_slope` (non-example): With c=1,A=0 the denominator is identically zero, so no pole conclusion can follow.
- `DirichletL3Tests.rjw_analytic_denominator_variable` (computation): At s=0,c=1, the value is exp(A)−1, detecting a constant denominator.

### The finite-character clearing denominator: apply

**DirichletPadicLFunctions:L3/rjw2-rjw-analytic-denominator-apply** · lemma

d(s)=c exp((1−s)A)−1.

Hypotheses: K is as in the integral branch. First form μν=AbstractMeasure.weight ν μ using PMIA L2, where ν:U→K is the full continuous finite-character value function, including its wild part. F is LAD L3’s component Mellin series of μν with trivial finite torsion character and the standard chart. Thus coeff_n F=μ(u↦ν(u) binom(h(u),n)); ν need not factor through the finite torsion group. E(F,t) means native FormalMultilinearSeries.ofScalarsSum(coeff F)(t), on ||t||<1. L=log_p(gamma); A=log_p(angle(a)); c is the finite-character value at a. The common logarithm is Coleman L0, normalized by log_p(p)=0. The exponential is the native NormedSpace.exp, with its p-adic convergence/derivative laws imported; no second exponential or logarithm is defined.

Proof: Unfold the denominator.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-analytic-denominator`.

Acceptance: d(s)=c exp((1−s)A)−1.

### The finite-character clearing denominator: one

**DirichletPadicLFunctions:L3/rjw2-rjw-analytic-denominator-one** · lemma

d(1)=c−1.

Hypotheses: K is as in the integral branch. First form μν=AbstractMeasure.weight ν μ using PMIA L2, where ν:U→K is the full continuous finite-character value function, including its wild part. F is LAD L3’s component Mellin series of μν with trivial finite torsion character and the standard chart. Thus coeff_n F=μ(u↦ν(u) binom(h(u),n)); ν need not factor through the finite torsion group. E(F,t) means native FormalMultilinearSeries.ofScalarsSum(coeff F)(t), on ||t||<1. L=log_p(gamma); A=log_p(angle(a)); c is the finite-character value at a. The common logarithm is Coleman L0, normalized by log_p(p)=0. The exponential is the native NormedSpace.exp, with its p-adic convergence/derivative laws imported; no second exponential or logarithm is defined.

Proof: Use exp(0)=1.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-analytic-denominator`.

Acceptance: d(1)=c−1.

### The finite-character clearing denominator: zero log

**DirichletPadicLFunctions:L3/rjw2-rjw-analytic-denominator-zero-log** · lemma

If A=0 the denominator is constantly c−1.

Hypotheses: K is as in the integral branch. First form μν=AbstractMeasure.weight ν μ using PMIA L2, where ν:U→K is the full continuous finite-character value function, including its wild part. F is LAD L3’s component Mellin series of μν with trivial finite torsion character and the standard chart. Thus coeff_n F=μ(u↦ν(u) binom(h(u),n)); ν need not factor through the finite torsion group. E(F,t) means native FormalMultilinearSeries.ofScalarsSum(coeff F)(t), on ||t||<1. L=log_p(gamma); A=log_p(angle(a)); c is the finite-character value at a. The common logarithm is Coleman L0, normalized by log_p(p)=0. The exponential is the native NormedSpace.exp, with its p-adic convergence/derivative laws imported; no second exponential or logarithm is defined.

Proof: The exponential argument is0.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-analytic-denominator`.

Acceptance: If A=0 the denominator is constantly c−1.

### The actual branch germ in RJW coordinates

**DirichletPadicLFunctions:L3/rjw2-rjw-analytic-branch** · definition

Q_(F,L,c,A)(s)=N_F(s)/d_(c,A)(s), interpreted on the nonvanishing denominator locus; for the arithmetic F this is the actual branch germ. The central scalar junk value does not assign a meromorphic value.

Hypotheses: K is as in the integral branch. First form μν=AbstractMeasure.weight ν μ using PMIA L2, where ν:U→K is the full continuous finite-character value function, including its wild part. F is LAD L3’s component Mellin series of μν with trivial finite torsion character and the standard chart. Thus coeff_n F=μ(u↦ν(u) binom(h(u),n)); ν need not factor through the finite torsion group. E(F,t) means native FormalMultilinearSeries.ofScalarsSum(coeff F)(t), on ||t||<1. L=log_p(gamma); A=log_p(angle(a)); c is the finite-character value at a. The common logarithm is Coleman L0, normalized by log_p(p)=0. The exponential is the native NormedSpace.exp, with its p-adic convergence/derivative laws imported; no second exponential or logarithm is defined.

Proof: Divide the two arithmetic coordinate pullbacks; identify with the actual clearing quotient through the integral-agreement and arithmetic-evaluation nodes.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-analytic-numerator`, `DirichletPadicLFunctions:L3/rjw2-rjw-analytic-denominator`, `LocallyAnalyticDistributions:L3/meromorphic-mellin-clearing`.

Acceptance: Q_(F,L,c,A)(s)=N_F(s)/d_(c,A)(s), interpreted on the nonvanishing denominator locus; for the arithmetic F this is the actual branch germ. The central scalar junk value does not assign a meromorphic value.


API:

- `DirichletL3.rjw_analytic_branch_apply`: Q(s)=N_F(s)/d(s).
- `DirichletL3.rjw_analytic_branch_one`: If c≠1, Q(1)=coeff_0 F/(c−1).
- `DirichletL3.rjw_analytic_branch_cancel`: At d(s)≠0, d(s)Q(s)=N_F(s).

Tests:

- `DirichletL3Tests.rjw_analytic_branch_zero` (degenerate): F=0 gives the zero scalar quotient.
- `DirichletL3Tests.rjw_analytic_branch_nonprincipal` (computation): For F=C 1,c=2, its value at1 is1.
- `DirichletL3Tests.rjw_analytic_branch_principal_junk` (non-example): For F=C 1,c=1, its totalized central value is0, while a nonzero derivative denominator yields a genuine pole.
- `DirichletL3Tests.rjw_analytic_branch_linear` (computation): With F=X,c=0 the denominator is−1 and Q(s)=1−exp((1−s)L); central-coefficient-only division fails.

### The actual branch germ in RJW coordinates: apply

**DirichletPadicLFunctions:L3/rjw2-rjw-analytic-branch-apply** · lemma

Q(s)=N_F(s)/d(s).

Hypotheses: K is as in the integral branch. First form μν=AbstractMeasure.weight ν μ using PMIA L2, where ν:U→K is the full continuous finite-character value function, including its wild part. F is LAD L3’s component Mellin series of μν with trivial finite torsion character and the standard chart. Thus coeff_n F=μ(u↦ν(u) binom(h(u),n)); ν need not factor through the finite torsion group. E(F,t) means native FormalMultilinearSeries.ofScalarsSum(coeff F)(t), on ||t||<1. L=log_p(gamma); A=log_p(angle(a)); c is the finite-character value at a. The common logarithm is Coleman L0, normalized by log_p(p)=0. The exponential is the native NormedSpace.exp, with its p-adic convergence/derivative laws imported; no second exponential or logarithm is defined.

Proof: Unfold the branch quotient.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-analytic-branch`.

Acceptance: Q(s)=N_F(s)/d(s).

### The actual branch germ in RJW coordinates: one

**DirichletPadicLFunctions:L3/rjw2-rjw-analytic-branch-one** · lemma

If c≠1, Q(1)=coeff_0 F/(c−1).

Hypotheses: K is as in the integral branch. First form μν=AbstractMeasure.weight ν μ using PMIA L2, where ν:U→K is the full continuous finite-character value function, including its wild part. F is LAD L3’s component Mellin series of μν with trivial finite torsion character and the standard chart. Thus coeff_n F=μ(u↦ν(u) binom(h(u),n)); ν need not factor through the finite torsion group. E(F,t) means native FormalMultilinearSeries.ofScalarsSum(coeff F)(t), on ||t||<1. L=log_p(gamma); A=log_p(angle(a)); c is the finite-character value at a. The common logarithm is Coleman L0, normalized by log_p(p)=0. The exponential is the native NormedSpace.exp, with its p-adic convergence/derivative laws imported; no second exponential or logarithm is defined.

Proof: Apply the two central-value lemmas.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-analytic-branch`.

Acceptance: If c≠1, Q(1)=coeff_0 F/(c−1).

### The actual branch germ in RJW coordinates: cancel

**DirichletPadicLFunctions:L3/rjw2-rjw-analytic-branch-cancel** · lemma

At d(s)≠0, d(s)Q(s)=N_F(s).

Hypotheses: K is as in the integral branch. First form μν=AbstractMeasure.weight ν μ using PMIA L2, where ν:U→K is the full continuous finite-character value function, including its wild part. F is LAD L3’s component Mellin series of μν with trivial finite torsion character and the standard chart. Thus coeff_n F=μ(u↦ν(u) binom(h(u),n)); ν need not factor through the finite torsion group. E(F,t) means native FormalMultilinearSeries.ofScalarsSum(coeff F)(t), on ||t||<1. L=log_p(gamma); A=log_p(angle(a)); c is the finite-character value at a. The common logarithm is Coleman L0, normalized by log_p(p)=0. The exponential is the native NormedSpace.exp, with its p-adic convergence/derivative laws imported; no second exponential or logarithm is defined.

Proof: Cancel the nonzero denominator.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-analytic-branch`.

Acceptance: At d(s)≠0, d(s)Q(s)=N_F(s).

### The corrected inverse Teichmüller twist

**DirichletPadicLFunctions:L3/rjw2-inverse-teichmuller** · lemma

For χ the p-part of θ, u=omega(u)angle(u), and k≥1, χ(u)omega(u)^(-1)angle(u)^(k−1)=χ(u)omega(u)^(-k)u^(k−1). Consequently the measure form is ∫χω^(-1)angle^(-s)dμ_eta, whereas the zeta-measure form is ∫χ angle^(1−s)dζ_eta.

Hypotheses: p is prime; U is the existing topological unit group of Z_p. K is a complete ultrametric finite extension of Q_p with compatible native scalar maps. Measures are native AbstractMeasure U K K, not real-valued measures. The standard chart has torsion factor omega_p and angular coordinate gamma^h(u), with gamma=1+p for odd p, and sign omega_2 of conductor4 and gamma=5 for p=2. Its continuous additive coordinate h:U→Z_p is imported from PMIA L0a. A supplied arbitrary h gives only the displayed adapter, not the arithmetic branch.

Proof: Expand u=omega(u)angle(u), use commutativity and the integer exponent laws. Use x μ_eta=ζ_eta from L2 to move the unit x factor. The source integral missing omega^(-1) is E14, already independently confirmed; the displayed equality preceding it is correct.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-test`, `DirichletPadicLFunctions:L3/teichmuller-angular`, `DirichletPadicLFunctions:L3/dyadic-angular`.

Acceptance: At k=1 in the mathematical indexing the correct measure integrand is χω^(-1), not χ. The same group identity holds for the sign omega_2; no modulus p−1 is used at2.

### Integer points of the actual family

**DirichletPadicLFunctions:L3/rjw2-integral-character-integers** · lemma

With the standard chart and ν=χ, κ_(1−k)(u)=χ(u)angle(u)^k. For the weight by x^(-1), this becomes χω^(-k)(u)u^(k−1), with k≥1.

Hypotheses: p is prime; U is the existing topological unit group of Z_p. K is a complete ultrametric finite extension of Q_p with compatible native scalar maps. Measures are native AbstractMeasure U K K, not real-valued measures. The standard chart has torsion factor omega_p and angular coordinate gamma^h(u), with gamma=1+p for odd p, and sign omega_2 of conductor4 and gamma=5 for p=2. Its continuous additive coordinate h:U→Z_p is imported from PMIA L0a. A supplied arbitrary h gives only the displayed adapter, not the arithmetic branch.

Proof: Native AddChar agrees with (1+r)^n at natural n by induction from its value at1. Use the actual chart equation gamma^h=angle and its commutation with multiplication of the exponent, supplied by PMIA. Apply the inverse-Teichmüller identity after multiplying by the inverse unit.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-test`, `DirichletPadicLFunctions:L3/rjw2-inverse-teichmuller`, `mathlib:PadicInt.addChar_of_value_at_one_def`.

Acceptance: With the standard chart and ν=χ, κ_(1−k)(u)=χ(u)angle(u)^k. For the weight by x^(-1), this becomes χω^(-k)(u)u^(k−1), with k≥1.

### Identification with actual admissible evaluation

**DirichletPadicLFunctions:L3/rjw2-arithmetic-evaluation** · lemma

For the arithmetic pseudomeasure ζ_eta and its actual λ_a, the character κ_s bundled by rjw-test-mul is nontrivial whenever κ_s(a)≠1, and its imported admissible evaluation equals rjwCleared(λ_a,s). For D>1 one may instead integrate κ_s directly against the actual tame zeta measure.

Hypotheses: p is prime; U is the existing topological unit group of Z_p. K is a complete ultrametric finite extension of Q_p with compatible native scalar maps. Measures are native AbstractMeasure U K K, not real-valued measures. The standard chart has torsion factor omega_p and angular coordinate gamma^h(u), with gamma=1+p for odd p, and sign omega_2 of conductor4 and gamma=5 for p=2. Its continuous additive coordinate h:U→Z_p is imported from PMIA L0a. A supplied arbitrary h gives only the displayed adapter, not the arithmetic branch.

Proof: For D=1 use the PMIA evaluation law at the actual clearing factor and its coefficient-extension compatibility. For D>1 use the existing intrinsic tame-character-value definition after bundling exactly κ_s; no second tame measure is constructed. Keep the finite-extension coefficient interface as an open request; the Q_p-valued PMIA node does not supply K-valued evaluation.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-cleared`, `DirichletPadicLFunctions:L3/rjw2-rjw-test-mul`, `DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-clearing`, `DirichletPadicLFunctions:L3/tame-character-value`, `PadicMeasuresIwasawaAlgebras:L3`.

Acceptance: For the arithmetic pseudomeasure ζ_eta and its actual λ_a, the character κ_s bundled by rjw-test-mul is nontrivial whenever κ_s(a)≠1, and its imported admissible evaluation equals rjwCleared(λ_a,s). For D>1 one may instead integrate κ_s directly against the actual tame zeta measure.

### Independence of the arithmetic smoothing choice

**DirichletPadicLFunctions:L3/rjw2-clearing-independence** · lemma

For actual numerators λ_a,λ_b of the same pseudomeasure, Q_a(s)=Q_b(s) wherever both clearing factors are nonzero.

Hypotheses: p is prime; U is the existing topological unit group of Z_p. K is a complete ultrametric finite extension of Q_p with compatible native scalar maps. Measures are native AbstractMeasure U K K, not real-valued measures. The standard chart has torsion factor omega_p and angular coordinate gamma^h(u), with gamma=1+p for odd p, and sign omega_2 of conductor4 and gamma=5 for p=2. Its continuous additive coordinate h:U→Z_p is imported from PMIA L0a. A supplied arbitrary h gives only the displayed adapter, not the arithmetic branch.

Proof: Evaluate the commuting double-clearing identity (δ_b−1)λ_a=(δ_a−1)λ_b at the genuine character. Cancel the two nonzero scalar factors, using the same finite-extension evaluation homomorphism in both numerators.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-arithmetic-evaluation`, `DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-clearing`.

Acceptance: Changing a must change the actual numerator as well as the denominator.

### Interpolation in the RJW convention

**DirichletPadicLFunctions:L3/rjw2-branch-interpolation** · theorem

For a primitive nontrivial θ=χ eta, conductor Dp^n, and k≥1, the actual branch obeys L_p(θ,1−k)=(1−ψ(p)p^(k−1)) L(ψ,1−k), where ψ is the primitive inducer of θ omega^(-k). Interpret the complex value through its common algebraic generalized-Bernoulli value, with specified embeddings; no map C→K is used.

Hypotheses: p is prime; U is the existing topological unit group of Z_p. K is a complete ultrametric finite extension of Q_p with compatible native scalar maps. Measures are native AbstractMeasure U K K, not real-valued measures. The standard chart has torsion factor omega_p and angular coordinate gamma^h(u), with gamma=1+p for odd p, and sign omega_2 of conductor4 and gamma=5 for p=2. Its continuous additive coordinate h:U→Z_p is imported from PMIA L0a. A supplied arbitrary h gives only the displayed adapter, not the arithmetic branch.

Proof: The test at1−k is exactly the algebraic-character test with inverse omega^k after the unit shift. Apply the two existing L2 common-value comparisons to the actual numerator or tame measure. If twisting changes the conductor, use its primitive inducer and its genuine evaluation at p for the Euler factor; do not retain a level-inflated zero value.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-integral-character-integers`, `DirichletPadicLFunctions:L3/rjw2-arithmetic-evaluation`, `DirichletPadicLFunctions:L2/pseudomeasure-common-character-value`, `DirichletPadicLFunctions:L2/intrinsic-tame-common-character-value`.

Acceptance: For a primitive nontrivial θ=χ eta, conductor Dp^n, and k≥1, the actual branch obeys L_p(θ,1−k)=(1−ψ(p)p^(k−1)) L(ψ,1−k), where ψ is the primitive inducer of θ omega^(-k). Interpret the complex value through its common algebraic generalized-Bernoulli value, with specified embeddings; no map C→K is used.

### The odd-prime congruence branch

**DirichletPadicLFunctions:L3/rjw2-zeta-congruence** · lemma

For odd p, i∈Z/(p−1) and k≥1 with k≡i mod(p−1), ζ_(p,i)(1−k)=(1−p^(k−1))ζ(1−k). Index the trivial component by i=0, corresponding to source i=p−1.

Hypotheses: p is prime; U is the existing topological unit group of Z_p. K is a complete ultrametric finite extension of Q_p with compatible native scalar maps. Measures are native AbstractMeasure U K K, not real-valued measures. The standard chart has torsion factor omega_p and angular coordinate gamma^h(u), with gamma=1+p for odd p, and sign omega_2 of conductor4 and gamma=5 for p=2. Its continuous additive coordinate h:U→Z_p is imported from PMIA L0a. A supplied arbitrary h gives only the displayed adapter, not the arithmetic branch.

Proof: The primitive inducer of omega^(i−k) is the conductor-one character, so its value at p is1. The common algebraic zeta value is−B_k/k. Specialize the exact interpolation formula; do not change the source s coordinate.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-branch-interpolation`, `DirichletPadicLFunctions:L1/arithmetic-positive-bernoulli`.

Acceptance: This Lean arithmetic specialization only displays the Euler factor; construction of the genuine branch is rjw-test/arithmetic-evaluation.

### The two integral dyadic branches

**DirichletPadicLFunctions:L3/rjw2-dyadic-branches** · lemma

For p=2, use omega_2(u)=±1 determined modulo4 and angle_2(u)∈1+4Z_2, gamma=5, and i∈{0,1}. Define ζ_(2,i)(s) by the same actual pseudomeasure character omega_2^i angle_2^(1−s). Its interpolation uses the primitive inducer of omega_2^(i−k), with congruence k≡i mod2. The sign component is identically zero; the principal component has the pole at1.

Hypotheses: p is prime; U is the existing topological unit group of Z_p. K is a complete ultrametric finite extension of Q_p with compatible native scalar maps. Measures are native AbstractMeasure U K K, not real-valued measures. The standard chart has torsion factor omega_p and angular coordinate gamma^h(u), with gamma=1+p for odd p, and sign omega_2 of conductor4 and gamma=5 for p=2. Its continuous additive coordinate h:U→Z_p is imported from PMIA L0a. A supplied arbitrary h gives only the displayed adapter, not the arithmetic branch.

Proof: The supplied dyadic chart has h(−1)=0 and finite sign(−1)=−1. The native Mahler character gives the principal factor for every s∈Z_2. Interpolate using the sign exponent modulo2, never modulo p−1=1. Evaluate the even pseudomeasure identity at the sign component: its value is its own negative. Cancel2 in Q_2, without calling2 an integral unit.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-test`, `DirichletPadicLFunctions:L3/rjw2-arithmetic-evaluation`, `DirichletPadicLFunctions:L3/rjw2-branch-interpolation`, `DirichletPadicLFunctions:L3/dyadic-angular-norm`, `DirichletPadicLFunctions:L1/arithmetic-pseudomeasure-even`.

Acceptance: At u=−1 the sign test equals−1 and principal test equals1. For k=1, the conductor-one Euler factor1−2^0 is0. The field quotient at sign c=−1 is allowed despite denominator−2 being a nonunit in Z_2.

### Agreement of native Mahler and analytic coordinates

**DirichletPadicLFunctions:L3/rjw2-analytic-coordinate-agreement** · lemma

On s∈Z_p, exp((1−s)log_p(gamma))=κ_(gamma−1)(1−s), and exp((1−s)A)=κ_(gamma−1)((1−s)h(a)). Hence the analytic numerator/denominator are the actual integral numerator/clearing factor on all integral points; their quotient agrees wherever admissible.

Hypotheses: K is as in the integral branch. First form μν=AbstractMeasure.weight ν μ using PMIA L2, where ν:U→K is the full continuous finite-character value function, including its wild part. F is LAD L3’s component Mellin series of μν with trivial finite torsion character and the standard chart. Thus coeff_n F=μ(u↦ν(u) binom(h(u),n)); ν need not factor through the finite torsion group. E(F,t) means native FormalMultilinearSeries.ofScalarsSum(coeff F)(t), on ||t||<1. L=log_p(gamma); A=log_p(angle(a)); c is the finite-character value at a. The common logarithm is Coleman L0, normalized by log_p(p)=0. The exponential is the native NormedSpace.exp, with its p-adic convergence/derivative laws imported; no second exponential or logarithm is defined.

Proof: At nonnegative integer exponents both sides are the same power of gamma. The requested exp/log identity on1+pZ_p (on1+4Z_2 at2), continuity and density give the identity on Z_p. Use LAD component-mellin-evaluation for μν with trivial torsion factor, then PMIA weight-evaluation and the actual chart h to identify μ(νκ_t(h)). This works for wild ν as well as torsion characters.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-analytic-numerator`, `DirichletPadicLFunctions:L3/rjw2-rjw-analytic-denominator`, `DirichletPadicLFunctions:L3/rjw2-rjw-cleared`, `LocallyAnalyticDistributions:L3/component-mellin-evaluation`, `PadicMeasuresIwasawaAlgebras:L2/weight-evaluation`, `PadicMeasuresIwasawaAlgebras:L0a`, `LocallyAnalyticDistributions:L1`.

Acceptance: On s∈Z_p, exp((1−s)log_p(gamma))=κ_(gamma−1)(1−s), and exp((1−s)A)=κ_(gamma−1)((1−s)h(a)). Hence the analytic numerator/denominator are the actual integral numerator/clearing factor on all integral points; their quotient agrees wherever admissible.

### Convergence and analyticity of the actual numerator

**DirichletPadicLFunctions:L3/rjw2-analytic-numerator-convergence** · lemma

For the actual bounded numerator μν=weight ν μ, ||coeff_n F||≤||μν.toCLMEquiv||≤||μ.toCLMEquiv|| ||ν||_sup. A finite-order character on U has ||ν||_sup=1. Thus F converges on every closed radiusρ<1, and N_F is K-analytic near s=1. This also yields analytic branches near any integral s where the exp coordinate remains in its convergence disc.

Hypotheses: K is as in the integral branch. First form μν=AbstractMeasure.weight ν μ using PMIA L2, where ν:U→K is the full continuous finite-character value function, including its wild part. F is LAD L3’s component Mellin series of μν with trivial finite torsion character and the standard chart. Thus coeff_n F=μ(u↦ν(u) binom(h(u),n)); ν need not factor through the finite torsion group. E(F,t) means native FormalMultilinearSeries.ofScalarsSum(coeff F)(t), on ||t||<1. L=log_p(gamma); A=log_p(angle(a)); c is the finite-character value at a. The common logarithm is Coleman L0, normalized by log_p(p)=0. The exponential is the native NormedSpace.exp, with its p-adic convergence/derivative laws imported; no second exponential or logarithm is defined.

Proof: Use the weighted native measure μν with trivial finite torsion factor in the owned component coefficient bound; precomposition by multiplication has operator norm at most ||ν||_sup. A finite-order character has values of norm1, even on wild units. Use the owned open-disc radius comparison, then the requested positive-radius exp analytic germ at0 and exp(0)=1. The coordinate is0 at1 and stays inside the open unit disc on a neighborhood; compose the two native analytic germs.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-analytic-numerator`, `LocallyAnalyticDistributions:L3/component-mellin-coefficient-bound`, `LocallyAnalyticDistributions:L3/component-mellin-open-disc`, `LocallyAnalyticDistributions:L1/open-disc-native-radius`, `LocallyAnalyticDistributions:L1`.

Acceptance: For the actual bounded numerator μν=weight ν μ, ||coeff_n F||≤||μν.toCLMEquiv||≤||μ.toCLMEquiv|| ||ν||_sup. A finite-order character on U has ||ν||_sup=1. Thus F converges on every closed radiusρ<1, and N_F is K-analytic near s=1. This also yields analytic branches near any integral s where the exp coordinate remains in its convergence disc.

### The analytic denominator and its derivative

**DirichletPadicLFunctions:L3/rjw2-denominator-derivative** · lemma

The denominator is K-analytic near1; d_(c,A)(1)=c−1 and d_(c,A)′(1)=−cA. In particular d_(1,A)′(1)=−A.

Hypotheses: K is as in the integral branch. First form μν=AbstractMeasure.weight ν μ using PMIA L2, where ν:U→K is the full continuous finite-character value function, including its wild part. F is LAD L3’s component Mellin series of μν with trivial finite torsion character and the standard chart. Thus coeff_n F=μ(u↦ν(u) binom(h(u),n)); ν need not factor through the finite torsion group. E(F,t) means native FormalMultilinearSeries.ofScalarsSum(coeff F)(t), on ||t||<1. L=log_p(gamma); A=log_p(angle(a)); c is the finite-character value at a. The common logarithm is Coleman L0, normalized by log_p(p)=0. The exponential is the native NormedSpace.exp, with its p-adic convergence/derivative laws imported; no second exponential or logarithm is defined.

Proof: Use the native exp germ at0 and derivative1 there, supplied with its p-adic convergence radius. Compose with (1−s)A, whose derivative is−A, and multiply by c; retain the minus sign from the RJW coordinate.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-analytic-denominator`, `LocallyAnalyticDistributions:L1`.

Acceptance: The denominator is K-analytic near1; d_(c,A)(1)=c−1 and d_(c,A)′(1)=−cA. In particular d_(1,A)′(1)=−A.

### The principal clearing denominator has a single zero

**DirichletPadicLFunctions:L3/rjw2-principal-denominator-simple-zero** · lemma

If A≠0, d_(1,A) has analytic order1 at1. There is an analytic b near1 with b(1)=−A≠0 and d_(1,A)(s)=(s−1)b(s); thus d≠0 on a sufficiently small punctured neighborhood.

Hypotheses: K is as in the integral branch. First form μν=AbstractMeasure.weight ν μ using PMIA L2, where ν:U→K is the full continuous finite-character value function, including its wild part. F is LAD L3’s component Mellin series of μν with trivial finite torsion character and the standard chart. Thus coeff_n F=μ(u↦ν(u) binom(h(u),n)); ν need not factor through the finite torsion group. E(F,t) means native FormalMultilinearSeries.ofScalarsSum(coeff F)(t), on ||t||<1. L=log_p(gamma); A=log_p(angle(a)); c is the finite-character value at a. The common logarithm is Coleman L0, normalized by log_p(p)=0. The exponential is the native NormedSpace.exp, with its p-adic convergence/derivative laws imported; no second exponential or logarithm is defined.

Proof: The analytic derivative calculation has nonzero first coefficient and zero constant coefficient. Factor out s−1 in the native analytic power series and identify the remaining constant with−A. Continuity of b and b(1)≠0 give the punctured nonvanishing locus.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-denominator-derivative`, `mathlib:AnalyticAt.analyticOrderAt_eq_natCast`.

Acceptance: If A≠0, d_(1,A) has analytic order1 at1. There is an analytic b near1 with b(1)=−A≠0 and d_(1,A)(s)=(s−1)b(s); thus d≠0 on a sufficiently small punctured neighborhood.

### Nontrivial components are analytic at one

**DirichletPadicLFunctions:L3/rjw2-nonprincipal-analytic** · lemma

For a nontrivial finite component choose an actual clearing unit a with c=ν(a)≠1. The numerator is analytic near1 and d(1)=c−1≠0, so its actual branch is analytic at1, with value coeff_0 F/(c−1).

Hypotheses: K is as in the integral branch. First form μν=AbstractMeasure.weight ν μ using PMIA L2, where ν:U→K is the full continuous finite-character value function, including its wild part. F is LAD L3’s component Mellin series of μν with trivial finite torsion character and the standard chart. Thus coeff_n F=μ(u↦ν(u) binom(h(u),n)); ν need not factor through the finite torsion group. E(F,t) means native FormalMultilinearSeries.ofScalarsSum(coeff F)(t), on ||t||<1. L=log_p(gamma); A=log_p(angle(a)); c is the finite-character value at a. The common logarithm is Coleman L0, normalized by log_p(p)=0. The exponential is the native NormedSpace.exp, with its p-adic convergence/derivative laws imported; no second exponential or logarithm is defined.

Proof: Native character nontriviality supplies a unit with ν(a)≠1; density supplies an integer smoothing parameter if desired. Use the two analytic germs and native AnalyticAt.div at the nonzero central denominator. The actual-evaluation comparison identifies this quotient as the branch, and clearing-independence makes its value canonical.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-arithmetic-evaluation`, `DirichletPadicLFunctions:L3/rjw2-analytic-numerator-convergence`, `DirichletPadicLFunctions:L3/rjw2-denominator-derivative`, `DirichletPadicLFunctions:L3/rjw2-rjw-analytic-branch-one`, `mathlib:AnalyticAt.div`, `PadicMeasuresIwasawaAlgebras:L0a`.

Acceptance: For a nontrivial finite component choose an actual clearing unit a with c=ν(a)≠1. The numerator is analytic near1 and d(1)=c−1≠0, so its actual branch is analytic at1, with value coeff_0 F/(c−1).

### The actual principal numerator at one

**DirichletPadicLFunctions:L3/rjw2-principal-numerator-value** · lemma

Take the canonical smoothing unit a=p+1, μ=λ_a from L1, and the principal Mellin series F. Then coeff_0 F=μ(1)=−(1−p^(-1))log_p(p+1). This is the arithmetic numerator, including p=2, where a=3 although gamma=5.

Hypotheses: K is as in the integral branch. First form μν=AbstractMeasure.weight ν μ using PMIA L2, where ν:U→K is the full continuous finite-character value function, including its wild part. F is LAD L3’s component Mellin series of μν with trivial finite torsion character and the standard chart. Thus coeff_n F=μ(u↦ν(u) binom(h(u),n)); ν need not factor through the finite torsion group. E(F,t) means native FormalMultilinearSeries.ofScalarsSum(coeff F)(t), on ||t||<1. L=log_p(gamma); A=log_p(angle(a)); c is the finite-character value at a. The common logarithm is Coleman L0, normalized by log_p(p)=0. The exponential is the native NormedSpace.exp, with its p-adic convergence/derivative laws imported; no second exponential or logarithm is defined.

Proof: The owned Mellin coefficient at0 is the literal constant-test mass of the actual intrinsic numerator. Use the inherited arithmetic mass/log-series theorem, with its explicit Coleman negative-moment supplier dependencies. It is not an abstract quotient-rule assumption. For p=2 log_p(angle_2(3))=log_p(−3)=log_p(3), since the common logarithm kills−1.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-rjw-numerator-one`, `DirichletPadicLFunctions:L3/rjw2-rjw-analytic-numerator-one`, `DirichletPadicLFunctions:L3/principal-numerator-logarithmic-series`, `LocallyAnalyticDistributions:L3/finite-character-component-mellin`.

Acceptance: Take the canonical smoothing unit a=p+1, μ=λ_a from L1, and the principal Mellin series F. Then coeff_0 F=μ(1)=−(1−p^(-1))log_p(p+1). This is the arithmetic numerator, including p=2, where a=3 although gamma=5.

### The auxiliary logarithm is nonzero

**DirichletPadicLFunctions:L3/rjw2-principal-log-nonzero** · lemma

For A=log_p(p+1) in Q_p, ||A||=1/p at odd p and1/4 at2, so A≠0. This exact inherited logarithmic-series result is reflected along the injective norm-preserving coefficient map into K.

Hypotheses: p is prime; U is the existing topological unit group of Z_p. K is a complete ultrametric finite extension of Q_p with compatible native scalar maps. Measures are native AbstractMeasure U K K, not real-valued measures. The standard chart has torsion factor omega_p and angular coordinate gamma^h(u), with gamma=1+p for odd p, and sign omega_2 of conductor4 and gamma=5 for p=2. Its continuous additive coordinate h:U→Z_p is imported from PMIA L0a. A supplied arbitrary h gives only the displayed adapter, not the arithmetic branch.

Proof: Use the inherited actual mass norm and its convergent log series, not a claim that log is injective on every unit. Both displayed real norms are positive, so the scalar is nonzero; injectivity preserves this in K.

Dependencies: `DirichletPadicLFunctions:L3/principal-logarithmic-series-norm`, `ColemanIntegration:L0/iwasawa-logarithm`.

Acceptance: At2 the first two terms of log(1+2) cancel; the odd-prime1/p norm must not be reused.

### The actual simple pole at one

**DirichletPadicLFunctions:L3/rjw2-principal-pole** · theorem

For the actual principal F and canonical A, rjwAnalyticBranch is meromorphic at1 and has native meromorphic order−1. It has analytic Laurent numerator H with H(1)=1−p^(-1)≠0 and Q(s)=H(s)/(s−1) on a punctured neighborhood.

Hypotheses: K is as in the integral branch. First form μν=AbstractMeasure.weight ν μ using PMIA L2, where ν:U→K is the full continuous finite-character value function, including its wild part. F is LAD L3’s component Mellin series of μν with trivial finite torsion character and the standard chart. Thus coeff_n F=μ(u↦ν(u) binom(h(u),n)); ν need not factor through the finite torsion group. E(F,t) means native FormalMultilinearSeries.ofScalarsSum(coeff F)(t), on ||t||<1. L=log_p(gamma); A=log_p(angle(a)); c is the finite-character value at a. The common logarithm is Coleman L0, normalized by log_p(p)=0. The exponential is the native NormedSpace.exp, with its p-adic convergence/derivative laws imported; no second exponential or logarithm is defined.

Proof: Factor the principal denominator as(s−1)b(s), with b analytic and b(1)=−A≠0. Set the analytic Laurent numerator to N_F/b, using native analytic division; its value is the actual mass divided by−A. Cancel A and use p≠0,1 to obtain H(1)=1−p^(-1)≠0. The native meromorphic quotient and order normal form show order−1, not merely a divergent limit.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-principal-numerator-value`, `DirichletPadicLFunctions:L3/rjw2-principal-log-nonzero`, `DirichletPadicLFunctions:L3/rjw2-principal-denominator-simple-zero`, `DirichletPadicLFunctions:L3/rjw2-analytic-numerator-convergence`, `DirichletPadicLFunctions:L3/rjw2-arithmetic-evaluation`, `mathlib:MeromorphicAt.div`, `mathlib:meromorphicOrderAt_eq_int_iff`.

Acceptance: For the actual principal F and canonical A, rjwAnalyticBranch is meromorphic at1 and has native meromorphic order−1. It has analytic Laurent numerator H with H(1)=1−p^(-1)≠0 and Q(s)=H(s)/(s−1) on a punctured neighborhood.

### The residue in the RJW s-coordinate

**DirichletPadicLFunctions:L3/rjw2-principal-residue** · lemma

For the same actual branch, lim_(s→1,s≠1)(s−1)Q(s)=1−p^(-1). This residue uses s in angle^(1−s), not Mellin exponent t=1−s, in which it changes sign.

Hypotheses: K is as in the integral branch. First form μν=AbstractMeasure.weight ν μ using PMIA L2, where ν:U→K is the full continuous finite-character value function, including its wild part. F is LAD L3’s component Mellin series of μν with trivial finite torsion character and the standard chart. Thus coeff_n F=μ(u↦ν(u) binom(h(u),n)); ν need not factor through the finite torsion group. E(F,t) means native FormalMultilinearSeries.ofScalarsSum(coeff F)(t), on ||t||<1. L=log_p(gamma); A=log_p(angle(a)); c is the finite-character value at a. The common logarithm is Coleman L0, normalized by log_p(p)=0. The exponential is the native NormedSpace.exp, with its p-adic convergence/derivative laws imported; no second exponential or logarithm is defined.

Proof: The analytic Laurent numerator supplied by principal-pole is continuous at1 and has its computed arithmetic central value. On the punctured nonvanishing locus (s−1)Q(s)=H(s); take the limit. This strengthens the inherited conditional limit by identifying an actual analytic germ.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-principal-pole`, `DirichletPadicLFunctions:L3/rjw2-principal-numerator-value`, `DirichletPadicLFunctions:L3/rjw2-denominator-derivative`, `DirichletPadicLFunctions:L3/principal-family-residue-limit`.

Acceptance: For the same actual branch, lim_(s→1,s≠1)(s−1)Q(s)=1−p^(-1). This residue uses s in angle^(1−s), not Mellin exponent t=1−s, in which it changes sign.

### Residue under a change of parameter

**DirichletPadicLFunctions:L3/rjw2-residue-coordinate-change** · lemma

For an analytic coordinate s=φ(t) with φ(t0)=1 and φ′(t0)=c≠0, the residue of the function Q(φ(t)) in t is(1−p^(-1))/c. The residue of the differential Q(s)ds remains1−p^(-1).

Hypotheses: K is as in the integral branch. First form μν=AbstractMeasure.weight ν μ using PMIA L2, where ν:U→K is the full continuous finite-character value function, including its wild part. F is LAD L3’s component Mellin series of μν with trivial finite torsion character and the standard chart. Thus coeff_n F=μ(u↦ν(u) binom(h(u),n)); ν need not factor through the finite torsion group. E(F,t) means native FormalMultilinearSeries.ofScalarsSum(coeff F)(t), on ||t||<1. L=log_p(gamma); A=log_p(angle(a)); c is the finite-character value at a. The common logarithm is Coleman L0, normalized by log_p(p)=0. The exponential is the native NormedSpace.exp, with its p-adic convergence/derivative laws imported; no second exponential or logarithm is defined.

Proof: Factor φ(t)−1=(t−t0)v(t), where v(t0)=c, using the same native analytic order-one normal form. Compose H and divide by v. Its central value is R/c. For the differential multiply the transformed function by φ′, cancelling c. This is a function-residue convention, not an invariant one.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-principal-pole`, `DirichletPadicLFunctions:L3/rjw2-principal-residue`, `mathlib:HasDerivAt`.

Acceptance: For φ(t)=1−t the function residue is−R. For φ(t)=1+2t in Q_2 the function residue isR/2;2 is a nonzero derivative although not an integral unit.

### The finite trace giving the tame Euler factor

**DirichletPadicLFunctions:L3/rjw2-tame-trace-euler** · lemma

For p∤N, the finite trace of the actual tame logarithmic primitive has value (φψFtilde)(0)=θ(p)p^(-1)C_θ. Thus the unit restriction has value(1−θ(p)p^(-1))C_θ.

Hypotheses: θ is nontrivial primitive of conductor N=Dp^n, D prime to p. K is a finite splitting extension containing the specified primitive root ε_N and θ-values; the Gauss sum G(θ^(-1)) uses that same root and is nonzero. Write C_θ=−G^(-1)Σ_units θ^(-1)(c)log_p(1−ε_N^c), the existing cyclotomic-logarithmic-constant, not a new definition. The complex logarithmic formula is already complex-lvalue-one-log; it is reused with N as its modulus. L_p is the actual RJW branch above. The common logarithm is imported from Coleman L0. Changing ε_N changes the Gauss sum simultaneously; there is no canonical identification of a complex transcendental value with a p-adic number. For D>1 the source primitive is Ftilde=C(C_η)+H_η, the inherited full primitive. H_η has constant0 and cannot supply C_η by itself. Tameness gives norm(D)=1, and inherited restrictedness plus the common-log local expansion identifies its actual analytic function.

Proof: For each unit c, the finite product over ξ∈μ_p of(ξε_N^c−1) equals ε_N^(pc)−1, up to a sign killed by the common logarithm; none of these factors vanishes because p∤N. The imported logarithm multiplicative law turns the product into the finite sum; this supplies the powered-constant identity required by the existing eigenvalue lemma. Reindex c↦pc among the native units modulo N; the inverse character contributes θ(p). The trace divides by p exactly once. No Coleman positive-polylog L-value theorem is used.

Dependencies: `DirichletPadicLFunctions:L3/normalized-tame-logarithmic-primitive`, `DirichletPadicLFunctions:L3/cyclotomic-logarithmic-constant`, `DirichletPadicLFunctions:L3/cyclotomic-powered-logarithmic-eigenvalue`, `ColemanIntegration:L0/iwasawa-logarithm`, `LocallyAnalyticDistributions:L1/division-by-x-and-primitives`, `DirichletPadicLFunctions:L3/tame-logarithmic-primitive-with-constant`, `DirichletPadicLFunctions:L3/tame-logarithmic-primitive-with-constant-derivative`, `DirichletPadicLFunctions:L3/tame-logarithmic-constant-restrictedness`, `DirichletPadicLFunctions:L3/rjw2-tame-log-realization`.

Acceptance: For p∤N, the finite trace of the actual tame logarithmic primitive has value (φψFtilde)(0)=θ(p)p^(-1)C_θ. Thus the unit restriction has value(1−θ(p)p^(-1))C_θ.

### The actual tame value at one

**DirichletPadicLFunctions:L3/rjw2-tame-value-one** · lemma

For D=N>1 and n=0, the actual L_p(θ,1)=(1−θ(p)p^(-1))C_θ.

Hypotheses: θ is nontrivial primitive of conductor N=Dp^n, D prime to p. K is a finite splitting extension containing the specified primitive root ε_N and θ-values; the Gauss sum G(θ^(-1)) uses that same root and is nonzero. Write C_θ=−G^(-1)Σ_units θ^(-1)(c)log_p(1−ε_N^c), the existing cyclotomic-logarithmic-constant, not a new definition. The complex logarithmic formula is already complex-lvalue-one-log; it is reused with N as its modulus. L_p is the actual RJW branch above. The common logarithm is imported from Coleman L0. Changing ε_N changes the Gauss sum simultaneously; there is no canonical identification of a complex transcendental value with a p-adic number. For D>1 the source primitive is Ftilde=C(C_η)+H_η, the inherited full primitive. H_η has constant0 and cannot supply C_η by itself. Tameness gives norm(D)=1, and inherited restrictedness plus the common-log local expansion identifies its actual analytic function.

Proof: Take the inherited full primitive Ftilde=C(C_θ)+H_θ, not the normalized H alone; its Mahler derivative is the actual μ_θ Amice transform, its constant is C_θ and its coefficients are restricted on every smaller disc. Apply tame-log-realization to identify its finite logarithmic function. The owned division-by-x theorem identifies the unit inverse moment with (1−φψ)Ftilde at0, independent of the primitive constant. Use the preceding explicit finite trace calculation. This is the logarithmic proof of RJW6.1, preceding Coleman6.7.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-arithmetic-evaluation`, `DirichletPadicLFunctions:L3/rjw2-tame-trace-euler`, `DirichletPadicLFunctions:L3/normalized-tame-logarithmic-derivative`, `LocallyAnalyticDistributions:L1/division-by-x-and-primitives`, `DirichletPadicLFunctions:L3/tame-logarithmic-primitive-with-constant`, `DirichletPadicLFunctions:L3/tame-logarithmic-primitive-with-constant-derivative`, `DirichletPadicLFunctions:L3/tame-logarithmic-constant-restrictedness`, `DirichletPadicLFunctions:L3/rjw2-tame-log-realization`.

Acceptance: For D=N>1 and n=0, the actual L_p(θ,1)=(1−θ(p)p^(-1))C_θ.

### The smoothed cyclotomic logarithm sum

**DirichletPadicLFunctions:L3/rjw2-power-smoothed-log-sum** · lemma

For primitive nontrivial χ of conductor q=p^n, n≥1, natural a>1 with p∤a, and the existing smoothed primitive Φ_a^(1), Σ_units χ^(-1)(c)Φ_a^(1)(ε_q^c)=(1−χ(a))Σ_units χ^(-1)(c)log_p(ε_q^c−1). Equivalently its Gauss-normalized value is(χ(a)−1)C_χ.

Hypotheses: θ is nontrivial primitive of conductor N=Dp^n, D prime to p. K is a finite splitting extension containing the specified primitive root ε_N and θ-values; the Gauss sum G(θ^(-1)) uses that same root and is nonzero. Write C_θ=−G^(-1)Σ_units θ^(-1)(c)log_p(1−ε_N^c), the existing cyclotomic-logarithmic-constant, not a new definition. The complex logarithmic formula is already complex-lvalue-one-log; it is reused with N as its modulus. L_p is the actual RJW branch above. The common logarithm is imported from Coleman L0. Changing ε_N changes the Gauss sum simultaneously; there is no canonical identification of a complex transcendental value with a p-adic number.

Proof: Use only k=1 of the already owned analytic smoothed primitive: Φ_a^(1)(z)=log_p(z−1)−log_p(z^a−1)+(a−1)log_p(z) off z=1, extended with value−log_p(a) at1. At the nontrivial unit-indexed q-th roots all separate arguments are nonzero, and log_p(z)=0. Reindex c↦ac; χ^(-1)(c)=χ(a)χ^(-1)(ac). Retain1−χ(a), which cancels the opposite sign in C_χ. This is a finite logarithmic argument, independent of the L-value theorem.

Dependencies: `ColemanIntegration:L3/smoothed-polylog-combination`, `DirichletPadicLFunctions:L3/cyclotomic-logarithmic-constant`, `ColemanIntegration:L0/iwasawa-logarithm`.

Acceptance: Replacing Φ_a by singular−log T at D=1 is forbidden (existing Coleman E17). The formula works at n=1; no n>1 assumption is used.

### Prime-power character cancellation of the unit trace

**DirichletPadicLFunctions:L3/rjw2-power-trace-zero** · lemma

For n≥1, primitive nontrivial χ modulo p^n, and any scalar function Φ on the root orbit, the χ^(-1)-weighted sum of B_c=p^(-1)Σ_(j<p)Φ(ε_(p^n)^c ε_p^j) is0.

Hypotheses: θ is nontrivial primitive of conductor N=Dp^n, D prime to p. K is a finite splitting extension containing the specified primitive root ε_N and θ-values; the Gauss sum G(θ^(-1)) uses that same root and is nonzero. Write C_θ=−G^(-1)Σ_units θ^(-1)(c)log_p(1−ε_N^c), the existing cyclotomic-logarithmic-constant, not a new definition. The complex logarithmic formula is already complex-lvalue-one-log; it is reused with N as its modulus. L_p is the actual RJW branch above. The common logarithm is imported from Coleman L0. Changing ε_N changes the Gauss sum simultaneously; there is no canonical identification of a complex transcendental value with a p-adic number.

Proof: At n=1 every B_c is the same full μ_p average; the nontrivial character sum is0. At n≥2, B_c is constant on fibers of units modulo p^n→units modulo p^(n−1). Primitivity says χ is nontrivial on this kernel, so each weighted fiber sum is0. The same finite calculation holds for p=2 when a nontrivial primitive character exists. The conductor2 case is empty; no primitive nontrivial character is invented there.

Dependencies: `DirichletPadicLFunctions:L2/prime-power-character-gauss`, `DirichletPadicLFunctions:L2/prime-power-character-support`, `ColemanIntegration:L3/smoothed-twist-as-sum-of-rotated-measures`, `mathlib:IsPrimitiveRoot`.

Acceptance: For n≥1, primitive nontrivial χ modulo p^n, and any scalar function Φ on the root orbit, the χ^(-1)-weighted sum of B_c=p^(-1)Σ_(j<p)Φ(ε_(p^n)^c ε_p^j) is0.

### Leopoldt’s formula for pure p-power conductor

**DirichletPadicLFunctions:L3/rjw2-power-value-one** · lemma

For primitive nontrivial χ of conductor p^n, n≥1, choose an actual integer smoothing parameter a with χ(a)≠1. Then the actual branch L_p(χ,1)=C_χ; χ(p)=0 gives exactly the Euler factor1.

Hypotheses: θ is nontrivial primitive of conductor N=Dp^n, D prime to p. K is a finite splitting extension containing the specified primitive root ε_N and θ-values; the Gauss sum G(θ^(-1)) uses that same root and is nonzero. Write C_θ=−G^(-1)Σ_units θ^(-1)(c)log_p(1−ε_N^c), the existing cyclotomic-logarithmic-constant, not a new definition. The complex logarithmic formula is already complex-lvalue-one-log; it is reused with N as its modulus. L_p is the actual RJW branch above. The common logarithm is imported from Coleman L0. Changing ε_N changes the Gauss sum simultaneously; there is no canonical identification of a complex transcendental value with a p-adic number.

Proof: The actual smoothing quotient at1 is(χ(a)−1)^(-1) times the inverse unit moment of the twisted actual μ_a. Use only the independent k=1 primitive/moment identity from Coleman, whose proof takes the actual smoothed measure and does not use the Dirichlet positive-value comparison. The rotated-smoothed Amice supplier remains explicit. Finite Gauss twisting, the trace-zero lemma and smoothed-log-sum identify the numerator as(χ(a)−1)C_χ. Cancel the nonzero factor. Existence of a follows from χ≠1 and density of positive p-units. Include n=1, repairing the printed n>1 omission recorded as Coleman E19.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-arithmetic-evaluation`, `DirichletPadicLFunctions:L3/rjw2-power-smoothed-log-sum`, `DirichletPadicLFunctions:L3/rjw2-power-trace-zero`, `ColemanIntegration:L3/negative-moments-of-smoothed-measure`.

Acceptance: For primitive nontrivial χ of conductor p^n, n≥1, choose an actual integer smoothing parameter a with χ(a)≠1. Then the actual branch L_p(χ,1)=C_χ; χ(p)=0 gives exactly the Euler factor1.

### The ramified comparison with nontrivial tame conductor

**DirichletPadicLFunctions:L3/rjw2-mixed-value-one** · lemma

For D>1, n≥1 and θ=χ eta primitive, the actual twisted tame measure is unit-supported and L_p(θ,1)=C_θ, because θ(p)=0. Its logarithmic primitive is the positive G(χ^(-1))^(-1) finite twist of the actual tame primitive.

Hypotheses: θ is nontrivial primitive of conductor N=Dp^n, D prime to p. K is a finite splitting extension containing the specified primitive root ε_N and θ-values; the Gauss sum G(θ^(-1)) uses that same root and is nonzero. Write C_θ=−G^(-1)Σ_units θ^(-1)(c)log_p(1−ε_N^c), the existing cyclotomic-logarithmic-constant, not a new definition. The complex logarithmic formula is already complex-lvalue-one-log; it is reused with N as its modulus. L_p is the actual RJW branch above. The common logarithm is imported from Coleman L0. Changing ε_N changes the Gauss sum simultaneously; there is no canonical identification of a complex transcendental value with a p-adic number. For D>1 the source primitive is Ftilde=C(C_η)+H_η, the inherited full primitive. H_η has constant0 and cannot supply C_η by itself. Tameness gives norm(D)=1, and inherited restrictedness plus the common-log local expansion identifies its actual analytic function.

Proof: Twist the actual full R+ primitive C(C_η)+H_η by the positive Gauss resolvent1/G(χ^(-1)), as required by existing Coleman E18. Since D>1 every tame root denominator has norm1, and translation by p-power roots preserves the open disc. Use tame-log-realization before taking the finite twist. Its derivative is the actual twisted tame measure; the finite prime-power support calculation kills its trace correction. Apply mixed-log-constant: the CRT factorization of the chosen positive Gauss denominators and of the finite inverse-character logarithm sum identifies the actual twisted constant with C_θ at ε_N=ε_(p^n)ε_D. Joint root transport remains required.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-arithmetic-evaluation`, `DirichletPadicLFunctions:L3/normalized-tame-logarithmic-primitive`, `DirichletPadicLFunctions:L3/normalized-tame-logarithmic-derivative`, `DirichletPadicLFunctions:L3/rjw2-power-trace-zero`, `DirichletPadicLFunctions:L2/prime-power-character-gauss`, `LocallyAnalyticDistributions:L1/division-by-x-and-primitives`, `DirichletPadicLFunctions:L3/tame-logarithmic-primitive-with-constant`, `DirichletPadicLFunctions:L3/tame-logarithmic-primitive-with-constant-derivative`, `DirichletPadicLFunctions:L3/tame-logarithmic-constant-restrictedness`, `DirichletPadicLFunctions:L3/rjw2-tame-log-realization`, `DirichletPadicLFunctions:L3/rjw2-mixed-log-constant`.

Acceptance: The positive twist coefficient is essential; the printed negative coefficient is existing Coleman E18. The argument requires D>1; the pure-power node supplies D=1 separately.

### Leopoldt’s actual value-at-one theorem

**DirichletPadicLFunctions:L3/rjw2-leopoldt** · theorem

For every primitive nontrivial θ of conductor N (odd p in RJW, with the stated independent all-prime interfaces for2), L_p(θ,1)=−(1−θ(p)p^(-1))G(θ^(-1))^(-1)Σ_units θ^(-1)(c)log_p(1−ε_N^c). The complex formula is the inherited L(θ,1)=−G^(-1)Σ θ^(-1)log(1−ε_N^c), with its separate complex embedding.

Hypotheses: θ is nontrivial primitive of conductor N=Dp^n, D prime to p. K is a finite splitting extension containing the specified primitive root ε_N and θ-values; the Gauss sum G(θ^(-1)) uses that same root and is nonzero. Write C_θ=−G^(-1)Σ_units θ^(-1)(c)log_p(1−ε_N^c), the existing cyclotomic-logarithmic-constant, not a new definition. The complex logarithmic formula is already complex-lvalue-one-log; it is reused with N as its modulus. L_p is the actual RJW branch above. The common logarithm is imported from Coleman L0. Changing ε_N changes the Gauss sum simultaneously; there is no canonical identification of a complex transcendental value with a p-adic number.

Proof: Partition by n=0, then by D=1 or D>1. These are the three preceding actual comparisons. For n≥1 the primitive conductor is divisible by p, so the actual character value θ(p)=0. Use the existing branch-independence and simultaneous root/Gauss transport. For odd θ the inherited finite log-pair cancellation gives0; the actual branch parity agrees.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-tame-value-one`, `DirichletPadicLFunctions:L3/rjw2-power-value-one`, `DirichletPadicLFunctions:L3/rjw2-mixed-value-one`, `DirichletPadicLFunctions:L3/complex-lvalue-one-log`, `DirichletPadicLFunctions:L3/cyclotomic-logarithmic-root-transport`, `DirichletPadicLFunctions:L3/cyclotomic-logarithmic-branch-independent`.

Acceptance: For every primitive nontrivial θ of conductor N (odd p in RJW, with the stated independent all-prime interfaces for2), L_p(θ,1)=−(1−θ(p)p^(-1))G(θ^(-1))^(-1)Σ_units θ^(-1)(c)log_p(1−ε_N^c). The complex formula is the inherited L(θ,1)=−G^(-1)Σ θ^(-1)log(1−ε_N^c), with its separate complex embedding.

### The two root parameters generate the same ideal

**DirichletPadicLFunctions:L3/rjw2-gk-root-ideals** · lemma

For t=ζ−1 and π=t+t²a with t in the maximal ideal of the native local integer ring, the factor1+ta is a unit, and(π)=(t).

Hypotheses: Use the actual inherited Morita Gamma, native integral chosen π and actual negative Gauss sum. For odd p the imported normalization is π^(p−1)=−p and π−(ζ−1)∈(ζ−1)^2R in a Henselian local domain R of residue characteristic p. The congruences are in the integer ring, not in a field where every nonzero element divides every other. The Robert comparison still requires its exact RD.6 coefficient bound and splitting-value identity.

Proof: In the native local ring, t in the maximal ideal implies1+ta is a unit. Write π=t(1+ta), then multiply by the inverse unit to express t as a multiple of π; use the two principal-ideal inclusions.

Dependencies: `DirichletPadicLFunctions:L3/gross-koblitz-integral-pi-congruence`, `DirichletPadicLFunctions:L3/gross-koblitz-integral-pi-existence`, `mathlib:Ideal.span`, `mathlib:IsLocalRing.isUnit_one_sub_self_of_mem_nonunits`.

Acceptance: For t=ζ−1 and π=t+t²a with t in the maximal ideal of the native local integer ring, the factor1+ta is a unit, and(π)=(t).

### The required additive-root congruence modulo pi squared

**DirichletPadicLFunctions:L3/rjw2-gk-root-congruence** · lemma

Under the inherited odd-prime normalization, ζ≡1+π modπ² in the native integer ring. Together with π^(p−1)=−p this is the exact root compatibility required by RT-AREA-iwasawa-2/1; π alone is insufficient.

Hypotheses: Use the actual inherited Morita Gamma, native integral chosen π and actual negative Gauss sum. For odd p the imported normalization is π^(p−1)=−p and π−(ζ−1)∈(ζ−1)^2R in a Henselian local domain R of residue characteristic p. The congruences are in the integer ring, not in a field where every nonzero element divides every other. The Robert comparison still requires its exact RD.6 coefficient bound and splitting-value identity.

Proof: The inherited congruence says t−π lies in(t²). Equality of principal ideals from gk-root-ideals gives(t²)=(π²). Hence π² divides ζ−1−π with an integral witness.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-gk-root-ideals`, `DirichletPadicLFunctions:L3/gross-koblitz-integral-pi-power`, `DirichletPadicLFunctions:L3/gross-koblitz-integral-pi-congruence`.

Acceptance: Under the inherited odd-prime normalization, ζ≡1+π modπ² in the native integer ring. Together with π^(p−1)=−p this is the exact root compatibility required by RT-AREA-iwasawa-2/1; π alone is insufficient.

### The dyadic root convention and excluded endpoint

**DirichletPadicLFunctions:L3/rjw2-gk-dyadic-root** · lemma

At p=2 take ζ=−1, π=−2 in Z_2; π^(p−1)=−p and ζ−1−π=0, so ζ≡1+π modπ² exactly. The inherited odd-prime cyclotomic-product sign lemma is not used. The source-negative trivial Gauss sum at exponents0 and q−1 is1; a formula on0≤a<q−1 cannot be extended to q−1 by changing a Gamma argument0 to1.

Hypotheses: Use the actual inherited Morita Gamma, native integral chosen π and actual negative Gauss sum. For odd p the imported normalization is π^(p−1)=−p and π−(ζ−1)∈(ζ−1)^2R in a Henselian local domain R of residue characteristic p. The congruences are in the integer ring, not in a field where every nonzero element divides every other. The Robert comparison still requires its exact RD.6 coefficient bound and splitting-value identity.

Proof: Check π=−2 and ζ=−1 directly in the native dyadic integer ring. Reuse both inherited exact negative-Gauss endpoint lemmas and retain the actual Robert RD.6 inputs for any dyadic Gamma formula. Gross–Koblitz1979 assumes odd p; this dyadic normalization is a direct calculation, not a claim that that paper proves the dyadic formula.

Dependencies: `DirichletPadicLFunctions:L3/gross-koblitz-negative-gauss-zero`, `DirichletPadicLFunctions:L3/gross-koblitz-negative-gauss-card-endpoint`, `DirichletPadicLFunctions:L3/robert-gross-koblitz-comparison`.

Acceptance: For q=2 the allowed exponent range contains only0; the endpoint1 is separately trivial. The logarithm of π vanishes since log_2(2)=log_2(−1)=0.

### The Ferrero–Greenberg Gamma sum

**DirichletPadicLFunctions:L3/rjw2-fg-gamma-sum** · definition

Define S_(Γ,χ,N)=Σ_(0≤a<N)χ(a)ι(log_p(Γ_p(a/N))) in K, using the actual native Gamma unit and the integral denominator u_N. The a=0 term vanishes for the arithmetic N>1, so this equals the source sum1≤a<N.

Hypotheses: p is any prime. χ is primitive odd, of conductor N>1 prime to p, valued in a finite extension K of Q_p; its even p-adic character is θ=χω_p (omega_2 has conductor4). The actual branch is the preceding RJW branch L_p(θ,s). Morita Γ_p:Z_p→Z_p^× is imported with existence/continuity, uniqueness, natural interpolation and both unit/nonunit recurrences from the inherited L3 nodes. The scalar logarithm is the common Iwasawa branch log_p(p)=0, reflected through Q_p→K. u_N is the native unit of Z_p whose scalar is N. B_(1,χ)=Σ_(1≤a<N)χ(a)a/N is the existing algebraic special-value datum L(χ,0)=−B_(1,χ). Gamma arguments a/N mean a*u_N^(-1) in native Z_p.

Proof: Evaluate the supplied actual continuous Gamma at each integral rational argument, include its scalar value into Q_p, apply the existing common log, map to K and multiply by the same χ(a) as the derivative formula. Form the finite sum without an orbit average; grouping p-orbits requires the separate comparison theorem and χ(p)=1.

Dependencies: `DirichletPadicLFunctions:L3/morita-gamma`, `DirichletPadicLFunctions:L3/morita-gamma-unique`, `DirichletPadicLFunctions:L3/morita-gamma-functional-equation`, `ColemanIntegration:L0/iwasawa-logarithm`, `mathlib:DirichletCharacter.IsPrimitive`.

Acceptance: Define S_(Γ,χ,N)=Σ_(0≤a<N)χ(a)ι(log_p(Γ_p(a/N))) in K, using the actual native Gamma unit and the integral denominator u_N. The a=0 term vanishes for the arithmetic N>1, so this equals the source sum1≤a<N.


API:

- `DirichletL3.fg_gamma_sum_apply`: S is the literal finite weighted Gamma-log sum, with no inverse character and no normalization by N.
- `DirichletL3.fg_gamma_sum_zero_log`: If the supplied logarithm is the zero function, the sum is0.
- `DirichletL3.fg_gamma_sum_congr`: Two scalar logarithms agreeing at every displayed Gamma value give the same sum.

Tests:

- `DirichletL3Tests.fg_gamma_sum_empty` (degenerate): The formal modulus0 finite adapter has an empty sum; it is not an arithmetic conductor case.
- `DirichletL3Tests.fg_gamma_sum_modulus_two` (computation): At formal modulus2 with principal χ, only the a=1 term survives, namely log Γ(u_N^(-1)).
- `DirichletL3Tests.fg_gamma_sum_zero_log` (non-example): A zero supplied logarithm makes the Gamma sum0, so nonvanishing cannot follow from a finite sum signature alone.

### The Ferrero–Greenberg Gamma sum: apply

**DirichletPadicLFunctions:L3/rjw2-fg-gamma-sum-apply** · lemma

S is the literal finite weighted Gamma-log sum, with no inverse character and no normalization by N.

Hypotheses: p is any prime. χ is primitive odd, of conductor N>1 prime to p, valued in a finite extension K of Q_p; its even p-adic character is θ=χω_p (omega_2 has conductor4). The actual branch is the preceding RJW branch L_p(θ,s). Morita Γ_p:Z_p→Z_p^× is imported with existence/continuity, uniqueness, natural interpolation and both unit/nonunit recurrences from the inherited L3 nodes. The scalar logarithm is the common Iwasawa branch log_p(p)=0, reflected through Q_p→K. u_N is the native unit of Z_p whose scalar is N. B_(1,χ)=Σ_(1≤a<N)χ(a)a/N is the existing algebraic special-value datum L(χ,0)=−B_(1,χ). Gamma arguments a/N mean a*u_N^(-1) in native Z_p.

Proof: Unfold the finite arithmetic adapter.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-fg-gamma-sum`.

Acceptance: S is the literal finite weighted Gamma-log sum, with no inverse character and no normalization by N.

### The Ferrero–Greenberg Gamma sum: zero log

**DirichletPadicLFunctions:L3/rjw2-fg-gamma-sum-zero-log** · lemma

If the supplied logarithm is the zero function, the sum is0.

Hypotheses: p is any prime. χ is primitive odd, of conductor N>1 prime to p, valued in a finite extension K of Q_p; its even p-adic character is θ=χω_p (omega_2 has conductor4). The actual branch is the preceding RJW branch L_p(θ,s). Morita Γ_p:Z_p→Z_p^× is imported with existence/continuity, uniqueness, natural interpolation and both unit/nonunit recurrences from the inherited L3 nodes. The scalar logarithm is the common Iwasawa branch log_p(p)=0, reflected through Q_p→K. u_N is the native unit of Z_p whose scalar is N. B_(1,χ)=Σ_(1≤a<N)χ(a)a/N is the existing algebraic special-value datum L(χ,0)=−B_(1,χ). Gamma arguments a/N mean a*u_N^(-1) in native Z_p.

Proof: Every mapped summand iszero.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-fg-gamma-sum`.

Acceptance: If the supplied logarithm is the zero function, the sum is0.

### The Ferrero–Greenberg Gamma sum: congr

**DirichletPadicLFunctions:L3/rjw2-fg-gamma-sum-congr** · lemma

Two scalar logarithms agreeing at every displayed Gamma value give the same sum.

Hypotheses: p is any prime. χ is primitive odd, of conductor N>1 prime to p, valued in a finite extension K of Q_p; its even p-adic character is θ=χω_p (omega_2 has conductor4). The actual branch is the preceding RJW branch L_p(θ,s). Morita Γ_p:Z_p→Z_p^× is imported with existence/continuity, uniqueness, natural interpolation and both unit/nonunit recurrences from the inherited L3 nodes. The scalar logarithm is the common Iwasawa branch log_p(p)=0, reflected through Q_p→K. u_N is the native unit of Z_p whose scalar is N. B_(1,χ)=Σ_(1≤a<N)χ(a)a/N is the existing algebraic special-value datum L(χ,0)=−B_(1,χ). Gamma arguments a/N mean a*u_N^(-1) in native Z_p.

Proof: Apply Finset.sum_congr term by term; the coefficient embedding and χ are unchanged.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-fg-gamma-sum`.

Acceptance: Two scalar logarithms agreeing at every displayed Gamma value give the same sum.

### The prime-to-p counting function

**DirichletPadicLFunctions:L3/rjw2-fg-count** · definition

For x∈Z_p put C_p(x)=x−1−V(x−1) in Q_p, where V(y)=(y−a0(y))/p and a0(y)=val(toZMod y). Thus C_p(n)=#{1≤m<n:p∤m} for positive n, and C_p(0)=0. V is written through native reduction in the formula; no new Witt-vector object is planned.

Hypotheses: p is any prime. χ is primitive odd, of conductor N>1 prime to p, valued in a finite extension K of Q_p; its even p-adic character is θ=χω_p (omega_2 has conductor4). The actual branch is the preceding RJW branch L_p(θ,s). Morita Γ_p:Z_p→Z_p^× is imported with existence/continuity, uniqueness, natural interpolation and both unit/nonunit recurrences from the inherited L3 nodes. The scalar logarithm is the common Iwasawa branch log_p(p)=0, reflected through Q_p→K. u_N is the native unit of Z_p whose scalar is N. B_(1,χ)=Σ_(1≤a<N)χ(a)a/N is the existing algebraic special-value datum L(χ,0)=−B_(1,χ). Gamma arguments a/N mean a*u_N^(-1) in native Z_p.

Proof: Use the existing residue digit and the rational inclusion to form the quotient by nonzero p. The digit map is locally constant, so the resulting function is continuous. At a natural n>0 the digit-shift is floor((n−1)/p); at0 the digit p−1 of−1 gives V(−1)=−1 and count0=0.

Dependencies: `mathlib:PadicInt.toZMod`, `mathlib:PadicInt.denseRange_natCast`.

Acceptance: For x∈Z_p put C_p(x)=x−1−V(x−1) in Q_p, where V(y)=(y−a0(y))/p and a0(y)=val(toZMod y). Thus C_p(n)=#{1≤m<n:p∤m} for positive n, and C_p(0)=0. V is written through native reduction in the formula; no new Witt-vector object is planned.


API:

- `DirichletL3.fg_count_apply`: C_p(x)=x−1−((x−1−a0(x−1))/p).
- `DirichletL3.fg_count_nat`: For n≥1, C_p(n)=n−1−floor((n−1)/p).
- `DirichletL3.fg_count_step`: C_p(x+1)−C_p(x) is1 on Z_p^× and0 on pZ_p.

Tests:

- `DirichletL3Tests.fg_count_zero` (degenerate): The normalization is C_p(0)=0.
- `DirichletL3Tests.fg_count_one` (computation): The empty interval1≤m<1 has count0.
- `DirichletL3Tests.fg_count_prime_step` (computation): C_p(p+1)=p−1; the upper endpoint p is excluded as a nonunit.

### The prime-to-p counting function: apply

**DirichletPadicLFunctions:L3/rjw2-fg-count-apply** · lemma

C_p(x)=x−1−((x−1−a0(x−1))/p).

Hypotheses: p is any prime. χ is primitive odd, of conductor N>1 prime to p, valued in a finite extension K of Q_p; its even p-adic character is θ=χω_p (omega_2 has conductor4). The actual branch is the preceding RJW branch L_p(θ,s). Morita Γ_p:Z_p→Z_p^× is imported with existence/continuity, uniqueness, natural interpolation and both unit/nonunit recurrences from the inherited L3 nodes. The scalar logarithm is the common Iwasawa branch log_p(p)=0, reflected through Q_p→K. u_N is the native unit of Z_p whose scalar is N. B_(1,χ)=Σ_(1≤a<N)χ(a)a/N is the existing algebraic special-value datum L(χ,0)=−B_(1,χ). Gamma arguments a/N mean a*u_N^(-1) in native Z_p.

Proof: Unfold the arithmetic formula.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-fg-count`.

Acceptance: C_p(x)=x−1−((x−1−a0(x−1))/p).

### The prime-to-p counting function: nat

**DirichletPadicLFunctions:L3/rjw2-fg-count-nat** · lemma

For n≥1, C_p(n)=n−1−floor((n−1)/p).

Hypotheses: p is any prime. χ is primitive odd, of conductor N>1 prime to p, valued in a finite extension K of Q_p; its even p-adic character is θ=χω_p (omega_2 has conductor4). The actual branch is the preceding RJW branch L_p(θ,s). Morita Γ_p:Z_p→Z_p^× is imported with existence/continuity, uniqueness, natural interpolation and both unit/nonunit recurrences from the inherited L3 nodes. The scalar logarithm is the common Iwasawa branch log_p(p)=0, reflected through Q_p→K. u_N is the native unit of Z_p whose scalar is N. B_(1,χ)=Σ_(1≤a<N)χ(a)a/N is the existing algebraic special-value datum L(χ,0)=−B_(1,χ). Gamma arguments a/N mean a*u_N^(-1) in native Z_p.

Proof: Identify the native residue of n−1 with its remainder and apply Euclidean division.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-fg-count`.

Acceptance: For n≥1, C_p(n)=n−1−floor((n−1)/p).

### The prime-to-p counting function: step

**DirichletPadicLFunctions:L3/rjw2-fg-count-step** · lemma

C_p(x+1)−C_p(x) is1 on Z_p^× and0 on pZ_p.

Hypotheses: p is any prime. χ is primitive odd, of conductor N>1 prime to p, valued in a finite extension K of Q_p; its even p-adic character is θ=χω_p (omega_2 has conductor4). The actual branch is the preceding RJW branch L_p(θ,s). Morita Γ_p:Z_p→Z_p^× is imported with existence/continuity, uniqueness, natural interpolation and both unit/nonunit recurrences from the inherited L3 nodes. The scalar logarithm is the common Iwasawa branch log_p(p)=0, reflected through Q_p→K. u_N is the native unit of Z_p whose scalar is N. B_(1,χ)=Σ_(1≤a<N)χ(a)a/N is the existing algebraic special-value datum L(χ,0)=−B_(1,χ). Gamma arguments a/N mean a*u_N^(-1) in native Z_p.

Proof: At natural arguments the count adds exactly the omitted endpoint x when it is prime to p. Both sides are continuous because the unit locus is clopen; use native natural-number density.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-fg-count`.

Acceptance: C_p(x+1)−C_p(x) is1 on Z_p^× and0 on pZ_p.

### The Ferrero–Greenberg permutation

**DirichletPadicLFunctions:L3/rjw2-fg-permutation** · definition

For B=p^(fn)>1 with B≡1 modN and p∤N, construct the native permutation of M={1≤m<B:p∤m}. With a=m_N^sharp∈{1,…,N} and m=a+hN, its value isι(m)=h+1+(N−a)(B−1)/N. The same formula works for N=1 and then is the identity.

Hypotheses: p is any prime. χ is primitive odd, of conductor N>1 prime to p, valued in a finite extension K of Q_p; its even p-adic character is θ=χω_p (omega_2 has conductor4). The actual branch is the preceding RJW branch L_p(θ,s). Morita Γ_p:Z_p→Z_p^× is imported with existence/continuity, uniqueness, natural interpolation and both unit/nonunit recurrences from the inherited L3 nodes. The scalar logarithm is the common Iwasawa branch log_p(p)=0, reflected through Q_p→K. u_N is the native unit of Z_p whose scalar is N. B_(1,χ)=Σ_(1≤a<N)χ(a)a/N is the existing algebraic special-value datum L(χ,0)=−B_(1,χ). Gamma arguments a/N mean a*u_N^(-1) in native Z_p.

Proof: For B≤1 the interval subtype is empty, so use its empty equivalence. Otherwise use the finite index formula and range lemma to define its self-map. The congruence Nι(m)≡m modB and p∣B,p∤N show injectivity; injective self-maps of a finite set are bijective, giving the native equivalence. This is the actual finite bijection used to reindex the partial sums, not a postulate about asymptotic sums.

Dependencies: `mathlib:Equiv`, `DirichletPadicLFunctions:L3/rjw2-fg-permutation-range`, `DirichletPadicLFunctions:L3/rjw2-fg-permutation-injective`.

Acceptance: For B=p^(fn)>1 with B≡1 modN and p∤N, construct the native permutation of M={1≤m<B:p∤m}. With a=m_N^sharp∈{1,…,N} and m=a+hN, its value isι(m)=h+1+(N−a)(B−1)/N. The same formula works for N=1 and then is the identity.


API:

- `DirichletL3.fg_permutation_apply`: For a=m%N if nonzero and N otherwise, ι(m)=(m−a)/N+1+(N−a)((B−1)/N).
- `DirichletL3.fg_permutation_congruence`: Nι(m)≡m modB.
- `DirichletL3.fg_permutation_filtration`: For0≤a≤N, m_N^sharp>a iff Nι(m)<(N−a)B.

Tests:

- `DirichletL3Tests.fg_permutation_sample_one` (computation): For p=5,N=3,B=25, ι(1)=17.
- `DirichletL3Tests.fg_permutation_sample_multiple` (computation): For p=5,N=3,B=25, ι(3)=1; residue0 is represented by N.
- `DirichletL3Tests.fg_permutation_sample_last` (computation): For p=5,N=3,B=25, ι(24)=8.

### The Ferrero–Greenberg permutation: apply

**DirichletPadicLFunctions:L3/rjw2-fg-permutation-apply** · lemma

For a=m%N if nonzero and N otherwise, ι(m)=(m−a)/N+1+(N−a)((B−1)/N).

Hypotheses: p is any prime. χ is primitive odd, of conductor N>1 prime to p, valued in a finite extension K of Q_p; its even p-adic character is θ=χω_p (omega_2 has conductor4). The actual branch is the preceding RJW branch L_p(θ,s). Morita Γ_p:Z_p→Z_p^× is imported with existence/continuity, uniqueness, natural interpolation and both unit/nonunit recurrences from the inherited L3 nodes. The scalar logarithm is the common Iwasawa branch log_p(p)=0, reflected through Q_p→K. u_N is the native unit of Z_p whose scalar is N. B_(1,χ)=Σ_(1≤a<N)χ(a)a/N is the existing algebraic special-value datum L(χ,0)=−B_(1,χ). Gamma arguments a/N mean a*u_N^(-1) in native Z_p.

Proof: Use the defining index formula with the positive residue representative.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-fg-permutation`.

Acceptance: For a=m%N if nonzero and N otherwise, ι(m)=(m−a)/N+1+(N−a)((B−1)/N).

### The Ferrero–Greenberg permutation: congruence

**DirichletPadicLFunctions:L3/rjw2-fg-permutation-congruence** · lemma

Nι(m)≡m modB.

Hypotheses: p is any prime. χ is primitive odd, of conductor N>1 prime to p, valued in a finite extension K of Q_p; its even p-adic character is θ=χω_p (omega_2 has conductor4). The actual branch is the preceding RJW branch L_p(θ,s). Morita Γ_p:Z_p→Z_p^× is imported with existence/continuity, uniqueness, natural interpolation and both unit/nonunit recurrences from the inherited L3 nodes. The scalar logarithm is the common Iwasawa branch log_p(p)=0, reflected through Q_p→K. u_N is the native unit of Z_p whose scalar is N. B_(1,χ)=Σ_(1≤a<N)χ(a)a/N is the existing algebraic special-value datum L(χ,0)=−B_(1,χ). Gamma arguments a/N mean a*u_N^(-1) in native Z_p.

Proof: Multiply the index formula by N and use m=a+hN and B−1 divisible by N.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-fg-permutation`.

Acceptance: Nι(m)≡m modB.

### The Ferrero–Greenberg permutation: filtration

**DirichletPadicLFunctions:L3/rjw2-fg-permutation-filtration** · lemma

For0≤a≤N, m_N^sharp>a iff Nι(m)<(N−a)B.

Hypotheses: p is any prime. χ is primitive odd, of conductor N>1 prime to p, valued in a finite extension K of Q_p; its even p-adic character is θ=χω_p (omega_2 has conductor4). The actual branch is the preceding RJW branch L_p(θ,s). Morita Γ_p:Z_p→Z_p^× is imported with existence/continuity, uniqueness, natural interpolation and both unit/nonunit recurrences from the inherited L3 nodes. The scalar logarithm is the common Iwasawa branch log_p(p)=0, reflected through Q_p→K. u_N is the native unit of Z_p whose scalar is N. B_(1,χ)=Σ_(1≤a<N)χ(a)a/N is the existing algebraic special-value datum L(χ,0)=−B_(1,χ). Gamma arguments a/N mean a*u_N^(-1) in native Z_p.

Proof: Write m=r+hN with1≤r≤N and compare the two sides using0<m<B. This gives the literal bijection between the two finite filtrations, including a=0 and a=N.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-fg-permutation`.

Acceptance: For0≤a≤N, m_N^sharp>a iff Nι(m)<(N−a)B.

### The finite permutation index has the right range

**DirichletPadicLFunctions:L3/rjw2-fg-permutation-range** · lemma

With p prime, N>0, B>1, p∣B, N coprime to p and B≡1 modN, for every m∈M the displayed integerι(m) has0<ι(m)<B and p∤ι(m).

Hypotheses: p is any prime. χ is primitive odd, of conductor N>1 prime to p, valued in a finite extension K of Q_p; its even p-adic character is θ=χω_p (omega_2 has conductor4). The actual branch is the preceding RJW branch L_p(θ,s). Morita Γ_p:Z_p→Z_p^× is imported with existence/continuity, uniqueness, natural interpolation and both unit/nonunit recurrences from the inherited L3 nodes. The scalar logarithm is the common Iwasawa branch log_p(p)=0, reflected through Q_p→K. u_N is the native unit of Z_p whose scalar is N. B_(1,χ)=Σ_(1≤a<N)χ(a)a/N is the existing algebraic special-value datum L(χ,0)=−B_(1,χ). Gamma arguments a/N mean a*u_N^(-1) in native Z_p.

Proof: Use positive residue r∈[1,N], m=r+hN and m<B to bound h+1+(N−r)(B−1)/N between1 and B−1. Multiply the formula by N to obtain Nι(m)≡m modB. Since p∣B and p∤N,m, infer p∤ι(m).

Dependencies: `mathlib:Nat.Coprime.dvd_mul_right`.

Acceptance: With p prime, N>0, B>1, p∣B, N coprime to p and B≡1 modN, for every m∈M the displayed integerι(m) has0<ι(m)<B and p∤ι(m).

### Injectivity before constructing the finite equivalence

**DirichletPadicLFunctions:L3/rjw2-fg-permutation-injective** · lemma

If m,m′∈M have equal displayedι-indices, their congruences give m≡m′ modB; since both lie in[1,B), m=m′. Thus the finite index map is injective, hence bijective.

Hypotheses: p is any prime. χ is primitive odd, of conductor N>1 prime to p, valued in a finite extension K of Q_p; its even p-adic character is θ=χω_p (omega_2 has conductor4). The actual branch is the preceding RJW branch L_p(θ,s). Morita Γ_p:Z_p→Z_p^× is imported with existence/continuity, uniqueness, natural interpolation and both unit/nonunit recurrences from the inherited L3 nodes. The scalar logarithm is the common Iwasawa branch log_p(p)=0, reflected through Q_p→K. u_N is the native unit of Z_p whose scalar is N. B_(1,χ)=Σ_(1≤a<N)χ(a)a/N is the existing algebraic special-value datum L(χ,0)=−B_(1,χ). Gamma arguments a/N mean a*u_N^(-1) in native Z_p.

Proof: Subtract the two congruences obtained in the range proof. Use uniqueness of the natural remainder in the interval below B. Finiteness of the literal interval subtype turns injectivity into surjectivity.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-fg-permutation-range`.

Acceptance: If m,m′∈M have equal displayedι-indices, their congruences give m≡m′ modB; since both lie in[1,B), m=m′. Thus the finite index map is injective, hence bijective.

### The correctly normalized Gamma antidifference

**DirichletPadicLFunctions:L3/rjw2-fg-log-antidifference** · lemma

The continuous function A(x)=log_p Γ_p(x) satisfies A(0)=0 and A(x+1)−A(x)=log_p(x) on units, and0 on nonunits. Therefore it is the unique continuous normalized antidifference of the unit-extended logarithm. At natural n it isΣ_(1≤m<n,p∤m)log_p(m).

Hypotheses: p is any prime. χ is primitive odd, of conductor N>1 prime to p, valued in a finite extension K of Q_p; its even p-adic character is θ=χω_p (omega_2 has conductor4). The actual branch is the preceding RJW branch L_p(θ,s). Morita Γ_p:Z_p→Z_p^× is imported with existence/continuity, uniqueness, natural interpolation and both unit/nonunit recurrences from the inherited L3 nodes. The scalar logarithm is the common Iwasawa branch log_p(p)=0, reflected through Q_p→K. u_N is the native unit of Z_p whose scalar is N. B_(1,χ)=Σ_(1≤a<N)χ(a)a/N is the existing algebraic special-value datum L(χ,0)=−B_(1,χ). Gamma arguments a/N mean a*u_N^(-1) in native Z_p.

Proof: The two Morita recurrences and log_p(−1)=0 give the two difference equations; Γ_p(0)=1 gives normalization. The common logarithm is continuous on the unit group, so composing with the native continuous Gamma gives continuity. Use the requested normalized Mahler-antidifference uniqueness (or dense natural interpolation). The source AppendixB.2 upper endpoint n and Γ_p(x+1) are corrected to m<n and Γ_p(x), recorded as E37.

Dependencies: `DirichletPadicLFunctions:L3/morita-gamma-functional-equation`, `DirichletPadicLFunctions:L3/morita-gamma-unique`, `ColemanIntegration:L0/iwasawa-logarithm`, `LocallyAnalyticDistributions:L1`.

Acceptance: The continuous function A(x)=log_p Γ_p(x) satisfies A(0)=0 and A(x+1)−A(x)=log_p(x) on units, and0 on nonunits. Therefore it is the unique continuous normalized antidifference of the unit-extended logarithm. At natural n it isΣ_(1≤m<n,p∤m)log_p(m).

### The finite periods needed by Ferrero–Greenberg

**DirichletPadicLFunctions:L3/rjw2-fg-tame-period** · lemma

For the actual nontrivial tame χ measure in Zhao’s sign convention, μ_χ(m+p^rZ_p)=N^(-1)Σ_(1≤a<N)χ(m+p^r a)a. When p^r≡1 modN this is B_(1,χ)+Σ_(1≤a<m_N^flat)χ(a), where m_N^flat∈[0,N). Its character integral matches the same RJW L_p(χω,s) with the minus sign in (3.6).

Hypotheses: p is any prime. χ is primitive odd, of conductor N>1 prime to p, valued in a finite extension K of Q_p; its even p-adic character is θ=χω_p (omega_2 has conductor4). The actual branch is the preceding RJW branch L_p(θ,s). Morita Γ_p:Z_p→Z_p^× is imported with existence/continuity, uniqueness, natural interpolation and both unit/nonunit recurrences from the inherited L3 nodes. The scalar logarithm is the common Iwasawa branch log_p(p)=0, reflected through Q_p→K. u_N is the native unit of Z_p whose scalar is N. B_(1,χ)=Σ_(1≤a<N)χ(a)a/N is the existing algebraic special-value datum L(χ,0)=−B_(1,χ). Gamma arguments a/N mean a*u_N^(-1) in native Z_p.

Proof: Apply the existing finite Fourier/cylinder restriction to the actual Amice rational kernel L_χ(t)=Σχ(a)t^a/(t^N−1). Identify the finite coefficient-extension/sign convention through its native moments. The least representative of(m−a)/N modulo p^r gives a carry h∈[0,N) with m−a+p^r h≡0 modN. Solve h=(a−m)/p^r modulo N. Reindex the complete residue sum. If p^r≡1 modN, split a−m into its positive/negative representatives; the χ-total sum0 leaves the displayed B1 plus partial-character sum. The exact cylinder/sign identification is an open PMIA L2 interface, not a license to create a second measure.

Dependencies: `DirichletPadicLFunctions:L2/tame-measure`, `DirichletPadicLFunctions:L2/tame-zeta-character-common-value`, `PadicMeasuresIwasawaAlgebras:L2`.

Acceptance: For the actual nontrivial tame χ measure in Zhao’s sign convention, μ_χ(m+p^rZ_p)=N^(-1)Σ_(1≤a<N)χ(m+p^r a)a. When p^r≡1 modN this is B_(1,χ)+Σ_(1≤a<m_N^flat)χ(a), where m_N^flat∈[0,N). Its character integral matches the same RJW L_p(χω,s) with the minus sign in (3.6).

### The actual L-function as a finite-sum limit

**DirichletPadicLFunctions:L3/rjw2-fg-sum-expression** · lemma

Choose f>0 with p^f≡1 modN and B_n=p^(fn). On integral s, −L_p(χω,−s)=lim_n Σ_(1≤a<N)χ(a)Σ_(1≤m<B_n,p∤m,m_N^flat>a)angle(m)^s. The exact finite periods and actual branch give this identity; the total continuous-function sum tends to0.

Hypotheses: p is any prime. χ is primitive odd, of conductor N>1 prime to p, valued in a finite extension K of Q_p; its even p-adic character is θ=χω_p (omega_2 has conductor4). The actual branch is the preceding RJW branch L_p(θ,s). Morita Γ_p:Z_p→Z_p^× is imported with existence/continuity, uniqueness, natural interpolation and both unit/nonunit recurrences from the inherited L3 nodes. The scalar logarithm is the common Iwasawa branch log_p(p)=0, reflected through Q_p→K. u_N is the native unit of Z_p whose scalar is N. B_(1,χ)=Σ_(1≤a<N)χ(a)a/N is the existing algebraic special-value datum L(χ,0)=−B_(1,χ). Gamma arguments a/N mean a*u_N^(-1) in native Z_p.

Proof: Use the requested native finite-projection Riemann sums for the actual unit measure and the explicit periods. The constant B1 part vanishes since sums of a fixed continuous function over a complete interval of length B_n tend to0. This is the requested Mahler-antidifference continuity statement, not a real equidistribution assertion. Swap the finite sums and use the source flat-residue filtration. Replacing flat residue by positive residue changes only multiples of N; their outer character coefficient is Σχ(a)=0.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-fg-tame-period`, `DirichletPadicLFunctions:L3/rjw2-arithmetic-evaluation`, `PadicMeasuresIwasawaAlgebras:L2`, `LocallyAnalyticDistributions:L1`.

Acceptance: Choose f>0 with p^f≡1 modN and B_n=p^(fn). On integral s, −L_p(χω,−s)=lim_n Σ_(1≤a<N)χ(a)Σ_(1≤m<B_n,p∤m,m_N^flat>a)angle(m)^s. The exact finite periods and actual branch give this identity; the total continuous-function sum tends to0.


Suggested signature boundary: Native scalar consequence only; the full target is the packet statement. The actual arithmetic supplier identification and its exact hypotheses are unavailable and remain the listed request/gap.

### The reindexed first logarithmic coefficient

**DirichletPadicLFunctions:L3/rjw2-fg-log-reindex-limit** · lemma

For1≤a<N, lim_n Σ_(m∈M_n,m_N^sharp>a)log_p(m)=C_p(a/N)log_p(N)+log_p Γ_p(a/N). The corresponding finite congruence uses m≡Nι(m) mod B_n and the normalized logarithm.

Hypotheses: p is any prime. χ is primitive odd, of conductor N>1 prime to p, valued in a finite extension K of Q_p; its even p-adic character is θ=χω_p (omega_2 has conductor4). The actual branch is the preceding RJW branch L_p(θ,s). Morita Γ_p:Z_p→Z_p^× is imported with existence/continuity, uniqueness, natural interpolation and both unit/nonunit recurrences from the inherited L3 nodes. The scalar logarithm is the common Iwasawa branch log_p(p)=0, reflected through Q_p→K. u_N is the native unit of Z_p whose scalar is N. B_(1,χ)=Σ_(1≤a<N)χ(a)a/N is the existing algebraic special-value datum L(χ,0)=−B_(1,χ). Gamma arguments a/N mean a*u_N^(-1) in native Z_p.

Proof: Use the positive residue filtration after the character-weighted flat-to-positive cancellation; an individual flat-residue limit is not asserted. Reindex via the actual finite permutation. The logarithm difference between the congruent units m and Nι(m) tends uniformly to0 by the owned local-log estimate; ultrametric finite summation introduces no real cardinality factor. The ceiling of the strict interval endpoint (N−a)B_n/N equals ((N−a)B_n+a)/N and tends p-adically to a/N. The normalized continuous antidifferences of1 and log give count(a/N) and log Γ(a/N), respectively.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-fg-permutation-congruence`, `DirichletPadicLFunctions:L3/rjw2-fg-permutation-filtration`, `DirichletPadicLFunctions:L3/rjw2-fg-count`, `DirichletPadicLFunctions:L3/rjw2-fg-log-antidifference`, `ColemanIntegration:L0/iwasawa-logarithm`, `LocallyAnalyticDistributions:L1`.

Acceptance: For1≤a<N, lim_n Σ_(m∈M_n,m_N^sharp>a)log_p(m)=C_p(a/N)log_p(N)+log_p Γ_p(a/N). The corresponding finite congruence uses m≡Nι(m) mod B_n and the normalized logarithm.


Suggested signature boundary: Native scalar consequence only; the full target is the packet statement. The actual arithmetic supplier identification and its exact hypotheses are unavailable and remain the listed request/gap.

### Justifying differentiation of the sum limit

**DirichletPadicLFunctions:L3/rjw2-fg-differentiation** · lemma

The preceding actual sum expression may be differentiated at s=0. Its coefficient limits exist, and on a sufficiently small s-disc the logarithmic Taylor coefficients are uniformly dominated by C δ^k/||k!||, where δ=1/p for odd p and δ=1/4 for2. Therefore L_p′(χω,0)=Σ_(1≤a<N)χ(a)[C_p(a/N)log_p N+log_p Γ_p(a/N)].

Hypotheses: p is any prime. χ is primitive odd, of conductor N>1 prime to p, valued in a finite extension K of Q_p; its even p-adic character is θ=χω_p (omega_2 has conductor4). The actual branch is the preceding RJW branch L_p(θ,s). Morita Γ_p:Z_p→Z_p^× is imported with existence/continuity, uniqueness, natural interpolation and both unit/nonunit recurrences from the inherited L3 nodes. The scalar logarithm is the common Iwasawa branch log_p(p)=0, reflected through Q_p→K. u_N is the native unit of Z_p whose scalar is N. B_(1,χ)=Σ_(1≤a<N)χ(a)a/N is the existing algebraic special-value datum L(χ,0)=−B_(1,χ). Gamma arguments a/N mean a*u_N^(-1) in native Z_p.

Proof: The common logarithm kills torsion, so every integral unit log has norm at mostδ (use the dyadic1+4 principal subgroup). The ultrametric sum has the same upper bound, with a fixed character bound C; cardinality of M_n does not multiply it. Each coefficient limit exists by the requested normalized continuous antidifference of log^k, following the finite permutation argument; k=1 is the preceding explicit Gamma calculation. On ||s||δ below the native p-adic exp radius p^(−1/(p−1)), factorial estimates give a summable geometric majorant. Apply the owned analytic coefficient-limit theorem to interchange the limit and first derivative. The actual sum has−L_p(−s) on its left, so its first derivative is+L_p′(0); keep both signs.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-fg-sum-expression`, `DirichletPadicLFunctions:L3/rjw2-fg-log-reindex-limit`, `LocallyAnalyticDistributions:L1`, `DirichletPadicLFunctions:L3/rjw2-analytic-numerator-convergence`, `DirichletPadicLFunctions:L3/rjw2-nonprincipal-analytic`, `mathlib:FormalMultilinearSeries.ofScalars`, `mathlib:HasFPowerSeriesAt`.

Acceptance: The preceding actual sum expression may be differentiated at s=0. Its coefficient limits exist, and on a sufficiently small s-disc the logarithmic Taylor coefficients are uniformly dominated by C δ^k/||k!||, where δ=1/p for odd p and δ=1/4 for2. Therefore L_p′(χω,0)=Σ_(1≤a<N)χ(a)[C_p(a/N)log_p N+log_p Γ_p(a/N)].


Suggested signature boundary: Native scalar consequence only; the full target is the packet statement. The actual arithmetic supplier identification and its exact hypotheses are unavailable and remain the listed request/gap.

### The carry calculation behind the correction term

**DirichletPadicLFunctions:L3/rjw2-fg-count-character-sum** · lemma

For odd primitive χ modulo N with p∤N, Σ_(1≤a<N)χ(a)V(a/N−1)=χ(p)B_(1,χ), and consequently Σχ(a)C_p(a/N)=(1−χ(p))B_(1,χ).

Hypotheses: p is any prime. χ is primitive odd, of conductor N>1 prime to p, valued in a finite extension K of Q_p; its even p-adic character is θ=χω_p (omega_2 has conductor4). The actual branch is the preceding RJW branch L_p(θ,s). Morita Γ_p:Z_p→Z_p^× is imported with existence/continuity, uniqueness, natural interpolation and both unit/nonunit recurrences from the inherited L3 nodes. The scalar logarithm is the common Iwasawa branch log_p(p)=0, reflected through Q_p→K. u_N is the native unit of Z_p whose scalar is N. B_(1,χ)=Σ_(1≤a<N)χ(a)a/N is the existing algebraic special-value datum L(χ,0)=−B_(1,χ). Gamma arguments a/N mean a*u_N^(-1) in native Z_p.

Proof: Write the native residue digit of a/N−1 as(−(N−a)+ph)/N. The exact carry h is the positive residue of−a/p modulo N. Substitution into V gives V(a/N−1)=−(−a/p)_N^flat/N. Reindex a↦−pa among units modulo N. Oddness χ(−1)=−1 reverses the sign, leaving χ(p)B1. The constant−1 contribution cancels because χ≠1. This is Zhao Lemma4.2, not an imported nonvanishing theorem.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-fg-count`, `DirichletPadicLFunctions:L0/generalized-bernoulli-nonprincipal`, `mathlib:MulChar.sum_eq_zero_of_ne_one`.

Acceptance: For odd primitive χ modulo N with p∤N, Σ_(1≤a<N)χ(a)V(a/N−1)=χ(p)B_(1,χ), and consequently Σχ(a)C_p(a/N)=(1−χ(p))B_(1,χ).

### The Ferrero–Greenberg derivative formula

**DirichletPadicLFunctions:L3/rjw2-ferrero-greenberg** · theorem

For primitive odd χ of conductor N>1 prime to p, L_p′(χω,0)=S_(Γ,χ,N)+(1−χ(p))B_(1,χ)log_p N. Equivalently the correction is−(1−χ(p))L(χ,0)log_p N. This is for the even character χω, not χ.

Hypotheses: p is any prime. χ is primitive odd, of conductor N>1 prime to p, valued in a finite extension K of Q_p; its even p-adic character is θ=χω_p (omega_2 has conductor4). The actual branch is the preceding RJW branch L_p(θ,s). Morita Γ_p:Z_p→Z_p^× is imported with existence/continuity, uniqueness, natural interpolation and both unit/nonunit recurrences from the inherited L3 nodes. The scalar logarithm is the common Iwasawa branch log_p(p)=0, reflected through Q_p→K. u_N is the native unit of Z_p whose scalar is N. B_(1,χ)=Σ_(1≤a<N)χ(a)a/N is the existing algebraic special-value datum L(χ,0)=−B_(1,χ). Gamma arguments a/N mean a*u_N^(-1) in native Z_p.

Proof: Substitute the explicit reindexed first-coefficient limits into the rigorously differentiated actual sum expression. Split the finite sum into the Gamma term and logN times the count sum. Apply the carry-character identity. Use the inherited common algebraic L(χ,0)=−B1 value to rewrite the correction; no complex logarithm is mapped into K.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-fg-differentiation`, `DirichletPadicLFunctions:L3/rjw2-fg-count-character-sum`, `DirichletPadicLFunctions:L3/rjw2-fg-gamma-sum`, `DirichletPadicLFunctions:L0/generalized-bernoulli-nonprincipal`.

Acceptance: For primitive odd χ of conductor N>1 prime to p, L_p′(χω,0)=S_(Γ,χ,N)+(1−χ(p))B_(1,χ)log_p N. Equivalently the correction is−(1−χ(p))L(χ,0)log_p N. This is for the even character χω, not χ.


Suggested signature boundary: Native scalar consequence only; the full target is the packet statement. The actual arithmetic supplier identification and its exact hypotheses are unavailable and remain the listed request/gap.

### The exceptional value vanishes under chi of p equals one

**DirichletPadicLFunctions:L3/rjw2-fg-exceptional-zero** · lemma

For θ=χω and χ(p)=1, the actual interpolation at k=1 gives L_p(θ,0)=−(1−χ(p))B_(1,χ)=0. Odd primitive χ has L(χ,0)≠0, but this interpolation zero comes from the Euler factor.

Hypotheses: p is any prime. χ is primitive odd, of conductor N>1 prime to p, valued in a finite extension K of Q_p; its even p-adic character is θ=χω_p (omega_2 has conductor4). The actual branch is the preceding RJW branch L_p(θ,s). Morita Γ_p:Z_p→Z_p^× is imported with existence/continuity, uniqueness, natural interpolation and both unit/nonunit recurrences from the inherited L3 nodes. The scalar logarithm is the common Iwasawa branch log_p(p)=0, reflected through Q_p→K. u_N is the native unit of Z_p whose scalar is N. B_(1,χ)=Σ_(1≤a<N)χ(a)a/N is the existing algebraic special-value datum L(χ,0)=−B_(1,χ). Gamma arguments a/N mean a*u_N^(-1) in native Z_p.

Proof: At s=0 the inverse-omega twist changes θ=χω back toχ. Use k=1, p^0=1 and the explicit assumption χ(p)=1; the Euler factor vanishes.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-branch-interpolation`, `DirichletPadicLFunctions:L0/generalized-bernoulli-nonprincipal`.

Acceptance: For θ=χω and χ(p)=1, the actual interpolation at k=1 gives L_p(θ,0)=−(1−χ(p))B_(1,χ)=0. Odd primitive χ has L(χ,0)≠0, but this interpolation zero comes from the Euler factor.

### The exceptional derivative is the Gamma sum

**DirichletPadicLFunctions:L3/rjw2-fg-exceptional-derivative** · lemma

Under the same χ(p)=1 hypothesis, L_p′(χω,0)=S_(Γ,χ,N). The correction term vanishes; its nonvanishing is a separate theorem.

Hypotheses: p is any prime. χ is primitive odd, of conductor N>1 prime to p, valued in a finite extension K of Q_p; its even p-adic character is θ=χω_p (omega_2 has conductor4). The actual branch is the preceding RJW branch L_p(θ,s). Morita Γ_p:Z_p→Z_p^× is imported with existence/continuity, uniqueness, natural interpolation and both unit/nonunit recurrences from the inherited L3 nodes. The scalar logarithm is the common Iwasawa branch log_p(p)=0, reflected through Q_p→K. u_N is the native unit of Z_p whose scalar is N. B_(1,χ)=Σ_(1≤a<N)χ(a)a/N is the existing algebraic special-value datum L(χ,0)=−B_(1,χ). Gamma arguments a/N mean a*u_N^(-1) in native Z_p.

Proof: Set χ(p)=1 in the full derivative formula and simplify the correction. Retain the native Gamma and common log; the derivative is not an arbitrary supplied Gamma-like interpolation.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-ferrero-greenberg`, `DirichletPadicLFunctions:L3/rjw2-fg-exceptional-zero`.

Acceptance: Under the same χ(p)=1 hypothesis, L_p′(χω,0)=S_(Γ,χ,N). The correction term vanishes; its nonvanishing is a separate theorem.

### The exceptional Gamma sum as an algebraic Gauss logarithm projection

**DirichletPadicLFunctions:L3/rjw2-fg-gauss-log-projection** · lemma

If χ(p)=1 and f is the order of p modulo N, group the Gamma sum by p-orbits in(Z/N)^×. The actual Gross–Koblitz comparison changes each orbit product of Γ_p into its compatible chosen-root negative Gauss sum times a power ofπ. Since log_pπ=0, S_Γ=Σ_orbits χ(a)log_p g(a), with no factor1/f.

Hypotheses: p is any prime. χ is primitive odd, of conductor N>1 prime to p, valued in a finite extension K of Q_p; its even p-adic character is θ=χω_p (omega_2 has conductor4). The actual branch is the preceding RJW branch L_p(θ,s). Morita Γ_p:Z_p→Z_p^× is imported with existence/continuity, uniqueness, natural interpolation and both unit/nonunit recurrences from the inherited L3 nodes. The scalar logarithm is the common Iwasawa branch log_p(p)=0, reflected through Q_p→K. u_N is the native unit of Z_p whose scalar is N. B_(1,χ)=Σ_(1≤a<N)χ(a)a/N is the existing algebraic special-value datum L(χ,0)=−B_(1,χ). Gamma arguments a/N mean a*u_N^(-1) in native Z_p. For the Gauss comparison enlarge K to a finite splitting extension L containing the compatible π, ζ_p and Teichmüller values of F_(p^f). Apply the common-log finite-extension law and then descend the identity along K→L. The original Gamma sum is still K-valued.

Proof: Because χ(p)=1 its coefficient is constant on every p-orbit, so the finite orbit product logarithm equals the sum of its Gamma logarithms. Use the inherited actual negative-Gauss/Gamma formula with the correct positive fractional arguments and exact exponent convention; its Dwork coefficient/splitting inputs remain explicit requests. Apply the common log to π^(p−1)=−p: in characteristic0, logπ=0. The compatible additive root is indispensable for this equality with the actual g(a).

Dependencies: `DirichletPadicLFunctions:L3/rjw2-fg-gamma-sum`, `DirichletPadicLFunctions:L3/robert-gross-koblitz-comparison`, `DirichletPadicLFunctions:L3/rjw2-gk-root-congruence`, `DirichletPadicLFunctions:L3/rjw2-gk-dyadic-root`, `ColemanIntegration:L0/iwasawa-logarithm`.

Acceptance: If χ(p)=1 and f is the order of p modulo N, group the Gamma sum by p-orbits in(Z/N)^×. The actual Gross–Koblitz comparison changes each orbit product of Γ_p into its compatible chosen-root negative Gauss sum times a power ofπ. Since log_pπ=0, S_Γ=Σ_orbits χ(a)log_p g(a), with no factor1/f.

### The separate arithmetic nonvanishing of the exceptional projection

**DirichletPadicLFunctions:L3/rjw2-fg-nonvanishing** · lemma

For primitive odd χ, p∤N and χ(p)=1, the actual exceptional Gamma/Gauss-log projection S_Γ is nonzero. Its proof needs the nonzero χ-projection of the Jacobi/Gauss ideal relations and Baker–Brumer algebraic-coefficient logarithmic independence; it does not follow from a finite sum or Gamma continuity.

Hypotheses: p is any prime. χ is primitive odd, of conductor N>1 prime to p, valued in a finite extension K of Q_p; its even p-adic character is θ=χω_p (omega_2 has conductor4). The actual branch is the preceding RJW branch L_p(θ,s). Morita Γ_p:Z_p→Z_p^× is imported with existence/continuity, uniqueness, natural interpolation and both unit/nonunit recurrences from the inherited L3 nodes. The scalar logarithm is the common Iwasawa branch log_p(p)=0, reflected through Q_p→K. u_N is the native unit of Z_p whose scalar is N. B_(1,χ)=Σ_(1≤a<N)χ(a)a/N is the existing algebraic special-value datum L(χ,0)=−B_(1,χ). Gamma arguments a/N mean a*u_N^(-1) in native Z_p.

Proof: Use the actual Gauss/Jacobi sums and their cyclotomic ideal factorization to exhibit a multiplicatively independent basis modulo roots of unity and rational powers of p whose χ-weight vector is nonzero. Apply the requested Baker–Brumer theorem to the corresponding p-adic logs, with the normalized branch and algebraic coefficients. Gross–Dasgupta§2 cites this argument but does not decompose the necessary character-projection/ideal calculation. This is explicitly an unresolved source-decomposition gap; no unconditional arithmetic nonvanishing is claimed by the prototype.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-fg-gauss-log-projection`, `IntegralIwasawaTheory:L4`, `IntegralIwasawaTheory:L0`.

Acceptance: A zero supplied logarithm makes fg-gamma-sum zero and therefore cannot satisfy the arithmetic hypotheses. Baker–Brumer alone does not prove that a chosen χ-weight vector is nonzero; the ideal calculation is separate.


Suggested signature boundary: Native scalar consequence only; the full target is the packet statement. The actual arithmetic supplier identification and its exact hypotheses are unavailable and remain the listed request/gap.

### The simple exceptional zero of the actual analytic branch

**DirichletPadicLFunctions:L3/rjw2-fg-simple-zero** · lemma

For the above primitive odd χ with χ(p)=1, the actual nontrivial even branch L_p(χω,s) is analytic near0, has value0 and derivative S_Γ≠0, and hence analytic order1 (also meromorphic order1) at0.

Hypotheses: p is any prime. χ is primitive odd, of conductor N>1 prime to p, valued in a finite extension K of Q_p; its even p-adic character is θ=χω_p (omega_2 has conductor4). The actual branch is the preceding RJW branch L_p(θ,s). Morita Γ_p:Z_p→Z_p^× is imported with existence/continuity, uniqueness, natural interpolation and both unit/nonunit recurrences from the inherited L3 nodes. The scalar logarithm is the common Iwasawa branch log_p(p)=0, reflected through Q_p→K. u_N is the native unit of Z_p whose scalar is N. B_(1,χ)=Σ_(1≤a<N)χ(a)a/N is the existing algebraic special-value datum L(χ,0)=−B_(1,χ). Gamma arguments a/N mean a*u_N^(-1) in native Z_p.

Proof: The actual finite nontrivial character branch admits an analytic clearing denominator near0; choose an admissible unit for its central character. The same chart convergence argument used near1 applies after translation. Combine the independently established interpolation zero, derivative formula and arithmetic nonvanishing. Use the native analytic order-one criterion; do not infer simplicity from the Euler interpolation zero alone.

Dependencies: `DirichletPadicLFunctions:L3/rjw2-fg-exceptional-zero`, `DirichletPadicLFunctions:L3/rjw2-fg-exceptional-derivative`, `DirichletPadicLFunctions:L3/rjw2-fg-nonvanishing`, `DirichletPadicLFunctions:L3/rjw2-nonprincipal-analytic`, `DirichletPadicLFunctions:L3/rjw2-analytic-numerator-convergence`, `mathlib:AnalyticAt.analyticOrderAt_eq_natCast`.

Acceptance: For the above primitive odd χ with χ(p)=1, the actual nontrivial even branch L_p(χω,s) is analytic near0, has value0 and derivative S_Γ≠0, and hence analytic order1 (also meromorphic order1) at0.

### The full tame primitive realizes the actual logarithmic function

**DirichletPadicLFunctions:L3/rjw2-tame-log-realization** · lemma

For primitive η of conductor D>1 with p∤D, the inherited full primitive Ftilde=C(C_η)+H_η is restricted on every radius below1 and, for ||T||<1, its native scalar-series evaluation is −G(η^(-1))^(-1)Σ_units η^(-1)(c)log_p(ε_D^c(1+T)−1). Thus the formal primitive has the actual source logarithm constant as well as the actual analytic function.

Hypotheses: θ is nontrivial primitive of conductor N=Dp^n, D prime to p. K is a finite splitting extension containing the specified primitive root ε_N and θ-values; the Gauss sum G(θ^(-1)) uses that same root and is nonzero. Write C_θ=−G^(-1)Σ_units θ^(-1)(c)log_p(1−ε_N^c), the existing cyclotomic-logarithmic-constant, not a new definition. The complex logarithmic formula is already complex-lvalue-one-log; it is reused with N as its modulus. L_p is the actual RJW branch above. The common logarithm is imported from Coleman L0. Changing ε_N changes the Gauss sum simultaneously; there is no canonical identification of a complex transcendental value with a p-adic number.

Proof: For each unit-indexed z=ε_D^c the inherited tame norm theorem gives ||z−1||=||z/(z−1)||=1. Hence ||(z/(z−1))T||<1. Apply the common logarithm local HasSum to (z−1)(1+zT/(z−1))=z(1+T)−1. The constant is log_p(z−1) and the remaining coefficients are exactly those of the rescaled formal logarithm. Take the finite weighted sum, divide by the same nonzero Gauss denominator, and use the inherited full constant/coefficient formulas. HasSum uniqueness and LAD native evaluation identify the function. No disc-function carrier or new logarithm is defined.

Dependencies: `DirichletPadicLFunctions:L3/tame-logarithmic-primitive-with-constant`, `DirichletPadicLFunctions:L3/tame-cyclotomic-logarithm-argument-norm`, `DirichletPadicLFunctions:L3/tame-logarithmic-constant-restrictedness`, `DirichletPadicLFunctions:L3/normalized-tame-logarithmic-coefficients`, `ColemanIntegration:L0/iwasawa-logarithm`, `LocallyAnalyticDistributions:L1/open-disc-native-radius`, `mathlib:PowerSeries.log`, `mathlib:PowerSeries.coeff`.

Acceptance: For primitive η of conductor D>1 with p∤D, the inherited full primitive Ftilde=C(C_η)+H_η is restricted on every radius below1 and, for ||T||<1, its native scalar-series evaluation is −G(η^(-1))^(-1)Σ_units η^(-1)(c)log_p(ε_D^c(1+T)−1). Thus the formal primitive has the actual source logarithm constant as well as the actual analytic function.

### The actual mixed twisted constant has the joint Gauss normalization

**DirichletPadicLFunctions:L3/rjw2-mixed-log-constant** · lemma

For q=p^n, n≥1, D>1 prime to p, primitive χ modq and η modD, and θ(c)=χ(c modq)η(c modD), use roots ε_q,ε_D and ε_N=ε_qε_D of primitive order N=qD. The actual finite Gauss-twist of C_η has constant C_θ, with positive coefficient1/G(χ^(-1)) and no extra sign or CRT scalar.

Hypotheses: θ is nontrivial primitive of conductor N=Dp^n, D prime to p. K is a finite splitting extension containing the specified primitive root ε_N and θ-values; the Gauss sum G(θ^(-1)) uses that same root and is nonzero. Write C_θ=−G^(-1)Σ_units θ^(-1)(c)log_p(1−ε_N^c), the existing cyclotomic-logarithmic-constant, not a new definition. The complex logarithmic formula is already complex-lvalue-one-log; it is reused with N as its modulus. L_p is the actual RJW branch above. The common logarithm is imported from Coleman L0. Changing ε_N changes the Gauss sum simultaneously; there is no canonical identification of a complex transcendental value with a p-adic number.

Proof: Use the native CRT equivalence on units modulo qD. With the root ε_qε_D, the additive character separates as ε_q^(c modq)ε_D^(c modD). Thus the positive Gauss denominator factors as G(χ^(-1))G(η^(-1)). Evaluate the actual full tame logarithmic primitive at the q-root translate. Its inverse-character finite logarithm sum has argument ε_q^a ε_D^b−1; tame-log-realization justifies every such evaluation. Multiply the two positive Gauss normalizations and reindex the finite pair (a,b) by CRT to c. The single initial minus sign from C_η gives exactly the inherited C_θ. General Gauss-sum construction/nonvanishing remains ModularForms ownership; this is only the needed arithmetic constant comparison.

Dependencies: `DirichletPadicLFunctions:L3/cyclotomic-logarithmic-constant`, `DirichletPadicLFunctions:L2/prime-power-character-gauss`, `DirichletPadicLFunctions:L3/cyclotomic-logarithmic-root-transport`, `DirichletPadicLFunctions:L3/rjw2-tame-log-realization`.

Acceptance: For q=p^n, n≥1, D>1 prime to p, primitive χ modq and η modD, and θ(c)=χ(c modq)η(c modD), use roots ε_q,ε_D and ε_N=ε_qε_D of primitive order N=qD. The actual finite Gauss-twist of C_η has constant C_θ, with positive coefficient1/G(χ^(-1)) and no extra sign or CRT scalar.

## Sources and baseline

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`. Reviewed L3 audit: not built. Every listed baseline statement was read at the Mathlib pin. No declarations index was available, so the packet check validates baseline reference form; the suggested native signatures provide an additional type check.

- [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Joaquín Rodrigues Jacinto and Chris Williams, Essential Number Theory4(1),2025,99–158. Read2026-10-05: §5.3 printed145–148: definitions, conventions and interpolation; §§6–7 printed149–158: value at one and pole, full selected sections; source images148–149 inspected. SHA-256 `78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6`.
- [Gauss sums and the p-adic Gamma function](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf), Benedict H. Gross and Neal Koblitz, Annals of Mathematics109(3),1979,569–581. Read2026-10-05: §1 printed569–571: chosen roots, negative Gauss normalization and Theorem1.7; all three pages visually inspected. SHA-256 `c54a94b53d942cfcad2300de04f4f022ec20b2c3a0a7e110464b699484d3d522`.
- [A p-adic analogue of the Gamma function](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf), Yasuo Morita, Journal of the Faculty of Science, University of Tokyo22,1975,255–266. Read2026-10-05: §1 printed255–256: unsigned natural product, signed continuous extension and two recurrences; both scanned pages visually read. SHA-256 `cad5af477bc19847e46d5af98c294a289f30096128b9e799799dfdb88ce05912`.
- [Two encounters with the p-adic Stark conjecture](https://services.math.duke.edu/~dasgupta/papers/Gross.pdf), Benedict H. Gross and Samit Dasgupta, Author copy dated2022. Read2026-10-05: §2 printed4–5: exceptional zero, Gamma derivative formula and the cited Brumer nonvanishing argument. SHA-256 `052d4f5f5aae5a57dfa1dcc669b4e7b431218ddc50619bd457187f557e1b2027`.
- [Sum expressions for Kubota–Leopoldt p-adic L-functions](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1DF77ECEC0EE657089F2E26C0F8AA351/S0013091522000177a.pdf/sum_expressions_for_kubotaleopoldt_padic_lfunctions.pdf), Luochen Zhao, Proceedings of the Edinburgh Mathematical Society65(2),2022,460–479, DOI10.1017/S0013091522000177. Read2026-10-05: §3 printed467–470: measure periods and actual sum expression; full §4 printed470–473: derivative proof; AppendicesA–B printed473–474: permutation and antidifferences; printed474 visually inspected. SHA-256 `923b85f7e3e7e55b4636ff98be2ca5f11a469ec10abe1ee15d6ede55a6936661`.

Inherited Robert source locators are taken from the accepted predecessor; this run did not independently reread Robert’s book. Only the selected public sections above are claimed as fresh reads.
