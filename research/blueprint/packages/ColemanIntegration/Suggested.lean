import Mathlib
import TauCeti.Analysis.Normed.Algebra.LogOneAdd.Basic

/-!
# ColemanIntegration: representative target signatures

The roadmap is `README.md`. This file records the definitions and theorem signatures of the
roadmap that can be stated against the pinned Mathlib and Tau Ceti, with real bodies for the
definitions and `sorry` for the proofs. It is not exhaustive: every target whose carriers are
not available at the pins (wide opens and dagger algebras, Coleman functions on a general curve,
rigid and syntomic cohomology, algebraic K-theory, Artin L-functions with coefficients) is a
README target only, and a closing comment lists them by name.

Design choices made explicit here:
* the p-adic polylogarithms are defined through their elementary characterisation
  (`IsPolylogFamily`), for any function `L` satisfying the branch interface `IsLogBranch`;
  the branch `padicLogBranch p a` of Layer L0 satisfies it;
* the statements of Layer L3 about measures are made for an arbitrary measure with the stated
  Amice transform and for an arbitrary family `Li` with the stated properties, over any complete
  ultrametric field `K` of characteristic zero with a continuous `ℤ_[p]`-algebra structure, so
  that they do not need the bounded measures with `O_K` coefficients of the supplier roadmaps;
* the complex polylogarithm on the closed unit disc is a real definition by its series,
  to be replaced by Mathlib's once one exists at a pinned commit.
-/

open Filter Topology
open scoped PowerSeries

set_option linter.unusedSectionVars false
set_option linter.unusedVariables false

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
def discAnalytic (a : K) (r : ENNReal) : Subalgebra K (Metric.eball a r → K) where
  carrier := {f | ∃ (F : K → K) (P : FormalMultilinearSeries K K K),
    HasFPowerSeriesOnBall F P a r ∧ ∀ z : Metric.eball a r, f z = F z}
  mul_mem' := by sorry
  add_mem' := by sorry
  algebraMap_mem' := by sorry

/-- Constants are analytic on every disc, including `r = ∞`. -/
example (a c : K) (r : ENNReal) : (fun _ : Metric.eball a r => c) ∈ discAnalytic a r := by sorry

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

/-! ### L0.14–L0.18: the branches `log_a` and the Iwasawa logarithm -/

section Branch

variable (p : ℕ) [Fact p.Prime]

/-- L0.14: the value group of `ℂ_p` is `p^ℚ`. -/
theorem exists_norm_eq_rpow (x : ℂ_[p]) (hx : x ≠ 0) :
    ∃ q : ℚ, ‖x‖ = (p : ℝ) ^ (-(q : ℝ)) := by
  sorry

/-- L0.14: every nonzero element has a power that is `p^m` times a principal unit. -/
theorem exists_pow_mul_zpow_mem_principal (x : ℂ_[p]) (hx : x ≠ 0) :
    ∃ N : ℕ, 0 < N ∧ ∃ m : ℤ, ‖x ^ N * (p : ℂ_[p]) ^ (-m) - 1‖ < 1 := by
  sorry

open Classical in
/-- The valuation `v_p(x) = -log_p ‖x‖ ∈ ℚ` on `ℂ_p` (junk value `0` at `0`). -/
def padicValC (x : ℂ_[p]) : ℚ :=
  if hx : x = 0 then 0 else Classical.choose (exists_norm_eq_rpow p x hx)

open Classical in
/-- L0.15: the branch `log_a` with `log_a(p) = a`, `log_a(x) = (log(x^N p^(-m)) + m a)/N`
(junk value `0` at `0`). -/
def padicLogBranch (a : ℂ_[p]) (x : ℂ_[p]) : ℂ_[p] :=
  if hx : x = 0 then 0 else
    let h := exists_pow_mul_zpow_mem_principal p x hx
    let N := Classical.choose h
    let m := Classical.choose (Classical.choose_spec h).2
    ((N : ℂ_[p]))⁻¹ *
      (NormedSpace.logOneAdd ℂ_[p] ℂ_[p] (x ^ N * (p : ℂ_[p]) ^ (-m) - 1) + (m : ℂ_[p]) * a)

/-- The interface used by Layers L2 and L3: `L` is multiplicative on `ℂ_p^×`, is the logarithm
series on `1 + 𝔪`, and sends `p` to `a`. -/
structure IsLogBranch (a : ℂ_[p]) (L : ℂ_[p] → ℂ_[p]) : Prop where
  map_mul : ∀ x y : ℂ_[p], x ≠ 0 → y ≠ 0 → L (x * y) = L x + L y
  map_p : L (p : ℂ_[p]) = a
  hasSum_one_add : ∀ x : ℂ_[p], ‖x‖ < 1 →
    HasSum (fun n : ℕ => (-1 : ℂ_[p]) ^ n * x ^ (n + 1) / (n + 1)) (L (1 + x))

variable {p}

/-- L0.15: `log_a` satisfies the branch interface. -/
theorem isLogBranch_padicLogBranch (a : ℂ_[p]) : IsLogBranch p a (padicLogBranch p a) := by
  sorry

/-- L0.15: uniqueness of the branch on `ℂ_p^×`. -/
theorem padicLogBranch_unique (a : ℂ_[p]) {L : ℂ_[p] → ℂ_[p]} (hL : IsLogBranch p a L)
    {x : ℂ_[p]} (hx : x ≠ 0) : L x = padicLogBranch p a x := by
  sorry

/-- L0.16: changing the branch. -/
theorem padicLogBranch_sub (a b : ℂ_[p]) {x : ℂ_[p]} (hx : x ≠ 0) :
    padicLogBranch p b x - padicLogBranch p a x = (b - a) * (padicValC p x : ℂ_[p]) := by
  sorry

/-- L0.17 (a): Galois compatibility. -/
theorem padicLogBranch_map (σ : ℂ_[p] ≃+* ℂ_[p]) (hσ : Continuous σ) (a x : ℂ_[p]) :
    padicLogBranch p (σ a) (σ x) = σ (padicLogBranch p a x) := by
  sorry

variable (p) in
/-- L0.18: the Iwasawa branch `log_p = log_0`. -/
def iwasawaLog : ℂ_[p] → ℂ_[p] := padicLogBranch p 0

/-- L0.18: the Iwasawa logarithm maps a finite extension of `ℚ_p` into itself. -/
theorem iwasawaLog_mem_of_finite (L : IntermediateField ℚ_[p] ℂ_[p])
    [FiniteDimensional ℚ_[p] L] {x : ℂ_[p]} (hx : x ∈ L) : iwasawaLog p x ∈ L := by
  sorry

example (k : ℕ) : iwasawaLog p ((p : ℂ_[p]) ^ k) = 0 := by sorry

/-- The branch with `a = 1` differs from the Iwasawa branch at `p`. -/
example : padicLogBranch p 1 p ≠ iwasawaLog p p := by sorry

end Branch

end TauCetiRoadmap.ColemanIntegration

