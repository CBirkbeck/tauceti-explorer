# Roadmap: logarithmic potential theory and the distribution of conjugates of algebraic integers

**Summary.** Build logarithmic energy and capacity on the complex plane, then
weighted real polynomial approximation, to characterize the possible limiting
conjugate distributions of algebraic integers. The arithmetic realization
theorem identifies these distributions with probabilities having nonnegative
integer-polynomial logarithmic moments. Its optimization consequences prove
completeness of the auxiliary-polynomial method, a Schur–Siegel–Smyth upper bound
below 1.89831, and explicit asymptotic point-count bounds for simple abelian
varieties over large square finite fields.

## Scope and ownership

The complex foundations, weighted equilibrium theory and real distribution
adapters belong here. The integer-polynomial construction is specialized to
compact real sets with countably many components and capacity strictly greater
than one. Holonomy bounds, arithmetic rationality criteria and specialized
hedgehog inequalities remain with Arithmetic Algebraization and Holonomy Bounds.
This roadmap exports its complex Layers 0–2 to that direction.

Harmonic kernels and maximum principles belong to Tau Ceti's PDE library;
Cauchy integration belongs to Mathlib and the completed Contour Integration
roadmap. Finite empirical probabilities belong to Tau Ceti's Exchangeability
library. Their polynomial-root adapter is new here. The existing Chebyshev T
orthogonality measure has mass π; only its normalized affine equilibrium
adapter is planned here. Standard Chebyshev polynomials on [−1,1] are library
objects; the monic minimizer on an arbitrary nonpolar real compact set is the
additional construction. General real quantiles belong to Tau Ceti’s
Optimal Transport library; the upper-grid polynomial and its compact-support,
atomless endpoint specifications are the additional quantile adapters here.

General lattice successive minima and convex-body geometry belong to Geometry
of Numbers and Quadratic Arithmetic. Integral Lattices' quadratic-norm minima
are a different specialization: the polynomial evaluation bodies here are
arbitrary centrally symmetric convex bodies and need the general supplier.
Primitive polynomial gcds, bounded squarefree combinations and the classical
trace-constant indexing interface belong to Classical Arithmetic Completion.
Honda–Tate classification belongs solely to Abelian Schemes and Arithmetic
Moduli, Part II. Abelian Weil estimates and Frobenius point counts belong to
Deligne Weights and Purity; Layer 12 supplies their real-polynomial optimization
adapter.

The required coupling with Classical Arithmetic Completion is by layers: CA.6
can consume the early complex foundations, while the classical name λSSS is
imported only after cofinite optimization has been constructed here. The two
roadmaps use a coupled boundary for these contracts. The mathematical build
order is Layers 0–10, the CA.6 indexing interface, then the classical trace
corollaries in Layers 11–12. CA.6 may consume Layers 0–2 earlier; the witness
in Layer 11 is independent of its indexing interface. No early potential-theory result
depends on the trace constant.

## Conventions

Measures are native positive Borel measures, finite unless explicitly stated to
be probabilities. Support is Mathlib's closed `Measure.support`; “supported on
K” means μ(Kᶜ)=0. On these second-countable spaces and closed K this is
equivalent to support inclusion. Real measures are pushed forward along
`Complex.ofReal` when evaluating complex potentials; real polynomials are
mapped coefficientwise to ℂ when testing complex roots.

The singular kernel is −log distance with diagonal value +∞. Potentials and
energy use `EReal` integrals of positive minus negative parts; compact support
and finite mass bound the negative part. `logAbs` has value −∞ at zero, and
integer logarithmic moments have finite positive part on compact support.
Expressions combining infinities are used only after those one-sided finiteness
facts. The private extended-integral helper in Suggested.lean is merely this
two-part formula; it is not a proposed replacement for a general integration
API.

Compact capacity is exp(−minimum energy), so a disk of radius r has capacity r
and [a,b] has capacity (b−a)/4. Borel capacity means inner capacity. “Polar” and
“quasi-everywhere” always use this logarithmic convention. Weighted energy is
I+2∫Q, while its modified Robin constant is I+∫Q at the minimizer. The
polynomial potential weight is exp(Uμ), hence corresponds to field −Uμ.

Integer squarefreeness means squarefreeness of the image in ℚ[X], equivalently
no repeated complex root. Nonzero integer content is allowed. A primitive gcd
has positive leading coefficient and is taken over ℚ before its primitive
integral representative is selected. Root laws count a roots **multiset**;
all-conjugate statements require positive degree and real splitting. Suprema
for optimization are extended-real until the finiteness theorem is proved.
Constants C in polynomial estimates are positive and depend only on the fixed
K, μ and explicitly named parameters, never on the varying degree or parent
polynomial. Enlarging C to cover finitely many small degrees is allowed.

## Exact supplier contracts

### From Mathlib and Tau Ceti

The pinned statement interfaces are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

- `MeasureTheory.Measure.support` supplies closed support. Tonelli uses
  `MeasureTheory.lintegral_lintegral_swap` with its product measurability and
  `SFinite` hypotheses, satisfied by the finite measures used here.
- `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`
  characterizes weak convergence by bounded continuous real test functions.
  `isCompact_setOfPred_finiteMeasure_le_of_isCompact` supplies compactness of
  finite measures with bounded mass supported on a fixed compact set.
- `ContinuousMap.subalgebra_topologicalClosure_eq_top_of_separatesPoints`
  supplies real Stone–Weierstrass on compact spaces. `Frullani.integral_Ioi_eq`
  requires positive scale factors, the stated endpoint limits, local
  integrability and integrability of the Frullani difference; the Gaussian
  strict-energy argument verifies these before applying it.
- `Polynomial.resultant_eq_prod_eval` uses a splitting polynomial and an
  explicit bound for the second degree; its leading coefficient is raised to
  that bound. `Polynomial.resultant_map_map` transports the bounded-size
  resultant through coefficient maps. `Polynomial.discr` is the native
  discriminant. The gcd and majorant arguments must retain all leading terms.
- `Polynomial.IsEisensteinAt.irreducible` requires primitivity, a prime ideal
  and positive degree. The realization outputs are monic, Eisenstein at (2),
  and positive-degree, so these hypotheses hold.
- `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset` and
  `MvPolynomial.combinatorial_nullstellensatz_exists_eval_nonzero` supply
  finite-grid nonvanishing with their coordinate-degree/cardinality or
  total-degree/coefficient hypotheses. They support the arithmetic supplier's
  discriminant argument, not a duplicate interpolation theory here.
- `geometric_hahn_banach_open` separates disjoint convex sets, one open, by a
  continuous real linear functional. `ContinuousMap.exists_restrict_eq`
  extends a continuous function from a closed subset of a normal space; it is
  used for smoothing test functions, not for Remez.
- `Complex.integral_boundary_rect_eq_zero_of_continuousOn_of_differentiableOn`
  and `DiffContOnCl.circleIntegral_sub_inv_smul` supply Cauchy–Goursat and the
  disk formula with continuity up to the boundary and complex
  differentiability in the interior. The disk normalization is 2πi.
- `TauCeti.Probability.empiricalMeasureOfFintype` and
  `TauCeti.Probability.integral_empiricalMeasureOfFintype` handle a nonempty
  finite population, repeated values and strongly measurable integrands.
- `MeasureTheory.Measure.quantile` in `TauCeti.Probability.Quantile` is
  the generalized inverse of the CDF. `quantile_le_iff` assumes 0<t<1;
  `quantile_def` supplies the infimum formula also at t=1. Compact support
  makes that endpoint set nonempty, and Hölder atomlessness gives exact
  cumulative mass at the finite upper-grid levels. No new general quantile
  function or inverse-transform theorem is required.
- `TauCeti.chebyshevMeasureT_univ`, in
  `TauCeti.Analysis.SpecialFunctions.Trigonometric.Chebyshev.Measure`, fixes
  the orthogonality measure's mass at π.
- `TauCeti.planarNewtonianKernel` and
  `TauCeti.harmonicOnNhd_planarNewtonianKernel_sub` give the kernel
  `−(2π)⁻¹log‖z‖` and translated harmonicity off its pole.
  `TauCeti.eqOn_const_of_harmonicOnNhd_of_isMaxOn` applies on a preconnected
  set containing a neighborhood of an attained maximum point. Frostman's
  complementary-domain argument supplies those conditions.

### From Geometry of Numbers and Quadratic Arithmetic, GN.1 and GN.4

Import GN.1's `minkowski-second-lower` and `minkowski-second-upper` for a full
discrete lattice in a real finite-dimensional space and a compact centrally
symmetric convex body with zero in its interior. Minima range over nonnegative
dilations. Import the following polynomial specializations from GN.1 and GN.4:

1. For distinct real α0,…,αm and positive vi, identify degree-≤m coefficient
   space with ℝ^(m+1) and its integer lattice with ℤ^(m+1). For
   `B={P : vi|P(αi)|≤1}`, put `D=∏vi ∏i<j|αi−αj|`. Supply
   `vol(B)=2^(m+1)/D` and `D/(m+1)! ≤ ∏λi ≤ D`. Consumers are the two
   norm-product targets and the gcd-refined bound in Layer 5. The body, volume
   and minima are supplied by `GN.1/evaluation-polytope`,
   `GN.1/evaluation-polytope-volume` and `GN.1/evaluation-polytope-minima`.
   (Smith, Proposition 3.4, pp.14–15.)
2. For n>0 and integer Q of degree n, squarefree over ℚ and with nonzero
   integral leading coefficient of either sign, let α1,…,αn be its distinct complex roots.
   For every real P of degree <n supply integer R of degree <n and complex βi
   with `P−R=Σβi Q/(X−αi)` and `Σ|βi|≤9 n log(2n)`. The supplier is
   `GN.4/smith-cofactor-adjustment`. Its stronger bound is
   `Σ|βi|<3√2 n √(log(8n)/π)`. The GN.1 targets `cofactor-polynomials`,
   `cofactor-integer-functional` and `real-cofactor-basis` supply integrality,
   the nonzero integer-product bound, and the conjugate-paired real basis.
   GN.4's `l1-covering-transference` supplies Gaussian lattice covering in
   that basis. This is an ℓ1 covering contract; a simplex flatness estimate
   alone does not establish it. Consumers are integer
   approximation, the gcd bound and realization. (Smith, Theorem 3.2,
   pp.12–13.)

### Required extensions of Classical Arithmetic Completion, CA.3 and CA.6

The arithmetic construction requires an additional CA.3 primitive gcd/Gauss
interface and bounded-combination theorem. Their required contract says: for a
nonempty list of nonzero integer Q1,…,Qk of degrees ≤n, at least one of degree
n, and their positive-leading primitive rational gcd G, there are integers
`0≤bi≤2(n−deg G)` for i≥2 such that
`(Q1+Σi≥2 bi Qi)/G` has degree n−deg G and is squarefree over ℚ. The degree-zero
case includes nonunit integral constants; for example 4(X+1) gives quotient 4.
The discriminant/grid proof and native gcd normalization belong to this
Classical Arithmetic Completion extension. Consumers are the gcd
norm bound and small-squarefree construction. (Smith, Lemma 2.10, p.9.)

The late trace corollaries require an additional CA.6 identification of the
classical Schur–Siegel–Smyth constant
with the cofinite nonnegative trace problem `cofiniteMean [0,∞) id`, including
the equivalence between counting minimal polynomials and conjugacy classes of
algebraic integers. Its constant is a supremum of cofinite lower bounds. Layers
11–12 consume this bridge; Layers 0–2 and the exact witness do not. The optimal
admissible trace law itself follows from Layer 10 here. (Smith, Example 5.9,
p.37 and Theorem 5.11, pp.39–40.)

These are additional supplier targets, not consequences of CA.3's matrix
normal forms or CA.6's Pisot, Salem and Mahler-measure results. The bounded
combination and the trace-indexing bridge must be supplied before their
respective consumers can be built.

### From Abelian Schemes and Arithmetic Moduli, Part II, F3

Import the single `F3/honda-tate` classification. Its specialized contract uses
native simple finite-field isogeny classes, a natural positive dimension and a
positive multiplicity e. For the real Weil polynomial of degree d, it supplies
the Frobenius polynomial `∏(T²−xiT+q)^e` and dimension ed. It must identify the
finite endpoint exceptions in both directions and prove that distinct real
Weil polynomials give distinct classes. No proposition-valued surrogate for
simplicity or free real-valued “dimension” is part of this contract. (Smith,
Proposition 5.12 and its Honda–Tate discussion, pp.40–41.)

### From Deligne Weights and Purity, DWP.1

Import `DWP.1/weil-estimate-for-abelian-varieties` and
`DWP.1/point-counts-of-abelian-varieties`: for arithmetic Frobenius on an abelian
variety of dimension g over Fq, its 2g roots have absolute value sqrt(q), and
`#A(Fq)=det(1−Frob)`. The compatibility contract identifies these outputs with
the F3 simple-class carrier, positive natural dimension and finite rational
point count. These two abelian results are shared imports; Layer 12 adds only
the pairing, multiplicity cancellation and optimization transfer. (Smith,
Propositions 5.12–5.13, pp.40–41.)

## How to read the build

Layers 0–2 form a complex foundation usable independently of arithmetic.
Layers 3–4 normalize real measures, roots, weights and quantiles. Layers 5–7
turn lattice estimates into integer rounding margins while keeping real roots
inside a finite interval union. Layer 8 removes regularity assumptions; Layer 9
proves realization. Layers 10–11 optimize conjugate averages and certify the
trace witness. Layer 12 transfers those results through the supplied
Honda–Tate and arithmetic-Frobenius interfaces. Suggested.lean records light
native definitions and representative milestones; heavy choices and the native
abelian interfaces are specified below without assuming their construction.

## Layer 0: Singular potentials and logarithmic energy

### 0.1 Singular logarithmic kernel

Use the singular kernel `logKernel(z,w) = −log|z−w|` off the diagonal and
`logKernel(z,z) = +∞`. Its codomain is `EReal`. The pole value makes atoms
visible to energy; a real logarithm totalized at zero would lose that information.
The normalization is the unscaled logarithmic kernel. Its off-pole comparison
with the planar Newtonian kernel multiplies the latter by `2π`.

The intended names are `logKernel`.

(Smith, Definition 2.1, p.5; Saff, §1 (1.8), p.171.)

The definition is used through these specifications:

- `logKernel_symm`: The kernel is symmetric.
- `logKernel_off_diagonal`: Off the diagonal the value is −log of the distance.
- `logKernel_planar`: Off the diagonal k is 2π times Tau Ceti’s planar kernel.

**Checks.**

- k(0,0)=+∞.
- k(0,1)=0.
- k(0,2)=−log 2.

*Needs:* `TauCeti.planarNewtonianKernel`.

### 0.2 Logarithmic potential

For a finite positive Borel measure μ with compact support in ℂ, define
`logPotential μ z = Uμ(z) = ∫ logKernel(z,w) dμ(w)`. Interpret this integral
as the integral of the positive part minus that of the negative part. At each
fixed z the negative integral is finite, so the value is finite or `+∞`, never
`−∞`. Define `realPotential` by pushing a real measure forward along ℝ → ℂ.
Integrating the kernels `min(M,logKernel)` and letting M increase recovers Uμ;
this construction also establishes additivity without subtracting two infinities.

The intended names are `logPotential`, `realPotential`.

