import TauCeti.CategoryTheory.GrothendieckGroup.Triangulated

/-
Algebraic cycles, pure and mixed motives — MC.4, Part 2.

The definitive targets, hypotheses, proof obligations, APIs and worked tests are in
research/blueprint/readmes/MotivesAndAlgebraicCycles--MC.4.md.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Finite correspondences, relative-cycle families, cdh complexes, Chow motives and the
geometric motivic categories do not have their required carriers at these pins.
All 17 motivic targets therefore remain README targets. In particular this file
introduces no substitute structure for missing motives, no data defined by an
unproved term, and no characteristic-zero replacement for a perfect-field target.

Triangulated K_0, its class map, triangle relations and integer-shift signs already
exist at the Tau Ceti pin. The examples below check that imported boundary of the
motivic-measure plan. They are applications of the existing API, not new roadmap
targets. The tensor-induced ring, motivic specialization, coefficient-change map
and compact-support measure still require the interfaces recorded in the reader.
-/

noncomputable section

open CategoryTheory CategoryTheory.Limits CategoryTheory.Pretriangulated

namespace TauCeti.Motives.MC4PartTwo

universe u v w

variable {C : Type u} [Category.{v} C] [Preadditive C] [HasZeroObject C]
  [HasShift C ℤ] [∀ n : ℤ, (shiftFunctor C n).Additive]
  [Pretriangulated C] [EssentiallySmall.{w} C]

-- The compact-support localization triangle gives a difference of object classes.
example (T : Triangle C) (hT : T ∈ distTriang C) :
    (TauCeti.TriangulatedK0.of T.obj₃ : TauCeti.TriangulatedK0 C) =
      TauCeti.TriangulatedK0.of T.obj₂ - TauCeti.TriangulatedK0.of T.obj₁ := by
  exact TauCeti.TriangulatedK0.of_eq_sub_of_distTriang hT

-- The shift by two in M^c(A^1) = Z(1)[2] leaves its Grothendieck class unchanged.
example (X : C) :
    (TauCeti.TriangulatedK0.of (X⟦(2 : ℤ)⟧) : TauCeti.TriangulatedK0 C) =
      TauCeti.TriangulatedK0.of X := by
  simpa only [show (2 : ℤ).negOnePow = 1 by decide, Units.val_one, one_zsmul]
    using TauCeti.TriangulatedK0.of_shift (2 : ℤ) X

end TauCeti.Motives.MC4PartTwo
