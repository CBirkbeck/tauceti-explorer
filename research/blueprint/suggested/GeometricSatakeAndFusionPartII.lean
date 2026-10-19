import Mathlib.LinearAlgebra.Span.Basic
import Mathlib.RingTheory.Trace.Defs
import Mathlib.FieldTheory.Separable
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import TauCeti.AlgebraicGeometry.TangentSpace.Basic

/-!
# Integral local models: suggested statements

This file is not the roadmap and is not exhaustive. The definitive specification is
`research/blueprint/readmes/GeometricSatakeAndFusionPartII.md`. These are proposed
forms over carriers present at the pins; discharging them finishes neither a layer
nor the roadmap. Proofs marked `sorry` are goals, not implementation claims.

WORKERS.md prescribes light real-bodied definitions, statable endpoint theorems
and a few examples. The geometric formal-curve derivative, local-model schemes,
loop spaces, perverse sheaves and tube comparisons are reader targets. An arbitrary
vector family below is only the module interface to the derivative span, and does
not stand in for a family of geometric curves. All geometric APIs and tests are
specified in the reader, without placeholder geometric data structures here.

Baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
-/

namespace TauCetiRoadmap.ArithmeticGeometry.GeometricSatakeAndFusionPartII

noncomputable section

variable (k : Type*) [Field k]
variable {V : Type*} [AddCommGroup V] [Module k V]

/-- LM.4 module interface: span the supplied derivative vectors. -/
def derivativeSpan {ι : Type*} (d : ι → V) : Submodule k V :=
  Submodule.span k (Set.range d)

theorem derivativeSpan_le_iff {ι : Type*} (d : ι → V) (W : Submodule k V) :
    derivativeSpan k d ≤ W ↔ ∀ i, d i ∈ W := by
  sorry

theorem derivativeSpan_map {ι W : Type*} [AddCommGroup W] [Module k W]
    (d : ι → V) (f : V →ₗ[k] W) :
    (derivativeSpan k d).map f = derivativeSpan k (fun i => f (d i)) := by
  sorry

example : derivativeSpan k (fun i : Empty => Empty.elim i : Empty → V) = ⊥ := by
  sorry

example : derivativeSpan k (fun a : k => a) = ⊤ := by
  sorry

example : derivativeSpan k
    (fun i : Fin 2 => if i = 0 then (1, 0) else (0, 1) : Fin 2 → k × k) = ⊤ := by
  sorry

-- Reuse Tau Ceti's scheme tangent carrier without defining a second tangent space.
example (X : AlgebraicGeometry.Scheme) (x : X) {ι : Type*}
    (d : ι → TauCeti.AlgebraicGeometry.ZariskiTangentSpace X x) :
    derivativeSpan (IsLocalRing.ResidueField (X.presheaf.stalk x)) d =
      Submodule.span (IsLocalRing.ResidueField (X.presheaf.stalk x)) (Set.range d) := by
  sorry

/-- LM.4 tangent-cone obstruction (KPZ Remark 4.1.5): a formal curve `(f, g, h)` through the origin of
`x² + xyz = 0` has no linear term in its first coordinate, so every formal-curve derivative lies in the
plane `x = 0` although the Zariski tangent space is three-dimensional. -/
theorem formalCurve_coeff_one_eq_zero (f g h : PowerSeries k)
    (hf : PowerSeries.constantCoeff f = 0) (hg : PowerSeries.constantCoeff g = 0)
    (hh : PowerSeries.constantCoeff h = 0) (hX : f * (f + g * h) = 0) :
    PowerSeries.coeff 1 f = 0 := by
  sorry

/-- LM.4 Cartan directions (source issue E11): with the standard `sl₂` matrices, conjugating `E` by the
lower unipotent `x_{-α}(1)` gives `E - H - F`; only the nonzero `H` coefficient is used. -/
example : !![(1 : ℤ), 0; 1, 1] * !![0, 1; 0, 0] * !![1, 0; -1, 1] =
    !![(0 : ℤ), 1; 0, 0] - !![1, 0; 0, -1] - !![0, 0; 1, 0] := by
  sorry

variable (F K : Type*) [Field F] [Field K] [Algebra F K]
variable {M : Type*} [AddCommGroup M] [Module K M]

/-- LM.2 scalar expression; nondegeneracy requires finite separable K/F. -/
def tracePairing (ψ : M →ₗ[K] M →ₗ[K] K) (v w : M) : F :=
  Algebra.trace F K (ψ v w)

theorem tracePairing_alternating (ψ : M →ₗ[K] M →ₗ[K] K)
    (hψ : ∀ v, ψ v v = 0) (v : M) : tracePairing F K ψ v v = 0 := by
  sorry

theorem tracePairing_nondegenerate [FiniteDimensional F K] [Algebra.IsSeparable F K]
    (ψ : M →ₗ[K] M →ₗ[K] K) (hψ : ∀ v, v ≠ 0 → ∃ w, ψ v w ≠ 0) :
    ∀ v, v ≠ 0 → ∃ w, tracePairing F K ψ v w ≠ 0 := by
  sorry

example (ψ : M →ₗ[K] M →ₗ[K] K) (v : M) : tracePairing F K ψ v 0 = 0 := by
  sorry

example (ψ : M →ₗ[K] M →ₗ[K] K) (v w : M) :
    tracePairing K K ψ v w = ψ v w := by
  sorry

end
end TauCetiRoadmap.ArithmeticGeometry.GeometricSatakeAndFusionPartII