(Smith, Definition 2.1, p.5; Saff, §1 (1.8), p.171.)

The definition is used through these specifications:

- `logPotential_dirac`: A Dirac potential is its kernel.
- `logPotential_truncation`: On a compactly supported finite measure the potential is the increasing supremum of upper truncations.
- `logPotential_add`: Potentials add for compactly supported finite positive measures.

**Checks.**

- The zero measure has zero potential.
- A unit atom has infinite potential at its location.
- Two unit atoms at 0 and 1 give potential −log 2 at 2.
- The real potential of the zero measure is zero, and that of uniform [0,1] at zero is one; together with the real Dirac pole these test the pushforward and normalization.

*Needs:* §0.1 (singular logarithmic kernel); `MeasureTheory.lintegral_lintegral_swap`; `MeasureTheory.Measure.support`.

### 0.3 Logarithmic energy

Define `logEnergy μ = I(μ)` by integrating `logKernel` against μ × μ. This
is an extended integral with finite negative part for finite compactly supported
μ. Prove the potential-integral identity by Tonelli applied separately to the
two parts. Scaling μ by a finite nonnegative scalar a multiplies its energy by
a²; the case a = 0 is included with the extended-real convention `0·∞ = 0`.
Here “finite energy” means `I(μ) < +∞`, since compact support already excludes
`−∞`.

The intended names are `logEnergy`.

(Smith, Definition 2.1, p.5; Saff, §1 (1.9), p.171.)

The definition is used through these specifications:

- `logEnergy_integral_potential`: Energy equals the integral of the potential under compact support and finite mass.
- `logEnergy_smul`: For compactly supported finite μ and a≥0 finite, I(aμ)=a²I(μ), including a=0 and infinite positive energy.
- `logEnergy_not_bot`: Finite mass and compact support exclude negative infinite energy.

**Checks.**

- I(0)=0.
- I(δ0)=+∞, ruling out totalized Bochner energy.
- The uniform probability on [0,1], pushed into ℂ, has logarithmic energy 3/2; this detects an incorrect sign or scalar factor.

*Needs:* §0.2 (logarithmic potential); `MeasureTheory.lintegral_lintegral_swap`.

### 0.4 Principle of descent

Prove that Uμ is lower semicontinuous for every finite compactly supported μ.
If probability measures μj supported on a fixed compact K converge weakly to μ,
then μ is also supported on K and, for every z ∈ ℂ,

```text
Uμ(z) ≤ liminf Uμj(z),       I(μ) ≤ liminf I(μj).
```

On K, every upper truncation of the singular kernel is continuous and bounded
below. For energy first establish μj × μj → μ × μ by uniform approximation of
continuous functions on K × K by sums of products; then pass monotonically
through the truncations. The direction is lower semicontinuity. Small positive
atoms can make the approximating energies infinite while the limit has finite
energy.

The intended names are `potential_lowerSemicontinuous`, `potential_descent`, `energy_descent`.

(Saff, Lemma 1.6, pp.171–172.)

*Needs:* §0.2 (logarithmic potential); §0.3 (logarithmic energy); `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`; `isCompact_setOfPred_finiteMeasure_le_of_isCompact`; `ContinuousMap.subalgebra_topologicalClosure_eq_top_of_separatesPoints`.

### 0.5 Strict positivity on mass-zero differences

For finite compactly supported positive measures μ, ν of equal mass and finite
self-energy, prove that the mutual energy J(μ,ν) is finite and

```text
I(μ) + I(ν) − 2J(μ,ν) ≥ 0,
with equality exactly when μ = ν.
```

The difference has total mass zero; that assumption cancels the constant term
in the Frullani representation of −log distance. Integrate the resulting
Gaussian kernels. Expanding a Gaussian into weighted monomials expresses its
quadratic form as a sum of squares of moments of μ−ν. Integrate in the scale
parameter using finite-energy bounds. If the energy is zero, all these moments
vanish; Stone–Weierstrass on the compact support identifies the measures. This
supplies strict convexity without assuming a signed-measure logarithmic integral
is defined when either Jordan part has infinite energy.

The intended names are `strict_energy`.

(Levenberg, Proposition 2.1, p.8.)

*Needs:* §0.3 (logarithmic energy); §0.2 (logarithmic potential); `MeasureTheory.lintegral_lintegral_swap`; `Frullani.integral_Ioi_eq`; `ContinuousMap.subalgebra_topologicalClosure_eq_top_of_separatesPoints`.

### Examples

For the uniform probability on [0,1], direct integration gives
`I=2∫0¹∫0ˣ−log(x−y) dy dx=3/2`. An added atom of any positive mass has
infinite self-energy. Thus `(1−1/j)μ+(1/j)δ0 → μ` weakly but its energy is
+∞ for every j>1. This computes the direction of descent and rules out an
energy defined by a totalized real logarithm. At a point distance two from an
atom, the potential is −log 2, fixing the sign independently of the pole test.

### Dependencies

Tonelli, native finite measures, weak compactness, Stone–Weierstrass, Frullani and the planar harmonic kernel interfaces in the supplier section.

## Layer 1: Capacity, equilibrium and domination

### 1.1 Robin constant and logarithmic capacity

For compact K ⊂ ℂ, let `robinConstant K = V(K)` be the infimum of I over
probability measures supported on K. Set `capacity K = exp(−V(K))`, with
`exp(−∞) = 0` when V(K) = +∞. The empty infimum is +∞, so the empty set has
capacity zero. Define `innerCapacity E` for Borel E as the supremum of the
capacities of its compact subsets, allowing an infinite value for unbounded E.
`realCapacity` uses the complex image of a real set. On compact sets, prove
monotonicity and `cap(aK+b) = |a| cap(K)` for a ≠ 0; the inner extension agrees
with compact capacity. Boundedness of K gives a finite lower bound for V(K),
so no compact branch requires exponentiating a negative infinite Robin constant.

The intended names are `robinConstant`, `capacity`, `innerCapacity`, `realCapacity`.

(Saff, Definition 1.8, p.172; Borel convention following Example 1.11, p.174.)

The definition is used through these specifications:

- `capacity_mono`: Capacity is monotone on compact sets.
- `capacity_affine`: A nonzero complex affine map multiplies capacity by |a|.
- `innerCapacity_compact`: The Borel inner extension agrees with compact capacity.

**Checks.**

- A singleton has capacity zero.
- A closed disk of positive radius r has capacity r.
- A nondegenerate real interval has capacity (b−a)/4.
- The Robin constant of the closed disk of radius two is −log 2; the sign is fixed independently of the zero-energy unit disk.
- The real singleton {2} has realCapacity zero, while innerCapacity of the complex closed disk of radius two is two.
- The empty set has Robin constant +∞, compact capacity zero and inner capacity zero.
- The interval [−1,1] has Robin constant log 2 and real capacity 1/2.
- The whole complex plane has infinite inner capacity, witnessed by disks of arbitrarily large radius; this is not a real-valued compact-capacity branch.

*Needs:* §0.3 (logarithmic energy); §0.4 (principle of descent); `isCompact_setOfPred_finiteMeasure_le_of_isCompact`.

### 1.2 Polar sets and quasi-everywhere statements

Call E `Polar` when every compact subset of E has zero capacity. On Borel sets
this is equivalent to vanishing inner capacity. Define `QuasiEverywhere K P`
by requiring the set `{z ∈ K : ¬P(z)}` to be polar. The domain K belongs in
this definition: points outside K are irrelevant to a relative assertion.
Prove hereditary polarity and the equivalence with this exceptional-set formula.
Area zero is much weaker than polarity; every nondegenerate real interval has
positive logarithmic capacity.

The intended names are `Polar`, `QuasiEverywhere`.

(Saff, Definition 1.8, p.172; quasi-everywhere convention, p.174; Levenberg, Proposition 2.4 and Corollary 2.5, pp.10–11.)

The definition is used through these specifications:

- `polar_iff_innerCapacity_zero`: For Borel sets, polarity is exactly vanishing inner capacity.
- `polar_subset`: Subsets of polar sets are polar.
- `quasiEverywhere_iff`: The exceptional set is inside the specified domain.

**Checks.**

- The empty set is polar.
- Every countable set is polar, even with accumulation points.
- The real interval [0,1] is not polar despite having area zero.
- Quasi-everywhere on the empty domain holds for every predicate, even a predicate false everywhere.
- On [0,1], equality outside a countable subset is quasi-everywhere, while a predicate failing on all of [0,1] is not.

*Needs:* §1.1 (robin constant and logarithmic capacity).

### 1.3 Finite energy annihilates polar sets

If μ is a finite compactly supported positive measure with I(μ) < +∞, then
μ(E) = 0 for every Borel polar E. A positive-mass compact restriction, normalized
to mass one, would have finite energy and give that compact subset positive
capacity. Regularity reduces a positive-mass Borel set to this case. Deduce that
a countable union of Borel polar sets is polar: a hypothetical finite-energy
probability supported on a compact subset of the union would assign zero mass
to every member and hence to its whole support. The self-energy assumption is
essential; a Dirac mass charges a polar singleton.

The intended names are `polar_measure_zero`, `polar_iUnion`.

(Levenberg, Proposition 2.4 and Corollary 2.5, pp.10–11.)

*Needs:* §0.3 (logarithmic energy); §1.2 (polar sets and quasi-everywhere statements); `MeasureTheory.lintegral_lintegral_swap`.

### 1.4 Equilibrium measure

For compact K of positive capacity, construct `equilibrium K` as the unique
supported probability attaining V(K). Existence follows from compactness of
supported probabilities and descent, and finite capacity gives a finite-energy
competitor. Strict energy makes two different minimizers impossible. Name the existence-and-uniqueness statement `equilibrium_exists_unique`. The
construction is only specified on positive-capacity compact sets; its value
outside that domain is not part of the API. Prove support, energy and uniqueness
characterizations, including invariance on adjoining a polar compact set.

The intended names are `equilibrium`.

(Saff, Lemma 1.7, p.172; Levenberg, Proposition 2.1 and Corollary 2.2, pp.8–9.)

The definition is used through these specifications:

- `equilibrium_supported`: The equilibrium measure is supported on K under compactness and positive capacity.
- `equilibrium_energy`: Its energy is the Robin constant.
- `equilibrium_unique`: A supported probability with minimal energy equals the equilibrium measure.

**Checks.**

- The equilibrium potential of the unit disk is zero at its centre.
- Adding a disjoint singleton to a positive-capacity compact set changes neither capacity nor equilibrium.
- The equilibrium law of [−2,2] is not a Dirac law.

*Needs:* §1.1 (robin constant and logarithmic capacity); §0.4 (principle of descent); `isCompact_setOfPred_finiteMeasure_le_of_isCompact`; §0.5 (strict positivity on mass-zero differences).

### 1.5 Frostman inequalities

For compact K of positive capacity and its equilibrium probability ωK, prove

```text
UωK(z) ≤ V(K) for every z ∈ ℂ;
UωK(z) = V(K) quasi-everywhere on K.
```

First variation gives UωK ≥ V(K) outside a polar subset of K and equality
ωK-almost everywhere. Lower semicontinuity then gives UωK ≤ V(K) on its
support. Off the support, differentiation under the finite integral gives
harmonicity. To control a boundary point, compare a nearby off-support point
with a nearest support point, split off a small-mass neighborhood, and bound
the logarithmic ratio by log 2. The boundary upper limit is at most V(K).
At infinity the potential tends to −∞. A value above V(K) would therefore give
an attained interior maximum on a connected complementary component; the native
strong maximum principle makes that harmonic function constant, contradicting
the boundary or infinity bound. This proves the everywhere upper bound without
assuming regularity of K.

The intended names are `frostman`.

(Levenberg, Theorem 2.6, pp.11–12; Proposition 1.4, p.6; Saff, Theorem 1.12, p.174.)

*Needs:* §1.4 (equilibrium measure); §1.2 (polar sets and quasi-everywhere statements); §1.3 (finite energy annihilates polar sets); §0.2 (logarithmic potential); §0.5 (strict positivity on mass-zero differences); `TauCeti.harmonicOnNhd_planarNewtonianKernel_sub`; `TauCeti.eqOn_const_of_harmonicOnNhd_of_isMaxOn`.

### 1.6 Principle of domination

For finite compactly supported positive measures μ, ν, assume
`0 < μ(ℂ)`, `ν(ℂ) ≤ μ(ℂ)` and I(μ) < +∞. If c ∈ ℝ and
`Uμ ≤ Uν+c` μ-almost everywhere, prove this inequality at every complex point.
The comparison measure ν may have atoms and infinite self-energy. The mass
inequality controls growth at infinity; the finite-energy hypothesis belongs
to μ. The zero-mass case is deliberately excluded: μ = ν = 0 and c < 0
would otherwise give a vacuous almost-everywhere premise and a false conclusion.

The target includes the passage from bounded continuous potentials to this
finite-energy statement. Regularize and truncate on expanding bounded domains,
use the comparison principle there, control the exceptional sets by finite
energy, and recover pointwise potentials using the continuity principle and
monotone limits. Saff's survey states the full theorem but gives only a proof
sketch; Levenberg's Proposition 2.7, p.12 proves the continuous comparison form.
A proof of the approximation passage is part of this target and must retain
atomic ν. No stronger continuity hypothesis is substituted for it.

**Checks.**

- With μ=ν=0 and c=−1 the almost-everywhere premise holds but the global
  conclusion would be 0≤−1. This witnesses the positive-mass hypothesis.

The intended names are `domination`.

(Saff, Theorem 2.8, p.182.)

*Needs:* §0.3 (logarithmic energy); §0.2 (logarithmic potential); §1.3 (finite energy annihilates polar sets).

### 1.7 Continuity of capacity

For an increasing sequence of bounded Borel sets Ej, prove
`innerCap(⋃j Ej) = supj innerCap(Ej)`. For decreasing nonempty compact sets Kj,
prove `cap(⋂j Kj) = infj cap(Kj)`. Restrictions of finite-energy competitors
and regularity prove the increasing statement. Supported equilibrium limits,
compactness and descent prove the decreasing statement. Include zero capacity
and empty intersection branches rather than dividing by capacity. The increasing
extension is inner capacity; the theorem does not identify it with an arbitrary
outer-capacity convention on non-Borel sets.

The intended names are `innerCapacity_iUnion`, `capacity_iInter`.

(Smith, Proposition 2.5 proof, pp.36–37; Levenberg, §2 Exercise 3, p.13; Proposition 2.4, pp.10–11.)

*Needs:* §1.1 (robin constant and logarithmic capacity); §1.3 (finite energy annihilates polar sets); §0.4 (principle of descent); `isCompact_setOfPred_finiteMeasure_le_of_isCompact`.

### 1.8 Fekete products and transfinite diameter

For n ≥ 2 and compact K, define `feketeDiameter K n = δn(K)` as the supremum
of `∏i<j |zi−zj|^(2/(n(n−1)))` over n-tuples in K. Repetitions contribute zero,
and the empty-set value is zero. Define `transfiniteDiameter K` as the infimum
of these diameters for n ≥ 2. Prove attainment for nonempty compact K,
antitonicity in n and the affine scaling formula. Delete each point in turn
from an (n+1)-tuple and multiply the n-point inequalities: every pair occurs
n−1 times, giving the stated direction. This convention counts n points;
Levenberg's δn counts n+1, so his indices are shifted by one.

