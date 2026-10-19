import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Homology.ShortComplex.HomologicalComplex
import Mathlib.LinearAlgebra.FiniteDimensional.Defs
import Mathlib.Topology.Instances.Real.Lemmas
import TauCeti.FieldTheory.SquareClassGroup.Multiplicative
import TauCeti.LinearAlgebra.CliffordAlgebra.Spin.SpinorNorm.Basic

/-!
# Suggested forms: symplectic Reidemeister torsion modulo squares

The companion README is the definitive specification. This file suggests forms,
not an exhaustive declaration checklist or an implementation. The pinned libraries
supply the carriers used below. The README lists every target whose carriers are
missing; those targets are not replaced here by empty predicates or opaque data.

Only light definitions have bodies. Proofs of proposed statements use `sorry`.
Square classes below use Tau Ceti's additive convention: zero means a square.
The existing spinor norm uses the corresponding multiplicative convention.
-/

open CategoryTheory

namespace TauCeti.ReidemeisterTorsion

universe u v

section DeterminantSigns

variable (K : Type u) [Field K]

/-- RT.1/exotic-duality: the reverse-wedge sign as a unit. -/
def exoticSign (n : ℕ) : Kˣ :=
  (-1 : Kˣ) ^ (n * (n - 1) / 2)

theorem exoticSign_add (m n : ℕ) :
    exoticSign K (m + n) = exoticSign K m * exoticSign K n * (-1 : Kˣ) ^ (m * n) := by
  sorry

example : exoticSign K 0 = 1 := by
  sorry

example : exoticSign K 2 = -1 := by
  sorry

example : exoticSign K 4 = 1 := by
  sorry

/-- RT.3/normalized-family: scalar adapter, with an actual input square class.
Its use as normalized torsion requires the README's even semicharacteristic. -/
def normalizeSquareClass (h : ℤ) (t : TauCeti.SquareClassGroup K) :
    TauCeti.SquareClassGroup K :=
  TauCeti.squareClass ((-1 : Kˣ) ^ (h / 2)) + t

theorem normalizeSquareClass_add (h k : ℤ) (hh : Even h) (hk : Even k)
    (s t : TauCeti.SquareClassGroup K) :
    normalizeSquareClass K (h + k) (s + t) =
      normalizeSquareClass K h s + normalizeSquareClass K k t := by
  sorry

theorem normalizeSquareClass_neg (h : ℤ) (hh : Even h)
    (t : TauCeti.SquareClassGroup K) :
    normalizeSquareClass K (-h) t = normalizeSquareClass K h t := by
  sorry

example (t : TauCeti.SquareClassGroup K) : normalizeSquareClass K 0 t = t := by
  sorry

example (t : TauCeti.SquareClassGroup K) :
    normalizeSquareClass K 2 t = TauCeti.squareClass (-1 : Kˣ) + t := by
  sorry

example (t : TauCeti.SquareClassGroup K) : normalizeSquareClass K 4 t = t := by
  sorry

variable {K} {L : Type v} [Field L]

theorem normalizeSquareClass_map (f : K →+* L) (h : ℤ)
    (t : TauCeti.SquareClassGroup K) :
    f.squareClassMap (normalizeSquareClass K h t) =
      normalizeSquareClass L h (f.squareClassMap t) := by
  sorry

end DeterminantSigns

section Cochains

variable {K : Type u} [Field K]

/-- RT.1/strongly-even on the existing cochain carrier. -/
def StronglyEven (C : CochainComplex (ModuleCat K) ℤ)
    [∀ i, FiniteDimensional K (C.X i)] : Prop :=
  ∀ i, Even (Module.finrank K (C.X i))

theorem stronglyEven_iff (C : CochainComplex (ModuleCat K) ℤ)
    [∀ i, FiniteDimensional K (C.X i)] :
    StronglyEven C ↔ ∀ i, Even (Module.finrank K (C.X i)) := by
  sorry

