/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Algebra.Category.ModuleCat.Projective
import Mathlib.Algebra.Group.Units.Defs
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.AlgebraicGeometry.Morphisms.Finite
import Mathlib.AlgebraicGeometry.Morphisms.Separated
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Pullbacks
import Mathlib.AlgebraicGeometry.Sites.Fpqc
import Mathlib.CategoryTheory.Abelian.Ext
import Mathlib.CategoryTheory.Comma.Over.Pullback
import Mathlib.CategoryTheory.Core
import Mathlib.CategoryTheory.Sites.Descent.IsStack
import Mathlib.CategoryTheory.Sites.Subcanonical
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.ZMod.Basic
import Mathlib.GroupTheory.OrderOfElement
import Mathlib.LinearAlgebra.Dual.Lemmas
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.TensorProduct.Map
import Mathlib.RingTheory.AdicCompletion.AsTensorProduct
import Mathlib.RingTheory.Flat.FaithfullyFlat.Basic
import Mathlib.RingTheory.Ideal.Cotangent
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.RingTheory.MvPolynomial.Basic
import TauCeti.AlgebraicGeometry.AbelianVariety.End.Basic
import TauCeti.AlgebraicGeometry.Cohomology.Basic
import TauCeti.AlgebraicGeometry.LineBundle.Class
import TauCeti.AlgebraicGeometry.LineBundle.TensorProduct

/-!
# Stable reduction of curves and stable maps, Part II

This file is not the roadmap and is not exhaustive. The definitive document is
`research/blueprint/readmes/StableReductionPartII.md`. These suggested Lean forms
help contributors and reviewers converge on names and signatures. Discharging
these statements does not finish a layer or the roadmap. Proofs are admitted.

The pins are Mathlib 082e2d3 and Tau Ceti f790474. Only light definitions over
native carriers and representative milestone statements appear here. Stable
pointed families, their stacks, Hilbert presentations, relative duality and
Picard functors, expansion and contraction, determinant of cohomology, Deligne
pairings and all of their geometric APIs remain targets in the reader. They
require the stated supplier interfaces; no synthetic carrier replaces them.

MC.0 records unrestricted section evaluation in native scheme slices. MC.1
records the integer tricanonical Hilbert profile. MC.2 records the nodal quadratic
and two matrices, and absolute stable reflexivity using canonical evaluation and
both native positive Ext families. Its two-base relative and completed-coefficient
theorems remain in the reader, as do the full polynomial-resolution calculations.
MC.3 gives pinned quotient/tensor examples for node incidence and unsigned
conormal symmetry. Current Tau Ceti already implements NodeAlgebra and its
Jacobian quotient; those post-pin results are imported in the reader, not planned
again. MC.4's Serre statements are abelian-owner supplier interfaces; the matrix
example checks only transvection order. MC.5 uses actual invertible sheaves and
class-to-isomorphism comparisons, without constructing Hodge or pairing lines.
MC.6 records the native finite map retaining both graph coordinates. MC.7 uses
the represented fppf sheaf and the categorical core of native line bundles;
relative classes, lift gerbes, obstruction and Picard torsors remain reader targets.

Every mathematical target, hypothesis, source locator, API and discriminating
check is retained in the reader, including those without expressible signatures
here. Elaboration checks only the present signatures and does not prove them.
-/

/-! ## MC.0 -/

section Part0

open CategoryTheory CategoryTheory.Limits AlgebraicGeometry

universe u

namespace TauCetiRoadmap.StableReductionPartII.MC0

variable {C S T : Scheme.{u}} (f : C ⟶ S) (u : T ⟶ S)

