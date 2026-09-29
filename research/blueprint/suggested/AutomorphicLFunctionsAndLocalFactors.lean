/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These statements suggest Lean forms so contributors and reviewers
converge on names and signatures. Every placeholder is intentional; no result
is claimed to be implemented. AL.0 has a compact-open Fourier component here;
the remaining AL.0 targets and AL.2–AL.5 are recorded as gaps in the packet. AL.1 (Tate's thesis)
is sketched in the last section, with checked examples for its normalisations.
-/
import Mathlib.Analysis.Fourier.FourierTransform
import Mathlib.Analysis.Fourier.ZMod
import Mathlib.Topology.LocallyConstant.Basic
import Mathlib.Topology.Algebra.Support
import Mathlib.Topology.Compactness.Compact
import Mathlib.MeasureTheory.Integral.Bochner.Set
import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.Analysis.SpecialFunctions.Gaussian.PoissonSummation
import Mathlib.Analysis.SpecificLimits.Normed
import Mathlib.LinearAlgebra.Matrix.Notation

noncomputable section
open MeasureTheory
open scoped Topology

namespace TauCeti.LocalFourier

variable {R V W : Type*} [CommRing R] [AddCommGroup V] [Module R V]
  [AddCommGroup W] [Module R W]

/-- AL.0/pairing-annihilator: native additive subgroup, not an R-submodule. -/
def pairingAnnihilator (ψ : AddChar R Circle) (L : V →ₗ[R] W →ₗ[R] R)
    (U : AddSubgroup V) : AddSubgroup W := by sorry

/-- AL.0/mem-pairing-annihilator: the public membership API used by the graph. -/
theorem mem_pairingAnnihilator (ψ : AddChar R Circle) (L : V →ₗ[R] W →ₗ[R] R)
    (U : AddSubgroup V) (w : W) :
    w ∈ pairingAnnihilator ψ L U ↔ ∀ v ∈ U, ψ (L v w) = 1 := by sorry

theorem pairingAnnihilator_bot (ψ : AddChar R Circle) (L : V →ₗ[R] W →ₗ[R] R) :
    pairingAnnihilator ψ L ⊥ = ⊤ := by sorry

theorem pairingAnnihilator_zero (ψ : AddChar R Circle) (U : AddSubgroup V) :
    pairingAnnihilator ψ (0 : V →ₗ[R] W →ₗ[R] R) U = ⊤ := by sorry

theorem pairingAnnihilator_antitone (ψ : AddChar R Circle)
    (L : V →ₗ[R] W →ₗ[R] R) : Antitone (pairingAnnihilator ψ L) := by sorry

theorem pairingAnnihilator_comap {W' : Type*} [AddCommGroup W'] [Module R W']
    (ψ : AddChar R Circle) (L : V →ₗ[R] W →ₗ[R] R) (U : AddSubgroup V)
    (T : W' →ₗ[R] W) :
    pairingAnnihilator ψ (LinearMap.compl₂ L T) U =
      (pairingAnnihilator ψ L U).comap T.toAddMonoidHom := by sorry

-- test: TauCeti.LocalFourier.pairingAnnihilator_zmod_two
example : pairingAnnihilator (ZMod.toCircle (N := 2))
    (LinearMap.mul (ZMod 2) (ZMod 2)) ⊤ = ⊥ := by sorry

-- test: TauCeti.LocalFourier.pairingAnnihilator_trivial_character
example (L : V →ₗ[R] W →ₗ[R] R) (U : AddSubgroup V) :
    pairingAnnihilator (1 : AddChar R Circle) L U = ⊤ := by sorry

-- test: TauCeti.LocalFourier.pairingAnnihilator_zmultiples_eq_kernel
example (ψ : AddChar R Circle) :
    pairingAnnihilator ψ (LinearMap.mul R R) (AddSubgroup.zmultiples (1 : R)) =
      ψ.toAddMonoidHom.ker := by sorry

-- test: TauCeti.LocalFourier.pairingAnnihilator_not_real_submodule
example :
    (1 : ℝ) ∈ pairingAnnihilator Real.fourierChar (LinearMap.mul ℝ ℝ)
      (AddSubgroup.zmultiples (1 : ℝ)) ∧
    (1 / 2 : ℝ) ∉ pairingAnnihilator Real.fourierChar (LinearMap.mul ℝ ℝ)
      (AddSubgroup.zmultiples (1 : ℝ)) := by sorry

/-- AL.0/closed-annihilator. -/
theorem isClosed_pairingAnnihilator [TopologicalSpace W]
    (ψ : AddChar R Circle) (L : V →ₗ[R] W →ₗ[R] R) (U : AddSubgroup V)
    (h : ∀ v, Continuous (fun w => ψ (L v w))) :
    IsClosed (pairingAnnihilator ψ L U : Set W) := by sorry

/-- AL.0/open-annihilator. -/
theorem isOpen_pairingAnnihilator [TopologicalSpace V] [TopologicalSpace W]
    (ψ : AddChar R Circle) (L : V →ₗ[R] W →ₗ[R] R) (U : AddSubgroup V)
    (hU : IsCompact (U : Set V))
    (h : IsLocallyConstant (fun p : V × W => ψ (L p.1 p.2))) :
    IsOpen (pairingAnnihilator ψ L U : Set W) := by sorry

section Fourier
variable [MeasurableSpace V]

/-- AL.0/vanishing-from-period: translation covariance is imported from Mathlib. -/
theorem fourierIntegral_eq_zero_of_period [MeasurableAdd V]
    (ψ : AddChar R Circle) (μ : Measure V) [μ.IsAddRightInvariant]
    (L : V →ₗ[R] W →ₗ[R] R) (f : V → ℂ) (u : V) (w : W)
    (hf : ∀ v, f (v + u) = f v) (hw : ψ (L u w) ≠ 1) :
    VectorFourier.fourierIntegral ψ μ L f w = 0 := by sorry

/-- AL.0/fourier-support. This uses ordinary support, before taking closure. -/
theorem support_fourierIntegral_subset [MeasurableAdd V]
    (ψ : AddChar R Circle) (μ : Measure V) [μ.IsAddRightInvariant]
    (L : V →ₗ[R] W →ₗ[R] R) (f : V → ℂ) (U : AddSubgroup V)
    (hf : ∀ u ∈ U, ∀ v, f (v + u) = f v) :
    Function.support (VectorFourier.fourierIntegral ψ μ L f) ⊆
      (pairingAnnihilator ψ L U : Set W) := by sorry

/-- AL.0/indicator-transform. The Bochner integral is the native totalized integral. -/
theorem fourierIntegral_indicator [MeasurableAdd V]
    (ψ : AddChar R Circle) (μ : Measure V) [μ.IsAddRightInvariant]
    (L : V →ₗ[R] W →ₗ[R] R) (U : AddSubgroup V) (hU : MeasurableSet (U : Set V)) :
    VectorFourier.fourierIntegral ψ μ L ((U : Set V).indicator (fun _ => (1 : ℂ))) =
      (pairingAnnihilator ψ L U : Set W).indicator (fun _ => (μ.real U : ℂ)) := by sorry

/-- AL.0/coset-transform: f(v-a), hence the negative phase. -/
theorem fourierIntegral_coset_indicator [MeasurableAdd V]
    (ψ : AddChar R Circle) (μ : Measure V) [μ.IsAddRightInvariant]
    (L : V →ₗ[R] W →ₗ[R] R) (U : AddSubgroup V) (hU : MeasurableSet (U : Set V))
    (a : V) :
    VectorFourier.fourierIntegral ψ μ L
      (fun v => (U : Set V).indicator (fun _ => (1 : ℂ)) (v - a)) =
      fun w => ψ (-L a w) •
        (pairingAnnihilator ψ L U : Set W).indicator (fun _ => (μ.real U : ℂ)) w := by sorry

/-- AL.0/modulation: positive modulation shifts frequency by minus w₀. -/
theorem fourierIntegral_modulation (ψ : AddChar R Circle) (μ : Measure V)
    (L : V →ₗ[R] W →ₗ[R] R) (f : V → ℂ) (w₀ : W) :
    VectorFourier.fourierIntegral ψ μ L (fun v => ψ (L v w₀) • f v) =
      fun w => VectorFourier.fourierIntegral ψ μ L f (w - w₀) := by sorry

/-- AL.0/frequency-periods. -/
theorem fourierIntegral_add_of_support (ψ : AddChar R Circle) (μ : Measure V)
    (L : V →ₗ[R] W →ₗ[R] R) (f : V → ℂ) (U : AddSubgroup V)
    (hf : Function.support f ⊆ (U : Set V)) (a : W)
    (ha : a ∈ pairingAnnihilator ψ L U) (w : W) :
    VectorFourier.fourierIntegral ψ μ L f (w + a) =
      VectorFourier.fourierIntegral ψ μ L f w := by sorry

/-- AL.0/locally-constant-transform. -/
theorem isLocallyConstant_fourierIntegral [TopologicalSpace V] [TopologicalSpace W]
    [IsTopologicalAddGroup W]
    (ψ : AddChar R Circle) (μ : Measure V) (L : V →ₗ[R] W →ₗ[R] R)
    (f : V → ℂ) (U : AddSubgroup V) (hU : IsCompact (U : Set V))
    (h : IsLocallyConstant (fun p : V × W => ψ (L p.1 p.2)))
    (hf : Function.support f ⊆ (U : Set V)) :
    IsLocallyConstant (VectorFourier.fourierIntegral ψ μ L f) := by sorry

/-- AL.0/compact-support-transform: compactness of the annihilator is an explicit input. -/
theorem hasCompactSupport_fourierIntegral [MeasurableAdd V]
    [TopologicalSpace W] [T2Space W]
    (ψ : AddChar R Circle) (μ : Measure V) [μ.IsAddRightInvariant]
    (L : V →ₗ[R] W →ₗ[R] R) (f : V → ℂ) (U : AddSubgroup V)
    (hf : ∀ u ∈ U, ∀ v, f (v + u) = f v)
    (hU : IsCompact (pairingAnnihilator ψ L U : Set W)) :
    HasCompactSupport (VectorFourier.fourierIntegral ψ μ L f) := by sorry

/-- AL.0/indicator-inversion: conditional on dual annihilators and dual measures. -/
theorem fourierIntegral_fourierIntegral_indicator [MeasurableSpace W]
    [MeasurableAdd V] [MeasurableAdd W]
    (ψ : AddChar R Circle) (μ : Measure V) (ν : Measure W)
    [μ.IsAddRightInvariant] [ν.IsAddRightInvariant]
    (L : V →ₗ[R] W →ₗ[R] R) (U : AddSubgroup V)
    (hU : MeasurableSet (U : Set V))
    (hA : MeasurableSet (pairingAnnihilator ψ L U : Set W))
    (hdual : pairingAnnihilator ψ L.flip (pairingAnnihilator ψ L U) = U)
    (hvol : μ.real U * ν.real (pairingAnnihilator ψ L U) = 1) :
    VectorFourier.fourierIntegral ψ ν L.flip
      (VectorFourier.fourierIntegral ψ μ L ((U : Set V).indicator (fun _ => (1 : ℂ)))) =
      fun v => (U : Set V).indicator (fun _ => (1 : ℂ)) (-v) := by sorry

end Fourier

-- acceptance: TauCeti.LocalFourier.indicator_zmod_two_count
example : VectorFourier.fourierIntegral (ZMod.toCircle (N := 2)) Measure.count
    (LinearMap.mul (ZMod 2) (ZMod 2)) (fun _ => (1 : ℂ)) =
    ({0} : Set (ZMod 2)).indicator (fun _ => (2 : ℂ)) := by sorry

-- acceptance: TauCeti.LocalFourier.coset_zmod_four_sign
example : VectorFourier.fourierIntegral (ZMod.toCircle (N := 4)) Measure.count
    (LinearMap.mul (ZMod 4) (ZMod 4))
    (({1} : Set (ZMod 4)).indicator (fun _ => (1 : ℂ))) (1 : ZMod 4) = -Complex.I := by sorry

-- acceptance: TauCeti.LocalFourier.counting_measure_double_transform
example (f : ZMod 2 → ℂ) :
    VectorFourier.fourierIntegral (ZMod.toCircle (N := 2)) Measure.count
      (LinearMap.mul (ZMod 2) (ZMod 2))
      (VectorFourier.fourierIntegral (ZMod.toCircle (N := 2)) Measure.count
        (LinearMap.mul (ZMod 2) (ZMod 2)) f) = fun x => (2 : ℂ) * f (-x) := by sorry

-- acceptance: TauCeti.LocalFourier.modulation_zmod_three
example : VectorFourier.fourierIntegral (ZMod.toCircle (N := 3)) Measure.count
    (LinearMap.mul (ZMod 3) (ZMod 3))
    (fun x => ZMod.toCircle x • (1 : ℂ)) =
    ({1} : Set (ZMod 3)).indicator (fun _ => (3 : ℂ)) := by sorry

end TauCeti.LocalFourier

/-! ## AL.1: Tate zeta integrals (Kudla §§3–5, Tate §§2.4–2.5, 4.2–4.5)

The carriers below (local quasi-characters, S(F), S′(ω), ideles) are planned in the packet and in its
suppliers; the declarations are sketched, not elaborated.

```
-- AL.1/local-zeta-integral
def zetaIntegral (ω : QuasiChar F) (s : ℂ) (f : LocalSpace F) : ℂ :=
  ∫ x : Fˣ, f x * ω x * ‖(x : F)‖ ^ s ∂mulHaar
theorem differentiableOn_zetaIntegral (ω) (f) (hω : ω.IsUnitary) :
    DifferentiableOn ℂ (zetaIntegral ω · f) {s | 0 < s.re}
-- AL.1/unramified-local-theory
theorem zetaIntegral_eq_L_mul_normalized (hω : ω.IsUnramified) (hs : 0 < s.re) :
    zetaIntegral ω s f = (1 - ω ϖ * q ^ (-s))⁻¹ * normalizedZeta ω s f
-- AL.1/local-uniqueness-theorem
theorem finrank_eigenSpace_eq_one (ω : QuasiChar F) : Module.finrank ℂ (eigenSpace ω) = 1
-- AL.1/local-functional-equation
theorem zetaIntegral_fourier_one_sub (ψ) (ω) (f) :
    zetaIntegral ω⁻¹ (1 - s) (𝓕[ψ] f) = gammaFactor s ω ψ * zetaIntegral ω s f
-- AL.1/tate-global-functional-equation
theorem globalZeta_functional_equation (f : AdelicSpace k) (c : QuasiChar (IdeleClassGroup k)) :
    globalZeta f c = globalZeta (𝓕 f) (c.dual)
-- AL.1/hecke-l-functional-equation
theorem completedHeckeL_one_sub (ω : HeckeChar k) (s : ℂ) :
    completedHeckeL ω s = globalEpsilon ω s * completedHeckeL ω⁻¹ (1 - s)
```
-/

namespace TauCeti.TateZeta.SuggestedTest

set_option autoImplicit false

open Complex Real

/-- `AL.1/unramified-local-theory`: the unramified factor. `z(s, ω; 1_O) = Σ_{n ≥ 0} (t q^{-s})^n`
sums to `L(s, ω) = (1 - t q^{-s})⁻¹` when `‖t q^{-s}‖ < 1`. -/
example (ξ : ℂ) (h : ‖ξ‖ < 1) : ∑' n : ℕ, ξ ^ n = (1 - ξ)⁻¹ :=
  tsum_geometric_of_norm_lt_one h

/-- `AL.1/invariant-distributions-exceptional-case` (3.14): `x ↦ [[1, -ord x], [0, 1]]` is a
representation of the value group, in the basis `(δ₀, λ₀)`. -/
example (a b : ℤ) :
    !![(1 : ℤ), -(a + b); 0, 1] = !![(1 : ℤ), -a; 0, 1] * !![(1 : ℤ), -b; 0, 1] := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]

/-- `AL.1/archimedean-local-theory` (3.21): Kudla's complex factor `(2π)^{1-s}Γ(s)` is `π · Γ_ℂ(s)`
for Deligne's `Γ_ℂ(s) = 2(2π)^{-s}Γ(s)`. -/
example (s : ℂ) : (2 * π : ℂ) ^ (1 - s) * Gamma s = π * Gammaℂ s := by
  have h2 : (2 * π : ℂ) ≠ 0 := by
    have : (π : ℂ) ≠ 0 := ofReal_ne_zero.mpr Real.pi_ne_zero
    exact mul_ne_zero two_ne_zero this
  rw [Gammaℂ_def, cpow_sub _ _ h2, cpow_one, cpow_neg]
  field_simp

/-- `AL.1/local-epsilon-gamma-factors`: Tate's real `ρ(|·|^s) = Γ_ℝ(s)/Γ_ℝ(1-s) = Γ_ℂ(s) cos(πs/2)`,
the reciprocal of `γ(s, 1, e)`. -/
example (s : ℂ) (hs : ∀ n : ℕ, s ≠ -(2 * n + 1)) :
    Gammaℝ s / Gammaℝ (1 - s) = Gammaℂ s * cos (π * s / 2) :=
  Gammaℝ_div_Gammaℝ_one_sub hs

/-- `AL.0/adelic-poisson-summation` for `k = ℚ`, `f = 1_Ẑ ⊗ e^{-πx²}`: Jacobi's theta relation. -/
example (a : ℝ) (ha : 0 < a) :
    ∑' n : ℤ, Real.exp (-Real.pi * a * (n : ℝ) ^ 2) =
      1 / a ^ (1 / 2 : ℝ) * ∑' n : ℤ, Real.exp (-Real.pi / a * (n : ℝ) ^ 2) :=
  Real.tsum_exp_neg_mul_int_sq ha

/-- `AL.1/tate-global-functional-equation` for `k = ℚ`, `κ = 1`, `f(0) = f̂(0) = 1`: the bracket
`κ f̂(0)/(s - 1) - κ f(0)/s` and the functional equation `ζ(f, c) = ζ(f̂, ĉ)`. -/
example (s : ℂ) :
    completedRiemannZeta s = completedRiemannZeta₀ s - 1 / s - 1 / (1 - s) ∧
      completedRiemannZeta (1 - s) = completedRiemannZeta s :=
  ⟨completedRiemannZeta_eq s, completedRiemannZeta_one_sub s⟩

/-- `AL.1/idele-class-volume` for `k = ℚ`: `r₁ = 1`, `r₂ = 0`, `h = R = 1`, `w = 2`, `|d| = 1`
give `κ = 2^{r₁}(2π)^{r₂}hR/(w√|d|) = 1`. -/
example : (2 : ℝ) ^ 1 * (2 * Real.pi) ^ 0 * 1 * 1 / (2 * Real.sqrt 1) = 1 := by
  norm_num

/-- `AL.1/local-gauss-sum`, `c = 1`, `ν = 0` over `ℚ_p`: `𝔤 = p^{-1/2} g` and `|g|² = p` give
`|𝔤|² = 1`. -/
example (p : ℝ) (hp : 0 < p) (g : ℝ) (hg : g ^ 2 = p) : (p ^ (-(1 / 2 : ℝ)) * g) ^ 2 = 1 := by
  rw [mul_pow, hg, ← Real.rpow_natCast, ← Real.rpow_mul hp.le]
  norm_num
  rw [Real.rpow_neg_one]
  field_simp

/-- `AL.1/hecke-l-functional-equation`, Kudla's exercise for `ℚ(√5)`: `ε ≡ 3 (mod √5)` in
`O/(√5) ≅ 𝔽₅`, `3` has order 4, and `-ε² ≡ 1`. -/
example : (3 : ZMod 5) ^ 4 = 1 ∧ (3 : ZMod 5) ^ 2 ≠ 1 ∧ -(3 : ZMod 5) ^ 2 = 1 := by decide

end TauCeti.TateZeta.SuggestedTest
