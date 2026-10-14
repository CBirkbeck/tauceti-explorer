import Mathlib.NumberTheory.NumberField.ProductFormula
import Mathlib.NumberTheory.Height.NumberField
import Mathlib.NumberTheory.Height.Projectivization
import Mathlib.RingTheory.FractionalIdeal.Norm
import Mathlib.RingTheory.FractionalIdeal.Operations
import Mathlib.NumberTheory.ModularForms.Discriminant
import Mathlib.Algebra.Module.ZLattice.Covolume
import Mathlib.NumberTheory.NumberField.ClassNumber

/-!
# Arakelov geometry and heights of abelian varieties — suggested Lean statements

This file is not the roadmap and is not exhaustive: the roadmap document
(`ArakelovGeometryAndAbelianHeights.md`) is definitive. The statements below suggest Lean forms so
that contributors and reviewers converge on names and signatures. Everything is proved by `sorry`
or not at all; nothing here is claimed to be formalised.

Only objects whose carriers exist at the pinned Mathlib (082e2d3) are typed here: Arakelov divisors
of a number field and their degree, the divisor of a point of projective space with the sup metric
and its identification with Mathlib's height, the archimedean term of the elliptic Faltings height,
and the Faltings norm of `dz` on a complex torus `ℂ/Λ`. Hermitian vector bundles of higher rank,
arithmetic divisors on arithmetic schemes, the metrized Hodge line of an abelian scheme, Faltings
heights, metrics with logarithmic singularities, moduli heights and theta heights need carriers
that the pinned libraries do not have (abelian schemes over `𝓞 K`, Néron models, complex points of
schemes, compactified moduli spaces); they are README targets, listed at the end of this file.
-/

open NumberField
open scoped nonZeroDivisors

noncomputable section

namespace TauCeti.Arakelov

/-! ## R35.1 Arakelov divisors of a number field and the Arakelov degree -/

variable (K : Type*) [Field K] [NumberField K]

/-- An Arakelov divisor of `K` (Szpiro, Astérisque 127, exp. I §1.1): a finite part, recorded as an
invertible fractional ideal `𝔞 = ∏ 𝔭^{n_𝔭}`, and a real coefficient `λ_v` at each infinite place.
The group law is componentwise (multiplication of ideals, addition of coefficients). -/
abbrev ArakelovDivisor : Type _ :=
  Additive (FractionalIdeal (𝓞 K)⁰ K)ˣ × (InfinitePlace K → ℝ)

namespace ArakelovDivisor

variable {K}

/-- The finite part `𝔞` of an Arakelov divisor. -/
def finitePart (D : ArakelovDivisor K) : FractionalIdeal (𝓞 K)⁰ K :=
  ((Additive.toMul D.1 : (FractionalIdeal (𝓞 K)⁰ K)ˣ) : FractionalIdeal (𝓞 K)⁰ K)

/-- The archimedean coefficient `λ_v` at an infinite place. -/
def infinitePart (D : ArakelovDivisor K) (v : InfinitePlace K) : ℝ := D.2 v

/-- The Arakelov degree `deg^(D) = log N(𝔞) + Σ_v λ_v`. -/
def degree (D : ArakelovDivisor K) : ℝ :=
  Real.log |((FractionalIdeal.absNorm (finitePart D) : ℚ) : ℝ)| + ∑ v : InfinitePlace K, D.2 v

/-- The principal Arakelov divisor `(f) = (f·𝓞 K, v ↦ −mult(v) log |f|_v)` of `f ∈ Kˣ`. -/
def principal (f : Kˣ) : ArakelovDivisor K :=
  (Additive.ofMul (Units.mk0 (FractionalIdeal.spanSingleton (𝓞 K)⁰ (f : K))
      (FractionalIdeal.spanSingleton_ne_zero_iff.mpr f.ne_zero)),
    fun v => -((v.mult : ℕ) : ℝ) * Real.log (v (f : K)))

