# Roadmap: additive combinatorics, higher Fourier analysis and primes

**Summary.** This roadmap builds the quantitative theory of additive structure and its application
to patterns in the primes. It starts from Mathlib's additive characters and their orthogonality,
the discrete Fourier transform on `ZMod N`, sumsets, additive energy, the Plünnecke–Ruzsa and
Ruzsa covering inequalities, Freiman homomorphisms, Szemerédi's regularity lemma and Roth's
theorem, and from Tau Ceti's Haar probability measure on a compact group. Layer AC.0 fixes one
normalised Fourier transform on an arbitrary finite abelian group, indexed by its character group,
with convolution, Parseval and the Fourier form of additive energy. Layer AC.1 develops additive
structure in two independent strands: Shannon entropy, the entropic Ruzsa distance and the proof of
Marton's conjecture in characteristic two (Gowers–Green–Manners–Tao); and the Fourier–Bohr route
to Freiman's theorem (large spectra, Bohr sets, Bogolyubov's lemma, generalised arithmetic
progressions, Balog–Szemerédi–Gowers, Ruzsa modelling, properisation). Layer AC.3 constructs the
Gowers uniformity norms on finite abelian groups, on intervals and on integer boxes, filtered
nilmanifolds with rational Mal'cev coordinates, polynomial sequences and nilsequences, and states
the quantitative inverse theorem of Leng–Sah–Sawhney, Leng's efficient equidistribution theorem and
the Green–Tao factorisation of polynomial orbits. Layer AC.2 uses these to prove Szemerédi's theorem
with the Leng–Sah–Sawhney bound, its infinitary and Varnavides forms, Rahman's explicit Roth
threshold, and the removal lemma for an ordered product equation in a finite group. Layer AC.4
proves that the primes contain arbitrarily long arithmetic progressions, along the linear-forms
transference of Conlon–Fox–Zhao with a smooth sieve majorant, and keeps the original Green–Tao
route with its pseudorandom measures as a separate comparison. Layer AC.5 proves Möbius
orthogonality to nilsequences, the Green–Tao theorem on finite-complexity linear equations in
primes, and Kai's theorems on linear patterns of prime elements in a fractional ideal of a number
field and in its localisations.

The end theorems are the characteristic-two Marton theorem `pfr`, Freiman's theorem in torsion-free
groups and in groups of bounded exponent, the quantitative Szemerédi theorem
`quantitative_szemeredi`, the Green–Tao theorem `prime_progressions`, Möbius–nilsequence
orthogonality `mobius_nilsequence_orthogonality`, the linear-equations theorem
`linear_equations_in_primes` and Kai's theorems `number_field_prime_patterns` and
`localized_prime_patterns`.

Every normalisation is pinned: the group carries probability counting measure and its dual carries
counting measure; Gowers cubes conjugate by vertex parity; interval and box norms are ratios against
the indicator of the same domain; nilsequence degree, nilpotency step, dimension, rational height and
Lipschitz bound are separate parameters; every prime-pattern theorem states its complexity
hypothesis and its local factors.

| Layer | Title | Headline targets |
| --- | --- | --- |
| AC.0 | Fourier analysis on finite abelian groups | `fourier`, `nconv`, `fourier_parseval`, `fourier_nconv`, `fourier_energy`, `addEnergy_le_card_sq_mul_card` |
| AC.1 | Additive structure: entropy, Marton's conjecture, Bohr sets and Freiman's theorem | `entropy`, `rdist`, `rdist_triangle`, `entropic_pfr`, `pfr`, `largeSpectrum`, `bohrSet`, `phaseBohrSet`, `bohrSet_largeSpectrum_subset_double_sub_double`, `GeneralizedAP`, `balog_szemeredi_gowers`, `freiman_torsion_free`, `freiman_bounded_exponent` |
| AC.3 | Gowers norms, nilsequences and the inverse theorem | `gowersNorm`, `gowers_cauchy_schwarz`, `intervalGowersNorm`, `DegreeFiltration`, `IsFilteredPolynomial`, `FilteredNilmanifold`, `RationalMalcevBasis`, `BoundedNilsequence`, `quasipolynomial_inverse`, `box_inverse`, `efficient_equidistribution`, `quantitative_orbit_factorization` |
| AC.2 | Progressions in dense sets and removal | `cyclicProgressionAverage`, `dense_generalised_von_neumann`, `NilsequenceFactor`, `progression_density_increment`, `quantitative_szemeredi`, `upperNaturalDensity`, `szemeredi_varnavides_bridge`, `rahman_roth_threshold`, `layered_cycle_removal`, `ordered_product_removal` |
| AC.4 | Transference and arithmetic progressions in the primes | `IsKPseudorandom`, `original_relative_szemeredi`, `APLinearFormsCondition`, `arithmeticDiscrepancy`, `arithmetic_dense_model`, `relative_progression_counting`, `linear_forms_relative_szemeredi`, `smoothMajorant`, `smoothMajorant_linear_forms`, `majorantNu`, `prime_progressions` |
| AC.5 | Möbius orthogonality and linear patterns in primes | `power_sum_density`, `mobius_nilsequence_orthogonality`, `AffineSystem`, `HasCSComplexity`, `integerLocalFactor`, `HasModuleCSComplexity`, `module_generalised_von_neumann`, `numberFieldLocalFactor`, `number_field_prime_patterns`, `localized_prime_patterns`, `linear_equations_in_primes` |

The layers are listed in build order: AC.3 comes before AC.2 because the density-increment proof of
Szemerédi's theorem runs through the Gowers inverse theorem.

## Scope and ownership

**Owned here.**

- The probability-normalised Fourier transform on an arbitrary finite abelian group, indexed by the
  character group `AddChar G ℂ` itself with no chosen isomorphism `G ≃ Ĝ`, together with its
  normalised convolution, Parseval, the convolution identity, the Fourier form of additive energy,
  the elementary `L¹` and fourth-moment bounds for indicators, and the trivial upper bound for
  additive energy. Mathlib's `ZMod.dft` is the cyclic special case and is compared with it, never
  replaced.
- Shannon entropy of finitely valued random variables, conditional entropy, mutual information and
  conditional mutual information, the entropic Ruzsa distance and its conditional form, and the
  whole Gowers–Green–Manners–Tao argument for Marton's conjecture in characteristic two.
- Large spectra, chord-radius and phase-radius Bohr sets with regularity, Bogolyubov's lemma in
  spectral form, generalised arithmetic progressions with properness, the Balog–Szemerédi–Gowers
  theorem, Ruzsa's modelling lemma, progressions in cyclic Bohr sets, properisation, and Freiman's
  theorem for torsion-free groups and for groups of bounded exponent.
- Complex Gowers cubes and uniformity norms on finite abelian groups, on integer intervals and on
  integer boxes; degree filtrations, filtered polynomial sequences and their Taylor expansion;
  filtered nilmanifolds, rational adapted Mal'cev bases and the Mal'cev metric; bounded
  nilsequences, horizontal and vertical characters, smoothness norms, equidistribution and total
  equidistribution, smooth and rational factors; the quantitative interval and box inverse theorems,
  efficient equidistribution, and the factorisation of polynomial orbits. This roadmap is the owner
  of the nilmanifold carrier for every roadmap that uses nilmanifolds: the boundary fibrations of
  ArithmeticLocallySymmetricSpaces Layer ALS.2 import it.
- Progression averages, the dense generalised von Neumann inequality, nilsequence factors and
  regular resolutions, the density-increment proof of Szemerédi's theorem, upper natural density,
  the infinitary and Varnavides forms, Rahman's explicit Roth threshold, the cycle removal lemma
  for layered graphs and the removal lemma for an ordered product equation in a finite group.
- Pseudorandom measures in Green–Tao's sense and in Conlon–Fox–Zhao's linear-forms sense, cut
  discrepancy, the dense model theorem, relative counting, both relative Szemerédi theorems, the
  smooth and the sharp W-tricked prime majorants and their moment estimates, and the Green–Tao
  theorem.
- Schmidt's simultaneous polynomial recurrence with the quantitative Weyl and coefficient lemmas,
  the quasi-polynomial Bogolyubov lemma in cyclic groups, the smooth and sharp truncated divisor sums,
  the maximal order of the divisor function, the Type I/II dichotomy for `μ`, and Kai's fractional-ideal element
  weights, Cramér and Siegel models, Siegel-zero dichotomy, Mitsui prime number theorem and ideal
  Vaughan decomposition: no other roadmap states them in the form used here.
- The power-sum density lemma, Möbius orthogonality on equidistributed orbits and to all
  nilsequences, integer affine systems and their Cauchy–Schwarz complexity, integer local factors,
  vector-valued complexity and torsion cokernels, the vector-valued generalised von Neumann theorem,
  Gowers uniformity of quadratic Hecke characters and of number-field prime models, number-field and
  localised local factors, and the three linear-pattern theorems.

**Not owned here, consumed by name.**

- From Mathlib: additive characters `AddChar` and the character basis `AddChar.complexBasis` with
  orthogonality, `ZMod.dft`, `RCLike.wInner` and `RCLike.cWeight`, `Finset.expect`, discrete
  convolution `DiscreteConvolution.addRingConvolution` and the representation count
  `Finset.addConvolution`, additive energy `Finset.addEnergy` with its lower bounds, Plünnecke–Ruzsa
  (`Finset.pluennecke_ruzsa_inequality_nsmul_sub_nsmul_add` and its relatives), Ruzsa's triangle
  inequality and covering lemma (`Finset.ruzsa_covering_add`), Freiman homomorphisms
  (`IsAddFreimanHom`, `IsAddFreimanIso`), `Real.negMulLog` and its concavity, probability measures,
  independence and conditioning, Szemerédi's regularity lemma `szemeredi_regularity`, Roth's theorem
  `roth_3ap_theorem_nat` and `rothNumberNat_isLittleO_id`, Behrend's bound
  `Behrend.roth_lower_bound`, `Finpartition`, Lie groups (`LieGroup`), left-invariant
  derivations, nilpotent groups, simply connected spaces, the Möbius and von Mangoldt functions,
  `Nat.totient`, `primorial`, the behaviour of `riemannZeta` near `1`, affine maps, spans and
  kernels, rings of integers, fractional ideals and `Ideal.absNorm`.
- From Tau Ceti: the Haar probability measure `TauCeti.haarProb` on a compact group, against which
  the transform is the degree-one case of the Peter–Weyl coefficients; and the fixed-modulus prime
  number theorem in `TauCeti/NumberTheory/Chebotarev/PrimeCounting/PrimesCongruent.lean` of the current library,
  through the declaration and elementary rational-prime conversion specified below.
- From TauCetiRoadmap: Lie groups, the exponential map, closed subgroups and the
  Baker–Campbell–Hausdorff formula from **RepresentationTheory/LieGroups** (Layers 0, 2, 3 and 5), and
  the rectangle-discrepancy estimate for uniform pairs from **Regularity** (Layer 4). The special
  Fourier analyses of **AlgebraicCodingTheory** (Layer 3, weight enumerators and MacWilliams) and
  **ModularForms** (Layer 0, characters of modular forms with nebentypus) stay with their owners.
- From the current Tau Ceti library: the ideal von Mangoldt function
  `TauCeti.IdealArithmeticFunction.vonMangoldt`, its prime-power evaluation and its logarithmic
  norm bound, and `TauCeti.GlobalNumberFields.HeckeCharacter.idealCharacter`. AC.5.8 adds the
  element pullback and sieve models, not a second ideal arithmetic function or ideal-character
  construction.
- The finite Brun coefficients and dimension-controlled fundamental sieve estimate belong to
  **SieveMethodsAndPrimePatterns**, §1.2 (`SieveBrun.brun_fundamental_estimate`). AC.5.8 needs their
  ideal-indexed adaptation, with a norm cutoff and an ideal remainder sum; it does not own a second
  finite Brun theorem.
- From the roadmaps named in the supplier contracts below: Minkowski's second theorem
  (GeometryOfNumbersAndQuadraticArithmetic Layer 1.5), the Siegel–Walfisz theorem, the zeta
  zero-free region and the small-modulus Möbius progression bound (AnalyticNumberTheoryPartI §§0.32,
  0.33 and 1.2), the Weil bound for multiplicative character sums (FiniteFieldsAndCharacterSums
  Layer FF.2), and the Waring asymptotics (ExponentialSumsAndCircleMethod Layers 4–5).

**Boundaries.** No target here identifies a finite abelian group with its dual. The finite-field
inverse theorems for Gowers norms are not used, and no inverse theorem over a finite field is
transferred to cyclic groups. Ultralimit proofs are not used: the inverse theorem is the finite
quantitative one. No statement about prime patterns covers a system with two proportional linear
forms: twin primes and Goldbach's problem are outside the roadmap. The Bombieri–Vinogradov theorem
is not used. The general Lie correspondence is not built here; only its specialisation to
connected, simply connected nilpotent groups (AC.3.10) is. General graph removal lemmas are not
built here; only the cycle removal lemma for layered graphs that the ordered-product removal
lemma consumes (AC.2.11) is, on top of TauCetiRoadmap's Regularity, which ends at counting.

## Conventions

- **Finite abelian groups.** `G` is a finite additive commutative group, `N = |G| ≥ 1`, and
  `Ĝ = AddChar G ℂ`. Averages over `G` use Mathlib's `Finset.expect` (`𝔼 x, f x`), that is the
  probability counting measure; sums over `Ĝ` are unnormalised. The transform is
  `f̂(χ) = 𝔼_x f(x) · conj(χ(x))` and the normalised convolution is
  `(f ∗ g)(x) = 𝔼_y f(y) g(x − y)`. A point mass has every Fourier coefficient of modulus `1/N`,
  and the convolution unit is `N · δ₀`. Additive energy `E(A, B)` is Mathlib's unnormalised count of
  quadruples `(a₁, a₂, b₁, b₂) ∈ A × A × B × B` with `a₁ + b₁ = a₂ + b₂`.
- **Entropy.** Logarithms are natural. Random variables are measurable maps from probability
  spaces to finite types with measurable singletons (the discrete measurable space); conditioning
  on an event of probability zero contributes zero weight. `H[X]`, `H[X | Y]`, `I[X : Y]`,
  `I[X : Y | Z]` and `d[X ; Y]` follow Gowers–Green–Manners–Tao, with a colon for mutual
  information and a semicolon for the distance.
- **Bohr sets.** The chord Bohr set `B_ch(Λ, δ)` uses the strict condition `|χ(x) − 1| < δ`; the
  phase Bohr set `B(Γ, ε)` uses `|arg χ(x)| / 2π < ε_χ` with `arg ∈ (−π, π]`. For a common
  `0 < ε ≤ 1/2` the phase set equals the chord set of radius `2 sin(πε)`. An empty family imposes no
  condition at any radius; a nonempty family at radius `≤ 0` gives the empty set. Regularity uses
  non-strict volume inequalities.
- **Gowers norms.** Cubes conjugate the function at a vertex `ω ∈ {0,1}^d` exactly when `|ω|` is
  odd. A mixed cube need not be real or nonnegative; the diagonal cube is. `U¹(f) = |𝔼 f|` is a
  seminorm; `U^d` is a norm for `d ≥ 2`. `[N] = {1, …, N}`; boxes are `[−N, N]^ℓ`. Interval and box
  norms are ratios against the norm of the indicator of the same domain, computed after zero
  extension into a cyclic group large enough that no cube relation wraps. The empty interval has
  norm `0`.
- **Nilsequences.** A nilmanifold `G/Γ` is the space of left cosets `gΓ` of a discrete cocompact
  subgroup `Γ` of a connected, simply connected nilpotent real Lie group `G`; `Γ` need not be normal.
  Coordinates are second-kind exponential coordinates `g = exp(t₁X₁)⋯exp(t_mX_m)` in an adapted
  Mal'cev basis. Degree (of the filtration), step (of `G`), dimension `m`, rational height `Q` of the
  basis and Lipschitz bound of the observable are separate parameters. Polynomial sequences are
  defined by iterated derivatives `∂_h g(n) = g(n + h) g(n)⁻¹`; Taylor coefficients multiply in
  increasing degree with integer binomial exponents. `log` in quantitative bounds is
  `log* x = max(log x, e^e)`, as in Leng–Sah–Sawhney.
- **Progressions.** A `k`-term progression is nonconstant when its common difference is a positive
  integer. The interval progression average over `[N]` has denominator `(N + 1)²` and includes
  `r = 0`; the cyclic average includes wraparound and `r = 0`.
- **Primes.** `Λ` is Mathlib's von Mangoldt function, extended by zero to nonpositive integers.
  `W = ∏_{p ≤ w} p` is `primorial w`. Divisors of a nonzero integer are the positive divisors of its
  absolute value. Asymptotic conditions on families `ν_N` are along prime `N`, with explicit
  `ε`–`N₀` quantifiers uniform in all offsets.
- **Number fields.** `K` has degree `n`; `𝔞` is a nonzero fractional ideal with a ℤ-basis compatible
  with norm and length in Kai's sense; `Λ_K^𝔞(x) = Λ_K(x𝔞⁻¹)`; main terms divide by
  `(res_{s=1} ζ_K(s))^t`. `S` is a finite set of nonzero prime ideals.

## Exact supplier contracts

### From Mathlib (pinned)

| Declaration | Module | What is used |
| --- | --- | --- |
| `AddChar`, `AddChar.complexBasis` | `Mathlib/Algebra/Group/AddChar.lean`, `Mathlib/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean` | the character group and the basis of `G → ℂ` by characters, with orthogonality for the normalised measure |
| `AddChar.zmodAddEquiv`, `ZMod.stdAddChar`, `ZMod.dft` | `PontryaginDuality.lean`, `Mathlib/Analysis/Fourier/ZMod.lean` | the explicit isomorphism `ZMod N ≃+ AddChar (ZMod N) ℂ` and the cyclic transform the comparison runs through |
| `RCLike.wInner`, `RCLike.cWeight` | `Mathlib/Analysis/RCLike/Inner.lean` | the weighted inner product, conjugate-linear in its first argument, and the constant weight `1/N` |
| `Finset.expect` | `Mathlib/Algebra/BigOperators/Expect.lean` | finite averages |
| `DiscreteConvolution.addRingConvolution`, `Finset.addConvolution` | `Mathlib/Topology/Algebra/InfiniteSum/DiscreteConvolution.lean`, `Mathlib/Combinatorics/Additive/Convolution.lean` | unnormalised convolution and the representation count `#{(a, b) ∈ A × B : a + b = x}` |
| `Finset.addEnergy`, `Finset.addEnergy_eq_card_filter`, `Finset.addEnergy_eq_sum_sq`, `Finset.le_addEnergy`, `Finset.le_card_add_mul_addEnergy`, `Finset.addEnergy_univ_left` | `Mathlib/Combinatorics/Additive/Energy.lean` | additive energy with its lower bounds; the pinned file has no upper bound, which AC.0.9 supplies |
| `Finset.pluennecke_ruzsa_inequality_nsmul_sub_nsmul_add`, `Finset.pluennecke_ruzsa_inequality_nsmul_add`, `Finset.ruzsa_triangle_inequality_sub_sub_sub`, `Finset.ruzsa_covering_add` | `Mathlib/Combinatorics/Additive/PluenneckeRuzsa.lean`, `RuzsaCovering.lean` | the additive forms of Plünnecke–Ruzsa, Ruzsa's triangle inequality and Ruzsa's covering lemma |
| `IsAddFreimanHom`, `IsAddFreimanIso` | `Mathlib/Combinatorics/Additive/FreimanHom.lean` | Freiman homomorphisms and isomorphisms of a given order between finite sets |
| `Real.negMulLog`, `Real.concaveOn_negMulLog` | `Mathlib/Analysis/SpecialFunctions/Log/NegMulLog.lean` | the summand `−x log x` of entropy and its concavity |
| `MeasureTheory.Measure.map`, `MeasureTheory.Measure.prod`, `ProbabilityTheory.cond`, `ProbabilityTheory.IndepFun`, `ProbabilityTheory.uniformOn` | `Mathlib/MeasureTheory`, `Mathlib/Probability` | laws, products, conditioning, independence, uniform laws |
| `szemeredi_regularity`, `Finpartition` | `Mathlib/Combinatorics/SimpleGraph/Regularity/Lemma.lean`, `Mathlib/Order/Partition/Finpartition.lean` | the regularity lemma and finite partitions |
| `roth_3ap_theorem_nat`, `rothNumberNat_isLittleO_id`, `ThreeAPFree`, `Behrend.roth_lower_bound` | `Mathlib/Combinatorics/Additive/Corner/Roth.lean`, `AP/Three/Defs.lean`, `AP/Three/Behrend.lean` | qualitative Roth and Behrend's lower bound; the case `k = 3` of Szemerédi's theorem is imported from here |
| `LieGroup`, `LeftInvariantDerivation`, `SimplyConnectedSpace`, `Group.IsNilpotent` | `Mathlib/Geometry/Manifold`, `Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean`, `Mathlib/GroupTheory/Nilpotent.lean` | the carriers of AC.3 |
| `ArithmeticFunction.moebius`, `ArithmeticFunction.vonMangoldt`, `Nat.totient`, `primorial` | `Mathlib/NumberTheory/ArithmeticFunction`, `Mathlib/Data/Nat/Totient.lean`, `Mathlib/NumberTheory/Primorial.lean` | `μ`, `Λ`, `φ`, `W` |
| `isBigO_riemannZeta_sub_one_div` | `Mathlib/NumberTheory/Harmonic/ZetaAsymp.lean` | `ζ(s) − 1/(s − 1)` is bounded near `1`, the only zeta input of the smooth route |
| `AffineMap`, `Submodule.span`, `LinearMap.ker` | `Mathlib/LinearAlgebra` | affine systems and their complexity |
| `NumberField.RingOfIntegers`, `NumberField.basisOfFractionalIdeal`, `Ideal.absNorm` | `Mathlib/NumberTheory/NumberField`, `Mathlib/RingTheory/Ideal/Norm` | the arithmetic carriers of the number-field targets |

### From Tau Ceti (pinned)

- `TauCeti.haarProb` (`TauCeti/RepresentationTheory/Compact/Haar.lean`): the Haar probability
  measure on a compact group. On a finite group with the discrete topology it is normalised counting
  measure; `fourier_eq_haarIntegral` (AC.0.1) records that the transform is the integral of
  `f · conj χ` against it.

### From the current Tau Ceti library

- `TauCeti.IdealArithmeticFunction.vonMangoldt`, `vonMangoldt_apply_prime_pow`,
  `vonMangoldt_one`, `vonMangoldt_im`, `vonMangoldt_re_nonneg` and `norm_vonMangoldt_le_log`, in
  `TauCeti/NumberTheory/ArithmeticDirichletSeries/VonMangoldt.lean`: the complex ideal weight is real
  and nonnegative, is `log N(𝔭)` at a positive prime power, vanishes at the unit ideal and is bounded
  by `log N(𝔠)`. Write `Λ_K` for its real part, extended by zero at the zero ideal.
- `TauCeti.GlobalNumberFields.HeckeCharacter.idealCharacter`, in
  `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Ideal.lean`, with
  `idealCharacter_apply_toIdealsAway` and `idealCharacter_apply_prime`: the character on fractional
  ideals prime to its finite conductor, evaluated using the prime-uniformizer convention. The
  Siegel character has values in `{−1,1}`, so inversion does not change these values.

These declarations are used from the current library, not imported at the older Lean pin.

- `NumberField.Chebotarev.primeCount_primesCongruent_isEquivalent_logIntegral`, in
  `TauCeti/NumberTheory/Chebotarev/PrimeCounting/PrimesCongruent.lean`: for `m ≥ 1` and a unit
  residue `a : ZMod m`, the number of prime ideals of `O_ℚ` of norm congruent to `a` is asymptotic
  to `Li(x)/φ(m)`. Identify those prime ideals with rational primes and apply partial summation
  to obtain `θ(x; a,m) ∼ x/φ(m)`. AC.4.15 consumes this only for each fixed `m = W`, `a = 1`;
  the conversion and partial summation are elementary steps of that target, not a new PNT.
  This declaration is in Tau Ceti `a91d3aaf`, later than the pinned `f790474`; it is not imported
  into `Suggested.lean`. No error of size `O(x (log x)^{−A})` is inferred from this asymptotic.

### From TauCetiRoadmap roadmaps

- **RepresentationTheory/LieGroups**, Layer 0 (the exponential map and one-parameter subgroups),
  Layer 2 (the closed-subgroup theorem), Layer 3 (the Lie functor and the Baker–Campbell–Hausdorff
  formula) and Layer 5 (simply connected covers). AC.3.10 specialises these to connected, simply
  connected nilpotent groups, where the exponential map is a global diffeomorphism and the
  Baker–Campbell–Hausdorff series is a finite polynomial with rational coefficients.
- **Regularity**, Layer 4: the rectangle-discrepancy bound for a `τ`-uniform pair against
  `[0, 1]`-valued tests, from the proof of `StrongRegular.inducedGraphCount3_estimate`. AC.2.11 uses it
  for the counting step of the layered cycle removal lemma. Regularity ends at counting and leaves
  removal lemmas to their consumers.

### From other roadmaps

These atlas roadmaps own what this one consumes; each item is the exact statement used, at the
place where the supplier states it.