/-- The native scheme/slice statement underlying unrestricted universal evaluation.
The section on the pullback is sent to its composite with the first projection.
There is no smoothness or disjointness condition on the section. -/
theorem sectionEquiv_spec :
    ∃ e : (Over.mk (𝟙 T) ⟶ (Over.pullback u).obj (Over.mk f)) ≃
        { a : T ⟶ C // a ≫ f = u },
      ∀ s, (e s).val = s.left ≫ pullback.fst f u := by
  sorry

/-- In particular an existing marking is an allowed extra section after base change. -/
example (σ : S ⟶ C) (hσ : σ ≫ f = 𝟙 S) :
    ∃ s : Over.mk (𝟙 T) ⟶ (Over.pullback u).obj (Over.mk f),
      s.left ≫ pullback.fst f u = u ≫ σ := by
  sorry

/-- Any map into the total curve gives an extra section after its own base change.
This allows a node-valued map as soon as a geometric nodal family is supplied. -/
example (a : T ⟶ C) :
    ∃ s : Over.mk (𝟙 T) ⟶ (Over.pullback (a ≫ f)).obj (Over.mk f),
      s.left ≫ pullback.fst f (a ≫ f) = a := by
  sorry

/-- A fixed identification with the pulled-back family leaves no freedom in a section
once its evaluation map is fixed. This is the raw discreteness check for the
represented two-fibre product; it does not erase moduli automorphisms. -/
example (s t : Over.mk (𝟙 T) ⟶ (Over.pullback u).obj (Over.mk f))
    (h : s.left ≫ pullback.fst f u = t.left ≫ pullback.fst f u) :
    s = t := by
  sorry

end TauCetiRoadmap.StableReductionPartII.MC0

end Part0

/-! ## MC.1 -/

section Part1

namespace TauCetiRoadmap.StableReductionPartII.MC1

open Polynomial

/-- Numerical profile of the complete tricanonical embedding; its geometric use has g ≥ 2. -/
noncomputable def tricanonicalHilbertPolynomial (g : ℕ) : Polynomial ℤ :=
  C ((g : ℤ) - 1) * (6 * X - 1)

namespace tricanonicalHilbertPolynomial

theorem eval (g : ℕ) (a : ℤ) :
    (tricanonicalHilbertPolynomial g).eval a = ((g : ℤ) - 1) * (6 * a - 1) := by
  sorry

theorem coeff_one (g : ℕ) :
    (tricanonicalHilbertPolynomial g).coeff 1 = 6 * ((g : ℤ) - 1) := by
  sorry

theorem eval_zero (g : ℕ) :
    (tricanonicalHilbertPolynomial g).eval 0 = 1 - (g : ℤ) := by
  sorry

theorem eval_one (g : ℕ) :
    (tricanonicalHilbertPolynomial g).eval 1 = 5 * ((g : ℤ) - 1) := by
  sorry

theorem eval_two_mul (g : ℕ) (a : ℤ) :
    (tricanonicalHilbertPolynomial g).eval (2 * a) =
      ((g : ℤ) - 1) * (12 * a - 1) := by
  sorry

end tricanonicalHilbertPolynomial

-- tricanonicalHilbertPolynomial.genus_two
example : tricanonicalHilbertPolynomial 2 = 6 * X - 1 ∧
    (tricanonicalHilbertPolynomial 2).eval 1 = 5 := by
  sorry

-- tricanonicalHilbertPolynomial.genus_three
example : tricanonicalHilbertPolynomial 3 = 12 * X - 2 ∧
    (tricanonicalHilbertPolynomial 3).eval 1 = 10 := by
  sorry

-- tricanonicalHilbertPolynomial.genus_one
example : tricanonicalHilbertPolynomial 1 = 0 := by
  sorry

-- tricanonicalHilbertPolynomial.genus_zero: subtraction is in ℤ.
example : tricanonicalHilbertPolynomial 0 = 1 - 6 * X := by
  sorry

end TauCetiRoadmap.StableReductionPartII.MC1

end Part1

namespace TauCetiRoadmap.StableReductionPartII.MC2

variable {R S : Type*} [CommRing R] [CommRing S]

/-- The explicit binary quadratic form; nondegeneracy is a separate unit condition. -/
def NodeForm (γ δ x y : R) : R := x ^ 2 + γ * x * y + δ * y ^ 2

namespace NodeForm

def discriminant (γ δ : R) : R := γ ^ 2 - 4 * δ

def Nondegenerate (γ δ : R) : Prop := IsUnit (discriminant γ δ)

-- NodeForm.eval
theorem eval (γ δ x y : R) :
    NodeForm γ δ x y = x ^ 2 + γ * x * y + δ * y ^ 2 := sorry
-- NodeForm.map
theorem map (φ : R →+* S) (γ δ x y : R) :
    φ (NodeForm γ δ x y) = NodeForm (φ γ) (φ δ) (φ x) (φ y) := sorry
/-- The polynomial correction identity; power-series ideal membership is a supplier input. -/
-- NodeForm.linearCorrection
theorem linearCorrection (γ δ x y ε u v : R) (hε : ε ^ 2 = 0) :
    NodeForm γ δ (x + ε * (-2 * δ * u + γ * v))
      (y + ε * (γ * u - 2 * v)) =
      NodeForm γ δ x y + ε * discriminant γ δ * (x * u + y * v) := by
  sorry

-- NodeForm.split
example (x y : R) : NodeForm (0 : R) (-1) x y = x ^ 2 - y ^ 2 := sorry
example (h2 : IsUnit (2 : R)) : Nondegenerate (0 : R) (-1) := sorry
-- NodeForm.characteristicTwo
example (h2 : (2 : R) = 0) (x y : R) :
    Nondegenerate (1 : R) 0 ∧ NodeForm (1 : R) 0 x y = x ^ 2 + x * y := sorry
-- NodeForm.doubleLineExcluded
example : ¬ Nondegenerate (0 : ℤ) 0 := sorry
end NodeForm

namespace NodeSectionFactorization

def left (γ δ x y s t : R) : Matrix (Fin 2) (Fin 2) R :=
  Matrix.of fun i j =>
    if i = 0 then
      if j = 0 then δ * y + δ * t + γ * x else x + s + γ * t
    else
      if j = 0 then -(x - s) else y - t

def right (γ δ x y s t : R) : Matrix (Fin 2) (Fin 2) R :=
  Matrix.of fun i j =>
    if i = 0 then
      if j = 0 then y - t else -(x + s + γ * t)
    else
      if j = 0 then x - s else δ * y + δ * t + γ * x

-- NodeSectionFactorization.products
theorem products (γ δ x y s t : R) :
    left γ δ x y s t * right γ δ x y s t =
      Matrix.scalar (Fin 2) (NodeForm γ δ x y - NodeForm γ δ s t) ∧
    right γ δ x y s t * left γ δ x y s t =
      Matrix.scalar (Fin 2) (NodeForm γ δ x y - NodeForm γ δ s t) := sorry
-- NodeSectionFactorization.atOrigin
example (γ δ x y : R) :
    left γ δ x y 0 0 = Matrix.of (fun i j =>
      if i = 0 then
        if j = 0 then δ * y + γ * x else x
      else
        if j = 0 then -x else y) := sorry
-- NodeSectionFactorization.characteristicTwo
example (h2 : (2 : R) = 0) (x y s t : R) :
    left 1 0 x y s t * right 1 0 x y s t =
      Matrix.scalar (Fin 2) (x ^ 2 + x * y - (s ^ 2 + s * t)) := sorry
-- NodeSectionFactorization.repeatedRootExcluded
example : ¬ NodeForm.Nondegenerate (0 : ℤ) 0 := sorry

end NodeSectionFactorization

end TauCetiRoadmap.StableReductionPartII.MC2

/-! ## MC.2 -/

section Part2

noncomputable section

open CategoryTheory CategoryTheory.Limits
open scoped TensorProduct

namespace TauCetiRoadmap.StableReductionPartII.MC2

universe u

variable (R : Type u) [CommRing R]
variable (M : Type u) [AddCommGroup M] [Module R M]

/-- Absolute stable reflexivity, using the canonical evaluation and both Ext families. -/
def IsStablyReflexive : Prop :=
  Module.IsReflexive R M ∧
    (∀ n : ℕ,
      IsZero (((_root_.Ext R (ModuleCat R) (n + 1)).obj
        (Opposite.op (ModuleCat.of R M))).obj (ModuleCat.of R R))) ∧
    (∀ n : ℕ,
      IsZero (((_root_.Ext R (ModuleCat R) (n + 1)).obj
        (Opposite.op (ModuleCat.of R (Module.Dual R M)))).obj
          (ModuleCat.of R R)))

/-- Forgetting stable reflexivity retains the existing reflexivity predicate. -/
theorem IsStablyReflexive.isReflexive (h : IsStablyReflexive R M) :
    Module.IsReflexive R M := by
  sorry

/-- The bidual isomorphism is specifically the native evaluation map. -/
theorem IsStablyReflexive.bijective_eval (h : IsStablyReflexive R M) :
    Function.Bijective (Module.Dual.eval R M) := by
  sorry

/-- Finite projective modules satisfy the absolute predicate. -/
theorem isStablyReflexive_of_finite_projective
    [Module.Finite R M] [Module.Projective R M] :
    IsStablyReflexive R M := by
  sorry

/-- Duality preserves the predicate for finite modules over a Noetherian ring. -/
theorem IsStablyReflexive.dual [IsNoetherianRing R] [Module.Finite R M]
    (h : IsStablyReflexive R M) : IsStablyReflexive R (Module.Dual R M) := by
  sorry

/-- Linear equivalences transport stable reflexivity. -/
theorem isStablyReflexive_iff_of_linearEquiv
    {N : Type u} [AddCommGroup N] [Module R N] (e : M ≃ₗ[R] N) :
    IsStablyReflexive R M ↔ IsStablyReflexive R N := by
  sorry

/-- Noetherian completion is faithfully flat when its ideal lies in the Jacobson radical. -/
theorem isStablyReflexive_completion_iff [IsNoetherianRing R]
    [Module.Finite R M] (I : Ideal R) (hI : I ≤ Ideal.jacobson (⊥ : Ideal R)) :
    IsStablyReflexive (AdicCompletion I R)
      (AdicCompletion I R ⊗[R] M) ↔ IsStablyReflexive R M := by
  sorry

/-- The zero module is included. -/
example : IsStablyReflexive R (Fin 0 → R) := by
  sorry

/-- Finite free modules are included, even over a nonreduced coefficient ring. -/
example : IsStablyReflexive (ZMod 4) (Fin 2 → ZMod 4) := by
  sorry

/-- Torsion over the integers fails already at canonical biduality. -/
example : ¬ IsStablyReflexive ℤ (ZMod 2) := by
  sorry

end TauCetiRoadmap.StableReductionPartII.MC2

end

end Part2

/-! ## MC.3 -/

section Part3

namespace TauCetiRoadmap.StableReductionPartII.MC3

open MvPolynomial
open scoped TensorProduct

universe u v w

noncomputable section

/-- The ring of the chart `xy = q`, over an arbitrary commutative ring. -/
abbrev NodeChart (R : Type u) [CommRing R] (q : R) :=
  MvPolynomial (Fin 2) R ⧸ Ideal.span {X 0 * X 1 - C q}

/-- The two branch coordinates in the chart. -/
abbrev branchCoordinate (R : Type u) [CommRing R] (q : R) (i : Fin 2) :
    NodeChart R q :=
  Ideal.Quotient.mk (Ideal.span {X 0 * X 1 - C q}) (X i)

/-- The Jacobian singular scheme has base ring `R/(q)`, including nilpotent bases. -/
example (R : Type u) [CommRing R] (q : R) :
    Nonempty ((NodeChart R q ⧸
      Ideal.span {branchCoordinate R q 0, branchCoordinate R q 1}) ≃ₐ[R]
        (R ⧸ Ideal.span {q})) := by
  sorry

/-- A persistent split node has one copy of the base in its singular scheme. -/
example (R : Type u) [CommRing R] :
    Nonempty ((NodeChart R 0 ⧸
      Ideal.span {branchCoordinate R 0 0, branchCoordinate R 0 1}) ≃ₐ[R] R) := by
  sorry

/-- A unit smoothing parameter leaves no singular scheme. -/
example (R : Type u) [CommRing R] (q : R) (hq : IsUnit q) :
    Subsingleton (NodeChart R q ⧸
      Ideal.span {branchCoordinate R q 0, branchCoordinate R q 1}) := by
  sorry

-- Nonlinear changes of node charts and geometric atlas descent are README targets.
-- These examples check only their induced action on the two cotangent factors.
section TensorTransitions

variable (R : Type u) [CommRing R]
variable (M : Type v) (N : Type w)
variable [AddCommGroup M] [Module R M] [AddCommGroup N] [Module R N]

-- The multiplier of the conormal generator is the product of the two slopes.
example (a b : Rˣ) (dx : M) (dy : N) :
    TensorProduct.map ((a : R) • (LinearMap.id : M →ₗ[R] M))
      ((b : R) • (LinearMap.id : N →ₗ[R] N)) (dx ⊗ₜ[R] dy) =
        ((a : R) * (b : R)) • (dx ⊗ₜ[R] dy) := by
  sorry

-- Exchange has no sign; these are ungraded cotangent lines.
example (dx : M) (dy : N) :
    TensorProduct.comm R M N (dx ⊗ₜ[R] dy) = dy ⊗ₜ[R] dx := by
  sorry

-- Applying exchange twice is the identity.
example (z : M ⊗[R] N) :
    TensorProduct.comm R N M (TensorProduct.comm R M N z) = z := by
  sorry

-- The product transition law satisfies the ordinary cocycle identity.
example (f₁ f₂ : M →ₗ[R] M) (g₁ g₂ : N →ₗ[R] N) (z : M ⊗[R] N) :
    TensorProduct.map f₂ g₂ (TensorProduct.map f₁ g₁ z) =
      TensorProduct.map (f₂.comp f₁) (g₂.comp g₁) z := by
  sorry

end TensorTransitions

-- Characteristic two retains unsigned tensor symmetry. This says nothing about
-- exactness of invariants or replacing the constant exchange group by μ₂.
example :
    TensorProduct.comm (ZMod 2) (ZMod 2) (ZMod 2)
      ((1 : ZMod 2) ⊗ₜ[ZMod 2] (1 : ZMod 2)) =
        ((1 : ZMod 2) ⊗ₜ[ZMod 2] (1 : ZMod 2)) := by
  sorry

-- The zero-ring base has empty spectrum, as required by the incidence convention.
example : Subsingleton (NodeChart (ZMod 1) 0) := by
  sorry

end

end TauCetiRoadmap.StableReductionPartII.MC3

end Part3

/-! ## MC.4 -/

section Part4

namespace TauCetiRoadmap.StableReductionPartII.MC4

open TauCeti.AlgebraicGeometry

/-- Serre's appendix, pp.17-18--17-20: finite-order endomorphisms congruent to
one modulo N >= 3 are the identity. Divisibility is in the endomorphism ring,
so the condition concerns the torsion kernel as a group scheme. -/
theorem serre_level_rigidity {K : Type*} [Field K]
    (A : AbelianVariety K) (N : ℕ) (hN : 3 ≤ N)
    (u : AbelianVariety.End A) (hu : IsOfFinOrder u)
    (hlevel : ∃ v : AbelianVariety.End A, u - 1 = (N : AbelianVariety.End A) * v) :
    u = 1 := by
  sorry

/-- Level two yields an involution, rather than identity. -/
theorem serre_level_two {K : Type*} [Field K]
    (A : AbelianVariety K) (u : AbelianVariety.End A) (hu : IsOfFinOrder u)
    (hlevel : ∃ v : AbelianVariety.End A, u - 1 = (2 : AbelianVariety.End A) * v) :
    u ^ 2 = 1 := by
  sorry

/-- A primitive Picard--Lefschetz transvection has exact order N modulo N.
This does not assert that the whole level deck group has order invertible on the base. -/
theorem boundary_transvection_order (N : ℕ) (hN : 2 ≤ N) :
    orderOf (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) (ZMod N)) = N := by
  sorry

