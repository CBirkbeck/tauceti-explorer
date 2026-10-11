# Arithmetic Dirichlet series and Tauberian methods, Part II: analytic number theory and zeta functions

This roadmap develops quantitative prime distribution and analytic zeta-function interfaces on top of Arithmetic Dirichlet series and Tauberian methods. Its arithmetic coefficient carriers, norm regrouping, Euler products, Perron summation, Landau positivity and Wiener–Ikehara transfer are imported. The new targets concern canonical products and zero-free regions, explicit formulas and zero density, arithmetic Hecke/Artin comparisons, multiplicative means and Beurling systems, and the branch structure of Hurwitz–Lerch functions.

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. A library citation denotes the declaration at that pin. A roadmap citation denotes a mathematical supplier contract. The [suggested file](../suggested/AnalyticNumberTheory--AN.0.lean) gives admitted Lean forms; the mathematical statements below are definitive.

## Scope and dependencies

AN.0 and AN.1 import the arithmetic-series infrastructure and the pinned Riemann/Dirichlet continuation and functional equations. AN.6 supplies consumer links rather than additional mathematics. The active layers are AN.2, AN.3, AN.4, AN.5 and AN.7. Their targets, including the auxiliary identifiers used by consumers, are specified below.

Tate’s adelic continuation, gamma factors and functional equations belong to AutomorphicLFunctionsAndLocalFactors AL.0–AL.1. GlobalNumberFields supplies the Hecke/ray/idele character dictionary and the primitive quadratic field character. ClassFieldTheory supplies reciprocity and abelian conductor comparisons. General finite-dimensional Artin conductors require the ArtinRepresentations supplier identified by NumberFieldArithmetic; the latter supplies ramification groups and permutation discriminant formulas. The quadratic CM/geodesic arithmetic dictionary belongs to GN.3, Eisenstein analysis to AS.1–AS.2, and the core-surface construction to the proposed FuchsianOrbifolds Part II.

Qualitative number-field Chebotarev is imported from Chebotarev. Effective estimates belong to its designated Zeros of L-functions Layer8.7 supplier. Arithmetic-scheme Chebotarev needs a separate extension. AN.3 remains one layer; no reverse import from SV.2 is used. Generic Dirichlet-series and Tauberian material is owned by ArithmeticDirichletSeries. The current roadmaps and Tau Ceti exports are imported wherever they already provide the target.

## Conventions

- A Dirichlet-series or Euler-product identity is asserted on its convergence half-plane. Its totalized sum outside that domain is distinguished from meromorphic continuation. Deleted factors, pole clearing and residues are separate operations.
- Zeros are counted with analytic multiplicity. The finite zero multiset uses the strict height cutoff |Im ρ|<T. The truncated explicit formula uses half weighting at prime powers, the exact nearest-distinct-prime-power error, and the finite endpoint Perron kernel arctan(T/c)/π.
- Entire order at most ρ means that every exponent b>ρ admits its own growth constant. Xi has an exp(C|s|log(2+|s|)) majorant. Eₙ(w)=(1−w)exp(Σₖ₌₁ⁿ wᵏ/k), including E₀(w)=1−w. Paired product positivity retains the nonpolynomial hypothesis.
- Partial zeta coefficients count nonzero integral ideals, with the ordinary or narrow class group specified. Artin factors are determinants on actual inertia invariants and include ramified primes. Their arithmetic coefficients are multiplicative on ideals and then regrouped by norm.
- For a squarefree radicand d≠0,1, the primitive field character has conductor |D(d)|, where D(d)=d if d≡1 mod4 and4d otherwise. Its factor at2 is the Kronecker factor. Exceptional-squareclass predicates permit finite and empty sets; they assert no existence of an exceptional zero.
- Pretentious distance is defined for unit-disc prime values, where its diagonal can be positive. Smoothness means p≤y and uses the pinned strict cutoff floor(y)+1. Dickman’s negative extension is zero.
- Beurling primes are indexed. Generalized integers are finitely supported exponent vectors, so equal real norms retain their multiplicities. Every real-exponent series with σ>1 must converge for the analytic targets.
- The initial Lerch series uses |z|<1, Re c>0 and the principal log of n+c. The periodic series is zΦ(z,s,1). The z=1 Hurwitz stratum requires its own domain and limiting statement. The Lerch cover removes z=0,1 and c=0,−1,−2,… . Positive continuation along γ is evaluation at γ⁻¹•u under the pinned Tau Ceti cover action.

## Green–Tao analytic interface

The AC.4 consumer uses Green–Tao’s 2008 proof. LemmaA.1 (p.541) needs one absolute β∈(0,1) and a logarithmic bound on the whole strip 1−β/log(|t|+2)≤σ≤10. The pole at1 has residue1. Its removable pole-cleared extension ζ(s)−(s−1)⁻¹ and the reciprocal extension both have norm at most C log(|t|+2); the reciprocal is zero at1. The weak convexity estimate used in AppendixA (A.5), p.544, has exponent 1−σ+ε on 1/2≤σ≤1. These are separate targets below.

If W varies with N, choose a slow w and prove the modulus range before using a progression estimate. For N>1 and W(N)=primorial(floor₊w(N)), the pinned identities give log W=θ(w)≤(log4)w when w≥0. Thus w(N)≤B log log N/log4 yields W(N)≤(log N)^B. Apply the uniform Siegel–Walfisz target in that range. A fixed-modulus prime number theorem does not give this uniform error. [Green–Tao, AppendixA pp.541–544](https://annals.math.princeton.edu/wp-content/uploads/annals-v167-n2-p03.pdf).

## Uniform Artin factors in the Colmez family

Fix g≥1. For every degree-2g CM field E, take its actual normal closure L over ℚ, G=Gal(L/ℚ), and central complex conjugation c. The family F(E) consists of isomorphism classes of nontrivial irreducible complex G-representations with ρ(c)=−Id. Then |G|, the family size and every representation dimension are bounded by M_g=(2g)!. The quantitative CM supplier identifies the factors in the averaged height expression with this family, bounds their rational coefficients by B_g, and separates the trivial factor before evaluation at1. Constants in the four analytic targets are uniform in E and ρ∈F(E).

The conductor is the canonical Artin conductor. The sufficient arithmetic bound is log f_ρ≤C_g(1+log D_E). Use the odd completion Λ_ρ(s)=f_ρ^(s/2)Γ_R(s+1)^dimρ L(s,ρ), Γ_R(s)=π^(−s/2)Γ(s/2), and the dual functional equation. Its gamma factors are finite and nonzero at0 and1. Nonzero continued L-values at those endpoints precede logarithmic differentiation.

Use an integral monomial Brauer expression with one-dimensional finite-order characters, bounded sum of absolute integer coefficients and bounded number of terms. For each term define H_j as the holomorphic, nonzero extension at1 of (s−1)^δ_j L_j(s), with δ_j=1 for a trivial Hecke character and0 otherwise. The signed pole orders sum to zero. The local product identity L_ρ=∏H_j^n_j then supplies values and logarithmic derivatives. A Cauchy bound on L′ alone does not bound L′/L: reciprocal values or the regularized Hecke logarithmic-derivative bound are required. [Tsimerman, Theorem3.2 and Corollary3.3 pp.383–384](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf).

## AN.2 — Prime number theorems and quantitative zero theory

### Canonical products and finite order

<a id="entire-order-at-most"></a>

#### Entire order at most ρ

`AnalyticNumberTheory:AN.2/entire-order-at-most` · definition · `TauCeti.AnalyticNumberTheory.entire_order_at_most`.

For a complex function f and real ρ, orderAtMost(f,ρ) means ρ≥0, f is entire, and for every b>ρ there is C_b>0 with |f(z)|≤C_b exp(|z|^b) for all z. At ρ=0 this is the same infimum-order convention, including polynomials and the zero function; the latter is excluded in factorization theorems. It is an upper-order predicate, not an exact-order or exponential-type predicate.

**Construction and proof.**

1. Use the displayed conjunction on the existing complex-function carrier. Compact continuity turns the source's large-radius bound into the global bound; conversely the global bound implies the asymptotic bound.
2. For products at exponent b>ρ choose ρ<b′<b; absorb 2r^b′ into r^b outside a fixed ball and use compact boundedness inside it.

**API.**

- `entire_order_at_most.bound` (projection): Every exponent strictly larger than ρ has its own global multiplicative growth constant.
- `entire_order_at_most.mono` (compatibility): If ρ≤ρ′ and orderAtMost(f,ρ), then orderAtMost(f,ρ′).
- `entire_order_at_most.polynomial` (example): Every polynomial has order at most 0.
- `entire_order_at_most.product` (structure): Products of entire functions of order at most ρ≥0 again have order at most ρ.

**Unit tests.**

- `entire_order_at_most.exp` (computation): exp(z) has order at most 1.
- `entire_order_at_most.exp_square` (non-example): exp(z²) does not have order at most 1.
- `entire_order_at_most.polynomial` (degenerate): 1−z² has order at most 0.
- `entire_order_at_most.xi` (compatibility): For every entire f and real C, if |f(z)|≤exp(C|z|log(2+|z|)) for every z, then orderAtMost(f,1). This upper bound alone asserts neither exact order one nor failure of finite exponential type.
- `entire_order_at_most.zero` (degenerate): The identically zero function has order at most zero.

**Acceptance.** exp(z) has order at most 1. exp(z²) does not have order at most 1. 1−z² has order at most 0. For every entire f and real C, if |f(z)|≤exp(C|z|log(2+|z|)) for every z, then orderAtMost(f,1). This upper bound alone asserts neither exact order one nor failure of finite exponential type.

**Uses.** `PAPER-YUN-ZHANG-17/47`: Uniform canonical-product genus and polynomial degree.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Definition 8.1, printed p.47; extension to ρ=0 by the same growth condition.

**Atlas planet.** Finite-order entire functions.

<a id="genus-one-factor"></a>

#### Genus-one canonical factor

`AnalyticNumberTheory:AN.2/genus-one-factor` · definition · `TauCeti.AnalyticNumberTheory.genus_one_factor`.

E₁(w)=(1−w)exp(w), for every complex w.

**Construction and proof.**

1. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

**API.**

- `genus_one_factor.value` (characterisation): The function is exactly (1−w)exp(w).
- `genus_one_factor.entire` (structure): E₁ is entire.
- `genus_one_factor.zeros` (characterisation): Its only zero is w=1 and that zero is simple.
- `genus_one_factor.pair` (relation): E₁(w)E₁(−w)=1−w².

**Unit tests.**

- `genus_one_factor.origin` (computation): E₁(0)=1.
- `genus_one_factor.root` (computation): E₁(1)=0.
- `genus_one_factor.derivative` (computation): E₁′(0)=0, which excludes the uncorrected factor 1−w.

**Acceptance.** E₁(0)=1. E₁(1)=0. E₁′(0)=0, which excludes the uncorrected factor 1−w.

**Uses.** `PAPER-YUN-ZHANG-17/47`: Order-one canonical product.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7, (8.2.3), printed p.49; corrected quadratic sign in E6.

<a id="canonical-factor"></a>

#### Elementary canonical factors of every genus

`AnalyticNumberTheory:AN.2/canonical-factor` · definition · `TauCeti.AnalyticNumberTheory.canonical_factor`.

For n≥0 define E_n(w)=(1−w)exp(Σ_(j=1)^n w^j/j), with an empty sum for n=0. This is an entire function with a simple zero exactly at1. Genus1 agrees with the existing E₁.

**Construction and proof.**

1. Use the finite polynomial sum and exponential. On |w|≤1/2 cancel the first n Taylor coefficients of log(1−w); the remaining series is O_n(|w|^(n+1)).

**API.**

- `canonical_factor.zero_genus` (simp): E₀(w)=1−w.
- `canonical_factor.one_genus` (compatibility): E₁(w)=(1−w)e^w equals genus_one_factor.
- `canonical_factor.entire` (structure): E_n is entire for every n.
- `canonical_factor.zeros` (characterisation): E_n(w)=0 iff w=1, and its vanishing order there is1.
- `canonical_factor.log_tail` (relation): There is C_n>0 with |log(1−w)+Σ_(j=1)^n w^j/j|≤C_n|w|^(n+1) for |w|≤1/2, using the principal analytic log.

**Unit tests.**

- `canonical_factor.origin` (degenerate): E_n(0)=1 for every n.
- `canonical_factor.root` (computation): E_n(1)=0 for every n.
- `canonical_factor.genus_zero` (computation): E₀(w)=1−w, with no exponential factor.
- `canonical_factor.genus_one` (computation): E₁(w)E₁(−w)=1−w².

**Acceptance.** Verify the stated constants, endpoints and conventions against the source and discriminating examples.

**Uses.** `AnalyticNumberTheory:AN.2`: Elementary canonical factors of every genus

**Sources.** [Shtukas and the Taylor expansion of L-functions](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p02-p.pdf), AppendixB.1, definition preceding(B.1), printed p.901.

<a id="origin-zero-factor"></a>

#### Isolate the origin zero

`AnalyticNumberTheory:AN.2/origin-zero-factor` · lemma · `TauCeti.AnalyticNumberTheory.origin_zero_factor`.

For nonzero entire f, with m=analyticOrderNatAt f 0, there is an entire g with g(0)≠0 and f(z)=z^m g(z) for all z. If f has order at most ρ≥0, so does g.

**Construction and proof.**

1. Entirety and the identity theorem exclude a locally zero germ. The finite analytic-order factorization gives a local analytic g with g(0)≠0.
2. Define g(z)=f(z)/z^m off zero and use that local residual value at zero; equality to the analytic residual on a neighbourhood patches the quotient analytically. No unverified global removable-singularity theorem is required.
3. For |z|≥1 division by z^m cannot increase the bound. Continuity bounds the remaining compact ball.

**Dependencies.** `mathlib:AnalyticAt.analyticOrderAt_eq_natCast`, [`AnalyticNumberTheory:AN.2/entire-order-at-most`](#entire-order-at-most), `mathlib:AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq`, `mathlib:AnalyticAt.analyticOrderAt_ne_top`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

<a id="compact-zero-count"></a>

#### Multiplicity count of compact zeros

`AnalyticNumberTheory:AN.2/compact-zero-count` · lemma · `TauCeti.AnalyticNumberTheory.compact_zero_count`.

A nonzero entire f has finitely many zeros in each closed disk, and every zero has finite analytic multiplicity.

**Construction and proof.**

1. The nonzero entire hypothesis and the identity theorem exclude a locally zero germ at every point; hence each analytic order is finite.
2. Apply the global isolated-zero/codiscrete theorem on C. Restrict its codiscrete nonzero set to a closed disk and apply the compact finite-complement theorem; sum the finitely many finite multiplicities.

**Dependencies.** `mathlib:AnalyticAt.analyticOrderAt_eq_natCast`, `mathlib:AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq`, `mathlib:AnalyticOnNhd.eqOn_zero_or_eventually_ne_zero_of_preconnected`, `mathlib:IsCompact.finite_sdiff_of_mem_codiscreteWithin`, `mathlib:AnalyticAt.analyticOrderAt_ne_top`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.4 and Remark 8.6, printed p.48; Theorem 8.7 proof, printed p.49.

<a id="jensen-growth-zero-count"></a>

#### Zero count from an order bound

`AnalyticNumberTheory:AN.2/jensen-growth-zero-count` · lemma · `TauCeti.AnalyticNumberTheory.jensen_growth_zero_count`.

If g is entire, g(0)≠0 and has order at most ρ, then for every b>ρ the number n_g(r) of zeros with multiplicity in |z|≤r is O_b(r^b) for r≥1.

**Hypotheses.** ρ≥0; g entire and g(0)≠0; orderAtMost(g,ρ); r≥1; zeros are counted with analytic multiplicity.

**Construction and proof.**

1. For b>ρ, enlarge the global growth constant so M=C_b exp((2r)^b)≥1. Apply the pinned Jensen inequality with centre 0, positive inner radius r and outer radius 2r.
2. The exact upper bound is log(M/|g(0)|)/log 2. It is bounded by K_{g,b}r^b for r≥1. Pinned Jensen permits zeros on the outer circle; its stated analytic-neighbourhood hypothesis holds by entirety.

**Dependencies.** [`AnalyticNumberTheory:AN.2/entire-order-at-most`](#entire-order-at-most), `mathlib:AnalyticOnNhd.sum_divisor_le`, [`AnalyticNumberTheory:AN.2/origin-zero-factor`](#origin-zero-factor), [`AnalyticNumberTheory:AN.2/compact-zero-count`](#compact-zero-count).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.4 and Remark 8.6, printed p.48; Theorem 8.7 proof, printed p.49.

<a id="dyadic-zero-reciprocal-square"></a>

#### Summable reciprocal squares of zeros

`AnalyticNumberTheory:AN.2/dyadic-zero-reciprocal-square` · lemma · `TauCeti.AnalyticNumberTheory.dyadic_zero_reciprocal_square`.

For a nonzero entire g with g(0)≠0 and order at most one, its nonzero zero family α_i, with every index carrying one occurrence of analytic multiplicity, satisfies Σ_i|α_i|⁻²<∞. Finite and empty index sets are included.

**Construction and proof.**

1. Choose b=3/2 in the Jensen zero count.
2. Split |α|≥1 into dyadic annuli; their contributions are bounded by C·2^(−j/2). Handle the finitely many inner zeros separately.

**Dependencies.** [`AnalyticNumberTheory:AN.2/jensen-growth-zero-count`](#jensen-growth-zero-count), [`AnalyticNumberTheory:AN.2/compact-zero-count`](#compact-zero-count).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.4 and Remark 8.6, printed p.48; Theorem 8.7 proof, printed p.49.

<a id="canonical-factor-log-tail"></a>

#### Small canonical-factor logarithm

`AnalyticNumberTheory:AN.2/canonical-factor-log-tail` · lemma · `TauCeti.AnalyticNumberTheory.canonical_factor_log_tail`.

On |w|≤1/2 set L(w)=Log(1−w)+w, using the principal logarithm. This is the analytic logarithm of E₁(w) with L(0)=0: exp L(w)=E₁(w), L(w)=−Σ_{k≥2}w^k/k, and |L(w)|≤|w|². The logarithm series and its numerical remainder estimate are imported pinned results, not new versions of those general results.

**Construction and proof.**

1. For |w|≤1/2, 1−w lies in the slit plane. Its principal logarithm is analytic and exp(Log(1−w)+w)=(1−w)exp(w).
2. Subtract the n=0 and n=1 terms from the pinned HasSum logarithm expansion. Substitute z=−w in the pinned remainder estimate and use 2(1−|w|)≥1.

**Dependencies.** [`AnalyticNumberTheory:AN.2/genus-one-factor`](#genus-one-factor), `mathlib:Complex.norm_log_one_add_sub_self_le`, `mathlib:Complex.hasSum_taylorSeries_neg_log`, `mathlib:analyticAt_clog`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

<a id="canonical-product-compact-tail"></a>

#### Uniform tail bound for the canonical product

`AnalyticNumberTheory:AN.2/canonical-product-compact-tail` · lemma · `TauCeti.AnalyticNumberTheory.canonical_product_compact_tail`.

Under the stated family hypotheses, for R>0 the log-factor tails Σ_{i in S, |α_i|>2R}(Log(1−z/α_i)+z/α_i), directed by finite subsets S, converge uniformly for |z|≤R. Every omitted-tail norm is at most R² times the corresponding reciprocal-square tail.

**Hypotheses.** An indexed family α_i of nonzero complex numbers; every bounded disk contains finitely many indices, with repeated values representing multiplicity; Σ_i|α_i|⁻²<∞.

**Construction and proof.**

1. Use the small-factor logarithm bound and dominate every tail by R²Σ_tail |α|^−2.
2. Keep the finite inner factors outside the logarithm to allow zeros inside the disk.

**Dependencies.** [`AnalyticNumberTheory:AN.2/dyadic-zero-reciprocal-square`](#dyadic-zero-reciprocal-square), [`AnalyticNumberTheory:AN.2/canonical-factor-log-tail`](#canonical-factor-log-tail).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

<a id="canonical-product-entire"></a>

#### Entire locally uniform canonical product

`AnalyticNumberTheory:AN.2/canonical-product-entire` · lemma · `TauCeti.AnalyticNumberTheory.canonical_product_entire`.

Under the stated family hypotheses, finite-subset products ∏_{i∈S}E₁(z/α_i), directed by inclusion of finite subsets, converge locally uniformly on C to the unordered product P(z). P is entire and P(0)=1. Enumeration changes preserve this product; finite and empty families are included.

**Hypotheses.** An indexed family α_i of nonzero complex numbers; every bounded disk contains finitely many indices, with repeated values representing multiplicity; Σ_i|α_i|⁻²<∞.

**Construction and proof.**

1. Exponentiate the uniformly convergent logarithmic tail and multiply by the finite inner factors.
2. Apply the pinned locally uniform holomorphic-limit theorem.

**Dependencies.** `mathlib:TendstoLocallyUniformlyOn.differentiableOn`, [`AnalyticNumberTheory:AN.2/canonical-product-compact-tail`](#canonical-product-compact-tail).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

<a id="canonical-product-zero-orders"></a>

#### Zero divisor of the canonical product

`AnalyticNumberTheory:AN.2/canonical-product-zero-orders` · lemma · `TauCeti.AnalyticNumberTheory.canonical_product_zero_orders`.

For the preceding P, its zeros are exactly the α, with the listed multiplicities, and P is nonzero elsewhere.

**Hypotheses.** An indexed family α_i of nonzero complex numbers; every bounded disk contains finitely many indices, with repeated values representing multiplicity; Σ_i|α_i|⁻²<∞.

**Construction and proof.**

1. At a chosen zero separate all its equal finite factors from a nonvanishing uniformly convergent tail.
2. Use the simple zero of E₁ and the pinned analytic-order local factorization.

**Dependencies.** `mathlib:AnalyticAt.analyticOrderAt_eq_natCast`, [`AnalyticNumberTheory:AN.2/canonical-product-entire`](#canonical-product-entire), [`AnalyticNumberTheory:AN.2/canonical-product-compact-tail`](#canonical-product-compact-tail), [`AnalyticNumberTheory:AN.2/genus-one-factor`](#genus-one-factor).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

<a id="continuous-log-analytic-upgrade"></a>

#### Analyticity of a continuous logarithm

`AnalyticNumberTheory:AN.2/continuous-log-analytic-upgrade` · lemma · `TauCeti.AnalyticNumberTheory.continuous_log_analytic_upgrade`.

If g is analytic and nonzero on open U, and a continuous L satisfies exp(L)=g on U, then L is analytic on U.

**Construction and proof.**

1. For x∈U, shrink to a neighbourhood where g(y)/g(x) lies near 1 in the slit plane. Define the analytic local lift ℓ(y)=L(x)+Log(g(y)/g(x)); then exp ℓ=g and ℓ(x)=L(x).
2. By the pinned exponential-kernel theorem L(y)−ℓ(y) is an integer multiple of 2πi. Continuity makes its norm <2π on a smaller neighbourhood, where it must be zero. Thus L locally equals the analytic ℓ, with no simply connected hypothesis on U.

**Dependencies.** `mathlib:analyticAt_clog`, `mathlib:Complex.exp_eq_one_iff`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

<a id="zero-free-entire-log"></a>

#### Entire logarithm of the quotient

`AnalyticNumberTheory:AN.2/zero-free-entire-log` · lemma · `TauCeti.AnalyticNumberTheory.zero_free_entire_log`.

For nonzero entire f and its origin factor z^m P with the same zero divisor, the quotient extends to a nonvanishing entire q and q=exp(h) for an entire h.

**Construction and proof.**

1. Use the finite local zero-order factorizations for numerator and denominator. Equal multiplicities cancel, leaving an analytic nonzero quotient in each zero neighbourhood; patch this with f/(z^mP) off the zero set.
2. The patched q is continuous and nonzero on the open simply connected set C. Apply the pinned continuous-log existence theorem there, then continuous-log-analytic-upgrade.

**Dependencies.** `mathlib:Complex.exists_continuousOn_eqOn_exp_comp`, [`AnalyticNumberTheory:AN.2/origin-zero-factor`](#origin-zero-factor), [`AnalyticNumberTheory:AN.2/canonical-product-zero-orders`](#canonical-product-zero-orders), [`AnalyticNumberTheory:AN.2/continuous-log-analytic-upgrade`](#continuous-log-analytic-upgrade).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

<a id="summable-excluded-radii"></a>

#### A good radius in every long-enough interval

`AnalyticNumberTheory:AN.2/summable-excluded-radii` · lemma · `TauCeti.AnalyticNumberTheory.summable_excluded_radii`.

If forbidden intervals around |α| have total length at most M<∞, then every [r,r+M+1] contains a radius not in their union.

**Construction and proof.**

1. The interval has length M+1, while the union has outer length≤M.
2. Consequently the good radii have bounded gaps, not merely a subsequence tending to infinity.

**Dependencies.** [`AnalyticNumberTheory:AN.2/dyadic-zero-reciprocal-square`](#dyadic-zero-reciprocal-square).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

<a id="canonical-product-lower-good-circles"></a>

#### Lower bound for P on good circles

`AnalyticNumberTheory:AN.2/canonical-product-lower-good-circles` · lemma · `TauCeti.AnalyticNumberTheory.canonical_product_lower_good_circles`.

For every 0<ε<1 there is C_ε>0 such that every good radius R≥2 satisfying |R−|α_i||>|α_i|⁻² for all i obeys log|P(z)|≥−C_ε R^(1+ε) for every |z|=R. Every [r,r+M+1] with r≥2 contains such a radius, where M=2Σ_i|α_i|⁻²; thus the good radii have bounded gaps.

**Hypotheses.** An indexed nonzero locally finite zero family α_i, counted with multiplicity, whose n_α(t) is O_b(t^b) for every b>1. P is its genus-one unordered canonical product, including finite/empty families.

**Construction and proof.**

1. Choose b=1+ε/2, and fix its zero-count constant before R. Split factors into |α_i|<R/2, R/2≤|α_i|≤2R and |α_i|>2R.
2. Apply the three named inner/middle/outer lower-bound lemmas. The first two factors are finite and nonzero; the outer factor is a nonzero exponential. Their product is P by finite/infinite product splitting.
3. Use 1+log(2R)≤K_ε R^(ε/2) for R≥2 to absorb the middle range and add the bounds. Each forbidden closed interval has length 2|α_i|⁻²; summable-excluded-radii supplies a good radius in every interval of length M+1.

**Dependencies.** [`AnalyticNumberTheory:AN.2/summable-excluded-radii`](#summable-excluded-radii), [`AnalyticNumberTheory:AN.2/dyadic-zero-reciprocal-square`](#dyadic-zero-reciprocal-square), [`AnalyticNumberTheory:AN.2/canonical-product-inner-lower-bound`](#canonical-product-inner-lower-bound), [`AnalyticNumberTheory:AN.2/canonical-product-middle-lower-bound`](#canonical-product-middle-lower-bound), [`AnalyticNumberTheory:AN.2/canonical-product-outer-lower-bound`](#canonical-product-outer-lower-bound).

**Acceptance.** Finite or empty zero families satisfy the same bounded-gap statement; no infinite-zero enumeration is presumed. Constants depend on the family and ε, and are fixed before the radius and the point on its circle.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

<a id="hadamard-log-growth"></a>

#### Growth of the entire quotient logarithm

`AnalyticNumberTheory:AN.2/hadamard-log-growth` · lemma · `TauCeti.AnalyticNumberTheory.hadamard_log_growth`.

For nonzero entire f of order at most1 and q=f/(z^mP)=exp h, for every ε>0, Re h(z)≤C_ε(1+|z|^(1+ε)) on C.

**Construction and proof.**

1. Use the f upper bound and P lower bound on good circles.
2. Fill every bounded gap between good radii by the maximum principle for Re h.

**Dependencies.** [`AnalyticNumberTheory:AN.2/zero-free-entire-log`](#zero-free-entire-log), [`AnalyticNumberTheory:AN.2/canonical-product-lower-good-circles`](#canonical-product-lower-good-circles).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

<a id="borel-cauchy-affine-log"></a>

#### The quotient logarithm is affine

`AnalyticNumberTheory:AN.2/borel-cauchy-affine-log` · lemma · `TauCeti.AnalyticNumberTheory.borel_cauchy_affine_log`.

If entire h has Re h(z)≤C_ε(1+|z|^(1+ε)) for every ε>0, then h(z)=a+bz.

**Construction and proof.**

1. Fix 0<ε<1. The pinned Borel–Carathéodory estimate on the ball of radius 2R gives |h(z)|≤K_ε(1+R^(1+ε)) for |z|≤R, including the fixed h(0) term.
2. At an arbitrary centre c, the same global bound on radius R is at most K_{c,ε}(1+R^(1+ε)) for R≥max(1,|c|). Apply the pinned second-derivative Cauchy estimate and let R tend to infinity. The upper bound tends to zero, so h″ vanishes everywhere and h is affine.

**Dependencies.** `mathlib:Complex.borelCaratheodory`, [`AnalyticNumberTheory:AN.2/hadamard-log-growth`](#hadamard-log-growth), `mathlib:Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le`, `mathlib:is_const_of_deriv_eq_zero`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

<a id="order-one-hadamard"></a>

#### Hadamard factorization in order at most one

`AnalyticNumberTheory:AN.2/order-one-hadamard` · theorem · `TauCeti.AnalyticNumberTheory.order_one_hadamard`.

For nonzero entire f of order at most1, f(z)=z^m exp(a+bz)∏_αE₁(z/α), with locally uniform convergence, exact zero multiplicities and finite/empty zero sets permitted.

**Hypotheses.** f is entire, not identically zero, and has order at most one; m is the finite analytic order at zero.

**Construction and proof.**

1. Assemble the origin factor, the canonical product, its entire quotient logarithm and the affine-log theorem.

**Dependencies.** [`AnalyticNumberTheory:AN.2/entire-order-at-most`](#entire-order-at-most), [`AnalyticNumberTheory:AN.2/genus-one-factor`](#genus-one-factor), [`AnalyticNumberTheory:AN.2/borel-cauchy-affine-log`](#borel-cauchy-affine-log), [`AnalyticNumberTheory:AN.2/zero-free-entire-log`](#zero-free-entire-log), [`AnalyticNumberTheory:AN.2/origin-zero-factor`](#origin-zero-factor), [`AnalyticNumberTheory:AN.2/canonical-product-entire`](#canonical-product-entire), [`AnalyticNumberTheory:AN.2/canonical-product-zero-orders`](#canonical-product-zero-orders).

**Acceptance.** f(z)=z²exp(z) has the empty nonzero-zero product and m=2. f(z)=1−z² has two simple nonzero zeros; the paired factors give exactly 1−z². Every zero occurrence family is locally finite, and convergence is locally uniform for the net of finite subsets, not merely pointwise.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

**Atlas planet.** Hadamard factorization.

<a id="canonical-product-log-derivative"></a>

#### Logarithmic derivative of the canonical product

`AnalyticNumberTheory:AN.2/canonical-product-log-derivative` · lemma · `TauCeti.AnalyticNumberTheory.canonical_product_log_derivative`.

For the order-one factorization of nonzero entire f, away from zero and its zeros, f′(z)/f(z)=m/z+b+Σ_α(1/(z−α)+1/α). The corrected summands, indexed with analytic multiplicity, converge locally uniformly there. The correction equals z/(α(z−α)); at z=0 it vanishes, and the term m/z is omitted there when m=0.

**Construction and proof.**

1. Use the canonical-product compact-tail estimate to prove summability of the regularized derivative summands on each compact set avoiding the zero family.
2. Apply pinned logDeriv_tprod_eq_tsum on the open complement of the locally finite zero set; canonical-product-zero-orders proves that the limit is nonzero there. Every individual factor is entire and nonzero at the evaluation point.
3. For E1(z/α), the logarithmic derivative is1/(z−α)+1/α=z/(α(z−α)); add the affine exponential and the origin factor m/z.
4. Track the finite/empty family and, when m=0, extend the origin value using its nonsingular formula. Match local uniform sum/reindexing separately from this pointwise pinned theorem.

**Dependencies.** `mathlib:TendstoLocallyUniformlyOn.deriv`, [`AnalyticNumberTheory:AN.2/order-one-hadamard`](#order-one-hadamard), [`AnalyticNumberTheory:AN.2/dyadic-zero-reciprocal-square`](#dyadic-zero-reciprocal-square), [`AnalyticNumberTheory:AN.2/canonical-factor-log-tail`](#canonical-factor-log-tail), `mathlib:logDeriv_tprod_eq_tsum`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, printed p.49, and Exercise 8.4.10, printed p.52.

<a id="paired-imaginary-factors"></a>

#### Pairing imaginary zeros

`AnalyticNumberTheory:AN.2/paired-imaginary-factors` · lemma · `TauCeti.AnalyticNumberTheory.paired_imaginary_factors`.

Under these hypotheses, there is c>0 and a locally finite positive-real family λ_j, with one index per positive-imaginary zero occurrence, such that f(z)=c z^m∏_j(1+z²/λ_j²). The products converge locally uniformly over finite subsets; finite and empty families are included.

**Hypotheses.** f entire and not identically zero; m is its finite analytic order at zero; orderAtMost(f,1); f(−z)=(−1)^m f(z); every zero is purely imaginary; f(x) is positive real for all sufficiently large positive real x.

**Construction and proof.**

1. Parity gives equal zero multiplicities at ±iλ. Pair the genus-one factors by canonical-factor-pair; reciprocal-square summability makes this reindexing valid.
2. The paired product is even and has value 1 at zero. Comparing f(−z) and (−1)^m f(z) near zero gives exp(−2bz)=1 for all sufficiently small z, forcing b=0. For positive x every paired factor and x^m is positive, so eventual positive reality of f forces c=exp(a)>0.

**Dependencies.** [`AnalyticNumberTheory:AN.2/order-one-hadamard`](#order-one-hadamard), [`AnalyticNumberTheory:AN.2/canonical-factor-pair`](#canonical-factor-pair).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Shtukas and the Taylor expansion of L-functions](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p02-p.pdf), Appendix B.1, Proposition B.1 and its proof, printed pp.902–903.

<a id="paired-product-nonnegative-coefficients"></a>

#### Nonnegative coefficients of the paired product

`AnalyticNumberTheory:AN.2/paired-product-nonnegative-coefficients` · lemma · `TauCeti.AnalyticNumberTheory.paired_product_nonnegative_coefficients`.

For the preceding paired product, every Taylor coefficient of parity m is nonnegative, and all coefficients of the other parity are zero.

**Construction and proof.**

1. Finite products have nonnegative coefficients in z².
2. Use locally uniform derivative convergence at0 to pass to every fixed coefficient.

**Dependencies.** `mathlib:TendstoLocallyUniformlyOn.deriv`, [`AnalyticNumberTheory:AN.2/paired-imaginary-factors`](#paired-imaginary-factors).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Shtukas and the Taylor expansion of L-functions](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p02-p.pdf), Appendix B.1, Proposition B.1 and its proof, printed pp.902–903.

<a id="paired-product-strict-derivatives"></a>

#### Strict derivative positivity requires nonpolynomiality

`AnalyticNumberTheory:AN.2/paired-product-strict-derivatives` · lemma · `TauCeti.AnalyticNumberTheory.paired_product_strict_derivatives`.

If the preceding f is not a polynomial, every derivative f^(k)(x) with k≡m mod2 is strictly positive for x>0, and the same-parity Taylor coefficients from degree m onward are positive.

**Construction and proof.**

1. Nonpolynomiality forces infinitely many pairs, so for every coefficient beyond m choose sufficiently many positive factors.
2. The nonnegative convergent derivative series gives strict positivity for x>0.

**Dependencies.** [`AnalyticNumberTheory:AN.2/paired-product-nonnegative-coefficients`](#paired-product-nonnegative-coefficients).

**Acceptance.** cosh(z) has infinitely many purely imaginary zero pairs and strictly positive same-parity Taylor coefficients. The polynomial 1+z² satisfies the pairing hypotheses but its fourth derivative is zero; nonpolynomiality is essential. Coefficients of degree below m vanish, including same-parity ones; positivity starts at degree m.

**Sources.** [Shtukas and the Taylor expansion of L-functions](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p02-p.pdf), Appendix B.1, Proposition B.1 and its proof, printed pp.902–903.

<a id="finite-order-hadamard"></a>

#### Finite-order Hadamard factorization

`AnalyticNumberTheory:AN.2/finite-order-hadamard` · theorem · `TauCeti.AnalyticNumberTheory.finite_order_hadamard`.

For nonzero entire f of finite order at most ρ≥0, set n=floor ρ. Its nonzero zeros α with multiplicity satisfy Σ|α|^(−n−1)<∞ and f(z)=z^m exp(h(z))∏E_n(z/α), where E_n(w)=(1−w)exp(Σ_{j=1}^n w^j/j), h is a polynomial of degree≤n and the product converges locally uniformly. Finite/empty zero sets are allowed.

**Construction and proof.**

1. Generalize the Jensen annulus and canonical-log-tail proofs from n=1 to n=floorρ.
2. Use a good-circle lower bound, Borel–Carathéodory and Cauchy estimates to kill derivatives of order>n.

**Dependencies.** [`AnalyticNumberTheory:AN.2/entire-order-at-most`](#entire-order-at-most), `mathlib:AnalyticOnNhd.sum_divisor_le`, `mathlib:Complex.borelCaratheodory`, [`AnalyticNumberTheory:AN.2/canonical-factor`](#canonical-factor).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Shtukas and the Taylor expansion of L-functions](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p02-p.pdf), Appendix B.1, (B.1)–(B.3), printed pp.901–902; cited Ahlfors §§5.2.3/5.3.2.

<a id="zeta-hadamard-log-derivative"></a>

#### Corrected logarithmic derivative of zeta

`AnalyticNumberTheory:AN.2/zeta-hadamard-log-derivative` · lemma · `TauCeti.AnalyticNumberTheory.zeta_hadamard_log_derivative`.

For s≠0,1 with ζ(s)≠0 and s/2 not a nonpositive integer, there exist Hadamard constants A,B and a locally finite multiplicity-indexed family of nonzero ξ zeros ρ such that ζ′(s)/ζ(s)=B−1/s−1/(s−1)+(log π)/2−(1/2)Γ′(s/2)/Γ(s/2)+Σ_ρ(1/(s−ρ)+1/ρ). The corrected sum is locally uniformly convergent away from ξ zeros.

**Construction and proof.**

1. Apply order-one Hadamard to the nonzero entire xi; ξ(0)=1/2 implies origin order0.
2. On the stated comparison domain, Gamma(s/2), s, s−1 and π^(−s/2) are all nonzero. Differentiate the xi product comparison and divide only there.
3. Use the derivative-limit theorem for the multiplicity-indexed canonical product; the regularized summand is s/(ρ(s−ρ)).
4. Equivalently combine the −1/s term with −(1/2)ψΓ(s/2) using ψΓ(z+1)=ψΓ(z)+1/z; this yields ψΓ(1+s/2), never the printed ψΓ((s+1)/2).

**Dependencies.** [`AnalyticNumberTheory:AN.2/riemann-xi`](#riemann-xi), [`AnalyticNumberTheory:AN.2/xi-order-one-growth`](#xi-order-one-growth), [`AnalyticNumberTheory:AN.2/canonical-product-log-derivative`](#canonical-product-log-derivative), `mathlib:riemannZeta_eq_completedRiemannZeta₀`, `mathlib:Complex.Gamma_ne_zero`, [`AnalyticNumberTheory:AN.2/xi-entire-and-endpoints`](#xi-entire-and-endpoints), [`AnalyticNumberTheory:AN.2/order-one-hadamard`](#order-one-hadamard).

**Acceptance.** Exclude s=0 even though ζ(0)=−1/2; the displayed gamma quotient is mathematically singular there. At Re s>1 all regularity conditions hold and the expression agrees with the pinned von-Mangoldt series.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §8.2 (8.2.5), p.49; §8.3 (8.3.3), p.50, corrected argument E2.

<a id="canonical-factor-pair"></a>

#### Paired genus-one factors

`AnalyticNumberTheory:AN.2/canonical-factor-pair` · lemma · `TauCeti.AnalyticNumberTheory.canonical_factor_pair`.

E₁(w)E₁(−w)=1−w² for all w∈C.

**Construction and proof.**

1. Unfold the stated definition and apply the finite algebraic, positivity or convergent geometric-series computation.

**Dependencies.** [`AnalyticNumberTheory:AN.2/genus-one-factor`](#genus-one-factor).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §8.2, Theorem8.7 and its genus-one product, printed pp.48–49.

<a id="xi-entire-and-endpoints"></a>

#### Xi is entire with nonzero endpoints

`AnalyticNumberTheory:AN.2/xi-entire-and-endpoints` · lemma · `TauCeti.AnalyticNumberTheory.xi_entire_and_endpoints`.

ξ is entire and ξ(0)=ξ(1)=1/2.

**Construction and proof.**

1. The definition is a polynomial times the pinned entire completed0, plus1/2, hence entire.
2. At s=0,1 the polynomial vanishes exactly, leaving1/2; consequently xi is not identically zero and its origin order is0.

**Dependencies.** [`AnalyticNumberTheory:AN.2/riemann-xi`](#riemann-xi), `mathlib:differentiable_completedZeta₀`.

**Acceptance.** Endpoint values survive totalized zeta/completed-zeta conventions.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §5.1 xi definition, p.35; Lemma8.3 integral display, p.47.

<a id="zero-reciprocal-truncation-bound"></a>

#### Truncated reciprocal weights of zeros

`AnalyticNumberTheory:AN.2/zero-reciprocal-truncation-bound` · lemma · `TauCeti.AnalyticNumberTheory.zero_reciprocal_truncation_bound`.

Under the family/count hypotheses there is K>0, depending on α,C,b, such that for R≥2, Σ_{|α_i|<R}|α_i|⁻¹≤K R^(b−1). The sum is finite and counts repeated zeros.

**Hypotheses.** An indexed family α_i≠0 of complex numbers, with finitely many indices in every bounded disk; repeated indices represent multiplicity. Fix 1<b<2 and C>0 with n_α(t)≤Ct^b for all t≥1, where n_α(t) counts indices with |α_i|≤t.

**Construction and proof.**

1. The finitely many indices |α_i|<1 contribute a fixed S, even when the minimum radius is small.
2. On each dyadic shell 2^j≤|α_i|<2^(j+1), bound the reciprocal sum by C·2^((j+1)b−j). Summing the finite increasing geometric sequence, whose ratio is 2^(b−1)>1, gives K R^(b−1). Include S using R≥2.

**Dependencies.** [`AnalyticNumberTheory:AN.2/jensen-growth-zero-count`](#jensen-growth-zero-count), [`AnalyticNumberTheory:AN.2/compact-zero-count`](#compact-zero-count).

**Acceptance.** The empty family has zero sum; one arbitrarily small nonzero zero is absorbed into the family-dependent constant, not an absolute constant.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, (8.2.4), printed p.49; Exercise 8.4.10, printed p.52.

<a id="zero-reciprocal-square-tail-bound"></a>

#### Reciprocal-square tail of zeros

`AnalyticNumberTheory:AN.2/zero-reciprocal-square-tail-bound` · lemma · `TauCeti.AnalyticNumberTheory.zero_reciprocal_square_tail_bound`.

Under the family/count hypotheses there is K>0, depending only on C,b, such that for R≥1, the reciprocal-square series over |α_i|>R is summable and Σ_{|α_i|>R}|α_i|⁻²≤K R^(b−2).

**Hypotheses.** An indexed family α_i≠0 of complex numbers, with finitely many indices in every bounded disk; repeated indices represent multiplicity. Fix 1<b<2 and C>0 with n_α(t)≤Ct^b for all t≥1, where n_α(t) counts indices with |α_i|≤t.

**Construction and proof.**

1. Use annuli 2^jR<|α_i|≤2^(j+1)R. Their contributions are at most C·2^b R^(b−2)·2^(j(b−2)).
2. The decreasing geometric ratio 2^(b−2)<1 gives both summability and K=C·2^b/(1−2^(b−2)); shell-boundary choices count each index once.

**Dependencies.** [`AnalyticNumberTheory:AN.2/jensen-growth-zero-count`](#jensen-growth-zero-count), [`AnalyticNumberTheory:AN.2/compact-zero-count`](#compact-zero-count).

**Acceptance.** For a finite family the tail is eventually zero; the same bound is uniform for every retained finite subset.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, (8.2.4), printed p.49; Exercise 8.4.10, printed p.52.

<a id="canonical-product-inner-lower-bound"></a>

#### Lower bound for inner canonical factors

`AnalyticNumberTheory:AN.2/canonical-product-inner-lower-bound` · lemma · `TauCeti.AnalyticNumberTheory.canonical_product_inner_lower_bound`.

Under the family/count hypotheses there is K>0 such that for R≥2, |z|=R and every finite subset S of indices with |α_i|<R/2, Σ_{i∈S}log|E₁(z/α_i)|≥−K R^b.

**Hypotheses.** An indexed family α_i≠0 of complex numbers, with finitely many indices in every bounded disk; repeated indices represent multiplicity. Fix 1<b<2 and C>0 with n_α(t)≤Ct^b for all t≥1, where n_α(t) counts indices with |α_i|≤t.

**Construction and proof.**

1. The reverse triangle inequality gives |1−z/α_i|≥R/|α_i|−1>1, so its real logarithm is nonnegative.
2. Since log|E₁(z/α_i)|=log|1−z/α_i|+Re(z/α_i), it is at least −R/|α_i|. Apply zero-reciprocal-truncation-bound to the finite inner family.

**Dependencies.** [`AnalyticNumberTheory:AN.2/zero-reciprocal-truncation-bound`](#zero-reciprocal-truncation-bound), [`AnalyticNumberTheory:AN.2/genus-one-factor`](#genus-one-factor).

**Acceptance.** This estimate requires no good-radius condition; an empty inner product contributes zero logarithm.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, (8.2.4), printed p.49; Exercise 8.4.10, printed p.52.

<a id="canonical-product-middle-lower-bound"></a>

#### Lower bound for middle canonical factors

`AnalyticNumberTheory:AN.2/canonical-product-middle-lower-bound` · lemma · `TauCeti.AnalyticNumberTheory.canonical_product_middle_lower_bound`.

Under the family/count hypotheses there is K>0 such that for R≥2 satisfying |R−|α_i||>|α_i|⁻² for every index, |z|=R and every finite S with R/2≤|α_i|≤2R, Σ_{i∈S}log|E₁(z/α_i)|≥−K R^b(1+log(2R)).

**Hypotheses.** An indexed family α_i≠0 of complex numbers, with finitely many indices in every bounded disk; repeated indices represent multiplicity. Fix 1<b<2 and C>0 with n_α(t)≤Ct^b for all t≥1, where n_α(t) counts indices with |α_i|≤t.

**Construction and proof.**

1. For a middle index, |1−z/α_i|≥|R−|α_i||/|α_i|>|α_i|⁻³≥(2R)⁻³; in particular this factor is nonzero.
2. Re(z/α_i)≥−2, so each logarithm is at least −3log(2R)−2. There are at most n_α(2R)≤C(2R)^b indices. Sum the lower bounds, with one constant independent of R,z,S.

**Dependencies.** [`AnalyticNumberTheory:AN.2/jensen-growth-zero-count`](#jensen-growth-zero-count), [`AnalyticNumberTheory:AN.2/genus-one-factor`](#genus-one-factor).

**Acceptance.** A circle through a zero fails the good-radius hypothesis and is excluded before any logarithm is taken.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, (8.2.4), printed p.49; Exercise 8.4.10, printed p.52.

<a id="canonical-product-outer-lower-bound"></a>

#### Lower bound for outer canonical factors

`AnalyticNumberTheory:AN.2/canonical-product-outer-lower-bound` · lemma · `TauCeti.AnalyticNumberTheory.canonical_product_outer_lower_bound`.

Under the family/count hypotheses there is K>0 such that for R≥2 and |z|=R the unordered outer product P_out(z)=∏_{|α_i|>2R}E₁(z/α_i) is nonzero and log|P_out(z)|≥−K R^b.

**Hypotheses.** An indexed family α_i≠0 of complex numbers, with finitely many indices in every bounded disk; repeated indices represent multiplicity. Fix 1<b<2 and C>0 with n_α(t)≤Ct^b for all t≥1, where n_α(t) counts indices with |α_i|≤t.

**Construction and proof.**

1. For |α_i|>2R the normalized w=z/α_i has |w|<1/2. canonical-factor-log-tail bounds the logarithm by R²|α_i|⁻² in absolute value.
2. The sum is absolutely convergent and has norm at most K R^b by zero-reciprocal-square-tail-bound at 2R. The outer product is the exponential of that sum by compact-tail/entire-product construction, hence nonzero; taking real parts gives the lower bound.

**Dependencies.** [`AnalyticNumberTheory:AN.2/zero-reciprocal-square-tail-bound`](#zero-reciprocal-square-tail-bound), [`AnalyticNumberTheory:AN.2/canonical-factor-log-tail`](#canonical-factor-log-tail), [`AnalyticNumberTheory:AN.2/canonical-product-compact-tail`](#canonical-product-compact-tail), [`AnalyticNumberTheory:AN.2/canonical-product-entire`](#canonical-product-entire).

**Acceptance.** The outer product for an empty family is one; the lower bound is zero before enlarging K.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem 8.7 proof, (8.2.4), printed p.49; Exercise 8.4.10, printed p.52.

### Xi and quantitative zeta estimates

<a id="theta-tail-decay"></a>

#### Exponential decay of the theta tail

`AnalyticNumberTheory:AN.2/theta-tail-decay` · lemma · `TauCeti.AnalyticNumberTheory.theta_tail_decay`.

For x≥1, ω(x)=(HurwitzZeta.evenKernel(0,x)−1)/2=Σ_(n≥1)exp(−πn²x) satisfies 0≤ω(x)≤exp(−πx)/(1−exp(−π)); reuse the existing theta kernel.

**Construction and proof.**

1. Pair n and -n in the pinned integer Gaussian HasSum at a=0, retaining its n=0 term1, to identify the positive-natural theta tail.
2. For n≥1 and x≥1, n²−1≥n−1, so exp(−πn²x)≤exp(−πx)exp(−π(n−1)).
3. Sum the nonnegative geometric majorant. Its ratio exp(−π) lies strictly between0 and1, including the endpoint x=1.

**Dependencies.** `mathlib:HurwitzZeta.evenKernel`, `mathlib:HurwitzZeta.hasSum_int_evenKernel`.

**Acceptance.** At x=1 the first positive-natural term gives ω(1)≥exp(−π)>0; the proposed upper bound is finite. Do not use the totalized kernel at x≤0 to claim a convergent positive-natural theta sum.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §5.1 omega/theta definitions and (5.1.4), p.34; Lemma8.3 p.47.

<a id="xi-integral-comparison"></a>

#### Entire integral representation of xi

`AnalyticNumberTheory:AN.2/xi-integral-comparison` · lemma · `TauCeti.AnalyticNumberTheory.xi_integral_comparison`.

For all s∈C, ξ(s)=1/2+(1/2)s(s−1)∫_1^∞(x^(s/2−1)+x^((1−s)/2−1))ω(x)dx, where ω(x)=(HurwitzZeta.evenKernel(0,x)−1)/2. The integrand is absolutely integrable, and finite integrals up to R converge locally uniformly in s as R→∞.

**Construction and proof.**

1. Unfold completed0 as the zero-parameter Hurwitz weak-FE Mellin transform, not as a new meromorphic continuation of zeta.
2. Split the modified Mellin integral at1; its value at1 is measure zero. On x>1 the modified kernel is theta−1=2ω; on0<x<1 use the same weak-FE symmetry and substitution x=1/y to obtain the second x>1 integral.
3. On a compact set of s, each complex power and each s derivative is bounded by a fixed real power of x times a logarithmic power; exponential theta decay gives integrable domination.
4. Match the exact split/inversion, integrability and locally uniform truncated-integral declarations at the pin; these formal adapters remain in the gap ledger, not an assumed existing integral theorem.

**Dependencies.** [`AnalyticNumberTheory:AN.2/riemann-xi`](#riemann-xi), [`AnalyticNumberTheory:AN.2/theta-tail-decay`](#theta-tail-decay), `mathlib:HurwitzZeta.hurwitzEvenFEPair`, `mathlib:HurwitzZeta.completedHurwitzZetaEven₀`, `mathlib:WeakFEPair.f_modif`, `mathlib:WeakFEPair.Λ₀`, `mathlib:mellin`.

**Acceptance.** At s=0,1 the polynomial factor vanishes while the integral remains finite; both values are1/2. Every compact parameter set has one integrable tail majorant; pointwise convergence alone is insufficient.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §5.1 (5.1.4), p.34; Lemma8.3 integral display, p.47.

<a id="gamma-integral-growth-majorant"></a>

#### Growth bound for the theta integral

`AnalyticNumberTheory:AN.2/gamma-integral-growth-majorant` · lemma · `TauCeti.AnalyticNumberTheory.gamma_integral_growth_majorant`.

For every real r≥2, ∫_1^∞(x^(r/2+1)+1)exp(−πx)dx≤exp(2r log(2+r)). In particular one absolute growth constant works for all r; no Stirling theorem is required.

**Construction and proof.**

1. Set k=ceil(r/2+1), a natural integer. For r≥2, r/2+1≤k≤r/2+2≤r+1.
2. On x≥1, x^(r/2+1)≤x^k and exp(−πx)≤exp(−x). Extend both nonnegative integrals to x>0. Pinned gamma integrability and Gamma(k+1)=k! bound the sum by k!+1.
3. Use Nat.factorial_le_pow and real monotonicity to get k!+1≤2(r+1)^(r+1). Taking logarithms bounds this by exp(2r log(2+r)) for r≥2.
4. Keep integrability separate from the totalized integral value. This repairs the false uniform-in-x majorant in Lemma8.3.

**Dependencies.** `mathlib:Real.GammaIntegral_convergent`, `mathlib:Real.Gamma_eq_integral`, `mathlib:Real.Gamma_nat_eq_factorial`, `mathlib:Nat.factorial_le_pow`.

**Acceptance.** The same explicit constant2 works at r=2 and for arbitrarily large real r. No complex gamma asymptotic or ineffective constant enters this bound.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Lemma8.3 p.47, corrected using the Euler gamma integral §5.1 p.33 and pinned factorial bound.

<a id="xi-order-one-growth"></a>

#### Order-one growth of xi

`AnalyticNumberTheory:AN.2/xi-order-one-growth` · lemma · `TauCeti.AnalyticNumberTheory.xi_order_one_growth`.

There are absolute C,R>0 such that |ξ(s)|≤exp(C|s|log(2+|s|)) for |s|≥R; consequently ξ has order at most1.

**Construction and proof.**

1. For r=|s|≥2 and x≥1, each complex power has norm x to its real exponent, bounded by x^(r/2+1)+1 after harmless enlargement.
2. Use the exponential theta bound and the explicit integral majorant; |s(s−1)|≤r(r+1). Absorb this polynomial and the absolute theta constant into exp(Cr log(2+r)).
3. For each b>1, log(2+r)=o(r^(b−1)), so the displayed growth is at most a constant times exp(r^b) for large r. Enlarge the constant on a compact disk and use xi entirety to obtain entire_order_at_most ξ1.

**Dependencies.** [`AnalyticNumberTheory:AN.2/xi-integral-comparison`](#xi-integral-comparison), [`AnalyticNumberTheory:AN.2/gamma-integral-growth-majorant`](#gamma-integral-growth-majorant), [`AnalyticNumberTheory:AN.2/entire-order-at-most`](#entire-order-at-most), [`AnalyticNumberTheory:AN.2/theta-tail-decay`](#theta-tail-decay), [`AnalyticNumberTheory:AN.2/xi-entire-and-endpoints`](#xi-entire-and-endpoints).

**Acceptance.** The conclusion is order at most1; an upper estimate alone does not prove exact order or failure of finite exponential type. No maximum over x on the unbounded interval is used.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §8.1 Lemma8.3, corrected proof.

<a id="digamma-right-half-plane"></a>

#### Logarithmic gamma bound

`AnalyticNumberTheory:AN.2/digamma-right-half-plane` · lemma · `TauCeti.AnalyticNumberTheory.digamma_right_half_plane`.

There is an absolute C>0 such that for every complex z with Re z≥1/2 and |z|≥2, |Complex.digamma(z)−Log(z)|≤C/|z|; the logarithm is principal. Consequently |Γ′(z)/Γ(z)|≤C′log(2+|z|) with an absolute C′.

**Construction and proof.**

1. Use the existing digamma=logDeriv Gamma carrier and pinned Gamma nonvanishing for positive real part.
2. DLMF5.11.2 and §5.11(ii) give the sector-uniform remainder after Log z−1/(2z); on |arg z|≤π/2 its sec(arg z/2)^3 factor is bounded. This supplies an explicit first-remainder target.
3. An asymptotic statement alone is not a formal proof adapter. Read the underlying complex Euler–Maclaurin/Stirling remainder proof and match its constants and branch at the pin before closing the gap.
4. Bound |Log z|≤log|z|+π/2 on the right half-plane, absorbing the remainder into log(2+|z|).

**Dependencies.** `mathlib:Complex.digamma`, `mathlib:Complex.Gamma_ne_zero_of_re_pos`.

**Acceptance.** Uniformity includes z=1/2+it for arbitrarily large positive or negative t. Do not differentiate a big-O remainder without an analytic uniform derivative argument.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §8.4 Exercise8.4.5, p.52; DLMF5.11.2 and §5.11(ii); [NIST Digital Library of Mathematical Functions, Gamma asymptotic expansions](https://dlmf.nist.gov/5.11), §5.11(i), (5.11.2), and §5.11(ii) complex remainder bound.

<a id="zeta-log-derivative-right"></a>

#### Bounded right-edge logarithmic derivative

`AnalyticNumberTheory:AN.2/zeta-log-derivative-right` · lemma · `TauCeti.AnalyticNumberTheory.zeta_log_derivative_right`.

For every complex s with Re s≥2, |ζ′(s)/ζ(s)|≤Σ_(n≥1)Λ(n)n^−2<∞, with the same absolute constant for every imaginary part.

**Construction and proof.**

1. Import the pinned absolute summability and identity of the complex von-Mangoldt L-series for Re s>1.
2. Use Λ(n)≥0 and the complex-power norm formula; for n≥1 and Re s≥2, n^(−Re s)≤n^−2.
3. Sum the termwise norm bound. Absolute convergence at s=2 is already the pinned summability theorem; do not re-plan its log n integral comparison.

**Dependencies.** `mathlib:ArithmeticFunction.LSeriesSummable_vonMangoldt`, `mathlib:ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div`, `mathlib:ArithmeticFunction.vonMangoldt_nonneg`.

**Acceptance.** The absolute constant is independent of Im s and includes Re s=2.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §8.3 negative log-derivative series, p.50; pinned LSeries_vonMangoldt_eq_deriv_riemannZeta_div.

<a id="zeta-pole-log-derivative"></a>

#### Pole term near one

`AnalyticNumberTheory:AN.2/zeta-pole-log-derivative` · lemma · `TauCeti.AnalyticNumberTheory.zeta_pole_log_derivative`.

There are absolute δ,K>0 such that for every real1<σ<1+δ, |−ζ′(σ)/ζ(σ)−1/(σ−1)|≤K.

**Construction and proof.**

1. Use the pinned regular-completion formula to construct the analytic pole-cleared germ g(s)=(s−1)ζ(s) off1, with g(1)=1. The punctured residue limit fixes this value; residue alone is not derivative control.
2. The regular denominator 2π^(−s/2)Γ(s/2+1) is analytic and nonzero near1. In the formula the numerator of g simplifies to 1+s(s−1)completed0(s).
3. Shrink the neighbourhood so g is nonzero and its logarithmic derivative is bounded on a compact disk. Off1, −ζ′/ζ=1/(s−1)−g′/g; restrict to the real right-hand interval.

**Dependencies.** `mathlib:riemannZeta_eq_mul_completedRiemannZeta₀`, `mathlib:riemannZeta_residue_one`, `mathlib:differentiable_completedZeta₀`, `mathlib:Complex.Gamma_ne_zero_of_re_pos`.

**Acceptance.** The constants precede all σ in one right neighbourhood; the statement excludes σ=1.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §8.3 (8.3.2), p.50; pinned pole-cleared regular-completion formula.

<a id="zeta-three-four-one-derivative"></a>

#### Zeta three-four-one inequality

`AnalyticNumberTheory:AN.2/zeta-three-four-one-derivative` · lemma · `TauCeti.AnalyticNumberTheory.zeta_three_four_one_derivative`.

For σ>1 and real t, 3(−ζ′/ζ)(σ)+4Re(−ζ′/ζ)(σ+it)+Re(−ζ′/ζ)(σ+2it)≥0.

**Construction and proof.**

1. Import ADS8’s nonnegative3-4-1 trigonometric package, retaining that upstream ownership.
2. Specialize the pinned absolutely convergent von-Mangoldt logarithmic-derivative series at σ,σ+it,σ+2it.
3. Each coefficient is Λ(n)n^−σ≥0; its bracket is3+4cos(t log n)+cos(2t log n)=2(1+cos(t log n))². Absolute summability permits taking real parts and adding the three series.

**Dependencies.** `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-8-landau-type-positivity`, `mathlib:ArithmeticFunction.LSeriesSummable_vonMangoldt`, `mathlib:ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div`, `mathlib:ArithmeticFunction.vonMangoldt_nonneg`.

**Acceptance.** At t=0 the bracket is8; at t log n=π it is0. No nonvanishing conclusion at σ≤1 is assumed from the Dirichlet-series identity.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §8.3 (8.3.1) and preceding Λ-series, p.50.

<a id="single-zero-positive-term"></a>

#### A near-one zero forces a positive reciprocal term

`AnalyticNumberTheory:AN.2/single-zero-positive-term` · lemma · `TauCeti.AnalyticNumberTheory.single_zero_positive_term`.

For a ξ zero ρ=β+it and1<σ≤2, 0<β<1 and Re(1/(σ+it−ρ))=1/(σ−β)>0. For every other ξ zero ρ′, Re(1/(σ+it−ρ′))≥0 and Re(1/ρ′)>0. The real parts of the regularized Hadamard summands may therefore be dropped or bounded below by any one retained term.

**Construction and proof.**

1. First invoke xi-zero-critical-strip; its strict boundaries follow from pinned zeta nonvanishing and xi reflection, not from the zero-count definition.
2. For s=σ+it and ρ′=β′+it′, Re(1/(s−ρ′))=(σ−β′)/((σ−β′)²+(t−t′)²)>0. At ρ′=ρ this is1/(σ−β).
3. Also Re(1/ρ′)=β′/|ρ′|²>0. Reciprocal-square summability makes these nonnegative constant real parts summable, while local uniform convergence handles the full regularized sum.
4. Finite partial sums preserve the single-term lower bound; take their convergent limit to justify dropping the remaining terms.

**Dependencies.** [`AnalyticNumberTheory:AN.2/zeta-hadamard-log-derivative`](#zeta-hadamard-log-derivative), [`AnalyticNumberTheory:AN.2/xi-zero-critical-strip`](#xi-zero-critical-strip), [`AnalyticNumberTheory:AN.2/dyadic-zero-reciprocal-square`](#dyadic-zero-reciprocal-square).

**Acceptance.** The1/ρ′ correction has positive real part and must not be omitted from the positivity argument. Use a convergent regularized sum and finite-sum limits, not an unproved sum of unregularized complex reciprocals.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §8.3 (8.3.4)–(8.3.6), pp.50–51; Remark5.2 p.35.

<a id="zero-free-region-constant-selection"></a>

#### Uniform selection of the zero-free constant

`AnalyticNumberTheory:AN.2/zero-free-region-constant-selection` · lemma · `TauCeti.AnalyticNumberTheory.zero_free_region_constant_selection`.

There are effective absolute c>0 and t₀>1 such that any ξ zero β+it with t≥t₀ satisfies β<1−c/log t; hence the same high-height nontrivial zeta-zero exclusion holds.

**Construction and proof.**

1. On1<σ≤min(2,1+δ), |t|≥2, combine the corrected Hadamard formula with the gamma bound. The nonzero elementary rational terms are O(1) and gamma is O(log|t|), with constants uniform in σ.
2. Use positivity to obtain −Re ζ′/ζ(σ+2it)≤C log t and −Re ζ′/ζ(σ+it)≤C log t−1/(σ−β). Insert these and the real pole bound into the3-4-1 inequality, obtaining4/(σ−β)≤3/(σ−1)+C₀log t.
3. Enlarge C₀ to be at least1. Choose a=1/(2C₀), c=a/10. Then4/(a+c)>3/a+C₀. If β≥1−c/log t, set σ=1+a/log t and contradict the previous inequality.
4. Choose t₀ effectively so t₀≥2 and a/log t₀≤min(1,δ). Effective constants are conditional on an explicitly bounded gamma remainder and pole-germ radius; those outstanding adapters remain gaps.

**Dependencies.** [`AnalyticNumberTheory:AN.2/zeta-pole-log-derivative`](#zeta-pole-log-derivative), [`AnalyticNumberTheory:AN.2/digamma-right-half-plane`](#digamma-right-half-plane), [`AnalyticNumberTheory:AN.2/zeta-three-four-one-derivative`](#zeta-three-four-one-derivative), [`AnalyticNumberTheory:AN.2/single-zero-positive-term`](#single-zero-positive-term), [`AnalyticNumberTheory:AN.2/zeta-hadamard-log-derivative`](#zeta-hadamard-log-derivative), [`AnalyticNumberTheory:AN.2/xi-zero-critical-strip`](#xi-zero-critical-strip).

**Acceptance.** The explicit a,c choice has a strict numerical margin; t₀ must also put σ inside the pole-estimate neighbourhood. No logarithmic statement at t=1 is asserted; bounded heights are not settled by a proof for t≥t₀.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §8.3 (8.3.1)–(8.3.6) and final selection, pp.50–51.

<a id="xi-zero-critical-strip"></a>

#### Every xi zero lies in the open critical strip

`AnalyticNumberTheory:AN.2/xi-zero-critical-strip` · lemma · `TauCeti.AnalyticNumberTheory.xi_zero_critical_strip`.

For every complex ρ with ξ(ρ)=0,0<Re ρ<1.

**Construction and proof.**

1. For Re s≥1 and s!=1, the xi comparison has nonzero factors s,s−1,π^(−s/2),Gamma(s/2),zeta(s); pinned zeta nonvanishing includes the line Re s=1. At s=1, xi=1/2.
2. If Re s≤0, then Re(1−s)≥1 and xi(s)=xi(1−s) is nonzero by reflection.
3. Thus any zero has strict0<Re s<1, including exclusion of both boundary lines and all trivial zeta zeros.

**Dependencies.** [`AnalyticNumberTheory:AN.2/riemann-xi`](#riemann-xi), [`AnalyticNumberTheory:AN.2/xi-entire-and-endpoints`](#xi-entire-and-endpoints), `mathlib:riemannZeta_ne_zero_of_one_le_re`, `mathlib:riemannZeta_eq_completedRiemannZeta₀`, `mathlib:Complex.Gamma_ne_zero_of_re_pos`.

**Acceptance.** A trivial zeta zero at−2 is not a xi zero: reflection reduces it to s=3. The endpoint s=1 is handled by xi(1)=1/2, not by the library’s totalized zeta value there.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §5.1 Remark5.2, p.35; §8.3 p.51.

<a id="green-tao-zeta-strip"></a>

#### Zero-free zeta strip and logarithmic bounds

`AnalyticNumberTheory:AN.2/green-tao-zeta-strip` · theorem · `TauCeti.AnalyticNumberTheory.green_tao_zeta_strip`.

There exist0<β<1 and C>0 such that for Z={s:1−β/log(|Im s|+2)≤Re s≤10}, ζ is meromorphic with its only pole in Z a simple pole at1 of residue1 and no zeros away from1. The functions G(s)=ζ(s)−1/(s−1) and R(s)=1/ζ(s), initially defined off1, have analytic extensions to a neighbourhood of Z, with R(1)=0 and |G(s)|,|R(s)|≤C log(|Im s|+2) throughout Z. Values at1 refer to these extensions, not to totalized ζ(1).

**Construction and proof.**

1. Combine the high-height logarithmic-derivative zero-free proof with the real-line nonvanishing and pole germ on compact bounded-height sets. Shrink β to join the regions.
2. Prove high-height logarithmic bounds for ζ after pole subtraction and its reciprocal, and absorb the compact-region bounds into C. These are named quantitative inputs with original proof reading still required; high-height nonvanishing alone is insufficient.

**Dependencies.** [`AnalyticNumberTheory:AN.2/classical-zero-free-region`](#classical-zero-free-region), [`AnalyticNumberTheory:AN.2/zeta-hadamard-log-derivative`](#zeta-hadamard-log-derivative), [`AnalyticNumberTheory:AN.2/xi-integral-comparison`](#xi-integral-comparison), `mathlib:riemannZeta`.

**Acceptance.** Verify the stated constants, endpoints and conventions against the source and discriminating examples.

**Sources.** [The primes contain arbitrarily long arithmetic progressions](https://annals.math.princeton.edu/wp-content/uploads/annals-v167-n2-p03.pdf), AppendixA LemmaA.1, printed p.541.

<a id="riemann-zeta-weak-convexity"></a>

#### Weak zeta convexity in a closed strip

`AnalyticNumberTheory:AN.2/riemann-zeta-weak-convexity` · theorem · `TauCeti.AnalyticNumberTheory.riemann_zeta_weak_convexity`.

For every ε>0 there exists C_ε>0 such that |ζ(σ+it)|≤C_ε|t|^(1−σ+ε) whenever1/2≤σ≤1 and |t|≥1/100. This is the weak convexity estimate used to bound ζ(1+z+z′) in Green–Tao (A.5).

**Construction and proof.**

1. Obtain vertical-strip growth from the functional equation, gamma estimates and a strip interpolation theorem; explicitly record these analytic suppliers in the quantitative zeta gap.
2. Enlarge the constant on bounded heights with |t|≥1/100; the exclusion of t=0 avoids the pole.

**Dependencies.** `mathlib:riemannZeta`.

**Acceptance.** Verify the stated constants, endpoints and conventions against the source and discriminating examples.

**Sources.** [The primes contain arbitrarily long arithmetic progressions](https://annals.math.princeton.edu/wp-content/uploads/annals-v167-n2-p03.pdf), AppendixA proof of LemmaA.3, (A.5), printed p.544.

### Prime number theorems and uniform progressions

<a id="character-weighted-pnt"></a>

#### Effective character prime-number estimate

`AnalyticNumberTheory:AN.2/character-weighted-pnt` · theorem · `TauCeti.AnalyticNumberTheory.character_weighted_pnt`.

For a primitive nonprincipal character chi of conductor N>1 and X sufficiently large, sum_{m<=X}chi(m)*Lambda(m)=-X^beta/beta+O(X*exp(-c*log X/(sqrt(log X)+log N))*(log N)^4), with the beta term only when an exceptional zero exists; c>0 and the implied constant are absolute and effective.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use the character explicit formula and isolate the exceptional real zero before estimating the other zeros.
2. Optimize the height using the conductor-uniform region; preserve log N and the effective constants.

**Dependencies.** [`AnalyticNumberTheory:AN.2/exceptional-real-zero`](#exceptional-real-zero).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: A conjecture of Erdős, supersingular primes and short character sums](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-BENNETT-SIKSEK-20.result.json), Theorem 5, (26), p. 374; Iwaniec–Kowalski Theorem 5.27.

<a id="rational-prime-number-theorem"></a>

#### Prime number theorem

`AnalyticNumberTheory:AN.2/rational-prime-number-theorem` · theorem · `TauCeti.AnalyticNumberTheory.rational_prime_number_theorem`.

As x→∞, Chebyshev.psi(x)∼x. The corresponding θ and π asymptotics are supplied by the separate transfer comparison.

**Construction and proof.**

1. Use the rational-mangoldt-boundary lemma and the pinned Λ summability/series identity to satisfy every ADS9 input, including a separately named continuous G and residue κ=1.
2. Apply the generic Wiener–Ikehara theorem to the nonnegative Λ coefficient. Compare its inclusive natural-floor summatory function with pinned Chebyshev.psi; no signed coefficient is submitted to the positive Tauberian theorem.

**Dependencies.** `mathlib:Chebyshev.psi`, `mathlib:riemannZeta_ne_zero_of_one_le_re`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-9-wienerikehara`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-10-generic-prime-number-theorem-transfer`, [`AnalyticNumberTheory:AN.2/rational-mangoldt-boundary`](#rational-mangoldt-boundary).

**Acceptance.** The exact boundary coefficient is Λ, not the prime-only log weight. No RH assumption or quantitative remainder is used.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Chapter6 §6.1 Theorem6.1 (Newman route), with §7.1 ψ equivalence; chosen ADS9 route uses the separately specified boundary adapter.

**Atlas planet.** Prime number theorem.

<a id="fixed-progression-prime-number-theorem"></a>

#### Prime number theorem in fixed progressions

`AnalyticNumberTheory:AN.2/fixed-progression-prime-number-theorem` · theorem · `TauCeti.AnalyticNumberTheory.fixed_progression_prime_number_theorem`.

For fixed q≥1 and a coprime to q, θ(x;a,q)∼x/φ(q) and π(x;a,q)∼Li(x)/φ(q) as x→∞. The modulus is fixed; constants in qualitative convergence can depend on q.

**Construction and proof.**

1. Use progression-mangoldt-boundary for nonnegative b(n)=Λ(n)1_{n≡a modq}, including the principal Euler correction and residue 1/φ(q).
2. Apply ADS9 to get the progression ψ asymptotic. Dominate the discarded higher prime powers by the pinned all-prime ψ−θ estimate, then use the existing ADS Abel/prime-count transfer.
3. Keep q fixed throughout the limit; this theorem alone supplies no growing-modulus statement.

**Dependencies.** [`AnalyticNumberTheory:AN.2/theta-ap`](#theta-ap), `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-9-wienerikehara`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-10-generic-prime-number-theorem-transfer`, [`AnalyticNumberTheory:AN.2/progression-mangoldt-boundary`](#progression-mangoldt-boundary), `mathlib:Chebyshev.isBigO_psi_sub_theta_sqrt`.

**Acceptance.** q=1 recovers ordinary PNT; q=4,a=1 or3 gives density 1/2. The gcd hypothesis is essential: for q=4,a=2 the progression contains only the prime2.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §10.1 p.59, paragraph following Theorem10.2; §4.3 finite Fourier extraction.

**Atlas planet.** Prime numbers in fixed progressions.

<a id="rational-pnt-error"></a>

#### Classical PNT remainder

`AnalyticNumberTheory:AN.2/rational-pnt-error` · theorem · `TauCeti.AnalyticNumberTheory.rational_pnt_error`.

There are absolute effective c,C>0 such that |ψ(x)−x|≤C x exp(−c√log x) for all sufficiently large x; ψ is the inclusive pinned function.

**Construction and proof.**

1. Use the truncated ψ₀ formula with analytic multiplicities, conjugation of Riemann zeros and the high positive-height zero-free region. For |Imρ|≥t₀ this gives β≤1−c/log|Imρ|.
2. The low-height critical zeros form a finite multiset. Pinned line-one nonvanishing and nonzero xi endpoints give a positive margin δ from β=1 and nonzero ρ; sum their finitely many |1/ρ| separately, never dividing by Imρ=0.
3. For high zeros the dyadic zero-weight bound gives O(log²T); hence their sum is O(x exp(−c log x/log T) log²T).
4. Choose T=exp(a sqrt(log x)) for one fixed a>0. The Perron endpoint/nearest-prime-power term is at most log x; absorb this, the finite low-zero O(x^(1−δ)) and powers of log x into a weaker exp(−c′sqrt(log x)) bound. Effectivity of the compact margin/constants remains an explicit gap.

**Dependencies.** [`AnalyticNumberTheory:AN.3/von-mangoldt-explicit-formula-and-pnt-error`](#von-mangoldt-explicit-formula-and-pnt-error), [`AnalyticNumberTheory:AN.2/classical-zero-free-region`](#classical-zero-free-region), [`AnalyticNumberTheory:AN.3/zero-weight-sum`](#zero-weight-sum), `mathlib:riemannZeta_ne_zero_of_one_le_re`, [`AnalyticNumberTheory:AN.2/xi-entire-and-endpoints`](#xi-entire-and-endpoints), [`AnalyticNumberTheory:AN.2/xi-zero-critical-strip`](#xi-zero-critical-strip).

**Acceptance.** Inclusive ψ and half-weight ψ₀ differ by at most (1/2)log x, already absorbed. Real zeros, if treated before excluding them, are in the finite low-height sum and never divided by ordinate0.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §7.2 Theorem7.7 and its proof, printed p.45; ψ endpoint convention §7.1 p.43.

<a id="chebyshev-prime-count-transfer"></a>

#### Ordinary prime-count transfer

`AnalyticNumberTheory:AN.2/chebyshev-prime-count-transfer` · comparison · `TauCeti.AnalyticNumberTheory.chebyshev_prime_count_transfer`.

From ψ(x)∼x, obtain θ(x)∼x, π(x)∼Li(x) and π(x)∼x/log x, using the existing ADS transfer and pinned prime-power bound.

**Construction and proof.**

1. Match the inclusive Chebyshev conventions and bound ψ−θ by the contribution of higher prime powers.
2. Apply the generic ADS prime-count transfer rather than re-proving it.

**Dependencies.** [`AnalyticNumberTheory:AN.2/rational-prime-number-theorem`](#rational-prime-number-theorem), `mathlib:Chebyshev.theta`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-10-generic-prime-number-theorem-transfer`, `mathlib:Chebyshev.isBigO_psi_sub_theta_sqrt`.

**Acceptance.** Use Mathlib’s stronger O(sqrt x) inclusive ψ−θ theorem rather than planning it again. Li uses lower endpoint2; changing that endpoint changes only a constant and not the asymptotic.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §1.3 partial summation, §1.4 PNT equivalences and Exercise1.6.7; §7.1 p.43.

<a id="dirichlet-conductor-zero-free-region"></a>

#### Conductor-uniform Dirichlet zero-free region

`AnalyticNumberTheory:AN.2/dirichlet-conductor-zero-free-region` · theorem · `TauCeti.AnalyticNumberTheory.dirichlet_conductor_zero_free_region`.

There is an effective absolute c>0 such that a primitive nonprincipal Dirichlet L-function of conductor q≥2 has no zero in Re s≥1−c/log(q(|Im s|+2)), except possibly one simple real zero of a real character.

**Construction and proof.**

1. Read the conductor-uniform primitive completion growth, logarithmic derivative and 3–4–1 argument in the original Davenport source; its proof remains an open gap here.
2. Kedlaya Theorem10.6 prints max(1,|t|)log q in the denominator; this cannot supply the stronger logarithmic-height statement by specialization. Import its corrected intended statement only after the original proof is checked.
3. Separate real and nonreal primitive nonprincipal characters, counting multiplicities in the exceptional region. Do not infer the whole conductor region from the single-real-zero uniqueness node.

**Dependencies.** [`AnalyticNumberTheory:AN.2/order-one-hadamard`](#order-one-hadamard), [`AnalyticNumberTheory:AN.2/exceptional-zero-unique`](#exceptional-zero-unique), `mathlib:DirichletCharacter.IsPrimitive.completedLFunction_one_sub`, `mathlib:DirichletCharacter.differentiable_completedLFunction`, [`AnalyticNumberTheory:AN.3/primitive-character-unit-height-zero-count`](#primitive-character-unit-height-zero-count).

**Acceptance.** At t=0 the allowed exception is a single simple real zero of a real nonprincipal character. The modulus is the primitive conductor, with q=1/principal characters excluded.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §10.4 Theorem10.6 and Remark10.8, pp.61–62; cited Davenport §14 unread.

<a id="siegel-walfisz"></a>

#### Siegel–Walfisz theorem

`AnalyticNumberTheory:AN.2/siegel-walfisz` · theorem · `TauCeti.AnalyticNumberTheory.siegel_walfisz`.

For every A,B>0, uniformly for q≤(log x)^B and gcd(a,q)=1, π(x;a,q)=Li(x)/φ(q)+O_{A,B}(x(log x)^−A) as x→∞. The constant and threshold may be ineffective.

**Construction and proof.**

1. Use the conductor-uniform character estimate including its exceptional contribution, reduce imprimitive characters with their finite Euler corrections, and apply exact finite orthogonality to the progression Λ coefficient.
2. Derive an ineffective separation 1−β≥c_ε q^(−ε) for primitive real characters from Siegel’s L(1,χ) lower bound together with a conductor-controlled derivative estimate near1. The L-value lower bound alone is not a zero-separation theorem; this adapter remains a gap.
3. For q≤(log x)^B choose ε<1/B (for example 1/(2(B+1))). Then x^β/x≤exp(−c_ε (log x)^(1−Bε)), which absorbs any fixed power of log x. Character averaging cannot increase the uniform coefficient bound.
4. Dominate higher prime powers by pinned ψ−θ, then apply the generic ADS Abel transfer. The constants and threshold may be ineffective and depend on A,B before quantifying over q,a,x.

**Dependencies.** [`AnalyticNumberTheory:AN.2/dirichlet-conductor-zero-free-region`](#dirichlet-conductor-zero-free-region), [`AnalyticNumberTheory:AN.2/siegel-quadratic-lvalue`](#siegel-quadratic-lvalue), [`AnalyticNumberTheory:AN.2/character-weighted-pnt`](#character-weighted-pnt), `mathlib:DirichletCharacter.sum_char_inv_mul_char_eq`, `mathlib:DirichletCharacter.LFunctionTrivChar_eq_mul_riemannZeta`, `mathlib:Chebyshev.isBigO_psi_sub_theta_sqrt`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation`.

**Acceptance.** For B=1 one may take ε=1/4; the exceptional relative term is ≤exp(−c(log x)^(3/4)). The assertion is restricted to reduced classes and logarithmic modulus growth; it is not an effective uniform theorem for every modulus.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §10.5 Theorem10.9 pp.62–63 and Theorem10.11 p.63; corrected coprimality, range and ineffectivity.

### Exceptional zeros and numerical prime estimates

<a id="exceptional-real-zero"></a>

#### Exceptional real zero

`AnalyticNumberTheory:AN.2/exceptional-real-zero` · definition · `TauCeti.AnalyticNumberTheory.exceptional_real_zero`.

For c>0 define the c-exceptional predicate for a nontrivial primitive quadratic character χ of conductor N>1 by L(β,χ)=0 and 1−c/log N<β<1, with β real. The exceptional zero used in Proposition 7.1 is this predicate specialized to its effective absolute c_star>0; its conductor is called exceptional. The general parameter does not assert the existence of any zero.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use the actual continued primitive quadratic Dirichlet L-function; this predicate does not assert existence of a zero.

**Dependencies.** `mathlib:DirichletCharacter.LFunction`.

**API.**

- `ExceptionalRealZero.iff` (characterisation): For c>0 and N>1, the predicate holds exactly when χ is primitive, nonprincipal and quadratic, L(β,χ)=0, and 1−c/log N<β<1. Equivalently, for arbitrary c,N it is the conjunction of all these conditions, including c>0 and N>1.
- `ExceptionalRealZero.bounds` (projection): An exceptional β lies strictly below 1 and strictly above the specified logarithmic cutoff.
- `ExceptionalRealZero.mono` (compatibility): For 0<c≤c′ the c-exceptional predicate implies the c′-exceptional predicate, with N>1.

**Unit tests.**

- `ExceptionalRealZero.one` (non-example): β=1 is excluded even if a chosen totalized function vanishes there.
- `ExceptionalRealZero.lower_endpoint` (non-example): β=1−c/log N is excluded by the strict inequality.
- `ExceptionalRealZero.principal` (non-example): The principal character and N=1 are outside the domain; log 1 is never used as a denominator.
- `ExceptionalRealZero.supplied_zero` (example): Given c>0, N>1, a primitive nonprincipal quadratic χ, a real β with L(β,χ)=0 and 1−c/log N<β<1, the c-exceptional predicate holds. This is conditional and makes no existence assertion.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Uses.** `PAPER-BENNETT-SIKSEK-20/41`: Track the distinguished real zero and its conductor, without replacing conductor by a modulus. `PAPER-BENNETT-SIKSEK-20/88`: Track the distinguished real zero and its conductor, without replacing conductor by a modulus. `PAPER-BENNETT-SIKSEK-20/89`: Track the distinguished real zero and its conductor, without replacing conductor by a modulus.

**Sources.** [Reviewed extraction: A conjecture of Erdős, supersingular primes and short character sums](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-BENNETT-SIKSEK-20.result.json), Section 7, Proposition 7.1 and following paragraph, pp. 373-374.

<a id="theta-ap"></a>

#### Chebyshev sum in a residue class

`AnalyticNumberTheory:AN.2/theta-ap` · definition · `TauCeti.AnalyticNumberTheory.theta_ap`.

For q≥1 and a∈ZMod q, θ(x;a,q)=Σ_{p prime, p≤x, p≡a mod q} log p. Inclusive real cutoff, empty for x<2. This specializes the pinned Chebyshev sum; a coprimality hypothesis is required by asymptotic theorems, not by the finite sum.

**Construction and proof.**

1. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

**Dependencies.** `mathlib:Chebyshev.theta`.

**API.**

- `theta_ap.sum` (characterisation): Evaluation is the finite filtered prime sum just displayed.
- `theta_ap.level_one` (compatibility): θ(x;0,1)=Chebyshev.theta x.
- `theta_ap.sum_classes` (relation): For q≥1, summing over all residue classes modulo q gives Chebyshev.theta x. The finite sum is not specified at q=0, where ZMod 0 is infinite.

**Unit tests.**

- `theta_ap.below_two` (computation): θ(1;a,q)=0.
- `theta_ap.mod_eight` (computation): θ(5;3,8)=log 3 and θ(5;5,8)=log 5.
- `theta_ap.noncoprime` (non-example): θ(x;0,2)=log 2 for x≥2; the noncoprime class cannot satisfy x/φ(2) asymptotics.

**Acceptance.** θ(1;a,q)=0. θ(5;3,8)=log 3 and θ(5;5,8)=log 5. θ(x;0,2)=log 2 for x≥2; the noncoprime class cannot satisfy x/φ(2) asymptotics.

**Uses.** `PAPER-BENNETT-SIKSEK-20/78`: The same class and level occur at both interval endpoints.

**Sources.** [Reviewed extraction: A conjecture of Erdős, supersingular primes and short character sums](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-BENNETT-SIKSEK-20.result.json), §§6–9, especially p. 369.

<a id="exceptional-squareclasses"></a>

#### Exceptional quadratic squareclasses

`AnalyticNumberTheory:AN.2/exceptional-squareclasses` · definition · `TauCeti.AnalyticNumberTheory.exceptional_squareclasses`.

For 0<c<1/2 let S(c) consist of nonzero squarefree d≠1 such that the primitive quadratic character of Q(√d) has a real zero β∈[1−c/log(|d|+4),1]. The conductor is |d| or 4|d| as dictated by its fundamental discriminant. Enumerate any finite initial segment by nondecreasing |d|; an infinite enumeration requires infinitude, which is not asserted.

**Construction and proof.**

1. Import the Q-specialization character of the quadratic field with fundamental discriminant D(d)=d for d≡1 mod4 and D(d)=4d otherwise. Its positive-integer values are the Kronecker symbol (D(d)/n); primitivity gives conductor |D(d)|.
2. In the supplier prototype, separate the 2-primary part of n before applying the pinned Jacobi symbol to the odd denominator. A plain Jacobi-symbol definition would mishandle even n. The admitted construction is constrained by all character values and primitivity; no arbitrary quadratic character is supplied as data.
3. Take the canonical continued Dirichlet LFunction, not the totalized LSeries outside its convergence domain, and quantify a real zero in the closed interval [1−c/log(|d|+4),1]. Height-bounded selections are finite; no infinite enumeration or zero existence is asserted.

**Dependencies.** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`, `mathlib:DirichletCharacter.LFunction`.

**API.**

- `exceptional_squareclasses.membership` (characterisation): Membership is the stated near-one zero condition for the primitive field character.
- `exceptional_squareclasses.mono` (compatibility): If 0<c≤c′<1/2 then S(c)⊆S(c′).
- `exceptional_squareclasses.finite_height` (data): For each B there are finitely many d∈S(c) with |d|≤B.
- `exceptional_squareclasses.conductor` (compatibility): Every estimate uses the field’s fundamental discriminant conductor, retaining the possible factor 4.

**Unit tests.**

- `exceptional_squareclasses.trivial` (non-example): d=1 is excluded, so a principal pole cannot be called an exceptional zero.
- `exceptional_squareclasses.minus_one` (computation): d=−1 has conductor 4, not conductor 1.
- `exceptional_squareclasses.two` (computation): d=2 has conductor 8, not 2.
- `exceptional_squareclasses.finite` (computation): The definition permits an empty or finite S(c); it does not fabricate an infinite sequence.

**Acceptance.** d=1 is excluded, so a principal pole cannot be called an exceptional zero. d=−1 has conductor 4, not conductor 1. d=2 has conductor 8, not 2. The definition permits an empty or finite S(c); it does not fabricate an infinite sequence.

**Uses.** `PAPER-KOYMANS-PAGANO/182`: Repulsion applies to successive existing entries of the ordered set.

**Sources.** [On Stevenhagen’s conjecture](https://arxiv.org/pdf/2201.13424v1), §7.2 Definition7.5 and its enumeration paragraph, p.61.

<a id="riemann-xi"></a>

#### Pole-cancelled Riemann xi

`AnalyticNumberTheory:AN.2/riemann-xi` · definition · `TauCeti.AnalyticNumberTheory.riemann_xi`.

ξ(s)=1/2+(1/2)s(s−1)completedRiemannZeta₀(s). This is the entire extension of (1/2)s(s−1)π^(−s/2)Γ(s/2)ζ(s) away from the completed poles, not the pointwise pole-multiplication convention at s=0,1.

**Construction and proof.**

1. Define xi directly as 1/2+(s*(s-1)/2)*completedRiemannZeta0 s, reusing its pinned entire carrier.
2. Entirety and reflection are finite algebra applied to the pinned differentiability and reflection of completed0; at 0 and 1 the polynomial term vanishes.
3. For s!=0,1, use completedRiemannZeta_eq and multiply the rational correction terms to obtain the comparison with the regular completed zeta; use the separate gamma nonvanishing condition before comparing to gamma times zeta.

**Dependencies.** `mathlib:completedRiemannZeta₀`, `mathlib:differentiable_completedZeta₀`, `mathlib:completedRiemannZeta₀_one_sub`, `mathlib:completedRiemannZeta_eq`.

**API.**

- `riemann_xi.entire` (structure): ξ is entire by differentiability of the pinned pole-subtracted completion.
- `riemann_xi.reflection` (relation): ξ(1−s)=ξ(s) for all complex s.
- `riemann_xi.comparison` (compatibility): For s≠0,1, ξ(s)=(1/2)s(s−1)completedRiemannZeta(s).
- `riemann_xi.endpoints` (simp): ξ(0)=ξ(1)=1/2.

**Unit tests.**

- `riemann_xi.zero` (computation): ξ(0)=1/2, not0.
- `riemann_xi.one` (computation): ξ(1)=1/2, not0.
- `riemann_xi.reflection` (computation): ξ(2)=ξ(−1), checking the centre1/2.

**Acceptance.** ξ(0)=1/2, not0. ξ(1)=1/2, not0. ξ(2)=ξ(−1), checking the centre1/2.

**Uses.** `AnalyticNumberTheory:AN.2/classical-zero-free-region`: The genus-one product is applied to the entire xi, not to ζ with its pole.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §5.1 (5.1.4), xi definition and reflection, printed pp.34–35; Lemma8.3 p.47.

**Atlas planet.** Riemann xi function.

<a id="classical-zero-free-region"></a>

#### Classical high-height zero-free region

`AnalyticNumberTheory:AN.2/classical-zero-free-region` · theorem · `TauCeti.AnalyticNumberTheory.classical_zero_free_region`.

There exist real c>0 and t₀>1 such that ζ(s)≠0 whenever Im(s)≥t₀ and Re(s)≥1−c/log(Im(s)). This is the high positive-height conclusion of Kedlaya's proof, not a full-height effective region or a conductor-uniform Dirichlet region.

**Hypotheses.** The constants c,t₀ are absolute existence constants, not certified numerical values.

**Construction and proof.**

1. Use the nonnegative trigonometric polynomial 3+4 cos θ+cos 2θ with the absolutely convergent logarithmic derivative for Re(s)>1.
2. The simple pole at 1 bounds the real-axis term by 1/(σ−1)+O(1). The corrected Hadamard/Gamma identity bounds the σ+2it term by O(log t). Keeping a zero β+it bounds the σ+it term by O(log t)−1/(σ−β).
3. Combine to obtain 4/(σ−β)≤3/(σ−1)+C log t. Choose σ=1+A/log t with A sufficiently small relative to C to derive β<1−c/log t for t≥t₀.
4. Hadamard factorization, logarithmic differentiation, Gamma estimates, zero summability and effective choices are unresolved named inputs, not hidden routine steps; see the gaps.

**Dependencies.** [`AnalyticNumberTheory:AN.2/zero-free-region-constant-selection`](#zero-free-region-constant-selection), `mathlib:riemannZeta_ne_zero_of_one_le_re`.

**Acceptance.** t₀>1 avoids division by log 1. This node alone does not control negative or bounded heights. No RH or Siegel-effectivity assumption is inserted.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem8.8 and (8.3.1)–(8.3.6), printed pp.50–51; prerequisites §8.2 pp.48–49.

**Atlas planet.** Classical zero-free region.

<a id="exceptional-conductor-repulsion"></a>

#### Repulsion of exceptional conductors

`AnalyticNumberTheory:AN.2/exceptional-conductor-repulsion` · theorem · `TauCeti.AnalyticNumberTheory.exceptional_conductor_repulsion`.

With c_star from Proposition 7.1, two distinct exceptional quadratic conductors N1<N2 satisfy N2>N1^2.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Apply the two-real-zero inequality at the same effective c_star.
2. If N₂≤N₁² then log(N₁N₂)≤3 log N₁, contradicting both strict exceptional cutoffs.

**Dependencies.** [`AnalyticNumberTheory:AN.2/exceptional-real-zero`](#exceptional-real-zero), [`AnalyticNumberTheory:AN.2/two-real-zero-separation`](#two-real-zero-separation).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: A conjecture of Erdős, supersingular primes and short character sums](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-BENNETT-SIKSEK-20.result.json), Proposition 7.1 and equation (25), pp. 373-374.

<a id="schoenfeld-theta-upper"></a>

#### Schoenfeld explicit Chebyshev bound

`AnalyticNumberTheory:AN.2/schoenfeld-theta-upper` · theorem · `TauCeti.AnalyticNumberTheory.schoenfeld_theta_upper`.

For x>0, theta(x)=sum_{p prime,p<=x}log p < 1.000081*x.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use the stated unconditional published theta upper bound, not an RH conditional table.
2. Supply a certified finite-range check below its analytic threshold.

**Dependencies.** `mathlib:Chebyshev.theta`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: A conjecture of Erdős, supersingular primes and short character sums](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-BENNETT-SIKSEK-20.result.json), Equation (10), p. 362; Schoenfeld 1976, concluding note p. 360.

<a id="mod-eight-interval-mass"></a>

#### Mod-eight prime mass

`AnalyticNumberTheory:AN.2/mod-eight-interval-mass` · theorem · `TauCeti.AnalyticNumberTheory.mod_eight_interval_mass`.

With epsilon=0.002811, for a=3 or 5 and k>=2*10^10, theta(k;a,8)-theta(k/2;a,8)>=(1-3*epsilon)*k/8.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Subtract the same published residue-class theta error bound at k and k/2, both within its range.
2. Retain a=3 or 5, q=8 and k≥2·10^10.

**Dependencies.** [`AnalyticNumberTheory:AN.2/theta-ap`](#theta-ap).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: A conjecture of Erdős, supersingular primes and short character sums](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-BENNETT-SIKSEK-20.result.json), §6, pp. 369,372, Ramaré–Rumely input.

<a id="prime-power-interval-margin"></a>

#### Prime powers do not erase the character-sum margin

`AnalyticNumberTheory:AN.2/prime-power-interval-margin` · theorem · `TauCeti.AnalyticNumberTheory.prime_power_interval_margin`.

Put ε=0.002811. For real k≥2*10^10, the prime-power mass M=psi(k)−theta(k)−psi(k/2)+theta(k/2) is smaller than (((1−3*ε)/8)−0.1239)*k. For b:ℕ→ℂ with |b(n)|≤1 whenever k/2<n≤k, put P=Σ_{k/2<p≤k, p prime}b(p)log p and V=Σ_{k/2<n≤k}b(n)Λ(n). Then |V−P|≤M, so |P|≥(1−3*ε)*k/8 implies |V|>0.1239*k.

**Hypotheses.** k is real and k≥2*10^10; ε=0.002811. b:ℕ→ℂ and |b(n)|≤1 on the summation interval k/2<n≤k; the two sums use the same b and endpoints.

**Construction and proof.**

1. Bound the powers p^j with j≥2 by a sum of theta(k^(1/j)), and subtract endpoints before estimating.
2. Insert the certified constants from the source; retain the strict inequality.
3. On prime terms Λ(p)=log p, and on higher prime powers use |b(p^j)|≤1. The triangle inequality gives |V−P|≤M and |V|≥|P|−M.

**Dependencies.** `mathlib:Chebyshev.psi`, `mathlib:Chebyshev.theta`.

**Acceptance.** Check the certified strict mass bound at the minimum k and all larger k; its original numerical proof remains an open source obligation. The weighted implication requires the same coefficient sequence in both sums and the bound |b(n)|≤1 at higher prime powers, not only at primes.

**Sources.** [Reviewed extraction: A conjecture of Erdős, supersingular primes and short character sums](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-BENNETT-SIKSEK-20.result.json), §6 end of Case I, pp. 369–370; Schoenfeld Theorem 6*, (5.3*)–(5.4*).

<a id="two-real-zero-separation"></a>

#### Two-real-zero inequality

`AnalyticNumberTheory:AN.2/two-real-zero-separation` · theorem · `TauCeti.AnalyticNumberTheory.two_real_zero_separation`.

There is an effective absolute c_star>0 such that if distinct real primitive quadratic characters of conductors N1,N2>1 have real zeros beta1,beta2, then min(beta1,beta2)<1-3*c_star/log(N1*N2).

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use the common-conductor-product zero-repulsion theorem with distinct primitive quadratic characters.
2. Fix one effective c_star small enough for this theorem and the exceptional-zero definition simultaneously.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: A conjecture of Erdős, supersingular primes and short character sums](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-BENNETT-SIKSEK-20.result.json), Proposition 7.1(i), (23), p. 373.

<a id="exceptional-zero-unique"></a>

#### Uniqueness and simplicity of an exceptional zero

`AnalyticNumberTheory:AN.2/exceptional-zero-unique` · theorem · `TauCeti.AnalyticNumberTheory.exceptional_zero_unique`.

For that same c_star, a primitive nonprincipal quadratic character of conductor N has at most one real zero in (1-c_star/log N,1), and any such zero is simple.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Apply the conductor-uniform zero-free region to the real near-one interval.
2. Use the multiplicity version of the logarithmic-derivative inequality to force multiplicity one.

**Dependencies.** [`AnalyticNumberTheory:AN.2/exceptional-real-zero`](#exceptional-real-zero).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: A conjecture of Erdős, supersingular primes and short character sums](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-BENNETT-SIKSEK-20.result.json), Proposition 7.1(ii), (24), pp. 373–374.

<a id="rosser-schoenfeld-pi"></a>

#### Rosser–Schoenfeld explicit prime-count bounds

`AnalyticNumberTheory:AN.2/rosser-schoenfeld-pi` · theorem · `TauCeti.AnalyticNumberTheory.rosser_schoenfeld_pi`.

For x>=59, (x/log x)*(1+1/(2 log x))<pi(x)<(x/log x)*(1+3/(2 log x)).

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use the original two inequalities on the exact real range x≥59.
2. Certify the finite threshold region with rational enclosures for logarithms.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: A conjecture of Erdős, supersingular primes and short character sums](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-BENNETT-SIKSEK-20.result.json), §9 proof, p. 382; Rosser–Schoenfeld Theorem 1.

<a id="explicit-prime-reciprocal"></a>

#### Explicit reciprocal-prime estimate

`AnalyticNumberTheory:AN.2/explicit-prime-reciprocal` · theorem · `TauCeti.AnalyticNumberTheory.explicit_prime_reciprocal`.

There is the prime Mertens constant B=0.26149... such that for x>=286, |sum_{p<=x}1/p-log log x-B|<1/(2*(log x)^2).

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use the original reciprocal-prime theorem and its common prime Mertens constant.
2. Keep x≥286; the rounded decimal is a label, not the definition of B.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: A conjecture of Erdős, supersingular primes and short character sums](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-BENNETT-SIKSEK-20.result.json), §9 proof, p. 382; Rosser–Schoenfeld Theorem 5.

<a id="landau-page-bounded-height"></a>

#### Bounded-height Landau–Page theorem

`AnalyticNumberTheory:AN.2/landau-page-bounded-height` · theorem · `TauCeti.AnalyticNumberTheory.landau_page_bounded_height`.

There is an effective absolute c>0 such that among primitive Dirichlet characters of moduli q<=T, T>=2, there is at most one zero rho=beta+i*t with |t|<=T and beta>1-c/log T. Any exception is a simple real zero of a real character.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Apply the family zero-repulsion bound including complex zeros and multiplicities.
2. Conjugation forces a unique exception to be real and attached to a real primitive character.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: A conjecture of Erdős, supersingular primes and short character sums](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-BENNETT-SIKSEK-20.result.json), §12 opening, p. 386; Bombieri §5 p.39; Iwaniec–Kowalski Theorem 5.26.

<a id="quadratic-effective-zero-gap"></a>

#### Quadratic real-zero separation from one

`AnalyticNumberTheory:AN.2/quadratic-effective-zero-gap` · theorem · `TauCeti.AnalyticNumberTheory.quadratic_effective_zero_gap`.

For q>=3 and a quadratic Dirichlet character modulo q, a real zero beta>0 satisfies beta<=1-40/(sqrt(q)*(log q)^2).

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Combine the effective quadratic class-number lower estimate with a uniform derivative estimate between β and 1.
2. Read the original theorem to retain the explicit constant 40 and q≥3.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: A conjecture of Erdős, supersingular primes and short character sums](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-BENNETT-SIKSEK-20.result.json), §12 p.387; Bennett–Martin–O'Bryant–Rechnitzer Proposition 1.11.

<a id="explicit-weighted-prime-sum"></a>

#### Weighted-prime sum input to the factorial estimate

`AnalyticNumberTheory:AN.2/explicit-weighted-prime-sum` · theorem · `TauCeti.AnalyticNumberTheory.explicit_weighted_prime_sum`.

There exists an absolute real constant E such that, for every real x≥319, log x+E−1/(2 log x)<Σ_{p≤x}(log p)/p<log x+E+1/(2 log x). The same E applies at both endpoints of every interval subtraction.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use the published two-sided estimate with a single constant E, on x≥319.
2. The interval corollary is a separate subtraction lemma below.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: A conjecture of Erdős, supersingular primes and short character sums](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-BENNETT-SIKSEK-20.result.json), §9 p.384; Rosser–Schoenfeld Theorem 6, p.70.

<a id="explicit-plus-euler-product"></a>

#### Explicit prime Euler-product bound

`AnalyticNumberTheory:AN.2/explicit-plus-euler-product` · theorem · `TauCeti.AnalyticNumberTheory.explicit_plus_euler_product`.

For real x>=10^8, product_{p prime,p<=x}(1+1/p)<=2*log x.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use the source reciprocal-prime and square-power tail estimates, retaining x≥10^8.
2. Certify the finite threshold calculations required for the literal constant 2.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: A conjecture of Erdős, supersingular primes and short character sums](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-BENNETT-SIKSEK-20.result.json), §5 proof of Lemma 5.1, p.365; alternate direct input from Rosser–Schoenfeld Theorem 8 (3.29), p.70.

<a id="weighted-prime-interval"></a>

#### Weighted prime sum on an interval

`AnalyticNumberTheory:AN.2/weighted-prime-interval` · lemma · `TauCeti.AnalyticNumberTheory.weighted_prime_interval`.

For x≥y≥319, Σ_{y<p≤x}(log p)/p>log(x/y)−1/(2 log x)−1/(2 log y).

**Construction and proof.**

1. Subtract the lower bound at x and the upper bound at y; the same E cancels.
2. Use the log quotient identity for positive x,y.

**Dependencies.** [`AnalyticNumberTheory:AN.2/explicit-weighted-prime-sum`](#explicit-weighted-prime-sum).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: A conjecture of Erdős, supersingular primes and short character sums](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-BENNETT-SIKSEK-20.result.json), §9 p.384; Rosser–Schoenfeld Theorem 6, p.70.

<a id="siegel-quadratic-lvalue"></a>

#### Siegel's theorem (black box)

`AnalyticNumberTheory:AN.2/siegel-quadratic-lvalue` · theorem · `TauCeti.AnalyticNumberTheory.siegel_quadratic_lvalue`.

For every ε > 0 there is c(ε) > 0, not effectively computable, such that L(1,χ_D) ≥ c(ε)|D|^{−ε} for every fundamental discriminant D ≠ 1.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use the primitive fundamental-discriminant quadratic character and the original ineffective Siegel theorem.
2. No effective positive constant is inferred from the existence theorem.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: Geometric invariants for real quadratic fields](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json), §6, p.968 ('By Siegel's theorem'); proof of Proposition 1, p.968 ('Siegel's theorem (see [11])'); [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §6, p.968 ('By Siegel's theorem'); proof of Proposition 1, p.968 ('Siegel's theorem (see [11])').

<a id="mertens-prime-reciprocal"></a>

#### Mertens sum and product inputs

`AnalyticNumberTheory:AN.2/mertens-prime-reciprocal` · theorem · `TauCeti.AnalyticNumberTheory.mertens_prime_reciprocal`.

There is a real B such that Σ_{p≤x}1/p=log log x+B+O(1/log x) for real x≥2, with an absolute implied constant.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Replace the strict endpoint in Mertens first theorem by the inclusive one; a possible endpoint contributes at most log x/x, hence a bounded change. Set R(t)=Σ_{p≤t}log p/p−log t, which is bounded for t≥2.
2. Apply pinned Abel summation with weight 1/log t and coefficient (log p)/p at primes, zero otherwise. Obtain Σ_{p≤x}1/p=log log x+B+R(x)/log x−∫_x^∞R(t)/(t(log t)^2)dt, for a single real B.
3. The improper integral defining B converges absolutely; the remaining integral is bounded by sup|R|/log x. This yields the claimed real range x≥2.

**Dependencies.** [`AnalyticNumberTheory:AN.2/mertens-first-theorem`](#mertens-first-theorem), `mathlib:sum_mul_eq_sub_sub_integral_mul`.

**Acceptance.** One B and one absolute error constant work for every real x≥2. At x=2 the prime 2 is included; changing the endpoint convention only changes the bounded remainder.

**Sources.** [The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf), Theorem3.4(b) and its proof, printed pp.40–41.

<a id="mertens-prime-product"></a>

#### Mertens sum and product inputs

`AnalyticNumberTheory:AN.2/mertens-prime-product` · theorem · `TauCeti.AnalyticNumberTheory.mertens_prime_product`.

For real x≥2, ∏_{p≤x}(1−1/p)^−1=e^γ log x+O(1), with γ Euler’s constant and an absolute implied constant.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use the reciprocal-prime theorem and the Taylor remainder −log(1−u)−u=O(u²), uniformly for 0≤u≤1/2. Its prime tail is O(1/x). Thus log∏_{p≤x}(1−1/p)^−1=log log x+κ+O(1/log x).
2. Identify κ with γ using the real Euler product at s=1+ε/log x and the corrected integral in Exercise5.4(c)–(d). The uniform tilted-product/tail estimates and the Euler-constant integral comparison are explicit unresolved inputs in the Mertens constant gap.
3. After κ=γ, exponentiate the O(1/log x) logarithmic error; multiplication by log x gives an additive O(1). This step is not supplied by a mere two-sided comparison.

**Dependencies.** [`AnalyticNumberTheory:AN.2/mertens-prime-reciprocal`](#mertens-prime-reciprocal).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf), Theorem3.4(c), (3.6), printed pp.40–41; Exercise5.4, printed p.61.

<a id="prime-interval-three-x"></a>

#### Prime-number input

`AnalyticNumberTheory:AN.2/prime-interval-three-x` · theorem · `TauCeti.AnalyticNumberTheory.prime_interval_three_x`.

For all sufficiently large x, the number of primes in (x,3x] lies between 4+x/log x and 3x/log x.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Apply the rational PNT at x and 3x, subtract, and choose the threshold to absorb the constant 4.

**Dependencies.** [`AnalyticNumberTheory:AN.2/chebyshev-prime-count-transfer`](#chebyshev-prime-count-transfer).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), §3.5, proof of Theorem2, p.25.

<a id="mertens-product-comparison"></a>

#### Mertens product input

`AnalyticNumberTheory:AN.2/mertens-product-comparison` · theorem · `TauCeti.AnalyticNumberTheory.mertens_product_comparison`.

For y≥2, ∏_{p≤y}(1−1/p) is comparable to 1/log y, with absolute positive upper and lower constants. The application here needs the lower estimate after removing finitely many fixed primes, not an unsourced precise constant.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use the reciprocal Mertens product asymptotic and positivity.
2. Extend the two-sided comparison over the compact starting range y≥2.

**Dependencies.** [`AnalyticNumberTheory:AN.2/mertens-prime-product`](#mertens-prime-product).

**Acceptance.** For y=2 the product is 1/2; extend the eventual comparison to y≥2 using its finitely many values below any fixed threshold. Removing a fixed finite set of primes multiplies the product by finitely many positive inverse factors; the resulting constants may depend on that set.

**Sources.** [The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf), Theorem3.4(c), printed pp.40–41; [Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), Proof of Lemma4.9 p.713 and proof of Lemma4.11 p.716.

<a id="mertens-first-theorem"></a>

#### Mertens's first theorem and Σ_{p | N} log p/p = O(log log N)

`AnalyticNumberTheory:AN.2/mertens-first-theorem` · theorem · `TauCeti.AnalyticNumberTheory.mertens_first_theorem`.

For X≥2, Σ_{p<X}(log p)/p=log X+O(1), with an absolute implied constant.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Sum the pinned identity log n=Σ_{d|n}Λ(d) over 1≤n≤x and interchange the finite sums: Σlog n=Σ_{d≤x}Λ(d)floor(x/d). Chebyshev psi(x)=O(x) bounds the floor replacement error by O(x).
2. Use the log-summatory estimate Σ_{n≤x}log n=x log x−x+O(log x); its precise Abel/integral-comparison input is retained in the Mertens first theorem gap. Divide by x to obtain Σ_{d≤x}Λ(d)/d=log x+O(1).
3. The higher-prime-power contribution Σ_pΣ_{k≥2}log p/p^k is bounded by the convergent integer majorant Σ_{m≥2}log m/(m(m−1)). Its convergence/comparison input is also named in that gap.
4. Remove higher prime powers and pass from p≤x to p<x; an endpoint contributes at most log x/x, uniformly bounded for x≥2.

**Dependencies.** `mathlib:ArithmeticFunction.vonMangoldt_sum`, `mathlib:Chebyshev.psi_le_const_mul_self`, `mathlib:sum_mul_eq_sub_sub_integral_mul`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf), Theorem3.4(a) and proof, printed p.40.

<a id="squareclass-exceptional-repulsion"></a>

#### Landau repulsion for exceptional squareclasses

`AnalyticNumberTheory:AN.2/squareclass-exceptional-repulsion` · theorem · `TauCeti.AnalyticNumberTheory.squareclass_exceptional_repulsion`.

There is an effective absolute0<c_Landau<1/2 such that distinct d,e∈S(c_Landau) with |d|≤|e| satisfy |d|²≤|e|. This pairwise form applies to every existing finite ordered segment; no infinitude of S(c_Landau) is asserted.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Let Q_d be the fundamental-discriminant conductor. For nonzero squarefree d≠1, |d|≤Q_d≤4|d| and |d|≥1. Distinct squareclasses have distinct primitive field characters even when their absolute radicands agree.
2. If |e|<|d|², then Q_d Q_e<16|d|³. For a=|d|≥1, log(16a³)≤5log(a+4), since16a³≤(a+4)^5. Also log(|e|+4)≥log(|d|+4).
3. Both near-one zeros are at least1−c_Landau/log(|d|+4). Since log(Q_d Q_e)≤5log(|d|+4), choose c_Landau≤3c_star/5; both are then at least1−3c_star/log(Q_d Q_e), contradicting two_real_zero_separation.
4. Choose c_Landau effectively small enough to lie in(0,1/2). The strict two-real-zero theorem is still an unverified source input; the elementary conductor-log deduction introduces no new analytic theorem.

**Dependencies.** [`AnalyticNumberTheory:AN.2/exceptional-squareclasses`](#exceptional-squareclasses), [`AnalyticNumberTheory:AN.2/two-real-zero-separation`](#two-real-zero-separation).

**Acceptance.** The conclusion is pairwise and vacuous for an empty/singleton exceptional set. Retain Q_−1=4 and Q_2=8; replacing conductor by |d| breaks the cited analytic input. Use the explicit slack c_Landau≤3c_star/5 and log(Q_d Q_e)≤5log(|d|+4). This keeps the factor4 and the+4 height convention.

**Sources.** [On Stevenhagen’s conjecture](https://arxiv.org/pdf/2201.13424v1), §7.2 Definition7.5 and following paragraph, p.61.

<a id="quadratic-prime-character-interval"></a>

#### Quadratic prime-character interval estimate

`AnalyticNumberTheory:AN.2/quadratic-prime-character-interval` · theorem · `TauCeti.AnalyticNumberTheory.quadratic_prime_character_interval`.

There are positive absolute effective constants c,C such that for every nonzero squarefree integer D≠1, its primitive field character χ_D of conductor Q_D=|Disc(Q(√D))|, and real2≤u<v, |Σ_{u<p<v, p prime, p∤Q_D}χ_D(p)|≤C[E_D(v)+v exp(−c log v/(√log v+log Q_D))(log(vQ_D))⁴]. Here E_D(v)=v^β if the conductor-uniform zero-free region singles out a simple real exceptional zero β∈(1/2,1), and E_D(v)=0 otherwise. Equivalently extend χ_D by0 at ramified primes and sum over all primes. This is an upper bound, not an asymptotic for short intervals.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Apply character_weighted_pnt to the primitive Dirichlet character of conductor Q_D, uniformly after effective constants are fixed.
2. Remove higher prime powers and then use Abel summation to pass from ψ(x,χ) to Σ_{p<x}χ(p). The exceptional main term has absolute value bounded by a constant times x^β because β>1/2.
3. Subtract the two initial-interval formulas. Bound the error at u by an increasing envelope evaluated at v, after decreasing c if necessary; handle the fixed bounded-height range by enlarging C. Retain both strict endpoints.
4. Compare |D|≤Q_D≤4|D| to recover the looser printed(7.7) radicand form, with log(v|D|)≥log2 even when D=−1. The original quantitative character-PNT proof, higher-power estimate and uniform Abel/envelope deduction remain recorded obligations.

**Dependencies.** [`AnalyticNumberTheory:AN.2/character-weighted-pnt`](#character-weighted-pnt).

**Acceptance.** If(u,v) contains no unramified prime the sum is0; no unproved prime-existence claim is hidden in this bound. For D=−1 use χ_−4 and conductor4; p=2 is excluded or contributes0. Both constants are independent of D,u,v; the exceptional term is omitted only under the exact same zero-free-region convention as its supplier.

**Sources.** [On Stevenhagen’s conjecture](https://arxiv.org/pdf/2201.13424v1), §7.2 proof of Proposition7.6, (7.7), p.62.

<a id="effective-quadratic-zero-separation"></a>

#### Effective distance of a quadratic real zero from one

`AnalyticNumberTheory:AN.2/effective-quadratic-zero-separation` · theorem · `TauCeti.AnalyticNumberTheory.effective_quadratic_zero_separation`.

For every ε>0 there is an effectively computable c_ε>0, fixed before D and β, such that for every nonzero squarefree integer D≠1 and real zero β∈(1/2,1) of the canonical continued primitive field-character L(s,χ_D), 1−β≥c_ε |D|^(−1/2−ε). The conductor is Q_D=|Disc(Q(√D))|, with |D|≤Q_D≤4|D|; conductor/radicand conversion only changes c_ε effectively.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use the effective positive class-number/regulator lower bound for imaginary and real quadratic fields, respectively, and the analytic class-number comparison at1. This is the elementary effective exponent1/2 regime, not Siegel’s ineffective exponentε regime.
2. Bound the real derivative between β and1 uniformly in Q_D; mean-value transfer from L(1,χ_D) gives an effective distance from1. Supply the actual derivative estimate and the fundamental-unit lower bound before treating this as proved.
3. Use Q_D≤4|D| and absorb log factors into |D|^ε with effective constants. The original proof has not been read; KP prints the estimate without that proof.

**Acceptance.** Only real zeros in(1/2,1) are used; trivial negative zeros are outside the interface. No ineffective Siegel constant can discharge the effective c_ε contract. At D=−1 or2 the positive conductor is4 or8, respectively; the finite small-conductor range is included effectively.

**Sources.** [On Stevenhagen’s conjecture](https://arxiv.org/pdf/2201.13424v1), §7.2 proof of Proposition7.6, p.62, immediately after(7.7).

<a id="rational-mangoldt-boundary"></a>

#### Regularized rational Mangoldt boundary

`AnalyticNumberTheory:AN.2/rational-mangoldt-boundary` · lemma · `TauCeti.AnalyticNumberTheory.rational_mangoldt_boundary`.

There exists G:C→C continuous on {s:Re s≥1} such that, for Re s>1, G(s)=−ζ′(s)/ζ(s)−1/(s−1). Together with the pinned absolutely convergent Λ LSeries identity, this is the exact residue-1 Wiener–Ikehara boundary input. G(1) is the analytic extension’s value, not the junk-valued subtraction.

**Construction and proof.**

1. Near 1 use the existing regular completed-zeta formula and gamma nonvanishing to obtain an analytic pole-cleared h(s)=(s−1)ζ(s) with h(1)=1.
2. On a sufficiently small neighbourhood h is nonzero and −ζ′/ζ−1/(s−1)=−h′/h off 1. Define G(1)=−h′(1)/h(1).
3. Away from 1 on the closed half-plane, use analytic zeta and pinned nonvanishing to get continuity. Glue with the neighbourhood expression; cite the pinned Λ summability and logarithmic-derivative identity.

**Dependencies.** `mathlib:differentiableAt_riemannZeta`, `mathlib:riemannZeta_ne_zero_of_one_le_re`, `mathlib:completedRiemannZeta_eq`, `mathlib:differentiable_completedZeta₀`, `mathlib:riemannZeta_residue_one`, `mathlib:ArithmeticFunction.LSeriesSummable_vonMangoldt`, `mathlib:ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div`, [`AnalyticNumberTheory:AN.2/zeta-pole-log-derivative`](#zeta-pole-log-derivative).

**Acceptance.** Continuity is required at 1, not just convergence from real arguments. The logarithmic pole coefficient is 1 even when the residue of the uncompleted function changes.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §6.1 Theorem6.1 and §7.1; derived Wiener–Ikehara boundary adapter.

<a id="progression-mangoldt-boundary"></a>

#### Regularized progression Mangoldt boundary

`AnalyticNumberTheory:AN.2/progression-mangoldt-boundary` · lemma · `TauCeti.AnalyticNumberTheory.progression_mangoldt_boundary`.

For fixed q≥1 and a unit residue a modulo q, put b(n)=Λ(n)1_{n≡a modq}≥0 with b(0)=0. Its LSeries converges absolutely for Re s>1 and equals F(s)=φ(q)^−1∑_χ χ(a)^−1(−L′(s,χ)/L(s,χ)), where χ ranges over all characters modulo q, including the principal and imprimitive ones. There exists G continuous on Re s≥1 with G(s)=F(s)−φ(q)^−1/(s−1) for Re s>1.

**Construction and proof.**

1. Use pinned finite-character orthogonality for the unit a and all n, so nonunits n contribute zero. The inverse is on a; apply χΛ summability and the LSeries-to-continuation derivative comparison.
2. For χ nonprincipal the canonical L is holomorphic and nonzero on the whole line Re s=1, so its logarithmic derivative is continuous there.
3. For χ principal write L=ζ times the finite deleted Euler factors. Each factor is nonzero on Re s≥1 because |p^(−s)|≤p^−1<1. Add their holomorphic logarithmic derivatives to the rational boundary adapter, then average with χ(a)^−1. The principal character contributes exactly 1/φ(q) to the logarithmic pole.

**Dependencies.** [`AnalyticNumberTheory:AN.2/rational-mangoldt-boundary`](#rational-mangoldt-boundary), `mathlib:DirichletCharacter.sum_char_inv_mul_char_eq`, `mathlib:DirichletCharacter.LSeries_twist_vonMangoldt_eq`, `mathlib:DirichletCharacter.LSeriesSummable_twist_vonMangoldt`, `mathlib:DirichletCharacter.deriv_LFunction_eq_deriv_LSeries`, `mathlib:DirichletCharacter.differentiableAt_LFunction`, `mathlib:DirichletCharacter.LFunctionTrivChar_eq_mul_riemannZeta`, `mathlib:DirichletCharacter.LFunction_ne_zero_of_one_le_re`.

**Acceptance.** For q=1 the sum has one character and gives the rational boundary. For q=4,a=1 or3 the residue is 1/2; evaluating the principal L at its junk value at1 is unnecessary.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §4.3 finite Fourier extraction, pp.25–26; §10.1 p.59; derived fixed-modulus boundary adapter.

## AN.3 — Explicit formulas and density estimates

### Zeros, contours and explicit formulas

<a id="weil-test-function"></a>

#### Admissible Weil test function

`AnalyticNumberTheory:AN.3/weil-test-function` · definition · `TauCeti.AnalyticNumberTheory.weil_test_function`.

For c≥0 and F:R→R, weil_test_function(c,F) means that some ε>0 makes G(x)=F(x)exp((1/2+c+ε)|x|) Lebesgue integrable and of bounded variation on R, that F(x)=(F(x−)+F(x+))/2 at every x, and that the difference quotient q(x)=(F(x)−F(0))/x for x≠0, set to0 at x=0, has bounded variation on R. The quotient may have distinct finite one-sided limits at0; no differentiability at0 is imposed. These symmetric-tail hypotheses are a strengthening of Mestre’s printed one-signed weight. They supply both F and its reflection in the contour proof.

**Construction and proof.**

1. Use the pinned real bounded-variation and strict one-sided-limit notions, not a replacement variation or limit carrier. Finite weighted variation implies local finite variation of F and genuine one-sided limits.
2. Use ordinary real division at x=0 to choose q(0)=0; changing this single finite value does not affect integrability or finite variation. Bound q near0 to obtain F(x)−F(0)=O(|x|).
3. For the transform on −c≤Re s≤1+c, dominate its norm by |G(x)|exp(−ε|x|). Reflection and real linear combinations retain the conditions after decreasing ε.

**Dependencies.** `mathlib:BoundedVariationOn`, `mathlib:Function.leftLim`, `mathlib:Function.rightLim`, `mathlib:MeasureTheory.Integrable`, `mathlib:MeasureTheory.integral`, `mathlib:MeasureTheory.Integrable`, `mathlib:MeasureTheory.integral`.

**API.**

- `weil_test_function.transform` (data): Define Φ_F(s)=∫_R F(x)exp((s−1/2)x)dx with the complex exponential. For an admissible F, the integrand is absolutely integrable whenever −c≤Re s≤1+c; totalized integration is never a convergence claim.
- `weil_test_function.reflection` (functoriality): x↦F(−x) is admissible with the same c,ε.
- `weil_test_function.add` (structure): Real linear combinations of admissible functions are admissible, after decreasing ε if needed.
- `weil_test_function.normalization` (projection): F equals the mean of its two one-sided limits, fixing boundary values in the summation formula.
- `weil_test_function.mono` (compatibility): If F is admissible for c and 0≤c′≤c then F is admissible for c′, using ε′=ε+c−c′.
- `weil_test_function.continuous_at_zero` (characterisation): Admissibility implies a finite constant C≥0 with |F(x)−F(0)|≤C|x| for all x, hence continuity at0; the one-sided derivatives need not agree.

**Unit tests.**

- `weil_test_function.zero` (computation): F=0 is admissible and Φ=0.
- `weil_test_function.gaussian` (computation): For c≥0, F(x)=exp(−x²) is admissible and Φ_F(1/2)=√π.
- `weil_test_function.one_tail` (non-example): F(x)=exp(−2x) on all R satisfies neither two-tail integrability nor the required Fourier transform; a one-tail test is rejected.
- `weil_test_function.kink` (computation): F(x)=exp(−|x|) is admissible for c=0, although (F(x)−F(0))/x has one-sided limits1 and−1 at0. A removable-continuous-quotient requirement would wrongly reject it.
- `weil_test_function.asymmetric_tail` (non-example): F(x)=exp(x/4) for x<0 and exp(−2x) for x≥0 satisfies Mestre’s one-signed weighted integrability/BV conditions at c=0, ε=1/4 and the difference-quotient condition, but is not admissible here and its ordinary transform integral at s=0 diverges.

**Acceptance.** F=0 is admissible and Φ=0. For c≥0, F(x)=exp(−x²) is admissible and Φ_F(1/2)=√π. F(x)=exp(−2x) on all R satisfies neither two-tail integrability nor the required Fourier transform; a one-tail test is rejected. F(x)=exp(−|x|) is admissible for c=0, although (F(x)−F(0))/x has one-sided limits1 and−1 at0. A removable-continuous-quotient requirement would wrongly reject it. F(x)=exp(x/4) for x<0 and exp(−2x) for x≥0 satisfies Mestre’s one-signed weighted integrability/BV conditions at c=0, ε=1/4 and the difference-quotient condition, but is not admissible here and its ordinary transform integral at s=0 diverges.

**Uses.** `PAPER-CHENEVIER-TAIBI-20/mestre-explicit-formula`: Controls both prime-power directions and the symmetric zero sum. `Mestre§I.2, pp.213–214, reflected vertical contour; Chenevier–Taïbi§2.3 p.275`: Both vertical sides require the negative tail. CT uses even c=0 functions; that specialization avoids the printed asymmetric-tail defect.

**Sources.** [Formules explicites et minorations de conducteurs de variétés algébriques](https://www.numdam.org/item/CM_1986__58_2_209_0.pdf), §I.2, pp.212–214.

**Atlas planet.** Weil test functions.

<a id="zeta-zero-multiset"></a>

#### Finite zero multiset

`AnalyticNumberTheory:AN.3/zeta-zero-multiset` · definition · `TauCeti.AnalyticNumberTheory.zeta_zero_multiset`.

For T≥0, Z(T) is the finite multiset of nontrivial zeros of ξ in 0≤Re ρ≤1 and |Im ρ|<T, with each ρ repeated analyticOrderNatAt ξ ρ times. The strict height cutoff and finite analytic orders are mandatory; the compact enclosing rectangle proves finiteness.

**Construction and proof.**

1. Use xi entirety and nonzero endpoints, and its strict zero-strip lemma. The closed rectangle0≤Reρ≤1,|Imρ|≤T is compact, so isolated zeros and finite analytic orders give a finite support.
2. Restrict to the strict height cutoff and use a Finsupp over complex points whose value is the analytic order; Multiset repetition is an equivalent presentation.
3. The xi/zeta multiplicity comparison on the open strip multiplies zeta by analytic nonzero elementary/gamma factors. The Mellin comparison gives conjugation of xi; conjugation preserves analytic orders.
4. For T≤0 the strict-height support is empty. Prove the monotonicity and endpoint tests without confusing the enclosing closed rectangle with the actual strict cutoff.

**Dependencies.** [`AnalyticNumberTheory:AN.2/riemann-xi`](#riemann-xi), [`AnalyticNumberTheory:AN.2/compact-zero-count`](#compact-zero-count), `mathlib:analyticOrderNatAt`, [`AnalyticNumberTheory:AN.2/xi-entire-and-endpoints`](#xi-entire-and-endpoints), [`AnalyticNumberTheory:AN.2/xi-zero-critical-strip`](#xi-zero-critical-strip), [`AnalyticNumberTheory:AN.2/xi-integral-comparison`](#xi-integral-comparison), `mathlib:riemannZeta_eq_completedRiemannZeta₀`, `mathlib:Complex.Gamma_ne_zero_of_re_pos`.

**API.**

- `zeta_zero_multiset.multiplicity` (characterisation): The multiplicity of ρ in Z(T) is its finite analytic order if it lies in the stated rectangle, and0 otherwise.
- `zeta_zero_multiset.mono` (functoriality): If T≤U then Z(T) is a submultiset of Z(U).
- `zeta_zero_multiset.conjugation` (relation): Conjugation preserves the zero multiset and multiplicities.
- `zeta_zero_multiset.xi_zeta` (compatibility): On 0<Re ρ<1, ξ and ζ have the same zeros and analytic multiplicities.

**Unit tests.**

- `zeta_zero_multiset.zero_height` (computation): Z(0) is empty, using the strict height inequality.
- `zeta_zero_multiset.double` (computation): A double analytic zero occurs twice, not once.
- `zeta_zero_multiset.endpoint` (non-example): A zero with |Im ρ|=T is excluded from Z(T).
- `zeta_zero_multiset.poles` (computation): s=0 and1 are not xi zeros since ξ has value1/2 there.

**Acceptance.** Z(0) is empty, using the strict height inequality. A double analytic zero occurs twice, not once. A zero with |Im ρ|=T is excluded from Z(T). s=0 and1 are not xi zeros since ξ has value1/2 there.

**Uses.** `AnalyticNumberTheory:AN.3/von-mangoldt-explicit-formula-and-pnt-error`: The residue sum uses multiplicities and an unambiguous height cutoff.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §9.2 Lemma9.2 and strict-cutoff Theorem9.9, pp.54,56–58; §5.1 xi symmetry p.35.

**Atlas planet.** Zeros with analytic multiplicity.

<a id="von-mangoldt-explicit-formula-and-pnt-error"></a>

#### Truncated von Mangoldt formula

`AnalyticNumberTheory:AN.3/von-mangoldt-explicit-formula-and-pnt-error` · theorem · `TauCeti.AnalyticNumberTheory.von_mangoldt_explicit_formula_and_pnt_error`.

For x≥2 and T≥2, let ψ₀(x)=∑_{1≤n<x}Λ(n)+(1/2)∑_{1≤n=x}Λ(n), and let d(x)>0 be the distance to the nearest prime power other than x. There is an absolute C such that ψ₀(x)−x=−∑_{ρ:0≤Reρ≤1, |Imρ|<T}x^ρ/ρ−ζ′(0)/ζ(0)−(1/2)log(1−x⁻²)+R(x,T), with zeros counted with analytic multiplicity and |R(x,T)|≤C[x log²(xT)/T+(log x)min(1,x/(T d(x)))]. Powers of positive x use exp(ρ log x). The PNT-error corollary formerly bundled under this ID is a separate remaining target.

**Hypotheses.** x≥2; T≥2; zeros counted with multiplicity; symmetric strict height cutoff; half-weight at a prime-power endpoint.

**Construction and proof.**

1. Apply the ADS truncated arithmetic Perron formula to the half-weight ψ₀.
2. Shift the contour using the residue lemma, horizontal bound and left-contour limit.
3. Adjust from a good height to the stated strict cutoff with multiplicity-weighted local zero counting; include the nearest-prime-power error.

**Dependencies.** [`AnalyticNumberTheory:AN.3/zeta-zero-multiset`](#zeta-zero-multiset), [`AnalyticNumberTheory:AN.3/good-height-selection`](#good-height-selection), [`AnalyticNumberTheory:AN.3/explicit-formula-residues`](#explicit-formula-residues), [`AnalyticNumberTheory:AN.3/perron-nearest-prime-power-error`](#perron-nearest-prime-power-error), [`AnalyticNumberTheory:AN.3/explicit-formula-horizontal-bound`](#explicit-formula-horizontal-bound), [`AnalyticNumberTheory:AN.3/explicit-formula-left-contour`](#explicit-formula-left-contour), `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation`.

**Acceptance.** At a prime power m, ψ₀(m)=Chebyshev.psi(m)−Λ(m)/2; at x=2 the value is (log2)/2, not log2. Multiplicity cannot be replaced by a set of distinct zeros. At a zero height T, a strict cutoff must agree with the height-adjustment error, not silently switch to ≤.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Definition7.1/Theorem7.2, printed pp.43–44; Theorem9.9 final assembly, pp.56–58.

**Atlas planet.** Von Mangoldt explicit formula.

<a id="reciprocal-zeta-line-one"></a>

#### Standard gamma-quotient and 1/ζ(1+2it) estimates (black box)

`AnalyticNumberTheory:AN.3/reciprocal-zeta-line-one` · theorem · `TauCeti.AnalyticNumberTheory.reciprocal_zeta_line_one`.

Let Zinv be the meromorphic reciprocal of the continued ζ, extended at s=1 by zero. For all real t, |Zinv(1+2it)|≤C log(2+|t|), and Zinv(1+2it)→0 as t→0.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use the zero-free region and pole-cleared reciprocal estimates away from t=0.
2. Extend 1/ζ through the pole by the removable value 0; no totalized value of 1/riemannZeta 1 is used.

**Dependencies.** [`AnalyticNumberTheory:AN.2/classical-zero-free-region`](#classical-zero-free-region).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: Geometric invariants for real quadratic fields](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json), Proof of Proposition 2, p.969 ('standard estimates for the gamma function quotient and for ζ(2s)'); [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Proof of Proposition2, printed p.969, sentence preceding (6.7).

<a id="mestre-weil-explicit-formula"></a>

#### Weil's explicit formula (Mestre's formalism)

`AnalyticNumberTheory:AN.3/mestre-weil-explicit-formula` · theorem · `TauCeti.AnalyticNumberTheory.mestre_weil_explicit_formula`.

Let A, B > 0, a_i, a′_i ≥ 0 (1 ≤ i ≤ M) with Σ a_i = Σ a′_i, b_i, b′_i ∈ C with non-negative real parts, and Λ_1, Λ_2 meromorphic on C with (i) Λ_1(1 − s) = wΛ_2(s) for some w ∈ C^×; (ii) finitely many poles; (iii) Λ_i minus its singular parts bounded in every vertical strip of finite width; (iv) for some c ≥ 0 and Re s > 1 + c, Λ_1(s) = A^s Π_{i=1}^M Γ(a_i s + b_i) Π_p Π_{i=1}^{M′} (1 − α_i(p)p^{−s})^{−1} and Λ_2(s) = B^s Π_{i=1}^M Γ(a′_i s + b′_i) Π_p Π_{i=1}^{M′} (1 − β_i(p)p^{−s})^{−1} with |α_i(p)|, |β_i(p)| ≤ p^c. Let F satisfy weil_test_function(c,F). For every zero gamma slope a_i=0 (respectively a′_i=0), assume b_i≠0 (respectively b′_i≠0), so its constant gamma factor is finite and nonzero. Then Σ_ρ Φ(ρ) − Σ_μ Φ(μ) + Σ_{i=1}^M I(a_i, b_i) + Σ_{i=1}^M J(a′_i, b′_i) = F(0) log(AB) − Σ_{p,i,k≥1} (α_i(p)^k F(k log p) + β_i(p)^k F(−k log p)) log p / p^{k/2}, where ρ (resp. μ) runs over the zeros (resp. poles) of Λ_1 with −c ≤ Re ≤ 1 + c, with multiplicity, Σ_ρ Φ(ρ) = lim_{T→∞} Σ_{|Im ρ|<T} Φ(ρ), Φ(s) = ∫_R F(x) e^{(s−1/2)x} dx, I(a, b) = a ∫_0^∞ (F(ax) e^{−(a/2+b)x}/(1 − e^{−x}) − F(0) e^{−x}/x) dx and J(a, b) is the same with F(−ax). For a>0 the displayed I,J are ordinary convergent combined integrals (do not integrate the two individually divergent subtraction terms separately). For a=0 set I(0,b)=J(0,b)=0 after removing its constant gamma factor; this is not0 times an undefined integral.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Remove finite nonzero constant gamma factors (zero slopes); their logarithmic derivatives are0 and rescaling the dual functions changes only w. Preserve A,B and the equal positive gamma-slope sums.
2. Use pole-clearing and vertical-strip bounds to obtain polynomial strip growth, locally finite zeros and safe heights with a logarithmic-derivative bound. The needed general strip may be wider than the −1<σ<2 printed in Remark1.1.3.
3. Integrate Φ_F(s)Λ′_1(s)/Λ_1(s) on a rectangle and count orders of zeros/poles. The functional equation converts the left edge to the reflected F term; symmetric-tail hypotheses justify both edges.
4. Fourier inversion yields each prime-power term. For a>0 the combined gamma integral uses Lemma1.2.1 and the Poitou pairing Lemma1.2.2; near0 use the bounded difference quotient for cancellation before integrating.
5. Pass to the symmetric zero-sum limit with the exact multiplicities. The original Poitou/good-height/uniform Fourier-limit inputs are recorded gaps, not routine algebra.

**Dependencies.** [`AnalyticNumberTheory:AN.3/weil-test-function`](#weil-test-function).

**Acceptance.** For F=0 every term vanishes. For the completed Riemann zeta take c=0, a=a′=1/2, b=b′=0, A=B=π^(−1/2), α=β=1. Its two pole terms are Φ_F(0)+Φ_F(1), and the prime side has both ±k log p contributions. Adding a finite nonzero constant gamma factor with slope0 changes no explicit-formula term; a zero-slope Γ(0) is excluded. The asymmetric F in test weil_test_function.asymmetric_tail is excluded: Φ_F(0) in the Riemann pole term would diverge under the printed one-signed conditions.

**Sources.** [Formules explicites et minorations de conducteurs de variétés algébriques](https://www.numdam.org/item/CM_1986__58_2_209_0.pdf), §I.1–I.2, pp.211–215; Remark1.1.3, Lemmas1.2.1–1.2.2; [Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf), §2.3 pp.275–276, (2.3.5).

<a id="zeta-unit-height-zero-count"></a>

#### Local zero count

`AnalyticNumberTheory:AN.3/zeta-unit-height-zero-count` · lemma · `TauCeti.AnalyticNumberTheory.zeta_unit_height_zero_count`.

There is an absolute C>0 such that for every real T≥2, the number of nontrivial zeta-zero occurrences with T≤Imρ≤T+1 is at most C log(T+2).

**Construction and proof.**

1. Invoke zeta-poisson-zero-weight at t=T. Every zero in the closed unit interval has reciprocal-square weight≥1/2.
2. The xi/zeta API identifies analytic multiplicities inside the open critical strip; sum the finite nonnegative inequality.
3. For T≥2, log(T+2) is comparable to log T. This avoids the previously unverified shifted-Jensen centre lower bound and disk-growth estimate.

**Dependencies.** [`AnalyticNumberTheory:AN.3/zeta-zero-multiset`](#zeta-zero-multiset), [`AnalyticNumberTheory:AN.2/digamma-right-half-plane`](#digamma-right-half-plane), [`AnalyticNumberTheory:AN.3/zeta-poisson-zero-weight`](#zeta-poisson-zero-weight).

**Acceptance.** A zero at either endpoint is included with full multiplicity. The proof handles the local logarithmic count, not only the global O(T log T) count.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Lemma9.4 p.54 and Exercise9.6.1 p.58, via Exercise8.4.9 p.52.

<a id="good-height-selection"></a>

#### Choosing a contour height

`AnalyticNumberTheory:AN.3/good-height-selection` · lemma · `TauCeti.AnalyticNumberTheory.good_height_selection`.

There are absolute c,C>0 such that for every T≥2 there is T′∈[T,T+1] with |T′−Imρ|≥c/log(T+2) for every ξ zeroρ. For x≥2, changing the symmetric strict cutoff from T to T′ changes Σmρ x^ρ/ρ by at most C x log(T+2)/T; arbitrary weights require their own uniform band bound.

**Construction and proof.**

1. Choose c small enough that h=c/log(T+2)≤1/4. Only ordinates in[T−1,T+2] can have excluded h-neighbourhoods meeting[T,T+1].
2. Cover this enlarged band by a fixed number of unit intervals; the positive-weight bound gives one C0 log(T+2) count, with multiplicity and bounded T included.
3. The total lengths of excluded closed intervals are at most2h C0 log(T+2). Choose c with this strictly less than1; finite interval subadditivity gives a point in[T,T+1] outside every interval.
4. Conjugation gives separation at−T′ too. Changed zero occurrences lie in the two unit bands; each |x^ρ/ρ|≤x/T. Add their finite count bound. No assertion is made for unbounded arbitrary weights.

**Dependencies.** [`AnalyticNumberTheory:AN.3/zeta-unit-height-zero-count`](#zeta-unit-height-zero-count), [`AnalyticNumberTheory:AN.3/zeta-poisson-zero-weight`](#zeta-poisson-zero-weight), [`AnalyticNumberTheory:AN.3/zeta-zero-multiset`](#zeta-zero-multiset).

**Acceptance.** The zero bands just below T and above T+1 are included when excluding neighbourhoods. A cutoff exactly at a zero ordinate still has the stated strict-cutoff comparison.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Remark9.3 p.54 and Theorem9.9 height adjustment p.57.

<a id="zeta-local-log-derivative"></a>

#### Local logarithmic-derivative expansion

`AnalyticNumberTheory:AN.3/zeta-local-log-derivative` · lemma · `TauCeti.AnalyticNumberTheory.zeta_local_log_derivative`.

There is an absolute C>0 such that for −1≤σ≤2,|t|≥2, and σ+it not a nontrivial zero, ζ′/ζ(σ+it)=Σ_(|t−Imρ|<1)mρ/(σ+it−ρ)+E(σ,t), with |E(σ,t)|≤C log(2+|t|). It also holds at a zero ordinate if the evaluation point itself is not a zero.

**Construction and proof.**

1. Subtract the corrected Hadamard formulas at s=σ+it and s0=2+it; the1/ρ corrections and B cancel.
2. Use digamma(z+1)=digamma(z)+1/z to move s/2 to1+s/2, whose real part is at least1/2. The gamma and elementary rational differences are O(log(2+|t|)); gamma poles and s=0,1 are absent because |t|≥2.
3. For |t−Imρ|≥1, the reciprocal difference is bounded in norm by3/|t−Imρ|²≤6/(1+(t−Imρ)²). The positive-weight lemma controls the entire tail, without an unproved separate annulus summation.
4. For |t−Imρ|<1, subtracting the s0 reciprocal costs at most1 per zero occurrence, because2−Reρ>1. Bound this local count with the same weight lemma; the pinned right-edge series controls ζ′/ζ(s0).

**Dependencies.** [`AnalyticNumberTheory:AN.2/zeta-hadamard-log-derivative`](#zeta-hadamard-log-derivative), [`AnalyticNumberTheory:AN.3/zeta-unit-height-zero-count`](#zeta-unit-height-zero-count), [`AnalyticNumberTheory:AN.2/zeta-log-derivative-right`](#zeta-log-derivative-right), [`AnalyticNumberTheory:AN.3/zeta-poisson-zero-weight`](#zeta-poisson-zero-weight), [`AnalyticNumberTheory:AN.2/digamma-right-half-plane`](#digamma-right-half-plane), `mathlib:Complex.digamma_apply_add_one`.

**Acceptance.** At |t−Imρ|=1 the term belongs to the tail and is bounded there. Approaching a zero is permitted after subtracting its displayed pole; exclude the actual zero before dividing.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Lemma9.6 pp.55–56 and Exercise9.6.2 p.58.

<a id="zeta-left-log-derivative"></a>

#### Left-half-plane bound away from trivial zeros

`AnalyticNumberTheory:AN.3/zeta-left-log-derivative` · lemma · `TauCeti.AnalyticNumberTheory.zeta_left_log_derivative`.

For every fixed c>0 there is C_c>0 such that for every complex w with Re w≤−1 and |w+2n|≥c for every integer n≥1, ζ(w)≠0 and |ζ′(w)/ζ(w)|≤C_c log(2+|w|).

**Construction and proof.**

1. Set s=1−w, so Re s≥2. Import pinned riemannZeta_one_sub, already in the2(2π)^(-s)Gamma(s)cos(πs/2)zeta(s) form; no separate duplication/reflection construction is needed.
2. All factors are nonzero off the odd positive s integers, precisely the excluded negative-even w points. Differentiate the identity and divide on this regular domain.
3. The exponential factors contribute constants; digamma(s) is O(log(2+|s|)) and the pinned right-edge logarithmic zeta derivative is uniformly bounded.
4. The tangent factor is uniformly O_c(1): for large |Im s| use its exponential quotient; for bounded imaginary part use periodicity on a compact real strip avoiding cosine zeros by c. Bounded |s| is absorbed by compact continuity.

**Dependencies.** [`AnalyticNumberTheory:AN.2/digamma-right-half-plane`](#digamma-right-half-plane), [`AnalyticNumberTheory:AN.2/zeta-log-derivative-right`](#zeta-log-derivative-right), `mathlib:riemannZeta_one_sub`, `mathlib:Complex.Gamma_ne_zero_of_re_pos`, `mathlib:Complex.differentiableAt_Gamma`.

**Acceptance.** Negative even integers are excluded; negative odd integers are regular and included when their distance satisfies c. Constants depend only on c, not on the chosen left contour or height.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Lemma9.8 p.56; pinned full functional equation.

<a id="explicit-formula-residues"></a>

#### Residues of the Perron integrand

`AnalyticNumberTheory:AN.3/explicit-formula-residues` · lemma · `TauCeti.AnalyticNumberTheory.explicit_formula_residues`.

For x>1, the integrand −(ζ′/ζ)(s)x^s/s has residue x at1, −m_ρx^ρ/ρ at a nontrivial zeroρ, x^(−2n)/(2n) at−2n, and −ζ′(0)/ζ(0) at0. Summing the trivial zeros gives −(1/2)log(1−x^−2).

**Construction and proof.**

1. At a nontrivial zeroρ of order mρ, write ζ(s)=(s−ρ)^mρ g(s), with analytic nonzero g; then −ζ′/ζ has residue−mρ. Multiplication by x^s/s evaluates the regular factor x^ρ/ρ.
2. At1 use the nonzero pole-cleared germ from zeta-pole-log-derivative; its logarithmic derivative gives the opposite residue+1, hence residue x.
3. Use zeta-trivial-zero-simple to obtain order1 at−2n, rather than merely importing a zero-value theorem. Its integrand residue is x^(−2n)/(2n).
4. At0, ζ(0)=−1/2 and zeta is analytic; only1/s contributes the residue−ζ′(0)/ζ(0). Sum the positive trivial-zero series using the convergent−log(1−u) Taylor series at u=x^−2∈(0,1).
5. Match the local Laurent/residue and finite-rectangle contour interfaces at the pin; the general meromorphic product API alone does not supply a residue theorem.

**Dependencies.** [`AnalyticNumberTheory:AN.3/zeta-zero-multiset`](#zeta-zero-multiset), [`AnalyticNumberTheory:AN.2/zeta-hadamard-log-derivative`](#zeta-hadamard-log-derivative), [`AnalyticNumberTheory:AN.3/zeta-trivial-zero-simple`](#zeta-trivial-zero-simple), [`AnalyticNumberTheory:AN.2/zeta-pole-log-derivative`](#zeta-pole-log-derivative), `mathlib:Complex.hasSum_taylorSeries_neg_log`.

**Acceptance.** A double nontrivial zero contributes−2x^ρ/ρ. The trivial-zero sum is positive and equals−(1/2)log(1−x^−2). The origin term has ζ(0) in its denominator, with one derivative in the numerator.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §9.2 Lemma9.2 p.54, proof omitted; local analytic-order factorization.

<a id="perron-nearest-prime-power-error"></a>

#### Nearest-prime-power remainder

`AnalyticNumberTheory:AN.3/perron-nearest-prime-power-error` · lemma · `TauCeti.AnalyticNumberTheory.perron_nearest_prime_power_error`.

For real x≥2,T≥2,c=1+1/log x, put δ(x)=infDist(x,{m∈ℝ:m is a natural prime power and m≠x})>0. The Perron remainder for ψ₀(x), after retaining the exact endpoint kernel, is bounded by C[x log²(xT)/T+(log x)min(1,x/(Tδ(x)))], with one absolute C. A prime-power endpoint has half weight only in the infinite-height limit.

**Construction and proof.**

1. Prime powers are a nonempty locally finite subset of the positive integers. After excluding x, their distance has a positive attained minimum. The endpoint m=x is treated separately.
2. Use ADS6’s exact finite kernel. At y=1 its value is arctan(T/c)/π, and its difference from1/2 is O(c/T), contributing O(log x/T) here.
3. For |m/x−1|≥1/4, use the absolutely convergent Λ series and −ζ′(c)/ζ(c)=O(log x). The near-one pole estimate applies for sufficiently large x; for remaining x use positivity/summability at a fixed c>1 and compact absorption.
4. On each of the two intervals3x/4<m<x and x<m<5x/4, isolate the closest prime power. Its contribution is at most C log x min(1,x/(Tδ(x))).
5. For all other m in that interval use integer spacing, |log(m/x)|≥C|m−x|/x, Λ(m)≤log m and the positive harmonic sum. This contributes O(x log²x/T). The actual nearest-prime-power term remains unabsorbed.
6. Match the infDist/local-finiteness and finite-height kernel constants rather than assuming the formal infinite Perron identity can be summed absolutely.

**Dependencies.** [`AnalyticNumberTheory:AN.2/zeta-pole-log-derivative`](#zeta-pole-log-derivative), `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation`, `mathlib:ArithmeticFunction.LSeriesSummable_vonMangoldt`, `mathlib:ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div`.

**Acceptance.** At x=2,4,δ(x)=1 after excluding x; at x=7/2 the distance is1/2. A finite-height prime-power endpoint is arctan(T/c)/π; replacing it directly by1/2 misses its O(log x/T) correction.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Lemma9.5 p.55; full Theorem9.9 proof pp.57–58; ADS6 endpoint contract.

<a id="explicit-formula-horizontal-bound"></a>

#### Horizontal contour bound

`AnalyticNumberTheory:AN.3/explicit-formula-horizontal-bound` · lemma · `TauCeti.AnalyticNumberTheory.explicit_formula_horizontal_bound`.

For x≥2, c=1+1/log x and a height T′≥2 separated from every ξ-zero ordinate by at least c₀/log(T′+2), the two horizontal Perron integrals from Re s=−1 to c have norm at most C_(c₀) x log²(T′+2)/(T′log x).

**Construction and proof.**

1. On−1≤σ≤min(2,c), the local expansion, unit count and height separation bound |ζ′/ζ(σ±iT′)| by C_(c0)log²(T′+2).
2. If2<c, use the pinned bounded right-edge series on the additional interval[2,c]. This case occurs for2≤x<e and was not covered by the previous local-expansion prerequisite alone.
3. On the entire segment |s|≥T′ and ∫_(−1)^c x^σ dσ=(x^c−x^−1)/log x≤e x/log x. Multiply the bounds and sum the two integrals.
4. For a good height from the selection lemma, c0 is fixed absolute, making C absolute.

**Dependencies.** [`AnalyticNumberTheory:AN.3/zeta-local-log-derivative`](#zeta-local-log-derivative), [`AnalyticNumberTheory:AN.3/good-height-selection`](#good-height-selection), [`AnalyticNumberTheory:AN.2/zeta-log-derivative-right`](#zeta-log-derivative-right), [`AnalyticNumberTheory:AN.3/zeta-unit-height-zero-count`](#zeta-unit-height-zero-count).

**Acceptance.** At x=2, c>2 and the right-edge extra segment is retained. The constant depends on the separation parameter until it is fixed by good-height-selection.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem9.9 proof, horizontal segments p.57.

<a id="explicit-formula-left-contour"></a>

#### Left contour limit

`AnalyticNumberTheory:AN.3/explicit-formula-left-contour` · lemma · `TauCeti.AnalyticNumberTheory.explicit_formula_left_contour`.

For every fixed x≥2,T≥2, the Perron vertical integral at Re s=−U tends to0 as U→∞ through positive odd integers. Uniformly in x,T, the two horizontal tails Re s≤−1 have norm O(log(T+2)/(Tx log x)+1/(Tx(log x)²)), with an absolute constant.

**Construction and proof.**

1. For odd U, every point on the vertical segment remains distance≥1 from all negative-even trivial zeros. The left logarithmic-derivative bound gives norm at most C T log(2+U+T)/(U x^U), which tends to0 with x,T fixed.
2. On the two horizontal tails, |s|≥T and distance to every real trivial zero≥T≥2, so the same left bound has one absolute constant.
3. Use log(2+u+T)≤log(T+2)+u for u≥1, and integrate x^(−u) and u x^(−u) from1 to∞. Their exact values give the two displayed tail terms after absorbing1/log x in the log(T+2) term.
4. The limit is U→∞, correcting the source’s printed U→0 slip. No uniform limit over growing T is asserted.

**Dependencies.** [`AnalyticNumberTheory:AN.3/zeta-left-log-derivative`](#zeta-left-log-derivative).

**Acceptance.** The vertical-edge limit fixes T before letting U grow; its bound includes U+T. Choosing even U would cross a trivial zero and is forbidden.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Theorem9.9 proof, remaining segments p.57.

<a id="riemann-von-mangoldt-count"></a>

#### Riemann–von Mangoldt zero count

`AnalyticNumberTheory:AN.3/riemann-von-mangoldt-count` · theorem · `TauCeti.AnalyticNumberTheory.riemann_von_mangoldt_count`.

There is an absolute C>0 such that for every real T≥2, N(T)=#{ξ-zero occurrencesρ:0<Imρ≤T} satisfies |N(T)−[(T/(2π))log(T/(2π))−T/(2π)]|≤C log(T+2).

**Construction and proof.**

1. Use the argument principle for xi on a zero-avoiding rectangle symmetric about the real axis; its nonzero endpoint/strip and conjugation APIs specify the zero multiplicities.
2. Choose and track continuous argument branches for the gamma, polynomial and zeta factors; the leading gamma phase requires the full complex Stirling remainder, beyond a norm bound for digamma.
3. Bound the change of zeta argument by O(log T), with a separate Jensen/real-part-zero argument. A local zero count alone does not prove that phase bound.
4. Read the original Davenport§15 argument cited by Remark9.7 or an equivalent public proof. Match the argument principle/winding interfaces and the phase estimate before treating this as closed.
5. The source uses0<Imρ<T; passing to the inclusive cutoff changes the count by at most the unit-height O(log(T+2)) bound.

**Dependencies.** [`AnalyticNumberTheory:AN.2/riemann-xi`](#riemann-xi), [`AnalyticNumberTheory:AN.3/zeta-zero-multiset`](#zeta-zero-multiset), [`AnalyticNumberTheory:AN.3/zeta-unit-height-zero-count`](#zeta-unit-height-zero-count), [`AnalyticNumberTheory:AN.2/digamma-right-half-plane`](#digamma-right-half-plane).

**Acceptance.** N counts only positive ordinates, not both signs. The strict source cutoff and inclusive target differ by a controlled endpoint multiplicity.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Remark9.7 p.56, citing Davenport§15; original phase proof still required.

**Atlas planet.** Riemann–von Mangoldt formula.

<a id="low-zero-safe-interval-kernel"></a>

#### Low-zero-safe interval kernel

`AnalyticNumberTheory:AN.3/low-zero-safe-interval-kernel` · lemma · `TauCeti.AnalyticNumberTheory.low_zero_safe_interval_kernel`.

For every real x≥2 and complex ρ with0<Reρ<1, |(x^ρ−(x/2)^ρ)/ρ|≤2x^(Reρ)min(1,1/|ρ|). Positive-real powers use exp(ρ log x); the bound remains finite as ρ approaches0.

**Construction and proof.**

1. Since Reρ>0,ρ≠0. Integrate the derivative of t↦t^ρ on[x/2,x] to write the quotient as∫ t^(ρ−1)dt.
2. For t in that interval, t^(Reρ)≤x^(Reρ), so the integral norm is at most x^(Reρ)∫dt/t=x^(Reρ)log2.
3. The direct numerator bound is at most2x^(Reρ)/|ρ|. If |ρ|≤1 use log2≤2; if |ρ|≥1 use the second bound, yielding the explicit constant2.
4. The limit asρ→0 is log2, not a divergent reciprocal. The subtraction must precede absolute values.

**Acceptance.** Atρ→0 the quotient tends to log2. At x=2,ρ=1/2 the numerator is sqrt2−1 and the same bound holds.

**Sources.** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Bennett–Siksek §12 Proposition12.2 p.387, repaired half-interval deduction.

<a id="zero-weight-sum"></a>

#### Logarithmic-square sum of zero weights

`AnalyticNumberTheory:AN.3/zero-weight-sum` · lemma · `TauCeti.AnalyticNumberTheory.zero_weight_sum`.

There is an absolute C>0 such that for every primitive Dirichlet characterχ of conductor q≥1 and every T≥2, Σ_(nontrivial zeros |Imρ|≤T)mρ min(1,1/|ρ|)≤C log²(q(T+2)). Nontrivial means0<Reρ<1, and multiplicity is analytic order.

**Construction and proof.**

1. For a primitive nonprincipal character, invoke the new conductor-uniform local count, including |Imρ|≤1; the weight there is at most1, so an arbitrarily low exceptional zero does not introduce1/|ρ|.
2. For each unit band m≤|Imρ|<m+1 with m≥1, the weight is at most1/m and the count is at most C0 log(q(m+2)).
3. Sum C0 log(q(m+2))/m for1≤m≤ceil T; the harmonic/log-harmonic bound is O(log q log(T+2)+log²(T+2)), at most O(log²(q(T+2))).
4. The primitive principal conductor1 case is the zeta-only count from zeta-poisson-zero-weight and the same band argument.
5. The original conductor-uniform local proof remains unread; the summation deduction is explicit and does not license the false unweighted1/|ρ| estimate at tiny zeros.

**Dependencies.** [`AnalyticNumberTheory:AN.3/primitive-character-unit-height-zero-count`](#primitive-character-unit-height-zero-count), [`AnalyticNumberTheory:AN.3/zeta-poisson-zero-weight`](#zeta-poisson-zero-weight).

**Acceptance.** A real zero of arbitrarily small positive modulus contributes at most its multiplicity. The absolute constant is uniform in q,χ,T, including the conductor1 principal case.

**Sources.** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Bennett–Siksek §12 Proposition12.2 p.387; Kedlaya Lemma10.3 p.60.

<a id="character-half-interval-formula"></a>

#### Half-interval explicit formula and low-zero-safe bound

`AnalyticNumberTheory:AN.3/character-half-interval-formula` · theorem · `TauCeti.AnalyticNumberTheory.character_half_interval_formula`.

There are absolute C>0 and k₀≥2 such that for every primitive nonprincipal Dirichlet characterχ of conductor q, integer k≥k₀ and real2≤T≤k, Σ_(k/2<m≤k)χ(m)Λ(m)=−Σ_(nontrivial zeros |Imρ|≤T)mρ(k^ρ−(k/2)^ρ)/ρ+E, with |E|≤C[k log²(qk)/T+log²(qk)]. Endpoint sums are over positive integers; powers use exp(ρ log x).

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Establish the primitive conductor-uniform finite-height explicit formula, with its exact near-zero parity term and safe-height adjustment. KedlayaTheorem10.2 cites Davenport§19; this original proof remains required.
2. Subtract the formulas at k and k/2 before taking absolute values. The character constant b(χ) cancels, and the even-character logarithm difference is a bounded log2 term after using the corrected parity convention.
3. For integer k both endpoints have nearest-other-prime-power distance at least1/2. Apply the two finite Perron remainder bounds; since T≤k,log(qkT)≤2log(qk).
4. Convert endpoint half weights to the unweighted(k/2,k] sum at cost O(log k). Adjust a safe strict cutoff to the stated inclusive |Imρ|≤T using the conductor-uniform local count and the low-zero-safe kernel.
5. Apply the bounded-weight zero sum to consumers requiring an absolute bound. Imprimitive characters require separate deleted local Euler factors and are not included in this signature.

**Dependencies.** [`AnalyticNumberTheory:AN.3/low-zero-safe-interval-kernel`](#low-zero-safe-interval-kernel), [`AnalyticNumberTheory:AN.3/zero-weight-sum`](#zero-weight-sum), [`AnalyticNumberTheory:AN.3/primitive-character-unit-height-zero-count`](#primitive-character-unit-height-zero-count), `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation`.

**Acceptance.** For odd k, k/2 is a half integer; for even k both integer endpoint corrections are included. The constant is independent of q,k,T; nonprincipal and primitive are actual hypotheses. An arbitrarily small real zero has a bounded half-interval kernel; no absolute1/|ρ| bound is assumed.

**Sources.** [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf), Bennett–Siksek §12 Proposition12.2 p.387; Kedlaya §§10.1–10.2 pp.59–60, parity corrected E8; [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §10.2 Lemma10.3 p.60, uniform local count used in the explicit-formula route.

<a id="zeta-poisson-zero-weight"></a>

#### Uniform reciprocal-square zero weight

`AnalyticNumberTheory:AN.3/zeta-poisson-zero-weight` · lemma · `TauCeti.AnalyticNumberTheory.zeta_poisson_zero_weight`.

There is an absolute C>0 such that for every real t, Σ_(ξ(ρ)=0)mρ/(1+(t−Imρ)²) is summable and at most C log(2+|t|), with mρ=analyticOrderNatAt ξρ.

**Construction and proof.**

1. Evaluate the corrected Hadamard log derivative at s=2+it; the right-edge zeta series is bounded and the gamma term is O(log(2+|t|)), using compact continuity to include bounded t.
2. Write a=2−Reρ∈(1,2). Then Re(1/(2+it−ρ))=a/(a²+(t−Imρ)²)≥1/(4(1+(t−Imρ)²)). Also Re(1/ρ)>0.
3. The real parts of finite regularized sums are nonnegative. Their convergent limit therefore bounds the weighted positive sum; the same finite-sum comparison proves summability. Fixed Re B contributes only an absolute constant.
4. Absorb bounded t into log(2+|t|), which is always at least log2. This is the missing Exercise8.4.9 argument rather than an assumed Jensen centre bound.

**Dependencies.** [`AnalyticNumberTheory:AN.2/zeta-hadamard-log-derivative`](#zeta-hadamard-log-derivative), [`AnalyticNumberTheory:AN.2/zeta-log-derivative-right`](#zeta-log-derivative-right), [`AnalyticNumberTheory:AN.2/digamma-right-half-plane`](#digamma-right-half-plane), [`AnalyticNumberTheory:AN.2/xi-zero-critical-strip`](#xi-zero-critical-strip), `mathlib:Complex.differentiableAt_Gamma`.

**Acceptance.** For |Imρ−t|≤1 each weight is at least1/2, including both endpoints. The sum is over occurrences or analytic-order weights, not distinct zeros counted once.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Exercise8.4.9 p.52; Lemma9.4 and Exercise9.6.1 pp.54,58.

<a id="zeta-trivial-zero-simple"></a>

#### Trivial zeta zeros are simple

`AnalyticNumberTheory:AN.3/zeta-trivial-zero-simple` · lemma · `TauCeti.AnalyticNumberTheory.zeta_trivial_zero_simple`.

For every natural n≥1, analyticOrderNatAt riemannZeta(−2n)=1.

**Construction and proof.**

1. Apply pinned riemannZeta_one_sub at s=1+2n, which lies in the zero-free right half-plane.
2. The factors2,(2π)^(-s),Gamma(s),zeta(s) are analytic and nonzero near that point. cos(πs/2) has a simple zero at the odd integer, with nonzero sine derivative.
3. The change of variable s↦1−s has nonzero derivative, so the analytic order at−2n is1. No claim about a totalized gamma pole is used.

**Dependencies.** `mathlib:riemannZeta_one_sub`, `mathlib:riemannZeta_ne_zero_of_one_le_re`, `mathlib:Complex.Gamma_ne_zero_of_re_pos`, `mathlib:Complex.differentiableAt_Gamma`, `mathlib:analyticOrderNatAt`.

**Acceptance.** At n=1 the order at−2 is1, not only a proof that zeta(−2)=0. The n=0 case is excluded: zeta(0)=−1/2.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Remark5.2 p.35; Lemma9.2 p.54, trivial-zero residues.

<a id="primitive-character-unit-height-zero-count"></a>

#### Conductor-uniform local Dirichlet zero count

`AnalyticNumberTheory:AN.3/primitive-character-unit-height-zero-count` · lemma · `TauCeti.AnalyticNumberTheory.primitive_character_unit_height_zero_count`.

There is an absolute C>0 such that for every primitive nonprincipal Dirichlet character χ of conductor q≥1 and every real u, the nontrivial L-zero occurrences with u≤Imρ≤u+1 number at most C log(q(2+|u|)).

**Construction and proof.**

1. Use the pinned primitive completed L-function and its functional equation, retaining parity and conductor factor; gamma factors are nonzero on the open critical strip.
2. A local Jensen/product argument must supply both a centre lower bound at2+iu and a relative disk growth bound with absolute constants and the explicit q power.
3. Read the original proof behind Lemma10.3 (Davenport§16) or an equivalent public proof; neither the gamma continuation API nor the zeta-only weight lemma supplies this conductor-uniform bound.
4. Handle |u|≤2 with the same q-dependent compact count. Character inversion/conjugation is needed when reflecting signs; do not assume a complex character has its own conjugate-zero symmetry.

**Dependencies.** `mathlib:DirichletCharacter.differentiable_completedLFunction`, `mathlib:DirichletCharacter.IsPrimitive.completedLFunction_one_sub`.

**Acceptance.** The constant is independent of q,χ,u and includes u=0. One low exceptional real zero contributes its multiplicity but introduces no1/|ρ| weight here.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §10.2 Lemma10.3 p.60, referring to Davenport§16.

### Density, mean values and cancellation

<a id="selberg-zero-density"></a>

#### Selberg zero-density input

`AnalyticNumberTheory:AN.3/selberg-zero-density` · theorem · `TauCeti.AnalyticNumberTheory.selberg_zero_density`.

For epsilon>0, Q>=2, T>=2, and 1/2<=sigma<=1, sum_{q<=Q} sum_{chi primitive mod q} N(sigma,T,chi) <<_epsilon (Q^(5+epsilon)*T^(3+epsilon))^(1-sigma), with effective constants with the right-hand side enlarged by +1, so the count includes the exceptional zero.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use the primitive-character counting function and the stated effective density theorem.
2. Include +1 if the original theorem excludes the exceptional zero; the chosen target below always includes it.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: A conjecture of Erdős, supersingular primes and short character sums](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-BENNETT-SIKSEK-20.result.json), §12 proof of Proposition 12.1, p. 386; Bombieri §5 remark after Theorem 14, p.40.

<a id="eisenstein-weyl-lvalue-bound"></a>

#### Eisenstein Weyl sums bounded by Dirichlet L-values

`AnalyticNumberTheory:AN.3/eisenstein-weyl-lvalue-bound` · theorem · `TauCeti.AnalyticNumberTheory.eisenstein_weyl_lvalue_bound`.

There is an absolute C > 0 such that, for every ε > 0, every fundamental D = d'd with genus character χ, and every s with Re(s) = 1/2: Weyl(E(·,s),χ) ≪_ε |s|^C |L(s,χ_{d'})L(s,χ_d)| |D|^{1/4+ε}. The paper prints the left side as 'Weyl(s,χ)'.

**Hypotheses.** d,d′ are coprime fundamental discriminants with fundamental product D≠1, and s=1/2+it for t∈ℝ. Weyl is the three-branch class sum of DIT (5.12): twice the core-area integral for negative factors, the boundary arc-length integral over ∂F_A for positive factors (compared separately to C_A), and the CM point sum weighted by 1/ω_D for mixed signs. All branches retain the genus character and multiplicities. The implied constant depends only on ε; the height exponent C is absolute.

**Construction and proof.**

1. Apply the appropriate one of the three genus-period identities.
2. Use the precise gamma quotient and reciprocal-zeta bounds; polynomial height factors and |D|^(1/4+ε) remain visible.

**Dependencies.** [`AnalyticNumberTheory:AN.4/negative-genus-core-period`](#negative-genus-core-period), [`AnalyticNumberTheory:AN.4/positive-genus-geodesic-period`](#positive-genus-geodesic-period), [`AnalyticNumberTheory:AN.4/mixed-genus-cm-period`](#mixed-genus-cm-period), `AutomorphicSpectralTheory:AS.1`, [`AnalyticNumberTheory:AN.3/critical-line-gamma-quotient`](#critical-line-gamma-quotient), [`AnalyticNumberTheory:AN.3/reciprocal-zeta-line-one`](#reciprocal-zeta-line-one), `AutomorphicSpectralTheory:AS.2`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: Geometric invariants for real quadratic fields](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json), (6.7), proof of Proposition 2, p.969; [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), (6.7), proof of Proposition 2, p.969.

<a id="critical-line-gamma-quotient"></a>

#### Standard gamma-quotient and 1/ζ(1+2it) estimates (black box)

`AnalyticNumberTheory:AN.3/critical-line-gamma-quotient` · theorem · `TauCeti.AnalyticNumberTheory.critical_line_gamma_quotient`.

For s=1/2+it, t real and α,β∈{0,1}, |Γ((s+α)/2)Γ((s+β)/2)/Γ(s)|≤C|s|^(1/2), with one absolute C.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Apply the uniform complex Stirling estimate on the three gamma factors, with bounded-height continuity separately.
2. The exponential factors cancel on s=1/2+it; the remaining power is bounded by |s|^(1/2).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: Geometric invariants for real quadratic fields](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json), Proof of Proposition 2, p.969 ('standard estimates for the gamma function quotient and for ζ(2s)'); [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Proof of Proposition2, printed p.969, sentence preceding (6.7).

<a id="davenport-mobius-cancellation"></a>

#### Davenport uniform Möbius exponential cancellation

`AnalyticNumberTheory:AN.3/davenport-mobius-cancellation` · theorem · `TauCeti.AnalyticNumberTheory.davenport_mobius_cancellation`.

For every A>0 there is C_A such that for y≥2, sup_{α∈ℝ}|Σ_{1≤r≤y}μ(r)e^{ir α}|≤C_A y(log y)^{−A}. Original proof input [22] or [39,Thm 13.10] still requires full source extraction.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use Davenport’s original uniform exponential-sum theorem; α ranges over all real values.
2. Retain arbitrary logarithmic power A and y≥2.

**Dependencies.** `mathlib:ArithmeticFunction.moebius`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), Lemma3.2 and proof reference, published p.690.

<a id="positive-truncation-error-cancellation"></a>

#### Uniform cancellation of the truncation error E_z (Corollary 3.3)

`AnalyticNumberTheory:AN.3/positive-truncation-error-cancellation` · theorem · `TauCeti.AnalyticNumberTheory.positive_truncation_error_cancellation`.

For A>0 and y,z≥2, sup_{α∈R}|Σ_{1≤r≤y}E_z(r)e^(irα)|≤C_A y(log y)(log z)^−A.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Apply the source positive-integer Fourier argument using Davenport cancellation and the finite cutoff.
2. Keep y,z≥2 so no negative power of log1 occurs.

**Dependencies.** [`AnalyticNumberTheory:AN.5/mangoldt-truncation-error`](#mangoldt-truncation-error), [`AnalyticNumberTheory:AN.3/davenport-mobius-cancellation`](#davenport-mobius-cancellation).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), Corollary3.3 and proof reference, published p.691.

<a id="two-sided-truncation-error"></a>

#### Two-sided error and the zero term

`AnalyticNumberTheory:AN.3/two-sided-truncation-error` · lemma · `TauCeti.AnalyticNumberTheory.two_sided_truncation_error`.

For y,z≥2 and A>0 the two-sided sum Σ_{|r|≤y}E_z(r)e^(irα) has absolute value ≤2C_A y(log y)(log z)^−A+|E_z(0)|. The zero term is bounded separately by O_A(z(log z)^−A).

**Construction and proof.**

1. Pair the positive and negative summands using evenness; apply the positive estimate to α and −α.
2. Use Möbius cancellation and partial summation for the finite zero sum.

**Dependencies.** [`AnalyticNumberTheory:AN.3/positive-truncation-error-cancellation`](#positive-truncation-error-cancellation), [`AnalyticNumberTheory:AN.5/mangoldt-truncation-error`](#mangoldt-truncation-error), [`AnalyticNumberTheory:AN.3/davenport-mobius-cancellation`](#davenport-mobius-cancellation), `mathlib:sum_mul_eq_sub_sub_integral_mul`.

**Acceptance.** At z=2 the separate zero term is −log2, so omitting it gives an incorrect two-sided identity. For each real α, use two positive estimates at α and −α; do not replace a general complex exponential sum by twice itself.

**Sources.** [Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), §3.1 definitions and Corollary3.3, published p.691.

<a id="ray-class-zero-density"></a>

#### Ray-class L-function zero-density estimate

`AnalyticNumberTheory:AN.3/ray-class-zero-density` · theorem · `TauCeti.AnalyticNumberTheory.ray_class_zero_density`.

There is c = c([k : ℚ]) > 0 such that for Q, T > 1, 1/2 ≤ σ < 1 and ε > 0, Σ_{Nm 𝔮≤Q}Σ*_{χ mod 𝔮}N_χ(σ, T) ≪_{[k:ℚ],ε} (Disc(k)QT)^{c(1−σ)+ε}, the inner sum over primitive ray class characters of conductor 𝔮 and N_χ(σ, T) counting zeros with ℜρ ∈ (σ, 1), |ℑρ| ≤ T.

**Hypotheses.** k is a number field of fixed degree n; D_k is its absolute discriminant; Q,T>1; 1/2≤σ<1; ε>0. Count nontrivial zeros with analytic multiplicity and strict σ<Reρ<1, inclusive |Imρ|≤T. Sum once over each primitive finite-order ray class character of exact conductor ideal𝔮, including its infinity component.

**Construction and proof.**

1. Use the canonical finite-order ray-class/Hecke carrier and its continued L-function; form a locally finite zero multiset with analytic multiplicities, rather than an unweighted set of zero locations.
2. Specialize the original family-density theorem to the trivial GL1 base representation and retain the ε exponent. The degree dependence and full character/conductor family must match LOW Theorem4.2. The original Pasten appendix/Thorner–Zaman proof and zero-multiset construction remain gaps.

**Dependencies.** [`AnalyticNumberTheory:AN.4/hecke-primitive-functional-equation`](#hecke-primitive-functional-equation), [`AnalyticNumberTheory:AN.4/hecke-nonvanishing-on-line-one`](#hecke-nonvanishing-on-line-one).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: The average size of 3-torsion in class groups of 2-extensions](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-LEMKEOLIVER-WANG-WOOD-25.result.json), Theorem 4.2, p.20, citing Lemke Oliver–Thorner [Pas17, Proposition A.2] and Thorner–Zaman [TZ21, Theorem 1.2], Forum Math. Pi 13 (2025), e19; [The average size of 3-torsion in class groups of 2-extensions](https://doi.org/10.1017/S2050508625000009), §4, Theorem4.2, printed p.20.

<a id="dirichlet-polynomial-mean-square"></a>

#### Mean square of a Dirichlet polynomial

`AnalyticNumberTheory:AN.3/dirichlet-polynomial-mean-square` · theorem · `TauCeti.AnalyticNumberTheory.dirichlet_polynomial_mean_square`.

For N≥1,T≥1 and complex a₁,…,a_N, ∫_{−T}^T|Σ_{n=1}^N a_n n^(−it)|²dt=2TΣ|a_n|²+O(Σn|a_n|²), with an absolute constant.

**Construction and proof.**

1. Integrate the diagonal exactly.
2. Bound the off-diagonal bilinear form by the logarithmic-frequency Hilbert inequality; the spacing at n is comparable to1/n.

**Acceptance.** All source-proof and normalization gaps remain open; the displayed bound/signature is a target rather than a freshly verified theorem. Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [A new proof of Halász’s theorem, and its consequences](https://arxiv.org/pdf/1706.03749v1), §2.3 Lemma2.6 uses a specialized mean-square bound; original general theorem required.

**Atlas planet.** Dirichlet polynomial mean values.

## AN.4 — Hecke, Dedekind and Artin arithmetic interfaces

### Artin factors and uniform CM estimates

<a id="artin-local-polynomial"></a>

#### Artin local polynomial

`AnalyticNumberTheory:AN.4/artin-local-polynomial` · definition · `TauCeti.AnalyticNumberTheory.artin_local_polynomial`.

For a finite Galois extension L/K, a finite-dimensional complex representation ρ of G=Gal(L/K), and a nonzero prime ideal p of K, choose P above p, its decomposition/inertia groups D_P,I_P and arithmetic Frobenius in D_P/I_P. On V^(I_P), Frobenius acts canonically. Define P_p(T)=det(1−T·Frob_P|V^(I_P)) in C[T]. The determinant is independent of P and of a Frobenius lift.

**Construction and proof.**

1. Use the actual representation of L≃ₐ[K]L, restrict it to the ideal inertia subgroup, and form Representation.invariants. The pinned existence theorem supplies an arithmetic Frobenius lift even at ramified primes. Restrict that lift to invariants; its reversed characteristic polynomial is det(1−T·F).
2. Restrict the existing Representation C G V to I_P and use its invariants submodule; I_P is normal in D_P, so each decomposition-group element preserves that subspace.
3. Any two arithmetic Frobenius lifts differ by inertia by pinned IsArithFrobAt.mul_inv_mem_inertia, so their restrictions to V^I agree. Changing P conjugates both I and Frobenius; transport vectors through ρ(g) and apply LinearEquiv.charpoly_conj.
4. For the induced invariant-space automorphism A, define the polynomial as A.charpoly.reverse. Matrix.reverse_charpoly identifies it with det(1−T A) in any basis. Invertibility gives degree exactly dim V^I; finite order forces all eigenvalues and reciprocal polynomial roots onto the unit circle.
5. The carrier uses the prime-relative Frobenius coset, including ramified primes. NFA2 artinSymbol alone is available only at unramified primes and cannot define this full polynomial.

**Dependencies.** `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-2-frobenius-elements-and-the-artin-symbol`, `mathlib:Representation.invariants`, `mathlib:Representation.mem_invariants`, `mathlib:IsArithFrobAt.mul_inv_mem_inertia`, `mathlib:IsArithFrobAt.conj`, `mathlib:LinearEquiv.charpoly_conj`, `mathlib:Matrix.charpolyRev`, `mathlib:Matrix.reverse_charpoly`, `tauceti:NumberField.exists_isArithFrobAt`.

**API.**

- `artin_local_polynomial.independence` (compatibility): Changing P conjugates the invariant-space endomorphism and leaves P_p unchanged.
- `artin_local_polynomial.constant` (simp): P_p(0)=1.
- `artin_local_polynomial.unramified` (compatibility): For unramified p, P_p(T)=det(1−Tρ(Frob_p)) on all of V.
- `artin_local_polynomial.degree` (projection): natDegree P_p=dim_C(V^I)≤dim_C V; the Frobenius endomorphism on V^I has eigenvalues of modulus1 and every root of P_p has modulus1. The degree-zero polynomial1 has no roots.
- `artin_local_polynomial.basis` (extensionality): Changing the finite-dimensional basis does not change the polynomial.

**Unit tests.**

- `artin_local_polynomial.trivial` (computation): For the one-dimensional trivial representation, P_p=1−T at every prime.
- `artin_local_polynomial.zero` (computation): For the zero representation, P_p=1.
- `artin_local_polynomial.ramified_character` (computation): For a one-dimensional character nontrivial on inertia, V^I=0 and P_p=1; using the whole V would give a wrong factor.

**Acceptance.** For the one-dimensional trivial representation, P_p=1−T at every prime. For the zero representation, P_p=1. For a one-dimensional character nontrivial on inertia, V^I=0 and P_p=1; using the whole V would give a wrong factor.

**Uses.** `AnalyticNumberTheory:AN.4/artin-induction-versus-artin-holomorphy`: Reinstate ramified factors before identifying Artin and Hecke products.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.2 p.128 ramified-prime paragraph.

<a id="artin-euler-series"></a>

#### Artin Euler series

`AnalyticNumberTheory:AN.4/artin-euler-series` · definition · `TauCeti.AnalyticNumberTheory.artin_euler_series`.

For the preceding data and Re s>1, L_K(s,ρ)=∏_p P_p((Np)^−s)^−1, over all nonzero prime ideals of K, with complex powers using the positive real norm logarithm. Coefficients are the norm-regrouped reciprocal local-polynomial coefficients, not a completely multiplicative degree-one ideal weight.

**Construction and proof.**

1. For each prime polynomial P(T) with P(0)=1, recursively determine reciprocal coefficients a_0=1 and a_(n+1)=−Σ_(j=0)^n P_(j+1)a_(n−j). Unique ideal factorization extends these to the canonical multiplicative nonzero-ideal weight. Its normCoeff LSeries is the series compared with the all-prime unordered Euler product.
2. Expand each reciprocal local polynomial as the formal product of m geometric series, where m=dim V^I≤d. Assign these prime-power coefficients multiplicatively to the existing ideal arithmetic-function carrier; do not assert complete multiplicativity.
3. The absolute coefficient sum at a prime is bounded by (1−(Np)^−σ)^−d. Finite ideal-factorization products therefore admit the d-fold Dedekind-series majorant; prove the ideal-indexed absolute convergence in the artin absolute convergence target before identifying the norm-regrouped LSeries.
4. Use ADS1 regroupByNorm and ADS3 EulerProductData to compare the single canonical coefficient LSeries and the unordered prime product on Re s>1. The trivial representation recovers the full Dedekind series, including every ramified prime; the zero representation is the constant1.

**Dependencies.** [`AnalyticNumberTheory:AN.4/artin-local-polynomial`](#artin-local-polynomial), `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-1-norm-fibres-and-mathlib-lseries`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products`.

**API.**

- `artin_euler_series.local` (projection): Every local factor is the reciprocal of the inertia-invariant polynomial.
- `artin_euler_series.series` (compatibility): The absolutely convergent Euler product equals the norm-regrouped coefficient LSeries on Re s>1.
- `artin_euler_series.nonzero` (projection): The convergent Euler product is nonzero on Re s>1.
- `artin_euler_series.direct_sum` (relation): The direct-sum identity is exported by the separate lemma below.
- `artin_euler_series.deleted` (compatibility): Omitting a finite bad-prime set multiplies L_K by exactly ∏_{p bad}P_p((Np)^−s).

**Unit tests.**

- `artin_euler_series.trivial` (computation): The one-dimensional trivial representation gives the convergent Dedekind series, including ramified primes.
- `artin_euler_series.zero` (computation): The zero representation gives1.
- `artin_euler_series.ramified` (computation): A one-dimensional character ramified at p contributes local factor1 there.

**Acceptance.** The one-dimensional trivial representation gives the convergent Dedekind series, including ramified primes. The zero representation gives1. A one-dimensional character ramified at p contributes local factor1 there.

**Uses.** `AnalyticNumberTheory:AN.4/artin-induction-versus-artin-holomorphy`: Apply induction to one canonical Euler product with all local factors.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.2 pp.127–128 incomplete Euler product and ramified-factor prescription.

**Atlas planet.** Artin L-functions.

<a id="artin-induction-versus-artin-holomorphy"></a>

#### Artin continuation near the line one

`AnalyticNumberTheory:AN.4/artin-induction-versus-artin-holomorphy` · theorem · `TauCeti.AnalyticNumberTheory.artin_induction_versus_artin_holomorphy`.

Let K/ℚ be finite Galois and ρ a finite-dimensional complex representation of Gal(K/ℚ). The incomplete Artin L-function, with precisely the ramified rational primes omitted, has a meromorphic continuation to an open neighbourhood of {Re(s)≥1}; it is holomorphic and nonzero on Re(s)=1 away from s=1, and its pole order at 1 is dim(V^G). This statement asserts neither global Artin holomorphy nor Chebotarev density.

**Hypotheses.** Finite Galois K/ℚ; finite-dimensional complex representation; arithmetic Frobenius at unramified primes; omitted-prime set fixed.

**Construction and proof.**

1. Import arithmetic Frobenius and conjugacy independence from NumberFieldArithmetic Layer2. AN.4 must supply determinant Euler factors and direct-sum/induction identities.
2. Import finite-group Artin rational induction; after clearing denominators express an m-fold representation as a virtual sum of induced one-dimensional characters.
3. Use ClassFieldTheory Layer 11 and GlobalNumberFields Layer 9 to identify one-dimensional factors with finite-order Hecke characters; their continuation is AN.4/hecke-primitive-functional-equation and their boundary nonvanishing, with the pole at 1 of the trivial character, is AN.4/hecke-nonvanishing-on-line-one.
4. On small discs about points of the line, take the m-th root agreeing with the Euler product on Re s > 1 and glue (AN.4/mth-root-gluing).
5. Separate the trivial summand to compute the pole order. Brauer integral induction can prove global meromorphy, whereas absence of extra poles is Artin holomorphy; the rational-root route here does not prove the global assertion.

**Dependencies.** [`AnalyticNumberTheory:AN.4/hecke-nonvanishing-on-line-one`](#hecke-nonvanishing-on-line-one), [`AnalyticNumberTheory:AN.4/mth-root-gluing`](#mth-root-gluing), [`AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`](#dedekind-zeta-continuation-and-residue), `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-2-frobenius-elements-and-the-artin-symbol`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`, [`AnalyticNumberTheory:AN.4/artin-direct-sum-factor`](#artin-direct-sum-factor), [`AnalyticNumberTheory:AN.4/artin-induction-factor`](#artin-induction-factor), [`AnalyticNumberTheory:AN.4/artin-linear-hecke-comparison`](#artin-linear-hecke-comparison).

**Acceptance.** For the trivial representation recover ζ times the omitted local factors and a simple pole at1. For a nontrivial one-dimensional character recover the Hecke near-line result. At ramified primes the complete local factor would act on inertia invariants; an arbitrary Frobenius lift on the whole representation is invalid. No natural-density conclusion is included; that theorem belongs to Chebotarev.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), Chapter22, §§22.2–22.5, Theorems22.3–22.4, printed pp.128–129.

**Atlas planet.** Artin boundary continuation.

<a id="artin-conductor-bound"></a>

#### Sufficient conductor-discriminant estimate

`AnalyticNumberTheory:AN.4/artin-conductor-bound` · theorem · `TauCeti.AnalyticNumberTheory.artin_conductor_bound`.

Fix g≥1. Let E be any degree2g CM field, L its normal closure over Q (not an arbitrary Galois overfield), G=Gal(L/Q), and c the central complex conjugation. Let F(E) be the finite set of isomorphism classes of nontrivial irreducible complex G-representations ρ satisfying ρ(c)=−Id. Then |G|≤M_g=(2g)!, |F(E)|≤M_g and dim ρ≤M_g. All constants below are uniform in E and ρ∈F(E). The CM owner proves that the nontrivial factors in the averaged Colmez expression belong to this family and that their rational coefficients have absolute value≤B_g; the trivial factor is separated before evaluation at1. Use the canonical positive Artin conductor f_ρ, formed from the lower-ramification codimensions of inertia invariants; it is not a ray modulus or an arbitrary positive parameter. There exists C_g>0 such that log f_ρ≤C_g(1+log D_E).

**Hypotheses.** E is CM of degree2g; L is its normal closure; ρ is a nontrivial odd irreducible representation. The general Artin-conductor supplier and its conductor–discriminant comparison are exact ownership requests, not existing NumberFieldArithmetic exports.

**Construction and proof.**

1. Import general Artin-conductor integrality and the conductor–discriminant formula from the proposed ArtinRepresentations supplier. NumberFieldArithmetic owns the actual lower-ramification filtration and permutation discriminant formula, not this identification.
2. Combine the finite-group dimension bound with a degree-dependent comparison D_L≤D_E^A_g. The printed stronger f_ρ≤D_E is not needed. The original comparison proof remains recorded in the arithmetic supplier gap.

**Dependencies.** `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-7-subfields-integral-bases-monogenicity-and-explicit-units`, `mathlib:Representation.IsIrreducible`, `mathlib:NumberField.IsCMField.complexConj`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: The Andre-Oort conjecture for A_g](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-TSIMERMAN-18.result.json), Proof of Corollary 3.3, p. 384; [The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Theorem3.2 and proof of Corollary3.3, printed pp.383–384.

<a id="artin-log-functional-equation"></a>

#### Logarithmic functional equation

`AnalyticNumberTheory:AN.4/artin-log-functional-equation` · theorem · `TauCeti.AnalyticNumberTheory.artin_log_functional_equation`.

Fix g≥1. Let E be any degree2g CM field, L its normal closure over Q (not an arbitrary Galois overfield), G=Gal(L/Q), and c the central complex conjugation. Let F(E) be the finite set of isomorphism classes of nontrivial irreducible complex G-representations ρ satisfying ρ(c)=−Id. Then |G|≤M_g=(2g)!, |F(E)|≤M_g and dim ρ≤M_g. All constants below are uniform in E and ρ∈F(E). The CM owner proves that the nontrivial factors in the averaged Colmez expression belong to this family and that their rational coefficients have absolute value≤B_g; the trivial factor is separated before evaluation at1. Use the canonical positive Artin conductor f_ρ, formed from the lower-ramification codimensions of inertia invariants; it is not a ray modulus or an arbitrary positive parameter. Write Γ_R(s)=π^(−s/2)Γ(s/2), d=dimρ and Λ_ρ(s)=f_ρ^(s/2)Γ_R(s+1)^d L(s,ρ). Import Λ_ρ(s)=w_ρΛ_(ρ̄)(1−s), |w_ρ|=1. Odd parity makes the gamma factors finite and nonzero at0 and1; boundary nonvanishing and the equation make L_ρ(0), L_(ρ̄)(1) finite and nonzero. Then L′_ρ(0)/L_ρ(0)+L′_(ρ̄)(1)/L_(ρ̄)(1)=−log f_ρ−d((Γ_R′/Γ_R)(1)+(Γ_R′/Γ_R)(2)). A general even factor would instead require a regularized derivative at0.

**Hypotheses.** Same CM normal-closure/odd-irreducible family as the conductor bound. Continuation agrees with the genuine all-prime Artin Euler series on Re s>1. Nonzero endpoint germs and conjugation are part of the contract.

**Construction and proof.**

1. Use integral Brauer induction and finite-order Hecke functional equations to obtain the completed Artin equation with arithmetic conductor and odd infinity type. This supplier identity is still an exact gap.
2. After verifying analytic nonzero endpoints, differentiate the local completed identity. The suggested calculus adapter states this identity exactly and keeps the conductor comparison as a distinct arithmetic input.

**Dependencies.** [`AnalyticNumberTheory:AN.4/artin-conductor-bound`](#artin-conductor-bound), [`AnalyticNumberTheory:AN.4/artin-induction-versus-artin-holomorphy`](#artin-induction-versus-artin-holomorphy), [`AnalyticNumberTheory:AN.4/artin-linear-hecke-comparison`](#artin-linear-hecke-comparison), `mathlib:Complex.Gammaℝ`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: The Andre-Oort conjecture for A_g](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-TSIMERMAN-18.result.json), Proof of Corollary 3.3, p. 384; [The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Theorem3.2 and proof of Corollary3.3, printed pp.383–384.

<a id="artin-value-one-subpower"></a>

#### Two-sided subpolynomial values at one

`AnalyticNumberTheory:AN.4/artin-value-one-subpower` · theorem · `TauCeti.AnalyticNumberTheory.artin_value_one_subpower`.

Fix g≥1. Let E be any degree2g CM field, L its normal closure over Q (not an arbitrary Galois overfield), G=Gal(L/Q), and c the central complex conjugation. Let F(E) be the finite set of isomorphism classes of nontrivial irreducible complex G-representations ρ satisfying ρ(c)=−Id. Then |G|≤M_g=(2g)!, |F(E)|≤M_g and dim ρ≤M_g. All constants below are uniform in E and ρ∈F(E). The CM owner proves that the nontrivial factors in the averaged Colmez expression belong to this family and that their rational coefficients have absolute value≤B_g; the trivial factor is separated before evaluation at1. For each ρ∈F(E), import an integral monomial Brauer expression χ_ρ=Σ_(j∈J)n_j Ind_(H_j)^G ψ_j with one-dimensional finite-order ψ_j, Σ_j|n_j|≤B_g, |J|≤B_g and [L^(H_j):Q]≤M_g. Bound each Hecke analytic conductor (including the base-field discriminant) by D_E^C_g, with D_E=|Disc(E)|. For δ_j=1 if ψ_j is trivial and0 otherwise, take the holomorphic, nonzero extension H_j(s) of (s−1)^δ_j L(s,ψ_j) at1. Prove Σ_j n_jδ_j=0 and the local germ identity L(s,ρ)=∏_j H_j(s)^n_j. For every ε>0 there is C_(g,ε)>0 such that |L(1,ρ)|≤C_(g,ε)D_E^ε and |L(1,ρ)|⁻¹≤C_(g,ε)D_E^ε. The constants may be ineffective. Continued L-functions are required to match the all-prime Euler series on Re s>1 and be analytic, nonzero at1.

**Hypotheses.** Same finite family; no general Artin-holomorphy assumption. Import fixed-degree regularized Hecke endpoint bounds in both directions, including positive residues of trivial factors; the exact source-proof obligation is retained.

**Construction and proof.**

1. For each ρ∈F(E), import an integral monomial Brauer expression χ_ρ=Σ_(j∈J)n_j Ind_(H_j)^G ψ_j with one-dimensional finite-order ψ_j, Σ_j|n_j|≤B_g, |J|≤B_g and [L^(H_j):Q]≤M_g. Bound each Hecke analytic conductor (including the base-field discriminant) by D_E^C_g, with D_E=|Disc(E)|. For δ_j=1 if ψ_j is trivial and0 otherwise, take the holomorphic, nonzero extension H_j(s) of (s−1)^δ_j L(s,ψ_j) at1. Prove Σ_j n_jδ_j=0 and the local germ identity L(s,ρ)=∏_j H_j(s)^n_j.
2. Use fixed-degree subpower upper and reciprocal bounds for the regularized Hecke values. Apply them with exponent ε/(C_g B_g), then the finite signed product gives both inequalities. No absolute value of a separate trivial pole is used.

**Dependencies.** [`AnalyticNumberTheory:AN.4/artin-euler-series`](#artin-euler-series), [`AnalyticNumberTheory:AN.4/artin-induction-factor`](#artin-induction-factor), [`AnalyticNumberTheory:AN.4/artin-linear-hecke-comparison`](#artin-linear-hecke-comparison), [`AnalyticNumberTheory:AN.4/hecke-nonvanishing-on-line-one`](#hecke-nonvanishing-on-line-one), [`AnalyticNumberTheory:AN.4/artin-conductor-bound`](#artin-conductor-bound), `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: The Andre-Oort conjecture for A_g](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-TSIMERMAN-18.result.json), Proof of Corollary 3.3, p. 384; [The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Theorem3.2 and proof of Corollary3.3, printed pp.383–384.

<a id="artin-log-derivative-one"></a>

#### Factorwise logarithmic derivative at one

`AnalyticNumberTheory:AN.4/artin-log-derivative-one` · theorem · `TauCeti.AnalyticNumberTheory.artin_log_derivative_one`.

Fix g≥1. Let E be any degree2g CM field, L its normal closure over Q (not an arbitrary Galois overfield), G=Gal(L/Q), and c the central complex conjugation. Let F(E) be the finite set of isomorphism classes of nontrivial irreducible complex G-representations ρ satisfying ρ(c)=−Id. Then |G|≤M_g=(2g)!, |F(E)|≤M_g and dim ρ≤M_g. All constants below are uniform in E and ρ∈F(E). The CM owner proves that the nontrivial factors in the averaged Colmez expression belong to this family and that their rational coefficients have absolute value≤B_g; the trivial factor is separated before evaluation at1. For each ρ∈F(E), import an integral monomial Brauer expression χ_ρ=Σ_(j∈J)n_j Ind_(H_j)^G ψ_j with one-dimensional finite-order ψ_j, Σ_j|n_j|≤B_g, |J|≤B_g and [L^(H_j):Q]≤M_g. Bound each Hecke analytic conductor (including the base-field discriminant) by D_E^C_g, with D_E=|Disc(E)|. For δ_j=1 if ψ_j is trivial and0 otherwise, take the holomorphic, nonzero extension H_j(s) of (s−1)^δ_j L(s,ψ_j) at1. Prove Σ_j n_jδ_j=0 and the local germ identity L(s,ρ)=∏_j H_j(s)^n_j. For every ε>0 there exists C_(g,ε)>0 with |L′(1,ρ)/L(1,ρ)|≤C_(g,ε)D_E^ε. Use the exact identity L′(1,ρ)/L(1,ρ)=Σ_j n_j H_j′(1)/H_j(1) and fixed-degree subpower bounds for these regularized Hecke logarithmic derivatives. This is an explicit target and source obligation; the printed fixed-radius Cauchy bound for L′ alone does not establish it.

**Hypotheses.** Same finite family and continuation normalization. Hecke logarithmic-derivative bounds must be uniform in the stated analytic-conductor range; poles have been removed and their total order cancels. Constants may be ineffective.

**Construction and proof.**

1. Differentiate the regularized Brauer product at1. The nonzero-factor condition permits division and removes all principal parts by Σ n_jδ_j=0.
2. Sum the individual Hecke logarithmic-derivative estimates using Σ|n_j|≤B_g, choosing the exponent to absorb the conductor comparison. This route supplies the ratio itself; general Artin holomorphy in a fixed-radius disc is not assumed.

**Dependencies.** [`AnalyticNumberTheory:AN.4/artin-value-one-subpower`](#artin-value-one-subpower), [`AnalyticNumberTheory:AN.4/artin-induction-factor`](#artin-induction-factor), [`AnalyticNumberTheory:AN.4/artin-linear-hecke-comparison`](#artin-linear-hecke-comparison), `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: The Andre-Oort conjecture for A_g](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-TSIMERMAN-18.result.json), Proof of Corollary 3.3, p. 384; [10], (5.2); [The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf), Theorem3.2 and proof of Corollary3.3, printed pp.383–384.

<a id="artin-direct-sum-factor"></a>

#### Direct sums of Artin local factors

`AnalyticNumberTheory:AN.4/artin-direct-sum-factor` · lemma · `TauCeti.AnalyticNumberTheory.artin_direct_sum_factor`.

For ρ₁,ρ₂, P_p(ρ₁⊕ρ₂,T)=P_p(ρ₁,T)P_p(ρ₂,T) at every prime, including ramified primes. Hence L(ρ₁⊕ρ₂)=L(ρ₁)L(ρ₂) on Re s>1.

**Construction and proof.**

1. The inertia-fixed subspace of the direct sum is the direct sum of fixed subspaces by the existing invariants membership formula. Transport Frobenius to the block diagonal map.
2. Apply LinearMap.charpoly_prodMap to the two finite endomorphisms and transport through polynomial reversal, or use the corresponding determinant block identity.
3. Use the artin absolute convergence target absolute local uniform convergence to multiply the finite local identities in the directed limit of prime sets; no statement about arbitrary totalized products is used.

**Dependencies.** [`AnalyticNumberTheory:AN.4/artin-local-polynomial`](#artin-local-polynomial), [`AnalyticNumberTheory:AN.4/artin-euler-series`](#artin-euler-series), `mathlib:LinearMap.charpoly_prodMap`, [`AnalyticNumberTheory:AN.4/artin-absolute-convergence`](#artin-absolute-convergence).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.2 p.128 displayed direct-sum identity.

<a id="artin-absolute-convergence"></a>

#### Absolute convergence of Artin factors

`AnalyticNumberTheory:AN.4/artin-absolute-convergence` · lemma · `TauCeti.AnalyticNumberTheory.artin_absolute_convergence`.

For fixed dimension d and ε>0, uniformly on Re s≥1+ε, the local factors satisfy |P_p((Np)^−s)^−1−1|≤C_{d,ε}(Np)^−Re s. Their product converges absolutely and locally uniformly and is nonzero there.

**Construction and proof.**

1. Apply artin-local-reciprocal-bound with θ=2^(−1−ε) and t=(Np)^−Re s. Since Np≥2, all local factors and their reciprocal partial products stay nonzero and their deviations from1 have a common summable majorant C_{d,ε}(Np)^−1−ε.
2. Prime ideals are a subset of the nonzero ideals; the full Dedekind series converges at1+ε. For the coefficient series, use the d-fold convolution majorant described in the artin euler series target, whose ideal sum is ζ_K(1+ε)^d, including d=0.
3. ADS3 supplies the absolute/unordered product-to-series limit after these hypotheses. Summability of deviations gives a locally uniform product and summability for the reciprocal factors; the limit is nonzero. Dependence of the global bound on K is allowed, while the displayed local constant depends only on d,ε.

**Dependencies.** [`AnalyticNumberTheory:AN.4/artin-local-polynomial`](#artin-local-polynomial), [`AnalyticNumberTheory:AN.4/artin-euler-series`](#artin-euler-series), [`AnalyticNumberTheory:AN.4/artin-local-reciprocal-bound`](#artin-local-reciprocal-bound), [`AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`](#dedekind-zeta-continuation-and-residue), `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-1-norm-fibres-and-mathlib-lseries`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.2 p.128 absolute convergence paragraph.

<a id="artin-induction-factor"></a>

#### Induction identity including ramification

`AnalyticNumberTheory:AN.4/artin-induction-factor` · lemma · `TauCeti.AnalyticNumberTheory.artin_induction_factor`.

For H⊆G and a complex finite-dimensional representation σ of H, with F=L^H, L_K(s,Ind_H^G σ)=L_F(s,σ) on Re s>1, including all ramified local factors.

**Construction and proof.**

1. Apply the ramified local induction polynomial identity at every prime p of K. The residue norm identity Nq=(Np)^f(q/p) matches every right-hand norm variable exactly.
2. Evaluate the finite local determinant identity at T=(Np)^−s, then rearrange the absolutely convergent prime products from the artin absolute convergence target. This is representation induction on H=Gal(L/F), including nonnormal F/K.

**Dependencies.** [`AnalyticNumberTheory:AN.4/artin-ramified-induction-polynomial`](#artin-ramified-induction-polynomial), [`AnalyticNumberTheory:AN.4/artin-euler-series`](#artin-euler-series), [`AnalyticNumberTheory:AN.4/artin-absolute-convergence`](#artin-absolute-convergence).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.5 Theorem22.4 sketch p.129.

<a id="artin-linear-hecke-comparison"></a>

#### Linear Artin factors are Hecke factors

`AnalyticNumberTheory:AN.4/artin-linear-hecke-comparison` · lemma · `TauCeti.AnalyticNumberTheory.artin_linear_hecke_comparison`.

For L/K finite Galois and a one-dimensional finite-order character χ:Gal(L/K)→C×, composition with the arithmetic global Artin map gives the canonical primitive finite-order Hecke character η. On Re s>1, the full Artin Euler series equals its full Hecke L-function. At p where χ is trivial on inertia both factors are (1−χ(Frob_p)(Np)^−s)^−1; otherwise both are1. The conductor and archimedean signs come from the same local/global reciprocity dictionary.

**Construction and proof.**

1. Compose χ with the existing globalArtinMap, using its principal-ideles triviality and local compatibility; obtain the existing GNF9 finite-order primitive character, with its real-place sign from CFT11.
2. CFT7 characterConductorExp and its unramified criterion identify local conductor exponent0 exactly with inertia-triviality. Compare the arithmetic Frobenius local value at those primes; at positive conductor exponent both local factors are1.
3. Evaluate absolutely convergent products and use the existing Hecke Euler comparison. Do not use an arbitrary imprimitive modulus to erase extra primes or invert the arithmetic Artin normalization.

**Dependencies.** [`AnalyticNumberTheory:AN.4/artin-euler-series`](#artin-euler-series), [`AnalyticNumberTheory:AN.4/hecke-L-function-euler-product-comparison`](#hecke-L-function-euler-product-comparison), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, [`AnalyticNumberTheory:AN.4/artin-local-polynomial`](#artin-local-polynomial), [`AnalyticNumberTheory:AN.4/artin-absolute-convergence`](#artin-absolute-convergence), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.5 Theorem22.4 sketch p.129.

<a id="brauer-meromorphic-continuation"></a>

#### Global meromorphic Artin continuation

`AnalyticNumberTheory:AN.4/brauer-meromorphic-continuation` · theorem · `TauCeti.AnalyticNumberTheory.brauer_meromorphic_continuation`.

Every finite-image complex Artin Euler series has a meromorphic continuation to C obtained from an integral Brauer expression as a finite product of integer powers of canonical Hecke continuations. This asserts global meromorphy, not Artin holomorphy.

**Construction and proof.**

1. Request the integral monomial refinement of Brauer induction: χ_ρ=Σ_j n_j Ind_{H_j}^G χ_j with n_j∈Z and χ_j one-dimensional. The current upstream Layer6 only supplies elementary subgroup characters; their further induced-linear decomposition must be proved, not inferred from that wording.
2. Apply the Artin induction identity and the linear Artin–Hecke comparison to the character identity on Re s>1, obtaining a finite product of integer powers of canonical meromorphic Hecke continuations. Nonzero right-half-plane values ensure none of the denominator factors is identically zero.
3. Use the identity theorem to identify this meromorphic continuation independently of the chosen integral expression. Negative coefficients may introduce poles away from1, so no Artin holomorphy conclusion follows. Rational coefficients give only a meromorphic power and cannot replace this proof.

**Dependencies.** [`AnalyticNumberTheory:AN.4/artin-induction-factor`](#artin-induction-factor), [`AnalyticNumberTheory:AN.4/artin-linear-hecke-comparison`](#artin-linear-hecke-comparison), `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`, [`AnalyticNumberTheory:AN.4/hecke-primitive-functional-equation`](#hecke-primitive-functional-equation).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.5 boundary result; integral Brauer strengthening requires its original source; [Class Field Theory](https://www.jmilne.org/math/CourseNotes/CFT.pdf), ChapterVIII§10 Artin L-series, pp.261–262.

**Atlas planet.** Artin meromorphic continuation.

<a id="artin-local-reciprocal-bound"></a>

#### Uniform finite Artin factor bound

`AnalyticNumberTheory:AN.4/artin-local-reciprocal-bound` · lemma · `TauCeti.AnalyticNumberTheory.artin_local_reciprocal_bound`.

For d∈N,0≤m≤d,0≤t≤θ<1 and α₁,…,α_m∈C with |α_j|=1, put A(z)=∏_{j=1}^m(1−α_j z). For |z|=t, A(z)≠0, |A(z)^−1|≤(1−θ)^−d and |A(z)^−1−1|≤d t(1−θ)^−d. The assertion includes d=m=0.

**Construction and proof.**

1. Each |1−α_j z|≥1−t≥1−θ>0, so every reciprocal factor exists and has norm≤(1−θ)^−1.
2. Telescope the reciprocal finite product: the jth term has one factor difference α_j z/(1−α_j z) and at most m−1 preceding factors. Each term is bounded by t(1−θ)^−m, and summing gives m t(1−θ)^−m≤d t(1−θ)^−d.
3. For a finite-order invariant-space automorphism, every characteristic root satisfies α^N=1 for a positive group exponent N, so |α|=1. The polynomial splits over C. This supplies the local factor hypotheses without choosing a new representation carrier.

**Dependencies.** [`AnalyticNumberTheory:AN.4/artin-local-polynomial`](#artin-local-polynomial).

**Acceptance.** The zero-dimensional and ramified cases are included; no Artin holomorphy assumption is used.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.2 p.128 local O(p^−s) estimate.

<a id="artin-ramified-induction-polynomial"></a>

#### Ramified local Artin induction identity

`AnalyticNumberTheory:AN.4/artin-ramified-induction-polynomial` · lemma · `TauCeti.AnalyticNumberTheory.artin_ramified_induction_polynomial`.

For L/K finite Galois with group G,H≤G,F=L^H and σ a finite-dimensional complex representation of H, at every nonzero prime p of K, P_{p,Ind_H^Gσ}(T)=∏_{q|p in F}P_{q,σ}(T^{f(q/p)}). The right polynomials are defined from Gal(L/F)=H, their own inertia invariants and arithmetic Frobenius modulo inertia.

**Construction and proof.**

1. Fix P of L above p and its groups I⊲D. Match the primes q of F above p with H\G/D by NumberFieldArithmetic1.4, and use Mackey3a to split the induced representation restricted to D.
2. In each Mackey summand, take I-invariants. Frobenius permutes the inertia-orbit blocks in cycles of length f(q/p). The cycle return map is the relative Frobenius on the appropriate conjugated σ-invariant space, with independence only modulo inertia at a ramified prime.
3. The determinant of I−T times a cyclic block with return map A and cycle length f is det(I−T^f A). Multiply these blocks. The required ramified Frobenius/invariant-space and cyclic-block adapters are explicit open parts of the Artin gap; unramified automorphism equality is insufficient.

**Dependencies.** [`AnalyticNumberTheory:AN.4/artin-local-polynomial`](#artin-local-polynomial), `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-1-the-splitting-dictionary`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-2-frobenius-elements-and-the-artin-symbol`, `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-3-the-mackey-decomposition-formula`.

**Acceptance.** The zero-dimensional and ramified cases are included; no Artin holomorphy assumption is used.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.5 Theorem22.4 sketch p.129; full ramified local identity is a required expansion.

### Arithmetic residues and quadratic Hecke estimates

<a id="bounded-degree-brauer-siegel"></a>

#### Bounded-degree Brauer-Siegel

`AnalyticNumberTheory:AN.4/bounded-degree-brauer-siegel` · theorem · `TauCeti.AnalyticNumberTheory.bounded_degree_brauer_siegel`.

For number fields of bounded degree and discriminant D tending to infinity, log(h_K R_K)=(1/2+o(1)) log D. Keep fixed-degree uniformity and possible ineffectivity explicit.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use the bounded-degree Brauer–Siegel/Siegel theorem without adding normality.
2. Apply the real analytic class-number formula; finite adjustment handles bounded discriminants.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: The Andre-Oort conjecture for A_g](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-TSIMERMAN-18.result.json), 2.2, p. 382; proof of Corollary 3.3, p. 384; [4].

<a id="quadratic-zeta-factorization"></a>

#### Quadratic zeta factorization and the residue quotient

`AnalyticNumberTheory:AN.4/quadratic-zeta-factorization` · theorem · `TauCeti.AnalyticNumberTheory.quadratic_zeta_factorization`.

For a quadratic extension E/F with its canonical nontrivial finite-order Hecke character η, ζ_E(s)=ζ_F(s)L_f(s,η) on Re s>1, including every ramified Euler factor.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Verify split, inert and ramified Euler factors of ζ_E/ζ_F on Re s>1.
2. Extend the identity to the canonical continuations; the residue quotient is a separate node.

**Dependencies.** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: The Andre-Oort conjecture for A_g](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-TSIMERMAN-18.result.json), Quadratic Euler-factor calculation; Thorner-Zaman 2017 equations (2-1)-(2-7); main Corollary 3.3 adapter.

<a id="bounded-degree-residue-bounds"></a>

#### Uniform subpolynomial Dedekind residues

`AnalyticNumberTheory:AN.4/bounded-degree-residue-bounds` · theorem · `TauCeti.AnalyticNumberTheory.bounded_degree_residue_bounds`.

For every n>=1 and epsilon>0 there are c,C>0 depending only on n,epsilon such that c*D_K^(-epsilon)<=kappa_K<=C*D_K^epsilon for every number field of degree at most n. Constants may be ineffective. Derive from bounded-degree Brauer-Siegel, the explicit residue formula, the bounded number of roots of unity, and a finite adjustment for small discriminants. Normality is not added to the bounded-degree contract.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use bounded-degree Brauer–Siegel and the explicit positive residue formula.
2. Uniformly bound roots of unity by degree and absorb the finite small-discriminant range.

**Dependencies.** [`AnalyticNumberTheory:AN.4/bounded-degree-brauer-siegel`](#bounded-degree-brauer-siegel), [`AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`](#dedekind-zeta-continuation-and-residue).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: The Andre-Oort conjecture for A_g](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-TSIMERMAN-18.result.json), Brauer 1947 input as used in main sections 2-3; Tsimerman arXiv:1103.5619v3 Lemma 4.1 for comparison.

<a id="quadratic-hecke-value-one"></a>

#### Two-sided quadratic Hecke value bound

`AnalyticNumberTheory:AN.4/quadratic-hecke-value-one` · theorem · `TauCeti.AnalyticNumberTheory.quadratic_hecke_value_one`.

Let E be a CM number field, F its maximal totally real subfield, [F:ℚ]=g≥1, and η=η_E/F the canonical nontrivial primitive quadratic Hecke character. Write D_K=|Disc(K)|, f_η for its finite conductor, and Q=D_F N(f_η)=D_E/D_F. For every fixed g and epsilon>0, D_E^(-epsilon) <<_(g,epsilon) L_f(1,eta_E/F) <<_(g,epsilon) D_E^epsilon. Constants may be ineffective. Use kappa_E/kappa_F, the degree bounds 2g and g, and D_F<=D_E^(1/2), choosing each residue exponent at most 2*epsilon/3.

**Hypotheses.** E/F is the CM quadratic extension specified in the statement; η is defined through global Artin reciprocity, rather than an arbitrary quadratic character. g and ε are fixed before varying E; implied constants depend only on those stated parameters.

**Construction and proof.**

1. Apply the positive residue quotient and both residue bounds with exponent ≤2ε/3.
2. Use D_F≤D_E^(1/2) to keep the total exponent ≤ε.

**Dependencies.** [`AnalyticNumberTheory:AN.4/quadratic-residue-quotient`](#quadratic-residue-quotient), [`AnalyticNumberTheory:AN.4/bounded-degree-residue-bounds`](#bounded-degree-residue-bounds), `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: The Andre-Oort conjecture for A_g](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-TSIMERMAN-18.result.json), Derived adapter for main Corollary 3.3.

<a id="primitive-hecke-convexity"></a>

#### Uniform finite-order Hecke convexity

`AnalyticNumberTheory:AN.4/primitive-hecke-convexity` · theorem · `TauCeti.AnalyticNumberTheory.primitive_hecke_convexity`.

Let chi be a primitive finite-order Hecke character over a degree-n number field K, Q=D_K*N(f_chi), 0<r<=1/2, and -r<=sigma<=1+r. For s=sigma+it with chi nontrivial or s≠1, |L_f(s,chi)| << |(1+s)/(1-s)|^delta(chi) * zeta_Q(1+r)^n * (Q*(3+|t|)^n/(2*pi)^n)^((1+r-sigma)/2), with an absolute implied constant. Define the pole factor to be |(1+s)/(1-s)| for the trivial character, and 1 for every nontrivial character (including at s=1); zeta_Q means the Riemann zeta function.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use the primitive completed functional equation and the absolutely convergent right-edge bound.
2. Apply the pole-cleared Phragmén–Lindelöf theorem with the displayed strip and height; retain the principal-character pole factor.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit. The trivial character at s=1 is outside this finite-value inequality; do not interpret its meromorphic pole via totalized division. Nontrivial characters may be evaluated at s=1.

**Sources.** [Reviewed extraction: The Andre-Oort conjecture for A_g](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-TSIMERMAN-18.result.json), Thorner-Zaman 2017, Lemma 2.3, printed p. 1142; credits Rademacher 1959; [An explicit bound for the least prime ideal in the Chebotarev density theorem](https://msp.org/ant/2017/11-5/ant-v11-n5-p04-p.pdf), Lemma2.3 [Rademacher 1959], unnumbered bound, printed p.1142.

<a id="quadratic-hecke-cauchy-derivative"></a>

#### A fixed small circle gives a subpolynomial derivative

`AnalyticNumberTheory:AN.4/quadratic-hecke-cauchy-derivative` · theorem · `TauCeti.AnalyticNumberTheory.quadratic_hecke_cauchy_derivative`.

Let E be a CM number field, F its maximal totally real subfield, [F:ℚ]=g≥1, and η=η_E/F the canonical nontrivial primitive quadratic Hecke character. Write D_K=|Disc(K)|, f_η for its finite conductor, and Q=D_F N(f_η)=D_E/D_F. For fixed g and every epsilon>0, |L_f prime(1,eta_E/F)| <<_(g,epsilon) D_E^epsilon. Set r=min(epsilon,1/4)>0. The closed circle |s-1|=r is in [-r,1+r] in real part, |t|<=r, and the convexity exponent is at most r. Hence its supremum is at most C_(g,r)*Q^r, and Cauchy gives |L_f prime(1)|<=C_(g,r)*Q^r/r. Holomorphy is required on the entire disk; a zero-free disk is unnecessary.

**Hypotheses.** E/F is the CM quadratic extension specified in the statement; η is defined through global Artin reciprocity, rather than an arbitrary quadratic character. g and ε are fixed before varying E; implied constants depend only on those stated parameters.

**Construction and proof.**

1. Choose r=min(ε,1/4), and apply the finite-order convexity bound on the complete circle |s−1|=r.
2. Use Cauchy on the holomorphic disk, with bound Q^r/r; no zero-free disk is assumed.

**Dependencies.** [`AnalyticNumberTheory:AN.4/primitive-hecke-convexity`](#primitive-hecke-convexity), `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`, `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: The Andre-Oort conjecture for A_g](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-TSIMERMAN-18.result.json), Derived from Thorner-Zaman Lemma 2.3 and Cauchy derivative estimate.

<a id="quadratic-hecke-log-derivative-one"></a>

#### Subpolynomial logarithmic derivative at one

`AnalyticNumberTheory:AN.4/quadratic-hecke-log-derivative-one` · theorem · `TauCeti.AnalyticNumberTheory.quadratic_hecke_log_derivative_one`.

Let E be a CM number field, F its maximal totally real subfield, [F:ℚ]=g≥1, and η=η_E/F the canonical nontrivial primitive quadratic Hecke character. Write D_K=|Disc(K)|, f_η for its finite conductor, and Q=D_F N(f_η)=D_E/D_F. For every fixed g and epsilon>0, |L_f prime(1,eta)/L_f(1,eta)| <<_(g,epsilon) D_E^epsilon. Apply the derivative bound with epsilon/2 and the reciprocal value bound with epsilon/2. The latter, rather than Cauchy, is the possible ineffective input.

**Hypotheses.** E/F is the CM quadratic extension specified in the statement; η is defined through global Artin reciprocity, rather than an arbitrary quadratic character. g and ε are fixed before varying E; implied constants depend only on those stated parameters.

**Construction and proof.**

1. Apply the derivative estimate with ε/2.
2. Multiply by the reciprocal positive-value estimate with ε/2.

**Dependencies.** [`AnalyticNumberTheory:AN.4/quadratic-hecke-cauchy-derivative`](#quadratic-hecke-cauchy-derivative), [`AnalyticNumberTheory:AN.4/quadratic-hecke-value-one`](#quadratic-hecke-value-one), `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: The Andre-Oort conjecture for A_g](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-TSIMERMAN-18.result.json), Derived adapter for main Corollary 3.3.

<a id="quadratic-hecke-log-functional-equation"></a>

#### Logarithmic functional equation at zero and one

`AnalyticNumberTheory:AN.4/quadratic-hecke-log-functional-equation` · theorem · `TauCeti.AnalyticNumberTheory.quadratic_hecke_log_functional_equation`.

Let E be a CM number field, F its maximal totally real subfield, [F:ℚ]=g≥1, and η=η_E/F the canonical nontrivial primitive quadratic Hecke character. Write D_K=|Disc(K)|, f_η for its finite conductor, and Q=D_F N(f_η)=D_E/D_F. For ell_j=L_f prime(j,eta)/L_f(j,eta), both denominators are nonzero and ell_0+ell_1=-log Q+g*(gamma+log(2*pi)), where gamma is Euler constant. Differentiate the completed functional equation; Gamma_R prime/Gamma_R at 1 and 2 sum to -gamma-log(2*pi). Nonvanishing at 0 follows from the functional equation and L_f(1)>0. Each real local component of η is the sign character, so the conductor-normalized completion is Q^(s/2) Γ_R(s+1)^g L_f(s,η), with Γ_R(s)=π^(−s/2)Γ(s/2). This odd archimedean formula is not asserted for a real quadratic extension of a totally real field.

**Hypotheses.** E/F is the CM quadratic extension specified in the statement; η is defined through global Artin reciprocity, rather than an arbitrary quadratic character. g and ε are fixed before varying E; implied constants depend only on those stated parameters.

**Construction and proof.**

1. Differentiate the quadratic completed functional equation and evaluate at 0 and 1 after proving both endpoint values nonzero.
2. Use the gamma logarithmic derivatives at 1 and 2; keep the conductor Q separate from D_E until their arithmetic identification.

**Dependencies.** [`AnalyticNumberTheory:AN.4/quadratic-residue-quotient`](#quadratic-residue-quotient), [`AnalyticNumberTheory:AN.4/hecke-primitive-functional-equation`](#hecke-primitive-functional-equation), `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit. For E=ℚ(i), F=ℚ, Q=4: L_f(0,η)=1/2 and L_f(1,η)=π/4; the claimed sum becomes γ+log(π/2). Exclude E=ℚ(√2), F=ℚ: its even primitive character χ_8 has L_f(0,χ_8)=0, so the displayed logarithmic quotient at 0 is undefined.

**Sources.** [Reviewed extraction: The Andre-Oort conjecture for A_g](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-TSIMERMAN-18.result.json), Derived from Thorner-Zaman (2-3)-(2-6), odd gamma factors; [An explicit bound for the least prime ideal in the Chebotarev density theorem](https://msp.org/ant/2017/11-5/ant-v11-n5-p04-p.pdf), (2-3)–(2-7), printed pp.1140–1141; specialized using CM sign characters.

<a id="quadratic-residue-quotient"></a>

#### Quadratic Hecke value as residue quotient

`AnalyticNumberTheory:AN.4/quadratic-residue-quotient` · lemma · `TauCeti.AnalyticNumberTheory.quadratic_residue_quotient`.

For a quadratic extension E/F, L_f(1,η)=κ_E/κ_F>0, where κ_K is the positive residue of the continued Dedekind function. Here η is the canonical nontrivial primitive quadratic Hecke character attached by global Artin reciprocity. Its holomorphy at 1, the continued zeta factorization, and the two simple positive residues give the quotient; general line-one nonvanishing is not needed for this argument.

**Construction and proof.**

1. Multiply the continued quadratic factorization by s−1 and take the limit at 1.
2. Cancel the positive κ_F and use holomorphy of the nonprincipal Hecke factor.

**Dependencies.** [`AnalyticNumberTheory:AN.4/quadratic-zeta-factorization`](#quadratic-zeta-factorization), [`AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`](#dedekind-zeta-continuation-and-residue), `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`, `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: The Andre-Oort conjecture for A_g](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-TSIMERMAN-18.result.json), Quadratic Euler-factor calculation; Thorner-Zaman 2017 equations (2-1)-(2-7); main Corollary 3.3 adapter.

<a id="real-quadratic-class-regulator-lower"></a>

#### Siegel lower bound and regulator conversion

`AnalyticNumberTheory:AN.4/real-quadratic-class-regulator-lower` · theorem · `TauCeti.AnalyticNumberTheory.real_quadratic_class_regulator_lower`.

For every ε>0, h⁺(D)log ε_D≥c_ε D^(1/2−ε) for positive fundamental D, with an ineffective c_ε>0 and the narrow regulator convention of DIT item144.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Import the narrow/ordinary class-number and norm-minus-one unit dichotomy.
2. Apply Siegel and the positive real-quadratic residue formula with the specified fundamental unit.

**Dependencies.** [`AnalyticNumberTheory:AN.2/siegel-quadratic-lvalue`](#siegel-quadratic-lvalue), [`AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`](#dedekind-zeta-continuation-and-residue).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: Geometric invariants for real quadratic fields](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json), §6, pp967–968; [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §6, pp967–968.

<a id="imaginary-quadratic-class-number-lower"></a>

#### Siegel lower bound and regulator conversion

`AnalyticNumberTheory:AN.4/imaginary-quadratic-class-number-lower` · theorem · `TauCeti.AnalyticNumberTheory.imaginary_quadratic_class_number_lower`.

For every ε>0, h(D)≥c_ε |D|^(1/2−ε) for negative fundamental D, with an ineffective c_ε>0.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use the imaginary-quadratic residue formula and the degree-two uniform roots-of-unity bound.
2. Insert Siegel’s primitive quadratic L-value lower bound.

**Dependencies.** [`AnalyticNumberTheory:AN.2/siegel-quadratic-lvalue`](#siegel-quadratic-lvalue), [`AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`](#dedekind-zeta-continuation-and-residue).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: Geometric invariants for real quadratic fields](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json), §6, pp967–968; [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §6, pp967–968.

<a id="louboutin-dedekind-residue-upper"></a>

#### Explicit residue bound for Dedekind zeta functions (Louboutin)

`AnalyticNumberTheory:AN.4/louboutin-dedekind-residue-upper` · theorem · `TauCeti.AnalyticNumberTheory.louboutin_dedekind_residue_upper`.

For every number field K of degree d>1 and absolute discriminant D_K, the residue κ_K of the continued Dedekind zeta function satisfies κ_K≤(e log D_K/(2(d−1)))^(d−1).

**Hypotheses.** K is a number field; d=[K:ℚ]>1; D_K is the positive absolute discriminant; κ_K is the residue of the complex continuation at1, matched to the pinned real residue limit.

**Construction and proof.**

1. Apply the original Louboutin upper bound to the continued Dedekind residue.
2. Keep d>1 and the exact degree-dependent exponent; this upper bound alone does not prove a lower bound.

**Dependencies.** [`AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`](#dedekind-zeta-continuation-and-residue).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: How large is A_g(F_q)?](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-LIPNOWSKI-TSIMERMAN-18.result.json), §3.2.2 (24), [18]; used again in §5.4.2 (49); [How large is A_g(F_q)?](https://arxiv.org/pdf/1511.02212v1), §3.2.2, (24), printed p.14; reference[18].

<a id="most-quadratic-many-split-primes"></a>

#### Many split primes outside a small quadratic exception set

`AnalyticNumberTheory:AN.4/most-quadratic-many-split-primes` · theorem · `TauCeti.AnalyticNumberTheory.most_quadratic_many_split_primes`.

For ε₁ > 0 and X ≥ 2 there is E = E(k, X, ε₁) ⊂ {F/k quadratic, Disc(F/k) ≤ X} with |E| ≪_{[k:ℚ],ε₁} Disc(k)^{ε₁}X^{ε₁}, such that for F ∉ E and 4 ≤ Y ≤ X, π_k(Y; F, e) ≥ (1/8)π_k(Y/2) − C_{[k:ℚ],ε₁}Y^{σ₁}log²(X Disc(k)) with σ₁ = max(1 − ε₁/(4c), 1/2). E consists of the F whose character χ_{F/k} has a zero with ℜρ > σ₁, |ℑρ| ≤ X^{1/2}; the proof is the explicit formula with Lemma 4.1.

**Hypotheses.** k is a number field of fixed degree n, D_k its absolute discriminant; quadratic F/k have relative discriminant norm≤X; ε₁>0 and X≥2. Take one positive degree-dependent c from the density theorem and σ₁=max(1−ε₁/(4c),1/2). E is fixed before Y ranges over4≤Y≤X, and a single constant C_{n,ε₁} works for all eligible k,F,X,Y. All prime-ideal counts include the norm endpoint.

**Construction and proof.**

1. Use the unique primitive quadratic ray character of conductor the relative discriminant; define E by its nontrivial zeros with σ₁<Reρ<1 and |Imρ|≤√X. The density bound with Q=X,T=√X and an exponent parameter small relative toε₁ gives #E≪_{n,ε₁}D_k^ε₁X^ε₁; bound conjugate infinity types by degree.
2. For F outside E, use the ideal von Mangoldt coefficient and the nonnegative weight (1−N𝔞/Y). Away from ramification, (1+χ(𝔭))/2 is the split-prime indicator. Ramified primes and higher powers require their separate counting estimates.
3. The Hecke logarithmic-derivative series and smoothed Perron give the kernel Y^s/(s(s+1)). Shift at safe heights, accounting for all trivial/nontrivial zeros and double-pole residues at0 and−1; the literal source claim about every vertical line is not used as an integrability lemma.
4. LOW Lemma4.1 supplies the required unit-height zero count and local logarithmic-derivative targets. At T=√X, high zeros contribute O_n(Y log(XD_kT)/T) and low zeros O_{n,ε₁}(Y^σ₁ log(XD_kT)); use Y≤X. Original IK estimates, good-height selection, smoothed contour and residue calculations remain an explicit gap.
5. Use the imported inclusive counting carriers and partial summation to remove higher powers/ramification and the log norm weight, producing the stated1/8 lower bound with one uniform error constant. The exact quantitative adapter, stronger than qualitative PNT transfer, remains a gap.

**Dependencies.** [`AnalyticNumberTheory:AN.3/ray-class-zero-density`](#ray-class-zero-density), [`AnalyticNumberTheory:AN.4/quadratic-zeta-factorization`](#quadratic-zeta-factorization), [`AnalyticNumberTheory:AN.4/hecke-primitive-functional-equation`](#hecke-primitive-functional-equation), `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-4-counting-carriers-and-local-finiteness`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-5-ideal-and-prime-estimates`, [`AnalyticNumberTheory:AN.4/hecke-nonvanishing-on-line-one`](#hecke-nonvanishing-on-line-one).

**Acceptance.** The same set E and one degree/ε₁-dependent constant work simultaneously for every4≤Y≤X; allowing Y-dependent constants would make the target empty. When X<4 there are no eligible Y, but the exceptional-set cardinality assertion is still required. The source weights all prime powers before transferring to split unramified primes; its1/8 main factor cannot be replaced by1/2 without a separate argument.

**Sources.** [Reviewed extraction: The average size of 3-torsion in class groups of 2-extensions](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-LEMKEOLIVER-WANG-WOOD-25.result.json), Lemma 4.3 and proof, pp.20–22, Forum Math. Pi 13 (2025), e19; [The average size of 3-torsion in class groups of 2-extensions](https://doi.org/10.1017/S2050508625000009), §4, Lemma4.3 and full proof, printed pp.20–22.

<a id="effective-prime-ideal-lower"></a>

#### Lemma 4.4 (Zaman's effective lower bound for prime ideals)

`AnalyticNumberTheory:AN.4/effective-prime-ideal-lower` · theorem · `TauCeti.AnalyticNumberTheory.effective_prime_ideal_lower`.

For every fixed degree n there is a positive effective c_n and an absolute effective D₀ such that π_k(Y)≥c_n D_k^(−19)Y/log Y whenever [k:Q]=n, D_k≥D₀ and Y≥D_k^35.

**Hypotheses.** Fix n=[k:ℚ]≥1; D_k is the absolute discriminant; one absolute effective threshold D₀≥2 and an effective c_n>0 precede all k,Y; Y≥D_k^35. π_k counts nonzero prime ideals of norm≤Y. The caseD_k=1 is outside the discriminant threshold, not a counterexample.

**Construction and proof.**

1. Apply the degree-uniform effective Zaman prime-ideal bound with β=35 and γ=19.
2. Retain a discriminant threshold and Y≥D^35.

**Dependencies.** `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-4-counting-carriers-and-local-finiteness`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: The average size of 3-torsion in class groups of 2-extensions](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-LEMKEOLIVER-WANG-WOOD-25.result.json), Lemma 4.4, p.22, citing [Zam17], Forum Math. Pi 13 (2025), e19; [The average size of 3-torsion in class groups of 2-extensions](https://doi.org/10.1017/S2050508625000009), §4, Lemma4.4 and ensuing discussion, printed p.22; [Analytic estimates for the Chebotarev Density Theorem and their applications](https://www.math.toronto.edu/zaman/files/thesis.pdf), Theorem1.3.1, pp.11–12; conventions §1.5 p.26; selected §7.2.1 pp.159–160 and §7.2.4 pp.166–169.

<a id="heilbronn-simple-real-zero"></a>

#### Heilbronn's theorem on real zeros of Dedekind zeta functions

`AnalyticNumberTheory:AN.4/heilbronn-simple-real-zero` · theorem · `TauCeti.AnalyticNumberTheory.heilbronn_simple_real_zero`.

If K/Q is finite Galois and the canonical continued ζ_K has a simple real zero β with0<β<1, then a quadratic subfield k⊆K satisfies ζ_k(β)=0. The conclusion uses meromorphic Artin continuation and the Aramata–Brauer entire-quotient theorem, not Artin holomorphy.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Heilbronn Theorem1 first puts the simple real zero in the compositum K₂ of all quadratic subfields. Meromorphic Artin continuation gives integral orders m_χ, possibly negative, for irreducible characters.
2. The Aramata–Brauer theorem says ζ_K/ζ_E is entire for every intermediate E (K/E remains Galois). Thus ζ_E has zero order0 or1 at β. This stronger holomorphy-of-a-quotient input is missing from the existing meromorphic Artin node.
3. Form the virtual character φ=Σ m_χχ. The subgroup averages S(H) are the intermediate zeta orders. If the maximal abelian subfield’s zeta is nonzero, choose a minimal subgroup H* of the commutator subgroup with S(H*)=0; proper subgroups have average1.
4. Möbius inversion over cyclic subgroups forces H* cyclic. Odd-prime cyclic quotients are ruled out by conjugate pairs of nonreal degree-one Hecke factors; hence H* is a nontrivial2-group.
5. Write the real virtual character as φ_+−φ_− with real genuine characters. Every determinant character is trivial on the commutator subgroup, so the multiplicities of eigenvalue−1 on a generator are both even. The subgroup-average difference forces their difference to be1, a contradiction.
6. In the maximal abelian extension, nonreal Hecke factors occur in conjugate pairs and cannot contribute a simple real zero. Over Q, ζ_Q is nonzero on(0,1), so the real factor is a nontrivial quadratic character; its quadratic field zeta vanishes. Original Aramata/Brauer and the finite-character/Möbius proof interfaces still need lemma-level supplier/decomposition.

**Dependencies.** [`AnalyticNumberTheory:AN.4/brauer-meromorphic-continuation`](#brauer-meromorphic-continuation), [`AnalyticNumberTheory:AN.4/artin-induction-factor`](#artin-induction-factor), [`AnalyticNumberTheory:AN.4/artin-direct-sum-factor`](#artin-direct-sum-factor), [`AnalyticNumberTheory:AN.4/artin-linear-hecke-comparison`](#artin-linear-hecke-comparison), [`AnalyticNumberTheory:AN.4/quadratic-zeta-factorization`](#quadratic-zeta-factorization).

**Acceptance.** K=Q cannot satisfy the premise: ζ_Q has no zero on(0,1). For K quadratic over Q the conclusion is its own field, by ζ_K=ζ_Q L(s,χ_K). An Artin factor may have a pole: nonnegative m_χ are never assumed in the virtual-character argument.

**Sources.** [On real zeros of Dedekind ζ-functions](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/C5957B0EA95C11C03686CE62D407E1DC/S0008414X00050926a.pdf/on-real-zeros-of-dedekind-z-functions.pdf), Theorem1 p.870; complete proof pp.871–873; postscript p.873; [On Stevenhagen’s conjecture](https://arxiv.org/pdf/2201.13424v1), §8.3 p.92, proof following Theorem8.13.

### Partial zeta functions and quadratic periods

<a id="partial-ideal-zeta"></a>

#### Partial ideal zeta series

`AnalyticNumberTheory:AN.4/partial-ideal-zeta` · definition · `TauCeti.AnalyticNumberTheory.partial_ideal_zeta`.

For a number field K, choose its ordinary or narrow ideal class group, and a class A. Let a_A(n) count nonzero integral ideals of norm n in A, with a_A(0)=0. Define ζ_A(s)=LSeries a_A s on Re s>1, using the imported norm-indexed ideal arithmetic function and finite norm fibres. Quadratic period applications use narrow classes for real quadratic K and ordinary classes for imaginary quadratic K. Index ideals, not their generators. The finite class sum agrees with NumberField.dedekindZeta as an LSeries: the latter may have a different zeroth coefficient, which LSeries ignores.

**Construction and proof.**

1. Choose the pinned ordinary ClassGroup or NumberField.NarrowClassGroup carrier and its canonical nonzero-ideal monoid homomorphism. Apply normCoeff to the class indicator weight; the zero ideal is absent from the carrier and the zeroth arithmetic coefficient is zero.
2. Use finite norm fibres and the finite class-group sum to regroup coefficients. Class characters are monoid homomorphisms to complex units; their finite order supplies unit norm.
3. For quadratic conjugation, use the ring-of-integers equivalence and the pinned inversion theorem on narrow classes, then the ordinary-class quotient. Norm preservation induces the coefficient bijection. The native general adapter exposes this exact class-inversion hypothesis; the canonical quadratic specialization discharges it.

**Dependencies.** `mathlib:NumberField.dedekindZeta`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-1-norm-fibres-and-mathlib-lseries`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-5-ideal-and-prime-estimates`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-2-moduli-and-ray-class-carriers`, `tauceti:TauCeti.IdealArithmeticFunction`, `tauceti:TauCeti.normCoeff`, `mathlib:ClassGroup.mk0`, `tauceti:NumberField.NarrowClassGroup.mk0`, `tauceti:NumberField.NarrowClassGroup.mk0_map_ringOfIntegersQuadraticConj_eq_inv`.

**API.**

- `partial_ideal_zeta.coeff` (data): a_A(n) is the finite cardinality of integral ideals of positive norm n in A; a_A(0)=0.
- `partial_ideal_zeta.sum_classes` (relation): The sum of ζ_A over all ideal classes is the Dedekind series on Re s>1.
- `partial_ideal_zeta.character_sum` (compatibility): For a class character χ, Σ_A χ(A)ζ_A(s) is its ideal-character LSeries on Re s>1.
- `partial_ideal_zeta.conjugation` (functoriality): For a ring-of-integers automorphism τ whose induced map on the selected class group is inversion, norm preservation gives ζ_A(s)=ζ_(A⁻¹)(s) on Re s>1. The quadratic specialization uses the canonical quadratic conjugation; its narrow-class inversion is already pinned.

**Unit tests.**

- `partial_ideal_zeta.q` (computation): For K=Q, the unique partial series equals the Riemann series on Re s>1.
- `partial_ideal_zeta.unit` (computation): a_A(1)=1 for the principal class and 0 otherwise.
- `partial_ideal_zeta.no_generators` (computation): The unit ideal contributes once, even when the unit group is infinite.
- `partial_ideal_zeta.zero` (computation): The zero ideal contributes to no coefficient; no norm-zero negative power occurs.

**Acceptance.** For K=Q, the unique partial series equals the Riemann series on Re s>1. a_A(1)=1 for the principal class and 0 otherwise. The unit ideal contributes once, even when the unit group is infinite. The zero ideal contributes to no coefficient; no norm-zero negative power occurs. The ℚ test is in the domain of this general coefficient definition; a real/imaginary quadratic restriction applies only to the subsequent period identities. Class-sum coefficient agreement is required for n≥1; do not infer equality of the zeroth coefficients from equality of LSeries.

**Uses.** `PAPER-DUKE-IMAMOGLU-TOTH-16/133`: Identify the narrow partial-zeta Hecke periods. `PAPER-GROSS-ZAGIER-86/95`: Use the same definition with the ordinary class group in the totally complex case.

**Sources.** [Reviewed extraction: Geometric invariants for real quadratic fields](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json), §7, p970; [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §7, p970.

**Atlas planet.** Partial ideal zeta functions.

<a id="class-character-lseries-comparison"></a>

#### Ideal-character Hecke L-function

`AnalyticNumberTheory:AN.4/class-character-lseries-comparison` · comparison · `TauCeti.AnalyticNumberTheory.class_character_lseries_comparison`.

For a finite narrow-class character χ, L(s,χ)=Σ_aχ(a)N(a)^(−s)=∏_p(1−χ(p)N(p)^(−s))⁻¹, Re(s)>1, and L=Σ_Aχ(A)ζ_A. The printed Euler product omits χ(p); use the corrected one.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Regroup the canonical ideal-character series by its finite class values.
2. Apply ADS Euler products with χ(p) retained in every local factor.

**Dependencies.** [`AnalyticNumberTheory:AN.4/partial-ideal-zeta`](#partial-ideal-zeta), [`AnalyticNumberTheory:AN.4/hecke-L-function-euler-product-comparison`](#hecke-L-function-euler-product-comparison).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: Geometric invariants for real quadratic fields](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json), §7, p970; [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §7, p970.

<a id="cm-partial-zeta-period"></a>

#### Hecke CM partial-zeta identity

`AnalyticNumberTheory:AN.4/cm-partial-zeta-period` · theorem · `TauCeti.AnalyticNumberTheory.cm_partial_zeta_period`.

For fundamental D<0, π^(−s)Γ(s)ζ_A(s)=(2^s/ω_D)|D|^(−s/2)E*(z_A,s), initially Re(s)>1 then by continuation. Here K=ℚ(√D), A is an ordinary ideal class, z_A is its associated CM lattice point in the upper half-plane, and ω_D=|O_K^×|/2 (thus ω_−4=2 and ω_−3=3). Here E(z,s)=(1/2)∑_(gcd(c,d)=1) (Im z)^s/|cz+d|^(2s) on Re s>1, and E*(z,s)=π^(−s)Γ(s)ζ(2s)E(z,s).

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Identify integral ideals in A with the CM lattice quotient, including the exact unit stabilizer.
2. Match E* and the gamma/discriminant normalization on Re s>1.

**Dependencies.** [`AnalyticNumberTheory:AN.4/partial-ideal-zeta`](#partial-ideal-zeta), [`AnalyticNumberTheory:AN.4/class-character-lseries-comparison`](#class-character-lseries-comparison), `AutomorphicSpectralTheory:AS.1`, `AutomorphicSpectralTheory:AS.2`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit. For D=−4 use ω_D=2, not the full unit count 4; for D=−3 use ω_D=3. Match the primitive Eisenstein half-sum convention before comparing constants.

**Sources.** [Reviewed extraction: Geometric invariants for real quadratic fields](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json), (7.1); [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), (7.1).

<a id="real-even-partial-zeta-period"></a>

#### Hecke positive-sign real quadratic formula

`AnalyticNumberTheory:AN.4/real-even-partial-zeta-period` · theorem · `TauCeti.AnalyticNumberTheory.real_even_partial_zeta_period`.

For fundamental D>1, π^(−s)Γ(s/2)²D^(s/2)(ζ_A+ζ_{JA})=2∫_{C_A}E*(z,s)ds, initially Re(s)>1 and then by continuation. The proof divides by the full norm-one unit action. Here K=ℚ(√D), A∈Cl^+(K), J is the narrow class of a principal ideal generated by an element of negative norm, and C_A is the oriented quadratic geodesic modulo the full norm-one unit group. With ε_D the least norm-one unit greater than 1, its arc length is 2 log ε_D. Here E(z,s)=(1/2)∑_(gcd(c,d)=1) (Im z)^s/|cz+d|^(2s) on Re s>1, and E*(z,s)=π^(−s)Γ(s)ζ(2s)E(z,s). The integration measure denoted ds in the displayed formula is hyperbolic arc length y^(−1)|dz|, not the complex variable s.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Unfold along the compact real quadratic geodesic and divide by the full norm-one unit action.
2. Sum the A and JA branches; match arc length and the even gamma factor.

**Dependencies.** [`AnalyticNumberTheory:AN.4/partial-ideal-zeta`](#partial-ideal-zeta), [`AnalyticNumberTheory:AN.4/class-character-lseries-comparison`](#class-character-lseries-comparison), `AutomorphicSpectralTheory:AS.1`, `AutomorphicSpectralTheory:AS.2`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: Geometric invariants for real quadratic fields](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json), (7.2), p.970 (Hecke; a cited result, 'He showed'); [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), (7.2), p.970 (Hecke; a cited result, 'He showed').

<a id="genus-lseries-factorization"></a>

#### Genus Hecke factorization

`AnalyticNumberTheory:AN.4/genus-lseries-factorization` · theorem · `TauCeti.AnalyticNumberTheory.genus_lseries_factorization`.

(p.971.) Let D = d'd be a fundamental discriminant, with d' and d fundamental discriminants (hence coprime), K = Q(√D), and χ the associated genus character of Cl^+(K). For D > 0, χ(J) = sign d = sign d'. Kronecker's decomposition holds: L(s,χ) = L(s,χ_{d'})L(s,χ_d). Equivalently Λ(s,χ) = Λ(s,χ_{d'})Λ(s,χ_d), with Λ(s,χ) as in (7.4)–(7.5) and Λ(s,χ_d) as in (5.13).

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Reuse the pinned genus character on the narrow class group and its coprime-ideal evaluation.
2. Compare Euler factors at split, inert and every ramified prime; continue only after the convergent identity.

**Dependencies.** [`AnalyticNumberTheory:AN.4/class-character-lseries-comparison`](#class-character-lseries-comparison), `tauceti:TauCeti.Multiquadratic.genusCharFunNarrowClassGroupHom`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: Geometric invariants for real quadratic fields](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json), §7, 'Genus characters', p.971, the unnumbered sentence between (7.7) and (7.8); [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), §7, 'Genus characters', p.971, the unnumbered sentence between (7.7) and (7.8).

<a id="negative-genus-core-period"></a>

#### Theorem3 negative factors

`AnalyticNumberTheory:AN.4/negative-genus-core-period` · theorem · `TauCeti.AnalyticNumberTheory.negative_genus_core_period`.

For s=1/2+it, coprime negative fundamental d,d′ and D=d′d>0, Λ(s,χ_d)Λ(s,χ_{d′})=(s(1−s)/2)Σ_Aχ(A)∫_{F_A}E*(z,s)dμ. First continue the compact boundary Hecke identity from Re(s)>1 to the critical line, then apply Stokes there. The raw core integral diverges when Re(s)>1 and is not its initial definition.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Apply the odd compact-boundary Hecke identity and the genus Euler factorization.
2. Continue this identity to the critical line before applying Stokes; never start from the divergent Re s>1 core integral.

**Dependencies.** [`AnalyticNumberTheory:AN.4/real-odd-partial-zeta-period`](#real-odd-partial-zeta-period), [`AnalyticNumberTheory:AN.4/genus-lseries-factorization`](#genus-lseries-factorization), `AutomorphicSpectralTheory:AS.1`, `AutomorphicSpectralTheory:AS.2`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: Geometric invariants for real quadratic fields](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json), Theorem3 first branch; [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Theorem3 first branch.

<a id="positive-genus-geodesic-period"></a>

#### Theorem3 positive factors

`AnalyticNumberTheory:AN.4/positive-genus-geodesic-period` · theorem · `TauCeti.AnalyticNumberTheory.positive_genus_geodesic_period`.

Let D > 1 be a fundamental discriminant and D = d′d a factorization into positive fundamental discriminants (equivalently, d′, d > 0 coprime fundamental discriminants with d′d > 1; then D is fundamental). Let χ be the genus character. Then Λ(s,χ_{d'})Λ(s,χ_d) = Σ_{A∈Cl^+(K)} χ(A)∫_{C_A} E*(z,s)y^{−1}|dz|, as meromorphic functions of s (7.8). On Re(s) = 1/2 this is the second case of Theorem 3, where ∫_{∂F_A} replaces ∫_{C_A}.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Sum the even compact-geodesic identity against χ and use genus factorization.
2. Identify geodesic and boundary arcs on the critical line with the imported oriented geometric conventions.

**Dependencies.** [`AnalyticNumberTheory:AN.4/real-even-partial-zeta-period`](#real-even-partial-zeta-period), [`AnalyticNumberTheory:AN.4/genus-lseries-factorization`](#genus-lseries-factorization), `AutomorphicSpectralTheory:AS.1`, `AutomorphicSpectralTheory:AS.2`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: Geometric invariants for real quadratic fields](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json), Theorem 3, second case, p.964; for all s by (7.8), p.972; [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Theorem 3, second case, p.964; for all s by (7.8), p.972.

<a id="mixed-genus-cm-period"></a>

#### Theorem3 CM factors

`AnalyticNumberTheory:AN.4/mixed-genus-cm-period` · theorem · `TauCeti.AnalyticNumberTheory.mixed_genus_cm_period`.

For coprime fundamental d,d′ of opposite sign, Λ(s,χ_d)Λ(s,χ_{d′})=(2√π/ω_D)Σ_Aχ(A)E*(z_A,s), as a meromorphic identity. Here D=dd′<0, the sum is over ordinary ideal classes of ℚ(√D), χ is the genus character, and ω_D=|O_K^×|/2 as in the CM partial-zeta comparison; use the same E* normalization.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Sum the CM point partial-zeta identity against the genus character.
2. Match the two Dirichlet gamma factors and the unit factor 2√π/ω_D.

**Dependencies.** [`AnalyticNumberTheory:AN.4/cm-partial-zeta-period`](#cm-partial-zeta-period), [`AnalyticNumberTheory:AN.4/genus-lseries-factorization`](#genus-lseries-factorization), `AutomorphicSpectralTheory:AS.1`, `AutomorphicSpectralTheory:AS.2`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: Geometric invariants for real quadratic fields](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json), Theorem 3, third case, p.964 (Re(s) = 1/2); for all s by the display after 'By (7.6) we have when D < 0', p.971; [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), Theorem 3, third case, p.964 (Re(s) = 1/2); for all s by the display after 'By (7.6) we have when D < 0', p.971.

<a id="real-odd-partial-zeta-period"></a>

#### Hecke negative-sign real quadratic formula

`AnalyticNumberTheory:AN.4/real-odd-partial-zeta-period` · theorem · `TauCeti.AnalyticNumberTheory.real_odd_partial_zeta_period`.

For fundamental D>1, π^(−s)Γ((s+1)/2)²D^(s/2)(ζ_A−ζ_{JA})=2∫_{C_A}i∂_zE*(z,s)dz, initially Re(s)>1 and then by continuation. This is the odd archimedean branch, with an oriented differential rather than arc length. Here K=ℚ(√D), A∈Cl^+(K), J is the narrow class of a principal ideal generated by an element of negative norm, and C_A is the oriented quadratic geodesic modulo the full norm-one unit group. With ε_D the least norm-one unit greater than 1, its arc length is 2 log ε_D. Here E(z,s)=(1/2)∑_(gcd(c,d)=1) (Im z)^s/|cz+d|^(2s) on Re s>1, and E*(z,s)=π^(−s)Γ(s)ζ(2s)E(z,s). The orientation is the quadratic-class orientation used in DIT §7; reversing it changes the sign of the differential integral.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Unfold the oriented differential i∂_zE* dz over the full norm-one unit quotient.
2. Take the A−JA difference and retain Γ((s+1)/2)^2, rather than the even gamma factor.

**Dependencies.** [`AnalyticNumberTheory:AN.4/partial-ideal-zeta`](#partial-ideal-zeta), [`AnalyticNumberTheory:AN.4/class-character-lseries-comparison`](#class-character-lseries-comparison), `AutomorphicSpectralTheory:AS.1`, `AutomorphicSpectralTheory:AS.2`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: Geometric invariants for real quadratic fields](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json), (7.3); [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf), (7.3).

<a id="gross-zagier-cm-eisenstein-comparison"></a>

#### Eisenstein series at a CM point equals a partial zeta function

`AnalyticNumberTheory:AN.4/gross-zagier-cm-eisenstein-comparison` · theorem · `TauCeti.AnalyticNumberTheory.gross_zagier_cm_eisenstein_comparison`.

Let D<0 be a fundamental discriminant, K=Q(√D), u=#O_K^×/2 and A an ordinary ideal class. Choose its CM lattice point τ_A in the upper half-plane from a primitive positive-definite binary quadratic form of discriminant D. Let E(z,s)=(1/2)Σ_{gcd(c,d)=1}(Im z)^s/|cz+d|^(2s), the uncompleted level-one Eisenstein series. For Re s>1, E(τ_A,s)=2^(−s)|D|^(s/2)u ζ(2s)^(−1)ζ_K(A,s), equivalently2^s ζ(2s)E(τ_A,s)=u|D|^(s/2)ζ_K(A,s). All positive-base powers use the real logarithm. Changing A to A^(−1) leaves its partial zeta unchanged.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Reuse hecke_cm_partial_zeta_identity: E*=π^(−s)Γ(s)ζ(2s)E and ω_D=u. Substitute these definitions into its completed identity.
2. For Re s>1 cancel the nonzero π^(−s)Γ(s) factor, retaining ζ(2s), the primitive half-sum and exactly u=#units/2. This is the uncompleted normalization comparison of the existing CM identity, not a second CM-period construction.
3. The lattice-to-ordinary-class choice is the same as that of the supplier; inverse-class ambiguity is harmless only after its conjugation/partial-zeta equality is supplied. Nonfundamental order discriminants are outside this field formula.

**Dependencies.** [`AnalyticNumberTheory:AN.4/cm-partial-zeta-period`](#cm-partial-zeta-period).

**Acceptance.** For D=−4, τ=i, u=2 and the single class, ζ_Q(i)(s)=2^s ζ(2s)E(i,s)/(2·4^(s/2))=ζ(2s)E(i,s). For D=−3 the unit factor is u=3, not1. A primitive form with nonfundamental discriminant−16 represents a nonmaximal order in Q(i); it cannot be substituted into this field-discriminant formula.

**Sources.** [Heegner points and derivatives of L-series](https://math.bu.edu/people/svh/GZ1.pdf), ChapterII§4, p.248, immediately after(4.1).

<a id="imaginary-genus-character-dictionary"></a>

#### Imaginary quadratic genus-character classification

`AnalyticNumberTheory:AN.4/imaginary-genus-character-dictionary` · theorem · `TauCeti.AnalyticNumberTheory.imaginary_genus_character_dictionary`.

For an imaginary quadratic field K of fundamental discriminant D<0, genus characters are homomorphisms Cl_K→{±1}, including the trivial homomorphism. They correspond bijectively to unordered fundamental-discriminant factorizations{D₁,D₂}, D=D₁D₂, one positive and one negative; permit the trivial discriminant1 with ε_1=1. For an integral ideal a prime to D, χ_{D₁,D₂}(a)=ε_{D₁}(N a)=ε_{D₂}(N a). This node is the arithmetic classification/compatibility dictionary. The analytic equality L_K(s,χ)=L(s,ε_{D₁})L(s,ε_{D₂}) is supplied by the existing genus_lseries_factorization node, not proved again here.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use the pinned genusCharFunNarrowClassGroupHom only with its actual hypotheses: distinct prime-discriminant data with at most one even prime discriminant, total product the fundamentalDiscriminant of the squarefree radicand, a chosen quadratic generator and subset of those prime discriminants.
2. Transport the homomorphism via the pinned toClassGroupEquiv under IsTotallyComplex K; this equivalence itself constructs no imaginary-quadratic instance.
3. Match subset/complement factorizations to the unordered pair{D₁,D₂}; prove the full surjectivity/kernel classification in the existing quadratic arithmetic owner. The two pinned constructions alone do not prove that every quadratic class character is a genus character of this form.
4. Match the prime-to-D ideal evaluation to the Kronecker characters with ε_1=1; invoke the separately owned analytic genus-factorization theorem when an L-series product is required.

**Dependencies.** `tauceti:TauCeti.Multiquadratic.genusCharFunNarrowClassGroupHom`, `tauceti:NumberField.NarrowClassGroup.toClassGroupEquiv`.

**Acceptance.** For D=−4 only{1,−4} occurs and the genus character is trivial. For D=−15 the pairs{1,−15} and{5,−3} give the two genus characters. An ideal of norm2 (prime to15) has value ε_5(2)=ε_−3(2)=−1 in the nontrivial case. The prime-to-D condition is essential: extending a Dirichlet character by0 at ramified primes cannot define a{±1}-valued class character there.

**Sources.** [Heegner points and derivatives of L-series](https://math.bu.edu/people/svh/GZ1.pdf), ChapterIV introduction after(0.3), p.268.

<a id="imaginary-quadratic-root-number-one"></a>

#### Imaginary quadratic completion and root number

`AnalyticNumberTheory:AN.4/imaginary-quadratic-root-number-one` · theorem · `TauCeti.AnalyticNumberTheory.imaginary_quadratic_root_number_one`.

For negative fundamental D, put δ=|D| and let ε_D be the canonical primitive odd Dirichlet character of Q(√D), of conductorδ. On Re s>1, Λ(s,ε_D)=(δ/π)^((s+1)/2)Γ((s+1)/2)L(s,ε_D). Its canonical entire continuation is δ^((s+1)/2)·DirichletCharacter.completedLFunction(ε_D,s). The new quadratic normalization assertion is that the root number is+1 and Λ(1−s,ε_D)=Λ(s,ε_D). Entire continuation of a nontrivial Dirichlet completed function is already in Mathlib; no duplicate continuation construction is planned.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Import the nontrivial-character differentiability of the pinned completedLFunction and its primitive functional equation. The library completion omits the conductor power, so multiply byδ^((s+1)/2) with the real logarithm ofδ>0.
2. Compare ζ_K=ζ_Q L(s,ε_D), first on Re s>1 then as canonical meromorphic functions, to the number-field completed functional equation. Γ_C(s)/Γ_R(s) and the duplication identity give the oddΓ_R(s+1) branch. The canonical odd character/conductor identification is required.
3. Cancel on a nonzero open half-plane to obtain root+1, then use analytic continuation. Do not infer the sign from |rootNumber|=1 or evaluate a totalizedΓ·L product at a cancelled pole. The existing normalization gap records this comparison proof.

**Dependencies.** `mathlib:DirichletCharacter.differentiable_completedLFunction`, `mathlib:DirichletCharacter.IsPrimitive.completedLFunction_one_sub`, [`AnalyticNumberTheory:AN.4/quadratic-zeta-factorization`](#quadratic-zeta-factorization), [`AnalyticNumberTheory:AN.4/dedekind-completed-functional-equation`](#dedekind-completed-functional-equation).

**Acceptance.** At D=−4 the conductor is4, the character is odd and Λ(0)=Λ(1)=1; at D=−3 both endpoints are1/√3. Mathlib’s unnormalized completed function alone has the conductor factorδ^(s−1/2) in its functional equation; that factor cancels only after multiplying by the specified conductor power. The completion is its canonical entire continuation. At negative odd integers, a divergent gamma factor times a vanishing L-value must not be assigned the naive product value0.

**Sources.** [Heegner points and derivatives of L-series](https://math.bu.edu/people/svh/GZ1.pdf), ChapterIV§4, p.282, proof of(4.1), and§5 p.290 after(5.4).

<a id="imaginary-quadratic-lvalue-one"></a>

#### Imaginary quadratic class-number value at one

`AnalyticNumberTheory:AN.4/imaginary-quadratic-lvalue-one` · theorem · `TauCeti.AnalyticNumberTheory.imaginary_quadratic_lvalue_one`.

For an imaginary quadratic field of fundamental discriminant D<0, δ=|D|, class number h and w=2u roots of unity, L(1,ε_D)=πh/(u√δ).

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use the existing quadratic-residue quotient L(1,ε_D)=κ_K/κ_Q, where κ_Q=1 and the continued functions agree with the norm-indexed library series on Re s>1.
2. Read the pinned residue formula2^r₁(2π)^r₂ R_K h_K/(w_K√δ). For imaginary quadratic K, r₁=0,r₂=1,R_K=1,w_K=2u, giving πh/(u√δ).
3. Retain the arithmetic regulator/embedding-count dictionaries and continuation adapter; the library’s one-sided real residue limit alone does not prove all these comparisons.

**Dependencies.** [`AnalyticNumberTheory:AN.4/quadratic-residue-quotient`](#quadratic-residue-quotient), [`AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`](#dedekind-zeta-continuation-and-residue), `mathlib:NumberField.dedekindZeta_residue`.

**Acceptance.** D=−4 gives L(1,ε_−4)=π/4 (h=1,u=2). D=−3 gives L(1,ε_−3)=π/(3√3) (h=1,u=3). For h,u>0 this value is positive; confusing roots of unity w with half-units u loses a factor2.

**Sources.** [Heegner points and derivatives of L-series](https://math.bu.edu/people/svh/GZ1.pdf), ChapterIV§4 pp.283–284, Propositions(4.4)–(4.5), implicit class-number substitution.

<a id="imaginary-quadratic-lvalue-zero"></a>

#### Imaginary quadratic class-number value at zero

`AnalyticNumberTheory:AN.4/imaginary-quadratic-lvalue-zero` · theorem · `TauCeti.AnalyticNumberTheory.imaginary_quadratic_lvalue_zero`.

With the same imaginary quadratic data, the canonical continued primitive Dirichlet function satisfies L(0,ε_D)=h/u.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use the canonical root-number-one continuation from imaginary_quadratic_root_number_one, not a pointwise product at a gamma pole.
2. At0 and1 the gamma factors are regular; Γ(1/2)=√π andΓ(1)=1 give Λ(0)=√δ L(0) andΛ(1)=(δ/π)L(1).
3. Insert L(1)=πh/(u√δ) from imaginary_quadratic_lvalue_one, obtaining L(0)=h/u. Both gamma values are pinned library declarations.

**Dependencies.** [`AnalyticNumberTheory:AN.4/imaginary-quadratic-root-number-one`](#imaginary-quadratic-root-number-one), [`AnalyticNumberTheory:AN.4/imaginary-quadratic-lvalue-one`](#imaginary-quadratic-lvalue-one), `mathlib:Complex.Gamma_one`, `mathlib:Complex.Gamma_one_half_eq`.

**Acceptance.** D=−4 gives L(0,ε_−4)=1/2; D=−3 gives L(0,ε_−3)=1/3. For D=−15, h=2,u=1, hence L(0,ε_−15)=2. This is for odd characters from negative fundamental discriminants. An even nontrivial quadratic character has a trivial zero at0 and cannot satisfy this formula.

**Sources.** [Heegner points and derivatives of L-series](https://math.bu.edu/people/svh/GZ1.pdf), ChapterIV§4 pp.283–284, implicit special-value substitution.

### Hecke boundary theory and completion

<a id="hecke-L-function-euler-product-comparison"></a>

#### Hecke series and Tate integral comparison

`AnalyticNumberTheory:AN.4/hecke-L-function-euler-product-comparison` · comparison · `TauCeti.AnalyticNumberTheory.hecke_L_function_euler_product_comparison`.

Let K be a number field, c a unitary idele-class character unramified outside a finite set S containing every archimedean place, and χ its ideal-character presentation from GlobalNumberFields Layer9. Choose Tate's admissible factorizable f with f_v=1_{O_v} for v∉S. For Re(s)>1, Z(f,c|·|^s)=(∏_{v∈S}Z_v(f_v,c_v|·|_v^s))(∏_{v∉S}N(d_v)^(−1/2))L_S(s,χ), where L_S(s,χ)=∑_{a integral, prime to S}χ(a)N(a)^(−s)=∏_{v∉S}(1−χ(v)N(v)^(−s))⁻¹. d_v is the local different; its product is finite because d_v is a unit at almost all places. Haar and Fourier normalizations are Tate's, not silently normalized unit volumes.

**Hypotheses.** K a number field; c unitary and trivial on K×; S finite containing infinity and all ramification of c; f admissible in Tate's Z1–Z3 class with the stated local factors; Re(s)>1.

**Construction and proof.**

1. Import the canonical Hecke character and its local/ideal dictionary from GlobalNumberFields Layer9.
2. At v∉S, compute the local integral as the convergent geometric series N(d_v)^(−1/2)∑_{j≥0}χ(v)^j N(v)^(−js).
3. Import the AL.1 global zeta-integral factorization, with the AL.0 measures and Fourier convention, and multiply the local formulas.
4. Use ADS Layer3 to identify the ideal Euler product with the absolutely convergent ideal series. Exact norm regrouping and admissibility hypotheses are required imports, not new carriers here.
5. The completed functional equation is now AN.4/hecke-primitive-functional-equation, stated as an identity of meromorphic functions from AL.1/hecke-l-functional-equation; no local factor is cancelled at its zeros.

**Dependencies.** `AutomorphicLFunctionsAndLocalFactors:AL.0`, `AutomorphicLFunctionsAndLocalFactors:AL.1/global-zeta-integral`, `AutomorphicLFunctionsAndLocalFactors:AL.1/completed-hecke-l-function`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products`.

**Acceptance.** For K=ℚ and trivial c, the unramified arithmetic series is ζ with exactly the S Euler factors removed. Ramified different factors N(d_v)^(−1/2) are retained. The character is an imported idele-class character, not an arbitrary list of local factors.

**Sources.** [Fourier analysis in number fields and Hecke's zeta-functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §4.5, thesis p.(4.23), scan p.57; comparison and continuation discussion scan pp.58–59.

<a id="landau-nonnegative-logarithm"></a>

#### Hecke boundary adapter for Landau positivity

`AnalyticNumberTheory:AN.4/landau-nonnegative-logarithm` · comparison · `TauCeti.AnalyticNumberTheory.ne_zero_of_log_nonneg_coeff`.

For a continued Hecke product F meromorphic near Re s≥1, with no poles except a pole of order at most one at 1, nonnegative norm-regrouped logarithmic coefficients on Re s>1 imply: F has no zeros at regular points of Re s≥1, and its meromorphic order at 1 is ≤0. A pole is not a nonzero finite value.

**Hypotheses.** Coefficients a_n real and nonnegative; the Dirichlet series may be indexed by ideals after regrouping by norm.

**Construction and proof.**

1. Import the generic Landau positivity and 3-4-1 boundary theorem from ADS Layer 8, rather than constructing it again.
2. Check that the Hecke product satisfies the imported pole-order and logarithmic-coefficient hypotheses; the separate ray-class orthogonality lemma supplies the coefficients.
3. At a regular point interpret order zero as nonvanishing; at 1 permit a pole, and use the real positive limit when the singularity is removable.

**Dependencies.** `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-8-landau-type-positivity`.

**Acceptance.** A simple pole at 1 is allowed; no value F(1) is asserted there. A removable value at 1 is at least 1 in the logarithmic normalization. No new generic Landau theorem is owned here.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §3.3, Lemma 3.6 and Exercise 3.6.1, printed pp. 19 and 21.

<a id="ray-class-product-nonvanishing"></a>

#### Ray-class product has no boundary zeros

`AnalyticNumberTheory:AN.4/ray-class-product-nonvanishing` · lemma · `TauCeti.AnalyticNumberTheory.rayClassProduct_ne_zero`.

For the finite character group of a ray class quotient, the product of the continued Hecke L-functions has no zeros at regular points of Re s≥1. At s=1 it has meromorphic order ≤0, permitting the principal-character pole. Each Euler logarithmic coefficient is nonnegative by finite-character orthogonality, with bad-prime factors treated separately.

**Hypotheses.** K a number field; 𝔪 a modulus (an integral ideal times a set of real places); χ a character of the ray class group Cl_𝔪(K) (finite order), identified with a finite-order idele-class character ω_χ by GlobalNumberFields Layer 9; L(s, χ) = Σ_{(𝔞,𝔪)=1} χ(𝔞)N𝔞^{−s} for Re s > 1.

**Construction and proof.**

1. Expand the logarithm of the convergent Euler products on Re s>1.
2. Use finite-character orthogonality, separately planned below, to obtain nonnegative coefficients.
3. Apply the Hecke boundary adapter with the single principal-character pole and holomorphy of every other factor.

**Dependencies.** [`AnalyticNumberTheory:AN.4/landau-nonnegative-logarithm`](#landau-nonnegative-logarithm), [`AnalyticNumberTheory:AN.4/hecke-primitive-functional-equation`](#hecke-primitive-functional-equation), [`AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`](#dedekind-zeta-continuation-and-residue), [`AnalyticNumberTheory:AN.4/ray-character-log-coefficients`](#ray-character-log-coefficients).

**Acceptance.** Check K = ℚ, 𝔪 = N·∞: f_𝔪 is the product of all Dirichlet L-series of level N (Kedlaya Theorem 3.7).

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §3.3, Theorem 3.7 and (3.3.1), printed p. 19.

<a id="hecke-nonvanishing-on-line-one"></a>

#### Hecke L-functions do not vanish on Re s = 1

`AnalyticNumberTheory:AN.4/hecke-nonvanishing-on-line-one` · theorem · `TauCeti.AnalyticNumberTheory.heckeL_ne_zero_of_re_eq_one`.

For every character χ of Cl_𝔪(K): L(s, χ) ≠ 0 for Re s = 1, s ≠ 1; and L(1, χ) ≠ 0 if χ ≠ 1 (for χ = 1, L(s, 1) has a simple pole at s = 1).

**Hypotheses.** K a number field; 𝔪 a modulus (an integral ideal times a set of real places); χ a character of the ray class group Cl_𝔪(K) (finite order), identified with a finite-order idele-class character ω_χ by GlobalNumberFields Layer 9; L(s, χ) = Σ_{(𝔞,𝔪)=1} χ(𝔞)N𝔞^{−s} for Re s > 1.

**Construction and proof.**

1. Away from1 use the ray-character product and holomorphy of each factor.
2. At1 use the separate nonreal-character cancellation and quadratic Landau contradiction lemmas; the auxiliary zero at1/2 has order at least1, not necessarily exactly1.

**Dependencies.** [`AnalyticNumberTheory:AN.4/ray-class-product-nonvanishing`](#ray-class-product-nonvanishing), [`AnalyticNumberTheory:AN.4/landau-nonnegative-logarithm`](#landau-nonnegative-logarithm), [`AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`](#dedekind-zeta-continuation-and-residue), `mathlib:LSeries.positive`, `mathlib:DirichletCharacter.LFunction_ne_zero_of_one_le_re`, [`AnalyticNumberTheory:AN.4/nonreal-hecke-at-one`](#nonreal-hecke-at-one), [`AnalyticNumberTheory:AN.4/quadratic-landau-contradiction`](#quadratic-landau-contradiction).

**Acceptance.** Check K = ℚ against Mathlib: DirichletCharacter.LFunction_ne_zero_of_one_le_re. Check the need for a separate argument at s = 1 for real χ: χ = χ̄ gives only one zero against the pole, so the product argument alone does not decide it.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §3.3–§3.4, Theorems 3.8, 3.10 and 3.11, printed pp. 19–20; [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.5, Theorem 22.4, printed p. 129.

**Atlas planet.** Nonvanishing of Hecke L-functions.

<a id="dedekind-zeta-continuation-and-residue"></a>

#### Dedekind continuation and real-side comparison

`AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue` · comparison · `TauCeti.AnalyticNumberTheory.dedekindZeta_meromorphic`.

The Dedekind function supplied by the trivial-character Tate continuation agrees with NumberField.dedekindZeta K on Re s>1. Its complex residue at 1 equals NumberField.dedekindZeta_residue K, by agreement with the pinned real one-sided residue limit and uniqueness of a meromorphic residue. This is an agreement theorem on the convergence half-plane, not equality with the totalized LSeries everywhere.

**Hypotheses.** K a number field with r₁ real and r₂ complex places.

**Construction and proof.**

1. Import the trivial-character continuation from AL.1 and use the ideal Euler-product comparison on Re s>1.
2. Multiply the continued function by s−1 and remove the simple singularity.
3. Take its real right-hand limit using the pinned Dedekind residue theorem; uniqueness of the continuous extension identifies the complex residue.

**Dependencies.** `AutomorphicLFunctionsAndLocalFactors:AL.1/tate-global-functional-equation`, `AutomorphicLFunctionsAndLocalFactors:AL.1/global-zeta-integral`, `AutomorphicLFunctionsAndLocalFactors:AL.1/idele-class-volume`, `mathlib:NumberField.dedekindZeta`, `mathlib:NumberField.dedekindZeta_residue`, `mathlib:NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`, `mathlib:Complex.Gammaℝ`, `mathlib:Complex.Gammaℂ`.

**Acceptance.** No evaluation of the totalized LSeries at −2 is used. For Q(i), the positive residue expression is π/4. The completed functional equation and trivial zeros are separate declarations.

**Sources.** [Fourier analysis in number fields and Hecke's zeta-functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §4.4 Main Theorem 4.4.1 and §4.5, physical pp. 50–58 (read on page images, cc-39fac3).

<a id="hecke-primitive-functional-equation"></a>

#### Primitive Hecke functional-equation normalization

`AnalyticNumberTheory:AN.4/hecke-primitive-functional-equation` · comparison · `TauCeti.AnalyticNumberTheory.heckeL_functional_equation`.

For a primitive finite-order Hecke character χ with finite conductor f and the imported archimedean parity data, the canonical continued L-function, multiplied by the conductor/discriminant and the real/complex gamma factors in AL.1, satisfies Λ(s,χ)=ε(χ)Λ(1−s,χ̄) as a meromorphic identity. The principal character retains the two completed poles. Imprimitive deleted factors are a separate comparison.

**Hypotheses.** K a number field; 𝔪 a modulus (an integral ideal times a set of real places); χ a character of the ray class group Cl_𝔪(K) (finite order), identified with a finite-order idele-class character ω_χ by GlobalNumberFields Layer 9; L(s, χ) = Σ_{(𝔞,𝔪)=1} χ(𝔞)N𝔞^{−s} for Re s > 1. χ primitive of conductor 𝔣 for the functional equation.

**Construction and proof.**

1. Import AL.1/hecke-l-functional-equation on its canonical completed carrier.
2. Use the Re s>1 comparison to identify the finite Euler product, retaining the different and Haar constants.
3. Transport the identity using the identity theorem; do not claim a new Tate functional-equation proof.

**Dependencies.** `AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation`, `AutomorphicLFunctionsAndLocalFactors:AL.1/completed-hecke-l-function`, `AutomorphicLFunctionsAndLocalFactors:AL.1/global-epsilon-factor`, [`AnalyticNumberTheory:AN.4/hecke-L-function-euler-product-comparison`](#hecke-L-function-euler-product-comparison), `mathlib:DirichletCharacter.IsPrimitive.completedLFunction_one_sub`.

**Acceptance.** For K = ℚ and a primitive Dirichlet character χ of positive conductor N, distinguish the conductor-completed meromorphic function Λ(s,χ)=N^(s/2)·DirichletCharacter.completedLFunction χ s from Mathlib’s completedLFunction, which omits that conductor power. Mathlib states completedLFunction χ (1−s)=N^(s−1/2)·rootNumber χ·completedLFunction χ⁻¹ s. Multiplying by N^((1−s)/2) gives Λ(1−s,χ)=rootNumber χ·Λ(s,χ⁻¹); compare orientations before identifying ε(χ). At poles use meromorphic identities, not a product of totalized point values. Check that an imprimitive character's L-function acquires zeros on Re s = 0 from the removed Euler factors, which is why the functional equation is stated only for the primitive function.

**Sources.** [Fourier analysis in number fields and Hecke's zeta-functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §4.5, physical pp. 57–59 (read on page images, cc-39fac3).

<a id="mth-root-gluing"></a>

#### Gluing m-th roots across the line Re s = 1

`AnalyticNumberTheory:AN.4/mth-root-gluing` · lemma · `TauCeti.AnalyticNumberTheory.extend_of_pow_eq`.

Let f be holomorphic and zero-free on {Re s > 1}, m ≥ 1, and U an open set containing {Re s = 1} ∖ {1} on which a holomorphic, zero-free g is given with g = f^m on U ∩ {Re s > 1}. Then f extends holomorphically (and zero-free) to {Re s > 1} ∪ U′ for an open U′ ⊇ {Re s = 1} ∖ {1}: on each disc D ⊆ U centred on the line there is a unique holomorphic h_D with h_D^m = g agreeing with f on the connected set D ∩ {Re s > 1}, and the h_D agree on overlaps.

**Hypotheses.** Discs D centred at points of Re s = 1 with D ⊆ U; D ∩ {Re s > 1} is a nonempty half-disc, hence connected.

**Construction and proof.**

1. On the simply connected D, g has m holomorphic m-th roots, differing by m-th roots of unity; exactly one agrees with f at a point of D ∩ {Re s > 1}, hence on all of it (identity theorem on the connected half-disc).
2. On D ∩ D′ ∩ {Re s > 1} ≠ ∅ both roots equal f, so they agree on the connected D ∩ D′ (a lens, connected) by the identity theorem.

**Dependencies.** `mathlib:Complex.exp`, `mathlib:AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, [`AnalyticNumberTheory:AN.4/analytic-root-on-disc`](#analytic-root-on-disc), [`AnalyticNumberTheory:AN.4/boundary-disc-overlap`](#boundary-disc-overlap).

**Acceptance.** Check that zero-freeness of g is needed: g = (s − 1 − i)·u with u a unit has no square root near 1 + i.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.5, proof of Theorem 22.4, printed p. 129.

<a id="ray-character-log-coefficients"></a>

#### Nonnegative ray-character logarithmic coefficients

`AnalyticNumberTheory:AN.4/ray-character-log-coefficients` · lemma · `TauCeti.AnalyticNumberTheory.ray_character_log_coefficients`.

For a finite abelian ray-class quotient H and its full complex character group Ĥ, for h∈H and an integer k≥1, Σ_{χ∈Ĥ}χ(h^k) is #H if h^k=1 and 0 otherwise. On Re s>1 the contribution of an allowed prime ideal 𝔭 to log ∏_χL(s,χ) is Σ_{k≥1}(Σ_χχ([𝔭]^k))/k · N𝔭^(−ks). Thus these logarithmic coefficients are nonnegative after norm regrouping, with bad primes omitted consistently.

**Construction and proof.**

1. Use the actual finite abelian ray quotient and its complete dual: sum χ(h^k)=#H when h^k=1 and0 otherwise. This orthogonality is an explicit GNF9 supplier requirement, not an inference from the special Dirichlet-character theorem.
2. Choose the Euler logarithm that tends to0 as Re s→∞. Its prime-power expansion is absolutely locally uniformly convergent on Re s>1, includes1/k and may be interchanged with the finite character sum.
3. Regroup nonnegative real coefficients by the positive integer norm (with coefficient0 at norm0); ideals sharing the same norm are added. A common finite modulus removes the same bad prime set for every character, including the principal one.

**Dependencies.** `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products`.

**Acceptance.** For the trivial group, the local coefficients at powers k=1 and k=2 are 1 and 1/2, respectively. If h^k≠1 the character sum is zero; if h^k=1 the coefficient is #H/k.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §3.3 Theorem3.7 p.19 equation(3.3.1), corrected by E18.

<a id="nonreal-hecke-at-one"></a>

#### Nonreal Hecke characters are nonzero at one

`AnalyticNumberTheory:AN.4/nonreal-hecke-at-one` · lemma · `TauCeti.AnalyticNumberTheory.nonreal_hecke_at_one`.

For a finite-order ray character χ with χ≠χ̄, its canonical L(1,χ) is nonzero.

**Construction and proof.**

1. Match conjugation of the continued Hecke functions at real s=1; the distinct χ and χ̄ factors have the same positive zero order if either vanishes.
2. All nonprincipal factors are holomorphic at1 and the principal incomplete factor has exactly one pole of order1 (its deleted local polynomials are nonzero at1). Thus the full ray product would have total order≥1.
3. The existing ray-product Landau corollary prohibits a zero at1 and therefore prohibits that positive total order. This argument does not require Artin holomorphy.

**Dependencies.** [`AnalyticNumberTheory:AN.4/ray-class-product-nonvanishing`](#ray-class-product-nonvanishing), `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, [`AnalyticNumberTheory:AN.4/hecke-L-function-euler-product-comparison`](#hecke-L-function-euler-product-comparison), [`AnalyticNumberTheory:AN.4/hecke-primitive-functional-equation`](#hecke-primitive-functional-equation), [`AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`](#dedekind-zeta-continuation-and-residue).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §3.4 Theorem3.10 p.19 full proof.

<a id="quadratic-auxiliary-positive-factors"></a>

#### Positive quadratic auxiliary Euler factors

`AnalyticNumberTheory:AN.4/quadratic-auxiliary-positive-factors` · lemma · `TauCeti.AnalyticNumberTheory.quadratic_auxiliary_positive_factors`.

For a nonprincipal quadratic Hecke character χ, Ψ(s)=L(s,χ)ζ_K(s)/ζ_K(2s) has, on Re s>1, local factors (1+x)/(1−x) when χ(p)=1, 1 when χ(p)=−1, and1+x at omitted character primes, x=(Np)^−s. Hence its norm-regrouped Dirichlet coefficients are nonnegative.

**Construction and proof.**

1. At every p put x=(Np)^−s. The ζ_K(s)/ζ_K(2s) factor is1+x. Multiply by1/(1−χ(p)x), taking χ(p)=0 at character-conductor primes. This gives (1+x)/(1−x),1,1+x in the split/inert/conductor cases.
2. The respective power series have coefficients1+2Σ_{k≥1}x^k,1,1+x. Every coefficient is real nonnegative and the unit-ideal coefficient is1. Multiply finite products using unique ideal factorization, then pass to absolute convergence and sum the finite norm fibres.
3. This packet uses the full ζ_K quotient; the source instead deletes the common level primes in its principal L-functions. Retaining1+x at omitted character primes is the correct full-zeta generalization.

**Dependencies.** [`AnalyticNumberTheory:AN.4/hecke-L-function-euler-product-comparison`](#hecke-L-function-euler-product-comparison), [`AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`](#dedekind-zeta-continuation-and-residue), `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products`, `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-1-norm-fibres-and-mathlib-lseries`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §3.4 Theorem3.11 p.20 displayed quadratic auxiliary product.

<a id="quadratic-auxiliary-holomorphy"></a>

#### Auxiliary holomorphy under vanishing at one

`AnalyticNumberTheory:AN.4/quadratic-auxiliary-holomorphy` · lemma · `TauCeti.AnalyticNumberTheory.quadratic_auxiliary_holomorphy`.

If L(1,χ)=0 for the preceding quadratic character, Ψ extends holomorphically to Re s>1/2. Indeed ζ_K(2s) is nonzero there because Re(2s)>1, and the numerator’s zero cancels ζ_K’s pole at1. At s=1/2, Ψ extends with a zero of order at least1.

**Construction and proof.**

1. L(s,χ) is entire for nonprincipal finite-order χ; ζ_K has only its simple pole at1. Under L(1,χ)=0 the numerator therefore extends holomorphically there.
2. For Re s>1/2 the denominator ζ_K(2s) is nonzero by its convergent Euler product, so the quotient is holomorphic.
3. The reciprocal of ζ_K(2s) has a simple zero at s=1/2 with leading coefficient2/Res_{u=1}ζ_K(u). The numerator is holomorphic at1/2, hence the quotient is holomorphic there and vanishes, with order≥1 unless it is locally identically zero. The original Euler product shows it is not identically zero. No nonzero numerator value or simple quotient zero is presumed.

**Dependencies.** [`AnalyticNumberTheory:AN.4/quadratic-auxiliary-positive-factors`](#quadratic-auxiliary-positive-factors), [`AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`](#dedekind-zeta-continuation-and-residue), [`AnalyticNumberTheory:AN.4/hecke-primitive-functional-equation`](#hecke-primitive-functional-equation).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §3.4 Theorem3.11 p.20 pole-cancellation paragraph.

<a id="quadratic-landau-contradiction"></a>

#### Landau contradiction for a quadratic character

`AnalyticNumberTheory:AN.4/quadratic-landau-contradiction` · lemma · `TauCeti.AnalyticNumberTheory.quadratic_landau_contradiction`.

For a nonprincipal quadratic Hecke character χ, L(1,χ)≠0. If it vanished, the nonnegative Dirichlet series of Ψ from the quadratic auxiliary positive factors target would have abscissa≤1/2 by ADS8 Landau and the quadratic auxiliary holomorphy target holomorphy. For every real σ>1/2 its value would then satisfy Ψ(σ)≥1, while the quadratic auxiliary holomorphy target gives lim_{σ↓1/2}Ψ(σ)=0, a contradiction. No convergence or sum identity at σ=1/2 is required.

**Construction and proof.**

1. The series converges for Re s>1, so its abscissa is not +∞. If its finite abscissa a were>1/2, Landau would force a singularity at the real point a, contradicting the quadratic auxiliary holomorphy target. An abscissa of −∞ already supplies all these real convergence points. Hence the abscissa is≤1/2.
2. For each real σ>1/2, use the canonical continued-series identity on the connected half-plane and nonnegative coefficients with unit coefficient1 to prove Ψ(σ)≥1.
3. Continuity of the holomorphic extension at1/2 gives its right limit0. For σ sufficiently close to1/2 this contradicts Ψ(σ)≥1. The proof never uses a boundary series sum or an unjustified boundary-convergence claim.

**Dependencies.** [`AnalyticNumberTheory:AN.4/quadratic-auxiliary-positive-factors`](#quadratic-auxiliary-positive-factors), [`AnalyticNumberTheory:AN.4/quadratic-auxiliary-holomorphy`](#quadratic-auxiliary-holomorphy), `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-8-landau-type-positivity`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §3.4 Theorem3.11 p.20 complete proof and §2.1 Theorem2.4 p.12 proof.

<a id="analytic-root-on-disc"></a>

#### Analytic root on a nonvanishing disc

`AnalyticNumberTheory:AN.4/analytic-root-on-disc` · lemma · `TauCeti.AnalyticNumberTheory.analytic_root_on_disc`.

Let D=Metric.ball(a,r)⊆C with r>0,F analytic on D and F(z)≠0 there,m∈N with m≥1,z₀∈D and w₀^m=F(z₀). There exists an analytic R on D with R(z)^m=F(z) for every z∈D and R(z₀)=w₀. Any analytic S with the same powers and value at z₀ equals R throughout D.

**Construction and proof.**

1. The nonempty open disc is simply connected. Apply the existing Complex.exists_continuousOn_eqOn_exp_comp to F and upgrade its continuous logarithm L to analytic using the continuous log analytic upgrade target.
2. Put R₀=exp(L/m). Since R₀ never vanishes and R₀(z₀)^m=F(z₀), c=w₀/R₀(z₀) has c^m=1. Define R=c R₀; it has the desired power and value without assuming an arbitrary principal-root branch.
3. The quotient S/R is continuous and lies in the finite set of mth roots of unity. Connectedness of D makes it constant; its value1 at z₀ proves uniqueness. The finite-root/discrete-image adapter remains formal work, not a newly formalized canonical root carrier.

**Dependencies.** [`AnalyticNumberTheory:AN.2/continuous-log-analytic-upgrade`](#continuous-log-analytic-upgrade), `mathlib:Complex.exists_continuousOn_eqOn_exp_comp`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.5 Theorem22.4 p.129 root-gluing sketch.

<a id="boundary-disc-overlap"></a>

#### Overlaps of boundary-centred discs

`AnalyticNumberTheory:AN.4/boundary-disc-overlap` · lemma · `TauCeti.AnalyticNumberTheory.boundary_disc_overlap`.

If two open complex discs centred on Re s=1 intersect, their intersection is connected and contains a point with Re s>1.

**Construction and proof.**

1. Each open disc is convex as a real subset of C; their intersection is convex, hence preconnected and connected when nonempty.
2. Take z in the intersection. If Re z>1 it is the required point. If Re z<1, use z′=2−conj z; centres on Re=1 make both distances unchanged and Re z′>1.
3. If Re z=1, choose a positive real shift smaller than min(r−|z−a|,q−|z−b|). The triangle inequality preserves both strict ball inequalities and puts the shifted point to the right.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf), §22.5 Theorem22.4 p.129 patching sentence; expanded geometric input.

<a id="dedekind-completed-functional-equation"></a>

#### Dedekind completed-functional-equation comparison

`AnalyticNumberTheory:AN.4/dedekind-completed-functional-equation` · lemma · `TauCeti.AnalyticNumberTheory.dedekind_completed_functional_equation`.

For a number field K with absolute discriminant D_K, r₁ real places and r₂ conjugate pairs of complex places, let Γ_R(s)=π^(−s/2)Γ(s/2) and Γ_C(s)=2(2π)^(−s)Γ(s), the pinned Complex.Gammaℝ and Complex.Gammaℂ. The canonical continuation supplied by Tate has Λ_K(s)=|D_K|^(s/2)Γ_R(s)^r₁Γ_C(s)^r₂ζ_K^cont(s), and Λ_K(1−s)=Λ_K(s) as meromorphic functions. No equality of totalized values at poles is asserted.

**Construction and proof.**

1. Import AL.1 global Tate functional equation, archimedean local factors and unramified finite factors, using the standard trace additive character and its self-dual measure.
2. At finite places the inverse different supplies |D_K|^(s/2); the conductor of the trivial character is the unit ideal. Compare Tate’s local constants with the displayed pinned gamma convention; s-independent constants cancel from the functional equation.
3. Use the Dedekind convergence-half-plane comparison to identify the continuation. The measure/different adapter is recorded as an open gap, rather than supplied by the global integral equation alone.

**Dependencies.** [`AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`](#dedekind-zeta-continuation-and-residue), `AutomorphicLFunctionsAndLocalFactors:AL.1/tate-global-functional-equation`, `AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory`, `AutomorphicLFunctionsAndLocalFactors:AL.1/unramified-local-theory`.

**Acceptance.** K=Q recovers the pinned completed Riemann functional equation away from its poles. An imaginary quadratic field has one Γ_C factor and no Γ_R factors; its discriminant power is |D_K|^(s/2).

**Sources.** [Fourier analysis in number fields and Hecke's zeta-functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §4.5, scan pp.56–59, especially (4.24) on scan p.58; local factors tabulated in §2.5.

<a id="dedekind-negative-even-zero"></a>

#### Negative even zeros of the continuation

`AnalyticNumberTheory:AN.4/dedekind-negative-even-zero` · lemma · `TauCeti.AnalyticNumberTheory.dedekind_negative_even_zero`.

For a number field K and every integer n≥1, the canonical holomorphic Dedekind continuation at −2n has a zero of exact order r₁+r₂, where r₁ and r₂ are its real-place and complex-pair counts. In particular ζ_K^cont(−2n)=0, since r₁+r₂≥1. This evaluates the continuation, not the pinned totalized ideal LSeries.

**Construction and proof.**

1. At 1+2n the ideal series converges to a strictly positive real number: its terms are nonnegative and the unit ideal contributes 1. Gamma factors and the discriminant factor there are finite and nonzero.
2. Reflect via the completed meromorphic functional equation. Each Γ_R and Γ_C factor has a simple pole at −2n, with nonzero residue; the product has order −(r₁+r₂).
3. Add meromorphic orders to get order r₁+r₂ for ζ_K^cont, using r₁+2r₂=[K:Q]≥1. Pinned gamma junk values at the poles cannot substitute for this germ calculation.

**Dependencies.** [`AnalyticNumberTheory:AN.4/dedekind-completed-functional-equation`](#dedekind-completed-functional-equation), [`AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`](#dedekind-zeta-continuation-and-residue), `AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory`.

**Acceptance.** For Q the order is 1, agreeing with the already implemented negative-even Riemann zeros. For a real quadratic field the order is 2, whereas for an imaginary quadratic field it is 1.

**Sources.** [Fourier analysis in number fields and Hecke's zeta-functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §4.5 equation on scan p.58, with §2.5 archimedean factors; derived negative-even specialization.

<a id="imprimitive-hecke-factors"></a>

#### Imprimitive Hecke deleted factors

`AnalyticNumberTheory:AN.4/imprimitive-hecke-factors` · lemma · `TauCeti.AnalyticNumberTheory.imprimitive_hecke_factors`.

Let χ be the ray ideal character modulo a modulus m induced from a primitive finite-order Hecke character χ₀ of conductor f₀ dividing m. If m_fin is the finite part, then L_m^cont(s,χ)=L^cont(s,χ₀)∏_{p|m_fin, p∤f₀_fin}(1−χ₀(p)exp(−s log Np)). Each prime occurs once even if its exponent in m grows; real-place conditions enter the conductor dictionary but do not delete finite Euler factors. Equality is meromorphic.

**Construction and proof.**

1. Import the GlobalNumberFields ray-character/conductor dictionary and the primitive half-plane Hecke Euler-product comparison.
2. In the absolutely convergent half-plane Re s>1, remove exactly the Euler factors for finite primes dividing m but not f₀. Finite multiplicative regrouping retains one factor per prime.
3. Apply uniqueness of meromorphic continuation, keeping the possible trivial-character pole at 1 and removable zeros of the finite correction.

**Dependencies.** [`AnalyticNumberTheory:AN.4/hecke-primitive-functional-equation`](#hecke-primitive-functional-equation), `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`, [`AnalyticNumberTheory:AN.4/hecke-L-function-euler-product-comparison`](#hecke-L-function-euler-product-comparison).

**Acceptance.** For K=Q and primitive trivial character, agree with Mathlib’s principal-character finite Euler correction. Changing a finite modulus p to p² deletes the same single factor; an added real place creates no new finite prime factor.

**Sources.** [Fourier analysis in number fields and Hecke's zeta-functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf), §4.5, scan p.57, Euler product over finite primes outside S.

## AN.5 — Multiplicative functions and value distribution

### Divisor bounds and arithmetic coefficients

<a id="medium-prime-products"></a>

#### Products of distinct medium primes

`AnalyticNumberTheory:AN.5/medium-prime-products` · definition · `TauCeti.AnalyticNumberTheory.medium_prime_products`.

For x≥2 and m≥0, N_m(x) is the finite set of natural products over m-element subsets of {p prime:x/2≤p≤x}. N_0(x)={1}; subsets are unordered and primes are distinct.

**Construction and proof.**

1. Form the finite prime set P_x={p∈ℕ: p prime, x/2≤p≤x} using the inclusive floor cutoff, and take the image of its m-element subsets under their natural product.
2. Use Nat.primeFactors_prod to recover a subset from its product, hence prove injection. Pinned finite-image and powersetCard cardinality theorems supply the card API; no second factorization theory is needed.
3. The product over an empty subset is 1. The support and squarefree APIs follow from the same finite prime product and its recovered factor set.

**Dependencies.** `mathlib:Nat.primeFactors_prod`, `mathlib:Finset.card_powersetCard`, `mathlib:Finset.card_image_of_injOn`.

**API.**

- `medium_prime_products.membership` (characterisation): n∈N_m(x) iff n is a product of an m-element subset of primes in [x/2,x].
- `medium_prime_products.card` (relation): Unique factorization gives #N_m(x)=binomial(#{p prime:x/2≤p≤x},m).
- `medium_prime_products.squarefree` (projection): Every element is squarefree with exactly m prime factors.
- `medium_prime_products.support` (projection): Every prime factor lies in the closed interval [x/2,x].
- `medium_prime_products.zero` (simp): For every x≥2, N_0(x)={1}.
- `medium_prime_products.size_bounds` (projection): For x≥2, m≥0 and n∈N_m(x), (x/2)^m≤n≤x^m, with the natural n cast to the reals.

**Unit tests.**

- `medium_prime_products.zero` (computation): N_0(10)={1}.
- `medium_prime_products.one` (computation): N_1(10)={5,7}.
- `medium_prime_products.two` (computation): N_2(10)={35} and N_3(10)=∅.
- `medium_prime_products.distinct` (computation): 25∉N_2(10), excluding repeated primes and ordered-tuple multiplicity.
- `medium_prime_products.closed_lower_endpoint` (computation): N_1(4)={2,3}; the prime 2 at the lower endpoint is included.

**Acceptance.** N_0(10)={1}. N_1(10)={5,7}. N_2(10)={35} and N_3(10)=∅. 25∉N_2(10), excluding repeated primes and ordered-tuple multiplicity. N_1(4)={2,3}; an open lower cutoff would omit 2 and fails this test.

**Uses.** `PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23/55`: Convert prime interval counts to distinct-product counts.

**Sources.** [Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), §3.6, definition immediately preceding (3.4), p.26.

<a id="prime-power-log-bound"></a>

#### Uniform prime-power divisor bound

`AnalyticNumberTheory:AN.5/prime-power-log-bound` · lemma · `TauCeti.AnalyticNumberTheory.prime_power_log_bound`.

For ε>0, integers p≥2 and a≥0, put D=max(1,(ε log 2)⁻¹). Then a+1≤D p^(aε). D is notation for a real expression, not a new carrier.

**Hypotheses.** ε>0; p,a natural; p≥2

**Construction and proof.**

1. Logarithm monotonicity gives log p≥log 2>0. Thus D≥1 and D ε log p≥1.
2. Multiply the latter inequality by a≥0 and add 1≤D to obtain a+1≤D(1+aε log p).
3. Use 1+t≤exp t and p^(aε)=exp(aε log p).

**Dependencies.** `mathlib:Real.log_pos`, `mathlib:Real.log_le_log`, `mathlib:Real.add_one_le_exp`, `mathlib:Real.rpow_def_of_pos`.

**Acceptance.** a=0 gives 1≤D. p=2 is included. Without D, ε=1/2,p=2,a=1 would assert 2≤√2, which is false.

**Sources.** [The divisor bound](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/), Second proof, exponential estimate and small/large-prime split.

<a id="large-prime-power-bound"></a>

#### Large-prime divisor factor bound

`AnalyticNumberTheory:AN.5/large-prime-power-bound` · lemma · `TauCeti.AnalyticNumberTheory.large_prime_power_bound`.

For ε>0, positive integer p and a≥0, exp(1/ε)≤p implies a+1≤p^(aε).

**Hypotheses.** ε>0; p>0; a natural; exp(1/ε)≤p

**Construction and proof.**

1. Apply the exponential/logarithm equivalence to get ε log p≥1.
2. Multiply by a, add 1 and apply 1+t≤exp t; identify the real power.

**Dependencies.** `mathlib:Real.le_log_iff_exp_le`, `mathlib:Real.add_one_le_exp`, `mathlib:Real.rpow_def_of_pos`.

**Acceptance.** a=0 is equality. The cutoff is non-strict. Primality is unnecessary for this local inequality.

**Sources.** [The divisor bound](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/), Second proof, exponential estimate and small/large-prime split.

<a id="divisor-bound-from-local-bounds"></a>

#### Divisor bounds from local factors

`AnalyticNumberTheory:AN.5/divisor-bound-from-local-bounds` · lemma · `TauCeti.AnalyticNumberTheory.divisor_bound_from_local_bounds`.

Let ε∈ℝ, D≥1 and B∈ℕ. Suppose for every prime p and a∈ℕ that a+1≤D p^(aε) if p≤B, and a+1≤p^(aε) if p>B. For every n>0, τ(n)≤D^B n^ε, with τ(n)=card(n.divisors).

**Hypotheses.** D≥1; B natural; two uniform prime-power hypotheses; n>0

**Construction and proof.**

1. Use Nat.card_divisors to write τ(n)=∏p|n(a_p+1); use Nat.prod_primeFactors_pow_factorization to write n=∏p|n p^a_p.
2. Split the finite prime-factor set at p≤B. Multiply the respective nonnegative local bounds using Finset.prod_le_prod.
3. Repeated Real.mul_rpow and Real.rpow_mul identify the prime-power product with n^ε. At most B small prime divisors occur, since they inject into {1,…,B}.
4. Hence τ(n)≤D^r n^ε with r≤B; D≥1 gives D^r≤D^B.

**Dependencies.** `mathlib:Nat.card_divisors`, `mathlib:Nat.prod_primeFactors_pow_factorization`, `mathlib:Nat.prime_of_mem_primeFactors`, `mathlib:Finset.prod_le_prod`, `mathlib:Real.mul_rpow`, `mathlib:Real.rpow_mul`, `mathlib:Real.rpow_natCast`.

**Acceptance.** n=1 has an empty product and τ(1)=1. Repeated prime powers incur one D per small prime, not one per exponent. ε need not be positive once the two local hypotheses are supplied.

**Sources.** [The divisor bound](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/), Second proof, exponential estimate and small/large-prime split.

<a id="explicit-divisor-subpower-bound"></a>

#### Explicit divisor subpower bound

`AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound` · theorem · `TauCeti.AnalyticNumberTheory.explicit_divisor_subpower_bound`.

For ε>0 and any natural B≥exp(1/ε), all positive integers n satisfy τ(n)≤max(1,(ε log 2)⁻¹)^B n^ε. Thus the displayed constant is at least 1 and independent of n.

**Hypotheses.** ε>0; B natural with exp(1/ε)≤B; n>0

**Construction and proof.**

1. Set D=max(1,(ε log 2)⁻¹). Apply the local uniform bound to each prime p≤B.
2. For p>B, the assumed cutoff implies exp(1/ε)≤p; apply the large-prime bound.
3. Apply divisor-bound-from-local-bounds. A certified upper integer B is a permitted input: no exact ceiling evaluation is required.

**Dependencies.** [`AnalyticNumberTheory:AN.5/prime-power-log-bound`](#prime-power-log-bound), [`AnalyticNumberTheory:AN.5/large-prime-power-bound`](#large-prime-power-bound), [`AnalyticNumberTheory:AN.5/divisor-bound-from-local-bounds`](#divisor-bound-from-local-bounds).

**Acceptance.** n=1 is covered. B may be increased without invalidating the estimate. The constant depends only on ε and the chosen certified B, never on n.

**Sources.** [The divisor bound](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/), Second proof, exponential estimate and small/large-prime split.

<a id="uniform-divisor-subpower-bound"></a>

#### Uniform divisor subpower bound

`AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound` · theorem · `TauCeti.AnalyticNumberTheory.uniform_divisor_subpower_bound`.

For every ε>0 there exists a real C≥1 such that τ(n)≤C n^ε for every positive integer n. One choice is C=max(1,(ε log 2)⁻¹)^B for any natural B≥exp(1/ε).

**Hypotheses.** ε>0

**Construction and proof.**

1. Choose B by the Archimedean theorem exists_nat_ge applied to exp(1/ε).
2. Take the explicit constant and use D≥1 to verify C≥1; invoke explicit-divisor-subpower-bound for every n>0.
3. For an effectively presented positive ε, certified bounds for exponential and logarithm produce an effective upper constant. For an arbitrary abstract real ε, this is a mathematical existence assertion, not a uniform executable real-number algorithm.

**Dependencies.** [`AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound`](#explicit-divisor-subpower-bound), `mathlib:exists_nat_ge`.

**Acceptance.** ε=1/(64c), c>0, supplies the exact ES.0 request for every M>0. C is retained at small inputs; setting C=1 for all n fails at n=2, ε=1/2. No squarefreeness, primitivity or coprimality hypothesis appears.

**Sources.** [The divisor bound](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/), Second proof, exponential estimate and small/large-prime split.

**Atlas planet.** Divisor subpower bound.

<a id="absorb-divisor-bound-constant"></a>

#### Absorption of the divisor-bound constant

`AnalyticNumberTheory:AN.5/absorb-divisor-bound-constant` · lemma · `TauCeti.AnalyticNumberTheory.absorb_divisor_bound_constant`.

For n>0 and ε,δ,C∈ℝ, if τ(n)≤C n^ε and C≤n^(δ−ε), then τ(n)≤n^δ.

**Hypotheses.** n>0; the two displayed inequalities

**Construction and proof.**

1. Multiply C≤n^(δ−ε) by n^ε≥0 and compose with the first inequality.
2. Apply Real.rpow_add at positive n and simplify (δ−ε)+ε=δ.

**Dependencies.** `mathlib:Real.rpow_add`, `mathlib:Real.rpow_nonneg`.

**Acceptance.** Equality in the threshold is allowed. δ>ε is not required by this pointwise implication. The threshold is not silently discarded.

**Sources.** [The divisor bound](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/), Second proof, exponential estimate and small/large-prime split.

<a id="eventual-divisor-subpower-bound"></a>

#### Eventual unit-constant divisor bound

`AnalyticNumberTheory:AN.5/eventual-divisor-subpower-bound` · theorem · `TauCeti.AnalyticNumberTheory.eventual_divisor_subpower_bound`.

For each δ>0 there exists a natural N≥1 such that every natural n≥N satisfies τ(n)≤n^δ. If C≥1 is the uniform constant at ε=δ/2, any natural N≥max(1,C^(2/δ)) suffices.

**Hypotheses.** δ>0

**Construction and proof.**

1. Use uniform-divisor-subpower-bound with ε=δ/2.
2. Choose natural N≥max(1,C^(2/δ)) using exists_nat_ge.
3. For n≥N, monotonicity of positive real powers and Real.rpow_mul give C≤n^(δ/2). Apply absorb-divisor-bound-constant.

**Dependencies.** [`AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound`](#uniform-divisor-subpower-bound), [`AnalyticNumberTheory:AN.5/absorb-divisor-bound-constant`](#absorb-divisor-bound-constant), `mathlib:exists_nat_ge`, `mathlib:Real.rpow_le_rpow`, `mathlib:Real.rpow_mul`.

**Acceptance.** N≥1 excludes the library's totalized zero input. Replacing δ by 2ε gives the equivalent eventual form used in extraction item96. The result makes no universal claim at n=2.

**Sources.** [The divisor bound](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/), Second proof, exponential estimate and small/large-prime split.

<a id="quadratic-conductor-largest-prime"></a>

#### Largest prime factor of a quadratic conductor

`AnalyticNumberTheory:AN.5/quadratic-conductor-largest-prime` · theorem · `TauCeti.AnalyticNumberTheory.quadratic_conductor_largest_prime`.

If N>1 is the conductor of a primitive quadratic character, then P(N)>0.94*log(N).

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Import the prime-discriminant description of a primitive quadratic conductor, including its 2-adic possibilities.
2. Combine the explicit prime-product bounds with certified small-conductor cases; N=24 must be included.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: A conjecture of Erdős, supersingular primes and short character sums](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-BENNETT-SIKSEK-20.result.json), Lemma 7.3, p. 375.

<a id="bounded-norm-ideal-count"></a>

#### Uniform bounded-norm ideal count

`AnalyticNumberTheory:AN.5/bounded-norm-ideal-count` · theorem · `TauCeti.AnalyticNumberTheory.bounded_norm_ideal_count`.

For every fixed g≥1 and ε>0 there is C(g,ε)>0 such that for every number field E of degree 2g and every integer n≥1, the number of nonzero integral ideals of norm n is at most C(g,ε)n^ε. Consequently, for every real X≥1 the number of such ideals of norm at most X is O_(g,ε)(X^(1+ε)). Both constants are uniform in E.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Combine the coefficient divisor majorant and the fixed-order divisor bound.
2. Sum m^ε for m≤X; no field-dependent constant is introduced.

**Dependencies.** [`AnalyticNumberTheory:AN.5/ideal-coefficient-divisor-majorant`](#ideal-coefficient-divisor-majorant), [`AnalyticNumberTheory:AN.5/fixed-order-divisor-subpower`](#fixed-order-divisor-subpower).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: The Andre-Oort conjecture for A_g](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-TSIMERMAN-18.result.json), 2.2, p. 382.

<a id="ideal-coefficient-divisor-majorant"></a>

#### Uniform coefficient bound by a divisor function

`AnalyticNumberTheory:AN.5/ideal-coefficient-divisor-majorant` · theorem · `TauCeti.AnalyticNumberTheory.ideal_coefficient_divisor_majorant`.

For a degree-n number field K, n>=1, let a_K(m) count nonzero integral ideals of norm m. For every m>=1, a_K(m)<=d_n(m), where d_n counts ordered n-tuples of positive integers with product m. At each rational prime the Euler factor product over p-adic prime ideals (1-T^f_i)^(-1) is coefficientwise bounded by (1-T)^(-n), since f_i>=1 and the number of factors is <=n; multiply over primes.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. For each rational prime compare ∏_j(1−T^f_j)^−1 coefficientwise with (1−T)^−n.
2. Use f_j≥1 and the number of prime-ideal factors ≤n, then multiply the finite local coefficient comparisons.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: The Andre-Oort conjecture for A_g](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-TSIMERMAN-18.result.json), Elementary decomposition of the ideal-count input in main section 2.2.

<a id="fixed-order-divisor-subpower"></a>

#### Subpolynomial fixed-order divisor function

`AnalyticNumberTheory:AN.5/fixed-order-divisor-subpower` · theorem · `TauCeti.AnalyticNumberTheory.fixed_order_divisor_subpower`.

For each integer n>=1 and epsilon>0 there is C_(n,epsilon) with d_n(m)<=C_(n,epsilon)*m^epsilon for every m>=1. Use d_n(p^a)=binomial(a+n-1,n-1). For large p this is <=n^a<=p^(epsilon*a); for the finitely many smaller primes the supremum of the polynomial in a divided by p^(epsilon*a) is finite. The product of those finitely many constants is independent of m.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use d_n(p^a)=binomial(a+n−1,n−1)≤n^a for a≥0.
2. Large primes have n≤p^ε; for each smaller prime a polynomial times p^−εa is bounded.
3. Multiply the finitely many small-prime constants, independently of m.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Reviewed extraction: The Andre-Oort conjecture for A_g](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-TSIMERMAN-18.result.json), Elementary fixed-degree proof of the bound used in main section 2.2.

<a id="medium-prime-cardinality"></a>

#### Cardinality of medium-prime products

`AnalyticNumberTheory:AN.5/medium-prime-cardinality` · theorem · `TauCeti.AnalyticNumberTheory.medium_prime_cardinality`.

For fixed integer m≥0, #N_m(x)∼(x/log x)^m/(2^m m!) as x→∞; m is fixed, not uniform in m.

**Construction and proof.**

1. Apply the rational PNT at x and x/2 to obtain k(x)=#P_x∼x/(2log x); the closed lower endpoint differs from π(x)−π(x/2) by at most one prime. In particular k(x)→∞.
2. Use the distinct-product cardinality node and compose pinned isEquivalent_choose(m) with k(x)→∞. This includes m=0 exactly, and yields (x/log x)^m/(2^m m!).

**Dependencies.** [`AnalyticNumberTheory:AN.5/medium-prime-products`](#medium-prime-products), [`AnalyticNumberTheory:AN.2/chebyshev-prime-count-transfer`](#chebyshev-prime-count-transfer), [`AnalyticNumberTheory:AN.5/medium-prime-product-card`](#medium-prime-product-card), `mathlib:isEquivalent_choose`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), §3.6 (3.4), p.26.

<a id="inverse-totient-count"></a>

#### Inverse-totient counting input

`AnalyticNumberTheory:AN.5/inverse-totient-count` · theorem · `TauCeti.AnalyticNumberTheory.inverse_totient_count`.

For real x≥1, #{d∈ℕ_{>0}:φ(d)≤x}=O(x), with an absolute constant.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use the original inverse-totient counting theorem, with positive integers and φ(d)≤x.
2. No implication is made from a pointwise lower bound on φ alone.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Evaluation effective du nombre d’entiers n tels que φ(n) ≤ x](https://matwbn.icm.edu.pl/ksiazki/aa/aa61/aa6124.pdf), Introduction pp.143–145; stated effective theorem p.145.

<a id="divisor-maximal-order"></a>

#### Maximal-order divisor upper bound

`AnalyticNumberTheory:AN.5/divisor-maximal-order` · theorem · `TauCeti.AnalyticNumberTheory.divisor_maximal_order`.

For every real ε>0 there is a natural K>e such that for every natural n≥K, τ(n)≤exp((log 2+ε)log n/log log n). This is the upper bound; no matching lower-order limit is asserted here.

**Hypotheses.** ε>0; n is a positive natural number beyond the displayed threshold.

**Construction and proof.**

1. Choose δ=ε/(4 log 2+2ε). Then 0<δ<1 and (log 2)/(1−δ)≤log 2+ε/2.
2. Put L=log n and y=L^(1−δ). Increase the natural threshold until L≥e, y≥2 and the small-prime loss lemma holds with η=ε/2.
3. By Nat.card_divisors and Real.log_prod, log τ(n)=Σ_{p|n}log(v_p(n)+1). Partition the finite set at y.
4. The small-prime logarithm is at most (ε/2)L/log L by the first and third lemmas. The large-prime logarithm is at most (log 2)L/((1−δ)log L) by the second lemma and Real.log_rpow.
5. Add the inequalities and exponentiate to obtain the exact stated ε bound. The independently planned uniform subpower theorem is not used in this proof.

**Dependencies.** [`AnalyticNumberTheory:AN.5/divisor-small-prime-log-bound`](#divisor-small-prime-log-bound), [`AnalyticNumberTheory:AN.5/divisor-large-prime-log-bound`](#divisor-large-prime-log-bound), [`AnalyticNumberTheory:AN.5/divisor-small-prime-loss`](#divisor-small-prime-loss), `mathlib:Nat.card_divisors`, `mathlib:Real.log_prod`, `mathlib:Real.log_rpow`, `mathlib:exists_nat_ge`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf), Exercise2.9(b),(e),(f), printed pp.33–34, k=2; [Reviewed extraction: Irreducibility of random polynomials: general measures](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23.result.json), arXiv v3, proof of Lemma 3.1, p. 18, citing [18, §18.1, Theorem 317] (Hardy–Wright, sixth edition); subpower use in the proof of Lemma 12.3, p. 60.

<a id="prime-divisor-product-mean"></a>

#### Wintner-type mean over prime divisors

`AnalyticNumberTheory:AN.5/prime-divisor-product-mean` · theorem · `TauCeti.AnalyticNumberTheory.prime_divisor_product_mean`.

For fixed n∈N,c>0 and f on rational primes with |f(p)|≤c/p, set a(t)=∏_{p|t}(1+f(p))^n for t≥1. Then Σ_{1≤t≤x}a(t)=Cx+O_{n,c}(√x), x≥1, where C=∏_p(1+((1+f(p))^n−1)/p); the product is absolutely convergent and f may be complex.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. On positive integers set g(d)=|μ(d)|∏_{p|d}((1+f(p))^n−1), with g(1)=1 and canonical zero extension. Finite expansion gives a(t)=Σ_{d|t}g(d) using the pinned Dirichlet-convolution carrier.
2. The binomial formula gives |g(p)|≤K_{n,c}/p with K_{n,c}≥1. For squarefree d, |g(d)|≤K_{n,c}^{ω(d)}/d≤τ(d)^α/d with a fixed α=max(1,log K_{n,c}/log2). The existing uniform divisor-subpower bound with exponent 1/(4α) gives |g(d)|≤B_{n,c}d^(−3/4).
3. Consequently M=Σ_{d≥1}|g(d)|/sqrt d is finite, uniformly in f after n,c are fixed. The squarefree-series/Euler-product comparison needed to identify C=Σg(d)/d with the stated product is recorded precisely in the scoped mean gap.
4. Swap finite sums to obtain Σ_{t≤x}a(t)=Σ_{d≤x}g(d)floor(x/d). The floor error is at most sqrt x M; replacing the truncated Σg(d)/d by C costs at most sqrt x M again. These finite identities avoid a new generic Wintner export from the upstream Abel layer.

**Dependencies.** `mathlib:ArithmeticFunction.mul_apply`, `mathlib:ArithmeticFunction.moebius`, [`AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound`](#uniform-divisor-subpower-bound).

**Acceptance.** For n=0, a(t)=1 and C=1; the discrepancy is floor(x)−x, of absolute value at most 1. For n=1 with f(2)=1/2 and f(p)=0 for all odd primes, C=5/4 and the exact sum is floor(x)+(1/2)floor(x/2). For complex f(p), all error estimates use absolute values and the constant depends only on n,c, not on the particular function f.

**Sources.** [Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), Lemma4.3 and full proof, published pp.705–706, equations(4.2)–(4.3).

<a id="prime-divisor-integrated-mean"></a>

#### Integrated prime-divisor mean

`AnalyticNumberTheory:AN.5/prime-divisor-integrated-mean` · lemma · `TauCeti.AnalyticNumberTheory.prime_divisor_integrated_mean`.

With a,C as in the prime-divisor mean lemma, ∫_0^T Σ_{1≤t≤x}a(t)dx=Σ_{1≤t≤T}(T−t)a(t)=CT²/2+O_{n,c}(T^(3/2)), T≥1.

**Construction and proof.**

1. For every t≥1 integrate its indicator over 0≤x≤T: the integral is T−t when t≤T and zero otherwise. Interchange only the finitely many nonzero terms.
2. Integrate the mean estimate on [1,T]; on [0,1) the count is zero and the integral of Cx is bounded by a constant depending only on n,c. The remainder integral is at most a fixed multiple of T^(3/2).

**Dependencies.** [`AnalyticNumberTheory:AN.5/prime-divisor-product-mean`](#prime-divisor-product-mean).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), Lemma4.3, published pp.705–706.

<a id="prime-divisor-log-weight"></a>

#### Logarithmic weight of prime divisors

`AnalyticNumberTheory:AN.5/prime-divisor-log-weight` · lemma · `TauCeti.AnalyticNumberTheory.prime_divisor_log_weight`.

For every integer N≥2, Σ_{p|N}(log p)/p≤log log N+C for one absolute real C.

**Hypotheses.** N is a natural integer≥2; sum over distinct prime divisors; one absolute C precedes allN.

**Construction and proof.**

1. For N≥e² split the distinct primes at X=log N≥2. Apply Mertens’s first theorem to p<X; primes at the endpoint belong to the large-prime group.
2. Nat.prod_primeFactors_dvd gives a positive squarefree kernel at mostN. Apply Real.log_prod and Real.log_le_log to get Σ_{p|N}log p≤log N; no divisor-product equality withN is assumed.
3. For p≥X use1/p≤1/X, so that Σ_{p|N,p≥X}log p/p≤1. Combine the groups; for2≤N<e² absorb the finite many values intoC, retaining possible negative log logN.

**Dependencies.** [`AnalyticNumberTheory:AN.2/mertens-first-theorem`](#mertens-first-theorem), `mathlib:Nat.prod_primeFactors_dvd`, `mathlib:Real.log_prod`, `mathlib:Real.log_le_log`.

**Acceptance.** N=2 is included even though log log2<0; the constant must absorb that value. For N=2^a witha≥1, the left side islog2/2, independent ofa; primes must be counted distinctly. A prime at p=log N is assigned to the large-prime group by the half-open split, so no endpoint is lost.

**Sources.** [Reviewed extraction: Exceptional jumps of Picard ranks of reductions of K3 surfaces over number fields](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-SHANKAR-SHANKAR-TANG-ETAL-22.result.json), Proof of Proposition 5.2, p.27.

<a id="dirichlet-divisor-average"></a>

#### Dirichlet divisor average

`AnalyticNumberTheory:AN.5/dirichlet-divisor-average` · theorem · `TauCeti.AnalyticNumberTheory.dirichlet_divisor_average`.

For x≥2, Σ_{1≤n≤x}τ(n)=x log x+(2γ−1)x+O(√x), with an absolute constant and inclusive real cutoff.

**Construction and proof.**

1. Apply the exact symmetric hyperbola identity with M=floor(sqrt x)≥1. Replace each floor(x/a) by x/a with an error of absolute value<1, for a total O(M).
2. Use H_M=log M+γ+O(1/M). With δ=sqrt x−M∈[0,1), expand 2x log M−M² around M=sqrt x; the discrepancy from x log x−x is O(1), while x/M=O(sqrt x) for x≥2.
3. Combine the errors with an absolute constant. This proof uses no subpower divisor bound.

**Dependencies.** [`AnalyticNumberTheory:AN.5/divisor-hyperbola-identity`](#divisor-hyperbola-identity), [`AnalyticNumberTheory:AN.5/harmonic-euler-remainder`](#harmonic-euler-remainder).

**Acceptance.** The exact divisor sums at x=1 and x=4 are1 and8; the asymptotic is asserted on x≥2 with a single absolute constant. A perfect-square endpoint is included once. The error O(sqrt x) requires the harmonic remainder rate, not merely existence of the Euler-constant limit.

**Sources.** [The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf), Theorem3.3 and complete hyperbola proof, printed pp.38–39; Theorem1.11 pp.15–16.

<a id="medium-prime-product-card"></a>

#### Distinct-product cardinality

`AnalyticNumberTheory:AN.5/medium-prime-product-card` · lemma · `TauCeti.AnalyticNumberTheory.medium_prime_product_card`.

For x≥2,m≥0, #N_m(x)=binomial(#{p prime:x/2≤p≤x},m).

**Construction and proof.**

1. For two m-element subsets s,t of P_x with the same product, apply Nat.primeFactors_prod to both sides to get s=t.
2. Apply Finset.card_image_of_injOn and Finset.card_powersetCard to the image defining N_m(x).

**Dependencies.** [`AnalyticNumberTheory:AN.5/medium-prime-products`](#medium-prime-products), `mathlib:Nat.primeFactors_prod`, `mathlib:Finset.card_powersetCard`, `mathlib:Finset.card_image_of_injOn`.

**Acceptance.** At x=4 the prime set is {2,3}; #N_0=1, #N_1=2, #N_2=1, and #N_3=0.

**Sources.** [Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3), §3.6, definition and (3.4), p.26.

<a id="divisor-hyperbola-identity"></a>

#### Divisor hyperbola identity

`AnalyticNumberTheory:AN.5/divisor-hyperbola-identity` · lemma · `TauCeti.AnalyticNumberTheory.divisor_hyperbola_identity`.

For real x≥1 and M=floor(sqrt x), Σ_{1≤n≤floor x}τ(n)+M²=2Σ_{1≤a≤M}floor(x/a). The equality is exact, including x at a perfect square.

**Construction and proof.**

1. Count positive ordered pairs(a,b) with ab≤x. A pair has a≤M or b≤M because (M+1)²>x.
2. Transpose to equate the two strips; their intersection is precisely1≤a,b≤M, containing M² pairs. Regroup pairs by ab and use the existing divisor carrier.

**Acceptance.** At x=4, the identity gives8+4=2(4+2). At x=1 both sides equal2.

**Sources.** [The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf), Hyperbola discussion, printed pp.38–39, (3.4)–(3.5) and Theorem3.3 proof.

<a id="beurling-prime-power-correction"></a>

#### Beurling higher-prime-power correction

`AnalyticNumberTheory:AN.5/beurling-prime-power-correction` · lemma · `TauCeti.AnalyticNumberTheory.beurling_prime_power_correction`.

For x≥1, J=floor(log x/log p₁) and Π_P(x)=Σ_{1≤j≤J}π_P(x^(1/j))/j, all terms with j>J are zero. For x≥p₁, 0≤Π_P(x)−π_P(x)≤π_P(sqrt x)+π_P(x^(1/3))log x/log p₁. Under convergence for every σ>1, the difference is O_ε(x^(1/2+ε)) for every ε>0.

**Construction and proof.**

1. Use p₁>1 to bound j for any prime power≤x. Isolate j=1 and j=2; for3≤j≤J use x^(1/j)≤x^(1/3) and bound1/j≤1.
2. Apply the counting-growth lemma at exponent1+η with0<η<2ε. Absorb the logarithm in the strictly smaller exponent for the j≥3 contribution. The finite low-x range changes only the constant.

**Dependencies.** [`AnalyticNumberTheory:AN.5/beurling-prime-system`](#beurling-prime-system), [`AnalyticNumberTheory:AN.5/beurling-count-growth`](#beurling-count-growth).

**Acceptance.** With two prime indices equal2 and all other primes>4, Π_P(4)=3 and π_P(4)=2; repeated indices are retained. For1≤x<p₁, Π_P(x)=π_P(x)=0.

**Sources.** [On general prime number theorems with remainder](https://arxiv.org/pdf/1601.05324), §2.1 p.3, (7) and subsequent prime-power bounds.

<a id="divisor-small-prime-log-bound"></a>

#### Small-prime divisor logarithm

`AnalyticNumberTheory:AN.5/divisor-small-prime-log-bound` · lemma · `TauCeti.AnalyticNumberTheory.divisor_small_prime_log_bound`.

For a natural n≥2 and real y≥2, Σ_{p∈primeFactors(n), p≤y} log(v_p(n)+1) ≤ y log(1+log n/log 2).

**Hypotheses.** The ranges and positivity assumptions are explicit in the statement.

**Construction and proof.**

1. For each p dividing n, p≥2 and p^v_p(n) divides n. Monotonicity of log and log_pow give v_p(n)≤log n/log 2.
2. Bound each nonnegative summand by log(1+log n/log 2). There are at most floor y distinct positive integers ≤y; cast this cardinality bound to R and multiply.

**Dependencies.** `mathlib:Nat.prime_of_mem_primeFactors`, `mathlib:Nat.prod_primeFactors_pow_factorization`, `mathlib:Real.log_pow`, `mathlib:Real.log_le_log`.

**Acceptance.** Keep the cutoff partition inclusive on the small side and strict on the large side; no asymptotic prime-count input is used.

**Sources.** [The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf), Exercise2.9(b),(e),(f), printed pp.33–34, k=2.

<a id="divisor-large-prime-log-bound"></a>

#### Large-prime divisor logarithm

`AnalyticNumberTheory:AN.5/divisor-large-prime-log-bound` · lemma · `TauCeti.AnalyticNumberTheory.divisor_large_prime_log_bound`.

For a natural n≥2 and real y>1, Σ_{p∈primeFactors(n), y<p} log(v_p(n)+1) ≤ (log 2)log n/log y.

**Hypotheses.** The ranges and positivity assumptions are explicit in the statement.

**Construction and proof.**

1. Induction on a gives a+1≤2^a, hence log(a+1)≤a log 2.
2. The factorization identity and log_prod/log_pow give Σ_{p|n}v_p(n)log p=log n. All terms are nonnegative. On the large-prime part, log y Σ v_p(n)≤log n; divide by the positive log y and multiply by log 2.

**Dependencies.** `mathlib:Nat.prime_of_mem_primeFactors`, `mathlib:Nat.prod_primeFactors_pow_factorization`, `mathlib:Real.log_pow`, `mathlib:Real.log_prod`, `mathlib:Real.log_le_log`.

**Acceptance.** Keep the cutoff partition inclusive on the small side and strict on the large side; no asymptotic prime-count input is used.

**Sources.** [The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf), Exercise2.9(b),(e),(f), printed pp.33–34, k=2.

<a id="divisor-small-prime-loss"></a>

#### Vanishing small-prime contribution

`AnalyticNumberTheory:AN.5/divisor-small-prime-loss` · lemma · `TauCeti.AnalyticNumberTheory.divisor_small_prime_loss`.

For real 0<δ<1 and η>0 there is L₀≥e such that for every real L≥L₀, L^(1−δ)log(1+L/log 2) ≤ η L/log L.

**Hypotheses.** The ranges and positivity assumptions are explicit in the statement.

**Construction and proof.**

1. For large L, log(1+L/log 2)≤C log L for an absolute C, by monotonicity and splitting off a fixed multiplicative constant.
2. After dividing by the positive L/log L, the ratio is at most C(log L)^2/L^δ. The pinned isLittleO_log_rpow_rpow_atTop with r=2 and s=δ makes this eventually at most η. Increase the threshold to e.

**Dependencies.** `mathlib:isLittleO_log_rpow_rpow_atTop`, `mathlib:Real.log_rpow`, `mathlib:Real.log_le_log`, `mathlib:Real.log_pow`.

**Acceptance.** Keep the cutoff partition inclusive on the small side and strict on the large side; no asymptotic prime-count input is used.

**Sources.** [The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf), Exercise2.9(b),(e),(f), printed pp.33–34, k=2.

### Möbius sums and restricted counts

<a id="even-von-mangoldt"></a>

#### Even von Mangoldt function

`AnalyticNumberTheory:AN.5/even-von-mangoldt` · definition · `TauCeti.AnalyticNumberTheory.even_von_mangoldt`.

Λ_even(n)=ArithmeticFunction.vonMangoldt(|n|) for n∈Z, including Λ_even(0)=0.

**Construction and proof.**

1. Construct the displayed object on the specified domain using the existing carriers; prove the listed API before its analytic applications.

**Dependencies.** `mathlib:ArithmeticFunction.vonMangoldt`.

**API.**

- `even_von_mangoldt.nat` (compatibility): For positive n this is the pinned von Mangoldt value.
- `even_von_mangoldt.neg` (simp): Λ_even(−n)=Λ_even(n).
- `even_von_mangoldt.zero` (simp): Λ_even(0)=0.

**Unit tests.**

- `even_von_mangoldt.zero` (computation): Λ_even(0)=0.
- `even_von_mangoldt.negative_prime` (computation): Λ_even(−2)=log 2.
- `even_von_mangoldt.power` (computation): Λ_even(−8)=log 2; Λ_even(−6)=0.

**Acceptance.** Λ_even(0)=0. Λ_even(−2)=log 2. Λ_even(−8)=log 2; Λ_even(−6)=0.

**Uses.** `PAPER-SKOROBOGATOV-SOFOS-23/28`: Integer Fourier sums use an even extension.

**Sources.** [Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), §3.1, definitions preceding Corollary3.3, published p.691.

<a id="truncated-von-mangoldt"></a>

#### Truncated von Mangoldt function

`AnalyticNumberTheory:AN.5/truncated-von-mangoldt` · definition · `TauCeti.AnalyticNumberTheory.truncated_von_mangoldt`.

For real z≥1 and n∈Z, Λ_z(n)=−Σ_{d∈N,1≤d≤z,d|n} μ(d)log d. Divisibility of zero includes every positive d; the sum is finite by its cutoff.

**Construction and proof.**

1. Take the finite sum over positive naturals d≤floor z whose integer cast divides n; retain all positive d at n=0 rather than substituting the empty native divisors(0).
2. For n≠0 and z≥|n|, identify this finite set with Nat.divisors(n.natAbs). Apply ArithmeticFunction.sum_moebius_mul_log_eq at n.natAbs and negate.
3. Divisibility is invariant under n↦−n. Evaluate z=1, the prime cutoff and z=2,n=0 directly; these require no analytic cancellation theorem.

**Dependencies.** [`AnalyticNumberTheory:AN.5/even-von-mangoldt`](#even-von-mangoldt), `mathlib:ArithmeticFunction.moebius`, `mathlib:ArithmeticFunction.sum_moebius_mul_log_eq`.

**API.**

- `truncated_von_mangoldt.sum` (characterisation): Evaluation is the cutoff positive-divisor sum.
- `truncated_von_mangoldt.neg` (simp): Λ_z(−n)=Λ_z(n).
- `truncated_von_mangoldt.zero` (simp): Λ_z(0)=−Σ_{1≤d≤z} μ(d)log d.
- `truncated_von_mangoldt.large_cutoff` (compatibility): For n≠0 and z≥|n|, Λ_z(n)=Λ_even(n).

**Unit tests.**

- `truncated_von_mangoldt.zero_two` (computation): Λ_2(0)=log 2, so truncation is not zero at zero.
- `truncated_von_mangoldt.prime_cutoff` (computation): For a prime p, Λ_z(p)=0 when z<p and log p when p≤z.
- `truncated_von_mangoldt.one` (computation): Λ_1(n)=0 for all n.

**Acceptance.** Λ_2(0)=log 2, so truncation is not zero at zero. For a prime p, Λ_z(p)=0 when z<p and log p when p≤z. Λ_1(n)=0 for all n.

**Uses.** `PAPER-SKOROBOGATOV-SOFOS-23/97`: Keep the isolated zero term in two-sided Fourier sums.

**Sources.** [Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), §3.1, definitions preceding Corollary3.3, published p.691.

<a id="mangoldt-truncation-error"></a>

#### Von Mangoldt truncation error

`AnalyticNumberTheory:AN.5/mangoldt-truncation-error` · definition · `TauCeti.AnalyticNumberTheory.mangoldt_truncation_error`.

E_z(n)=Λ_even(n)−Λ_z(n), for n∈Z and z≥1.

**Construction and proof.**

1. Subtract the two real-valued functions on ℤ. Their evenness yields evenness of E_z.
2. At n=0 use vonMangoldt(0)=0 and the finite cutoff sum, giving E_z(0)=Σ_{1≤d≤z}μ(d)log d.
3. At n≠0 and z≥|n| use the pinned divisor identity through truncated_von_mangoldt.large_cutoff, giving E_z(n)=0.

**Dependencies.** [`AnalyticNumberTheory:AN.5/even-von-mangoldt`](#even-von-mangoldt), [`AnalyticNumberTheory:AN.5/truncated-von-mangoldt`](#truncated-von-mangoldt).

**API.**

- `mangoldt_truncation_error.sub` (characterisation): E_z is the displayed difference.
- `mangoldt_truncation_error.neg` (simp): E_z(−n)=E_z(n).
- `mangoldt_truncation_error.zero` (simp): E_z(0)=Σ_{1≤d≤z} μ(d)log d.

**Unit tests.**

- `mangoldt_truncation_error.zero_two` (computation): E_2(0)=−log 2.
- `mangoldt_truncation_error.prime` (computation): For p>z, E_z(p)=log p.
- `mangoldt_truncation_error.large_cutoff` (computation): For n≠0 and z≥|n|, E_z(n)=0.

**Acceptance.** E_2(0)=−log 2. For p>z, E_z(p)=log p. For n≠0 and z≥|n|, E_z(n)=0.

**Uses.** `PAPER-SKOROBOGATOV-SOFOS-23/97`: The positive and two-sided exponential estimates are separated.

**Sources.** [Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), §3.1, definitions preceding Corollary3.3, published p.691.

<a id="coprime-mobius-log-sum"></a>

#### Coprime Möbius sums from the prime number theorem ((3.6))

`AnalyticNumberTheory:AN.5/coprime-mobius-log-sum` · theorem · `TauCeti.AnalyticNumberTheory.coprime_mobius_log_sum`.

For every A>0, uniformly in positive integers q≤T^4 and real T≥2, Σ_{1≤t≤T,(t,q)=1} μ(t)log t/t=−q/φ(q)+O_A((log T)^−A).

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use a coprimality Euler factor and a conductor-uniform Möbius PNT.
2. Prove q≤T^4 uniformity with a sufficiently large logarithmic power before replacing it by A.

**Dependencies.** `mathlib:ArithmeticFunction.moebius`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), Equation(3.6), proof of Lemma3.11, published p.699.

<a id="gamma-prime-product-tail"></a>

#### Gamma Euler-product truncation

`AnalyticNumberTheory:AN.5/gamma-prime-product-tail` · theorem · `TauCeti.AnalyticNumberTheory.gamma_prime_product_tail`.

For fixed n∈ℕ and real x≥e², define γ_n(p)=1−1/p+(1+1/(p−1))^n/p for each rational prime p. The convergent product over p>log x is 1+O_n(1/log x), uniformly after retaining any subset of those primes. In particular γ_0(p)=1; the equivalent expression p^(n−1)/(p−1)^n uses an integer exponent n−1, never truncated natural subtraction.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. For p>log x≥2, use 0<1/(p−1)<1 and the finite binomial expansion to obtain 1≤γ_n(p)≤1+K_n/(p(p−1)); n=0 gives equality 1 directly.
2. For any finite prime subset in this range, 0≤Σlog γ_n(p)≤K_nΣ_{k>log x}1/(k(k−1))≤2K_n/log x. Exponentiation bounds the finite product minus 1 by a constant depending only on n divided by log x.
3. Pass from finite products to the convergent product using the summable nonnegative logarithms. The required infinite-product API and local bound are specified in the scoped mean gap; the finite bound is uniform in the retained subset.

**Acceptance.** n=0 gives product 1; n=1 has local factor 1+1/(p(p−1)). For any retained subset, the product is at least 1 and obeys the same upper error bound, with no subset-dependent constant. At x=e² the tail excludes the prime 2; no strict inequality is applied at 1/(2−1)=1.

**Sources.** [Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), Lemma4.5 and full proof, published pp.708–709.

<a id="shifted-coprime-mobius-sum"></a>

#### Shifted coprime Möbius sum

`AnalyticNumberTheory:AN.5/shifted-coprime-mobius-sum` · theorem · `TauCeti.AnalyticNumberTheory.shifted_coprime_mobius_sum`.

For every A>0 there are constants C_A>0 and T_A≥2 such that for every real T≥T_A and every positive integer 1≤q≤√T, |Σ_{1≤t≤T/q,(t,q)=1}μ(t)log(qt)/t+q/φ(q)|≤C_A(log T)^(−A). The constants are independent of q.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Set U=T/q≥√T. Then q≤U, hence q≤U^4, so the two coprime Möbius supplier statements apply at U, with logarithmic exponent A+1.
2. Expand log(qt)=log q+log t. Bound log q≤(log T)/2 and log U≥(log T)/2 to absorb the first sum into O_A((log T)^−A).

**Dependencies.** [`AnalyticNumberTheory:AN.5/coprime-mobius-log-sum`](#coprime-mobius-log-sum), [`AnalyticNumberTheory:AN.5/coprime-mobius-reciprocal-sum`](#coprime-mobius-reciprocal-sum).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), Lemma3.11 and proof, published p.699.

<a id="totient-reciprocal-bound"></a>

#### Size of 1/φ(n) and of the divisor function (3.7)

`AnalyticNumberTheory:AN.5/totient-reciprocal-bound` · theorem · `TauCeti.AnalyticNumberTheory.totient_reciprocal_bound`.

For n≥3, 1/φ(n)≤C log log n/n, with an absolute C>0.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use pinned Nat.totient_eq_mul_prod_factors, transfer the rational product equality to ℝ, and divide only at n≥3, where φ(n)>0. Thus n/φ(n)=∏_{p|n}(1−1/p)^−1.
2. For sufficiently large n split at y=log n. The small-prime factor is at most the full reciprocal Mertens product through y, hence O(log log n).
3. If r distinct prime divisors exceed y, then y^r≤n, so r≤log n/log y. Since −log(1−1/p)≤2/p for p≥2, their log product is at most 2r/y≤2/log y, hence uniformly bounded.
4. Absorb the finitely many integers 3≤n below the chosen threshold into the positive constant C. No estimate at log log1 or log log2 is used.

**Dependencies.** [`AnalyticNumberTheory:AN.2/mertens-prime-product`](#mertens-prime-product), `mathlib:Nat.totient_eq_mul_prod_factors`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), Equation(3.7), published p.699; cited Montgomery–Vaughan Theorem2.9.

<a id="coprime-mobius-reciprocal-sum"></a>

#### Coprime Möbius sums from the prime number theorem ((3.6))

`AnalyticNumberTheory:AN.5/coprime-mobius-reciprocal-sum` · theorem · `TauCeti.AnalyticNumberTheory.coprime_mobius_reciprocal_sum`.

For every A>0, uniformly in positive integers q≤T^4 and T≥2, Σ_{1≤t≤T,(t,q)=1} μ(t)/t=O_A((log T)^−A).

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Use the same uniform coprimality Euler factor argument as the logarithmic sum, with one extra partial summation.

**Dependencies.** `mathlib:ArithmeticFunction.moebius`.

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf), Equation(3.6), proof of Lemma3.11, published p.699.

<a id="landau-sum-two-squares-count"></a>

#### Landau–Ramanujan count of sums of two squares

`AnalyticNumberTheory:AN.5/landau-sum-two-squares-count` · theorem · `TauCeti.AnalyticNumberTheory.landau_sum_two_squares_count`.

For K→∞, #{1≤k≤K:k=u²+v² for some integers u,v}∼C_L K/√log K with the positive Landau–Ramanujan constant C_L.

**Hypotheses.** K tends to infinity through positive real cutoffs; u,v are integers and represented integers are counted once, not by representation multiplicity.

**Construction and proof.**

1. Convert integer-square witnesses to natural-square witnesses and use the pinned Nat.eq_sq_add_sq_iff; no new arithmetic representation criterion is planned.
2. For the 0/1 indicator b, the Euler factors are (1−p^(−s))^(−1) for p=2 or p≡1 mod4, and (1−p^(−2s))^(−1) for p≡3 mod4. Thus B(s)²=ζ(s)L(s,χ_−4)(1−2^(−s))^(−1)∏_{p≡3 mod4}(1−p^(−2s))^(−1) on Re s>1.
3. Use fixed-modulus Siegel–Walfisz to verify the weighted-prime input (13.1) with κ=1/2; b≤1 satisfies (13.2). Apply the missing Selberg–Delange interface of Theorem13.2 and evaluate c₀/Γ(1/2). Its proof and constant/product convergence are recorded in the Landau gap.

**Dependencies.** `mathlib:Nat.eq_sq_add_sq_iff`, [`AnalyticNumberTheory:AN.2/siegel-walfisz`](#siegel-walfisz).

**Acceptance.** C_L=(1/√2)∏_{p≡3 mod4}(1−p^(−2))^(−1/2), with a convergent positive product; this explicit constant evaluation remains part of the recorded proof gap. At K=1 the count is1; at K=5 it is4 (1,2,4,5). The count at K=3 is2, so3 is excluded. 9=0²+3² is counted: the forbidden prime3 may occur to an even power. Counting only integers supported on p=2 or p≡1 mod4 would fail this test.

**Sources.** [Reviewed extraction: Integral points on Markoff type cubic surfaces](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-GHOSH-SARNAK-22.result.json), §1, p.3; §4.1, pp.12–13; §8, p.24, arXiv:1706.06712v3 (final version); [The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf), Chapter13, (13.1)–(13.2), Theorem13.2 pp.130–134 and Exercise13.4 p.140; [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), Introduction p.3, exceptional families; §4.1 pp.12–13.

<a id="landau-three-square-form-count"></a>

#### Landau upper bound for shifted Eisenstein norms

`AnalyticNumberTheory:AN.5/landau-three-square-form-count` · theorem · `TauCeti.AnalyticNumberTheory.landau_three_square_form_count`.

For real K≥2, the count of positive integers k≤K with 4(k−1)=u²+3v² for some integers u,v is at most C K/√log K for one absolute C>0; the k=1 norm-zero case is counted once.

**Hypotheses.** K≥2 is a real cutoff; integer witnesses include0 and signs; count represented k, not pairs(u,v).

**Construction and proof.**

1. Put m=k−1≥0. The equation forces u and v to have the same parity. The integral change a=(u+v)/2, b=v gives m=a²−ab+b², and conversely u=2a−b, v=b.
2. For positive m use the exact Eisenstein-norm criterion: every prime p≡2 mod3 has even valuation, including p=2. That arithmetic criterion is not a consequence of the sum-of-two-squares theorem and remains a supplier gap.
3. Apply the fixed-modulus multiplicative-mean theorem with κ=1/2, supplied prime distribution, and the positive residual Euler factor. The norm-zero case contributes1 and the shift by1 preserves the stated upper bound.

**Dependencies.** [`AnalyticNumberTheory:AN.2/siegel-walfisz`](#siegel-walfisz).

**Acceptance.** k=1 and2 are counted (norms0,1). k=3 is excluded because2 has odd valuation at the inert prime2. k=4 is counted (u,v)=(3,1), although k−1=3 is not a sum of two integer squares. k=5 is counted (u,v)=(4,0), exercising the even exponent of2.

**Sources.** [Reviewed extraction: Integral points on Markoff type cubic surfaces](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-GHOSH-SARNAK-22.result.json), §1, p.3; §4.1, pp.12–13; §8, p.24, arXiv:1706.06712v3 (final version); [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), Introduction p.3, exceptional families; §4.1 pp.12–13.

<a id="shifted-square-count"></a>

#### Elementary shifted-square count

`AnalyticNumberTheory:AN.5/shifted-square-count` · theorem · `TauCeti.AnalyticNumberTheory.shifted_square_count`.

#{1≤k≤K:k−4 is an integer square}≤1+√max(K−4,0), for K≥1.

**Hypotheses.** K≥1 is a real cutoff; k is a positive integer and the square witness is an integer.

**Construction and proof.**

1. For K<4 the set is empty. For K≥4, replace each integer square witness by its nonnegative absolute value; k↦u is inverse to the injective map u↦u²+4.
2. For an integer cutoff N≥4, Nat.le_sqrt' identifies the witness interval 0≤u≤Nat.sqrt(N−4); Set.InjOn.ncard_image and Set.ncard_Iic_nat give its exact cardinality Nat.sqrt(N−4)+1.
3. For a real cutoff use N=floor K and the real square-root comparison to get the displayed upper bound. The finite/real floor adapter is routine; the k=4, u=0 point must be retained.

**Dependencies.** `mathlib:Nat.le_sqrt'`, `mathlib:Set.InjOn.ncard_image`, `mathlib:Set.ncard_Iic_nat`.

**Acceptance.** For integer N, the count is0 when N<4 and Nat.sqrt(N−4)+1 when N≥4. At K=3 the count is0; at K=4 it is1; at K=5 it is2; at K=13 it is4 (4,5,8,13). At K=4 the bound is exactly1, so the square-zero case is included.

**Sources.** [Reviewed extraction: Integral points on Markoff type cubic surfaces](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-GHOSH-SARNAK-22.result.json), §1, p.3; §4.1, pp.12–13; §8, p.24, arXiv:1706.06712v3 (final version); [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), Introduction p.3, exceptional families; §4.1 pp.12–13.

<a id="landau-exception-union"></a>

#### Asymptotic count of the three exceptional families

`AnalyticNumberTheory:AN.5/landau-exception-union` · theorem · `TauCeti.AnalyticNumberTheory.landau_exception_union`.

The union of k=u²+v², 4(k−1)=u²+3v² and k−4=u², with k positive and ≤K, has cardinality ∼C′ K/√log K for a positive C′.

**Hypotheses.** Count positive integers k≤K satisfying at least one of the three integer-representation predicates; K→∞; no representation multiplicity.

**Construction and proof.**

1. Use the individual counts and the elementary shifted-square count to obtain a two-sided comparison with K/√log K. These inputs alone do not imply a limit constant.
2. To obtain the asserted asymptotic, supply an asymptotic for the Eisenstein-norm family and an o(K/√log K) bound for its intersection with the sum-of-two-squares family. The latter is a shifted correlation of representation indicators, not a single multiplicative Euler product.
3. Apply finite-set inclusion-exclusion and absorb the shifted-square family, which is O(√K). Ghosh–Sarnak p.3 asserts the union asymptotic, whereas §4.1 only uses the upper bound. The stronger inputs remain an explicit gap.

**Dependencies.** [`AnalyticNumberTheory:AN.5/landau-sum-two-squares-count`](#landau-sum-two-squares-count), [`AnalyticNumberTheory:AN.5/landau-three-square-form-count`](#landau-three-square-form-count), [`AnalyticNumberTheory:AN.5/shifted-square-count`](#shifted-square-count).

**Acceptance.** The source asymptotic must be proved independently of the elementary upper/lower comparison; no positive limit is inferred solely from those bounds. At integer cutoff13, the union is {1,2,4,5,8,9,10,13}, of cardinality8; overlaps must be subtracted. Removing k=0 changes a count by at most1, with no effect on the asymptotic.

**Sources.** [Reviewed extraction: Integral points on Markoff type cubic surfaces](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-GHOSH-SARNAK-22.result.json), §1, p.3; §4.1, pp.12–13; §8, p.24, arXiv:1706.06712v3 (final version); [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), Introduction p.3, exceptional families; §4.1 pp.12–13.

<a id="half-density-prime-support-count"></a>

#### Counts supported on half the reduced prime classes

`AnalyticNumberTheory:AN.5/half-density-prime-support-count` · theorem · `TauCeti.AnalyticNumberTheory.half_density_prime_support_count`.

Fix a positive modulus M and R⊆(ZMod M)^× with 2#R=φ(M); primes dividing M are excluded. Let H be the subgroup generated by R. For each fixed a∈H there are C₁,C₂>0 and X₀≥2, depending only on M,R,a, such that for all X≥X₀ the count of positive ν≤X with every prime factor lying in R modulo M and ν≡a mod M lies between C₁ X/√log X and C₂ X/√log X. If a∉H, that count is0. The empty factorization ofν=1 is included only in the identity class.

**Hypotheses.** M,R,a are fixed before X tends to infinity; the exact half-cardinality condition is2#R=φ(M), with no rounded integer division. All prime factors are tested, including repeated factors and the primes dividing M, which are forbidden; ν≥1.

**Construction and proof.**

1. Form the multiplicative 0/1 indicator with Euler factors (1−p^(−s))^(−1) only at allowed primes; do not replace it by a squarefree indicator.
2. Use finite Dirichlet-character orthogonality to select ν≡a modM. For each twist χ the weighted prime mean is κ_χ=φ(M)^(−1)Σ_{r∈R}χ(r), supplied by fixed-modulus Siegel–Walfisz.
3. The maximal real part is1/2 exactly for characters trivial on H. Their twists equal the untwisted indicator on every supported integer; for a∈H the leading terms therefore add rather than cancel. All other twists have a strict real-exponent gap because M and R are fixed.
4. Apply the missing complex-κ Selberg–Delange interface of Theorem13.2, then prove positivity of the untwisted residual factor using fixed-modulus Dirichlet nonvanishing and the convergent higher-power factors. The character decomposition, branch/product estimate and positivity are recorded as gaps.
5. Products of allowed unit classes lie in H, giving the zero count outside H, including the ν=1 identity-class convention.

**Dependencies.** [`AnalyticNumberTheory:AN.2/siegel-walfisz`](#siegel-walfisz), `mathlib:DirichletCharacter.LFunction_ne_zero_of_one_le_re`.

**Acceptance.** For M=4, R={1}, H={1}; class3 has count0. Allowing arbitrary reduced classes would give a false positive count. For M=4, R={3}, H={1,3}; both classes have positive asymptotic-sized counts; the identity class includesν=1 and products of an even number of3 mod4 primes. 9 is allowed when M=4,R={3}, whereas3 is forbidden for R={1}; this distinguishes the unrestricted-support and squarefree indicators. The exact half-cardinality condition has no solution for M=1 or2, sinceφ(M)=1; roundingφ(M)/2 would falsely admit the empty prime family.

**Sources.** [Reviewed extraction: Integral points on Markoff type cubic surfaces](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-GHOSH-SARNAK-22.result.json), §1, p.3; §4.1, pp.12–13; §8, p.24, arXiv:1706.06712v3 (final version); [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3), §8, Proposition8.1 and ensuing density discussion, pp.22–24; [The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf), Chapter13 (13.1)–(13.2), Theorem13.2 pp.130–134.

<a id="restricted-squarefree-landau-count"></a>

#### Restricted squarefree Landau asymptotic

`AnalyticNumberTheory:AN.5/restricted-squarefree-landau-count` · theorem · `TauCeti.AnalyticNumberTheory.restricted_squarefree_landau_count`.

For D(X)={n∈N:1≤n<X, n squarefree, every odd prime factor p satisfies p≡1 mod4}, there is a positive absolute C_D such that #D(X)=C_D X/√log X·(1+O(1/log X)) as X→∞. The cutoff is strict, as in KP§1. C_D=(3/(4√2))∏_{p≡1(4)}(1−p^(−2))∏_{p≡3(4)}(1−p^(−2))^(1/2), with positive convergent products.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. For Re s>1 the squarefree indicator has Euler series D(s)=(1+2^(−s))∏_{p≡1(4)}(1+p^(−s)).
2. Factor D(s)=ζ(s)^(1/2)L(s,χ_−4)^(1/2)H(s), choosing the positive branch on real s>1. Here H(s)=(1+2^(−s))(1−2^(−s))^(1/2)∏_{p≡1(4)}(1−p^(−2s))∏_{p≡3(4)}(1−p^(−2s))^(1/2).
3. Use a quantitative Selberg–Delange transfer with leading coefficient L(1,χ_−4)^(1/2)H(1)/Γ(1/2); insert L(1,χ_−4)=π/4 and Γ(1/2)=√π. The continuation/transfer is still a recorded gap.
4. Absolute summability of p^(−2) proves positive product convergence. A strict versus inclusive height changes the count by at most1, which fits this error as X→∞.

**Acceptance.** D(2)={1}; D(14)={1,2,5,10,13}. The integer9 is excluded despite being a sum of two squares. The p=2 Euler factor is1+2^(−s), not(1−2^(−s))^(−1); n=4 is excluded by squarefreeness. Every factor in C_D is positive; the logarithmic series is absolutely convergent.

**Sources.** [On Stevenhagen’s conjecture](https://arxiv.org/pdf/2201.13424v1), §1 pp.2–3, D(X) and classical asymptotic.

<a id="restricted-sathe-selberg-count"></a>

#### Restricted squarefree Sathe–Selberg bounds

`AnalyticNumberTheory:AN.5/restricted-sathe-selberg-count` · theorem · `TauCeti.AnalyticNumberTheory.restricted_sathe_selberg_count`.

Let D_r(N)={n∈D(N):ω(n)=r}, with D(N) the strict-cutoff squarefree family defined in restricted_squarefree_landau_count and ω(n) the number of distinct prime divisors. For every fixed A>0 there are C₁,C₂>0 and N₀≥3, depending only on A, such that for every real N≥N₀ and integer1≤r≤A log log N, C₁(N/log N)(½ log log N)^(r−1)/(r−1)!≤#D_r(N)≤C₂(N/log N)(½ log log N)^(r−1)/(r−1)!. No r=0 or varying-A uniformity is asserted.

**Hypotheses.** Parameters, ranges, character normalization and constant dependence are those in the displayed statement.

**Construction and proof.**

1. Mark each distinct prime divisor by z in D(s,z)=(1+z2^(−s))∏_{p≡1(4)}(1+zp^(−s)); extract the z^r coefficient.
2. The half-density prime set gives singular exponent z/2. A two-variable coefficient/transfer theorem, with fixed compact positive saddle-parameter range determined by A, is required to prove the uniform bounds.
3. KP Theorem7.2 quotes all fixed A>0 from CKMP p.13, but the acquired CKMP paragraph only prints r<2μ=log log N. Reconcile or independently prove the all-A range; the cited paragraph is not an all-A proof.

**Acceptance.** For r=1 the family counts2 and primes≡1 mod4 below N, and has size asymptotic N/(2 log N). D_0(N)={1} for N>1 and is outside the theorem; at N=14 the r=1 and r=2 counts are3 and1 respectively. Constants are fixed after A, before N and r; a fixed-r theorem alone cannot justify r of order log log N.

**Sources.** [On Stevenhagen’s conjecture](https://arxiv.org/pdf/2201.13424v1), §7.1 Theorem7.2, (7.3), p.60; proof citing[8] p.13; [On the negative Pell equation](https://arxiv.org/pdf/1908.01752), §4 opening, p.13.

<a id="pretentious-square-nonnegative"></a>

#### Squared pretentious-distance formula

`AnalyticNumberTheory:AN.5/pretentious-square-nonnegative` · lemma · `TauCeti.AnalyticNumberTheory.pretentious_square_nonnegative`.

Under the prime unit-disc hypotheses, D(f,g;x)²=Σ_{p≤x}(1−Re(f(p)conj(g(p))))/p≥0.

**Construction and proof.**

1. Unfold the stated definition and apply the finite algebraic, positivity or convergent geometric-series computation.

**Dependencies.** [`AnalyticNumberTheory:AN.5/pretentious-distance`](#pretentious-distance).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Pretentious multiplicative functions and an inequality for the zeta-function](https://arxiv.org/pdf/math/0608407), Weighted norm discussion pp3–4.

<a id="mangoldt-polynomial-mean-square"></a>

#### Prime-weighted Dirichlet-polynomial mean bound

`AnalyticNumberTheory:AN.5/mangoldt-polynomial-mean-square` · lemma · `TauCeti.AnalyticNumberTheory.mangoldt_polynomial_mean_square`.

There is an absolute C>0 such that for T≥1, x≥1 and any complex coefficients a(n), the integral from −T to T of |∑_{T²≤n≤x}a(n)Λ(n)exp(−it log n)|² is at most C∑_{T²≤n≤x}n|a(n)|²Λ(n). The finite sums use inclusive real cutoffs. If x<T² they are empty.

**Construction and proof.**

1. Use the nonnegative even majorant Φ(t)=(sin(t)/t)²/(sin1)², continuously extended at0, whose Fourier transform has fixed compact support; enlarge the integration interval and expand the finite square.
2. The off-diagonal kernel is supported where |log(n/m)|≪1/T. Use 2|a(m)a(n)|≤|a(m)|²+|a(n)|² and symmetry.
3. The sum of Λ(n) in the supported window around m is ≪m/T when m≥T², from the short-interval upper-bound sieve plus higher-prime-power removal. Multiplying by T yields the claimed single-Λ diagonal. That precise supplier and the Fourier normalization remain gaps.

**Dependencies.** `SieveMethodsAndPrimePatterns:SV.1`, `mathlib:Chebyshev.psi_le_const_mul_self`.

**Acceptance.** For T=1,x=2 the only nonzero summand is n=2, and an absolute C≥log2 suffices. The right side has one Λ(n), not Λ(n)²; the unweighted mean-square theorem alone does not supply this sharper estimate.

**Sources.** [A new proof of Halász’s theorem, and its consequences](https://arxiv.org/pdf/1706.03749v1), §2.3 Lemma2.6 and its complete proof, p.11.

### Multiplicative means and smooth numbers

<a id="pretentious-distance"></a>

#### Pretentious distance

`AnalyticNumberTheory:AN.5/pretentious-distance` · definition · `TauCeti.AnalyticNumberTheory.pretentious_distance`.

For complex-valued f,g on positive integers and x≥1, D(f,g;x)=sqrt(Σ_{p≤x}(1−Re(f(p)conj(g(p))))/p), used under |f(p)|,|g(p)|≤1. This is a distance on prime data, not a metric on all multiplicative functions: D(f,f;x) can be positive if |f(p)|<1.

**Construction and proof.**

1. Take the finite prime set p≤floor x and the real square root of the displayed sum. Under unit-disc prime values each summand is nonnegative.
2. All evaluation, symmetry, prime-data and cutoff API statements follow from finite sums and the real square-root laws; use the separately promoted square-nonnegative lemma when it is a prerequisite.

**API.**

- `pretentious_distance.square` (characterisation): D² is the displayed nonnegative finite prime sum under the unit-disc hypotheses.
- `pretentious_distance.symmetric` (relation): D(f,g;x)=D(g,f;x).
- `pretentious_distance.cutoff` (functoriality): For 1≤x≤y the squared distance is nondecreasing.
- `pretentious_distance.unit_diagonal` (simp): If |f(p)|=1 for p≤x, then D(f,f;x)=0.
- `pretentious_distance.prime_data` (extensionality): Equal values on all primes≤x give equal distances.

**Unit tests.**

- `pretentious_distance.unit` (computation): D(1,1;x)=0.
- `pretentious_distance.minus` (computation): D(1,−1;x)²=2Σ_{p≤x}1/p.
- `pretentious_distance.disc` (non-example): D(0,0;2)²=1/2, disproving an unqualified metric diagonal axiom.
- `pretentious_distance.empty` (computation): D(f,g;1)=0.

**Acceptance.** D(1,1;x)=0. D(1,−1;x)²=2Σ_{p≤x}1/p. D(0,0;2)²=1/2, disproving an unqualified metric diagonal axiom. D(f,g;1)=0.

**Uses.** `AnalyticNumberTheory:AN.5/halasz-classical`: Measure approximation to the completely multiplicative twist n^(it).

**Sources.** [Pretentious multiplicative functions and an inequality for the zeta-function](https://arxiv.org/pdf/math/0608407), pp.2–4: M(x,T) on p.2 and weighted unit-disc product norm on pp.3–4.

**Atlas planet.** Pretentious distance.

<a id="halasz-coefficient-class"></a>

#### Logarithmic-derivative coefficient class

`AnalyticNumberTheory:AN.5/halasz-coefficient-class` · definition · `TauCeti.AnalyticNumberTheory.halasz_coefficient_class`.

For κ>0, C(κ) is a predicate on the pinned ArithmeticFunction C, with its fixed value f(0)=0 and ordinary coprime multiplicativity f(1)=1. Membership is witnessed by an ArithmeticFunction C coefficient b=Λ_f with |b(n)|≤κΛ(n) for every n, including0,1. For every Re s>1 the three series F(s)=LSeries f s, LSeries b s and H(s)=LSeries (n↦b(n)/log n) s are absolutely convergent, F(s)=exp(H(s)), and −F′(s)/F(s)=LSeries b s. Division at n=0,1 is totalized to0, since b(0)=b(1)=0. This exponential identity fixes the Euler logarithm branch; it is not an arbitrary Prop field or an unrelated logarithm. Coefficient uniqueness follows from the logarithmic derivative and pinned LSeries uniqueness, including the normalized zero coefficient.

**Construction and proof.**

1. Use the existing arithmetic-function carrier and coprime-multiplicative predicate. Require a concrete zero-extended b and the stated inequalities and three summability/analytic identities on the genuine convergence half-plane.
2. Use choice to expose b through the data API; apply LSeries.eq_of_LSeries_eventually_eq to prove witness uniqueness at positive n and zero extension at0. The logarithmic series has coefficients b(n)/log n; no new generic Dirichlet-series theory is planned.
3. Derive nonvanishing from F=exp(H), monotonicity in κ from the coefficient bound, and extensionality from the underlying arithmetic functions. The unit, Möbius, norm-twist and growth rejection tests compare exact coefficients.

**Dependencies.** `mathlib:ArithmeticFunction.IsMultiplicative`, `mathlib:LSeries.eq_of_LSeries_eventually_eq`, `mathlib:LSeriesSummable`.

**API.**

- `halasz_coefficient_class.log_coeff` (data): Given h:f∈C(κ), expose the uniquely determined zero-extended arithmetic function Λ_f together with its summability and logarithmic-derivative identity. Any two membership witnesses choose the same Λ_f.
- `halasz_coefficient_class.majorant` (projection): |Λ_f(n)|≤κΛ(n) for every n, hence they vanish away from prime powers.
- `halasz_coefficient_class.nonzero` (compatibility): The Euler-compatible exponential identity gives F(s)≠0 on Re s>1.
- `halasz_coefficient_class.mono` (functoriality): If κ≤κ′, C(κ)⊆C(κ′).
- `halasz_coefficient_class.log_coeff_unique` (extensionality): If a zero-extended b has an absolutely convergent LSeries on Re s>1 equal there to −F′/F, it equals the exposed Λ_f. The zero coefficient is fixed; LSeries itself ignores it.
- `halasz_coefficient_class.constructor` (constructor): Coprime-multiplicative f and a coefficient b with the stated majorant, three summability conditions, exponential identity and logarithmic-derivative identity produce membership in C(κ), for κ>0.

**Unit tests.**

- `halasz_coefficient_class.one` (computation): f(n)=1 belongs to C(1), with Λ_f=Λ.
- `halasz_coefficient_class.mobius` (computation): μ belongs to C(1), with Λ_f=−Λ.
- `halasz_coefficient_class.twist` (computation): f(n)=n^(it) belongs to C(1), with Λ_f(n)=n^(it)Λ(n).
- `halasz_coefficient_class.growth` (computation): f(n)=n belongs to no fixed C(κ), since |Λ_f(p)|=p log p.

**Acceptance.** f(n)=1 belongs to C(1), with Λ_f=Λ. μ belongs to C(1), with Λ_f=−Λ. f(n)=n^(it) belongs to C(1), with Λ_f(n)=n^(it)Λ(n). f(n)=n belongs to no fixed C(κ), since |Λ_f(p)|=p log p.

**Uses.** `AnalyticNumberTheory:AN.5/halasz-integral-bound`: The source extends the bounded-multiplicative mean theorem to logarithmic-derivative majorants.

**Sources.** [A new proof of Halász’s theorem, and its consequences](https://arxiv.org/pdf/1706.03749v1), §1 p.1, first three displayed series and definition of C(κ).

<a id="smooth-count"></a>

#### Smooth-number counting function

`AnalyticNumberTheory:AN.5/smooth-count` · definition · `TauCeti.AnalyticNumberTheory.smooth_count`.

For x≥1,y≥2, Ψ(x,y)=#{1≤n≤floor x:every prime factor of n is≤y}. Express the set using Nat.smoothNumbers(floor y+1); the pinned carrier uses prime factors strictly below its cutoff.

**Construction and proof.**

1. Define Ψ for all real x,y using Nat.smoothNumbersUpTo(floor x)(floor y+1), then restrict analytic statements to x≥1,y≥2. Nonnegative floor converts the strict natural-prime cutoff to p≤y on this domain.
2. Use the pinned membership lemma for positivity and x cutoff; monotonicity follows from floor monotonicity and finite-set inclusion. If y≥x≥2 every positive n≤floor x has all prime divisors≤n≤y.
3. Check the two finite examples and exclusion of0 against the native finite set; the value at x<1 is0 because floor x=0.

**Dependencies.** `mathlib:Nat.smoothNumbers`, `mathlib:Nat.smoothNumbersUpTo`, `mathlib:Nat.mem_smoothNumbersUpTo`.

**API.**

- `smooth_count.floor` (compatibility): Ψ(x,y) counts the positive naturals≤floor x in Nat.smoothNumbers(floor y+1).
- `smooth_count.mono` (functoriality): Ψ is nondecreasing in each real parameter.
- `smooth_count.large_y` (simp): For y≥x≥2, Ψ(x,y)=floor x.
- `smooth_count.unit` (simp): The integer1 always contributes once.

**Unit tests.**

- `smooth_count.two` (computation): Ψ(8,2)=4, counting1,2,4,8.
- `smooth_count.inclusive` (computation): Ψ(6,3)=5, counting1,2,3,4,6; the prime3 is included.
- `smooth_count.zero` (computation): 0 is never counted.
- `smooth_count.empty` (computation): Ψ(0,2)=0.

**Acceptance.** Ψ(8,2)=4, counting1,2,4,8. Ψ(6,3)=5, counting1,2,3,4,6; the prime3 is included. 0 is never counted. Ψ(0,2)=0; the real extension has no nonpositive integers.

**Uses.** `AnalyticNumberTheory:AN.5/dickman-fixed-u`: Fixed-u smooth-integer asymptotics.

**Sources.** [Integers without large prime factors](https://www.numdam.org/item/JTNB_1993__5_2_411_0.pdf), Introduction, printed p.411 (terminology); Introduction p.412 and §1 p.414 formula(1.3).

**Atlas planet.** Smooth numbers.

<a id="dickman-function"></a>

#### Dickman function

`AnalyticNumberTheory:AN.5/dickman-function` · definition · `TauCeti.AnalyticNumberTheory.dickman_function`.

ρ:R→R is0 for u<0, equals1 for0≤u≤1, is continuous on[0,∞), and satisfies uρ′(u)=−ρ(u−1) on u>1. Construct it recursively on intervals[k,k+1] by integration; the value at0 is1, so no continuity across negative u is claimed.

**Construction and proof.**

1. Set ρ=0 on negative arguments and ρ=1 on[0,1]. Inductively define ρ(u)=ρ(k)−∫_k^u ρ(t−1)/t dt for k≥1 and k≤u≤k+1. The integrand is continuous on each step; endpoint agreement glues a continuous function on[0,∞).
2. The fundamental theorem of calculus gives HasDerivAt ρ(−ρ(u−1)/u) u for u>1. Continuity is not differentiability at1: the left derivative is0 and the right derivative is−1. Telescoping the steps yields the global integral recursion.
3. Two continuous integral-recursion solutions with the same initial data agree by induction on consecutive unit intervals. No uniqueness outside[0,∞) follows unless the negative convention is imposed.
4. For all real u prove uρ(u)=∫_{u−1}^uρ(v)dv: check u≤1 directly, and for u>1 differentiate both sides and match at1. This identity supplies the first-zero contradiction; positivity implies strict decrease for u>1 and antitonicity on[0,∞). Hildebrand–Tenenbaum Lemma2.5 has this complete elementary proof.

**API.**

- `dickman_function.initial` (simp): ρ(u)=1 on[0,1].
- `dickman_function.recursion` (characterisation): For u≥1, ρ(u)=1−∫_1^u ρ(t−1)/t dt.
- `dickman_function.unique` (extensionality): These initial values and the delay equation determine ρ uniquely on[0,∞).
- `dickman_function.positive` (projection): ρ(u)>0 for every finite u≥0, and ρ is nonincreasing on[0,∞).
- `dickman_function.negative` (simp): ρ(u)=0 for u<0; no continuity across0 is asserted.
- `dickman_function.continuous` (projection): ContinuousOn ρ[0,∞).
- `dickman_function.delay` (characterisation): For u>1, HasDerivAt ρ(−ρ(u−1)/u) u; do not claim differentiability at1.
- `dickman_function.interval_identity` (characterisation): For every real u, uρ(u)=∫_{u−1}^uρ(v)dv, with the fixed negative extension.

**Unit tests.**

- `dickman_function.zero` (computation): ρ(0)=ρ(1)=1.
- `dickman_function.two` (computation): ρ(2)=1−log2.
- `dickman_function.negative` (computation): ρ(−1)=0; extending1 to negative u would violate the convention.

**Acceptance.** ρ(0)=ρ(1)=1. ρ(2)=1−log2. ρ(−1)=0; extending1 to negative u would violate the convention. The delay derivative holds at integers≥2, but not at1.

**Uses.** `AnalyticNumberTheory:AN.5/dickman-fixed-u`: Main term in the fixed-u limit of Ψ.

**Sources.** [Integers without large prime factors](https://www.numdam.org/item/JTNB_1993__5_2_411_0.pdf), Introduction, printed p.411 (terminology); p.414 equation(1.5); §2 Lemma2.5 and complete proof p.426.

**Atlas planet.** Dickman function.

<a id="pretentious-product-triangle"></a>

#### Triangle inequality for pretentious products

`AnalyticNumberTheory:AN.5/pretentious-product-triangle` · lemma · `TauCeti.AnalyticNumberTheory.pretentious_product_triangle`.

For |f_j(p)|,|g_j(p)|≤1, D(f₁f₂,g₁g₂;x)≤D(f₁,g₁;x)+D(f₂,g₂;x). If all g_j have unit modulus on the primes, this gives the usual triangle inequality for prime data.

**Construction and proof.**

1. Apply unit-disc-product-distance to z=f₁(p)conj(g₁(p)), w=f₂(p)conj(g₂(p)) for each prime p≤x.
2. Multiply by sqrt(1/p), sum the squares, and apply finite Cauchy–Schwarz to obtain the weighted Euclidean product triangle.
3. For D(f,h)≤D(f,g)+D(g,h), the intermediate g must have |g(p)|=1 so f(p)conj(g(p))g(p)conj(h(p))=f(p)conj(h(p)). Do not impose a zero diagonal on arbitrary unit-disc functions.

**Dependencies.** [`AnalyticNumberTheory:AN.5/pretentious-distance`](#pretentious-distance), [`AnalyticNumberTheory:AN.5/pretentious-square-nonnegative`](#pretentious-square-nonnegative), [`AnalyticNumberTheory:AN.5/unit-disc-product-distance`](#unit-disc-product-distance).

**Acceptance.** The scalar extension includes z=0 or w=0. An intermediate unit-modulus prime function yields the usual three-function triangle; a unit-disc diagonal need not vanish.

**Sources.** [Pretentious multiplicative functions and an inequality for the zeta-function](https://arxiv.org/pdf/math/0608407), pp.3–4, inequality(5) and the unit-disc weight example.

<a id="halasz-integral-bound"></a>

#### Halász integral mean bound

`AnalyticNumberTheory:AN.5/halasz-integral-bound` · theorem · `TauCeti.AnalyticNumberTheory.halasz_integral_bound`.

For fixed κ>0, f∈C(κ) and sufficiently large x, |Σ_{n≤x}f(n)|≤C_κ x/log x ·∫_{1/log x}^1 max_{|t|≤(log x)^κ}|F(1+σ+it)/(1+σ+it)| dσ/σ + C_κ x(log log x)^κ/log x. The constant is uniform in f.

**Construction and proof.**

1. Use the small/large-prime convolution split, the exact double-integral identity Lemma2.2, Shiu upper bound Lemma2.3, errors Lemmas2.4–2.5 and Proposition2.1. The original Shiu proof and the real-κ divisor majorant are unresolved suppliers.
2. Take T=(log x)^(κ+1), y=T²=(log x)^(2κ+2), η=1/log y; for sufficiently large x these satisfy the Proposition2.1 range1≤T≤x^(9/10),10≤y≤sqrt x.
3. Apply the separate single-Λ weighted mean-square lemma to the two large-prime polynomials, then Cauchy–Schwarz and Chebyshev weighted summation(2.6). The ordinary unweighted mean-square node cannot replace this step.
4. After integrating α, set σ=β+1/log x. Restrict the t maximum from T to(log x)^κ using |F(1+σ+it)|≤ζ(1+σ)^κ and its denominator; the tail contributes O_κ(x/log x). Enlarge the σ interval to1 and combine O_κ(x(log log x)^κ/log x) errors.

**Dependencies.** [`AnalyticNumberTheory:AN.5/halasz-coefficient-class`](#halasz-coefficient-class), `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation`, `SieveMethodsAndPrimePatterns:SV.1`, [`AnalyticNumberTheory:AN.5/mangoldt-polynomial-mean-square`](#mangoldt-polynomial-mean-square).

**Acceptance.** Constants and the sufficiently-large-x threshold depend only on κ, before quantifying over f∈C(κ). The maximum is of |F(s)/s|, not |F(s)|; the final t range is (log x)^κ, while the proof uses the larger auxiliary T.

**Sources.** [A new proof of Halász’s theorem, and its consequences](https://arxiv.org/pdf/1706.03749v1), Theorem1.1 p.2; §2 pp.7–12, Lemmas2.2–2.6, Proposition2.1 and final proof.

**Atlas planet.** Halász theorem.

<a id="halasz-classical"></a>

#### Pretentious Halász mean bound

`AnalyticNumberTheory:AN.5/halasz-classical` · theorem · `TauCeti.AnalyticNumberTheory.halasz_classical`.

For multiplicative |f(n)|≤1, x≥2,T≥1, let M(x,T)=min_{|t|≤2T}D(f,n^(it);x)². Then |Σ_{n≤x}f(n)|/x≤C((1+M)e^−M+T^−1/2), with an absolute C; increasing C handles bounded x.

**Construction and proof.**

1. Use the classical Halász theorem with the twist-minimum convention |t|≤2T.
2. The phase n^(it) and its complex conjugate in the distance give Re(f(p)p^−it) in the sum.

**Dependencies.** [`AnalyticNumberTheory:AN.5/pretentious-distance`](#pretentious-distance).

**Acceptance.** For f(n)=n^(it₀), |t₀|≤2T, the twist minimum M is0, so the bound allows a nonzero mean. For f identically0 on primes the distance diagonal is not assumed to vanish; no completely-multiplicative hypothesis is imposed on general f.

**Sources.** [Pretentious multiplicative functions and an inequality for the zeta-function](https://arxiv.org/pdf/math/0608407), p.2, displayed definition of M(x,T) and following mean-value bound.

<a id="dickman-fixed-u"></a>

#### Dickman fixed-u asymptotic

`AnalyticNumberTheory:AN.5/dickman-fixed-u` · theorem · `TauCeti.AnalyticNumberTheory.dickman_fixed_u`.

For each fixed u>0, Ψ(x,x^(1/u))/x→ρ(u) as x→∞. This statement is not uniform for u tending to infinity.

**Construction and proof.**

1. For0<u≤1 eventually y=x^(1/u)≥x, so Ψ=floor x and the limit is1.
2. For u>1 use the separate largest-prime decomposition and quantitative partial summation of rational prime counts, then identify its normalized limit recursively on consecutive bounded u intervals.
3. The moving prime-sum/Riemann-integral error, short terminal range and compact-u uniformity needed for induction must be supplied as explicit analytic lemmas before applying uniqueness of the Dickman integral solution. The moving-range and compact-uniform error estimates are part of the Dickman asymptotic target.

**Dependencies.** [`AnalyticNumberTheory:AN.5/smooth-count`](#smooth-count), [`AnalyticNumberTheory:AN.5/dickman-function`](#dickman-function), [`AnalyticNumberTheory:AN.2/chebyshev-prime-count-transfer`](#chebyshev-prime-count-transfer), [`AnalyticNumberTheory:AN.5/smooth-largest-prime-decomposition`](#smooth-largest-prime-decomposition).

**Acceptance.** The specialization u=1 has exact Ψ(x,x)=floor x for x≥2. At u=2 the limit is1−log2. Constants may depend on a fixed compact u range; this yields no growing-u uniformity.

**Sources.** [Integers without large prime factors](https://www.numdam.org/item/JTNB_1993__5_2_411_0.pdf), Introduction, printed p.411 (terminology); p.414 equations(1.5)–(1.6).

<a id="smooth-rankin-bound"></a>

#### Rankin smooth-number upper bound

`AnalyticNumberTheory:AN.5/smooth-rankin-bound` · theorem · `TauCeti.AnalyticNumberTheory.smooth_rankin_bound`.

For x≥1,y≥2 and σ>0, Ψ(x,y)≤x^σ∏_{p≤y}(1−p^−σ)^−1. The finite-prime Euler product is finite and each geometric series converges.

**Construction and proof.**

1. For each counted positive n≤x and σ>0,1≤(x/n)^σ. Bound the finite count by x^σ times its finite n^(−σ) sum.
2. Enlarge to the summable nonnegative series over all positive y-smooth integers, using the separately named finite-prime Euler-series lemma.
3. Apply the geometric factorization. For x=1, Ψ=1 and all Euler factors exceed1, so the bound includes the endpoint.

**Dependencies.** [`AnalyticNumberTheory:AN.5/smooth-count`](#smooth-count), [`AnalyticNumberTheory:AN.5/smooth-finite-euler-series`](#smooth-finite-euler-series).

**Acceptance.** The bound is valid for every σ>0, includingσ≤1; only finitely many primes occur. For x=1 the count is1; σ=0 is excluded because the geometric factors are not summable.

**Sources.** [Integers without large prime factors](https://www.numdam.org/item/JTNB_1993__5_2_411_0.pdf), Introduction, printed p.411 (terminology); p.414 equation(1.3), page image.

<a id="unit-disc-product-distance"></a>

#### Unit-disc product distance inequality

`AnalyticNumberTheory:AN.5/unit-disc-product-distance` · lemma · `TauCeti.AnalyticNumberTheory.unit_disc_product_distance`.

For complex z,w with |z|,|w|≤1, sqrt(1−Re(zw))≤sqrt(1−Re z)+sqrt(1−Re w).

**Construction and proof.**

1. Put a=1−Re z and b=1−Re w, so a,b≥0 and (Im z)²≤2a, (Im w)²≤2b by the unit-disc assumptions.
2. Then 1−Re(zw)=a+b−ab+(Im z)(Im w)≤a+b+2sqrt(ab)=(sqrt a+sqrt b)². Both sides are nonnegative, so take square roots. This proves the extension from the unit circle without assuming it.

**Acceptance.** z=w=−1 gives left side0, while z=w=0 gives left side1.

**Sources.** [Pretentious multiplicative functions and an inequality for the zeta-function](https://arxiv.org/pdf/math/0608407), p.4 first paragraph, extension of the η product inequality to the closed unit disc.

<a id="smooth-largest-prime-decomposition"></a>

#### Largest-prime-factor smooth decomposition

`AnalyticNumberTheory:AN.5/smooth-largest-prime-decomposition` · lemma · `TauCeti.AnalyticNumberTheory.smooth_largest_prime_decomposition`.

For x≥1,y≥2, Ψ(x,y)+∑_{y<p≤x, p prime}Ψ(x/p,p)=floor x. Each positive non-y-smooth integer has a unique largest prime divisor p>y, and dividing by one copy of p leaves a p-smooth integer. Repeated largest primes are permitted.

**Construction and proof.**

1. Partition the finite set of positive n≤floor x into y-smooth integers and those whose largest prime factor is p>y. The latter p satisfies p≤x.
2. For each p use n↦n/p and m↦p*m to identify its fibre with positive p-smooth m≤floor(x/p). Repeated p in m is allowed; a p-rough or strict-p-smooth fibre would be wrong.
3. Sum disjoint fibre cardinalities and account for1 in the smooth fibre.

**Dependencies.** [`AnalyticNumberTheory:AN.5/smooth-count`](#smooth-count), `mathlib:Nat.mem_smoothNumbersUpTo`.

**Acceptance.** For x=6,y=2, Ψ=3 and the p=3,5 fibres have sizes2,1; their sum is6.

**Sources.** [Integers without large prime factors](https://www.numdam.org/item/JTNB_1993__5_2_411_0.pdf), Introduction, printed p.411 (terminology); p.414 fixed-u formula(1.6); elementary largest-prime partition used for its limiting recursion.

<a id="smooth-finite-euler-series"></a>

#### Finite-prime smooth Dirichlet series

`AnalyticNumberTheory:AN.5/smooth-finite-euler-series` · lemma · `TauCeti.AnalyticNumberTheory.smooth_finite_euler_series`.

For y≥2 and σ>0, the nonnegative real series ∑_{n≥1, n y-smooth}n^(−σ) is summable and equals ∏_{p≤y}(1−p^(−σ))^(−1). This is a finite-prime identity valid for every positive σ, even σ≤1.

**Construction and proof.**

1. Use Nat.equivProdNatFactoredNumbers inductively on the finite set of primes≤y to index smooth positive integers by their independent nonnegative prime exponents.
2. Each p≥2 has0<p^(−σ)<1. Its geometric series is summable; finite products/Tonelli and rpow multiplication factor the sum. The zero integer is excluded by the existing carrier.
3. Identify the finite prime set with primes strictly below floor y+1. No infinite-prime Euler product on Re s>1 is substituted for this stronger finite-prime statement.

**Dependencies.** [`AnalyticNumberTheory:AN.5/smooth-count`](#smooth-count), `mathlib:Nat.equivProdNatFactoredNumbers`.

**Acceptance.** For y=2, the series over1,2,4,… is(1−2^(−σ))⁻¹ for every σ>0.

**Sources.** [Integers without large prime factors](https://www.numdam.org/item/JTNB_1993__5_2_411_0.pdf), Introduction, printed p.411 (terminology); p.414 equation(1.3), finite-prime geometric factorization.

### Zeta moments

<a id="zeta-second-moment"></a>

#### Second moment of zeta

`AnalyticNumberTheory:AN.5/zeta-second-moment` · theorem · `TauCeti.AnalyticNumberTheory.zeta_second_moment`.

As T→∞, ∫_0^T|ζ(1/2+it)|²dt=T log(T/(2π))+(2γ−1)T+O(√T log T), with an absolute constant.

**Construction and proof.**

1. Use a proved approximate functional equation with its uniform error.
2. Integrate the diagonal and control off-diagonal terms using a Dirichlet-polynomial mean value theorem.

**Acceptance.** All source-proof and normalization gaps remain open; the displayed bound/signature is a target rather than a freshly verified theorem. Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Analytic Number Theory stage specification](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/content/campaign/AnalyticNumberTheory/README.md), AN.5 target specification.

<a id="zeta-fourth-moment"></a>

#### Fourth moment of zeta

`AnalyticNumberTheory:AN.5/zeta-fourth-moment` · theorem · `TauCeti.AnalyticNumberTheory.zeta_fourth_moment`.

As T→∞, ∫_0^T|ζ(1/2+it)|⁴dt=(1/(2π²))T(log T)^4+O(T(log T)^3), with an absolute constant.

**Construction and proof.**

1. Use the original Ingham fourth-moment proof, including its approximate functional equation.
2. Separate diagonal and off-diagonal estimates; the second-moment theorem does not imply this constant.

**Acceptance.** All source-proof and normalization gaps remain open; the displayed bound/signature is a target rather than a freshly verified theorem. Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Analytic Number Theory stage specification](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/content/campaign/AnalyticNumberTheory/README.md), AN.5 target specification.

<a id="moment-model-comparison"></a>

#### Moment model as a conditional comparison

`AnalyticNumberTheory:AN.5/moment-model-comparison` · comparison · `TauCeti.AnalyticNumberTheory.moment_model_comparison`.

For each fixed k>0, the statement ∫_0^T|ζ(1/2+it)|^(2k)dt∼a(k)g(k)T(log T)^(k²) is a conjectural model with the arithmetic Euler factor a(k) and random-matrix factor g(k) supplied by PM.5. No asymptotic for general k is asserted unconditionally; k=1 and2 are checked against the proved moments.

**Construction and proof.**

1. Import the actual probability/model carrier and exact a(k),g(k) normalization from PM.5.
2. Compare k=1 and2 constants with the analytic moment theorems; treat other k as a named hypothesis.

**Dependencies.** [`AnalyticNumberTheory:AN.5/zeta-second-moment`](#zeta-second-moment), [`AnalyticNumberTheory:AN.5/zeta-fourth-moment`](#zeta-fourth-moment), `ProbabilisticAndMetricNumberTheory:PM.5`.

**Acceptance.** All source-proof and normalization gaps remain open; the displayed bound/signature is a target rather than a freshly verified theorem. Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [Analytic Number Theory stage specification](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/content/campaign/AnalyticNumberTheory/README.md), AN.5 target specification.

### Indexed Beurling systems

<a id="beurling-prime-system"></a>

#### Beurling prime system

`AnalyticNumberTheory:AN.5/beurling-prime-system` · definition · `TauCeti.AnalyticNumberTheory.beurling_prime_system`.

A discrete Beurling prime system is a nondecreasing sequence of real numbers1<p₁≤p₂≤… tending to∞. Generalized integers are finite-support exponent vectors a:N→N, with norm∏p_j^(a_j); coincident real values are counted with multiplicity. N(x) counts these vectors of norm≤x, and π_P(x) counts the prime indices with p_j≤x.

**Construction and proof.**

1. Use a monotone real sequence p:N→R with p(0)>1 and p→∞. Generalized integers are N→₀N, not the set of real norm values. Define their norm by the finite product and counts by finite subtype cardinality.
2. For x≥1, only finitely many indices satisfy p(i)≤x, by escape to∞; every contributing exponent is≤log x/log p(0). Every positive exponent forces its prime≤x. Embed contributing vectors into the product of these finite exponent intervals. For x<1 there are none, since every norm≥1.
3. Coordinatewise addition gives norm(a+b)=norm(a)norm(b); the zero vector has norm1. Unique factorization of ordinary positive naturals supplies the ordinary-prime compatibility, preserving repeated norms for a general system.

**Dependencies.** `mathlib:Nat.primeCounting`.

**API.**

- `beurling_prime_system.norm` (data): The norm is the finite product with exponent multiplicities.
- `beurling_prime_system.finite` (projection): Only finitely many exponent vectors have norm≤x, because only finitely many primes≤x occur and p₁>1 bounds every exponent.
- `beurling_prime_system.unit` (simp): The zero exponent vector has norm1 and is counted once.
- `beurling_prime_system.multiplicity` (characterisation): Equal real products from different vectors contribute separately to N.
- `beurling_prime_system.ordinary` (compatibility): Taking the increasing ordinary prime sequence recovers the ordinary positive integers and prime count.
- `beurling_prime_system.ext` (extensionality): Two systems with identical indexed prime sequences are equal; proof fields do not change the carrier.
- `beurling_prime_system.norm_pos` (projection): For every exponent vector a,1≤norm(a), in particular norm(a)>0.
- `beurling_prime_system.norm_add` (relation): For exponent vectors a,b, norm(a+b)=norm(a)norm(b).
- `beurling_prime_system.prime_finite` (projection): For every real x the prime indices i with p(i)≤x form a finite set.

**Unit tests.**

- `beurling_prime_system.ordinary` (computation): The ordinary primes give N(10)=10.
- `beurling_prime_system.repeated` (computation): If p₁=p₂=2<p₃, N(2)=3, counting the unit and two distinct norm2 vectors.
- `beurling_prime_system.unit` (computation): For1≤x<p₁, N(x)=1 and π_P(x)=0.
- `beurling_prime_system.invalid` (non-example): A sequence with p₁=1 is rejected because N(x) would have infinitely many unit powers.
- `beurling_prime_system.empty` (degenerate): For x=0 both N(x) and π_P(x) are0; the unit appears at x=1.

**Acceptance.** The ordinary primes give N(10)=10. If p₁=p₂=2<p₃, N(2)=3, counting the unit and two distinct norm2 vectors. For1≤x<p₁, N(x)=1 and π_P(x)=0. A sequence with p₁=1 is rejected because N(x) would have infinitely many unit powers.

**Uses.** `AnalyticNumberTheory:AN.5/beurling-zeta-product`: Define the zeta sum with the correct multiplicity.

**Sources.** [On general prime number theorems with remainder](https://arxiv.org/pdf/1601.05324), Introduction p.1, definition and counting functions (1); §2.1 p.3.

**Atlas planet.** Beurling primes.

<a id="beurling-zeta"></a>

#### Zeta function of an indexed Beurling system

`AnalyticNumberTheory:AN.5/beurling-zeta` · definition · `TauCeti.AnalyticNumberTheory.beurling_zeta`.

For an indexed Beurling prime system P and Re s>1 with Σ_(a∈N^(N))norm_P(a)^−σ summable for every real σ>1, define ζ_P(s)=Σ_a exp(−s log(norm_P(a))) over finitely supported exponent vectors. Repeated prime values remain different indices. The totalized sum outside this domain is not its analytic continuation.

**Construction and proof.**

1. Compact subsets of Re s>1 admit a fixed summable real majorant from a smaller real exponent σ₀>1.
2. Independent geometric sums on finite prime-index sets converge to the vector series. Summable logarithmic factors give a nonzero limit.

**Dependencies.** [`AnalyticNumberTheory:AN.5/beurling-prime-system`](#beurling-prime-system), [`AnalyticNumberTheory:AN.5/beurling-count-growth`](#beurling-count-growth).

**API.**

- `beurling_zeta.summable` (characterisation): The exponent-vector complex series is absolutely summable on Re s>1 under the stated real convergence hypothesis.
- `beurling_zeta.nonzero` (relation): ζ_P(s)≠0 on Re s>1 under the same hypothesis.
- `beurling_zeta.analytic` (structure): ζ_P is analytic on a neighbourhood of every point of Re s>1.

**Unit tests.**

- `beurling_zeta.ordinary` (compatibility): For the indexed ordinary primes, ζ_P(s)=ζ(s) on Re s>1.
- `beurling_zeta.doubled` (non-example): On Re s>1, if every ordinary prime appears at two consecutive indices, ζ_P(s)=ζ(s)².
- `beurling_zeta.unit_term` (degenerate): The zero exponent vector contributes exactly1 for every s.

**Acceptance.** Verify the stated constants, endpoints and conventions against the source and discriminating examples.

**Uses.** `AnalyticNumberTheory:AN.5`: Zeta function of an indexed Beurling system

**Sources.** [On general prime number theorems with remainder](https://arxiv.org/pdf/1601.05324), §2.1, (5)–(7) and discrete Euler product, printed pp.2–3.

<a id="beurling-zeta-product"></a>

#### Beurling zeta and Euler product

`AnalyticNumberTheory:AN.5/beurling-zeta-product` · lemma · `TauCeti.AnalyticNumberTheory.beurling_zeta_product`.

If Σ_n n^−σ (with generalized-integer multiplicities) converges for every real σ>1, then ζ_P(s)=Σ_n n^−s=∏_j(1−p_j^−s)^−1 on Re s>1, absolutely and locally uniformly. The convergence hypothesis is additional to the prime-system axioms.

**Construction and proof.**

1. Define ζ_P(s) by the summable exponent-vector series exp(−s log norm(a)); keep the additional summability assumption for every realσ>1. For the first M indexed primes, independent geometric summation gives the finite Euler product, with ratio p_j^(−s) of norm<1.
2. Exhaust all finite-support vectors with the first M indices. On a compact K⊂{Re s>1}, choose1<σ₀<inf_K Re s; norm(a)≥1 makes the summable norm(a)^−σ₀ series a uniform majorant. The finite-prime tails converge uniformly to the full series.
3. For a nonzero Euler product, additionally sum the logarithmic local factors using |p_j^(−s)|≤p_j^−σ₀ and the prime-index-to-vector injection. The normalized analytic logarithm is this convergent sum, not an arbitrary pointwise principal logarithm of ζ_P.

**Dependencies.** [`AnalyticNumberTheory:AN.5/beurling-prime-system`](#beurling-prime-system), [`AnalyticNumberTheory:AN.5/beurling-count-growth`](#beurling-count-growth), [`AnalyticNumberTheory:AN.5/beurling-zeta`](#beurling-zeta).

**Acceptance.** On the ordinary prime system the series and product recover ζ on Re s>1. For the doubled ordinary-prime sequence the product is ζ(s)²; no coincident-factor cancellation occurs. The bare prime-system axioms do not imply convergence on Re s>1.

**Sources.** [On general prime number theorems with remainder](https://arxiv.org/pdf/1601.05324), §2.1 pp.2–3, (5)–(7) and displayed discrete Euler product.

<a id="beurling-all-log-remainders"></a>

#### Beurling PNT with all logarithmic remainders

`AnalyticNumberTheory:AN.5/beurling-all-log-remainders` · theorem · `TauCeti.AnalyticNumberTheory.beurling_all_log_remainders`.

For a discrete Beurling system whose ζ converges on Re s>1, π_P(x)=Li(x)+O_m(x/log^m x) for every m≥1 iff N(x)=ax+O_m(x/log^m x) for every m≥1 for some a>0. Each error constant may depend on m and the system.

**Construction and proof.**

1. Replace π by Π using the separate higher-prime-power correction. Fix Li(x)=∫_2^x dt/log t for x≥2; any additive constant is swallowed by every stated error. Each m has its own constant and eventual threshold.
2. For S(u)=N(exp u), T(u)=a exp u, use Theorem3(i)⇔(ii)⇔(iii). G(s)=ζ_P(s)−a/(s−1) is represented by its smooth closed-half-plane extension, not a junk-valued subtraction at1. Condition(ii) has one fixedε>0 controlling every derivative (with derivative-dependent constants); condition(iii) is uniform onσ>1 for eachε>0 and each derivative.
3. Proposition1 provides the Abelian direction by integration by parts and X=|t|^(1/γ). Theorem2 gives the reverse direction from a C∞ Laplace boundary with bounds G^(n)(1+it)=O(|t|^β_n), β_n/n→0, using monotonicity and T′≤A exp u. Its normalized Δ(u)=exp(−u)(S−T)(u), one-sided bump/Fourier smoothing and n-fold integration by parts produce Δ(h)=O(h^(−n/(β_n+1))). These are named missing analytic interfaces, not routine steps.
4. Theorem3 Lemma1 uses the3–4–1 inequality and derivative bounds to prove (s−1)ζ_P nonzero on the closed half-plane and1/ζ_P=O_ε((1+|t|)^ε). Use the Euler-series logarithm and its continuous extension, normalized on realσ>1.
5. Apply the same Tauberian/Abelian pair to S₁(u)=Π(exp u), T₁(u)=∫_1^(exp u)(1−1/y)/log y dy. Its transform is log((s−1)ζ_P(s))−log s on the matched analytic branch. The stronger Proposition1 bound o(log|t|) controls exponentiation in the reverse implication; a=exp G₁(1)>0 and smooth division by s−1 removes the apparent pole.

**Dependencies.** [`AnalyticNumberTheory:AN.5/beurling-prime-system`](#beurling-prime-system), [`AnalyticNumberTheory:AN.5/beurling-zeta-product`](#beurling-zeta-product), [`AnalyticNumberTheory:AN.5/beurling-prime-power-correction`](#beurling-prime-power-correction).

**Acceptance.** The density a>0 is quantified once, before all m. Error constants and eventual cutoffs may depend on P and m. Taking each ordinary prime twice gives N(x)∼x log x andπ_P(x)∼2Li(x), so neither side holds. Convergence alone does not force density1. The residue-subtracted boundary at1 is the extension value; no equality with the totalized series value there is asserted.

**Sources.** [On general prime number theorems with remainder](https://arxiv.org/pdf/1601.05324), Theorem1 p.2; entire §§3–4 pp.4–11, Theorem2, Proposition1, Theorem3, Lemma1.

<a id="harmonic-euler-remainder"></a>

#### Harmonic sum remainder

`AnalyticNumberTheory:AN.5/harmonic-euler-remainder` · lemma · `TauCeti.AnalyticNumberTheory.harmonic_euler_remainder`.

For every integer N≥1, 0<H_N−log N−γ<log(1+1/N)≤1/N, where H_N=Σ_{1≤n≤N}1/n and γ is the pinned Euler–Mascheroni constant.

**Construction and proof.**

1. Unfold the two pinned Euler-sequence inequalities at N>0; subtract to trap H_N−log N−γ between0 and log(N+1)−log N.
2. Use log(N+1)−log N=log(1+1/N) and the pinned positive-real log inequality. No new Euler constant is defined.

**Dependencies.** `mathlib:Real.eulerMascheroniSeq_lt_eulerMascheroniConstant`, `mathlib:Real.eulerMascheroniConstant_lt_eulerMascheroniSeq'`, `mathlib:Real.log_le_sub_one_of_pos`.

**Acceptance.** For N=1 the error is1−γ>0; N=0 is excluded.

**Sources.** [The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf), Theorem1.11 and complete proof, printed pp.15–16; pinned Euler-sequence inequalities.

<a id="beurling-count-growth"></a>

#### Beurling counting growth from summability

`AnalyticNumberTheory:AN.5/beurling-count-growth` · lemma · `TauCeti.AnalyticNumberTheory.beurling_count_growth`.

For a Beurling system P, real σ>0 and S=Σ_a norm(a)^−σ with summable nonnegative summands, N(x)≤S x^σ for x≥1, and π_P(x)≤N(x). Thus convergence for every σ>1 gives N(x),π_P(x)=O_ε(x^(1+ε)) for every ε>0.

**Construction and proof.**

1. Each counted vector satisfies1≤x^σ norm(a)^−σ. Bound its finite sum by the full summable nonnegative sum.
2. Map each counted prime index injectively to its unit exponent vector. Repeated equal real primes remain distinct vectors.

**Dependencies.** [`AnalyticNumberTheory:AN.5/beurling-prime-system`](#beurling-prime-system).

**Acceptance.** No growth rate follows from the prime-system axioms alone; p(i) growing arbitrarily slowly need not have abscissa≤1.

**Sources.** [On general prime number theorems with remainder](https://arxiv.org/pdf/1601.05324), §2.1 p.3, growth deduction after (6).

## AN.7 — Hurwitz, Lerch and parameter-dependent functions

### Lerch series and differential identities

<a id="lerch-transcendent"></a>

#### Lerch transcendent

`AnalyticNumberTheory:AN.7/lerch-transcendent` · definition · `TauCeti.AnalyticNumberTheory.lerch_transcendent`.

For |z|<1, Re c>0 and s∈C, Φ(z,s,c)=Σ_{n≥0}z^n exp(−s Log(n+c)), using the principal logarithm. This series defines a jointly holomorphic function on that domain. At z=1 the separate Hurwitz series requires Re s>1.

**Construction and proof.**

1. Define the series with exp(−s Log(n+c)); Re c>0 makes every n+c nonzero and keeps it in the principal-log analytic half-plane. At z=0, define z⁰=1; the n=0 term is retained.
2. Use the separate compact-series lemma to prove absolute convergence and joint holomorphy on |z|<1, Re c>0, s arbitrary. The definition itself is the initial series, so no analytic continuation is silently assigned to its totalized sum outside this domain.
3. Reindex the absolutely convergent series to obtain the c shift and the periodic/polylog z prefactor. Compare the explicit series in a when Im a>0; no independent Lerch-zeta carrier is assumed.

**Dependencies.** `mathlib:Complex.cpow_def_of_ne_zero`.

**API.**

- `lerch_transcendent.series` (characterisation): Φ is the displayed absolutely convergent series on |z|<1, Re c>0.
- `lerch_transcendent.zero` (simp): Φ(0,s,c)=exp(−s Log c).
- `lerch_transcendent.shift` (relation): Φ(z,s,c)=c^−s+zΦ(z,s,c+1).
- `lerch_transcendent.exp_change` (compatibility): For Im a>0, LerchZeta(s,a,c)=Φ(exp(2πia),s,c).
- `lerch_transcendent.polylog` (compatibility): The periodic/polylog series is zΦ(z,s,1), not Φ(z,s,1).
- `lerch_transcendent.holomorphic` (projection): The map(s,z,c)↦Φ(z,s,c) is jointly holomorphic on |z|<1, Re c>0, s∈C.
- `lerch_transcendent.deriv_s` (relation): On the initial domain, ∂_sΦ(z,s,c)=−Σ_{n≥0}z^n Log(n+c)exp(−sLog(n+c)); the differentiated series is absolutely and locally uniformly convergent.

**Unit tests.**

- `lerch_transcendent.zero` (computation): Φ(0,2,1)=1.
- `lerch_transcendent.s_zero` (computation): Φ(z,0,c)=1/(1−z) on |z|<1, independently of c.
- `lerch_transcendent.s_minus_one` (computation): Φ(z,−1,c)=c/(1−z)+z/(1−z)².
- `lerch_transcendent.normalization` (computation): For z=1/2 and s=0, Φ=2 while zΦ=1; omitting z fails the polylog comparison.

**Acceptance.** Φ(0,2,1)=1. Φ(z,0,c)=1/(1−z) on |z|<1, independently of c. Φ(z,−1,c)=c/(1−z)+z/(1−z)². For z=1/2 and s=0, Φ=2 while zΦ=1; omitting z fails the polylog comparison.

**Uses.** `AnalyticNumberTheory:AN.7/lerch-z-derivative`: Differentiate the convergent series. `AnalyticNumberTheory:AN.7/lerch-cover-continuation`: Fix the initial germ for multivalued continuation.

**Sources.** [The Lerch Zeta function III. Polylogarithms and special values](https://link.springer.com/content/pdf/10.1186/s40687-015-0049-2.pdf), Introduction (1.1); §3.3 pp.24–25; Theorem5.1 proof p.36.

**Atlas planet.** Lerch transcendent.

<a id="lerch-compact-series-bound"></a>

#### Lerch compact convergence

`AnalyticNumberTheory:AN.7/lerch-compact-series-bound` · lemma · `TauCeti.AnalyticNumberTheory.lerch_compact_series_bound`.

On every compact subset of |z|<1, Re c>0, s∈C, the Φ series and each fixed derivative in z,s,c converge uniformly and absolutely.

**Construction and proof.**

1. For a compact subset choose0<r₀<r<1 with |z|≤r₀, Re c≥δ>0, and |s|,|c| bounded. The principal argument of n+c stays within(−π/2,π/2). Thus |exp(−sLog(n+c))|≤C(n+1)^B uniformly, after treating finitely many small n.
2. Each fixed mixed derivative contributes finitely many factors polynomial in n, shifted powers of n+c and powers of Log(n+c). Differentiating z^n directly treats z=0 correctly: its d-th derivative is0 for n<d and a falling factorial times z^(n−d) otherwise.
3. Absorb every fixed polynomial/logarithmic factor and the finite index shift into C r^n using r₀<r; use a summable geometric majorant for absolute, uniform convergence and joint termwise differentiation.

**Dependencies.** [`AnalyticNumberTheory:AN.7/lerch-transcendent`](#lerch-transcendent).

**Acceptance.** Uniformity is on compact subsets, not up to |z|=1 or Re c=0. The z-derivative estimate remains valid at z=0 without dividing by z.

**Sources.** [The Lerch zeta function II. Analytic continuation](https://arxiv.org/pdf/1005.4967v2), §2 p.4 (2.1) and §5 pp.20–22 termwise derivative proof.

<a id="lerch-parameter-shift"></a>

#### Lerch shift identity

`AnalyticNumberTheory:AN.7/lerch-parameter-shift` · lemma · `TauCeti.AnalyticNumberTheory.lerch_parameter_shift`.

On the initial convergence domain, Φ(z,s,c)=c^−s+zΦ(z,s,c+1). For an already constructed analytic continuation it transports along matching lifted paths, including the shifted c path, by uniqueness.

**Construction and proof.**

1. Separate n=0 and reindex n≥1 in the absolutely convergent series.
2. Continue both sides along the same lifted c shift, keeping its branch data.

**Dependencies.** [`AnalyticNumberTheory:AN.7/lerch-transcendent`](#lerch-transcendent), [`AnalyticNumberTheory:AN.7/lerch-compact-series-bound`](#lerch-compact-series-bound).

**Acceptance.** The initial statement holds also at z=0; any continued version must use the same analytic germ and the matching shifted parameter path.

**Sources.** [The Lerch zeta function II. Analytic continuation](https://arxiv.org/pdf/1005.4967v2), §4 p.17, (4.30)–(4.32), specialized to N=0.

<a id="lerch-z-derivative"></a>

#### Lerch lowering relation

`AnalyticNumberTheory:AN.7/lerch-z-derivative` · lemma · `TauCeti.AnalyticNumberTheory.lerch_z_derivative`.

On the initial domain, z∂_zΦ(z,s,c)+cΦ(z,s,c)=Φ(z,s−1,c). For an already constructed continuation it transports along matching lifted paths by uniqueness.

**Construction and proof.**

1. Differentiate termwise using compact uniform convergence.
2. Combine n+c in the numerator, then continue the identity with its s−1 path.

**Dependencies.** [`AnalyticNumberTheory:AN.7/lerch-transcendent`](#lerch-transcendent), [`AnalyticNumberTheory:AN.7/lerch-compact-series-bound`](#lerch-compact-series-bound).

**Acceptance.** The initial statement holds also at z=0; any continued version must use the same analytic germ and the matching shifted parameter path.

**Sources.** [The Lerch Zeta function III. Polylogarithms and special values](https://link.springer.com/content/pdf/10.1186/s40687-015-0049-2.pdf), Theorem2.3 p.13 (2.3), §4 Theorem4.1 and proof p.33.

<a id="lerch-c-derivative"></a>

#### Lerch raising relation

`AnalyticNumberTheory:AN.7/lerch-c-derivative` · lemma · `TauCeti.AnalyticNumberTheory.lerch_c_derivative`.

On the initial domain, ∂_cΦ(z,s,c)=−sΦ(z,s+1,c), For an already constructed continuation the identity transports along the matching s+1 path by uniqueness.

**Construction and proof.**

1. Differentiate exp(−sLog(n+c)) termwise under compact convergence.
2. Use the same branch for n+c in the s and s+1 terms.

**Dependencies.** [`AnalyticNumberTheory:AN.7/lerch-transcendent`](#lerch-transcendent), [`AnalyticNumberTheory:AN.7/lerch-compact-series-bound`](#lerch-compact-series-bound).

**Acceptance.** The initial statement holds also at z=0; any continued version must use the same analytic germ and the matching shifted parameter path.

**Sources.** [The Lerch Zeta function III. Polylogarithms and special values](https://link.springer.com/content/pdf/10.1186/s40687-015-0049-2.pdf), Theorem2.3 p.13 (2.4), §4 Theorem4.1 and proof p.33.

<a id="lerch-pde"></a>

#### Lerch differential equation

`AnalyticNumberTheory:AN.7/lerch-pde` · lemma · `TauCeti.AnalyticNumberTheory.lerch_pde`.

(z∂_z+c)∂_cΦ(z,s,c)=−sΦ(z,s,c) on the initial domain and each matched continued branch. The right-hand side has a minus sign.

**Construction and proof.**

1. Apply the lowering relation with s+1 to the raising relation.
2. Both derivative identities retain the same branch.

**Dependencies.** [`AnalyticNumberTheory:AN.7/lerch-z-derivative`](#lerch-z-derivative), [`AnalyticNumberTheory:AN.7/lerch-c-derivative`](#lerch-c-derivative).

**Acceptance.** Check every endpoint and the stated dependence of constants; no conjectural input is implicit.

**Sources.** [The Lerch Zeta function III. Polylogarithms and special values](https://link.springer.com/content/pdf/10.1186/s40687-015-0049-2.pdf), Theorem2.3 p.13 (2.5), §4 Theorem4.1 and proof p.33.

<a id="lerch-integral-representation"></a>

#### Lerch integral representation

`AnalyticNumberTheory:AN.7/lerch-integral-representation` · lemma · `TauCeti.AnalyticNumberTheory.lerch_integral_representation`.

There exists a jointly holomorphic principal-sheet extension F(s,z,c) on Re s>0, Re c>0, z∈C\[1,∞), agreeing with the defining Φ series for |z|<1, such that F(s,z,c)=Γ(s)^−1∫_0^∞t^(s−1)exp(−ct)/(1−zexp(−t))dt. The integral is absolutely convergent; its formula is not asserted for the totalized series outside |z|<1.

**Construction and proof.**

1. For |z|<1, expand the denominator; the geometric bound and Re c>0 dominate the integral at∞ and Re s>0 dominates its origin. Apply the complex gamma integral and sum-integral interchange to identify the initial series.
2. On a compact subset outside the real cut[1,∞), the denominator has a positive lower bound on any fixed finite t interval, and is uniformly close to1 for large t. At t=0 it is bounded away from0 because z≠1. These bounds permit joint differentiation with integrable power/logarithmic majorants.
3. Define F by the absolutely convergent integral on this domain; joint holomorphy and agreement in the disc fix the principal sheet. The gamma integral for complex c and its parameter differentiation remain exact imported analytic adapters to verify.

**Dependencies.** [`AnalyticNumberTheory:AN.7/lerch-transcendent`](#lerch-transcendent), [`AnalyticNumberTheory:AN.7/lerch-compact-series-bound`](#lerch-compact-series-bound).

**Acceptance.** At z=0 the integral gives c^−s, agreeing with Φ(0,s,c). At z=1 the denominator vanishes linearly at the origin, so Re s>0 alone is insufficient; that point is excluded and belongs to the separate Hurwitz construction.

**Sources.** [The Lerch zeta function II. Analytic continuation](https://arxiv.org/pdf/1005.4967v2), §2 p.5, (2.2)–(2.4), integral cut-domain paragraph; §4 (4.18)–(4.23).

### Continuation, monodromy and descent

<a id="lerch-cover-continuation"></a>

#### Lerch continuation on a covering

`AnalyticNumberTheory:AN.7/lerch-cover-continuation` · theorem · `TauCeti.AnalyticNumberTheory.lerch_cover_continuation`.

The initial Φ germ continues to a single-valued holomorphic function on the universal cover of N#=C_s×(C_z\{0,1})×(C_c\Z≤0), based at(s,z,c)=(1/2,−1,1/2). Fix its base germ by the principal integral and continuation from |z|<1. The separate solvable-descent lemma states the quotient-cover invariance.

**Construction and proof.**

1. Use the pinned endpoint/path-class UniversalCover of the actual open subtype N#. Holomorphy means a local analytic function on C³ represents the cover function near every point. Normalize its germ near the constant-path point by the principal integral at(1/2,−1,1/2). A positive geometric loop γ is represented in Tau Ceti by the action γ⁻¹; no orientation is inferred from a left-action name.
2. Import the canonical based universal cover of the punctured complex-product manifold. Verify path-connectedness, local path-connectedness and semilocal simple connectedness; pull back its complex charts along the covering projection. Path composition follows the source: first traverse the based loop, then the path.
3. In the a coordinate the integral defines the downward-cut domains for Re s>0, Re c>0. Clockwise contour detours give analytic cells covering all a∉Z; residue differences provide the local a-loop continuations. Finite c-shift separation supplies cells for c away from nonpositive integers.
4. For Re c>0, repeatedly apply the already proved lowering relation on overlapping s half-planes to extend to every s. This is essential at positive integer c, where the four-term functional equation would contain excluded1−c. Keep the finite c-shift identity to reach all remaining c; its terms are entire in s on their lifted logarithm branches.
5. Use analytic uniqueness on overlaps and endpoint-fixed homotopy invariance to glue local germs on the simply connected cover. The residue and finite-term monodromy germs themselves continue globally; word composition is the monodromy cocycle M_(τ₁τ₂)=M_τ₁+M_τ₂+M_τ₂(M_τ₁), with the source concatenation order. Positive c strata are filled by the actual local holomorphic extension, not merely by vanishing monodromy.

**Dependencies.** [`AnalyticNumberTheory:AN.7/lerch-transcendent`](#lerch-transcendent), [`AnalyticNumberTheory:AN.7/lerch-integral-representation`](#lerch-integral-representation), [`AnalyticNumberTheory:AN.7/lerch-parameter-shift`](#lerch-parameter-shift), [`AnalyticNumberTheory:AN.7/lerch-z-derivative`](#lerch-z-derivative), [`AnalyticNumberTheory:AN.7/lerch-a-monodromy`](#lerch-a-monodromy), [`AnalyticNumberTheory:AN.7/lerch-c-monodromy`](#lerch-c-monodromy), `tauceti:TauCetiRoadmap/UniversalCovers#stage-0-port-the-foundations-into-tauceti`, `tauceti:TauCeti.UniversalCover`, `tauceti:TauCeti.UniversalCover.basepointLift`, `tauceti:TauCeti.UniversalCover.inv_smul_mk`.

**Acceptance.** The basepoint z=−1 lies outside the open series disc; its germ is fixed by the principal integral with Re s,Re c>0. The cover omits z=0,1; the initial principal series still extends at z=0, but other sheets may not. Holomorphy at positive integer c uses the lowering operator; zero monodromy without a removable-singularity proof would be insufficient.

**Sources.** [The Lerch Zeta function III. Polylogarithms and special values](https://link.springer.com/content/pdf/10.1186/s40687-015-0049-2.pdf), Theorems2.1–2.2 p.12; complete selected §3.2–§3.5 pp.21–32, and LerchII §§3–4/§8.

**Atlas planet.** Lerch analytic continuation.

<a id="lerch-c-monodromy"></a>

#### Monodromy around c=−n

`AnalyticNumberTheory:AN.7/lerch-c-monodromy` · lemma · `TauCeti.AnalyticNumberTheory.lerch_c_monodromy`.

On the principal Lerch-zeta germ ζ(s,a,c)=Φ(exp(2πia),s,c), a positive loop around c=−n (n≥0) changes the branch by (e^(−2πis)−1)e^(2πina)(c+n)^−s, with the same logarithm lift. Loops about positive integer c have zero monodromy.

**Construction and proof.**

1. Separate the n-th term by the shift formula; the remaining shifted tail is holomorphic around c=−n.
2. Continue (c+n)^−s once counterclockwise and subtract the original value.

**Dependencies.** [`AnalyticNumberTheory:AN.7/lerch-parameter-shift`](#lerch-parameter-shift).

**Acceptance.** The loop is a based counterclockwise generator reached and returned along the source upper-half-plane path; arbitrary conjugate generators need their own translated branch. For n=0 the phase is 1; for every integral s the c-loop multiplier vanishes. No positive-integer c puncture is introduced into the enlarged Lerch domain.

**Sources.** [The Lerch zeta function II. Analytic continuation](https://arxiv.org/pdf/1005.4967v2), Theorem4.5 (4.15) p.14, complete finite-shift proof (4.28)–(4.34) pp.17–18.

<a id="lerch-a-monodromy"></a>

#### Monodromy around a=n

`AnalyticNumberTheory:AN.7/lerch-a-monodromy` · lemma · `TauCeti.AnalyticNumberTheory.lerch_a_monodromy`.

For the lifted principal Lerch-zeta branch, a positive loop around a=n∈Z changes it by −(2πi)^s Γ(s)^−1(a−n)^(s−1)e^(−2πic(a−n)), with (2πi)^s defined by log(2π)+iπ/2 and the continued logarithm of a−n. On the fundamental strip0<Re a<1, the logarithm of a−n is cut along the negative imaginary axis with argument in(−π/2,3π/2). Equivalently, for n≥1 replace(a−n)^(s−1) by exp(πi(s−1))(n−a)^(s−1), whose base has positive real part; for n≤0 use the principal logarithm of a−n.

**Construction and proof.**

1. Move the integral contour across the simple pole t=2πi(a−n), retaining the clockwise residue sign.
2. Continue the resulting residue term back to the principal polycylinder.

**Dependencies.** [`AnalyticNumberTheory:AN.7/lerch-integral-representation`](#lerch-integral-representation).

**Acceptance.** The loop is a based counterclockwise generator reached and returned along the source upper-half-plane path; arbitrary conjugate generators need their own translated branch. The formula uses reciprocal gamma continued through its zeros at nonpositive integers; it does not require a finite value of the unregularized gamma function there.

**Sources.** [The Lerch zeta function II. Analytic continuation](https://arxiv.org/pdf/1005.4967v2), Theorem4.5 (4.11) pp.13–14, negative-imaginary cut convention; complete contour/residue proof (4.18)–(4.27) pp.14–17.

<a id="lerch-z-monodromy-shift"></a>

#### Lerch z-loop monodromy and shifts

`AnalyticNumberTheory:AN.7/lerch-z-monodromy-shift` · lemma · `TauCeti.AnalyticNumberTheory.lerch_z_monodromy_shift`.

On D={s∈C,z∈C\[0,∞),0<Re c<1}, choose Log z with 0<Im Log z<2π and a=Log z/(2πi). Put f_p=e^(2πipc)z^−c(a−p)^(s−1) for p≤0, and f_p=e^(πi(s−1))e^(2πipc)z^−c(p−a)^(s−1) for p≥1, using principal logarithms of the positive-real-part bases. For the source upper-connector based loops Z₀,Z₁ about 0,1, the principal germ has M_Z₀Φ=0 and M_Z₁Φ=−(2πi)^s f₀/Γ(s). The residue functions analytically continue to the universal cover, and continuation along Z₀^k sends f_p to f_(p−k); positive continuation along Z₁^k multiplies f₀ by e^(2πiks) and fixes f_p for p≠0; c loops fix every f_p. This corrects the published (3.28), as recorded in E29. The vanishing Z₀ identity for Φ concerns its principal germ, not invariance on every sheet.

**Construction and proof.**

1. Lift Z₀ by the exponential cover to a path from a=1/2 to3/2 in the upper half-plane; the initial Fourier series is periodic there, so Φ has zero Z₀ monodromy. Z₁ lifts to the a=0 based loop, giving the existing a-monodromy residue.
2. The continued Log z increases by 2πik along Z₀^k. Its factor z^−c contributes e^(−2πikc); combined with e^(2πipc) this is the phase in f_(p−k). Track the cut of a−p using the stated positive-real-part bases, including a sign change of p−k. The principal-germ identities then have unique analytic continuations on the universal cover.
3. The Z₁ lift winds positively once around a=0, while its logarithm lift has no increment around z=0. Thus a^(s−1) gains e^(2πis) for p=0. For p≠0, the corresponding a−p factor has zero winding. Repetition gives e^(2πiks). These principal-germ relations extend analytically on the connected universal cover. The descent argument must use this corrected diagonal action, not published (3.28).

**Dependencies.** [`AnalyticNumberTheory:AN.7/lerch-a-monodromy`](#lerch-a-monodromy), [`AnalyticNumberTheory:AN.7/lerch-c-monodromy`](#lerch-c-monodromy), `tauceti:TauCetiRoadmap/UniversalCovers#stage-0-port-the-foundations-into-tauceti`.

**Acceptance.** A loop around0 fixes the principal Φ germ but shifts the logarithmic residue germs; that distinction prevents an unjustified abelian descent. At s=c=1/2,z=−1 and the principal lift, f₀=−i√2≠0. A positive Z₁ loop sends it to −f₀; this refutes the all-index zero-monodromy assertion.

**Sources.** [The Lerch Zeta function III. Polylogarithms and special values](https://link.springer.com/content/pdf/10.1186/s40687-015-0049-2.pdf), §3.2 Lemma3.1 pp.21–24; §3.3 Theorem3.4 pp.25–28, (3.24)–(3.35); [The Lerch zeta function III. Polylogarithms and special values](https://arxiv.org/pdf/1506.06161v1), Definition3.3 (3.23), (3.24), Theorem3.4 (3.25)–(3.30), arXiv v1 printed pp.26–27.

<a id="lerch-solvable-descent"></a>

#### Lerch solvable-cover descent

`AnalyticNumberTheory:AN.7/lerch-solvable-descent` · lemma · `TauCeti.AnalyticNumberTheory.lerch_solvable_descent`.

The holomorphic Lerch continuation on the universal cover of N#=C_s×(C_z\{0,1})×(C_c\Z≤0) is invariant under π₁(N#)″. It therefore descends to the regular cover associated to that second commutator subgroup; its deck group π₁(N#)/π₁(N#)″ is solvable of derived length at most2. No descent to the maximal abelian z cover is asserted.

**Construction and proof.**

1. Use the pinned endpoint/path-class UniversalCover of the actual open subtype N#. Holomorphy means a local analytic function on C³ represents the cover function near every point. Normalize its germ near the constant-path point by the principal integral at(1/2,−1,1/2). A positive geometric loop γ is represented in Tau Ceti by the action γ⁻¹; no orientation is inferred from a left-action name.
2. Set H₀=kernel of the exponent-sum homomorphism sending Z₀↦1, Z₁,Y_n↦0. Its generators are the Z₀-conjugates of Z₁ and Y_n; G/H₀≅Z. In particular, the Z₁ action on f₀ is the phase e^(2πis), not invariance; the abelian diagonal action of the conjugate generators, with the mixed c actions, is the required calculation.
3. Use the z-loop shift formulas and the c-loop monodromy to verify vanishing on[H₀,H₀]. The mixed z/c actions annihilate each other; the cocycle composition identity, not just commutativity of loops, is required.
4. Since G′⊂H₀, G″⊂[H₀,H₀]. This characteristic normal subgroup gives the regular quotient cover imported from UniversalCovers Stage2. Filling positive c strata kills their zero-monodromy loops and preserves the second-commutator conclusion.

**Dependencies.** [`AnalyticNumberTheory:AN.7/lerch-cover-continuation`](#lerch-cover-continuation), [`AnalyticNumberTheory:AN.7/lerch-z-monodromy-shift`](#lerch-z-monodromy-shift), [`AnalyticNumberTheory:AN.7/lerch-c-monodromy`](#lerch-c-monodromy), `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`, `tauceti:TauCeti.UniversalCover`, `tauceti:TauCeti.UniversalCover.basepointLift`, `tauceti:TauCeti.UniversalCover.inv_smul_mk`, `tauceti:TauCeti.UniversalCover.SubgroupQuotient`, `tauceti:TauCeti.UniversalCover.subgroupQuotientMap`.

**Acceptance.** At a generic s the Z₀-shift of the Z₁ residue is nontrivial; vanishing of principal Z₀ monodromy alone does not imply an abelian z cover.

**Sources.** [The Lerch Zeta function III. Polylogarithms and special values](https://link.springer.com/content/pdf/10.1186/s40687-015-0049-2.pdf), §3.4 Theorem3.5 and complete proof pp.28–31; §3.5 Theorem3.6 pp.31–32.

### Functional equations and specializations

<a id="complex-hurwitz-series"></a>

#### Complex-parameter Hurwitz series

`AnalyticNumberTheory:AN.7/complex-hurwitz-series` · definition · `TauCeti.AnalyticNumberTheory.complex_hurwitz_series`.

For Re c>0 and Re s>1, ζ_H(s,c)=Σ_{n≥0}exp(−sLog(n+c)), with the principal logarithm. It is the z=1 series, not an unqualified value of the general Lerch continuation on its omitted z=1 stratum.

**Construction and proof.**

1. Define the principal series on Re c>0, Re s>1; every n+c is nonzero. The polynomial p-series majorant is locally uniform on compact subsets with inf Re s>1 and inf Re c>0.
2. Reindex its absolutely convergent series to obtain the c shift; compare to existing circle Hurwitz only for real0<c≤1, preserving its endpoint representative.

**Dependencies.** `mathlib:Complex.cpow_def_of_ne_zero`.

**API.**

- `complex_hurwitz_series.series` (characterisation): The displayed series converges absolutely on Re s>1, Re c>0.
- `complex_hurwitz_series.shift` (relation): ζ_H(s,c+1)=ζ_H(s,c)−c^−s.
- `complex_hurwitz_series.real_circle` (compatibility): For real0<c≤1 it agrees with the pinned circle Hurwitz series using the positive representative convention.
- `complex_hurwitz_series.c_one` (compatibility): ζ_H(s,1)=riemannZeta(s) on Re s>1.

**Unit tests.**

- `complex_hurwitz_series.one` (computation): ζ_H(2,1)=π²/6.
- `complex_hurwitz_series.half` (computation): ζ_H(s,1/2)=(2^s−1)ζ(s) on Re s>1, by the odd-integer partition.
- `complex_hurwitz_series.excluded` (non-example): c=0 is outside the domain and no0^−s term is assigned a junk value.
- `complex_hurwitz_series.nonreal_shift` (computation): ζ_H(2,1+i)−ζ_H(2,2+i)=−i/2; this tests the actual complex c parameter and inclusion of the n=0 term.

**Acceptance.** ζ_H(2,1)=π²/6. ζ_H(s,1/2)=(2^s−1)ζ(s) on Re s>1, by the odd-integer partition. c=0 is outside the domain and no0^−s term is assigned a junk value.

**Uses.** `AnalyticNumberTheory:AN.7/complex-hurwitz-continuation`: Initial function for the pole-and-parameter continuation.

**Sources.** [The Lerch zeta function II. Analytic continuation](https://arxiv.org/pdf/1005.4967v2), §2 integral at z=1 with separate origin subtraction.

**Atlas planet.** Hurwitz zeta functions.

<a id="lerch-nonpositive-special-values"></a>

#### Nonpositive Lerch special values

`AnalyticNumberTheory:AN.7/lerch-nonpositive-special-values` · theorem · `TauCeti.AnalyticNumberTheory.lerch_nonpositive_special_values`.

For m≥0, Φ(z,−m,c)=(z∂_z+c)^m(1/(1−z)), a rational function of z,c with poles only at z=1. It extends in c across all integers and has zero monodromy. For m=1 it equals c/(1−z)+z/(1−z)².

**Construction and proof.**

1. Use the lowering relation repeatedly from s=0 on |z|<1.
2. Inductively differentiate the rational function, then continue it as a single-valued function; no limit z→1 is asserted.

**Dependencies.** [`AnalyticNumberTheory:AN.7/lerch-transcendent`](#lerch-transcendent), [`AnalyticNumberTheory:AN.7/lerch-z-derivative`](#lerch-z-derivative), [`AnalyticNumberTheory:AN.7/lerch-zero-order-value`](#lerch-zero-order-value).

**Acceptance.** At m=0 the value is1/(1−z); at m=1 it is c/(1−z)+z/(1−z)². The rational function is polynomial in c and extends through all integer c. No radial limit at z=1 is asserted. Do not use published Theorem6.1(2) at m=0: the c→0 Φ limit retains the n=0 term1, while the periodic continuation equals q₀(z)−1. See E26.

**Sources.** [The Lerch Zeta function III. Polylogarithms and special values](https://link.springer.com/content/pdf/10.1186/s40687-015-0049-2.pdf), §5 Theorem5.1 and complete recurrence proof p.36, (5.2)–(5.5).

**Atlas planet.** Lerch special values.

<a id="circle-hurwitz-import"></a>

#### Pinned Hurwitz specialization

`AnalyticNumberTheory:AN.7/circle-hurwitz-import` · comparison · `TauCeti.AnalyticNumberTheory.circle_hurwitz_import`.

For real 0<c≤1 and Re s>1, the z=1 Lerch/Hurwitz series Σ_{n≥0}(n+c)^−s agrees with the pinned UnitAddCircle Hurwitz function using c mod1 and its endpoint convention c=1. Its meromorphic continuation has a simple pole at s=1 of residue1.

**Construction and proof.**

1. For0<c≤1, use the pinned HasSum statement and cpow/exponential conversion for the positive bases n+c. At c=1 the circle parameter is0; its n=0 zero-base term is junk-valued0 in Re s>1, so the endpoint still represents the positive-integer Hurwitz series.
2. Use pinned differentiability away from1 and the punctured residue1 limit for the continued circle function. Keep its special subtraction1/(s−1)/Gammaℝ(s); no assertion about a pointwise value at a pole is made.

**Dependencies.** `mathlib:HurwitzZeta.hurwitzZeta`, `mathlib:HurwitzZeta.hasSum_hurwitzZeta_of_one_lt_re`, `mathlib:HurwitzZeta.differentiableAt_hurwitzZeta`, `mathlib:HurwitzZeta.hurwitzZeta_residue_one`, `mathlib:HurwitzZeta.differentiableAt_hurwitzZeta_sub_one_div`, `mathlib:Complex.cpow_def_of_ne_zero`, [`AnalyticNumberTheory:AN.7/complex-hurwitz-series`](#complex-hurwitz-series).

**Acceptance.** The c=1 series isζ(s), notζ(s)+an extra zero-base contribution. Circle parameters c and c+1 agree as circle elements, but their ordinary unperiodized Hurwitz series differ by c^−s; the comparison is restricted to0<c≤1.

**Sources.** [The Lerch zeta function I. Zeta integrals](https://arxiv.org/pdf/1005.4712v2), §1 p.2 Hurwitz specialization; exact pinned Hurwitz series/residue declarations.

<a id="exp-zeta-lerch-comparison"></a>

#### Periodic zeta and Lerch normalization

`AnalyticNumberTheory:AN.7/exp-zeta-lerch-comparison` · comparison · `TauCeti.AnalyticNumberTheory.exp_zeta_lerch_comparison`.

For real a, z=exp(2πia) and Re s>1, expZeta(a,s)=zΣ_{n≥0}z^n exp(−sLog(n+1)), in the absolutely convergent boundary series. The totalized defining Φ sum agrees here after its boundary summability proof; at a∈Z this is the Riemann degeneration. It gives no equality of arbitrary sheets or unqualified limit for Re s≤1.

**Construction and proof.**

1. Shift the n≥1 periodic sum to n≥0 and factor out z.
2. Use the pinned expZeta series theorem and its existing continuation.

**Dependencies.** [`AnalyticNumberTheory:AN.7/lerch-transcendent`](#lerch-transcendent), `mathlib:HurwitzZeta.expZeta`, `mathlib:HurwitzZeta.hasSum_expZeta_of_one_lt_re`, `mathlib:Complex.cpow_def_of_ne_zero`.

**Acceptance.** At a=0 the boundary series isζ(s). At a=1/2,s=2, expZeta(a,s)=−π²/12 while Φ(−1,2,1)=+π²/12; the z prefactor changes the sign.

**Sources.** [The Lerch zeta function I. Zeta integrals](https://arxiv.org/pdf/1005.4712v2), §1 p.2 defining periodic series; LerchIII §6 Theorem6.1 pp.41–42.

<a id="dirichlet-hurwitz-finite-sum"></a>

#### Dirichlet character Hurwitz specialization

`AnalyticNumberTheory:AN.7/dirichlet-hurwitz-finite-sum` · comparison · `TauCeti.AnalyticNumberTheory.dirichlet_hurwitz_finite_sum`.

For a character χ modulo q≥1 and Re s>1, L(s,χ)=q^−sΣ_{a=1}^q χ(a)ζ_H(s,a/q), using the actual principal/imprimitive character values. Continue with the pinned Dirichlet and circle-Hurwitz functions and keep the principal pole.

**Construction and proof.**

1. Reuse ZMod.LFunction, which already defines the continued finite combination of circle Hurwitz functions on ZMod q. DirichletCharacter.LFunction is its specialization; q≥1 provides NeZero q.
2. Choose representatives a=1,…,q; toAddCircle of a equals(a/q mod1), with a=q representing residue0 and positive endpoint c=1. On Re s>1 use the real-circle comparison; outside this range the statement is the existing continued finite sum, not the divergent positive-half-plane series.

**Dependencies.** [`AnalyticNumberTheory:AN.7/circle-hurwitz-import`](#circle-hurwitz-import), `mathlib:ZMod.LFunction`, `mathlib:DirichletCharacter.LFunction`, `mathlib:Complex.cpow_def_of_ne_zero`.

**Acceptance.** For q=1 and its unique principal character, this reduces toζ(s), with its pole at1. Principal and imprimitive characters retain their zero values on nonunits; no primitivity is silently imposed.

**Sources.** [The Lerch zeta function I. Zeta integrals](https://arxiv.org/pdf/1005.4712v2), Introductory Hurwitz/Dirichlet specializations; exact pinned ZMod.LFunction definition.

<a id="lerch-even-functional-equation"></a>

#### Even Lerch functional relation

`AnalyticNumberTheory:AN.7/lerch-even-functional-equation` · theorem · `TauCeti.AnalyticNumberTheory.lerch_even_functional_equation`.

On the extended polycylinder s∈C,0<Re a<1,0<Re c<1, put L_+=ζ(s,a,c)+e^(−2πia)ζ(s,1−a,1−c) and Λ_+=π^(−s/2)Γ(s/2)L_+. Then Λ_+(s,a,c)=e^(−2πiac)Λ_+(1−s,1−c,a), as matched holomorphic continuations. At a gamma pole, Λ denotes the removable holomorphic extension of the product, not its pointwise totalized Gamma value.

**Construction and proof.**

1. Use the real-parameter Fourier/Poisson-Mellin proof in LerchI Theorem5.1 with0<a,c<1 and0<Re s<1; its real-parameter analytic supplier remains an explicit source boundary until the entire proof is checked.
2. The principal integral is jointly holomorphic on the fundamental polycylinder. Continue the real a identity first in a at fixed real c, then in c, using the one-variable identity theorem.
3. Combine even and odd equations with gamma reflection/duplication to obtain the three-term transformation, defining ζ on Re s<1 from values at1−s with positive real part. Glue this with the integral Re s>0 representation on their overlap.
4. At a gamma pole on a nonpositive s integer, the functional equation relates the completed combination to its finite positive-integer value at1−s; use meromorphic uniqueness and the removable extension. The pointwise product with totalized Gamma at a pole is not that extension.

**Dependencies.** [`AnalyticNumberTheory:AN.7/lerch-integral-representation`](#lerch-integral-representation), [`AnalyticNumberTheory:AN.7/lerch-compact-series-bound`](#lerch-compact-series-bound).

**Acceptance.** These strip identities precede the global cover and therefore create no cycle in its construction. The odd equation retains the i multiplier; both symmetrizations use exp(−2πia).

**Sources.** [The Lerch zeta function II. Analytic continuation](https://arxiv.org/pdf/1005.4967v2), Theorem2.1 (2.7)–(2.10) p.5; complete §3 pp.8–10, Lemma3.1 and Theorem2.1 proof.

<a id="lerch-odd-functional-equation"></a>

#### Odd Lerch functional relation

`AnalyticNumberTheory:AN.7/lerch-odd-functional-equation` · theorem · `TauCeti.AnalyticNumberTheory.lerch_odd_functional_equation`.

On the same polycylinder, L_−=ζ(s,a,c)−e^(−2πia)ζ(s,1−a,1−c) and Λ_−=π^(−(s+1)/2)Γ((s+1)/2)L_− satisfy Λ_−(s,a,c)=i e^(−2πiac)Λ_−(1−s,1−c,a), with matched continuations; at gamma poles Λ denotes the removable holomorphic extension rather than a pointwise totalized Gamma product.

**Construction and proof.**

1. Use the real-parameter Fourier/Poisson-Mellin proof in LerchI Theorem5.1 with0<a,c<1 and0<Re s<1; its real-parameter analytic supplier remains an explicit source boundary until the entire proof is checked.
2. The principal integral is jointly holomorphic on the fundamental polycylinder. Continue the real a identity first in a at fixed real c, then in c, using the one-variable identity theorem.
3. Combine even and odd equations with gamma reflection/duplication to obtain the three-term transformation, defining ζ on Re s<1 from values at1−s with positive real part. Glue this with the integral Re s>0 representation on their overlap.
4. At a gamma pole on a nonpositive s integer, the functional equation relates the completed combination to its finite positive-integer value at1−s; use meromorphic uniqueness and the removable extension. The pointwise product with totalized Gamma at a pole is not that extension.

**Dependencies.** [`AnalyticNumberTheory:AN.7/lerch-integral-representation`](#lerch-integral-representation), [`AnalyticNumberTheory:AN.7/lerch-compact-series-bound`](#lerch-compact-series-bound).

**Acceptance.** These strip identities precede the global cover and therefore create no cycle in its construction. The odd equation retains the i multiplier; both symmetrizations use exp(−2πia).

**Sources.** [The Lerch zeta function II. Analytic continuation](https://arxiv.org/pdf/1005.4967v2), Theorem2.1 (2.7)–(2.10) p.5; complete §3 pp.8–10, Lemma3.1 and Theorem2.1 proof.

<a id="lerch-boundary-degeneration"></a>

#### Lerch boundary degeneration

`AnalyticNumberTheory:AN.7/lerch-boundary-degeneration` · lemma · `TauCeti.AnalyticNumberTheory.lerch_boundary_degeneration`.

For Re c>0 and Re s>1, the principal radial limit Φ(r,s,c) as r↑1 equals the convergent Hurwitz series. This limit is not an analytic continuation theorem across the entire z=1 stratum for all s; for s=0, Φ(r,0,c)=1/(1−r) diverges.

**Construction and proof.**

1. For Re c>0 and Re s>1, majorize |exp(−sLog(n+c))| by C(n+1)^(−Re s), using bounded principal arguments and |n+c|≥n+Re c. The Hurwitz majorant is summable.
2. For0≤r<1 each r^n is bounded by1 and tends to1; apply dominated convergence for counting measure to get the complex-c Hurwitz series.
3. At s=0 the initial geometric-series value1/(1−r) diverges to+∞, so no unrestricted degeneration follows.

**Dependencies.** [`AnalyticNumberTheory:AN.7/lerch-transcendent`](#lerch-transcendent), [`AnalyticNumberTheory:AN.7/complex-hurwitz-series`](#complex-hurwitz-series), [`AnalyticNumberTheory:AN.7/lerch-zero-order-value`](#lerch-zero-order-value).

**Acceptance.** The limit holds for complex c with positive real part, including c=1+i. At s=0 it diverges for every allowed c, so the Re s>1 hypothesis is material.

**Sources.** [The Lerch zeta function I. Zeta integrals](https://arxiv.org/pdf/1005.4712v2), Theorem2.3 boundary statement and §1 singular-strata discussion; discrete dominated-convergence specialization.

<a id="complex-hurwitz-continuation"></a>

#### Complex Hurwitz continuation

`AnalyticNumberTheory:AN.7/complex-hurwitz-continuation` · theorem · `TauCeti.AnalyticNumberTheory.complex_hurwitz_continuation`.

There exist canonical joint continuations H(s,c),R(s,c) on s∈C, Re c>0, with H jointly holomorphic off s=1, R jointly holomorphic everywhere on this domain, R(1,c)=1, and R(s,c)=(s−1)H(s,c) for s≠1. H agrees with the defining Hurwitz series on Re s>1 and has a simple pole at1 of residue1. The shift holds off the pole. Neither a totalized divergent series nor the pointwise product(s−1)H at1 is claimed to be the removable extension R.

**Construction and proof.**

1. Establish the separate z=1 gamma integral on Re s>1, Re c>0 by termwise integration of the absolutely convergent Hurwitz series and parameter-uniform domination. The principal-sheet integral lemma excludes z=1 and cannot simply be evaluated there. Subtract the t=0 Taylor terms to continue in s.
2. Prove locally uniform parameter domination and cancel the reciprocal-gamma zeros.
3. Uniqueness on the convergence half-plane fixes the continuation and the pole residue.

**Dependencies.** [`AnalyticNumberTheory:AN.7/complex-hurwitz-series`](#complex-hurwitz-series), [`AnalyticNumberTheory:AN.7/lerch-integral-representation`](#lerch-integral-representation).

**Acceptance.** R(1,c)=1 for every Re c>0; directly evaluating(1−1) times a totalized H(1,c) would give0 and is not the claim. For real0<c≤1, H matches the existing circle function away from1.

**Sources.** [The Lerch zeta function II. Analytic continuation](https://arxiv.org/pdf/1005.4967v2), §9 p.28 Hurwitz singular-stratum paragraph; complete separate complex-c proof remains required.

<a id="complex-hurwitz-bernoulli-values"></a>

#### Hurwitz Bernoulli values

`AnalyticNumberTheory:AN.7/complex-hurwitz-bernoulli-values` · theorem · `TauCeti.AnalyticNumberTheory.complex_hurwitz_bernoulli_values`.

For m≥0 and Re c>0, the canonical continuation has ζ_H(−m,c)=−B_{m+1}(c)/(m+1), with Bernoulli polynomials normalized by te^(ct)/(e^t−1)=ΣB_j(c)t^j/j!. In particular ζ_H(0,c)=1/2−c. The polynomial is the pinned Polynomial.bernoulli(m+1) evaluated at complex c after coefficient extension; B₁(c)=c−1/2, so at c=1 the order-zero value is−1/2.

**Construction and proof.**

1. Use the Taylor-subtracted integral and the reciprocal-gamma zero at−m.
2. Identify its coefficient by the stated Bernoulli generating series; pin the B₁ sign.

**Dependencies.** [`AnalyticNumberTheory:AN.7/complex-hurwitz-continuation`](#complex-hurwitz-continuation), `mathlib:Polynomial.bernoulli`, `mathlib:Polynomial.bernoulli_one`, `mathlib:Polynomial.bernoulli_eval_one`.

**Acceptance.** At m=0,c=1 the value is−1/2; at m=0,c=1/2 it is0. The positive-half-plane series definition at s=0 is divergent and totalizes to0; use the continued H, not that totalized sum.

**Sources.** [The Lerch Zeta function III. Polylogarithms and special values](https://link.springer.com/content/pdf/10.1186/s40687-015-0049-2.pdf), §6 p.40 Bernoulli/Hurwitz discussion; full separate Taylor/generating-function proof required.

<a id="lerch-zero-order-value"></a>

#### Lerch at order zero

`AnalyticNumberTheory:AN.7/lerch-zero-order-value` · lemma · `TauCeti.AnalyticNumberTheory.lerch_zero_order_value`.

Φ(z,0,c)=1/(1−z) for |z|<1, Re c>0.

**Construction and proof.**

1. Unfold the stated definition and apply the finite algebraic, positivity or convergent geometric-series computation.

**Dependencies.** [`AnalyticNumberTheory:AN.7/lerch-transcendent`](#lerch-transcendent).

**Acceptance.** At z=1/2 the value is2; z=1 is excluded.

**Sources.** [The Lerch Zeta function III. Polylogarithms and special values](https://link.springer.com/content/pdf/10.1186/s40687-015-0049-2.pdf), Theorem5.1, (5.3) and m=0 proof p.36.

## Supplier contracts

These contracts identify mathematics imported by the active layers. They do not introduce parallel character, ideal, reciprocity, topology or analytic-continuation carriers.

### S1 — `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation`

Truncated arithmetic Perron for the actual von Mangoldt LSeries, with uniform error, off-endpoint and half-weight endpoint forms; finite-height kernel value at1 is arctan(T/c)/π, not1/2. For Siegel–Walfisz, also use the Layer6 quantitative Abel identity converting coprime-progression θ estimates to π with the Li main term and an explicit lower-endpoint term, retaining uniform constants for q≤(log x)^B; a fixed-modulus asymptotic alone is insufficient.

Used by [`AnalyticNumberTheory:AN.3/von-mangoldt-explicit-formula-and-pnt-error`](#von-mangoldt-explicit-formula-and-pnt-error), [`AnalyticNumberTheory:AN.2/siegel-walfisz`](#siegel-walfisz).

### S2 — `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`

Canonical HeckeCharacter and unitaryPart, local components, finite conductor, finite-order/ray-class dictionary, and ideal-character coefficients with the exact arithmetic normalization used by Tate §4.5.

Used by [`AnalyticNumberTheory:AN.4/artin-induction-versus-artin-holomorphy`](#artin-induction-versus-artin-holomorphy), [`AnalyticNumberTheory:AN.4/hecke-L-function-euler-product-comparison`](#hecke-L-function-euler-product-comparison), [`AnalyticNumberTheory:AN.4/hecke-nonvanishing-on-line-one`](#hecke-nonvanishing-on-line-one), [`AnalyticNumberTheory:AN.4/hecke-primitive-functional-equation`](#hecke-primitive-functional-equation), [`AnalyticNumberTheory:AN.4/ray-class-product-nonvanishing`](#ray-class-product-nonvanishing).

### S3 — `AutomorphicLFunctionsAndLocalFactors:AL.0`

Fourier and Haar conventions for local/adelic functions, Poisson summation and parameter integrals. Supply an extension from Schwartz–Bruhat functions to Tate's full Z1–Z3 admissible class: uniform lattice sums over all translates and compact idele sets, both f and Fourier f, and idele weighted integrability for every σ>1.

Used by [`AnalyticNumberTheory:AN.4/hecke-L-function-euler-product-comparison`](#hecke-L-function-euler-product-comparison).

### S4 — `AutomorphicLFunctionsAndLocalFactors:AL.1`

Local and global Tate zeta integrals on the imported admissible class, Euler factorization with different and measure factors, meromorphic continuation, local gamma factors and global functional equation retaining the trivial-character residues. This does not by itself assert nonvanishing on Re(s)=1. AN.4 imports AL.1/global-zeta-integral, completed-hecke-l-function, tate-global-functional-equation, idele-class-volume, global-epsilon-factor and hecke-l-functional-equation.

Used by [`AnalyticNumberTheory:AN.4/artin-induction-versus-artin-holomorphy`](#artin-induction-versus-artin-holomorphy), [`AnalyticNumberTheory:AN.4/dedekind-zeta-continuation-and-residue`](#dedekind-zeta-continuation-and-residue), [`AnalyticNumberTheory:AN.4/hecke-L-function-euler-product-comparison`](#hecke-L-function-euler-product-comparison), [`AnalyticNumberTheory:AN.4/hecke-primitive-functional-equation`](#hecke-primitive-functional-equation).

### S5 — `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products`

Ideal Euler-product/series identity under absolute convergence on Re(s)>1, including finite bad-prime omission and norm regrouping. General higher-dimensional Artin factors must not be put into the degree-one completely multiplicative ideal-weight carrier.

Used by [`AnalyticNumberTheory:AN.4/hecke-L-function-euler-product-comparison`](#hecke-L-function-euler-product-comparison), [`AnalyticNumberTheory:AN.4/ray-class-product-nonvanishing`](#ray-class-product-nonvanishing).

### S6 — `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-2-frobenius-elements-and-the-artin-symbol`

Arithmetic Frobenius at a chosen nonzero prime, conjugacy independence across primes above an unramified base prime and uniqueness modulo inertia at ramified primes; for K/ℚ the residue action is x↦x^p on O_K/P.

Used by [`AnalyticNumberTheory:AN.4/artin-induction-versus-artin-holomorphy`](#artin-induction-versus-artin-holomorphy).

### S7 — `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`

Global reciprocity identification of one-dimensional finite Galois characters with ray-class characters, compatible with the existing ideal Artin map and arithmetic-Frobenius normalization; no second reciprocity carrier.

Used by [`AnalyticNumberTheory:AN.4/artin-induction-versus-artin-holomorphy`](#artin-induction-versus-artin-holomorphy).

### S8 — `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`

Artin rational induction for finite-dimensional complex representations of a finite group, explicitly clearing denominators into a virtual sum of characters induced from cyclic subgroups. Global meromorphy uses the distinct Brauer integral-induction interface and its linear-character reduction, not unproved global roots. For the Colmez targets, refine the integral statement to induced one-dimensional finite-order characters; elementary-induced arbitrary characters alone do not give a Hecke product. For every group of order≤(2g)!, choose decompositions of its irreducibles with sum of absolute integer coefficients and number of terms bounded solely in g. This follows only after the monomial refinement and finite-group finiteness proof.

Used by [`AnalyticNumberTheory:AN.4/artin-induction-versus-artin-holomorphy`](#artin-induction-versus-artin-holomorphy), [`AnalyticNumberTheory:AN.4/artin-value-one-subpower`](#artin-value-one-subpower), [`AnalyticNumberTheory:AN.4/artin-log-derivative-one`](#artin-log-derivative-one).

### S9 — `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-8-landau-type-positivity`

Generic meromorphic nonvanishing from nonnegative logarithmic coefficients, with meromorphic order at the distinguished pole ≤0 and the 3-4-1 inequality.

Used by [`AnalyticNumberTheory:AN.4/landau-nonnegative-logarithm`](#landau-nonnegative-logarithm).

### S10 — `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-1-norm-fibres-and-mathlib-lseries`

Finite norm fibres and norm regrouping for the restriction to an ordinary/narrow ideal class; zero coefficient set to 0. This layer alone is not the source of the Re s>1 absolute-convergence estimate.

Used by [`AnalyticNumberTheory:AN.4/partial-ideal-zeta`](#partial-ideal-zeta).

### S11 — `AutomorphicSpectralTheory:AS.1`

Specialize the induced Eisenstein family at level one to the weight-zero primitive half-sum E(z,s) of DIT (5.2), and compare E*=π^(−s)Γ(s)ζ(2s)E on Re s>1. AS.1 supplies initial convergence and constant terms; quadratic geometric carriers and meromorphic continuation are separate requests.

Used by [`AnalyticNumberTheory:AN.4/cm-partial-zeta-period`](#cm-partial-zeta-period), [`AnalyticNumberTheory:AN.4/real-even-partial-zeta-period`](#real-even-partial-zeta-period), [`AnalyticNumberTheory:AN.4/negative-genus-core-period`](#negative-genus-core-period), [`AnalyticNumberTheory:AN.4/positive-genus-geodesic-period`](#positive-genus-geodesic-period), [`AnalyticNumberTheory:AN.4/mixed-genus-cm-period`](#mixed-genus-cm-period), [`AnalyticNumberTheory:AN.4/real-odd-partial-zeta-period`](#real-odd-partial-zeta-period), [`AnalyticNumberTheory:AN.3/eisenstein-weyl-lvalue-bound`](#eisenstein-weyl-lvalue-bound).

### S12 — `AnalyticNumberTheory:AN.8`

If [F : ℚ] ≥ 2 then ξ_{F,α}(0) = 0, since each c_{αβ}(s) vanishes to order [F : ℚ] at s = 1 (Lemma 3.8). For a cubic étale algebra A/F, the orders O ⊂ A with [O_A : O]² = n have Dirichlet series f_A(s) = ζ_F(4s)ζ_F(6s − 1)ζ_A(2s)/ζ_A(4s) (Datskovsky–Wright, Lemma 3.9). For σ > 3/2, ξ_{F,α}(σ + it) ≪_{[F:ℚ],σ,ε} Disc(F)^{1/2+ε}h₂(F) (Lemma 3.10), and for −1/2 ≤ σ ≤ 3/2 away from the poles at s = 1 and 5/6 (for example for |t| ≥ 1; the paper states it for all t, E9), ξ_{F,α}(σ + it) = O(h₂(F)Disc(F)^{7/2−2σ+ε}(1 + |t|)^{2[F:ℚ](3/2−σ)+ε}) by Phragmén–Lindelöf (Lemma 3.11).

Used by .

### S13 — `AutomorphicLFunctionsAndLocalFactors:AL.3`

For the actual Π_alg representation carrier and its canonical completed Rankin–Selberg Λ(s,π×π′), the predicate GRH means every nontrivial zero has real part 1/2. Do not assert this predicate as a theorem.

Used by [`AnalyticNumberTheory:AN.3/mestre-weil-explicit-formula`](#mestre-weil-explicit-formula).

### S14 — `FiniteFieldsAndCharacterSums:FF.1`

Let D₂ be an odd fundamental discriminant, δ₂ = |D₂| (squarefree), and R an integer prime to δ₂. Then Σ_{μ ∈ O/𝔡₂} e_{δ₂}(R N(μ)) = Σ_{n ∈ ℤ/δ₂ℤ} e_{δ₂}(Rn²) = κ(D₂) δ₂^{1/2} ε_{D₂}(R), with κ(D₂) = 1 if D₂ > 0 and i if D₂ < 0. The first equality holds because δ₂ is squarefree and totally ramified, so ℤ/δ₂ represents O/𝔡₂. The second is 'the usual evaluation of Gauss sums', Gauss's sign determination included. Also supply the primitive-character shift formula for every integer r, including nonunits, as in GZ item197. This composite odd fundamental-discriminant sign evaluation is stronger than the prime-field square-root magnitude theorem.

Used by .

### S15 — `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-8-landau-type-positivity`

The nonnegative 3-4-1 coefficient inequality for absolutely convergent logarithmic-derivative series.

Used by [`AnalyticNumberTheory:AN.2/zeta-three-four-one-derivative`](#zeta-three-four-one-derivative).

### S16 — `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-2-frobenius-elements-and-the-artin-symbol`

Decomposition/inertia groups at all nonzero primes, arithmetic Frobenius on residue extensions and conjugacy/tower compatibility on the inertia-invariant representation. Unramified Frobenius alone does not supply the ramified polynomial.

Used by [`AnalyticNumberTheory:AN.4/artin-local-polynomial`](#artin-local-polynomial).

### S17 — `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`

Supply the integral monomial refinement χ_ρ=Σ n_j Ind_{H_j}^G χ_j with n_j∈Z and χ_j one-dimensional. Layer6 currently exports elementary-subgroup characters; prove their further induced-linear decomposition, e.g. monomiality of elementary groups and induction transitivity. Keep rational Artin induction separate; it gives only a meromorphic power.

Used by [`AnalyticNumberTheory:AN.4/brauer-meromorphic-continuation`](#brauer-meromorphic-continuation).

### S18 — `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-8-landau-type-positivity`

For nonnegative norm-regrouped coefficients, the finite abscissa of convergence is a singular point. Supply the endpoint positivity/convergence corollary for a function holomorphic across that real abscissa.

Used by [`AnalyticNumberTheory:AN.4/quadratic-landau-contradiction`](#quadratic-landau-contradiction).

### S19 — `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-9-wienerikehara`

For a nonnegative real sequence b with b(0)=0, require LSeriesHasSum b s (F s) on Re s>1 and a separately named G continuous on Re s≥1 with G=F−κ/(s−1) on Re s>1, κ≥0. Conclude the inclusive floor summatory sum divided by x tends to κ; no continuity of junk-valued subtraction at1 is assumed.

Used by [`AnalyticNumberTheory:AN.2/rational-prime-number-theorem`](#rational-prime-number-theorem), [`AnalyticNumberTheory:AN.2/fixed-progression-prime-number-theorem`](#fixed-progression-prime-number-theorem).

### S20 — `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-10-generic-prime-number-theorem-transfer`

Inclusive ψ to θ to π transfer, including higher prime powers and Li(x)∼x/log x, specialized to ordinary primes or a fixed coprime class.

Used by [`AnalyticNumberTheory:AN.2/rational-prime-number-theorem`](#rational-prime-number-theorem), [`AnalyticNumberTheory:AN.2/fixed-progression-prime-number-theorem`](#fixed-progression-prime-number-theorem), [`AnalyticNumberTheory:AN.2/chebyshev-prime-count-transfer`](#chebyshev-prime-count-transfer).

### S21 — `SieveMethodsAndPrimePatterns:SV.1`

Shiu’s bound for nonnegative multiplicative functions: for fixed κ,ε>0, x^ε≤z≤x, q≤z^(1−ε), reduced a modq, Σ_{x−z≤n≤x,n≡a modq}|f(n)|≪_{κ,ε} z/(φ(q)log x) exp(Σ_{p≤x,p∤q}|f(p)|/p), for f∈C(κ). Supply the exact range used by GHS Lemma2.3. This is an exact requested extension of SV.1 upper-bound sieve applications; its current packet has no Shiu node. SV.4 plans Maynard bounded gaps and cannot be its supplier.

Used by [`AnalyticNumberTheory:AN.5/halasz-integral-bound`](#halasz-integral-bound).

### S22 — `ProbabilisticAndMetricNumberTheory:PM.5`

Canonical random-matrix zeta/L moment and correlation models, their arithmetic factor, averaging measure, symmetry type and conjectural-status predicates. AN.5 supplies proved analytic moments and compares constants; it does not define a second random model.

Used by [`AnalyticNumberTheory:AN.5/moment-model-comparison`](#moment-model-comparison).

### S23 — `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-5-ideal-and-prime-estimates`

Total ideal-count bounds implying absolute convergence on Re s>1 for each class restriction by domination; combine with Layer1 norm regrouping.

Used by [`AnalyticNumberTheory:AN.4/partial-ideal-zeta`](#partial-ideal-zeta).

### S24 — `AutomorphicSpectralTheory:AS.2`

Continue the normalized level-one E and E* meromorphically with their functional equation. For DIT critical-line Stokes additionally match the differentiated cusp asymptotics and boundary limit of (7.10); the broad stage description does not by itself certify this exact export.

Used by [`AnalyticNumberTheory:AN.4/cm-partial-zeta-period`](#cm-partial-zeta-period), [`AnalyticNumberTheory:AN.4/real-even-partial-zeta-period`](#real-even-partial-zeta-period), [`AnalyticNumberTheory:AN.4/negative-genus-core-period`](#negative-genus-core-period), [`AnalyticNumberTheory:AN.4/positive-genus-geodesic-period`](#positive-genus-geodesic-period), [`AnalyticNumberTheory:AN.4/mixed-genus-cm-period`](#mixed-genus-cm-period), [`AnalyticNumberTheory:AN.4/real-odd-partial-zeta-period`](#real-odd-partial-zeta-period), [`AnalyticNumberTheory:AN.3/eisenstein-weyl-lvalue-bound`](#eisenstein-weyl-lvalue-bound).

### S25 — `GeometryOfNumbersAndQuadraticArithmetic:GN.3`

Quadratic arithmetic quotient dictionary for ordinary/narrow classes, CM lattice points z_A, oriented real geodesics C_A modulo the full norm-one unit action, J and ε_D. Match stabilizer weights and arc length 2 log ε_D. This refinement is requested, not a statement already exported by the generic stage. Nielsen-core surfaces F_A have a separate proposed Fuchsian Part II owner.

Used by [`AnalyticNumberTheory:AN.4/cm-partial-zeta-period`](#cm-partial-zeta-period), [`AnalyticNumberTheory:AN.4/real-even-partial-zeta-period`](#real-even-partial-zeta-period), [`AnalyticNumberTheory:AN.4/negative-genus-core-period`](#negative-genus-core-period), [`AnalyticNumberTheory:AN.4/positive-genus-geodesic-period`](#positive-genus-geodesic-period), [`AnalyticNumberTheory:AN.4/mixed-genus-cm-period`](#mixed-genus-cm-period), [`AnalyticNumberTheory:AN.4/real-odd-partial-zeta-period`](#real-odd-partial-zeta-period), [`AnalyticNumberTheory:AN.3/eisenstein-weyl-lvalue-bound`](#eisenstein-weyl-lvalue-bound).

### S26 — `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`

Specialize the abelian conductor–discriminant formula to a quadratic extension: f_η is its relative discriminant and D_F N(f_η)=D_E/D_F. Use the canonical character from global reciprocity, not an imprimitive modulus.

Used by [`AnalyticNumberTheory:AN.4/quadratic-hecke-value-one`](#quadratic-hecke-value-one), [`AnalyticNumberTheory:AN.4/quadratic-hecke-cauchy-derivative`](#quadratic-hecke-cauchy-derivative), [`AnalyticNumberTheory:AN.4/quadratic-hecke-log-functional-equation`](#quadratic-hecke-log-functional-equation).

### S27 — `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`

Match finite-order real local sign characters to the odd gamma branch for the canonical character of a CM quadratic extension; global Artin at a real place sends a negative element to conjugation.

Used by [`AnalyticNumberTheory:AN.4/quadratic-hecke-log-functional-equation`](#quadratic-hecke-log-functional-equation).

### S28 — `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-2-moduli-and-ray-class-carriers`

Use ordinary/narrow ideal-class carriers and the finite partition of nonzero integral ideals into classes for the general partial ideal series. Do not create a second ideal-class group.

Used by [`AnalyticNumberTheory:AN.4/partial-ideal-zeta`](#partial-ideal-zeta).

### S29 — `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-4-counting-carriers-and-local-finiteness`

Canonical locally finite inclusive counts of nonzero prime ideals via HeightOneSpectrum, including norm cutoffs; supply the carrier/local finiteness only, not the degree-uniform analytic lower bound.

Used by [`AnalyticNumberTheory:AN.4/most-quadratic-many-split-primes`](#most-quadratic-many-split-primes), [`AnalyticNumberTheory:AN.4/effective-prime-ideal-lower`](#effective-prime-ideal-lower).

### S30 — `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation`

Specialize the existing absolute-convergence/Perron and Abel infrastructure to the quadratic Hecke logarithmic-derivative coefficients and the smoothing1−N𝔞/Y. The kernel isY^s/(s(s+1)); zero-height contour shifts and quantitative residues are AN.3/4 proof gaps, not an asserted generic supplier output.

Used by [`AnalyticNumberTheory:AN.4/most-quadratic-many-split-primes`](#most-quadratic-many-split-primes), [`AnalyticNumberTheory:AN.2/siegel-walfisz`](#siegel-walfisz).

### S31 — `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-5-ideal-and-prime-estimates`

Canonical inclusive prime counts, ideal von Mangoldt coefficients, higher-prime-power and finite ramification-discard estimates for quadratic splitting. Match the exact degree/discriminant-dependent errors needed in LOW Lemma4.3; qualitative PNT asymptotics alone do not supply these errors.

Used by [`AnalyticNumberTheory:AN.4/most-quadratic-many-split-primes`](#most-quadratic-many-split-primes).

### S32 — `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-1-the-splitting-dictionary`

Use the existing1.4 doubleCosetEquiv between H\G/D and primes of F=L^H above p, with e,f and norm powers; adapt to the inertia-orbit blocks in the ramified local determinant identity.

Used by [`AnalyticNumberTheory:AN.4/artin-ramified-induction-polynomial`](#artin-ramified-induction-polynomial).

### S33 — `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-3-the-mackey-decomposition-formula`

Use the existing representation-level Mackey3a isomorphism for restriction to D of Ind_H^Gσ, with exact conjugated intersection maps. Add the inertia-fixed cyclic-orbit determinant adapter in AN; do not claim character induction alone gives a ramified local determinant.

Used by [`AnalyticNumberTheory:AN.4/artin-ramified-induction-polynomial`](#artin-ramified-induction-polynomial).

### S34 — `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors`

Use characterConductorExp and the unramified criterion: local conductor exponent0 iff the Galois character is trivial on inertia, compatible with CFT11 globalArtinMap_local and arithmetic Frobenius. This fixes both full local factors in the linear Artin/Hecke comparison.

Used by [`AnalyticNumberTheory:AN.4/artin-linear-hecke-comparison`](#artin-linear-hecke-comparison).

### S35 — `SieveMethodsAndPrimePatterns:SV.1`

For T≥1 and m≥T², bound the Mangoldt-weighted window ∑_{n≥1, |log(n/m)|≤c₀/T}Λ(n)≤C(c₀)m/T for each fixed c₀>0. State and prove the prime-power contribution separately; the prime-only Brun–Titchmarsh count is not the complete Λ window. This supplies GHS Lemma2.6, after the Fourier kernel’s support constant is fixed.

Used by [`AnalyticNumberTheory:AN.5/mangoldt-polynomial-mean-square`](#mangoldt-polynomial-mean-square).

### S36 — `tauceti:TauCetiRoadmap/UniversalCovers#stage-0-port-the-foundations-into-tauceti`

Canonical based universal cover, covering projection, path/homotopy lifting and deck action for the path-connected locally path-connected semilocally simply connected punctured complex-product domains M# and N#. Preserve the loop-then-path concatenation convention. AN.7 owns the analytic chart pullback and Lerch continuation, not a second universal-cover construction.

Used by [`AnalyticNumberTheory:AN.7/lerch-cover-continuation`](#lerch-cover-continuation), [`AnalyticNumberTheory:AN.7/lerch-z-monodromy-shift`](#lerch-z-monodromy-shift).

### S37 — `tauceti:TauCetiRoadmap/UniversalCovers#stage-2-lifting-criterion-and-galois-correspondence`

Canonical regular quotient cover associated to the normal subgroup π₁(N#)″, with deck group π₁(N#)/π₁(N#)″ and based descent. The separate analytic invariance theorem is proved in AN.7.

Used by [`AnalyticNumberTheory:AN.7/lerch-solvable-descent`](#lerch-solvable-descent).

### S38 — `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`

For every nonzero squarefree integer d≠1, export the primitive quadratic field character χ_d modulo |D(d)| with D(d)=d if d≡1 mod4 and4d otherwise. For positive n, χ_d(n)=(D(d)/n), including the Kronecker factor at2; χ_d(0)=0. Prove primitivity, parity and conductor=|D(d)|. The suggested file prototypes these exports in the supplier namespace, not as new AN-owned objects.

Used by [`AnalyticNumberTheory:AN.2/exceptional-squareclasses`](#exceptional-squareclasses), [`AnalyticNumberTheory:AN.4/imaginary-quadratic-root-number-one`](#imaginary-quadratic-root-number-one).

### S39 — `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-7-subfields-integral-bases-monogenicity-and-explicit-units`

For a degree-2g CM field E and its actual normal closure L/Q, identify Gal(L/Q) with its faithful permutation action on the 2g embeddings and deduce [L:Q]≤(2g)!. The stronger quantitative discriminant comparison D_L≤D_E^A_g is a required refinement, with A_g depending only on g; it is not asserted to be an existing Layer7 export. Combine it with the separately assigned general Artin-conductor comparison, not a ray-modulus bound.

Used by [`AnalyticNumberTheory:AN.4/artin-conductor-bound`](#artin-conductor-bound).

## Extensions requiring an owner

Each extension has a precise scope. An endpoint is named only when it exists; a proposed extension is not treated as an existing theorem.

### Chebotarev density theorem, Part II: arithmetic schemes

Normal integral schemes of finite type over Z, finite étale Galois covers, conjugacy-invariant Frobenius subsets of closed points, weighted natural-density normalization from Serre Lectures on N_X(p) §9 and the AV §2.14 application; recover number-field Chebotarev in relative dimension zero. Prove density of Frobenius in the profinite fundamental group and triviality of a finite cover split at a density-one set. Exact mixed-characteristic/finite-field component hypotheses and denominator must be read and stated before a quantitative density theorem.

### RT-AREA-combinatorics/8

The current AC.4 campaign document and reader select Green–Tao 2008. On that route, import AN.2 classical zero-free estimates with the full LemmaA.1 contract: 1−β/log(|t|+2)≤σ≤10, the simple pole at1, bounds for ζ(s)−1/(s−1) and 1/ζ(s) of size O(log(|t|+2)), and the LemmaA.3 convexity input. If W(N) varies, prove W(N)≤(log N)^B for a chosen slow w(N), then apply a uniform progression theorem, not the fixed-q PNT. The Conlon–Fox–Zhao/Zhao smooth-cutoff route would require only local Laurent/Chebyshev input, but narrowing to it requires the AC.4 owner to select and rewrite that proof; it is not the current resolved contract. Concretely, for W(N)=primorial(floor₊w(N)), the pinned θ=log primorial and θ(w)≤(log4)w give W(N)≤(log N)^B whenever N>1 and 0≤w(N)≤B log log N/log4. This elementary bound fixes the required modulus range; the progression error still needs the uniform Siegel–Walfisz target.

### AN.4/colmez-finite-family

Fix g≥1. Let E be any degree2g CM field, L its normal closure over Q (not an arbitrary Galois overfield), G=Gal(L/Q), and c the central complex conjugation. Let F(E) be the finite set of isomorphism classes of nontrivial irreducible complex G-representations ρ satisfying ρ(c)=−Id. Then |G|≤M_g=(2g)!, |F(E)|≤M_g and dim ρ≤M_g. All constants below are uniform in E and ρ∈F(E). The CM owner proves that the nontrivial factors in the averaged Colmez expression belong to this family and that their rational coefficients have absolute value≤B_g; the trivial factor is separated before evaluation at1.

Supplier: ComplexMultiplicationAndExplicitReciprocityPartII (CM heights and Galois-orbit bounds), proposed by PAPER-TSIMERMAN-18/colmez-character-data; no existing stage endpoint.

### AN.4/regulator-ratio

For L⊇K, Rg(L)/Rg(K)≥c_[L:Q]>0, in the canonical global unit/regulator theory, with the Friedman–Skoruppa normalization.

### AN.4/effective-chebotarev

Zeros of L-functions Layer8.7 supplies effective Chebotarev with field degree/discriminant, interval and exceptional-zero dependence explicit. The KP owner must derive its box count from this theorem and its excellent-box arithmetic data.

### AN.4/quadratic-class-geometric-carriers

Use the extraction’s proposed FuchsianOrbifolds, Part II (Nielsen cores and quadratic-class surfaces) for F_A, finite-area core surfaces, oriented geodesic boundaries, and multiplicity-preserving projection to the modular orbifold. GN.3 owns the quadratic arithmetic class/geodesic/CM dictionary; AS.1/AS.2 own Eisenstein analysis. Exact stages and theorem exports are still required.

### AN.4/artin-conductor-arithmetic

For actual finite-dimensional complex Galois representations define a_p(ρ)=Σ_(i≥0)(|G_i|/|G_0|)codim V^(G_i), prove nonnegative integrality and finite support, and f_ρ=∏p p^a_p(ρ). Prove independence of prime and inflation, direct-sum multiplicativity, linear-character conductor agreement, and conductor–discriminant for permutation representations. Combine current NumberFieldArithmetic Layer6.5 permutation discriminant exponents and Layer7 normal-closure bounds to derive log f_ρ≤C_g(1+log D_E) for the stated CM family. The current library lower filtration is imported, never re-planned.

Supplier: ArtinRepresentations, named as the general conductor owner by current NumberFieldArithmetic; no atlas stage or packet node exists.

## Sources

The targets are grouped by mathematics above. Source locators identify the theorems used; they do not prescribe a source-by-source development. The packet records editions, read ranges and original-proof boundaries.

- `tao-divisor-2008`: Terence Tao, [The divisor bound](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/). Author post, 23 September 2008, updated 24 September.
- `kedlaya-ant-2025`: Kiran S. Kedlaya, [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf). Author PreTeXt PDF, last modified 21 December 2025, 154 PDF pages.
- `tate-thesis-1950`: John Tate, [Fourier analysis in number fields and Hecke's zeta-functions](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf). 1950 thesis, 60-page Rutgers-hosted scan.
- `bennett-siksek-2020`: Michael A. Bennett and Samir Siksek, [A conjecture of Erdős, supersingular primes and short character sums](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf). Annals of Mathematics 191 (2020), no.2, published article.
- `reviewed-paper-bennett-siksek-20`: Atlas extraction and independent review; original authors: Michael A. Bennett and Samir Siksek, [Reviewed extraction: A conjecture of Erdős, supersingular primes and short character sums](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-BENNETT-SIKSEK-20.result.json). Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.
- `reviewed-paper-tsimerman-18`: Atlas extraction and independent review; original authors: Jacob Tsimerman, [Reviewed extraction: The Andre-Oort conjecture for A_g](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-TSIMERMAN-18.result.json). Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.
- `reviewed-paper-yun-zhang-17`: Atlas extraction and independent review; original authors: Zhiwei Yun and Wei Zhang, [Reviewed extraction: Shtukas and the Taylor expansion of L-functions](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-YUN-ZHANG-17.result.json). Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.
- `reviewed-paper-duke-imamoglu-toth-16`: Atlas extraction and independent review; original authors: W. Duke, Ö. Imamoḡlu, Á. Tóth, [Reviewed extraction: Geometric invariants for real quadratic fields](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json). Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.
- `reviewed-paper-abdurrahman-venkatesh-25`: Atlas extraction and independent review; original authors: Amina Abdurrahman and Akshay Venkatesh, [Reviewed extraction: Symplectic L-functions and symplectic Reidemeister torsion (mod squares)](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-ABDURRAHMAN-VENKATESH-25.result.json). Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.
- `reviewed-paper-barysoroker-koukoulopoulos-kozma-23`: Atlas extraction and independent review; original authors: Lior Bary-Soroker, Dimitris Koukoulopoulos, Gady Kozma, [Reviewed extraction: Irreducibility of random polynomials: general measures](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-BARYSOROKER-KOUKOULOPOULOS-KOZMA-23.result.json). Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.
- `reviewed-paper-skorobogatov-sofos-23`: Atlas extraction and independent review; original authors: Alexei N. Skorobogatov and Efthymios Sofos, [Reviewed extraction: Schinzel Hypothesis on average and rational points](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-SKOROBOGATOV-SOFOS-23.result.json). Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.
- `reviewed-paper-ghosh-sarnak-22`: Atlas extraction and independent review; original authors: Amit Ghosh and Peter Sarnak, [Reviewed extraction: Integral points on Markoff type cubic surfaces](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-GHOSH-SARNAK-22.result.json). Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.
- `reviewed-paper-lipnowski-tsimerman-18`: Atlas extraction and independent review; original authors: Michael Lipnowski and Jacob Tsimerman, [Reviewed extraction: How large is A_g(F_q)?](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-LIPNOWSKI-TSIMERMAN-18.result.json). Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.
- `reviewed-paper-lemkeoliver-wang-wood-25`: Atlas extraction and independent review; original authors: Robert Lemke Oliver, Jiuya Wang and Melanie Matchett Wood, [Reviewed extraction: The average size of 3-torsion in class groups of 2-extensions](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-LEMKEOLIVER-WANG-WOOD-25.result.json). Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.
- `reviewed-paper-shankar-shankar-tang-etal-22`: Atlas extraction and independent review; original authors: Ananth N. Shankar, Arul Shankar, Yunqing Tang and Salim Tayou, [Reviewed extraction: Exceptional jumps of Picard ranks of reductions of K3 surfaces over number fields](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-SHANKAR-SHANKAR-TANG-ETAL-22.result.json). Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.
- `reviewed-paper-chenevier-taibi-20`: Atlas extraction and independent review; original authors: Gaëtan Chenevier, Olivier Taïbi, [Reviewed extraction: Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-CHENEVIER-TAIBI-20.result.json). Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.
- `reviewed-paper-koymans-pagano`: Atlas extraction and independent review; original authors: Peter Koymans, Carlo Pagano, [Reviewed extraction: On Stevenhagen's conjecture](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-KOYMANS-PAGANO.result.json). Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.
- `reviewed-paper-gross-zagier-86`: Atlas extraction and independent review; original authors: Benedict H. Gross, Don B. Zagier, [Reviewed extraction: Heegner points and derivatives of L-series](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/research/blueprint/papers/PAPER-GROSS-ZAGIER-86.result.json). Repository accepted extraction at base 30e57b9090cc4c5e6d91a92848a4837206a921f8.
- `lerch-I`: Jeffrey C. Lagarias and Wen-Ching Winnie Li, [The Lerch zeta function I. Zeta integrals](https://arxiv.org/pdf/1005.4712v2). arXiv1005.4712v2.
- `lerch-II`: Jeffrey C. Lagarias and Wen-Ching Winnie Li, [The Lerch zeta function II. Analytic continuation](https://arxiv.org/pdf/1005.4967v2). arXiv1005.4967v2.
- `lerch-III`: Jeffrey C. Lagarias and Wen-Ching Winnie Li, [The Lerch zeta function III. Polylogarithms and special values](https://arxiv.org/pdf/1506.06161v1). arXiv1506.06161v1.
- `halasz-ghs`: Andrew Granville, Adam J. Harper and K. Soundararajan, [A new proof of Halász’s theorem, and its consequences](https://arxiv.org/pdf/1706.03749v1). arXiv1706.03749v1.
- `pretentious-gs`: Andrew Granville and K. Soundararajan, [Pretentious multiplicative functions and an inequality for the zeta-function](https://arxiv.org/pdf/math/0608407). arXivmath/0608407v1.
- `smooth-ht`: Adolf Hildebrand and Gérald Tenenbaum, [Integers without large prime factors](https://www.numdam.org/item/JTNB_1993__5_2_411_0.pdf). JTNB5(1993),411–484, publisher scan.
- `beurling-dv`: Gregory Debruyne and Jasson Vindas, [On general prime number theorems with remainder](https://arxiv.org/pdf/1601.05324). arXiv1601.05324v2.
- `lerch-III-published`: Jeffrey C. Lagarias and Wen-Ching Winnie Li, [The Lerch Zeta function III. Polylogarithms and special values](https://link.springer.com/content/pdf/10.1186/s40687-015-0049-2.pdf). Research in the Mathematical Sciences3:2(2016),54pp, publisher PDF.
- `atlas-an-brief`: Tau Ceti Atlas maintainers, [Analytic Number Theory stage specification](https://github.com/CBirkbeck/tauceti-explorer/blob/30e57b9090cc4c5e6d91a92848a4837206a921f8/content/campaign/AnalyticNumberTheory/README.md). Campaign brief at the recorded job base, amended by accepted RS-07.
- `dit-published-2016`: W. Duke, Ö. Imamoḡlu, Á. Tóth, [Geometric invariants for real quadratic fields](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf). Published journal PDF; selected reading only.
- `thorner-zaman-2017`: Jesse Thorner and Asif Zaman, [An explicit bound for the least prime ideal in the Chebotarev density theorem](https://msp.org/ant/2017/11-5/ant-v11-n5-p04-p.pdf). Published journal PDF; selected reading only.
- `bkk-primary-v3`: Lior Bary-Soroker, Dimitris Koukoulopoulos and Gady Kozma, [Irreducibility of random polynomials: general measures](https://arxiv.org/pdf/2007.14567v3). arXiv:2007.14567v3, final preprint, 2023; not the published Inventiones version.
- `ss-primary-published`: Alexei N. Skorobogatov and Efthymios Sofos, [Schinzel Hypothesis on average and rational points](https://eprints.gla.ac.uk/292484/1/292484.pdf). Inventiones Mathematicae 231 (2023), 673–739, published PDF deposited by the University of Glasgow.
- `kouk-primary-preliminary`: Dimitris Koukoulopoulos, [The Distribution of Prime Numbers](https://dms.umontreal.ca/~koukoulo/documents/publications/primes.pdf). Author preliminary version provided with AMS permission, acquired 2026-10-05; published GSM203 (2019) text not inspected.
- `smati-primary-1992`: A. Smati, [Evaluation effective du nombre d’entiers n tels que φ(n) ≤ x](https://matwbn.icm.edu.pl/ksiazki/aa/aa61/aa6124.pdf). Acta Arithmetica LXI.2 (1992), 143–159, publisher scan.
- `gs-primary-v3`: Amit Ghosh and Peter Sarnak, [Integral points on Markoff type cubic surfaces](https://arxiv.org/pdf/1706.06712v3). arXiv:1706.06712v3, 30 May 2022; preprint final version, not the separately typeset published article.
- `lt-primary-v1-residue`: Michael Lipnowski and Jacob Tsimerman, [How large is A_g(F_q)?](https://arxiv.org/pdf/1511.02212v1). arXiv:1511.02212v1, 6 November 2015; published numbering/content not identified.
- `low-primary-published`: Robert Lemke Oliver, Jiuya Wang and Melanie Matchett Wood, [The average size of 3-torsion in class groups of 2-extensions](https://doi.org/10.1017/S2050508625000009). Forum of Mathematics, Pi13 (2025), e19, published open-access version.
- `zaman-primary-thesis`: Asif Ali Zaman, [Analytic estimates for the Chebotarev Density Theorem and their applications](https://www.math.toronto.edu/zaman/files/thesis.pdf). PhD thesis, University of Toronto, 2017.
- `mestre-primary-published`: Jean-François Mestre, [Formules explicites et minorations de conducteurs de variétés algébriques](https://www.numdam.org/item/CM_1986__58_2_209_0.pdf). Compositio Mathematica 58 (1986), 209–232, Numdam publisher scan.
- `ct-primary-published`: Gaëtan Chenevier, Olivier Taïbi, [Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf). Publ. Math. IHÉS131 (2020), 261–323, publisher PDF.
- `kp-primary-v1`: Peter Koymans, Carlo Pagano, [On Stevenhagen’s conjecture](https://arxiv.org/pdf/2201.13424v1). arXiv2201.13424v1, 31 January2022.
- `ckmp-primary-preprint`: Stephanie Chan, Peter Koymans, Djordjo Milovic, Carlo Pagano, [On the negative Pell equation](https://arxiv.org/pdf/1908.01752). arXiv1908.01752v1, 5 August2019 (title-page date6 August2019), acquired PDF.
- `heilbronn-primary-published`: Hans Heilbronn, [On real zeros of Dedekind ζ-functions](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/C5957B0EA95C11C03686CE62D407E1DC/S0008414X00050926a.pdf/on-real-zeros-of-dedekind-z-functions.pdf). Canadian Journal of Mathematics25 (1973), 870–873, publisher PDF; DOI10.4153/CJM-1973-090-3.
- `gz-primary-published-bu`: Benedict H. Gross, Don B. Zagier, [Heegner points and derivatives of L-series](https://math.bu.edu/people/svh/GZ1.pdf). Inventiones mathematicae84 (1986),225–320, university-hosted published scan,96 pages.
- `yun-zhang-primary-published`: Zhiwei Yun and Wei Zhang, [Shtukas and the Taylor expansion of L-functions](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p02-p.pdf). Annals of Mathematics 186 (2017), 767–911, published PDF.
- `dlmf-gamma-asymptotics-2026`: NIST DLMF editors and Chapter5 authors, [NIST Digital Library of Mathematical Functions, Gamma asymptotic expansions](https://dlmf.nist.gov/5.11). Web page acquired2026-10-05.
- `milne-cft-4-03`: J.S. Milne, [Class Field Theory](https://www.jmilne.org/math/CourseNotes/CFT.pdf). Version4.03,6 August2020, author course notes.
- `green-tao-primary-published`: Ben Green and Terence Tao, [The primes contain arbitrarily long arithmetic progressions](https://annals.math.princeton.edu/wp-content/uploads/annals-v167-n2-p03.pdf). Annals of Mathematics167(2008),481–547.
- `tsimerman-primary-published`: Jacob Tsimerman, [The André–Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf). Annals of Mathematics187(2018),379–390.

## Library foundations

The following declarations supply the bottom of the dependency graph at the pinned commits.

| Declaration | Interface used |
|---|---|
| `mathlib:exists_nat_ge` | Archimedean choice of a natural upper bound for an arbitrary real. |
| `mathlib:Finset.prod_le_prod` | Product comparison from nonnegative factors and pointwise inequalities. |
| `mathlib:Real.add_one_le_exp` | For real t, t+1≤exp t. |
| `mathlib:Real.log_le_log` | Logarithm monotonicity on positive reals. |
| `mathlib:Real.le_log_iff_exp_le` | At positive y, x≤log y iff exp x≤y. |
| `mathlib:Real.log_pos` | The logarithm is positive at real x>1. |
| `mathlib:Real.rpow_def_of_pos` | For positive x, x^y=exp(log x*y). |
| `mathlib:Real.rpow_natCast` | Real power by a natural exponent agrees with ordinary power. |
| `mathlib:Real.rpow_nonneg` | Real powers of a nonnegative base are nonnegative. |
| `mathlib:Real.rpow_add` | x^(y+z)=x^y*x^z for positive x. |
| `mathlib:Real.rpow_mul` | x^(yz)=(x^y)^z for nonnegative x. |
| `mathlib:Real.mul_rpow` | A real power distributes over two nonnegative factors. |
| `mathlib:Real.rpow_le_rpow` | Monotonicity in nonnegative bases at nonnegative exponent. |
| `mathlib:Nat.prod_primeFactors_pow_factorization` | For n≠0, n=∏p∈primeFactors(n), p^(factorization(n,p)). |
| `mathlib:Nat.prime_of_mem_primeFactors` | Members of the finite prime-factor set are prime. |
| `mathlib:ArithmeticFunction.sigma_zero_apply` | σ₀(n)=card(n.divisors). |
| `mathlib:ArithmeticFunction.sigma_zero_apply_prime_pow` | σ₀(p^a)=a+1 for prime p. |
| `mathlib:Nat.card_divisors` | For n≠0, card(n.divisors)=∏p∈primeFactors(n), (factorization(n,p)+1). |
| `mathlib:Chebyshev.psi` | Inclusive von Mangoldt count through the natural floor; not the half-weight endpoint count. |
| `mathlib:Nat.divisors` | Finite positive natural divisors, with divisors0=empty by convention. |
| `mathlib:DirichletCharacter.IsPrimitive.completedLFunction_one_sub` | Primitive completed Dirichlet functional equation with inverse character, conductor power and root number. |
| `mathlib:HurwitzZeta.hurwitzZeta` | Hurwitz zeta for a parameter in UnitAddCircle, not general complex a. |
| `mathlib:HurwitzZeta.expZeta` | Exponential zeta for a real-circle parameter. |
| `mathlib:HurwitzZeta.hasSum_expZeta_of_one_lt_re` | For real a and Re(s)>1, expZeta(a,s)=∑n≥1 exp(2πian)n^(−s); comparison with Lerch is zΦ(z,s,1). |
| `mathlib:riemannZeta_ne_zero_of_one_le_re` | ζ(s)≠0 on Re(s)≥1; the value at1 is totalized and is not a holomorphy statement. |
| `mathlib:completedRiemannZeta_one_sub` | Existing symmetry Λ(1−s)=Λ(s) of completed Riemann zeta. |
| `mathlib:riemannZeta` | Existing Riemann zeta as the zero-parameter Hurwitz-even specialization. |
| `mathlib:AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` | The identity theorem on a preconnected open set. |
| `mathlib:Complex.Gammaℂ` | Γ_ℂ(s) = 2(2π)^{−s}Γ(s). |
| `mathlib:Complex.Gammaℝ` | Γ_ℝ(s) = π^{−s/2}Γ(s/2). |
| `mathlib:Complex.exp` | The complex exponential, for m-th roots exp((1/m)log g) on simply connected domains. |
| `mathlib:DirichletCharacter.LFunction_ne_zero_of_one_le_re` | The K = ℚ case of Hecke nonvanishing: LFunction χ s ≠ 0 when 1 ≤ Re s and (χ ≠ 1 or s ≠ 1). The principal character at s = 1 is excluded. |
| `mathlib:LSeries.positive` | An L-series with nonnegative coefficients and a₁ > 0 is positive on reals beyond its abscissa. |
| `mathlib:NumberField.dedekindZeta` | The Dedekind zeta function as the ideal-counting L-series. |
| `mathlib:NumberField.dedekindZeta_residue` | The constant 2^{r₁}(2π)^{r₂}Rh/(w√\|d\|), Tate's κ. |
| `mathlib:NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` | The residue of ζ_K at 1 as a one-sided real limit. |
| `mathlib:Real.cos_two_mul` | cos 2θ = 2cos²θ − 1, for 3 + 4cos θ + cos 2θ = 2(1 + cos θ)². |
| `mathlib:Chebyshev.theta` | Inclusive prime logarithm sum with natural floor. |
| `tauceti:TauCeti.Multiquadratic.genusCharFunNarrowClassGroupHom` | Genus character into integer units of the narrow class group for the explicit prime-discriminant factorization, polynomial generator and squarefreeness hypotheses. |
| `tauceti:NumberField.NarrowClassGroup.toClassGroupEquiv` | Narrow/ordinary ideal-class multiplicative equivalence under IsTotallyComplex. |
| `mathlib:AnalyticOnNhd.circleAverage_log_norm` | Jensen formula for a function analytic near a closed ball with nonzero centre value; R≠0. |
| `mathlib:AnalyticOnNhd.sum_divisor_le` | Multiplicity-weighted zero count in radius r bounded by log(M/\|f(c)\|)/log(R/r), 0<r<R and M≥1. |
| `mathlib:Complex.borelCaratheodory` | Bounds a holomorphic function on the inner ball by an upper bound for its real part on the larger open ball. |
| `mathlib:analyticOrderNatAt` | Natural analytic vanishing order; junk zero must be excluded by analyticity and finite-order hypotheses. |
| `mathlib:AnalyticAt.analyticOrderAt_eq_natCast` | Local factorization (z−z0)^n g with g analytic and g(z0)≠0 characterizes analytic order n. |
| `mathlib:TendstoLocallyUniformlyOn.differentiableOn` | Holomorphicity of a locally uniform limit on an open domain with a nonbottom filter and eventually holomorphic approximants. |
| `mathlib:TendstoLocallyUniformlyOn.deriv` | Locally uniform convergence of derivatives of holomorphic locally uniform approximants on an open domain. |
| `mathlib:Complex.exists_continuousOn_eqOn_exp_comp` | Continuous logarithm of a nonvanishing continuous function on an open simply connected set; analyticity is not part of this theorem. |
| `mathlib:completedRiemannZeta₀` | Pole-subtracted completed Riemann zeta. |
| `mathlib:differentiable_completedZeta₀` | The pole-subtracted completed function is entire. |
| `mathlib:completedRiemannZeta₀_one_sub` | Reflection symmetry of the pole-subtracted completed function. |
| `mathlib:Nat.smoothNumbers` | Positive naturals whose prime factors are strictly smaller than the natural cutoff; mathematical P(n)≤y requires floor(y)+1. |
| `mathlib:DirichletCharacter.LFunction` | Canonical continued Dirichlet function, distinct from LSeries outside Re s>1. |
| `mathlib:Nat.smoothNumbersUpTo` | Finite inclusive natural cutoff of the existing strict-smoothness carrier. |
| `mathlib:ArithmeticFunction.vonMangoldt` | Real-valued arithmetic function, zero at 0; log(minFac n) at a prime power and zero otherwise. The integer extension reuses it. |
| `mathlib:ArithmeticFunction.moebius` | Integer-valued arithmetic function: (-1)^cardFactors n for squarefree n, zero otherwise; includes value zero at 0. |
| `mathlib:ArithmeticFunction.sum_moebius_mul_log_eq` | For every natural n, the divisor sum Σ_{d∈n.divisors} μ(d)log d equals −vonMangoldt(n). At n=0 the native divisor finset is empty; this does not identify a finite cutoff over divisors of the integer zero. |
| `mathlib:ArithmeticFunction.vonMangoldt_sum` | For every natural n, Σ_{d∈n.divisors} vonMangoldt(d)=log n; summing over positive n gives the log=Λ∗1 identity used in the elementary Mertens proof. |
| `mathlib:Chebyshev.psi_le_const_mul_self` | For real x≥0, psi(x)≤(log 4+4)x; psi has an inclusive floor cutoff. Supplies the floor-error bound, without assuming PNT. |
| `mathlib:Nat.primeFactors_prod` | If every member of a finite set s of naturals is prime, primeFactors(∏_{p∈s}p)=s. Recovering s from its product proves injectivity. |
| `mathlib:Finset.card_image_of_injOn` | For a function injective on a finite set s, card(image f s)=card s. |
| `mathlib:Finset.card_powersetCard` | For n natural and finite s, card(powersetCard n s)=Nat.choose(card s,n). |
| `mathlib:isEquivalent_choose` | For fixed natural k, (n.choose k:ℝ) is asymptotically equivalent atTop on ℕ to n^k/k!. The statement is in the root namespace and includes k=0. |
| `mathlib:sum_mul_eq_sub_sub_integral_mul` | Abel identity on real 0≤a≤b for a differentiable weight whose derivative is integrable on [a,b]; the sum is over floor(a)<k≤floor(b), with both endpoint terms and the integral of derivative times the inclusive coefficient sum. |
| `mathlib:ArithmeticFunction.mul_apply` | For semiring-valued arithmetic functions f,g, (f*g)(n)=Σ_{(a,b)∈divisorsAntidiagonal n}f(a)g(b); this is Dirichlet convolution, not pointwise multiplication. |
| `mathlib:Nat.totient_eq_mul_prod_factors` | For all natural n, the rational equality (totient n:ℚ)=n∏_{p∈primeFactors n}(1−1/p). Transfer to ℝ before division; n≥3 gives a positive denominator. |
| `mathlib:Nat.eq_sq_add_sq_iff` | For every natural n, n is a sum of two natural squares iff every prime q in n.primeFactors with q mod4=3 has even padicValNat q n; includes the totalized n=0 case. |
| `mathlib:Nat.le_sqrt'` | For natural m,n, m≤Nat.sqrt n iff m²≤n. |
| `mathlib:Set.InjOn.ncard_image` | An injective-on-set map preserves natural cardinality of its image; finite bounded sets are used here. |
| `mathlib:Set.ncard_Iic_nat` | The natural interval {0,…,b} has natural cardinality b+1. |
| `mathlib:Nat.prod_primeFactors_dvd` | The product of the distinct prime factors of n divides n. The n=0 case is totalized; logarithmic estimates use n≥2. |
| `mathlib:Real.log_prod` | For a finite product of nonzero real factors, the logarithm of the product is the sum of their logarithms. |
| `mathlib:BoundedVariationOn` | Finite total variation eVariationOn f s, defined by finite monotone sampling; used on univ for real weighted test functions and their difference quotients. |
| `mathlib:Function.leftLim` | Strict left limit, with f(x) as fallback when no limit exists; BV existence must precede using it as an actual limit. |
| `mathlib:Function.rightLim` | Strict right limit with the same fallback convention; finite variation supplies genuine one-sided limits. |
| `mathlib:MeasureTheory.Integrable` | AE strong measurability and finite integral; default real/complex Lebesgue measure for tests and transforms. |
| `mathlib:MeasureTheory.integral` | Totalized Bochner integral, returning0 outside its integrable/complete-space branch. Transform convergence is asserted separately. |
| `mathlib:DirichletCharacter.differentiable_completedLFunction` | For χ≠1, the canonical completedLFunction is complex differentiable everywhere; no new Dirichlet-continuation node is required. |
| `mathlib:Complex.Gamma_one` | Γ(1)=1. |
| `mathlib:Complex.Gamma_one_half_eq` | Γ(1/2)=(π:ℂ)^(1/2:ℂ), the principal positive-real half power; conversion to the real square root is needed at the regular half-integer endpoint. |
| `mathlib:AnalyticOnNhd.eqOn_of_preconnected_of_frequently_eq` | Identity theorem on a preconnected set from equality accumulating at a point of that set; both functions analytic on a neighbourhood of every point. |
| `mathlib:AnalyticOnNhd.eqOn_zero_or_eventually_ne_zero_of_preconnected` | An analytic function on a preconnected set is identically zero or nonzero outside a codiscrete exceptional set. |
| `mathlib:IsCompact.finite_sdiff_of_mem_codiscreteWithin` | For a compact K and s codiscrete within K, K minus s is finite. |
| `mathlib:AnalyticAt.analyticOrderAt_ne_top` | Finite analytic order is equivalent to a local factorization by the natural order with analytic, nonvanishing residual factor. |
| `mathlib:analyticAt_clog` | Principal complex logarithm is analytic at points of the slit plane, including 1. |
| `mathlib:Complex.exp_eq_one_iff` | exp(w)=1 iff w is an integer multiple of 2 pi i. |
| `mathlib:Complex.norm_log_one_add_sub_self_le` | For norm z<1, norm(log(1+z)-z) is at most norm(z)^2/(2(1-norm z)); substitute z=-w for genus-one factors. |
| `mathlib:Complex.hasSum_taylorSeries_neg_log` | For norm z<1, HasSum of z^n/n (including the totalized zero term) is -log(1-z); subtract the n=1 term. |
| `mathlib:Complex.norm_iteratedDeriv_le_of_forall_mem_sphere_norm_le` | Cauchy estimate norm(iteratedDeriv n f c) <= n! C/R^n for R>0, DiffContOnCl on the ball and the stated sphere bound. |
| `mathlib:is_const_of_deriv_eq_zero` | For a real/complex function differentiable everywhere with derivative identically zero, any two function values are equal; applying this twice turns h″=0 into an affine function. |
| `mathlib:Real.GammaIntegral_convergent` | For real s>0, exp(-x)*x^(s-1) is IntegrableOn Ioi 0. |
| `mathlib:Real.Gamma_eq_integral` | For real s>0, Gamma s is the integral of exp(-x)*x^(s-1) over Ioi 0. |
| `mathlib:Real.Gamma_nat_eq_factorial` | For natural n, Real.Gamma(n+1)=n!. |
| `mathlib:Nat.factorial_le_pow` | For all natural n, n! <= n^n, including n=0. |
| `mathlib:HurwitzZeta.evenKernel` | Existing even theta/Mellin kernel on UnitAddCircle times real x; at a=0 and x>0 it is the real integer Gaussian theta sum. |
| `mathlib:HurwitzZeta.hasSum_int_evenKernel` | For a real and t>0, HasSum over integers n of exp(-pi*(n+a)^2*t) to evenKernel a t. |
| `mathlib:HurwitzZeta.hurwitzEvenFEPair` | WeakFEPair with f=complex cast of evenKernel, g=cosKernel, k=1/2, epsilon=1, f0=indicator(a=0), g0=1. |
| `mathlib:HurwitzZeta.completedHurwitzZetaEven₀` | The regular completion is (hurwitzEvenFEPair a).Lambda0(s/2)/2; its exact one-sided Mellin-integral comparison is an adapter to this definition. |
| `mathlib:WeakFEPair.f_modif` | On Ioi 1 the modified kernel is f-f0; on Ioo 0 1 it is f-epsilon*x^(-k)*g0; at x=1 it is zero. |
| `mathlib:WeakFEPair.Λ₀` | The pole-subtracted completion is mellin P.f_modif. |
| `mathlib:mellin` | For a complex normed target E, mellin f s is the integral on Ioi 0 of (t:Complex)^(s-1) acting on f t. |
| `mathlib:completedRiemannZeta_eq` | For every complex s, completedRiemannZeta s = completedRiemannZeta0 s - 1/s - 1/(1-s); divisions are totalized and endpoint values cannot be identified by multiplying the pole formula. |
| `mathlib:riemannZeta_eq_completedRiemannZeta₀` | For s != 0, zeta s = (completed0 s - 1/s - 1/(1-s))/(pi^(-s/2)*Gamma(s/2)); multiplying back requires a nonzero denominator. |
| `mathlib:riemannZeta_eq_mul_completedRiemannZeta₀` | For every s, zeta s = (s*completed0 s - 1 - s/(1-s))/(2*pi^(-s/2)*Gamma(s/2+1)); use away from s=1 to exhibit a pole-cleared analytic germ. |
| `mathlib:Complex.Gamma_ne_zero` | Gamma s != 0 whenever s is not a nonpositive integer; Gamma is assigned zero at its mathematical poles. |
| `mathlib:Complex.Gamma_ne_zero_of_re_pos` | Gamma s != 0 for Re s > 0. |
| `mathlib:Complex.digamma` | The existing digamma carrier is logDeriv Gamma; no uniform large-argument asymptotic is asserted by this definition. |
| `mathlib:ArithmeticFunction.LSeriesSummable_vonMangoldt` | For Re s>1, the complex-cast von Mangoldt L-series is absolutely summable. |
| `mathlib:ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div` | For Re s>1, LSeries of the complex-cast von Mangoldt function equals -deriv riemannZeta s / riemannZeta s. |
| `mathlib:ArithmeticFunction.vonMangoldt_nonneg` | For every natural n, vonMangoldt n >= 0, including n=0. |
| `mathlib:riemannZeta_residue_one` | The punctured limit of (s-1)*riemannZeta s at 1 is 1; analyticity of a pole-cleared germ requires the separate regular-completion formula. |
| `mathlib:logDeriv_tprod_eq_tsum` | On an open complex set, a locally uniformly multipliable family of differentiable factors has logDeriv(tprod)=tsum(logDeriv) at x, provided every factor and the limit product are nonzero at x and the log-derivative series is Summable. |
| `mathlib:Complex.digamma_apply_add_one` | For s not a nonpositive integer, digamma(s+1)=digamma(s)+1/s; this shifts the half-argument into the right half-plane. |
| `mathlib:Complex.differentiableAt_Gamma` | Gamma is complex differentiable at s whenever s is not any nonpositive integer. |
| `mathlib:riemannZeta_one_sub` | For s not a nonpositive integer and s != 1, zeta(1-s)=2*(2*pi)^(-s)*Gamma(s)*cos(pi*s/2)*zeta(s). This is already the duplicated/reflected form required for the left-half-plane logarithmic derivative. |
| `mathlib:Representation.invariants` | The existing submodule of vectors fixed by every group element; restrict to inertia rather than create a new fixed-vector carrier. |
| `mathlib:Representation.mem_invariants` | Membership is exactly ∀g,ρ(g)v=v under CommRing/Group/module hypotheses. |
| `mathlib:IsArithFrobAt.mul_inv_mem_inertia` | Two arithmetic Frobenius lifts at one prime differ by inertia; no equality of ramified automorphisms. |
| `mathlib:IsArithFrobAt.conj` | Conjugating a Frobenius lift transports its prime to the corresponding group translate. |
| `mathlib:LinearEquiv.charpoly_conj` | Characteristic polynomial is unchanged by conjugation through a linear equivalence on finite free modules. |
| `mathlib:LinearMap.charpoly_prodMap` | Characteristic polynomial of a product block map is the product, under finite free module hypotheses. |
| `mathlib:Matrix.charpolyRev` | Existing polynomial det(1−X•M.map C), the local Artin determinant carrier. |
| `mathlib:Matrix.reverse_charpoly` | The reverse of the matrix characteristic polynomial equals charpolyRev. |
| `mathlib:differentiableAt_riemannZeta` | Complex differentiability of riemannZeta away from 1; continuity of its logarithmic derivative requires analytic differentiation and nonvanishing. |
| `mathlib:DirichletCharacter.differentiableAt_LFunction` | Canonical Dirichlet continuation is differentiable at s when s≠1 or χ≠1; applies at 1 to nonprincipal characters. |
| `mathlib:DirichletCharacter.sum_char_inv_mul_char_eq` | For nonzero modulus and a unit a, the finite complex character sum of χ(a⁻¹)χ(b) is φ(q) if a=b and zero otherwise, including nonunits b. |
| `mathlib:DirichletCharacter.LSeries_twist_vonMangoldt_eq` | On Re s>1, the χΛ LSeries is minus the logarithmic derivative of the χ LSeries; canonical-continuation comparison must be applied separately. |
| `mathlib:DirichletCharacter.LSeriesSummable_twist_vonMangoldt` | The χΛ Dirichlet series is absolutely summable on Re s>1, uniformly usable for every fixed finite character sum. |
| `mathlib:DirichletCharacter.deriv_LFunction_eq_deriv_LSeries` | The derivative of the canonical Dirichlet continuation agrees with that of its LSeries on Re s>1. |
| `mathlib:DirichletCharacter.LFunctionTrivChar_eq_mul_riemannZeta` | For nonzero q and s≠1, principal L is zeta times one missing Euler factor for every prime divisor of q; the identity does not assign the meromorphic pole its junk value. |
| `mathlib:Chebyshev.isBigO_psi_sub_theta_sqrt` | At +∞, the inclusive ψ−θ is O(sqrt x), stronger than the crude logarithmic prime-power removal needed for rational prime-count transfer. |
| `mathlib:ArithmeticFunction.IsMultiplicative` | For a zero-extended arithmetic function, f(1)=1 and multiplication on coprime natural arguments; this is not complete multiplicativity. |
| `mathlib:LSeries.eq_of_LSeries_eventually_eq` | Two somewhere-absolutely-convergent coefficient series agreeing eventually on large real arguments have equal coefficients at every nonzero natural; normalized zero extension is needed for equality at0. |
| `mathlib:ArithmeticFunction.zeta` | Natural-valued arithmetic function0 at0 and1 at positive naturals, distinct from the convolution unit supported at1. |
| `mathlib:LSeriesSummable` | Absolute summability of the complex LSeries terms, whose zero-index term is0; mandatory before using a totalized LSeries value. |
| `mathlib:Nat.mem_smoothNumbersUpTo` | n∈smoothNumbersUpTo N k iff n≤N and n∈smoothNumbers k; positivity is in the latter carrier, so 0 is excluded. |
| `mathlib:Nat.equivProdNatFactoredNumbers` | For a prime p not in a finite set s, a bijection ℕ×factoredNumbers s≃factoredNumbers(insert p s), with forward map (e,m)↦p^e*m; supports finite-prime geometric factorization without an infinite-prime convergence assumption. |
| `mathlib:Real.eulerMascheroniSeq_lt_eulerMascheroniConstant` | For every natural n, harmonic n−log(n+1)<γ; no positive-n hypothesis is omitted. |
| `mathlib:Real.eulerMascheroniConstant_lt_eulerMascheroniSeq'` | γ<the upper Euler sequence at every natural n; for n>0 its defining expression is harmonic n−log n. At n=0 it is the junk value2. |
| `mathlib:Real.log_le_sub_one_of_pos` | For positive real x, log x≤x−1. Used with x=1+1/N to derive the harmonic remainder bound. |
| `mathlib:HurwitzZeta.hasSum_hurwitzZeta_of_one_lt_re` | For real a∈[0,1] and Re s>1, HasSum of1/(n+a)^s to the circle Hurwitz function. At a=0 and s≠0, the n=0 term is totalized0; real c=1 gives the positive-integer representative. |
| `mathlib:HurwitzZeta.differentiableAt_hurwitzZeta` | The circle Hurwitz function is complex differentiable at every s≠1, for any circle parameter. |
| `mathlib:HurwitzZeta.hurwitzZeta_residue_one` | The punctured complex limit of(s−1)hurwitzZeta(a,s) at1 equals1 for every UnitAddCircle a. |
| `mathlib:HurwitzZeta.differentiableAt_hurwitzZeta_sub_one_div` | At s=1, hurwitzZeta(a,s)−1/(s−1)/Gammaℝ(s) is differentiable. This is the pinned normalization; it does not identify the pointwise value of subtraction by1/(s−1) with its analytic extension. |
| `mathlib:Complex.cpow_def_of_ne_zero` | For nonzero complex x, x^y=exp(log x*y), with the pinned principal logarithm. For Re(n+c)>0 this matches the defining Lerch/Hurwitz exponential term. |
| `mathlib:ZMod.LFunction` | For N≠0 and Φ:ZMod N→C, the continued L-function is defined as N^(−s) times the finite sum of Φ(j)hurwitzZeta(toAddCircle j,s). Reuse this continuation rather than construct a second one. |
| `mathlib:Polynomial.bernoulli` | Rational polynomial B_n, defined using the negative-convention Bernoulli numbers; use eval₂ into C for complex c. |
| `mathlib:Polynomial.bernoulli_one` | B₁(X)=X−1/2, fixing the order-zero Hurwitz endpoint normalization. |
| `mathlib:Polynomial.bernoulli_eval_one` | B_n(1)=bernoulli′ n; the positive Bernoulli convention at1 differs from B_n(0) when n=1. |
| `mathlib:Nat.primeCounting` | Inclusive natural prime count π(n), defined as primeCounting′(n+1). This fixes the ordinary Beurling specialization at the real floor cutoff. |
| `mathlib:Real.log_pow` | log(x^n)=n log x for real x and natural n; applied here only at positive prime powers. |
| `mathlib:Real.log_rpow` | For x>0, log(x^y)=y log x; positivity is required for the real-exponent cutoff. |
| `mathlib:isLittleO_log_rpow_rpow_atTop` | For s>0 and arbitrary r, (log x)^r=o(x^s) atTop; the name is global, not in the Real namespace. |
| `tauceti:TauCeti.IdealArithmeticFunction` | Complex arithmetic functions on nonzero integral ideals. |
| `tauceti:TauCeti.normCoeff` | Finite norm-fibre regrouping into a zero-extended ArithmeticFunction. |
| `mathlib:ClassGroup.mk0` | The monoid homomorphism from nonzero integral ideals to ordinary ideal classes. |
| `tauceti:NumberField.NarrowClassGroup.mk0` | Canonical nonzero-ideal map to narrow classes. |
| `tauceti:NumberField.NarrowClassGroup.mk0_map_ringOfIntegersQuadraticConj_eq_inv` | Quadratic conjugation inverts narrow classes, with the actual polynomial-generator hypotheses. |
| `tauceti:NumberField.exists_isArithFrobAt` | An arithmetic Frobenius lift at a nonzero prime in a Galois number-field extension, including ramified primes. |
| `tauceti:TauCeti.UniversalCover` | Endpoint/path-homotopy-class model with its quotient topology. |
| `tauceti:TauCeti.UniversalCover.basepointLift` | The constant-path point over the basepoint (returned as a fibre subtype). |
| `tauceti:TauCeti.UniversalCover.inv_smul_mk` | The inverse action prepends the corresponding loop without reversing its orientation. |
| `tauceti:TauCeti.UniversalCover.SubgroupQuotient` | The actual subgroup-orbit quotient of the canonical cover. |
| `tauceti:TauCeti.UniversalCover.subgroupQuotientMap` | Canonical orbit quotient map. |
| `mathlib:Representation.IsIrreducible` | Irreducibility on actual complex representations as simplicity of the subrepresentation order. |
| `mathlib:NumberField.IsCMField.complexConj` | Canonical conjugation of a CM field, compatible with every complex embedding. |
| `mathlib:MeromorphicOn` | Meromorphy at every point of a set; isolated totalized values are not analytic endpoint values. |
| `mathlib:Chebyshev.theta_eq_log_primorial` | For every real x, θ(x)=log(primorial(floor₊x)). |
| `mathlib:Chebyshev.theta_le_log4_mul_x` | For real x≥0, θ(x)≤(log4)x. This gives the slow-growing W bound without a prime number theorem. |
