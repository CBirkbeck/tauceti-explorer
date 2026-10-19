/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Data.Nat.Digits.Lemmas
import Mathlib.Data.ZMod.Basic
import Mathlib.AlgebraicGeometry.Morphisms.Etale
import Mathlib.AlgebraicGeometry.Morphisms.ClosedImmersion
import Mathlib.AlgebraicGeometry.Geometrically.Integral

/-!
# Prescribed finite-field points: suggested forms

This file is not the roadmap and is not exhaustive. The definitive document is
`LefschetzPencilsAndVanishingCyclesPartII.md`. These signatures suggest names and Lean forms
for contributors and reviewers; they make no implementation claim.

The sole new definition is evaluation on an existing polynomial carrier. The marked component
construction and its complete API are README targets. Its milestone below states an existence
theorem on existing schemes; it does not introduce a placeholder curve carrier. The reader
also records the component inclusion in the pullback. No new scheme theory is developed here.
-/

noncomputable section
open scoped BigOperators
open CategoryTheory AlgebraicGeometry

namespace TauCeti.SameFieldCurves

section PolynomialGraph

variable {k : Type*} [CommRing k]

/-- Coordinates of the polynomial graph, numbered starting at zero. -/
def polynomialGraph (m B : ℕ) : MvPolynomial (Fin m) k →+* Polynomial k :=
  MvPolynomial.eval₂Hom Polynomial.C (fun i => Polynomial.X ^ (B ^ i.val))

lemma polynomialGraph_C (m B : ℕ) (a : k) :
    polynomialGraph m B (MvPolynomial.C a) = Polynomial.C a := by sorry

lemma polynomialGraph_X (m B : ℕ) (i : Fin m) :
    polynomialGraph m B (MvPolynomial.X i : MvPolynomial (Fin m) k) =
      Polynomial.X ^ (B ^ i.val) := by sorry

lemma polynomialGraph_monomial (m B : ℕ) (d : Fin m →₀ ℕ) (a : k) :
    polynomialGraph m B (MvPolynomial.monomial d a) =
      Polynomial.C a * Polynomial.X ^ (∑ i : Fin m, d i * B ^ i.val) := by sorry

lemma polynomialGraph_eval_zero (m B : ℕ) (hB : 2 ≤ B)
    (h : MvPolynomial (Fin m) k) :
    Polynomial.eval 0 (polynomialGraph m B h) = MvPolynomial.eval (fun _ => 0) h := by
  sorry

lemma polynomialGraph_one_variable (B : ℕ) (h : MvPolynomial (Fin 1) k) :
    polynomialGraph 1 B h = MvPolynomial.eval₂Hom Polynomial.C (fun _ => Polynomial.X) h := by
  sorry

lemma polynomialGraph_map {K : Type*} [CommRing K] (f : k →+* K) (m B : ℕ)
    (h : MvPolynomial (Fin m) k) :
    Polynomial.map f (polynomialGraph m B h) =
      polynomialGraph m B (MvPolynomial.map f h) := by sorry

/-- Bounded base-B digits prevent cancellation between distinct monomials. -/
theorem polynomialGraph_coeff (m B : ℕ) (hB : 2 ≤ B)
    (h : MvPolynomial (Fin m) k)
    (hh : ∀ d ∈ h.support, ∀ i, d i < B)
    (d : Fin m →₀ ℕ) (hd : ∀ i, d i < B) :
    (polynomialGraph m B h).coeff (∑ i : Fin m, d i * B ^ i.val) = h.coeff d := by
  sorry

/-- The zeroth coordinate is T, so the coordinate-ring map is surjective. -/
theorem polynomialGraph_surjective (m B : ℕ) (hm : 0 < m) :
    Function.Surjective (polynomialGraph (k := k) m B) := by sorry

/-- A single graph avoids a given nonzero polynomial as a polynomial, over the same field. -/
theorem exists_avoiding_graph (m : ℕ) (hm : 0 < m)
    (h : MvPolynomial (Fin m) k) (hh : h ≠ 0) :
    ∃ B : ℕ, 2 ≤ B ∧ (∀ d ∈ h.support, ∀ i, d i < B) ∧
      polynomialGraph m B h ≠ 0 ∧
      IsClosedImmersion (Spec.map (CommRingCat.ofHom (polynomialGraph (k := k) m B))) := by
  sorry

-- Packet test: polynomialGraph_F2_lines. A nonzero polynomial can vanish on every rational line.
example :
    polynomialGraph (k := ZMod 2) 2 3
      ((MvPolynomial.X 0)^2 * MvPolynomial.X 1 -
        MvPolynomial.X 0 * (MvPolynomial.X 1)^2) =
      Polynomial.X^5 + Polynomial.X^7 := by sorry