- **GeometryOfNumbersAndQuadraticArithmetic**, Layer 1.5 (TauCetiRoadmap pull request #851),
  `minkowski_second_upper`: for a discrete full lattice `L` in a `d`-dimensional real inner-product
  space and a centrally symmetric convex body `K` with `0` in its interior,
  `(∏_{i < d} λ_i(L, K)) · vol(K) ≤ 2^d covol(L)`. Consumed by AC.1.28, AC.1.29 and AC.3.16.
- **AnalyticNumberTheoryPartI** (the package of AnalyticNumberTheory):
  - §0.32 `siegel_walfisz`: for every `A, B > 0`, uniformly in `q ≤ (log x)^B` and `(a, q) = 1`,
    `π(x; a, q) = Li(x)/φ(q) + O_{A,B}(x (log x)^{−A})`, with possibly ineffective constants; the `θ`
    form follows by removing prime powers (Mathlib `Chebyshev.isBigO_psi_sub_theta_sqrt`). Consumed,
    for a fixed modulus, by the one-form case of AC.5.15.
  - §0.33: the zero-free region `1 − β/log(|Im s| + 2) ≤ Re s ≤ 10` for `ζ` away from the pole, with
    `|ζ(s) − 1/(s − 1)|, |1/ζ(s)| ≤ C log(|Im s| + 2)` there. Consumed by the sharp-cutoff comparison
    route only (AC.4.14, Green–Tao's Lemma A.1).
  - §1.2 `mobius_small_modulus_progressions`: for every `B, C > 0`, uniformly in `q ≤ (log x)^C` and every
    residue `b`, `∑_{n ≤ y, n ≡ b mod q} μ(n) ≪_{B,C} x (log x)^{−B}` for `y ≤ x`. Consumed by AC.5.3, which
    derives from it Green–Tao's bounds for `μ` twisted by a character or a periodic function.
- **FiniteFieldsAndCharacterSums**, Layer FF.2, `weil-bound-multiplicative`: for a multiplicative
  character `χ` of order `e ≥ 2` of a finite field `F` and `g ∈ F[X]` not of the form `c h^e` over the
  algebraic closure, with `m` distinct roots there, `|∑_{x ∈ F} χ(g(x))| ≤ (m − 1)√|F|`. Consumed by
  AC.5.9.
- **ExponentialSumsAndCircleMethod**, Layers 4–5: `waring_classical_asymptotic` (for `j ≥ 3`,
  `t ≥ 2^j + 1`, the positive representation count is its singular-series main term up to a power
  saving, for `m ≥ M₀`), `waring_series_absolute_convergence` (the singular series is bounded
  uniformly in `m`) and `heath_brown_quadratic_asymptotic` (the smooth-weight count of a fixed
  nondegenerate integral quadratic form in at least five variables). Consumed only by AC.5.1, which
  no other target here uses.

The following inputs are stated by no other roadmap in the form used here, and are planned in this
roadmap: the smooth and sharp truncated divisor sums (AC.4.11,
AC.4.14), the maximal order of the divisor function (AC.4.14), Schmidt's simultaneous recurrence (AC.2.3) and
the quantitative Weyl and coefficient lemmas (AC.3.14), the Type I/II dichotomy for `μ` (AC.5.2),
the periodic Möbius sums (AC.5.3), the convergence and positivity of the integer singular product
(AC.5.5), and Kai's fractional-ideal element weights, models, ideal sieve, Siegel-zero dichotomy, Mitsui
prime number theorem and ideal Vaughan decomposition (AC.5.8).

### Order relative to other roadmaps

The external dependency graph has edges from GeometryOfNumbersAndQuadraticArithmetic,
AnalyticNumberTheoryPartI, FiniteFieldsAndCharacterSums and ExponentialSumsAndCircleMethod into
this roadmap. There is a return edge to FiniteFieldsAndCharacterSums: its FF.1 multiplicative
Fourier expansion uses AC.0, whereas AC.5.9 uses its FF.2 Weil bound. Thus the two roadmaps have a
cycle at roadmap granularity, although their layer graph is acyclic. No common bundle is assigned
in the Caraiani–Newton order. This is an **open supplier-order gap**: the Fourier ownership and
permitted common placement have to be reconciled before the external contracts form a build order.
The mathematical contracts above specify the edges without choosing a new owner or bundle.
No ideal-sieve contract is imported from SieveMethodsAndPrimePatterns yet; its requests for
squarefree-ring sum-product and noncommutative flattening are outside the abelian targets of AC.1.
RepresentationTheory/LieGroups and Regularity already supply the stated contracts on TauCetiRoadmap main.

## How to read the build

AC.0 is self-contained over Mathlib and supplies the transform used everywhere else. AC.1 has two
independent strands over AC.0: entropy and Marton's conjecture (AC.1.1–AC.1.18) need nothing from
Fourier analysis; the Bohr-set route to Freiman's theorem uses AC.0 throughout. AC.3 needs AC.0 for the `U²` identity and AC.1 only for the Balog–Szemerédi–Gowers
theorem inside the inverse theorem. AC.2 uses the cube norms and the interval inverse theorem of
AC.3; its progression average, upper density, Rahman's threshold and the two removal lemmas need
nothing beyond Mathlib, AC.0 (for Roth's Fourier identity) and TauCetiRoadmap's Regularity (for
counting). AC.4 needs the progression average and the dense Varnavides theorem of AC.2
and the Gowers norms of AC.3. AC.5 needs AC.3 (nilsequences, the box inverse theorem, efficient
equidistribution and orbit factorisation) and the arithmetic suppliers; it does not pass through the
hypotheses of AC.4. Within each layer the subsections are in build order, and every target names its
inputs in a `*Needs:*` line. Each definition ends with its `**Checks.**`, the unit tests a wrong
definition fails; the kept definitions repeat their key checks as proved `example`s in
`Suggested.lean`. The Checks and boundary cases that `Suggested.lean` states as named theorems,
proved by `sorry`, rather than as proved examples are: `measureEntropy_dirac` (proved there),
`mutualInfo_eq_zero_of_indepFun`, `rdist_uniformOn_cosets`, `isRegularPhaseBohr_zmod_four`,
`gowersNorm_sign_zmod_two`, `intervalGowersNorm_singleton`, `intervalGowersNorm_order_zero_modulus`,
`isFilteredPolynomial_const`, `polynomialSmoothness_half_binomial`, `not_isRationalElement_third_two`,
`isRationalPeriodicSequence_third`, `intervalProgressionAverage_two_term`, `upperNaturalDensity_even`,
`upperNaturalDensity_finite`, `not_apLinearFormsCondition_two`, `arithmeticDiscrepancy_const`,
`isDiscrepancyPair_zero_one`, `threeAP_hasCSComplexity` and `integerLocalFactor_id`; each is the
Check of the same content in its subsection. `Suggested.lean` also states the intermediate
milestones `cyclic_bohr_contains_proper_gap` (AC.1.28), `simultaneous_monomial_recurrence` (AC.2.3),
`roth_density_increment` (AC.2.10) and `card_divisors_le_exp` (AC.4.14).

## Layer AC.0: Fourier analysis on finite abelian groups

This layer fixes one Fourier transform for every finite abelian group `G`: probability counting
measure on `G`, counting measure on the character group `Ĝ = AddChar G ℂ`, and indexing by `Ĝ`
itself, never by a chosen isomorphism with `G`. Mathlib already has the characters, their
orthogonality and the basis they form, the discrete Fourier transform on `ZMod N`, unnormalised
convolution and additive energy; the layer adds the normalised transform and convolution, compares
them with those library objects, and proves the identities that the rest of the roadmap is phrased
in. All of it is in Tao's 254A notes, Notes 2, §6 (printed pp. 8–10 of that set, physical pp. 34–36
of the CMU compilation).

### AC.0.1 The normalised Fourier transform `fourier`

Define `fourier f : AddChar G ℂ → ℂ` for `f : G → ℂ` by

```text
fourier f χ = N⁻¹ · ∑_{x ∈ G} f(x) · conj(χ(x)),     N = |G|.
```

It is the inner product `RCLike.wInner RCLike.cWeight χ f`, with the character in the first slot
because Mathlib's weighted inner product conjugates its first argument, and it is the coordinate of
`f` in the character basis `AddChar.complexBasis G` (orthogonality of characters for the normalised
measure). Fourier inversion `f(x) = ∑_χ fourier f χ · χ(x)` follows from the basis expansion. The
transformation rules (translation, modulation, negation, conjugation, precomposition with an
isomorphism or a surjection) come straight from the defining sum. On `ZMod N` the transform is
`N⁻¹` times Mathlib's `ZMod.dft`, through the explicit isomorphism `AddChar.zmodAddEquiv`, whose
value at `r` is the character `x ↦ ZMod.stdAddChar (x · r)`. The choice of indexing by `Ĝ` is the
canonical dual-group alternative that Tao's notes name (Notes 2, §6, printed p. 8); the
normalisation and the inversion formula are on printed p. 9.

The API:

- `fourier_apply`: `fourier f χ = (card G)⁻¹ · ∑ x, f x · star (χ x)`.
- `fourier_zero`, `fourier_add`, `fourier_smul`: the transform is `ℂ`-linear.
- `fourier_single`: `fourier (Pi.single a c) χ = (card G)⁻¹ · c · star (χ a)`.
- `fourier_character`: `fourier (fun x ↦ ψ x) χ = if χ = ψ then 1 else 0`.
- `fourier_inversion`: `∑ χ, fourier f χ · χ x = f x`.
- `fourier_inversion_reindex`: for any equivalence `e : ι ≃ AddChar G ℂ`,
  `∑ i, fourier f (e i) · e i x = f x` — inversion through an explicitly supplied indexing of the
  dual.
- `fourier_injective`: `fourier` is injective.
- `fourier_eq_basis_repr`: `fourier f χ = (AddChar.complexBasis G).repr f χ`.
- `fourier_eq_wInner`: `fourier f χ = RCLike.wInner RCLike.cWeight (fun x ↦ χ x) f`.
- `fourier_eq_haarIntegral`: `fourier f χ` is the integral of `f · star χ` against
  `TauCeti.haarProb` on `G` with the discrete topology (the degree-one case of the Peter–Weyl
  coefficients).
- `fourier_translate`: `fourier (fun x ↦ f (x − a)) χ = star (χ a) · fourier f χ`.
- `fourier_modulate`: `fourier (fun x ↦ ψ x · f x) χ = fourier f (χ / ψ)`.
- `fourier_neg`: `fourier (fun x ↦ f (−x)) χ = fourier f χ⁻¹`.
- `fourier_conj`: `fourier (fun x ↦ star (f x)) χ = star (fourier f χ⁻¹)`.
- `fourier_reflection`: `fourier (fun x ↦ star (f (−x))) χ = star (fourier f χ)`.
- `fourier_equiv`: for `e : G ≃+ H`, `fourier (f ∘ e) (χ.compAddMonoidHom e) = fourier f χ`.
- `fourier_quotient`: for a surjective `q : G →+ H`, `fourier (f ∘ q) (χ.compAddMonoidHom q) =
  fourier f χ`.
- `fourier_quotient_zero`: for `q : G →+ H` and `χ` nontrivial on `ker q`, `fourier (f ∘ q) χ = 0`.
- `zmod_character_comparison`: `AddChar.zmodAddEquiv r x = ZMod.stdAddChar (x · r)`.
- `fourier_zmod`: on `ZMod N`, `fourier f (AddChar.zmodAddEquiv r) = N⁻¹ · ZMod.dft f r`.

*Needs:* Mathlib `AddChar`, `AddChar.complexBasis`, `RCLike.wInner`, `RCLike.cWeight`,
`AddChar.zmodAddEquiv`, `ZMod.dft`; Tau Ceti `TauCeti.haarProb`.

**Checks.**

- `fourier.test_nonreal_phase`: on `ZMod 4`, `fourier (Pi.single 1 1) (zmodAddEquiv 1) = −i/4`. A
  definition that omits the conjugation gives `+i/4`.
- `fourier.test_distinct_characters`: on `ZMod 3`, the transform of the character `zmodAddEquiv 2`
  vanishes at `zmodAddEquiv 1`.
- `fourier.test_self_coefficient_one`: `fourier (fun x ↦ χ x) χ = 1`, not `N`; counting measure on
  `G` would give `N`.
- `fourier.test_zero`: `fourier 0 χ = 0`.
- `fourier.test_trivial_group`: on `ZMod 1`, `fourier f χ = f 0`.
- `fourier.test_noncyclic_delta`: on `ZMod 2 × ZMod 2`, the unit point mass at `0` has coefficient
  `1/4` at every one of the four characters, on a group that is not cyclic.
- `fourier.test_conjugate_reflection`: on `ZMod 4`, the conjugate reflection `x ↦ star (f (−x))` of
  `f = Pi.single 1 1` has coefficient `+i/4` at `zmodAddEquiv 1`, the conjugate of
  `fourier.test_nonreal_phase`, as `fourier_reflection` predicts. For the complex point mass
  `f = Pi.single 1 i` the conjugate reflection has coefficient `1/4` there, while the plain
  reflection `x ↦ f (−x)` has `−1/4`: a rule that forgets the conjugation fails.
- `fourier.test_conjugate_slot`: `fourier (fun x ↦ i · χ x) χ = i`; putting the character in the
  linear slot of the inner product would give `−i`.

### AC.0.2 Normalised convolution `nconv`

Define, for `f g : G → ℂ`,

```text
nconv f g x = N⁻¹ · ∑_{y ∈ G} f(y) · g(x − y),
```

convolution against the probability counting measure. It is `N⁻¹` times Mathlib's
`DiscreteConvolution.addRingConvolution f g`: a normalisation adapter, not a second convolution
theory. Commutativity, associativity and bilinearity transfer from the discrete convolution (each
convolution carries one factor `N⁻¹` and one sum, so associativity holds with the normalisation). On
indicators, `nconv 1_A 1_B x = N⁻¹ · #{(a, b) ∈ A × B : a + b = x} = N⁻¹ · A.addConvolution B x`.
The unit is `N · δ₀`, not `δ₀`. (Tao, Notes 2, §6, printed p. 9: convolution against the
normalised measure.)

The API:

- `nconv_apply`: `nconv f g x = (card G)⁻¹ · ∑ y, f y · g (x − y)`.
- `nconv_eq_addRingConvolution`: `nconv f g = (card G)⁻¹ • DiscreteConvolution.addRingConvolution f g`.
- `nconv_indicator`: `nconv 1_A 1_B x = (card G)⁻¹ · (A.addConvolution B x : ℂ)`.
- `nconv_comm`, `nconv_assoc`: commutativity and associativity.
- `nconv_add_left`, `nconv_add_right`, `nconv_smul_left`, `nconv_smul_right`: bilinearity.
- `nconv_zero_left`, `nconv_zero_right`: `nconv 0 f = 0 = nconv f 0`.
- `nconv_single`: `nconv (Pi.single a c) (Pi.single b d) = Pi.single (a + b) ((card G)⁻¹ · c · d)`.
- `nconv_unit_left`, `nconv_unit_right`: `nconv (Pi.single 0 (card G)) f = f = nconv f (Pi.single 0
  (card G))`.

*Needs:* Mathlib `DiscreteConvolution.addRingConvolution`, `Finset.addConvolution`.

**Checks.**

- `nconv.test_delta_not_unit`: on `ZMod 3`, `nconv δ₀ δ₀ 0 = 1/3`, so the unit point mass is not the
  convolution unit for the probability measure.
- `nconv.test_scaled_unit`: on `ZMod 4`, `nconv (Pi.single 0 4) f = f`; without the factor `N⁻¹` the
  unit would be `δ₀` instead.
- `nconv.test_zero`: `nconv 0 f = 0`.
- `nconv.test_constants`: `nconv 1 1 = 1`.
- `nconv.test_support_and_scale`: on `ZMod 4`, `nconv δ₁ δ₁ 2 = 1/4`, testing the support `a + b`
  and the normalisation together.
- `nconv.test_indicator_multiplicity`: on `ZMod 3` with `A = B = {0, 1}`,
  `nconv 1_A 1_B 1 = 2/3`: two representations `0 + 1` and `1 + 0`; sumset membership alone would
  give `1/3`.

### AC.0.3 Parseval and Plancherel

Prove `fourier_parseval`: for `f, g : G → ℂ`,

```text
N⁻¹ ∑_x f(x) conj(g(x)) = ∑_χ fourier f χ · conj(fourier g χ),
```

and in particular `N⁻¹ ∑_x |f(x)|² = ∑_χ |fourier f χ|²`: the transform is an isometry from
`L²(G, probability)` to `ℓ²(Ĝ, counting)`. Expand both sides with `fourier_inversion` and use
orthogonality `N⁻¹ ∑_x χ(x) conj(ψ(x)) = [χ = ψ]`. The two sides use different measures; with both
normalised, or both counting, the identity is false. For `f = χ` both sides are `1`; for `f = 1_A`
Plancherel gives `∑_χ |fourier 1_A χ|² = |A|/N` (Tao, Notes 2, §6, printed p. 9, the Parseval
relation and Plancherel, and equation (1)).

*Needs:* AC.0.1; Mathlib `AddChar.complexBasis`.

### AC.0.4 The convolution identity

Prove `fourier_nconv`: `fourier (nconv f g) χ = fourier f χ · fourier g χ` for every `χ ∈ Ĝ`. Expand
the double sum, substitute `x = y + z` and use `conj(χ(y + z)) = conj(χ(y)) conj(χ(z))`; the sum
factorises. No constant appears exactly because the transform and the convolution are both taken
against the probability measure: with unnormalised convolution a factor `N` would appear. For
`f = g = χ` both sides are `1` at `χ` (Tao, Notes 2, §6, printed p. 9).

*Needs:* AC.0.1, AC.0.2.

### AC.0.5 Additive energy in Fourier terms

Prove `fourier_energy`: for finite `A, B ⊆ G`,

```text
E(A, B) = N³ · ∑_χ |fourier 1_A χ|² · |fourier 1_B χ|²,
```

where `E` is Mathlib's `Finset.addEnergy`. Write `E(A, B) = ∑_x r(x)²` with
`r(x) = A.addConvolution B x` (`Finset.addEnergy_eq_sum_sq`); by `nconv_indicator`,
`nconv 1_A 1_B = N⁻¹ r`; apply Plancherel to `nconv 1_A 1_B` and the convolution identity, and
multiply by `N³`. For `A = B = G` both sides are `N³`; for `A = B = {0}` both are `1`; the factor `N³`
is forced by the normalisations. Tao applies Plancherel to `1_A ∗ 1_A` to reach the fourth moment
(Notes 2, §6, printed p. 10); the energy formula is that computation rewritten as a count.

*Needs:* AC.0.2, AC.0.3, AC.0.4; Mathlib `Finset.addEnergy`, `Finset.addEnergy_eq_sum_sq`,
`Finset.addConvolution`.

### AC.0.6 The `L²` mass of an indicator's transform

Prove `fourier_indicator_l2`: `∑_χ |fourier 1_A χ|² = |A|/N`. Plancherel at `f = 1_A` and
`|1_A|² = 1_A`. For `A = G` it gives `1`, for `A = ∅` it gives `0`, and for a singleton it gives
`1/N` while each of the `N` coefficients has modulus `1/N` (Tao, Notes 2, §6, equation (1),
printed p. 9).

*Needs:* AC.0.1, AC.0.3.

### AC.0.7 The transform is bounded by the normalised `L¹` norm

Prove `fourier_norm_le_l1`: `|fourier f χ| ≤ N⁻¹ ∑_x |f(x)|` for every `χ`, by the triangle inequality
and `|χ(x)| = 1`. Equality holds at `f = χ` (both sides `1`), and at `f = 0` both sides are `0`; the
bound is uniform in `χ` (Tao, Notes 2, §6, equation (2), printed p. 9).

*Needs:* AC.0.1.

### AC.0.8 Pointwise and fourth-moment bounds for an indicator

Prove `fourier_indicator_norm_le`: `|fourier 1_A χ| ≤ |A|/N` for every `χ`, with equality at the
trivial character, where `fourier 1_A 1 = |A|/N`. For `A = G` every nontrivial coefficient is `0`
(Tao, Notes 2, §6, equation (2), printed p. 9).

Prove `fourier_indicator_fourth_le`: `∑_χ |fourier 1_A χ|⁴ ≤ (|A|/N)³`. Bound
`|fourier 1_A χ|⁴ ≤ (|A|/N)² |fourier 1_A χ|²` and sum with AC.0.6. Equality holds for `A = G`.
Through AC.0.5 this is `E(A, A) ≤ |A|³`, and under small doubling `|A + A| ≤ K|A|` Mathlib's
Cauchy–Schwarz bound `Finset.le_card_add_mul_addEnergy` gives the matching lower bound
`(|A|/N)³/K` (Tao, Notes 2, §6, equations (4) and (5), printed p. 10).

*Needs:* AC.0.5, AC.0.6, AC.0.7; Mathlib `Finset.le_card_add_mul_addEnergy`.

### AC.0.9 The trivial upper bound for additive energy

Prove `addEnergy_le_card_sq_mul_card`: for finite subsets `A, B` of an additive commutative group,
`E(A, B) ≤ |A|² |B|` and `E(A, B) ≤ |A| |B|²`. By `Finset.addEnergy_eq_card_filter`, `E(A, B)` counts
`(a₁, a₂, b₁, b₂)` with `a₁ + b₁ = a₂ + b₂`; the map to `(a₁, a₂, b₁)` is injective on that set
because `b₂ = a₁ + b₁ − a₂`, and symmetrically for `(a₁, b₁, b₂)`. The pinned Mathlib has only the
lower bounds `|A||B| ≤ E(A, B)` and `|A|²|B|² ≤ |A + B| E(A, B)` and the value
`E(G, B) = |G||B|²` (`Finset.addEnergy_univ_left`), which shows that the second bound is attained;
for `A = B` a subgroup both are attained. Cancellation is used, so the statement is for groups. Tao
proves the Fourier form for `A = B` (Notes 2, §6, equation (5), printed p. 10); the two-set count is
the elementary injection above.

*Needs:* Mathlib `Finset.addEnergy`, `Finset.addEnergy_eq_card_filter`, `Finset.addEnergy_univ_left`,
`Finset.le_addEnergy`.

### Examples

- On `ZMod 4`, the point mass `Pi.single 1 1` has transform `−i/4` at `zmodAddEquiv 1`, and its
  conjugate reflection `+i/4`; on `ZMod 2 × ZMod 2` the point mass at `0` has all four coefficients
  `1/4`.
- On `ZMod 3` with `A = B = {0, 1}`: `nconv 1_A 1_B` takes the values `1/3, 2/3, 1/3` at `0, 1, 2`,
  so `E(A, A) = 1 + 4 + 1 = 6`. The transform of `1_A` is `2/3` at the trivial character and
  `(1 + ω̄)/3`, of modulus `1/3`, at the two others (`ω = e^{2πi/3}`), so
  `27 · ∑_χ |fourier 1_A χ|⁴ = 27 · (16/81 + 2/81) = 6`, as AC.0.5 asserts.
- For `A = B = G`, `E(G, G) = N³` and `fourier 1_G` is the indicator of the trivial character.

### Dependencies

Mathlib (characters, the character basis, `ZMod.dft`, weighted inner products, discrete convolution,
additive energy) and Tau Ceti (`TauCeti.haarProb`). No other roadmap.

## Layer AC.1: Additive structure

This layer has two strands. The first (AC.1.1–AC.1.18) builds Shannon entropy for finitely valued
random variables and follows Gowers, Green, Manners and Tao, *On a conjecture of Marton* (Annals of
Mathematics 201 (2025); arXiv:2311.05762v2), to the polynomial Freiman–Ruzsa theorem in
characteristic two. The second (AC.1.19–AC.1.31) is the Fourier-analytic route to Freiman's theorem
of Tao's 254A Notes 2 and 3: large spectra, Bohr sets, Bogolyubov's lemma, generalised arithmetic
progressions, the Balog–Szemerédi–Gowers theorem, Ruzsa modelling and properisation. Mathlib's
Plünnecke–Ruzsa inequalities, Ruzsa's covering lemma and Freiman homomorphisms are used as they
are; Mathlib has only the binary entropy function, so the entropy carrier is built here on
`Real.negMulLog`. Numbering and page numbers for the Marton paper are those of arXiv:2311.05762v2.

Throughout AC.1.1–AC.1.18 random variables take values in finite types and live on a probability
space; conditioning on an event of probability zero contributes zero weight; logarithms are natural.

### AC.1.1 Shannon entropy, conditional entropy and mutual information

Define, for a measure `μ` on a finite type `S`, `measureEntropy μ = ∑_s negMulLog(μ{s})`, and for a
random variable `X` with values in `S`, `entropy X = measureEntropy (law X)`, written `H[X]`. Define
`condEntropy`, `H[X | Y] = ∑_y P(Y = y) · H[X | Y = y]`, the mutual information
`mutualInfo`, `I[X : Y] = H[X] + H[Y] − H[X, Y]`, and the conditional mutual information
`condMutualInfo`, `I[X : Y | Z] = ∑_z P(Z = z) · I[(X | Z = z) : (Y | Z = z)]`. Jensen's inequality
for the concave `negMulLog` gives `H[X] ≤ log |S|` with equality exactly for the uniform law (A.1),
and some value has probability at least `e^{−H[X]}` (A.2). Expanding `p_{X,Y} = p_Y · p_{X|Y}` gives
the chain rule `H[X, Y] = H[X | Y] + H[Y]` (A.3). Jensen again gives `I[X : Y] ≥ 0` with equality
exactly when `X` and `Y` are independent (A.4)–(A.5); conditioning and summing gives submodularity
`H[X | Y, Z] ≤ H[X | Z]` (A.6)–(A.7) and `I[X : Y | Z] ≥ 0` (A.8)–(A.9). Entropy is invariant under
injective relabelling, and the uniform law on a nonempty finite set `s` has entropy `log |s|`
(Gowers–Green–Manners–Tao, Appendix A, (A.1)–(A.9), pp. 25–26). The names follow the Lean
formalisation of this paper (the PFR project), which is a source to coordinate with, not a pinned
library.

The API:

- `measureEntropy`, `entropy`, `condEntropy`, `mutualInfo`, `condMutualInfo`: the definitions above.
- `entropy_le_log_card`: `H[X] ≤ log |S|` (A.1).
- `measureEntropy_eq_log_card_iff`: equality in (A.1) exactly for the uniform law.
- `exists_measure_singleton_ge`: some value has probability at least `e^{−H[X]}` (A.2).
- `entropy_pair_eq_condEntropy_add`: the chain rule (A.3).
- `entropy_pair_eq_add_iff`: `H[X, Y] = H[X] + H[Y]` iff `X` and `Y` are independent (A.4).
- `condEntropy_le_entropy`: conditioning does not increase entropy (A.5).
- `condEntropy_pair_le`: submodularity (A.6).
- `condMutualInfo_nonneg`: `I[X : Y | Z] ≥ 0` (A.8).
- `entropy_comp_of_injective`: injective relabelling preserves entropy.
- `measureEntropy_uniformOn`: the uniform law on a nonempty finite `s` has entropy `log |s|`.

*Needs:* Mathlib `Real.negMulLog`, `Real.concaveOn_negMulLog`, `MeasureTheory.Measure.map`,
`ProbabilityTheory.cond`, `ProbabilityTheory.IndepFun`, `ProbabilityTheory.uniformOn`.

**Checks.**

- `entropy_const`: a constant random variable has entropy `0`.
- `entropy_uniform_bool`: the uniform law on `Bool` has entropy `log 2`; a definition with base-2
  logarithms gives `1`.
- `mutualInfo_self`: `I[X : X] = H[X]`.
- `mutualInfo_indep`: independent `X`, `Y` (Mathlib's `IndepFun`) have `I[X : Y] = 0`.
- `measureEntropy.test_biased`: the law `(3/4, 1/4)` on `Bool` has entropy
  `−(3/4) log(3/4) − (1/4) log(1/4)`, strictly between `0` and `log 2`.
- `entropy.test_pair`: two independent uniform bits, treated as one four-valued variable, have
  entropy `2 log 2`; relabelling the four values does not change it.
- `condEntropy.test_self`: for a uniform bit `B`, `H[B | B] = 0`.
- `condEntropy.test_independent`: independent uniform bits have `H[B | C] = log 2`.
- `condEntropy.test_constant_condition`: `H[B | 0] = log 2`; zero-probability fibres contribute zero.
- `mutualInfo.test_constant`: `I[B : 0] = 0`, while `I[B : B] = log 2` for a uniform bit.
- `condMutualInfo.test_constant_condition`: `I[B : B | 0] = log 2`.
- `condMutualInfo.test_self_condition`: `I[B : B | B] = 0`.
- `condMutualInfo.test_xor`: for independent uniform bits `B, C`, conditioning on `B + C` in
  `ZMod 2` gives `I[B : C | B + C] = log 2`, although `I[B : C] = 0`.

### AC.1.2 The entropic Ruzsa distance

Define `rdist`: for probability measures `μ, ν` on a finite abelian group `G`,

```text
d[μ ; ν] = H[X' − Y'] − ½ H[X'] − ½ H[Y'],    X' ∼ μ, Y' ∼ ν independent   (1.1),
```

computed from the law of `p.1 − p.2` under `μ ⊗ ν`; for random variables `d[X ; Y]` is the distance
of their laws, so `X` and `Y` need not be independent or even defined on one space. Define the
conditional distance `condRdist`,
`d[X | Z ; Y | W] = ∑_{z, w} P(Z = z) P(W = w) · d[(X | Z = z) ; (Y | W = w)]` (A.14). Symmetry holds
because `X' − Y'` and `Y' − X'` have equal entropy; nonnegativity and `|H[X] − H[Y]| ≤ 2 d[X ; Y]`
follow from `max(H[X], H[Y]) ≤ H[X − Y]` for independent `X, Y` (A.10)–(A.12). For independent copies
the conditional distance is `H[X' − Y' | Z', W'] − ½ H[X' | Z'] − ½ H[Y' | W']` (A.15). The distance is
translation invariant and `d[U_H ; U_H] = 0` for the uniform law on a subgroup
(Gowers–Green–Manners–Tao, §1, (1.1) and the remarks after it, p. 4; Appendix A, (A.10)–(A.15),
pp. 26–28).

The API:

- `rdist`, `condRdist`: the definitions above.
- `rdist_symm`: `d[μ ; ν] = d[ν ; μ]`.
- `rdist_nonneg`: `d[μ ; ν] ≥ 0`.
- `abs_measureEntropy_sub_le`: `|H[μ] − H[ν]| ≤ 2 d[μ ; ν]` (A.12).
- `rdist_map_eq_of_indepFun`: for independent `X, Y` on one space,
  `d[X ; Y] = H[X − Y] − ½ H[X] − ½ H[Y]`.
- `rdist_map_add_const`: translating one law does not change the distance.
- `rdist_uniformOn_self`: `d[U_H ; U_H] = 0` for a subgroup `H`.

*Needs:* AC.1.1; Mathlib `MeasureTheory.Measure.prod`.

**Checks.**

- `rdist_dirac_zero`: two point masses at `0` are at distance `0`.
- `rdist_cosets`: the uniform laws on two cosets `a + H`, `b + H` are at distance `0` although they
  differ: the distance is not a metric on laws.
- `rdist_three_points`: for `X` uniform on `{0, e₁, e₂} ⊂ 𝔽₂²`, `d[X ; X] = (2/3) log(3/2) ≈ 0.2703 >
  0`: the distance of a variable from itself need not vanish.
- `condRdist.test_constant_conditions`: constant conditioning variables give the original `rdist`.
- `condRdist.test_revealed_both`: if both variables are revealed, each fibre is a point mass and
  the conditional distance is `0`, even for the three-point law above with positive self-distance.
- `condRdist.test_revealed_one`: for a uniform bit `B`, `d[B ; B | B] = (1/2) log 2`, whereas
  `d[B ; B] = 0`; the two fibres in the conditional definition are sampled independently.

### AC.1.3 The entropic Ruzsa triangle inequality

Prove `rdist_triangle`: `d[X ; Y] ≤ d[X ; Z] + d[Z ; Y]`; equivalently, for independent `X, Y, Z`,
`H[X − Y] ≤ H[X − Z] + H[Z − Y] − H[Z]`. By submodularity
`H[Y − Z | X − Y] ≥ H[Y − Z | X − Y, Y] = H[Z | X, Y] = H[Z]`, and
`H[Y − Z | X − Y] = H[X − Z, Y − Z] − H[X − Y] ≤ H[X − Z] + H[Y − Z] − H[X − Y]`; the half-entropies
cancel. Independence of `X` and `Y` is not needed (Gowers–Green–Manners–Tao, Appendix A, (A.13) and
its proof, p. 27).

*Needs:* AC.1.2.

### AC.1.4 Madiman's inequality

Prove `entropy_add_add_sub_le`: for independent `X, Y, Z` in a finite abelian group,
`H[X + Y + Z] − H[X + Y] ≤ H[Y + Z] − H[Y]`, an entropy form of Plünnecke's inequality generalising
Kaimanovich–Vershik. By (A.9), `I[X : Z | X + Y + Z]` expands into four entropies; independence turns
them into `H[X] + H[Y + Z]`, `H[Z] + H[X + Y]` and `H[X] + H[Y] + H[Z]`, so the claim is
`I[X : Z | X + Y + Z] ≥ 0`. Taking `Z = 0` gives equality (Gowers–Green–Manners–Tao, Appendix A,
Lemma A.1 and proof, p. 28; (5.5), p. 18).

*Needs:* AC.1.1.

### AC.1.5 The entropic Balog–Szemerédi–Gowers lemma

Prove `sum_rdist_cond_le`: for a `G²`-valued random variable `(A, B)` and `Z = A + B`,

```text
∑_z P(Z = z) · d[(A | Z = z) ; (B | Z = z)] ≤ 3 I[A : B] + 2 H[Z] − H[A] − H[B].
```

`A` and `B` are jointly distributed, not assumed independent, and `2H[Z] − H[A] − H[B]` is not
`2d[A ; B]`. Take conditionally independent trials `(A₁, B₁)`, `(A₂, B₂)` of `(A, B)` relative to `Z`;
then `H[A₁, B₁, A₂, B₂] = 2H[A, B] − H[Z]` (A.17) and the left side is
`H[A₁ − B₂ | Z] − ½ H[A₁ | Z] − ½ H[B₂ | Z]` (A.18). Submodularity (A.19) and `A₁ − B₂ = A₂ − B₁`
bound `H[A₁ − B₂]` by `2I[A : B] + H[Z]` (A.20)–(A.22), and
`H[A₁ | Z] = H[B₂ | Z] = H[A] + H[B] − I[A : B] − H[Z]`. The constants improve Tao's entropic
Balog–Szemerédi–Gowers lemma (Gowers–Green–Manners–Tao, Appendix A, Lemma A.2 and proof, pp. 28–30).

*Needs:* AC.1.1, AC.1.2.

### AC.1.6 The fibring lemma

Prove `rdist_eq_fibring`: for a homomorphism `π : H → H'` of finite abelian groups and `H`-valued
`Z₁, Z₂`,

```text
d[Z₁ ; Z₂] ≥ d[π(Z₁) ; π(Z₂)] + d[Z₁ | π(Z₁) ; Z₂ | π(Z₂)],
```

and for independent `Z₁, Z₂` the difference is exactly
`I[Z₁ − Z₂ : (π(Z₁), π(Z₂)) | π(Z₁ − Z₂)]` (4.1). With independent copies, (A.15) and submodularity
bound the conditional distance by `H[Z₁ − Z₂ | π(Z₁ − Z₂)] − …`; the identities
`H[Z₁ − Z₂ | π(Z₁ − Z₂)] = H[Z₁ − Z₂] − H[π(Z₁ − Z₂)]` and `H[Z_i | π(Z_i)] = H[Z_i] − H[π(Z_i)]`
turn the bound into `d[Z₁ ; Z₂] − d[π(Z₁) ; π(Z₂)]`, and the slack is `I[A : C | B]` with
`A = Z₁ − Z₂`, `B = π(Z₁ − Z₂)`, `C = (π(Z₁), π(Z₂))`, since `C` determines `B`. At `π = 0` the
conditional term is `d[Z₁ ; Z₂]`; at `π = id` it is `0` (Gowers–Green–Manners–Tao, §4,
Proposition 4.1 and proof, p. 15).

*Needs:* AC.1.1, AC.1.2.

### AC.1.7 Fibring for four independent variables

Prove `fibring_four`: for independent `Y₁, Y₂, Y₃, Y₄` in a finite abelian group,

```text
d[Y₁ − Y₃ ; Y₂ − Y₄] + d[Y₁ | Y₁ − Y₃ ; Y₂ | Y₂ − Y₄]
    + I[Y₁ − Y₂ : Y₂ − Y₄ | Y₁ − Y₂ − Y₃ + Y₄] = d[Y₁ ; Y₂] + d[Y₃ ; Y₄].
```

Apply AC.1.6 with `H = G × G`, `H' = G`, `π(x, y) = x − y`, `Z₁ = (Y₁, Y₃)`, `Z₂ = (Y₂, Y₄)`; by
independence `d[Z₁ ; Z₂] = d[Y₁ ; Y₂] + d[Y₃ ; Y₄]`; once `Y₁ − Y₃` is fixed, `Z₁` and `Y₁` determine
each other. The conditioning variable is `π(Z₁ − Z₂) = π(Z₁) − π(Z₂) = Y₁ − Y₂ − Y₃ + Y₄`; the proof in
the source writes `π(Z₁) + π(Z₂)` at one point, which agrees with the difference only in
characteristic two. Given it, `Y₁ − Y₂` determines `Y₃ − Y₄` and `Y₂ − Y₄` determines `Y₁ − Y₃`. In
characteristic two every sign may be replaced by `+` (Remark 4.3, p. 16). The substitutions
`(Y₁, Y₂, Y₃, Y₄) = (X₁, X₂, X̃₂, X̃₁)` and `(X₂, X₁, X̃₂, X̃₁)` give the identities used in §§5–6
(Gowers–Green–Manners–Tao, §4, Corollary 4.2 and proof, pp. 15–16).

*Needs:* AC.1.6.

### AC.1.8 Conditioning costs at most half the mutual information

Prove `condRdist_le`: `d[X | Z ; Y | W] ≤ d[X ; Y] + ½ I[X : Z] + ½ I[Y : W]`. With independent copies,
`d[X | Z ; Y | W] = H[X' − Y' | Z', W'] − ½ H[X' | Z'] − ½ H[Y' | W']`, and (A.5) bounds the first
term by `H[X' − Y']`. Constant `Z, W` give equality (Gowers–Green–Manners–Tao, §5, Lemma 5.1 and
proof, p. 17).

*Needs:* AC.1.1, AC.1.2.

### AC.1.9 Distances to sums and to fibres

Prove `rdist_sub_sub_le`: for `Y, Z` independent,

```text
d[X ; Y − Z] − d[X ; Y] ≤ ½ (H[Y − Z] − H[Y]) = ½ d[Y ; Z] + ¼ H[Z] − ¼ H[Y]          (5.6)
d[X ; Y | Y − Z] − d[X ; Y] ≤ ½ (H[Y − Z] − H[Z]) = ½ d[Y ; Z] + ¼ H[Y] − ¼ H[Z]      (5.7)
```

For (5.6) take `X` independent of `(Y, Z)` and apply Madiman's inequality with `Y` replaced by `−Y`;
for (5.7) use `I[Y : Y − Z] = H[Y − Z] − H[Z]` and AC.1.8. The signs are the corrected ones the
source records (footnote 4 thanks Floris van Doorn for noting the sign)
(Gowers–Green–Manners–Tao, §5, Lemma 5.2 and proof, p. 18).

*Needs:* AC.1.4, AC.1.8.

### AC.1.10 Distance to a fibre of a double sum

Prove `condRdist_sub_sub_le`: for `Y, Z, Z'` independent,
`d[X ; Y − Z | Y − Z − Z'] − d[X ; Y] ≤ ½ (H[Y − Z − Z'] + H[Y − Z] − H[Y] − H[Z'])`: (5.7) with
`Y ↦ Y − Z`, `Z ↦ Z'`, plus (5.6). It is used six times in (7.3) (Gowers–Green–Manners–Tao, §7,
Lemma 7.1 and proof, p. 21).

*Needs:* AC.1.9.

### AC.1.11 Distance zero means cosets of one subgroup

Prove `exists_subgroup_of_rdist_eq_zero`: if `d[X₁ ; X₂] = 0` there is a subgroup `H ≤ G` such that
the laws of `X₁` and `X₂` are translates of `U_H`; in particular `d[X₁ ; U_H] = d[X₂ ; U_H] = 0`. The
source states this for `G = 𝔽₂ⁿ`; the proof works in every finite abelian group. For independent
copies, `H[X₁' − X₂'] ≥ H[X₁' − X₂' | X₂'] = H[X₁']`, and likewise for `X₂'`; averaging and
`d = 0` force equality in both, so `X₁' − X₂'` is independent of `X₁'` and of `X₂'`. The
stabiliser `H` of the law of `X₁ − X₂` under translation is a subgroup with
`S₁ − S₁ = S₂ − S₂ = H` for the supports; then `log |H| ≤ H[X₁] ≤ log |S₁| ≤ log |H|` forces `X₁`
uniform on a coset of `H`, and likewise `X₂`. A Dirac mass is uniform on a coset of the trivial
subgroup (Gowers–Green–Manners–Tao, §2, Lemma 2.2, p. 7; the arXiv proof gets `d[X₁ ; X₁] = 0` from the triangle inequality and
then quotes Tao's *Sumset and inverse sumset theory for Shannon entropy*, Theorem 1.11(i); the
published version proves it directly by the argument above).

*Needs:* AC.1.1, AC.1.2.

### AC.1.12 The functional `τ` and its minimisers

Define `tau`: for `η > 0` and fixed reference laws `X₁⁰, X₂⁰` on `G`,

```text
τ[X₁ ; X₂] = d[X₁ ; X₂] + η d[X₁⁰ ; X₁] + η d[X₂⁰ ; X₂]     (2.1),
```

a function of the two laws only; the references are never modified. Define `IsTauMinimizer`: a pair
of probability measures minimising `τ`. The source takes `G = 𝔽₂ⁿ` (in Lean a finite
`ZMod 2`-module) and `η = 1/9`; the definition makes sense for every finite abelian group. A
minimiser exists because pairs of probability laws on the finite set `G` form a compact set on
which `d` is continuous. Symmetry of `d` gives `τ[X₂⁰ ; X₁⁰] = (1 + 2η) d[X₁⁰ ; X₂⁰]` (2.3), and
minimality, applied to each pair of fibres and averaged, gives the conditioned form
`d[X₁' | Y₁ ; X₂' | Y₂] ≥ k − η(d[X₁⁰ ; X₁' | Y₁] − d[X₁⁰ ; X₁]) − η(d[X₂⁰ ; X₂' | Y₂] − d[X₂⁰ ; X₂])`
(3.15), where `k = d[X₁ ; X₂]`. The compactness step makes the argument nonconstructive; Remark 2.3
explains that the proof of Proposition 2.1 itself is algorithmic (Gowers–Green–Manners–Tao, §2,
(2.1)–(2.3) and the proof of Theorem 1.8, pp. 6–7; §3, (3.12) and (3.15), pp. 13–14).

The API:

- `tau`, `IsTauMinimizer`: the definitions above.
- `MinimizerSetup`: the setting of §§5–7, a `τ`-minimiser `(μ₁, μ₂)` for `η = 1/9` with four
  independent random variables `X₁, X₂, X̃₁, X̃₂` of laws `μ₁, μ₂, μ₁, μ₂` on one probability space.
- `exists_isTauMinimizer`: a minimiser exists.
- `tau_swap`: `τ[X₂⁰ ; X₁⁰] = (1 + 2η) d[X₁⁰ ; X₂⁰]` (2.3).
- `IsTauMinimizer.condRdist_ge`: the conditioned form (3.15).

*Needs:* AC.1.2.

**Checks.**

- `tau_uniform_self`: with every law equal to `U_H` for a subgroup `H`, `τ = 0`.
- `not_isTauMinimizer_zero`: the zero measure is not a minimiser; minimisers are probability
  measures, and on the zero measure the formula takes junk values.
- `tau_nonneg`: `τ ≥ 0` for probability measures and `η ≥ 0`.
- `tau.test_penalties`: with both references `δ₀` and both variable laws uniform on a subgroup
  of order `2`, `τ = η log 2`. With variable laws `δ₀, U_H`, it is `(1 + η) log 2 / 2`.
- `IsTauMinimizer.test_dirac`: for point-mass references and `η ≥ 0`, any pair of point masses has
  `τ = 0` and is a minimiser.
- `IsTauMinimizer.test_uniform_not_minimum`: with both references `δ₀` and `η > 0`, the pair
  `U_H, U_H` for `|H| = 2` has positive `τ` and is not a minimiser.

- `MinimizerSetup.test_constants`: four constant variables with point-mass references have the
  required laws, are jointly independent and realise a minimiser of value zero.
- `MinimizerSetup.test_shared_bit`: with both references and both minimising laws uniform on
  `ZMod 2`, taking all four variables equal to one uniform bit has the right marginals and `τ = 0`,
  but fails independence.
- `MinimizerSetup.test_pairwise_only`: three independent uniform bits and their sum have uniform
  marginals and are pairwise independent, but their four-way sum is zero. They fail the joint
  independence required by the setup, despite their marginal pair minimising `τ` for uniform references.

### AC.1.13 The first estimate

Prove `first_estimate`. In the minimiser setting (`G` an elementary abelian `2`-group, `η = 1/9`,
`(μ₁, μ₂)` minimising `τ`, `X₁, X₂, X̃₁, X̃₂` independent with `X₁, X̃₁ ∼ μ₁` and `X₂, X̃₂ ∼ μ₂`,
`k = d[X₁ ; X₂]`, `S = X₁ + X₂ + X̃₁ + X̃₂`),

```text
I₁ = I[X₁ + X₂ : X̃₁ + X₂ | S] ≤ 2ηk                                  (3.13)
H[S] ≤ ½ H[X₁] + ½ H[X₂] + (2 + η)k − I₁                               (5.8)
```

AC.1.7 with `(X₁, X₂, X̃₂, X̃₁)` gives
`d[X₁ + X̃₂ ; X₂ + X̃₁] + d[X₁ | X₁ + X̃₂ ; X₂ | X₂ + X̃₁] + I₁ = 2k` (5.1); minimality bounds each
distance below by `k − η(…)` (5.2), and AC.1.9 bounds each bracket, the four differences being
`½k ± ¼(H[X₂] − H[X₁])` and adding in pairs to `k` (5.3)–(5.4). Subtracting (5.2) from (5.1) gives
`d[X₁ + X̃₂ ; X₂ + X̃₁] ≤ (1 + η)k − I₁`, which is (5.8) (Gowers–Green–Manners–Tao, §5,
(5.1)–(5.8), pp. 16–19).

*Needs:* AC.1.7, AC.1.8, AC.1.9, AC.1.12.

### AC.1.14 The second estimate

Prove `second_estimate`: in the same setting,
`I₂ = I[X₁ + X₂ : X₁ + X̃₁ | S] ≤ 2ηk + 2η(2ηk − I₁)/(1 − η)`; by symmetry
`I₃ = I[X̃₁ + X₂ : X₁ + X̃₁ | S] = I₂`. AC.1.7 with `(X₂, X₁, X̃₂, X̃₁)` gives
`d[X₁ + X̃₁ ; X₂ + X̃₂] + d[X₁ | X₁ + X̃₁ ; X₂ | X₂ + X̃₂] + I₂ = 2k`. Minimality and AC.1.9 give
`I₂ ≤ η(d[X₁ ; X₁] + d[X₂ ; X₂])` (6.4) and a lower bound for the first distance (6.5); expanding the
same distance and using (5.8) gives `d[X₁ ; X₁] + d[X₂ ; X₂] ≤ 2k + 2(2ηk − I₁)/(1 − η)` (6.6). The Ruzsa
triangle inequality alone would give only `4ηk` (Gowers–Green–Manners–Tao, §6, (6.1)–(6.6),
pp. 19–21).

*Needs:* AC.1.7, AC.1.9, AC.1.12, AC.1.13.

### AC.1.15 The endgame construction

Prove `exists_endgame_pair`: let `G = 𝔽₂ⁿ`, `(T₁, T₂, T₃)` be `G³`-valued with `T₁ + T₂ + T₃ = 0`, and
`δ = ∑_{i < j} I[T_i : T_j]`. Then there are `T₁', T₂'` with

```text
d[T₁' ; T₂'] + η(d[X₁⁰ ; T₁'] − d[X₁⁰ ; X₁]) + η(d[X₂⁰ ; T₂'] − d[X₂⁰ ; X₂])
    ≤ δ + (η/3)(δ + ∑_{i=1}^{2} ∑_{j=1}^{3} (d[X_i⁰ ; T_j] − d[X_i⁰ ; X_i])),
```

for `η ≥ 0` and `X₁⁰, X₂⁰, X₁, X₂` as in the `τ` setting. The source writes the terms of `δ` in (7.5)
with the semicolon of the distance; they are mutual informations `I[T_i : T_j]`, which is how the
proof evaluates them. AC.1.5 with `(A, B) = (T₁, T₂)` bounds the averaged fibre distance by `δ`,
because any two of the `T_i` determine the third; AC.1.8 bounds the reference terms; choose the
fibre `t₃` minimising the combined functional (7.7), do the same for all six permutations and
average, each `T_j` occurring twice in each position. If `δ = 0` the `T_i` are pairwise independent
and two of them already work by (3.9) (Gowers–Green–Manners–Tao, §7, Lemma 7.2 and proof,
pp. 22–24; (3.9), p. 10).

*Needs:* AC.1.2, AC.1.5, AC.1.8.

### AC.1.16 A `τ`-minimiser has distance zero

Prove `rdist_eq_zero_of_isTauMinimizer`: for `η = 1/9`, if `(X₁, X₂)` minimises `τ` then
`d[X₁ ; X₂] = 0`; equivalently (Proposition 2.1) if `d[X₁ ; X₂] > 0` some pair has strictly smaller
`τ`. Put `U = X₁ + X₂`, `V = X̃₁ + X₂`, `W = X₁ + X̃₁`; the two estimates give
`I₁ + I₂ + I₃ ≤ 6ηk − ((1 − 5η)/(1 − η))(2ηk − I₁)` (7.2); six applications of AC.1.10 and (5.8)
bound the summed reference distances by `(6 − 3η)k + 3(2ηk − I₁)` (7.3), computing the distance of
`W` to `X₂⁰` through `W + S = X₂ + X̃₂`. In characteristic two `U + V + W = 0` (7.4); AC.1.15 applied
to `(U, V, W)` conditioned on `S = s`, minimality (3.12) and averaging over `s` give (7.8), and
combining, `k ≤ (8η + η²)k − c(2ηk − I₁)` with `c ≥ 0` when `η(2η + 17) ≤ 3`; for `η = 1/9`,
`8η + η² = 73/81 < 1`, so `k = 0`. Over `ℤ` the statement fails: discrete Gaussians are nearly
minimal (p. 12), so the identity (7.4) is essential (Gowers–Green–Manners–Tao, §2, Proposition 2.1,
p. 6; §7, pp. 21–25).

*Needs:* AC.1.10, AC.1.12, AC.1.13, AC.1.14, AC.1.15.

### AC.1.17 The entropic polynomial Freiman–Ruzsa theorem

Prove `entropic_pfr`: for `G = 𝔽₂ⁿ` (a finite `ZMod 2`-module) and `G`-valued `X₁⁰, X₂⁰` there is a
subgroup `H ≤ G` with `d[X₁⁰ ; U_H] + d[X₂⁰ ; U_H] ≤ 11 d[X₁⁰ ; X₂⁰]`, and each of
`d[X₁⁰ ; U_H]`, `d[X₂⁰ ; U_H]` is at most `6 d[X₁⁰ ; X₂⁰]`. Take a `τ`-minimiser; AC.1.16 gives
`d[X₁ ; X₂] = 0` and AC.1.11 gives `H` with `d[X_i ; U_H] = 0`; the triangle inequality gives
`d[X_i⁰ ; U_H] = d[X_i⁰ ; X_i]`, so `η(d[X₁⁰ ; U_H] + d[X₂⁰ ; U_H]) = τ[X₁ ; X₂] ≤ τ[X₂⁰ ; X₁⁰] =
(1 + 2η) d[X₁⁰ ; X₂⁰]`, which is `11 d` at `η = 1/9`; finally
`|d[X₁⁰ ; U_H] − d[X₂⁰ ; U_H]| ≤ d[X₁⁰ ; X₂⁰]`. If `X₁⁰ = X₂⁰` is uniform on a subgroup, that subgroup
works with all distances `0` (Gowers–Green–Manners–Tao, §1, Theorem 1.8, p. 4; §2, its proof,
p. 7).

*Needs:* AC.1.3, AC.1.11, AC.1.12, AC.1.16.

### AC.1.18 Marton's conjecture in characteristic two

Prove `pfr`: if `A ⊆ 𝔽₂ⁿ` is nonempty with `|A + A| ≤ K|A|`, then `A` is covered by at most `2K¹²`
cosets of a subgroup `H ≤ 𝔽₂ⁿ` with `|H| ≤ |A|`. With `U_A` uniform on `A`, `H[U_A] = log |A|` and
`H[U_A + U_A'] ≤ log |A + A|`, so `d[U_A ; U_A] ≤ log K`; AC.1.17 gives `H` with
`d[U_A ; U_H] ≤ ½ C' log K`, `C' = 11` (B.1), hence `|log |H| − log |A|| ≤ C' log K` (B.2). By (A.2)
some `x₀` has `|A ∩ (H + x₀)| ≥ K^{−C'/2} |A|^{1/2} |H|^{1/2}`; Mathlib's Ruzsa covering lemma
covers `A` by at most `K^{C'/2 + 1}(|A|/|H|)^{1/2}` translates of
`(A ∩ (H + x₀)) − (A ∩ (H + x₀)) ⊆ H`. If `|H| ≤ |A|` this is at most `K^{C'+1}`; otherwise cover `H` by
at most `2|H|/|A|` cosets of a subgroup `H'` with `|H'| ≤ |A|`, for at most `2K^{C'+1}` cosets in all.
The exponent `12 = C' + 1`; Liao's later improvements of the constant are not part of the target.
Conversely a cover by `r` cosets of `H` with `|H| ≤ |A|` gives `|A + A| ≤ (r(r − 1)/2 + 1)|A|`, so the
theorem is polynomially sharp (p. 1), and the factor `2` is needed when `A` is most of a subgroup
(footnote 1) (Gowers–Green–Manners–Tao, §1, Conjecture 1.1 and Theorem 1.2, pp. 1–2; Appendix B,
pp. 30–31).

*Needs:* AC.1.1, AC.1.2, AC.1.17; Mathlib `Finset.ruzsa_covering_add`.

### AC.1.19 Large spectrum

Define `largeSpectrum f τ = {χ ∈ Ĝ : τ ≤ |fourier f χ|}` for `f : G → ℂ` and `τ ∈ ℝ`. The threshold is
closed and absolute; the relative `ε`-spectrum of an indicator used by Tao is
`largeSpectrum 1_A (ερ)` with `ρ = |A|/|G|`. Parseval bounds its size and the fourth-moment mass
outside it (Tao, Notes 2, §6, printed pp. 9–11, (6)–(7)).

The API:

- `mem_largeSpectrum`: `χ ∈ largeSpectrum f τ ↔ τ ≤ |fourier f χ|`.
- `largeSpectrum_antitone`: `a ≤ b → largeSpectrum f b ⊆ largeSpectrum f a`.
- `largeSpectrum_of_nonpos`: `τ ≤ 0` gives every character.
- `largeSpectrum_zero`: a positive threshold gives the empty spectrum for `f = 0`.
- `largeSpectrum_character`: for a character `ψ` and `0 < τ ≤ 1`, `largeSpectrum ψ τ = {ψ}`.
- `largeSpectrum_card_mul_sq_le`: `|largeSpectrum f τ| · τ² ≤ 𝔼 |f|²` for `τ ≥ 0`.
- `largeSpectrum_smul`: for `c ≠ 0`, `largeSpectrum (c f) (|c| τ) = largeSpectrum f τ`.
- `fourier_fourth_tail_le`: `∑_{χ ∉ largeSpectrum f τ} |fourier f χ|⁴ ≤ τ² 𝔼 |f|²`.
- `largeSpectrum_indicator_card_mul_sq_le`: `|largeSpectrum 1_A τ| · τ² ≤ ρ`.
- `fourier_indicator_fourth_tail_le`: outside `largeSpectrum 1_A (ερ)` the fourth mass is at most
  `ε² ρ³`.
- `fourier_indicator_largeSpectrum_concentration`: if `|A + A| ≤ K|A|`,
  `largeSpectrum 1_A (ρ/(2√K))` carries at least `3/4` of the fourth mass.
- `largeSpectrum_indicator_card_at_sqrt`: for nonempty `A` and `K > 0`,
  `|largeSpectrum 1_A (ρ/(2√K))| ≤ 4K/ρ`.

*Needs:* AC.0.1, AC.0.3, AC.0.8.

**Checks.**

- `largeSpectrum.test_zero_threshold`: `largeSpectrum 0 0` on `ZMod 4` is all of `Ĝ`.
- `largeSpectrum.test_positive_zero`: `largeSpectrum 0 1` on `ZMod 4` is empty.
- `largeSpectrum.test_endpoint`: `largeSpectrum ψ 1 = {ψ}` for every character `ψ`; a strict
  threshold would give `∅`.
- `largeSpectrum.test_point_mass`: the unit point mass on `ZMod 4` has full spectrum at `1/4` and
  empty spectrum at `1/3`.
- `largeSpectrum.test_nonreal_scale`: `largeSpectrum (2i · ψ) 2 = {ψ}`.

### AC.1.20 Chord-radius Bohr sets

Define `bohrSet Λ δ = {x ∈ G : |χ(x) − 1| < δ for every χ ∈ Λ}` for a finite `Λ ⊆ Ĝ` and real `δ`. An
empty family gives `G` at every radius, and a nonempty family at `δ ≤ 0` gives `∅`. Multiplicativity,
`|χ| = 1` and the triangle inequality give symmetry and the addition bounds. This is the chord
convention of Tao's (9), distinguished from the phase convention of AC.1.22 (Tao, Notes 2, §6,
printed p. 11, (9)).

The API:

- `mem_bohrSet`: membership is the strict chord inequality for every listed character.
- `bohrSet_empty`: `bohrSet ∅ δ = univ` for every `δ`.
- `bohrSet_of_nonpos`: `Λ` nonempty and `δ ≤ 0` give `∅`.
- `zero_mem_bohrSet_iff`: `0 ∈ bohrSet Λ δ ↔ 0 < δ ∨ Λ = ∅`.
- `bohrSet_mono`: increasing the radius enlarges the set.
- `bohrSet_antitone`: adding frequencies shrinks the set.
- `bohrSet_union`: `bohrSet (Λ ∪ Λ') δ = bohrSet Λ δ ∩ bohrSet Λ' δ`.
- `neg_mem_bohrSet`: `−x ∈ bohrSet Λ δ ↔ x ∈ bohrSet Λ δ`.
- `bohrSet_add_subset`, `bohrSet_sub_subset`: `bohrSet Λ δ ± bohrSet Λ ε ⊆ bohrSet Λ (δ + ε)`.
- `bohrSet_erase_one`: at a positive radius the trivial character can be erased.
- `bohrSet_pullback`: pulling characters back along `q : G →+ H` gives the preimage of their Bohr set.
- `bohrSet_eq_univ_of_two_lt`: `δ > 2` gives `G`.

*Needs:* AC.0.1.

**Checks.**

- `bohrSet.test_empty_family`: `bohrSet ∅ (−1) = univ` in `ZMod 4`.
- `bohrSet.test_zero_radius`: `bohrSet {1} 0 = ∅`; a non-strict inequality would give `G`.
- `bohrSet.test_trivial_character`: `bohrSet {1} (1/4) = univ`.
- `bohrSet.test_strict_antipode`: for the standard character of `ZMod 4`, `2 ∉ bohrSet {χ} 2`, since
  `|χ(2) − 1| = 2` exactly.
- `bohrSet.test_noncyclic_kernel`: on `ZMod 2 × ZMod 2`, the first-coordinate character at radius
  `1/4` gives `{(0, 0), (0, 1)}`.

### AC.1.21 Bogolyubov's lemma in spectral form

Prove `bohrSet_largeSpectrum_subset_double_sub_double`: for a nonempty `A ⊆ G`, `ρ = |A|/|G|`,
`K > 0` and `|A + A| ≤ K|A|`, the set `Λ = largeSpectrum 1_A (ρ/(2√K))` has `|Λ| ≤ 4K/ρ` and
`bohrSet Λ (1/4) ⊆ 2A − 2A`; moreover, on that Bohr set the real part of the inverse Fourier sum of
`|fourier 1_A|⁴` is at least `(5/16) ∑_χ |fourier 1_A χ|⁴`. There is no characteristic restriction,
and no claim that a Bohr set is a subgroup. By energy Cauchy–Schwarz the fourth mass is at least
`ρ³/K`, the complementary mass is at most `ρ³/(4K)`, so `Λ` carries at least `3/4` of it; each
character of `Λ` has `Re χ(x) > 3/4` on the Bohr set, giving `(3/4)(3/4) − 1/4 = 5/16` of the total;
and the inverse transform of `|fourier 1_A|⁴` at `x` is `|G|^{−3}` times the number of
representations `x = a₁ + a₂ − a₃ − a₄`. Tao's two inequalities after (9) use the total fourth mass
where the pointwise estimate controls only the mass on `Λ`; with the mass on `Λ` (or with `9/16` in
place of `3/4`) the argument goes through as above (Tao, Notes 2, §6, printed pp. 9–11, (5)–(9)).

*Needs:* AC.0.4, AC.0.5, AC.1.19, AC.1.20; Mathlib `Finset.le_card_add_mul_addEnergy`.

### AC.1.22 Phase-radius Bohr sets and regularity

Define `phaseBohrSet Γ ε = {x ∈ G : |arg χ(x)|/(2π) < ε_χ for every χ ∈ Γ}` for a finite `Γ ⊆ Ĝ` and
radii `ε_χ ∈ (0, 1]`, with `arg ∈ (−π, π]`. Write `d = |Γ|` and `B_η = phaseBohrSet Γ ((1 + η)ε)`.
Define `IsRegularPhaseBohr`: `B` is regular when for every `η` with `1 + η > 0` and `d|η| ≤ 1/100`,

```text
(1 − 100 d|η|) |B| ≤ |B_η| ≤ (1 + 100 d|η|) |B|,
```

with non-strict inequalities, including `η = 0` and `d = 0`. Schoen and Shkredov print both
comparisons as strict, which fails at `η = 0`, where it would demand `|B| < |B|`; the empty frequency
family has equality at every permitted scale (Schoen–Shkredov, *Roth's theorem in many variables*,
arXiv:1106.1601v1, §4, Definitions 4.1–4.2, p. 5).

The API:

- `phaseBohrSet_mem`: membership is the phase inequality for each frequency.
- `phaseBohrSet_empty`: the empty family gives `G`.
- `phaseBohrSet_mono`: coordinatewise larger radii give larger sets.
- `phaseBohrSet_neg`: the set is symmetric under negation.
- `phaseBohrSet_chord_comparison`: for a common `0 < ε ≤ 1/2`, `phaseBohrSet Γ ε = bohrSet Γ (2 sin(πε))`.
- `phaseBohrSet_card_lower`: `|B| ≥ 2^{−d} |G| ∏_χ ε_χ`.
- `phaseBohrSet_half_card`: `|B(Γ, ε)| ≤ 8^{d+1} |B(Γ, ε/2)|`.
- `isRegularPhaseBohr_zero`: at `η = 0` the regularity bounds are equalities.
- `isRegularPhaseBohr_empty`: every empty-frequency phase Bohr set is regular.

*Needs:* AC.1.20.

**Checks.**

- `phaseBohrSet.test_empty`: with `Γ = ∅` the set is `G` and regular at rank zero.
- `phaseBohrSet.test_quarter_endpoint`: the standard character of `ZMod 4` excludes `1` and `3` at
  phase radius `1/4` (their phases are exactly `±1/4`).
- `phaseBohrSet.test_half_endpoint`: at phase radius `1/2` on `ZMod 4` the antipode `2` is excluded and
  `0, 1, 3` are included.
- `phaseBohrSet.test_chord_radius`: phase radius `1/32` implies chord radius `1/4`; phase radius
  `1/20` does not, since the phase `1/24` has chord `2 sin(π/24) > 1/4`.
- `IsRegularPhaseBohr.test_stable_scale`: on `ZMod 4` at rank one and phase radius `1/8`, every
  allowed relative perturbation has the same singleton Bohr set, so the regularity bounds hold.
- `IsRegularPhaseBohr.test_jump`: at radius `1/4` the same set has one point, but multiplication of
  the radius by `1 + 1/1000` gives three; `3 > 1.1` violates the upper regularity bound. This check
  and the previous one are stated together as `isRegularPhaseBohr_zmod_four` in `Suggested.lean`.
- `IsRegularPhaseBohr.test_rank_zero`: an empty frequency set is regular for every allowed
  scale perturbation, since both sides have exactly `|G|` points and the rank term is zero.

The two volume bounds have short proofs that use nothing about the characters beyond `|χ| = 1`
and multiplicativity, so they hold for nonfaithful families (characters with a common kernel) as
well. For `phaseBohrSet_half_card`, split each phase interval `(−ε_χ, ε_χ)` into four half-open
intervals of length `ε_χ/2`; two points whose phase vectors lie in the same cell differ by an
element of `B(Γ, ε/2)`, so `|B(Γ, ε)| ≤ 4^d |B(Γ, ε/2)|`, which is stronger than the printed
`8^{d+1}`. For `phaseBohrSet_card_lower`, cover the torus `(ℝ/ℤ)^d` by `∏_χ ⌈1/ε_χ⌉ ≤ 2^d ∏_χ ε_χ^{−1}`
boxes of sides `ε_χ`; one box contains the phase vectors of at least `|G| 2^{−d} ∏_χ ε_χ` points, and
their differences with a fixed one lie in `B(Γ, ε)`. Schoen and Shkredov state both bounds without
proof (Lemmas 4.4–4.5, p. 6).

### AC.1.23 Regular Bohr shrinking and translation

Prove `regularBohr_shrink`: for every phase Bohr set `B(Γ, ε)` there is `r ∈ [1/2, 1]` with
`B(Γ, rε)` regular. If `d = |Γ| ≥ 1`, `B` is regular, `0 < κ ≤ 1` and `B' = B(Γ, ε')` with
`0 < ε'_χ ≤ κ ε_χ/(100 d)`, then every `h ∈ B'` has `|(B + h) △ B| ≤ 2κ|B|`, and with the probability
densities `μ_B = (|G|/|B|) 1_B`, `𝔼 |μ_B ∗ μ_{B'} − μ_B| ≤ 2κ`. At `d = 0`, `B = G` and the translation
error is exactly zero, so no division by `d` occurs; nonempty Bohr sets contain `0`. The half-scale
volume bound and a covering argument in the logarithm of the common scale find a regular scale; the
inclusions `B_{−κ/(100d)} ⊆ B ∩ (B + h) ⊆ B ∪ (B + h) ⊆ B_{κ/(100d)}` bound the symmetric difference,
and averaging over `B'` gives the convolution estimate (Schoen–Shkredov, §4, Lemmas 4.3–4.7,
pp. 5–6). The existence of a regular scale is `exists_isRegularPhaseBohr`.

Schoen and Shkredov state the existence of a regular scale (Lemma 4.3, p. 6) without proof. The
proof contract, with every constant explicit, is as follows. Let `d = |Γ| ≥ 1` (for `d = 0` every
scale is regular) and `G(u) = log |B(Γ, e^u ε)|` for `u ∈ [−log 2, 0]`.

1. `G` is nondecreasing, and `G(0) − G(−log 2) ≤ (d + 1) log 8` by `phaseBohrSet_half_card`.
2. Covering on the line (`exists_regular_scale_of_covering`): let `I = [−(3/4) log 2, −(1/4) log 2]`
   and `K = 24(d + 1)`. If every `u ∈ I` were the centre of an interval `(u − h_u, u + h_u)` with
   `0 < h_u ≤ (1/4) log 2` and `G(u + h_u) − G(u − h_u) > K h_u`, take a minimal finite subcover of
   `I`; ordered by left endpoints, its odd-numbered and its even-numbered members are pairwise
   disjoint, so one of these two subfamilies has total length at least `|I|/2 = (1/4) log 2`. The
   intervals lie in `[−log 2, 0]`, so summing the increments of `G` over that subfamily gives
   `(d + 1) log 8 ≥ G(0) − G(−log 2) > (K/8) log 2 = (d + 1) log 8`, a contradiction.
3. Hence some `u₀ ∈ I` has `|G(u₀ + h) − G(u₀)| ≤ 24(d + 1)|h|` for all `|h| ≤ (1/4) log 2`; put
   `r = e^{u₀} ∈ [2^{−3/4}, 2^{−1/4}] ⊆ [1/2, 1]`.
4. Regularity at `rε`: for `1 + η > 0` with `d|η| ≤ 1/100`, `h = log(1 + η)` has
   `|h| ≤ (100/99)|η|`, so `x = 24(d + 1)|h| ≤ 48.5 d|η| ≤ 0.485`; then
   `e^{−x} ≥ 1 − x ≥ 1 − 100 d|η|` and, by convexity, `e^{x} ≤ 1 + 1.29x ≤ 1 + 100 d|η|`, which are
   the two inequalities of `IsRegularPhaseBohr`.

The translation estimate follows Schoen–Shkredov's proof of Lemma 4.7 (p. 6): for `h ∈ B'`,
`B_{−κ/(100d)} ⊆ B ∩ (B + h)` and `B ∪ (B + h) ⊆ B_{κ/(100d)}`, and regularity at `η = ±κ/(100d)`
bounds both outer sets by `(1 ± κ)|B|`, giving `|(B + h) △ B| ≤ 2κ|B|`; averaging over `h ∈ B'`
gives the convolution estimate.

*Needs:* AC.0.2, AC.1.22.

### AC.1.24 Fourier density increment on a Bohr translate

Prove `bohr_density_increment`: let `A ⊆ G` have density `0 < α < 1`, and let a nontrivial character
`χ` satisfy `|fourier 1_A χ| ≥ η > 0`. If `χ ∈ Λ` and `0 < r ≤ 1/2`, then `B = bohrSet Λ r` is nonempty
and some translate `x − B` has `A`-density at least `α + η²/(4α)`. There is no torsion-free or prime
modulus assumption. With `h = 1_A ∗ μ_B` one has `0 ≤ h ≤ 1`, `𝔼 h = α`, and the near-constancy of
`χ` on `B` gives `|fourier μ_B χ| ≥ 1 − r ≥ 1/2`; Parseval gives `𝔼 (h − α)² ≥ η²/4`, and since
`𝔼 h² ≤ (max h) α`, some value is at least `α + η²/(4α)`. When a regular phase Bohr set is wanted,
convert conventions (AC.1.22) and use AC.1.23 (Tao, Notes 2, §6, printed pp. 9–11; the variance
step is the direct Fourier corollary).

*Needs:* AC.0.3, AC.0.4, AC.1.20, AC.1.23.

### AC.1.25 Generalised arithmetic progressions

Define the structure `GeneralizedAP G d`: a base `a ∈ G`, steps `v : Fin d → G` and lengths
`L : Fin d → ℕ`. Its parameter box is `∏_i {0, …, L_i}`, its evaluation is `a + ∑_i n_i v_i`, its
carrier is the image of the box, and its volume is `∏_i (L_i + 1)`. It is proper when evaluation is
injective on the box. `G` may be infinite and may have torsion; rank zero is a singleton of volume
one (Tao, Notes 2, §3, printed pp. 4–5, and §8, printed pp. 14–19: volume counts parameters, not
points, and proper and improper progressions are distinguished).

The API:

- `GeneralizedAP.point`: the evaluation `a + ∑ n_i v_i`.
- `GeneralizedAP.box`, `GeneralizedAP.carrier`: the parameter box and the finite set of points.
- `GeneralizedAP.IsProper`: evaluation is injective on the box.
- `GeneralizedAP.mem_carrier`: `x` is in the carrier iff it is the evaluation of a parameter in the box.
- `GeneralizedAP.volume`: `∏ (L_i + 1)`.
- `GeneralizedAP.card_le_volume`: the carrier has at most `volume` points.
- `GeneralizedAP.card_eq_volume_iff`: equality iff the progression is proper.
- `GeneralizedAP.translate`: translation changes the base and preserves properness and volume.
- `GeneralizedAP.map`: an additive homomorphism maps base and steps; an injective one preserves
  properness.
- `GeneralizedAP.freiman_compatibility`: a Freiman homomorphism of order two on the carrier preserves
  every relation `x₁ + x₂ = x₃ + x₄` among its points, and a Freiman isomorphism also reflects them.

*Needs:* Mathlib `Finset.image`, `Fintype.piFinset`, `IsAddFreimanHom`, `IsAddFreimanIso`.

**Checks.**

- `GeneralizedAP.test_rank_zero`: the box has its unique empty tuple, its evaluation is `a`,
  the carrier is `{a}`, volume is one and the progression is proper.
- `GeneralizedAP.test_interval`: in `ℤ`, base `3`, step `2`, length `2` has box `{0,1,2}`,
  evaluated as `3,5,7`; its carrier is `{3,5,7}`, volume `3`, and it is proper.
- `GeneralizedAP.test_zero_step`: with base zero, a zero step of length one has box `{0,1}`,
  both parameters evaluate to zero, the carrier has one point and volume two, so it is improper.
- `GeneralizedAP.test_torsion_wrap`: in `ZMod 2`, step `1` of length `2` is improper: volume three,
  two points.

### AC.1.26 The Balog–Szemerédi–Gowers theorem

Prove `balog_szemeredi_gowers`: there are absolute constants `c > 0` and `C ≥ 1` such that for every
abelian group `G`, nonempty finite `A ⊆ G` and `K ≥ 1` with `E(A, A) ≥ |A|³/K`, some `A' ⊆ A` has
`|A'| ≥ c K^{−C} |A|` and `|A' + A'| ≤ c^{−1} K^C |A'|`. The constants do not depend on `G`, its
torsion or `|A|`; polynomial dependence on `K` is part of the target, no particular exponent is
claimed. Energy yields a bipartite graph with polynomially many edges whose popular differences
form a set of polynomial size; the quantitative bipartite path argument selects large `A', B'` with
`A' − B'` small; Ruzsa's triangle inequality and Plünnecke's inequality give the doubling bound for
`A'` (Tao, Notes 3, §§1–2, printed pp. 1–7: Theorem 1.1, Lemma 2.1 and the quantitative
Theorem 2.2).

*Needs:* Mathlib `Finset.addEnergy`, `Finset.addEnergy_eq_sum_sq`,
`Finset.ruzsa_triangle_inequality_sub_sub_sub`, `Finset.pluennecke_ruzsa_inequality_nsmul_sub_nsmul_add`.

### AC.1.27 Ruzsa's modelling lemma

Prove `ruzsa_modelling`: for each `K ≥ 1` there is `C(K) ≥ 1` such that every nonempty finite `A` in a
torsion-free abelian group with `|A + A| ≤ K|A|` has a subset `A'` with `|A'| ≥ |A|/8`, an integer
`|A| ≤ N ≤ C(K)|A|` and a Freiman isomorphism of order `8` from `A'` onto some `B ⊆ ZMod N`; so `B` has
density at least `1/(8C(K))`. The isomorphism concerns sums of eight points of the selected sets; no
embedding of groups is claimed. Reduce the group generated by `A` to a free abelian group of finite
rank, choose an integer linear map separating the finite relation set, control `8A − 8A` by
Plünnecke, and reduce modulo `N` on a suitable interval of the circle so that no eight-term relation
appears or wraps (Tao, Notes 2, §5, printed pp. 6–8).

*Needs:* Mathlib `IsAddFreimanIso`, `Finset.pluennecke_ruzsa_inequality_nsmul_sub_nsmul_add`.

### AC.1.28 A proper progression in a cyclic Bohr set

Prove `cyclic_bohr_contains_proper_gap`: for each `d` there is `c_d > 0` such that, for `N ≥ 1`, at
most `d` characters `Γ` of `ZMod N` and a common phase radius `0 < ρ ≤ 1/4`, the phase Bohr set
`B(Γ, ρ)` contains a proper generalised arithmetic progression of rank at most `d + 1` with at least
`c_d ρ^d N` points, where one may take `c_d = 2^{−(d+2)}(d + 1)^{−(d+1)}`. The statement is for cyclic
groups only, and the progression is proper by construction, so no properisation is needed.

Proof contract. Write the characters as `x ↦ e(xξ_j/N)` with integers `0 ≤ ξ_j < N`, `j ≤ d` (pad
with the trivial character). Let `L ⊆ ℝ^{d+1}` be the lattice generated by `ℤ^{d+1}` and
`v = (1/N, ξ₁/N, …, ξ_d/N)`. Because the first coordinate of `v` is `1/N`, `v` has order exactly `N`
modulo `ℤ^{d+1}`, so `L` has covolume `1/N` and `ψ(m + yv) = y mod N` is a well-defined surjective
homomorphism `L → ZMod N` with kernel `ℤ^{d+1}`. Let `K = [−1/4, 1/4] × [−ρ/2, ρ/2]^d`, a centrally
symmetric convex body of volume `ρ^d/2`.

1. Injectivity: two points of `L ∩ K` with the same image differ by an integer vector in
   `2K = [−1/2, 1/2] × [−ρ, ρ]^d`, which is `0` because `ρ ≤ 1/4 < 1`.
2. Containment: if `u = m + yv ∈ K` then `‖yξ_j/N‖ ≤ ρ/2 < ρ` for every `j`, so `ψ(u) ∈ B(Γ, ρ)`.
3. Minkowski's second theorem (`minkowski_second_upper`) gives the successive minima
   `λ₁ ≤ ⋯ ≤ λ_{d+1}` of `K` with respect to `L`, attained by linearly independent `b_i ∈ L ∩ λ_i K`,
   with `∏ λ_i ≤ 2^{d+1}(1/N)/(ρ^d/2) = 2^{d+2}/(Nρ^d)`.
4. Put `M_i = ⌊1/((d + 1)λ_i)⌋`. Every `∑ n_i b_i` with `|n_i| ≤ M_i` lies in `∑ |n_i| λ_i K ⊆ K`; the
   `b_i` are linearly independent and `ψ` is injective on `L ∩ K`, so the images form a proper
   progression of rank `d + 1` in `B(Γ, ρ)`: base `−∑ M_i ψ(b_i)`, steps `ψ(b_i)` and lengths `2M_i` in
   the `GeneralizedAP` convention.
5. Since `2⌊t⌋ + 1 ≥ t` for `t ≥ 0`, it has `∏(2M_i + 1) ≥ ∏ 1/((d + 1)λ_i) ≥ Nρ^d/(2^{d+2}(d + 1)^{d+1})`
   points.

The first coordinate is what makes `ψ` injective on the box. Tao's argument treats the map
`x ↦ (χ(x))_χ` as injective, which fails when the characters have a common kernel (on `ZMod 4` with
only the trivial character every point has the same image); the cyclic coordinate costs one unit of
rank. Tao's opening display of §7 also scales the phase radius by `N` and binds the wrong variable:
the intended set is `{x ∈ ZMod N : ‖xξ/N‖ < δ for every ξ ∈ Λ}`, with `δ = 1/32` (any `δ` with
`2 sin(πδ) ≤ 1/4`) rather than `1/20` when it must sit inside the chord set of radius `1/4`. The
greedy successive-minima argument is Tao's (Notes 2, §7, printed pp. 11–13); Minkowski's second
theorem replaces his volume-packing step, as his closing remark there suggests.

*Needs:* AC.1.22, AC.1.25; GeometryOfNumbersAndQuadraticArithmetic Layer 1.5
(`minkowski_second_upper`).

### AC.1.29 Properisation

Prove `progression_properization`: for each `d` there is `C_d ≥ 1` such that every rank-`d`
generalised arithmetic progression in a torsion-free abelian group is contained in a proper
progression of rank at most `d` and volume at most `C_d` times the original volume. Represent the
parameter map on `ℤ^d`; if it is not injective on the enlarged box, pass to the lattice quotient by a
primitive kernel relation, of lower rank, and bound the new volume with the successive minima of the
reduced convex body; iterate at most `d` times (Tao, Notes 2, §8, Theorem 8.1, printed pp. 14–19).
The induction runs over pairs (a large progression `P` of rank `k`, a small progression `Q` of
bounded rank and size), ordered by rank of `P`, then rank of `Q`, then volume of `P`
(Proposition 8.4, printed p. 15): (i) if `P` is improper, a primitive kernel vector `w` of the
rescaled parameter lattice either is short, and then a progression of the same rank and smaller
volume covers `P` (printed pp. 16–17), or is not, and then projecting along `w` gives a lattice of
rank `k − 1` whose successive-minimum basis covers `P` up to a bounded convolution, with volume
`O_k(vol P)` by Cramer's rule and the covolume bound (printed pp. 17–18); (ii) if `P` is proper but
`Q + P` is not, a collision reduces the rank of `Q` (printed pp. 18–19). Each step multiplies the
volume by a constant depending only on the ranks, and there are at most `d + rank Q` rank
reductions, so `C_d` exists.

*Needs:* AC.1.25; GeometryOfNumbersAndQuadraticArithmetic Layer 1.5 (`minkowski_second_upper`).

### AC.1.30 Freiman's theorem in torsion-free groups

Prove `freiman_torsion_free`: for every `K ≥ 1` there are `D(K) ∈ ℕ` and `C(K) ≥ 1` such that every
nonempty finite `A` in a torsion-free abelian group with `|A + A| ≤ K|A|` lies in a proper generalised
arithmetic progression of rank at most `D(K)` and volume at most `C(K)|A|`. Torsion-freeness is
essential, and the functions `D, C` are not claimed optimal. Model a large part of `A` in a cyclic
group (AC.1.27); Bogolyubov (AC.1.21) and AC.1.28 put a large proper progression in `2B − 2B`; pull it
back, cover `A` by boundedly many translates with Ruzsa's covering lemma, absorb the translates into
a progression and properise (AC.1.29) (Tao, Notes 2, Theorem 3.1, printed p. 4; §§4–8, printed
pp. 5–19; Theorem 8.1, printed p. 14).

*Needs:* AC.1.21, AC.1.27, AC.1.28, AC.1.29; Mathlib `Finset.ruzsa_covering_add`.

### AC.1.31 Freiman's theorem for groups of bounded exponent

Prove `freiman_bounded_exponent`: for every positive integer `r` and `K ≥ 1` there is `C(r, K) ≥ 1` such
that for every abelian group `G` of exponent dividing `r` and every nonempty finite `A ⊆ G` with
`|A + A| ≤ K|A|`, some finite subgroup `H` and some `x` have `A ⊆ x + H` and `|H| ≤ C(r, K)|A|`. The
bound is independent of the rank of `G`; no polynomial bound in `K` is asserted. Translate so that
`0 ∈ A`; Ruzsa's covering lemma and Plünnecke bound a generating set of size polynomial in `K` after
boundedly many sumset steps; the subgroup it generates has order bounded in terms of `r` and that
size. For exponent `2` the much sharper AC.1.18 holds; it is not a restatement of this containment
(Tao, Notes 2, §2, Theorem 2.1 and proof, printed pp. 2–4).

*Needs:* Mathlib `Finset.ruzsa_covering_add`, `Finset.pluennecke_ruzsa_inequality_nsmul_add`.

### AC.1.32 The quasi-polynomial Bogolyubov lemma in cyclic groups

Prove `quasipolynomial_bogolyubov`: there is an absolute `C ≥ 1` such that for `N ≥ 1`, `K ≥ 1` and
`A ⊆ ZMod N` with `|A| ≥ N/K`, some set `S` of frequencies with `|S| ≤ C log(2K)^C` and some `ρ` with
`1/ρ ≤ C log(2K)^C` satisfy `{x : ‖xξ/N‖_{ℝ/ℤ} ≤ ρ for every ξ ∈ S} ⊆ 2A − 2A`. The rank and the inverse
radius are polylogarithmic in `K`; AC.1.21 gives rank `O(K)`, which would make every bound of the
inverse theorem (AC.3.17) exponential instead of quasi-polynomial. The phase condition here is
closed, as in Leng–Sah–Sawhney's Definition A.3; it contains the strict phase Bohr set of AC.1.22 at
the same radius. Route: Sanders' Bogolyubov–Ruzsa lemma puts a proper symmetric coset progression of
dimension `O(log⁶ 2K)` and size `exp(−O(log⁶ 2K · log log 2K))|A|` inside `2A − 2A` (Sanders, *On the
Bogolyubov–Ruzsa lemma*, Anal. PDE 5 (2012), arXiv:1011.0107, Theorem 1.1, p. 1; proved from the
Croot–Sisask almost-periodicity lemma and a local Chang lemma in Bohr sets, §§3–10); in `ZMod N` a
large symmetric coset progression contains a Bohr set of comparable rank and radius (Milićević,
*A bilinear Bogolyubov argument in abelian groups*, arXiv:2109.03093v3, Proposition 28,
pp. 22–23, and Corollary 29, p. 23). Leng–Sah–Sawhney record the combination as Lemma A.4 of the inverse paper (p. 76),
which is the form consumed here.

*Needs:* AC.1.20, AC.1.25; Mathlib `Finset.pluennecke_ruzsa_inequality_nsmul_sub_nsmul_add`,
`Finset.ruzsa_covering_add`.

### Examples

- `𝔽₂²` with `X` uniform on `{0, e₁, e₂}`: `X + X'` takes `0` with probability `1/3` and each of
  `e₁, e₂, e₁ + e₂` with probability `2/9`, so `d[X ; X] = (1/3) log 3 + (2/3) log(9/2) − log 3 =
  (2/3) log(3/2)`.
- Marton for a subgroup: if `A = H` is a subgroup then `K = 1`, one coset suffices, and
  `d[U_A ; U_H] = 0`.
- Bohr sets on `ZMod 4` with the standard character `χ`: `bohrSet {χ} δ` is `{0}` for `0 < δ ≤ √2`,
  `{0, 1, 3}` for `√2 < δ ≤ 2` and `G` for `δ > 2`; `phaseBohrSet {χ} ε` is `{0}` for `0 < ε ≤ 1/4`,
  `{0, 1, 3}` for `1/4 < ε ≤ 1/2` and `G` for `ε > 1/2`.
- In `ℤ`, `A = {0, 1, …, n − 1}` has `|A + A| = 2n − 1 < 2|A|` and is itself a proper progression of
  rank `1`, the trivial case of AC.1.30.

### Dependencies

AC.0; Mathlib (entropy summand, measures and independence, Plünnecke–Ruzsa, Ruzsa covering, Freiman
homomorphisms, additive energy); GeometryOfNumbersAndQuadraticArithmetic Layer 1.5.

## Layer AC.3: Gowers norms, nilsequences and the inverse theorem

This layer builds the higher-order Fourier analysis that the density-increment proof of
Szemerédi's theorem (AC.2), the transference argument (AC.4) and the prime-pattern theorems (AC.5)
run on. It defines complex Gowers cubes and uniformity norms on finite abelian groups, on integer
intervals and on integer boxes, and proves their basic inequalities. It then defines degree
filtrations, filtered polynomial sequences, filtered nilmanifolds with rational adapted Mal'cev
bases, the Mal'cev metric and bounded nilsequences, horizontal and vertical characters,
smoothness and equidistribution, and states the four analytic theorems: the quasipolynomial inverse
theorem of Leng, Sah and Sawhney on intervals, its multiparameter box form from Kai's appendix,
Leng's efficient equidistribution theorem, and the Green–Tao factorisation of polynomial orbits. The
selected route is finite and quantitative throughout: no ultralimit argument and no inverse theorem
over finite fields is used. Lie theory comes from TauCetiRoadmap's RepresentationTheory/LieGroups,
specialised to nilpotent groups in AC.3.10.

### AC.3.1 Gowers cubes and uniformity norms

Define, for `d ≥ 1` and a family `f : {0,1}^d → (G → ℂ)` on a finite abelian group,

```text
gowersInnerProduct f = 𝔼_{x, h₁, …, h_d ∈ G} ∏_{ω ∈ {0,1}^d} C^{|ω|} f_ω(x + ω₁h₁ + ⋯ + ω_d h_d),
```

where `C` is complex conjugation and `|ω|` the number of ones (the vertex is `cubeVertex ω h` and the
conjugation is `parityConj ω`). Define `gowersNorm d f` as the
nonnegative real `2^d`-th root of the real part of the diagonal cube `gowersInnerProduct (fun _ ↦ f)`.
The diagonal cube is real and nonnegative (pair the vertices in the last direction); a mixed cube
need not be. `U¹(f) = |𝔼 f|` is a seminorm and not a norm; `U^d` is a norm for `d ≥ 2` (AC.3.5). Green
and Tao's cube is real-valued; the complex convention with conjugation by vertex parity is the one
of Leng–Sah–Sawhney (Green–Tao, *The primes contain arbitrarily long arithmetic progressions*,
arXiv:math/0404188, §5, Definition 5.1 and (5.2)–(5.4), pp. 11–12; Leng–Sah–Sawhney, *Quasipolynomial
bounds on the inverse theorem for the Gowers `U^{s+1}[N]`-norm*, arXiv:2402.17994v3, Definition 1.1,
p. 1).

The API:

- `gowersInnerProduct_const`: for constants `c_ω` the cube is `∏_ω C^{|ω|} c_ω`.
- `gowersInnerProduct_nonneg_of_indep_last`: a cube in dimension `d + 1` whose two functions in the
  last direction agree is real and nonnegative.
- `gowersNorm_pow_eq`: for `d ≥ 1`, `‖f‖_{U^d}^{2^d}` is the real part of the diagonal cube.
- `gowersNorm_nonneg`: the norm is nonnegative.
- `gowersNorm_one`: the constant `1` has `U^d` norm `1`.
- `gowersNorm_U1`: `‖f‖_{U¹} = |𝔼 f|`.
- `gowersNorm_character`: a nontrivial character has `U¹` norm `0` and `U^d` norm `1` for `d ≥ 2`.
- `gowersNorm_U2_fourier`: `‖f‖_{U²}⁴ = ∑_χ |fourier f χ|⁴` with the normalisation of AC.0.
- `gowersNorm_translate`: translation preserves every `U^d`.
- `gowersNorm_smul`: `‖c f‖_{U^d} = |c| ‖f‖_{U^d}`.

*Needs:* AC.0.1; Mathlib `Finset.expect`.

**Checks.**

- `gowersNorm.test_mean`: on `ZMod 2`, `f(0) = 1`, `f(1) = −1` has `U¹` norm `0` and `U²` norm `1`.
- `gowersNorm.test_complex_character`: the standard nonreal character of `ZMod 3` has `U²` norm `1`;
  omitting the conjugations gives a different cube.
- `gowersInnerProduct.test_negative_mixed`: for `d = 1` and constants `f₀ = 1`, `f₁ = −1`, the mixed
  cube is `−1`.
- `gowersNorm.test_point_mass`: for the unit point mass on `ZMod 2`, `‖f‖_{U²}⁴ = 1/8`, the sum of
  the two Fourier fourth powers `(1/2)⁴ + (1/2)⁴`.
- `gowersNorm.test_imaginary_scalar`: on `ZMod 2` the constant `3i` has `U¹` norm `3`; taking a real part
  before the absolute value in the order-one case would give `0`.
- `cubeVertex.test_zero`: the all-false vertex gives `0`, regardless of the directions.
- `cubeVertex.test_two_directions`: with directions `1, 2` in `ZMod 5`, the vertices give
  `0, 1, 2, 3`, respectively; the all-true vertex uses addition, not multiplication.
- `parityConj.test_two_terms`: at order one, `1 + i` is unchanged at the false vertex and becomes
  `1 − i` at the true vertex; at the all-true order-two vertex it is unchanged again.

### AC.3.2 The Gowers–Cauchy–Schwarz inequality

Prove `gowers_cauchy_schwarz`: for `d ≥ 1`, `|gowersInnerProduct f| ≤ ∏_ω ‖f_ω‖_{U^d}`. Apply the
Cauchy–Schwarz inequality successively in each direction, changing variables by translations; the
conjugations produce diagonal nonnegative cubes (Green–Tao, §5, (5.5)–(5.7), pp. 12–13, and the repeated
Cauchy–Schwarz of Proposition 5.3, pp. 14–19, carried over to the conjugated complex cube).

*Needs:* AC.3.1.

### AC.3.3 The triangle inequality

Prove `gowersNorm_add_le`: `‖f + g‖_{U^d} ≤ ‖f‖_{U^d} + ‖g‖_{U^d}` for `d ≥ 1`. Expand the diagonal cube
multilinearly, bound every mixed term by AC.3.2, and take roots (Green–Tao, §5, (5.5)–(5.7), pp. 12–13).

*Needs:* AC.3.2.

### AC.3.4 Monotonicity

Prove `gowersNorm_mono`: `‖f‖_{U^d} ≤ ‖f‖_{U^{d+1}}` for `d ≥ 1`. With `Δ_h f` the iterated
multiplicative derivative in the first `d − 1` directions, `‖f‖_{U^d}^{2^d} = 𝔼_h |𝔼 Δ_h f|²` and
`‖f‖_{U^{d+1}}^{2^{d+1}} = 𝔼_h ‖Δ_h f‖_{U²}⁴`; since `|𝔼 g|⁴ ≤ ‖g‖_{U²}⁴`, Cauchy–Schwarz on the
average over `h` gives `‖f‖_{U^d}^{2^{d+1}} ≤ ‖f‖_{U^{d+1}}^{2^{d+1}}` (Green–Tao, §5, (5.5)–(5.7),
pp. 12–13).

*Needs:* AC.3.1.

### AC.3.5 `U^d` is a norm for `d ≥ 2`

Prove `gowersNorm_eq_zero_iff`: for `d ≥ 2`, `‖f‖_{U^d} = 0 ↔ f = 0`. At `d = 2` this is
`∑_χ |fourier f χ|⁴ = 0` and Fourier inversion; higher `d` follow by monotonicity. At `d = 1` it fails:
every nonzero mean-zero function has `U¹` norm `0` (Green–Tao, §5, (5.5)–(5.7), pp. 12–13).

*Needs:* AC.0.1, AC.3.1, AC.3.4.

### AC.3.6 Interval and box Gowers norms

For `d ≥ 1`, define `intervalGowersNorm d N f` for `f : ℤ → ℂ`: zero-extend `f` restricted to `[N] = {1, …, N}`
(the predicate `inInterval d N` on residues)
into `ZMod M` with `M ≥ 2^d N`, and divide its `U^d` norm by the `U^d` norm of `1_{[N]}` computed in
the same group; the ratio is `U^d[N](f)`. Define `boxGowersNorm d ℓ N f` for `f : ℤ^ℓ → ℂ` on the box
`[−N, N]^ℓ` in the same way inside `(ZMod M)^ℓ`, `M ≥ 2^d(2N + 1)`. The admissible size prevents cube
relations from wrapping, so cube counts and the indicator normalisation scale together and the
ratios do not depend on `M`. The empty interval (`N = 0`) has norm `0`; a zero-dimensional box is a
single point. Values outside the interval or box are ignored. These are the norms of the integer
inverse theorems; no finite-field norm is substituted for them (Leng–Sah–Sawhney, inverse paper,
Definition 1.1 and the remark after it, p. 1; Kai, *Linear patterns of prime elements in number
fields*, arXiv:2306.16983v5, Appendix A, Theorem A.1, and Appendix D.1, pp. 59–60 and 69–70, for the
box).

The API:

- `intervalGowersNorm`, `boxGowersNorm`: the definitions, with the canonical moduli `2^d N + 1` and
  `2^d(2N + 1) + 1`.
- `intervalGowersNorm_independent_modulus`, `boxGowersNorm_independent_modulus`: every admissible
  modulus gives the same ratio, for `d ≥ 1` and a nonempty domain. The indicator norm is positive
  because its mean is positive and the norms are monotone in the order.
- `intervalGowersNorm_zero`: the empty interval has norm `0`.
- `intervalGowersNorm_one`: for `N ≥ 1`, the constant `1` on `[N]` has norm `1`.
- `boxGowersNorm_one`: the constant `1` on every nonempty box has norm `1`.
- `boxGowersNorm_dim_zero`: for `ℓ = 0` the norm is the absolute value at the unique point.
- `intervalGowersNorm_smul`: the norm scales by `|c|`.
- `intervalGowersNorm_affine_reindex`: an injective affine parametrisation of a finite progression
  transports its interval norm exactly.

*Needs:* AC.3.1.

**Checks.**

- `intervalGowersNorm.test_empty`: `N = 0` gives `0` even for an ambient constant function.
- `intervalGowersNorm.test_singleton`: for `N = 1` and value `2i`, every `d ≥ 1` gives `2`.
- `intervalGowersNorm.test_normalization`: the constant `1` on `[2]` has ratio `1`, while the
  unnormalised `U^d` norm of its zero extension is less than `1`.
- `boxGowersNorm.test_dim_zero`: at `ℓ = 0` the value `−3i` has norm `3`.
- `boxGowersNorm.test_modulus`: for `[2]`, `d = 2` and `f = 1_{[2]}`, the moduli `8` and `9` both give
  normalised norm `1`.
- `intervalGowersNorm.test_order_zero_excluded`: at `d = 0`, `N = M = 1`, the size inequality
  `2^d N ≤ M` holds but the representative `1` is absent modulo `1`: that ratio is `0/0 = 0`,
  whereas the canonical modulus `2` gives `1`. The modulus comparison requires positive order.
- `boxGowersNorm.test_singleton`: on the singleton box `N = 0`, `ℓ = 1`, the zero function has
  norm `0`, while the constant `2i` has norm `2`.
- `inInterval.test_representatives`: at `d = 2`, `N = 2` (modulus `9`), representatives `1` and `2`
  belong, and `0` and `3` do not; this distinguishes `[N]` from `{0, …, N − 1}`.

### AC.3.7 Degree filtrations

Define the structure `DegreeFiltration G s`: subgroups `G_i` (`i ∈ ℕ`) of a group `G` with
`G₀ = G₁ = G`, `G_{s+1} = {1}`, `G_j ≤ G_i` for `i ≤ j`, and `[G_i, G_j] ≤ G_{i+j}` with
`[x, y] = x⁻¹y⁻¹xy`. Nesting makes every `G_i` with `i ≥ s + 1` trivial; `s = 0` forces `G` trivial.
The equality `G₀ = G₁` is part of a degree filtration, not of a general filtration. Lie and lattice
conditions belong to the nilmanifold (AC.3.11), not to the filtration (Leng–Sah–Sawhney, inverse
paper, §2.2, Definitions 2.3–2.4, pp. 6–7).

The API:

- `DegreeFiltration.level`: the subgroup `G_i`.
- `DegreeFiltration.zero_eq_top`, `DegreeFiltration.one_eq_top`: `G₀ = G₁ = G`.
- `DegreeFiltration.antitone`: `i ≤ j → G_j ≤ G_i`.
- `DegreeFiltration.comm_mem`: commutators of `G_i` and `G_j` lie in `G_{i+j}`.
- `DegreeFiltration.above_degree`: `s < i → G_i = ⊥`.
- `DegreeFiltration.pullback`: an injective homomorphism pulls a degree filtration back, preserving
  its degree and commutator law.
- `DegreeFiltration.degree_one_iff`: a degree-one filtration exists exactly when `G` is commutative.

*Needs:* Mathlib `Subgroup`, `commutatorElement`, `Group.IsNilpotent`.

**Checks.**

- `DegreeFiltration.test_abelian`: the standard degree-one filtration of a commutative group has
  `G₀ = G₁ = G` and `G_i` trivial for `i ≥ 2`.
- `DegreeFiltration.test_heisenberg`: the real Heisenberg group has `G₂` its centre and `G₃` trivial;
  commutators of `G₁` can be nontrivial, so no degree-one filtration exists.
- `DegreeFiltration.test_degree_zero`: a nontrivial group has no degree-zero filtration.

### AC.3.8 Filtered polynomial sequences

Define `filteredDerivative h g n = g(n + h) g(n)⁻¹` for `g : ℤ^ℓ → G`, its iterates along a list of
directions, and `IsFilteredPolynomial F g`: every `r`-fold iterated derivative, for every list of `r`
directions and every base point, lies in `G_r`; the zero-fold condition is `g(n) ∈ G₀`. The order of
the iterated derivatives matters because `G` need not be commutative. The algebraic definition also
makes sense at `ℓ = 0`; the analytic endpoints use `ℓ ≥ 1` (Leng–Sah–Sawhney, inverse paper, §2.2,
Definitions 2.5–2.6, pp. 7–8; for the standard degree filtration on the domain, derivatives in
arbitrary directions give this description).

The API:

- `filteredDerivative`, `iteratedFilteredDerivative`: the derivative and its iterates (the empty list
  returns `g`).
- `IsFilteredPolynomial`: every derivative of list length `r` lands in `G_r`.
- `IsFilteredPolynomial.const`: constant sequences in `G` are polynomial.
- `IsFilteredPolynomial.shift`, `IsFilteredPolynomial.affine`: translation and integer affine
  reparametrisation of the domain preserve polynomiality.
- `IsFilteredPolynomial.mul`, `IsFilteredPolynomial.inv`: pointwise products and inverses of
  polynomial sequences are polynomial.
- `IsFilteredPolynomial.map`: a filtration-preserving homomorphism maps polynomial sequences to
  polynomial sequences.

*Needs:* AC.3.7.

**Checks.**

- `IsFilteredPolynomial.test_linear`: on additive `ℝ` with the degree-one filtration, `g(n) = a + bn`
  is polynomial.
- `IsFilteredPolynomial.test_quadratic`: `g(n) = n²` on additive `ℝ` is not polynomial for the
  degree-one filtration: its second derivative is `2`.
- `IsFilteredPolynomial.test_quadratic_degree_two`: the same sequence is polynomial for the degree-two
  filtration with `G₂ = ℝ` and `G₃ = 0`.
- `filteredDerivative.test_orientation`: for `g(n) = aⁿ b`, `∂_h g(n) = a^h`; the other product order
  `g(n)⁻¹ g(n + h)` gives `b⁻¹ a^h b`, a conjugate.

- `filteredDerivative.test_constant`: a constant group-valued sequence has every first derivative
  equal to the identity; in additive notation this is zero.
- `filteredDerivative.test_quadratic_value`: in additive `ℤ`, `∂₂(n ↦ n²)(3) = 25 − 9 = 16`.
- `iteratedFilteredDerivative.test_empty`: the empty list returns the original sequence, not the
  identity sequence.
- `iteratedFilteredDerivative.test_quadratic`: in additive `ℤ`, two directions `2,3` give the
  constant `12` for `n²`; one more derivative in any direction gives zero.
- `iteratedFilteredDerivative.test_linear`: a nonconstant affine sequence has a possibly nonzero
  first derivative, but every second derivative vanishes in an additive group.

### AC.3.9 Polynomial-sequence calculus and Taylor expansion

Prove `polynomial_sequence_taylor`: polynomial sequences for a degree filtration form a group under
pointwise multiplication, and every polynomial `g : ℤ → G` for a degree-`s` filtration has a unique
expansion `g(n) = g₀ g₁^{binom(n,1)} ⋯ g_s^{binom(n,s)}` with `g_i ∈ G_i`, the binomial coefficients
taken for all integers `n` and the factors multiplied in increasing degree (they need not commute).
Closure follows from commutator reordering and the filtration law (the Lazard–Leibman theorem); the
Taylor coefficients are peeled off at `n = 0` by induction on derivative order with the binomial
difference identity (Leng–Sah–Sawhney, inverse paper, §2.3, after Definition 2.9, pp. 8–9, and the
polynomial-map calculus it cites).

The proof contract:

1. Host–Kra cube groups. For a degree-`s` filtration, the `k`-dimensional cube group
   `HK^k(G_•) ⊆ G^{{0,1}^k}` is generated by `g^{[F]}` for the upper faces
   `F = {ω : ω_i = 1 for i ∈ S}`, with `g ∈ G_{|S|}`. It has the normal form
   `γ_{F₀}^{[F₀]} ⋯ γ_{F_{2^k−1}}^{[F_{2^k−1}]}` over these `2^k` upper faces, ordered as in
   Green–Tao (the singleton all-ones face first and the whole cube last), with unique coefficients, because `[Γ_F, Γ_{F'}] ⊆ Γ_{F ∩ F'}` (Green–Tao, polynomial orbits, Lemma 6.4 and
   (6.1), p. 29).
2. Characterisation (`isFilteredPolynomial_iff_cube`): `g : ℤ^ℓ → G` is polynomial for `G_•` if and only
   if every cube of `g` lies in `HK^k(G_•)`, for every `k` (Proposition 6.5, p. 30). As `HK^k` is a
   group, pointwise products and inverses of polynomial sequences are polynomial
   (`IsFilteredPolynomial.mul`; Lazard–Leibman, Proposition 6.2, p. 28).
3. Taylor expansion (Green–Tao–Ziegler, *An inverse theorem for the Gowers `U^{s+1}[N]`-norm*,
   arXiv:1009.3998, Appendix B, Lemma B.9, p. 88, for an arbitrary filtered group): every
   `g ∈ poly(ℤ, G_•)` has unique Taylor coefficients `g_i ∈ G_i` with
   `g(n) = g₀ g₁^{binom(n,1)} ⋯ g_s^{binom(n,s)}`, the factors in increasing degree. Existence peels off
   `g₀ = g(0)` and then, inductively, the next coefficient from the sequence
   `(g₀ g₁^{binom(n,1)} ⋯ g_{i−1}^{binom(n,i−1)})^{−1} g(n)`, which is polynomial by item 2 and has
   all derivatives of order below `i` trivial at `0`. Uniqueness is elementary: since `binom(j, i) = 0`
   for `i > j` and `binom(j, j) = 1`, the values `g(0), …, g(s)` determine `g₀, …, g_s` recursively.
   For a nilpotent Lie group with an adapted Mal'cev basis the same expansion reads coordinatewise
   `ψ(g(n)) = ∑_j t_j binom(n, j)` with `t_j` supported on the coordinates of `G_j` (Green–Tao,
   polynomial orbits, Lemma 6.7 and proof, pp. 31–32); that form is recorded in AC.3.13.

*Needs:* AC.3.8.

### AC.3.10 Connected, simply connected nilpotent Lie groups

Prove `nilpotent_exp_homeomorph` and `nilmanifold_haar_unique`: for a connected, simply connected
nilpotent real Lie group `G` with Lie algebra `𝔤`, the exponential map `exp : 𝔤 → G` is a
diffeomorphism, with inverse `log`; the Baker–Campbell–Hausdorff series terminates, so
`log(exp X · exp Y)` is a polynomial in `X, Y` with rational coefficients; and for a discrete subgroup
`Γ` with `G/Γ` compact, the space of left cosets `G/Γ` carries a unique left-`G`-invariant Borel
probability measure, its normalised Haar measure. These are the standard facts the sources quote:
Leng–Sah–Sawhney record that the exponential map is a homeomorphism for such groups and write
`g^t = exp(t log g)` (inverse paper, §2.1, p. 6), and Green–Tao give every nilmanifold its unique
normalised Haar measure (*The quantitative behaviour of polynomial orbits on nilmanifolds*,
arXiv:0709.3562v4, Definition 1.2, p. 2). The proof specialises TauCetiRoadmap's LieGroups: the
exponential map and one-parameter subgroups (Layer 0), closed subgroups (Layer 2), the
Baker–Campbell–Hausdorff formula (Layer 3) and simply connected covers (Layer 5); invariance and
uniqueness of the quotient measure come from the Haar measure on `G` and compactness of a
fundamental domain for `Γ`.

*Needs:* TauCetiRoadmap.RepresentationTheory/LieGroups Layers 0, 2, 3, 5; Mathlib `LieGroup`,
`SimplyConnectedSpace`, `Group.IsNilpotent`, `MeasureTheory.Measure.haar`.

### AC.3.11 Filtered nilmanifolds

Define the structure `FilteredNilmanifold`: a connected, simply connected nilpotent real Lie group `G`
of finite dimension with a Hausdorff smooth manifold structure, a degree-`s` filtration (AC.3.7) by closed connected Lie subgroups `G_i`, and a
discrete subgroup `Γ` with `G/Γ` compact such that `Γ ∩ G_i` is cocompact in each `G_i` (the
rationality of the filtration). `Γ` need not be normal; `G/Γ` is a homogeneous space of left cosets,
not a group (Leng–Sah–Sawhney, inverse paper, §2.2, Definition 2.7, p. 8: rationality is in addition
to compactness of `G/Γ`).

The API:

- `FilteredNilmanifold.group`, `FilteredNilmanifold.lattice`: the Lie group and the discrete
  cocompact subgroup.
- `FilteredNilmanifold.coset`: the point `gΓ`.
- `FilteredNilmanifold.coset_eq_iff`: `gΓ = hΓ ↔ h⁻¹g ∈ Γ`.
- `FilteredNilmanifold.leftTranslate`: left multiplication acts continuously on `G/Γ`.
- `FilteredNilmanifold.invariantProbability`: the normalised `G`-invariant probability measure of
  AC.3.10.
- `FilteredNilmanifold.layer_compact`: each `G_i/(Γ ∩ G_i)` is compact.
- `FilteredNilmanifold.abelian_torus`: for `G = ℝ^m` and `Γ = ℤ^m` the coset space is the standard
  torus.

*Needs:* AC.3.7, AC.3.10; Mathlib `LieGroup`, `SimplyConnectedSpace`, `Group.IsNilpotent`.

**Checks.**

- `FilteredNilmanifold.test_circle`: `ℝ/ℤ` with the degree-one filtration is the circle.
- `FilteredNilmanifold.test_heisenberg`: the real Heisenberg group modulo its integer lattice is
  compact, and the lattice is not normal.
- `FilteredNilmanifold.test_dense_subgroup`: `ℝ/ℚ` fails discreteness.
- `FilteredNilmanifold.test_noncompact_quotient`: `ℝ/{0}` fails compactness.

### AC.3.12 Rational adapted Mal'cev bases

Define `RationalMalcevBasis`: for a filtered nilmanifold of dimension `m`, a basis `X₁, …, X_m` of the
Lie algebra `log G` such that the bracket coefficients `[X_i, X_j] = ∑_k c_{ijk} X_k` are rationals of
reduced height `max(|numerator|, denominator) ≤ Q`; the second-kind coordinate map
`(t₁, …, t_m) ↦ exp(t₁X₁) ⋯ exp(t_mX_m)` is a bijection `ℝ^m → G` under which `Γ` corresponds exactly to
`ℤ^m`; and each `log G_i` is the span of the last `dim G_i` basis vectors. The nilmanifold has
complexity at most `M` when it has such a basis with `Q ≤ M`; dimension is a separate parameter.
First-kind coordinates `exp(∑ t_i X_i)` and second-kind coordinates are distinct
(Leng–Sah–Sawhney, inverse paper, §3, Definitions 3.1–3.5, pp. 10–12).

The API:

- `RationalMalcevBasis.basis`: the real Lie-algebra basis.
- `RationalMalcevBasis.coordinates`: the second-kind coordinate equivalence `G ≃ ℝ^m`.
- `RationalMalcevBasis.bracket_coeff`: `[X_i, X_j] = ∑_k c_{ijk} X_k` with height at most `Q`.
- `RationalMalcevBasis.coordinates_one`: the identity has coordinate `0`.
- `RationalMalcevBasis.mem_lattice_iff`: `g ∈ Γ` iff all second-kind coordinates are integers.
- `RationalMalcevBasis.layer_tail`: `g ∈ G_i` iff the coordinates before the adapted tail vanish.
- `RationalMalcevBasis.height_mono`: a `Q`-rational basis is `Q'`-rational for `Q ≤ Q'`.
- `RationalMalcevBasis.first_second_kind`: the two coordinate systems differ by triangular
  polynomial maps (from the finite Baker–Campbell–Hausdorff formula) with rational coefficients
  controlled by `m` and `Q`.

*Needs:* AC.3.10, AC.3.11; Mathlib `LeftInvariantDerivation`.

**Checks.**

- `RationalMalcevBasis.test_torus`: for additive `ℝ^m` with the standard basis the brackets vanish
  and both coordinate systems are the identity.
- `RationalMalcevBasis.test_height`: the reduced height of `2/3` is `3`; `√2` has no finite rational
  height.
- `RationalMalcevBasis.test_heisenberg_order`: in the Heisenberg group, second-kind coordinates differ
  from first-kind coordinates by the central cross term `½ t₁t₂`.
- `RationalMalcevBasis.test_lattice_scale`: on `ℝ/ℤ`, the basis vector `2` does not identify the
  lattice with integer coordinates.

### AC.3.13 The Mal'cev metric and bounded nilsequences

Construct `BoundedNilsequence`. With second-kind coordinates `ψ`, define the group metric
`d_G(x, y)` as the infimum over finite chains `x = u₀, u₁, …, u_r = y` of the sums of the edge costs
`min(‖ψ(u_i u_{i+1}⁻¹)‖_∞, ‖ψ(u_{i+1} u_i⁻¹)‖_∞)`, and the quotient metric
`d_{G/Γ}(xΓ, yΓ) = inf_{γ, γ' ∈ Γ} d_G(xγ, yγ')`. The group metric is right invariant, so it descends.
For `F : G/Γ → ℂ` put `‖F‖_Lip = ‖F‖_∞ + Lip(F)`. A bounded degree-`s` nilsequence is `n ↦ F(g(n)Γ)`
with `g` a filtered polynomial sequence and `|F| ≤ 1`; it carries its dimension, the height of its
basis and a Lipschitz constant `L ≥ 0` with `|F(x) − F(y)| ≤ L d(x, y)` as separate data
(`‖F‖_Lip ≤ 1 + L`) (Leng–Sah–Sawhney, inverse paper, §3, Definition 3.4, pp. 11–12; Theorem 1.2,
p. 1).

The API:

- `malcevGroupDistance`, `malcevQuotientDistance`: the two distances above.
- `malcevGroupDistance_right`: `d_G(xz, yz) = d_G(x, y)`.
- `malcevQuotientDistance_representative`: changing either coset representative leaves the
  distance unchanged.
- `malcevMetricSpace`: the quotient distance is a metric inducing the quotient topology.
- `BoundedNilsequence.value`: the value `F(g(n)Γ)`.
- `BoundedNilsequence.norm_le_one`: every value has norm at most `1`.
- `BoundedNilsequence.lipschitz`: a finite constant `L ≥ 0` with `|F(x) − F(y)| ≤ L d(x, y)` for all
  quotient points; with `|F| ≤ 1` it bounds `‖F‖_Lip ≤ 1 + L`.
- `BoundedNilsequence.shift`: a domain shift preserves degree, dimension, rationality and Lipschitz
  bound.
- `BoundedNilsequence.character`: a linear phase on `ℝ/ℤ` is a degree-one nilsequence.
- `malcevMetric_comparison`: the coordinate metric and a basis-induced Riemannian metric compare with
  constants depending only on degree, dimension and rationality; Kai's norm is used only through this
  comparison.

Two coordinate facts are part of this target. First, multiplication and inversion in second-kind
coordinates are polynomial maps of degree `O_s(1)` with rational coefficients, and so is the change
between first- and second-kind coordinates; for a `Q`-rational basis all coefficients have height at
most `Q^{O_s(m^{O(1)})}` (Green–Tao, polynomial orbits, Lemmas A.2–A.3, pp. 52–53; Leng, efficient
equidistribution, Lemmas B.1–B.2, pp. 46–47): these are the finite Baker–Campbell–Hausdorff bounds of
every quantitative statement of this layer. Second, a sequence is polynomial for the filtration
exactly when its coordinates are `∑_j t_j binom(n, j)` with `t_j` supported on the coordinates of
`G_{|j|}` (Green–Tao, polynomial orbits, Lemma 6.7, pp. 31–32), the coordinate form of AC.3.9's
Taylor expansion. The comparison lemmas the later targets use are also part of this target: for `Q`-rational nested bases
`X, X'`, `d(x, y) ≤ Q^{O(1)} |ψ'(x) − ψ'(y)|` and conversely when the coordinates are bounded by `Q`
(Green–Tao, polynomial orbits, Lemma A.4, (A.3)–(A.4), p. 54); left multiplication by `g` with
`|ψ(g)| ≤ Q` is `Q^{O(1)}`-Lipschitz (Lemma A.5, p. 56); the metric of a `Q`-rational subgroup is
comparable with the restricted metric (Lemma A.6, p. 57); every `g` factors uniquely as `{g}[g]` with
`ψ({g}) ∈ [0, 1)^m` and `[g] ∈ Γ` (Lemma A.14, p. 61). Leng records the same lemmas with exponents
`O_k(d^{O(1)})`, polynomial in the dimension (efficient equidistribution, Lemmas B.3–B.9, pp. 48–52),
which is the form AC.3.16 and AC.3.17 need.

*Needs:* AC.3.8, AC.3.9, AC.3.12.

**Checks.**

- `malcevMetric.test_circle`: on `ℝ/ℤ` with the standard basis the distance is distance modulo `ℤ`.
- `malcevMetric.test_representatives`: the representatives `x` and `x + 3` of a circle point give the
  same quotient distances.
- `BoundedNilsequence.test_linear_phase`: `g(n) = αn` on `ℝ` with `F(x) = e(x)` is a degree-one
  nilsequence.
- `BoundedNilsequence.test_boundedness`: the constant observable `F = 2` is not bounded by `1`.
- `BoundedNilsequence.test_non_lipschitz`: an observable for which no finite `C` has
  `|F(x) − F(y)| ≤ C d(x, y)` for all `x, y` is not the observable of any bounded nilsequence, whatever
  value a totalised infimum of Lipschitz constants would take.
- `malcevMetric.test_circle_value`: the circle points `1/3` and `2/3` have quotient distance
  `1/3`; the two representatives `0` and `3` of the identity have quotient distance zero.

### AC.3.14 Horizontal characters, smoothness and equidistribution

Define `HorizontalCharacter`: a continuous homomorphism `η : G → ℝ` with `η(Γ) ⊆ ℤ`, read modulo `ℤ`;
its integer coefficient vector in the Mal'cev coordinates defines its size `|η|`. For
`P(n) = ∑_{j=0}^{s} α_j binom(n, j)` define `polynomialSmoothness N P = max_{1 ≤ j ≤ s} N^j ‖α_j‖_{ℝ/ℤ}`,
the constant coefficient excluded, with `‖·‖_{ℝ/ℤ}` the distance `distToInt` to the nearest integer.
Define `IsEquidistributed`: a finite orbit `(g(n)Γ)_{n ∈ [N]}` is
`δ`-equidistributed when `|𝔼_{n ∈ [N]} F(g(n)Γ) − ∫ F| ≤ δ ‖F‖_Lip` for every Lipschitz `F`, the
integral being against the Haar probability of AC.3.10; `IsTotallyEquidistributed`: the same on every
subprogression of `[N]` of length at least `δN`. Here `N ≥ 1` and `0 < δ < 1`. Kai's monomial
smoothness norm is a different norm, related to this one only by a bounded change of basis with
integer denominators (Leng–Sah–Sawhney, inverse paper, Definition 2.9, pp. 8–9, and Definition 3.11,
p. 14; Green–Tao, *The Möbius function is strongly orthogonal to nilsequences*, arXiv:0807.1736v4,
§2, Proposition 2.1 and its setup, pp. 4–6; Leng–Sah–Sawhney, *Improved bounds for Szemerédi's
theorem*, arXiv:2402.17995v2, §2, before Lemma 2.4, p. 5).

The API:

- `HorizontalCharacter.coefficient`, `HorizontalCharacter.size`: the integer coefficients and their
  sup norm.
- `HorizontalCharacter.lattice_integer`: `η` is integer-valued on `Γ`.
- `polynomialSmoothness`: the definition above.
- `polynomialSmoothness_constant`: constant polynomials have smoothness `0`.
- `polynomialSmoothness_integer_coeff`: integer binomial coefficients give smoothness `0`.
- `polynomialSmoothness_monomial_comparison`: for degree at most `s`, there are
  positive integers `q₁, q₂ ≤ C_s` such that `‖q₁P‖_bin ≤ C_s ‖P‖_mon` and
  `‖q₂P‖_mon ≤ C_s ‖P‖_bin`. Multiplication by these integers is essential; no two-sided
  comparison of the unscaled norms is asserted (Green–Tao, polynomial-nilsequence erratum, Lemma 2.1, p. 4,
  as recalled by Kai, Definition 4.7, p. 15).
- `IsEquidistributed`, `IsTotallyEquidistributed`: the definitions above.
- `IsTotallyEquidistributed.to_equidistributed`: total equidistribution implies equidistribution.

*Needs:* AC.3.10, AC.3.13.

**Checks.**

- `polynomialSmoothness.test_constant`: `P(n) = √2` has smoothness `0`.
- `polynomialSmoothness.test_linear`: `P(n) = n/4` has smoothness `N/4`.
- `polynomialSmoothness.test_binomial`: `P(n) = binom(n, 2)/2` has smoothness `N²/2`, whereas its
  monomial quadratic coefficient is `1/4`.
- `IsEquidistributed.test_singleton_torus`: a constant orbit on the circle is not
  `δ`-equidistributed for small `δ > 0`.
- `HorizontalCharacter.test_circle`: on `ℝ/ℤ` the horizontal characters are `x ↦ mx`, `m ∈ ℤ`.
- `HorizontalCharacter.test_zero`: the zero homomorphism is horizontal and has size zero.
- `HorizontalCharacter.test_nonintegral`: on `ℝ/ℤ`, the map `x ↦ x/2` fails the lattice condition,
  since it sends the lattice element `1` to `1/2`.
- `IsEquidistributed.test_grid`: the uniform orbit on the `q` equally spaced circle points has
  discrepancy at most `Lip(F)/(2q)` by integrating the error on the nearest-point cells.
- `IsEquidistributed.test_point_space`: on the trivial nilmanifold every test has exactly its
  integral, so the discrepancy is zero.
- `IsTotallyEquidistributed.test_point_space`: every nonempty subprogression on the trivial
  nilmanifold likewise has zero discrepancy.
- `IsTotallyEquidistributed.test_constant_circle`: a constant circle orbit fails total
  equidistribution for small `δ`, already on the full progression.
- `IsTotallyEquidistributed.test_short_arc`: the orbit `n/1000`, `1 ≤ n ≤ 1000`, is ordinarily
  `1/2000`-equidistributed, but fails total `1/10`-equidistribution. On its first `100` points,
  `F(x) = exp(2πix)` has average modulus `sin(π/10)/(100 sin(π/1000)) > 0.98`, exceeding
  `(1 + 2π)/10`, while its Haar integral is zero.

- `distToInt.test_integer`: every integer, including `−2`, has distance zero.
- `distToInt.test_sign`: both `1/4` and `−1/4` have distance `1/4`.
- `distToInt.test_half`: `1/2` and `3/2` have distance `1/2`, independently of tie-breaking in rounding.

The scalar equidistribution inputs are named targets of this subsection:

- `polynomial_weyl`: for `k ≥ 1`, `N ≥ 1`, `0 < δ < 1/2` and a real polynomial `P` of degree
  at most `k`, if `|𝔼_{n∈[N]} e(P(n))| ≥ δ`, some `1 ≤ q ≤ C_k δ^{−C_k}` has
  `‖qP‖_{C^∞[N]} ≤ C_k δ^{−C_k}`. Repeated differencing controls the top coefficient; remove
  it on residue progressions and induct on degree (Green–Tao, polynomial orbits,
  Proposition 4.3 and Lemma 4.4, pp. 20–22).
- `smoothness_of_small_oscillation`: there are `c_k > 0`, `C_k > 0` such that for
  `0 < ε < c_k`, `N ≥ c_k⁻¹` and a real polynomial `P` of degree at most `k`, the condition
  `‖P(n) − P(n')‖_{ℝ/ℤ} ≤ ε` for all `n,n' ∈ [N]` implies
  `‖P‖_{C^∞[N]} ≤ C_k ε`. Weyl gives a bounded denominator, and finite differences at a
  prime step remove it (Leng–Sah–Sawhney, Szemerédi paper, Lemma 2.4, p. 5).
  The length hypothesis matters: at `N = 1`, `P(n) = n(n − 1)/4` is constant on `[1]`,
  but its smoothness norm is `1/2` because `P(n) = binom(n,2)/2`.
- `strong_polynomial_recurrence`: for each degree bound `d ≥ 1` there is `C_d ≥ 1` such that
  if `0 < δ < 1/2`, `0 < ε ≤ δ/2`, `N ≥ δ^{−C_d}` and a real polynomial `P` of degree at most `d`
  lands in an interval of length `ε` modulo `1` for at least `δN` values in `[N]`, then some
  `1 ≤ q ≤ C_d δ^{−C_d}` has `‖qP‖_{C^∞[N]} ≤ C_d εδ^{−C_d}`. This is the long-interval
  form of Green–Tao, polynomial orbits, Lemma 4.5, p. 22: its proof applies polynomial Weyl
  to many multiples and the linear recurrence lemma to the coefficients. Retaining the length
  bound ensures the latter lemma's small-target hypothesis. No unrestricted small-`N` version
  is asserted; the small-oscillation example above excludes one.

### AC.3.15 Vertical characters

Define `HasVerticalFrequency T ξ F`: for a rational connected central Lie subgroup `T ≤ G` (rational
meaning `Γ ∩ T` cocompact in `T`) and a continuous homomorphism `ξ : T → ℝ` with `ξ(Γ ∩ T) ⊆ ℤ`, the
observable `F` on `G/Γ` satisfies `F(t x) = e(ξ(t)) F(x)` for all `t ∈ T`. A vertical character takes
`T` to be the last nontrivial term of the lower central series. A nonzero frequency is a hypothesis
in addition to the transformation law: the zero function satisfies the law for every `ξ`
(Leng, *Efficient equidistribution of nilsequences*, arXiv:2312.10772v5, Definition 1.2 and
Theorem 4, pp. 4–5).

The API:

- `HasVerticalFrequency.lattice`: the action of `Γ ∩ T` is trivial, consistently with `ξ` being
  integer-valued there.
- `HasVerticalFrequency.conj`: conjugating `F` changes `ξ` to `−ξ`.
- `HasVerticalFrequency.mul`: products add frequencies.
- `HasVerticalFrequency.zero_frequency`: frequency zero is exactly `T`-invariance.
- `HasVerticalFrequency.integral_zero`: a nonzero frequency forces `∫ F = 0`.

*Needs:* AC.3.11, AC.3.12.

**Checks.**

- `HasVerticalFrequency.test_circle`: on `ℝ/ℤ`, `F(x) = e(mx)` has frequency `t ↦ mt`.
- `HasVerticalFrequency.test_constant`: `F = 1` has no nonzero circle frequency.
- `HasVerticalFrequency.test_zero`: `F = 0` satisfies every frequency law, so a norm or correlation
  hypothesis is needed to make the frequency informative.

### AC.3.16 Efficient equidistribution

Prove `efficient_equidistribution`: fix a degree `k` and a box dimension `ℓ`. There is `C = C(k, ℓ)`
such that for `0 < δ < 1/10`, `M ≥ 1`, a degree-`k` filtered nilmanifold `G/Γ` with `G` of step `s`,
dimension `d` and complexity at most `M`, an observable `F` with `‖F‖_Lip ≤ M` and nonzero
final-central frequency `ξ` of size at most `M/δ`, and a polynomial sequence `g : ℤ^ℓ → G` with
`|𝔼_{n ∈ ∏[N_i]} F(g(n)Γ)| ≥ δ`, either `min_i N_i ≤ (M/δ)^{C d^C}`, or there are
`1 ≤ r ≤ dim(G/[G, G])` horizontal characters `η₁, …, η_r` of size at most `(M/δ)^{C d^C}`, with the
multivariate smoothness of each `η_i ∘ g` at most that bound, such that
`ξ([[⋯[w₁, w₂], w₃], …, w_s]) = 0` for all `w_j ∈ G' = ⋂ ker η_i`; consequently `G'/(G' ∩ ker ξ)` has step
at most `s − 1`. Here `ker ξ` is taken inside the final central subgroup; the intersection
makes the quotient meaningful also at step one. Every `N_i > 1`. The obstruction is a set of horizontal characters together with a
vertical commutator identity, not an equidistribution statement for an arbitrary observable. The
proof runs van der Corput and a refined bracket-polynomial lemma to get simultaneous rational
constraints on a horizontal subspace, separates the degree-one case, and controls the rational
kernel intersection; every loss has exponent polynomial in the dimension (Leng, efficient
equidistribution, Theorem 4, pp. 4–5; proof strategy §1.3, pp. 6–7).

The internal contracts, each with its own parameters (dimension `d`, rational height `M` of the
basis, frequency size `M/δ` and Lipschitz norm `M`), are:

1. `refined_bracket_polynomial` (Leng, Lemmas 3.1–3.2 and Corollary 3.1, pp. 13–21): if
   `‖β + a·{αh}‖_{ℝ/ℤ} < K/N` for `δN` values of `h ∈ [N]`, with `a, α ∈ ℝ^d` and `M`-bounded data, then
   `N ≪_δ 1`, or `K/N > 1/100`, or there are linearly independent `w₁, …, w_r ∈ ℤ^d` and
   `η₁, …, η_{d−r} ∈ ℤ^d` with `⟨w_i, η_j⟩ = 0`, `|w_i|, |η_j| ≤ (δ/(d^d M))^{−O(1)}` and
   `‖η_j·α‖_{ℝ/ℤ}, |w_i·a| ≤ (δ/M)^{−O(1)} d^{O(d)} K/N`; the multiparameter and bilinear forms are the
   same with `(dr)^{O(d+r)}` in place of `d^{O(d)}`. The geometric input is a proper progression of
   rank `d` in `B ∩ Γ` with at least `O(d)^{−7d/2}|B ∩ Γ|` points for a symmetric convex body `B` and
   a lattice `Γ` (Proposition 3.1, p. 14, from Minkowski's second theorem), which is where the
   dimension enters only polynomially in the exponent.
2. `vertical_frequency_reduction` (Lemma 2.2, p. 11): a nilsequence with nonzero vertical frequency
   `ξ` on the last nontrivial step factors through `G/ker ξ`, of dimension `d − d_{(s)} + 1`, with
   the same values and complexity changed by `(M/δ)^{O(d^{O(1)})}`.
3. Van der Corput on the product group (`box_group_derivative`): for `g(0) = 1` write
   `g = g₂ · g_lin` with `g_lin(n) = ∏ g(e_i)^{n_i}` (Definition 4.1, p. 23); the sequences
   `g_h(n) = ({g_lin(h)}^{−1} g₂(n + h) g_lin(n + h) [g_lin(h)]^{−1}, g(n))` are polynomial in the group
   `G ×_{G₂} G` with filtration `G_i ×_{G_{i+1}} G_i` (Definition 4.2, Lemmas A.3–A.4, pp. 40–42), and
   the derivative correlation of `F` becomes a correlation of a nilsequence on this group whose
   vertical frequency is a commutator form on `G₂` (Lemma 4.1, p. 22).
4. The two cases of the proof (§4.2, pp. 26–29, and §4.3, pp. 29–31): the van der Corput output and
   the refined bracket lemma produce horizontal characters `η_i` of size `(M/δ)^{O(d^{O(1)})}` with
   `ξ([w₁, …, w_s]) = 0` on `⋂ ker η_i`. The supporting linear algebra is Lemmas A.7–A.9
   (pp. 43–44: orthogonal complements of size `(dM)^{O(d)}`, annihilators of `Γ`-elements and
   commutator-killing horizontal characters with sizes `(QM)^{O_k(d^{O_k(1)})}`), the multivariate
   Vinogradov lemma A.11 and the extrapolation lemma A.12 (p. 45), and the factorisation lemmas A.1–A.2
   (pp. 38–39) that turn the characters into `g = ε g₁ γ`.
5. Quantitative rationality: changes of coordinates, multiplication in coordinates, metric
   comparisons and rational subgroups with heights `Q^{O_k(d^{O(1)})}` (Appendix B, Lemmas B.1–B.15,
   pp. 46–55; see AC.3.13).

Leng–Sah–Sawhney restate the conclusion in the form AC.3.17 consumes (inverse paper, §5,
Theorem 5.2, Theorem 5.4 and Corollary 5.5, pp. 19–25).

*Needs:* AC.3.9, AC.3.13, AC.3.14, AC.3.15; GeometryOfNumbersAndQuadraticArithmetic Layer 1.5
(`minkowski_second_upper`).

### AC.3.17 The quasipolynomial inverse theorem on intervals

Prove `quasipolynomial_inverse`: for each `s ≥ 1` there is `C_s ≥ 1` such that for `N ≥ 1`,
`0 < δ < 1/2` and `f : [N] → ℂ` with `|f| ≤ 1` and `U^{s+1}[N](f) ≥ δ`, there is a bounded degree-`s`
nilsequence `F(g(n)Γ)` of dimension at most `C_s (log* (1/δ))^{C_s}`, with basis complexity and
Lipschitz norm at most `exp(C_s (log* (1/δ))^{C_s})`, such that

```text
|𝔼_{n ∈ [N]} f(n) · conj(F(g(n)Γ))| ≥ exp(−C_s (log* (1/δ))^{C_s}),
```

where `log* x = max(log x, e^e)`. The proof inducts on `s` through derivative correlations and the
previous inverse theorem, replaces the correlating objects by rational nilcharacters of controlled
dimension and height, uses efficient equidistribution to align them, reduce degree-rank and
linearise in the derivative parameter, symmetrises the resulting multilinear symbol, integrates it
to a degree-`s` nilsequence, and recovers the correlation by Cauchy–Schwarz; the
Balog–Szemerédi–Gowers theorem enters the linearisation (Leng–Sah–Sawhney, inverse paper,
Theorem 1.2, p. 1; overview §4, pp. 15–19; §§5–12 and Appendices A–C). An observable with
`|F| ≤ L` instead of `1` is rescaled at a further quasipolynomial loss.

The internal contracts, in the order of the induction on `s` (the case `s = 1` is the `U²` inverse
theorem, from AC.0 and Parseval). Throughout, `ρ` is a density, `M` a complexity bound, `D` an output
dimension and `d` a nilmanifold dimension, tracked separately.

1. `inverse_correlation_structure` (Lemma 6.2, p. 27, packaged as Theorem 6.4, p. 28): assuming the
   theorem for `s − 1`, if `‖f‖_{U^{s+1}[N]} ≥ δ` then `f` has a correlation structure of degree-rank
   `(s − 1, s − 1)` (Definition 6.1, p. 26): a set `H ⊆ [N]` with `|H| ≥ ρN` and a multidegree
   `(1, s − 1)` nilcharacter `χ(h, n)` with `|𝔼_n Δ_h f(n) ⊗ χ_h(n)|` large for `h ∈ H`, where
   `ρ^{−1}, M, D ≤ exp((log 1/δ)^{O_s(1)})` and `d ≤ (log 1/δ)^{O_s(1)}`. Nilcharacters, their
   equivalence and their calculus (transitivity, slicing, shifts, splitting into `(1, …, 1)` form) are
   Appendix C, Lemmas C.1–C.6, pp. 87–97.
2. `additive_quadruple_correlation` (Lemma 7.5, p. 32, from Lemmas 7.1–7.4, pp. 29–31: Gowers'
   Cauchy–Schwarz argument, the transfer of correlation between equivalent nilcharacters): at least
   `(MD/ρ)^{−O_s(d^{O_s(1)})} N³` additive quadruples `h₁ + h₂ = h₃ + h₄` in `H` have correlated
   nilcharacters.
3. `sunflower_step` (Lemma 8.3, p. 36) and `linearization_step` (Lemma 9.1, p. 42): for
   `N ≥ (MD/ρ)^{O_s(d^{O_s(1)})}`, pass to `H' ⊆ H` on which the top degree-rank part of `χ_h` depends on
   `h` through a bracket-linear expression, with `ρ'^{−1} ≤ exp(O_s((d log(MD/ρ))^{O_s(1)}))`,
   `M' = O(M)`, `D' = D` and `d' = O(d)`. Inputs: efficient equidistribution (AC.3.16), the Taylor
   coefficient bound for almost-trivial sequences (Lemma 8.2, p. 35), and the approximate-homomorphism
   lemmas A.1–A.2 (p. 75), which rest on the quasi-polynomial Bogolyubov lemma (AC.1.32) and the
   bracket-linear description of Freiman homomorphisms on Bohr sets (Lemma A.6, p. 76); the
   Balog–Szemerédi–Gowers theorem (AC.1.26) enters A.1.
4. `degree_rank_reduction` (Lemma 6.3, p. 28): from degree-rank `(s − 1, r*)` to `(s − 1, r* − 1)` with
   `ρ'^{−1}, M', D' ≤ exp(O_s((d log(MD/ρ))^{O_s(1)}))` and `d' ≤ O_s((d log(MD/ρ))^{O_s(1)})`. It is
   assembled from the universal nilmanifold of a degree-rank datum (Definition 10.3 and
   Lemmas 10.4–10.5, pp. 53–55), its quotient by the relation subgroup (Definition 10.7 and
   Lemmas 10.10–10.12, pp. 56–58), the extraction of a `(1, s − 1)` nilsequence (Lemma 11.3, p. 63)
   and the symmetrisation argument (Lemma 12.1, p. 65).
5. Integration: after at most `s − 1` degree-rank reductions the multidegree `(1, s − 1)`
   nilcharacter is symmetric up to lower-order terms and integrates to a degree-`s` nilsequence that
   correlates with `f`, by Cauchy–Schwarz in `h` (overview §4.1–4.4, pp. 16–18; the correlation
   transfer of Lemma B.5, p. 83, and the nilcharacters of prescribed vertical frequency of
   Lemma B.4, p. 82).

Since there are at most `s − 1` reductions, each raising the parameters to a fixed power of
`d log(MD/ρ)`, the final dimension is `(log 1/δ)^{O_s(1)}` and the final complexity, Lipschitz norm and
inverse correlation are `exp((log 1/δ)^{O_s(1)})` (§4.5, p. 18).

*Needs:* AC.1.32, AC.1.26, AC.3.6, AC.3.9, AC.3.13, AC.3.16.

### AC.3.18 The box inverse theorem

Prove `box_inverse`: for `s, ℓ ≥ 1` there are `c_{s,ℓ} > 0`, `N₀(s, ℓ)` and `C_{s,ℓ}` such that for
`N ≥ N₀`, `0 < δ < c_{s,ℓ}` and `f : [−N, N]^ℓ → ℂ` with `|f| ≤ 1` and normalised `U^{s+1}` box norm at
least `δ`, some bounded degree-`s` polynomial nilsequence on `ℤ^ℓ` correlates with `f` by at least
`exp(−C (log* (1/δ))^C)`, with dimension at most `C (log* (1/δ))^C` and rationality and Lipschitz norm
at most `exp(C (log* (1/δ))^C)`. Kai's printed statement omits the hypothesis `|f| ≤ 1`, which the proof
needs because it invokes the bounded interval theorem: a scaled point mass with fixed normalised cube
norm has vanishing correlation with every bounded test. Use the injective Kronecker substitution
`φ(x) = ∑_i (5N)^{i−1} x_i`, which preserves the additive relations of cube vertices and maps the box
onto a set of positive density (depending on `ℓ`) in an interval of length `O_ℓ(N^ℓ)`; zero-extend,
compare normalised cube counts, apply AC.3.17 and compose its polynomial sequence with `φ` (Kai,
Appendix A, Theorem A.1 and proof, printed pp. 59–60).

The comparison is three elementary lemmas. (i) `kronecker_freiman_two`: `φ` is a Freiman isomorphism
of order two from `[−N, N]^ℓ` onto its image, because a relation `∑_i (5N)^{i−1} c_i = 0` with
`|c_i| ≤ 4N < 5N` forces every `c_i = 0` (reduce modulo `5N` and divide). (ii) `cube_iff_parallelograms`:
a family `(v_ω)_{ω ∈ {0,1}^{s+1}}` is a cube `x + ω·h` exactly when every pair of parallel edges has
equal differences, which are relations `a + b = c + d` among its vertices; so (i) gives a bijection
between the cubes of `[−N, N]^ℓ` and the cubes of `ℤ` with all vertices in `φ([−N, N]^ℓ)`, and the
unnormalised cube sums of `f` and of its zero-extended push-forward `f'` agree. (iii) The normalising
cube counts of `1_{[−N,N]^ℓ}` and of the indicator of `[−(5N)^ℓ, (5N)^ℓ]` are both
`≍_{ℓ,s} N^{ℓ(s+2)}`, so the normalised norms of `f` and `f'` agree up to factors depending only on
`ℓ, s`, and the averages over the box and over the interval differ by the factor
`(2(5N)^ℓ + 1)/(2N + 1)^ℓ ≍_ℓ 1`. Kai's appeal to Freiman invariance (p. 60) is (ii) with (i).

*Needs:* AC.3.6, AC.3.17.

### AC.3.19 Smooth, rational and periodic factors

Define `IsRationalElement`: `γ` is `M`-rational for `Γ` when `γ^r ∈ Γ` for some integer
`1 ≤ r ≤ M`. Define `IsRationalSequence` (every value is `M`-rational) and, separately,
`IsRationalPeriodicSequence` (pointwise `M`-rational and `γ(n + q)Γ = γ(n)Γ` for some period
`1 ≤ q ≤ M`): pointwise rationality does not make an arbitrary sequence periodic. Define
`IsSmoothSequence`: `ε` is `(M, N)`-smooth when `d_G(ε(n), 1) ≤ M` and
`d_G(ε(n), ε(n − 1)) ≤ M/N` for `n ∈ [N]`, in the right-invariant metric of AC.3.13. Define
`IsRationalSubgroup`: a connected subgroup `H` is `M`-rational when its Lie algebra has a basis of
rational combinations of the Mal'cev basis with coefficients of height at most `M` (Green–Tao,
polynomial orbits, Definitions 1.17–1.18, pp. 9–10, and Definition 2.5, p. 13).

The API:

- `IsRationalElement`, `IsRationalSequence`, `IsRationalPeriodicSequence`, `IsSmoothSequence`,
  `IsRationalSubgroup`: the definitions above.
- `IsRationalElement.lattice`: a lattice element is `1`-rational.
- `IsSmoothSequence.const_one`: the constant identity is `(M, N)`-smooth for `M ≥ 0`.
- `IsSmoothSequence.diameter`: for `m, n ∈ [N]`, `d_G(ε(m), ε(n)) ≤ M|m − n|/N`.

*Needs:* AC.3.13.

**Checks.**

- `IsRationalElement.test_circle`: in `ℝ/ℤ`, `1/3` is `3`-rational and not `2`-rational.
- `IsSmoothSequence.test_identity`: the identity sequence is smooth with zero distances and
  increments.
- `IsRationalSequence.test_nonperiodic`: an arbitrary nonperiodic choice between the circle points
  `0` and `1/2` is pointwise `2`-rational but not periodic.
- `IsRationalElement.test_identity_bound`: the identity is `1`-rational, and no element is
  `0`-rational because a positive witness exponent is required.
- `IsRationalElement.test_irrational`: `√2` in the additive circle has no finite rationality bound.
- `IsRationalSequence.test_constant`: the constant `1/3` sequence is pointwise `3`-rational and
  not pointwise `2`-rational.
- `IsRationalSequence.test_irrational_value`: a sequence containing a single value `√2` is not
  pointwise `M`-rational for any finite `M`.
- `IsRationalPeriodicSequence.test_thirds`: `γ(n) = n/3` on the circle is `3`-rational with period
  `3` in the quotient; it is not `2`-rational-periodic.
- `IsRationalPeriodicSequence.test_constant_third`: the constant `1/3` sequence has quotient period
  `1`, but is not `1`-rational-periodic; its pointwise rationality needs bound `3`.
- `IsRationalPeriodicSequence.test_irrational_constant`: a constant irrational circle point has
  period `1` but fails every finite rationality bound.
- `IsSmoothSequence.test_linear`: in additive `ℝ` with its usual metric, `ε(n) = Mn/N` is
  `(M,N)`-smooth for `M ≥ 0`, `N ≥ 1`; the last value is `M` and each increment is `M/N`.
- `IsSmoothSequence.test_large_constant`: `ε(n) = M + 1` has zero increments but violates the
  value bound, so is not `(M,N)`-smooth.
- `IsSmoothSequence.test_jump`: for `M > 0`, `N ≥ 2`, alternating `0, M` satisfies the value bound
  but violates the increment bound `M/N`.
- `IsRationalSubgroup.test_zero`: the zero-dimensional subgroup is `1`-rational by its empty basis.
- `IsRationalSubgroup.test_rational_line`: in `ℝ²/ℤ²`, the line spanned by `(2,1)` has a rational
  basis of height `2` and a cocompact intersection with `ℤ²`.
- `IsRationalSubgroup.test_irrational_line`: the line spanned by `(1,√2)` has zero intersection
  with `ℤ²` and no rational basis, hence fails rationality.

### AC.3.20 Factorisation of polynomial orbits

Prove `quantitative_orbit_factorization`: fix a dimension `m`, a degree `d` and `A > 0`. Given
`M₀ ≥ 2`, `N ≥ 1`, an `M₀`-rational adapted nilmanifold and a polynomial sequence `g : ℤ → G`, there
are `M₀ ≤ M ≤ C_{A,m,d} M₀^{C_{A,m,d}}`, a connected rational subgroup `G'` with an adapted basis of
`G'/(Γ ∩ G')` made of `M`-rational combinations of the original basis, and polynomial sequences with
`g = ε g' γ`, where `ε` is `(M, N)`-smooth, `g'` takes values in `G'` and is totally
`M^{−A}`-equidistributed there, and `γ` is `M`-rational with coset period at most `M`. This is the
single-parameter theorem. Green and Tao's erratum shows that the multiparameter argument of the
original paper (Theorem 8.6, p. 47) extends equal-side estimates to unequal boxes without the
needed small-side alternative, and states that Theorems 1.19 and 2.9 are unaffected; any
multiparameter use goes through the corrected equal-side statement or keeps the small-side
alternative. The proof iterates the quantitative Leibman obstruction to restrict a
non-equidistributed orbit to a rational subgroup, keeping the smooth and periodic factors and their
coordinate bounds, until the residual is totally equidistributed at the requested scale (Green–Tao,
polynomial orbits, Theorem 1.19, p. 10, Theorem 2.9, pp. 13–14, §§7–10; Green–Tao, *On the
quantitative distribution of polynomial nilsequences — erratum*, arXiv:1311.6170v3, §1, pp. 1–3).
The proof contract is: (a) the quantitative Leibman dichotomy, Theorem 2.9, proved by induction on
the dimension with the van der Corput trick and the abelian case `polynomial_weyl` (§4,
Proposition 4.3, p. 20; §7, pp. 33–44); (b) the factorisation of a poorly distributed sequence:
a horizontal character with small smoothness norm splits `g = ε g' γ` with `g'` in its kernel, a
rational subgroup of height `M^{O(1)}`, `ε` smooth and `γ` rational (Proposition 9.2, p. 48, using the
rational-point and conjugation lemmas A.11–A.13, pp. 59–60); (c) iteration of (b) at most `dim G` times
with `M_{i+1} = M_i^{C}`, stopping when the residual is totally `M_i^{−A}`-equidistributed (§10,
pp. 50–51). Only (c) in its multiparameter form is affected by the erratum.

*Needs:* AC.3.9, AC.3.14, AC.3.19.

### Examples

- On `ZMod 2`, `f = (1, −1)` has `U¹(f) = 0` and `U²(f) = 1`: the character is invisible to the mean and
  maximal for `U²`, which is why `U¹` is only a seminorm.
- The Heisenberg nilmanifold: `G` the upper unitriangular real `3 × 3` matrices, `Γ` the integer
  ones, `G₂ = Z(G)`, `G₃ = 1`, with Mal'cev basis `X = E₁₂`, `Y = E₂₃`, `Z = [X, Y] = E₁₃`. The
  sequence `g(n) = exp(αnX) exp(βnY)`, the matrix with entries `αn`, `βn` above the diagonal and
  `αβn²` in the corner, is polynomial for this degree-two filtration (a product of two linear
  sequences). Its second-kind coordinates are `(αn, βn, 0)`, while its first-kind coordinates are
  `(αn, βn, ½ αβ n²)`: the cross term of the Baker–Campbell–Hausdorff formula.
- `P(n) = n²/2 = binom(n, 2) + n/2` has binomial coefficients `α₂ = 1`, `α₁ = 1/2`, so
  `polynomialSmoothness N P = N/2`, although the monomial coefficient `1/2` of `n²` is not an
  integer.

### Dependencies

AC.0 (the `U²` identity), AC.1 (the quasi-polynomial Bogolyubov lemma and the
Balog–Szemerédi–Gowers theorem, inside AC.3.17); TauCetiRoadmap.RepresentationTheory/LieGroups
Layers 0, 2, 3, 5; GeometryOfNumbersAndQuadraticArithmetic Layer 1.5; Mathlib (Lie groups, nilpotent
groups, Haar measure, finite averages).

## Layer AC.2: Progressions in dense sets and removal

This layer proves Szemerédi's theorem with the bound of Leng, Sah and Sawhney (*Improved bounds for
Szemerédi's theorem*, arXiv:2402.17995v2) along its finite density-increment route, derives the
infinitary and Varnavides forms that transference consumes, records Rahman's explicit threshold for
three-term progressions, and proves the removal lemma for an ordered product equation in a finite
group (Král'–Serra–Vena) from the cycle removal lemma for layered graphs. Roth's theorem (`k = 3`) is
Mathlib's `roth_3ap_theorem_nat`; the quantitative target is for `k ≥ 5`, and `k = 4` follows
qualitatively from `k = 5`. The density-increment route needs the cube norms and the interval inverse
theorem of AC.3.

### AC.2.1 Progression averages

Define, for `k` functions on `ZMod N`,

```text
cyclicProgressionAverage f = 𝔼_{x, r ∈ ZMod N} ∏_{i=0}^{k−1} f_i(x + i r),
```

which includes wraparound and `r = 0`, and for `k` functions on `ℤ` zero-extended from `[N]`,

```text
intervalProgressionAverage N f = (N + 1)⁻² ∑_{x, r ∈ {0, …, N}} ∏_{i=0}^{k−1} f_i(x + i r).
```

Nontrivial progressions have `r ≠ 0`; at `k = 0` the empty product is `1`, and for `k ≥ 1` and
`N = 0` the interval average is `0` (Green–Tao, primes paper, §2, Proposition 2.3, pp. 4–5, for the
cyclic average with `r = 0` included; Leng–Sah–Sawhney, Szemerédi paper, §3, progression notation,
p. 7, for the interval average and zero extension).

The API:

- `cyclicProgressionAverage`, `intervalProgressionAverage`: the definitions above.
- `cyclicProgressionAverage_const`: constant inputs give their product.
- `intervalProgressionAverage_indicator`: for indicators, the average is the number of admissible
  ordered progressions divided by `(N + 1)²`.
- `cyclicProgressionAverage_translate`: a common translation of all inputs preserves the average.
- `cyclicProgressionAverage_multilinear`: the average is multilinear in its `k` inputs.
- `cyclicProgressionAverage_diagonal`: the `r = 0` contribution is `N⁻¹ 𝔼_x ∏_i f_i(x)`.
- `intervalProgressionAverage_empty`: `N = 0` and `k ≥ 1` give `0`.

*Needs:* Mathlib `Finset.expect`.

**Checks.**

- `cyclicProgressionAverage.test_full`: all inputs `1` give `1`, including `k = 0`.
- `cyclicProgressionAverage.test_singleton`: on `ZMod 5`, the indicator of `{0}` has three-term
  average `1/25` (only `x = r = 0`).
- `intervalProgressionAverage.test_boundary`: for the indicator of `[2]` and `k = 3`, only `x = 1, 2`
  with `r = 0` contribute, giving `2/9`; dropping the zero extension would count wrapped progressions.
- `intervalProgressionAverage.test_empty`: at `N = 0` and `k = 3` the average is `0`.
- `cyclicProgressionAverage.test_translation`: on `ZMod 5`, replacing the singleton `{0}` in
  each slot by `{1}` preserves its three-term average `1/25`.
- `intervalProgressionAverage.test_empty_product`: with `k = 0`, every pair contributes the empty
  product, so the average is `1`, including at `N = 0`.

### AC.2.2 The dense generalised von Neumann inequality

Prove `dense_generalised_von_neumann`: for `k ≥ 2`, a prime `p > k` and `1`-bounded
`f₀, …, f_{k−1} : ZMod p → ℂ`, `|cyclicProgressionAverage f| ≤ min_i ‖f_i‖_{U^{k−1}}`.
Apply Cauchy–Schwarz `k − 1` times, using that every nonzero difference of progression coefficients
is invertible modulo `p` (Green–Tao, primes paper, §5, Proposition 5.3 with `ν = 1`, pp. 14–19).

Prove separately `interval_dense_generalised_von_neumann`: for `k ≥ 3`, `N ≥ 1` and `1`-bounded
integer functions restricted to `[N]`,
`|intervalProgressionAverage N f| ≤ C_k (min_i U^{k−1}[N](f_i))^{1/6}`.
The one-sided condition `r ≥ 0` is a convex cutoff, so it must be kept in the estimate. Apply the
scalar case of Kai's convex-domain generalised von Neumann argument to the forms `x + ir`, with
domain dimension `2` and complexity `k − 2`; zero extension and AC.3.6 compare its larger box norm
with the interval norm by constants depending only on `k`. Smoothing the convex cutoff and
truncating its Fourier expansion gives the exponent `1/(2·2 + 2) = 1/6` (Kai, Appendix D,
Theorem D.3 and proof, pp. 71–77, with every input `1`-bounded). This scalar specialisation is
proved here from repeated Cauchy–Schwarz and cutoff approximation; AC.5.7 is the later general
module version, rather than a prerequisite of this target. This polynomial
bound suffices for the density increment. The proof contract has four steps, each a named lemma.

1. `interval_average_as_cyclic` (embedding): choose a prime `p` with
   `max(kN, 2^{k−1}N) < p ≤ 2 max(kN, 2^{k−1}N)` (Bertrand) and zero-extend each `f_i` from `[N]` to
   `ZMod p`. For `0 ≤ x, r ≤ N` the arguments `x + ir` lie in `[0, kN]` and do not wrap, so
   `intervalProgressionAverage N f = (p/(N + 1))² 𝔼_{x,r ∈ ZMod p} 1_Ω(x/p, r/p) ∏_i f_i(x + ir)`, where
   `Ω = [0, N/p] × [0, N/p]` is a convex subset of `[0, 1/2]²`, viewed in the torus `(ℝ/ℤ)²`; the
   factor `(p/(N + 1))²` is at most `16 k² 4^{k}`.
2. `convex_cutoff_fourier` (smoothing the cutoff): for `M, Y ≥ 2` there is a trigonometric
   polynomial `T = ∑_{|ξ|_∞ ≤ Y} c_ξ e(ξ·y)` with `∑ |c_ξ| ≤ C Y²`, such that `1_Ω − T` is at most
   `C M log Y/Y` in sup norm off a set whose `(x, r)`-proportion is `O(1/M)`: first replace `1_Ω` by
   a function that is `1` on `Ω`, vanishes at distance `1/M` from it, and is `M`-Lipschitz (the
   boundary layer of a convex set in `[0, 1]²` has area `O(1/M)`), then take a Fejér-type truncation
   of its Fourier series (Kai, Proposition D.7, p. 73, citing the Lipschitz approximation lemma of
   Green–Tao's linear-equations paper; Theorem C.3, p. 67, for the Lipschitz boundary of a convex
   set).
3. Absorbing the phases: `e(ξ₁x/p + ξ₂r/p) = e((ξ₁ − ξ₂)x/p) · e(ξ₂(x + r)/p)` is a product of linear
   phases of the first two forms; multiplying `f₀` and `f₁` by linear phases does not change their
   `U^{k−1}` norms because `k − 1 ≥ 2`. Each term is therefore bounded by AC.2.2's cyclic estimate
   `dense_generalised_von_neumann` with the modified functions, so
   `|𝔼_{x,r} T(x/p, r/p) ∏_i f_i(x + ir)| ≤ C Y² min_i ‖f_i‖_{U^{k−1}(ZMod p)}`. This is where `k ≥ 3` is
   used; at `k = 2` the phase changes `U¹`, as the negative control below shows.
4. `zero_extension_gowers_le_interval` (enlarged box): since `p ≥ 2^{k−1}N`, the modulus comparison
   `intervalGowersNorm_independent_modulus` (AC.3.6) computes `U^{k−1}[N](f_i)` in `ZMod p` as the ratio
   `‖f_i 1_{[N]}‖_{U^{k−1}(ZMod p)} / ‖1_{[N]}‖_{U^{k−1}(ZMod p)}`, and the denominator is at most `1`,
   so `‖f_i 1_{[N]}‖_{U^{k−1}(ZMod p)} ≤ U^{k−1}[N](f_i)`.

Combining, `|intervalProgressionAverage N f| ≤ C_k(δY² + 1/M + M log Y/Y)` with
`δ = min_i U^{k−1}[N](f_i)`; the choice `Y = δ^{−2/5}`, `M = (Y/log Y)^{1/2}` gives
`C_k δ^{1/5} log(1/δ) ≤ C'_k δ^{1/6}` (this is Kai's optimisation in Theorem D.3 with `d = 2`).
The same four lemmas, with the module normal form in place of the scalar forms, are the convex-cutoff
and enlarged-box steps of AC.5.7. Leng–Sah–Sawhney state a linear interval bound in
Lemma 3.3, p. 8; it cannot be extended to `k = 2` with this one-sided average.

**Checks.** At `N = k = 2`, let `f₀(1) = 1`, `f₀(2) = −1` and `f₁ = 1` on `[2]`.
Then `U¹[2](f₀) = 0`, but the three pairs `(x,r) = (1,0), (1,1), (2,0)` give interval average
`(1 + 1 − 1)/9 = 1/9`. The cyclic estimate and the interval estimate have different hypotheses.

*Needs:* AC.2.1, AC.3.2, AC.3.6.

### AC.2.3 Partitioning into progressions on which nilsequences are nearly constant

Prove `nilsequence_progression_partition`: fix a degree `s`. For `T ≥ 1` polynomial orbits on
nilmanifolds of dimension at most `d ≥ 1` and complexity at most `M ≥ 2`, and `N ≥ 1`, the interval
`[N]` partitions into `L` disjoint nonempty arithmetic progressions with average length
`N/L ≥ ½ N^{c_s/(Td)^{C_s}}`, on each of which every orbit has diameter at most
`M^{C_s d^{C_s}} N^{−c_s/(Td)^{C_s}}` in the Mal'cev quotient metric. The lower bound is for the
average part length, not for every part. Simultaneous monomial recurrence with bound
`C_s d N^{−c_s/d²}` is refined degree by degree to partition polynomial phases; the bound for small
images in the smoothness norm and the quotient by the first nontrivial filtration step factor off
smooth and lattice-valued sequences on each part; induct on the filtration type, controlling the
lifted errors by the quantitative Baker–Campbell–Hausdorff formula and lattice reordering
(Leng–Sah–Sawhney, Szemerédi paper, arXiv:2402.17995, §2, Lemma 2.1, Proposition 2.2 and
Lemmas 2.3–2.4, pp. 3–7).

The two progression inputs are named lemmas of this target; the scalar Weyl and
small-oscillation inputs are AC.3.14:

- `simultaneous_monomial_recurrence` (Schmidt's recurrence, quantified): for `k ≥ 1` there is
  `c_k > 0` such that for all real `α₁, …, α_d` and `N ≥ 1`,
  `min_{1 ≤ n ≤ N} max_i ‖α_i n^k‖_{ℝ/ℤ} ≤ C_k d N^{−c_k/d²}`. Proof: with a full-rank lattice `Λ ⊆ ℝ^d`,
  study the theta average `F_{Λ,α}(N) = det Λ · 𝔼_{|n| ≤ N} Θ_Λ(1, n^k α)`, which by Poisson summation is
  `∑_{ξ ∈ Λ*} e^{−π|ξ|²} 𝔼_{|n|≤N} e(n^k ξ·α)`; it is stable under contraction of `N`, dilation of `α` by
  `q^k` and small perturbation of `α`; Weyl's inequality (`polynomial_weyl`, AC.3.14) converts a large
  frequency term into a rational approximation, and an induction on `d` over sublattices closes the
  argument (Leng–Sah–Sawhney, *Improved bounds for five-term arithmetic progressions*,
  arXiv:2312.10776, Proposition 3.7, p. 16, proved in Appendix B, Definition B.1, Proposition B.2 and
  Lemma B.3 onwards, pp. 21–24, following Green–Tao, *New bounds for Szemerédi's theorem II*,
  Appendix A, in the quadratic case).
- `polynomial_progression_partition`: for real polynomials `Q₁, …, Q_d` of degree at most `k`, `[N]`
  splits into `L` disjoint progressions with `N/L ≥ ½ N^{c_k/d^{C_k}}` on each of which every
  `Q_i(n) − Q_i(n')` is within `2N^{−c_k/d^{C_k}}` of an integer. Induction on `k`: apply the recurrence
  to the top coefficients with `D ≤ N^{1/2}`, cut `[N]` into progressions of difference `D` and length
  about `τ^{−1/(2k)}`, and recurse on the lower-degree remainders (Szemerédi paper, Lemma 2.3 and
  proof, pp. 3–4).


*Needs:* AC.3.9, AC.3.13, AC.3.14.

### AC.2.4 Nilsequence factors and regular resolutions

Construct `NilsequenceFactor`: for bounded real functions `h₁, …, h_T` on `[N]` and a resolution
`K > 0`, the partition of `[N]` by the finite label vector `(⌊K h_i(n)⌋)_i`, with empty cells
omitted; joins refine all chosen labels. The conditional average `factorAverage f` takes at `n` the
mean of `f` over the cell of `n`. Define `IsRegularResolution`: `K` is `C`-regular for `h` when for every
`r > 0` the proportion of `n ∈ [N]` with `dist(K h(n), ℤ) ≤ r` is at most `2Cr`. The factor is a native
finite partition; no measure-theoretic conditional expectation is involved (Leng–Sah–Sawhney,
Szemerédi paper, §3, Definitions 3.4–3.5 and Fact 3.6, pp. 8–10).

The API:

- `NilsequenceFactor.ofFunctions`: the partition into nonempty fibres of the bucket labels.
- `NilsequenceFactor.sameCell_iff`: two points share a cell iff all their labels agree.
- `NilsequenceFactor.join`: tuple labels give the common refinement.
- `factorAverage`: the cell mean.
- `factorAverage_mean`: `𝔼 factorAverage f = 𝔼 f`.
- `factorAverage_idempotent`: a cell-constant function is its own average.
- `factorAverage_bounds`: averaging preserves `0 ≤ f ≤ 1`.
- `factorAverage_refinement_energy`: refining cannot decrease `𝔼 |factorAverage f|²`.
- `IsRegularResolution`: the definition above.
- `regularResolution_exists`: for `h` on a nonempty interval and fixed `K > 0`, some shift
  `t ∈ [0, 1/K)` makes `h − t` `C`-regular for an absolute `C`.

*Needs:* AC.3.13; Mathlib `Finpartition`.

**Checks.**

- `NilsequenceFactor.test_one_cell`: a constant label gives one cell, and the conditional average is
  the global mean.
- `NilsequenceFactor.test_two_cells`: on `{1, 2, 3, 4}` with cells `{1, 2}` and `{3, 4}`, the values
  `0, 1, 2, 3` average to `1/2, 1/2, 5/2, 5/2`.
- `NilsequenceFactor.test_join`: joining a partition with itself preserves its cells.
- `IsRegularResolution.test_integer_constant`: if `K h` is identically an integer, no finite `C` works
  for every `r > 0`.
- `IsRegularResolution.test_half_constant`: if `K h` is identically `1/2`, it is `C`-regular for
  `C ≥ 1`.
- `IsRegularResolution.test_quarter`: if `Kh` is the constant `1/4`, its boundary proportion
  jumps from `0` to `1` at `r = 1/4`; regularity holds exactly for `C ≥ 2` on a nonempty interval.
- `factorAverage.test_refinement_energy`: on four points with values `0,0,1,1`, the one-cell
  average has mean-square energy `1/4`; the refinement into the two constant pairs has energy
  `1/2` and is fixed by a second averaging.
- `factorAverage.test_two_cells`: the two cells `{1,2}`, `{3,4}` and values `0,1,2,3`
  give `1/2,1/2,5/2,5/2`, rather than sums or a single global mean.
- `factorAverage.test_constant`: on any nonempty cell the constant `3/4` averages to `3/4`,
  independently of the cell's size.

### AC.2.5 Approximation by a nilsequence factor

Prove `uniform_factor_approximation`: for fixed `k ≥ 5`, `0 < η < 1/2` and real `0 ≤ f ≤ 1` on `[N]`,
there is a factor generated by `T` real degree-`(k − 2)` nilsequences of absolute value at most `2`
(shifts by `t_i ∈ [0, 1/K_i)` of real parts of `1`-bounded complex nilsequences), each of dimension
`d`, complexity `M` and regular resolution `K_i`, with `U^{k−1}[N](f − 𝔼(f | factor)) ≤ η`, where one
may take `d ≤ C_k (log* (1/η))^{C_k}` and `T, M, K_i ≤ exp(C_k (log* (1/η))^{C_k})`. The conditional
average is real with values in `[0, 1]`; the residual is `2`-bounded and is halved before the
`1`-bounded inverse theorem is applied. Regularity is obtained by shifting at each fixed resolution
`K_i`. While the residual norm exceeds `η`, the inverse theorem (AC.3.17) gives a correlating
nilsequence; a real or imaginary part of it, shifted to be regular, refines the factor and increases
the `L²` energy by a definite amount; energy is at most `1`, so the iteration stops (Leng–Sah–Sawhney,
Szemerédi paper, §3, Lemma 3.8 and proof, pp. 10–11).

*Needs:* AC.2.4, AC.3.17.

### AC.2.6 The density-increment trichotomy

Prove `progression_density_increment`: fix `k ≥ 5`. There are `c_k, c'_k, C_k > 0` such that for
`0 < δ ≤ 1` and `0 ≤ f ≤ 1` on `[N]` with mean at least `δ`, at least one holds:
`N ≤ exp(exp(C_k (log* (1/δ))^{C_k}))`; or `intervalProgressionAverage N f ≥ c_k δ^k`; or some
nonempty progression `P ⊆ [N]` has `|P| ≥ N^{1/exp(C_k (log* (1/δ))^{C_k})}` and mean of `f` on `P` at
least `(1 + c'_k)δ`. Approximate `f` by a regular nilsequence factor at tolerance a small multiple of
`δ^{6k}` and apply AC.2.2; partition into progressions on which the nilsequences are nearly constant
(AC.2.3); regularity bounds the bucket-boundary losses and gives a progression with large
structured conditional mean. The progression length is a positive power of `N`: the extraction on
p. 12 of the source prints a negative exponent, which is a misprint for the positive reciprocal
exponent of Lemma 3.7 and the iteration on p. 9. The choice of a regular resolution needs only the weak
`(1,1)` maximal inequality: the source asserts that the circular maximal function of a finite
atomic distribution has bounded average, which fails (near an atom the maximal function is at least
`1/(2 dist(t, ℤ))`, which is not integrable), while the weak inequality bounds the bad shifts by
`C/λ` and Fact 3.6 survives (Leng–Sah–Sawhney, Szemerédi paper, §3, Lemma 3.7, pp. 9–10, §3.1, pp. 9–10,
and the density-increment extraction, p. 12).

*Needs:* AC.2.2, AC.2.3, AC.2.5.

### AC.2.7 Szemerédi's theorem with the Leng–Sah–Sawhney bound

Prove `quantitative_szemeredi`: for each `k ≥ 5` there are `C_k ≥ 1` and `0 < c_k < 1` such that for
every `N ≥ 3` a subset `A ⊆ [N]` with no nonconstant `k`-term arithmetic progression has
`|A| ≤ C_k N exp(−(log log N)^{c_k})`. Consequently for every `k ≥ 4` and `δ > 0`, every subset of
density at least `δ` of a sufficiently long interval contains a nonconstant `k`-term progression (for
`k = 4`, take four terms of a five-term progression; no quantitative four-term claim is made); for
`k = 3` use Mathlib's `roth_3ap_theorem_nat`. Apply AC.2.6 to an indicator: the diagonal contributes
at most `1/(N + 1)`, so for large `N` a dense count produces a nonzero difference; iterate the
multiplicative density increase on affinely reindexed progressions, which stops after `O_k(log(1/δ))`
steps; invert the resulting double-exponential threshold and absorb small `N` into `C_k`
(Leng–Sah–Sawhney, Szemerédi paper, Theorem 1.1, p. 1; deduction at the end of §3, pp. 11–12).

*Needs:* AC.2.6; Mathlib `roth_3ap_theorem_nat`.

### AC.2.8 Upper natural density

Define `upperNaturalDensity A = limsup_{N → ∞} |A ∩ {0, …, N − 1}| / N` for `A ⊆ ℕ`: the density along
intervals anchored at `0`, not the upper Banach density. Removing a finite set does not change it
(Green–Tao, primes paper, §2, Proposition 2.1 and its setup, pp. 3–4).

The API:

- `upperNaturalDensity`: the definition above, a `Filter.limsup` of a sequence in `[0, 1]`.
- `upperNaturalDensity_bounds`: the value lies in `[0, 1]`.
- `upperNaturalDensity_finite`: a finite set has upper density `0`.
- `upperNaturalDensity_univ`: `ℕ` has upper density `1`.
- `upperNaturalDensity_mono`: inclusion cannot decrease upper density.
- `upperNaturalDensity_remove_finite`: removing a finite subset preserves upper density.
- `upperNaturalDensity_residue`: a residue class modulo `q ≥ 1` has upper density `1/q`.

*Needs:* Mathlib `Filter.limsup`, `Finset.range`.

**Checks.**

- `upperNaturalDensity.test_finite`: `{0, 1, 2}` has upper density `0`.
- `upperNaturalDensity.test_evens`: the even numbers have upper density `1/2`.
- `upperNaturalDensity.test_limsup`: a union of blocks `[N_j, 2^{N_j})` with `N_{j+1} ≥ 2^{2^{N_j}}` has
  upper density `1` and lower density `0`, so a `liminf` definition would give `0`.

### AC.2.9 The infinitary and Varnavides forms

Prove `szemeredi_varnavides_bridge`: the finite theorem (AC.2.7 together with Roth) implies (a) every
`A ⊆ ℕ` of positive upper natural density contains a nonconstant `k`-term progression beyond every
fixed lower bound, and (b) for fixed `k ≥ 3` and `δ > 0` there are `c(k, δ) > 0` and `N₀` such that for
every integer `N ≥ max(N₀, 1)` and `0 ≤ f ≤ 1` on `ZMod N` with `𝔼 f ≥ δ`,
`cyclicProgressionAverage f ≥ c(k, δ)`. Both are consequences of the finite theorem; no ergodic
correspondence is used. For (a) remove the finite prefix and take a long anchored interval of density
at least half the `limsup`. For (b) put `A = {f ≥ δ/2}`, of density at least `δ/2`; average over
progressions of bounded length, count those containing enough of `A`, apply the finite theorem on
each, bound how many ambient progressions witness one `k`-term progression, and multiply by
`(δ/2)^k` (Green–Tao, primes paper, §2, Propositions 2.1 and 2.3 and the Varnavides remark,
pp. 3–5). For composite `N` the same argument works: if the bounded auxiliary progression
length is `M`, the differences of order at most `M` occupy at most `∑_{q≤M} q` residues and are
discarded. Every remaining auxiliary progression is injective. An internal step `t ≤ M`
gives the equation `tr = d` with at most `gcd(t,N) ≤ M` solutions, so the witnessing multiplicity
is bounded in terms of `M`, independently of `N`. This supplies the composite moduli consumed
by AC.4.10. The two parts are `szemeredi_of_upperNaturalDensity_pos` and `szemeredi_varnavides`.

*Needs:* AC.2.1, AC.2.7, AC.2.8.

### AC.2.10 Rahman's threshold for three-term progressions

Prove `rahman_roth_threshold`: for `0 < δ < 1`, every integer `k ≥ exp(exp(132 log 2/δ))` and every
`J ⊆ {0, …, k − 1}` with `|J| ≥ δk` contain `i < j` with `i, j, 2j − i ∈ J`. The constant `132 log 2` is
part of the target; Mathlib's qualitative Roth theorem supplies neither the threshold nor its
numerical proof. This is the value Bennett and Siksek take from Rahman's note (Bennett–Siksek, *A
conjecture of Erdős, supersingular primes and short character sums*, Annals of Mathematics 191
(2020), §9, Theorem 8 and (36), printed p. 381; reference [31], p. 390); that note is not publicly
available, so the threshold is proved here by the following explicit route, which in fact gives the
much smaller threshold `log k ≥ 2^{⌈66/δ⌉} (log(9700/δ²) + 2 log(100/δ))`.

Prove first `roth_density_increment`: let `0 < α ≤ 1`, `N ≥ 9700/α²` and `A ⊆ {0, …, N − 1}` with
`|A| = αN` containing no `i < j` with `2j − i ∈ A`. Then some progression
`P = {a + md : 0 ≤ m < L} ⊆ {0, …, N − 1}` with `d ≥ 1` and `L ≥ α√N/100` has `|A ∩ P| ≥ (α + α²/64)L`.

1. Thirds. Let `I₁ = [0, ⌈N/3⌉)`, `I₂ = [⌈N/3⌉, ⌈2N/3⌉)` and `I₃ = [⌈2N/3⌉, N)`. If `A` has density at
   least `α + α²/64` on `I₁` or on `I₃`, that interval is `P` (its length is at least `N/3 − 1`).
   Otherwise `B = A ∩ I₂` has `|B| > αN/3 − α²N/96 − 2 ≥ αN/4`, using `N ≥ 28/α`.
2. Counting. Take a prime `2N < p ≤ 4N` and regard `[0, N)` inside `ZMod p`. A solution of
   `x + z = 2y` in `ZMod p` with `x, z ∈ A` and `y ∈ B` is a solution in `ℤ`, hence trivial, so
   `T(1_A, 1_B, 1_A) = |B|`, where `T(g₁, g₂, g₃) = ∑_{x + z = 2y} g₁(x)g₂(y)g₃(z)`. In the normalised
   transform of AC.0 (characters `x ↦ e(xξ/p)`), `T(g₁, g₂, g₃) = p² ∑_ξ ĝ₁(ξ)ĝ₂(−2ξ)ĝ₃(ξ)`, and by
   Cauchy–Schwarz and Parseval `|T(g₁, g₂, g₃)| ≤ p ‖ĝ_j‖_∞ ‖g_i‖₂ ‖g₂‖₂` for `{i, j} = {1, 3}`, since
   `ξ ↦ −2ξ` is a bijection for odd `p`.
3. Balanced function. Write `1_A = α1_{[0,N)} + f`, so `∑ f = 0`, `|f| ≤ 1` and `‖f‖₂² = α(1 − α)N`.
   Every `y ∈ I₂` has at least `2N/3 − 1 ≥ N/2` representations `2y = x + z` with `x, z ∈ [0, N)`, so
   `α²T(1_{[0,N)}, 1_B, 1_{[0,N)}) ≥ α²|B|N/2 ≥ |B| + α²|B|N/4` (as `α²N ≥ 4`). The three remaining
   terms of `T(1_A, 1_B, 1_A)` therefore have total modulus at least `α²|B|N/4`, and each is at most
   `p‖f̂‖_∞ √(αN) √|B|`, so `p‖f̂‖_∞ ≥ α^{3/2} √(|B|N)/12 ≥ α²N/24`: some `ξ` has
   `|∑_{x<N} f(x) e(−xξ/p)| ≥ ηN` with `η = α²/24`.
4. Partition. Let `L₀ = ⌊√(ηN/(32π))⌋` and `Q = ⌈16πL₀/η⌉`, so `QL₀ ≤ N` and `L₀ ≥ α√N/100` (here
   `ηN ≥ 128π` is used). Dirichlet's theorem gives `1 ≤ q ≤ Q` with `‖qξ/p‖ ≤ 1/Q`. Cut every residue
   class of `[0, N)` modulo `q` (each of length at least `L₀`) into blocks of consecutive terms of
   lengths in `[L₀, 2L₀)`. On a block the phase moves by at most `2π · 2L₀/Q ≤ η/4`, so the block sums
   `S_P = ∑_{x∈P} f(x)` satisfy `∑_P |S_P| ≥ (3/4)ηN`; as `∑_P S_P = 0`, the positive parts sum to at
   least `(3/8)ηN = (3η/8) ∑_P |P|`, and some block has `S_P ≥ (α²/64)|P|`.

Then iterate (`rahman_roth_threshold`). Rescaling a block affinely to `{0, …, L − 1}` preserves the
absence of three-term progressions. From `α₀ = |J|/k ≥ δ` the densities satisfy
`α_{i+1} ≥ α_i + α_i²/64`, hence `1/α_{i+1} ≤ 1/α_i − 63/4096`, so fewer than
`(4096/63)/δ < 66/δ` increments are possible. The lengths satisfy
`log N_{i+1} ≥ ½ log N_i − log(100/δ)`, and the increment applies at step `i` while
`N_i ≥ 9700/δ²`. Writing `c = log(100/δ)`, induction gives
`log N_i ≥ 2^{−i}(log k + 2c) − 2c`. If `log k ≥ 2^{⌈66/δ⌉} (log(9700/δ²) + 2 log(100/δ))`, the increment applies `⌈66/δ⌉`
times, which is impossible; so `J` contains a three-term progression. For `0 < δ < 1` this lower bound
is at most `2^{67/δ}(18.4 + 4 log(1/δ)) ≤ 2^{132/δ}`, which gives the stated threshold. The Fourier
argument is Roth's, as presented by Tao (254A Lecture Notes 4, §2, Proposition 2.4 and the
surrounding argument, printed pp. 2–7, of the notes cited in AC.1); the explicit constants and the
recurrence are this roadmap's.

*Needs:* AC.0.1, AC.0.3, AC.0.4; Mathlib `ThreeAPFree`, `Nat.exists_prime_lt_and_le_two_mul`
(Bertrand), `Real.exists_int_int_abs_mul_sub_le` (Dirichlet).

**Checks.**

- `roth_density_increment.test_positive_length`: the hypotheses imply `N > 0` and
  `α√N/100 > 0`, so the resulting integer `L` is positive. The multiplied condition
  `9700N ≤ |A|²` alone would admit `N = 0`, `A = ∅`, `L = 0`; the Lean signature excludes it.
- `roth_density_increment.test_increment_count`: at `δ = 1/2` the bound `(4096/63)(1/δ − 1)` allows at
  most `65` increments; with the weaker increment `α²/128` it would allow `129`, and the threshold would
  need `2^{130/δ}` in place of `2^{66/δ}`.
- `rahman_roth_threshold.test_length_recurrence`: for the numerical recurrence
  `u_{i+1} = u_i/2 − c`, take `c = 1`, terminal threshold `L = 3` and two steps. The starting
  value `2²L + 2c = 14` gives `u₁ = 6`, `u₂ = 2 < L`; the sufficient bound
  `2²(L + 2c) = 20` gives `u₁ = 9`, `u₂ = 7/2 ≥ L`. Leaving `2c` outside the power fails.
- `rahman_roth_threshold.test_consumer_margin`: at `δ = 10^{−5}` the threshold exponent
  `132 log 2 · 10^5 ≈ 9.15 · 10^6` is below `10^7`, the margin a downstream consumer uses.

### AC.2.11 The cycle removal lemma for layered graphs

Prove `layered_cycle_removal`: for every `m ≥ 3` and `ε > 0` there is `δ > 0` such that for every finite
set `V` with `n = |V|` and relations `E_i ⊆ V × V` indexed by `i ∈ ZMod m` (arcs from layer `i` to layer
`i + 1`), if the number of closed transversal walks, that is of `v : ZMod m → V` with
`(v_i, v_{i+1}) ∈ E_i` for every `i`, is at most `δ n^m`, then there are `E'_i ⊆ E_i` with
`|E_i \ E'_i| ≤ ε n²` for every `i` and no closed transversal walk in the `E'_i`. A closed walk that
advances one layer at each step winds exactly once around the cycle of layers, so this is the removal
lemma for directed `m`-cycles of Alon and Shapira, which Conlon and Fox state as their Theorem 4.3,
applied to the layered directed graph of their p. 20; only this layered case is owned here, not
general graph or directed-graph removal (Conlon–Fox, *Graph removal lemmas*, arXiv:1211.3487v1, §4,
Theorem 4.3 and the argument after it, p. 20). The proof is the regularity proof of the graph removal
lemma: apply Szemerédi's regularity lemma to the union of the bipartite graphs `E_i` on
`V × ZMod m`, intersect its parts with the layers (subpairs of linear size of a regular pair are
regular with a worse constant), delete the arcs between irregular pairs and between pairs of density
at most `ε`, and conclude with the counting lemma for labelled copies of a cycle with vertex `i` in
the `i`-th layer (Conlon–Fox, §2, the proof of Theorem 1.1 and Lemma 2.4, p. 8).

The counting step is the cycle analogue of the three-vertex counting estimate of TauCetiRoadmap's
Regularity roadmap (Layer 4, `StrongRegular.inducedGraphCount3_estimate`, whose proof bounds the
rectangle discrepancy of a `τ`-uniform pair for `[0, 1]`-valued tests by `τ|A||B|` and telescopes the
factors): telescoping over the `m` arcs of a cycle gives a labelled count within `mτ` of the product
of densities times the volume. Regularity ends at counting and leaves removal to its consumers, so
this layered removal lemma is owned here.

*Needs:* Mathlib `szemeredi_regularity`, `SimpleGraph.IsUniform`, `Finpartition`;
TauCetiRoadmap.Regularity Layer 4 (rectangle discrepancy of uniform pairs).

### AC.2.12 Removal for an ordered product equation in a finite group

Prove `ordered_product_removal`: for `m ≥ 2` and `ε > 0` there is `δ = δ(m, ε) > 0` such that for every
finite group `G` of order `N`, subsets `A₁, …, A_m ⊆ G` and `a ∈ G`, if the equation
`x₁ x₂ ⋯ x_m = a` has at most `δ N^{m−1}` solutions with `x_i ∈ A_i`, then one can delete at most `εN`
elements from each `A_i` so that no solution remains. `G` may be nonabelian; this is one ordered
product equation, not removal for arbitrary linear systems. For `m = 2` delete the first coordinates
of the few solutions. For `m ≥ 3` take `V = G` and the layered relations
`E_i = {(x, x b) : x ∈ G, b ∈ A_{i+1}}` for `0 ≤ i < m − 1` and
`E_{m−1} = {(x, x b) : x ∈ G, b ∈ A_m a⁻¹}`. A closed transversal walk `v₀, v₁ = v₀b₁, …` has labels
`b_i = v_{i−1}⁻¹ v_i` and closes exactly when `b₁ ⋯ b_{m−1} (a_m a⁻¹) = 1`, that is when
`a₁ ⋯ a_m = a`; so closed walks are exactly the `N` lifts (one for each starting point `x`) of the
solutions, and the `N` lifts of one solution use pairwise distinct arcs in each layer. Apply AC.2.11
with `ε/m`, and delete a label from `A_i` when at least `N/m` of its `N` arcs in layer `i − 1` were
deleted, which removes at most `εN` elements of each `A_i`. A solution whose labels all survive has
fewer than `m · N/m = N` deleted arcs among its `N` lifts, so one of its lifts survives as a closed
walk, a contradiction (Král'–Serra–Vena, *A removal lemma for systems of linear equations over finite
fields*, arXiv:0804.4847v1, Theorem 2, pp. 1–2, and Lemma 6 with the proof, pp. 4–6; Conlon–Fox, §4,
Theorem 4.2 and its proof, p. 20). The arbitrary finite-field system theorem of the same paper is a
different statement and is not part of this target.

*Needs:* AC.2.11.

### Examples

- On `ZMod 5`, the indicator of `{0}` has `cyclicProgressionAverage = 1/25`: the only progression is the
  trivial one `x = r = 0`, which is why the Varnavides form of AC.2.9 needs `N₀` and the
  transference endgame needs to control `r = 0`.
- In `[N]` the even numbers have density `1/2` and contain every progression with even difference; the
  set `{n : n ≡ 1, 2 mod 4}` of density `1/2` contains no `5`-term progression of difference `1`
  but many of difference `4`.
- In `G = ZMod N` with `m = 3`, `A₁ = A₂ = A₃ = A` and `a = 0`, the equation counts Schur-type triples
  `x + y + z = 0`; AC.2.12 says that few such triples can be destroyed by deleting few elements.

### Dependencies

AC.0 (the Fourier identity of Roth's argument), AC.3 (cube norms, interval norms, nilsequences, the
interval inverse theorem); Mathlib (Roth, regularity, `Finpartition`, Bertrand, Dirichlet
approximation); TauCetiRoadmap.Regularity Layer 4.

## Layer AC.4: Transference and arithmetic progressions in the primes

This layer proves that the primes contain arbitrarily long arithmetic progressions. The route
follows Conlon, Fox and Zhao (*The Green–Tao theorem: an exposition*, arXiv:1403.2957v4) and Zhao's
arithmetic transference (*An arithmetic transference proof of a relative Szemerédi theorem*,
arXiv:1307.4959v2): a weight satisfying only a finite linear-forms condition (AC.4.6) carries a dense
model in the cut sense (AC.4.7–AC.4.8), relative counting compares progression counts (AC.4.9), and
the relative Szemerédi theorem (AC.4.10) follows from the dense Varnavides theorem of AC.2.9. The
majorant is a smooth W-tricked truncated divisor sum spliced with `1` outside a half-window
(AC.4.11–AC.4.13); its only zeta input is Mathlib's bounded remainder `ζ(s) − 1/(s − 1)` near `1`, and
the prime weight's mass comes from the prime number theorem in the progression `1 mod W` for each
fixed `W` (the current Tau Ceti PNT specified in the supplier contracts). The original Green–Tao route, with pseudorandom measures that
also satisfy a correlation condition (AC.4.1–AC.4.5) and the sharp Goldston–Yıldırım majorant
(AC.4.14), is kept as a separate route with its own, stronger analytic inputs; the endgame AC.4.15
does not pass through it.

### AC.4.1 Green–Tao pseudorandom measures

Define `IsKPseudorandom`, for a family `ν_N : ZMod N → ℝ` indexed by primes `N`:

- `IsMeasureFamily`: `ν_N ≥ 0` and `𝔼 ν_N → 1` along primes;
- `LinearFormsCondition m₀ t₀ L₀`: for `m ≤ m₀`, `t ≤ t₀`, arbitrary offsets `b_i` and nonzero, pairwise
  nonproportional rational rows `(L_{ij})` whose reduced numerators and denominators are at most `L₀`
  (denominators invertible modulo all large primes), `𝔼_{x ∈ (ZMod N)^t} ∏_{i=1}^{m} ν_N(∑_j L_{ij} x_j
  + b_i) → 1`, uniformly in the offsets;
- `CorrelationCondition m₀`: there are weights `τ_{m,N} ≥ 0` on `ZMod N`, every fixed positive moment
  of which is bounded uniformly in `N`, with `𝔼_x ∏_{i=1}^{m} ν_N(x + h_i) ≤ ∑_{i<j} τ_{m,N}(h_i − h_j)`
  for `2 ≤ m ≤ m₀` and all shifts, repeated shifts included;
- for `k ≥ 3`, `k`-pseudorandom means the measure-family conditions, the linear-forms condition with
  `(m₀, t₀, L₀) = (k 2^{k−1}, 3k − 4, k)`, and the correlation condition of order `2^{k−1}`.

The asymptotic conditions are conditions on a family, written with explicit `ε`–`N₀` quantifiers,
never on a single function with an unexplained error. This is the stronger original route, kept
apart from the linear-forms condition of AC.4.6 (Green–Tao, primes paper, §2, (2.4), p. 5; §3,
Definitions 3.1–3.3, pp. 7–9).

The API:

- `IsMeasureFamily`, `LinearFormsCondition`, `CorrelationCondition`, `IsKPseudorandom`: the
  definitions above.
- `isKPseudorandom_def`: unfolding keeps every `k`-dependent parameter.
- `linearFormsCondition_uniform_in_b`: the chosen `N₀` works for all offsets at once.
- `nuConst_isKPseudorandom`: the constant family `ν_N = 1` is `k`-pseudorandom for `k ≥ 3`, with
  `τ = 1`.
- `correlationCondition_coincident`: equal shifts bound `𝔼 ν_N^m` by `binom(m, 2) τ_{m,N}(0)`.

*Needs:* Mathlib `Finset.expect`, `ZMod`.

**Checks.**

- `isKPseudorandom.test_constant`: `ν_N = 1` meets both conditions with `τ = 1`.
- `isKPseudorandom.test_mean_two`: the constant family `ν_N = 2` fails the measure condition and the
  singleton linear-forms moment.
- `isKPseudorandom.test_coincident_shifts`: for `m = 2` and equal shifts the correlation inequality
  reads `𝔼 ν_N² ≤ τ_{2,N}(0)`.
- `isKPseudorandom.test_parameters`: at `k = 3` the linear-forms parameters are `(12, 5, 3)` and the
  correlation order is `4`.
- `IsMeasureFamily.test_small_perturbation`: the nonnegative constant family `1 + 1/N` has
  mean tending to `1`; the constant family `2` fails this limit and `−1` fails nonnegativity.
- `LinearFormsCondition.test_zero`: the constant zero family fails already a one-form moment,
  while `1 + 1/N` has every fixed selected moment tending to `1`.
- `CorrelationCondition.test_two`: the constant family `2` satisfies each fixed correlation
  order with `τ_{m,N} = 2^m`, despite failing the mean-one condition.
- `CorrelationCondition.test_spike`: `ν_N = N 1_{0}` has mean `1`, but equal shifts require
  `τ_{2,N}(0) ≥ N`; its second moment is then at least `N` and is not uniformly bounded.
- `IsKPseudorandom.test_spike`: this same mean-one family fails pseudorandomness at every
  `k ≥ 3`, detecting omission of the correlation condition from the original definition.

### AC.4.2 Pseudorandom measures are Gowers-close to `1`

Prove `pseudorandom_gowers_close`: for a `k`-pseudorandom family and `1 ≤ d ≤ k − 1`,
`‖ν_N − 1‖_{U^d} → 0` along primes. Expand the diagonal cube of `ν − 1` into `2^{2^d}` products of
`ν`'s on subsets of the cube; each is a linear-forms average allowed by the condition, so all tend to
`1` and the signed sum tends to `0` (Green–Tao, primes paper, §5, Lemma 5.2, p. 13).

*Needs:* AC.3.1, AC.4.1.

### AC.4.3 The weighted generalised von Neumann estimate

Prove `weighted_generalised_von_neumann`: for fixed `k ≥ 3`, a `k`-pseudorandom family and real
functions with `|f_i| ≤ ν_N + 1`, `|cyclicProgressionAverage f| ≤ 2^{k+1} min_i ‖f_i‖_{U^{k−1}} +
o_k(1)` uniformly in the functions. The weighted Cauchy–Schwarz scheme uses the linear-forms condition
for the auxiliary weights (Green–Tao, primes paper, §5, Proposition 5.3, (5.11)–(5.12), pp. 14–19).

*Needs:* AC.2.1, AC.3.2, AC.4.1.

### AC.4.4 The weighted Koopman–von Neumann structure theorem

Prove `weighted_koopman_von_neumann`: for a `k`-pseudorandom `ν` and `0 ≤ f ≤ ν`, every sufficiently
small `ε > 0` gives a finite factor `𝔅` and a `𝔅`-measurable exceptional set `Ω` with
`𝔼 (ν + 1) 1_Ω = o_ε(1)`, `(1 − 1_Ω) 𝔼(ν | 𝔅) ≤ 1 + o_ε(1)` and
`‖(1 − 1_Ω)(f − 𝔼(f | 𝔅))‖_{U^{k−1}} ≤ ε`. Bound the dual functions using the correlation condition,
regularise their finite level-set partitions, refine while the residual has large Gowers norm (a
bounded weighted energy increases at each refinement), and remove the exceptional cells; the order
of the limits in `ε` and `N` is the source's (Green–Tao, primes paper, §8, Propositions 8.1 and 8.2,
pp. 28–34).

*Needs:* AC.2.4, AC.4.1, AC.4.2.

### AC.4.5 The original relative Szemerédi theorem

Prove `original_relative_szemeredi`: for fixed `k ≥ 3`, `δ > 0` and a `k`-pseudorandom family, every
`0 ≤ f_N ≤ ν_N` with `𝔼 f_N ≥ δ` has `cyclicProgressionAverage f_N ≥ c(k, δ) − o_{k,δ}(1)`, where
`c(k, δ) > 0` is the constant of the dense Varnavides theorem. Remove the exceptional cells of AC.4.4,
apply AC.2.9 to the bounded structured average, and control the difference by AC.4.3, choosing `ε`
first and then `N` large (Green–Tao, primes paper, §3, Theorem 3.5, pp. 9–10; deduction in §8,
pp. 29–30).

*Needs:* AC.2.9, AC.4.3, AC.4.4.

### AC.4.6 The linear-forms condition for progressions

Define, for `k ≥ 3` and `N` coprime to `(k − 1)!`, the forms
`ψ_j(x) = ∑_{i ≠ j} (i − j) x_i` on `(ZMod N)^k`. Double every variable into `x_i⁰, x_i¹`; for
`ω ∈ {0,1}^k` with `ω_j` omitted (fixed to `0`) put `x^ω = (x_i^{ω_i})_i`, giving `k 2^{k−1}` indexed
forms `ψ_j(x^ω)`. Define `apLinearFormsError ν` as the maximum over subsets `S` of this index set of
`|𝔼_{x⁰, x¹} ∏_{(j, ω) ∈ S} ν(ψ_j(x^ω)) − 1|`, and `APLinearFormsCondition ε ν`: `ν ≥ 0` and the
error is at most `ε`. A family satisfies the condition when its error tends to `0`. The empty
subproduct is `1`; requiring every selected subproduct is stronger than checking only the full
product or only `𝔼 ν`, and no separate correlation condition is imposed (Conlon–Fox–Zhao, §4,
Definition 4.2, p. 8, and Definition 3.4 for `k = 3`, p. 7; Zhao, §2, Definition 2.2 and
Example 2.3, pp. 2–3, where at `k = 3` there are exactly twelve forms).

The API:

- `apLinearForm`: evaluate `ψ_j` on the chosen doubled variables.
- `APFormIndex`: the index set of pairs `(j, ω)` with `ω_j` fixed to `false`.
- `apLinearFormsError`, `APLinearFormsCondition`: the definitions above.
- `APLinearFormsCondition.const_one`: `ν = 1` has error `0`.
- `APLinearFormsCondition.mean`: for `k ≥ 3` and coprime modulus, `|𝔼 ν − 1| ≤ ε`.
- `APLinearFormsCondition.mono_error`: increasing `ε` preserves the condition.
- `apLinearForm_index_card`: the index set has `k 2^{k−1}` elements.

*Needs:* Mathlib `Finset.expect`, `ZMod`, `Finset.powerset`.

**Checks.**

- `APLinearFormsCondition.test_k_three`: at `k = 3` the index set has twelve elements, not
  twenty-four.
- `APLinearFormsCondition.test_empty_product`: the empty selection has deviation `0` for every `ν`.
- `APLinearFormsCondition.test_constant_two`: for `ν = 2` a single form already has deviation `1`.
- `APLinearFormsCondition.test_constant_one`: `ν = 1` has deviation `0` for every selection.
- `apLinearForm.test_sign`: at `k = 3`, modulus `11` and `x = (1,2,4)`, the three forms
  are `(10,3,7)`, an arithmetic progression of difference `4`; reversing the coefficient signs
  changes these values.
- `APLinearFormsCondition.test_negative`: `ν = −1` has a singleton moment of `−1` and also
  fails nonnegativity; the empty selected product still equals `1`.
- `APFormIndex.test_zero`: at `k = 0` there are no indices.
- `APFormIndex.test_one`: at `k = 1` there is one index, since its sole bit is fixed to false.
- `apLinearForm.test_two`: at `k = 2`, modulus `11`, and `x = (2,5)`, the forms are `(5,9)`.
- `apLinearForm.test_omitted_coordinate`: changing only `x_j` leaves the `j`-th form unchanged;
  in the preceding example changing `x_0` from `2` to `3` leaves form zero equal to `5`.

### AC.4.7 Cut discrepancy

Define, for the maps `ψ_j : (ZMod N)^k → ZMod N` of AC.4.6, `arithmeticDiscrepancy j f g` as the supremum
over real tests `0 ≤ u_i ≤ 1` (`i ≠ j`), each `u_i` a function of the variables other than `x_i`, of
`|𝔼_x (f − g)(ψ_j(x)) ∏_{i ≠ j} u_i(x)|`. Define `IsDiscrepancyPair ε f g`: discrepancy at most `ε` for
every `j`. `N` coprime to `(k − 1)!` makes each `ψ_j` surjective; each test omits its own coordinate,
not coordinate `j` (Conlon–Fox–Zhao, §5, the cut norms (7)–(8) and `‖·‖_{□,r}`, p. 9, where the
tests are indicators of sets; by multilinearity `[0, 1]`-valued tests give the same supremum; Zhao,
§3, pp. 3–4).

The API:

- `arithmeticDiscrepancy`, `IsDiscrepancyPair`: the definitions above.
- `arithmeticDiscrepancy_self`: the discrepancy of `f` from itself is `0`.
- `arithmeticDiscrepancy_symm`: symmetry.
- `arithmeticDiscrepancy_triangle`: the triangle inequality.
- `arithmeticDiscrepancy_mean`: the discrepancy bounds `|𝔼 f − 𝔼 g|` (take all `u_i = 1`).
- `arithmeticDiscrepancy_l1`: the discrepancy is at most `𝔼 |f − g|`.

*Needs:* AC.4.6.

**Checks.**

- `arithmeticDiscrepancy.test_self`: every function has discrepancy `0` from itself.
- `arithmeticDiscrepancy.test_constants`: for constants `c, d` the discrepancy is `|c − d|`.
- `arithmeticDiscrepancy.test_mean`: the constants `0` and `1` are not a discrepancy pair at tolerance
  `1/2`.
- `IsDiscrepancyPair.test_self`: every function is a discrepancy pair with itself at tolerance
  zero.
- `IsDiscrepancyPair.test_constants`: the constants `0,1` meet tolerance `1` and fail tolerance
  `1/2`, since their discrepancy is exactly `1`.
- `IsDiscrepancyPair.test_negative_tolerance`: even the pair `(0,0)` fails at tolerance `−1`,
  since discrepancy is nonnegative; omitting the tolerance inequality would accept it.

### AC.4.8 The dense model theorem

Prove `arithmetic_dense_model`: for fixed `k ≥ 3` and `ε > 0` there is `η(k, ε) > 0` such that for `N`
coprime to `(k − 1)!`, `ν ≥ 0` with discrepancy from `1` at most `η`, and `0 ≤ f ≤ ν` with `𝔼 f ≤ 1`,
there is `0 ≤ g ≤ 1` with `IsDiscrepancyPair ε f g`; in particular `|𝔼 f − 𝔼 g| ≤ ε`. The hypothesis is
cut pseudorandomness against products of omitted-coordinate tests, which the linear-forms condition
implies by repeated Cauchy–Schwarz; exact equality of means is not asserted. Separate `f` from the
convex set of bounded models by a linear functional (finite-dimensional Hahn–Banach), approximate the
positive part by a polynomial on the functional's bounded range, and note that products of cut tests
remain cut tests, so small discrepancy of `ν` contradicts the separation (Conlon–Fox–Zhao, §5,
Theorem 5.1 and its proof with Lemma 5.2, pp. 9–11; Zhao, §3, Lemmas 3.3–3.4, p. 4).

*Needs:* AC.4.6, AC.4.7.

### AC.4.9 Relative counting

Prove `relative_progression_counting`: for `k ≥ 3` and `γ > 0` there are `ε, η > 0` such that if `ν`
meets the linear-forms condition with error `η`, `0 ≤ f_j ≤ ν`, `0 ≤ g_j ≤ 1`, and each pair `(f_j, g_j)`
has `ψ_j`-discrepancy at most `ε`, then
`|cyclicProgressionAverage f − cyclicProgressionAverage g| ≤ γ`, for `N` coprime to `(k − 1)!` and
constants depending only on `k, γ`. A cut model without the linear-forms moments does not give this.
Telescope the count, replacing one sparse function at a time; densify the neighbouring sparse
products with the doubled-moment estimates; repeated Cauchy–Schwarz bounds the densification error
and the remaining omitted-coordinate tests are controlled by the discrepancy (Conlon–Fox–Zhao, §6,
Theorem 6.2, Lemma 6.4 and Theorem 6.5 with the densification proof, pp. 11–16; Zhao, §4,
Lemma 4.1, pp. 4–5, specialising the relative hypergraph counting lemma they cite).

The proof is the relative simplex counting lemma for weighted `(k − 1)`-uniform `k`-partite
hypergraphs on `X₁ ∪ ⋯ ∪ X_k`, `X_i = ZMod N`, specialised to `ν_{−j}(x_{−j}) = ν(ψ_j(x_{−j}))` and
likewise for `f_j, g_j`; for `N` coprime to `(k − 1)!` the hypergraph cut norms of these are exactly the
arithmetic discrepancies of AC.4.7, by the change of variables `ix_i ↦ x_i` (Conlon–Fox–Zhao, §7,
(20)–(23), pp. 16–17). Its internal contract, with every error an explicit function of `ε` and `η`
tending to `0` with them, uniformly in `N`:

1. `dense_simplex_counting`: for weights `g, g̃` with values in `[0, 1]` and cut-norm distance at most
   `ε`, the simplex counts differ by at most `kε` (telescoping over the `k` faces; Proposition 6.1,
   p. 12, for triangles).
2. `cut_le_box`: put `r = k − 1`. Repeated Cauchy–Schwarz gives
   `‖ν − 1‖_cut^{2^r} ≤ 𝔼 ∏_{ω ∈ {0,1}^r} (ν(x^ω) − 1)`. The cube moment on the right is
   nonnegative. Expanding it into the selected products of the linear-forms condition cancels
   the constant terms and bounds it by `(2^{2^r} − 1)η`. Thus the cut norm is at most
   `((2^{2^r} − 1)η)^{1/2^r}`; it is the powered box norm, rather than the norm itself,
   which is `O_k(η)` (Lemma 6.3, (12), p. 13).
3. `strong_linear_forms`: if `0 ≤ g ≤ ν` and `0 ≤ g̃ ≤ 1` on the other faces, inserting a factor
   `ν − 1` on one face into the doubled count of the remaining faces changes it by `o(1)` as `η → 0`,
   whichever of the other factors are `g` and which `g̃` (Lemma 6.4, p. 13, for triangles, by two
   Cauchy–Schwarz steps; `k − 1` steps in general). This is where every selected subproduct of the
   linear-forms condition is used, not just the full product.
4. `densification` (induction on the number of faces on which `ν` is not identically `1`; Theorem 6.2
   and its proof, (13)–(19), pp. 12–15; Theorem 6.5 and the modifications listed on p. 16; the full
   hypergraph proof is Conlon–Fox–Zhao, *A relative Szemerédi theorem*, arXiv:1305.5440, §6.3 and the
   proof of Theorem 2.17, pp. 15–17): replace the face `x_{−1}` by the densified weights
   `ν'(x_{−1}) = 𝔼_{x₁} ∏_{j ≥ 2} ν(x_{−j})` and likewise `g', g̃'`; cap at `1`; then (13) splits the
   count difference into a dense term, bounded by the cut norm, and `𝔼[g(g' − g̃')]`, which
   Cauchy–Schwarz and item 3 reduce to `𝔼[(g' − g̃')²]`; the linear-forms condition gives
   `𝔼|ν' − 1| = o(1)`, so capping costs `o(1)` (15)–(17), and the induction hypothesis applied with the
   face `x_{−1}` replaced by `1`, by the indicator of a cylinder, or by the capped weight shows
   `‖g' ∧ 1 − g̃'‖_□ = o(1)` and that the four terms of (19) agree up to `o(1)`.

Zhao's arithmetic transference paper reaches the same conclusion through a dense-model
approximation (Lemmas 3.3–3.4, p. 4) and a counting lemma (Lemma 4.1, p. 5) that it takes from the
hypergraph statement; the contract above is the self-contained route.

*Needs:* AC.2.1, AC.4.6, AC.4.7.

### AC.4.10 The linear-forms relative Szemerédi theorem

Prove `linear_forms_relative_szemeredi`: for fixed `k ≥ 3`, `0 < δ ≤ 1` and a family `ν_N ≥ 0` whose
linear-forms error tends to `0` along moduli coprime to `(k − 1)!`, every `0 ≤ f_N ≤ ν_N` with
`𝔼 f_N ≥ δ` has `cyclicProgressionAverage f_N ≥ c(k, δ) − o_{k,δ}(1)` with `c(k, δ) > 0`; larger means
reduce to `δ ≤ 1` by scaling, and the error depends on the convergence rate of the linear-forms error.
Neither a correlation condition nor the Bombieri–Vinogradov theorem is a hypothesis. Take a dense
model of mean at least `δ − ε` (AC.4.8), apply the dense Varnavides theorem (AC.2.9) to it and relative
counting (AC.4.9), with `ε` small in terms of `k, δ` and then `η` small (Conlon–Fox–Zhao,
Theorem 4.3, p. 8, proved in §7, pp. 16–17; Zhao, Theorem 2.4 and §5, pp. 3 and 5–6).

*Needs:* AC.2.9, AC.4.8, AC.4.9.

### AC.4.11 The smooth W-tricked prime majorant

Construct `smoothMajorant`. Fix `k ≥ 3` and a smooth cutoff `χ : ℝ → [0, 1]` supported on `[−1, 1]` with
`χ(0) = 1` and `c_χ = ∫₀^∞ χ'(t)² dt > 0`. Put `Λ_{χ,R}(n) = log R · ∑_{d | n} μ(d) χ(log d/log R)`,
`W = primorial w`, `b ∈ {1, …, W}` coprime to `W`, and `R = N^{1/(k 2^{k+3})}`. On the half-window
`N/2 ≤ n < N` of representatives define `ν(n) = (φ(W)/W) Λ_{χ,R}(Wn + b)²/(c_χ log R)`, and `ν = 1`
outside it. The modified prime weight is `(φ(W)/W) log(Wn + b)` when `Wn + b` is prime and `0`
otherwise. At a shifted prime larger than `R` only `d = 1` contributes, so `Λ_{χ,R} = log R`, and on
the half-window `ν ≥ δ_k ·` (modified prime weight) with `δ_k = 1/(c_χ k 2^{k+4})` for large `N`
(Conlon–Fox–Zhao, §8, the modified von Mangoldt function and Proposition 8.1, p. 17; Definition 8.2,
p. 18; Proposition 8.4 and the proof of Proposition 8.1, p. 19; the source takes `b = 1`, and every
`b` coprime to `W` is handled by the same computation). Here `N`
is prime and large and `w = w(N) → ∞` slowly; divisors of a nonzero integer are positive divisors of
its absolute value; the cutoff is fixed throughout.

The API:

- `smoothDivisorSum`: `Λ_{χ,R}` on nonzero integers.
- `wTrickModulus`: `W = primorial w`.
- `modifiedPrimeWeight`: the shifted-prime logarithmic weight with the factor `φ(W)/W`.
- `smoothMajorant`: the definition above.
- `smoothMajorant_nonneg`: `ν ≥ 0`.
- `smoothMajorant_outside`: outside the half-window `ν = 1`.
- `smoothDivisorSum_large_prime`: for a prime `p > R`, `Λ_{χ,R}(p) = log R`.
- `smoothMajorant_dominates`: on the half-window `ν ≥ δ_k · modifiedPrimeWeight` for large `N`.
- `modifiedPrimeWeight_zero`: the weight vanishes when `Wn + b` is not prime.

*Needs:* Mathlib `ArithmeticFunction.moebius`, `Nat.totient`, `primorial`, `Nat.divisors`;
Mathlib `ArithmeticFunction.moebius`, `Nat.divisors`.

**Checks.**

- `wTrickModulus.test_small`: `w = 1` gives `W = 1` and `w = 5` gives `W = 30`.
- `smoothMajorant.test_outside`: a representative `n < N/2` gets weight `1`.
- `smoothDivisorSum.test_large_prime`: at a prime `p > R` the only nonzero term is `d = 1`, so the sum
  is `log R`.
- `modifiedPrimeWeight.test_shift`: for `W = 6`, `b = 1`, `n = 1` the shifted integer `7` is prime,
  although `n` is not.
- `modifiedPrimeWeight.test_composite`: for `W = 6`, `b = 1`, `n = 4` the shifted integer `25` gives `0`.
- `wTrickModulus.test_no_primes`: the empty prime product at `w = 0` is `1`.
- `wTrickModulus.test_composite_cutoff`: at `w = 4` the modulus is `6`, with no factor `4`.
- `smoothDivisorSum.test_one`: at `n = 1`, the value is `log R`, using `χ(0) = 1`.
- `smoothDivisorSum.test_prime_inside`: for prime `p ≤ R` the value is
  `log R · (1 − χ(log p/log R))`, including the negative Möbius coefficient at `p`.
- `modifiedPrimeWeight.test_normalization`: the shifted prime `7` at `W = 6, b = n = 1` has weight
  `log 7/3`, since `φ(6)/6 = 1/3`.
- `smoothMajorant.test_prime_value`: at a shifted prime above `R` in the half-window, its value
  is `(φ(W)/W) log R/c_χ`.
- `smoothMajorant.test_denominator`: at that same point, replacing the supplied positive `c_χ`
  by `2c_χ` halves the formula; this detects omission of the cutoff normalisation.

### AC.4.12 Moments of the smooth divisor sum along linear forms

Prove `smooth_divisor_linear_moments`: fix `m, t, L` and nonzero integer affine forms
`ψ₁, …, ψ_m : ℤ^t → ℤ` with pairwise nonproportional slopes and coefficients bounded by `L`. For `W` and
`b` as above, `R → ∞` with `R = o(N^{1/(10m)})`, and a product box with all side lengths at least
`R^{10m}`,

```text
𝔼_{x ∈ box} ∏_{i=1}^{m} Λ_{χ,R}(W ψ_i(x) + b)² = (1 + o_{m,t,L,χ}(1)) · (W c_χ log R/φ(W))^m,
```

uniformly in the permitted `b` and in offsets of size `O_L(N)`, where `w → ∞` slowly and the shifted
arguments are nonzero. Expand the divisor sums and impose divisibility by the Chinese remainder
theorem, controlling boundary counts by the side lengths; form the Euler product by smooth Fourier
inversion with rapid decay; at `p ≤ w` coprimality removes the local divisibilities, at large `p`
pairwise nonproportionality makes multiple coincidences `O(p^{−2})`; factor into zeta functions just
to the right of `1`. Mathlib's bound for `ζ(s) − 1/(s − 1)` near `1` controls the remainder; no
zero-free region and no Bombieri–Vinogradov theorem is used (Conlon–Fox–Zhao, Proposition 8.3 and its
proof in §9, pp. 18–23).

The analytic interfaces, with their parameters (Conlon–Fox–Zhao, §9, pp. 20–23):

1. `box_to_residues`: for squarefree `d_j, d'_j ≤ R` with lcm `D ≤ R^{2m}` and a box of side lengths at
   least `R^{10m}`, `𝔼_{x ∈ box} 1[d_j, d'_j | θ_j(x) for all j] = 𝔼_{x ∈ (ℤ/D)^t} 1[⋯] + O(R^{−8m})`, by
   trimming the box to side lengths divisible by `D`; summed over the at most `R^{2m}` choices this
   costs `O(R^{−6m} (log R)^{2m})` (p. 20, before (29)).
2. `cutoff_fourier_representation`: let `φ` be the Fourier transform of `x ↦ e^x χ(x)`, a smooth
   compactly supported function, so `φ` decays faster than every power. Then for `d ≥ 1`,
   `χ(log d/log R) = ∫_I d^{−(1+iξ)/log R} φ(ξ) dξ + O_A(d^{−1/log R}(log R)^{−A})` with
   `I = [−(log R)^{1/2}, (log R)^{1/2}]`, for every `A > 0` ((30), p. 20). In Mathlib terms: a smooth
   compactly supported function is a Schwartz function, and the Fourier transform of a Schwartz
   function is Schwartz.
3. `euler_factor_estimate`: the inner sum factors over primes into `E_p(ξ)`; `E_p = 1` for `p ≤ w`
   because `p ∤ Wψ_j(x) + b`; for `p > w` the local densities are `1`, `1/p` (exactly one divisibility)
   and at most `1/p²` (two or more, using that no two forms are proportional modulo `p` once `w` is
   large), so `E_p = (1 + O(p^{−2})) E'_p` with
   `E'_p = ∏_j (1 − p^{−1−z_j})(1 − p^{−1−z'_j})/(1 − p^{−1−z_j−z'_j})` ((33)–(34), p. 21).
4. `zeta_factorisation`: `∏_p E'_p = ∏_j ζ(1 + z_j + z'_j)/(ζ(1 + z_j)ζ(1 + z'_j))`, and since
   `ζ(1 + u) = 1/u + O(1)` for `Re u > 0`, `|u| = O(1)` (Mathlib `isBigO_riemannZeta_sub_one_div`;
   Conlon–Fox–Zhao prove it directly, p. 22) and `|z_j|, |z'_j| = O((log R)^{−1/2})` on `I`, this is
   `(1 + O((log R)^{−1/2})) ∏_j z_j z'_j/(z_j + z'_j)` ((35), (39), pp. 21–22); for `p ≤ w`,
   `E'_p = (1 + O(log p/(p (log R)^{1/2})))(1 − 1/p)^m`, giving the factor `(φ(W)/W)^m` ((36), p. 22).
5. `cutoff_constant`: extending `I` to `ℝ` costs `O_A((log R)^{−A})`, and
   `∫∫ φ(ξ)φ(ξ')(1 + iξ)(1 + iξ')/(2 + i(ξ + ξ')) dξ dξ' = ∫₀^∞ χ'(x)² dx = c_χ`, by writing
   `1/(2 + i(ξ + ξ')) = ∫₀^∞ e^{−(1+iξ)x} e^{−(1+iξ')x} dx` and recognising `−χ'` ((37)–(38), p. 22).
6. Error bounds: the error term of item 2 contributes `O_A((log R)^{O(1)−A} ζ(1 + 1/log R)^{O(1)})`,
   which is small for large `A` (p. 22–23).

The boxes with side length below `R^{10m}`, and those whose images meet a window boundary, are
handled in AC.4.13.

*Needs:* AC.4.11; Mathlib `isBigO_riemannZeta_sub_one_div`, `SchwartzMap`,
`SchwartzMap.fourierTransformCLM`.

### AC.4.13 The smooth majorant satisfies the linear-forms condition

Prove `smoothMajorant_linear_forms`: for every fixed `k ≥ 3`, the family of smooth majorants (with
`R = N^{1/(k2^{k+3})}`) has linear-forms error (AC.4.6) tending to `0` along primes, uniformly in the
permitted residues `b`, for `w(N) → ∞` sufficiently slowly. The half-window splice is part of the
claim: moment estimates on full boxes alone do not give it. Partition the doubled-variable cube into
slowly refining boxes; away from window boundaries each selected product is a fixed subproduct of
smooth sieve weights and ones, handled by AC.4.12; the boxes meeting a boundary are a vanishing
fraction whose mass is bounded with a higher selected moment; choose the grid and `w(N)` by a
diagonal argument so that each of the finitely many selected products has error tending to `0`
(Conlon–Fox–Zhao, §8, Proposition 8.4 and its proof from Proposition 8.3, pp. 19–20). Explicitly:
cut `(ZMod N)^t` into `Q^t` boxes of side about `N/Q`, with `Q = Q(N) → ∞` so slowly that
`N/Q ≥ R^{10m}`; a box is bad when the image of some form meets both `[N/2, N)` and its complement,
which forces `ψ_i(u)` to lie within `O(1)` of `0` or `Q/2` modulo `Q`, so a proportion `O(1/Q)` of boxes
is bad; on a bad box the bound `ν ≤ 1 + (φ(W)/W)Λ_{χ,R}(Wn + b)²/(c_χ log R)`, expanded, has average at
most `2^m + o(1)` by AC.4.12; on a good box each selected product is a fixed subproduct of sieve
weights and ones with average `1 + o(1)`.

*Needs:* AC.4.6, AC.4.12.

### AC.4.14 The original sharp-cutoff majorant

Construct `majorantNu`. For `k ≥ 3` put `ε_k = 1/(2^k (k + 4)!)`, `R = N^{1/(k 2^{k+4})}` (a real
number, not rounded), `W = primorial w(N)` and `Λ_R(n) = ∑_{d | n, d ≤ R} μ(d) log(R/d)`. The original
`ν` is `(φ(W)/W) Λ_R(Wn + 1)²/log R` on `ε_k N ≤ n ≤ 2ε_k N` and `1` elsewhere; the original prime
weight is `(φ(W)/W) log(Wn + 1)` at shifted primes and `0` otherwise. Domination uses the single
surviving divisor at a shifted prime larger than `R`, with constant `k⁻¹ 2^{−k−5}`. Green and Tao prove
that this family is `k`-pseudorandom (AC.4.1) using exact multiple-form and repeated-shift moment
computations (Green–Tao, primes paper, §9, Proposition 9.1 and Definitions 9.2–9.3, pp. 36–38;
Propositions 9.5–9.6, pp. 38–43; §10, pp. 43–50; Appendix A, pp. 51–56). Their internal contract:

1. `goldston_yildirim_linear_forms` (Proposition 9.5, p. 37): for affine forms with coefficients at
   most `√w(N)/2`, pairwise nonproportional, and a box of side lengths at least `R^{10m}`,
   `𝔼 ∏_i Λ_R(Wψ_i(x) + 1)² = (1 + o(1))(W log R/φ(W))^m`; with Lemma 9.7 and Proposition 9.8, p. 38,
   this is the linear-forms half of pseudorandomness.
2. `goldston_yildirim_correlation` (Proposition 9.6, p. 38) and `correlation_weight` (Lemma 9.9,
   p. 40): for distinct shifts `h_i` with `|h_i| ≤ N²` the shifted moment is at most
   `(1 + o(1))(W log R/φ(W))^m ∏_{p | Δ}(1 + O(p^{−1/2}))`, `Δ = ∏_{i<j}|h_i − h_j|`, and this product is
   bounded by `∑_{i<j} τ(h_i − h_j)` for a weight `τ ≥ 1` with all moments `𝔼_{0<|n|≤N} τ(n)^q = O(1)`;
   hence the correlation condition (Proposition 9.10, p. 41). The weight is
   `τ(n) = O_m(1) ∏_{p | n}(1 + p^{−1/2})^{O_m(1)}` for `n ≠ 0` (proof of Lemma 9.9, p. 40), whose moments
   are bounded by elementary counting, together with `τ(0) = exp(C_m log N/log log N)` for the case of
   two equal shifts, where `‖ν‖_∞ ≤ d(Wn + 1)² log R` is used (proof of Proposition 9.10, p. 41).
   This needs `card_divisors_le_exp`: `d(n) ≤ exp(C log n/log log n)` for `n ≥ 3`, with an absolute
   `C`. Proof: for `0 < ε ≤ 1`, `d(n)/n^ε = ∏_{p^a ∥ n}(a + 1)/p^{aε}`; the factors with `p ≥ 2^{1/ε}` are at
   most `1`, and each of the others is at most `1 + 1/(ε log 2)`, so
   `d(n) ≤ n^ε exp(2^{1/ε} log(1 + 1/(ε log 2)))`; take `ε = 2 log 2/log log n` (Tao, *The divisor
   bound*, blog post of 23 September 2008, which proves `d(n) ≤ n^{O(1/log log n)}` this way).
   AnalyticNumberTheoryPartI states only the fixed-`ε` bound `d(n) ≪_ε n^ε` (§3.1), which does not
   keep the moments of `τ` bounded for every `q`.
3. `local_factor_estimate` and `euler_product_continuation` (Lemmas 10.1, 10.3, 10.5 and 10.6,
   pp. 44–47): the local densities at `p ≤ w` vanish, those at `p > w` are `p^{−1}` or at most `p^{−2}`
   (respectively `p^{−1}` and vanishing unless `p | Δ` in the correlation case), and the resulting
   Euler products continue analytically to `D^m_σ`, `σ < 1/(6m)`, with controlled `C^m` norms.
4. `contour_evaluation` (Lemma 10.4, p. 46, proved in Appendix A, pp. 51–56): the `2m`-fold contour
   integral of `G(z, z') ∏_j ζ(1 + z_j + z'_j)/(ζ(1 + z_j)ζ(1 + z'_j)) R^{z_j + z'_j}/(z_j² z'_j²)` equals
   `G(0)(log R)^m` plus lower-order terms in the `C^j` norms of `G` and `O(e^{−δ√log R})`. Its inputs
   are the classical zero-free region with logarithmic bounds for `ζ(s) − 1/(s − 1)` and `1/ζ(s)`
   (Lemma A.1, p. 51) and the contour estimates of Lemma A.2, p. 52.

The truncated divisor sum, the majorant and their pointwise properties are owned here, as in
AC.4.11. The window `[ε_kN, 2ε_kN]` avoids wraparound; the unbounded-tail approximation of the
structure theorem is AC.4.4's, not an extra input of this target.

The API:

- `truncatedDivisorSum`: `Λ_R` with real cutoff `R` and positive divisors.
- `modifiedVonMangoldt`: the `b = 1` prime weight.
- `majorantNu`: the narrow-window majorant above.
- `majorantNu_nonneg`: `ν ≥ 0` for `R > 1`.
- `majorantNu_outside`: `ν = 1` outside its window.
- `majorantNu_dominates`: on its window `ν ≥ k⁻¹ 2^{−k−5} · modifiedVonMangoldt` for large `N`.
- `majorantNu_isKPseudorandom`: the family is `k`-pseudorandom, given the analytic inputs above.

*Needs:* AC.4.1; Mathlib `ArithmeticFunction.moebius`, `Nat.totient`, `primorial`;
AnalyticNumberTheoryPartI §0.33 (the zero-free region with the logarithmic bounds for `ζ(s) − 1/(s − 1)`
and `1/ζ(s)`, which is Green–Tao's Lemma A.1).

**Checks.**

- `majorantNu.test_outside_range`: at the representative `0` the weight is `1`.
- `majorantNu.test_nonneg`: on the window the formula is a square divided by `log R > 0`.
- `modifiedVonMangoldt.test_shifted_primality`: for `W = 6`, `n = 1` the weight is nonzero because `7` is
  prime.
- `majorantNu.test_domination_constant`: at `k = 3` the domination constant is `1/(3 · 2⁸)`, not `1`.
- `truncatedDivisorSum.test_one`: at `n = 1` and `R > 1`, the value is `log R`.
- `truncatedDivisorSum.test_prime_above`: at prime `p > R > 1`, the value is `log R`.
- `truncatedDivisorSum.test_prime_below`: at prime `p ≤ R`, the two divisors give
  `log R − log(R/p) = log p`.
- `majorantNu.test_prime_value`: at a shifted prime `Wn + 1 > R` inside the narrow window, the
  value is exactly `(φ(W)/W) log R`, including both the square and the division by `log R`.
- `modifiedVonMangoldt.test_normalization`: at `W = 6`, `n = 1` the value is `log 7/3`.
- `modifiedVonMangoldt.test_composite`: at `W = 6`, `n = 4` the value is zero.

AC.4.15's smooth route does not use this target; it is kept as the original Green–Tao comparison.

### AC.4.15 The Green–Tao theorem

Prove `prime_progressions`: for every `k ≥ 1` and every bound `H` there are `a > H` and `r ≥ 1` with
`a, a + r, …, a + (k − 1) r` all prime. For each fixed `w`, the prime number theorem in the progression
`1 mod W` (the current Tau Ceti declaration specified above, at `q = W`, `a = 1`) evaluated at `WN + 1` and `WN/2 + 1` shows that
the modified prime weight has mean tending to `1/2` on the half-window; choose `w(N) → ∞` slowly by
diagonalising this convergence together with the finitely many moment estimates of AC.4.13. No
estimate uniform over growing moduli is used. Scale the prime weight by `δ_k`, so that it is bounded
by the smooth majorant, and apply AC.4.10. The `r = 0` terms contribute `O_k((log N)^k/N)`, so a nonzero
cyclic difference survives. All selected points lie in one interval of length less than `N/2`, so
consecutive differences lift uniquely to integers of absolute value less than `N/2` and are equal as
integers; reverse the progression if the difference is negative, undo the W-trick, and let `N`
exceed `H` (Conlon–Fox–Zhao, §8, the proof of Theorem 1.1 assuming Proposition 8.1, pp. 17–18;
Green–Tao, primes paper, Theorem 1.1, p. 1, and the endgame of §9, pp. 36–37).

*Needs:* AC.4.10, AC.4.11, AC.4.13; the current Tau Ceti fixed-modulus PNT specified in the supplier
contracts, with the rational-prime identification and partial summation described there.

### Examples

- The W-trick at `w = 5`: `W = 30`, and `b = 1, 7, 11, 13, 17, 19, 23, 29` are the residues coprime to
  `30`; for `b = 1` the shifted integers `30n + 1` are prime for `n = 1, 2` (`31, 61`) and composite for
  `n = 3, 4` (`91 = 7 · 13`, `121 = 11²`).
- At `k = 3` the linear-forms condition of AC.4.6 has `3 · 2² = 12` forms; Green and Tao's condition at
  `k = 3` asks for `m ≤ 12` forms in at most `5` variables with coefficients at most `3`, plus a
  correlation condition of order `4`.
- The progression `5, 11, 17, 23, 29` (common difference `6`) is a five-term progression of primes; for
  `k = 6` the progression `7, 37, 67, 97, 127, 157` (difference `30`) works.

### Dependencies

AC.2 (progression averages and the dense Varnavides theorem), AC.3 (Gowers norms); Mathlib (Möbius,
von Mangoldt, totient, primorial, the zeta remainder near `1`, Schwartz functions and their Fourier
transform); the current Tau Ceti fixed-modulus PNT; AnalyticNumberTheoryPartI §0.33 (AC.4.14 only).

## Layer AC.5: Möbius orthogonality and linear patterns in primes

This layer proves that the Möbius function is orthogonal to nilsequences (Green–Tao, *The Möbius
function is strongly orthogonal to nilsequences*, arXiv:0807.1736v4), the asymptotic count of
finite-complexity linear patterns in the primes (Green–Tao, *Linear equations in primes*,
arXiv:math/0606088v2, with the finite quantitative inputs of AC.3 and Leng's Theorem 5), and Kai's
theorems on linear patterns of prime elements in a fractional ideal of a number field and in its
localisations (*Linear patterns of prime elements in number fields*, arXiv:2306.16983v5). It
consumes AC.3 and the arithmetic suppliers directly; it does not inherit the hypotheses of AC.4.
Every pattern theorem states its complexity hypothesis: systems with two proportional forms, such as
twin primes and Goldbach's problem, are outside its scope.

### AC.5.1 Density of sums of powers

Prove `power_sum_density`: for `j ≥ 1`, `t ≥ 2^j + 1` and `0 < α ≤ 1` there is `c_{j,t} > 0` such that every
`S ⊆ {1, …, K}` with `|S| ≥ αK` has `|{x₁^j + ⋯ + x_t^j : x_i ∈ S}| ≥ c_{j,t} α^{2t} K^j`. The total
representation mass is `|S|^t`; by Cauchy–Schwarz the support has size at least `|S|^{2t}` divided by
the second moment of the representation function, which is at most `|S|^t` times the uniform bound
`C_{j,t} K^{t−j}` for the number of representations by `t` positive `j`-th powers. That bound is
elementary for `j = 1` and comes from the circle-method asymptotics for `j ≥ 2` (Green–Tao, Möbius
paper, §3, Lemma 3.3 and proof, p. 9). The uniform bound is derived as follows. For `j ≥ 3` the
representations from `[1, K]^t` number at most `r^+_{j,t}(m)`, which is
`≤ C m^{t/j − 1} ≤ C' K^{t−j}` for `m ≥ M₀` by `waring_classical_asymptotic` and the bound on the singular
series uniform in `m` from `waring_series_absolute_convergence`, and at most `M₀^t` for `m < M₀`. For
`j = 2`, `t ≥ 5`, apply `heath_brown_quadratic_asymptotic` to `Q = x₁² + ⋯ + x_t²` with a smooth
compactly supported weight `w ≥ 0` equal to `1` on the unit sphere (every solution has `x/√m` on the
sphere), so the count is at most `μ_∞ m^{t/2−1} ∏_p μ_p + O(m^{(t−1)/4+ε})`; the singular series is
bounded uniformly in `m` by `singular_series_squares_bound`: its `q`-th term is
`q^{−t} ∑_{a mod q, (a,q)=1} S(q, a)^t e(−am/q)` with Gauss sums `|S(q, a)| ≤ √(2q)`, hence at most
`2^{t/2} q^{1−t/2}`, which is summable for `t ≥ 5`.

This target is not used by AC.5.2, whose coefficient control goes through the strong-recurrence
lemma instead.

*Needs:* ExponentialSumsAndCircleMethod Layers 4–5 (`waring_classical_asymptotic`,
`waring_series_absolute_convergence`, `heath_brown_quadratic_asymptotic`); Mathlib Gauss sums.

### AC.5.2 Möbius orthogonality on a totally equidistributed orbit

Prove `mobius_equidistributed`: fix a dimension `m` and a filtration degree `d`. There are
`c_{m,d} > 0` and `C_{m,d}` such that for large `N`, `0 < δ < 1/2`, `Q ≥ 2`, a `Q`-rational nilmanifold and
a polynomial orbit totally `δ`-equidistributed on `[N]`, every real Lipschitz `F` with `∫ F = 0` and
every progression `P ⊆ [N]` of length at least `N/Q`,
`|𝔼_{n ∈ [N]} μ(n) 1_P(n) F(g(n)Γ)| ≤ C_{m,d} δ^{c_{m,d}} Q ‖F‖_Lip log N`. Apply the Type I/II
dichotomy for `μ` to the normalised observable restricted to `P`. In the Type I case the quantitative
Leibman theorem on many dilated orbits and coefficient control contradict total equidistribution; in
the Type II case the product orbit and its horizontal obstructions do so after repeated
Cauchy–Schwarz (Green–Tao, Möbius paper, arXiv:0807.1736, Proposition 2.1, pp. 3–4; the proof in §3,
pp. 6–11).

The dichotomy is owned here as `mobius_type_I_II`: if `|f| ≤ 1` and `|𝔼_{N<n≤2N} μ(n) f(n)| ≥ ε`, then
either (Type I) for some `1 ≤ K ≤ N^{2/3}`, at least `(ε/log N)^{O(1)} K` integers `k ∈ (K, 2K]` have
`|𝔼_{N/k<w≤2N/k} f(kw)| ≥ (ε/log N)^{O(1)}`, or (Type II) for some `½N^{1/3} ≤ K ≤ 4N^{2/3}` and `W` with
`N/4 ≤ KW ≤ 4N`, `|𝔼_{K<k,k'≤2K} 𝔼_{W≤w,w'<2W} f(kw) conj(f(k'w)) conj(f(kw')) f(k'w')| ≥ (ε/log N)^{O(1)}`
(Möbius paper, Proposition 3.1, pp. 6–7). Its proof is Vaughan's identity for `μ` with
`U = V = N^{1/3}`, the divisor-moment bounds for the coefficients, dyadic decomposition and
Cauchy–Schwarz in the long variable (Green–Tao, *Quadratic uniformity of the Möbius function*, Ann.
Inst. Fourier 58 (2008), arXiv:math/0606087, §4, Lemma 4.1, pp. 12–13, and
Proposition 4.2, pp. 13–14, in the preprint). It is a statement about `μ`, not
replaced by a Vaughan identity for `Λ`.

In the Type I case Green and Tao pass from many `k` with
`‖q k^j β_j‖_{ℝ/ℤ} ≪ δ^{−O(c₁)}(N/K)^{−j}` to rationality of `β_j` through their Waring density
Lemma 3.3. Here use `strong_polynomial_recurrence` from AC.3.14 instead. For
`K ≥ δ^{−C_j O(c₁)}`, apply it to `n ↦ qβ_j n^j` on `[2K]`, with the density and interval length
from the Type I output. It gives a multiplier `1 ≤ k' ≤ δ^{−O_j(c₁)}` such that
`‖j! k' q β_j‖_{ℝ/ℤ} ≪ δ^{−O_j(c₁)} N^{−j}`. For smaller `K`, choose one good integer
`k ≤ 2K` directly: the multiplier `k^j` is already at most `δ^{−O_j(c₁)}`, and the same bound
follows from the displayed approximation after absorbing `K^j`. Thus no recurrence assertion
on a one-point interval is used (Green–Tao, polynomial orbits, Lemma 4.5, p. 22; Möbius paper,
(3.10)–(3.11), p. 9).

*Needs:* AC.3.14 (`polynomial_weyl`, `strong_polynomial_recurrence`), AC.3.20;
Mathlib `ArithmeticFunction.moebius`.

### AC.5.3 Möbius–nilsequence orthogonality

Prove `mobius_nilsequence_orthogonality`: for every dimension `m ≥ 1`, filtration degree `d ≥ 1` and
`A > 0` there are `C_{m,d,A} > 0` and `B_{m,d,A}` such that for `N ≥ 2`, `Q ≥ 2`, a `Q`-rational adapted
nilmanifold, any polynomial sequence `g` and any real Lipschitz `F : G/Γ → [−1, 1]`,

```text
|𝔼_{n ∈ [N]} μ(n) F(g(n)Γ)| ≤ C Q^B (1 + ‖F‖_Lip) (log N)^{−A}.
```

The constants are ineffective; complex `1`-bounded `F` are handled by real and imaginary parts. The
bound is uniform in `g`. Factorise the orbit with `M₀ = log N` (AC.3.20); split by the rational period
and into subprogressions on which the smooth factor is nearly constant; conjugate to the rational
subnilmanifold with a quantitative comparison of bases and metrics; subtract the mean of the
observable. The mean-zero part is AC.5.2; the mean part is a periodic Möbius sum; choose the
factorisation exponent large enough to absorb the polylogarithmic losses (Green–Tao, Möbius paper,
Theorem 1.1, p. 2; §2, pp. 4–6; Appendix A, Propositions A.1–A.2, pp. 21–22).

The periodic sums are derived here (`mobius_periodic_sum`) from the residue-class estimate of
AnalyticNumberTheoryPartI (§1.2, `mobius_small_modulus_progressions`): for every `B, C > 0`, uniformly
in `q ≤ (log x)^C` and every residue `b`, `∑_{n ≤ y, n ≡ b mod q} μ(n) ≪_{B,C} x (log x)^{−B}` for `y ≤ x`.
A `q`-periodic `b` with `|b| ≤ 1` is a combination of `q` residue-class indicators, so
`|N^{−1} ∑_{n ≤ N} μ(n) b(n)| ≪ q (log N)^{−B}` for `q ≤ (log N)^C`; for `q > (log N)^A` the bound
`q (log N)^{−A} > 1` is trivial, so with `C = A` and `B = 2A` this gives Green–Tao's Proposition A.2,
`≤ C_A q (log N)^{−A}`, for all `q`. The same splitting with `χ(b)` as coefficients and `B = 3A` gives
Proposition A.1, `≤ C_A q^{1/2}(log N)^{−A}`: for `q ≤ (log N)^{2A}` the bound is `q (log N)^{−3A} ≤
q^{1/2}(log N)^{−2A}`, and for larger `q` it is trivial.

*Needs:* AC.3.20, AC.5.2; AnalyticNumberTheoryPartI §1.2 (`mobius_small_modulus_progressions`).

### AC.5.4 Affine systems and Cauchy–Schwarz complexity

Define the structure `AffineSystem t d`: integer forms `ψ_i(x) = b_i + v_i · x` (`i < t`) with
`b_i ∈ ℤ`, `v_i ∈ ℤ^d`. Its size at scale `N` is `max_i max(‖v_i‖_∞, |b_i|/N)`. Define `HasCSComplexity s`:
for every `i`, the other indices split into at most `s + 1` classes such that `v_i` is not in the
`ℚ`-span of the slopes of any one class. Empty classes are allowed (a nonzero slope is outside the
zero span); constants are allowed, which is the affine convention. Finite complexity excludes
proportional slopes, and the prime-pattern theorems assume every slope nonzero (Green–Tao, linear
equations, Definitions 1.1 and 1.5, pp. 2–3 and 7; Lemma 1.6, p. 8).

The API:

- `AffineSystem.eval`: the values of the forms.
- `AffineSystem.linearPart`: the linear maps given by the slopes.
- `AffineSystem.size`: the size at scale `N`.
- `HasCSComplexity`: the definition above.
- `HasCSComplexity.mono`: complexity at most `s` implies at most `s + 1`.
- `HasCSComplexity.finite_iff`: for nonzero slopes, finite complexity is equivalent to pairwise
  `ℚ`-nonproportionality.
- `HasCSComplexity.progressions`: the `k`-term progression system `x + ir` has complexity `k − 2` for
  `k ≥ 2`.
- `HasCSComplexity.independent`: independent coordinate forms have complexity `0`.
- `AffineSystem.reindex`: permuting the forms preserves complexity and local factors.

*Needs:* Mathlib `AffineMap`, `Submodule.span`.

**Checks.**

- `HasCSComplexity.test_coordinates`: the system `x, y` has complexity `0`.
- `HasCSComplexity.test_three_ap`: `x, x + r, x + 2r` (the system `threeAP`) has complexity `1` and not `0`.
- `HasCSComplexity.test_twins`: `x, x + 2` (the system `twins`) has infinite complexity.
- `HasCSComplexity.test_goldbach`: `x, H − x` has proportional slopes and infinite complexity.
- `AffineSystem.test_eval`: `threeAP` at `(x,r) = (2,3)` evaluates to `(2,5,8)`.
- `AffineSystem.test_offsets`: `twins` at `x = 5` evaluates to `(5,7)`; its equal slopes do not
  discard its different affine offsets.
- `AffineSystem.test_constant`: the one-form system `ψ(x) = 5` has zero slope and infinite
  Cauchy–Schwarz complexity, since zero is in the span even of the empty class.

### AC.5.5 Integer local factors

Define `integerLocalFactor Ψ p = 𝔼_{x ∈ (ZMod p)^d} ∏_i (p/(p − 1)) · 1[ψ_i(x) ≢ 0 mod p]` for a prime
`p` and a system with nonzero slopes, and `integerArchimedeanFactor Ψ Ω` as the volume of
`Ω ∩ {x : ψ_i(x) > 0 for all i}` for a convex `Ω ⊆ [−N, N]^d`; the positivity region is needed because
`Λ` vanishes on nonpositive integers. The singular product is `∏_p β_p` when it converges. For
pairwise nonproportional slopes, discard the finitely many primes dividing a coefficient minor and use
two-hyperplane intersection counts (Green–Tao, linear equations, (1.4) and (1.6), pp. 4–5; Lemma 1.3,
p. 5).

The API:

- `integerLocalFactor`, `integerArchimedeanFactor`: the definitions above.
- `integerLocalFactor_nonneg`: `β_p ≥ 0`.
- `integerLocalFactor_positive_iff`: `β_p > 0` iff some residue vector avoids `0` in every form.
- `integerLocalFactor_reindex`: permuting the forms preserves `β_p`.
- `integerLocalFactor_good_prime`: outside finitely many primes, `β_p = 1 + O_{d,t,L}(p^{−2})` for
  pairwise nonproportional slopes.
- `integerSingularProduct_positive`: for finite complexity the product converges absolutely and is
  positive iff every `β_p` is.

The convergence and positivity are owned here (`integerLocalFactor_good_prime`,
`integerSingularProduct_positive`). Let `A ≠ 0` be divisible by one nonzero coordinate of every slope
and by one nonzero `2 × 2` minor of every pair of slopes. For `p ∤ A`, each form has nonzero slope
modulo `p` and no two slopes are proportional, so by
inclusion–exclusion `β_p = (p/(p−1))^t (1 − t/p + O_t(p^{−2}))` (each single vanishing has probability
`1/p`, each pair `1/p²`), which is `1 + O_t(p^{−2})`; hence `∏_p β_p` converges absolutely, and it is
positive exactly when every factor is (Green–Tao, linear equations, Lemma 1.3, p. 5; Kai, Claim 5.3,
p. 18, and Remark 12.3, p. 55, for the number-field analogue).

*Needs:* AC.5.4; Mathlib `Finset.expect`, `MeasureTheory.volume`.

**Checks.**

- `integerLocalFactor.test_one_coordinate`: for `ψ(x) = x`, `β_p = 1`.
- `integerLocalFactor.test_coordinates`: for independent coordinate forms every `β_p = 1`.
- `integerLocalFactor.test_parity_obstruction`: for `ψ(x) = 2x`, `β₂ = 0`.
- `integerArchimedeanFactor.test_positive_region`: for `ψ(x) = x` and `Ω = [−N, N]`, `β_∞ = N`, not
  `2N`.
- `integerArchimedeanFactor.test_two_coordinates`: for `ψ₁(x,y) = x`, `ψ₂(x,y) = y` on
  `[−N,N]²`, the positivity volume is `N²` for `N ≥ 0`.
- `integerArchimedeanFactor.test_conflicting_signs`: the two nonzero-slope forms `x, −x` have
  empty common strict positivity region and factor zero.

### AC.5.6 Complexity for vector-valued forms

Define `HasModuleCSComplexity s`: for affine maps `ψ_i : ℤ^d → ℤ^n`, for each `i` the other indices
split into at most `s + 1` classes `C` such that the restriction of the linear part of `ψ_i` to
`⋂_{j ∈ C} ker ψ̇_j` has rank `n`; integer rank `n` is equivalent to finite cokernel in `ℤ^n`. Define
`HasTorsionCokernel`: every element of the cokernel has finite additive order. In the localised
setting (targets `𝔞[S⁻¹]`) torsion cokernel replaces finite cokernel and is required for each
individual map too; the localised module is not finitely generated over `ℤ`, so torsion does not imply
finite. Offsets do not affect the kernels, and the condition is not the scalar pairwise
nonproportionality (Kai, Appendix D, Definition D.1 and Proposition D.2, p. 70; Theorems 12.1 and 13.1,
pp. 54 and 56).

The API:

- `HasModuleCSComplexity`, `HasTorsionCokernel`: the definitions above.
- `HasModuleCSComplexity.mono`: increasing the class bound preserves the condition.
- `HasModuleCSComplexity.scalar`: for `n = 1` it agrees with `HasCSComplexity`.
- `fullRank_iff_finite_cokernel`: for an integer linear map into `ℤ^n`, rational rank `n` iff finite
  cokernel.
- `finiteCokernel_hasTorsionCokernel`: a finite cokernel is torsion; the converse fails for targets
  that are not finitely generated.

*Needs:* Mathlib `LinearMap.ker`, `LinearMap.range`, `Submodule.span`.

**Checks.**

- `HasModuleCSComplexity.test_independent_blocks`: the projections `ℤ⁴ → ℤ²` onto the first and the
  last two coordinates satisfy the condition.
- `HasModuleCSComplexity.test_gaussian`: the maps `ℤ² → ℤ[i]`, `(x, y) ↦ x + iy` and `x − iy`, have zero
  kernels, so each restricted to the other's kernel is zero and the condition fails.
- `HasTorsionCokernel.test_localized`: `ℤ → ℤ[1/p]` has torsion but infinite cokernel.
- `HasModuleCSComplexity.test_scalar_twins`: scalar twins still fail: the relevant restriction is
  zero.
- `HasTorsionCokernel.test_finite`: multiplication by `2` on `ℤ` has cokernel `ℤ/2ℤ`, hence
  torsion.
- `HasTorsionCokernel.test_free_quotient`: `ℤ → ℤ²`, `x ↦ (x,0)`, has a free quotient and fails the
  torsion-cokernel condition.

### AC.5.7 The vector-valued generalised von Neumann theorem

Prove `module_generalised_von_neumann`: fix positive `t, d, L, n` and `s ≥ 1`. Let `ψ_i : ℤ^d → ℤ^n` have
size at most `L` at scale `N` and vector-valued complexity at most `s`. If every `f_i` is `1`-bounded
and one of them has normalised `U^{s+1}` norm at most `0 < δ ≤ 1` on `[−(d + 1)LN, (d + 1)LN]^n`, then
for every convex `Ω ⊆ [−N, N]^d`,
`|𝔼_{x ∈ [−N, N]^d} 1_Ω(x) ∏_i f_i(ψ_i(x))| ≤ C_{d,n,s} L^d δ^{1/(2d + 2)}`. Kai's printed statement does
not bind the other functions to be `1`-bounded, which the proof uses: multiplying a function other
than the distinguished one by a large constant scales the left side and not the right. Extend the
system to a normal form with the full-rank kernel restrictions, reduce modulo a prime comparable to
`(d + 1)LN`, approximate `1_Ω` by Lipschitz functions and a truncated Fourier series whose phases are
absorbed into the `f_i`, and apply repeated Cauchy–Schwarz, optimising the smoothing (Kai,
Appendix D, Theorem D.3, p. 71; Propositions D.5–D.7 and proof, pp. 72–77).

The internal contract (Kai, Appendices C–D), every input `1`-bounded:

1. `module_normal_form` (Proposition D.2, p. 70): a system of complexity at most `s` at the index `i`
   is the composite of a system in `s`-normal form at `i` with a surjection `ℤ^{d'} → ℤ^d`,
   `d' ≤ (s + 2)d`; the same holds over `𝔽_p`.
2. `finite_field_von_neumann` (Proposition D.6, p. 72): for affine `ψ_i : 𝔽_p^d → 𝔽_p^n` of complexity
   at most `s` and `1`-bounded `f_i` with `‖f_i‖_{U^{s+1}(𝔽_p^n)} ≤ δ` for the distinguished `i`,
   `|𝔼_{x ∈ 𝔽_p^d} ∏ f_i(ψ_i(x))| ≤ δ`; the proof is `s + 1` applications of Cauchy–Schwarz in the
   normal-form variables, using the box-norm Gowers–Cauchy–Schwarz inequality (Proposition D.5, p. 71).
3. Convex cutoff: a convex `Ω ⊆ [−N, N]^d` has boundary of Lipschitz class `Lip(d, 1, O_d(N))`
   (Theorem C.3, p. 67), so `1_Ω` has a truncated Fourier expansion with `|Θ| ≤ Y^d` frequencies,
   coefficients of size at most `1`, and two error functions, one bounded by `N(q)` on a support of
   proportion `O(1/M)` and one uniformly small (Proposition C.6, p. 69; Lipschitz approximation on the
   torus, Proposition D.7, p. 73). The phases are linear, so they are absorbed into the `f_i` by
   AC.2.2's step 3; this needs `s ≥ 1`.
4. Torus and box versions (Propositions D.8 and D.10, pp. 74–76): combining 2 and 3 after reducing
   modulo a prime `p` comparable with `(d + 1)LN`, `|𝔼 1_Ω ∏ f_i(ψ_i)| ≪_d δY^d + M log Y/Y + 1/M`.
5. Enlarged box: the distinguished function's norm is taken on `[−(d + 1)LN, (d + 1)LN]^n`, which
   contains every value of every `ψ_i` on `[−N, N]^d`; the zero extension into `(ZMod p)^n` has
   normalised norm at most the box norm, as in AC.2.2's step 4 (Theorem D.3, p. 71, and Remark D.12,
   p. 78, for sets with Lipschitz boundary).

Choosing `Y = δ^{−1/(d+1/2)}` and `M = (Y/log Y)^{1/2}` gives the exponent `1/(2d + 2)` after absorbing
the logarithm.

*Needs:* AC.2.2, AC.3.2, AC.3.6, AC.5.6.

### AC.5.8 Number-field prime weights, their models and the ideal Vaughan decomposition

Construct the element weights and sieve models in Kai's theorems. Fix `K` of degree `n`; all
constants may depend on `K`. For asymptotic statements fix
`exp((log N)^{1/100}) < Q < exp((log N)^{1/3})` and let `N` be sufficiently large. This range is part
of each model comparison and pointwise bound below (Kai, §1.2 and §5, p. 16). Write
`r_K = res_{s=1} ζ_K(s) > 0`. The ideal models below have domain the nonzero integral ideals;
when evaluated on all integral ideals they are extended by zero at the zero ideal.

- `normLengthCompatibleBasis`: fix a constant `C_K > 1` once for all ideals. A `ℤ`-basis `b` of
  a nonzero fractional ideal `𝔞` is compatible when for every `x ∈ 𝔞 ⊗ ℝ`,
  `C_K⁻¹ N(𝔞)^{1/n} ‖x‖_{b,∞} ≤ max_σ |σ(x)| ≤ C_K N(𝔞)^{1/n} ‖x‖_{b,∞}`.
  The norm here is the maximum of the archimedean absolute values, not the absolute field norm.
  `normLengthCompatibleBasis_exists` chooses one common `C_K` for which every ideal has such a
  basis; `normLengthCompatibleBasis_change` bounds inclusion matrices by
  `C_K² N(𝔞₁𝔞₂⁻¹)^{1/n}` for `𝔞₁ ⊆ 𝔞₂` (Kai, Proposition 3.1, Definition 3.2 and
  Proposition 3.3, pp. 11–12).
- `numberFieldVonMangoldt`: the element pullback `Λ_K^𝔞(x) = Λ_K(x𝔞⁻¹)` for `x ∈ 𝔞`,
  with value `0` at `x = 0`. The ideal weight `Λ_K` is the library input in the boundary section;
  this target adds its fractional-ideal domain and coordinate transport (Kai, §5, p. 16).
- `cramerModel` (Definition 5.1, p. 16): with `P(Q) = ∏_{p < Q} p`,
  `Λ_{Cramér,Q}(𝔠) = P(Q)^n/(φ_K(P(Q)) · res_{s=1}ζ_K(s))` if `𝔠 + (P(Q)) = O_K` and `0` otherwise.
- `siegelModel` (Definition 6.2, p. 23): `Λ_{Siegel,Q}(𝔠) = Λ_{Cramér,Q}(𝔠)(1 − ψ_Siegel([𝔠]) N(𝔠)^{β_Siegel − 1})`
  when there is an exceptional real Hecke character `ψ_Siegel` with exceptional zero `β_Siegel`, and
  `Λ_{Cramér,Q}` otherwise.
- `typeISum`, `twistedTypeISum`, `typeIISum` (Definition 8.3, p. 32): sums
  `1_{N(𝔠)≤N'} ∑_{N(𝔡)≤N^{2/3}, 𝔡 | 𝔠} A(𝔡)` with `|A| ≤ log N`, and
  `∑_{𝔡₁𝔡₂ = 𝔠, N(𝔡₁), N(𝔡₂) > N^{1/3}} L(𝔡₁)T(𝔡₂)` with `|L| ≤ log N`, `|T| ≤ τ`.
  The twisted Type I sum multiplies the first expression by a real finite-order ideal
  character `χ(𝔠)`, zero-extended at conductor primes; the Vaughan decomposition specialises
  this elementary definition to `χ = ψ_Siegel`.

The theorems, each a named target here:

1. `siegel_zero_dichotomy` (Theorem 6.1, p. 22): in the family of primitive finite-order Hecke
   characters, there is `c_K > 0` such that for every `Q ≥ 2` at most
   one character of conductor norm below `Q` has an `L`-zero in
   `σ > 1 − c_K/(log Q + log(|t| + 4))`; it is real, and the zero is real and simple, with Siegel's
   ineffective lower bound on `1 − β_Siegel`. Kai cites the textbook proofs (Landau–Page for Hecke
   `L`-functions); their analytic input is the zero-free region for Hecke `L`-functions.
   The general unitary-character zero-free region is also required for the sector theorem in
   item 3, with the archimedean parameter included in the analytic conductor. Its precise
   normalisation and supplier contract remain part of the open gap below. It cannot be inferred
   from the finite-order dichotomy: norm twists preserve the finite conductor and translate
   zeros vertically, so an unrestricted uniqueness assertion over all unitary characters would
   not even distinguish twists of a possible exceptional character.
2. `prime_weight_pointwise` (Proposition 6.3, p. 23): for `N ≥ 3` and nonzero `𝔠` with `N(𝔠) < N`, `Λ_K`, `Λ_{Cramér,Q}` and
   `Λ_{Siegel,Q}` are all `O_K(log N)`, by Mertens' theorem for `K` (Proposition B.1, p. 64).
3. `mitsui_siegel` (Proposition 6.4 and proof, pp. 23–27): for convex `Ω` in the norm ball of radius
   `N · N(𝔞)^{1/n}`, `N(𝔮) < exp((log N)^{1/200})` and any class `a + 𝔮𝔞`,
   `∑_{x ∈ Ω, x ≡ a mod 𝔮𝔞}(Λ_K^𝔞 − Λ_{Siegel,Q}^𝔞)(x) ≪_K N^n exp(−(log N)^{1/201})`: Mitsui's prime ideal
   theorem in sectors and residue classes, with the possible exceptional zero incorporated.
4. `cramer_local_count` (Proposition 5.2, pp. 16–17, with Claim 5.3, p. 18): for affine
   `ψ_i : ℤ^d → 𝔞` with finite-cokernel slopes, pairwise non-nested kernels, coefficients at most
   `exp((log N)^{1/101})` and `Ω ⊆ [−N, N]^d` with Lipschitz boundary,
   `∑_{x ∈ Ω ∩ ℤ^d} ∏_i Λ^𝔞_{Cramér,Q}(ψ_i(x)) = vol(Ω)/(res ζ_K)^t · ∏_{p<Q} β_p(Ψ)` up to the error of
   (5.1), namely `O_{t,d,K}(N^d exp(−(log N)^{1/2}/5))`, for a closed set with boundary of fixed
   Lipschitz class `Lip(d,M₁,M₂N)` and `N` sufficiently large in `M₁,M₂`; the proof is the fundamental lemma of the sieve over ideals
   (Lemma B.2, p. 64) with lattice-point counting (Proposition C.2, pp. 66–67), and for `p ∤ A` the
   forms stay surjective and non-nested modulo `p` (Claim 5.3).
5. `ideal_divisor_moments` and `type_sum_pointwise` (Lemma 8.1 and Proposition 8.4, pp. 32–33):
   `∑_{N(𝔠)≤N} τ(𝔠)^m ≪_{K,m} N(log N)^{2^m−1}`, and every (twisted) Type I or Type II sum is at most
   `(log N)τ(𝔠)²` pointwise.
6. `ideal_vaughan_decomposition` (Proposition 8.5, p. 33, from Claim 8.6, p. 34): on ideals of norm at
   most `N`, each of `Λ_K`, `Λ_{Cramér,Q}` and `Λ_{Siegel,Q}` is a combination `∑ c_i S_i` with
   `∑ |c_i| ≪_K log N` of Type I, twisted Type I (for the Siegel model only), Type II and negligible
   sums. A negligible sum has `|S| ≤ log N` and
   `∑_{N(𝔠)≤N} |S(𝔠)| < N exp(−(log N)^{1/2}/10)` (Definition 8.3, p. 33);
   the proof splits `Λ_K = Λ_K ∗ μ ∗ 1` according to whether the norms of the first two factors exceed
   `N^{1/3}`.

The definition API also includes `numberFieldVonMangoldt_zero`,
`numberFieldVonMangoldt_mul_unit` (multiplying an element by a unit preserves its generated ideal),
`numberFieldVonMangoldt_transport` under a chosen integer basis; `cramerModel_coprime`,
`cramerModel_not_coprime`, `cramerModel_nonneg`; `siegelModel_no_exception`,
`siegelModel_coprime`, `siegelModel_not_coprime` and `siegelModel_nonneg`; and
`typeISum_cutoff`, `typeISum_eq_divisor_sum`, `twistedTypeISum_eq_mul`,
`twistedTypeISum_not_coprime`, `typeIISum_eq_factor_sum` and `typeIISum_small_norm_zero`.
All Type sums are functions on **nonzero integral ideals** of norm at most `N ≥ 3`.
The twist is zero on ideals not coprime to its character's conductor. The Siegel formula is
applied only on the coprime branch, so no value `N((0))^{β−1}` is taken.

**Open proof-chain gap.** The arithmetic carriers alone do not supply the proofs of this
subsection. The family Landau–Page theorem and ineffective Siegel lower bound used in item 1,
the conductor-uniform sector/residue-class prime theorem used in item 3, and the ideal-indexed
sieve lemma with its norm-cutoff remainder sum used in items 4 and 6 still require exact supplier targets or
local intermediate targets with complete prerequisite chains. Kai's Theorem 6.1 refers to
external proofs; citing that statement does not supply a proof from ideals and their norms.
For the sieve input, SieveMethodsAndPrimePatterns §1.2 already supplies the finite Brun estimate
with `β = 9κ + 1`, `u ≥ β` and relative error `exp(β − u)K^10`. Its natural-prime carrier cannot
identify distinct prime ideals of equal norm: the ideal adaptation must retain those labels and
prove the dimension bound and remainder estimate required by Kai's Lemma B.2, p. 64.
The analytic Hecke continuation and functional equations are consumed from their existing owners,
never reproved by an appeal to Tate's thesis. This gap affects AC.5.9–AC.5.15.

*Needs:* AC.5.6; the current-library inputs listed under the boundaries; Mathlib
`NumberField.RingOfIntegers`, `NumberField.basisOfFractionalIdeal`, `Ideal.absNorm`, `Nat.Primes`;
the analytic and sieve contracts identified in the open gap above.

**Checks.**

- `cramerModel.test_rational`: for `K = ℚ` and `Q = 5`, `P(Q) = 6` and the model is `6/φ(6) = 3` on
  integers coprime to `6` and `0` on the others; a definition using `p ≤ Q` would also remove `5`.
- `siegelModel.test_no_exception`: with no exceptional character the Siegel model equals the Cramér
  model.
- `numberFieldVonMangoldt.test_rational`: for `K = ℚ`, `𝔞 = ℤ` the weight is Mathlib's
  `ArithmeticFunction.vonMangoldt` on positive integers, and `Λ_ℚ(−x) = Λ_ℚ(x)` because ideals forget
  signs.
- `normLengthCompatibleBasis.test_rational_scale`: on `𝔞 = (1/3)ℤ` over `ℚ`, the basis `1/3`
  has `max_σ |σ(x)| = N(𝔞)‖x‖_{b,∞}` exactly; omitting the ideal-norm scaling fails.
- `normLengthCompatibleBasis.test_complex_norm`: on `ℤ[i]`, the basis `(1,i)` has canonical norm
  `√(a²+b²)`, between the coordinate sup norm and `√2` times it; at `1+i` the canonical norm is
  `√2`, whereas the absolute field norm is `2`.
- `normLengthCompatibleBasis.test_shear`: with fixed `C_K = 2`, `(1,m+i)` is a lattice basis but
  fails compatibility for integer `m ≥ 3`, already on its second basis vector.
- `numberFieldVonMangoldt.test_zero_unit`: with `𝔞 = O_K`, at `x = 0` and at every unit of `O_K`
  the element weight is `0`; the unit ideal is not a positive power of a prime ideal.
- `numberFieldVonMangoldt.test_prime_power`: over `ℚ`, with `𝔞 = ℤ`, the value at `8` is `log 2`, and the value at
  `6` is `0`; using `log N((x))` would give `3 log 2` at `8`.
- `numberFieldVonMangoldt.test_fractional_domain`: at `𝔞 = (1/3)ℤ`, `x = 2/3` gives the ideal
  `(2)` and weight `log 2`, not the norm of the fractional element itself.
- `cramerModel.test_unit_and_zero`: for `K = ℚ`, `Q = 5`, the unit ideal has weight `3` and the
  zero ideal has weight `0`; the model does not have the support of von Mangoldt.
- `cramerModel.test_reciprocal_residue`: for `K = ℚ(i)`, `Q = 2`, the empty product `P(Q) = 1`
  gives value `1/r_K = 4/π` at the unit ideal, rather than `r_K = π/4`.
- `siegelModel.test_unit`: if an exceptional character exists, its value at the unit ideal is `1`,
  so the Siegel weight there is `0`, although the Cramér weight is positive.
- `siegelModel.test_character_sign`: at a coprime ideal with character value `−1`, the ratio to
  the Cramér weight is `1 + N(𝔠)^{β−1} > 1`; reversing the correction's sign fails this test.
- `siegelModel.test_removed_prime`: at an ideal divisible by a prime above `p < Q` the weight is
  `0`, without evaluating a negative power at the zero ideal.
- `typeISum.test_unit`: over `ℚ`, take `N = 8`, `N' = 8` and `A = 1_{(1)}`. The value at the
  unit ideal is `1`, so excluding the divisor one gives the wrong sum.
- `typeISum.test_cutoff`: with these coefficients and `N' = 2`, the value at `(3)` is `0`,
  although `(1)` divides `(3)`; the outer cutoff is independent of the divisor cutoff.
- `typeISum.test_divisor_boundary`: with `N = 8`, `N' = 8`, `A = 1_{(4)}`, the value at `(4)`
  is `1`, since the divisor cutoff `N^{2/3} = 4` is inclusive.
- `twistedTypeISum.test_negative`: with `N = 64`, `N' = 64`, `A = 1_{(1)}` and the quadratic
  character modulo `3`, the value at `(2)` is `−1`, not the untwisted value `1`.
- `twistedTypeISum.test_bad_prime`: the same twist gives value `0` at `(3)`, by its extension
  at conductor primes.
- `twistedTypeISum.test_unit`: the same coefficients give value `1` at the unit ideal, because
  the character there is `1`.
- `typeIISum.test_strict_boundary`: at `N = 64`, a factor of norm `4 = N^{1/3}` contributes
  nothing, including to the factorisation `(4)(5) = (20)`.
- `typeIISum.test_ordered_factors`: at `N = 64`, `L = 1_{(5)}`, `T = 1_{(7)}` gives value `1`
  at `(35)`. The reversed factorisation contributes `0`, so an unordered or symmetrised sum fails.
- `typeIISum.test_small_norm`: at `N = 64` the value is `0` at `(16)` for every permitted pair
  of coefficients, since two factors of norm strictly greater than `4` cannot multiply to `(16)`.
- `ideal_divisor_moments.test_third_moment`: at `m = 3` the stated logarithmic power is `7`,
  not `5`; the local first-order Euler coefficient of `τ^3` is `2^3 = 8`.

### AC.5.9 Gowers uniformity of quadratic Hecke characters

Prove `quadratic_hecke_uniformity`: for a real primitive Hecke character `χ` of conductor `𝔮` and fixed
`s ≥ 1`, its function on residue classes `O_K/𝔮`, obtained through the finite-component map
`(O_K/𝔮)^× → C_K(𝔮)` and extended by zero on nonunits, satisfies
`‖χ‖_{U^{s+1}} ≤ C_{K,s,ε} N(𝔮)^{−1/2^{s+2} + ε}` for every `ε > 0`; the associated Siegel and Cramér models
are Gowers-close at the polylogarithmic rates needed for every fixed log-power saving. Decompose by
the Chinese remainder theorem for ideals; at odd residue characteristic expand the cube and apply the
Weil bound for multiplicative characters to the resulting polynomial, which is not a square over the
algebraic closure (the coprime-degree special case of Weil is not enough); dyadic factors need a
separate conductor bound; compare the models through the Siegel model of AC.5.8 (Kai, §7,
Lemma 7.1 and Proposition 7.2, pp. 28–31).

*Needs:* AC.3.1, AC.5.8; FiniteFieldsAndCharacterSums Layer FF.2 (`weil-bound-multiplicative`).

### AC.5.10 Uniformity of number-field prime models

Prove `number_field_prime_uniformity`: for a number field `K` of degree `n`, every nonzero fractional
ideal `𝔞` with norm-length compatible integer basis, fixed `s ≥ 1` and large `N`, there is
`0 < c_{s,n} < 1` such that, uniformly in convex `Ω ⊆ [−N, N]^n`, nonzero integral `𝔮` and classes
`a₀ + 𝔮𝔞`, the normalised `U^{s+1}` box norm of `1_{Ω ∩ (a₀ + 𝔮𝔞)} · (Λ_K^𝔞 − Λ_{Siegel,Q}^𝔞)` is at most
`exp(−(log N)^{c_{s,n}})`; for the residual `1_Ω · (Λ_K^𝔞 − Λ_{Cramér,Q}^𝔞)`, without the extra congruence cutoff, the bound is
`O_{s,K,A}((log N)^{−A})` for every `A > 1`. The arithmetic models and the compatible bases are
those of AC.5.8; compatibility is what makes the constants uniform in `𝔞`. Prove
nilsequence correlation bounds through the ideal Type I, twisted Type I and Type II decompositions of
`Λ` and its models, tracking conductor, congruence class and nilsequence dimension; apply the box
inverse theorem (AC.3.18) to the residual divided by its logarithmic sup bound, with the threshold
chosen so that dimension and complexity stay in the range of the correlation estimates; compare
Siegel and Cramér models by AC.5.9 (Kai, Theorem 9.1, Corollary 9.2 and Theorem 9.3, pp. 37–42; ideal
decompositions §8, pp. 32–37; Type I/II estimates §§10–11, pp. 43–53).

The internal contracts, all in the range dimension at most `(log N)^ρ` and complexity and Lipschitz
norm at most `exp((log N)^ρ)` for a sufficiently small fixed `ρ` (Kai, §§9–11, pp. 37–53):

1. `uniformity_iff_orthogonality` (§9.1, pp. 37–38): Theorem 9.1 (the Gowers bound) and Theorem 9.3
   (orthogonality to every nilsequence in the range) are equivalent, by the box inverse theorem
   (AC.3.18) in one direction and its converse (Proposition A.2, p. 60) in the other.
2. `step_reduction` (Proposition 9.4, p. 39): if the orthogonality fails at step at most `s` with
   exponent `ρ`, it fails at step at most `s − 1` with exponent `O_{k,n}(ρ)`; the base case `s = 0` is
   the Siegel-model prime number theorem (§9.2, from `mitsui_siegel`).
3. `easy_reductions` (§9.4, pp. 40–41): a conductor with `N(𝔮) ≥ exp((log N)^{3ρ})` gives a correlation
   at most `exp(−(log N)^{2ρ})`, which contradicts the assumed lower bound; otherwise the cutoff
   `1_{Ω ∩ (a + 𝔮𝔞)}` is expanded by Proposition C.6 with `M = exp((log N)^{10ρ})` and `Y = M²` into at
   most `exp((log N)^{11ρ})` phases plus errors of size `exp(−(log N)^{9ρ})`, and one phase is
   absorbed into the nilsequence on `(G/Γ) × (ℝ/ℤ)` (exponent `12ρ`). The printed signs of the two
   exponentials (`exp((log N)^{2ρ})` and `M = exp(−(log N)^{10ρ})`) are misprints for the values used
   here. A vanishing vertical frequency reduces the step directly.
4. Vaughan step (§§9.5–9.6, pp. 41–42): by `ideal_vaughan_decomposition` some (twisted) Type I or
   Type II sum `S` has correlation at least `exp(−(log N)^{O(ρ)})N^n` with the nilsequence; when the
   exceptional conductor is large the twisted sums are compared with the Cramér model through
   AC.5.9.
5. `type_I_case` (§10, pp. 42–48): Cauchy–Schwarz and manipulation of the range (§10.1), Leng's
   multiparameter equidistribution theorem (AC.3.16, in Kai's form Theorem A.3, p. 61) on the
   orbits along the dilated lattices (§10.2), the parametrisation of ideals by a fixed representative
   of each class (§10.3), and the factorisation by the resulting horizontal characters
   (Proposition A.5, p. 62; §10.4) reach `step_reduction_from_characters`: horizontal characters
   `η₁, …, η_r`, `r ≤ (log N)^ρ`, of size `exp((log N)^{O(ρ)})` with `(⋂ ker η_m)^{(s)} ⊆ ker ξ` and
   `‖η_m ∘ g‖_{C^∞} ≤ exp((log N)^{O(ρ)})` give the conclusion of `step_reduction` (Lemma 10.2, p. 48).
6. `type_II_case` (§11, pp. 48–53): Cauchy–Schwarz to a four-point correlation over pairs of
   ideals (§11.1), equidistribution on the product nilmanifold (§11.2), the polynomial Vinogradov
   lemma (Proposition A.6, p. 62) for each character (§11.3), and Lemma 10.2 (§11.4).

*Needs:* AC.3.16, AC.3.18, AC.5.8, AC.5.9.

### AC.5.11 Number-field and localised local factors

Define `numberFieldLocalFactor`: for `K` of degree `n`, a fractional ideal `𝔞` and affine
`ψ_i : ℤ^d → 𝔞` (`i < t`), `β_p = (p^n/φ_K(p))^t` times the proportion of `x ∈ (ZMod p)^d` for which every
`ψ_i(x)` is nonzero in `𝔞/𝔭𝔞` for every prime ideal `𝔭 | p`, where `φ_K(p) = |(O_K/pO_K)^×|`. Define
`localizedLocalFactor`: `β_{p,S}` imposes the avoidance only for `𝔭 ∉ S`, with the same multiplier
`(p^n/φ_K(p))^t`; put `C_{S,Ψ} = ∏_p β_{p,S}`. All conditions above one rational prime use one common `x`.
For the localised maps with source `ℤ^d`, choose nonnegative integers `m_𝔭`, for `𝔭 ∈ S`,
large enough that every affine coefficient belongs to
`𝔞₀ = 𝔞 ∏_{𝔭∈S} 𝔭^{−m_𝔭}`. Then every image lies in `𝔞₀` and
`𝔞₀[S⁻¹] = 𝔞[S⁻¹]`, without local admissibility. The module generated by the images need
not have this property: for `ψ(x) = 2x`, `K = ℚ`, `𝔞 = ℤ`, `S = ∅` it is `2ℤ`,
whereas the construction chooses `𝔞₀ = ℤ`. Replacing `𝔞₀` by another fractional ideal with this same localisation
does not change the factors: away from `S` the integral lattices agree, and the avoidance
conditions at `S` are omitted (Kai, Appendix E.1, p. 78). For all but finitely many `p` the full-rank
kernel restrictions bound the simultaneous vanishings; the removed prime ideals in `S` change the
multiplier without leaving an avoidance condition (Kai, §5, Proposition 5.2 and (5.4), pp. 16–17;
Theorem 12.1 and Remark 12.3, pp. 54–55; Theorem 13.1, pp. 56–57; Appendix E, pp. 78–83).

The API:

- `numberFieldLocalFactor`, `localizedLocalFactor`: the definitions above.
- `numberFieldLocalFactor_nonneg`: every factor is nonnegative.
- `numberFieldLocalFactor_positive_iff`: positive iff one residue vector avoids every required zero.
- `localizedLocalFactor_empty`: at `S = ∅` the localised factor is the original one.
- `localizedLocalFactor_all_above`: if every `𝔭 | p` is in `S`, the factor is `(p^n/φ_K(p))^t`.
- `numberFieldLocalFactor_rational`: at `K = ℚ`, `𝔞 = ℤ` it is the integer local factor of AC.5.5.
- `numberFieldLocalFactor_prime_ideal_product`: for an `O_K`-module source and `O_K`-affine forms the
  factor splits as a product over the prime ideals above `p`.
- `localizedSingularProduct_positive`: under the torsion-cokernel hypotheses the product converges
  and is positive iff the simultaneous avoidance condition holds at every rational prime.

*Needs:* AC.5.5, AC.5.6, AC.5.8; Mathlib `NumberField.RingOfIntegers`, `Ideal.absNorm`.

**Checks.**

- `numberFieldLocalFactor.test_rational`: at `K = ℚ` and `ψ(x) = x` the factor is `1`.
- `localizedLocalFactor.test_removed_prime`: at `K = ℚ`, `t = 1`, `S = {p}` the `p`-factor is
  `p/(p − 1)`, not `1`.
- `numberFieldLocalFactor.test_common_variable`: separate witnesses for different prime ideals above
  `p` do not give positivity; one common residue vector is required.
- `localizedLocalFactor.test_empty`: removing no prime ideals changes no factor.
- `numberFieldLocalFactor.test_parity`: at `K = ℚ`, `ψ(x) = 2x`, the factor at `2` is zero.
- `numberFieldLocalFactor.test_split_witnesses`: in `ℚ(i)` at the split prime `5`, the four
  `ℤ`-affine forms `x + 2 − i, x − 2, x − 3, x − 4` avoid all zeros only at `x = 0` for the residue
  embedding `i = 3`, and only at `x = 1` for `i = 2`. Each prime ideal separately has a witness,
  but their common-variable rational-prime factor is zero. These maps are not `O_K`-linear.
- `localizedLocalFactor.test_retained_obstruction`: for `K = ℚ`, `ψ(x) = 2x` and `S = {(3)}`,
  the obstruction at `2` is retained and its factor is zero.

### AC.5.12 Prime patterns in a fractional ideal of a number field

Prove `number_field_prime_patterns`: let `K` have degree `n` and `𝔞` be a nonzero fractional ideal with a
norm-length compatible `ℤ`-basis. For `t, d ≥ 2`, `A > 1`, large `N` and affine maps `ψ_i : ℤ^d → 𝔞` of
size at most `(log N)^A` such that `ψ̇_i` restricted to `ker ψ̇_j` has finite cokernel for all
`i ≠ j`, every convex `Ω ⊆ [−N, N]^d` satisfies

```text
∑_{x ∈ Ω ∩ ℤ^d} ∏_i Λ_K^𝔞(ψ_i(x)) = vol(Ω) / (res_{s=1} ζ_K(s))^t · ∏_p β_p + O_{t,d,K,A}(N^d (log N)^{−A}),
```

with `Λ_K^𝔞(x) = Λ_K(x𝔞⁻¹)`. The recall of the weight in Kai's §12 drops the outer `Λ_K`; the original
definition has it. The constants are uniform in `𝔞` with the required basis (for a fixed ideal and any
fixed basis they may depend on the basis). The finite-cokernel restrictions cannot be dropped.
Normalise the prime and Cramér weights by a multiple of `log N`, telescope, and apply AC.5.7 to the
Gowers-small residual from AC.5.10, with the log-power exponent large enough to absorb the size and
product losses; evaluate the Cramér-model count by the ideal sieve and local factors and
lattice-point counting, which produces the reciprocal residue (Kai, Theorem 12.1 and proof,
pp. 54–55; Proposition 5.2, pp. 16–17).

*Needs:* AC.5.7, AC.5.8 (`cramer_local_count`), AC.5.10, AC.5.11.

### AC.5.13 Uniformity of localised prime models

Prove `localized_prime_uniformity`: for fixed `K`, a finite set `S` of nonzero prime ideals, `s ≥ 1`,
`A > 1` and a nonzero fractional ideal `𝔞` with norm-length compatible basis, the localised weight
`Λ_{O_K[S⁻¹]}^𝔞` and its localised Cramér model differ by `O_{s,K,S,A}((log N)^{−A})` in normalised
`U^{s+1}` on `[−N, N]^n`, uniformly in `𝔞`. Remove the higher prime-power contributions; decompose both
weights over ideals `𝔮` supported in `S`, plus a bounded correction supported on `S`-units; for
`N(𝔮) ≤ N^{n/2}` apply AC.5.10 in a compatible basis of `𝔮𝔞`, for larger `𝔮` use the crude support bound
for the unnormalised cube; sum the convergent `S`-supported norm powers and divide by the box
normalisation (Kai, Appendix E, Lemma E.2 and Proposition E.3 with proof, pp. 79–81).

*Needs:* AC.3.6, AC.5.8, AC.5.10.

### AC.5.14 Prime patterns in a localised number field

Prove `localized_prime_patterns`: let `K` be a number field, `S` a finite set of nonzero prime ideals,
`𝔞` a nonzero fractional ideal and `ψ_i : ℤ^d → 𝔞[S⁻¹]` affine (`t, d ≥ 1`), such that each linear part
and its restriction to the kernel of every other linear part have torsion cokernel. For `A > 1`, `N`
large depending on `K, S, Ψ, A`, and measurable `Ω ⊆ [−N, N]^d` whose boundary is covered by `Z`
Lipschitz images of `[0, 1]^{d−1}` with constants at most `L₀N`,

```text
∑_{x ∈ Ω ∩ ℤ^d} ∏_i Λ_{O_K[S⁻¹]}^𝔞(ψ_i(x)) = C_{S,Ψ} vol(Ω) / (res_{s=1} ζ_K(s))^t + O_{K,S,Ψ,Z,L₀,A}(N^d (log N)^{−A}),
```

and `C_{S,Ψ} > 0` under the simultaneous local avoidance condition. Convex `Ω` are included, and the
system need not have finite cokernel over `ℤ`. Choose the
finitely generated fractional ideal of AC.5.11, spanning the same localised module; apply AC.5.13; replace the weights by localised
Cramér models with AC.5.7 and its Lipschitz-boundary extension; evaluate with the ideal sieve in the
localised Dedekind ring, keeping the rational-prime multiplier and only the prime ideals outside `S`.
(Kai, Theorem 13.1, pp. 56–57; Appendix E, pp. 78–83; Appendix D, Remark D.12, p. 78).

*Needs:* AC.5.7, AC.5.8, AC.5.11, AC.5.13.

### AC.5.15 Finite-complexity linear equations in primes

Prove `linear_equations_in_primes`: for fixed positive `d, t, L, A`, an integer affine system
`ψ_i(x) = b_i + v_i · x` with nonzero, pairwise `ℚ`-independent slopes, `‖v_i‖_∞ ≤ L` and `|b_i| ≤ LN`,
and convex `Ω ⊆ [−N, N]^d`,

```text
∑_{x ∈ Ω ∩ ℤ^d} ∏_i Λ(ψ_i(x)) = β_∞ ∏_p β_p + O_{d,t,L,A}(N^d (log N)^{−A}),
```

with `β_∞` and `β_p` from AC.5.5; the implied constant may be ineffective, and the product is positive
exactly when every local factor is. No system with proportional slopes is covered: the theorem says
nothing about twin primes or Goldbach's problem. For `t, d ≥ 2` specialise AC.5.12 to `K = ℚ`, `𝔞 = ℤ`,
intersecting `Ω` with the positivity region; pairwise independent scalar slopes give the
finite-cokernel restrictions. For `t = 1` use the fixed-modulus Siegel–Walfisz estimate with every
log-power saving and lattice slicing; bounded integer slopes allow only finitely many moduli,
and its endpoint bounds are uniform in `|b_i| ≤ LN`. Residue classes not coprime to their
modulus contribute only powers of its finitely many prime divisors; their total weight after
slicing is `O_{d,L}(N^{d−1} (log N)^2)`, absorbed by every stated log-power error. For `d = 1`, `t ≥ 2` there is no system with independent slopes. Green and Tao's
original theorem is conditional on the inverse theorem and on Möbius–nilsequence orthogonality, both
targets of this roadmap, and Leng's Theorem 5 gives the saving of every fixed log power (Green–Tao,
linear equations, Conjecture 1.2, p. 4, the Main Theorem, p. 9, and Theorem 1.8, p. 12; Leng,
efficient equidistribution, Theorem 5, pp. 5–6, and §5).

*Needs:* AC.5.4, AC.5.5, AC.5.12; AnalyticNumberTheoryPartI §0.32 (the Siegel–Walfisz theorem,
uniform in `q ≤ (log x)^B`; the case of a fixed modulus is used).

### Examples

- The `k`-term progression system `ψ_i(x, r) = x + ir`, `0 ≤ i < k`, has complexity `k − 2`, and its local
  factors are never `0` (take `r ≡ 0` and `x ≢ 0`). For `k = 3`: at `p = 2` the three forms avoid `0`
  exactly for `x` odd and `r` even, one pair in four, so `β₂ = 2³ · (1/4) = 2`; at `p = 3` only `r ≡ 0`,
  `x ≢ 0` works, two pairs in nine, so `β₃ = (3/2)³ · (2/9) = 3/4`.
- For `K = ℚ(i)` and `𝔞 = ℤ[i]`, the Gaussian maps `x + iy` and `x − iy` of AC.5.6 fail the complexity
  condition: their kernels are zero, so counting Gaussian primes `x + iy` with `x − iy` also prime is not
  a pattern of this layer.
- `S = {(2)}` in `K = ℚ`: the localised factor at `2` is `2/1 = 2` for `t = 1`, since no avoidance
  condition is imposed at `2` but the multiplier `2/φ(2)` is kept.

### Dependencies

AC.2 (the interval von Neumann lemmas), AC.3 (Gowers norms, scalar Weyl estimates, nilsequences,
efficient equidistribution, the box inverse theorem, orbit factorisation); Mathlib (`μ`, `Λ`, affine
maps, spans, kernels, rings of integers, fractional ideals, ideal norms, Gauss sums);
AnalyticNumberTheoryPartI §§0.32 and 1.2; FiniteFieldsAndCharacterSums FF.2;
ExponentialSumsAndCircleMethod Layers 4–5 (AC.5.1 only).

## Worked examples

These computations pin the conventions of the roadmap; each is small enough to check by hand, and the
first ones reappear as `example`s in `Suggested.lean`.

1. **The transform and its conjugation (AC.0.1).** On `ZMod 4` with `χ = zmodAddEquiv 1`, so `χ(x) = i^x`,
   the point mass `δ₁ = Pi.single 1 1` has `fourier δ₁ χ = (1/4) · conj(i) = −i/4`, and
   `ZMod.dft δ₁ 1 = −i` (Mathlib's transform uses the conjugate character and no normalisation), so
   `fourier δ₁ χ = (1/4) ZMod.dft δ₁ 1`, as `fourier_zmod` states.
2. **The convolution unit (AC.0.2).** On `ZMod 4`, `nconv δ₀ δ₀ = (1/4) δ₀`, while
   `nconv (4 δ₀) f = f`; Fourier side: `fourier δ₀ ≡ 1/4` and `fourier (4δ₀) ≡ 1`.
3. **Energy (AC.0.5, AC.0.9).** In `ZMod 5` with `A = {0, 1, 2}`, `A + A = {0, 1, 2, 3, 4}` with
   representation counts `1, 2, 3, 2, 1`, so `E(A, A) = 1 + 4 + 9 + 4 + 1 = 19 ≤ |A|³ = 27`, and
   `|A|⁴ = 81 ≤ |A + A| · E(A, A) = 95`.
4. **Entropy (AC.1.1–AC.1.2).** For `X` uniform on `{0, e₁, e₂} ⊂ 𝔽₂²`, `H[X] = log 3`,
   `H[X + X'] = (1/3) log 3 + (2/3) log(9/2)`, and `d[X ; X] = (2/3) log(3/2) ≈ 0.2703`; for `U_H` uniform on
   a subgroup `d[U_H ; U_H] = 0`.
5. **Bohr sets on `ZMod 4` (AC.1.20, AC.1.22).** For the standard character, the chord sets at radii in
   `(0, √2]`, `(√2, 2]`, `(2, ∞)` are `{0}`, `{0, 1, 3}`, `G`; the phase sets at radii in `(0, 1/4]`,
   `(1/4, 1/2]`, `(1/2, ∞)` are the same three sets.
6. **Gowers norms (AC.3.1).** On `ZMod 2`, `f = (1, −1)` has `U¹ = 0`, `U² = 1`; the point mass has
   `‖δ₀‖_{U²}⁴ = 1/8 = (1/2)⁴ + (1/2)⁴`.
7. **Progression averages (AC.2.1).** `cyclicProgressionAverage` of `1_{{0}}` on `ZMod 5` with `k = 3` is
   `1/25`; `intervalProgressionAverage 2 (1_{[2]}, 1_{[2]}, 1_{[2]}) = 2/9`.
8. **The W-trick (AC.4.11).** `primorial 5 = 30`; `30n + 1` is prime for `n = 1, 2` and composite for
   `n = 3, 4`.
9. **Local factors (AC.5.5).** For `ψ(x) = 2x`, `β₂ = 0`: no integer pattern of this shape avoids the
   prime `2`. For the progression system at `k = 3`, `β₂ = 2` and `β₃ = 3/4`.

## Downstream consumers

- **ArithmeticLocallySymmetricSpaces**, Layer ALS.2: the boundary fibrations use the filtered
  nilmanifolds and rational Mal'cev coordinates of AC.3.11–AC.3.12.
- **EllipticRegulators**, Layers ER.4 and ER.5: the finite Fourier interface of AC.0 (the transform,
  inversion and Parseval) for torsion and odd-function identities.
- **FiniteFieldsAndCharacterSums**, Layer FF.1: the expansion of characters and Gauss sums through
  `fourier` and `fourier_parseval`.
- **ErdosProgressionPowers**: the quantitative three-term progression theorem of AC.2.10.
- **AnalyticNumberTheory**, Layer AN.0, and **SieveMethodsAndPrimePatterns**: the transference
  machinery of AC.4 and the additive structure of AC.1.

## References

- W. T. Gowers, B. Green, F. Manners and T. Tao, *On a conjecture of Marton*, Ann. of Math. 201 (2025),
  515–549; arXiv:2311.05762v2. §§1–7 and Appendices A–B.
- T. Tao, *254A lecture notes on additive combinatorics*, Notes 2 and Notes 3, in the compilation hosted
  at https://www.math.cmu.edu/users/af1p/Teaching/AdditiveCombinatorics/Tao.pdf (Notes 2, §§1–8,
  printed pp. 1–19; Notes 3, §§1–2, printed pp. 1–7).
- T. Schoen and I. D. Shkredov, *Roth's theorem in many variables*, arXiv:1106.1601v1, §4.
- B. Green and T. Tao, *The primes contain arbitrarily long arithmetic progressions*, Ann. of Math. 167
  (2008), 481–547; arXiv:math/0404188v6.
- D. Conlon, J. Fox and Y. Zhao, *The Green–Tao theorem: an exposition*, EMS Surv. Math. Sci. 1 (2014),
  249–282; arXiv:1403.2957v4.
- Y. Zhao, *An arithmetic transference proof of a relative Szemerédi theorem*, Math. Proc. Cambridge
  Philos. Soc. 156 (2014), 255–261; arXiv:1307.4959v2.
- J. Leng, A. Sah and M. Sawhney, *Quasipolynomial bounds on the inverse theorem for the Gowers
  `U^{s+1}[N]`-norm*, arXiv:2402.17994v3.
- J. Leng, A. Sah and M. Sawhney, *Improved bounds for Szemerédi's theorem*, arXiv:2402.17995v2.
- J. Leng, *Efficient equidistribution of nilsequences*, arXiv:2312.10772v5.
- B. Green and T. Tao, *The quantitative behaviour of polynomial orbits on nilmanifolds*, Ann. of Math.
  175 (2012), 465–540; arXiv:0709.3562v4.
- B. Green and T. Tao, *On the quantitative distribution of polynomial nilsequences — erratum*,
  arXiv:1311.6170v3.
- B. Green and T. Tao, *The Möbius function is strongly orthogonal to nilsequences*, Ann. of Math. 175
  (2012), 541–566; arXiv:0807.1736v4.
- B. Green and T. Tao, *Linear equations in primes*, Ann. of Math. 171 (2010), 1753–1850;
  arXiv:math/0606088v2.
- W. Kai, *Linear patterns of prime elements in number fields*, arXiv:2306.16983v5.
- D. Král', O. Serra and L. Vena, *A removal lemma for systems of linear equations over finite fields*,
  arXiv:0804.4847v1.
- D. Conlon and J. Fox, *Graph removal lemmas*, in Surveys in Combinatorics 2013, LMS Lecture Note
  Ser. 409, 1–49; arXiv:1211.3487v1.
- M. A. Bennett and S. Siksek, *A conjecture of Erdős, supersingular primes and short character sums*,
  Ann. of Math. 191 (2020), 355–392 (author-hosted text at
  https://personal.math.ubc.ca/~bennett/BeSi-Annals-2020.pdf); §9, Theorem 8 and (36), p. 381.
- T. Tao, *254A lecture notes on additive combinatorics*, Notes 4, §2 (Roth's argument), in the
  compilation above.
- T. Sanders, *On the Bogolyubov–Ruzsa lemma*, Anal. PDE 5 (2012), 627–655; arXiv:1011.0107.
- L. Milićević, *A bilinear Bogolyubov argument in abelian groups*, Discrete Analysis 2024:20,
  arXiv:2109.03093v3.
- J. Leng, A. Sah and M. Sawhney, *Improved bounds for five-term arithmetic progressions*,
  arXiv:2312.10776 (Proposition 3.7 and Appendix B).
- B. Green, T. Tao and T. Ziegler, *An inverse theorem for the Gowers `U^{s+1}[N]`-norm*, Ann. of Math.
  176 (2012), 1231–1372; arXiv:1009.3998 (Appendix B).
- B. Green and T. Tao, *Quadratic uniformity of the Möbius function*, Ann. Inst. Fourier 58 (2008),
  1863–1935; arXiv:math/0606087 (Proposition 4.2).
- D. Conlon, J. Fox and Y. Zhao, *A relative Szemerédi theorem*, Geom. Funct. Anal. 25 (2015), 733–762;
  arXiv:1305.5440 (§6).
- T. Tao, *The divisor bound*, blog post, 23 September 2008,
  https://terrytao.wordpress.com/2008/09/23/the-divisor-bound/.