/-- The subgroup of principal Arakelov divisors. -/
def principalSubgroup : AddSubgroup (ArakelovDivisor K) :=
  AddSubgroup.closure (Set.range (principal (K := K)))

/-- The compactified Picard group `Pic^(𝓞 K) = Div^(𝓞 K)/principal` (Szpiro, Proposition 1.1). -/
abbrev PicHat (K : Type*) [Field K] [NumberField K] : Type _ :=
  ArakelovDivisor K ⧸ principalSubgroup (K := K)

/-- `degree_zero`: the zero divisor has degree zero. -/
theorem degree_zero : degree (0 : ArakelovDivisor K) = 0 := sorry

/-- `ArakelovDivisor.degree_add`: the degree is additive. -/
theorem degree_add (D D' : ArakelovDivisor K) : degree (D + D') = degree D + degree D' := sorry

/-- `ArakelovDivisor.degree_principal`: principal divisors have degree zero — the product formula
`NumberField.prod_abs_eq_one` in Arakelov form. -/
theorem degree_principal (f : Kˣ) : degree (principal f) = 0 := sorry

/-- The degree is constant on classes in `Pic^(𝓞 K)` (`ArakelovDivisor.toPicHat` compatibility). -/
theorem degree_eq_of_sub_mem {D D' : ArakelovDivisor K} (h : D - D' ∈ principalSubgroup (K := K)) :
    degree D = degree D' := sorry

/-- `ArakelovDivisor.degree_principal_two`: for `K = ℚ` and `f = 2` both terms are `log 2`. -/
example : degree (principal (Units.mk0 (2 : ℚ) two_ne_zero)) = 0 := degree_principal _

/-- `ArakelovDivisor.mult_nonexample`: forgetting the multiplicity at a complex place breaks the
product formula; for `ℚ(i)` and `f = 2` the divisor with coefficient `−log|2|` has degree `log 2`. -/
example (L : Type*) [Field L] [NumberField L] (hL : Module.finrank ℚ L = 2) (v : InfinitePlace L)
    (hv : v.IsComplex) (h1 : ∀ w : InfinitePlace L, w = v) :
    degree ((principal (Units.mk0 (2 : L) two_ne_zero)).1,
      fun w => -Real.log (w (2 : L))) = Real.log 2 := sorry

end ArakelovDivisor

/-! ## R35.1 The point of projective space with the sup metric -/

namespace ArakelovDivisor

variable {K}
variable {ι : Type*} [Fintype ι]

/-- The Arakelov divisor of `x^*Ō(1)` for the sup metric: finite part the inverse of the fractional
ideal generated by the coordinates, archimedean coefficients `mult(v) · log max_i |x_i|_v`. -/
def ofTuple (x : ι → K) (hx : x ≠ 0) : ArakelovDivisor K :=
  (Additive.ofMul (Units.mk0 (FractionalIdeal.spanFinset (𝓞 K) Finset.univ x)⁻¹
      (by
        obtain ⟨i, hi⟩ := Function.ne_iff.mp hx
        exact inv_ne_zero (FractionalIdeal.spanFinset_ne_zero.mpr ⟨i, Finset.mem_univ i, hi⟩))),
    fun v => ((v.mult : ℕ) : ℝ) * Real.log (⨆ i, v (x i)))

/-- `sup-metric-height-comparison`: the Arakelov degree of `x^*Ō(1)` with the sup metric is
Mathlib's (relative) logarithmic height of the tuple. -/
theorem degree_ofTuple (x : ι → K) (hx : x ≠ 0) : degree (ofTuple x hx) = Height.logHeight x :=
  sorry

/-- Scaling the tuple changes the divisor by a principal divisor. -/
theorem ofTuple_smul (x : ι → K) (hx : x ≠ 0) (c : Kˣ) :
    ofTuple ((c : K) • x) (smul_ne_zero c.ne_zero hx) = ofTuple x hx - principal c := sorry