example : orderOf (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) (ZMod 3)) = 3 := by
  sorry

example : orderOf (!![1, 1; 0, 1] : Matrix (Fin 2) (Fin 2) (ZMod 4)) = 4 := by
  sorry

/-- The level-two involution is already visible on an integral rank-one module. -/
example : (-1 : ℤ) ≠ 1 ∧ (-1 : ℤ) ^ 2 = 1 ∧ ∃ v : ℤ, -1 - 1 = 2 * v := by
  sorry

end TauCetiRoadmap.StableReductionPartII.MC4

end Part4

/-! ## MC.5 -/

section Part5

open CategoryTheory AlgebraicGeometry
open TauCeti.AlgebraicGeometry

namespace TauCetiRoadmap.StableReductionPartII.MC5

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

end TauCetiRoadmap.StableReductionPartII.MC5

end Part5

/-! ## MC.6 -/

section Part6

open CategoryTheory CategoryTheory.Limits AlgebraicGeometry

namespace TauCetiRoadmap.StableReductionPartII.MC6

universe u

/-- Native scheme milestone in retaining the base in graph closure.
The separated map is the moduli-cover coordinate `v`; its base change to `S`
is the first projection. Finiteness of `q` then implies finiteness of the map
remembering both `q` and `r`. This does not assert that the map is a monomorphism. -/
theorem finite_retainedBaseMap
    {W S V B : Scheme.{u}} (s : S ⟶ B) (v : V ⟶ B)
    (q : W ⟶ S) (r : W ⟶ V) (h : q ≫ s = r ≫ v)
    [IsFinite q] [IsSeparated v] :
    IsFinite (pullback.lift q r h) := by
  sorry

