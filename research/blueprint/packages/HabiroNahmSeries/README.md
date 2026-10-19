# Roadmap: Nahm series, asymptotics and Habiro integrality

**Summary.** Build the arithmetic of Nahm equations, the radial asymptotics of convergent Nahm sums, and the integrality of the formal collections attached to their signed counterparts. The analytic summit is modularity implying torsion of the distinguished Bloch class. The formal summit is membership in a specified K₃-indexed Habiro module, with its coefficient extension, Frobenius action and excluded orders visible. The two routes meet through Gaussian expansions and cyclic dilogarithms, but have different input data. Explicit cubic and quartic calculations test their normalisations; comparison maps then carry actual Habiro elements to degree-zero Habiro cohomology.

## Scope and ownership

This roadmap owns Nahm-specific equations and arithmetic, convergent sums, controlled radial expansions, the modularity implication, the signed formal series, finite support of their product exponents, and their Gaussian and Habiro membership comparisons. It also owns the explicit examples and the compatibility statements that export these constructions.

The following foundations have other owners. `QSeriesPartitionsAndMockModularForms`, layer QM.0, supplies finite and formal q-Pochhammer symbols, q-binomial identities, Rogers–Ramanujan, Andrews–Gordon, and the convergence criterion for coefficientwise formal products. `K3BlochGroups`, Layers 3–4 and 6, supplies the pre-Bloch and Bloch groups, their integral conventions, the Suslin comparison and certified explicit classes. `Polylogarithms`, Layers 1–2, supplies dilogarithms, functional equations and embedding-wise regulators; `BorelRegulators`, Layer 4, supplies injectivity of the rational regulator. `HabiroNumberFields`, Layers 0–3 of its package (atlas layers HB.1, HB.2, HB.6 and HB.7), supplies finite Chern maps, cyclic dilogarithms, number-field Habiro rings and their K₃-indexed modules. `HabiroRings`, layers HR.1 and HR.5–HR.6, supplies relative Frobenius, the relative Habiro ring, and its cohomological comparison. Local p-adic dilogarithms and their K-theoretic comparison come from `ColemanIntegration`, Layer L2, and `PadicHodgeRegulators`, layers D.1, D.3 and D.4.