/-- For coprime integers the degree is `log max(|a|, |b|)` (`Height.ofMetrized_projective_line`). -/
example (a b : ℤ) (hab : Int.gcd a b = 1) (h : ![(a : ℚ), b] ≠ 0) :
    degree (ofTuple ![(a : ℚ), b] h) = Real.log (max |(a : ℝ)| |(b : ℝ)|) := sorry

end ArakelovDivisor

end TauCeti.Arakelov

/-! ## R35.2 The Faltings norm on a complex torus and the elliptic archimedean term -/

namespace TauCeti.Arakelov

open UpperHalfPlane
open scoped MatrixGroups

/-- `ComplexTorus.faltingsNormSqDz`: the squared Faltings norm `(i/2)∫_{ℂ/Λ} dz ∧ dz̄` of the
differential `dz` on the complex torus `ℂ/Λ`, which is the covolume of `Λ` (covolume-formula). -/
def ComplexTorus.faltingsNormSqDz (Λ : Submodule ℤ ℂ) : ℝ := ZLattice.covolume Λ

/-- `AbelianVariety.faltingsNormSq_elliptic`: for `Λ = ℤ + τℤ`, `‖dz‖²_Fal = Im τ`. -/
theorem ComplexTorus.faltingsNormSqDz_span (τ : ℍ) :
    ComplexTorus.faltingsNormSqDz (Submodule.span ℤ {(1 : ℂ), (τ : ℂ)}) = τ.im := sorry

/-- For `τ = i` the squared norm of `dz` is `1`. -/
example : ComplexTorus.faltingsNormSqDz (Submodule.span ℤ {(1 : ℂ), Complex.I}) = 1 := sorry

/-- `EllipticCurve.faltingsArchimedeanTerm`: `τ ↦ |Δ(τ)|·(Im τ)^6` with Mathlib's
`Δ = η^24 = q∏(1 − qⁿ)^24`; the archimedean term of
`12·deg^ ω̄̂(E/K) = log N(Δ_{E/K}) − Σ_σ log(|Δ(τ_σ)|(Im τ_σ)^6) − 12[K:ℚ] log 2π`. -/
def EllipticCurve.faltingsArchimedeanTerm (τ : ℍ) : ℝ :=
  ‖ModularForm.discriminant τ‖ * τ.im ^ 6

/-- `EllipticCurve.faltingsArchimedeanTerm_pos`. -/
theorem EllipticCurve.faltingsArchimedeanTerm_pos (τ : ℍ) :
    0 < EllipticCurve.faltingsArchimedeanTerm τ := sorry

/-- `EllipticCurve.faltingsArchimedeanTerm_smul`: invariance under `SL₂(ℤ)`, so the term does not
depend on the choice of `τ_σ`. -/
theorem EllipticCurve.faltingsArchimedeanTerm_smul (γ : SL(2, ℤ)) (τ : ℍ) :
    EllipticCurve.faltingsArchimedeanTerm (γ • τ) = EllipticCurve.faltingsArchimedeanTerm τ :=
  sorry

/-- `EllipticCurve.faltingsArchimedeanTerm_S`: invariance under `τ ↦ −1/τ`. -/
example (τ : ℍ) :
    EllipticCurve.faltingsArchimedeanTerm (ModularGroup.S • τ) =
      EllipticCurve.faltingsArchimedeanTerm τ :=
  EllipticCurve.faltingsArchimedeanTerm_smul _ _

/-- `EllipticCurve.faltingsHeight_lattice_disc_nonexample`: the lattice discriminant
`g₂³ − 27g₃² = (2π)^12 Δ(τ)` differs from Mathlib's normalised `Δ` by `(2π)^12`; mixing the two
normalisations shifts `12 h` by `12 log 2π`. -/
example (τ : ℍ) :
    Real.log (((2 * Real.pi) ^ 12) * EllipticCurve.faltingsArchimedeanTerm τ) =
      12 * Real.log (2 * Real.pi) + Real.log (EllipticCurve.faltingsArchimedeanTerm τ) := sorry

end TauCeti.Arakelov