The intended names are `feketeDiameter`, `transfiniteDiameter`.

(Saff, §1 (1.1), p.167; Lemma 1.1 and (1.4), pp.168–169; Levenberg, Proposition 2.3, pp.9–10.)

The definition is used through these specifications:

- `feketeDiameter_antitone`: The finite diameters decrease with the number of points.
- `feketeDiameter_attained`: On a nonempty compact K the Vandermonde maximum is attained, including coincident zero-product tuples.
- `transfiniteDiameter_affine`: Nonzero affine scaling multiplies diameter by |a|.

**Checks.**

- Every finite diameter of a singleton is zero.
- The two-point diameter of {0,2} is 2.
- The transfinite diameter of {0,2} is 0 despite its ordinary diameter 2.
- The three-point Fekete diameter of {0,2} is zero, while its two-point value is two.
- The transfinite diameter of the closed unit disk is one, whereas a finite singleton and {0,2} both have value zero.

*Needs:* §1.1 (robin constant and logarithmic capacity).

### 1.9 Capacity equals transfinite diameter

For every compact K ⊂ ℂ, including the empty and polar cases, prove
`transfiniteDiameter K = capacity K`. Integrating the log Vandermonde against
a finite-energy probability gives the capacity ≤ diameter direction. For the
reverse, take maximizing Fekete configurations and weak limits of their empirical
probabilities. With kM = min(M,logKernel), their product integrals have an
off-diagonal bound `−(n−1)/n · log δn(K)` and diagonal contribution M/n.
Pass to the limit at fixed M, then let M → ∞. A positive limiting diameter
therefore supplies a finite-energy competitor with energy at most its negative
logarithm. A zero limiting diameter is handled by the first inequality, and the
empty set separately. The diagonal contribution cannot be omitted.

The intended names are `diameter_capacity`.

(Saff, Theorem 1.9, pp.172–173; Theorem 1.18, pp.176–177; Levenberg, Proposition 2.3, pp.9–10.)

*Needs:* §1.8 (fekete products and transfinite diameter); §1.4 (equilibrium measure); §0.4 (principle of descent); `TauCeti.Probability.empiricalMeasureOfFintype`; `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`; `isCompact_setOfPred_finiteMeasure_le_of_isCompact`.

### Examples

On [−2,2], the interval equilibrium has energy zero and capacity one; its
potential at zero is zero. On [−1,1] the equilibrium energy is log 2 and
capacity 1/2. A finite set has transfinite diameter zero because sufficiently
long tuples must repeat a point, although `{0,2}` has two-point diameter two.
These examples distinguish diameter, transfinite diameter and capacity, and
show why the realization threshold cap>1 is stricter than mere nonpolarity.

### Dependencies

Layer 0, compactness of supported probabilities, native harmonicity and the strong maximum principle; the full finite-energy domination approximation is included here.

## Layer 2: External fields and weighted equilibrium

### 2.1 Admissible external fields

On a compact K, call an extended-real external field Q `AdmissibleField` if
it is lower semicontinuous, bounded below by a finite constant, and finite on a
nonpolar subset of K. Define `fieldWeight Q = exp(−Q)`, assigning weight zero
at Q = +∞. The equivalent weight convention is an upper semicontinuous
nonnegative weight, positive on a nonpolar set. Prove the constant-field,
zero-at-infinity and finite-point APIs. Neither positivity at a single polar
point nor an arbitrary discontinuous positive weight satisfies admissibility.

The intended names are `AdmissibleField`, `fieldWeight`.

(Levenberg, §5, p.23; Saff, §6, p.196.)

The definition is used through these specifications:

- `admissibleField_const`: For compact nonpolar K and finite real c, the constant field Q=c is admissible.
- `fieldWeight_top`: Infinite field means zero weight.
- `fieldWeight_finite`: At a finite field value c the weight is exp(−c).
- `admissibleField_weight`: Admissibility is equivalent to a real lower bound for Q on K, upper semicontinuity of e^(−Q) on K, and nonpolarity of its positive-weight subset.

**Checks.**

- The zero field has unit weight.
- The field identically +∞ is never admissible.
- A finite field on a singleton still fails the nonpolar condition.
- On the closed unit disk, Q(0)=1 and Q(z)=0 elsewhere fails lower semicontinuity and is not admissible.
- For constant Q=2, fieldWeight is exp(−2), distinguishing the sign from the polynomial potential weight.
- A field finite only on a singleton and +∞ elsewhere is not admissible on the unit disk, although its weight is nonzero at that point.

*Needs:* §1.2 (polar sets and quasi-everywhere statements); §1.1 (robin constant and logarithmic capacity).

### 2.2 Weighted energy

For a supported probability μ and an admissible field Q on compact K, set
`weightedEnergy μ Q = IQ(μ) = I(μ)+2∫Q dμ`. Both summands have finite negative
parts, so this extended sum has a well-defined value. Establish zero-field and
constant-field formulas and existence of a minimizing probability with finite
weighted energy. Indeed `{Q<+∞}` is nonpolar and is the countable union of compact
sublevels `{Q≤m}`. At least one is nonpolar. A finite-energy probability on
that sublevel gives a finite weighted competitor; lower semicontinuity of
energy and the field integral gives attainment on the compact set of supported
probabilities. This is an existence argument, not merely a definition of an
infimum.

The intended names are `weightedEnergy`.

(Levenberg, §5, p.23, weighted energy definition.)

The definition is used through these specifications:

- `weightedEnergy_zero_field`: Zero field gives ordinary energy.
- `weightedEnergy_const`: For a compactly supported probability and finite real c, I_c(μ)=I(μ)+2c.
- `weightedEnergy_minimum_exists`: For compact K and admissible Q there is a supported probability of finite weighted energy minimizing I_Q among all supported probabilities.

**Checks.**

- Zero measure in zero field has energy zero.
- A finite external field cannot remove atomic infinite energy.
- At field 1 the unit disk equilibrium has weighted energy 2.

*Needs:* §0.3 (logarithmic energy); §2.1 (admissible external fields); §0.4 (principle of descent); §1.3 (finite energy annihilates polar sets); `isCompact_setOfPred_finiteMeasure_le_of_isCompact`.

### 2.3 Weighted equilibrium and modified Robin constant

Construct `weightedEquilibrium K Q` as the unique minimizer for compact K and
admissible Q. Write VQ for its weighted energy and define
`weightedRobin K Q = FQ = VQ−∫Q dμK,Q = I(μK,Q)+∫Q dμK,Q`.
Both terms are finite at the minimizer. Strict energy proves uniqueness because
the field integral is affine. Prove the minimizing characterization, support,
zero-field reduction and this identity. Adding a finite constant c to Q does
not change the measure; it adds 2c to VQ and c to FQ. In particular VQ, ordinary
energy and FQ are three different quantities.

The intended names are `weightedEquilibrium`, `weightedRobin`.

(Saff, §6 (6.2), pp.196–198; Levenberg, §5 and Proposition 5.1, pp.23–24.)

The definition is used through these specifications:

- `weightedEquilibrium_minimizes`: For compact K and admissible Q, I_Q(μK,Q)≤I_Q(ν) for every supported probability ν.
- `weightedEquilibrium_zero_field`: The zero-field construction agrees with the ordinary minimizer.
- `weightedRobin_const`: For compact nonpolar K and finite constant field c, F_c=−log cap K+c.
- `weightedEquilibrium_supported`: Under compactness and admissibility the minimizer is supported on K.
- `weightedEquilibrium_unique`: Every supported probability with the same weighted energy is this minimizer.
- `weightedRobin_identity`: F_Q=I(μK,Q)+∫QdμK,Q as a finite extended-real identity.

**Checks.**

- For the unit disk and field 1, F=1 rather than V=2.
- The constant-field equilibrium equals the ordinary unit disk law.
- On [−1,1] in zero field, F=log 2.
- At zero field the measure is ordinary equilibrium, VQ=V(K) and FQ=V(K).
- For constant Q=c on the unit disk, VQ=2c while FQ=c; changing c does not change the law.

*Needs:* §2.2 (weighted energy); §1.4 (equilibrium measure); §2.1 (admissible external fields); §0.5 (strict positivity on mass-zero differences).

### 2.4 Weighted variational inequalities

For compact K and admissible Q, the weighted minimizer satisfies
`UμK,Q+Q ≥ FQ` quasi-everywhere on K, with equality μK,Q-almost everywhere.
Conversely a supported finite-energy probability with finite field integral
satisfying these inequalities minimizes IQ. Derive both directions from first
variation, polar-nullness and strict energy. The separate everywhere version
assumes Q finite and continuous on K and K regular, meaning its ordinary
equilibrium potential equals V(K) at every point of K; it gives
`UμK,Q+Q ≥ FQ` everywhere on K and equality on the weighted support. Do not
use that version for general lower semicontinuous fields or irregular sets.

The intended names are `weighted_variational`, `weighted_variational_converse`, `weighted_variational_regular`.

(Saff, §6 (6.2), pp.197–198; Levenberg, Proposition 5.1, p.24.)

*Needs:* §2.3 (weighted equilibrium and modified robin constant); §1.5 (frostman inequalities); §1.6 (principle of domination); §1.3 (finite energy annihilates polar sets); §0.5 (strict positivity on mass-zero differences).

### 2.5 Weighted polynomial norm

For a real compact K, a weight w and a real exponent t, define `weightedNorm`
by `sup({0} ∪ {w(x)^t |P(x)| : x ∈ K})`, using real powers. All uses with
negative t require w continuous and strictly positive. For t ≥ 0 a continuous
nonnegative w is enough for finiteness. The inserted zero fixes the empty-set
value. Prove the zero-polynomial formula, pointwise bound and product bound
`||PQ||K,w,t+s ≤ ||P||K,w,t ||Q||K,w,s`. Define `potentialWeight μ = exp(Uμ)`
when μ is Hölder and compactly supported, and abbreviate its weighted norm by
`nNorm`; this weight is positive, even though ordinary admissible field weights
may vanish. `uniformNorm` later is the specialization w = 1, t = 0. For complex
polynomials use the same supremum with |P(x)| replaced by the complex norm;
this is the extension used in root removal.

The intended names are `weightedNorm`, `potentialWeight`, `nNorm`.

(Smith, Definition 2.6, p.7; Lemma 4.9, p.29.)

The definition is used through these specifications:

- `weightedNorm_zero`: For compact K and continuous strictly positive w, ||0||K,w,t=0 for every real t.
- `weightedNorm_bound`: For compact K, continuous strictly positive w, t real and C≥0: ||P||K,w,t≤C iff w(x)^t|P(x)|≤C for every x∈K.
- `weightedNorm_mul`: For compact K and continuous strictly positive w: ||PQ||K,w,s+t≤||P||K,w,s||Q||K,w,t for all real s,t.

**Checks.**

- The supremum on the empty set is zero.
- X on [−1,1] at unit weight has norm 1.
- Weight 2 and exponent 3 give norm 8 to the constant polynomial 1 on [0,1].
- The potentialWeight of the zero measure is one; for uniform [0,1] it is exp(1) at zero.
- For the equilibrium probability on [−1,1], potentialWeight is 2 throughout the interval, and nNorm of 1 at exponent 3 is 8.
- At exponent zero nNorm is uniformNorm; on an empty set both give zero.
- A positive exponent with zero weight gives zero weighted norm; a negative-exponent theorem requires strictly positive weight.

*Needs:* §0.2 (logarithmic potential).

### Examples

Take the unit disk and Q=1. The ordinary equilibrium remains the weighted
minimizer. Its ordinary energy is 0, its weighted energy is 2 and its modified
Robin constant is 1. Conversely for a real Hölder probability μ, Q=−Uμ gives
modified Robin constant zero. A constant weight w=2 and exponent 3 gives norm
8 for the constant polynomial 1 on any nonempty compact set, fixing the
real-power normalization.

### Dependencies

Layers 0–1, compactness and lower semicontinuity of field integrals; no arithmetic supplier is used.

## Layer 3: Real Hölder laws and polynomial roots

### 3.1 Hölder measures

Define `HolderMeasure μ η` for a finite real measure by the existence of C > 0
such that `μ([x,y]) ≤ C(y−x)^η` for every x ≤ y, with η > 0. Define `IsHolder`
by existence of such an exponent. This is a bound on interval masses, not a
Hölder density assumption. It includes the zero measure and is preserved by
finite nonnegative scaling and restriction. It excludes every positive atom:
apply the bound to [x,x]. For a finite compactly supported law one may decrease
the exponent to some η ∈ (0,1), absorbing large distances into C.

The intended names are `HolderMeasure`, `IsHolder`.

(Smith, Definition 2.2, p.5.)

The definition is used through these specifications:

- `holder_no_atoms`: A positive Hölder exponent forces every singleton to have zero mass.
- `holder_smul`: Multiplication of an η-Hölder measure by any finite nonnegative scalar preserves η-Hölder regularity.
- `holder_restrict`: Restriction to any set preserves η-Hölder regularity.

**Checks.**

- The zero measure is η-Hölder for every positive η.
- A unit atom is not Hölder.
- Restricted volume on [0,1] is 1-Hölder.
- Uniform [0,1] satisfies HolderMeasure at η=1, and hence IsHolder.
- A unit Dirac mass fails HolderMeasure for every η>0 and fails IsHolder.
- The zero measure satisfies HolderMeasure for every positive η.

*Needs:* `MeasureTheory.Measure.support`.

### 3.2 Finite unions of nondegenerate intervals

Define `FiniteIntervals K` to mean that K is a nonempty finite union of
closed intervals of positive length with a strict gap between consecutive
components. Equivalently K is nonempty, compact, has finitely many components
and has no singleton components. Prove compactness, nonemptiness and invariance
under nonzero real affine maps, reversing the endpoint order for negative slope.
A finite set, or an interval with an isolated point adjoined, does not qualify.

The intended names are `FiniteIntervals`.

(Smith, Definition 2.4, p.7.)

The definition is used through these specifications:

- `finiteIntervals_compact`: A finite interval set is compact.
- `finiteIntervals_nonempty`: The nonempty condition is part of the carrier.
- `finiteIntervals_affine`: A nonzero real affine map preserves finite interval sets, reversing the witness order when needed.

**Checks.**

- A single positive-length interval is allowed.
- Two separated nondegenerate intervals are allowed.
- A singleton disjoint from a positive-length interval is forbidden.

*Needs:* `MeasureTheory.Measure.support`.

### 3.3 Hölder continuity of potentials

A finite compactly supported η-Hölder real measure with 0 < η < 1 has a finite
potential at every complex point. On the real line its potential is η-Hölder;
on ℂ it is continuous. Use the interval-mass bound in a layer-cake integral to
bound the near logarithmic singularity, and compare logarithmic ratios for the
far integral. The resulting real estimate has a finite constant depending on
the Hölder data. The continuity principle extends continuity from the real
support to the plane. No claim of a global complex η-Hölder estimate is needed.

The intended names are `holder_potential`.

(Smith, Lemma 2.3, p.6; Levenberg, Proposition 1.4, p.6.)

*Needs:* §3.1 (hölder measures); §0.2 (logarithmic potential); `MeasureTheory.lintegral_lintegral_swap`.

### 3.4 Potential weight equilibrium

