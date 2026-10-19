# Roadmap: polylogarithms, explicit regulators and Zagier statements

**Summary.** Construct the real single-valued classical polylogarithms, prove the Bloch–Wigner five-term relation, and use explicit rational symbol complexes to express the special values of number-field zeta functions in weights three and four by polylogarithmic determinants. The analytic side supplies certified dilogarithm evaluation, logarithmic current regulators and their comparison with the universal Beilinson regulator. The algebraic side distinguishes the explicit low-weight presentations from the inductively defined higher Bloch groups. General motivic comparison, higher reciprocity and Leopoldt remain conjectures. The weight-four existence theorem is unconditional; extending an every-family assertion across a change of presentation requires the separate cycle-lifting assertion stated below.

## Scope and ownership

This roadmap owns classical complex polylogarithms as analytic functions, their real single-valued combinations, the explicit trilogarithmic presentation and configuration maps, the rational-curve construction of higher Bloch groups, and the associated polylogarithmic complexes. It also owns the concrete logarithmic forms, currents, Chow polylogarithms, regulator formulas and low-weight reciprocity homotopies used here. Its last layer connects those formulas to existing completed-unit and local-logarithm interfaces.

The following boundaries are part of the specification.

- **K3BlochGroups**, Layers V.3–V.4, owns the pre-Bloch group, its five-term relations, the antisymmetric tensor boundary, its rational exterior comparison, the Bloch kernel, the Suslin comparison and weight-two rigidity. V.6 owns exact Bloch-certificate infrastructure. Here `B₂` abbreviates that rational pre-Bloch group; it does not mean its Bloch kernel. Descent of an analytic function and its normalization against a Borel regulator are additional targets here.
- **K2SymbolsBrauer**, Layers T.2–T.4, owns Milnor symbols, tame symbols, Milnor norms and Weil reciprocity. **GeneralAlgebraicKTheory**, Layer K.2, owns plus constructions and primitive Hurewicz maps. **SchemeKTheoryOperations**, Layers S.4 and S.6, owns localization, coniveau and rational Adams operations. None of these constructions is repeated.
- **BorelRegulators**, Layers R.3–R.5, owns ranks, the archimedean regulator lattice and its zeta covolume. The conversion from those coordinates to this roadmap's real polylogarithms is supplied explicitly here; a nonzero rational scalar in one coordinate system does not authorize dropping a power of π in another.
- **DifferentialGeometry**, Layers 0–2, 5–6 and 8, owns manifold differential forms, wedge, exterior derivative, orientations, integration, Stokes, compact support and de Rham comparison. The additions here concern the LF topology on test forms, its continuous dual, singular logarithmic representatives and their residue identities. **AlgebraicVectorBundles**, Layer 2, owns algebraic cycles and the Chow ring. Chow parameter loci here classify moving cycles with specified face conditions; they are not a second Chow ring.
- **ComplexComparisonPartII**, early Layer C0, supplies analytification of smooth projective varieties and compatibility with algebraic maps; the lattice-specific torus integration and Fourier adapter is constructed in §5.18. **AlgebraicModuliForArithmeticGeometry**, Part II, supplies the Chow parameter space and algebraic resolution contracts below. **GeometricTopology**, Part II, supplies ideal hyperbolic simplex geometry. These contracts are needed only by their indicated applications, not by the analytic five-term proof.
- **MotivicEtaleKTheory**, Layers M.4 and M.6 and the universal-regulator part of M.8, owns higher Chow complexes, their rational K-theory comparison, rational Chern characters and the universal Deligne regulator. Its uses of explicit polylogarithmic formulas come after that universal construction. This roadmap compares a concrete chain map with that earlier universal map; neither construction assumes the comparison.
- **IntegralIwasawaTheory**, Layers I2 and L4, owns completed global-to-local units, the Leopoldt rank assertion and the abelian consequence of Baker–Brumer. **ColemanIntegrationAndChabauty**, the independent early portion of L0, owns the Iwasawa logarithm and formal rational polylogarithm series. The present complex analytic realization and its regulator formulas add no second formal power-series object. The early logarithm contract must be separated from Coleman's later uses of these complex formulas.

The weight-four motivic-correlator and cluster machinery is the named continuation **Polylogarithms, Part II: motivic correlators and cluster polylogarithms**. It supplies the exact statements of Goncharov–Rudenko's Theorems 1.13–1.14, Corollary 1.15, Theorems 7.6 and 9.1 and their compatibility in §9.3. Those are substantial mathematical inputs, not consequences of the definitions of a symbol complex. The present roadmap specifies the explicit complex, its numerical realization, the presentation comparison and the additional obstruction to lifting all inductive cycles.

## Conventions

Algebraic symbol groups are rational vector spaces unless a statement explicitly says integral. Put `U(F) = ℚ ⊗_ℤ Additive(Fˣ)`, and denote the vector of a unit `x` by `u(x)`. Exterior powers and tensor products of these spaces are over ℚ. Torsion units therefore have zero vector. The symbol `[x]ₙ` includes the endpoint `x = 1` in odd weights; `[0]ₙ = [∞]ₙ = 0`. Killing `[1]₃` would destroy the zeta-value theorem.

Complex logarithms use Mathlib's principal logarithm, with argument in `(-π,π]`. On the real cut `x > 1`, `Li₁(x) = -log(1-x)` takes its lower boundary value. The higher principal branches use the same boundary choice. All differentiation across this cut concerns the **real single-valued** functions, not a holomorphic continuation of a principal branch through its jump. Bernoulli numbers have `B₁ = -1/2`. Let `πₙ(w) = Re(w)` for odd `n` and `Im(w)` for even `n`; `Lₙ` takes values in ℝ. Tate-valued versions require an explicit multiplication by the stated power of `2πi`.

Complexes are cohomological, in degrees `1,…,n`, and their differential raises degree. The shift has `d_{C[-1]} = -d_C`. A residue written without this shift sign commutes with the displayed symbol differentials; its component in a map to `C[-1]` acquires the corresponding degree sign. An alternating sum `Alt_m` is the sum over all `m!` permutations with their signs, with **no** factor `1/m!`. Deleted vertices are numbered starting at zero.

Write `r(a,b,c,d)` for the cross-ratio in [G04, §6] normalized by `r(∞,0,1,z)=z`. On an affine chart it is

```text
r(a,b,c,d) = (a-c)(b-d) / ((a-d)(b-c)).
```

Thus `r(a,b,c,∞)=(a-c)/(b-c)`. The common Bloch–Suslin convention `cr(0,∞,1,z)=z` gives `r=1/cr` on the same four ordered vertices. The bracket in Goncharov–Rudenko §1 is `1-1/cr`; both changes negate `D`. This distinction matters when a tuple is used as an oriented ideal tetrahedron. Projected cross-ratios in Layer 3 are fixed independently by their determinant formula.

For a number field `F`, write `N=[F:ℚ]=r₁+2r₂`, `dₙ=r₁+r₂` for odd `n` and `dₙ=r₂` for even `n`, and `eₙ=n(N-dₙ)`. Choose every real embedding and one embedding from each complex pair in odd weight; choose only the latter in even weight. Rows are embeddings and columns are symbol families. Set

```text
Zₙ(F;y₁,…,y_d) = π^eₙ / √|disc F| · det(Lₙ(σᵢ(yⱼ))).
```

An empty determinant is one. A rational proportionality for every family allows scalar zero; the existence theorem requires a nonzero scalar. The existence statement is written `Zₙ=q ζ_F(n)`, so that its scalar is the inverse of the scalar in `ζ_F(n)=q' Zₙ`.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use `Complex.log`, `Complex.slitPlane`, `Complex.hasSum_taylorSeries_neg_log`, `Complex.hasStrictDerivAt_log`, `Complex.hasStrictFDerivAt_log_real`, `intervalIntegral`, Bochner integration, `HasSum`, `HasFDerivAt`, `fderiv`, `AnalyticOn` and the complex identity theorem. `bernoulli` and `Polynomial.bernoulli` provide the coefficient convention and polynomial derivative identities. `hasSum_one_div_nat_pow_mul_fourier` supplies the Bernoulli Fourier identity on the circle; logarithmic sine integrability and `integral_log_sin_zero_pi` supply the normalization of Lobachevsky's integral. The tail estimate needed here is a separate application of comparison with `∫_N^∞t⁻²dt`, not a claim that geometric-series error control remains uniform at the circle.

Use `Finsupp`, `Submodule.span`, `TensorProduct`, `Additive`, `ExteriorAlgebra.exteriorPower`, `exteriorPower.ιMulti`, `Matrix.det`, `CochainComplex`, homology, shifts and mapping cones. Quotient descent is proved before assigning a differential on a quotient. `NumberField.dedekindZeta`, `NumberField.discr`, `NumberField.discr_ne_zero`, `NumberField.InfinitePlace.embedding`, `nrRealPlaces`, `nrComplexPlaces` and the signature identity supply the arithmetic carriers, not their special-value theorem. `NumberField.discr_rat` fixes the rational-field determinant check.

Tau Ceti's `TauCeti.Analysis.Complex.ContinuousLog.Basic` supplies `HasContinuousLogOn`, its nonvanishing consequence and its multiplicative, inverse, quotient and slit-plane APIs. Its path and gluing results supply local branch choices; monodromy of higher polylogarithms is still to be proved here. The function-field place API supplies `TauCeti.Place.residueUnit`, its product, inverse and power rules, and `finite_setOf_ord_ne_zero`. Reduction is used only after proving valuation zero. The principal-divisor/product-formula API supplies finite support and degree zero of principal divisors. It never supplies reduction of a nonunit by totalizing a field homomorphism.

### From the symbol and regulator roadmaps

K3BlochGroups V.3 supplies `preBlochGroup`, the five-term class, `blochBoundary` with value `x∧(1-x)`, and its rational strict-exterior comparison. The differential here is its **negative**, `(1-x)∧x`. V.4 supplies the rational Suslin comparison with indecomposable K₃ and rigidity under purely transcendental extension in weight two. K2SymbolsBrauer T.2–T.3 supplies `milnorK`, Steinberg relations, the tame symbol convention `∂{π,u}=ū⁻¹` and Milnor transfer with `N∘res=[L:K]`. T.4 supplies reciprocity over proper curves.

BorelRegulators R.3–R.5 supplies the dimension `dₙ`, injectivity of the regulator after tensoring with ℝ and the covolume relation in its declared original real coordinates. In Tate-divided coordinates the determinant relation has the shape

```text
det(r_Bo) ∈ ℚˣ · √|disc F| · π^(dₙ-Nn) ζ_F(n).
```

The conversion required here is `Lₙ-period = λₙ π^(n-1) r_Bo`, with `λₙ ∈ ℚˣ`, after compatible K-theory and homology normalizations. Multiplying each of `dₙ` rows gives the exponent `-eₙ` for the determinant of the `Lₙ` periods. An assertion that `λₙ` is rational is made only **after** this period conversion. Exact factorial and Hurewicz constants are the calibration target in §2.3, not an unnamed dependency on the whole regulator comparison layer.

### Geometric and motivic interfaces

DifferentialGeometry supplies its smooth form carrier, `d`, wedge, pullback, integration and Stokes with the determinant orientation. The needed complex refinements here are `(p,q)` decomposition, LF test-form topology and dual-current operations. AlgebraicModuliForArithmeticGeometry, Part II R09.2, must provide a projective Chow parameter scheme for fixed dimension and degree, its universal cycle and closed incidence loci; R09.7 must provide proper algebraic resolution with a simple-normal-crossing total divisor, an isomorphism off that divisor and functorial proper pushforward of the resulting integration currents. No resolution of an arbitrary analytic space is assumed. ComplexComparisonPartII C0 must identify the analytification of such a resolution with its complex-manifold map and identify fibers and algebraic divisor multiplicities.

GeometricTopology, Part II must provide the upper-half-space metric of curvature `-1`, its oriented volume measure, ideal vertices in `ℙ¹(ℂ)`, orientation reversal under an odd vertex permutation, and an ideal-tetrahedron volume obtained as the limit of finite truncations. This supplies the geometric meaning of the integral in §2.4, rather than assuming the dilogarithm volume formula itself.

MotivicEtaleKTheory M.4 supplies the cubical and simplicial higher Chow complexes and their mixed comparison quasi-isomorphisms for smooth projective varieties over a characteristic-zero field. Its M.6 supplies the rational Chern character into these complexes, compatible with restriction and localization. Its universal part of M.8 supplies the real Deligne complex and Chern regulator, unit logarithm, cup product and localization compatibility before the explicit formulas of this roadmap are used. SchemeKTheoryOperations supplies the coniveau differential and Adams summands used to identify these inputs. The support and logarithmic-current models, their chain comparison and the sign dictionary remain explicit targets here.

For the weight-three configuration argument, GeneralAlgebraicKTheory K.2 supplies the primitive rational Hurewicz isomorphism `K_j(F)_ℚ ≃ Prim H_j(GL(F),ℚ)` and the rank filtration induced by finite `GL_m`. K3BlochGroups V.4 supplies the degree-three Suslin comparison; the degree-three configuration normalization is the separate target of §3.6. No equality of the rank and Adams filtrations is assumed.

## How to read the build

Layer 1 fixes branches and proves analytic identities without K-theory. Layer 2 turns the dilogarithm into an embedding regulator, a signed volume and a certified rational computation. Layer 3 constructs the explicit trilogarithmic complex and its configuration comparison. Layer 4 develops the inductive presentation and separates the precise Zagier assertions, including the weight-four presentation issue. Layer 5 builds the singular analytic machinery and explicit curve and higher-cycle regulators. Layer 6 gives diagnostic differential and completed-unit interfaces. Each layer can be used up to the theorem whose listed suppliers are available; conjectural comparison statements are never instances that silently enable subsequent proofs.

## Layer 1: analytic polylogarithms and the five-term identity

### 1.1 Principal polylogarithms

Define `Liₙ` for every integer index by the series `∑_{k≥1}z^k/k^n` on `|z|<1`. Set `Li₀=z/(1-z)`; nonpositive indices are its iterated Euler derivatives `(z d/dz)^(-n)Li₀`. Positive indices are continued by `Li₁=-log(1-z)` and `Liₙ₊₁(z)=∫₀¹Liₙ(tz)dt/t` on the slit domain. For natural `n≥2`, the direct formula used by `polylog` in Suggested.lean is

```text
Liₙ(z) = 1/(n-2)! ∫₀¹ (-log t)^(n-2) · [-log(1-tz)] dt/t.
```

Prove integrability at zero, at the endpoint and at a possible interior logarithmic singularity before comparing this formula with the continuation. The value of the integrand at its isolated singular point has no effect on the integral. The rational formulas at nonpositive indices are asserted away from `z=1`. Prove `polylog_hasSum`, `polylog_zero`, `polylog_deriv`, `polylog_analyticOn`, `polylog_conj`, `polylog_one` and continuity on the closed unit disc for `n≥2`. The derivative recursion is asserted off `[1,∞)` and away from zero in its quotient form; the removable value at zero is a separate extension. (Goncharov [G95], §1.0, pp.201–202, (1.1)–(1.4); Zagier [Z07], §1, pp.3–6; Goncharov–Rudenko [GR], §1.1, pp.2–3.) *Needs:* the complex-analysis and integration contracts above.

**Checks.**

- `Li₁(z)=-log(1-z)` agrees with Mathlib's Taylor series on the disc. At `z=0` every index has value zero.
- `Li₂(1/2)=π²/12-(log 2)²/2`, `Li₂(-1)=-π²/12` and `Li₂(1)=π²/6`; a continuation with a different cut fails the negative-real check.
- `Li₀(1/2)=1` and `Li₋₁(z)=z/(1-z)²` for `z≠1`; the singularity at one cannot be declared an analytic point by field totalization.
- On the slit domain `z·Li₃'(z)=Li₂(z)`. At `z=3`, the upper-minus-lower limit of `Li₁` is `2πi`, so the principal classical function cannot be globally continuous on `ℂ\{0,1}`.

### 1.2 Distribution, inversion and branch jumps

For `m≥1` and integer `n`, prove `Liₙ(z^m)=m^(n-1)∑_{ζ^m=1}Liₙ(ζz)` first on the disc. For positive `n`, continue on the connected star domain where every argument `ζz` avoids the principal cut; for nonpositive `n`, it is a rational identity when `z^m≠1`. For `n≥1` and `z∉[0,∞)`, prove

```text
Liₙ(z)+(-1)^n Liₙ(1/z)
  = -(2πi)^n/n! · Bₙ(1/2 + log(-z)/(2πi)).
```

