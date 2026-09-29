# Arithmetic Dirichlet series and Tauberian methods, Part II: analytic number theory and zeta functions

Part AN.0: layers AN.0–AN.7. This is a partial mathematical specification. Every declaration is unchecked; signature elaboration is not an implementation claim.

## Purpose, conventions and ownership

The base is [Arithmetic Dirichlet series and Tauberian methods](../../../content/tau-ceti/ArithmeticDirichletSeries/README.md). Its arithmetic-function, ideal-weight, Euler-product, summation and Tauberian interfaces are consumed, not rebuilt. The principal completed chain in this part is the divisor subpower estimate needed by the short-character-sum application. The analytic continuation, zero-counting and arithmetic comparison targets remain explicit mathematical obligations.

Write τ(n)=card(n.divisors) for the pinned natural-divisor carrier. Statements concerning classical divisor counts assume n>0. The library totalizes the zero case by an empty finite set; it is not a finite enumeration of every divisor of zero. In particular τ(1)=1, τ(12)=6 and τ(64)=7. The already available prime-power identity and multiplicative factorization of τ are baseline inputs.

For positive real x, x^u means exp(u log x); complex x^s with x>0 means exp(s log x). This fixes the branch in explicit formulas. All zero sums carry analytic multiplicity. An inclusive summatory function and its half-weight endpoint variant are different: the latter subtracts Λ(m)/2 at an integral endpoint m. No continuum integral or complex continuation is inferred from a totalized value at a pole.

The surviving layers have separate tasks:

| Layer | Owned mathematics | Imported boundary |
|---|---|---|
| AN.2 | Quantitative zero-free regions, exceptional zeros, explicit PNT instances and effectivity | Existing zeta/Dirichlet continuation; ADS Perron and Tauberian transfer |
| AN.3 | Zero counting, explicit formulas, density and basic mean-value estimates | SV.2 large-sieve input; Bombieri–Vinogradov itself is SV.3-owned |
| AN.4 | Arithmetic series/Tate comparisons, boundary nonvanishing and Artin factors | GlobalNumberFields characters; NFA Frobenius; CFT reciprocity; AL.0/1 analysis |
| AN.5 | Multiplicative-function estimates, including the divisor chain below | Existing divisor and prime-factorization APIs |
| AN.7 | General complex Lerch parameters, branch and joint-continuation theory | Existing real-circle Hurwitz and exponential zeta |

AN.0, AN.1 and AN.6 have no new declarations: accepted RS-07 drops these duplicate or process layers. Layers AN.8 and AN.9 belong to the other part and are not in this packet. The old FoundationsAndLibraryIntegration umbrella is not a mathematical supplier. Canonical, theorem-level owners replace it.

The pinned baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The eight scoped library-audit rows were consulted before planning. Searches included the declaration index and arithmetic/number-theory source trees of both libraries: the divisor formula exists, while no matching uniform divisor subpower estimate was found. The selected constant bound therefore extends the existing carrier rather than introducing another arithmetic function.

## AN.0 — imported Dirichlet-series infrastructure

Arithmetic functions, their convolution, LSeries, elementary Euler products, Abel summation and Mellin transforms are library inputs. Ideal-indexed coefficients, norm regrouping and the exact Perron convention come from the base roadmap's Layers0,1,2,3,6. A power-series or LSeries value outside its convergence range is not its analytic continuation.

The acceptance boundary is exact: termwise differentiation, interchanging an infinite sum and an integral, and passing from finite to infinite Euler products require the supplier's convergence theorem. The arithmetic Perron interface must distinguish the finite-height kernel at1, arctan(T/c)/π, from its limiting value1/2. This layer is closed by ownership removal, not by asserting that every supplier target is already proved.

## AN.1 — imported zeta and Dirichlet functional equations

The Riemann completed functional equation is supplied by completedRiemannZeta_one_sub. For primitive Dirichlet characters, DirichletCharacter.IsPrimitive.completedLFunction_one_sub retains the inverse character, conductor power and root number. The inherited even/odd theta calculations are a provenance route to those existing declarations, not additional blueprint nodes.

A consumer must preserve parity and character inversion. The trivial conductor-one character is a separate case; an imprimitive character contributes missing finite Euler factors. Nonvanishing on Re(s)≥1 is already available for zeta, but the library value at s=1 is a totalized value: it does not remove the analytic pole. The quantitative width to the left of that line is new AN.2 work.

## AN.2 — quantitative zero-free regions and prime number theorems

### Classical high-height zero-free region

Identifier: AnalyticNumberTheory:AN.2/classical-zero-free-region.

There exist real c>0 and t₀>1 such that ζ(s)≠0 whenever Im(s)≥t₀ and Re(s)≥1−c/log(Im(s)). This is the high positive-height conclusion of Kedlaya's proof, not a full-height effective region or a conductor-uniform Dirichlet region.

Hypotheses: The constants c,t₀ are absolute existence constants, not certified numerical values.

Proof obligations:

1. Use the nonnegative trigonometric polynomial 3+4 cos θ+cos 2θ with the absolutely convergent logarithmic derivative for Re(s)>1.
2. The simple pole at 1 bounds the real-axis term by 1/(σ−1)+O(1). The corrected Hadamard/Gamma identity bounds the σ+2it term by O(log t). Keeping a zero β+it bounds the σ+it term by O(log t)−1/(σ−β).
3. Combine to obtain 4/(σ−β)≤3/(σ−1)+C log t. Choose σ=1+A/log t with A sufficiently small relative to C to derive β<1−c/log t for t≥t₀.
4. Hadamard factorization, logarithmic differentiation, Gamma estimates, zero summability and effective choices are unresolved named inputs, not hidden routine steps; see the gaps.

Acceptance:

- t₀>1 avoids division by log 1.
- This node alone does not control negative or bounded heights.
- No RH or Siegel-effectivity assumption is inserted.

Dependencies: mathlib:riemannZeta; mathlib:riemannZeta_ne_zero_of_one_le_re.

Source: kedlaya-ant-2025, Theorem8.8 and (8.3.1)–(8.3.6), printed pp.50–51; prerequisites §8.2 pp.48–49. Retains the inherited ID with its review's high-height qualification; corrects the Gamma argument in the proof and records missing analytic lemmas.

The rational and fixed-progressions PNT targets require a separately supplied continuous boundary remainder before applying ADS Layer9 or Layer10. A residue limit from the real right side is not complex meromorphic continuation; a functional equation alone is not boundary nonvanishing. The progression form assumes a coprime residue class and states whether the modulus is fixed, bounded by a logarithmic power, or variable in a quantitative range.

Exceptional zeros are indexed by the chosen numerical zero-free constant. Existence, uniqueness, simplicity, repulsion and effective lower distance from1 are different declarations. A Siegel-type existence constant cannot silently become an effective constant. The explicit numerical inputs routed from Bennett–Siksek are recorded individually below; none follows merely from this layer's title.

## AN.3 — explicit formulas, zero counting and density

### Truncated von Mangoldt formula

Identifier: AnalyticNumberTheory:AN.3/von-mangoldt-explicit-formula-and-pnt-error.

