import Mathlib.Algebra.Group.TypeTags.Hom
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.LinearAlgebra.TensorAlgebra.Grading
import Mathlib.RingTheory.TwoSidedIdeal.Lattice
import Mathlib.RingTheory.IntegralDomain
import Mathlib.Basic.Real.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.Field.ZMod
import Mathlib.Tactic.NormNum
import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Transvection

/-!
# Classical field symbols and Matsumoto: suggested signatures

This file is not the roadmap and is not exhaustive. The definitive document is
`../readmes/K2SymbolsBrauer--T.2.md`. These statements suggest Lean forms so that
contributors and reviewers converge on names and signatures.

The real-bodied definitions below use pinned carriers: units, the integral tensor
square and its submodule quotient, and a concrete real sign function. Neither
classical K₂ nor the homogeneous Milnor quotient components exist at the pins.
Their constructions, API and tests are specified in the README.
-/

namespace TauCetiRoadmap.K2SymbolsBrauer

/-! ## Layer T.2: field presentation -/

open scoped TensorProduct

universe u v w
variable {F : Type u} [Field F] {A : Type v} [AddCommGroup A]

/-- Bilinearity and the Steinberg relation, without skew or diagonal axioms. -/
def IsSteinbergPairing (c : Fˣ → Fˣ → A) : Prop :=
  (∀ a b d, c (a * b) d = c a d + c b d) ∧
  (∀ a b d, c a (b * d) = c a b + c a d) ∧
  (∀ a b : Fˣ, (a : F) + (b : F) = 1 → c a b = 0)

-- Representative pairing and presentation signatures.
theorem pairing_postcompose {B : Type w} [AddCommGroup B]
    {c : Fˣ → Fˣ → A} (hc : IsSteinbergPairing c) (f : A →+ B) :
    IsSteinbergPairing (fun a b => f (c a b)) := by sorry

theorem pairing_pullback {E : Type w} [Field E]
    {c : Eˣ → Eˣ → A} (hc : IsSteinbergPairing c) (f : F →+* E) :
    IsSteinbergPairing (fun a b => c (Units.map f.toMonoidHom a)
      (Units.map f.toMonoidHom b)) := by sorry

theorem pairing_one_left {c : Fˣ → Fˣ → A} (hc : IsSteinbergPairing c) (b : Fˣ) :
    c 1 b = 0 := by sorry

theorem pairing_one_right {c : Fˣ → Fˣ → A} (hc : IsSteinbergPairing c) (a : Fˣ) :
    c a 1 = 0 := by sorry

-- zero_pairing
example : IsSteinbergPairing (fun _ _ : Fˣ => (0 : A)) := by sorry
-- constant_one_rejected
example : ¬ IsSteinbergPairing (fun _ _ : Fˣ => (1 : ℤ)) := by sorry

-- The integral diagonal correction: no alternation axiom is smuggled in.
theorem pairing_neg_self {c : Fˣ → Fˣ → A} (hc : IsSteinbergPairing c) (a : Fˣ) :
    c a (-a) = 0 := by sorry

theorem pairing_skew {c : Fˣ → Fˣ → A} (hc : IsSteinbergPairing c) (a b : Fˣ) :
    c a b = -c b a := by sorry

theorem pairing_diagonal {c : Fˣ → Fˣ → A} (hc : IsSteinbergPairing c) (a : Fˣ) :
    c a a = c a (-1) := by sorry

theorem pairing_diagonal_two_torsion {c : Fˣ → Fˣ → A}
    (hc : IsSteinbergPairing c) (a : Fˣ) : 2 • c a a = 0 := by sorry

theorem pairing_diagonal_char_two [CharP F 2] {c : Fˣ → Fˣ → A}
    (hc : IsSteinbergPairing c) (a : Fˣ) : c a a = 0 := by sorry

abbrev UnitModule (F : Type u) [Field F] := Additive Fˣ

/-- The degree-two relation submodule; not a commutative tensor-algebra ideal. -/
def SteinbergRelations (F : Type u) [Field F] :
    Submodule ℤ (UnitModule F ⊗[ℤ] UnitModule F) :=
  Submodule.span ℤ {z | ∃ a b : Fˣ, (a : F) + (b : F) = 1 ∧
    z = (Additive.ofMul a) ⊗ₜ[ℤ] (Additive.ofMul b)}

/-- Intermediate presentation to be identified with the actual Milnor degree two. -/
abbrev SymbolPresentation (F : Type u) [Field F] :=
  (UnitModule F ⊗[ℤ] UnitModule F) ⧸ SteinbergRelations F

