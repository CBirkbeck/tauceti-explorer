import Mathlib
import TauCeti.Analysis.Normed.Algebra.LogOneAdd.Basic

/-!
# ColemanIntegration: representative target signatures

The roadmap is `README.md`. This file records lightweight definitions and representative
milestone signatures expressible in the pinned Mathlib and Tau Ceti APIs. It is not exhaustive.
The README specifies the geometric, Coleman, Bloch-group and regulator constructions and all
their APIs and Checks. Definitions here have real bodies; theorem proofs are left as `sorry`.

The formal primitive has zero constant coefficient. Whole-disc analyticity requires positive
radius. Logarithm branches are specified by their principal-unit series and their value at `p`;
existence is a theorem, with no chosen branch constructed here. The complex polylogarithm uses
its scalar series, with a principal logarithm at weight one. Cross-ratios use homogeneous determinants in the displayed order. The Amice
operator is `(1 + T) d/dT`, and smoothing cancels poles before formal inversion.
-/

open Filter Topology
open scoped PowerSeries

noncomputable section

namespace TauCetiRoadmap.ColemanIntegration

/-! ## Layer L0: power series, residues and logarithm branches -/

section NatCastBound

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CharZero K]

/-- L0.1: in an ultrametric field of characteristic zero, `‖1/n‖` grows at most polynomially. -/
theorem norm_natCast_inv_le_rpow :
    ∃ s : ℝ, 0 ≤ s ∧ ∀ n : ℕ, 0 < n → ‖(n : K)‖⁻¹ ≤ (n : ℝ) ^ s := by
  sorry

end NatCastBound

/-! ### L0.F: the rational coefficient series -/

/-- The rational series `q_k = ∑_{n ≥ 1} n^{-k} Xⁿ`, shared by the p-adic and complex
polylogarithms. -/
def rationalPolylogSeries (k : ℤ) : PowerSeries ℚ :=
  PowerSeries.mk fun n => if n = 0 then 0 else ((n : ℚ) ^ k)⁻¹

/-- Euler differentiation lowers the weight, for every integer weight. -/
theorem X_mul_derivative_rationalPolylogSeries (k : ℤ) :
    PowerSeries.X * PowerSeries.derivative ℚ (rationalPolylogSeries k) =
      rationalPolylogSeries (k - 1) := by
  sorry

/-- `q_k` is characterised by its Euler derivative and its zero constant term. -/
theorem rationalPolylogSeries_unique (k : ℤ) (f : PowerSeries ℚ)
    (h0 : PowerSeries.constantCoeff f = 0)
    (hD : PowerSeries.X * PowerSeries.derivative ℚ f = rationalPolylogSeries (k - 1)) :
    f = rationalPolylogSeries k := by
  sorry

example : PowerSeries.coeff 2 (rationalPolylogSeries 1) = 1 / 2 := by sorry

/-- Negative weights are included: `q_{-1} = X/(1 - X)²`. -/
example : rationalPolylogSeries (-1) =
    PowerSeries.X * (1 - (PowerSeries.X : PowerSeries ℚ))⁻¹ ^ 2 := by sorry

/-! ### L0.2–L0.5: the normalised formal primitive -/

namespace PowerSeries

open _root_.PowerSeries

variable {A : Type*} [CommRing A] [Algebra ℚ A]

/-- The normalised formal primitive `∑ aₙ Xⁿ ↦ ∑ aₙ Xⁿ⁺¹/(n+1)` over a `ℚ`-algebra. -/
def primitive : A⟦X⟧ →ₗ[A] A⟦X⟧ where
  toFun f := mk fun n => if n = 0 then 0 else algebraMap ℚ A (1 / (n : ℚ)) * coeff (n - 1) f
  map_add' := by sorry
  map_smul' := by sorry

/-- L0.3. -/
theorem derivative_primitive (f : A⟦X⟧) : derivative A (primitive f) = f := by
  sorry

/-- L0.4: the primitive with a given constant term is unique. -/
theorem eq_C_add_primitive_iff (f g : A⟦X⟧) (c : A) :
    (derivative A g = f ∧ constantCoeff g = c) ↔ g = C c + primitive f := by
  sorry

example : primitive (1 : A⟦X⟧) = X := by sorry

/-- The primitive of the alternating geometric series is Mathlib's formal `log (1 + X)`. -/
example : primitive (mk fun n => (-1 : A) ^ n) = log A := by sorry