For x≥2 and T≥2, let ψ₀(x)=∑_{1≤n<x}Λ(n)+(1/2)∑_{1≤n=x}Λ(n), and let d(x)>0 be the distance to the nearest prime power other than x. There is an absolute C such that ψ₀(x)−x=−∑_{ρ:0≤Reρ≤1, |Imρ|<T}x^ρ/ρ−ζ′(0)/ζ(0)−(1/2)log(1−x⁻²)+R(x,T), with zeros counted with analytic multiplicity and |R(x,T)|≤C[x log²(xT)/T+(log x)min(1,x/(T d(x)))]. Powers of positive x use exp(ρ log x). The PNT-error corollary formerly bundled under this ID is a separate remaining target.

Hypotheses: x≥2; T≥2; zeros counted with multiplicity; symmetric strict height cutoff; half-weight at a prime-power endpoint.

Proof obligations:

1. Import arithmetic Perron with its half-weight endpoint convention from ADS Layer6, not a newly defined Perron kernel.
2. Apply it to the von Mangoldt Dirichlet series for −ζ′/ζ; shift the contour and account for the pole at 1, nontrivial zeros, the value at 0 and trivial zeros.
3. Sum the trivial-zero residues to −(1/2)log(1−x⁻²). Bound horizontal and remaining vertical pieces, including the nearest-prime-power term.
4. A local zero count chooses a good nearby height; control the finitely many crossed zeros to return to the requested T and strict endpoint convention. These contour, multiplicity, zero-count and uniform-error lemmas still require decomposition from Chapter9.

Acceptance:

- At a prime power m, ψ₀(m)=Chebyshev.psi(m)−Λ(m)/2; at x=2 the value is (log2)/2, not log2.
- Multiplicity cannot be replaced by a set of distinct zeros.
- At a zero height T, a strict cutoff must agree with the height-adjustment error, not silently switch to ≤.

Dependencies: mathlib:riemannZeta; mathlib:Chebyshev.psi; tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation.

Source: kedlaya-ant-2025, Definition7.1/Theorem7.2, printed pp.43–44; Theorem9.9 final assembly, pp.56–58. Restores the half-weight convention and restricts to T≥2. Final assembly was freshly read; its prerequisite lemmas and exercises remain a decomposition gap.

The notation ψ₀ does not define a second arithmetic-function carrier: it spells out the strict finite sum plus half of the endpoint coefficient. Its compatibility obligation with Chebyshev.psi is indispensable. At x=2 it is log2/2. At a nonintegral x it agrees with the inclusive count; at an integer that is not a prime power the correction is zero.

The source's high-height zero-free region is insufficient by itself for the exponential PNT remainder. Separate all zeros with small ordinate, prove that this finite set has real parts bounded by β₀<1, use conjugation for negative heights, and only then estimate the remaining reciprocal ordinates. The positive sum is Σ1/|γ|, not the cancelling signed sum Σ1/γ. At a truncation height equal to an ordinate, use compatible strict/inclusive conventions or a left limit.

For short-interval formulas, subtract the endpoint formulas before taking absolute values. In particular the kernel ( (2x)^ρ−x^ρ )/ρ is regular as ρ tends to0; replacing it by two separate bounds involving1/|ρ| destroys the needed low-zero uniformity. BS item139 explicitly requires this safeguard. Zero-density and mean-value statements keep the character family, height, modulus, weights and exceptional terms visible. The SV.2 arrow points into AN.3; it is not a proof of the large sieve from an analytic estimate that already uses it.

## AN.4 — arithmetic comparisons and Artin boundary theory

### Hecke series and Tate integral comparison

Identifier: AnalyticNumberTheory:AN.4/hecke-L-function-euler-product-comparison.

Let K be a number field, c a unitary idele-class character unramified outside a finite set S containing every archimedean place, and χ its ideal-character presentation from GlobalNumberFields Layer9. Choose Tate's admissible factorizable f with f_v=1_{O_v} for v∉S. For Re(s)>1, Z(f,c|·|^s)=(∏_{v∈S}Z_v(f_v,c_v|·|_v^s))(∏_{v∉S}N(d_v)^(−1/2))L_S(s,χ), where L_S(s,χ)=∑_{a integral, prime to S}χ(a)N(a)^(−s)=∏_{v∉S}(1−χ(v)N(v)^(−s))⁻¹. d_v is the local different; its product is finite because d_v is a unit at almost all places. Haar and Fourier normalizations are Tate's, not silently normalized unit volumes.

Hypotheses: K a number field; c unitary and trivial on K×; S finite containing infinity and all ramification of c; f admissible in Tate's Z1–Z3 class with the stated local factors; Re(s)>1.

Proof obligations:

1. Import the canonical Hecke character and its local/ideal dictionary from GlobalNumberFields Layer9.
2. At v∉S, compute the local integral as the convergent geometric series N(d_v)^(−1/2)∑_{j≥0}χ(v)^j N(v)^(−js).
3. Import the AL.1 global zeta-integral factorization, with the AL.0 measures and Fourier convention, and multiply the local formulas.
4. Use ADS Layer3 to identify the ideal Euler product with the absolutely convergent ideal series. Exact norm regrouping and admissibility hypotheses are required imports, not new carriers here.
5. The completed functional equation is now AN.4/hecke-primitive-functional-equation, stated as an identity of meromorphic functions from AL.1/hecke-l-functional-equation; no local factor is cancelled at its zeros.

Acceptance:

- For K=ℚ and trivial c, the unramified arithmetic series is ζ with exactly the S Euler factors removed.
- Ramified different factors N(d_v)^(−1/2) are retained.
- The character is an imported idele-class character, not an arbitrary list of local factors.

Dependencies: AutomorphicLFunctionsAndLocalFactors:AL.0; AutomorphicLFunctionsAndLocalFactors:AL.1/global-zeta-integral; AutomorphicLFunctionsAndLocalFactors:AL.1/completed-hecke-l-function; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters; tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products.

Source: tate-thesis-1950, §4.5, thesis p.(4.23), scan p.57; comparison and continuation discussion scan pp.58–59. Fresh page-image verification of the displayed Euler comparison. Character construction and full admissibility proofs remain imported, with exact unread boundaries recorded.

### Artin continuation near the line one

Identifier: AnalyticNumberTheory:AN.4/artin-induction-versus-artin-holomorphy.

Let K/ℚ be finite Galois and ρ a finite-dimensional complex representation of Gal(K/ℚ). The incomplete Artin L-function, with precisely the ramified rational primes omitted, has a meromorphic continuation to an open neighbourhood of {Re(s)≥1}; it is holomorphic and nonzero on Re(s)=1 away from s=1, and its pole order at 1 is dim(V^G). This statement asserts neither global Artin holomorphy nor Chebotarev density.

Hypotheses: Finite Galois K/ℚ; finite-dimensional complex representation; arithmetic Frobenius at unramified primes; omitted-prime set fixed.

Proof obligations:

1. Import arithmetic Frobenius and conjugacy independence from NumberFieldArithmetic Layer2. AN.4 must supply determinant Euler factors and direct-sum/induction identities.
2. Import finite-group Artin rational induction; after clearing denominators express an m-fold representation as a virtual sum of induced one-dimensional characters.
3. Use ClassFieldTheory Layer11 and GlobalNumberFields Layer9 to identify one-dimensional factors with finite-order Hecke characters; their continuation is AN.4/hecke-primitive-functional-equation and their boundary nonvanishing, with the pole at 1 of the trivial character, is AN.4/hecke-nonvanishing-on-line-one.
4. On small discs about points of the line, take the m-th root agreeing with the Euler product on Re s > 1 and glue (AN.4/mth-root-gluing).
5. Separate the trivial summand to compute the pole order. Brauer integral induction can prove global meromorphy, whereas absence of extra poles is Artin holomorphy; the rational-root route here does not prove the global assertion.

Acceptance:

- For the trivial representation recover ζ times the omitted local factors and a simple pole at1.
- For a nontrivial one-dimensional character recover the Hecke near-line result.
- At ramified primes the complete local factor would act on inertia invariants; an arbitrary Frobenius lift on the whole representation is invalid.
- No natural-density conclusion is included; that theorem belongs to Chebotarev.

Dependencies: AN.4/hecke-nonvanishing-on-line-one; AN.4/mth-root-gluing; AN.4/dedekind-zeta-continuation-and-residue; tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-2-frobenius-elements-and-the-artin-symbol; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity; tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters; tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction.

Source: kedlaya-ant-2025, Chapter22, §§22.2–22.5, Theorems22.3–22.4, printed pp.128–129. Retains the inherited ID only for the near-line analytic theorem, with rational induction, root-gluing and Hecke boundary inputs explicitly open. The defective Lemma22.1 is not used.

The analytic carrier imported from Tate is stronger than an unspecified Schwartz–Bruhat function. Its Z1–Z3 contract asks that both f and its Fourier transform are continuous and integrable; that both lattice sums converge uniformly in the translate and on compact idele sets; and that their weighted idele integrals converge for every real exponent σ>1. Importing only Schwartz–Bruhat cases would lose the full inherited admissible-class statement.

AL.0 owns Fourier transforms, Poisson summation and parameter-integral justifications; AL.1 owns the local/global zeta integral, its analytic continuation, local factors and functional equations. The trivial-character residue constants are −κf(0) and +κ Fourier(f)(0), with κ=2^r₁(2π)^r₂hR/(w√|d|) for Tate's measures. The arithmetic comparison checks these conventions, rather than selecting independent measures on each side.

The canonical Hecke character belongs to GlobalNumberFields Layer9, with local components and the unitary decomposition. Arbitrary complex norm twists are not unitary. Arithmetic Frobenius belongs to NumberFieldArithmetic Layer2 and is defined by its action on a residue field at a selected prime, not by an existential equation for one nonzero residue. At ramification only its coset modulo inertia is canonical. Consequently the complete local Artin factor is a determinant on inertia invariants.

RepresentationTheory/InductionRestriction Layer6 owns the virtual-character ring and Artin/Brauer induction. The rational induction statement can be used for the near-line root argument only after root selection and gluing are proved. It does not license taking a global meromorphic root. Integral Brauer induction supplies a separate global-meromorphy route; Artin holomorphy concerns the stronger absence of unwanted poles. The Chebotarev natural-density theorem remains with its own owner, and cannot be obtained from a Dirichlet-density calculation by changing the density's name.

### Checkpoint (cc-39fac3, 29 September 2026): Hecke and Dedekind interfaces on top of AL.1

AL.1 now plans Tate's local and global theory (#3918). AN.4 imports it and adds six nodes.

**`dedekind-zeta-continuation-and-residue`** (theorem, planet "Analytic class number formula").
- *Statement:* Mathlib's `NumberField.dedekindZeta K` continues meromorphically to ℂ. Its only pole is a simple pole at s = 1, with residue κ = 2^{r₁}(2π)^{r₂}hR/(w√|d_K|), which equals Mathlib's `NumberField.dedekindZeta_residue K`. The completed Λ_K(s) = |d_K|^{s/2}Γ_ℝ(s)^{r₁}Γ_ℂ(s)^{r₂}ζ_K(s) satisfies Λ_K(1 − s) = Λ_K(s), so ζ_K(−2) = 0.
- *Proof:* Tate's standard function gives ζ(f, |·|^s) = |d_K|^{−1/2}Γ_ℝ(s)^{r₁}((2π)^{1−s}Γ(s))^{r₂}ζ_K(s). Main Theorem 4.4.1 gives the residue κf̂(0), with f̂(0) = |d_K|^{−1/2}.
- *Tests:* ℚ gives `completedRiemannZeta` with residue 1; ℚ(i) gives κ = π/4 = L(1, χ₋₄). The residue agrees with Mathlib's one-sided limit `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`.

**`hecke-primitive-functional-equation`** (theorem, planet "Functional equation of Hecke L-functions").
- *Statement:* for a primitive finite-order χ, Λ(s, χ) = ε(s, ω)Λ(1 − s, χ̄) as meromorphic functions, with ε(s, ω) = ε(1/2, ω)(|d_K|N𝔣)^{1/2−s}.
- Imprimitive L-functions differ from primitive ones by finitely many entire Euler polynomials, which are multiplied in, never divided out.

**`landau-nonnegative-logarithm`** (lemma; Kedlaya Lemma 3.6).
- *Statement:* if f is meromorphic near Re s ≥ L with at worst a simple pole at L, and log f has nonnegative Dirichlet coefficients, then f ≠ 0 on Re s ≥ L.
- *Proof:* Kedlaya leaves it as Exercise 3.6.1. The plan uses 3 + 4cos θ + cos 2θ = 2(1 + cos θ)² ≥ 0 and the positivity f(σ) ≥ 1 on the real axis.

**`ray-class-product-nonvanishing`** (lemma).
- ∏_χ L(s, χ) over the ray class group has log with nonnegative coefficients, by orthogonality, so it is nonzero on Re s ≥ 1. This is Kedlaya Theorem 3.7 for K = ℚ.

**`hecke-nonvanishing-on-line-one`** (theorem, planet).
- *Statement:* L(s, χ) ≠ 0 on Re s = 1, s ≠ 1, and L(1, χ) ≠ 0 for χ ≠ 1.
- *Proof:* s ≠ 1 comes from the product. At s = 1 there are two cases (Kedlaya Theorems 3.10 and 3.11). For non-real χ, both χ and χ̄ would vanish. For real χ, ψ(s) = L(s, χ)ζ_K(s)/ζ_K(2s) = ∏_{χ(𝔭)=1}(1 + N𝔭^{−s})/(1 − N𝔭^{−s}) has nonnegative coefficients.
- *Test:* K = ℚ is Mathlib's `DirichletCharacter.LFunction_ne_zero_of_one_le_re`.

**`mth-root-gluing`** (lemma).
- On discs centred on the line, the unique m-th root of a zero-free g that agrees with f on the connected half-disc exists, and these roots agree on overlaps. This is the step Kedlaya's Theorem 22.4 proof uses.

Two items are removed from AN.4's remaining list, "Hecke comparison construction and completed functional equation" and "Hecke nonvanishing and local root gluing". The Artin node now depends on these nodes.

## AN.5 — multiplicative functions and the divisor bound

The reusable target is uniformity in n with a retained constant. Fix ε>0 and an integer B≥exp(1/ε), and write D=max(1,(ε log2)⁻¹). Then

τ(n) ≤ D^B n^ε  for every n>0.

