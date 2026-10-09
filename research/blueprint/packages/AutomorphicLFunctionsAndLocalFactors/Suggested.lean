/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These statements suggest Lean forms so contributors and reviewers
converge on names and signatures. Proof placeholders claim no implementation.

The formula interfaces below use existing native carriers. A representation,
 completion or quotient whose supplier has not supplied a Lean carrier cannot
 yet have its full signature. The final named omission manifest gives the exact
 affected declarations and mathematical conditions; no missing condition is
 replaced by a Prop-valued dummy object. Formula specializations do not assert
 the representation-theoretic construction or analytic continuation theorem.
-/
import Mathlib.Analysis.Fourier.FourierTransform
import Mathlib.Analysis.Fourier.ZMod
import Mathlib.Topology.LocallyConstant.Basic
import Mathlib.Topology.Algebra.Support
import Mathlib.Topology.Compactness.Compact
import Mathlib.Topology.UniformSpace.UniformConvergence
import Mathlib.MeasureTheory.Integral.Bochner.Set
import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.Analysis.SpecialFunctions.Gaussian.PoissonSummation
import Mathlib.Analysis.SpecificLimits.Normed
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.Matrix.Charpoly.Coeff
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.Analysis.Distribution.SchwartzSpace.Basic
import Mathlib.Analysis.Distribution.TemperedDistribution
import Mathlib.Analysis.SpecialFunctions.Complex.Log
import Mathlib.Topology.Algebra.PontryaginDual
import Mathlib.NumberTheory.LSeries.Basic
import Mathlib.Analysis.Calculus.IteratedDeriv.Defs
import Mathlib.Analysis.Meromorphic.Order
import Mathlib.Analysis.Meromorphic.Divisor

noncomputable section
open MeasureTheory
open scoped Topology NNReal ENNReal

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

set_option autoImplicit false

namespace TauCeti.SchwartzBruhat

/-- Archimedean specialization; the nonarchimedean SR.1 carrier is not yet available. -/
abbrev LocalSpace (F : Type*) [NormedAddCommGroup F] [NormedSpace ℝ F] :=
  SchwartzMap F ℂ
abbrev LocalSpace.Dual (F : Type*) [NormedAddCommGroup F] [NormedSpace ℝ F] :=
  TemperedDistribution F ℂ
/-- Evaluation at zero is the existing native Dirac distribution. -/
abbrev LocalSpace.delta (F : Type*) [NormedAddCommGroup F] [NormedSpace ℝ F] :
    LocalSpace.Dual F := TemperedDistribution.delta (0 : F)

end TauCeti.SchwartzBruhat

namespace TauCeti.AutomorphicLFunctions.AL0

/-- Positive Fourier kernel, compared to the native negative kernel by reflection. -/
def PartialFourierTransform {X V W R : Type*} [MeasurableSpace V]
    [CommRing R] [AddCommGroup V] [Module R V] [AddCommGroup W] [Module R W]
    (ψ : AddChar R Circle) (μ : Measure V) (B : V →ₗ[R] W →ₗ[R] R)
    (Φ : X × V → ℂ) (x : X) (w : W) : ℂ :=
  VectorFourier.fourierIntegral ψ μ B (fun v => Φ (x,v)) (-w)

theorem PartialFourierTransform.negative_kernel {X V W R : Type*} [MeasurableSpace V]
    [CommRing R] [AddCommGroup V] [Module R V] [AddCommGroup W] [Module R W]
    (ψ : AddChar R Circle) (μ : Measure V) (B : V →ₗ[R] W →ₗ[R] R)
    (Φ : X × V → ℂ) (x : X) (w : W) :
    PartialFourierTransform ψ μ B Φ x w =
      VectorFourier.fourierIntegral ψ μ B (fun v => Φ (x,v)) (-w) := by sorry

theorem PartialFourierTransform.product {X V W R : Type*} [MeasurableSpace V]
    [CommRing R] [AddCommGroup V] [Module R V] [AddCommGroup W] [Module R W]
    (ψ : AddChar R Circle) (μ : Measure V) (B : V →ₗ[R] W →ₗ[R] R)
    (f : X → ℂ) (g : V → ℂ) (x : X) (w : W) :
    PartialFourierTransform ψ μ B (fun p => f p.1 * g p.2) x w =
      f x * VectorFourier.fourierIntegral ψ μ B g (-w) := by sorry

-- TauCeti.AutomorphicLFunctions.AL0.PartialFourierTransform.zero_v_space
example (f : ℝ → ℂ) (x : ℝ) :
    PartialFourierTransform Real.fourierChar (Measure.dirac (0 : Fin 0 → ℝ))
      (0 : (Fin 0 → ℝ) →ₗ[ℝ] (Fin 0 → ℝ) →ₗ[ℝ] ℝ)
      (fun p => f p.1) x 0 = f x := by sorry

/-- Trace pullback. At infinity T is id on ℝ and z ↦ 2 Re z on ℂ.
    The finite standard rational character is a supplier obligation. -/
def StandardAdditiveCharacter {F R : Type*} [AddMonoid F] [AddMonoid R]
    (ψ : AddChar R Circle) (T : F →+ R) : AddChar F Circle :=
  ψ.compAddMonoidHom T

theorem StandardAdditiveCharacter.trace {F R : Type*} [AddMonoid F] [AddMonoid R]
    (ψ : AddChar R Circle) (T : F →+ R) (x : F) :
    StandardAdditiveCharacter ψ T x = ψ (T x) := by sorry

-- TauCeti.AutomorphicLFunctions.AL0.StandardAdditiveCharacter.real_one
example : Real.fourierChar (1 : ℝ) = 1 ∧
    Real.fourierChar (1/2 : ℝ) = -1 := by sorry
-- TauCeti.AutomorphicLFunctions.AL0.StandardAdditiveCharacter.complex_imaginary
example : Real.fourierChar (2 * Complex.I.re) = 1 := by sorry

/-- Normalization from an additive Haar μ₀ with μ₀(O)=1, at a finite place. -/
def SelfDualHaar {F : Type*} [MeasurableSpace F] (μ₀ : Measure F)
    (q : ℝ) (d : ℕ) : Measure F := ENNReal.ofReal (q ^ (-(d : ℝ)/2)) • μ₀

theorem SelfDualHaar.unit_volume {F : Type*} [MeasurableSpace F]
    (μ₀ : Measure F) (O : Set F) (q : ℝ) (d : ℕ) (h : μ₀ O = 1) :
    SelfDualHaar μ₀ q d O = ENNReal.ofReal (q ^ (-(d : ℝ)/2)) := by sorry
-- TauCeti.AutomorphicLFunctions.AL0.SelfDualHaar.unramified
example {F : Type*} [MeasurableSpace F] (μ₀ : Measure F) (q : ℝ) :
    SelfDualHaar μ₀ q 0 = μ₀ := by sorry
-- TauCeti.AutomorphicLFunctions.AL0.SelfDualHaar.different_two
example {F : Type*} [MeasurableSpace F] (μ₀ : Measure F) (q : ℝ) (hq : 0 < q) :
    SelfDualHaar μ₀ q 2 = ENNReal.ofReal q⁻¹ • μ₀ := by sorry
-- TauCeti.AutomorphicLFunctions.AL0.SelfDualHaar.scaled_character
example {F : Type*} [MeasurableSpace F] (μ₀ : Measure F)
    (q : ℝ) (hq : 0 < q) (d : ℕ) :
    SelfDualHaar μ₀ q (d+1) =
      ENNReal.ofReal (q ^ (-1/2 : ℝ)) • SelfDualHaar μ₀ q d := by sorry
-- TauCeti.AutomorphicLFunctions.AL0.SelfDualHaar.complex_trace
example : (∫ z : ℂ, Complex.exp (-2*Real.pi*(‖z‖ : ℂ)^2)) = (1/2 : ℂ) := by sorry

/-- Algebraic part of the native Pontryagin map; continuity requires continuous ψ. -/
def AdditiveDualityMap {F : Type*} [CommRing F] (ψ : AddChar F Circle)
    (y : F) : AddChar F Circle :=
  ψ.compAddMonoidHom ((LinearMap.mul F F).flip y).toAddMonoidHom

theorem AdditiveDualityMap.apply {F : Type*} [CommRing F]
    (ψ : AddChar F Circle) (x y : F) : AdditiveDualityMap ψ y x = ψ (x*y) := by sorry

theorem AdditiveDualityMap.add {F : Type*} [CommRing F]
    (ψ : AddChar F Circle) (y z : F) :
    AdditiveDualityMap ψ (y+z) = AdditiveDualityMap ψ y * AdditiveDualityMap ψ z := by sorry

theorem AdditiveDualityMap.scale_character {F : Type*} [CommRing F]
    (ψ : AddChar F Circle) (a y : F) :
    AdditiveDualityMap (AdditiveDualityMap ψ a) y = AdditiveDualityMap ψ (a*y) := by sorry

-- TauCeti.AutomorphicLFunctions.AL0.AdditiveDualityMap.zero
example {F : Type*} [CommRing F] (ψ : AddChar F Circle) :
    AdditiveDualityMap ψ 0 = 1 := by sorry
-- TauCeti.AutomorphicLFunctions.AL0.AdditiveDualityMap.real_half
example : AdditiveDualityMap Real.fourierChar (1/2 : ℝ) 1 = -1 := by sorry
-- TauCeti.AutomorphicLFunctions.AL0.AdditiveDualityMap.finite_field_two
example : Function.Injective (AdditiveDualityMap (ZMod.toCircle (N := 2))) := by sorry
-- TauCeti.AutomorphicLFunctions.AL0.AdditiveDualityMap.trivial_character
example {F : Type*} [CommRing F] (y : F) :
    AdditiveDualityMap (1 : AddChar F Circle) y = 1 := by sorry

/-- The order variable is complex; the argument is positive real in the public API. -/
def BesselK (ν : ℂ) (c : ℝ) : ℂ :=
  (1/2 : ℂ) * ∫ u : ℝ in Set.Ioi 0,
    Complex.exp (-(c : ℂ) * ((u : ℂ) + (u : ℂ)⁻¹)/2) *
      Complex.exp (ν * (Real.log u : ℂ)) / (u : ℂ)

theorem BesselK.integral (ν : ℂ) (c : ℝ) :
    BesselK ν c = (1/2 : ℂ) * ∫ u : ℝ in Set.Ioi 0,
      Complex.exp (-(c : ℂ) * ((u : ℂ)+(u : ℂ)⁻¹)/2) *
        Complex.exp (ν*(Real.log u : ℂ)) / (u : ℂ) := by sorry

theorem BesselK.even (ν : ℂ) {c : ℝ} (hc : 0 < c) :
    BesselK (-ν) c = BesselK ν c := by sorry

theorem BesselK.entire_order {c : ℝ} (hc : 0 < c) :
    Differentiable ℂ (fun ν => BesselK ν c) := by sorry

theorem BesselK.half {c : ℝ} (hc : 0 < c) :
    BesselK (1/2) c = (Real.sqrt (Real.pi/(2*c))*Real.exp (-c) : ℝ) := by sorry

-- TauCeti.AutomorphicLFunctions.AL0.BesselK.half_at_one
example : BesselK (1/2) 1 = (Real.sqrt (Real.pi/2)/Real.exp 1 : ℝ) := by sorry
-- TauCeti.AutomorphicLFunctions.AL0.BesselK.negative_half
example : BesselK (-1/2) 2 = BesselK (1/2) 2 ∧
    BesselK (1/2) 2 = (Real.sqrt (Real.pi/4)*Real.exp (-2) : ℝ) := by sorry
-- TauCeti.AutomorphicLFunctions.AL0.BesselK.zero_order_positive
example {c : ℝ} (hc : 0 < c) : 0 < (BesselK 0 c).re := by sorry
-- TauCeti.AutomorphicLFunctions.AL0.BesselK.not_even_in_argument
example : ¬ IntegrableOn (fun u : ℝ => (u : ℂ)⁻¹) (Set.Ioi 0) := by sorry

/-- Real exponential integral Ei(-r), only r>0 is used. -/
def negativeEi (r : ℝ) : ℝ := -(∫ t : ℝ in Set.Ioi r, Real.exp (-t)/t)

theorem BesselHalfOrderDerivative {c : ℝ} (hc : 0 < c) :
    deriv (fun ν : ℂ => BesselK ν c) (1/2) =
      (-(Real.sqrt (Real.pi/2)*Real.exp c*c^(-1/2 : ℝ)*negativeEi (2*c)) : ℝ) := by sorry

end TauCeti.AutomorphicLFunctions.AL0

namespace TauCeti.TateZeta

abbrev QuasiChar (F : Type*) [Field F] [TopologicalSpace F] := Fˣ →ₜ* ℂˣ

/-- The radius homomorphism must be the normalized local absolute value. -/
def QuasiChar.absPow {F : Type*} [Field F] [TopologicalSpace F]
    (a : Fˣ →ₜ* ℝˣ) (ha : ∀ g, 0 < (a g : ℝ)) (s : ℂ) : QuasiChar F := by sorry

/-- Norm-positive formulas on the native measurable multiplicative carrier. -/
def zetaIntegral {G : Type*} [MeasurableSpace G]
    (μ : Measure G) (a : G → ℝ) (ω : G → ℂ) (s : ℂ) (f : G → ℂ) : ℂ :=
  ∫ x, f x * ω x * (a x : ℂ)^s ∂μ

theorem zetaIntegral_measure_scale {G : Type*} [MeasurableSpace G]
    (μ : Measure G) (a : G → ℝ) (ω f : G → ℂ) (s : ℂ) (c : ℝ≥0) :
    zetaIntegral ((c : ℝ≥0∞) • μ) a ω s f =
      (c : ℂ) * zetaIntegral μ a ω s f := by sorry

-- TauCeti.TateZeta.zetaIntegral_normalized_measure_scale
example {G : Type*} [MeasurableSpace G] (μ : Measure G)
    (a : G → ℝ) (ω f : G → ℂ) (s L : ℂ) :
    zetaIntegral ((2 : ℝ≥0∞) • μ) a ω s f / L =
      2 * (zetaIntegral μ a ω s f / L) := by sorry

theorem zetaIntegral_twist {G : Type*} [MeasurableSpace G]
    (μ : Measure G) (a : G → ℝ) (ha : ∀ x, 0 < a x)
    (ω f : G → ℂ) (s t : ℂ) :
    zetaIntegral μ a (fun x => ω x*(a x : ℂ)^t) s f =
      zetaIntegral μ a ω (s+t) f := by sorry

/-- The algebraic eigenspace construction specializes to the finite-place dual;
    the infinite-place continuous-dual restriction is specified in the manifest. -/
def eigenSpace {G V : Type*} [Group G] [AddCommGroup V] [Module ℂ V]
    (ρ : G →* Module.End ℂ V) (ω : G →* ℂˣ) : Submodule ℂ (V →ₗ[ℂ] ℂ) := by sorry

theorem mem_eigenSpace {G V : Type*} [Group G] [AddCommGroup V] [Module ℂ V]
    (ρ : G →* Module.End ℂ V) (ω : G →* ℂˣ) (ℓ : V →ₗ[ℂ] ℂ) :
    ℓ ∈ eigenSpace ρ ω ↔ ∀ a v, ℓ (ρ a⁻¹ v) = (ω a : ℂ)*ℓ v := by sorry

/-- Kernel of restriction to the punctured test subspace. -/
def eigenSpaceZero {G V : Type*} [Group G] [AddCommGroup V] [Module ℂ V]
    (ρ : G →* Module.End ℂ V) (ω : G →* ℂˣ) (U : Submodule ℂ V) :
    Submodule ℂ (V →ₗ[ℂ] ℂ) := by sorry

/-- Scalar recovered from a standard test f₀ on which z₀(f₀)=1.
    Existence/uniqueness of the distributions is not encoded as a dummy field. -/
def epsilonFactor {V : Type*} [AddCommGroup V] [Module ℂ V]
    (F : V →ₗ[ℂ] V) (zDual : V →ₗ[ℂ] ℂ) (f₀ : V)
    (h : zDual (F f₀) ≠ 0) : ℂˣ := Units.mk0 (zDual (F f₀)) h

def gammaFactor (ε L Ldual : ℂ → ℂ) (s : ℂ) : ℂ := ε s * Ldual (1-s)/L s

theorem epsilonFactor_eq_standard {V : Type*} [AddCommGroup V] [Module ℂ V]
    (F : V →ₗ[ℂ] V) (zDual : V →ₗ[ℂ] ℂ) (f₀ : V) (h : zDual (F f₀) ≠ 0) :
    (epsilonFactor F zDual f₀ h : ℂ) = zDual (F f₀) := by sorry

/-- The finite-place additive Haar normalization and conductor inputs are explicit. -/
def localGaussSum {F : Type*} [Field F] [MeasurableSpace F]
    (μ : Measure F) (U : Set F) (q : ℝ) (ν : ℤ) (c : ℕ)
    (ϖ : Fˣ) (ω : F → ℂ) (ψ : AddChar F Circle) : ℂ :=
  (q : ℂ)^(((ν : ℂ)+(c : ℂ))/2) *
    ∫ y in U, (ω y)⁻¹ * (ψ (((ϖ : F)^(-ν-(c : ℤ)))*y) : ℂ) ∂μ

/-- Global formula on the supplied measurable idele carrier. -/
def globalZetaIntegral {G : Type*} [MeasurableSpace G]
    (μ : Measure G) (a : G → ℝ) (ω : G → ℂ) (s : ℂ) (f : G → ℂ) : ℂ :=
  zetaIntegral μ a ω s f

-- TauCeti.TateZeta.globalZetaIntegral_zero
example {G : Type*} [MeasurableSpace G] (μ : Measure G)
    (a : G → ℝ) (ω : G → ℂ) (s : ℂ) :
    globalZetaIntegral μ a ω s (fun _ => 0) = 0 := by sorry

/-- Product identity on the absolute-convergence half-plane only. Its continued
    function requires the AA.0/AA.2 and global Tate supplier types. -/
def completedHeckeL {ι : Type*} (L : ι → ℂ → ℂ) (s : ℂ) : ℂ := ∏' v, L v s

def partialHeckeL {ι : Type*} (S : Set ι) (L : ι → ℂ → ℂ) (s : ℂ) : ℂ :=
  ∏' v : {v // v ∉ S}, L v.1 s

/-- Global epsilon as its finite product, with the exceptional places supplied. -/
def globalEpsilon {ι : Type*} (S : Finset ι) (ε : ι → ℂ → ℂ) (s : ℂ) : ℂ :=
  ∏ v ∈ S, ε v s

theorem norm_globalEpsilon_half {ι : Type*} (S : Finset ι) (ε : ι → ℂ → ℂ)
    (h : ∀ v ∈ S, ‖ε v (1/2)‖ = 1) : ‖globalEpsilon S ε (1/2)‖ = 1 := by sorry

end TauCeti.TateZeta

namespace TauCeti.AutomorphicLFunctions.AL1