/-! ## R35.5 The one-variable model of a logarithmic singularity -/

namespace TauCeti.Arakelov

open Filter Topology

/-- `HermitianMetric.LogSingularAtZero`: the local model of a hermitian metric with logarithmic
singularities along `q = 0` (Faltings–Chai V, Definition 4.2): the norm `f` of a local frame
satisfies `max(f, f⁻¹) ≤ C·(1 + |log |q||)^n` near `0`. -/
def HermitianMetric.LogSingularAtZero (f : ℂ → ℝ) : Prop :=
  ∃ C n : ℝ, ∀ᶠ q in 𝓝[≠] (0 : ℂ), max (f q) (f q)⁻¹ ≤ C * (1 + |Real.log ‖q‖|) ^ n

/-- `HermitianMetric.logSing_cusp`: near the cusp, `‖dz‖² = Im τ = −(1/2π) log |q|` has a
logarithmic singularity at `q = 0`. -/
example : HermitianMetric.LogSingularAtZero (fun q => -(1 / (2 * Real.pi)) * Real.log ‖q‖) := sorry

/-- `HermitianMetric.logSing_polynomial_nonexample`: `|q|^{−1/2}` grows faster than every power of
`log |q|`, so it is not a logarithmic singularity. -/
example : ¬ HermitianMetric.LogSingularAtZero (fun q => ‖q‖ ^ (-(1 / 2 : ℝ))) := sorry

/-- `HermitianMetric.logSing_power`: logarithmic singularities are stable under powers. -/
theorem HermitianMetric.LogSingularAtZero.pow {f : ℂ → ℝ} (hf : HermitianMetric.LogSingularAtZero f)
    (hpos : ∀ q, 0 < f q) (k : ℕ) : HermitianMetric.LogSingularAtZero (fun q => f q ^ k) := sorry

end TauCeti.Arakelov

/-! ## Statements not typed at the pins

The roadmap document states the following definitions, API items, unit tests and theorems in
mathematics. Their carriers (hermitian vector bundles of higher rank, arithmetic schemes and their
complex points, abelian schemes and Néron models over rings of integers, compactified moduli spaces,
theta structures) are not available at the pinned Mathlib and Tau Ceti, so they are README targets
rather than Lean declarations here.

### R35.1
* R35.1/hermitian-vector-bundle — Hermitian vector bundles over the ring of integers:
  `HermitianBundle.module`, `HermitianBundle.inner`, `HermitianBundle.inner_conj`,
  `HermitianBundle.rank`, `HermitianBundle.trivial`, `HermitianBundle.ofFractionalIdeal`,
  `HermitianBundle.Isometry.ext`, `HermitianBundle.rescale`, `HermitianBundle.normAt`,
  `HermitianBundle.trivial_rank`, `HermitianBundle.ofFractionalIdeal_one`,
  `HermitianBundle.conj_nonexample`, `HermitianBundle.rationals`
* R35.1/hermitian-operations — Sums, tensor products, duals, determinants, sub-bundles and base
  change: `HermitianBundle.sum`, `HermitianBundle.tensor`, `HermitianBundle.dual`,
  `HermitianBundle.det`, `HermitianBundle.restrict`, `HermitianBundle.quotient`,
  `HermitianBundle.baseChange`, `HermitianBundle.det_sum`, `HermitianBundle.det_exact`,
  `HermitianBundle.dual_dual`, `HermitianBundle.tensor_trivial`, `HermitianBundle.det_trivial_sum`,
  `HermitianBundle.quotient_metric_nonexample`, `HermitianBundle.baseChange_rank`
* R35.1/arithmetic-degree — The Arakelov degree of a hermitian bundle:
  `HermitianBundle.arakelovDegree`, `HermitianBundle.normalizedDegree`, `HermitianBundle.slope`,
  `HermitianBundle.arakelovDegree_eq_infinitePlace`, `HermitianBundle.arakelovDegree_trivial`,
  `HermitianBundle.arakelovDegree_rescale`, `HermitianBundle.arakelovDegree_ofFractionalIdeal`,
  `HermitianBundle.arakelovDegree_congr`, `HermitianBundle.arakelovDegree_trivial`,
  `HermitianBundle.arakelovDegree_ideal`, `HermitianBundle.arakelovDegree_rat`,
  `HermitianBundle.arakelovDegree_weight_nonexample`