If μ is a Hölder probability supported on compact real K, the field
`Qμ = −Uμ` is finite, continuous and admissible. Its weighted equilibrium is μ
and its modified Robin constant is zero. Finite energy shows K is nonpolar;
`Uμ+Qμ = 0` on K, and the weighted variational converse identifies the measure.
This specializes the general external-field theory to the potential weight
used for polynomial approximation.

The intended names are `potential_field_equilibrium`.

(Smith, Lemma 2.7 proof, pp.7–8; Levenberg, Proposition 5.1, p.24.)

*Needs:* §3.3 (hölder continuity of potentials); §2.4 (weighted variational inequalities); §2.3 (weighted equilibrium and modified robin constant); §1.3 (finite energy annihilates polar sets).

### 3.5 Polynomial root distribution bridge

Define `polynomialRootLaw P` from the multiset of real roots of a nonzero real
polynomial, giving each occurrence weight 1 divided by the multiset cardinality.
When that multiset is empty, use the explicitly chosen default probability δ0.
For every splitting positive-degree polynomial the denominator is its degree,
and the integral of a continuous test function is its root average, counting
multiplicity. The definition is a polynomial-specific adapter of the native
finite empirical law, rather than a new empirical probability construction.
Theorems about all conjugates require splitting over ℝ and positive degree;
the default branch is not a law of the complex conjugates of X²+1.

The intended names are `polynomialRootLaw`.

(Smith, Lemma 2.7, p.7; Definition 1.4, p.3.)

The definition is used through these specifications:

- `polynomialRootLaw_measure`: For a positive-degree real polynomial splitting over ℝ, its root law is (deg P)⁻¹ times the sum of Dirac measures over its native roots multiset.
- `polynomialRootLaw_integral`: For a positive-degree polynomial splitting over ℝ and measurable real F, its integral under the root law is (deg P)⁻¹ times the root-multiset sum of F, with multiplicity.
- `polynomialRootLaw_empirical`: Numbering the multiset recovers the imported empirical law, including repeated roots.

**Checks.**

- X−2 has law δ2.
- (X−1)² has the same law as X−1, retaining multiplicity.
- X²+1 uses the explicit zero-real-root default δ0, and is excluded by the splitting hypotheses.
- (X−1)²(X−2) has law (2/3)δ1+(1/3)δ2, distinguishing multiset normalization from a uniform law on the root set.
- X²+1 takes the default δ0 branch because it has no real roots; it is excluded from every all-conjugate law theorem.

*Needs:* `TauCeti.Probability.empiricalMeasureOfFintype`; `TauCeti.Probability.integral_empiricalMeasureOfFintype`.

### 3.6 Weighted zero-distribution criterion

Let μ be a supported Hölder probability on compact real K. If monic real Pj
split with every root in K, their degrees tend to infinity, and
`||Pj||K,wμ,deg Pj^(1/deg Pj) → 1`, prove their root laws converge weakly to μ.
Compactness provides a subsequential law ν; descent and the norm inequality
compare potentials. Apply domination with the finite-energy measure μ and the
possibly atomic comparison ν. On an exterior circle both potentials have mean
−log R; the inequality is therefore equality there. The exterior expansion
identifies every real moment, and Stone–Weierstrass on a compact real support
identifies ν with μ. The real support hypothesis is essential to this moment
argument; no analogous assertion for arbitrary complex extremizers is included.

The intended names are `weighted_zero_limit`.

(Smith, Lemma 2.7, pp.7–8.)

*Needs:* §3.5 (polynomial root distribution bridge); §3.4 (potential weight equilibrium); §1.6 (principle of domination); `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`; `isCompact_setOfPred_finiteMeasure_le_of_isCompact`; `ContinuousMap.subalgebra_topologicalClosure_eq_top_of_separatesPoints`.

### 3.7 Remez inequality

For a complex polynomial p of degree at most m, m ≥ 1, and a measurable
E ⊂ [−1,1] of length at least `2−m⁻²`, prove
`sup[−1,1]|p| ≤ exp(5) supE|p|`. The sharp measurable-set input is the real
Remez estimate with factor `Tm((4−|E|)/|E|)`. At a maximum point rotate p by a
unit complex scalar and apply the real theorem to its real part. The displayed
factor is bounded by exp(5) in this range. The target includes a proof of that
sharp measurable-set input. Erdélyi's Theorem 3.1 gives the real estimate;
Corollary 3.2 bounds it by `exp(5 m sqrt(s))` when the omitted length s is at
most one. Substituting s=m⁻² gives exp(5). The sharp proof is a separate
analytic obligation. Continuous
extension theorems do not supply it. Length, rather than an interval contained
in E, is the hypothesis.

The intended names are `remez`.

(Smith, Lemma 2.8 proof, p.8; Erdélyi, *Remez-type inequalities and
applications*, Theorem 3.1 and Corollary 3.2, p.173.)

*Needs:* native real and complex polynomial evaluation, Lebesgue measure and `Polynomial.Chebyshev.T`; the sharp measurable-set estimate is proved within this target.

### 3.8 Polynomial root removal estimate

For a finite interval union K and a supported Hölder probability μ, prove that
there is C > 0, depending only on K and μ, such that for n ≥ 0, a complex
polynomial P of degree m ≥ 1 and any complex root α,

```text
||P/(X−α)||K,wμ,n ≤ (2 max(n,m))^C ||P||K,wμ,n.
```

The root need not lie in K. On a short component interval the variation of nUμ
is bounded. Remove a disk of radius comparable to `m⁻²(n+1)⁻¹/η`, use Remez
on its complement, and divide by the remaining distance from α. Minimum
component length is positive and is absorbed into C. Include n = 0; degree
zero P is excluded because it has no removable root.

The intended names are `root_removal`.

(Smith, Lemma 2.8, p.8, (2.4).)

*Needs:* §3.7 (remez inequality); §3.3 (hölder continuity of potentials); §3.2 (finite unions of nondegenerate intervals); §2.5 (weighted polynomial norm).

### 3.9 Interval equilibrium probability adapter

For a < b, construct `intervalEquilibriumMeasure a b` by multiplying the native
Chebyshev T measure on [−1,1] by π⁻¹ and pushing it forward by
`t ↦ (a+b)/2+(b−a)t/2`. It is a probability with density
`1/(π sqrt((b−x)(x−a)))` on (a,b). Set the invalid a ≥ b branch to the zero
measure. Prove probability, equality with the complex equilibrium under real
pushforward and mean (a+b)/2. This affine probability normalization is the
additional adapter; the native orthogonality measure itself has mass π.

The intended names are `intervalEquilibriumMeasure`.

(Saff, Example 1.11, p.174; Smith, Example 5.16, p.43.)

The definition is used through these specifications:

- `intervalEquilibrium_probability`: For a<b the normalized affine law is a probability.
- `intervalEquilibrium_eq`: For a<b the complex pushforward of the normalized affine Chebyshev law equals the equilibrium probability of [a,b].
- `intervalEquilibrium_mean`: The mean is the midpoint.

**Checks.**

- At equal endpoints the adapter is zero; no probability is claimed on a polar set.
- The mean on [−2,2] is 0.
- On [−1,1] its mass is 1 rather than the native Chebyshev mass π.

*Needs:* `TauCeti.chebyshevMeasureT_univ`; §1.4 (equilibrium measure); §1.1 (robin constant and logarithmic capacity).

### 3.10 Finite interval equilibrium density and Hölder bound

For K = ⋃j=1..k [aj,bj] with `a1<b1<a2<b2<…<ak<bk`, construct the equilibrium
density

```text
|∏j=1..k−1 (x−cj)| / (π sqrt(|∏j=1..k (x−aj)(x−bj)|)),   x ∈ K,
```

where exactly one cj lies in each gap and the k−1 gap periods vanish. Prove it
is 1/2-Hölder. The period equations are linear in the coefficients of the monic
numerator; a homogeneous solution has a zero in every gap, more than its degree,
so the matrix is invertible. The same sign argument places its zeros in the
gaps. For the branch of the Cauchy transform asymptotic to 1/z, the boundary
jump gives this nonnegative density and its mass one. Vanishing periods make
the potential constant across components, and Frostman plus strict energy
identifies equilibrium. Endpoint inverse square-root bounds give the Hölder
estimate. For a single positive interval also prove
`Uω[a,b](0) = −log((a+b+2 sqrt(ab))/4)` when 0 < a < b.

The intended names are `finite_interval_equilibrium_holder`, `interval_equilibrium_potential_zero`.

(Smith, Remark 5.6, p.35; Christiansen–Simon–Zinchenko, Theorem 2.6(d), p.230 and §2 proof, pp.228–232; Saff, Example 1.11, p.174.)

*Needs:* §3.9 (interval equilibrium probability adapter); §3.1 (hölder measures); §1.4 (equilibrium measure); §1.1 (robin constant and logarithmic capacity); §3.3 (hölder continuity of potentials); §0.5 (strict positivity on mass-zero differences); `Complex.integral_boundary_rect_eq_zero_of_continuousOn_of_differentiableOn`; `DiffContOnCl.circleIntegral_sub_inv_smul`.

### 3.11 Countably many real connected components

Define `CountableComponents K` by countability of the set of connected components
`{connectedComponentIn K x : x ∈ K}`. This applies to arbitrary real sets and
allows the empty set. Prove finite interval unions satisfy it, countable sets
satisfy it, and nonzero affine homeomorphisms preserve it in both directions.
For closed real K, nondegenerate components are intervals; singleton components
may accumulate. Countability of singleton components, not isolation, is the
property used when discarding their mass. An uncountable Cantor set fails it.

The intended names are `CountableComponents`.

(Smith, Theorem 1.5, p.4; Notation 5.8, p.37.)

The definition is used through these specifications:

- `finiteIntervals_countableComponents`: Every finite interval set has countably many components.
- `countableSet_countableComponents`: Every countable real set has countably many components.
- `countableComponents_affine`: A nonzero real affine map preserves and reflects component countability.

**Checks.**

- The empty set qualifies.
- The nonnegative integer points give infinitely many countable components.
- The Cantor set has uncountably many one-point components.

*Needs:* §3.2 (finite unions of nondegenerate intervals).

### Examples

The root law of `(X−1)²(X−2)` is `(2/3)δ1+(1/3)δ2`; the average of x is 4/3.
Discarding multiplicities instead gives 3/2 and fails. On [−1,1], dividing the
Chebyshev T measure by π gives a probability of mean zero. For
K=[−3,−1]∪[1,3], the degree-one monic minimizer is X, with its root in the
gap. A root-location assertion for K itself therefore belongs only to the
later pruned polynomial, not the unpruned minimizer.

### Dependencies

Layers 0–2, the native empirical and Chebyshev measures, Cauchy integration and Stone–Weierstrass; the sharp measurable-set Remez input is part of the Remez target.

## Layer 4: Logarithmic moments and quantile approximation

### 4.1 Extended integer-polynomial logarithmic moments

Define `logAbs r` as log|r| when r ≠ 0 and −∞ at r = 0. For a nonzero integer
polynomial Q and a finite compactly supported real μ, define
`logMoment μ Q = Lμ(Q) = ∫ logAbs(Q(x)) dμ(x)`. Its positive part is finite;
its value may be −∞ but never +∞. Prove multiplicativity in Q as additivity of
moments, evaluation on Dirac masses and `Lμ(c)=log|c|` for a probability and
nonzero integer c. Factorizations retain the leading coefficient term. An
ordinary Bochner integral of a totalized log cannot replace this definition.

The intended names are `logAbs`, `logMoment`.

(Smith, Theorem 1.5 condition (1), p.4; Definition 2.1, p.5.)

The definition is used through these specifications:

- `logMoment_mul`: For compactly supported finite μ and nonzero integer P,Q, Lμ(PQ)=Lμ(P)+Lμ(Q), with the extended logarithm convention.
- `logMoment_dirac`: Dirac moments evaluate the extended logarithm.
- `logMoment_const`: For a probability μ and nonzero integer c, Lμ(c)=log|c|.

**Checks.**

- The constant polynomial 1 has moment zero.
- At δ0 the polynomial X has moment −∞.
- At δ2 the polynomial X has moment log 2.
- logAbs(0)=−∞, logAbs(1)=0 and logAbs(−2)=log 2, fixing the pole, unit value and absolute value.

*Needs:* §0.2 (logarithmic potential); `MeasureTheory.lintegral_lintegral_swap`; `Polynomial.resultant_eq_prod_eval`; `Polynomial.resultant_map_map`.

### 4.2 Arithmetic admissibility

Define `ArithmeticAdmissible μ` by `Lμ(Q) ≥ 0` for every nonzero Q ∈ ℤ[X].
Mass one, compactness and support are separate hypotheses; in particular the
zero measure satisfies the predicate. Prove each moment projection, convexity
of admissible supported probabilities and weak closedness on a fixed compact
support using upper semicontinuity of moments. Under x ↦ ±x+b with b ∈ ℤ,
admissibility is preserved in both directions by substituting into integer
polynomials. For finite compactly supported μ, a positive atom at an algebraic point
fails the predicate when its minimal polynomial is tested. Name weak closedness
on probabilities supported on fixed compact K `admissible_weakClosed`; its
proof uses the upper semicontinuity established in §4.5.

The intended names are `ArithmeticAdmissible`.

(Smith, Theorem 1.5 (1), p.4.)

The definition is used through these specifications:

- `admissible_moment`: Every nonzero integer polynomial has nonnegative moment.
- `admissible_convex`: Compactly supported admissible probabilities are closed under convex combinations tμ+(1−t)ν for 0≤t≤1.
- `admissible_integer_affine`: For compactly supported finite μ, integer b and s∈{−1,1}, the pushforward by x↦sx+b is admissible iff μ is admissible.

**Checks.**

- Zero mass satisfies the inequalities; probability is not baked into this predicate.
- An integer atom is excluded by X−a.
- Reflection of a compactly supported admissible measure stays admissible.

*Needs:* §4.1 (extended integer-polynomial logarithmic moments).

### 4.3 Quantile approximating polynomial

For a supported Hölder probability on compact real K and n > 0, take the
imported quantile at the upper-grid levels: `αi=μ.quantile((i+1)/n)` for
0 ≤ i < n. The additional specification `quantile_spec` identifies αi as the
least x ∈ K with `μ((−∞,x])=(i+1)/n`, including the final level one.
The continuous distribution function attains these levels; compactness gives
the endpoint even across a gap. Define `quantilePolynomial` as ∏i(X−αi), set P0=1, and define
`nearestQuantile` for positive n as the minimum distance to these n roots.
The roots are distinct, Pn is monic of degree n, and on each closed interval
J the root law differs from μ in mass by at most 1/n. The zero-degree nearest
distance is assigned zero; no estimate divides by n on that branch.

The intended names are `quantilePolynomial`, `nearestQuantile`.

(Smith, Definition 2.11, pp.9–10, (2.6).)

The definition is used through these specifications:

- `quantile_spec`: A chosen quantile belongs to K, has the specified cumulative mass, and is the least such point.
- `quantilePolynomial_degree`: The quantile product is monic of degree n, including n=0.
- `quantile_discrepancy`: For compact K, a supported Hölder probability μ, n>0 and every closed real interval I, |μPn,μ(I)−μ(I)|≤1/n.

**Checks.**