/-- Numeric Weil-constituent data, not a substitute for AF.1's parameter carrier. -/
inductive GammaBranch where
  | real (a : Fin 2) (t : ℂ)
  | complex (κ : ℤ) (t : ℂ)
  | discreteSeries (k : {k : ℕ // 2 ≤ k}) (t : ℂ)

def gammaBranch (b : GammaBranch) (s : ℂ) : ℂ := match b with
  | .real a t => Complex.Gammaℝ (s+t+(a.val : ℂ))
  | .complex κ t => Complex.Gammaℂ (s+t+(κ.natAbs : ℂ)/2)
  | .discreteSeries k t => Complex.Gammaℂ (s+t+((k.val : ℂ)-1)/2)

def CanonicalArchimedeanFactor (bs : List GammaBranch) (s : ℂ) : ℂ :=
  (bs.map (fun b => gammaBranch b s)).prod

theorem CanonicalArchimedeanFactor.real (a : Fin 2) (t s : ℂ) :
    CanonicalArchimedeanFactor [.real a t] s = Complex.Gammaℝ (s+t+(a.val : ℂ)) := by sorry

theorem CanonicalArchimedeanFactor.complex (κ : ℤ) (t s : ℂ) :
    CanonicalArchimedeanFactor [.complex κ t] s =
      Complex.Gammaℂ (s+t+(κ.natAbs : ℂ)/2) := by sorry

theorem CanonicalArchimedeanFactor.discrete_series (k : {k : ℕ // 2 ≤ k}) (t s : ℂ) :
    CanonicalArchimedeanFactor [.discreteSeries k t] s =
      Complex.Gammaℂ (s+t+((k.val : ℂ)-1)/2) := by sorry

theorem CanonicalArchimedeanFactor.direct_sum (bs cs : List GammaBranch) (s : ℂ) :
    CanonicalArchimedeanFactor (bs++cs) s =
      CanonicalArchimedeanFactor bs s * CanonicalArchimedeanFactor cs s := by sorry

-- TauCeti.AutomorphicLFunctions.AL1.CanonicalArchimedeanFactor.real_trivial
example (s : ℂ) : CanonicalArchimedeanFactor [.real 0 0] s = Complex.Gammaℝ s := by sorry
-- TauCeti.AutomorphicLFunctions.AL1.CanonicalArchimedeanFactor.complex_negative_weight
example (s : ℂ) : CanonicalArchimedeanFactor [.complex (-3) 0] s =
    Complex.Gammaℂ (s+3/2) ∧ CanonicalArchimedeanFactor [.complex (-3) 0] s =
      CanonicalArchimedeanFactor [.complex 3 0] s := by sorry
-- TauCeti.AutomorphicLFunctions.AL1.CanonicalArchimedeanFactor.weight_two
example (s : ℂ) : CanonicalArchimedeanFactor [.discreteSeries ⟨2, by decide⟩ 0] s =
    Complex.Gammaℂ (s+1/2) := by sorry
-- TauCeti.AutomorphicLFunctions.AL1.CanonicalArchimedeanFactor.kudla_conversion
example (s : ℂ) : (2*Real.pi : ℂ)^(1-s)*Complex.Gamma s =
    Real.pi*CanonicalArchimedeanFactor [.complex 0 0] s := by sorry

end TauCeti.AutomorphicLFunctions.AL1

namespace TauCeti.AutomorphicLFunctions.AL2

/-- Formula on GLₙ supplied as a measurable carrier G, with its matrix inclusion
    and normalized determinant absolute value. Representation conditions are omitted. -/
def GodementJacquetIntegral {G : Type*} [MeasurableSpace G] (n : ℕ)
    (μ : Measure G) (β Φ : G → ℂ) (absDet : G → ℝ) (s : ℂ) : ℂ :=
  ∫ g, β g * Φ g * (absDet g : ℂ)^(s+((n : ℂ)-1)/2) ∂μ

theorem GodementJacquetIntegral.integral {G : Type*} [MeasurableSpace G] (n : ℕ)
    (μ : Measure G) (β Φ : G → ℂ) (absDet : G → ℝ) (s : ℂ) :
    GodementJacquetIntegral n μ β Φ absDet s =
      ∫ g, β g*Φ g*(absDet g : ℂ)^(s+((n : ℂ)-1)/2) ∂μ := by sorry

theorem GodementJacquetIntegral.twist {G : Type*} [MeasurableSpace G] (n : ℕ)
    (μ : Measure G) (β Φ : G → ℂ) (absDet : G → ℝ)
    (h : ∀ g, 0 < absDet g) (s t : ℂ) :
    GodementJacquetIntegral n μ (fun g => β g*(absDet g : ℂ)^t) Φ absDet s =
      GodementJacquetIntegral n μ β Φ absDet (s+t) := by sorry

-- TauCeti.AutomorphicLFunctions.AL2.GodementJacquetIntegral.rank_one
example {G : Type*} [MeasurableSpace G] (μ : Measure G) (β Φ : G → ℂ)
    (absDet : G → ℝ) (s : ℂ) :
    GodementJacquetIntegral 1 μ β Φ absDet s =
      TauCeti.TateZeta.zetaIntegral μ absDet β s Φ := by sorry
-- TauCeti.AutomorphicLFunctions.AL2.GodementJacquetIntegral.rank_two_shift
example {G : Type*} [MeasurableSpace G] (μ : Measure G) (β Φ : G → ℂ)
    (absDet : G → ℝ) (s : ℂ) :
    GodementJacquetIntegral 2 μ β Φ absDet s =
      ∫ g, β g * Φ g * (absDet g : ℂ)^(s+1/2) ∂μ := by sorry
-- TauCeti.AutomorphicLFunctions.AL2.GodementJacquetIntegral.zero_test
example {G : Type*} [MeasurableSpace G] (n : ℕ) (μ : Measure G)
    (β : G → ℂ) (absDet : G → ℝ) (s : ℂ) :
    GodementJacquetIntegral n μ β (fun _ => 0) absDet s = 0 := by sorry
-- TauCeti.AutomorphicLFunctions.AL2.GodementJacquetIntegral.haar_scale
example {G : Type*} [MeasurableSpace G] (n : ℕ) (μ : Measure G)
    (β Φ : G → ℂ) (absDet : G → ℝ) (s : ℂ) (c : ℝ≥0) :
    GodementJacquetIntegral n ((c : ℝ≥0∞) • μ) β Φ absDet s =
      (c : ℂ)*GodementJacquetIntegral n μ β Φ absDet s := by sorry

/-- Evaluation once the finite-place principal-ideal theorem supplies P, P(0)=1.
    The infinity branch is CanonicalArchimedeanFactor; it is not a polynomial gcd. -/
def StandardLocalLFactor (P : Polynomial ℂ) (q : ℝ) (s : ℂ) : ℂ :=
  (P.eval ((q : ℂ)^(-s)))⁻¹

/-- Constant term of the unramified polynomial; the general generator
    normalization remains in the named omission manifest. -/
theorem StandardLocalLFactor.unramified_polynomial_constant {ι : Type*} [Fintype ι]
    (α : ι → ℂ) :
    (∏ i, (1-Polynomial.C (α i)*Polynomial.X)).eval 0 = 1 := by sorry

theorem StandardLocalLFactor.unramified {ι : Type*} [Fintype ι]
    (α : ι → ℂ) (q : ℝ) (s : ℂ) :
    StandardLocalLFactor (∏ i, (1-Polynomial.C (α i)*Polynomial.X)) q s =
      ∏ i, (1-α i*(q : ℂ)^(-s))⁻¹ := by sorry

theorem StandardLocalLFactor.twist (P : Polynomial ℂ) (q : ℝ) (hq : 0 < q)
    (s t : ℂ) : StandardLocalLFactor
      (P.comp (Polynomial.C ((q : ℂ)^(-t))*Polynomial.X)) q s =
    StandardLocalLFactor P q (s+t) := by sorry

-- TauCeti.AutomorphicLFunctions.AL2.StandardLocalLFactor.trivial_gl1
example (q : ℝ) (s : ℂ) : StandardLocalLFactor (1-Polynomial.X) q s =
    (1-(q : ℂ)^(-s))⁻¹ := by sorry
-- TauCeti.AutomorphicLFunctions.AL2.StandardLocalLFactor.ramified_gl1
example (q : ℝ) (s : ℂ) : StandardLocalLFactor 1 q s = 1 := by sorry
-- TauCeti.AutomorphicLFunctions.AL2.StandardLocalLFactor.real_sign
example (s : ℂ) : TauCeti.AutomorphicLFunctions.AL1.CanonicalArchimedeanFactor
    [.real 1 0] s = Complex.Gammaℝ (s+1) := by sorry
-- TauCeti.AutomorphicLFunctions.AL2.StandardLocalLFactor.complex_angular
example (κ : ℤ) (t s : ℂ) : TauCeti.AutomorphicLFunctions.AL1.CanonicalArchimedeanFactor
    [.complex κ t] s = Complex.Gammaℂ (s+t+(κ.natAbs : ℂ)/2) := by sorry

/-- On the convergence half-plane: the native Dirichlet series, without factor 2. -/
def MaassStandardLFunction (a : ℕ → ℂ) (s : ℂ) : ℂ := LSeries a s

def maassCompletion (a : ℕ → ℂ) (ε : Fin 2) (r : ℝ) (s : ℂ) : ℂ :=
  Complex.Gammaℝ (s+(ε.val : ℂ)+Complex.I*r)*
    Complex.Gammaℝ (s+(ε.val : ℂ)-Complex.I*r)*MaassStandardLFunction a s

theorem MaassStandardLFunction.completion (a : ℕ → ℂ) (ε : Fin 2) (r : ℝ) (s : ℂ) :
    maassCompletion a ε r s = Complex.Gammaℝ (s+(ε.val : ℂ)+Complex.I*r)*
      Complex.Gammaℝ (s+(ε.val : ℂ)-Complex.I*r)*MaassStandardLFunction a s := by sorry

theorem MaassStandardLFunction.duke (a : ℕ → ℂ) (ε : Fin 2) (r : ℝ) (s : ℂ) :
    (Real.pi : ℂ)^(-s)*Complex.Gamma ((s+(ε.val : ℂ)+Complex.I*r)/2)*
      Complex.Gamma ((s+(ε.val : ℂ)-Complex.I*r)/2)*MaassStandardLFunction a s =
    (Real.pi : ℂ)^ε.val * maassCompletion a ε r s := by sorry

theorem MaassStandardLFunction.twist (a χ : ℕ → ℂ) (s : ℂ) :
    MaassStandardLFunction (fun n => χ n*a n) s = LSeries (fun n => χ n*a n) s := by sorry

-- TauCeti.AutomorphicLFunctions.AL2.MaassStandardLFunction.odd_completion
example (a : ℕ → ℂ) (r : ℝ) (s : ℂ) :
    (Real.pi : ℂ)^(-s)*Complex.Gamma ((s+1+Complex.I*r)/2)*
      Complex.Gamma ((s+1-Complex.I*r)/2)*MaassStandardLFunction a s =
    Real.pi * maassCompletion a 1 r s := by sorry
-- TauCeti.AutomorphicLFunctions.AL2.MaassStandardLFunction.prime_square
example (A : ℂ) : PowerSeries.coeff 2
    ((1-PowerSeries.C A*PowerSeries.X+PowerSeries.X^2 : PowerSeries ℂ)⁻¹) = A^2-1 := by sorry

end TauCeti.AutomorphicLFunctions.AL2

namespace TauCeti.AutomorphicLFunctions.AL3

/-- The representation-theoretic image, on the native algebraic representation carrier.
    The smooth/Casselman–Wallach topologies belong to SR.1/AF.1. -/
def WhittakerModel {G V : Type*} [Monoid G] [AddCommGroup V] [Module ℂ V]
    (ρ : G →* Module.End ℂ V) (ℓ : V →ₗ[ℂ] ℂ) : Submodule ℂ (G → ℂ) := by sorry

def whittakerFunction {G V : Type*} [Monoid G] [AddCommGroup V] [Module ℂ V]
    (ρ : G →* Module.End ℂ V) (ℓ : V →ₗ[ℂ] ℂ) (v : V) (g : G) : ℂ := ℓ (ρ g v)

theorem WhittakerModel.equivariance {G V : Type*} [Monoid G]
    [AddCommGroup V] [Module ℂ V] (ρ : G →* Module.End ℂ V) (ℓ : V →ₗ[ℂ] ℂ)
    (N : Submonoid G) (ψ : N →* ℂ) (h : ∀ u : N, ∀ v, ℓ (ρ u v) = ψ u*ℓ v)
    (u : N) (v : V) (g : G) :
    whittakerFunction ρ ℓ v (u*g) = ψ u*whittakerFunction ρ ℓ v g := by sorry

theorem WhittakerModel.right_action {G V : Type*} [Monoid G]
    [AddCommGroup V] [Module ℂ V] (ρ : G →* Module.End ℂ V) (ℓ : V →ₗ[ℂ] ℂ)
    (v : V) (g h : G) : whittakerFunction ρ ℓ (ρ h v) g =
      whittakerFunction ρ ℓ v (g*h) := by sorry

theorem WhittakerModel.ext {G V : Type*} [Monoid G]
    [AddCommGroup V] [Module ℂ V] (ρ : G →* Module.End ℂ V) (ℓ : V →ₗ[ℂ] ℂ)
    (W W' : WhittakerModel ρ ℓ) (h : ∀ g, (W : G → ℂ) g = (W' : G → ℂ) g) : W = W' := by sorry

-- TauCeti.AutomorphicLFunctions.AL3.WhittakerModel.generic_nonzero
example {G V : Type*} [Monoid G] [AddCommGroup V] [Module ℂ V]
    (ρ : G →* Module.End ℂ V) (ℓ : V →ₗ[ℂ] ℂ) (h : ℓ ≠ 0) :
    ∃ v, whittakerFunction ρ ℓ v ≠ 0 := by sorry

/-- Unequal-rank formula on the supplied quotient and matrix-space carriers;
    Wblock is W evaluated on the displayed block embedding. -/
def RsLocalIntegrals {Q M : Type*} [MeasurableSpace Q] [MeasurableSpace M]
    (n m : ℕ) (μ : Measure Q) (ν : Measure M) (Wblock : Q → M → ℂ)
    (W' : Q → ℂ) (absDet : Q → ℝ) (s : ℂ) : ℂ :=
  ∫ g, (∫ x, Wblock g x ∂ν)*W' g*(absDet g : ℂ)^(s-((n : ℂ)-(m : ℂ))/2) ∂μ

def rsEqualRankIntegral {Q : Type*} [MeasurableSpace Q] (μ : Measure Q)
    (W W' Φ : Q → ℂ) (absDet : Q → ℝ) (s : ℂ) : ℂ :=
  ∫ g, W g*W' g*Φ g*(absDet g : ℂ)^s ∂μ

theorem RsLocalIntegrals.equal_rank {Q : Type*} [MeasurableSpace Q] (μ : Measure Q)
    (W W' Φ : Q → ℂ) (absDet : Q → ℝ) (s : ℂ) :
    rsEqualRankIntegral μ W W' Φ absDet s =
      ∫ g, W g*W' g*Φ g*(absDet g : ℂ)^s ∂μ := by sorry

theorem RsLocalIntegrals.j_range (n m : ℕ) : Fintype.card (Fin (n-m)) = n-m := by sorry
-- TauCeti.AutomorphicLFunctions.AL3.RsLocalIntegrals.rank_gap_three
example : Fintype.card (Fin (5-2)) = 3 := by sorry
-- TauCeti.AutomorphicLFunctions.AL3.RsLocalIntegrals.equal_rank_one
example {G : Type*} [MeasurableSpace G] (μ : Measure G) (χ χ' Φ : G → ℂ)
    (a : G → ℝ) (s : ℂ) : rsEqualRankIntegral μ χ χ' Φ a s =
      TauCeti.TateZeta.zetaIntegral μ a (fun g => χ g*χ' g) s Φ := by sorry

/-- Polynomial evaluation after the local RS generator construction. -/
def RsLocalFactor (P : Polynomial ℂ) (q : ℝ) (s : ℂ) : ℂ :=
  TauCeti.AutomorphicLFunctions.AL2.StandardLocalLFactor P q s

theorem RsLocalFactor.unramified {ι κ : Type*} [Fintype ι] [Fintype κ]
    (α : ι → ℂ) (β : κ → ℂ) (q : ℝ) (s : ℂ) :
    RsLocalFactor (∏ i, ∏ j, (1-Polynomial.C (α i*β j)*Polynomial.X)) q s =
      ∏ i, ∏ j, (1-α i*β j*(q : ℂ)^(-s))⁻¹ := by sorry
-- TauCeti.AutomorphicLFunctions.AL3.RsLocalFactor.one_by_one
example (α β : ℂ) (q : ℝ) (s : ℂ) :
    RsLocalFactor (1-Polynomial.C (α*β)*Polynomial.X) q s =
      (1-α*β*(q : ℂ)^(-s))⁻¹ := by sorry
-- TauCeti.AutomorphicLFunctions.AL3.RsLocalFactor.two_by_one
example (q : ℝ) (s : ℂ) :
    RsLocalFactor ((1-Polynomial.C (2*5 : ℂ)*Polynomial.X)*
      (1-Polynomial.C (3*5 : ℂ)*Polynomial.X)) q s =
      (1-10*(q : ℂ)^(-s))⁻¹ * (1-15*(q : ℂ)^(-s))⁻¹ := by sorry

/-- Theta Mellin expression on the supplied idele-class measure. -/
def MirabolicEisensteinSeries {C : Type*} [MeasurableSpace C]
    (μ : Measure C) (n : ℕ) (absDet : ℝ) (a : C → ℝ)
    (θ₀ η : C → ℂ) (s : ℂ) : ℂ :=
  (absDet : ℂ)^s * ∫ x, θ₀ x*(a x : ℂ)^((n : ℂ)*s)*η x ∂μ

theorem MirabolicEisensteinSeries.theta {C : Type*} [MeasurableSpace C]
    (μ : Measure C) (n : ℕ) (absDet : ℝ) (a : C → ℝ)
    (θ₀ η : C → ℂ) (s : ℂ) :
    MirabolicEisensteinSeries μ n absDet a θ₀ η s =
      (absDet : ℂ)^s * ∫ x, θ₀ x*(a x : ℂ)^((n : ℂ)*s)*η x ∂μ := by sorry
-- TauCeti.AutomorphicLFunctions.AL3.MirabolicEisensteinSeries.zero_schwartz
example {C : Type*} [MeasurableSpace C] (μ : Measure C) (n : ℕ)
    (absDet : ℝ) (a : C → ℝ) (η : C → ℂ) (s : ℂ) :
    MirabolicEisensteinSeries μ n absDet a (fun _ => 0) η s = 0 := by sorry

/-- Evaluate the proved entire continuation of the normalized quotient at zero.
    The quotient itself, not a totalized divergent integral, is supplied. -/
def NormalizedRsPeriod {V : Type*} [AddCommGroup V] [Module ℂ V]
    (quotient : ℂ → V →ₗ[ℂ] ℂ) : V →ₗ[ℂ] ℂ := quotient 0


/-- A local formal factor. Global coefficients depend only on places of degree ≤k. -/
def ffRsLocalFactor {ι κ : Type*} [Fintype ι] [Fintype κ]
    (α : ι → ℂ) (β : κ → ℂ) (d : ℕ) : PowerSeries ℂ :=
  ∏ i, ∏ j, (1-PowerSeries.C (α i/(β j))*PowerSeries.X^d)⁻¹

/-- Exact formal product coefficient construction. Finiteness of low-degree places
    is data; positivity of degrees is required by its constant-term theorem. -/
def FunctionFieldRsEulerProduct {V ι κ : Type*} [Fintype ι] [Fintype κ]
    (degree : V → ℕ) (finite : ∀ k, {v | degree v ≤ k}.Finite)
    (α : V → ι → ℂ) (β : V → κ → ℂ) : PowerSeries ℂ :=
  PowerSeries.mk (fun k => PowerSeries.coeff k
    (∏ v ∈ (finite k).toFinset, ffRsLocalFactor (α v) (β v) (degree v)))

theorem FunctionFieldRsEulerProduct.constant {V ι κ : Type*} [Fintype ι] [Fintype κ]
    (degree : V → ℕ) (positive : ∀ v, 0 < degree v)
    (finite : ∀ k, {v | degree v ≤ k}.Finite) (α : V → ι → ℂ) (β : V → κ → ℂ) :
    PowerSeries.constantCoeff (FunctionFieldRsEulerProduct degree finite α β) = 1 := by sorry

-- TauCeti.AutomorphicLFunctions.AL3.FunctionFieldRsEulerProduct.rank_one
example (d : ℕ) : ffRsLocalFactor (fun _ : Fin 1 => (2 : ℂ))
    (fun _ : Fin 1 => (3 : ℂ)) d =
      (1-PowerSeries.C (2/3 : ℂ)*PowerSeries.X^d)⁻¹ := by sorry
-- TauCeti.AutomorphicLFunctions.AL3.FunctionFieldRsEulerProduct.degree_two
example : PowerSeries.coeff 1 (ffRsLocalFactor (fun _ : Fin 1 => (2 : ℂ))
    (fun _ : Fin 1 => (3 : ℂ)) 2) = 0 ∧
      PowerSeries.coeff 2 (ffRsLocalFactor (fun _ : Fin 1 => (2 : ℂ))
        (fun _ : Fin 1 => (3 : ℂ)) 2) = 2/3 := by sorry
-- TauCeti.AutomorphicLFunctions.AL3.FunctionFieldRsEulerProduct.self_pair
example (a : ℂ) (ha : a ≠ 0) (d : ℕ) : ffRsLocalFactor (fun _ : Fin 1 => a)
    (fun _ : Fin 1 => a) d = (1-PowerSeries.X^d : PowerSeries ℂ)⁻¹ := by sorry

/-- Polynomial root multiplicities in the open unit disc. -/
def OpenDiscZeroPoleIndex (P Q : Polynomial ℂ) : ℤ :=
  ((P.roots.filter (fun z => ‖z‖ < 1)).card : ℤ)-
    ((Q.roots.filter (fun z => ‖z‖ < 1)).card : ℤ)

/-- Native analytic divisor compared with finite polynomial multiplicities. -/
theorem OpenDiscZeroPoleIndex.divisor (P Q : Polynomial ℂ) (hP : P ≠ 0) (hQ : Q ≠ 0) :
    OpenDiscZeroPoleIndex P Q =
      ∑ z ∈ ((P.roots+Q.roots).toFinset.filter (fun z => ‖z‖ < 1)),
        MeromorphicOn.divisor (fun w => P.eval w / Q.eval w) Set.univ z := by sorry

theorem OpenDiscZeroPoleIndex.presentation (P Q P' Q' : Polynomial ℂ)
    (hP : P ≠ 0) (hQ : Q ≠ 0) (hP' : P' ≠ 0) (hQ' : Q' ≠ 0)
    (h : P*Q' = P'*Q) : OpenDiscZeroPoleIndex P Q = OpenDiscZeroPoleIndex P' Q' := by sorry

theorem OpenDiscZeroPoleIndex.mul (P Q P' Q' : Polynomial ℂ)
    (hP : P ≠ 0) (hQ : Q ≠ 0) (hP' : P' ≠ 0) (hQ' : Q' ≠ 0) :
    OpenDiscZeroPoleIndex (P*P') (Q*Q') =
      OpenDiscZeroPoleIndex P Q+OpenDiscZeroPoleIndex P' Q' := by sorry

theorem OpenDiscZeroPoleIndex.inv (P Q : Polynomial ℂ) :
    OpenDiscZeroPoleIndex Q P = -OpenDiscZeroPoleIndex P Q := by sorry

-- TauCeti.AutomorphicLFunctions.AL3.OpenDiscZeroPoleIndex.coordinate
example : OpenDiscZeroPoleIndex Polynomial.X 1 = 1 := by sorry
-- TauCeti.AutomorphicLFunctions.AL3.OpenDiscZeroPoleIndex.inverse_coordinate
example : OpenDiscZeroPoleIndex 1 Polynomial.X = -1 := by sorry
-- TauCeti.AutomorphicLFunctions.AL3.OpenDiscZeroPoleIndex.boundary_excluded
example : OpenDiscZeroPoleIndex (Polynomial.X-1) 1 = 0 := by sorry
-- TauCeti.AutomorphicLFunctions.AL3.OpenDiscZeroPoleIndex.cancelled_presentation
example : OpenDiscZeroPoleIndex Polynomial.X Polynomial.X = 0 := by sorry

/-- Meromorphic quotient represented by polynomials. No pole is evaluated here. -/
def RsNormalizingScalar (P Q : Polynomial ℂ) (q : ℝ) (g Ni Nj : ℕ) :
    Polynomial ℂ × Polynomial ℂ :=
  (Polynomial.C ((q : ℂ)^(((1 : ℤ)-(g : ℤ))*(Ni : ℤ)*(Nj : ℤ))) * P *
      Q.comp (Polynomial.C (q : ℂ)⁻¹*Polynomial.X),
    Q * P.comp (Polynomial.C (q : ℂ)⁻¹*Polynomial.X))
-- TauCeti.AutomorphicLFunctions.AL3.RsNormalizingScalar.genus_one
example (P Q : Polynomial ℂ) (q : ℝ) (Ni Nj : ℕ) :
    RsNormalizingScalar P Q q 1 Ni Nj =
      (P*Q.comp (Polynomial.C (q : ℂ)⁻¹*Polynomial.X),
        Q*P.comp (Polynomial.C (q : ℂ)⁻¹*Polynomial.X)) := by sorry

end TauCeti.AutomorphicLFunctions.AL3

namespace TauCeti.AutomorphicLFunctions.AL4

/-- Matrix of r(t) in a basis. Use native charpolyRev rather than replanning it. -/
def LGroupLocalFactor {ι : Type*} [Fintype ι] [DecidableEq ι]
    (A : Matrix ι ι ℂ) : Polynomial ℂ := A.charpolyRev

theorem LGroupLocalFactor.constant {ι : Type*} [Fintype ι] [DecidableEq ι]
    (A : Matrix ι ι ℂ) : (LGroupLocalFactor A).eval 0 = 1 := by sorry

theorem LGroupLocalFactor.conjugacy {ι : Type*} [Fintype ι] [DecidableEq ι]
    (A B : Matrix ι ι ℂ) (hB : IsUnit B) :
    LGroupLocalFactor (B*A*B⁻¹) = LGroupLocalFactor A := by sorry

theorem LGroupLocalFactor.direct_sum {ι κ : Type*} [Fintype ι] [DecidableEq ι]
    [Fintype κ] [DecidableEq κ] (A : Matrix ι ι ℂ) (B : Matrix κ κ ℂ) :
    LGroupLocalFactor (Matrix.fromBlocks A 0 0 B) = LGroupLocalFactor A*LGroupLocalFactor B := by sorry

theorem LGroupLocalFactor.standard_gln {ι : Type*} [Fintype ι] [DecidableEq ι]
    (α : ι → ℂ) : LGroupLocalFactor (Matrix.diagonal α) =
      ∏ i, (1-Polynomial.C (α i)*Polynomial.X) := by sorry

-- TauCeti.AutomorphicLFunctions.AL4.LGroupLocalFactor.zero_dimensional
example : LGroupLocalFactor (0 : Matrix (Fin 0) (Fin 0) ℂ) = 1 := by sorry
-- TauCeti.AutomorphicLFunctions.AL4.LGroupLocalFactor.one_dimensional
example (a : ℂ) : LGroupLocalFactor (Matrix.diagonal (fun _ : Fin 1 => a)) =
    1-Polynomial.C a*Polynomial.X := by sorry
-- TauCeti.AutomorphicLFunctions.AL4.LGroupLocalFactor.tensor_not_product
example : LGroupLocalFactor (Matrix.diagonal (fun _ : Fin 1 => (2*3 : ℂ))) ≠
    LGroupLocalFactor (Matrix.diagonal (fun _ : Fin 1 => (2 : ℂ))) *
      LGroupLocalFactor (Matrix.diagonal (fun _ : Fin 1 => (3 : ℂ))) := by sorry
-- TauCeti.AutomorphicLFunctions.AL4.LGroupLocalFactor.gln2_integral_shift
example (q : ℝ) (α : Fin 2 → ℂ) :
    (LGroupLocalFactor (Matrix.diagonal (fun i => (Real.sqrt q : ℂ)*α i))).coeff 1 =
      -(Real.sqrt q : ℂ)*(α 0+α 1) := by sorry

end TauCeti.AutomorphicLFunctions.AL4

namespace TauCeti.AutomorphicLFunctions.AL5

def FiniteEulerCorrection {ι : Type*} (S : Finset ι) (P : ι → Polynomial ℂ)
    (q : ι → ℝ) (s : ℂ) : ℂ := ∏ v ∈ S, (P v).eval ((q v : ℂ)^(-s))

theorem FiniteEulerCorrection.empty {ι : Type*} (P : ι → Polynomial ℂ)
    (q : ι → ℝ) (s : ℂ) : FiniteEulerCorrection ∅ P q s = 1 := by sorry

theorem FiniteEulerCorrection.union {ι : Type*} [DecidableEq ι]
    (S T : Finset ι) (h : Disjoint S T) (P : ι → Polynomial ℂ) (q : ι → ℝ) (s : ℂ) :
    FiniteEulerCorrection (S∪T) P q s =
      FiniteEulerCorrection S P q s*FiniteEulerCorrection T P q s := by sorry

-- TauCeti.AutomorphicLFunctions.AL5.FiniteEulerCorrection.empty_set
example {ι : Type*} (P : ι → Polynomial ℂ) (q : ι → ℝ) (s : ℂ) (L : ℂ → ℂ) :
    FiniteEulerCorrection ∅ P q s * L s = L s := by sorry
-- TauCeti.AutomorphicLFunctions.AL5.FiniteEulerCorrection.simple_exceptional_zero
example (p : ℝ) (hp : 1 < p) :
    FiniteEulerCorrection (Finset.univ : Finset (Fin 1))
      (fun _ => 1-Polynomial.X) (fun _ => p) 0 = 0 := by sorry
-- TauCeti.AutomorphicLFunctions.AL5.FiniteEulerCorrection.double_exceptional_zero
example (p : ℝ) (hp : 1 < p) :
    iteratedDeriv 2 (fun s : ℂ =>
      FiniteEulerCorrection (Finset.univ : Finset (Fin 2))
        (fun _ => 1-Polynomial.X) (fun _ => p) s) 0 =
      2*(Real.log p : ℂ)^2 := by sorry

def OrdinaryGl2EulerFactor (p : ℝ) (k j : ℕ) (α χp χinvp εp : ℂ) : ℂ :=
  (1-χp*(p : ℂ)^j/α)*(1-χinvp*εp*(p : ℂ)^(k-j)/α)

theorem OrdinaryGl2EulerFactor.ramified (p : ℝ) (k j : ℕ) (α εp : ℂ) :
    OrdinaryGl2EulerFactor p k j α 0 0 εp = 1 := by sorry

theorem OrdinaryGl2EulerFactor.unramified (p : ℝ) (k j : ℕ) (α εp : ℂ) :
    OrdinaryGl2EulerFactor p k j α 1 1 εp =
      (1-(p : ℂ)^j/α)*(1-εp*(p : ℂ)^(k-j)/α) := by sorry

-- TauCeti.AutomorphicLFunctions.AL5.OrdinaryGl2EulerFactor.trivial_weight_two
example (p : ℝ) (α : ℂ) : OrdinaryGl2EulerFactor p 0 0 α 1 1 1 = (1-1/α)^2 := by sorry
-- TauCeti.AutomorphicLFunctions.AL5.OrdinaryGl2EulerFactor.ramified_weight_two
example (p : ℝ) (α : ℂ) : OrdinaryGl2EulerFactor p 0 0 α 0 0 1 = 1 := by sorry
-- TauCeti.AutomorphicLFunctions.AL5.OrdinaryGl2EulerFactor.exceptional
example (p : ℝ) : OrdinaryGl2EulerFactor p 0 0 1 1 1 1 = 0 := by sorry
-- TauCeti.AutomorphicLFunctions.AL5.OrdinaryGl2EulerFactor.different_roots
example : OrdinaryGl2EulerFactor 3 0 0 (Complex.I*Real.sqrt 3) 1 1 1 ≠
    OrdinaryGl2EulerFactor 3 0 0 (-Complex.I*Real.sqrt 3) 1 1 1 := by sorry

/-- The central-sign argument uses an actual functional equation hypothesis. -/
theorem CentralSignVanishing (Λ : ℂ → ℂ) (h : ∀ s, Λ s = -Λ (1-s)) :
    Λ (1/2) = 0 := by sorry

theorem FirstNonzeroTermParity (Λ : ℂ → ℂ) (hΛ : Differentiable ℂ Λ)
    (ε : ℂ) (hε : ε = 1 ∨ ε = -1) (h : ∀ s, Λ s = ε*Λ (1-s)) (j : ℕ) :
    iteratedDeriv j Λ (1/2) = ε*(-1)^j*iteratedDeriv j Λ (1/2) := by sorry

end TauCeti.AutomorphicLFunctions.AL5

namespace TauCeti.SchwartzBruhat

/-- Archimedean scaling action. The finite-place action remains an SR.1 specialization. -/
def LocalSpace.act {F : Type*} [NormedField F] [NormedAlgebra ℝ F]
    (a : Fˣ) : LocalSpace F →L[ℂ] LocalSpace F := by sorry

theorem LocalSpace.act_apply {F : Type*} [NormedField F] [NormedAlgebra ℝ F]
    (a : Fˣ) (f : LocalSpace F) (x : F) : LocalSpace.act a f x = f (x*a) := by sorry

-- TauCeti.SchwartzBruhat.LocalSpace.delta_invariant
example {F : Type*} [NormedField F] [NormedAlgebra ℝ F]
    (a : Fˣ) (f : LocalSpace F) :
    LocalSpace.delta F (LocalSpace.act a⁻¹ f) = LocalSpace.delta F f := by sorry
-- TauCeti.SchwartzBruhat.LocalSpace.gaussian_mem
example : (∃ f : LocalSpace ℝ, ∀ x, f x = Complex.exp (-Real.pi*(x : ℂ)^2)) ∧
    (∃ f : LocalSpace ℂ, ∀ z, f z = Complex.exp (-2*Real.pi*(‖z‖ : ℂ)^2)) := by sorry
-- TauCeti.SchwartzBruhat.LocalSpace.const_not_mem
example : ¬∃ f : LocalSpace ℝ, ∀ x, f x = 1 := by sorry

end TauCeti.SchwartzBruhat

namespace TauCeti.AutomorphicLFunctions.AL0

/-- The continuous Pontryagin specialization of the algebraic character formula. -/
def continuousDualityMap {F : Type*} [CommRing F] [TopologicalSpace F]
    [IsTopologicalRing F] [LocallyCompactSpace F] (ψ : AddChar F Circle)
    (hψ : Continuous ψ) : Multiplicative F →ₜ* PontryaginDual (Multiplicative F) := by sorry

/-- Native real specialization of the number-field-completion theorem.
     The complex and finite-completion signatures remain in the manifest below. -/
theorem LocalAdditiveSelfDuality (ψ : AddChar ℝ Circle)
    (hψ : Continuous ψ) (hne : ψ ≠ 1) :
    Function.Bijective (continuousDualityMap ψ hψ) ∧
      IsOpenMap (continuousDualityMap ψ hψ) := by sorry

theorem AdditiveDualityMap.annihilator {F : Type*} [CommRing F]
    (ψ : AddChar F Circle) (U : AddSubgroup F) (y : F) :
    (∀ x ∈ U, AdditiveDualityMap ψ y x = 1) ↔
      y ∈ TauCeti.LocalFourier.pairingAnnihilator ψ (LinearMap.mul F F) U := by sorry

/-- Real archimedean square, with sections in the native Schwartz space. -/
theorem PartialFourierTransform.square {X : Type*} (Φ : X → SchwartzMap ℝ ℂ)
    (x : X) (w : ℝ) :
    PartialFourierTransform Real.fourierChar volume (LinearMap.mul ℝ ℝ)
      (fun p => PartialFourierTransform Real.fourierChar volume (LinearMap.mul ℝ ℝ)
        (fun p => Φ p.1 p.2) p.1 p.2) x w = Φ x (-w) := by sorry

-- TauCeti.AutomorphicLFunctions.AL0.PartialFourierTransform.pure_tensor
example (f : ℝ → ℂ) (x w : ℝ) :
    PartialFourierTransform Real.fourierChar volume (LinearMap.mul ℝ ℝ)
      (fun p => f p.1*Complex.exp (-Real.pi*(p.2 : ℂ)^2)) x w =
    f x*Complex.exp (-Real.pi*(w : ℂ)^2) := by sorry
-- TauCeti.AutomorphicLFunctions.AL0.PartialFourierTransform.first_factor_fixed
example (x w : ℝ) :
    PartialFourierTransform Real.fourierChar volume (LinearMap.mul ℝ ℝ)
      (fun p : ℝ × ℝ => (p.1 : ℂ)*Complex.exp (-Real.pi*(p.2 : ℂ)^2)) x w =
    (x : ℂ)*Complex.exp (-Real.pi*(w : ℂ)^2) := by sorry

/-- Fubini interface for commuting two selected factors. -/
theorem PartialFourierTransform.commute (Φ : ℝ × ℝ → ℂ)
    (h : Integrable Φ (volume.prod volume)) (a b : ℝ) :
    (∫ v : ℝ, ∫ w : ℝ, Φ (v,w)*Complex.exp (2*Real.pi*Complex.I*(v*a+w*b))) =
      ∫ w : ℝ, ∫ v : ℝ, Φ (v,w)*Complex.exp (2*Real.pi*Complex.I*(v*a+w*b)) := by sorry

/-- The explicit archimedean Gaussian test, in the source's positive kernel. -/
theorem ArchimedeanFourierComparison (w : ℝ) :
    PartialFourierTransform Real.fourierChar volume (LinearMap.mul ℝ ℝ)
      (fun p : Unit × ℝ => Complex.exp (-Real.pi*(p.2 : ℂ)^2)) () w =
    Complex.exp (-Real.pi*(w : ℂ)^2) := by sorry

/-- Gross–Zagier's Laplace–Mellin integral, with the same K convention. -/
theorem BesselLaplaceMellin (m t : ℝ) (s : ℂ) (hm : 0 < m) (ht : 0 < t)
    (hs : t < s.re) :
    (∫ y : ℝ in Set.Ioi 0, (y : ℂ)^(s-1/2)*BesselK (t+1/2) (2*Real.pi*m*y)*
      Complex.exp (-2*Real.pi*m*y)) =
    (Real.sqrt Real.pi : ℂ)*Complex.Gamma (s+t+1)*Complex.Gamma (s-t)/
      (Complex.Gamma (s+1)*(4*Real.pi*m : ℂ)^(s+1/2)) := by sorry

/-- Fractional-ideal volume specialization: the inverse different shifts the dual. -/
theorem SelfDualHaar.dual_volume (q : ℝ) (hq : 0 < q) (m d : ℤ) :
    q^(-(m : ℝ)-(d : ℝ)/2)*q^((m : ℝ)+(d : ℝ)-(d : ℝ)/2) = 1 := by sorry

end TauCeti.AutomorphicLFunctions.AL0

namespace TauCeti.TateZeta

def QuasiChar.IsUnramified {F : Type*} [Field F] [TopologicalSpace F]
    (ω : QuasiChar F) (U : Subgroup Fˣ) : Prop := ∀ u : U, ω u = 1

/-- Zeta integrals as linear functionals on a supplied linear test-function carrier.
    Pointwise integrability is a genuine analytic condition, not a dummy structure. -/
def zetaDistribution {G V : Type*} [MeasurableSpace G] [AddCommGroup V] [Module ℂ V]
    (μ : Measure G) (a : G → ℝ) (ω : G → ℂ) (s : ℂ) (ι : V →ₗ[ℂ] (G → ℂ))
    (h : ∀ f, Integrable (fun x => ι f x*ω x*(a x : ℂ)^s) μ) : V →ₗ[ℂ] ℂ := by sorry

-- The archimedean distribution is the continuous restriction of this linear map.
-- TauCeti.TateZeta.zetaIntegral_gaussian_real
example (s : ℂ) (hs : 0 < s.re) :
    zetaIntegral (volume.withDensity (fun x : ℝ => ENNReal.ofReal |x|⁻¹))
      abs (fun _ => 1) s (fun x => Complex.exp (-Real.pi*(x : ℂ)^2)) =
    Complex.Gammaℝ s := by sorry
-- TauCeti.TateZeta.zetaIntegral_gaussian_complex
example (s : ℂ) (hs : 0 < s.re) :
    zetaIntegral ((2 : ℝ≥0∞) • volume.withDensity
      (fun z : ℂ => ENNReal.ofReal (‖z‖^2)⁻¹))
      (fun z => ‖z‖^2) (fun _ => 1) s
      (fun z => Complex.exp (-2*Real.pi*(‖z‖ : ℂ)^2)) =
    Real.pi*Complex.Gammaℂ s := by sorry
-- TauCeti.TateZeta.zetaIntegral_not_convergent
example : ¬ Summable (fun _ : ℕ => (1 : ℂ)) := by sorry
-- TauCeti.TateZeta.zetaIntegral_unramified_standard
example (t s : ℂ) (q : ℝ) (h : ‖t*(q : ℂ)^(-s)‖ < 1) :
    ∑' n : ℕ, (t*(q : ℂ)^(-s))^n = (1-t*(q : ℂ)^(-s))⁻¹ := by sorry

/-- Translation covariance after the supplied group integral is instantiated.
    The invariance condition is on the actual multiplicative Haar measure. -/
theorem zetaIntegral_act {G : Type*} [Group G] [MeasurableSpace G] [MeasurableMul₂ G]
    (μ : Measure G) [μ.IsMulRightInvariant] (a : G →* ℝˣ) (ha : ∀ x, 0 < (a x : ℝ))
    (ω : G →* ℂˣ) (s : ℂ) (f : G → ℂ) (b : G) :
    zetaIntegral μ (fun x => a x) (fun x => ω x) s (fun x => f (x*b)) =
    ((ω b : ℂ)*(a b : ℂ)^s)⁻¹*zetaIntegral μ (fun x => a x) (fun x => ω x) s f := by sorry

/-- Product decomposition only where multipliability is established. -/
theorem completedHeckeL_eq_mul {ι : Type*} [DecidableEq ι] (S : Finset ι)
    (L : ι → ℂ → ℂ) (s : ℂ) (h : Multipliable (fun v => L v s)) :
    completedHeckeL L s = (∏ v ∈ S, L v s)*partialHeckeL (S : Set ι) L s := by sorry

-- TauCeti.TateZeta.completedHeckeL_not_product_over_ideals
example : Complex.Gammaℝ (2 : ℂ) ≠ 1 := by sorry
-- TauCeti.TateZeta.gammaFactor_real_trivial
example (s : ℂ) (hs : ∀ n : ℕ, s ≠ -(2*n+1)) :
    Complex.Gammaℝ s/Complex.Gammaℝ (1-s) =
      Complex.Gammaℂ s*Complex.cos (Real.pi*s/2) := by sorry

/-- Scalar-product character cancellation; the arithmetic global character
    supplies product one, not independent choices at the places. -/
theorem globalEpsilon_indep {ι : Type*} (S : Finset ι) (ε c : ι → ℂ)
    (hc : ∏ v ∈ S, c v = 1) : (∏ v ∈ S, c v*ε v) = ∏ v ∈ S, ε v := by sorry

end TauCeti.TateZeta

namespace TauCeti.AutomorphicLFunctions.AL2

/-- Entire order at most one, with the epsilon margin needed for Hadamard factorization. -/
def IsCenteredOrderOne (f : ℂ → ℂ) : Prop :=
  Differentiable ℂ f ∧ ∀ ε : ℝ, 0 < ε → ∃ C : ℝ, 0 < C ∧
    ∀ z : ℂ, ‖f z‖ ≤ Real.exp (C * (1 + ‖z‖ ^ (1 + ε)))

theorem IsCenteredOrderOne.mul {f g : ℂ → ℂ}
    (hf : IsCenteredOrderOne f) (hg : IsCenteredOrderOne g) :
    IsCenteredOrderOne (fun z => f z * g z) := by sorry

theorem IsCenteredOrderOne.translate {f : ℂ → ℂ}
    (hf : IsCenteredOrderOne f) (a : ℂ) :
    IsCenteredOrderOne (fun z => f (z + a)) := by sorry

theorem IsCenteredOrderOne.polynomial (P : Polynomial ℂ) :
    IsCenteredOrderOne P.eval := by sorry

-- Tests distinguish order one from mere entire analyticity.
example : IsCenteredOrderOne (fun _ : ℂ => (1 : ℂ)) := by sorry
example : IsCenteredOrderOne (fun z : ℂ => 1 + z ^ 2) := by sorry
example : IsCenteredOrderOne Complex.exp ∧
    ¬ IsCenteredOrderOne (fun z : ℂ => Complex.exp (z ^ 2)) := by sorry

/-- Zero entries in gamma encode unused indices when the zero multiset is finite. -/
theorem PairedHadamardFactorization (f : ℂ → ℂ) (δ : ℂ)
    (hf : IsCenteredOrderOne f) (hδ : δ = 1 ∨ δ = -1)
    (hparity : ∀ z, f (-z) = δ * f z)
    (hzeros : ∀ z, f z = 0 → z.re = 0)
    (hpositive : ∃ R : ℝ, ∀ x : ℝ, R ≤ x → (f (x : ℂ)).im = 0 ∧ 0 < (f (x : ℂ)).re) :
    ∃ (m : ℕ) (c : ℝ) (γ : ℕ → ℝ), 0 < c ∧
      (∀ n, 0 ≤ γ n) ∧ Summable (fun n => (γ n)⁻¹ ^ 2) ∧
      δ = (-1 : ℂ) ^ m ∧
      (∀ z : ℂ, Multipliable (fun n =>
        if γ n = 0 then (1 : ℂ) else 1 + z ^ 2 / (γ n : ℂ) ^ 2)) ∧
      (∀ z : ℂ, f z = (c : ℂ) * z ^ m * ∏' n,
        if γ n = 0 then (1 : ℂ) else 1 + z ^ 2 / (γ n : ℂ) ^ 2) ∧
      (∀ K : Set ℂ, IsCompact K → TendstoUniformlyOn
        (fun s : Finset ℕ => fun z : ℂ => (c : ℂ) * z ^ m *
          ∏ n ∈ s, if γ n = 0 then (1 : ℂ) else 1 + z ^ 2 / (γ n : ℂ) ^ 2)
        f Filter.atTop K) := by sorry

theorem PairedHadamard_derivatives_nonnegative (f : ℂ → ℂ) (δ : ℂ)
    (hf : IsCenteredOrderOne f) (hδ : δ = 1 ∨ δ = -1)
    (hparity : ∀ z, f (-z) = δ * f z)
    (hzeros : ∀ z, f z = 0 → z.re = 0)
    (hpositive : ∃ R : ℝ, ∀ x : ℝ, R ≤ x → (f (x : ℂ)).im = 0 ∧ 0 < (f (x : ℂ)).re)
    (k : ℕ) (x : ℝ) (hx : 0 ≤ x) :
    (iteratedDeriv k f (x : ℂ)).im = 0 ∧ 0 ≤ (iteratedDeriv k f (x : ℂ)).re := by sorry

theorem PairedHadamard_derivatives_positive (f : ℂ → ℂ) (δ : ℂ)
    (hf : IsCenteredOrderOne f) (hδ : δ = 1 ∨ δ = -1)
    (hparity : ∀ z, f (-z) = δ * f z)
    (hzeros : ∀ z, f z = 0 → z.re = 0)
    (hpositive : ∃ R : ℝ, ∀ x : ℝ, R ≤ x → (f (x : ℂ)).im = 0 ∧ 0 < (f (x : ℂ)).re)
    (hnonpoly : ¬ ∃ P : Polynomial ℂ, ∀ z, f z = P.eval z)
    (k : ℕ) (x : ℝ) (hx : 0 < x) :
    0 < (iteratedDeriv k f (x : ℂ)).re := by sorry

example : iteratedDeriv 3 (fun z : ℂ => 1 + z ^ 2) 1 = 0 := by sorry
example (k : ℕ) (x : ℝ) (hx : 0 < x) :
    0 < (iteratedDeriv k Complex.sinh (x : ℂ)).re := by sorry
example : (1 - Complex.I ^ 2 : ℂ) ≠ 0 ∧ (1 - (1 : ℂ) ^ 2 : ℂ) = 0 := by sorry

theorem GodementJacquetIntegral.bilinear {G : Type*} [MeasurableSpace G]
    (n : ℕ) (μ : Measure G) (β₁ β₂ Φ : G → ℂ) (a : G → ℝ) (s : ℂ)
    (h₁ : Integrable (fun g => β₁ g*Φ g*(a g : ℂ)^(s+((n : ℂ)-1)/2)) μ)
    (h₂ : Integrable (fun g => β₂ g*Φ g*(a g : ℂ)^(s+((n : ℂ)-1)/2)) μ) :
    GodementJacquetIntegral n μ (β₁+β₂) Φ a s =
      GodementJacquetIntegral n μ β₁ Φ a s+GodementJacquetIntegral n μ β₂ Φ a s := by sorry

-- TauCeti.AutomorphicLFunctions.AL2.MaassStandardLFunction.first_coefficient
example (a : ℕ → ℂ) (ha : a 1 = 1) (s : ℂ) : LSeries.term a s 1 = 1 := by sorry
-- TauCeti.AutomorphicLFunctions.AL2.MaassStandardLFunction.eisenstein_excluded
example : meromorphicOrderAt completedRiemannZeta 1 = -1 := by sorry

/-- The reciprocal Hecke polynomial with the unitary determinant normalization. -/
theorem MaassStandardLFunction.euler (A : ℂ) (q : ℝ) (hq : 0 < q) (s : ℂ) :
    StandardLocalLFactor (1-Polynomial.C A*Polynomial.X+Polynomial.X^2) q s =
      (1-A*(q : ℂ)^(-s)+(q : ℂ)^(-2*s))⁻¹ := by sorry

end TauCeti.AutomorphicLFunctions.AL2

namespace TauCeti.AutomorphicLFunctions.AL3

/-- A genuine invariant-subspace irreducibility hypothesis on the supplied action. -/
theorem WhittakerModel.realization {G V : Type*} [Group G]
    [AddCommGroup V] [Module ℂ V] (ρ : G →* Module.End ℂ V) (ℓ : V →ₗ[ℂ] ℂ)
    (hne : ℓ ≠ 0)
    (hirr : ∀ U : Submodule ℂ V, (∀ g v, v ∈ U → ρ g v ∈ U) → U = ⊥ ∨ U = ⊤) :
    Function.Injective (fun v => whittakerFunction ρ ℓ v) := by sorry

-- TauCeti.AutomorphicLFunctions.AL3.WhittakerModel.rank_one
example (ρ : ℂˣ →* Module.End ℂ ℂ) (χ : ℂˣ →* ℂ)
    (hρ : ∀ g v, ρ g v = χ g*v) (g : ℂˣ) (c : ℂ) :
    whittakerFunction ρ (LinearMap.id : ℂ →ₗ[ℂ] ℂ) c g =
      χ g * whittakerFunction ρ (LinearMap.id : ℂ →ₗ[ℂ] ℂ) c 1 := by sorry
-- TauCeti.AutomorphicLFunctions.AL3.WhittakerModel.opposite_character
example (ρ ρ' : Circle →* Module.End ℂ ℂ)
    (hρ : ∀ z v, ρ z v = (z : ℂ)*v)
    (hρ' : ∀ z v, ρ' z v = (z⁻¹ : Circle)*v) (z : Circle) (c d : ℂ) :
    whittakerFunction ρ (LinearMap.id : ℂ →ₗ[ℂ] ℂ) c z *
      whittakerFunction ρ' (LinearMap.id : ℂ →ₗ[ℂ] ℂ) d z =
    whittakerFunction ρ (LinearMap.id : ℂ →ₗ[ℂ] ℂ) c 1 *
      whittakerFunction ρ' (LinearMap.id : ℂ →ₗ[ℂ] ℂ) d 1 := by sorry

-- TauCeti.AutomorphicLFunctions.AL3.RsLocalIntegrals.two_by_one
example (μ : Measure ℝ) (W χ : ℝ → ℂ) (a : ℝ → ℝ) (s : ℂ) :
    RsLocalIntegrals 2 1 μ (Measure.dirac ()) (fun g _ => W g) χ a s =
      ∫ g, W g*χ g*(a g : ℂ)^(s-1/2) ∂μ := by sorry

theorem RsLocalIntegrals.twist {Q M : Type*} [MeasurableSpace Q] [MeasurableSpace M]
    (n m : ℕ) (μ : Measure Q) (ν : Measure M) (W : Q → M → ℂ)
    (W' : Q → ℂ) (a : Q → ℝ) (ha : ∀ g, 0 < a g) (s t : ℂ) :
    RsLocalIntegrals n m μ ν (fun g x => W g x*(a g : ℂ)^t) W' a s =
      RsLocalIntegrals n m μ ν W W' a (s+t) := by sorry

/-- Scalar-family specialization of quotient evaluation. The representation-level
    convergence and continuation tests are named omissions below. -/
example : NormalizedRsPeriod
    (fun s => (s+1) • (LinearMap.id : ℂ →ₗ[ℂ] ℂ)) 2 = 2 := by sorry

/-- A genuine entire extension of the quotient s/s on the punctured plane. -/
example : Differentiable ℂ (fun _ : ℂ => (1 : ℂ)) ∧
    (∀ s : ℂ, s ≠ 0 → (1 : ℂ) = s/s) ∧
    NormalizedRsPeriod (fun _ : ℂ => (LinearMap.id : ℂ →ₗ[ℂ] ℂ)) 1 = 1 ∧
    (0 : ℂ)/(0 : ℂ) = 0 := by sorry

/-- Continuation evaluates the analytic quotient, including at a simultaneous zero. -/
theorem NormalizedRsPeriod.continued_value_scalar (N A L : ℂ → ℂ) (s₀ : ℂ)
    (hN : AnalyticAt ℂ N s₀) (hA : AnalyticAt ℂ A s₀) (hL : AnalyticAt ℂ L s₀)
    (h : A =ᶠ[𝓝[≠] s₀] fun s => L s * N s) :
    A s₀ = L s₀ * N s₀ := by sorry

/-- The degree substitution in the local determinant. -/
theorem FunctionFieldRsEulerProduct.local {ι κ : Type*} [Fintype ι] [Fintype κ]
    [DecidableEq ι] [DecidableEq κ] (α : ι → ℂ) (β : κ → ℂ) (d : ℕ) :
    ffRsLocalFactor α β d =
      ((Matrix.diagonal (fun ij : ι × κ => α ij.1/β ij.2)).charpolyRev.eval₂
        PowerSeries.C (PowerSeries.X^d))⁻¹ := by sorry

theorem FunctionFieldRsEulerProduct.unitary_conjugate {ι κ : Type*}
    [Fintype ι] [Fintype κ] (α : ι → ℂ) (β : κ → ℂ) (d : ℕ)
    (σ : κ ≃ κ) (h : ∀ j, (β j)⁻¹ = star (β (σ j))) :
    ffRsLocalFactor α β d =
      ∏ i, ∏ j, (1-PowerSeries.C (α i*star (β j))*PowerSeries.X^d)⁻¹ := by sorry

/-- Equality at regular points; the polynomial pair retains its pole data. -/
theorem RsNormalizingScalar.root (P Q : Polynomial ℂ) (q : ℝ) (g Ni Nj : ℕ)
    (z : ℂ) (hQ : Q.eval z ≠ 0) (hQ' : Q.eval ((q : ℂ)⁻¹*z) ≠ 0)
    (hP' : P.eval ((q : ℂ)⁻¹*z) ≠ 0) :
    (RsNormalizingScalar P Q q g Ni Nj).1.eval z /
      (RsNormalizingScalar P Q q g Ni Nj).2.eval z =
      (q : ℂ)^(((1 : ℤ)-(g : ℤ))*(Ni : ℤ)*(Nj : ℤ)) *
      (P.eval z/Q.eval z)/(P.eval ((q : ℂ)⁻¹*z)/Q.eval ((q : ℂ)⁻¹*z)) := by sorry

-- TauCeti.AutomorphicLFunctions.AL3.RsNormalizingScalar.pole_not_value
example : (RsNormalizingScalar 1 (1-Polynomial.X) 2 1 1 1).1.eval 1 = 1/2 ∧
    (RsNormalizingScalar 1 (1-Polynomial.X) 2 1 1 1).2.eval 1 = 0 := by sorry

/-- The algebraic telescoping underlying residual Rankin–Selberg products. -/
theorem ResidualRsTelescoping (L : ℤ → ℂˣ) (a : ℤ) (ν₁ ν₂ : ℕ) :
    (∏ i : Fin ν₁, ∏ j : Fin ν₂, L (a-i.val-j.val)/L (a-i.val-j.val-1)) =
      ∏ j : Fin ν₂, L (a-j.val)/L (a-ν₁-j.val) := by sorry

end TauCeti.AutomorphicLFunctions.AL3

namespace TauCeti.AutomorphicLFunctions.AL5

/-- The complex coefficient adapter for f(z) - beta * f(p*z). -/
def pStabilizedCoeff (a : ℕ → ℂ) (p : ℕ) (β : ℂ) (n : ℕ) : ℂ :=
  a n - if p ∣ n then β * a (n / p) else 0

theorem pStabilizedCoeff.not_dvd (a : ℕ → ℂ) (p n : ℕ) (β : ℂ)
    (h : ¬ p ∣ n) : pStabilizedCoeff a p β n = a n := by sorry

theorem pStabilizedCoeff.mul (a : ℕ → ℂ) (p n : ℕ) (β : ℂ) (hp : 0 < p) :
    pStabilizedCoeff a p β (p * n) = a (p * n) - β * a n := by sorry

/-- Absolute summability justifies the change of index n = p*m. -/
theorem pStabilizedCoeff.LSeries (a χ : ℕ → ℂ) (p : ℕ) (β s : ℂ)
    (hp : 1 < p) (hχ : ∀ n, χ (p * n) = χ p * χ n)
    (hs : LSeriesSummable (fun n => χ n * a n) s) :
    LSeriesSummable (fun n => χ n * pStabilizedCoeff a p β n) s ∧
    LSeries (fun n => χ n * pStabilizedCoeff a p β n) s =
      (1 - β * χ p * (p : ℂ) ^ (-s)) * LSeries (fun n => χ n * a n) s := by sorry

example (a : ℕ → ℂ) (p : ℕ) (hp : 1 < p) (β : ℂ) :
    pStabilizedCoeff a p β 1 = a 1 := by sorry
example (a : ℕ → ℂ) (p : ℕ) (hp : 1 < p) (α β : ℂ)
    (h₁ : a 1 = 1) (hpcoeff : a p = α + β) :
    pStabilizedCoeff a p β p = α := by sorry
example (p : ℕ) (β s : ℂ) : (1 - β * (0 : ℂ) * (p : ℂ) ^ (-s) : ℂ) = 1 := by sorry

theorem FiniteEulerCorrection.orders {ι : Type*} (S : Finset ι) (P : ι → Polynomial ℂ)
    (q : ι → ℝ) (L : ℂ → ℂ) (s₀ : ℂ)
    (hE : MeromorphicAt (FiniteEulerCorrection S P q) s₀) (hL : MeromorphicAt L s₀) :
    meromorphicOrderAt (fun s => FiniteEulerCorrection S P q s*L s) s₀ =
      meromorphicOrderAt (FiniteEulerCorrection S P q) s₀+meromorphicOrderAt L s₀ := by sorry

theorem FiniteEulerCorrection.value {ι : Type*} (S : Finset ι) (P : ι → Polynomial ℂ)
    (q : ι → ℝ) (L Lpartial : ℂ → ℂ) (s₀ : ℂ)
    (hE : AnalyticAt ℂ (FiniteEulerCorrection S P q) s₀)
    (hL : AnalyticAt ℂ L s₀) (hL' : AnalyticAt ℂ Lpartial s₀)
    (h : Lpartial =ᶠ[𝓝[≠] s₀] fun s => FiniteEulerCorrection S P q s*L s) :
    Lpartial s₀ = FiniteEulerCorrection S P q s₀*L s₀ := by sorry

theorem EulerCorrectionLeadingTerm (E L : ℂ → ℂ) (s₀ : ℂ)
    (hE : DifferentiableAt ℂ E s₀) (hL : DifferentiableAt ℂ L s₀) (hz : E s₀ = 0) :
    deriv (fun s => E s*L s) s₀ = deriv E s₀*L s₀ := by sorry

theorem OrdinaryGl2EulerFactor.refinement (p : ℝ) (hp : 0 < p)
    (k j : ℕ) (hj : j ≤ k) (α χp χinvp εp : ℂ) (hα : α ≠ 0) :
    OrdinaryGl2EulerFactor p k j α χp χinvp εp =
      (1-χp*(p : ℂ)^j/α)*
      (1-χinvp*(εp*(p : ℂ)^(k+1)/α)/(p : ℂ)^(j+1)) := by sorry

/-- Scalar normalization and coefficient-field transport. The input `halg`
    is membership after the full period/Gauss/archimedean normalization,
    supplied by the critical-value algebraicity theorem;
    this comparison does not prove that theorem. -/
theorem CriticalValuePeriodInterface (E : Subfield ℂ)
    (completed finite gamma normalization : ℂ)
    (hgamma : gamma ≠ 0) (hnormalization : normalization ≠ 0)
    (h : completed = gamma*finite) (halg : finite/normalization ∈ E) :
    completed/(gamma*normalization) = finite/normalization ∧
      completed/(gamma*normalization) ∈ E := by sorry

end TauCeti.AutomorphicLFunctions.AL5

/-
Named signature omissions (the roadmap gives the full mathematics).

AutomorphicLFunctionsAndLocalFactors:AL.0/local-additive-self-duality
TauCeti.AutomorphicLFunctions.AL0.LocalAdditiveSelfDuality
  The declaration above specializes to the actual native real field. The full
  theorem also treats C and finite extensions of Q_p, with compact-open dual
  topology and continuous inverse. The finite-completion carrier and trace-dual
  comparison require the finite local-field and trace-dual carriers. The
  equal-characteristic residue construction is stated in AL.3; it is not
  derived from the number-field trace character.

AutomorphicLFunctionsAndLocalFactors:AL.0/local-schwartz-bruhat-space
Unavailable full input: SR.1 local-field Schwartz carrier, AA.0 adelic completion/trace topology, or their Fourier duality output.
TauCeti.SchwartzBruhat.LocalSpace.mem_iff_nonarch
  f ∈ S(F) iff ∃ r, supp f ⊆ P^{−r} ∧ f is P^r-periodic.
TauCeti.SchwartzBruhat.LocalSpace.indicator_integers_mem
  1_O ∈ S(F) with r = 0; 1_{O^×} ∈ S(F) with r = 1.

AutomorphicLFunctionsAndLocalFactors:AL.0/local-fourier-inversion
Unavailable full input: SR.1 local-field Schwartz carrier, AA.0 adelic completion/trace topology, or their Fourier duality output.
TauCeti.SchwartzBruhat.fourier_fourier
  Fix a nontrivial additive character ψ of F and identify F with its dual by y ↦ (x ↦ ψ(xy)). For f ∈ S(F), f̂(x) = ∫_F f(y)ψ(xy)dy lies in S(F), and f ↦ f̂ is a linear isomorphism of S(F). There is a unique Haar measure dx, the self-dual measure for ψ, with f̂̂(x) = f(−x). For β ∈ F^× and ψ_β(x) = ψ(βx), the self-dual measure for ψ_β is |β|^{1/2}dx, and the ψ_β-transform of f is |β|^{1/2}r(β)f̂. For F nonarchimedean the conductor ν(ψ) is the largest ν with ψ trivial on P^{−ν}. Distributions: ⟨λ̂, f⟩ = ⟨λ, f̂⟩.

AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-schwartz-bruhat-space
Unavailable full input: SR.1 local-field Schwartz carrier, AA.0 adelic completion/trace topology, or their Fourier duality output.
TauCeti.SchwartzBruhat.AdelicSpace
  S(𝔸_K) is the locally convex inductive limit over finite-place compact-open support/period levels of SchwartzMap(K_∞,ℂ) tensor the corresponding finite-dimensional spaces of finite-adelic functions. Equivalently the archimedean tensor product is completed; finite linear combinations of products of one-place functions are dense. They need not exhaust S(𝔸_K) when several archimedean places occur. Distinguished finite-place tensors are 1_{O_v} almost everywhere. Fourier transform and tensor distributions extend continuously from these dense products. Tate’s conditions 𝔷1–𝔷3 are analytic properties to prove for this space, not its definition.
TauCeti.SchwartzBruhat.AdelicSpace
  S(𝔸) is the locally convex inductive limit of finite-place support/period levels tensored with SchwartzMap(K∞,ℂ); the archimedean tensor factors are completed.
TauCeti.SchwartzBruhat.AdelicSpace.pure
  The factorizable function ⊗_v f_v, given f_v ∈ S(k_v) with f_v = f_v^o outside a finite set.
TauCeti.SchwartzBruhat.AdelicSpace.pure_apply
  (⊗ f_v)(x) = ∏_v f_v(x_v), a finite product for each x.
TauCeti.SchwartzBruhat.AdelicSpace.fourier_pure
  The global transform of ⊗ f_v is ⊗ f̂_v.
TauCeti.SchwartzBruhat.AdelicSpace.tateClass
  Every f ∈ S(𝔸) satisfies 𝔷1–𝔷3.
TauCeti.SchwartzBruhat.AdelicSpace.span_pure_dense
  Finite linear combinations of one-place factorizable functions are dense in S(𝔸); no algebraic spanning equality is asserted when several archimedean factors occur.
TauCeti.SchwartzBruhat.AdelicSpace.standard_mem
  f^o = ⊗_{v<∞} 1_{O_v} ⊗ ⊗_{v|∞} Gaussian lies in S(𝔸).
TauCeti.SchwartzBruhat.AdelicSpace.theta_rat
  For k = ℚ and f = 1_Ẑ ⊗ e^{−πx²}, Σ_{ξ∈ℚ} f(tξ) = Σ_{n∈ℤ} e^{−πt²n²} for t > 0.
TauCeti.SchwartzBruhat.AdelicSpace.pure_eq_zero
  If one local factor f_v is 0, then ⊗f_v = 0.
TauCeti.SchwartzBruhat.AdelicSpace.not_restricted
  The product ∏_p 1_{pℤ_p} is not in S(𝔸): infinitely many factors differ from f_p^o, and it is the indicator of the compact but not open set ∏_p pℤ_p ⊂ 𝔸_f, so it is not locally constant.

AutomorphicLFunctionsAndLocalFactors:AL.0/adelic-poisson-summation
Unavailable full input: SR.1 local-field Schwartz carrier, AA.0 adelic completion/trace topology, or their Fourier duality output.
TauCeti.SchwartzBruhat.poisson_summation
  Let k be a number field and ψ a nontrivial character of 𝔸/k with the self-dual measure on 𝔸. (i) The annihilator of k in 𝔸 under (x, y) ↦ ψ(xy) is k (Tate Theorem 4.1.4), and 𝔸/k has volume 1 (Tate p. 43). (ii) Poisson: if f is continuous and integrable, Σ_{ξ∈k} f(x + ξ) converges uniformly in x and Σ_{ξ∈k} |f̂(ξ)| converges, then Σ_{ξ∈k} f̂(ξ) = Σ_{ξ∈k} f(ξ) (Lemma 4.2.4). (iii) Riemann–Roch: if f satisfies 𝔷1–𝔷3 (for instance f ∈ S(𝔸)), then for every idele 𝔞, (1/|𝔞|) Σ_{ξ∈k} f̂(ξ/𝔞) = Σ_{ξ∈k} f(𝔞ξ) (Theorem 4.2.1).

AutomorphicLFunctionsAndLocalFactors:AL.0/point-supported-distributions
Unavailable full input: SR.1 local-field Schwartz carrier, AA.0 adelic completion/trace topology, or their Fourier duality output.
TauCeti.SchwartzBruhat.eq_sum_deriv_delta_of_dsupport_subset
  Let E = ℝⁿ. A tempered distribution λ ∈ 𝓢′(E, ℂ) with dsupport λ ⊆ {0} is a finite linear combination Σ_{|α|≤N} c_α ∂^αδ₀. For n = 1 (F = ℝ) the F^×-finite ones are ⊕_k ℂ·D^kδ₀; for n = 2 written in x, x̄ (F = ℂ) they are ⊕_{k,l} ℂ·D^kD̄^lδ₀, D = ∂/∂x, D̄ = ∂/∂x̄.

AutomorphicLFunctionsAndLocalFactors:AL.1/local-quasicharacter-conductor
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.TateZeta.QuasiChar.exponent
  The real σ with |ω(x)| = |x|^σ.
TauCeti.TateZeta.QuasiChar.isUnramified_iff
  ω unramified iff ω = ω_s for some s, unique modulo 2πi/log q.
TauCeti.TateZeta.QuasiChar.conductor
  c(ω) ∈ ℕ: 0 if unramified, otherwise the least c ≥ 1 with ω|_{1+P^c} = 1.
TauCeti.TateZeta.QuasiChar.conductor_mul_absPow
  c(ωω_s) = c(ω).
TauCeti.TateZeta.QuasiChar.archNormalForm
  At ℝ, ℂ: ω = x^{−a}(x̄^{−b})·ω_s with the stated constraints, uniquely.
TauCeti.TateZeta.QuasiChar.absPow_isUnramified
  ω_s is unramified with c = 0, and ω_s(ϖ) = q^{−s}.
TauCeti.TateZeta.QuasiChar.conductor_dirichlet
  For p odd and χ a primitive Dirichlet character mod p^n, the induced ω on ℚ_p^× (ω(p) = 1) has c(ω) = n.
TauCeti.TateZeta.QuasiChar.sgn_normalForm
  At ℝ, sgn = x^{−1}·ω_1: a = 1 and s = 1 in (3.18).
TauCeti.TateZeta.QuasiChar.one_conductor
  The trivial character has exponent 0 and conductor 0.
TauCeti.TateZeta.QuasiChar.not_unramified_teichmuller
  The Teichmüller-type character of ℤ_p^× (p odd) extended by ω(p) = 1 is ramified with conductor 1, although it is trivial on 1 + pℤ_p.

AutomorphicLFunctionsAndLocalFactors:AL.1/local-zeta-integral
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.TateZeta.zetaIntegral_integrable
  Absolute convergence for Re s > 0.
TauCeti.TateZeta.differentiableOn_zetaIntegral
  s ↦ z(s, ω; f) is holomorphic on Re s > 0.
TauCeti.TateZeta.zetaIntegral_ramified_integers
  ω ramified: z(s, ω; 1_O) = 0, since ∫_{O^×} ω d^×x = 0 on every annulus.

AutomorphicLFunctionsAndLocalFactors:AL.1/eigendistribution-space
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.TateZeta.eigenSpace_restrict_exact
  The left exact sequence (3.2).
TauCeti.TateZeta.zetaDistribution_mem
  z(s, ω) ∈ S′(ωω_s) for Re s > 0.
TauCeti.TateZeta.delta_mem_eigenSpace_one
  δ₀ ∈ S′(1).
TauCeti.TateZeta.haar_restrict_mem
  f ↦ ∫ f(x)ω(x)d^×x on C_c^∞(F^×) is an ω-eigendistribution.
TauCeti.TateZeta.delta_not_mem
  For ω ≠ 1, δ₀ ∉ S′(ω), since r′(a)δ₀ = δ₀.
TauCeti.TateZeta.zetaDistribution_mem_eigenSpace
  z(s, ω) ∈ S′(ωω_s) for Re s > 0: its eigencharacter is ωω_s, not ω.

AutomorphicLFunctionsAndLocalFactors:AL.1/restriction-to-punctured-line
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.TateZeta.eigen_restrict_eq_smul_haar
  The space C_c^∞(F^×)′(ω) of ω-eigendistributions on C_c^∞(F^×) is one-dimensional, spanned by ω(x)d^×x. Hence for λ ∈ S′(ω) there is c ∈ ℂ with ⟨λ, f⟩ = c∫_{F^×} f(x)ω(x)d^×x for all f with compact support in F^×.

AutomorphicLFunctionsAndLocalFactors:AL.1/eigendistributions-supported-at-zero
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.TateZeta.eigenSpaceZero_eq
  (i) F nonarchimedean: the distributions supported at 0 are ℂ·δ₀, and δ₀ ∈ S′(ω₀) for the trivial ω₀; S′(ω)₀ = 0 for ω ≠ ω₀. (ii) F = ℝ, D = d/dx: the F^×-finite distributions supported at 0 are ⊕_{k≥0} ℂ·D^kδ₀, and S′(ω)₀ = ℂ·D^kδ₀ if ω(x) = x^{−k}, 0 otherwise. (iii) F = ℂ, D = ∂/∂x, D̄ = ∂/∂x̄: they are ⊕_{k,l≥0} ℂ·D^kD̄^lδ₀, and S′(ω)₀ = ℂ·D^kD̄^lδ₀ if ω(x) = x^{−k}x̄^{−l}, 0 otherwise.

AutomorphicLFunctionsAndLocalFactors:AL.1/unramified-local-theory
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.TateZeta.zetaIntegral_eq_L_mul_normalized
  Let F be nonarchimedean and ω unramified with ω(ϖ) = t; put L(s, ω) = (1 − tq^{−s})^{−1}. For τ = [1] − [ϖ^{−1}] ∈ ℤ[F^×] and f ∈ S(F), r(τ)f = f − r(ϖ^{−1})f has compact support in F^×, so ⟨z₀(s, ω), f⟩ = ∫_{F^×}(r(τ)f)(x)ωω_s(x)d^×x (3.5) is entire in s and z₀(s, ω) ∈ S′(ωω_s). When ‖tq^(−s)‖<1, equivalently Re(s)>log‖t‖/log q, z(s, ω) = L(s, ω)z₀(s, ω) (3.6); this identity continues z(s, ω) meromorphically to ℂ. For unitary ω the convergence region is Re(s)>0. With f^o = 1_O, ⟨z₀(s, ω), f^o⟩ = 1 for all s (3.8); so z₀(s, ω) is never zero, z(s, ω; f)/L(s, ω) is entire for every f, and for each s some f (namely f^o) makes it nonzero: L(s, ω) is the greatest common denominator of the zeta integrals (3.9).

AutomorphicLFunctionsAndLocalFactors:AL.1/invariant-distributions-exceptional-case
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.TateZeta.eigenSpace_one_eq_span_delta
  At a finite place, the F^×-invariant distributions S′(ω₀) form the line ℂ·δ₀, although (3.11) only bounds the dimension by 2. The distribution ⟨λ₀, f⟩ = ⟨d^×x, f − f(0)f^o⟩ (3.12) is an O^×-invariant preimage of d^×x with ⟨λ₀, f^o⟩ = 0, and r′(ϖ)λ₀ = λ₀ − δ₀ (3.13). So F^× acts on the span of δ₀, λ₀ through x ↦ [[1, −ord x], [0, 1]] (3.14), a non-semisimple representation whose invariants are ℂ·δ₀; d^×x does not extend to an F^×-invariant distribution on S(F).

AutomorphicLFunctionsAndLocalFactors:AL.1/ramified-local-theory
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.TateZeta.zetaIntegral_entire_of_ramified
  Let F be nonarchimedean and ω ramified with conductor c. For f ∈ S(F), ∫_{F^× − P^n} f(x)ωω_s(x)d^×x is independent of n for n large, which continues z(s, ω; f) to an entire function; z₀(s, ω) := z(s, ω) is a basis vector of S′(ωω_s) for every s (3.15), and L(s, ω) := 1 (3.16). The standard function f^o = ω^{−1}·1_{O^×} (3.17) has ⟨z₀(s, ω), f^o⟩ = 1, so the gcd property (3.9) holds.

AutomorphicLFunctionsAndLocalFactors:AL.1/archimedean-local-theory
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.TateZeta.archimedean_normalized_entire
  F = ℝ: for ω(x) = x^{−a}, a ∈ {0, 1}, put L(s, ω) = π^{−s/2}Γ(s/2) (3.19) and f^o = f_a = x^a e^{−πx²}. F = ℂ: for ω(x) = x^{−a}x̄^{−b}, min(a, b) = 0, put L(s, ω) = (2π)^{1−s}Γ(s) (3.21) and f^o = f_{a,b} = x^a x̄^b e^{−2πxx̄}. Then (i) z₀(s, ω) := L(s, ω)^{−1}z(s, ω) continues to an entire function of s and is a basis vector of S′(ωω_s) for every s; (ii) ⟨z₀(s, ω), f^o⟩ = 1. (iii) z(s, ω) is meromorphic with simple poles exactly at the poles of L(s, ω): at F = ℝ, s = −r with r ∈ 2ℤ_{≥0}, residue a nonzero multiple of D^{a+r}δ₀ ∈ S′(ωω_{−r}); at F = ℂ, s = −r with r ∈ ℤ_{≥0}, residue a nonzero multiple of D^{a+r}D̄^{b+r}δ₀. At a pole the constant term of the Laurent expansion extends ωω_{−r}(x)d^×x to S(F) but not to an element of S′(ωω_{−r}).

AutomorphicLFunctionsAndLocalFactors:AL.1/local-uniqueness-theorem
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.TateZeta.finrank_eigenSpace_eq_one
  For every quasi-character ω of F^×, the space S′(ω) of ω-eigendistributions on S(F) is one-dimensional. Writing ω = ω′ω_s with ω′ a character (or an archimedean normal form), it is spanned by z₀(s, ω′).

AutomorphicLFunctionsAndLocalFactors:AL.1/fourier-transform-eigendistribution
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.TateZeta.fourier_mem_eigenSpace
  If λ ∈ S′(ω), then λ̂ ∈ S′(ω^{−1}ω₁), where ω₁(x) = |x| and ⟨λ̂, f⟩ = ⟨λ, f̂⟩. Consequently ẑ₀(s, ω) is a multiple of z₀(1 − s, ω^{−1}).

AutomorphicLFunctionsAndLocalFactors:AL.1/local-epsilon-gamma-factors
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.TateZeta.epsilonFactor_twist
  (3.28): ε(s, ωω_t, ψ) = ε(s + t, ω, ψ).
TauCeti.TateZeta.epsilonFactor_smul_char
  (3.29): ε(s, ω, ψ_β) = |β|^{s−1/2}ω(β)ε(s, ω, ψ).
TauCeti.TateZeta.epsilonFactor_mul_inv
  ε(s, ω, ψ)ε(1 − s, ω^{−1}, ψ) = ω(−1).
TauCeti.TateZeta.norm_epsilonFactor_half
  |ε(1/2, ω, ψ)| = 1.
TauCeti.TateZeta.epsilonFactor_unramified_zero
  ω unramified, ν(ψ) = 0: ε(s, ω, ψ) = 1, as f̂^o = f^o.
TauCeti.TateZeta.epsilonFactor_real_sign
  F = ℝ, ω = x^{−1}, ψ = e: ε = i and γ(s, x^{−1}, e) = iΓ_ℝ(3 − s)/Γ_ℝ(s) (ω^{−1} = x = x^{−1}ω₂).
TauCeti.TateZeta.epsilonFactor_trivial_twist
  ε(s, ω_t, ψ) = ε(s + t, 1, ψ) with the same ψ.
TauCeti.TateZeta.epsilonFactor_depends_on_psi
  ε is not independent of ψ: at a finite place ε(s, 1, ψ_ϖ) = q^{1/2−s}ε(s, 1, ψ) by (3.29).

AutomorphicLFunctionsAndLocalFactors:AL.1/local-functional-equation
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.TateZeta.zetaIntegral_fourier_one_sub
  For every f ∈ S(F), as meromorphic functions of s, z(1 − s, ω^{−1}; f̂) = γ(s, ω, ψ)z(s, ω; f) (3.25); equivalently z(1 − s, ω^{−1}; f̂)/L(1 − s, ω^{−1}) = ε(s, ω, ψ)·z(s, ω; f)/L(s, ω) (3.24), both sides entire. In Tate's form (Theorem 2.4.1): every ζ-function continues to all quasi-characters by ζ(f, c) = ρ(c)ζ(f̂, ĉ), ĉ = |·|c^{−1}, with ρ independent of f.

AutomorphicLFunctionsAndLocalFactors:AL.1/local-gauss-sum
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.TateZeta.fourier_standard_ramified
  (3.31): f̂^o(x) = 𝔤 q^{−(ν+c)/2} conj(f^o(ϖ^{ν+c}x)).
TauCeti.TateZeta.localGaussSum_mul_conj
  𝔤(ω, ψ)·conj 𝔤(ω, ψ) = 1.
TauCeti.TateZeta.localGaussSum_uniformizer
  ω(ϖ^{ν+c})𝔤(ω, ψ) is independent of ϖ.
TauCeti.TateZeta.localGaussSum_eq_gaussSum
  For c = 1 it is q^{−1/2} times Mathlib's gaussSum of the residue characters.
TauCeti.TateZeta.localGaussSum_padic_conductor_one
  F = ℚ_p, c = 1, ν = 0: 𝔤 = p^{−1/2}·gaussSum(χ^{−1}, ψ₁) with χ = ω|_{ℤ_p^×} on 𝔽_p^× and ψ₁(a) = ψ(a/p).
TauCeti.TateZeta.norm_localGaussSum
  |𝔤(ω, ψ)| = 1, recovering |gaussSum| = √p for c = 1.
TauCeti.TateZeta.fourier_standard_support
  f̂^o(x) = 0 whenever ord x ≠ −ν − c.
TauCeti.TateZeta.localGaussSum_wrong_shift
  With ϖ^(−ν−c+1) the integral vanishes. For c>1 use the last nontrivial principal-unit quotient; for c=1 the additive phase is constant on O× and the nontrivial residue character sums to0.

AutomorphicLFunctionsAndLocalFactors:AL.1/explicit-epsilon-factors
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.TateZeta.epsilonFactor_explicit
  (i) F nonarchimedean, ω unramified, ν(ψ) = ν: ε(s, ω, ψ) = ω(ϖ^ν)q^{(1/2−s)ν}. (ii) ω ramified with conductor c: ε(s, ω, ψ) = ω(ϖ^{ν+c})q^{(1/2−s)(ν+c)}𝔤(ω, ψ). (iii) F = ℝ, ω(x) = x^{−a}, a ∈ {0, 1}, ψ = e: ε(s, ω, ψ) = i^a. (iv) F = ℂ, ω(x) = x^{−a}x̄^{−b}, min(a, b) = 0, ψ = e(x + x̄): ε(s, ω, ψ) = i^{max(a,b)}. In Tate's normalisation (ψ with conductor 𝔡^{−1}, so ν = ord 𝔡): ρ(|·|^s) = N𝔡^{s−1/2}(1 − q^{s−1})/(1 − q^{−s}) and ρ(c|·|^s) = N(𝔡𝔣)^{s−1/2}ρ₀(c) for ramified c with conductor 𝔣 and c(π) = 1.

AutomorphicLFunctionsAndLocalFactors:AL.1/global-eigendistributions
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.TateZeta.finrank_globalEigenSpace_eq_one
  A restricted family of continuous local distributions normalized on almost every standard vector defines a continuous restricted-tensor distribution. A nonzero global ω-eigendistribution factors into the local eigenlines and the global eigenline has dimension1. No factorization converse is asserted for arbitrary distributions: a sum of two independent product distributions need not be decomposable.

AutomorphicLFunctionsAndLocalFactors:AL.1/global-zeta-integral
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.TateZeta.globalZetaIntegral_integrable
  Absolute convergence for Re s > 1.
TauCeti.TateZeta.globalZetaIntegral_pure
  (4.2): for f = ⊗f_v, z(s, ω; f) = ∏_v z(s, ω_v; f_v).
TauCeti.TateZeta.globalZetaIntegral_eq_completed_mul
  (4.3): z(s, ω; f) = Λ(s, ω)⟨z₀(s, ω), f⟩ for Re s > 1.
TauCeti.TateZeta.globalZetaIntegral_act
  z(s, ω; r(a)f) = (ωω_s)(a)^{−1}z(s, ω; f), and = z(s, ω; f) for a ∈ k^×.
TauCeti.TateZeta.globalZetaIntegral_rat_standard
  k = ℚ, ω = 1, f^o = 1_Ẑ ⊗ e^{−πx²}: z(s, 1; f^o) = completedRiemannZeta s for Re s > 1.
TauCeti.TateZeta.globalZetaIntegral_unramified_factor
  At v ∉ S the factor of z(s, ω; f^o) is (1 − ω_v(ϖ_v)q_v^{−s})^{−1}.
TauCeti.TateZeta.globalZetaIntegral_not_convergent
  For k = ℚ, ω = 1, f = f^o the integral diverges at s = 1 (the pole of ζ): Re s > 1 cannot be relaxed.

AutomorphicLFunctionsAndLocalFactors:AL.1/completed-hecke-l-function
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.TateZeta.partialHeckeL_eq_LSeries
  L^S(s, ω) = Σ_{(𝔞, S) = 1} χ(𝔞)N𝔞^{−s} for Re s > 1.
TauCeti.TateZeta.completedHeckeL_eq_globalZeta
  Λ(s, ω) = z(s, ω; f^o) for the standard f^o.
TauCeti.TateZeta.completedHeckeL_rat_one
  k = ℚ, ω = 1: Λ(s, 1) = completedRiemannZeta s.
TauCeti.TateZeta.completedHeckeL_dirichlet
  k = ℚ, ω attached to a primitive Dirichlet character χ: L_∞ = Γ_ℝ(s) (χ even) or Γ_ℝ(s + 1) (χ odd, ω_∞ = sgn = x^{−1}ω₁), which is Mathlib's DirichletCharacter.gammaFactor, and Λ(s, ω) = gammaFactor χ s · LFunction χ s.
TauCeti.TateZeta.partialHeckeL_trivial_char
  ω = 1: L^{S_∞}(s, 1) is the Dedekind zeta function NumberField.dedekindZeta.

AutomorphicLFunctionsAndLocalFactors:AL.1/idele-class-volume
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.TateZeta.volume_fundamentalDomain_eq
  With Tate's measures (d^×α = (N𝔭/(N𝔭 − 1))|α|^{−1}dα at finite v, so vol(O_v^×) = N𝔡_v^{−1/2}; dα/|α| at real v; 2r dr dθ/r² at complex v), the product decomposition 𝔸^× = T × J (T ≅ ℝ_{>0} at a chosen archimedean place, dt/t) and d^×𝔞 = (dt/t)·d^×𝔟, the fundamental domain E for J/k^× built from the units and h ideal-class representatives satisfies (1) J = ⊔_{α∈k^×}αE and (2) vol(E) = κ = 2^{r₁}(2π)^{r₂}hR/(w√|d|), where R is the regulator, h the class number, w the number of roots of unity and d the discriminant. κ agrees with the arithmetic expression defining native NumberField.dedekindZeta_residue K; Mathlib already proves its real one-sided residue identification via NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT. The extra analytic task is its comparison with this adelic measure and the full complex Tate continuation. Discreteness and compactness are imported from GlobalNumberFields, not reproved here. A change to finite multiplicative unit-volume1 rescales κ by sqrt(|d|).

AutomorphicLFunctionsAndLocalFactors:AL.1/tate-lemma-a
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.TateZeta.zetaSlice_add_eq
  For f ∈ S(𝔸) (or Tate's class 𝔷), a quasi-character c of 𝔸^×/k^× and t > 0, put ζ_t(f, c) = ∫_J f(t𝔟)c(t𝔟)d^×𝔟. Then ζ_t(f, c) + f(0)∫_E c(t𝔟)d^×𝔟 = ζ_{1/t}(f̂, ĉ) + f̂(0)∫_E ĉ(𝔟/t)d^×𝔟, with ĉ = |·|c^{−1}.

AutomorphicLFunctionsAndLocalFactors:AL.1/tate-lemma-b
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.TateZeta.integral_fundamentalDomain_char
  For a quasi-character c of 𝔸^×/k^× and t > 0: ∫_E c(t𝔟)d^×𝔟 = κt^s if c = |·|^s on 𝔸^× (c trivial on J), and 0 if c is nontrivial on J.

AutomorphicLFunctionsAndLocalFactors:AL.1/tate-global-functional-equation
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.TateZeta.globalZeta_functional_equation
  For f ∈ S(𝔸) (more generally f ∈ 𝔷), ζ(f, c) continues from exponent > 1 to a meromorphic, single-valued function on every class {c₀|·|^s} of quasi-characters of 𝔸^×/k^×. It is holomorphic except, when c₀ is trivial on J (c = |·|^s), for simple poles at s = 0 and s = 1 with residues −κf(0) and κf̂(0). It satisfies ζ(f, c) = ζ(f̂, ĉ), ĉ = |·|c^{−1}; explicitly ζ(f, c) = ∫_1^∞ζ_t(f, c)dt/t + ∫_1^∞ζ_t(f̂, ĉ)dt/t + [κf̂(0)/(s − 1) − κf(0)/s], the bracket present only when c = |·|^s. In distributions (Kudla Theorem 4.3): z(s, ω) continues meromorphically and ẑ(1 − s, ω^{−1}) = z(s, ω).

AutomorphicLFunctionsAndLocalFactors:AL.1/global-epsilon-factor
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.TateZeta.globalEpsilon_eq_conductor
  ε(s, ω) = ε(1/2, ω)(|d_k|N𝔣(ω))^{1/2−s}.
TauCeti.TateZeta.fourier_globalNormalized
  (4.7): ẑ₀(1 − s, ω^{−1}) = ε(s, ω)z₀(s, ω).
TauCeti.TateZeta.globalEpsilon_rat_one
  k = ℚ, ω = 1: ε(s, 1) = 1.
TauCeti.TateZeta.globalEpsilon_dirichlet
  k = ℚ, ω attached to a primitive Dirichlet character of conductor N: ε(s, ω) = N^{1/2−s}ε(1/2, ω), the N-power in Mathlib's DirichletCharacter.IsPrimitive.completedLFunction_one_sub; ε(1/2, ω) is the product of the p | N Gauss-sum factors and i^a at ∞, to be matched with rootNumber through the ω ↔ χ^{±1} dictionary of GlobalNumberFields Layer 9.
TauCeti.TateZeta.globalEpsilon_unramified_everywhere
  ω unramified everywhere and k = ℚ: ε(s, ω) = i^{a} with a from ω_∞.
TauCeti.TateZeta.localEpsilon_not_global
  A single local factor ε_v(s, ω_v, ψ_v) does depend on ψ_v (3.29); only the product over all places is independent.

AutomorphicLFunctionsAndLocalFactors:AL.1/hecke-l-functional-equation
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.TateZeta.completedHeckeL_one_sub
  For a character ω of 𝔸^×/k^×, Λ(s, ω) continues to a meromorphic function on ℂ with Λ(s, ω) = ε(s, ω)Λ(1 − s, ω^{−1}). Λ(s, ω) is entire unless ω = |·|^{iu} for some real u, in which case its only poles are simple, at s = −iu and s = 1 − iu. Equivalently (Tate §4.5) Hecke's ζ(s, χ) = Σ_{(𝔞,S)=1}χ(𝔞)N𝔞^{−s} continues and satisfies ζ(1 − s, χ^{−1}) = ∏_{v∈S}ρ_v(c̃_v|·|^{s+it_v})·∏_{v∉S}χ(𝔡_v)N𝔡_v^{s−1/2}·ζ(s, χ).

AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-convergence
Unavailable full input: SR.1 smooth/Casselman–Wallach representation and AF.1 cuspidal/global parameter carriers; a ramified comparison takes an actual compatible parameter as an input.
TauCeti.AutomorphicLFunctions.AL2.GodementJacquetConvergence
  For fixed π,β,Φ the Godement–Jacquet integral converges absolutely for Re(s)>c_π, locally uniformly there with every s-derivative obtained by insertion of powers of log|det g|.

AutomorphicLFunctionsAndLocalFactors:AL.2/standard-local-l-factor
Unavailable full input: SR.1 smooth/Casselman–Wallach representation and AF.1 cuspidal/global parameter carriers; a ramified comparison takes an actual compatible parameter as an input.
TauCeti.AutomorphicLFunctions.AL2.StandardLocalLFactor.normalized_zeta
  Every Z/L is entire; at each s₀ some quotient is nonzero.

AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-functional-equation
Unavailable full input: SR.1 smooth/Casselman–Wallach representation and AF.1 cuspidal/global parameter carriers; a ramified comparison takes an actual compatible parameter as an input.
TauCeti.AutomorphicLFunctions.AL2.GodementJacquetFunctionalEquation
  With positive trace Fourier transform Φ̂(Y)=∫Φ(X)ψ(tr(XY))dX and self-dual additive measure, Z(1−s,β̌,Φ̂)/L(1−s,π∨)=ε(s,π,ψ)Z(s,β,Φ)/L(s,π), β̌(g)=β(g^(−1)). ε is a nonzero monomial in q^(−s) at finite places.

AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-newform-test
Unavailable full input: SR.1 smooth/Casselman–Wallach representation and AF.1 cuspidal/global parameter carriers; a ramified comparison takes an actual compatible parameter as an input.
TauCeti.AutomorphicLFunctions.AL2.GodementJacquetNewformTest
  Let π be a ramified generic representation of GL_n(F), F nonarchimedean, with conductor c>0, normalized newvectors v°,v̌° and β(g)=⟨π(g)v°,v̌°⟩, β(1)=1. Let Φ(X)=ω_π(X_nn)^(−1)/vol K₀(P^c) when X∈Mat_n(O), X_nj∈P^c for j<n, X_nn∈O×, and 0 otherwise. Then Z(s,β,Φ)=L(s,π).

AutomorphicLFunctionsAndLocalFactors:AL.2/global-godement-jacquet
Unavailable full input: SR.1 smooth/Casselman–Wallach representation and AF.1 cuspidal/global parameter carriers; a ramified comparison takes an actual compatible parameter as an input.
TauCeti.AutomorphicLFunctions.AL2.GlobalGodementJacquet
  For a unitary cuspidal π of GL_n(𝔸_K), the finite standard Euler product converges absolutely for Re(s)>1. The completed Λ(s,π)=∏_v L(s,π_v) has meromorphic continuation and Λ(s,π)=ε(s,π)Λ(1−s,π∨). If n≥2 it is entire. For n=1 its only possible poles are the Tate norm-character poles. The product of local epsilon factors is independent of the global additive character.

AutomorphicLFunctionsAndLocalFactors:AL.3/whittaker-compact-parameter-estimates
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.
TauCeti.AutomorphicLFunctions.AL3.WhittakerCompactParameterEstimates
  For a compact parameter set Ω in a fixed induced Casselman–Wallach family, there is M such that for every enveloping-algebra differential operator X there is a continuous seminorm ν_X with |ρ(X)W_{u,f}(g)|≤||g||^Mν_X(f) for u∈Ω. Sharper torus estimates give arbitrary decay in the simple-root directions after the prescribed moderate-growth factors.

AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-integrals
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.
TauCeti.AutomorphicLFunctions.AL3.RsLocalIntegrals.bilinear
  Ψ_j is bilinear on convergent inputs; equal rank is also linear in Φ.

AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-convergence
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.
TauCeti.AutomorphicLFunctions.AL3.RsLocalConvergence
  For fixed generic π_n,π_m, all Ψ_j converge absolutely in a right half-plane, locally uniformly in s; at infinity they are jointly continuous bilinear forms on the smooth Fréchet models, extending to the completed projective tensor product. If both irreducible generic inputs are unitary, the local integrals converge absolutely for Re(s)≥1; this closed boundary estimate is needed in the strong multiplicity-one argument.

AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-factor
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.
TauCeti.AutomorphicLFunctions.AL3.RsLocalFactor.normalize
  Ψ/L is entire for every permitted test input.
TauCeti.AutomorphicLFunctions.AL3.RsLocalFactor.nonvanishing
  At each s₀ some normalized test input has nonzero value.
TauCeti.AutomorphicLFunctions.AL3.RsLocalFactor.rank_one
  For m=1 the factor is the standard L-factor of the character twist of π.
TauCeti.AutomorphicLFunctions.AL3.RsLocalFactor.ramified_product
  Two ramified characters can have unramified product; multiplying their separate standard L-factors does not compute the tensor L-factor.

AutomorphicLFunctionsAndLocalFactors:AL.3/rs-local-functional-equation
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.
TauCeti.AutomorphicLFunctions.AL3.RsLocalFunctionalEquation
  There is a unique γ(s,π_n×π_m,ψ) such that the dual Ψ_{n−m−1−j}(1−s,R(w_{n,m})W̃,W̃′) equals ω_{π_m}(−1)^(n−1)γ(s,π_n×π_m,ψ)Ψ_j(s,W,W′). At equal rank include the self-dual Fourier transform Φ̂. Put γ=ε L(1−s,π_n∨×π_m∨)/L(s,π_n×π_m).

AutomorphicLFunctionsAndLocalFactors:AL.3/rs-archimedean-realization
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.
TauCeti.AutomorphicLFunctions.AL3.RsArchimedeanRealization
  For the ordered induced Whittaker-type representations of Jacquet Theorem2.6, every m(s)=h(s)L(s,σ⊗σ′) in the space L(σ⊗σ′) is represented by the completed projective tensor RS integral when n>m, and by a finite sum of such integrals with Schwartz Φ_i when n=m. Here h is entire and, on every finite vertical strip, P(s)m(s) is bounded whenever P is a polynomial clearing the poles of L on that strip. For irreducible induced representations and m=n−1 or m=n, L itself is a finite sum of K-finite test integrals (Gaussian-polynomial Φ_i when n=m). No arbitrary-entire-multiple claim, arbitrary-rank-gap K-finite claim, or reducible-input extension of Theorem2.7 is made.

AutomorphicLFunctionsAndLocalFactors:AL.3/rs-unramified-test
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.
TauCeti.AutomorphicLFunctions.AL3.RsUnramifiedTest
  For finite F, ψ of conductor O, normalized spherical W°,W′° with value1 at identity, and Φ°=1_{O^n} at equal rank, Ψ_0(s,W°,W′°)=L(s,π×π′). At equal rank use Ψ(s,W°,W′°,Φ°). At ramified π and spherical π′ the essential/newform test uses the conductor-dependent Φ of Humphries (3.10), not blindly 1_{O^n}.

AutomorphicLFunctionsAndLocalFactors:AL.4/partial-l-product-convergence
Unavailable full input: RG2.5 L-group and IHG.3 Satake parameter carriers, AF.1 parameter comparison, and ADS convergence output.
TauCeti.AutomorphicLFunctions.AL4.PartialLProductConvergence
  For a unitarizable automorphic π and finite-dimensional r as in Borel13.2, excluding ramified places gives L^S(s,π,r)=∏_{v∉S}P_{t_v,r}(q_v^(−s))^(−1), absolutely convergent for Re(s)>c(π,r). No general continuation or functional equation follows for arbitrary r.

AutomorphicLFunctionsAndLocalFactors:AL.4/local-parameter-comparison
Unavailable full input: RG2.5 L-group and IHG.3 Satake parameter carriers, AF.1 parameter comparison, and ADS convergence output.
Hypotheses: Preserve the arithmetic normalization dictionary: the classical weight-k Euler factor uses M=ρ_f^∨ with geometric Frobenius and converts to unitary normalization by the (k−1)/2 shift. In the cited Hilbert instance WD(ρ_π) corresponds to Rec(π⊗|·|^(−1/2)), hence L(WD(ρ_π),s)=L(s−1/2,π). Neither supplier asserts an unshifted equality for ρ itself.
TauCeti.AutomorphicLFunctions.AL4.LocalParameterComparison
  For GL_n standard factors and GL_n×GL_m tensor factors, whenever an actual local Langlands parameter with L/ε compatibility is given, the analytic factors from AL.2/AL.3 equal the Weil–Deligne factors. At an unramified place this reduces to P=det(1−T Fr). For a general L-group r, ramified factors require an actual parameter and are not defined from a spherical class.

AutomorphicLFunctionsAndLocalFactors:AL.3/global-whittaker-factorization
Unavailable full input: actual AF.3 smooth cusp space, AA.2 compact unipotent/automorphic quotient integrals, AF.2 restricted tensor realization and continuous local Whittaker uniqueness. Fourier reconstruction precedes global genericity, factorization and ordinary multiplicity one; no AF.3 genericity theorem is assumed.
TauCeti.AutomorphicLFunctions.AL3.GlobalWhittakerFactorization
For a cuspidal π of GL_n(𝔸_K), Fourier reconstruction makes φ↦W_φ an injective Whittaker realization; hence π and every local component are generic. With quotient volume 1, continuous local Whittaker uniqueness and a fixed Flath restricted tensor realization, a factorizable φ has W_φ=∏_v W_v, after fixing one global scalar; almost all W_v are normalized spherical. At infinite places extend continuously from dense tensors. An arbitrary global cusp vector or distribution is not asserted decomposable.
Hypotheses: π is an irreducible cuspidal automorphic representation with AF.2 Flath factorization. Its global genericity is proved from gln-fourier-expansion, not requested from AF.3. At infinite places use the continuous Whittaker functional on the smooth moderate-growth globalization; uniqueness of arbitrary algebraic functionals on the Harish–Chandra module is not the theorem. The function-field spherical specialization is Yu §5.3.1.
TauCeti.AutomorphicLFunctions.AL3.GlobalWhittakerFactorization.generic: Every irreducible cuspidal π and its local components possess a nonzero Whittaker functional for the fixed nontrivial character.
TauCeti.AutomorphicLFunctions.AL3.GlobalWhittakerFactorization.pure_tensor: A pure tensor has the product Whittaker function with the fixed global scalar and almost-all spherical normalization.

AutomorphicLFunctionsAndLocalFactors:AL.3/gln-fourier-expansion
Unavailable full input: actual AF.3 smooth cusp space, AA.2 compact unipotent/automorphic quotient integrals, AF.2 restricted tensor realization and continuous local Whittaker uniqueness. Fourier reconstruction precedes global genericity, factorization and ordinary multiplicity one; no AF.3 genericity theorem is assumed.
TauCeti.AutomorphicLFunctions.AL3.GlnFourierExpansion
For a smooth cuspidal φ of GL_n(𝔸_K), n≥2, define W_φ(g)=∫_{N_n(K)\N_n(𝔸_K)}φ(ug)ψ_N(u)⁻¹du, with quotient volume 1. Then φ(g)=Σ_{γ∈N_{n−1}(K)\GL_{n−1}(K)}W_φ(diag(γ,1)g), with locally uniform absolute convergence in the smooth cuspidal setting. In particular φ↦W_φ is injective and equivariant. Global genericity and factorization are subsequent consequences, not hypotheses of this expansion.
Hypotheses: K is a number field in Cogdell Lecture 4; use a nontrivial global additive character and AF.3 smooth cuspidality/rapid decay. The same successive compact-unipotent Fourier argument gives the function-field version used in Yu §5.3.1; that source invokes Fourier reconstruction before factorization. At infinite places use smooth moderate-growth globalizations and the derivative estimates needed for the stated convergence. A vanishing cuspidal constant term is essential.
TauCeti.AutomorphicLFunctions.AL3.GlnFourierExpansion.injective: W_φ=W_φ′ implies φ=φ′ for smooth cusp forms with the fixed character and measure.
TauCeti.AutomorphicLFunctions.AL3.GlnFourierExpansion.equivariant: W_{R(h)φ}(g)=W_φ(gh).

AutomorphicLFunctionsAndLocalFactors:AL.3/global-multiplicity-one
TauCeti.AutomorphicLFunctions.AL3.GlobalMultiplicityOne
For an irreducible admissible smooth representation π of GL_n(𝔸_K), K a number field, its multiplicity in the smooth cuspidal spectrum with fixed central character is at most one. If π is cuspidal, the multiplicity is one: any two nonzero equivariant embeddings into that cusp space differ by a nonzero scalar and have the same image. This is the ordinary multiplicity theorem; it assumes the same global representation, rather than cofinite local agreement.
Hypotheses: n≥1; K a number field; characteristic-zero complex automorphic forms. Work with the unitary central-character Hilbert realization or an explicitly fixed norm twist. Use continuous equivariant embeddings and continuous Whittaker functionals on the smooth moderate-growth globalizations at infinity. Compare smooth and Hilbert cusp multiplicities by the dense smooth-vector realization in AF.3’s cuspidal Hilbert subspace, using AF.1 globalization and AF.2 restricted tensors. Prove this comparison here as part of the multiplicity theorem.
TauCeti.AutomorphicLFunctions.AL3.GlobalMultiplicityOne.embeddings: Two nonzero equivariant embeddings of π into the fixed smooth cusp space differ by c∈ℂ×.
TauCeti.AutomorphicLFunctions.AL3.GlobalMultiplicityOne.same_image: The ranges of those two embeddings coincide.
TauCeti.AutomorphicLFunctions.AL3.GlobalMultiplicityOne.rescaling: For c≠0, i and c·i have the same image and the same cuspidal constituent.
TauCeti.AutomorphicLFunctions.AL3.GlobalMultiplicityOne.level_dimension: Even when dim π^K=2, the contribution at level K has dimension 2 while the global automorphic multiplicity is 1.
TauCeti.AutomorphicLFunctions.AL3.GlobalMultiplicityOne.no_occurrence: If there is no nonzero cusp embedding, the multiplicity is 0, consistent with the at-most-one assertion.
Unavailable full input: the actual cusp embedding/Hom space and its smooth/Hilbert multiplicity comparison. No arbitrary multiplicity function is used.

AutomorphicLFunctionsAndLocalFactors:AL.3/mirabolic-eisenstein-series
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.
Hypotheses: K is a number field; the function-field rational/periodic branch is separate.
TauCeti.AutomorphicLFunctions.AL3.MirabolicEisensteinSeries.parabolic_sum
  E equals the sum of the displayed section over the maximal-parabolic quotient.
TauCeti.AutomorphicLFunctions.AL3.MirabolicEisensteinSeries.central
  E(zg,s,Φ,η)=η(z)^(−1)E(g,s,Φ,η).
TauCeti.AutomorphicLFunctions.AL3.MirabolicEisensteinSeries.rank_one
  For n=1, GL₁(K)\GL₁(𝔸) unfolding recovers the Tate integral.
TauCeti.AutomorphicLFunctions.AL3.MirabolicEisensteinSeries.nontrivial_normone
  A character nontrivial on the norm-one class group has no theta zero-mode poles; merely calling it nontrivial is insufficient for norm twists.

AutomorphicLFunctionsAndLocalFactors:AL.3/mirabolic-eisenstein-functional-equation
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.
TauCeti.AutomorphicLFunctions.AL3.MirabolicEisensteinFunctionalEquation
  E(g,s,Φ,η)=E(t(g^(−1)),1−s,Φ̂,η^(−1)) meromorphically over a number field. If η=|·|^(−inσ), its only possible simple poles are s=iσ and1+iσ. With κ=vol(K×\𝔸¹) in the chosen measures, the zero-mode terms in that case are −κ|det g|^sΦ(0)/(n(s−iσ))+κ|det g|^(s−1)Φ̂(0)/(n(s−1−iσ)). If the restriction of η to the norm-one idele class group is nontrivial, both zero-mode integrals vanish. The case η=1 is σ=0.

AutomorphicLFunctionsAndLocalFactors:AL.3/global-rs-unfolding
Unavailable full input: actual AF.3 smooth cusp space, AA.2 compact unipotent/automorphic quotient integrals, AF.2 restricted tensor realization and continuous local Whittaker uniqueness. Fourier reconstruction precedes global genericity, factorization and ordinary multiplicity one; no AF.3 genericity theorem is assumed.
Hypotheses: K is a number field; the function-field rational/periodic branch is separate.
TauCeti.AutomorphicLFunctions.AL3.GlobalRsUnfolding
For unitary cuspidal π_n,π_m and pure tensors, the unequal-rank projected cusp integral and the equal-rank integral ∫_{Z_n(𝔸)GL_n(K)\GL_n(𝔸)}φ(g)φ′(g)E(g,s,Φ,ω_πω_π′)dg unfold to ∏_v Ψ_v(s). For n>m project φ along the unipotent radical of (m+1,1,…,1), with factor |det|^(−(n−m−1)/2), then integrate against φ′|det|^(s−1/2).
Hypotheses: Initially Re(s)≫0; global character product trivial on K×. Adjacent rank needs no preliminary projection.

AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-poles
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.
Hypotheses: K is a number field; the function-field rational/periodic branch is separate.
TauCeti.AutomorphicLFunctions.AL3.RsGlobalPoles
  For unitary cuspidal π_n,π_m the completed Λ(s,π_n×π_m) continues meromorphically. It is entire if n≠m. If n=m, its only poles are simple at s=iσ and1+iσ for real σ with π_n∨≅π_m⊗|det|^(iσ). In particular Λ(s,π×π∨) has simple poles at0 and1, and Λ(s,π×π′∨) has a pole at1 iff π≅π′.

AutomorphicLFunctionsAndLocalFactors:AL.3/rs-global-functional-equation
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.
Hypotheses: K is a number field; the function-field rational/periodic branch is separate.
TauCeti.AutomorphicLFunctions.AL3.RsGlobalFunctionalEquation
  Λ(s,π×π′)=ε(s,π×π′)Λ(1−s,π∨×π′∨), with ε the finite product of the local factors at ramified/archimedean places. Central-character signs disappear because ∏_vω_{π′_v}(−1)=ω_{π′}(−1)=1. The global product is independent of the chosen global additive character.

AutomorphicLFunctionsAndLocalFactors:AL.3/rs-vertical-strip-bounds
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.
Hypotheses: K is a number field; the function-field rational/periodic branch is separate.
TauCeti.AutomorphicLFunctions.AL3.RsVerticalStripBounds
  The completed Λ(s,π×π′) for unitary cuspidal inputs is bounded on finite vertical strips away from its polar points. For m=n or n−1, finite K-finite test realization reduces this to the global-integral bounds. For arbitrary rank gaps use the general Gelbart–Shahidi theorem with its normalized-intertwining-operator hypothesis verified for GL(n).

AutomorphicLFunctionsAndLocalFactors:AL.2/jacquet-shalika-satake-bound
Unavailable full input: SR.1 smooth/Casselman–Wallach representation and AF.1 cuspidal/global parameter carriers; a ramified comparison takes an actual compatible parameter as an input.
TauCeti.AutomorphicLFunctions.AL2.JacquetShalikaSatakeBound
  For an irreducible unitary generic unramified representation of GL_n(F), every unitary-normalized Satake root satisfies q^(−1/2)<|α_i|<q^(1/2). Hence a unitary global cusp form has these bounds at all unramified places. This does not assert temperedness over a number field.

AutomorphicLFunctionsAndLocalFactors:AL.3/strong-multiplicity-one
Unavailable full input: actual AF.3 smooth cusp space, AA.2 compact unipotent/automorphic quotient integrals, AF.2 restricted tensor realization and continuous local Whittaker uniqueness. Fourier reconstruction precedes global genericity, factorization and ordinary multiplicity one; no AF.3 genericity theorem is assumed.
Hypotheses: K is a number field; the function-field rational/periodic branch is separate.
TauCeti.AutomorphicLFunctions.AL3.StrongMultiplicityOne
If cuspidal π₁,π₂ of GL_n(𝔸_K) have isomorphic local components at all finite places outside a finite set, then π₁≅π₂ globally, including every omitted finite and infinite place; with AL.3/global-multiplicity-one their cusp realizations coincide.
Hypotheses: Unitarize the central characters consistently; every excluded finite and archimedean local factor is nonzero and finite at s=1, by the local unitary bounds and gamma calculation. Agreement at infinity is a conclusion.

AutomorphicLFunctionsAndLocalFactors:AL.3/isobaric-strong-multiplicity-one
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.
Hypotheses: K is a number field; the function-field rational/periodic branch is separate.
TauCeti.AutomorphicLFunctions.AL3.IsobaricStrongMultiplicityOne
  Given AF’s existence/classification of isobaric sums π=⊞_iτ_i, equality of unramified components almost everywhere determines the multiset of cuspidal constituents τ_i, including multiplicities and norm twists. Thus two isobaric representations with those components are isomorphic. For arbitrary automorphic constituents the conclusion is equality of cuspidal support, not an unproved assertion that every constituent is itself the same representation.

AutomorphicLFunctionsAndLocalFactors:AL.3/ramakrishnan-degree-one
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.
TauCeti.AutomorphicLFunctions.AL3.RamakrishnanDegreeOne
  Let K/F be an extension of number fields admitting a tower F=K₀⊂K₁⊂…⊂K_r=K with every K_j/K_{j−1} normal. If isobaric π,π′ of GL_n(𝔸_K) agree outside finitely many primes of K having relative degree1 over F, then π≅π′. In particular, for quadratic E/F, agreement above almost all split F-primes suffices.

AutomorphicLFunctionsAndLocalFactors:AL.3/normalized-rs-period
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.
TauCeti.AutomorphicLFunctions.AL3.NormalizedRsPeriod.entire
  λ_v(s)/L(s+1/2) is entire.
TauCeti.AutomorphicLFunctions.AL3.NormalizedRsPeriod.invariant
  λ_v♮ is H_v invariant.
TauCeti.AutomorphicLFunctions.AL3.NormalizedRsPeriod.unramified
  λ_v♮(W°)=1 with the conductor-zero character and stated Haar.
TauCeti.AutomorphicLFunctions.AL3.NormalizedRsPeriod.spherical
  For two unramified inputs and W° the normalized value is1.

AutomorphicLFunctionsAndLocalFactors:AL.3/global-central-period
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.
TauCeti.AutomorphicLFunctions.AL3.GlobalCentralPeriod
  For unitary cuspidal Π_m⊠Π_{m+1} and a factorizable cusp vector φ, ∫_{GL_m(K)\GL_m(𝔸)}φ_m(h)φ_{m+1}(diag(h,1))dh=L(1/2,Π_m×Π_{m+1})∏_vλ_v♮(W_v). A quadratic idele-class twist gives the same identity with Π_m⊗η and the twisted local functionals.

AutomorphicLFunctionsAndLocalFactors:AL.0/standard-additive-character
Unavailable full input: SR.1 local-field Schwartz carrier, AA.0 adelic completion/trace topology, or their Fourier duality output.
TauCeti.AutomorphicLFunctions.AL0.StandardAdditiveCharacter.conductor
  The largest trivial fractional ideal is P^(−d_v).
TauCeti.AutomorphicLFunctions.AL0.StandardAdditiveCharacter.diagonal
  ∏_vψ_v(a)=1 for a∈K.
TauCeti.AutomorphicLFunctions.AL0.StandardAdditiveCharacter.nontrivial
  Each ψ_v is continuous and nontrivial.
TauCeti.AutomorphicLFunctions.AL0.StandardAdditiveCharacter.rational_unramified
  For Q_p the different exponent is0 and ψ is trivial on Z_p but not p^(−1)Z_p.

AutomorphicLFunctionsAndLocalFactors:AL.0/fractional-ideal-annihilator
Unavailable full input: SR.1 local-field Schwartz carrier, AA.0 adelic completion/trace topology, or their Fourier duality output.
TauCeti.AutomorphicLFunctions.AL0.FractionalIdealAnnihilator
  For the trace character ψ_v and fractional ideal A=P^m, A⊥={y:∀x∈A,ψ_v(xy)=1}=P^(−m−d_v). Consequently (A⊥)⊥=A and every such annihilator is compact open.

AutomorphicLFunctionsAndLocalFactors:AL.0/self-dual-haar
Unavailable full input: SR.1 local-field Schwartz carrier, AA.0 adelic completion/trace topology, or their Fourier duality output.
TauCeti.AutomorphicLFunctions.AL0.SelfDualHaar.character_scale
  Changing ψ to ψ_a multiplies μ by |a|^(1/2).

AutomorphicLFunctionsAndLocalFactors:AL.0/finite-schwartz-period-level
Unavailable full input: SR.1 local-field Schwartz carrier, AA.0 adelic completion/trace topology, or their Fourier duality output.
TauCeti.AutomorphicLFunctions.AL0.FiniteSchwartzPeriodLevel
  A locally constant compactly supported complex function on a nonarchimedean local field is supported in P^(−M) and invariant under translation by P^N for some integers M,N. Thus it is a finite linear combination of coset indicators on P^(−M)/P^N, where N≥−M.

AutomorphicLFunctionsAndLocalFactors:AL.0/finite-fourier-inversion
Unavailable full input: SR.1 local-field Schwartz carrier, AA.0 adelic completion/trace topology, or their Fourier duality output.
TauCeti.AutomorphicLFunctions.AL0.FiniteFourierInversion
  The Fourier transform carries SR.1’s finite-place Schwartz carrier into itself and its square is f(x)↦f(−x), with the self-dual Haar. For the positive kernel use F⁺f(x)=F⁻f(−x) where F⁻ is the native transform with the same ψ.

AutomorphicLFunctionsAndLocalFactors:AL.0/schwartz-parameter-domination
Unavailable full input: SR.1 local-field Schwartz carrier, AA.0 adelic completion/trace topology, or their Fourier duality output.
TauCeti.AutomorphicLFunctions.AL0.SchwartzParameterDomination
  A holomorphic Schwartz-valued family bounded in the relevant Schwartz seminorms on every compact parameter set gives locally uniform integrable bounds for its Mellin or Fourier parameter derivatives in the stated convergence strip. Hence integration and parameter differentiation commute there. For Mellin families, endpoint power exponents must leave a strict margin around the compact s-set.

AutomorphicLFunctionsAndLocalFactors:AL.1/cm-quadratic-completion
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.AutomorphicLFunctions.AL1.CmQuadraticCompletion
  For E/F CM quadratic, F totally real of degree g, let η be the nontrivial quadratic idele-class character, Q=|D_F|N(f_η)=|D_E|/|D_F|. The canonical conductor-balanced completion is Λ_η(s)=Q^(s/2)Γ_R(s+1)^g L_f(s,η), entire of order at most1, with Λ_η(s)=W_ηΛ_η(1−s), W_η=1. The unbalanced completion L_η(s)=Γ_R(s+1)^gL_f(s,η) satisfies L_η(s)=Q^(1/2−s)L_η(1−s).

AutomorphicLFunctionsAndLocalFactors:AL.1/cm-logarithmic-gamma-correction
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.AutomorphicLFunctions.AL1.CmLogarithmicGammaCorrection
  For the unbalanced CM completion L_η=Γ_R(s+1)^gL_f, L_η′(0)/L_η(0)=L_f′(0)/L_f(0)−(g/2)(γ+log(4π)). Its functional equation gives L_η′(0)/L_η(0)+L_η′(1)/L_η(1)=−log Q. Balancing adds (1/2)log Q to each logarithmic derivative.

AutomorphicLFunctionsAndLocalFactors:AL.3/function-field-cuspidal-polynomial
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.
TauCeti.AutomorphicLFunctions.AL3.FunctionFieldCuspidalPolynomial
  Let π₁,π₂ be unitary everywhere-unramified cuspidal of ranks n₁,n₂, g=genus X, and write L=P/Q with P(0)=Q(0)=1 and P,Q coprime. If ranks differ or π₁,π₂ are not inertially equivalent then Q=1 and deg P=(2g−2)n₁n₂. In the self-pair rank n case, with d=|Fix(π)|, Q=(1−z^d)(1−(qz)^d) and deg P=(2g−2)n²+2d; ε=q^((g−1)n²). Unit-modulus inertial twists rotate z.

AutomorphicLFunctionsAndLocalFactors:AL.3/function-field-self-pair-reflection
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.
TauCeti.AutomorphicLFunctions.AL3.FunctionFieldSelfPairReflection
  For the self-pair numerator P above, D=(2g−2)n²+2d, P(z)=q^(D/2)z^D P(1/(qz)); every root has modulus q^(−1/2). The H¹ alternating pairing has similitude q and pairs Frobenius eigenvalues with product q.

AutomorphicLFunctionsAndLocalFactors:AL.3/residual-rs-product
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.
TauCeti.AutomorphicLFunctions.AL3.ResidualRsProduct
  Given AF’s discrete residual Π₁=π₁⊠ν₁ and Π₂=π₂⊠ν₂ in unitary normalization, L(Π₁×Π₂∨,z)=∏_{i=1}^{ν₁}∏_{j=1}^{ν₂}L(π₁×π₂∨,q^((ν₁+ν₂)/2+1−i−j)z). The ranks of Π_k are n_kν_k, where n_k is the cusp rank.

AutomorphicLFunctionsAndLocalFactors:AL.3/open-disc-zero-pole-index
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.

AutomorphicLFunctionsAndLocalFactors:AL.3/residual-rs-index
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.
TauCeti.AutomorphicLFunctions.AL3.ResidualRsIndex
  For unitary everywhere-unramified Π₁=π₁⊠ν₁,Π₂=π₂⊠ν₂ with ν₁≥ν₂, the open-disc index of L(z)/L(q^(−1)z) is ν₂(2g−2)n₁n₂ plus d=|Fix(π₁)| precisely when Π₁ and Π₂ are inertially equivalent (equivalently ν₁=ν₂ and π₁ inertially equivalent to π₂); otherwise there is no d term.

AutomorphicLFunctionsAndLocalFactors:AL.3/rs-normalizing-scalar
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.
TauCeti.AutomorphicLFunctions.AL3.RsNormalizingScalar.identity_weyl
  The empty inversion product is1.
TauCeti.AutomorphicLFunctions.AL3.RsNormalizingScalar.weyl_product
  For length-additive Weyl products, inversion factors compose after character substitution.
TauCeti.AutomorphicLFunctions.AL3.RsNormalizingScalar.one_root
  A simple reflection has exactly one root factor.

AutomorphicLFunctionsAndLocalFactors:AL.3/self-pair-normalizer-reflection
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.
TauCeti.AutomorphicLFunctions.AL3.SelfPairNormalizerReflection
  For Π=π⊠ν, cusp rank r, f=|Fix(π)| and self-pair numerator P, define F(z)=∏_{i=1}^ν P(q^(−i)z)∏_{i=1}^ν(1−(q^iz)^f)∏_{i=1}^{ν−1}(1−(q^iz)^f). Then n_β(z)=−z^E F(1/z)/F(z), E=((2g−2)r²+4f)ν−f. F is a polynomial in z^f with no roots on |z|=1.

AutomorphicLFunctionsAndLocalFactors:AL.3/whittaker-conductor-shift
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.
TauCeti.AutomorphicLFunctions.AL3.WhittakerConductorShift
  Let ψ_v be trivial on P_v^(−n_v) but not P_v^(−n_v−1), and t_v=diag(ϖ_v^(−(n−1)n_v),…,ϖ_v^(−n_v),1). Then W↦(g↦W(t_vg)) identifies the spherical ψ_v model with the conductor-zero ψ_v(ϖ_v^(−n_v)·) model. For a nonzero spherical W, W(t_v)≠0. For the differential-defined global character, Σ_v n_v deg v=2g−2.

AutomorphicLFunctionsAndLocalFactors:AL.2/godement-jacquet-spherical-test
Unavailable full input: SR.1 smooth/Casselman–Wallach representation and AF.1 cuspidal/global parameter carriers; a ramified comparison takes an actual compatible parameter as an input.
TauCeti.AutomorphicLFunctions.AL2.GodementJacquetSphericalTest
  For unramified irreducible π of GL_n(F), choose K-fixed v,ℓ with ℓ(v)=1 and Φ=1_Mat_n(O). With K-volume1 and unitary Satake roots α_i, Z(s,β,Φ)=∏_i(1−α_iq^(−s))^(−1). For n=1 this is the Tate geometric series.

AutomorphicLFunctionsAndLocalFactors:AL.2/unitary-self-dual-real-factors
Unavailable full input: SR.1 smooth/Casselman–Wallach representation and AF.1 cuspidal/global parameter carriers; a ramified comparison takes an actual compatible parameter as an input.
TauCeti.AutomorphicLFunctions.AL2.UnitarySelfDualRealFactors
  If a local irreducible admissible π is unitary and self-dual, its finite-place normalized Euler polynomial has real coefficients. At infinity its gamma shifts are real or occur in conjugate pairs of the same gamma type. Consequently its local factor is positive at all sufficiently large real s.

AutomorphicLFunctionsAndLocalFactors:AL.2/standard-order-one
Unavailable full input: SR.1 smooth/Casselman–Wallach representation and AF.1 cuspidal/global parameter carriers; a ramified comparison takes an actual compatible parameter as an input.
TauCeti.AutomorphicLFunctions.AL2.StandardOrderOne
  For unitary cuspidal π over a number field whose standard completion is entire, its conductor-balanced centered function φ(z)=Λ(1/2+z,π) is an entire function of order at most1: for every ε>0, |φ(z)|≤exp(C_ε(1+|z|)^(1+ε)). Over a function field an entire standard L-function is a polynomial in q^(−s) times a real exponential, hence has order at most1.

AutomorphicLFunctionsAndLocalFactors:AL.2/standard-superpositivity
Unavailable full input: SR.1 smooth/Casselman–Wallach representation and AF.1 cuspidal/global parameter carriers; a ramified comparison takes an actual compatible parameter as an input.
TauCeti.AutomorphicLFunctions.AL2.StandardSuperpositivity
  Let π be unitary, self-dual and cuspidal, with entire completed standard L-function. Under RH in the number-field case, every derivative of the real conductor-balanced Λ at1/2 is nonnegative. If centered Λ is non-polynomial, a nonzero derivative of order r forces every derivative of order r+2j to be positive. A constant centered function has positive zeroth derivative and zero higher derivatives.

AutomorphicLFunctionsAndLocalFactors:AL.2/trivial-function-field-pole-clearer
Unavailable full input: SR.1 smooth/Casselman–Wallach representation and AF.1 cuspidal/global parameter carriers; a ramified comparison takes an actual compatible parameter as an input.
TauCeti.AutomorphicLFunctions.AL2.TrivialFunctionFieldPoleClearer
  For the trivial character over X/F_q, let ζ_X(s)=P_X(q^(−s))/((1−q^(−s))(1−q^(1−s))) and Λ(1,s)=q^((g−1)(s−1/2))ζ_X(s). Then q^(s−1/2)(1−q^(−s))(1−q^(1−s))Λ(1,s)=q^(g(s−1/2))P_X(q^(−s)) is entire and symmetric under s↦1−s. Its central derivatives are nonnegative by the paired-root argument; for g=0 it is1.

AutomorphicLFunctionsAndLocalFactors:AL.2/maass-standard-functional-equation
Unavailable full input: SR.1 smooth/Casselman–Wallach representation and AF.1 cuspidal/global parameter carriers; a ramified comparison takes an actual compatible parameter as an input.
TauCeti.AutomorphicLFunctions.AL2.MaassStandardFunctionalEquation
  The canonical completion of the normalized level-one Maass cusp form is entire and satisfies Λ(s)=(-1)^εΛ(1−s).

AutomorphicLFunctionsAndLocalFactors:AL.3/maass-norm-comparison
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.
TauCeti.AutomorphicLFunctions.AL3.MaassNormComparison
  For a level-one Hecke–Maass cusp eigenform with the Duke expansion and a(1)=1, ∫_(SL₂(Z)\H)|φ|² dxdy/y²=2L(1,Ad φ)/cosh(πr). In the W_(0,ir)(4π|n|y) convention, ρ(1)λ(n)=sqrt(n)ρ(n) and W_(0,ir)(x)=sqrt(x/π)K_(ir)(x/2), so the Duke normalization is exactlyρ(1)=1. L²-unit normalization therefore has |ρ(1)|²=cosh(πr)/(2L(1,Ad φ)).

AutomorphicLFunctionsAndLocalFactors:AL.3/rs-boundary-nonvanishing
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.
TauCeti.AutomorphicLFunctions.AL3.RsBoundaryNonvanishing
  For unitary cuspidal π₁,π₂ over a number field, the finite partial Rankin–Selberg L^S(s,π₁×π₂) has no zeros on Re(s)≥1; its poles there occur only at1+it where π₂≅π₁∨⊗|det|^(−it), and are simple. The statement is meromorphic at a pole, not a finite-value assertion.

AutomorphicLFunctionsAndLocalFactors:AL.3/motivic-unitary-shift
Unavailable full input: SR.1/SR.5 generic Whittaker/derivative and AF.1/AF.3 global quotient carriers; AL.3's unramified pure realization, curve determinant or actual rational-structure input, as specified in the roadmap.
TauCeti.AutomorphicLFunctions.AL3.MotivicUnitaryShift
  For pure realizations of weights w₀,w₁ whose unramified eigenvalues are q^(w_i/2) times the unitary Satake roots, the motivic tensor factor at s equals the unitary Rankin–Selberg factor at s−(w₀+w₁)/2. In Liu’s Sym^(n−1)H¹⊗Sym^nH¹ case the tensor weight is2n−1 and the motivic central point n corresponds to unitary1/2.

AutomorphicLFunctionsAndLocalFactors:AL.4/satake-factor-operations
Unavailable full input: RG2.5 L-group and IHG.3 Satake parameter carriers, AF.1 parameter comparison, and ADS convergence output.
TauCeti.AutomorphicLFunctions.AL4.SatakeFactorOperations
  For invertible semisimple Satake operators with eigenvalues α_i and β_j, direct sum multiplies P, tensor product has P(T)=∏_(i,j)(1−α_iβ_jT), dual has P(T)=∏_i(1−α_i^(−1)T), and scalar twist c has P_c(T)=P(cT). Coefficient embeddings commute with these polynomial identities. These are factor comparisons, not assertions of automorphic transfers.

AutomorphicLFunctionsAndLocalFactors:AL.4/exterior-power-transfer-comparison
Unavailable full input: RG2.5 L-group and IHG.3 Satake parameter carriers, AF.1 parameter comparison, and ADS convergence output.
TauCeti.AutomorphicLFunctions.AL4.ExteriorPowerTransferComparison
  Given an established exterior-power transfer Π^(j) of Π with unramified parameter wedge^j(t_v), its partial standard factor equals ∏_v∏_(I⊂{1,…,n},|I|=j)(1−(∏_(i∈I)α_(v,i))q_v^(−s))^(−1). For BCGP’s H¹ decomposition into GL_(n_i) constituents, arithmetic shifts are(1−n_i)/2 separately on each constituent; their exterior-power decompositions inherit those shifts.

AutomorphicLFunctionsAndLocalFactors:AL.1/quadratic-orbital-tate-comparison
Unavailable full input: CFT Layer7 local-character filtration and AA.0/AA.2 idele/Schwartz carriers; local distribution families need those types and continuous-dual restrictions.
TauCeti.AutomorphicLFunctions.AL1.QuadraticOrbitalTateComparison
  For the quadratic idele-class character η in Zhang, the zero-orbit integrals are Orb(0+,Φ,s)=Λ(s,η)∏_v Z_v(s,η,Φ_v(·,0))/L_v(s,η) and Orb(0−,Φ,s)=Λ(−s,η)∏_v Z_v(−s,η,Φ_v(0,·))/L_v(−s,η). Each normalized local integral is entire and equals1 at unramified standard data.

AutomorphicLFunctionsAndLocalFactors:AL.3/rational-period-comparison
Unavailable full input: actual AF.4 finite-part rational models and local cohomological lines, ALS.5 Betti/de Rham/cuspidal comparisons, and AL.3's Whittaker rational structure/comparison and Gauss-twisting maps.
TauCeti.AutomorphicLFunctions.AL3.RationalPeriodComparison
Given the supplier Whittaker and cohomological E-rational structures for a cohomological cuspidal Π and a permissible real-place signature ε, and a fixed nonzero infinity cohomology vector defining F_Π^ε, normalize F_Π^ε by p^ε(Π)^(−1) to preserve those structures. The period is in C×/E×. Scaling the infinity vector by c scales the comparison and period by c; changing rational bases changes a representative by E×. Twisting by algebraic ξ changes the period class by G(ξ_f)^(n(n−1)/2) with the signature ε·ε_ξ.
Hypotheses: Use Raghuram §2.5.2: Π∈Coh(G_n,μ∨) is regular algebraic cuspidal over a number field with the stated strongly pure weight. The permissible signature ε cuts out the one-dimensional bottom-degree archimedean cohomology line. E contains Q(μ) and Q(Π_f); for the twist comparison enlarge E to contain the character rationality field as well. The finite Whittaker and Betti/cohomological E-structures, their comparison map and the Gauss-period twisting theorem must actually be supplied. Construct their comparison here from AF.4 finite-part rationality and the ALS.5 Betti comparisons, including the infinity vector and Gauss-twisting law. This conditional comparison proves no critical-value algebraicity theorem. Under σ∈Aut(ℂ), use the corrected signature convention of Raghuram §2.5.2.5, not an undefined σ ε.

AutomorphicLFunctionsAndLocalFactors:AL.5/ordinary-gl2-euler-factor
Unavailable full input: AL.5's complex character/refinement dictionary, the continued automorphic family, and its meromorphic/gamma comparison output; algebraicity is an actual input theorem.
TauCeti.AutomorphicLFunctions.AL5.OrdinaryGl2EulerFactor.newform
  The p-level eigenform formula has only the first factor; the primitive newform adds the second factor after the character dictionary.

AutomorphicLFunctionsAndLocalFactors:AL.5/local-conductor-test-vector-comparison
Unavailable full input: AL.5's complex character/refinement dictionary, the continued automorphic family, and its meromorphic/gamma comparison output; algebraicity is an actual input theorem.
TauCeti.AutomorphicLFunctions.AL5.LocalConductorTestVectorComparison
  For generic irreducible π of GL_n(F) with conductor-zero ψ, the degree in q^(−s) of the standard epsilon monomial is c_π, the imported generic newform conductor. The GJ normalized newform integral realizes L(s,π). At a good GL₂ place, twisting an unramified π by a ramified character χ of conductorν>0 gives L(s,π⊗χ)=1 and conductor2ν. At rank1 it gives L=1 and conductorν.

AutomorphicLFunctionsAndLocalFactors:AL.2/archimedean-standard-epsilon
Unavailable full input: SR.1 smooth/Casselman–Wallach representation and AF.1 cuspidal/global parameter carriers; a ramified comparison takes an actual compatible parameter as an input.
TauCeti.AutomorphicLFunctions.AL2.ArchimedeanStandardEpsilon
  For the positive standard Tate character, a real Weil constituent1 has epsilon1, sgn has epsilon i, and I_w=Ind_(W_C)^(W_R)(z/|z|)^w, w≥1, has epsilon i^(w+1). A weight-k discrete-series constituent therefore has epsilon i^k. Over C an angular character of weightκ has epsilon i^|κ|. Direct sums multiply these factors; norm twists do not change these archimedean constants.


Full representation-level statements:
TauCeti.AutomorphicLFunctions.AL2.StandardLocalLFactor.constant
  The general GJ generator has P_pi(0)=1. The arbitrary supplied-polynomial
  formula cannot prove this construction theorem; the unramified polynomial
  constant-term specialization above is not its replacement.
TauCeti.AutomorphicLFunctions.AL3.NormalizedRsPeriod.tempered_half_plane
  The actual local period integral converges for Re(s)>-1/2 for tempered
  representations. Missing smooth representation, temperedness and quotient
  measure suppliers prevent this signature; a scalar inequality is not a test.
TauCeti.AutomorphicLFunctions.AL3.NormalizedRsPeriod.continued_value
  Evaluate the continued actual lambda/L quotient rather than a totalized
  divergent integral. The scalar-family example above checks evaluation only,
  not the missing representation-level continuation theorem.
Measure convention for all AL.1 full statements:
  Multiplicative Haar scaling by c>0 scales z and z0=z/L by c. It preserves
  epsilon and gamma ratios with the additive Fourier measure held fixed.
  Standard normalized vectors must be rescaled by c^(-1); z0 itself is not
  measure-independent. Full local test vectors use Kudla's unit-volume measure
  unless an explicit compensating vector rescaling is stated.

-/

/-
Converse signature omissions:
TauCeti.AutomorphicLFunctions.AL3.gln_converse_full_rank
TauCeti.AutomorphicLFunctions.AL3.gln_converse_reduced_rank
The full family has ranks 1..n-1 for n>=2 and gives cuspidal automorphy.
The reduced family has ranks 1..n-2 for n>=3, unramified at finite S; S empty
gives cuspidal automorphy, while nonempty S gives agreement outside S.
Both retain the admissible restricted tensor, automorphic central character,
initial Euler convergence, dual entireness, vertical-strip bounds and epsilon
functional equation. The rank-two theorem retains the full twisting family;
the rank-three reduced theorem has the smaller family with its stated conclusion.
Native global tensor and completed twist/epsilon carriers are not supplied.
The signatures require the actual restricted tensor and completed twists.
Their proofs construct opposite-mirabolic expansions and spectral inversion.
The source is Cogdell's public survey, sections 2-3, Theorems 3.1 and 3.3;
Gelbart-Jacquet's highly ramified T-twist variant remains separate.
-/

/-
Named converse tests requiring the same analytic carriers:
TauCeti.AutomorphicLFunctions.AL3.gln_converse_full_rank.rank_two: At n=2 the entire twisting family is all idele-class quasicharacters, with completed dual entireness, vertical-strip bounds and the matching functional equation.
TauCeti.AutomorphicLFunctions.AL3.gln_converse_full_rank.rank_three: At n=3 the full-rank theorem requires both GL₁ and GL₂ cuspidal twists; dropping rank two is the separately proved reduced-rank theorem.
TauCeti.AutomorphicLFunctions.AL3.gln_converse_full_rank.unchecked_pole: A twist with an uncancelled pole violates niceness and cannot be passed to this converse theorem.
TauCeti.AutomorphicLFunctions.AL3.gln_converse_reduced_rank.rank_three_empty_set: At n=3 and S=∅ all GL₁ twists satisfying niceness give cuspidal automorphy.
TauCeti.AutomorphicLFunctions.AL3.gln_converse_reduced_rank.nonempty_exceptional_set: Twists unramified at nonempty finite S give an automorphic representation matching outside S; neither cuspidality nor equality at S follows from this contract.
TauCeti.AutomorphicLFunctions.AL3.gln_converse_reduced_rank.rank_two_excluded: n=2 is outside the hypotheses, so an empty range 1≤m≤0 yields no GL₂ theorem.
TauCeti.AutomorphicLFunctions.AL3.gln_converse_reduced_rank.highly_ramified_family: Characters unramified at S are not the highly ramified T-family of Gelbart–Jacquet §9.2; that variant remains a separate proof obligation.
-/

/-
Finite induced-factor product: AL.3/rs-induced-factor-product
TauCeti.AutomorphicLFunctions.AL3.RsInducedFactorProduct
Unavailable full input: finite-place normalized-induction and essentially-square-integrable
block carriers from SR.2/SR.3.
Let F be nonarchimedean and π=Ind_P^GL_n(⊠_i π_i) and π′=Ind_Q^GL_m(⊠_j π′_j) be irreducible generic normalized inductions, with every block irreducible essentially square-integrable. Then L(s,π)=∏_i L(s,π_i) and L(s,π×π′)=∏_(i,j)L(s,π_i×π′_j). For a rank-one norm character, L(s,π×|·|^t)=L(s+t,π). These are exact identities of normalized local factors, at this finite place.
Hypotheses: Use the induced representations themselves, with δ_P^(1/2), not arbitrary irreducible quotients of reducible induction. The irreducible generic range suffices for the newform application; no general nongeneric quotient product theorem is asserted. This target is the finite-place product needed by the ramified Godement–Jacquet newform proof. No archimedean induction-compatibility supplier is inferred from the finite SR.2 contract.
The finite-place product is constructed from the normalized block factors.

Mirabolic regression obligation: for η=|·|^(−in) (σ=1), the zero modes have
denominators n(s−i) and n(s−1−i); η≠1 does not make these terms vanish.
The full representation/idele-level signature remains named above.
-/

/-
Godement–Jacquet convention check: Humphries (2.15), p.7, uses inverse-character
transpose Fourier pairing and β(transpose-inverse g). Apply the source with the
inverse character fixed here and substitute transpose in matrix and group variables
to obtain the positive plain-trace pairing and β(inverse g).

Finite parameter comparison: the cited R01.2 epsilon node has characteristic-zero
local field scope, geometric Frobenius and monodromy invariants. The
classical/Hilbert comparisons in AL.4 take compatible GL₂ realizations away
from the coefficient prime as inputs. General finite GL_n and
equal-characteristic epsilon compatibility require their stated parameters.
-/

/-
AL.3 curve-realization signatures requiring the native curve, bundle,
correspondence, lisse coefficient and cohomology carriers:

CurveAdditiveAnalysis: residue character, canonical-divisor conductor degree,
restricted diagonal and equal-characteristic Poisson comparison.
API: residueCharacter_scale, conductor_degree, fractionalIdeal_annihilator,
global_residue_product, poisson.
Tests: the divisor of dt on P1 is -2 infinity; two simple poles have opposite
traced residues; replacing omega by t*omega preserves the conductor sum.

UnramifiedRankOneReciprocity: the Picard-character/lisse-line equivalence,
with geometric Frobenius and its tensor/dual and degree-twist maps.
API: localPolynomial, tensor, dual, degreeTwist, inverse maps.
Tests: the trivial line; a finite-order constant-field degree twist; inverse
characters correspond to dual lines.

TwoLegShtuka: the bundle modification diagram and Frobenius isomorphism,
its moduli, central degree quotient, partial Frobenius, Hecke maps,
sufficiently convex Harder--Narasimhan truncations and no-level compactification smooth and proper over X × X,
with relative normal-crossing boundary. Fixed-point comparisons use distinct
Frobenius orbits for the two legs.
API: legs, baseChange, partialFrobenius_commute, hecke_comp,
truncation_inclusion, boundary_rank_partition.
Tests: relative dimension zero at rank one; a rank-two boundary has rank-one
graded pieces; enlarging a polygon preserves leg projections.

UnramifiedPureRealization: rational cohomology on the specific shtuka stacks,
negligible boundary, pure middle essential summand, unramified fixed-point
comparison, rank induction and the all-closed-point Satake identification
for finite-order central character. General unitary degree characters are
restored as Weil twists, not arbitrary continuous l-adic Galois characters.
API: rank, determinant_finiteOrder, pure_weight_zero, localPolynomial,
dual, degreeTwist; rank-one reciprocity is the base case.
Tests: rank one; the trivial sheaf gives curve zeta factors; self-pairs have
H0/H2 eigenvalues 1 and q when there is one degree self-twist, while
non-inertial pairs have neither extreme group.

TensorCohomologicalDeterminant: the H0/H1/H2 determinant ratio, duality,
Euler characteristic, root weights and cyclic self-twist extreme factors.
These are construction/theorem targets, not assumptions named by dummy Props.
Only the unramified realization required by the polynomial targets is planned
here. The function-field correspondence in greater generality imports it.
-/