This expression is deliberately coarse. Small prime factors cost one D each, independent of their exponents; prime factors above the cutoff cost none. Counting small primes by B avoids needing a prime-counting estimate to prove the divisor estimate. Nothing in the argument requires squarefreeness or a coprimality condition.

For an effectively presented positive ε, a certified upper bound for exp(1/ε) and a certified positive lower bound for log2 give a computable upper constant. There is no claim that an arbitrary abstract real input supports an exact executable ceiling algorithm. The mathematical existence statement and its effective numerical specialization are distinguished.

### Uniform prime-power divisor bound

Identifier: AnalyticNumberTheory:AN.5/prime-power-log-bound.

For ε>0, integers p≥2 and a≥0, put D=max(1,(ε log 2)⁻¹). Then a+1≤D p^(aε). D is notation for a real expression, not a new carrier.

Hypotheses: ε>0; p,a natural; p≥2

Proof obligations:

1. Logarithm monotonicity gives log p≥log 2>0. Thus D≥1 and D ε log p≥1.
2. Multiply the latter inequality by a≥0 and add 1≤D to obtain a+1≤D(1+aε log p).
3. Use 1+t≤exp t and p^(aε)=exp(aε log p).

Acceptance:

- a=0 gives 1≤D.
- p=2 is included.
- Without D, ε=1/2,p=2,a=1 would assert 2≤√2, which is false.

Dependencies: mathlib:Real.log_pos; mathlib:Real.log_le_log; mathlib:Real.add_one_le_exp; mathlib:Real.rpow_def_of_pos.

Source: tao-divisor-2008, Second proof, exponential estimate and small/large-prime split. Worker refinement of the proof architecture using the cited pinned prime-factorization and real exponential APIs.

### Large-prime divisor factor bound

Identifier: AnalyticNumberTheory:AN.5/large-prime-power-bound.

For ε>0, positive integer p and a≥0, exp(1/ε)≤p implies a+1≤p^(aε).

Hypotheses: ε>0; p>0; a natural; exp(1/ε)≤p

Proof obligations:

1. Apply the exponential/logarithm equivalence to get ε log p≥1.
2. Multiply by a, add 1 and apply 1+t≤exp t; identify the real power.

Acceptance:

- a=0 is equality.
- The cutoff is non-strict.
- Primality is unnecessary for this local inequality.

Dependencies: mathlib:Real.le_log_iff_exp_le; mathlib:Real.add_one_le_exp; mathlib:Real.rpow_def_of_pos.

Source: tao-divisor-2008, Second proof, exponential estimate and small/large-prime split. Worker refinement of the proof architecture using the cited pinned prime-factorization and real exponential APIs.

### Divisor bounds from local factors

Identifier: AnalyticNumberTheory:AN.5/divisor-bound-from-local-bounds.

Let ε∈ℝ, D≥1 and B∈ℕ. Suppose for every prime p and a∈ℕ that a+1≤D p^(aε) if p≤B, and a+1≤p^(aε) if p>B. For every n>0, τ(n)≤D^B n^ε, with τ(n)=card(n.divisors).

Hypotheses: D≥1; B natural; two uniform prime-power hypotheses; n>0

Proof obligations:

1. Use Nat.card_divisors to write τ(n)=∏p|n(a_p+1); use Nat.prod_primeFactors_pow_factorization to write n=∏p|n p^a_p.
2. Split the finite prime-factor set at p≤B. Multiply the respective nonnegative local bounds using Finset.prod_le_prod.
3. Repeated Real.mul_rpow and Real.rpow_mul identify the prime-power product with n^ε. At most B small prime divisors occur, since they inject into {1,…,B}.
4. Hence τ(n)≤D^r n^ε with r≤B; D≥1 gives D^r≤D^B.

Acceptance:

- n=1 has an empty product and τ(1)=1.
- Repeated prime powers incur one D per small prime, not one per exponent.
- ε need not be positive once the two local hypotheses are supplied.

Dependencies: mathlib:Nat.card_divisors; mathlib:Nat.prod_primeFactors_pow_factorization; mathlib:Nat.prime_of_mem_primeFactors; mathlib:Finset.prod_le_prod; mathlib:Real.mul_rpow; mathlib:Real.rpow_mul; mathlib:Real.rpow_natCast.

Source: tao-divisor-2008, Second proof, exponential estimate and small/large-prime split. Worker refinement of the proof architecture using the cited pinned prime-factorization and real exponential APIs.

### Explicit divisor subpower bound

Identifier: AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound.

For ε>0 and any natural B≥exp(1/ε), all positive integers n satisfy τ(n)≤max(1,(ε log 2)⁻¹)^B n^ε. Thus the displayed constant is at least 1 and independent of n.

Hypotheses: ε>0; B natural with exp(1/ε)≤B; n>0

Proof obligations:

1. Set D=max(1,(ε log 2)⁻¹). Apply the local uniform bound to each prime p≤B.
2. For p>B, the assumed cutoff implies exp(1/ε)≤p; apply the large-prime bound.
3. Apply divisor-bound-from-local-bounds. A certified upper integer B is a permitted input: no exact ceiling evaluation is required.

Acceptance:

- n=1 is covered.
- B may be increased without invalidating the estimate.
- The constant depends only on ε and the chosen certified B, never on n.

Dependencies: AnalyticNumberTheory:AN.5/prime-power-log-bound; AnalyticNumberTheory:AN.5/large-prime-power-bound; AnalyticNumberTheory:AN.5/divisor-bound-from-local-bounds.

Source: tao-divisor-2008, Second proof, exponential estimate and small/large-prime split. Worker refinement of the proof architecture using the cited pinned prime-factorization and real exponential APIs.

### Uniform divisor subpower bound

Identifier: AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound.

For every ε>0 there exists a real C≥1 such that τ(n)≤C n^ε for every positive integer n. One choice is C=max(1,(ε log 2)⁻¹)^B for any natural B≥exp(1/ε).

Hypotheses: ε>0

Proof obligations:

1. Choose B by the Archimedean theorem exists_nat_ge applied to exp(1/ε).
2. Take the explicit constant and use D≥1 to verify C≥1; invoke explicit-divisor-subpower-bound for every n>0.
3. For an effectively presented positive ε, certified bounds for exponential and logarithm produce an effective upper constant. For an arbitrary abstract real ε, this is a mathematical existence assertion, not a uniform executable real-number algorithm.

Acceptance:

- ε=1/(64c), c>0, supplies the exact ES.0 request for every M>0.
- C is retained at small inputs; setting C=1 for all n fails at n=2, ε=1/2.
- No squarefreeness, primitivity or coprimality hypothesis appears.

Dependencies: AnalyticNumberTheory:AN.5/explicit-divisor-subpower-bound; mathlib:exists_nat_ge.

Source: tao-divisor-2008, Second proof, exponential estimate and small/large-prime split. Worker refinement of the proof architecture using the cited pinned prime-factorization and real exponential APIs.

### Absorption of the divisor-bound constant

Identifier: AnalyticNumberTheory:AN.5/absorb-divisor-bound-constant.

For n>0 and ε,δ,C∈ℝ, if τ(n)≤C n^ε and C≤n^(δ−ε), then τ(n)≤n^δ.