The base case is the logarithm identity, the derivative reduces the weight and the value at `z=-1` fixes the integration constant. The Bernoulli Fourier identity supplies that constant on the circle. These are the targets `polylog_distribution` and `polylog_inversion`; the latter's continuation proof is required in addition to the source's circle formula. (Zagier [Z07], §1, pp.5–9, functional equations; [GR], §1.1, pp.3–4; Mathlib's Bernoulli Fourier theorem.)

Prove `polylog_jump`: at `x>1`, the upper-minus-lower jump is `2πi(log x)^(n-1)/(n-1)!`. Counterclockwise continuation about one changes the germ by its negative, while continuation about zero fixes the germ holomorphic at zero and changes the auxiliary logarithm by `2πi`. For the Bernoulli coefficients, `∑2^kB_k s^k/k! = 2s/(e^(2s)-1)`, and multiplying by `e^s` gives the even series `s/sinh s`. Use this identity to prove cancellation of the projected monodromy. No classification of **all** coefficient systems is needed or asserted: a test of the jump alone does not establish every differentiability assertion for an arbitrary real combination. *Needs:* §1.1, Bernoulli polynomials and local logarithms.

The checks fix the signs: at weight one the jump is `+2πi`; at weight two its imaginary part is `+2π log x`, canceled by the `-2π` jump in `arg(1-z)` multiplied by `log x`. At `m=2`, `Li₂(1/4)=2(Li₂(1/2)+Li₂(-1/2))`. At `n=2,z=-1`, inversion gives `2Li₂(-1)=-π²/6`. The domain restriction cannot be dropped merely because both sides have total values in Lean.

### 1.3 Real single-valued polylogarithms

For `n≥2`, define `singleValued n z`, denoted `Lₙ(z)`, by

```text
Lₙ(z) = πₙ(∑_{k=0}^{n-1} 2^k B_k/k! · Liₙ₋ₖ(z) · log^k|z|).
```

Prove `singleValued_realAnalytic`, `singleValued_continuous`, `singleValued_inversion`, `singleValued_conjugate` and `singleValued_distribution`. Explicitly, `Lₙ(z)+(-1)^nLₙ(1/z)=0` for nonzero `z`, `Lₙ(conj z)=(-1)^(n-1)Lₙ(z)`, and distribution has the same factor `m^(n-1)` as the classical version. Prove the endpoint values `Lₙ(0)=Lₙ(∞)=0`, `Lₙ(1)=ζ(n)` in odd weights and zero in even weights. The extension to `ℙ¹(ℂ)` is continuous. The weight-one regulator `u(z)↦log|z|` is a different function from this formula at `n=1`, which gives `-log|1-z|`. (Zagier [Z90], §2, pp.397–401; [G95], §1.0, pp.201–202; [GR], §1.1, pp.2–4.) *Needs:* §§1.1–1.2 and elementary logarithmic asymptotics.

Prove `singleValued_differential` for every `n≥2`. Put `ℓ=log|z|` and `cₖ=2^kBₖ/k!`. On a local classical branch the derivative in direction `v` is

```text
πₙ( Σ(k=0,…,n−1) cₖ Liₙ₋ₖ₋₁(z) ℓ^k v/z
   + Σ(k=1,…,n−1) k cₖ Liₙ₋ₖ(z) ℓ^(k−1) Re(v/z) ).
```

Prove that the projected expression is independent of the local branch and gives the real derivative at every `z≠0,1`, including the principal cut. This supplies the general-weight derivative used by cycle constancy in §4.3; that argument does not extrapolate only from the weight-three formula. The weight-two specialization is §1.4 and weight three is §6.2. The second sum is absent when its range is empty; it is never interpreted with a negative logarithm exponent. (Goncharov [G95], Proposition 1.18, pp.223–224; [G00], Proposition 4.1, (28), pp.17–20; the displayed branchwise form follows directly by differentiating the defining Bernoulli sum.)

**Checks.**

- The coefficient of `Liₙ₋₁ log|z|` is `-1`. Replacing `bernoulli` by the convention with `B₁=+1/2` breaks the cancellation in weight two.
- `L₂=D`, `L₃(1)=ζ(3)>0` and `L₃(-1)=-3ζ(3)/4`. Thus odd-weight functions do not vanish on the real axis.
- On the unit circle all logarithmic terms disappear: `L₃(e^{it})=Re Li₃(e^{it})`, whereas `L₂(e^{it})=Im Li₂(e^{it})`.
- `L₂(1/z)=-L₂(z)` and `L₃(1/z)=L₃(z)`. Conjugation negates the former and fixes the latter; these are distinct operations.
- The continuous endpoint assertion does not imply failure of differentiability in every weight: `L₃` has real derivative zero at one. Only the weight-two logarithmic nondifferentiability used below is asserted without further endpoint analysis.

### 1.4 Bloch–Wigner differential and positivity

Define `blochWigner z = Im Li₂(z)+arg(1-z)log|z|`, with continuous values zero at zero and one. Prove `singleValued_two`, its sixfold symmetry, continuity everywhere, real analyticity on `ℂ\{0,1}`, and

```text
dD(z)[v] = -log|z| Im(v/(1-z)) - log|1-z| Im(v/z).
```

At a point on the cut other than one, use local branches and their cancellation, or a local primitive of this smooth one-form, to justify differentiability. Equality of continuous values alone is insufficient to extend a derivative. The target `blochWigner_differential` includes differentiability explicitly. Prove `ΔD(z)=-2 Im z/(|z|²|1-z|²)`. For the positivity proof by the minimum principle, first prove the required strong minimum principle for this `C²` superharmonic function on bounded half-disc exhaustions; use the zero boundary values and the limit at infinity to pass to the upper half-plane. This local analytic target is independent of the later hyperbolic-volume theorem. Then `D(z)>0` for `Im z>0` and is negative below. (Zagier [Z07], §3, pp.10–12; Goncharov [G04], Lemma 6.9 and (85), pp.56–57; the displayed Laplacian and exhaustion argument follow by differentiation.)

**Checks.**

- `D(0)=D(1)=D(∞)=D(x)=0` for real `x`, but `D(i)>0` and `D(-i)=-D(i)`. Identically zero satisfies many formal symmetry tests and fails positivity.
- At `z=i` in direction `v=1`, the differential is `-log|1-i|·Im(1/i)=log 2/2`; at direction `v=i` it is zero. This pins both signs.
- At `z=2`, the derivative is `-log 2·Im(v/(-1))=log 2·Im v`; this is a real derivative at a classical branch-cut point.
- Along `z=it→0`, the leading `t log|t|` behavior prevents a finite derivative of `D` at zero. This endpoint check is specific to weight two.

### 1.5 Five-term relation

For distinct `x,y∈ℂ\{0,1}`, prove the headline `blochWigner_fiveTerm`:

```text
D(x)-D(y)+D(y/x)-D((1-x⁻¹)/(1-y⁻¹))+D((1-x)/(1-y))=0.
```

Equivalently the alternating deletion sum of `D(r(s₀,…,ŝᵢ,…,s₄))` vanishes for five distinct projective points; the cyclic form in the [GR] bracket convention vanishes too. For their cyclic ratios `xᵢ`, prove by clearing denominators that `1-xᵢ=-xᵢ/(xᵢ₊₂xᵢ₊₃)`; bilinearity of `η(f,g)=log|f|darg g-log|g|darg f` makes the sum of the differentials zero. The complement of finitely many points in ℂ is connected, and a degeneration to zero fixes the constant. This supplies a proof before Bloch-group descent. (Zagier [Z07], §3, (3)–(4), p.11; [GR], §1.1, (3)–(4), pp.3–4.) *Needs:* §§1.2–1.4 and Mathlib's connected-complement theorem.

At `x=i,y=-1`, the nonzero terms reduce to `2D(i)-2D((1+i)/2)=0`; thus `D((1+i)/2)=D(i)`. The pair `x=i/2,y=(1+i)/2` gives the five arguments `i/2,(1+i)/2,1-i,2-i,(3+i)/2`; no term is silently replaced by its conjugate. Colliding `x=y` is handled only by a continuous limiting statement, since the displayed rational arguments include a value one and the algebraic relation is stated on distinct points.

### Examples

The natural-index integral gives `polylog 0 (1/2)=1` and the exact weight-one logarithm. The Bernoulli formula gives the endpoint `L₃(1)=ζ(3)` while the dilogarithm gives a signed area-type invariant vanishing on the real axis. These two behaviors explain both the parity of the number-field regulator rows and the need to preserve odd-weight endpoint symbols.

### Dependencies

Only complex analysis, Bernoulli numbers, integration, finite-dimensional real differentiation and elementary topology are needed. No conjectural motivic statement, K-theory regulator comparison or hyperbolic volume identity enters the five-term proof.

## Layer 2: dilogarithmic regulators, volume and certified evaluation

### 2.1 Descent and embedding regulators

Define `blochWignerDesc` as the unique ℚ-linear map from the supplier's rational pre-Bloch group to ℝ sending `[z]₂` to `D(z)`. Existence follows from §1.5 and uniqueness from generation. Restrict it to the Bloch kernel when using the indecomposable K₃ comparison. For a number field, define `weightTwoRegulator` by applying one selected complex embedding per conjugate pair. Real embeddings contribute zero, and changing one representative to its conjugate negates that row. Prove `blochWignerDesc_mk`, `blochWignerDesc_map`, `weightTwoRegulator_conjugate` and the compatibility with the supplier's rational exterior boundary. (Zagier [Z07], §5, pp.17–20; [G04], §5.1 and §5.5, pp.37–38 and 47–51.) *Needs:* Layer 1 and K3BlochGroups V.3–V.4.

**Checks.**

- Over `ℚ`, the target is `ℝ⁰`, and the regulator is the unique map to the zero space. It is not a one-row map indexed by the real embedding.
- Over `ℚ(i)`, the rational class `[i]₂` is a cycle because `u(i)=0`; the selected identity embedding gives `D(i)>0`, while the conjugate gives its negative.
- Integrally, a primitive sixth root `w` need not have `[w]` in the strict-exterior Bloch kernel, although `2[w]` does. An ℝ-valued function kills torsion and cannot identify the integral antisymmetric-tensor and strict-exterior kernels. The rational comparison is essential.

### 2.2 Group cocycles

For a generic tuple of four vectors in `ℂ²`, define `blochWignerCocycle` by the projective ratio `r`; extend by zero on degenerate tuples. Prove alternation, invariance under `GL₂(ℂ)`, the cocycle equation on five tuples and measurability. Use the homogeneous measurable bar resolution, and prove that the generic-resolution comparison gives the indicated continuous cohomology class; do not infer continuity of the representative at a degenerate configuration. Under stabilization this is the weight-two class. (Goncharov [G04], Theorem 1.1, p.8, Theorem 5.7, pp.45–47, and Theorem 5.11, p.49.) *Needs:* §2.1, the bar complex and the measurable/continuous comparison, whose low-degree generic-configuration construction is a target here.

**Checks.**

- The normalized tuple `(∞,0,1,i)` has value `D(i)>0`. Exchanging the first two vertices changes it to `-D(i)`.
- A repeated projective point is assigned zero; independent rescalings of the four vectors do not change the projective ratio or the value.
- Five generic points give an alternating deletion sum zero. Applying a nonreal Möbius transformation preserves it, whereas complex conjugation reverses its value.

### 2.3 Borel normalization and a matrix-unit calibration

Prove `weightTwoRegulator_borel` by comparing the measurable cocycle with the invariant trace form and then the primitive Hurewicz map. First state the proportionality in the source's **original** real cohomology coordinates. Compose with the declared Tate-coordinate conversion before using the zeta covolume formula. The exact target `borelCalibration_two` computes the scalar with every factorial, alternation and Hurewicz convention fixed. The elementary calculation is indispensable: for `X=E₁₂,Y=E₂₁,Z=E₂₂`,

```text
Alt₃ Tr(XYZ) = -3,
C₂=(1/2)Alt₃ Tr(XYZ)=-3/2,
Φ₃=-(1/6)Alt₃ Tr(XYZ)=1/2.
```

Here the first expression means simply the unnormalized alternating triple trace; it does not introduce a second commutator normalization. Reversing the first two inputs reverses all three values. Prove the alternating trace calculation directly, then match it with the source's Maurer–Cartan and bar conventions. The calculation alone does **not** compute the complete K-theory scalar. That remaining calibration is an explicit proof obligation; the source's differently normalized displayed formulas must not be substituted without the conversion. (Goncharov [G04], §5.2 and §5.5, especially the trace-form comparison, pp.38–40 and 47–51.) *Needs:* §2.2, primitive Hurewicz and BorelRegulators R.3–R.5.

The two-term sign check is `Φ₃(E₁₂,E₂₁,E₂₂)=1/2` and `Φ₃(E₂₁,E₁₂,E₂₂)=-1/2`. A claimed value `3/2` for the former would already contradict the elementary trace formula. Exact rational nonzero proportionality suffices for special-value existence after the period power is fixed; it does not make an unchecked exact scalar a theorem.

### 2.4 Ideal tetrahedra and Lobachevsky's function

Define `lobachevsky θ = -∫₀^θ log|2 sin t|dt`, proving local integrability through multiples of π. Prove oddness, π-periodicity, `Λ(π-θ)=-Λ(θ)` and duplication `Λ(2θ)=2Λ(θ)+2Λ(θ+π/2)`. Its Fourier series is `Λ(θ)=1/2∑_{m≥1}sin(2mθ)/m²`, absolutely and uniformly convergent. For `Im z>0`, with triangle angles `α=arg z`, `β=arg(1/(1-z))`, `γ=π-α-β`, prove `D(z)=Λ(α)+Λ(β)+Λ(γ)`. Their positivity and sum π are proved from the upper-half-plane hypothesis. (Zagier [Z07], §4, pp.13–16; [G04], §5.1, pp.37–38.)

Prove `idealTetrahedron_volume`: the oriented ideal tetrahedron with vertices `(∞,0,1,z)` has signed volume `D(z)`, using the hyperbolic metric and orientation specified by the geometric supplier. Equivalently, its positive dihedral-angle volume is `Λ(α)+Λ(β)+Λ(γ)`. Derive this by truncation and integration of the upper-half-space volume form. A tuple ordered `(0,∞,1,z)` has signed volume `-D(z)` in this `r` convention, since `r=1/z`. The absolute volume is `|D(z)|`. *Needs:* §2.2, the Lobachevsky integral and the exact ideal-geometry contract; it does not prove positivity retroactively in Layer 1.

**Checks.**

- `Λ(0)=Λ(π/2)=Λ(π)=0`; `Λ(-θ)=-Λ(θ)`. A definition with `log|sin t|` instead of `log|2sin t|` fails π-periodicity.
- At `z=i`, the angles are `π/2,π/4,π/4`, so `D(i)=2Λ(π/4)`. The regular ideal tetrahedron at `z=e^{iπ/3}` has volume `3Λ(π/3)>0`.
- At the same vertices `(0,∞,1,i)`, `r=-i` and signed volume is `-D(i)`; swapping the first two gives `+D(i)`. A real fourth vertex has zero limiting volume.

### 2.5 Uniform Fourier bounds and exact rational shapes

Prove `circlePartial_error`: for `|w|=1` and `N≥1`, the finite sum `S_N(w)=∑_{k=1}^N Im(w^k)/k²` differs from `D(w)` by at most `1/N`. The bound is uniform even at `w=1`; it follows from absolute convergence and `∑_{k>N}k⁻²≤1/N`. Define `circlePartial` with this exact indexing. Prove the Kummer reduction

```text
D(z) = 1/2 Σ_{u∈(z,1/(1-z),1-1/z)} D(u/conj u),  z≠0,1.
```

Each argument has norm one. This supplies a terminating certificate near the unit circle without relying on a geometric-series tail with denominator `1-|z|`. (Zagier [Z07], §3, (2), pp.10–11.) *Needs:* §1.4, the circle series and elementary norm algebra.

For exact rational input `z=a+bi`, define the Gaussian-rational shape operation

```text
ρ(x,y)=((x²-y²)/(x²+y²), 2xy/(x²+y²)),
W₀=ρ(a,b), W₁=ρ(1-a,b),
W₂=ρ(a-1,b)·conj(W₀).
```

For `z≠0,1`, all denominators are strictly positive. Prove `rationalUnitShapes_correct`, identifying these pairs with the three Kummer arguments in order. At the two exceptional inputs define all three shapes to be one, so the approximation is exactly zero. Define `rationalFourierSum` by Gaussian-rational powering and taking the rational imaginary coordinate; its coercion is `circlePartial`. Finally define `rationalApprox(z,p)=1/2∑_{j=0}²S_{3·2^p}(Wⱼ)` for `p∈ℕ`. It returns a rational number and a theorem, not a floating-point trust assertion:

```text
|D(z)-rationalApprox(z,p)| ≤ 3/(2·3·2^p) ≤ 2^(-p).
```

Prove `rationalFourier_compatibility`, `rationalApprox_error`, termination and exact arithmetic correctness. The complexity is deliberately elementary, exponential in the requested bit precision; a faster implementation may refine it while preserving this certificate. *Needs:* Gaussian-rational arithmetic, §2.5 and the generic exact-number bounds of Completed EffectiveBounds.

**Checks.**

- `S₃(i)=1-1/9=8/9`; `S₆(i)=1-1/9+1/25=209/225`. The sum starts at one and includes `N` terms.
- At `z=i`, the shapes are `(-1,i,i)`. Hence the three-point approximation is `S_N(i)`, not its negative, and the certificate at `p=1` already proves positivity.
- At `z=0` and `z=1`, the answer is exactly zero with no division by a zero norm; for real rational `z` outside these points every shape is one and the answer is again zero.
- For `z=(1+i)/2`, the second shape has positive imaginary coordinate. Replacing `ρ(1-a,b)` by `ρ(1-a,-b)` reverses it and fails the Kummer identity.
- A certified numerical equality of two real values does not prove an equality of Bloch-group elements. Such an equality still needs the exact relation certificate supplied by K3BlochGroups V.6.

### Examples

For `F=ℚ(i)` the weight-two cycle `[i]₂` has `Z₂=π²D(i)/2=3ζ_F(2)`. This simultaneously checks the selected complex row, discriminant four, exponent two and nonzero rational factor. The same analytic value is the positive volume of `(∞,0,1,i)` and the target of a rational error certificate.

### Dependencies

Layer 1, K3BlochGroups V.3–V.4 and V.6, primitive group homology and BorelRegulators R.3–R.5 are needed for the regulator comparison. Hyperbolic geometry is used only in §2.4. The certified arithmetic in §2.5 needs neither K-theory nor a volume theorem.

## Layer 3: the explicit trilogarithmic complex

### 3.1 Relations and the weight-three group

For an infinite field `F`, define `trilogGroup F = ℚ[F]/R₃(F)`. Here `R₃` is generated by `[0]`, inversion `[x]-[x⁻¹]`, the three-term element `[x]+[1-x]+[1-x⁻¹]-[1]` for `x≠0`, and the coordinate 22-term relations below. Use the source's rational endpoint convention, retaining `[1]`. Define `trilogGroup.map` by field embeddings and prove the quotient universal property `trilogGroup.lift`. The intended first differential is `δ₃[x]₃=[x]₂⊗u(x)` for `x≠0`, and zero at zero. Its well-definedness includes the full 22-term calculation, rather than being an axiom of an otherwise empty group. (Goncharov [G95], §1.3–1.6, pp.205–211, Theorems 1.3–1.4; [GR], §1.2, (19), p.9 and §5.1, pp.54–56.)

Write `A=ca-a+1`, `B=bc-c+1`. Define the cyclic block, corresponding to `trilogCyclic` in Suggested.lean, by

```text
T(a,b,c) = [A]+[A/(ca)]+[c]+[B/(Ab)]-[A/c]
           +[-Ba/A]-[B/(Abc)]-[1].
R(a,b,c) = T(a,b,c)+T(b,c,a)+T(c,a,b)+[-abc].
```

Require `abc≠0` and all three cyclic versions of `A` nonzero. Arguments equal to one or minus one are allowed. Prove `coordinateRelation_cobracket` by expanding into the five-term presentation of `B₂`, using multiplicative additivity of `u` and the exterior boundary. Prove the analytic identity `L₃(R(a,b,c))=0`. First do this on the generic geometric locus, then justify the remaining admissible values by specialization and continuity; the latter step is a named target, `coordinateRelation_specialize`, not an implicit strengthening of a generic calculation. Inversion and the three-term relation similarly descend. (Goncharov [G95], (1.16)–(1.17), pp.208–210; [GR], §5.1, Lemmas 5.1–5.2 and Proposition 5.4, (109)–(114), pp.54–56.) *Needs:* the supplier's rational five-term group, Layer 1 and projective specialization.

The planning API is `coordinateRelation`, `coordinateRelation_cobracket`, `coordinateRelation_specialize`, `trilogGroup.mk_zero`, `mk_inv`, `mk_three_term`, `delta_mk`, `map_id` and `map_comp`. The light predicate `TrilogRelationFunction` tests exactly this presentation against a function to any rational module; it is not a newly constructed quotient.

**Checks.**

- `R(1,1,1)=3[1]+4[-1]` as a **raw** symbol sum; evaluating `L₃` gives `3ζ(3)+4(-3ζ(3)/4)=0`. The raw sum is not zero in the free module.
- At `(2,2,2)`, the raw sum is `3[3]+3[3/4]+3[2]+3[1/2]+3[-2]-3[3/2]-3[1/4]-3[1]+[-8]`. In particular the coefficient of `[1/4]` is negative.
- Modulo inversion, `R(1,1,c)=-[c²]+4[c]+4[-c]`. This reduction is not a raw equality before quotienting.
- At `x=2`, the three-term relation is `[2]+[-1]+[1/2]=[1]`. It is compatible with a nonzero value of `[1]`, and `L₃([1])=ζ(3)>0` proves that this class is nonzero over ℚ.
- The function `b(x)=x` on ℚ fails inversion at `x=2`; it is a negative control for `TrilogRelationFunction`, even though its single cyclic block at `(1,1,1)` happens to be zero.

### 3.2 Low-weight complexes and universal cycle predicates

Assemble `polylogComplex F n`, for `1≤n≤3`, in degrees `1,…,n`:

```text
n=1: U(F),
n=2: B₂(F) → Λ²U(F),
n=3: B₃(F) → B₂(F)⊗U(F) → Λ³U(F).
d[x]₂=(1-x)∧x;  d([x]₂⊗u(y))=(1-x)∧x∧y.
```

The weight-three square is zero because the image of `[x]₃` is `(1-x)∧x∧x=0`. Prove `polylogComplex_map`, functoriality and `polylogComplex_H1_eq_ker`. Weight two is the rationalized pre-Bloch complex with the negative of the supplier's boundary. These are complexes of vector spaces, not assertions of a motivic quasi-isomorphism. (Goncharov [G95], (0.1)–(0.3), p.199; [G04], §6.1, pp.52–53; [GR], §1.1, (5)–(6), pp.4–5.)

For a finite raw sum `c∈ℚ[F]`, define the native-carrier predicate `IsCycle3 c` by requiring `∑aₓ b(x)⊗u(x)=0` for **every** rational module `V` and every `b:F→V` with `b(0)=b(1)=0` satisfying the normalized five-term relation. Prove `isCycle3_iff_delta_eq_zero` by the quotient universal property: taking `b` to be the universal symbol proves one direction; every other `b` factors through it for the other. This is equivalent to the actual weight-three cycle condition, not a numerical vanishing test. Similarly `IsCycle4` tests this sum against every `TrilogRelationFunction`; it is equivalent to the kernel condition in the explicit weight-four complex of §4.5. The predicates `FiveTermFunction`, `IsCycle3` and `IsCycle4`, and `unitVector`, are light definitions on existing modules in Suggested.lean. *Needs:* §3.1, rational tensor products and the quotient universal property.

**Checks.**

- `δ₂[3]=u(2)∧u(3)≠0` over ℚ, while `δ₂[2]=0` since `u(-1)=0`; the displayed differential on `[3]₂⊗u(5)` is `u(2)∧u(3)∧u(5)≠0`.
- `δ₃[1]=0`, and `IsCycle3(single 1 1)` holds, although `[1]₃` is not zero. Likewise `IsCycle4(single 1 1)` holds because `u(1)=0` even though the test functions need not kill `[1]₃`.
- The zero symbol sum satisfies both cycle predicates. A sum is not made a cycle by having real regulator value zero; the predicates quantify over every relation-respecting test function, not just `L₂` or `L₃`.
- `unitVector(0)=0` by its explicit endpoint branch and `unitVector(1)=0` because the identity unit is additive zero. For ℚ, the prime units `u(2),u(3),u(5)` are linearly independent, detected by their valuations.
- The zero function is a `FiveTermFunction`; the constant nonzero function is not, since it violates both endpoint conditions. A five-term relation with coincident arguments is not required as a raw rational expression.

### 3.3 Exterior residues and their signs

For a discrete valuation `v` on a field `K`, with residue field `k`, define `resExterior:ΛⁿU(K)→Λⁿ⁻¹U(k)` for `n≥1` by `res(π∧u₁∧…∧uₙ₋₁)=ū₁∧…∧ūₙ₋₁` and by zero on wedges of valuation units. Prove independence of the uniformizer and the alternating universal property. The unit-part homomorphism associated to `π` is `f↦residueUnit(fπ^(-v(f)))`; its value on `π` is the identity, and it is multiplicative on **all** nonzero elements. A rule that simply kills all nonunits is not multiplicative. Integrally in degree two, the exterior residue is `(-1)^(v(f)v(g)) tame(f,g)⁻¹`; rationally the sign disappears. (Goncharov [G04], §2, item 6, pp.17–18, and §6.1, p.52.)

For infinite `K` and infinite `k`, define the raw weight-three residue as zero on `B₃(K)`, as `v(y)[x̄]₂` on `[x]₂⊗y` when `v(x)=0` and zero otherwise, and as `resExterior` on `Λ³U(K)`. Prove well-definedness on five-term relations, raw commutation with the displayed differentials and naturality with ramification factor `e`. To obtain a cochain map to `Γ(k,2)[-1]`, multiply the component in source degree `i` by `(-1)^i`; the degree-two component is then the stated positive symbol residue. Define weight-two residue similarly. Integral weight-two commutation fails at a pole by the sign `(-1)^v(x)` and therefore requires rationalization or inversion of two. The API includes `resExterior_uniformizer`, `resExterior_unit`, `resExterior_indep`, `weightThreeResidue_tensor`, `weightThreeResidue_natural` and `weightThreeResidue_shift_sign`. *Needs:* §3.2, place reduction on valuation units and the tame-symbol contract.

**Checks.**

- At `ord_t` on `ℚ(t)`, `res(t∧2∧3)=2∧3`, `res(2∧3∧5)=0`, and using the uniformizer `2t` gives the same answer.
- `res_t([x]₂⊗t)=[x]₂` for a constant unit `x≠1`, whereas `res_t([t]₂⊗a)=0` for a constant `a`. Using `v(x)` instead of `v(y)` fails this check.
- Raw residue sends `d([x]₂⊗t)` to `(1-x)∧x`, agreeing with the target differential before the shift sign. The alternating sign between adjacent degrees is required after shifting.
- `res(t∧u)=ū`, while `tame(t,u)=ū⁻¹`; `res(t∧t)=0` while `tame(t,t)=-1` integrally. At a pole of odd order the latter torsion discrepancy cannot be ignored integrally.
- `t·(2/t)=2` shows why killing both nonunit factors would fail to recover the nontrivial residue unit two. The uniformizer-unit decomposition instead gives unit parts one and two.

### 3.4 Generic configurations and the Bigrassmannian

Define `genericVectorConfig m q` as an ordered tuple in `F^q` for which every subset of at most `q` vectors is linearly independent. Take the free rational module of such tuples modulo simultaneous `GL_q(F)` action to obtain `C_m(q)`. Individual vector rescaling is **not** imposed. Deletion is `∂=∑_{i=0}^{m-1}(-1)^i delete_i`; projection is `p=∑(-1)^i project_i` to the quotient by the selected vector, transported to a standard vector space. Prove basis independence in coinvariants, `∂²=p²=0` and `∂p+p∂=0`. The weight-three Bigrassmannian is the quotient retaining `3≤q<m`, with `BC_m³=⊕_{q=3}^{m-1}C_m(q)` and `D=∂+p`; terms below row three are killed by a quotient, rather than claimed to form a subcomplex. (Goncharov [G94], §3.1–3.2 and §3.10, manuscript pp.15–16 and 24–27; [GR], §7.1, (125)–(134), pp.61–63.)

Prove `genericConfig_delete`, `genericConfig_project`, `bigrassmannian_d_sq` and the row identifications. To map stable group homology, use decorated flags and the sum over dimension vectors of their quotient configurations, with the acyclic generic resolution and a compatibility under stabilization. This is `stabilizedConfigurationComparison`, whose naturality and independence of auxiliary complements are mathematical targets. Do not substitute the coinvariant generic complex alone for a full resolution. *Needs:* §3.2, bar resolutions and elementary linear algebra over an infinite field.

**Checks.**

- For `q=1`, genericity says each vector is nonzero. `(1,2)` and `(1,3)` define distinct simultaneous-`GL₁` orbits: independent rescaling would wrongly identify them.
- A tuple containing zero or, in dimension three, a dependent triple is nongeneric. The moment-curve tuple `v(t)=(1,t,t²)` at distinct rational parameters is generic by its Vandermonde minors.
- `BC₃³=0` and `BC₄³=C₄(3)`; the outgoing map from the latter to the truncated degree-three term is zero. Treating the truncation as a subcomplex produces a spurious row-two projection.
- On a tuple with two distinct deleted indices, the two orders of deletion have opposite signs. Deleting one vector and projecting at another likewise contributes two terms with opposite signs; this pins `D=∂+p`.

### 3.5 The three signed configuration maps

For generic vectors in dimension three fix `|ijk|=det(v_i,v_j,v_k)` and define

```text
r(i|jklm)=|ijl|·|ikm|/(|ijm|·|ikl|),
T(1,…,6)=|124|·|235|·|136|/(|125|·|236|·|134|).
```

All determinants in denominators are nonzero by genericity. The projected ratio is inverse to the convention used in [G95, (1.6)]; its order is fixed by this displayed formula, not by the word “cross-ratio.” Define maps from the bottom row by

```text
r₄ = -3 Alt₄(u|123| ∧ u|124| ∧ u|134|),
r₅ = Alt₅([r(1|2345)]₂ ⊗ u|345|),
r₆ = -(1/5) Alt₆[T(1,…,6)]₃.
```

Prove `δr₅=r₄∂`, `δr₆=r₅∂`, the seven-term identity `r₆∂=0`, and vanishing of their projected-row contributions, so that these maps assemble as `configurationChainComparison:BC³→Γ(F,3)` with the indicated degree reversal. The lower maps are scalar eighteen times the compatible maps of [G94]. The top comparison `configurationTop_normalization: r₆=18M₃` requires the full skew-symmetrization calculation in the explicit trilogarithm quotient. Its proof must count the surviving geometric-presentation terms; the exterior-coordinate checks below verify a necessary boundary identity but do not prove equality in `B₃`. The minus sign of `r₆` is forced by our zero-based boundary and our chosen projected ratio. The coefficients printed in [GR, (142), (144)] cannot be used with these conventions without recalibration. (Goncharov [G94], §3.2–3.6, Lemmas 3.3–3.9 and Theorems 3.10–3.11, manuscript pp.16–21; [GR], §7.2, (135)–(149), pp.64–67.) *Needs:* §§3.1, 3.4 and Plücker identities.

The light determinant definitions `projectedCrossRatio` and `tripleRatio` and their rational witnesses are in Suggested.lean. The named targets are `projectedCrossRatio`, `exteriorConfigurationMap`, `middleConfigurationMap`, `tripleRatioMap`, `sevenTerm_configuration`, `configurationChainComparison` and invariance under simultaneous `GL₃`. The projective invariance of the **top** map must not be transferred to the determinant-valued middle map.

**Checks.**

- On moment-curve parameters `(1,2,3,5,7)`, `r(1|2345)=6/5`; interchanging the last two points gives `5/6`. This pins the projected-ratio order.
- For vectors `(1,8,2),(7,3,11),(1,3,2),(9,4,3)`, the first map is `18 u(5)∧u(67)∧u(197)`. The coefficient `2 Alt₄` in place of `-3 Alt₄` fails this witness.
- On moment-curve parameters `(1,2,3,5,7)`, `δr₅=36u(2)∧u(3)∧u(5)`. Multiplying the first vector by two changes the middle value; it is not an invariant of independently rescaled projective points.
- Rescaling any one vector leaves `projectedCrossRatio` and `tripleRatio` unchanged, since its determinant powers cancel. Repeated vectors violate genericity and may give a zero denominator; totalized division is not the geometric API.
- On six parameters `(1,2,3,5,7,11)`, `T=10/9`. The generic tuple `(e₁,e₂,e₃,(1,1,1),(1,2,3),(1,3,2))` has `T=1`; it must not be excluded or assigned zero merely because the trilogarithm endpoint is one.
- Expanding both sides of the middle chain identity over ℚ into valuation wedge coordinates gives opposite nonzero values if the sign of `r₆` is reversed. A coefficient test, before imposing further trilogarithm relations, is the `(u(2)∧u(3))⊗u(2)` coordinate: the compatible value is `-60`, not `+60`, on the nonconic six-vector tuple just displayed. The unscaled `Alt₆[T]₃` gives `+300` in that coordinate, so multiplication by `-1/5` gives `-60`; the opposite sign gives `+60`. A conic moment-curve tuple cannot detect this coefficient.

### 3.6 Geometric trilogarithms, duality and top cohomology

Define `geometricTrilogGroup` on ordered six-point configurations in `ℙ²(F)`, with alternation, the seven-term relation and the degenerate incidence relations: coincident points or four collinear points give zero, while a prescribed three-collinear configuration gives the explicit five-term combination of elementary triangle symbols. Let `T(z)` be the normalized triangle configuration, and put `T₁(z)=-T(z)-2T(1-z)+T(1)`. The three-collinear relation is `3M₃=∑_{i=1}^5(-1)^(i-1)T₁(r'(y₆|y₁,…,ŷᵢ,…,y₅))`, with the source's `r'` order stated when implementing it. Prove `geometricTrilogComparison`, sending `T(z)` to `[z]₃`, and derive the coordinate 22-term presentation. (Goncharov [G95], Theorem A, p.293, and the explicit construction in §4, pp.286–287; [GR], §7.2, (145)–(150), pp.65–67.)

Define Gale duality on a generic rank-`q` configuration of `m` vectors from the kernel of `F^m→F^q`, of dimension `m-q`, with coordinate functionals giving the dual configuration. Prove independence of the chosen kernel basis, double duality, and deletion–projection compatibility. For a normalized matrix `(I_q,B)`, a dual matrix is `(-Bᵀ,I_{m-q})`. In the geometric trilogarithm group, duality negates the class; in particular `M₃(C*)=-M₃(C)`, and therefore the projected contribution to `r₆` is zero. With **unnormalized** `Alt₆`, `r₆=18M₃` gives `Alt₆ M₃=720M₃=-8 Alt₆[T]₃`, rather than the coefficient `3/2` in [GR, Proposition 7.2] under a different or inconsistent normalization. This exact normalization must be proved alongside the geometric comparison. (Goncharov [G95], §7, pp.298–302, and §8, pp.304–308; [GR], §7.2, Proposition 7.2, p.67.)

Prove `steinbergBoundaryImage`: the image of `B₂(F)⊗U(F)→Λ³U(F)` is exactly the span of `(1-x)∧x∧y`. It follows that `H³Γ(F,3)≃K₃^M(F)_ℚ`. Transport the supplier's Milnor norm through this isomorphism to obtain `topCohomologyTransfer`, natural and satisfying `N∘res=[L:F]`. Prove `suslinTopComparison`, comparing the stabilized configuration map in degree three with this Milnor quotient, with its scalar fixed by the configuration normalization. The classical top-degree Suslin theorem supplies `gr³_rank K₃≃K₃^M`; it does not establish the lower-degree isomorphisms. (Goncharov [G94], §3.8–3.10, manuscript pp.23–27; [GR], after Theorem 1.3, p.7; K2SymbolsBrauer T.2–T.3 and K3BlochGroups V.4.)

**Checks.**

- A coincident-point configuration is zero; the elementary configuration `T(1)` maps to nonzero `[1]₃`. Applying the zero rule for **four** collinear points to three-collinear configurations would wrongly erase the incidence relation.
- For the rank-two four-vector tuple `(1,0),(0,1),(1,2),(1,3)`, the displayed dual is `(-1,-1),(-2,-3),(1,0),(0,1)`. Double duality recovers the original orbit.
- `M₃(C*)+M₃(C)=0`, while `M₃(T(1))` is not forced to be zero. This detects a mistaken duality-invariance sign.
- A Steinberg triple `(1-x)∧x∧y` is zero in `H³`; the residue of `t∧2∧3` is nonzero over ℚ when evaluated in the free exterior group before imposing Milnor relations.
- On a genuine Milnor triple, transfer satisfies `N res=[L:F]`, whereas applying the unit norm independently to three wedge factors would multiply a triple from the base by `[L:F]³`. The latter recipe is not the transfer. Number fields have rational top Milnor K₃ zero, so they do not supply a nonzero witness for this distinction.

### 3.7 Primitive K-theory and regulator classes

Use the decorated-flag resolution to define `configurationHomologyMap_i:H_{6-i}(GL_m(F),ℚ)→H^iΓ(F,3)` for `i=1,2,3` and `m≥3`. Prove compatibility with stabilization and `rankTwo_vanish` by an equivariant contracting section on the rank-two subgroup. Restrict along the primitive Hurewicz map to obtain `weightThreeKComparison_i:K_{6-i}(F)_ℚ→H^iΓ(F,3)`, vanishing on rank at most two. The maps therefore factor through `gr³_rank`; no identification of this filtration with the Adams filtration is invoked. Isomorphy in degrees one and two remains the motivic comparison conjecture. (Goncharov [G94], §3.10, (23), Lemma 3.18 and Conjecture 3.19, pp.24–27; [G95], Theorem A, p.293, and §6, pp.295–296; [GR], discussion (8)–(12), pp.6–7.)

The analytic functional relations of §3.1 give `trilogarithmDescent:B₃(ℂ)→ℝ`. Prove that `L₃∘r₆` is a measurable degree-five cocycle and that its class is the corresponding nonzero real Borel class. The source's Chern-class computation proves its nonzero rational proportionality in original real coordinates; after the Tate-coordinate conversion the scalar has an additional `π²`. Name these steps `configurationBorelClass` and `rationalRegulatorCalibration_three`. Rationality does not follow just because a real cohomology space is one-dimensional. (Goncharov [G94], §5.4, Theorem 5.11, manuscript pp.42–44; [G95], §9.2, pp.310–311; [G04], §5.5, pp.47–51.) *Needs:* §§3.4–3.6, the universal regulator and Borel rank/covolume contracts.

The period witness is `L₃([1])=ζ(3)` over ℚ, while the Tate-divided Borel coordinate has period in `ℚˣπ⁻²ζ(3)`. For a general number field, multiplication by `π²` in each of `r₁+r₂` rows changes exponent `-2r₁-5r₂` to `-3r₂`, exactly the determinant exponent required here. A putative rational scalar without this period conversion fails already over ℚ.

### 3.8 Cycle lifting, special values and the exact proof boundary

Prove the unconditional existence headline `zagier_three_exists`: for every number field there are `d=r₁+r₂` raw rational symbol families `yⱼ` satisfying `IsCycle3`, with `Z₃(F;y)=qζ_F(3)` and `q∈ℚˣ`. Lift a rational K₅ basis through the configuration maps, apply the regulator comparison and use Borel's covolume theorem. Since `d>0`, rescaling one family can make `q=1`. (Goncharov [G95], Theorem 1.1, p.203; [G94], §3 and Theorem 5.11.) The Lean headline uses an equivalence from `Fin(r₁+r₂)` to all infinite places, so no row can be omitted or repeated.

The stronger target `cycleLifting_three` says that every `z∈kerδ₃` over an infinite field has a stable degree-five rational group-homology lift giving that cycle under the configuration comparison. For a number field, its primitive projection has the same pairing with the primitive Borel class. The source asserts the required passage using the equivariant spectral sequence for **all** projective configurations, not just generic ones. A full proof must compute the higher differentials and the degenerate-row contributions. Those computations are not displayed in [G95, §9.2, pp.310–311] and are a proof obligation of this target. One must also verify stabilization and primitive projection. This gap is not an assertion that the published existence theorem is conjectural.

After that target and the exact normalization adapter, prove `regulatorImageContainment_three`: the ℚ-span of every `L₃` regulator column lies in the ℚ-span of `π²` times the selected Borel regulator image. Taking determinants gives `zagier_three_everyFamily`:

```text
for all y₁,…,y_d ∈ ker δ₃,  Z₃(F;y)=q ζ_F(3) for some q∈ℚ.
```

This consequence needs containment of period images; it does not need or prove an isomorphism from all of `H¹Γ` to K₅. It is conditional on the stated cycle-lifting proof obligation in the build. (Goncharov [G95], §9.2, pp.310–311, together with the Borel covolume formula.) *Needs:* §3.7, the all-configuration spectral sequence and the primitive Hurewicz contract.

**Checks.**

- For `F=ℚ`, `[1]₃` is a cycle with `Z₃=ζ(3)` and nonzero determinant. Omitting the real row would give an empty determinant and fail this case.
- For `F=ℚ(i)`, the family `[1]₃` has `Z₃=π³ζ(3)/2=16ζ_F(3)`, since `ζ_F(3)=π³ζ(3)/32`.
- For a zero family or two equal columns, the every-family formula has scalar zero. It cannot be rewritten as `ζ_F(3)=q·Z₃` for every family.
- Rational column change by a matrix `A` multiplies `Z₃` by `det A`; singular `A` is allowed in the every-family statement. Full real rank alone would not imply rationality of those coordinates.

### 3.9 Transfer beyond top cohomology

The transfer on `H³` in §3.6 is unconditional. A chain transfer on the whole polylogarithmic complex is a different target, `conditionalComplexTransfer`. State it only after assuming a suitable weight-four homotopy/residue comparison, together with independence of a primitive element, compatibility under towers and the localization compatibilities needed to produce an actual morphism in the derived category. The quasi-isomorphism of one residue map alone does not specify those coherences. The intended transfer is covariant for finite field extensions, equals multiplication by the extension degree after restriction and agrees with the Milnor norm in top degree. (Goncharov [G95], §1, paragraphs 14–15, pp.237–241; the homotopy conjecture is stated precisely in §4.7.) *Needs:* the conditional statement of §4.7 and the additional coherence targets; this is not a source of unconditional maps used earlier.

### Examples

The endpoint `[1]₃` simultaneously detects the correct odd-weight quotient, supplies a nonzero regulator period and fixes the number of archimedean rows. The rational prime wedges in §§3.2 and 3.5 detect differential signs before any real regulator is applied. The generic configuration with triple ratio one explains why admissibility must allow that endpoint.

### Dependencies

Layers 1–2, the rational pre-Bloch group, Milnor symbols and norms, primitive K-theory, bar homology, Borel regulators and the early universal Chern regulator. General motivic quasi-isomorphy and derived transfers are not used for the existence theorem. The every-family result has the additional all-configuration cycle-lifting obligation stated in §3.8.

## Layer 4: inductive Bloch groups and the meaning of Zagier's statement

### 4.1 Rational-curve relations and specialization

Construct `higherBlochGroup F n` for all infinite fields simultaneously by induction on the weight. The rational-curve presentation follows [GR]; [G95] instead permits families on arbitrary smooth connected curves, and equality with that broader presentation is not assumed here. Start with `B₁(F)=U(F)`. For `n≥2`, form the raw map on `ℚ[ℙ¹(F)]`, with endpoint symbols zero, given by `δ₂[x]=(1-x)∧x` or `δₙ[x]=[x]ₙ₋₁⊗u(x)` for `n>2`. Let `Aₙ(F)` be its kernel. Define `Rₙ(F)` to be generated by `[0]`, `[∞]` and all `sp₁ α-sp₀ α` for `α∈Aₙ(F(t))`; set `Bₙ(F)=ℚ[ℙ¹(F)]/Rₙ(F)`. Specialization is projective: a pole goes to infinity, not to an arbitrary field-totalized value. The differential on the quotient is defined only after proving that these generators lie in its raw kernel. (Goncharov [G95], Introduction, pp.198–199, and §1, paragraph 9, Lemma 1.16, pp.220–222; [GR], §1.1, pp.4–5.)

Prove `relationSpecialization_induction`: rational-curve relations remain relations after the valuation specializations needed in the induction. Prove `higherDelta_wellDefined`, `specialization_delta`, functoriality for field embeddings and independence of representatives. For a valuation with arbitrary residue extension, include the specialization theorem on that residue field; a proof only for rational points over `F` is insufficient. The required induction includes rational functions with poles and specialization at zero or one. When a presentation uses only rational places, the extension to general discrete valuations is an additional proof obligation rather than a consequence of notation.

The planning API is `higherBlochGroup.mk`, `mk_zero`, `mk_infty`, `higherDelta_mk`, `relationSpecialization`, `higherBlochGroup.map`, `map_comp` and `specialization_delta`. The construction is independent of a chosen analytic embedding; analytic periods enter §4.3. *Needs:* §3.3, the lower-weight quotient and its specialization theorem, rational-function valuations and residue reduction.

**Checks.**

- The rational function `1/t` specializes to infinity at `t=0`, so its raw specialized symbol is zero. It is not evaluated by Lean's total inverse at zero and then treated as a finite value without explanation.
- Weight one is `U(F)` with `[xy]=[x]+[y]`, not the free symbol module. In every higher weight `[0]=[∞]=0`.
- In odd weight `[1]` may be nonzero: the weight-three map to `L₃` gives `ζ(3)`. In even weight the inversion relation gives `[1]=0` over ℚ.
- A constant family specializes to the same class at zero and one. A nonconstant family is admitted only after its raw boundary is zero; an arbitrary difference `[f(1)]-[f(0)]` is not a relation by definition.
- At residue characteristic two the uniformizer-unit formulas still make sense; the rational construction has already killed the integral sign discrepancy. No integral descent theorem is inferred from this fact.

### 4.2 Complexes, inversion and low-weight comparison

Prove `higherSymbol_inversion`: `[x]ₙ+(-1)^n[x⁻¹]ₙ=0` for `x≠0`. Include the endpoint consequence `[1]ₙ=0` for even `n`, and retain `[1]ₙ` for odd `n`. Define `higherPolylogComplex F n` in degrees `1,…,n` by

```text
Bₙ → Bₙ₋₁⊗U → Bₙ₋₂⊗Λ²U → … → B₂⊗Λⁿ⁻²U → ΛⁿU.
```

The differential is `δ` on the symbol factor followed by wedge; its square is zero from the repeated unit and the lower-weight relation calculation. Define specialization maps of these complexes with the same residue/shift signs as §3.3. Prove naturality and commutation with the differential at each degree. These are `higherPolylogComplex_d_sq`, `higherComplex_map` and `higherComplex_specialize`. (Goncharov [G95], (0.1)–(0.3), p.199, §1, paragraph 9, (1.25)–(1.27), pp.220–222, and paragraphs 14–15, pp.237–241; [GR], §1.1, (5)–(6), pp.4–5.)

Use the supplier's rational Suslin rigidity to prove that explicit `B₂` identifies with inductive `B₂`. State `explicitToInductive_three` as the natural surjection from the explicit weight-three presentation to the inductive group, checking every defining relation by a rational-curve family. Its injectivity is the comparison conjecture and is not used earlier. State `polylogMotivicComparisonConjecture` as the proposition that `H^iΓ(F,n)` identifies with the weight-`n` Adams piece `grⁿ_γK_{2n-i}(F)_ℚ`, naturally and compatibly with residues. It is not declared an instance or a theorem for general weights. The alternative comparison using `grⁿ_rank` also requires the independent rank–Adams comparison conjecture. (Goncharov–Rudenko [GR], §1.2, p.9; Conjecture 1.4 and preceding discussion, pp.6–7.) *Needs:* §4.1, K3BlochGroups V.4 and the earlier K-theory contracts.

**Checks.**

- The general complex specializes to the displayed three-term weight-three complex in §3.2 only after applying the explicit-to-inductive comparison; no conjectural inverse is inserted.
- At `x=1,n=3`, inversion is the tautology `[1]-[1]=0`; at `n=4` it gives `2[1]=0`, hence `[1]=0` rationally.
- At `x=3,n=2`, `δ₂[3]=2∧3≠0`. A convention with the supplier's unnegated boundary gives `-2∧3` and must be converted.
- In degree one there is no incoming differential, so `H¹=kerδₙ`. In degree `n`, the quotient by Steinberg wedges gives the Milnor group; it is not the full Quillen group without its appropriate comparison.

### 4.3 Analytic evaluation and constancy

For a raw rational family `α(t)=∑qᵢ[fᵢ(t)]`, define `cycleEvaluationₙ(α)(t)=∑qᵢLₙ(fᵢ(t))` away from the finite set of zeros, poles and branch degenerations. If `α∈Aₙ(ℂ(t))`, prove `cycleConstancyₙ`: this function is constant, and its continuous projective limits agree at every specialization. The proof differentiates the explicit single-valued formula, uses the lower-weight relation factorization and then extends through the exceptional points by continuity. Hence `Lₙ` kills `Rₙ(ℂ)` and gives `higherBlochPeriod:Bₙ(ℂ)→ℝ`. This is stronger than just observing the familiar inversion and distribution equations. One must prove constancy for **every** rational-curve cycle used in the definition. (Goncharov [G95], §1, paragraph 9, Proposition 1.18 and Corollary 1.19, pp.223–224; [GR], §1.1, p.4, inductive definition and the single-valued functional-equation requirement.)

The analytic relation descent and the induction in §4.1 are separate load-bearing targets. Where a source invokes a general functional-equation theorem, its proof must supply precisely this kernel-to-constancy implication, including the endpoints. No result that all algebraic functional relations are generated by the inductive relations is assumed. The API is `cycleEvaluation_add`, `cycleEvaluation_specialize`, `cycleConstancy`, `higherBlochPeriod_mk`, `higherBlochPeriod_map`. *Needs:* Layers 1 and 3, §§4.1–4.2 and the explicit higher differential formula.

**Checks.**

- A constant rational symbol cycle has its expected constant period; a term specializing to a pole contributes `Lₙ(∞)=0`.
- The raw family `[t]₃` is not a kernel element: its boundary `[t]₂⊗u(t)` is generally nonzero. Its nonconstant analytic value is not a counterexample to cycle constancy.
- The five-term cycle at weight two specializes to zero period; its proof agrees with §1.5 and the supplier's rigidity convention.
- The three-term weight-three relation evaluates to the nonzero constant `ζ(3)` before subtracting `[1]₃`; the normalized relation evaluates to zero. A rule making every relation a homogeneous sum without the endpoint correction fails here.

### 4.4 Three Zagier assertions and their normalization

Define `isPolylogCycleₙ(y)` by `δₙ y=0`, and define `zagierDeterminant` as `Zₙ` in the conventions. The light `periodMatrix` and `normalizedPeriod` in Suggested.lean evaluate raw finite sums; when the cycle condition and relation descent hold, this equals the quotient period determinant. Define three distinct propositions for a number field and integer `n≥2`:

```text
Rational existence: ∃ cycle family y and q∈ℚˣ, Zₙ(F;y)=q ζ_F(n).
Every-family rationality: ∀ cycle families y, ∃ q∈ℚ, Zₙ(F;y)=q ζ_F(n).
Regulator-compatible comparison: a specified K-theory-to-cycle map and/or
  period-image identification with the calibrated Borel rational image.
```

The last proposition must state whether it includes only a map **into** cycles or also containment of **all** cycle periods in the Borel rational image. Those are different clauses. The map plus Borel's real isomorphism gives existence; all-cycle image containment gives every-family rationality. Neither conclusion entails an abstract motivic isomorphism. A real full-rank map alone gives neither rational conclusion without a rational normalization theorem. (Zagier [Z90], §§2–3, pp.397–407; [GR], Theorem 1.2, p.5; Goncharov [G95], Theorem 1.1, p.203.)

Prove `zagierAssertion_implications` with these explicit clauses and `zagierPeriod_calibration`: if the calibrated period columns equal `λₙπ^(n-1)` times Borel columns with `λₙ∈ℚˣ`, their determinant is in `ℚˣ√|disc F|π^(-eₙ)ζ_F(n)`. Prove `normalizedPeriod_empty`, basis-change and row-permutation rules, and invariance of rational proportionality under replacing a chosen complex embedding by its conjugate. The named predicates express statements of conjectures at general weights, not automatic truth values. *Needs:* §4.3 and BorelRegulators R.3–R.5 with its exact coordinate conversion.

**Checks.**

- Odd `n` uses `d=r₁+r₂` and exponent `nr₂`; even `n` uses `d=r₂` and exponent `n(r₁+r₂)`. Substituting `N=r₁+2r₂` proves both from `n(N-d)`.
- Over ℚ at weight three, the one-column raw family `2[1]₃` has period matrix entry `2ζ(3)` and `Z₃=2ζ(3)`. It is a cycle, so scaling changes the rational factor rather than the assertion.
- Over `ℚ(i)` at weight two, `Z₂([i])=3ζ_F(2)`; at weight three, `Z₃([1])=16ζ_F(3)`. The discriminant factor is `1/2` in both, and the π powers differ.
- With zero columns, the determinant is zero. Every-family rationality permits `q=0`; rational existence requires nonzero determinant because `ζ_F(n)>0`.
- If `d>0`, a nonzero rational factor can be normalized by scaling one column. If `d=0`, no column exists to scale and the value is fixed by the empty determinant.
- Changing a complex representative negates its even-weight row but leaves the odd-weight row unchanged. Reordering columns changes the determinant by the permutation sign; rational proportionality survives.

### 4.5 The explicit weight-four complex and its regulator input

Define `weightFourExplicitComplex` using the explicit groups `B₂^exp,B₃^exp` and the subspace `B₄^comb` generated by one-variable weight-four symbols in the combinatorial Lie coalgebra `L₄^comb`. The complex is

```text
B₄^comb → B₃^exp⊗U → B₂^exp⊗Λ²U → Λ⁴U.
```

The additional `Λ²B₂` term belongs to the full weight-four Chevalley–Eilenberg complex, not this polylogarithmic complex. The Part II input proves that the polylogarithmic subcomplex maps quasi-isomorphically to that full combinatorial complex. The construction needs the `Q₄` relations and cobracket, including the two-variable symbols `[x,y]₃,₁`; it is not obtained by defining an arbitrary quotient to make `d²=0`. (Goncharov–Rudenko [GR], Theorems 1.13–1.14 and Corollary 1.15, (42)–(44), pp.15–16.)

Specify `weightFourRegulatorInput` by two independent conclusions supplied by **Polylogarithms, Part II: motivic correlators and cluster polylogarithms**. First, it gives a natural map `κ:K₇(F)_ℚ→kerδ₄^exp` with periods a nonzero rational multiple of `π³` times the selected Tate-divided Borel regulator. Second, it proves that the periods of **all explicit cycles** lie in that calibrated rational regulator image. For existence, only the first clause is needed. The second clause yields every-family rationality by a rational determinant computation. The source's period function is

```text
L₄* = (5L₄ + (1/3)L₂ log²|z|)/16.
```

A comparison with `L₄` on cycles must prove that the lower-weight logarithmic correction vanishes in the relevant period factorization. These two functions are not scalar multiples pointwise. The exact Part II contract comprises the motivic correlator realization, the combinatorial Lie coalgebra extension, the decorated-flag configuration map, the regulator-class comparison and this cycle-level period conversion. (Goncharov–Rudenko [GR], Theorem 1.3(iv), pp.6–7; Theorems 1.13–1.14, pp.15–16; Theorem 7.6, pp.70–71; §8.2, (189)–(193), pp.76–78; Theorem 9.1, p.87, and §9.3, pp.90–94.)

Prove the headline `zagier_four_exists` in this explicit presentation from `κ` and Borel's theorem. The Lean statement retains the complete explicit cycle condition `IsCycle4`, and its equivalence of rows with all complex places prevents an arbitrary repeated embedding. Prove `zagier_four_explicit_everyFamily` from the second clause, with scalar allowed to be zero. The exponent calculation is `π^(3r₂)` times the Borel determinant exponent `r₂-4N`, giving `-4(r₁+r₂)` as required. This is a published theorem package; general motivic comparison and its presentation-isomorphism conjectures remain separate. *Needs:* §§3.1–3.2, §4.4 and the stated Part II contract.

**Checks.**

- In `B₃^exp⊗U`, the boundary of `[1]₄` is `[1]₃⊗u(1)=0`, regardless of whether the explicit endpoint class `[1]₄` itself is zero. The universal cycle predicate must allow it.
- A chain with two equal unit factors has zero second differential by exterior alternation. Adding a `Λ²B₂` term to the displayed explicit polylogarithmic complex would give the wrong degree-two carrier.
- The correction `L₂(z)log²|z|` is nonzero at a generic nonreal point with `|z|≠1`; its vanishing on periods must use the cycle identity. On `|z|=1`, the correction is pointwise zero, which alone does not prove the general comparison.
- A zero explicit family has zero determinant when `r₂>0`; it is covered by every-family rationality with scalar zero and cannot serve as an existence witness.

### 4.6 Changing presentations and the cycle obstruction

Define `presentationChainMap:Γ_exp(F,4)→Γ_ind(F,4)` by the symbol maps. The weight-two component is the established isomorphism and the weight-three component is the surjection `p₃`; define `p₄:B₄^comb→B₄^ind` and prove surjectivity by generation and the exact relation comparison. Prove the commutative differential square and compatibility with `L₄` periods. Neither injectivity of `p₃` nor equality of the two degree-one kernels follows from surjectivity of `p₄`. The full relation check for `p₄` is a target, `presentationChainMap_wellDefined`, requiring the Part II presentation theorem; a map on symbol generators alone does not suffice. (Goncharov–Rudenko [GR], comparison discussion, pp.9 and 12, and complex (44), p.16.)

For the resulting square write `C=B₄^comb`, `D=B₄^ind`, `E=B₃^exp⊗U`, `J=B₃^ind⊗U`, `a=δ₄^exp`, `b=δ₄^ind`, `p=p₄`, `q=p₃⊗id`; thus `qa=bp` and `p` is surjective. Define `T=ker q`, `H=a(ker p)⊆T`, and

```text
cycleObstruction ω:ker b → T/H,  ω(y)=[a(x)] for any p(x)=y.
```

Prove independence of the lift, linearity and `cycleObstruction_zero_iff`: `ω(y)=0` exactly when there is a lift with `a(x)=0`. Thus `kerω` is the image of `ker a→ker b`, whose kernel is `ker p∩ker a`. These are elementary kernel/range/quotient statements, applied here to a concrete square. The native linear-map theorem `cycleLift_iff` states the lift criterion without constructing a new quotient carrier. The API is `obstructionSubmodule`, `cycleObstruction_lift`, `cycleObstruction_zero_iff`, `cycleObstruction_image` and `cycleObstruction_injective_target`. *Needs:* the presentation square and Mathlib's linear kernels, ranges and quotient modules.

Existence transfers to the inductive presentation by pushing the explicit witness family forward, since its periods are preserved. The every-family formula transfers for a family whose columns all have obstruction zero. To obtain it for **every** inductive family, prove either `ω=0` or the weaker assertion that every inductive cycle period lies in the calibrated rational regulator image. The latter does not require all cycles themselves to lift. This is the additional target `weightFourInductive_periodContainment`; it is not supplied merely by constructing `κ`. The source states Theorem 1.2 using the inductive notation; its explicit-complex proof and the unproved comparison between presentations must be reconciled at this precise point. (Goncharov–Rudenko [GR], Theorem 1.2, p.5, §1.2, pp.9–12 and §9.3, p.94.)

**Checks.**

- An explicit cycle has obstruction zero. Replacing a lift `x` by `x+k`, `k∈ker p`, changes `a(x)` by an element of `H`, so the class is unchanged.
- For `C=D=E=ℚ`, `J=0`, `p=a=id`, `b=q=0`, every element of `D` is a cycle but only zero lifts to a cycle; `ω(1)≠0`. A surjective presentation map therefore does not prove cycle surjectivity.
- If `q` is injective, `T=0` and the obstruction vanishes. This is a sufficient hypothesis, not an established property of the weight-three comparison.
- A nonzero obstruction does not itself disprove a scalar period identity: an excess cycle might still have a period in the correct rational image. This explains the weaker sufficient target.

### 4.7 Empty determinants, finite residues and the homotopy conjecture

For totally real `F`, weight four has `r₂=0`, and `Z₄=π^(4N)/√|disc F|`. Prove `weightFour_totallyReal`: this is a nonzero rational multiple of `ζ_F(4)`, using the supplier's even special-value formula with all discriminant and signature factors. No family can be rescaled when the matrix is empty. In particular over ℚ, `Z₄=π⁴=90ζ(4)`. This case is part of the existence theorem and is handled directly, rather than by dividing by the number of columns. (Goncharov–Rudenko [GR], Theorem 1.2, p.5; BorelRegulators R.5 and the even special-value theorem supplied there.)

Define the finite-polynomial-place residue map in weight four

```text
Γ(F(t),4)/Γ(F,4) → ⊕_{p monic irreducible in F[t]} Γ(F[t]/(p),3)[-1].
```

Use projective specialization in each symbol factor, uniformizer-first exterior residue and the degree sign of §3.3. Prove finite support, vanishing on constants, naturality and the chain identity. Infinity is **not** in the index set. State `polylogHomotopyConjecture_four` as the proposition that this map is a quasi-isomorphism under the stated infinite-field hypotheses and rational coefficients. The argument must handle nonrational residue fields, not only linear `p`. This conjecture is the homotopy input mentioned in §3.9; full derived transfers still need the extra independence and tower coherences there. (Goncharov [G95], §1, paragraphs 14–15, pp.237–241; [GR], §1.1, pp.4–5, inductive complexes.)

**Checks.**

- At `p=t-a`, a constant symbol tensor a uniformizer has the expected specialized symbol residue; a constant complex has every finite residue zero.
- A pole of a rational function specializes projectively to infinity, contributing the zero endpoint symbol. It is not reduced as a valuation unit.
- At `p=t²+1` over ℚ, the residue field is `ℚ(i)` and the target uses that field's symbols. A direct sum only over `a∈ℚ` misses this summand.
- Adding infinity to the finite-place map changes the target and introduces a reciprocity relation; it is not the same conjecture. A residue theorem for the projective line cannot silently replace this affine finite-place homotopy statement.

### Examples

Weights three and four already exhibit all distinctions: odd-weight real rows and the nonzero class `[1]₃`; even-weight complex rows and an empty determinant over totally real fields; explicit versus inductive kernels; and existence versus every-family rationality. The one-dimensional obstruction square shows why none of these distinctions is resolved by a surjection on symbols.

### Dependencies

Layers 1–3, rational-function specializations, the Borel rank/covolume normalization and the low-weight symbol suppliers. The explicit weight-four proof uses the named Part II motivic-correlator contract. The inductive every-family extension and the finite-place homotopy theorem have exactly the additional hypotheses stated above; they are not prerequisites of the earlier analytic or weight-three existence results.

## Layer 5: logarithmic currents and explicit regulators

### 5.1 Test forms and currents

On a second countable oriented smooth real `m`-manifold, equip the compactly supported smooth `k`-forms with the locally convex inductive-limit topology of the fixed-compact-support Fréchet spaces. Each fixed-support topology uses every coordinate derivative seminorm on a finite chart cover. Call this space `TestFormsᵏ(M)`. This adds a topology to the existing smooth compact-support carrier, rather than defining manifold forms again. Prove chart independence, the identification with Mathlib's `TestFunction` with alternating-map coefficients in a chart, continuity of exterior derivative and continuity of extension by zero for support compactly contained in an open embedding. The API is `TestForms.ext`, `chart`, `extendZero`, `extendZero_comp` and `d_continuous`. (Demailly [DEM], Chapter I §2.A, pp.13–14.)

Define a degree-`q` `ManifoldCurrent` as the continuous linear dual of `TestForms^{m-q}`. Complex coefficients and `(p,q)` type use the complexified cotangent decomposition. Set `dT(φ)=(-1)^(q+1)T(dφ)`. A locally integrable `q`-form gives `[α]_raw(φ)=∫α∧φ`. Prove `ofForm_ae`, `d_apply`, `d_sq`, extensionality and chart coefficient comparison with scalar distributions. Proper-on-support pushforward is defined by test-form pullback; for holomorphic maps the real dimension change is even and it commutes with `d,∂,bar∂`. Pullback of arbitrary currents is provided for submersions and open embeddings. Wedge multiplication is by a smooth form; there is no general product of two currents. (Demailly [DEM], Chapter I §2.B–C, pp.14–18.) *Needs:* the differential-geometry supplier, chart test functions and continuous duality.

**Checks.**

- On the empty manifold `TestFormsᵏ=0`; in a real chart, degree-zero forms give exactly scalar smooth test functions with their LF topology, not merely the same underlying functions.
- Fixed bumps translated to disjoint balls escaping every compact subset of ℝ converge to zero in the compact-open smooth topology but **not** in the LF test topology. This detects the wrong dual space.
- A compactly supported form on an open chart extends by zero smoothly. A function remaining nonzero at the boundary of the open interval does not satisfy the required support condition and has no such smooth extension.
- The top-degree Dirac current at `x` evaluates a scalar test function at `x`, agreeing with `Distribution.delta`; its coordinate derivative evaluates the test derivative with a minus sign, agreeing with `Distribution.lineDerivCLM`.
- Locally integrable forms equal almost everywhere give the same current. At degree zero the formula `d[α]=[dα]` follows from the sign `(-1)^(q+1)` and Stokes.
- A smoothing of `δ₀` at scale `ε` has square mass growing like `ε⁻ᵐ`; no canonical current product `δ₀·δ₀` is introduced. Smooth multiplication and submersion pullback do not authorize this product.

### 5.2 Analytic cycles, resolutions and Poincaré–Lelong

For a pure codimension-`c` closed analytic subset `Y` of a complex `d`-manifold, define `analyticCycleCurrent` by integrating over `Y_reg` with its complex orientation. Prove local finite mass and closedness, then extend additively with multiplicities to cycles. The proof of closedness across the singular locus requires the positive-current extension theorem: a positive closed current on the complement of a locally complete pluripolar set, with locally finite mass, extends by zero as a closed current. Establish its exact local hypotheses and the finite-ramified-projection mass estimate before using it. This is the target `analyticCycleCurrent_extension`; finite integrability alone does not prove closedness. Algebraic resolutions compute the same current by proper pushforward. (Demailly [DEM], Chapter III §2.A–B, El Mir's Theorem 2.3, Lemma 2.6 and Theorem 2.7, pp.139–140.)

Prove `currentResolution_deRham` and `currentResolution_dolbeault`: smooth forms and currents are quasi-isomorphic sheaf complexes for `d`, and in each fixed holomorphic degree for `bar∂`. The local constructions are smoothing with compactly supported homotopies and the distributional Dolbeault homotopy; fine sheaves globalize them. Degree-zero kernels are locally constant or holomorphic as appropriate, not zero. (Demailly [DEM], Chapter I §2.D, Theorem 2.24, pp.19–20, and §3.E, Lemma 3.29, pp.28–29.)

For a meromorphic `f` not identically zero on any component, prove local integrability and

```text
ddᶜ[log|f|] = [div f]_raw,
ddᶜ = (i/π)∂bar∂ = (1/(πi))bar∂∂.
```

On a curve this gives `d[darg f]=2π[div f]_raw`. A local factorization proves the statement at regular divisor points. To extend through codimension at least two, prove the needed order-zero normal-current support theorem with its dimension bounds; this is the named target `poincareLelong_singularSupport`, not an application to arbitrary distributions. (Demailly [DEM], Chapter III §2.C, Theorem 2.10 and Corollary 2.11, p.141, and Theorem 2.15, pp.143–144.) *Needs:* §5.1, local complex analysis and the stated extension/support targets.

**Checks.**

- A point on a complex curve gives ordinary Dirac mass. The divisor of `z^r` has current `rδ₀`, so multiplicity cannot be discarded.
- In codimension zero the raw cycle current of `X` is integration over `X`; in the normalized convention of §5.6 it is `(2πi)⁻ᵈ[X]_raw`, the current of the constant form one.
- On ℂ, `ddᶜlog|z|=δ₀` and `ddᶜ(-log|z|)+δ₀=0`. Interchanging `∂bar∂` with `bar∂∂` without the sign reverses this divisor.
- On a star-shaped chart every closed current of positive degree is locally exact; degree zero retains constants. This tests the cohomological shift in the resolution.
- A holomorphic nowhere-vanishing unit has divisor zero and `ddᶜlog|f|=0`. The identically zero meromorphic function is excluded because its logarithm is not locally integrable.

### 5.3 Admissible parameter loci and logarithmic Green forms

For a smooth projective complex variety and a fixed codimension `c`, degree `e≥0`, simplex and distinguished hyperplane, define `admissibleChowLocus` inside the supplier's Chow parameter scheme by requiring every cycle component to meet each of the finitely many simplex faces properly and no component to lie in the distinguished hyperplane. The universal incidence cycle restricts properly over this locus. Face and vertex maps are supplied only on loci where dimensions and proper-intersection conditions are preserved. Prove openness of the bad-intersection complement and compatibility of the restricted incidence cycle with these maps. (Goncharov [G04], §3.1, pp.26–27.) *Needs:* AlgebraicModuliForArithmeticGeometry Part II R09.2, analytification and cycle intersection.

For a codimension-`p` cycle `Z`, define a logarithmic Green form as the Green object represented by a pair `(ω,g)` in the supported Deligne complex whose relative class is `cl(Z)`, with `g` smooth off `|Z|` and logarithmic after a suitable resolution. A local basic logarithmic representative has shape `∑λⱼαⱼ+β`, with logarithmic functions `λⱼ`, smooth `β` and appropriate `(p-1,p-1)` coefficient forms whose required restrictions are `∂bar∂`-closed. Requiring only an off-support equation would lose the cycle class and is insufficient. Prove `logGreenForm_pullback` for admissible transverse cycle pullbacks, the change-of-representative API and `greenForm_toCurrent`. (Burgos [BUR], Chapter II, Definition 4.2 and Lemma 4.5, pp.79–81.)

Prove `logarithmicCurrent_integrable`: a logarithmic Green form of ordinary degree `r<2p` has a locally integrable current. For `r<2p-1`, its differential is the current of its differential; in the critical Green degree the identity is `d_D[g]+δ_Z=[ω]` in the normalized Deligne convention. Establish the local estimates after normal-crossing resolution and use them to prove the Green-form/Green-current class comparison is an isomorphism. It does not make arbitrary current pullback possible. (Burgos [BUR], Chapter II, Proposition 3.1 and Corollary 3.8, pp.73–78; Theorem 4.3, pp.79–83.) *Needs:* §§5.1–5.2 and the supported Deligne model in §5.9.

**Checks.**

- The zero effective cycle at `e=0` is admissible; a component contained in a simplex face or in the distinguished hyperplane is not. A parameter space containing all cycles without these exclusions fails the boundary construction.
- A family in which intersection dimension jumps leaves the good locus. A face map is not asserted on that whole family merely because its generic member is admissible.
- For `p=1` on a punctured disc, `g=-log|z|` has zero smooth curvature off zero but its current satisfies `ddᶜg+δ₀=0`. The supported class records this residue.
- A smooth Green representative is a special case. A form with a genuine nonintegrable `|z|⁻²` coefficient is not admitted solely by calling it logarithmic.
- The strict inequalities `r<2p` and `r<2p-1` differ: the critical degree has the cycle-current correction. Deleting it would make the principal-divisor example false.
- Pullback along a map whose image lies in the singular support is not supplied. An admissible pullback of a smooth representative agrees with ordinary smooth-form pullback.

### 5.4 The logarithmic r forms and variety residues

For nonzero rational functions `f₁,…,f_m`, `m≥1`, define the `ℝ(m-1)`-valued ordinary `(m-1)`-form on their common regular unit locus by

```text
rₘ₋₁(f₁,…,f_m) = Alt_m Σ_{j≥0, 2j+1≤m}
 log|f₁| dlog|f₂|∧…∧dlog|f₂ⱼ₊₁|
       ∧d(i arg f₂ⱼ₊₂)∧…∧d(i arg f_m)
 / ((2j+1)!(m-2j-1)!).
```

Prove alternation and multiplicative additivity, so it is defined on the exterior power of the rational units. Prove the ordinary differential identity off the divisors, with the indicated projection of `dlog f₁∧…∧dlog f_m`. For an irreducible codimension-`c` subvariety `Y⊂X`, the integral of this form over `Y_reg` against a complementary compact test form converges, defining a current of degree `m-1+2c` on `X`. Resolve the combined divisors and use cancellation of the alternating expression; individual logarithmic terms need not have an integrable absolute majorant before cancellation. (Goncharov [G04], §2.4–2.5, (13)–(18), Theorem 2.4 and Lemma 2.5, pp.14–16.)

For a normal variety, define `varietyExteriorResidue` as the finite sum of codimension-one valuation residues, using the residue-field norm/pushforward when required by the chosen target. For a nonnormal subvariety, normalize first and push the prime-divisor contributions forward with their residue degrees. Prove finite support and the uniformizer formula. The current differential identity must be converted **degree by degree** through the Deligne/Wang dictionary of §§5.6–5.7. The ordinary-`d` residue formula printed for general `r` in [G04] does not by itself settle the low-weight sign in the normalized complex. The target `rCurrent_deligneDictionary` proves the conversion, including the top `2bar∂∂` operator. The weight-two instance is fixed by Poincaré–Lelong below; no unchecked universal ordinary-`d` identity is used to define the chain regulator. The API includes `rForm_alt`, `rForm_mul`, `rCurrent_resolution`, `varietyExteriorResidue_finite` and `rCurrent_deligneDictionary`. *Needs:* §§3.3, 5.1–5.3 and algebraic resolution.

**Checks.**

- `r₀(f)=log|f|`, `r₁(f,g)=iη(f,g)`, and `r₂` is `Alt₃( (1/6)log|f|dlog|g|∧dlog|h| -(1/2)log|f|darg g∧darg h )`. The minus sign in the second term comes from `i²`.
- Repeated entries give zero. Multiplying one entry by a constant of norm one changes no logarithm jet; a constant of norm different from one may contribute nonzero terms.
- If `Y` has codimension one and `m=1`, the resulting current has ordinary degree two, not zero. Forgetting the codimension shift gives the wrong test-form degree.
- At `ord_z` and a constant `c`, the exterior residue of `z∧c` is `c`, while `dη(z,c)=-2πlog|c|(δ₀-δ_∞)` on `ℙ¹`. The raw current sign and normalized Deligne sign must be reconciled, rather than copied from an unshifted formula.
- A formal product `log|z|·dz/z∧dbar z/bar z` is not locally integrable near zero. The actual alternating `r` combination is integrated only after its cancellations have been justified.

### 5.5 Raw Deligne and simplex regulators

For a regular projective complex variety define `goncharovDeligneComplex(X,n)` in degrees `1,…,2n`, `n≥1`, by the square of current types `D^{p,q}`, `0≤p,q<n`, with ordinary degree `p+q` placed in cochain degree `p+q+1`, real twist `ℝ(n-1)`, and a final group of closed `(n,n)` currents with twist `ℝ(n)` in degree `2n`. The square differential is the appropriate type projection of `d`; the last differential is `2bar∂∂`. Prove square zero, conjugation compatibility and a quasi-isomorphism to the truncation of the universal real Deligne complex. The proof eliminates the overlapping Dolbeault rows using the explicit cone comparison, not just equality of cohomology dimensions. (Goncharov [G04], §2.2–2.3, Proposition 2.1 and Lemma 2.2, pp.10–13.)

For a projective simplex `L=(L₀,…,L_m)` with distinguished hyperplane `H`, choose affine defining functions whose ratios specify `r_{m-1}(L;H)`. Prove independence of the common choices, alternation of simplex vertices, and the behavior under changing `H`. The top integrated Chow function can be independent of `H` even though lower forms are not. For an admissible codimension-`n` cycle `Y⊂X×Δ^i`, resolve its closure, restrict the simplex `r_{i-1}` and push forward to `X`; define

```text
P^(2n-i)(Y) = (2πi)^(n-i) π_X* rᵢ₋₁(Y),       i>0,
P^(2n)(Y) = (2πi)^n [Y]_raw.
```

The higher Chow carrier and faces are supplied by M.4; this is the new analytic map. Prove independence of resolution, compatibility with faces, and `goncharovRegulator_chainMap` only after completing `rCurrent_deligneDictionary`. The ordinary current degree for `i>0` is `2n-i-1`, exactly matching the raw Deligne cochain degree. The full degree/sign comparison remains a named proof obligation of this model, even though the normalized Wang construction below gives a proven route to the cohomological regulator comparison. (Goncharov [G04], Definition 2.11 and Theorem 2.12, pp.22–24; Theorem–Construction 2.3, pp.13–14.)

For `X/ℝ`, prove the image is fixed by the de Rham involution combining conjugation on points and coefficients. The target over a number field is taken after restriction of scalars to ℚ. Do not use the invariants of only one chosen complex embedding. The API is `goncharovDeligneComplex`, `goncharovDeligneComparison`, `simplexRForm`, `simplexRForm_alt`, `rawChowRegulator_resolution`, `rawChowRegulator_chainMap` and `rawChowRegulator_real`. *Needs:* §§5.1–5.4, the universal Deligne complex and higher Chow complexes.

**Checks.**

- At weight one the raw Deligne complex has degree-one real functions and degree-two closed `(1,1)` currents. Its last differential sends `log|f|` to `2πi[div f]_raw`.
- At `i=0` the regulator is a cycle current, not an undefined `r_{-1}`; at `i=1` a point with coordinate ratio `z/λ` gives the logarithm `log|z/λ|` with the stated period factor.
- A transposition of two simplex vertices reverses the form. A common nonzero scalar in their defining functions cancels from the ratios, but moving the distinguished hyperplane can change lower forms.
- The raw model shifts ordinary current degree by one below the top and changes twist at the top. Assigning ordinary degree `2n-i` at every degree fails the `i=1` logarithm test.
- A complex-conjugate cycle pair has invariant total regulator in the real model; an arbitrary single embedding of a number field is not its real restriction-of-scalars regulator.

### 5.6 The normalized current dictionary

Use the Burgos–Feliu–Takeda real current convention in complex dimension `d`:

```text
[α]_BFT(ω) = (2πi)^(-d) ∫_X ω∧α,
δ_Y(ω) = (2πi)^(-(d-c)) ∫_{Y_reg} ω   for codim Y=c.
```

Thus `δ_Y=(2πi)^(-(d-c))[Y]_raw`. For an ordinary `q`-form, the dictionary from §5.1 includes the Koszul factor `(-1)^q` because its raw convention pairs as `α∧ω`, whereas this convention pairs as `ω∧α` on the even-dimensional real manifold. Transport the current differential and real structure through this dictionary; do not change only the scalar while retaining an incompatible duality sign. The normalized Deligne complex `D^k(X,p)` has ordinary form degree `k-1` and twist `p-1` for `k<2p`, and ordinary degree `2p` and twist `p` at the top. The top operator is `-2∂bar∂=2bar∂∂`. The smooth-to-current map is a quasi-isomorphism. (Burgos–Feliu–Takeda [BFT], §2, (2.1)–(2.2), pp.3–4.)

Prove `bftCurrentDictionary`, its type/conjugation/pushforward compatibility, the cycle-current formula and the degree-one identity `d_D[-log|f|]_BFT=-δ_{div f}`. The dictionary is a map between specified models, not an identification that permits dropping a Tate twist in a scalar-valued numerical formula. *Needs:* §§5.1–5.2 and the universal Dolbeault Deligne model.

**Checks.**

- On a complex curve a point has normalized current `δ_x=δ_x^raw`; in codimension zero `δ_X=(2πi)^(-d)[X]_raw=[1]_BFT`.
- In complex dimension one the ordinary scalar function `-log|z|` has current factor `(2πi)⁻¹`; applying the top differential gives `-δ₀`, consistent with Poincaré–Lelong.
- An ordinary one-form has the extra minus sign when its order in the test pairing is reversed, while a two-form has no such sign. This is a separate issue from multiplying by `(2πi)⁻ᵈ`.
- A Deligne degree `2p-1` Green representative has ordinary degree `2p-2`; its differential jumps to ordinary degree `2p`, not `2p-1`. A single uniform “degree minus one” rule fails at the top.

### 5.7 Wang forms and boundary currents

For degree-one real Deligne elements `u₁,…,u_m` in a Dolbeault algebra define `wangForm T_m` by

```text
S_m^i = (-2)^m Alt_m(u₁ ∂u₂∧…∧∂u_i∧bar∂uᵢ₊₁∧…∧bar∂u_m),
T_m = 1/(2m!) Σ_{i=1}^m (-1)^i S_m^i,       T₀=1.
```

Prove alternation, multilinearity, the right-nested alternating Deligne-product expression, and

```text
d_D T_m(u₁,…,u_m)
  = Σ_{j=1}^m (-1)^(j-1) d_Duⱼ • Tₘ₋₁(u₁,…,ûⱼ,…,u_m).
```

The Deligne product is associative up to the supplied homotopy; the right-nested expression is part of the convention. For `u_j=-log|f_j|`, prove `T_m=(-1)^m r_{m-1}` after placing the result in the declared Deligne model. Define cubical `W_m` using the `m` coordinate ratios and simplicial `G_m` using the simplex ratios. Prove their logarithmic integrability and the normalized current boundary identities:

```text
d_D[W_m] = Σ_{i=1}^m Σ_{j=0}^1 (-1)^(i+j) (δⱼⁱ)*[Wₘ₋₁],
d_D[G_m] = Σ_{i=0}^m (-1)^i (∂ⁱ)*[Gₘ₋₁].
```

Here `j=0` is the zero face, `j=1` the infinity face, and pushforward is along the face embedding. Equivalently the residue formula is `d_D[T_m]=-[T_{m-1}]Res` with its exact exterior-residue convention. Restriction to a degeneracy where a ratio is one gives zero. (Burgos–Feliu–Takeda [BFT], §5, Definition 5.2, Proposition 5.3, pp.8–9, Proposition 5.16 and Theorems 5.23 and 5.26, pp.14–15.) *Needs:* §§5.3–5.6, Dolbeault products, proper-support pushforward and normal-crossing estimates.

**Checks.**

- `T₀=1`, `T₁(u)=u`, and `T₂(u,v)=u(∂v-bar∂v)-v(∂u-bar∂u)`. In particular `T₁(-log|f|)=-r₀(f)` while `T₂=r₁`.
- A zero input logarithm jet gives zero; a coordinate ratio identically one therefore kills `W_m` or `G_m`. An arbitrary nonzero constant does not have zero logarithm jet unless its norm is one.
- In one cube coordinate the boundary is `-δ₀+δ_∞`, agreeing with `d_D[-log|t|]=-δ_{div t}`. Reversing zero and infinity without changing signs fails this check.
- A repeated logarithmic input makes the alternating form zero. The differential formula for `m=2` is `d_Du•v-d_Dv•u`, fixing the deletion signs.
- The cube boundary has `m` pairs of faces, whereas the simplex has `m+1` faces. Its signs are not obtained by identifying their first and last faces.

### 5.8 The cubical regulator

For a smooth projective complex `X`, an admissible codimension-`p` cycle `Z⊂X×□^m` and `□=ℙ¹\{1}`, resolve the closure and define `cubicalRegulator P_c(Z)` by restricting `W_m`, taking its current and properly pushing to `X` in the normalized dictionary. It has Deligne degree `2p-m`. Prove independence of resolution, compatibility with the normalized cubical differential `δ=∑_{i=1}^m(-1)^i(δ₀ⁱ-δ_∞ⁱ)`, and vanishing on degenerate cubes. On the normalized subcomplex every infinity-face pullback is zero. The cycle carrier, normalization and comparison to the unnormalized higher Chow complex are supplied by M.4. (Burgos–Feliu–Takeda [BFT], §6.1, pp.13–15, the cubical regulator and its chain property.)

The API is `cubicalRegulator_resolution`, `cubicalRegulator_face`, `cubicalRegulator_degenerate`, `cubicalRegulator_chainMap` and `cubicalRegulator_degree`. *Needs:* §§5.2, 5.6–5.7, M.4 and algebraic resolution. Only proper-on-support maps are used in the current pushforward; resolving a closure is what supplies properness.

**Checks.**

- At `m=0`, `P_c(Z)=δ_Z`. At `X=Specℂ,p=1,m=1`, the admissible point with coordinate `a≠0,1` gives `P_c(a)=-log|a|`, not its positive.
- A degenerate cube pulled back from fewer coordinates has regulator zero. A cycle contained in a forbidden face is not admissible and cannot be fed to the definition to obtain a boundary value.
- An infinity-normalized cycle has no infinity-face differential terms. The remaining zero-face signs are `(-1)^i`, with the first coordinate negative.
- A codimension-`p` cycle with cube degree `m` produces degree `2p-m`, which may be below the top current degree; assigning it degree `2p` would fail the point-unit example.

### 5.9 Support complexes and the universal regulator comparison

Construct the auxiliary double complex `D_A^{r,-m}=τ_{≤2p}D_log^r(X×□^m,p)` with cubical infinity normalization. Its simple differential is `d_D+(-1)^rδ` in bidegree `(r,-m)`. Let `D_{A,Z}` be the supported cone, `H^p` the cycle-support cohomology complex in its indicated degree, and `g₁:D_{A,Z}→H^p`, `ρ:D_{A,Z}→D_A` the two natural maps. Define the shifted simple comparison complex by

```text
D_AH^q = D_{A,Z}^{q+1} ⊕ H^{p,q} ⊕ D_A^q,
d(a₁,a₂,a₃)=(-da₁, da₂+g₁a₁, da₃-ρa₁).
```

Prove square zero, the cycle map `Z↦(0,cl Z,0)` and the quasi-isomorphism `β:α↦(0,0,α)` from the indicated smooth Deligne base model. These are native mapping-cone and support-comparison constructions; the nontrivial inputs are the support cohomology and logarithmic moving/normalization comparisons, not an arbitrary choice of zero maps. (Burgos–Feliu–Takeda [BFT], §4, pp.5–8.)

Define `integrationComparison φ(α)=π_X*[α•W_m]` for `α` in bidegree `(r,-m)`; its Deligne degree is `r-m`. Before fiber integration the ordinary form degree is generally `r+m-1`, with the `m=0,r=2p` top case handled separately. Prove that it lands in smooth forms on the base when the input does, is a chain map and is a quasi-inverse on cohomology to the base inclusion. Prove the logarithmic Green/Wang product identity, at the critical degree,

```text
d_D[g•W_m] = [ω•W_m] - δ_Z•W_m - [δg•Wₘ₋₁].
```

Below the critical degree the corresponding identity is `[d_Dg•W_m]+(-1)^(r-1)[δg•W_{m-1}]`. Local integrability of this product is proved using the logarithmic normal-crossing estimates; it is not an arbitrary product of currents. Construct the chain map

```text
ψ((ω,g),Z,α) = P_c(Z) - π_X*[g•W_m] + φ(α).
```

It restricts to `P_c` on cycles and to `φ` along `β`. This gives the chain-level comparison with the universal support construction. Composing the rational Chern character supplied by M.6 proves `cubicalRegulator_beilinson`, equality with the universal real Beilinson regulator. (Burgos–Feliu–Takeda [BFT], §6.2–6.3, Theorem 6.11, pp.15–19.) *Needs:* §§5.3, 5.6–5.8 and the early universal M.8 map.

**Checks.**

- At cube degree zero, `W₀=1` and `φ` is the base current map. In the support simple complex `d²=0` uses `g₁d=dg₁` and `ρd=dρ`; the opposite signs in its last two components are essential.
- A cycle cocycle is `(0,cl Z,0)` and maps to `P_c(Z)`. A smooth base element enters as `(0,0,α)` and maps to `φ(α)`.
- For a principal divisor, the logarithmic Green term cancels the cycle current with the sign prescribed by `d_D[-log|f|]=-δ_div f`. Reversing the minus in `ψ` would prevent this cancellation.
- With `m=0`, the critical Green identity becomes `d_D[g]=[ω]-δ_Z`; there is no `W_{-1}` contribution. This is the ordinary Green-current equation.
- The formula in subcritical degree has sign `(-1)^(r-1)`, not a sign depending only on cube dimension. Test `r=1` and `r=2` to distinguish them.

### 5.10 Mixed cube–simplex forms

Define `mixedWangForm M_{n,m}` by applying `T_{n+m}` to the `n` cube logarithms **first** and the `m` simplex logarithms second, with `M_{0,0}=1`. Prove the two boundary identities with cube signs `(-1)^(i+j)` and simplex signs `(-1)^(n+i)`. A ratio one kills the mixed form, so it descends through cube normalization. Resolve an admissible cycle on `X×□^n×Δ^m`, restrict `M_{n,m}` and push forward to obtain `mixedRegulator`, of Deligne degree `2p-n-m`. Its source total differential is `δ+(-1)^n∂`. The degree on the right of [BFT, (6.15)] must be read with both `n` and `m`; omitting one gives a false specialization to an axis. (Burgos–Feliu–Takeda [BFT], §6.4, Proposition 6.12, (6.13)–(6.17), Lemmas 6.16–6.17 and Theorem 6.18, pp.19–21.)

The axis restrictions are `P_c` and the normalized simplicial regulator `P_s`. Apply M.4's mixed quasi-isomorphisms to prove `simplicialCubicalRegulator_agree` on higher Chow homology; together with §5.9 this proves `simplicialRegulator_beilinson`. The simplex hyperplanes used in [G04] and [BFT] differ by `z₀↦-z₀`. The extra factor `-1` has zero logarithmic jet, so it does not alter the normalized forms. Identifying the raw [G04] chain map with this normalized chain map still requires the full degree/sign dictionary of §§5.4–5.6; equality on higher Chow homology in the **normalized** model does not erase that separate obligation. *Needs:* §§5.7–5.9 and M.4's mixed comparison.

**Checks.**

- `M_{0,m}=G_m`, `M_{n,0}=W_n` and `M_{0,0}=1`. The regulator degrees on these axes are `2p-m` and `2p-n` respectively.
- At `n=1`, the simplex face signs are the negative of their `n=0` signs; this is exactly the total-complex factor `(-1)^n`.
- At `(n,m)=(1,1)`, the cube-then-simplex boundary cancellation tests anticommutation of the two differential directions. Interchanging the logarithm blocks without the permutation sign changes the form.
- The simplex coordinate change `z₀↦-z₀` leaves `-log|-f|=-log|f|` and the derivatives unchanged. A scale of norm different from one is not justified by this argument.

### 5.11 Chow polylogarithm forms on parameter spaces

On the admissible Chow locus of §5.3 define `chowPolylogForm ω_p^q`, for `0≤p≤q-1`, by the incidence/Radon pushforward of `r_{p+q-1}`. Its ordinary degree is `q-p-1`. Define these as currents first, prove their restriction is real analytic on the smooth good locus, and prove the face identities `dω₀^q=π_qΩ`, `dω_p^q=Alt(face*ω_{p-1}^q)` and the alternating vertex relation. The exact face signs are induced by the simplex convention of §5.5. For `p=q-1`, this is the scalar Chow polylogarithm, invariant under the indicated torus action and independent of the auxiliary hyperplane; the lower forms generally are not. (Goncharov [G04], Theorem–Construction 3.1 and Theorems 3.3–3.4, pp.26–28.)

The API is `chowPolylogForm_incidence`, `chowPolylogForm_degree`, `chowPolylogForm_face`, `chowPolylogForm_vertex`, `chowPolylogFunction_torus` and `chowPolylogFunction_hyperplane`. Incidence projection properness and the good-locus support condition are part of each statement, rather than suppressed by an unrestricted pushforward operation. *Needs:* §§5.3–5.5, proper-current integration and the exact Chow parameter contract.

**Checks.**

- `p=q-1` has degree zero; `p=0` has degree `q-1`. Reversing these indices gives the wrong scalar case.
- On a degree-one point cycle the incidence formula recovers the corresponding `r` form. A general degree-`e` cycle contributes the full incidence sum, not merely one chosen point.
- The scalar top function is unchanged by the auxiliary hyperplane change allowed by Theorem 3.4. A lower form may change; its differential still satisfies the face identity.
- A cycle failing proper face intersection is outside the good locus. Neither real analyticity nor the current face-pullback formula is asserted at such a parameter.

### 5.12 Green cycle classes and Arakelov cones

For a smooth projective complex variety define `greenChowClass` using pairs `(Z,g)` with `Z` a codimension-`p` cycle and `g` a `(p-1,p-1)` Green current satisfying `ddᶜg+[Z]_raw=ω` smooth. Quotient by current boundaries and the principal pairs `(div_Y f,-push_Y log|f|)` from codimension-`p-1` subvarieties. Prove additivity, forgetful map to the ordinary Chow group, well-defined curvature and the comparison from logarithmic Green representatives. This is the complex-variety Green presentation, not the arithmetic Chow group of a regular model over `Specℤ`. The top two Gersten terms suffice to identify its degree-zero regulator graph with the degree-zero Arakelov presentation; they do not imply a quasi-isomorphism of full Gersten and higher Chow complexes. (Burgos [BUR], Chapter II, Theorem 4.3, pp.79–83; Goncharov [G04], Proposition 2.14, pp.24–25.)

Define `arakelovMotivicComplex(X,n)=Cone(P)[-1]` for the explicit chain regulator, using the declared cochain cone signs. Define `higherArakelovChow` by first quotienting the top group of the truncated Deligne complex by its smooth closed forms, then taking the shifted cone and cohomology. In degree zero this identifies with the Green presentation above. Over ℝ take the de Rham-invariant subcomplex; over a number field apply restriction of scalars. Independence of a change from the higher Chow model to a polylogarithmic motivic model requires a separate compatible regulator quasi-isomorphism and is not assumed. (Goncharov [G04], §1, (3)–(5), pp.3–4, and §2.8, Proposition 2.14, pp.24–25.)

The API is `greenChowClass_principal`, `greenChowClass_curvature`, `arakelovMotivicComplex_cone`, `higherArakelovChow_degreeZero`, `gerstenGreenGraph` and real-descent functoriality. The chain-map dictionary obligation of §5.5 applies to the raw cone; alternatively define the cone using the normalized regulator with its proven comparison. The choice must be declared before comparing cones. *Needs:* §§5.3, 5.5–5.10, current boundaries, ordinary Chow groups and M.4–M.8.

**Checks.**

- On `ℙ¹`, the pair `(div f,-log|f|)` has zero curvature and is zero in the Green quotient. A principal pair with the positive logarithm would double rather than cancel its divisor current.
- At `Specℂ`, codimension-one cycles vanish and every real constant Green term is removed by `-log|a|` for a positive real unit `a`; hence this complex-variety degree-zero Green group is zero.
- A point on `ℙ¹` with a Green representative has curvature of integral one. Its class is not killed by the principal relation, since its underlying divisor degree is nonzero.
- The modified top Deligne quotient kills smooth closed top forms before forming the higher Arakelov Chow cone. Using the unmodified cone gives a different group and does not prove the asserted degree-zero presentation.
- The cone is shifted by minus one: its degree-zero cycle/Green representative has the pair interpretation above. An unshifted cone places that interpretation in the wrong degree.

### 5.13 Curve complexes, tame symbols and unramified regulators

Let `X/k` be a smooth proper geometrically integral curve in characteristic zero, with function field `F`. Define the weight-`n` curve complex, for `n=2,3`, as the unramified homotopy fibre of the sum of closed-point residues,

```text
Γ(X,n) = Cone(Γ(F,n) → ⊕x∈X⁽¹⁾ Γ(k(x),n−1)[−1])[−1].
```

The displayed residue map is a degree-zero map into a shifted complex, using the shift differential of §3.3. In degree one its cohomology is the kernel of the cohomological residue, not a claim that each individual symbol is unramified. In higher degrees use the full localization sequence, retaining the adjacent residue-cohomology boundary term. Export `curvePolylogComplex_restrict`, `curvePolylogComplex_unramified` and a localization sequence. Finite curve pullback multiplies local residues by the ramification index. Pushforward requires the compatible transfer of §3.9 and its homotopies; a mere sum of field norms does not define it on the whole complex. (Goncharov [G04], §6.1, (75), p.52; Goncharov [D96], §2, pp.5–7.) *Needs:* §§3.2–3.3, 4.1–4.2, finite-place valuations and the supplied function-field/closed-point correspondence.

On a complex curve and away from the divisors of nonzero rational functions `f,g`, define

```text
η(f,g) = log|f| darg g − log|g| darg f.
```

Its pointwise jet is `etaJet f g df dg` in the suggested file. Prove antisymmetry and multiplicative bilinearity, `r₁(f∧g)=iη(f,g)`, closedness on the punctured curve, and the current equation

```text
d[η(f,g)] = 2π Σx log|tameₓ(f,g)| δx.
```

Here the tame symbol is fixed by `tameₓ(π,u)=u(x)⁻¹`; explicitly it is `(-1)^(v(f)v(g))·u_f^v(g)/u_g^v(f)` with `u_f=fπ^(-v(f))`. The sign disappears after the real logarithm, but it cannot be deleted from the integral tame-symbol theorem. The rational exterior residue in §3.3 is the inverse convention on units and also omits this sign; its comparison is made after rationalization. Prove the Steinberg identity `η(f,1-f)=dD(f)` on the complement, followed by its locally integrable current extension. These give `curveEtaRegulator` from unramified weight-two classes to real de Rham cohomology, with the appropriate real-conjugation eigenspace for curves defined over ℝ. (Goncharov [G04], §6.1, p.52, and §6.3, (85), p.57; Zagier [Z07], §2, pp.6–8.)

State the Chern comparison separately: the symbol regulator above represents the unramified Beilinson regulator only after composing the specified rational Chern character and Deligne/de Rham comparison. Fix the convention by `ch₂,₂=-c₂,₂` and the cup product representing `iη`; under the corresponding product-symbol convention the minus sign in `c₂,₂` gives the positive displayed η regulator. Export `curveEtaRegulator_beilinson`, with the sign included, rather than calling every exterior symbol an integral `K₂` element. (Nekovář [NEK], §7.3, (7.3.2), and §7.4, (7.4.1), pp.23–24; Schneider [SCH], §4, p.28.) *Needs:* §§1.4–1.5, 5.1–5.2, 5.9 and the early M.8 universal Chern-character convention.

**Checks.**

- `η(2,e^{it})=log 2·dt`. A constant first function does not make η zero. The jet test `etaJet 2 i 0 (-1)=log 2` pins the sign at `t=π/2`.
- On a punctured disk, `η(z,c)=-log|c| darg z`; its current differential is `-2π log|c|δ₀`. Since `tame₀(z,c)=c⁻¹`, the displayed current formula has this sign.
- `η(f,1-f)` is the differential in §1.4. Reversing the two factors gives `-dD(f)` and would reverse the Steinberg identity.
- On `ℙ¹`, take `f=t`, `g=t-a`, `a≠0`. The unsigned exterior residues at `0,a,∞` are `-a,a⁻¹,1`, with product `-1`. The signed integral tame product is `1`, because the infinity symbol contributes `-1`. The rational chain identity must not be misrepresented as the unsigned integral Weil reciprocity theorem.
- The fibre of a zero residue map is `Γ(F,n)⊕(⊕Γ(k(x),n-1)[-1])[-1]` with the cone grading. Replacing the homotopy fibre by the literal kernel loses this second summand and its localization sequence.
- A symbol whose tame logarithm is nonzero at a point does not define a closed current. A finite sum may be closed because its residues cancel, even if its summands are ramified.

### 5.14 Chow dilogarithms and the two reciprocity triangles

For a smooth projective connected complex curve define the real Chow dilogarithm on three nonzero rational functions by

```text
P₂(f₁∧f₂∧f₃) = −(1/(2π)) ∫X r₂(f₁∧f₂∧f₃).
```

Use the real `r₂` of §5.4, without an additional imaginary scalar. The integral exists by the logarithmic estimates, with a common resolution of all divisors. Prove alternation, multiplicative trilinearity, vanishing when one factor is a nonzero complex constant, and invariance under isomorphism of curves. The Steinberg evaluation is

```text
P₂((1-f)∧f∧g) = Σx vₓ(g) D(f(x)).
```

Endpoint values are taken with the continuous extension of `D`. The formula follows from the current identity for the one-form

```text
ρ₂({f}₂⊗g) = D(f)darg g − (1/3)α(1-f,f) log|g|,
α(a,b) = log|a| dlog|b| − log|b| dlog|a|,
d[ρ₂({f}₂⊗g)] = 2π Σx vₓ(g)D(f(x))δx + [r₂((1-f)∧f∧g)].
```

This normalization makes the real Chow function agree with the Bloch–Wigner evaluation of the reciprocity homotopy below. An alternative imaginary-valued `r₂` convention requires transporting both prefactors together. (Goncharov [G04], §6.3, Lemma 6.9, (83)–(85), p.57; Goncharov [G00], Proposition 4.1, (28), pp.17–20.) The API is `chowDilog_alt`, `chowDilog_mul`, `chowDilog_constant`, `chowDilog_steinberg` and `chowDilog_isomorphism`. *Needs:* §§1.5, 3.2–3.3 and 5.2–5.4.

For a smooth proper curve over an algebraically closed field `k`, formulate **strong reciprocity** as a homotopy

```text
h : Λ³ F×ℚ → B₂(k)ℚ,
δ₂ ∘ h = Res,       h ∘ δ₃ = Res,
h(k× ∧ Λ² F×)=0.
```

The two `Res` maps have different source and target degrees; each is the sum of the closed-point residues with the conventions of §3.3. The target `B₂(k)` is the pre-Bloch group with its nonzero cobracket, not `ker δ₂`. The second triangle expresses compatibility on `B₂(F)⊗F×ℚ`. Prove `strongReciprocity_impliesSuslin`: the first triangle places every total exterior residue in `im δ₂`, so its class in Milnor `K₂(k)ℚ=coker δ₂` vanishes. Over ℂ require `D∘h=P₂`. Define `StrongReciprocityHomotopy` by these properties and prove the analytic compatibility from the two triangles, constant-factor vanishing and rigidity: two resulting scalar functions have equal differential and the constant is fixed by a degenerating configuration. General curves over arbitrary algebraically closed fields remain a conjectural existence target. Proven cases used here are `ℙ¹` in the rational presentation, elliptic plane cubics, and curves over `ℚ̄` after tensoring with ℚ. (Goncharov [G04], Conjecture 6.2, Lemma 6.4 and Theorem 6.5, pp.53–54.)

**Checks.**

- On `ℙ¹`, the Steinberg triple `(1-t)∧t∧(t-a)` has Chow value `D(a)` for `a≠0,1`. The contribution at infinity is zero. The opposite integral prefactor would give `-D(a)`.
- `P₂(c∧f∧g)=0` on a proper curve, although its pointwise `r₂` integrand need not vanish. The vanishing is an integrated identity, not a rule discarding constants from all local forms.
- For `a=3`, `Res(t∧(t-1)∧(t-a))=a∧(1-a)=3∧(-2)`, nonzero in the rationalized exterior square of `ℚ×`. Thus a homotopy valued in the Bloch kernel could not satisfy the first triangle.
- On an empty divisor the Steinberg evaluation is the empty sum zero. On a nonproper curve Stokes adds a boundary term; properness is essential to the stated integral formula.
- The zero linear map satisfies neither reciprocity triangle in the preceding `a=3` example. The homotopy definition tests the residue equation, not only a formal zero composite.
- Replacing `h` by another map with the first triangle alone does not establish analytic equality. The second triangle, constants and the normalization in the rigidity argument are required.

### 5.15 Rational curves, families and algebraic-number fields

Construct `rationalCurveReciprocity` on `ℙ¹` by factoring divisors into points and summing their multiplicities against five-term cross-ratio symbols. In the cross-ratio convention of §1, an affine triple contributes `r(a,b,c,∞)=(a-c)/(b-c)`; the fourth auxiliary point is chosen away from the finite support. Prove independence of that point by the five-term relation and the zero degree of principal divisors, and prove the two triangles of §5.14. Coincident points use the declared degenerate symbols, not undefined fractions. In the integral pre-Bloch model the source carries a small torsion ambiguity; state the exact integral result modulo the six-torsion convention of the source before deducing the rational statement. The API is `rationalCurveReciprocity_auxiliary`, `rationalCurveReciprocity_residue`, `rationalCurveReciprocity_steinberg` and equivariance under `PGL₂`. (Goncharov [G04], §6.3, Theorem 6.5 and Propositions 6.6 and 6.8, pp.54–57.) *Needs:* §§1.5, 3.3, 5.13–5.14 and rational functions/divisors on `ℙ¹`.

For an algebraic family of smooth proper curves, with three rational functions and the open parameter locus where their divisors have controlled proper incidence, prove that the real Chow dilogarithm is locally a finite rational combination `Σᵢ qᵢ D(φᵢ)` of rational functions on that locus. The statement concerns a local expression on the good locus; no global single-valued rational lift or chosen expression invariant under every degeneration is promised. The differential is the pullback of the differential in §1.4. Export `chowDilog_family`, its restriction and change-of-expression lemmas, and a fibrewise specialization theorem when the same support hypotheses persist. (Goncharov [G04], Theorem 6.10, pp.57–58.)

Over `ℚ̄`, construct `algebraicCurveReciprocity` by a finite cover and descent from the explicitly handled case, dividing by the finite degree after rationalization. Prove independence of the cover and compatibility with the two residue triangles. The analytic identification is checked at all number-field embeddings and uses the injectivity of the full rational Borel regulator in the applicable degree. Injectivity of one chosen complex component is not an input. Export base extension and isomorphism functoriality; finite-cover transfer requires the coherent norm interface, not a symbol-by-symbol replacement of every argument by its field norm. (Goncharov [G04], Theorem 6.12 and its proof, pp.59–60.) *Needs:* rational reciprocity, finite cover geometry, K3/Borel comparison from §3.7 and the precise finite-degree transfer.

**Checks.**

- `r(0,1,a,∞)=a/(a-1)` in the affine convention just fixed. By the sixfold Bloch–Wigner symmetries, this has `D` value `-D(a)`; interchanging the first two entries reverses it. This detects confusing the two reciprocal source cross-ratios.
- Replacing the auxiliary point by another allowed point changes the cross-ratio sum by five-term relations. A choice in the divisor support is excluded before forming any quotient.
- A family constant in the parameter has constant Chow dilogarithm and zero parameter differential. A varying fibre integral cannot be replaced by the value on one arbitrarily selected fibre.
- A degeneration in which two divisor points collide can leave the good locus. The family expression is asserted only on the stated open set; it is not a claim of holomorphic continuation of the real-valued Chow function.
- Pulling a reciprocity construction up a degree-`d` cover and pushing down multiplies by `d`. Rational division by `d` recovers the original map; the integral claim cannot use that step for free.
- An imaginary quadratic field has one complex regulator component, whereas fields with several complex places require all components for the stated injectivity. Discarding rows can destroy the independence argument.

### 5.16 Elliptic plane cubics and line arrangements

Let `E⊂ℙ²_k` be a smooth plane cubic over an algebraically closed field of characteristic zero. For four ordered lines `L₀,…,L₃` in general position, let `Dᵢ=E·Lᵢ`, with intersection multiplicities, and `lᵢⱼ=Lᵢ∩Lⱼ`. Assume the intersections used to evaluate the line cross-ratios avoid all their forbidden points. Define the elliptic reciprocity value by

```text
h_E((l₁/l₀)∧(l₂/l₀)∧(l₃/l₀))
  = − Σᵢ₌₀³ (−1)^i [r(lᵢ₀,…,omit lᵢᵢ,…,lᵢ₃,Dᵢ)]₂.
```

Here `lᵢ` on the left is a homogeneous equation of `Lᵢ`; each right-hand cross-ratio is on the projective line `Lᵢ` and is evaluated additively on its degree-three intersection divisor. Its three fixed points retain their displayed order. Prove independence of rescaling the line equations and compatibility with the rational-function presentation, then the first and second reciprocity triangles. The construction descends to all rational functions on `E` using chord divisors `(x)+(y)-(x+y)-(0)` and their associativity relations; giving the line formula alone is not that descent proof. (Goncharov [G04], Theorem 6.14 and Proposition 6.17, pp.62–63.) The API is `ellipticReciprocity_lines`, `ellipticReciprocity_rescale`, `ellipticReciprocity_chord`, `ellipticReciprocity_relations` and `ellipticReciprocity_triangles`.

For an arbitrary smooth plane curve the corresponding analytic integral is

```text
∫X r₂((l₁/l₀)∧(l₂/l₀)∧(l₃/l₀))
  = 2π Σᵢ₌₀³ (−1)^i D(r(lᵢ₀,…,omit lᵢᵢ,…,lᵢ₃,Dᵢ)).
```

Thus the negative sign of `h_E` agrees with `P₂=-∫r₂/(2π)`. The elliptic algebraic construction and this general plane-curve integral theorem are distinct statements. When one normalizes two affine line functions to have sum one, the prescribed values at the opposite intersection are part of that normalization; the assertion does not hold for arbitrary equations of the same lines. (Goncharov [G04], Proposition 6.18, p.64, and Lemma 6.15, pp.62–63.) *Needs:* §§5.14–5.15, divisor intersection with multiplicity, elliptic addition and its chord divisor law, and plane-curve normalization geometry.

**Checks.**

- Rescaling any line equation multiplies a quotient on the left by a constant; the homotopy kills constant wedge factors. The right-hand projective points are unchanged, so its value must be unchanged too.
- Interchanging `L₁,L₂` negates the left wedge and the alternating right sum. Omitting the external minus sign contradicts the Steinberg normalization of §5.14.
- A tangent line has a divisor with a repeated point and retains that intersection multiplicity whenever the evaluation hypotheses hold. Treating `Dᵢ` as a set would change the value.
- Three concurrent lines can make two fixed cross-ratio points coincide. Such an arrangement is outside the formula's general-position domain and is not repaired by a formal division by zero.
- The chord function for `(x,y)` has divisor `(x)+(y)-(x+y)-(0)`. At `y=0` this divisor is zero, so its function is constant and the corresponding wedge contribution vanishes.
- Equations `l₀=x`, `l₁=y`, `l₂=z` do not satisfy `l₁/l₀+l₂/l₀=1` on a general plane curve. That simplification is used only after the separate normalization lemma's hypotheses are supplied.

### 5.17 Weight-three curve regulators and higher reciprocity

The one-current `ρ₂` of §5.14 descends through the five-term presentation in its `B₂(F)` argument. The proof uses both `ΣD(fᵢ)=0` and `Σ(1-fᵢ)∧fᵢ=0`; the second identity kills the logarithmic `α` correction. Pair it with `ρ₃=r₂` and the weight-three zero-form from §1 to obtain the curve regulator chain map, with the residue currents and cochain signs declared in §§3.3 and 5.13. In particular,

```text
ρ₂({f}₂⊗f) = −d L₃(f).
```

Prove the formula directly from the Bernoulli differential, retaining the logarithmic correction even for a constant second argument. Export `curveRho2_fiveTerm`, `curveRho2_residue`, `curveRho2_diagonal`, `curveWeightThreeRegulator` and their real-conjugation rules. In Goncharov's general regulator notation the weight-three degree-two component is `-ρ₂`; changing that sign without changing the complex differential breaks the comparison. (Goncharov [G00], Proposition 4.1, (28), pp.17–20; Goncharov [D96], §3.6–3.7, pp.21–23.) *Needs:* §§1.3, 3.2–3.3, 5.13–5.14 and the declared current model.

For a smooth proper curve over a number field, construct the rational Chern map from `K₄` of its function field to `H²Γ(F,3)`, compatible with Quillen residues and the Borel regulator. Restrict to the unramified fibre to obtain the corresponding curve regulator comparison. The target is the cohomology of the weight-three complex, not an asserted isomorphism from all of `K₄` to that group. The precise Adams-weight projection, source convention and Deligne normalization are part of the comparison theorem. (Goncharov [D96], Theorem 2.1, pp.6–7, and §3.7, pp.22–23.) Export `curveWeightThreeChern`, `curveWeightThreeChern_residue` and `curveWeightThreeChern_regulator`. The higher Chern-character machinery is consumed from M.6–M.8; this layer owns the explicit polylogarithmic representative and its compatibility proof.

For `n≥4`, formulate the **generalized reciprocity conjecture** as a chain homotopy to zero of the total residue map from `Γ(k(X),n)` to `Γ(k,n-1)[-1]` for a smooth proper curve over an algebraically closed field, with finite-support residues and the chosen transfer maps. The weight-two statement reduces to signed Weil reciprocity. The weight-three homotopies in §§5.14–5.16 provide the stated proven cases, not a proof for every curve or every weight. Export a property `HasPolylogReciprocityHomotopy`, functorial consequences conditional on it, and no unconditional instance. Compatibility under curve correspondences requires coherent choices of the homotopies. (Goncharov [G04], §6.2, Conjecture 6.3, p.54.) *Needs:* the higher complexes of §4.2 and the explicit transfer obligation of §3.9.

**Checks.**

- With `g=f`, substituting the differential in §6.2 gives exactly `-dL₃(f)`. Removing the coefficient `1/3` leaves a nonzero radial discrepancy at `f=1/2`.
- With `g=c` constant of norm different from one, `ρ₂=-α(1-f,f)log|c|/3` can be nonzero. A rule declaring all constant-second-argument representatives zero is false before passing to a suitable cohomology class.
- A five-term sum has zero `D` part, and its exterior image gives the zero `α` part. Checking only the first sum does not establish descent of the full one-form.
- A ramified `K₄(F)` class belongs to the function-field comparison but not automatically to the unramified curve group. The localization residue square is what supplies the restriction.
- In weight two, `t` and `t-a` on `ℙ¹` pass the signed tame-product test of §5.13. In weight three, the `a=3` residue from §5.14 demands a nonzero homotopy value. The higher conjecture cannot be replaced by the zero homotopy.
- Over an arbitrary field, the algebraically closed residue-field simplification is unavailable; norms from closed points must appear. That more general formulation requires the transfer data before it is a theorem statement.

### 5.18 Generalized elliptic trilogarithms and their Fourier pairing

Construct `ellipticTorusFourierAdapter` for the oriented full lattice used below: identify its quotient with a two-dimensional real torus by an oriented period basis, transport probability Haar integration, prove the displayed character is lattice-periodic, and prove `∫χγ dμ=0` for `γ≠0` and `1` for `γ=0`. Transport the derivative and area-form identities through this coordinate map. The construction uses Mathlib’s additive circle, product Haar integration and finite exponential sums, together with DifferentialGeometry’s integration API; it adds the explicit complex-lattice normalization rather than a second abstract Fourier theory. Prove basis-change compatibility and the Fourier coefficient identity for logarithms by applying Poincaré–Lelong to these smooth character test functions. Common regularization of products is the separate target below. The APIs are `ellipticCharacter_periodic`, `ellipticCharacter_orthogonality`, `ellipticCharacter_derivative` and `ellipticTorus_area`. (Goncharov [D96], §3.5, pp.20–22, for the lattice-character application; orthogonality is the product of the elementary integrals of nontrivial integer characters.) Its checks are the constant character with integral one, a nonzero basis frequency with integral zero, and a positive basis change preserving the area and integral; an orientation reversal must also reverse the area form.

Write a complex elliptic curve as `ℂ/Λ`, with an ordered lattice basis `u,v`, positive area `A=Im(conj(u)v)`, and characters

```text
χγ(z)=exp(2πi Im(z conj(γ))/A),             γ∈Λ.
```

Define the generalized elliptic trilogarithm kernel, with zero frequencies excluded in every denominator, by

```text
K₃(x,y,z) = Σ γ₁+γ₂+γ₃=0, γᵢ≠0
  χγ₁(x) χγ₂(y) χγ₃(z)
  (conj(γ₃)−conj(γ₂))/(|γ₁|² |γ₂|² |γ₃|²).
```

Extend it trilinearly to finite divisors. Prove absolute convergence, descent modulo the lattice, simultaneous translation invariance, antisymmetry in the last two entries and change of lattice basis. For convergence, dyadically sort the largest frequency scale `R` and the smallest `s≤R`. The summand is `O(R⁻³s⁻²)`, while the number of pairs in those annuli is `O(R²s²)`; the contribution for fixed `s` is `O(1/R)`. Summing the `O(log R)` possible `s` and then dyadic `R` converges. The finite small-frequency part is handled separately using the lattice's positive minimum norm. Export `ellipticTrilogKernel_summable`, `ellipticTrilogKernel_periodic`, `ellipticTrilogKernel_translate`, `ellipticTrilogKernel_swap` and `ellipticTrilogKernel_scale`. The normalization is explicit; the kernel is not identified with an unspecified rational multiple of a source's differently normalized series. (Goncharov [D96], Introduction, (1), pp.0–1, and §3.5, pp.20–21.) *Needs:* a discrete full lattice, its covolume and characters, ordinary summable series, and the lattice-specific torus adapter of this subsection.

For rational functions on a smooth proper complex curve and a holomorphic or antiholomorphic one-form `ω`, prove

```text
∫X ρ₂({f}₂⊗g)∧ω = −(4/3) ∫X log|g| α(1-f,f)∧ω.
```

Logarithmic singularities require the current Stokes argument; closedness of an arbitrary smooth de Rham form alone is not the stated hypothesis. On the elliptic curve, for a finite symbol sum satisfying `Σⱼ(1-fⱼ)∧fⱼ∧gⱼ=0`, put `Dⱼ=div gⱼ`, `Fⱼ=div fⱼ`, `Hⱼ=div(1-fⱼ)`. The Fourier normalization targets are

```text
Σⱼ ∫ log|gⱼ| α(1-fⱼ,fⱼ)∧dbar z = i A³/(4π²) Σⱼ K₃(Dⱼ,Fⱼ,Hⱼ),
Σⱼ ∫ ρ₂({fⱼ}₂⊗gⱼ)∧dbar z = −i A³/(3π²) Σⱼ K₃(Dⱼ,Fⱼ,Hⱼ).
```

The integral is the ordinary complex-valued integral, with `dz∧dbar z=-2iA μ` for probability Haar area `μ`. The Fourier coefficient of `log|f|` at a nonzero frequency `γ` is `-A·div(f)(χ₋γ)/(2π|γ|²)`, and `∂χγ=(π conj(γ)/A)χγ dz`. The displayed constants follow by multiplying these three coefficients and the derivative and area factors. Constant Fourier modes cancel in the cycle sum; they cannot be discarded for arbitrary independent functions. Prove the Fourier formulas first for finite Fourier polynomials, then justify the logarithmic limit by one common regularization compatible with products and the divisor cycle relation. A domination argument at shared divisor points and a collation with the published normalization are explicit remaining proof obligations; citing a series identity with an unspecified rational constant does not discharge them. (Goncharov [D96], Theorems 3.3–3.4, pp.20–22.)

The API is `curveRho2_holomorphicPairing`, `ellipticLog_fourierCoefficient`, `ellipticTrilog_finiteFourierPairing`, `ellipticTrilog_regulatorPairing` and a real/conjugate decomposition. This is an explicit regulator formula. A weight-three Beilinson special-value statement for elliptic curves is kept conjectural, with its cycle-rank and period-normalization hypotheses, and is not inferred from the kernel formula. *Needs:* §§5.13–5.17, compact torus Fourier integration and regularization, the cycle condition and the stated analytic limit obligations.

**Checks.**

- On any input `K₃(x,y,y)=0` by swapping the second and third frequencies. A kernel with numerator `conj(γ₃)+conj(γ₂)` fails that test.
- Simultaneously translating all three points multiplies every summand by `χγ₁+γ₂+γ₃(a)=1`. Translating only one point generally changes the value.
- Under lattice and point scaling by `λ≠0`, the kernel scales by `conj(λ)/|λ|⁶`; for `λ=2` the factor is `1/32`. The area changes by `|λ|²`, as required by the pairing formulas.
- The zero lattice frequency is excluded from all three indices. Keeping it would create a division by zero; using totalized inverses would silently change the function and the Fourier argument.
- For one finite Fourier triad `γ₁+γ₂+γ₃=0`, multiplication of the coefficients gives `iA³/(4π²)` times the kernel coefficient for the `log g·α` integral. The additional factor `-4/3` gives `-iA³/(3π²)` for `ρ₂`. The scalar is tested before any analytic limiting argument.
- Adding arbitrary constants to individual logarithms changes some intermediate pairings. The summed relation in `Λ³F×ℚ`, including constant factors, is what cancels their means; a condition only on the divisors is insufficient.
- A lattice of area zero is not a lattice basis and is outside the construction. With an honest lattice the finitely many frequencies below a fixed radius have a positive minimum norm, supplying the convergence estimate's initial scale.

### Examples

For `f=t`, `g=t-a` on `ℙ¹`, compute the three tame symbols before taking logarithms. This single calculation checks the rational residue convention, the signed integral Weil product and the current equation. Substituting `(1-t)∧t∧(t-a)` then gives `P₂=D(a)` and fixes the real prefactor of the Chow dilogarithm independently of any elliptic formula.

On a plane cubic, a four-line arrangement produces twelve divisor-point contributions before any endpoint simplifications justified by the actual arrangement. The alternating line formula and the integrated `r₂` formula give the same real number with the opposite external signs prescribed above; no cancellation count is assumed in the API.

For an elliptic Fourier calculation, first use a finite collection of nonzero triads. Its pairing identity is ordinary finite algebra, fixes the area and `i` factors and is unaffected by convergence questions. Extending that calculation to logarithms is the separate common-regularization target. The latter cannot be replaced by numerical agreement of a few truncated lattice sums.

### Dependencies

This layer uses Layers 1–4, DifferentialGeometry's form/integration interfaces, C.0 Part II analytification and the lattice-specific Fourier adapter of §5.18, R09.2/R09.7 Part II Chow spaces and resolutions, algebraic curve and elliptic-curve geometry, and the early M.4/M.6/M.8 cycle/Chern/Deligne interfaces. Its new analytic foundations are the test-form LF topology, manifold currents, positive-current extension and normal-current support results specified here. Its chain comparison requires the raw/normalized dictionary and the universal Chern-character convention; its elliptic endpoint additionally requires the regularization and normalization obligations just stated.

## Layer 6: regulator diagnostics

This layer gives tests that distinguish regulator formulas from statements about unrelated embeddings or numerical approximations. Its p-adic portion is a small adapter to the completed-unit formulation of Leopoldt; it does not construct the Iwasawa logarithm or the global unit theorem again.

### 6.1 Completed units and the p-adic regulator matrix

Let `F` be a number field, `p` a rational prime and `r=r₁+r₂-1`. Consume the pro-`p` completion of global units and the product of local principal-unit completions at `v|p`, with their diagonal map, from IntegralIwasawaTheory I.2. The full pro-`p` objects can have finite `p`-primary torsion. Define the rational `leopoldtUnitMap` after tensoring with `ℚp`; its injectivity is Leopoldt's conjecture, equivalent to the closure of global units having `ℤp` rank `r`. The ordinary diagonal map from the discrete unit group to a local field is already injective and is not this conjecture. (Neukirch–Schmidt–Wingberg [NSW], Conjecture 10.3.5 and Theorem 10.3.6, pp.627–628; IntegralIwasawaTheory I.2 for the exact completed-unit interface.)

Choose a basis of units modulo torsion, and all `N=[F:ℚ]` embeddings `σ:F→ℂp`. Define `pAdicUnitLogMatrix` as the `r×N` matrix with entries `logₚ(σ(εᵢ))`. The log is the branch with `logₚ(p)=0`; local unit and ramification domains are those of the supplied continuous logarithm. Export basis-change and embedding-permutation rules, agreement with the rationalized completed-unit map, and the equivalence between rank `r` and a nonzero `r×r` minor. The columns are embeddings, not merely primes above `p`; a prime of local degree greater than one contributes several embeddings. To evaluate at `p=2`, pass to a sufficiently deep principal-unit subgroup rather than assuming the odd-prime logarithm/exponential radius. (NSW [NSW], Definitions 10.3.3–10.3.4, pp.626–627; ColemanIntegrationAndChabauty early L0.17–L0.18 for the independent local logarithm interface.) *Needs:* number-field units and all p-adic embeddings, IntegralIwasawaTheory I.2 and that independent local-logarithm prefix.

For totally real `F`, `r=N-1` and each row sum is zero because the unit norm is `±1`. The maximal minors differ only by their alternating signs. Thus deleting any one column gives the classical square regulator, and its nonvanishing is independent of the deletion. For general signature keep the full-rank criterion, not this totally real special shape. The abelian-field Baker–Brumer theorem is supplied by IntegralIwasawaTheory L.4 and is not an unconditional theorem for every number field. The API is `leopoldtUnitMap_injective_iff`, `pAdicUnitLogMatrix_basisChange`, `pAdicUnitLogMatrix_rank`, `pAdicUnitLogMatrix_minor`, `pAdicRegulator_totallyReal` and `pAdicRegulator_abelian` as a corollary of that supplier theorem.

**Checks.**

- For `ℚ` and an imaginary quadratic field, `r=0`: the matrix has no rows, has rank zero, and its empty maximal minor is `1`. Leopoldt is automatic, rather than failing because a zero-row determinant was set to zero.
- If one prime above `p` has local degree `N`, there are still `N` embedding columns. Replacing them by one column can force an incorrect rank bound.
- Changing a free-unit basis multiplies every full minor by the determinant of a unimodular basis matrix, namely `±1`; the nonvanishing criterion is unchanged. A torsion generator is excluded from that basis.
- In a totally real quadratic field the row is `(a,-a)`. Deleting the first or second column gives `-a` or `a`, pinning the alternating minor convention.
- For `F=ℚ(√2)` at `p=7`, choose the root `√2≡10 mod 49`. Then `ε=1+√2≡11 mod 49` and `ε⁶≡15 mod 49`, so `v₇(log ε⁶)=1`. Hence `log ε≠0`, giving a rank-one minor. The valuation follows from the logarithm's tail bound on `1+7ℤ₇`, not from a decimal approximation.
- At `p=2`, the unit `-1` is nontrivial 2-primary torsion in the pro-2 completion but its logarithm is zero. It disappears after tensoring with `ℚ₂`. Treating the full completion as torsion-free would fail this test.
- `logₚ(p)=0` although `p` is not a root of unity. The finite-order kernel statement used to certify a nonzero unit logarithm is restricted to local units and is not asserted on all nonzero local-field elements.

### 6.2 The exact differential of the single-valued trilogarithm

For `z∈ℂ\{0,1}` and a real tangent vector `v∈ℂ`, prove real differentiability and

```text
dL₃(z)[v] = −D(z) Im(v/z)
 + (log|z|/3)·(log|1-z| Re(v/z) − log|z| Re(v/(z-1))).
```

The theorem `singleValued_three_differential` is a genuine real differential, valid also at real points on the classical polylogarithm cut. The logarithmic correction is radial and is not removed by using single-valued functions. Prove continuity of this derivative away from the punctures, agreement with `-ρ₂({z}₂⊗z)` from §5.17, and the endpoint extension appropriate to weight three. In particular `L₃` is differentiable at `1` with derivative zero; the logarithmic singularity of the dilogarithm derivative does not justify a blanket nondifferentiability statement for every weight. (Goncharov [G00], Proposition 4.1, (28), pp.17–20, with `β₂=1/3` in (15), p.3; Zagier [Z90], §2, pp.397–401.) *Needs:* §§1.1–1.4 and real Fréchet calculus.

Use the formula to test regulator representatives, with exact identities before numerical approximations. At a real argument the angular term vanishes, but the logarithmic term usually does not. On the unit circle the logarithmic correction vanishes, but angular and radial tangent vectors still give different results. The API is `singleValued_three_differential`, `singleValued_three_derivative_half`, `singleValued_three_derivative_two`, `singleValued_three_derivative_negOne`, `singleValued_three_derivative_one` and unit-circle radial/angular corollaries.

**Checks.**

- At `z=1/2`, the derivative is `(4/3)log²2·Re(v)`. It is nonzero for `v=1`, while a formula containing only the `D(z)` term would give zero. This is the named negative-control theorem in the suggested file.
- At `z=2`, the derivative is `-(1/3)log²2·Re(v)`; real points beyond the cut are included. At `z=-1`, both terms vanish and the derivative is zero.
- For `|z|=1`, `v=z` gives zero radial derivative and `v=iz` gives `-D(z)` angular derivative. At `z=i`, the latter is negative because `D(i)>0`.
- Conjugating `z` and `v` leaves the real derivative of the odd-weight real-valued function unchanged. Inversion obeys the derivative of `L₃(z)=L₃(1/z)`, including the tangent factor `-v/z²`.
- As `z→1`, the explicit differential tends to zero; terms of order `|z-1|log²|z-1|` vanish. This is consistent with `L₃(1)=ζ(3)` and distinguishes the weight-three endpoint from the weight-two logarithmic singularity.

### 6.3 Exact identities and certified diagnostics

Provide a small `PolylogDiagnostic` interface that distinguishes an exact symbol relation, a certified real interval for its regulator, and a finite-precision p-adic rank certificate. The exact relation lives in the specified rational Bloch presentation or exterior square. A real interval carries the tail certificate of §2.5. A p-adic nonzero minor carries a valuation bound that exceeds the unresolved precision, including the logarithm tail and denominator losses. There is no theorem converting an arbitrarily small floating-point residual into a Bloch relation, or a finite string of zero p-adic digits into a vanishing determinant. This adapter is a packaging of the earlier exact and certified results, with no new global numerical method. (Zagier [Z07], §3, pp.10–11, for the unit-circle evaluation; NSW [NSW], Definitions 10.3.3–10.3.4, Conjecture 10.3.5 and Theorem 10.3.6, pp.626–628, for the rank formulation.)

Export `PolylogDiagnostic.exactRelation`, `PolylogDiagnostic.realInterval`, `PolylogDiagnostic.pAdicNonzero`, soundness of each projection and compatibility of the exact regulator evaluation with its interval certificate. A diagnostic includes its field, presentation, embedding, branch and normalization; comparing numbers from different conventions is not a relation test. *Needs:* §§1.5, 2.5, 3.2, 6.1–6.2 and the supplied finite-precision local arithmetic.

**Checks.**

- The five-term relation at two distinct admissible rational complex arguments is an exact zero class. Its numerical regulator residual may be nonzero after rounding without invalidating that relation.
- A real interval certificate for `D(i)` with positive lower endpoint proves positivity of that value. A decimal rounded to zero carries no corresponding exact vanishing claim.
- The `7`-adic quadratic-unit certificate of §6.1 has a nonzero leading coefficient and a controlled tail. Replacing it by the observation that many leading digits vanish would not prove rank one.
- An empty regulator matrix has empty determinant `1`, and the diagnostic records rank zero. It is neither a failed inversion nor a missing numerical result.
- A candidate exact relation with nonzero exterior image is rejected before any regulator approximation. A zero regulator component alone does not prove the relation.

### Examples

The points `1/2,2,-1,i` give four distinct tests of one differential formula: a positive real radial derivative, a negative real radial derivative, a stationary real point and a nonzero angular derivative. They detect both omission of the logarithmic term and a change of sign in the `D` term.

For `ℚ(√2)` at `7`, the single nonzero row and the exact congruence modulo `49` certify the Leopoldt rank without constructing a new p-adic polylogarithm. The supplier logarithm and its tail bound are the only local analytic inputs. The zero-rank examples `ℚ` and imaginary quadratic fields exercise the empty-minor convention used also by the even-weight determinant in Layer 4.

### Dependencies

This layer uses Layers 1–3 and 5 for exact regulator formulas, IntegralIwasawaTheory I.2/L.4 for the completed-unit formulation and the abelian case, and the independent early local-logarithm prefix of ColemanIntegrationAndChabauty. It requires no later Chabauty theorem or reverse dependence on this roadmap's polylogarithmic layer. The finite-precision arithmetic is a supplier contract, with its domain and tail bounds, rather than an assumed floating-point oracle.

## Downstream consumers

The weight-three and weight-four period theorems supply explicit rational regulator cycles and normalized determinants to the special-value portions of K3AndBloch, BorelRegulators and algebraic K-theory. Consumers needing every-cycle regulator-image containment must use the comparison and lifting hypotheses of §§3.8 and 4.6; existence alone does not supply those hypotheses. Higher weights receive explicitly conjectural interfaces.

MotivicEtaleKTheory and the Arakelov comparison consumers use the explicit higher Chow chain regulator, its cubical–simplicial homotopy and its universal Chern comparison, with the dictionary in §5.6 fixed. They do not import a freely renormalized current map. ColemanIntegrationAndChabauty can consume the complex polylogarithmic functional equations and regulator diagnostics after its independent local logarithm prefix has supplied this roadmap's p-adic adapter. Elliptic special-value consumers receive the explicit current and Fourier pairing of §5.18, with its analytic-limit obligation kept separate from the conjectural elliptic Beilinson statement.

## References

Page locators for preprints refer to the page numbers printed in the specified version; publication page ranges identify the work and do not silently replace that pagination.

- **[Z90]** Don Zagier, *Polylogarithms, Dedekind zeta functions and the algebraic K-theory of fields*, in *Arithmetic Algebraic Geometry*, Progress in Mathematics 89 (1991), pp.391–430; author manuscript dated 1990. [Author's public scan](https://people.mpim-bonn.mpg.de/zagier/files/scanned/PolylogsDedekindZetaAndKTheory/fulltext.pdf).
- **[Z07]** Don Zagier, *The dilogarithm function*, in *Frontiers in Number Theory, Physics, and Geometry II* (2007), pp.3–65. [Author's public text](https://people.mpim-bonn.mpg.de/zagier/files/doi/10.1007/978-3-540-30308-4_1/fulltext.pdf).
- **[G94]** Alexander B. Goncharov, *Polylogarithms and motivic Galois groups*, in *Motives*, Proceedings of Symposia in Pure Mathematics 55, Part 2 (1994), pp.43–96. [Author's manuscript](https://sasha-goncharov.github.io/SeattleMotives.pdf). Locators use the manuscript's printed pages.
- **[G95]** Alexander B. Goncharov, *Geometry of configurations, polylogarithms, and motivic cohomology*, *Advances in Mathematics* 114 (1995), pp.197–318. [Author's public scan](https://sasha-goncharov.github.io/Advances1995.pdf).
- **[G00]** Alexander B. Goncharov, *Explicit regulator maps on polylogarithmic motivic complexes*, [arXiv:math/0003086v1](https://arxiv.org/abs/math/0003086v1) (2000), printed pp.0–28. This version fixes the regulator differential formulas used here.
- **[G04]** Alexander B. Goncharov, *Polylogarithms, regulators, and Arakelov motivic complexes*, [arXiv:math/0207036v3](https://arxiv.org/abs/math/0207036v3) (2004), 70 pp. The published article is *Journal of the AMS* 18 (2005), pp.1–60; every locator here uses the preprint's pagination.
- **[GR]** Alexander B. Goncharov and Daniil Rudenko, *Motivic correlators, cluster varieties, and Zagier's conjecture on ζF(4)*, [arXiv:1803.08585v5](https://arxiv.org/abs/1803.08585v5) (2026), 111 pp. Version 5 is the source for the weight-four complex and comparisons.
- **[BFT]** José Ignacio Burgos Gil, Elisenda Feliu and Yuichiro Takeda, *On Goncharov's regulator and higher arithmetic Chow groups*, [arXiv:0909.5296v1](https://arxiv.org/abs/0909.5296v1) (2009), 22 pp. Locators use this version, including its normalized-current conventions.
- **[D96]** Alexander B. Goncharov, *Deninger's conjecture on L-functions of elliptic curves at s=3*, [arXiv:alg-geom/9512016v2](https://arxiv.org/abs/alg-geom/9512016v2) (1996), printed pp.0–36. The generalized elliptic series and regulator pairing are compared with the explicit normalization of §5.18.
- **[DEM]** Jean-Pierre Demailly, *Complex Analytic and Differential Geometry*, [author's public manuscript](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf). Chapters I and III provide test forms, currents, analytic cycle integration and the Poincaré–Lelong formula with explicit conventions.
- **[BUR]** José Ignacio Burgos Gil, *Arithmetic Chow rings and Deligne–Beilinson cohomology*, [author's public thesis](https://www.icmat.es/miembros/burgos/files/tesis.pdf). Chapter II supplies support classes, logarithmic forms and Green representatives.
- **[NEK]** Jan Nekovář, *Beilinson's conjectures*, [public seminar reference](https://math.stanford.edu/~conrad/BSDseminar/refs/BeilinsonintroII.pdf), especially §§7.3–7.5 for the symbol/Chern normalization.
- **[SCH]** Peter Schneider, *Introduction to the Beilinson conjectures*, [public text](https://ncatlab.org/nlab/files/SchneiderBeilinsonConjectures.pdf), §4 for the curve regulator convention.
- **[NSW]** Jürgen Neukirch, Alexander Schmidt and Kay Wingberg, *Cohomology of Number Fields*, second-edition public author text, [authors' site](https://www.mathi.uni-heidelberg.de/~schmidt/NSW2e/NSW2.3.pdf), §10.3, Definitions 10.3.3–10.3.4, Conjecture 10.3.5 and Theorem 10.3.6, pp.626–628, for Leopoldt's conjecture and p-adic regulator rank. The completed-unit and local-logarithm constructions themselves are supplied by the named Iwasawa roadmaps.