-- Keeping the first coordinate recovers the original map to the base.
example {W S V B : Scheme.{u}} (s : S ⟶ B) (v : V ⟶ B)
    (q : W ⟶ S) (r : W ⟶ V) (h : q ≫ s = r ≫ v) :
    pullback.lift q r h ≫ pullback.fst s v = q := by
  sorry

-- Keeping the second coordinate recovers the universal-family cover map.
example {W S V B : Scheme.{u}} (s : S ⟶ B) (v : V ⟶ B)
    (q : W ⟶ S) (r : W ⟶ V) (h : q ≫ s = r ≫ v) :
    pullback.lift q r h ≫ pullback.snd s v = r := by
  sorry

-- If the cover coordinate is the base itself, the retained map still remembers q.
example {W S B : Scheme.{u}} (s : S ⟶ B) (q : W ⟶ S) :
    pullback.lift q (q ≫ s) (by simp) ≫ pullback.fst s (𝟙 B) = q := by
  sorry

end TauCetiRoadmap.StableReductionPartII.MC6

end Part6

/-! ## MC.7 -/

section Part7

open AlgebraicGeometry CategoryTheory Opposite
open TauCeti.AlgebraicGeometry

namespace TauCetiRoadmap.StableReductionPartII.MC7

universe u

/-- The native fppf sheaf represented by a scheme. -/
abbrev representedFppf (P : Scheme.{u}) :=
  Scheme.fppfTopology.yoneda.obj P

