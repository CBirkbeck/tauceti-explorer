import Mathlib.Algebra.Category.CommAlgCat.Basic
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Category.ModuleCat.Biproducts
import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import Mathlib.Algebra.Category.Ring.Basic
import Mathlib.Algebra.DualNumber
import Mathlib.Algebra.Homology.Additive
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.Algebra.Homology.DerivedCategory.ExactFunctor
import Mathlib.Algebra.Homology.DerivedCategory.HomologySequence
import Mathlib.Algebra.Homology.DerivedCategory.TStructure
import Mathlib.Algebra.Homology.HomotopyCategory.MappingCone
import Mathlib.Algebra.Homology.ShortComplex.HomologicalComplex
import Mathlib.Algebra.Homology.Single
import Mathlib.Algebra.Module.Projective
import Mathlib.Algebra.MvPolynomial.CommRing
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Algebra.Polynomial.AlgebraMap
import Mathlib.Algebra.Polynomial.Basic
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.AlgebraicTopology.SimplicialObject.Basic
import Mathlib.CategoryTheory.Adjunction.Basic
import Mathlib.CategoryTheory.Comma.Over.Basic
import Mathlib.CategoryTheory.Endomorphism
import Mathlib.CategoryTheory.Groupoid
import Mathlib.CategoryTheory.Idempotents.Basic
import Mathlib.CategoryTheory.Limits.Shapes.IsTerminal
import Mathlib.CategoryTheory.Limits.Shapes.ZeroObjects
import Mathlib.CategoryTheory.Monoidal.Category
import Mathlib.CategoryTheory.Sites.Grothendieck
import Mathlib.CategoryTheory.Sites.Sheaf
import Mathlib.CategoryTheory.Sites.Sieves.Basic
import Mathlib.CategoryTheory.Triangulated.Pretriangulated
import Mathlib.CategoryTheory.Whiskering
import Mathlib.Data.Nat.Choose.Dvd
import Mathlib.Data.Nat.Choose.Sum
import Mathlib.Data.Nat.Prime.Int
import Mathlib.Data.ZMod.Basic
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.FieldTheory.Perfect
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.LinearAlgebra.TensorPower.Basic
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.TensorProduct.Tower
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.RepresentationTheory.Rep.Basic
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.AdicCompletion.Completeness
import Mathlib.RingTheory.DividedPowers.Basic
import Mathlib.RingTheory.Etale.Basic
import Mathlib.RingTheory.Flat.FaithfullyFlat.Basic
import Mathlib.RingTheory.Ideal.Cotangent
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.RingTheory.Jacobson.Ideal
import Mathlib.RingTheory.Kaehler.Basic
import Mathlib.RingTheory.Localization.AtPrime.Basic
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.Localization.Basic
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.RingTheory.Nilpotent.Basic
import Mathlib.RingTheory.Perfection
import Mathlib.RingTheory.Perfectoid.FontaineTheta
import Mathlib.RingTheory.PicardGroup
import Mathlib.RingTheory.Polynomial.Cyclotomic.Basic
import Mathlib.RingTheory.Polynomial.Cyclotomic.Eval
import Mathlib.RingTheory.Polynomial.Eisenstein.Basic
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.Regular.RegularSequence
import Mathlib.RingTheory.RingHom.FaithfullyFlat
import Mathlib.RingTheory.RingHom.Flat
import Mathlib.RingTheory.Smooth.Basic
import Mathlib.RingTheory.Spectrum.Prime.FreeLocus
import Mathlib.RingTheory.TensorProduct.Basic
import Mathlib.RingTheory.WittVector.Basic
import Mathlib.RingTheory.WittVector.Complete
import Mathlib.RingTheory.WittVector.Frobenius
import Mathlib.RingTheory.WittVector.Identities
import Mathlib.RingTheory.WittVector.Teichmuller
import Mathlib.RingTheory.WittVector.Truncated
import Mathlib.RingTheory.WittVector.Verschiebung
import Mathlib.RingTheory.WittVector.WittPolynomial

/-!
This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/PrismaticCohomology--PR.0.md` is definitive. The statements below
suggest Lean forms so that contributors and reviewers converge on names and signatures. They
claim no implementation: every proof is a placeholder.

Layers PR.0–PR.7 of the roadmap `PrismaticCohomology`. Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174; no `TauCeti.*` module is imported, because none
of the objects below exists there.

How the file is organised.
* The δ-ring prefix of PR.0 (namespace `TauCeti.Delta`) is stated on Mathlib's own carriers:
  rings, quotients, localizations, adic completions, truncated Witt vectors.
* A prism (`TauCeti.Prismatic.Prism`) records the data and the conditions Mathlib can state.
  Derived `(p, I)`-completeness belongs to `DerivedDeRhamCohomology:DD.1` and is left out of
  the structure; a statement that the sources deduce from it carries the consequence it uses
  (membership of `p` and `I` in the Jacobson radical) as an explicit hypothesis.
* Complexes are objects of Mathlib's `DerivedCategory (ModuleCat A)`, read as the
  1-categorical shadow of the derived ∞-categories of the sources.
* An object owned by another layer or another roadmap that Mathlib lacks is never defined
  here. It enters as a `variable` or as a field of a structure of imported data whose
  docstring names its owner. No `Prop` stands for a condition that cannot be stated, and
  no axiom is used.
-/

namespace TauCeti.Delta

-- The concrete integer square-zero examples use the central right action.
local instance (n : ℕ) : Module ℤᵐᵒᵖ (ZMod n) :=
  Module.compHom (ZMod n) (RingEquiv.toOpposite ℤ).symm.toRingHom
local instance (n : ℕ) : IsCentralScalar ℤ (ZMod n) where
  op_smul_eq_smul _ _ := rfl

open scoped BigOperators
universe u v
variable (p : ℕ) [hpPrime : Fact p.Prime]

/-- Integral binomial coefficients are divided before evaluation in R. -/
def addCorrection (p : ℕ) [Fact p.Prime] {R : Type u} [CommRing R] (x y : R) : R :=
  - ∑ i ∈ Finset.Icc 1 (p - 1), ((p.choose i / p : ℕ) : R) * x ^ i * y ^ (p - i)

theorem addCorrection_map {R S : Type*} [CommRing R] [CommRing S]
    (f : R →+* S) (x y : R) :
    f (addCorrection p x y) = addCorrection p (f x) (f y) := by sorry

theorem addCorrection_zero {R : Type*} [CommRing R] (x : R) :
    addCorrection p x 0 = 0 := by sorry

theorem addCorrection_symm {R : Type*} [CommRing R] (x y : R) :
    addCorrection p x y = addCorrection p y x := by sorry

/-- Node: correction-identity. No cancellation in R is assumed. -/
theorem correction_identity {R : Type*} [CommRing R] (x y : R) :
    (p : R) * addCorrection p x y = x ^ p + y ^ p - (x + y) ^ p := by sorry

/-- Node: delta-frobenius-dictionary, retaining the integrated identifier.
These fields are the actual algebraic axioms, not an assumed equivalence. -/
structure Structure (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R] where
  delta : R → R
  delta_zero : delta 0 = 0
  delta_one : delta 1 = 0
  delta_add : ∀ x y, delta (x + y) = delta x + delta y + addCorrection p x y
  delta_mul : ∀ x y, delta (x * y) =
    x ^ p * delta y + y ^ p * delta x + (p : R) * delta x * delta y

variable {p}

theorem Structure.ext {R : Type*} [CommRing R] {d e : Structure p R}
    (h : ∀ x, d.delta x = e.delta x) : d = e := by sorry

theorem Structure.delta_neg {R : Type*} [CommRing R] (d : Structure p R) (x : R) :
    d.delta (-x) = -d.delta x - addCorrection p x (-x) := by sorry

theorem Structure.delta_two {R : Type*} [CommRing R] (d : Structure p R) :
    d.delta (1 + 1) = addCorrection p (1 : R) 1 := by sorry

variable (p)

/-- An ordinary Frobenius lift, not a derived Frobenius homotopy. -/
def FrobeniusLift (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R] :=
  {f : R →+* R // ∀ x, ∃ y, f x = x ^ p + (p : R) * y}

theorem FrobeniusLift.ext {R : Type*} [CommRing R] {f g : FrobeniusLift p R}
    (h : f.1 = g.1) : f = g := by sorry

theorem FrobeniusLift.mod_p {R : Type*} [CommRing R] (f : FrobeniusLift p R) (x : R) :
    Ideal.Quotient.mk (Ideal.span ({(p : R)} : Set R)) (f.1 x) =
    Ideal.Quotient.mk (Ideal.span ({(p : R)} : Set R)) (x ^ p) := by sorry

theorem FrobeniusLift.congruence_iff {R : Type*} [CommRing R] (f : R →+* R) :
    (∀ x, ∃ y, f x = x ^ p + (p : R) * y) ↔
    (∀ x, Ideal.Quotient.mk (Ideal.span ({(p : R)} : Set R)) (f x) =
      Ideal.Quotient.mk (Ideal.span ({(p : R)} : Set R)) (x ^ p)) := by sorry

/-- Node: associated-frobenius. -/
noncomputable def toFrobenius {R : Type*} [CommRing R]
    (d : Structure p R) : FrobeniusLift p R := by sorry

theorem toFrobenius_apply {R : Type*} [CommRing R] (d : Structure p R) (x : R) :
    (toFrobenius p d).1 x = x ^ p + (p : R) * d.delta x := by sorry

theorem toFrobenius_rank_one {R : Type*} [CommRing R] (d : Structure p R)
    (x : R) (hx : d.delta x = 0) : (toFrobenius p d).1 x = x ^ p := by sorry

theorem toFrobenius_map {R S : Type*} [CommRing R] [CommRing S]
    (d : Structure p R) (e : Structure p S) (f : R →+* S)
    (h : ∀ x, f (d.delta x) = e.delta (f x)) (x : R) :
    f ((toFrobenius p d).1 x) = (toFrobenius p e).1 (f x) := by sorry

/-- Node: torsionfree-frobenius-equivalence. Multiplication by p is injective;
CharZero alone would be insufficient in a ring with other p-torsion. -/
noncomputable def frobeniusEquiv {R : Type*} [CommRing R]
    (hp : Function.Injective (fun x : R => (p : R) * x)) :
    Structure p R ≃ FrobeniusLift p R := by sorry

theorem frobeniusEquiv_apply {R : Type*} [CommRing R]
    (hp : Function.Injective (fun x : R => (p : R) * x)) (d : Structure p R) :
    frobeniusEquiv p hp d = toFrobenius p d := by sorry

theorem frobeniusEquiv_symm_spec {R : Type*} [CommRing R]
    (hp : Function.Injective (fun x : R => (p : R) * x))
    (f : FrobeniusLift p R) (x : R) :
    (p : R) * ((frobeniusEquiv p hp).symm f).delta x = f.1 x - x ^ p := by sorry

theorem frobeniusEquiv_symm_toFrobenius {R : Type*} [CommRing R]
    (hp : Function.Injective (fun x : R => (p : R) * x)) (d : Structure p R) :
    (frobeniusEquiv p hp).symm (toFrobenius p d) = d := by sorry

/-- Node: frobenius-morphism-reflection. Only the target needs p-torsionfreeness. -/
theorem frobenius_morphism_iff {R S : Type*} [CommRing R] [CommRing S]
    (d : Structure p R) (e : Structure p S) (f : R →+* S)
    (hp : Function.Injective (fun x : S => (p : S) * x)) :
    (∀ x, f ((toFrobenius p d).1 x) = (toFrobenius p e).1 (f x)) ↔
    (∀ x, f (d.delta x) = e.delta (f x)) := by sorry

/-- Node: integer-delta. The formula is exact integer division. -/
noncomputable def intDelta : Structure p ℤ := by sorry

theorem intDelta_apply (a : ℤ) : (intDelta p).delta a = (a - a ^ p) / p := by sorry

theorem intDelta_frobenius : (toFrobenius p (intDelta p)).1 = RingHom.id ℤ := by sorry

theorem intDelta_prime : (intDelta p).delta p = 1 - (p : ℤ) ^ (p - 1) := by sorry

/-- Node: integer-cast-delta. Does not cancel p in the target ring. -/
theorem delta_intCast {R : Type*} [CommRing R] (d : Structure p R) (a : ℤ) :
    d.delta (a : R) = (((a - a ^ p) / p : ℤ) : R) := by sorry

/-- Node: delta-stable-quotient. Stability is necessary and sufficient, including
uniqueness of the quotient operation compatible with the given quotient map. -/
theorem quotient_existsUnique {R : Type*} [CommRing R] (d : Structure p R) (I : Ideal R) :
    (∀ x ∈ I, d.delta x ∈ I) ↔
      ∃! e : Structure p (R ⧸ I),
        ∀ x, e.delta (Ideal.Quotient.mk I x) = Ideal.Quotient.mk I (d.delta x) := by sorry

section SquareZero
variable {B : Type*} [CommRing B] [Algebra B (ZMod p)]
variable [Module Bᵐᵒᵖ (ZMod p)] [IsCentralScalar B (ZMod p)]

/-- Node: square-zero-correction. The actions are the supplied central actions,
with left action induced by the displayed B-algebra structure on ZMod p. -/
theorem squareZero_correction (x y : TrivSqZeroExt B (ZMod p)) :
    (addCorrection p x y).snd =
      ((algebraMap B (ZMod p) x.fst) ^ (p - 1) -
        (algebraMap B (ZMod p) (x.fst + y.fst)) ^ (p - 1)) * x.snd +
      ((algebraMap B (ZMod p) y.fst) ^ (p - 1) -
        (algebraMap B (ZMod p) (x.fst + y.fst)) ^ (p - 1)) * y.snd := by sorry

/-- Node: square-zero-delta-family. This is an operation on the existing carrier,
not a new square-zero ring. It works over a p-local base as well as over Z. -/
noncomputable def squareZeroDelta (d : Structure p B) (l : ZMod p) :
    Structure p (TrivSqZeroExt B (ZMod p)) := by sorry

theorem squareZeroDelta_fst (d : Structure p B) (l : ZMod p)
    (x : TrivSqZeroExt B (ZMod p)) :
    ((squareZeroDelta p d l).delta x).fst = d.delta x.fst := by sorry

theorem squareZeroDelta_snd (d : Structure p B) (l : ZMod p)
    (x : TrivSqZeroExt B (ZMod p)) :
    ((squareZeroDelta p d l).delta x).snd =
      (l - (algebraMap B (ZMod p) x.fst) ^ (p - 1)) * x.snd := by sorry

theorem squareZeroDelta_frobenius (d : Structure p B) (l : ZMod p)
    (x : TrivSqZeroExt B (ZMod p)) :
    (toFrobenius p (squareZeroDelta p d l)).1 x =
      TrivSqZeroExt.inl ((toFrobenius p d).1 x.fst) := by sorry

/-- Node: frobenius-forgetful-not-injective. -/
theorem squareZeroDelta_distinct_same_frobenius (d : Structure p B)
    (l m : ZMod p) (h : l ≠ m) :
    squareZeroDelta p d l ≠ squareZeroDelta p d m ∧
      toFrobenius p (squareZeroDelta p d l) =
        toFrobenius p (squareZeroDelta p d m) := by sorry
end SquareZero

/-- Node: witt2-add-coordinate. Ghost cancellation is performed over a universal
integer polynomial ring, never over an arbitrary ring with p-torsion. -/
theorem witt2_add_coordinate {R : Type*} [CommRing R]
    (x y : TruncatedWittVector p 2 R) :
    (x + y).coeff 1 = x.coeff 1 + y.coeff 1 +
      addCorrection p (x.coeff 0) (y.coeff 0) := by sorry

/-- Node: witt2-mul-coordinate. -/
theorem witt2_mul_coordinate {R : Type*} [CommRing R]
    (x y : TruncatedWittVector p 2 R) :
    (x * y).coeff 1 = (x.coeff 0) ^ p * y.coeff 1 +
      (y.coeff 0) ^ p * x.coeff 1 + (p : R) * x.coeff 1 * y.coeff 1 := by sorry

/-- Node: delta-witt-section-equivalence. A section of the first Witt coordinate,
not a section of the ghost map. No p-torsionfreeness hypothesis. -/
noncomputable def wittSectionEquiv {R : Type*} [CommRing R] :
    Structure p R ≃
      {s : R →+* TruncatedWittVector p 2 R // ∀ x, (s x).coeff 0 = x} := by sorry

theorem wittSectionEquiv_apply {R : Type*} [CommRing R] (d : Structure p R) (x : R) :
    (wittSectionEquiv p d).1 x =
      TruncatedWittVector.mk p (fun i : Fin 2 => if i = 0 then x else d.delta x) := by sorry

theorem wittSectionEquiv_symm_apply {R : Type*} [CommRing R]
    (s : {s : R →+* TruncatedWittVector p 2 R // ∀ x, (s x).coeff 0 = x}) (x : R) :
    ((wittSectionEquiv p).symm s).delta x = (s.1 x).coeff 1 := by sorry

theorem wittSectionEquiv_ghost_one {R : Type*} [CommRing R] (d : Structure p R) (x : R) :
    ((wittSectionEquiv p d).1 x).coeff 0 ^ p +
      (p : R) * ((wittSectionEquiv p d).1 x).coeff 1 = (toFrobenius p d).1 x := by sorry

/-! Twenty-four definition/construction tests; names match the packet. -/
local instance : Fact (Nat.Prime 2) := ⟨by decide⟩
local instance : Fact (Nat.Prime 3) := ⟨by decide⟩

-- correction_dyadic
example (x y : ℤ) : addCorrection 2 x y = -x*y := by sorry
-- correction_cubic
example (x y : ℤ) : addCorrection 3 x y = -x*y*(x+y) := by sorry
-- correction_zero_argument
example {R : Type*} [CommRing R] (x : R) : addCorrection p x 0 = 0 := by sorry

-- delta_two_forced
example (d : Structure 2 ℤ) : d.delta 2 = -1 := by sorry
-- delta_zero_operation_rejected
example : ¬ ∃ d : Structure 2 ℤ, ∀ x, d.delta x = 0 := by sorry
-- delta_zero_ring
example : Nonempty (Structure 2 (ZMod 1)) := by sorry
-- delta_product_rule_integers (the product rule with its term p·δ(x)·δ(y))
example (d : Structure 2 ℤ) : d.delta 4 = -6 := by sorry

-- lift_on_integers
example : ∃ f : FrobeniusLift p ℤ, f.1 = RingHom.id ℤ := by sorry
-- lift_in_characteristic_p
example : ∃ f : FrobeniusLift p (ZMod p), f.1 = RingHom.id (ZMod p) := by sorry
-- power_not_ring_map
example : ¬ ∃ f : FrobeniusLift 2 ℤ, ∀ x, f.1 x = x ^ 2 := by sorry

-- phi_rank_one
example {R : Type*} [CommRing R] (d : Structure p R) (x : R)
    (h : d.delta x = 0) : (toFrobenius p d).1 x = x ^ p := by sorry
-- phi_integer_two
example : (toFrobenius 2 (intDelta 2)).1 2 = 2 := by sorry
-- phi_zero_ring
example (d e : Structure 2 (ZMod 1)) : toFrobenius 2 d = toFrobenius 2 e := by sorry

-- reconstruction_integer_value
example (h : Function.Injective (fun x : ℤ => (2 : ℤ)*x))
    (f : FrobeniusLift 2 ℤ) (hf : f.1 = RingHom.id ℤ) :
    ((frobeniusEquiv 2 h).symm f).delta 2 = -1 := by sorry
-- reconstruction_rejects_characteristic_p
example (q : ℕ) [Fact q.Prime] :
    ¬ Function.Injective (fun x : ZMod q => (q : ZMod q)*x) := by sorry
-- reconstruction_zero_ring
example : Function.Injective (fun x : ZMod 1 => (p : ZMod 1)*x) := by sorry

-- integer_negative_dyadic
example : (intDelta 2).delta (-1) = -1 := by sorry
-- integer_cubic_value
example : (intDelta 3).delta 2 = -2 := by sorry
-- integer_zero
example : (intDelta p).delta 0 = 0 := by sorry

-- square_zero_parameter
example (l : ZMod p) :
    (squareZeroDelta p (intDelta p) l).delta (TrivSqZeroExt.inr (1 : ZMod p)) =
      TrivSqZeroExt.inr l := by sorry
-- square_zero_addition_correction
example (l : ZMod p) :
    (squareZeroDelta p (intDelta p) l).delta
      (1 + TrivSqZeroExt.inr (1 : ZMod p)) = TrivSqZeroExt.inr (l - 1) := by sorry
-- square_zero_base_compatibility
example (l : ZMod p) (a : ℤ) :
    (squareZeroDelta p (intDelta p) l).delta (TrivSqZeroExt.inl a) =
      TrivSqZeroExt.inl ((intDelta p).delta a) := by sorry

-- witt_section_recovers_delta
example {R : Type*} [CommRing R] (d : Structure p R) (x : R) :
    ((wittSectionEquiv p d).1 x).coeff 1 = d.delta x := by sorry
-- witt_no_section_in_characteristic_p
example : ¬ Nonempty {s : ZMod p →+* TruncatedWittVector p 2 (ZMod p) //
    ∀ x, (s x).coeff 0 = x} := by sorry
-- witt_sections_distinguished_despite_ghost
example (l m : ZMod p) (h : l ≠ m) :
    wittSectionEquiv p (squareZeroDelta p (intDelta p) l) ≠
      wittSectionEquiv p (squareZeroDelta p (intDelta p) m) := by sorry

end TauCeti.Delta

/-! ## Ordinary localization of delta structures

This section adds the torsion-safe localization construction. It does not
construct a new localization ring, a completion, or a prism. All new
signatures elaborate at the pinned baseline with proof-placeholder warnings only. The existing addCorrection_map and
wittSectionEquiv_apply above now also have separate packet lemma nodes.
-/

namespace TauCeti.Delta

local instance (n : ℕ) : Module ℤᵐᵒᵖ (ZMod n) :=
  Module.compHom (ZMod n) (RingEquiv.toOpposite ℤ).symm.toRingHom
local instance (n : ℕ) : IsCentralScalar ℤ (ZMod n) where
  op_smul_eq_smul _ _ := rfl

universe u₁ u₂ u₃
variable (p : ℕ) [Fact p.Prime]

/-- Coordinatewise ring map on the existing length-two Witt carrier. -/
noncomputable def witt2Map {R : Type u₁} {T : Type u₂}
    [CommRing R] [CommRing T] (f : R →+* T) :
    TruncatedWittVector p 2 R →+* TruncatedWittVector p 2 T := by sorry

theorem witt2Map_coeff {R T : Type*} [CommRing R] [CommRing T]
    (f : R →+* T) (x : TruncatedWittVector p 2 R) (j : Fin 2) :
    (witt2Map p f x).coeff j = f (x.coeff j) := by sorry

theorem witt2Map_id {R : Type*} [CommRing R] :
    witt2Map p (RingHom.id R) = RingHom.id (TruncatedWittVector p 2 R) := by sorry

theorem witt2Map_comp {R T U : Type*} [CommRing R] [CommRing T] [CommRing U]
    (f : R →+* T) (g : T →+* U) :
    witt2Map p (g.comp f) = (witt2Map p g).comp (witt2Map p f) := by sorry

/-- Both coordinates of the ghost pair must be units over an arbitrary ring.
The proof constructs the Witt inverse; it never assumes ghost injectivity. -/
theorem witt2_isUnit_iff {R : Type*} [CommRing R]
    (z : TruncatedWittVector p 2 R) :
    IsUnit z ↔ IsUnit (z.coeff 0) ∧
      IsUnit ((z.coeff 0) ^ p + (p : R) * z.coeff 1) := by sorry

/-- Only the delta operation is new. IsLocalization supplies the ring B.
The localization instance is an explicit binder, not dropped by a placeholder body. -/
noncomputable def localize {A : Type u₁} [CommRing A] (S : Submonoid A)
    (B : Type u₂) [CommRing B] [Algebra A B] [IsLocalization S B]
    (d : Structure p A)
    (hPhi : ∀ s : S, IsUnit (algebraMap A B ((toFrobenius p d).1 s))) :
    Structure p B := by sorry

theorem localize_algebraMap {A B : Type*} [CommRing A] [CommRing B]
    (S : Submonoid A) [Algebra A B] [IsLocalization S B]
    (d : Structure p A)
    (hPhi : ∀ s : S, IsUnit (algebraMap A B ((toFrobenius p d).1 s))) (a : A) :
    (localize p S B d hPhi).delta (algebraMap A B a) =
      algebraMap A B (d.delta a) := by sorry

theorem localize_unique {A B : Type*} [CommRing A] [CommRing B]
    (S : Submonoid A) [Algebra A B] [IsLocalization S B]
    (d : Structure p A)
    (hPhi : ∀ s : S, IsUnit (algebraMap A B ((toFrobenius p d).1 s)))
    (e : Structure p B)
    (he : ∀ a, e.delta (algebraMap A B a) = algebraMap A B (d.delta a)) :
    e = localize p S B d hPhi := by sorry

/-- The exact criterion is saturation of Frobenius denominators, not literal
stability of the submonoid, and no p-torsionfreeness is assumed. -/
theorem localization_criterion {A B : Type*} [CommRing A] [CommRing B]
    (S : Submonoid A) [Algebra A B] [IsLocalization S B] (d : Structure p A) :
    (∃! e : Structure p B,
      ∀ a, e.delta (algebraMap A B a) = algebraMap A B (d.delta a)) ↔
    (∀ s : S, IsUnit (algebraMap A B ((toFrobenius p d).1 s))) := by sorry

/-- The witness is the existing IsLocalization.lift. This theorem verifies
its delta compatibility and universal property, not another ring lift. -/
theorem localization_universal {A B C : Type*}
    [CommRing A] [CommRing B] [CommRing C]
    (S : Submonoid A) [Algebra A B] [IsLocalization S B]
    (d : Structure p A) (e : Structure p B) (c : Structure p C)
    (he : ∀ a, e.delta (algebraMap A B a) = algebraMap A B (d.delta a))
    (f : A →+* C) (hf : ∀ a, f (d.delta a) = c.delta (f a))
    (hS : ∀ s : S, IsUnit (f s)) :
    ∃! g : B →+* C,
      (∀ a, g (algebraMap A B a) = f a) ∧
      (∀ x, g (e.delta x) = c.delta (g x)) := by sorry

/-- The coefficient of the unknown delta is a unit. There is no inverse
operation on the arbitrary CommRing B and no cancellation of p in this formula. -/
theorem localize_fraction {A B : Type*} [CommRing A] [CommRing B]
    (S : Submonoid A) [Algebra A B] [IsLocalization S B]
    (d : Structure p A)
    (hPhi : ∀ s : S, IsUnit (algebraMap A B ((toFrobenius p d).1 s)))
    (a : A) (s : S) :
    (algebraMap A B s) ^ p * algebraMap A B ((toFrobenius p d).1 s) *
        (localize p S B d hPhi).delta (IsLocalization.mk' B a s) =
      (algebraMap A B s) ^ p * algebraMap A B (d.delta a) -
        (algebraMap A B a) ^ p * algebraMap A B (d.delta s) := by sorry

/-- Source Lemma 2.15: literal Frobenius-stability is a sufficient specialization. -/
theorem localization_phi_stable {A B : Type*} [CommRing A] [CommRing B]
    (S : Submonoid A) [Algebra A B] [IsLocalization S B] (d : Structure p A)
    (hS : ∀ s : S, (toFrobenius p d).1 s ∈ S) :
    ∃! e : Structure p B,
      ∀ a, e.delta (algebraMap A B a) = algebraMap A B (d.delta a) := by sorry

/-! Seven new definition/construction tests, paired with their packet names. -/

-- witt2_map_identity
example {R : Type*} [CommRing R] (z : TruncatedWittVector p 2 R) :
    witt2Map p (RingHom.id R) z = z := by sorry

-- witt2_map_torsion_coordinate
example [Fact (Nat.Prime 2)]
    (z : TruncatedWittVector 2 2 ℤ) (h0 : z.coeff 0 = 0) (h1 : z.coeff 1 = 1) :
    (witt2Map 2 (Int.castRingHom (ZMod 2)) z).coeff 0 = 0 ∧
      (witt2Map 2 (Int.castRingHom (ZMod 2)) z).coeff 1 = 1 := by sorry

-- witt2_map_zero_target
example {R : Type*} [CommRing R] (f : R →+* ZMod 1)
    (z : TruncatedWittVector p 2 R) : witt2Map p f z = 0 := by sorry

-- delta_localization_identity
example {A : Type*} [CommRing A] (S : Submonoid A) [IsLocalization S A]
    (d : Structure p A)
    (hPhi : ∀ s : S, IsUnit (algebraMap A A ((toFrobenius p d).1 s))) :
    localize p S A d hPhi = d := by sorry

-- delta_localization_zero
example {A : Type*} [CommRing A] (S : Submonoid A)
    [Algebra A (ZMod 1)] [IsLocalization S (ZMod 1)] (d : Structure p A)
    (hPhi : ∀ s : S, IsUnit (algebraMap A (ZMod 1) ((toFrobenius p d).1 s)))
    (x : ZMod 1) : (localize p S (ZMod 1) d hPhi).delta x = 0 := by sorry

-- delta_localization_rational_value
example [Fact (Nat.Prime 2)]
    (hPhi : ∀ s : nonZeroDivisors ℤ,
      IsUnit (algebraMap ℤ ℚ ((toFrobenius 2 (intDelta 2)).1 s))) :
    (localize 2 (nonZeroDivisors ℤ) ℚ (intDelta 2) hPhi).delta (1 / 3) = 1 / 9 := by sorry

-- delta_localization_torsion_survives
example [Fact (Nat.Prime 2)] {B : Type*} [CommRing B]
    [Algebra (TrivSqZeroExt ℤ (ZMod 2)) B]
    [IsLocalization (Submonoid.powers
      ((TrivSqZeroExt.inl (3 : ℤ) + TrivSqZeroExt.inr (1 : ZMod 2)) :
        TrivSqZeroExt ℤ (ZMod 2))) B] :
    ∃ e : Structure 2 B,
      (∀ a : TrivSqZeroExt ℤ (ZMod 2),
        e.delta (algebraMap (TrivSqZeroExt ℤ (ZMod 2)) B a) =
          algebraMap (TrivSqZeroExt ℤ (ZMod 2)) B
            ((squareZeroDelta 2 (intDelta 2) (1 : ZMod 2)).delta a)) ∧
      (algebraMap (TrivSqZeroExt ℤ (ZMod 2)) B (TrivSqZeroExt.inr (1 : ZMod 2)) ≠ 0) ∧
      e.delta (algebraMap (TrivSqZeroExt ℤ (ZMod 2)) B (TrivSqZeroExt.inr (1 : ZMod 2))) =
        algebraMap (TrivSqZeroExt ℤ (ZMod 2)) B (TrivSqZeroExt.inr (1 : ZMod 2)) := by sorry

end TauCeti.Delta

/-! ## Classical adic completion of delta structures

The functions on finite quotients are SHIFTED by one power; those quotients
are not asserted to be delta rings. The inverse-limit carrier and its ring
operations are existing Mathlib objects. The finite-generation hypothesis
in the final uniqueness theorem is deliberate. This section is elaborated with proof placeholders.
-/

namespace TauCeti.Delta

local instance (n : ℕ) : Module ℤᵐᵒᵖ (ZMod n) :=
  Module.compHom (ZMod n) (RingEquiv.toOpposite ℤ).symm.toRingHom
local instance (n : ℕ) : IsCentralScalar ℤ (ZMod n) where
  op_smul_eq_smul _ _ := rfl

variable (p : ℕ) [Fact p.Prime]

/-- Node delta-adic-correction: no assumption that p belongs to the ideal. -/
theorem addCorrection_mem {A : Type*} [CommRing A] (J : Ideal A)
    (x y : A) (hy : y ∈ J) : addCorrection p x y ∈ J := by sorry

/-- Node delta-adic-power-loss: finite generation and separation are unnecessary. -/
theorem delta_mem_pow {A : Type*} [CommRing A] (I : Ideal A)
    (d : Structure p A) (hp : (p : A) ∈ I) (n : ℕ)
    {x : A} (hx : x ∈ I ^ (n + 1)) : d.delta x ∈ I ^ n := by sorry

/-- Node delta-adic-congruence: an explicit uniform modulus, not a same-level map. -/
theorem delta_congr_pow {A : Type*} [CommRing A] (I : Ideal A)
    (d : Structure p A) (hp : (p : A) ∈ I) (n : ℕ)
    {x y : A} (h : x - y ∈ I ^ (n + 1)) :
    d.delta x - d.delta y ∈ I ^ n := by sorry

/-- Node delta-shifted-quotient. Neither an additive map nor a ring map. -/
noncomputable def shiftedQuotient {A : Type*} [CommRing A] (I : Ideal A)
    (d : Structure p A) (hp : (p : A) ∈ I) (n : ℕ) :
    A ⧸ I ^ (n + 1) → A ⧸ I ^ n := by sorry

/-- Node delta-shifted-quotient-mk, also the constructor evaluation API. -/
theorem shiftedQuotient_mk {A : Type*} [CommRing A] (I : Ideal A)
    (d : Structure p A) (hp : (p : A) ∈ I) (n : ℕ) (a : A) :
    shiftedQuotient p I d hp n (Ideal.Quotient.mk (I ^ (n + 1)) a) =
      Ideal.Quotient.mk (I ^ n) (d.delta a) := by sorry

/-- Node delta-shifted-quotient-transition. Both quotient indices shift. -/
theorem shiftedQuotient_transition {A : Type*} [CommRing A] (I : Ideal A)
    (d : Structure p A) (hp : (p : A) ∈ I) {m n : ℕ} (h : m ≤ n)
    (x : A ⧸ I ^ (n + 1)) :
    Ideal.Quotient.factorPow I h (shiftedQuotient p I d hp n x) =
      shiftedQuotient p I d hp m
        (Ideal.Quotient.factorPow I (Nat.succ_le_succ h) x) := by sorry

theorem shiftedQuotient_zero {A : Type*} [CommRing A] (I : Ideal A)
    (d : Structure p A) (hp : (p : A) ∈ I) (n : ℕ) :
    shiftedQuotient p I d hp n 0 = 0 := by sorry

/-- Node delta-classical-completion. This constructs an operation on Mathlib's
actual inverse-limit ring; it does not assume that the finite quotients are
delta rings or that an infinitely generated ideal makes this ring adic complete. -/
noncomputable def completion {A : Type*} [CommRing A] (I : Ideal A)
    (d : Structure p A) (hp : (p : A) ∈ I) :
    Structure p (AdicCompletion I A) := by sorry

/-- Node delta-completion-coordinate. -/
theorem completion_eval {A : Type*} [CommRing A] (I : Ideal A)
    (d : Structure p A) (hp : (p : A) ∈ I) (n : ℕ) (x : AdicCompletion I A) :
    AdicCompletion.evalₐ I n ((completion p I d hp).delta x) =
      shiftedQuotient p I d hp n (AdicCompletion.evalₐ I (n + 1) x) := by sorry

/-- Node delta-completion-base. The canonical algebra map is not assumed injective. -/
theorem completion_algebraMap {A : Type*} [CommRing A] (I : Ideal A)
    (d : Structure p A) (hp : (p : A) ∈ I) (a : A) :
    (completion p I d hp).delta (algebraMap A (AdicCompletion I A) a) =
      algebraMap A (AdicCompletion I A) (d.delta a) := by sorry

/-- Node delta-completion-congruence: the inverse-limit kernel topology first. -/
theorem completion_congr {A : Type*} [CommRing A] (I : Ideal A)
    (d : Structure p A) (hp : (p : A) ∈ I) (n : ℕ)
    {x y : AdicCompletion I A}
    (h : AdicCompletion.evalₐ I (n + 1) x = AdicCompletion.evalₐ I (n + 1) y) :
    AdicCompletion.evalₐ I n ((completion p I d hp).delta x) =
      AdicCompletion.evalₐ I n ((completion p I d hp).delta y) := by sorry

/-- Node delta-completion-unique-fg. No continuity premise is imposed on the
competing structure: finite-generation kernel equality and the algebraic
congruence bound force its coordinates. -/
theorem completion_existsUnique {A : Type*} [CommRing A] (I : Ideal A)
    (d : Structure p A) (hp : (p : A) ∈ I) (hI : I.FG) :
    ∃! e : Structure p (AdicCompletion I A),
      ∀ a, e.delta (algebraMap A (AdicCompletion I A) a) =
        algebraMap A (AdicCompletion I A) (d.delta a) := by sorry

/-! Seven new tests, using actual quotient and completion carriers. -/

-- shifted_quotient_dyadic
example [Fact (Nat.Prime 2)] :
    let I : Ideal ℤ := Ideal.span {2}
    ∀ hp : (2 : ℤ) ∈ I,
      shiftedQuotient 2 I (intDelta 2) hp 1 (Ideal.Quotient.mk (I ^ 2) 2) =
        Ideal.Quotient.mk (I ^ 1) (-1) := by sorry

-- shifted_quotient_not_additive
example [Fact (Nat.Prime 2)] :
    let I : Ideal ℤ := Ideal.span {2}
    ∀ hp : (2 : ℤ) ∈ I,
      let q := shiftedQuotient 2 I (intDelta 2) hp 1
      q (Ideal.Quotient.mk (I ^ 2) (1 + 1)) ≠
        q (Ideal.Quotient.mk (I ^ 2) 1) + q (Ideal.Quotient.mk (I ^ 2) 1) := by sorry

-- shifted_quotient_zero_level
example {A : Type*} [CommRing A] (I : Ideal A) (d : Structure p A)
    (hp : (p : A) ∈ I) (x : A ⧸ I ^ (0 + 1)) :
    shiftedQuotient p I d hp 0 x = 0 := by sorry

-- completion_dyadic_scalar
example [Fact (Nat.Prime 2)] :
    let I : Ideal ℤ := Ideal.span {2}
    ∀ hp : (2 : ℤ) ∈ I,
      AdicCompletion.evalₐ I 1
        ((completion 2 I (intDelta 2) hp).delta
          (algebraMap ℤ (AdicCompletion I ℤ) 2)) =
        Ideal.Quotient.mk (I ^ 1) (-1) := by sorry

-- completion_unit_ideal
example {A : Type*} [CommRing A] (d : Structure p A)
    (hp : (p : A) ∈ (⊤ : Ideal A)) (x : AdicCompletion (⊤ : Ideal A) A) :
    (completion p (⊤ : Ideal A) d hp).delta x = 0 := by sorry

-- completion_complete_base
example {A : Type*} [CommRing A] (I : Ideal A) [IsAdicComplete I A]
    (d : Structure p A) (hp : (p : A) ∈ I) (a : A) :
    (completion p I d hp).delta (AdicCompletion.ofAlgEquiv I a) =
      AdicCompletion.ofAlgEquiv I (d.delta a) := by sorry

-- completion_torsion_survives
example [Fact (Nat.Prime 2)] :
    let A := TrivSqZeroExt ℤ (ZMod 2)
    letI : CommRing A := inferInstanceAs (CommRing (TrivSqZeroExt ℤ (ZMod 2)))
    let I : Ideal A := Ideal.span {2}
    ∀ hp : (2 : A) ∈ I,
      let eps : A := TrivSqZeroExt.inr (1 : ZMod 2)
      let j := algebraMap A (AdicCompletion I A)
      j eps ≠ 0 ∧
        (completion 2 I (squareZeroDelta 2 (intDelta 2) (1 : ZMod 2)) hp).delta (j eps) =
          j eps := by sorry

end TauCeti.Delta

/-! ## Jacobson radical targets and the actual p-local integer ring

Remark 2.16 supplies the image-unit argument. The general localization at
V(p), its comparison with Frobenius saturation, and completed localization
still require their own constructions. The statements here do not assert
that ordinary localization preserves the Jacobson radical hypothesis.
-/

namespace TauCeti.Delta

variable (p : ℕ) [Fact p.Prime]

/-- In a target where p is radical, images of x and phi(x) are units together. -/
theorem isUnit_map_frobenius_iff {A B : Type*} [CommRing A] [CommRing B]
    (d : Structure p A) (f : A →+* B)
    (hp : (p : B) ∈ (⊥ : Ideal B).jacobson) (x : A) :
    IsUnit (f ((toFrobenius p d).1 x)) ↔ IsUnit (f x) := by sorry

/-- Only under the radical hypothesis does the first Witt coordinate suffice. -/
theorem witt2_isUnit_iff_of_mem_jacobson {B : Type*} [CommRing B]
    (hp : (p : B) ∈ (⊥ : Ideal B).jacobson)
    (z : TruncatedWittVector p 2 B) : IsUnit z ↔ IsUnit (z.coeff 0) := by sorry

/-- The unique compatible operation on a localization with p in its radical. -/
noncomputable def localizeJacobson {A : Type*} [CommRing A]
    (S : Submonoid A) (B : Type*) [CommRing B] [Algebra A B] [IsLocalization S B]
    (d : Structure p A) (hp : (p : B) ∈ (⊥ : Ideal B).jacobson) :
    Structure p B := by sorry

theorem localizeJacobson_algebraMap {A B : Type*} [CommRing A] [CommRing B]
    (S : Submonoid A) [Algebra A B] [IsLocalization S B] (d : Structure p A)
    (hp : (p : B) ∈ (⊥ : Ideal B).jacobson) (a : A) :
    (localizeJacobson p S B d hp).delta (algebraMap A B a) =
      algebraMap A B (d.delta a) := by sorry

theorem localizeJacobson_unique {A B : Type*} [CommRing A] [CommRing B]
    (S : Submonoid A) [Algebra A B] [IsLocalization S B] (d : Structure p A)
    (hp : (p : B) ∈ (⊥ : Ideal B).jacobson) (e : Structure p B)
    (he : ∀ a, e.delta (algebraMap A B a) = algebraMap A B (d.delta a)) :
    e = localizeJacobson p S B d hp := by sorry

theorem localizeJacobson_eq_localize {A B : Type*} [CommRing A] [CommRing B]
    (S : Submonoid A) [Algebra A B] [IsLocalization S B] (d : Structure p A)
    (hp : (p : B) ∈ (⊥ : Ideal B).jacobson)
    (hPhi : ∀ s : S, IsUnit (algebraMap A B ((toFrobenius p d).1 s))) :
    localizeJacobson p S B d hp = localize p S B d hPhi := by sorry

-- jacobson_localization_identity
example {A : Type*} [CommRing A] (S : Submonoid A) [IsLocalization S A]
    (d : Structure p A) (hp : (p : A) ∈ (⊥ : Ideal A).jacobson) :
    localizeJacobson p S A d hp = d := by sorry
-- jacobson_localization_zero
example {A : Type*} [CommRing A] (S : Submonoid A)
    [Algebra A (ZMod 1)] [IsLocalization S (ZMod 1)] (d : Structure p A)
    (hp : (p : ZMod 1) ∈ (⊥ : Ideal (ZMod 1)).jacobson) (x : ZMod 1) :
    (localizeJacobson p S (ZMod 1) d hp).delta x = 0 := by sorry
-- jacobson_localization_dyadic
example {A B : Type*} [CommRing A] [CommRing B] (S : Submonoid A)
    [Algebra A B] [IsLocalization S B] (d : Structure 2 A)
    (hp : (2 : B) ∈ (⊥ : Ideal B).jacobson) :
    (localizeJacobson 2 S B d hp).delta 2 = -1 := by sorry

-- This instance uses the pinned primality equivalence, not a new prime ideal.
local instance : (Ideal.span {(p : ℤ)}).IsPrime :=
  Ideal.isPrime_span_singleton_of_prime (Nat.prime_iff_prime_int.mp Fact.out)

/-- The canonical operation on the existing localization Z_(p). -/
noncomputable def intAtPrime :
    Structure p (Localization.AtPrime (Ideal.span {(p : ℤ)})) := by sorry

theorem intAtPrime_algebraMap (a : ℤ) :
    (intAtPrime p).delta (algebraMap ℤ (Localization.AtPrime (Ideal.span {(p : ℤ)})) a) =
      algebraMap ℤ (Localization.AtPrime (Ideal.span {(p : ℤ)})) ((intDelta p).delta a) := by sorry

theorem intAtPrime_frobenius : (toFrobenius p (intAtPrime p)).1 =
    RingHom.id (Localization.AtPrime (Ideal.span {(p : ℤ)})) := by sorry

theorem intAtPrime_spec (x : Localization.AtPrime (Ideal.span {(p : ℤ)})) :
    (p : Localization.AtPrime (Ideal.span {(p : ℤ)})) * (intAtPrime p).delta x =
      x - x ^ p := by sorry

/-- Initiality in the source's p-local coefficient category, allowing torsion. -/
theorem intAtPrime_initial {B : Type*} [CommRing B] (d : Structure p B)
    (hB : ∀ n : ℤ, ¬ (p : ℤ) ∣ n → IsUnit (n : B)) :
    ∃! f : Localization.AtPrime (Ideal.span {(p : ℤ)}) →+* B,
      ∀ x, f ((intAtPrime p).delta x) = d.delta (f x) := by sorry

-- p_local_integer_prime
example : (intAtPrime p).delta p = 1 -
    (p : Localization.AtPrime (Ideal.span {(p : ℤ)})) ^ (p - 1) := by sorry
-- p_local_integer_negative_dyadic
example : (intAtPrime 2).delta (-1) = -1 := by sorry
local instance : (Ideal.span {(2 : ℤ)}).IsPrime :=
  Ideal.isPrime_span_singleton_of_prime (Nat.prime_iff_prime_int.mp Nat.prime_two)

-- p_local_integer_third
example (s : (Ideal.span {(2 : ℤ)}).primeCompl) (hs : (s : ℤ) = 3) :
    let z := IsLocalization.mk' (Localization.AtPrime (Ideal.span {(2 : ℤ)})) (1 : ℤ) s
    9 * (intAtPrime 2).delta z = 1 := by sorry
-- p_local_integer_zero
example : (intAtPrime p).delta 0 = 0 := by sorry

end TauCeti.Delta

/-! ## Delta-stabilization of ideals and the universal delta quotient

Only the delta-stabilization and quotient operation are new. Ideal.span,
the quotient ring, its projection, and its ring-map lift are the existing
Mathlib constructions. No finite generation, p-torsionfreeness or p-locality
is required for these elementary consequences of the delta identities.
-/

namespace TauCeti.Delta

variable (p : ℕ) [Fact p.Prime]

/-- Testing delta-stability on generators of an ordinary ideal suffices. -/
theorem span_delta_stable_iff {A : Type*} [CommRing A]
    (d : Structure p A) (S : Set A) :
    (∀ x ∈ Ideal.span S, d.delta x ∈ Ideal.span S) ↔
      (∀ x ∈ S, d.delta x ∈ Ideal.span S) := by sorry

/-- Smallest delta-stable ideal containing I: span of all iterated delta images. -/
noncomputable def idealClosure {A : Type*} [CommRing A]
    (d : Structure p A) (I : Ideal A) : Ideal A := by sorry

theorem idealClosure_eq_span {A : Type*} [CommRing A]
    (d : Structure p A) (I : Ideal A) :
    idealClosure p d I = Ideal.span
      {x : A | ∃ (n : ℕ) (a : A), a ∈ I ∧ (d.delta^[n]) a = x} := by sorry

theorem le_idealClosure {A : Type*} [CommRing A]
    (d : Structure p A) (I : Ideal A) : I ≤ idealClosure p d I := by sorry

/-- Node delta-ideal-closure-stable; also the stability API. -/
theorem idealClosure_stable {A : Type*} [CommRing A]
    (d : Structure p A) (I : Ideal A) :
    ∀ x ∈ idealClosure p d I, d.delta x ∈ idealClosure p d I := by sorry

/-- Node delta-ideal-closure-minimal; only J is assumed delta-stable. -/
theorem idealClosure_le {A : Type*} [CommRing A]
    (d : Structure p A) (I J : Ideal A)
    (hJ : ∀ x ∈ J, d.delta x ∈ J) :
    idealClosure p d I ≤ J ↔ I ≤ J := by sorry

theorem idealClosure_idem {A : Type*} [CommRing A]
    (d : Structure p A) (I : Ideal A) :
    idealClosure p d (idealClosure p d I) = idealClosure p d I := by sorry

theorem idealClosure_mono {A : Type*} [CommRing A]
    (d : Structure p A) {I J : Ideal A} (h : I ≤ J) :
    idealClosure p d I ≤ idealClosure p d J := by sorry

/-- The kernel of a delta-compatible ring map is delta-stable. -/
theorem ker_delta_stable {A B : Type*} [CommRing A] [CommRing B]
    (d : Structure p A) (e : Structure p B) (f : A →+* B)
    (hf : ∀ a, f (d.delta a) = e.delta (f a)) :
    ∀ x ∈ RingHom.ker f, d.delta x ∈ RingHom.ker f := by sorry

/-- The operation on the existing quotient ring; no duplicate quotient type. -/
noncomputable def quotientByIdealClosure {A : Type*} [CommRing A]
    (d : Structure p A) (I : Ideal A) :
    Structure p (A ⧸ idealClosure p d I) := by sorry

/-- Node delta-universal-quotient-projection; also the evaluation API. -/
theorem quotientByIdealClosure_mk {A : Type*} [CommRing A]
    (d : Structure p A) (I : Ideal A) (a : A) :
    (quotientByIdealClosure p d I).delta (Ideal.Quotient.mk (idealClosure p d I) a) =
      Ideal.Quotient.mk (idealClosure p d I) (d.delta a) := by sorry

theorem quotientByIdealClosure_unique {A : Type*} [CommRing A]
    (d : Structure p A) (I : Ideal A)
    (e : Structure p (A ⧸ idealClosure p d I))
    (he : ∀ a, e.delta (Ideal.Quotient.mk (idealClosure p d I) a) =
      Ideal.Quotient.mk (idealClosure p d I) (d.delta a)) :
    e = quotientByIdealClosure p d I := by sorry

theorem quotientByIdealClosure_kills {A : Type*} [CommRing A]
    (d : Structure p A) (I : Ideal A) {a : A} (ha : a ∈ I) :
    Ideal.Quotient.mk (idealClosure p d I) a = 0 := by sorry

/-- Universal among delta-compatible ring maps annihilating I.
The witness is Mathlib's Ideal.Quotient.lift, with delta-compatibility proved. -/
theorem quotientByIdealClosure_universal {A B : Type*} [CommRing A] [CommRing B]
    (d : Structure p A) (I : Ideal A) (e : Structure p B) (f : A →+* B)
    (hf : ∀ a, f (d.delta a) = e.delta (f a)) (hI : ∀ a ∈ I, f a = 0) :
    ∃! g : (A ⧸ idealClosure p d I) →+* B,
      (∀ a, g (Ideal.Quotient.mk (idealClosure p d I) a) = f a) ∧
      (∀ z, g ((quotientByIdealClosure p d I).delta z) = e.delta (g z)) := by sorry

-- ideal_closure_zero
example {A : Type*} [CommRing A] (d : Structure p A) :
    idealClosure p d (⊥ : Ideal A) = ⊥ := by sorry

-- ideal_closure_stable_fixed
example {A : Type*} [CommRing A] (d : Structure p A) (I : Ideal A)
    (hI : ∀ x ∈ I, d.delta x ∈ I) : idealClosure p d I = I := by sorry

-- ideal_closure_prime_is_top
example {A : Type*} [CommRing A] (d : Structure p A) :
    idealClosure p d (Ideal.span {(p : A)}) = ⊤ := by sorry

-- ideal_closure_not_ordinary_span
example [Fact (Nat.Prime 2)] :
    idealClosure 2 (intDelta 2) (Ideal.span {(2 : ℤ)}) ≠ Ideal.span {(2 : ℤ)} := by sorry

-- universal_quotient_zero_ideal
example {A : Type*} [CommRing A] (d : Structure p A) :
    let q := Ideal.Quotient.mk (idealClosure p d (⊥ : Ideal A))
    Function.Bijective q ∧
      ∀ a, (quotientByIdealClosure p d ⊥).delta (q a) = q (d.delta a) := by sorry

-- universal_quotient_prime_collapses
example {A : Type*} [CommRing A] (d : Structure p A) :
    Subsingleton (A ⧸ idealClosure p d (Ideal.span {(p : A)})) := by sorry

-- universal_quotient_identity_factor
example {A : Type*} [CommRing A] (d : Structure p A) (I : Ideal A) :
    ∃! g : (A ⧸ idealClosure p d I) →+* (A ⧸ idealClosure p d I),
      (∀ a, g (Ideal.Quotient.mk (idealClosure p d I) a) =
        Ideal.Quotient.mk (idealClosure p d I) a) ∧
      (∀ z, g ((quotientByIdealClosure p d I).delta z) =
        (quotientByIdealClosure p d I).delta (g z)) := by sorry

end TauCeti.Delta


/-! ## Shared prism vocabulary (PR.0), used by every later layer

A prism is recorded with the data and conditions that Mathlib can state today. The
condition that `A` is derived `(p, I)`-complete belongs to
`DerivedDeRhamCohomology:DD.1` (derived completion) and is left out of the structure
until that layer exists; every statement below that needs it says so in its docstring.
Complexes are objects of Mathlib's derived category `DerivedCategory (ModuleCat A)`,
read as the 1-categorical shadow of the derived ∞-category the sources use. -/

namespace TauCeti.Prismatic

open CategoryTheory TauCeti.Delta

attribute [local instance] HasDerivedCategory.standard

universe u

variable (p : ℕ) [Fact p.Prime]

/-- Node `PR.0/delta-ring-category`: a ring map is a map of δ-rings when it commutes with δ. -/
def IsDeltaHom {A B : Type*} [CommRing A] [CommRing B]
    (dA : Delta.Structure p A) (dB : Delta.Structure p B) (f : A →+* B) : Prop :=
  ∀ x, f (dA.delta x) = dB.delta (f x)

/-- Node `PR.0/distinguished-element`: `d` is distinguished when `δ(d)` is a unit. -/
def IsDistinguished {A : Type*} [CommRing A] (d : Delta.Structure p A) (x : A) : Prop :=
  IsUnit (d.delta x)

/-- Node `PR.0/prism`: a δ-ring `A` with an ideal `I` that is an invertible `A`-module
(a Cartier divisor on `Spec A`) and satisfies `p ∈ I + φ(I)A`. Derived
`(p, I)`-completeness (DD.1) is the one condition of Bhatt–Scholze Definition 3.2 not
recorded here. -/
structure Prism (A : Type u) [CommRing A] where
  /-- The δ-structure. -/
  δ : Delta.Structure p A
  /-- The prism ideal. -/
  I : Ideal A
  /-- `I` is an invertible module: locally principal, generated by a nonzerodivisor. -/
  invertible : Module.Invertible A I
  /-- `p ∈ I + φ(I)A`. -/
  p_mem : (p : A) ∈ I ⊔ I.map (toFrobenius p δ).1

namespace Prism

variable {p} {A : Type u} [CommRing A] (P : Prism p A)

/-- The Frobenius lift `φ(x) = x ^ p + p δ(x)` of a prism. -/
noncomputable def φ : A →+* A := (toFrobenius p P.δ).1

/-- The reduction `Ā = A / I`. -/
abbrev bar : Type u := A ⧸ P.I

/-- Node `PR.0/bounded-prism`: `A / I` has bounded `p^∞`-torsion. -/
def IsBounded : Prop :=
  ∃ n : ℕ, ∀ x : A ⧸ P.I, (∃ m : ℕ, (p : A ⧸ P.I) ^ m * x = 0) → (p : A ⧸ P.I) ^ n * x = 0

/-- A prism is perfect when its Frobenius is bijective. -/
def IsPerfect : Prop := Function.Bijective P.φ

/-- A prism is orientable when `I` is principal; an orientation is a chosen generator. -/
def IsOrientable : Prop := Submodule.IsPrincipal P.I

/-- A prism is crystalline when `I = (p)`. -/
def IsCrystalline : Prop := P.I = Ideal.span {(p : A)}

/-- Node `PR.0/prism-category`: a map of prisms is a map of δ-rings carrying `I` into `J`. -/
structure Hom {B : Type u} [CommRing B] (Q : Prism p B) where
  /-- The underlying ring map. -/
  toRingHom : A →+* B
  /-- It commutes with δ. -/
  isDeltaHom : IsDeltaHom p P.δ Q.δ toRingHom
  /-- It carries `I` into `J`. -/
  map_I : P.I.map toRingHom ≤ Q.I

end Prism

section SharedCarriers

variable {p} {A : Type u} [CommRing A]

/-- Nodes `PR.1/relative-prismatic-cohomology` and `PR.2/derived-prismatic-cohomology`:
the (derived) prismatic cohomology `Δ_{R/A}` of an `A / I`-algebra `R`, as an object of
`D(A)`. For `R` `p`-completely smooth it is the cohomology of the prismatic site (PR.1);
in general it is the left Kan extension of PR.2. -/
noncomputable def prismaticCohomology (P : Prism p A) (R : Type u) [CommRing R]
    [Algebra P.bar R] : DerivedCategory (ModuleCat.{u} A) := sorry

/-- Restriction of scalars along the Frobenius of a prism, on `D(A)`: the functor `φ_*`. -/
noncomputable def frobeniusPushforward (P : Prism p A) :
    DerivedCategory (ModuleCat.{u} A) ⥤ DerivedCategory (ModuleCat.{u} A) :=
  (ModuleCat.restrictScalars P.φ).mapDerivedCategory

/-- Node `PR.1/frobenius-on-prismatic-cohomology`: the `φ_A`-semilinear Frobenius of
`Δ_{R/A}`, as a map `Δ_{R/A} ⟶ φ_* Δ_{R/A}` in `D(A)`. -/
noncomputable def prismaticFrobenius (P : Prism p A) (R : Type u) [CommRing R]
    [Algebra P.bar R] :
    prismaticCohomology P R ⟶ (frobeniusPushforward P).obj (prismaticCohomology P R) := sorry

/-- Nodes `PR.1/hodge-tate-cohomology`: Hodge–Tate cohomology
`Δ̄_{R/A} = Δ_{R/A} ⊗^L_A A / I`, as an object of `D(R)`. -/
noncomputable def hodgeTateCohomology (P : Prism p A) (R : Type u) [CommRing R]
    [Algebra P.bar R] : DerivedCategory (ModuleCat.{u} R) := sorry

end SharedCarriers

end TauCeti.Prismatic


/-! ## PR.0, continued: free δ-rings, Witt vectors, perfect δ-rings, distinguished elements

Target-level nodes of the layer `PrismaticCohomology:PR.0` that follow the lemma-level
prefix above. Statements that the sources deduce from derived `(p, I)`-completeness are
stated here with the consequence they use as an explicit hypothesis: that `p` (and `I`)
lie in the Jacobson radical. -/

namespace TauCeti.Delta

open scoped TensorProduct

universe u v

variable (p : ℕ) [Fact p.Prime]

/-! ### Node `PR.0/free-delta-ring` -/

/-- The carrier of the free δ-ring on `S`: the polynomial ring `ℤ[x_{s,n}]`, `n ≥ 0`. -/
abbrev Free (S : Type u) : Type u := MvPolynomial (S × ℕ) ℤ

/-- The δ-structure on the free δ-ring, determined by `δ(x_{s,n}) = x_{s,n+1}`. -/
noncomputable def freeDelta (S : Type u) : Structure p (Free S) := sorry

theorem freeDelta_X (S : Type u) (s : S) (n : ℕ) :
    (freeDelta p S).delta (MvPolynomial.X (s, n)) = MvPolynomial.X (s, n + 1) := sorry

/-- The universal map out of the free δ-ring: `x_{s,n} ↦ δ^n (f s)`. -/
noncomputable def Free.lift {S : Type u} {R : Type v} [CommRing R] (d : Structure p R)
    (f : S → R) : Free S →+* R :=
  (MvPolynomial.aeval (fun sn : S × ℕ => d.delta^[sn.2] (f sn.1))).toRingHom

theorem Free.lift_isDeltaHom {S : Type u} {R : Type v} [CommRing R] (d : Structure p R)
    (f : S → R) :
    (∀ x, Free.lift p d f ((freeDelta p S).delta x) = d.delta (Free.lift p d f x)) ∧
      ∀ g : Free S →+* R, (∀ x, g ((freeDelta p S).delta x) = d.delta (g x)) →
        (∀ s, g (MvPolynomial.X (s, 0)) = f s) → g = Free.lift p d f := sorry

/-- The Frobenius of a free δ-ring is faithfully flat. -/
theorem Free.frobenius_faithfullyFlat (S : Type u) :
    @Module.FaithfullyFlat (Free S) (Free S) _ _
      (Module.compHom (Free S) (toFrobenius p (freeDelta p S)).1) := sorry

-- free_delta_frobenius_X
example (S : Type u) (s : S) :
    (toFrobenius p (freeDelta p S)).1 (MvPolynomial.X (s, 0)) =
      MvPolynomial.X (s, 0) ^ p + (p : Free S) * MvPolynomial.X (s, 1) := sorry

-- free_delta_lift_int_two
example [Fact (Nat.Prime 2)] :
    Free.lift 2 (intDelta 2) (fun _ : Unit => (2 : ℤ)) (MvPolynomial.X ((), 1)) = -1 := sorry

-- free_delta_empty
example : Function.Bijective (algebraMap ℤ (Free Empty)) := sorry

-- free_delta_not_free_ring
example : (MvPolynomial.X ((), 1) : Free Unit) ∉
    (MvPolynomial.aeval (fun _ : Unit => (MvPolynomial.X ((), 0) : Free Unit)) :
      MvPolynomial Unit ℤ →ₐ[ℤ] Free Unit).range := sorry

/-! ### Node `PR.0/delta-ring-category` -/

/-- The coordinatewise δ-structure on a product. -/
noncomputable def Structure.prod {A : Type u} {B : Type v} [CommRing A] [CommRing B]
    (dA : Structure p A) (dB : Structure p B) : Structure p (A × B) := sorry

/-- The δ-structure on a pushout `A ⊗[C] B` of δ-rings along δ-maps. -/
noncomputable def Structure.tensorProduct {C A B : Type u} [CommRing C] [CommRing A] [CommRing B]
    [Algebra C A] [Algebra C B] (dC : Structure p C) (dA : Structure p A) (dB : Structure p B)
    (hA : ∀ c, algebraMap C A (dC.delta c) = dA.delta (algebraMap C A c))
    (hB : ∀ c, algebraMap C B (dC.delta c) = dB.delta (algebraMap C B c)) :
    Structure p (A ⊗[C] B) := sorry

/-- The δ-structure on `W(R)`: Witt vectors are the cofree δ-ring. -/
noncomputable def witt (R : Type u) [CommRing R] : Structure p (WittVector p R) := sorry

theorem witt_frobenius (R : Type u) [CommRing R] :
    (toFrobenius p (witt p R)).1 = WittVector.frobenius := sorry

/-- The unit `w_A : A → W(A)` of the adjunction between δ-rings and rings. -/
noncomputable def wittUnit {A : Type u} [CommRing A] (d : Structure p A) :
    A →+* WittVector p A := sorry

theorem wittUnit_coeff_zero {A : Type u} [CommRing A] (d : Structure p A) (x : A) :
    (wittUnit p d x).coeff 0 = x := sorry

theorem wittUnit_coeff_one {A : Type u} [CommRing A] (d : Structure p A) (x : A) :
    (wittUnit p d x).coeff 1 = d.delta x := sorry

theorem wittUnit_ghost {A : Type u} [CommRing A] (d : Structure p A) (x : A) (n : ℕ) :
    WittVector.ghostComponent n (wittUnit p d x) = (toFrobenius p d).1^[n] x := sorry

-- witt_unit_int_ghost
example (n : ℕ) (a : ℤ) : WittVector.ghostComponent n (wittUnit p (intDelta p) a) = a := sorry

-- delta_prod_fst
example {A : Type u} {B : Type v} [CommRing A] [CommRing B] (dA : Structure p A)
    (dB : Structure p B) (z : A × B) : ((dA.prod p dB).delta z).1 = dA.delta z.1 := sorry

-- witt_delta_torsionfree
example (x : WittVector p ℤ) :
    (p : WittVector p ℤ) * (witt p ℤ).delta x = WittVector.frobenius x - x ^ p := sorry

-- witt_unit_not_teichmuller
example [Fact (Nat.Prime 2)] :
    wittUnit 2 (intDelta 2) (2 : ℤ) ≠ WittVector.teichmuller 2 (2 : ℤ) := sorry

/-! ### Node `PR.0/animated-delta-rings`

The 1-categorical carrier: simplicial objects of δ-rings. Animation, derived pushouts and
derived completion are supplied by `EnhancedDerivedSheaves:E5:animation` and
`DerivedDeRhamCohomology:DD.1`. -/

/-- A simplicial commutative δ-ring. -/
structure SimplicialDeltaRing where
  /-- The underlying simplicial commutative ring. -/
  ring : CategoryTheory.SimplicialObject CommRingCat.{u}
  /-- The δ-structure in each degree. -/
  δ : ∀ n : SimplexCategoryᵒᵖ, Structure p (ring.obj n)
  /-- Simplicial operators commute with δ. -/
  map_δ : ∀ {m n : SimplexCategoryᵒᵖ} (f : m ⟶ n) (x : ring.obj m),
    (ring.map f).hom ((δ m).delta x) = (δ n).delta ((ring.map f).hom x)

/-- The constant simplicial δ-ring on a δ-ring. -/
def SimplicialDeltaRing.const (A : Type u) [CommRing A] (d : Structure p A) :
    SimplicialDeltaRing.{u} p where
  ring := (CategoryTheory.Functor.const _).obj (CommRingCat.of A)
  δ := fun _ => d
  map_δ := by sorry

/-- The levelwise Frobenius of a simplicial δ-ring. -/
noncomputable def SimplicialDeltaRing.frobenius (X : SimplicialDeltaRing.{u} p) :
    X.ring ⟶ X.ring := sorry

theorem SimplicialDeltaRing.frobenius_app (X : SimplicialDeltaRing.{u} p)
    (n : SimplexCategoryᵒᵖ) (x : X.ring.obj n) :
    ((X.frobenius p).app n).hom x = x ^ p + (p : X.ring.obj n) * (X.δ n).delta x := sorry

-- simplicial_delta_const_obj
example (A : Type u) [CommRing A] (d : Structure p A) (n : SimplexCategoryᵒᵖ) :
    ((SimplicialDeltaRing.const p A d).ring.obj n : Type u) = A := rfl

-- simplicial_delta_const_frobenius
example (A : Type u) [CommRing A] (d : Structure p A) (n : SimplexCategoryᵒᵖ) (x : A) :
    (((SimplicialDeltaRing.const p A d).frobenius p).app n).hom x = (toFrobenius p d).1 x := sorry

-- simplicial_delta_face_commutes
example (X : SimplicialDeltaRing.{u} p) {m n : SimplexCategoryᵒᵖ} (f : m ⟶ n) (x : X.ring.obj m) :
    (X.ring.map f).hom (((X.frobenius p).app m).hom x) =
      ((X.frobenius p).app n).hom ((X.ring.map f).hom x) := sorry

-- simplicial_delta_frobenius_mod_p
example (X : SimplicialDeltaRing.{u} p) (n : SimplexCategoryᵒᵖ) (x : X.ring.obj n) :
    ∃ y, ((X.frobenius p).app n).hom x = x ^ p + (p : X.ring.obj n) * y := sorry

/-! ### Node `PR.0/delta-radical-localization` -/

/-- The Frobenius saturation of a submonoid: generated by all `φ^n(s)`. -/
def frobeniusSaturation {A : Type u} [CommRing A] (d : Structure p A) (S : Submonoid A) :
    Submonoid A :=
  Submonoid.closure {a | ∃ s ∈ S, ∃ n : ℕ, (toFrobenius p d).1^[n] s = a}

theorem frobeniusSaturation_stable {A : Type u} [CommRing A] (d : Structure p A)
    (S : Submonoid A) :
    S ≤ frobeniusSaturation p d S ∧
      ∀ a ∈ frobeniusSaturation p d S, (toFrobenius p d).1 a ∈ frobeniusSaturation p d S := sorry

/-- The elements of `A` that become units modulo `p` once the Frobenius saturation of `S` is
inverted. Localizing `A` at this submonoid gives the `p`-local localization `(S⁻¹A)_(p)` of
Bhatt–Scholze, Remark 2.16. -/
def radicalSaturation {A : Type u} [CommRing A] (d : Structure p A) (S : Submonoid A) :
    Submonoid A :=
  (IsUnit.submonoid (Localization (frobeniusSaturation p d S) ⧸
      Ideal.span {(p : Localization (frobeniusSaturation p d S))})).comap
    ((Ideal.Quotient.mk (Ideal.span {(p : Localization (frobeniusSaturation p d S))})).comp
      (algebraMap A (Localization (frobeniusSaturation p d S)))).toMonoidHom

theorem localizeRadical_p_mem_jacobson {A : Type u} [CommRing A] (d : Structure p A)
    (S : Submonoid A) (B : Type u) [CommRing B] [Algebra A B]
    [IsLocalization (radicalSaturation p d S) B] :
    (p : B) ∈ Ideal.jacobson (⊥ : Ideal B) ∧ ∀ s ∈ S, IsUnit (algebraMap A B s) := sorry

/-- The δ-structure on the `p`-local localization `(S⁻¹A)_(p)`. -/
noncomputable def localizeRadical {A : Type u} [CommRing A] (d : Structure p A) (S : Submonoid A)
    (B : Type u) [CommRing B] [Algebra A B] [IsLocalization (radicalSaturation p d S) B] :
    Structure p B := sorry

theorem localizeRadical_unique {A : Type u} [CommRing A] (d : Structure p A) (S : Submonoid A)
    (B : Type u) [CommRing B] [Algebra A B] [IsLocalization (radicalSaturation p d S) B]
    (C : Type u) [CommRing C] [Algebra A C] (dC : Structure p C)
    (hC : ∀ a, algebraMap A C (d.delta a) = dC.delta (algebraMap A C a))
    (hp : (p : C) ∈ Ideal.jacobson (⊥ : Ideal C)) (hS : ∀ s ∈ S, IsUnit (algebraMap A C s)) :
    ∃! g : B →ₐ[A] C, ∀ b, g ((localizeRadical p d S B).delta b) = dC.delta (g b) := sorry

-- frobenius_saturation_phi_stable_already
example {A : Type u} [CommRing A] (d : Structure p A) (S : Submonoid A)
    (h : ∀ s ∈ S, (toFrobenius p d).1 s ∈ S) : frobeniusSaturation p d S = S := sorry

-- frobenius_saturation_int
example (S : Submonoid ℤ) : frobeniusSaturation p (intDelta p) S = S := sorry

-- frobenius_saturation_free_strict
example : (MvPolynomial.X ((), 0) ^ p + (p : Free Unit) * MvPolynomial.X ((), 1) : Free Unit) ∈
      frobeniusSaturation p (freeDelta p Unit) (Submonoid.powers (MvPolynomial.X ((), 0))) ∧
    (MvPolynomial.X ((), 0) ^ p + (p : Free Unit) * MvPolynomial.X ((), 1) : Free Unit) ∉
      Submonoid.powers (MvPolynomial.X ((), 0) : Free Unit) := sorry

/-! ### Node `PR.0/prism-perfection`: the perfection of a δ-ring -/

/-- A perfection of a δ-ring `A`: a ring `B` with `ι : A → B` and an automorphism `ψ`
intertwining the Frobenius, initial among such. It presents `B` as `colim_φ A`. -/
structure Perfection {A : Type u} [CommRing A] (d : Structure p A) (B : Type u) [CommRing B] where
  /-- The canonical map. -/
  ι : A →+* B
  /-- The Frobenius of the perfection. -/
  ψ : B ≃+* B
  /-- `ψ ∘ ι = ι ∘ φ`. -/
  comm : ∀ a, ψ (ι a) = ι ((toFrobenius p d).1 a)
  /-- Initiality. -/
  desc : ∀ (C : Type u) [CommRing C] (χ : C ≃+* C) (g : A →+* C),
    (∀ a, χ (g a) = g ((toFrobenius p d).1 a)) →
      ∃! h : B →+* C, h.comp ι = g ∧ ∀ b, h (ψ b) = χ (h b)

theorem Perfection.exists {A : Type u} [CommRing A] (d : Structure p A) :
    ∃ (B : Type u) (_ : CommRing B), Nonempty (Perfection p d B) := sorry

/-- The map out of a perfection given by its universal property. -/
noncomputable def Perfection.lift {A B C : Type u} [CommRing A] [CommRing B] [CommRing C]
    {d : Structure p A} (F : Perfection p d B) (χ : C ≃+* C) (g : A →+* C)
    (hg : ∀ a, χ (g a) = g ((toFrobenius p d).1 a)) : B →+* C :=
  (F.desc C χ g hg).exists.choose

theorem Perfection.lift_comp {A B C : Type u} [CommRing A] [CommRing B] [CommRing C]
    {d : Structure p A} (F : Perfection p d B) (χ : C ≃+* C) (g : A →+* C)
    (hg : ∀ a, χ (g a) = g ((toFrobenius p d).1 a)) : (F.lift p χ g hg).comp F.ι = g := sorry

theorem Perfection.p_mem_nonZeroDivisors {A B : Type u} [CommRing A] [CommRing B]
    {d : Structure p A} (F : Perfection p d B) (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) :
    (p : B) ∈ nonZeroDivisors B := sorry

-- perfection_of_perfect_prism
example {A B : Type u} [CommRing A] [CommRing B] {d : Structure p A} (F : Perfection p d B)
    (h : Function.Bijective (toFrobenius p d).1) : Function.Bijective F.ι := sorry

-- perfection_kills_frobenius_kernel
example {A B : Type u} [CommRing A] [CommRing B] {d : Structure p A} (F : Perfection p d B)
    (a : A) (ha : (toFrobenius p d).1 a = 0) : F.ι a = 0 := sorry

end TauCeti.Delta

namespace TauCeti.Prismatic

open TauCeti.Delta
open scoped TensorProduct

universe u

variable (p : ℕ) [Fact p.Prime]

/-! ### Node `PR.0/distinguished-element` and the lemmas on distinguished elements -/

/-- The ideal `(p)` of `ℤ` is prime, so that `ℤ_(p)` is Mathlib's localization at it. -/
local instance : (Ideal.span {(p : ℤ)}).IsPrime :=
  Ideal.isPrime_span_singleton_of_prime (Nat.prime_iff_prime_int.mp Fact.out)

theorem IsDistinguished.map {A B : Type*} [CommRing A] [CommRing B] {dA : Delta.Structure p A}
    {dB : Delta.Structure p B} {f : A →+* B} (hf : IsDeltaHom p dA dB f) {x : A}
    (hx : IsDistinguished p dA x) : IsDistinguished p dB (f x) := sorry

theorem isDistinguished_p_int :
    IsDistinguished p (intAtPrime p) (p : Localization.AtPrime (Ideal.span {(p : ℤ)})) := sorry

theorem IsDistinguished.p_mem_span {A : Type*} [CommRing A] {d : Delta.Structure p A} {x : A}
    (hx : IsDistinguished p d x) : (p : A) ∈ Ideal.span {x, (toFrobenius p d).1 x} := sorry

-- distinguished_p_value
example : (intAtPrime p).delta (p : Localization.AtPrime (Ideal.span {(p : ℤ)})) =
    1 - (p : Localization.AtPrime (Ideal.span {(p : ℤ)})) ^ (p - 1) := sorry

-- distinguished_p_squared_fails
example : ¬ IsDistinguished p (intAtPrime p)
    ((p : Localization.AtPrime (Ideal.span {(p : ℤ)})) ^ 2) := sorry

-- distinguished_zero_ring
example {A : Type*} [CommRing A] [Subsingleton A] (d : Delta.Structure p A) (x : A) :
    IsDistinguished p d x := sorry

-- distinguished_unit_times_p
example (u : (Localization.AtPrime (Ideal.span {(p : ℤ)}))ˣ) :
    IsDistinguished p (intAtPrime p) (u * (p : Localization.AtPrime (Ideal.span {(p : ℤ)}))) := sorry

/-- Node `PR.0/distinguished-factor-rigidity` (1): unit multiples. -/
theorem IsDistinguished.unit_mul {A : Type*} [CommRing A] {d : Delta.Structure p A} {x : A}
    (hx : IsDistinguished p d x) (u : Aˣ) (hrad : x ∈ Ideal.jacobson (⊥ : Ideal A))
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) : IsDistinguished p d (u * x) := sorry

/-- Node `PR.0/distinguished-factor-rigidity` (2): factors. -/
theorem IsDistinguished.of_mul {A : Type*} [CommRing A] {d : Delta.Structure p A} {f h : A}
    (hx : IsDistinguished p d (f * h)) (hf : f ∈ Ideal.jacobson (⊥ : Ideal A))
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) : IsDistinguished p d f ∧ IsUnit h := sorry

/-- Node `PR.0/local-distinguished-prism-generators` (a): Bhatt–Scholze Lemma 2.25. -/
theorem isDistinguished_iff_p_mem_span {A : Type*} [CommRing A] (d : Delta.Structure p A) (x : A)
    (hx : x ∈ Ideal.jacobson (⊥ : Ideal A)) (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) :
    IsDistinguished p d x ↔ (p : A) ∈ Ideal.span {x, (toFrobenius p d).1 x} := sorry

/-- Node `PR.0/p-torsion-freeness-criteria` (1): if `p x = 0` then `φ(x) = 0`, for `p`-local
δ-rings (here: `δ(p)` is a unit). -/
theorem frobenius_eq_zero_of_p_mul_eq_zero {A : Type*} [CommRing A] (d : Delta.Structure p A)
    (hδp : IsUnit (d.delta (p : A))) (x : A) (hx : (p : A) * x = 0) :
    (toFrobenius p d).1 x = 0 := sorry

/-- Node `PR.0/p-torsion-freeness-criteria` (2): reduced `p`-local δ-rings are `p`-torsion-free. -/
theorem p_torsionFree_of_isReduced {A : Type*} [CommRing A] [IsReduced A] (d : Delta.Structure p A)
    (hδp : IsUnit (d.delta (p : A))) (x : A) (hx : (p : A) * x = 0) : x = 0 := sorry

/-- Node `PR.0/rank-one-elements`: `δ(x ^ (p ^ n)) ∈ p ^ n A`. -/
theorem delta_pow_p_pow_mem {A : Type*} [CommRing A] (d : Delta.Structure p A) (x : A) (n : ℕ) :
    d.delta (x ^ p ^ n) ∈ Ideal.span {(p : A) ^ n} := sorry

/-- Node `PR.0/perfect-delta-rings`: on `W(R)`, `R` perfect of characteristic `p`, there is only
one δ-structure. -/
theorem witt_structure_unique (R : Type*) [CommRing R] [CharP R p] [PerfectRing R p]
    (d : Delta.Structure p (WittVector p R)) : d = Delta.witt p R := sorry

/-- Node `PR.0/distinguished-in-perfect-delta-rings` (Lemma 2.34 (1)). -/
theorem IsDistinguished.mem_nonZeroDivisors {A : Type*} [CommRing A] {d : Delta.Structure p A}
    {x : A} (hx : IsDistinguished p d x) (htf : (p : A) ∈ nonZeroDivisors A)
    (hsep : ∀ a : A, (∀ n : ℕ, a ∈ Ideal.span {(p : A) ^ n}) → a = 0)
    (hred : IsReduced (A ⧸ Ideal.span {(p : A)})) : x ∈ nonZeroDivisors A := sorry

/-! ### Node `PR.0/complete-regular-sequence` (discrete shadow) -/

/-- `x` is regular on `B / I B` and every `B / (I B + (x_1, …, x_k))` is flat over `A / I`. -/
def IsRelativelyRegular {A B : Type*} [CommRing A] [CommRing B] [Algebra A B] (I : Ideal A)
    (x : List B) : Prop :=
  RingTheory.Sequence.IsWeaklyRegular (B ⧸ I.map (algebraMap A B)) x ∧
    ∀ k : ℕ, Module.Flat (A ⧸ I) ((A ⧸ I) ⊗[A] (B ⧸ Ideal.ofList (x.take k)))

theorem IsRelativelyRegular.nil {A B : Type*} [CommRing A] [CommRing B] [Algebra A B]
    (I : Ideal A) :
    IsRelativelyRegular I ([] : List B) ↔
      Module.Flat (A ⧸ I) ((A ⧸ I) ⊗[A] (B ⧸ (⊥ : Ideal B))) := sorry

theorem IsRelativelyRegular.polynomial {A : Type*} [CommRing A] (I : Ideal A) (r : ℕ) :
    IsRelativelyRegular I
      ((List.finRange r).map (fun i => (MvPolynomial.X i : MvPolynomial (Fin r) A))) := sorry

theorem IsRelativelyRegular.baseChange {A A' B : Type*} [CommRing A] [CommRing A'] [CommRing B]
    [Algebra A B] [Algebra A A'] (I : Ideal A) (x : List B) (h : IsRelativelyRegular I x) :
    IsRelativelyRegular (I.map (algebraMap A A'))
      (x.map (fun b => ((1 : A') ⊗ₜ[A] b : A' ⊗[A] B))) := sorry

-- relatively_regular_variable
example : IsRelativelyRegular (Ideal.span {(p : ℤ)}) [(Polynomial.X : Polynomial ℤ)] := sorry

-- relatively_regular_empty_self
example {A : Type*} [CommRing A] (I : Ideal A) : IsRelativelyRegular I ([] : List A) := sorry

-- relatively_regular_p_fails
example : ¬ IsRelativelyRegular (Ideal.span {(p : ℤ)}) [(p : ℤ)] := sorry

-- relatively_regular_non_flat_quotient
example : ¬ IsRelativelyRegular (⊥ : Ideal ℤ) [((p : Polynomial ℤ) * Polynomial.X)] := sorry

/-! ### Nodes `PR.0/prism` and `PR.0/prism-category` -/

namespace Prism

variable {p} {A : Type u} [CommRing A]

theorem ext {P Q : Prism p A} (hδ : P.δ = Q.δ) (hI : P.I = Q.I) : P = Q := sorry

/-- `p ∈ I ^ p + φ(I) A`, Bhatt–Scholze Lemma 3.1. -/
theorem p_mem_pow (P : Prism p A) (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A))
    (hI : P.I ≤ Ideal.jacobson (⊥ : Ideal A)) : (p : A) ∈ P.I ^ p ⊔ P.I.map P.φ := sorry

/-- Node `PR.0/prism-frobenius-ideal-principal`: `φ(I) A` is generated by a distinguished
element (Bhatt–Scholze Lemma 3.6). -/
theorem exists_distinguished_generator_map (P : Prism p A)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) (hI : P.I ≤ Ideal.jacobson (⊥ : Ideal A)) :
    ∃ d : A, P.I.map P.φ = Ideal.span {d} ∧ IsDistinguished p P.δ d := sorry

/-- The identity map of a prism. -/
def Hom.id (P : Prism p A) : P.Hom P where
  toRingHom := RingHom.id A
  isDeltaHom := fun _ => rfl
  map_I := by simp

/-- Composition of maps of prisms. -/
def Hom.comp {B C : Type u} [CommRing B] [CommRing C] {P : Prism p A} {Q : Prism p B}
    {R : Prism p C} (g : Q.Hom R) (f : P.Hom Q) : P.Hom R where
  toRingHom := g.toRingHom.comp f.toRingHom
  isDeltaHom := fun x => by
    show g.toRingHom (f.toRingHom (P.δ.delta x)) = R.δ.delta (g.toRingHom (f.toRingHom x))
    rw [f.isDeltaHom x, g.isDeltaHom (f.toRingHom x)]
  map_I := by
    rw [← Ideal.map_map]
    exact (Ideal.map_mono f.map_I).trans g.map_I

theorem IsCrystalline.isBounded {P : Prism p A} (h : P.IsCrystalline) : P.IsBounded := sorry

theorem IsCrystalline.isOrientable {P : Prism p A} (h : P.IsCrystalline) : P.IsOrientable := sorry

-- prism_ideal_ne_bot
example [Nontrivial A] (P : Prism p A) : P.I ≠ ⊥ := sorry

-- prism_zero_ring
example [Subsingleton A] : Subsingleton (Prism p A) ∧ Nonempty (Prism p A) := sorry

-- prism_ideal_p_implies_torsionfree
example (P : Prism p A) (h : P.IsCrystalline) : (p : A) ∈ nonZeroDivisors A := sorry

-- prism_hom_id_toRingHom
example (P : Prism p A) : (Hom.id P).toRingHom = RingHom.id A := rfl

-- prism_hom_map_phi
example {B : Type u} [CommRing B] {P : Prism p A} {Q : Prism p B} (f : P.Hom Q) (x : A) :
    f.toRingHom (P.φ x) = Q.φ (f.toRingHom x) := sorry

-- prism_bounded_of_torsionfree_quotient
example (P : Prism p A) (h : ∀ x : A ⧸ P.I, (p : A ⧸ P.I) * x = 0 → x = 0) : P.IsBounded := sorry

-- prism_perfect_frobenius_injective
example (P : Prism p A) (h : P.IsPerfect) : Function.Injective P.φ := h.1

/-- Node `PR.0/rigidity-prism-ideal`: `J = I B` for a map of prisms (Bhatt–Scholze Lemma 3.5). -/
theorem Hom.map_I_eq {B : Type u} [CommRing B] {P : Prism p A} {Q : Prism p B} (f : P.Hom Q)
    (hp : (p : B) ∈ Ideal.jacobson (⊥ : Ideal B)) (hJ : Q.I ≤ Ideal.jacobson (⊥ : Ideal B)) :
    P.I.map f.toRingHom = Q.I := sorry

/-- Node `PR.0/perfect-prism-properties`: the ideal of a perfect prism is principal, generated
by a distinguished nonzerodivisor, and the prism is bounded (Bhatt–Scholze Lemma 3.8). -/
theorem IsPerfect.exists_generator {P : Prism p A} (h : P.IsPerfect)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) (hI : P.I ≤ Ideal.jacobson (⊥ : Ideal A)) :
    ∃ d : A, P.I = Ideal.span {d} ∧ IsDistinguished p P.δ d ∧ d ∈ nonZeroDivisors A := sorry

theorem IsPerfect.isBounded {P : Prism p A} (h : P.IsPerfect)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) (hI : P.I ≤ Ideal.jacobson (⊥ : Ideal A))
    (hsep : ∀ a : A, (∀ n : ℕ, a ∈ Ideal.span {(p : A) ^ n}) → a = 0) : P.IsBounded := sorry

/-- Node `PR.0/transversal-prism-regular-sequences` (Anschütz–Le Bras Lemma 2.1.7). -/
theorem regular_frobenius_iterates (P : Prism p A) (d : A) (hd : d ∈ P.I)
    (hdist : IsDistinguished p P.δ d) (hreg : RingTheory.Sequence.IsRegular A [(p : A), d])
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A))
    (hsep : ∀ a : A, (∀ n : ℕ, a ∈ Ideal.span {(p : A) ^ n}) → a = 0)
    (r s : ℕ) (hrs : r ≠ s) :
    RingTheory.Sequence.IsRegular A [(p : A), P.φ^[r] d] ∧
      RingTheory.Sequence.IsRegular A [P.φ^[r] d, P.φ^[s] d] := sorry

/-- Node `PR.0/prism-perfection`: `I · A_perf` is principal. -/
theorem perfection_generator {B : Type u} [CommRing B] (P : Prism p A)
    (F : Delta.Perfection p P.δ B) (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A))
    (hI : P.I ≤ Ideal.jacobson (⊥ : Ideal A)) : ∃ d : B, P.I.map F.ι = Ideal.span {d} := sorry

end Prism

-- prism_p_squared_fails
example : ¬ ∃ P : Prism p ℤ_[p], P.I = Ideal.span {(p : ℤ_[p]) ^ 2} := sorry

/-! ### Nodes `PR.0/crystalline-prism`, `PR.0/ainf-prism`, `PR.0/breuil-kisin-prism`,
`PR.0/q-de-rham-prism`, `PR.0/universal-oriented-prism` -/

namespace Prism

/-- The crystalline prism `(A, (p))` of a δ-ring in which `p` is a nonzerodivisor.
(`p`-adic completeness is the condition supplied by DD.1.) -/
noncomputable def crystalline {A : Type u} [CommRing A] (d : Delta.Structure p A)
    (hp : (p : A) ∈ nonZeroDivisors A) : Prism p A := sorry

theorem crystalline_I {A : Type u} [CommRing A] (d : Delta.Structure p A)
    (hp : (p : A) ∈ nonZeroDivisors A) : (crystalline p d hp).I = Ideal.span {(p : A)} := sorry

theorem crystalline_isCrystalline {A : Type u} [CommRing A] (d : Delta.Structure p A)
    (hp : (p : A) ∈ nonZeroDivisors A) : (crystalline p d hp).IsCrystalline := sorry

/-- The prism `(ℤ_p, (p))`. -/
noncomputable def padicInt : Prism p ℤ_[p] := sorry

/-- The prism `(W(k), (p))` of a perfect ring `k` of characteristic `p`. -/
noncomputable def witt (k : Type u) [CommRing k] [CharP k p] [PerfectRing k p] :
    Prism p (WittVector p k) := sorry

-- crystalline_prism_padic_phi
example : (padicInt p).φ = RingHom.id ℤ_[p] := sorry

-- crystalline_prism_padic_perfect
example : (padicInt p).IsPerfect ∧ (padicInt p).IsBounded := sorry

-- crystalline_prism_witt_phi
example (k : Type u) [CommRing k] [CharP k p] [PerfectRing k p] :
    (witt p k).φ = WittVector.frobenius := sorry

-- crystalline_prism_bar
example : Nat.card (padicInt p).bar = p := sorry

-- perfection_padic
example {B : Type} [CommRing B] (F : Delta.Perfection p (padicInt p).δ B) :
    Function.Bijective F.ι := sorry

section Ainf

variable (O : Type u) [CommRing O] [Fact ¬IsUnit (p : O)]
  [IsAdicComplete (Ideal.span {(p : O)}) O]

/-- The prism `(A_inf(O), ker θ)`, given a distinguished nonzerodivisor generating `ker θ`
(supplied for integral perfectoid `O` by `PerfectoidQuotients:Q0:integral-algebra`). -/
noncomputable def ainf (ξ : WittVector p (PreTilt O p))
    (hker : RingHom.ker (WittVector.fontaineTheta O p) = Ideal.span {ξ})
    (hnzd : ξ ∈ nonZeroDivisors (WittVector p (PreTilt O p)))
    (hdist : IsDistinguished p (Delta.witt p (PreTilt O p)) ξ) :
    Prism p (WittVector p (PreTilt O p)) := sorry

variable (ξ : WittVector p (PreTilt O p))
  (hker : RingHom.ker (WittVector.fontaineTheta O p) = Ideal.span {ξ})
  (hnzd : ξ ∈ nonZeroDivisors (WittVector p (PreTilt O p)))
  (hdist : IsDistinguished p (Delta.witt p (PreTilt O p)) ξ)

theorem ainf_I : (ainf p O ξ hker hnzd hdist).I = RingHom.ker (WittVector.fontaineTheta O p) :=
  sorry

theorem ainf_phi : (ainf p O ξ hker hnzd hdist).φ = WittVector.frobenius := sorry

theorem ainf_isPerfect : (ainf p O ξ hker hnzd hdist).IsPerfect := sorry

/-- `θ` induces `A_inf(O) / ker θ ≃ O` when Frobenius is surjective on `O / p`. -/
noncomputable def ainf_bar_equiv (hF : Function.Surjective (frobenius (ModP O p) p)) :
    (ainf p O ξ hker hnzd hdist).bar ≃+* O := sorry

-- ainf_prism_theta_teichmuller
example (x : PreTilt O p) :
    WittVector.fontaineTheta O p (WittVector.teichmuller p x) = x.untilt :=
  WittVector.fontaineTheta_teichmuller x

-- ainf_prism_kernel_not_p
example (h : (p : O) ≠ 0) : RingHom.ker (WittVector.fontaineTheta O p) ≠
    Ideal.span {(p : WittVector p (PreTilt O p))} := sorry

-- ainf_prism_perfect_bounded
example : (ainf p O ξ hker hnzd hdist).IsBounded := sorry

end Ainf

section BreuilKisin

variable (k : Type u) [Field k] [CharP k p] [PerfectRing k p]

/-- The Breuil–Kisin prism `(W(k)⟦u⟧, (E(u)))`, `φ(u) = u ^ p`, `E` a monic Eisenstein polynomial. -/
noncomputable def breuilKisin (E : Polynomial (WittVector p k)) (hE : E.Monic)
    (hEis : E.IsEisensteinAt (Ideal.span {(p : WittVector p k)})) :
    Prism p (PowerSeries (WittVector p k)) := sorry

variable (E : Polynomial (WittVector p k)) (hE : E.Monic)
  (hEis : E.IsEisensteinAt (Ideal.span {(p : WittVector p k)}))

theorem breuilKisin_I :
    (breuilKisin p k E hE hEis).I = Ideal.span {(E : PowerSeries (WittVector p k))} := sorry

theorem breuilKisin_phi_X :
    (breuilKisin p k E hE hEis).φ PowerSeries.X = PowerSeries.X ^ p := sorry

theorem breuilKisin_isBounded :
    (breuilKisin p k E hE hEis).IsBounded ∧ (breuilKisin p k E hE hEis).IsOrientable := sorry

-- breuil_kisin_not_perfect
example : ¬ (breuilKisin p k E hE hEis).IsPerfect := sorry

-- breuil_kisin_not_crystalline
example (hdeg : 0 < E.natDegree) : ¬ (breuilKisin p k E hE hEis).IsCrystalline := sorry

end BreuilKisin

-- breuil_kisin_linear_reduction
example : Nonempty ((PowerSeries ℤ_[p] ⧸ Ideal.span {(PowerSeries.X - (p : PowerSeries ℤ_[p]))})
    ≃+* ℤ_[p]) := sorry

end Prism

/-- The `q`-analogue `[n]_q = 1 + q + ⋯ + q ^ (n - 1)`. -/
def qAnalog {R : Type*} [CommRing R] (q : R) (n : ℕ) : R := ∑ i ∈ Finset.range n, q ^ i

theorem qAnalog_mul_sub_one {R : Type*} [CommRing R] (q : R) (n : ℕ) :
    (q - 1) * qAnalog q n = q ^ n - 1 := sorry

theorem qAnalog_one_eq {R : Type*} [CommRing R] (n : ℕ) : qAnalog (1 : R) n = n := sorry

namespace Prism

/-- The `q`-de Rham prism `(ℤ_p⟦q - 1⟧, ([p]_q))`; the variable of the power series ring is
`q - 1`, so `q = 1 + X`. -/
noncomputable def qDeRham : Prism p (PowerSeries ℤ_[p]) := sorry

theorem qDeRham_I :
    (qDeRham p).I = Ideal.span {qAnalog (1 + PowerSeries.X : PowerSeries ℤ_[p]) p} := sorry

theorem qDeRham_phi_q :
    (qDeRham p).φ (1 + PowerSeries.X) = (1 + PowerSeries.X : PowerSeries ℤ_[p]) ^ p := sorry

/-- Node `PR.0/universal-oriented-prism`: an oriented prism is a prism with a chosen generator. -/
structure Oriented (A : Type u) [CommRing A] extends Prism p A where
  /-- The orientation. -/
  d : A
  /-- It generates the prism ideal. -/
  span_d : I = Ideal.span {d}

theorem Oriented.isDistinguished {A : Type u} [CommRing A] (O : Oriented p A)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) (hd : O.d ∈ Ideal.jacobson (⊥ : Ideal A)) :
    IsDistinguished p O.δ O.d := sorry

theorem Oriented.generator_mem_nonZeroDivisors {A : Type u} [CommRing A] (O : Oriented p A) :
    O.d ∈ nonZeroDivisors A := sorry

theorem Oriented.isOrientable {A : Type u} [CommRing A] (O : Oriented p A) :
    O.toPrism.IsOrientable := sorry

-- oriented_padic
example : ∃ O : Oriented p ℤ_[p], O.toPrism = padicInt p ∧ O.d = (p : ℤ_[p]) := sorry

-- oriented_generator_unique_up_to_unit
example {A : Type u} [CommRing A] (O O' : Oriented p A) (h : O.toPrism = O'.toPrism) :
    ∃ u : Aˣ, O'.d = u * O.d := sorry

-- oriented_not_unit
example {A : Type u} [CommRing A] [Nontrivial A] (O : Oriented p A)
    (hd : O.d ∈ Ideal.jacobson (⊥ : Ideal A)) : ¬ IsUnit O.d := sorry

end Prism

-- q_analog_two
example {R : Type*} [CommRing R] (q : R) : qAnalog q 2 = 1 + q := sorry

-- q_analog_prime_cyclotomic
example : qAnalog (Polynomial.X : Polynomial ℤ) p = Polynomial.cyclotomic p ℤ := sorry

-- q_de_rham_ideal_not_q_minus_one
example : Ideal.span {qAnalog (1 + PowerSeries.X : PowerSeries ℤ_[p]) p} ≠
    Ideal.span {(PowerSeries.X : PowerSeries ℤ_[p])} := sorry

-- q_de_rham_p_mem
example : (p : PowerSeries ℤ_[p]) ∈ Ideal.span
    {qAnalog (1 + PowerSeries.X : PowerSeries ℤ_[p]) p,
      qAnalog ((1 + PowerSeries.X : PowerSeries ℤ_[p]) ^ p) p} := sorry

/-! ### Node `PR.0/regular-prismatic-envelopes` (before completion) -/

/-- An envelope of the elements `x i` of a δ-ring `B` along `d`: a δ-`B`-algebra `C` in which `d`
is a nonzerodivisor and divides each `x i`, initial among such. For an oriented prism `(A, (d))`
and `B` a δ-`A`-algebra, its derived `(p, d)`-completion (DD.1) is `B{J/I}^∧` with
`J = (d, x i)`. -/
structure Envelope {B : Type u} [CommRing B] (δB : Delta.Structure p B) (d : B) {ι : Type}
    (x : ι → B) (C : Type u) [CommRing C] [Algebra B C] where
  /-- The δ-structure of the envelope. -/
  δ : Delta.Structure p C
  /-- `B → C` is a δ-map. -/
  isDeltaHom : IsDeltaHom p δB δ (algebraMap B C)
  /-- The elements `x i / d`. -/
  z : ι → C
  /-- `d * z i = x i`. -/
  d_mul_z : ∀ i, algebraMap B C d * z i = algebraMap B C (x i)
  /-- `d` is a nonzerodivisor of `C`. -/
  d_mem_nonZeroDivisors : algebraMap B C d ∈ nonZeroDivisors C
  /-- Initiality. -/
  desc : ∀ (C' : Type u) [CommRing C'] [Algebra B C'] (δ' : Delta.Structure p C'),
    IsDeltaHom p δB δ' (algebraMap B C') → algebraMap B C' d ∈ nonZeroDivisors C' →
      (∀ i, ∃ w, algebraMap B C' d * w = algebraMap B C' (x i)) →
        ∃! g : C →ₐ[B] C', IsDeltaHom p δ δ' (g : C →+* C')

namespace Envelope

variable {p} {B : Type u} [CommRing B] {δB : Delta.Structure p B} {d : B} {ι : Type} {x : ι → B}
  {C : Type u} [CommRing C] [Algebra B C]

/-- The map out of an envelope given by its universal property. -/
noncomputable def lift (E : Envelope p δB d x C) {C' : Type u} [CommRing C'] [Algebra B C']
    (δ' : Delta.Structure p C') (h : IsDeltaHom p δB δ' (algebraMap B C'))
    (hd : algebraMap B C' d ∈ nonZeroDivisors C')
    (hx : ∀ i, ∃ w, algebraMap B C' d * w = algebraMap B C' (x i)) : C →ₐ[B] C' :=
  (E.desc C' δ' h hd hx).exists.choose

theorem lift_z (E : Envelope p δB d x C) {C' : Type u} [CommRing C'] [Algebra B C']
    (δ' : Delta.Structure p C') (h : IsDeltaHom p δB δ' (algebraMap B C'))
    (hd : algebraMap B C' d ∈ nonZeroDivisors C')
    (hx : ∀ i, ∃ w, algebraMap B C' d * w = algebraMap B C' (x i)) (i : ι) :
    algebraMap B C' d * E.lift δ' h hd hx (E.z i) = algebraMap B C' (x i) := sorry

theorem hom_ext (E : Envelope p δB d x C) {C' : Type u} [CommRing C'] [Algebra B C']
    (δ' : Delta.Structure p C') (hd : algebraMap B C' d ∈ nonZeroDivisors C')
    (g₁ g₂ : C →ₐ[B] C') (h₁ : IsDeltaHom p E.δ δ' (g₁ : C →+* C'))
    (h₂ : IsDeltaHom p E.δ δ' (g₂ : C →+* C')) : g₁ = g₂ := sorry

theorem unique (E : Envelope p δB d x C) {C' : Type u} [CommRing C'] [Algebra B C']
    (E' : Envelope p δB d x C') : ∃ e : C ≃ₐ[B] C', ∀ i, e (E.z i) = E'.z i := sorry

end Envelope

theorem Envelope.exists {B : Type u} [CommRing B] (δB : Delta.Structure p B) (d : B) {ι : Type}
    (x : ι → B) :
    ∃ (C : Type u) (_ : CommRing C) (_ : Algebra B C), Nonempty (Envelope p δB d x C) := sorry

-- envelope_trivial
example {B : Type u} [CommRing B] (δB : Delta.Structure p B) (d : B)
    (hd : d ∈ nonZeroDivisors B) : Nonempty (Envelope p δB d (Empty.elim : Empty → B) B) := sorry

-- envelope_divisible_element
example {B : Type u} [CommRing B] (δB : Delta.Structure p B) (d y : B)
    (hd : d ∈ nonZeroDivisors B) : Nonempty (Envelope p δB d (fun _ : Unit => d * y) B) := sorry

-- envelope_z_unique
example {B : Type u} [CommRing B] {δB : Delta.Structure p B} {d : B} {ι : Type} {x : ι → B}
    {C : Type u} [CommRing C] [Algebra B C] (E : Envelope p δB d x C) (i : ι) (w : C)
    (hw : algebraMap B C d * w = algebraMap B C (x i)) : w = E.z i := sorry

-- envelope_delta_z
example {B : Type u} [CommRing B] {δB : Delta.Structure p B} {d : B} {ι : Type} {x : ι → B}
    {C : Type u} [CommRing C] [Algebra B C] (E : Envelope p δB d x C) (i : ι) :
    algebraMap B C ((toFrobenius p δB).1 d) * E.δ.delta (E.z i) =
      algebraMap B C (δB.delta (x i)) - E.z i ^ p * algebraMap B C (δB.delta d) := sorry

-- envelope_not_localization
example [Fact (Nat.Prime 2)] (δB : Delta.Structure 2 (Polynomial ℚ))
    (hφ : (toFrobenius 2 δB).1 Polynomial.X = Polynomial.X ^ 2) :
    δB.delta (Polynomial.C (1 / 2 : ℚ) * Polynomial.X) ∉
      Algebra.adjoin ℤ {Polynomial.X, Polynomial.C (1 / 2 : ℚ) * (Polynomial.X : Polynomial ℚ)} :=
  sorry

/-! ### Node `PR.0/unbounded-torsion-example` (uncompleted model) -/

namespace UnboundedTorsion

/-- The relations `p x_{i,j} = f x_{i,j+1}`, `x_{i,j} = 0` for `j > i`, and `x_a x_b = 0`
(the `x_{i,j}` span a square-zero ideal: without the last relations `f` would be a zero
divisor, since `f x_{1,1}^2 = 0`); `f` is the variable `none` and `x_{i,j}` the variable
`some (i, j)`. -/
noncomputable def Rel : Ideal (MvPolynomial (Option (ℕ × ℕ)) ℤ) :=
  Ideal.span ({r | ∃ i j : ℕ, r = (p : MvPolynomial (Option (ℕ × ℕ)) ℤ) * MvPolynomial.X (some (i, j)) -
      MvPolynomial.X none * MvPolynomial.X (some (i, j + 1))} ∪
    {r | ∃ i j : ℕ, i < j ∧ r = MvPolynomial.X (some (i, j))} ∪
    {r | ∃ a b : ℕ × ℕ, r = MvPolynomial.X (some a) * MvPolynomial.X (some b)})

/-- The uncompleted model of the ring of Anschütz–Le Bras, Example A.4. -/
abbrev Ring : Type := MvPolynomial (Option (ℕ × ℕ)) ℤ ⧸ Rel p

theorem p_pow_mul_x (i k : ℕ) (hk : k ≤ i) :
    (Ideal.Quotient.mk (Rel p) ((p : MvPolynomial (Option (ℕ × ℕ)) ℤ) ^ k *
      MvPolynomial.X (some (i, 0))) : Ring p) =
    Ideal.Quotient.mk (Rel p) (MvPolynomial.X none ^ k * MvPolynomial.X (some (i, k))) := sorry

theorem p_pow_succ_mul_x (i : ℕ) :
    (Ideal.Quotient.mk (Rel p) ((p : MvPolynomial (Option (ℕ × ℕ)) ℤ) ^ (i + 1) *
      MvPolynomial.X (some (i, 0))) : Ring p) = 0 := sorry

-- unbounded_torsion_order_two
example : (Ideal.Quotient.mk (Rel p) ((p : MvPolynomial (Option (ℕ × ℕ)) ℤ) ^ 2 *
    MvPolynomial.X (some (1, 0))) : Ring p) = 0 := sorry

-- unbounded_torsion_nonzero
example : (Ideal.Quotient.mk (Rel p) ((p : MvPolynomial (Option (ℕ × ℕ)) ℤ) *
    MvPolynomial.X (some (1, 0))) : Ring p) ≠ 0 := sorry

-- unbounded_torsion_no_bound
example (n : ℕ) : ∃ r : Ring p, (∃ m : ℕ, (p : Ring p) ^ m * r = 0) ∧ (p : Ring p) ^ n * r ≠ 0 :=
  sorry

end UnboundedTorsion

end TauCeti.Prismatic


/-! ## PR.1 Relative sites and the basic comparisons

Suggested signatures for the nodes of stage `PrismaticCohomology:PR.1` (Bhatt–Scholze,
*Prisms and prismatic cohomology*, Corollary 3.12 and §§4–6; Anschütz–Le Bras, Remark 3.1.8 and
Lemma 5.1.6). The roadmap document is definitive; these statements only suggest Lean forms.

Conventions. A prism is the structure `Prism p A` of the shared vocabulary, which does not record
derived `(p, I)`-completeness; statements that need it say so. "`R` is `p`-completely smooth over
`A / I`" is recorded as `SmoothModP`, as far as Mathlib can state it. Derived completed base
change (`DerivedDeRhamCohomology:DD.1`), crystalline cohomology (`CrystallineCohomology:CR.2`) and
the de Rham complex (`DerivedDeRhamCohomology:DD.2`) are not defined here: where a statement needs
one of them it takes it as an explicit argument, named in the docstring. Global statements on the
étale site of a formal scheme (`SchemeAndStackFoundations:SF.2`) are stated in their affine form. -/

namespace TauCeti.Prismatic.Site

open CategoryTheory Opposite TensorProduct TauCeti.Delta

attribute [local instance] HasDerivedCategory.standard

universe u

variable {p : ℕ} [Fact p.Prime]

section Prisms

variable {A B C : Type u} [CommRing A] [CommRing B] [CommRing C]

/-- The ideal `(p, I)` of a prism `(A, I)`. -/
def reductionIdeal (P : Prism p A) : Ideal A := P.I ⊔ Ideal.span {(p : A)}

/-- The identity map of a prism (`Prism.Hom.id` of the shared vocabulary). -/
abbrev homId (P : Prism p A) : P.Hom P := Prism.Hom.id P

/-- Composition of maps of prisms in diagrammatic order (`Prism.Hom.comp`). -/
abbrev homComp {P : Prism p A} {Q : Prism p B} {S : Prism p C} (f : P.Hom Q) (g : Q.Hom S) :
    P.Hom S := Prism.Hom.comp g f

/-- Two maps of prisms with the same underlying ring map are equal. -/
theorem hom_ext {P : Prism p A} {Q : Prism p B} (f g : P.Hom Q)
    (h : f.toRingHom = g.toRingHom) : f = g := by
  cases f; cases g; cases h; rfl

/-- The map `A / I → B / J` induced by a map of prisms `(A, I) → (B, J)`. -/
def barMap {P : Prism p A} {Q : Prism p B} (f : P.Hom Q) : P.bar →+* Q.bar :=
  Ideal.quotientMap Q.I f.toRingHom (Ideal.map_le_iff_le_comap.mp f.map_I)

/-- The reduction `A / (p, I) → B / (p, I)B` of a map of prisms. -/
def reductionMap {P : Prism p A} {Q : Prism p B} (f : P.Hom Q) :
    A ⧸ reductionIdeal P →+* B ⧸ (reductionIdeal P).map f.toRingHom :=
  Ideal.quotientMap _ f.toRingHom Ideal.le_comap_map

/-- Node `PR.1/prismatic-structure-sheaf`: a map of prisms `(B, J) → (C, JC)` is a flat cover
when `C` is `(p, J)`-completely faithfully flat over `B`. Recorded here: the reduction modulo
`(p, J)` is faithfully flat. The vanishing of `Tor_i^B(B / (p, J), C)` for `i > 0`
(`DerivedDeRhamCohomology:DD.1`, complete flatness) is not recorded. -/
def IsFlatCover {P : Prism p A} {Q : Prism p B} (f : P.Hom Q) : Prop :=
  (reductionMap f).FaithfullyFlat

end Prisms

/-! ### The site of all bounded prisms (Bhatt–Scholze, Corollary 3.12) -/

/-- Node `PR.1/prismatic-structure-sheaf`: a bounded prism `(B, J)`, bundled. The category
structure below takes morphisms in the direction of the site: a morphism `(C, K) ⟶ (B, J)` is a
map of prisms `(B, J) → (C, K)`. -/
structure BoundedPrism (p : ℕ) [Fact p.Prime] where
  /-- The underlying ring. -/
  carrier : Type u
  [commRing : CommRing carrier]
  /-- The prism structure. -/
  prism : Prism p carrier
  /-- `B / J` has bounded `p^∞`-torsion. -/
  bounded : prism.IsBounded

attribute [instance] BoundedPrism.commRing

instance : Category (BoundedPrism.{u} p) where
  Hom X Y := Y.prism.Hom X.prism
  id X := homId X.prism
  comp f g := homComp g f
  id_comp _ := hom_ext _ _ (RingHom.id_comp _)
  comp_id _ := hom_ext _ _ (RingHom.comp_id _)
  assoc _ _ _ := hom_ext _ _ (RingHom.comp_assoc _ _ _)

namespace BoundedPrism

/-- The map of prisms underlying a morphism of the site (it goes backwards). -/
def prismHom {X Y : BoundedPrism.{u} p} (f : X ⟶ Y) : Y.prism.Hom X.prism := f

/-- The flat topology on the opposite of the category of bounded prisms: a sieve is covering
when it contains a flat cover. -/
noncomputable def flatTopology (p : ℕ) [Fact p.Prime] :
    GrothendieckTopology (BoundedPrism.{u} p) := sorry

/-- A flat cover generates a covering sieve. -/
theorem generate_mem_flatTopology {X Y : BoundedPrism.{u} p} (f : Y ⟶ X)
    (hf : IsFlatCover (prismHom f)) :
    Sieve.generate (Presieve.singleton f) ∈ flatTopology p X := sorry

/-- The pushout of a flat cover `(A, I) → (B, IB)` along a map `(A, I) → (C, IC)` of bounded
prisms: `D` is the derived `(p, I)`-completion of `B ⊗^L_A C`. In the site it is the fibre
product of `Y` and `Z` over `X`. -/
noncomputable def pushout {X Y Z : BoundedPrism.{u} p} (f : Y ⟶ X) (g : Z ⟶ X) :
    BoundedPrism.{u} p := sorry

/-- The structure presheaf `O : (B, J) ↦ B`. -/
def structurePresheaf (p : ℕ) [Fact p.Prime] : (BoundedPrism.{u} p)ᵒᵖ ⥤ CommRingCat.{u} where
  obj X := CommRingCat.of X.unop.carrier
  map f := CommRingCat.ofHom (prismHom f.unop).toRingHom
  map_id _ := rfl
  map_comp _ _ := rfl

/-- The reduced structure presheaf `Ō : (B, J) ↦ B / J`. -/
def reducedStructurePresheaf (p : ℕ) [Fact p.Prime] :
    (BoundedPrism.{u} p)ᵒᵖ ⥤ CommRingCat.{u} where
  obj X := CommRingCat.of X.unop.prism.bar
  map f := CommRingCat.ofHom (barMap (prismHom f.unop))
  map_id _ := sorry
  map_comp _ _ := sorry

/-- Corollary 3.12: `O` and `Ō` are sheaves for the flat topology. (Uses derived
`(p, I)`-completeness of prisms.) -/
theorem structurePresheaf_isSheaf :
    Presheaf.IsSheaf (flatTopology p) (structurePresheaf.{u} p) ∧
      Presheaf.IsSheaf (flatTopology p) (reducedStructurePresheaf.{u} p) := sorry

/-- The Čech complex `B → B^1 → B^2 → …` of a map `(A, I) → (B, IB)` of bounded prisms, as a
complex of `A`-modules; `B^n` is the completed `(n+1)`-fold tensor power of `B` over `A`. -/
noncomputable def cechComplex {X Y : BoundedPrism.{u} p} (f : Y ⟶ X) :
    CochainComplex (ModuleCat.{u} X.carrier) ℕ := sorry

/-- Corollary 3.12: the Čech complex of a flat cover has no cohomology in positive degrees. -/
theorem cechComplex_exact {X Y : BoundedPrism.{u} p} (f : Y ⟶ X)
    (hf : IsFlatCover (prismHom f)) (n : ℕ) (hn : 0 < n) :
    Limits.IsZero ((cechComplex f).homology n) := sorry

end BoundedPrism

-- pr1_structure_presheaf_obj
example (X : BoundedPrism.{u} p) :
    (BoundedPrism.structurePresheaf p).obj (op X) = CommRingCat.of X.carrier ∧
      (BoundedPrism.reducedStructurePresheaf p).obj (op X) =
        CommRingCat.of (X.carrier ⧸ X.prism.I) := sorry

-- pr1_flat_cover_id
example (X : BoundedPrism.{u} p) : IsFlatCover (BoundedPrism.prismHom (𝟙 X)) := sorry

-- pr1_flat_cover_base_change
example {X Y Z : BoundedPrism.{u} p} (f : Y ⟶ X) (g : Z ⟶ X)
    (hf : IsFlatCover (BoundedPrism.prismHom f)) :
    ∃ q : BoundedPrism.pushout f g ⟶ Z, IsFlatCover (BoundedPrism.prismHom q) := sorry

-- pr1_non_flat_not_cover
example {X Y : BoundedPrism.{u} p} (f : Y ⟶ X)
    (h : ¬ (reductionMap (BoundedPrism.prismHom f)).Flat) :
    ¬ IsFlatCover (BoundedPrism.prismHom f) := sorry

/-! ### The relative prismatic site (Bhatt–Scholze, Definition 4.1, Remark 4.3) -/

section Relative

variable {A : Type u} [CommRing A]

/-- Node `PR.1/relative-prismatic-site`: an object of `(R/A)_Δ`, a bounded prism `(B, J)` with a
map of prisms `(A, I) → (B, J)` and a ring map `R → B / J` over `A / I`. -/
structure RelativePrism (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] where
  /-- The bounded prism `(B, J)`. -/
  toBoundedPrism : BoundedPrism.{u} p
  /-- The map of prisms `(A, I) → (B, J)`. -/
  structureMap : P.Hom toBoundedPrism.prism
  /-- The map `R → B / J`. -/
  point : R →+* toBoundedPrism.prism.bar
  /-- It is a map of `A / I`-algebras. -/
  point_comp : point.comp (algebraMap P.bar R) = barMap structureMap

namespace RelativePrism

variable {P : Prism p A} {R : Type u} [CommRing R] [Algebra P.bar R]

/-- A morphism `X ⟶ Y` of the site `(R/A)_Δ`: a map of prisms from the prism of `Y` to the prism
of `X`, compatible with the maps from `(A, I)` and from `R`. -/
structure Hom (X Y : RelativePrism P R) where
  /-- The underlying morphism of bounded prisms. -/
  toHom : X.toBoundedPrism ⟶ Y.toBoundedPrism
  /-- Compatibility with the maps from `(A, I)`. -/
  comp_structureMap :
    (BoundedPrism.prismHom toHom).toRingHom.comp Y.structureMap.toRingHom =
      X.structureMap.toRingHom
  /-- Compatibility with the maps from `R`. -/
  comp_point : (barMap (BoundedPrism.prismHom toHom)).comp Y.point = X.point

theorem Hom.ext' {X Y : RelativePrism P R} (f g : Hom X Y) (h : f.toHom = g.toHom) : f = g := by
  cases f; cases g; cases h; rfl

instance : Category (RelativePrism P R) where
  Hom X Y := RelativePrism.Hom X Y
  id X := ⟨𝟙 _, sorry, sorry⟩
  comp f g := ⟨f.toHom ≫ g.toHom, sorry, sorry⟩
  id_comp _ := Hom.ext' _ _ (Category.id_comp _)
  comp_id _ := Hom.ext' _ _ (Category.comp_id _)
  assoc _ _ _ := Hom.ext' _ _ (Category.assoc _ _ _)

/-- Rigidity (Bhatt–Scholze, Lemma 3.5): the prism ideal of an object is `IB`. Completeness of
both prisms, which the structure `Prism` does not record, is assumed in its classical
`(p, I)`-adic form (valid for bounded prisms). -/
theorem ideal_eq_map [IsAdicComplete (reductionIdeal P) A] (X : RelativePrism P R)
    [IsAdicComplete (reductionIdeal X.toBoundedPrism.prism) X.toBoundedPrism.carrier] :
    X.toBoundedPrism.prism.I = P.I.map X.structureMap.toRingHom := sorry

/-- The forgetful functor to the site of all bounded prisms (Remark 4.3). -/
def forget (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] :
    RelativePrism P R ⥤ BoundedPrism.{u} p where
  obj X := X.toBoundedPrism
  map f := f.toHom
  map_id _ := rfl
  map_comp _ _ := rfl

/-- The flat topology on `(R/A)_Δ`. -/
noncomputable def flatTopology (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] :
    GrothendieckTopology (RelativePrism P R) := sorry

/-- A morphism whose underlying map of prisms is a flat cover generates a covering sieve. -/
theorem generate_mem_flatTopology {X Y : RelativePrism P R} (f : Y ⟶ X)
    (hf : IsFlatCover (BoundedPrism.prismHom ((forget P R).map f))) :
    Sieve.generate (Presieve.singleton f) ∈ flatTopology P R X := sorry

/-- The structure sheaf `O_Δ : (B, g, f) ↦ B`. -/
def structureSheaf (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] :
    (RelativePrism P R)ᵒᵖ ⥤ CommRingCat.{u} :=
  (forget P R).op ⋙ BoundedPrism.structurePresheaf p

/-- The reduced structure sheaf `Ō_Δ : (B, g, f) ↦ B / IB`. -/
def reducedStructureSheaf (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] :
    (RelativePrism P R)ᵒᵖ ⥤ CommRingCat.{u} :=
  (forget P R).op ⋙ BoundedPrism.reducedStructurePresheaf p

/-- `O_Δ` and `Ō_Δ` are sheaves on `(R/A)_Δ` (Definition 4.1). -/
theorem structureSheaf_isSheaf (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] :
    Presheaf.IsSheaf (flatTopology P R) (structureSheaf P R) ∧
      Presheaf.IsSheaf (flatTopology P R) (reducedStructureSheaf P R) := sorry

/-- Restriction along a map `R → S` of `A / I`-algebras: `(B, S → B / IB) ↦ (B, R → S → B / IB)`. -/
noncomputable def restrict {S : Type u} [CommRing S] [Algebra P.bar S] (g : R →ₐ[P.bar] S) :
    RelativePrism P S ⥤ RelativePrism P R := sorry

/-- Restriction does not change the underlying bounded prism. -/
theorem restrict_obj_toBoundedPrism {S : Type u} [CommRing S] [Algebra P.bar S]
    (g : R →ₐ[P.bar] S) (X : RelativePrism P S) :
    ((restrict g).obj X).toBoundedPrism = X.toBoundedPrism := sorry

/-- For `R = A / I`: the object `(A, id, id)`. -/
def base (P : Prism p A) (hb : P.IsBounded) : RelativePrism P P.bar where
  toBoundedPrism := { carrier := A, prism := P, bounded := hb }
  structureMap := homId P
  point := RingHom.id _
  point_comp := sorry

end RelativePrism

-- pr1_relative_site_base_terminal
example (P : Prism p A) (hb : P.IsBounded) :
    Nonempty (Limits.IsTerminal (RelativePrism.base P hb)) := sorry

-- pr1_relative_site_sheaf_obj
example (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] (X : RelativePrism P R) :
    (RelativePrism.structureSheaf P R).obj (op X) = CommRingCat.of X.toBoundedPrism.carrier ∧
      (RelativePrism.reducedStructureSheaf P R).obj (op X) =
        CommRingCat.of X.toBoundedPrism.prism.bar := sorry

-- pr1_relative_site_ideal_rigid
example (P : Prism p A) [IsAdicComplete (reductionIdeal P) A] {B : Type u} [CommRing B]
    (Q : Prism p B) [IsAdicComplete (reductionIdeal Q) B] (f : P.Hom Q) :
    Q.I = P.I.map f.toRingHom := sorry

-- pr1_relative_site_restrict_id
example (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] :
    Nonempty (RelativePrism.restrict (AlgHom.id P.bar R) ≅ 𝟭 (RelativePrism P R)) := sorry

end Relative

/-! ### Prismatic cohomology, Čech–Alexander complexes and the Frobenius -/

/-- What Mathlib can state today of "`R` is a `p`-completely smooth `k`-algebra" (`k = A / I`):
`R` is `p`-adically complete and its reduction modulo `p` is smooth over `k / p`. The vanishing
of `Tor_i^k(R, k / p)` for `i > 0`, part of complete smoothness
(`DerivedDeRhamCohomology:DD.1`), is not recorded. -/
structure SmoothModP (p : ℕ) (k R : Type u) [CommRing k] [CommRing R] [Algebra k R] : Prop where
  /-- `R` is `p`-adically complete. -/
  complete : IsAdicComplete (Ideal.span {(p : R)}) R
  /-- `R / p` is smooth over `k / p`. -/
  smooth : Algebra.Smooth (k ⧸ Ideal.span {(p : k)}) ((k ⧸ Ideal.span {(p : k)}) ⊗[k] R)

section Cohomology

variable {A : Type u} [CommRing A] (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R]

/-- Node `PR.1/relative-prismatic-cohomology`: evaluation `Δ_{R/A} → B` at an object of
`(R/A)_Δ`, in `D(A)`. -/
noncomputable def cohomologyEval (X : RelativePrism P R) :
    prismaticCohomology P R ⟶ (DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj
      ((ModuleCat.restrictScalars X.structureMap.toRingHom).obj
        (ModuleCat.of X.toBoundedPrism.carrier X.toBoundedPrism.carrier)) := sorry

/-- The unit `A → Δ_{R/A}`. -/
noncomputable def cohomologyUnit :
    (DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A A) ⟶
      prismaticCohomology P R := sorry

variable {R} in
/-- Functoriality in `R`. -/
noncomputable def cohomologyMap {S : Type u} [CommRing S] [Algebra P.bar S] (g : R →ₐ[P.bar] S) :
    prismaticCohomology P R ⟶ prismaticCohomology P S := sorry

theorem cohomologyMap_id : cohomologyMap P (AlgHom.id P.bar R) = 𝟙 _ := sorry

variable {R} in
theorem cohomologyMap_comp {S T : Type u} [CommRing S] [Algebra P.bar S] [CommRing T]
    [Algebra P.bar T] (g : R →ₐ[P.bar] S) (h : S →ₐ[P.bar] T) :
    cohomologyMap P (h.comp g) = cohomologyMap P g ≫ cohomologyMap P h := sorry

/-- Functoriality in the prism: for a map of prisms `f : (A, I) → (B, IB)`, a `B / IB`-algebra
`R'` and a compatible ring map `R → R'`, the map `Δ_{R/A} → f_* Δ_{R'/B}` in `D(A)`. -/
noncomputable def cohomologyBaseChangeMap {B : Type u} [CommRing B] {Q : Prism p B} (f : P.Hom Q)
    (R' : Type u) [CommRing R'] [Algebra Q.bar R'] (g : R →+* R')
    (hg : g.comp (algebraMap P.bar R) = (algebraMap Q.bar R').comp (barMap f)) :
    prismaticCohomology P R ⟶
      (ModuleCat.restrictScalars f.toRingHom).mapDerivedCategory.obj
        (prismaticCohomology Q R') := sorry

/-- `Δ_{R/A}` is concentrated in degrees `≥ 0` for `R` smooth. -/
theorem cohomology_isZero_of_neg (hb : P.IsBounded) (hR : SmoothModP p P.bar R) (i : ℤ)
    (hi : i < 0) :
    Limits.IsZero ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).obj
      (prismaticCohomology P R)) := sorry

-- pr1_cohomology_base
example (hb : P.IsBounded) : IsIso (cohomologyUnit P P.bar) := sorry

-- pr1_cohomology_unit_natural
example {S : Type u} [CommRing S] [Algebra P.bar S] (g : R →ₐ[P.bar] S) :
    cohomologyUnit P R ≫ cohomologyMap P g = cohomologyUnit P S := sorry

-- pr1_cohomology_base_degrees
example (hb : P.IsBounded) (i : ℤ) (hi : i ≠ 0) :
    Limits.IsZero ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) i).obj
      (prismaticCohomology P P.bar)) := sorry

-- pr1_cohomology_not_discrete
example (hb : P.IsBounded) (hR : SmoothModP p P.bar R)
    [Nontrivial (KaehlerDifferential P.bar R)] :
    ¬ Limits.IsZero ((DerivedCategory.homologyFunctor (ModuleCat.{u} R) 1).obj
      (hodgeTateCohomology P R)) := sorry

/-! #### Weakly initial objects and Čech–Alexander complexes (Constructions 4.17–4.18) -/

/-- Node `PR.1/cech-alexander-complex`: the weakly initial object attached to a family
`g : σ → R` generating `R`: with `B₀` the completed polynomial `A`-algebra on `σ` and
`B = Free_δ(B₀)^∧`, it is the prismatic envelope of `(B, ker(B → R'))`. -/
noncomputable def weaklyInitial {σ : Type u} (g : σ → R) : RelativePrism P R := sorry

/-- Construction 4.17: the object is weakly initial in the algebraic language, so in the site
every object maps to it. Surjectivity of the uncompleted polynomial algebra is a sufficient form
of the hypothesis "the completed polynomial algebra surjects onto `R`". -/
theorem weaklyInitial_hom_nonempty (hb : P.IsBounded) (hR : SmoothModP p P.bar R) {σ : Type u}
    (g : σ → R)
    (hg : Function.Surjective (MvPolynomial.aeval g : MvPolynomial σ P.bar →ₐ[P.bar] R))
    (X : RelativePrism P R) : Nonempty (X ⟶ weaklyInitial P R g) := sorry

/-- The envelope is `(p, I)`-completely flat over `A`; recorded: its reduction modulo `(p, I)`
is flat. -/
theorem weaklyInitial_flat (hb : P.IsBounded) (hR : SmoothModP p P.bar R) {σ : Type u}
    (g : σ → R)
    (hg : Function.Surjective (MvPolynomial.aeval g : MvPolynomial σ P.bar →ₐ[P.bar] R)) :
    (reductionMap (weaklyInitial P R g).structureMap).Flat := sorry

/-- The Čech–Alexander cosimplicial ring `C^•` of a presentation. -/
noncomputable def cechAlexander (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R]
    {σ : Type u} (g : σ → R) : CosimplicialObject CommRingCat.{u} := sorry

/-- `C^0` is the ring of the weakly initial object. -/
noncomputable def cechAlexander_obj_zero {σ : Type u} (g : σ → R) :
    (cechAlexander P R g).obj (SimplexCategory.mk 0) ≅
      CommRingCat.of (weaklyInitial P R g).toBoundedPrism.carrier := sorry

/-- The cochain complex of `A`-modules of `C^•` (alternating sums of cofaces), placed in degrees
`≥ 0` of a `ℤ`-indexed complex. -/
noncomputable def cechAlexanderComplex (P : Prism p A) (R : Type u) [CommRing R]
    [Algebra P.bar R] {σ : Type u} (g : σ → R) : CochainComplex (ModuleCat.{u} A) ℤ := sorry

/-- The comparison map of Čech–Alexander cosimplicial rings along a map of prisms and the
base-changed presentation. After termwise `(p, I)`-completed base change
(`DerivedDeRhamCohomology:DD.1`) it is an isomorphism (Lemma 4.20, proof). -/
noncomputable def cechAlexander_baseChange {B : Type u} [CommRing B] {Q : Prism p B}
    (f : P.Hom Q) (R' : Type u) [CommRing R'] [Algebra Q.bar R'] (h : R →+* R') {σ : Type u}
    (g : σ → R) : cechAlexander P R g ⟶ cechAlexander Q R' (fun s => h (g s)) := sorry

/-- Node `PR.1/cech-alexander-computes-cohomology` (Construction 4.18): the Čech–Alexander
complex computes `Δ_{R/A}`. -/
theorem cechAlexander_computes (hb : P.IsBounded) (hR : SmoothModP p P.bar R) {σ : Type u}
    (g : σ → R)
    (hg : Function.Surjective (MvPolynomial.aeval g : MvPolynomial σ P.bar →ₐ[P.bar] R)) :
    Nonempty (prismaticCohomology P R ≅ DerivedCategory.Q.obj (cechAlexanderComplex P R g)) :=
  sorry

-- pr1_cech_alexander_base
example (hb : P.IsBounded) :
    Nonempty (weaklyInitial P P.bar (PEmpty.elim : PEmpty.{u + 1} → P.bar) ≅
      RelativePrism.base P hb) := sorry

-- pr1_cech_alexander_affine_line
-- `R` is characterised as the `p`-completed polynomial ring `A / I⟨x⟩` by its universal
-- property; the statement says that `C^0` is the completed free δ-`A`-algebra on one generator.
example (hb : P.IsBounded) (x : R)
    (hx : ∀ (B : Type u) [CommRing B] [Algebra P.bar B]
      [IsAdicComplete (Ideal.span {(p : B)}) B] (b : B), ∃! φ : R →ₐ[P.bar] B, φ x = b)
    (Y : RelativePrism P P.bar) :
    Nonempty ((Y ⟶ (RelativePrism.restrict (Algebra.ofId P.bar R)).obj
      (weaklyInitial P R (fun _ : PUnit.{u + 1} => x))) ≃ Y.toBoundedPrism.carrier) := sorry

-- pr1_weakly_initial_not_initial
example (hb : P.IsBounded) (hR : SmoothModP p P.bar R) {σ : Type u} (g : σ → R)
    (hg : Function.Surjective (MvPolynomial.aeval g : MvPolynomial σ P.bar →ₐ[P.bar] R))
    [Nontrivial (KaehlerDifferential P.bar R)] :
    (cechAlexander P R g).δ (n := 0) 0 ≠ (cechAlexander P R g).δ (n := 0) 1 := sorry

/-! #### The Frobenius -/

/-- Node `PR.1/frobenius-on-prismatic-cohomology`: the Frobenius endomorphism of the presheaf of
rings `O_Δ`. -/
noncomputable def RelativePrism.sheafFrobenius :
    RelativePrism.structureSheaf P R ⟶ RelativePrism.structureSheaf P R where
  app X := CommRingCat.ofHom X.unop.toBoundedPrism.prism.φ
  naturality := sorry

variable {P R} in
/-- The Frobenius of `O_Δ` is `φ_A`-semilinear. -/
theorem RelativePrism.sheafFrobenius_structureMap (X : RelativePrism P R) (a : A) :
    X.toBoundedPrism.prism.φ (X.structureMap.toRingHom a) =
      X.structureMap.toRingHom (P.φ a) := sorry

variable {R} in
/-- The Frobenius of `Δ_{R/A}` is natural in `R`. -/
theorem frobenius_naturality {S : Type u} [CommRing S] [Algebra P.bar S] (g : R →ₐ[P.bar] S) :
    cohomologyMap P g ≫ prismaticFrobenius P S =
      prismaticFrobenius P R ≫ (frobeniusPushforward P).map (cohomologyMap P g) := sorry

/-- The linearisation `φ_A^* Δ_{R/A} → Δ_{R/A}`. The derived pullback `φ_A^*` and its adjunction
with `φ_{A,*}` are data of `DerivedDeRhamCohomology:DD.1` and are taken as arguments. -/
noncomputable def frobeniusLinearization
    (phiPullback : DerivedCategory (ModuleCat.{u} A) ⥤ DerivedCategory (ModuleCat.{u} A))
    (adj : phiPullback ⊣ frobeniusPushforward P) :
    phiPullback.obj (prismaticCohomology P R) ⟶ prismaticCohomology P R :=
  (adj.homEquiv _ _).symm (prismaticFrobenius P R)

-- pr1_frobenius_sheaf_component
example (X : RelativePrism P R) (x : X.toBoundedPrism.carrier) :
    X.toBoundedPrism.prism.φ x = x ^ p + p * X.toBoundedPrism.prism.δ.delta x := sorry

-- pr1_frobenius_trivial_base
example (h : P.φ = RingHom.id A) : Nonempty (frobeniusPushforward P ≅ 𝟭 _) := sorry

-- pr1_frobenius_not_linear
example (X : RelativePrism P R) (a : A) (ha : P.φ a ≠ a)
    (hinj : Function.Injective X.structureMap.toRingHom) :
    X.toBoundedPrism.prism.φ (X.structureMap.toRingHom a) ≠ X.structureMap.toRingHom a := sorry

/-! #### Base change, torsion and perfect prisms -/

/-- Nodes `PR.1/base-change-finite-tor-amplitude` and `PR.1/prismatic-base-change`
(Lemma 4.20, Corollary 4.12): `Δ_{R/A} ⊗̂^L_A B ≃ Δ_{R'/B}` for a map of bounded prisms and `R'`
the `p`-completed base change of `R`. The completed base change functor `cbc` is data of
`DerivedDeRhamCohomology:DD.1` and is taken as an argument. Lemma 4.20 is the same statement
under the hypothesis that `A → B` has finite `(p, I)`-complete Tor amplitude. -/
theorem prismaticCohomology_baseChange {B : Type u} [CommRing B] {Q : Prism p B} (f : P.Hom Q)
    (hP : P.IsBounded) (hQ : Q.IsBounded) (hR : SmoothModP p P.bar R)
    [Algebra P.bar Q.bar] (hf : algebraMap P.bar Q.bar = barMap f)
    (R' : Type u) [CommRing R'] [Algebra Q.bar R']
    (e : AdicCompletion (Ideal.span {(p : Q.bar ⊗[P.bar] R)}) (Q.bar ⊗[P.bar] R) ≃+* R')
    (cbc : DerivedCategory (ModuleCat.{u} A) ⥤ DerivedCategory (ModuleCat.{u} B)) :
    Nonempty (cbc.obj (prismaticCohomology P R) ≅ prismaticCohomology Q R') := sorry

/-- Node `PR.1/p-torsion-free-h0-syntomic` (Anschütz–Le Bras, Lemma 5.1.6), stated here for
`R` smooth; the source allows `p`-completely syntomic `R`. -/
theorem zeroth_cohomology_pTorsionFree (hb : P.IsBounded) (hA : ∀ a : A, (p : A) * a = 0 → a = 0)
    (hR : SmoothModP p P.bar R)
    (x : (DerivedCategory.homologyFunctor (ModuleCat.{u} A) 0).obj (prismaticCohomology P R))
    (hx : (p : A) • x = 0) : x = 0 := sorry

/-- Node `PR.1/perfect-prism-initial` (Lemma 4.8): a ring map `A / I → B / J` out of the
reduction of a perfect prism lifts uniquely to a map of prisms. (Uses derived completeness.) -/
theorem perfectPrism_hom_existsUnique (hperf : P.IsPerfect) {B : Type u} [CommRing B]
    (Q : Prism p B) (g : P.bar →+* Q.bar) : ∃! f : P.Hom Q, barMap f = g := sorry

end Cohomology

end TauCeti.Prismatic.Site

/-! ### Hodge–Tate cohomology, the Bockstein and the Hodge–Tate comparison -/

namespace TauCeti.Prismatic.HodgeTate

open CategoryTheory Opposite TensorProduct TauCeti.Delta TauCeti.Prismatic.Site

attribute [local instance] HasDerivedCategory.standard

universe u

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] (P : Prism p A)
  (R : Type u) [CommRing R] [Algebra P.bar R]

/-- Node `PR.1/hodge-tate-cohomology`: the invertible `R`-module `R{i} = R ⊗_{A/I} (I/I²)^{⊗ i}`.
For an `R`-module `M`, `M{i} = M ⊗_R R{i}` and `M{-i} = M ⊗_R Hom_R(R{i}, R)`. -/
abbrev Twist (i : ℕ) : Type u := R ⊗[P.bar] (⨂[P.bar]^i P.I.Cotangent)

/-- `R{0} ≅ R`. -/
noncomputable def twistZero : Twist P R 0 ≃ₗ[R] R := sorry

/-- `R{i + j} ≅ R{i} ⊗_R R{j}`. -/
noncomputable def twistAdd (i j : ℕ) : Twist P R (i + j) ≃ₗ[R] Twist P R i ⊗[R] Twist P R j :=
  sorry

/-- A generator `d` of `I` trivialises the twists. -/
noncomputable def twistOfOrientation (d : A) (hd : P.I = Ideal.span {d}) (i : ℕ) :
    Twist P R i ≃ₗ[R] R := sorry

/-- The reduction `Δ_{R/A} → Δ̄_{R/A}`, in `D(A)`. -/
noncomputable def reduction :
    prismaticCohomology P R ⟶
      (ModuleCat.restrictScalars ((algebraMap P.bar R).comp (Ideal.Quotient.mk P.I))).mapDerivedCategory.obj
        (hodgeTateCohomology P R) := sorry

/-- The structure map `R → Δ̄_{R/A}`. -/
noncomputable def structureMap :
    (DerivedCategory.singleFunctor (ModuleCat.{u} R) 0).obj (ModuleCat.of R R) ⟶
      hodgeTateCohomology P R := sorry

variable {R} in
/-- Functoriality of `Δ̄` in `R`. -/
noncomputable def cohomologyMap {S : Type u} [CommRing S] [Algebra P.bar S] (g : R →ₐ[P.bar] S) :
    hodgeTateCohomology P R ⟶
      (ModuleCat.restrictScalars g.toRingHom).mapDerivedCategory.obj (hodgeTateCohomology P S) :=
  sorry

-- pr1_twist_zero
example : Nonempty (Twist P R 0 ≃ₗ[R] R) := sorry

-- pr1_twist_oriented
example (h : P.IsOrientable) (i : ℕ) : Nonempty (Twist P R i ≃ₗ[R] R) := sorry

-- pr1_hodge_tate_base
example (hb : P.IsBounded) : IsIso (structureMap P P.bar) := sorry

-- pr1_hodge_tate_not_discrete
example (hb : P.IsBounded) (hR : SmoothModP p P.bar R) [Nontrivial (KaehlerDifferential P.bar R)] :
    ¬ Limits.IsZero ((DerivedCategory.homologyFunctor (ModuleCat.{u} R) 1).obj
      (hodgeTateCohomology P R)) := sorry

/-- Node `PR.1/etale-localization` (Lemma 4.21): `Δ̄_{R/A} ⊗̂^L_R S ≃ Δ̄_{S/A}` for a
`p`-completely étale map `R → S`. The `p`-completed base change functor `cbc` is data of
`DerivedDeRhamCohomology:DD.1` and is taken as an argument. -/
theorem etaleLocalization (hb : P.IsBounded) (hR : SmoothModP p P.bar R) (S : Type u) [CommRing S]
    [Algebra P.bar S] [Algebra R S] [IsScalarTower P.bar R S]
    [IsAdicComplete (Ideal.span {(p : S)}) S]
    (het : Algebra.Etale (R ⧸ Ideal.span {(p : R)}) ((R ⧸ Ideal.span {(p : R)}) ⊗[R] S))
    (cbc : DerivedCategory (ModuleCat.{u} R) ⥤ DerivedCategory (ModuleCat.{u} S)) :
    Nonempty (cbc.obj (hodgeTateCohomology P R) ≅ hodgeTateCohomology P S) := sorry

/-! #### The Bockstein differential (Construction 4.9) -/

/-- The `R`-module `H^i(Δ̄_{R/A})`. -/
noncomputable abbrev cohomologyModule (i : ℤ) : ModuleCat.{u} R :=
  (DerivedCategory.homologyFunctor (ModuleCat.{u} R) i).obj (hodgeTateCohomology P R)

/-- Node `PR.1/bockstein-differential`: `H^i(Δ̄_{R/A}){i}`. -/
noncomputable abbrev twistedCohomology (i : ℕ) : Type u :=
  cohomologyModule P R (i : ℤ) ⊗[R] Twist P R i

/-- Transport along an equality of degrees. -/
noncomputable def degreeCast {m n : ℕ} (h : m = n) :
    twistedCohomology P R m →+ twistedCohomology P R n := by
  subst h; exact AddMonoidHom.id _

/-- The Bockstein differential `β_I`; it is `A / I`-linear, not `R`-linear. -/
noncomputable def bockstein (i : ℕ) : twistedCohomology P R i →+ twistedCohomology P R (i + 1) :=
  sorry

theorem bockstein_comp_bockstein (i : ℕ) :
    (bockstein P R (i + 1)).comp (bockstein P R i) = 0 := sorry

/-- The cup product on twisted Hodge–Tate cohomology. -/
noncomputable def cup (i j : ℕ) :
    twistedCohomology P R i →ₗ[R] twistedCohomology P R j →ₗ[R] twistedCohomology P R (i + j) :=
  sorry

/-- `β_I` is a graded derivation. -/
theorem bockstein_cup (i j : ℕ) (x : twistedCohomology P R i) (y : twistedCohomology P R j) :
    bockstein P R (i + j) (cup P R i j x y) =
      degreeCast P R (Nat.add_right_comm i 1 j) (cup P R (i + 1) j (bockstein P R i x) y) +
        (-1 : R) ^ i •
          degreeCast P R (Nat.add_assoc i j 1).symm (cup P R i (j + 1) x (bockstein P R j y)) :=
  sorry

/-- `η^0 : R → H^0(Δ̄_{R/A})`. -/
noncomputable def eta0 : R →ₗ[R] twistedCohomology P R 0 := sorry

/-- `η^1 : Ω^1_{R/(A/I)} → H^1(Δ̄_{R/A}){1}`, `f dg ↦ f β_I(g)`. -/
noncomputable def eta1 : KaehlerDifferential P.bar R →ₗ[R] twistedCohomology P R 1 := sorry

-- pr1_bockstein_eta1_d
example (g : R) :
    eta1 P R (KaehlerDifferential.D P.bar R g) = bockstein P R 0 (eta0 P R g) := sorry

-- pr1_bockstein_base_zero
example (hb : P.IsBounded) : bockstein P P.bar 0 = 0 := sorry

-- pr1_bockstein_not_linear
example (hb : P.IsBounded) (hR : SmoothModP p P.bar R) (g : R)
    (hg : KaehlerDifferential.D P.bar R g ≠ 0) : bockstein P R 0 (eta0 P R g) ≠ 0 := sorry

/-! #### The Hodge–Tate comparison map and theorem -/

/-- Node `PR.1/hodge-tate-comparison-map`: `η^i : Ω^i_{R/(A/I)} → H^i(Δ̄_{R/A}){i}`. -/
noncomputable def comparisonMap (i : ℕ) :
    ⋀[R]^i (KaehlerDifferential P.bar R) →ₗ[R] twistedCohomology P R i := sorry

theorem comparisonMap_one (g : R) :
    comparisonMap P R 1 (exteriorPower.ιMulti R 1 (fun _ => KaehlerDifferential.D P.bar R g)) =
      bockstein P R 0 (eta0 P R g) := sorry

theorem comparisonMap_wedge (i j : ℕ) (v : Fin i → KaehlerDifferential P.bar R)
    (w : Fin j → KaehlerDifferential P.bar R) :
    comparisonMap P R (i + j) (exteriorPower.ιMulti R (i + j) (Fin.append v w)) =
      cup P R i j (comparisonMap P R i (exteriorPower.ιMulti R i v))
        (comparisonMap P R j (exteriorPower.ιMulti R j w)) := sorry

/-- Compatibility with the de Rham differential, on generators:
`β_I(η^i(f₀ df₁ ∧ … ∧ df_i)) = η^{i+1}(df₀ ∧ df₁ ∧ … ∧ df_i)`. -/
theorem comparisonMap_d (i : ℕ) (f₀ : R) (f : Fin i → R) :
    bockstein P R i (comparisonMap P R i
        (f₀ • exteriorPower.ιMulti R i (fun k => KaehlerDifferential.D P.bar R (f k)))) =
      comparisonMap P R (i + 1) (exteriorPower.ιMulti R (i + 1)
        (Fin.cons (KaehlerDifferential.D P.bar R f₀)
          (fun k => KaehlerDifferential.D P.bar R (f k)) : Fin (i + 1) → KaehlerDifferential P.bar R)) :=
  sorry

/-- Lemma 4.10: `β_I(f)² = 0`. -/
theorem bockstein_eta0_cup_self (hb : P.IsBounded) (hR : SmoothModP p P.bar R) (f : R) :
    cup P R 1 1 (bockstein P R 0 (eta0 P R f)) (bockstein P R 0 (eta0 P R f)) = 0 := sorry

-- pr1_comparison_map_one_formula
example (f g : R) :
    comparisonMap P R 1
        (f • exteriorPower.ιMulti R 1 (fun _ => KaehlerDifferential.D P.bar R g)) =
      f • bockstein P R 0 (eta0 P R g) := sorry

-- pr1_comparison_map_base
example (hb : P.IsBounded) : Function.Bijective (comparisonMap P P.bar 0) := sorry

-- pr1_comparison_map_square_zero
example (hb : P.IsBounded) (hR : SmoothModP p P.bar R) (g : R) :
    comparisonMap P R 2 (exteriorPower.ιMulti R 2 (fun _ => KaehlerDifferential.D P.bar R g)) =
      cup P R 1 1 (bockstein P R 0 (eta0 P R g)) (bockstein P R 0 (eta0 P R g)) := sorry

/-- Node `PR.1/hodge-tate-comparison-char-p` (Corollary 5.5): the Hodge–Tate comparison over a
crystalline prism; its proof is the crystalline comparison and the Cartier isomorphism
(`DerivedDeRhamCohomology:DD.3/polynomial-cartier-map`). -/
theorem comparison_bijective_of_isCrystalline (hc : P.IsCrystalline) (hb : P.IsBounded)
    (hR : SmoothModP p P.bar R) (i : ℕ) : Function.Bijective (comparisonMap P R i) := sorry

/-- Node `PR.1/hodge-tate-affine-line` (Proposition 6.2): for `R = A / I⟨x⟩`, characterised by
its universal property among `p`-complete `A / I`-algebras, `η^0` and `η^1` are bijective and
`H^i(Δ̄_{R/A}) = 0` for `i > 1`. -/
theorem affineLine (hb : P.IsBounded) (x : R) [IsAdicComplete (Ideal.span {(p : R)}) R]
    (hx : ∀ (B : Type u) [CommRing B] [Algebra P.bar B]
      [IsAdicComplete (Ideal.span {(p : B)}) B] (b : B), ∃! φ : R →ₐ[P.bar] B, φ x = b) :
    Function.Bijective (eta0 P R) ∧ Function.Bijective (eta1 P R) ∧
      ∀ i : ℤ, 1 < i → Limits.IsZero (cohomologyModule P R i) := sorry

/-- Node `PR.1/hodge-tate-comparison` (Theorems 4.11 and 6.3): the Hodge–Tate comparison,
`Ω^i_{R/(A/I)} ≅ H^i(Δ̄_{R/A}){i}`, for every bounded prism. There is no Frobenius twist. -/
theorem comparison_bijective (hb : P.IsBounded) (hR : SmoothModP p P.bar R) (i : ℕ) :
    Function.Bijective (comparisonMap P R i) := sorry

end TauCeti.Prismatic.HodgeTate

/-! ### The crystalline comparison -/

namespace TauCeti.Prismatic.Crystalline

open CategoryTheory TensorProduct TauCeti.Delta TauCeti.Prismatic.Site

attribute [local instance] HasDerivedCategory.standard

universe u

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] (P : Prism p A)

section Crystallization

variable (d : A) (hd : P.I = Ideal.span {d})

/-- Node `PR.1/crystallization-of-oriented-prism` (Construction 6.1): the bounded crystalline
prism `(B, (p))`, `B = A{φ(d)/p}^∧`, attached to an oriented prism `(A, (d))` with `A / (d)`
`p`-torsion-free and `A / (p, d) → A / (p, d^p)`, `x ↦ x^p`, flat. These two hypotheses are not
recorded in the signature. -/
noncomputable def crystallization (P : Prism p A) (d : A) (hd : P.I = Ideal.span {d}) :
    BoundedPrism.{u} p := sorry

/-- The canonical δ-map `A → B`. -/
noncomputable def crystallizationCan : A →+* (crystallization P d hd).carrier := sorry

/-- The map of prisms `α : (A, (d)) → (B, (p))`. -/
noncomputable def crystallizationMap : P.Hom (crystallization P d hd).prism := sorry

theorem crystallizationMap_apply (a : A) :
    (crystallizationMap P d hd).toRingHom a = crystallizationCan P d hd (P.φ a) := sorry

theorem crystallization_isCrystalline : (crystallization P d hd).prism.IsCrystalline := sorry

/-- `φ(d) = p · u` in `B` with `u` a unit (Bhatt–Scholze, Lemma 2.24). -/
theorem crystallization_frobenius_unit :
    ∃ u : ((crystallization P d hd).carrier)ˣ,
      crystallizationCan P d hd (P.φ d) = (p : (crystallization P d hd).carrier) * u := sorry

/-- Property (3) of Construction 6.1: `α̂^* Δ_{R/A} ≃ Δ_{R_B/B}`. The completed base change
functor `cbc` along `α` is data of `DerivedDeRhamCohomology:DD.1`; `R'` stands for the
`p`-completed base change of `R`. -/
theorem crystallization_cohomology (hb : P.IsBounded) (R : Type u) [CommRing R] [Algebra P.bar R]
    (hR : SmoothModP p P.bar R) (R' : Type u) [CommRing R']
    [Algebra (crystallization P d hd).prism.bar R'] (g : R →+* R')
    (hg : g.comp (algebraMap P.bar R) =
      (algebraMap (crystallization P d hd).prism.bar R').comp (barMap (crystallizationMap P d hd)))
    (cbc : DerivedCategory (ModuleCat.{u} A) ⥤
      DerivedCategory (ModuleCat.{u} (crystallization P d hd).carrier)) :
    Nonempty (cbc.obj (prismaticCohomology P R) ≅
      prismaticCohomology (crystallization P d hd).prism R') := sorry

-- pr1_crystallization_alpha_d
example : (crystallizationMap P d hd).toRingHom d ∈
    Ideal.span {(p : (crystallization P d hd).carrier)} := sorry

-- pr1_crystallization_alpha_eq
example (a : A) : (crystallizationMap P d hd).toRingHom a =
    crystallizationCan P d hd a ^ p + p * crystallizationCan P d hd (P.δ.delta a) := sorry

-- pr1_crystallization_can_not_prism_map
example (htf : ∀ x : A ⧸ Ideal.span {d}, (p : A ⧸ Ideal.span {d}) * x = 0 → x = 0)
    (h1 : (1 : A) ∉ Ideal.span {(p : A), d}) :
    crystallizationCan P d hd d ∉ Ideal.span {(p : (crystallization P d hd).carrier)} := sorry

end Crystallization

/-- Node `PR.1/crystalline-comparison` (Theorem 5.2 with Remark 5.3, the case `I = (p)`): for a
crystalline prism and `R` smooth over `A / p`, `φ_A^* Δ_{R/A} ≃ RΓ_crys(R/A)`. The completed
Frobenius pullback `phiPullback` (`DerivedDeRhamCohomology:DD.1`) and the crystalline cohomology
`crys` (`CrystallineCohomology:CR.2`) are taken as arguments. The scalar extension along `φ_A`
is essential; equivalently `Δ_{R^{(1)}/A} ≃ RΓ_crys(R/A)`. -/
theorem comparison (hc : P.IsCrystalline) (R : Type u) [CommRing R] [Algebra P.bar R]
    (hR : Algebra.Smooth P.bar R)
    (phiPullback : DerivedCategory (ModuleCat.{u} A) ⥤ DerivedCategory (ModuleCat.{u} A))
    (crys : DerivedCategory (ModuleCat.{u} A)) :
    Nonempty (phiPullback.obj (prismaticCohomology P R) ≅ crys) := sorry

end TauCeti.Prismatic.Crystalline

/-! ### The de Rham comparison -/

namespace TauCeti.Prismatic.DeRham

open CategoryTheory TensorProduct TauCeti.Delta TauCeti.Prismatic.Site

attribute [local instance] HasDerivedCategory.standard

universe u

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] (P : Prism p A)

/-- Node `PR.1/de-rham-comparison` (Theorem 6.4): if `W(A / I)` is `p`-torsion-free, then
`Δ_{R/A} ⊗̂^L_{A, φ_A} A / I ≃ Ω^*_{R/(A/I)}`. The Frobenius-twisted completed reduction
`phiReduction` (`DerivedDeRhamCohomology:DD.1`) and the de Rham complex `deRham`
(`DerivedDeRhamCohomology:DD.2`) are taken as arguments. The statement without the hypothesis on
`W(A / I)` is `PrismaticCohomology:PR.3/de-rham-comparison-general`. -/
theorem comparison (hb : P.IsBounded)
    (hW : ∀ x : WittVector p P.bar, (p : WittVector p P.bar) * x = 0 → x = 0)
    (R : Type u) [CommRing R] [Algebra P.bar R] (hR : SmoothModP p P.bar R)
    (phiReduction : DerivedCategory (ModuleCat.{u} A) ⥤ DerivedCategory (ModuleCat.{u} P.bar))
    (deRham : DerivedCategory (ModuleCat.{u} P.bar)) :
    Nonempty (phiReduction.obj (prismaticCohomology P R) ≅ deRham) := sorry

end TauCeti.Prismatic.DeRham

/-! ## PR.2. Derived extension, semiperfectoid inputs and descent

Suggested signatures for the layer `PrismaticCohomology:PR.2`. Objects of the derived
∞-categories of the sources are stated in Mathlib's `DerivedCategory`, their 1-categorical
shadow; statements that need the ∞-categorical structure (completed colimits, limits over
Čech nerves, completed tensor products of commutative algebras) are named in docstrings and
not stated. Inputs are simplicial commutative `A / I`-algebras, or discrete `A / I`-algebras
through the shared carrier `prismaticCohomology`. The conditions "derived `p`-complete",
"`p`-completely smooth", "quasisyntomic", "quasiregular semiperfectoid" and "perfectoid" are
owned by DerivedDeRhamCohomology DD.0, DD.1, DD.5 and PerfectoidQuotients Q0; where a statement
needs one of them it is given here in a case that Mathlib can state (a smooth algebra, a
quotient by a regular sequence, a polynomial ring, the base ring), and the docstring says so. -/

namespace TauCeti.Prismatic.Derived

open CategoryTheory TauCeti.Delta

attribute [local instance] HasDerivedCategory.standard

universe u

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]

/-! ### Node `PR.2/derived-prismatic-cohomology` -/

/-- Derived prismatic cohomology `Δ_{R/A}` of a simplicial commutative `A / I`-algebra `R`:
the left Kan extension of the site cohomology of `p`-completed polynomial algebras, derived
`(p, I)`-completed (Bhatt–Scholze, Construction 7.6). -/
noncomputable def cohomology (P : Prism p A) (R : SimplicialObject (CommAlgCat.{u} P.bar)) :
    DerivedCategory (ModuleCat.{u} A) := sorry

/-- Functoriality of `Δ_{•/A}` in the simplicial algebra. -/
noncomputable def map (P : Prism p A) {R S : SimplicialObject (CommAlgCat.{u} P.bar)}
    (f : R ⟶ S) : cohomology P R ⟶ cohomology P S := sorry

theorem map_id (P : Prism p A) (R : SimplicialObject (CommAlgCat.{u} P.bar)) :
    map P (𝟙 R) = 𝟙 (cohomology P R) := sorry

theorem map_comp (P : Prism p A) {R S T : SimplicialObject (CommAlgCat.{u} P.bar)}
    (f : R ⟶ S) (g : S ⟶ T) : map P (f ≫ g) = map P f ≫ map P g := sorry

/-- The `φ_A`-semilinear Frobenius `φ_R : Δ_{R/A} ⟶ φ_{A,*} Δ_{R/A}`. -/
noncomputable def frobenius (P : Prism p A) (R : SimplicialObject (CommAlgCat.{u} P.bar)) :
    cohomology P R ⟶ (frobeniusPushforward P).obj (cohomology P R) := sorry

theorem frobenius_naturality (P : Prism p A) {R S : SimplicialObject (CommAlgCat.{u} P.bar)}
    (f : R ⟶ S) :
    map P f ≫ frobenius P S = frobenius P R ≫ (frobeniusPushforward P).map (map P f) := sorry

/-- Derived Hodge–Tate cohomology `Δ̄_{R/A} = Δ_{R/A} ⊗^L_A A / I`, as an object of `D(A / I)`. -/
noncomputable def hodgeTate (P : Prism p A) (R : SimplicialObject (CommAlgCat.{u} P.bar)) :
    DerivedCategory (ModuleCat.{u} P.bar) := sorry

/-- The unit `A ⟶ Δ_{R/A}`. -/
noncomputable def unit (P : Prism p A) (R : SimplicialObject (CommAlgCat.{u} P.bar)) :
    (DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A A) ⟶
      cohomology P R := sorry

/-- On a constant simplicial algebra the simplicial functor is the shared carrier
`prismaticCohomology`; for `p`-completely smooth `R` this is the cohomology of the prismatic
site (Construction 7.6 (1)). -/
noncomputable def constIso (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] :
    cohomology P ((SimplicialObject.const (CommAlgCat.{u} P.bar)).obj (CommAlgCat.of P.bar R)) ≅
      prismaticCohomology P R := sorry

-- pr2_derived_base_ring
example (P : Prism p A) :
    Nonempty (prismaticCohomology P P.bar ≅
      (DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A A)) := sorry

-- pr2_derived_const_agrees
example (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] :
    Nonempty (cohomology P
      ((SimplicialObject.const (CommAlgCat.{u} P.bar)).obj (CommAlgCat.of P.bar R)) ≅
      prismaticCohomology P R) := sorry

-- pr2_derived_product
example (P : Prism p A) :
    Nonempty (prismaticCohomology P (P.bar × P.bar) ≅
      (DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A (A × A))) := sorry

-- pr2_derived_not_pi0_invariant
example (P : Prism p A) [Nontrivial P.bar] :
    ∃ R : SimplicialObject (CommAlgCat.{u} P.bar),
      ¬ Limits.IsZero
        ((DerivedCategory.homologyFunctor (ModuleCat.{u} P.bar) (-1)).obj (hodgeTate P R)) := sorry

-- pr2_derived_frobenius_natural_id
example (P : Prism p A) (R : SimplicialObject (CommAlgCat.{u} P.bar)) :
    map P (𝟙 R) ≫ frobenius P R =
      frobenius P R ≫ (frobeniusPushforward P).map (map P (𝟙 R)) := sorry

/-! ### Node `PR.2/conjugate-filtration` -/

/-- The conjugate filtration `Fil_i^conj Δ̄_{R/A}`, an object of `D(R)`: the completed left Kan
extension of the canonical filtration `τ^{≤ i}`. Exhaustiveness (`Δ̄` is the derived
`p`-completed colimit) and multiplicativity are not stated here; they need completed colimits
and tensor products (DD.1). -/
noncomputable def conjFil (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] (i : ℕ) :
    DerivedCategory (ModuleCat.{u} R) := sorry

/-- The transition maps of the conjugate filtration. -/
noncomputable def conjFilMap (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R]
    {i j : ℕ} (h : i ≤ j) : conjFil P R i ⟶ conjFil P R j := sorry

theorem conjFilMap_refl (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] (i : ℕ) :
    conjFilMap P R (le_refl i) = 𝟙 (conjFil P R i) := sorry

theorem conjFilMap_trans (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R]
    {i j k : ℕ} (h : i ≤ j) (h' : j ≤ k) :
    conjFilMap P R h ≫ conjFilMap P R h' = conjFilMap P R (h.trans h') := sorry

/-- The map `Fil_i^conj ⟶ Δ̄_{R/A}`. -/
noncomputable def conjFilι (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] (i : ℕ) :
    conjFil P R i ⟶ hodgeTateCohomology P R := sorry

theorem conjFilMap_ι (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R]
    {i j : ℕ} (h : i ≤ j) : conjFilMap P R h ≫ conjFilι P R j = conjFilι P R i := sorry

/-- `Fil_0^conj Δ̄_{R/A} = R`. -/
noncomputable def conjFilZeroIso (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] :
    conjFil P R 0 ≅ (DerivedCategory.singleFunctor (ModuleCat.{u} R) 0).obj (ModuleCat.of R R) :=
  sorry

/-- The graded piece `gr_i^conj Δ̄_{R/A}`, the cofibre of `Fil_{i-1}^conj ⟶ Fil_i^conj`. -/
noncomputable def conjGr (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] (i : ℕ) :
    DerivedCategory (ModuleCat.{u} R) := sorry

-- pr2_conj_fil_zero
example (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] :
    Nonempty (conjFil P R 0 ≅
      (DerivedCategory.singleFunctor (ModuleCat.{u} R) 0).obj (ModuleCat.of R R)) := sorry

-- pr2_conj_fil_base
example (P : Prism p A) (i : ℕ) : IsIso (conjFilι P P.bar i) := sorry

-- pr2_conj_fil_smooth_truncation
example (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] [Algebra.Smooth P.bar R]
    (i : ℕ) (n : ℤ) (hn : (i : ℤ) < n) :
    Limits.IsZero
      ((DerivedCategory.homologyFunctor (ModuleCat.{u} R) n).obj (conjFil P R i)) := sorry

-- pr2_conj_fil_not_postnikov
example (P : Prism p A) (f : P.bar) (hf : f ∈ nonZeroDivisors P.bar)
    [Nontrivial (P.bar ⧸ Ideal.span {f})]
    (hb : ∃ n : ℕ, ∀ x : P.bar ⧸ Ideal.span {f},
      (∃ m : ℕ, (p : P.bar ⧸ Ideal.span {f}) ^ m * x = 0) →
        (p : P.bar ⧸ Ideal.span {f}) ^ n * x = 0) (i : ℕ) :
    ¬ IsIso (conjFilι P (P.bar ⧸ Ideal.span {f}) i) := sorry

/-! ### Node `PR.2/derived-hodge-tate-comparison` -/

/-- Imported data: the derived `p`-completed derived exterior powers of the cotangent complex
of `R` over `A / I`. -/
structure CotangentPowers (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] where
  /-- `(∧^i L_{R/(A/I)})^∧` as an object of `D(R)`; owned by DerivedDeRhamCohomology DD.0
  (cotangent complex, derived exterior powers) and DD.1 (derived completion). -/
  wedge : ℕ → DerivedCategory (ModuleCat.{u} R)

/-- The derived Hodge–Tate comparison for an orientable prism, where a generator of `I`
trivialises the Breuil–Kisin twists: `gr_i^conj Δ̄_{R/A} ≃ (∧^i L_{R/(A/I)})^∧[-i]`. The
statement is about the field `wedge` when it is the object its docstring names. -/
theorem conjGr_iso_cotangentPowers (P : Prism p A) (hP : P.IsOrientable) (R : Type u) [CommRing R]
    [Algebra P.bar R] (L : CotangentPowers P R) (i : ℕ) :
    Nonempty (conjGr P R i ≅
      (shiftFunctor (DerivedCategory (ModuleCat.{u} R)) (-(i : ℤ))).obj (L.wedge i)) := sorry

/-- The last step of consequence (b): if `Δ̄_{R/A}` is discrete then so is `Δ_{R/A}`. -/
theorem discrete_of_hodgeTate_discrete (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R]
    (h : ∀ n : ℤ, n ≠ 0 → Limits.IsZero
      ((DerivedCategory.homologyFunctor (ModuleCat.{u} R) n).obj (hodgeTateCohomology P R)))
    (n : ℤ) (hn : n ≠ 0) :
    Limits.IsZero
      ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) n).obj (prismaticCohomology P R)) :=
  sorry

/-! ### Node `PR.2/comparison-to-prisms` -/

/-- The Frobenius of a prism `(B, J)` over `(A, I)` as a map `B ⟶ φ_{A,*} B` in `D(A)`,
induced by the `φ_A`-semilinear ring map `φ_B`. -/
noncomputable def prismFrobeniusMap (P : Prism p A) {B : Type u} [CommRing B] [Algebra A B]
    (Q : Prism p B) (hδ : IsDeltaHom p P.δ Q.δ (algebraMap A B)) :
    (DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A B) ⟶
      (frobeniusPushforward P).obj
        ((DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A B)) := sorry

/-- The comparison map `Δ_{R/A} ⟶ B` for a prism `(B, J)` over `(A, I)` and an `A`-algebra map
`R ⟶ B / J` (Bhatt–Scholze, proof of Lemma 7.7 (3)). -/
noncomputable def toPrism (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R]
    [Algebra A R] [IsScalarTower A P.bar R] {B : Type u} [CommRing B] [Algebra A B]
    (Q : Prism p B) (hδ : IsDeltaHom p P.δ Q.δ (algebraMap A B))
    (hI : P.I.map (algebraMap A B) ≤ Q.I) (g : R →ₐ[A] B ⧸ Q.I) :
    prismaticCohomology P R ⟶
      (DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A B) := sorry

theorem toPrism_frobenius (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R]
    [Algebra A R] [IsScalarTower A P.bar R] {B : Type u} [CommRing B] [Algebra A B]
    (Q : Prism p B) (hδ : IsDeltaHom p P.δ Q.δ (algebraMap A B))
    (hI : P.I.map (algebraMap A B) ≤ Q.I) (g : R →ₐ[A] B ⧸ Q.I) :
    toPrism P R Q hδ hI g ≫ prismFrobeniusMap P Q hδ =
      prismaticFrobenius P R ≫ (frobeniusPushforward P).map (toPrism P R Q hδ hI g) := sorry

theorem toPrism_naturality (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R]
    [Algebra A R] [IsScalarTower A P.bar R] {B B' : Type u} [CommRing B] [Algebra A B]
    [CommRing B'] [Algebra A B'] (Q : Prism p B) (Q' : Prism p B')
    (hδ : IsDeltaHom p P.δ Q.δ (algebraMap A B)) (hδ' : IsDeltaHom p P.δ Q'.δ (algebraMap A B'))
    (hI : P.I.map (algebraMap A B) ≤ Q.I) (hI' : P.I.map (algebraMap A B') ≤ Q'.I)
    (g : R →ₐ[A] B ⧸ Q.I) (h : B →ₐ[A] B') (hh : Q.I ≤ Q'.I.comap h) :
    toPrism P R Q' hδ' hI' ((Ideal.quotientMapₐ Q'.I h hh).comp g) =
      toPrism P R Q hδ hI g ≫
        (DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).map (ModuleCat.ofHom h.toLinearMap) :=
  sorry

/-- The cohomology `RΓ((R/A)_Δ, O_Δ)` of the prismatic site of `R`: the limit of `B` over all
bounded prisms `(B, J)` over `(A, I)` with a map `R ⟶ B / J`. -/
noncomputable def siteCohomology (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] :
    DerivedCategory (ModuleCat.{u} A) := sorry

/-- The comparison map `c_R : Δ_{R/A} ⟶ RΓ((R/A)_Δ, O_Δ)`. -/
noncomputable def toSite (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] :
    prismaticCohomology P R ⟶ siteCohomology P R := sorry

theorem toSite_isIso_of_smooth (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R]
    [Algebra.Smooth P.bar R] : IsIso (toSite P R) := sorry

-- pr2_to_prism_base
example (P : Prism p A) (hδ : IsDeltaHom p P.δ P.δ (algebraMap A A))
    (hI : P.I.map (algebraMap A A) ≤ P.I) :
    IsIso (toPrism P P.bar P hδ hI (AlgHom.id A (A ⧸ P.I))) := sorry

-- pr2_to_site_smooth
example (P : Prism p A) : IsIso (toSite P (P.bar × P.bar)) := sorry

-- pr2_to_site_not_iso
example (P : Prism p A) [Nontrivial P.bar] :
    ∃ R : SimplicialObject (CommAlgCat.{u} P.bar), ¬ (hodgeTate P R).IsGE 0 := sorry

-- pr2_to_prism_frobenius_base
example (P : Prism p A) (hδ : IsDeltaHom p P.δ P.δ (algebraMap A A))
    (hI : P.I.map (algebraMap A A) ≤ P.I) :
    toPrism P P.bar P hδ hI (AlgHom.id A (A ⧸ P.I)) ≫ prismFrobeniusMap P P hδ =
      prismaticFrobenius P P.bar ≫
        (frobeniusPushforward P).map (toPrism P P.bar P hδ hI (AlgHom.id A (A ⧸ P.I))) := sorry

end TauCeti.Prismatic.Derived

namespace TauCeti.Prismatic.Semiperfectoid

open CategoryTheory TauCeti.Delta

attribute [local instance] HasDerivedCategory.standard

universe u

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]

/-! ### Node `PR.2/idempotent-retract-initial-object` (Bhatt–Scholze, Lemma 7.8) -/

/-- In an idempotent complete category `C`, a functor `F : C ⥤ Under X` that is a section of
the forgetful functor up to isomorphism exhibits a retract of `X` as an initial object. -/
theorem idempotent_retract_isInitial {C : Type*} [Category C] [IsIdempotentComplete C] (X : C)
    (F : C ⥤ Under X) (α : F ⋙ Under.forget X ≅ 𝟭 C) :
    ∃ (X' : C) (i : X' ⟶ X) (r : X ⟶ X'), i ≫ r = 𝟙 X' ∧ Nonempty (Limits.IsInitial X') := sorry

/-! ### Node `PR.2/regular-quotient-prismatic-envelope` (Bhatt–Scholze, Example 7.9)

Discreteness of `Δ_{R/A}` for `R = (A / I) / (f_1, …, f_r)` with `f` a regular sequence and `R`
of bounded `p^∞`-torsion. The identification with the prismatic envelope and its initiality are
stated in the roadmap; they need derived completion (DD.1) and the envelope of PR.0. The same
conclusion for a quasiregular semiperfectoid `S` (Proposition 7.10) needs the predicate of
DerivedDeRhamCohomology DD.5. -/
theorem regularQuotient_discrete (P : Prism p A) (fs : List P.bar)
    (hreg : RingTheory.Sequence.IsRegular P.bar fs)
    (hb : ∃ n : ℕ, ∀ x : P.bar ⧸ Ideal.ofList fs,
      (∃ m : ℕ, (p : P.bar ⧸ Ideal.ofList fs) ^ m * x = 0) →
        (p : P.bar ⧸ Ideal.ofList fs) ^ n * x = 0)
    (n : ℤ) (hn : n ≠ 0) :
    Limits.IsZero ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) n).obj
      (prismaticCohomology P (P.bar ⧸ Ideal.ofList fs))) := sorry

/-- In the same situation the comparison map to the cohomology of the prismatic site is an
isomorphism: `Δ_{R/A}` is the initial object of `(R/A)_Δ`. -/
theorem regularQuotient_toSite_isIso (P : Prism p A) (fs : List P.bar)
    (hreg : RingTheory.Sequence.IsRegular P.bar fs)
    (hb : ∃ n : ℕ, ∀ x : P.bar ⧸ Ideal.ofList fs,
      (∃ m : ℕ, (p : P.bar ⧸ Ideal.ofList fs) ^ m * x = 0) →
        (p : P.bar ⧸ Ideal.ofList fs) ^ n * x = 0) :
    IsIso (Derived.toSite P (P.bar ⧸ Ideal.ofList fs)) := sorry

end TauCeti.Prismatic.Semiperfectoid

namespace TauCeti.Prismatic.Perfection

open CategoryTheory TauCeti.Delta

attribute [local instance] HasDerivedCategory.standard

universe u

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]

/-! ### Node `PR.2/perfection-of-prismatic-cohomology` (Bhatt–Scholze, Definition 8.2)

The source defines these objects over a perfect prism and for derived `p`-complete inputs; the
carriers below are stated for a discrete `A / I`-algebra `S`. -/

/-- The perfection `Δ_{S/A,perf}`: the derived `(p, I)`-completed colimit of `Δ_{S/A}` along
its Frobenius. -/
noncomputable def perfection (P : Prism p A) (S : Type u) [CommRing S] [Algebra P.bar S] :
    DerivedCategory (ModuleCat.{u} A) := sorry

/-- The perfectoidization `S_perfd = Δ_{S/A,perf} ⊗^L_A A / I`, as an object of `D(A / I)`. -/
noncomputable def perfectoidization (P : Prism p A) (S : Type u) [CommRing S] [Algebra P.bar S] :
    DerivedCategory (ModuleCat.{u} P.bar) := sorry

/-- The canonical map `Δ_{S/A} ⟶ Δ_{S/A,perf}`. -/
noncomputable def toPerfection (P : Prism p A) (S : Type u) [CommRing S] [Algebra P.bar S] :
    prismaticCohomology P S ⟶ perfection P S := sorry

/-- The Frobenius of the perfection is an isomorphism `Δ_{S/A,perf} ≃ φ_{A,*} Δ_{S/A,perf}`. -/
noncomputable def perfectionFrobenius (P : Prism p A) (S : Type u) [CommRing S]
    [Algebra P.bar S] : perfection P S ≅ (frobeniusPushforward P).obj (perfection P S) := sorry

theorem toPerfection_frobenius (P : Prism p A) (S : Type u) [CommRing S] [Algebra P.bar S] :
    toPerfection P S ≫ (perfectionFrobenius P S).hom =
      prismaticFrobenius P S ≫ (frobeniusPushforward P).map (toPerfection P S) := sorry

theorem isIso_toPerfection (P : Prism p A) (S : Type u) [CommRing S] [Algebra P.bar S]
    (h : IsIso (prismaticFrobenius P S)) : IsIso (toPerfection P S) := sorry

/-- The map `S ⟶ S_perfd` in `D(A / I)`. -/
noncomputable def fromRing (P : Prism p A) (S : Type u) [CommRing S] [Algebra P.bar S] :
    (DerivedCategory.singleFunctor (ModuleCat.{u} P.bar) 0).obj (ModuleCat.of P.bar S) ⟶
      perfectoidization P S := sorry

-- pr2_perfection_base
example (P : Prism p A) (hP : P.IsPerfect) : IsIso (toPerfection P P.bar) := sorry

-- pr2_perfectoidization_base
example (P : Prism p A) (hP : P.IsPerfect) :
    Nonempty (perfectoidization P P.bar ≅
      (DerivedCategory.singleFunctor (ModuleCat.{u} P.bar) 0).obj (ModuleCat.of P.bar P.bar)) :=
  sorry

-- pr2_perfectoidization_char_p_discrete
example (P : Prism p A) (hP : P.IsPerfect) (hc : P.IsCrystalline) (n : ℤ) (hn : n ≠ 0) :
    Limits.IsZero ((DerivedCategory.homologyFunctor (ModuleCat.{u} P.bar) n).obj
      (perfectoidization P (Polynomial P.bar))) := sorry

-- pr2_perfection_not_prismatic
example (P : Prism p A) (hP : P.IsPerfect) (hc : P.IsCrystalline) [Nontrivial P.bar] :
    ¬ IsIso (toPerfection P (Polynomial P.bar)) := sorry

/-! ### Node `PR.2/perfectoidization-coconnective` (Bhatt–Scholze, Lemma 8.4) -/

/-- `Δ_{S/A,perf}` lies in `D^{≥ 0}` for a perfect prism. The proof imports the operation
`P^0` on `E_∞`-`F_p`-algebras. -/
theorem perfection_isGE (P : Prism p A) (hP : P.IsPerfect) (S : Type u) [CommRing S]
    [Algebra P.bar S] : (perfection P S).IsGE 0 := sorry

/-- `S_perfd` lies in `D^{≥ 0}` for a perfect prism. -/
theorem perfectoidization_isGE (P : Prism p A) (hP : P.IsPerfect) (S : Type u) [CommRing S]
    [Algebra P.bar S] : (perfectoidization P S).IsGE 0 := sorry

/-! ### Node `PR.2/connective-perfectoidization-perfectoid` (Bhatt–Scholze, Corollary 8.14)

The part statable without the perfectoid predicate (PerfectoidQuotients Q0): if `S_perfd` is
connective then it and `Δ_{S/A,perf}` are discrete. That `S_perfd` is then a perfectoid ring
and universal, and Proposition 8.13 (symmetric monoidality), are stated in the roadmap. -/
theorem perfection_discrete_of_connective (P : Prism p A) (hP : P.IsPerfect) (S : Type u)
    [CommRing S] [Algebra P.bar S] (h : (perfectoidization P S).IsLE 0) (n : ℤ) (hn : n ≠ 0) :
    Limits.IsZero
      ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) n).obj (perfection P S)) := sorry

end TauCeti.Prismatic.Perfection


/-! ## PR.3. Nygaard filtration, divided Frobenius and twists

Suggested signatures for the layer `PrismaticCohomology:PR.3`. Derived (p, I)-completeness of
prisms (DD.1) is not a field of `Prism`; statements that need it say so. Objects of other
layers (the conjugate filtration, `Lη`, de Rham complexes, completed base change) enter as
fields of structures of imported data, each field naming its owner. -/

namespace TauCeti.Prismatic.BKTwist

open CategoryTheory TauCeti.Delta
open scoped TensorProduct

universe u

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] (P : Prism p A)

/-! ### Transversal prisms (node `PR.3/transversal-prism`) -/

/-- A prism is transversal when `A / I` is `p`-torsion-free (Bhatt–Lurie Definition 2.1.3). -/
def IsTransversal : Prop := ∀ x : P.bar, (p : P.bar) * x = 0 → x = 0

/-- The ideal `(φ^r)^*(I) = φ^r(I) A`. -/
noncomputable def frobeniusIdeal (r : ℕ) : Ideal A := P.I.map (P.φ ^ r)

/-- The ideal `I_r = I · φ^*(I) ⋯ (φ^{r-1})^*(I)` (Bhatt–Lurie Notation 2.2.2). -/
noncomputable def Ir (r : ℕ) : Ideal A := ∏ s ∈ Finset.range r, frobeniusIdeal P s

theorem Ir_zero : Ir P 0 = ⊤ := by sorry

theorem Ir_one : Ir P 1 = P.I := by sorry

theorem Ir_succ_le (r : ℕ) : Ir P (r + 1) ≤ Ir P r := by sorry

/-- Bhatt–Lurie Remark 2.1.7. Needs `A` to be `I`-adically separated, which holds for prisms. -/
theorem IsTransversal.torsionFree (h : IsTransversal P) (x : A) (hx : (p : A) * x = 0) :
    x = 0 := by sorry

/-- Bhatt–Lurie Lemma 2.2.5. -/
theorem IsTransversal.quotient_Ir_torsionFree (h : IsTransversal P) (r : ℕ)
    (x : A ⧸ Ir P r) (hx : (p : A ⧸ Ir P r) * x = 0) : x = 0 := by sorry

/-- First step of Bhatt–Lurie Lemma 2.2.8. -/
theorem IsTransversal.frobeniusIdeal_le (h : IsTransversal P) (r : ℕ) (hr : 0 < r) :
    frobeniusIdeal P r ≤ Ir P r ⊔ Ideal.span {(p : A)} := by sorry

/-- Bhatt–Lurie Corollary 2.2.9. -/
theorem IsTransversal.Ir_eq_iInf (h : IsTransversal P) (r : ℕ) :
    Ir P r = ⨅ s ∈ Finset.range r, frobeniusIdeal P s := by sorry

/-- Bhatt–Lurie Corollary 2.2.10 (2): the canonical map `I_{r+1}/I_{r+1}² → I_r/I_r²` is
divisible by `p`. -/
theorem IsTransversal.cotangent_transition (h : IsTransversal P) (r : ℕ) (y : Ir P (r + 1)) :
    ∃ z : (Ir P r).Cotangent,
      (Ir P r).toCotangent ⟨y, Ir_succ_le P r y.2⟩ = (p : A) • z := by sorry

/-- Bhatt–Lurie Remark 2.2.4. -/
theorem Ir_map {B : Type u} [CommRing B] {Q : Prism p B} (f : P.Hom Q) (r : ℕ) :
    Ir Q r = (Ir P r).map f.toRingHom := by sorry

-- pr3_transversal_ir_zero_one
example : Ir P 0 = ⊤ ∧ Ir P 1 = P.I := by sorry

-- pr3_transversal_q_de_rham_ir
example (q : A) (hq : P.δ.delta q = 0)
    (hI : P.I = Ideal.span {∑ i ∈ Finset.range p, q ^ i}) (r : ℕ) :
    Ir P r = Ideal.span {∑ i ∈ Finset.range (p ^ r), q ^ i} := by sorry

-- pr3_transversal_torsion_free
example (h : IsTransversal P) (x : A) (hx : (p : A) * x = 0) : x = 0 := by sorry

-- pr3_transversal_not_crystalline
example (hP : P.IsCrystalline) (hA : ¬ IsUnit (p : A)) : ¬ IsTransversal P := by sorry

/-! ### The twist (nodes `PR.3/breuil-kisin-twist-transversal`, `PR.3/breuil-kisin-twist`) -/

/-- Node `PR.3/breuil-kisin-twist`: the Breuil–Kisin twist `A{1}` of a prism, an invertible
`A`-module (Bhatt–Lurie Definition 2.5.2). -/
noncomputable def twist (P : Prism p A) : ModuleCat.{u} A := sorry

instance twist_invertible : Module.Invertible A (twist P) := sorry

/-- `A{n}`, the `n`-th tensor power of `A{1}` for `n : ℤ`. -/
noncomputable def twistPow (P : Prism p A) (n : ℤ) : ModuleCat.{u} A := sorry

/-- `M{n} = A{n} ⊗_A M`. -/
noncomputable def twistModule (M : ModuleCat.{u} A) (n : ℤ) : ModuleCat.{u} A :=
  ModuleCat.of A (twistPow P n ⊗[A] M)

/-- Functoriality (Bhatt–Lurie Remark 2.5.5): `B ⊗_A A{1} ≅ B{1}`. -/
noncomputable def twistBaseChange {B : Type u} [CommRing B] {Q : Prism p B} (f : P.Hom Q) :
    (ModuleCat.extendScalars f.toRingHom).obj (twist P) ≅ twist Q := sorry

/-- Bhatt–Lurie Remark 2.5.7: `β : A{1} / I A{1} ≅ I / I²`. -/
noncomputable def twistReduction :
    ((twist P) ⧸ (P.I • (⊤ : Submodule A (twist P)))) ≃ₗ[A] P.I.Cotangent := sorry

/-- Bhatt–Lurie Remark 2.5.8. -/
theorem twist_free_iff : Nonempty ((twist P) ≃ₗ[A] A) ↔ P.IsOrientable := by sorry

/-- Bhatt–Lurie Remark 2.5.9: `φ_A^* A{1} ≅ I⁻¹ ⊗ A{1}`. -/
noncomputable def twistFrobenius :
    (ModuleCat.extendScalars P.φ).obj (twist P) ≅
      ModuleCat.of A (Module.Dual A P.I ⊗[A] twist P) := sorry

/-- The `φ_A`-semilinear Frobenius `φ_{A{1}} : A{1} → I⁻¹ ⊗ A{1}`. -/
noncomputable def twistFrobeniusMap : (twist P) →+ (Module.Dual A P.I ⊗[A] twist P) := sorry

theorem twistFrobeniusMap_smul (a : A) (x : twist P) :
    twistFrobeniusMap P (a • x) = P.φ a • twistFrobeniusMap P x := by sorry

/-- On modules killed by `I` the twist is the Bhatt–Scholze twist by `I / I²`. -/
noncomputable def twistModule_of_bar (M : Type u) [AddCommGroup M] [Module A M]
    (hM : ∀ a ∈ P.I, ∀ x : M, a • x = 0) :
    (M ⊗[A] twist P) ≃ₗ[A] (M ⊗[A] P.I.Cotangent) := sorry

/-- Node `PR.3/breuil-kisin-twist-transversal`: for a transversal prism the projection
`π_r : A{1} → I_r / I_r²` of the inverse limit (Bhatt–Lurie Construction 2.2.11). -/
noncomputable def transversalProj (h : IsTransversal P) (r : ℕ) :
    (twist P) →ₗ[A] (Ir P r).Cotangent := sorry

theorem transversalProj_surjective (h : IsTransversal P) (r : ℕ) :
    Function.Surjective (transversalProj P h r) := by sorry

/-- Bhatt–Lurie Proposition 2.2.12. -/
theorem ker_transversalProj (h : IsTransversal P) (r : ℕ) :
    LinearMap.ker (transversalProj P h r) = Ir P r • (⊤ : Submodule A (twist P)) := by sorry

/-- The transition maps are the canonical maps divided by `p`. -/
theorem transversalProj_transition (h : IsTransversal P) (r : ℕ) (x : twist P)
    (y : Ir P (r + 1)) (hy : (Ir P (r + 1)).toCotangent y = transversalProj P h (r + 1) x) :
    (Ir P r).toCotangent ⟨y, Ir_succ_le P r y.2⟩ = (p : A) • transversalProj P h r x := by sorry

theorem transversal_ext (h : IsTransversal P) (x y : twist P)
    (hxy : ∀ r, transversalProj P h r x = transversalProj P h r y) : x = y := by sorry

theorem transversal_lift (h : IsTransversal P) (y : ∀ r : ℕ, Ir P r)
    (hy : ∀ r, (Ir P r).toCotangent ⟨y (r + 1), Ir_succ_le P r (y (r + 1)).2⟩ =
      (p : A) • (Ir P r).toCotangent (y r)) :
    ∃! x : twist P, ∀ r, transversalProj P h r x = (Ir P r).toCotangent (y r) := by sorry

-- pr3_bk_transversal_proj_one
example (h : IsTransversal P) : Function.Surjective (transversalProj P h 1) ∧
    LinearMap.ker (transversalProj P h 1) = Ir P 1 • (⊤ : Submodule A (twist P)) := by sorry

-- pr3_bk_transversal_q_system
example (h : IsTransversal P) (q : A) (hq : P.δ.delta q = 0)
    (hI : P.I = Ideal.span {∑ i ∈ Finset.range p, q ^ i}) (r : ℕ) :
    (∑ i ∈ Finset.range (p ^ (r + 1)), q ^ i) - (p : A) * ∑ i ∈ Finset.range (p ^ r), q ^ i
      ∈ Ir P r ^ 2 := by sorry

-- pr3_bk_transversal_undivided
example (h : IsTransversal P) (r : ℕ) (y : Ir P (r + 1)) :
    ∃ z : (Ir P r).Cotangent,
      (Ir P r).toCotangent ⟨y, Ir_succ_le P r y.2⟩ = (p : A) • z := by sorry

-- pr3_bk_transversal_proj_zero
example (h : IsTransversal P) (x : twist P) : transversalProj P h 0 x = 0 := by sorry

-- pr3_bk_twist_pow_zero
example : Nonempty (twistPow P 0 ≅ ModuleCat.of A A) := by sorry

-- pr3_bk_twist_module_add
example (M : ModuleCat.{u} A) (m n : ℤ) :
    Nonempty (twistModule P (twistModule P M m) n ≅ twistModule P M (m + n)) := by sorry

-- pr3_bk_twist_free_of_principal
example (d : A) (hd : P.I = Ideal.span {d}) :
    ∃ e : twist P, Function.Bijective (fun a : A => a • e) := by sorry

-- pr3_bk_twist_q_generator
example (q : A) (hq : P.δ.delta q = 0)
    (hI : P.I = Ideal.span {∑ i ∈ Finset.range p, q ^ i}) :
    ∃ e : twist P, Function.Bijective (fun a : A => a • e) ∧
      (∑ i ∈ Finset.range p, q ^ i) • twistFrobeniusMap P e =
        (Submodule.subtype P.I : Module.Dual A P.I) ⊗ₜ[A] e := by sorry

-- pr3_bk_twist_no_fixed_generator
example (hP : P.IsCrystalline) (hA : ¬ IsUnit (p : A)) (e : twist P)
    (he : Function.Bijective (fun a : A => a • e)) :
    twistFrobeniusMap P e ≠ (Submodule.subtype P.I : Module.Dual A P.I) ⊗ₜ[A] e := by sorry

/-- Node `PR.3/transversal-approximation` (Bhatt–Lurie Proposition 2.4.1): every prism receives a
map of prisms from a transversal prism. -/
theorem transversal_approximation :
    ∃ (B : Type u) (_ : CommRing B) (Q : Prism p B) (_ : Q.Hom P), IsTransversal Q := by sorry

/-- Node `PR.3/breuil-kisin-twist-examples` (Bhatt–Lurie Proposition 2.6.1, Example 2.6.4): over a
crystalline prism the twist has a generator `e` with `p · φ(e) = e`. -/
theorem twist_crystalline_generator (hP : P.IsCrystalline) :
    ∃ e : twist P, Function.Bijective (fun a : A => a • e) ∧
      (p : A) • twistFrobeniusMap P e =
        (Submodule.subtype P.I : Module.Dual A P.I) ⊗ₜ[A] e := by sorry

end TauCeti.Prismatic.BKTwist

namespace TauCeti.Prismatic.Nygaard

open CategoryTheory TauCeti.Delta
open scoped TensorProduct

attribute [local instance] HasDerivedCategory.standard

universe u

variable {p : ℕ} [Fact p.Prime]

section Ideals

variable {B : Type u} [CommRing B] (P : Prism p B)

/-! ### The Nygaard ideals (node `PR.3/nygaard-filtration-qrsp`) -/

/-- `Fil^i_N B = φ⁻¹(J^i)` for a prism `(B, J)` (Bhatt–Scholze Definition 12.1, applied to the
prism of a quasiregular semiperfectoid ring). -/
noncomputable def fil (i : ℕ) : Ideal B := (P.I ^ i).comap P.φ

theorem mem_fil_iff {i : ℕ} {x : B} : x ∈ fil P i ↔ P.φ x ∈ P.I ^ i := by sorry

theorem fil_zero : fil P 0 = ⊤ := by sorry

theorem fil_antitone : Antitone (fil P) := by sorry

theorem fil_mul_le (i j : ℕ) : fil P i * fil P j ≤ fil P (i + j) := by sorry

theorem fil_map_le {B' : Type u} [CommRing B'] {Q : Prism p B'} (f : P.Hom Q) (i : ℕ) :
    (fil P i).map f.toRingHom ≤ fil Q i := by sorry

theorem fil_eq_span_pow_of_perfect (hP : P.IsPerfect) (d e : B) (hd : P.I = Ideal.span {d})
    (he : P.φ e = d) (i : ℕ) : fil P i = Ideal.span {e ^ i} := by sorry

/-- `gr^i_N B = Fil^i_N B / Fil^{i+1}_N B`. -/
abbrev gr (i : ℕ) : Type u :=
  ↥(fil P i) ⧸ Submodule.comap (fil P i).subtype (fil P (i + 1))

-- pr3_nygaard_fil_zero
example : fil P 0 = ⊤ := by sorry

-- pr3_nygaard_fil_frobenius_id
example (h : P.φ = RingHom.id B) (i : ℕ) : fil P i = P.I ^ i := by sorry

-- pr3_nygaard_fil_perfect
example (hP : P.IsPerfect) (d e : B) (hd : P.I = Ideal.span {d}) (he : P.φ e = d) (i : ℕ) :
    fil P i = Ideal.span {e} ^ i := by sorry

-- pr3_nygaard_fil_one_perfect
example (x : B) : x ∈ fil P 1 ↔ Ideal.Quotient.mk P.I (P.φ x) = 0 := by sorry

-- pr3_nygaard_fil_not_powers
example : ¬ ∀ (D : Type) [CommRing D] (Q : Prism p D) (i : ℕ), fil Q i = fil Q 1 ^ i := by
  sorry

/-! ### Divided Frobenius (node `PR.3/divided-frobenius`) -/

/-- `φ_i = φ / d^i : Fil^i_N B → B` for an orientation `d` of the prism. -/
noncomputable def dividedFrobenius (d : B) (hd : P.I = Ideal.span {d}) (i : ℕ) :
    fil P i → B := sorry

theorem dividedFrobenius_spec (d : B) (hd : P.I = Ideal.span {d}) (i : ℕ) (x : fil P i) :
    d ^ i * dividedFrobenius P d hd i x = P.φ x := by sorry

theorem dividedFrobenius_mul (d : B) (hd : P.I = Ideal.span {d}) (i j : ℕ)
    (x : fil P i) (y : fil P j) :
    dividedFrobenius P d hd (i + j)
        ⟨(x : B) * (y : B), fil_mul_le P i j (Ideal.mul_mem_mul x.2 y.2)⟩ =
      dividedFrobenius P d hd i x * dividedFrobenius P d hd j y := by sorry

theorem dividedFrobenius_succ (d : B) (hd : P.I = Ideal.span {d}) (i : ℕ)
    (x : fil P (i + 1)) :
    dividedFrobenius P d hd i ⟨x, fil_antitone P (Nat.le_add_right i 1) x.2⟩ =
      d * dividedFrobenius P d hd (i + 1) x := by sorry

theorem dividedFrobenius_mem_iff (d : B) (hd : P.I = Ideal.span {d}) (i : ℕ) (x : fil P i) :
    dividedFrobenius P d hd i x ∈ P.I ↔ (x : B) ∈ fil P (i + 1) := by sorry

theorem dividedFrobenius_unit (d : B) (hd : P.I = Ideal.span {d}) (u : Bˣ)
    (hd' : P.I = Ideal.span {(u : B) * d}) (i : ℕ) (x : fil P i) :
    (u : B) ^ i * dividedFrobenius P ((u : B) * d) hd' i x = dividedFrobenius P d hd i x := by
  sorry

/-- The filtered Frobenius `Fil^i_N B → J^i`, defined without an orientation. -/
noncomputable def frobeniusFil (i : ℕ) : fil P i →+ ↥(P.I ^ i) := sorry

/-- The twisted divided Frobenius `φ_i : Fil^i_N B ⊗ B{i} → B{i}`. -/
noncomputable def twistedDividedFrobenius (i : ℕ) :
    (fil P i ⊗[B] BKTwist.twistPow P (i : ℤ)) →+ BKTwist.twistPow P (i : ℤ) := sorry

-- pr3_divided_frobenius_zero
example (d : B) (hd : P.I = Ideal.span {d}) (x : fil P 0) :
    dividedFrobenius P d hd 0 x = P.φ x := by sorry

-- pr3_divided_frobenius_perfect
example (hP : P.IsPerfect) (d e : B) (hd : P.I = Ideal.span {d}) (he : P.φ e = d) (i : ℕ)
    (a : B) (h : e ^ i * a ∈ fil P i) :
    dividedFrobenius P d hd i ⟨e ^ i * a, h⟩ = P.φ a := by sorry

-- pr3_divided_frobenius_crystalline
example (hφ : P.φ = RingHom.id B) (hd : P.I = Ideal.span {(p : B)}) (i : ℕ) (a : B)
    (h : (p : B) ^ i * a ∈ fil P i) :
    dividedFrobenius P (p : B) hd i ⟨(p : B) ^ i * a, h⟩ = a := by sorry

-- pr3_divided_frobenius_kernel
example (d : B) (hd : P.I = Ideal.span {d}) (i : ℕ) (x y : fil P i)
    (h : Ideal.Quotient.mk P.I (dividedFrobenius P d hd i x) =
      Ideal.Quotient.mk P.I (dividedFrobenius P d hd i y)) :
    (x : B) - y ∈ fil P (i + 1) := by sorry

-- pr3_divided_frobenius_not_multiplicative
example (d : B) (hd : P.I = Ideal.span {d}) (x y : fil P 1) (h : (x : B) * y ∈ fil P 1) :
    dividedFrobenius P d hd 1 ⟨(x : B) * y, h⟩ =
      d * (dividedFrobenius P d hd 1 x * dividedFrobenius P d hd 1 y) := by sorry

/-! ### Nygaard completion (node `PR.3/nygaard-completion`) -/

/-- `B̂ = lim_i B / Fil^i_N B`, as the subring of compatible families. -/
noncomputable def completion : Subring (∀ i : ℕ, B ⧸ fil P i) := sorry

theorem mem_completion_iff (x : ∀ i : ℕ, B ⧸ fil P i) :
    x ∈ completion P ↔
      ∀ i j (h : i ≤ j), Ideal.Quotient.factor (fil_antitone P h) (x j) = x i := by sorry

/-- The canonical map `c : B → B̂`. -/
noncomputable def toCompletion : B →+* completion P := sorry

theorem toCompletion_apply (x : B) (i : ℕ) :
    (toCompletion P x : ∀ i : ℕ, B ⧸ fil P i) i = Ideal.Quotient.mk (fil P i) x := by sorry

theorem ker_toCompletion : RingHom.ker (toCompletion P) = ⨅ i, fil P i := by sorry

/-- The projection `B̂ → B / Fil^i_N B`. -/
noncomputable def completionProj (i : ℕ) : completion P →+* B ⧸ fil P i := sorry

theorem completionProj_surjective (i : ℕ) : Function.Surjective (completionProj P i) := by
  sorry

/-- `Fil^i_N B̂ = ker(B̂ → B / Fil^i_N B)`. -/
noncomputable def completionFil (i : ℕ) : Ideal (completion P) :=
  RingHom.ker (completionProj P i)

/-- The Frobenius of the completion factors through `B`: `φ̂ : B̂ → B`. -/
noncomputable def completionFrobenius [IsAdicComplete P.I B] : completion P →+* B := sorry

theorem completionFrobenius_toCompletion [IsAdicComplete P.I B] (x : B) :
    completionFrobenius P (toCompletion P x) = P.φ x := by sorry

/-- `B` is Nygaard-complete when `c : B → B̂` is bijective. -/
def IsNygaardComplete : Prop := Function.Bijective (toCompletion P)

-- pr3_completion_perfect
example (hP : P.IsPerfect) (d : B) (hd : P.I = Ideal.span {d})
    [IsAdicComplete (P.I ⊔ Ideal.span {(p : B)}) B] : IsNygaardComplete P := by sorry

-- pr3_completion_quotient
example (i : ℕ) : Function.Surjective (completionProj P i) ∧
    (completionFil P i).comap (toCompletion P) = fil P i := by sorry

-- pr3_completion_frobenius
example [IsAdicComplete P.I B] (x : B) :
    completionFrobenius P (toCompletion P x) = P.φ x := by sorry

-- pr3_completion_not_surjective
example : ¬ ∀ (D : Type) [CommRing D] (Q : Prism p D), Function.Surjective (toCompletion Q) := by
  sorry

/-- Node `PR.3/bms2-comparison` (Bhatt–Scholze Lemma 13.2 (1)), for the prism of a quasiregular
semiperfectoid ring; that hypothesis (PR.2) is not stated here. -/
theorem delta_fil_le (d : B) (hd : P.I = Ideal.span {d}) (i : ℕ) (x : B)
    (hx : x ∈ fil P (i + 1)) :
    P.δ.delta x ∈ fil P (p * (i + 1)) ⊔ Ideal.span {d, (p : B)} ^ i := by sorry

end Ideals

/-! ### The key case (node `PR.3/nygaard-key-case`) -/

/-- The identity behind Bhatt–Scholze Lemma 12.6 (1): `[i n]_q = [i]_{q^n} [n]_q`. -/
theorem qNumber_mul {R : Type*} [CommRing R] (q : R) (i n : ℕ) :
    ∑ j ∈ Finset.range (i * n), q ^ j =
      (∑ j ∈ Finset.range i, (q ^ n) ^ j) * ∑ j ∈ Finset.range n, q ^ j := by sorry

/-! ### Graded pieces on a quasiregular semiperfectoid ring -/

/-- Imported data of a quasiregular semiperfectoid ring `S` (owner: PR.2, nodes `qrsp-prism` and
`derived-hodge-tate-comparison`). -/
structure QrspData (p : ℕ) [Fact p.Prime] (S : Type u) [CommRing S] where
  /-- The ring `Δ_S` underlying the initial prism of `S` (PR.2). -/
  D : Type u
  /-- Its ring structure (PR.2). -/
  [commRing : CommRing D]
  /-- The prism `(Δ_S, I Δ_S)` (PR.2). -/
  prism : Prism p D
  /-- The structure map `S → Δ̄_S` (PR.2). -/
  toBar : S →+* D ⧸ prism.I
  /-- The conjugate filtration `Fil_i Δ̄_S` relative to a perfectoid ring mapping to `S` (PR.2). -/
  conj : ℕ → AddSubgroup (D ⧸ prism.I)

attribute [instance] QrspData.commRing

/-- Node `PR.3/nygaard-graded-pieces` (Bhatt–Scholze Theorem 12.2): the image of `φ / d^i` in
`Δ̄_S` is the conjugate filtration. -/
theorem range_dividedFrobenius_eq_conj {S : Type u} [CommRing S] (X : QrspData p S) (d : X.D)
    (hd : X.prism.I = Ideal.span {d}) (i : ℕ) :
    Set.range (fun x : fil X.prism i =>
        Ideal.Quotient.mk X.prism.I (dividedFrobenius X.prism d hd i x)) =
      (X.conj i : Set (X.D ⧸ X.prism.I)) := by sorry

/-- Node `PR.3/nygaard-graded-pieces` (3): `Δ_S / Fil^1_N Δ_S ≅ S`, induced by `φ`. -/
theorem quotient_fil_one_equiv {S : Type u} [CommRing S] (X : QrspData p S) :
    ∃ e : (X.D ⧸ fil X.prism 1) ≃+* S, ∀ x : X.D,
      X.toBar (e (Ideal.Quotient.mk _ x)) = Ideal.Quotient.mk X.prism.I (X.prism.φ x) := by
  sorry

section Relative

variable {A : Type u} [CommRing A] (P : Prism p A)

/-! ### Large quasisyntomic algebras (node `PR.3/large-quasisyntomic-algebra`) -/

/-- `x` has a compatible system of `p`-power roots. -/
def HasCompatibleRoots {S : Type*} [CommRing S] (x : S) : Prop :=
  ∃ f : ℕ → S, f 0 = x ∧ ∀ n, f (n + 1) ^ p = f n

/-- Bhatt–Scholze Definition 15.1 for `p`-complete `S`: `S / p` is generated over `A / I` by
elements with compatible `p`-power roots. Quasisyntomicity (DD.5) is not part of the predicate. -/
def IsLarge (S : Type u) [CommRing S] [Algebra P.bar S] : Prop :=
  ∀ s : S, ∃ t ∈ Algebra.adjoin P.bar {x : S | HasCompatibleRoots (p := p) x},
    s - t ∈ Ideal.span {(p : S)}

theorem isLarge_iff_exists_family (S : Type u) [CommRing S] [Algebra P.bar S] :
    IsLarge P S ↔ ∃ (T : Type u) (x : T → S), (∀ t, HasCompatibleRoots (p := p) (x t)) ∧
      ∀ s : S, ∃ y ∈ Algebra.adjoin P.bar (Set.range x), s - y ∈ Ideal.span {(p : S)} := by
  sorry

theorem IsLarge.of_surjective {S S' : Type u} [CommRing S] [CommRing S'] [Algebra P.bar S]
    [Algebra P.bar S'] (h : IsLarge P S) (f : S →ₐ[P.bar] S') (hf : Function.Surjective f) :
    IsLarge P S' := by sorry

theorem IsLarge.kaehler_eq_smul {S : Type u} [CommRing S] [Algebra P.bar S] (h : IsLarge P S)
    (ω : Ω[S⁄P.bar]) : ∃ ω' : Ω[S⁄P.bar], ω = (p : S) • ω' := by sorry

theorem isLarge_bar : IsLarge P P.bar := by sorry

-- pr3_large_base
example : IsLarge P P.bar := by sorry

-- pr3_large_generated_by_roots
example (S : Type u) [CommRing S] [Algebra P.bar S] (T : Type u) (x : T → S)
    (hx : ∀ t, HasCompatibleRoots (p := p) (x t))
    (hgen : Algebra.adjoin P.bar (Set.range x) = ⊤) : IsLarge P S := by sorry

-- pr3_large_kaehler
example (S : Type u) [CommRing S] [Algebra P.bar S] (h : IsLarge P S) (s : S) :
    ∃ ω' : Ω[S⁄P.bar], KaehlerDifferential.D P.bar S s = (p : S) • ω' := by sorry

-- pr3_large_not_polynomial
example (hp : ¬ IsUnit (p : P.bar)) : ¬ IsLarge P (Polynomial P.bar) := by sorry

/-! ### The relative Nygaard filtration (node `PR.3/relative-nygaard-filtration`) -/

variable (R : Type u) [CommRing R] [Algebra P.bar R]

/-- The Frobenius twist `φ_A^* Δ_{R/A}`: the derived `(p, I)`-completed base change of
`Δ_{R/A}` along `φ_A` (completion from DD.1). -/
noncomputable def frobeniusTwist (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] :
    DerivedCategory (ModuleCat.{u} A) := sorry

/-- The `A`-linear relative Frobenius `φ_A^* Δ_{R/A} → Δ_{R/A}`. -/
noncomputable def relativeFrobenius : frobeniusTwist P R ⟶ prismaticCohomology P R := sorry

/-- The relative Nygaard filtration `i ↦ Fil^i_N φ_A^* Δ_{R/A}` (Bhatt–Scholze §15.1,
Bhatt–Lurie Proposition 5.1.1), as a diagram indexed by `(ℕ, ≥)`. -/
noncomputable def relFil (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] :
    ℕᵒᵖ ⥤ DerivedCategory (ModuleCat.{u} A) := sorry

noncomputable def relFilZeroIso : (relFil P R).obj (Opposite.op 0) ≅ frobeniusTwist P R := sorry

/-- The graded piece `gr^i_N φ_A^* Δ_{R/A}`. -/
noncomputable def relGr (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] (i : ℕ) :
    DerivedCategory (ModuleCat.{u} A) := sorry

theorem relGr_triangle (i : ℕ) :
    ∃ (g : (relFil P R).obj (Opposite.op i) ⟶ relGr P R i)
      (h : relGr P R i ⟶ ((relFil P R).obj (Opposite.op (i + 1)))⟦(1 : ℤ)⟧),
      Pretriangulated.Triangle.mk ((relFil P R).map (homOfLE (Nat.le_add_right i 1)).op) g h ∈
        distTriang (DerivedCategory (ModuleCat.{u} A)) := by sorry

/-- Functoriality in `R`. -/
noncomputable def relFilMap {R' : Type u} [CommRing R'] [Algebra P.bar R'] (f : R →ₐ[P.bar] R') :
    relFil P R ⟶ relFil P R' := sorry

/-- Bhatt–Lurie Example 5.1.4: for `R = A / I` the filtration is `I^i ⊂ A`. -/
theorem relFil_bar (i : ℕ) :
    Nonempty ((relFil P P.bar).obj (Opposite.op i) ≅
      (DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A ↥(P.I ^ i))) := by
  sorry

/-- Bhatt–Scholze Theorem 15.2: on a large quasisyntomic algebra (quasisyntomicity, DD.5, is
left out) the pieces are discrete. -/
theorem relFil_large (h : IsLarge P R) (i : ℕ) :
    ∃ M : ModuleCat.{u} A, Nonempty ((relFil P R).obj (Opposite.op i) ≅
      (DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj M) := by sorry

/-- Imported data of a change of prism (owners: PR.1 for the base-changed algebra, DD.1 for the
completed derived base change). -/
structure ChangeOfPrism {B : Type u} [CommRing B] (Q : Prism p B) where
  /-- The map of prisms (PR.0). -/
  hom : P.Hom Q
  /-- The completed derived base change `B ⊗̂^L_A −` (DD.1). -/
  baseChange : DerivedCategory (ModuleCat.{u} A) ⥤ DerivedCategory (ModuleCat.{u} B)
  /-- The base-changed algebra `R_B`, the `p`-completion of `R ⊗_A B` (PR.1). -/
  R' : Type u
  /-- Its ring structure. -/
  [commRing : CommRing R']
  /-- Its structure of `B / J`-algebra. -/
  [algebra : Algebra Q.bar R']

attribute [instance] ChangeOfPrism.commRing ChangeOfPrism.algebra

/-- Bhatt–Lurie Remark 5.1.10: the filtration commutes with change of prism. -/
theorem relFilBaseChange {B : Type u} [CommRing B] {Q : Prism p B} (c : ChangeOfPrism P Q)
    (i : ℕ) :
    Nonempty (c.baseChange.obj ((relFil P R).obj (Opposite.op i)) ≅
      (relFil Q c.R').obj (Opposite.op i)) := by sorry

-- pr3_rel_fil_zero
example : Nonempty ((relFil P R).obj (Opposite.op 0) ≅ frobeniusTwist P R) := by sorry

-- pr3_rel_fil_base
example (i : ℕ) : Nonempty ((relFil P P.bar).obj (Opposite.op i) ≅
    (DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A ↥(P.I ^ i))) := by
  sorry

-- pr3_rel_gr_zero_base
example : Nonempty (relGr P P.bar 0 ≅
    (DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A (A ⧸ P.I))) := by
  sorry

-- pr3_rel_fil_needs_twist
example : ¬ ∀ (D : Type) [CommRing D] (Q : Prism p D), fil Q 1 = Q.I := by sorry

/-! ### Over a perfect prism (node `PR.3/nygaard-filtration`) -/

/-- The Nygaard filtration `i ↦ Fil^i_N Δ_{R/A}` on derived prismatic cohomology over a perfect
prism (Bhatt–Scholze §§12.4–12.5). The statements below are for `P` perfect. -/
noncomputable def filDerived (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] :
    ℕᵒᵖ ⥤ DerivedCategory (ModuleCat.{u} A) := sorry

noncomputable def filDerivedZeroIso :
    (filDerived P R).obj (Opposite.op 0) ≅ prismaticCohomology P R := sorry

/-- The graded piece `gr^i_N Δ_{R/A}`. -/
noncomputable def grDerived (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] (i : ℕ) :
    DerivedCategory (ModuleCat.{u} A) := sorry

noncomputable def filDerivedMap {R' : Type u} [CommRing R'] [Algebra P.bar R']
    (f : R →ₐ[P.bar] R') : filDerived P R ⟶ filDerived P R' := sorry

/-- Imported data for the comparison theorems of the layer (owner named at each field). -/
structure Inputs where
  /-- `Lη_I` on `D(A)` (AInfCohomology:AI.1). -/
  Leta : DerivedCategory (ModuleCat.{u} A) ⥤ DerivedCategory (ModuleCat.{u} A)
  /-- The canonical map `Lη_I Δ_{R/A} → Δ_{R/A}` (AI.1; BMS1 Lemma 6.10). -/
  letaToSelf : Leta.obj (prismaticCohomology P R) ⟶ prismaticCohomology P R
  /-- Derived reduction `− ⊗^L_A A / I` (DD.1). -/
  reduction : DerivedCategory (ModuleCat.{u} A) ⥤ DerivedCategory (ModuleCat.{u} P.bar)
  /-- The `p`-completed de Rham complex of `R` over `A / I`, derived in general (DD.2). -/
  deRham : DerivedCategory (ModuleCat.{u} P.bar)
  /-- `Fil_i^conj Δ̄_{R/A}{i}` as an object of `D(A)` (PR.2). -/
  conjTwist : ℕ → DerivedCategory (ModuleCat.{u} A)
  /-- `Fil^i_Hodge` of the derived de Rham complex, as an object of `D(A)` (DD.2). -/
  hodgeFil : ℕ → DerivedCategory (ModuleCat.{u} A)
  /-- `I ⊗_A −` on `D(A)` (exact, as `I` is invertible). -/
  tensorI : DerivedCategory (ModuleCat.{u} A) ⥤ DerivedCategory (ModuleCat.{u} A)
  /-- The site of quasisyntomic covers: `Čech` totalisation of a functor along a cover is left
  to DD.5; recorded here is the sheafified value of `Fil^i_N` on `R` (DD.5). -/
  unfold : ℕ → DerivedCategory (ModuleCat.{u} A)

variable {P R}

/-- Bhatt–Scholze Proposition 12.10 and §12.5: `gr^i_N Δ_{R/A} ≅ φ_* Fil_i^conj Δ̄_{R/A}{i}`
(the isomorphism induced by `φ / d^i` is `φ_A`-semilinear). -/
theorem grDerivedIsoConj (X : Inputs P R) (hP : P.IsPerfect) (i : ℕ) :
    Nonempty (grDerived P R i ≅ (frobeniusPushforward P).obj (X.conjTwist i)) := by sorry

/-- For `R` `p`-completely smooth (condition left out) the graded piece lives in degrees
`[0, i]`: it is `τ^{≤ i} Δ̄_{R/A}{i}`. -/
theorem grDerived_smooth (hP : P.IsPerfect) (i : ℕ) (n : ℤ) (hn : (i : ℤ) < n) :
    Limits.IsZero ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) n).obj
      (grDerived P R i)) := by sorry

/-- Quasisyntomic descent for `Fil^i_N` (the cover and its Čech nerve belong to DD.5). -/
theorem filDerived_isSheaf (X : Inputs P R) (hP : P.IsPerfect) (i : ℕ) :
    Nonempty ((filDerived P R).obj (Opposite.op i) ≅ X.unfold i) := by sorry

-- pr3_nygaard_derived_fil_zero
example : Nonempty ((filDerived P R).obj (Opposite.op 0) ≅ prismaticCohomology P R) := by sorry

-- pr3_nygaard_derived_gr_zero
example (hP : P.IsPerfect) (n : ℤ) (hn : 0 < n) :
    Limits.IsZero ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) n).obj
      (grDerived P P.bar 0)) := by sorry

-- pr3_nygaard_derived_base
example (hP : P.IsPerfect) (i : ℕ) : Nonempty (grDerived P P.bar i ≅
    (frobeniusPushforward P).obj ((DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj
      (ModuleCat.of A ((P.I ^ i : Ideal A) ⧸ (P.I • ⊤ : Submodule A ↥(P.I ^ i)))))) := by
  sorry

-- pr3_nygaard_derived_not_truncation
example (hP : P.IsPerfect) (hA : Nontrivial P.bar) : ¬ Nonempty (grDerived P P.bar 0 ≅
    (DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A A)) := by sorry

/-! ### Named theorems of the layer -/

/-- Node `PR.3/relative-nygaard-graded-pieces` (Bhatt–Lurie Remark 5.1.2). -/
theorem relGr_iso_conj (X : Inputs P R) (i : ℕ) : Nonempty (relGr P R i ≅ X.conjTwist i) := by
  sorry

/-- Node `PR.3/leta-frobenius-factorisation` (Bhatt–Scholze Theorem 15.3), for `R`
`p`-completely smooth over `A / I` and `(A, I)` bounded (conditions left out). -/
theorem leta_frobenius_factorisation (X : Inputs P R) :
    ∃ φt : frobeniusTwist P R ⟶ X.Leta.obj (prismaticCohomology P R),
      IsIso φt ∧ φt ≫ X.letaToSelf = relativeFrobenius P R := by sorry

/-- Node `PR.3/de-rham-comparison-general` (Bhatt–Scholze Corollary 15.4; Bhatt–Lurie
Proposition 5.2.5), for a bounded prism. -/
theorem de_rham_comparison_general (X : Inputs P R) :
    Nonempty (X.reduction.obj (frobeniusTwist P R) ≅ X.deRham) := by sorry

/-- Node `PR.3/nygaard-hodge-comparison` (Bhatt–Lurie Corollary 5.2.8): a distinguished triangle
`I ⊗ Fil^i_N → Fil^{i+1}_N → Fil^{i+1}_Hodge`. -/
theorem nygaard_hodge_triangle (X : Inputs P R) (i : ℕ) :
    ∃ (v : X.tensorI.obj ((relFil P R).obj (Opposite.op i)) ⟶
        (relFil P R).obj (Opposite.op (i + 1)))
      (γ : (relFil P R).obj (Opposite.op (i + 1)) ⟶ X.hodgeFil (i + 1))
      (h : X.hodgeFil (i + 1) ⟶ (X.tensorI.obj ((relFil P R).obj (Opposite.op i)))⟦(1 : ℤ)⟧),
      Pretriangulated.Triangle.mk v γ h ∈ distTriang (DerivedCategory (ModuleCat.{u} A)) := by
  sorry

/-- Node `PR.3/image-of-frobenius` (Bhatt–Scholze Corollary 15.5) on cohomology, for an
oriented bounded prism and `R` `p`-completely smooth: `V_i` with `V_i φ = φ V_i = d^i`. -/
theorem image_of_frobenius (d : A) (hd : P.I = Ideal.span {d}) (i : ℕ) :
    ∃ V : (DerivedCategory.homologyFunctor (ModuleCat.{u} A) (i : ℤ)).obj
          (prismaticCohomology P R) ⟶
        (DerivedCategory.homologyFunctor (ModuleCat.{u} A) (i : ℤ)).obj (frobeniusTwist P R),
      (∀ x, V.hom (((DerivedCategory.homologyFunctor (ModuleCat.{u} A) (i : ℤ)).map
        (relativeFrobenius P R)).hom x) = d ^ i • x) ∧
      (∀ y, ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) (i : ℤ)).map
        (relativeFrobenius P R)).hom (V.hom y) = d ^ i • y) := by sorry

/-- Node `PR.3/nygaard-frobenius-colimit` (Bhatt–Lurie Corollary 5.2.16), smooth case: for an
oriented prism and `R` `p`-completely smooth of dimension `≤ n` the composite
`Fil^n_N φ_A^* Δ → φ_A^* Δ → Δ` is `d^n` times an isomorphism; stated on cohomology. -/
theorem frobenius_fil_top (d : A) (hd : P.I = Ideal.span {d}) (n : ℕ) (m : ℤ) :
    ∃ e : (DerivedCategory.homologyFunctor (ModuleCat.{u} A) m).obj
          ((relFil P R).obj (Opposite.op n)) ≅
        (DerivedCategory.homologyFunctor (ModuleCat.{u} A) m).obj (prismaticCohomology P R),
      ∀ x, ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) m).map
          ((relFil P R).map (homOfLE (Nat.zero_le n)).op ≫ (relFilZeroIso P R).hom ≫
            relativeFrobenius P R)).hom x = d ^ n • e.hom.hom x := by sorry

/-- Node `PR.3/nygaard-completeness` (2): a perfect prism that is classically
`(p, I)`-complete is Nygaard-complete. -/
theorem isNygaardComplete_of_perfect (hP : P.IsPerfect) (d : A) (hd : P.I = Ideal.span {d})
    [IsAdicComplete (P.I ⊔ Ideal.span {(p : A)}) A] : IsNygaardComplete P := by sorry

end Relative

end TauCeti.Prismatic.Nygaard


/-! ## PR.4. Étale comparison and p-adic Tate twists

Derived Frobenius fixed points, syntomic complexes and their comparisons. Objects owned by
other stages or roadmaps (derived prismatic cohomology with its Frobenius, Nygaard-filtered
twisted prismatic complexes, the Breuil–Kisin twist, étale cohomology) enter as variables or
as fields of structures of imported data; the docstrings name their owners. A complex is a
cochain complex of modules or an object of Mathlib's derived category, the 1-categorical
shadow of the derived ∞-category of the sources; fibres are shifted mapping cones. -/

namespace TauCeti.Prismatic.Etale

open CategoryTheory CategoryTheory.Limits

attribute [local instance] HasDerivedCategory.standard

universe u

/-- Node `PR.4/frobenius-fixed-points`: a φ-module over a coefficient ring `Λ`, namely a
cochain complex of `Λ`-modules with an endomorphism. It models an object `(M, φ_M)` of
`D(B[F])` after restriction of scalars to `Λ ⊆ B^{σ = 1}`; the `B`-module structure and the
semilinearity of `φ_M` are not recorded. -/
structure FrobeniusModule (Λ : Type u) [CommRing Λ] where
  /-- The underlying complex. -/
  K : CochainComplex (ModuleCat.{u} Λ) ℤ
  /-- The Frobenius, as a `Λ`-linear endomorphism. -/
  φ : K ⟶ K

variable {Λ : Type u} [CommRing Λ]

/-- A map of φ-modules: a chain map commuting with the Frobenius endomorphisms. -/
structure FrobeniusModule.Hom (M N : FrobeniusModule Λ) where
  /-- The underlying chain map. -/
  f : M.K ⟶ N.K
  /-- It commutes with `φ`. -/
  comm : M.φ ≫ f = f ≫ N.φ

/-- Node `PR.4/frobenius-fixed-points`: the derived fixed points
`M^{φ=1} = fib(φ_M - 1 : M ⟶ M)`, the mapping cone of `φ - 1` shifted by `-1`. -/
noncomputable def fixedPoints (M : FrobeniusModule Λ) : DerivedCategory (ModuleCat.{u} Λ) :=
  (DerivedCategory.Q.obj (CochainComplex.mappingCone (M.φ - 𝟙 M.K)))⟦(-1 : ℤ)⟧

/-- The canonical map `M^{φ=1} ⟶ M`. -/
noncomputable def fixedPointsι (M : FrobeniusModule Λ) :
    fixedPoints M ⟶ DerivedCategory.Q.obj M.K := sorry

/-- A map of φ-modules induces a map of fixed points. -/
noncomputable def fixedPointsMap {M N : FrobeniusModule Λ} (g : M.Hom N) :
    fixedPoints M ⟶ fixedPoints N := sorry

theorem fixedPointsι_comp (M : FrobeniusModule Λ) :
    fixedPointsι M ≫ DerivedCategory.Q.map (M.φ - 𝟙 M.K) = 0 := sorry

theorem fixedPointsMap_isIso {M N : FrobeniusModule Λ} (g : M.Hom N)
    (h : IsIso (DerivedCategory.Q.map g.f)) : IsIso (fixedPointsMap g) := sorry

/-- Fixed points of a complex in degrees `≥ a` are in degrees `≥ a`. -/
theorem fixedPoints_isGE (M : FrobeniusModule Λ) (a : ℤ)
    (h : (DerivedCategory.Q.obj M.K).IsGE a) : (fixedPoints M).IsGE a := sorry

/-- Fixed points of a complex in degrees `≤ b` are in degrees `≤ b + 1`: the term
`coker (φ - 1)` appears one degree higher. -/
theorem fixedPoints_isLE (M : FrobeniusModule Λ) (b : ℤ)
    (h : (DerivedCategory.Q.obj M.K).IsLE b) : (fixedPoints M).IsLE (b + 1) := sorry

theorem fixedPoints_isZero_of_isIso (M : FrobeniusModule Λ) :
    IsZero (fixedPoints M) ↔ IsIso (DerivedCategory.Q.map (M.φ - 𝟙 M.K)) := sorry

/-- The φ-module `M[1/t]` for an endomorphism `t` of the underlying complex (multiplication
by an element `t` of `B`) with `φ ∘ t = t ^ p ∘ φ`: the colimit of `M` along `t`, with the
induced Frobenius. -/
noncomputable def invert (p : ℕ) (M : FrobeniusModule Λ) (t : End M.K)
    (ht : (show M.K ⟶ M.K from t) ≫ M.φ = M.φ ≫ (show M.K ⟶ M.K from t ^ p)) :
    FrobeniusModule Λ := sorry

/-- The φ-module `M / p ^ n = cone (p ^ n : M ⟶ M)` with the induced Frobenius. -/
noncomputable def reduce (p n : ℕ) (M : FrobeniusModule Λ) : FrobeniusModule Λ := sorry

/-- `(M / p ^ n)^{φ=1}` is the cone of `p ^ n` on `M^{φ=1}`: there is a map from `M^{φ=1}`
whose composite with multiplication by `p ^ n` vanishes. -/
theorem reduce_fixedPoints (p n : ℕ) (M : FrobeniusModule Λ) :
    ∃ r : fixedPoints M ⟶ fixedPoints (reduce p n M),
      ((p ^ n : ℤ) • 𝟙 (fixedPoints M)) ≫ r = 0 := sorry

-- pr4_fixed_points_fp_h1
example (p : ℕ) [Fact p.Prime] :
    Nonempty ((DerivedCategory.homologyFunctor (ModuleCat.{0} (ZMod p)) 1).obj
        (fixedPoints (Λ := ZMod p)
          ⟨(HomologicalComplex.single (ModuleCat.{0} (ZMod p)) (ComplexShape.up ℤ) 0).obj
            (ModuleCat.of (ZMod p) (ZMod p)), 𝟙 _⟩) ≅
      ModuleCat.of (ZMod p) (ZMod p)) := sorry

-- pr4_fixed_points_zero_map
example (M : FrobeniusModule Λ) (h : M.φ = 0) : IsZero (fixedPoints M) := sorry

-- pr4_fixed_points_identity
example (M : FrobeniusModule Λ) (h : M.φ = 𝟙 M.K) :
    Nonempty ((DerivedCategory.homologyFunctor (ModuleCat.{u} Λ) 1).obj (fixedPoints M) ≅
      (HomologicalComplex.homologyFunctor (ModuleCat.{u} Λ) (ComplexShape.up ℤ) 1).obj M.K ⊞
        (HomologicalComplex.homologyFunctor (ModuleCat.{u} Λ) (ComplexShape.up ℤ) 0).obj M.K) :=
  sorry

-- pr4_fixed_points_not_fixed_vectors
example (p : ℕ) [Fact p.Prime]
    (F : ModuleCat.of (ZMod p) (Polynomial (ZMod p)) ⟶ ModuleCat.of (ZMod p) (Polynomial (ZMod p)))
    (hF : ∀ x : Polynomial (ZMod p), F.hom x = x ^ p) :
    ¬ IsZero ((DerivedCategory.homologyFunctor (ModuleCat.{0} (ZMod p)) 1).obj
      (fixedPoints (Λ := ZMod p)
        ⟨(HomologicalComplex.single (ModuleCat.{0} (ZMod p)) (ComplexShape.up ℤ) 0).obj
          (ModuleCat.of (ZMod p) (Polynomial (ZMod p))),
         (HomologicalComplex.single (ModuleCat.{0} (ZMod p)) (ComplexShape.up ℤ) 0).map F⟩)) :=
  sorry

/-- Imported data for the affine étale comparison at level `p ^ n`, for a `p`-complete
algebra `S` over a perfectoid ring with perfect prism `(A, (d))`. -/
structure AffineComparisonDatum (p n : ℕ) where
  /-- `RΓ_ét(Spec S[1/p], ℤ/p^n)` (owner: `SchemeAndStackFoundations:SF.2`). -/
  etaleGeneric : DerivedCategory (ModuleCat.{0} (ZMod (p ^ n)))
  /-- `RΓ_ét(Spec S, ℤ/p^n)` (owner: `SchemeAndStackFoundations:SF.2`). -/
  etaleIntegral : DerivedCategory (ModuleCat.{0} (ZMod (p ^ n)))
  /-- `Δ_{S/A} / p^n` with its Frobenius (owners: PR.2, PR.1). -/
  prismatic : FrobeniusModule (ZMod (p ^ n))
  /-- `Δ_{S/A}[1/d] / p^n` with its Frobenius (owners: PR.2, PR.1). -/
  prismaticInverted : FrobeniusModule (ZMod (p ^ n))

/-- Node `PR.4/etale-comparison` (Bhatt–Scholze Theorem 9.1, affine form):
`RΓ_ét(Spec S[1/p], ℤ/p^n) ≃ (Δ_{S/A}[1/d]/p^n)^{φ=1}` for every `p`-complete algebra `S`
over a perfectoid ring; no smoothness hypothesis. -/
theorem etaleComparison_affine (p n : ℕ) [Fact p.Prime] (X : AffineComparisonDatum p n) :
    Nonempty (X.etaleGeneric ≅ fixedPoints X.prismaticInverted) := sorry

/-- Node `PR.4/etale-comparison-without-inverting-d` (Bhatt–Scholze Remark 9.3, affine form):
`RΓ_ét(Spec S, ℤ/p^n) ≃ (Δ_{S/A}/p^n)^{φ=1}`. -/
theorem etaleComparison_integral (p n : ℕ) [Fact p.Prime] (X : AffineComparisonDatum p n) :
    Nonempty (X.etaleIntegral ≅ fixedPoints X.prismatic) := sorry

end TauCeti.Prismatic.Etale

namespace TauCeti.Prismatic.Syntomic

open CategoryTheory CategoryTheory.Limits CategoryTheory.Pretriangulated ZeroObject

attribute [local instance] HasDerivedCategory.standard

universe u

section Complexes

variable (p : ℕ) [Fact p.Prime]

/-- Node `PR.4/syntomic-complex`: the imported data of a ring in a fixed weight `n`. -/
structure NygaardDatum where
  /-- `Δ̂_S{n}`, a complex of `ℤ_p`-modules (owners: `PR.3/nygaard-completion`,
  `PR.3/breuil-kisin-twist`). -/
  twisted : CochainComplex (ModuleCat.{0} ℤ_[p]) ℤ
  /-- `N^{≥n} Δ̂_S{n}` (owner: `PR.3/nygaard-filtration`). -/
  fil : CochainComplex (ModuleCat.{0} ℤ_[p]) ℤ
  /-- The canonical map of the filtration. -/
  can : fil ⟶ twisted
  /-- The divided Frobenius `φ_n` (owner: `PR.3/divided-frobenius`). -/
  divFrob : fil ⟶ twisted

/-- A map of weight-`n` data: chain maps compatible with `can` and `φ_n`. -/
structure NygaardDatum.Hom (D E : NygaardDatum p) where
  /-- On the filtration step. -/
  fFil : D.fil ⟶ E.fil
  /-- On the twisted complex. -/
  fTw : D.twisted ⟶ E.twisted
  /-- Compatibility with the canonical maps. -/
  can_comm : D.can ≫ fTw = fFil ≫ E.can
  /-- Compatibility with the divided Frobenius. -/
  frob_comm : D.divFrob ≫ fTw = fFil ≫ E.divFrob

variable {p}

/-- Node `PR.4/syntomic-complex`: `ℤ_p(n)(S) = fib(φ_n - can : N^{≥n} Δ̂_S{n} ⟶ Δ̂_S{n})`. -/
noncomputable def syntomicComplex (D : NygaardDatum p) :
    DerivedCategory (ModuleCat.{0} ℤ_[p]) :=
  (DerivedCategory.Q.obj (CochainComplex.mappingCone (D.divFrob - D.can)))⟦(-1 : ℤ)⟧

/-- `ℤ/p^r(n)(S)`: the cone of `p ^ r` on the complex computing `ℤ_p(n)(S)`. -/
noncomputable def syntomicComplexMod (D : NygaardDatum p) (r : ℕ) :
    DerivedCategory (ModuleCat.{0} ℤ_[p]) :=
  (DerivedCategory.Q.obj (CochainComplex.mappingCone
    ((p ^ r : ℤ) • 𝟙 (CochainComplex.mappingCone (D.divFrob - D.can)))))⟦(-1 : ℤ)⟧

/-- The canonical map `ℤ_p(n)(S) ⟶ N^{≥n} Δ̂_S{n}` of the defining fibre sequence. -/
noncomputable def syntomicToFil (D : NygaardDatum p) :
    syntomicComplex D ⟶ DerivedCategory.Q.obj D.fil := sorry

/-- Functoriality of the syntomic complex. -/
noncomputable def syntomicMap {D E : NygaardDatum p} (g : NygaardDatum.Hom p D E) :
    syntomicComplex D ⟶ syntomicComplex E := sorry

theorem syntomicMap_isIso {D E : NygaardDatum p} (g : NygaardDatum.Hom p D E)
    (h₁ : IsIso (DerivedCategory.Q.map g.fFil)) (h₂ : IsIso (DerivedCategory.Q.map g.fTw)) :
    IsIso (syntomicMap g) := sorry

theorem syntomicComplex_isGE (D : NygaardDatum p)
    (h₁ : (DerivedCategory.Q.obj D.fil).IsGE 0) (h₂ : (DerivedCategory.Q.obj D.twisted).IsGE 0) :
    (syntomicComplex D).IsGE 0 := sorry

/-- For discrete data (a quasiregular semiperfectoid ring) the complex lives in degrees
`0` and `1`. -/
theorem syntomicComplex_isLE (D : NygaardDatum p)
    (h₁ : (DerivedCategory.Q.obj D.fil).IsLE 0) (h₂ : (DerivedCategory.Q.obj D.twisted).IsLE 0) :
    (syntomicComplex D).IsLE 1 := sorry

/-- The datum of a perfectoid ring with perfect prism `(A, (d))` in weight `n`: the
submodule `φ⁻¹(d)^n A = {x | φ x ∈ d ^ n A}` and `A`, the inclusion and `x ↦ φ x / d ^ n`,
placed in degree `0`. -/
noncomputable def perfectoidDatum {A : Type} [CommRing A] [Algebra ℤ_[p] A] (P : Prism p A)
    (d : A) (n : ℕ) : NygaardDatum p := sorry

-- pr4_syntomic_zero_weight_fp
example :
    Nonempty ((DerivedCategory.homologyFunctor (ModuleCat.{0} ℤ_[p]) 1).obj
        (syntomicComplex (p := p)
          ⟨(HomologicalComplex.single (ModuleCat.{0} ℤ_[p]) (ComplexShape.up ℤ) 0).obj
              (ModuleCat.of ℤ_[p] ℤ_[p]),
            (HomologicalComplex.single (ModuleCat.{0} ℤ_[p]) (ComplexShape.up ℤ) 0).obj
              (ModuleCat.of ℤ_[p] ℤ_[p]), 𝟙 _, 𝟙 _⟩) ≅
      ModuleCat.of ℤ_[p] ℤ_[p]) := sorry

-- pr4_syntomic_equal_maps
example (D : NygaardDatum p) (h : D.divFrob = D.can) :
    Nonempty (syntomicComplex D ≅
      (DerivedCategory.Q.obj (CochainComplex.mappingCone (0 : D.fil ⟶ D.twisted)))⟦(-1 : ℤ)⟧) :=
  sorry

-- pr4_syntomic_contracting
example (D : NygaardDatum p) (h : IsIso (DerivedCategory.Q.map (D.divFrob - D.can))) :
    IsZero (syntomicComplex D) := sorry

-- pr4_syntomic_not_fixed_points
example {A : Type} [CommRing A] [Algebra ℤ_[p] A] (P : Prism p A) (hP : P.IsPerfect) (d : A)
    (hI : P.I = Ideal.span {d}) (hd : ¬ IsUnit d) :
    ¬ IsIso (DerivedCategory.Q.map (perfectoidDatum P d 1).can) := sorry

/-- Node `PR.4/syntomic-cohomology-formal-schemes`: the imported data of an animated ring
`R` in weight `n`. -/
structure AbsoluteDatum (p : ℕ) [Fact p.Prime] where
  /-- `Fil^n_N Δ_R{n} ⟶ Δ_R{n}` with `ι` and `φ{n}` (owners:
  `PR.5/absolute-prismatic-cohomology`, `PR.5/absolute-nygaard-filtration`). -/
  datum : NygaardDatum p
  /-- The Nygaard-completed version (owner: `PR.3/nygaard-completion`). -/
  completed : NygaardDatum p
  /-- The completion map. -/
  toCompleted : NygaardDatum.Hom p datum completed

/-- `RΓ_syn(Spf R, ℤ_p(n)) = fib(φ{n} - ι)`. -/
noncomputable def syntomicCohomology (X : AbsoluteDatum p) :
    DerivedCategory (ModuleCat.{0} ℤ_[p]) := syntomicComplex X.datum

/-- The completed and uncompleted syntomic complexes agree when the completion maps are
isomorphisms in the derived category. Bhatt–Lurie Proposition 7.4.6 proves the conclusion
for the prismatic data with no such hypothesis, using that the square of canonical maps is
homotopy cartesian; that condition is not expressible against the imported data. -/
theorem syntomicCohomology_completion (X : AbsoluteDatum p)
    (h₁ : IsIso (DerivedCategory.Q.map X.toCompleted.fFil))
    (h₂ : IsIso (DerivedCategory.Q.map X.toCompleted.fTw)) :
    IsIso (syntomicMap X.toCompleted) := sorry

/-- Agreement with `ℤ_p(n)(R)` of a quasisyntomic ring, given a comparison of data inducing
isomorphisms in the derived category (Bhatt–Lurie Theorem 5.6.2, Corollary 5.6.3). -/
theorem syntomicCohomology_eq_syntomicComplex (X : AbsoluteDatum p) (D : NygaardDatum p)
    (g : NygaardDatum.Hom p X.completed D)
    (h₁ : IsIso (DerivedCategory.Q.map g.fFil)) (h₂ : IsIso (DerivedCategory.Q.map g.fTw))
    (h₃ : IsIso (syntomicMap X.toCompleted)) :
    Nonempty (syntomicCohomology X ≅ syntomicComplex D) := sorry

/-- `RΓ_syn(𝔛, ℤ_p(n))` of a bounded `p`-adic formal scheme: the homotopy limit of the
syntomic complexes of the affines mapping to `𝔛`, indexed here by `ι`. The transition maps
of the diagram are part of the data of PR.5 and are not recorded. -/
noncomputable def syntomicCohomologyFormal (ι : Type) (X : ι → AbsoluteDatum p) :
    DerivedCategory (ModuleCat.{0} ℤ_[p]) := sorry

/-- The defining fibre sequence `ℤ_p(n) ⟶ N^{≥n} Δ{n} ⟶ Δ{n}`, as a distinguished triangle. -/
theorem syntomicTriangle (D : NygaardDatum p) :
    ∃ δ : DerivedCategory.Q.obj D.twisted ⟶ (syntomicComplex D)⟦(1 : ℤ)⟧,
      Triangle.mk (syntomicToFil D) (DerivedCategory.Q.map (D.divFrob - D.can)) δ ∈
        distTriang (DerivedCategory (ModuleCat.{0} ℤ_[p])) := sorry

-- pr4_syntomic_cohomology_trivial_ring
example (X : AbsoluteDatum p) (h₁ : IsZero (DerivedCategory.Q.obj X.datum.fil))
    (h₂ : IsZero (DerivedCategory.Q.obj X.datum.twisted)) : IsZero (syntomicCohomology X) := sorry

-- pr4_syntomic_cohomology_qrsp_two_term
example (X : AbsoluteDatum p) (h₁ : (DerivedCategory.Q.obj X.datum.fil).IsLE 0)
    (h₂ : (DerivedCategory.Q.obj X.datum.twisted).IsLE 0)
    (h₃ : (DerivedCategory.Q.obj X.datum.fil).IsGE 0)
    (h₄ : (DerivedCategory.Q.obj X.datum.twisted).IsGE 0) :
    (syntomicCohomology X).IsGE 0 ∧ (syntomicCohomology X).IsLE 1 := sorry

-- pr4_syntomic_cohomology_completed_agrees
example (X : AbsoluteDatum p) (h₁ : IsIso (DerivedCategory.Q.map X.toCompleted.fFil))
    (h₂ : IsIso (DerivedCategory.Q.map X.toCompleted.fTw)) :
    Nonempty (syntomicCohomology X ≅ syntomicComplex X.completed) := sorry

-- pr4_syntomic_cohomology_not_hodge
example {A : Type} [CommRing A] [Algebra ℤ_[p] A] (P : Prism p A) (hP : P.IsPerfect) (d : A)
    (hI : P.I = Ideal.span {d}) :
    IsZero ((DerivedCategory.Q.obj
      (CochainComplex.mappingCone (perfectoidDatum P d 0).divFrob))⟦(-1 : ℤ)⟧) := sorry

/-- Node `PR.4/syntomic-cohomology-schemes`: the imported cospan of an animated ring `R` in
weight `n`. -/
structure SchemeDatum (p : ℕ) [Fact p.Prime] where
  /-- `RΓ_syn(Spf R̂, ℤ_p(n))` (this stage). -/
  synFormal : DerivedCategory (ModuleCat.{0} ℤ_[p])
  /-- `RΓ_ét(Spec R̂[1/p], ℤ_p(n))` (owner: `SchemeAndStackFoundations:SF.2`). -/
  etCompleted : DerivedCategory (ModuleCat.{0} ℤ_[p])
  /-- `RΓ_ét(Spec R[1/p], ℤ_p(n))` (owner: `SchemeAndStackFoundations:SF.2`). -/
  etGeneric : DerivedCategory (ModuleCat.{0} ℤ_[p])
  /-- The étale comparison morphism `γ{n}` of `PR.4/syntomic-etale-comparison`. -/
  γ : synFormal ⟶ etCompleted
  /-- Restriction along `R ⟶ R̂`. -/
  res : etGeneric ⟶ etCompleted

/-- `RΓ_syn(Spec R, ℤ_p(n))`: the homotopy pullback of the cospan. -/
noncomputable def syntomicCohomologyScheme (X : SchemeDatum p) :
    DerivedCategory (ModuleCat.{0} ℤ_[p]) := sorry

/-- The étale comparison morphism `γ{n} : RΓ_syn(Spec R, ℤ_p(n)) ⟶ RΓ_ét(Spec R[1/p], ℤ_p(n))`. -/
noncomputable def etaleComparison (X : SchemeDatum p) :
    syntomicCohomologyScheme X ⟶ X.etGeneric := sorry

/-- The map to the syntomic complex of the `p`-adic completion. -/
noncomputable def toFormal (X : SchemeDatum p) :
    syntomicCohomologyScheme X ⟶ X.synFormal := sorry

theorem pullback_condition (X : SchemeDatum p) :
    toFormal X ≫ X.γ = etaleComparison X ≫ X.res := sorry

theorem toFormal_isIso_of_complete (X : SchemeDatum p) (h : IsIso X.res) :
    IsIso (toFormal X) := sorry

theorem etaleComparison_isIso_of_invertible (X : SchemeDatum p) (h₁ : IsZero X.synFormal)
    (h₂ : IsZero X.etCompleted) : IsIso (etaleComparison X) := sorry

-- pr4_syntomic_scheme_p_invertible
example (X : SchemeDatum p) (h₁ : IsZero X.synFormal) (h₂ : IsZero X.etCompleted) :
    Nonempty (syntomicCohomologyScheme X ≅ X.etGeneric) := sorry

-- pr4_syntomic_scheme_p_complete
example (M N : DerivedCategory (ModuleCat.{0} ℤ_[p])) (g : M ⟶ N) :
    Nonempty (syntomicCohomologyScheme (p := p) ⟨M, N, N, g, 𝟙 N⟩ ≅ M) := sorry

-- pr4_syntomic_scheme_zero
example : IsZero (syntomicCohomologyScheme (p := p) ⟨0, 0, 0, 0, 0⟩) := sorry

-- pr4_syntomic_scheme_not_product
example (M : DerivedCategory (ModuleCat.{0} ℤ_[p])) :
    Nonempty (syntomicCohomologyScheme (p := p) ⟨M, M, M, 𝟙 M, 𝟙 M⟩ ≅ M) := sorry

/-- Imported data for Bhatt–Scholze Theorem 9.4 in weight `n ≥ 1`. -/
structure TateTwistDatum (p : ℕ) [Fact p.Prime] where
  /-- `RΓ_ét(Spec R[1/p], ℤ_p(n))`, the derived limit of the `μ_{p^k}^{⊗ n}`-cohomology
  (owner: `SchemeAndStackFoundations:SF.2`). -/
  etaleTwisted : DerivedCategory (ModuleCat.{0} ℤ_[p])

/-- Node `PR.4/tate-twist-perfectoid` (Bhatt–Scholze Theorem 9.4): for a perfectoid ring `R`
with perfect prism `(A, (d))` and `n ≥ 1`, `ℤ_p(n)(R) ≃ RΓ_ét(Spec R[1/p], ℤ_p(n))`. Derived
`(p, d)`-completeness of `A` is left out of `Prism`. -/
theorem tateTwist_perfectoid {A : Type} [CommRing A] [Algebra ℤ_[p] A] (P : Prism p A)
    (hP : P.IsPerfect) (d : A) (hI : P.I = Ideal.span {d}) (n : ℕ) (hn : 1 ≤ n)
    (X : TateTwistDatum p) :
    Nonempty (syntomicComplex (perfectoidDatum P d n) ≅ X.etaleTwisted) := sorry

end Complexes

section Logarithm

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]

/-- Node `PR.4/prismatic-logarithm`: the rank-one units congruent to `1` modulo `I`,
`(1 + I)_{rk = 1} = {u | u - 1 ∈ I, δ u = 0}`. -/
def rankOneUnits (P : Prism p A) : Subgroup Aˣ where
  carrier := {u | (u : A) - 1 ∈ P.I ∧ P.δ.delta (u : A) = 0}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

/-- The Tate module `T_p(R^×) = lim (μ_{p^k}(R), x ↦ x ^ p)`: compatible systems of
`p`-power roots of `1`. -/
def tateModule (p : ℕ) (R : Type u) [CommRing R] : Subgroup (ℕ → Rˣ) where
  carrier := {x | x 0 = 1 ∧ ∀ n, x (n + 1) ^ p = x n}
  mul_mem' := sorry
  one_mem' := sorry
  inv_mem' := sorry

variable (P : Prism p A)
  -- The Breuil–Kisin twist `A{1}` of `P` (owner: `PR.3/breuil-kisin-twist`).
  (T : Type u) [AddCommGroup T] [Module A T]

/-- The prismatic logarithm `log_Δ : (1 + I)_{rk = 1} ⟶ A{1}`, a group homomorphism; `T` is
the Breuil–Kisin twist `A{1}` of `PR.3/breuil-kisin-twist`. -/
noncomputable def prismaticLog : Additive (rankOneUnits P) →+ T := sorry

/-- `φ_{A{1}} (log_Δ u) = log_Δ u`, for `φT` the Frobenius of `A{1}` (owner PR.3). -/
theorem prismaticLog_frobenius (φT : T →+ T) (u : Additive (rankOneUnits P)) :
    φT (prismaticLog P T u) = prismaticLog P T u := sorry

/-- Functoriality, on domains: a map of prisms carries rank-one units to rank-one units.
The equation `f{1} (log_Δ u) = log_Δ (f u)` needs the functoriality of the twist (PR.3) and
is not stated. -/
theorem prismaticLog_map {B : Type u} [CommRing B] (Q : Prism p B) (f : P.Hom Q)
    (u : Aˣ) (hu : u ∈ rankOneUnits P) : Units.map f.toRingHom.toMonoidHom u ∈ rankOneUnits Q :=
  sorry

/-- `log_Δ u` reduces to the class of `u - 1` under `red : A{1} ⟶ I / I ^ 2`, the reduction
of the twist modulo `I` (owner PR.3). -/
theorem prismaticLog_mod (red : T →+ P.I.Cotangent) (u : rankOneUnits P) :
    red (prismaticLog P T (Additive.ofMul u)) = P.I.toCotangent ⟨(u : Aˣ) - 1, u.2.1⟩ := sorry

/-- The prismatic logarithm on Tate modules, `T_p((A / I)^×) ⟶ A{1}`. -/
noncomputable def tateLog : Additive (tateModule p P.bar) →+ T := sorry

-- pr4_prismatic_log_one
example : prismaticLog P T 0 = 0 := sorry

-- pr4_prismatic_log_q_de_rham
example (Q : Prism p (PowerSeries ℤ_[p]))
    (hI : Q.I = Ideal.span {∑ i ∈ Finset.range p, (1 + PowerSeries.X : PowerSeries ℤ_[p]) ^ i})
    (hφ : Q.φ PowerSeries.X = (1 + PowerSeries.X) ^ p - 1)
    (E : Type) [AddCommGroup E] [Module (PowerSeries ℤ_[p]) E] (q : rankOneUnits Q)
    (hq : ((q : (PowerSeries ℤ_[p])ˣ) : PowerSeries ℤ_[p]) = (1 + PowerSeries.X) ^ p) :
    ∃ e : E, prismaticLog Q E (Additive.ofMul q) = (PowerSeries.X : PowerSeries ℤ_[p]) • e :=
  sorry

-- pr4_prismatic_log_mul
example (u v : Additive (rankOneUnits P)) :
    prismaticLog P T (u + v) = prismaticLog P T u + prismaticLog P T v ∧
      prismaticLog P T (p • u) = p • prismaticLog P T u := sorry

-- pr4_prismatic_log_not_all_units
example (Q : Prism p (PowerSeries ℤ_[p]))
    (hI : Q.I = Ideal.span {∑ i ∈ Finset.range p, (1 + PowerSeries.X : PowerSeries ℤ_[p]) ^ i}) :
    Q.δ.delta (1 + ∑ i ∈ Finset.range p, (1 + PowerSeries.X : PowerSeries ℤ_[p]) ^ i) ≠ 0 :=
  sorry

end Logarithm

end TauCeti.Prismatic.Syntomic


/-! ## PR.5 — Absolute prismatics: the Cartier–Witt stack and absolute prismatic cohomology

Suggested signatures for the layer `PrismaticCohomology:PR.5` (Bhatt–Lurie, *Absolute prismatic
cohomology*, §§3–5). The roadmap document is definitive; these statements suggest Lean forms.

* Cartier–Witt divisors are stated concretely against Mathlib's `WittVector`. Condition (b) of
  Bhatt–Lurie Definition 3.1.4 (the image of `δ ∘ α` generates the unit ideal) is recorded in its
  coordinate form, by `δ(x)₀ = x₁` (`coeff_zero_delta`).
* Stacks and derived categories of stacks do not exist in Mathlib. `D(WCart)`, `D(WCart^HT)` and
  their functors are the fields of the structure `Carriers`, and `carriers` is the value that the
  nodes `quasi-coherent-complexes-on-wcart`, `prismatic-crystals-on-wcart`, `hodge-tate-divisor`
  and `wcart-frobenius` construct on the stacks of `LanglandsParameterStacks:LP1`. Complexes are
  objects of Mathlib's `DerivedCategory`, the 1-categorical shadow of the ∞-categories of the
  source; that part of the section is written in universe `0`.
* Derived completeness (DD.1) is not part of the `Prism` structure of the preamble; statements
  that need it say so. -/

namespace TauCeti.Prismatic.WCart

open CategoryTheory TauCeti.Delta

attribute [local instance] HasDerivedCategory.standard

universe u

/-- Node `PR.5/generalized-cartier-divisor`: a generalized Cartier divisor of `Spec R`, a pair
`(I, α)` of an invertible `R`-module and a linear map `α : I → R` (Bhatt–Lurie, Definition 3.1.1). -/
structure GeneralizedCartierDivisor (R : Type u) [CommRing R] where
  /-- The invertible module. -/
  I : Type u
  [addCommGroup : AddCommGroup I]
  [module : Module R I]
  /-- `I` is an invertible `R`-module. -/
  invertible : Module.Invertible R I
  /-- The linear map `α : I → R`. -/
  α : I →ₗ[R] R

attribute [instance] GeneralizedCartierDivisor.addCommGroup GeneralizedCartierDivisor.module

namespace GeneralizedCartierDivisor

variable {R : Type u} [CommRing R]

/-- A morphism of the groupoid `Cart(R)`: a linear equivalence `ρ` with `α' ∘ ρ = α`. -/
structure Iso (D E : GeneralizedCartierDivisor R) where
  /-- The isomorphism of invertible modules. -/
  toLinearEquiv : D.I ≃ₗ[R] E.I
  /-- Compatibility with the maps to `R`. -/
  comm : E.α ∘ₗ (toLinearEquiv : D.I →ₗ[R] E.I) = D.α

/-- The principal divisor `(R, f·)`. -/
def ofElement (f : R) : GeneralizedCartierDivisor R where
  I := R
  invertible := inferInstance
  α := LinearMap.mulLeft R f

/-- The Cartier divisor `(J, inclusion)` of an invertible ideal. -/
def ofIdeal (J : Ideal R) (h : Module.Invertible R J) : GeneralizedCartierDivisor R where
  I := J
  invertible := h
  α := J.subtype

/-- Pullback along a ring map: `(I, α) ↦ (S ⊗_R I, S ⊗ α)`. -/
noncomputable def baseChange {S : Type u} [CommRing S] (f : R →+* S)
    (D : GeneralizedCartierDivisor R) : GeneralizedCartierDivisor S := sorry

/-- `(I, α)` is a Cartier divisor: `α` is injective. -/
def IsCartier (D : GeneralizedCartierDivisor R) : Prop := Function.Injective D.α

theorem ofElement_iso_iff (f g : R) :
    Nonempty (Iso (ofElement f) (ofElement g)) ↔ ∃ u : Rˣ, g = u * f := by sorry

-- pr5_cartier_zero_not_cartier
example [Nontrivial R] : ¬ (ofElement (0 : R)).IsCartier := by sorry

-- pr5_cartier_unit_trivial
example (u : Rˣ) : Nonempty (Iso (ofElement (1 : R)) (ofElement (u : R))) := by sorry

-- pr5_cartier_base_change_loses_injectivity
example (p : ℕ) [Fact p.Prime] : (ofElement (p : ℤ)).IsCartier ∧
    ¬ ((ofElement (p : ℤ)).baseChange (Int.castRingHom (ZMod p))).IsCartier := by sorry

-- pr5_cartier_automorphisms
example (f : R) :
    Nonempty (Iso (ofElement f) (ofElement f) ≃ {u : Rˣ // (u : R) * f = f}) := by sorry

end GeneralizedCartierDivisor

section CartierWitt

variable (p : ℕ) [Fact p.Prime] {R : Type u} [CommRing R]

/-- Node `PR.5/cartier-witt-divisor`: the predicate of Bhatt–Lurie Definition 3.1.4 on a
generalized Cartier divisor of `W(R)`, in coordinates: `p` is nilpotent in `R`, every `α(y)₀` is
nilpotent, and the `α(y)₁` generate the unit ideal of `R`. -/
def IsCartierWitt (D : GeneralizedCartierDivisor (WittVector p R)) : Prop :=
  IsNilpotent (p : R) ∧ (∀ y : D.I, IsNilpotent ((D.α y).coeff 0)) ∧
    Ideal.span (Set.range fun y : D.I => (D.α y).coeff 1) = ⊤

/-- A Cartier–Witt divisor of `R`: an object of `WCart(R)`. -/
structure CartierWittDivisor (R : Type u) [CommRing R] where
  /-- The underlying generalized Cartier divisor of `W(R)`. -/
  toDivisor : GeneralizedCartierDivisor (WittVector p R)
  /-- Conditions (a) and (b). -/
  isCartierWitt : IsCartierWitt p toDivisor

/-- `f ∈ WCart₀(R)`: a distinguished Witt vector (Bhatt–Lurie, Construction 3.2.1). -/
def IsDistinguishedWitt (f : WittVector p R) : Prop :=
  IsNilpotent (f.coeff 0) ∧ IsUnit (f.coeff 1)

theorem isCartierWitt_ofElement_iff (f : WittVector p R) :
    IsCartierWitt p (GeneralizedCartierDivisor.ofElement f) ↔
      IsNilpotent (p : R) ∧ IsDistinguishedWitt p f := by sorry

/-- The principalized Cartier–Witt divisor `(W(R), f·)`. -/
noncomputable def CartierWittDivisor.ofWitt (f : WittVector p R) (hp : IsNilpotent (p : R))
    (hf : IsDistinguishedWitt p f) : CartierWittDivisor p R where
  toDivisor := GeneralizedCartierDivisor.ofElement f
  isCartierWitt := (isCartierWitt_ofElement_iff p f).2 ⟨hp, hf⟩

/-- For the canonical δ-structure on Witt vectors (any family natural in the ring and with
Frobenius the Witt vector Frobenius; PR.0 constructs it): `δ(x)₀ = x₁`. -/
theorem coeff_zero_delta
    (dW : ∀ (S : Type u) [CommRing S], Delta.Structure p (WittVector p S))
    (hφ : ∀ (S : Type u) [CommRing S],
      (toFrobenius p (dW S)).1 = (WittVector.frobenius : WittVector p S →+* WittVector p S))
    (hnat : ∀ (S T : Type u) [CommRing S] [CommRing T] (f : S →+* T) (x : WittVector p S),
      WittVector.map f ((dW S).delta x) = (dW T).delta (WittVector.map f x))
    (x : WittVector p R) : ((dW R).delta x).coeff 0 = x.coeff 1 := by sorry

-- pr5_cw_p_distinguished
example (n : ℕ) : IsDistinguishedWitt p ((p : ℕ) : WittVector p (ZMod (p ^ (n + 1)))) := by sorry

-- pr5_cw_verschiebung_one
example : IsDistinguishedWitt p (WittVector.verschiebung (1 : WittVector p R)) := by sorry

-- pr5_cw_one_not_distinguished
example [Nontrivial R] : ¬ IsDistinguishedWitt p (1 : WittVector p R) := by sorry

-- pr5_cw_teichmuller_not_distinguished
example [Nontrivial R] (a : R) : ¬ IsDistinguishedWitt p (WittVector.teichmuller p a) := by sorry

-- pr5_cw_empty_of_p_not_nilpotent
example (h : ¬ IsNilpotent (p : R)) : IsEmpty (CartierWittDivisor p R) := by sorry

/-- Node `PR.5/hodge-tate-divisor`: `(I, α)` lies in `WCart^HT(R)`. -/
def CartierWittDivisor.IsHodgeTate (D : CartierWittDivisor p R) : Prop :=
  ∀ y : D.toDivisor.I, (D.toDivisor.α y).coeff 0 = 0

/-- Node `PR.5/cartier-witt-stack`: `WCart(R)` is a groupoid, with the isomorphisms of the
underlying generalized Cartier divisors as morphisms. -/
noncomputable instance CartierWittDivisor.groupoid : Groupoid (CartierWittDivisor p R) where
  Hom D E := GeneralizedCartierDivisor.Iso D.toDivisor E.toDivisor
  id D := ⟨LinearEquiv.refl _ _, by sorry⟩
  comp f g := ⟨f.toLinearEquiv.trans g.toLinearEquiv, by sorry⟩
  inv f := ⟨f.toLinearEquiv.symm, by sorry⟩
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry
  inv_comp := by sorry
  comp_inv := by sorry

/-- The functor `f^* : WCart(R) → WCart(S)` of base change along `W(f)`; the direction is the
corrected one of Bhatt–Lurie Remark 3.1.7. -/
noncomputable def pullback {S : Type u} [CommRing S] (f : R →+* S) :
    CartierWittDivisor p R ⥤ CartierWittDivisor p S := sorry

/-- The coherence isomorphism `g^* ∘ f^* ≅ (g ∘ f)^*`. -/
noncomputable def pullbackComp {S T : Type u} [CommRing S] [CommRing T] (f : R →+* S)
    (g : S →+* T) : pullback p f ⋙ pullback p g ≅ pullback p (g.comp f) := sorry

/-- `μ : WCart(R) → Cart(R)`, restriction along `W(R) → R` (Bhatt–Lurie, Remark 3.1.6). -/
noncomputable def toCart (D : CartierWittDivisor p R) : GeneralizedCartierDivisor R :=
  D.toDivisor.baseChange WittVector.constantCoeff

theorem toCart_not_isCartier [Nontrivial R] (D : CartierWittDivisor p R) :
    ¬ (toCart p D).IsCartier := by sorry

/-- Separatedness half of fpqc descent for `WCart`; effectivity of descent data is part of the node
and needs the stack carriers of `LanglandsParameterStacks:LP1` to be stated. -/
theorem pullback_faithful {S : Type u} [CommRing S] (f : R →+* S) (hf : f.FaithfullyFlat) :
    (pullback p f).Faithful := by sorry

open CartierWittDivisor in
-- pr5_wcart_hom_principal
example (x y : WittVector p R) (hp : IsNilpotent (p : R)) (hx : IsDistinguishedWitt p x)
    (hy : IsDistinguishedWitt p y) :
    Nonempty ((ofWitt p x hp hx ⟶ ofWitt p y hp hy) ≃ {u : (WittVector p R)ˣ // y = u * x}) := by
  sorry

-- pr5_wcart_zero_ring
example [Subsingleton R] (D E : CartierWittDivisor p R) : Nonempty (Unique (D ⟶ E)) := by sorry

open CartierWittDivisor in
-- pr5_wcart_pullback_principal
example {S : Type u} [CommRing S] (f : R →+* S) (x : WittVector p R) (hp : IsNilpotent (p : R))
    (hx : IsDistinguishedWitt p x) (hp' : IsNilpotent (p : S))
    (hx' : IsDistinguishedWitt p (WittVector.map f x)) :
    Nonempty ((pullback p f).obj (ofWitt p x hp hx) ≅ ofWitt p (WittVector.map f x) hp' hx') := by
  sorry

open CartierWittDivisor in
-- pr5_wcart_nontrivial_automorphism
example (hp : IsNilpotent (p : DualNumber (ZMod p)))
    (hx : IsDistinguishedWitt p
      (WittVector.verschiebung (1 : WittVector p (DualNumber (ZMod p))))) :
    ∃ g : ofWitt p _ hp hx ⟶ ofWitt p _ hp hx, g ≠ 𝟙 _ := by sorry

/-- Node `PR.5/wcart-quotient-presentation` (Bhatt–Lurie, Proposition 3.2.3): every Cartier–Witt
divisor is Zariski-locally principalized. Together with `pr5_wcart_hom_principal` this is the
presentation `WCart = [WCart₀ / W^×]`. -/
theorem exists_cover_principalized (D : CartierWittDivisor p R) :
    ∃ s : Finset R, Ideal.span (s : Set R) = ⊤ ∧ ∀ g ∈ s,
      ∃ (x : WittVector p (Localization.Away g)) (hp : IsNilpotent (p : Localization.Away g))
        (hx : IsDistinguishedWitt p x),
        Nonempty ((pullback p (algebraMap R (Localization.Away g))).obj D ≅
          CartierWittDivisor.ofWitt p x hp hx) := by sorry

/-- Node `PR.5/transversal-prism-coproducts`: a prism is transversal when `A / I` is
`p`-torsion-free (Bhatt–Lurie, Definition 2.1.3). -/
def IsTransversal {A : Type u} [CommRing A] (P : Prism p A) : Prop :=
  ∀ x : P.bar, (p : P.bar) * x = 0 → x = 0

/-- `(K; i, j)` is a coproduct of the prisms `P` and `Q`. -/
def IsCoproduct {A B C : Type u} [CommRing A] [CommRing B] [CommRing C] {P : Prism p A}
    {Q : Prism p B} {K : Prism p C} (i : P.Hom K) (j : Q.Hom K) : Prop :=
  ∀ (D : Type u) [CommRing D] (L : Prism p D) (f : P.Hom L) (g : Q.Hom L),
    ∃! h : K.Hom L, h.toRingHom.comp i.toRingHom = f.toRingHom ∧
      h.toRingHom.comp j.toRingHom = g.toRingHom

/-- Bhatt–Lurie, Proposition 2.4.5 (prisms are derived complete; DD.1). -/
theorem exists_coproduct_of_transversal {A B : Type u} [CommRing A] [CommRing B]
    (P : Prism p A) (hP : IsTransversal p P) (Q : Prism p B) (hQ : Q.IsBounded) :
    ∃ (C : Type u) (_ : CommRing C) (K : Prism p C) (i : P.Hom K) (j : Q.Hom K),
      IsCoproduct p i j := by sorry

/-- Bhatt–Lurie, Proposition 2.4.1. -/
theorem exists_transversal_approximation {A : Type u} [CommRing A] (P : Prism p A) :
    ∃ (B : Type u) (_ : CommRing B) (Q : Prism p B), IsTransversal p Q ∧ Nonempty (Q.Hom P) := by
  sorry

/-- Node `PR.5/prism-point-of-wcart`: the Cartier–Witt divisor `ρ_A(f) = (W(R) ⊗_A I → W(R))` of
a prism `(A, I)` and a map `f : A → R` under which `I + (p)` becomes nilpotent
(Bhatt–Lurie, Construction 3.2.4). -/
noncomputable def prismPoint {A : Type u} [CommRing A] (P : Prism p A) (f : A →+* R)
    (hf : ∀ a ∈ P.I ⊔ Ideal.span {(p : A)}, IsNilpotent (f a)) : CartierWittDivisor p R := sorry

theorem prismPoint_comp {A S : Type u} [CommRing A] [CommRing S] (P : Prism p A) (f : A →+* R)
    (g : R →+* S) (hf : ∀ a ∈ P.I ⊔ Ideal.span {(p : A)}, IsNilpotent (f a))
    (hgf : ∀ a ∈ P.I ⊔ Ideal.span {(p : A)}, IsNilpotent ((g.comp f) a)) :
    Nonempty ((pullback p g).obj (prismPoint p P f hf) ≅ prismPoint p P (g.comp f) hgf) := by sorry

theorem prismPoint_map {A B : Type u} [CommRing A] [CommRing B] (P : Prism p A) (Q : Prism p B)
    (h : P.Hom Q) (f : B →+* R)
    (hf : ∀ b ∈ Q.I ⊔ Ideal.span {(p : B)}, IsNilpotent (f b))
    (hfh : ∀ a ∈ P.I ⊔ Ideal.span {(p : A)}, IsNilpotent ((f.comp h.toRingHom) a)) :
    Nonempty (prismPoint p P (f.comp h.toRingHom) hfh ≅ prismPoint p Q f hf) := by sorry

/-- The universal oriented prism `(A⁰, (a₀))` (Bhatt–Lurie, Example 3.2.5, Remark 3.2.7). -/
theorem exists_universalOrientedPrism :
    ∃ (A0 : Type u) (_ : CommRing A0) (P0 : Prism p A0) (a0 : A0), P0.I = Ideal.span {a0} ∧
      ∀ (B : Type u) [CommRing B] (Q : Prism p B) (d : B), Q.I = Ideal.span {d} →
        ∃! h : P0.Hom Q, h.toRingHom a0 = d := by sorry

-- pr5_point_crystalline_is_p
example {A : Type u} [CommRing A] (P : Prism p A) (hP : P.IsCrystalline) (f : A →+* R)
    (hf : ∀ a ∈ P.I ⊔ Ideal.span {(p : A)}, IsNilpotent (f a)) (hp : IsNilpotent (p : R))
    (hx : IsDistinguishedWitt p ((p : ℕ) : WittVector p R)) :
    Nonempty (prismPoint p P f hf ≅ CartierWittDivisor.ofWitt p ((p : ℕ) : WittVector p R) hp hx) := by
  sorry

-- pr5_point_orientable_principal
example {A : Type u} [CommRing A] (P : Prism p A) (hP : P.IsOrientable) (f : A →+* R)
    (hf : ∀ a ∈ P.I ⊔ Ideal.span {(p : A)}, IsNilpotent (f a)) :
    ∃ (x : WittVector p R) (hp : IsNilpotent (p : R)) (hx : IsDistinguishedWitt p x),
      Nonempty (prismPoint p P f hf ≅ CartierWittDivisor.ofWitt p x hp hx) := by sorry

-- pr5_point_to_cart
example {A : Type u} [CommRing A] (P : Prism p A) (f : A →+* R)
    (hf : ∀ a ∈ P.I ⊔ Ideal.span {(p : A)}, IsNilpotent (f a)) :
    Nonempty (GeneralizedCartierDivisor.Iso (toCart p (prismPoint p P f hf))
      ((GeneralizedCartierDivisor.ofIdeal P.I P.invertible).baseChange f)) := by sorry

end CartierWitt

end TauCeti.Prismatic.WCart

namespace TauCeti.Prismatic.WCart

open CategoryTheory TauCeti.Delta Pretriangulated MonoidalCategory

attribute [local instance] HasDerivedCategory.standard

universe u

variable (p : ℕ) [Fact p.Prime]

/-- `X → Y → Z` extends to a distinguished triangle: the 1-categorical form of a fibre sequence. -/
def IsFibreSequence {C : Type*} [Category C] [Preadditive C] [Limits.HasZeroObject C]
    [HasShift C ℤ] [∀ n : ℤ, (shiftFunctor C n).Additive] [Pretriangulated C] {X Y Z : C}
    (f : X ⟶ Y) (g : Y ⟶ Z) : Prop :=
  ∃ h : Z ⟶ X⟦(1 : ℤ)⟧, Triangle.mk f g h ∈ distTriang C

/-- The derived category of `ℤ_p`-modules; the complexes of this layer are `p`-complete objects
of it (DD.1). -/
abbrev DZp : Type 1 := DerivedCategory (ModuleCat.{0} ℤ_[p])

/-- The ring `A` as a complex in degree `0`. -/
noncomputable abbrev unitComplex (A : Type) [CommRing A] : DerivedCategory (ModuleCat.{0} A) :=
  (DerivedCategory.singleFunctor (ModuleCat.{0} A) 0).obj (ModuleCat.of A A)

/-- Node `PR.5/quasi-coherent-complexes-on-wcart`: the categories of quasi-coherent complexes on
`WCart` and on `WCart^HT` with their functors. Mathlib has no derived category of a stack; the
construction `Y ↦ D(Y)` belongs to `LanglandsParameterStacks:LP1` and its instances at `WCart` and
`WCart^HT` to this layer. Fields: `DWCart = D(WCart)` and `DHT = D(WCart^HT)` (symmetric monoidal;
only the monoidal structure is recorded); `restrictHT = ι^*`, `pushHT = ι_*`; `frobPullback = F^*`
(node `wcart-frobenius`); `globalSections = RΓ(WCart, −)`, `globalSectionsHT = RΓ(WCart^HT, −)`;
`prismPullback P = ρ_A^*` and `prismPushforward P = ρ_{A*}` (node `prism-point-of-wcart`);
`fibreEta = η^*` (node `hodge-tate-divisor`); `deRhamPullback = ρ_dR^*`; `idealPow m = I^m` for
the Hodge–Tate ideal sheaf; `bkTwist n = O{n}` (twists owned by `PR.3/breuil-kisin-twist`,
globalised by node `prismatic-crystals-on-wcart`). -/
structure Carriers where
  /-- `D(WCart)`. -/
  DWCart : Type 1
  [catDWCart : Category.{0} DWCart]
  [monDWCart : MonoidalCategory DWCart]
  /-- `D(WCart^HT)`. -/
  DHT : Type 1
  [catDHT : Category.{0} DHT]
  [monDHT : MonoidalCategory DHT]
  /-- `ι^*`. -/
  restrictHT : DWCart ⥤ DHT
  /-- `ι_*`. -/
  pushHT : DHT ⥤ DWCart
  /-- `F^*`. -/
  frobPullback : DWCart ⥤ DWCart
  /-- `RΓ(WCart, −)`. -/
  globalSections : DWCart ⥤ DZp p
  /-- `RΓ(WCart^HT, −)`. -/
  globalSectionsHT : DHT ⥤ DZp p
  /-- `ρ_A^*`. -/
  prismPullback : ∀ {A : Type} [CommRing A] (_ : Prism p A),
    DWCart ⥤ DerivedCategory (ModuleCat.{0} A)
  /-- `ρ_{A*}`. -/
  prismPushforward : ∀ {A : Type} [CommRing A] (_ : Prism p A),
    DerivedCategory (ModuleCat.{0} A) ⥤ DWCart
  /-- `η^*`. -/
  fibreEta : DHT ⥤ DZp p
  /-- `ρ_dR^*`. -/
  deRhamPullback : DWCart ⥤ DZp p
  /-- `I^m`. -/
  idealPow : ℤ → DWCart
  /-- `O_WCart{n}`. -/
  bkTwist : ℤ → DWCart

attribute [instance] Carriers.catDWCart Carriers.monDWCart Carriers.catDHT Carriers.monDHT

/-- The carriers on the Cartier–Witt stack constructed by this layer. -/
noncomputable def carriers : Carriers p := sorry

theorem prismPullback_unit {A : Type} [CommRing A] (P : Prism p A) :
    Nonempty (((carriers p).prismPullback P).obj (𝟙_ (carriers p).DWCart) ≅ unitComplex A) := by
  sorry

theorem prismPullback_ideal {A : Type} [CommRing A] (P : Prism p A) :
    Nonempty (((carriers p).prismPullback P).obj ((carriers p).idealPow 1) ≅
      (DerivedCategory.singleFunctor (ModuleCat.{0} A) 0).obj (ModuleCat.of A P.I)) := by sorry

-- pr5_qcoh_pullback_unit
example {A : Type} [CommRing A] (P : Prism p A) :
    Nonempty (((carriers p).prismPullback P).obj (𝟙_ (carriers p).DWCart) ≅ unitComplex A) := by
  sorry

-- pr5_qcoh_ideal_pow_zero
example : Nonempty ((carriers p).idealPow 0 ≅ 𝟙_ (carriers p).DWCart) := by sorry

-- pr5_qcoh_ideal_not_trivial
example : IsEmpty ((carriers p).idealPow 1 ≅ 𝟙_ (carriers p).DWCart) := by sorry

/-- Node `PR.5/prismatic-crystals-on-wcart` (Bhatt–Lurie, Proposition 3.3.5), in the form that
Mathlib can state: the pullbacks to bounded prisms are jointly conservative. The equivalence
`D(WCart) ≃ lim D̂(A)` itself is a statement about ∞-categories. -/
theorem isIso_of_prismPullback {E E' : (carriers p).DWCart} (f : E ⟶ E')
    (h : ∀ (A : Type) [CommRing A] (P : Prism p A), P.IsBounded →
      IsIso (((carriers p).prismPullback P).map f)) : IsIso f := by sorry

/-- Node `PR.5/wcart-fibre-products-of-prisms` (Bhatt–Lurie, Proposition 3.2.8), as base change:
`ρ_A^* ρ_{B*} O = C` for the coproduct `(C, K)` of a transversal prism `(A, I)` and a bounded
prism `(B, J)`. -/
theorem prismPullback_prismPushforward_unit {A B C : Type} [CommRing A] [CommRing B] [CommRing C]
    (P : Prism p A) (hP : IsTransversal p P) (Q : Prism p B) (hQ : Q.IsBounded) (K : Prism p C)
    (i : P.Hom K) (j : Q.Hom K) (hK : IsCoproduct p i j) :
    Nonempty (((carriers p).prismPullback P).obj
        (((carriers p).prismPushforward Q).obj (unitComplex B)) ≅
      ((ModuleCat.restrictScalars i.toRingHom).mapDerivedCategory).obj (unitComplex C)) := by sorry

open LaurentPolynomial in
/-- Node `PR.5/divided-power-multiplicative-group`: the coordinate ring of `G_m^♯`, generated in
`ℚ[t, t⁻¹]` by `t⁻¹` and the divided powers `(t − 1)^n / n!` (Bhatt–Lurie, Notation 3.4.9). -/
noncomputable def gmSharpRing : Subring (LaurentPolynomial ℚ) :=
  Subring.closure ({T (-1)} ∪ Set.range fun n : ℕ => C ((1 : ℚ) / (n.factorial : ℚ)) * (T 1 - 1) ^ n)

theorem T_mem_gmSharpRing : (LaurentPolynomial.T 1 : LaurentPolynomial ℚ) ∈ gmSharpRing := by
  sorry

/-- The `R`-points of `G_m^♯`. -/
def GmSharp (R : Type u) [CommRing R] : Type u := gmSharpRing →+* R

/-- The group structure for which `β : G_m^♯ → G_m` is a homomorphism. -/
noncomputable instance GmSharp.group (R : Type u) [CommRing R] : Group (GmSharp R) := sorry

/-- `β(R) : G_m^♯(R) → R^×`, the image of `t`. -/
noncomputable def GmSharp.toUnits {R : Type u} [CommRing R] : GmSharp R →* Rˣ := sorry

theorem GmSharp.coe_toUnits {R : Type u} [CommRing R] (g : gmSharpRing →+* R) :
    ((GmSharp.toUnits (R := R) g : Rˣ) : R) = g ⟨LaurentPolynomial.T 1, T_mem_gmSharpRing⟩ := by
  sorry

theorem GmSharp.toUnits_injective {R : Type u} [CommRing R]
    (h : ∀ (n : ℕ) (x : R), 0 < n → (n : R) * x = 0 → x = 0) :
    Function.Injective (GmSharp.toUnits (R := R)) := by sorry

/-- Bhatt–Lurie, Lemma 3.4.11: over a ring in which the integers prime to `p` are invertible,
`G_m^♯` is the kernel of the Witt vector Frobenius on units. -/
noncomputable def gmSharpEquivFrobeniusKernel {R : Type u} [CommRing R]
    (h : ∀ n : ℕ, ¬ p ∣ n → IsUnit (n : R)) :
    GmSharp R ≃* MonoidHom.ker (Units.map
      ((WittVector.frobenius : WittVector p R →+* WittVector p R) :
        WittVector p R →* WittVector p R)) := sorry

-- pr5_gmsharp_padic_points
example : Set.range (fun g : GmSharp ℤ_[p] => ((GmSharp.toUnits g : (ℤ_[p])ˣ) : ℤ_[p])) =
    {x | (p : ℤ_[p]) ∣ x - 1} := by sorry

-- pr5_gmsharp_rational
example {R : Type u} [CommRing R] [Algebra ℚ R] :
    Function.Bijective (GmSharp.toUnits (R := R)) := by sorry

-- pr5_gmsharp_fp_trivial
example : Nonempty (Unique (GmSharp (ZMod p))) := by sorry

/-- Node `PR.5/hodge-tate-divisor`: the point `η(R) = (W(R), V(1)·)`
(Bhatt–Lurie, Construction 3.4.4). -/
noncomputable def etaPoint (R : Type u) [CommRing R] (hp : IsNilpotent (p : R)) :
    CartierWittDivisor p R :=
  CartierWittDivisor.ofWitt p (WittVector.verschiebung 1) hp (by sorry)

theorem etaPoint_isHodgeTate (R : Type u) [CommRing R] (hp : IsNilpotent (p : R)) :
    (etaPoint p R hp).IsHodgeTate := by sorry

theorem prismPoint_isHodgeTate_iff {A R : Type u} [CommRing A] [CommRing R] (P : Prism p A)
    (f : A →+* R) (hf : ∀ a ∈ P.I ⊔ Ideal.span {(p : A)}, IsNilpotent (f a)) :
    (prismPoint p P f hf).IsHodgeTate ↔ ∀ a ∈ P.I, f a = 0 := by sorry

/-- `Aut(η)(R) ≅ G_m^♯(R)` (Bhatt–Lurie, Construction 3.4.4 and Lemma 3.4.11). -/
noncomputable def autEtaEquiv (R : Type u) [CommRing R] (hp : IsNilpotent (p : R)) :
    CategoryTheory.Aut (etaPoint p R hp) ≃* GmSharp R := sorry

/-- Bhatt–Lurie, Theorem 3.4.13: `η` is an fpqc surjection onto the Hodge–Tate divisor; with
`autEtaEquiv` this is `WCart^HT ≅ Spf(ℤ_p) × BG_m^♯`. -/
theorem exists_faithfullyFlat_iso_etaPoint {R : Type u} [CommRing R] (D : CartierWittDivisor p R)
    (hD : D.IsHodgeTate) :
    ∃ (S : Type u) (_ : CommRing S) (f : R →+* S) (hp : IsNilpotent (p : S)),
      f.FaithfullyFlat ∧ Nonempty ((pullback p f).obj D ≅ etaPoint p S hp) := by sorry

-- pr5_ht_p_eq_verschiebung_one
example {R : Type u} [CommRing R] [CharP R p] :
    ((p : ℕ) : WittVector p R) = WittVector.verschiebung 1 := by sorry

-- pr5_ht_p_not_hodge_tate
example (hp : IsNilpotent (p : ZMod (p ^ 2)))
    (hx : IsDistinguishedWitt p ((p : ℕ) : WittVector p (ZMod (p ^ 2)))) :
    ¬ (CartierWittDivisor.ofWitt p ((p : ℕ) : WittVector p (ZMod (p ^ 2))) hp hx).IsHodgeTate := by
  sorry

-- pr5_ht_unit_times_v_one
example {R : Type u} [CommRing R] (x : WittVector p R) :
    x * WittVector.verschiebung 1 = WittVector.verschiebung (WittVector.frobenius x) := by sorry

-- pr5_ht_aut_eta_fp
example (hp : IsNilpotent (p : ZMod p)) (g : etaPoint p (ZMod p) hp ⟶ etaPoint p (ZMod p) hp) :
    g = 𝟙 _ := by sorry

/-- Node `PR.5/sen-operator`: the Sen operator `Θ_E` on the fibre `E_η`, natural in
`E ∈ D(WCart^HT)` (Bhatt–Lurie, Construction 3.5.4, Notation 3.5.7). The Leibniz rule needs the
monoidal structure of `η^*` and is stated in the document. -/
noncomputable def senOperator : (carriers p).fibreEta ⟶ (carriers p).fibreEta := sorry

theorem senOperator_unit : (senOperator p).app (𝟙_ (carriers p).DHT) = 0 := by sorry

theorem fibreEta_twist (n : ℤ) :
    Nonempty ((carriers p).fibreEta.obj ((carriers p).restrictHT.obj ((carriers p).bkTwist n)) ≅
      unitComplex ℤ_[p]) := by sorry

theorem senOperator_twist (n : ℤ) :
    (senOperator p).app ((carriers p).restrictHT.obj ((carriers p).bkTwist n)) = n • 𝟙 _ := by
  sorry

theorem one_add_teichmuller_eps_mul_verschiebung {R : Type u} [CommRing R]
    (y : WittVector p (DualNumber R)) :
    (1 + WittVector.teichmuller p (DualNumber.eps : DualNumber R)) * WittVector.verschiebung y =
      WittVector.verschiebung y := by sorry

-- pr5_sen_unit_zero
example : (senOperator p).app (𝟙_ (carriers p).DHT) = 0 := senOperator_unit p

-- pr5_sen_ideal_identity
example : (senOperator p).app ((carriers p).restrictHT.obj ((carriers p).idealPow 1)) = 𝟙 _ := by
  sorry

-- pr5_sen_ideal_ne_zero
example : (senOperator p).app ((carriers p).restrictHT.obj ((carriers p).idealPow 1)) ≠ 0 := by
  sorry

-- pr5_sen_teichmuller_frobenius
example {R : Type u} [CommRing R] :
    WittVector.frobenius (WittVector.teichmuller p (DualNumber.eps : DualNumber R)) = 0 := by
  sorry

/-- The functor `E ↦ (E_η, Θ_E)` to complexes of `ℤ[Θ]`-modules. -/
noncomputable def senFunctor :
    (carriers p).DHT ⥤ DerivedCategory (ModuleCat.{0} (Polynomial ℤ)) := sorry

/-- Node `PR.5/sen-operator-classification` (Bhatt–Lurie, Theorem 3.5.8): full faithfulness. The
essential image (`p`-complete objects on which `Θ^p − Θ` is locally nilpotent modulo `p`) is
stated in the document. -/
theorem senFunctor_fullyFaithful : Nonempty (senFunctor p).FullyFaithful := by sorry

/-- Bhatt–Lurie, Proposition 3.5.11: `RΓ(WCart^HT, E) → E_η → E_η` is a fibre sequence. -/
theorem sen_fibre_sequence (E : (carriers p).DHT) :
    ∃ f : (carriers p).globalSectionsHT.obj E ⟶ (carriers p).fibreEta.obj E,
      IsFibreSequence f ((senOperator p).app E) := by sorry

/-- `η` is faithfully flat: `η^*` detects isomorphisms. -/
theorem isIso_of_fibreEta {E F : (carriers p).DHT} (f : E ⟶ F)
    (h : IsIso ((carriers p).fibreEta.map f)) : IsIso f := by sorry

/-- Bhatt–Lurie, Example 3.5.12: `H¹(WCart^HT, O) ≅ ℤ_p`. -/
theorem globalSectionsHT_unit_homology_one :
    Nonempty ((DerivedCategory.homologyFunctor (ModuleCat.{0} ℤ_[p]) 1).obj
      ((carriers p).globalSectionsHT.obj (𝟙_ (carriers p).DHT)) ≅ ModuleCat.of ℤ_[p] ℤ_[p]) := by
  sorry

/-- Node `PR.5/wcart-frobenius`: the Frobenius of `WCart` on `R`-points, base change along the
Witt vector Frobenius (Bhatt–Lurie, Construction 3.6.1). -/
noncomputable def frobenius {R : Type u} [CommRing R] :
    CartierWittDivisor p R ⥤ CartierWittDivisor p R := sorry

theorem frobenius_ofWitt {R : Type u} [CommRing R] (x : WittVector p R)
    (hp : IsNilpotent (p : R)) (hx : IsDistinguishedWitt p x)
    (hx' : IsDistinguishedWitt p (WittVector.frobenius x)) :
    Nonempty ((frobenius p).obj (CartierWittDivisor.ofWitt p x hp hx) ≅
      CartierWittDivisor.ofWitt p (WittVector.frobenius x) hp hx') := by sorry

/-- Bhatt–Lurie, Proposition 3.6.6: the Frobenius carries the Hodge–Tate divisor to the de Rham
point `(W(R), p·)`. -/
theorem frobenius_hodgeTate {R : Type u} [CommRing R] (D : CartierWittDivisor p R)
    (hD : D.IsHodgeTate) (hp : IsNilpotent (p : R))
    (hx : IsDistinguishedWitt p ((p : ℕ) : WittVector p R)) :
    Nonempty ((frobenius p).obj D ≅
      CartierWittDivisor.ofWitt p ((p : ℕ) : WittVector p R) hp hx) := by sorry

/-- The map `RΓ(WCart, E) → RΓ(WCart, F^* E)`. -/
noncomputable def frobeniusPullbackMap (E : (carriers p).DWCart) :
    (carriers p).globalSections.obj E ⟶
      (carriers p).globalSections.obj ((carriers p).frobPullback.obj E) := sorry

theorem frobPullback_bkTwist (n : ℤ) :
    Nonempty ((carriers p).frobPullback.obj ((carriers p).bkTwist n) ≅
      (carriers p).idealPow (-n) ⊗ (carriers p).bkTwist n) := by sorry

-- pr5_frob_eta_is_p
example {R : Type u} [CommRing R] :
    WittVector.frobenius (WittVector.verschiebung (1 : WittVector p R)) = (p : WittVector p R) := by
  sorry

-- pr5_frob_preserves_distinguished
example {R : Type u} [CommRing R] (x : WittVector p R) (hp : IsNilpotent (p : R))
    (hx : IsDistinguishedWitt p x) : IsDistinguishedWitt p (WittVector.frobenius x) := by sorry

-- pr5_frob_kills_sen_automorphism
example {R : Type u} [CommRing R] :
    WittVector.frobenius (1 + WittVector.teichmuller p (DualNumber.eps : DualNumber R)) = 1 := by
  sorry

-- pr5_point_frobenius
example {A R : Type u} [CommRing A] [CommRing R] (P : Prism p A) (f : A →+* R)
    (hf : ∀ a ∈ P.I ⊔ Ideal.span {(p : A)}, IsNilpotent (f a))
    (hf' : ∀ a ∈ P.I ⊔ Ideal.span {(p : A)}, IsNilpotent ((f.comp P.φ) a)) :
    Nonempty (prismPoint p P (f.comp P.φ) hf' ≅ (frobenius p).obj (prismPoint p P f hf)) := by
  sorry

/-- Node `PR.5/frobenius-pullback-square` (Bhatt–Lurie, Theorem 3.6.7 and Remark 3.6.8), for a
quasi-coherent complex `E` on `WCart`: the fibre sequence
`RΓ(WCart, E) → RΓ(WCart, F^* E) → ρ_dR^* E[−1]`. -/
theorem frobenius_fibre_sequence (E : (carriers p).DWCart) :
    ∃ g : (carriers p).globalSections.obj ((carriers p).frobPullback.obj E) ⟶
        ((carriers p).deRhamPullback.obj E)⟦(-1 : ℤ)⟧,
      IsFibreSequence (frobeniusPullbackMap p E) g := by sorry

end TauCeti.Prismatic.WCart

namespace TauCeti.Prismatic.Absolute

open CategoryTheory TauCeti.Delta MonoidalCategory TauCeti.Prismatic.WCart

attribute [local instance] HasDerivedCategory.standard

universe u

variable (p : ℕ) [Fact p.Prime]

/-- Node `PR.5/absolute-prismatic-site`: an object of the absolute prismatic site of `Spf R`, a
bounded prism `(A, I)` with a ring map `R → A / I` (Bhatt–Scholze F-crystals, Definition 2.3;
Bhatt–Lurie, Definition 4.4.27). The covering condition, `(p, I)`-complete faithful flatness,
belongs to DD.1 and is left out. -/
structure SiteObj (R : Type u) [CommRing R] where
  /-- The underlying ring of the prism. -/
  A : Type u
  [commRing : CommRing A]
  /-- The prism structure. -/
  prism : Prism p A
  /-- The prism is bounded. -/
  bounded : prism.IsBounded
  /-- The structure map `R → A / I`. -/
  str : R →+* prism.bar

attribute [instance] SiteObj.commRing

namespace SiteObj

variable {p} {R : Type u} [CommRing R]

/-- A morphism `(A, I, u) → (B, J, v)` of triples: a map of prisms whose reduction carries `u`
to `v`. The site is the opposite category. -/
structure Hom (X Y : SiteObj p R) where
  /-- The map of prisms. -/
  toHom : X.prism.Hom Y.prism
  /-- Compatibility with the structure maps. -/
  comm : ∀ (r : R) (a : X.A), Ideal.Quotient.mk X.prism.I a = X.str r →
    Ideal.Quotient.mk Y.prism.I (toHom.toRingHom a) = Y.str r

/-- The tautological object `(A, I, id)` of the site of `Spf (A / I)`. -/
def ofPrism {A : Type u} [CommRing A] (P : Prism p A) (hP : P.IsBounded) : SiteObj p P.bar where
  A := A
  prism := P
  bounded := hP
  str := RingHom.id _

/-- The value `I` of the prism-ideal sheaf `I_Δ`; the structure sheaf has value `A` and the
reduced structure sheaf `A / I`. -/
def idealSheaf (X : SiteObj p R) : Ideal X.A := X.prism.I

/-- The lemma inside Bhatt–Scholze Remark 4.7: a perfect prism is initial among the prisms over
its quotient (prisms are derived complete; DD.1). -/
theorem existsUnique_hom_of_perfect {A : Type u} [CommRing A] (P : Prism p A) (hb : P.IsBounded)
    (hP : P.IsPerfect) (X : SiteObj p P.bar) : Nonempty (Unique ((ofPrism P hb).Hom X)) := by
  sorry

end SiteObj

/-- An object of the relative site `(R / A)_Δ`: an object of the absolute site with a map of
prisms from the base prism, compatible with the structure maps. -/
structure RelativeObj {A : Type u} [CommRing A] (P : Prism p A) (R : Type u) [CommRing R]
    [Algebra P.bar R] where
  /-- The underlying object of the absolute site. -/
  toSiteObj : SiteObj p R
  /-- The map from the base prism. -/
  base : P.Hom toSiteObj.prism
  /-- Compatibility with the structure maps. -/
  comm : ∀ a : A, Ideal.Quotient.mk toSiteObj.prism.I (base.toRingHom a) =
    toSiteObj.str (algebraMap P.bar R (Ideal.Quotient.mk P.I a))

-- pr5_site_perfect_initial
example {A : Type u} [CommRing A] (P : Prism p A) (hb : P.IsBounded) (hP : P.IsPerfect)
    (X : SiteObj p P.bar) : Nonempty ((SiteObj.ofPrism P hb).Hom X) := by sorry

-- pr5_site_char_p_crystalline
example {R : Type u} [CommRing R] [CharP R p] (X : SiteObj p R) : X.prism.IsCrystalline := by
  sorry

-- pr5_site_structure_map_matters
example {A : Type u} [CommRing A] (P : Prism p A) (hb : P.IsBounded) (f : P.Hom P)
    (h : ∃ a : A, Ideal.Quotient.mk P.I (f.toRingHom a) ≠ Ideal.Quotient.mk P.I a) :
    ∀ g : (SiteObj.ofPrism P hb).Hom (SiteObj.ofPrism P hb), g.toHom.toRingHom ≠ f.toRingHom := by
  sorry

/-- Node `PR.5/absolute-prismatic-cohomology`: the prismatic cohomology sheaf `H_Δ(R)` on
`WCart` (Bhatt–Lurie, Construction 4.4.1), for an ordinary ring `R`; the source allows animated
rings (`EnhancedDerivedSheaves:E5:animation`). -/
noncomputable def prismaticSheaf (R : Type) [CommRing R] : (carriers p).DWCart := sorry

/-- Functoriality of `H_Δ`. -/
noncomputable def prismaticSheafMap {R S : Type} [CommRing R] [CommRing S] (f : R →+* S) :
    prismaticSheaf p R ⟶ prismaticSheaf p S := sorry

/-- The absolute prismatic complex `Δ_R = RΓ(WCart, H_Δ(R))`. -/
noncomputable def prismaticComplex (R : Type) [CommRing R] : DZp p :=
  (carriers p).globalSections.obj (prismaticSheaf p R)

/-- `Δ_R^{[m]}{n} = RΓ(WCart, I^m ⊗ H_Δ(R) ⊗ O{n})` (Bhatt–Lurie, Construction 4.4.10). -/
noncomputable def absolutePrismatic (R : Type) [CommRing R] (m n : ℤ) : DZp p :=
  (carriers p).globalSections.obj
    (((carriers p).idealPow m ⊗ prismaticSheaf p R) ⊗ (carriers p).bkTwist n)

/-- `ρ_A^* H_Δ(R) = Δ_{(A/I ⊗ R)/A}` when `A / I` is flat over `ℤ` (for example `(A, I)`
transversal), so that the derived tensor product is the ordinary one. -/
theorem prismPullback_prismaticSheaf {A : Type} [CommRing A] (P : Prism p A)
    [Module.Flat ℤ P.bar] (R : Type) [CommRing R] :
    Nonempty (((carriers p).prismPullback P).obj (prismaticSheaf p R) ≅
      prismaticCohomology P (TensorProduct ℤ P.bar R)) := by sorry

theorem absolutePrismatic_zero_zero (R : Type) [CommRing R] :
    Nonempty (absolutePrismatic p R 0 0 ≅ prismaticComplex p R) := by sorry

-- pr5_abs_sheaf_integers
example : Nonempty (prismaticSheaf p ℤ ≅ 𝟙_ (carriers p).DWCart) := by sorry

-- pr5_abs_sheaf_zero_ring
example : Limits.IsZero (prismaticSheaf p PUnit) := by sorry

-- pr5_abs_fp
example : Nonempty (prismaticComplex p (ZMod p) ≅ unitComplex ℤ_[p]) := by sorry

-- pr5_abs_sheaf_fp_not_unit
example : IsEmpty (prismaticSheaf p (ZMod p) ≅ 𝟙_ (carriers p).DWCart) := by sorry

/-- Node `PR.5/relative-site-comparison`, part (4) (Bhatt–Lurie, Example 4.3.15): for a
transversal prism `(A, I)` and a perfect prism `(B, J)` with coproduct `(C, K)`,
`Δ_{(A/I ⊗ B/J)/A} = C`. The comparison with the relative site for rings satisfying the
Tor-amplitude condition needs the cotangent complex (DD.0) and is stated in the document. -/
theorem prismaticCohomology_tensor_perfect {A B C : Type} [CommRing A] [CommRing B] [CommRing C]
    (P : Prism p A) (hP : IsTransversal p P) [Module.Flat ℤ P.bar] (Q : Prism p B)
    (hQ : Q.IsPerfect) (K : Prism p C) (i : P.Hom K) (j : Q.Hom K) (hK : IsCoproduct p i j) :
    Nonempty (prismaticCohomology P (TensorProduct ℤ P.bar Q.bar) ≅
      ((ModuleCat.restrictScalars i.toRingHom).mapDerivedCategory).obj (unitComplex C)) := by sorry

/-- Node `PR.5/absolute-relative-comparison` (Bhatt–Lurie, Proposition 4.4.8): over a perfect
prism the prismatic cohomology sheaf is the pushforward of relative prismatic cohomology. -/
theorem prismaticSheaf_iso_pushforward {A : Type} [CommRing A] (P : Prism p A)
    (hP : P.IsPerfect) (R : Type) [CommRing R] [Algebra P.bar R] :
    Nonempty (prismaticSheaf p R ≅
      ((carriers p).prismPushforward P).obj (prismaticCohomology P R)) := by sorry

/-- Node `PR.5/absolute-site-comparison` (Bhatt–Lurie, Theorem 4.4.30) in the case where the
site has an initial object: for a perfect prism `(A, I)`, `H_Δ(A / I) = ρ_{A*} A`. The general
statement is a limit over the absolute prismatic site in the complete derived category. -/
theorem prismaticSheaf_perfectoid {A : Type} [CommRing A] (P : Prism p A) (hP : P.IsPerfect) :
    Nonempty (prismaticSheaf p P.bar ≅ ((carriers p).prismPushforward P).obj (unitComplex A)) := by
  sorry

/-- Node `PR.5/absolute-prismatic-descent` (Bhatt–Lurie, Corollary 4.4.18), a consequence:
absolute prismatic complexes vanish when `p` is invertible. -/
theorem absolutePrismatic_isZero_of_isUnit (R : Type) [CommRing R] (h : IsUnit (p : R))
    (m n : ℤ) : Limits.IsZero (absolutePrismatic p R m n) := by sorry

/-- Invariance under `p`-completion (Bhatt–Lurie, Corollary 4.4.18), for `p`-torsion-free rings:
a map inducing isomorphisms modulo every power of `p` induces an isomorphism on `H_Δ`. -/
theorem prismaticSheafMap_isIso_of_padic_iso {R S : Type} [CommRing R] [CommRing S] (f : R →+* S)
    (hR : ∀ x : R, (p : R) * x = 0 → x = 0) (hS : ∀ x : S, (p : S) * x = 0 → x = 0)
    (hsurj : ∀ (k : ℕ) (s : S), ∃ r : R, f r - s ∈ Ideal.span {(p : S) ^ k})
    (hinj : ∀ (k : ℕ) (r : R), f r ∈ Ideal.span {(p : S) ^ k} → r ∈ Ideal.span {(p : R) ^ k}) :
    IsIso (prismaticSheafMap p f) := by sorry

/-- Node `PR.5/absolute-hodge-tate-cohomology`: the Hodge–Tate cohomology sheaf
`H_Δ̄(R) = ι^* H_Δ(R)` (Bhatt–Lurie, Construction 4.5.1). -/
noncomputable def hodgeTateSheaf (R : Type) [CommRing R] : (carriers p).DHT :=
  (carriers p).restrictHT.obj (prismaticSheaf p R)

/-- `Δ̄_R{n} = RΓ(WCart^HT, H_Δ̄(R){n})` (Bhatt–Lurie, Construction 4.5.5). -/
noncomputable def absoluteHodgeTate (R : Type) [CommRing R] (n : ℤ) : DZp p :=
  (carriers p).globalSectionsHT.obj
    (hodgeTateSheaf p R ⊗ (carriers p).restrictHT.obj ((carriers p).bkTwist n))

/-- The `p`-complete diffracted Hodge complex `η^* H_Δ̄(R)` (Bhatt–Lurie, Construction 4.7.1);
its Sen operator is `(senOperator p).app (hodgeTateSheaf p R)`. -/
noncomputable def diffractedHodge (R : Type) [CommRing R] : DZp p :=
  (carriers p).fibreEta.obj (hodgeTateSheaf p R)

/-- The conjugate filtration `Fil_i^conj` of the diffracted Hodge complex. -/
noncomputable def diffractedHodgeFil (R : Type) [CommRing R] (i : ℤ) : DZp p := sorry

/-- The map `Fil_i^conj → Ω̂^DHod_R`. -/
noncomputable def diffractedHodgeFilMap (R : Type) [CommRing R] (i : ℤ) :
    diffractedHodgeFil p R i ⟶ diffractedHodge p R := sorry

/-- Bhatt–Lurie, Remark 4.5.7: `Δ_R^{[m+1]}{n} → Δ_R^{[m]}{n} → Δ̄_R{m+n}`. -/
theorem absolutePrismatic_fibre_sequence (R : Type) [CommRing R] (m n : ℤ) :
    ∃ (f : absolutePrismatic p R (m + 1) n ⟶ absolutePrismatic p R m n)
      (g : absolutePrismatic p R m n ⟶ absoluteHodgeTate p R (m + n)), IsFibreSequence f g := by
  sorry

/-- Bhatt–Lurie, Remark 4.7.5: `Δ̄_R{n}` is the fibre of the Sen operator of `H_Δ̄(R){n}`, which
is `Θ + n` on the diffracted Hodge complex. -/
theorem absoluteHodgeTate_fibre_sequence (R : Type) [CommRing R] (n : ℤ) :
    ∃ f : absoluteHodgeTate p R n ⟶ (carriers p).fibreEta.obj
        (hodgeTateSheaf p R ⊗ (carriers p).restrictHT.obj ((carriers p).bkTwist n)),
      IsFibreSequence f ((senOperator p).app _) := by sorry

-- pr5_ht_integers_h1
example : Nonempty ((DerivedCategory.homologyFunctor (ModuleCat.{0} ℤ_[p]) 1).obj
    (absoluteHodgeTate p ℤ 0) ≅ ModuleCat.of ℤ_[p] ℤ_[p]) := by sorry

-- pr5_ht_integers_twist_h0
example (n : ℤ) (hn : n ≠ 0) : Limits.IsZero
    ((DerivedCategory.homologyFunctor (ModuleCat.{0} ℤ_[p]) 0).obj (absoluteHodgeTate p ℤ n)) := by
  sorry

-- pr5_ht_sheaf_integers
example : Nonempty (hodgeTateSheaf p ℤ ≅ 𝟙_ (carriers p).DHT) := by sorry

-- pr5_ht_diffracted_integers
example : Nonempty (diffractedHodge p ℤ ≅ unitComplex ℤ_[p]) := by sorry

/-- Complexes owned by other roadmaps, as data: `crystalline R = RΓ_crys(R / ℤ_p)` for an
`𝔽_p`-algebra `R` (`CrystallineCohomology:CR.2`); `derivedDeRham R` the `p`-complete derived
de Rham complex of `R` and `hodgeFil R m` its Hodge filtration with the maps `hodgeFilMap`
(`DerivedDeRhamCohomology:DD.2`); `cotangentPower R i` the `p`-completed `i`-th derived exterior
power of the cotangent complex (`DerivedDeRhamCohomology:DD.0`). -/
structure Imported where
  /-- `RΓ_crys(R / ℤ_p)`. -/
  crystalline : ∀ (R : Type) [CommRing R], DZp p
  /-- `dR̂_R`. -/
  derivedDeRham : ∀ (R : Type) [CommRing R], DZp p
  /-- `Fil^m_Hodge dR̂_R`. -/
  hodgeFil : ∀ (R : Type) [CommRing R], ℤ → DZp p
  /-- `Fil^m_Hodge dR̂_R → dR̂_R`. -/
  hodgeFilMap : ∀ (R : Type) [CommRing R] (m : ℤ), hodgeFil R m ⟶ derivedDeRham R
  /-- `LΩ̂^i_R`. -/
  cotangentPower : ∀ (R : Type) [CommRing R], ℕ → DZp p

/-- Node `PR.5/absolute-crystalline-comparison` (Bhatt–Lurie, Theorem 4.6.1) for smooth
`𝔽_p`-algebras; the theorem holds for quasisyntomic `𝔽_p`-schemes (DD.5). -/
theorem crystalline_comparison (X : Imported p) (R : Type) [CommRing R] [Algebra (ZMod p) R]
    [Algebra.Smooth (ZMod p) R] : Nonempty (prismaticComplex p R ≅ X.crystalline R) := by sorry

/-- Node `PR.5/absolute-de-rham-comparison` (Bhatt–Lurie, Proposition 5.4.8): the pullback of
`H_Δ(R)` to the de Rham point is the `p`-complete derived de Rham complex. -/
theorem deRhamPullback_prismaticSheaf (X : Imported p) (R : Type) [CommRing R] :
    Nonempty ((carriers p).deRhamPullback.obj (prismaticSheaf p R) ≅ X.derivedDeRham R) := by
  sorry

/-- Bhatt–Lurie, Theorem 5.4.2, for `p`-torsion-free `R` (so that `𝔽_p ⊗^L R = R / p`). -/
theorem deRham_comparison (X : Imported p) (R : Type) [CommRing R]
    (hR : ∀ x : R, (p : R) * x = 0 → x = 0) :
    Nonempty (prismaticComplex p (R ⧸ Ideal.span {(p : R)}) ≅ X.derivedDeRham R) := by sorry

/-- Node `PR.5/absolute-nygaard-filtration`: `Fil^m_N Δ_R{n}` (Bhatt–Lurie, Construction 5.5.3). -/
noncomputable def nygaardFil (R : Type) [CommRing R] (n m : ℤ) : DZp p := sorry

/-- The transition map `Fil^{m+1}_N → Fil^m_N`. -/
noncomputable def nygaardTransition (R : Type) [CommRing R] (n m : ℤ) :
    nygaardFil p R n (m + 1) ⟶ nygaardFil p R n m := sorry

theorem nygaardFil_of_nonpos (R : Type) [CommRing R] (n m : ℤ) (hm : m ≤ 0) :
    Nonempty (nygaardFil p R n m ≅ absolutePrismatic p R 0 n) := by sorry

/-- `gr^m_N Δ_R{n}`. -/
noncomputable def nygaardGr (R : Type) [CommRing R] (n m : ℤ) : DZp p := sorry

/-- The projection `Fil^m_N → gr^m_N`. -/
noncomputable def nygaardToGr (R : Type) [CommRing R] (n m : ℤ) :
    nygaardFil p R n m ⟶ nygaardGr p R n m := sorry

theorem nygaard_fibre_sequence (R : Type) [CommRing R] (n m : ℤ) :
    IsFibreSequence (nygaardTransition p R n m) (nygaardToGr p R n m) := by sorry

/-- Bhatt–Lurie, Remark 5.5.8: `gr^m_N Δ_R{n} → Fil_m^conj Ω̂^DHod_R → Fil_{m−1}^conj Ω̂^DHod_R`,
the second map being `Θ + m`. -/
theorem nygaardGr_fibre_sequence (R : Type) [CommRing R] (n m : ℤ) :
    ∃ (f : nygaardGr p R n m ⟶ diffractedHodgeFil p R m)
      (g : diffractedHodgeFil p R m ⟶ diffractedHodgeFil p R (m - 1)), IsFibreSequence f g := by
  sorry

/-- The filtered de Rham specialisation `Fil^m_N Δ_R{n} → Fil^m_Hodge dR̂_R`. -/
noncomputable def nygaardToHodge (X : Imported p) (R : Type) [CommRing R] (n m : ℤ) :
    nygaardFil p R n m ⟶ X.hodgeFil R m := sorry

-- pr5_nyg_fil_zero
example (R : Type) [CommRing R] (n : ℤ) :
    Nonempty (nygaardFil p R n 0 ≅ absolutePrismatic p R 0 n) :=
  nygaardFil_of_nonpos p R n 0 le_rfl

-- pr5_nyg_gr_fp
example (m : ℕ) : Nonempty (nygaardGr p (ZMod p) 0 m ≅
    (DerivedCategory.singleFunctor (ModuleCat.{0} ℤ_[p]) 0).obj
      (ModuleCat.of ℤ_[p] (ℤ_[p] ⧸ Ideal.span {(p : ℤ_[p])}))) := by sorry

-- pr5_nyg_gr_zero_integers
example : Nonempty (nygaardGr p ℤ 0 0 ≅ unitComplex ℤ_[p]) := by sorry

-- pr5_nyg_gr_one_integers
example : Limits.IsZero (nygaardGr p ℤ 0 1) := by sorry

/-- Node `PR.5/absolute-nygaard-graded-pieces` (Bhatt–Lurie, Proposition 5.5.12 and the Corollary
after Warning 5.5.17): `gr^m_N Δ_R ≅ LΩ̂^m_R[−m]` for `m < p`. -/
theorem nygaardGr_iso_cotangentPower (X : Imported p) (R : Type) [CommRing R] (m : ℕ)
    (hm : m < p) :
    Nonempty (nygaardGr p R 0 m ≅ (X.cotangentPower R m)⟦(-(m : ℤ))⟧) := by sorry

/-- Bhatt–Lurie, Proposition 5.5.19: `gr^m_N Δ_R{n}` has cohomology in degrees `≤ m`. -/
theorem nygaardGr_isLE (R : Type) [CommRing R] (n m : ℤ) :
    DerivedCategory.IsLE (nygaardGr p R n m) m := by sorry

/-- Node `PR.5/absolute-nygaard-perfect-prism` (Bhatt–Lurie, Corollary 5.6.3) for a perfectoid
ring `A / I`: every step of the absolute Nygaard filtration is concentrated in degree `0`. The
comparison with the relative Nygaard filtration of PR.3 is stated in the document. -/
theorem nygaardFil_discrete_of_perfect {A : Type} [CommRing A] (P : Prism p A)
    (hP : P.IsPerfect) (n m : ℤ) :
    DerivedCategory.IsLE (nygaardFil p P.bar n m) 0 ∧
      DerivedCategory.IsGE (nygaardFil p P.bar n m) 0 := by sorry

/-- Node `PR.5/absolute-frobenius`: the relative Frobenius `Φ : F^* H_Δ(R) → H_Δ(R)`
(Bhatt–Lurie, Construction 5.7.1). -/
noncomputable def relativeFrobenius (R : Type) [CommRing R] :
    (carriers p).frobPullback.obj (prismaticSheaf p R) ⟶ prismaticSheaf p R := sorry

/-- The Frobenius `φ : Δ_R → Δ_R`: pullback along `F`, then `RΓ(WCart, Φ)`. -/
noncomputable def frobeniusEnd (R : Type) [CommRing R] : prismaticComplex p R ⟶ prismaticComplex p R :=
  frobeniusPullbackMap p (prismaticSheaf p R) ≫
    (carriers p).globalSections.map (relativeFrobenius p R)

/-- `φ{n} : Fil^n_N Δ_R{n} → Δ_R{n}` (Bhatt–Lurie, Notation 5.7.5). -/
noncomputable def absoluteFrobenius (R : Type) [CommRing R] (n : ℤ) :
    nygaardFil p R n n ⟶ absolutePrismatic p R 0 n := sorry

/-- `Fil^m(φ{n}) : Fil^m_N Δ_R{n} → Δ_R^{[m−n]}{n}`; the index `m − n` corrects the index
`m + n` printed in Bhatt–Lurie Remark 5.7.8 and Proposition 5.7.9. -/
noncomputable def nygaardToIdealFil (R : Type) [CommRing R] (n m : ℤ) :
    nygaardFil p R n m ⟶ absolutePrismatic p R (m - n) n := sorry

theorem prismaticSheafMap_relativeFrobenius {R S : Type} [CommRing R] [CommRing S] (f : R →+* S) :
    (carriers p).frobPullback.map (prismaticSheafMap p f) ≫ relativeFrobenius p S =
      relativeFrobenius p R ≫ prismaticSheafMap p f := by sorry

-- pr5_frob_fp_iso
example : IsIso (frobeniusEnd p (ZMod p)) := by sorry

-- pr5_frob_zp_not_iso
example : ¬ IsIso (frobeniusEnd p ℤ_[p]) := by sorry

-- pr5_frob_twist_zp_iso
example (n : ℤ) (hn : 0 < n) : IsIso (absoluteFrobenius p ℤ_[p] n) := by sorry

end TauCeti.Prismatic.Absolute


/-! ## PR.6. q-crystalline charts and the AΩ comparison

Bhatt–Scholze §§16–18. A δ-`ℤ_p⟦q-1⟧`-algebra `D` is recorded as a δ-ring with an element
`q` such that `δ q = 0`; for a derived `(p, [p]_q)`-complete `D` this is the same datum.
Derived completeness of ideals, complete flatness, complete Tor-amplitude and completely
regular sequences belong to `DerivedDeRhamCohomology:DD.1` and are left out of the structures
below; each docstring says which conditions are left out. The framed algebra with its
automorphisms `γ_s` and `q`-derivatives is owned by `QWittVectors:QW.6`. -/

namespace TauCeti.Prismatic.QCrys

open CategoryTheory TauCeti.Delta

attribute [local instance] HasDerivedCategory.standard

universe u

variable {p : ℕ} [Fact p.Prime]

/-! ### Node `PR.6/q-divided-power-operation` -/

/-- `[p]_q = 1 + q + ⋯ + q^(p-1)`. Mathlib has no `q`-integers at the pin. -/
def pAnalog (p : ℕ) {D : Type*} [CommRing D] (q : D) : D := ∑ i ∈ Finset.range p, q ^ i

theorem pAnalog_eq_eval_cyclotomic (p : ℕ) [Fact p.Prime] {D : Type*} [CommRing D] (q : D) :
    pAnalog p q = (Polynomial.cyclotomic p D).eval q := by sorry

theorem pAnalog_mul_sub_one (p : ℕ) {D : Type*} [CommRing D] (q : D) :
    pAnalog p q * (q - 1) = q ^ p - 1 := by sorry

theorem pAnalog_one (p : ℕ) {D : Type*} [CommRing D] : pAnalog p (1 : D) = (p : D) := by sorry

/-- The ideal `N(D) = φ⁻¹([p]_q D)`. -/
noncomputable def frobeniusPreimageIdeal {D : Type*} [CommRing D] (d : Delta.Structure p D)
    (q : D) : Ideal D :=
  (Ideal.span {pAnalog p q}).comap (toFrobenius p d).1

/-- `γ(x) = φ(x)/[p]_q - δ(x)` for `x ∈ N(D)`; the quotient is unique when `[p]_q` is a
nonzerodivisor. -/
noncomputable def gamma {D : Type*} [CommRing D] (d : Delta.Structure p D) (q x : D)
    (hx : x ∈ frobeniusPreimageIdeal d q) : D :=
  Classical.choose (Ideal.mem_span_singleton'.1 (Ideal.mem_comap.1 hx)) - d.delta x

theorem pAnalog_mul_gamma {D : Type*} [CommRing D] (d : Delta.Structure p D) (q x : D)
    (hx : x ∈ frobeniusPreimageIdeal d q) :
    pAnalog p q * (gamma d q x hx + d.delta x) = (toFrobenius p d).1 x := by sorry

/-- Remark 16.6, additivity. The correction is PR.0's `addCorrection` with the opposite sign. -/
theorem gamma_add {D : Type*} [CommRing D] (d : Delta.Structure p D) (q : D)
    (hreg : ∀ a : D, pAnalog p q * a = 0 → a = 0) (x y : D)
    (hx : x ∈ frobeniusPreimageIdeal d q) (hy : y ∈ frobeniusPreimageIdeal d q) :
    gamma d q (x + y) (Ideal.add_mem _ hx hy) =
      gamma d q x hx + gamma d q y hy - addCorrection p x y := by sorry

/-- Remark 16.6, multiplicativity. -/
theorem gamma_mul {D : Type*} [CommRing D] (d : Delta.Structure p D) (q : D)
    (hreg : ∀ a : D, pAnalog p q * a = 0 → a = 0) (f x : D)
    (hx : x ∈ frobeniusPreimageIdeal d q) :
    gamma d q (f * x) (Ideal.mul_mem_left _ f hx) =
      (toFrobenius p d).1 f * gamma d q x hx - x ^ p * d.delta f := by sorry

theorem delta_pAnalog_sub_one_mem {D : Type*} [CommRing D] (d : Delta.Structure p D) (q : D)
    (hq : d.delta q = 0) : d.delta (pAnalog p q) - 1 ∈ Ideal.span {pAnalog p q} := by sorry

-- pr6_gamma_q_sub_one
example {D : Type*} [CommRing D] (d : Delta.Structure p D) (q : D) (hq : d.delta q = 0)
    (hreg : ∀ a : D, pAnalog p q * a = 0 → a = 0) (h : q - 1 ∈ frobeniusPreimageIdeal d q) :
    gamma d q (q - 1) h = (q - 1) - d.delta (q - 1) := by sorry

-- pr6_gamma_at_q_one
example {D : Type*} [CommRing D] (d : Delta.Structure p D) (x : D)
    (hx : x ∈ frobeniusPreimageIdeal d 1) : (p : D) * gamma d 1 x hx = x ^ p := by sorry

-- pr6_gamma_p_padic
example (d : Delta.Structure p ℤ_[p]) (h : (p : ℤ_[p]) ∈ frobeniusPreimageIdeal d 1) :
    gamma d 1 (p : ℤ_[p]) h = (p : ℤ_[p]) ^ (p - 1) := by sorry

-- pr6_pAnalog_two
example {D : Type*} [CommRing D] (q : D) : pAnalog 2 q = 1 + q := by sorry

-- pr6_p_not_mem_frobenius_preimage
example (d : Delta.Structure p (PowerSeries ℤ_[p])) :
    (p : PowerSeries ℤ_[p]) ∉ frobeniusPreimageIdeal d (1 + PowerSeries.X) := by sorry

/-! ### Node `PR.6/q-pd-pair` -/

/-- A `q`-PD pair (Bhatt–Scholze Definition 16.2). Left out, as notions of
`DerivedDeRhamCohomology:DD.1`: the derived `(p, [p]_q)`-completeness of the ideal `I`, and
the finite complete Tor-amplitude of `D/(q-1)` over `D`. Completeness of `D` is recorded
classically; under condition (2) it is equivalent to derived completeness. -/
structure QPDPair (p : ℕ) [Fact p.Prime] (D : Type u) [CommRing D] where
  /-- The δ-structure. -/
  δ : Delta.Structure p D
  /-- The image of `q`. -/
  q : D
  /-- `δ q = 0`: `D` is a δ-algebra over `ℤ_p⟦q-1⟧`. -/
  delta_q : δ.delta q = 0
  /-- The `q`-PD ideal. -/
  I : Ideal D
  /-- The pair lies over `(ℤ_p⟦q-1⟧, (q-1))`. -/
  sub_one_mem : q - 1 ∈ I
  /-- Condition (1a): `φ(I) ⊆ [p]_q D`. -/
  frobenius_mem : ∀ x ∈ I, x ∈ frobeniusPreimageIdeal δ q
  /-- Condition (1b): `γ(I) ⊆ I`. -/
  gamma_mem : ∀ x (hx : x ∈ I), gamma δ q x (frobenius_mem x hx) ∈ I
  /-- Condition (2a): `D` is `[p]_q`-torsion-free. -/
  pAnalog_regular : ∀ a : D, pAnalog p q * a = 0 → a = 0
  /-- Condition (2b): `D/[p]_q` has bounded `p^∞`-torsion. -/
  bounded : ∃ n : ℕ, ∀ x : D ⧸ Ideal.span {pAnalog p q},
    (∃ m : ℕ, (p : D ⧸ Ideal.span {pAnalog p q}) ^ m * x = 0) →
      (p : D ⧸ Ideal.span {pAnalog p q}) ^ n * x = 0
  /-- Condition (3a): `D/(q-1)` is `p`-torsion-free. -/
  p_torsionFree : ∀ a : D ⧸ Ideal.span {q - 1}, (p : D ⧸ Ideal.span {q - 1}) * a = 0 → a = 0
  /-- `D` is `(p, [p]_q)`-adically complete. -/
  isAdicComplete : IsAdicComplete (Ideal.span {(p : D), pAnalog p q}) D

/-- A morphism of `q`-PD pairs. -/
structure QPDPair.Hom {D E : Type u} [CommRing D] [CommRing E] (P : QPDPair p D)
    (Q : QPDPair p E) where
  /-- The underlying ring map. -/
  toRingHom : D →+* E
  /-- It commutes with δ. -/
  isDeltaHom : IsDeltaHom p P.δ Q.δ toRingHom
  /-- It sends `q` to `q`. -/
  map_q : toRingHom P.q = Q.q
  /-- It carries `I` into `I'`. -/
  map_I : P.I.map toRingHom ≤ Q.I

/-- The bounded prism `(D, ([p]_q))` of a `q`-PD pair. -/
noncomputable def QPDPair.prism {D : Type u} [CommRing D] (P : QPDPair p D) : Prism p D := sorry

theorem QPDPair.prism_I {D : Type u} [CommRing D] (P : QPDPair p D) :
    P.prism.I = Ideal.span {pAnalog p P.q} := by sorry

/-- A δ-PD pair is a `q`-PD pair with `q = 1`. -/
def QPDPair.IsDeltaPD {D : Type u} [CommRing D] (P : QPDPair p D) : Prop := P.q = 1

-- pr6_qpd_pair_initial
example : ∃ P : QPDPair p (PowerSeries ℤ_[p]),
    P.q = 1 + PowerSeries.X ∧ P.I = Ideal.span {PowerSeries.X} := by sorry

-- pr6_qpd_pair_classical
example : ∃ P : QPDPair p ℤ_[p], P.q = 1 ∧ P.I = Ideal.span {(p : ℤ_[p])} := by sorry

-- pr6_qpd_pair_zero_ideal
example : ∃ P : QPDPair p ℤ_[p], P.q = 1 ∧ P.I = ⊥ := by sorry

-- pr6_qpd_pair_p_not_mem
example (P : QPDPair p (PowerSeries ℤ_[p])) (h : P.q = 1 + PowerSeries.X) :
    (p : PowerSeries ℤ_[p]) ∉ P.I := by sorry

-- pr6_qpd_pair_sub_one_frobenius
example {D : Type u} [CommRing D] (P : QPDPair p D) :
    (toFrobenius p P.δ).1 (P.q - 1) = pAnalog p P.q * (P.q - 1) := by sorry

/-! ### Named statements on `q`-PD pairs -/

/-- Node `PR.6/delta-pd-pairs` (Remark 16.3): the ideal of a δ-PD pair has divided powers. -/
theorem QPDPair.exists_divided_power {D : Type u} [CommRing D] (P : QPDPair p D)
    (h : P.IsDeltaPD) (x : D) (hx : x ∈ P.I) (n : ℕ) (hn : 0 < n) :
    ∃ y ∈ P.I, (n.factorial : D) * y = x ^ n := by sorry

/-- Node `PR.6/q-pd-homological-properties` (1): `f ^ p ∈ (p, [p]_q)` for `f ∈ I`. -/
theorem QPDPair.pow_mem {D : Type u} [CommRing D] (P : QPDPair p D) (f : D) (hf : f ∈ P.I) :
    f ^ p ∈ Ideal.span {(p : D), pAnalog p P.q} := by sorry

/-- Node `PR.6/smallest-largest-q-pd-ideals` (a), Lemma 16.7, for every δ-ring with `δ q = 0`. -/
theorem frobenius_gamma_mem {D : Type*} [CommRing D] (d : Delta.Structure p D) (q : D)
    (hq : d.delta q = 0) (f z : D) (h : pAnalog p q * z = (toFrobenius p d).1 f) :
    (toFrobenius p d).1 (z - d.delta f) ∈ Ideal.span {pAnalog p q} := by sorry

/-- Node `PR.6/smallest-largest-q-pd-ideals` (b), Corollary 16.8: `(q-1)` is a `q`-PD ideal. -/
theorem QPDPair.exists_sub_one {D : Type u} [CommRing D] (P : QPDPair p D) :
    ∃ P' : QPDPair p D, P'.δ = P.δ ∧ P'.q = P.q ∧ P'.I = Ideal.span {P.q - 1} := by sorry

/-- Node `PR.6/smallest-largest-q-pd-ideals` (b): every `q`-PD ideal lies between `(q-1)` and
`φ⁻¹([p]_q D)`. -/
theorem QPDPair.span_sub_one_le {D : Type u} [CommRing D] (P : QPDPair p D) :
    Ideal.span {P.q - 1} ≤ P.I ∧ P.I ≤ frobeniusPreimageIdeal P.δ P.q := by sorry

/-! ### Node `PR.6/q-pd-envelope` -/

/-- The ring `D_{J,q}(P)` for `J = (I, x_1, …, x_r)` (Lemma 16.10). Left out (DD.1): `P` is
derived complete and completely flat over `D`, and `x` is completely regular relative to `D`. -/
noncomputable def envelope {D P : Type u} [CommRing D] [CommRing P] [Algebra D P]
    (B : QPDPair p D) (dP : Delta.Structure p P) {r : ℕ} (x : Fin r → P) : CommRingCat.{u} := sorry

/-- The canonical map `P → D_{J,q}(P)`. -/
noncomputable def envelopeMap {D P : Type u} [CommRing D] [CommRing P] [Algebra D P]
    (B : QPDPair p D) (dP : Delta.Structure p P) {r : ℕ} (x : Fin r → P) :
    P →+* envelope B dP x := sorry

/-- The `q`-PD pair `(D_{J,q}(P), K)`. -/
noncomputable def envelopePair {D P : Type u} [CommRing D] [CommRing P] [Algebra D P]
    (B : QPDPair p D) (dP : Delta.Structure p P) {r : ℕ} (x : Fin r → P) :
    QPDPair p (envelope B dP x) := sorry

theorem envelopeMap_delta {D P : Type u} [CommRing D] [CommRing P] [Algebra D P]
    (B : QPDPair p D) (dP : Delta.Structure p P) {r : ℕ} (x : Fin r → P) :
    IsDeltaHom p dP (envelopePair B dP x).δ (envelopeMap B dP x) := by sorry

theorem envelope_frobenius_mem {D P : Type u} [CommRing D] [CommRing P] [Algebra D P]
    (B : QPDPair p D) (dP : Delta.Structure p P) {r : ℕ} (x : Fin r → P) (i : Fin r) :
    (toFrobenius p (envelopePair B dP x).δ).1 (envelopeMap B dP x (x i)) ∈
      Ideal.span {pAnalog p (envelopePair B dP x).q} := by sorry

theorem envelopeMap_mem {D P : Type u} [CommRing D] [CommRing P] [Algebra D P]
    (B : QPDPair p D) (dP : Delta.Structure p P) {r : ℕ} (x : Fin r → P) :
    (B.I.map (algebraMap D P) ⊔ Ideal.span (Set.range x)).map (envelopeMap B dP x) ≤
      (envelopePair B dP x).I := by sorry

/-- `P/J ≅ D_{J,q}(P)/K`. -/
noncomputable def envelopeQuotientEquiv {D P : Type u} [CommRing D] [CommRing P] [Algebra D P]
    (B : QPDPair p D) (dP : Delta.Structure p P) {r : ℕ} (x : Fin r → P) :
    (P ⧸ (B.I.map (algebraMap D P) ⊔ Ideal.span (Set.range x))) ≃+*
      (envelope B dP x ⧸ (envelopePair B dP x).I) := sorry

/-- The universal property: existence. -/
noncomputable def envelopeLift {D P : Type u} [CommRing D] [CommRing P] [Algebra D P]
    (B : QPDPair p D) (dP : Delta.Structure p P) {r : ℕ} (x : Fin r → P)
    {E : Type u} [CommRing E] (Q : QPDPair p E) (g : P →+* E) (hδ : IsDeltaHom p dP Q.δ g)
    (hq : g (algebraMap D P B.q) = Q.q)
    (hJ : (B.I.map (algebraMap D P) ⊔ Ideal.span (Set.range x)).map g ≤ Q.I) :
    envelope B dP x →+* E := sorry

theorem envelopeLift_comp {D P : Type u} [CommRing D] [CommRing P] [Algebra D P]
    (B : QPDPair p D) (dP : Delta.Structure p P) {r : ℕ} (x : Fin r → P)
    {E : Type u} [CommRing E] (Q : QPDPair p E) (g : P →+* E) (hδ : IsDeltaHom p dP Q.δ g)
    (hq : g (algebraMap D P B.q) = Q.q)
    (hJ : (B.I.map (algebraMap D P) ⊔ Ideal.span (Set.range x)).map g ≤ Q.I) :
    (envelopeLift B dP x Q g hδ hq hJ).comp (envelopeMap B dP x) = g := by sorry

/-- The universal property: uniqueness. -/
theorem envelopeLift_unique {D P : Type u} [CommRing D] [CommRing P] [Algebra D P]
    (B : QPDPair p D) (dP : Delta.Structure p P) {r : ℕ} (x : Fin r → P)
    {E : Type u} [CommRing E] (Q : QPDPair p E) (f g : envelope B dP x →+* E)
    (hf : IsDeltaHom p (envelopePair B dP x).δ Q.δ f)
    (hg : IsDeltaHom p (envelopePair B dP x).δ Q.δ g)
    (h : f.comp (envelopeMap B dP x) = g.comp (envelopeMap B dP x)) : f = g := by sorry

-- pr6_envelope_empty_sequence
example {D : Type u} [CommRing D] (B : QPDPair p D) :
    Function.Bijective (envelopeMap B B.δ (fun i : Fin 0 => i.elim0)) := by sorry

-- pr6_envelope_frobenius_divisible
example {D P : Type u} [CommRing D] [CommRing P] [Algebra D P]
    (B : QPDPair p D) (dP : Delta.Structure p P) (x : Fin 1 → P) :
    ∃ z : envelope B dP x,
      pAnalog p (envelopePair B dP x).q * z =
          (toFrobenius p (envelopePair B dP x).δ).1 (envelopeMap B dP x (x 0)) ∧
        z - (envelopePair B dP x).δ.delta (envelopeMap B dP x (x 0)) ∈ (envelopePair B dP x).I := by
  sorry

-- pr6_envelope_universal_identity
example {D P : Type u} [CommRing D] [CommRing P] [Algebra D P]
    (B : QPDPair p D) (dP : Delta.Structure p P) {r : ℕ} (x : Fin r → P)
    (f : envelope B dP x →+* envelope B dP x)
    (hf : IsDeltaHom p (envelopePair B dP x).δ (envelopePair B dP x).δ f)
    (h : f.comp (envelopeMap B dP x) = envelopeMap B dP x) : f = RingHom.id _ := by sorry

-- pr6_envelope_not_surjective
example : ¬ ∃ z : Polynomial (PowerSeries ℤ_[p]),
    Polynomial.C (pAnalog p (1 + PowerSeries.X : PowerSeries ℤ_[p])) * z = Polynomial.X ^ p := by
  sorry

/-! ### Node `PR.6/q-crystalline-site` -/

/-- A `q`-PD thickening of `R` relative to `(D, I)`: an object of `(R/D)_{q-crys}`. -/
structure Thickening {D : Type u} [CommRing D] (B : QPDPair p D) (R : Type u) [CommRing R]
    [Algebra (D ⧸ B.I) R] where
  /-- The ring `E`. -/
  E : CommRingCat.{u}
  /-- The `q`-PD pair `(E, J)`. -/
  pair : QPDPair p E
  /-- The structure map from `(D, I)`. -/
  fromBase : QPDPair.Hom B pair
  /-- The map `R → E/J`. -/
  fromR : R →+* (E ⧸ pair.I)
  /-- It is a map of `D/I`-algebras. -/
  comm : ∀ a : D, fromR (algebraMap (D ⧸ B.I) R (Ideal.Quotient.mk B.I a)) =
    Ideal.Quotient.mk pair.I (fromBase.toRingHom a)

/-- A morphism of `q`-PD thickenings. -/
structure Thickening.Hom {D : Type u} [CommRing D] {B : QPDPair p D} {R : Type u} [CommRing R]
    [Algebra (D ⧸ B.I) R] (T T' : Thickening B R) where
  /-- The morphism of `q`-PD pairs. -/
  toHom : QPDPair.Hom T.pair T'.pair
  /-- It is compatible with the maps from `D`. -/
  comp_base : toHom.toRingHom.comp T.fromBase.toRingHom = T'.fromBase.toRingHom
  /-- It is compatible with the maps from `R`. -/
  comp_R : ∀ r : R, Ideal.quotientMap T'.pair.I toHom.toRingHom
    (Ideal.map_le_iff_le_comap.1 toHom.map_I) (T.fromR r) = T'.fromR r

/-- The thickening `(D, I)` of `D/I`. -/
noncomputable def Thickening.base {D : Type u} [CommRing D] (B : QPDPair p D) :
    Thickening B (D ⧸ B.I) := sorry

/-- `qΩ_{R/D}` as an object of `D(D)` (Definition 16.12). Left out: `R` is `p`-completely
smooth over `D/I`. -/
noncomputable def qCrystallineCohomology {D : Type u} [CommRing D] (B : QPDPair p D)
    (R : Type u) [CommRing R] [Algebra (D ⧸ B.I) R] : DerivedCategory (ModuleCat.{u} D) := sorry

/-- The `φ_D`-semilinear Frobenius `φ_{R/D}`. -/
noncomputable def qCrystallineFrobenius {D : Type u} [CommRing D] (B : QPDPair p D)
    (R : Type u) [CommRing R] [Algebra (D ⧸ B.I) R] :
    qCrystallineCohomology B R ⟶
      (frobeniusPushforward B.prism).obj (qCrystallineCohomology B R) := sorry

/-- Evaluation at a thickening: `qΩ_{R/D} ⟶ E`. -/
noncomputable def qCrystallineEval {D : Type u} [CommRing D] (B : QPDPair p D)
    (R : Type u) [CommRing R] [Algebra (D ⧸ B.I) R] (T : Thickening B R) :
    qCrystallineCohomology B R ⟶
      (DerivedCategory.singleFunctor (ModuleCat.{u} D) 0).obj
        ((ModuleCat.restrictScalars T.fromBase.toRingHom).obj (ModuleCat.of T.E T.E)) := sorry

/-- Functoriality in `R`. -/
noncomputable def qCrystallineMap {D : Type u} [CommRing D] (B : QPDPair p D)
    (R R' : Type u) [CommRing R] [CommRing R'] [Algebra (D ⧸ B.I) R] [Algebra (D ⧸ B.I) R']
    (f : R →ₐ[D ⧸ B.I] R') : qCrystallineCohomology B R ⟶ qCrystallineCohomology B R' := sorry

/-- `qΩ_{(D/I)/D} ≅ D`. -/
noncomputable def qCrystallineBaseIso {D : Type u} [CommRing D] (B : QPDPair p D) :
    qCrystallineCohomology B (D ⧸ B.I) ≅
      (DerivedCategory.singleFunctor (ModuleCat.{u} D) 0).obj (ModuleCat.of D D) := sorry

-- pr6_qcrys_base
example {D : Type u} [CommRing D] (B : QPDPair p D) :
    IsIso (qCrystallineEval B (D ⧸ B.I) (Thickening.base B)) := by sorry

-- pr6_qcrys_eval_natural
example {D : Type u} [CommRing D] (B : QPDPair p D) (R : Type u) [CommRing R]
    [Algebra (D ⧸ B.I) R] (T T' : Thickening B R) (f : Thickening.Hom T T') :
    ∃ g, qCrystallineEval B R T ≫ g = qCrystallineEval B R T' := by sorry

-- pr6_qcrys_map_id
example {D : Type u} [CommRing D] (B : QPDPair p D) (R : Type u) [CommRing R]
    [Algebra (D ⧸ B.I) R] : qCrystallineMap B R R (AlgHom.id _ R) = 𝟙 _ := by sorry

-- pr6_qcrys_not_structure_ring
example : ∃ (B : QPDPair p (PowerSeries ℤ_[p])) (R : Type) (_ : CommRing R)
    (_ : Algebra (PowerSeries ℤ_[p] ⧸ B.I) R) (T : Thickening B R),
    ¬ IsIso (qCrystallineEval B R T) := by sorry

/-! ### Node `PR.6/q-crystalline-cech-alexander` -/

/-- The Čech–Alexander complex of a presentation `π : P → R` (Construction 16.13). Left out:
`P` is a completed polynomial `D`-algebra. -/
noncomputable def cechAlexanderComplex {D : Type u} [CommRing D] (B : QPDPair p D)
    (R : Type u) [CommRing R] [Algebra (D ⧸ B.I) R] (P : Type u) [CommRing P] [Algebra D P]
    (π : P →+* R) : CochainComplex (ModuleCat.{u} D) ℤ := sorry

/-- It computes `qΩ_{R/D}`. -/
noncomputable def cechAlexanderIso {D : Type u} [CommRing D] (B : QPDPair p D)
    (R : Type u) [CommRing R] [Algebra (D ⧸ B.I) R] (P : Type u) [CommRing P] [Algebra D P]
    (π : P →+* R) (hπ : Function.Surjective π) :
    DerivedCategory.Q.obj (cechAlexanderComplex B R P π) ≅ qCrystallineCohomology B R := sorry

/-- The weakly initial thickening `D_{J,q}(F)`. -/
noncomputable def cechAlexanderZero {D : Type u} [CommRing D] (B : QPDPair p D)
    (R : Type u) [CommRing R] [Algebra (D ⧸ B.I) R] (P : Type u) [CommRing P] [Algebra D P]
    (π : P →+* R) : Thickening B R := sorry

theorem cechAlexanderZero_weaklyInitial {D : Type u} [CommRing D] (B : QPDPair p D)
    (R : Type u) [CommRing R] [Algebra (D ⧸ B.I) R] (P : Type u) [CommRing P] [Algebra D P]
    (π : P →+* R) (hπ : Function.Surjective π) (T : Thickening B R) :
    Nonempty (Thickening.Hom (cechAlexanderZero B R P π) T) := by sorry

/-- The small complex of Remark 16.16, for a δ-`D`-algebra `P` with a surjection onto `R`.
Left out: `P` is completely (ind-)smooth over `D`. -/
noncomputable def cechAlexanderSmallComplex {D : Type u} [CommRing D] (B : QPDPair p D)
    (R : Type u) [CommRing R] [Algebra (D ⧸ B.I) R] (P : Type u) [CommRing P] [Algebra D P]
    (dP : Delta.Structure p P) (π : P →+* R) : CochainComplex (ModuleCat.{u} D) ℤ := sorry

/-- It also computes `qΩ_{R/D}`. -/
noncomputable def cechAlexanderSmallIso {D : Type u} [CommRing D] (B : QPDPair p D)
    (R : Type u) [CommRing R] [Algebra (D ⧸ B.I) R] (P : Type u) [CommRing P] [Algebra D P]
    (dP : Delta.Structure p P) (π : P →+* R) (hπ : Function.Surjective π) :
    DerivedCategory.Q.obj (cechAlexanderSmallComplex B R P dP π) ≅
      qCrystallineCohomology B R := sorry

-- pr6_cech_alexander_independent
example {D : Type u} [CommRing D] (B : QPDPair p D) (R : Type u) [CommRing R]
    [Algebra (D ⧸ B.I) R] (P P' : Type u) [CommRing P] [Algebra D P] [CommRing P'] [Algebra D P']
    (π : P →+* R) (π' : P' →+* R) (hπ : Function.Surjective π) (hπ' : Function.Surjective π') :
    Nonempty (DerivedCategory.Q.obj (cechAlexanderComplex B R P π) ≅
      DerivedCategory.Q.obj (cechAlexanderComplex B R P' π')) := by sorry

-- pr6_cech_alexander_weakly_initial_base
example {D : Type u} [CommRing D] (B : QPDPair p D) (P : Type u) [CommRing P] [Algebra D P]
    (π : P →+* D ⧸ B.I) (hπ : Function.Surjective π) :
    Nonempty (Thickening.Hom (cechAlexanderZero B (D ⧸ B.I) P π) (Thickening.base B)) := by sorry

-- pr6_cech_alexander_base_presentation
example {D : Type u} [CommRing D] (B : QPDPair p D) :
    Nonempty (DerivedCategory.Q.obj (cechAlexanderComplex B (D ⧸ B.I) D (Ideal.Quotient.mk B.I)) ≅
      (DerivedCategory.singleFunctor (ModuleCat.{u} D) 0).obj (ModuleCat.of D D)) := by sorry

-- pr6_cech_alexander_not_cech_nerve
example : ∃ (B : QPDPair p (PowerSeries ℤ_[p])) (R : Type) (_ : CommRing R)
    (_ : Algebra (PowerSeries ℤ_[p] ⧸ B.I) R),
    IsEmpty (qCrystallineCohomology B R ≅
      (DerivedCategory.singleFunctor (ModuleCat.{0} (PowerSeries ℤ_[p])) 0).obj
        (ModuleCat.of (PowerSeries ℤ_[p]) (PowerSeries ℤ_[p]))) := by sorry

/-! ### Comparisons of `q`-crystalline cohomology -/

/-- Imported data for the comparison with crystalline cohomology. -/
structure CrystallineInput {D : Type u} [CommRing D] (B : QPDPair p D) where
  /-- Owner `DerivedDeRhamCohomology:DD.1`: completed base change along `D → D/(q-1)`. -/
  baseChange : DerivedCategory (ModuleCat.{u} D) ⥤
    DerivedCategory (ModuleCat.{u} (D ⧸ Ideal.span {B.q - 1}))
  /-- Owner `CrystallineCohomology:CR.2`: `RΓ_crys(R/(D/(q-1)))`. -/
  crystalline : DerivedCategory (ModuleCat.{u} (D ⧸ Ideal.span {B.q - 1}))

/-- Node `PR.6/q-crystalline-crystalline-comparison` (Theorem 16.14), stated against the
imported completed base change and crystalline cohomology of `R`. -/
theorem qCrystalline_crystalline_comparison {D : Type u} [CommRing D] (B : QPDPair p D)
    (R : Type u) [CommRing R] [Algebra (D ⧸ B.I) R] (X : CrystallineInput B) :
    Nonempty (X.baseChange.obj (qCrystallineCohomology B R) ≅ X.crystalline) := by sorry

/-- Node `PR.6/q-pd-thickening-invariance` (Theorem 16.17). Left out: `Rt` is `p`-completely
smooth over `D/J` and `ψ` exhibits `R` as its completed base change to `D/I`. -/
theorem qCrystalline_thickening_invariance {D : Type u} [CommRing D] (BJ BI : QPDPair p D)
    (hδ : BJ.δ = BI.δ) (hq : BJ.q = BI.q) (hle : BJ.I ≤ BI.I)
    (Rt R : Type u) [CommRing Rt] [CommRing R] [Algebra (D ⧸ BJ.I) Rt] [Algebra (D ⧸ BI.I) R]
    (ψ : Rt →+* R) (hψ : Function.Surjective ψ) :
    Nonempty (qCrystallineCohomology BJ Rt ≅ qCrystallineCohomology BI R) := by sorry

/-- Node `PR.6/q-crystalline-prismatic-comparison` (Theorem 16.18): `Δ_{R^{(1)}/D} ≅ qΩ_{R/D}`
over the prism `(D, ([p]_q))`. The Frobenius twist `R1 = R^{(1)}` is given with its
`φ_D`-semilinear map `ψ : R → R1`. Left out: `R` is `p`-completely smooth and `ψ` exhibits `R1`
as the `p`-completed base change of `R` along `φ_D`. -/
theorem qCrystalline_prismatic_comparison {D : Type u} [CommRing D] (B : QPDPair p D)
    (R : Type u) [CommRing R] [Algebra (D ⧸ B.I) R]
    (R1 : Type u) [CommRing R1] [Algebra B.prism.bar R1] (ψ : R →+* R1)
    (hψ : ∀ a : D, ψ (algebraMap (D ⧸ B.I) R (Ideal.Quotient.mk B.I a)) =
      algebraMap B.prism.bar R1 (Ideal.Quotient.mk B.prism.I (B.prism.φ a))) :
    Nonempty (prismaticCohomology B.prism R1 ≅ qCrystallineCohomology B R) := by sorry

/-! ### Node `PR.6/framed-q-pd-datum` -/

/-- A framed `D`-algebra with its structure (Construction 16.19). The coordinates, the
automorphisms `γ_s` and the `q`-derivatives are owned by `QWittVectors:QW.6`; the δ-structure
with `δ X_s = 0` is PR.6's. Left out (DD.1, QW.6): `P` is derived `(p, [p]_q)`-complete and the
framing `D[X_s] → P` is `(p, [p]_q)`-completely ind-étale. -/
structure FramedAlgebra (p : ℕ) [Fact p.Prime] (D P : Type u) [CommRing D] [CommRing P]
    [Algebra D P] (q : D) (S : Type) where
  /-- The coordinates `X_s`. -/
  X : S → P
  /-- The automorphisms `γ_s`. -/
  γ : S → (P ≃ₐ[D] P)
  /-- The `q`-derivatives `∇_{q,s}`. -/
  nabla : S → P → P
  /-- The δ-structure. -/
  δ : Delta.Structure p P
  delta_coord : ∀ s, δ.delta (X s) = 0
  gamma_coord_self : ∀ s, γ s (X s) = algebraMap D P q * X s
  gamma_coord_of_ne : ∀ s t, s ≠ t → γ s (X t) = X t
  gamma_comm : ∀ s t f, γ s (γ t f) = γ t (γ s f)
  gamma_delta : ∀ s f, γ s (δ.delta f) = δ.delta (γ s f)
  sub_one_mul_coord_mul_nabla : ∀ s f, algebraMap D P (q - 1) * X s * nabla s f = γ s f - f

/-- A framed `q`-PD datum `(P, S, J)` for `R`: `J` is the kernel of `toR` (Construction 16.20). -/
structure FramedDatum (p : ℕ) [Fact p.Prime] {D : Type u} [CommRing D] (B : QPDPair p D)
    (R : Type u) [CommRing R] [Algebra (D ⧸ B.I) R] (P : Type u) [CommRing P] [Algebra D P]
    (S : Type) where
  /-- The framed algebra. -/
  framed : FramedAlgebra p D P B.q S
  /-- The surjection `P → R`. -/
  toR : P →+* R
  toR_surjective : Function.Surjective toR
  toR_algebraMap : ∀ a : D, toR (algebraMap D P a) =
    algebraMap (D ⧸ B.I) R (Ideal.Quotient.mk B.I a)

/-- A morphism of framed `q`-PD data. -/
structure FramedDatum.Hom {D : Type u} [CommRing D] {B : QPDPair p D}
    {R R' : Type u} [CommRing R] [CommRing R'] [Algebra (D ⧸ B.I) R] [Algebra (D ⧸ B.I) R']
    {P P' : Type u} [CommRing P] [CommRing P'] [Algebra D P] [Algebra D P'] {S S' : Type}
    (F : FramedDatum p B R P S) (F' : FramedDatum p B R' P' S') where
  /-- The map of `D`-algebras. -/
  toAlgHom : P →ₐ[D] P'
  /-- The map on coordinates. -/
  onCoord : S → S'
  map_coord : ∀ s, toAlgHom (F.framed.X s) = F'.framed.X (onCoord s)
  map_ker : (RingHom.ker F.toR).map toAlgHom.toRingHom ≤ RingHom.ker F'.toR

-- pr6_framed_nabla_coord_pow
example {D P : Type u} [CommRing D] [CommRing P] [Algebra D P] (q : D) {S : Type}
    (F : FramedAlgebra p D P q S) (s : S)
    (hreg : ∀ a : P, algebraMap D P (q - 1) * F.X s * a = 0 → a = 0) (n : ℕ) :
    F.nabla s (F.X s ^ (n + 1)) =
      algebraMap D P (∑ i ∈ Finset.range (n + 1), q ^ i) * F.X s ^ n := by sorry

-- pr6_framed_nabla_const
example {D P : Type u} [CommRing D] [CommRing P] [Algebra D P] (q : D) {S : Type}
    (F : FramedAlgebra p D P q S) (s : S)
    (hreg : ∀ a : P, algebraMap D P (q - 1) * F.X s * a = 0 → a = 0) (a : D) :
    F.nabla s (algebraMap D P a) = 0 := by sorry

-- pr6_framed_gamma_frobenius
example {D P : Type u} [CommRing D] [CommRing P] [Algebra D P] (q : D) {S : Type}
    (F : FramedAlgebra p D P q S) (s : S) (f : P) :
    F.γ s ((toFrobenius p F.δ).1 f) = (toFrobenius p F.δ).1 (F.γ s f) := by sorry

-- pr6_framed_two_framings_gamma
example {D P : Type u} [CommRing D] [CommRing P] [Algebra D P] (q : D)
    (F F' : FramedAlgebra p D P q Unit) (h : F'.X () = F.X () + 1) :
    F'.γ () (F.X ()) = algebraMap D P q * F.X () + algebraMap D P (q - 1) := by sorry

/-! ### Node `PR.6/framed-q-de-rham-complex` (with Lemma 16.21) -/

/-- The `q`-PD envelope `D_{J,q}(P)` of a framed `q`-PD datum. -/
noncomputable def FramedDatum.envelope {D : Type u} [CommRing D] {B : QPDPair p D}
    {R : Type u} [CommRing R] [Algebra (D ⧸ B.I) R] {P : Type u} [CommRing P] [Algebra D P]
    {S : Type} (F : FramedDatum p B R P S) : CommRingCat.{u} := sorry

/-- The canonical map `P → D_{J,q}(P)`. -/
noncomputable def FramedDatum.envelopeMap {D : Type u} [CommRing D] {B : QPDPair p D}
    {R : Type u} [CommRing R] [Algebra (D ⧸ B.I) R] {P : Type u} [CommRing P] [Algebra D P]
    {S : Type} (F : FramedDatum p B R P S) : P →+* F.envelope := sorry

/-- `D_{J,q}(P)` as a `D`-algebra. -/
noncomputable instance FramedDatum.envelopeAlgebra {D : Type u} [CommRing D] {B : QPDPair p D}
    {R : Type u} [CommRing R] [Algebra (D ⧸ B.I) R] {P : Type u} [CommRing P] [Algebra D P]
    {S : Type} (F : FramedDatum p B R P S) : Algebra D F.envelope :=
  (F.envelopeMap.comp (algebraMap D P)).toAlgebra

/-- Lemma 16.21: the framed structure extended to `D_{J,q}(P)`. -/
noncomputable def FramedDatum.envelopeFramed {D : Type u} [CommRing D] {B : QPDPair p D}
    {R : Type u} [CommRing R] [Algebra (D ⧸ B.I) R] {P : Type u} [CommRing P] [Algebra D P]
    {S : Type} (F : FramedDatum p B R P S) : FramedAlgebra p D F.envelope B.q S := sorry

theorem FramedDatum.envelopeFramed_gamma {D : Type u} [CommRing D] {B : QPDPair p D}
    {R : Type u} [CommRing R] [Algebra (D ⧸ B.I) R] {P : Type u} [CommRing P] [Algebra D P]
    {S : Type} (F : FramedDatum p B R P S) (s : S) (f : P) :
    F.envelopeFramed.γ s (F.envelopeMap f) = F.envelopeMap (F.framed.γ s f) := by sorry

/-- The `q`-de Rham complex `qΩ^{*,□}_{D_{J,q}(P)/D}` (Construction 16.20). -/
noncomputable def FramedDatum.qDeRhamComplex {D : Type u} [CommRing D] {B : QPDPair p D}
    {R : Type u} [CommRing R] [Algebra (D ⧸ B.I) R] {P : Type u} [CommRing P] [Algebra D P]
    {S : Type} (F : FramedDatum p B R P S) : CochainComplex (ModuleCat.{u} D) ℤ := sorry

/-- Functoriality for morphisms of framed `q`-PD data. -/
noncomputable def FramedDatum.qDeRhamMap {D : Type u} [CommRing D] {B : QPDPair p D}
    {R R' : Type u} [CommRing R] [CommRing R'] [Algebra (D ⧸ B.I) R] [Algebra (D ⧸ B.I) R']
    {P P' : Type u} [CommRing P] [CommRing P'] [Algebra D P] [Algebra D P'] {S S' : Type}
    (F : FramedDatum p B R P S) (F' : FramedDatum p B R' P' S') (h : FramedDatum.Hom F F') :
    F.qDeRhamComplex ⟶ F'.qDeRhamComplex := sorry

/-- The `φ_D`-semilinear Frobenius of the `q`-de Rham complex. -/
noncomputable def FramedDatum.qDeRhamFrobenius {D : Type u} [CommRing D] {B : QPDPair p D}
    {R : Type u} [CommRing R] [Algebra (D ⧸ B.I) R] {P : Type u} [CommRing P] [Algebra D P]
    {S : Type} (F : FramedDatum p B R P S) :
    F.qDeRhamComplex ⟶
      ((ModuleCat.restrictScalars (toFrobenius p B.δ).1).mapHomologicalComplex
        (ComplexShape.up ℤ)).obj F.qDeRhamComplex := sorry

theorem FramedAlgebra.nabla_frobenius {D P : Type u} [CommRing D] [CommRing P] [Algebra D P]
    (q : D) {S : Type} (F : FramedAlgebra p D P q S) (s : S)
    (hq : F.δ.delta (algebraMap D P q) = 0)
    (hreg : ∀ a : P, algebraMap D P (q - 1) * F.X s * a = 0 → a = 0) (f : P) :
    F.nabla s ((toFrobenius p F.δ).1 f) =
      algebraMap D P (pAnalog p q) * F.X s ^ (p - 1) * (toFrobenius p F.δ).1 (F.nabla s f) := by
  sorry

-- pr6_qdr_polynomial_nabla
example {D : Type*} [CommRing D] (q : D) (n : ℕ) :
    Polynomial.aeval (Polynomial.C q * Polynomial.X) (Polynomial.X ^ (n + 1) : Polynomial D) -
        Polynomial.X ^ (n + 1) =
      Polynomial.C (q - 1) * Polynomial.X *
        (Polynomial.C (∑ i ∈ Finset.range (n + 1), q ^ i) * Polynomial.X ^ n) := by sorry

-- pr6_qdr_at_q_one_derivative
example {D : Type*} [CommRing D] (f : Polynomial D) :
    (f.sum fun n a => Polynomial.C (a * ∑ i ∈ Finset.range n, (1 : D) ^ i) * Polynomial.X ^ (n - 1)) =
      Polynomial.derivative f := by sorry

-- pr6_qdr_no_coordinates
example {D : Type u} [CommRing D] {B : QPDPair p D} {R : Type u} [CommRing R]
    [Algebra (D ⧸ B.I) R] {P : Type u} [CommRing P] [Algebra D P]
    (F : FramedDatum p B R P Empty) (n : ℤ) (hn : n ≠ 0) :
    Limits.IsZero (F.qDeRhamComplex.X n) := by sorry

-- pr6_qdr_two_framings_differ
example {D P : Type u} [CommRing D] [CommRing P] [Algebra D P] (q : D)
    (F F' : FramedAlgebra p D P q Unit) (h : F'.X () = F.X () + 1)
    (hreg : ∀ a : P, algebraMap D P (q - 1) * F.X () * a = 0 → a = 0)
    (hreg' : ∀ a : P, algebraMap D P (q - 1) * F'.X () * a = 0 → a = 0) :
    F'.nabla () (F.X () ^ 2) = F.nabla () (F.X () ^ 2) + algebraMap D P (q - 1) := by sorry

-- pr6_qdr_leibniz
example {D P : Type u} [CommRing D] [CommRing P] [Algebra D P] (q : D) {S : Type}
    (F : FramedAlgebra p D P q S) (s : S)
    (hreg : ∀ a : P, algebraMap D P (q - 1) * F.X s * a = 0 → a = 0) (f g : P) :
    F.nabla s (f * g) = f * F.nabla s g + F.γ s g * F.nabla s f := by sorry

/-- Node `PR.6/q-de-rham-comparison` (Theorem 16.22). Left out: `D` is flat over `ℤ_p⟦q-1⟧`
and `R` is `p`-completely smooth over `D/I`. -/
theorem qDeRham_comparison {D : Type u} [CommRing D] {B : QPDPair p D}
    {R : Type u} [CommRing R] [Algebra (D ⧸ B.I) R] {P : Type u} [CommRing P] [Algebra D P]
    {S : Type} (F : FramedDatum p B R P S) :
    Nonempty (DerivedCategory.Q.obj F.qDeRhamComplex ≅ qCrystallineCohomology B R) := by sorry

/-- Node `PR.6/change-of-framing`: two framed `q`-PD data for the same `R` have isomorphic
`q`-de Rham complexes in `D(D)`. -/
theorem change_of_framing {D : Type u} [CommRing D] {B : QPDPair p D}
    {R : Type u} [CommRing R] [Algebra (D ⧸ B.I) R] {P P' : Type u} [CommRing P] [CommRing P']
    [Algebra D P] [Algebra D P'] {S S' : Type}
    (F : FramedDatum p B R P S) (F' : FramedDatum p B R P' S') :
    Nonempty (DerivedCategory.Q.obj F.qDeRhamComplex ≅
      DerivedCategory.Q.obj F'.qDeRhamComplex) := by sorry

/-- Node `PR.6/q-de-rham-prismatic-comparison-zp` (Example 1.9 (4)): over the `q`-PD pair
`(ℤ_p⟦q-1⟧, (q-1))`, the framed `q`-de Rham complex of a framed lift `P` of `R` is the
prismatic cohomology of `R1 = R ⊗̂ ℤ_p[ζ_p]` relative to `(ℤ_p⟦q-1⟧, ([p]_q))`. Left out: `R` is
`p`-completely smooth over `ℤ_p` and `ψ` exhibits `R1` as its completed base change. -/
theorem qDeRham_prismatic_comparison_padic (B : QPDPair p (PowerSeries ℤ_[p]))
    (hq : B.q = 1 + PowerSeries.X) (hI : B.I = Ideal.span {PowerSeries.X})
    (R : Type) [CommRing R] [Algebra (PowerSeries ℤ_[p] ⧸ B.I) R]
    (P : Type) [CommRing P] [Algebra (PowerSeries ℤ_[p]) P] {S : Type}
    (F : FramedDatum p B R P S)
    (hF : RingHom.ker F.toR = Ideal.span {algebraMap (PowerSeries ℤ_[p]) P PowerSeries.X})
    (R1 : Type) [CommRing R1] [Algebra B.prism.bar R1] (ψ : R →+* R1)
    (hψ : ∀ a : PowerSeries ℤ_[p], ψ (algebraMap (PowerSeries ℤ_[p] ⧸ B.I) R
        (Ideal.Quotient.mk B.I a)) =
      algebraMap B.prism.bar R1 (Ideal.Quotient.mk B.prism.I (B.prism.φ a))) :
    Nonempty (DerivedCategory.Q.obj F.qDeRhamComplex ≅ prismaticCohomology B.prism R1) := by
  sorry

end TauCeti.Prismatic.QCrys

namespace TauCeti.Prismatic.AOmega

open CategoryTheory TauCeti.Delta TauCeti.Prismatic.QCrys

attribute [local instance] HasDerivedCategory.standard

universe u

variable {p : ℕ} [Fact p.Prime]

/-- Node `PR.6/ainf-q-pd-pair` (Example 16.9 (2)): if `φ ξ = [p]_q` then `γ ξ = 1 - δ ξ`. -/
theorem gamma_xi {D : Type*} [CommRing D] (d : Delta.Structure p D) (q ξ : D)
    (hξ : (toFrobenius p d).1 ξ = pAnalog p q) (hreg : ∀ a : D, pAnalog p q * a = 0 → a = 0)
    (h : ξ ∈ frobeniusPreimageIdeal d q) : gamma d q ξ h = 1 - d.delta ξ := by sorry

/-! ### Node `PR.6/ainf-omega-comparison-map` -/

/-- Imported data of a chart `Σ` of the all-coordinates construction. -/
structure Chart (P : Type u) [CommRing P] (S : Type) where
  /-- Owner `AInfCohomology:AI.4`: the ring `A_inf(R_{Σ,∞})`. -/
  AinfRinf : CommRingCat.{u}
  /-- Owners `AInfCohomology:AI.3`, `AI.4`: the automorphisms `σ_s`. -/
  σ : S → (AinfRinf ≃+* AinfRinf)
  /-- Owner `AInfCohomology:AI.4` with PR.0: the map from the torus `P_Σ`. -/
  fromTorus : P →+* AinfRinf

/-- Imported data: the complex `AΩ_R` with its Frobenius. -/
structure AOmegaData {A : Type u} [CommRing A] (B : QPDPair p A) where
  /-- Owner `AInfCohomology:AI.3`: `AΩ_R` as an object of `D(A_inf)`. -/
  AΩ : DerivedCategory (ModuleCat.{u} A)
  /-- Owner `AInfCohomology:AI.3`: the Frobenius of `AΩ_R`. -/
  frobenius : AΩ ⟶ (frobeniusPushforward B.prism).obj AΩ

/-- `μ_0 : D_{J_Σ,q}(P_Σ) → A_inf(R_{Σ,∞})`, from the universal property of the envelope. -/
noncomputable def coordinateMap {A : Type u} [CommRing A] {B : QPDPair p A}
    {R : Type u} [CommRing R] [Algebra (A ⧸ B.I) R] {P : Type u} [CommRing P] [Algebra A P]
    {S : Type} (F : FramedDatum p B R P S) (ch : Chart P S) : F.envelope →+* ch.AinfRinf := sorry

theorem coordinateMap_comp {A : Type u} [CommRing A] {B : QPDPair p A}
    {R : Type u} [CommRing R] [Algebra (A ⧸ B.I) R] {P : Type u} [CommRing P] [Algebra A P]
    {S : Type} (F : FramedDatum p B R P S) (ch : Chart P S) :
    (coordinateMap F ch).comp F.envelopeMap = ch.fromTorus := by sorry

theorem coordinateMap_gamma {A : Type u} [CommRing A] {B : QPDPair p A}
    {R : Type u} [CommRing R] [Algebra (A ⧸ B.I) R] {P : Type u} [CommRing P] [Algebra A P]
    {S : Type} (F : FramedDatum p B R P S) (ch : Chart P S)
    (h : ∀ s f, ch.fromTorus (F.framed.γ s f) = ch.σ s (ch.fromTorus f)) (s : S)
    (x : F.envelope) :
    coordinateMap F ch (F.envelopeFramed.γ s x) = ch.σ s (coordinateMap F ch x) := by sorry

/-- `φ_A^*` on `D(A)` for a perfect prism: restriction of scalars along `φ⁻¹`. -/
noncomputable def frobeniusPullback {A : Type u} [CommRing A] (P : Prism p A) (h : P.IsPerfect) :
    DerivedCategory (ModuleCat.{u} A) ⥤ DerivedCategory (ModuleCat.{u} A) :=
  (ModuleCat.restrictScalars (RingEquiv.ofBijective P.φ h).symm.toRingHom).mapDerivedCategory

/-- The comparison map `μ_R : qΩ_{R/A} ⟶ AΩ_R` (proof of Theorem 17.2). Left out: `A` is
`A_inf(O_C)` with `q = [ε]` and `I = (ξ)`, and `R` is `p`-completely smooth over `O_C`. -/
noncomputable def comparisonMap {A : Type u} [CommRing A] (B : QPDPair p A)
    (R : Type u) [CommRing R] [Algebra (A ⧸ B.I) R] (X : AOmegaData B) :
    qCrystallineCohomology B R ⟶ X.AΩ := sorry

theorem comparisonMap_frobenius {A : Type u} [CommRing A] (B : QPDPair p A)
    (R : Type u) [CommRing R] [Algebra (A ⧸ B.I) R] (X : AOmegaData B) :
    comparisonMap B R X ≫ X.frobenius =
      qCrystallineFrobenius B R ≫ (frobeniusPushforward B.prism).map (comparisonMap B R X) := by
  sorry

-- pr6_mu_torus_coordinate
example {A : Type u} [CommRing A] {B : QPDPair p A}
    {R : Type u} [CommRing R] [Algebra (A ⧸ B.I) R] {P : Type u} [CommRing P] [Algebra A P]
    {S : Type} (F : FramedDatum p B R P S) (ch : Chart P S)
    (h : ∀ s f, ch.fromTorus (F.framed.γ s f) = ch.σ s (ch.fromTorus f)) (s : S) :
    ch.σ s (ch.fromTorus (F.framed.X s)) =
      ch.fromTorus (algebraMap A P B.q) * ch.fromTorus (F.framed.X s) := by sorry

-- pr6_mu_point
example {A : Type u} [CommRing A] (B : QPDPair p A) :
    Nonempty (qCrystallineCohomology B (A ⧸ B.I) ≅
      (DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A A)) := by sorry

-- pr6_mu_frobenius_square
example {A : Type u} [CommRing A] (B : QPDPair p A)
    (R : Type u) [CommRing R] [Algebra (A ⧸ B.I) R] (X : AOmegaData B) :
    comparisonMap B R X ≫ X.frobenius =
      qCrystallineFrobenius B R ≫ (frobeniusPushforward B.prism).map (comparisonMap B R X) := by
  sorry

-- pr6_mu_needs_decalage
example {E : Type*} [CommRing E] (σ : E ≃+* E) (q q' y : E) (hq : q' ^ p = q) (hσq : σ q' = q')
    (hy : σ y = q' * y) : (q - 1) * y = σ (pAnalog p q' * y) - pAnalog p q' * y := by sorry

/-! ### Named theorems of §§17–18 -/

/-- Node `PR.6/ainf-omega-comparison` (Theorem 17.2): `μ_R` is an isomorphism. -/
theorem ainfOmega_comparison {A : Type u} [CommRing A] (B : QPDPair p A)
    (R : Type u) [CommRing R] [Algebra (A ⧸ B.I) R] (X : AOmegaData B) :
    IsIso (comparisonMap B R X) := by sorry

/-- Node `PR.6/ainf-omega-comparison` (Theorem 17.2): `AΩ_R ≅ φ_A^* Δ_{R/A}` for the perfect
prism `(A_inf, ker θ)`, whose ideal is the `q`-PD ideal `(ξ)`. The `E_∞`-structure of
Remark 17.3 needs `E_∞`-algebras, which Mathlib lacks, and is left out. -/
theorem ainfOmega_prismatic_comparison {A : Type u} [CommRing A] (Pθ : Prism p A)
    (hperf : Pθ.IsPerfect) (B : QPDPair p A) (hδ : Pθ.δ = B.δ) (hI : Pθ.I = B.I)
    (R : Type u) [CommRing R] [Algebra Pθ.bar R] (X : AOmegaData B) :
    Nonempty (X.AΩ ≅ (frobeniusPullback Pθ hperf).obj (prismaticCohomology Pθ R)) := by sorry

/-- Node `PR.6/comparison-uniqueness`, the formal step: an object without nontrivial
endomorphisms has at most one isomorphism to any other object. Theorem 18.2 itself is a
statement about the ∞-category of pairs `(G, η)` of Notation 18.1 and cannot be stated in
Mathlib at the pin. -/
theorem comparison_unique_of_endomorphisms_trivial {C : Type*} [Category C] {X Y : C}
    (h : ∀ f : X ⟶ X, f = 𝟙 X) (a b : X ≅ Y) : a = b := by sorry

end TauCeti.Prismatic.AOmega


/-! ## PR.7. Prismatic F-crystals and crystalline lattices

Bhatt–Scholze, *Prismatic F-crystals and crystalline Galois representations*. Crystals are
compatible families of finite projective modules over a diagram of rings; the site
`Spf(O_K)_Δ`, Galois representations, crystalline lattices and filtered φ-modules are
imported data (`SiteData`, `OKData`), whose docstrings name the owner of each field. -/

namespace TauCeti.Prismatic.FCrystal

open CategoryTheory TensorProduct TauCeti.Delta

universe u v w

variable {p : ℕ} [Fact p.Prime]

/-! ### Crystals in vector bundles (node `PR.7/prismatic-crystal`) -/

/-- An additive map `t : M → N`, semilinear over `g : R → S`, exhibits `N` as the base change
`S ⊗_R M`: every `g`-semilinear map from `M` to an `S`-module factors uniquely through `t`. -/
def IsBaseChangeAlong {R S : Type u} [CommRing R] [CommRing S] (g : R →+* S)
    {M N : Type u} [AddCommGroup M] [Module R M] [AddCommGroup N] [Module S N]
    (t : M →+ N) : Prop :=
  (∀ (a : R) (x : M), t (a • x) = g a • t x) ∧
    ∀ (Q : Type u) [AddCommGroup Q] [Module S Q] (s : M →+ Q),
      (∀ (a : R) (x : M), s (a • x) = g a • s x) → ∃! l : N →ₗ[S] Q, ∀ x, l (t x) = s x

/-- A crystal in vector bundles over a diagram of rings `O : C ⥤ CommRingCat`: finite projective
modules `M c` with functorial semilinear transition maps that are base changes. For `C` the
category of bounded prisms over `X` and `O = O_Δ` this is `Vect(X_Δ, O_Δ) = lim Vect(A)`;
functoriality of `res` is the cocycle condition. -/
structure Crystal (C : Type v) [Category.{w} C] (O : C ⥤ CommRingCat.{u}) where
  /-- The value on an object. -/
  M : C → Type u
  [addCommGroup : ∀ c, AddCommGroup (M c)]
  [module : ∀ c, Module (O.obj c) (M c)]
  /-- Each value is finitely generated. -/
  finite : ∀ c, Module.Finite (O.obj c) (M c)
  /-- Each value is projective. -/
  projective : ∀ c, Module.Projective (O.obj c) (M c)
  /-- The transition map of an arrow, semilinear over `O.map f`. -/
  res : ∀ {c d : C} (_ : c ⟶ d), M c →+ M d
  /-- Transition maps are functorial: identities. -/
  res_id : ∀ (c : C) (x : M c), res (𝟙 c) x = x
  /-- Transition maps are functorial: composition (the cocycle condition). -/
  res_comp : ∀ {c d e : C} (f : c ⟶ d) (g : d ⟶ e) (x : M c), res (f ≫ g) x = res g (res f x)
  /-- The crystal condition: `M d = O d ⊗_{O c} M c`. -/
  isBaseChange : ∀ {c d : C} (f : c ⟶ d), IsBaseChangeAlong (O.map f).hom (res f)

attribute [instance] Crystal.addCommGroup Crystal.module

variable {C : Type v} [Category.{w} C] {O : C ⥤ CommRingCat.{u}}

/-- A morphism of crystals. -/
structure Crystal.Hom (E F : Crystal C O) where
  /-- The component at an object. -/
  app : ∀ c, E.M c →ₗ[O.obj c] F.M c
  /-- Compatibility with transition maps. -/
  naturality : ∀ {c d : C} (f : c ⟶ d) (x : E.M c), app d (E.res f x) = F.res f (app c x)

/-- An isomorphism of crystals: mutually inverse morphisms. -/
structure Crystal.Iso (E F : Crystal C O) where
  /-- The morphism. -/
  hom : Crystal.Hom E F
  /-- Its inverse. -/
  inv : Crystal.Hom F E
  /-- `inv ∘ hom = id`. -/
  hom_inv : ∀ c (x : E.M c), inv.app c (hom.app c x) = x
  /-- `hom ∘ inv = id`. -/
  inv_hom : ∀ c (x : F.M c), hom.app c (inv.app c x) = x

/-- The unit crystal `c ↦ O c`. -/
noncomputable def Crystal.unit (C : Type v) [Category.{w} C] (O : C ⥤ CommRingCat.{u}) :
    Crystal C O where
  M c := O.obj c
  finite _ := sorry
  projective _ := sorry
  res f := (O.map f).hom.toAddMonoidHom
  res_id _ _ := sorry
  res_comp _ _ _ := sorry
  isBaseChange _ := sorry

/-- The tensor product of two crystals, with values `E c ⊗_{O c} F c`. -/
noncomputable def Crystal.tensor (E F : Crystal C O) : Crystal C O where
  M c := E.M c ⊗[O.obj c] F.M c
  finite _ := sorry
  projective _ := sorry
  res _ := sorry
  res_id _ _ := sorry
  res_comp _ _ _ := sorry
  isBaseChange _ := sorry

/-- Restriction of a crystal along a functor; for `Y_Δ → X_Δ` this is pullback along `Y → X`. -/
noncomputable def Crystal.pullback {D : Type v} [Category.{w} D] (G : D ⥤ C) (E : Crystal C O) :
    Crystal D (G ⋙ O) where
  M d := E.M (G.obj d)
  addCommGroup d := E.addCommGroup (G.obj d)
  module d := E.module (G.obj d)
  finite d := E.finite (G.obj d)
  projective d := E.projective (G.obj d)
  res f := E.res (G.map f)
  res_id _ _ := sorry
  res_comp _ _ _ := sorry
  isBaseChange _ := sorry

/-- Base change of a crystal along a map of diagrams of rings `O ⟶ O'`, with values
`O' c ⊗_{O c} E c`. -/
noncomputable def Crystal.baseChange {O' : C ⥤ CommRingCat.{u}} (α : O ⟶ O') (E : Crystal C O) :
    Crystal C O' := sorry

-- pr7_crystal_unit_eval
example (c : C) : (Crystal.unit C O).M c = (O.obj c : Type u) := sorry

-- pr7_crystal_base_change_id
example {R : Type u} [CommRing R] {M : Type u} [AddCommGroup M] [Module R M] :
    IsBaseChangeAlong (RingHom.id R) (AddMonoidHom.id M) := sorry

-- pr7_crystal_initial_object_eval
example (E F : Crystal C O) (c₀ : C) (h : Limits.IsInitial c₀) (g : E.M c₀ →ₗ[O.obj c₀] F.M c₀) :
    ∃! φ : Crystal.Hom E F, φ.app c₀ = g := sorry

-- pr7_crystal_hodge_tate_quotient_not_projective
example {A : Type u} [CommRing A] (P : Prism p A) (h : P.I ≠ ⊤) :
    ¬ Module.Projective A (A ⧸ P.I) := sorry

/-! ### F-crystals over a single prism (node `PR.7/f-crystal-over-prism`) -/

/-- The `A`-algebra `L` is `A[1/I]`, the ring of functions on `Spec A ∖ V(I)`: `I L = L` and `L`
is initial among `A`-algebras with this property. -/
structure IsAwayIdeal {A : Type u} [CommRing A] (I : Ideal A) (L : Type u) [CommRing L]
    [Algebra A L] : Prop where
  /-- `I` generates the unit ideal of `L`. -/
  map_eq_top : I.map (algebraMap A L) = ⊤
  /-- Initiality. -/
  exists_unique_lift : ∀ (B : Type u) [CommRing B] [Algebra A B],
    I.map (algebraMap A B) = ⊤ → ∃! _f : L →ₐ[A] B, True

/-- An F-crystal over the prism `P = (A, I)`: a finite projective `A`-module `M` with a
Frobenius-semilinear map `M → L ⊗_A M`, `L = A[1/I]`, whose linearisation
`(φ^* M)[1/I] → M[1/I]` is an isomorphism. `L` is meant to satisfy `IsAwayIdeal P.I L`.
For the Breuil–Kisin prism these are Breuil–Kisin modules. -/
structure OverPrism {A : Type u} [CommRing A] (P : Prism p A) (L : Type u) [CommRing L]
    [Algebra A L] where
  /-- The underlying module. -/
  M : Type u
  [addCommGroup : AddCommGroup M]
  [module : Module A M]
  /-- It is finitely generated. -/
  finite : Module.Finite A M
  /-- It is projective. -/
  projective : Module.Projective A M
  /-- The Frobenius, as a semilinear map to `M[1/I]`. -/
  frob : M →+ L ⊗[A] M
  /-- Its linearisation `(φ^* M)[1/I] → M[1/I]` is an isomorphism. -/
  isBaseChange : IsBaseChangeAlong ((algebraMap A L).comp P.φ) frob

attribute [instance] OverPrism.addCommGroup OverPrism.module

section OverPrism

variable {A : Type u} [CommRing A] {P : Prism p A} {L : Type u} [CommRing L] [Algebra A L]

/-- A morphism of F-crystals over a prism. -/
structure OverPrism.Hom (E F : OverPrism P L) where
  /-- The underlying linear map. -/
  toLinearMap : E.M →ₗ[A] F.M
  /-- It commutes with the Frobenius structures. -/
  comm : ∀ x : E.M, F.frob (toLinearMap x) = LinearMap.lTensor L toLinearMap (E.frob x)

/-- An F-crystal is effective when the Frobenius carries `M` into the image of `M`. -/
def OverPrism.IsEffective (E : OverPrism P L) : Prop :=
  ∀ x : E.M, ∃ y : E.M, E.frob x = (1 : L) ⊗ₜ[A] y

/-- The unit F-crystal `(A, φ)`. -/
noncomputable def OverPrism.unit (P : Prism p A) (L : Type u) [CommRing L] [Algebra A L] :
    OverPrism P L where
  M := A
  finite := sorry
  projective := sorry
  frob := ((TensorProduct.mk A L A 1).toAddMonoidHom).comp P.φ.toAddMonoidHom
  isBaseChange := sorry

/-- Base change of an F-crystal along a map of prisms `(A, I) → (B, J)`, with underlying module
`B ⊗_A M`; `L'` is `B[1/J]`. -/
noncomputable def OverPrism.baseChange {B : Type u} [CommRing B] {Q : Prism p B}
    (_f : Prism.Hom P Q) (L' : Type u) [CommRing L'] [Algebra B L'] (_E : OverPrism P L) :
    OverPrism Q L' := sorry

end OverPrism

-- pr7_over_prism_away_principal
example {A : Type u} [CommRing A] (P : Prism p A) (d : A) (h : P.I = Ideal.span {d}) :
    IsAwayIdeal P.I (Localization.Away d) := sorry

-- pr7_over_prism_unit_effective
example {A : Type u} [CommRing A] (P : Prism p A) (L : Type u) [CommRing L] [Algebra A L] :
    (OverPrism.unit P L).IsEffective := sorry

-- pr7_over_prism_rank_one_scaling
example {A : Type u} [CommRing A] (P : Prism p A) (L : Type u) [CommRing L] [Algebra A L]
    (hL : IsAwayIdeal P.I L) (r : Lˣ) :
    ∃ (E : OverPrism P L) (e : A ≃ₗ[A] E.M),
      ∀ a : A, E.frob (e a) = ((r : L) * algebraMap A L (P.φ a)) ⊗ₜ[A] e 1 := sorry

-- pr7_over_prism_frob_ne_zero
example {A : Type u} [CommRing A] (P : Prism p A) (L : Type u) [CommRing L] [Algebra A L]
    (E : OverPrism P L) [Nontrivial (L ⊗[A] E.M)] : E.frob ≠ 0 := sorry

/-! ### Prismatic F-crystals on a site (node `PR.7/prismatic-f-crystal`) -/

/-- The absolute prismatic site of a `p`-adic formal scheme `X`, as data.
* `C`, `O`, `prism`, `bounded`, `isDeltaHom`, `map_ideal`: the category of bounded prisms `(A, I)`
  over `X` with maps of prisms as arrows, and `O_Δ : (A, I) ↦ A`
  (owner `PrismaticCohomology:PR.5/absolute-prismatic-site`; `map_ideal` is rigidity, PR.0).
* `Oinv`, `toInv`, `isAway`: the diagram `O_Δ[1/I_Δ] : (A, I) ↦ A[1/I]` (this stage).
* `Olaurent`, `toLaurent`, `laurentFrob`: `O_Δ[1/I_Δ]^∧_p : (A, I) ↦ LaurentRing p (A[1/I])` with
  its Frobenius (this stage, node `PR.7/laurent-f-crystal`).
The flat topology and derived `(p, I)`-completeness (DD.1) are not recorded. -/
structure SiteData (p : ℕ) [Fact p.Prime] where
  /-- Prisms over `X`. -/
  C : Type (u + 1)
  [category : Category.{u} C]
  /-- The structure sheaf, evaluated on prisms. -/
  O : C ⥤ CommRingCat.{u}
  /-- The prism structure of each object. -/
  prism : ∀ c, Prism p (O.obj c)
  /-- Every object is a bounded prism. -/
  bounded : ∀ c, (prism c).IsBounded
  /-- Arrows are maps of δ-rings. -/
  isDeltaHom : ∀ {c d : C} (f : c ⟶ d), IsDeltaHom p (prism c).δ (prism d).δ (O.map f).hom
  /-- Rigidity: `I B = J`. -/
  map_ideal : ∀ {c d : C} (f : c ⟶ d), ((prism c).I).map (O.map f).hom = (prism d).I
  /-- `O_Δ[1/I_Δ]`. -/
  Oinv : C ⥤ CommRingCat.{u}
  /-- The localisation map. -/
  toInv : O ⟶ Oinv
  /-- `Oinv c` is `A[1/I]`. -/
  isAway : ∀ c, @IsAwayIdeal (O.obj c) _ (prism c).I (Oinv.obj c) _ (toInv.app c).hom.toAlgebra
  /-- `O_Δ[1/I_Δ]^∧_p`. -/
  Olaurent : C ⥤ CommRingCat.{u}
  /-- The completion map. -/
  toLaurent : Oinv ⟶ Olaurent
  /-- The Frobenius of `O_Δ[1/I_Δ]^∧_p`. -/
  laurentFrob : Olaurent ⟶ Olaurent

attribute [instance] SiteData.category

noncomputable instance SiteData.algebraInv (X : SiteData.{u} p) (c : X.C) :
    Algebra (X.O.obj c) (X.Oinv.obj c) := (X.toInv.app c).hom.toAlgebra

noncomputable instance SiteData.algebraLaurent (X : SiteData.{u} p) (c : X.C) :
    Algebra (X.O.obj c) (X.Olaurent.obj c) := ((X.toInv ≫ X.toLaurent).app c).hom.toAlgebra

/-- Restriction of the site data along a functor, as for `Y_Δ → X_Δ` induced by `Y → X`. -/
noncomputable def SiteData.restrict (X : SiteData.{u} p) {D : Type (u + 1)} [Category.{u} D]
    (G : D ⥤ X.C) : SiteData.{u} p where
  C := D
  O := G ⋙ X.O
  prism d := X.prism (G.obj d)
  bounded d := X.bounded (G.obj d)
  isDeltaHom f := X.isDeltaHom (G.map f)
  map_ideal f := X.map_ideal (G.map f)
  Oinv := G ⋙ X.Oinv
  toInv := Functor.whiskerLeft G X.toInv
  isAway d := X.isAway (G.obj d)
  Olaurent := G ⋙ X.Olaurent
  toLaurent := Functor.whiskerLeft G X.toLaurent
  laurentFrob := Functor.whiskerLeft G X.laurentFrob

/-- The map `A[1/I] ⊗_A M(A) → B[1/J] ⊗_B M(B)` induced by an arrow, `a ⊗ x ↦ f(a) ⊗ res_f(x)`. -/
noncomputable def SiteData.tensorRes (X : SiteData.{u} p) (E : Crystal X.C X.O) {c d : X.C}
    (f : c ⟶ d) : X.Oinv.obj c ⊗[X.O.obj c] E.M c →+ X.Oinv.obj d ⊗[X.O.obj d] E.M d := sorry

theorem SiteData.tensorRes_tmul (X : SiteData.{u} p) (E : Crystal X.C X.O) {c d : X.C}
    (f : c ⟶ d) (a : X.Oinv.obj c) (x : E.M c) :
    X.tensorRes E f (a ⊗ₜ[X.O.obj c] x) = (X.Oinv.map f).hom a ⊗ₜ[X.O.obj d] E.res f x := sorry

/-- A prismatic F-crystal: a crystal `E` over `O_Δ` with `φ_E : (φ^* E)[1/I_Δ] ≅ E[1/I_Δ]`,
given on each prism as in `OverPrism` and compatible with the transition maps. -/
structure PrismaticFCrystal (X : SiteData.{u} p) where
  /-- The underlying crystal. -/
  E : Crystal X.C X.O
  /-- The Frobenius on each value. -/
  frob : ∀ c, E.M c →+ X.Oinv.obj c ⊗[X.O.obj c] E.M c
  /-- Its linearisation is an isomorphism after inverting `I`. -/
  isBaseChange : ∀ c,
    IsBaseChangeAlong ((algebraMap (X.O.obj c) (X.Oinv.obj c)).comp (X.prism c).φ) (frob c)
  /-- The Frobenius commutes with the transition maps. -/
  frob_res : ∀ {c d : X.C} (f : c ⟶ d) (x : E.M c),
    frob d (E.res f x) = X.tensorRes E f (frob c x)

variable {X : SiteData.{u} p}

/-- A morphism of prismatic F-crystals. -/
structure PrismaticFCrystal.Hom (E F : PrismaticFCrystal X) where
  /-- The underlying morphism of crystals. -/
  toHom : Crystal.Hom E.E F.E
  /-- It commutes with Frobenius. -/
  comm : ∀ c (x : E.E.M c),
    F.frob c (toHom.app c x) = LinearMap.lTensor (X.Oinv.obj c) (toHom.app c) (E.frob c x)

/-- Evaluation at an object `(A, I)` of the site: an F-crystal over that prism. -/
noncomputable def PrismaticFCrystal.eval (E : PrismaticFCrystal X) (c : X.C) :
    OverPrism (X.prism c) (X.Oinv.obj c) where
  M := E.E.M c
  finite := E.E.finite c
  projective := E.E.projective c
  frob := E.frob c
  isBaseChange := E.isBaseChange c

/-- Evaluation of a morphism. -/
noncomputable def PrismaticFCrystal.Hom.eval {E F : PrismaticFCrystal X}
    (f : PrismaticFCrystal.Hom E F) (c : X.C) : OverPrism.Hom (E.eval c) (F.eval c) where
  toLinearMap := f.toHom.app c
  comm := f.comm c

/-- A prismatic F-crystal is effective when every evaluation is. -/
def PrismaticFCrystal.IsEffective (E : PrismaticFCrystal X) : Prop :=
  ∀ c, (E.eval c).IsEffective

/-- The unit F-crystal `(O_Δ, φ)`. -/
noncomputable def PrismaticFCrystal.unit (X : SiteData.{u} p) : PrismaticFCrystal X where
  E := Crystal.unit X.C X.O
  frob _ := sorry
  isBaseChange _ := sorry
  frob_res _ _ := sorry

/-- Tensor product of prismatic F-crystals. -/
noncomputable def PrismaticFCrystal.tensor (E F : PrismaticFCrystal X) : PrismaticFCrystal X :=
  sorry

/-- Pullback of a prismatic F-crystal along a functor of sites. -/
noncomputable def PrismaticFCrystal.pullback {D : Type (u + 1)} [Category.{u} D] (G : D ⥤ X.C)
    (E : PrismaticFCrystal X) : PrismaticFCrystal (X.restrict G) := sorry

/-- The Breuil–Kisin twist `O_Δ{n}` as a prismatic F-crystal, with `φ^* O_Δ{1} ≅ I_Δ⁻¹ ⊗ O_Δ{1}`;
its underlying invertible modules are those of `PrismaticCohomology:PR.3/breuil-kisin-twist`. -/
noncomputable def breuilKisinTwist (X : SiteData.{u} p) (n : ℤ) : PrismaticFCrystal X := sorry

-- pr7_fcrystal_eval_effective
example (E : PrismaticFCrystal X) : E.IsEffective ↔ ∀ c, (E.eval c).IsEffective := sorry

-- pr7_fcrystal_twist_invertible
example (n : ℤ) (c : X.C) : Module.Invertible (X.O.obj c) ((breuilKisinTwist X n).E.M c) := sorry

-- pr7_fcrystal_twist_not_effective
example (c : X.C) (h : (X.prism c).I ≠ ⊤) : ¬ (breuilKisinTwist X 1).IsEffective := sorry

-- pr7_fcrystal_unit_effective
example : (PrismaticFCrystal.unit X).IsEffective := sorry

/-! ### Laurent F-crystals (node `PR.7/laurent-f-crystal`) -/

/-- The `p`-adic completion of `L`; for `L = A[1/I]` this is `A[1/I]^∧_p`. -/
abbrev LaurentRing (p : ℕ) (L : Type u) [CommRing L] : Type u :=
  AdicCompletion (Ideal.span {(p : L)}) L

/-- The Frobenius of `A[1/I]^∧_p` induced by `φ`; it exists because `φ(I) ≡ I^p` modulo `p`.
`L` is meant to satisfy `IsAwayIdeal P.I L`. -/
noncomputable def laurentFrobenius {A : Type u} [CommRing A] (P : Prism p A) (L : Type u)
    [CommRing L] [Algebra A L] : LaurentRing p L →+* LaurentRing p L := sorry

/-- A Laurent F-crystal: a crystal over `O_Δ[1/I_Δ]^∧_p` with `φ^* E ≅ E`. -/
structure LaurentFCrystal (X : SiteData.{u} p) where
  /-- The underlying crystal. -/
  E : Crystal X.C X.Olaurent
  /-- The Frobenius on each value. -/
  frob : ∀ c, E.M c →+ E.M c
  /-- Its linearisation `φ^* E ⟶ E` is an isomorphism. -/
  isBaseChange : ∀ c, IsBaseChangeAlong (X.laurentFrob.app c).hom (frob c)
  /-- The Frobenius commutes with the transition maps. -/
  frob_res : ∀ {c d : X.C} (f : c ⟶ d) (x : E.M c), E.res f (frob c x) = frob d (E.res f x)

/-- A morphism of Laurent F-crystals. -/
structure LaurentFCrystal.Hom (E F : LaurentFCrystal X) where
  /-- The underlying morphism of crystals. -/
  toHom : Crystal.Hom E.E F.E
  /-- It commutes with Frobenius. -/
  comm : ∀ c (x : E.E.M c), F.frob c (toHom.app c x) = toHom.app c (E.frob c x)

/-- The Frobenius-fixed elements of a value. -/
def LaurentFCrystal.fixedPoints (E : LaurentFCrystal X) (c : X.C) : AddSubgroup (E.E.M c) :=
  AddMonoidHom.ker (E.frob c - AddMonoidHom.id (E.E.M c))

-- pr7_laurent_char_p_zero
example {A : Type u} [CommRing A] (P : Prism p A) (L : Type u) [CommRing L] [Algebra A L]
    (hL : IsAwayIdeal P.I L) (h : (p : A) ∈ P.I) : Subsingleton (LaurentRing p L) := sorry

-- pr7_laurent_frobenius_extends
example {A : Type u} [CommRing A] (P : Prism p A) (L : Type u) [CommRing L] [Algebra A L]
    (hL : IsAwayIdeal P.I L) (a : A) :
    laurentFrobenius P L (algebraMap L (LaurentRing p L) (algebraMap A L a)) =
      algebraMap L (LaurentRing p L) (algebraMap A L (P.φ a)) := sorry

-- pr7_laurent_fixed_points_res
example (E : LaurentFCrystal X) {c d : X.C} (f : c ⟶ d) (x : E.E.M c)
    (hx : x ∈ E.fixedPoints c) : E.E.res f x ∈ E.fixedPoints d := sorry

-- pr7_laurent_p_frobenius_non_example
example {A : Type u} [CommRing A] (P : Prism p A) (L : Type u) [CommRing L] [Algebra A L]
    (h : ¬ IsUnit (p : LaurentRing p L)) :
    ¬ IsBaseChangeAlong (laurentFrobenius P L)
      ((AddMonoidHom.mulLeft (p : LaurentRing p L)).comp (laurentFrobenius P L).toAddMonoidHom) :=
  sorry

/-! ### The étale realisation (node `PR.7/etale-realization`) -/

/-- The étale realisation `T(E) = E ⊗ O_Δ[1/I_Δ]^∧_p`, as a Laurent F-crystal. For bounded `X`
Laurent F-crystals are `Z_p`-local systems on the generic fibre
(node `PR.7/laurent-f-crystals-local-systems`, using `DiamondEtaleCohomology:C2`). -/
noncomputable def etaleRealization (X : SiteData.{u} p) (E : PrismaticFCrystal X) :
    LaurentFCrystal X := sorry

/-- The étale realisation on morphisms. -/
noncomputable def etaleRealizationMap (X : SiteData.{u} p) {E F : PrismaticFCrystal X}
    (f : PrismaticFCrystal.Hom E F) :
    LaurentFCrystal.Hom (etaleRealization X E) (etaleRealization X F) := sorry

theorem etaleRealization_eval (X : SiteData.{u} p) (E : PrismaticFCrystal X) (c : X.C) :
    Nonempty ((etaleRealization X E).E.M c ≃ₗ[X.Olaurent.obj c]
      X.Olaurent.obj c ⊗[X.O.obj c] E.E.M c) := sorry

-- pr7_etale_real_unit
example (c : X.C) : Nonempty ((etaleRealization X (PrismaticFCrystal.unit X)).E.M c
    ≃ₗ[X.Olaurent.obj c] X.Olaurent.obj c) := sorry

-- pr7_etale_real_char_p_zero
example (E : PrismaticFCrystal X) (c : X.C) (h : (p : X.O.obj c) ∈ (X.prism c).I) :
    Subsingleton ((etaleRealization X E).E.M c) := sorry

-- pr7_etale_real_map_injective_transversal
example (h : ∀ c, Function.Injective (algebraMap (X.O.obj c) (X.Olaurent.obj c)))
    (E F : PrismaticFCrystal X) :
    Function.Injective (fun f : PrismaticFCrystal.Hom E F => etaleRealizationMap X f) := sorry

-- pr7_etale_real_not_full
example : ¬ ∀ (Y : SiteData.{0} p) (E F : PrismaticFCrystal Y),
    Function.Surjective (fun f : PrismaticFCrystal.Hom E F => etaleRealizationMap Y f) := sorry

/-! ### The crystalline and de Rham realisations (node `PR.7/crystalline-realization`) -/

/-- If `p ∈ I` for a prism `(A, I)` with `p` and `I` in the Jacobson radical (which derived
`(p, I)`-completeness gives), then `I = (p)`: the prism is crystalline. -/
theorem ideal_eq_span_p_of_mem {A : Type u} [CommRing A] (P : Prism p A)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) (hI : P.I ≤ Ideal.jacobson (⊥ : Ideal A))
    (h : (p : A) ∈ P.I) : P.I = Ideal.span {(p : A)} := sorry

/-- The crystalline realisation: pullback to the site of the special fibre `X_{p=0}`, given by a
functor `G` from its prisms to those of `X`. Its identification with F-crystals on the
crystalline site is owned by `CrystallineCohomology:CR.1`. -/
noncomputable def crystallineRealization (X : SiteData.{u} p) {D : Type (u + 1)} [Category.{u} D]
    (G : D ⥤ X.C) (E : PrismaticFCrystal X) : PrismaticFCrystal (X.restrict G) := E.pullback G

/-- The de Rham realisation: the crystalline realisation with its Frobenius forgotten. -/
noncomputable def deRhamRealization (X : SiteData.{u} p) {D : Type (u + 1)} [Category.{u} D]
    (G : D ⥤ X.C) (E : PrismaticFCrystal X) : Crystal D (G ⋙ X.O) := E.E.pullback G

-- pr7_crys_real_site_crystalline
example (hp : ∀ c, (p : X.O.obj c) ∈ Ideal.jacobson (⊥ : Ideal (X.O.obj c)))
    (hI : ∀ c, (X.prism c).I ≤ Ideal.jacobson (⊥ : Ideal (X.O.obj c)))
    (h : ∀ c, (p : X.O.obj c) ∈ (X.prism c).I) (c : X.C) : (X.prism c).IsCrystalline := sorry

-- pr7_crys_real_eval
example {D : Type (u + 1)} [Category.{u} D] (G : D ⥤ X.C) (E : PrismaticFCrystal X) (d : D) :
    (deRhamRealization X G E).M d = E.E.M (G.obj d) := sorry

-- pr7_crys_real_twist_value
example (c : X.C) (h : (X.prism c).IsCrystalline) :
    ∃ e : X.O.obj c ≃ₗ[X.O.obj c] (breuilKisinTwist X 1).E.M c, ∀ a : X.O.obj c,
      (p : X.Oinv.obj c) • (breuilKisinTwist X 1).frob c (e a) =
        algebraMap (X.O.obj c) (X.Oinv.obj c) ((X.prism c).φ a) ⊗ₜ[X.O.obj c] e 1 := sorry

-- pr7_crys_real_not_effective
example (c : X.C) (h : (X.prism c).IsCrystalline) (hp : ¬ IsUnit (p : X.O.obj c)) :
    ¬ ((breuilKisinTwist X 1).eval c).IsEffective := sorry

/-! ### The case of `O_K` (nodes `PR.7/breuil-kisin-and-ainf-covers` to
`PR.7/crystalline-lattices-theorem`) -/

/-- The data attached to a complete discretely valued field `K` of mixed characteristic with
perfect residue field.
* `X`: the site `Spf(O_K)_Δ` (owner `PrismaticCohomology:PR.5/absolute-prismatic-site`).
* `G`: the Galois group `G_K` (Mathlib `Field.absoluteGaloisGroup`); its topology and the
  continuity of representations are not recorded.
* `RepCrys`, `toRep`: `Z_p`-lattices in crystalline representations with their underlying
  representations (owner `PadicHodgeTheory:R06.2/admissible-representations`).
* `bk`, `ainf`, `bkToAinf`: a Breuil–Kisin prism, the `A_inf`-prism and the map `u ↦ [π^♭]`
  (owners `PrismaticCohomology:PR.0/breuil-kisin-prism`, `PR.0/ainf-prism`).
* `MF`, `rankMF`, `dcris`: weakly admissible filtered φ-modules over `K`, their dimension and
  Fontaine's `D_crys` (owners `PadicHodgeTheory:R06.2/weak-admissibility`, `R06.2/period-functors`).
* `Q`, `rational`, `rationalRestrict`: the category of quasiregular semiperfectoid `O_K`-algebras
  (owner `DerivedDeRhamCohomology:DD.5`) with the diagrams `R ↦ Δ_R⟨φ^n(I)/p⟩[1/p]` and the maps
  between them (this stage, node `PR.7/period-sheaves-qrsp`). -/
structure OKData (p : ℕ) [Fact p.Prime] where
  /-- `Spf(O_K)_Δ`. -/
  X : SiteData.{u} p
  /-- `G_K`. -/
  G : Type u
  [group : Group G]
  /-- Crystalline lattices. -/
  RepCrys : Type (u + 1)
  /-- The underlying representation of a crystalline lattice. -/
  toRep : RepCrys → Rep.{u} (PadicInt p) G
  /-- A Breuil–Kisin prism. -/
  bk : X.C
  /-- The `A_inf`-prism. -/
  ainf : X.C
  /-- The map `𝔖 → A_inf`. -/
  bkToAinf : bk ⟶ ainf
  /-- Weakly admissible filtered φ-modules. -/
  MF : Type (u + 1)
  /-- Their dimension over `K_0`. -/
  rankMF : MF → ℕ
  /-- Fontaine's `D_crys`. -/
  dcris : RepCrys → MF
  /-- Quasiregular semiperfectoid `O_K`-algebras. -/
  Q : Type (u + 1)
  [categoryQ : Category.{u} Q]
  /-- `R ↦ Δ_R⟨φ^n(I)/p⟩[1/p]`. -/
  rational : ℕ → (Q ⥤ CommRingCat.{u})
  /-- `Δ_R⟨φ^{n+1}(I)/p⟩[1/p] → Δ_R⟨φ^n(I)/p⟩[1/p]`. -/
  rationalRestrict : ∀ n, rational (n + 1) ⟶ rational n

attribute [instance] OKData.group OKData.categoryQ

/-- For `X = Spf(O_K)`: the `G_K`-representation on the Frobenius-fixed points of the value of a
Laurent F-crystal on `A_inf` (node `PR.7/laurent-f-crystals-local-systems` (5)). -/
noncomputable def OKData.galoisRep (D : OKData.{u} p) (E : LaurentFCrystal D.X) :
    Rep.{u} (PadicInt p) D.G := sorry

/-- The action of `OKData.galoisRep` on morphisms. -/
noncomputable def OKData.galoisRepMap (D : OKData.{u} p) {E F : LaurentFCrystal D.X}
    (f : LaurentFCrystal.Hom E F) : D.galoisRep E ⟶ D.galoisRep F := sorry

/-- The Breuil–Kisin prism covers the final object. The `(p, I)`-complete faithful flatness of
`c ⟶ d` (DD.1) is not stated. -/
theorem OKData.bk_covers (D : OKData.{u} p) (c : D.X.C) :
    ∃ d : D.X.C, Nonempty (c ⟶ d) ∧ Nonempty (D.bk ⟶ d) := sorry

/-- The `A_inf`-prism covers the final object (same omission as in `bk_covers`). -/
theorem OKData.ainf_covers (D : OKData.{u} p) (c : D.X.C) :
    ∃ d : D.X.C, Nonempty (c ⟶ d) ∧ Nonempty (D.ainf ⟶ d) := sorry

/-- Evaluation at the Breuil–Kisin prism: a Breuil–Kisin module. -/
noncomputable def OKData.evalBK (D : OKData.{u} p) (E : PrismaticFCrystal D.X) :
    OverPrism (D.X.prism D.bk) (D.X.Oinv.obj D.bk) := E.eval D.bk

/-- Evaluation at the `A_inf`-prism: a Breuil–Kisin–Fargues module (`AInfCohomology:AI.2`). -/
noncomputable def OKData.evalAinf (D : OKData.{u} p) (E : PrismaticFCrystal D.X) :
    OverPrism (D.X.prism D.ainf) (D.X.Oinv.obj D.ainf) := E.eval D.ainf

-- pr7_ok_bk_to_ainf_base_change
example (D : OKData.{u} p) (E : Crystal D.X.C D.X.O) :
    IsBaseChangeAlong (D.X.O.map D.bkToAinf).hom (E.res D.bkToAinf) := sorry

-- pr7_ok_ainf_perfect
example (D : OKData.{u} p) :
    (D.X.prism D.ainf).IsPerfect ∧ (D.X.prism D.ainf).IsOrientable := sorry

-- pr7_ok_bk_not_perfect
example (D : OKData.{u} p) : ¬ (D.X.prism D.bk).IsPerfect := sorry

-- pr7_ok_bk_orientable
example (D : OKData.{u} p) : (D.X.prism D.bk).IsOrientable := sorry

/-! ### Period rings (node `PR.7/period-sheaves-qrsp`) -/

namespace Period

/-- `A[x]/(p x − d)`. -/
abbrev PreRational (p : ℕ) (A : Type u) [CommRing A] (d : A) : Type u :=
  Polynomial A ⧸ Ideal.span
    {(Polynomial.C (p : A) * Polynomial.X - Polynomial.C d : Polynomial A)}

/-- The rational localisation `A⟨d/p⟩`: the `p`-adic completion of `A[x]/(p x − d)`. For a prism
with `I = (d)` this is `A⟨I/p⟩`. -/
abbrev Rational (p : ℕ) (A : Type u) [CommRing A] (d : A) : Type u :=
  AdicCompletion (Ideal.span {(p : PreRational p A d)}) (PreRational p A d)

/-- The structure map `A → A⟨d/p⟩`. -/
noncomputable def toRational (p : ℕ) (A : Type u) [CommRing A] (d : A) : A →+* Rational p A d :=
  (algebraMap (PreRational p A d) (Rational p A d)).comp
    ((Ideal.Quotient.mk _).comp Polynomial.C)

/-- The endomorphism `φ` of `A⟨d/p⟩` induced by `φ̃ : A{I/p} → A{φ(I)/p}`; it is not a Frobenius
lift. The δ-envelopes are owned by `PrismaticCohomology:PR.0/pd-envelope-as-delta-envelope`. -/
noncomputable def rationalFrobenius {A : Type u} [CommRing A] (P : Prism p A) (d : A)
    (_hd : P.I = Ideal.span {d}) : Rational p A d →+* Rational p A d := sorry

/-- `A[1/p]^∧_d`; on the quasi-syntomic site this is `B_dR^+`. -/
abbrev BdRPlus (p : ℕ) (A : Type u) [CommRing A] (d : A) : Type u :=
  AdicCompletion (Ideal.span {algebraMap A (Localization.Away (p : A)) d})
    (Localization.Away (p : A))

/-- Bhatt–Scholze, F-crystals, Lemma 6.7: for a transversal oriented prism and `n ≥ 0`,
`A[1/p]^∧_d ≅ A⟨φ^n(d)/p⟩[1/p]^∧_d`. -/
theorem bdRPlus_equiv_rational {A : Type u} [CommRing A] (P : Prism p A) (d : A)
    (hd : P.I = Ideal.span {d}) (hreg : RingTheory.Sequence.IsRegular A [(p : A), d]) (n : ℕ) :
    Nonempty (BdRPlus p A d ≃+*
      AdicCompletion
        (Ideal.span {algebraMap (Rational p A ((P.φ : A → A)^[n] d))
          (Localization.Away (p : Rational p A ((P.φ : A → A)^[n] d)))
          (toRational p A ((P.φ : A → A)^[n] d) d)})
        (Localization.Away (p : Rational p A ((P.φ : A → A)^[n] d)))) := sorry

end Period

-- pr7_period_rational_p_dvd
example {A : Type u} [CommRing A] (d : A) :
    ∃ y : Period.Rational p A d, (p : Period.Rational p A d) * y = Period.toRational p A d d :=
  sorry

-- pr7_period_bdr_plus_p_unit
example {A : Type u} [CommRing A] (d : A) : IsUnit (p : Period.BdRPlus p A d) := sorry

-- pr7_period_rational_frobenius_extends
example {A : Type u} [CommRing A] (P : Prism p A) (d : A) (hd : P.I = Ideal.span {d}) (a : A) :
    Period.rationalFrobenius P d hd (Period.toRational p A d a) =
      Period.toRational p A d (P.φ a) := sorry

-- pr7_period_frobenius_not_lift
example : ¬ ∀ (A : Type) [CommRing A] (P : Prism p A) (d : A) (hd : P.I = Ideal.span {d})
    (x : Period.Rational p A d),
    Period.rationalFrobenius P d hd x - x ^ p ∈ Ideal.span {(p : Period.Rational p A d)} := sorry

/-! ### From filtered φ-modules to crystals (node `PR.7/filtered-phi-module-to-crystal`) -/

/-- The crystal over `Δ_•⟨φ^n(I)/p⟩[1/p]` underlying `M(D)`. Its Frobenius structure
`(φ^* M)[1/I] ≅ M[1/I]`, which relates the levels `n` and `n + 1`, is part of the node and is not
recorded here. -/
noncomputable def OKData.filteredCrystal (D : OKData.{u} p) (n : ℕ) (M : D.MF) :
    Crystal D.Q (D.rational n) := sorry

theorem OKData.filteredCrystal_rank (D : OKData.{u} p) (n : ℕ) (M : D.MF) (c : D.Q)
    (𝔭 : PrimeSpectrum ((D.rational n).obj c)) :
    Module.rankAtStalk ((D.filteredCrystal n M).M c) 𝔭 = D.rankMF M := sorry

theorem OKData.filteredCrystal_restrict (D : OKData.{u} p) (n : ℕ) (M : D.MF) :
    Nonempty (Crystal.Iso (Crystal.baseChange (D.rationalRestrict n)
      (D.filteredCrystal (n + 1) M)) (D.filteredCrystal n M)) := sorry

-- pr7_filtered_crystal_rank_zero
example (D : OKData.{u} p) (n : ℕ) (M : D.MF) (h : D.rankMF M = 0) (c : D.Q) :
    Subsingleton ((D.filteredCrystal n M).M c) := sorry

-- pr7_filtered_crystal_finite_projective
example (D : OKData.{u} p) (n : ℕ) (M : D.MF) (c : D.Q) :
    Module.Finite ((D.rational n).obj c) ((D.filteredCrystal n M).M c) ∧
      Module.Projective ((D.rational n).obj c) ((D.filteredCrystal n M).M c) := sorry

-- pr7_filtered_crystal_twist
example (D : OKData.{u} p) (n : ℕ) (M : D.MF) (h : D.rankMF M = 1) (c : D.Q) :
    Module.Invertible ((D.rational n).obj c) ((D.filteredCrystal n M).M c) := sorry

-- pr7_filtered_crystal_not_integral
example (D : OKData.{u} p) (n : ℕ) (c : D.Q) : IsUnit (p : (D.rational n).obj c) := sorry

/-! ### The inverse functor and the main theorem (nodes `PR.7/crystalline-lattice-to-f-crystal`,
`PR.7/crystalline-lattices-theorem`) -/

/-- The prismatic F-crystal `𝔐(L)` of a crystalline lattice `L`. -/
noncomputable def OKData.latticeFCrystal (D : OKData.{u} p) (L : D.RepCrys) :
    PrismaticFCrystal D.X := sorry

theorem OKData.latticeFCrystal_realization (D : OKData.{u} p) (L : D.RepCrys) :
    Nonempty (D.galoisRep (etaleRealization D.X (D.latticeFCrystal L)) ≅ D.toRep L) := sorry

theorem OKData.latticeFCrystal_unique (D : OKData.{u} p) (L : D.RepCrys)
    (E : PrismaticFCrystal D.X)
    (h : Nonempty (D.galoisRep (etaleRealization D.X E) ≅ D.toRep L)) :
    ∃ (f : PrismaticFCrystal.Hom E (D.latticeFCrystal L))
      (g : PrismaticFCrystal.Hom (D.latticeFCrystal L) E),
      ∀ c x, g.toHom.app c (f.toHom.app c x) = x := sorry

-- pr7_lattice_rank
example (D : OKData.{u} p) (L : D.RepCrys) :
    Module.finrank (D.X.O.obj D.bk) ((D.latticeFCrystal L).E.M D.bk) =
      Module.finrank (PadicInt p) (D.toRep L).V := sorry

-- pr7_lattice_twist
example (D : OKData.{u} p) (L : D.RepCrys) (n : ℤ)
    (h : Nonempty (D.toRep L ≅ D.galoisRep (etaleRealization D.X (breuilKisinTwist D.X n)))) :
    ∃ (f : PrismaticFCrystal.Hom (D.latticeFCrystal L) (breuilKisinTwist D.X n))
      (g : PrismaticFCrystal.Hom (breuilKisinTwist D.X n) (D.latticeFCrystal L)),
      ∀ c x, g.toHom.app c (f.toHom.app c x) = x := sorry

-- pr7_lattice_hom
example (D : OKData.{u} p) (L L' : D.RepCrys) :
    Nonempty (PrismaticFCrystal.Hom (D.latticeFCrystal L) (D.latticeFCrystal L') ≃
      (D.toRep L ⟶ D.toRep L')) := sorry

-- pr7_lattice_not_all_representations
example (D : OKData.{u} p) : ¬ ∀ V : Rep.{u} (PadicInt p) D.G,
    ∃ E : PrismaticFCrystal D.X, Nonempty (V ≅ D.galoisRep (etaleRealization D.X E)) := sorry

/-- Bhatt–Scholze, F-crystals, Proposition 5.3: the étale realisation of a prismatic F-crystal on
`Spf(O_K)` is a lattice in a crystalline representation. -/
theorem OKData.realization_isCrystalline (D : OKData.{u} p) (E : PrismaticFCrystal D.X) :
    ∃ L : D.RepCrys, Nonempty (D.toRep L ≅ D.galoisRep (etaleRealization D.X E)) := sorry

/-- Bhatt–Scholze, F-crystals, Theorem 5.6, full faithfulness (node
`PR.7/etale-realization-fully-faithful`). -/
theorem OKData.etaleRealization_bijective (D : OKData.{u} p) (E F : PrismaticFCrystal D.X) :
    Function.Bijective
      (fun f : PrismaticFCrystal.Hom E F => D.galoisRepMap (etaleRealizationMap D.X f)) := sorry

/-- Bhatt–Scholze, F-crystals, Theorem 5.6, essential surjectivity: with
`realization_isCrystalline` and `etaleRealization_bijective`, the étale realisation is an
equivalence onto crystalline lattices (node `PR.7/crystalline-lattices-theorem`). -/
theorem OKData.etaleRealization_essSurj (D : OKData.{u} p) (L : D.RepCrys) :
    ∃ E : PrismaticFCrystal D.X,
      Nonempty (D.galoisRep (etaleRealization D.X E) ≅ D.toRep L) := sorry

/-- Bhatt–Scholze, F-crystals, Theorem 7.9 (Kisin): evaluation of `𝔐(L)` at the Breuil–Kisin prism
is fully faithful (node `PR.7/breuil-kisin-evaluation`). -/
theorem OKData.breuilKisinEvaluation_bijective (D : OKData.{u} p) (L L' : D.RepCrys) :
    Function.Bijective
      (fun f : PrismaticFCrystal.Hom (D.latticeFCrystal L) (D.latticeFCrystal L') =>
        f.eval D.bk) := sorry

/-- Bhatt–Scholze, F-crystals, Remark 7.12 (Liu): the base change to `A_inf` of the Breuil–Kisin
module of `𝔐(L)` is its value on `A_inf`, for every Breuil–Kisin prism mapping to `A_inf`. -/
theorem OKData.breuilKisin_baseChange_ainf (D : OKData.{u} p) (L : D.RepCrys) :
    IsBaseChangeAlong (D.X.O.map D.bkToAinf).hom ((D.latticeFCrystal L).E.res D.bkToAinf) :=
  (D.latticeFCrystal L).E.isBaseChange D.bkToAinf

end TauCeti.Prismatic.FCrystal