/-- Non-example: over `ZMod p` the monomial `X^(p-1)` has no primitive. -/
example (p : ℕ) [Fact p.Prime] : ¬ ∃ g : (ZMod p)⟦X⟧, derivative (ZMod p) g = X ^ (p - 1) := by
  sorry

end PowerSeries

section Radius

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CharZero K]
  [CompleteSpace K]

/-- L0.5 (a): termwise integration does not change the radius of convergence. -/
theorem radius_ofScalars_primitive (f : PowerSeries K) :
    (FormalMultilinearSeries.ofScalars K (fun n => PowerSeries.coeff n (PowerSeries.primitive f))).radius =
      (FormalMultilinearSeries.ofScalars K (fun n => PowerSeries.coeff n f)).radius := by
  sorry

/-- L0.5 (b): restricted at `ρ` implies the primitive is restricted at every `r < ρ`. -/
theorem isRestricted_primitive_of_lt {f : PowerSeries K} {ρ r : ℝ} (hr : 0 < r)
    (hrρ : r < ρ) (hf : f.IsRestricted ρ) : (PowerSeries.primitive f).IsRestricted r := by
  sorry

open Classical in
/-- L0.6: `∑ pᵏ X^(pᵏ-1)` is restricted at `1` but its primitive `∑ X^(pᵏ)` is not. -/
theorem not_isRestricted_primitive_closedDisc (p : ℕ) [Fact p.Prime]
    (hp : ‖(p : K)‖ < 1) :
    let f : PowerSeries K :=
      PowerSeries.mk fun n => if ∃ k : ℕ, n + 1 = p ^ k then ((n + 1 : ℕ) : K) else 0
    f.IsRestricted 1 ∧ ¬ (PowerSeries.primitive f).IsRestricted 1 := by
  sorry

end Radius

/-! ### L0.7–L0.9: functions analytic on a whole open disc -/

section Disc

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CompleteSpace K]

/-- The functions on the open disc `D⁻(a, r)` given by one convergent power series on the whole
disc (stronger than `AnalyticOnNhd`, which only asks for local power series). -/
def discAnalytic (a : K) (r : ENNReal) (hr : 0 < r) :
    Subalgebra K (Metric.eball a r → K) where
  carrier := {f | ∃ (F : K → K) (P : FormalMultilinearSeries K K K),
    HasFPowerSeriesOnBall F P a r ∧ ∀ z : Metric.eball a r, f z = F z}
  mul_mem' := by sorry
  add_mem' := by sorry
  algebraMap_mem' := by sorry

/-- Constants are analytic on every disc of positive radius, including `r = ∞`. -/
example (a c : K) (r : ENNReal) (hr : 0 < r) :
    (fun _ : Metric.eball a r => c) ∈ discAnalytic a r hr := by sorry

/-- Radius zero is excluded by the analytic-series predicate, even for a constant function. -/
example (a c : K) :
    ¬ ∃ P : FormalMultilinearSeries K K K, HasFPowerSeriesOnBall (fun _ => c) P a 0 := by
  rintro ⟨P, hP⟩
  exact (lt_irrefl (0 : ENNReal)) hP.r_pos

/-- Non-example: the indicator of a smaller disc is locally analytic but not given by one power
series on `D⁻(0, 1)`. -/
example (p : ℕ) [Fact p.Prime] :
    AnalyticOnNhd ℂ_[p] (Set.indicator (Metric.ball (0 : ℂ_[p]) (p : ℝ)⁻¹) (fun _ => (1 : ℂ_[p])))
        (Metric.ball 0 1) ∧
      ¬ ∃ P : FormalMultilinearSeries ℂ_[p] ℂ_[p] ℂ_[p],
        HasFPowerSeriesOnBall
          (Set.indicator (Metric.ball (0 : ℂ_[p]) (p : ℝ)⁻¹) (fun _ => (1 : ℂ_[p]))) P 0 1 := by
  sorry

/-- L0.8: on an open disc a whole-disc analytic function has a unique whole-disc analytic
primitive with a chosen value at a base point. -/
theorem existsUnique_primitive_disc [CharZero K] {a : K} {r : ENNReal} {f : K → K}
    {P : FormalMultilinearSeries K K K} (hf : HasFPowerSeriesOnBall f P a r) {b : K}
    (hb : b ∈ Metric.eball a r) (c : K) :
    ∃ F : K → K, (∃ Q : FormalMultilinearSeries K K K, HasFPowerSeriesOnBall F Q a r) ∧
      (∀ z ∈ Metric.eball a r, HasDerivAt F (f z) z) ∧ F b = c ∧
      ∀ G : K → K, (∃ Q : FormalMultilinearSeries K K K, HasFPowerSeriesOnBall G Q a r) →
        (∀ z ∈ Metric.eball a r, HasDerivAt G (f z) z) → G b = c →
          Set.EqOn G F (Metric.eball a r) := by
  sorry