* R35.1/degree-independent-of-section — Independence of the section: the product formula: theorem
  R35.1/degree-independent-of-section
* R35.1/degree-additivity — Additivity of the Arakelov degree: theorem R35.1/degree-additivity
* R35.1/degree-base-change — Arakelov degree under finite extension: theorem
  R35.1/degree-base-change
* R35.1/arakelov-divisors-of-number-field — Arakelov divisors on Spec O_K and the compactified
  Picard group: `ArakelovDivisor.principal`, `ArakelovDivisor.picHat_exact`,
  `ArakelovDivisor.toChowHat`, `ArakelovDivisor.finitePart`, `ArakelovDivisor.infinitePart`,
  `ArakelovDivisor.principalSubgroup`, `ArakelovDivisor.PicHat`, `ArakelovDivisor.degree_zero`,
  `ArakelovDivisor.degree_eq_of_sub_mem`, `ArakelovDivisor.degree_zero`,
  `ArakelovDivisor.picHat_rat`
* R35.1/arithmetic-divisors-green — Arithmetic divisors with Green functions and ĈH¹:
  `ArithmeticDivisor`, `ArithmeticDivisor.principal`, `ArithmeticChow1`,
  `ArithmeticDivisor.ofGreen`, `ArithmeticChow1.forget`, `ArithmeticChow1.restrict`,
  `ArithmeticChow1.localization`, `ArithmeticChow1.vertical_fibre`, `ArithmeticChow1.spec_ok`,
  `ArithmeticChow1.vertical_fibre_Z`, `ArithmeticDivisor.green_nonexample`,
  `ArithmeticChow1.empty_divisor`
* R35.1/pic-hat-iso-chow-hat — Metrized line bundles and arithmetic divisors: theorem
  R35.1/pic-hat-iso-chow-hat
* R35.1/arithmetic-degree-pairing — Arithmetic degree of ĈH¹ on proper one-cycles:
  `ArithmeticChow1.pairing`, `ArithmeticChow1.pairing_horizontal`,
  `ArithmeticChow1.pairing_vertical`, `ArithmeticChow1.pairing_principal`,
  `ArithmeticChow1.pairing_green`, `ArithmeticChow1.pairing_projection`,
  `ArithmeticChow1.pairing_localize`, `ArithmeticChow1.pointHeight`,
  `ArithmeticChow1.pairing_vertical_fibre`, `ArithmeticChow1.pairing_spec`,
  `ArithmeticChow1.pairing_RS_nonexample`, `ArithmeticChow1.pairing_metric_shift`
* R35.1/stack-weighted-degree — Arithmetic degree on relative dimension zero Deligne–Mumford
  stacks: `StackDegree.arakelovDegree`, `StackDegree.degree_effective`, `StackDegree.degree_green`,
  `StackDegree.degree_principal`, `StackDegree.degree_pullback_etale`, `StackDegree.degree_scheme`,
  `StackDegree.picHat_iso`, `StackDegree.degree_point_aut`, `StackDegree.degree_scheme_case`,
  `StackDegree.residue_norm_nonexample`, `StackDegree.etale_cover_scaling`
* R35.1/heights-of-points — Heights of algebraic points for metrized line bundles:
  `Height.ofMetrized_galois`, `Height.ofMetrized_tensor`, `Height.ofMetrized_pullback`,
  `Height.ofMetrized_metric_change`, `Height.ofMetrized_model_change`, `Height.ofMetrized_field`,
  `Height.ofMetrized_trivial`, `Height.ofMetrized_constant_metric`,
  `Height.ofMetrized_unnormalised_nonexample`
