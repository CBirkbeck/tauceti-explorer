/-
This file is not the roadmap and is not exhaustive. The reader document is definitive.
These statements suggest Lean forms so contributors converge on names and signatures.
Heavy targets (graded Milnor groups, Steinberg extensions, and their comparisons) are
specified in the README. No substitute carriers or data definitions with missing bodies
are introduced here. Mathematical proofs below remain roadmap targets.
-/
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.Basic.Real.Basic
import Mathlib.Data.ZMod.Basic

open scoped TensorProduct

namespace TauCeti.FieldSymbols

variable (F : Type*) [Field F]

abbrev SymbolTensor := Additive Fˣ ⊗[ℤ] Additive Fˣ

/-- The additive relation subgroup, not a commutative ideal in a tensor algebra. -/
def steinbergRelations : Submodule ℤ (SymbolTensor F) :=
  Submodule.span ℤ {t | ∃ a b : Fˣ, (a : F) + (b : F) = 1 ∧
    t = Additive.ofMul a ⊗ₜ[ℤ] Additive.ofMul b}

abbrev SymbolGroup := SymbolTensor F ⧸ steinbergRelations F

/-- A light degree-two presentation of the inherited Milnor target. -/
def symbol (a b : Fˣ) : SymbolGroup F :=
  (steinbergRelations F).mkQ (Additive.ofMul a ⊗ₜ[ℤ] Additive.ofMul b)

variable {F}

theorem symbol_mul_left (a b c : Fˣ) :
    symbol F (a * b) c = symbol F a c + symbol F b c := by sorry

theorem symbol_mul_right (a b c : Fˣ) :
    symbol F a (b * c) = symbol F a b + symbol F a c := by sorry

theorem symbol_steinberg (a b : Fˣ) (h : (a : F) + (b : F) = 1) :
    symbol F a b = 0 := by sorry

theorem symbol_one_left (a : Fˣ) : symbol F 1 a = 0 := by sorry

theorem symbol_one_right (a : Fˣ) : symbol F a 1 = 0 := by sorry

theorem symbol_inv_left (a b : Fˣ) : symbol F a⁻¹ b = -symbol F a b := by sorry

theorem symbol_negative (a : Fˣ) : symbol F a (-a) = 0 := by sorry

theorem symbol_swap (a b : Fˣ) : symbol F a b = -symbol F b a := by sorry

theorem symbol_square (a : Fˣ) : symbol F a a = symbol F a (-1) := by sorry

theorem symbol_square_two (a : Fˣ) : (2 : ℤ) • symbol F a a = 0 := by sorry

theorem symbol_char_two [CharP F 2] (a : Fˣ) : symbol F a a = 0 := by sorry

/-- The quotient's universal property; no construction theory is developed here. -/
theorem universal {A : Type*} [AddCommGroup A] [Module ℤ A]
    (f : Additive Fˣ →ₗ[ℤ] Additive Fˣ →ₗ[ℤ] A)
    (hf : ∀ a b : Fˣ, (a : F) + (b : F) = 1 → f (Additive.ofMul a) (Additive.ofMul b) = 0) :
    ∃! g : SymbolGroup F →ₗ[ℤ] A,
      ∀ a b : Fˣ, g (symbol F a b) = f (Additive.ofMul a) (Additive.ofMul b) := by sorry

theorem hom_ext {A : Type*} [AddCommGroup A] [Module ℤ A]
    (f g : SymbolGroup F →ₗ[ℤ] A)
    (h : ∀ a b, f (symbol F a b) = g (symbol F a b)) : f = g := by sorry

theorem map_exists {E : Type*} [Field E] (f : F →+* E) :
    ∃! g : SymbolGroup F →ₗ[ℤ] SymbolGroup E,
      ∀ a b, g (symbol F a b) = symbol E (Units.map f.toMonoidHom a)
        (Units.map f.toMonoidHom b) := by sorry