Hypotheses: n>0; the two displayed inequalities

Proof obligations:

1. Multiply C≤n^(δ−ε) by n^ε≥0 and compose with the first inequality.
2. Apply Real.rpow_add at positive n and simplify (δ−ε)+ε=δ.

Acceptance:

- Equality in the threshold is allowed.
- δ>ε is not required by this pointwise implication.
- The threshold is not silently discarded.

Dependencies: mathlib:Real.rpow_add; mathlib:Real.rpow_nonneg.

Source: tao-divisor-2008, Second proof, exponential estimate and small/large-prime split. Worker refinement of the proof architecture using the cited pinned prime-factorization and real exponential APIs.

### Eventual unit-constant divisor bound

Identifier: AnalyticNumberTheory:AN.5/eventual-divisor-subpower-bound.

For each δ>0 there exists a natural N≥1 such that every natural n≥N satisfies τ(n)≤n^δ. If C≥1 is the uniform constant at ε=δ/2, any natural N≥max(1,C^(2/δ)) suffices.

Hypotheses: δ>0

Proof obligations:

1. Use uniform-divisor-subpower-bound with ε=δ/2.
2. Choose natural N≥max(1,C^(2/δ)) using exists_nat_ge.
3. For n≥N, monotonicity of positive real powers and Real.rpow_mul give C≤n^(δ/2). Apply absorb-divisor-bound-constant.

Acceptance:

- N≥1 excludes the library's totalized zero input.
- Replacing δ by 2ε gives the equivalent eventual form used in extraction item96.
- The result makes no universal claim at n=2.

Dependencies: AnalyticNumberTheory:AN.5/uniform-divisor-subpower-bound; AnalyticNumberTheory:AN.5/absorb-divisor-bound-constant; mathlib:exists_nat_ge; mathlib:Real.rpow_le_rpow; mathlib:Real.rpow_mul.

Source: tao-divisor-2008, Second proof, exponential estimate and small/large-prime split. Worker refinement of the proof architecture using the cited pinned prime-factorization and real exponential APIs.

### Interface and regression examples

All declarations in this chain use existing real inequalities and Nat.divisors; no new definition needs a competing API. The proposed names in the suggested file are prime_power_log_bound, large_prime_power_bound, divisor_bound_from_local_bounds, explicit_divisor_subpower_bound, uniform_divisor_subpower_bound, absorb_divisor_bound_constant and eventual_divisor_subpower_bound.

The twelve suggested examples check the zero convention, τ(1), τ(12), τ(64), exponent zero, equality at the large-prime cutoff, failure of the unit constant at n=2 and ε=1/2, inclusion of n=1 in the uniform theorem, the exact ε=1/(64c) specialization for c>0, the eventual theorem, positivity of D^B, and equality in the absorption threshold. These are theorem acceptance and compatibility examples, not tests for a newly introduced definition.

For the exponential-sums consumer, first obtain C≥1 uniformly for all M>0 at ε=1/(64c). The application then imposes its own size condition, such as 8C≤k^(17/64). The supplier does not erase C by replacing a uniform statement with an eventual one. The known false universal bound in Bennett–Siksek fails at n=120; its corrected reusable input is exactly this uniform theorem.

AN.5 also includes Halász-type mean values, pretentious distances and their comparisons, smooth numbers, divisor asymptotics, moments and value distributions, and Beurling systems with explicit axioms. These remain required source/declaration work. Probabilistic or random-matrix predictions are stated as conjectural models, not theorems about ordinary primes. A source for one subpower estimate does not cover those larger targets.

## AN.6 — no process declarations

The consumer register is represented by the actual dependencies of AN.2–AN.5 and by SV.3/SV.4. Conditional estimates expose their RH/GRH or other analytic hypothesis directly. There is no new proposition whose only meaning is that a collection of downstream estimates is available. Closure of this removed layer is a structural fact.

## AN.7 — general Lerch parameters

Mathlib's HurwitzZeta.hurwitzZeta and HurwitzZeta.expZeta take a real-circle parameter. They provide substantial special cases, not the general complex-parameter Lerch family. In the common convergent region, writing z=exp(2πia),

expZeta(a,s) = z Φ(z,s,1).

The factor z is forced by changing from the index n≥1 to n≥0. It cannot be omitted when matching the exponential-zeta API. The z=1 degeneration, the Hurwitz pole at s=1, excluded complex a values, chosen logarithmic branches and boundary values need independent statements. The general branch/cut domain, joint continuation and parameter differentiation require their complete primary-source treatment and a reusable API; no new general-family definition is supplied in this checkpoint.

## Routed Bennett–Siksek input register

The following exact source requirements supplement the campaign. Item96 is supplied by the seven-node chain; every other row is required remaining work. Reading an accepted extraction locates the input but does not count as reading its external proof.

### PAPER-BENNETT-SIKSEK-20/40 — Exceptional real zero

Fix the effective absolute c_star>0 furnished by Proposition 7.1. For a nontrivial primitive quadratic character chi of conductor N, an exceptional zero is a real zero beta of L(s,chi) with 1-c_star/log(N)<beta<1. Its conductor is called exceptional.

Locator: Section 7, Proposition 7.1 and following paragraph, pp. 373-374. Required remaining source target; original proof not claimed decomposed.

### PAPER-BENNETT-SIKSEK-20/41 — Repulsion of exceptional conductors

With c_star from Proposition 7.1, two distinct exceptional quadratic conductors N1<N2 satisfy N2>N1^2.

Locator: Proposition 7.1 and equation (25), pp. 373-374. Required remaining source target; original proof not claimed decomposed.

### PAPER-BENNETT-SIKSEK-20/43 — Largest prime factor of a quadratic conductor

If N>1 is the conductor of a primitive quadratic character, then P(N)>0.94*log(N).

Locator: Lemma 7.3, p. 375. Required remaining source target; original proof not claimed decomposed.

### PAPER-BENNETT-SIKSEK-20/65 — Schoenfeld explicit Chebyshev bound

For x>0, theta(x)=sum_{p prime,p<=x}log p < 1.000081*x.

Locator: Equation (10), p. 362; Schoenfeld 1976, concluding note p. 360. Required remaining source target; original proof not claimed decomposed.

### PAPER-BENNETT-SIKSEK-20/74 — Chebyshev sums used by the argument

psi(X)=sum_{1<=m<=X}Lambda(m), theta(X)=sum_{p<=X}log p; theta(X;a,h) restricts the latter prime sum to p=a modulo h, with gcd(a,h)=1.

Locator: §§6–9, especially p. 369. Required remaining source target; original proof not claimed decomposed.

### PAPER-BENNETT-SIKSEK-20/78 — Mod-eight prime mass

With epsilon=0.002811, for a=3 or 5 and k>=2*10^10, theta(k;a,8)-theta(k/2;a,8)>=(1-3*epsilon)*k/8.

Locator: §6, pp. 369,372, Ramaré–Rumely input. Required remaining source target; original proof not claimed decomposed.

### PAPER-BENNETT-SIKSEK-20/79 — Prime powers do not erase the character-sum margin