* R35.1/metrized-heights-weil-machine — Metrized heights represent Weil heights; Northcott for
  ample bundles: theorem R35.1/metrized-heights-weil-machine
* R35.1/sup-metric-height-comparison — Projective space: the Arakelov degree is Mathlib's height:
  `ArakelovDivisor.ofTuple`, `ArakelovDivisor.degree_ofTuple`, `ArakelovDivisor.ofTuple_smul`
* R35.1/norm-and-rational-lines — Hermitian ℚ-lines and norms of hermitian line bundles:
  `PicHat.rat`, `PicHat.norm`, `PicHat.norm_mul`, `PicHat.degree_norm`, `PicHat.norm_baseChange`,
  `PicHat.norm_trans`, `PicHat.norm_pushforward`, `PicHat.norm_self`, `PicHat.norm_gaussian_prime`,
  `PicHat.norm_degree_nonexample`, `PicHat.degree_rat`
### R35.2
* R35.2/hodge-line-of-group-scheme — The Hodge line of a smooth commutative group scheme:
  `GroupScheme.hodgeBundle`, `GroupScheme.hodgeLine`, `GroupScheme.hodgeLine_baseChange`,
  `GroupScheme.hodgeLine_openSubgroup`, `GroupScheme.hodgeLine_pullback`,
  `GroupScheme.hodgeLine_prod`, `AbelianScheme.hodgeLine_eq_pushforward`,
  `GroupScheme.hodgeLine_Gm`, `GroupScheme.hodgeLine_pushforward_nonexample`,
  `GroupScheme.hodgeLine_trivial_group`, `GroupScheme.hodgeLine_multiplication`
* R35.2/faltings-hermitian-form — The Faltings metric on top differential forms:
  `AbelianVariety.faltingsInner`, `AbelianVariety.faltingsInner_pos`,
  `AbelianVariety.faltingsNormSq_smul`, `AbelianVariety.faltingsNormSq_aut`,
  `AbelianVariety.faltingsNormSq_conj`, `AbelianVariety.faltingsNormSq_eq_volume`,
  `AbelianVariety.faltingsInner_sign_nonexample`, `AbelianVariety.faltingsNormSq_dim_zero`,
  `AbelianVariety.faltingsNormSq_product`
* R35.2/isogeny-pullback-norm — Faltings norms along isogenies: theorem R35.2/isogeny-pullback-norm
* R35.2/metrized-hodge-line — The metrized Hodge line bundle over O_K:
  `AbelianVariety.metrizedHodgeLine`, `GroupScheme.metrizedHodgeLine`,
  `AbelianVariety.metrizedHodgeLine_identityComponent`,
  `AbelianVariety.metrizedHodgeLine_baseChange_le`, `AbelianVariety.metrizedHodgeLine_iso`,
  `AbelianVariety.metrizedHodgeLine_pullback`, `AbelianVariety.metrizedHodgeLine_norm_eq_volume`,
  `AbelianVariety.metrizedHodgeLine_elliptic_Q`, `AbelianVariety.metrizedHodgeLine_dim_zero`,
  `AbelianVariety.metrizedHodgeLine_model_nonexample`, `AbelianVariety.metrizedHodgeLine_product`
* R35.2/product-isometry — Products: the metrized Hodge line is multiplicative: theorem
  R35.2/product-isometry
* R35.2/dual-hodge-line — The Hodge lines of A and its dual: theorem R35.2/dual-hodge-line
* R35.2/normalization-adapter — Normalisations of the Faltings metric and height: theorem
  R35.2/normalization-adapter
* R35.2/relative-faltings-metric — The Faltings metric on families and on the Siegel space:
  `AbelianFamily.faltingsMetric`, `AbelianFamily.faltingsMetric_baseChange`,
  `SiegelFamily.faltingsMetric_frame`, `SiegelFamily.faltingsMetric_invariant`,
  `AbelianFamily.faltingsMetric_conj`, `SiegelFamily.faltingsMetric_g1`,
  `SiegelFamily.faltingsMetric_modular_invariant`,
  `SiegelFamily.faltingsMetric_holomorphic_nonexample`, `AbelianFamily.faltingsMetric_constant`