theorem finite_subsingleton [Finite F] : Subsingleton (SymbolGroup F) := by sorry

/-- The torsion argument used in every degree at least two. -/
theorem quotient_mul_bijective {M : Type*} [AddCommGroup M] [Module ℤ M]
    (R : Submodule ℤ M) (p : ℕ)
    (hM : Function.Bijective (fun x : M => p • x))
    (hR : Function.Surjective (fun x : R => p • x)) :
    Function.Bijective (fun x : M ⧸ R => p • x) := by sorry

theorem tensor_mul_bijective {U V : Type*}
    [AddCommGroup U] [Module ℤ U] [AddCommGroup V] [Module ℤ V]
    (p : ℕ) (hp : 0 < p)
    (hU : Function.Surjective (fun x : U => p • x))
    (hV : Function.Surjective (fun x : V => p • x)) :
    Function.Bijective (fun x : U ⊗[ℤ] V => p • x) := by sorry

theorem alg_closed_mul_bijective [IsAlgClosed F] (p : ℕ) (hp : 0 < p) :
    Function.Bijective (fun x : SymbolGroup F => p • x) := by sorry

/-- The real positive-entry subgroup, in the carrier already present at the pins. -/
noncomputable def realPositive : Submodule ℤ (SymbolGroup ℝ) :=
  Submodule.span ℤ {x | ∃ a b : ℝˣ, (0 < (a : ℝ) ∨ 0 < (b : ℝ)) ∧
    x = symbol ℝ a b}

theorem realPositive_divisible (m : ℕ) (hm : 0 < m) :
    Function.Surjective (fun x : realPositive => m • x) := by sorry

theorem real_sign_exists : ∃ s : SymbolGroup ℝ →ₗ[ℤ] ZMod 2,
    (∀ a b, s (symbol ℝ a b) =
      if (a : ℝ) < 0 ∧ (b : ℝ) < 0 then 1 else 0) ∧
    LinearMap.ker s = realPositive := by sorry

theorem real_minus_one_nonzero : symbol ℝ (-1) (-1) ≠ 0 := by sorry

theorem real_decomposition :
    Nonempty (SymbolGroup ℝ ≃ₗ[ℤ] ZMod 2 × realPositive) := by sorry

theorem realPositive_contains (a b : ℝˣ) (h : 0 < (a : ℝ) ∨ 0 < (b : ℝ)) :
    symbol ℝ a b ∈ realPositive := by sorry

theorem realPositive_excludes_minus_one : symbol ℝ (-1) (-1) ∉ realPositive := by sorry

-- Degree-two presentation checks: wrong scalar base, relation, or zero quotient fails these.
-- TauCeti.FieldSymbols.test_one
example (a : Fˣ) : symbol F 1 a = 0 := by sorry
-- TauCeti.FieldSymbols.test_complement
example (a b : Fˣ) (h : (a : F) + (b : F) = 1) : symbol F a b = 0 := by sorry
-- TauCeti.FieldSymbols.test_not_exterior
example : symbol ℝ (-1) (-1) ≠ 0 := by sorry
-- TauCeti.FieldSymbols.test_zero_map
example (a b : Fˣ) : (0 : SymbolGroup F →ₗ[ℤ] ℤ) (symbol F a b) = 0 := by sorry
-- TauCeti.FieldSymbols.test_finite
example : Subsingleton (SymbolGroup (ZMod 3)) := by sorry
-- TauCeti.FieldSymbols.test_char_two
example (a : (ZMod 2)ˣ) : symbol (ZMod 2) a a = 0 := by sorry

-- TauCeti.FieldSymbols.test_positive_entry
example (a b : ℝˣ) (h : 0 < (a : ℝ)) : symbol ℝ a b ∈ realPositive := by sorry
-- TauCeti.FieldSymbols.test_positive_nonexample
example : symbol ℝ (-1) (-1) ∉ realPositive := by sorry
-- TauCeti.FieldSymbols.test_positive_root
example : Function.Surjective (fun x : realPositive => (2 : ℕ) • x) := by sorry