For k>=2*10^10, the prime-power mass psi(k)-theta(k)-psi(k/2)+theta(k/2) is smaller than (((1-3*0.002811)/8)-0.1239)*k. Thus an absolute prime-weighted sum >=(1-3*epsilon)k/8 implies an absolute Lambda-weighted sum >0.1239*k.

Locator: §6 end of Case I, pp. 369–370; Schoenfeld Theorem 6*, (5.3*)–(5.4*). Required remaining source target; original proof not claimed decomposed.

### PAPER-BENNETT-SIKSEK-20/87 — Two-real-zero inequality

There is an effective absolute c_star>0 such that if distinct real primitive quadratic characters of conductors N1,N2>1 have real zeros beta1,beta2, then min(beta1,beta2)<1-3*c_star/log(N1*N2).

Locator: Proposition 7.1(i), (23), p. 373. Required remaining source target; original proof not claimed decomposed.

### PAPER-BENNETT-SIKSEK-20/88 — Uniqueness and simplicity of an exceptional zero

For that same c_star, a primitive nonprincipal quadratic character of conductor N has at most one real zero in (1-c_star/log N,1), and any such zero is simple.

Locator: Proposition 7.1(ii), (24), pp. 373–374. Required remaining source target; original proof not claimed decomposed.

### PAPER-BENNETT-SIKSEK-20/89 — Effective character prime-number estimate

For a primitive nonprincipal character chi of conductor N>1 and X sufficiently large, sum_{m<=X}chi(m)*Lambda(m)=-X^beta/beta+O(X*exp(-c*log X/(sqrt(log X)+log N))*(log N)^4), with the beta term only when an exceptional zero exists; c>0 and the implied constant are absolute and effective.

Locator: Theorem 5, (26), p. 374; Iwaniec–Kowalski Theorem 5.27. Required remaining source target; original proof not claimed decomposed.

### PAPER-BENNETT-SIKSEK-20/96 — Effective divisor subpower bound

For every epsilon>0 there is an effectively computable C_epsilon such that tau(n)<=C_epsilon*n^epsilon for all positive integers n; equivalently tau(n)<=n^(2epsilon) for all sufficiently large n.

Locator: §8, p. 378 and §12, p. 388 (corrected usable input). Covered by the seven AN.5 nodes; explicit uniform constant and eventual threshold are separated.

### PAPER-BENNETT-SIKSEK-20/102 — Rosser–Schoenfeld explicit prime-count bounds

For x>=59, (x/log x)*(1+1/(2 log x))<pi(x)<(x/log x)*(1+3/(2 log x)).

Locator: §9 proof, p. 382; Rosser–Schoenfeld Theorem 1. Required remaining source target; original proof not claimed decomposed.

### PAPER-BENNETT-SIKSEK-20/103 — Explicit reciprocal-prime estimate

There is the prime Mertens constant B=0.26149... such that for x>=286, |sum_{p<=x}1/p-log log x-B|<1/(2*(log x)^2).

Locator: §9 proof, p. 382; Rosser–Schoenfeld Theorem 5. Required remaining source target; original proof not claimed decomposed.

### PAPER-BENNETT-SIKSEK-20/116 — Bounded-height Landau–Page theorem

There is an effective absolute c>0 such that among primitive Dirichlet characters of moduli q<=T, T>=2, there is at most one zero rho=beta+i*t with |t|<=T and beta>1-c/log T. Any exception is a simple real zero of a real character.

Locator: §12 opening, p. 386; Bombieri §5 p.39; Iwaniec–Kowalski Theorem 5.26. Required remaining source target; original proof not claimed decomposed.

### PAPER-BENNETT-SIKSEK-20/117 — Selberg zero-density input

For epsilon>0, Q>=2, T>=2, and 1/2<=sigma<=1, sum_{q<=Q} sum_{chi primitive mod q} N(sigma,T,chi) <<_epsilon (Q^(5+epsilon)*T^(3+epsilon))^(1-sigma), with effective constants; if the source count omits the possible exceptional zero, add 1 to the right-hand side.

Locator: §12 proof of Proposition 12.1, p. 386; Bombieri §5 remark after Theorem 14, p.40. Required remaining source target; original proof not claimed decomposed.

### PAPER-BENNETT-SIKSEK-20/118 — Quadratic real-zero separation from one

For q>=3 and a quadratic Dirichlet character modulo q, a real zero beta>0 satisfies beta<=1-40/(sqrt(q)*(log q)^2).

Locator: §12 p.387; Bennett–Martin–O'Bryant–Rechnitzer Proposition 1.11. Required remaining source target; original proof not claimed decomposed.

### PAPER-BENNETT-SIKSEK-20/139 — Half-interval explicit formula and low-zero-safe bound

For primitive nonprincipal chi of conductor q, sufficiently large integer k and 2<=T<=k, a truncated explicit formula on (k/2,k] has zero contributions -(k^rho-(k/2)^rho)/rho for nontrivial zeros |Im rho|<=T, with error O(k*log^2(qk)/T+log^2(qk)). Moreover |(k^rho-(k/2)^rho)/rho|<=C*k^Re(rho)*min(1,1/|rho|) for 0<Re(rho)<1. The local zero-count bound gives sum_{|Im rho|<=T}min(1,1/|rho|)<<log^2(q(T+2)).

Locator: §12 proof of Proposition 12.2, p.387; explicit repaired interface. Required remaining source target; original proof not claimed decomposed.

### PAPER-BENNETT-SIKSEK-20/142 — Weighted-prime sum input to the factorial estimate

For x>=319, with the same absolute constant E at both endpoints, log x+E-1/(2 log x)<sum_{p<=x}(log p)/p<log x+E+1/(2 log x). Therefore for x>=y>=319 the prime sum over y<p<=x is greater than log(x/y)-1/(2 log x)-1/(2 log y).

Locator: §9 p.384; Rosser–Schoenfeld Theorem 6, p.70. Required remaining source target; original proof not claimed decomposed.

### PAPER-BENNETT-SIKSEK-20/151 — Explicit prime Euler-product bound

For real x>=10^8, product_{p prime,p<=x}(1+1/p)<=2*log x.

Locator: §5 proof of Lemma 5.1, p.365; alternate direct input from Rosser–Schoenfeld Theorem 8 (3.29), p.70. Required remaining source target; original proof not claimed decomposed.

## Cross-roadmap contracts

- tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-6-abel-and-perron-summation: Truncated arithmetic Perron for the actual von Mangoldt LSeries, with uniform error, off-endpoint and half-weight endpoint forms; finite-height kernel value at1 is arctan(T/c)/π, not1/2.
- tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters: Canonical HeckeCharacter and unitaryPart, local components, finite conductor, finite-order/ray-class dictionary, and ideal-character coefficients with the exact arithmetic normalization used by Tate §4.5.
- AutomorphicLFunctionsAndLocalFactors:AL.0: Fourier and Haar conventions for local/adelic functions, Poisson summation and parameter integrals. Supply an extension from Schwartz–Bruhat functions to Tate's full Z1–Z3 admissible class: uniform lattice sums over all translates and compact idele sets, both f and Fourier f, and idele weighted integrability for every σ>1.
- AutomorphicLFunctionsAndLocalFactors:AL.1: Local and global Tate zeta integrals on the imported admissible class, Euler factorization with different and measure factors, meromorphic continuation, local gamma factors and global functional equation retaining the trivial-character residues. This does not by itself assert nonvanishing on Re(s)=1.
- tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products: Ideal Euler-product/series identity under absolute convergence on Re(s)>1, including finite bad-prime omission and norm regrouping. General higher-dimensional Artin factors must not be put into the degree-one completely multiplicative ideal-weight carrier.
- tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-2-frobenius-elements-and-the-artin-symbol: Arithmetic Frobenius at a chosen nonzero prime, conjugacy independence across primes above an unramified base prime and uniqueness modulo inertia at ramified primes; for K/ℚ the residue action is x↦x^p on O_K/P.
- tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity: Global reciprocity identification of one-dimensional finite Galois characters with ray-class characters, compatible with the existing ideal Artin map and arithmetic-Frobenius normalization; no second reciprocity carrier.
- tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction: Artin rational induction for finite-dimensional complex representations of a finite group, explicitly clearing denominators into a virtual sum of characters induced from cyclic subgroups. Global meromorphy uses the distinct Brauer integral-induction interface and its linear-character reduction, not unproved global roots.

These are requests for exact supplier interfaces, not claims of implementation. Canonical upstream stage IDs are retained in the packet's upstreamPrerequisites, explicit links and requests; the checker currently parses their prefix as if they were library declaration names. The supplemental endpoint check verifies the seven affected edges against the atlas. This serialization limitation does not remove the mathematical dependencies.

## Source reading and corrections

### Terence Tao: The divisor bound

[Author post, 23 September 2008, updated 24 September](https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/). SHA-256 1a26cc2a78746463092d440c0a1e119bd8d4c3e223f805dd000ae8a76830b2f9.

- Entire main post: both small/large-prime proofs and applications. The explicit constant D^B below is the worker's refinement, not a quoted constant.

### Kiran S. Kedlaya: Notes on analytic number theory