def presentedSymbol (a b : Fˣ) : SymbolPresentation F :=
  Submodule.Quotient.mk ((Additive.ofMul a) ⊗ₜ[ℤ] (Additive.ofMul b))

-- Representative pairing and presentation signatures.
theorem presentation_relations : IsSteinbergPairing (presentedSymbol (F := F)) := by sorry

theorem presentation_universal (c : Fˣ → Fˣ → A) (hc : IsSteinbergPairing c) :
    ∃! f : SymbolPresentation F →+ A, ∀ a b, f (presentedSymbol a b) = c a b := by sorry

theorem presentation_hom_ext (f g : SymbolPresentation F →+ A)
    (h : ∀ a b, f (presentedSymbol a b) = g (presentedSymbol a b)) : f = g := by sorry

-- presentation_F2
example : Subsingleton (SymbolPresentation (ZMod 2)) := by sorry
-- presentation_half
example : presentedSymbol (Units.mk0 (1 / 2 : ℚ) (by norm_num))
    (Units.mk0 (1 / 2 : ℚ) (by norm_num)) = 0 := by sorry

-- End milestone of the finite-field branch, independently of classical K₂.
theorem presentation_finite [Finite F] : Subsingleton (SymbolPresentation F) := by sorry

theorem pairing_finite [Finite F] {c : Fˣ → Fˣ → A}
    (hc : IsSteinbergPairing c) (a b : Fˣ) : c a b = 0 := by sorry

/-- A concrete detector; it is not an abstract or assumed Hilbert symbol. -/
noncomputable def realSignPairing (a b : ℝˣ) : ZMod 2 :=
  if (a : ℝ) < 0 ∧ (b : ℝ) < 0 then 1 else 0

theorem realSignPairing_isSteinberg : IsSteinbergPairing realSignPairing := by sorry

-- The construction target uses the explicit universal property, with no data hole.
theorem realSignDetector :
    ∃! f : SymbolPresentation ℝ →+ ZMod 2,
      ∀ a b, f (presentedSymbol a b) = realSignPairing a b := by sorry

-- sign_negative_negative; sign_pairing_values
example : realSignPairing (-1) (-1) = 1 := by sorry
-- sign_positive_negative
example : realSignPairing (Units.mk0 (2 : ℝ) (by norm_num)) (-1) = 0 ∧
    realSignPairing (-1) 1 = 0 := by sorry
-- sign_steinberg_pair
example : realSignPairing (-1) (Units.mk0 (2 : ℝ) (by norm_num)) = 0 := by sorry
-- sign_not_alternating
example : realSignPairing (-1) (-1) ≠ 0 := by sorry
-- presentation_real_nonzero
example : presentedSymbol (-1 : ℝˣ) (-1) ≠ 0 := by sorry

/-!
Additional README target names, including those needing constructed carriers:

pairing_identities, homogeneous_steinberg_ideal, graded_degree_two, field_lift_calculus,
field_cocycle_normalization, field_symbol_pairing, lifted_bruhat_generation,
field_symbol_generation, lifted_weyl_square_presentation, symbol_extension_local_relations,
symbol_extension_exact, finite_classical_vanishing, finite_milnor_vanishing,
infinite_symbol_injectivity, matsumoto_equivalence, matsumoto_natural, graded_symbol_signs,
milnor_gradedAlgebra, milnor_symbol_mem_degree, milnor_symbol_mul, milnor_symbol_multilinear,
milnor_hom_ext, milnor_low_degrees, milnor_degree_zero, milnor_unit_one, milnor_sandwich,
milnor_real_square, milnorFieldMap, milnorFieldMap_symbol, milnorFieldMap_id, milnorFieldMap_comp,
milnorFieldMap_degreeTwo, map_Q_R, map_F2_identity, map_order, symbolTorusExtension,
symbolTorus_inl_injective, symbolTorus_defect, symbolTorus_commutator, symbolTorus_map, torus_zero,
torus_adjacent, torus_real_defect, symbolMonomialExtension, symbolMonomial_torus,
symbolMonomial_square, symbolMonomial_braid, symbolMonomial_kernel, monomial_zero, monomial_square,
monomial_real_fourth, symbolExtensionSpace, symbolExtensionAction, symbolExtension_project,
symbolExtension_coeff, symbolExtension_weyl_branch, action_identity_cell, action_square,
action_zero, action_coeff_nontrivial, milnorToClassicalK2, milnorToClassicalK2_symbol,
milnorToClassicalK2_unique, milnorToClassicalK2_surjective, comparison_half, comparison_F2,
comparison_real_sign, realGradedSignDetector.
-/

end TauCetiRoadmap.K2SymbolsBrauer