* R35.2/elliptic-period-comparison — Elliptic curves: the Faltings height from the discriminant and
  the periods: `EllipticCurve.faltingsHeight_formula`, `EllipticCurve.faltingsHeight_11a2`,
  `EllipticCurve.faltingsHeight_basechange`
* R35.2/pairing-metric — The hermitian pairing of Ω(A) with Ω(A^t): theorem R35.2/pairing-metric
### R35.3
* R35.3/faltings-height — The Faltings height of an abelian variety over a number field:
  `AbelianVariety.faltingsHeight`, `GroupScheme.faltingsHeight`,
  `AbelianVariety.faltingsHeight_eq`, `AbelianVariety.faltingsHeight_congr`,
  `AbelianVariety.faltingsHeight_rescale`, `AbelianVariety.faltingsHeight_prod`,
  `AbelianVariety.faltingsHeight_11a2`, `AbelianVariety.faltingsHeight_dim_zero`,
  `AbelianVariety.faltingsHeight_model_nonexample`, `AbelianVariety.faltingsHeight_normalization`
* R35.3/model-and-polarization-independence — The Faltings height is an invariant of the abelian
  variety: theorem R35.3/model-and-polarization-independence
* R35.3/field-extension-comparison — Faltings height under finite extension and the bad-place
  correction: theorem R35.3/field-extension-comparison
* R35.3/stable-faltings-height — The stable Faltings height: `AbelianVariety.stableFaltingsHeight`,
  `AbelianVariety.stableFaltingsHeight_eq_of_semistable`,
  `AbelianVariety.stableFaltingsHeight_baseChange`, `AbelianVariety.stableFaltingsHeight_le`,
  `AbelianVariety.stableFaltingsHeight_congr_geometric`,
  `AbelianVariety.stableFaltingsHeight_twelve`, `AbelianVariety.stableFaltingsHeight_11a2`,
  `AbelianVariety.stableFaltingsHeight_twist`,
  `AbelianVariety.stableFaltingsHeight_relative_nonexample`,
  `AbelianVariety.stableFaltingsHeight_dim_zero`
* R35.3/stable-height-properties — Products, duals and powers for the stable height: theorem
  R35.3/stable-height-properties
* R35.3/bad-place-correction-bound — Each non-semistable prime contributes at least (log p)/[K′:ℚ]:
  theorem R35.3/bad-place-correction-bound
### R35.4
* R35.4/isogeny-different — The different of an isogeny of Néron models: `Isogeny.different`,
  `Isogeny.different_ne_bot`, `Isogeny.different_eq_top_of_etale`, `Isogeny.different_comp`,
  `Isogeny.card_quotient_different`, `Isogeny.different_eq_kernel_differentials`,
  `Isogeny.different_mul_n`, `Isogeny.different_id`, `Isogeny.different_mu_p`,
  `Isogeny.different_nonflat_nonexample`
* R35.4/isogeny-height-formula — Faltings' isogeny formula: theorem R35.4/isogeny-height-formula
* R35.4/dual-isogeny-differents — Differents of an isogeny and of its dual: theorem
  R35.4/dual-isogeny-differents
* R35.4/isogeny-height-bounds — Bounds and denominators for heights along isogenies: theorem
  R35.4/isogeny-height-bounds
* R35.4/p-divisible-tower-height — Heights along a tower of p-divisible subgroups: theorem
  R35.4/p-divisible-tower-height
* R35.4/component-line-height — τ-components of the Hodge line under an O_E-action:
  `AbelianVariety.componentQuotient`, `AbelianVariety.componentLine`,
  `AbelianVariety.componentHeight`, `AbelianVariety.componentHeight_baseChange`,
  `AbelianVariety.componentPairing_orthogonal`, `AbelianVariety.componentLine_trivial_action`,
  `AbelianVariety.componentHeight_Q`, `AbelianVariety.componentQuotient_rank`,
  `AbelianVariety.componentHeight_torsion_nonexample`, `AbelianVariety.componentHeight_sum`