Finite-index arithmetic subgroups, rational cusps and strict widths are already available in Mathlib and Tau Ceti. The current `FuchsianOrbifolds` roadmap, Layers 3–5, owns cusp charts, meromorphic descent and extension across a cusp. The current `ModularForms` roadmap owns general-level modular-form geometry. Layer 3 below consumes these constructions and proves only the scalar growth comparisons needed here. It does not construct another modular curve. Gaussian measures, densities and polynomial integrability are also existing objects; `StandardDistributions`, Layers 1 and 5, owns their moment and covariance interfaces. The additions here are the algebraic Wick functional and its comparison with those measures, together with the lattice estimates specific to Nahm sums. Poisson summation for a full-rank ℤ-lattice, with the Gaussian Fourier transform it is applied to, belongs to the `ThetaSeries` roadmap (TauCetiRoadmap pull request #286, Layer 1); §2.4 consumes it and proves only the polynomial-Gaussian lattice estimate. Gauss sums of finite quadratic modules belong to Tau Ceti; §7.5 consumes them.

`ArithmeticQuantumTopology`, Layers 5–6, owns the passage from a triangulation or knot to its topological and Chern–Simons invariants, including presentation independence. A matrix with a knot's name does not establish that passage. Neither quantum modularity nor a knot-invariant theorem is a prerequisite for the formal constructions here. `HabiroCohomologyFoundations`, Layers 5–7 and 9, consumes the exports in Layer 7; higher cohomology, analytic convergence and crystalline or prismatic comparisons remain separate interfaces.

## Conventions

Let the coordinate set be `Fin N`; empty products and determinants are one, and empty sums are zero. An **analytic datum** consists of a symmetric positive definite rational matrix A, a rational vector B and a rational number C. Put

```text
Q(n) = ½ nᵀAn + B·n + C,
e(s) = exp(2πis),       q = e(τ),       Im τ > 0.
```

Every rational power q^r in an analytic sum means e(rτ). It need not be a single-valued function of q. A **formal datum** is only a symmetric integral matrix A. Negative entries and singular matrices are allowed. Its coefficient field is ℚ(q), with q an indeterminate, and its augmentation variables are t₁,…,t_N. Formal assertions never acquire positivity assumptions merely to imitate an analytic integral.

Unsigned analytic equations are `1−x_i = ∏_j x_j^(A_ij)` on the open real cube. Their rational powers are positive real powers. Signed equations use units and integral powers, with sign `ε_i`; the formal convention is `ε_i=(−1)^(A_ii)`. For A=(3), these give respectively `x³+x−1=0` and `z³−z+1=0`, with field discriminants −31 and −23. The distinction persists throughout.

For a primitive root ζ=e(a/m), radial analytic expansions use `q=ζ exp(−ε/m)`, ε→0⁺. Formal expansions use `q=ζ+x=ζ exp(h)`, `h=log(1+x/ζ)`. Thus `h=−ε/m` on the radial path. Asymptotic series are interpreted additively: after removing the dominant exponential, truncation before degree K has error O(ε^K). This remains meaningful when every displayed coefficient vanishes. A normalised Gaussian bracket has value one on the constant polynomial; its covariance is the inverse of its stated quadratic matrix.

Write `B_CGZ(F)` for the integral exterior-square convention furnished by the Bloch-group owner, and distinguish it from the antisymmetric-tensor convention before discarding 2-torsion. For rational A the distinguished class is a rationalised class over F=ℚ(x); an integral class over F requires multiplication by a denominator. A coherent root field may carry an unmultiplied integral class. No operation of reducing `B(F)⊗ℚ` modulo n is used: that quotient is zero and cannot detect torsion.

For a number field K choose a nonzero positive integer Δ divisible by 6, the field discriminant, all denominators of the chosen coordinates and discriminant, and the exceptional primes required by the finite-Chern comparison. Put `R=𝒪_K[1/Δ]`. Require each z_i, 1−z_i and δ to be a unit. The square-root coefficient algebra is the full algebra

```text
B = R[T]/(δT²−1).
```

It may be a product, rather than a field. Its involution sends T to −T. A chosen component, embedding or formal branch is additional data. A theorem over B must hold on every component. The notation `H_{B,ξ}|_Δ` restricts orders to those prime to Δ; it does not silently extend the collection to all orders.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use `Matrix.PosDef`, its Hermitian condition and `Matrix.PosDef.add_posSemidef`, positive definite diagonal matrices, and `Matrix.det`. In finite dimension `Matrix.posDef_iff_dotProduct_mulVec` identifies the matrix predicate with the strictly positive quadratic form. Use these actual carriers for analytic data and Hessians. The generated fields are `IntermediateField.adjoin`; `IntermediateField.fg_adjoin_of_finite` and `IntermediateField.essFiniteType_iff` give essential finite type for finitely generated coordinate fields. The differential argument consumes `KaehlerDifferential.D`, `KaehlerDifferential.span_range_derivation`, and `Algebra.FormallyUnramified.finite_of_free` under its essential-finite-type and formal-unramified hypotheses. Module finiteness over a field then gives algebraicity. A finite transcendence basis is not assumed to consist of the original coordinates.

Use `MvPolynomial`, its partial derivatives and `MvPolynomial.aeval`; `MvPowerSeries`, its coefficient maps and `MvPowerSeries.rescale`; `PowerSeries`, Laurent series, `RatFunc`, Laurent polynomials, cyclotomic polynomials and Möbius inversion. The multivariate logarithm and plethystic transform needed below are new augmentation-complete operations, not already supplied merely by the existence of one-variable `PowerSeries.log`.

For convergence use the generic summability and infinite-product APIs and the existing Euler function. `ModularForm.eta`, `ModularForm.multipliableLocallyUniformlyOn_eta` and `ModularForm.eta_ne_zero` provide the Euler-product bridge on the upper half-plane. Lattice sums of polynomial-Gaussian functions consume Poisson summation for a full-rank ℤ-lattice in a real inner product space, stated for Schwartz functions in Layer 1 of the `ThetaSeries` roadmap (TauCetiRoadmap pull request #286). For the coordinate lattice hℤ^N the same identity also follows from Mathlib's one-dimensional `SchwartzMap.tsum_eq_tsum_fourier`, iterated over coordinates after a justified Fubini argument. No arbitrary smooth decaying function is asserted to have an exponentially decaying Fourier transform; polynomial times Gaussian functions have the required stronger property.

`Subgroup.isArithmetic_iff_finiteIndex` applies to Γ≤SL₂(ℤ) without a congruence hypothesis. Use Mathlib `IsCusp`, `isCusp_SL2Z_iff`, `OnePoint.exists_mem_SL2`, `CuspOrbits`, and `Subgroup.strictWidthInfty`. Tau Ceti's `TauCeti.ModularForm.cuspTranslationOrbitWidth`, in `NumberTheory/ModularForms/Norm/Cusps`, is the strict T-orbit period and has a representative formula and divisibility characterisation. When −I is absent this may be twice the projective width. Weight-zero invariant functions factor through the group with −I adjoined, and that choice must be made before calling the width the local parameter's period. Use Mathlib `MeromorphicOn` and `meromorphicOrderAt` for scalar functions, not the holomorphic `ModularForm` carrier as a carrier for meromorphic functions.

Use Mathlib's multivariate Gaussian carrier, Tau Ceti's `TauCeti.multivariateGaussianPDFReal` and `TauCeti.multivariateGaussian_eq_withDensity` in `Probability/Distributions/Gaussian/Density`, and `TauCeti.integrable_pow_gaussianReal` and `TauCeti.integrable_eval_mul_gaussianEnvelope` in `Probability/Distributions/Gaussian/PolynomialMemLp`. The latter envelope theorem requires nonzero variance; the multivariate density theorem requires a positive definite covariance matrix. Consume `StandardDistributions` Layer 1's even central moments and vanishing odd moments and Layer 5's covariance and affine-map theorems. The Wick comparison must identify its covariance with those existing objects; it does not re-found probability theory. Finally, use the structure theorem for finitely generated abelian groups for the divisibility argument in Layer 4. For the quadratic Gauss evaluations of §7.5 use the current Tau Ceti library's `TauCeti.FiniteQuadraticModule.gaussSum` with `IsNondegenerate.gaussSum_mul_conj` (|G|²=#A for a nondegenerate module) and `gaussSum_eq_card_mul_gaussSum_quotientOfLeQuadraticRadical` (G=#K·G(q/K) for K in the quadratic radical), in `LinearAlgebra/FiniteBilinearModule/GaussSum`; these postdate the pinned Tau Ceti commit.

### From the arithmetic and q-series roadmaps

From `K3BlochGroups` Layer 3 require the actual group, boundary and relation subgroup, with the exterior-square CGZ quotient formed by intersecting the projective five-term relations with the boundary kernel. From Layers 4 and 6 require rational comparison with indecomposable K₃, restriction under field extensions, integral convention changes with their 2- and 6-primary errors, and explicit boundary and relation certificates. From `Polylogarithms` Layers 1–2 and `BorelRegulators` Layer 4 require the Bloch–Wigner regulator on all complex embeddings, compatibility with those convention changes, and injectivity modulo torsion. The Rogers convention used here is the complementary one:

```text
L_CGZ(x) = π²/6 − Li₂(x) − ½ log(x)log(1−x),   0<x<1.
```

Its endpoint extensions, circle-valued five-term identity and the trigonometric sum used by Andrews–Gordon are supplier targets of `Polylogarithms` Layer 1, with this convention specified. A real-valued expression cannot be divided by a rational denominator in a circle-valued target without an additional lift.

From `HabiroNumberFields` Layer 0 require a good-order integer `M_K=6|disc K|·|K₂(𝒪_K)|`, or the precisely equivalent exceptional integer furnished there, and an injective finite Chern map on integral K₃/Bloch classes modulo n when n is prime to M_K. Keep any roots-of-unity restriction in its statement. Its Layer 1 supplies the cyclic product

```text
D_ζ(w) = ∏_{r=1}^{m−1}(1−ζ^r w)^r,
D_ζ(ζw)/D_ζ(w) = (1−w)^m/(1−w^m),
```

its distribution and root-change identities, the cyclic five-term relation and its comparison with finite Chern classes. The fractional-power product sometimes also denoted D is `D_ζ(w)^(1/m)` with specified factor logarithms. These two meanings must not be interchanged. The Kashaev–Mangazeev–Stroganov identity remains with that owner; its analytic proof can consume Layer 2 below without making the identity a prerequisite for that layer.

From `QSeriesPartitionsAndMockModularForms` layer QM.0 consume `(w;q)_n`, `(w;q)_∞` as formal series, q-binomial and q-Lucas identities, Euler's two series, Rogers–Ramanujan and general Andrews–Gordon in their Nahm-matrix form. From layer QM.1 consume the eta transformation law with its Dedekind multiplier system and the theta-quotient form of the Rogers–Ramanujan functions; §2.2, §4.3 and §§2.7, 7.5 use them for the radial phase, the bounded multiplier and the modular examples. The analytic evaluation comparison, uniform logarithmic remainders and saddle analysis are local additions here. General quiver or Donaldson–Thomas theory is not a prerequisite for the elementary finite-support proof.

### From the Habiro and p-adic roadmaps

From `HabiroNumberFields` Layers 2–3 require Taylor maps at roots of unity, Frobenius-twisted p-adic gluing, restriction to good orders, local principal modules with their regulator exponential, multiplication, inversion of q, and the tensor isomorphism `H_ξ⊗H_η≃H_{ξ+η}`. Require finite étale scalar extension to B and its full p-completion, including all components. This extension is a supplier target if not yet established; replacing B by a preferred square root is not a substitute. The local generator criterion must impose integrality of its linear coefficient as well as its constant unit. Constant terms can cancel in sums of local generators, so an arbitrary module element need not be a generator.

From `HabiroRings` layer HR.1 require the unique Frobenius lift on p-complete étale algebras, functorial under base change. From Layers 5–6 require the number-field comparison `κ_R:H_R≃H_{R/ℤ}` and the equivalence `d_R:qHdg_{R/ℤ}≃H_{R/ℤ}` for étale R, compatible with Taylor expansions, Frobenius and completion at q=1. These are ℤ[q]-algebra comparisons; arithmetic Frobenius prevents treating the entire collection of constant coefficients as an untwisted R-algebra. Wagner, Corollaries 2.13 and 3.13, printed pp. 33 and 41, supplies the mathematical comparison.

From `ColemanIntegration` Layer L2 and `PadicHodgeRegulators` layers D.1, D.3 and D.4 require Coleman Li₂, the Iwasawa logarithm with log(−1)=0, its reflection and distribution identities, integral modified polylogarithms, and their comparison with the local K₃ regulator D_p. In particular the convention must give `Li₂(z)+Li₂(1−z)=−log z log(1−z)` and the sign in Layer 6. These are local regulator inputs. No global p-adic Hodge comparison or higher cohomology theorem is used to prove membership of a scalar Nahm collection.

## How to read the build

Layer 1 builds the equations, fields and classes. Layer 2 supplies analytic radial expansions, distinguishing the analytic estimate from its arithmetic descent. Layer 3 isolates the small amount of cusp analysis needed by Layer 4, which proves modularity implies torsion. Layer 5 starts independently from an integral symmetric matrix and constructs admissible formal series and Gaussian comparisons. Layer 6 proves their Frobenius and Habiro membership assertions, including the full coefficient-algebra and gluing requirements. Layer 7 computes examples and states exact exports. A named comparison with an additional arithmetic or small-prime hypothesis is used only with that hypothesis; neither finite coefficient checks nor a formal branch are replacements for it.

## Layer 1: Nahm equations, fields and Bloch classes

### 1.1 Analytic and formal data

Define `NahmDatum`, `FormalNahmDatum` and `quadraticExponent` by the conventions above. Supply extensionality by matrix, vector and constant entries, simultaneous permutation of coordinates, and block-diagonal sum. A positive definite formal matrix gives an analytic datum with B=C=0; the map is injective on such matrices, and there is no coercion for a singular formal matrix. This is the input distinction of CGZ §7.1, pp. 34–35, GZ §3, pp. 4–5, and GSWZ §1.6, pp. 11–12. *Needs:* Mathlib matrices and positive definiteness.

Define `IsDenominator Q d` by `d>0` and `dQ(ℤ^N)⊂ℤ`. Define `IsStrongDenominator Q D` by `D>0` and invariance of Q modulo ℤ under coordinatewise congruence modulo D. Prove existence, stability under positive multiples and `isStrongDenominator_two_mul`: 2d is strong when d is a denominator. The constant C does not affect the strong-period condition. The Gauss-sum construction later additionally requires D to be divisible by a denominator, since it reduces rational numbers modulo D. A strong period alone does not imply this divisibility (GZ §3, before (16), p. 5). These predicates have membership, multiple, permutation and block-sum APIs.

**Checks.**

- `rogersRamanujanExponent` computes `60Q(n)=60n²−1` for A=2, B=0, C=−1/60; the second datum has `60Q(n)=60n²+60n+11`. Changing C changes the series.
- `singularFormalDatum` accepts the 2×2 all-ones matrix as formal data and rejects it as analytic data: the vector (1,−1) has quadratic value zero.
- `rationalAnalyticDatum` accepts A=(3/2) and `A=((3/2,1/2),(1/2,3/2))`, whose eigenvalues are 1 and 2, and does not identify either with an integral formal datum.
- `strongPeriodNotDenominator` uses Q(n)=n²/4. Its least denominator is 4, while `Q(n+2)−Q(n)=n+1`, so 2 is strong. This rejects a Gauss-sum reduction justified only by strong periodicity.
- `denominatorControls` accepts d=4 and rejects d=2 for Q=n²/4, rejects d=0 for every Q, and accepts both d=1 and d=2 for Q=n². For the strong-period predicate Q=n/2 has period 2 and not 1; D=0 is excluded even for a constant.
- `emptyExponent` gives Q=C in rank zero: C=3/2 has denominator 2, while C=1/2 admits strong period 1. Thus a strong period need not clear the constant.
- `nonsymmetricFormalRejected`: the integral matrix ((0,1),(0,0)) is not formal data. Symmetry fails, and at n=(1,1) the numerator nᵀAn+diag(A)·n equals 1, so the formal exponent of §5.2 would not be an integer.

### 1.2 Equations, solutions and the discriminant

Define `NahmEq A x` on the open real cube and `SignedNahmEq A ε z` on `(Rˣ)^N` for a commutative ring R. The latter is the equality `1−z_i=ε_i∏z_j^(A_ij)` in R, with ε_i∈{1,−1}; an arbitrary unit vector is harmless for the functorial predicate, while assertions about the formal convention specialise it to `(−1)^(A_ii)`. Prove `NahmEq.perm`, `SignedNahmEq.map`, identity and composition laws, and agreement with positive real integer powers when ε=1. Even diagonal entries make the formal and unsigned systems agree. Unit coordinates force 1−z_i to be a unit. Negative exponents are legitimate only on units (CGZ (41), p. 35; GSWZ (34), (41), pp. 13–14).

For a signed solution define `nahmDiscriminant` by

```text
δ_A(z) = (∏_j z_j^(−A_jj)) det(diag(1−z) A + diag(z)).
```

Over a field this formula defines `nahmDiscriminant` on arbitrary coordinate tuples using totalised integer powers; its arithmetic uses require units. Over a commutative ring use the inverses of the given unit coordinates for the corresponding ring-valued discriminant. Define `NondegenerateNahmSolution` to bundle the solution and the assertion that δ is a unit, or nonzero over a field. Supply the coordinate ring obtained by adjoining z_i and their inverses and inverting δ, its evaluation homomorphism at each solution, base change, and compatibility with coordinate permutations. The square-root extension belongs to Layer 6. Prove that δ differs from the Laurent Jacobian determinant by an explicit product of units; this is the nondegeneracy criterion, not an assumption that an algebraic zero is automatically simple (GSWZ (36), p. 13, and the hypotheses before Theorem 5, p. 14).

For real positive definite A prove `existsUnique_nahmEq`. One route minimises
`½sᵀAs+∑Li₂(exp(−s_i))` on the closed positive orthant. It is coercive; the inward derivative at a zero coordinate is −∞, so a minimum is interior. Its Hessian `A+diag(1/(exp(s_i)−1))` is positive definite, and strict convexity gives uniqueness. Establish the required multivariate strict-convexity consequence on this convex domain rather than citing an unavailable generic Hessian theorem. At the solution set `H=A+diag(x/(1−x))`; prove H positive definite and det H>0 (Vlasenko–Zwegers, Lemma 2.1, p. 2; CGZ §7.1(ii), pp. 35–36). Existence is valid for real A; only algebraicity requires rational entries.

**Checks.**

- `goldenSolution` has A=2 and x=(√5−1)/2, with `1−x=x²` and 0<x<1. At A=1 the unsigned solution is 1/2.
- `signedCubicConvention` compares the two cubics for A=3. Over 𝔽₅ the unsigned A=2 equation has the unit root 2, whereas the signed A=3 equation has the unit root 3. Neither statement identifies their characteristic-zero fields.
- `boundaryRejected` rejects x_i=0 or 1 in `NahmEq`. The signed equation at A=1 and t=1 has no solution over a nonzero ring; its formal deformation does have a solution near t=0.
- `cubicDiscriminant` gives `δ=z^(−3)(3−2z)` for A=3. For the 2×2 all-ones matrix and z₁=z₂=z it gives `(2−z)/z`.
- `emptySolution` gives the unique empty tuple, H of size zero, determinant one and δ=1. Thus positivity of the critical value later requires N>0.
- `finiteCharacteristicDegeneracy` at A=2,z=2 over 𝔽₅ satisfies the equation but has δ=z⁻²(2−z)=0. Thus an algebraic solution need not be nondegenerate, especially after reduction.
- `degenerateFibre` for the deformed A=3 equation has t=4/27, z=3/2 and δ=0. It must disappear after δ is inverted.
- `goldenNondegenerate`: at A=2 and the golden solution, δ=x^(−2)(2−x)=(5+√5)/2≠0, so `NondegenerateNahmSolution` accepts the distinguished solution, while it rejects the two preceding degenerate data.

### 1.3 Clearing powers and proving algebraicity

Let d>0, `M=dA` integral and ε a rational sign vector. Define the polynomial system `clearingPolynomial` in variables Y by

```text
P_i(Y) = (1−Y_i^d) ∏_j Y_j^max(−M_ij,0)
                         − ε_i ∏_j Y_j^max(M_ij,0).
```

For unit y set x_i=y_i^d. Prove `clearingPolynomial_zero_iff` with the coherent-power equations, its base-change law, and invariance under increasing a compatible denominator with coherently chosen roots. The polynomial zero locus can have extra points on coordinate hyperplanes; the equivalence is on the torus, not on the entire affine space. At a zero with x_i and 1−x_i nonzero put

```text
c_i = (1−x_i)∏_j y_j^max(−M_ij,0),
B_d = M + d diag(x_i/(1−x_i)).
J = −diag(c) B_d diag(y_i^(−1)),
det J = (−1)^N (∏c_i)(∏y_i^(−1)) det B_d.
```

Prove `clearedJacobian` including this determinant sign. At a positive real solution `B_d=dH`, so it is invertible. This gives the precise polynomial system behind the algebraicity assertion (Zagier, *The Dilogarithm Function*, II.3A, (3.3), p. 43; GSWZ (36), p. 13). *Needs:* §1.2, polynomial differentiation, and matrices.

Prove `coordinateField_differential_bridge` over any field k. Let L=k(y₁,…,y_N), let N polynomials over k vanish at y, and assume their evaluated square Jacobian is invertible. Differentiation kills all dy_i, and these differentials generate Ω_{L/k}; hence Ω_{L/k}=0. The field is essentially of finite type and free as a k-module, so the pinned unramified-finiteness theorem gives `[L:k]<∞`. State also `nondegenerate_zero_isAlgebraic` for rational polynomial systems in ℂ and `nondegenerate_coordinateField_finite`. The theorem does not need a global zero-dimensionality hypothesis on every component (CGZ §7.1(i), p. 35; Stacks Project, Lemma 10.148.3, tag 00UO, for Ω=0 iff formal unramifiedness, followed by the pinned `Algebra.FormallyUnramified.finite_of_free`).

For the positive solution choose `positiveRootLift_d(x)_i=x_i^(1/d)>0`. Prove its d-th power, uniqueness among positive lifts, and compatibility under multiplying denominators. Define `nahmField=ℚ(x_i)` and `coherentNahmField=ℚ(y_i)` as generated intermediate fields in ℂ. Prove finite-dimensionality of the latter by the cleared Jacobian, inclusion of the former, and algebraicity of every x_i. Field embeddings preserve the integer-power relations y_i^d=x_i; they do not in general send y_i to a newly chosen principal root of the embedded x_i (CGZ after (42), p. 36; Zagier II.3A, p. 43).

**Checks.**

- `clearingPositiveExponent` at d=1, M=2 gives `1−Y−Y²`; at M=−1 it gives `(1−Y)Y−1`. Clearing only the positive exponents fails the second test.
- `clearingRequiresPositiveD` rejects d=0; the displayed expression then becomes a different constant/monomial relation and encodes no root lift.
- `torusRestriction` uses a matrix with diagonal −1 and off-diagonal 1: the origin can solve cleared equations but cannot be a Laurent solution. Unit localisation is essential.
- `jacobianRankOne` gives `P′(y)=−c(dA+d x/(1−x))/y`; at d=1, A=2 this reduces to −1−2y at a root. The sign (−1)^N is visible.
- `rationalRootLift` at A=1/2 has `x=(3−√5)/2` and `y=(√5−1)/2`, satisfying y²=x and `1−x=y`. Replacing y by −y violates the chosen coherent equation.
- `coordinateFieldEmpty` gives L=k and Ω=0 in rank zero. A single repeated polynomial with a singular Jacobian is outside the theorem even if its zero is algebraic.
- `positiveRootLiftChecks`: at d=1 the lift is x itself. For x=1/4 and d=2 it is 1/2; the root −1/2 also squares to 1/4 and is rejected by positivity. For x=1/16 the d=4 lift 1/2 squares to the d=2 lift 1/4, as compatibility under multiplying denominators requires.

### 1.4 Boundary calculations and integral conventions

For integral symmetric A and an unsigned solution in a field F, form the pre-Bloch sum `∑[x_i]`. In the exterior-square convention its boundary vanishes: `∑_{i,j}A_ij x_i∧x_j=0`. For rational A with dA integral, define the integral class `c_d=d∑[x_i]` and the rationalised class `ξ_A=c_d/d∈B_CGZ(F)⊗ℚ`; prove independence of d and compatibility with field extensions. Over the coherent field E with y_i^d=x_i, symmetry and the coherent equations give an unmultiplied integral class `β=∑[x_i]`. Prove that restriction sends c_d to dβ. These are distinct statements over F and E, not an assertion that a rational exponent is an exponent in Fˣ (CGZ §7.1(i), p. 35; Zagier II.3A, p. 43).

For the formal signed convention calculate instead

```text
∂(∑[z_i]) = ∑_i A_ii z_i ∧ (−1).
```

This boundary is killed by 2. Name `signedNahm_class_after_two` for the resulting doubled integral class and its rational class. An unmultiplied class in the chosen integral convention requires the supplier's additional lift or convention comparison; it is not furnished by symmetry alone. In the antisymmetric-tensor convention even the unsigned boundary can retain the diagonal term `y⊗y`, `y=∏x_i^(A_ii)`, which is 2-primary. Even diagonal entries are a sufficient condition for this obstruction to vanish. Supply explicit maps between the convention-specific classes and record their bounded-primary errors (CGZ Definition 2.1 and Lemma 2.2, pp. 8–9; GSWZ after (41), p. 14, read with this boundary calculation). *Needs:* the Bloch-group supplier contracts, not a second construction of their relation subgroup.

Define `nahmIntegralModel` by adjoining the solution coordinates and inverses and inverting the exact δ and arithmetic denominators. Its API includes evaluation, minimality among rings containing these elements, localisation in a larger Δ, and transport of the class under base change. A K₃ index for membership is an explicitly supplied lift compatible with the Bloch class. A rational class alone does not choose such a lift (GSWZ (35), (40)–(42), pp. 13–14; K3BlochGroups Layers 4 and 6).

**Checks.**

- `unsignedGoldenBoundary` for A=2 has `x∧x²=0`; its class is in the exterior-square kernel without multiplying by d.
- `coherentRationalBoundary` checks A=1/2 with the positive lift above. The relation is `1−x=y`, x=y²; the boundary vanishes over E using `y²∧y=0`, and the restriction identity is `res(c₂)=2β`.
- `signedCubicBoundary` at A=3 leaves `z∧(−1)` before multiplication by 2. No unmultiplied integral-class assertion is inferred from the symmetric 1×1 matrix.
- `evenDiagonalBoundary` for `A=((8,5),(5,4))` has no signed contribution; this is the quartic example's convenient convention, but does not canonically choose a K₃ lift.
- `conventionTwoTorsion` retains the diagonal self-tensor in the antisymmetric quotient. Replacing that quotient by the exterior square before the comparison would erase the test.
- `integralModelNonunit` excludes a localisation where δ has a nonunit image; adjoining a formal symbol δ⁻¹ does not define an evaluation there.

### 1.5 Embeddings and regulators

Define `nahmEmbeddingRegulator` on every complex embedding σ:F→ℂ by the Bloch–Wigner value `∑D(σx_i)`, with the factor d for c_d and its rational normalisation for ξ_A. Prove compatibility with restriction to E, complex conjugation, permutations, and the supplied K₃ regulator. The distinguished real embedding has value zero, while nonreal embeddings can have nonzero values. With the rational Borel comparison prove `nahmClass_torsion_iff_regulators_zero` for integral classes and `nahmClass_zero_iff_regulators_zero` after tensoring with ℚ. It is essential to quantify over all embeddings (CGZ §7.1(i), p. 35; Polylogarithms Layer 2; BorelRegulators Layer 4).

State `nahmClass_qbar_vanishing`: the distinguished rational class vanishes after extension to the algebraic closure exactly when it vanishes over F, using rational restriction injectivity. The uniquely divisible Bloch group of the algebraic closure has no torsion, but this fact alone is not the injectivity argument. For integral classes, torsion is equivalent to vanishing after this comparison with the bounded-primary conventions correctly related (CGZ §1.3, p. 6).

The real regulator used in the analytic critical value is `Λ=∑L_CGZ(x_i)`. Prove `L_CGZ(0)=π²/6`, `L_CGZ(1)=0` and the specified extension `L_CGZ(∞)=−π²/6`; relate it to the owner's standard increasing Rogers function. Its circle-valued version is applied to integral classes only, unless a compatible rational lift has been supplied. Prove `nahmRogersValue_rat_of_torsion`: for an integral class of order dividing r>0, rΛ lies in `(π²/2)ℤ`, hence Λ/π² is rational. A rational Rogers value alone is not a certificate of torsion (CGZ (42), p. 36; Zagier II.1A, pp. 23–24).

**Checks.**

- `rogersGoldenValue` gives `L_CGZ((√5−1)/2)=π²/15`; the increasing convention gives π²/10. Their sum is π²/6.
- `allEmbeddingsMatter` uses the unsigned cubic `x³+x−1=0`. Its real embedding has Bloch–Wigner value zero; the conjugate nonreal embeddings give opposite nonzero values, approximately ±0.79158. A real-only torsion test fails.
- `conjugateRegulators` changes the sign of D, while the rational Rogers expression at the distinguished positive root is real and positive. These are different regulator coordinates.
- `emptyRegulator` has Λ=0 and zero class in rank zero. `Λ>0` is asserted only for N>0.

### Examples

The two rank-one analytic data with A=2 lead to the same positive critical point and Λ, but have different B,C and therefore different first radial coefficients. The formal A=3 datum leads to the signed cubic of discriminant −23; applying the unsigned analytic equation to that matrix would instead produce the field of discriminant −31. The coherent-root example at A=1/2 shows why the coefficient field of an analytic expansion can be larger than the field generated by x.

### Dependencies

Mathlib finite-dimensional linear algebra, real powers, polynomial differentiation, generated fields, Kähler differentials and unramified finiteness; QSeriesPartitionsAndMockModularForms layer QM.0; K3BlochGroups Layers 3–4 and 6; Polylogarithms Layers 1–2; BorelRegulators Layer 4. The signed K₃ index additionally uses HabiroNumberFields Layer 0's integral convention comparison. No later layer is needed for the existence or algebraicity of a positive solution.

## Layer 2: convergent sums and radial expansions

### 2.1 Analytic evaluation and the branch of the sum

Compare the q-series owner's finite symbols with the literal products
`(w;q)_n=∏_{r=0}^{n−1}(1−wq^r)` and `(q)_n=(q;q)_n`. For |q|<1 prove that the infinite product `(w;q)_∞` converges locally uniformly for bounded w and |q|≤ρ<1. It is nonzero exactly when none of its factors is zero. On the zero-free domain identify the logarithm obtained by summing factor logarithms; state its domain and branch explicitly. Supply the recurrence in n, the infinite/finite quotient identity, analytic evaluation of the formal identities where both sides converge, and logarithmic differentiation on compact zero-free sets (GSWZ §2.1, (46), (59)–(60), pp. 18–19; GZ Lemma 2.1, p. 3). These are analytic comparison targets, not new definitions of the owner's finite symbols.

Define `nahmSummand` and `analyticNahmSum` by

```text
f_{A,B,C}(τ) = ∑_{n∈ℕ^N} exp(2πiτQ(n))/∏_i(q)_{n_i}.
```

Prove `nahmSummand_summable`, normal convergence on compact subsets of the upper half-plane, and `analyticNahmSum_holomorphic`. Positive definiteness dominates the linear term and the denominator products on each compact set. Prove `analyticNahmSum_constantShift`:
`f_{A,B,C}(τ)=e(Cτ)f_{A,B,0}(τ)`. A denominator gives a convergent Laurent–Puiseux expansion on a finite cover of the punctured disc; it need not descend to an ordinary function of q (GZ (12), p. 4; CGZ (40), pp. 34–35). Permutation, block-product and direct-sum APIs should identify both the summand and the sum, with convergence justifying rearrangement.

**Checks.**

- `pochhammerZeroAndOne` gives `(0;q)_∞=1` and `(1;q)_∞=0`. The latter is not a zero-free logarithm input.
- `pochhammerFirstFactors` gives `(w;q)_2=(1−w)(1−qw)` and `(q)_0=1`; replacing the starting index by one changes the first formula.
- `puiseuxBranch` at C=1/2 changes the rank-zero sum by −1 when τ is replaced by τ+1, although q is unchanged.
- `emptyAnalyticSum` is exactly e(Cτ), and equals one only when C=0. In particular the constant shift cannot be omitted in rank zero.
- `analyticNeedsPositiveDefiniteness` rejects applying the convergence theorem to the singular figure-eight matrix merely because its formal series exists.

### 2.2 Bernoulli remainders and the Euler factor

Establish `shiftedEulerMaclaurin_remainder`: for J≥2, M≥0 an integer, a∈ℝ, θ∈[0,1], and a complex-valued C^J function f on [a,a+M],

```text
∑_{k=0}^{M−1}f(a+k+θ)
 =∫_a^(a+M)f(s)ds
  +∑_{r=1}^J B_r(θ)/r! ·(f^(r−1)(a+M)−f^(r−1)(a)) + R_J,
|R_J|≤(sup_{v∈[0,1]}|B_J(v)|/J!)∫_a^(a+M)|f^(J)(s)|ds.
```

The bound is uniform in θ; the endpoint value B₁(0)=−1/2 gives left-endpoint sampling, while B₁(1)=1/2 gives right-endpoint sampling. Scale the interval for a nonunit mesh before applying it to the logarithmic product. Apply it to logarithms only on a compact zero-free domain. An asymptotic formal substitution is not a replacement for this estimate (GZ §4.1, pp. 6–7; Vlasenko–Zwegers, Lemma 2.2 and (2.3)–(2.4), pp. 2–3).

For m≥1, ζ primitive of order m, |w|≤ρ<1 and real ν satisfying
`|ν|ε/m≤−log(ρ)/2`, define the factor-log remainder `pochhammerRadialPsi` by

```text
log(qw exp(−νε/m);q)_∞
 = −Li₂(w^m)/(mε) − (ν/m−½)log(1−w^m)
   − ε ν² w^m/(2m(1−w^m))
   − (1/m)log D_ζ(w) − log(1−w) + ψ_{w,ζ}(ν,ε),
q = ζ exp(−ε/m).
```

Here `log D_ζ` is the weighted sum of the individual factor logarithms. Its expansion is

```text
ψ_{w,ζ}(ν,ε) ∼ −∑_{r≥2} ε^(r−1)/r!
  ∑_{a=1}^m [B_r(1−(a+ν)/m)−1_{r=2}ν²/m²] Li_{2−r}(ζ^a w).
```

Prove `compactPochhammerRemainder`: truncating the Bernoulli expansion through r=J≥1 gives an absolute remainder at most
`C_{J,ρ,m} ε^(−1)[ε(1+|ν|)]^(J+1)` for sufficiently small ε. The displacement guard prevents a shifted factor from crossing zero. The API includes the w=0 value, the polynomial dependence on ν of every coefficient, compatibility with cyclic root shifts, and a complex-shift version on compact zero-free sets. The radial theorem uses only the real-shift version (GZ Lemma 2.1, (4)–(5), p. 3, proof §4.1; Vlasenko–Zwegers Lemma 2.2, pp. 2–3).

Define the Dedekind phase without an ambiguous root choice:

```text
χ_{a,m} = m^(−1/2) exp((1/m)∑_{r=1}^{m−1}r Log(1−ζ^r))
        = exp(πi s(a,m)),
s(a,m) = ∑_{r=1}^{m−1} ((r/m)) ((ar/m)).
```

The sawtooth is x−⌊x⌋−1/2 off integers and zero at integers. Prove its modulus is one and the Euler-product expansion

```text
(q;q)_∞ ∼ χ_{a,m}^(−1) (2π/ε)^(1/2)
              exp(−π²/(6mε)+ε/(24m)).
```

After this exponential and square root are removed, the remaining error is flat to every order. The phase is fixed by the factor logs, including m=1. GZ (23), p. 7, gives the m=1 calculation; the general phase follows by the root-of-unity splitting and the eta multiplier of QSeriesPartitionsAndMockModularForms layer QM.1, as in CGZ (48)–(49), p. 38. The often used printed phase `ν_{a,m}=e(N(m−1)(m−2)a/(24m))` need not equal `χ_{a,m}^N`. Any series normalised with ν must be multiplied by `ν/χ^N` before using the normalisation below.

**Checks.**

- `eulerMaclaurinLinear` at a=0,M=1,f(s)=s gives θ exactly: the integral is 1/2 and the B₁ correction is θ−1/2. For a constant f all derivative corrections vanish; at M=0 every term is zero. The left/right endpoint tests θ=0,1 reject a wrong B₁ sign.
- `radialPsiZero` at w=0 is identically zero. At m=1 the cyclic product is the empty product one.
- `shiftGuard` with positive w and ν sufficiently negative can force a factor to vanish. A bound such as `|ν|ε≤1` without a relation to w is insufficient.
- `saddleDisplacement` at `ν=x/√ε`, `|x|≤ε^(−1/12)`, gives `ε(1+|ν|)=O(ε^(5/12))`, allowing arbitrarily accurate truncation.
- `etaFirstJet` at m=1 has inverse Euler factor `exp(−ε/24)` after the dominant exponential and square root; a missing 1/24 changes the first Nahm coefficient.
- `dedekindPhaseWitness` at a=1,m=3 gives χ=exp(πi/18). At a=2,m=5 the Dedekind sum is zero, so χ=1, whereas `e((m−1)(m−2)a/(24m))=e(1/5)`. This separates the two phase conventions.

### 2.3 The saddle, local expansion and global tails

Let x be the positive solution, write `s_i=−log x_i`, `θ_i=x_i^(1/m)>0`, `H=A+diag(x/(1−x))` and `Λ=∑L_CGZ(x_i)`. The solution and positive determinant branch come from Layer 1. In a residue class n≡k mod m use
`n_i=s_i/ε+v_i/√ε`. Derive `nahmSummand_saddleExpansion` by expanding Q and the finite/infinite product quotient. The Gaussian is
`exp(−vᵀHv/(2m))`, the linear B term is `−(B·v)√ε/m`, and the Euler contribution is `−Nε/(24m)`. If C is retained the scalar exponent is `−Cε/m`. The remaining exponential is therefore

```text
R_k(v,t) = exp(−(B·v)t/m − (C+N/24)t²/m
                   +∑_i ψ_{ζ^{k_i}θ_i,ζ}(v_i/t,t²)),  t=√ε.
```

Its coefficient `P_{k,p}(v)` has degree at most 3p and parity p; `P_{k,0}=1`. Prove `uniformLocalSaddleRemainder`: for every requested K, choose enough Bernoulli and exponential terms so that, on `max|v_i|≤ε^(−1/12)`, the error multiplied by the Gaussian is bounded by `C_K ε^K(1+|v|^M)e^(−c|v|²)`, with the lattice-scaled absolute sum O(ε^K). For example one can choose Bernoulli depth 12(K+1) and exponential depth 4(K+1), increasing them if a later differentiation requires it. Odd polynomial terms integrate to zero. These targets correct the B sign, the Gaussian factor 1/2 and the Euler term in the printed GZ Proposition 2.2, (10)–(11), p. 4; the proof route is §4.2, p. 7, and Vlasenko–Zwegers Theorem 2.3, pp. 4–7.

Prove `finiteEulerProduct_modulus`: for all n≥0, uniformly as ε→0⁺,

```text
log |(ζe^(−ε/m);ζe^(−ε/m))_n|
 = [Li₂(e^(−εn))−π²/6]/(mε) + O(1+|log ε|).
```

Split the finite product into m-blocks, estimate the slowly varying radial factors and handle the incomplete block separately. This is a modulus estimate; individual terms retain complex phases. Apply it with the globally strictly concave saddle potential to prove `nahmSummand_globalDomination`:

```text
|e^(−Λ/(mε)) e^(−εQ(n)/m)/∏_i(q)_{n_i}|
 ≤ M ε^(−L) exp(−c∑_i[√ε(n_i−s_i/ε)]²)
```

for constants c,M,L>0, all n and small ε. Consequently the sum outside the stated window is O(ε^K) for every K, including each congruence subsum. The quadratic part of A provides global domination; no positivity of a complex summand is claimed. This supplies the rigorous tail step behind GZ §4.3 Claims 2–3, pp. 9–10, using Vlasenko–Zwegers Lemma 2.2(i) and Theorem 2.3, pp. 3–7. *Needs:* §§2.1–2.2 and the Layer 1 critical point.

**Checks.**

- `saddleGaussianHalf` in one dimension has exponent `−Hv²/(2m)`, and its normalised second moment is m/H. Dropping 1/2 changes that moment by a factor of two.
- `saddleBSign` expands `−εB(s/ε+v/√ε)/m=−Bs/m−Bv√ε/m`; the coefficient of Bv is negative.
- `rogersRamanujanFirstCoefficient` at A=2, B=C=0, m=1 gives the first normalised coefficient −1/60. Omitting the Euler correction gives +1/40.
- `finiteEulerEmpty` at n=0 gives zero on both sides of the modulus main term. At n→∞ its main term agrees with the Euler exponential in §2.2.
- `complexResidueClass` at m=3 retains a complex denominator. A positivity assertion for the whole summand is rejected even though its absolute value obeys the estimate.
- `tailWithoutLeadingTerm` applies equally when the Gauss factor in §2.5 vanishes; it never divides by that factor.

### 2.4 Gaussian brackets and the lattice covolume

For an invertible symmetric matrix M over a characteristic-zero field define `formalGaussian` first on polynomials by Wick contraction, equivalently
`[exp(½∑(M⁻¹)_ij∂_i∂_j)P]_{v=0}`. Extend it to series only with a complete filtration for which each coefficient has finitely many contractions. Specify that filtration as part of the input; an arbitrary infinite series in v is not automatically integrable. Supply linearity, value on one, odd-parity vanishing, Wick's pairing formula, direct sums, linear changes of coordinates and affine completion of the square. In the h-scaled convention replace the differential operator by h/2 times it (GZ (13)–(14), p. 4; GSWZ (110)–(111), p. 28; Garoufalidis–Storzer–Wheeler Lemmas 3.1–3.2, pp. 9–10). The h-scaled weighted completion in Layer 5 is a particular valid domain.

Prove `formalGaussian_eq_normalisedIntegral` for complex polynomials and a real symmetric positive definite M, using the existing Gaussian measure of covariance M⁻¹ and its supplied moments. The integral denominator is positive. Its one-dimensional value on `v^(2r)` is `(2r−1)!! M^(−r)` and its value on odd powers is zero. In several variables the covariance entries, rather than just diagonal entries, determine contractions. This is a bridge to the Gaussian owner, not another construction of that owner's moments.

Prove `shiftedGaussianLattice` for h=m√ε and every complex polynomial P:

```text
h^N ∑_{v∈b+hℤ^N} P(v)e^(−vᵀHv/(2m))
 = ∫ P(v)e^(−vᵀHv/(2m))dv + O(ε^K)
```

for every K, uniformly in b modulo hℤ^N. Truncating at `max|v_i|≤ε^(−1/12)` preserves the assertion. Fourier transforms of polynomial Gaussians have polynomial-Gaussian bounds; apply lattice Poisson summation (`ThetaSeries` Layer 1) to the Schwartz function v↦P(b+v)e^(−(b+v)ᵀH(b+v)/(2m)) on the lattice hℤ^N and control the entire nonzero-frequency sum. The unscaled lattice factor is `m^(−N)ε^(−N/2)`. Together with the integral `(2πm)^(N/2)/√det H` and the summand factor `(ε/(2π))^(N/2)`, it produces `m^(−N/2)`. This is the covolume correction to GZ §4.3 Claim 4, (34)–(37), pp. 9–10.

**Checks.**

- `gaussianUnitAndOdd` gives bracket 1=1 and bracket v_i=0. A putative linear functional assigning one to every monomial fails.
- `gaussianTwoAndFour` in rank one gives `⟨v²⟩=1/M` and `⟨v⁴⟩=3/M²`; at M=H/m the values are m/H and 3m²/H².
- `gaussianMixedCovariance` in rank two gives `⟨v₁v₂⟩=(M⁻¹)₁₂` and `⟨v₁²v₂²⟩=(M⁻¹)₁₁(M⁻¹)₂₂+2(M⁻¹)₁₂²`.
- `poissonSpacing` at N=1,P=1,H=1 has unscaled sum `√(2πm)/(m√ε)` to leading order. Spacing mD√ε inserts exactly an additional factor D⁻¹, not D or D⁻¹/².
- `gaussianCompletionGuard` rejects assigning a bracket to an unfiltered sum whose constant h-coefficient receives infinitely many nonzero moments.

### 2.5 Congruence splitting and the analytic theorem

Take C=0, choose a denominator d clearing Q and, when powers occur, A and B, and choose a strong denominator D divisible by a denominator of Q. Assume m is odd and prime to Dd. Let `ā=a m⁻¹ mod D`; define

```text
G(Q,a/m) = D^(−N)∑_{r mod D} e(ā Q(r)).
```

Its value is independent of compatible refinements of D. Rational exponents modulo m use the inverse of their denominator modulo m. Establish the exact Chinese-remainder phase split, keeping the residual Q values modulo D separate from Q modulo m. The phase-free congruence subsums still have complex Euler denominators (GZ (16), p. 5, and (25)–(31), pp. 8–9).

Prove `congruenceRemainder_difference`: after removing `e^(Λ/(mε))`, the difference of a fixed class modulo mD and D⁻ᴺ times the corresponding class modulo m is O(ε^K) for every K. Uniformity over the finite classes follows from §§2.3–2.4. This difference formulation survives exact cancellation of leading terms and fixes the use of asymptotic division in the printed Claim 1.

For k∈{0,…,m−1}^N put

```text
I_k(ε) = formalGaussian_{H/m}
  [exp(−(B·v)√ε/m−Nε/(24m)
                      +∑_iψ_{ζ^{k_i}θ_i,ζ}(v_i/√ε,ε))],
S(ε) = ∏_i D_ζ(ζθ_i)^(−1/m)
       ∑_k ζ^{Q(k)} ∏_i θ_i^((Ak)_i)/(ζθ_i;ζ)_{k_i} · I_k(ε),
c(Q) = (det H)^(−1/2)∏_i θ_i^(B_i)(1−x_i)^(1/2−1/m).
```

All roots of positive numbers are positive, and cyclic roots use the factor logarithms of §2.2. The denominators are nonzero since 0<θ_i<1. The expression I_k has only integral powers of ε by parity. Name `nahmRadialExpansion` for

```text
e^(−Λ/(mε)) f_{A,B,0}(a/m+iε/(2πm))
 ∼ χ_{a,m}^N m^(−N/2)c(Q)G(Q,a/m)S(ε).
```

For each K this means the difference from the coefficient polynomial of degree <K is O(ε^K). For general C multiply that polynomial series by `e(aC/m)exp(−Cε/m)`. This is the corrected analytic content of GZ Theorem 3.1, (18)–(20), pp. 5–6, and CGZ Theorem 7.1, (43), p. 36. It is radial, not sectorial; it applies to positive definite analytic data, not arbitrary signed knot matrices. The proof closes by summing the uniform local errors and global tails, without division by G or S(0).

**Checks.**

- `integerValuedGauss` allows D=1 for integer-valued Q and gives G=1.
- `vanishingGauss` at A=1,B=0,m=3 has Q(n)=n²/2, D=2 and G=(1−1)/2=0. The normalised full expansion is flat; this is not a unit-series input.
- `gaussRefinement` recomputes `vanishingGauss` with the strong denominator D=4. Then ā=3⁻¹=3 mod 4 and the terms e(3r²/2), r=0,…,3, are 1,−1,1,−1, so G=0 again, as independence of compatible refinements of D requires.
- `radialOrderOne` at A=2,B=0,m=1 has leading value `[H(1−x)]^(−1/2)` and first relative coefficient −1/60.
- `radialConstantShift` multiplies the C=0 answer by the nontrivial phase e(aC/m) and the series `1−Cε/m+…`.
- `covolumeRankZero` gives m⁰=1 and no Gaussian integration. The only remaining series is the C factor, as in §2.1.

### 2.6 Coherent coefficient fields and arithmetic descent

For d,m>0 define the following generated fields from nonzero algebraic coordinates with specified coherent roots. In the analytic application use the positive solution and its positive roots: `y_i=x_i^(1/d)`, `η_i=x_i^(1/(dm))`, `θ_i=η_i^d`, and set

```text
E = ℚ(y_i,ζ),       H_rad = E(η_i),
F_G = ℚ(y_i,ζ_D),   K = F_G(ζ).
```

Define `radialBaseField` and `radialKummerField` as the corresponding generated intermediate fields in ℂ. Their API gives membership of the generators, inclusion and minimality, and `η_i^m=y_i`, `η_i^d=θ_i`. If gcd(d,m)=1, Bézout gives `H_rad=E(θ_i)`. In every case H_rad/E is finite Galois because E contains the m-th roots of unity. Every actual E-automorphism sends η_i to ζ^{s_i}η_i and θ_i to ζ^{ds_i}θ_i; not every vector s need occur. Interpret `θ_i^(A_ij)` and `θ_i^(B_i)` as integer powers `η_i^(dA_ij)` and `η_i^(dB_i)` (GZ §3 and (21), pp. 5–6).

Define the finite sum T by omitting the cyclic-dilogarithm prefactor from S, and `C_θ=∏D_ζ(ζθ_i)`. The exact target `radialKummer_descent` is

```text
σ(C_θ^(−1) T(η,ε)^m) = C_θ^(−1) T(η,ε)^m
```

coefficient by coefficient for every σ∈Aut_E(H_rad). It implies `S^m∈E[[ε]]`. Prove this identity at all coefficients by the root-change recurrence and Gaussian change of variables; a calculation of its constant term is insufficient. This is the arithmetic assertion of GZ (21), p. 6, beyond the analytic remainder argument. The coherent-power automorphism identity is a separate proof obligation, `radialKummerCoefficientIdentity`, and may not be replaced by freely changing θ while holding its rational powers fixed.

Put

```text
ω = m^(−N/2)(det H)^(−1/2)∏(1−x_i)^(1/2),
Φ = G(Q,a/m) ∏θ_i^(B_i)(1−x_i)^(−1/m) S.
```

Then ω>0 and `ω²∈ℚ(x)ˣ`, and the analytic expansion is `χ^N ω e^(Λ/(mε))Φ`. Subject to `radialKummerCoefficientIdentity`, prove `Φ^m∈K[[ε]]`. Name `radialChernConstantComparison` for the further assertion, when Φ₀≠0, that its constant Kummer class is the inverse of
`P_ζ(β)D_ζ(1)^N`, in the explicitly enlarged field containing the coherent radicals. Here β is the integral class over ℚ(y), and P_ζ is the cyclic-dilogarithm map of the owner. Name `radialCyclotomicEquivariance` for the inverse-cyclotomic eigenspace law of `[Φ₀^m]∈Kˣ/Kˣᵐ` under Aut_{F_G}(K), and the corresponding coefficient transformation. The rational-data comparison including the Gauss field is an additional arithmetic target, not a consequence of normal convergence (CGZ Theorem 7.1, (43)–(44), p. 36; GZ (21), p. 6).

For integral A with even diagonal and integral B the convenient choice d=D=1 gives K=ℚ(x,ζ). Other normalisations require their larger fields explicitly. If a series was written with the printed phase ν rather than χᴺ, use `Φ_Dedekind=(ν/χᴺ)Φ_printed` before the Kummer comparison; a phase change can change an m-th-power class.

Prove `unitSeries_descent` for characteristic-zero fields K⊂L: if Φ₀≠0 and `Φ^m∈K[[ε]]`, then `U=Φ/Φ₀∈1+εK[[ε]]`, by uniqueness of an m-th root with constant one. If an owner-compatible representative ε_β and chosen m-th root satisfy `ε_β^(1/m)Φ₀∈Kˣ`, obtain `ε_β^(1/m)Φ∈K[[ε]]`. Include all good-order and roots-of-unity hypotheses of that owner. This is the exact nonvanishing form of CGZ Corollary 7.2 and Remark 7.3, pp. 36–37. The m-th root of a quotient class is not itself a chosen field element.

**Checks.**

- `coherentFieldsOrderOne` has H_rad=E at m=1; at d=m=1 both are ℚ(x). If all coordinates are one, both fields are ℚ(ζ).
- `coherentRadicalExtension` at d=2,m=3,x=1/4 has E=ℚ(ζ₃), while H_rad contains the positive cube root of 1/2 and is strictly larger.
- `coefficientFieldLinearTerm` at A=1,B=1/4,m=1 has leading coefficient 2^(−1/4), whose square is not in ℚ(x)=ℚ. Even integer-valued Q can retain a B-root: A=1,B=1/2 has integral Q but the displayed Φ₀ is √2.
- `rootActionCoherence` sends η to ζη and θ to ζ^dθ. Sending θ to ζθ with every θ^(A_ij) unchanged violates the rational-power convention.
- `unitNeedsNonzeroConstant` rejects Φ=0 and Φ=ε as normalisable by Φ₀. The analytic theorem remains applicable when G=0.
- `descentNotConstantOnly` requires the invariance of the ε and ε² coefficients as separate checks; verifying only `[Φ₀^m]` proves neither.

### 2.7 Andrews–Gordon acceptance

Consume the owner's Andrews–Gordon identity for n=2r+3 odd, `A_ij=2min(i,j)`, B=0. Its product excludes the classes `k≡0,±(r+1) mod n`, equivalently `2k≡0,±1`. Identify the critical tuple with `(X₂,…,X_{r+1})`,
`X_j=1−[sin(π/n)/sin(πj/n)]²`. With the specified Rogers trigonometric identity prove `Λ=(n−3)π²/(6n)`. Compare the product's radial constant with §2.5 at ζ=e(1/n), retaining the phase
`e(n/24−1/8+1/(12n)−1/(4n²))`. Use the cyclic-dilogarithm comparison to obtain the acceptance identity `R_ζ(η_ζ)=ζ²` of CGZ Theorem 7.4, (45)–(52), pp. 37–39. *Needs:* the general Andrews–Gordon supplier, the Rogers identity, and the arithmetic comparison with all its good-order hypotheses.

**Checks.**

- r=1,n=5 gives the first Rogers–Ramanujan identity and Λ=π²/15.
- r=2,n=7 gives `A=((2,2),(2,4))` and fixes the ordering X₂,X₃.
- r=0,n=3 gives the empty sum one and Λ=0. No positivity assertion Λ>0 is made there.

### Examples

The A=2, B=C=0 radial expansion at one has a positive leading constant and first relative coefficient −1/60; changing C to −1/60 makes that first relative coefficient zero, as expected for the normalised modular Rogers–Ramanujan function. At the third root for A=1,B=0 the Gauss factor vanishes and the entire dominant expansion cancels. These examples distinguish a robust additive asymptotic theorem from a quotient statement that would be undefined in the second case.

### Dependencies

Layer 1; QSeriesPartitionsAndMockModularForms layers QM.0–QM.1; Polylogarithms Layer 1 for Li₂ and distribution; HabiroNumberFields Layers 0–1 only for the arithmetic coefficient and finite-Chern comparisons. The analytic proof uses existing eta, Gaussian and Fourier foundations, StandardDistributions Layers 1 and 5, and lattice Poisson summation from ThetaSeries Layer 1 (TauCetiRoadmap pull request #286). `radialKummerCoefficientIdentity` and `radialChernConstantComparison` are explicit arithmetic proof obligations. No knot or Habiro module theorem is needed for the analytic estimate.

## Layer 3: finite-index cusps and scalar growth

### 3.1 Width-normalised orders

Consume `FuchsianOrbifolds` Layers 3–5 for cusp quotient charts, compactification, meromorphic descent and the finite-principal-part criterion. The extra interface here is the scalar estimate in the upper-half-plane coordinate used by a Nahm sum. Fix Γ≤SL₂(ℤ) of finite index, replace it by ⟨Γ,−I⟩ for weight-zero functions, and choose σ∈SL₂(ℤ) with σ∞=P. Let w be the positive projective cusp width. Define `normalisedCuspOrder f P=k/w` when

```text
f(στ)=∑_{n≥k} a_n exp(2πinτ/w),     a_k≠0.
```

The identically zero function has order +∞. Define `cuspLeadingCoefficient` relative to σ and w, not merely to P. Its API gives independence of the order from σ, multiplication and inversion of nonzero meromorphic germs, order of a sum with possible leading cancellation, and invariance of k/w under replacing the period w by rw. Changing σ to ±σT^ℓ multiplies a_k by `e(kℓ/w)`. A strict orbit period is converted to the projective period before making these statements. These contracts refine GZ §7, (50)–(54), pp. 13–14, and CGZ §7.3, p. 40. *Needs:* the supplier's Laurent expansion in the cusp chart and Layer 2's holomorphic scalar function.

**Checks.**

- The constant function one has k=0 and order zero; zero has infinite order and no nonzero leading coefficient.
- At infinity the classical j function has k=−1 at width one. In a parameter of period r its first index is −r, while its normalised order stays −1.
- The two standard Γ₀(p) cusps have projective widths 1 and p. The order is divided by the appropriate width, rather than always being the integer Laurent index.
- Γ(3) has projective index 12 and four projective cusp widths 3. Using its SL₂ index 24 in that sum would count the central sign twice.
- `σ=((2,1),(5,3))` has determinant one and sends infinity to 2/5. Its lower row, rather than the numerator of the cusp, controls the radial scale below.

### 3.2 The radial Laurent estimate

Prove `cuspLaurent_uniformRemainder`: for a nonzero meromorphic cusp germ and Y→∞, uniformly in real X in a fixed period interval,

```text
f(σ(X+iY)) = a_k exp(2πik(X+iY)/w)
             (1+O(exp(−2πY/w))).
```

The bound follows from convergence on a smaller punctured chart, including when k is negative. For σ with first column (a,c), c>0, the exact identity
`σ⁻¹(a/c+iy)=−d/c+i/(c²y)` yields `cuspLaurent_radial`:

```text
f(a/c+iy)=a_k e(−vd/c) exp(−2πv/(c²y))
         (1+O(exp(−2π/(wc²y)))),    v=k/w.
```

Treat infinity in its own chart. Prove also the comparison rule: an upper bound `|f(a/c+iy)|=O(exp(M/y))` forces `−2πv/c²≤M`. The converse cusp criterion used here is the supplier theorem that a periodic holomorphic function with at most exponential growth in Y has only a finite pole at the puncture; its proof is not rebuilt in this layer. No radial estimate alone is asserted to imply meromorphicity without periodic holomorphy. Sources: CGZ proof of Theorem 7.5, p. 40; GZ proof of Proposition 7.1, pp. 13–14. *Needs:* §3.1 and the meromorphic descent supplier.

**Checks.**

- At P=0 take σ=S, c=1,d=0: a pole of normalised order −λ gives growth `exp(2πλ/y)` with positive sign.
- For the cusp 2/5 and the preceding σ the leading phase is `e(−3v/5)` and the exponential scale uses 25y.
- A zero of positive order decays; a pole grows. Reversing these signs fails already for the germs q and q⁻¹.
- If the first two Fourier coefficients vanish, k is the first nonzero index, not a preset index zero. A cancellation can increase the order of a sum.

### Examples

For a Γ-invariant Nahm sum, a local expansion in the width parameter can have a fractional normalised order. Writing `v=k/w` first makes the comparison with the exponent Λ in Layer 4 independent of the chosen subgroup. At zero, substituting y=t/(2π) in the displayed radial formula gives `exp(4π²λ/t)`, which fixes the conversion Λ=4π²λ used there.

### Dependencies

Current FuchsianOrbifolds Layers 3–5 and the pinned cusp APIs listed above. Layer 2 is needed only for the Nahm application. This layer adds scalar estimates to existing cusp geometry; it does not construct another modular curve or another cusp equivalence relation.

## Layer 4: modularity forces Bloch torsion

### 4.1 A majorant at every root

For orientation, distinguish three properties of A: some rational B,C give a modular Nahm sum; the distinguished positive solution has torsion rational Bloch class; every algebraic solution has the corresponding torsion class. The endpoint here proves the first implies the second. It neither proves the third nor the converse, and it makes no assertion that the two latter properties are equivalent. Counterexamples to broader formulations do not invalidate this implication (CGZ §7.1, pp. 34–36; Vlasenko–Zwegers §4, pp. 15–18).

For analytic data, m≥1 and t>0 define the positive `residueMajorant`

```text
M_{A,B,C;m}(t)=∑_{n∈ℕ^N} exp(−tQ(n)) /
                 ∏_i (exp(−m²t);exp(−m²t))_{⌊n_i/m⌋}.
```

Prove summability, positivity, `M_{C+u}=exp(−ut)M_C`, the rank-zero value exp(−Ct), and the exact finite split

```text
M_{A,B,C;m}(t)=∑_{s∈{0,…,m−1}^N} exp(−tQ(s))
                 f_{A,(As+B)/m,0}(im²t/(2π)).
```

Its proof uses `Q(mℓ+s)=m²[ℓᵀAℓ/2+((As+B)/m)ᵀℓ]+Q(s)`. In particular A is unchanged. For every m prove `finiteEuler_blockLowerBound`: there is c_m>0, uniform in primitive m-th roots ζ, t∈(0,1] and n≥0, with

```text
|(ζe⁻ᵗ;ζe⁻ᵗ)_n| ≥ c_m (e^(−m²t);e^(−m²t))_{⌊n/m⌋}.
```

Take c₁=c₂=1. Bound the accumulated block error by a convergent estimate; paying a fixed loss for every block would not prove this inequality. Consequently, with Λ from Layer 2,

```text
|f(a/m+it/(2π))| ≤ c_m^(−N) M_{A,B,C;m}(t)
                = O(exp(Λ/(m²t))).
```

More precisely `M=exp(Λ/(m²t))(∑_s K_{A,(As+B)/m}+O(t))`, where each K is the positive order-one leading constant. This covers even m and orders sharing primes with a quadratic denominator; it uses no nonvanishing at the original root. Sources: GZ §4.1, proof of Lemma 2.1, and §4.3, (24)–(25), pp. 7–8; Zagier II.3B, (3.7), p. 48 and II.3C, pp. 55–56. *Needs:* §2.1, §2.5 at order one, and finite Euler products.

**Checks.**

- At m=1 the majorant is exactly the original positive imaginary-axis sum.
- At A=2,B=1,C=11/60,m=2 the two shifted B's are 1/2 and 3/2; their prefactors are `exp(−11t/60)` and `exp(−131t/60)`, and the base is e^(−4t).
- At rank zero, C=7,t=log 2, the value is 1/128 for every m.
- At m=2,n=1 the lower bound is `1+e⁻ᵗ≥1`. This case cannot be obtained by imposing an odd-order restriction.
- For A=2 the second-root growth bound is `O(exp(π²/(60t)))`.

### 4.2 Cusp valuations and the order-one modular expansion

Assume only that f=f_{A,B,C} is invariant under some finite-index Γ≤SL₂(ℤ). Apply §4.1, periodicity and the supplier's puncture criterion to show it is meromorphic at every cusp. Prove `nahm_cuspOrder_bound`, with `λ=Λ/(4π²)`,

```text
v_P(f) ≥ −λ for every rational cusp P,
v_0(f)=−λ,          v_∞(f)=min_{n∈ℕ^N}Q(n) ≥ −λ,
C≥−λ.
```

The minimum exists by positive definiteness; positivity of imaginary-axis coefficients prevents cancellation at that exponent. If Q(n)≥C for every n, then v_∞=C. There is no equivalence between equality in this bound and B=0. Meromorphicity at zero makes λ rational. At order one, periodic meromorphicity improves the full expansion to

```text
f(it/(2π))=K exp(Λ/t)(1+O(exp(−c/t))),
K=(det H)^(−1/2)∏_i x_i^(B_i)(1−x_i)^(−1/2)>0,
```

for some c>0. Every positive power of t in the relative radial expansion vanishes. For a modular transformation law of rational weight with finite-order multiplier, fixed automorphy-factor branches and meromorphic cusp expansions, prove the weight is zero by comparing its t-power with this nonzero constant. Sources: GZ §7, Proposition 7.1, pp. 13–14; CGZ (53), Theorem 7.5 and Remark 7.7, pp. 40–41; Vlasenko–Zwegers Theorem 2.3, pp. 4–5. *Needs:* Layers 2–3 and §4.1.

**Checks.**

- The first normalised Rogers–Ramanujan function has λ=1/60 and v₀=−1/60.
- For A=2,B=−3,C=5, the infinity series starts `2q³+…`, since Q(1)=Q(2)=3. This computation tests the minimum formula without asserting that this datum is modular.
- Rank zero has Λ=λ=0. Invariance under a finite-index group forces exp(2πiCτ) to be constant, hence C=0.
- At A=2,B=0,C=−1/60 the coefficient −1/60 from §2.5 is cancelled by exp(t/60). This is necessary for the exponentially small modular remainder.

### 4.3 Fixed fields, multipliers and bounded powers

Fix D divisible by 24, clearing A and B and all denominators and strong periods used in §2.6. With F=ℚ(x), put `E=F(x_i^(1/D),ζ_D)` once and for all; this is independent of the varying order n. The class `η_E=∑[x_i]` is integral in the owner's CGZ group because the x_i are D-th powers in E and the cleared boundary vanishes there. For n prime to `6D M_E`, let ζ be primitive of order n and E_n=E(ζ). The corrected `fixedExtensionChernLift` target is conditional on the three arithmetic identities of §2.6: its Dedekind-normalised constant u is nonzero in the modular application, satisfies `u^n∈E_nˣ`, and

```text
[u^n]=R_ζ(η_E)^(−1) in E_nˣ/(E_nˣ)^n.
```

Use the field E's exceptional integer, not F's. Keep the inverse-cyclotomic eigenspace restriction and every roots-of-unity condition of the finite Chern supplier. This is the rational-data form of CGZ Corollary 7.2, pp. 36–37; it requires the all-coefficient and constant-term arithmetic comparisons, not just the analytic expansion.

For γ=((a,b),(c,d))∈Γ, d>0 a good odd order, put ζ=e(b/d),
`μ=e(Ns(b,d)/2)` and `ω_d=d^(−N/2)(det H)^(−1/2)∏(1−x_i)^(1/2)`.
Using the same Dedekind normalisation as §2.6, prove `modularConstant_boundedPower` from

```text
u=μ⁻¹ω_d⁻¹ e(−Cb/d)e(−λc/d) K.
```

The sign of the λ phase follows by taking the inverse transformation at `b/d+ih/(2πd)`: its imaginary-axis exponent is evaluated at `ε=dh/(1−ich/(2π))`, so `Λ/ε=Λ/(dh)−2πiλc/d`. Choose one positive integer s divisible by 24, 2den(B), den(C) and den(λ). Then `u^s∈F(ζ)ˣ⊂E_dˣ` for every such d. The Gauss factor stays inside u. When using the printed binomial phase of GZ instead of μ, rescale u by that phase quotient before invoking the Chern comparison. Source: CGZ proof of Theorem 7.5, p. 40 (with the inverse-transformation sign and the displayed prefactors retained); GZ Theorem 3.1, pp. 5–6. *Needs:* §§2.6, 4.2, the fixed integral lift and the eta multiplier of QSeriesPartitionsAndMockModularForms layer QM.1.

There are unbounded good d without a congruence assumption on Γ. Choose L divisible by the excluded primes such that T^L and the lower unipotent of entry L lie in Γ. Their products `((1,Lk),(L,1+L²k))` lie in Γ for k≥1, and d=1+L²k is prime to every excluded prime. No claim that these d are prime is needed.

**Checks.**

- For the first Rogers–Ramanujan datum s=120 works and the phase is e(−c/(60d)).
- If A,B have denominators, the radicals in E and the Gauss field cannot be omitted. A=2/3,B=1/3 is covered with those fields retained.
- At n=1 the Kummer quotient is trivial. At general n the comparison concerns u^n, while the independent modular bound is u^s with s fixed.
- Enlarging E separately for each d is rejected: it would change M_E and break the unbounded-order argument.

### 4.4 The integral arithmetic bridge and the endpoint

Prove the elementary `torsion_of_unbounded_divisibility`: in a finitely generated abelian group, an element lying in nG for an unbounded set of positive n is torsion. In a decomposition into free and finite parts, a nonzero free coordinate cannot be divisible by unbounded n. Apply this through the owner's Suslin comparison and its finitely generated quotient; the CGZ convention may retain additional 2-primary ambiguity, which is torsion. Do not assert finite generation of that entire convention without the comparison.

Combine `u^s∈E_nˣ` with `[u^n]=R_ζ(η_E)⁻¹`: the s-th power of this Kummer class is trivial, so injectivity of the finite Chern map makes sη_E divisible by n for unbounded good n. Conclude η_E is torsion. Rational restriction from F to the fixed finite extension E is injective by restriction–corestriction, so the rational class `ξ_F` of §1.4 is zero. State `modularity_implies_blochTorsion` as follows: for symmetric positive definite rational A and rational B,C, finite-index invariance of the analytic Nahm sum implies `ξ_F=0` in `B_CGZ(F)⊗ℚ`; for integral A the original integral class is torsion. In an algebraically closed torsion-free Bloch target its image is zero. This last assertion uses torsion-freeness, not a false finite-generation assertion for the algebraic closure. Source: CGZ Theorem 7.5 and Remarks 7.6–7.7, pp. 40–41, together with its Theorem 1.2, Proposition 2.5 and Remark 2.6 for the arithmetic conventions. *Needs:* §§4.1–4.3, HabiroNumberFields Layer 0 and K3BlochGroups Layers 3–4.

For rational A only the integral lift η_E is reduced modulo n. The rational vector space `B(F)⊗ℚ` is divisible; reducing it modulo n would give no information. Record the endpoint as requiring `radialKummerCoefficientIdentity`, `radialChernConstantComparison` and `radialCyclotomicEquivariance` from §2.6. Their exact statements are part of the build, so the theorem does not silently assume the arithmetic part of a radial estimate.

**Checks.**

- A nonzero element of ℤ fails unbounded divisibility; a torsion element can satisfy it along integers prime to its order.
- A single n, or arbitrarily many repetitions of a fixed n, is insufficient.
- Passing from E back to F is performed after rationalisation. Integral restriction need not be injective on torsion.
- The theorem concerns the distinguished positive solution. It does not assert that every algebraic solution has torsion Bloch class, nor the converse implication from torsion to modularity.

### Examples

The two Rogers–Ramanujan data in §1.1 satisfy the modular order-one cancellation and have the same distinguished Bloch class; their different B,C still change the radial constants and phases. The unipotent product above produces enough good orders even for a noncongruence finite-index subgroup. This is why imposing a principal congruence subgroup at the start would unnecessarily weaken the endpoint.

### Dependencies

Layers 1–3; K3BlochGroups Layers 3–4; HabiroNumberFields Layers 0–1; QSeriesPartitionsAndMockModularForms layer QM.1; the finite-generation and restriction–corestriction supplier contracts stated above. The precise rational-data bridge uses a fixed radical field and the corrected arithmetic radial comparisons. No formal Gaussian integrality or Habiro module membership from Layers 5–7 is a prerequisite.

## Layer 5: formal admissibility and Gaussian comparison

### 5.1 Plethystic coefficients and root expansions

Use the owner's formal Pochhammer symbol in `ℚ(q)[[T]]`, its Euler coefficients and the embedding in `ℤ((q))[[T]]`. In particular `(T;q⁻¹)_∞=(qT;q)_∞⁻¹` is an identity obtained by the rational-function automorphism q↦q⁻¹. It is not a product converging q-adically with base q⁻¹. Supply the augmentation-complete multivariate `mvLog` and `mvExp`, with inverse laws over a ℚ-algebra, the coefficient formula and their product/sum laws. All substitutions have zero augmentation. This is the local interface to the supplier's one-variable identities (GSWZ §2.1, (46)–(59), pp. 18–20).

Define `plethysticCoefficients F` for `F∈1+(t)ℚ(q)[[t]]` as the unique rational functions L_n, n≠0, such that

```text
log F(t,q)=−∑_{n≠0}∑_{ℓ≥1} L_n(q^ℓ)t^(ℓn)/(ℓ(1−q^ℓ)).
```

The sum contributing to any fixed nonzero multi-index is finite. Define `IsAdmissible F` by `L_n∈ℤ[q,q⁻¹]` for every n. Its API includes uniqueness, a triangular coefficient recursion, invariance under permutation and adjoining unused variables, closure under multiplication and inversion, and the unique product
`F=∏_{n≠0,i∈ℤ}(q^it^n;q)_∞^(c_{n,i})`, where `L_n=∑_i c_{n,i}q^i`. For admissibility there are finitely many i for each fixed n. An unrestricted product with coefficients merely bounded below in i is a different, weaker property (GSWZ Definition 1.7 and (27)–(28), pp. 11–12; §2.2, (60)–(64), pp. 19–20). *Needs:* the formal Pochhammer supplier and augmentation operations just stated.

For an algebraic primitive m-th root ζ, define the injective coefficientwise Laurent expansion `rootExpansion_ζ:ℚ(q)→ℚ(ζ)((x))` by q=ζ+x. It preserves sums, products and substitutions into rational functions; a pole is allowed. The augmentation logarithm is taken coefficientwise before root expansion. Define the invariants

```text
V_F(t)=∑_{n≠0}L_n(1)Li₂(t^n),
log δ_F(t)=∑_{n≠0}(L_n(1)−2L'_n(1))Li₁(t^n),
```

and, writing T for the variables before the m-th-power substitution,

```text
u_{F,m}(T)= (m−1)/(2m) ∑_n L_n(1)Li₁(T^(mn))
          + (1−m)/m ∑_n L'_n(1)Li₁(T^(mn))
          − ∑_{j=1}^{m−1}∑_n L_n(ζ^j)/(1−ζ^j)
               ·(1/m)∑_{k mod m}ζ^(−kj)Li₁(ζ^kT^n),
U_{F,m}=exp u_{F,m}.
```

Here V has augmentation zero and δ,U have constant one. Define their composition, coefficient extraction and base-change APIs. Prove the root expansion

```text
F(T,ζ+x)=exp(V_F(T^m)/(m²h)) δ_F(T^m)^(−1/2) U_{F,m}(T)
          ·(1+x (T)ℚ(ζ)[[T,x]]),   h=log(1+x/ζ),
log F(T,ζ+x)=ζ V_F(T^m)/(m²x)+V_F(T^m)/(2m²)
             −½log δ_F(T^m)+u_{F,m}(T)+O(x).
```

Fractional powers of units use the unique constant-one binomial series. The first coefficient in u is **+(m−1)/(2m)**: expanding `−L(q^ℓ)/(ℓ(1−q^ℓ))` for m|ℓ and then removing `−½log δ` gives this sign. This repairs the corresponding sign in GSWZ (67). Prove the recognition targets: V equality is equivalent to equality of all L_n(1); equality of V,δ and every U_m determines F; one entire Laurent expansion at one root also determines F by injectivity. V alone does not determine an arbitrary admissible series. Sources: GSWZ Lemma 2.3, (65)–(73), pp. 20–21, and Corollary 2.4, pp. 21–22. *Needs:* admissibility, rational Laurent expansions and formal polylogarithms.

**Checks.**

- For `(T;q)_∞`, L₁=1, all other L_n=0, V=Li₂(T), δ=(1−T)⁻¹ and U₁=1. The T² Euler coefficient is `q/((1−q)(1−q²))`.
- At m=2 for the same series, `U₂(T)=(1+T)^(−1/2)`. Its linear coefficient −1/2 and quadratic coefficient 3/8 detect the sign in u and the square-root factor.
- `(T;q⁻¹)_∞` has L₁=−q. The wrong-sign series `(-T;q)_∞` has `L₂=1/(1+q)` and is not admissible.
- `exp(−T/(1−q)²)` has L₁=1/(1−q), so allowing rational L without the Laurent integrality condition would admit a false example.
- The Laurent expansion of 1/(1−q) at one is −x⁻¹. Evaluation at x=0 is undefined.
- At ζ=−1 the same function expands as 1/2+x/4+x²/8+… with no pole, so `rootExpansion` depends on the root and not only on q.
- `mvLogExp`: mvLog(1+t₁t₂)=t₁t₂−t₁²t₂²/2+t₁³t₂³/3−…, mvExp∘mvLog is the identity on (1−t₁)⁻¹, and a series with constant coefficient 2 lies outside the domain of mvLog.
- In rank zero F=1, V=0, δ=U_m=1 and every product is empty. In mixed variables divisibility ℓ|n means divisibility of every coordinate, including its zero coordinates.

### 5.2 The formal Nahm series and its defining equations

For every symmetric integral A, with no positivity restriction, define `formalExponent A n=(nᵀAn+diag(A)·n)/2∈ℤ`. Prove `formalExponent_two_mul`, including evenness of the numerator, by separating diagonal and paired off-diagonal terms. Define `formalNahmSeries A`, written F_A, by

```text
F_A(t,q)=∑_{n∈ℕ^N} (−1)^(diag(A)·n) q^((nᵀAn+diag(A)·n)/2)
                       t^n /∏_j(q;q)_{n_j}.
```

It lies in `1+(t)ℚ(q)[[t]]`; negative exponents of q are permitted. Define σ^a by `(σ^at)_i=q^(a_i)t_i` for a∈ℤ^N. Prove `formalNahmSeries_qDifference`, the exact system

```text
F_A−σ_jF_A=(−q)^(A_jj)t_j σ^(A_{*,j})F_A.
```

Together with constant coefficient one it determines F_A uniquely over ℚ(q), by recursion on a positive coordinate of n. Prove `formalNahmSeries_blockSum`, permutation covariance, `formalNahmSeries_qInv: F_A(t,q)=F_{I−A}(t,q⁻¹)` and compatibility with the q-adic Euler products when available. These are GSWZ (31)–(33), pp. 12–13, (78), p. 23, and Theorem 6, pp. 24–25. *Needs:* §5.1 and finite Euler products; no analytic convergence or positive solution.

Define `deformedNahmSolution A` as the unique tuple `z∈(1+(t)ℤ[[t]])^N` satisfying

```text
1−z_j=(−1)^(A_jj)t_j∏_i z_i^(A_ij).
```

Construct it by augmentation-degree recursion; every negative power is a power of a constant-one unit. Supply constant term, coefficient recursion, uniqueness over any commutative coefficient ring, permutation and block-sum naturality. Define `deformedDiscriminant` by §1.2's determinant at z(t); it has constant one. The factor z_j on the left must not be counted again inside the right-hand product (GSWZ (34), p. 13 and (76)–(77), p. 23).

**Checks.**

- A=0 gives `F_0=∏_j(t_j;q)_∞⁻¹` and z_j=1−t_j. A=1 gives `F_1=(qt;q)_∞` and z=(1−t)⁻¹.
- A=3 has `F−F(qt)+q³tF(q³t)=0`; its t coefficient is `−q³/(1−q)` and its t² coefficient is `q⁹/((1−q)(1−q²))`.
- At A=3, `z=1+t+3t²+12t³+55t⁴+273t⁵+…` and `δ=1−5t−3t²−10t³−42t⁴+…`.
- For `A=((2,1),(1,1))`, the first equation shifts both variables. Replacing its column by only A₁₁ loses the mixed coefficient.
- A=−1 has formal exponent −3 at n=2. The 2×2 all-ones matrix is valid although singular.
- The empty matrix gives F=1 and δ=1. An odd diagonal uses the signed equations, not the positive unsigned system of Layer 1.

### 5.3 Integral shifts, root orbits and the potential

Define `shiftRatio R_a=σ^aF_A/F_A` for a∈ℤ^N and `G_j=R_{e_j}`. Prove integrality `R_a∈1+(t)ℤ[q,q⁻¹][[t]]`, including negative a; prove the cocycle law
`R_{a+b}=R_a σ^aR_b`, R₀=1, and
`1−G_j=(−q)^(A_jj)t_j R_{A_{*,j}}`.
Use coordinate telescoping and inverse units for negative shifts; a product indexed from zero to a negative A_jj is not a definition. For m≥0 define the finite `orbitRatio`

```text
U_{j,m}=∏_{s=0}^{m−1}σ_j^sG_j=R_{me_j}.
```

It has `U_{j,m+n}=U_{j,m}σ_j^mU_{j,n}`. Coefficientwise evaluation at primitive ζ_m is legitimate on U even when it is not legitimate on either F in its quotient. Prove `orbitRatio_rootNahm`:
`U_{j,m}(t,ζ_m)=z_j(t_1^m,…,t_N^m)` for m≥1. Its proof derives the signed deformed Nahm equations for the orbit products and uses constant-one uniqueness. Sources: GSWZ proof of Theorem 6, (83)–(89), pp. 24–25, with the full column shifts retained. *Needs:* §5.2 and augmentation recursion.

Define `residuePotential V_A` before proving admissibility: take the coefficient of (q−1)⁻¹ in log F_A, coefficientwise in t. Prove absence of higher poles in that logarithm, and `Θ_jV_A=log z_j`, where Θ_j=t_j∂/∂t_j. This uniquely determines V_A with V_A(0)=0; for n_j>0 its t^n coefficient is `[t^n]log z_j/n_j`. Prove, independently of Gaussian integration, the all-root identity

```text
log F_A(t,ζ_m+x)=ζ_m V_A(t^m)/(m²x)+O(x⁰).
```

Use the integral orbit ratios and the q-difference equations to rule out higher negative Laurent terms and identify the residue. This is the orbit route to GSWZ Lemma 2.6, (79), p. 23; it does not assume the Gaussian identification of §5.6.

Prove the critical-value formula

```text
V_A=−∑_jLi₂(1−z_j)−½∑_{i,j}A_ij log z_i log z_j.
```

All compositions are formal: 1−z_j has zero augmentation. Differentiating the Nahm equations proves the same Euler derivatives and zero constant term. Put `Λ_A=−A−diag(z/(1−z))`, in the Laurent localisation where the indicated coordinates are invertible. Then the logarithmic Hessian is `Θ_iΘ_j V_A=(Λ_A⁻¹)_ij`; this is not the ordinary Hessian with respect to z. In particular its inverse, together with z, recovers A, so V determines A within this family. Sources: GSWZ (116), p. 29 and (168), p. 36. *Needs:* the deformed solution, formal polylog derivatives and matrix inversion.

**Checks.**

- At A=0, G_j=1−t_j and `R_{−e_j}=(1−q⁻¹t_j)⁻¹`. Here `U_{j,2}=(1−t_j)(1−qt_j)` and its ζ_m value is 1−t_j^m.
- For A=1 the orbit value is `(1−t^m)⁻¹`. For A=3,m=2 its t² coefficient is +1.
- For `A=((2,1),(1,1))`, `[t₁t₂]G₁=−q³` and `[t₁t₂]V_A=−1`. The diagonal-only recurrence fails both.
- `V_0=−∑Li₂(t_j)`, `V_1=Li₂(t)` and `V_3=t+5t²/4+28t³/9+165t⁴/16+…`.
- `V_{−1}=t−3t²/4+10t³/9−35t⁴/16+…`; the statement is not restricted to nonnegative A.
- At m=2 the A=0 residue is +t_j²/4+… and the A=3 residue is `−t²/4−5t⁴/16+…`. A coordinate not divisible by m contributes zero residue.

### 5.4 Finite support and the elementary Dwork identity

Prove `formalNahmSeries_admissible` for every symmetric integral A. From integral shift ratios derive
`L_n(q)[n_j]_q∈ℤ[q,q⁻¹]` for every j, where `[r]_q=(1−q^r)/(1−q)`. Thus a possible non-Laurent denominator is a simple cyclotomic factor whose order divides every nonzero coordinate of n. Induct on total degree. At each such order use §5.3's all-root residue identity, subtracting the already known proper-divisor contributions; a remaining pole would change a forbidden or already prescribed residue. Monic cyclotomic division preserves integral Laurent coefficients. This proves finite support of c_{n,i}, not just the existence of an infinite Euler product. Source: GSWZ Theorem 6, (81)–(89), pp. 24–25. *Needs:* §§5.1–5.3. The orbit proof makes this theorem independent of the Gaussian regularity obligations below.

For an admissible F prove `admissible_dworkLog` directly from its plethystic sum:

```text
log F(t^p,q^p)−p log F(t,q)
 =p ∑_{n≠0}∑_{ℓ≥1,(ℓ,p)=1} L_n(q^ℓ)t^(ℓn)/(ℓ(1−q^ℓ)).
```

At q=ζ_m+x, p∤m, this belongs to `(p/x)ℤ_(p)[ζ_m][[t,x]]` coefficientwise. Passing to t^(1/m) gives the corresponding ramified-variable assertion. A simple pole is allowed; this is not an assertion that the regularised local series has every coefficient divisible by p. Source: GSWZ Lemma 2.5, (74)–(75), p. 22. *Needs:* admissibility and Laurent expansion.

**Checks.**

- A=1 has L₁=q and L_n=0 for n>1; A=0 has L_{e_j}=−1 and no other nonzero L_n.
- At A=3, `L₁=q³`, `L₂=q⁷` and `L₃=q¹⁰+q¹¹+q¹³`.
- For `A=((2,1),(1,1))`, L_(1,1)=−q³; a product of independent rank-one answers would give zero.
- The wrong-sign version of A=1 gives `L₂=q²/(1+q)`, which is excluded by the root residue calculation.
- The Dwork logarithm at m=1 can have a pole at x=0. Requiring it to lie in pℤ_p[[x]] would erase the regulator term needed in §6.3.

### 5.5 Congruence sums and corrected level admissibility

For m≥1 and 0≤k_j<m define the normalised `congruenceNahmSeries`

```text
F_{A,m,k}(t,q)=∑_{n≡k mod m}
 (−1)^(diag(A)·(n−k))
 q^((nᵀAn−kᵀAk+diag(A)·(n−k))/2)
 t^(n−k) ∏_j(q;q)_{k_j}/(q;q)_{n_j}.
```

Its constant term is one and its support is mℕ^N. Supply decomposition of F_A into residue classes with the removed k-th summand restored, block and permutation laws, and the m=1 recovery. Put H=t^kF_{A,m,k}. Prove the corrected order-m system

```text
∏_{s=0}^{m−1}(1−q^(−s)σ_j)H
 = (−1)^(mA_jj) q^(A_jj m(m+1)/2)t_j^m σ^(mA_{*,j})H.
```

Over ℚ(q), and after its injective embedding into ℚ(ζ)((x)), this system has a unique solution supported on k+mℕ^N with t^k coefficient one. The recursion divides by `∏_{s=0}^{m−1}(1−q^(n_j−s))` when n_j≥m; it is nonzero in that field. It is not inverted after evaluating x=0. Sources: GSWZ (35), p. 13, (93)–(95), p. 26 and Theorem 8, (165)–(166), p. 35, with the corrected parity factor. *Needs:* §5.2 and finite Euler recursion.

Define `restrictedAdamsCoefficients_m F`, L₀=0, by

```text
log F=−∑_{n≠0}∑_{ℓ≥1,(ℓ,m)=1}
           L_n(q^ℓ)t^(ℓn)/(ℓ(1−q^(mℓ))).
```

For a constant-one F over ℤ[1/m]((q)) this is a unique family over that ring; rational-function F gives rational-function L_n. The ℓ=1 term makes its recursion triangular. Supply uniqueness, recursion, multiplication-to-addition and m=1 compatibility. Define the coefficient ring

```text
R_m=ℤ[1/m,q,q⁻¹, Φ_d(q)⁻¹ :
            m∤d, or (m|d and gcd(d/m,m)>1)].
```

Define `IsLevelAdmissible_m F` by all L_n∈R_m and `L_n(ζ_m)∈ℤ[1/m]`, where this value lies in the rational subring, not merely in all of ℤ[ζ_m,1/m]. The permitted denominators do not vanish at a primitive m-th root, so this evaluation is defined. Its API includes closure under product and inverse, base change and the restricted Dwork logarithm at roots of order mm′ with gcd(m,m′)=1 and p∤mm′. The same cancellation as in §5.4 gives a `(p/x)` bound. Source: GSWZ Lemma 2.7, (92), pp. 25–26, Definition 2.8 and (93), p. 26, and Lemma 2.10, (108)–(109), p. 28, with the ring enlarged as above.

The target `congruenceNahmSeries_levelAdmissible` applies this definition to the ordinary-variable series `F_{A,m,k}(s^(1/m),q)`. Its residue input is only

```text
log F_{A,m,k}(t,ζ_c+x)=ζ_c V_A(t^c)/(c²x)+O(x⁰),
c=ma, gcd(a,m)=1.
```

This restricted residue comparison and the required pole-cancellation proof form `levelAdmissibilityCancellation`, conditional on the Gaussian comparison obligations in §5.6. They are the corrected content of GSWZ Theorem 7 and Lemma 2.9, (95)–(104), pp. 26–27. The theorem with the smaller printed localisation is false: orders c=ma with gcd(a,m)>1 cannot be used to remove all those cyclotomic poles. A proof must handle nonzero k as well as k=0.

**Checks.**

- m=1,k=0 recovers F_A and §5.4. At A=1,m=3 the order-m system has sign −1, not +1.
- For m=2,k_j=1 its initial term is killed by the left operator, as required.
- For F=1+t₁t₂, `L_(1,1)=−(1−q^m)`. At m=2, `L_(2,2)=(1−q²)/2`; at m=1 it is 1−q.
- For A=0,m=2,k=0 the restricted coefficient at degree two is
  `−(q³+2q−1)/(2(q−1)³(1+q²)(1+q+q²))`. Its Φ₄ pole is allowed by R₂ and contradicts the smaller localisation.
- For `(t;q^m)_∞`, the coefficients at m-smooth positive s are `(1−q^m)/(s(1−q^(ms)))`. At m=2,s=2 this is `1/(2(1+q²))`.
- At A=0,m=2,c=2 the residue's t² coefficient is 1/4. The order c=4 is outside the restricted residue assertion and cannot be used to discard its Φ₄ pole.

### 5.6 Formal Gaussian integration and its comparison obligations

Extend §2.4's `formalGaussian` to the following h-scaled weighted domain, for an invertible symmetric Λ over a ℚ-algebra:

```text
⟨P(w,h)⟩_Λ = [ exp((h/2)∑_{i,j}(Λ⁻¹)_ij ∂_{w_i}∂_{w_j})P ]_{w=0}.
```

Its domain is the positive-weight completion generated by w_i, h and cubic monomials divided by h, with weight(w_i)=1/2 and weight(h)=1. At each resulting h-degree only finitely many contractions contribute. Supply linearity, Wick's pairing formula, tensor factorisation, change of basis, Fubini for block variables, and the affine-shift identity with its exponential factor. Analytic Gaussian moments, when Λ is positive real, agree with this functional by the supplier moments in StandardDistributions; algebraic continuation supplies the rational identities for arbitrary invertible Λ. Sources: GSWZ (110)–(111), p. 28; GSW Lemmas 3.1–3.2, (23)–(25), p. 10; Aarhus II, Proposition 2.13, pp. 8–9. *Needs:* the Gaussian supplier, formal weighted completion and finite polynomial differentiation.

For q=ζ_m e^h, integer k and y_a=ζ_m^(k+a+1)u, s_a=(k+a+1)/m, Z=u^m, define the corrected local remainder by

```text
log ψ = log(uq^(k+1)e^w;q)_∞ −Li₂(Z)/(m²h)
        −Li₁(Z)w/(mh)−Li₀(Z)w²/(2h)
        +∑_{a=0}^{m−1}(s_a−½)log(1−y_a).
```

The Pochhammer logarithm here is its Bernoulli expansion, not an analytic product at a root. The remaining terms have positive weight in the completion just defined. There is generally a w³/h term, so the stronger ideal x times that whole completion is incorrect. The linear subtraction has denominator m and the quadratic subtraction has coefficient 1/2. Supply coefficient bounds, change of representative k, root change, and the h↔x conversion. This repairs GSWZ (114), p. 29, using (59), p. 19.

Define the Gaussian Nahm collection by stationary expansion of the following explicit phase integrand, separately for each k∈(ℤ/m)^N:

```text
 (q;q)_∞^(−N) (−1)^(diag(A)·k)
 q^((kᵀAk+diag(A)·k)/2)t^k
 ·∏_j(q^(k_j+1)e^(w_j);q)_∞
 ·exp((πi diag(A)·w/m +wᵀAw/2+w·log t)/h
       +(diag(A)/2+Ak)·w) dw/(mh)^N.
```

This is a recipe for a formal stationary expansion of GSWZ (112), pp. 28–29, with all its displayed factors retained; it is not an assertion of convergence of this integral. Shift to `w_j=log z_j/m`, eliminate the critical logarithms with the deformed Nahm equations, take covariance `Λ_A⁻¹`, use the corrected ψ above, and fix determinant square roots by the constant-one t-branch. Euler normalisation contributes exp(Nh/24). The finite k-sum is the Gaussian collection; the refined congruence pieces are defined with the same restored k-th summand as §5.5. A source formula with the old ψ cannot simply be reused as its prefactor.

Three precise comparisons must be proved:

- `gaussianGlobalNormalisation`: derive every determinant, cyclic product, root and h/x prefactor from this integrand after the correction to ψ. Establish periodicity of the refined index, its root-action covariance and
  `I_ℓ(t)−I_ℓ(σ_jt)=(−1)^(A_jj)t_jq^(A_jj)I_{ℓ−e_j}(σ^(A_{*,j})t)`.
  The affine Gaussian shift contributes its scalar exponential; omitting it is not translation invariance. These identities imply §5.5's corrected order-m equation (GSWZ Lemma 2.15, (137)–(139), p. 32).
- `gaussianMixedRegularity`: after the exact normalisation, each piece has support on ordinary nonnegative multi-indices, coefficient one at its initial index and coefficients in ℚ(ζ)((x)). Control negative powers of every t_j, including mixed poles. The identity
  `Λ_A⁻¹=−(I+DA)⁻¹D`, D=diag((1−z)/z), helps, but does not by itself prove cancellation in a normalised integral. Even a separate term `h Li₀(1−t)/12` has a t⁻¹ pole.
- `formalGaussian_identification`: once those two targets hold, §5.5's uniqueness over the Laurent field identifies each refined piece with `F_{A,m,k}` at orders mm′ with gcd(m,m′)=1, and at m=1 identifies the full Gaussian collection with F_A. It identifies V,δ,U and the regulator-exponential normalisation with §5.1's invariants. Together with `levelAdmissibilityCancellation`, it supplies the corrected level theorem. The uniqueness step is a proof, not an additional regularity assumption (GSWZ Theorem 8, (163)–(168), pp. 35–36).

These are explicit mathematical targets of the roadmap. The local repair of (114), the independent all-root residue proof and the uniqueness argument do not establish the two global Gaussian comparisons automatically.

**Checks.**

- The functional gives ⟨1⟩=1, ⟨w_iw_j⟩=h(Λ⁻¹)_ij and all odd monomials zero. In one variable ⟨w⁶⟩=15h³C³, not 9h³C³.
- With m=1,k=0, the corrected ψ has no residual w²/h or constant h⁰w⁰ term. The uncorrected expression has both.
- With m=2 its linear subtraction is `Li₁(u²)w/(2h)`. A denominator 4 fails the stationary equation.
- A constant integrand under affine shift acquires the scalar exponential. For `A=((2,1),(1,1))`, the shift moves both Gaussian coordinates.
- For A=0 the final two-variable collection factors into reciprocal Pochhammer series. Its regularity must be coefficientwise in each variable, not merely in total degree.
- At A=1,m=3 the refined recurrence's sign is negative. Inverting its recursion factor before taking x=0 is essential.

### 5.7 The coefficient scheme and rank-one WKB structure

Define the nondegenerate deformed solution algebra

```text
S_A=ℤ[t_i,t_i⁻¹,z_i,z_i⁻¹,T] /
       (1−z_j−(−1)^(A_jj)t_j∏_i z_i^(A_ij), δ_A T²−1),
S_A^(m)=S_A[1/m,ζ_m,t_i^(±1/m)].
```

The equations are interpreted after clearing the displayed Laurent monomials by units. Prove the universal evaluation property, permutation/base-change laws, all constant-one formal branch evaluations where defined, and étaleness over `ℤ[1/2,t_i^±1]`. The Jacobian of the z-equations is invertible after δ, and the derivative 2δT is invertible after 2. The localisation by t_i⁻¹ must not be described as an étale map over all of ℤ[t] without its localisation. Root variables w_i with w_i^m=z_i form a further Kummer étale extension after m; they are not already in S_A^(m). Sources: GSWZ (36)–(37), pp. 13–14 and the coefficient-ring discussion in §2.7, pp. 34–36. *Needs:* §1.2, §5.2, Laurent polynomial rings, localisations and the étale Jacobian criterion.

For rank one define a separate WKB normalisation

```text
W_A(t,h)=F_A((−1)^A exp(−Ah)t,exp h),
W_A(t,h)−W_A(exp(h)t,h)=t W_A(exp(Ah)t,h),    W_A(0,h)=1,
G_A=W_A(exp(h)t,h)/W_A(t,h)
   =z₀(t)exp(∑_{k≥1}b_k(t)h^k),
log W_A=∑_{k≥−1}c_k(t)h^k,                 c_k(0)=0.
```

Here z₀ is the unique constant-one solution of the **unsigned deformation** `1−z₀=tz₀^A`; it is not the signed z(t) at the same t when A is odd. Put `X=(t/z₀)z₀'` and `Δ_X=X(AX+1)((A−1)X+1)`. Prove `t∂_t=Δ_X∂_X` on rational functions of X and the WKB recursions: `b₁=A(A−1)X²/2`, `b_k∈XΔ_X·ℚ[X]` for k≥2, and `c_k∈Xℚ[X]` for k≥1. The definitions and q-system fix these sequences and their zero constants; they are not arbitrary coefficients. For negative A derive the quotient recurrence by signed telescoping, rather than reading a product with negative length. This is the rank-one algebraicity route of GSWZ (140)–(162), Lemma 2.16 and Corollary 2.17, printed pp. 33–35. It is independent of the Gaussian comparison. No arbitrary-rank polynomial WKB theorem is inferred. *Needs:* §5.2's exact rank-one q-system, the exponential substitution and formal differentiation.

**Checks.**

- T is a unit and encodes a chosen square root of δ⁻¹. Adjoining T does not identify its two components.
- At rank zero S=ℤ[T]/(T²−1); after 2 this is étale with two components. The formal branch T=1 loses the other component.
- At A=3,t=1, `δ=−z²−z−2`; the primes dividing its norm 23 must be inverted for the nondegenerate specialisation.
- At A=0 or A=1 the displayed b₁ is zero. At A=3 its coefficient is 3X², with z₀=1−t+3t²−12t³+… and X=−t+5t²−28t³+…. The signed branch instead has z=1+t+3t²+12t³+…; using it without the change of variable fails the q-system.
- Substituting a ramified or δ=0 solution is excluded even if it satisfies the undeleted Nahm equations.

### Examples

A=3 simultaneously checks the sign of the difference equation, the finite-support polynomials q³,q⁷,q¹⁰+q¹¹+q¹³, the coefficients of z and V, and the negative residue at the second root. The two-variable matrix `((2,1),(1,1))` is a second essential test: its mixed coefficients cannot be reconstructed from diagonal rank-one computations. The A=0,m=2 congruence series is the boundary example that forces the enlarged level coefficient ring.

### Dependencies

Layer 1 only for shared equations and discriminants; QSeriesPartitionsAndMockModularForms layer QM.0, Polylogarithms Layer 1, StandardDistributions Layers 1 and 5, and pinned formal-series and matrix carriers. Formal admissibility uses the orbit proof and is independent of the unresolved global Gaussian normalisation and mixed regularity comparisons. The refined level theorem and the Gaussian route to arithmetic membership explicitly require those comparisons and the corrected level cancellation.

## Layer 6: Frobenius and Habiro module membership

### 6.1 Full coefficient algebras and divisibility transfer

For p∤2m use the unique Frobenius lift on the p-completion of S_A^(m), and on its Kummer extension w_j^m=z_j. It covers `t_j^(1/m)↦t_j^(p/m)` and ζ_m↦ζ_m^p, lifts z_j↦z_j^p modulo p, and acts on the square-root generator T on every component. Prove its functoriality, commutation with root-coordinate substitutions and compatibility with every nondegenerate étale specialisation. These are applications of HabiroRings layer HR.1's étale Frobenius theorem, with the coefficient algebra of §5.7, rather than a new construction of Witt Frobenius. Source: GSWZ §2.7, (169)–(170), pp. 36–37. *Needs:* §5.7 and the étale Frobenius supplier.

Define `pSaturatedMap ι` for a commutative-ring homomorphism ι:S→T by the condition that `ι(a)∈pT` implies a∈pS. Its API includes composition and the transfer of p^n-divisibility for every n when p is a non-zero-divisor in T. Prove it by division at one power and induction. When p is a non-zero-divisor in T and ι is injective, equivalently the image of S[1/p] intersects T in the image of S. For a product target, require jointly faithful reduction modulo p on all factors. Injectivity after inverting p is insufficient. The comparison `fullCoefficientDivisibilityTransfer` must establish this condition for the actual coefficient algebra, or replace the branch argument by an intrinsic proof of the Frobenius congruence on that algebra. This is an independent target in the passage from formal admissibility to GSWZ Theorem 4, (39), p. 14 and its proof (170), pp. 36–37.

A chosen formal branch is not in general faithful. At A=5,p=5, the relation is `t=(z−1)z⁻⁵` and `δ=z⁻⁵(5−4z)`. Modulo 5 the square-root extension has `T²=z⁴`, with maps T↦±z². The normalised branch has T=z². Thus T−z² vanishes there but is nonzero on the other component, where its value is −2z². The inverted t variable makes the branch a Laurent-series map; this does not remove the second component. This counterexample prevents using étaleness alone to infer the required reduction injectivity.

The `fullCoefficientFrobeniusCongruence` target is, for p>3, p∤m and every permitted k,

```text
log F_{A,m,k}(t^(p/m),q^p)−p log F_{A,m,k}(t^(1/m),q)
                  ∈ (p/x) Ŝ_A,p^(m)[w][[x]],  q=ζ_m+x,
```

interpreted through the corrected Gaussian comparison and with coefficient Frobenius on the first term. Its coefficients, including the polar and constant terms, lie on the full algebra. Before this transfer, the Dwork identities of Layer 5 only prove the statement after the appropriate formal expansion. Name `gaussianCoefficients_fullAlgebra` for the preceding coefficient-localisation theorem: after removing the displayed volume, determinant and cyclic factors, every Gaussian coefficient lies in the stated S_A^(m) Kummer localisation, with only its explicit rational denominators before the p-integrality argument. Prove this by finite Wick contraction at each weight, retaining all components and proving descent for the finite refined sum (GSWZ Lemmas 2.12–2.13, (125)–(129), pp. 30–31). The p=2,3 assertions in the unrestricted version of GSWZ Theorem 4 are separate small-prime targets; the arguments here use 1/2,1/3 and establish neither by omission. *Needs:* §5.5–§5.7, fullCoefficientDivisibilityTransfer and the potential/constant congruences below.

**Checks.**

- The identity ℤ_p→ℤ_p is p-saturated; induction transfers all powers.
- The map `ℤ_p[u]/(u²−1)→ℤ_p`, u↦1, loses u−1 and fails the reduction hypothesis for odd p.
- For A=5,p=5 both maps T↦±z² satisfy δT²=1. The negative component detects the nonzero element that the normalised branch loses.
- A split quadratic coefficient algebra keeps both factors; Frobenius and gluing cannot be checked only on the positive square-root branch.
- In rank zero the z-equations disappear but the two square-root components still remain after 2 is inverted.

### 6.2 A first-jet integrality calculation

Define `regularisationJet(C,b,Q,T₃,U₄,c)` over a characteristic-zero field, for a finite coordinate set, by

```text
c +½∑_iQ_iC_ii +½∑_{i,j}b_i b_j C_ij
  +½∑_{i,j}T₃,i b_j C_ii C_ij +⅛∑_iU₄,i C_ii²
  +⅛∑_{i,j}T₃,i T₃,j C_ii C_jj C_ij
  +1/12∑_{i,j}T₃,i T₃,j C_ij³.
```

For symmetric C this is the coefficient of h in the Gaussian integral of
`exp(∑b_iw_i+½∑Q_iw_i²+∑T₃,iw_i³/(6h)+∑U₄,iw_i⁴/(24h)+hc)`.
Prove the identity by Wick contractions, its naturality under coefficient maps and coordinate permutations, its value c for zero covariance, and integrality in any subring containing 1/2 and 1/3 and all displayed inputs. This finite polynomial also makes sense for nonsymmetric C, but the Gaussian interpretation requires symmetry. Source: GSWZ (110), (114), (118), pp. 28–30 with the corrected remainder in §5.6. *Needs:* §5.6's Wick formula; the polynomial itself uses only finite sums.

For a nondegenerate solution over a number field K, choose Δ divisible by 6, disc K, M_K and all denominators required for z_i,z_i⁻¹,(1−z_i)⁻¹,δ⁻¹. At p∤Δ and m prime to Δ take the full finite étale algebra
`O=R̂_p[ζ_m,T,w]/(δT²−1,w_j^m−z_j)`, R=𝒪_K[1/Δ]. For 0≤k_j<m put C=Λ_A⁻¹, y_{j,a}=ζ_m^(k_j+1+a)w_j and s_{j,a}=(k_j+1+a)/m. The regularised single refined piece has first relative x coefficient `ζ_m⁻¹ regularisationJet(C,b,Q,T₃,U₄,c)`, where

```text
b_j=(Ak)_j+A_jj/2+∑_a B₁(s_{j,a})Li₀(y_{j,a}),
Q_j=∑_a B₁(s_{j,a})Li_(-1)(y_{j,a}),
T₃,j=mLi_(-1)(z_j),       U₄,j=m²Li_(-2)(z_j),
c=N/24+∑_j(m/2)∑_a B₂(s_{j,a})Li₀(y_{j,a})
        −∑_j∑_{r=1}^{k_j} rζ_m^r/(1−ζ_m^r).
```

Prove this coefficient lies in O. The product over the m conjugate denominators is 1−z_j, a unit, and 1−ζ_m^r is a unit at p∤m for 0<r<m. The Hessian inverse is integral because δ is inverted. The term N/24 comes from Euler normalisation; the last finite sum comes from the restored `(q;q)_{k_j}` factor. Divide only by an individual refined leading constant, after adjoining its finite roots; a sum of such constants may be zero. This gives `refinedLinearCoefficient_integral`, the local linear-coefficient input to the owner's Dwork generator criterion (GSWZ §3.2, (184)–(195), pp. 39–41). *Needs:* gaussianGlobalNormalisation, the explicit single-piece prefactor and §6.1's full coefficient algebra.

**Checks.**

- In rank one, C=T₃=1 and all other inputs zero give 5/24, using the sixth Gaussian moment.
- C=b=T₃=1 and the other inputs zero give 29/24. Omitting the mixed linear-cubic contraction gives 17/24.
- C=U₄=1 alone gives 1/8; C=b=1 alone gives 1/2. The empty-coordinate case gives c.
- At A=3,m=1 the jet is `−(z−1)(28z²−99z+108)/(12(2z−3)³)`. Substituting `t=(z−1)z⁻³` in the rational first correction of GSWZ (242), p. 49, gives exactly this expression. The exponential in this comparison is exp(V/h), h=log(1+x); retaining a literal exp(V/x) instead introduces exp(V/2) into the leading factor and −V/12 into the first relative coefficient. Removing N/24 changes the jet by −1/24.
- Changing the w_j roots permutes the coefficient components. Vanishing of the total constant does not invalidate membership in their local span, but does prevent normalising that sum by its constant.

### 6.3 The modified potential and the local regulator

Consume from PadicHodgeRegulators layers D.1, D.3 and D.4 the unramified p>3 isomorphism
`D_p:K₃(K_p;ℤ_p)≃p²𝒪_{K_p}`, its compatibility with the Bloch presentation, and generation by root-of-unity classes; from ColemanIntegration Layer L2 consume the reflection identity and integral modified polylogarithms. This is the exact local input of GSWZ Lemma 3.1, Propositions 3.2–3.3 and Theorem 9, (174)–(183), pp. 37–39. The lattice and comparison are supplier targets, not established merely by having a function named Li₂.

Write `φ_p(z_i)=z_i^p exp(pη_i)`, where η_i is defined by the convergent logarithm on 1+pŜ_p, and β_j=∑_iA_ijη_i. Put y_j=1−z_j. Define the algebraic p-adic expression

```text
W_p=p∑_jℓ₂(y_j)+p∑_jβ_jℓ₁(y_j)−(p/2)∑_{i,j}A_ijη_iη_j
    −∑_j∑_{r≥2} p^(r−1)β_j^r Li_(2−r)(y_j^p)/r!.
```

The ℓ_s are the supplier's integral modified polylogarithms; for s≤0, Li_s is its rational function on units with 1−y invertible. Prove convergence, W_p∈pŜ_p and equality with `V_A(t^p)/p−pV_A(t)` on the normalised formal branch. Supply coefficient-map naturality and compatibility with all components, using the intrinsic formula rather than a logarithm of arbitrary z-units. This is the corrected target replacing GSWZ Lemma 2.13, (130), (132)–(135), pp. 31–32. If every η_i=0 its value is p∑ℓ₂(y_i); the sign of the linear ℓ₁ term is positive. *Needs:* étale Frobenius, modified-polylogarithm integrality and §5.3's critical formula.

At t=1, the Iwasawa branch has log(−1)=0, so
`log(1−z_j)=∑_i A_ij log z_i`. The reflection identity gives

```text
−∑Li₂(1−z_j)−½∑A_ij log z_i log z_j
 =∑(Li₂(z_j)+½log z_j log(1−z_j))=D_p(ξ).
```

This has positive D_p sign and no complex ζ(2) constant. Prove `modifiedPotential_regulatorSpecialisation`: the actual map of p-complete coefficient algebras at the nondegenerate t=1 point sends W_p to
`φ_p(D_pξ)/p−pD_pξ∈pB̂_p`, B=R[T]/(δT²−1). This uses Coleman continuation in each punctured-line variable y_j and the explicit expression above. It never evaluates an arbitrary formal series V_A(t) at t=1. It identifies the principal part of the local section
`f̂=exp(D_pξ/(m²log(q/ζ_m)))f` with the Frobenius logarithmic defect. The independent constant-term congruence is
`log φ_p(δ⁻¹U_{m,k}²)−p log(δ⁻¹U_{m,k}²)∈pŜ_p^(m)[w]`, using the quotient of a unit and its p-th power to define the logarithm. Source: GSWZ (130)–(136), pp. 31–32 and §3.1, (174), p. 37. *Needs:* the full algebra congruence, refined constants and the local regulator suppliers.

**Checks.**

- With ξ=0 the regulator defect is zero. A complex reflection identity with π²/6 is inapplicable to this computation.
- For a coupled 2×2 A the off-diagonal logarithmic term occurs twice before multiplication by 1/2.
- A formal t-series can diverge at t=1 even if each coefficient is algebraic. W_p's convergent p-adic formula is the object specialised.
- The regulator sign does not determine whether a finite Chern class or its inverse indexes the Kummer torsor. That comparison is required separately next.

### 6.4 Kummer orientation, coefficient extension and membership

Let ξ be the integral Bloch/K₃ class of a nondegenerate signed solution over K, retaining the convention-change choices from Layer 1. Let `ε_m(ξ)=c_{ζ_m}(ξ)²` denote the exact finite Chern class exported by HabiroNumberFields Layers 0–1. Prove `nahmConstant_kummerOrientation` on the universal Kummer algebra. The full cyclic product and fractional product satisfy `D_fractional(w)^m=D_ζ(w)`; the product `∏D_ζ(w_j)/D_ζ(1)` is P_ζ(ξ) modulo m-th powers. The cyclic factor appearing in the corrected U_m has the inverse P class. Track the additional z-powers, square-root determinant, finite k-sum and normalisation to identify its class with ε_m, including whether the supplier's Chern map agrees with R_ζ or its inverse. The module index cannot be chosen merely to make this identity hold.

The precise constant targets are: each individual refined constant is a unit in its ε_m^(1/m) torsor after the required finite-root scalar extension, and the full constant lies in
`δ⁻¹/² ε_m(ξ)^(1/m) K[ζ_m]`. The full constant may be zero. Changing representatives of ε_m changes the chosen root by the corresponding unit and preserves the torsor. Source: GSWZ corrected (121)–(124), pp. 30–31 and proof of Theorem 5, p. 43; CGZ (7)–(8), p. 3 and (20)–(21), pp. 10–11. *Needs:* gaussianGlobalNormalisation and the supplier's actual finite-Chern orientation theorem; the regulator calculation alone is insufficient.

Define `nahmSpecialisationAtOne` on the finite presented coefficient algebra S_A by t_j↦1, z_j↦the specified signed solution coordinate and T↦the corresponding generator of B. Its level-m extension sends t_j^(1/m)↦1 and w_j↦a specified m-th root of z_j in the Kummer extension of B. Prove the equations and localised units are preserved, uniqueness on these generators, naturality under field maps and root changes, and commutation with the Frobenius maps wherever the specialisation extends to the p-completions. This is an algebra map on a finite presentation; it is not evaluation of an arbitrary t-adic power series at t=1. Its source and target retain every square-root component. Source: GSWZ §2.7, (169)–(170), pp. 36–37 and Theorem 5, p. 43. *Needs:* §5.7, the chosen solution, Kummer roots and the unit conditions of the conventions.

Use the full finite étale coefficient algebra B=R[T]/(δT²−1), including the split case. Enlarge Δ to include the exceptional integers for its number-field factors. Consume from HabiroNumberFields Layer 3, as supplier targets there, the scalar extension of `H_{R,ξ}` to B, its local generator criterion on all factors, Kummer descent, tensor products, inversion and effective global module descent. The local form of a generator includes
`δ⁻¹/²ε_m^(1/m)(Oˣ+xO+x²K[[x]])`, so its linear coefficient is integral. A general element is a local span of generators and can have zero constant. This is a supplier extension of the module, not a second definition of one (GSWZ Definitions 1.3–1.4, pp. 9–10).

State `nondegenerateNahm_habiroMembership`: for symmetric integral A, a signed solution with δ≠0, R=𝒪_K[1/Δ] as above, and the K₃ lift fixed by the supplier, the Gaussian collection at that solution is an element of `H_{B,ξ|B}`, on orders prime to Δ. Its proof must verify all of the following: the corrected full Gaussian comparison, fullCoefficientDivisibilityTransfer and the full Frobenius defect, the first-jet calculation, modifiedPotential_regulatorSpecialisation, nahmConstant_kummerOrientation, the finite étale module extension, and the all-order product gluing in §6.5. This is the precise content sought from GSWZ Theorem 5 and Corollary 1.11, pp. 14–15. An unresolved supplier descent or Gaussian comparison remains a proof obligation of this theorem. Neither δ≠0 nor an integral-looking constant term alone proves membership. *Needs:* §§6.1–6.3 and the explicitly listed comparisons.

**Checks.**

- If δ=a²∈Kˣ, B⊗ℚ is K×K; picking T=a⁻¹ is one factor, not an embedding of the entire B.
- For the figure-eight solution the leading constant is (−3)⁻¹/⁴. It needs the determinant-root extension, even though the solution field is ℚ(√−3).
- The order m must be prime to Δ; p|m and the excluded field primes are not covered by the local generator test.
- A sum with cancelling constants can belong to the module without being a generator. Membership must not be phrased as nonvanishing at every root.
- A signed knot matrix can be singular or indefinite. Positivity of the analytic datum is not a hypothesis of this endpoint.
- Specialising the signed cubic sends its defining equation to z³−z+1=0. Rotating an m-th root changes the level map by the corresponding Kummer automorphism.
- A proposed specialisation with z=0 or δ=0 cannot preserve the localised units. Evaluating the infinite series ∑tⁿ at t=1 is undefined and is not this finite-presentation map.

### 6.5 Auxiliary systems and the all-order gluing target

For a unit q, γ≥1, arbitrary signed shifts μ=(μ₁,…,μ_γ),ν and arbitrary formal series F⁺,F⁻ over a commutative coefficient ring, define two auxiliary products:

```text
Ψ_{μ,ν}(t)=∏_{i=1}^γ F⁺(q^(γμ_i)t^γ) F⁻(q^(−ν)t),
P_{μ,ν}(t)=∏_{i=1}^γ F⁺(q^(γμ_i)t)   F⁻(q^(−ν)t).
```

Their constant coefficient is `F⁺(0)^γF⁻(0)`; supply coefficient-map naturality and the signed rescaling API. With `R_aF(t)=F(q^a t)` and `S_γF(t)=F(t^γ)`, the positive factors of Ψ are `S_γ(R_{γμ_i}F⁺)`. The reversed composition `R_{γμ_i}(S_γF⁺)` gives q^(γ²μ_i), so the order of these operations matters. In the Nahm application `F⁺=F_A(−,q^γ)`, `F⁻=F_A(−,q⁻¹)`. Write E_ij for an increment of μ_i at coordinate j and A_j for column j. Then prove

```text
P_{μ,ν}−P_{μ+E_ij,ν}
 =(−1)^(A_jj)q^(γ(A_jj+μ_ij))t_j P_{μ+e_i⊗A_j,ν},
P_{μ,ν}−P_{μ,ν+e_j}
 =(−1)^(A_jj)q^(−A_jj−ν_j)t_j P_{μ,ν+A_j},
P_{μ,ν}(…,q^γt_j,…)=P_{μ+1⊗e_j,ν−γe_j}.
```

For Ψ the first t_j is t_j^γ and its covariance is instead
`Ψ(…,qt_j,…)=Ψ_{μ+1⊗e_j,ν−e_j}`; the second equation is unchanged. Prove uniqueness of either complete parameter family with constant one over a commutative coefficient ring when every q^n−1, n>0, is a non-zero-divisor; over a field this is exactly q^n≠1. Mere nonvanishing in a product ring is insufficient. For the difference of two families, induction on total degree makes the first two equations remove parameter dependence at that degree, and covariance forces `(q^(γα_j)−1)c_α=0` for P, or `(q^α_j−1)c_α=0` for Ψ. This works in ℚ(ζ_m)((x)) with q=ζ_m+x; its constant ζ_m having finite order is irrelevant. Sources: GSWZ proof of Theorem 5, (211)–(214), pp. 43–44, with the appropriate covariance for each product. *Needs:* §5.2's exact full-column system.

The `unpoweredProduct_integralGluing` target concerns P, not Ψ. At gcd(m,γ)=1 take root expansions using
`x↦(ζ_m+x)^γ−ζ_m^γ` and `x↦(ζ_m+x)⁻¹−ζ_m⁻¹`, with coefficient-root transport. After level substitution t↦t^(1/m), its Gaussian expression must have all coefficients in
`S_A^(m)[1/(Δγ)][[x]]`; locally this is required at every p∤Δγ, and its root reexpansions must satisfy coefficient-Frobenius gluing. At zero shifts the principal parts cancel. Specialising at t=1 gives
`f(q^γ)^γ f(q⁻¹)∈H_{B[1/γ]}` on the required good orders. Uniqueness identifies two already constructed expressions; it proves no integrality estimate on its own. A proof of all-order coefficient integrality and compatibility with the completed coefficient algebra is a separate required target.

The powered product is a valid auxiliary q-system, but its principal part at zero shifts is `(V_A(t^γ)−V_A(t))/(m²h)`, generally nonzero. It cannot supply this gluing theorem. Inverting γ in the conclusion is essential; integral coefficients at p|γ are false. These corrected contracts replace an inference from formal q-difference uniqueness to integral Habiro gluing in the proof of GSWZ Theorem 5.

**Checks.**

- At γ=2,q=2,F⁺=t,F⁻=1,μ₁=μ₂=1,ν=0, Ψ=16t⁴ and P=16t². The reversed rescaling error gives 256t⁴.
- At γ=1,q=2,F⁺=1,F⁻=t,ν=1 either product is t/2. Negative shifts are allowed.
- At γ=1,q=2,F⁺=t₁+t₂ and μ=(1,−1), the positive factor is 2t₁+t₂/2.
- For `A=((2,−1),(−1,3))` and `A=((0,1),(1,−2))`, use nonzero signed μ,ν to test all three equations. A diagonal-only shift fails in degree t₁t₂.
- Over K×K, q=(2,1) is not a root of unity but q−1 kills the second component. The uniqueness proof requires regularity, not mere nonvanishing.
- With A=0,γ=2 the powered principal part is `−Li₂(t²)+Li₂(t)`, which is nonzero.
- With A=0,m=1,γ=5, the t coefficient of the unpowered product is
  `5/(1−q⁵)+q/(q−1)=3−2x+x²+x³/5+…`, q=1+x. At A=3 its analogous x³ coefficient is 3224/5. The p=5 integrality assertion requires 1/γ.

### 6.6 Descendants, powers and the converse

For ν∈ℤ^N and q=ζ_m+x define the descendant curve by `t_j^(1/m)=q^(ν_j)`, hence `t_j=q^(mν_j)`. It has t(0)=1. Define `descendantPullback` by formal étale lifting from a chosen nondegenerate t=1 point, giving z_j(x),δ(x),T(x),w_j(x) with the prescribed constants. Supply uniqueness, ν=0 recovery, signed-shift compatibility and root-coordinate functoriality. Pull back the entire Gaussian expression, including its varying determinant/cyclic prefactor and principal part. This is not a constant map S_A→B, and it is not the same t=q^ν convention at every level. Prove `descendantFrobeniusTransport` and `descendantProductTransport` at all orders before asserting membership in the corresponding module. Source: GSWZ Remark 3.11, p. 44 and (222), p. 46. *Needs:* δ invertible, the formal étale lifting supplier, §6.4 and §6.5.

Using the owner's tensor product law, prove `torsionPower_goodOrders`: if nξ=0 with its integral convention and lift specified, then f^n belongs to the good-order Habiro ring over the determinant coefficient algebra. An unrestricted all-root power theorem needs the cyclic five-term identity and all-root gluing, including orders dividing the torsion order; give that extension as `torsionPower_allRoots`, with those additional targets. It is not formal scalar extension from the restricted collection. Symmetrisation at γ=1 is a separate route to an all-root element, developed in Layer 7; its determinant factor δ⁻¹ is already in R.

Prove `powerMembership_implies_torsion`: if a fixed positive power f^n belongs to the specified ring and the relevant root constants are nonzero at an unbounded set of good orders, use their Kummer classes and finite Chern injectivity to force ξ torsion through the same finitely generated quotient as §4.4. A zero collection or vanishing constants do not imply torsion. Sources: GSWZ Corollary 1.11 and Remark 1.12, p. 15; CGZ Corollary 7.2 and Theorem 7.5, pp. 36–40. *Needs:* the constant orientation, the owner's tensor law and finite Chern injectivity.

**Checks.**

- ν=0 gives the original collection. At m=2,q=−1+x,ν=1 the curve is `t=q²=1−2x+x²`; using t=q starts at the wrong point −1.
- At m=1,ν=−1 gives `(1+x)⁻¹=1−x+x²−…`, a valid curve.
- Knowing only the value of a prefactor at x=0 misses its linear coefficient under this curve.
- A torsion statement in the rational Bloch group does not choose an integral K₃ lift or trivialise its small-primary ambiguity.
- The zero series belongs to every ring but supplies no nonzero Kummer class for the converse.

### Examples

The A=5,p=5 square-root calculation is a necessary counterexample in the transfer proof. The first-jet formula is an explicit independent test of the corrected Gaussian normalisation. The γ=5 calculation shows why the global product condition takes values over B[1/γ]. Together they separate three requirements: a formal identity, integral coefficients on every coefficient component, and arithmetic gluing across root coordinates.

### Dependencies

Layer 5; HabiroRings layer HR.1; HabiroNumberFields Layers 0–3, with the full finite étale extension and effective descent specified; ColemanIntegration Layer L2; PadicHodgeRegulators layers D.1, D.3 and D.4. Membership and descendant membership retain all stated normalisation, mixed-regularity, level-cancellation, full-algebra transfer, Kummer-orientation, product-gluing and pullback obligations. Small-prime improvements and unrestricted torsion powers require their additional proofs.

## Layer 7: explicit collections and exports

### 7.1 Symmetrisation and residues

For a symmetric integral A define the rational summation kernel

```text
J_A(t,w,q)=∑_{n∈ℕ^N}(−1)^(diag(A)·n)
           q^((nᵀAn+diag(A)·n)/2) w^(An)t^n
           /∏_j(qw_j;q)_{n_j},
P_i(Z)=(−1)^(A_ii)(1−Z_i)⁻¹∏_j Z_j^(A_ij).
```

Its expansion at q=ζ_m+x has coefficients in the localisation generated by t_i,w_i^±1 and `(1−t_i^mP_i(w^m))⁻¹` over ℤ[ζ_m]. Prove this by splitting each summation index into a residue and a multiple of m and summing the resulting geometric-polynomial series. Supply permutation, block-sum, root-change and coefficient recursion APIs for J; it is a Nahm-specific rational kernel, not a new general q-binomial object (GSWZ §4.1, (215)–(217), pp. 44–45).

Fix the constant-one deformed solution z(t). Define `nahmSymmetrisation_m` as the sum of the multivariate residues at its m^N Kummer roots w^m=z(t) of
`∏_i t_i^(−1/m) J_A(t^(1/m),w,ζ_m+x)∏_i dw_i/w_i`.
The multivariate residue is at this one nondegenerate z-branch; it does not sum over every algebraic solution of the Nahm equations. Define shifted residues by inserting the factor and argument changes `q^ν w^(μ+ν)J_A(q^μt^(1/m),w,q)`, with independent μ,ν∈ℤ^N. Supply linearity, Kummer-root permutation, branch evaluation and base-change APIs.

Prove `nahmSymmetrisation_product`: the residue family equals the root expansion of `F_A(t,q)F_A(t,q⁻¹)`. The shifted identity follows from the complete two-parameter q-difference system and its constant-one uniqueness; the residue Jacobian supplies the same normalisation. At x=0 the formula is the finite sum

```text
1/(m^Nδ_A(t)) ∑_{w^m=z(t)} ∑_{n∈(ℤ/m)^N}
  (−1)^(diag(A)·n) ζ_m^((nᵀAn+diag(A)·n)/2)
  w^(An) t^(n/m) /∏_j(ζ_m w_j;ζ_m)_{n_j}.
```

The exponent is the integral formal exponent; it needs no arbitrary square root of ζ. At m=1 this reduces to δ_A(t)⁻¹. The all-order coefficients have their rational algebraic continuation on the nondegenerate solution scheme. Prove `residueDescendant_habiro`: for a reduced zero-dimensional t=1 solution algebra, with 6, its discriminant and δ inverted, the specialised shifted residue collection belongs to the number-field Habiro ring. This gives an all-root symmetrisation and its descendants without choosing δ⁻¹/². It uses the corrected Frobenius and product compatibilities of Layer 6 and the owner's ring gluing; a rational residue at each root alone does not prove that compatibility. Sources: GSWZ Theorems 11–12, (218)–(231), pp. 45–47. *Needs:* §§5.2–5.3, §§6.1–6.6 and finite residue algebra; no topological invariant theorem.

**Checks.**

- At rank zero J=1 and the residue in zero variables is 1. The empty determinant contributes no extra scalar.
- For A=0, J is the reciprocal Pochhammer kernel; the product identity agrees with Euler's two identities.
- For A=3,m=1, the residue is δ⁻¹∈1+tℤ[[t]]. Summing the residues at all three Nahm roots instead gives −1/t and fails this constant-one test.
- Changing the order of Kummer roots leaves the finite sum unchanged. Dropping the factor m^N fails already for m=2 in rank one.
- μ=ν=0 gives ordinary symmetrisation. The shifted identity retains both parameter families; collapsing them loses a q-shift equation.

### 7.2 The signed cubic and its small primes

Take A=3, z³−z+1=0 and K=ℚ(z). The discriminant is −23 and 𝒪_K=ℤ[z]. Prove the exact identities

```text
δ=−z²−z−2,      δ⁻¹=(2z²+3z−9)/23.
```

Apply the general residue theorem over `R₆=ℤ[z,1/138]`. At order one the unshifted collection begins

```text
Ψ₁(x)=(2z²+3z−9)/23
       +0x+(−6477z²−5311z+4318)x²/23⁴+O(x³).
```

Compute the coefficients by exact polynomial reduction, not numerical recognition. For the ratio G=F_3(qt,q)/F_3(t,q), prove that its x-expansion `∑g_k(t)x^k` satisfies g₀=z(t) and `δ(t)^(3k)g_k(t)∈ℤ[t^±1,z]`, using the Riccati equation `1−G+q³tG(t)G(qt)G(q²t)=0`. For its product exponents prove
`z(t)=∏_{n≥1}(1−t^n)^(−n s_n)`, with `s_n=∑_i c_{n,i}` and initial values `1,1,3,10,40,171`. Also prove `cubicDT_nonnegative` and `cubicDT_support`: c_{n,i}≥0, and for n≥2 the support lies in `3n+1≤i≤n²+n+1`, with c_{1,3}=1 as the exception. These require a positive coefficient or combinatorial recursion for the cubic series; they do not follow merely from finite support for an arbitrary A. The n=3 row is 1,1,0,1 in degrees 10 through 13. These are targeted rank-one integral recursions, not a claim of arbitrary-rank WKB polynomiality. Sources: GSWZ Example 4.1, (231), p. 47 and §4.2, (234)–(249), pp. 48–50. *Needs:* §§5.2–5.4 and §7.1.

Prove the useful formal identity

```text
F_3(t,q)F_3(t,q⁻¹)=∑_{k≥0}q^(−k(k+1))[3k+2 choose k]_q t^k
                       ∈ℤ[q,q⁻¹][[t]].
```

This is Garoufalidis–Wheeler Proposition 1.14, (47), p. 11, proved by (173), p. 30. It does not justify summing the t-series at t=1. Use q-Lucas from the q-series supplier to evaluate its constant term at a root. Write T^m=t, `a_ℓ=⌊(3ℓ+2)/m⌋`, `b_ℓ=(3ℓ+2) mod m`. The finite numerator is

```text
δ(t)⁻¹ ∑_{ℓ=0}^{m−1} z(t)^(a_ℓ−2) ζ_m^(−ℓ(ℓ+1))
                              [b_ℓ choose ℓ]_{ζ_m} T^ℓ.
```

For m=2 this is `(z(t)⁻¹+T)/δ(t)`, with z=1+tz³. The missing z⁻¹ in the numerator of Garoufalidis–Wheeler (182), p. 31, must be repaired before using that proof of its Theorem 1.13.

State `cubicSmallPrimeDescent`: the residue descendants descend from H_{R₆} to `H_{ℤ[z,1/23]}` if every coefficient of every root component lies in that smaller ring and the Frobenius reexpansion equations hold at p=2 and p=3 for every m, including orders divisible by those primes. These are two additional all-order local targets. The first few coefficients and the corrected m=2 constant do not establish them. The unshifted route through Garoufalidis–Wheeler Theorem 1.13, pp. 11 and 30–31, requires the corrected numerator and its own complete integrality/gluing argument. *Needs:* §7.1 over R₆, q-Lucas and the stated small-prime inputs.

**Checks.**

- The cubic polynomial has discriminant −23; the unsigned analytic A=3 polynomial instead has discriminant −31.
- The t coefficient of the formal symmetrisation is `q⁻²+q⁻¹+1+q+q²`; it evaluates to 5 at q=1 and 1 at q=−1.
- At q=−1 the t² coefficient is 4. The corrected numerator expands as `1+T+4T²+5T³+21T⁴+28T⁵+…`; `(1+T)/δ(t)` incorrectly gives 5 at T².
- At m=1 the finite numerator is δ(t)⁻¹. At m=2,t=1 it is `(z⁻¹+1)/δ`.
- The first three order-one coefficients lie in ℤ[z,1/23], but this checks neither higher coefficients nor the p=2,3 equations at other roots.
- The product with s₁,…,s₆ above gives `1+t+3t²+12t³+55t⁴+273t⁵+1428t⁶+…`, checking the sign −ns_n.

### 7.3 A nonabelian quartic with exact certificates

Let `A=((8,5),(5,4))`. First certify the complete torus-solution algebra as the product of two quartic factors: eliminating the second coordinate gives the two polynomials in GSWZ (257)–(258), with any coordinate-hyperplane factor discarded only after unit localisation. The second factor has `u⁴−u³+3u²−3u+1=0`, `v=u³+3u`, field discriminant 229 and S₄ normal closure. Prove these finite algebraic claims and nonvanishing of a Bloch–Wigner regulator for its class by a certified nonzero bound at one complex embedding. Its non-torsion does not follow from merely comparing discriminants. For the other factor choose a root u of `u⁴+u³+3u²−3u−1=0` and define
`quarticCoordinates(u)=(u,v)`, where `v=(−9u³−6u²−25u+37)/5`.
This is the degree-four orbit with D₄ normal closure, not the other S₄ orbit in GSWZ (258). For the distinguished real example choose the embedding whose coordinates lie in (0,1). Supply coordinate extensionality, field-map naturality and exact quotient-polynomial certificates for

```text
1−u=u⁸v⁵,                    1−v=u⁵v⁴,
δ=(753−505u−124u²−186u³)/5,
δ⁻¹=(18+45u−44u²+9u³)/475.
```

Prove u,v,1−u,1−v are units and the determinant definition gives this δ, rather than det A=7. Sources: GSWZ §4.3, (256)–(262), pp. 51–52. *Needs:* §1.2, polynomial quotients and the explicitly specified quartic root.

Put `e=(u³−u²+2)/5`. Prove e²−3e+1=0 and that `(1,u,u²,e)` is an integral basis of 𝒪_K for K=ℚ(u). Its trace Gram matrix is

```text
 4  −1   −5    6
−1  −5   17   −4
−5  17   −1  −15
 6  −4  −15   14
```

with determinant −475. Certify polynomial discriminant −11875, index `[𝒪_K:ℤ[u]]=5`, and `v=−9e−3u²−5u+11`. Norms of u,v,1−u,1−v are −1,1,1,−1; norm δ=9025=5²19². The basis theorem requires maximality, not just the displayed determinant: combine integrality, degree four and the field-discriminant certificate, or give the local maximality checks at 5 and 19. This separates exact finite computations from an assumed implementation of computational number theory (GSWZ (257), p. 51, and (261)–(263), pp. 52–53).

Let `k_K=|K₂(𝒪_K)|` and choose Δ divisible by `6·475·k_K`, enlarging it for any scalar factors required by §6.4. The prime ledger is `{2,3,5,19}∪{prime divisors of k_K}`. It is not known to be exactly the first four primes without a tame-kernel certificate. The module export uses R=𝒪_K[1/Δ], B=R[T]/(δT²−1) and a specified K₃ lift ξ of [u]+[v], conditional on every membership input of Layer 6. For the displayed real expansion put ε=log(1+x)>0, q=(1+x)⁻¹ and define
`quarticNormalisedSum(x)=u⁴v²·f_{A,0,0}(iε/(2π))`.
Here the analytic sum has zero linear and constant terms. Prove `quarticNormalisationComparison`: its unscaled sum equals `F_A((q⁻⁴,q⁻²),q)`, with the analytic evaluation justified by convergence. The canonical formal series at t=(1,1) instead has linear term (4,2). The leading analytic factor is `det(H)⁻¹/²((1−u)(1−v))⁻¹/²`; multiplying by u⁴v² gives δ⁻¹/². With positive real square roots at the distinguished real embedding, establish

```text
quarticNormalisedSum(x) ∼ exp(π²/(15log(1+x))) δ⁻¹/² (1+a₁x+a₂x²+a₃x³+…)
a₁=(−1284u³+384u²−5520u+2047)/(12·25·19²),
a₂=(−3084024u³−11262336u²−1073760u+17201653)/(32·9·25·19⁴),
a₃=(−1185017476284u³+1129707725184u²−5869777630320u+1818824190547)
                                      /(128·81·625·19⁶),
```

Prove the first three coefficients from the corrected Gaussian formula and the Rogers identity giving π²/15. If its ε-series has coefficients c₁,c₂,c₃, the change of variable gives a₁=c₁, a₂=c₂−c₁/2 and a₃=c₃−c₂+c₁/3. These are coefficients of this specified normalised analytic factor. Transfer to the formal Habiro collection must track the integral shift (−4,−2), q-inversion and the scalar u⁴v² through the module operations of Layer 6; it cannot identify the coefficients with F_A(1,1,q) without those operations. The claimed exact relation 60ξ=0 is a separate `quarticBlochOrderCertificate` target: require the owner's explicit integral five-term and convention-change certificate, including a K₃ lift if a K₃ power statement is desired. Regulator numerics and a circle-valued Rogers value do not prove its exact order. Retain `quarticDescendantRankCertificate`: exhibit eight descendant indices, exact q-difference reductions spanning the descendant module over ℚ(q), and a rank certificate giving dimension eight. Computations through degree 27, with denominator `2⁷⁷3⁴⁰5³⁴19⁵²` and denominator `5³³19⁵⁴` after the stated 60th power, are finite coefficient-certificate targets; they do not establish all-order membership or the torsion certificate. Source: GSWZ (259)–(263), pp. 52–53. *Needs:* Layers 1,5–6, the indicated finite arithmetic certificates, K3BlochGroups Layer 6 for the five-term and Suslin-lift certificates, and ArithmeticKTheory layer N.6 for the finite tame kernel K₂(𝒪_K) whose order enters Δ.

**Checks.**

- Omitting the denominator 5 replaces v by 5v and fails the Nahm equations. u=0 is not an admitted root.
- Multiplication of the displayed δ and δ⁻¹ reduces to 1 modulo the quartic; det A=7 does not satisfy this inverse formula.
- The integral e contains a written denominator 5. Confusing the polynomial and field discriminants loses the index-five overorder.
- The four coordinate norms are units in ℤ, while norm δ is not. Inverting only coordinate denominators does not make the solution nondegenerate integrally.
- The selected D₄ orbit and the separate S₄ orbit cannot be interchanged by reusing the same primitive-element formula.
- At the positive real embedding, the displayed a₁ is approximately −0.03163535, whereas the formal h-coefficient of the canonical t=(1,1) sum is approximately −0.82468690. The shift and q-direction distinguish these two expansions; the three displayed coefficients satisfy the exact ε-to-x conversion.
- The complex embedding and its conjugate give opposite regulator values, one dependent pair for this signature (2,1), through Layer 1. A small computed value is neither their exact vanishing nor an exact 60-torsion certificate.

### 7.4 Knot data, figure-eight and the cubic pair

Record the three formal matrices

```text
A_(4₁)=((1,1),(1,1)),
A_(5₂)=((2,1,1),(1,1,0),(1,0,1)),
A_((-2,3,7))=((1,0,1),(0,1,2),(1,2,4)).
```

For a Neumann–Zagier pair (𝒜,ℬ) with ℬ invertible over ℚ and `ℬ⁻¹𝒜` integral, the matrix dictionary is `A=I−ℬ⁻¹𝒜`, with the remaining flattening/linear shifts retained. Supply this algebraic change-of-data comparison and its hypothesis checks. Presentation independence, triangulation invariance, identification with Kashaev or Chern–Simons invariants, and the volume theorem are consumed downstream from ArithmeticQuantumTopology Layers 5–6, not proved by these matrix calculations. Sources: GSWZ Remark 4.2, (233), p. 48; GZ §5, (26)–(31), pp. 8–10. *Needs:* signed formal data and the owner's Neumann–Zagier interface for a topological application.

For the figure-eight matrix, prove z₁=z₂=z, z²−z+1=0, K=ℚ(√−3), disc K=−3 and
`δ=(2−z)/z=−√−3`, for the specified root z=ζ₆ and square-root convention. Its norm is 3. The class is ξ=2[ζ₆], whose Bloch–Wigner value is approximately 2.0298832128 and is nonzero by the positive tetrahedron-volume formula; hence it is not torsion. The geometric equality with a knot-complement volume belongs to ArithmeticQuantumTopology Layer 5. The order-one coefficients are

```text
f₁(h)=(−3)⁻¹/⁴(1+11h/(72√−3)+697h²/(1152(3√−3)²)+…);
f₁(q)f₁(q⁻¹)=(−3)⁻¹/²(1−(q−1)²/27+…).
```

Use h=log q, not q−1, in the first formula. State the normalised Pochhammer comparison
`(−3)^(1/4) f̂(x)(1+x)^(−1/24)(ζ₆²;1+x)_∞³(1−ζ₆)^(−3/2)`
with first terms `1+(5ζ₆−7)x/3+…`; all-order integrality away from 3 is a target requiring the actual coefficient/gluing proof, not the source's finite experiment. For its abelian-field module comparison retain the inverse Frobenius in the HabiroNumberFields scalar convention. Sources: GSWZ (1)–(2), p. 1 and §4.5, (276)–(278), pp. 54–55. *Needs:* §§6.4,7.1 and the cyclic-product supplier.

For the other two knots choose the common cubic trace-field factor K=ℚ(α), α³−α²+1=0, disc K=−23. The 5₂ solution also has a primitive element satisfying u³−u²+2u−1=0. The pretzel solution algebra has another component in ℚ(2cos(2π/7)), so the complete algebras and complete collections differ. Their selected Bloch classes agree modulo the stated 6-primary ambiguity; matching K₃ indices still requires a choice and a comparison. Their q-inverted product in the selected factor has leading scalar

```text
c=(−6α²+10α−4)⁻¹/² (−24α²+32α−26)⁻¹/².
```

Retain both square roots, and prove `−24α²+32α−26=−2(2α²−2α+3)²`. The further simplification printed in GSWZ (280) is not this product. A transported tensor-product statement requires matching module indices and the needed scalar extensions. The computed denominator `2^1997·23^581` at degree 400 is evidence for a coefficient test, not an all-order integrality theorem. Sources: GSWZ §4.6, (279)–(288), pp. 55–57. *Needs:* the selected field factors, Layers 1,5–6 and the supplier tensor law.

**Checks.**

- A_(4₁) is singular and accepted as formal data; its vector (1,−1) excludes analytic positivity.
- `2a₂−a₁²=−1/27` in the figure-eight h-series, and h²=(q−1)²+O((q−1)³), checking the symmetrisation coefficient.
- Its leading fourth root is outside K although its square lies there. The determinant extension cannot be discarded.
- Squaring the displayed scalar c tests the product. Replacing it by `1/(√2(2α²−2α+3))` gives the wrong square.
- Equality of selected trace-field factors is weaker than equality of full solution algebras. The degree-three real pretzel component survives separately.
- Equality modulo 6-torsion of Bloch classes does not canonically identify integral K₃ lifts or global module generators.

### 7.5 p-adic calculations and modular examples

Use Mathlib `HenselianRing.is_henselian` and `IsAdicComplete.henselianRing` for simple-root lifting in general complete coefficient rings; `hensels_lemma` in the p-adic integer file is specifically over ℤ_p and is not used as a theorem over every DVR. For an explicit integral primitive-element polynomial P defining an unramified number-field algebra at p, with p also prime to the power-basis index, factor P modulo p into distinct irreducibles. Import generic Hensel lifting and construct the unique Frobenius images of the generator lifting its p-th power in each residue field. Supply reduction, compatibility between p^n precisions, preservation of P and evaluation of the Nahm coordinates and δ. These finite certificates realise the coefficient Frobenius used above. If a chosen polynomial has bad index at p, change to an integral étale basis rather than infer ramification from its reduction. The algorithm is an application of the existing local-algebra supplier, not a new computational-number-theory prerequisite. Source: GSWZ §4.4, (264)–(275), pp. 53–54. *Needs:* the finite field presentation and Hensel hypotheses as explicit inputs.

Define the scalar `rationalGaussTaylor(m)=a_m` by a_m=1 for m odd, 0 for m≡2 mod4 and 2 for m≡0 mod4; the formula also assigns 2 at m=0, which is excluded from root-indexed assertions. Its associated constant series is `PowerSeries.C a_m`. Prove naturality of that series under coefficient maps, vanishing of every positive-degree coefficient, and `rationalGaussTaylor_eq_gaussSum`: for m>0,

```text
a_m=(1/m)(∑_{k mod m}ζ_m^(k²))(∑_{k mod m}ζ_m^(−k²)).
```

It is independent of the primitive root. Prove `rationalGaussTaylor_mul_odd`: for every positive odd integer p and every m>0, a_pm=a_m. In particular, for odd primes the constant reexpansions satisfy all gluing equations over ℤ[1/2]. At p=2,m=1 they fail over ℤ. Hence the family is in H_{ℤ[1/2]} and not H_ℤ. Define the companion `gaussSquareTaylor(m)=(i/m)(∑_{k mod m}ζ_m^(k²))²`, using ζ_m=exp(2πi/m). Its four values are i,0,−i,**−2**. The polynomial `½(1+i^m)²` instead gives i,0,−i,**+2**; the two are different at m divisible by 4, so the equality printed in GSWZ (290) must not be used there. Prove that the corrected companion satisfies odd-prime Frobenius gluing over ℤ[i,1/2], with conjugation at p≡3 mod4, and that all its positive-degree coefficients vanish. Sources: GSWZ Example 4.4, (289)–(290), p. 57. *Needs:* the Tau Ceti Gauss sums of finite quadratic modules named in the supplier contracts, applied to ℤ/m with k↦k²/m (nondegenerate for odd m; for 4|m quotient by the quadratic radical {0,m/2}; for m≡2 mod 4 the shift k↦k+m/2 changes each term by −1, so the sum vanishes), and HabiroNumberFields Layer 2's gluing criterion.

For a modular Rogers–Ramanujan test define the rational kernel
`J(z,q)=∑_{k≥0}q^(k(k+1))z^(2k)/(qz;q)_k` and its residue family at w^m=ξ, where ξ²+ξ−1=0. Use the same local variable u in q=ζ_m(1−u), then convert to x=−ζ_mu when comparing other sections. Prove rational expansion with denominator `1−z^m−z^(2m)` and constancy of the residues in u. For ξ=(−1−√5)/2 the first residues are
`F₁=−1/2−√5/10`, `F₂=F₃=−1/2+√5/10`, `F₄=F₁`; F₅ depends on the compatible embedding and is 0 or −1. Prove the exact identity
`−5F_m²−5F_m=1` for gcd(m,5)=1 and 0 otherwise, with the resulting collection in H_{ℤ[1/5]}. These facts use the Rogers–Ramanujan modularity of QSeriesPartitionsAndMockModularForms layer QM.1 and the cusp expansion, not merely the field being abelian. Source: GSWZ Example 4.5, (291)–(295), pp. 57–58. *Needs:* the q-series/modular supplier and the residue comparison.

**Checks.**

- For z³−z+1 at p=2, the reduction z³+z+1 is irreducible and separable; Frobenius sends z to z² modulo 2, with a unique lift at every precision.
- The quartic polynomial has index 5, so its mod-5 factorisation is not by itself the field's étale decomposition.
- For the rational Gauss family, m=1,2,4 give 1,0,2. At ζ₄=i the two sums are 2+2i and 2−2i, whose normalised product is 2. The square companion gives i at m=1, −i at m=3, and `(i/4)(2+2i)²=−2` at m=4.
- Multiplying the order by 3 preserves both the zero at m=2 and the two at m=4. The edge 1→2 fails the ℤ₂ gluing equation 1=0.
- The q=1 completion of this family is one, although other root components differ. Order-one data do not determine the collection after 2 is inverted.
- The Rogers–Ramanujan F₁ and F₂ are conjugate and distinct. At m=5, choosing a compatible embedding is essential for the value 0 or −1.

### 7.6 Degree-zero cohomology and coefficient lines

For a number field K and R=𝒪_K[1/Δ] étale over ℤ after the stated localisation, use the exact supplier comparisons with the direction fixed in the introduction:

```text
κ_R:H_R≃H_{R/ℤ},       d_R:qHdg_{R/ℤ}≃H_{R/ℤ},
η_R=H⁰(d_R)⁻¹∘κ_R : H_R≃H⁰(qHdg_{R/ℤ}).
```

The relative Habiro–Hodge complex in this étale case is concentrated in degree zero. Prove `nahmDegreeZeroExport`: for each symmetrisation whose actual H_R membership is supplied, η_R gives its degree-zero class, preserving every cyclotomic Taylor expansion, Frobenius reexpansion and q=1 completion. Give the commuting square with H_R→R[[q−1]] and the completed qHdg complex. Supply preservation of one and multiplication and compatibility with permitted localisation in R. This is a ℤ[q]-algebra comparison. An arbitrary element of R does not give an untwisted constant family compatible with arithmetic Frobenius, so no such R-algebra structure is used. Sources: Wagner, Corollaries 2.13 and 3.13, printed pp. 33 and 41. *Needs:* HabiroRings layers HR.5–HR.6 and actual membership from §§7.1–7.5.

The rational example is `η_{ℤ[1/2]}(a)`, retaining constants 1,0,2 at orders 1,2,4 and zero higher coefficients. The cubic example over R₆ has the three coefficients in §7.2; descent of that class to ℤ[z,1/23] requires cubicSmallPrimeDescent. The quartic Gaussian collection is first a section of the restricted K₃ module over B, subject to Layer 6's obligations; it is not thereby an element of H_R or an unrestricted degree-zero cohomology class.

For a specified ξ and a supplied global invertible module `L_ξ=H_{B,ξ}`, transport L_ξ along κ and d to an invertible module over H⁰(qHdg_{B/ℤ}). With the owner's tensor theorem this gives `ξ↦[L_ξ]` in its Picard group. Prove the compatibility with tensor addition and finite étale scalar restriction. A collection known only on good orders requires a global extension before it supplies a section of this global line. Freeness after q=1 completion requires the separate HabiroRings completion-triviality target; the ring comparison and tensor law alone do not prove it. The real regulator tuple from Layer 1 is a different additive invariant; membership gives no comparison isomorphism from that tuple to this Picard class or to crystalline or étale cohomology. Sources: GSWZ Theorem 2, (25)–(26), pp. 10–11 and §3.3, p. 43; Wagner Corollary 3.13, p. 41. *Needs:* the global effective module descent and tensor supplier contracts, plus the separate completion input when used.

**Checks.**

- η sends one to one and preserves the zero component of the rational Gauss family at order two.
- The q=1 completion of the rational class is one; the entire class still retains its even-order components.
- The cubic class has zero linear coefficient over R₆. Its displayed smaller denominators do not prove descent of the class.
- A free completed line can have nontrivial global Picard class. A local nonzero section need not be a global generator.
- If B splits, the comparison and Picard statements act on every factor, not only a chosen embedding.

### 7.7 The precise higher-cohomology interface

The unconditional type of the preceding export is degree zero for the étale zero-dimensional scheme Spec R. State `higherHabiroComparison` as a separate supplier-facing target at the full generality of the intended cohomology theory. Garoufalidis–Wheeler Definition 1.2, p. 5, defines H(V) for an R-module with compatible p-adic Frobenius automorphisms at all but finitely many primes, R étale over ℤ[λ]. The rational series at every root must converge on the **whole** open p-adic unit disc and satisfy Frobenius reexpansion for every m at almost every p. In the smooth proper setting of (13)–(14), pp. 5–6, take every degree n and V=Hⁿ_dR(X/B) modulo torsion; no degree-zero restriction is imposed on that construction.

Keep the affine push-forward theorem distinct. Garoufalidis–Wheeler Theorem 1.18, (50)–(53), pp. 12–13, starts with an étale map ℤ[x,λ]→R′, X=Spec R′ over `B′=Spec ℤ[λ,1/Δ(λ)]`, an analytic relative Habiro element f whose Taylor series have positive radius at every prime-ideal completion, and a relative top form ω fixed by the p-Frobenius for almost all p. Its map is
`f↦[fω]∈H_naive^N(X/B′)`, N the number of x variables. Positive radius in this analytic input and whole-unit-disc convergence in H(V) are separate conditions whose preservation is part of the theorem; they must not be interchanged in a comparison.

To export such a class here, specify the family X/B′, its form, its base and exceptional primes, and construct a comparison from that H_naive^N to `H^N(RΓ_Hab(X/B′))` in HabiroCohomologyFoundations Layer 5. Require compatibility with all root completions, Frobenius and de Rham specialisation. Analytic realisation and any crystalline/prismatic comparison are separate supplier targets of its Layers 7 and 9. Supply functoriality under base change only with the corresponding completed comparison theorem. This is the exact higher-cohomology obligation; an arbitrary K₃-indexed scalar section supplies neither X,ω nor such a comparison. *Needs:* the cohomology owners' constructions and an actual geometric input, not an extra premise for scalar Habiro membership.

**Checks.**

- For Spec R étale and n=0 this interface agrees with η_R, including all root components.
- A series with only some positive p-adic radius need not converge on the whole unit disc.
- An affine top-form construction is not silently a smooth proper family theorem. A higher-degree class must carry its actual degree N.
- A regulator-valued real tuple alone has no specified Frobenius, root expansions or geometric form and fails these inputs.

### Examples

The cubic root numerator and the quartic integral basis give exact algebraic tests; the rational Gauss family tests gluing that no order-one expansion can detect. The figure-eight example tests a genuinely non-torsion class and the determinant-root extension. Applying η only after membership is known gives degree-zero classes over the same coefficient rings, while the higher-cohomology comparison keeps its geometric data and analytic hypotheses explicit.

### Dependencies

Layers 1–6; the q-binomial, q-Lucas and Rogers–Ramanujan results of QSeriesPartitionsAndMockModularForms layers QM.0–QM.1; HabiroNumberFields Layers 2–3; HabiroRings layers HR.5–HR.6. Topological identifications are downstream uses in ArithmeticQuantumTopology Layers 5–6. Higher cohomology and its analytic realisations are downstream comparisons with HabiroCohomologyFoundations Layers 5, 7 and 9, rather than prerequisites for the algebraic scalar statements here.

## Downstream consumers

`ArithmeticQuantumTopology` consumes the signed Nahm equations, the coherent Gaussian normalisation, selected number-field factors, coefficient extensions and certified classes to compare triangulation series with its invariants. The Neumann–Zagier dictionary exports its invertibility and integrality hypotheses; it does not export presentation independence or quantum modularity.

`HabiroNumberFields` consumes the analytic cyclic-dilogarithm acceptance calculation and the explicit Nahm examples. Its general ring, Chern map, module and tensor constructions remain their unique owners. The full finite étale coefficient extension and global module descent specified in Layer 6 are exact contracts needed by this roadmap, including the split determinant case.

`HabiroCohomologyFoundations` consumes actual symmetrised Habiro elements, their degree-zero comparison and the conditional coefficient-line transport. Higher-dimensional geometric classes require the comparison in §7.7. `K3BlochGroups` and the regulator roadmaps consume the explicit signed and unsigned boundary certificates, quartic basis and relation-certificate targets. None of these exports identifies real regulators with global Picard classes.

## References

Page numbers above are the printed page numbers of the indicated versions; equation and theorem numbers disambiguate different published pagination. All statements are in the conventions fixed here.

- F. Calegari, S. Garoufalidis and D. Zagier, *Bloch groups, algebraic K-theory, units, and Nahm's conjecture*, [arXiv:1712.04887v3](https://arxiv.org/abs/1712.04887v3). The Bloch conventions and finite-Chern comparisons are in §§1–2; the arithmetic radial applications and modularity implication are in §7, pp. 34–41. The [published text](https://people.mpim-bonn.mpg.de/stavros/publications/printed/calegari_unit.pdf) has Theorem 7.1 on p. 419 and Theorem 7.5 on pp. 422–423.
- S. Garoufalidis and D. Zagier, *Asymptotics of Nahm sums at roots of unity*, [arXiv:1812.07690v1](https://arxiv.org/abs/1812.07690v1). Lemma 2.1 and Theorem 3.1 provide the radial building blocks; §§4–7 give estimates, data comparisons and modular applications. The [published text](https://d-nb.info/1217648526/34) uses pp. 221–238; references to (24)–(25) and Proposition 7.1 refer to the same numbered formulas/results.
- S. Garoufalidis, P. Scholze, C. Wheeler and D. Zagier, *The Habiro ring of a number field*, [arXiv:2412.04241v2](https://arxiv.org/abs/2412.04241v2). The formal-series and Gaussian inputs are in §2, pp. 18–37; the regulator and membership arguments in §3, pp. 37–44; the examples and residues in §4, pp. 44–58. The corrected targets above retain the normalisation, level-ring, coefficient-transfer and gluing requirements.
- M. Vlasenko and S. Zwegers, *Nahm's conjecture: asymptotic computations and counterexamples*, [arXiv:1104.4008](https://arxiv.org/abs/1104.4008). Lemmas 2.1–2.2 and Theorem 2.3, pp. 2–5, give positive critical points and order-one asymptotics.
- D. Zagier, *The dilogarithm function*, [freely readable text](https://www.maths.dur.ac.uk/users/herbert.gangl/zagier_dilog.pdf), II.1A, pp. 23–24, for the increasing Rogers dilogarithm, of which CGZ (42), p. 36, takes the complement; II.3A–C, pp. 41–58, for Nahm's equations (3.3), the saddle constant (3.7) and the modularity tests. General dilogarithms remain with Polylogarithms.
- S. Garoufalidis, M. Storzer and C. Wheeler, *Perturbative invariants of cusped hyperbolic 3-manifolds*, [arXiv:2305.14884v2](https://arxiv.org/abs/2305.14884v2), Lemmas 3.1–3.2, p. 10, for affine shifts and change of variables. These identities are used only after fixing the covariance and its exponential factor.
- D. Bar-Natan, S. Garoufalidis, L. Rozansky and D. Thurston, *The Århus integral of rational homology 3-spheres II: Invariance and universality*, [arXiv:math/9801049v4](https://arxiv.org/abs/math/9801049v4), Proposition 2.13, pp. 8–9, for algebraic Gaussian Fubini.
- S. Garoufalidis and C. Wheeler, *Explicit classes in Habiro cohomology*, [arXiv:2505.19885v1](https://arxiv.org/abs/2505.19885v1). Definition 1.2, p. 5, Theorems 1.13 and 1.18, pp. 11–13, and Proposition 1.14, p. 11, supply the precise comparison questions and the cubic q-binomial identity; the root numerator in (182), p. 31, is corrected in §7.2.
- F. Wagner, [*q-Hodge filtrations, Habiro cohomology, and ku*](https://ferdinand-wagner.github.io/papers/q-Thesis.pdf), Corollaries 2.13 and 3.13, printed pp. 33 and 41, for the étale number-field/relative Habiro comparison and the degree-zero Habiro–Hodge equivalence.

- The Stacks Project, [Lemma 10.148.3, tag 00UO](https://stacks.math.columbia.edu/tag/00UO), for the equivalence of formal unramifiedness and vanishing Kähler differentials used with the pinned field-finiteness theorem in §1.3.