- The empty product is 1 and carries no quantile evaluation.
- The degree-one uniform-[0,1] quantile polynomial is X−1, fixing right-endpoint indexing.
- The degree-two uniform-[0,1] quantile polynomial has roots 1/2 and 1.
- Take half the uniform law on [0,1] and half on [2,3]. Its n=2 first upper quantile is 1, the least point of cumulative mass 1/2, rather than 2 at the other side of the gap.
- For uniform [0,1], the first upper-grid root is 1 at n=1 and 1/2 at n=2; choosing mid-cell rather than upper-cell quantiles fails.
- For the same n=2 polynomial, nearestQuantile at 0 is 1/2 and at 1/2 is zero.
- At n=0, quantilePolynomial is 1 and nearestQuantile is zero; the positive-degree discrepancy theorem is not applied.

*Needs:* `MeasureTheory.Measure.quantile`, `MeasureTheory.Measure.quantile_def` and `MeasureTheory.Measure.quantile_le_iff`; §3.1 (Hölder atomlessness); §3.5 (polynomial root law); compactness of K for the level-one endpoint.

### 4.4 Quantile determinant and weighted estimates

For this quantile construction there is C > 0 depending only on K and μ such
that for every n ≥ 2, with ρn the nearest-root distance,

```text
∏i<j |αi−αj| ≥ n^(−Cn) exp(−n² I(μ)/2),
n^(−C)ρn(x) ≤ wμ(x)^n |Pn(x)| ≤ n^Cρn(x),   x ∈ K.
```

The Hölder interval bound separates consecutive roots by a fixed multiple of
n⁻¹/η. Compare potentials by layer-cake integrals at scale n⁻¹/η: near the
point at most one quantile root contributes; at larger scales the distribution
discrepancy is at most 1/n. Integrating yields the O(log n) logarithmic error,
including a single log nearest-distance term. Summing at roots and integrating
against μ gives the determinant estimate. At roots the two norm bounds are
both zero; absolute values are required for the polynomial factor.

The intended names are `quantile_estimates`.

(Smith, Proposition 2.12, pp.10–12, (2.7)–(2.8).)

*Needs:* §4.3 (quantile approximating polynomial); §3.3 (hölder continuity of potentials); §0.3 (logarithmic energy); §2.5 (weighted polynomial norm); `MeasureTheory.lintegral_lintegral_swap`; `Polynomial.discr`.

### 4.5 Upper semicontinuity of logarithmic moments

For nonzero integer Q, the map μ ↦ Lμ(Q) is upper semicontinuous on probabilities
supported on a fixed compact K: under weak convergence,
`Lμ(Q) ≥ limsup Lμj(Q)`. Lower truncations of log|Q| decrease to logAbs(Q),
with a uniform finite upper bound on K. This direction makes the inequalities
Lμ(Q) ≥ 0 closed. In particular, if pairwise distinct monic irreducible integer
polynomials have every root in K and their laws converge, the limit is
admissible. For a fixed Q, only finitely many of those polynomials can share a
factor with Q; all remaining resultants are nonzero integers and give the
required nonnegative root averages.

The intended names are `logMoment_upperSemicontinuous`.

(Smith, §1 following Theorem 1.5, p.4; Theorem 5.11 proof, p.40.)

*Needs:* §4.1 (extended integer-polynomial logarithmic moments); `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`; `Polynomial.resultant_eq_prod_eval`; `Polynomial.resultant_map_map`.

### 4.6 Every-degree Hölder extremizers

For every supported Hölder probability μ on compact real K, the monic quantile
polynomials supply a splitting polynomial of every positive degree, with all
roots in K, and their weighted nth norms tend to one. The quantile norm estimate
gives polynomial upper growth. For the lower bound choose a point whose nearest
quantile-root distance is bounded below by a polynomial power of n, using the
Hölder mass estimate to prevent n tiny intervals from covering all of μ.
Taking nth roots removes both polynomial factors. This every-degree existence
result supplies the missing degrees when applying the zero-distribution
criterion; it asserts nothing about the location of roots of general complex
extremizers.

The intended names are `holder_extremizers`.

(Smith, Lemma 2.7 proof, pp.7–8; Proposition 2.12, pp.10–12.)

*Needs:* §4.4 (quantile determinant and weighted estimates); §4.3 (quantile approximating polynomial); §2.5 (weighted polynomial norm).

### Examples

For uniform [0,1], the n=2 upper quantiles are 1/2 and 1, so
`P2=(X−1/2)(X−1)` and the nearest-root distance at 0 is 1/2. The quantile law
assigns mass 1/2 to [0,1/2], agreeing with μ there, and mass 1/2 to the
singleton {1/2}, differing by the allowed 1/2. An integer atom cannot be
admissible: at δ2, the moment of X−2 is −∞. The zero measure is admissible,
which is why mass one is a separate realization hypothesis.

### Dependencies

Layers 0–3 and native integer resultants. The quantile estimates supply both the determinant and every-degree extremizer inputs.

## Layer 5: Integer approximation from convex-body geometry

### 5.1 Lower product bound for integer norms

Let μ be a Hölder probability supported on compact real K, let m,n ≥ 0, let
Q0,…,Qm ∈ ℤ[X] be linearly independent with degrees ≤ m, and let nonzero
R ∈ ℤ[X] satisfy Lμ(R) ≥ 0. Prove

```text
∏i=0..m ||Qi R||K,wμ,n ≥
  exp((mn−m²/2+n−m/2) I(μ)) / (m+1)!.
```

Integrate the logarithm of the weighted Vandermonde times ∏|R(αi)| against
μ^(m+1). Its mean gives exactly the displayed exponent. Choose a configuration
at least as large as that mean, with distinct points and nonvanishing R-values,
and apply the evaluation-body lower successive-minima bound. Ordering the
independent polynomials by their discrete evaluation norms bounds each minimum
by the corresponding norm. No m ≤ n assumption is used in this theorem.

The intended names are `norm_product_lower`.

(Smith, Proposition 3.5, pp.15–16.)

*Needs:* §4.2 (arithmetic admissibility); §2.5 (weighted polynomial norm); §3.3 (hölder continuity of potentials); Geometry of Numbers and Quadratic Arithmetic `GN.1/minkowski-second-lower`; `Polynomial.resultant_eq_prod_eval`; Geometry of Numbers and Quadratic Arithmetic `GN.1/evaluation-polytope-volume` and `GN.1/evaluation-polytope-minima`.

### 5.2 Nearly sharp independent integer polynomials

For a finite interval union K and a supported Hölder probability μ, there is
C > 0 such that for every n ≥ 2 there are n+1 independent integer polynomials
Q0,…,Qn of degree ≤ n with

```text
∏i=0..n ||Qi||K,wμ,n ≤ n^(Cn) exp(n² I(μ)/2).
```

Use all n+1 cofactors of the degree-(n+1) quantile polynomial as an interpolation
basis. Root removal and quantile estimates bound every cofactor norm, while the
inverse Vandermonde determinant controls the evaluation body's volume. The
upper successive-minima bound gives independent lattice vectors. The passage
from n+1 to n in the weight changes norms by a fixed factor because Uμ is
bounded. Omitting the last cofactor loses the full-dimensional lattice bound.

The intended names are `norm_product_upper`.

(Smith, Proposition 3.6, pp.16–17, (3.4).)

*Needs:* §4.4 (quantile determinant and weighted estimates); §3.8 (polynomial root removal estimate); §3.3 (hölder continuity of potentials); Geometry of Numbers and Quadratic Arithmetic `GN.1/minkowski-second-upper`; Geometry of Numbers and Quadratic Arithmetic `GN.1/evaluation-polytope-volume` and `GN.1/evaluation-polytope-minima`.

### 5.3 Nonpositive energy for admissible Hölder measures

If a Hölder compactly supported probability μ is arithmetically admissible,
prove I(μ) ≤ 0 without assuming its support is a finite interval union. Enclose
it in an interval and apply the upper product bound there. One of the independent
integer polynomials has a small norm; integrate its logarithm and use its
nonnegative moment. The resulting inequality is
`n I(μ)/2 ≤ C log n`, and n → ∞ gives the result. Hölder continuity makes
I(μ) finite at this stage; the later theorem removes that hypothesis.

The intended names are `holder_energy_nonpositive`.

(Smith, Corollary 3.7, p.17.)

*Needs:* §5.2 (nearly sharp independent integer polynomials); §4.2 (arithmetic admissibility); §0.3 (logarithmic energy); §2.5 (weighted polynomial norm); §3.3 (hölder continuity of potentials).

### 5.4 Weighted integer approximation

For a finite interval union K and a supported Hölder probability μ, there is
C > 0 such that, for n ≥ 2, any real P of degree < n and integer Q of degree n
whose image in ℚ[X] is squarefree admit R ∈ ℤ[X], degree < n, satisfying

```text
||P−R||K,wμ,n ≤ n^C ||Q||K,wμ,n.
```

Q need not be monic, and its roots need not be real or belong to K. The cofactor
covering contract expresses P−R as a combination of Q/(X−αi) with sum of
absolute coefficients O(n log(2n)); root removal bounds these cofactors. Retain
nonzero integer content: squarefreeness here means absence of repeated roots
over ℚ, not squarefree content in ℤ[X]. A negative leading coefficient is
handled by replacing Q with −Q.

The intended names are `integer_approximation`.

(Smith, Corollary 3.3, pp.13–14.)

*Needs:* §3.8 (polynomial root removal estimate); §2.5 (weighted polynomial norm); Geometry of Numbers and Quadratic Arithmetic `GN.4/smith-cofactor-adjustment`.

### 5.5 Gcd-refined norm product bound

For K and μ as above, let 0 ≤ k ≤ m ≤ n with n ≥ 2. Let independent integer
Q0,…,Qm have degrees ≤ n and nondecreasing n-norms. Take G as the
positive-leading primitive rational gcd of Q0,…,Qk, assume Lμ(G) ≥ 0, and
assume the maximum degree of Qi/G for i ≤ k is m. Then, with C depending only
on K and μ,

```text
∏i=0..m ||Qi||K,wμ,n ≥ n^(−Cn) exp((mn−m²/2) I(μ)).
```

The bounded squarefree-combination contract produces a degree-m squarefree
quotient. Apply cofactor covering to half monomials: twice the cofactor error
has integral coefficients and distinct monomial residues modulo 2. Select
these polynomials to complete the given quotient family to a basis, multiply
by G, and use the lower product bound. Norm ordering absorbs the added factors.
The k = 0 branch has m = 0 and follows directly; it does not invoke a
degree-zero cofactor covering theorem.

The intended names are `gcd_norm_bound`.

(Smith, Lemma 3.8, pp.17–19, (3.8).)

*Needs:* §5.4 (weighted integer approximation); §5.1 (lower product bound for integer norms); Classical Arithmetic Completion `CA.3`; §3.8 (polynomial root removal estimate); `MvPolynomial.eq_zero_of_eval_zero_at_prod_finset`; `MvPolynomial.combinatorial_nullstellensatz_exists_eval_nonzero`; Geometry of Numbers and Quadratic Arithmetic `GN.4/smith-cofactor-adjustment`.

### 5.6 Small squarefree integer polynomials

Every arithmetically admissible Hölder probability μ supported on compact real
K admits C > 0 and, for every n ≥ 2, an integer Rn of degree n, squarefree
after mapping to ℚ[X], with `||Rn||K,wμ,n ≤ n^(C sqrt(n))`. Work first in an
enclosing interval. Order the upper-bound independent family by norm and
follow the primitive gcd degrees. The gcd-refined lower bound and I(μ) ≤ 0
force a small-norm family whose squarefree combination has degree greater than
n−sqrt(n). Remove the remaining gcd by repeated root removal, then multiply
by at most sqrt(n) distinct integer linear factors avoiding the existing roots.
The accumulated cost stays n^(O(sqrt(n))). This polynomial is an approximation
tool; no monicity, irreducibility or root-location assertion is made here.

The intended names are `small_squarefree`.

(Smith, Theorem 3.1, p.12; proof pp.19–20.)

*Needs:* §5.5 (gcd-refined norm product bound); §5.2 (nearly sharp independent integer polynomials); §5.3 (nonpositive energy for admissible hölder measures); Classical Arithmetic Completion `CA.3`; §4.2 (arithmetic admissibility).

### Examples

The integer polynomial `4(X+1)` has no repeated root over ℚ, despite its
content 4. Dividing by the primitive rational gcd X+1 gives the nonzero
constant 4, squarefree over ℚ. This is permitted by the approximation and
bounded-combination contracts. By contrast `(X+1)²` fails rational
squarefreeness. With m=0, n=0 and R=1, the lower product bound reduces to
`||Q0||≥1` for a nonzero constant integer Q0, including the factorial 1.

### Dependencies

Layers 0–4; Geometry of Numbers and Quadratic Arithmetic GN.1 evaluation-body targets and GN.4/smith-cofactor-adjustment; Classical Arithmetic Completion CA.3 and its bounded squarefree-combination adapter.

## Layer 6: Chebyshev pruning and complementary polynomials

### 6.1 Monic Chebyshev polynomials on real compact sets

For nonpolar compact real K and r ≥ 1, construct `monicChebyshev K r` as the
unique monic real polynomial of degree r minimizing `uniformNorm K`. Set its
r = 0 value to 1. Prove r+1-point alternation, simple real roots in the convex
hull of K, and at most one root in each gap of K. Alternation proves uniqueness
and these root properties. For a finite interval union, with κ = cap(K), prove
`κ^r ≤ ||Tr||K ≤ Cκ^r` with C independent of r.

For the uniform upper bound use `Kn={|Tr|≤||Tr||K}`. Alternation splits Kn into
r bands. Pull back the normalized interval equilibrium to obtain mass 1/r on
each band and `cap(Kn)=(||Tr||K/2)^(1/r)`. The reciprocal energy identity gives
`log(cap(Kn)/κ)=∫ GK dωKn`, where GK = V(K)−UωK. At most one band contribution
per gap bounds this by `(sum of the finitely many gap maxima of GK)/r`.
Consequently `||Tr||K ≤ 2 exp(sum gap maxima) κ^r`. The representative existence statement is `chebyshev_finite_gap_bound`.
This proof uses finite-gap
geometry and does not request a general Parreau–Widom theory. A gap root need
not lie in K.

The intended names are `monicChebyshev`, `uniformNorm`.

(Smith, Lemma 4.2, p.23; Christiansen–Simon–Zinchenko, Theorem 1.1, pp.218–219; Theorem 1.4, p.222; Theorems 2.2–2.4, pp.227–229; §4 proof, pp.236–237.)

The definition is used through these specifications:

- `monicChebyshev_minimizes`: A positive-degree minimizer is monic and minimizes among all monic polynomials of that degree.
- `monicChebyshev_roots`: All roots are simple real roots in the convex hull, rather than necessarily in K.
- `monicChebyshev_finite_gap_bound`: Finite interval sets have a uniform multiplicative capacity bound.
- `monicChebyshev_zero`: The degree-zero monic polynomial is 1.
- `monicChebyshev_unique`: For compact real K of positive capacity and r>0, any monic degree-r polynomial with the minimal norm equals Tr.
- `monicChebyshev_alternation`: For compact real K of positive capacity and r>0, there are r+1 strictly increasing points in K on which Tr takes alternating values ±||Tr||K.
- `monicChebyshev_gap_root`: For compact real K of positive capacity and r>0, each open gap (a,b) with endpoints in K and no K-points inside contains at most one Tr-root.