namespace TauCetiRoadmap.ColemanIntegration

/-! ## Layer L1: Frobenius continuation and Coleman functions

The geometric carriers of this layer (good-reduction pairs, wide opens, the dagger algebra
`A⁺(Y)` and its differentials, residue discs) are supplied by AdicSpacesPartII; the algebraic
part of the construction is stated here over an abstract algebra `A` with a derivation into a
module `Ω`, which is how the README states L1.7 and L1.12–L1.13. -/

/-! ### L1.7: Frobenius-structured unipotent data -/

section Datum

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

/-- The `H¹` coordinates of a form, under (H1). -/
def coords (h1 : 𝔇.H1) (η : Ω) : Fin r → K := Classical.choose (h1 η).exists

/-- L1.7: Frobenius acts on the `H¹` coordinates through the transpose of `M`. -/
theorem coords_frobenius (h1 : 𝔇.H1) (η : Ω) :
    𝔇.coords h1 (𝔇.φΩ η) = (𝔇.M.transpose).mulVec (𝔇.coords h1 η) := by
  sorry

/-- `FrobeniusDatum.changeBasis`: replacing `ω` by `P ω` for an invertible `P` replaces `M` by
`P M P⁻¹` and `g` by `P g`. -/
def changeBasis (P : GL (Fin r) K) : FrobeniusDatum K A Ω r where
  d := 𝔇.d
  φ := 𝔇.φ
  φΩ := 𝔇.φΩ
  φΩ_d := 𝔇.φΩ_d
  φΩ_smul := 𝔇.φΩ_smul
  ω := fun i => ∑ j, (P : Matrix (Fin r) (Fin r) K) i j • 𝔇.ω j
  M := (P : Matrix (Fin r) (Fin r) K) * 𝔇.M * ((P⁻¹ : GL (Fin r) K) : Matrix (Fin r) (Fin r) K)
  g := fun i => ∑ j, algebraMap K A ((P : Matrix (Fin r) (Fin r) K) i j) * 𝔇.g j
  frobenius_eq := by sorry

/-- The correction functions of the `m`-th iterate: `g_0 = 0` and
`g_{m+1} = M^m g + φ(g_m)`. -/
def powG : ℕ → Fin r → A
  | 0 => 0
  | m + 1 => fun i => (∑ j, algebraMap K A ((𝔇.M ^ m) i j) * 𝔇.g j) + 𝔇.φ (powG m i)

/-- `FrobeniusDatum.pow`: the datum of the iterate `φ^m`, with matrix `M^m`. For `m ≥ 1` it is
the datum of the `q^m`-power map; this changes the Frobenius exponent and is not a datum for the
original `q` when `m > 1`. -/
def pow (m : ℕ) : FrobeniusDatum K A Ω r where
  d := 𝔇.d
  φ := 𝔇.φ ^ m
  φΩ := AddMonoidHom.mk' (fun w => (⇑𝔇.φΩ)^[m] w) (by sorry)
  φΩ_d := by sorry
  φΩ_smul := by sorry
  ω := 𝔇.ω
  M := 𝔇.M ^ m
  g := 𝔇.powG m
  frobenius_eq := by sorry

/-- Changing the basis conjugates the Frobenius matrix, so (Hw) is unchanged. -/
theorem hw_changeBasis_iff (P : GL (Fin r) K) : (𝔇.changeBasis P).Hw ↔ 𝔇.Hw := by
  sorry

/-- The zeroth iterate is the identity datum: its matrix is `1`, which violates (Hw) as soon as
`r ≥ 1`. -/
example (h : 0 < r) : ¬ (𝔇.pow 0).Hw := by sorry

end FrobeniusDatum

/-- L1.8: a product of Weil numbers of positive weight is not a root of unity. -/
theorem weil_weight_product_ne_one {q : ℕ} (hq : 1 < q) {n m : ℕ} (hm : 0 < m) (hn : 0 < n)
    (ev : Fin n → ℂ) (w : Fin n → ℕ) (hw : ∀ i, 1 ≤ w i)
    (habs : ∀ i, ‖ev i‖ = (q : ℝ) ^ ((w i : ℝ) / 2)) : (∏ i, ev i) ^ m ≠ 1 := by
  sorry

end Datum

/-! ### L1.10–L1.11: Dwork's principle along finite Frobenius orbits -/

/-- L1.10: Frobenius equations along a bijection with finite orbits have unique solutions when
no power of `T` has a fixed vector. -/
theorem existsUnique_frobenius_orbit_solution {S : Type*} (F : S ≃ S)
    (hF : ∀ s, ∃ m, 0 < m ∧ F^[m] s = s) {L V : Type*} [Field L] [AddCommGroup V] [Module L V]
    [FiniteDimensional L V] (T : V →ₗ[L] V)
    (hT : ∀ m : ℕ, 0 < m → ∀ v, (T ^ m) v = v → v = 0) (e : S → V) :
    ∃! c : S → V, ∀ s, c (F s) = T (c s) + e s := by
  sorry

/-! ### L1.12–L1.13: the unipotent word algebra -/

section Words

/-- The shuffle of two words. -/
def shuffle {α : Type*} : List α → List α → List (List α)
  | [], v => [v]
  | u, [] => [u]
  | a :: u, b :: v => (shuffle u (b :: v)).map (a :: ·) ++ (shuffle (a :: u) v).map (b :: ·)
termination_by u v => u.length + v.length

/-- The unipotent word algebra `U(A; ω)`: the free `A`-module on words in `Fin r`, with the
shuffle product. The first letter of a word is the outermost integration. -/
def WordAlgebra (A : Type*) [CommRing A] (r : ℕ) : Type _ := List (Fin r) →₀ A

namespace WordAlgebra

variable {A : Type*} [CommRing A] {r : ℕ}

instance : AddCommGroup (WordAlgebra A r) := inferInstanceAs (AddCommGroup (List (Fin r) →₀ A))
instance : Module A (WordAlgebra A r) := inferInstanceAs (Module A (List (Fin r) →₀ A))

/-- The basis vector `L_w`. -/
def L (w : List (Fin r)) : WordAlgebra A r := Finsupp.single w 1

/-- The shuffle product. -/
instance : Mul (WordAlgebra A r) where
  mul x y := (show List (Fin r) →₀ A from x).sum fun u a =>
    (show List (Fin r) →₀ A from y).sum fun v b =>
      ((shuffle u v).map fun w => (Finsupp.single w (a * b) : List (Fin r) →₀ A)).sum

instance : One (WordAlgebra A r) := ⟨L []⟩

instance : CommRing (WordAlgebra A r) where
  __ := (inferInstance : AddCommGroup (WordAlgebra A r))
  mul_assoc := by sorry
  one_mul := by sorry
  mul_one := by sorry
  left_distrib := by sorry
  right_distrib := by sorry
  zero_mul := by sorry
  mul_zero := by sorry
  mul_comm := by sorry
  natCast n := (n : A) • L []
  natCast_zero := by sorry
  natCast_succ := by sorry
  intCast n := (n : A) • L []
  intCast_ofNat := by sorry
  intCast_negSucc := by sorry
  npow := npowRec
  zsmul := fun n x => (n : A) • x
  zsmul_zero' := by sorry
  zsmul_succ' := by sorry
  zsmul_neg' := by sorry

