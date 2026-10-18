import TauCeti.AlgebraicGeometry.LineBundle.Class
import Mathlib.Data.ZMod.Basic

/-!
# Hodge determinant and integral Noether comparison: carrier checks

This is a suggested interface, not an implementation. The declarations below
state checks against the pinned libraries; their proofs are deliberately omitted.

This file is not exhaustive and is not the roadmap. Discharging these statements
does not finish MC.5. The reader is definitive for the complete mathematical
targets, hypotheses, APIs and worked examples, in
`research/blueprint/readmes/StableReductionPartII--MC.5.md`.

The pins have actual scheme modules, invertible sheaves, tensor products and
isomorphism classes. They do not have the stable-moduli stack, its universal
curve, perfect direct images or the Deligne pairing. Those targets remain in
the reader document. In particular, the line bundles below are parameters;
this file neither constructs nor identifies any of them with a Hodge line.
The scalar examples check signs only, not the geometry producing those signs.
-/

open CategoryTheory AlgebraicGeometry
open TauCeti.AlgebraicGeometry

namespace StableReductionPartII.MC5

universe u

variable {X Y : Scheme.{u}}

/-- The scheme-level class-to-isomorphism interface needed after constructing
the three actual lines in the Noether formula. -/
theorem comparison_class_iff (A B C : InvertibleSheaf X) :
    LineBundleClass.mk A = LineBundleClass.mk B * LineBundleClass.mk C ↔
      Nonempty (A.obj ≅ (InvertibleSheaf.tensorProduct B C).obj) := by
  sorry

/-- Comparisons form a torsor under automorphisms of the source. Identifying
these automorphisms with global units is a separate Picard-groupoid target. -/
theorem comparison_unique_ratio {A B : InvertibleSheaf X} (e e' : A ≅ B) :
    ∃! a : A ≅ A, a ≪≫ e = e' := by
  sorry

/-- Pullback transports an actual sheaf comparison, without a flatness
assumption. Invertibility and stack descent are not asserted here. -/
theorem comparison_pullback (f : Y ⟶ X) {A B : InvertibleSheaf X}
    (e : A.obj ≅ B.obj) :
    Nonempty ((Scheme.Modules.pullback f).obj A.obj ≅
      (Scheme.Modules.pullback f).obj B.obj) := by
  sorry

/-- The comparison of two choices is transported by the same pullback functor. -/
theorem comparison_pullback_ratio (f : Y ⟶ X) {A B : InvertibleSheaf X}
    (a : A.obj ≅ A.obj) (e : A.obj ≅ B.obj) :
    (Scheme.Modules.pullback f).mapIso (a ≪≫ e) =
      (Scheme.Modules.pullback f).mapIso a ≪≫
        (Scheme.Modules.pullback f).mapIso e := by
  sorry

-- Agreement with the existing tensor unit, rather than a new line carrier.
example (A : InvertibleSheaf X) :
    Nonempty ((InvertibleSheaf.tensorProduct A (InvertibleSheaf.trivial X)).obj ≅
      A.obj) := by
  sorry

example (A : InvertibleSheaf X) :
    LineBundleClass.mk A =
      LineBundleClass.mk A * LineBundleClass.mk (InvertibleSheaf.trivial X) := by
  sorry

-- A class equality records existence, not a preferred comparison.
example {A B : InvertibleSheaf X} (e : A ≅ B) :
    (∃! a : A ≅ A, a ≪≫ e = e) := by
  sorry

-- Separating clutching of two genus-one components: odd block interchange.
example : (-1 : ℤ) ^ (1 * 1) = -1 := by
  sorry

-- A genus-zero block contributes no determinant sign.
example (g : ℕ) : (-1 : ℤ) ^ (0 * g) = 1 := by
  sorry

-- Equal Deligne-pairing arguments of odd degree can have nontrivial symmetry.
example : (-1 : ℤ) ^ 1 ≠ 1 := by
  sorry

-- The dualizing degree 2g-2 is even in the unpointed range g ≥ 2.
example (g : ℕ) (hg : 2 ≤ g) : (-1 : ℤ) ^ (2 * g - 2) = 1 := by
  sorry

-- The two universal signs may specialize to the same automorphism.
example : (-1 : ZMod 2) = 1 := by
  sorry

-- A base can have units other than the two universal integer units.
example : ∃ a : ℚ, a ≠ 0 ∧ a ≠ 1 ∧ a ≠ -1 := by
  sorry

end StableReductionPartII.MC5