end Disc

/-- L0.9: locally analytic functions with zero derivative need not be constant on a disc. -/
theorem exists_locallyConstant_nonconst (p : ℕ) [Fact p.Prime] :
    ∃ g : ℂ_[p] → ℂ_[p], AnalyticOnNhd ℂ_[p] g (Metric.ball 0 1) ∧
      (∀ z ∈ Metric.ball (0 : ℂ_[p]) 1, HasDerivAt g 0 z) ∧
      ¬ ∃ c, Set.EqOn g (fun _ => c) (Metric.ball 0 1) := by
  sorry

/-! ### L0.10 and L0.13: the logarithm series of Tau Ceti over an ultrametric field -/

section LogSeries

variable {K : Type*} [NontriviallyNormedField K] [IsUltrametricDist K] [CharZero K]

/-- L0.10: Tau Ceti's logarithm series has radius at least `1` over an ultrametric field of
characteristic zero (Tau Ceti's own radius theorem needs a continuous `ℚ≥0`-action, which
p-adic fields lack). -/
theorem one_le_radius_logOneAddSeries_of_ultrametric :
    1 ≤ (NormedSpace.logOneAddSeries K K).radius := by
  sorry

/-- L0.13: the series logarithm is a homomorphism on principal units. -/
theorem logOneAdd_add_mul_of_ultrametric [CompleteSpace K] {u v : K} (hu : ‖u‖ < 1)
    (hv : ‖v‖ < 1) :
    NormedSpace.logOneAdd K K (u + v + u * v) =
      NormedSpace.logOneAdd K K u + NormedSpace.logOneAdd K K v := by
  sorry

end LogSeries

/-! ### Logarithm branches on `ℂ_p` -/

section Branch

variable (p : ℕ) [Fact p.Prime]

/-- The interface used by Layers L2 and L3: `L` is multiplicative on `ℂ_p^×`, is the logarithm
series on `1 + 𝔪`, and sends `p` to `a`. -/
structure IsLogBranch (a : ℂ_[p]) (L : ℂ_[p] → ℂ_[p]) : Prop where
  map_mul : ∀ x y : ℂ_[p], x ≠ 0 → y ≠ 0 → L (x * y) = L x + L y
  map_p : L (p : ℂ_[p]) = a
  hasSum_one_add : ∀ x : ℂ_[p], ‖x‖ < 1 →
    HasSum (fun n : ℕ => (-1 : ℂ_[p]) ^ n * x ^ (n + 1) / (n + 1)) (L (1 + x))

/-- L0.15: there is a unique branch on `ℂ_p`, with the junk value zero at zero. -/
theorem existsUnique_logBranch (a : ℂ_[p]) :
    ∃! L : ℂ_[p] → ℂ_[p], IsLogBranch p a L ∧ L 0 = 0 := by
  sorry