/-- RT.0/semicharacteristic, the dimension-three specialization.
Only the degree-zero and degree-one cohomology objects are needed to state it. -/
noncomputable def semicharacteristicThree (C : CochainComplex (ModuleCat K) ℤ)
    [FiniteDimensional K (C.homology 0)] [FiniteDimensional K (C.homology 1)] : ℤ :=
  (Module.finrank K (C.homology 0) : ℤ) - (Module.finrank K (C.homology 1) : ℤ)

theorem semicharacteristicThree_eq (C : CochainComplex (ModuleCat K) ℤ)
    [FiniteDimensional K (C.homology 0)] [FiniteDimensional K (C.homology 1)] :
    semicharacteristicThree C =
      (Module.finrank K (C.homology 0) : ℤ) - (Module.finrank K (C.homology 1) : ℤ) := by
  sorry

example (C : CochainComplex (ModuleCat K) ℤ)
    [∀ i, FiniteDimensional K (C.X i)]
    (h : ∀ i, Module.finrank K (C.X i) = 2) : StronglyEven C := by
  sorry

example (C : CochainComplex (ModuleCat K) ℤ)
    [∀ i, FiniteDimensional K (C.X i)] (i : ℤ)
    (h : Module.finrank K (C.X i) = 1) : ¬StronglyEven C := by
  sorry

example (C : CochainComplex (ModuleCat K) ℤ)
    [FiniteDimensional K (C.homology 0)] [FiniteDimensional K (C.homology 1)]
    (h₀ : Module.finrank K (C.homology 0) = 2)
    (h₁ : Module.finrank K (C.homology 1) = 0) : semicharacteristicThree C = 2 := by
  sorry

example (C : CochainComplex (ModuleCat K) ℤ)
    [FiniteDimensional K (C.homology 0)] [FiniteDimensional K (C.homology 1)]
    (h₀ : Module.finrank K (C.homology 0) = 0)
    (h₁ : Module.finrank K (C.homology 1) = 1) : semicharacteristicThree C = -1 := by
  sorry

end Cochains

section OrthogonalMilestones

variable {K : Type u} {V : Type v} [Field K] [AddCommGroup V] [Module K V]
  [FiniteDimensional K V] [Invertible (2 : K)]

/-- RT.0/strict-parity: the linear-algebra milestone at the middle differential. -/
theorem even_rank_of_alternating_middle (B : V →ₗ[K] V →ₗ[K] K)
    (hB : ∀ x, (∀ y, B x y = 0) → x = 0) (d : V →ₗ[K] V)
    (halt : ∀ x, B (d x) x = 0) : Even (Module.finrank K (LinearMap.range d)) := by
  sorry

/-- RT.4/zassenhaus: the no-minus-one case, using the existing spinor norm.
The unit determinant hypothesis is exactly invertibility of (1+A)/2. -/
theorem spinorNorm_eq_det_average (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    (A : QuadraticMap.specialOrthogonalGroup Q) (u : Kˣ)
    (hu : (u : K) = LinearMap.det
      ((2 : K)⁻¹ • ((A.1 : V ≃ₗ[K] V).toLinearMap + LinearMap.id))) :
    CliffordAlgebra.spinorNorm Q hQ A = TauCeti.squareClassHom u := by
  sorry

/-- RT.4/circle-formula: the fixed-space parity, without a torsion stand-in. -/
theorem even_fixed_space (Q : QuadraticForm K V) (hQ : Q.Nondegenerate)
    (hV : Even (Module.finrank K V)) (A : QuadraticMap.specialOrthogonalGroup Q) :
    Even (Module.finrank K
      (LinearMap.ker ((A.1 : V ≃ₗ[K] V).toLinearMap - LinearMap.id))) := by
  sorry

end OrthogonalMilestones

/-- RT.6/density-improvement: the real recurrence milestone.
The controlling-extension construction and weighted density remain README targets. -/
theorem cubic_decrease_tends_to_zero (δ : ℕ → ℝ)
    (hnonneg : ∀ n, 0 ≤ δ n)
    (hdecrease : ∀ n, δ (n + 1) ≤ δ n - (δ n) ^ 3 / 16) :
    Filter.Tendsto δ Filter.atTop (nhds 0) := by
  sorry

end TauCeti.ReidemeisterTorsion