/-- The derivation `D : U → U ⊗ Ω`, with `U ⊗ Ω` realised as `Ω`-valued coefficients on words:
`D(f L_w) = L_w ⊗ df + f L_{w'} ⊗ ω_i` for `w = i :: w'`. -/
def D {K Ω : Type*} [Field K] [Algebra K A] [AddCommGroup Ω] [Module A Ω] [Module K Ω]
    (d : Derivation K A Ω) (ω : Fin r → Ω) (x : WordAlgebra A r) : List (Fin r) →₀ Ω :=
  (show List (Fin r) →₀ A from x).sum fun w a =>
    Finsupp.single w (d a) + match w with
      | [] => 0
      | i :: w' => Finsupp.single w' (a • ω i)

/-- The depth filtration `U_{≤ n}`. -/
def depth (n : ℕ) : Submodule A (WordAlgebra A r) where
  carrier := {x | ∀ w, n < w.length → (show List (Fin r) →₀ A from x) w = 0}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry

variable {K Ω : Type*} [Field K] [Algebra K A] [AddCommGroup Ω] [Module A Ω] [Module K Ω]

example (i j : Fin r) :
    (L [i] : WordAlgebra A r) * L [j] = L [i, j] + L [j, i] ∧
      (L [i] : WordAlgebra A r) * L [i] = 2 * L [i, i] := by sorry

/-- Non-example for concatenation: the Leibniz rule forces `D(L[i] L[i]) = 2 ω_i` at `[i]`,
which the shuffle product gives and concatenation would not. -/
example (d : Derivation K A Ω) (ω : Fin r → Ω) (i : Fin r) :
    D d ω ((L [i] : WordAlgebra A r) * L [i]) = Finsupp.single [i] ((2 : A) • ω i) := by sorry

/-- L1.13 (a): under (H0) and (H1) every `Ω`-valued coefficient family is a `D`-image. -/
theorem D_surjective [IsScalarTower K A Ω] (𝔇 : FrobeniusDatum K A Ω r) (h0 : 𝔇.H0)
    (h1 : 𝔇.H1) : Function.Surjective (D 𝔇.d 𝔇.ω : WordAlgebra A r → _) := by
  sorry

/-- L1.13 (b): `ker D = K`. -/
theorem D_eq_zero_iff [IsScalarTower K A Ω] (𝔇 : FrobeniusDatum K A Ω r) (h0 : 𝔇.H0)
    (h1 : 𝔇.H1) (x : WordAlgebra A r) :
    D 𝔇.d 𝔇.ω x = 0 ↔ ∃ c : K, x = (algebraMap K A c) • (L [] : WordAlgebra A r) := by
  sorry

end WordAlgebra

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

end Words

end TauCetiRoadmap.ColemanIntegration

namespace TauCetiRoadmap.ColemanIntegration

/-! ## Layer L2: Coleman polylogarithms and functional equations -/

section Polylog

variable (p : ℕ) [Fact p.Prime]

/-! ### L2.1: the polylogarithm series on the open unit disc -/

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

/-! ### L2.3–L2.16: Coleman's polylogarithms through their elementary characterisation -/

