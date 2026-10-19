import Mathlib.Algebra.Polynomial.Derivative
import TauCeti.Geometry.Hodge.Mixed.Strictness
import TauCeti.Geometry.Hodge.Tate.Basic

/-!
This file is not the roadmap and is not exhaustive. The accompanying reader
is definitive. These suggested Lean forms help contributors and reviewers
converge on names, signatures and conventions.

The compact shape required by WORKERS.md (2026-10-12) permits only statements
on carriers present at the pinned libraries and light definitions with real
bodies. The sheaf, D-module, perverse, Hodge-module and exponential-category
carriers are README targets. No replacement carriers are introduced here.

The polynomial specialization checks F/exponential-twist: the connection is
d + df, not d - df. The Tate examples use the existing integral Tate object;
rationalization gives the rational Tate object used in the reader. Neither
these signatures nor their examples claim implementation of the roadmap.

The point case of H.0/abelian-strictness is statable on the pinned mixed Hodge
structures: a morphism is strict for each intersection W_k ∩ F^p at once, not
only for W and F separately. Its proof is the pinned bigrading strictness for
the bidegrees (r, s) with p ≤ r and r + s ≤ k.
-/

namespace TauCeti.MixedHodgeModulesAndIrregularHodgeTheory

open Polynomial

/-- The polynomial degree-zero differential of the connection d + df on A¹. -/
noncomputable def exponentialDifferential (f p : Polynomial ℂ) : Polynomial ℂ :=
  derivative p + derivative f * p

/-- The zero potential is the existing formal derivative. -/
theorem exponentialDifferential_zero (p : Polynomial ℂ) :
    exponentialDifferential 0 p = derivative p := by
  sorry

/-- The connection satisfies Leibniz with respect to its section argument. -/
theorem exponentialDifferential_mul (f p q : Polynomial ℂ) :
    exponentialDifferential f (p * q) =
      derivative p * q + p * exponentialDifferential f q := by
  sorry

/-- Adding a constant to the potential leaves the differential unchanged. -/
theorem exponentialDifferential_add_constant (f p : Polynomial ℂ) (c : ℂ) :
    exponentialDifferential (f + C c) p = exponentialDifferential f p := by
  sorry

/-- The linear potential ct gives p' + cp. -/
theorem exponentialDifferential_linear (c : ℂ) (p : Polynomial ℂ) :
    exponentialDifferential (C c * X) p = derivative p + C c * p := by
  sorry

/-- A nonzero linear exponential has no polynomial de Rham cohomology. -/
theorem exponentialDifferential_linear_bijective (c : ℂ) (hc : c ≠ 0) :
    Function.Bijective (exponentialDifferential (C c * X)) := by
  sorry

-- A missing exponential term fails this unit-section check.
example : exponentialDifferential X 1 = 1 := by
  sorry

-- Reversing the exponential sign fails this check.
example : exponentialDifferential X (X ^ 2) =
    C (2 : ℂ) * X + X ^ 2 := by
  sorry

-- The derivative of the potential, rather than the potential itself, acts.
example : exponentialDifferential (X ^ 2) 1 = C (2 : ℂ) * X := by
  sorry

-- A nonzero constant section lies in the kernel at the zero potential.
example : exponentialDifferential 0 1 = 0 := by
  sorry

section PointStrictness

open TauCeti.Hodge

universe u v w u' v' w'

variable {Vℤ : Type u} {Vℚ : Type v} {Vℂ : Type w}
variable {V'ℤ : Type u'} {V'ℚ : Type v'} {V'ℂ : Type w'}
variable [AddCommGroup Vℤ] [AddCommGroup Vℚ] [Module ℚ Vℚ] [AddCommGroup Vℂ] [Module ℂ Vℂ]
variable [AddCommGroup V'ℤ] [AddCommGroup V'ℚ] [Module ℚ V'ℚ] [AddCommGroup V'ℂ] [Module ℂ V'ℂ]
variable {ιℚ : Vℤ →ₗ[ℤ] Vℚ} {ιℂ : Vℤ →ₗ[ℤ] Vℂ} {ι'ℚ : V'ℤ →ₗ[ℤ] V'ℚ} {ι'ℂ : V'ℤ →ₗ[ℤ] V'ℂ}
variable {hℚ : IsBaseChange ℚ ιℚ} {hℂ : IsBaseChange ℂ ιℂ}
variable {h'ℚ : IsBaseChange ℚ ι'ℚ} {h'ℂ : IsBaseChange ℂ ι'ℂ}
variable {source : MixedHodgeStructure hℚ hℂ} {target : MixedHodgeStructure h'ℚ h'ℂ}

/-- H.0/abelian-strictness at a point: a morphism of mixed Hodge structures is strict for
the intersection of a complexified weight step and a Hodge step simultaneously. -/
theorem range_inf_WC_inf_F_eq_map (f : MixedHodgeStructure.Hom source target) (k p : ℤ) :
    LinearMap.range f.toLinearMap ⊓ (target.WC k ⊓ target.F p) =
      (source.WC k ⊓ source.F p).map f.toLinearMap := by
  sorry

end PointStrictness

-- Baseline convention checks for C, P and T: Q(-1) has its jump at one.
example : (TauCeti.Hodge.tate (-1)).F 1 = (⊤ : Submodule ℂ ℂ) := by
  sorry

example : (TauCeti.Hodge.tate (-1)).F 2 = (⊥ : Submodule ℂ ℂ) := by
  sorry

example : (TauCeti.Hodge.tate 0).F 0 = (⊤ : Submodule ℂ ℂ) := by
  sorry

end TauCeti.MixedHodgeModulesAndIrregularHodgeTheory