**Checks.**

- On [−1,1] the degree-one minimizer is X.
- On [−1,1] the monic degree-two minimizer is X²−1/2.
- On [−3,−1]∪[1,3] the degree-one minimizer is X and its root lies in the gap.
- UniformNorm of 1 on a nonempty compact set is 1, and its value on the empty set is zero.
- UniformNorm of X on [−1,1] is 1, whereas uniformNorm of X²−1/2 there is 1/2.
- The zero-degree monic Chebyshev polynomial is 1; alternation for positive degree is not applied to an empty or polar set.

*Needs:* §1.1 (robin constant and logarithmic capacity); §3.2 (finite unions of nondegenerate intervals); §2.5 (weighted polynomial norm); §3.10 (finite interval equilibrium density and hölder bound); §1.5 (frostman inequalities); §0.3 (logarithmic energy).

### 6.2 Pruned real polynomials

For a monic, simple, real-splitting parent polynomial P and a finite interval
union K, define `IsPruned K P S` when S is the monic product of a subset of
P's roots retained in K, with the least and greatest parent roots in each
component removed. Every retained root therefore has a parent neighbor on both
sides in that same component. The empty retained subset gives S = 1. Prove
monicity, simple roots in K and divisibility into P. Parent roots in gaps may
also be removed. The neighbor condition distinguishes this from merely
discarding roots outside K.

The intended names are `IsPruned`.

(Smith, Definition 4.3, p.23.)

The definition is used through these specifications:

- `pruned_monic`: Every retained-root product is monic.
- `pruned_simple_roots`: A pruned polynomial is squarefree, splits over ℝ and has all its roots in K.
- `pruned_divides`: For a simple splitting parent, the pruned product divides it.

**Checks.**

- The empty retained set always gives the polynomial 1.
- Only the middle root is retained from (X+1)X(X−1) on [−1,1].
- The endpoint root cannot be retained from X(X−1) on [0,1].

*Needs:* §3.2 (finite unions of nondegenerate intervals); §6.1 (monic chebyshev polynomials on real compact sets).

### 6.3 Pruned Chebyshev norm and alternation bounds

Let K have k0 nondegenerate interval components and capacity κ. For each r ≥ 2,
prune the degree-(r+3k0) Chebyshev polynomial to a monic Sr of degree r, with
`||Sr||K ≤ r^C κ^r`. Produce r+k1 ordered points in K, k1 ≤ k0, where
`|Sr| ≥ C⁻¹κ^r`. Consecutive points either enclose a gap and no retained root,
or bound a subinterval of K with exactly one retained root. At most 3k0 roots
are removed. Their product on K is bounded using the convex hull and diam(K),
even when some removed roots lie in gaps; the source's stronger root-location
claim is unnecessary. Alternation then gives the stated retained-root pattern.

The intended names are `pruned_chebyshev_bounds`.

(Smith, Lemma 4.4, pp.23–24.)

*Needs:* §6.1 (monic chebyshev polynomials on real compact sets); §6.2 (pruned real polynomials); §1.1 (robin constant and logarithmic capacity); §3.8 (polynomial root removal estimate).

### 6.4 Even high coefficients with controlled roots

Assume κ > 1 and choose C1 ≥ 2 bounding the preceding Chebyshev and pruning
estimates. Put `D = ceil(4 C1²/(κ−1))`. Given a monic real P of degree n and
r ≥ 2, construct a monic T of degree r so that coefficients of T^D P in degrees
`(D−1)r+n,…,Dr+n−1` are even integers. At the pruning alternation points
T/Sr ≥ 1/2, and
`||T||K ≤ r^C1 κ^r + 2 C1 r κ^r`. Correct descending coefficients using monic
Chebyshev polynomials of lower degree. Choosing each correction in [0,2/D]
changes the relevant product coefficient through an interval of length two,
while leaving previously corrected higher coefficients fixed. The geometric
sum is controlled because κ > 1. The denominator κ−1 is never used at κ = 1.

The intended names are `even_coefficient_adjustment`.

(Smith, Lemma 4.5, pp.24–25.)

*Needs:* §6.3 (pruned chebyshev norm and alternation bounds); §6.2 (pruned real polynomials); §6.1 (monic chebyshev polynomials on real compact sets).

### 6.5 Complementary polynomial construction

For the same K, κ, C1 and D, define `complementDegreeFactor K = D`. Starting
from the adjusted T and monic parent P of degree n, put

```text
Q0 = ∏j=0..D−1 (T − (2j+1) κ^r/(4 D C1)),
d = Dr−r,                 C2 = 8(4 D C1)^D.
```

Define `complementaryPolynomial` by adding descending corrections
`Σi=1..d εi Ti`, εi ∈ [0,2], where Ti is the ordinary monic Chebyshev polynomial
of degree i, and then a nonnegative real constant N. These Ti are not powers
of the adjusted degree-r T. The corrections make the coefficients of QP in
degrees n+1,…,n+Dr−1 even. For n > 0 choose the least N for which
`|Q(α)| ≥ κ^(Dr)/(n C2)` at every complex root α of P. For n = 0 choose N = 0
and omit avoidance. The auxiliary r = 0 branch is Q = 1. Prove the degree Dr,
positivity of D, coefficient congruences and avoidance specification. This is
a genuine polynomial construction, so its carrier and uniqueness choices are
README targets rather than assumed data in Suggested.lean.

The intended names are `complementDegreeFactor`, `complementaryPolynomial`.

(Smith, Definition 4.6, pp.25–26.)

The definition is used through these specifications:

- `complementary_monic_degree`: For finite interval K with κ>1, monic P and r≥2, D(K)>0 and Q(K,P,r) is monic of degree D(K)r.
- `complementary_even_coefficients`: For finite interval K with κ>1, monic P of degree n and r≥2, QP has even integer coefficients at every degree n+1≤k<n+D(K)r.
- `complementary_avoids_parent`: There is C2>0 depending only on K such that for every monic positive-degree P and r≥2, every complex root α of P has |Q(α)|≥κ^(D(K)r)/(deg(P)C2).

**Checks.**

- The outside-domain r=0 branch returns 1.
- For a valid interval set and r≥2 the complementary polynomial to X has nonzero constant coefficient.
- For parent 1 its degree is Dr and coefficients 1,…,Dr−1 are even; no inverse parent degree is used.
- For κ=3 and C1=2 the degree factor is eight, distinguishing the ceiling formula from an incorrect fixed value.
- The degree factor D is a positive integer for κ>1 and C1≥2; the defining denominator is invalid at κ=1.
- For κ=2 and C1=2, the ceiling formula gives D=16.
- The parent polynomial 1 has degree zero and uses shift N=0; its positive-r output still has degree Dr.

*Needs:* §6.4 (even high coefficients with controlled roots); §6.1 (monic chebyshev polynomials on real compact sets); §6.2 (pruned real polynomials).

### 6.6 Complementary roots in the interval set

For all sufficiently large r, with the threshold depending only on K, the
complementary Q has Dr distinct real roots, all in K. Each is bracketed by an
interval [x,y] ⊂ K whose endpoints satisfy `|Q| ≥ C⁻¹κ^(Dr)`. In each pruning
subinterval, the D+1 level points create D root intervals: use every
`0 ≤ j < D`, including the final one. The Chebyshev correction terms are small
relative to the alternating level values. For the least avoidance shift, the
forbidden real shifts form at most n intervals of length at most
`2κ^(Dr)/(n C2)`. They cover [0,N), giving `N ≤ 2κ^(Dr)/C2`. The feasible endpoint
N is not declared forbidden. This argument works for complex parent roots;
the n = 0 branch requires no division by n.

The intended names are `complementary_roots`.

(Smith, Lemma 4.7, pp.26–28.)

*Needs:* §6.5 (complementary polynomial construction); §6.3 (pruned chebyshev norm and alternation bounds); §6.4 (even high coefficients with controlled roots).

### 6.7 Complementary norm, derivative and local slope

For all sufficiently large r, uniformly in the monic parent P, prove
`||Q||K, ||Q′||K ≤ r^C κ^(Dr)`. Around every root β of Q the interval
`[β−r⁻C,β+r⁻C]` lies in K and
`|Q(x)| ≥ C⁻¹κ^(Dr)|x−β|` there. The endpoint margins and the derivative
upper bound give polynomial separation and distance from component boundaries.
Use Rolle's theorem and the cofactor polynomial Q/(X−β) to keep its magnitude
away from zero locally. The local lower bound is linear in distance; a lower
bound for |Q| by a positive constant at the root would be false.

The intended names are `complementary_bounds`.

(Smith, Lemma 4.8, pp.28–29.)

*Needs:* §6.6 (complementary roots in the interval set); §6.5 (complementary polynomial construction); §3.8 (polynomial root removal estimate).

### Examples

On [−1,1], the degree-two monic minimizer is `X²−1/2`, alternating with
values 1/2,−1/2,1/2 at −1,0,1. For parent `(X+1)X(X−1)`, retaining only X
removes the component endpoint roots and is a valid pruning. Retaining the
root 0 from parent `X(X−1)` is invalid: there is no parent neighbor to its
left. In the complementary construction the constant parent 1 uses N=0;
avoidance has no roots to test and never divides by parent degree zero.

### Dependencies

Layers 0–5, especially capacity, finite-gap equilibrium, alternation and root removal. The finite-gap norm argument is internal to the arbitrary-compact Chebyshev target.

## Layer 7: Real roots with integer rounding margins

### 7.1 Interior quantile polynomials with shifted weight

Fix any integer d, a finite interval union K and a supported Hölder probability
μ. For every n ≥ 2 construct a monic, simple, real-splitting polynomial of
degree n, all of whose roots lie in K with polynomially small isolated
neighborhoods contained in K. Uniformly in n,
`||Pn||K,wμ,n+d ≤ n^C` and
`wμ(x)^(n+d)|Pn(x)| ≥ n⁻C dist(x,roots(Pn))` on K.
Start with the degree-(n+2k0) quantile polynomial and discard endpoint roots
in each component; retain n interior roots. Root separation and the near-root
quantile estimate control the discarded factors. Uμ is bounded, so the fixed
weight shift d changes bounds by a constant. Negative d is allowed because
wμ is strictly positive.

The intended names are `interior_quantiles`.

(Smith, Lemma 4.9, pp.29–30.)

*Needs:* §4.3 (quantile approximating polynomial); §4.4 (quantile determinant and weighted estimates); §6.2 (pruned real polynomials); §3.8 (polynomial root removal estimate); §3.3 (hölder continuity of potentials).

### 7.2 Real polynomial with rounding margins

For a finite interval union K of capacity κ > 1, a supported Hölder probability
μ and B > 0, there is C > 3 such that for integers n > C, with
`m=floor(B sqrt(n) log n)`, a monic real Pn of degree n satisfies:
all roots are simple and in K; coefficients in degrees n−m,…,n−1 are even
integers; `||Pn||K,wμ,n−m ≤ n^Cκ^m`; and there are disjoint ordered root brackets
`x1<α1<y1<x2<…<αn<yn` contained in K with
`min(wμ(xi)^(n−m)|Pn(xi)|,wμ(yi)^(n−m)|Pn(yi)|) ≥ n⁻Cκ^m`.
Increase C so m < n. Take r = ceil((m+1)/D), multiply an interior quantile
polynomial of degree n−Dr by its complementary polynomial of degree Dr, and
use 1 ≤ Dr−m ≤ D to control the fixed weight shift. Avoidance at the quantile
roots and derivative bounds separate the two root families and preserve the
bracket margins. These margins, not just a small norm, make subsequent integer
rounding possible.

The intended names are `real_polynomial_rounding_margins`.

(Smith, Proposition 4.1, pp.21–22; proof pp.30–31.)

*Needs:* §7.1 (interior quantile polynomials with shifted weight); §6.6 (complementary roots in the interval set); §6.7 (complementary norm, derivative and local slope); §6.5 (complementary polynomial construction).

### Examples

If a real monic P has exactly one simple root in each ordered bracket [xi,yi]
and its endpoint magnitudes exceed those of a perturbation H, then P+H has
opposite signs at each bracket's endpoints. It has at least one root in each
bracket. If its degree is n and there are n disjoint brackets, these account
for all roots, with multiplicity one. Positive potential weights allow the
same argument using weighted magnitudes. Mere smallness of a global norm
without endpoint margins would not give this conclusion.

### Dependencies

Layers 3–6, interior quantile separation, complementary roots, avoidance and derivative bounds.

## Layer 8: Smoothing and removal of Hölder hypotheses

### 8.1 Inverse interval equilibrium measure

For 0 < a < b, construct `inverseIntervalMeasure a b` with density
`sqrt(ab)/(π t sqrt((b−t)(t−a)))` on (a,b), zero elsewhere. Define it to be
the zero measure outside that parameter range. It is the pushforward under
x ↦ 1/x of the interval equilibrium probability on [1/b,1/a]. Prove its mass
one, 1/2-Hölder interval bound and mean sqrt(ab). The inversion substitution
accounts for the factor 1/t; using the ordinary interval density would give
mean (a+b)/2 instead. Both endpoints are atomless.

The intended names are `inverseIntervalMeasure`.

(Smith, Notation 5.1 and Lemma 5.2, pp.31–33; Example 5.16 mean, p.43.)

The definition is used through these specifications:

- `inverseInterval_probability`: The density has total mass one for 0<a<b.
- `inverseInterval_holder`: The kernel is 1/2-Hölder despite endpoint density singularities.
- `inverseInterval_mean`: Its mean is sqrt(ab).

**Checks.**

- At a=0 the totalized construction is zero, not a probability.
- ν[1,4] has mean 2.
- The measure on [1,4] gives no mass to either endpoint.

*Needs:* §1.4 (equilibrium measure); §1.1 (robin constant and logarithmic capacity); §3.1 (hölder measures); `TauCeti.chebyshevMeasureT_univ`.

### 8.2 Inverse interval potential identities

For the valid inverse-interval probability ν[a,b], prove

```text
Uν(z) + logAbs|z| ≤ log((a+2 sqrt(ab)+b)/(b−a)),
with equality for z ∈ [a,b],
Uν(0) = log((a+2 sqrt(ab)+b)/(4ab)).
```

The logarithm at z = 0 is −∞ in the first line. Derive the nonzero-z identity
by inversion from the interval potential; asymptotics at infinity recover the
finite potential value at zero. Positivity of a,b and b−a justifies every
logarithm argument and denominator. Treating log 0 as a finite real value would
change the asserted inequality at the origin.

The intended names are `inverseInterval_potential`.

(Smith, Lemma 5.2, pp.32–33.)

*Needs:* §8.1 (inverse interval equilibrium measure); §1.5 (frostman inequalities); §3.3 (hölder continuity of potentials); §1.1 (robin constant and logarithmic capacity); §3.9 (interval equilibrium probability adapter); §3.10 (finite interval equilibrium density and hölder bound).

### 8.3 Convolution smoothing with mass correction

For a finite compactly supported real μ of mass M and 0 < ε < 1/2, let νε be
the inverse-interval probability on [ε²,ε]. Its convolution with μ is
1/2-Hölder, has mass M and support in `supp μ+[ε²,ε]`. Prove, on all of ℂ,