* R35.4/component-isogeny-formula — τ-component heights along O_E-isogenies: theorem
  R35.4/component-isogeny-formula
* R35.4/cm-hodge-filtration-local — The Hodge filtration of a CM abelian scheme over a p-adic ring:
  theorem R35.4/cm-hodge-filtration-local
### R35.5
* R35.5/log-singular-metric — Hermitian metrics with logarithmic singularities:
  `HermitianMetric.HasLogSingularities`, `HermitianMetric.hasLogSingularities_iff_distance`,
  `HermitianMetric.hasLogSingularities_pullback`,
  `HermitianMetric.hasLogSingularities_of_modification`,
  `HermitianMetric.hasLogSingularities_tensor`,
  `HermitianMetric.hasLogSingularities_of_continuous`, `HermitianMetric.logSing_empty_boundary`
* R35.5/log-singular-heights — Heights for metrics with logarithmic singularities: theorem
  R35.5/log-singular-heights
* R35.5/hodge-metric-log-singularities — The Faltings metric has logarithmic growth at the
  boundary: theorem R35.5/hodge-metric-log-singularities
* R35.5/siegel-modular-line-bundle — The Hodge-metrized modular line bundle on the minimal
  compactification: `SiegelModuli.modularLineBundle`, `SiegelModuli.modularLineBundle_pullback`,
  `SiegelModuli.modularMetric`, `SiegelModuli.modularMetric_logSing`,
  `SiegelModuli.modularLineBundle_level`, `SiegelModuli.modularLineBundle_g1`,
  `SiegelModuli.modularLineBundle_g1_norm`, `SiegelModuli.modularLineBundle_ample_nonexample`,
  `SiegelModuli.modularMetric_continuous_nonexample`, `SiegelModuli.modularLineBundle_g0`
* R35.5/modular-height-equals-faltings-height — The modular height of a moduli point is m times the
  stable Faltings height: theorem R35.5/modular-height-equals-faltings-height
* R35.5/moduli-height-northcott — Northcott and a lower bound for the stable height of principally
  polarized varieties: theorem R35.5/moduli-height-northcott
* R35.5/theta-height — The theta height of a principally polarized abelian variety:
  `AbelianVariety.thetaNullPoint`, `AbelianVariety.thetaHeight`,
  `AbelianVariety.thetaHeight_nonneg`, `AbelianVariety.thetaHeight_congr`,
  `AbelianVariety.thetaHeight_northcott`, `AbelianVariety.thetaHeight_level_dependence`,
  `AbelianVariety.thetaHeight_elliptic`, `AbelianVariety.thetaHeight_sup_nonexample`,
  `AbelianVariety.thetaHeight_product`
* R35.5/theta-faltings-comparison — Comparison of theta height and stable Faltings height: theorem
  R35.5/theta-faltings-comparison
* R35.5/elliptic-j-height-bound — The stable Faltings height of an elliptic curve and h(j): theorem
  R35.5/elliptic-j-height-bound
### R35.6
* R35.6/zarhin-trick — Zarhin's trick: theorem R35.6/zarhin-trick
* R35.6/zarhin-height-identity — Heights through Zarhin's trick: theorem
  R35.6/zarhin-height-identity
* R35.6/field-degree-constants — Field-degree constants for semistability and level structures:
  theorem R35.6/field-degree-constants
* R35.6/moduli-point-finiteness — Finiteness of principally polarized abelian varieties of bounded
  stable height: theorem R35.6/moduli-point-finiteness
* R35.6/faltings-height-lower-bound — A lower bound for the stable Faltings height: theorem
  R35.6/faltings-height-lower-bound
* R35.6/finiteness-inputs-export — The height inputs to Faltings' finiteness theorems: theorem
  R35.6/finiteness-inputs-export
-/