/-- L0.16: branch change on a nonzero point, with its rational valuation specified by its norm. -/
theorem logBranch_sub {a b : ℂ_[p]} {L L' : ℂ_[p] → ℂ_[p]}
    (hL : IsLogBranch p a L) (hL' : IsLogBranch p b L')
    {x : ℂ_[p]} (hx : x ≠ 0) (v : ℚ) (hv : ‖x‖ = (p : ℝ) ^ (-(v : ℝ))) :
    L' x - L x = (b - a) * (v : ℂ_[p]) := by
  sorry

/-- The normalization distinguishes branches already at `p`. -/
example {L L' : ℂ_[p] → ℂ_[p]} (hL : IsLogBranch p 0 L)
    (hL' : IsLogBranch p 1 L') : L' p - L p = 1 := by
  sorry

/-- The zero function fails the principal-unit logarithm condition. -/
example (a : ℂ_[p]) : ¬ IsLogBranch p a (fun _ => 0) := by
  sorry

end Branch

/-! ## Layer L1: Frobenius continuation and Coleman functions -/

/-- L1.7: a Frobenius lift `φ` of an algebra `A` with differentials `Ω`, its action on `Ω`,
forms `ω`, the matrix `M` and the functions `g` with `φ^* ω_i = ∑_j M_ij ω_j + d g_i`. The
hypotheses (H0), (H1), (Hw) are the `Prop`-valued definitions below. -/
structure FrobeniusDatum (K A Ω : Type*) [Field K] [CommRing A] [Algebra K A] [AddCommGroup Ω]
    [Module A Ω] [Module K Ω] [IsScalarTower K A Ω] (r : ℕ) where
  /-- the exterior derivative -/
  d : Derivation K A Ω
  /-- the Frobenius lift -/
  φ : A →ₐ[K] A
  /-- its action on differentials -/
  φΩ : Ω →+ Ω
  φΩ_d : ∀ a, φΩ (d a) = d (φ a)
  φΩ_smul : ∀ (a : A) (w : Ω), φΩ (a • w) = φ a • φΩ w
  /-- the forms -/
  ω : Fin r → Ω
  /-- the Frobenius matrix -/
  M : Matrix (Fin r) (Fin r) K
  /-- the correction functions -/
  g : Fin r → A
  frobenius_eq : ∀ i, φΩ (ω i) = ∑ j, M i j • ω j + d (g i)

namespace FrobeniusDatum

variable {K A Ω : Type*} [Field K] [CommRing A] [Algebra K A] [AddCommGroup Ω] [Module A Ω]
  [Module K Ω] [IsScalarTower K A Ω] {r : ℕ} (𝔇 : FrobeniusDatum K A Ω r)

/-- (H0): the kernel of `d` is `K`. -/
def H0 : Prop := ∀ a : A, 𝔇.d a = 0 → a ∈ Set.range (algebraMap K A)

/-- (H1): the classes of the `ω i` form a basis of `Ω / dA`. -/
def H1 : Prop := ∀ η : Ω, ∃! c : Fin r → K, ∃ h : A, η = 𝔇.d h + ∑ i, c i • 𝔇.ω i

/-- (Hw): no product of `n ≥ 1` eigenvalues of `M` is a root of unity. -/
def Hw : Prop :=
  ∀ (n m : ℕ), 0 < n → 0 < m → ∀ μ : Fin n → AlgebraicClosure K,
    (∀ i, (𝔇.M.charpoly.map (algebraMap K (AlgebraicClosure K))).IsRoot (μ i)) →
      (∏ i, μ i) ^ m ≠ 1

/-- Constant algebras with zero differential satisfy the kernel-of-differentiation condition. -/
example (𝔇 : FrobeniusDatum K K Ω r) : 𝔇.H0 := by
  sorry

/-- Zero forms cannot be a one-element cohomology basis, even when `Ω = 0`. -/
example (𝔇 : FrobeniusDatum K A Ω 1) (hω : 𝔇.ω 0 = 0) : ¬ 𝔇.H1 := by
  sorry

/-- With no cohomology coordinates, the positive-weight condition is vacuous. -/
example (𝔇 : FrobeniusDatum K A Ω 0) : 𝔇.Hw := by
  sorry

/-- In rank one the unit Frobenius eigenvalue violates the weight condition. -/
example (𝔇 : FrobeniusDatum K A Ω 1) (hM : 𝔇.M = 1) : ¬ 𝔇.Hw := by
  sorry

end FrobeniusDatum

/-- L1.8: a product of Weil numbers of positive weight is not a root of unity. -/
theorem weil_weight_product_ne_one {q : ℕ} (hq : 1 < q) {n m : ℕ} (hm : 0 < m) (hn : 0 < n)
    (ev : Fin n → ℂ) (w : Fin n → ℕ) (hw : ∀ i, 1 ≤ w i)
    (habs : ∀ i, ‖ev i‖ = (q : ℝ) ^ ((w i : ℝ) / 2)) : (∏ i, ev i) ^ m ≠ 1 := by
  sorry

/-- L1.10: Frobenius equations along a bijection with finite orbits have unique solutions when
no power of `T` has a fixed vector. -/
theorem existsUnique_frobenius_orbit_solution {S : Type*} (F : S ≃ S)
    (hF : ∀ s, ∃ m, 0 < m ∧ F^[m] s = s) {L V : Type*} [Field L] [AddCommGroup V] [Module L V]
    [FiniteDimensional L V] (T : V →ₗ[L] V)
    (hT : ∀ m : ℕ, 0 < m → ∀ v, (T ^ m) v = v → v = 0) (e : S → V) :
    ∃! c : S → V, ∀ s, c (F s) = T (c s) + e s := by
  sorry

/-- L1.14: the constant term of the `l`-free part of a logarithmic Laurent germ. It is linear
but not multiplicative on Laurent germs; tangential normalisations use the regular part. -/
def constantTerm {K : Type*} [Field K] (F : Polynomial (LaurentSeries K)) : K :=
  (F.coeff 0).coeff 0

/-- Negative powers prevent `constantTerm` from being multiplicative: `CT(t⁻¹) CT(t) = 0` but
`CT(t⁻¹ t) = 1`. -/
example {K : Type*} [Field K] :
    constantTerm (Polynomial.C (HahnSeries.single (-1 : ℤ) (1 : K))) = 0 ∧
    constantTerm (Polynomial.C (HahnSeries.single (1 : ℤ) (1 : K))) = 0 ∧
    constantTerm (Polynomial.C
      ((HahnSeries.single (-1 : ℤ) (1 : K) : LaurentSeries K) *
        HahnSeries.single (1 : ℤ) (1 : K))) = 1 := by
  sorry

/-- The regular logarithmic germ has constant term its scalar coefficient. -/
example {K : Type*} [Field K] (c : K) :
    constantTerm (Polynomial.C (HahnSeries.single (0 : ℤ) c)) = c := by
  sorry

/-! ## Layer L2: Coleman polylogarithms and functional equations -/

section PolylogSeries

variable (p : ℕ) [Fact p.Prime]

/-- `polylogSer p k z = ∑_{n ≥ 1} zⁿ/nᵏ`, Coleman's `Li_k` on `‖z‖ < 1`. -/
def polylogSer (k : ℤ) (z : ℂ_[p]) : ℂ_[p] :=
  ∑' n : ℕ, z ^ (n + 1) / ((n + 1 : ℂ_[p]) ^ k)

/-- L2.1: the series has radius one. -/
theorem polylogSer_hasFPowerSeriesOnBall (k : ℤ) :
    HasFPowerSeriesOnBall (polylogSer p k)
      (FormalMultilinearSeries.ofScalars ℂ_[p]
        (fun n => if n = 0 then 0 else ((n : ℂ_[p]) ^ k)⁻¹)) 0 1 := by
  sorry

example (k : ℤ) : polylogSer p k 0 = 0 := by sorry

/-- Non-example: the series diverges at `1 + p`, a point of the residue disc of `1`. -/
example (k : ℕ) :
    ¬ Summable (fun n : ℕ => (1 + (p : ℂ_[p])) ^ (n + 1) / ((n + 1 : ℂ_[p]) ^ (k : ℤ))) := by
  sorry

end PolylogSeries

/-! ### L2.Fa: complex polylogarithms on the closed unit disc -/

section ComplexPolylog

/-- For `k ≥ 2`, `Li_k^ℂ(z) = ∑_{n ≥ 1} zⁿ/nᵏ` on the closed unit disc. At weight one use
`-log (1-z)`: its boundary series converges in the natural order, whereas Mathlib's `tsum`
requires unconditional convergence and would give zero at `z = -1`. -/
def complexPolylog (k : ℕ) (z : ℂ) : ℂ :=
  if k = 1 then -Complex.log (1 - z)
  else ∑' n : ℕ, z ^ (n + 1) / ((n + 1 : ℕ) : ℂ) ^ k

/-- L2.Fa: for `k ≥ 2` the series converges absolutely on the closed disc and its sum is
continuous there. -/
theorem complexPolylog_continuousOn {k : ℕ} (hk : 2 ≤ k) :
    ContinuousOn (complexPolylog k) (Metric.closedBall 0 1) := by
  sorry

/-- L2.Fa: on the unit circle the values are Mathlib's exponential zeta function. -/
theorem complexPolylog_eq_expZeta {k : ℕ} (hk : 2 ≤ k) (x : ℝ) :
    complexPolylog k (Complex.exp (2 * Real.pi * Complex.I * x)) = HurwitzZeta.expZeta x k := by
  sorry

/-- L2.Fa and L2.30: the complex inversion relation at roots of unity, unlike the p-adic one
(L2.25), has a Bernoulli term. -/
theorem complexPolylog_inversion_rootOfUnity {k : ℕ} (hk : 2 ≤ k) {x : ℝ} (hx0 : 0 < x)
    (hx1 : x < 1) :
    complexPolylog k (Complex.exp (2 * Real.pi * Complex.I * x)) +
        (-1) ^ k * complexPolylog k (Complex.exp (-(2 * Real.pi * Complex.I * x))) =
      -(2 * Real.pi * Complex.I) ^ k / (k.factorial) *
        ((Polynomial.bernoulli k).map (algebraMap ℚ ℂ)).eval (x : ℂ) := by
  sorry

example : complexPolylog 2 1 = (Real.pi : ℂ) ^ 2 / 6 := by sorry

example : complexPolylog 2 (-1) = -(Real.pi : ℂ) ^ 2 / 12 := by sorry

example : complexPolylog 1 (-1) = -Complex.log 2 := by sorry

example (k : ℕ) : complexPolylog k 0 = 0 := by sorry

end ComplexPolylog

namespace ProjectiveAlgebra

variable (K : Type*) [Field K]

/-- The projective line, with homogeneous coordinates `[x : y]`. -/
abbrev Point := Projectivization K (Fin 2 → K)

/-- The affine chart `x ↦ [x : 1]`. -/
def finitePoint (x : K) : Point K :=
  Projectivization.mk K ![x, 1] (by
    intro h
    have := congrFun h 1
    simp at this)

/-- The point `[1 : 0]`. -/
def infinity : Point K :=
  Projectivization.mk K ![1, 0] (by
    intro h
    have := congrFun h 0
    simp at this)

/-- The determinant of two coordinate vectors. -/
def detPair (v w : Fin 2 → K) : K := v 0 * w 1 - v 1 * w 0

/-- The cross-ratio `Δ(a,b)Δ(c,d)/(Δ(a,d)Δ(c,b))`, independent of representatives; the quotient
is total and every analytic use carries pairwise distinctness. -/
def crossRatio (a b c d : Point K) : K :=
  detPair K a.rep b.rep * detPair K c.rep d.rep /
    (detPair K a.rep d.rep * detPair K c.rep b.rep)

/-- The normalised five-tuple `(∞, 0, 1, x, y)`. -/
def normalizedFive (x y : K) : Fin 5 → Point K :=
  ![infinity K, finitePoint K 0, finitePoint K 1, finitePoint K x, finitePoint K y]

/-- Normalized coordinates are distinct when the two affine parameters are admissible. -/
example {x y : K} (hx0 : x ≠ 0) (hx1 : x ≠ 1) (hy0 : y ≠ 0) (hy1 : y ≠ 1)
    (hxy : x ≠ y) : Function.Injective (normalizedFive K x y) := by
  sorry

/-- The point at infinity is outside the finite chart. -/
example (x : K) : infinity K ≠ finitePoint K x := by
  sorry

/-- L2.Fb: the affine formula for the homogeneous cross-ratio. -/
theorem crossRatio_finite (a b c d : K) :
    crossRatio K (finitePoint K a) (finitePoint K b) (finitePoint K c) (finitePoint K d) =
      (a - b) * (c - d) / ((a - d) * (c - b)) := by sorry

example : crossRatio ℚ (infinity ℚ) (finitePoint ℚ 0) (finitePoint ℚ 1) (finitePoint ℚ 3) = -2 := by
  sorry

example : detPair ℚ ![2, 4] ![3, 6] = 0 := by sorry

example : detPair ℚ ![1, 0] ![0, 1] = 1 := by sorry

/-- A scalar five-term identity for a function with the two-term laws transfers to every
injective five-tuple of points; no relation in the integral pre-Bloch group is asserted. -/
theorem cyclic_relation_of_scalar {A : Type*} [AddCommGroup A] (f : K → A)
    (hc : ∀ z : K, z ≠ 0 → z ≠ 1 → f (1 - z) = -f z)
    (hi : ∀ z : K, z ≠ 0 → z ≠ 1 → f z⁻¹ = -f z)
    (hf : ∀ x y : K, x ≠ 0 → x ≠ 1 → y ≠ 0 → y ≠ 1 → x ≠ y →
      f x - f y + f (y / x) - f ((1 - x⁻¹) / (1 - y⁻¹)) + f ((1 - x) / (1 - y)) = 0)
    (s : Fin 5 → Point K) (hs : Function.Injective s) :
    ∑ i : Fin 5, f (crossRatio K (s i) (s (i + 1)) (s (i + 2)) (s (i + 3))) = 0 := by sorry

end ProjectiveAlgebra

/-! ## Layer L3: positive integer L-values and regulators -/

section PositiveIntegerValues

open scoped AbstractMeasure

variable {p : ℕ} [Fact p.Prime]
variable {K : Type*} [NontriviallyNormedField K] [CompleteSpace K] [IsUltrametricDist K]
  [CharZero K] [Algebra ℤ_[p] K] [ContinuousSMul ℤ_[p] K]

/-- Power series converging on the open unit disc (the ring `R⁺`). -/
def IsOpenDiscSeries (f : PowerSeries K) : Prop :=
  ∀ c : ℝ, 0 ≤ c → c < 1 → f.IsRestricted c

/-- Value of a power series at a point, as a `tsum`. -/
def evalSeries (f : PowerSeries K) (t : K) : K :=
  ∑' n, PowerSeries.coeff n f * t ^ n

/-- The operator `∂ = (1 + T) d/dT` on Amice transforms. -/
def dop (f : PowerSeries K) : PowerSeries K :=
  (1 + PowerSeries.X) * PowerSeries.derivative K f

open scoped Classical in
/-- The test function `x ↦ 1_{ℤ_p^×}(x) · x^{-k}`. -/
def unitsZPow (k : ℤ) : C(ℤ_[p], K) :=
  ⟨fun x => if IsUnit x then (algebraMap ℤ_[p] K x) ^ (-k) else 0, by sorry⟩

/-- L3.3: the Amice transform `w(1+T)/(1 - w(1+T)) = Li₀(w(1+T))` of the geometric measure. -/
def geometricTransform (w : K) : PowerSeries K :=
  PowerSeries.C w * (1 + PowerSeries.X) * (1 - PowerSeries.C w * (1 + PowerSeries.X))⁻¹

/-- For `w = 0` the transform is `0`. -/
example : geometricTransform (0 : K) = 0 := by sorry

/-- Non-example: at `w = 1` (inside the residue disc of `1`) the constant coefficient of
`1 - w(1+T)` vanishes, Mathlib's formal inverse is `0`, and the transform collapses to `0`; the
geometric measure exists only for `‖w - 1‖ = 1`. -/
example : geometricTransform (1 : K) = 0 := by sorry

/-- At a nonsingular formal parameter the constant coefficient need not vanish. -/
example : PowerSeries.constantCoeff (geometricTransform (-1 : K)) = -1 / 2 := by sorry

/-- Constant series converge on the open disc; the geometric series reaches its boundary. -/
example (c : K) : IsOpenDiscSeries (PowerSeries.C c) := by sorry

example : IsOpenDiscSeries ((1 - (PowerSeries.X : PowerSeries K))⁻¹) ∧
    ¬ ((1 - (PowerSeries.X : PowerSeries K))⁻¹).IsRestricted 1 := by sorry

/-- Evaluation retains the constant coefficient at the centre. -/
example (f : PowerSeries K) : evalSeries f 0 = PowerSeries.constantCoeff f := by sorry

example (c t : K) : evalSeries (PowerSeries.C c) t = c := by sorry

/-- The Amice derivative has the factor `1 + T`, including at weight zero. -/
example : dop (PowerSeries.X : PowerSeries K) = 1 + PowerSeries.X := by sorry

example : dop (1 : PowerSeries K) = 0 := by sorry

/-- The negative-moment test vanishes at zero and has value one at the unit one. -/
example (k : ℤ) : unitsZPow (p := p) (K := K) k 0 = 0 ∧
    unitsZPow (p := p) (K := K) k 1 = 1 := by sorry

/-- L3.6: if `∂^k F = A_μ` with `F ∈ R⁺`, then
`∫_{ℤ_p^×} x^{-k} dμ = F(0) - p⁻¹ ∑_{ξ ∈ μ_p} F(ξ - 1)`. -/
theorem negMoment_eq_of_primitive (μ : D(ℤ_[p], K)) (k : ℕ) (F : PowerSeries K)
    (hF : IsOpenDiscSeries F) (hder : dop^[k] F = μ.amiceTransform)
    (hμp : (Polynomial.nthRootsFinset p (1 : K)).card = p) :
    μ (unitsZPow (k : ℤ)) =
      evalSeries F 0 - (p : K)⁻¹ *
        ∑ ξ ∈ Polynomial.nthRootsFinset p (1 : K), evalSeries F (ξ - 1) := by
  sorry

/-- L3.18: `R_b(w(1+T)) · Q_b(w(1+T))⁻¹` with `Q_b(Z) = ∑_{i<b} Zⁱ` and
`R_b(Z) = ∑_{i<b-1} (b-1-i) Zⁱ`; only `Q_b(w(1+T))` is inverted, so the definition also works at
`w = 1`, where it is the smoothing transform `1/T - b/((1+T)^b - 1)`. -/
def rotatedSmoothedTransform (b : ℕ) (w : K) : PowerSeries K :=
  (∑ i ∈ Finset.range (b - 1),
    PowerSeries.C ((b - 1 - i : ℕ) : K) * (PowerSeries.C w * (1 + PowerSeries.X)) ^ i) *
  (∑ i ∈ Finset.range b, (PowerSeries.C w * (1 + PowerSeries.X)) ^ i)⁻¹

/-- L3.18: the value at the removable centre is `(b - 1)/2`. -/
theorem constantCoeff_rotatedSmoothedTransform_one (b : ℕ) (hb : 1 ≤ b) :
    PowerSeries.constantCoeff (rotatedSmoothedTransform b (1 : K)) = ((b : K) - 1) / 2 := by
  sorry

/-- For `b = 1` both finite sums are trivial and the transform is `0`. -/
example (w : K) : rotatedSmoothedTransform 1 w = 0 := by sorry

/-- Smoothing at the formerly singular centre has a nonzero finite value. -/
example : PowerSeries.constantCoeff (rotatedSmoothedTransform 2 (1 : K)) = 1 / 2 := by sorry

/-! ### L3.13: the complex formula -/

/-- L3.13: `L(θ, k) = G(θ⁻¹)⁻¹ ∑_c θ⁻¹(c) Li_k(e^{2πic/N})` for a primitive character of
conductor `N ≥ 2` and `k ≥ 2`, with the complex polylogarithm of L2.Fa (RJW Theorem 6.7(i)). -/
theorem LFunction_nat_eq_gaussSum_inv_mul_sum_complexPolylog {N : ℕ} [NeZero N]
    (θ : DirichletCharacter ℂ N) (hθ : θ.IsPrimitive) (hN : 2 ≤ N) (k : ℕ) (hk : 2 ≤ k) :
    DirichletCharacter.LFunction θ k =
      (gaussSum θ⁻¹ ZMod.stdAddChar)⁻¹ *
        ∑ c : ZMod N, θ⁻¹ c * complexPolylog k (ZMod.stdAddChar c) := by
  sorry

end PositiveIntegerValues

/-!
## Targets specified in the README

* L0: annulus residues and logarithmic primitives (L0.11–L0.12, L0.20–L0.25); the
  constructions of valuation and logarithm branches, Iwasawa logarithm and local-field
  compatibility (L0.14–L0.18). The branch existence and change milestones are stated above.
* L1: good-reduction pairs, wide opens, dagger algebras, logarithmic ends and Frobenius lifts
  (L1.1–L1.6); coordinate maps, change of basis and iteration of Frobenius data (L1.7);
  their geometric existence and the differential/dualizing-sheaf comparison (L1.9); the
  shuffle word algebra, its differential, depth and Frobenius action (L1.12–L1.16); Coleman functions and integration, uniqueness, Taylor
  transport with finite-chart convergence and gluing, lift and branch independence and
  pullback (L1.17–L1.24, L1.43); the punctured and four-punctured lines and their explicit data (L1.25–L1.42, L1.44).
* L2: the log-Laurent class and the global polylogarithm family and its uniqueness
  (L2.3–L2.6, L2.16), tangential normalization, differential, inversion, distribution and
  branch-change identities, value at one, Frobenius-modified polylogarithms, Galois
  compatibility and root-of-unity values (L2.2–L2.29); Coleman's dilogarithm, the scalar
  five-term defect, boundary analysis and five-term theorem (L2.18–L2.69); the integral
  pre-Bloch group, antisymmetric tensor quotient, boundary, Bloch group, functorial maps
  and dilogarithm evaluation (L2.Fb); the projective dilogarithm theorem and twisted sums
  (L2.70–L2.71). The complex series and the scalar-to-projective algebraic reduction
  have representative signatures above.
* L3: geometric and smoothed measures, Taylor primitives and polylogarithmic moments,
  character transforms and the p-adic L-function forms of Coleman's formula
  (L3.1–L3.12, L3.17–L3.35); the modified regulator polylogarithm (L3.14), rational
  K-theory and symbols, modified syntomic cohomology, Chern characters, regulator
  pairings and Artin L-functions with coefficients (L3.Fa.1–L3.Fd.2); cyclotomic
  regulators and the p-adic Beilinson conjecture, including the dyadic formulas
  (L3.15–L3.16, L3.36–L3.37).
-/

end TauCetiRoadmap.ColemanIntegration
