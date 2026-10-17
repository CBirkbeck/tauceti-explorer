import Mathlib.Algebra.MonoidAlgebra.Basic
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.Data.ZMod.Basic
import Mathlib.AlgebraicGeometry.Pullbacks
import Mathlib.RingTheory.Valuation.ValuationRing
import TauCeti.Algebra.AlgebraicGroup.SplitTorus.Scheme

/-!
# Arithmetic toroidal compactifications: selected native statements

The roadmap document gives the complete targets, APIs, hypotheses and checks.
These affine coefficient statements use existing monoid algebras and schemes.
General fans, torsor embeddings and analytic/formal compactifications remain
roadmap targets until their shared geometric suppliers are available.
-/

open CategoryTheory AlgebraicGeometry
open scoped CategoryTheory.MonObj
noncomputable section

namespace AddMonoidAlgebra

/-- Restriction to a face is uniquely multiplicative, retaining all coefficients. -/
theorem exists_unique_faceProjection (R : Type*) [CommRing R]
    {P : Type*} [AddCommMonoid P] (F : AddSubmonoid P)
    (hF : ∀ a b : P, a + b ∈ F ↔ a ∈ F ∧ b ∈ F) :
    ∃! π : AddMonoidAlgebra R P →ₐ[R] AddMonoidAlgebra R F,
      ∀ (f : AddMonoidAlgebra R P) (m : F), (π f).coeff m = f.coeff (m : P) := by
  sorry

end AddMonoidAlgebra

universe u

namespace ShimuraCompactificationBlueprint

/-- Affine chart over an arbitrary coefficient ring.
This does not define the dual monoid of a cone, fan gluing or a torsor chart. -/
def monoidAffineChart (R P : Type u) [CommRing R] [AddCommMonoid P] : Scheme :=
  Spec (CommRingCat.of (AddMonoidAlgebra R P))

/-- The existing spectrum reverses the direction of coefficient change. -/
def monoidAffineChartCoefficientMap {R S P : Type u}
    [CommRing R] [CommRing S] [AddCommMonoid P] (φ : R →+* S) :
    monoidAffineChart S P ⟶ monoidAffineChart R P :=
  Spec.map (CommRingCat.ofHom (AddMonoidAlgebra.mapRingHom P φ))

theorem monoidAffineChartCoefficientMap_id (R P : Type u)
    [CommRing R] [AddCommMonoid P] :
    monoidAffineChartCoefficientMap (P := P) (RingHom.id R) =
      𝟙 (monoidAffineChart R P) := by
  sorry

theorem monoidAffineChartCoefficientMap_comp {R S T P : Type u}
    [CommRing R] [CommRing S] [CommRing T] [AddCommMonoid P]
    (φ : R →+* S) (ψ : S →+* T) :
    monoidAffineChartCoefficientMap (P := P) (ψ.comp φ) =
      monoidAffineChartCoefficientMap (P := P) ψ ≫
        monoidAffineChartCoefficientMap (P := P) φ := by
  sorry

/-- For a subdivision chart, x=u, y=u*v, hence xy=u^2*v. -/
example :
    (AddMonoidAlgebra.single (1, 0) (1 : ℤ) : AddMonoidAlgebra ℤ (ℕ × ℕ)) *
        AddMonoidAlgebra.single (1, 1) (1 : ℤ) =
      AddMonoidAlgebra.single (2, 1) (1 : ℤ) := by
  sorry

/-- The pulled-back boundary equation differs from the reduced boundary equation uv.
This algebra example detects the exponents; the geometric ideal comparison is omitted. -/
example :
    (AddMonoidAlgebra.single (2, 1) (1 : ℤ) : AddMonoidAlgebra ℤ (ℕ × ℕ)) ≠
      AddMonoidAlgebra.single (1, 1) (1 : ℤ) := by
  sorry

end ShimuraCompactificationBlueprint

namespace Toric

open ShimuraCompactificationBlueprint

variable {R S P : Type u} [CommRing R] [CommRing S] [AddCommMonoid P]

def affineChartStructureMap (R P : Type u) [CommRing R] [AddCommMonoid P] :
    monoidAffineChart R P ⟶ Spec (CommRingCat.of R) :=
  Spec.map (CommRingCat.ofHom (algebraMap R (AddMonoidAlgebra R P)))

/-- For arbitrary coefficients, the coefficient square is Cartesian for
arbitrary ring maps. No flatness, reducedness or Noetherian hypothesis occurs. -/
theorem affineChart_baseChange (φ : R →+* S) :
    IsPullback (monoidAffineChartCoefficientMap (P := P) φ)
      (affineChartStructureMap S P) (affineChartStructureMap R P)
      (Spec.map (CommRingCat.ofHom φ)) := by
  sorry

/-- The zero-cone monoid is the whole character GROUP, including inverse
characters. This concrete Laurent test distinguishes a torus from affine space.
The following example compares with the native split-torus scheme. -/
-- Coordinate-algebra regression for the zero-cone comparison below.
example (R : Type u) [CommRing R] :
    (AddMonoidAlgebra.single (-1) (1 : R) : AddMonoidAlgebra R ℤ) *
      AddMonoidAlgebra.single 1 (1 : R) = 1 := by
  sorry

/-- The zero cone gives the actual native split-torus SCHEME. -/
example (R : Type) [CommRing R] (n : ℕ) :
    Nonempty (monoidAffineChart R (Fin n →₀ ℤ) ≅
      (TauCeti.SplitTorus.groupScheme R (Fin n)).X.left) := by
  sorry

/-- Arbitrary valuation rings, including non-Noetherian ones, use the same
Cartesian square. No finite-generation property of the coefficient ring is used. -/
example (A P : Type) [CommRing A] [IsDomain A] [ValuationRing A]
    [AddCommMonoid P] :
    IsPullback (monoidAffineChartCoefficientMap (P := P) (Int.castRingHom A))
      (affineChartStructureMap A P) (affineChartStructureMap ℤ P)
      (Spec.map (CommRingCat.ofHom (Int.castRingHom A))) := by
  sorry

/-- The nilpotent coefficient survives in the ACTUAL affine chart algebra. -/
example :
    (AddMonoidAlgebra.single 0 (2 : ZMod 4) : AddMonoidAlgebra (ZMod 4) ℕ) ≠ 0 ∧
    (AddMonoidAlgebra.single 0 (2 : ZMod 4) : AddMonoidAlgebra (ZMod 4) ℕ) ^ 2 = 0 := by
  sorry

end Toric