end TauCeti.FieldSymbols

/- README-only targets: the definitions and proofs use carriers not yet at the pins.
The reader document gives each exact statement, API, discriminating check and source.
TauCeti.FieldSymbols.SymbolTensor
TauCeti.FieldSymbols.steinbergRelations
TauCeti.FieldSymbols.SymbolGroup
TauCeti.FieldSymbols.symbol
TauCeti.FieldSymbols.symbol_mul_left
TauCeti.FieldSymbols.symbol_mul_right
TauCeti.FieldSymbols.symbol_steinberg
TauCeti.FieldSymbols.symbol_one_left
TauCeti.FieldSymbols.symbol_one_right
TauCeti.FieldSymbols.symbol_inv_left
TauCeti.FieldSymbols.universal
TauCeti.FieldSymbols.hom_ext
TauCeti.FieldSymbols.map_exists
TauCeti.MilnorK.degreePresentation
TauCeti.MilnorK.degreeTwoEquiv
TauCeti.MilnorK.relationComponent
TauCeti.MilnorK.gradedQuotientEquiv
TauCeti.MilnorK.concat_quotient
TauCeti.MilnorK.degreePresentation_natural
TauCeti.MilnorK.test_degree_zero
TauCeti.MilnorK.test_degree_one
TauCeti.MilnorK.test_degree_two
TauCeti.MilnorK.test_noncommutative_tensor
TauCeti.FieldSymbolExtension.torusFactor
TauCeti.FieldSymbolExtension.torusSection_mul
TauCeti.FieldSymbolExtension.torus_injective
TauCeti.FieldSymbolExtension.simple_defect
TauCeti.FieldSymbolExtension.torus_coordinates
TauCeti.FieldSymbolExtension.test_rank_three_factor
TauCeti.FieldSymbolExtension.test_torus_identity
TauCeti.FieldSymbolExtension.test_torus_zero_symbol
TauCeti.FieldSymbolExtension.test_torus_cartan_sign
TauCeti.FieldSymbolExtension.normalizer
TauCeti.FieldSymbolExtension.normalizer_exact
TauCeti.FieldSymbolExtension.weyl_torus
TauCeti.FieldSymbolExtension.simple_square
TauCeti.FieldSymbolExtension.simple_braid
TauCeti.FieldSymbolExtension.test_normalizer_square
TauCeti.FieldSymbolExtension.test_normalizer_adjacent
TauCeti.FieldSymbolExtension.test_normalizer_zero
TauCeti.FieldSymbolExtension.bruhatFiber
TauCeti.FieldSymbolExtension.left_unipotent
TauCeti.FieldSymbolExtension.left_torus
TauCeti.FieldSymbolExtension.left_simple
TauCeti.FieldSymbolExtension.fiber_translate
TauCeti.FieldSymbolExtension.test_fiber_identity
TauCeti.FieldSymbolExtension.test_fiber_unipotent
TauCeti.FieldSymbolExtension.test_fiber_faithful
TauCeti.FieldSymbolExtension.test_fiber_not_group
TauCeti.MilnorK.realPositive
TauCeti.MilnorK.realSign
TauCeti.MilnorK.realSign_kernel
TauCeti.MilnorK.realDecomposition
TauCeti.MilnorK.realPositive_divisible
TauCeti.FieldSymbols.realPositive
TauCeti.FieldSymbols.realPositive_divisible
TauCeti.FieldSymbols.real_sign_exists
TauCeti.FieldSymbols.real_minus_one_nonzero
TauCeti.FieldSymbols.real_decomposition
TauCeti.FieldSymbols.realPositive_contains
TauCeti.FieldSymbols.realPositive_excludes_minus_one
TauCeti.MilnorK.test_real_degree_one
TauCeti.MilnorK.test_real_zero_boundary
-/