/-- `f` is, on `0 < ‖z - c‖ < 1`, a polynomial in `L (z - c)` with coefficients Laurent series in
`z - c` converging on the punctured unit disc around `c`. -/
def IsLogLaurentNear (L : ℂ_[p] → ℂ_[p]) (f : ℂ_[p] → ℂ_[p]) (c : ℂ_[p]) : Prop :=
  ∃ (N : ℕ) (coeff : ℕ → ℤ → ℂ_[p]),
    (∀ i : ℕ, ∀ r : ℝ, 0 < r → r < 1 → Summable fun n : ℤ => ‖coeff i n‖ * r ^ n) ∧
    ∀ z : ℂ_[p], 0 < ‖z - c‖ → ‖z - c‖ < 1 →
      f z = ∑ i ∈ Finset.range (N + 1), (∑' n : ℤ, coeff i n * (z - c) ^ n) * L (z - c) ^ i

/-- The same shape at `∞`, in the parameter `1/z`, on `‖z‖ > 1`. -/
def IsLogLaurentAtInfty (L : ℂ_[p] → ℂ_[p]) (f : ℂ_[p] → ℂ_[p]) : Prop :=
  ∃ (N : ℕ) (coeff : ℕ → ℤ → ℂ_[p]),
    (∀ i : ℕ, ∀ r : ℝ, 0 < r → r < 1 → Summable fun n : ℤ => ‖coeff i n‖ * r ^ n) ∧
    ∀ z : ℂ_[p], 1 < ‖z‖ →
      f z = ∑ i ∈ Finset.range (N + 1), (∑' n : ℤ, coeff i n * z⁻¹ ^ n) * L z⁻¹ ^ i

/-- The class of functions of BBdJR §4: analytic on every residue disc `D⁻(x, 1)` with
`‖x - 1‖ = 1`, and logarithmic-Laurent on the punctured discs of `1` and `∞`. -/
structure InPolylogClass (L : ℂ_[p] → ℂ_[p]) (f : ℂ_[p] → ℂ_[p]) : Prop where
  analytic_residue_disc : ∀ x : ℂ_[p], ‖x - 1‖ = 1 →
    ∃ q : FormalMultilinearSeries ℂ_[p] ℂ_[p] ℂ_[p], HasFPowerSeriesOnBall f q x 1
  near_one : IsLogLaurentNear p L f 1
  near_infty : IsLogLaurentAtInfty p L f

/-- The characterising properties of L2.16, with the normalisation of the value at `1`. -/
structure IsPolylogFamily (L : ℂ_[p] → ℂ_[p]) (F : ℕ → ℂ_[p] → ℂ_[p]) : Prop where
  zero_index : ∀ z : ℂ_[p], z ≠ 1 → F 0 z = z / (1 - z)
  apply_zero : ∀ k, F k 0 = 0
  mem_class : ∀ k, InPolylogClass p L (F k)
  hasDerivAt : ∀ k (z : ℂ_[p]), z ≠ 1 → z ≠ 0 → HasDerivAt (F (k + 1)) (F k z / z) z
  frobenius : ∀ k, ∃ g : FormalMultilinearSeries ℂ_[p] ℂ_[p] ℂ_[p],
    ENNReal.ofReal ((p : ℝ) ^ ((1 : ℝ) / ((p : ℝ) - 1))) ≤ g.radius ∧
    ∀ z : ℂ_[p], (p : ℝ) ^ (-(1 : ℝ) / ((p : ℝ) - 1)) < ‖z - 1‖ →
      F k z - ((p : ℂ_[p]) ^ k)⁻¹ * F k (z ^ p) = g.sum (1 - z)⁻¹
  tendsto_one : ∀ k, 2 ≤ k →
    Tendsto (fun x : ℚ_[p] => F k (algebraMap ℚ_[p] ℂ_[p] x)) (𝓝[≠] 1) (𝓝 (F k 1))
  apply_one : ∀ k, k < 2 → F k 1 = 0

/-- L2.3 and L2.16: for every branch there is exactly one polylogarithm family. -/
theorem existsUnique_isPolylogFamily {a : ℂ_[p]} {L : ℂ_[p] → ℂ_[p]} (hL : IsLogBranch p a L) :
    ∃! F : ℕ → ℂ_[p] → ℂ_[p], IsPolylogFamily p L F := by
  sorry

/-- L2.5: Coleman's p-adic polylogarithm `Li^a_k`, defined through its characterisation. -/
def padicPolylog {a : ℂ_[p]} {L : ℂ_[p] → ℂ_[p]} (hL : IsLogBranch p a L) :
    ℕ → ℂ_[p] → ℂ_[p] :=
  (existsUnique_isPolylogFamily p hL).exists.choose

variable {p} {a : ℂ_[p]} {L : ℂ_[p] → ℂ_[p]}

/-- The Frobenius-modified polylogarithm `Li^{(p)}_k(z) = Li_k(z) - p^{-k} Li_k(z^p)`. -/
def padicModPolylog (hL : IsLogBranch p a L) (k : ℕ) (z : ℂ_[p]) : ℂ_[p] :=
  padicPolylog p hL k z - ((p : ℂ_[p]) ^ k)⁻¹ * padicPolylog p hL k (z ^ p)

/-- The p-adic zeta value `Li_k(1)` (`k ≥ 2`). -/
def padicZeta (hL : IsLogBranch p a L) (k : ℕ) : ℂ_[p] := padicPolylog p hL k 1

theorem padicPolylog_one_index (hL : IsLogBranch p a L) {z : ℂ_[p]} (hz : z ≠ 1) :
    padicPolylog p hL 1 z = -L (1 - z) := by
  sorry

theorem padicPolylog_eq_polylogSer (hL : IsLogBranch p a L) (k : ℕ) {z : ℂ_[p]}
    (hz : ‖z‖ < 1) : padicPolylog p hL k z = polylogSer p k z := by
  sorry

/-- Branch control: `Li_1(1/p) = -log_a(1 - 1/p) = a - log_a(1 - p)`. -/
example (hL : IsLogBranch p a L) :
    padicPolylog p hL 1 ((p : ℂ_[p])⁻¹) = a - L (1 - (p : ℂ_[p])) := by
  sorry

/-- L2.8: the distribution relation. -/
theorem padicPolylog_distribution (hL : IsLogBranch p a L) (k m : ℕ) (hm : 0 < m)
    {z : ℂ_[p]} (hz : z ^ m ≠ 1) {ζ : ℂ_[p]} (hζ : IsPrimitiveRoot ζ m) :
    ∑ i ∈ Finset.range m, padicPolylog p hL k (ζ ^ i * z) =
      ((m : ℂ_[p]) ^ k)⁻¹ * (m : ℂ_[p]) * padicPolylog p hL k (z ^ m) := by
  sorry

/-- L2.9: the inversion relation. -/
theorem padicPolylog_inversion (hL : IsLogBranch p a L) (k : ℕ) {z : ℂ_[p]} (hz0 : z ≠ 0)
    (hz1 : z ≠ 1) :
    padicPolylog p hL k z + (-1) ^ k * padicPolylog p hL k z⁻¹ = -(L z) ^ k / (k.factorial) := by
  sorry

/-- L2.10: dependence on the branch (Besser–de Jeu, Proposition 2.6), with `v(1 - z)` written
through the norm `‖1 - z‖ = p^{-v}`. -/
theorem padicPolylog_sub_padicPolylog {b : ℂ_[p]} {L' : ℂ_[p] → ℂ_[p]} (hL : IsLogBranch p a L)
    (hL' : IsLogBranch p b L') (k : ℕ) (hk : 1 ≤ k) {z : ℂ_[p]} (hz : z ≠ 1) (v : ℚ)
    (hv : ‖1 - z‖ = (p : ℝ) ^ (-(v : ℝ))) :
    padicPolylog p hL k z - padicPolylog p hL' k z =
      -((a - b) * (v : ℂ_[p]) / (k.factorial)) *
        ∑ j ∈ Finset.range k, L z ^ (k - 1 - j) * L' z ^ j := by
  sorry

/-- L2.11: the value at `1` is the limit along `ℚ_p` (and along any finitely ramified
extension). -/
theorem tendsto_padicPolylog_one (hL : IsLogBranch p a L) {k : ℕ} (hk : 2 ≤ k) :
    Tendsto (fun x : ℚ_[p] => padicPolylog p hL k (algebraMap ℚ_[p] ℂ_[p] x)) (𝓝[≠] 1)
      (𝓝 (padicZeta hL k)) := by
  sorry

/-- L2.15: Coleman's Frobenius relation, with the overconvergent series in `1/(1 - z)`. -/
theorem padicModPolylog_overconvergent (hL : IsLogBranch p a L) (k : ℕ) :
    ∃ g : FormalMultilinearSeries ℂ_[p] ℂ_[p] ℂ_[p],
      ENNReal.ofReal ((p : ℝ) ^ ((1 : ℝ) / ((p : ℝ) - 1))) ≤ g.radius ∧
      ∀ z : ℂ_[p], (p : ℝ) ^ (-(1 : ℝ) / ((p : ℝ) - 1)) < ‖z - 1‖ →
        padicModPolylog hL k z = g.sum (1 - z)⁻¹ := by
  sorry

/-- L2.17: Galois equivariance. -/
theorem padicPolylog_map {b : ℂ_[p]} {L' : ℂ_[p] → ℂ_[p]} (hL : IsLogBranch p a L)
    (hL' : IsLogBranch p b L') (σ : ℂ_[p] ≃+* ℂ_[p]) (hσ : Continuous σ) (hσa : σ a = b)
    (k : ℕ) {z : ℂ_[p]} (hz : z ≠ 1) :
    σ (padicPolylog p hL k z) = padicPolylog p hL' k (σ z) := by
  sorry

/-- L2.25: at a root of unity of order `N ≥ 2` the inversion relation has no logarithmic term,
in contrast with the complex relation of L2.30. -/
theorem padicPolylog_inv_of_isPrimitiveRoot (hL : IsLogBranch p a L) {k N : ℕ} (hk : 1 ≤ k)
    (hN : 2 ≤ N) {ζ : ℂ_[p]} (hζ : IsPrimitiveRoot ζ N) :
    padicPolylog p hL k ζ⁻¹ = (-1) ^ (k + 1) * padicPolylog p hL k ζ := by
  sorry

/-- L2.27: at a root of unity of `p`-power order the values of weight `k ≥ 2` do not depend on
the branch. -/
theorem padicPolylog_primePow_rootOfUnity_branch (hL : IsLogBranch p a L) {b : ℂ_[p]}
    {L' : ℂ_[p] → ℂ_[p]} (hL' : IsLogBranch p b L') {k r : ℕ} (hk : 2 ≤ k) (hr : 1 ≤ r)
    {ζ : ℂ_[p]} (hζ : IsPrimitiveRoot ζ (p ^ r)) :
    padicPolylog p hL k ζ = padicPolylog p hL' k ζ := by
  sorry

/-! ### L2.18 and L2.31–L2.70: the dilogarithm and the five-term relation -/

/-- Coleman's dilogarithm `D^a(z) = Li^a_2(z) + ½ log_a z · log_a (1 - z)`. -/
def dilogD (hL : IsLogBranch p a L) (z : ℂ_[p]) : ℂ_[p] :=
  padicPolylog p hL 2 z + L z * L (1 - z) / 2

/-- L2.31: the scalar five-term expression, with no vanishing built into the definition. -/
def fiveTermDefect (hL : IsLogBranch p a L) (x y : ℂ_[p]) : ℂ_[p] :=
  dilogD hL x - dilogD hL y + dilogD hL (y / x) -
    dilogD hL ((1 - x⁻¹) / (1 - y⁻¹)) + dilogD hL ((1 - x) / (1 - y))

/-- L2.18: the two-term relations of `D`. -/
theorem dilogD_one_sub (hL : IsLogBranch p a L) {z : ℂ_[p]} (hz0 : z ≠ 0) (hz1 : z ≠ 1) :
    dilogD hL (1 - z) = -dilogD hL z := by
  sorry

theorem dilogD_inv (hL : IsLogBranch p a L) {z : ℂ_[p]} (hz0 : z ≠ 0) (hz1 : z ≠ 1) :
    dilogD hL z⁻¹ = -dilogD hL z := by
  sorry

/-- L2.69: the scalar five-term relation for Coleman's dilogarithm, for every prime `p` and
every branch. -/
theorem fiveTermDefect_eq_zero (hL : IsLogBranch p a L) {x y : ℂ_[p]} (hx0 : x ≠ 0)
    (hx1 : x ≠ 1) (hy0 : y ≠ 0) (hy1 : y ≠ 1) (hxy : x ≠ y) : fiveTermDefect hL x y = 0 := by
  sorry

/-! ### L2.71: twisted sums for primitive characters -/

/-- The twisted sum `∑_{c ∈ (ℤ/N)ˣ} θ⁻¹(c) Li_k(ε^c)`. -/
def twistedPolylogSum (hL : IsLogBranch p a L) {N : ℕ} [NeZero N]
    (θ : DirichletCharacter ℂ_[p] N) (ε : ℂ_[p]) (k : ℕ) : ℂ_[p] :=
  ∑ c : (ZMod N)ˣ, θ⁻¹ (c : ZMod N) * padicPolylog p hL k (ε ^ (c : ZMod N).val)

/-- L2.71: the Euler factor appears when `Li_k` is replaced by `Li^{(p)}_k`. -/
theorem twistedModPolylogSum_eq (hL : IsLogBranch p a L) {N k : ℕ} [NeZero N] (hk : 1 ≤ k)
    (θ : DirichletCharacter ℂ_[p] N) (hθ : θ.IsPrimitive) (hθ1 : θ ≠ 1) {ε : ℂ_[p]}
    (hε : IsPrimitiveRoot ε N) (hNk : N ≠ p ∨ 2 ≤ k) :
    ∑ c : (ZMod N)ˣ, θ⁻¹ (c : ZMod N) * padicModPolylog hL k (ε ^ (c : ZMod N).val) =
      (1 - θ (p : ZMod N) * ((p : ℂ_[p]) ^ k)⁻¹) * twistedPolylogSum hL θ ε k := by
  sorry

/-- Parity: the twisted sum vanishes when `θ(-1) = (-1)^k`. -/
theorem twistedPolylogSum_parity (hL : IsLogBranch p a L) {N k : ℕ} [NeZero N] (hk : 1 ≤ k)
    (θ : DirichletCharacter ℂ_[p] N) {ε : ℂ_[p]} (hε : IsPrimitiveRoot ε N)
    (hpar : θ (-1) = (-1) ^ k) : twistedPolylogSum hL θ ε k = 0 := by
  sorry

end Polylog

/-! ### L2.Fa: complex polylogarithms on the closed unit disc -/

section ComplexPolylog

/-- `Li_k^ℂ(z) = ∑_{n ≥ 1} zⁿ/nᵏ`; for `k ≥ 2` it converges on the closed unit disc, and for
`k = 1` at the roots of unity `ζ ≠ 1` (conditionally); elsewhere the `tsum` takes its junk value. -/
def complexPolylog (k : ℕ) (z : ℂ) : ℂ :=
  ∑' n : ℕ, z ^ (n + 1) / ((n + 1 : ℕ) : ℂ) ^ k

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

example (k : ℕ) : complexPolylog k 0 = 0 := by sorry

end ComplexPolylog

/-! ### L2.Fb: the pre-Bloch and Bloch groups of a field -/

namespace BlochAlgebra

open scoped TensorProduct

variable (K : Type*) [Field K]

/-- The free abelian group on `K ∖ {0, 1}`. -/
abbrev Symbols := FreeAbelianGroup {x : K // x ≠ 0 ∧ x ≠ 1}

/-- Total notation for an admissible generator, zero at `0` and `1`. -/
def symbol (x : K) : Symbols K := by
  classical
  exact if h : x ≠ 0 ∧ x ≠ 1 then FreeAbelianGroup.of ⟨x, h⟩ else 0

/-- Exactly the nondegenerate parameters of the five-term relation. -/
abbrev FiveTermParameters :=
  {xy : K × K // xy.1 ≠ 0 ∧ xy.1 ≠ 1 ∧ xy.2 ≠ 0 ∧ xy.2 ≠ 1 ∧ xy.1 ≠ xy.2}

/-- The five-term expression `[x] - [y] + [y/x] - [(1-x⁻¹)/(1-y⁻¹)] + [(1-x)/(1-y)]`. -/
def fiveTermRelation (xy : FiveTermParameters K) : Symbols K :=
  symbol K xy.val.1 - symbol K xy.val.2 + symbol K (xy.val.2 / xy.val.1) -
    symbol K ((1 - xy.val.1⁻¹) / (1 - xy.val.2⁻¹)) +
      symbol K ((1 - xy.val.1) / (1 - xy.val.2))

/-- The subgroup generated by the five-term expressions. -/
def fiveTermSubgroup : AddSubgroup (Symbols K) :=
  AddSubgroup.closure (Set.range (fiveTermRelation K))

/-- The integral pre-Bloch group: only the five-term relations are imposed. -/
abbrev PreBlochGroup := Symbols K ⧸ fiveTermSubgroup K

/-- The class `[x]` in the pre-Bloch group. -/
def preBlochSymbol (x : K) : PreBlochGroup K :=
  QuotientAddGroup.mk' (fiveTermSubgroup K) (symbol K x)

/-- Transport along a field homomorphism. -/
def preBlochMap {E : Type*} [Field E] (f : K →+* E) : PreBlochGroup K →+ PreBlochGroup E :=
  QuotientAddGroup.map (fiveTermSubgroup K) (fiveTermSubgroup E)
    (FreeAbelianGroup.lift fun x => symbol E (f x.1)) (by sorry)

/-- The additive form of the tensor square of units. -/
abbrev UnitTensor := Additive Kˣ ⊗[ℤ] Additive Kˣ

/-- The span of the symmetric tensors `u ⊗ v + v ⊗ u`. -/
def symmetricTensorRelations : Submodule ℤ (UnitTensor K) :=
  Submodule.span ℤ (Set.range (fun uv : Kˣ × Kˣ =>
    Additive.ofMul uv.1 ⊗ₜ[ℤ] Additive.ofMul uv.2 +
      Additive.ofMul uv.2 ⊗ₜ[ℤ] Additive.ofMul uv.1))

/-- The antisymmetric tensor square; it keeps the diagonal `2`-torsion, unlike the exterior
square. -/
abbrev AntisymmetricSquare := UnitTensor K ⧸ symmetricTensorRelations K

/-- The class of `u ⊗ v`. -/
def tensorClass (u v : Kˣ) : AntisymmetricSquare K :=
  (symmetricTensorRelations K).mkQ (Additive.ofMul u ⊗ₜ[ℤ] Additive.ofMul v)

/-- `[x] ↦ x ⊗ (1 - x)` on symbols. -/
def boundaryRaw : Symbols K →+ AntisymmetricSquare K :=
  FreeAbelianGroup.lift (fun x =>
    tensorClass K (Units.mk0 x.val x.prop.1)
      (Units.mk0 (1 - x.val) (by exact sub_ne_zero.mpr (Ne.symm x.prop.2))))

/-- The boundary on the pre-Bloch group. -/
def boundary : PreBlochGroup K →+ AntisymmetricSquare K :=
  QuotientAddGroup.lift (fiveTermSubgroup K) (boundaryRaw K) (by sorry)

/-- The Bloch group: the kernel of the boundary. -/
abbrev BlochGroup := (boundary K).ker

/-- `[x] + [1 - x]` lies in the Bloch group. -/
theorem boundary_complement (x : K) (hx : x ≠ 0 ∧ x ≠ 1) :
    boundary K (preBlochSymbol K x + preBlochSymbol K (1 - x)) = 0 := by sorry

example : symbol ℚ 2 + symbol ℚ (1 / 2) ≠ 0 := by sorry

/-- The five-term expression at `(4, 2)` vanishes in the pre-Bloch group of `ℚ`. -/
example : preBlochSymbol ℚ 4 - preBlochSymbol ℚ 2 + preBlochSymbol ℚ (1 / 2) -
    preBlochSymbol ℚ (3 / 2) + preBlochSymbol ℚ 3 = 0 := by sorry

/-- The diagonal class `(-1) ⊗ (-1)` is nonzero over `ℚ` but killed by `2`. -/
example : tensorClass ℚ (-1) (-1) ≠ 0 ∧ (2 : ℤ) • tensorClass ℚ (-1) (-1) = 0 := by sorry

example : preBlochMap ℚ (algebraMap ℚ ℂ) (preBlochSymbol ℚ 2) = preBlochSymbol ℂ 2 := by sorry

variable (p : ℕ) [Fact p.Prime]

/-- Evaluation of Coleman's dilogarithm on the pre-Bloch group of `ℂ_p`, well defined by the
five-term relation L2.69. -/
def dilogEvaluation (a : ℂ_[p]) : PreBlochGroup ℂ_[p] →+ ℂ_[p] :=
  QuotientAddGroup.lift (fiveTermSubgroup ℂ_[p])
    (FreeAbelianGroup.lift fun x => dilogD (isLogBranch_padicLogBranch a) x.1) (by sorry)

/-- On the Bloch group the evaluation does not depend on the branch. -/
theorem dilogEvaluation_bloch_branch_independent (a b : ℂ_[p]) (z : BlochGroup ℂ_[p]) :
    dilogEvaluation p a z = dilogEvaluation p b z := by sorry

end BlochAlgebra

/-! ### L2.Fb: the projective five-term relation -/

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

theorem crossRatio_finite (a b c d : K) :
    crossRatio K (finitePoint K a) (finitePoint K b) (finitePoint K c) (finitePoint K d) =
      (a - b) * (c - d) / ((a - d) * (c - b)) := by sorry

example : crossRatio ℚ (infinity ℚ) (finitePoint ℚ 0) (finitePoint ℚ 1) (finitePoint ℚ 3) = -2 := by
  sorry

example : detPair ℚ ![2, 4] ![3, 6] = 0 := by sorry

/-- A scalar five-term identity for a function with the two-term laws transfers to every
injective five-tuple of points; no relation in the integral pre-Bloch group is asserted. -/
theorem cyclic_relation_of_scalar {A : Type*} [AddCommGroup A] (f : K → A)
    (hc : ∀ z : K, z ≠ 0 → z ≠ 1 → f (1 - z) = -f z)
    (hi : ∀ z : K, z ≠ 0 → z ≠ 1 → f z⁻¹ = -f z)
    (hf : ∀ x y : K, x ≠ 0 → x ≠ 1 → y ≠ 0 → y ≠ 1 → x ≠ y →
      f x - f y + f (y / x) - f ((1 - x⁻¹) / (1 - y⁻¹)) + f ((1 - x) / (1 - y)) = 0)
    (s : Fin 5 → Point K) (hs : Function.Injective s) :
    ∑ i : Fin 5, f (crossRatio K (s i) (s (i + 1)) (s (i + 2)) (s (i + 3))) = 0 := by sorry

/-- L2.70: the projective five-term relation for Coleman's dilogarithm on `ℙ¹(ℂ_p)`. -/
theorem dilogD_cyclic (p : ℕ) [Fact p.Prime] {a : ℂ_[p]} {L : ℂ_[p] → ℂ_[p]}
    (hL : IsLogBranch p a L) (s : Fin 5 → Point ℂ_[p]) (hs : Function.Injective s) :
    ∑ i : Fin 5, dilogD hL (crossRatio ℂ_[p] (s i) (s (i + 1)) (s (i + 2)) (s (i + 3))) = 0 := by
  sorry

end ProjectiveAlgebra

end TauCetiRoadmap.ColemanIntegration

namespace TauCetiRoadmap.ColemanIntegration

/-! ## Layer L3: positive integer L-values and regulators

The scalar half is stated for an arbitrary measure `μ : D(ℤ_[p], K)` with the given Amice
transform and an arbitrary family `Li` with the properties proved in Layer L2; the p-adic
L-function of DirichletPadicLFunctions enters only through these measures. The regulator half
(syntomic regulators, cyclotomic elements, the p-adic Beilinson conjecture) needs algebraic
K-theory and syntomic cohomology, which are not available at the pins; it is stated in the
README (L3.Fa.1–L3.Fd.2, L3.15, L3.16, L3.36, L3.37), and only the modified polylogarithm
`L^mod_n` of L3.14 is stated here. -/

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

/-! ### The properties of Coleman's polylogarithms used in Layer L3 (proved in Layer L2) -/

/-- The Taylor expansion at `T = 0` of `T ↦ Li_k(w(1 + T))`. -/
def polylogPrimitive (Li : ℕ → K → K) (w : K) (k : ℕ) : PowerSeries K :=
  PowerSeries.mk fun n => iteratedDeriv n (fun t => Li k (w * (1 + t))) 0 / (n.factorial : K)

/-- `Li₀(z) = z/(1 - z)` and `z d/dz Li_k = Li_{k-1}` for `z ≠ 0, 1` (L2.7). -/
def SatisfiesPolylogODE (Li : ℕ → K → K) : Prop :=
  (∀ z : K, z ≠ 1 → Li 0 z = z / (1 - z)) ∧
    ∀ k : ℕ, 1 ≤ k → ∀ z : K, z ≠ 0 → z ≠ 1 → HasDerivAt (Li k) (Li (k - 1) z / z) z

/-- On every residue disc of a point `w` with `‖w‖ ≤ 1`, `‖w - 1‖ = 1`, `Li_k` is one power
series converging on the whole disc (L2.4). -/
def HasResidueDiscExpansions (Li : ℕ → K → K) : Prop :=
  ∀ k : ℕ, ∀ w : K, ‖w‖ ≤ 1 → ‖w - 1‖ = 1 →
    IsOpenDiscSeries (polylogPrimitive Li w k) ∧
      ∀ t : K, ‖t‖ < 1 →
        HasSum (fun n => PowerSeries.coeff n (polylogPrimitive Li w k) * t ^ n) (Li k (w * (1 + t)))

/-- The distribution relation `∑_{ξ ∈ μ_p} Li_k(ξ z) = p^{1-k} Li_k(z^p)` for `z^p ≠ 1` (L2.8). -/
def SatisfiesDistributionRelation (Li : ℕ → K → K) : Prop :=
  ∀ k : ℕ, ∀ z : K, z ^ p ≠ 1 →
    ∑ ξ ∈ Polynomial.nthRootsFinset p (1 : K), Li k (ξ * z) =
      (p : K) ^ ((1 : ℤ) - k) * Li k (z ^ p)

/-- L3.6: if `∂^k F = A_μ` with `F ∈ R⁺`, then
`∫_{ℤ_p^×} x^{-k} dμ = F(0) - p⁻¹ ∑_{ξ ∈ μ_p} F(ξ - 1)`. -/
theorem negMoment_eq_of_primitive (μ : D(ℤ_[p], K)) (k : ℕ) (F : PowerSeries K)
    (hF : IsOpenDiscSeries F) (hder : dop^[k] F = μ.amiceTransform)
    (hμp : (Polynomial.nthRootsFinset p (1 : K)).card = p) :
    μ (unitsZPow (k : ℤ)) =
      evalSeries F 0 - (p : K)⁻¹ *
        ∑ ξ ∈ Polynomial.nthRootsFinset p (1 : K), evalSeries F (ξ - 1) := by
  sorry

/-- L3.7: the negative moments of the geometric measure are modified polylogarithms,
`∫_{ℤ_p^×} x^{-k} dμ_w = Li_k(w) - p^{-k} Li_k(w^p)`. -/
theorem negMoment_geometric (Li : ℕ → K → K) (hODE : SatisfiesPolylogODE Li)
    (hexp : HasResidueDiscExpansions Li) (hdist : SatisfiesDistributionRelation (p := p) Li)
    (hμp : (Polynomial.nthRootsFinset p (1 : K)).card = p)
    (w : K) (hw : ‖w‖ ≤ 1) (hw1 : ‖w - 1‖ = 1) (μ : D(ℤ_[p], K))
    (hμ : μ.amiceTransform = geometricTransform w) (k : ℕ) (hk : 1 ≤ k) :
    μ (unitsZPow (k : ℤ)) = Li k w - (p : K) ^ (-(k : ℤ)) * Li k (w ^ p) := by
  sorry

/-! ### L3.17–L3.23: the pole-cancelled rotated smoothing transform -/

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

/-! ### L3.28: Coleman's formula, in moment form -/

/-- The Amice transform `F_θ` of `μ_θ` (RJW Lemma 5.12). -/
def rjwThetaTransform {N : ℕ} [NeZero N] (θ : DirichletCharacter K N) (ε : K)
    (hε : ε ^ N = 1) : PowerSeries K :=
  -(gaussSum θ⁻¹ (AddChar.zmodChar N hε))⁻¹ •
    ∑ c : (ZMod N)ˣ, θ⁻¹ (c : ZMod N) •
      (PowerSeries.C (ε ^ (c : ZMod N).val) * (1 + PowerSeries.X) - 1)⁻¹

/-- L3.28, tame part `D > 1`: for a measure `μ_θ` with Amice transform `F_θ`,
`∫_{ℤ_p^×} x^{-k} dμ_θ = (1 - θ(p) p^{-k}) G(θ⁻¹)⁻¹ ∑_c θ⁻¹(c) Li_k(ε^c)`. The hypothesis
`hεc` holds exactly when `N` is not a power of `p`. -/
theorem negMoment_muTheta_eq_colemanSum {N : ℕ} [NeZero N] (θ : DirichletCharacter K N)
    (hθ : θ.IsPrimitive) (hθ1 : θ ≠ 1) (ε : K) (hε : IsPrimitiveRoot ε N)
    (hεc : ∀ c : (ZMod N)ˣ, ‖ε ^ (c : ZMod N).val - 1‖ = 1)
    (μ : D(ℤ_[p], K)) (hμ : μ.amiceTransform = rjwThetaTransform θ ε hε.pow_eq_one)
    (Li : ℕ → K → K) (hODE : SatisfiesPolylogODE Li) (hexp : HasResidueDiscExpansions Li)
    (hdist : SatisfiesDistributionRelation (p := p) Li)
    (hμp : (Polynomial.nthRootsFinset p (1 : K)).card = p) (k : ℕ) (hk : 1 ≤ k) :
    μ (unitsZPow (k : ℤ)) =
      (1 - θ (p : ZMod N) * (p : K) ^ (-(k : ℤ))) *
        (gaussSum θ⁻¹ (AddChar.zmodChar N hε.pow_eq_one))⁻¹ *
          ∑ c : (ZMod N)ˣ, θ⁻¹ (c : ZMod N) * Li k (ε ^ (c : ZMod N).val) := by
  sorry

/-! ### L3.13: the complex formula -/

/-- L3.13: `L(θ, k) = G(θ⁻¹)⁻¹ ∑_c θ⁻¹(c) Li_k(e^{2πic/N})` for a primitive character of
conductor `N ≥ 2` and `k ≥ 2`, with the complex polylogarithm of L2.Fa (RJW Theorem 6.7(i)). -/
theorem LFunction_nat_eq_gaussSum_inv_mul_sum_complexPolylog {N : ℕ} [NeZero N]
    (θ : DirichletCharacter ℂ N) (hθ : θ.IsPrimitive) (hN : 2 ≤ N) (k : ℕ) (hk : 2 ≤ k) :
    DirichletCharacter.LFunction θ k =
      (gaussSum θ⁻¹ ZMod.stdAddChar)⁻¹ *
        ∑ c : ZMod N, θ⁻¹ c * complexPolylog k (ZMod.stdAddChar c) := by
  sorry

/-! ### L3.14: the modified polylogarithm of the syntomic regulator -/

section Regulator

variable (Li : ℕ → K → K) (plog : K → K)

/-- `L^mod_n(z) = ∑_{j<n} (B_j/j!) Li_{n-j}(z) log(z)^j`, with Mathlib's `bernoulli`
(`B₁ = -1/2`). -/
def padicRegulatorPolylog (n : ℕ) (z : K) : K :=
  ∑ j ∈ Finset.range n, ((bernoulli j : ℚ) : K) / (j.factorial : K) * Li (n - j) z * plog z ^ j

/-- L3.14: `L^mod_n(z) + (-1)^n L^mod_n(1/z) = 0`, from the inversion relation of `Li` and the
logarithm. -/
theorem padicRegulatorPolylog_inv
    (hinv : ∀ m : ℕ, 1 ≤ m → ∀ z : K, z ≠ 0 → z ≠ 1 →
      Li m z + (-1) ^ m * Li m z⁻¹ = -(plog z ^ m) / (m.factorial : K))
    (hloginv : ∀ z : K, z ≠ 0 → plog z⁻¹ = -plog z)
    (n : ℕ) (hn : 2 ≤ n) (z : K) (hz0 : z ≠ 0) (hz1 : z ≠ 1) :
    padicRegulatorPolylog Li plog n z + (-1) ^ n * padicRegulatorPolylog Li plog n z⁻¹ = 0 := by
  sorry

/-- L3.14: the distribution identity for every positive integer `m`. -/
theorem padicRegulatorPolylog_distribution (m : ℕ) (hm : 1 ≤ m)
    (hdist : ∀ k : ℕ, ∀ z : K, z ^ m ≠ 1 →
      ∑ ξ ∈ Polynomial.nthRootsFinset m (1 : K), Li k (ξ * z) =
        (m : K) ^ ((1 : ℤ) - k) * Li k (z ^ m))
    (hμm : (Polynomial.nthRootsFinset m (1 : K)).card = m)
    (hlogμ : ∀ ξ ∈ Polynomial.nthRootsFinset m (1 : K), ∀ z : K, z ≠ 0 → plog (ξ * z) = plog z)
    (hlogpow : ∀ z : K, z ≠ 0 → plog (z ^ m) = m * plog z)
    (n : ℕ) (hn : 2 ≤ n) (z : K) (hz0 : z ≠ 0) (hzm : z ^ m ≠ 1) :
    padicRegulatorPolylog Li plog n (z ^ m) =
      (m : K) ^ (n - 1) *
        ∑ ξ ∈ Polynomial.nthRootsFinset m (1 : K), padicRegulatorPolylog Li plog n (ξ * z) := by
  sorry

/-- Weight two: `L^mod_2(z) = Li_2(z) - ½ log(z) Li_1(z)`. -/
example (z : K) : padicRegulatorPolylog Li plog 2 z = Li 2 z - 1 / 2 * plog z * Li 1 z := by
  sorry

/-- At a root of unity (where the logarithm vanishes) `L^mod_n = Li_n`. -/
example (n : ℕ) (hn : 1 ≤ n) (ζ : K) (hlog : plog ζ = 0) :
    padicRegulatorPolylog Li plog n ζ = Li n ζ := by
  sorry

/-- Non-example: away from roots of unity `L^mod_2 ≠ Li_2`. -/
example (z : K) (hlog : plog z ≠ 0) (hLi1 : Li 1 z ≠ 0) :
    padicRegulatorPolylog Li plog 2 z ≠ Li 2 z := by
  sorry

end Regulator

end PositiveIntegerValues

/-!
## Targets stated in the README only

These targets need carriers that are not available at the pinned Mathlib and Tau Ceti, or are
heavy constructions whose formalisation is the roadmap's work; their signatures are in README.md.

* Layer L0: the Laurent rings of annuli and their residues (L0.11–L0.12, carriers of
  PadicHodgeTheory P7), the logarithmic function ring of an annulus and its primitives
  (L0.20–L0.23), the geometric-sequence logarithm bounds (L0.24–L0.25).
* Layer L1: good-reduction pairs, wide opens and residue-disc coordinates (L1.1–L1.4), Frobenius
  lifts and Teichmüller points (L1.5–L1.6), existence of Frobenius data and the algebraic de Rham
  comparison (L1.9), Dwork's principle on locally analytic functions (L1.11), local expansions,
  Frobenius on the word algebra and its realisation (L1.14–L1.16), Coleman functions, the
  uniqueness principle and the Coleman integral (L1.17–L1.20), Taylor homotopies, independence of
  the lift and of the branch, analytic pullback (L1.21–L1.24), the punctured lines and their
  Frobenius data, Coleman functions and based primitives (L1.25–L1.32), the four-punctured lines
  (L1.33–L1.42, L1.44), pullback of Coleman functions (L1.43).
* Layer L2: residue-disc and tangential statements (L2.2, L2.4, L2.6, L2.12), the integral
  modified polylogarithm and its expansion (L2.13–L2.14), the reduction of the five-term relation
  to special units and its boundary analysis (L2.19–L2.24, L2.32–L2.68), values in finite
  extensions and expansions at roots of unity (L2.26, L2.28–L2.29).
* Layer L3: the identification of `L_p(θω^{1-k}, k)` with negative moments (L3.1–L3.2, which
  need the p-adic L-function of DirichletPadicLFunctions), the geometric measure itself (L3.3) and
  its Gauss-sum decomposition (L3.4), the locally analytic primitives (L3.5), the smoothed
  measures and the smoothed polylogarithm (L3.19–L3.27), the `L_p` forms of Coleman's formula
  and its comparisons (L3.28–L3.35 in the `L_p` normalisation), the syntomic regulator of
  cyclotomic elements (L3.15), the p-adic Beilinson conjecture (L3.16, L3.36), the regulator form
  of Coleman's formula (L3.37), and the motivic and regulator foundations L3.Fa.1–L3.Fd.2.
-/

end TauCetiRoadmap.ColemanIntegration