```text
Uμ*νε ≤ Uμ + M log((ε²+2ε^(3/2)+ε)/(ε−ε²)).
```

The loss is O(M sqrt(ε)). Tonelli integrates the inverse-interval bound
against μ, which explains the mass factor. As ε → 0+ these convolutions tend
weakly to μ on a fixed enclosing compact set; use uniform continuity of test
functions after continuous extension from the support. The positive shift may
leave the original K, so support-preserving uses split components and shift
inward separately.

The intended names are `smoothing_potential`, `smoothing_tendsto`.

(Smith, Notation 5.3 and Lemma 5.4, pp.33–34.)

*Needs:* §8.1 (inverse interval equilibrium measure); §8.2 (inverse interval potential identities); §0.2 (logarithmic potential); `MeasureTheory.lintegral_lintegral_swap`; `ContinuousMap.exists_restrict_eq`; `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`; §3.10 (finite interval equilibrium density and hölder bound).

### 8.4 Sweetening a subprobability measure

Let compact real K have κ = cap(K) > 1, let μ be a compactly supported
probability, and let ν be a compactly supported subprobability. Write
γ = 1−ν(ℝ) and let ωK be equilibrium. Suppose

```text
B = sup{Uν(z)+γ UωK(z)−Uμ(z) : Uμ(z) is finite}
```

is finite. The common mass-one behavior at infinity gives B ≥ 0. Set
`β=B/(B+log κ)` and define
`sweetened K μ ν = (β+γ−βγ)ωK+(1−β)ν`. This is a probability, and Frostman
and the definition of B give `Usweetened ≤ (1−β)Uμ` everywhere, including
points where Uμ = +∞. Its support lies in K when ν is supported there; the
reference μ need not be supported on K. Integer leading coefficients contribute
nonnegative log terms, so each individual inequality Lμ(Q) ≥ 0 passes to the
sweetened measure. Prove the probability, support and potential APIs. The
strict κ > 1 assumption prevents a zero denominator at B = 0.

The intended names are `sweetened`.

(Smith, Definition 5.5, pp.34–35; Remark 5.6, p.35.)

The definition is used through these specifications:

- `sweetened_probability`: The sweetened measure has total mass one when ν is a subprobability and B≥0.
- `sweetened_supported`: Sweetening preserves K-support if ν is supported there.
- `sweetened_potential`: A pointwise bound by B gives the sweetening potential inequality.

**Checks.**

- When ν has mass one and B=0, sweetening leaves ν unchanged.
- For ν=0, γ=1, and κ>1, all mass is equilibrium mass.
- At capacity 1 and B=0 the denominator vanishes, explaining the strict threshold.

*Needs:* §1.4 (equilibrium measure); §1.5 (frostman inequalities); §0.2 (logarithmic potential); §4.1 (extended integer-polynomial logarithmic moments); §4.2 (arithmetic admissibility); §3.10 (finite interval equilibrium density and hölder bound).

### 8.5 Nonpositive energy without Hölder hypotheses

Every compactly supported arithmetically admissible real probability has
I(μ) ≤ 0 and hence finite energy, without a Hölder or component hypothesis.
Enclose its support in an interval of capacity > 1 with space for smoothing.
Convolve and sweeten there. The resulting Hölder probabilities remain
admissible, have nonpositive energy by Layer 5, and converge weakly to μ with
a common compact support; descent gives I(μ) ≤ 0. This argument precedes
component reduction, avoiding a circular use of polar-nullness before finite
energy is known.

The intended names are `admissible_energy_nonpositive`.

(Smith, Proposition 5.7, pp.35–36.)

*Needs:* §8.3 (convolution smoothing with mass correction); §8.4 (sweetening a subprobability measure); §5.3 (nonpositive energy for admissible hölder measures); §0.4 (principle of descent); §4.2 (arithmetic admissibility).

### 8.6 Countable-component Hölder reduction

Let compact real K have countably many components and cap(K) > 1, and let μ
be an admissible probability supported on K. Construct admissible Hölder
probabilities μj supported on finite interval unions Kj ⊂ K, with cap(Kj) > 1,
converging weakly to μ. The singleton components form a countable polar set,
possibly with accumulation points, and carry no μ-mass by the preceding finite
energy theorem. Exhaust the nondegenerate components by finite compact interval
unions; capacity continuity makes one have capacity > 1. Restrict μ to this
exhaustion and sweeten with a fixed positive-capacity union. Then split each
interval at its midpoint, smooth each half inward and sweeten again. A diagonal
sequence preserves support and all integer moments while converging to μ.

The intended names are `holder_reduction`.

(Smith, Proposition 2.5, p.7; proof pp.36–37.)

*Needs:* §8.5 (nonpositive energy without hölder hypotheses); §1.3 (finite energy annihilates polar sets); §1.7 (continuity of capacity); §8.4 (sweetening a subprobability measure); §8.3 (convolution smoothing with mass correction); §3.2 (finite unions of nondegenerate intervals); §3.11 (countably many real connected components).

### Examples

For the inverse interval law on [1,4], its mean is 2; the ordinary interval
equilibrium has mean 5/2. For input μ=2δ0, smoothing has mass two and its
potential loss is twice the probability loss. When ν=0, γ=1 and the
sweetened law is equilibrium regardless of the allowed B; when γ=0 and B=0,
it is exactly ν. The compact set consisting of {0}, the intervals
[1/(2j+1),1/(2j)] for j≥1, and [1,6] has a nonisolated singleton component
{0} and capacity at least 5/4. Its singleton component is discarded by
polarity and finite energy, not by isolation.

### Dependencies

Layers 0–7; normalized interval equilibrium, domination, capacity continuity and native convolution. The no-Hölder energy theorem precedes polar-null component reduction.

## Layer 9: Realization by integer conjugates

### 9.1 Integer conjugates realize admissible measures

For compact real K with countably many components and cap(K) > 1, and a
probability μ supported on K, prove the equivalence:
μ is arithmetically admissible if and only if it is the weak limit of the
root laws of pairwise distinct monic irreducible positive-degree integer
polynomials whose roots all lie in K. These are minimal polynomials, so
infinitely many choices of a conjugate of one polynomial do not count as a
sequence of distinct algebraic integers up to conjugacy.

Necessity uses resultants and upper semicontinuity of logarithmic moments.
For a Hölder law on a finite interval union, choose B large enough that the
rounding margin κ^m dominates n^(C sqrt(n)). Round `Plow/4+1/2` using the small
squarefree integer polynomial and integer approximation; keep the high even
coefficients and replace the low part by `4R−2`. All nonleading coefficients
are divisible by 2 and the constant is 2 modulo 4, so the monic output is
Eisenstein at 2. The perturbation is smaller than every bracket endpoint value,
so exactly one real root survives in each bracket and all roots remain in K.
The weighted nth norm tends to one because m/n → 0, giving root-law convergence.
Finally diagonalize the Hölder reduction, choosing increasing degrees to ensure
distinctness. No claim is made at capacity one or for general complex K.

The intended names are `integer_conjugate_realization`.

(Smith, Theorem 1.5, p.4; §4.1 proof, pp.22–23.)

*Needs:* §8.6 (countable-component hölder reduction); §7.2 (real polynomial with rounding margins); §5.6 (small squarefree integer polynomials); §5.4 (weighted integer approximation); §3.6 (weighted zero-distribution criterion); `Polynomial.IsEisensteinAt.irreducible`; `Polynomial.resultant_eq_prod_eval`; `Polynomial.resultant_map_map`; §4.2 (arithmetic admissibility); §4.5 (upper semicontinuity of logarithmic moments); §3.11 (countably many real connected components).

### Examples

The equilibrium on [−3,3] has capacity 3/2 and potential at most −log(3/2).
For nonzero integer Q of degree d and leading coefficient c, factorization
gives `Lω(Q)=log|c|−Σroots Uω(α) ≥ d log(3/2)+log|c| ≥0`.
The interval therefore meets realization's strict threshold and its equilibrium
is a limit of distinct monic irreducible integer root laws. The same argument
at capacity one supplies nonnegative moments but does not authorize the
strict-threshold construction; that boundary is outside the theorem.

### Dependencies

Layers 3–8, native resultants and Eisenstein irreducibility at (2).

## Layer 10: Cofinite optimization and auxiliary completeness

### 10.1 Cofinite conjugate averages and auxiliary certificates

For real Σ define `algebraicPolynomials Σ` as the monic irreducible integer
polynomials of positive degree with every conjugate in Σ. For such P,
`conjugateMean P F` is the integral of F against its root law. Define
`cofiniteMean Σ F` as the extended supremum of real c for which only finitely
many P in that population have mean < c. This cofinite liminf does not depend
on an enumeration or the choice of a conjugate. An empty or finite population
has value +∞.

Define `HasAuxiliaryCertificate Σ F c` by finitely many nonzero Qi ∈ ℤ[X]
and strictly positive real ai with
`F(x) ≥ c+Σi ai logAbs(Qi(x))` on Σ. Empty lists are allowed. Define `auxiliarySup`
as the extended supremum of certificate values. A zero of any listed polynomial
makes the right side −∞ because its coefficient is positive. Resultants give
the certificate bound outside the finitely many irreducible factors of the Qi.
For an infinite polynomial population a constant objective has its own constant
as cofinite mean; do not assert that formula for finite populations.

The intended names are `algebraicPolynomials`, `conjugateMean`, `cofiniteMean`, `HasAuxiliaryCertificate`, `auxiliarySup`.

(Smith, Notation 5.8, p.37; Theorem 5.11, p.39.)

The definition is used through these specifications:

- `cofiniteMean_const`: If IΣ is infinite, a constant F=c has cofinite mean c.
- `auxiliary_certificate_cofinite_bound`: A certificate bounds all but finitely many irreducible conjugate averages.
- `empty_auxiliary_certificate`: A pointwise constant lower bound supplies the empty certificate.

**Checks.**

- For Σ=∅ the cofinite mean is +∞, so infinitude cannot be omitted from constant-mean formulas.
- F=3 admits the empty certificate with value 3 on every Σ.
- On all of ℝ, F=0 has no auxiliary certificate of value 1. A mistaken definition permitting the zero polynomial would incorrectly give such a certificate.
- On all of ℝ, X²−2 belongs to algebraicPolynomials and X²+1 does not; real splitting is part of this population.
- ConjugateMean of X²−2 for F(x)=x is zero, since its roots are ±sqrt(2).
- On [−3,3], the population is infinite by realization and a constant objective 7 has cofiniteMean 7.
- On [1,∞), Q=X with coefficient one gives an auxiliary certificate of value zero for F(x)=log x.
- AuxiliarySup on all of ℝ for the constant objective 3 is 3; on the empty set for F=0 it is +∞.
- On Σ=∅, algebraicPolynomials is empty, and on Σ={2} it consists only of X−2; both populations have cofiniteMean +∞.
- ConjugateMean of X−2 for F(x)=x is 2; for F=3 every positive-degree splitting polynomial has mean 3.
- The certificate list containing Q=0 is forbidden; allowing it would certify any constant by a singular right side.
- For F=0 on all of ℝ, auxiliarySup is 0: the empty certificate gives zero, and any nonconstant auxiliary makes the right side unbounded above at infinity; nonzero integer constants have nonnegative logarithms.

*Needs:* §3.5 (polynomial root distribution bridge); §4.1 (extended integer-polynomial logarithmic moments); §4.2 (arithmetic admissibility).

### 10.2 Compact reduction for coercive objectives

Let Σ ⊂ ℝ be closed, have countably many components and inner capacity > 1
(equivalently contain a compact subset of capacity > 1). Let F be continuous
on Σ and superlogarithmic at infinity within Σ:
`F(x)/log|x| → +∞` as |x| → ∞ with x ∈ Σ. For compact Σ this condition is
vacuous. Construct a fixed compact Σ0 ⊂ Σ of capacity > 1 such that every
compactly supported probability on Σ not supported on Σ0 can be replaced by
one on Σ0 with strictly smaller F-integral, preserving each individual integer
moment inequality that the original law satisfied.

Choose a finite interval union Σ1 ⊂ Σ of capacity κ > 1. Its equilibrium
potential dominates that of a normalized far-tail law up to the tail's log|x|
mean. Restrict the original law to [−M,M] and sweeten with this equilibrium.
Coercivity makes the removed F-cost exceed the sweetening and renormalization
cost. Take Σ0 = Σ∩[−M,M], containing Σ1. The construction works before all
moment inequalities are imposed, as required by finite-dimensional separation.

The intended names are `compact_optimization_reduction`.

(Smith, Lemma 5.10, pp.37–39.)

*Needs:* §8.4 (sweetening a subprobability measure); §1.6 (principle of domination); §1.5 (frostman inequalities); §1.7 (continuity of capacity); §1.3 (finite energy annihilates polar sets); §3.11 (countably many real connected components).

### 10.3 Completeness of auxiliary-polynomial optimization

Under the preceding closedness, component, capacity and growth assumptions,
prove that `cofiniteMean Σ F = auxiliarySup Σ F` is finite and equals the
minimum of ∫F over compactly supported admissible probabilities on Σ. A
minimizer is supported on the fixed compact Σ0. The easy inequality uses
resultants. For the reverse, separate finite vectors consisting of an F-integral
and integer logarithmic moments from the open forbidden orthant, then normalize
the F coefficient to −1. The logarithmic coefficients are nonnegative.

To obtain the strictly positive certificate coefficients required by the
definition, replace every zero coefficient by δ > 0 and reduce the constant
by η > 0. On a sufficiently large compact set bound the added positive
logarithms and choose δ small enough; outside it superlogarithmic growth
absorbs them. At an auxiliary root the new right side is −∞, so the inequality
holds there too. Let η → 0. Compact reduction puts approximate feasible
measures on one compact set. Weak compactness and upper semicontinuity of all
log moments give an admissible minimizer; realization identifies its integral
with the cofinite mean. Retaining zero weights while relying on singular
logarithms would leave the separation proof incomplete.

The intended names are `auxiliary_completeness`.

(Smith, Theorem 5.11, pp.39–40.)

*Needs:* §10.1 (cofinite conjugate averages and auxiliary certificates); §10.2 (compact reduction for coercive objectives); §9.1 (integer conjugates realize admissible measures); `geometric_hahn_banach_open`; `isCompact_setOfPred_finiteMeasure_le_of_isCompact`; `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`; §4.1 (extended integer-polynomial logarithmic moments); §4.5 (upper semicontinuity of logarithmic moments); §3.11 (countably many real connected components).

### Examples

An empty polynomial population has cofinite mean +∞, even for F=3, while an
empty auxiliary list certifies the lower bound 3 on any Σ. Under the theorem's
hypotheses, realization makes the population infinite and the common value
finite. For Σ=[0,∞) and F(x)=x, `x/log x →∞`; the optimization problem admits
a compactly supported minimizer although the allowed region is unbounded.
Reflecting the sign of F on a compact Weil interval gives the upper rather
than lower extremal conjugate average.

### Dependencies

Layers 0–9, real convex separation and weak compactness; superlogarithmic growth replaces a compactness assumption on Σ.

## Layer 11: Trace witnesses and optimal support

### 11.1 Potential majorant criterion for admissibility