-- Packet test: polynomialGraph_bad_base. Strictly bounding all individual exponents matters.
example :
    polynomialGraph (k := ZMod 2) 2 2
      (MvPolynomial.X 1 - (MvPolynomial.X 0)^2) = 0 ∧
    polynomialGraph (k := ZMod 2) 2 3
      (MvPolynomial.X 1 - (MvPolynomial.X 0)^2) ≠ 0 := by sorry

-- Packet test: polynomialGraph_one_coordinate. No nonlinear reparametrisation in dimension one.
example (B : ℕ) :
    polynomialGraph (k := k) 1 B (MvPolynomial.X 0) = Polynomial.X := by sorry

-- Packet test: polynomialGraph_zero_variables. The ring map exists without asserting immersion.
example (B : ℕ) (a : k) :
    polynomialGraph 0 B (MvPolynomial.C a : MvPolynomial (Fin 0) k) = Polynomial.C a := by
  sorry

end PolynomialGraph

variable {k : Type*} [Field k]

/-- Milestone for the marked component of the graph pullback. The reader fixes that component
and gives its inclusion into the actual categorical pullback; the existence signature records
the coordinates and properties used by the consumer. -/
theorem exists_marked_etale_curve (m : ℕ) (hm : 0 < m)
    (V : Scheme) [IsAffine V] [IsIntegral V]
    (π : V ⟶ Spec (CommRingCat.of (MvPolynomial (Fin m) k))) [Etale π]
    (y : Spec (CommRingCat.of k) ⟶ V)
    (hy : y ≫ π = Spec.map (CommRingCat.ofHom
      (MvPolynomial.eval (fun _ : Fin m => (0 : k)))))
    (U : V.Opens) (hU : Dense (U : Set V)) :
    ∃ (B : ℕ), 2 ≤ B ∧ ∃ (C : Scheme)
      (q : C ⟶ Spec (CommRingCat.of (Polynomial k))) (g : C ⟶ V)
      (c : Spec (CommRingCat.of k) ⟶ C),
      IsAffine C ∧ Etale q ∧
      SmoothOfRelativeDimension 1 (q ≫ Spec.map (CommRingCat.ofHom Polynomial.C)) ∧
      GeometricallyIntegral (q ≫ Spec.map (CommRingCat.ofHom Polynomial.C)) ∧
      g ≫ π = q ≫ Spec.map (CommRingCat.ofHom (polynomialGraph (k := k) m B)) ∧
      c ≫ g = y ∧ c ≫ q = Spec.map (CommRingCat.ofHom (Polynomial.evalRingHom (0 : k))) ∧
      Dense (g ⁻¹' (U : Set V)) := by sorry

/-- End theorem. The open V makes smoothness and density local at the marked rational point.
The target can be singular away from V and need not be separated or projective. -/
theorem exists_same_field_curve (Y : Scheme) (f : Y ⟶ Spec (CommRingCat.of k))
    (y : Spec (CommRingCat.of k) ⟶ Y) (hy : y ≫ f = 𝟙 _)
    (U V : Y.Opens) (hyV : ∀ x, y x ∈ V)
    (hs : Smooth (V.ι ≫ f)) (hU : Dense (V.ι ⁻¹' (U : Set Y))) :
    ∃ (C : Scheme) (s : C ⟶ Spec (CommRingCat.of k))
      (g : C ⟶ Y) (c : Spec (CommRingCat.of k) ⟶ C),
      IsAffine C ∧ SmoothOfRelativeDimension 1 s ∧ GeometricallyIntegral s ∧
      g ≫ f = s ∧ c ≫ s = 𝟙 _ ∧ c ≫ g = y ∧ Dense (g ⁻¹' (U : Set Y)) := by
  sorry

-- Packet test: markedPullback_identity. The identity chart pulls the graph back to A1 itself.
example (m B : ℕ) (hm : 0 < m) :
    CategoryTheory.IsPullback
      (Spec.map (CommRingCat.ofHom (polynomialGraph (k := k) m B)))
      (𝟙 (Spec (CommRingCat.of (Polynomial k))))
      (𝟙 (Spec (CommRingCat.of (MvPolynomial (Fin m) k))))
      (Spec.map (CommRingCat.ofHom (polynomialGraph (k := k) m B))) := by sorry

-- Packet test: markedPullback_boundary. At 0 the good open D(T) is missed, but is still dense.
example : Dense ((PrimeSpectrum.basicOpen (Polynomial.X : Polynomial k) :
    TopologicalSpace.Opens (PrimeSpectrum (Polynomial k))) : Set (PrimeSpectrum (Polynomial k))) := by sorry

-- Acceptance for component selection: the whole disconnected pullback cannot be integral.
-- The reader tests the actual marked component in a connected étale chart over F₃.
example :
    ¬ IsIntegral (Spec (CommRingCat.of (k × k))) := by sorry

-- Acceptance: the dimension-zero branch has a genuine curve as source and a constant map.
example : SmoothOfRelativeDimension 1
    (Spec.map (CommRingCat.ofHom (Polynomial.C : k →+* Polynomial k))) := by sorry

end TauCeti.SameFieldCurves
