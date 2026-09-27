import Mathlib.Order.Filter.ZeroAndBoundedAtFilter
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.LinearAlgebra.Pi
import Mathlib.Analysis.Normed.Group.Bounded
import Mathlib.Order.Northcott

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
The statements suggest Lean forms so that contributors and reviewers converge on names
and signatures. All proposed results are unproved prototypes at the pinned baseline.
-/

-- Baseline names omitted by the textual declaration index.
#check isBounded_iff_forall_norm_le
#check Northcott.finite_le

noncomputable section
namespace TauCeti
universe u v w

/-- The native quotient by uniformly bounded real functions. -/
abbrev HeightClass (X : Type u) :=
  (X → ℝ) ⧸ Filter.boundedFilterSubmodule (β := ℝ) ℝ (⊤ : Filter X)

namespace HeightClass
variable {X : Type u} {Y : Type v} {Z : Type w}

/-- The native quotient projection, with its linear structure. -/
abbrev mk : (X → ℝ) →ₗ[ℝ] HeightClass X :=
  (Filter.boundedFilterSubmodule (β := ℝ) ℝ (⊤ : Filter X)).mkQ

lemma bounded_top_iff (h : X → ℝ) :
    h ∈ Filter.boundedFilterSubmodule (β := ℝ) ℝ (⊤ : Filter X) ↔
      ∃ C : ℝ, 0 ≤ C ∧ ∀ x, |h x| ≤ C := by sorry

lemma mk_eq_mk_iff (h g : X → ℝ) :
    mk h = mk g ↔ ∃ C : ℝ, 0 ≤ C ∧ ∀ x, |h x - g x| ≤ C := by sorry

lemma mk_eq_mk_iff_isBounded (h g : X → ℝ) :
    mk h = mk g ↔ Bornology.IsBounded (Set.range (h - g)) := by sorry

lemma mk_eq_zero_iff (h : X → ℝ) :
    mk h = 0 ↔ ∃ C : ℝ, 0 ≤ C ∧ ∀ x, |h x| ≤ C := by sorry

lemma mk_surjective : Function.Surjective (mk : (X → ℝ) → HeightClass X) := by sorry

lemma mk_zero : mk (0 : X → ℝ) = 0 := by sorry
lemma mk_add (h g : X → ℝ) : mk (h + g) = mk h + mk g := by sorry
lemma mk_smul (c : ℝ) (h : X → ℝ) : mk (c • h) = c • mk h := by sorry
lemma mk_const (c : ℝ) : mk (fun _ : X => c) = 0 := by sorry
lemma mk_of_finite [Finite X] (h : X → ℝ) : mk h = 0 := by sorry

/-- Reuse the native linear quotient lift; no second lift construction. -/
lemma liftQ_mk {V : Type v} [AddCommGroup V] [Module ℝ V]
    (L : (X → ℝ) →ₗ[ℝ] V)
    (hL : Filter.boundedFilterSubmodule (β := ℝ) ℝ (⊤ : Filter X) ≤ LinearMap.ker L)
    (h : X → ℝ) :
    (Filter.boundedFilterSubmodule (β := ℝ) ℝ (⊤ : Filter X)).liftQ L hL (mk h) = L h := by sorry

lemma linearMap_ext {V : Type v} [AddCommGroup V] [Module ℝ V]
    (L M : HeightClass X →ₗ[ℝ] V) (h : ∀ f, L (mk f) = M (mk f)) : L = M := by sorry

/-- Pullback along a function, with no topology on its domain. -/
def pullback (f : X → Y) : HeightClass Y →ₗ[ℝ] HeightClass X :=
  (Filter.boundedFilterSubmodule (β := ℝ) ℝ (⊤ : Filter Y)).mapQ
    (Filter.boundedFilterSubmodule (β := ℝ) ℝ (⊤ : Filter X))
    (LinearMap.pi fun x => LinearMap.proj (f x)) (by sorry)

lemma pullback_mk (f : X → Y) (h : Y → ℝ) :
    pullback f (mk h) = mk (h ∘ f) := by sorry
lemma pullback_id : pullback (id : X → X) = LinearMap.id := by sorry
lemma pullback_comp (f : X → Y) (g : Y → Z) :
    pullback (g ∘ f) = (pullback f).comp (pullback g) := by sorry
