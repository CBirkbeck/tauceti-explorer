import Mathlib

/-!
# Scheme and stack foundations: representative target signatures

The roadmap is `research/blueprint/readmes/SchemeAndStackFoundations.md`, with
full contracts in its blueprint packet. This file is not exhaustive. The
canonical reduction map specifies affine étale neighbourhoods. The Nisnevich
cover predicate uses native scheme morphisms and their actual residue maps.
Constructing the site and proving bounded descent remain roadmap targets.
-/

namespace TauCetiRoadmap.SchemeAndStackFoundations

noncomputable section
open CategoryTheory AlgebraicGeometry
universe u

/-! ## Layer 0: residue-preserving étale neighbourhoods -/

/-- The actual quotient map R/I→B/IB, rather than a chosen abstract isomorphism. -/
abbrev reducedMap {R : Type u} [CommRing R] (I : Ideal R) (B : CommAlgCat.{u} R) :
    R ⧸ I →+* B ⧸ I.map (algebraMap R B) :=
  Ideal.quotientMap (I.map (algebraMap R B)) (algebraMap R B) Ideal.le_comap_map

/-- An étale neighbourhood is required to preserve this canonical quotient. -/
def IsNeighbourhood {R : Type u} [CommRing R] (I : Ideal R) (B : CommAlgCat.{u} R) : Prop :=
  Algebra.Etale R B ∧ Function.Bijective (reducedMap I B)

/-- The identity algebra is a neighbourhood for every ideal, including top. -/
example {R : Type u} [CommRing R] (I : Ideal R) :
    IsNeighbourhood I (CommAlgCat.of R R) := by
  sorry

example : IsNeighbourhood (Ideal.span {(5 : ℤ)})
    (CommAlgCat.of ℤ (Localization.Away (2 : ℤ))) := by
  sorry

example : ¬ IsNeighbourhood (Ideal.span {(5 : ℤ)})
    (CommAlgCat.of ℤ (Localization.Away (5 : ℤ))) := by
  sorry

example : ¬ IsNeighbourhood (Ideal.span {(5 : ℤ)}) (CommAlgCat.of ℤ (ℤ × ℤ)) := by
  sorry

/-! ## Layer 2: Nisnevich covering families -/

/-- Every point has a lift with an isomorphism on its canonical residue map.
Joint surjectivity of an étale family alone is insufficient. -/
def IsNisnevichCover {I : Type u} {X : Scheme.{u}} (U : I → Scheme.{u})
    (f : ∀ i, U i ⟶ X) : Prop :=
  (∀ i, Etale (f i)) ∧
    ∀ x : X, ∃ (i : I) (y : U i), (f i) y = x ∧ IsIso ((f i).residueFieldMap y)

/-- Singleton identity families satisfy both parts of the cover condition. -/
example (X : Scheme.{u}) :
    IsNisnevichCover (fun _ : PUnit => X) (fun _ => 𝟙 X) := by
  sorry

/-- An empty-index covering family forces the target's point type to be empty. -/
example (X : Scheme.{u}) (U : PEmpty → Scheme.{u}) (f : ∀ i, U i ⟶ X)
    (h : IsNisnevichCover U f) : IsEmpty X := by
  sorry

/-- A residue-preserving section gives the required lift; no arbitrary residue
field equivalence is substituted for the canonical map. -/
example {X Y : Scheme.{u}} (f : Y ⟶ X) [Etale f] (s : X ⟶ Y)
    (hs : s ≫ f = 𝟙 X) :
    IsNisnevichCover (fun _ : PUnit => Y) (fun _ => f) := by
  sorry

/- Distinguished squares, the generated topology and set/simplicial descent
with F(empty) contractible are targets in the roadmap. The simplicial theorem
uses finite-dimensional noetherian schemes; its application to spectra needs a
separate realization adapter. Henselizations, relative Proj, stacks, Azumaya and
derived duality objects are not replaced by admitted data definitions here. -/

end

end TauCetiRoadmap.SchemeAndStackFoundations
