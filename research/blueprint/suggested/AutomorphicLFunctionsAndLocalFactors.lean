/-
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These statements suggest Lean forms so contributors and reviewers
converge on names and signatures. Every placeholder is intentional; no result
is claimed to be implemented. AL.0 has a compact-open Fourier component here;
the remaining AL.0 targets and AL.1–AL.5 are recorded as gaps in the packet.
-/
import Mathlib.Analysis.Fourier.FourierTransform
import Mathlib.Analysis.Fourier.ZMod
import Mathlib.Topology.LocallyConstant.Basic
import Mathlib.Topology.Algebra.Support
import Mathlib.Topology.Compactness.Compact
import Mathlib.MeasureTheory.Integral.Bochner.Set

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