lemma pullback_add (f : X → Y) (a b : HeightClass Y) :
    pullback f (a + b) = pullback f a + pullback f b := by sorry
lemma pullback_smul (f : X → Y) (c : ℝ) (a : HeightClass Y) :
    pullback f (c • a) = c • pullback f a := by sorry
lemma pullback_const (y : Y) : pullback (fun _ : X => y) = 0 := by sorry

lemma pullback_injective_of_surjective (f : X → Y) (hf : Function.Surjective f) :
    Function.Injective (pullback f) := by sorry

lemma northcott_of_le_add (h g : X → ℝ) (C : ℝ) (H : ∀ x, h x ≤ g x + C)
    [Northcott h] : Northcott g := by sorry

lemma northcott_congr {h g : X → ℝ} (H : mk h = mk g) :
    Northcott h ↔ Northcott g := by sorry

lemma northcott_of_pullback_eq (f : X → Y) [Filter.TendstoCofinite f]
    (h : Y → ℝ) (g : X → ℝ) [Northcott h]
    (H : mk g = pullback f (mk h)) : Northcott g := by sorry

-- TauCeti.HeightClass.tests.empty
example (h : Empty → ℝ) : mk h = 0 := by sorry
-- TauCeti.HeightClass.tests.alternating
example : mk (fun n : ℕ => (-1 : ℝ)^n) = 0 := by sorry
-- TauCeti.HeightClass.tests.unbounded
example : mk (fun n : ℕ => (n : ℝ)) ≠ 0 := by sorry
-- TauCeti.HeightClass.tests.affine_shift
example : mk (fun n : ℕ => (n : ℝ) + 7) = mk (fun n : ℕ => (n : ℝ)) := by sorry
-- TauCeti.HeightClass.tests.native_quotient
example (h : X → ℝ) : mk h = (Submodule.Quotient.mk h : HeightClass X) := by sorry
-- TauCeti.HeightClass.tests.not_constants_only
example : ¬ ∃ c : ℝ, ∀ n : ℕ, (-1 : ℝ)^n = c := by sorry
-- TauCeti.HeightClass.tests.not_ring_quotient
example : mk (fun _ : ℕ => (1 : ℝ)) = mk (fun _ : ℕ => (0 : ℝ)) ∧
    mk (fun n : ℕ => (1 : ℝ) * n) ≠ mk (fun n : ℕ => (0 : ℝ) * n) := by sorry

-- TauCeti.HeightClass.pullback_tests.double
example : pullback (fun n : ℕ => 2*n) (mk (fun n : ℕ => (n : ℝ))) =
    2 • mk (fun n : ℕ => (n : ℝ)) := by sorry
-- TauCeti.HeightClass.pullback_tests.constant
example : pullback (fun _ : ℕ => (0 : ℕ)) (mk (fun n : ℕ => (n : ℝ))) = 0 := by sorry
-- TauCeti.HeightClass.pullback_tests.composition
example : pullback ((fun n : ℕ => 2*n) ∘ (fun n : ℕ => n+1))
    (mk (fun n : ℕ => (n : ℝ)^2)) =
    pullback (fun n : ℕ => n+1) (pullback (fun n : ℕ => 2*n)
      (mk (fun n : ℕ => (n : ℝ)^2))) := by sorry
-- TauCeti.HeightClass.pullback_tests.noninjective
example : ¬ Function.Injective (pullback (fun _ : ℕ => (0 : ℕ))) := by sorry

-- Representative invariance and finite-fiber acceptance cases.
example : Northcott (fun n : ℕ => (n : ℝ) + (-1 : ℝ)^n) := by sorry
example : Northcott (fun n : ℕ => (n : ℝ)) ∧
    ¬ Northcott (fun _ : ℕ => (0 : ℝ)) := by sorry
example : Northcott (fun n : ℕ => (n : ℝ)) ∧
    ¬ Northcott (fun n : ℕ => -(n : ℝ)) := by sorry
example : Northcott (fun p : ℕ × Fin 2 => (p.1 : ℝ)) := by sorry
example : ¬ Northcott (fun p : ℕ × ℕ => (p.1 : ℝ)) := by sorry

end HeightClass
end TauCeti