[Author PreTeXt PDF, last modified 21 December 2025, 154 PDF pages](https://kskedlaya.org/papers/ant-ptx.pdf). SHA-256 7a934fce8272cedd36ad609f79bbe79af0056320bb1e0bc690c87af990f305be.

- Fresh: §§7.1–7.3, printed pp.43–45; §8.2 pp.48–49; §8.3 pp.50–51; Chapter 22 pp.127–130.
- Page images additionally checked for printed pp.45,50,127; author HTML parallel §§7.2,8.2,8.3,22.1 checked on 27 September for existing corrections.
- Chapters 5–6 and §8.1/exercises remain inherited-review provenance; Chapter 9 proof not freshly decomposed.
- Fresh additionally: Lemma9.8 and Theorem9.9 final assembly, printed pp.56–58, and Chapter10 pp.59–63. Chapter10 proof references and prerequisite exercises are not decomposed.

### John Tate: Fourier analysis in number fields and Hecke's zeta-functions

[1950 thesis, 60-page Rutgers-hosted scan](https://sites.math.rutgers.edu/~alexk/2023S572/Tate1950.pdf). SHA-256 0c40f263e8ab7924d1f0a8c7e40d81d464aec6620b8ec14101f21f7b07e6f0c8.

- Fresh page-image read: scan pp.57–59, thesis pp.(4.23)–(4.25).
- Scan pp.53–56 inspected as unreliable OCR only; their detailed character/admissibility construction remains inherited-review provenance, not a fresh complete reading.
- Inherited local/global analytic records retain reviewed locators; complete rereading and decomposition belongs to AL.0/AL.1.

### Michael A. Bennett and Samir Siksek: A conjecture of Erdős, supersingular primes and short character sums

[Annals of Mathematics 191 (2020), no.2, published article](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p02-s.pdf). SHA-256 3920a7524a37870942fe3591ac858db23cb604f4331bccd2a6dc5f11a1671fbf.

- Published §8 divisor-bound use and accepted extraction item96/erratumE2 inherited from the immediately preceding ES.0 task.
- All 19 AN-routed extraction statements and accepted routing review read; their cited original external proofs have not all been read.

The following source issues are recorded for independent checking. Corrections are version-scoped; the presence of a finding is not an independent-review verdict.

- AnalyticNumberTheory/E1, Published §8.1 p.378 and its reuse on p.379; known source issue E2.: Use the uniform explicit bound and eventual threshold supplied by the AN.5 chain; retain the constant for all positive n. At q=120, τ(q)=16 while the printed power is about14.89222. The local-to-global construction supplies a valid replacement.
- AnalyticNumberTheory/E2, Equation(8.3.3), printed p.50, PDF p.66: The displayed term must be Γ′(1+s/2)/Γ(1+s/2). Equivalently retain Γ′(s/2)/Γ(s/2) together with the missing 1/s term. Logarithmically differentiate ξ(s)=(1/2)s(s−1)π^(−s/2)Γ(s/2)ζ(s); the 1/s term is absorbed by (1/2)ψΓ(1+s/2), since ψΓ(z+1)=ψΓ(z)+1/z. The (s+1)/2 argument cannot perform that absorption.
- AnalyticNumberTheory/E3, Lemma22.1, printed p.127, PDF p.143: Require a chosen prime P above p and the action of g on every element of O_K/P to be x↦x^p; use NFA2's IsArithFrobAt and then its conjugacy theorem. The source only requires a nonzero solution in O_K/pO_K. The element1 works for every g. In any nontrivial quadratic extension all g then qualify, but its two singleton conjugacy classes cannot form one class. The condition cannot characterize arithmetic Frobenius.
- AnalyticNumberTheory/E4, Equations(7.2.1)–(7.2.2), printed pp.44–45, and proof of Theorem7.7: Use 1/|γ| in the nonnegative majorant and Stieltjes sum. Choose T away from zero ordinates, or use matching left limits at T. Isolate a finite low-height range and justify a positive lower cutoff. The source sums over both signs of γ. A conjugate pair contributes zero to 1/γ but positively to the claimed Stieltjes expression. A strict sum |γ|<T also cannot equal the expression with inclusive N(T) when T is a zero ordinate.
- AnalyticNumberTheory/E5, Theorems7.5/8.8 and use in Theorem7.7, printed pp.45,50–51: Retain only Im(s)≥t₀>1 as the direct conclusion; establish bounded heights and conjugation separately before deriving the global PNT error. The formula has log1 in its denominator, and the proof's O(log t) estimate/constant choice is a high-height argument. The inherited independent review already required a finite low-height contribution.
- AnalyticNumberTheory/E6, Theorem8.7 proof following(8.2.3), printed p.49: The expansion is 1−(z/ρ)²/2+O((z/ρ)³). Also the middle range in the three-factor partition is h₂, not a second h₁. Multiplying (1−w)(1+w+w²/2+O(w³)) gives 1−w²/2+O(w³). Absolute convergence uses only the quadratic order, so the sign does not alter the intended convergence argument.
- AnalyticNumberTheory/E7, End of Theorem8.7 proof, printed p.49: Choose a global holomorphic logarithm of the zero-free entire quotient, then derive a modulus bound for g from its real-part upper bound using Borel–Carathéodory on nested discs (or an equivalent named lemma). Order≤1 gives an upper bound for Re(g)=log|f/h|, not directly the asserted bound for |g|. The missing real-part-to-modulus step is needed before the Liouville argument.
- AnalyticNumberTheory/E8, Theorem10.2 parity convention, printed p.59: For the displayed −(1−a)log x and ∑x^(a−2m)/(2m−a), use a=0 for even and a=1 for odd primitive characters. State the primitive restriction; imprimitive local-factor zeros need separate terms. The subsequent §10.2 gamma factor uses a=0 for even and1 for odd. Even primitive nonprincipal L-functions have a zero at0 and trivial zeros at negative even integers, fixing both displayed terms.
- AnalyticNumberTheory/E9, Theorem10.11, printed p.63, omitted progression hypothesis: Require gcd(a,N)=1, x sufficiently large, and state an explicit logarithmic modulus range N≤(log x)^B with fixed B in the standard Siegel–Walfisz formulation. With a=N=2, only the prime2 is counted, while li(x)/φ(2) has size x/log x; for A>1 the displayed remainder cannot absorb it.
- AnalyticNumberTheory/E10, Theorem10.11 following Siegel's theorem, printed p.63: The usual Siegel–Walfisz proof from the stated Siegel theorem has potentially ineffective constants. An effective version needs an additional explicit input or an exceptional-zero term and a revised contract. No effective lower bound for the Siegel constant is supplied. It is invalid to export an effective constant merely from the preceding existence theorem; AN.2 must distinguish these interfaces.
- AnalyticNumberTheory/E11, Theorem9.9 proof, printed pp.57–58: The odd positive integer U tends to infinity. The near-endpoint remainder range on p.58 is 3x/4<n<x′, not3/4<n<x′. The contour's left edge is Re(s)=−U, and T log U/(U x^U) tends to0 as U tends to infinity; the substitution n=x′−m with m<x/4 requires the corrected range.
- AnalyticNumberTheory/E12, Remark10.8 zero-repulsion inequalities, printed p.62: Use σ−Re(ρ) when the evaluation point has the same imaginary part as the zero. The principal-character pole occurs at s=1, not at χ=1. At s=σ+i Im(ρ), s−ρ=σ−Re(ρ); using the imaginary part cannot measure horizontal separation from the zero.
- AnalyticNumberTheory/E13, Theorem10.6 denominator, printed p.61: Assume N>1 for this primitive Dirichlet-character formulation; treat the unique conductor-one character through the zeta statement. The quantifier includes the primitive character of level1, but its denominator log N is zero. The zeta pole and small-height conventions require a separate specialization.

## Exact continuation obligations

### AN.2 analytic proof decomposition

Decompose the Hadamard product/logarithmic derivative, gamma bounds, zero summability, pole estimate, trigonometric logarithmic-derivative inequality and constant selection into lemmas. Audit Mathlib's complex-analysis infrastructure first. §8.4 exercises and bounded/negative heights remain unclosed.

### AN.3 contour and zero-multiplicity interfaces

Supply the finite multiset of zeros with analytic multiplicity, local zero count, good-height adjustment, truncated Perron, contour shifting, derivative bounds, and endpoint-nearest-prime-power estimate. Fresh Theorem9.9 assembly and Lemma9.8 read; Lemmas9.2/9.4/9.5/9.6 and exercise proofs not decomposed.

### Separated PNT-error corollary

Restore the formerly bundled O(x exp(−c√log x)) conclusion as its own declaration after proving conjugation, a finite low-height contribution O(x^β0) with β0<1, a positive lower cutoff for ordinates, Σ1/|γ|=O(log²T), endpoint conversion and optimization. It is not a hidden conclusion of the retained explicit-formula node.

### Hecke comparison construction and completed functional equation

Read Tate scan53–56 from images; decompose ideal-character presentation, S-unit input, special local functions and Z1–Z3 verification, with AL.0/1 and GlobalNumberFields owners. Split the old functional equation into its own meromorphic identity with justified local-factor cancellation; no pointwise division across zeros.

### Artin arithmetic Euler factors and induction adapter

Plan the single Artin Euler-product carrier and full API/tests, convergence, determinant identities under direct sum and induction, and ramified inertia-invariant factors. Reuse NFA2 arithmetic Frobenius, RepresentationTheory/InductionRestriction6 virtual induction and CFT11 reciprocity. No arbitrary Frobenius lift acts canonically on the full ramified representation.

### Hecke nonvanishing and local root gluing

AL.1 continuation does not supply nonvanishing on Re(s)=1. Build AN.4's finite-order Hecke boundary theorem, trivial pole and compatible local m-th roots with gluing. Global meromorphy via Brauer induction and Artin holomorphy must be separated; no Artin conjecture is assumed.

### Remaining AN.2 source inputs

Decompose rational/fixed-AP PNT instances through ADS9/10 boundary contracts, quantitative conductor-uniform regions, exceptional-zero simplicity/repulsion, effective versus ineffective bounds, and all routed BS items40,41,65,74,78,79,87,88,89,102,103,116,118,142,151. Exact constants and numerical ranges require the original cited sources and certified arithmetic.

### Remaining AN.3 source inputs

Decompose zero counting, explicit-formula variants, zero density, basic mean values and the SV.2 large-sieve import. BS117 needs its effective Selberg-density parameters and exceptional contribution; BS139 needs subtraction on (x,2x] before absolute values and the low-zero-safe min(1,1/|ρ|) kernel. BV belongs to SV.3.

### Remaining AN.5 targets

The seven-node divisor chain covers item96 only. Halász mean values, pretentious distance and comparison, distribution and moments, Beurling systems, divisor asymptotics and smooth-number estimates need their full sources and API. BS43 requires N>1, largest-prime-factor bound P(N)>0.94 log N and certified small-conductor cases, including N=24.

### General Lerch family and branches

AN.7 imports Mathlib's real-circle Hurwitz/expZeta results. General complex parameters, branch/cut domains, joint continuation, monodromy, differentiation and boundary values are unplanned. In the shared convergence domain expZeta(a,s)=zΦ(z,s,1), z=exp(2πia); the missing factor z in the old audit is not inherited.

### Three omitted analytic signatures

The suggested file omits the explicit-formula and Hecke/Artin nodes until the actual zero-multiplicity, admissible integral, canonical character and Artin series interfaces are available. No proposition-valued stand-in encodes their missing hypotheses. The document and packet remain definitive.

### Full source coverage outside the selected chain

This is a checkpoint, not complete coverage. All campaign references, the external proofs behind the 19 BS items, and the supplier interface proofs must be read to declaration granularity. Inherited review acceptance is provenance, not a new verdict; bounded source-reading ledgers distinguish fresh reads from inherited locators.

### Upstream-stage prerequisite encoding

The pinned checker classifies any tauceti: prefix as a baseline declaration before checking atlas stages. Canonical upstream stage IDs are therefore preserved in each node's upstreamPrerequisites, the requests and explicit links, not misrepresented as implemented declarations. A separate check verifies all these endpoints against the atlas. Normalize this encoding when the checker supports upstream stages; this packet remains partial.

The proof plan for the seven AN.5 declarations ends at the pinned library. The remaining layers do not: the gaps and requests above are substantive. In particular signature elaboration neither supplies the analytic zero-multiplicity carrier nor proves the proposed estimates. The definitive mathematical statements are those in this document and its paired packet; the suggested file is a naming and typing aid.