/-- Points over a fixed base morphism, in the actual represented sheaf. -/
abbrev parameterFiber {P M T : Scheme.{u}} (p : P ⟶ M) (t : T ⟶ M) :=
  {x : (representedFppf P).obj.obj (op T) // x ≫ p = t}

/-- The actual fixed-curve line-bundle groupoid; noninvertible maps are removed. -/
abbrev lineGroupoid (X : Scheme.{u}) :=
  Core (InvertibleSheaf X)

/-- Forget a line-bundle object down to its native absolute isomorphism class. -/
def lineClass {X : Scheme.{u}} (L : lineGroupoid X) : LineBundleClass X :=
  LineBundleClass.mk L.of

/-- The fixed-curve part of MC.7/actual-triples-groupoid uses isomorphisms,
not arbitrary maps of the underlying modules. -/
theorem lineClass_eq_iff {X : Scheme.{u}} (L K : lineGroupoid X) :
    lineClass L = lineClass K ↔ Nonempty (L ⟶ K) := by
  sorry

/-- Tensor on the native carriers agrees with the existing class operation. -/
theorem lineClass_tensor {X : Scheme.{u}} (L K : lineGroupoid X) :
    lineClass (⟨InvertibleSheaf.tensorProduct L.of K.of⟩ : lineGroupoid X) =
      lineClass L * lineClass K := by
  sorry

/-- The sheaf's restriction acts by actual composition of scheme morphisms. -/
example {P T U : Scheme.{u}} (a : U ⟶ T)
    (x : (representedFppf P).obj.obj (op T)) :
    (representedFppf P).obj.map a.op x = a ≫ x := by
  sorry

/-- Fibre membership includes the equation over the base. -/
example {P M T : Scheme.{u}} (p : P ⟶ M) (t : T ⟶ M)
    (x : parameterFiber p t) : x.val ≫ p = t := by
  sorry

/-- Test the unit against Tau Ceti's actual trivial invertible sheaf. -/
example (X : Scheme.{u}) :
    lineClass (⟨InvertibleSheaf.trivial X⟩ : lineGroupoid X) =
      (1 : LineBundleClass X) := by
  sorry

/-- An actual line-bundle isomorphism supplies a morphism in the groupoid. -/
example {X : Scheme.{u}} (L K : lineGroupoid X) (e : L.of ≅ K.of) :
    Nonempty (L ⟶ K) := by
  sorry

end TauCetiRoadmap.StableReductionPartII.MC7

end Part7