Let μ be a compactly supported real probability. Let Qi be distinct primitive
irreducible positive-degree integer polynomials with ai > 0 and
`Σi ai deg Qi ≤ 1`. Assume on all of ℂ that
`Uμ(z) ≤ −Σi ai logAbs(|Qi(z)|)`, and assume Lμ(Qi) ≥ 0 for these exceptional
polynomials. Then μ is arithmetically admissible. For any other primitive
irreducible P, evaluate the majorant at its roots. The nonzero integer
resultants and both leading-coefficient terms give Lμ(P) ≥ 0; the degree
budget controls the remaining leading term. Factorization and constants cover
all nonzero integer polynomials. Capacity and component hypotheses are needed
only for the subsequent realization conclusion, not for this moment criterion.

The intended names are `potential_majorant_admissible`.

(Smith, Proposition 5.15, p.42.)

*Needs:* §4.1 (extended integer-polynomial logarithmic moments); §4.2 (arithmetic admissibility); `Polynomial.resultant_eq_prod_eval`; `Polynomial.resultant_map_map`; §9.1 (integer conjugates realize admissible measures).

### 11.2 Serre’s explicit trace witness

Take exact rational parameters
`a=87353/10⁶`, `b=4411076/10⁶`, `γ=215485/10⁶`. Define `serreMeasure` to be
`γ ν[a,b]+(1−γ) ω[a,b]`. It is a supported Hölder probability, and

```text
mean = γ sqrt(ab) + (1−γ)(a+b)/2,
C = −log((b−a)/4) + γ log((a+b+2 sqrt(ab))/4) < 0,
Lμ(X) = (1−2γ) log((a+b+2 sqrt(ab))/4) + γ log(ab) > 0.
```

The explicit interval identities give `Uμ(x)=−γ log x+C` on [a,b]. Domination
with comparison measure γδ0 extends `Uμ ≤ −γ log|z|+C` globally. The majorant
criterion with Q1=X and degree budget γ ≤ 1 proves admissibility. Certify
`1.898303 < mean < 1.898304`; the interval capacity `(b−a)/4` is > 1.

For a reproducible exact certificate bracket sqrt(ab) between
`310371036756009/500000000000000` and `620742073512019/10¹⁵`, checking the
squared rational endpoints. For each positive rational log argument use
`y=(x−1)/(x+1)`, the eighty-term sum
`2 Σk=0..79 y^(2k+1)/(2k+1)`, and remainder bound
`2|y|^161/(161(1−y²))`. Monotonicity brackets the arguments involving the
square root; rational arithmetic then proves both signs and the mean interval.
Name these three certified inequalities `serre_witness_numerics`. The decimal
parameters are rationals, not floating-point inputs. This witness
is an admissible law and an upper-bound tool; it is not asserted to be an
optimal trace law.

The intended names are `serreMeasure`.

(Smith, Example 5.16, pp.42–43.)

The definition is used through these specifications:

- `serreMeasure_probability`: The exact mixture is a probability.
- `serreMeasure_admissible`: The majorant and positive X moment certify all integer moments.
- `serreMeasure_mean`: The exact mean has the displayed rational-parameter expression.

**Checks.**

- The mean is certified in the strict interval (1.898303,1.898304).
- The X logarithmic moment is strictly positive.
- The witness interval has capacity greater than 1.
- The witness mass is one and both interval endpoints have zero mass; omitting the π normalization or inserting endpoint atoms fails.

*Needs:* §8.1 (inverse interval equilibrium measure); §8.2 (inverse interval potential identities); §11.1 (potential majorant criterion for admissibility); §1.4 (equilibrium measure); §1.1 (robin constant and logarithmic capacity); §3.3 (hölder continuity of potentials); §3.9 (interval equilibrium probability adapter); §3.10 (finite interval equilibrium density and hölder bound); §1.6 (principle of domination).

### 11.3 Trace constant below 1.89831

Via the Classical Arithmetic Completion identification of its Schur–Siegel–Smyth
constant with `cofiniteMean [0,∞) id`, prove `λSSS < 1.89831`. Realization of
the exact witness supplies infinitely many distinct totally positive minimal
polynomials with trace per degree tending to its mean, already < 1.898304.
The cofinite definition therefore bounds λSSS by that mean. The classical
constant is a supremum of cofinite lower thresholds; a least lower threshold
would not define the intended quantity. The witness construction itself uses
no imported trace constant.

The intended names are `trace_constant_bound`.

(Smith, Theorem 1.1, p.2; Example 5.16, pp.42–43.)

*Needs:* §11.2 (serre’s explicit trace witness); §10.3 (completeness of auxiliary-polynomial optimization); §9.1 (integer conjugates realize admissible measures); Classical Arithmetic Completion `CA.6`.

### 11.4 Active-polynomial equality and support exclusion

Under the optimization hypotheses, let μ be an admissible compactly supported
minimizer. If a monic irreducible nonconstant integer P has all its roots in
the interior of Σ and `conjugateMean P F < cofiniteMean Σ F`, prove
`Lμ(P)=0` and that supp μ is disjoint from every root of P. If its moment
were positive, perturb μ toward a small Hölder law near the conjugates,
sweetening the other moments, to lower the objective. Local smoothing near a
root in supp μ gives the further improving perturbation needed for support
exclusion. Interior neighborhoods preserve Σ-support. Both optimality and the
interior condition belong to the theorem; the conclusion need not hold for
the preceding nonoptimal witness or for a polynomial with boundary roots.

The intended names are `optimal_polynomial_support`.

(Smith, Proposition 5.17, pp.43–45.)

*Needs:* §10.3 (completeness of auxiliary-polynomial optimization); §11.1 (potential majorant criterion for admissibility); §1.6 (principle of domination); §8.4 (sweetening a subprobability measure); §8.3 (convolution smoothing with mass correction); §3.11 (countably many real connected components).

### Examples

The exact witness has cap([a,b])=1.08093075 and mean strictly between
1.898303 and 1.898304. Its positive X moment does not test optimality via
the active-polynomial theorem: the root 0 is on the boundary of [0,∞),
whereas that theorem requires interior roots.
For support exclusion one uses a polynomial whose roots lie in the interior,
such as X−1 when its mean is below the optimum. This separates witness
admissibility from optimality and the interior-root hypothesis.

### Dependencies

Layers 1, 3–4 and 8–10, native resultants; Classical Arithmetic Completion CA.6 only for the named classical trace constant.

## Layer 12: Simple abelian varieties and point counts

### 12.1 Real Weil polynomials and normalized point counts

For an integer prime power q > 1 and monic irreducible positive-degree
P ∈ ℤ[X] with roots xi in `[−2 sqrt(q),2 sqrt(q)]`, choose a root π of
`T²−xi T+q`. Integrality over ℤ[xi] and the conjugate quadratics give a
q-Weil algebraic integer. Away from the finitely many endpoint classes,
import the shared Honda–Tate correspondence to its simple Fq-isogeny class.
If d = deg P and e is its positive Honda–Tate multiplicity, prove

```text
Frobenius characteristic polynomial = ∏i (T²−xi T+q)^e,
dim A = ed,             #A(Fq) = ∏i(q+1−xi)^e,
log(#A(Fq))/dim A = conjugateMean P (x ↦ log(q+1−x)).
```

The same e appears in numerator and dimension and cancels. Distinct P give
distinct classes, and every simple class supplies a real Weil polynomial
except for the explicitly finite endpoint exceptions. Retain natural positive
dimension and a native finite rational-point set. This target specializes
existing classification and Frobenius results; it does not construct another
Honda–Tate bijection.

(Smith, §5.1 discussion and Proposition 5.12, pp.40–41.)

*Needs:* Abelian Schemes and Arithmetic Moduli, Part II `F3/honda-tate`; §3.5 (polynomial root distribution bridge); `Polynomial.resultant_eq_prod_eval`; Deligne Weights and Purity `DWP.1/weil-estimate-for-abelian-varieties`; Deligne Weights and Purity `DWP.1/point-counts-of-abelian-varieties`.

### 12.2 Optimal simple abelian point-count distributions

For any prime power q > 1 put `Σq=[−2 sqrt(q),2 sqrt(q)]` and
`Fq(x)=log(q+1−x)`. Its capacity is sqrt(q) > 1, and its logarithm argument is
at least `(sqrt(q)−1)² > 0`. For every ε > 0, infinitely many simple
Fq-isogeny classes satisfy
`#A(Fq)^(1/dim A) ≤ exp(cofiniteMean Σq Fq+ε)`, and infinitely many satisfy
`#A(Fq)^(1/dim A) ≥ exp(−cofiniteMean Σq (−Fq)−ε)`. Only finitely many are
below `exp(cofiniteMean Σq Fq−ε)` or above
`exp(−cofiniteMean Σq (−Fq)+ε)`. Apply completeness on the compact interval
for both signs and transfer finite exceptions and infinitude through the real
Weil bridge. Count isogeny classes, not arbitrarily many representatives of
one class. q = 1 fails both strict capacity and positivity and is excluded.

(Smith, Proposition 5.12, pp.40–41.)

*Needs:* §12.1 (real weil polynomials and normalized point counts); §10.3 (completeness of auxiliary-polynomial optimization); §10.1 (cofinite conjugate averages and auxiliary certificates); Abelian Schemes and Arithmetic Moduli, Part II `F3/honda-tate`; Deligne Weights and Purity `DWP.1/weil-estimate-for-abelian-varieties`; Deligne Weights and Purity `DWP.1/point-counts-of-abelian-varieties`.

### 12.3 Square-field asymptotics from the trace constant

For every ε > 0 and all sufficiently large square prime powers q, prove
there are infinitely many simple Fq-isogeny classes with

```text
#A(Fq) ≥ (q+2 sqrt(q)+1−λSSS−ε)^(dim A),
```

and infinitely many with

```text
#A(Fq) ≤ (q−2 sqrt(q)+1+λSSS+ε)^(dim A).
```

Use a compactly supported optimal nonnegative trace law from completeness and
the classical constant identification. Translate it by −2 sqrt(q), or reflect
it and translate by 2 sqrt(q); square q makes these translations integral,
preserving admissibility. For sufficiently large q the translated supports
lie in the Weil interval. Uniform Taylor expansion of the log objective on the
fixed support has O(q⁻²) integrated error; exponentiation gives o(1) at the
point-count scale. This yields both signs. The square condition is used for
integrality, not merely for a convenient real asymptotic parameter.

(Smith, Proposition 5.13, p.41.)

*Needs:* §12.2 (optimal simple abelian point-count distributions); §11.3 (trace constant below 1.89831); §4.2 (arithmetic admissibility); Classical Arithmetic Completion `CA.6`.

### 12.4 Explicit simple abelian point-count constants

For all sufficiently large square prime powers q, infinitely many simple
Fq-isogeny classes satisfy
`#A(Fq) ≥ (q+2 sqrt(q)−0.89831)^(dim A)`, and infinitely many satisfy
`#A(Fq) ≤ (q−2 sqrt(q)+2.89831)^(dim A)`. Choose ε smaller than the strict gap
`1.89831−λSSS` in the asymptotic theorem and increase the q threshold so both
bases are positive. These are explicit consequences of the exact trace witness;
no conclusion for all small q or nonsquare q is claimed.

(Smith, Corollary 1.3, p.3; deduction from Proposition 5.13, p.41.)

*Needs:* §12.3 (square-field asymptotics from the trace constant); §11.3 (trace constant below 1.89831); Abelian Schemes and Arithmetic Moduli, Part II `F3/honda-tate`; Deligne Weights and Purity `DWP.1/weil-estimate-for-abelian-varieties`; Deligne Weights and Purity `DWP.1/point-counts-of-abelian-varieties`.

### Examples

For q=4 the real Weil interval is [−4,4], of capacity two, and
`q+1−x≥1`. If d=2 and Honda–Tate multiplicity e=3, then dim A=6 and
`log #A/6=(log(5−x1)+log(5−x2))/2`; retaining e in only one of the two
formulas would spoil the normalization. At q=1 the interval has capacity one
and the logarithm argument vanishes at its right endpoint, explaining both
excluded hypotheses. For square q, translating a real algebraic integer by
2 sqrt(q) preserves integrality; a general nonsquare shift need not.

### Dependencies

Layers 3–4 and 9–11; Abelian Schemes and Arithmetic Moduli Part II F3/honda-tate; Deligne Weights and Purity DWP.1/weil-estimate-for-abelian-varieties and DWP.1/point-counts-of-abelian-varieties; CA.6 for λSSS.

## Downstream consumers

Arithmetic Algebraization and Holonomy Bounds consumes the complex energy,
capacity, domination and weighted-equilibrium foundation, with its own
holonomy and arithmetic rationality arguments. Classical Arithmetic Completion
CA.6 can consume the same early foundation; its required trace-indexing
extension supplies the classical constant identification to the late trace
results. The early exports and late imports
are kept separate at the coupled boundary.

The real distribution theorem is a reusable interface for conjugate constraints:
provide a supported probability, prove its integer logarithmic moments
nonnegative, and obtain distinct minimal polynomials. Layer 10 turns lower
bounds obtained from finitely many auxiliary integer polynomials into the exact
cofinite optimum. F3 and DWP consumers obtain the normalized point-count
statements through Layer 12 without a second classification or purity theory.

## References

All page numbers below are the printed pages of the identified public versions.
The statements and proof routes above use the singular-log and probability
normalizations fixed here. They retain the absolute polynomial value, finite
mass factor in smoothing, lower semicontinuity of energy, and strictly positive
certificate weights. Survey proof sketches are distinguished from the full
proof obligations stated in the domination and Remez subsections.

- Alexander Smith, *Algebraic integers with conjugates in a prescribed
  distribution*, [arXiv:2111.12660v2](https://arxiv.org/pdf/2111.12660v2),
  16 March 2024, §§1–5, printed pp.1–45. Published in *Annals of Mathematics*
  200 (2024), 71–122, DOI
  [10.4007/annals.2024.200.1.2](https://doi.org/10.4007/annals.2024.200.1.2).
  Locators here refer to v2; the journal text is not treated as an identical
  pagination or collated revision.
- Edward B. Saff, *Logarithmic Potential Theory with Applications to
  Approximation Theory*, *Surveys in Approximation Theory* 5 (2010), 165–200,
  [public survey](https://arxiv.org/pdf/1010.3760), §§1–2 and 6.
- Norman Levenberg, *Ten lectures on weighted pluripotential theory*,
  *Dolomites Research Notes on Approximation* 5 (2012), 1–59,
  [public journal PDF](https://www.maths.tcd.ie/EMIS/journals/DRNA/pdf/levenberg-2012-wpt.pdf),
  §§1–2 and 5. The strict-energy statement and continuous domination form are
  used with the additional proof obligations explained above.
- Jacob S. Christiansen, Barry Simon and Maxim Zinchenko, *Asymptotics of
  Chebyshev Polynomials, I: Subsets of ℝ*, *Inventiones Mathematicae* 208
  (2017), 217–245,
  [author PDF](https://math.caltech.edu/SimonPapers/336.pdf), Theorems 1.1,
  1.4 and 2.2–2.6, §§2 and 4.
- Tamás Erdélyi, *Remez-type inequalities and applications*, *Journal of
  Computational and Applied Mathematics* 47 (1993), 167–209,
  [author PDF](https://people.tamu.edu/~terdelyi/papers-online/JCAM.pdf),
  Theorem 3.1 and Corollary 3.2, p.173.
