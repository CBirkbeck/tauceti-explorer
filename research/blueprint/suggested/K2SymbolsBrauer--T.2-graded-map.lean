import Mathlib.LinearAlgebra.TensorAlgebra.Basic
import Mathlib.Algebra.RingQuot
import Mathlib.Algebra.Group.TypeTags.Basic

/-!
# Milnor to Quillen comparison: statements at the pinned baseline

This file is not the roadmap and is not exhaustive. The reader document is
definitive; these statements suggest Lean forms so contributors and reviewers
can converge on names and signatures. This is not an implementation. Proofs
are intentionally omitted. The README specifies the Milnor grading, higher K-groups,
products, comparison maps, API and acceptance tests whose carriers are absent
at Mathlib 082e2d3 / Tau Ceti f790474. They are not replaced by axiomatic carriers.

The statements below check the existing tensor-algebra and ring-quotient
interfaces used by the imported Milnor universal property. `A` is an actual
integer algebra; this section does not call it Quillen K-theory.
-/

namespace TauCetiRoadmap.K2SymbolsBrauer.GradedMap

variable {F A : Type*} [Field F] [Ring A]

/-- The algebraic descent milestone, before the grading comparison.
The relation identifies each tensor Steinberg generator with zero. -/
theorem steinbergTensorDescent
    (f : Additive Fˣ →ₗ[ℤ] A)
    (h : ∀ u v : Fˣ, (u : F) + (v : F) = 1 →
      f (Additive.ofMul u) * f (Additive.ofMul v) = 0) :
    let r : TensorAlgebra ℤ (Additive Fˣ) → TensorAlgebra ℤ (Additive Fˣ) → Prop :=
      fun x y => ∃ u v : Fˣ, (u : F) + (v : F) = 1 ∧
        x = TensorAlgebra.ι ℤ (Additive.ofMul u) *
          TensorAlgebra.ι ℤ (Additive.ofMul v) ∧ y = 0
    ∃! g : RingQuot r →ₐ[ℤ] A,
      g.comp (RingQuot.mkAlgHom ℤ r) = TensorAlgebra.lift ℤ f := by
  sorry

/-- Uniqueness can be checked on degree-one generators of the tensor algebra. -/
theorem tensorMap_ext
    (g h : TensorAlgebra ℤ (Additive Fˣ) →ₐ[ℤ] A)
    (heq : ∀ u : Fˣ, g (TensorAlgebra.ι ℤ (Additive.ofMul u)) =
      h (TensorAlgebra.ι ℤ (Additive.ofMul u))) : g = h := by
  sorry

-- Empty tensor: the comparison must preserve the unit.
example (f : Additive Fˣ →ₗ[ℤ] A) :
    TensorAlgebra.lift ℤ f (1 : TensorAlgebra ℤ (Additive Fˣ)) = (1 : A) := by
  sorry

-- A symbol containing the multiplicative identity is zero.
example (f : Additive Fˣ →ₗ[ℤ] A) :
    TensorAlgebra.lift ℤ f (TensorAlgebra.ι ℤ (Additive.ofMul (1 : Fˣ))) = 0 := by
  sorry

-- Ordered product; changing order in a noncommutative target is not licensed.
example (f : Additive Fˣ →ₗ[ℤ] A) (u v w : Fˣ) :
    TensorAlgebra.lift ℤ f
      ((TensorAlgebra.ι ℤ (Additive.ofMul u) *
        TensorAlgebra.ι ℤ (Additive.ofMul v)) *
        TensorAlgebra.ι ℤ (Additive.ofMul w)) =
      (f (Additive.ofMul u) * f (Additive.ofMul v)) * f (Additive.ofMul w) := by
  sorry

-- The precise relation the quotient descent must kill.
example (f : Additive Fˣ →ₗ[ℤ] A)
    (h : ∀ u v : Fˣ, (u : F) + (v : F) = 1 →
      f (Additive.ofMul u) * f (Additive.ofMul v) = 0)
    (u v : Fˣ) (huv : (u : F) + (v : F) = 1) :
    TensorAlgebra.lift ℤ f
      (TensorAlgebra.ι ℤ (Additive.ofMul u) *
        TensorAlgebra.ι ℤ (Additive.ofMul v)) = 0 := by
  sorry

end TauCetiRoadmap.K2SymbolsBrauer.GradedMap

/-!
README-only targets, imported rather than redeclared:
* K2SymbolsBrauer:T.2/milnor-k-theory: graded Steinberg quotient and its lift.
* K2SymbolsBrauer:T.2/graded-map: milnorToQuillen, degree components, naturality,
  symbol evaluation, preservation of the unit/products and uniqueness.
* K2SymbolsBrauer:T.2/graded-map-degree-three: the ordered triple product.
New targets:
* K2SymbolsBrauer:T.2/unit-loop-product-symbol: for units a, b of a commutative
  ring, the product of the K1 classes of a and b is the classical Steinberg
  symbol {a,b} raised to a sign fixed once on the torus, transported by the
  classical-to-Quillen K2 comparison; the product of a and 1 - a vanishes.
* K2SymbolsBrauer:T.2/graded-map-degree-two-identification:
  milnorToQuillen_two equals the classical Matsumoto equivalence followed by the
  natural classical-to-Quillen K2 equivalence normalized by that sign.
The missing carriers (Quillen K-groups, their products and classical K2) preclude
signatures for these targets at the pins.
The generic descent theorem above proves no higher K-theory comparison.
-/
