import TauCeti.Algebra.Category.ModuleCat.CartanMap

/-!
# Z.6: degree-zero comparison and tests

This file is not the roadmap and is not exhaustive. The companion
KTheoryLowDegrees--Z.6.md is the definitive specification. These statements
suggest Lean forms so contributors and reviewers can converge on names and
signatures. The file follows the compact 2026-10-12 statement-only shape.
All proof admissions are intentional.

The reader imports the accepted Z.3 packet's 25 Z.6 targets and adds eight
comparison refinements. No second Cartan map or Euler-class definition is made.
The imports and signatures below use the pinned Tau Ceti f790474 and
Mathlib 082e2d3. The current upstream Cartan module has a different path.

Native coverage:
* resolution-euler-cartan-square: the existing categorical Euler/Cartan identity;
* projective-line-functorial-coordinates: integer arithmetic checks only.

Missing-carrier inventory, by packet node suffix:
* affine-comparison-diagram: explicit RingK0, Quillen/Waldhausen K and Perf
  comparisons are planned interfaces, not carriers in the pinned library.
* resolution-euler-cartan-square: its spectrum/affine/G-pullback portion needs
  those interfaces; the finite-resolution categorical portion is stated below.
* localisation-rank-pic-square: supported K and its comparison to RingK0/Pic.
* rank-pic-determinant-square: signed Picard groupoid spectrum and Perf K.
* projective-line-functorial-coordinates: K of the projective line and its
  pushforward/pullback; the arithmetic below does not assert those constructions.
* scheme-determinant-gluing-coherence: enhanced Perf, coherent determinant maps
  and descent mapping groupoids.
* witt-determinant-sheafification-square: formal Witt support K, the perfect
  scheme site and enriched one-truncation/sheafification.
* witt-filtered-base-change-square: enhanced filtrations and coherent additivity.

The imported definitions' named APIs and their discriminating tests are in the
reader, with their original owner IDs. They cannot be stated here until these
carriers exist. No placeholder structure, assumed comparison isomorphism or
proposition-valued substitute is used to make those targets elaborate.
-/

open CategoryTheory

namespace TauCeti.KTheoryLowDegrees.Z6

universe u

section ModuleComparison

variable (R : Type u) [Ring R]

/-- Native portion of resolution-euler-cartan-square. Only this module needs
    a finite projective resolution; no regularity of the ring is assumed. -/
theorem cartan_eulerClassOf {M : ModuleCat.{u} R}
    (hM : (ExactStructure.abelian (ModuleCat.{u} R)).admitsFiniteResolution
      (finiteProjectiveModules R) M) :
    cartanMap R (moduleEulerClassOf R hM) =
      ExactK0.of ⟨M, admitsFiniteResolution_le_finiteModules R M hM⟩ := by
  sorry

/-- The inverse normalisation uses the existing Cartan equivalence, with its
    actual hypothesis on every finitely generated module. -/
theorem cartan_inverse_on_module
    (h : ModuleCat.isFG R ≤
      (ExactStructure.abelian (ModuleCat.{u} R)).admitsFiniteResolution
        (finiteProjectiveModules R))
    {M : ModuleCat.{u} R} (hM : ModuleCat.isFG R M) :
    (cartanEquiv R h).symm (ExactK0.of ⟨M, hM⟩) =
      moduleEulerClassOf R (h M hM) := by
  sorry

-- One-term projective resolution: the source class must be the same class.
example {M : ModuleCat.{u} R} (hM : Module.Finite R M ∧ Module.Projective R M) :
    moduleEulerClassOf R (ExactStructure.le_admitsFiniteResolution _ _ M
      (finiteProjectiveModules_iff.mpr hM)) =
      ExactK0.of ⟨M, finiteProjectiveModules_iff.mpr hM⟩ := by
  sorry

-- The Cartan map preserves subtraction, including Euler signs.
example (x y : ExactK0.{u} (finiteProjectiveModulesExactStructure R)) :
    cartanMap R (x - y) = cartanMap R x - cartanMap R y := by
  sorry

end ModuleComparison

section ProjectiveLineArithmetic

-- Arithmetic shadows of the imported basis theorem, not a definition of K₀(P¹).
theorem projectiveLine_coordinate_involution (a b : ℤ) :
    ((a + b) + (-b), -(-b)) = (a, b) := by
  sorry

theorem projectiveLine_twist_coordinates (m : ℤ) :
    ((m + 1) + (-m), -(-m)) = (1, m) := by
  sorry

-- With t=[O(-1)] and t²=2t-1, compare both multiplication formulas.
theorem projectiveLine_product_coordinates (a b c d : ℤ) :
    ((a * c - b * d) + (a * d + b * c + 2 * b * d),
      -(a * d + b * c + 2 * b * d)) =
    ((a + b) * (c + d), (a + b) * (-d) + (c + d) * (-b)) := by
  sorry

-- Rational-point class: rank zero, degree one; it is not the zero class.
example : ((1 : ℤ) + (-1), -(-1 : ℤ)) = (0, 1) := by
  sorry

-- Negative twist: its Euler characteristic is -1, although its rank is 1.
example : ((-1 : ℤ) + 2, -(2 : ℤ)) = (1, -2) := by
  sorry

end ProjectiveLineArithmetic

end TauCeti.KTheoryLowDegrees.Z6
