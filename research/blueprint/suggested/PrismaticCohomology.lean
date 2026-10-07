import Mathlib.Algebra.Category.CommAlgCat.Basic
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Category.ModuleCat.Biproducts
import Mathlib.Algebra.Category.ModuleCat.ChangeOfRings
import Mathlib.Algebra.Category.MonCat.Basic
import Mathlib.Algebra.Category.Ring.Basic
import Mathlib.Algebra.DualNumber
import Mathlib.Algebra.Homology.Additive
import Mathlib.Algebra.Homology.DerivedCategory.Basic
import Mathlib.Algebra.Homology.DerivedCategory.ExactFunctor
import Mathlib.Algebra.Homology.DerivedCategory.HomologySequence
import Mathlib.Algebra.Homology.DerivedCategory.TStructure
import Mathlib.Algebra.Homology.Embedding.Extend
import Mathlib.Algebra.Homology.HomotopyCategory.MappingCone
import Mathlib.Algebra.Homology.ShortComplex.HomologicalComplex
import Mathlib.Algebra.Homology.Single
import Mathlib.Algebra.Module.Projective
import Mathlib.Algebra.MonoidAlgebra.Defs
import Mathlib.Algebra.MonoidAlgebra.MapDomain
import Mathlib.Algebra.MvPolynomial.CommRing
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Algebra.Polynomial.AlgebraMap
import Mathlib.Algebra.Polynomial.Basic
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.AlgebraicTopology.AlternatingFaceMapComplex
import Mathlib.AlgebraicTopology.SimplicialObject.Basic
import Mathlib.CategoryTheory.Adjunction.Basic
import Mathlib.CategoryTheory.Comma.Over.Basic
import Mathlib.CategoryTheory.Endomorphism
import Mathlib.CategoryTheory.Groupoid
import Mathlib.CategoryTheory.Idempotents.Basic
import Mathlib.CategoryTheory.Limits.Shapes.IsTerminal
import Mathlib.CategoryTheory.Limits.Shapes.ZeroObjects
import Mathlib.CategoryTheory.Monoidal.Category
import Mathlib.CategoryTheory.Sites.Continuous
import Mathlib.CategoryTheory.Sites.CoverLifting
import Mathlib.CategoryTheory.Sites.CoversTop.Basic
import Mathlib.CategoryTheory.Sites.Grothendieck
import Mathlib.CategoryTheory.Sites.Sheaf
import Mathlib.CategoryTheory.Sites.Sieves.Basic
import Mathlib.CategoryTheory.Triangulated.Pretriangulated
import Mathlib.CategoryTheory.Whiskering
import Mathlib.Data.Nat.Choose.Dvd
import Mathlib.Data.Nat.Choose.Sum
import Mathlib.Data.Nat.Prime.Int
import Mathlib.Data.ZMod.Basic
import Mathlib.FieldTheory.AbsoluteGaloisGroup
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.FieldTheory.Perfect
import Mathlib.GroupTheory.MonoidLocalization.GrothendieckGroup
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
import Mathlib.RingTheory.DiscreteValuationRing.Basic
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
# Suggested Lean for the roadmap `PrismaticCohomology` (layers PR.0–PR.8)

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/PrismaticCohomology.md` is definitive. The statements below
suggest Lean forms so that contributors and reviewers converge on names and signatures. They
claim no implementation: every proof is a placeholder.

Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. No `TauCeti.*` module is imported, because
none of the objects below exists there.

How the file is organised.
* The δ-ring prefix of PR.0 (namespace `TauCeti.Delta`) is stated on Mathlib's own carriers:
  rings, quotients, localizations, adic completions, truncated Witt vectors.
* A prism (`TauCeti.Prismatic.Prism`) records the data and the conditions Mathlib can state.
  Derived `(p, I)`-completeness belongs to `DerivedDeRhamCohomology:DD.1` and is left out of
  the structure. A statement that needs it carries classical `(p, I)`-adic completeness
  (`IsAdicComplete`) as an explicit hypothesis or field; for bounded prisms the two agree
  (node `PR.0/bounded-prism-complete-flatness` (1)).
* Layers PR.1–PR.7 follow in the namespaces `TauCeti.Prismatic.*`. Complexes are objects of
  Mathlib's `DerivedCategory (ModuleCat A)`, read as the 1-categorical shadow of the derived
  ∞-categories of the sources. The shared vocabulary of PR.0 has placeholders for what other
  roadmaps own: `completedBaseChange` (DD.1), `crystallineCohomology` (CR.2) and
  `deRhamComplex` (DD.2); `completedKaehler` is the `p`-completed module of differentials.
* Layer PR.8 (namespace `TauCeti.LogPrismatic`) builds δ_log-rings on PR.0's δ-structures
  (`TauCeti.Delta.Structure`, `toFrobenius`, `wittSectionEquiv`) and prelog prisms on PR.0's
  `Prism`. Its relative theory is over `IntegralBoundedPrelogPrism`.
* An object that no library has yet is a specific placeholder declaration whose docstring
  names the node or roadmap that owns it. No theorem quantifies over unconstrained data
  standing for such an object, no `Prop` stands for a condition that cannot be stated, and no
  axiom is used. A hypothesis of the sources that cannot be stated is left out only where the
  statement stays true; the docstring says so.
* The node index at the end lists every node of the two packets with the packet names typed
  for it. Packet names that are not typed are recorded, with their statements and the reason,
  in documentation comments of their node's section.

What the assembly changed against the two part files.
* PR.0–PR.7 (`PrismaticCohomology--PR.0.lean`): the 35 statements that the review
  REV-PrismaticCohomology--PR.0 listed as false, vacuous or missing a hypothesis are restated,
  and 11 more of the same kinds. Theorems that quantified over structures of unconstrained
  "imported data" or over arbitrary functors are stated for specific placeholder values
  (`imported`, `inputs`, `qrspData`, `cotangentPowers`, `AffineComparisonDatum.ofAlgebra`,
  `TateTwistDatum.ofPerfectoid`, `CrystallineInput.ofAlgebra`, `AOmegaData.ofAlgebra`,
  `OKData.ofRing`, …) or for the shared placeholders above. Completeness, boundedness,
  flatness, `0 < E.natDegree` (Breuil–Kisin), injectivity on coordinates (framed q-PD data)
  and the adapted generator of formula (9.3) are added where the statements need them. Every
  declaration name of the part file is kept.
* PR.8 (`PrismaticCohomology--PR.8.lean`): the local copy of PR.0's δ-structures is replaced by
  PR.0's declarations, and `zLocalDelta`, `qNumber` and `completedExtendScalars` are
  abbreviations of PR.0's `TauCeti.Delta.intAtPrime`, `TauCeti.Prismatic.qAnalog` and
  `TauCeti.Prismatic.completedBaseChange`. Of the packet's 332 API and test names, the part
  file typed 40; this file types 211, with 70 of the 76 nodes' main declarations. The weak
  examples the review REV-PrismaticCohomology--PR.8 named are strengthened to the packet's
  computations.
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

/-- Node: integer-cast-delta, second part. A nonzero ring of characteristic `p` has no
δ-structure: `δ(p · 1) = δ(0) = 0`, while `delta_intCast` gives `δ(p · 1) = 1 - p ^ (p - 1) = 1`. -/
theorem isEmpty_structure_of_charP {R : Type*} [CommRing R] [Nontrivial R] [CharP R p] :
    IsEmpty (Structure p R) := by sorry

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


/-! ## Shared prism vocabulary (PR.0), used by every other layer

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

/-- The completed derived base change `M ↦ (M ⊗^L_A B)^∧_J` along a ring map `f : A → B`, the
completion being derived `J`-adic for an ideal `J` of `B` (for `J = ⊥` there is no completion).
Owner: `DerivedDeRhamCohomology:DD.1` (derived tensor products and derived completion of
unbounded complexes, which Mathlib does not have). For a map of prisms and `J = (p, I)B` this is
`− ⊗̂^L_A B`; for `f = φ_A` it is the Frobenius pullback `φ_A^*`. -/
noncomputable def completedBaseChange {B : Type u} [CommRing B] (f : A →+* B) (J : Ideal B) :
    DerivedCategory (ModuleCat.{u} A) ⥤ DerivedCategory (ModuleCat.{u} B) := sorry

/-- Crystalline cohomology `RΓ_crys(R/A)` of an `A/J`-algebra `R` relative to the `p`-adic PD
thickening `Spec(A/J) ⊂ Spf(A)` with divided powers `γ` on `J` (`p`-adically: the derived limit of
the crystalline cohomology over `A/p^n`), as an object of `D(A)`.
Owner: `CrystallineCohomology:CR.2`. -/
noncomputable def crystallineCohomology {J : Ideal A} (γ : DividedPowers J) (R : Type u)
    [CommRing R] [Algebra (A ⧸ J) R] : DerivedCategory (ModuleCat.{u} A) := sorry

/-- The `p`-completed de Rham complex `Ω^*_{R/k}` of a `k`-algebra `R` (derived de Rham complex
when `R` is not smooth), as an object of `D(k)`. Owner: `DerivedDeRhamCohomology:DD.2`. -/
noncomputable def deRhamComplex (p : ℕ) (k : Type u) [CommRing k] (R : Type u) [CommRing R]
    [Algebra k R] : DerivedCategory (ModuleCat.{u} k) := sorry

/-- The `p`-completed module of differentials `Ω^1_{R/(A/I)} = lim_n Ω^1_{R/(A/I)} / p^n`, the
module the sources mean by `Ω^1` for `p`-complete `R` (Mathlib's `KaehlerDifferential` is not
completed). -/
abbrev completedKaehler (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] : Type u :=
  AdicCompletion (Ideal.span {(p : R)}) (KaehlerDifferential P.bar R)

/-- The universal derivation `d : R → Ω^1_{R/(A/I)}` into the completed module. -/
noncomputable def completedD (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R]
    (g : R) : completedKaehler P R :=
  AdicCompletion.of (Ideal.span {(p : R)}) (KaehlerDifferential P.bar R)
    (KaehlerDifferential.D P.bar R g)

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

/-- The Breuil–Kisin prism `(W(k)⟦u⟧, (E(u)))`, `φ(u) = u ^ p`, `E` a monic Eisenstein polynomial.
An Eisenstein polynomial has positive degree; `hdeg` records it, since Mathlib's `IsEisensteinAt`
is also satisfied by the constant polynomial `1`, whose ideal is not that of a prism. -/
noncomputable def breuilKisin (E : Polynomial (WittVector p k)) (hE : E.Monic)
    (hEis : E.IsEisensteinAt (Ideal.span {(p : WittVector p k)})) (hdeg : 0 < E.natDegree) :
    Prism p (PowerSeries (WittVector p k)) := sorry

variable (E : Polynomial (WittVector p k)) (hE : E.Monic)
  (hEis : E.IsEisensteinAt (Ideal.span {(p : WittVector p k)})) (hdeg : 0 < E.natDegree)

theorem breuilKisin_I :
    (breuilKisin p k E hE hEis hdeg).I = Ideal.span {(E : PowerSeries (WittVector p k))} := sorry

theorem breuilKisin_phi_X :
    (breuilKisin p k E hE hEis hdeg).φ PowerSeries.X = PowerSeries.X ^ p := sorry

theorem breuilKisin_isBounded :
    (breuilKisin p k E hE hEis hdeg).IsBounded ∧
      (breuilKisin p k E hE hEis hdeg).IsOrientable := sorry

-- breuil_kisin_not_perfect
example : ¬ (breuilKisin p k E hE hEis hdeg).IsPerfect := sorry

-- breuil_kisin_not_crystalline
example : ¬ (breuilKisin p k E hE hEis hdeg).IsCrystalline := sorry

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
derived `(p, I)`-completeness; statements that need it carry classical `(p, I)`-adic completeness
as a hypothesis. "`R` is `p`-completely smooth over `A / I`" is recorded as `SmoothModP`, as far as
Mathlib can state it, and `Ω^1` is the `p`-completed module `completedKaehler`. Derived completed
base change (`DerivedDeRhamCohomology:DD.1`), crystalline cohomology (`CrystallineCohomology:CR.2`)
and the de Rham complex (`DerivedDeRhamCohomology:DD.2`) are the placeholders
`completedBaseChange`, `crystallineCohomology` and `deRhamComplex` of the shared vocabulary, whose
docstrings name their owners; no statement quantifies over an arbitrary functor or object in their
place. Global statements on the étale site of a formal scheme (`SchemeAndStackFoundations:SF.2`)
are stated in their affine form. -/

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
when `C` is `(p, J)`-completely faithfully flat over `B`. Recorded here in the form Mathlib can
state: for every `n` the reduction `B / (p, J)^n → C / (p, J)^n C` is flat, and for `n = 1` it is
faithfully flat. For classically `(p, J)`-complete bounded prisms this is complete faithful
flatness: the flatness of every reduction is what remains of the vanishing of
`Tor_i^B(B / (p, J), C)` for `i > 0`. -/
def IsFlatCover {P : Prism p A} {Q : Prism p B} (f : P.Hom Q) : Prop :=
  (reductionMap f).FaithfullyFlat ∧
    ∀ n : ℕ, (Ideal.quotientMap ((reductionIdeal P ^ n).map f.toRingHom) f.toRingHom
      Ideal.le_comap_map).Flat

/-- `R'`, with `g : R → R'`, is the `p`-completed base change `R ⊗̂_{A/I} B/J` of the
`A/I`-algebra `R` along the map of prisms `f : (A, I) → (B, J)`: `R'` is `p`-adically complete, `g`
lies over `A/I → B/J`, and `R'` is initial among `p`-adically complete `B/J`-algebras with such a
map from `R`. -/
def IsCompletedBaseChange {P : Prism p A} {Q : Prism p B} (f : P.Hom Q) (R : Type u) [CommRing R]
    [Algebra P.bar R] (R' : Type u) [CommRing R'] [Algebra Q.bar R'] (g : R →+* R') : Prop :=
  IsAdicComplete (Ideal.span {(p : R')}) R' ∧
    g.comp (algebraMap P.bar R) = (algebraMap Q.bar R').comp (barMap f) ∧
    ∀ (T : Type u) [CommRing T] [Algebra Q.bar T], IsAdicComplete (Ideal.span {(p : T)}) T →
      ∀ h : R →+* T, h.comp (algebraMap P.bar R) = (algebraMap Q.bar T).comp (barMap f) →
        ∃! k : R' →ₐ[Q.bar] T, (k : R' →+* T).comp g = h

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
`R` is `p`-adically complete, `R / p^n` is flat over `k / p^n` for every `n`, and `R / p` is
smooth over `k / p`. The flatness of every reduction is the form, for a `p`-adically complete
`R`, of `p`-complete flatness (the vanishing of `Tor_i^k(R, k / p)` for `i > 0`,
`DerivedDeRhamCohomology:DD.1`); without it `R = 𝔽_p[x]` over `k = ℤ_p` would qualify. -/
structure SmoothModP (p : ℕ) (k R : Type u) [CommRing k] [CommRing R] [Algebra k R] : Prop where
  /-- `R` is `p`-adically complete. -/
  complete : IsAdicComplete (Ideal.span {(p : R)}) R
  /-- `R / p^n` is flat over `k / p^n` for every `n`. -/
  flat : ∀ n : ℕ, Module.Flat (k ⧸ Ideal.span {(p : k) ^ n}) ((k ⧸ Ideal.span {(p : k) ^ n}) ⊗[k] R)
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
    [Nontrivial (completedKaehler P R)] :
    ¬ Limits.IsZero ((DerivedCategory.homologyFunctor (ModuleCat.{u} R) 1).obj
      (hodgeTateCohomology P R)) := sorry

/-! #### Weakly initial objects and Čech–Alexander complexes (Constructions 4.17–4.18) -/

/-- Node `PR.1/cech-alexander-complex`: the weakly initial object attached to a family
`g : σ → R` generating `R` topologically: with `B₀` the completed polynomial `A`-algebra on `σ` and
`B = Free_δ(B₀)^∧`, it is the prismatic envelope of `(B, ker(B → R'))`. -/
noncomputable def weaklyInitial {σ : Type u} (g : σ → R) : RelativePrism P R := sorry

/-- Construction 4.17: the object is weakly initial in the algebraic language, so in the site
every object maps to it. The hypothesis `hg` says that the polynomial algebra on `g` surjects onto
`R / p`; for the `p`-adically complete `R` this is the hypothesis that the completed polynomial
algebra `(A / I)⟨x_s⟩` surjects onto `R` (so it covers the presentation `A⟨X⟩ → A / I⟨X⟩` of
Remark 4.19, for which the uncompleted polynomial algebra is not surjective). -/
theorem weaklyInitial_hom_nonempty (hb : P.IsBounded) (hR : SmoothModP p P.bar R) {σ : Type u}
    (g : σ → R)
    (hg : ∀ r : R, ∃ f : MvPolynomial σ P.bar, r - MvPolynomial.aeval g f ∈ Ideal.span {(p : R)})
    (X : RelativePrism P R) : Nonempty (X ⟶ weaklyInitial P R g) := sorry

/-- The envelope is `(p, I)`-completely flat over `A`; recorded: its reduction modulo `(p, I)`
is flat. -/
theorem weaklyInitial_flat (hb : P.IsBounded) (hR : SmoothModP p P.bar R) {σ : Type u}
    (g : σ → R)
    (hg : ∀ r : R, ∃ f : MvPolynomial σ P.bar, r - MvPolynomial.aeval g f ∈ Ideal.span {(p : R)}) :
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
complex computes `Δ_{R/A}`. `hg` is the completed surjectivity of `weaklyInitial_hom_nonempty`. -/
theorem cechAlexander_computes (hb : P.IsBounded) (hR : SmoothModP p P.bar R) {σ : Type u}
    (g : σ → R)
    (hg : ∀ r : R, ∃ f : MvPolynomial σ P.bar, r - MvPolynomial.aeval g f ∈ Ideal.span {(p : R)}) :
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
    (hg : ∀ r : R, ∃ f : MvPolynomial σ P.bar, r - MvPolynomial.aeval g f ∈ Ideal.span {(p : R)})
    [Nontrivial (completedKaehler P R)] :
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

/-- Node `PR.1/prismatic-base-change` (Corollary 4.12, affine form): for every map of bounded
prisms `f : (A, I) → (B, IB)`, with no flatness or Tor-amplitude hypothesis,
`Δ_{R/A} ⊗̂^L_A B ≃ Δ_{R'/B}` for `R'` the `p`-completed base change of `R`; the left side is the
`(p, I)`-completed derived base change `completedBaseChange` (owner
`DerivedDeRhamCohomology:DD.1`). Node `PR.1/base-change-finite-tor-amplitude` (Lemma 4.20) is
the special case in which `A → B` has finite `(p, I)`-complete Tor amplitude; it is the input
of the Hodge–Tate comparison from which this general form is deduced, and it has no separate
declaration. -/
theorem prismaticCohomology_baseChange {B : Type u} [CommRing B] {Q : Prism p B} (f : P.Hom Q)
    (hP : P.IsBounded) (hQ : Q.IsBounded) (hR : SmoothModP p P.bar R)
    (R' : Type u) [CommRing R'] [Algebra Q.bar R'] (g : R →+* R')
    (hg : IsCompletedBaseChange f R R' g) :
    Nonempty ((completedBaseChange f.toRingHom (reductionIdeal Q)).obj (prismaticCohomology P R) ≅
      prismaticCohomology Q R') := sorry

/-- Node `PR.1/p-torsion-free-h0-syntomic` (Anschütz–Le Bras, Lemma 5.1.6), stated here for
`R` smooth; the source allows `p`-completely syntomic `R`. -/
theorem zeroth_cohomology_pTorsionFree (hb : P.IsBounded) (hA : ∀ a : A, (p : A) * a = 0 → a = 0)
    (hR : SmoothModP p P.bar R)
    (x : (DerivedCategory.homologyFunctor (ModuleCat.{u} A) 0).obj (prismaticCohomology P R))
    (hx : (p : A) • x = 0) : x = 0 := sorry

/-- Node `PR.1/perfect-prism-initial` (Lemma 4.8): a ring map `A / I → B / J` out of the
reduction of a perfect prism lifts uniquely to a map of prisms. The derived completeness of both
prisms, which `Prism` does not record, is assumed in its classical `(p, I)`-adic form (for these
finitely generated ideals classical completeness implies derived completeness). -/
theorem perfectPrism_hom_existsUnique (hperf : P.IsPerfect) [IsAdicComplete (reductionIdeal P) A]
    {B : Type u} [CommRing B] (Q : Prism p B) [IsAdicComplete (reductionIdeal Q) B]
    (g : P.bar →+* Q.bar) : ∃! f : P.Hom Q, barMap f = g := sorry

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
example (hb : P.IsBounded) (hR : SmoothModP p P.bar R) [Nontrivial (completedKaehler P R)] :
    ¬ Limits.IsZero ((DerivedCategory.homologyFunctor (ModuleCat.{u} R) 1).obj
      (hodgeTateCohomology P R)) := sorry

/-- Node `PR.1/etale-localization` (Lemma 4.21): `Δ̄_{R/A} ⊗̂^L_R S ≃ Δ̄_{S/A}` for a
`p`-completely étale map `R → S`, the left side being the derived `p`-completed base change
`completedBaseChange` along `R → S` (owner `DerivedDeRhamCohomology:DD.1`). `S` is `p`-completely
étale over `R`: `p`-adically complete, and `S / p` is étale over `R / p`. -/
theorem etaleLocalization (hb : P.IsBounded) (hR : SmoothModP p P.bar R) (S : Type u) [CommRing S]
    [Algebra P.bar S] [Algebra R S] [IsScalarTower P.bar R S]
    [IsAdicComplete (Ideal.span {(p : S)}) S]
    (het : Algebra.Etale (R ⧸ Ideal.span {(p : R)}) ((R ⧸ Ideal.span {(p : R)}) ⊗[R] S)) :
    Nonempty ((completedBaseChange (algebraMap R S) (Ideal.span {(p : S)})).obj
      (hodgeTateCohomology P R) ≅ hodgeTateCohomology P S) := sorry

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

/-- `η^1 : Ω^1_{R/(A/I)} → H^1(Δ̄_{R/A}){1}`, `f dg ↦ f β_I(g)`, on the `p`-completed module of
differentials `completedKaehler`. -/
noncomputable def eta1 : completedKaehler P R →ₗ[R] twistedCohomology P R 1 := sorry

-- pr1_bockstein_eta1_d
example (g : R) :
    eta1 P R (completedD P R g) = bockstein P R 0 (eta0 P R g) := sorry

-- pr1_bockstein_base_zero
example (hb : P.IsBounded) : bockstein P P.bar 0 = 0 := sorry

-- pr1_bockstein_not_linear
example (hb : P.IsBounded) (hR : SmoothModP p P.bar R) (g : R)
    (hg : completedD P R g ≠ 0) : bockstein P R 0 (eta0 P R g) ≠ 0 := sorry

/-! #### The Hodge–Tate comparison map and theorem -/

/-- Node `PR.1/hodge-tate-comparison-map`: `η^i : Ω^i_{R/(A/I)} → H^i(Δ̄_{R/A}){i}`, where
`Ω^i = ⋀^i Ω^1` is formed from the `p`-completed module `completedKaehler` (for `p`-completely
smooth `R` it is finite projective, so its exterior powers are complete). -/
noncomputable def comparisonMap (i : ℕ) :
    ⋀[R]^i (completedKaehler P R) →ₗ[R] twistedCohomology P R i := sorry

theorem comparisonMap_one (g : R) :
    comparisonMap P R 1 (exteriorPower.ιMulti R 1 (fun _ => completedD P R g)) =
      bockstein P R 0 (eta0 P R g) := sorry

theorem comparisonMap_wedge (i j : ℕ) (v : Fin i → completedKaehler P R)
    (w : Fin j → completedKaehler P R) :
    comparisonMap P R (i + j) (exteriorPower.ιMulti R (i + j) (Fin.append v w)) =
      cup P R i j (comparisonMap P R i (exteriorPower.ιMulti R i v))
        (comparisonMap P R j (exteriorPower.ιMulti R j w)) := sorry

/-- Compatibility with the de Rham differential, on generators:
`β_I(η^i(f₀ df₁ ∧ … ∧ df_i)) = η^{i+1}(df₀ ∧ df₁ ∧ … ∧ df_i)`. -/
theorem comparisonMap_d (i : ℕ) (f₀ : R) (f : Fin i → R) :
    bockstein P R i (comparisonMap P R i
        (f₀ • exteriorPower.ιMulti R i (fun k => completedD P R (f k)))) =
      comparisonMap P R (i + 1) (exteriorPower.ιMulti R (i + 1)
        (Fin.cons (completedD P R f₀)
          (fun k => completedD P R (f k)) : Fin (i + 1) → completedKaehler P R)) :=
  sorry

/-- Lemma 4.10: `β_I(f)² = 0`. -/
theorem bockstein_eta0_cup_self (hb : P.IsBounded) (hR : SmoothModP p P.bar R) (f : R) :
    cup P R 1 1 (bockstein P R 0 (eta0 P R f)) (bockstein P R 0 (eta0 P R f)) = 0 := sorry

-- pr1_comparison_map_one_formula
example (f g : R) :
    comparisonMap P R 1
        (f • exteriorPower.ιMulti R 1 (fun _ => completedD P R g)) =
      f • bockstein P R 0 (eta0 P R g) := sorry

-- pr1_comparison_map_base
example (hb : P.IsBounded) : Function.Bijective (comparisonMap P P.bar 0) := sorry

-- pr1_comparison_map_square_zero
example (hb : P.IsBounded) (hR : SmoothModP p P.bar R) (g : R) :
    comparisonMap P R 2 (exteriorPower.ιMulti R 2 (fun _ => completedD P R g)) =
      cup P R 1 1 (bockstein P R 0 (eta0 P R g)) (bockstein P R 0 (eta0 P R g)) := sorry

/-- Node `PR.1/hodge-tate-comparison-char-p` (Corollary 5.5): the Hodge–Tate comparison over a
crystalline prism; its proof is the crystalline comparison and the Cartier isomorphism
(`DerivedDeRhamCohomology:DD.3/polynomial-cartier-map`). -/
theorem comparison_bijective_of_isCrystalline (hc : P.IsCrystalline) (hb : P.IsBounded)
    (hR : SmoothModP p P.bar R) (i : ℕ) : Function.Bijective (comparisonMap P R i) := sorry

/-- Node `PR.1/hodge-tate-affine-line` (Proposition 6.2): for `R = A / I⟨x⟩`, characterised by
its universal property among `p`-complete `A / I`-algebras, `η^0` and `η^1` are bijective and
`H^i(Δ̄_{R/A}) = 0` for `i > 1`; `η^1` is defined on the `p`-completed `Ω^1_{R/(A/I)}`. -/
theorem affineLine (hb : P.IsBounded) (x : R) [IsAdicComplete (Ideal.span {(p : R)}) R]
    (hx : ∀ (B : Type u) [CommRing B] [Algebra P.bar B]
      [IsAdicComplete (Ideal.span {(p : B)}) B] (b : B), ∃! φ : R →ₐ[P.bar] B, φ x = b) :
    Function.Bijective (eta0 P R) ∧ Function.Bijective (eta1 P R) ∧
      ∀ i : ℤ, 1 < i → Limits.IsZero (cohomologyModule P R i) := sorry

/-- Node `PR.1/hodge-tate-comparison` (Theorems 4.11 and 6.3): the Hodge–Tate comparison,
`Ω^i_{R/(A/I)} ≅ H^i(Δ̄_{R/A}){i}`, for every bounded prism and `p`-completely smooth `R` (including
the flatness recorded in `SmoothModP`), `Ω^i` being formed from the `p`-completed module of
differentials. There is no Frobenius twist. -/
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

/-- Property (3) of Construction 6.1: `α̂^* Δ_{R/A} ≃ Δ_{R_B/B}`, the left side being the
`(p, I)`-completed derived base change `completedBaseChange` along `α` (owner
`DerivedDeRhamCohomology:DD.1`) and `R' = R_B` the `p`-completed base change of `R` along `α`. -/
theorem crystallization_cohomology (hb : P.IsBounded) (R : Type u) [CommRing R] [Algebra P.bar R]
    (hR : SmoothModP p P.bar R) (R' : Type u) [CommRing R']
    [Algebra (crystallization P d hd).prism.bar R'] (g : R →+* R')
    (hg : IsCompletedBaseChange (crystallizationMap P d hd) R R' g) :
    Nonempty ((completedBaseChange (crystallizationMap P d hd).toRingHom
        (reductionIdeal (crystallization P d hd).prism)).obj (prismaticCohomology P R) ≅
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
crystalline prism (`I = (p)`, `A` `p`-adically complete) and `R` smooth over `A / p`,
`φ_A^* Δ_{R/A} ≃ RΓ_crys(R/A)`. The left side is the `p`-completed Frobenius pullback
`completedBaseChange φ_A (p)` (owner `DerivedDeRhamCohomology:DD.1`), the right side the
crystalline cohomology `crystallineCohomology` relative to `(A, (p))` with its divided powers
(owner `CrystallineCohomology:CR.2`; `A` is `p`-torsion-free, so `γ` is the unique PD structure on
`(p)`). The scalar extension along `φ_A` is essential; equivalently
`Δ_{R^{(1)}/A} ≃ RΓ_crys(R/A)`. -/
theorem comparison (hc : P.IsCrystalline) [IsAdicComplete (Ideal.span {(p : A)}) A]
    (γ : DividedPowers P.I) (R : Type u) [CommRing R] [Algebra P.bar R]
    (hR : Algebra.Smooth P.bar R) :
    Nonempty ((completedBaseChange P.φ (Ideal.span {(p : A)})).obj (prismaticCohomology P R) ≅
      crystallineCohomology γ R) := sorry

end TauCeti.Prismatic.Crystalline

/-! ### The de Rham comparison -/

namespace TauCeti.Prismatic.DeRham

open CategoryTheory TensorProduct TauCeti.Delta TauCeti.Prismatic.Site

attribute [local instance] HasDerivedCategory.standard

universe u

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] (P : Prism p A)

/-- Node `PR.1/de-rham-comparison` (Theorem 6.4): if `W(A / I)` is `p`-torsion-free, then
`Δ_{R/A} ⊗̂^L_{A, φ_A} A / I ≃ Ω^*_{R/(A/I)}`. The left side is the `p`-completed derived base
change `completedBaseChange` along the Frobenius-twisted reduction `A → A → A / I` (owner
`DerivedDeRhamCohomology:DD.1`), the right side the `p`-completed de Rham complex `deRhamComplex`
(owner `DerivedDeRhamCohomology:DD.2`). The statement without the hypothesis on `W(A / I)` is
`PrismaticCohomology:PR.3/de-rham-comparison-general`. -/
theorem comparison (hb : P.IsBounded)
    (hW : ∀ x : WittVector p P.bar, (p : WittVector p P.bar) * x = 0 → x = 0)
    (R : Type u) [CommRing R] [Algebra P.bar R] (hR : SmoothModP p P.bar R) :
    Nonempty ((completedBaseChange ((Ideal.Quotient.mk P.I).comp P.φ)
        (Ideal.span {(p : P.bar)})).obj (prismaticCohomology P R) ≅
      deRhamComplex p P.bar R) := sorry

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
quotient by a regular sequence, a polynomial ring, the base ring), and the docstring says so.
Every node of the layer fixes a bounded prism: each statement below carries `hb : P.IsBounded`
(the carriers themselves are defined for every prism). -/

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

theorem map_id (P : Prism p A) (hb : P.IsBounded) (R : SimplicialObject (CommAlgCat.{u} P.bar)) :
    map P (𝟙 R) = 𝟙 (cohomology P R) := sorry

theorem map_comp (P : Prism p A) (hb : P.IsBounded)
    {R S T : SimplicialObject (CommAlgCat.{u} P.bar)}
    (f : R ⟶ S) (g : S ⟶ T) : map P (f ≫ g) = map P f ≫ map P g := sorry

/-- The `φ_A`-semilinear Frobenius `φ_R : Δ_{R/A} ⟶ φ_{A,*} Δ_{R/A}`. -/
noncomputable def frobenius (P : Prism p A) (R : SimplicialObject (CommAlgCat.{u} P.bar)) :
    cohomology P R ⟶ (frobeniusPushforward P).obj (cohomology P R) := sorry

theorem frobenius_naturality (P : Prism p A) (hb : P.IsBounded)
    {R S : SimplicialObject (CommAlgCat.{u} P.bar)}
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
noncomputable def constIso (P : Prism p A) (hb : P.IsBounded)
    (R : Type u) [CommRing R] [Algebra P.bar R] :
    cohomology P ((SimplicialObject.const (CommAlgCat.{u} P.bar)).obj (CommAlgCat.of P.bar R)) ≅
      prismaticCohomology P R := sorry

-- pr2_derived_base_ring
example (P : Prism p A) (hb : P.IsBounded) :
    Nonempty (prismaticCohomology P P.bar ≅
      (DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A A)) := sorry

-- pr2_derived_const_agrees
example (P : Prism p A) (hb : P.IsBounded) (R : Type u) [CommRing R] [Algebra P.bar R] :
    Nonempty (cohomology P
      ((SimplicialObject.const (CommAlgCat.{u} P.bar)).obj (CommAlgCat.of P.bar R)) ≅
      prismaticCohomology P R) := sorry

-- pr2_derived_product
example (P : Prism p A) (hb : P.IsBounded) :
    Nonempty (prismaticCohomology P (P.bar × P.bar) ≅
      (DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A (A × A))) := sorry

-- pr2_derived_not_pi0_invariant
example (P : Prism p A) (hb : P.IsBounded) [Nontrivial P.bar] :
    ∃ R : SimplicialObject (CommAlgCat.{u} P.bar),
      ¬ Limits.IsZero
        ((DerivedCategory.homologyFunctor (ModuleCat.{u} P.bar) (-1)).obj (hodgeTate P R)) := sorry

-- pr2_derived_frobenius_natural_id
example (P : Prism p A) (hb : P.IsBounded) (R : SimplicialObject (CommAlgCat.{u} P.bar)) :
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

theorem conjFilMap_refl (P : Prism p A) (hb : P.IsBounded)
    (R : Type u) [CommRing R] [Algebra P.bar R] (i : ℕ) :
    conjFilMap P R (le_refl i) = 𝟙 (conjFil P R i) := sorry

theorem conjFilMap_trans (P : Prism p A) (hb : P.IsBounded)
    (R : Type u) [CommRing R] [Algebra P.bar R]
    {i j k : ℕ} (h : i ≤ j) (h' : j ≤ k) :
    conjFilMap P R h ≫ conjFilMap P R h' = conjFilMap P R (h.trans h') := sorry

/-- The map `Fil_i^conj ⟶ Δ̄_{R/A}`. -/
noncomputable def conjFilι (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] (i : ℕ) :
    conjFil P R i ⟶ hodgeTateCohomology P R := sorry

theorem conjFilMap_ι (P : Prism p A) (hb : P.IsBounded) (R : Type u) [CommRing R] [Algebra P.bar R]
    {i j : ℕ} (h : i ≤ j) : conjFilMap P R h ≫ conjFilι P R j = conjFilι P R i := sorry

/-- `Fil_0^conj Δ̄_{R/A} = R`. -/
noncomputable def conjFilZeroIso (P : Prism p A) (hb : P.IsBounded)
    (R : Type u) [CommRing R] [Algebra P.bar R] :
    conjFil P R 0 ≅ (DerivedCategory.singleFunctor (ModuleCat.{u} R) 0).obj (ModuleCat.of R R) :=
  sorry

/-- The graded piece `gr_i^conj Δ̄_{R/A}`, the cofibre of `Fil_{i-1}^conj ⟶ Fil_i^conj`. -/
noncomputable def conjGr (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] (i : ℕ) :
    DerivedCategory (ModuleCat.{u} R) := sorry

-- pr2_conj_fil_zero
example (P : Prism p A) (hb : P.IsBounded) (R : Type u) [CommRing R] [Algebra P.bar R] :
    Nonempty (conjFil P R 0 ≅
      (DerivedCategory.singleFunctor (ModuleCat.{u} R) 0).obj (ModuleCat.of R R)) := sorry

-- pr2_conj_fil_base
example (P : Prism p A) (hb : P.IsBounded) (i : ℕ) : IsIso (conjFilι P P.bar i) := sorry

-- pr2_conj_fil_smooth_truncation
example (P : Prism p A) (hb : P.IsBounded)
    (R : Type u) [CommRing R] [Algebra P.bar R] [Algebra.Smooth P.bar R]
    (i : ℕ) (n : ℤ) (hn : (i : ℤ) < n) :
    Limits.IsZero
      ((DerivedCategory.homologyFunctor (ModuleCat.{u} R) n).obj (conjFil P R i)) := sorry

-- pr2_conj_fil_not_postnikov
example (P : Prism p A) (hb : P.IsBounded) (f : P.bar) (hf : f ∈ nonZeroDivisors P.bar)
    [Nontrivial (P.bar ⧸ Ideal.span {f})]
    (hbS : ∃ n : ℕ, ∀ x : P.bar ⧸ Ideal.span {f},
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

/-- The derived `p`-completed exterior powers `(∧^i L_{R/(A/I)})^∧` of the cotangent complex of `R`
over `A / I`: the value that `DerivedDeRhamCohomology:DD.0` (cotangent complex, derived exterior
powers) and `DD.1` (derived completion) construct. -/
noncomputable def cotangentPowers (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] :
    CotangentPowers P R := sorry

/-- The derived Hodge–Tate comparison for a bounded orientable prism, where a generator of `I`
trivialises the Breuil–Kisin twists: `gr_i^conj Δ̄_{R/A} ≃ (∧^i L_{R/(A/I)})^∧[-i]`, for the
exterior powers `cotangentPowers P R` of the owner. -/
theorem conjGr_iso_cotangentPowers (P : Prism p A) (hb : P.IsBounded) (hP : P.IsOrientable)
    (R : Type u) [CommRing R] [Algebra P.bar R] (i : ℕ) :
    Nonempty (conjGr P R i ≅
      (shiftFunctor (DerivedCategory (ModuleCat.{u} R)) (-(i : ℤ))).obj
        ((cotangentPowers P R).wedge i)) := sorry

/-- The last step of consequence (b): if `Δ̄_{R/A}` is discrete then so is `Δ_{R/A}`. -/
theorem discrete_of_hodgeTate_discrete (P : Prism p A) (hb : P.IsBounded) (R : Type u)
    [CommRing R] [Algebra P.bar R]
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

theorem toPrism_frobenius (P : Prism p A) (hb : P.IsBounded)
    (R : Type u) [CommRing R] [Algebra P.bar R]
    [Algebra A R] [IsScalarTower A P.bar R] {B : Type u} [CommRing B] [Algebra A B]
    (Q : Prism p B) (hδ : IsDeltaHom p P.δ Q.δ (algebraMap A B))
    (hI : P.I.map (algebraMap A B) ≤ Q.I) (g : R →ₐ[A] B ⧸ Q.I) :
    toPrism P R Q hδ hI g ≫ prismFrobeniusMap P Q hδ =
      prismaticFrobenius P R ≫ (frobeniusPushforward P).map (toPrism P R Q hδ hI g) := sorry

theorem toPrism_naturality (P : Prism p A) (hb : P.IsBounded)
    (R : Type u) [CommRing R] [Algebra P.bar R]
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

theorem toSite_isIso_of_smooth (P : Prism p A) (hb : P.IsBounded)
    (R : Type u) [CommRing R] [Algebra P.bar R]
    [Algebra.Smooth P.bar R] : IsIso (toSite P R) := sorry

-- pr2_to_prism_base
example (P : Prism p A) (hb : P.IsBounded) (hδ : IsDeltaHom p P.δ P.δ (algebraMap A A))
    (hI : P.I.map (algebraMap A A) ≤ P.I) :
    IsIso (toPrism P P.bar P hδ hI (AlgHom.id A (A ⧸ P.I))) := sorry

-- pr2_to_site_smooth
example (P : Prism p A) (hb : P.IsBounded) : IsIso (toSite P (P.bar × P.bar)) := sorry

-- pr2_to_site_not_iso
example (P : Prism p A) (hb : P.IsBounded) [Nontrivial P.bar] :
    ∃ R : SimplicialObject (CommAlgCat.{u} P.bar), ¬ (hodgeTate P R).IsGE 0 := sorry

-- pr2_to_prism_frobenius_base
example (P : Prism p A) (hb : P.IsBounded) (hδ : IsDeltaHom p P.δ P.δ (algebraMap A A))
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
theorem regularQuotient_discrete (P : Prism p A) (hb : P.IsBounded) (fs : List P.bar)
    (hreg : RingTheory.Sequence.IsRegular P.bar fs)
    (hbS : ∃ n : ℕ, ∀ x : P.bar ⧸ Ideal.ofList fs,
      (∃ m : ℕ, (p : P.bar ⧸ Ideal.ofList fs) ^ m * x = 0) →
        (p : P.bar ⧸ Ideal.ofList fs) ^ n * x = 0)
    (n : ℤ) (hn : n ≠ 0) :
    Limits.IsZero ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) n).obj
      (prismaticCohomology P (P.bar ⧸ Ideal.ofList fs))) := sorry

/-- In the same situation the comparison map to the cohomology of the prismatic site is an
isomorphism: `Δ_{R/A}` is the initial object of `(R/A)_Δ`. -/
theorem regularQuotient_toSite_isIso (P : Prism p A) (hb : P.IsBounded) (fs : List P.bar)
    (hreg : RingTheory.Sequence.IsRegular P.bar fs)
    (hbS : ∃ n : ℕ, ∀ x : P.bar ⧸ Ideal.ofList fs,
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
noncomputable def perfectionFrobenius (P : Prism p A) (hb : P.IsBounded) (S : Type u) [CommRing S]
    [Algebra P.bar S] : perfection P S ≅ (frobeniusPushforward P).obj (perfection P S) := sorry

theorem toPerfection_frobenius (P : Prism p A) (hb : P.IsBounded) (S : Type u)
    [CommRing S] [Algebra P.bar S] :
    toPerfection P S ≫ (perfectionFrobenius P hb S).hom =
      prismaticFrobenius P S ≫ (frobeniusPushforward P).map (toPerfection P S) := sorry

theorem isIso_toPerfection (P : Prism p A) (hb : P.IsBounded)
    (S : Type u) [CommRing S] [Algebra P.bar S]
    (h : IsIso (prismaticFrobenius P S)) : IsIso (toPerfection P S) := sorry

/-- The map `S ⟶ S_perfd` in `D(A / I)`. -/
noncomputable def fromRing (P : Prism p A) (S : Type u) [CommRing S] [Algebra P.bar S] :
    (DerivedCategory.singleFunctor (ModuleCat.{u} P.bar) 0).obj (ModuleCat.of P.bar S) ⟶
      perfectoidization P S := sorry

-- pr2_perfection_base
example (P : Prism p A) (hb : P.IsBounded)
    (hP : P.IsPerfect) : IsIso (toPerfection P P.bar) := sorry

-- pr2_perfectoidization_base
example (P : Prism p A) (hb : P.IsBounded) (hP : P.IsPerfect) :
    Nonempty (perfectoidization P P.bar ≅
      (DerivedCategory.singleFunctor (ModuleCat.{u} P.bar) 0).obj (ModuleCat.of P.bar P.bar)) :=
  sorry

-- pr2_perfectoidization_char_p_discrete
example (P : Prism p A) (hb : P.IsBounded)
    (hP : P.IsPerfect) (hc : P.IsCrystalline) (n : ℤ) (hn : n ≠ 0) :
    Limits.IsZero ((DerivedCategory.homologyFunctor (ModuleCat.{u} P.bar) n).obj
      (perfectoidization P (Polynomial P.bar))) := sorry

-- pr2_perfection_not_prismatic
example (P : Prism p A) (hb : P.IsBounded)
    (hP : P.IsPerfect) (hc : P.IsCrystalline) [Nontrivial P.bar] :
    ¬ IsIso (toPerfection P (Polynomial P.bar)) := sorry

/-! ### Node `PR.2/perfectoidization-coconnective` (Bhatt–Scholze, Lemma 8.4) -/

/-- `Δ_{S/A,perf}` lies in `D^{≥ 0}` for a perfect prism. The proof imports the operation
`P^0` on `E_∞`-`F_p`-algebras. -/
theorem perfection_isGE (P : Prism p A) (hb : P.IsBounded)
    (hP : P.IsPerfect) (S : Type u) [CommRing S]
    [Algebra P.bar S] : (perfection P S).IsGE 0 := sorry

/-- `S_perfd` lies in `D^{≥ 0}` for a perfect prism. -/
theorem perfectoidization_isGE (P : Prism p A) (hb : P.IsBounded)
    (hP : P.IsPerfect) (S : Type u) [CommRing S]
    [Algebra P.bar S] : (perfectoidization P S).IsGE 0 := sorry

/-! ### Node `PR.2/connective-perfectoidization-perfectoid` (Bhatt–Scholze, Corollary 8.14)

The part statable without the perfectoid predicate (PerfectoidQuotients Q0): if `S_perfd` is
connective then it and `Δ_{S/A,perf}` are discrete. That `S_perfd` is then a perfectoid ring
and universal, and Proposition 8.13 (symmetric monoidality), are stated in the roadmap. -/
theorem perfection_discrete_of_connective (P : Prism p A) (hb : P.IsBounded)
    (hP : P.IsPerfect) (S : Type u)
    [CommRing S] [Algebra P.bar S] (h : (perfectoidization P S).IsLE 0) (n : ℤ) (hn : n ≠ 0) :
    Limits.IsZero
      ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) n).obj (perfection P S)) := sorry

end TauCeti.Prismatic.Perfection


/-! ## PR.3. Nygaard filtration, divided Frobenius and twists

Suggested signatures for the layer `PrismaticCohomology:PR.3`. Derived (p, I)-completeness of
prisms (DD.1) is not a field of `Prism`; statements that need it say so. Objects of other
layers (the conjugate filtration, `Lη`, de Rham complexes, completed base change) enter as the
shared placeholders `completedBaseChange` and `deRhamComplex` or as fields of the specific values
`inputs P R` and `qrspData P S` of structures of imported data, each field naming its owner. The
one structure that statements quantify over, `ChangeOfPrism`, pins its fields by characterising
properties. -/

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

/-- Bhatt–Lurie Remark 2.1.7. Needs `A` to be `I`-adically separated, which holds for prisms;
`Prism` does not record it, so classical `(p, I)`-adic completeness is a hypothesis. -/
theorem IsTransversal.torsionFree (h : IsTransversal P)
    [IsAdicComplete (Ideal.span {(p : A)} ⊔ P.I) A] (x : A) (hx : (p : A) * x = 0) :
    x = 0 := by sorry

/-- Bhatt–Lurie Lemma 2.2.5 (its proof uses `IsTransversal.torsionFree`, hence the same
completeness hypothesis). -/
theorem IsTransversal.quotient_Ir_torsionFree (h : IsTransversal P)
    [IsAdicComplete (Ideal.span {(p : A)} ⊔ P.I) A] (r : ℕ)
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
example (h : IsTransversal P) [IsAdicComplete (Ideal.span {(p : A)} ⊔ P.I) A] (x : A)
    (hx : (p : A) * x = 0) : x = 0 := by sorry

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

/-- The data of `S` that PR.2 constructs (nodes `qrsp-prism` and `derived-hodge-tate-comparison`)
for a quasiregular semiperfectoid algebra `S` over the perfectoid ring `A / I` of a perfect prism
`(A, I)`: the ring `Δ_S` with its prism `(Δ_S, I Δ_S)`, the structure map `S → Δ̄_S`, and the
conjugate filtration of `Δ̄_S` relative to `A / I`. -/
noncomputable def qrspData {A : Type u} [CommRing A] (P : Prism p A) (S : Type u) [CommRing S]
    [Algebra P.bar S] : QrspData p S := sorry

/-- The map of prisms `(A, I) → (Δ_S, I Δ_S)` (owner PR.2, node `qrsp-prism`). -/
noncomputable def qrspBaseMap {A : Type u} [CommRing A] (P : Prism p A) (S : Type u) [CommRing S]
    [Algebra P.bar S] : P.Hom (qrspData P S).prism := sorry

/-- Node `PR.3/nygaard-graded-pieces` (Bhatt–Scholze Theorem 12.2): for `S` quasiregular
semiperfectoid over the perfectoid ring of a perfect prism `(A, (d))`, the image of `φ / d^i`
in `Δ̄_S` is the conjugate filtration relative to `A / I`. The statement concerns the data
`qrspData P S` of the owner and the image in `Δ_S` of a generator `d` of `I`. Of the hypothesis
on `S`, `p`-adic completeness and semiperfectness (`x ↦ x ^ p` surjective on `S / p`) are
recorded; quasiregularity (`DerivedDeRhamCohomology:DD.5`) is not. -/
theorem range_dividedFrobenius_eq_conj {A : Type u} [CommRing A] (P : Prism p A)
    (hP : P.IsPerfect) (S : Type u) [CommRing S] [Algebra P.bar S]
    [IsAdicComplete (Ideal.span {(p : S)}) S]
    (hS : ∀ x : S, ∃ y : S, x - y ^ p ∈ Ideal.span {(p : S)})
    (d : A) (hdA : P.I = Ideal.span {d})
    (hd : (qrspData P S).prism.I = Ideal.span {(qrspBaseMap P S).toRingHom d}) (i : ℕ) :
    Set.range (fun x : fil (qrspData P S).prism i =>
        Ideal.Quotient.mk (qrspData P S).prism.I
          (dividedFrobenius (qrspData P S).prism ((qrspBaseMap P S).toRingHom d) hd i x)) =
      ((qrspData P S).conj i : Set ((qrspData P S).D ⧸ (qrspData P S).prism.I)) := by sorry

/-- Node `PR.3/nygaard-graded-pieces` (3): `Δ_S / Fil^1_N Δ_S ≅ S`, induced by `φ`, for the data
`qrspData P S` of the owner (hypotheses on `S` as in `range_dividedFrobenius_eq_conj`). -/
theorem quotient_fil_one_equiv {A : Type u} [CommRing A] (P : Prism p A) (hP : P.IsPerfect)
    (S : Type u) [CommRing S] [Algebra P.bar S] [IsAdicComplete (Ideal.span {(p : S)}) S]
    (hS : ∀ x : S, ∃ y : S, x - y ^ p ∈ Ideal.span {(p : S)}) :
    ∃ e : ((qrspData P S).D ⧸ fil (qrspData P S).prism 1) ≃+* S, ∀ x : (qrspData P S).D,
      (qrspData P S).toBar (e (Ideal.Quotient.mk _ x)) =
        Ideal.Quotient.mk (qrspData P S).prism.I ((qrspData P S).prism.φ x) := by
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

/-- A change of prism for `R`: a map of prisms `(A, I) → (B, J)` with the `p`-completed base
change `R_B` of `R` (owners: PR.1 for the base-changed algebra, DD.1 for the completed derived
base change). The fields `baseChange_eq` and `isCompletedBaseChange` pin `baseChange` and `R'` to
the objects their docstrings name, so a statement over every change of prism is a statement over
every map of prisms. -/
structure ChangeOfPrism {B : Type u} [CommRing B] (Q : Prism p B) where
  /-- The map of prisms (PR.0). -/
  hom : P.Hom Q
  /-- The completed derived base change `B ⊗̂^L_A −` (DD.1). -/
  baseChange : DerivedCategory (ModuleCat.{u} A) ⥤ DerivedCategory (ModuleCat.{u} B)
  /-- `baseChange` is the `(p, I)`-completed derived base change along `hom`. -/
  baseChange_eq : baseChange = completedBaseChange hom.toRingHom (Site.reductionIdeal Q)
  /-- The base-changed algebra `R_B`, the `p`-completion of `R ⊗_A B` (PR.1). -/
  R' : Type u
  /-- Its ring structure. -/
  [commRing : CommRing R']
  /-- Its structure of `B / J`-algebra. -/
  [algebra : Algebra Q.bar R']
  /-- The map `R → R_B`. -/
  toR' : R →+* R'
  /-- `R_B` is the `p`-completed base change of `R` along `hom`. -/
  isCompletedBaseChange : Site.IsCompletedBaseChange hom R R' toR'

attribute [instance] ChangeOfPrism.commRing ChangeOfPrism.algebra

/-- Bhatt–Lurie Remark 5.1.10: the filtration commutes with change of prism. -/
theorem relFilBaseChange {B : Type u} [CommRing B] {Q : Prism p B} (c : ChangeOfPrism P R Q)
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

/-- The values of the imported data of the layer for `(A, I)` and `R`, constructed by the owners
named at each field of `Inputs`. The derived reduction is the `p`-completed base change
`completedBaseChange (A → A / I)` and the de Rham complex is the placeholder `deRhamComplex`;
`Lη_I` with its map to the identity (`AInfCohomology:AI.1`), the twisted conjugate filtration
(PR.2), the Hodge filtration (DD.2), `I ⊗_A −` and the quasisyntomic unfolding (DD.5) are
placeholders of their owners. No statement below quantifies over `Inputs`. -/
noncomputable def inputs (P : Prism p A) (R : Type u) [CommRing R] [Algebra P.bar R] :
    Inputs P R where
  Leta := sorry
  letaToSelf := sorry
  reduction := completedBaseChange (Ideal.Quotient.mk P.I) (Ideal.span {(p : P.bar)})
  deRham := deRhamComplex p P.bar R
  conjTwist := sorry
  hodgeFil := sorry
  tensorI := sorry
  unfold := sorry

variable {P R}

/-- Bhatt–Scholze Proposition 12.10 and §12.5: `gr^i_N Δ_{R/A} ≅ φ_* Fil_i^conj Δ̄_{R/A}{i}`
(the isomorphism induced by `φ / d^i` is `φ_A`-semilinear), for the twisted conjugate filtration
`(inputs P R).conjTwist` of PR.2. -/
theorem grDerivedIsoConj (hP : P.IsPerfect) (i : ℕ) :
    Nonempty (grDerived P R i ≅ (frobeniusPushforward P).obj ((inputs P R).conjTwist i)) := by
  sorry

/-- For `R` `p`-completely smooth the graded piece lives in degrees `[0, i]`: it is
`τ^{≤ i} Δ̄_{R/A}{i}`. -/
theorem grDerived_smooth (hP : P.IsPerfect) (hR : Site.SmoothModP p P.bar R) (i : ℕ) (n : ℤ)
    (hn : (i : ℤ) < n) :
    Limits.IsZero ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) n).obj
      (grDerived P R i)) := by sorry

/-- Quasisyntomic descent for `Fil^i_N`: `Fil^i_N Δ_{R/A}` is the quasisyntomic unfolding
`(inputs P R).unfold i` of its values on quasiregular semiperfectoid rings (the cover and its
Čech nerve belong to DD.5). -/
theorem filDerived_isSheaf (hP : P.IsPerfect) (i : ℕ) :
    Nonempty ((filDerived P R).obj (Opposite.op i) ≅ (inputs P R).unfold i) := by sorry

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

/-- Node `PR.3/relative-nygaard-graded-pieces` (Bhatt–Lurie Remark 5.1.2), for a bounded prism:
`gr^i_N φ_A^* Δ_{R/A} ≅ Fil_i^conj Δ̄_{R/A}{i}`, the right side being the twisted conjugate
filtration `(inputs P R).conjTwist i` of PR.2. -/
theorem relGr_iso_conj (hb : P.IsBounded) (i : ℕ) :
    Nonempty (relGr P R i ≅ (inputs P R).conjTwist i) := by
  sorry

/-- Node `PR.3/leta-frobenius-factorisation` (Bhatt–Scholze Theorem 15.3), for `R`
`p`-completely smooth over `A / I` and `(A, I)` bounded, with `Lη_I` and its canonical map
`Lη_I Δ → Δ` those of `AInfCohomology:AI.1` (fields of `inputs P R`). -/
theorem leta_frobenius_factorisation (hb : P.IsBounded) (hR : Site.SmoothModP p P.bar R) :
    ∃ φt : frobeniusTwist P R ⟶ (inputs P R).Leta.obj (prismaticCohomology P R),
      IsIso φt ∧ φt ≫ (inputs P R).letaToSelf = relativeFrobenius P R := by sorry

/-- Node `PR.3/de-rham-comparison-general` (Bhatt–Scholze Corollary 15.4; Bhatt–Lurie
Proposition 5.2.5), for a bounded prism and `p`-completely smooth `R`:
`φ_A^* Δ_{R/A} ⊗̂^L_A A / I ≃ Ω^*_{R/(A/I)}`, with the completed reduction `completedBaseChange`
and the de Rham complex `deRhamComplex` (the fields `reduction` and `deRham` of `inputs P R`). -/
theorem de_rham_comparison_general (hb : P.IsBounded) (hR : Site.SmoothModP p P.bar R) :
    Nonempty ((inputs P R).reduction.obj (frobeniusTwist P R) ≅ (inputs P R).deRham) := by sorry

/-- Node `PR.3/nygaard-hodge-comparison` (Bhatt–Lurie Corollary 5.2.8), for a bounded prism: a
distinguished triangle `I ⊗ Fil^i_N → Fil^{i+1}_N → Fil^{i+1}_Hodge`, with `I ⊗_A −` and the
Hodge filtration of the owners (fields of `inputs P R`). -/
theorem nygaard_hodge_triangle (hb : P.IsBounded) (i : ℕ) :
    ∃ (v : (inputs P R).tensorI.obj ((relFil P R).obj (Opposite.op i)) ⟶
        (relFil P R).obj (Opposite.op (i + 1)))
      (γ : (relFil P R).obj (Opposite.op (i + 1)) ⟶ (inputs P R).hodgeFil (i + 1))
      (h : (inputs P R).hodgeFil (i + 1) ⟶
        ((inputs P R).tensorI.obj ((relFil P R).obj (Opposite.op i)))⟦(1 : ℤ)⟧),
      Pretriangulated.Triangle.mk v γ h ∈ distTriang (DerivedCategory (ModuleCat.{u} A)) := by
  sorry

/-- Node `PR.3/image-of-frobenius` (Bhatt–Scholze Corollary 15.5) on cohomology, for an
oriented bounded prism and `R` `p`-completely smooth: `V_i` with `V_i φ = φ V_i = d^i`. -/
theorem image_of_frobenius (hb : P.IsBounded) (hR : Site.SmoothModP p P.bar R) (d : A)
    (hd : P.I = Ideal.span {d}) (i : ℕ) :
    ∃ V : (DerivedCategory.homologyFunctor (ModuleCat.{u} A) (i : ℤ)).obj
          (prismaticCohomology P R) ⟶
        (DerivedCategory.homologyFunctor (ModuleCat.{u} A) (i : ℤ)).obj (frobeniusTwist P R),
      (∀ x, V.hom (((DerivedCategory.homologyFunctor (ModuleCat.{u} A) (i : ℤ)).map
        (relativeFrobenius P R)).hom x) = d ^ i • x) ∧
      (∀ y, ((DerivedCategory.homologyFunctor (ModuleCat.{u} A) (i : ℤ)).map
        (relativeFrobenius P R)).hom (V.hom y) = d ^ i • y) := by sorry

/-- Node `PR.3/nygaard-frobenius-colimit` (Bhatt–Lurie Corollary 5.2.16), smooth case: for an
oriented bounded prism and `R` `p`-completely smooth of dimension `≤ n` (recorded as
`⋀^{n+1} Ω^1_{R/(A/I)} = 0`) the composite `Fil^n_N φ_A^* Δ → φ_A^* Δ → Δ` is `d^n` times an
isomorphism; stated on cohomology. -/
theorem frobenius_fil_top (hb : P.IsBounded) (hR : Site.SmoothModP p P.bar R) (d : A)
    (hd : P.I = Ideal.span {d}) (n : ℕ)
    (hdim : Subsingleton (⋀[R]^(n + 1) (completedKaehler P R))) (m : ℤ) :
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
twisted prismatic complexes, étale cohomology) enter as fields of structures of imported data;
the docstrings name their owners. A theorem about such an object is stated for the specific
value its owner constructs (`AffineComparisonDatum.ofAlgebra`, `AbsoluteDatum.ofRing`,
`TateTwistDatum.ofPerfectoid`); theorems over all data (`NygaardDatum`, `SchemeDatum`) are
formal properties of fibres and pullbacks. The Breuil–Kisin twist is `BKTwist.twist` of PR.3. A
complex is a cochain complex of modules or an object of Mathlib's derived category, the
1-categorical shadow of the derived ∞-category of the sources; fibres are shifted mapping
cones. -/

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

/-- `(M / p ^ n)^{φ=1} ≃ M^{φ=1} ⊗^L ℤ/p^n`: since `ℤ/p^n` is resolved by `p ^ n : ℤ → ℤ`, this
says that `M^{φ=1} --p^n--> M^{φ=1} → (M / p ^ n)^{φ=1}` extends to a distinguished triangle,
i.e. `(M / p ^ n)^{φ=1}` is the cone of `p ^ n` on `M^{φ=1}`. -/
theorem reduce_fixedPoints (p n : ℕ) (M : FrobeniusModule Λ) :
    ∃ (r : fixedPoints M ⟶ fixedPoints (reduce p n M))
      (δ : fixedPoints (reduce p n M) ⟶ (fixedPoints M)⟦(1 : ℤ)⟧),
      Pretriangulated.Triangle.mk ((p ^ n : ℤ) • 𝟙 (fixedPoints M)) r δ ∈
        distTriang (DerivedCategory (ModuleCat.{u} Λ)) := sorry

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
algebra `S` over a perfectoid ring with perfect prism `(A, (d))`; the statements below concern its
specific value `AffineComparisonDatum.ofAlgebra`. -/
structure AffineComparisonDatum (p n : ℕ) where
  /-- `RΓ_ét(Spec S[1/p], ℤ/p^n)` (owner: `SchemeAndStackFoundations:SF.2`). -/
  etaleGeneric : DerivedCategory (ModuleCat.{0} (ZMod (p ^ n)))
  /-- `RΓ_ét(Spec S, ℤ/p^n)` (owner: `SchemeAndStackFoundations:SF.2`). -/
  etaleIntegral : DerivedCategory (ModuleCat.{0} (ZMod (p ^ n)))
  /-- `Δ_{S/A} / p^n` with its Frobenius (owners: PR.2, PR.1). -/
  prismatic : FrobeniusModule (ZMod (p ^ n))
  /-- `Δ_{S/A}[1/d] / p^n` with its Frobenius (owners: PR.2, PR.1). -/
  prismaticInverted : FrobeniusModule (ZMod (p ^ n))

/-- The value of the imported data for a `P.bar`-algebra `S` at level `p ^ n`: the étale
cohomology of `Spec S[1/p]` and of `Spec S` with coefficients `ℤ/p^n` (owner
`SchemeAndStackFoundations:SF.2`), and `Δ_{S/A} / p^n`, `Δ_{S/A}[1/I] / p^n` with their Frobenius
(owners PR.2, PR.1). -/
noncomputable def AffineComparisonDatum.ofAlgebra (p : ℕ) [Fact p.Prime] {A : Type} [CommRing A]
    (P : Prism p A) (S : Type) [CommRing S] [Algebra P.bar S] (n : ℕ) :
    AffineComparisonDatum p n := sorry

/-- Node `PR.4/etale-comparison` (Bhatt–Scholze Theorem 9.1, affine form):
`RΓ_ét(Spec S[1/p], ℤ/p^n) ≃ (Δ_{S/A}[1/d]/p^n)^{φ=1}` for every `p`-complete algebra `S`
over the perfectoid ring `A / I` of a perfect prism `(A, (d))` (classically `(p, I)`-complete);
no smoothness hypothesis. -/
theorem etaleComparison_affine (p n : ℕ) [Fact p.Prime] {A : Type} [CommRing A] (P : Prism p A)
    (hP : P.IsPerfect) [IsAdicComplete (Ideal.span {(p : A)} ⊔ P.I) A]
    (S : Type) [CommRing S] [Algebra P.bar S] [IsAdicComplete (Ideal.span {(p : S)}) S] :
    Nonempty ((AffineComparisonDatum.ofAlgebra p P S n).etaleGeneric ≅
      fixedPoints (AffineComparisonDatum.ofAlgebra p P S n).prismaticInverted) := sorry

/-- Node `PR.4/etale-comparison-without-inverting-d` (Bhatt–Scholze Remark 9.3, affine form):
`RΓ_ét(Spec S, ℤ/p^n) ≃ (Δ_{S/A}/p^n)^{φ=1}`, same hypotheses as `etaleComparison_affine`. -/
theorem etaleComparison_integral (p n : ℕ) [Fact p.Prime] {A : Type} [CommRing A] (P : Prism p A)
    (hP : P.IsPerfect) [IsAdicComplete (Ideal.span {(p : A)} ⊔ P.I) A]
    (S : Type) [CommRing S] [Algebra P.bar S] [IsAdicComplete (Ideal.span {(p : S)}) S] :
    Nonempty ((AffineComparisonDatum.ofAlgebra p P S n).etaleIntegral ≅
      fixedPoints (AffineComparisonDatum.ofAlgebra p P S n).prismatic) := sorry

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

/-- The datum of a ring `R` in weight `n` that its owners construct: `Fil^n_N Δ_R{n} → Δ_R{n}`
with `ι` and `φ{n}` (owners `PR.5/absolute-prismatic-cohomology`,
`PR.5/absolute-nygaard-filtration`), its Nygaard completion (owner `PR.3/nygaard-completion`)
and the completion map. -/
noncomputable def AbsoluteDatum.ofRing (p : ℕ) [Fact p.Prime] (R : Type) [CommRing R] (n : ℤ) :
    AbsoluteDatum p := sorry

variable (p) in
/-- Bhatt–Lurie Proposition 7.4.6: for the datum `AbsoluteDatum.ofRing p R n` of a ring `R` in
weight `n`, the map from `fib(φ{n} − ι)` to the fibre formed with the Nygaard-completed datum is
an isomorphism. There is no hypothesis on the completion maps of `Fil^n_N Δ_R{n}` and `Δ_R{n}`,
which in general are not isomorphisms (the proof uses that the square of canonical maps is
homotopy cartesian); the case in which they are is the test
`pr4_syntomic_cohomology_completed_agrees`. -/
theorem syntomicCohomology_completion (R : Type) [CommRing R] (n : ℤ) :
    IsIso (syntomicMap (AbsoluteDatum.ofRing p R n).toCompleted) := sorry

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

/-- The value of the imported data for the perfectoid ring `A / I` of a perfect prism in weight
`n`: `RΓ_ét(Spec (A / I)[1/p], ℤ_p(n))` (owner `SchemeAndStackFoundations:SF.2`). -/
noncomputable def TateTwistDatum.ofPerfectoid {A : Type} [CommRing A] (P : Prism p A) (n : ℕ) :
    TateTwistDatum p := sorry

open scoped TensorProduct in
/-- Node `PR.4/tate-twist-perfectoid` (Bhatt–Scholze Theorem 9.4): for a perfectoid ring `R`
with perfect prism `(A, (d))` and `n ≥ 1`, `ℤ_p(n)(R) ≃ RΓ_ét(Spec R[1/p], ℤ_p(n))`, the right
side being `(TateTwistDatum.ofPerfectoid P n).etaleTwisted`. `A` is classically
`(p, I)`-complete, and the generator `d` is adapted to a trivialisation of the twist: some
generator `e` of `A{1}` has `φ_{A{1}}(e) = d⁻¹ e` (formula (9.3) is false for other generators,
node `PR.4/syntomic-complex`). -/
theorem tateTwist_perfectoid {A : Type} [CommRing A] [Algebra ℤ_[p] A] (P : Prism p A)
    (hP : P.IsPerfect) [IsAdicComplete (Ideal.span {(p : A)} ⊔ P.I) A] (d : A)
    (hI : P.I = Ideal.span {d})
    (hd : ∃ e : BKTwist.twist P, Function.Bijective (fun a : A => a • e) ∧
      d • BKTwist.twistFrobeniusMap P e = (Submodule.subtype P.I : Module.Dual A P.I) ⊗ₜ[A] e)
    (n : ℕ) (hn : 1 ≤ n) :
    Nonempty (syntomicComplex (perfectoidDatum P d n) ≅
      (TateTwistDatum.ofPerfectoid P n).etaleTwisted) := sorry

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

open scoped TensorProduct

/-- The prismatic logarithm `log_Δ : (1 + I)_{rk = 1} ⟶ A{1}`, a group homomorphism into the
Breuil–Kisin twist `BKTwist.twist P` of `PR.3/breuil-kisin-twist`. -/
noncomputable def prismaticLog : Additive (rankOneUnits P) →+ BKTwist.twist P := sorry

/-- `φ_{A{1}} (log_Δ u) = log_Δ u`: the Frobenius `BKTwist.twistFrobeniusMap` of the twist, with
values in `I⁻¹ ⊗_A A{1}`, carries `log_Δ u` to the image of `log_Δ u` under
`A{1} → I⁻¹ ⊗_A A{1}`, `x ↦ ι ⊗ x` (`ι : I → A` the inclusion, the element `1` of `I⁻¹`). -/
theorem prismaticLog_frobenius (u : Additive (rankOneUnits P)) :
    BKTwist.twistFrobeniusMap P (prismaticLog P u) =
      (Submodule.subtype P.I : Module.Dual A P.I) ⊗ₜ[A] prismaticLog P u := sorry

/-- Functoriality, on domains: a map of prisms carries rank-one units to rank-one units.
The equation `f{1} (log_Δ u) = log_Δ (f u)` needs the functoriality of the twist (PR.3) and
is not stated. -/
theorem prismaticLog_map {B : Type u} [CommRing B] (Q : Prism p B) (f : P.Hom Q)
    (u : Aˣ) (hu : u ∈ rankOneUnits P) : Units.map f.toRingHom.toMonoidHom u ∈ rankOneUnits Q :=
  sorry

/-- `log_Δ u` reduces to the class of `u - 1` under `β : A{1} / I A{1} ≅ I / I ^ 2`, the
isomorphism `BKTwist.twistReduction` of PR.3. -/
theorem prismaticLog_mod (u : rankOneUnits P) :
    BKTwist.twistReduction P
        (Submodule.Quotient.mk (p := P.I • (⊤ : Submodule A (BKTwist.twist P)))
          (prismaticLog P (Additive.ofMul u))) =
      P.I.toCotangent ⟨(u : Aˣ) - 1, u.2.1⟩ := sorry

/-- The prismatic logarithm on Tate modules, `T_p((A / I)^×) ⟶ A{1}`. -/
noncomputable def tateLog : Additive (tateModule p P.bar) →+ BKTwist.twist P := sorry

-- pr4_prismatic_log_one
example : prismaticLog P 0 = 0 := sorry

-- pr4_prismatic_log_q_de_rham
example (Q : Prism p (PowerSeries ℤ_[p]))
    (hI : Q.I = Ideal.span {∑ i ∈ Finset.range p, (1 + PowerSeries.X : PowerSeries ℤ_[p]) ^ i})
    (hφ : Q.φ PowerSeries.X = (1 + PowerSeries.X) ^ p - 1) (q : rankOneUnits Q)
    (hq : ((q : (PowerSeries ℤ_[p])ˣ) : PowerSeries ℤ_[p]) = (1 + PowerSeries.X) ^ p) :
    ∃ e : BKTwist.twist Q, Function.Bijective (fun a : PowerSeries ℤ_[p] => a • e) ∧
      prismaticLog Q (Additive.ofMul q) = (PowerSeries.X : PowerSeries ℤ_[p]) • e :=
  sorry

-- pr4_prismatic_log_mul
example (u v : Additive (rankOneUnits P)) :
    prismaticLog P (u + v) = prismaticLog P u + prismaticLog P v ∧
      prismaticLog P (p • u) = p • prismaticLog P u := sorry

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
its quotient. Prisms are derived `(p, I)`-complete (DD.1), which `Prism` does not record: both
prisms are assumed classically `(p, I)`-adically complete (true for bounded prisms, node
`PR.0/bounded-prism-complete-flatness` (1)). -/
theorem existsUnique_hom_of_perfect {A : Type u} [CommRing A] (P : Prism p A) (hb : P.IsBounded)
    (hP : P.IsPerfect) [IsAdicComplete (Ideal.span {(p : A)} ⊔ P.I) A] (X : SiteObj p P.bar)
    [IsAdicComplete (Ideal.span {(p : X.A)} ⊔ X.prism.I) X.A] :
    Nonempty (Unique ((ofPrism P hb).Hom X)) := by
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
    [IsAdicComplete (Ideal.span {(p : A)} ⊔ P.I) A] (X : SiteObj p P.bar)
    [IsAdicComplete (Ideal.span {(p : X.A)} ⊔ X.prism.I) X.A] :
    Nonempty ((SiteObj.ofPrism P hb).Hom X) := by sorry

-- pr5_site_char_p_crystalline
example {R : Type u} [CommRing R] [CharP R p] (X : SiteObj p R)
    [IsAdicComplete (Ideal.span {(p : X.A)} ⊔ X.prism.I) X.A] : X.prism.IsCrystalline := by
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

/-- The complexes that the owner roadmaps construct (`CrystallineCohomology:CR.2` for
`crystalline`, `DerivedDeRhamCohomology:DD.2` for `derivedDeRham`, `hodgeFil`, `hodgeFilMap`,
`DerivedDeRhamCohomology:DD.0` for `cotangentPower`). The statements below are about this value,
never about an arbitrary element of `Imported`. -/
noncomputable def imported : Imported p := sorry

/-- Node `PR.5/absolute-crystalline-comparison` (Bhatt–Lurie, Theorem 4.6.1) for smooth
`𝔽_p`-algebras, against the crystalline cohomology `(imported p).crystalline R` of the owner;
the theorem holds for quasisyntomic `𝔽_p`-schemes (DD.5). -/
theorem crystalline_comparison (R : Type) [CommRing R] [Algebra (ZMod p) R]
    [Algebra.Smooth (ZMod p) R] : Nonempty (prismaticComplex p R ≅ (imported p).crystalline R) := by
  sorry

/-- Node `PR.5/absolute-de-rham-comparison` (Bhatt–Lurie, Proposition 5.4.8): the pullback of
`H_Δ(R)` to the de Rham point is the `p`-complete derived de Rham complex
`(imported p).derivedDeRham R` of the owner. -/
theorem deRhamPullback_prismaticSheaf (R : Type) [CommRing R] :
    Nonempty ((carriers p).deRhamPullback.obj (prismaticSheaf p R) ≅
      (imported p).derivedDeRham R) := by
  sorry

/-- Bhatt–Lurie, Theorem 5.4.2, for `p`-torsion-free `R` (so that `𝔽_p ⊗^L R = R / p`). -/
theorem deRham_comparison (R : Type) [CommRing R] (hR : ∀ x : R, (p : R) * x = 0 → x = 0) :
    Nonempty (prismaticComplex p (R ⧸ Ideal.span {(p : R)}) ≅ (imported p).derivedDeRham R) := by
  sorry

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
noncomputable def nygaardToHodge (R : Type) [CommRing R] (n m : ℤ) :
    nygaardFil p R n m ⟶ (imported p).hodgeFil R m := sorry

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
after Warning 5.5.17): `gr^m_N Δ_R ≅ LΩ̂^m_R[−m]` for `m < p`, `LΩ̂^m_R` being the derived exterior
power `(imported p).cotangentPower R m` of the owner. -/
theorem nygaardGr_iso_cotangentPower (R : Type) [CommRing R] (m : ℕ) (hm : m < p) :
    Nonempty (nygaardGr p R 0 m ≅ ((imported p).cotangentPower R m)⟦(-(m : ℤ))⟧) := by sorry

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
below; each docstring says which conditions are left out, and the `q`-PD envelope carries their
discrete shadows (`EnvelopeHypotheses`). The framed algebra with its automorphisms `γ_s` and
`q`-derivatives is owned by `QWittVectors:QW.6`. Crystalline cohomology and `AΩ` enter as the
specific values `CrystallineInput.ofAlgebra` and `AOmegaData.ofAlgebra`. -/

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

/-- The hypotheses of Lemma 16.10 on a δ-`D`-algebra `P` and a sequence `x`, in the form Mathlib
can state: `D → P` is a δ-map; `P` is classically `(p, [p]_q)`-adically complete; for every `n`,
`P / (p, [p]_q)^n` is flat over `D / (p, [p]_q)^n` (for a complete `P` this is
`(p, [p]_q)`-complete flatness over `D`); and `x` is regular relative to `D` modulo `(p, [p]_q)`
(`IsRelativelyRegular`, the discrete shadow of complete regularity relative to `D`, DD.1). -/
structure EnvelopeHypotheses {D P : Type u} [CommRing D] [CommRing P] [Algebra D P]
    (B : QPDPair p D) (dP : Delta.Structure p P) {r : ℕ} (x : Fin r → P) : Prop where
  /-- `D → P` is a map of δ-rings. -/
  isDeltaHom : IsDeltaHom p B.δ dP (algebraMap D P)
  /-- `P` is `(p, [p]_q)`-adically complete. -/
  complete : IsAdicComplete (Ideal.span {(p : P), algebraMap D P (pAnalog p B.q)}) P
  /-- Every reduction modulo `(p, [p]_q)^n` is flat. -/
  flat : ∀ n : ℕ, Module.Flat (D ⧸ Ideal.span {(p : D), pAnalog p B.q} ^ n)
    (TensorProduct D (D ⧸ Ideal.span {(p : D), pAnalog p B.q} ^ n) P)
  /-- `x` is regular relative to `D` modulo `(p, [p]_q)`. -/
  regular : IsRelativelyRegular (Ideal.span {(p : D), pAnalog p B.q}) (List.ofFn x)

/-- The ring `D_{J,q}(P)` for `J = (I, x_1, …, x_r)` (Lemma 16.10), under the hypotheses
`EnvelopeHypotheses` of the lemma (all the declarations of the node take them). -/
noncomputable def envelope {D P : Type u} [CommRing D] [CommRing P] [Algebra D P]
    (B : QPDPair p D) (dP : Delta.Structure p P) {r : ℕ} (x : Fin r → P)
    (hyp : EnvelopeHypotheses B dP x) : CommRingCat.{u} := sorry

/-- The canonical map `P → D_{J,q}(P)`. -/
noncomputable def envelopeMap {D P : Type u} [CommRing D] [CommRing P] [Algebra D P]
    (B : QPDPair p D) (dP : Delta.Structure p P) {r : ℕ} (x : Fin r → P)
    (hyp : EnvelopeHypotheses B dP x) :
    P →+* envelope B dP x hyp := sorry

/-- The `q`-PD pair `(D_{J,q}(P), K)`. -/
noncomputable def envelopePair {D P : Type u} [CommRing D] [CommRing P] [Algebra D P]
    (B : QPDPair p D) (dP : Delta.Structure p P) {r : ℕ} (x : Fin r → P)
    (hyp : EnvelopeHypotheses B dP x) :
    QPDPair p (envelope B dP x hyp) := sorry

theorem envelopeMap_delta {D P : Type u} [CommRing D] [CommRing P] [Algebra D P]
    (B : QPDPair p D) (dP : Delta.Structure p P) {r : ℕ} (x : Fin r → P)
    (hyp : EnvelopeHypotheses B dP x) :
    IsDeltaHom p dP (envelopePair B dP x hyp).δ (envelopeMap B dP x hyp) := by sorry

theorem envelope_frobenius_mem {D P : Type u} [CommRing D] [CommRing P] [Algebra D P]
    (B : QPDPair p D) (dP : Delta.Structure p P) {r : ℕ} (x : Fin r → P)
    (hyp : EnvelopeHypotheses B dP x) (i : Fin r) :
    (toFrobenius p (envelopePair B dP x hyp).δ).1 (envelopeMap B dP x hyp (x i)) ∈
      Ideal.span {pAnalog p (envelopePair B dP x hyp).q} := by sorry

theorem envelopeMap_mem {D P : Type u} [CommRing D] [CommRing P] [Algebra D P]
    (B : QPDPair p D) (dP : Delta.Structure p P) {r : ℕ} (x : Fin r → P)
    (hyp : EnvelopeHypotheses B dP x) :
    (B.I.map (algebraMap D P) ⊔ Ideal.span (Set.range x)).map (envelopeMap B dP x hyp) ≤
      (envelopePair B dP x hyp).I := by sorry

/-- `P/J ≅ D_{J,q}(P)/K`. -/
noncomputable def envelopeQuotientEquiv {D P : Type u} [CommRing D] [CommRing P] [Algebra D P]
    (B : QPDPair p D) (dP : Delta.Structure p P) {r : ℕ} (x : Fin r → P)
    (hyp : EnvelopeHypotheses B dP x) :
    (P ⧸ (B.I.map (algebraMap D P) ⊔ Ideal.span (Set.range x))) ≃+*
      (envelope B dP x hyp ⧸ (envelopePair B dP x hyp).I) := sorry

/-- The universal property: existence. -/
noncomputable def envelopeLift {D P : Type u} [CommRing D] [CommRing P] [Algebra D P]
    (B : QPDPair p D) (dP : Delta.Structure p P) {r : ℕ} (x : Fin r → P)
    (hyp : EnvelopeHypotheses B dP x)
    {E : Type u} [CommRing E] (Q : QPDPair p E) (g : P →+* E) (hδ : IsDeltaHom p dP Q.δ g)
    (hq : g (algebraMap D P B.q) = Q.q)
    (hJ : (B.I.map (algebraMap D P) ⊔ Ideal.span (Set.range x)).map g ≤ Q.I) :
    envelope B dP x hyp →+* E := sorry

theorem envelopeLift_comp {D P : Type u} [CommRing D] [CommRing P] [Algebra D P]
    (B : QPDPair p D) (dP : Delta.Structure p P) {r : ℕ} (x : Fin r → P)
    (hyp : EnvelopeHypotheses B dP x)
    {E : Type u} [CommRing E] (Q : QPDPair p E) (g : P →+* E) (hδ : IsDeltaHom p dP Q.δ g)
    (hq : g (algebraMap D P B.q) = Q.q)
    (hJ : (B.I.map (algebraMap D P) ⊔ Ideal.span (Set.range x)).map g ≤ Q.I) :
    (envelopeLift B dP x hyp Q g hδ hq hJ).comp (envelopeMap B dP x hyp) = g := by sorry

/-- The universal property: uniqueness. -/
theorem envelopeLift_unique {D P : Type u} [CommRing D] [CommRing P] [Algebra D P]
    (B : QPDPair p D) (dP : Delta.Structure p P) {r : ℕ} (x : Fin r → P)
    (hyp : EnvelopeHypotheses B dP x)
    {E : Type u} [CommRing E] (Q : QPDPair p E) (f g : envelope B dP x hyp →+* E)
    (hf : IsDeltaHom p (envelopePair B dP x hyp).δ Q.δ f)
    (hg : IsDeltaHom p (envelopePair B dP x hyp).δ Q.δ g)
    (h : f.comp (envelopeMap B dP x hyp) = g.comp (envelopeMap B dP x hyp)) : f = g := by sorry

-- pr6_envelope_empty_sequence
example {D : Type u} [CommRing D] (B : QPDPair p D)
    (hyp : EnvelopeHypotheses B B.δ (fun i : Fin 0 => i.elim0)) :
    Function.Bijective (envelopeMap B B.δ (fun i : Fin 0 => i.elim0) hyp) := by sorry

-- pr6_envelope_frobenius_divisible
example {D P : Type u} [CommRing D] [CommRing P] [Algebra D P]
    (B : QPDPair p D) (dP : Delta.Structure p P) (x : Fin 1 → P)
    (hyp : EnvelopeHypotheses B dP x) :
    ∃ z : envelope B dP x hyp,
      pAnalog p (envelopePair B dP x hyp).q * z =
          (toFrobenius p (envelopePair B dP x hyp).δ).1 (envelopeMap B dP x hyp (x 0)) ∧
        z - (envelopePair B dP x hyp).δ.delta (envelopeMap B dP x hyp (x 0)) ∈
          (envelopePair B dP x hyp).I := by
  sorry

-- pr6_envelope_universal_identity
example {D P : Type u} [CommRing D] [CommRing P] [Algebra D P]
    (B : QPDPair p D) (dP : Delta.Structure p P) {r : ℕ} (x : Fin r → P)
    (hyp : EnvelopeHypotheses B dP x)
    (f : envelope B dP x hyp →+* envelope B dP x hyp)
    (hf : IsDeltaHom p (envelopePair B dP x hyp).δ (envelopePair B dP x hyp).δ f)
    (h : f.comp (envelopeMap B dP x hyp) = envelopeMap B dP x hyp) : f = RingHom.id _ := by sorry

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

/-- The value of the imported data for an `D / I`-algebra `R`: the completed base change is
`completedBaseChange` along `D → D/(q-1)`, completed `p`-adically (owner
`DerivedDeRhamCohomology:DD.1`); `crystalline` is `RΓ_crys(R/(D/(q-1)))` relative to the δ-PD
pair `(D/(q-1), I/(q-1))` with its divided powers (node `PR.6/delta-pd-pairs`; owner
`CrystallineCohomology:CR.2`). -/
noncomputable def CrystallineInput.ofAlgebra {D : Type u} [CommRing D] (B : QPDPair p D)
    (R : Type u) [CommRing R] [Algebra (D ⧸ B.I) R] : CrystallineInput B where
  baseChange := completedBaseChange (Ideal.Quotient.mk (Ideal.span {B.q - 1}))
    (Ideal.span {(p : D ⧸ Ideal.span {B.q - 1})})
  crystalline := sorry

/-- Node `PR.6/q-crystalline-crystalline-comparison` (Theorem 16.14): for `R` `p`-completely
smooth over `D / I`, `qΩ_{R/D} ⊗̂^L_D D/(q-1) ≃ RΓ_crys(R/(D/(q-1)))`, against the completed base
change and the crystalline cohomology of `CrystallineInput.ofAlgebra B R`. -/
theorem qCrystalline_crystalline_comparison {D : Type u} [CommRing D] (B : QPDPair p D)
    (R : Type u) [CommRing R] [Algebra (D ⧸ B.I) R] (hR : Site.SmoothModP p (D ⧸ B.I) R) :
    Nonempty ((CrystallineInput.ofAlgebra B R).baseChange.obj (qCrystallineCohomology B R) ≅
      (CrystallineInput.ofAlgebra B R).crystalline) := by sorry

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
  /-- Morphisms are injective on coordinates (node `PR.6/framed-q-de-rham-complex` (b)): a map
  identifying two coordinates, such as a codegeneracy, induces no map of `q`-de Rham complexes. -/
  onCoord_injective : Function.Injective onCoord
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

/-- The complex `AΩ_R` of Bhatt–Morrow–Scholze of an `A / I`-algebra `R` with its Frobenius, the
value that `AInfCohomology:AI.3` constructs (for `A = A_inf(O_C)`, `q = [ε]`, `I = (ξ)` and `R`
`p`-completely smooth over `O_C`). The statements below are about this value, never about an
arbitrary element of `AOmegaData`. -/
noncomputable def AOmegaData.ofAlgebra {A : Type u} [CommRing A] (B : QPDPair p A) (R : Type u)
    [CommRing R] [Algebra (A ⧸ B.I) R] : AOmegaData B := sorry

/-- `μ_0 : D_{J_Σ,q}(P_Σ) → A_inf(R_{Σ,∞})`, from the universal property of the envelope. -/
noncomputable def coordinateMap {A : Type u} [CommRing A] {B : QPDPair p A}
    {R : Type u} [CommRing R] [Algebra (A ⧸ B.I) R] {P : Type u} [CommRing P] [Algebra A P]
    {S : Type} (F : FramedDatum p B R P S) (ch : Chart P S) : F.envelope →+* ch.AinfRinf := sorry

/-- `μ_0` extends the torus map. The universal property of the envelope applies because
`A_inf(R_{Σ,∞})` carries a `q`-PD pair `pair` to which the torus map is a map of δ-pairs:
`hδ`, `hq` and `hJ` record this (they are properties of the chart of `AInfCohomology:AI.4`;
without them no extension need exist). -/
theorem coordinateMap_comp {A : Type u} [CommRing A] {B : QPDPair p A}
    {R : Type u} [CommRing R] [Algebra (A ⧸ B.I) R] {P : Type u} [CommRing P] [Algebra A P]
    {S : Type} (F : FramedDatum p B R P S) (ch : Chart P S) (pair : QPDPair p ch.AinfRinf)
    (hδ : IsDeltaHom p F.framed.δ pair.δ ch.fromTorus)
    (hq : ch.fromTorus (algebraMap A P B.q) = pair.q)
    (hJ : (RingHom.ker F.toR).map ch.fromTorus ≤ pair.I) :
    (coordinateMap F ch).comp F.envelopeMap = ch.fromTorus := by sorry

/-- `μ_0` is equivariant for `γ_s` and `σ_s`, under the hypotheses of `coordinateMap_comp`. -/
theorem coordinateMap_gamma {A : Type u} [CommRing A] {B : QPDPair p A}
    {R : Type u} [CommRing R] [Algebra (A ⧸ B.I) R] {P : Type u} [CommRing P] [Algebra A P]
    {S : Type} (F : FramedDatum p B R P S) (ch : Chart P S) (pair : QPDPair p ch.AinfRinf)
    (hδ : IsDeltaHom p F.framed.δ pair.δ ch.fromTorus)
    (hq : ch.fromTorus (algebraMap A P B.q) = pair.q)
    (hJ : (RingHom.ker F.toR).map ch.fromTorus ≤ pair.I)
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
    (R : Type u) [CommRing R] [Algebra (A ⧸ B.I) R] :
    qCrystallineCohomology B R ⟶ (AOmegaData.ofAlgebra B R).AΩ := sorry

theorem comparisonMap_frobenius {A : Type u} [CommRing A] (B : QPDPair p A)
    (R : Type u) [CommRing R] [Algebra (A ⧸ B.I) R] :
    comparisonMap B R ≫ (AOmegaData.ofAlgebra B R).frobenius =
      qCrystallineFrobenius B R ≫ (frobeniusPushforward B.prism).map (comparisonMap B R) := by
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
    (R : Type u) [CommRing R] [Algebra (A ⧸ B.I) R] :
    comparisonMap B R ≫ (AOmegaData.ofAlgebra B R).frobenius =
      qCrystallineFrobenius B R ≫ (frobeniusPushforward B.prism).map (comparisonMap B R) := by
  sorry

-- pr6_mu_needs_decalage
example {E : Type*} [CommRing E] (σ : E ≃+* E) (q q' y : E) (hq : q' ^ p = q) (hσq : σ q' = q')
    (hy : σ y = q' * y) : (q - 1) * y = σ (pAnalog p q' * y) - pAnalog p q' * y := by sorry

/-! ### Named theorems of §§17–18 -/

/-- Node `PR.6/ainf-omega-comparison` (Theorem 17.2): `μ_R : qΩ_{R/A} → AΩ_R` is an isomorphism,
`AΩ_R` being the complex `AOmegaData.ofAlgebra B R` of the owner. Left out: `A` is `A_inf(O_C)`
with `q = [ε]` and `I = (ξ)`; recorded: `R` is `p`-completely smooth over `A / I = O_C`. -/
theorem ainfOmega_comparison {A : Type u} [CommRing A] (B : QPDPair p A)
    (R : Type u) [CommRing R] [Algebra (A ⧸ B.I) R] (hR : Site.SmoothModP p (A ⧸ B.I) R) :
    IsIso (comparisonMap B R) := by sorry

/-- Node `PR.6/ainf-omega-comparison` (Theorem 17.2): `AΩ_R ≅ φ_A^* Δ_{R/A}` for the perfect
prism `(A_inf, ker θ)`, whose ideal is the `q`-PD ideal `(ξ)`; `R` is an `A / (ξ)`-algebra, made
an algebra over `Pθ.bar` through `hI`. The `E_∞`-structure of Remark 17.3 needs
`E_∞`-algebras, which Mathlib lacks, and is left out. -/
theorem ainfOmega_prismatic_comparison {A : Type u} [CommRing A] (Pθ : Prism p A)
    (hperf : Pθ.IsPerfect) (B : QPDPair p A) (hδ : Pθ.δ = B.δ) (hI : Pθ.I = B.I)
    (R : Type u) [CommRing R] [Algebra (A ⧸ B.I) R] (hR : Site.SmoothModP p (A ⧸ B.I) R) :
    Nonempty ((AOmegaData.ofAlgebra B R).AΩ ≅ (frobeniusPullback Pθ hperf).obj
      (letI : Algebra Pθ.bar R :=
        ((algebraMap (A ⧸ B.I) R).comp (Ideal.quotEquivOfEq hI).toRingHom).toAlgebra
      prismaticCohomology Pθ R)) := by sorry

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
imported data (`SiteData`, `OKData`), whose docstrings name the owner of each field. A
`SiteData` is pinned by its fields (bounded, complete prisms, rigidity, `A[1/I]`), and the
diagram `A[1/I]^∧_p` with its Frobenius is constructed from it; statements about `O_K` concern
the value `OKData.ofRing p O`. -/

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
  /-- Initiality: there is exactly one `A`-algebra map to every `A`-algebra in which `I`
  generates the unit ideal. -/
  exists_unique_lift : ∀ (B : Type u) [CommRing B] [Algebra A B],
    I.map (algebraMap A B) = ⊤ → Nonempty (Unique (L →ₐ[A] B))

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
* `C`, `O`, `prism`, `bounded`, `complete`, `isDeltaHom`, `map_ideal`: the category of bounded
  prisms `(A, I)` over `X` with maps of prisms as arrows, and `O_Δ : (A, I) ↦ A`
  (owner `PrismaticCohomology:PR.5/absolute-prismatic-site`; `map_ideal` is rigidity, PR.0;
  `complete` is the classical `(p, I)`-adic completeness of bounded prisms,
  `PR.0/bounded-prism-complete-flatness` (1)).
* `Oinv`, `toInv`, `isAway`: the diagram `O_Δ[1/I_Δ] : (A, I) ↦ A[1/I]` (this stage).
The diagram `O_Δ[1/I_Δ]^∧_p : (A, I) ↦ LaurentRing p (A[1/I])` with its Frobenius is not data:
it is constructed from `Oinv` (`SiteData.Olaurent`, `SiteData.toLaurent`, `SiteData.laurentFrob`,
node `PR.7/laurent-f-crystal`). The flat topology is not recorded. -/
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
  /-- Every object is classically `(p, I)`-adically complete. -/
  complete : ∀ c, IsAdicComplete (Ideal.span {(p : O.obj c)} ⊔ (prism c).I) (O.obj c)
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

attribute [instance] SiteData.category

noncomputable instance SiteData.algebraInv (X : SiteData.{u} p) (c : X.C) :
    Algebra (X.O.obj c) (X.Oinv.obj c) := (X.toInv.app c).hom.toAlgebra

/-- Restriction of the site data along a functor, as for `Y_Δ → X_Δ` induced by `Y → X`. -/
noncomputable def SiteData.restrict (X : SiteData.{u} p) {D : Type (u + 1)} [Category.{u} D]
    (G : D ⥤ X.C) : SiteData.{u} p where
  C := D
  O := G ⋙ X.O
  prism d := X.prism (G.obj d)
  bounded d := X.bounded (G.obj d)
  complete d := X.complete (G.obj d)
  isDeltaHom f := X.isDeltaHom (G.map f)
  map_ideal f := X.map_ideal (G.map f)
  Oinv := G ⋙ X.Oinv
  toInv := Functor.whiskerLeft G X.toInv
  isAway d := X.isAway (G.obj d)

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

/-- The map of `p`-adic completions induced by a ring map, from the universal property of
`AdicCompletion` (`AdicCompletion.liftRingHom`). -/
noncomputable def laurentMap {L L' : Type u} [CommRing L] [CommRing L'] (f : L →+* L') :
    LaurentRing p L →+* LaurentRing p L' :=
  AdicCompletion.liftRingHom (Ideal.span {(p : L')})
    (fun n => (Ideal.quotientMap (Ideal.span {(p : L')} ^ n) f (by sorry)).comp
      (AdicCompletion.evalₐ (Ideal.span {(p : L)}) n).toRingHom)
    (by sorry)

/-- `O_Δ[1/I_Δ]^∧_p : (A, I) ↦ A[1/I]^∧_p`, the `p`-adic completion of `O_Δ[1/I_Δ]`. -/
noncomputable def SiteData.Olaurent (X : SiteData.{u} p) : X.C ⥤ CommRingCat.{u} where
  obj c := CommRingCat.of (LaurentRing p (X.Oinv.obj c))
  map f := CommRingCat.ofHom (laurentMap (X.Oinv.map f).hom)
  map_id _ := sorry
  map_comp _ _ := sorry

/-- The completion map `O_Δ[1/I_Δ] → O_Δ[1/I_Δ]^∧_p`. -/
noncomputable def SiteData.toLaurent (X : SiteData.{u} p) : X.Oinv ⟶ X.Olaurent where
  app c := CommRingCat.ofHom (algebraMap (X.Oinv.obj c) (LaurentRing p (X.Oinv.obj c)))
  naturality _ _ _ := sorry

/-- The Frobenius of `O_Δ[1/I_Δ]^∧_p`: on `(A, I)` it is `laurentFrobenius`, induced by `φ_A`. -/
noncomputable def SiteData.laurentFrob (X : SiteData.{u} p) : X.Olaurent ⟶ X.Olaurent where
  app c := CommRingCat.ofHom (laurentFrobenius (X.prism c) (X.Oinv.obj c))
  naturality _ _ _ := sorry

noncomputable instance SiteData.algebraLaurent (X : SiteData.{u} p) (c : X.C) :
    Algebra (X.O.obj c) (X.Olaurent.obj c) := ((X.toInv ≫ X.toLaurent).app c).hom.toAlgebra

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

-- pr7_laurent_char_p_zero (`A` classically `(p, I)`-complete, as every bounded prism is: then
-- `p ∈ I` forces `I = (p)` by `ideal_eq_span_p_of_mem`)
example {A : Type u} [CommRing A] (P : Prism p A) [IsAdicComplete (Ideal.span {(p : A)} ⊔ P.I) A]
    (L : Type u) [CommRing L] [Algebra A L]
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

section OKRing

/-! The statements on `O_K` below are about the value `OKData.ofRing p O` for `O = O_K`, never
about an arbitrary element of `OKData`. `O` is the ring of integers of a complete discretely
valued field `K` of mixed characteristic `(0, p)` with perfect residue field, in the form Mathlib
states it: a complete discrete valuation ring of characteristic `0` whose residue field is
perfect of characteristic `p`. -/

variable (O : Type u) [CommRing O] [IsDomain O] [IsDiscreteValuationRing O] [CharZero O]
  [IsAdicComplete (IsLocalRing.maximalIdeal O) O] [CharP (IsLocalRing.ResidueField O) p]
  [PerfectRing (IsLocalRing.ResidueField O) p]

variable (p) in
/-- The data of `OKData` attached to `O = O_K`: `G` is the absolute Galois group of
`K = Frac(O)` (Mathlib's `Field.absoluteGaloisGroup`); the site `Spf(O_K)_Δ`, the crystalline
lattices with their representations, the Breuil–Kisin prism of a uniformizer, the `A_inf`-prism
and the map between them, the weakly admissible filtered φ-modules with `D_crys`, and the period
diagrams are the values that the owners named in the docstring of `OKData` construct. -/
noncomputable def OKData.ofRing : OKData.{u} p where
  X := sorry
  G := Field.absoluteGaloisGroup (FractionRing O)
  RepCrys := sorry
  toRep := sorry
  bk := sorry
  ainf := sorry
  bkToAinf := sorry
  MF := sorry
  rankMF := sorry
  dcris := sorry
  Q := sorry
  categoryQ := sorry
  rational := sorry
  rationalRestrict := sorry

set_option hygiene false in
/-- `𝒟` abbreviates the value `OKData.ofRing p O` of the data attached to `O = O_K`. -/
local notation "𝒟" => OKData.ofRing p O

/-- For `X = Spf(O_K)`: the `G_K`-representation on the Frobenius-fixed points of the value of a
Laurent F-crystal on `A_inf` (node `PR.7/laurent-f-crystals-local-systems` (5)). -/
noncomputable def OKData.galoisRep (D : OKData.{u} p) (E : LaurentFCrystal D.X) :
    Rep.{u} (PadicInt p) D.G := sorry

/-- The action of `OKData.galoisRep` on morphisms. -/
noncomputable def OKData.galoisRepMap (D : OKData.{u} p) {E F : LaurentFCrystal D.X}
    (f : LaurentFCrystal.Hom E F) : D.galoisRep E ⟶ D.galoisRep F := sorry

/-- The Breuil–Kisin prism covers the final object. The `(p, I)`-complete faithful flatness of
`c ⟶ d` (DD.1) is not stated. -/
theorem OKData.bk_covers (c : (𝒟).X.C) :
    ∃ d : (𝒟).X.C, Nonempty (c ⟶ d) ∧ Nonempty ((𝒟).bk ⟶ d) := sorry

/-- The `A_inf`-prism covers the final object (same omission as in `bk_covers`). -/
theorem OKData.ainf_covers (c : (𝒟).X.C) :
    ∃ d : (𝒟).X.C, Nonempty (c ⟶ d) ∧ Nonempty ((𝒟).ainf ⟶ d) := sorry

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
example :
    ((𝒟).X.prism (𝒟).ainf).IsPerfect ∧ ((𝒟).X.prism (𝒟).ainf).IsOrientable := sorry

-- pr7_ok_bk_not_perfect
example : ¬ ((𝒟).X.prism (𝒟).bk).IsPerfect := sorry

-- pr7_ok_bk_orientable
example : ((𝒟).X.prism (𝒟).bk).IsOrientable := sorry

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

theorem OKData.filteredCrystal_rank (n : ℕ) (M : (𝒟).MF) (c : (𝒟).Q)
    (𝔭 : PrimeSpectrum (((𝒟).rational n).obj c)) :
    Module.rankAtStalk (((𝒟).filteredCrystal n M).M c) 𝔭 = (𝒟).rankMF M := sorry

theorem OKData.filteredCrystal_restrict (n : ℕ) (M : (𝒟).MF) :
    Nonempty (Crystal.Iso (Crystal.baseChange ((𝒟).rationalRestrict n)
      ((𝒟).filteredCrystal (n + 1) M)) ((𝒟).filteredCrystal n M)) := sorry

-- pr7_filtered_crystal_rank_zero
example (n : ℕ) (M : (𝒟).MF) (h : (𝒟).rankMF M = 0) (c : (𝒟).Q) :
    Subsingleton (((𝒟).filteredCrystal n M).M c) := sorry

-- pr7_filtered_crystal_finite_projective
example (D : OKData.{u} p) (n : ℕ) (M : D.MF) (c : D.Q) :
    Module.Finite ((D.rational n).obj c) ((D.filteredCrystal n M).M c) ∧
      Module.Projective ((D.rational n).obj c) ((D.filteredCrystal n M).M c) := sorry

-- pr7_filtered_crystal_twist
example (n : ℕ) (M : (𝒟).MF) (h : (𝒟).rankMF M = 1) (c : (𝒟).Q) :
    Module.Invertible (((𝒟).rational n).obj c) (((𝒟).filteredCrystal n M).M c) := sorry

-- pr7_filtered_crystal_not_integral
example (n : ℕ) (c : (𝒟).Q) : IsUnit (p : ((𝒟).rational n).obj c) := sorry

/-! ### The inverse functor and the main theorem (nodes `PR.7/crystalline-lattice-to-f-crystal`,
`PR.7/crystalline-lattices-theorem`) -/

/-- The prismatic F-crystal `𝔐(L)` of a crystalline lattice `L`. -/
noncomputable def OKData.latticeFCrystal (D : OKData.{u} p) (L : D.RepCrys) :
    PrismaticFCrystal D.X := sorry

theorem OKData.latticeFCrystal_realization (L : (𝒟).RepCrys) :
    Nonempty ((𝒟).galoisRep (etaleRealization (𝒟).X ((𝒟).latticeFCrystal L)) ≅ (𝒟).toRep L) :=
  sorry

/-- A prismatic F-crystal whose étale realisation is isomorphic to `L` is isomorphic to `𝔐(L)`:
there are mutually inverse morphisms `f` and `g`. -/
theorem OKData.latticeFCrystal_unique (L : (𝒟).RepCrys)
    (E : PrismaticFCrystal (𝒟).X)
    (h : Nonempty ((𝒟).galoisRep (etaleRealization (𝒟).X E) ≅ (𝒟).toRep L)) :
    ∃ (f : PrismaticFCrystal.Hom E ((𝒟).latticeFCrystal L))
      (g : PrismaticFCrystal.Hom ((𝒟).latticeFCrystal L) E),
      (∀ c x, g.toHom.app c (f.toHom.app c x) = x) ∧
        ∀ c x, f.toHom.app c (g.toHom.app c x) = x := sorry

-- pr7_lattice_rank
example (L : (𝒟).RepCrys) :
    Module.finrank ((𝒟).X.O.obj (𝒟).bk) (((𝒟).latticeFCrystal L).E.M (𝒟).bk) =
      Module.finrank (PadicInt p) ((𝒟).toRep L).V := sorry

-- pr7_lattice_twist
example (L : (𝒟).RepCrys) (n : ℤ)
    (h : Nonempty ((𝒟).toRep L ≅
      (𝒟).galoisRep (etaleRealization (𝒟).X (breuilKisinTwist (𝒟).X n)))) :
    ∃ (f : PrismaticFCrystal.Hom ((𝒟).latticeFCrystal L) (breuilKisinTwist (𝒟).X n))
      (g : PrismaticFCrystal.Hom (breuilKisinTwist (𝒟).X n) ((𝒟).latticeFCrystal L)),
      (∀ c x, g.toHom.app c (f.toHom.app c x) = x) ∧
        ∀ c x, f.toHom.app c (g.toHom.app c x) = x := sorry

-- pr7_lattice_hom
example (L L' : (𝒟).RepCrys) :
    Nonempty (PrismaticFCrystal.Hom ((𝒟).latticeFCrystal L) ((𝒟).latticeFCrystal L') ≃
      ((𝒟).toRep L ⟶ (𝒟).toRep L')) := sorry

-- pr7_lattice_not_all_representations
example : ¬ ∀ V : Rep.{u} (PadicInt p) (𝒟).G,
    ∃ E : PrismaticFCrystal (𝒟).X, Nonempty (V ≅ (𝒟).galoisRep (etaleRealization (𝒟).X E)) :=
  sorry

/-- Bhatt–Scholze, F-crystals, Proposition 5.3: the étale realisation of a prismatic F-crystal on
`Spf(O_K)` is a lattice in a crystalline representation. -/
theorem OKData.realization_isCrystalline (E : PrismaticFCrystal (𝒟).X) :
    ∃ L : (𝒟).RepCrys, Nonempty ((𝒟).toRep L ≅ (𝒟).galoisRep (etaleRealization (𝒟).X E)) :=
  sorry

/-- Bhatt–Scholze, F-crystals, Theorem 5.6, full faithfulness (node
`PR.7/etale-realization-fully-faithful`). -/
theorem OKData.etaleRealization_bijective (E F : PrismaticFCrystal (𝒟).X) :
    Function.Bijective
      (fun f : PrismaticFCrystal.Hom E F => (𝒟).galoisRepMap (etaleRealizationMap (𝒟).X f)) :=
  sorry

/-- Bhatt–Scholze, F-crystals, Theorem 5.6, essential surjectivity: with
`realization_isCrystalline` and `etaleRealization_bijective`, the étale realisation is an
equivalence onto crystalline lattices (node `PR.7/crystalline-lattices-theorem`). -/
theorem OKData.etaleRealization_essSurj (L : (𝒟).RepCrys) :
    ∃ E : PrismaticFCrystal (𝒟).X,
      Nonempty ((𝒟).galoisRep (etaleRealization (𝒟).X E) ≅ (𝒟).toRep L) := sorry

/-- Bhatt–Scholze, F-crystals, Theorem 7.9 (Kisin): evaluation of `𝔐(L)` at the Breuil–Kisin prism
is fully faithful (node `PR.7/breuil-kisin-evaluation`). -/
theorem OKData.breuilKisinEvaluation_bijective (L L' : (𝒟).RepCrys) :
    Function.Bijective
      (fun f : PrismaticFCrystal.Hom ((𝒟).latticeFCrystal L) ((𝒟).latticeFCrystal L') =>
        f.eval (𝒟).bk) := sorry

/-- Bhatt–Scholze, F-crystals, Remark 7.12 (Liu): the base change to `A_inf` of the Breuil–Kisin
module of `𝔐(L)` is its value on `A_inf`, for every Breuil–Kisin prism mapping to `A_inf`. -/
theorem OKData.breuilKisin_baseChange_ainf (D : OKData.{u} p) (L : D.RepCrys) :
    IsBaseChangeAlong (D.X.O.map D.bkToAinf).hom ((D.latticeFCrystal L).E.res D.bkToAinf) :=
  (D.latticeFCrystal L).E.isBaseChange D.bkToAinf

end OKRing

end TauCeti.Prismatic.FCrystal

namespace TauCeti.LogPrismatic

/-!
# Part PR.8: logarithmic prismatic cohomology

Rebased on PR.0. The earlier version of this file restated PR.0's integral addition correction
(`addCorrection`), δ-structures (`DeltaStructure`) and their Frobenius (`DeltaStructure.frob`)
in a local `section Delta`. These are now PR.0's `TauCeti.Delta.addCorrection`,
`TauCeti.Delta.Structure` and `(TauCeti.Delta.toFrobenius p d).1` (written `frob d` below);
none of the three removed names is a packet name. Prelog prisms are built on PR.0's
`TauCeti.Prismatic.Prism`, boundedness is `Prism.IsBounded` and perfectness `Prism.IsPerfect`;
log prismatic cohomology lives in `DerivedCategory (ModuleCat A)` like PR.0's
`TauCeti.Prismatic.prismaticCohomology`.

Conventions.
* Derived `(p, I)`-completeness of a prism is not a field of PR.0's `Prism` (it belongs to
  `DerivedDeRhamCohomology:DD.1`). Where the sources use its consequence that `p` lies in the
  Jacobson radical, that membership is an explicit hypothesis.
* The relative theory is stated over `IntegralBoundedPrelogPrism`: a bounded prelog prism whose
  monoid is integral (cancellative), the standing hypothesis of Koshikawa §§4–7 and
  Koshikawa–Yao.
* Affine prelog algebras over `(Ā, M_A)` are the explicit data `PrelogAlgebra B` (a ring `R` over
  `Ā = A / I`, a prelog structure `α_R : P → R` and a monoid map `M_A → P` compatible with the
  prelog structures).
* Objects that no library has are introduced as specific opaque placeholders (`sorry`-bodied
  definitions whose docstring names the owning node or roadmap stage). Theorems are statements
  about these specific objects. Conditions owned by another roadmap (Koshikawa smoothness,
  Cartier type, quasisyntomic, …) are never `Prop` placeholders: where a statement needs one, the
  objects satisfying it form a placeholder type owned by that roadmap.
* Packet items that are not typed are recorded in documentation comments with their packet
  statement and the reason.
-/

open CategoryTheory
open TauCeti.Prismatic (Prism prismaticCohomology hodgeTateCohomology frobeniusPushforward
  prismaticFrobenius)
open scoped BigOperators

attribute [local instance] HasDerivedCategory.standard

set_option linter.unusedVariables false
set_option linter.unusedSectionVars false

universe u v w

-- `ℤ_(p)` is Mathlib's localisation of `ℤ` at `(p)`; primality of `(p)` is the pinned
-- equivalence `Nat.prime_iff_prime_int`, as in PR.0.
local instance spanPrime_isPrime (p : ℕ) [Fact p.Prime] : (Ideal.span {(p : ℤ)}).IsPrime :=
  Ideal.isPrime_span_singleton_of_prime (Nat.prime_iff_prime_int.mp Fact.out)

/-- `ℤ_(p)`, Mathlib's localisation of `ℤ` at the prime ideal `(p)`. -/
abbrev ZLocal (p : ℕ) [Fact p.Prime] : Type := Localization.AtPrime (Ideal.span {(p : ℤ)})

/-- The additive monoid `ℕ[1/p] ⊂ ℚ_{≥0}` generated by the `1/p^k`, written multiplicatively. -/
abbrev NatInvP (p : ℕ) : Type :=
  Multiplicative (AddSubmonoid.closure (Set.range fun k : ℕ => ((p : ℚ) ^ k)⁻¹))

section Core

variable {p : ℕ} [Fact p.Prime]

/-- The Frobenius lift `φ(x) = x ^ p + p δ(x)` of a PR.0 δ-structure, as a function: PR.0's
`(TauCeti.Delta.toFrobenius p d).1`. It replaces the earlier local `DeltaStructure.frob`. -/
noncomputable abbrev frob {A : Type*} [CommRing A] (d : TauCeti.Delta.Structure p A) : A → A :=
  ⇑(TauCeti.Delta.toFrobenius p d).1

/-- The δ-structure of `ℤ_(p)`: `δ(x) = (x - x ^ p) / p`. It is PR.0's
`TauCeti.Delta.intAtPrime` (node `PR.0/p-local-integer-delta`). -/
noncomputable abbrev zLocalDelta (p : ℕ) [Fact p.Prime] : TauCeti.Delta.Structure p (ZLocal p) :=
  TauCeti.Delta.intAtPrime p

/-- The defining identity of `zLocalDelta` (PR.0 `intAtPrime_spec`). -/
theorem zLocalDelta_spec (x : ZLocal p) :
    (p : ZLocal p) * (zLocalDelta p).delta x = x - x ^ p := by
  sorry

/-- `ℤ_(p)` is `p`-torsion free, so its δ-structure is unique. -/
theorem zLocalDelta_unique (d : TauCeti.Delta.Structure p (ZLocal p)) : d = zLocalDelta p := by
  sorry

/-- The unit `1 + p` of `ℤ_(p)`. -/
noncomputable def onePlusP (p : ℕ) [Fact p.Prime] : (ZLocal p)ˣ :=
  (show IsUnit (algebraMap ℤ (ZLocal p) (1 + p)) from sorry).unit

end Core


/-! ## Node `PR.8/delta-log-ring` (definition): δ_log-rings -/

/-- **Node `PR.8/delta-log-ring`** (definition): δ_log-rings.

Fix a prime p. A δ_log-ring is a tuple (A, δ, α: M → A, δ_log: M → A) where (A, δ) is a δ-ring (a
Z_(p)-algebra with a p-derivation), (A, α) is a prelog ring (M a commutative monoid, α a map to the
multiplicative monoid of A), and δ_log: M → A is a map of sets satisfying (1) δ_log(e) = 0 for the
unit e of M; (2) α(m)^p·δ_log(m) = δ(α(m)) for every m ∈ M; (3) δ_log(mm′) = δ_log(m) + δ_log(m′) +
p·δ_log(m)·δ_log(m′) for all m, m′ ∈ M. A morphism (A, M) → (B, N) of δ_log-rings is a morphism of
prelog rings (a ring map f and a monoid map h with α_N∘h = f∘α_M) commuting with δ and with δ_log
(δ_log∘h = f∘δ_log). A δ_log-ring is of rank 1 if δ_log = 0. Equivalently (Remark 2.5) a
δ_log-structure is a monoid map w_log: M → W_2(A), m ↦ (1, δ_log(m)), with w(α(m)) = (α(m),
0)·w_log(m) for the δ-section w(x) = (x, δ(x)).

Hypotheses (packet): p is a fixed prime; all rings are Z_(p)-algebras (Koshikawa's standing
convention in §2). M is an arbitrary commutative monoid (written multiplicatively); no integrality
is imposed in the definition. The δ-ring axioms are those of PR.0, imported, not restated.

Lean form: the δ-structure is PR.0's `TauCeti.Delta.Structure`; the prelog structure is a monoid map
to the multiplicative monoid. -/
structure DeltaLogRing (p : ℕ) [Fact p.Prime] (A : Type u) (M : Type v) [CommRing A]
    [CommMonoid M] where
  /-- API `DeltaLogRing.mk` (constructor; node `PR.8/delta-log-ring`): From a δ-structure δ on A, a
  prelog structure α: M → A and δ_log: M → A satisfying (1)–(3), a δ_log-ring. -/
  mk ::
  /-- The δ-structure of `A` (PR.0). -/
  delta : TauCeti.Delta.Structure p A
  /-- The prelog structure `α : M → A`. -/
  α : M →* A
  /-- The map of sets `δ_log : M → A`. -/
  deltaLog : M → A
  deltaLog_one : deltaLog 1 = 0
  alpha_pow_mul_deltaLog : ∀ m, α m ^ p * deltaLog m = delta.delta (α m)
  deltaLog_mul : ∀ m m', deltaLog (m * m') =
    deltaLog m + deltaLog m' + (p : A) * deltaLog m * deltaLog m'

namespace DeltaLogRing

variable {p : ℕ} [Fact p.Prime] {A : Type u} {M : Type v} [CommRing A] [CommMonoid M]

/-- API `DeltaLogRing.ext` (extensionality; node `PR.8/delta-log-ring`): Two δ_log-ring structures
on fixed A and M are equal if their δ-structures, prelog maps α, and maps δ_log are equal. -/
theorem ext (D E : DeltaLogRing p A M) (hδ : D.delta = E.delta)
    (hα : D.α = E.α) (hlog : D.deltaLog = E.deltaLog) : D = E := by
  sorry

/-- API `DeltaLogRing.frobenius_alpha` (relation; node `PR.8/delta-log-ring`): φ(α(m)) = α(m)^p·(1 +
p·δ_log(m)) for every m ∈ M, where φ(x) = x^p + pδ(x). -/
theorem frobenius_alpha (D : DeltaLogRing p A M) (m : M) :
    frob D.delta (D.α m) = D.α m ^ p * (1 + (p : A) * D.deltaLog m) := by
  sorry

/-- The unit factor `m ↦ 1 + p δ_log(m)`, a monoid map `M →* A` (API `DeltaLogRing.unitFactor_mul`). -/
def unitFactor (D : DeltaLogRing p A M) : M →* A where
  toFun m := 1 + (p : A) * D.deltaLog m
  map_one' := by sorry
  map_mul' := by sorry

/-- API `DeltaLogRing.unitFactor_mul` (relation; node `PR.8/delta-log-ring`): The map m ↦ 1 +
p·δ_log(m) is a monoid map M → (A, ·). -/
theorem unitFactor_mul (D : DeltaLogRing p A M) (m m' : M) :
    1 + (p : A) * D.deltaLog (m * m') =
      (1 + (p : A) * D.deltaLog m) * (1 + (p : A) * D.deltaLog m') := by
  sorry

/-- API `DeltaLogRing.frobenius_iterate_alpha` (relation; node `PR.8/delta-log-ring`): φ^n(α(m)) ∈
α(m)^{p^n}·(1 + pA) for all n ≥ 0. -/
theorem frobenius_iterate_alpha (D : DeltaLogRing p A M) (m : M) (n : ℕ) :
    ∃ a : A, (frob D.delta)^[n] (D.α m) = D.α m ^ (p ^ n) * (1 + (p : A) * a) := by
  sorry

/-- API `DeltaLogRing.deltaLog_unique_of_nonZeroDivisor` (extensionality; node
`PR.8/delta-log-ring`): If α(M) ⊂ A consists of nonzerodivisors, two δ_log-structures on (A, δ, α)
coincide. -/
theorem deltaLog_unique_of_nonZeroDivisor (D E : DeltaLogRing p A M) (hδ : D.delta = E.delta)
    (hα : D.α = E.α) (h : ∀ m, D.α m ∈ nonZeroDivisors A) : D.deltaLog = E.deltaLog := by
  sorry

/-- API `DeltaLogRing.exists_iff_dvd` (characterisation; node `PR.8/delta-log-ring`): If α(M)
consists of nonzerodivisors, a δ_log-structure exists iff α(m)^p divides δ(α(m)) for every m. -/
theorem exists_iff_dvd (δ : TauCeti.Delta.Structure p A) (α : M →* A)
    (h : ∀ m, α m ∈ nonZeroDivisors A) :
    (∃ D : DeltaLogRing p A M, D.delta = δ ∧ D.α = α) ↔ ∀ m, α m ^ p ∣ δ.delta (α m) := by
  sorry

/-- API `DeltaLogRing.equivWittSection` (equivalence; node `PR.8/delta-log-ring`): δ_log-structures
on (A, δ, α) correspond bijectively to monoid maps w_log: M → W_2(A) of the form m ↦ (1, δ_log(m))
with w(α(m)) = (α(m), 0)·w_log(m).

Lean form: `w` is PR.0's δ-section `TauCeti.Delta.wittSectionEquiv p δ` and `W_2(A)` is Mathlib's
`TruncatedWittVector p 2 A`. -/
noncomputable def equivWittSection (δ : TauCeti.Delta.Structure p A) (α : M →* A) :
    {D : DeltaLogRing p A M // D.delta = δ ∧ D.α = α} ≃
      {w : M →* TruncatedWittVector p 2 A //
        (∀ m, (w m).coeff 0 = 1) ∧
        ∀ m, (TauCeti.Delta.wittSectionEquiv p δ).1 (α m) =
          TruncatedWittVector.mk p (fun i : Fin 2 => if i = 0 then α m else 0) * w m} :=
  sorry

/-- The equivalence `equivWittSection` sends `D` to `m ↦ (1, δ_log(m))`. -/
theorem equivWittSection_apply (δ : TauCeti.Delta.Structure p A) (α : M →* A)
    (D : {D : DeltaLogRing p A M // D.delta = δ ∧ D.α = α}) (m : M) :
    (equivWittSection δ α D).1 m =
      TruncatedWittVector.mk p (fun i : Fin 2 => if i = 0 then 1 else D.1.deltaLog m) := by
  sorry

/-- API `DeltaLogRing.Hom` (structure; node `PR.8/delta-log-ring`): Morphisms of δ_log-rings: prelog
ring maps commuting with δ and δ_log; identity and composition. -/
structure Hom {B : Type w} {N : Type*} [CommRing B] [CommMonoid N]
    (D : DeltaLogRing p A M) (E : DeltaLogRing p B N) where
  /-- The ring map. -/
  ring : A →+* B
  /-- The monoid map. -/
  monoid : M →* N
  comm_alpha : ∀ m, E.α (monoid m) = ring (D.α m)
  comm_delta : ∀ x, E.delta.delta (ring x) = ring (D.delta.delta x)
  comm_deltaLog : ∀ m, E.deltaLog (monoid m) = ring (D.deltaLog m)

/-- Identity morphism (part of API `DeltaLogRing.Hom`). -/
def Hom.id (D : DeltaLogRing p A M) : Hom D D where
  ring := RingHom.id A
  monoid := MonoidHom.id M
  comm_alpha _ := rfl
  comm_delta _ := rfl
  comm_deltaLog _ := rfl

/-- Composition (part of API `DeltaLogRing.Hom`). -/
def Hom.comp {B C : Type*} {N P : Type*} [CommRing B] [CommRing C] [CommMonoid N]
    [CommMonoid P] {D : DeltaLogRing p A M} {E : DeltaLogRing p B N} {F : DeltaLogRing p C P}
    (g : Hom E F) (f : Hom D E) : Hom D F where
  ring := g.ring.comp f.ring
  monoid := g.monoid.comp f.monoid
  comm_alpha _ := by sorry
  comm_delta _ := by sorry
  comm_deltaLog _ := by sorry

/-- API `DeltaLogRing.Hom.ext` (extensionality; node `PR.8/delta-log-ring`): Two morphisms of
δ_log-rings are equal if their underlying ring maps and monoid maps are equal. -/
theorem Hom.ext {B N : Type*} [CommRing B] [CommMonoid N]
    {D : DeltaLogRing p A M} {E : DeltaLogRing p B N} (f g : Hom D E)
    (hr : f.ring = g.ring) (hm : f.monoid = g.monoid) : f = g := by
  sorry

/-- API `DeltaLogRing.IsRankOne` (other; node `PR.8/delta-log-ring`): The predicate δ_log = 0;
rank-1 δ_log-rings satisfy φ(α(m)) = α(m)^p. -/
def IsRankOne (D : DeltaLogRing p A M) : Prop :=
  ∀ m, D.deltaLog m = 0

/-- Rank-one δ_log-rings satisfy `φ(α(m)) = α(m) ^ p` (second half of API `DeltaLogRing.IsRankOne`). -/
theorem IsRankOne.frobenius_alpha {D : DeltaLogRing p A M} (h : D.IsRankOne) (m : M) :
    frob D.delta (D.α m) = D.α m ^ p := by
  sorry

/-- API `DeltaLogRing.trivialLog` (example; node `PR.8/delta-log-ring`): On any δ-ring A the units
A^× ⊂ A carry the unique δ_log-structure δ_log(x) = δ(x)·x^{-p}. -/
noncomputable def trivialLog (δ : TauCeti.Delta.Structure p A) : DeltaLogRing p A Aˣ where
  delta := δ
  α := Units.coeHom A
  deltaLog u := δ.delta u * ((u⁻¹ : Aˣ) : A) ^ p
  deltaLog_one := by sorry
  alpha_pow_mul_deltaLog := by sorry
  deltaLog_mul := by sorry

/-- Uniqueness in API `DeltaLogRing.trivialLog`: the units carry exactly one δ_log-structure over
a given δ-structure. -/
theorem trivialLog_unique (D : DeltaLogRing p A Aˣ) (hα : D.α = Units.coeHom A) :
    D = trivialLog D.delta := by
  sorry

/-- The δ-structure on a monoid algebra `R[M]` over a δ-ring `R` with `δ(m) = 0` on monoid
elements, so that `φ(m) = m ^ p` (the tensor product of `R` with the `p`-torsion-free δ-ring
`ℤ[M]`; K1 Example 2.4(3)). -/
noncomputable def monoidAlgebraDelta (R : Type*) [CommRing R] (δR : TauCeti.Delta.Structure p R)
    (N : Type*) [CommMonoid N] : TauCeti.Delta.Structure p (MonoidAlgebra R N) :=
  sorry

theorem monoidAlgebraDelta_of (R : Type*) [CommRing R] (δR : TauCeti.Delta.Structure p R)
    (N : Type*) [CommMonoid N] (n : N) :
    (monoidAlgebraDelta R δR N).delta (MonoidAlgebra.of R N n) = 0 := by
  sorry

theorem monoidAlgebraDelta_single_one (R : Type*) [CommRing R]
    (δR : TauCeti.Delta.Structure p R) (N : Type*) [CommMonoid N] (r : R) :
    (monoidAlgebraDelta R δR N).delta (MonoidAlgebra.single 1 r) =
      MonoidAlgebra.single 1 (δR.delta r) := by
  sorry

/-- API `DeltaLogRing.monoidAlgebra` (example; node `PR.8/delta-log-ring`): (Z_(p)[M], M) with the
δ-structure whose Frobenius is m ↦ m^p is a δ_log-ring of rank 1.

Lean form: over any δ-ring `R` (the packet's `R = ℤ_(p)` is `monoidAlgebra (zLocalDelta p) N`), with
the δ-structure `monoidAlgebraDelta`. -/
noncomputable def monoidAlgebra {R : Type*} [CommRing R] (δR : TauCeti.Delta.Structure p R)
    (N : Type*) [CommMonoid N] : DeltaLogRing p (MonoidAlgebra R N) N where
  delta := monoidAlgebraDelta R δR N
  α := MonoidAlgebra.of R N
  deltaLog _ := 0
  deltaLog_one := rfl
  alpha_pow_mul_deltaLog := by sorry
  deltaLog_mul := by sorry

/-- API `DeltaLogRing.baseChange` (functoriality; node `PR.8/delta-log-ring`): For a δ_log-ring (A,
M) and a δ-ring map A → B, (B, M) with the composite α and δ_log is a δ_log-ring (K1 Example
2.4(4)). -/
def baseChange (D : DeltaLogRing p A M) {B : Type*} [CommRing B]
    (δB : TauCeti.Delta.Structure p B) (f : A →+* B)
    (hf : ∀ x, δB.delta (f x) = f (D.delta.delta x)) : DeltaLogRing p B M where
  delta := δB
  α := f.toMonoidHom.comp D.α
  deltaLog m := f (D.deltaLog m)
  deltaLog_one := by sorry
  alpha_pow_mul_deltaLog := by sorry
  deltaLog_mul := by sorry

/-- Unit test `DeltaLogRing.trivialLog_deltaLog` (computation; node `PR.8/delta-log-ring`): On Z_(p)
with its unique δ-structure and the trivial log structure Z_(p)^×, δ_log(1 + p) = δ(1 + p)/(1 + p)^p
with δ(1+p) = (1 + p − (1 + p)^p)/p.

Lean form: in `ℤ_(p)` with its δ-structure `zLocalDelta p`; `(1 + p) ^ p` is a unit, so the first
identity computes `δ_log(1 + p)`, and the integer division is exact. -/
theorem trivialLog_deltaLog :
    (trivialLog (zLocalDelta p)).deltaLog (onePlusP p) *
        algebraMap ℤ (ZLocal p) ((1 + p) ^ p) =
      algebraMap ℤ (ZLocal p) (((1 : ℤ) + p - (1 + p) ^ p) / p) ∧
    (zLocalDelta p).delta (algebraMap ℤ (ZLocal p) (1 + p)) =
      algebraMap ℤ (ZLocal p) (((1 : ℤ) + p - (1 + p) ^ p) / p) := by
  sorry

/-- Unit test `DeltaLogRing.zero_monoid` (degenerate; node `PR.8/delta-log-ring`): With M the
trivial monoid {e}, δ_log-structures on (A, δ, α) are unique (δ_log(e) = 0) and every δ-ring is a
δ_log-ring of rank 1. -/
theorem zero_monoid :
    (∀ D E : DeltaLogRing p A PUnit, D.delta = E.delta → D.α = E.α → D = E) ∧
      ∀ δ : TauCeti.Delta.Structure p A,
        ∃ D : DeltaLogRing p A PUnit, D.delta = δ ∧ D.IsRankOne := by
  sorry

/-- Unit test `DeltaLogRing.monoidAlgebra_rankOne` (compatibility; node `PR.8/delta-log-ring`): On
Z_(p)[N] = Z_(p)[x] with α(1) = x and φ(x) = x^p, δ_log(1) = 0 and δ(x) = 0, agreeing with PR.0's
δ-structure of the monoid algebra.

Lean form: `ℤ_(p)[ℕ]` is `MonoidAlgebra (ZLocal p) (Multiplicative ℕ)` with the δ-structure of
`monoidAlgebra (zLocalDelta p)`; `x` is the generator `ofAdd 1`. -/
theorem monoidAlgebra_rankOne :
    let D := monoidAlgebra (zLocalDelta p) (Multiplicative ℕ)
    let x := MonoidAlgebra.of (ZLocal p) (Multiplicative ℕ) (Multiplicative.ofAdd 1)
    D.α (Multiplicative.ofAdd 1) = x ∧ D.deltaLog (Multiplicative.ofAdd 1) = 0 ∧
      D.delta.delta x = 0 ∧ frob D.delta x = x ^ p := by
  sorry

/-- Unit test `DeltaLogRing.not_any_map` (non-example; node `PR.8/delta-log-ring`): On Z_(p)[x] with
δ(x) = 1 (φ(x) = x^p + p) and α(1) = x, there is no δ_log-structure, since x^p does not divide δ(x)
= 1: a δ_log-structure is not determined by an arbitrary choice of δ_log values.

Lean form: over `ℤ_(p)[x]` (Mathlib `Polynomial (ZLocal p)`) with any δ-structure satisfying `δ(x) =
1`. -/
theorem not_any_map (δ : TauCeti.Delta.Structure p (Polynomial (ZLocal p)))
    (hX : δ.delta Polynomial.X = 1) :
    ¬ ∃ D : DeltaLogRing p (Polynomial (ZLocal p)) (Multiplicative ℕ),
      D.delta = δ ∧ D.α (Multiplicative.ofAdd 1) = Polynomial.X := by
  sorry

end DeltaLogRing


namespace DeltaLogRing

variable {p : ℕ} [Fact p.Prime] {A : Type u} {M : Type v} [CommRing A] [CommMonoid M]

/-! ## Node `PR.8/delta-log-frobenius` (construction): The monoid Frobenius of a δ_log log ring -/

/-- A prelog structure is a log structure on the ring: `α⁻¹(Aˣ) ≅ Aˣ` (CR.5's notion, stated
here for rings only). -/
def IsLogRing (α : M →* A) : Prop :=
  ∀ a : Aˣ, ∃! m : M, α m = a

/-- **Node `PR.8/delta-log-frobenius`** (construction): The monoid Frobenius of a δ_log log ring.

Let (A, α: M → A, δ_log) be a δ_log-ring such that (A, M) is a log ring (α^{-1}(A^×) ≅ A^×) and p
lies in the Jacobson radical of A. Then 1 + pδ_log(m) ∈ A^× for all m, and φ_M(m) := m^p·α^{-1}(1 +
pδ_log(m)) defines a monoid endomorphism of M with α∘φ_M = φ_A∘α, so (φ_A, φ_M) is an endomorphism
of the log ring (A, M). If the δ_log-ring is of rank 1 the p-th power map of M lifts φ_A for any
prelog ring.

Hypotheses (packet): (A, M) is a log ring; p ∈ rad(A) (for instance A classically p-complete). For
rank-1 δ_log-rings no log-ring hypothesis is needed.

Lean form of the first assertion (`1 + p δ_log(m)` is a unit); the monoid endomorphism is
`frobeniusMonoid` and its compatibility `alpha_frobeniusMonoid`; the rank-one case is
`frobeniusMonoidOfRankOne`. -/
theorem unitFactor_isUnit (D : DeltaLogRing p A M) (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A))
    (m : M) : IsUnit (1 + (p : A) * D.deltaLog m) := by
  sorry

/-- API `DeltaLogRing.frobeniusMonoid` (constructor; node `PR.8/delta-log-frobenius`): For a δ_log
log ring with p ∈ rad(A), the monoid endomorphism φ_M(m) = m^p·α^{-1}(1 + pδ_log(m)). -/
noncomputable def frobeniusMonoid (D : DeltaLogRing p A M) (hlog : IsLogRing D.α)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) : M →* M := by
  sorry

/-- The defining formula `φ_M(m) = m ^ p · α⁻¹(1 + p δ_log(m))` of `frobeniusMonoid`. -/
theorem frobeniusMonoid_spec (D : DeltaLogRing p A M) (hlog : IsLogRing D.α)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) (m : M) :
    ∃ u : M, D.α u = 1 + (p : A) * D.deltaLog m ∧ D.frobeniusMonoid hlog hp m = m ^ p * u := by
  sorry

/-- API `DeltaLogRing.alpha_frobeniusMonoid` (simp; node `PR.8/delta-log-frobenius`): α(φ_M(m)) =
φ_A(α(m)). -/
theorem alpha_frobeniusMonoid (D : DeltaLogRing p A M) (hlog : IsLogRing D.α)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) (m : M) :
    D.α (D.frobeniusMonoid hlog hp m) = frob D.delta (D.α m) := by
  sorry

/-- API `DeltaLogRing.frobeniusMonoid_eq_pow_of_rankOne` (simp; node `PR.8/delta-log-frobenius`): If
δ_log = 0 then φ_M(m) = m^p. -/
theorem frobeniusMonoid_eq_pow_of_rankOne (D : DeltaLogRing p A M) (hlog : IsLogRing D.α)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) (h : D.IsRankOne) (m : M) :
    D.frobeniusMonoid hlog hp m = m ^ p := by
  sorry

/-- API `DeltaLogRing.frobeniusMonoid_units` (compatibility; node `PR.8/delta-log-frobenius`): On
M^× = A^× the map φ_M is the restriction of φ_A. -/
theorem frobeniusMonoid_units (D : DeltaLogRing p A M) (hlog : IsLogRing D.α)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) (u : Mˣ) :
    IsUnit (D.frobeniusMonoid hlog hp u) ∧
      D.α (D.frobeniusMonoid hlog hp u) = frob D.delta (D.α u) := by
  sorry

/-- API `DeltaLogRing.frobeniusMonoid_natural` (functoriality; node `PR.8/delta-log-frobenius`): A
morphism of δ_log log rings commutes with φ_M. -/
theorem frobeniusMonoid_natural {B : Type w} {N : Type*} [CommRing B] [CommMonoid N]
    (D : DeltaLogRing p A M) (E : DeltaLogRing p B N) (f : Hom D E)
    (hD : IsLogRing D.α) (hE : IsLogRing E.α)
    (hpA : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) (hpB : (p : B) ∈ Ideal.jacobson (⊥ : Ideal B))
    (m : M) : f.monoid (D.frobeniusMonoid hD hpA m) = E.frobeniusMonoid hE hpB (f.monoid m) := by
  sorry

/-- The monoid Frobenius of a rank-one δ_log-ring, for any prelog ring: the `p`-th power map
(last sentence of node `PR.8/delta-log-frobenius`). -/
def frobeniusMonoidOfRankOne (D : DeltaLogRing p A M) (h : D.IsRankOne) : M →* M :=
  powMonoidHom p

/-- In rank one the `p`-th power map of `M` lifts `φ_A`. -/
theorem alpha_frobeniusMonoidOfRankOne (D : DeltaLogRing p A M) (h : D.IsRankOne) (m : M) :
    D.α (D.frobeniusMonoidOfRankOne h m) = frob D.delta (D.α m) := by
  sorry

/-- Unit test `DeltaLogRing.frobeniusMonoid_bk` (computation; node `PR.8/delta-log-frobenius`): For
(Z_p[[u]], N, 1 ↦ u) with δ_log = 0, φ_M(n) = p·n in additive notation for N.

Lean form: for every rank-one δ_log-structure on `(ℤ_p⟦u⟧, ℕ)`, `n ↦ uⁿ` (Mathlib `PowerSeries
ℤ_[p]`, `Multiplicative ℕ`), the monoid Frobenius sends `n` to `p·n` and lifts `φ`, and `φ(u) =
u^p`. -/
theorem frobeniusMonoid_bk (D : DeltaLogRing p (PowerSeries ℤ_[p]) (Multiplicative ℕ))
    (hα : ∀ n, D.α (Multiplicative.ofAdd n) = PowerSeries.X ^ n) (h : D.IsRankOne) (n : ℕ) :
    D.frobeniusMonoidOfRankOne h (Multiplicative.ofAdd n) = Multiplicative.ofAdd (p * n) ∧
      frob D.delta PowerSeries.X = PowerSeries.X ^ p ∧
      D.α (D.frobeniusMonoidOfRankOne h (Multiplicative.ofAdd n)) =
        frob D.delta (D.α (Multiplicative.ofAdd n)) := by
  sorry

/-- Unit test `DeltaLogRing.frobeniusMonoid_trivial` (degenerate; node `PR.8/delta-log-frobenius`):
For the trivial log structure A^× → A, φ_M(x) = φ_A(x) for every unit x. -/
theorem frobeniusMonoid_trivial (δ : TauCeti.Delta.Structure p A)
    (hlog : IsLogRing (trivialLog δ).α) (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) (u : Aˣ) :
    (((trivialLog δ).frobeniusMonoid hlog hp u : Aˣ) : A) = frob δ u := by
  sorry

/-- Unit test `DeltaLogRing.frobeniusMonoid_not_pow` (non-example; node `PR.8/delta-log-frobenius`):
In the log ring associated with the p-completed free δ_log-ring (Z_p⟨x, y_0, y_1, …⟩, x^N) (δ_log(x)
= y_0), φ_M(x) = x^p·(1 + p·y_0) with 1 + p·y_0 ≠ 1 a unit, so φ_M is not the p-th power map of the
monoid.

Lean form: the general statement behind the test: if `δ_log(m) ≠ 0` and `α(m)`, `p` are
nonzerodivisors then `φ_M(m) ≠ m ^ p`; the packet's instance is the log ring of the completed free
δ_log-ring, whose completion and associated log structure are not typed. -/
theorem frobeniusMonoid_not_pow (D : DeltaLogRing p A M) (hlog : IsLogRing D.α)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) (m : M) (hm : D.deltaLog m ≠ 0)
    (hα : D.α m ∈ nonZeroDivisors A) (hp' : (p : A) ∈ nonZeroDivisors A) :
    D.frobeniusMonoid hlog hp m ≠ m ^ p := by
  sorry

end DeltaLogRing

/-! ## Node `PR.8/delta-log-free` (construction): Limits, colimits and free δ_log-rings -/

namespace DeltaLogRing

variable {p : ℕ} [Fact p.Prime] {A : Type u} {M : Type u} [CommRing A] [CommMonoid M]

/-- Placeholder carrier (node `PR.8/delta-log-free`): the ring `A{N}_δlog` of the free δ_log-ring
on the prelog ring `(A[N], M_A ⊕ N)` over a δ_log-ring `(A, M_A)` (K1 Remark 2.6, built from
PR.0's free δ-rings). -/
def FreeOnMonoid (D : DeltaLogRing p A M) (N : Type u) [CommMonoid N] : Type u := sorry

noncomputable instance (D : DeltaLogRing p A M) (N : Type u) [CommMonoid N] :
    CommRing (FreeOnMonoid D N) := sorry

/-- API `DeltaLogRing.freeOnMonoid` (constructor; node `PR.8/delta-log-free`): For a δ_log-ring (A,
M_A) and a monoid M, the δ_log-ring (A{M}_δlog, M_A ⊕ M) with its prelog-ring map from (A[M], M_A ⊕
M). -/
noncomputable def freeOnMonoid (D : DeltaLogRing p A M) (N : Type u) [CommMonoid N] :
    DeltaLogRing p (FreeOnMonoid D N) (M × N) := sorry

/-- The structure map `(A, M_A) → (A{N}_δlog, M_A ⊕ N)` (monoid part `m ↦ (m, 1)`). -/
noncomputable def freeOnMonoid.ι (D : DeltaLogRing p A M) (N : Type u) [CommMonoid N] :
    Hom D (freeOnMonoid D N) := sorry

theorem freeOnMonoid.ι_monoid (D : DeltaLogRing p A M) (N : Type u) [CommMonoid N] :
    (freeOnMonoid.ι D N).monoid = MonoidHom.inl M N := by
  sorry

/-- The prelog-ring map `(A[N], M_A ⊕ N) → (A{N}_δlog, M_A ⊕ N)` of API `DeltaLogRing.freeOnMonoid`. -/
noncomputable def freeOnMonoid.ofMonoidAlgebra (D : DeltaLogRing p A M) (N : Type u)
    [CommMonoid N] : MonoidAlgebra A N →+* FreeOnMonoid D N := sorry

theorem freeOnMonoid.ofMonoidAlgebra_of (D : DeltaLogRing p A M) (N : Type u) [CommMonoid N]
    (n : N) : freeOnMonoid.ofMonoidAlgebra D N (MonoidAlgebra.of A N n) =
      (freeOnMonoid D N).α (1, n) := by
  sorry

/-- API `DeltaLogRing.freeOnMonoid.lift` (universal-property; node `PR.8/delta-log-free`):
δ_log-maps (A{M}_δlog, M_A ⊕ M) → (B, N) over (A, M_A) correspond to monoid maps M → N compatible
with prelog structures (lift ∘ canonical = given map, and uniqueness). -/
theorem freeOnMonoid.lift (D : DeltaLogRing p A M) (N : Type u) [CommMonoid N]
    {B : Type u} {N' : Type u} [CommRing B] [CommMonoid N'] (E : DeltaLogRing p B N')
    (f : Hom D E) (g : N →* N') :
    ∃! F : Hom (freeOnMonoid D N) E,
      F.ring.comp (freeOnMonoid.ι D N).ring = f.ring ∧ F.monoid = f.monoid.coprod g := by
  sorry

/-- The base `(ℤ_(p), {e})`: `ℤ_(p)` with its δ-structure and the trivial monoid. -/
noncomputable def zLocalBase (p : ℕ) [Fact p.Prime] : DeltaLogRing p (ZLocal p) PUnit.{1} where
  delta := zLocalDelta p
  α := 1
  deltaLog _ := 0
  deltaLog_one := rfl
  alpha_pow_mul_deltaLog := by sorry
  deltaLog_mul := by sorry

/-- The polynomial model `ℤ_(p)[x, y_0, y_1, …]` (`x = X none`, `y_i = X (some i)`) of the free
δ_log-ring on one log generator: `α(n) = xⁿ`, `δ_log(1) = y_0`, `δ(y_i) = y_{i+1}` (K1
Proposition 2.11); its defining values are `freeOneGeneratorPoly_alpha`, `…_deltaLog`,
`…_delta_y` and `…_delta_C`. -/
noncomputable def freeOneGeneratorPoly (p : ℕ) [Fact p.Prime] :
    DeltaLogRing p (MvPolynomial (Option ℕ) (ZLocal p)) (Multiplicative ℕ) := sorry

theorem freeOneGeneratorPoly_alpha (n : ℕ) :
    (freeOneGeneratorPoly p).α (Multiplicative.ofAdd n) = MvPolynomial.X none ^ n := by
  sorry

theorem freeOneGeneratorPoly_deltaLog :
    (freeOneGeneratorPoly p).deltaLog (Multiplicative.ofAdd 1) = MvPolynomial.X (some 0) := by
  sorry

theorem freeOneGeneratorPoly_delta_y (i : ℕ) :
    (freeOneGeneratorPoly p).delta.delta (MvPolynomial.X (some i)) =
      MvPolynomial.X (some (i + 1)) := by
  sorry

theorem freeOneGeneratorPoly_delta_C (a : ZLocal p) :
    (freeOneGeneratorPoly p).delta.delta (MvPolynomial.C a) =
      MvPolynomial.C ((zLocalDelta p).delta a) := by
  sorry

/-- API `DeltaLogRing.freeOneGenerator_equiv_mvPolynomial` (equivalence; node
`PR.8/delta-log-free`): Z_(p){x}_δlog ≅ Z_(p)[x, y_0, y_1, …] with y_0 = δ_log(x), y_{i+1} = δ(y_i).

Lean form: the free δ_log-ring `ℤ_(p){x}_δlog = freeOnMonoid (zLocalBase p) (Multiplicative ℕ)` is
identified with the polynomial model `freeOneGeneratorPoly p` by a ring isomorphism commuting with
`δ`, `α` and `δ_log`. -/
theorem freeOneGenerator_equiv_mvPolynomial :
    ∃ e : FreeOnMonoid (zLocalBase p) (Multiplicative ℕ) ≃+* MvPolynomial (Option ℕ) (ZLocal p),
      (∀ x, e ((freeOnMonoid (zLocalBase p) (Multiplicative ℕ)).delta.delta x) =
        (freeOneGeneratorPoly p).delta.delta (e x)) ∧
      ∀ n : Multiplicative ℕ,
        e ((freeOnMonoid (zLocalBase p) (Multiplicative ℕ)).α (PUnit.unit, n)) =
            (freeOneGeneratorPoly p).α n ∧
          e ((freeOnMonoid (zLocalBase p) (Multiplicative ℕ)).deltaLog (PUnit.unit, n)) =
            (freeOneGeneratorPoly p).deltaLog n := by
  sorry

/-- API `DeltaLogRing.freeOneGenerator_frobenius_faithfullyFlat` (other; node
`PR.8/delta-log-free`): φ on Z_(p){x}_δlog is faithfully flat. -/
theorem freeOneGenerator_frobenius_faithfullyFlat :
    (TauCeti.Delta.toFrobenius p (freeOneGeneratorPoly p).delta).1.FaithfullyFlat := by
  sorry

/-- The category of δ_log-rings (objects: a ring, a monoid and a δ_log-structure; morphisms:
`DeltaLogRing.Hom`). -/
structure Cat (p : ℕ) [Fact p.Prime] where
  /-- The ring. -/
  A : Type u
  [commRing : CommRing A]
  /-- The monoid. -/
  M : Type u
  [commMonoid : CommMonoid M]
  /-- The δ_log-structure. -/
  D : DeltaLogRing p A M

attribute [instance] Cat.commRing Cat.commMonoid

instance : Category (Cat.{u} p) where
  Hom X Y := Hom X.D Y.D
  id X := Hom.id X.D
  comp f g := Hom.comp g f
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

/-- The forgetful functor to pairs (ring, monoid). -/
noncomputable def Cat.forget (p : ℕ) [Fact p.Prime] : Cat.{u} p ⥤ CommRingCat.{u} × CommMonCat.{u} :=
  sorry

/-- **Node `PR.8/delta-log-free`** (construction): Limits, colimits and free δ_log-rings.

The category of δ_log-rings has all limits and colimits, computed on underlying rings and monoids;
the forgetful functors to prelog rings and to pairs (ring, monoid) have left adjoints that are the
identity on the monoid part, and the forgetful functor to prelog rings has a right adjoint. For a
δ_log-ring (A, M_A) and a monoid M, (A{M}_δlog, M_A ⊕ M) denotes the δ_log-ring freely obtained from
the prelog ring (A[M], M_A ⊕ M). The free δ_log-ring on one log generator, Z_(p){x}_δlog, is the
polynomial ring Z_(p)[x, δ_log(x), δ(δ_log(x)), δ^2(δ_log(x)), …] with prelog structure x^N, and its
Frobenius is faithfully flat; Z_(p){x}_δlog[1/p] is the polynomial ring on x, φ(x)/x^p, φ(φ(x)/x^p),
…; and (Z_(p){x}_δlog[x^{-1}], x^Z) → (Z_(p){x^{±1}}_δlog, x^Z) becomes an isomorphism after
classical p-completion.

Hypotheses (packet): All rings are Z_(p)-algebras; monoids are commutative.

API `DeltaLogRing.hasLimits` (instance; node `PR.8/delta-log-free`): The category of δ_log-rings has
all small limits and colimits, preserved by the forgetful functor to (ring, monoid) pairs. -/
instance hasLimits : Limits.HasLimits (Cat.{u} p) := sorry

/-- Colimits of δ_log-rings (API `DeltaLogRing.hasLimits`, colimit half). -/
instance hasColimits : Limits.HasColimits (Cat.{u} p) := sorry

/-- The forgetful functor to (ring, monoid) pairs preserves limits and colimits
(API `DeltaLogRing.hasLimits`). -/
theorem Cat.forget_preserves (p : ℕ) [Fact p.Prime] :
    Limits.PreservesLimits (Cat.forget.{u} p) ∧ Limits.PreservesColimits (Cat.forget.{u} p) := by
  sorry

/-- API `DeltaLogRing.invertGenerator_completion` (compatibility; node `PR.8/delta-log-free`):
(Z_(p){x}_δlog[x^{-1}], x^Z) → (Z_(p){x^{±1}}_δlog, x^Z) is an isomorphism after classical
p-completion.

Lean form: an isomorphism of classical `p`-adic completions (Mathlib `AdicCompletion`) between
`ℤ_(p){x}_δlog[x⁻¹]` (Mathlib `Localization.Away`) and `ℤ_(p){x^{±1}}_δlog = freeOnMonoid
(zLocalBase p) (Multiplicative ℤ)`; the identification with the completion of the natural map is not
typed. -/
theorem invertGenerator_completion :
    Nonempty (AdicCompletion
        (Ideal.span {(p : Localization.Away ((freeOnMonoid (zLocalBase p) (Multiplicative ℕ)).α
          (PUnit.unit, Multiplicative.ofAdd 1)))})
        (Localization.Away ((freeOnMonoid (zLocalBase p) (Multiplicative ℕ)).α
          (PUnit.unit, Multiplicative.ofAdd 1))) ≃+*
      AdicCompletion (Ideal.span {(p : FreeOnMonoid (zLocalBase p) (Multiplicative ℤ))})
        (FreeOnMonoid (zLocalBase p) (Multiplicative ℤ))) := by
  sorry

/-- Unit test `DeltaLogRing.freeOneGenerator_frobenius_x` (computation; node `PR.8/delta-log-free`):
In Z_(p){x}_δlog, φ(x) = x^p(1 + p·δ_log(x)) and φ(δ_log(x)) = δ_log(x)^p + p·δ(δ_log(x)). -/
theorem freeOneGenerator_frobenius_x :
    frob (freeOneGeneratorPoly p).delta (MvPolynomial.X none) =
        MvPolynomial.X none ^ p * (1 + (p : MvPolynomial (Option ℕ) (ZLocal p)) *
          MvPolynomial.X (some 0)) ∧
      frob (freeOneGeneratorPoly p).delta (MvPolynomial.X (some 0)) =
        MvPolynomial.X (some 0) ^ p + (p : MvPolynomial (Option ℕ) (ZLocal p)) *
          MvPolynomial.X (some 1) := by
  sorry

/-- Unit test `DeltaLogRing.frobenius_alpha_example` (characterisation; node `PR.8/delta-log-ring`):
In any δ_log-ring, φ(α(m)) − α(m)^p = p·α(m)^p·δ_log(m); for A = Z_(p)[x, y_0, y_1, …] with α(1) = x
and δ_log(1) = y_0 free, φ(x) = x^p(1 + p y_0).

Lean form: the general identity, and the free-ring calculation in the polynomial model
`freeOneGeneratorPoly p`, where moreover `φ(x) ≠ x ^ p`. -/
theorem frobenius_alpha_example {A' : Type u} {M' : Type v} [CommRing A'] [CommMonoid M']
    (D : DeltaLogRing p A' M') (m : M') :
    (frob D.delta (D.α m) - D.α m ^ p = (p : A') * D.α m ^ p * D.deltaLog m) ∧
      frob (freeOneGeneratorPoly p).delta (MvPolynomial.X none) =
        MvPolynomial.X none ^ p * (1 + (p : MvPolynomial (Option ℕ) (ZLocal p)) *
          MvPolynomial.X (some 0)) ∧
      frob (freeOneGeneratorPoly p).delta (MvPolynomial.X none) ≠ MvPolynomial.X none ^ p := by
  sorry

/-- Unit test `DeltaLogRing.freeOnMonoid_trivial` (degenerate; node `PR.8/delta-log-free`): For M
the trivial monoid, (A{M}_δlog, M_A ⊕ M) = (A, M_A). -/
theorem freeOnMonoid_trivial (D : DeltaLogRing p A M) :
    ∃ e : FreeOnMonoid D PUnit.{u + 1} ≃+* A,
      (∀ a, e ((freeOnMonoid.ι D PUnit).ring a) = a) ∧
        ∀ m, e ((freeOnMonoid D PUnit).α (m, PUnit.unit)) = D.α m := by
  sorry

/-- Unit test `DeltaLogRing.freeOneGenerator_not_monoidAlgebra` (non-example; node
`PR.8/delta-log-free`): Z_(p){x}_δlog is not Z_(p)[x]: the element δ_log(x) is algebraically
independent of x, so the rank-1 algebra Z_(p)[x] is a proper quotient. -/
theorem freeOneGenerator_not_monoidAlgebra :
    ¬ ∃ q : Polynomial (ZLocal p),
      (freeOnMonoid (zLocalBase p) (Multiplicative ℕ)).deltaLog
          (PUnit.unit, Multiplicative.ofAdd 1) =
        q.eval₂ (freeOnMonoid.ι (zLocalBase p) (Multiplicative ℕ)).ring
          ((freeOnMonoid (zLocalBase p) (Multiplicative ℕ)).α
            (PUnit.unit, Multiplicative.ofAdd 1)) := by
  sorry

/-- Unit test `DeltaLogRing.pdivisible_rankOne` (characterisation; node `PR.8/delta-log-free`): For
M = N[1/p] and a classically p-complete δ_log-ring (A, M), δ(α(m)) = 0 for all m (K1 Example 2.10).

Lean form: `M = ℕ[1/p]` is `NatInvP p`; classical `p`-completeness is Mathlib's `IsAdicComplete`. -/
theorem pdivisible_rankOne {B : Type u} [CommRing B] (D : DeltaLogRing p B (NatInvP p))
    [IsAdicComplete (Ideal.span {(p : B)}) B] (m : NatInvP p) :
    D.delta.delta (D.α m) = 0 := by
  sorry

end DeltaLogRing


/-! ## Node `PR.8/delta-log-completion-etale` (lemma): δ_log-structures pass to completions and completely étale extensions -/

namespace DeltaLogRing

variable {p : ℕ} [Fact p.Prime] {A : Type u} {M : Type v} [CommRing A] [CommMonoid M]

/-- **Node `PR.8/delta-log-completion-etale`** (lemma): δ_log-structures pass to completions and
completely étale extensions.

Let (A, M) be a δ_log-ring and I ⊂ A a finitely generated ideal containing p. (1) The classical
I-adic completion A^∧_cl with the composite prelog structure M → A → A^∧_cl carries a unique
δ_log-structure making A → A^∧_cl a map of δ_log-rings. (2) If A → B is I-completely étale, then (B,
M) carries a unique δ_log-structure compatible with (A, M).

Hypotheses (packet): I is finitely generated and p ∈ I. In (2), A → B is I-completely étale in the
sense of BS22.

Lean form: `A^∧_cl` is Mathlib's `AdicCompletion I A`. In part (2), "`I`-completely étale" is
replaced by the stronger hypothesis that `A → B` is étale (Mathlib `Algebra.Etale`) with `B`
classically `IB`-adically complete; the statement remains true under it. -/
theorem completion_etale (D : DeltaLogRing p A M) (I : Ideal A) (hI : I.FG) (hpI : (p : A) ∈ I) :
    (∃! E : DeltaLogRing p (AdicCompletion I A) M,
        E.α = (algebraMap A (AdicCompletion I A)).toMonoidHom.comp D.α ∧
        (∀ x, E.delta.delta (algebraMap A (AdicCompletion I A) x) =
          algebraMap A (AdicCompletion I A) (D.delta.delta x)) ∧
        ∀ m, E.deltaLog m = algebraMap A (AdicCompletion I A) (D.deltaLog m)) ∧
      ∀ (B : Type u) [CommRing B] [Algebra A B] [Algebra.Etale A B]
        [IsAdicComplete (I.map (algebraMap A B)) B],
        ∃! E : DeltaLogRing p B M,
          E.α = (algebraMap A B).toMonoidHom.comp D.α ∧
          (∀ x, E.delta.delta (algebraMap A B x) = algebraMap A B (D.delta.delta x)) ∧
          ∀ m, E.deltaLog m = algebraMap A B (D.deltaLog m) := by
  sorry

/-! ## Node `PR.8/delta-log-associated-log` (theorem): δ_log-structures on associated log structures -/

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`): the monoid pushout
`M ⊔_{α⁻¹(Aˣ)} Aˣ` of the associated log structure of a prelog ring. -/
def AssocLogMonoid (α : M →* A) : Type (max u v) := sorry

noncomputable instance (α : M →* A) : CommMonoid (AssocLogMonoid α) := sorry

/-- The map `M → M ⊔_{α⁻¹(Aˣ)} Aˣ`. -/
noncomputable def AssocLogMonoid.inl (α : M →* A) : M →* AssocLogMonoid α := sorry

/-- The map `Aˣ → M ⊔_{α⁻¹(Aˣ)} Aˣ`. -/
noncomputable def AssocLogMonoid.inr (α : M →* A) : Aˣ →* AssocLogMonoid α := sorry

/-- The associated log structure `M ⊔_{α⁻¹(Aˣ)} Aˣ → A`. -/
noncomputable def AssocLogMonoid.alpha (α : M →* A) : AssocLogMonoid α →* A := sorry

theorem AssocLogMonoid.alpha_inl (α : M →* A) (m : M) :
    AssocLogMonoid.alpha α (AssocLogMonoid.inl α m) = α m := by
  sorry

theorem AssocLogMonoid.alpha_inr (α : M →* A) (u : Aˣ) :
    AssocLogMonoid.alpha α (AssocLogMonoid.inr α u) = u := by
  sorry

theorem AssocLogMonoid.isLogRing (α : M →* A) : IsLogRing (AssocLogMonoid.alpha α) := by
  sorry

/-- **Node `PR.8/delta-log-associated-log`** (theorem): δ_log-structures on associated log
structures.

(1) Let (A, M) be a δ_log-ring and N := M ⊔_{α^{-1}(A^×)} A^× the pushout of monoids. There is a
unique δ_log-structure on the prelog ring (A, N) compatible with that of (A, M). (2) If moreover A
is classically I-complete for a finitely generated ideal I ∋ p, then for every affine U = Spf(B)
étale over Spf(A), the log ring (B, Γ(U, M^a)) of the associated log structure M^a on Spf(A)_ét
carries a unique δ_log-structure compatible with (A, M) and with étale localisation. Hence
δ_log-structures make sense on log structures (on the étale site of Spf(A)).

Hypotheses (packet): (2): A classically I-complete, I finitely generated, p ∈ I.

Lean form of part (1). Part (2), on the étale site of `Spf(A)`, is not typed: log structures on
formal schemes and their étale sections are CR.5 objects that no library has (leaving it out does
not make part (1) false). -/
theorem assocLog_existsUnique (D : DeltaLogRing p A M) :
    ∃! E : DeltaLogRing p A (AssocLogMonoid D.α),
      E.delta = D.delta ∧ E.α = AssocLogMonoid.alpha D.α ∧
        ∀ m, E.deltaLog (AssocLogMonoid.inl D.α m) = D.deltaLog m := by
  sorry

/-! ## Node `PR.8/delta-log-groupification` (theorem): Extension of δ_log along M ⊂ N ⊂ M^gp -/

/-- The `ℤ[M]`-algebra structure on `A` defined by a prelog structure `α : M → A`. -/
noncomputable abbrev prelogAlgebra (α : M →* A) : Algebra (MonoidAlgebra ℤ M) A :=
  (MonoidAlgebra.lift ℤ A M α).toRingHom.toAlgebra

/-- `A ⊗_{ℤ[M]} ℤ[N]` for a prelog ring `(A, α : M → A)` and a monoid map `ι : M → N`
(Mathlib's tensor product of algebras). For `ℤ_(p)`-algebras `A` it is
`A ⊗_{ℤ_(p)[M]} ℤ_(p)[N]`. -/
noncomputable abbrev MonoidBaseChange (α : M →* A) {N : Type v} [CommMonoid N] (ι : M →* N) :
    Type (max u v) :=
  letI := prelogAlgebra α
  letI : Algebra (MonoidAlgebra ℤ M) (MonoidAlgebra ℤ N) :=
    (MonoidAlgebra.mapDomainRingHom ℤ ι).toAlgebra
  TensorProduct (MonoidAlgebra ℤ M) A (MonoidAlgebra ℤ N)

noncomputable instance (α : M →* A) {N : Type v} [CommMonoid N] (ι : M →* N) :
    CommRing (MonoidBaseChange α ι) :=
  letI := prelogAlgebra α
  letI : Algebra (MonoidAlgebra ℤ M) (MonoidAlgebra ℤ N) :=
    (MonoidAlgebra.mapDomainRingHom ℤ ι).toAlgebra
  Algebra.TensorProduct.instCommRing

/-- The ring map `A → A ⊗_{ℤ[M]} ℤ[N]`. -/
noncomputable def MonoidBaseChange.inl (α : M →* A) {N : Type v} [CommMonoid N] (ι : M →* N) :
    A →+* MonoidBaseChange α ι := sorry

/-- The prelog structure `N → A ⊗_{ℤ[M]} ℤ[N]`, `n ↦ 1 ⊗ n`. -/
noncomputable def MonoidBaseChange.alpha (α : M →* A) {N : Type v} [CommMonoid N]
    (ι : M →* N) : N →* MonoidBaseChange α ι := sorry

/-- **Node `PR.8/delta-log-groupification`** (theorem): Extension of δ_log along M ⊂ N ⊂ M^gp.

Let (A, M, α) be a δ_log-ring with M integral and p ∈ rad(A). (1) There is a unique map δ_log: M^gp
→ A extending the given δ_log on M and satisfying δ_log(mm′) = δ_log(m) + δ_log(m′) +
pδ_log(m)δ_log(m′) on M^gp, namely δ_log(m′/m) = (δ_log(m′) − δ_log(m))/(1 + pδ_log(m)). (2) For
every submonoid N ⊂ M^gp containing M there is a unique δ-structure on A ⊗_{Z_(p)[M]} Z_(p)[N]
making (A ⊗_{Z_(p)[M]} Z_(p)[N], N) a δ_log-ring over (A, M) with this δ_log. (3) The map (A, M) →
(A ⊗_{Z_(p)[M]} Z_(p)[N], N) is universal among maps of δ_log-rings (A, M) → (B, N) compatible with
M ⊂ N, and its formation commutes with base change A → A′.

Hypotheses (packet): M integral; p in the Jacobson radical of A; N a submonoid of M^gp containing M.

Lean form of part (1); `M^gp` is Mathlib's `Algebra.GrothendieckGroup M`. Part (2) is
`exists_unique_baseChange_gp`; the universality and base-change assertions of part (3) are not
typed. -/
theorem exists_unique_deltaLog_gp [IsCancelMul M] (D : DeltaLogRing p A M)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) :
    ∃! d : Algebra.GrothendieckGroup M → A,
      (∀ m, d (Algebra.GrothendieckGroup.of m) = D.deltaLog m) ∧
        ∀ x y, d (x * y) = d x + d y + (p : A) * d x * d y := by
  sorry

/-- Part (2) of node `PR.8/delta-log-groupification`: for a submonoid `N ⊂ M^gp` containing `M`,
`(A ⊗_{ℤ[M]} ℤ[N], N)` carries a unique δ_log-structure over `(A, M)` whose δ_log extends that of
`M`. -/
theorem exists_unique_baseChange_gp [IsCancelMul M] (D : DeltaLogRing p A M)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) (N : Submonoid (Algebra.GrothendieckGroup M))
    (ι : M →* N) (hι : ∀ m, ((ι m : N) : Algebra.GrothendieckGroup M) =
      Algebra.GrothendieckGroup.of m) :
    ∃! E : DeltaLogRing p (MonoidBaseChange D.α ι) N,
      E.α = MonoidBaseChange.alpha D.α ι ∧
        (∀ x, E.delta.delta (MonoidBaseChange.inl D.α ι x) =
          MonoidBaseChange.inl D.α ι (D.delta.delta x)) ∧
        ∀ m, E.deltaLog (ι m) = MonoidBaseChange.inl D.α ι (D.deltaLog m) := by
  sorry

end DeltaLogRing

/-! ## Node `PR.8/delta-log-exactification` (construction): Exactification of δ_log-triples -/

/-- A map of prelog rings `(f, g) : (B, P) → (C, N)` is an exact surjection: `f` is surjective
and `g` induces a bijection `P / Pˣ ≃ N / Nˣ` (stated elementwise). -/
def IsExactSurjection {B C P N : Type*} [CommRing B] [CommRing C] [CommMonoid P] [CommMonoid N]
    (f : B →+* C) (g : P →* N) : Prop :=
  Function.Surjective f ∧ (∀ n : N, ∃ x : P, ∃ u : Nˣ, g x = n * u) ∧
    ∀ x y : P, (∃ u : Nˣ, g x = g y * u) → ∃ v : Pˣ, x = y * v

/-- A δ_log-triple `(A, I, M)`: a δ_log-ring with an ideal. -/
structure DeltaLogTriple (p : ℕ) [Fact p.Prime] (A : Type u) (M : Type v) [CommRing A]
    [CommMonoid M] extends DeltaLogRing p A M where
  /-- The ideal `I`. -/
  ideal : Ideal A

namespace DeltaLogTriple

variable {p : ℕ} [Fact p.Prime] {A : Type u} {M : Type v} [CommRing A] [CommMonoid M]

/-- Maps of δ_log-triples: maps of δ_log-rings carrying `I` into `J`. -/
structure Hom {B : Type w} {N : Type*} [CommRing B] [CommMonoid N]
    (T : DeltaLogTriple p A M) (T' : DeltaLogTriple p B N) where
  /-- The map of δ_log-rings. -/
  toHom : DeltaLogRing.Hom T.toDeltaLogRing T'.toDeltaLogRing
  map_ideal : T.ideal.map toHom.ring ≤ T'.ideal

end DeltaLogTriple

/-- The monoid `M′ = (h^gp)⁻¹(N) ⊂ M^gp` of the exactification of `h : M →* N`. -/
noncomputable def exactificationMonoid {M N : Type*} [CommMonoid M] [CommMonoid N] (h : M →* N) :
    Submonoid (Algebra.GrothendieckGroup M) :=
  (MonoidHom.mrange (Algebra.GrothendieckGroup.of (M := N))).comap
    (Algebra.GrothendieckGroup.lift ((Algebra.GrothendieckGroup.of (M := N)).comp h))

/-- The inclusion `M → M′`. -/
noncomputable def exactificationMonoid.incl {M N : Type*} [CommMonoid M] [CommMonoid N]
    (h : M →* N) : M →* exactificationMonoid h := sorry

namespace DeltaLogTriple

variable {p : ℕ} [Fact p.Prime] {A : Type u} {M : Type u} [CommRing A] [CommMonoid M]

/-- The data of node `PR.8/delta-log-exactification`: a surjective map of prelog rings
`(A, M) → (A / I, N)` from a δ_log-triple with `M`, `N` integral and `A` classically `p`-complete
(the Jacobson-radical consequence of completeness used by groupification is recorded). -/
structure ExactificationDatum (T : DeltaLogTriple p A M) where
  /-- The target monoid `N`. -/
  N : Type u
  [commMonoid : CommMonoid N]
  /-- The prelog structure of `A / I`. -/
  αN : N →* A ⧸ T.ideal
  /-- The monoid map `h : M → N`. -/
  h : M →* N
  comm : ∀ m, αN (h m) = Ideal.Quotient.mk T.ideal (T.α m)
  surj : Function.Surjective h
  integral_M : IsCancelMul M
  integral_N : IsCancelMul N
  complete : IsAdicComplete (Ideal.span {(p : A)}) A
  p_mem_jacobson : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)

attribute [instance] ExactificationDatum.commMonoid

/-- **Node `PR.8/delta-log-exactification`** (construction): Exactification of δ_log-triples.

Let (A, I, M) be a δ_log-triple (a δ_log-ring with an ideal I) with A classically p-complete, (A/I,
N) a prelog ring and (A, M) → (A/I, N) a surjective map of prelog rings with M and N integral. Let
h: M → N, h̄: M → N/N^× and M′ := (h^gp)^{-1}(N) = (h̄^gp)^{-1}(N/N^×) ⊂ M^gp; M′ is generated by M
and (h̄^gp)^{-1}(e). The exactification is the δ_log-triple (A′, I′, M′) with A′ := A ⊗_{Z_(p)[M]}
Z_(p)[M′] (with the δ_log-structure of Proposition 2.16), the induced exact surjection (A′, M′) →
(A/I, N), and I′ := ker(A′ → A/I). The construction is functorial and the formation of (A′, M′)
commutes with base change on A. If (A, M) → (A/I, N) lives over (B, M_B) with M_B → N integral, then
M_B → M′ is integral.

Hypotheses (packet): A classically p-complete; M, N integral; (A, M) → (A/I, N) surjective on rings
and monoids.

API `DeltaLogTriple.exactification` (constructor; node `PR.8/delta-log-exactification`): The
δ_log-triple (A′, I′, M′) with A′ = A ⊗_{Z_(p)[M]} Z_(p)[(h^gp)^{-1}(N)]. -/
noncomputable def exactification (T : DeltaLogTriple p A M) (E : ExactificationDatum T) :
    DeltaLogTriple p (DeltaLogRing.MonoidBaseChange T.α (exactificationMonoid.incl E.h))
      (exactificationMonoid E.h) :=
  sorry

/-- The ring map `A′ → A / I` of the exactification. -/
noncomputable def exactification.toQuotient (T : DeltaLogTriple p A M)
    (E : ExactificationDatum T) :
    DeltaLogRing.MonoidBaseChange T.α (exactificationMonoid.incl E.h) →+* A ⧸ T.ideal := sorry

/-- The monoid map `M′ → N` of the exactification (restriction of `h^gp`). -/
noncomputable def exactification.toN (T : DeltaLogTriple p A M) (E : ExactificationDatum T) :
    exactificationMonoid E.h →* E.N := sorry

/-- `I′ = ker(A′ → A / I)`. -/
theorem exactification_ideal (T : DeltaLogTriple p A M) (E : ExactificationDatum T) :
    (exactification T E).ideal = RingHom.ker (exactification.toQuotient T E) := by
  sorry

/-- API `DeltaLogTriple.exactification.toQuotient_exactSurjective` (characterisation; node
`PR.8/delta-log-exactification`): (A′, M′) → (A/I, N) is surjective and M′/M′^× ≅ N/N^×. -/
theorem exactification.toQuotient_exactSurjective (T : DeltaLogTriple p A M)
    (E : ExactificationDatum T) :
    IsExactSurjection (exactification.toQuotient T E) (exactification.toN T E) := by
  sorry

/-- API `DeltaLogTriple.exactification.lift` (universal-property; node
`PR.8/delta-log-exactification`): Every map of δ_log-triples (A, I, M) → (B, J, M_B) whose target
surjects exactly onto (A/I, N) compatibly factors uniquely through (A′, I′, M′). -/
theorem exactification.lift (T : DeltaLogTriple p A M) (E : ExactificationDatum T)
    {B : Type u} {MB : Type u} [CommRing B] [CommMonoid MB] (T' : DeltaLogTriple p B MB)
    (f : Hom T T') (q : B →+* A ⧸ T.ideal) (r : MB →* E.N)
    (hq : ∀ a, q (f.toHom.ring a) = Ideal.Quotient.mk T.ideal a)
    (hr : ∀ m, r (f.toHom.monoid m) = E.h m) (hαr : ∀ n, E.αN (r n) = q (T'.α n))
    (hex : IsExactSurjection q r) :
    ∃! g : Hom (exactification T E) T',
      (∀ a, g.toHom.ring (DeltaLogRing.MonoidBaseChange.inl T.α _ a) = f.toHom.ring a) ∧
        ∀ m, g.toHom.monoid (exactificationMonoid.incl E.h m) = f.toHom.monoid m := by
  sorry

/-! * API `DeltaLogTriple.exactification.baseChange` (functoriality; node
`PR.8/delta-log-exactification`): For A → A″ the exactification of the base change is the base
change of (A′, M′).

  Not typed: base change of a δ_log-triple along `A → A″` together with its exactification datum is
a construction of its own that this file does not set up; the statement "exactification of the base
change = base change of `(A′, M′)`" would otherwise have to quantify over an unconstrained
comparison. -/

/-- API `DeltaLogTriple.exactification.integral` (other; node `PR.8/delta-log-exactification`): If
M_B → N is integral for a base (B, M_B), then the induced M_B → M′ is integral.

Lean form: integrality of a monoid map `g : P → Q` (Kato) is not in Mathlib; it is spelled out: for
`a₁, a₂ ∈ P` and `b₁, b₂ ∈ Q` with `g(a₁) b₁ = g(a₂) b₂` there are `a₃, a₄ ∈ P` and `c ∈ Q` with `b₁
= g(a₃) c`, `b₂ = g(a₄) c` and `a₁ a₃ = a₂ a₄`. -/
theorem exactification.integral (T : DeltaLogTriple p A M) (E : ExactificationDatum T)
    {MB : Type u} [CommMonoid MB] (k : MB →* M)
    (hk : ∀ (a₁ a₂ : MB) (b₁ b₂ : E.N), E.h (k a₁) * b₁ = E.h (k a₂) * b₂ →
      ∃ a₃ a₄ : MB, ∃ c : E.N, b₁ = E.h (k a₃) * c ∧ b₂ = E.h (k a₄) * c ∧ a₁ * a₃ = a₂ * a₄) :
    ∀ (a₁ a₂ : MB) (b₁ b₂ : exactificationMonoid E.h),
      exactificationMonoid.incl E.h (k a₁) * b₁ = exactificationMonoid.incl E.h (k a₂) * b₂ →
      ∃ a₃ a₄ : MB, ∃ c : exactificationMonoid E.h,
        b₁ = exactificationMonoid.incl E.h (k a₃) * c ∧
          b₂ = exactificationMonoid.incl E.h (k a₄) * c ∧ a₁ * a₃ = a₂ * a₄ := by
  sorry

/-- Unit test `DeltaLogTriple.exactification_of_exact` (degenerate; node
`PR.8/delta-log-exactification`): If (A, M) → (A/I, N) is already exact surjective then (A′, I′, M′)
= (A, I, M).

Lean form: the comparison `A → A′` is bijective and `M → M′` is bijective. -/
theorem exactification_of_exact (T : DeltaLogTriple p A M) (E : ExactificationDatum T)
    (hex : IsExactSurjection (Ideal.Quotient.mk T.ideal) E.h) :
    Function.Bijective (DeltaLogRing.MonoidBaseChange.inl T.α (exactificationMonoid.incl E.h)) ∧
      Function.Bijective (exactificationMonoid.incl E.h) := by
  sorry

/-! * Unit test `DeltaLogTriple.exactification_diagonal` (computation; node
`PR.8/delta-log-exactification`): For (Z_p⟨X_0, X_1⟩, X_0^N X_1^N) → (Z_p⟨X_0⟩, X_0^N) sending both
generators to X_0, M′ = X_0^N·(X_1/X_0)^Z and A′ = Z_p⟨X_0, X_1⟩[T,T^{-1}]/(X_0T − X_1). This
exactification is algebraic; completion is a separate step in the envelope construction.

  Not typed: the source ring is the restricted power series ring `ℤ_p⟨X_0, X_1⟩` with a specific
δ_log-structure; restricted power series rings and their δ-structures are not in Mathlib, and a
version over an arbitrary δ-structure would not determine the target ring. -/

/-! * Unit test `DeltaLogTriple.exactification_not_ring_quotient` (non-example; node
`PR.8/delta-log-exactification`): The exactification is not the kernel-ideal construction on A
alone: for the diagonal example the ring changes (X_1/X_0 is adjoined), so the prismatic envelope of
A → A/I without exactification is the wrong object.

  Not typed: rests on the diagonal example above and on PR.0's prismatic envelope, which is not part
of the PR.0 excerpt this file is checked against. -/

/-- Unit test `DeltaLogTriple.exactification_compat_monoid` (compatibility; node
`PR.8/delta-log-exactification`): For integral M and N, the exactification monoid is exactly
(h^gp)^{-1}(N) ⊂ M^gp: x lies in M′ iff h^gp(x) lies in the image of N → N^gp, using Mathlib’s
Algebra.GrothendieckGroup. This is the carrier used by CR.5’s monoid exactification. -/
theorem exactification_compat_monoid {M N : Type*} [CommMonoid M] [CommMonoid N] (h : M →* N)
    (x : Algebra.GrothendieckGroup M) :
    x ∈ exactificationMonoid h ↔
      Algebra.GrothendieckGroup.lift ((Algebra.GrothendieckGroup.of (M := N)).comp h) x ∈
        MonoidHom.mrange (Algebra.GrothendieckGroup.of (M := N)) := by
  sorry

end DeltaLogTriple


/-! ## Node `PR.8/prelog-prism` (definition): Prelog prisms -/

/-- **Node `PR.8/prelog-prism`** (definition): Prelog prisms.

A prelog prism is a δ_log-triple (A, I, M) (a δ_log-ring (A, M) with an ideal I) such that (A, I) is
a prism in the sense of BS22 (I defines a Cartier divisor, A is derived (p, I)-complete, p ∈ I +
φ(I)A). It is bounded if (A, I) is bounded (A/I has bounded p^∞-torsion), and of rank 1 if δ_log =
0. Maps of prelog prisms are maps of δ_log-triples (maps of δ_log-rings carrying I into J).
Rigidity: if (A, I, M) is a prelog prism and A → B a map of δ-rings with B (p, I)-complete, then (B,
IB, M) is a prelog prism iff B[I] = 0; this holds when (A, I) is bounded and B is (p, I)-completely
flat over A.

Hypotheses (packet): The prism conditions are PR.0's. No condition on the monoid M (integrality is
imposed where needed).

Lean form: a PR.0 prism `toPrism` together with a δ_log-ring on `(A, α : M → A)` whose δ-structure
is the prism's (`delta_eq`). As in PR.0, derived `(p, I)`-completeness is not a field (DD.1);
boundedness is the separate predicate `PrelogPrism.IsBounded`. -/
structure PrelogPrism (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A] (M : Type v)
    [CommMonoid M] where
  /-- API `PrelogPrism.mk` (constructor; node `PR.8/prelog-prism`): From a δ_log-ring (A, M) and an
  ideal I with (A, I) a prism, a prelog prism. -/
  mk ::
  /-- API `PrelogPrism.toPrism` (projection; node `PR.8/prelog-prism`): The underlying prism (A, I).
  -/
  toPrism : Prism p A
  /-- The δ_log-ring `(A, M)`. -/
  toDeltaLogRing : DeltaLogRing p A M
  /-- The δ-structure of the δ_log-ring is that of the prism. -/
  delta_eq : toDeltaLogRing.delta = toPrism.δ

namespace PrelogPrism

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type v} [CommMonoid M]

/-- The prelog structure `α : M → A`. -/
abbrev α (P : PrelogPrism p A M) : M →* A := P.toDeltaLogRing.α

/-- The map `δ_log : M → A`. -/
abbrev deltaLog (P : PrelogPrism p A M) : M → A := P.toDeltaLogRing.deltaLog

/-- The underlying δ_log-triple `(A, I, M)`. -/
def toDeltaLogTriple (P : PrelogPrism p A M) : DeltaLogTriple p A M :=
  { P.toDeltaLogRing with ideal := P.toPrism.I }

/-- Maps of prelog prisms are maps of δ_log-triples. -/
abbrev Hom {B : Type w} [CommRing B] {N : Type*} [CommMonoid N] (P : PrelogPrism p A M)
    (Q : PrelogPrism p B N) : Type _ :=
  DeltaLogTriple.Hom P.toDeltaLogTriple Q.toDeltaLogTriple

/-- API `PrelogPrism.IsBounded` (other; node `PR.8/prelog-prism`): Boundedness of the underlying
prism. -/
def IsBounded (P : PrelogPrism p A M) : Prop := P.toPrism.IsBounded

/-- API `PrelogPrism.IsRankOne` (other; node `PR.8/prelog-prism`): δ_log = 0. -/
def IsRankOne (P : PrelogPrism p A M) : Prop := P.toDeltaLogRing.IsRankOne

/-- API `PrelogPrism.baseChange_of_flat` (functoriality; node `PR.8/prelog-prism`): If (A, I) is
bounded and A → B is a (p, I)-completely flat δ-map with B (p, I)-complete, then (B, IB, M) is a
prelog prism.

Lean form: "`(p, I)`-completely flat" is replaced by the stronger flatness of `A → B` (Mathlib
`Module.Flat`), and `(p, I)`-completeness of `B` by classical completeness (both stronger, so the
statement stays true). -/
theorem baseChange_of_flat (P : PrelogPrism p A M) (hb : P.IsBounded) {B : Type u} [CommRing B]
    [Algebra A B] [Module.Flat A B] (δB : TauCeti.Delta.Structure p B)
    (hδ : TauCeti.Prismatic.IsDeltaHom p P.toPrism.δ δB (algebraMap A B))
    [IsAdicComplete (Ideal.span {(p : B)} ⊔ P.toPrism.I.map (algebraMap A B)) B] :
    ∃ Q : PrelogPrism p B M, Q.toPrism.δ = δB ∧ Q.toPrism.I = P.toPrism.I.map (algebraMap A B) ∧
      Q.α = (algebraMap A B).toMonoidHom.comp P.α := by
  sorry

/-- API `PrelogPrism.rigid` (characterisation; node `PR.8/prelog-prism`): For a δ-map A → B with B
(p, I)-complete, (B, IB, M) is a prelog prism iff B[I] = 0. -/
theorem rigid (P : PrelogPrism p A M) {B : Type u} [CommRing B] (f : A →+* B)
    (δB : TauCeti.Delta.Structure p B) (hδ : TauCeti.Prismatic.IsDeltaHom p P.toPrism.δ δB f)
    [IsAdicComplete (Ideal.span {(p : B)} ⊔ P.toPrism.I.map f) B] :
    (∃ Q : PrelogPrism p B M, Q.toPrism.δ = δB ∧ Q.toPrism.I = P.toPrism.I.map f ∧
      Q.α = f.toMonoidHom.comp P.α) ↔ ∀ b : B, (∀ x ∈ P.toPrism.I, f x * b = 0) → b = 0 := by
  sorry

end PrelogPrism

/-! ## Node `PR.8/standard-log-prisms` (construction): The standard prelog prisms -/

namespace PrelogPrism

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]

/-- The trivial log structure `Aˣ ⊂ A` on a prism (node `PR.8/standard-log-prisms`, (1)). -/
noncomputable def trivialLog (P : Prism p A) : PrelogPrism p A Aˣ where
  toPrism := P
  toDeltaLogRing := DeltaLogRing.trivialLog P.δ
  delta_eq := rfl

/-- The prelog prism `(A, I, ℕ → A, 1 ↦ 0)` of rank one on a prism (node
`PR.8/standard-log-prisms`, (1)). -/
def zeroLog (P : Prism p A) : PrelogPrism p A (Multiplicative ℕ) where
  toPrism := P
  toDeltaLogRing :=
    { delta := P.δ
      α := powersHom A 0
      deltaLog := fun _ => 0
      deltaLog_one := rfl
      alpha_pow_mul_deltaLog := by sorry
      deltaLog_mul := by sorry }
  delta_eq := rfl

/-- **Node `PR.8/standard-log-prisms`** (construction): The standard prelog prisms.

The following are bounded prelog prisms: (1) for a bounded prism (A, I), the trivial log structure
(A, I, O^×) and (A, I, N → A, 1 ↦ 0) of rank 1; (2) for a perfect prism (A, I) = (W(R♭), ker θ) with
R perfectoid, (W(R♭), ker θ, R♭) with the Teichmüller prelog structure, of rank 1, and for R♭ a
domain (A_inf, (ξ), O_C♭∖{0}); (3) the crystalline prelog prism (W(k), (p), N → W(k), 1 ↦ 0) of rank
1 (Hyodo–Kato base); (4) for K/W(k)[1/p] totally ramified with uniformiser π and Eisenstein
polynomial E(u), the Breuil–Kisin prelog prism (W(k)[[u]], (E(u)), N → W(k)[[u]], n ↦ u^n) with
δ_log = 0 and φ(u) = u^p. These are related by the maps of prelog prisms W(k)[[u]] → W(k) (u ↦ 0,
identity on N) and W(k)[[u]] → A_inf (u ↦ [π♭], 1 ↦ [π♭]).

Hypotheses (packet): k a perfect field of characteristic p; O_K totally ramified over W(k) with
uniformiser π; C the completed algebraic closure; π♭ a compatible system of p-power roots.

API `PrelogPrism.breuilKisin` (constructor; node `PR.8/standard-log-prisms`): The Breuil–Kisin
prelog prism (W(k)[[u]], (E(u)), N → u^n) of rank 1.

Lean form: on a PR.0 prism `P` on `W(k)⟦u⟧` (Mathlib `PowerSeries (WittVector p k)`) with `I = (E)`
and `φ(u) = u ^ p` (PR.0's `Prism.breuilKisin`, outside the PR.0 excerpt, is such a prism), the
prelog structure `n ↦ uⁿ` with `δ_log = 0`. -/
noncomputable def breuilKisin (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (E : Polynomial (WittVector p k)) (P : Prism p (PowerSeries (WittVector p k)))
    (hI : P.I = Ideal.span {(E : PowerSeries (WittVector p k))})
    (hφ : P.φ PowerSeries.X = PowerSeries.X ^ p) :
    PrelogPrism p (PowerSeries (WittVector p k)) (Multiplicative ℕ) where
  toPrism := P
  toDeltaLogRing :=
    { delta := P.δ
      α := powersHom _ PowerSeries.X
      deltaLog := fun _ => 0
      deltaLog_one := rfl
      alpha_pow_mul_deltaLog := by sorry
      deltaLog_mul := by sorry }
  delta_eq := rfl

theorem breuilKisin_isRankOne (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (E : Polynomial (WittVector p k)) (P : Prism p (PowerSeries (WittVector p k)))
    (hI : P.I = Ideal.span {(E : PowerSeries (WittVector p k))})
    (hφ : P.φ PowerSeries.X = PowerSeries.X ^ p) : (breuilKisin k E P hI hφ).IsRankOne :=
  fun _ => rfl

/-- API `PrelogPrism.ainf` (constructor; node `PR.8/standard-log-prisms`): The prelog prism (A_inf,
ker θ, O_C♭∖{0}) with Teichmüller prelog structure, of rank 1.

Lean form: on a PR.0 prism on `A_inf(O) = W(O♭)` (Mathlib `WittVector p (PreTilt O p)`) with `I =
ker θ` (Mathlib `WittVector.fontaineTheta`) and `φ` the Witt vector Frobenius, the Teichmüller
prelog structure on the nonzerodivisors of `O♭` (for `O♭` a domain, `O♭ ∖ {0}`). -/
noncomputable def ainf (O : Type u) [CommRing O] [Fact ¬IsUnit (p : O)]
    [IsAdicComplete (Ideal.span {(p : O)}) O] (P : Prism p (WittVector p (PreTilt O p)))
    (hI : P.I = RingHom.ker (WittVector.fontaineTheta O p)) (hφ : P.φ = WittVector.frobenius) :
    PrelogPrism p (WittVector p (PreTilt O p)) (nonZeroDivisors (PreTilt O p)) where
  toPrism := P
  toDeltaLogRing :=
    { delta := P.δ
      α := (WittVector.teichmuller p).comp (nonZeroDivisors (PreTilt O p)).subtype
      deltaLog := fun _ => 0
      deltaLog_one := rfl
      alpha_pow_mul_deltaLog := by sorry
      deltaLog_mul := by sorry }
  delta_eq := rfl

/-- API `PrelogPrism.crystallineZeroLog` (constructor; node `PR.8/standard-log-prisms`): The prelog
prism (W(k), (p), N → W(k), 1 ↦ 0). -/
noncomputable def crystallineZeroLog (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (Q : Prism p (WittVector p k)) (hQ : Q.IsCrystalline) :
    PrelogPrism p (WittVector p k) (Multiplicative ℕ) :=
  zeroLog Q

/-- API `PrelogPrism.breuilKisinToCrystalline` (functoriality; node `PR.8/standard-log-prisms`): The
map of prelog prisms u ↦ 0 from the Breuil–Kisin prelog prism to (W(k), (p), N). -/
noncomputable def breuilKisinToCrystalline (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (E : Polynomial (WittVector p k)) (hEis : E.IsEisensteinAt (Ideal.span {(p : WittVector p k)}))
    (P : Prism p (PowerSeries (WittVector p k)))
    (hI : P.I = Ideal.span {(E : PowerSeries (WittVector p k))})
    (hφ : P.φ PowerSeries.X = PowerSeries.X ^ p)
    (Q : Prism p (WittVector p k)) (hQ : Q.IsCrystalline) :
    Hom (breuilKisin k E P hI hφ) (crystallineZeroLog k Q hQ) := sorry

/-- The map `u ↦ 0` underlying `breuilKisinToCrystalline`: the constant coefficient, identity on
the monoid. -/
theorem breuilKisinToCrystalline_spec (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (E : Polynomial (WittVector p k)) (hEis : E.IsEisensteinAt (Ideal.span {(p : WittVector p k)}))
    (P : Prism p (PowerSeries (WittVector p k)))
    (hI : P.I = Ideal.span {(E : PowerSeries (WittVector p k))})
    (hφ : P.φ PowerSeries.X = PowerSeries.X ^ p)
    (Q : Prism p (WittVector p k)) (hQ : Q.IsCrystalline) :
    (breuilKisinToCrystalline k E hEis P hI hφ Q hQ).toHom.ring =
        PowerSeries.constantCoeff (R := WittVector p k) ∧
      (breuilKisinToCrystalline k E hEis P hI hφ Q hQ).toHom.monoid = MonoidHom.id _ := by
  sorry

/-- API `PrelogPrism.breuilKisinToAinf` (functoriality; node `PR.8/standard-log-prisms`): The map of
prelog prisms u ↦ [π♭] to (A_inf, ker θ, O_C♭∖{0}), with N → O_C♭∖{0}, 1 ↦ π♭.

Lean form: a δ-ring map `f : W(k)⟦u⟧ → A_inf` with `f(u) = [π♭]` carrying `(E)` into `ker θ` is
upgraded to a map of prelog prisms with monoid map `n ↦ (π♭)ⁿ`; the existence of `f` (from `k → O♭`
and the choice of `π♭`) is the AI.0 input. -/
noncomputable def breuilKisinToAinf (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (E : Polynomial (WittVector p k)) (P : Prism p (PowerSeries (WittVector p k)))
    (hI : P.I = Ideal.span {(E : PowerSeries (WittVector p k))})
    (hφ : P.φ PowerSeries.X = PowerSeries.X ^ p)
    (O : Type u) [CommRing O] [Fact ¬IsUnit (p : O)] [IsAdicComplete (Ideal.span {(p : O)}) O]
    (Q : Prism p (WittVector p (PreTilt O p)))
    (hQI : Q.I = RingHom.ker (WittVector.fontaineTheta O p)) (hQφ : Q.φ = WittVector.frobenius)
    (πb : nonZeroDivisors (PreTilt O p))
    (f : PowerSeries (WittVector p k) →+* WittVector p (PreTilt O p))
    (hf : TauCeti.Prismatic.IsDeltaHom p P.δ Q.δ f)
    (hfX : f PowerSeries.X = WittVector.teichmuller p (πb : PreTilt O p))
    (hfI : P.I.map f ≤ Q.I) :
    Hom (breuilKisin k E P hI hφ) (ainf O Q hQI hQφ) where
  toHom :=
    { ring := f
      monoid := powersHom _ πb
      comm_alpha := by sorry
      comm_delta := by sorry
      comm_deltaLog := by sorry }
  map_ideal := by sorry

/-- Unit test `PrelogPrism.breuilKisin_frobenius` (computation; node `PR.8/standard-log-prisms`): In
the Breuil–Kisin prelog prism φ(u) = u^p and δ_log(1) = 0, so φ_M is multiplication by p on N. -/
theorem breuilKisin_frobenius (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (E : Polynomial (WittVector p k)) (P : Prism p (PowerSeries (WittVector p k)))
    (hI : P.I = Ideal.span {(E : PowerSeries (WittVector p k))})
    (hφ : P.φ PowerSeries.X = PowerSeries.X ^ p) (n : ℕ) :
    frob (breuilKisin k E P hI hφ).toDeltaLogRing.delta PowerSeries.X = PowerSeries.X ^ p ∧
      (breuilKisin k E P hI hφ).deltaLog (Multiplicative.ofAdd 1) = 0 ∧
      (breuilKisin k E P hI hφ).toDeltaLogRing.frobeniusMonoidOfRankOne
          (breuilKisin_isRankOne k E P hI hφ) (Multiplicative.ofAdd n) =
        Multiplicative.ofAdd (p * n) := by
  sorry

/-- Unit test `PrelogPrism.breuilKisin_mod_u` (compatibility; node `PR.8/standard-log-prisms`):
Reducing the Breuil–Kisin prelog prism along u ↦ 0 gives (W(k), (p), N → 0) since E(0) = p·unit.

Lean form: reduction along `u ↦ 0` (the constant coefficient) carries `I = (E)` onto `(p)` because
`E` is Eisenstein, so `breuilKisinToCrystalline` lands in the crystalline prelog prism. -/
theorem breuilKisin_mod_u (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (E : Polynomial (WittVector p k)) (hE : E.Monic)
    (hEis : E.IsEisensteinAt (Ideal.span {(p : WittVector p k)}))
    (P : Prism p (PowerSeries (WittVector p k)))
    (hI : P.I = Ideal.span {(E : PowerSeries (WittVector p k))}) :
    P.I.map (PowerSeries.constantCoeff (R := WittVector p k)) =
      Ideal.span {(p : WittVector p k)} := by
  sorry

/-- Unit test `PrelogPrism.ainf_rankOne` (characterisation; node `PR.8/standard-log-prisms`): In
(A_inf, ker θ, O_C♭∖{0}), δ([x]) = 0 for all x, so δ_log = 0 is forced (Lemma 2.1 of K1). -/
theorem ainf_rankOne (O : Type u) [CommRing O] [Fact ¬IsUnit (p : O)]
    [IsAdicComplete (Ideal.span {(p : O)}) O] (P : Prism p (WittVector p (PreTilt O p)))
    (hφ : P.φ = WittVector.frobenius) :
    (∀ x : PreTilt O p, P.δ.delta (WittVector.teichmuller p x) = 0) ∧
      ∀ D : DeltaLogRing p (WittVector p (PreTilt O p)) (nonZeroDivisors (PreTilt O p)),
        D.delta = P.δ →
        D.α = (WittVector.teichmuller p).comp (nonZeroDivisors (PreTilt O p)).subtype →
        D.IsRankOne := by
  sorry

/-- Unit test `PrelogPrism.breuilKisin_not_frobenius_u_plus_p` (non-example; node
`PR.8/standard-log-prisms`): With the Frobenius φ(u) = u^p + p on W(k)[[u]], (W(k)[[u]], (E), N → u)
is not a δ_log-ring of rank 1, and no δ_log exists since u^p does not divide δ(u) = 1. -/
theorem breuilKisin_not_frobenius_u_plus_p (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (δ : TauCeti.Delta.Structure p (PowerSeries (WittVector p k)))
    (hδ : frob δ PowerSeries.X = PowerSeries.X ^ p + (p : PowerSeries (WittVector p k))) :
    ¬ ∃ D : DeltaLogRing p (PowerSeries (WittVector p k)) (Multiplicative ℕ),
      D.delta = δ ∧ D.α = powersHom _ PowerSeries.X := by
  sorry

end PrelogPrism

namespace PrelogPrism

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type v} [CommMonoid M]

/-- Unit test `PrelogPrism.zero_log` (computation; node `PR.8/prelog-prism`): (Z_p, (p), N → Z_p, 1
↦ 0) is a bounded prelog prism of rank 1.

Lean form: for the prism `(ℤ_p, (p))` (every PR.0 prism on `ℤ_[p]` with `I = (p)`; the δ-structure
of `ℤ_p` is unique). -/
theorem zero_log (P : Prism p ℤ_[p]) (hP : P.IsCrystalline) :
    (zeroLog P).IsBounded ∧ (zeroLog P).IsRankOne ∧ (zeroLog P).α (Multiplicative.ofAdd 1) = 0 := by
  sorry

/-- Unit test `PrelogPrism.trivial_monoid` (degenerate; node `PR.8/prelog-prism`): With M = {e},
prelog prisms are exactly prisms. -/
theorem trivial_monoid :
    Function.Bijective (fun P : PrelogPrism p A PUnit.{v + 1} => P.toPrism) := by
  sorry

/-- Unit test `PrelogPrism.not_delta_pair` (non-example; node `PR.8/prelog-prism`): (Z_p[x], (x),
x^N) with δ(x) = 0 is a δ_log-triple of rank 1 that is not a prelog prism: x is not distinguished
and Z_p[x] is not (p, x)-complete. -/
theorem not_delta_pair (δ : TauCeti.Delta.Structure p (Polynomial ℤ_[p]))
    (hδ : δ.delta Polynomial.X = 0) :
    (∃ T : DeltaLogTriple p (Polynomial ℤ_[p]) (Multiplicative ℕ),
        T.delta = δ ∧ T.α = powersHom _ Polynomial.X ∧ T.ideal = Ideal.span {Polynomial.X} ∧
          T.toDeltaLogRing.IsRankOne) ∧
      ¬ ∃ P : PrelogPrism p (Polynomial ℤ_[p]) (Multiplicative ℕ),
        P.toPrism.δ = δ ∧ P.toPrism.I = Ideal.span {Polynomial.X} ∧
          P.α = powersHom _ Polynomial.X := by
  sorry

/-- Unit test `PrelogPrism.forget_compat` (compatibility; node `PR.8/prelog-prism`): The forgetful
functor to prisms sends (W(k), (p), N → 0) to PR.0's crystalline prism (W(k), (p)). -/
theorem forget_compat (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (Q : Prism p (WittVector p k)) (hQ : Q.IsCrystalline) :
    (crystallineZeroLog k Q hQ).toPrism = Q ∧ (crystallineZeroLog k Q hQ).toPrism.IsCrystalline ∧
      (crystallineZeroLog k Q hQ).α (Multiplicative.ofAdd 1) = 0 := by
  sorry

end PrelogPrism

/-! ## Node `PR.8/log-prism` (definition): Log prisms -/

/-- **Node `PR.8/log-prism`** (definition): Log prisms.

Let (A, I, M) be a bounded prelog prism. Then Spf(A) (with the (p, I)-adic topology; A is
classically (p, I)-complete) carries the associated log structure M^a_{Spf(A)} with its
δ_log-structure (Corollary 2.15). A log prism is a triple (A, I, M_{Spf(A)}) of a bounded prism (A,
I) and a log structure on Spf(A) with a δ_log-structure arising from some bounded prelog prism; (A,
I, M)^a denotes the associated log prism. A map of log prisms is a map of log formal schemes
inducing a map of prisms and preserving δ_log. Conversely (A, I, Γ(Spf(A), M_{Spf(A)})) is a prelog
prism. A map of bounded prelog prisms (A, I, M_A) → (B, J, Γ(Spf(B), M_{Spf(B)})) induces a unique
map of log prisms (A, I, M_A)^a → (B, J, M_{Spf(B)}). In the convention of Koshikawa–Yao, a ''log
prism'' (in quotation marks) is a bounded prelog prism whose (A, M_A) is a log ring; for (A, M_A) a
log ring with A classically p-complete the δ_log-structure induces the Frobenius lift φ(m) = m^p(1 +
pδ_log(m)).

Hypotheses (packet): Bounded prelog prism; A classically (p, I)-complete (BS Lemma 3.7).

Placeholder carrier (node `PR.8/log-prism`; log structures on the formal scheme `Spf(A)` are
`CrystallineCohomology:CR.5:log-algebra` objects): log prisms with underlying ring `A`. -/
def LogPrism (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A] : Type (u + 1) := sorry

namespace LogPrism

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]

/-- The underlying bounded prism of a log prism. -/
noncomputable def toPrism (L : LogPrism p A) : Prism p A := sorry

/-- Placeholder carrier (CR.5): the monoid `Γ(Spf(A), M_{Spf(A)})` of global sections of the log
structure. -/
def Sections (L : LogPrism p A) : Type u := sorry

noncomputable instance (L : LogPrism p A) : CommMonoid L.Sections := sorry

/-- Placeholder carrier (CR.5): maps of log prisms (maps of log formal schemes inducing maps of
prisms and preserving δ_log). -/
def Hom {B : Type u} [CommRing B] (L : LogPrism p A) (L' : LogPrism p B) : Type u := sorry

/-- API `LogPrism.ofPrelog` (constructor; node `PR.8/log-prism`): The associated log prism (A, I,
M)^a of a bounded prelog prism. -/
noncomputable def ofPrelog {M : Type v} [CommMonoid M] (P : PrelogPrism p A M)
    (hb : P.IsBounded) : LogPrism p A := sorry

/-- API `LogPrism.globalSections` (projection; node `PR.8/log-prism`): The prelog prism (A, I,
Γ(Spf(A), M_{Spf(A)})). -/
noncomputable def globalSections (L : LogPrism p A) : PrelogPrism p A L.Sections := sorry

theorem globalSections_toPrism (L : LogPrism p A) : L.globalSections.toPrism = L.toPrism := by
  sorry

theorem ofPrelog_toPrism {M : Type v} [CommMonoid M] (P : PrelogPrism p A M)
    (hb : P.IsBounded) : (ofPrelog P hb).toPrism = P.toPrism := by
  sorry

/-- API `LogPrism.homOfPrelog` (universal-property; node `PR.8/log-prism`): Maps of prelog prisms
(A, I, M_A) → (B, J, Γ(Spf(B), M)) correspond bijectively to maps of log prisms (A, I, M_A)^a → (B,
J, M). -/
noncomputable def homOfPrelog {M : Type v} [CommMonoid M] (P : PrelogPrism p A M)
    (hb : P.IsBounded) {B : Type u} [CommRing B] (L' : LogPrism p B) :
    PrelogPrism.Hom P L'.globalSections ≃ Hom (ofPrelog P hb) L' := sorry

/-- API `LogPrism.frobenius` (structure; node `PR.8/log-prism`): For a log prism the Frobenius lift
(φ_A, φ_M) of the log formal scheme Spf(A) (from delta-log-frobenius).

Lean form: the monoid part `φ_M` on global sections; the ring part is the prism's `φ`, and
`frobenius_alpha` is their compatibility. -/
noncomputable def frobenius (L : LogPrism p A) (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) :
    L.Sections →* L.Sections := sorry

theorem frobenius_alpha (L : LogPrism p A) (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A))
    (s : L.Sections) :
    L.globalSections.α (L.frobenius hp s) = L.toPrism.φ (L.globalSections.α s) := by
  sorry

/-! * API `LogPrism.IsIntegral` (other; node `PR.8/log-prism`): The log structure is integral.

  Not typed: integrality of a log structure is a stalkwise condition on the CR.5 log structure of
`Spf(A)`; global sections (`LogPrism.Sections`) do not detect it, and a `Prop` placeholder is not
used. -/

/-- API `LogPrism.trivial` (example; node `PR.8/log-prism`): Any bounded prism with the trivial log
structure O^×. -/
noncomputable def trivial (P : Prism p A) (hb : P.IsBounded) : LogPrism p A :=
  ofPrelog (PrelogPrism.trivialLog P) hb

/-- Unit test `LogPrism.trivial_frobenius` (degenerate; node `PR.8/log-prism`): For the trivial log
structure the Frobenius of the log prism is φ_A. -/
theorem trivial_frobenius (P : Prism p A) (hb : P.IsBounded)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) :
    ∃ e : (trivial P hb).Sections ≃* Aˣ, ∀ s, (e ((trivial P hb).frobenius hp s) : A) = P.φ (e s) := by
  sorry

/-- Unit test `LogPrism.bk_associated` (computation; node `PR.8/log-prism`): The associated log
structure of (W(k)[[u]], (E(u)), N → u^n) on Spf(W(k)[[u]]) (a single point for the (p, E)-adic
topology) has characteristic monoid M/O^× ≅ N, generated by u. -/
theorem bk_associated (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (E : Polynomial (WittVector p k)) (P : Prism p (PowerSeries (WittVector p k)))
    (hI : P.I = Ideal.span {(E : PowerSeries (WittVector p k))})
    (hφ : P.φ PowerSeries.X = PowerSeries.X ^ p)
    (hb : (PrelogPrism.breuilKisin k E P hI hφ).IsBounded) :
    ∃ e : Associates (ofPrelog (PrelogPrism.breuilKisin k E P hI hφ) hb).Sections ≃*
        Multiplicative ℕ,
      ∀ s, e (Associates.mk s) = Multiplicative.ofAdd 1 →
        Associated ((ofPrelog (PrelogPrism.breuilKisin k E P hI hφ) hb).globalSections.α s)
          PowerSeries.X := by
  sorry

/-! * Unit test `LogPrism.globalSections_not_inverse` (non-example; node `PR.8/log-prism`): (B, J,
Γ(Spf(B), M))^a → (B, J, M) need not be an isomorphism (K1 Remark 3.5): a log prism is not the same
as a prelog prism on global sections.

  Not typed: "need not be an isomorphism" needs isomorphisms of log prisms (composition and
identities of CR.5 maps of log formal schemes), which `LogPrism.Hom` does not carry. -/

/-- Unit test `LogPrism.forget_compat` (compatibility; node `PR.8/log-prism`): Forgetting the log
structure sends log prisms to PR.0's bounded prisms, and the trivial log prism functor is a section.
-/
theorem forget_compat (L : LogPrism p A) (P : Prism p A) (hb : P.IsBounded) :
    L.toPrism.IsBounded ∧ (trivial P hb).toPrism = P := by
  sorry

end LogPrism


/-! ## Node `PR.8/prelog-prismatic-envelope` (construction): Prelog prismatic envelopes -/

namespace PrelogPrism

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- The input of a prelog prismatic envelope over an orientable prelog prism `P` with integral
`M_A`: a δ_log-triple `(B, J, M_B)` over `P` and a surjection of prelog rings
`(B, M_B) → (B / J, N)` with `M_B`, `N` integral. -/
structure EnvelopeDatum (P : PrelogPrism p A M) where
  /-- The ring `B`. -/
  B : Type u
  [commRing : CommRing B]
  /-- The monoid `M_B`. -/
  MB : Type u
  [commMonoid : CommMonoid MB]
  /-- The δ_log-triple `(B, J, M_B)`. -/
  T : DeltaLogTriple p B MB
  /-- The structure map over `(A, I, M_A)`. -/
  structureMap : DeltaLogTriple.Hom P.toDeltaLogTriple T
  /-- The monoid `N`. -/
  N : Type u
  [commMonoidN : CommMonoid N]
  /-- The prelog structure of `B / J`. -/
  αN : N →* B ⧸ T.ideal
  /-- The surjection `M_B → N`. -/
  h : MB →* N
  comm : ∀ m, αN (h m) = Ideal.Quotient.mk T.ideal (T.α m)
  surj : Function.Surjective h
  orientable : P.toPrism.IsOrientable
  integral_A : IsCancelMul M
  integral_B : IsCancelMul MB
  integral_N : IsCancelMul N

attribute [instance] EnvelopeDatum.commRing EnvelopeDatum.commMonoid EnvelopeDatum.commMonoidN

/-- Placeholder carrier (node `PR.8/prelog-prismatic-envelope`): the ring `B′` of the prelog
prismatic envelope. -/
def EnvelopeRing {P : PrelogPrism p A M} (E : EnvelopeDatum P) : Type u := sorry

noncomputable instance {P : PrelogPrism p A M} (E : EnvelopeDatum P) :
    CommRing (EnvelopeRing E) := sorry

/-- Placeholder carrier (node `PR.8/prelog-prismatic-envelope`): the monoid `M_{B′}`. -/
def EnvelopeMonoid {P : PrelogPrism p A M} (E : EnvelopeDatum P) : Type u := sorry

noncomputable instance {P : PrelogPrism p A M} (E : EnvelopeDatum P) :
    CommMonoid (EnvelopeMonoid E) := sorry

/-- **Node `PR.8/prelog-prismatic-envelope`** (construction): Prelog prismatic envelopes.

Fix an orientable prelog prism (A, I, M_A) with M_A integral. Let (B, J, M_B) be a δ_log-triple over
(A, I, M_A) and (B, M_B) → (B/J, N) a surjection of prelog rings with M_B, N integral. There is a
universal map (B, J, M_B) → (B′, IB′, M_{B′}) of δ_log-triples over (A, I, M_A) to a prelog prism
with an exact surjection (B′, M_{B′}) → (B′/IB′, N); moreover M_{B′} is integral. It is called the
prelog prismatic envelope.

Hypotheses (packet): (A, I) orientable; M_A, M_B, N integral; (B, M_B) → (B/J, N) surjective.

API `PrelogPrism.envelope` (constructor; node `PR.8/prelog-prismatic-envelope`): The prelog
prismatic envelope (B′, IB′, M_{B′}) of (B, J, M_B) → (B/J, N) over (A, I, M_A). -/
noncomputable def envelope {P : PrelogPrism p A M} (E : EnvelopeDatum P) :
    PrelogPrism p (EnvelopeRing E) (EnvelopeMonoid E) := sorry

/-- The universal map `(B, J, M_B) → (B′, IB′, M_{B′})` of δ_log-triples. -/
noncomputable def envelope.map {P : PrelogPrism p A M} (E : EnvelopeDatum P) :
    DeltaLogTriple.Hom E.T (envelope E).toDeltaLogTriple := sorry

/-- The monoid map `M_{B′} → N` of the exact surjection `(B′, M_{B′}) → (B′ / IB′, N)`. -/
noncomputable def envelope.toN {P : PrelogPrism p A M} (E : EnvelopeDatum P) :
    EnvelopeMonoid E →* E.N := sorry

theorem envelope_ideal {P : PrelogPrism p A M} (E : EnvelopeDatum P) :
    (envelope E).toPrism.I = P.toPrism.I.map ((envelope.map E).toHom.ring.comp E.structureMap.toHom.ring) := by
  sorry

/-- API `PrelogPrism.envelope.lift` (universal-property; node `PR.8/prelog-prismatic-envelope`):
Maps of δ_log-triples from (B, J, M_B) to a prelog prism (C, IC, M_C) over (A, I, M_A) with an exact
surjection (C, M_C) → (C/IC, N) compatible with (B/J, N) factor uniquely through the envelope. -/
theorem envelope.lift {P : PrelogPrism p A M} (E : EnvelopeDatum P) {C : Type u} {MC : Type u}
    [CommRing C] [CommMonoid MC] (Q : PrelogPrism p C MC)
    (g : DeltaLogTriple.Hom P.toDeltaLogTriple Q.toDeltaLogTriple)
    (hQI : Q.toPrism.I = P.toPrism.I.map g.toHom.ring)
    (f : DeltaLogTriple.Hom E.T Q.toDeltaLogTriple)
    (hfg : f.toHom.ring.comp E.structureMap.toHom.ring = g.toHom.ring) (r : MC →* E.N)
    (hex : IsExactSurjection (Ideal.Quotient.mk Q.toPrism.I) r)
    (hr : ∀ m, r (f.toHom.monoid m) = E.h m) :
    ∃! F : Hom (envelope E) Q,
      F.toHom.ring.comp (envelope.map E).toHom.ring = f.toHom.ring ∧
        F.toHom.monoid.comp (envelope.map E).toHom.monoid = f.toHom.monoid := by
  sorry

/-- API `PrelogPrism.envelope.exactSurjective` (characterisation; node
`PR.8/prelog-prismatic-envelope`): (B′, M_{B′}) → (B′/IB′, N) is exact surjective. -/
theorem envelope.exactSurjective {P : PrelogPrism p A M} (E : EnvelopeDatum P) :
    IsExactSurjection (Ideal.Quotient.mk (envelope E).toPrism.I) (envelope.toN E) := by
  sorry

/-- API `PrelogPrism.envelope.monoid_integral` (other; node `PR.8/prelog-prismatic-envelope`):
M_{B′} is integral. -/
theorem envelope.monoid_integral {P : PrelogPrism p A M} (E : EnvelopeDatum P) :
    IsCancelMul (EnvelopeMonoid E) := by
  sorry

/-- API `PrelogPrism.envelope_of_exact` (compatibility; node `PR.8/prelog-prismatic-envelope`): For
an exact surjection the envelope is PR.0's prismatic envelope of (B, J) with the monoid M_B
unchanged.

Lean form: the monoid part (`M_{B′} = M_B`, via the universal map). The ring part ("PR.0's prismatic
envelope of `(B, J)`") refers to PR.0's `Prismatic.Envelope`, which is outside the PR.0 excerpt this
file is checked against. -/
theorem envelope_of_exact {P : PrelogPrism p A M} (E : EnvelopeDatum P)
    (hex : IsExactSurjection (Ideal.Quotient.mk E.T.ideal) E.h) :
    Function.Bijective (envelope.map E).toHom.monoid := by
  sorry

/-- The envelope datum `(A, I, M_A) → (A / I, M_A)` of a prelog prism itself. -/
noncomputable def EnvelopeDatum.self (P : PrelogPrism p A M) (ho : P.toPrism.IsOrientable)
    (hM : IsCancelMul M) : EnvelopeDatum P := sorry

/-- Unit test `PrelogPrism.envelope_identity` (degenerate; node `PR.8/prelog-prismatic-envelope`):
The envelope of (A, I, M_A) → (A/I, M_A) itself is (A, I, M_A). -/
theorem envelope_identity (P : PrelogPrism p A M) (ho : P.toPrism.IsOrientable)
    (hM : IsCancelMul M) :
    Function.Bijective (envelope.map (EnvelopeDatum.self P ho hM)).toHom.ring ∧
      Function.Bijective (envelope.map (EnvelopeDatum.self P ho hM)).toHom.monoid := by
  sorry

/-! * Unit test `PrelogPrism.envelope_trivial_log` (compatibility; node
`PR.8/prelog-prismatic-envelope`): With all monoids trivial, the prelog prismatic envelope is the
BS22 prismatic envelope.

  Not typed: compares with PR.0's prismatic envelope (`Prismatic.Envelope`), which is outside the
PR.0 excerpt this file is checked against. -/

/-! * Unit test `PrelogPrism.envelope_log_line_diagonal` (computation; node
`PR.8/prelog-prismatic-envelope`): For (A⟨X_0, X_1⟩, X_0^N X_1^N) → (A/I⟨X_0⟩, X_0^N) the envelope
is the completion of A⟨X_0, X_1⟩{(I, X_1/X_0 − 1)/I}_δ with monoid X_0^N(X_1/X_0)^Z (K1 §5.4).

  Not typed: the restricted power series rings `A⟨X_0, X_1⟩`, their δ-structures and `(p,
I)`-completions of δ-envelopes are not in Mathlib. -/

/-! * Unit test `PrelogPrism.envelope_not_without_exactification` (non-example; node
`PR.8/prelog-prismatic-envelope`): Without exactification the non-log prismatic envelope of (A⟨X_0,
X_1⟩, (I, X_1 − X_0)) gives the non-log Čech nerve, whose Hodge–Tate cohomology is ordinary Ω, not
log Ω.

  Not typed: concerns Hodge–Tate cohomology of a non-log Čech nerve over restricted power series
rings; neither is available. -/

end PrelogPrism

/-! ## Node `PR.8/log-prismatic-envelope` (theorem): Universal property of log prismatic envelopes -/

namespace PrelogPrism

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- Placeholder category (node `PR.8/log-prismatic-envelope`, with CR.5 exact closed immersions
of log formal schemes): commutative squares whose top arrow is an exact closed immersion
`(Spf(C/IC), N^a) ↪ (Spf(C), M_{Spf(C)})` for log prisms with integral log structure over
`(Spf(B/J), N^a) → (Spf(B), M_B^a)`. -/
def LogEnvelopeSquares {P : PrelogPrism p A M} (E : EnvelopeDatum P) : Type (u + 1) := sorry

noncomputable instance {P : PrelogPrism p A M} (E : EnvelopeDatum P) :
    Category.{u} (LogEnvelopeSquares E) := sorry

/-- The square of the associated log prism `(B′, IB′, M_{B′})^a` of a bounded envelope. -/
noncomputable def envelopeSquare {P : PrelogPrism p A M} (E : EnvelopeDatum P)
    (hb : (envelope E).IsBounded) : LogEnvelopeSquares E := sorry

/-- **Node `PR.8/log-prismatic-envelope`** (theorem): Universal property of log prismatic envelopes.

In the situation of the prelog prismatic envelope, assume (B′, IB′, M_{B′}) is bounded. Then (B′,
IB′, M_{B′})^a with the exact closed immersion (Spf(B′/IB′), N^a) ↪ (Spf(B′), M^a_{B′}) is final
among commutative squares with top arrow an exact closed immersion (Spf(C/IC), N^a) ↪ (Spf(C),
M_{Spf(C)}) for log prisms (C, IC, M_{Spf(C)}) with integral log structure over (Spf(B/J), N^a) →
(Spf(B), M^a_B). Key lemma: for such a log prism, with N^a_{C/I} := Γ(Spf(C/IC), N^a), the map (C,
Γ(Spf(C), M_{Spf(C)})) → (C/IC, N^a_{C/I}) is exact surjective and a (1 + IC)-torsor on monoids.

Hypotheses (packet): (A, I, M_A) orientable with integral M_A; the prelog prismatic envelope is
bounded.

Lean form of the finality; the key lemma (exactness and the `(1 + IC)`-torsor) is about sections of
CR.5 log structures and is not typed. -/
theorem envelopeSquare_isTerminal {P : PrelogPrism p A M} (E : EnvelopeDatum P)
    (hb : (envelope E).IsBounded) : Nonempty (Limits.IsTerminal (envelopeSquare E hb)) := by
  sorry

end PrelogPrism

/-! ## Node `PR.8/envelope-flatness-smooth` (theorem): Flatness of prelog prismatic envelopes for smooth log algebras -/

namespace PrelogPrism

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`, Koshikawa smoothness):
envelope data as in node `PR.8/envelope-flatness-smooth` (1) or (2) — a surjection onto a
`p`-completely smooth prelog ring over `(A / I, M_A)` satisfying the chart hypotheses (∗) and weak
finite generation, from the `(p, I)`-completed free δ_log-ring, resp. from a smooth δ_log-ring
with a smooth chart. -/
def SmoothEnvelopeDatum (P : PrelogPrism p A M) : Type (u + 1) := sorry

/-- The underlying envelope datum. -/
noncomputable def SmoothEnvelopeDatum.toEnvelopeDatum {P : PrelogPrism p A M}
    (S : SmoothEnvelopeDatum P) : EnvelopeDatum P := sorry

/-- **Node `PR.8/envelope-flatness-smooth`** (theorem): Flatness of prelog prismatic envelopes for
smooth log algebras.

Fix a bounded prelog prism (A, I, M_A) with M_A integral. (1) Let (B_0, M_B) be a prelog ring over
(A, M_A) with M_B integral and (B_0, M_B) → (B_0/J, N) a surjection onto a p-completely smooth
prelog ring over (A/I, M_A) (smooth in Koshikawa's Appendix A sense). Assume M_A → N is integral, N
is weakly finitely generated over M_A, and (∗): M_A → M_B is injective and integral, M_B^gp/M_A^gp
is free abelian, and B_0 is (p, I)-completely free over the completion of A ⊗_{Z_(p)[M_A]}
Z_(p)[M_B]. Let (B, M_B) be the (p, I)-completed free δ_log-ring over (A, M_A) generated by (B_0,
M_B). Then the prelog prismatic envelope (B′, IB′, M_{B′}) of (B, (JB)^∧, M_B) exists, is (p,
I)-completely flat over A (hence bounded), and its formation commutes with base change on (A, I,
M_A) and with (p, I)-completely flat base change on B_0. (2) Variant: if (B, M_B) is a (p,
I)-completely smooth δ_log-ring over (A, M_A) with M_A → M_B a smooth chart, (B, M_B) → (R, P) a
surjection onto a p-completely smooth prelog ring over (A/I, M_A) with M_A → P integral, then the
prelog prismatic envelope exists, is (p, I)-completely flat over A and commutes with base change on
(A, I, M_A).

Hypotheses (packet): (A, I, M_A) bounded with M_A integral; smoothness in the sense of Koshikawa
Appendix A (CR.5); hypotheses (∗) and weak finite generation in (1).

Lean form: boundedness of the envelope. `(p, I)`-complete flatness over `A` and the base-change
assertions are not typed: Mathlib has no notion of completely flat modules. -/
theorem SmoothEnvelopeDatum.envelope_isBounded {P : PrelogPrism p A M} (hb : P.IsBounded)
    (S : SmoothEnvelopeDatum P) : (envelope S.toEnvelopeDatum).IsBounded := by
  sorry

end PrelogPrism

/-! ## Node `PR.8/perfectoid-monoid` (definition): Perfectoid monoids and perfectoid log rings -/

namespace Monoid

variable (M : Type*) [CommMonoid M] (p : ℕ)

/-- **Node `PR.8/perfectoid-monoid`** (definition): Perfectoid monoids and perfectoid log rings.

For a commutative monoid M its tilt is M♭ := lim_{m ↦ m^p} M; M♭ and M♭/(M♭)^× are uniquely
p-divisible. M is perfectoid if M♭/(M♭)^× → M/M^× is an isomorphism; perfect if M is uniquely
p-divisible (M♭ → M an isomorphism); pseudo-perfectoid if M/M^× is uniquely p-divisible. A pre-log
ring (R, M) is perfectoid if R is a perfectoid ring (in the sense of BMS1) and M is perfectoid; then
(R, M♭) → (R, M) induces an isomorphism of associated log rings, and the tilt (R♭, M♭) with α♭(m_0,
m_1, …) = (α(m_0), α(m_1), …) and A_inf(R) := (W(R♭), M♭ → W(R♭), m ↦ [α♭(m)]) are defined. An
integral log ring (R, M) is a perfectoid log ring if it is perfectoid as a pre-log ring,
equivalently R is perfectoid and M/M^× is uniquely p-divisible.

Hypotheses (packet): p fixed; R perfectoid in the sense of BMS1 (as used by PR.0).

API `Monoid.tilt` (constructor; node `PR.8/perfectoid-monoid`): M♭ = lim_{m ↦ m^p} M, Mathlib's
monoid perfection of M at p. -/
abbrev tilt : Type _ := Perfection M p

/-- API `Monoid.IsPerfect` (other; node `PR.8/perfectoid-monoid`): M is uniquely p-divisible. -/
def IsPerfect : Prop :=
  Function.Bijective (fun m : M => m ^ p)

/-- API `Monoid.IsPseudoPerfectoid` (other; node `PR.8/perfectoid-monoid`): M/M^× is uniquely
p-divisible. -/
def IsPseudoPerfectoid : Prop :=
  Function.Bijective (fun a : Associates M => a ^ p)

/-- API `Monoid.IsPerfectoid` (other; node `PR.8/perfectoid-monoid`): M♭/(M♭)^× → M/M^× is
bijective.

Lean form: the map `M♭ / (M♭)ˣ → M / Mˣ` induced by the zeroth coordinate is bijective, stated
elementwise. -/
def IsPerfectoid : Prop :=
  (∀ m : M, ∃ x : tilt M p, ∃ u : Mˣ, Perfection.coeffMonoidHom M p 0 x = m * u) ∧
    ∀ x y : tilt M p, (∃ u : Mˣ, Perfection.coeffMonoidHom M p 0 x =
      Perfection.coeffMonoidHom M p 0 y * u) → ∃ v : (tilt M p)ˣ, x = y * v

variable {M p}

/-- API `Monoid.IsPerfect.isPerfectoid` (relation; node `PR.8/perfectoid-monoid`): Perfect monoids
are perfectoid. -/
theorem IsPerfect.isPerfectoid (h : IsPerfect M p) : IsPerfectoid M p := by
  sorry

/-- API `Monoid.IsPerfectoid.isPseudoPerfectoid` (relation; node `PR.8/perfectoid-monoid`):
Perfectoid monoids are pseudo-perfectoid. -/
theorem IsPerfectoid.isPseudoPerfectoid (h : IsPerfectoid M p) : IsPseudoPerfectoid M p := by
  sorry

/-- Unit test `Monoid.isPerfectoid_units` (degenerate; node `PR.8/perfectoid-monoid`): Every group
is perfectoid in this sense since M/M^× is trivial; its tilt is lim_{x ↦ x^p} M. -/
theorem isPerfectoid_units (G : Type*) [CommGroup G] : IsPerfectoid G p := by
  sorry

/-- Unit test `Monoid.tilt_nat_inv_p` (computation; node `PR.8/perfectoid-monoid`): For M = N[1/p]
(additive), M♭ ≅ N[1/p] and M is perfect. -/
theorem tilt_nat_inv_p [Fact p.Prime] :
    Nonempty (tilt (NatInvP p) p ≃* NatInvP p) ∧ IsPerfect (NatInvP p) p := by
  sorry

/-! * Unit test `Monoid.valuationMonoid_perfectoid_not_perfect` (non-example; node
`PR.8/perfectoid-monoid`): O_C∖{0} for C algebraically closed perfectoid is perfectoid but not
perfect, since 1 + p has many p-th roots.

  Not typed: needs an algebraically closed perfectoid field `C` and its valuation ring `O_C`
(PerfectoidQuotients), which Mathlib does not provide. -/

/-! * Unit test `Monoid.pseudoPerfectoid_not_perfectoid` (non-example; node
`PR.8/perfectoid-monoid`): The monoid generated by x_0, x_1, …, y_1^{±1}, … with x_j^p = x_{j−1}y_j
is pseudo-perfectoid with M/M^× ≅ N[1/p] but M♭ = 0.

  Not typed: the monoid is given by generators and relations; Mathlib has no presentations of
commutative monoids, and naming it by an unconstrained type would not determine it. -/

/-- Unit test `Monoid.tilt_compat_pretilt` (compatibility; node `PR.8/perfectoid-monoid`): For an
integral perfectoid ring R, the multiplicative monoid of PreTilt agrees with Monoid.tilt of (R, ·)
under the multiplicative bijection R♭ ≅ lim_{x ↦ x^p} R.

Lean form: for a `p`-adically complete ring `O` with `p` not a unit (as for integral perfectoid
rings), Mathlib's `PreTilt O p` is multiplicatively `Monoid.tilt O p`, compatibly with the untilt
map. -/
theorem tilt_compat_pretilt [Fact p.Prime] (O : Type u) [CommRing O] [Fact ¬IsUnit (p : O)]
    [IsAdicComplete (Ideal.span {(p : O)}) O] :
    ∃ e : PreTilt O p ≃* tilt O p, ∀ x, Perfection.coeffMonoidHom O p 0 (e x) = x.untilt := by
  sorry

end Monoid

/-- Placeholder carrier (owner `PerfectoidQuotients:Q0:integral-algebra`): perfectoid rings in
the sense of BMS1 (PR.0's convention), as a type of bundled rings. -/
def PerfectoidRing (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

namespace PerfectoidRing

variable {p : ℕ} [Fact p.Prime]

/-- The underlying ring. -/
def carrier (R : PerfectoidRing.{u} p) : Type u := sorry

noncomputable instance (R : PerfectoidRing.{u} p) : CommRing R.carrier := sorry

instance (R : PerfectoidRing.{u} p) : Fact ¬IsUnit (p : R.carrier) := sorry

instance (R : PerfectoidRing.{u} p) : IsAdicComplete (Ideal.span {(p : R.carrier)}) R.carrier :=
  sorry

end PerfectoidRing

namespace PrelogRing

variable {p : ℕ} [Fact p.Prime]

/-- API `PrelogRing.tilt` (constructor; node `PR.8/perfectoid-monoid`): For a perfectoid pre-log
ring (R, M), the pre-log ring (R♭, M♭, α♭).

Lean form: `α♭ : M♭ → R♭`, `(m_0, m_1, …) ↦ (α(m_0), α(m_1), …)` read in `R♭ = PreTilt R p` through
the multiplicative identification `tilt_compat_pretilt`; defined for every `p`-adically complete
`R`. -/
noncomputable def tilt {R : Type u} [CommRing R] [Fact ¬IsUnit (p : R)]
    [IsAdicComplete (Ideal.span {(p : R)}) R] {M : Type v} [CommMonoid M] (α : M →* R) :
    Monoid.tilt M p →* PreTilt R p := sorry

theorem tilt_untilt {R : Type u} [CommRing R] [Fact ¬IsUnit (p : R)]
    [IsAdicComplete (Ideal.span {(p : R)}) R] {M : Type v} [CommMonoid M] (α : M →* R)
    (x : Monoid.tilt M p) : (tilt α x).untilt = α (Perfection.coeffMonoidHom M p 0 x) := by
  sorry

/-- API `PrelogRing.ainf` (constructor; node `PR.8/perfectoid-monoid`): A_inf(R) = (W(R♭), M♭ →
W(R♭), m ↦ [α♭(m)]). -/
noncomputable def ainf {R : Type u} [CommRing R] [Fact ¬IsUnit (p : R)]
    [IsAdicComplete (Ideal.span {(p : R)}) R] {M : Type v} [CommMonoid M] (α : M →* R) :
    Monoid.tilt M p →* WittVector p (PreTilt R p) :=
  (WittVector.teichmuller p).comp (tilt α)

end PrelogRing

namespace PerfectoidLogRing

variable {p : ℕ} [Fact p.Prime]

/-- API `PerfectoidLogRing.iff_pseudoPerfectoid` (characterisation; node `PR.8/perfectoid-monoid`):
For an integral log ring (R, M) with R perfectoid, M is perfectoid iff M/M^× is uniquely
p-divisible. -/
theorem iff_pseudoPerfectoid (R : PerfectoidRing.{u} p) {M : Type u} [CommMonoid M]
    [IsCancelMul M] (α : M →* R.carrier) (hlog : DeltaLogRing.IsLogRing α) :
    Monoid.IsPerfectoid M p ↔ Monoid.IsPseudoPerfectoid M p := by
  sorry

end PerfectoidLogRing

/-! ## Node `PR.8/perfect-log-prism` (definition): Perfect log prisms -/

/-- A ''log prism'' in the convention of Koshikawa–Yao: a bounded prelog prism whose `(A, M_A)` is
a log ring. The membership of `p` in the Jacobson radical is the consequence of completeness used
for the monoid Frobenius (recorded explicitly, PR.0 convention). -/
structure LogPrismKY (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A] (M : Type v)
    [CommMonoid M] extends PrelogPrism p A M where
  bounded : toPrism.IsBounded
  isLogRing : DeltaLogRing.IsLogRing toDeltaLogRing.α
  p_mem_jacobson : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)

namespace LogPrismKY

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]

/-- The ''log prism'' of a bounded prelog prism, with its associated log structure. -/
noncomputable def ofPrelog {M : Type v} [CommMonoid M] (P : PrelogPrism p A M) (hb : P.IsBounded)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) :
    LogPrismKY p A (DeltaLogRing.AssocLogMonoid P.α) := sorry

/-- The ''log prism'' with the trivial log structure `Aˣ`. -/
noncomputable def trivial (P : Prism p A) (hb : P.IsBounded)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) : LogPrismKY p A Aˣ where
  toPrelogPrism := PrelogPrism.trivialLog P
  bounded := hb
  isLogRing := by sorry
  p_mem_jacobson := hp

end LogPrismKY

namespace LogPrism

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type v} [CommMonoid M]

/-- **Node `PR.8/perfect-log-prism`** (definition): Perfect log prisms.

A ''log prism'' (A, I, M_A) (bounded prelog prism with (A, M_A) a log ring) is perfect if M_A is
integral and its Frobenius (φ_A, φ_{M_A}) is an isomorphism. If (A, I) is perfect, (A, I, M_A) is
perfect iff M_A/A^× is uniquely p-divisible; a perfect ''log prism'' has p-saturated monoid. Every
integral ''log prism'' has a perfection (A_perf, IA_perf, M_{A,perf}): the colimit perfection of A
with the log structure associated to colim_φ M_A → A_perf. For a perfectoid integral pre-log ring
(R, M), (A_inf(R), ker θ, M♭)^a is perfect and of rank 1.

Hypotheses (packet): Integral monoid; (A, M_A) a log ring; boundedness as for log prisms.

API `LogPrism.IsPerfect` (other; node `PR.8/perfect-log-prism`): M_A integral and (φ_A, φ_{M_A})
bijective.

Lean form: on PR.0's prism, perfectness of the ring Frobenius is `Prism.IsPerfect`; the monoid
Frobenius is `DeltaLogRing.frobeniusMonoid`. -/
def IsPerfect (L : LogPrismKY p A M) : Prop :=
  IsCancelMul M ∧ L.toPrism.IsPerfect ∧
    Function.Bijective (L.toDeltaLogRing.frobeniusMonoid L.isLogRing L.p_mem_jacobson)

/-- API `LogPrism.isPerfect_iff_uniquelyDivisible` (characterisation; node
`PR.8/perfect-log-prism`): For perfect (A, I): perfect iff M_A/A^× is uniquely p-divisible. -/
theorem isPerfect_iff_uniquelyDivisible (L : LogPrismKY p A M) (hA : L.toPrism.IsPerfect) :
    IsPerfect L ↔ IsCancelMul M ∧ Function.Bijective (fun a : Associates M => a ^ p) := by
  sorry

/-- API `LogPrism.IsPerfect.pSaturated` (relation; node `PR.8/perfect-log-prism`): A perfect ''log
prism'' has p-saturated monoid. -/
theorem IsPerfect.pSaturated {L : LogPrismKY p A M} (h : IsPerfect L)
    (x : Algebra.GrothendieckGroup M)
    (hx : x ^ p ∈ MonoidHom.mrange (Algebra.GrothendieckGroup.of (M := M))) :
    x ∈ MonoidHom.mrange (Algebra.GrothendieckGroup.of (M := M)) := by
  sorry

/-- Placeholder carrier (node `PR.8/perfect-log-prism`): the ring `A_perf` (colimit perfection). -/
def PerfectionRing (L : LogPrismKY p A M) : Type u := sorry

noncomputable instance (L : LogPrismKY p A M) : CommRing (PerfectionRing L) := sorry

/-- Placeholder carrier (node `PR.8/perfect-log-prism`): the log monoid `M_{A,perf}`
associated with `colim_φ M_A → A_perf`. -/
def PerfectionMonoid (L : LogPrismKY p A M) : Type (max u v) := sorry

noncomputable instance (L : LogPrismKY p A M) : CommMonoid (PerfectionMonoid L) := sorry

/-- API `LogPrism.perfection` (constructor; node `PR.8/perfect-log-prism`): The perfection (A_perf,
IA_perf, M_{A,perf}) of an integral ''log prism''. -/
noncomputable def perfection (L : LogPrismKY p A M) (hM : IsCancelMul M) :
    LogPrismKY p (PerfectionRing L) (PerfectionMonoid L) := sorry

/-- The map `(A, I, M_A) → (A_perf, IA_perf, M_{A,perf})`. -/
noncomputable def perfection.map (L : LogPrismKY p A M) (hM : IsCancelMul M) :
    PrelogPrism.Hom L.toPrelogPrism (perfection L hM).toPrelogPrism := sorry

theorem perfection_isPerfect (L : LogPrismKY p A M) (hM : IsCancelMul M) :
    IsPerfect (perfection L hM) := by
  sorry

/-- API `LogPrism.perfection.lift` (universal-property; node `PR.8/perfect-log-prism`): Maps from an
integral ''log prism'' to a perfect one factor uniquely through its perfection. -/
theorem perfection.lift (L : LogPrismKY p A M) (hM : IsCancelMul M) {B : Type u} [CommRing B]
    {N : Type v} [CommMonoid N] (L' : LogPrismKY p B N) (hL' : IsPerfect L')
    (f : PrelogPrism.Hom L.toPrelogPrism L'.toPrelogPrism) :
    ∃! g : PrelogPrism.Hom (perfection L hM).toPrelogPrism L'.toPrelogPrism,
      g.toHom.ring.comp (perfection.map L hM).toHom.ring = f.toHom.ring ∧
        g.toHom.monoid.comp (perfection.map L hM).toHom.monoid = f.toHom.monoid := by
  sorry

/-- API `LogPrism.ainfPerfect` (example; node `PR.8/perfect-log-prism`): (A_inf(R), ker θ, M♭)^a is
perfect of rank 1 for a perfectoid integral pre-log ring (R, M).

Lean form: for a perfectoid ring `R` (placeholder `PerfectoidRing`, Q0) with integral perfectoid
prelog structure, the prelog prism `(A_inf(R), ker θ, M♭)` on a PR.0 prism with `I = ker θ` and Witt
Frobenius is of rank one and its associated ''log prism'' is perfect. -/
theorem ainfPerfect (R : PerfectoidRing.{u} p) {N : Type u} [CommMonoid N] [IsCancelMul N]
    (αR : N →* R.carrier) (hN : Monoid.IsPerfectoid N p)
    (P : Prism p (WittVector p (PreTilt R.carrier p)))
    (hI : P.I = RingHom.ker (WittVector.fontaineTheta R.carrier p))
    (hφ : P.φ = WittVector.frobenius)
    (D : DeltaLogRing p (WittVector p (PreTilt R.carrier p)) (Monoid.tilt N p))
    (hD : D.delta = P.δ) (hDα : D.α = PrelogRing.ainf αR)
    (hb : (PrelogPrism.mk P D hD).IsBounded)
    (hp : (p : WittVector p (PreTilt R.carrier p)) ∈ Ideal.jacobson ⊥) :
    D.IsRankOne ∧ IsPerfect (LogPrismKY.ofPrelog (PrelogPrism.mk P D hD) hb hp) := by
  sorry

/-- Unit test `LogPrism.ainf_isPerfect` (computation; node `PR.8/perfect-log-prism`): (A_inf, (ξ),
O_C♭∖{0})^a is a perfect log prism. -/
theorem ainf_isPerfect (O : Type u) [CommRing O] [Fact ¬IsUnit (p : O)]
    [IsAdicComplete (Ideal.span {(p : O)}) O] [IsDomain (PreTilt O p)]
    (P : Prism p (WittVector p (PreTilt O p)))
    (hI : P.I = RingHom.ker (WittVector.fontaineTheta O p)) (hφ : P.φ = WittVector.frobenius)
    (hb : (PrelogPrism.ainf O P hI hφ).IsBounded)
    (hp : (p : WittVector p (PreTilt O p)) ∈ Ideal.jacobson ⊥) :
    IsPerfect (LogPrismKY.ofPrelog (PrelogPrism.ainf O P hI hφ) hb hp) := by
  sorry

/-- Unit test `LogPrism.trivial_isPerfect_iff` (degenerate; node `PR.8/perfect-log-prism`): With the
trivial log structure, a log prism is perfect iff the underlying prism is perfect. -/
theorem trivial_isPerfect_iff (P : Prism p A) (hb : P.IsBounded)
    (hp : (p : A) ∈ Ideal.jacobson (⊥ : Ideal A)) :
    IsPerfect (LogPrismKY.trivial P hb hp) ↔ P.IsPerfect := by
  sorry

/-- Unit test `LogPrism.breuilKisin_not_perfect` (non-example; node `PR.8/perfect-log-prism`): The
Breuil–Kisin log prism (W(k)[[u]], (E), N) is not perfect: u is not a p-th power and φ is not
surjective. -/
theorem breuilKisin_not_perfect (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (E : Polynomial (WittVector p k)) (P : Prism p (PowerSeries (WittVector p k)))
    (hI : P.I = Ideal.span {(E : PowerSeries (WittVector p k))})
    (hφ : P.φ PowerSeries.X = PowerSeries.X ^ p)
    (hb : (PrelogPrism.breuilKisin k E P hI hφ).IsBounded)
    (hp : (p : PowerSeries (WittVector p k)) ∈ Ideal.jacobson ⊥) :
    ¬ IsPerfect (LogPrismKY.ofPrelog (PrelogPrism.breuilKisin k E P hI hφ) hb hp) ∧
      ¬ Function.Surjective P.φ := by
  sorry

/-- Unit test `LogPrism.zeroLog_perfect` (characterisation; node `PR.8/perfect-log-prism`): (W(k),
(p), N → 0)^a is not perfect (N is not p-divisible), while its perfection has monoid N[1/p] modulo
units. -/
theorem zeroLog_perfect (k : Type u) [Field k] [CharP k p] [PerfectRing k p]
    (Q : Prism p (WittVector p k)) (hQ : Q.IsCrystalline)
    (hb : (PrelogPrism.crystallineZeroLog k Q hQ).IsBounded)
    (hp : (p : WittVector p k) ∈ Ideal.jacobson ⊥) :
    ¬ IsPerfect (LogPrismKY.ofPrelog (PrelogPrism.crystallineZeroLog k Q hQ) hb hp) ∧
      Nonempty (Associates (PerfectionMonoid
        (LogPrismKY.ofPrelog (PrelogPrism.crystallineZeroLog k Q hQ) hb hp)) ≃* NatInvP p) := by
  sorry

end LogPrism

/-! ## Node `PR.8/perfect-log-prisms-perfectoid` (theorem): Perfect log prisms are perfectoid log rings -/

/-- Placeholder category (node `PR.8/perfect-log-prisms-perfectoid`): perfect ''log prisms''
(bundled `LogPrismKY` with `LogPrism.IsPerfect`) and their maps. -/
def PerfectLogPrismCat (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

noncomputable instance (p : ℕ) [Fact p.Prime] : Category.{u} (PerfectLogPrismCat.{u} p) := sorry

/-- Placeholder category (owners `PerfectoidQuotients:Q0` and `CrystallineCohomology:CR.5`):
perfectoid log rings (integral log rings `(R, M)` with `R` perfectoid and `M / Mˣ` uniquely
`p`-divisible). -/
def PerfectoidLogRingCat (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

noncomputable instance (p : ℕ) [Fact p.Prime] : Category.{u} (PerfectoidLogRingCat.{u} p) := sorry

/-- The functor `(A, I, M_A) ↦ (A / I, M_A)^a`. -/
noncomputable def PerfectLogPrismCat.reduction (p : ℕ) [Fact p.Prime] :
    PerfectLogPrismCat.{u} p ⥤ PerfectoidLogRingCat.{u} p := sorry

/-- The functor `(R, M) ↦ (A_inf(R), ker θ, M♭)^a`. -/
noncomputable def PerfectoidLogRingCat.ainf (p : ℕ) [Fact p.Prime] :
    PerfectoidLogRingCat.{u} p ⥤ PerfectLogPrismCat.{u} p := sorry

/-- **Node `PR.8/perfect-log-prisms-perfectoid`** (theorem): Perfect log prisms are perfectoid log
rings.

The functor (A, I, M_A) ↦ (A/I, M_A)^a is an equivalence from perfect ''log prisms'' to perfectoid
log rings, with quasi-inverse (R, M) ↦ (A_inf(R), ker θ, M♭)^a ≅ (A_inf(R), ker θ, M♭_{R/p})^a. In
particular every perfect ''log prism'' admits a chart N → A of rank 1. Moreover, for a perfectoid
integral pre-log ring (R, M) and an integral ''log prism'' (A, I, M_A), every map (R, M) → (A/I,
M_A)^a of pre-log rings lifts uniquely to a map of pre-log prisms (A_inf(R), ker θ, M♭) → (A, I,
M_A); so (A_inf(R), ker θ, M♭)^a is initial among integral ''log prisms'' under (R, M) (also with
exact-surjection or associated-log variants).

Hypotheses (packet): Perfect ''log prisms'' are integral and bounded; the lifting statement assumes
(A, I, M_A) bounded and integral.

Lean form: the equivalence with its quasi-inverse; the rank-one chart and the lifting statement for
integral ''log prisms'' are not typed (they quantify over CR.5 maps of pre-log rings into associated
log rings). -/
theorem PerfectLogPrismCat.reduction_isEquivalence (p : ℕ) [Fact p.Prime] :
    (PerfectLogPrismCat.reduction.{u} p).IsEquivalence ∧
      Nonempty (PerfectoidLogRingCat.ainf.{u} p ⋙ PerfectLogPrismCat.reduction.{u} p ≅
        𝟭 (PerfectoidLogRingCat.{u} p)) := by
  sorry

/-! ## Node `PR.8/perfectoid-prelog-cotangent` (lemma): Log cotangent complexes of perfectoid pre-log rings -/

/-- Placeholder (owner `DerivedDeRhamCohomology:DD.6`): Gabber's log cotangent complex
`L_{(S, N)/(R, M)}` of a map of prelog rings, in `D(S)`. -/
noncomputable def logCotangent {R S : Type u} [CommRing R] [CommRing S] [Algebra R S]
    {M N : Type u} [CommMonoid M] [CommMonoid N] (αM : M →* R) (αN : N →* S) (h : M →* N) :
    DerivedCategory (ModuleCat.{u} S) := sorry

/-- Placeholder (owner `DerivedDeRhamCohomology:DD.1`): derived `J`-adic completion on `D(S)`. -/
noncomputable def derivedCompletion {S : Type u} [CommRing S] (J : Ideal S) :
    DerivedCategory (ModuleCat.{u} S) ⥤ DerivedCategory (ModuleCat.{u} S) := sorry

/-- **Node `PR.8/perfectoid-prelog-cotangent`** (lemma): Log cotangent complexes of perfectoid
pre-log rings.

Let (R, M) be a perfectoid (or pseudo-perfectoid) pre-log ring and Z_p the trivial pre-log ring.
Then the natural map L̂_{R/Z_p} → L̂_{(R,M)/Z_p} of p-completed (Gabber) log cotangent complexes is
an isomorphism; equivalently L̂_{(R,M)/R} = 0; in particular L̂_{(R,M)/Z_p}[−1]{−1} ≅ R. For a map
f: (R, M) → (S, N) of perfectoid pre-log rings, L̂_{(S,N)/(R,M)} = 0.

Hypotheses (packet): Perfectoid or pseudo-perfectoid pre-log rings; p-completed Gabber log cotangent
complex as supplied by DD.6.

Lean form: `L̂_{(R, M)/R} = 0` (the base `R` with the trivial prelog structure `{e}`), for `R`
perfectoid (placeholder `PerfectoidRing`) and `M` perfectoid or pseudo-perfectoid; the
identification `L̂_{(R,M)/ℤ_p}[−1]{−1} ≅ R` and the relative statement for maps are not typed. -/
theorem perfectoid_logCotangent_zero {p : ℕ} [Fact p.Prime] (R : PerfectoidRing.{u} p) {M : Type u}
    [CommMonoid M] (α : M →* R.carrier)
    (hM : Monoid.IsPerfectoid M p ∨ Monoid.IsPseudoPerfectoid M p) :
    Limits.IsZero ((derivedCompletion (Ideal.span {(p : R.carrier)})).obj
      (logCotangent (R := R.carrier) (S := R.carrier) (1 : PUnit.{u + 1} →* R.carrier) α 1)) := by
  sorry


/-! ## The relative theory: base, prelog algebras and shared placeholders -/

/-- The base of the relative theory (standing hypothesis of K1 §§4–7 and KY): a bounded prelog
prism whose monoid `M_A` is integral (cancellative). A bounded prism is classically
`(p, I)`-adically complete (BS22 Lemma 3.7(1), recalled in node `PR.8/log-prism`); since PR.0's
`Prism` does not record derived completeness, this consequence is the field `complete`. -/
structure IntegralBoundedPrelogPrism (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A]
    (M : Type u) [CommMonoid M] extends PrelogPrism p A M where
  bounded : toPrism.IsBounded
  integral : IsCancelMul M
  complete : IsAdicComplete (Ideal.span {(p : A)} ⊔ toPrism.I) A

/-- `S⟨X⟩`: the `p`-adic completion of the polynomial ring `S[X]` (Mathlib `AdicCompletion`). -/
abbrev ConvergentPoly (p : ℕ) (S : Type u) [CommRing S] : Type u :=
  AdicCompletion (Ideal.span {(p : Polynomial S)}) (Polynomial S)

/-- Placeholder (left derived functor of extension of scalars, owner
`EnhancedDerivedSheaves`; Mathlib has no derived tensor product): `− ⊗^L_R S` on `D(R)`. -/
noncomputable def derivedExtendScalars {R S : Type u} [CommRing R] [CommRing S] (f : R →+* S) :
    DerivedCategory (ModuleCat.{u} R) ⥤ DerivedCategory (ModuleCat.{u} S) := sorry

/-- The unit `X → X^∧_J` of derived completion (owner `DerivedDeRhamCohomology:DD.1`). -/
noncomputable def derivedCompletionUnit {S : Type u} [CommRing S] (J : Ideal S) :
    𝟭 (DerivedCategory (ModuleCat.{u} S)) ⟶ derivedCompletion J := sorry

/-- `X ↦ (X ⊗^L_R S)^∧_J`, completed derived extension of scalars: PR.0's
`TauCeti.Prismatic.completedBaseChange`, which is `derivedExtendScalars f` followed by
`derivedCompletion J`. -/
noncomputable abbrev completedExtendScalars {R S : Type u} [CommRing R] [CommRing S] (f : R →+* S)
    (J : Ideal S) : DerivedCategory (ModuleCat.{u} R) ⥤ DerivedCategory (ModuleCat.{u} S) :=
  TauCeti.Prismatic.completedBaseChange f J

namespace IntegralBoundedPrelogPrism

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- `Ā = A / I`. -/
abbrev bar (P : IntegralBoundedPrelogPrism p A M) : Type u := P.toPrism.bar

/-- The prelog structure `M_A → Ā`. -/
noncomputable def barα (P : IntegralBoundedPrelogPrism p A M) : M →* P.bar :=
  (Ideal.Quotient.mk P.toPrism.I).toMonoidHom.comp P.α

/-- The `(p, I)`-adic ideal of `A`. -/
def pI (P : IntegralBoundedPrelogPrism p A M) : Ideal A :=
  Ideal.span {(p : A)} ⊔ P.toPrism.I

/-- Maps of bases: maps of prelog prisms `(A, I, M_A) → (A′, IA′, M_{A′})` with `I A′ = I′`. -/
structure BaseHom {A' : Type u} [CommRing A'] {M' : Type u} [CommMonoid M']
    (P : IntegralBoundedPrelogPrism p A M) (P' : IntegralBoundedPrelogPrism p A' M') where
  /-- The map of prelog prisms. -/
  toHom : PrelogPrism.Hom P.toPrelogPrism P'.toPrelogPrism
  ideal_eq : P'.toPrism.I = P.toPrism.I.map toHom.toHom.ring

end IntegralBoundedPrelogPrism

/-- An affine prelog algebra `(R, P)` over `(Ā, M_A)`: an `Ā`-algebra `R`, a prelog structure
`α : P → R` (the chart monoid is called `Q` here, since `P` names the base) and a monoid map
`M_A → Q` compatible with the prelog structures. -/
structure PrelogAlgebra {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u}
    [CommMonoid M] (P : IntegralBoundedPrelogPrism p A M) where
  /-- The ring `R`. -/
  R : Type u
  [commRing : CommRing R]
  [algebra : Algebra P.bar R]
  /-- The chart monoid. -/
  Q : Type u
  [commMonoid : CommMonoid Q]
  /-- The prelog structure. -/
  α : Q →* R
  /-- The monoid map `M_A → Q`. -/
  structureMap : M →* Q
  comm : ∀ m, α (structureMap m) = algebraMap P.bar R (P.barα m)

attribute [instance] PrelogAlgebra.commRing PrelogAlgebra.algebra PrelogAlgebra.commMonoid

namespace PrelogAlgebra

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- The base `(Ā, M_A)` itself (`X = Spf(A / I)` with the log structure from `M_A`). -/
noncomputable def base (P : IntegralBoundedPrelogPrism p A M) : PrelogAlgebra P where
  R := P.bar
  Q := M
  α := P.barα
  structureMap := MonoidHom.id M
  comm _ := rfl

/-- The log affine line `(Ā⟨X⟩, M_A ⊕ ℕ)`, `(m, n) ↦ α(m) Xⁿ`. -/
noncomputable def logAffineLine (P : IntegralBoundedPrelogPrism p A M) : PrelogAlgebra P where
  R := ConvergentPoly p P.bar
  Q := M × Multiplicative ℕ
  α := ((algebraMap P.bar (ConvergentPoly p P.bar)).toMonoidHom.comp P.barα).coprod
    (powersHom _ (algebraMap (Polynomial P.bar) (ConvergentPoly p P.bar) Polynomial.X))
  structureMap := MonoidHom.inl M (Multiplicative ℕ)
  comm _ := by sorry

/-- The prelog algebra `(R, M_A)` with the log structure pulled back from the base. -/
noncomputable def strict (P : IntegralBoundedPrelogPrism p A M) (R : Type u) [CommRing R]
    [Algebra P.bar R] : PrelogAlgebra P where
  R := R
  Q := M
  α := (algebraMap P.bar R).toMonoidHom.comp P.barα
  structureMap := MonoidHom.id M
  comm _ := rfl

/-- The `X`-coordinate of the log affine line, as an element of its chart monoid. -/
def logAffineLine.X (P : IntegralBoundedPrelogPrism p A M) : (logAffineLine P).Q :=
  ((1 : M), Multiplicative.ofAdd 1)

end PrelogAlgebra

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`, Koshikawa Appendix A):
`p`-completely smooth prelog algebras `(R, P)` over `(Ā, M_A)` with an integral chart that is
integral and weakly finitely generated over `M_A`. -/
def SmoothPrelogAlgebra {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u}
    [CommMonoid M] (P : IntegralBoundedPrelogPrism p A M) : Type (u + 1) := sorry

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`): qcqs log `p`-adic formal
schemes `(X, M_X)` smooth over `(Spf Ā, M_A)^a` in Koshikawa's sense (integral log structure).
Global statements of this file are made for these. -/
def SmoothLogFormalScheme {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u}
    [CommMonoid M] (P : IntegralBoundedPrelogPrism p A M) : Type (u + 1) := sorry

namespace SmoothLogFormalScheme

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

noncomputable instance : Category.{u} (SmoothLogFormalScheme P) := sorry

/-- `Spf` of a smooth affine prelog algebra with its associated log structure. -/
noncomputable def spf (X : SmoothPrelogAlgebra P) : SmoothLogFormalScheme P := sorry

/-- Placeholder (formal-scheme foundations, `SchemeAndStackFoundations`): the small étale site
`X_ét` of the underlying formal scheme. -/
def Etale (X : SmoothLogFormalScheme P) : Type (u + 1) := sorry

noncomputable instance (X : SmoothLogFormalScheme P) : Category.{u} X.Etale := sorry

/-- The étale topology on `X_ét`. -/
noncomputable def etaleTopology (X : SmoothLogFormalScheme P) : GrothendieckTopology X.Etale :=
  sorry

/-- Placeholder (owner `EnhancedDerivedSheaves`): `D(X_ét, Λ)`. -/
def EtaleDerived (X : SmoothLogFormalScheme P) (Λ : Type u) [CommRing Λ] : Type (u + 1) := sorry

noncomputable instance (X : SmoothLogFormalScheme P) (Λ : Type u) [CommRing Λ] :
    Category.{u} (X.EtaleDerived Λ) := sorry

/-- `RΓ(X_ét, −) : D(X_ét, Λ) → D(Λ)`. -/
noncomputable def globalSections (X : SmoothLogFormalScheme P) (Λ : Type u) [CommRing Λ] :
    X.EtaleDerived Λ ⥤ DerivedCategory (ModuleCat.{u} Λ) := sorry

/-- Base change of `(X, M_X)` along a map of bases (fibre product of integral log formal
schemes; smooth over the new base). -/
noncomputable def baseChange {A' : Type u} [CommRing A'] {M' : Type u} [CommMonoid M']
    {P' : IntegralBoundedPrelogPrism p A' M'} (X : SmoothLogFormalScheme P)
    (f : IntegralBoundedPrelogPrism.BaseHom P P') : SmoothLogFormalScheme P' := sorry

end SmoothLogFormalScheme

namespace SmoothPrelogAlgebra

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

/-- The underlying prelog algebra. -/
noncomputable def toPrelogAlgebra (X : SmoothPrelogAlgebra P) : PrelogAlgebra P := sorry

/-- The base `(Ā, M_A)` is smooth over itself. -/
noncomputable def base (P : IntegralBoundedPrelogPrism p A M) : SmoothPrelogAlgebra P := sorry

theorem base_toPrelogAlgebra (P : IntegralBoundedPrelogPrism p A M) :
    (base P).toPrelogAlgebra = PrelogAlgebra.base P := by
  sorry

/-- The log affine line is smooth. -/
noncomputable def logAffineLine (P : IntegralBoundedPrelogPrism p A M) : SmoothPrelogAlgebra P :=
  sorry

theorem logAffineLine_toPrelogAlgebra (P : IntegralBoundedPrelogPrism p A M) :
    (logAffineLine P).toPrelogAlgebra = PrelogAlgebra.logAffineLine P := by
  sorry

end SmoothPrelogAlgebra

/-! ## Node `PR.8/log-prismatic-site` (definition): The relative log prismatic site -/

/-- **Node `PR.8/log-prismatic-site`** (definition): The relative log prismatic site.

Fix a bounded prelog prism (A, I, M_A) with M_A integral and a log (p, I)-adic formal scheme (X,
M_X) smooth over (A/I, M_A) in Koshikawa's sense (so M_X is integral). The log prismatic site ((X,
M_X)/(A, M_A))_Δ is the opposite of the category of triples consisting of: a log prism (B, IB,
M_{Spf(B)}) = (B, IB, M_B)^a with integral log structure and a map of log prisms (A, I, M_A)^a → (B,
IB, M_{Spf(B)}); a map of formal schemes f: Spf(B/IB) → X over A/I; and an exact closed immersion of
log formal schemes (Spf(B/IB), f^*M_X) ↪ (Spf(B), M_{Spf(B)}) over (A, M_A). A morphism is an étale
cover if B → C is (p, I)-completely étale and faithfully flat and (Spf(C), M) → (Spf(B), M) is
strict étale. The structure sheaves are O_Δ: B ↦ B and Ō_Δ: B ↦ B/IB, with O_Δ ⊗^L_A A/I ≅ Ō_Δ. The
site depends only on (Spf(A), M_A)^a and (X, M_X), not on the chart M_A → A.

Hypotheses (packet): (A, I, M_A) bounded with M_A integral. (X, M_X) smooth over (A/I, M_A) in the
sense of Koshikawa Appendix A (CR.5). Étale topology; the (p, I)-completely faithfully flat topology
gives the same cohomology (Remark 4.3).

API `LogPrismaticSite` (constructor; node `PR.8/log-prismatic-site`): The site ((X, M_X)/(A, M_A))_Δ
with the étale topology.

Placeholder carrier (node `PR.8/log-prismatic-site`): the underlying category (opposite of the
category of triples). -/
def LogPrismaticSite {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u}
    [CommMonoid M] (P : IntegralBoundedPrelogPrism p A M) (X : SmoothLogFormalScheme P) :
    Type (u + 1) := sorry

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

noncomputable instance (X : SmoothLogFormalScheme P) : Category.{u} (LogPrismaticSite P X) :=
  sorry

/-- The étale topology of the log prismatic site (part of API `LogPrismaticSite`). -/
noncomputable def topology (X : SmoothLogFormalScheme P) :
    GrothendieckTopology (LogPrismaticSite P X) := sorry

/-- The `(p, I)`-completely faithfully flat topology. -/
noncomputable def flatTopology (X : SmoothLogFormalScheme P) :
    GrothendieckTopology (LogPrismaticSite P X) := sorry

/-- The ring `B` of an object `(B, IB, M_B)^a`. -/
def objRing {X : SmoothLogFormalScheme P} (U : LogPrismaticSite P X) : Type u := sorry

noncomputable instance {X : SmoothLogFormalScheme P} (U : LogPrismaticSite P X) :
    CommRing (objRing U) := sorry

/-- API `LogPrismaticSite.structureSheaf` (data; node `PR.8/log-prismatic-site`): The sheaf O_Δ: (B,
IB, M) ↦ B, valued in (p, I)-complete A-algebras with δ-structure. -/
noncomputable def structureSheaf (X : SmoothLogFormalScheme P) :
    Sheaf (topology X) CommRingCat.{u} := sorry

/-- API `LogPrismaticSite.reducedStructureSheaf` (data; node `PR.8/log-prismatic-site`): Ō_Δ: (B,
IB, M) ↦ B/IB, with O_Δ ⊗^L_A A/I ≅ Ō_Δ. -/
noncomputable def reducedStructureSheaf (X : SmoothLogFormalScheme P) :
    Sheaf (topology X) CommRingCat.{u} := sorry

/-! * API `LogPrismaticSite.etaleLift` (characterisation; node `PR.8/log-prismatic-site`): For an
object B and a p-completely étale B/IB → C̄ there is a unique étale map of objects B → C with C/IC ≅
C̄ (Remark 4.2).

  Not typed: uniqueness of the lift is up to unique isomorphism of objects of the site, and
"`p`-completely étale" maps are not in Mathlib; the existence half alone would misstate the remark.
-/

/-- API `LogPrismaticSite.toEtale` (functoriality; node `PR.8/log-prismatic-site`): The morphism of
topoi ν: Shv(((X, M_X)/(A, M_A))_Δ) → Shv(X_ét) with (ν_*F)(U) = H^0(((U, M_U)/(A, M_A))_Δ, F).

Lean form: the direct image `ν_*` on sheaves of sets. -/
noncomputable def toEtale (X : SmoothLogFormalScheme P) :
    Sheaf (topology X) (Type u) ⥤ Sheaf X.etaleTopology (Type u) := sorry

end LogPrismaticSite

/-! ## Node `PR.8/log-prismatic-cohomology` (construction): Log prismatic cohomology complexes -/

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

/-- **Node `PR.8/log-prismatic-cohomology`** (construction): Log prismatic cohomology complexes.

In the setting of the log prismatic site, define Δ_{(X,M_X)/(A,M_A)} := Rν_*O_Δ ∈ D(X_ét, A) and its
reduction Δ̄_{(X,M_X)/(A,M_A)} := Rν_*Ō_Δ ∈ D(X_ét, A/I), commutative algebra objects with Δ̄ ≅ Δ
⊗^L_A A/I, and RΓ_Δ((X, M_X)/(A, M_A)) := RΓ(((X, M_X)/(A, M_A))_Δ, O_Δ), a (p, I)-complete
E_∞-A-algebra with a φ_A-semilinear endomorphism φ induced by the δ-structures. For X = Spf(R) with
an integral chart P → Γ(X, M_X) over M_A that is integral and weakly finitely generated over M_A,
write Δ_{(R,P)/(A,M_A)}; it may be computed with the indiscrete topology and depends only on
(Spf(R), P)^a and (A, I, M_A)^a.

Hypotheses (packet): (A, I, M_A) bounded with M_A integral; (X, M_X) smooth over (A/I, M_A).

API `LogPrismaticSite.cohomology` (constructor; node `PR.8/log-prismatic-cohomology`): RΓ_Δ((X,
M_X)/(A, M_A)) as a (p, I)-complete E_∞-A-algebra.

Placeholder (node `PR.8/log-prismatic-cohomology`): `RΓ_Δ((X, M_X)/(A, M_A))` in `D(A)`, like PR.0's
`prismaticCohomology`; the `E_∞`-algebra structure is not recorded. -/
noncomputable def cohomology (P : IntegralBoundedPrelogPrism p A M) (X : SmoothLogFormalScheme P) :
    DerivedCategory (ModuleCat.{u} A) := sorry

/-- Placeholder (node `PR.8/log-prismatic-cohomology`): the affine complex `Δ_{(R,P)/(A,M_A)}`
of a prelog algebra (the cohomology of the log prismatic site of `(Spf R^∧_p, P^a)`; for smooth
`(R, P)` it is `cohomology` of `spf`). -/
noncomputable def affineCohomology (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) :
    DerivedCategory (ModuleCat.{u} A) := sorry

/-- Placeholder (node `PR.8/log-prismatic-cohomology`): the reduced affine complex
`Δ̄_{(R,P)/(A,M_A)}` as an `R`-linear complex (global sections of `Rν_* Ō_Δ`). -/
noncomputable def reducedAffineCohomology (P : IntegralBoundedPrelogPrism p A M)
    (X : PrelogAlgebra P) : DerivedCategory (ModuleCat.{u} X.R) := sorry

/-- For smooth affine `(R, P)` the global and affine complexes agree. -/
theorem cohomology_spf (P : IntegralBoundedPrelogPrism p A M) (X : SmoothPrelogAlgebra P) :
    Nonempty (cohomology P (SmoothLogFormalScheme.spf X) ≅ affineCohomology P X.toPrelogAlgebra) := by
  sorry

/-- API `LogPrismaticSite.sheafCohomology` (constructor; node `PR.8/log-prismatic-cohomology`):
Δ_{(X,M_X)/(A,M_A)} = Rν_*O_Δ ∈ D(X_ét, A). -/
noncomputable def sheafCohomology (P : IntegralBoundedPrelogPrism p A M)
    (X : SmoothLogFormalScheme P) : X.EtaleDerived A := sorry

/-- API `LogPrismaticSite.reducedCohomology` (constructor; node `PR.8/log-prismatic-cohomology`):
Δ̄_{(X,M_X)/(A,M_A)} = Rν_*Ō_Δ ∈ D(X_ét, A/I). -/
noncomputable def reducedCohomology (P : IntegralBoundedPrelogPrism p A M)
    (X : SmoothLogFormalScheme P) : X.EtaleDerived P.bar := sorry

/-- `RΓ(X_ét, Δ) = RΓ_Δ`. -/
theorem globalSections_sheafCohomology (P : IntegralBoundedPrelogPrism p A M)
    (X : SmoothLogFormalScheme P) :
    Nonempty ((X.globalSections A).obj (sheafCohomology P X) ≅ cohomology P X) := by
  sorry

/-- API `LogPrismaticSite.reduced_eq_tensor` (characterisation; node
`PR.8/log-prismatic-cohomology`): Δ̄ ≅ Δ ⊗^L_A A/I.

Lean form: on global sections, `RΓ(X_ét, Δ̄) ≅ RΓ_Δ ⊗^L_A A / I`. -/
theorem reduced_eq_tensor (P : IntegralBoundedPrelogPrism p A M) (X : SmoothLogFormalScheme P) :
    Nonempty ((X.globalSections P.bar).obj (reducedCohomology P X) ≅
      (derivedExtendScalars (Ideal.Quotient.mk P.toPrism.I)).obj (cohomology P X)) := by
  sorry

/-- API `LogPrismaticSite.frobenius` (structure; node `PR.8/log-prismatic-cohomology`): The
φ_A-semilinear Frobenius φ: Δ → φ_{A,*}Δ. -/
noncomputable def frobenius (P : IntegralBoundedPrelogPrism p A M) (X : SmoothLogFormalScheme P) :
    cohomology P X ⟶ (frobeniusPushforward P.toPrism).obj (cohomology P X) := sorry

/-- API `LogPrismaticSite.cohomology_isComplete` (other; node `PR.8/log-prismatic-cohomology`): RΓ_Δ
is derived (p, I)-complete. -/
theorem cohomology_isComplete (P : IntegralBoundedPrelogPrism p A M)
    (X : SmoothLogFormalScheme P) : IsIso ((derivedCompletionUnit P.pI).app (cohomology P X)) := by
  sorry

/-- API `LogPrismaticSite.cohomology_map` (functoriality; node `PR.8/log-prismatic-cohomology`):
Functoriality in (X, M_X) over (A, M_A) and in maps of bounded prelog prisms.

Lean form: functoriality in `(X, M_X)` over the base; functoriality in maps of bounded prelog prisms
is the base change of node `PR.8/log-prismatic-base-change`. -/
noncomputable def cohomology_map (P : IntegralBoundedPrelogPrism p A M) :
    (SmoothLogFormalScheme P)ᵒᵖ ⥤ DerivedCategory (ModuleCat.{u} A) := sorry

theorem cohomology_map_obj (P : IntegralBoundedPrelogPrism p A M) (X : SmoothLogFormalScheme P) :
    (cohomology_map P).obj (Opposite.op X) = cohomology P X := by
  sorry

/-- Unit test `LogPrismaticSite.cohomology_point` (degenerate; node
`PR.8/log-prismatic-cohomology`): For X = Spf(A/I) with log structure from M_A, RΓ_Δ((X, M_X)/(A,
M_A)) ≅ A with φ = φ_A.

Lean form: the isomorphism with `A` in degree `0`; the compatibility `φ = φ_A` is not typed. -/
theorem cohomology_point (P : IntegralBoundedPrelogPrism p A M) :
    Nonempty (cohomology P (SmoothLogFormalScheme.spf (SmoothPrelogAlgebra.base P)) ≅
      (DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A A)) := by
  sorry

/-- Unit test `LogPrismaticSite.cohomology_trivialLog` (compatibility; node
`PR.8/log-prismatic-cohomology`): With trivial log structures, Δ_{(X,M_X)/(A,M_A)} ≅ PR.1's Δ_{X/A}.

Lean form: over a base with trivial monoid `{e}` and for `(R, {e})`, the affine log prismatic
complex is PR.0's shared carrier `prismaticCohomology` (PR.1's `Δ_{R/A}`). -/
theorem cohomology_trivialLog (P : IntegralBoundedPrelogPrism p A PUnit.{u + 1}) (R : Type u)
    [CommRing R] [Algebra P.bar R] :
    Nonempty (affineCohomology P (PrelogAlgebra.strict P R) ≅ prismaticCohomology P.toPrism R) := by
  sorry

/-- Unit test `LogPrismaticSite.reduced_affineLine` (computation; node
`PR.8/log-prismatic-cohomology`): For (A/I⟨X⟩, M_A ⊕ N): H^0(Δ̄) = A/I⟨X⟩ and H^1(Δ̄){1} ≅
A/I⟨X⟩·dlog X, a free module of rank 1 (K1 §5.4).

Lean form: for an orientable base (so that the Breuil–Kisin twist is trivial), `H^0(Δ̄) ≅ R` and
`H^1(Δ̄) ≅ R` (free of rank one on `dlog X`, see `hodge-tate-log-affine-line`). -/
theorem reduced_affineLine (P : IntegralBoundedPrelogPrism p A M) (ho : P.toPrism.IsOrientable) :
    Nonempty ((DerivedCategory.homologyFunctor _ 0).obj
        (reducedAffineCohomology P (PrelogAlgebra.logAffineLine P)) ≅
      ModuleCat.of (PrelogAlgebra.logAffineLine P).R (PrelogAlgebra.logAffineLine P).R) ∧
    Nonempty ((DerivedCategory.homologyFunctor _ 1).obj
        (reducedAffineCohomology P (PrelogAlgebra.logAffineLine P)) ≅
      ModuleCat.of (PrelogAlgebra.logAffineLine P).R (PrelogAlgebra.logAffineLine P).R) := by
  sorry

/-- Placeholder (node `PR.8/log-prismatic-cohomology`): the map from PR.1's Hodge–Tate cohomology
`Δ̄_{R/A}` (PR.0's shared carrier `hodgeTateCohomology`) to the reduced log complex, induced by
forgetting log structures. -/
noncomputable def forgetLogMap (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) :
    hodgeTateCohomology P.toPrism X.R ⟶ reducedAffineCohomology P X := sorry

/-- Unit test `LogPrismaticSite.cohomology_not_nonlog` (non-example; node
`PR.8/log-prismatic-cohomology`): For the log affine line, H^1(Δ̄){1} is generated by dlog X rather
than dX: the log and non-log cohomologies differ (the map Ω^1 → Ω^1_log is X·, not an isomorphism).
-/
theorem cohomology_not_nonlog (P : IntegralBoundedPrelogPrism p A M) [Nontrivial P.bar] :
    ¬ IsIso ((DerivedCategory.homologyFunctor _ 1).map
      (forgetLogMap P (PrelogAlgebra.logAffineLine P))) := by
  sorry

/-- The object `(A, I, M_A)^a` of the site of `Spf(A / I)` with the log structure from `M_A`. -/
noncomputable def baseObject (P : IntegralBoundedPrelogPrism p A M) :
    LogPrismaticSite P (SmoothLogFormalScheme.spf (SmoothPrelogAlgebra.base P)) := sorry

/-- Unit test `LogPrismaticSite.base_point` (degenerate; node `PR.8/log-prismatic-site`): For X =
Spf(A/I) with the log structure from M_A, (A, I, M_A)^a is a final object. -/
theorem base_point (P : IntegralBoundedPrelogPrism p A M) :
    Nonempty (Limits.IsTerminal (baseObject P)) := by
  sorry

/-- Unit test `LogPrismaticSite.affineLine_object` (computation; node `PR.8/log-prismatic-site`):
For (X, M_X) = (Spf(A/I⟨X⟩), M_A ⊕ N)^a, the triple (A⟨X⟩, I, M_A ⊕ N)^a with δ_log(N) = 0 and the
identity Spf(A/I⟨X⟩) → X is an object.

Lean form: an object whose ring is `A⟨X⟩`, the `(p, I)`-adic completion of `A[X]`. -/
theorem affineLine_object (P : IntegralBoundedPrelogPrism p A M) :
    ∃ U : LogPrismaticSite P (SmoothLogFormalScheme.spf (SmoothPrelogAlgebra.logAffineLine P)),
      Nonempty (objRing U ≃+* AdicCompletion (P.pI.map Polynomial.C) (Polynomial A)) := by
  sorry

/-- Placeholder (node `PR.8/log-prismatic-site`): the cohomology of `O_Δ` for the
`(p, I)`-completely faithfully flat topology `flatTopology`. -/
noncomputable def flatCohomology (P : IntegralBoundedPrelogPrism p A M)
    (X : SmoothLogFormalScheme P) : DerivedCategory (ModuleCat.{u} A) := sorry

/-- API `LogPrismaticSite.flat_eq_etale` (compatibility; node `PR.8/log-prismatic-site`): Replacing
étale covers by (p, I)-completely faithfully flat covers does not change the cohomology of O_Δ
(Remark 4.3). -/
theorem flat_eq_etale (P : IntegralBoundedPrelogPrism p A M) (X : SmoothLogFormalScheme P) :
    Nonempty (flatCohomology P X ≅ cohomology P X) := by
  sorry

/-! * API `LogPrismaticSite.trivialLog_equiv` (equivalence; node `PR.8/log-prismatic-site`): For
trivial log structures the site is equivalent to PR.1's relative prismatic site with the étale
topology.

  Not typed: PR.1's relative prismatic site (PR.0's `RelativePrism` and its topology) is outside the
PR.0 excerpt this file is checked against. -/

/-! * Unit test `LogPrismaticSite.trivialLog` (compatibility; node `PR.8/log-prismatic-site`): With
M_A and M_X trivial, the site equals the PR.1 relative prismatic site (étale variant) and the
structure sheaves agree.

  Not typed: same reason as `LogPrismaticSite.trivialLog_equiv` (the PR.1 site); the cohomological
form is `LogPrismaticSite.cohomology_trivialLog`. -/

/-! * API `LogPrismaticSite.chart_independent` (other; node `PR.8/log-prismatic-site`): The site
depends only on (Spf(A), M_A)^a and (X, M_X).

  Not typed: "depends only on `(Spf(A), M_A)^a`" compares sites over two prelog prisms with the same
associated log prism; equivalences of the placeholder sites would have to be stated over an
unconstrained identification of bases. -/

/-- Unit test `LogPrismaticSite.not_strict_open_immersion` (non-example; node
`PR.8/log-prismatic-site`): For the log affine line with trivial base log structure, forgetting logs
sends (A⟨X⟩, I, N)^a to a valid object of the underlying non-log prismatic site. It does not
preserve the Hodge–Tate differential module: the canonical map R·dX → R·dlog X sends dX to X·dlog X
and is not an isomorphism when X is not a unit.

Lean form of the second assertion: on the log affine line the comparison of Hodge–Tate differential
modules (degree one) is not an isomorphism. The first assertion (the object of PR.1's site) is not
typed. -/
theorem not_strict_open_immersion (P : IntegralBoundedPrelogPrism p A M) [Nontrivial P.bar] :
    ¬ IsIso ((DerivedCategory.homologyFunctor _ 1).map
      (forgetLogMap P (PrelogAlgebra.logAffineLine P))) := by
  sorry

end LogPrismaticSite


/-! ## Node `PR.8/absolute-log-prismatic-site` (definition): The absolute saturated log prismatic site -/

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`): integral log `p`-adic
formal schemes `(X, M_X)`. -/
def IntegralLogFormalScheme (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`): bounded fs log `p`-adic
formal schemes. -/
def FsLogFormalScheme (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

noncomputable instance (p : ℕ) [Fact p.Prime] : Category.{u} (FsLogFormalScheme.{u} p) := sorry

/-- **Node `PR.8/absolute-log-prismatic-site`** (definition): The absolute saturated log prismatic
site.

For an integral log p-adic formal scheme (X, M_X), the absolute log prismatic site (X, M_X)_Δ has
objects diagrams (Spf(B), M_{Spf(B)}) ↩ (Spf(B/J), M_{Spf(B/J)}) → (X, M_X) where (B, J, M_{Spf(B)})
is a log prism with M_{Spf(B)} integral, M_{Spf(B/J)} its restriction, and the right map admits an
integral chart étale locally; it carries the flat topology. For a bounded fs log p-adic formal
scheme, the absolute saturated log prismatic site has objects saturated log prisms (A, I, M_A)^a
with a map (Spf(A/I), M_A)^a → (X, M_X) admitting a saturated chart étale locally, with the strict
flat topology. There is a strict variant requiring the right map to be strict, and the relative site
maps to it.

Hypotheses (packet): (X, M_X) integral (resp. bounded fs for the saturated variant).

API `AbsoluteLogPrismaticSite` (constructor; node `PR.8/absolute-log-prismatic-site`): The site (X,
M_X)_Δ with the flat topology (integral variant).

Placeholder carrier (node `PR.8/absolute-log-prismatic-site`): the underlying category of `(X,
M_X)_Δ`. -/
def AbsoluteLogPrismaticSite {p : ℕ} [Fact p.Prime] (X : IntegralLogFormalScheme.{u} p) :
    Type (u + 1) := sorry

namespace AbsoluteLogPrismaticSite

variable {p : ℕ} [Fact p.Prime]

noncomputable instance (X : IntegralLogFormalScheme.{u} p) :
    Category.{u} (AbsoluteLogPrismaticSite X) := sorry

/-- The flat topology of `(X, M_X)_Δ`. -/
noncomputable def flatTopology (X : IntegralLogFormalScheme.{u} p) :
    GrothendieckTopology (AbsoluteLogPrismaticSite X) := sorry

/-- API `AbsoluteLogPrismaticSite.saturated` (constructor; node `PR.8/absolute-log-prismatic-site`):
The absolute saturated log prismatic site of a bounded fs log p-adic formal scheme, with the strict
flat topology.

Placeholder carrier: the underlying category; its strict flat topology is `saturatedTopology`. -/
def saturated (X : FsLogFormalScheme.{u} p) : Type (u + 1) := sorry

noncomputable instance (X : FsLogFormalScheme.{u} p) : Category.{u} (saturated X) := sorry

/-- The strict flat topology of the absolute saturated site. -/
noncomputable def saturatedTopology (X : FsLogFormalScheme.{u} p) :
    GrothendieckTopology (saturated X) := sorry

/-- API `AbsoluteLogPrismaticSite.structureSheaf` (data; node `PR.8/absolute-log-prismatic-site`):
O_Δ: (B, J, M) ↦ B and the ideal sheaf I_Δ: (B, J, M) ↦ J.

Lean form: on the absolute saturated site, `O_Δ` and the ideal sheaf `I_Δ` as a sheaf of
`O_Δ`-ideals is recorded through the quotient `O_Δ / I_Δ` (`reducedStructureSheaf`). -/
noncomputable def structureSheaf (X : FsLogFormalScheme.{u} p) :
    Sheaf (saturatedTopology X) CommRingCat.{u} := sorry

/-- `O_Δ / I_Δ` on the absolute saturated site. -/
noncomputable def reducedStructureSheaf (X : FsLogFormalScheme.{u} p) :
    Sheaf (saturatedTopology X) CommRingCat.{u} := sorry

/-- The underlying integral log formal scheme of a smooth log formal scheme over a base. -/
noncomputable def _root_.TauCeti.LogPrismatic.SmoothLogFormalScheme.toIntegral
    {A : Type u} [CommRing A] {M : Type u} [CommMonoid M] {P : IntegralBoundedPrelogPrism p A M}
    (X : SmoothLogFormalScheme P) : IntegralLogFormalScheme.{u} p := sorry

/-- API `AbsoluteLogPrismaticSite.ofRelative` (functoriality; node
`PR.8/absolute-log-prismatic-site`): The forgetful functor from the relative site ((X, M_X)/(A,
M_A))_Δ to the strict variant.

Lean form: the forgetful functor to the absolute site of the underlying integral log formal scheme
(it lands in the strict variant). -/
noncomputable def ofRelative {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
    (P : IntegralBoundedPrelogPrism p A M) (X : SmoothLogFormalScheme P) :
    LogPrismaticSite P X ⥤ AbsoluteLogPrismaticSite X.toIntegral := sorry

/-! * API `AbsoluteLogPrismaticSite.trivialLog` (compatibility; node
`PR.8/absolute-log-prismatic-site`): For trivial log structures the strict variant is PR.5's
absolute prismatic site.

  Not typed: PR.5's absolute prismatic site is outside the PR.0 excerpt this file is checked
against. -/

/-! * Unit test `AbsoluteLogPrismaticSite.bk_covers` (computation; node
`PR.8/absolute-log-prismatic-site`): For (X, M_X) = (Spf(O_K), O_K∖{0})^a, the Breuil–Kisin log
prism (W(k)[[u]], (E(u)), u^N)^a covers the final object (K1 Lemma 4.14).

  Not typed: needs `O_K` with its log structure as an fs log formal scheme and the Breuil–Kisin log
prism as an object over it (CR.5 log structures on `Spf(O_K)`); the covering assertion
`smooth-chart-covers` is typed relatively. -/

/-! * Unit test `AbsoluteLogPrismaticSite.point_perfect` (degenerate; node
`PR.8/absolute-log-prismatic-site`): For (Spf(O_C), O_C∖{0})^a, the perfect log prism (A_inf, (ξ),
O_C♭∖{0})^a is weakly final.

  Not typed: needs `O_C` for a complete algebraically closed field and the object `(A_inf, (ξ), O_C♭
∖ {0})^a` of its absolute site, which no library provides. -/

/-! * Unit test `AbsoluteLogPrismaticSite.not_relative` (non-example; node
`PR.8/absolute-log-prismatic-site`): Unlike the relative site, objects need not receive a map from a
fixed base prism: for O_K the Breuil–Kisin prism depends on a choice of uniformiser, while the
absolute site does not.

  Not typed: a statement about the choice of uniformiser in the Breuil–Kisin object of the absolute
site of `O_K`; same missing carriers as `bk_covers`. -/

end AbsoluteLogPrismaticSite

/-! ## Node `PR.8/cech-alexander-log` (construction): Čech–Alexander complexes for log prismatic cohomology -/

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

/-- Placeholder carrier (node `PR.8/cech-alexander-log`; restricted power series rings are not in
Mathlib): choices of compatible surjections `M_A ⊕ ℕ^T → P` and
`A⟨(X_s)_{s ∈ S}, ℕ^T⟩ → R` for a smooth affine prelog algebra. -/
def CechAlexanderDatum (X : SmoothPrelogAlgebra P) : Type (u + 1) := sorry

/-- **Node `PR.8/cech-alexander-log`** (construction): Čech–Alexander complexes for log prismatic
cohomology.

Let X = Spf(R) be affine with an integral chart P over M_A that is integral and weakly finitely
generated over M_A. Choose a surjection M_B = M_A ⊕ N^T → P and a surjection B_0 := A⟨(X_s)_{s∈S},
N^T⟩ → R compatible with it, and let B := (A{(X_s)}_δ{N^T}_δlog)^∧_(p,I) be the free δ_log-ring. Let
(B_0^•, M_B^•) ↪ (B^•, M_B^•) be the (p, I)-completed Čech nerves over (A, M_A) and J^• := ker(B_0^•
→ R). Applying the flatness theorem for envelopes levelwise gives a cosimplicial prelog prism (C^•,
IC^•, M_C^•) with exact surjections onto (C^•/IC^•, P), each C^n (p, I)-completely flat over A; its
associated cosimplicial object is the Čech nerve of (C^0, IC^0, M_C^0)^a, which covers the final
object of the topos. Hence Δ_{(R,P)/(A,M_A)} is computed by the cosimplicial δ-A-algebra C^•,
compatibly with base change in (A, I, M_A). Taking P = Γ(X, M_X) and B_0 = A⟨N^R ⊕ N^P⟩ gives a
strictly functorial complex C^•((R, P)/(A, M_A), O_Δ). This latter choice does not itself commute
with arbitrary base changes (K1 Remark 4.8); its totalisation computes the same cohomology.

Hypotheses (packet): (A, I, M_A) bounded with M_A integral; M_A → P integral and weakly finitely
generated; (R, P) p-completely smooth.

API `LogPrismaticSite.cechAlexander` (constructor; node `PR.8/cech-alexander-log`): The cosimplicial
δ-A-algebra C^• attached to a choice of surjections (B_0, M_B) → (R, P).

Lean form: the cosimplicial `A`-module underlying the cosimplicial δ-`A`-algebra `C^•`. -/
noncomputable def cechAlexander (X : SmoothPrelogAlgebra P) (c : CechAlexanderDatum X) :
    CosimplicialObject (ModuleCat.{u} A) := sorry

/-- `Tot(C^•)` in `D(A)`: the alternating coface complex, extended from `ℕ` to `ℤ`. -/
noncomputable def cechAlexanderTot (X : SmoothPrelogAlgebra P) (c : CechAlexanderDatum X) :
    DerivedCategory (ModuleCat.{u} A) :=
  DerivedCategory.Q.obj
    (((AlgebraicTopology.alternatingCofaceMapComplex (ModuleCat.{u} A)).obj
      (cechAlexander X c)).extend ComplexShape.embeddingUpNat)

/-- API `LogPrismaticSite.cechAlexander_computes` (characterisation; node
`PR.8/cech-alexander-log`): Tot(C^•) ≅ Δ_{(R,P)/(A,M_A)} compatibly with Frobenius.

Lean form: the isomorphism in `D(A)`; compatibility with Frobenius is not typed. -/
theorem cechAlexander_computes (X : SmoothPrelogAlgebra P) (c : CechAlexanderDatum X) :
    Nonempty (cechAlexanderTot X c ≅ affineCohomology P X.toPrelogAlgebra) := by
  sorry

/-! * API `LogPrismaticSite.cechAlexander_flat` (other; node `PR.8/cech-alexander-log`): Each C^n is
(p, I)-completely flat over A.

  Not typed: `(p, I)`-complete flatness is not in Mathlib (and plain flatness would be a false
strengthening). -/

/-! * API `LogPrismaticSite.cechAlexander_baseChange` (functoriality; node
`PR.8/cech-alexander-log`): For a chosen free presentation, C^• commutes with completed base change
along maps of bounded prelog prisms when the same presentation is base changed. This does not assert
base change of the strictly functorial presentation indexed by all elements of R and P (K1 Remark
4.8).

  Not typed: base change of a chosen free presentation along a map of bases is a construction on the
restricted power series presentations, which are not typed. -/

/-- The strictly functorial datum `P = Γ(X, M_X)`, `B_0 = A⟨ℕ^R ⊕ ℕ^P⟩`. -/
noncomputable def CechAlexanderDatum.functorial (X : SmoothPrelogAlgebra P) :
    CechAlexanderDatum X := sorry

/-- API `LogPrismaticSite.cechAlexanderFunctorial` (constructor; node `PR.8/cech-alexander-log`):
The strictly functorial complex for P = Γ(X, M_X) and B_0 = A⟨N^R ⊕ N^P⟩. -/
noncomputable def cechAlexanderFunctorial (X : SmoothPrelogAlgebra P) :
    CosimplicialObject (ModuleCat.{u} A) :=
  cechAlexander X (CechAlexanderDatum.functorial X)

/-- API `LogPrismaticSite.cechAlexander_independent` (extensionality; node
`PR.8/cech-alexander-log`): Two choices of surjections give canonically quasi-isomorphic
totalisations. -/
theorem cechAlexander_independent (X : SmoothPrelogAlgebra P) (c c' : CechAlexanderDatum X) :
    Nonempty (cechAlexanderTot X c ≅ cechAlexanderTot X c') := by
  sorry

/-- The trivial datum for `(R, P) = (Ā, M_A)` (`S = T = ∅`). -/
noncomputable def CechAlexanderDatum.trivial (P : IntegralBoundedPrelogPrism p A M) :
    CechAlexanderDatum (SmoothPrelogAlgebra.base P) := sorry

/-- Unit test `LogPrismaticSite.cechAlexander_trivial` (degenerate; node `PR.8/cech-alexander-log`):
For R = A/I and P = M_A, the constant cosimplicial algebra A computes Δ = A. -/
theorem cechAlexander_trivial (P : IntegralBoundedPrelogPrism p A M) :
    Nonempty (cechAlexander (SmoothPrelogAlgebra.base P) (CechAlexanderDatum.trivial P) ≅
      (Functor.const SimplexCategory).obj (ModuleCat.of A A)) := by
  sorry

/-! * Unit test `LogPrismaticSite.cechAlexander_affineLine` (computation; node
`PR.8/cech-alexander-log`): For (A/I⟨X_0⟩, M_A ⊕ X_0^N) with B_0 = A⟨X_0⟩, C^n is the completion of
A⟨X_0, …, X_n⟩{(I, X_1/X_0 − 1, …, X_n/X_0 − 1)/I}_δ (K1 §5.4).

  Not typed: the terms are completed δ-envelopes of restricted power series rings, which no library
provides. -/

/-! * Unit test `LogPrismaticSite.cechAlexander_trivialLog` (compatibility; node
`PR.8/cech-alexander-log`): With trivial log structures, C^• is BS22's Čech–Alexander complex
(PR.1).

  Not typed: PR.1's Čech–Alexander complex is outside the PR.0 excerpt this file is checked against.
-/

/-! * Unit test `LogPrismaticSite.cechAlexander_needs_exactification` (non-example; node
`PR.8/cech-alexander-log`): Using the non-exactified δ-pair (B^1, (I, X_1 − X_0)) for the log affine
line gives the non-log Čech nerve, whose cohomology has H^1(Δ̄) ≅ R·dX rather than R·dlog X.

  Not typed: needs the non-exactified Čech nerve over restricted power series rings and its
Hodge–Tate cohomology; not available. -/

end LogPrismaticSite

/-! ## Node `PR.8/log-prismatic-weak-base-change` (lemma): Affine base change for log prismatic cohomology -/

namespace PrelogAlgebra

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

/-- The `p`-completed base change `(R′, P′)` of a prelog algebra along a map of bases. -/
noncomputable def baseChange {A' : Type u} [CommRing A'] {M' : Type u} [CommMonoid M']
    {P' : IntegralBoundedPrelogPrism p A' M'} (X : PrelogAlgebra P)
    (f : IntegralBoundedPrelogPrism.BaseHom P P') : PrelogAlgebra P' := sorry

end PrelogAlgebra

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

/-- **Node `PR.8/log-prismatic-weak-base-change`** (lemma): Affine base change for log prismatic
cohomology.

Let (R, P) be as in the Čech–Alexander construction and (A, I, M_A) → (A′, IA′, M_{A′}) a map of
bounded prelog prisms with M_{A′} integral and A → A′ of finite (p, I)-complete Tor amplitude. With
(R′, P′) the p-completed base change of (R, P) as a prelog ring, the natural map Δ_{(R,P)/(A,M_A)}
⊗̂^L_A A′ → Δ_{(R′,P′)/(A′,M_{A′})} is an isomorphism, and similarly for Δ̄.

Hypotheses (packet): Finite (p, I)-complete Tor amplitude of A → A′; M_{A′} integral.

Lean form: "finite `(p, I)`-complete Tor amplitude" is replaced by the stronger flatness of `A → A′`
(Mathlib `RingHom.Flat`); the statement for `Δ̄` is not typed separately. -/
theorem weakBaseChange (X : SmoothPrelogAlgebra P) {A' : Type u} [CommRing A'] {M' : Type u}
    [CommMonoid M'] (P' : IntegralBoundedPrelogPrism p A' M')
    (f : IntegralBoundedPrelogPrism.BaseHom P P') (hf : f.toHom.toHom.ring.Flat) :
    Nonempty ((completedExtendScalars f.toHom.toHom.ring P'.pI).obj
        (affineCohomology P X.toPrelogAlgebra) ≅
      affineCohomology P' (X.toPrelogAlgebra.baseChange f)) := by
  sorry

end LogPrismaticSite

/-! ## Node `PR.8/log-prismatic-etale-localization` (lemma): Strict étale localisation -/

namespace PrelogAlgebra

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

/-- The prelog algebra `(S, P)` for an `R`-algebra `S`, with the pulled-back chart. -/
noncomputable def ofAlgebra (X : PrelogAlgebra P) (S : Type u) [CommRing S] [Algebra X.R S] :
    PrelogAlgebra P :=
  letI : Algebra P.bar S := ((algebraMap X.R S).comp (algebraMap P.bar X.R)).toAlgebra
  { R := S
    Q := X.Q
    α := (algebraMap X.R S).toMonoidHom.comp X.α
    structureMap := X.structureMap
    comm := by sorry }

end PrelogAlgebra

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

/-- **Node `PR.8/log-prismatic-etale-localization`** (lemma): Strict étale localisation.

Let (A, I, M_A) be a bounded prelog prism with M_A integral, (R, P) a p-completely smooth prelog
ring over (A/I, M_A), and R → S a p-completely étale map with the pulled-back chart P. Then
Δ̄_{(R,P)/(A,M_A)} ⊗̂^L_R S → Δ̄_{(S,P)/(A,M_A)} is an isomorphism. Consequently the reduced log
prismatic complex Δ̄ is a quasi-coherent derived p-complete complex on strict-étale localisations.
This R-linear statement concerns Δ̄, not the unreduced Δ, which is naturally an A-complex.

Hypotheses (packet): Bounded base prism with integral M_A; (R, P) p-completely smooth over (A/I,
M_A). R → S p-completely étale; same pulled-back chart P; Δ̄ := Δ ⊗^L_A A/I.

Lean form: "`p`-completely étale" is replaced by the stronger étale (Mathlib `Algebra.Etale`); the
completed base change is `completedExtendScalars` along `R → S`. The quasi-coherence consequence is
not typed. -/
theorem etaleLocalization (X : SmoothPrelogAlgebra P) (S : Type u) [CommRing S]
    [Algebra X.toPrelogAlgebra.R S] [Algebra.Etale X.toPrelogAlgebra.R S] :
    Nonempty ((completedExtendScalars (algebraMap X.toPrelogAlgebra.R S)
          (Ideal.span {(p : S)})).obj (reducedAffineCohomology P X.toPrelogAlgebra) ≅
      reducedAffineCohomology P (X.toPrelogAlgebra.ofAlgebra S)) := by
  sorry

end LogPrismaticSite

/-! ## Node `PR.8/smooth-chart-covers` (theorem): Envelopes of smooth charts cover the final object -/

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`): a prelog prism
`(B, IB, M_B)` over the base that is `(p, I)`-completely smooth with a smooth chart, with a
surjection `(B, M_B) → (R, P)` onto a smooth prelog algebra with a smooth chart. -/
def SmoothChartDatum (X : SmoothPrelogAlgebra P) : Type (u + 1) := sorry

/-- The object `(B′, IB′, M_{B′})^a` given by the prelog prismatic envelope of a smooth chart. -/
noncomputable def SmoothChartDatum.envelopeObject {X : SmoothPrelogAlgebra P}
    (c : SmoothChartDatum X) : LogPrismaticSite P (SmoothLogFormalScheme.spf X) := sorry

/-- **Node `PR.8/smooth-chart-covers`** (theorem): Envelopes of smooth charts cover the final
object.

Work with the flat topology. Let (R, P) be p-completely smooth over (A/I, M_A) with M_A → P a smooth
chart, and (B, IB, M_B) a prelog prism over (A, I, M_A) that is (p, I)-completely smooth over (A,
M_A) with M_A → M_B a smooth chart, together with a surjection (B, M_B) → (R, P); let (B′, IB′,
M_{B′}) be its prelog prismatic envelope. Then for every object (C, IC, M_C)^a of ((R, P)/(A,
M_A))_Δ the product of (B′, IB′, M_{B′})^a and (C, IC, M_C)^a exists and is (p, I)-completely
faithfully flat over C; in particular (B′, IB′, M_{B′})^a covers the final object. If (A, M_A) has
rank 1, a smooth lift (R̃, P̃) of (R, P) over (A, M_A) with its rank-1 δ_log-structure gives such a
covering. In the absolute setting, the Breuil–Kisin log prism (W(k)[[u]], (E(u)), u^N)^a covers the
final object of the topos of (O_K, O_K∖{0})_Δ.

Hypotheses (packet): Flat topology; smooth charts in Koshikawa's sense; (A, I) may be assumed
orientable for faithful flatness.

Lean form: the envelope object covers the final object for the flat topology (Mathlib
`GrothendieckTopology.CoversTop`). The existence and complete faithful flatness of the products, the
rank-one smooth-lift variant and the absolute Breuil–Kisin statement are not typed. -/
theorem SmoothChartDatum.coversTop {X : SmoothPrelogAlgebra P} (c : SmoothChartDatum X) :
    (flatTopology (SmoothLogFormalScheme.spf X)).CoversTop (fun _ : Unit => c.envelopeObject) := by
  sorry

end LogPrismaticSite

/-! ## Node `PR.8/log-hodge-tate-map` (construction): The log Hodge–Tate comparison map -/

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

/-- Placeholder (owner `CrystallineCohomology:CR.5:log-algebra`): the module of log differentials
`Ω^1_{(R,P)/(Ā,M_A)}`. -/
def logKaehler (X : PrelogAlgebra P) : Type u := sorry

noncomputable instance (X : PrelogAlgebra P) : AddCommGroup (logKaehler X) := sorry

noncomputable instance (X : PrelogAlgebra P) : Module X.R (logKaehler X) := sorry

/-- `dlog : P → Ω^1_log`, a monoid map to the additive group. -/
noncomputable def dlog (X : PrelogAlgebra P) : X.Q →* Multiplicative (logKaehler X) := sorry

/-- The derivation `d : R → Ω^1_log`. -/
noncomputable def logD (X : PrelogAlgebra P) : X.R → logKaehler X := sorry

/-- `d(α(q)) = α(q) dlog(q)`. -/
theorem logD_alpha (X : PrelogAlgebra P) (q : X.Q) :
    logD X (X.α q) = X.α q • Multiplicative.toAdd (dlog X q) := by
  sorry

/-- Placeholder (node `PR.8/log-hodge-tate-map`): `H^i(Δ̄_{(R,P)/(A,M_A)}){i}`, the Breuil–Kisin
twisted cohomology of the reduced complex. -/
noncomputable def twistedHomology (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P)
    (i : ℕ) : ModuleCat.{u} X.R := sorry

/-- Placeholder (node `PR.8/log-hodge-tate-map`): the Bockstein differential
`β_I : H^i(Δ̄){i} → H^{i+1}(Δ̄){i+1}`. -/
noncomputable def bockstein (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) (i : ℕ) :
    twistedHomology P X i ⟶ twistedHomology P X (i + 1) := sorry

/-- **Node `PR.8/log-hodge-tate-map`** (construction): The log Hodge–Tate comparison map.

Let (A, I, M_A) be bounded with M_A integral and (X, M_X) smooth over (A/I, M_A). The structure map
η^0: O_X → H^0(Δ̄_{(X,M_X)/(A,M_A)}) extends to η^1: Ω^1_{(X,M_X)/(A/I,M_A)} → H^1(Δ̄){1}: locally,
for X = Spf(R) with chart P and an object (B, IB, M_B)^a with exact surjection M_B → P, compose
RΓ(L_{(R,P)/(A,M_A)}) → RΓ(L_{(B/IB,P)/(B,M_B)}) ≅ RΓ(L_{(B/IB,M_B)/(B,M_B)}) ≅ IB/I^2B[1] ≅ I/I^2
⊗^L_{A/I} B/IB[1], take derived global sections over the site and H^0. For every local section m of
M_X^gp, η^1(dlog m)^2 = 0 and β_I(η^1(dlog m)) = 0, where β_I is the Bockstein differential on
H^*(Δ̄){*}. Since Ω^1_log has local bases of the form dlog m, η^1 extends uniquely to a map of
commutative differential graded A/I-algebras η^*: Ω^*_{(X,M_X)/(A/I,M_A)} → (H^*(Δ̄){*}, β_I),
compatible with the O_X-module structures; its composite with the canonical map Ω^1_{R/(A/I)} →
Ω^1_log agrees with the non-log Hodge–Tate map followed by the forgetful comparison map.

Hypotheses (packet): Bounded prelog prism with integral monoid; smoothness in Koshikawa's sense; the
Breuil–Kisin twist {i} = ⊗ I^i/I^{i+1}.

API `LogPrismaticSite.hodgeTateMap` (constructor; node `PR.8/log-hodge-tate-map`): η^*:
Ω^*_{(X,M_X)/(A/I,M_A)} → H^*(Δ̄_{(X,M_X)/(A,M_A)}){*} as a map of cdgas with the Bockstein
differential.

Lean form: the degree-`i` component `η^i : Ω^i_log = ⋀^i Ω^1_log → H^i(Δ̄){i}` as a map of
`R`-modules (affine form); multiplicativity is not typed. -/
noncomputable def hodgeTateMap (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P)
    (i : ℕ) : ModuleCat.of X.R (⋀[X.R]^i (logKaehler X)) ⟶ twistedHomology P X i := sorry

/-! * API `LogPrismaticSite.hodgeTateMap_dlog_sq` (simp; node `PR.8/log-hodge-tate-map`): η^1(dlog
m)^2 = 0 for m ∈ M_X^gp.

  Not typed: the product of the graded algebra `H^*(Δ̄){*}` is not part of the placeholder
`twistedHomology`. -/

/-- API `LogPrismaticSite.hodgeTateMap_bockstein_dlog` (simp; node `PR.8/log-hodge-tate-map`):
β_I(η^1(dlog m)) = 0. -/
theorem hodgeTateMap_bockstein_dlog (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P)
    (q : X.Q) :
    (bockstein P X 1) ((hodgeTateMap P X 1)
      (exteriorPower.ιMulti X.R 1 (fun _ => Multiplicative.toAdd (dlog X q)))) = 0 := by
  sorry

/-! * API `LogPrismaticSite.hodgeTateMap_restrict_nonlog` (compatibility; node
`PR.8/log-hodge-tate-map`): The square comparing the non-log and log Hodge–Tate maps commutes along
the canonical map Ω^1_{X/(A/I)} → Ω^1_log and the map induced by forgetting logs. The differential
map is not asserted to be injective.

  Not typed: PR.1's non-log Hodge–Tate comparison map is outside the PR.0 excerpt this file is
checked against. -/

/-! * API `LogPrismaticSite.hodgeTateMap_cotangent` (characterisation; node
`PR.8/log-hodge-tate-map`): Locally, η^1 is H^0 of the map RΓ(L_{(R,P)/(A,M_A)}) → Δ̄{1}[1] built
from Gabber's log cotangent complex.

  Not typed: needs the map `RΓ(L_{(R,P)/(A,M_A)}) → Δ̄{1}[1]` built from Gabber's log cotangent
complex (DD.6) and the twist, beyond the placeholders here. -/

/-! * API `LogPrismaticSite.hodgeTateMap_natural` (functoriality; node `PR.8/log-hodge-tate-map`):
η^* is natural in (X, M_X) and in maps of bounded prelog prisms.

  Not typed: naturality needs the functoriality of `twistedHomology` in maps of prelog algebras and
of bases, which the placeholder does not carry. -/

/-! * Unit test `LogPrismaticSite.hodgeTateMap_affineLine` (computation; node
`PR.8/log-hodge-tate-map`): For (A/I⟨X_0⟩, M_A ⊕ X_0^N), η^1(dlog X_0) corresponds to the class of
(X_1/X_0 − 1)/d ⊗ d in H^1 of the Čech–Alexander complex, for an orientation d.

  Not typed: identifies a Čech–Alexander cocycle over restricted power series rings; not available.
-/

/-! * Unit test `LogPrismaticSite.hodgeTateMap_degree0` (degenerate; node
`PR.8/log-hodge-tate-map`): η^0: O_X → H^0(Δ̄) is the structure map, independent of the log
structures.

  Not typed: "independent of the log structures" compares `η^0` for two prelog algebras through the
forgetful map on `twistedHomology`, which the placeholder does not carry. -/

/-! * Unit test `LogPrismaticSite.hodgeTateMap_trivialLog` (compatibility; node
`PR.8/log-hodge-tate-map`): With trivial log structures η^* equals PR.1's Hodge–Tate comparison map.

  Not typed: PR.1's Hodge–Tate comparison map is outside the PR.0 excerpt. -/

/-- Unit test `LogPrismaticSite.hodgeTateMap_dlog_not_dx` (non-example; node
`PR.8/log-hodge-tate-map`): η^1(dlog X_0) is not η^1(dX_0): they differ by the factor X_0, which is
not a unit on A/I⟨X_0⟩. -/
theorem hodgeTateMap_dlog_not_dx (P : IntegralBoundedPrelogPrism p A M) [Nontrivial P.bar] :
    (hodgeTateMap P (PrelogAlgebra.logAffineLine P) 1)
        (exteriorPower.ιMulti _ 1 (fun _ => Multiplicative.toAdd
          (dlog (PrelogAlgebra.logAffineLine P) (PrelogAlgebra.logAffineLine.X P)))) ≠
      (hodgeTateMap P (PrelogAlgebra.logAffineLine P) 1)
        (exteriorPower.ιMulti _ 1 (fun _ => logD (PrelogAlgebra.logAffineLine P)
          ((PrelogAlgebra.logAffineLine P).α (PrelogAlgebra.logAffineLine.X P)))) := by
  sorry

end LogPrismaticSite

/-! ## Node `PR.8/hodge-tate-group-lemma` (lemma): Hodge–Tate cohomology of group-ring Čech nerves -/

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]

/-- Placeholder (node `PR.8/hodge-tate-group-lemma`): `Tot(C^•)` for
`C^• = A⟨H ⊕ H_n⟩{(I, (h − 1))/I}_δ ⊗_A A / I`, attached to a surjection `G′ → G` of finitely
generated abelian groups with kernel `H`. -/
noncomputable def groupCechTot (P : Prism p A) {G G' : Type u} [AddCommGroup G] [AddCommGroup G']
    (f : G' →+ G) : DerivedCategory (ModuleCat.{u} P.bar) := sorry

/-- **Node `PR.8/hodge-tate-group-lemma`** (lemma): Hodge–Tate cohomology of group-ring Čech nerves.

Let (A, I) be a bounded prism and G′ → G a surjection of finitely generated abelian groups without
p-torsion, with kernel H; R := A/I⟨G⟩ and A⟨G′⟩ → R. Let B^• be the Čech nerve of the prismatic
envelope B^0 in (R/A)_Δ, H_n := ker((G′)^{⊕(n+1)} → G′), and C^• := A⟨H ⊕ H_n⟩{(I, (h −
1)_{h∈H⊕H_n})/I}_δ ⊗_A A/I, so that B^• ⊗_A A/I ≅ R ⊗̂_{A/I} C^•. Then the map ∧^i(A/I ⊗_Z G) →
H^i(Tot(C^•)){i} induced by g ↦ (g̃ − 1)/d ⊗ d (for a lift g̃ ∈ G′ and an orientation d) is an
isomorphism of A/I-modules for every i.

Hypotheses (packet): G, G′ finitely generated abelian with trivial p-torsion; (A, I) bounded.

Lean form: an isomorphism `⋀^i(A/I ⊗_ℤ G) ≅ H^i(Tot C^•)` of `A/I`-modules (the twist `{i}` is
trivialised by the orientation); that it is induced by `g ↦ (g̃ − 1)/d ⊗ d` is not typed. -/
theorem groupLemma (P : Prism p A) (hb : P.IsBounded) (ho : P.IsOrientable) {G G' : Type u}
    [AddCommGroup G] [AddCommGroup G'] [AddGroup.FG G] [AddGroup.FG G']
    (hG : ∀ g : G, (p : ℤ) • g = 0 → g = 0) (hG' : ∀ g : G', (p : ℤ) • g = 0 → g = 0)
    (f : G' →+ G) (hf : Function.Surjective f) (i : ℕ) :
    Nonempty (ModuleCat.of P.bar (⋀[P.bar]^i (TensorProduct ℤ P.bar G)) ≅
      (DerivedCategory.homologyFunctor _ i).obj (groupCechTot P f)) := by
  sorry

end LogPrismaticSite

/-! ## Node `PR.8/hodge-tate-log-affine-line` (lemma): Hodge–Tate comparison for the log affine line -/

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- **Node `PR.8/hodge-tate-log-affine-line`** (lemma): Hodge–Tate comparison for the log affine
line.

Let (A, I, M_A) be a bounded prelog prism with M_A integral and (R, P) = (A/I⟨X_0⟩, M_A ⊕ X_0^N).
Then η^*: Ω^*_{(R,P)/(A/I,M_A)} → H^*(Δ̄_{(R,P)/(A,M_A)}){*} is an isomorphism; explicitly
H^1(Δ̄){1} ≅ R ⊗_Z X_0^Z with 1 ⊗ X_0 ↦ dlog X_0.

Hypotheses (packet): (A, I, M_A) bounded, M_A integral. -/
theorem hodgeTate_logAffineLine (P : IntegralBoundedPrelogPrism p A M) (i : ℕ) :
    IsIso (hodgeTateMap P (PrelogAlgebra.logAffineLine P) i) := by
  sorry

end LogPrismaticSite

/-! ## Node `PR.8/log-hodge-tate-comparison` (theorem): The log Hodge–Tate comparison -/

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- **Node `PR.8/log-hodge-tate-comparison`** (theorem): The log Hodge–Tate comparison.

Let (A, I, M_A) be a bounded prelog prism with M_A integral and (X, M_X) a log p-adic formal scheme
smooth over (A/I, M_A) in Koshikawa's sense. Then η^*: Ω^*_{(X,M_X)/(A/I,M_A)} →
H^*(Δ̄_{(X,M_X)/(A,M_A)}){*} is an isomorphism of differential graded A/I-algebras (sheaves on
X_ét); in particular Δ̄_{(X,M_X)/(A,M_A)} is a perfect complex. Moreover RΓ(Spf(R)_ét,
L_{(R,P)/(A,M_A)}) ≅ (τ^{≤1}Δ̄_{(R,P)/(A,M_A)}){1}[1] locally.

Hypotheses (packet): (A, I, M_A) bounded with M_A integral. (X, M_X) smooth over (A/I, M_A) in the
sense of Koshikawa Appendix A (integral, relatively coherent charts).

Lean form: the affine (smooth chart) form, degreewise. The sheaf version on `X_ét`, perfectness of
`Δ̄` and the cotangent identification are not typed. -/
theorem hodgeTateComparison (P : IntegralBoundedPrelogPrism p A M) (X : SmoothPrelogAlgebra P)
    (i : ℕ) : IsIso (hodgeTateMap P X.toPrelogAlgebra i) := by
  sorry

end LogPrismaticSite

/-! ## Node `PR.8/log-prismatic-base-change` (theorem): Completed base change for log prismatic cohomology -/

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- **Node `PR.8/log-prismatic-base-change`** (theorem): Completed base change for log prismatic
cohomology.

Let (A, I, M_A) → (A′, IA′, M_{A′}) be a map of bounded prelog prisms with integral monoids, (X,
M_X) smooth over (A/I, M_A) with qcqs underlying formal scheme, and X′ := X ×_{(Spf A/I, M_A)^a}
(Spf A′/IA′, M_{A′})^a (an integral log formal scheme, smooth over the new base). Then RΓ_Δ((X,
M_X)/(A, M_A)) ⊗̂^L_A A′ ≅ RΓ_Δ(X′/(A′, M_{A′})), and the same holds for the sheaves Δ.

Hypotheses (packet): Bounded prelog prisms with integral monoids; base change in the category of
integral log formal schemes; qcqs X for the global form.

Lean form: the global statement for `RΓ_Δ`; the statement for the sheaves `Δ` is not typed. -/
theorem baseChange (P : IntegralBoundedPrelogPrism p A M) (X : SmoothLogFormalScheme P)
    {A' : Type u} [CommRing A'] {M' : Type u} [CommMonoid M']
    (P' : IntegralBoundedPrelogPrism p A' M') (f : IntegralBoundedPrelogPrism.BaseHom P P') :
    Nonempty ((completedExtendScalars f.toHom.toHom.ring P'.pI).obj (cohomology P X) ≅
      cohomology P' (X.baseChange f)) := by
  sorry

end LogPrismaticSite


/-! ## Node `PR.8/delta-log-crystalline-site` (definition): The δ_log-crystalline site -/

/-- The crystalline bases of K1 §6: the prism ideal is `(p)` and `(A, M_A)` is of rank one or a
log ring. -/
structure IntegralBoundedPrelogPrism.CrystallineBase {p : ℕ} [Fact p.Prime] {A : Type u}
    [CommRing A] {M : Type u} [CommMonoid M] (P : IntegralBoundedPrelogPrism p A M) : Prop where
  crystalline : P.toPrism.IsCrystalline
  rank : P.toPrelogPrism.IsRankOne ∨ DeltaLogRing.IsLogRing P.α

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`): smooth log formal
schemes over the base whose mod `p` fibre is of Cartier type over `(A / (p, I), M_A)` (Kato 4.8);
`toSmooth` forgets the condition. -/
def CartierTypeLogFormalScheme {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u}
    [CommMonoid M] (P : IntegralBoundedPrelogPrism p A M) : Type (u + 1) := sorry

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`): smooth affine prelog
algebras with a chart of Cartier type (resp. mod `p` fibre of Cartier type) admitting an exact
surjection from a smooth lift. -/
def CartierTypePrelogAlgebra {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u}
    [CommMonoid M] (P : IntegralBoundedPrelogPrism p A M) : Type (u + 1) := sorry

namespace CartierTypeLogFormalScheme

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

/-- The underlying smooth log formal scheme. -/
noncomputable def toSmooth (X : CartierTypeLogFormalScheme P) : SmoothLogFormalScheme P := sorry

end CartierTypeLogFormalScheme

/-- The underlying smooth prelog algebra. -/
noncomputable def CartierTypePrelogAlgebra.toSmooth {p : ℕ} [Fact p.Prime] {A : Type u}
    [CommRing A] {M : Type u} [CommMonoid M] {P : IntegralBoundedPrelogPrism p A M}
    (X : CartierTypePrelogAlgebra P) : SmoothPrelogAlgebra P := sorry

/-- **Node `PR.8/delta-log-crystalline-site`** (definition): The δ_log-crystalline site.

Let (A, (p), M_A) be a bounded prelog prism with M_A integral and (X, M_X) a log p-adic formal
scheme over (A, M_A). A δ_log-PD triple over (A, M_A) is (B, J, M_B)^a where (B, (p), M_B) is a
bounded prelog prism over (A, (p), M_A) with integral log structure and J ⊂ B is a p-completed PD
ideal with B/J classically p-complete. The (big) δ_log-crystalline site ((X, M_X)/(A, M_A))_δCRYS is
the opposite of the category of δ_log-PD triples with a map f: Spf(B/J) → X over A and an exact
closed immersion (Spf(B/J), f^*M_X) ↪ (Spf(B), M_{Spf(B)}) over (A, M_A), with the étale topology
and structure sheaf O_δCRYS: (B, J, M_B)^a ↦ B. Dropping δ and δ_log gives a version ((X, M_X)/(A,
M_A))_CRYS of the big log crystalline site with étale topology; forgetting is a cocontinuous functor
inducing u_X^δ: Shv(δCRYS) → Shv(X_ét) and a canonical map Ru_{X*}O_CRYS → Ru^δ_{X*}O_δCRYS.

Hypotheses (packet): I = (p); (A, M_A) of rank 1 or a log ring (so A is p-torsion free); objects
only those receiving a map from (A, (p), M_A) (a chart-dependent simplification, K1 §6.1).

API `DeltaLogCrystallineSite` (constructor; node `PR.8/delta-log-crystalline-site`): The site ((X,
M_X)/(A, M_A))_δCRYS with étale topology.

Placeholder carrier (node `PR.8/delta-log-crystalline-site`). Lean form: the base is a crystalline
base (`I = (p)`, rank one or log ring; `IntegralBoundedPrelogPrism.CrystallineBase`) and the PD
ideal is `(p)`; the general PD ideal `I ∋ p` of the packet is not typed. -/
def DeltaLogCrystallineSite {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u}
    [CommMonoid M] (P : IntegralBoundedPrelogPrism p A M) (hP : P.CrystallineBase)
    (X : SmoothLogFormalScheme P) : Type (u + 1) := sorry

namespace DeltaLogCrystallineSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

noncomputable instance (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    Category.{u} (DeltaLogCrystallineSite P hP X) := sorry

/-- The étale topology of the δ_log-crystalline site. -/
noncomputable def topology (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    GrothendieckTopology (DeltaLogCrystallineSite P hP X) := sorry

/-- API `DeltaLogCrystallineSite.structureSheaf` (data; node `PR.8/delta-log-crystalline-site`):
O_δCRYS: (B, J, M_B)^a ↦ B. -/
noncomputable def structureSheaf (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    Sheaf (topology hP X) CommRingCat.{u} := sorry

/-- Placeholder (owner `CrystallineCohomology:CR.5`): the big log crystalline site
`((X, M_X)/(A, M_A))_CRYS` with the étale topology. -/
def BigLogCrystalline (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    Type (u + 1) := sorry

noncomputable instance (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    Category.{u} (BigLogCrystalline hP X) := sorry

/-- The étale topology of the big log crystalline site. -/
noncomputable def BigLogCrystalline.topology (hP : P.CrystallineBase)
    (X : SmoothLogFormalScheme P) : GrothendieckTopology (BigLogCrystalline hP X) := sorry

/-- API `DeltaLogCrystallineSite.toBigLogCrystalline` (functoriality; node
`PR.8/delta-log-crystalline-site`): The cocontinuous forgetful functor to the big log crystalline
site ((X, M_X)/(A, M_A))_CRYS and the map Ru_{X*}O_CRYS → Ru^δ_{X*}O_δCRYS. -/
noncomputable def toBigLogCrystalline (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    DeltaLogCrystallineSite P hP X ⥤ BigLogCrystalline hP X := sorry

theorem toBigLogCrystalline_isCocontinuous (hP : P.CrystallineBase)
    (X : SmoothLogFormalScheme P) :
    (toBigLogCrystalline hP X).IsCocontinuous (topology hP X) (BigLogCrystalline.topology hP X) := by
  sorry

/-- Placeholder (owner `CrystallineCohomology:CR.5`): `RΓ(X_ét, Ru_{X*} O_CRYS)`, log crystalline
cohomology. -/
noncomputable def logCrystallineCohomology (P : IntegralBoundedPrelogPrism p A M)
    (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    DerivedCategory (ModuleCat.{u} A) := sorry

/-- Placeholder (node `PR.8/delta-log-crystalline-site`): `RΓ(X_ét, Ru^δ_{X*} O_δCRYS)`. -/
noncomputable def cohomology (P : IntegralBoundedPrelogPrism p A M) (hP : P.CrystallineBase)
    (X : SmoothLogFormalScheme P) : DerivedCategory (ModuleCat.{u} A) := sorry

/-- The canonical map `Ru_{X*} O_CRYS → Ru^δ_{X*} O_δCRYS` on global sections. -/
noncomputable def fromLogCrystalline (P : IntegralBoundedPrelogPrism p A M)
    (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    logCrystallineCohomology P hP X ⟶ cohomology P hP X := sorry

/-! * API `DeltaLogCrystallineSite.pd_compatible` (relation; node
`PR.8/delta-log-crystalline-site`): For a PD ideal I of A, the divided powers of I and J are
compatible on every object.

  Not typed: divided powers on the rings of objects of the placeholder site are not recorded
(Mathlib `DividedPowers` would have to be attached objectwise). -/

/-- API `DeltaLogCrystallineSite.toEtale` (projection; node `PR.8/delta-log-crystalline-site`): The
morphism of topoi u^δ_X to X_ét.

Lean form: the direct image `u^δ_{X*}` on sheaves of sets. -/
noncomputable def toEtale (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    Sheaf (topology hP X) (Type u) ⥤ Sheaf X.etaleTopology (Type u) := sorry

/-- Unit test `DeltaLogCrystallineSite.point` (degenerate; node `PR.8/delta-log-crystalline-site`):
For X = Spf(A/p) with log structure M_A, the triple (A, (p), M_A)^a is final and RΓ_δCRYS = A. -/
theorem point (P : IntegralBoundedPrelogPrism p A M) (hP : P.CrystallineBase) :
    Nonempty (cohomology P hP (SmoothLogFormalScheme.spf (SmoothPrelogAlgebra.base P)) ≅
      (DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A A)) := by
  sorry

/-! * Unit test `DeltaLogCrystallineSite.trivialLog_compat` (compatibility; node
`PR.8/delta-log-crystalline-site`): With trivial log structures, the cohomology agrees with
crystalline cohomology for smooth X (BS22 Theorem 5.2's δ-crystalline site).

  Not typed: compares with non-log crystalline cohomology of smooth `X` (CR.5) through BS22 Theorem
5.2's δ-crystalline site, which is not part of the PR.0 excerpt. -/

/-! * Unit test `DeltaLogCrystallineSite.not_all_pd_thickenings` (non-example; node
`PR.8/delta-log-crystalline-site`): A PD thickening (B, J) with B having p-torsion is not an object:
objects are bounded prelog prisms with I = (p), so B is p-torsion free.

  Not typed: a statement about which PD thickenings are objects of the placeholder site. -/

/-! * Unit test `DeltaLogCrystallineSite.affineLine` (computation; node
`PR.8/delta-log-crystalline-site`): For (A/p⟨X⟩, M_A ⊕ N), the rank-one triple (A⟨X⟩, (p), M_A ⊕
N)^a is an object, but it is not asserted weakly final: an arbitrary target log generator can have
nonzero δ_log. A weakly final object for the Čech computation is obtained from the free δ_log ring
and its log PD envelope (K1 Construction 6.6).

  Not typed: membership of a restricted power series triple in the placeholder site; restricted
power series rings are not in Mathlib. -/

end DeltaLogCrystallineSite

/-! ## Node `PR.8/delta-log-crystalline-vs-log-crystalline` (theorem): δ_log-crystalline cohomology is log crystalline cohomology -/

namespace DeltaLogCrystallineSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- **Node `PR.8/delta-log-crystalline-vs-log-crystalline`** (theorem): δ_log-crystalline cohomology
is log crystalline cohomology.

Let I ⊂ A be a p-completed PD ideal with A/I classically p-complete and (X, M_X) smooth over (A/I,
M_A). Then the natural map Ru_{X*}O_CRYS → Ru^δ_{X*}O_δCRYS is an isomorphism of E_∞-A-algebras on
X_ét. Moreover, for every m ≥ 1 reduction mod p^m identifies Ru_{X*}O_CRYS ⊗^L A/p^m with
Ru^crys_*O_{(X,M_X)/(A/p^m,M_A)} (small log crystalline site), and passing to the limit
Ru^crys_*O_{(X,M_X)/(A,M_A)} ≅ Ru_{X*}O_CRYS. When I ∋ p and the chart M_A → P is integral and
weakly finitely generated, the Čech nerve of the p-completed log PD envelope of a surjection from a
p-completely smooth δ_log-ring of topologically finite presentation, and also the log de Rham
complex with coefficients in that envelope, compute these cohomologies.

Hypotheses (packet): I a p-completed PD ideal, A/I classically p-complete; (X, M_X) smooth over
(A/I, M_A) in Koshikawa's sense; (A, (p), M_A) bounded of rank 1 or a log ring.

Lean form: on global sections over the crystalline base (PD ideal `(p)`); the reductions mod `p^m`,
the limit statement and the Čech/de Rham computations are not typed. -/
theorem fromLogCrystalline_isIso (P : IntegralBoundedPrelogPrism p A M)
    (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    IsIso (fromLogCrystalline P hP X) := by
  sorry

end DeltaLogCrystallineSite

/-! ## Node `PR.8/cartier-type-cosimplicial-frobenius` (lemma): Cosimplicial relative Frobenius for Cartier-type monoid maps -/

/-! ### Node `PR.8/cartier-type-cosimplicial-frobenius` (lemma): Cosimplicial relative Frobenius for
Cartier-type monoid maps

Statement: Let k be a ring with a prelog structure M → k, M → Q an injective integral map of
integral monoids with G := Q^gp/M^gp, and Q^(1) the base change of M → Q along the p-th power map of
M, with relative Frobenius Q^(1) → Q. Consider the cosimplicial k-algebras A^• = k ⊗_{Z[M]} Z[Q ⊕
G^•], A^{•(1)} and B^• (the Čech-type nerves of K1 Appendix B). If Q^(1) → Q is exact and injective
(M → Q of Cartier type), the projection pr^•: A^• → B^• (killing q ∉ Q^(1)) is homotopic to the
identity as a map of cosimplicial A^{•(1)}-modules, so B^• ⊗_{A^{•(1)}} M^• → A^• ⊗_{A^{•(1)}} M^•
is a homotopy equivalence for every cosimplicial A^{•(1)}-module M^•. If moreover G is free abelian,
M^• → A^• ⊗_{A^{•(1)}} M^• is a quasi-isomorphism on associated cochain complexes of k-modules.

Not typed: the cosimplicial algebras `A^• = k ⊗_{ℤ[M]} ℤ[Q ⊕ G^•]`, `A^{•(1)}`, `B^•` of K1 Appendix
B and the Cartier-type condition (exactness of the relative Frobenius `Q^(1) → Q` of a monoid
pushout) each need a construction of their own, and an opaque placeholder for `A^•` would leave the
homotopy statement without content. -/

/-! ## Node `PR.8/crystalline-comparison-map` (construction): The log crystalline comparison map -/

namespace IntegralBoundedPrelogPrism

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- The Frobenius-twisted base `(φ_* A, (p), φ_* M_A)` of a crystalline base of rank one or with
`(A, M_A)` a log ring (node `PR.8/crystalline-comparison-map`). -/
noncomputable def frobeniusTwist (P : IntegralBoundedPrelogPrism p A M)
    (hP : P.CrystallineBase) : IntegralBoundedPrelogPrism p A M := sorry

end IntegralBoundedPrelogPrism

/-- The base change `(X^(1), M_X^(1))` along `ψ : (A/I, M_A) → (φ_* A / p, φ_* M_A)`. -/
noncomputable def SmoothLogFormalScheme.frobeniusTwist {p : ℕ} [Fact p.Prime] {A : Type u}
    [CommRing A] {M : Type u} [CommMonoid M] {P : IntegralBoundedPrelogPrism p A M}
    (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    SmoothLogFormalScheme (P.frobeniusTwist hP) := sorry

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
  {P : IntegralBoundedPrelogPrism p A M}

/-- **Node `PR.8/crystalline-comparison-map`** (construction): The log crystalline comparison map.

Let (A, (p), M_A) be a bounded prelog prism with M_A integral, of rank 1 or with (A, M_A) a log
ring, I ⊂ A a PD ideal containing p, and ψ: (A/I, M_A) → (φ_*A/p, φ_*M_A) the factorisation of
Frobenius. For (X, M_X) over A/I let (X^(1), M_X^(1)) be its base change along ψ. There is a
cocontinuous functor ((X, M_X)/(A, M_A))_δCRYS → ((X^(1), M_X^(1))/(φ_*A, φ_*M_A))_Δ sending (B, J,
M_B)^a (with (B, M_B) a log ring) to (φ_*B, (p), M_B^(1))^a, where M_B^(1) = M_B ⊔_{M_A, φ_{M_A}}
φ_*M_A with M_B^(1) → φ_*M_B induced by φ_{M_B}, and Spf(φ_*B/p) → X^(1) induced by ψ_B: B/J →
φ_*B/p. It induces a morphism of ringed topoi (Shv(δCRYS), φ_*O_δCRYS) → (Shv(log prismatic site of
X^(1)), O_Δ) and hence the crystalline comparison map Δ_{(X^(1),M^(1))/(φ_*A,φ_*M_A)} →
φ_*Ru^δ_{X*}O_δCRYS of E_∞-φ_*A-algebras on X_ét, compatible with Frobenius.

Hypotheses (packet): I = (p) prism; M_A integral; (A, M_A) of rank 1 or a log ring; I ⊂ A a PD ideal
containing p.

API `LogPrismaticSite.crystallineFunctor` (constructor; node `PR.8/crystalline-comparison-map`): The
cocontinuous functor ((X, M_X)/(A, M_A))_δCRYS → ((X^(1), M^(1))/(φ_*A, φ_*M_A))_Δ. -/
noncomputable def crystallineFunctor (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    DeltaLogCrystallineSite P hP X ⥤ LogPrismaticSite (P.frobeniusTwist hP) (X.frobeniusTwist hP) :=
  sorry

/-- API `LogPrismaticSite.crystallineFunctor_cocontinuous` (other; node
`PR.8/crystalline-comparison-map`): The functor is cocontinuous for the étale topologies. -/
theorem crystallineFunctor_cocontinuous (hP : P.CrystallineBase)
    (X : SmoothLogFormalScheme P) :
    (crystallineFunctor hP X).IsCocontinuous (DeltaLogCrystallineSite.topology hP X)
      (topology (X.frobeniusTwist hP)) := by
  sorry

/-- API `LogPrismaticSite.crystallineComparisonMap` (constructor; node
`PR.8/crystalline-comparison-map`): The induced map Δ_{(X^(1),M^(1))/(φ_*A,φ_*M_A)} →
φ_*Ru^δ_{X*}O_δCRYS of E_∞-algebras.

Lean form: on global sections, `RΓ_Δ((X^(1), M^(1))/(φ_* A, φ_* M_A)) → φ_* RΓ_δCRYS` in `D(A)`,
with `φ_*` PR.0's `frobeniusPushforward`. -/
noncomputable def crystallineComparisonMap (P : IntegralBoundedPrelogPrism p A M)
    (hP : P.CrystallineBase) (X : SmoothLogFormalScheme P) :
    cohomology (P.frobeniusTwist hP) (X.frobeniusTwist hP) ⟶
      (frobeniusPushforward P.toPrism).obj (DeltaLogCrystallineSite.cohomology P hP X) := sorry

/-! * API `LogPrismaticSite.crystallineComparisonMap_frobenius` (compatibility; node
`PR.8/crystalline-comparison-map`): The comparison map is compatible with the Frobenius
endomorphisms.

  Not typed: the Frobenius endomorphism of δ_log-crystalline cohomology is not part of the
placeholder `DeltaLogCrystallineSite.cohomology`. -/

/-! * API `LogPrismaticSite.crystallineComparisonMap_natural` (functoriality; node
`PR.8/crystalline-comparison-map`): Natural in (X, M_X) and in the base.

  Not typed: naturality needs functoriality of both placeholder cohomologies in `X` and in the base.
-/

/-- Unit test `LogPrismaticSite.crystallineComparisonMap_point` (degenerate; node
`PR.8/crystalline-comparison-map`): For X = Spf(A/I) with log structure M_A, the comparison map is
the identity of φ_*A.

Lean form: for the base point the comparison map is an isomorphism (both sides are `φ_* A`); that it
is the identity is not typed. -/
theorem crystallineComparisonMap_point (P : IntegralBoundedPrelogPrism p A M)
    (hP : P.CrystallineBase) :
    IsIso (crystallineComparisonMap P hP
      (SmoothLogFormalScheme.spf (SmoothPrelogAlgebra.base P))) := by
  sorry

/-! * Unit test `LogPrismaticSite.crystallineComparisonMap_trivialLog` (compatibility; node
`PR.8/crystalline-comparison-map`): With trivial log structures it equals the map of PR.1's
crystalline comparison (BS22 Theorem 5.2).

  Not typed: PR.1's crystalline comparison map is outside the PR.0 excerpt. -/

/-! * Unit test `LogPrismaticSite.crystallineFunctor_logPoint` (computation; node
`PR.8/crystalline-comparison-map`): For the log point (k, N → 0) over (W(k), (p), N → 0), the
functor sends the object (W(k), (p), N) to (φ_*W(k), (p), N^(1)) with N^(1) = N ⊔_{N, ·p} N.

  Not typed: describes the image of a specific object of the placeholder site. -/

/-! * Unit test `LogPrismaticSite.crystallineFunctor_untwisted_fails` (non-example; node
`PR.8/crystalline-comparison-map`): Without the Frobenius twist (sending (B, J, M_B) to (B, (p),
M_B)) one does not get an object over X: Spf(B/p) need not map to X since only B/J does.

  Not typed: a statement about objects of the placeholder site. -/

end LogPrismaticSite

/-! ## Node `PR.8/local-crystalline-comparison` (theorem): Local log crystalline comparison -/

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- **Node `PR.8/local-crystalline-comparison`** (theorem): Local log crystalline comparison.

In the setting of the comparison map, let (R, P) be a smooth prelog ring over (A/I, M_A) with P
integral, M_A → P integral, (weakly) finitely generated and of Cartier type (M_A/M_A^× → P/P^×
integral with exact relative Frobenius P^(1) → P), and assume (R, P) admits an exact surjection from
a smooth lift (R̃, P̃) over (A/p, M_A). Then there is a canonical isomorphism
Δ_{(R^(1),P^(1))/(φ_*A,φ_*M_A)} ≅ φ_*RΓ_crys((R, P)/(A, M_A)) of E_∞-φ_*A-algebras compatible with
Frobenius; by base change the left side is the p-completed base change of Δ_{(R̃,P̃)/(A,M_A)} along
φ.

Hypotheses (packet): As in the comparison map; Cartier type of M_A → P; existence of the exact
surjection from a smooth lift.

Lean form: the comparison map is an isomorphism on `Spf` of a smooth affine prelog algebra of
Cartier type with an exact surjection from a smooth lift (placeholder `CartierTypePrelogAlgebra`,
CR.5); the base-change description is not typed. -/
theorem localCrystallineComparison (P : IntegralBoundedPrelogPrism p A M)
    (hP : P.CrystallineBase) (X : CartierTypePrelogAlgebra P) :
    IsIso (crystallineComparisonMap P hP (SmoothLogFormalScheme.spf X.toSmooth)) := by
  sorry

end LogPrismaticSite

/-! ## Node `PR.8/log-crystalline-comparison` (theorem): The log crystalline comparison -/

namespace LogPrismaticSite

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- **Node `PR.8/log-crystalline-comparison`** (theorem): The log crystalline comparison.

Let (A, (p), M_A) be a bounded prelog prism with M_A integral, of rank 1 or with (A, M_A) a log
ring, I a PD ideal of A containing p, and (X, M_X) a smooth log scheme over (A/I, M_A) of Cartier
type (Kato 4.8). Then the crystalline comparison map is an isomorphism of E_∞-φ_*A-algebras on X_ét:
Δ_{(X^(1),M_X^(1))/(φ_*A,φ_*M_A)} ≅ φ_*Ru^crys_*O_crys. Globally, for I = (p) and X qcqs of Cartier
type over (A/p, M_A): RΓ_logcrys((X, M_X)/(A, M_A)) ≅ RΓ_Δ((X, M_X)/(A, M_A)) ⊗̂^L_{A,φ_A} A,
φ-equivariantly, as E_∞-A-algebras.

Hypotheses (packet): I = (p); Cartier type over (A/I, M_A); smoothness in Koshikawa's sense; qcqs
for the global statement.

Lean form: for `I = (p)` and `X` of Cartier type (placeholder `CartierTypeLogFormalScheme`, CR.5),
the comparison map is an isomorphism and `RΓ_logcrys ≅ RΓ_Δ ⊗̂^L_{A, φ_A} A`; φ-equivariance and the
`E_∞` structure are not typed. -/
theorem logCrystallineComparison (P : IntegralBoundedPrelogPrism p A M)
    (hP : P.CrystallineBase) (X : CartierTypeLogFormalScheme P) :
    IsIso (crystallineComparisonMap P hP X.toSmooth) ∧
      Nonempty (DeltaLogCrystallineSite.logCrystallineCohomology P hP X.toSmooth ≅
        (completedExtendScalars P.toPrism.φ (Ideal.span {(p : A)})).obj
          (cohomology P X.toSmooth)) := by
  sorry

end LogPrismaticSite


/-! ## Node `PR.8/log-q-pd-triple` (definition): Log q-PD triples and log q-PD envelopes -/

/-- The `q`-integer `[n]_q = 1 + q + ⋯ + q^{n-1}`: PR.0's `TauCeti.Prismatic.qAnalog`. -/
abbrev qNumber {R : Type*} [CommRing R] (q : R) (n : ℕ) : R := TauCeti.Prismatic.qAnalog q n

/-- **Node `PR.8/log-q-pd-triple`** (definition): Log q-PD triples and log q-PD envelopes.

Let A = Z_p[[q − 1]] with δ(q) = 0 and [p]_q = (q^p − 1)/(q − 1). A q-PD pair is a (p,
[p]_q)-complete δ-pair (D, I) over (A, (q − 1)) such that (D, ([p]_q)) is a bounded prism over (A,
([p]_q)), φ(I) ⊂ [p]_q D and γ(I) ⊂ I where γ(x) = φ(x)/[p]_q − δ(x), D/(q − 1) is p-torsion free
with finite (p, [p]_q)-complete Tor amplitude over D, and D/I is classically p-complete. A prelog
q-PD triple is (D, I, M_D) with (D, I) a q-PD pair and (D, I, M_D) a δ_log-triple; a log q-PD triple
is (D, I, M_{Spf(D)}) arising as (D, [p]_q, M_D)^a. Étale maps lift uniquely (Lemma 7.3). For a
prelog q-PD triple (D_1, I_1, M_{D_1}) with integral monoid, a p-completely smooth (R, P) over
(D_1/I_1, M_{D_1}) with M_{D_1} → P integral and weakly finitely generated admitting a smooth lift,
and a surjection (D_2, M_{D_2}) → (R, P) as in Lemma 7.4, there is a universal map to a prelog q-PD
triple (D_3, I_3, M_{D_3}) with an exact surjection M_{D_3} → P and D_2/I_2 ≅ D_3/I_3; D_3 is (p,
[p]_q)-completely flat over D_1, the construction commutes with completed base change, and D_3 ⊗̂
D_1/(q − 1) is the p-completed log PD envelope. This is the log q-PD envelope.

Hypotheses (packet): A = Z_p[[q − 1]]; (D_1, I_1, M_{D_1}) a prelog q-PD triple with integral
M_{D_1}. (R, P) p-completely smooth over (D_1/I_1, M_{D_1}); M_{D_1} → P integral and weakly
finitely generated; (R, P)^a admits a smooth lift over (D_1, M_{D_1}). A surjection (D_{2,0},
M_{D_2}) → (R, P) over (D_1, M_{D_1}) satisfies one of: (i) (D_{2,0}, M_{D_2}) is a (p,
[p]_q)-completely smooth δ_log ring of topologically finite presentation; (ii) M_{D_1} → M_{D_2} is
injective integral, M_{D_2}^gp/M_{D_1}^gp is free abelian, and D_{2,0} is (p, [p]_q)-completely free
over the completion of D_1 ⊗_{Z_(p)[M_{D_1}]} Z_(p)[M_{D_2}]. In (i), D_2 = D_{2,0}; in (ii), D_2 is
the completed universal δ_log ring generated by D_{2,0}. I_{2,0} = ker(D_{2,0} → R), and I_2 is the
(p, [p]_q)-completion of I_{2,0}D_2.

API `LogQPDTriple` (constructor; node `PR.8/log-q-pd-triple`): A prelog q-PD triple (D, I, M_D) over
Z_p[[q − 1]].

Placeholder carrier (node `PR.8/log-q-pd-triple`, with PR.6's `q`-PD pairs): prelog `q`-PD triples
over `ℤ_p⟦q − 1⟧` (Mathlib `PowerSeries ℤ_[p]`, `q = 1 + X`), with the projections below. -/
def LogQPDTriple (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

namespace LogQPDTriple

variable {p : ℕ} [Fact p.Prime]

/-- The ring `D`. -/
def D (T : LogQPDTriple.{u} p) : Type u := sorry

noncomputable instance (T : LogQPDTriple.{u} p) : CommRing T.D := sorry

/-- The monoid `M_D`. -/
def M (T : LogQPDTriple.{u} p) : Type u := sorry

noncomputable instance (T : LogQPDTriple.{u} p) : CommMonoid T.M := sorry

/-- The underlying δ_log-triple `(D, I, M_D)`. -/
noncomputable def toDeltaLogTriple (T : LogQPDTriple.{u} p) : DeltaLogTriple p T.D T.M := sorry

/-- `D` is an algebra over `ℤ_p⟦q − 1⟧`. -/
noncomputable instance (T : LogQPDTriple.{u} p) : Algebra (PowerSeries ℤ_[p]) T.D := sorry

/-- The image of `q`. -/
noncomputable def q (T : LogQPDTriple.{u} p) : T.D := sorry

theorem q_eq (T : LogQPDTriple.{u} p) :
    T.q = algebraMap (PowerSeries ℤ_[p]) T.D (1 + PowerSeries.X) := by
  sorry

/-- API `LogQPDTriple.gamma_mem` (relation; node `PR.8/log-q-pd-triple`): For x ∈ I, γ(x) =
φ(x)/[p]_q − δ(x) ∈ I. -/
theorem gamma_mem (T : LogQPDTriple.{u} p) (x : T.D) (hx : x ∈ T.toDeltaLogTriple.ideal) :
    ∃ y : T.D, frob T.toDeltaLogTriple.delta x = qNumber T.q p * y ∧
      y - T.toDeltaLogTriple.delta.delta x ∈ T.toDeltaLogTriple.ideal := by
  sorry

/-! * API `LogQPDTriple.etaleLift` (characterisation; node `PR.8/log-q-pd-triple`): A p-completely
étale D/I → Ē lifts uniquely to a prelog q-PD triple (E, J, M_D) over (D, I, M_D) (Lemma 7.3).

  Not typed: "`p`-completely étale" maps and uniqueness up to isomorphism of placeholder triples are
not available. -/

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`): the data of Lemma 7.4 —
`(R, P)` smooth over `(D_1/I_1, M_{D_1})` with integral weakly finitely generated chart and a
smooth lift, and a surjection `(D_2, M_{D_2}) → (R, P)` of type (i) or (ii). -/
def EnvelopeDatum (T : LogQPDTriple.{u} p) : Type (u + 1) := sorry

/-- API `LogQPDTriple.envelope` (constructor; node `PR.8/log-q-pd-triple`): The log q-PD envelope
(D_3, I_3, M_{D_3}) of Lemma 7.4. -/
noncomputable def envelope {T : LogQPDTriple.{u} p} (S : EnvelopeDatum T) : LogQPDTriple.{u} p :=
  sorry

/-- The structure map `D_1 → D_3`. -/
noncomputable def envelope.map {T : LogQPDTriple.{u} p} (S : EnvelopeDatum T) :
    T.D →+* (envelope S).D := sorry

/-! * API `LogQPDTriple.envelope_flat` (other; node `PR.8/log-q-pd-triple`): D_3 is (p,
[p]_q)-completely flat over D_1.

  Not typed: `(p, [p]_q)`-complete flatness is not in Mathlib (plain flatness would be a false
strengthening). -/

/-! * API `LogQPDTriple.envelope_mod_q_sub_one` (compatibility; node `PR.8/log-q-pd-triple`): D_3
⊗̂_{D_1} D_1/(q − 1) is the p-completed log PD envelope of I_2/(q − 1) (CR.5).

  Not typed: CR.5's `p`-completed log PD envelope is not available as a carrier here. -/

/-! * Unit test `LogQPDTriple.ainf_example` (computation; node `PR.8/log-q-pd-triple`): (A_inf(O_C),
(ξ), O_C♭∖{0}) with q = [ε] is a prelog q-PD triple and ξ = φ^{-1}([p]_q).

  Not typed: needs `A_inf(O_C)` with `q = [ε]` for a complete algebraically closed field; not
available. -/

/-! * Unit test `LogQPDTriple.q_eq_one` (compatibility; node `PR.8/log-q-pd-triple`): At q = 1 a
prelog q-PD triple is the same as a pre-δ_log-PD triple (D p-torsion free and p-complete, D/I
classically p-complete, I with divided powers).

  Not typed: pre-δ_log-PD triples (CR.5 divided powers on δ_log-triples) are not a carrier here. -/

/-! * Unit test `LogQPDTriple.trivial_envelope` (degenerate; node `PR.8/log-q-pd-triple`): For (R,
P) = (D_1/I_1, M_{D_1}) and the identity surjection, the envelope is (D_1, I_1, M_{D_1}).

  Not typed: an identification of two placeholder triples would be an equality of opaque values
without content. -/

/-- Unit test `LogQPDTriple.not_q_minus_one_ideal` (non-example; node `PR.8/log-q-pd-triple`):
(Z_p[[q − 1]], (q − 1)) is a q-PD pair but ([p]_q) cannot be replaced by (q − 1) as the prism ideal:
(Z_p[[q − 1]], (q − 1)) is not a prism.

Lean form of the second assertion: with the δ-structure `δ(q) = 0` (`φ(q) = q ^ p`), there is no
PR.0 prism on `ℤ_p⟦q − 1⟧` with ideal `(q − 1)`. -/
theorem not_q_minus_one_ideal (δ : TauCeti.Delta.Structure p (PowerSeries ℤ_[p]))
    (hδ : frob δ (1 + PowerSeries.X) = (1 + PowerSeries.X) ^ p) :
    ¬ ∃ P : Prism p (PowerSeries ℤ_[p]), P.δ = δ ∧ P.I = Ideal.span {PowerSeries.X} := by
  sorry

end LogQPDTriple

/-! ## Node `PR.8/log-q-crystalline-site` (definition): The log q-crystalline site -/

namespace LogQPDTriple

variable {p : ℕ} [Fact p.Prime]

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`): log `p`-adic formal
schemes smooth over `(D/I, M_D)` (with integral log structure). -/
def SmoothScheme (T : LogQPDTriple.{u} p) : Type (u + 1) := sorry

/-- `Spf(D/I)` with the log structure from `M_D`. -/
noncomputable def SmoothScheme.base (T : LogQPDTriple.{u} p) : SmoothScheme T := sorry

end LogQPDTriple

/-- **Node `PR.8/log-q-crystalline-site`** (definition): The log q-crystalline site.

Fix a prelog q-PD triple (D, I, M_D) with M_D integral and (X, M_X) smooth over (D/I, M_D). The log
q-crystalline site ((X, M_X)/(D, M_D))_qCRYS is the opposite of the category of log q-PD triples (E,
J, M_{Spf(E)}) from prelog q-PD triples (E, J, M_E) over (D, I, M_D) with M_E integral, with f:
Spf(E/J) → X over D/I and an exact closed immersion (Spf(E/J), f^*M_X) ↪ (Spf(E), M_{Spf(E)}) over
(D, M_D); étale topology; structure sheaf O_qCRYS: E ↦ E. Write RΓ_qCRYS((X, M_X)/(D, M_D)), a (p,
[p]_q)-complete E_∞-D-algebra with φ_D-semilinear endomorphism, and qΩ_{(X,M_X)/(D,M_D)} :=
Ru^q_{X*}O_qCRYS on X_ét. For affine X with a smooth lift and integral weakly finitely generated
chart, the Čech nerve of the log q-PD envelope of a free surjection computes it (Construction 7.8),
strictly functorially for (E_0, M_E) = (D⟨N^R, N^P⟩, M_D ⊕ N^P). At q = 1 it is the
δ_log-crystalline site.

Hypotheses (packet): (D, I, M_D) prelog q-PD triple with M_D integral; (X, M_X) smooth over (D/I,
M_D).

API `LogQCrystallineSite` (constructor; node `PR.8/log-q-crystalline-site`): The site ((X, M_X)/(D,
M_D))_qCRYS.

Placeholder carrier (node `PR.8/log-q-crystalline-site`): the underlying category. -/
def LogQCrystallineSite {p : ℕ} [Fact p.Prime] (T : LogQPDTriple.{u} p) (X : T.SmoothScheme) :
    Type (u + 1) := sorry

namespace LogQCrystallineSite

variable {p : ℕ} [Fact p.Prime]

noncomputable instance (T : LogQPDTriple.{u} p) (X : T.SmoothScheme) :
    Category.{u} (LogQCrystallineSite T X) := sorry

/-- The étale topology. -/
noncomputable def topology (T : LogQPDTriple.{u} p) (X : T.SmoothScheme) :
    GrothendieckTopology (LogQCrystallineSite T X) := sorry

/-- API `LogQCrystallineSite.qOmega` (constructor; node `PR.8/log-q-crystalline-site`):
qΩ_{(X,M_X)/(D,M_D)} = Ru^q_{X*}O_qCRYS, an E_∞-D-algebra on X_ét with φ_D-semilinear Frobenius.

Lean form: global sections `RΓ_qCRYS((X, M_X)/(D, M_D)) = RΓ(X_ét, qΩ)` in `D(D)`. -/
noncomputable def qOmega (T : LogQPDTriple.{u} p) (X : T.SmoothScheme) :
    DerivedCategory (ModuleCat.{u} T.D) := sorry

/-! * API `LogQCrystallineSite.cech` (characterisation; node `PR.8/log-q-crystalline-site`): For
affine X with chart and smooth lift, the Čech nerve of a log q-PD envelope computes qΩ (Construction
7.8, Remark 7.9).

  Not typed: the Čech nerve of a log `q`-PD envelope of a free surjection lives over restricted
power series rings, which are not typed. -/


/-! * API `LogQCrystallineSite.strict_change` (other; node `PR.8/log-q-crystalline-site`): For a
strict map (D, I, M_D) → (D, I′, M_D), qΩ_{(X,M_X)/(D,M_D)} ≅ qΩ_{(X,M_X)_{D/I′}/(D,M_D)} (Lemma
7.12).

  Not typed: base change of placeholder schemes along a strict change of the `q`-PD ideal is not set
up. -/

/-- Unit test `LogQCrystallineSite.point` (degenerate; node `PR.8/log-q-crystalline-site`): For X =
Spf(D/I) with log structure M_D, qΩ = D. -/
theorem point (T : LogQPDTriple.{u} p) :
    Nonempty (qOmega T (LogQPDTriple.SmoothScheme.base T) ≅
      (DerivedCategory.singleFunctor (ModuleCat.{u} T.D) 0).obj (ModuleCat.of T.D T.D)) := by
  sorry

/-! * Unit test `LogQCrystallineSite.q_eq_one` (compatibility; node `PR.8/log-q-crystalline-site`):
If q = 1 in D the site is the δ_log-crystalline site.

  Not typed: an identification of the placeholder sites themselves; the cohomological form at `q −
1` is `LogQCrystallineSite.ofDeltaLogCrystalline_isIso`. -/

/-! * Unit test `LogQCrystallineSite.affineLine_complex` (computation; node
`PR.8/log-q-crystalline-site`): For (D/I⟨X⟩, M_D ⊕ N) with D flat over A, qΩ is computed by the
two-term complex D⟨X⟩ → D⟨X⟩·dlog X, f ↦ (γ(f) − f)/(q − 1)·dlog X with γ(X) = qX (Construction 7.15
with S a point).

  Not typed: the two-term complex lives on the restricted power series ring `D⟨X⟩`; see
`LogQDeRham.affineLine_monomial` for the derivative. -/

/-! * Unit test `LogQCrystallineSite.not_prismatic` (non-example; node
`PR.8/log-q-crystalline-site`): The log q-crystalline site is not the log prismatic site over (D,
([p]_q)): its objects carry a q-PD ideal J containing the image of the base q-PD ideal I, with γ(J)
⊂ J and φ(J) ⊂ [p]_qE. J need not contain [p]_q (for example J = (ξ) in A_inf). The comparison of
Theorem 7.13 uses a Frobenius twist.

  Not typed: a comparison of the objects of two placeholder sites. -/

end LogQCrystallineSite

/-! ## Node `PR.8/log-q-crystalline-vs-crystalline` (theorem): Log q-crystalline cohomology modulo q − 1 -/

namespace LogQPDTriple

variable {p : ℕ} [Fact p.Prime]

/-- The prelog prism `(D/(q − 1), (p), M_D)` (at `q = 1` a `q`-PD triple is a δ_log-PD triple),
as an integral bounded base. -/
noncomputable def modQSubOne (T : LogQPDTriple.{u} p) :
    IntegralBoundedPrelogPrism p (T.D ⧸ Ideal.span {T.q - 1}) T.M := sorry

/-- The reduction of a smooth scheme over `(D/I, M_D)` to the base `D/(q − 1)`. -/
noncomputable def SmoothScheme.modQSubOne {T : LogQPDTriple.{u} p} (X : SmoothScheme T) :
    SmoothLogFormalScheme T.modQSubOne := sorry

end LogQPDTriple

namespace LogQCrystallineSite

variable {p : ℕ} [Fact p.Prime]

/-- API `LogQCrystallineSite.ofDeltaLogCrystalline` (functoriality; node
`PR.8/log-q-crystalline-site`): The functor from ((X, M_X)/(D/(q − 1), M_D))_δCRYS and the induced
map qΩ ⊗̂^L D/(q − 1) → Ru^δ_{X*}O_δCRYS.

Lean form: the induced map `qΩ ⊗̂^L_D D/(q − 1) → RΓ_δCRYS` on global sections, for a crystalline
base `D/(q − 1)` (`IntegralBoundedPrelogPrism.CrystallineBase`); the functor of sites is not typed.
-/
noncomputable def ofDeltaLogCrystalline (T : LogQPDTriple.{u} p) (hc : T.modQSubOne.CrystallineBase)
    (X : T.SmoothScheme) :
    (completedExtendScalars (Ideal.Quotient.mk (Ideal.span {T.q - 1}))
        (Ideal.span {(p : T.D ⧸ Ideal.span {T.q - 1})})).obj (qOmega T X) ⟶
      DeltaLogCrystallineSite.cohomology T.modQSubOne hc X.modQSubOne := sorry

/-- **Node `PR.8/log-q-crystalline-vs-crystalline`** (theorem): Log q-crystalline cohomology modulo
q − 1.

The canonical map induces an isomorphism qΩ_{(X,M_X)/(D,M_D)} ⊗̂^L_D D/(q − 1) ≅ Ru^δ_{X*}O_δCRYS;
hence qΩ_{(R,P)/(D,M_D)} ⊗̂^L_D D/(q − 1) ≅ Ru^crys_*O_{(X,M_X)/(D/(q−1),M_D)} computed on the small
log crystalline site.

Hypotheses (packet): As in the log q-crystalline site.

Lean form of the first isomorphism, on global sections; the identification with the small log
crystalline site is node `PR.8/delta-log-crystalline-vs-log-crystalline`. -/
theorem ofDeltaLogCrystalline_isIso (T : LogQPDTriple.{u} p)
    (hc : T.modQSubOne.CrystallineBase) (X : T.SmoothScheme) :
    IsIso (ofDeltaLogCrystalline T hc X) := by
  sorry

end LogQCrystallineSite

/-! ## Node `PR.8/log-q-crystalline-vs-prismatic` (theorem): Log q-crystalline versus log prismatic cohomology -/

namespace LogQPDTriple

variable {p : ℕ} [Fact p.Prime]

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`): smooth schemes over
`(D/I, M_D)` whose mod `p` fibre is of Cartier type. -/
def CartierScheme (T : LogQPDTriple.{u} p) : Type (u + 1) := sorry

/-- The underlying smooth scheme. -/
noncomputable def CartierScheme.toSmooth {T : LogQPDTriple.{u} p} (X : CartierScheme T) :
    SmoothScheme T := sorry

/-- The log prism `(φ_* D, ([p]_q), φ_* M_D)` of a `q`-PD triple of rank one or with `(D, M_D)` a
log ring, as an integral bounded prelog prism. -/
noncomputable def frobeniusPrism (T : LogQPDTriple.{u} p) :
    IntegralBoundedPrelogPrism p T.D T.M := sorry

/-- `(X^(1), M_X^(1))`: base change along `ψ_D : (D/I, M_D) → (φ_* D/[p]_q, φ_* M_D)`. -/
noncomputable def CartierScheme.frobeniusTwist {T : LogQPDTriple.{u} p} (X : CartierScheme T) :
    SmoothLogFormalScheme T.frobeniusPrism := sorry

/-- The Frobenius of `D`. -/
noncomputable def frobenius (T : LogQPDTriple.{u} p) : T.D →+* T.D :=
  (TauCeti.Delta.toFrobenius p T.toDeltaLogTriple.delta).1

/-- **Node `PR.8/log-q-crystalline-vs-prismatic`** (theorem): Log q-crystalline versus log prismatic
cohomology.

Let (D, I, M_D) be a prelog q-PD triple of rank 1 or with (D, M_D) a log ring, ψ_D: (D/I, M_D) →
(φ_*D/[p]_q, φ_*M_D) induced by Frobenius, and (X^(1), M_X^(1)) the base change of (X, M_X) along
ψ_D. If the mod p fibre of (X, M_X) is of Cartier type over (D/(p, I), M_D), there is a canonical
isomorphism Δ_{(X^(1),M_X^(1))/(φ_*D,φ_*M_D)} ≅ φ_*qΩ_{(X,M_X)/(D,M_D)} of E_∞-φ_*D-algebras on
X_ét, relative to the log prism (φ_*D, ([p]_q), φ_*M_D). By base change the left side is the (p,
[p]_q)-completed base change along φ_D of Δ_{(X̃,M̃)/(D,M_D)} for a lift.

Hypotheses (packet): Cartier type of the mod p fibre; rank 1 or log ring base.

Lean form: on global sections, `RΓ_Δ((X^(1), M^(1))/(φ_* D, φ_* M_D)) ≅ φ_* RΓ_qCRYS` in `D(D)`; the
`E_∞` structure and the base-change description are not typed. -/
theorem qCrystalline_vs_prismatic (T : LogQPDTriple.{u} p) (X : CartierScheme T) :
    Nonempty (LogPrismaticSite.cohomology T.frobeniusPrism X.frobeniusTwist ≅
      (ModuleCat.restrictScalars T.frobenius).mapDerivedCategory.obj
        (LogQCrystallineSite.qOmega T X.toSmooth)) := by
  sorry

end LogQPDTriple

/-! ## Node `PR.8/log-q-de-rham-complex` (construction): Log q-de Rham complexes -/

namespace LogQDeRham

variable {p : ℕ} [Fact p.Prime]

/-- Placeholder carrier (node `PR.8/log-q-de-rham-complex`): the ring `E_N`, the
`(p, [p]_q)`-completion of `D ⊗_{ℤ_(p)[M_D]} ℤ_(p)[N]`, here for the log-free monoid
`N = M_D ⊕ ℕ^S` (the coordinates `X_s`). -/
def E (T : LogQPDTriple.{u} p) (S : Type u) : Type u := sorry

noncomputable instance (T : LogQPDTriple.{u} p) (S : Type u) : CommRing (E T S) := sorry

noncomputable instance (T : LogQPDTriple.{u} p) (S : Type u) : Algebra T.D (E T S) := sorry

/-- The coordinate `X_s ∈ E_N`. -/
noncomputable def coord (T : LogQPDTriple.{u} p) {S : Type u} (s : S) : E T S := sorry

/-- API `LogQDeRham.gamma` (data; node `PR.8/log-q-de-rham-complex`): The automorphism γ_s: X_s ↦
qX_s of (E_N, N)^a. -/
noncomputable def gamma (T : LogQPDTriple.{u} p) {S : Type u} (s : S) : E T S ≃ₐ[T.D] E T S :=
  sorry

theorem gamma_coord (T : LogQPDTriple.{u} p) {S : Type u} [DecidableEq S] (s t : S) :
    gamma T s (coord T t) = if t = s then algebraMap T.D (E T S) T.q * coord T t else coord T t := by
  sorry

/-- API `LogQDeRham.qNabla` (data; node `PR.8/log-q-de-rham-complex`): ∇^log_{q,s}(f) = (γ_s(f) −
f)/(q − 1) and ∇_q = Σ_s ∇^log_{q,s} dlog X_s.

Lean form: `∇^log_{q,s}` with its defining identity `(q − 1) ∇^log_{q,s}(f) = γ_s(f) − f`. -/
noncomputable def qNabla (T : LogQPDTriple.{u} p) {S : Type u} (s : S) : E T S →ₗ[T.D] E T S :=
  sorry

theorem qNabla_spec (T : LogQPDTriple.{u} p) {S : Type u} (s : S) (f : E T S) :
    algebraMap T.D (E T S) (T.q - 1) * qNabla T s f = gamma T s f - f := by
  sorry

/-- **Node `PR.8/log-q-de-rham-complex`** (construction): Log q-de Rham complexes.

Assume D flat over A = Z_p[[q − 1]] and work locally with X = Spf(R) admitting a smooth lift and an
integral weakly finitely generated chart M_D → P. For S a set and N ⊂ M_D^gp ⊕ Z^S a submonoid
containing M_D, let E_N be the (p, [p]_q)-completion of D ⊗_{Z_(p)[M_D]} Z_(p)[N] with its
δ_log-structure (Proposition 2.16). For s ∈ S, γ_s: X_s ↦ qX_s, X_t ↦ X_t (t ≠ s) is an automorphism
and ∇^log_{q,s}(f) := (γ_s(f) − f)/(q − 1); ∇_q(f) := Σ_s ∇^log_{q,s}(f)·dlog X_s defines the (p,
[p]_q)-completed Koszul complex qΩ^*_{(E_N,N)/(D,M_D)}, functorial in (S, N). For a surjection (E_N,
N) → (R, P) with exactification (E_{N′}, N′) and log q-PD envelope (F, M_F), ∇^log_q extends to F
giving qΩ^*_{(F,M_F)/(D,M_D)}: F → F ⊗̂_E Ω^1_{(E,M_E)/(D,M_D)} → ⋯, whose reduction mod q − 1 is
the de Rham complex of the p-completed log PD envelope. Theorem: qΩ_{(R,P)/(D,M_D)} ≅
qΩ^*_{(F,M_F)/(D,M_D)}, functorially in surjections. On qΩ^* the Frobenius sends dlog X_s ↦ [p]_q
dlog X_s, so the linearised Frobenius factors through η_{[p]_q}; if the mod p fibre is of Cartier
type and R is topologically of finite presentation, qΩ_{(R,P)/(D,M_D)} ∈ D^{[0,r]}(D) (r the rank of
Ω^1_log) and the linearised Frobenius induces φ_D^*qΩ ≅ Lη_{[p]_q}qΩ.

Hypotheses (packet): D flat over Z_p[[q − 1]]; smooth lift; chart integral and weakly finitely
generated; Cartier type for the Frobenius statements.

API `LogQDeRham.complex` (constructor; node `PR.8/log-q-de-rham-complex`): The log q-de Rham complex
qΩ^*_{(E_N,N)/(D,M_D)} and its extension qΩ^*_{(F,M_F)/(D,M_D)} to log q-PD envelopes. -/
noncomputable def complex (T : LogQPDTriple.{u} p) (S : Type u) :
    CochainComplex (ModuleCat.{u} T.D) ℕ := sorry

/-- The prelog algebra side: the smooth scheme `Spf(R)` computed by `E_N` and the surjection. -/
noncomputable def complex.scheme (T : LogQPDTriple.{u} p) (S : Type u) : T.SmoothScheme := sorry

/-- API `LogQDeRham.computes` (characterisation; node `PR.8/log-q-de-rham-complex`):
qΩ_{(R,P)/(D,M_D)} ≅ qΩ^*_{(F,M_F)/(D,M_D)} functorially in surjections (Theorem 7.17).

Lean form: for the log-free algebra `(D/I⟨ℕ^S⟩, M_D ⊕ ℕ^S)` (where the envelope is `E_N` itself) and
`D` flat over `ℤ_p⟦q − 1⟧`. -/
theorem computes (T : LogQPDTriple.{u} p) [Module.Flat (PowerSeries ℤ_[p]) T.D] (S : Type u) :
    Nonempty (DerivedCategory.Q.obj ((complex T S).extend ComplexShape.embeddingUpNat) ≅
      LogQCrystallineSite.qOmega T (complex.scheme T S)) := by
  sorry

/-! * API `LogQDeRham.mod_q_sub_one` (compatibility; node `PR.8/log-q-de-rham-complex`): Modulo q −
1, qΩ^* is the log de Rham complex of the p-completed log PD envelope.

  Not typed: CR.5's log de Rham complex of the `p`-completed log PD envelope is not available. -/

/-! * API `LogQDeRham.frobenius_dlog` (simp; node `PR.8/log-q-de-rham-complex`): Frobenius sends
dlog X_s to [p]_q·dlog X_s.

  Not typed: the Frobenius on the placeholder complex and its `dlog` classes are not recorded. -/

/-! * API `LogQDeRham.frobenius_l_eta` (relation; node `PR.8/log-q-de-rham-complex`): Under Cartier
type, φ_D^*qΩ ≅ Lη_{[p]_q}qΩ, so Frobenius has an inverse up to [p]_q^r.

  Not typed: the décalage `Lη_{[p]_q}` (AI.1) is not available in Mathlib. -/

/-- Unit test `LogQDeRham.affineLine_monomial` (computation; node `PR.8/log-q-de-rham-complex`): On
D⟨X⟩ with N = X^N, ∇^log_q(X^n) = [n]_q·X^n (since γ(X^n) = q^n X^n). -/
theorem affineLine_monomial (T : LogQPDTriple.{u} p) [Module.Flat (PowerSeries ℤ_[p]) T.D]
    (n : ℕ) :
    qNabla T PUnit.unit (coord T PUnit.unit ^ n) =
      algebraMap T.D (E T PUnit) (qNumber T.q n) * coord T PUnit.unit ^ n := by
  sorry

/-- Unit test `LogQDeRham.empty` (degenerate; node `PR.8/log-q-de-rham-complex`): For S = ∅ the
complex is E_N in degree 0. -/
theorem empty (T : LogQPDTriple.{u} p) :
    ∀ i : ℕ, 0 < i → Limits.IsZero ((complex T PEmpty).X i) := by
  sorry

/-! * Unit test `LogQDeRham.q_one_limit` (compatibility; node `PR.8/log-q-de-rham-complex`): Setting
q = 1, ∇^log_{q,s} becomes the log derivation X_s ∂/∂X_s of the log de Rham complex.

  Not typed: specialisation at `q = 1` of the placeholder ring `E_N` is not set up. -/

/-! * Unit test `LogQDeRham.not_nonlog_derivative` (non-example; node `PR.8/log-q-de-rham-complex`):
The log q-derivative is not the q-derivative of BS22 §16: on X^n it gives [n]_q X^n rather than
[n]_q X^{n−1}, i.e. it uses (γ − 1)/(q − 1), not (γ − 1)/((q − 1)X).

  Not typed: a comparison with BS22's `q`-derivative, which is not part of the PR.0 excerpt. -/

end LogQDeRham

/-! ## Node `PR.8/semistable-aomega-comparison` (theorem): Comparison with semistable AΩ -/

/-- Placeholder carrier (owner `AInfCohomology:AI.6`): semistable formal schemes over `O_C` in the
sense of ČK19 (with their canonical log structure). -/
def SemistableOverOC (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

/-- Placeholder (owner `AInfCohomology:AI.6`): the prelog `q`-PD triple
`(A_inf, (ξ), O_C♭ ∖ {0})`. -/
noncomputable def ainfQPDTriple (p : ℕ) [Fact p.Prime] : LogQPDTriple.{u} p := sorry

/-- The scheme of a semistable formal scheme over the triple `ainfQPDTriple`. -/
noncomputable def SemistableOverOC.toScheme {p : ℕ} [Fact p.Prime] (X : SemistableOverOC.{u} p) :
    (ainfQPDTriple.{u} p).SmoothScheme := sorry

/-- Placeholder (owner `AInfCohomology:AI.6`): `RΓ(X_ét, AΩ_X)`, ČK's semistable
`A_inf`-cohomology. -/
noncomputable def aOmega {p : ℕ} [Fact p.Prime] (X : SemistableOverOC.{u} p) :
    DerivedCategory (ModuleCat.{u} (ainfQPDTriple.{u} p).D) := sorry

/-- **Node `PR.8/semistable-aomega-comparison`** (theorem): Comparison with semistable AΩ.

Let k be algebraically closed of characteristic p, C the completed algebraic closure of W(k)[1/p],
and X a p-adic formal scheme over O_C that is étale locally étale over O_C⟨t_0, …, t_r,
t_{r+1}^{±1}, …, t_d^{±1}⟩/(t_0⋯t_r − π) for a non-unit π ∈ O_C, with its canonical log structure
M_X (Česnavičius–Koshikawa 1.6). Then there is an isomorphism qΩ_{(X,M_X)/(A_inf,O_C♭∖{0})} ≅ AΩ_X
in D(X_ét, A_inf) compatible with Frobenius, where the left side is formed over the prelog q-PD
triple (A_inf, (ξ), O_C♭∖{0}) and the right side is ČK's semistable A_inf-cohomology. Since the mod
p fibre is of Cartier type, qΩ is the (p, μ)-completed base change of Δ_{(X,M_X)/(A_inf,O_C♭∖{0})}
along φ_{A_inf}; hence (φ^*_{A_inf}RΓ_Δ((X, M_X)/(A_inf, O_C♭∖{0})))^∧_{(p,φ(ξ))} ≅ RΓ_{A_inf}(X).

Hypotheses (packet): Semistable formal scheme over O_C in the sense of ČK19; C algebraically closed;
compatible p-power roots of p fixed as in ČK19 1.5.

Lean form: on global sections in `D(A_inf)`; Frobenius compatibility and the description through
`φ^*` of log prismatic cohomology are not typed. -/
theorem semistable_aOmega {p : ℕ} [Fact p.Prime] (X : SemistableOverOC.{u} p) :
    Nonempty (LogQCrystallineSite.qOmega (ainfQPDTriple.{u} p) X.toScheme ≅ aOmega X) := by
  sorry

/-! ## Node `PR.8/semistable-crys-bdr-diagram` (theorem): The semistable C_st comparison diagram -/

/-! ### Node `PR.8/semistable-crys-bdr-diagram` (theorem): The semistable C_st comparison diagram

Statement: Let X be as in the semistable AΩ comparison and proper over O_C. The intended commutative
comparison diagram has left column RΓ_logcrys((X,M_X)/(A_crys,O_C♭∖{0})) ≅
RΓ_qCRYS((X,M_X)/(A_inf,O_C♭∖{0})) ⊗^L_{A_inf} A_crys ≅ RΓ(X_ét,AΩ_X) ⊗^L_{A_inf} A_crys. The right
column starts with RΓ_crys(X_C^ad/B_dR^+) → RΓ_ét(X_C^ad,Z_p) ⊗^L_{Z_p} B_dR^+, the period
comparison map of ČK19 Proposition 6.8, followed by the usual isomorphism with
RΓ_ét(X_C^ad,A_inf,X_C^ad) ⊗^L_{A_inf} B_dR^+. The first right-column map is not asserted an
isomorphism over B_dR^+; it becomes one over B_dR. Horizontals are the ČK19 §6.8 maps transported
via Theorem 8.1 and Remark 8.4. K1 Theorem 8.5 contains diagram misprints; this node specifies the
corrected intended diagram, not the erroneous isomorphism as printed.

Not typed: its corners need `A_crys`, `B_dR^+`, the étale cohomology of the adic generic fibre and
ČK19's period map (AInfCohomology AI.0/AI.6, CrystallineCohomology CR.5), none of which is a carrier
here. -/

/-! ## Node `PR.8/breuil-kisin-log-cohomology` (construction): Breuil–Kisin cohomology of semistable formal schemes -/

namespace BreuilKisinLogCohomology

variable {p : ℕ} [Fact p.Prime]

/-- Placeholder carrier (owners `CrystallineCohomology:CR.5:log-algebra`, AI.6): qcqs semistable
formal schemes over `O_K = W(k)⟦u⟧/(E)` with their canonical log structure, as smooth log formal
schemes over a Breuil–Kisin base. -/
def Semistable {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
    (B : IntegralBoundedPrelogPrism p A M) : Type (u + 1) := sorry

/-- The underlying smooth log formal scheme. -/
noncomputable def Semistable.toSmooth {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]
    {B : IntegralBoundedPrelogPrism p A M} (X : Semistable B) : SmoothLogFormalScheme B := sorry

end BreuilKisinLogCohomology

/-- The Breuil–Kisin prelog prism `PrelogPrism.breuilKisin` as an integral bounded prelog prism
(the monoid `ℕ` lifted to the universe of the ring). -/
noncomputable def IntegralBoundedPrelogPrism.breuilKisin {p : ℕ} [Fact p.Prime] (k : Type u)
    [Field k] [CharP k p] [PerfectRing k p] (E : Polynomial (WittVector p k))
    (P : Prism p (PowerSeries (WittVector p k)))
    (hI : P.I = Ideal.span {(E : PowerSeries (WittVector p k))})
    (hφ : P.φ PowerSeries.X = PowerSeries.X ^ p) (hb : P.IsBounded) :
    IntegralBoundedPrelogPrism p (PowerSeries (WittVector p k)) (Multiplicative (ULift.{u} ℕ)) :=
  sorry

/-- **Node `PR.8/breuil-kisin-log-cohomology`** (construction): Breuil–Kisin cohomology of
semistable formal schemes.

Let K be a totally ramified finite extension of W(k)[1/p] with uniformiser π and X a qcqs semistable
formal scheme over O_K with canonical log structure M_X. Define RΓ_BK(X) := RΓ_Δ((X,
M_X)/(W(k)[[u]], N)) over the Breuil–Kisin prelog prism. Then (A_inf ⊗^L_{W(k)[[u]]}
RΓ_BK(X))^∧_(p,ξ) ≅ RΓ_Δ((X, M_X)_{O_C}/(A_inf, O_C♭∖{0})), which together with the semistable AΩ
comparison is a Breuil–Kisin descent of the A_inf-cohomology of X_{O_C}; if X is proper, RΓ_BK(X) is
perfect and the base change holds without completion. Its Frobenius is φ-semilinear over u ↦ u^p,
and over (W(k)[[u]], N) the Frobenius is an isogeny when the mod p fibre is of Cartier type.

Hypotheses (packet): X qcqs semistable over O_K; canonical log structure M_X = (O_X[1/p])^× ∩ O_X.

API `BreuilKisinLogCohomology` (constructor; node `PR.8/breuil-kisin-log-cohomology`): RΓ_BK(X) :=
RΓ_Δ((X, M_X)/(W(k)[[u]], N)).

Lean form: over any integral bounded base (the packet's base is
`IntegralBoundedPrelogPrism.breuilKisin`), `RΓ_BK(X) = RΓ_Δ((X, M_X)/(W(k)⟦u⟧, ℕ))`. -/
noncomputable def BreuilKisinLogCohomology {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]
    {M : Type u} [CommMonoid M] (B : IntegralBoundedPrelogPrism p A M)
    (X : BreuilKisinLogCohomology.Semistable B) : DerivedCategory (ModuleCat.{u} A) :=
  LogPrismaticSite.cohomology B X.toSmooth

namespace BreuilKisinLogCohomology

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- API `BreuilKisinLogCohomology.toAinf` (compatibility; node `PR.8/breuil-kisin-log-cohomology`):
(A_inf ⊗^L_{W(k)[[u]]} RΓ_BK(X))^∧ ≅ RΓ_Δ((X, M_X)_{O_C}/(A_inf, O_C♭∖{0})).

Lean form: along a map of bases `f` to an `A_inf` base, `(A_inf ⊗^L RΓ_BK(X))^∧ ≅ RΓ_Δ` of the base
change. -/
theorem toAinf (B : IntegralBoundedPrelogPrism p A M) (X : Semistable B) {A' : Type u}
    [CommRing A'] {M' : Type u} [CommMonoid M'] (B' : IntegralBoundedPrelogPrism p A' M')
    (f : IntegralBoundedPrelogPrism.BaseHom B B') :
    Nonempty ((completedExtendScalars f.toHom.toHom.ring B'.pI).obj
        (BreuilKisinLogCohomology B X) ≅
      LogPrismaticSite.cohomology B' (X.toSmooth.baseChange f)) := by
  sorry

/-! * API `BreuilKisinLogCohomology.perfect` (other; node `PR.8/breuil-kisin-log-cohomology`): For X
proper, RΓ_BK(X) is a perfect W(k)[[u]]-complex.

  Not typed: needs properness of the placeholder scheme and perfect complexes in `D(W(k)⟦u⟧)`;
neither is recorded. -/

/-! * API `BreuilKisinLogCohomology.toHyodoKato` (compatibility; node
`PR.8/breuil-kisin-log-cohomology`): Base change along u ↦ 0 and Frobenius twist gives RΓ_crys((X_k,
M)/(W(k), N)) (log-crystalline-comparison).

  Not typed: needs the special fibre `(X_k, M)` over the log point as a Cartier-type scheme over the
crystalline base; not set up. -/

/-- API `BreuilKisinLogCohomology.frobenius` (structure; node `PR.8/breuil-kisin-log-cohomology`):
The φ-semilinear Frobenius over u ↦ u^p. -/
noncomputable def frobenius (B : IntegralBoundedPrelogPrism p A M) (X : Semistable B) :
    BreuilKisinLogCohomology B X ⟶
      (frobeniusPushforward B.toPrism).obj (BreuilKisinLogCohomology B X) :=
  LogPrismaticSite.frobenius B X.toSmooth

/-- `Spf(O_K)` with `M_X = O_K ∖ {0}` is the base point. -/
noncomputable def Semistable.point (B : IntegralBoundedPrelogPrism p A M) : Semistable B := sorry

theorem Semistable.point_toSmooth (B : IntegralBoundedPrelogPrism p A M) :
    (Semistable.point B).toSmooth = SmoothLogFormalScheme.spf (SmoothPrelogAlgebra.base B) := by
  sorry

/-- Unit test `BreuilKisinLogCohomology.point` (degenerate; node
`PR.8/breuil-kisin-log-cohomology`): For X = Spf(O_K) with M_X = O_K∖{0}, RΓ_BK(X) = W(k)[[u]]. -/
theorem point (B : IntegralBoundedPrelogPrism p A M) :
    Nonempty (BreuilKisinLogCohomology B (Semistable.point B) ≅
      (DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A A)) := by
  sorry

/-! * Unit test `BreuilKisinLogCohomology.goodReduction` (compatibility; node
`PR.8/breuil-kisin-log-cohomology`): If X is smooth over O_K (no boundary), M_X is pulled back from
O_K∖{0}, and RΓ_BK(X) agrees with the non-log prismatic cohomology of X over the Breuil–Kisin prism
(PR.1), as the strict case of derived-log-properties (1).

  Not typed: compares with PR.1's global prismatic cohomology of a smooth formal scheme, which is
outside the PR.0 excerpt. -/

/-! * Unit test `BreuilKisinLogCohomology.curve_H0` (computation; node
`PR.8/breuil-kisin-log-cohomology`): For a proper semistable curve with geometrically connected
generic fibre, H^0(RΓ_BK(X)) = W(k)[[u]].

  Not typed: semistable curves with geometrically connected generic fibre are not a carrier here. -/

/-! * Unit test `BreuilKisinLogCohomology.not_trivialLog` (non-example; node
`PR.8/breuil-kisin-log-cohomology`): Using the trivial log structure on a semistable X (not smooth
over O_K) does not give a perfect complex with Hodge–Tate graded pieces Ω^i_log; the log structure
is essential.

  Not typed: needs the trivial-log variant of a non-smooth scheme, which is not a smooth log formal
scheme. -/

end BreuilKisinLogCohomology


/-! ## Node `PR.8/log-quasisyntomic-site` (definition): The log quasisyntomic site -/

namespace LogQSyn

/-- **Node `PR.8/log-quasisyntomic-site`** (definition): The log quasisyntomic site.

A map of pre-log rings A → B is p-completely homologically log flat (resp. faithfully flat) if B
⊗^L_A A/p ≅ B/p is discrete and (A/p, M_A) → (B/p, M_B) is homologically log flat (resp.
homologically log faithfully flat) in the sense supplied by DD.6 (B′ ⊕^L_A B ≅ B′ ⊕_A B for all A →
B′, plus faithful flatness of rings). A pre-log ring (A, M_A) is quasisyntomic if A is p-complete
with bounded p^∞-torsion and the Gabber log cotangent complex L_{(A,M_A)/Z_p} has p-complete Tor
amplitude in [−1, 0]. A map A → B of p-complete pre-log rings with bounded p^∞-torsion is
quasisyntomic (resp. a quasisyntomic cover) if it is p-completely homologically log flat (resp.
faithfully flat) and L_{B/A} ⊗^L_B B/p has Tor amplitude in [−1, 0]. QSyn^prelog is the category of
quasisyntomic pre-log rings; its opposite is a site with quasisyntomic covers. For (R, M) p-complete
with bounded p^∞-torsion, qSyn_{(R,M)} is the small site of quasisyntomic maps (R, M) → (S, N); for
perfectoid quasisyntomic (R, M), QSyn_{(R,M)} is the slice. On these sites the p-completion of ∧^i
L_{(S,N)/(R,M)}[−i] lies in D^{≥0}(S).

Hypotheses (packet): Gabber's log cotangent complex and homologically log flat maps as supplied by
DD.6. For trivial pre-log structures one recovers BMS2's quasisyntomic site (DD.5).

API `LogQSyn.site` (constructor; node `PR.8/log-quasisyntomic-site`): The site QSyn^{prelog,op} with
quasisyntomic covers, and its small variant qSyn_{(R,M)}.

Placeholder carrier (node `PR.8/log-quasisyntomic-site`, with DD.6's Gabber log cotangent complex):
the category `QSyn^{prelog,op}`; its quasisyntomic topology is `LogQSyn.topology` and the small
variant `qSyn_{(R,M)}` is `LogQSyn.smallSite`. -/
def site (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

noncomputable instance (p : ℕ) [Fact p.Prime] : Category.{u} (site.{u} p) := sorry

/-- The quasisyntomic topology on `QSyn^{prelog,op}`. -/
noncomputable def topology (p : ℕ) [Fact p.Prime] : GrothendieckTopology (site.{u} p) := sorry

/-- Placeholder (node `PR.8/log-quasisyntomic-site`): the small site `qSyn_{(R,M)}` of
quasisyntomic maps out of a `p`-complete pre-log ring with bounded `p^∞`-torsion. -/
def smallSite (p : ℕ) [Fact p.Prime] {R : Type u} [CommRing R] {M : Type u} [CommMonoid M]
    (α : M →* R) : Type (u + 1) := sorry

noncomputable instance (p : ℕ) [Fact p.Prime] {R : Type u} [CommRing R] {M : Type u}
    [CommMonoid M] (α : M →* R) : Category.{u} (smallSite p α) := sorry

/-- The quasisyntomic topology on `qSyn_{(R,M)}`. -/
noncomputable def smallTopology (p : ℕ) [Fact p.Prime] {R : Type u} [CommRing R] {M : Type u}
    [CommMonoid M] (α : M →* R) : GrothendieckTopology (smallSite p α) := sorry

/-! * API `LogQSyn.IsQuasisyntomic` (other; node `PR.8/log-quasisyntomic-site`): The quasisyntomic
condition on a pre-log ring.

  Not typed: the condition is a `p`-complete Tor amplitude bound on Gabber's log cotangent complex
(DD.6); Mathlib has no Tor amplitude, and a `Prop` placeholder is not used. -/

/-! * API `LogQSyn.IsQuasisyntomicMap` (other; node `PR.8/log-quasisyntomic-site`): The
quasisyntomic condition on a map, with the cover variant.

  Not typed: same reason (homological log flatness and Tor amplitude of the log cotangent complex,
DD.6). -/

/-! * API `LogQSyn.of_cover` (characterisation; node `PR.8/log-quasisyntomic-site`): For a
quasisyntomic cover A → B, A is quasisyntomic iff B is.

  Not typed: rests on `LogQSyn.IsQuasisyntomic`. -/

/-! * API `LogQSyn.comp` (structure; node `PR.8/log-quasisyntomic-site`): Quasisyntomic maps
compose.

  Not typed: rests on `LogQSyn.IsQuasisyntomicMap`. -/

/-! * API `LogQSyn.pushout` (functoriality; node `PR.8/log-quasisyntomic-site`): The p-completed
pushout of a quasisyntomic map along any map is discrete with bounded p^∞-torsion and quasisyntomic.

  Not typed: rests on `LogQSyn.IsQuasisyntomicMap` and `p`-completed pushouts of pre-log rings. -/

/-! * API `LogQSyn.trivialLog` (compatibility; node `PR.8/log-quasisyntomic-site`): On pre-log rings
with trivial pre-log structure, the notions agree with BMS2's quasisyntomic rings and maps (DD.5).

  Not typed: compares with BMS2's quasisyntomic rings (DD.5), a condition with the same
Tor-amplitude obstacle. -/

/-! * API `LogQSyn.cotangent_coconnective` (other; node `PR.8/log-quasisyntomic-site`): For (S, N)
in qSyn_{(R,M)}, (∧^i L_{(S,N)/(R,M)}[−i])^∧_p ∈ D^{≥0}(S).

  Not typed: needs derived exterior powers of the log cotangent complex and their Tor amplitude. -/

/-! * Unit test `LogQSyn.smoothLog_quasisyntomic` (computation; node `PR.8/log-quasisyntomic-site`):
(Z_p⟨T⟩, T^N) is quasisyntomic: its log cotangent complex is free of rank 1 on dlog T.

  Not typed: rests on `LogQSyn.IsQuasisyntomic`. -/

/-! * Unit test `LogQSyn.trivialLog_eq` (compatibility; node `PR.8/log-quasisyntomic-site`): (R,
{e}) is in QSyn^prelog iff R is in BMS2's QSyn.

  Not typed: rests on `LogQSyn.IsQuasisyntomic`. -/

/-! * Unit test `LogQSyn.zeroLog_lci` (characterisation; node `PR.8/log-quasisyntomic-site`): (Z_p,
N → Z_p, 1 ↦ 0) is quasisyntomic: L_{(Z_p,N)/Z_p} is concentrated in degrees [−1, 0] (KY Example
2.30).

  Not typed: rests on `LogQSyn.IsQuasisyntomic`. -/

/-! * Unit test `LogQSyn.not_nonintegral` (non-example; node `PR.8/log-quasisyntomic-site`): For k
of characteristic p ≠ 2, (k, P) → (k[x, y]/(x^2, xy, y^2), N^2), with P ⊂ N^2 generated by (2,0),
(0,2), (1,1) and P∖{0} ↦ 0, is log étale in Kato's sense but not quasisyntomic: its log cotangent
complex is unbounded on the left (KY Remark 2.13).

  Not typed: rests on `LogQSyn.IsQuasisyntomicMap` and Kato's log étaleness. -/

/-! * Unit test `LogQSyn.empty_degenerate` (degenerate; node `PR.8/log-quasisyntomic-site`): The
identity of a quasisyntomic pre-log ring is a quasisyntomic cover.

  Not typed: rests on quasisyntomic covers (`LogQSyn.IsQuasisyntomicMap`). -/

end LogQSyn

/-! ## Node `PR.8/log-qrsp` (definition): Quasiregular semiperfectoid pre-log rings -/

namespace LogQRSP

variable {p : ℕ} [Fact p.Prime]

/-- **Node `PR.8/log-qrsp`** (definition): Quasiregular semiperfectoid pre-log rings.

A p-complete pre-log ring S = (S, M) is semiperfectoid if (1) there is a ring map R → S from a
perfectoid ring; (2) S/p is semiperfect; (3) the natural map M♭ → M/M^× is surjective. It is
quasiregular semiperfectoid if moreover (4) S is quasisyntomic. QRSPerfd^prelog denotes the category
of quasiregular semiperfectoid pre-log rings. Conditions (2)–(3) (log-semiperfect) imply L_{(S,M)/R}
⊗^L S/p ∈ D^{≤−1}(S/p) for any R → S; for S quasiregular semiperfectoid, L̂_{(S,M)/Z_p}[−1] is
p-completely flat. Equivalently (when S/p is log-semiperfect, S p-complete with bounded
p^∞-torsion), S ∈ QRSPerfd^prelog iff for some (equivalently every) perfectoid R → S, L_{(S,M)/R}
⊗^L S/p has Tor amplitude in degree −1.

Hypotheses (packet): p-complete pre-log rings; perfectoid in the sense of BMS1.

API `LogQRSP.IsSemiperfectoid` (other; node `PR.8/log-qrsp`): Conditions (1)–(3).

Lean form: `S` is `p`-adically complete, receives a ring map from a perfectoid ring (placeholder
`PerfectoidRing`, Q0), `S / p` is semiperfect (every element is a `p`-th power) and `M♭ → M / Mˣ` is
surjective. -/
def IsSemiperfectoid (S : Type u) [CommRing S] {M : Type v} [CommMonoid M] (α : M →* S) : Prop :=
  IsAdicComplete (Ideal.span {(p : S)}) S ∧
    (∃ R : PerfectoidRing.{u} p, Nonempty (R.carrier →+* S)) ∧
    (∀ x : S ⧸ Ideal.span {(p : S)}, ∃ y, y ^ p = x) ∧
    Function.Surjective (fun x : Monoid.tilt M p => Associates.mk (Perfection.coeffMonoidHom M p 0 x))

/-! * API `LogQRSP.IsQRSP` (other; node `PR.8/log-qrsp`): Conditions (1)–(4).

  Not typed: condition (4) is quasisyntomicity (`LogQSyn.IsQuasisyntomic`), which is not typed. -/

/-! * API `LogQRSP.cotangent_flat` (other; node `PR.8/log-qrsp`): For S ∈ QRSPerfd^prelog,
L̂_{(S,M)/Z_p}[−1] is p-completely flat.

  Not typed: needs `p`-complete flatness of the log cotangent complex (DD.6) and QRSP. -/

/-! * API `LogQRSP.iff_cotangent` (characterisation; node `PR.8/log-qrsp`): Lemma 3.16: with S/p
log-semiperfect and S p-complete with bounded p^∞-torsion, S is quasiregular semiperfectoid iff the
log cotangent complex L_{(S,M)/R} ⊗^L S/p has Tor amplitude in degree −1 for some/any perfectoid R →
S (R with trivial prelog structure).

  Not typed: needs Tor amplitude of the log cotangent complex and QRSP. -/

/-- Placeholder (node `PR.8/log-qrsp`): the ring `R ⊗̂ W(S♭) ⊗̂ ℤ_p⟨M♭⟩` of Remark 3.13. -/
def PerfectoidCoverRing (S : Type u) [CommRing S] {M : Type u} [CommMonoid M] (α : M →* S)
    (R : PerfectoidRing.{u} p) (f : R.carrier →+* S) : Type u := sorry

noncomputable instance (S : Type u) [CommRing S] {M : Type u} [CommMonoid M] (α : M →* S)
    (R : PerfectoidRing.{u} p) (f : R.carrier →+* S) : CommRing (PerfectoidCoverRing S α R f) :=
  sorry

/-- API `LogQRSP.perfectoidCover` (constructor; node `PR.8/log-qrsp`): The map (R ⊗̂ W(S♭) ⊗̂
Z_p⟨M♭⟩, M♭) → (S, M) of Remark 3.13.

Lean form: the ring map; on monoids the map is `M♭ → M`. -/
noncomputable def perfectoidCover (S : Type u) [CommRing S] {M : Type u} [CommMonoid M]
    (α : M →* S) (R : PerfectoidRing.{u} p) (f : R.carrier →+* S) :
    PerfectoidCoverRing S α R f →+* S := sorry

/-- API `LogQRSP.quotient_monoid` (relation; node `PR.8/log-qrsp`): Condition (3) passes to quotient
monoids and pushouts (Remark 3.14).

Lean form: the quotient-monoid half: condition (3) passes along a surjective monoid map. -/
theorem quotient_monoid {M N : Type*} [CommMonoid M] [CommMonoid N] (f : M →* N)
    (hf : Function.Surjective f)
    (h : Function.Surjective
      (fun x : Monoid.tilt M p => Associates.mk (Perfection.coeffMonoidHom M p 0 x))) :
    Function.Surjective
      (fun x : Monoid.tilt N p => Associates.mk (Perfection.coeffMonoidHom N p 0 x)) := by
  sorry

/-- Unit test `LogQRSP.log_line_not` (non-example; node `PR.8/log-qrsp`): (Z_p⟨T⟩, T^N) is
quasisyntomic but not semiperfectoid: N♭ = 0 does not surject onto N.

Lean form of the second assertion: `(ℤ_p⟨T⟩, T^ℕ)` (`ConvergentPoly p ℤ_[p]`) is not semiperfectoid.
-/
theorem log_line_not :
    ¬ IsSemiperfectoid (p := p) (ConvergentPoly p ℤ_[p])
      (powersHom _ (algebraMap (Polynomial ℤ_[p]) (ConvergentPoly p ℤ_[p]) Polynomial.X)) := by
  sorry

/-! * Unit test `LogQRSP.perfectoid_divisible` (computation; node `PR.8/log-qrsp`): (O_C⟨T^{1/p^∞}⟩,
N[1/p] → T^{N[1/p]}) is quasiregular semiperfectoid.

  Not typed: needs `O_C⟨T^{1/p^∞}⟩` and QRSP. -/

/-! * Unit test `LogQRSP.trivialLog` (compatibility; node `PR.8/log-qrsp`): (S, S^×) is in
QRSPerfd^prelog iff S is in BMS2's QRSPerfd (PR.2/DD.5).

  Not typed: needs BMS2's QRSPerfd (DD.5) and QRSP. -/

/-! * Unit test `LogQRSP.zero_ring` (degenerate; node `PR.8/log-qrsp`): The zero pre-log ring is
quasiregular semiperfectoid.

  Not typed: rests on `LogQRSP.IsQRSP`. -/

end LogQRSP

/-! ## Node `PR.8/log-qrsp-basis` (theorem): Quasiregular semiperfectoid pre-log rings form a basis -/

/-! ### Node `PR.8/log-qrsp-basis` (theorem): Quasiregular semiperfectoid pre-log rings form a basis

Statement: (1) For maps A → B, A → C in QRSPerfd^prelog with A → B a quasisyntomic cover, the
p-completed pushout lies in QRSPerfd^prelog and is a quasisyntomic cover of C; QRSPerfd^{prelog,op}
is a site. (2) Every R ∈ QSyn^prelog admits a quasisyntomic cover R → S with S ∈ QRSPerfd^prelog,
which can be chosen with p-divisible monoid. (3) For such a cover every term of the Čech nerve lies
in QRSPerfd^prelog. (4) Consequently, for every presentable ∞-category C, restriction induces an
equivalence Shv_C(QSyn^{prelog,op}) ≅ Shv_C(QRSPerfd^{prelog,op}).

Not typed: it concerns quasisyntomic covers (not typed, see `LogQSyn.IsQuasisyntomicMap`) and
sheaves valued in presentable ∞-categories, which Mathlib does not have. -/

/-! ## Node `PR.8/derived-log-prismatic` (construction): Derived log prismatic cohomology -/

namespace PrelogAlgebra

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- The log-free prelog algebra `Σ_{S,T} = (Ā⟨(X_s)_{s ∈ S}, ℕ^T⟩, M_A ⊕ ℕ^T)` (restricted power
series; recorded opaquely). -/
noncomputable def logFree (P : IntegralBoundedPrelogPrism p A M) (S T : Type u) [Finite S]
    [Finite T] : PrelogAlgebra P := sorry

/-- The prelog algebra `(Ā, M_A ⊕ ℕ)` with `ℕ → Ā`, `1 ↦ 0`. -/
noncomputable def zeroLogPoint (P : IntegralBoundedPrelogPrism p A M) : PrelogAlgebra P where
  R := P.bar
  Q := M × Multiplicative ℕ
  α := P.barα.coprod (powersHom _ 0)
  structureMap := MonoidHom.inl M (Multiplicative ℕ)
  comm _ := by sorry

end PrelogAlgebra

/-- **Node `PR.8/derived-log-prismatic`** (construction): Derived log prismatic cohomology.

Fix a bounded prelog prism (A, I, M_A) with M_A integral. On the log-free pre-log rings Σ_{S,T} :=
(A/I⟨(X_s)_{s∈S}, N^T⟩, M_A ⊕ N^T) (S, T finite) consider Σ_{S,T} ↦ Δ_{Σ_{S,T}/(A,M_A)} :=
RΓ_Δ(Spf(Σ_{S,T})^a/(A, M_A)), a (p, I)-complete commutative algebra in D(A) with φ_A-semilinear
Frobenius. The derived log prismatic cohomology (R, P) ↦ Δ^L_{(R,P)/(A,M_A)} is its left Kan
extension (animation) to all simplicial (animated) pre-log rings over (A/I, M_A), followed by (p,
I)-completion; it depends only on the derived p-completion of (R, P); Δ̄^L := Δ^L ⊗^L_A A/I. For a
log p-adic formal scheme (X, M_X) over (A/I, M_A), the étale sheaf Δ^L_{(X,M_X)/(A,M_A)} is the (p,
I)-complete étale sheafification of U = Spf(R) ↦ Δ^L_{(R,Γ(U,M_X))/(A,M_A)}; similarly Δ̄^L and the
conjugate filtration.

Hypotheses (packet): Animated pre-log rings as supplied by DD.6 (KY Remark 2.8) built on EDS
E5:animation; (A, I, M_A) bounded with integral monoid.

API `DerivedLogPrismatic` (constructor; node `PR.8/derived-log-prismatic`): The functor (R, P) ↦
Δ^L_{(R,P)/(A,M_A)} on animated pre-log (A/I, M_A)-algebras, with Frobenius.

Placeholder (node `PR.8/derived-log-prismatic`): `Δ^L_{(R,P)/(A,M_A)}` in `D(A)` for discrete prelog
algebras; the animated extension (EnhancedDerivedSheaves E5) and the Frobenius are not typed. -/
noncomputable def DerivedLogPrismatic {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]
    {M : Type u} [CommMonoid M] (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) :
    DerivedCategory (ModuleCat.{u} A) := sorry

namespace DerivedLogPrismatic

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- API `DerivedLogPrismatic.reduced` (constructor; node `PR.8/derived-log-prismatic`): Δ̄^L := Δ^L
⊗^L_A A/I. -/
noncomputable def reduced (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) :
    DerivedCategory (ModuleCat.{u} P.bar) :=
  (derivedExtendScalars (Ideal.Quotient.mk P.toPrism.I)).obj (DerivedLogPrismatic P X)

/-- API `DerivedLogPrismatic.onFree` (characterisation; node `PR.8/derived-log-prismatic`): On
Σ_{S,T}, Δ^L agrees with the site-theoretic log prismatic cohomology. -/
theorem onFree (P : IntegralBoundedPrelogPrism p A M) (S T : Type u) [Finite S] [Finite T] :
    Nonempty (DerivedLogPrismatic P (PrelogAlgebra.logFree P S T) ≅
      LogPrismaticSite.affineCohomology P (PrelogAlgebra.logFree P S T)) := by
  sorry

/-! * API `DerivedLogPrismatic.leftKanExtension` (universal-property; node
`PR.8/derived-log-prismatic`): Δ^L preserves sifted colimits and is the unique such extension of its
values on log-free algebras (after completion).

  Not typed: animated pre-log rings and sifted colimits (EnhancedDerivedSheaves E5) are not
available. -/

/-! * API `DerivedLogPrismatic.pComplete_invariant` (other; node `PR.8/derived-log-prismatic`): Δ^L
depends only on the derived p-completion of (R, P).

  Not typed: derived `p`-completion of (animated) pre-log rings is not available. -/

/-- API `DerivedLogPrismatic.sheaf` (constructor; node `PR.8/derived-log-prismatic`): The étale
sheaf Δ^L_{(X,M_X)/(A,M_A)} on a log p-adic formal scheme. -/
noncomputable def sheaf (P : IntegralBoundedPrelogPrism p A M) (X : SmoothLogFormalScheme P) :
    X.EtaleDerived A := sorry

/-- Maps of prelog algebras over `(Ā, M_A)`: an `Ā`-algebra map and a monoid map under `M_A`
compatible with the prelog structures. -/
structure _root_.TauCeti.LogPrismatic.PrelogAlgebra.Hom {P : IntegralBoundedPrelogPrism p A M}
    (X Y : PrelogAlgebra P) where
  /-- The ring map. -/
  ring : X.R →ₐ[P.bar] Y.R
  /-- The monoid map. -/
  monoid : X.Q →* Y.Q
  comm_alpha : ∀ q, Y.α (monoid q) = ring (X.α q)
  comm_structureMap : monoid.comp X.structureMap = Y.structureMap

/-- API `DerivedLogPrismatic.map` (functoriality; node `PR.8/derived-log-prismatic`): Functoriality
in (R, P) and in maps of bounded prelog prisms.

Lean form: functoriality in `(R, P)`; functoriality in maps of bounded prelog prisms is base change
and is not typed here. -/
noncomputable def map (P : IntegralBoundedPrelogPrism p A M) {X Y : PrelogAlgebra P}
    (f : PrelogAlgebra.Hom X Y) : DerivedLogPrismatic P X ⟶ DerivedLogPrismatic P Y := sorry

/-- Unit test `DerivedLogPrismatic.free_logLine` (computation; node `PR.8/derived-log-prismatic`):
For (A/I⟨N⟩, M_A ⊕ N), Δ̄^L has H^0 = A/I⟨X⟩ and H^1{1} free on dlog X.

Lean form: for an orientable base (trivial Breuil–Kisin twist), as `A/I`-modules. -/
theorem free_logLine (P : IntegralBoundedPrelogPrism p A M) (ho : P.toPrism.IsOrientable) :
    Nonempty ((DerivedCategory.homologyFunctor _ 0).obj
        (reduced P (PrelogAlgebra.logAffineLine P)) ≅
      ModuleCat.of P.bar (PrelogAlgebra.logAffineLine P).R) ∧
    Nonempty ((DerivedCategory.homologyFunctor _ 1).obj
        (reduced P (PrelogAlgebra.logAffineLine P)) ≅
      ModuleCat.of P.bar (PrelogAlgebra.logAffineLine P).R) := by
  sorry

/-- Unit test `DerivedLogPrismatic.base` (degenerate; node `PR.8/derived-log-prismatic`): For (R, P)
= (A/I, M_A), Δ^L = A. -/
theorem base (P : IntegralBoundedPrelogPrism p A M) :
    Nonempty (DerivedLogPrismatic P (PrelogAlgebra.base P) ≅
      (DerivedCategory.singleFunctor (ModuleCat.{u} A) 0).obj (ModuleCat.of A A)) := by
  sorry

/-- Unit test `DerivedLogPrismatic.trivialLog` (compatibility; node `PR.8/derived-log-prismatic`):
For P = M_A pulled back from the base, Δ^L_{(R,M_A)/(A,M_A)} ≅ BS22's Δ_{R/A} (PR.2). -/
theorem trivialLog (P : IntegralBoundedPrelogPrism p A M) (R : Type u) [CommRing R]
    [Algebra P.bar R] :
    Nonempty (DerivedLogPrismatic P (PrelogAlgebra.strict P R) ≅
      prismaticCohomology P.toPrism R) := by
  sorry

/-- Unit test `DerivedLogPrismatic.zeroLog_not_discrete` (non-example; node
`PR.8/derived-log-prismatic`): For (R, P) = (A/I, N → 0) over trivial M_A, Δ̄^L is not concentrated
in degree 0: its conjugate filtration has graded pieces ∧^i L_{(A/I,N)/(A/I)}{−i}[−i] and
L_{(A/I,N)/(A/I)} lives in degrees [−1, 0] (KY Example 2.30). -/
theorem zeroLog_not_discrete (P : IntegralBoundedPrelogPrism p A PUnit.{u + 1})
    [Nontrivial P.bar] :
    ∃ i : ℤ, i ≠ 0 ∧ ¬ Limits.IsZero ((DerivedCategory.homologyFunctor _ i).obj
      (reduced P (PrelogAlgebra.zeroLogPoint P))) := by
  sorry

end DerivedLogPrismatic

/-! ## Node `PR.8/derived-log-hodge-tate` (theorem): Derived log Hodge–Tate comparison -/

namespace DerivedLogPrismatic

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- Placeholder (node `PR.8/derived-log-hodge-tate`): `gr_i` of the conjugate filtration of
`Δ̄^L_{(R,P)/(A,M_A)}`. -/
noncomputable def conjugateGraded (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P)
    (i : ℕ) : DerivedCategory (ModuleCat.{u} P.bar) := sorry

/-- Placeholder (owner `DerivedDeRhamCohomology:DD.6`): the twisted derived exterior power
`∧^i L_{(R,P)/(Ā,M_A)}{−i}` of Gabber's log cotangent complex, viewed in `D(Ā)`. -/
noncomputable def logCotangentWedge (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P)
    (i : ℕ) : DerivedCategory (ModuleCat.{u} P.bar) := sorry

/-- **Node `PR.8/derived-log-hodge-tate`** (theorem): Derived log Hodge–Tate comparison.

For a simplicial pre-log ring (R, P) over (A/I, M_A), there is an increasing exhaustive
multiplicative filtration Fil_• Δ̄_{(R,P)/(A,M_A)} (the conjugate filtration) by derived p-complete
objects with gr_i Δ̄_{(R,P)/(A,M_A)} ≅ (∧^i L_{(R,P)/(A/I,M_A)}{−i}[−i])^∧_p. Globally, gr_i
Δ̄^L_{(X,M_X)/(A,M_A)} ≅ LΩ̂^i_{(X,M_X)/(A/I,M_A)}{−i}[−i] := (∧^i L_{(X,M_X)/(A/I,M_A)})^∧{−i}[−i].

Hypotheses (packet): (A, I, M_A) bounded with M_A integral.

Lean form: the graded pieces for a discrete prelog algebra; the filtration itself, its
multiplicativity and the global form are not typed. -/
theorem conjugateGraded_iso (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) (i : ℕ) :
    Nonempty (conjugateGraded P X i ≅ (derivedCompletion (Ideal.span {(p : P.bar)})).obj
      ((shiftFunctor (DerivedCategory (ModuleCat.{u} P.bar)) (-(i : ℤ))).obj
        (logCotangentWedge P X i))) := by
  sorry

end DerivedLogPrismatic

/-! ## Node `PR.8/derived-log-properties` (theorem): Basic properties of derived log prismatic cohomology -/

namespace DerivedLogPrismatic

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- **Node `PR.8/derived-log-properties`** (theorem): Basic properties of derived log prismatic
cohomology.

Let (A, I, M_A) be a bounded prelog prism with M_A integral. (1) For every derived p-complete
simplicial ring R over A/I, Δ_{R/A} ≅ Δ^L_{(R,M_A)/(A,M_A)} (strict pull-back of the base log
structure). (2) Δ^L is invariant under passing to the associated log ring: Δ^L_{(R,P)/(A,M_A)} ≅
Δ^L_{(R,P)^a/(A,M_A)}. (3) Base change: for a map of bounded prelog prisms (A, I, M_A) → (A′, IA′,
M_{A′}) and (R′, P′) the homotopy base change, Δ^L_{(R,P)/(A,M_A)} ⊗̂^L_A A′ ≅
Δ^L_{(R′,P′)/(A′,M_{A′})}. (4) Multiplicativity: for the homotopy cofibre product (R_3, P_3) of
(R_1, P_1), (R_2, P_2) over (A/I, M_A), Δ_1 ⊗̂^L_A Δ_2 ≅ Δ_3, compatibly with conjugate filtrations
(Day convolution); Δ^L_{−/(A,M_A)} commutes with all colimits. (5) For (A/I, M_A) perfectoid or
pseudo-perfectoid, Δ^L_{(R,P)/A} ≅ Δ^L_{(R,P)/(A,M_A)}.

Hypotheses (packet): As in derived-log-prismatic.

Lean form of part (1) (strict pull-back of the base log structure gives PR.0's shared carrier
`prismaticCohomology`); parts (2)–(5) are not typed (associated log rings of animated pre-log rings,
homotopy base change and cofibre products, perfectoid bases). -/
theorem strict_eq (P : IntegralBoundedPrelogPrism p A M) (R : Type u) [CommRing R]
    [Algebra P.bar R] :
    Nonempty (prismaticCohomology P.toPrism R ≅ DerivedLogPrismatic P (PrelogAlgebra.strict P R)) := by
  sorry

end DerivedLogPrismatic

/-! ## Node `PR.8/derived-vs-site` (theorem): Derived and site-theoretic log prismatic cohomology agree for smooth log formal schemes -/

namespace DerivedLogPrismatic

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- **Node `PR.8/derived-vs-site`** (theorem): Derived and site-theoretic log prismatic cohomology
agree for smooth log formal schemes.

Let (A, I, M_A) be bounded with M_A integral and (X, M_X) smooth over (A/I, M_A). (1) For every
affine U = Spf(R) in X_ét, Δ^L_{(X,M_X)/(A,M_A)}(U) ≅ RΓ(((U, M_U)/(A, M_A))_Δ, O_Δ). (2) If P →
Γ(U, M_X) is a smooth chart, Δ^L_{(R,P)/(A,M_A)} ≅ Δ^L_{(X,M_X)/(A,M_A)}(U); in particular for X =
Spf(R) with smooth chart M_A → P, Δ^L_{(R,P)/(A,M_A)} ≅ RΓ_Δ((X, M_X)/(A, M_A)) compatibly with
Hodge–Tate maps. Hence Δ^L_{(X,M_X)} ≅ Rν_*O_Δ, RΓ_Δ((X, M_X)/(A, M_A)) ≅ RΓ(X_ét, Δ^L_{(X,M_X)}),
Δ̄^L ≅ Rν_*Ō_Δ, and the derived conjugate filtration is the canonical filtration τ_{≤i}Δ̄.

Hypotheses (packet): (X, M_X) smooth in Koshikawa's sense over a bounded prelog prism with integral
monoid.

Lean form of (2) for `X = Spf(R)` with a smooth chart; the sheaf-level assertions are not typed. -/
theorem eq_site (P : IntegralBoundedPrelogPrism p A M) (X : SmoothPrelogAlgebra P) :
    Nonempty (DerivedLogPrismatic P X.toPrelogAlgebra ≅
      LogPrismaticSite.affineCohomology P X.toPrelogAlgebra) := by
  sorry

end DerivedLogPrismatic

/-! ## Node `PR.8/log-quasisyntomic-descent` (theorem): Log quasisyntomic descent -/

/-! ### Node `PR.8/log-quasisyntomic-descent` (theorem): Log quasisyntomic descent

Statement: Let (A, I, M_A) be a bounded prelog prism with M_A integral. On the small log
quasisyntomic site qSyn_{(A/I,M_A)} the presheaf (R, P) ↦ Δ^L_{(R,P)/(A,M_A)} is a sheaf (with
values in (p, I)-complete objects of D(A)); if (A/I, M_A) is a perfectoid pre-log ring, the same
holds on QSyn_{(A/I,M_A)}. The same holds for each step of the conjugate filtration of Δ̄^L.

Not typed: it is a sheaf condition for a presheaf valued in the derived ∞-category on `qSyn_{(A/I,
M_A)}`; the 1-categorical `Presheaf.IsSheaf` for `D(A)` would be a different (false) statement, and
the presheaf itself needs maps of quasisyntomic pre-log rings. -/

/-! ## Node `PR.8/initial-log-prism-qrsp` (theorem): Initial log prisms of semiperfectoid pre-log rings -/

/-! ### Node `PR.8/initial-log-prism-qrsp` (theorem): Initial log prisms of semiperfectoid pre-log
rings

Statement: Let S = (S, N) be a semiperfectoid integral pre-log ring and (R, M) → (S, N) a map from a
perfectoid integral pre-log ring, surjective on rings and modulo units on monoids. Exactify M♭ → M →
N as M♭ → M̃ → N and put A_inf(R, M̃) := A_inf(R) ⊗̂ Z_p⟨M̃⟩ with the bounded rank-1 prelog prism
(A_inf(R, M̃), (ξ), M̃). Applying prismatic envelopes to A_inf(R, M̃) → S gives a prelog prism
(Δ^init_{S/R}, (ξ), M^init_{S/R} := M̃) with S → Δ^init/ξ and an exact surjection onto (Δ^init/ξ,
N)^a, and its perfection Δ^init_{S/R,perf}. (1) For every integral ''log prism'' (A, I, M_A) with S
→ A/I and an exact surjection (A, M_A) → (A/I, N → A/I)^a there is a unique compatible map
(Δ^init_{S/R}, (ξ), M^init) → (A, I, M_A); similarly for the perfections among perfect A (resp.
perfect log prisms). (2) If S is quasiregular semiperfectoid, Δ_{S/A_inf(R)} is discrete with a
δ-structure, Δ_{S/A_inf(R)} ≅ Δ^init_{S/R}, the latter is bounded and independent of R, giving an
initial ''log prism'' (Δ^init_S, (ξ), M^init_S) for the category of exact-surjection diagrams. (3)
If S is semiperfectoid, Δ_{S/R,perf} is discrete, a perfect prism, and Δ_{S/A_inf(R),perf} ≅
Δ^init_{S,perf}. (4) If moreover N is semiperfect (N♭ → N surjective), the p-saturation S^{p-sat} is
semiperfectoid and Δ_{S/R,perf} ≅ Δ_{S^{p-sat}/R,perf}.

Not typed: `Δ^init_{S/R}` is built from the exactified `A_inf(R) ⊗̂ ℤ_p⟨M̃⟩` (completed monoid
algebras) and envelopes, and its universal property ranges over ''log prisms'' with exact
surjections onto associated log rings (CR.5); parts (2)–(4) rest on QRSP (`LogQRSP.IsQRSP`, not
typed). -/

/-! ## Node `PR.8/log-nygaard-filtration` (construction): The log Nygaard filtration -/

namespace LogNygaard

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- `Δ^{L,(1)} = Δ^L ⊗̂^L_{A, φ_A} A`. -/
noncomputable def frobeniusTwisted (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) :
    DerivedCategory (ModuleCat.{u} A) :=
  (completedExtendScalars P.toPrism.φ P.pI).obj (DerivedLogPrismatic P X)

/-- Placeholder (derived tensor product, owner `EnhancedDerivedSheaves`): `I^i ⊗^L_A −`. -/
noncomputable def idealTwist (P : IntegralBoundedPrelogPrism p A M) (i : ℕ) :
    DerivedCategory (ModuleCat.{u} A) ⥤ DerivedCategory (ModuleCat.{u} A) := sorry

/-- **Node `PR.8/log-nygaard-filtration`** (construction): The log Nygaard filtration.

Let (A, I, M_A) be an integral bounded prelog prism and write Δ^(1)_{(R,P)/(A,M_A)} :=
Δ_{(R,P)/(A,M_A)} ⊗̂^L_{A,φ_A} A. For a (p, I)-completely flat map of bounded prisms A_0 → A′_0 with
∆^(1)_{R/A_0} (p, I)-completely flat (Assumption 5.3), the Nygaard filtration is Fil^i_N
Δ^(1)_{R/A_0} = {x : φ_{R/A_0}(x) ∈ I^iΔ_{R/A_0}} (Definition 5.5). For the log-free algebra (R, P)
= (A/I⟨N^S⟩, M_A ⊕ N^S), choose a surjection M_A ⊕ N → M_A ⊕ N^S, exactify it (Construction 5.11) to
obtain non-log prismatic cohomologies over the non-perfect base prisms Ã^•_∞ obtained by extracting
p-power roots (Construction 5.9), and define Fil^i_N Δ^(1)_{(R,P)/(A,M_A)} as the totalisation of
Fil^i_N Δ_{(A/I)^•/Ã^•_∞} ⊗̂^L_{Ã^•_∞,φ} Ã^•_∞ (Definition 5.13), independent of the choice; extend
to Σ_{S,T} by Day convolution with BS22's Nygaard filtration. Left Kan extension gives the derived
Nygaard filtration Fil^•_N Δ^{L,(1)}_{(R,P)/(A,M_A)} on all simplicial pre-log rings, with a
filtered Frobenius φ: Fil^•_N Δ^{L,(1)} → I^•Δ^L and maps I ⊗ Fil^{•−1}_N → Fil^•_N; étale
sheafification gives the global Nygaard filtration on Δ^{L,(1)}_{(X,M_X)/(A,M_A)} (Constructions
5.25–5.26). It is multiplicative.

Hypotheses (packet): (A, I, M_A) integral bounded prelog prism; animated pre-log rings (DD.6).

API `LogNygaard.fil` (constructor; node `PR.8/log-nygaard-filtration`): The decreasing
multiplicative filtration Fil^•_N Δ^{L,(1)}_{(R,P)/(A,M_A)} by (p, I)-complete objects.

Placeholder (node `PR.8/log-nygaard-filtration`): `Fil^i_N Δ^{L,(1)}_{(R,P)/(A,M_A)}` for discrete
prelog algebras. -/
noncomputable def fil (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) (i : ℕ) :
    DerivedCategory (ModuleCat.{u} A) := sorry

/-- The transition maps `Fil^{i+1}_N → Fil^i_N`. -/
noncomputable def fil.map (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) (i : ℕ) :
    fil P X (i + 1) ⟶ fil P X i := sorry

/-- API `LogNygaard.frobenius` (data; node `PR.8/log-nygaard-filtration`): The filtered Frobenius φ:
Fil^i_N Δ^{L,(1)} → I^iΔ^L. -/
noncomputable def frobenius (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) (i : ℕ) :
    fil P X i ⟶ (idealTwist P i).obj (DerivedLogPrismatic P X) := sorry

/-- API `LogNygaard.mulI` (data; node `PR.8/log-nygaard-filtration`): The maps I ⊗^L Fil^{i−1}_N →
Fil^i_N (Construction 5.21). -/
noncomputable def mulI (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) (i : ℕ) :
    (idealTwist P 1).obj (fil P X i) ⟶ fil P X (i + 1) := sorry

/-! * API `LogNygaard.mul` (structure; node `PR.8/log-nygaard-filtration`): Fil^i_N ⊗ Fil^j_N →
Fil^{i+j}_N (Remark 5.20).

  Not typed: needs the derived tensor product of two objects of `D(A)` and its compatibility with
the filtration. -/

/-! * API `LogNygaard.free_eq_bs` (compatibility; node `PR.8/log-nygaard-filtration`): For trivial
log structures, Fil^•_N is BS22's Nygaard filtration on Δ^(1) (PR.3).

  Not typed: BS22's Nygaard filtration (PR.3) is outside the PR.0 excerpt. -/

/-- API `LogNygaard.flatBaseChange` (functoriality; node `PR.8/log-nygaard-filtration`): Formation
of Fil^•_N commutes with (p, I)-completely flat base change on A.

Lean form: "`(p, I)`-completely flat" is replaced by flat (Mathlib `RingHom.Flat`), a stronger
hypothesis. -/
theorem flatBaseChange (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) (i : ℕ)
    {A' : Type u} [CommRing A'] {M' : Type u} [CommMonoid M'] (P' : IntegralBoundedPrelogPrism p A' M')
    (f : IntegralBoundedPrelogPrism.BaseHom P P') (hf : f.toHom.toHom.ring.Flat) :
    Nonempty ((completedExtendScalars f.toHom.toHom.ring P'.pI).obj (fil P X i) ≅
      fil P' (X.baseChange f) i) := by
  sorry

/-- API `LogNygaard.sheaf` (constructor; node `PR.8/log-nygaard-filtration`): The global Nygaard
filtration on Δ^{L,(1)}_{(X,M_X)/(A,M_A)} by étale sheafification. -/
noncomputable def sheaf (P : IntegralBoundedPrelogPrism p A M) (X : SmoothLogFormalScheme P)
    (i : ℕ) : X.EtaleDerived A := sorry

/-! * API `LogNygaard.independent` (extensionality; node `PR.8/log-nygaard-filtration`): On log-free
algebras the totalisation is independent of the chosen surjection M_A ⊕ N → M_A ⊕ N^S.

  Not typed: the choice of surjection `M_A ⊕ ℕ → M_A ⊕ ℕ^S` is not a parameter of the placeholder
`fil`. -/

/-- Unit test `LogNygaard.fil0` (degenerate; node `PR.8/log-nygaard-filtration`): Fil^0_N Δ^{L,(1)}
= Δ^{L,(1)}. -/
theorem fil0 (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) :
    Nonempty (fil P X 0 ≅ frobeniusTwisted P X) := by
  sorry

/-! * Unit test `LogNygaard.trivialLog` (compatibility; node `PR.8/log-nygaard-filtration`): For (R,
P) = (A/I⟨X⟩, M_A) with trivial M_A, Fil^•_N agrees with BS22's Nygaard filtration on Δ^(1)_{R/A}.

  Not typed: BS22's Nygaard filtration (PR.3) is outside the PR.0 excerpt. -/

/-! * Unit test `LogNygaard.logLine_gr1` (computation; node `PR.8/log-nygaard-filtration`): For (R,
P) = (A/I⟨N⟩, M_A ⊕ N), gr^1_N Δ^(1) ≅ τ_{≤1}Δ̄{1}, a two-term object with H^0 ≅ R{1} and H^1 ≅
R·dlog X.

  Not typed: needs `τ_{≤1}` of the twisted reduced complex as an `A`-module complex (restriction
from `R`), not set up. -/

/-! * Unit test `LogNygaard.naive_fails` (non-example; node `PR.8/log-nygaard-filtration`): For KY's
toy example over (A_inf, (ξ)) the naive filtration {x : φ(x) ∈ ξ^iΔ} on Δ^(1)_{(S,M)/(A,M_A)}
differs from Fil^•_N (KY §5.1).

  Not typed: KY's toy example over `A_inf` is not a carrier here. -/

/-! * Unit test `LogNygaard.frobenius_fil1` (characterisation; node `PR.8/log-nygaard-filtration`):
φ(Fil^1_N) ⊂ IΔ and the induced map gr^0_N → Δ̄ is the inclusion of Fil_0 Δ̄ = (derived) R.

  Not typed: needs the induced map on `gr^0_N` and the conjugate filtration step `Fil_0`. -/

end LogNygaard

/-! ## Node `PR.8/log-nygaard-graded` (theorem): Graded pieces of the log Nygaard filtration -/

namespace LogNygaard

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- Placeholder (node `PR.8/log-nygaard-filtration`): `gr^i_N Δ^{L,(1)}`. -/
noncomputable def graded (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) (i : ℕ) :
    DerivedCategory (ModuleCat.{u} A) := sorry

/-- Placeholder (node `PR.8/derived-log-hodge-tate`): `Fil_i Δ̄^L{i}`, the twisted conjugate
filtration step. -/
noncomputable def conjugateFilTwist (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P)
    (i : ℕ) : DerivedCategory (ModuleCat.{u} P.bar) := sorry

/-- **Node `PR.8/log-nygaard-graded`** (theorem): Graded pieces of the log Nygaard filtration.

Let (A, I, M_A) be an integral bounded prelog prism and (R, P) a simplicial pre-log ring over (A/I,
M_A). The Frobenius induces an isomorphism gr^i_N Δ^{L,(1)}_{(R,P)/(A,M_A)} ≅ Fil_i
Δ̄^L_{(R,P)/(A,M_A)}{i}, where Fil_i is the conjugate filtration. For Σ_{S,T} this reads gr^i_N
Δ^(1)_{Σ_{S,T}} ≅ τ_{≤i}Δ̄_{Σ_{S,T}}{i}; globally gr^i_N Δ^{L,(1)}_{(X,M_X)} ≅ Fil_i
Δ̄^L_{(X,M_X)}{i}, and for (X, M_X) smooth over (A/I, M_A), gr^•_N Δ^(1)_{(X,M_X)/(A,M_A)} ≅
τ_{≤•}Δ̄_{(X,M_X)/(A,M_A)}{•}.

Hypotheses (packet): As in log-nygaard-filtration; smoothness for the last assertion.

Lean form: `gr^i_N Δ^{L,(1)} ≅ Fil_i Δ̄^L{i}` in `D(A)` (restriction of scalars along `A → A/I`);
the smooth form with `τ_{≤i}` is not typed. -/
theorem graded_iso (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) (i : ℕ) :
    Nonempty (graded P X i ≅ (ModuleCat.restrictScalars
      (Ideal.Quotient.mk P.toPrism.I)).mapDerivedCategory.obj (conjugateFilTwist P X i)) := by
  sorry

end LogNygaard

/-! ## Node `PR.8/nygaard-hodge-fiber-sequence` (theorem): The Nygaard–Hodge fibre sequence and Nygaard completeness -/

namespace LogNygaard

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- Placeholder (owner `DerivedDeRhamCohomology:DD.6`): `Fil^i_H LΩ̂_{(R,P)/(Ā,M_A)}`, the Hodge
filtration of the `p`-completed derived log de Rham complex. -/
noncomputable def hodgeFilteredLogDeRham (P : IntegralBoundedPrelogPrism p A M)
    (X : PrelogAlgebra P) (i : ℕ) : DerivedCategory (ModuleCat.{u} P.bar) := sorry

/-- **Node `PR.8/nygaard-hodge-fiber-sequence`** (theorem): The Nygaard–Hodge fibre sequence and
Nygaard completeness.

For a simplicial pre-log ring (R, P) over (A/I, M_A) there is a functorial fibre sequence I ⊗^L_A
Fil^{•−1}_N Δ^{L,(1)} → Fil^•_N Δ^{L,(1)} → Fil^•_H LΩ̂_{(R,P)/(A/I,M_A)} of filtered objects, the
second map being the derived de Rham specialisation γ^• (Construction 5.21, Lemma 5.22). Globally on
X_ét it holds with the p-complete étale sheafified Hodge-filtered derived log de Rham complex. If
(X, M_X) is smooth over (A/I, M_A) with mod p fibre of Cartier type, the right term becomes
Ω^{≥•}_{(X,M_X)/(A/I,M_A)}; if moreover X is qcqs and Ω^1_log has finite rank D, then for i ≥ 0 and
j ≥ D the maps RΓ(Fil^j_N Δ^(1)) ⊗^L I^i → RΓ(Fil^{i+j}_N Δ^(1)) are isomorphisms and RΓ(X_ét,
Δ^(1)) is complete for the Nygaard filtration.

Hypotheses (packet): Derived log de Rham with Hodge filtration from DD.6; Cartier type and finite
rank for the last assertions.

Lean form: for each `i` a distinguished triangle `I ⊗^L Fil^i_N → Fil^{i+1}_N → Fil^{i+1}_H LΩ̂ →`
in `D(A)` whose first map is `mulI`; the global, Cartier-type and completeness assertions are not
typed. -/
theorem fiberSequence (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) (i : ℕ) :
    ∃ (g : fil P X (i + 1) ⟶ (ModuleCat.restrictScalars
          (Ideal.Quotient.mk P.toPrism.I)).mapDerivedCategory.obj
            (hodgeFilteredLogDeRham P X (i + 1)))
      (h : (ModuleCat.restrictScalars (Ideal.Quotient.mk P.toPrism.I)).mapDerivedCategory.obj
            (hodgeFilteredLogDeRham P X (i + 1)) ⟶
          (shiftFunctor (DerivedCategory (ModuleCat.{u} A)) (1 : ℤ)).obj
            ((idealTwist P 1).obj (fil P X i))),
      Pretriangulated.Triangle.mk (mulI P X i) g h ∈ Pretriangulated.distinguishedTriangles := by
  sorry

end LogNygaard

/-! ## Node `PR.8/log-l-eta-factorization` (theorem): The Lη_I factorisation of Frobenius -/

namespace LogNygaard

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- Placeholder (owner `AInfCohomology:AI.1`, through PR.3): the décalage functor `Lη_I` on `D(A)`. -/
noncomputable def decalage (P : IntegralBoundedPrelogPrism p A M) :
    DerivedCategory (ModuleCat.{u} A) ⥤ DerivedCategory (ModuleCat.{u} A) := sorry

/-- **Node `PR.8/log-l-eta-factorization`** (theorem): The Lη_I factorisation of Frobenius.

Let (A, I, M_A) be bounded with M_A integral. (1) If (R, P) is p-complete with bounded p^∞-torsion
and M_A → P a smooth chart, then gr^i_N Δ^{L,(1)} ≅ τ_{≤i}Δ̄^L{i} and the Frobenius factors as Δ^L
⊗̂^L_{A,φ} A = Δ^{L,(1)} → Lη_IΔ^L → Δ^L; if M_A → P is of Cartier type, Δ^{L,(1)} → Lη_IΔ^L is an
isomorphism identifying the Nygaard filtration with the truncations of the I-adic filtration for the
Beilinson t-structure. (2) For (X, M_X) smooth over (A/I, M_A), U ↦ Lη_I(Δ_{(X,M_X)}(U)) is a sheaf
on the affine étale site, defining Lη_IΔ_{(X,M_X)/(A,M_A)}; if the mod p fibre is of Cartier type,
Frobenius induces an isomorphism of étale sheaves Δ^(1)_{(X,M_X)/(A,M_A)} ≅ Lη_IΔ_{(X,M_X)/(A,M_A)},
and RΓ_Δ((U, M_U)/(A, M_A))^(1) ≅ Lη_I RΓ_Δ((U, M_U)/(A, M_A)) for affine U.

Hypotheses (packet): Smooth charts; Cartier type of the chart (1) or of the mod p fibre (2); Lη_I as
supplied by AI.1 through PR.3.

Lean form of (1) for a smooth chart of Cartier type (placeholder `CartierTypePrelogAlgebra`, CR.5):
`Δ^{L,(1)} ≅ Lη_I Δ^L`; the factorisation in general and the sheaf statement (2) are not typed. -/
theorem lEta (P : IntegralBoundedPrelogPrism p A M) (X : CartierTypePrelogAlgebra P) :
    Nonempty (frobeniusTwisted P X.toSmooth.toPrelogAlgebra ≅
      (decalage P).obj (DerivedLogPrismatic P X.toSmooth.toPrelogAlgebra)) := by
  sorry

end LogNygaard

/-! ## Node `PR.8/log-de-rham-comparison` (theorem): The log de Rham comparison -/

namespace LogNygaard

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- Placeholder (owner `CrystallineCohomology:CR.5:log-algebra`): the `p`-completed log de Rham
complex `Ω̂^•_{(R,P)/(Ā,M_A)}` in `D(Ā)`. -/
noncomputable def logDeRham (P : IntegralBoundedPrelogPrism p A M) (X : PrelogAlgebra P) :
    DerivedCategory (ModuleCat.{u} P.bar) := sorry

/-- **Node `PR.8/log-de-rham-comparison`** (theorem): The log de Rham comparison.

(1) If P → R is a smooth chart of Cartier type over (A/I, M_A), Δ^L_{(R,P)/(A,M_A)} ⊗̂^L_{A,φ} A/I ≅
Ω̂^•_{(R,P)/(A/I,M_A)} as E_∞-algebras in D(A/I). (2) For every simplicial pre-log ring (R, P) over
(A/I, M_A), Δ^L ⊗̂^L_{A,φ} A/I ≅ LΩ̂_{(R,P)/(A/I,M_A)} (p-completed derived log de Rham). (3) For
(X, M_X) smooth over (A/I, M_A) with mod p fibre of Cartier type, Δ_{(X,M_X)/(A,M_A)} ⊗̂^L_{A,φ_A}
A/I ≅ Ω^•_{(X,M_X)/(A/I,M_A)} as étale sheaves, and for qcqs X, RΓ_logdR((X, M_X)/(A/I, M_A)) ≅
RΓ_Δ((X, M_X)/(A, M_A)) ⊗̂^L_{A,φ_A} A/I as E_∞-A-algebras.

Hypotheses (packet): Cartier type of the chart or of the mod p fibre; (A, I, M_A) bounded with M_A
integral.

Lean form of (1): `Δ^L ⊗̂^L_{A, φ} A/I ≅ Ω̂^•_log` in `D(A/I)` for a smooth chart of Cartier type;
the `E_∞` structure, (2) and (3) are not typed. -/
theorem deRhamComparison (P : IntegralBoundedPrelogPrism p A M) (X : CartierTypePrelogAlgebra P) :
    Nonempty ((completedExtendScalars ((Ideal.Quotient.mk P.toPrism.I).comp P.toPrism.φ)
        (Ideal.span {(p : P.bar)})).obj (DerivedLogPrismatic P X.toSmooth.toPrelogAlgebra) ≅
      logDeRham P X.toSmooth.toPrelogAlgebra) := by
  sorry

end LogNygaard

/-! ## Node `PR.8/log-frobenius-isogeny` (theorem): Frobenius is an isogeny -/

namespace LogNygaard

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- Placeholder (node `PR.8/log-frobenius-isogeny`): the linearised Frobenius
`RΓ_Δ ⊗̂^L_{A, φ_A} A → RΓ_Δ`. -/
noncomputable def linearizedFrobenius (P : IntegralBoundedPrelogPrism p A M)
    (X : SmoothLogFormalScheme P) :
    (completedExtendScalars P.toPrism.φ P.pI).obj (LogPrismaticSite.cohomology P X) ⟶
      LogPrismaticSite.cohomology P X := sorry

/-- **Node `PR.8/log-frobenius-isogeny`** (theorem): Frobenius is an isogeny.

Let (X, M_X) be smooth over (A/I, M_A) with mod p fibre of Cartier type. For each i ≥ 0 there are
natural maps V_i: τ_{≤i}Δ_{(X,M_X)/(A,M_A)} ⊗^L_A I^i → τ_{≤i}Δ^(1)_{(X,M_X)/(A,M_A)} with φ∘V_i and
V_i∘(φ ⊗ 1) equal to the maps induced by I^i ⊂ A. If X is qcqs, V_i: H^i_Δ((X, M_X)/(A, M_A)) ⊗_A
I^i → H^i(RΓ_Δ ⊗̂^L_{A,φ_A} A) inverts Frobenius up to I^i; for I = (d) principal, φ∘V_i = V_i∘φ =
d^i. If Ω^1_log has finite rank D, a single V inverts φ up to I^D; in particular the linearised
Frobenius RΓ_Δ ⊗̂^L_{A,φ_A} A → RΓ_Δ becomes an isomorphism after inverting I.

Hypotheses (packet): Mod p fibre of Cartier type; qcqs for the global maps; finite rank D for the
uniform bound.

Lean form: for `I = (d)` principal and qcqs `X` of Cartier type, on `H^i` there is `V_i` with `φ ∘
V_i = d^i` and `V_i ∘ φ = d^i`; the truncated maps for general `I` and the uniform exponent are not
typed. -/
theorem frobeniusIsogeny (P : IntegralBoundedPrelogPrism p A M) (X : CartierTypeLogFormalScheme P)
    (d : A) (hd : P.toPrism.I = Ideal.span {d}) (i : ℕ) :
    ∃ V : (DerivedCategory.homologyFunctor _ i).obj (LogPrismaticSite.cohomology P X.toSmooth) ⟶
        (DerivedCategory.homologyFunctor _ i).obj
          ((completedExtendScalars P.toPrism.φ P.pI).obj (LogPrismaticSite.cohomology P X.toSmooth)),
      (V ≫ (DerivedCategory.homologyFunctor _ i).map (linearizedFrobenius P X.toSmooth)).hom =
          d ^ i • LinearMap.id ∧
        ((DerivedCategory.homologyFunctor _ i).map (linearizedFrobenius P X.toSmooth) ≫ V).hom =
          d ^ i • LinearMap.id := by
  sorry

end LogNygaard


/-! ## Node `PR.8/kummer-etale-site-log-scheme` (definition): The Kummer étale site of an fs log scheme -/

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`): fs log schemes. -/
def FsLogScheme : Type (u + 1) := sorry

noncomputable instance : Category.{u} FsLogScheme.{u} := sorry

namespace KummerEtale

/-- **Node `PR.8/kummer-etale-site-log-scheme`** (definition): The Kummer étale site of an fs log
scheme.

A homomorphism of fs monoids h: P → Q is of Kummer type if it is injective and every a ∈ Q has a
power a^n (n ≥ 1) in h(P); a morphism f: X → Y of fs log schemes is of Kummer type if M_{Y,f(x)}/O^×
→ M_{X,x}/O^× is of Kummer type for every x. For an fs log scheme X, the Kummer étale site X_két is
the category (fs/X) (or its small variant of Kummer étale X-schemes) with coverings the families
{f_i: U_i → X} of log étale morphisms of Kummer type with X = ∪ f_i(U_i); RΓ_két(X, Λ) is its
cohomology. For a pre-log ring (R[1/p], P) with P saturated (not necessarily fine),
RΓ_két(Spec(R[1/p], P)^a, Λ) := colim_{P_i ⊂ P} RΓ_két(Spec(R[1/p], P_i)^a, Λ), over fine saturated
submonoids P_i (a filtered colimit). Standard covers: for P → Q of Kummer type with Q fs, Spec(R
⊗_{Z[P]} Z[Q], Q)^a → Spec(R, P)^a is a Kummer étale cover when the index is invertible on R.

Hypotheses (packet): fs log schemes (CR.5); Kummer-étale coverings are log étale (Kato) and of
Kummer type.

API `KummerEtale.IsKummerType` (other; node `PR.8/kummer-etale-site-log-scheme`): Kummer type for
maps of fs monoids and morphisms of fs log schemes.

Lean form: the monoid form (for maps of fs monoids, stated for all commutative monoids); the form
for morphisms of fs log schemes (stalkwise on characteristic monoids) is not typed. -/
def IsKummerType {P Q : Type*} [CommMonoid P] [CommMonoid Q] (h : P →* Q) : Prop :=
  Function.Injective h ∧ ∀ a : Q, ∃ n : ℕ, 1 ≤ n ∧ a ^ n ∈ MonoidHom.mrange h

/-- API `KummerEtale.site` (constructor; node `PR.8/kummer-etale-site-log-scheme`): The Kummer étale
site X_két of an fs log scheme.

Placeholder carrier: the underlying category; the topology is `KummerEtale.topology`. -/
def site (X : FsLogScheme.{u}) : Type (u + 1) := sorry

noncomputable instance (X : FsLogScheme.{u}) : Category.{u} (site X) := sorry

/-- The Kummer étale topology. -/
noncomputable def topology (X : FsLogScheme.{u}) : GrothendieckTopology (site X) := sorry

/-- API `KummerEtale.cohomology` (constructor; node `PR.8/kummer-etale-site-log-scheme`): RΓ_két(X,
Λ) for a torsion abelian group Λ, and its colimit extension to saturated charts.

Lean form: for coefficient rings `Λ` that are torsion (`(n : Λ) = 0` for some `n ≥ 1`, recorded
where used); the colimit extension to saturated charts is `kummerEtaleSaturated` below. -/
noncomputable def cohomology (X : FsLogScheme.{u}) (Λ : Type) [CommRing Λ] :
    DerivedCategory (ModuleCat.{u} Λ) := sorry

/-! * API `KummerEtale.standardCover` (example; node `PR.8/kummer-etale-site-log-scheme`): For P → Q
of Kummer type with index invertible, Spec(R ⊗_{Z[P]} Z[Q], Q)^a → Spec(R, P)^a is a covering.

  Not typed: needs the fs log scheme `Spec(R ⊗_{ℤ[P]} ℤ[Q], Q)^a` of a chart (CR.5) and coverings of
the placeholder site. -/

/-! * API `KummerEtale.trivialLog` (compatibility; node `PR.8/kummer-etale-site-log-scheme`): For
trivial log structure X_két ≃ X_ét.

  Not typed: the small étale site of the underlying scheme as a site comparable with the placeholder
is not set up (SchemeAndStackFoundations). -/

/-- API `KummerEtale.baseChange` (functoriality; node `PR.8/kummer-etale-site-log-scheme`): Kummer
étale covers are stable under fs base change; morphisms of fs log schemes induce morphisms of sites.

Lean form: the induced morphism of sites (continuity of the pull-back functor); stability of covers
under fs base change is not typed separately. -/
noncomputable def baseChange {X Y : FsLogScheme.{u}} (f : X ⟶ Y) : site Y ⥤ site X := sorry

theorem baseChange_isContinuous {X Y : FsLogScheme.{u}} (f : X ⟶ Y) :
    (baseChange f).IsContinuous (topology Y) (topology X) := by
  sorry

/-! * API `KummerEtale.toLogEtale` (relation; node `PR.8/kummer-etale-site-log-scheme`): For
constant torsion Λ, Kummer étale and full log étale cohomology agree (Nakayama II Proposition 5.4,
KY Remark 6.3).

  Not typed: the full log étale site (Nakayama) is not a carrier here. -/

/-! * Unit test `KummerEtale.trivialLog_eq` (compatibility; node
`PR.8/kummer-etale-site-log-scheme`): For X with trivial log structure, RΓ_két(X, Λ) = RΓ_ét(X, Λ).

  Not typed: étale cohomology of schemes is not in Mathlib (SchemeAndStackFoundations). -/

/-- Unit test `KummerEtale.kummerType_nat` (computation; node `PR.8/kummer-etale-site-log-scheme`):
For n ≥ 1, N → N, 1 ↦ n is of Kummer type; at n = 0 it is not injective. The diagonal N → N^2, 1 ↦
(1,1) is not of Kummer type (not every element has a positive multiple in the image). -/
theorem kummerType_nat (n : ℕ) (hn : 1 ≤ n) :
    IsKummerType (powMonoidHom n : Multiplicative ℕ →* Multiplicative ℕ) ∧
      ¬ IsKummerType (powMonoidHom 0 : Multiplicative ℕ →* Multiplicative ℕ) ∧
      ¬ IsKummerType ((MonoidHom.id (Multiplicative ℕ)).prod (MonoidHom.id (Multiplicative ℕ))) := by
  sorry

/-! * Unit test `KummerEtale.empty` (degenerate; node `PR.8/kummer-etale-site-log-scheme`): The
empty family covers the empty log scheme.

  Not typed: coverings of the placeholder site are not recorded. -/

/-! * Unit test `KummerEtale.not_etale` (non-example; node `PR.8/kummer-etale-site-log-scheme`): For
n > 1 and K algebraically closed of characteristic 0 and the log point X = Spec(K, N → 0)^a,
H^1_két(X, Z/n) ≅ Z/n(−1) ≠ 0 = H^1_ét(Spec K, Z/n): Kummer étale cohomology is not étale cohomology
of the underlying scheme.

  Not typed: needs `H^1` of the log point over an algebraically closed field of characteristic `0`
and étale cohomology of `Spec K`. -/

end KummerEtale

/-! ## Node `PR.8/log-scheme-vs-log-adic-kummer` (lemma): Kummer étale cohomology of log schemes and of log adic spaces -/

/-- Placeholder carrier (owners `CrystallineCohomology:CR.5:log-algebra`,
`HodgeTateAndCanonicalSubgroups:T6:log-sites`): classically `p`-complete fs pre-log rings `(R, P)`
with `R` topologically finitely generated over a noetherian ring. -/
def TopFinFsPrelogRing (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

namespace TopFinFsPrelogRing

variable {p : ℕ} [Fact p.Prime]

/-- `Spec(R[1/p], P)^a`. -/
noncomputable def genericLogScheme (X : TopFinFsPrelogRing.{u} p) : FsLogScheme.{u} := sorry

/-- Placeholder (owner `HodgeTateAndCanonicalSubgroups:T6:log-sites`): Kummer étale cohomology of
the fs log adic space `(Spa(R[1/p], R), P)^a` (Diao–Lan–Liu–Zhu). -/
noncomputable def logAdicKummerCohomology (X : TopFinFsPrelogRing.{u} p) (Λ : Type)
    [CommRing Λ] : DerivedCategory (ModuleCat.{u} Λ) := sorry

end TopFinFsPrelogRing

/-- **Node `PR.8/log-scheme-vs-log-adic-kummer`** (lemma): Kummer étale cohomology of log schemes
and of log adic spaces.

Let Λ = Z/nZ and (R, P) a classically p-complete fs pre-log ring with R topologically finitely
generated over a noetherian ring A_0. With X = Spec(R[1/p], P)^a and X^ad = (Spa(R[1/p], R), P)^a
the associated fs log adic space (Diao–Lan–Liu–Zhu), there is a natural isomorphism RΓ_két(X, Λ) ≅
RΓ_két(X^ad, Λ).

Hypotheses (packet): Fs pre-log ring; R topologically of finite type over a noetherian base;
Spa(R[1/p], R) is then an adic space. -/
theorem logScheme_vs_logAdic {p : ℕ} [Fact p.Prime] (X : TopFinFsPrelogRing.{u} p) (n : ℕ) :
    Nonempty (KummerEtale.cohomology X.genericLogScheme (ZMod n) ≅
      X.logAdicKummerCohomology (ZMod n)) := by
  sorry

/-! ## Node `PR.8/affine-kummer-etale-comparison` (theorem): The affine Kummer-étale comparison -/

namespace KummerEtale

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]

/-- Placeholder (node `PR.8/kummer-etale-site-log-scheme`): `RΓ_két(Spec(R[1/p], P)^a, Λ)` for a
saturated chart, the filtered colimit over fine saturated submonoids. -/
noncomputable def kummerEtaleSaturated {P : IntegralBoundedPrelogPrism p A PUnit.{u + 1}}
    (X : PrelogAlgebra P) (Λ : Type) [CommRing Λ] : DerivedCategory (ModuleCat.{u} Λ) := sorry

/-- Placeholder (node `PR.8/affine-kummer-etale-comparison`): `(Δ^L_{(R,P)/A}[1/d]/p^n)^{φ=1}`, the
derived fibre of `φ − 1` on `DerivedLogPrismatic` after inverting `d` and reducing mod `p^n`. -/
noncomputable def phiFixed {P : IntegralBoundedPrelogPrism p A PUnit.{u + 1}} (d : A)
    (X : PrelogAlgebra P) (n : ℕ) : DerivedCategory (ModuleCat.{u} (ZMod (p ^ n))) := sorry

/-- **Node `PR.8/affine-kummer-etale-comparison`** (theorem): The affine Kummer-étale comparison.

Let (A, I = (d)) be a perfect prism with I ≠ (p), and (R, P) a p-adically complete pre-log
A/I-algebra with P saturated and R of bounded p^∞-torsion. For each n ≥ 1 there is a canonical
isomorphism RΓ_két(Spec(R[1/p], P)^a, Z/p^n) ≅ (Δ^L_{(R,P)/A}[1/d]/p^n)^{φ=1}, functorial in (R, P),
where (−)^{φ=1} is the derived fibre of φ − 1. The base prism may be replaced by any perfect log
prism, or by a pre-log prism with (A/I, M_A) perfectoid or pseudo-perfectoid (derived-log-properties
(5)); the left side may equally be the full log étale cohomology.

Hypotheses (packet): Perfect prism, I ≠ (p) (both sides vanish for I = (p)); P saturated; bounded
p^∞-torsion.

Lean form: over a perfect prism `(A, (d))` with `I ≠ (p)` (base with trivial monoid) and `(R, P)`
`p`-adically complete with saturated chart and bounded `p^∞`-torsion; functoriality and the variants
are not typed. -/
theorem affineComparison (P : IntegralBoundedPrelogPrism p A PUnit.{u + 1})
    (hperf : P.toPrism.IsPerfect) (d : A) (hd : P.toPrism.I = Ideal.span {d})
    (hne : P.toPrism.I ≠ Ideal.span {(p : A)}) (X : PrelogAlgebra P)
    [IsAdicComplete (Ideal.span {(p : X.R)}) X.R]
    (hsat : ∀ (x : Algebra.GrothendieckGroup X.Q) (n : ℕ), 1 ≤ n →
      x ^ n ∈ MonoidHom.mrange (Algebra.GrothendieckGroup.of (M := X.Q)) →
      x ∈ MonoidHom.mrange (Algebra.GrothendieckGroup.of (M := X.Q)))
    (htors : ∃ N : ℕ, ∀ x : X.R, (∃ m : ℕ, (p : X.R) ^ m * x = 0) → (p : X.R) ^ N * x = 0)
    (n : ℕ) (hn : 1 ≤ n) :
    Nonempty (kummerEtaleSaturated X (ZMod (p ^ n)) ≅ phiFixed d X n) := by
  sorry

end KummerEtale

/-! ## Node `PR.8/log-diamond` (definition): Log diamonds -/

/-- Placeholder carrier (owners `DiamondsAndVStacks:D4`, `DiamondEtaleCohomology:C0`): diamonds
over `Spd ℚ_p`. -/
def Diamond (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

/-- **Node `PR.8/log-diamond`** (definition): Log diamonds.

A log (locally spatial) diamond over Q_p is a (locally spatial) diamond Y with a map Y → Spd Q_p and
a log structure M_Y → Ô_Y on the quasi-pro-étale site Y_qproét, where Ô_Y and Ô^+_Y are the
completed structure sheaves (for affinoid perfectoid Y′ = Spa(R, R^+) quasi-pro-étale over Y with
untilt (R^♯, R^{♯+}), Ô_Y(Y′) = R^♯). A chart is P → Γ(Y_qproét, M_Y) inducing P^a ≅ M_Y and
factoring through Ô^+_Y; (Y, M_Y) is quasi-coherent (integral, saturated, fine, fs) if such charts
exist quasi-pro-étale locally. Maps are assumed to have compatible charts locally (Convention 7.5).
Saturation exists for quasi-coherent log diamonds (via perfectoidisation of R^+ ⊗_{Z[P]} Z[P^sat])
and fibre products exist among saturated quasi-coherent (resp. fs) log diamonds; from now on fibre
products are saturated fibre products ×^sat.

Hypotheses (packet): Diamonds, locally spatial diamonds and quasi-pro-étale maps as supplied by
DiamondsAndVStacks D4 and DiamondEtaleCohomology C0.

API `LogDiamond` (constructor; node `PR.8/log-diamond`): A diamond Y → Spd Q_p with a log structure
M_Y → Ô_Y on Y_qproét.

Placeholder carrier (node `PR.8/log-diamond`): log (locally spatial) diamonds over `ℚ_p`, with maps
having compatible charts locally (Convention 7.5). -/
def LogDiamond (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

namespace LogDiamond

variable {p : ℕ} [Fact p.Prime]

noncomputable instance : Category.{u} (LogDiamond.{u} p) := sorry

/-! * API `LogDiamond.chart` (data; node `PR.8/log-diamond`): Charts P → Γ(Y_qproét, M_Y) factoring
through Ô^+_Y, with integral/saturated/fine/fs variants.

  Not typed: charts are maps into sections of the log structure on the quasi-pro-étale site, which
the placeholder does not expose. -/

/-! * API `LogDiamond.IsQuasiCoherent` (other; node `PR.8/log-diamond`): Existence of charts
quasi-pro-étale locally (with integral, saturated, fine, fs variants).

  Not typed: existence of charts quasi-pro-étale locally is a local condition on the placeholder log
structure; a `Prop` placeholder is not used. -/

/-- API `LogDiamond.saturation` (universal-property; node `PR.8/log-diamond`): A quasi-coherent log
diamond admits a saturation map (Y^sat, M_Y^sat) → (Y, M_Y), terminal among maps from saturated
quasi-coherent log diamonds to (Y, M_Y).

Lean form: the saturation and its map to `(Y, M_Y)`; terminality among maps from saturated
quasi-coherent log diamonds is not typed (saturatedness is a condition on the placeholder). -/
noncomputable def saturation (Y : LogDiamond.{u} p) : LogDiamond.{u} p := sorry

/-- The saturation map `(Y^sat, M^sat) → (Y, M_Y)`. -/
noncomputable def saturationMap (Y : LogDiamond.{u} p) : saturation Y ⟶ Y := sorry

/-! * API `LogDiamond.satFiberProduct` (structure; node `PR.8/log-diamond`): Saturated fibre
products exist among saturated quasi-coherent (resp. fs) log diamonds.

  Not typed: needs the subcategory of saturated quasi-coherent log diamonds (a condition on the
placeholder). -/

/-- Placeholder carrier (owner `HodgeTateAndCanonicalSubgroups:T6:log-sites`): fs log adic spaces
(locally noetherian or perfectoid). -/
def _root_.TauCeti.LogPrismatic.FsLogAdicSpace (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

noncomputable instance : Category.{u} (FsLogAdicSpace.{u} p) := sorry

/-- API `LogDiamond.ofLogAdicSpace` (coercion; node `PR.8/log-diamond`): An fs log adic space (DLLZ,
from T6:log-sites), locally noetherian or perfectoid, gives an fs log diamond (X, M_X)^♦. -/
noncomputable def ofLogAdicSpace : FsLogAdicSpace.{u} p ⥤ LogDiamond.{u} p := sorry

/-- The diamond `Y` with the trivial log structure `Ô_Y^×`. -/
noncomputable def trivialOf (Y : Diamond.{u} p) : LogDiamond.{u} p := sorry

/-- Unit test `LogDiamond.trivial` (degenerate; node `PR.8/log-diamond`): Y with M_Y = Ô_Y^× is a
saturated quasi-coherent log diamond and its saturation is itself.

Lean form: the saturation of a trivial log diamond is itself (saturatedness and quasi-coherence are
conditions on the placeholder and not typed). -/
theorem trivial (Y : Diamond.{u} p) : IsIso (saturationMap (trivialOf Y)) := by
  sorry

/-! * Unit test `LogDiamond.disc` (computation; node `PR.8/log-diamond`): (Spd(Q_p⟨T⟩, Z_p⟨T⟩),
T^N)^a is an fs log diamond with chart N → Ô^+, 1 ↦ T.

  Not typed: needs `Spd(ℚ_p⟨T⟩, ℤ_p⟨T⟩)` and fs-ness of a chart. -/

/-! * Unit test `LogDiamond.compat_logAdic` (compatibility; node `PR.8/log-diamond`): For an fs log
adic space from T6:log-sites, the associated log diamond has the log structure induced by ν^{-1} of
the étale log structure (KY Example 7.6).

  Not typed: concerns the log structure of the placeholder `ofLogAdicSpace`, which is not exposed.
-/

/-! * Unit test `LogDiamond.not_naive_product` (non-example; node `PR.8/log-diamond`): For n > 1,
take the log n-th-root cover of the disc over an algebraically closed complete C. Its ordinary
diamond self-product has branches meeting over T = 0; its saturated log self-product is the disjoint
union of n copies of the root disc after choosing μ_n(C). Over Q_p this splitting is asserted only
after this geometric base change.

  Not typed: needs the ordinary and saturated fibre products of root covers of the disc over a
complete algebraically closed field. -/

end LogDiamond

/-! ## Node `PR.8/log-diamond-generic-fibre` (construction): The log diamond generic fibre -/

/-- Placeholder carrier (owners `DiamondsAndVStacks:D6`, CR.5): pre-log Huber pairs
`((R, R⁺), P → R⁺)` over `(ℚ_p, ℤ_p)`. -/
def PrelogHuberPair (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

/-- Placeholder carrier (owner CR.5): `p`-complete fs pre-log rings `(R, P)` with bounded
`p^∞`-torsion. -/
def FsPrelogRing (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

namespace FsPrelogRing

variable {p : ℕ} [Fact p.Prime]

/-- `(Spf R, P)^a`. -/
noncomputable def spf (X : FsPrelogRing.{u} p) : FsLogFormalScheme.{u} p := sorry

/-- `((R[1/p], R⁺), P)` with `R⁺` the integral closure of `R`. -/
noncomputable def huberPair (X : FsPrelogRing.{u} p) : PrelogHuberPair.{u} p := sorry

/-- `Spec(R[1/p], P)^a`. -/
noncomputable def genericLogScheme (X : FsPrelogRing.{u} p) : FsLogScheme.{u} := sorry

end FsPrelogRing

namespace LogDiamond

variable {p : ℕ} [Fact p.Prime]

/-- **Node `PR.8/log-diamond-generic-fibre`** (construction): The log diamond generic fibre.

For a pre-log Huber pair (R, R^+) over (Q_p, Z_p) with a monoid map P → R^+, (Spd(R, R^+), P)^a
denotes the associated log diamond (log structure associated with P → Ô^+). For an fs log p-adic
formal scheme (X, M_X) over Z_p, its diamond generic fibre X^♦_η → Spd Q_p carries the fs log
structure induced by M_X, giving the log diamond (X, M_X)^♦_η, functorial in (X, M_X); for
p-complete (R, P) with bounded p^∞-torsion it is (Spd(R[1/p], R^+), P)^a with R^+ the integral
closure of R. The underlying pre-adic space Spa(R[1/p], R^+) need not be sheafy; the log diamond
always exists.

Hypotheses (packet): Fs log p-adic formal schemes; diamonds of Huber pairs via DiamondsAndVStacks
D6.

API `LogDiamond.genericFibre` (constructor; node `PR.8/log-diamond-generic-fibre`): (X, M_X) ↦ (X,
M_X)^♦_η for fs log p-adic formal schemes. -/
noncomputable def genericFibre : FsLogFormalScheme.{u} p ⥤ LogDiamond.{u} p := sorry

/-- API `LogDiamond.ofHuberPair` (constructor; node `PR.8/log-diamond-generic-fibre`): (Spd(R, R^+),
P)^a for a pre-log Huber pair. -/
noncomputable def ofHuberPair (X : PrelogHuberPair.{u} p) : LogDiamond.{u} p := sorry

/-- API `LogDiamond.genericFibre_map` (functoriality; node `PR.8/log-diamond-generic-fibre`):
Functoriality in maps of fs log p-adic formal schemes, compatible with composition.

Lean form: the action of the functor `genericFibre` on maps (compatibility with composition is
functoriality). -/
noncomputable def genericFibre_map {X Y : FsLogFormalScheme.{u} p} (f : X ⟶ Y) :
    genericFibre.obj X ⟶ genericFibre.obj Y :=
  genericFibre.map f

/-! * API `LogDiamond.genericFibre_trivial` (compatibility; node `PR.8/log-diamond-generic-fibre`):
For trivial M_X, the underlying diamond is X^♦_η with trivial log structure.

  Not typed: trivial log structures on placeholder formal schemes and the diamond generic fibre
`X^♦_η` are not exposed. -/

/-- API `LogDiamond.genericFibre_affine` (characterisation; node `PR.8/log-diamond-generic-fibre`):
For X = Spf(R) with fs chart P, (X, M_X)^♦_η ≅ (Spd(R[1/p], R^+), P)^a. -/
theorem genericFibre_affine (X : FsPrelogRing.{u} p) :
    Nonempty (genericFibre.obj X.spf ≅ ofHuberPair X.huberPair) := by
  sorry

/-! * Unit test `LogDiamond.genericFibre_point` (degenerate; node `PR.8/log-diamond-generic-fibre`):
For (Spf Z_p, trivial) the generic fibre is Spd Q_p with trivial log structure.

  Not typed: needs `Spd ℚ_p` as a log diamond and `Spf ℤ_p` as an fs log formal scheme. -/

/-! * Unit test `LogDiamond.genericFibre_disc` (computation; node `PR.8/log-diamond-generic-fibre`):
For (Spf Z_p⟨T⟩, T^N)^a the generic fibre is (Spd(Q_p⟨T⟩, Z_p⟨T⟩), T^N)^a.

  Not typed: needs the specific objects `(Spf ℤ_p⟨T⟩, T^ℕ)^a` and `(Spd(ℚ_p⟨T⟩, ℤ_p⟨T⟩), T^ℕ)^a`. -/

/-! * Unit test `LogDiamond.genericFibre_ok_nonsheafy` (characterisation; node
`PR.8/log-diamond-generic-fibre`): For p-complete R with bounded p^∞-torsion whose Spa(R[1/p], R^+)
is not sheafy, (Spd(R[1/p], R^+), P)^a still exists as a log diamond.

  Not typed: sheafiness of `Spa(R[1/p], R⁺)` is not a carrier here; `ofHuberPair` is defined for all
pre-log Huber pairs. -/

/-! * Unit test `LogDiamond.genericFibre_not_complement` (non-example; node
`PR.8/log-diamond-generic-fibre`): The log diamond generic fibre of (Spf Z_p⟨T⟩, T^N) is not the
punctured disc: its underlying diamond contains T = 0; only its Kummer-étale cohomology sees the
puncture.

  Not typed: needs the punctured disc and the underlying diamond of a log diamond. -/

end LogDiamond

/-! ## Node `PR.8/stdisc-log-perfectoid` (definition): Strictly totally disconnected log perfectoid spaces -/

/-- Placeholder carrier (owner `DiamondsAndVStacks:D1`): strictly totally disconnected perfectoid
spaces. -/
def StdiscPerfectoidSpace (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

/-- Placeholder (owner D1): the ring `Γ(X, Ô⁺_X)`. -/
def StdiscPerfectoidSpace.integralSections {p : ℕ} [Fact p.Prime]
    (X : StdiscPerfectoidSpace.{u} p) : Type u := sorry

noncomputable instance {p : ℕ} [Fact p.Prime] (X : StdiscPerfectoidSpace.{u} p) :
    CommRing X.integralSections := sorry

/-- **Node `PR.8/stdisc-log-perfectoid`** (definition): Strictly totally disconnected log perfectoid
spaces.

A strictly totally disconnected log perfectoid space is a strictly totally disconnected perfectoid
space X (qcqs, every étale cover splits) with a saturated quasi-coherent log structure M_X such that
M_X/M_X^× is uniquely divisible; then X is affinoid perfectoid and Γ(X, M_X) is saturated and
divisible. For such X, H^1(X, Ô_X^×) = 0 for the pro-étale topology, so Γ(X, M_X) → Γ(X, M_X/M_X^×)
is surjective for any integral quasi-coherent M_X; it suffices that M_X be divisible, and (X, P)^a
is such a space for any divisible saturated P → Γ(X, Ô^+_X).

Hypotheses (packet): Strictly totally disconnected perfectoid spaces as in DiamondsAndVStacks D1.

Placeholder carrier (node `PR.8/stdisc-log-perfectoid`): strictly totally disconnected log
perfectoid spaces (the defining condition `LogPerfectoid.IsStrictlyTotallyDisconnected` is built
into the type). -/
def StdiscLogPerfectoid (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

namespace LogPerfectoid

variable {p : ℕ} [Fact p.Prime]

/-! * API `LogPerfectoid.IsStrictlyTotallyDisconnected` (other; node `PR.8/stdisc-log-perfectoid`):
The defining condition: X strictly totally disconnected, M_X saturated quasi-coherent, M_X/M_X^×
uniquely divisible.

  Not typed: the condition (saturated quasi-coherent log structure with uniquely divisible
characteristic monoid) is on placeholder log structures; it is built into the carrier
`StdiscLogPerfectoid` instead of a `Prop` placeholder. -/

/-! * API `LogPerfectoid.h1_units` (other; node `PR.8/stdisc-log-perfectoid`): H^1_proét(X, Ô_X^×) =
0 for X strictly totally disconnected.

  Not typed: pro-étale cohomology of `Ô_X^×` is not available. -/

/-! * API `LogPerfectoid.sections_surjective` (characterisation; node `PR.8/stdisc-log-perfectoid`):
Γ(X, M_X) → Γ(X, M_X/M_X^×) is surjective.

  Not typed: sections of the placeholder log structure are not exposed. -/

/-- API `LogPerfectoid.of_divisible` (constructor; node `PR.8/stdisc-log-perfectoid`): (X, P)^a for
P divisible saturated with P → Γ(X, Ô^+_X). -/
noncomputable def of_divisible (X : StdiscPerfectoidSpace.{u} p) {P : Type u} [CommMonoid P]
    (hdiv : ∀ (x : P) (n : ℕ), 1 ≤ n → ∃ y, y ^ n = x)
    (hsat : ∀ (x : Algebra.GrothendieckGroup P) (n : ℕ), 1 ≤ n →
      x ^ n ∈ MonoidHom.mrange (Algebra.GrothendieckGroup.of (M := P)) →
      x ∈ MonoidHom.mrange (Algebra.GrothendieckGroup.of (M := P)))
    (α : P →* X.integralSections) : StdiscLogPerfectoid.{u} p := sorry

/-! * API `LogPerfectoid.divisible_iff` (characterisation; node `PR.8/stdisc-log-perfectoid`): It
suffices that M_X be divisible (Remark 7.13).

  Not typed: rests on `LogPerfectoid.IsStrictlyTotallyDisconnected`. -/

/-- Unit test `LogPerfectoid.compat_D1` (compatibility; node `PR.8/stdisc-log-perfectoid`): The
underlying perfectoid space is strictly totally disconnected in the sense of DiamondsAndVStacks D1.

Lean form: the forgetful map to D1's strictly totally disconnected perfectoid spaces. -/
noncomputable def compat_D1 (X : StdiscLogPerfectoid.{u} p) : StdiscPerfectoidSpace.{u} p := sorry

/-- Unit test `LogPerfectoid.trivial` (degenerate; node `PR.8/stdisc-log-perfectoid`): Any strictly
totally disconnected perfectoid space with trivial log structure is a strictly totally disconnected
log perfectoid space.

Lean form: the object with trivial log structure on a given space, and its underlying space. -/
noncomputable def trivial (X : StdiscPerfectoidSpace.{u} p) : StdiscLogPerfectoid.{u} p := sorry

theorem trivial_compat (X : StdiscPerfectoidSpace.{u} p) : compat_D1 (trivial X) = X := by
  sorry

/-! * Unit test `LogPerfectoid.rational_monoid` (computation; node `PR.8/stdisc-log-perfectoid`):
For C algebraically closed, the chart Q_{≥0} → O_C sending 0 ↦ 1 and every a > 0 to 0 on Spa(C,O_C)
gives a strictly totally disconnected log perfectoid space: its characteristic monoid is Q_{≥0},
which is uniquely divisible.

  Not typed: needs `Spa(C, O_C)` for a complete algebraically closed field. -/

/-! * Unit test `LogPerfectoid.not_fs` (non-example; node `PR.8/stdisc-log-perfectoid`): On
Spa(C,O_C), the chart N → O_C with 0 ↦ 1 and every n > 0 mapping to 0 gives characteristic monoid N,
so the log perfectoid space is not strictly totally disconnected as a log space. In contrast, 1 ↦ p
gives trivial associated log structure on Ô = C, hence is not this non-example.

  Not typed: needs `Spa(C, O_C)` and the characteristic monoid of a placeholder log structure. -/

end LogPerfectoid

/-! ## Node `PR.8/quasi-pro-kummer-etale-site` (definition): The quasi-pro-Kummer-étale site -/

namespace QProKummerEtale

variable {p : ℕ} [Fact p.Prime]

/-! * API `QProKummerEtale.IsQPKet` (other; node `PR.8/quasi-pro-kummer-etale-site`): The
quasi-pro-Kummer-étale condition on a map, with Kummer-étale and finite Kummer-étale variants.

  Not typed: a condition on maps of placeholder log diamonds tested against all strictly totally
disconnected log perfectoid spaces; a `Prop` placeholder is not used. -/

/-- **Node `PR.8/quasi-pro-kummer-etale-site`** (definition): The quasi-pro-Kummer-étale site.

A locally separated map f: (Y′, M_{Y′}) → (Y, M_Y) of saturated quasi-coherent log diamonds is
quasi-pro-Kummer-étale (resp. Kummer-étale, finite Kummer-étale) if for every map (X, M_X) → (Y,
M_Y) from a strictly totally disconnected log perfectoid space, Y′ ×^sat_Y X is a perfectoid space
and (Y′ ×_Y X, M) → (X, M_X) is strict and pro-étale (resp. étale, finite étale); it is surjective
if each such pullback is surjective. The quasi-pro-Kummer-étale site (Y, M_Y)_qpkét consists of
quasi-pro-Kummer-étale maps to (Y, M_Y) with jointly surjective coverings. Strict maps are
quasi-pro-Kummer-étale iff the underlying map is quasi-pro-étale; the classes are stable under
pullback and composition and satisfy cancellation in the following direction: if g and g∘f belong to
the class, then f belongs to the class (no unrestricted two-out-of-three assertion); maps of log
diamonds induce morphisms of sites.

Hypotheses (packet): Saturated quasi-coherent log diamonds; locally separated maps (as in Scholze).

API `QProKummerEtale.site` (constructor; node `PR.8/quasi-pro-kummer-etale-site`): The site (Y,
M_Y)_qpkét.

Placeholder carrier: the underlying category; its topology is `QProKummerEtale.topology`. -/
def site (Y : LogDiamond.{u} p) : Type (u + 1) := sorry

noncomputable instance (Y : LogDiamond.{u} p) : Category.{u} (site Y) := sorry

/-- The quasi-pro-Kummer-étale topology (jointly surjective families). -/
noncomputable def topology (Y : LogDiamond.{u} p) : GrothendieckTopology (site Y) := sorry

/-! * API `QProKummerEtale.strict_iff` (characterisation; node `PR.8/quasi-pro-kummer-etale-site`):
A strict map is quasi-pro-Kummer-étale iff its underlying map of diamonds is pro-étale in the quasi
sense.

  Not typed: rests on `QProKummerEtale.IsQPKet`. -/

/-! * API `QProKummerEtale.comp` (structure; node `PR.8/quasi-pro-kummer-etale-site`): Stability
under composition and saturated pullback. Cancellation in KY Proposition 7.16(4): if g and g∘f are
quasi-pro-Kummer-étale (respectively Kummer-étale or finite Kummer-étale), then f is too.

  Not typed: rests on `QProKummerEtale.IsQPKet`. -/

/-- API `QProKummerEtale.pullbackSite` (functoriality; node `PR.8/quasi-pro-kummer-etale-site`): A
map of saturated quasi-coherent log diamonds induces a morphism of sites. -/
noncomputable def pullbackSite {Y' Y : LogDiamond.{u} p} (f : Y' ⟶ Y) : site Y ⥤ site Y' := sorry

theorem pullbackSite_isContinuous {Y' Y : LogDiamond.{u} p} (f : Y' ⟶ Y) :
    (pullbackSite f).IsContinuous (topology Y) (topology Y') := by
  sorry

/-- Placeholder (owner `DiamondEtaleCohomology:C0`): the quasi-pro-étale site of a diamond. -/
def _root_.TauCeti.LogPrismatic.Diamond.qproet (Y : Diamond.{u} p) : Type (u + 1) := sorry

noncomputable instance (Y : Diamond.{u} p) : Category.{u} Y.qproet := sorry

/-- API `QProKummerEtale.trivialLog` (compatibility; node `PR.8/quasi-pro-kummer-etale-site`): For
trivial log structures (Y, M_Y)_qpkét ≃ Y_qproét (DiamondEtaleCohomology C0). -/
noncomputable def trivialLog (Y : Diamond.{u} p) : site (LogDiamond.trivialOf Y) ≌ Y.qproet :=
  sorry

/-- API `QProKummerEtale.cohomology` (constructor; node `PR.8/quasi-pro-kummer-etale-site`):
RΓ_qpkét((Y, M_Y), Λ) for a condensed (discrete or profinite) coefficient ring.

Lean form: for discrete coefficient rings; condensed (profinite) coefficients are not typed. -/
noncomputable def cohomology (Y : LogDiamond.{u} p) (Λ : Type) [CommRing Λ] :
    DerivedCategory (ModuleCat.{u} Λ) := sorry

/-! * Unit test `QProKummerEtale.kummer_root` (computation; node
`PR.8/quasi-pro-kummer-etale-site`): (Spd(Q_p⟨T^{1/n}⟩, Z_p⟨T^{1/n}⟩), T^{N/n}) → (Spd(Q_p⟨T⟩,
Z_p⟨T⟩), T^N) is surjective finite Kummer-étale; over a strictly totally disconnected log perfectoid
space its saturated pullback is n copies indexed by Z/n.

  Not typed: needs the root covers of `Spd(ℚ_p⟨T⟩, ℤ_p⟨T⟩)` and `IsQPKet`. -/

/-! * Unit test `QProKummerEtale.trivial` (compatibility; node `PR.8/quasi-pro-kummer-etale-site`):
With trivial log structures quasi-pro-Kummer-étale maps are quasi-pro-étale maps.

  Not typed: rests on `QProKummerEtale.IsQPKet`. -/

/-! * Unit test `QProKummerEtale.id` (degenerate; node `PR.8/quasi-pro-kummer-etale-site`): Identity
maps are quasi-pro-Kummer-étale coverings.

  Not typed: rests on coverings of the placeholder site (`IsQPKet`). -/

/-! * Unit test `QProKummerEtale.not_strict_etale` (non-example; node
`PR.8/quasi-pro-kummer-etale-site`): For n > 1, the Kummer map T ↦ T^n of log discs is Kummer-étale
but its underlying map of diamonds is not étale at T = 0.

  Not typed: needs the Kummer map of log discs and étaleness of maps of diamonds. -/

end QProKummerEtale

/-! ## Node `PR.8/kummer-tower-covers` (theorem): Kummer towers and the comparison of sites -/

/-! ### Node `PR.8/kummer-tower-covers` (theorem): Kummer towers and the comparison of sites

Statement: For the power-tower assertions (1)–(2), let P be an fs monoid with torsion-free group
completion (in particular, a sharp fs monoid), P^{1/n} the monoid P with structure map a ↦ a^n, and
P_{Q≥0} := colim_n P^{1/n}. (1) For n ≥ 1 and a saturated Q with P ⊂ Q ⊂ P^{1/n}, (Spd(Q_p⟨Q⟩,
Z_p⟨Q⟩), Q) → (Spd(Q_p⟨P⟩, Z_p⟨P⟩), P) is surjective finite Kummer-étale. (2) (Spd(Q_p⟨P_{Q≥0}⟩,
Z_p⟨P_{Q≥0}⟩), P_{Q≥0}) → (Spd(Q_p⟨P⟩, Z_p⟨P⟩), P) is surjective quasi-pro-Kummer-étale. (3) For any
fs chart P and a Huber pair (R, R^+) over (Q_p, Z_p) with P → R^+, the associated log diamond gives
a morphism of sites (Spd(R, R^+), P)^a_qpkét → (Spec R, P)^a_két; separately, for any divisible
saturated chart P, (Spd(R, R^+), P)^a_qpkét ≅ Spd(R, R^+)_qproét and there is a morphism of sites to
(Spec R)_ét. (4) For P fs and P_∞ divisible saturated over P, base change gives (Spec S)_ét → (Spec
R, P)_két for the saturated base change (S, P_∞).

Not typed: assertions (1)–(2) concern the specific log diamonds `(Spd(ℚ_p⟨Q⟩, ℤ_p⟨Q⟩), Q)` and the
condition `IsQPKet` (not typed), and (3)–(4) are morphisms of sites to Kummer étale sites of `Spec
R` with charts, which need the log scheme of a chart (CR.5). -/

/-! ## Node `PR.8/kummer-etale-vs-qpket` (theorem): Kummer-étale cohomology of log schemes via log diamonds -/

/-- **Node `PR.8/kummer-etale-vs-qpket`** (theorem): Kummer-étale cohomology of log schemes via log
diamonds.

Let Λ be a torsion abelian group, R a p-complete ring with bounded p^∞-torsion, (R[1/p], R^+) the
associated Huber pair and P → R a map from an fs monoid. The comparison map is an isomorphism
RΓ_két((Spec R[1/p], P)^a, Λ) ≅ RΓ_qpkét((Spd(R[1/p], R^+), P)^a, Λ). Consequently, for a perfect
prism (A, (d)), R p-complete over A/I with bounded p^∞-torsion and P → R fs, RΓ_qpkét((Spd(R[1/p],
R^+), P)^a, Z/p^n) ≅ (Δ_{(R,P)/A}[1/d]/p^n)^{φ=1} functorially (and for saturated P after defining
the left side as a filtered colimit of fs cases).

Hypotheses (packet): Λ torsion; R p-complete with bounded p^∞-torsion; P fs (saturated via colimit).

Lean form of the first isomorphism for torsion coefficient rings; the consequence for perfect prisms
is `affineComparison` combined with it. -/
theorem kummerEtale_vs_qpket {p : ℕ} [Fact p.Prime] (X : FsPrelogRing.{u} p) (Λ : Type)
    [CommRing Λ] (htors : ∃ n : ℕ, 1 ≤ n ∧ (n : Λ) = 0) :
    Nonempty (KummerEtale.cohomology X.genericLogScheme Λ ≅
      QProKummerEtale.cohomology (LogDiamond.ofHuberPair X.huberPair) Λ) := by
  sorry

/-! ## Node `PR.8/global-etale-comparison` (theorem): The Kummer-étale comparison -/

namespace QProKummerEtale

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u} [CommMonoid M]

/-- The log diamond generic fibre `(X, M_X)^♦_η` of a smooth log formal scheme (CR.5/D6). -/
noncomputable def genericFibreOf {P : IntegralBoundedPrelogPrism p A M}
    (X : SmoothLogFormalScheme P) : LogDiamond.{u} p := sorry

/-- Placeholder (node `PR.8/global-etale-comparison`): `(RΓ_Δ((X, M_X)/(A, M_A))[1/d]/p^m)^{φ=1}`. -/
noncomputable def phiFixedGlobal (P : IntegralBoundedPrelogPrism p A M) (d : A)
    (X : SmoothLogFormalScheme P) (m : ℕ) : DerivedCategory (ModuleCat.{u} (ZMod (p ^ m))) :=
  sorry

/-- **Node `PR.8/global-etale-comparison`** (theorem): The Kummer-étale comparison.

Let (A, I = (d), M_0) be a bounded pre-log prism with (A, I) perfect and M_0 an fs monoid; (X_0,
M_{X_0}) a smooth fs log p-adic formal scheme over (A/I, M_0) with X_0 qcqs and mod p fibre of (X_0,
M_{X_0}) → (Spf A/I, M_0)^a of Cartier type (equivalently, saturated in Tsuji's sense); (A, I, M_A)
a saturated pre-log prism whose associated log prism is perfect, with (A, M_0) → (A, Γ(Spf A, M_{Spf
A})); and (X, M_X) the base change of (X_0, M_{X_0}) to (A/I, M_A) (also (X_i, M_{X_i}) to fs
submonoids M_i ⊂ M_A containing the image of M_0; underlying formal schemes unchanged). Define
RΓ_qpkét((X, M_X)^♦_η, Z/p^m) := colim_i RΓ((X_i, M_{X_i})^♦_{η,qpkét}, Z/p^m). Then there are
functorial isomorphisms RΓ_qpkét((X, M_X)^♦_η, Z/p^m) ≅ (RΓ_Δ((X, M_X)/(A, M_A))[1/d]/p^m)^{φ=1} ≅
(RΓ_Δ((X_0, M_{X_0})/(A, M_0))[1/d]/p^m)^{φ=1}. If moreover A/I = O_C (C algebraically closed, A =
A_inf) and X is proper, RΓ_qpkét((X, M_X)^♦_η, Z_p) := lim_m RΓ_qpkét(−, Z/p^m) is a perfect
Z_p-complex with RΓ_qpkét ⊗^L_{Z_p} W(C♭) ≅ RΓ_Δ((X, M_X)/(A, M_A)) ⊗^L_{A_inf} W(C♭), and similarly
mod p^m. Kummer-étale cohomology is not replaced by étale cohomology of the generic fibre unless the
log structure is trivial there.

Hypotheses (packet): Exactly the setup of KY §7.4 (perfect log prism, fs M_0, Cartier-type mod p
fibre, qcqs X_0); properness and A/I = O_C for the second part.

Lean form of the first isomorphism in the case `M_0 = M_A = {e}`: the base is a perfect prism `(A,
(d))` with the trivial log structure (a perfect log prism, `LogPrism.trivial_isPerfect_iff`) and `X`
of Cartier type; the colimit over fs submonoids is then trivial. The general saturated perfect log
prism base, the second isomorphism and the `A_inf` statements are not typed. -/
theorem globalComparison (P : IntegralBoundedPrelogPrism p A PUnit.{u + 1})
    (hperf : P.toPrism.IsPerfect) (d : A) (hd : P.toPrism.I = Ideal.span {d})
    (X : CartierTypeLogFormalScheme P) (m : ℕ) :
    Nonempty (cohomology (genericFibreOf X.toSmooth) (ZMod (p ^ m)) ≅
      phiFixedGlobal P d X.toSmooth m) := by
  sorry

end QProKummerEtale

/-! ## Node `PR.8/kummer-local-systems` (definition): Kummer-étale local systems -/

/-- **Node `PR.8/kummer-local-systems`** (definition): Kummer-étale local systems.

Let (X, M_X) be an fs log diamond and pr: (X, M_X)_qpkét → X_qproét → ∗_proét. For a condensed ring
Λ (here Z/p^n discrete or Z_p profinite), a sheaf of pr^{-1}Λ-modules F on (X, M_X)_qpkét is
constant if F ≅ pr^{-1}Λ^r, and locally constant (a Λ-local system) if it is constant
quasi-pro-Kummer-étale locally. Loc_Λ(X, M_X) is the category of Λ-local systems; D^(b)((X,
M_X)^♦_η, Z_p) denotes the corresponding category of complexes locally constant with perfect fibres
(hypercomplete when X^♦_η is quasicompact).

Hypotheses (packet): Condensed coefficient rings Z/p^n and Z_p; following Mann–Werner §3.

API `KummerLocalSystem` (constructor; node `PR.8/kummer-local-systems`): Loc_Λ(X, M_X): locally
constant sheaves of pr^{-1}Λ-modules on (X, M_X)_qpkét.

Placeholder carrier (node `PR.8/kummer-local-systems`, with C0's coefficient interfaces): the
category `Loc_Λ(Y, M_Y)`; `Λ` is a coefficient ring such as `ℤ/p^n` or `ℤ_p` (condensed structure
not recorded). -/
def KummerLocalSystem {p : ℕ} [Fact p.Prime] (Y : LogDiamond.{u} p) (Λ : Type) [CommRing Λ] :
    Type (u + 1) := sorry

namespace KummerLocalSystem

variable {p : ℕ} [Fact p.Prime]

noncomputable instance (Y : LogDiamond.{u} p) (Λ : Type) [CommRing Λ] :
    Category.{u} (KummerLocalSystem Y Λ) := sorry

/-- API `KummerLocalSystem.constant` (constructor; node `PR.8/kummer-local-systems`): The constant
local system pr^{-1}Λ^r. -/
noncomputable def constant (Y : LogDiamond.{u} p) (Λ : Type) [CommRing Λ] (r : ℕ) :
    KummerLocalSystem Y Λ := sorry

/-- API `KummerLocalSystem.pullback` (functoriality; node `PR.8/kummer-local-systems`): Pullback
along maps of fs log diamonds. -/
noncomputable def pullback {Y' Y : LogDiamond.{u} p} (f : Y' ⟶ Y) (Λ : Type) [CommRing Λ] :
    KummerLocalSystem Y Λ ⥤ KummerLocalSystem Y' Λ := sorry

/-- API `KummerLocalSystem.tensor` (structure; node `PR.8/kummer-local-systems`): Tensor products
and duals of local systems.

Lean form: the tensor product as a monoidal structure; duals are not typed. -/
noncomputable instance tensor (Y : LogDiamond.{u} p) (Λ : Type) [CommRing Λ] :
    MonoidalCategory (KummerLocalSystem Y Λ) := sorry

/-- Placeholder (owner `DiamondEtaleCohomology:C0`, Mann–Werner): quasi-pro-étale `Λ`-local
systems on a diamond. -/
def _root_.TauCeti.LogPrismatic.Diamond.LocalSystem (Y : Diamond.{u} p) (Λ : Type) [CommRing Λ] :
    Type (u + 1) := sorry

noncomputable instance (Y : Diamond.{u} p) (Λ : Type) [CommRing Λ] :
    Category.{u} (Y.LocalSystem Λ) := sorry

/-- API `KummerLocalSystem.trivialLog` (compatibility; node `PR.8/kummer-local-systems`): For
trivial log structure, Loc_{Z_p} agrees with quasi-pro-étale Z_p-local systems (Mann–Werner). -/
noncomputable def trivialLog (Y : Diamond.{u} p) :
    KummerLocalSystem (LogDiamond.trivialOf Y) ℤ_[p] ≌ Y.LocalSystem ℤ_[p] := sorry

/-- Placeholder: the rank of a local system (locally constant fibre rank). -/
noncomputable def rank {Y : LogDiamond.{u} p} {Λ : Type} [CommRing Λ]
    (F : KummerLocalSystem Y Λ) : ℕ := sorry

/-- Unit test `KummerLocalSystem.constant_rank` (computation; node `PR.8/kummer-local-systems`):
pr^{-1}Z_p^r is a Z_p-local system of rank r. -/
theorem constant_rank (Y : LogDiamond.{u} p) (r : ℕ) : rank (constant Y ℤ_[p] r) = r := by
  sorry

/-- Unit test `KummerLocalSystem.zero` (degenerate; node `PR.8/kummer-local-systems`): The zero
sheaf is the local system of rank 0. -/
theorem zero (Y : LogDiamond.{u} p) (Λ : Type) [CommRing Λ] :
    Limits.IsZero (constant Y Λ 0) ∧ rank (constant Y Λ 0) = 0 := by
  sorry

/-! * Unit test `KummerLocalSystem.kummer_torsor` (non-example; node `PR.8/kummer-local-systems`):
Over an algebraically closed complete C and for n > 1, let π be the finite Kummer-étale n-th-root
cover of the log disc. The linear local system π_*Z_p has rank n and nontrivial permutation inertia
at T = 0, so it does not descend to a local system on the underlying diamond near T = 0. The root
torsor itself is a torsor under Z_p(1) in the inverse p-power tower, not a rank-one Z_p-module local
system.

  Not typed: needs the root cover of the log disc and pushforward of local systems along it. -/

/-- Unit test `KummerLocalSystem.trivialLog_eq` (compatibility; node `PR.8/kummer-local-systems`):
With trivial log structure these are the quasi-pro-étale Z_p-local systems of Mann–Werner.

Lean form: the same identification as API `KummerLocalSystem.trivialLog`, as a statement. -/
theorem trivialLog_eq (Y : Diamond.{u} p) :
    Nonempty (KummerLocalSystem (LogDiamond.trivialOf Y) ℤ_[p] ≌ Y.LocalSystem ℤ_[p]) := by
  sorry

end KummerLocalSystem

/-! ## Node `PR.8/laurent-f-crystal` (definition): Laurent F-crystals on the absolute saturated log prismatic site -/

/-- **Node `PR.8/laurent-f-crystal`** (definition): Laurent F-crystals on the absolute saturated log
prismatic site.

Let (X, M_X) be a bounded fs log p-adic formal scheme and (X, M_X)_Δ its absolute saturated log
prismatic site. A Laurent F-crystal is a crystal of vector bundles E over (O_Δ[1/I])^∧_p on (X,
M_X)_Δ (a compatible family of finite projective A[1/I]^∧_p-modules on objects (A, I, M_A)^a with
isomorphisms along maps) together with an isomorphism φ_E: φ^*E ≅ E. Vect((X, M_X)_Δ,
O_Δ[1/I]^∧_p)^{φ=1} is the category of Laurent F-crystals; D_perf((X, M_X)_Δ, O_Δ[1/I]^∧_p)^{φ=1}
the analogous category of perfect complexes.

Hypotheses (packet): Bounded fs log p-adic formal schemes; absolute saturated site with the strict
flat topology.

API `LaurentFCrystal` (constructor; node `PR.8/laurent-f-crystal`): The category Vect((X, M_X)_Δ,
O_Δ[1/I]^∧_p)^{φ=1}.

Placeholder carrier (node `PR.8/laurent-f-crystal`): the category `Vect((X, M_X)_Δ,
O_Δ[1/I]^∧_p)^{φ=1}` on the absolute saturated log prismatic site. -/
def LaurentFCrystal {p : ℕ} [Fact p.Prime] (X : FsLogFormalScheme.{u} p) : Type (u + 1) := sorry

namespace LaurentFCrystal

variable {p : ℕ} [Fact p.Prime]

noncomputable instance (X : FsLogFormalScheme.{u} p) : Category.{u} (LaurentFCrystal X) := sorry

/-- API `LaurentFCrystal.unit` (example; node `PR.8/laurent-f-crystal`): The unit object
O_Δ[1/I]^∧_p with its Frobenius. -/
noncomputable def unit (X : FsLogFormalScheme.{u} p) : LaurentFCrystal X := sorry

/-- API `LaurentFCrystal.tensor` (structure; node `PR.8/laurent-f-crystal`): Tensor products and
duals.

Lean form: the tensor product as a monoidal structure (with unit `LaurentFCrystal.unit`); duals are
not typed. -/
noncomputable instance tensor (X : FsLogFormalScheme.{u} p) : MonoidalCategory (LaurentFCrystal X) :=
  sorry

/-- API `LaurentFCrystal.pullback` (functoriality; node `PR.8/laurent-f-crystal`): Pullback along
maps of bounded fs log p-adic formal schemes. -/
noncomputable def pullback {X Y : FsLogFormalScheme.{u} p} (f : X ⟶ Y) :
    LaurentFCrystal Y ⥤ LaurentFCrystal X := sorry

/-! * API `LaurentFCrystal.descent` (characterisation; node `PR.8/laurent-f-crystal`): Vect(…)^{φ=1}
≃ lim_{(A,I,M_A)} Vect(A[1/I]^∧_p)^{φ_A=1} over the absolute saturated site (Drinfeld–Mathew).

  Not typed: the limit over objects of the absolute saturated site of categories of Frobenius
modules over `A[1/I]^∧_p` is not set up. -/

/-- API `LaurentFCrystal.etaleRealisation` (projection; node `PR.8/laurent-f-crystal`): The étale
realisation F ↦ F_ét to Loc_{Z_p}((X, M_X)^♦_η) (from Theorem 7.36). -/
noncomputable def etaleRealisation (X : FsLogFormalScheme.{u} p) :
    LaurentFCrystal X ⥤ KummerLocalSystem (LogDiamond.genericFibre.obj X) ℤ_[p] := sorry

/-- Unit test `LaurentFCrystal.unit_realisation` (computation; node `PR.8/laurent-f-crystal`): The
étale realisation of the unit O_Δ[1/I]^∧_p is the constant local system Z_p. -/
theorem unit_realisation (X : FsLogFormalScheme.{u} p) :
    Nonempty ((etaleRealisation X).obj (unit X) ≅
      KummerLocalSystem.constant (LogDiamond.genericFibre.obj X) ℤ_[p] 1) := by
  sorry

/-! * Unit test `LaurentFCrystal.trivialLog` (compatibility; node `PR.8/laurent-f-crystal`): For
trivial log structure the category agrees with PR.7's Laurent F-crystals (BS F-crystals Definition
3.2).

  Not typed: PR.7's Laurent F-crystals are outside the PR.0 excerpt. -/

/-- Unit test `LaurentFCrystal.zero` (degenerate; node `PR.8/laurent-f-crystal`): The zero crystal
is a Laurent F-crystal of rank 0.

Lean form: there is a zero Laurent F-crystal, and its étale realisation is the zero local system
(ranks of crystals are not recorded). -/
theorem zero (X : FsLogFormalScheme.{u} p) :
    ∃ Z : LaurentFCrystal X, Limits.IsZero Z ∧ Limits.IsZero ((etaleRealisation X).obj Z) := by
  sorry

/-! * Unit test `LaurentFCrystal.not_F_crystal` (non-example; node `PR.8/laurent-f-crystal`): A
vector-bundle crystal E over O_Δ (not O_Δ[1/I]) with φ^*E[1/I] ≅ E[1/I] is a prismatic F-crystal,
not a Laurent F-crystal: inverting I is part of the definition.

  Not typed: prismatic F-crystals over `O_Δ` (PR.7) are outside the PR.0 excerpt. -/

end LaurentFCrystal

/-! ## Node `PR.8/laurent-f-crystals-local-systems` (theorem): Laurent F-crystals and Kummer-étale local systems -/

/-- **Node `PR.8/laurent-f-crystals-local-systems`** (theorem): Laurent F-crystals and Kummer-étale
local systems.

Let (X, M_X) be a bounded fs log p-adic formal scheme with log diamond generic fibre (X, M_X)^♦_η.
There is a natural equivalence Vect((X, M_X)_Δ, O_Δ[1/I]^∧_p)^{φ=1} ≃ Loc_{Z_p}((X, M_X)^♦_η), and
more generally D_perf((X, M_X)_Δ, O_Δ[1/I]^∧_p)^{φ=1} ≃ D^(b)((X, M_X)^♦_η, Z_p); the unit O_Δ
corresponds to the constant sheaf Z_p.

Hypotheses (packet): Bounded fs log p-adic formal schemes; quasi-pro-Kummer-étale topology on the
generic fibre.

Lean form of the first equivalence; the perfect-complex version and the identification of the unit
are not typed (the latter is `LaurentFCrystal.unit_realisation`). The review flags a 2026
corrigendum to KY Theorems 7.35–7.36. -/
theorem LaurentFCrystal.etaleRealisation_isEquivalence {p : ℕ} [Fact p.Prime]
    (X : FsLogFormalScheme.{u} p) : (LaurentFCrystal.etaleRealisation X).IsEquivalence := by
  sorry

/-! ## Node `PR.8/smooth-proper-pushforward` (theorem): Smooth proper pushforward of Kummer-étale local systems -/

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`): smooth (Koshikawa) proper
maps of bounded fs log `p`-adic formal schemes. -/
def SmoothProperMap {p : ℕ} [Fact p.Prime] (X Y : FsLogFormalScheme.{u} p) : Type u := sorry

/-- Placeholder (owner `DiamondEtaleCohomology:C0`): `D^(b)((Y, M_Y)^♦_η, ℤ_p)`, complexes on the
quasi-pro-Kummer-étale site that are locally constant with perfect fibres. -/
def KummerDerived {p : ℕ} [Fact p.Prime] (Y : LogDiamond.{u} p) : Type (u + 1) := sorry

noncomputable instance {p : ℕ} [Fact p.Prime] (Y : LogDiamond.{u} p) :
    Category.{u} (KummerDerived Y) := sorry

/-- Placeholder (node `PR.8/laurent-f-crystal`): `D_perf((Y, M_Y)_Δ, O_Δ[1/I]^∧_p)^{φ=1}`. -/
def LaurentFCrystal.Perfect {p : ℕ} [Fact p.Prime] (Y : FsLogFormalScheme.{u} p) :
    Type (u + 1) := sorry

noncomputable instance {p : ℕ} [Fact p.Prime] (Y : FsLogFormalScheme.{u} p) :
    Category.{u} (LaurentFCrystal.Perfect Y) := sorry

/-- The étale realisation of perfect Laurent F-crystals (node
`PR.8/laurent-f-crystals-local-systems`). -/
noncomputable def LaurentFCrystal.Perfect.etaleRealisation {p : ℕ} [Fact p.Prime]
    (Y : FsLogFormalScheme.{u} p) :
    LaurentFCrystal.Perfect Y ⥤ KummerDerived (LogDiamond.genericFibre.obj Y) := sorry

/-- Placeholder (node `PR.8/smooth-proper-pushforward`): `(Rf_* O_Δ)[1/I]^∧_p` as a perfect
Laurent F-crystal on `(Y, M_Y)_Δ`. -/
noncomputable def SmoothProperMap.crystalPushforward {p : ℕ} [Fact p.Prime]
    {X Y : FsLogFormalScheme.{u} p} (f : SmoothProperMap X Y) : LaurentFCrystal.Perfect Y := sorry

/-- Placeholder (owner `DiamondEtaleCohomology:C0`): `Rf_{η*} ℤ_p` for the generic fibre. -/
noncomputable def SmoothProperMap.etalePushforward {p : ℕ} [Fact p.Prime]
    {X Y : FsLogFormalScheme.{u} p} (f : SmoothProperMap X Y) :
    KummerDerived (LogDiamond.genericFibre.obj Y) := sorry

/-- **Node `PR.8/smooth-proper-pushforward`** (theorem): Smooth proper pushforward of Kummer-étale
local systems.

Let f: (X, M_X) → (Y, M_Y) be a smooth (Koshikawa's sense) proper map of bounded fs log p-adic
formal schemes. Then Rf_*O_Δ is an F-crystal of perfect complexes on (Y, M_Y)_Δ and there is a
natural isomorphism (Rf_*O_Δ)_ét ≅ Rf_{η*}Z_p for f_η: (X, M_X)^♦_η → (Y, M_Y)^♦_η; in particular
Rf_{η*}Z_p is locally constant with perfect fibres and commutes with base change (Z, M_Z) → (Y,
M_Y).

Hypotheses (packet): f smooth and proper; bounded fs.

Lean form: `(Rf_* O_Δ)_ét ≅ Rf_{η*} ℤ_p` (after inverting `I` and completing, through the
perfect-complex realisation); that `Rf_* O_Δ` is an F-crystal of perfect complexes is built into
`crystalPushforward`, and base change is not typed. The review flags the corrigendum to KY Theorems
7.35–7.36 on which the proof rests. -/
theorem SmoothProperMap.pushforward_comparison {p : ℕ} [Fact p.Prime]
    {X Y : FsLogFormalScheme.{u} p} (f : SmoothProperMap X Y) :
    Nonempty ((LaurentFCrystal.Perfect.etaleRealisation Y).obj f.crystalPushforward ≅
      f.etalePushforward) := by
  sorry

/-! ## Node `PR.8/etale-comparison-over-ainf` (theorem): Étale comparison over A_inf[1/φ^{-1}(μ)] -/

/-- Placeholder carrier (owner `AInfCohomology:AI.0`): complete algebraically closed
nonarchimedean fields `C` of residue characteristic `p`. -/
def CompleteAlgClosedField (p : ℕ) [Fact p.Prime] : Type (u + 1) := sorry

namespace CompleteAlgClosedField

variable {p : ℕ} [Fact p.Prime]

/-- Placeholder (owner AI.0): `A_inf = W(O_C♭)`. -/
def Ainf (C : CompleteAlgClosedField.{u} p) : Type u := sorry

noncomputable instance (C : CompleteAlgClosedField.{u} p) : CommRing C.Ainf := sorry

noncomputable instance (C : CompleteAlgClosedField.{u} p) : Algebra ℤ_[p] C.Ainf := sorry

/-- The perfect prism `(A_inf, (ξ))` with the trivial log structure, as a base (AI.0). -/
noncomputable def ainfBase (C : CompleteAlgClosedField.{u} p) :
    IntegralBoundedPrelogPrism p C.Ainf PUnit.{u + 1} := sorry

theorem ainfBase_isPerfect (C : CompleteAlgClosedField.{u} p) : C.ainfBase.toPrism.IsPerfect := by
  sorry

/-- `φ⁻¹(μ) = [ε^{1/p}] − 1 ∈ A_inf`. -/
noncomputable def phiInvMu (C : CompleteAlgClosedField.{u} p) : C.Ainf := sorry

/-- Placeholder (owner AI.0): `A_crys` with its map from `A_inf`. -/
def Acrys (C : CompleteAlgClosedField.{u} p) : Type u := sorry

noncomputable instance (C : CompleteAlgClosedField.{u} p) : CommRing C.Acrys := sorry

/-- The map `A_inf → A_crys`. -/
noncomputable def toAcrys (C : CompleteAlgClosedField.{u} p) : C.Ainf →+* C.Acrys := sorry

end CompleteAlgClosedField

/-- Placeholder carrier (owner `CrystallineCohomology:CR.5:log-algebra`): proper smooth log formal
schemes over the base with mod `p` fibre of Cartier type. -/
def ProperCartierType {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A] {M : Type u}
    [CommMonoid M] (P : IntegralBoundedPrelogPrism p A M) : Type (u + 1) := sorry

/-- The underlying Cartier-type scheme. -/
noncomputable def ProperCartierType.toCartier {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]
    {M : Type u} [CommMonoid M] {P : IntegralBoundedPrelogPrism p A M}
    (X : ProperCartierType P) : CartierTypeLogFormalScheme P := sorry

/-- **Node `PR.8/etale-comparison-over-ainf`** (theorem): Étale comparison over A_inf[1/φ^{-1}(μ)].

Let C be algebraically closed with A_inf = W(O_C♭), ξ = μ/φ^{-1}(μ), μ = [ε] − 1; (X_0, M_{X_0}) an
fs log p-adic formal scheme smooth and proper over (Spf O_C, M_0)^a with mod p fibre of Cartier
type, base changed to (X, M_X) over a perfect log prism (A_inf, (ξ), M_A) receiving M_0; M :=
RΓ_Δ((X_0, M_{X_0})/(A_inf, M_0)) ≅ RΓ_Δ((X, M_X)/(A_inf, M_A)), H^i_Δ := H^i(M), T := RΓ_qpkét((X,
M_X)^♦_η, Z_p). Then for every i, H^i_Δ ⊗_{A_inf} A_inf[1/φ^{-1}(μ)] ≅ H^i_qpkét((X, M_X)^♦_η, Z_p)
⊗_{Z_p} A_inf[1/φ^{-1}(μ)].

Hypotheses (packet): As in KY §8 setup; C algebraically closed; properness; Cartier type.

Lean form: over `A_inf(O_C)` with the trivial log structure on the base (`M_0 = M_A = {e}`), an
isomorphism of `A_inf[1/φ⁻¹(μ)]`-modules `H^i_Δ ⊗ A_inf[1/φ⁻¹(μ)] ≅ H^i_qpkét ⊗_{ℤ_p}
A_inf[1/φ⁻¹(μ)]`; general perfect log prism bases are not typed. -/
theorem etaleComparisonAinf {p : ℕ} [Fact p.Prime] (C : CompleteAlgClosedField.{u} p)
    (X : ProperCartierType C.ainfBase) (i : ℕ) :
    Nonempty (TensorProduct C.Ainf (Localization.Away C.phiInvMu)
        ((DerivedCategory.homologyFunctor (ModuleCat.{u} C.Ainf) i).obj
          (LogPrismaticSite.cohomology C.ainfBase X.toCartier.toSmooth)).carrier
          ≃ₗ[Localization.Away C.phiInvMu]
      TensorProduct ℤ_[p] (Localization.Away C.phiInvMu)
        ((DerivedCategory.homologyFunctor (ModuleCat.{u} ℤ_[p]) i).obj
          (QProKummerEtale.cohomology (QProKummerEtale.genericFibreOf X.toCartier.toSmooth)
            ℤ_[p])).carrier) := by
  sorry

/-! ## Node `PR.8/log-hyodo-kato-isomorphism` (theorem): Hyodo–Kato isomorphism for log prismatic cohomology over A_crys -/

/-- Placeholder (owner `CrystallineCohomology:CR.6`): `RΓ_crys((X_0, M_{X_0})_{O_C/p}/(A_crys, M_crys))`. -/
noncomputable def crysOverAcrys {p : ℕ} [Fact p.Prime] {C : CompleteAlgClosedField.{u} p}
    (X : ProperCartierType C.ainfBase) : DerivedCategory (ModuleCat.{u} C.Acrys) := sorry

/-- **Node `PR.8/log-hyodo-kato-isomorphism`** (theorem): Hyodo–Kato isomorphism for log prismatic
cohomology over A_crys.

In the setting of the étale comparison over A_inf, let (A_crys, (p), M_crys) be the log prism
associated with M_0 → A_inf → A_crys and (X_0, M_{X_0})_{O_C/p} the base change along Spec(O_C/p,
M_crys)^a → Spf(O_C, M_0)^a. (1) φ^*RΓ_Δ((X_0, M_{X_0})/(A_inf, M_0)) ⊗^L_{A_inf} A_crys ≅
RΓ_crys((X_0, M_{X_0})_{O_C/p}/(A_crys, M_crys)) Frobenius-equivariantly, and Frobenius is an
isomorphism after inverting p. (2) Let k = O_C/m, (k, N) the log ring associated with (k, M_0) and
(Y, M_Y) the base change of (X_0, M_{X_0}) to (k, N). For a section k → O_C/p, RΓ_crys((Y,
M_Y)/(W(k), N)) ⊗^L_{W(k)} A_crys[1/p] ≅ RΓ_crys((X_0, M_{X_0})_{O_C/p}/(A_crys, M_crys))[1/p];
hence each H^i(M ⊗^L_{A_inf,φ} A_crys[1/p]) is a finite free A_crys[1/p]-module.

Hypotheses (packet): As in KY §8; section k → O_C/p fixed.

Lean form of (1) without Frobenius, over `A_inf(O_C)` with trivial base log structure: `φ^* RΓ_Δ
⊗^L_{A_inf} A_crys ≅ RΓ_crys(…/(A_crys, M_crys))`; Frobenius-equivariance and (2) are not typed. -/
theorem hyodoKato {p : ℕ} [Fact p.Prime] (C : CompleteAlgClosedField.{u} p)
    (X : ProperCartierType C.ainfBase) :
    Nonempty ((derivedExtendScalars (C.toAcrys.comp C.ainfBase.toPrism.φ)).obj
        (LogPrismaticSite.cohomology C.ainfBase X.toCartier.toSmooth) ≅ crysOverAcrys X) := by
  sorry

/-! ## Node `PR.8/log-prismatic-bkf-module` (theorem): Log prismatic cohomology groups are Breuil–Kisin–Fargues modules -/

/-- Placeholder carrier (owner `AInfCohomology:AI.2`): Breuil–Kisin–Fargues modules over `A_inf`
(finitely presented, free after inverting `p`, with `φ_N : N[1/ξ] ≅ N[1/φ(ξ)]`). -/
def BKFModule {p : ℕ} [Fact p.Prime] (C : CompleteAlgClosedField.{u} p) : Type (u + 1) := sorry

/-- The underlying `A_inf`-module. -/
noncomputable def BKFModule.toModuleCat {p : ℕ} [Fact p.Prime] {C : CompleteAlgClosedField.{u} p}
    (N : BKFModule C) : ModuleCat.{u} C.Ainf := sorry

/-- **Node `PR.8/log-prismatic-bkf-module`** (theorem): Log prismatic cohomology groups are
Breuil–Kisin–Fargues modules.

In the setting of the étale comparison over A_inf (X proper over O_C, mod p fibre of Cartier type,
perfect log prism base over A_inf), for every i the Frobenius-twisted cohomology φ^*H^i_Δ = H^i_Δ
⊗_{A_inf,φ} A_inf with its Frobenius is a Breuil–Kisin–Fargues module: a finitely presented
A_inf-module N, free after inverting p, with a φ-linear φ_N inducing N[1/ξ] ≅ N[1/φ(ξ)]. Moreover
H^i_Δ ⊗ A_inf[1/φ^{-1}(μ)] ≅ H^i_qpkét((X, M_X)^♦_η, Z_p) ⊗ A_inf[1/φ^{-1}(μ)].

Hypotheses (packet): As in KY §8: X proper; Cartier type; C algebraically closed.

Lean form: `φ^* H^i_Δ = H^i_Δ ⊗_{A_inf, φ} A_inf` (Mathlib `ModuleCat.extendScalars`) underlies a
Breuil–Kisin–Fargues module (trivial base log structure); the étale comparison part is node
`PR.8/etale-comparison-over-ainf`. -/
theorem bkfModule {p : ℕ} [Fact p.Prime] (C : CompleteAlgClosedField.{u} p)
    (X : ProperCartierType C.ainfBase) (i : ℕ) :
    ∃ N : BKFModule C, Nonempty (N.toModuleCat ≅ (ModuleCat.extendScalars C.ainfBase.toPrism.φ).obj
      ((DerivedCategory.homologyFunctor _ i).obj
        (LogPrismaticSite.cohomology C.ainfBase X.toCartier.toSmooth))) := by
  sorry

/-! ## Node `PR.8/semistable-chart-application` (application): Log prismatic cohomology of the standard semistable chart -/

namespace PrelogAlgebra

variable {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]

/-- The standard semistable chart `R = O_K⟨x_1, …, x_d⟩/(x_1⋯x_r − π)` with `P = ℕ^r`,
`e_j ↦ x_j`, over a base with monoid `ℕ`, `1 ↦ π`, via the diagonal `ℕ → ℕ^r` (recorded opaquely;
`O_K = A / I` and `π` the image of the generator). -/
noncomputable def semistableChart (P : IntegralBoundedPrelogPrism p A (Multiplicative (ULift.{u} ℕ)))
    (d r : ℕ) : PrelogAlgebra P := sorry

end PrelogAlgebra

/-- **Node `PR.8/semistable-chart-application`** (application): Log prismatic cohomology of the
standard semistable chart.

Let O_K be totally ramified over W(k) with uniformiser π and R = O_K⟨x_1, …, x_d⟩/(x_1⋯x_r − π) (1 ≤
r ≤ d) with the canonical log structure given by the chart P = N^r → R, e_j ↦ x_j (j ≤ r), over
(O_K, N → O_K, 1 ↦ π) via the diagonal 1 ↦ e_1 + ⋯ + e_r (the standard semistable chart of CR.5,
with its actual monoid map recording π). Then: (1) (Spf R, P)^a is smooth of Cartier type over (O_K,
N) in Koshikawa's sense, hence over the Breuil–Kisin prelog prism (W(k)[[u]], (E), N → u) via O_K =
W(k)[[u]]/(E); (2) H^i(Δ̄_{(R,P)/(W(k)[[u]],N)}){i} ≅ Ω^i_{(R,P)/(O_K,N)}, a free R-module of rank
(d − 1 choose i) with basis the wedge products of dlog x_2, …, dlog x_r, dx_{r+1}, …, dx_d (dlog x_1
= −Σ_{j=2}^r dlog x_j); (3) the crystalline comparison over (W(k), (p), N → 0), after u ↦ 0,
computes the Hyodo–Kato log crystalline cohomology of the special fibre (Spec k[x_1, …,
x_d]/(x_1⋯x_r), N^r)^a; (4) the de Rham comparison gives Ω^•_{(R,P)/(O_K,N)}; (5) base change along
u ↦ [π♭] gives the A_inf log prismatic cohomology of R_{O_C}, whose Frobenius twist is ČK's AΩ
(semistable-aomega-comparison, on the overlap with AI.6); (6) the Kummer-étale comparison over a
perfect log prism computes the Kummer-étale cohomology of the generic fibre, which is étale
cohomology because x_1, …, x_r are units on R[1/p], so the log structure is trivial there.

Hypotheses (packet): 1 ≤ r ≤ d; k perfect; the free coordinates x_{r+1}, …, x_d carry no log
structure.

Lean form of (2), over any integral bounded base with monoid `ℕ` (the packet's base is the
Breuil–Kisin prelog prism): the twisted Hodge–Tate cohomology `H^i(Δ̄){i}` is free of rank `(d − 1
choose i)` and `η^i` is an isomorphism; (1) and (3)–(6) are not typed (they rest on the
Cartier-type, crystalline, de Rham, `A_inf` and Kummer-étale statements above). -/
theorem semistableChart_hodgeTate {p : ℕ} [Fact p.Prime] {A : Type u} [CommRing A]
    (P : IntegralBoundedPrelogPrism p A (Multiplicative (ULift.{u} ℕ))) (d r : ℕ) (hr : 1 ≤ r)
    (hrd : r ≤ d) (i : ℕ) :
    Module.Free (PrelogAlgebra.semistableChart P d r).R
        (LogPrismaticSite.twistedHomology P (PrelogAlgebra.semistableChart P d r) i) ∧
      Module.finrank (PrelogAlgebra.semistableChart P d r).R
          (LogPrismaticSite.twistedHomology P (PrelogAlgebra.semistableChart P d r) i) =
        (d - 1).choose i ∧
      IsIso (LogPrismaticSite.hodgeTateMap P (PrelogAlgebra.semistableChart P d r) i) := by
  sorry

end TauCeti.LogPrismatic

/-! ## Node index

Every node of the two packets, with the packet names of its API items and unit tests that
are typed above (as declarations, or as examples tagged with the name). Names not listed are
recorded in the documentation comments of their node's section.

* PR.0/delta-addition-correction (definition): TauCeti.Delta.addCorrection_map,
    TauCeti.Delta.addCorrection_zero, TauCeti.Delta.addCorrection_symm, correction_dyadic,
    correction_cubic, correction_zero_argument
* PR.0/correction-identity (lemma)
* PR.0/delta-frobenius-dictionary (definition): TauCeti.Delta.Structure.ext,
    TauCeti.Delta.Structure.delta_neg, TauCeti.Delta.Structure.delta_two, delta_two_forced,
    delta_zero_operation_rejected, delta_zero_ring
* PR.0/ordinary-frobenius-lift (definition): TauCeti.Delta.FrobeniusLift.ext,
    TauCeti.Delta.FrobeniusLift.mod_p, TauCeti.Delta.FrobeniusLift.congruence_iff,
    lift_on_integers, lift_in_characteristic_p, power_not_ring_map
* PR.0/associated-frobenius (construction): TauCeti.Delta.toFrobenius_apply,
    TauCeti.Delta.toFrobenius_rank_one, TauCeti.Delta.toFrobenius_map, phi_rank_one,
    phi_integer_two, phi_zero_ring
* PR.0/torsionfree-frobenius-equivalence (construction): TauCeti.Delta.frobeniusEquiv_apply,
    TauCeti.Delta.frobeniusEquiv_symm_spec, TauCeti.Delta.frobeniusEquiv_symm_toFrobenius,
    reconstruction_integer_value, reconstruction_rejects_characteristic_p,
    reconstruction_zero_ring
* PR.0/frobenius-morphism-reflection (lemma)
* PR.0/integer-delta (construction): TauCeti.Delta.intDelta_apply,
    TauCeti.Delta.intDelta_frobenius, TauCeti.Delta.intDelta_prime, integer_negative_dyadic,
    integer_cubic_value, integer_zero
* PR.0/integer-cast-delta (lemma)
* PR.0/delta-stable-quotient (theorem)
* PR.0/square-zero-correction (lemma)
* PR.0/square-zero-delta-family (construction): TauCeti.Delta.squareZeroDelta_fst,
    TauCeti.Delta.squareZeroDelta_snd, TauCeti.Delta.squareZeroDelta_frobenius,
    square_zero_parameter, square_zero_addition_correction, square_zero_base_compatibility
* PR.0/frobenius-forgetful-not-injective (theorem)
* PR.0/witt2-add-coordinate (lemma)
* PR.0/witt2-mul-coordinate (lemma)
* PR.0/delta-witt-section-equivalence (construction): TauCeti.Delta.wittSectionEquiv_apply,
    TauCeti.Delta.wittSectionEquiv_symm_apply, TauCeti.Delta.wittSectionEquiv_ghost_one,
    witt_section_recovers_delta, witt_no_section_in_characteristic_p,
    witt_sections_distinguished_despite_ghost
* PR.0/correction-map-naturality (lemma): TauCeti.Delta.addCorrection_map
* PR.0/witt2-coefficient-map (construction): TauCeti.Delta.witt2Map_coeff,
    TauCeti.Delta.witt2Map_id, TauCeti.Delta.witt2Map_comp, witt2_map_identity,
    witt2_map_torsion_coordinate, witt2_map_zero_target
* PR.0/witt2-coefficient-map-coeff (lemma): TauCeti.Delta.witt2Map_coeff
* PR.0/witt2-unit-criterion (lemma)
* PR.0/witt-section-coordinates (lemma): TauCeti.Delta.wittSectionEquiv_apply
* PR.0/delta-localization (construction): TauCeti.Delta.localize_algebraMap,
    TauCeti.Delta.localize_unique, TauCeti.Delta.localize_fraction, delta_localization_identity,
    delta_localization_zero, delta_localization_rational_value,
    delta_localization_torsion_survives
* PR.0/localized-delta-on-base (lemma): TauCeti.Delta.localize_algebraMap
* PR.0/delta-localization-unique (lemma): TauCeti.Delta.localize_unique
* PR.0/delta-localization-criterion (theorem): TauCeti.Delta.localization_criterion
* PR.0/delta-localization-universal (theorem): TauCeti.Delta.localization_universal
* PR.0/delta-localization-fraction (lemma): TauCeti.Delta.localize_fraction
* PR.0/delta-localization-phi-stable (theorem): TauCeti.Delta.localization_phi_stable
* PR.0/delta-adic-correction (lemma): TauCeti.Delta.addCorrection_mem
* PR.0/delta-adic-power-loss (lemma): TauCeti.Delta.delta_mem_pow
* PR.0/delta-adic-congruence (lemma): TauCeti.Delta.delta_congr_pow
* PR.0/delta-shifted-quotient (construction): TauCeti.Delta.shiftedQuotient,
    TauCeti.Delta.shiftedQuotient_mk, TauCeti.Delta.shiftedQuotient_transition,
    TauCeti.Delta.shiftedQuotient_zero, shifted_quotient_dyadic, shifted_quotient_not_additive,
    shifted_quotient_zero_level
* PR.0/delta-shifted-quotient-mk (lemma): TauCeti.Delta.shiftedQuotient_mk
* PR.0/delta-shifted-quotient-transition (lemma): TauCeti.Delta.shiftedQuotient_transition
* PR.0/delta-classical-completion (construction): TauCeti.Delta.completion,
    TauCeti.Delta.completion_eval, TauCeti.Delta.completion_algebraMap,
    TauCeti.Delta.completion_congr, completion_dyadic_scalar, completion_unit_ideal,
    completion_complete_base, completion_torsion_survives
* PR.0/delta-completion-coordinate (lemma): TauCeti.Delta.completion_eval
* PR.0/delta-completion-base (lemma): TauCeti.Delta.completion_algebraMap
* PR.0/delta-completion-congruence (lemma): TauCeti.Delta.completion_congr
* PR.0/delta-completion-unique-fg (theorem): TauCeti.Delta.completion_existsUnique
* PR.0/frobenius-image-unit-jacobson (lemma): TauCeti.Delta.isUnit_map_frobenius_iff
* PR.0/witt2-unit-jacobson (lemma): TauCeti.Delta.witt2_isUnit_iff_of_mem_jacobson
* PR.0/delta-localization-jacobson (construction): TauCeti.Delta.localizeJacobson,
    TauCeti.Delta.localizeJacobson_algebraMap, TauCeti.Delta.localizeJacobson_unique,
    TauCeti.Delta.localizeJacobson_eq_localize, jacobson_localization_identity,
    jacobson_localization_zero, jacobson_localization_dyadic
* PR.0/integer-frobenius-identity (lemma): TauCeti.Delta.intDelta_frobenius
* PR.0/p-local-integer-delta (construction): TauCeti.Delta.intAtPrime,
    TauCeti.Delta.intAtPrime_algebraMap, TauCeti.Delta.intAtPrime_frobenius,
    TauCeti.Delta.intAtPrime_spec, p_local_integer_prime, p_local_integer_negative_dyadic,
    p_local_integer_third, p_local_integer_zero
* PR.0/p-local-integer-delta-base (lemma): TauCeti.Delta.intAtPrime_algebraMap
* PR.0/p-local-integer-initial (theorem): TauCeti.Delta.intAtPrime_initial
* PR.0/delta-span-stability (lemma): TauCeti.Delta.span_delta_stable_iff
* PR.0/delta-ideal-closure (definition): TauCeti.Delta.idealClosure,
    TauCeti.Delta.idealClosure_eq_span, TauCeti.Delta.le_idealClosure,
    TauCeti.Delta.idealClosure_stable, TauCeti.Delta.idealClosure_le,
    TauCeti.Delta.idealClosure_idem, TauCeti.Delta.idealClosure_mono, ideal_closure_zero,
    ideal_closure_stable_fixed, ideal_closure_prime_is_top, ideal_closure_not_ordinary_span
* PR.0/delta-ideal-closure-stable (lemma): TauCeti.Delta.idealClosure_stable
* PR.0/delta-ideal-closure-minimal (lemma): TauCeti.Delta.idealClosure_le
* PR.0/delta-kernel-stability (lemma): TauCeti.Delta.ker_delta_stable
* PR.0/delta-universal-quotient (construction): TauCeti.Delta.quotientByIdealClosure,
    TauCeti.Delta.quotientByIdealClosure_mk, TauCeti.Delta.quotientByIdealClosure_unique,
    TauCeti.Delta.quotientByIdealClosure_kills, universal_quotient_zero_ideal,
    universal_quotient_prime_collapses, universal_quotient_identity_factor
* PR.0/delta-universal-quotient-projection (lemma): TauCeti.Delta.quotientByIdealClosure_mk
* PR.0/delta-universal-quotient-lift (theorem): TauCeti.Delta.quotientByIdealClosure_universal
* PR.0/free-delta-ring (construction): TauCeti.Delta.Free, TauCeti.Delta.freeDelta,
    TauCeti.Delta.freeDelta_X, TauCeti.Delta.Free.lift, TauCeti.Delta.Free.lift_isDeltaHom,
    TauCeti.Delta.Free.frobenius_faithfullyFlat, free_delta_frobenius_X, free_delta_lift_int_two,
    free_delta_empty, free_delta_not_free_ring
* PR.0/delta-ring-category (construction): TauCeti.Prismatic.IsDeltaHom,
    TauCeti.Delta.Structure.prod, TauCeti.Delta.Structure.tensorProduct, TauCeti.Delta.witt,
    TauCeti.Delta.witt_frobenius, TauCeti.Delta.wittUnit, TauCeti.Delta.wittUnit_coeff_zero,
    TauCeti.Delta.wittUnit_coeff_one, TauCeti.Delta.wittUnit_ghost, witt_unit_int_ghost,
    delta_prod_fst, witt_delta_torsionfree, witt_unit_not_teichmuller
* PR.0/animated-delta-rings (construction): TauCeti.Delta.SimplicialDeltaRing,
    TauCeti.Delta.SimplicialDeltaRing.const, TauCeti.Delta.SimplicialDeltaRing.frobenius,
    TauCeti.Delta.SimplicialDeltaRing.frobenius_app, simplicial_delta_const_obj,
    simplicial_delta_const_frobenius, simplicial_delta_face_commutes,
    simplicial_delta_frobenius_mod_p
* PR.0/delta-radical-localization (construction): TauCeti.Delta.frobeniusSaturation,
    TauCeti.Delta.frobeniusSaturation_stable, TauCeti.Delta.radicalSaturation,
    TauCeti.Delta.localizeRadical_p_mem_jacobson, TauCeti.Delta.localizeRadical,
    TauCeti.Delta.localizeRadical_unique, frobenius_saturation_phi_stable_already,
    frobenius_saturation_int, frobenius_saturation_free_strict
* PR.0/witt2-derived-pullback-square (lemma)
* PR.0/delta-etale-extension (theorem)
* PR.0/distinguished-element (definition): TauCeti.Prismatic.IsDistinguished,
    TauCeti.Prismatic.IsDistinguished.map, TauCeti.Prismatic.isDistinguished_p_int,
    TauCeti.Prismatic.IsDistinguished.p_mem_span, distinguished_p_value,
    distinguished_p_squared_fails, distinguished_zero_ring, distinguished_unit_times_p
* PR.0/distinguished-factor-rigidity (lemma)
* PR.0/local-distinguished-prism-generators (lemma)
* PR.0/p-torsion-freeness-criteria (lemma)
* PR.0/perfect-delta-rings (theorem)
* PR.0/rank-one-elements (lemma)
* PR.0/distinguished-in-perfect-delta-rings (lemma)
* PR.0/free-delta-pd-envelope (theorem)
* PR.0/pd-envelope-as-delta-envelope (theorem)
* PR.0/complete-regular-sequence (definition): TauCeti.Prismatic.IsRelativelyRegular,
    TauCeti.Prismatic.IsRelativelyRegular.nil, TauCeti.Prismatic.IsRelativelyRegular.polynomial,
    TauCeti.Prismatic.IsRelativelyRegular.baseChange, relatively_regular_variable,
    relatively_regular_empty_self, relatively_regular_p_fails,
    relatively_regular_non_flat_quotient
* PR.0/pd-envelope-complete-flatness (theorem)
* PR.0/prism (definition): TauCeti.Prismatic.Prism, TauCeti.Prismatic.Prism.φ,
    TauCeti.Prismatic.Prism.bar, TauCeti.Prismatic.Prism.p_mem_pow,
    TauCeti.Prismatic.Prism.exists_distinguished_generator_map, TauCeti.Prismatic.Prism.ext,
    prism_ideal_ne_bot, prism_p_squared_fails, prism_zero_ring, prism_ideal_p_implies_torsionfree
* PR.0/prism-category (definition): TauCeti.Prismatic.Prism.Hom, TauCeti.Prismatic.Prism.Hom.id,
    TauCeti.Prismatic.Prism.Hom.comp, TauCeti.Prismatic.Prism.IsBounded,
    TauCeti.Prismatic.Prism.IsPerfect, TauCeti.Prismatic.Prism.IsOrientable,
    TauCeti.Prismatic.Prism.IsCrystalline, TauCeti.Prismatic.Prism.IsCrystalline.isBounded,
    TauCeti.Prismatic.Prism.IsCrystalline.isOrientable, prism_hom_id_toRingHom, prism_hom_map_phi,
    prism_bounded_of_torsionfree_quotient, prism_perfect_frobenius_injective
* PR.0/crystalline-prism (construction): TauCeti.Prismatic.Prism.crystalline,
    TauCeti.Prismatic.Prism.crystalline_I, TauCeti.Prismatic.Prism.crystalline_isCrystalline,
    TauCeti.Prismatic.Prism.padicInt, TauCeti.Prismatic.Prism.witt, crystalline_prism_padic_phi,
    crystalline_prism_padic_perfect, crystalline_prism_witt_phi, crystalline_prism_bar
* PR.0/ainf-prism (construction): TauCeti.Prismatic.Prism.ainf, TauCeti.Prismatic.Prism.ainf_I,
    TauCeti.Prismatic.Prism.ainf_phi, TauCeti.Prismatic.Prism.ainf_isPerfect,
    TauCeti.Prismatic.Prism.ainf_bar_equiv, ainf_prism_theta_teichmuller, ainf_prism_kernel_not_p,
    ainf_prism_perfect_bounded
* PR.0/breuil-kisin-prism (construction): TauCeti.Prismatic.Prism.breuilKisin,
    TauCeti.Prismatic.Prism.breuilKisin_I, TauCeti.Prismatic.Prism.breuilKisin_phi_X,
    TauCeti.Prismatic.Prism.breuilKisin_isBounded, breuil_kisin_not_perfect,
    breuil_kisin_not_crystalline, breuil_kisin_linear_reduction
* PR.0/q-de-rham-prism (construction): TauCeti.Prismatic.qAnalog,
    TauCeti.Prismatic.qAnalog_mul_sub_one, TauCeti.Prismatic.qAnalog_one_eq,
    TauCeti.Prismatic.Prism.qDeRham, TauCeti.Prismatic.Prism.qDeRham_I,
    TauCeti.Prismatic.Prism.qDeRham_phi_q, q_analog_two, q_analog_prime_cyclotomic,
    q_de_rham_ideal_not_q_minus_one, q_de_rham_p_mem
* PR.0/universal-oriented-prism (construction): TauCeti.Prismatic.Prism.Oriented,
    TauCeti.Prismatic.Prism.Oriented.isDistinguished,
    TauCeti.Prismatic.Prism.Oriented.generator_mem_nonZeroDivisors,
    TauCeti.Prismatic.Prism.Oriented.isOrientable, oriented_padic,
    oriented_generator_unique_up_to_unit, oriented_not_unit
* PR.0/rigidity-prism-ideal (theorem)
* PR.0/prism-frobenius-ideal-principal (lemma)
* PR.0/bounded-prism-complete-flatness (theorem)
* PR.0/perfect-prism-properties (lemma)
* PR.0/prism-perfection (construction): TauCeti.Delta.Perfection, TauCeti.Delta.Perfection.exists,
    TauCeti.Delta.Perfection.lift, TauCeti.Delta.Perfection.lift_comp,
    TauCeti.Delta.Perfection.p_mem_nonZeroDivisors, TauCeti.Prismatic.Prism.perfection_generator,
    perfection_of_perfect_prism, perfection_padic, perfection_kills_frobenius_kernel
* PR.0/perfect-prisms-perfectoid-rings (theorem)
* PR.0/perfectoid-tor-independence (theorem)
* PR.0/regular-prismatic-envelopes (construction): TauCeti.Prismatic.Envelope,
    TauCeti.Prismatic.Envelope.lift, TauCeti.Prismatic.Envelope.lift_z,
    TauCeti.Prismatic.Envelope.hom_ext, TauCeti.Prismatic.Envelope.unique,
    TauCeti.Prismatic.Envelope.exists, envelope_trivial, envelope_divisible_element,
    envelope_z_unique, envelope_delta_z, envelope_not_localization
* PR.0/prismatic-envelope-rank-one-presentation (theorem)
* PR.0/transversal-prism-regular-sequences (lemma)
* PR.0/unbounded-torsion-example (construction): TauCeti.Prismatic.UnboundedTorsion.Rel,
    TauCeti.Prismatic.UnboundedTorsion.Ring, TauCeti.Prismatic.UnboundedTorsion.p_pow_mul_x,
    TauCeti.Prismatic.UnboundedTorsion.p_pow_succ_mul_x, unbounded_torsion_order_two,
    unbounded_torsion_nonzero, unbounded_torsion_no_bound
* PR.1/prismatic-structure-sheaf (construction): TauCeti.Prismatic.Site.BoundedPrism,
    TauCeti.Prismatic.Site.IsFlatCover, TauCeti.Prismatic.Site.BoundedPrism.flatTopology,
    TauCeti.Prismatic.Site.BoundedPrism.pushout,
    TauCeti.Prismatic.Site.BoundedPrism.structurePresheaf,
    TauCeti.Prismatic.Site.BoundedPrism.reducedStructurePresheaf,
    TauCeti.Prismatic.Site.BoundedPrism.structurePresheaf_isSheaf,
    TauCeti.Prismatic.Site.BoundedPrism.cechComplex,
    TauCeti.Prismatic.Site.BoundedPrism.cechComplex_exact, pr1_structure_presheaf_obj,
    pr1_flat_cover_id, pr1_flat_cover_base_change, pr1_non_flat_not_cover
* PR.1/relative-prismatic-site (definition): TauCeti.Prismatic.Site.RelativePrism,
    TauCeti.Prismatic.Site.RelativePrism.ideal_eq_map,
    TauCeti.Prismatic.Site.RelativePrism.flatTopology,
    TauCeti.Prismatic.Site.RelativePrism.structureSheaf,
    TauCeti.Prismatic.Site.RelativePrism.reducedStructureSheaf,
    TauCeti.Prismatic.Site.RelativePrism.structureSheaf_isSheaf,
    TauCeti.Prismatic.Site.RelativePrism.forget, TauCeti.Prismatic.Site.RelativePrism.restrict,
    TauCeti.Prismatic.Site.RelativePrism.base, pr1_relative_site_base_terminal,
    pr1_relative_site_sheaf_obj, pr1_relative_site_ideal_rigid, pr1_relative_site_restrict_id
* PR.1/prismatic-to-etale-morphism (comparison)
* PR.1/relative-prismatic-cohomology (construction): TauCeti.Prismatic.Site.cohomologyEval,
    TauCeti.Prismatic.Site.cohomologyUnit, TauCeti.Prismatic.Site.cohomologyMap,
    TauCeti.Prismatic.Site.cohomologyMap_id, TauCeti.Prismatic.Site.cohomologyMap_comp,
    TauCeti.Prismatic.Site.cohomologyBaseChangeMap,
    TauCeti.Prismatic.Site.cohomology_isZero_of_neg, pr1_cohomology_base,
    pr1_cohomology_unit_natural, pr1_cohomology_base_degrees, pr1_cohomology_not_discrete
* PR.1/hodge-tate-cohomology (construction): TauCeti.Prismatic.HodgeTate.Twist,
    TauCeti.Prismatic.HodgeTate.twistZero, TauCeti.Prismatic.HodgeTate.twistAdd,
    TauCeti.Prismatic.HodgeTate.twistOfOrientation, TauCeti.Prismatic.HodgeTate.reduction,
    TauCeti.Prismatic.HodgeTate.structureMap, TauCeti.Prismatic.HodgeTate.cohomologyMap,
    pr1_twist_zero, pr1_twist_oriented, pr1_hodge_tate_base, pr1_hodge_tate_not_discrete
* PR.1/change-of-topology (comparison)
* PR.1/cech-alexander-complex (construction): TauCeti.Prismatic.Site.weaklyInitial,
    TauCeti.Prismatic.Site.weaklyInitial_hom_nonempty, TauCeti.Prismatic.Site.weaklyInitial_flat,
    TauCeti.Prismatic.Site.cechAlexander, TauCeti.Prismatic.Site.cechAlexander_obj_zero,
    TauCeti.Prismatic.Site.cechAlexanderComplex, TauCeti.Prismatic.Site.cechAlexander_baseChange,
    pr1_cech_alexander_base, pr1_cech_alexander_affine_line, pr1_weakly_initial_not_initial
* PR.1/cech-alexander-computes-cohomology (theorem)
* PR.1/frobenius-on-prismatic-cohomology (construction):
    TauCeti.Prismatic.Site.RelativePrism.sheafFrobenius,
    TauCeti.Prismatic.Site.RelativePrism.sheafFrobenius_structureMap,
    TauCeti.Prismatic.Site.frobenius_naturality, TauCeti.Prismatic.Site.frobeniusLinearization,
    pr1_frobenius_sheaf_component, pr1_frobenius_trivial_base, pr1_frobenius_not_linear
* PR.1/base-change-finite-tor-amplitude (theorem)
* PR.1/etale-localization (theorem)
* PR.1/bockstein-differential (construction): TauCeti.Prismatic.HodgeTate.twistedCohomology,
    TauCeti.Prismatic.HodgeTate.bockstein, TauCeti.Prismatic.HodgeTate.bockstein_comp_bockstein,
    TauCeti.Prismatic.HodgeTate.cup, TauCeti.Prismatic.HodgeTate.bockstein_cup,
    TauCeti.Prismatic.HodgeTate.eta0, TauCeti.Prismatic.HodgeTate.eta1, pr1_bockstein_eta1_d,
    pr1_bockstein_base_zero, pr1_bockstein_not_linear
* PR.1/relative-frobenius-cosimplicial-lemma (lemma)
* PR.1/crystalline-comparison (theorem)
* PR.1/crystalline-comparison-syntomic (theorem)
* PR.1/hodge-tate-comparison-char-p (theorem)
* PR.1/crystallization-of-oriented-prism (construction):
    TauCeti.Prismatic.Crystalline.crystallization,
    TauCeti.Prismatic.Crystalline.crystallizationCan,
    TauCeti.Prismatic.Crystalline.crystallizationMap,
    TauCeti.Prismatic.Crystalline.crystallizationMap_apply,
    TauCeti.Prismatic.Crystalline.crystallization_isCrystalline,
    TauCeti.Prismatic.Crystalline.crystallization_frobenius_unit,
    TauCeti.Prismatic.Crystalline.crystallization_cohomology, pr1_crystallization_alpha_d,
    pr1_crystallization_alpha_eq, pr1_crystallization_can_not_prism_map
* PR.1/hodge-tate-affine-line (theorem)
* PR.1/hodge-tate-comparison-map (construction): TauCeti.Prismatic.HodgeTate.comparisonMap,
    TauCeti.Prismatic.HodgeTate.comparisonMap_one,
    TauCeti.Prismatic.HodgeTate.comparisonMap_wedge, TauCeti.Prismatic.HodgeTate.comparisonMap_d,
    TauCeti.Prismatic.HodgeTate.bockstein_eta0_cup_self, pr1_comparison_map_one_formula,
    pr1_comparison_map_base, pr1_comparison_map_square_zero
* PR.1/hodge-tate-comparison (theorem)
* PR.1/prismatic-base-change (theorem)
* PR.1/de-rham-comparison (theorem)
* PR.1/proper-smooth-perfectness (theorem)
* PR.1/p-torsion-free-h0-syntomic (theorem)
* PR.1/perfect-prism-initial (lemma)
* PR.1/acceptance-computations (application)
* PR.2/derived-prismatic-cohomology (construction): TauCeti.Prismatic.Derived.cohomology,
    TauCeti.Prismatic.Derived.map, TauCeti.Prismatic.Derived.map_id,
    TauCeti.Prismatic.Derived.map_comp, TauCeti.Prismatic.Derived.frobenius,
    TauCeti.Prismatic.Derived.frobenius_naturality, TauCeti.Prismatic.Derived.hodgeTate,
    TauCeti.Prismatic.Derived.unit, TauCeti.Prismatic.Derived.constIso, pr2_derived_base_ring,
    pr2_derived_const_agrees, pr2_derived_product, pr2_derived_not_pi0_invariant,
    pr2_derived_frobenius_natural_id
* PR.2/conjugate-filtration (construction): TauCeti.Prismatic.Derived.conjFil,
    TauCeti.Prismatic.Derived.conjFilMap, TauCeti.Prismatic.Derived.conjFilMap_refl,
    TauCeti.Prismatic.Derived.conjFilMap_trans, TauCeti.Prismatic.Derived.conjFilι,
    TauCeti.Prismatic.Derived.conjFilMap_ι, TauCeti.Prismatic.Derived.conjFilZeroIso,
    TauCeti.Prismatic.Derived.conjGr, pr2_conj_fil_zero, pr2_conj_fil_base,
    pr2_conj_fil_smooth_truncation, pr2_conj_fil_not_postnikov
* PR.2/derived-hodge-tate-comparison (theorem)
* PR.2/first-conjugate-piece-cotangent (theorem)
* PR.2/conjugate-splitting-and-lifting (theorem)
* PR.2/derived-prismatic-etale-descent (theorem)
* PR.2/derived-prismatic-base-change (theorem)
* PR.2/kunneth-formula (theorem)
* PR.2/kunneth-formula-formal-schemes (theorem)
* PR.2/comparison-to-prisms (construction): TauCeti.Prismatic.Derived.toPrism,
    TauCeti.Prismatic.Derived.toPrism_frobenius, TauCeti.Prismatic.Derived.toPrism_naturality,
    TauCeti.Prismatic.Derived.siteCohomology, TauCeti.Prismatic.Derived.toSite,
    TauCeti.Prismatic.Derived.toSite_isIso_of_smooth, pr2_to_prism_base, pr2_to_site_smooth,
    pr2_to_site_not_iso, pr2_to_prism_frobenius_base
* PR.2/derived-agrees-with-site (theorem)
* PR.2/idempotent-retract-initial-object (lemma)
* PR.2/regular-quotient-prismatic-envelope (theorem)
* PR.2/derived-input-higher-homotopy (application)
* PR.2/qrsp-prism (theorem)
* PR.2/qrsp-char-p-acrys (comparison)
* PR.2/regular-semiperfectoid-example (application)
* PR.2/singular-qrsp-example (application)
* PR.2/quasisyntomic-covers-lift-to-prisms (theorem)
* PR.2/quasisyntomic-descent (theorem)
* PR.2/derived-crystalline-comparison (comparison)
* PR.2/perfection-of-prismatic-cohomology (construction): TauCeti.Prismatic.Perfection.perfection,
    TauCeti.Prismatic.Perfection.perfectoidization, TauCeti.Prismatic.Perfection.toPerfection,
    TauCeti.Prismatic.Perfection.perfectionFrobenius,
    TauCeti.Prismatic.Perfection.toPerfection_frobenius,
    TauCeti.Prismatic.Perfection.isIso_toPerfection, TauCeti.Prismatic.Perfection.fromRing,
    pr2_perfection_base, pr2_perfectoidization_base, pr2_perfectoidization_char_p_discrete,
    pr2_perfection_not_prismatic
* PR.2/perfection-comparison (comparison)
* PR.2/perfectoidization-coconnective (theorem)
* PR.2/perfection-descendable (theorem)
* PR.2/perfectoidization-symmetric-monoidal (theorem)
* PR.2/connective-perfectoidization-perfectoid (theorem)
* PR.2/finite-projective-modules-p-complete (theorem)
* PR.2/finite-projective-descent-prisms (theorem)
* PR.3/nygaard-filtration-qrsp (definition): TauCeti.Prismatic.Nygaard.fil,
    TauCeti.Prismatic.Nygaard.mem_fil_iff, TauCeti.Prismatic.Nygaard.fil_zero,
    TauCeti.Prismatic.Nygaard.fil_antitone, TauCeti.Prismatic.Nygaard.fil_mul_le,
    TauCeti.Prismatic.Nygaard.fil_map_le, TauCeti.Prismatic.Nygaard.fil_eq_span_pow_of_perfect,
    TauCeti.Prismatic.Nygaard.gr, pr3_nygaard_fil_zero, pr3_nygaard_fil_frobenius_id,
    pr3_nygaard_fil_perfect, pr3_nygaard_fil_one_perfect, pr3_nygaard_fil_not_powers
* PR.3/nygaard-key-case (theorem)
* PR.3/nygaard-regular-semiperfectoid (theorem)
* PR.3/nygaard-filtration (construction): TauCeti.Prismatic.Nygaard.filDerived,
    TauCeti.Prismatic.Nygaard.filDerivedZeroIso, TauCeti.Prismatic.Nygaard.grDerived,
    TauCeti.Prismatic.Nygaard.grDerivedIsoConj, TauCeti.Prismatic.Nygaard.grDerived_smooth,
    TauCeti.Prismatic.Nygaard.filDerivedMap, TauCeti.Prismatic.Nygaard.filDerived_isSheaf,
    pr3_nygaard_derived_fil_zero, pr3_nygaard_derived_gr_zero, pr3_nygaard_derived_base,
    pr3_nygaard_derived_not_truncation
* PR.3/nygaard-graded-pieces (theorem)
* PR.3/divided-frobenius (construction): TauCeti.Prismatic.Nygaard.dividedFrobenius,
    TauCeti.Prismatic.Nygaard.dividedFrobenius_spec,
    TauCeti.Prismatic.Nygaard.dividedFrobenius_mul,
    TauCeti.Prismatic.Nygaard.dividedFrobenius_succ,
    TauCeti.Prismatic.Nygaard.dividedFrobenius_mem_iff,
    TauCeti.Prismatic.Nygaard.dividedFrobenius_unit, TauCeti.Prismatic.Nygaard.frobeniusFil,
    TauCeti.Prismatic.Nygaard.twistedDividedFrobenius, pr3_divided_frobenius_zero,
    pr3_divided_frobenius_perfect, pr3_divided_frobenius_crystalline,
    pr3_divided_frobenius_kernel, pr3_divided_frobenius_not_multiplicative
* PR.3/transversal-prism (definition): TauCeti.Prismatic.BKTwist.IsTransversal,
    TauCeti.Prismatic.BKTwist.frobeniusIdeal, TauCeti.Prismatic.BKTwist.Ir,
    TauCeti.Prismatic.BKTwist.Ir_zero, TauCeti.Prismatic.BKTwist.Ir_one,
    TauCeti.Prismatic.BKTwist.Ir_succ_le, TauCeti.Prismatic.BKTwist.IsTransversal.torsionFree,
    TauCeti.Prismatic.BKTwist.IsTransversal.quotient_Ir_torsionFree,
    TauCeti.Prismatic.BKTwist.IsTransversal.frobeniusIdeal_le,
    TauCeti.Prismatic.BKTwist.IsTransversal.Ir_eq_iInf,
    TauCeti.Prismatic.BKTwist.IsTransversal.cotangent_transition,
    TauCeti.Prismatic.BKTwist.Ir_map, pr3_transversal_ir_zero_one, pr3_transversal_q_de_rham_ir,
    pr3_transversal_torsion_free, pr3_transversal_not_crystalline
* PR.3/transversal-approximation (theorem)
* PR.3/breuil-kisin-twist-transversal (construction): TauCeti.Prismatic.BKTwist.transversalProj,
    TauCeti.Prismatic.BKTwist.transversalProj_surjective,
    TauCeti.Prismatic.BKTwist.ker_transversalProj,
    TauCeti.Prismatic.BKTwist.transversalProj_transition,
    TauCeti.Prismatic.BKTwist.transversal_ext, TauCeti.Prismatic.BKTwist.transversal_lift,
    pr3_bk_transversal_proj_one, pr3_bk_transversal_q_system, pr3_bk_transversal_undivided,
    pr3_bk_transversal_proj_zero
* PR.3/breuil-kisin-twist (construction): TauCeti.Prismatic.BKTwist.twist,
    TauCeti.Prismatic.BKTwist.twist_invertible, TauCeti.Prismatic.BKTwist.twistPow,
    TauCeti.Prismatic.BKTwist.twistModule, TauCeti.Prismatic.BKTwist.twistBaseChange,
    TauCeti.Prismatic.BKTwist.twistReduction, TauCeti.Prismatic.BKTwist.twist_free_iff,
    TauCeti.Prismatic.BKTwist.twistFrobenius, TauCeti.Prismatic.BKTwist.twistFrobeniusMap,
    TauCeti.Prismatic.BKTwist.twistFrobeniusMap_smul,
    TauCeti.Prismatic.BKTwist.twistModule_of_bar, pr3_bk_twist_pow_zero, pr3_bk_twist_module_add,
    pr3_bk_twist_free_of_principal, pr3_bk_twist_q_generator, pr3_bk_twist_no_fixed_generator
* PR.3/breuil-kisin-twist-examples (application)
* PR.3/large-quasisyntomic-algebra (definition): TauCeti.Prismatic.Nygaard.IsLarge,
    TauCeti.Prismatic.Nygaard.HasCompatibleRoots,
    TauCeti.Prismatic.Nygaard.isLarge_iff_exists_family,
    TauCeti.Prismatic.Nygaard.IsLarge.of_surjective,
    TauCeti.Prismatic.Nygaard.IsLarge.kaehler_eq_smul, TauCeti.Prismatic.Nygaard.isLarge_bar,
    pr3_large_base, pr3_large_generated_by_roots, pr3_large_kaehler, pr3_large_not_polynomial
* PR.3/relative-nygaard-large-quasisyntomic (theorem)
* PR.3/relative-nygaard-filtration (construction): TauCeti.Prismatic.Nygaard.frobeniusTwist,
    TauCeti.Prismatic.Nygaard.relativeFrobenius, TauCeti.Prismatic.Nygaard.relFil,
    TauCeti.Prismatic.Nygaard.relFilZeroIso, TauCeti.Prismatic.Nygaard.relGr,
    TauCeti.Prismatic.Nygaard.relGr_triangle, TauCeti.Prismatic.Nygaard.relFilMap,
    TauCeti.Prismatic.Nygaard.relFil_bar, TauCeti.Prismatic.Nygaard.relFil_large,
    TauCeti.Prismatic.Nygaard.relFilBaseChange, pr3_rel_fil_zero, pr3_rel_fil_base,
    pr3_rel_gr_zero_base, pr3_rel_fil_needs_twist
* PR.3/relative-nygaard-graded-pieces (theorem)
* PR.3/leta-frobenius-factorisation (theorem)
* PR.3/de-rham-comparison-general (theorem)
* PR.3/image-of-frobenius (theorem)
* PR.3/nygaard-hodge-comparison (theorem)
* PR.3/nygaard-completion (construction): TauCeti.Prismatic.Nygaard.completion,
    TauCeti.Prismatic.Nygaard.mem_completion_iff, TauCeti.Prismatic.Nygaard.toCompletion,
    TauCeti.Prismatic.Nygaard.toCompletion_apply, TauCeti.Prismatic.Nygaard.ker_toCompletion,
    TauCeti.Prismatic.Nygaard.completionProj, TauCeti.Prismatic.Nygaard.completionProj_surjective,
    TauCeti.Prismatic.Nygaard.completionFil, TauCeti.Prismatic.Nygaard.completionFrobenius,
    TauCeti.Prismatic.Nygaard.completionFrobenius_toCompletion,
    TauCeti.Prismatic.Nygaard.IsNygaardComplete, pr3_completion_perfect, pr3_completion_quotient,
    pr3_completion_frobenius, pr3_completion_not_surjective
* PR.3/nygaard-completeness (theorem)
* PR.3/nygaard-frobenius-colimit (theorem)
* PR.3/nygaard-incomplete-example (application)
* PR.3/nygaard-filtration-in-coordinates (theorem)
* PR.3/bms2-comparison (theorem)
* PR.4/frobenius-fixed-points (construction): TauCeti.Prismatic.Etale.FrobeniusModule,
    TauCeti.Prismatic.Etale.fixedPoints, TauCeti.Prismatic.Etale.fixedPointsι,
    TauCeti.Prismatic.Etale.fixedPointsMap, TauCeti.Prismatic.Etale.fixedPoints_isGE,
    TauCeti.Prismatic.Etale.fixedPoints_isZero_of_isIso, TauCeti.Prismatic.Etale.invert,
    TauCeti.Prismatic.Etale.reduce, pr4_fixed_points_fp_h1, pr4_fixed_points_zero_map,
    pr4_fixed_points_identity, pr4_fixed_points_not_fixed_vectors
* PR.4/fixed-points-completed-colimits (lemma)
* PR.4/perfectoid-artin-schreier-witt (theorem)
* PR.4/etale-comparison (theorem)
* PR.4/etale-comparison-coefficients (theorem)
* PR.4/etale-comparison-without-inverting-d (theorem)
* PR.4/etale-comparison-smooth (theorem)
* PR.4/perfectoid-etale-cohomological-dimension (theorem)
* PR.4/syntomic-complex (construction): TauCeti.Prismatic.Syntomic.NygaardDatum,
    TauCeti.Prismatic.Syntomic.syntomicComplex, TauCeti.Prismatic.Syntomic.syntomicComplexMod,
    TauCeti.Prismatic.Syntomic.syntomicToFil, TauCeti.Prismatic.Syntomic.syntomicMap,
    TauCeti.Prismatic.Syntomic.syntomicComplex_isGE,
    TauCeti.Prismatic.Syntomic.syntomicComplex_isLE, TauCeti.Prismatic.Syntomic.perfectoidDatum,
    pr4_syntomic_zero_weight_fp, pr4_syntomic_equal_maps, pr4_syntomic_contracting,
    pr4_syntomic_not_fixed_points
* PR.4/syntomic-cohomology-formal-schemes (construction):
    TauCeti.Prismatic.Syntomic.AbsoluteDatum, TauCeti.Prismatic.Syntomic.syntomicCohomology,
    TauCeti.Prismatic.Syntomic.syntomicCohomology_completion,
    TauCeti.Prismatic.Syntomic.syntomicCohomology_eq_syntomicComplex,
    TauCeti.Prismatic.Syntomic.syntomicCohomologyFormal,
    TauCeti.Prismatic.Syntomic.syntomicTriangle, pr4_syntomic_cohomology_trivial_ring,
    pr4_syntomic_cohomology_qrsp_two_term, pr4_syntomic_cohomology_completed_agrees,
    pr4_syntomic_cohomology_not_hodge
* PR.4/prismatic-logarithm (construction): TauCeti.Prismatic.Syntomic.rankOneUnits,
    TauCeti.Prismatic.Syntomic.prismaticLog, TauCeti.Prismatic.Syntomic.prismaticLog_frobenius,
    TauCeti.Prismatic.Syntomic.prismaticLog_map, TauCeti.Prismatic.Syntomic.prismaticLog_mod,
    TauCeti.Prismatic.Syntomic.tateModule, TauCeti.Prismatic.Syntomic.tateLog,
    pr4_prismatic_log_one, pr4_prismatic_log_q_de_rham, pr4_prismatic_log_mul,
    pr4_prismatic_log_not_all_units
* PR.4/syntomic-low-weights (theorem)
* PR.4/divided-frobenius-contraction (lemma)
* PR.4/syntomic-filtered-colimits (theorem)
* PR.4/tate-twist-perfectoid (theorem)
* PR.4/picard-perfectoid-uniquely-divisible (application)
* PR.4/tate-twist-discreteness (theorem)
* PR.4/syntomic-connectivity (theorem)
* PR.4/log-forms-divided-frobenius (theorem)
* PR.4/acrys-divided-frobenius-surjective (lemma)
* PR.4/syntomic-complex-char-p (theorem)
* PR.4/log-de-rham-witt-comparison (theorem)
* PR.4/syntomic-truncation-ainf (theorem)
* PR.4/ainf-artin-schreier-condition (lemma)
* PR.4/leta-frobenius-fixed-points (lemma)
* PR.4/nearby-cycles-comparison (theorem)
* PR.4/syntomic-etale-comparison (theorem)
* PR.4/syntomic-cohomology-schemes (construction): TauCeti.Prismatic.Syntomic.SchemeDatum,
    TauCeti.Prismatic.Syntomic.syntomicCohomologyScheme,
    TauCeti.Prismatic.Syntomic.etaleComparison, TauCeti.Prismatic.Syntomic.toFormal,
    TauCeti.Prismatic.Syntomic.toFormal_isIso_of_complete,
    TauCeti.Prismatic.Syntomic.etaleComparison_isIso_of_invertible,
    TauCeti.Prismatic.Syntomic.pullback_condition, pr4_syntomic_scheme_p_invertible,
    pr4_syntomic_scheme_p_complete, pr4_syntomic_scheme_zero, pr4_syntomic_scheme_not_product
* PR.4/syntomic-not-generic-fibre-etale (application)
* PR.4/tate-twists-acceptance-examples (application)
* PR.5/absolute-prismatic-site (definition): TauCeti.Prismatic.Absolute.SiteObj,
    TauCeti.Prismatic.Absolute.SiteObj.Hom, TauCeti.Prismatic.Absolute.SiteObj.ofPrism,
    TauCeti.Prismatic.Absolute.SiteObj.idealSheaf, TauCeti.Prismatic.Absolute.RelativeObj,
    TauCeti.Prismatic.Absolute.SiteObj.existsUnique_hom_of_perfect, pr5_site_perfect_initial,
    pr5_site_char_p_crystalline, pr5_site_structure_map_matters
* PR.5/generalized-cartier-divisor (definition):
    TauCeti.Prismatic.WCart.GeneralizedCartierDivisor,
    TauCeti.Prismatic.WCart.GeneralizedCartierDivisor.Iso,
    TauCeti.Prismatic.WCart.GeneralizedCartierDivisor.ofElement,
    TauCeti.Prismatic.WCart.GeneralizedCartierDivisor.ofIdeal,
    TauCeti.Prismatic.WCart.GeneralizedCartierDivisor.baseChange,
    TauCeti.Prismatic.WCart.GeneralizedCartierDivisor.IsCartier,
    TauCeti.Prismatic.WCart.GeneralizedCartierDivisor.ofElement_iso_iff,
    pr5_cartier_zero_not_cartier, pr5_cartier_unit_trivial,
    pr5_cartier_base_change_loses_injectivity, pr5_cartier_automorphisms
* PR.5/cartier-witt-divisor (definition): TauCeti.Prismatic.WCart.IsCartierWitt,
    TauCeti.Prismatic.WCart.CartierWittDivisor, TauCeti.Prismatic.WCart.IsDistinguishedWitt,
    TauCeti.Prismatic.WCart.CartierWittDivisor.ofWitt,
    TauCeti.Prismatic.WCart.isCartierWitt_ofElement_iff, TauCeti.Prismatic.WCart.coeff_zero_delta,
    pr5_cw_p_distinguished, pr5_cw_verschiebung_one, pr5_cw_one_not_distinguished,
    pr5_cw_teichmuller_not_distinguished, pr5_cw_empty_of_p_not_nilpotent
* PR.5/cartier-witt-stack (construction): TauCeti.Prismatic.WCart.CartierWittDivisor.groupoid,
    TauCeti.Prismatic.WCart.pullback, TauCeti.Prismatic.WCart.pullbackComp,
    TauCeti.Prismatic.WCart.toCart, TauCeti.Prismatic.WCart.toCart_not_isCartier,
    TauCeti.Prismatic.WCart.pullback_faithful, pr5_wcart_hom_principal, pr5_wcart_zero_ring,
    pr5_wcart_pullback_principal, pr5_wcart_nontrivial_automorphism
* PR.5/wcart-quotient-presentation (theorem)
* PR.5/transversal-prism-coproducts (theorem)
* PR.5/prism-point-of-wcart (construction): TauCeti.Prismatic.WCart.prismPoint,
    TauCeti.Prismatic.WCart.prismPoint_comp, TauCeti.Prismatic.WCart.prismPoint_map,
    TauCeti.Prismatic.WCart.exists_universalOrientedPrism, pr5_point_crystalline_is_p,
    pr5_point_orientable_principal, pr5_point_to_cart
* PR.5/wcart-fibre-products-of-prisms (theorem)
* PR.5/quasi-coherent-complexes-on-wcart (construction): TauCeti.Prismatic.WCart.Carriers,
    TauCeti.Prismatic.WCart.carriers, TauCeti.Prismatic.WCart.Carriers.prismPullback,
    TauCeti.Prismatic.WCart.Carriers.globalSections, TauCeti.Prismatic.WCart.Carriers.idealPow,
    TauCeti.Prismatic.WCart.prismPullback_unit, TauCeti.Prismatic.WCart.prismPullback_ideal,
    pr5_qcoh_pullback_unit, pr5_qcoh_ideal_pow_zero, pr5_qcoh_ideal_not_trivial
* PR.5/prismatic-crystals-on-wcart (theorem)
* PR.5/divided-power-multiplicative-group (construction): TauCeti.Prismatic.WCart.gmSharpRing,
    TauCeti.Prismatic.WCart.GmSharp, TauCeti.Prismatic.WCart.GmSharp.group,
    TauCeti.Prismatic.WCart.GmSharp.toUnits, TauCeti.Prismatic.WCart.GmSharp.toUnits_injective,
    TauCeti.Prismatic.WCart.gmSharpEquivFrobeniusKernel, pr5_gmsharp_padic_points,
    pr5_gmsharp_rational, pr5_gmsharp_fp_trivial
* PR.5/hodge-tate-divisor (construction): TauCeti.Prismatic.WCart.CartierWittDivisor.IsHodgeTate,
    TauCeti.Prismatic.WCart.etaPoint, TauCeti.Prismatic.WCart.etaPoint_isHodgeTate,
    TauCeti.Prismatic.WCart.prismPoint_isHodgeTate_iff, TauCeti.Prismatic.WCart.autEtaEquiv,
    TauCeti.Prismatic.WCart.exists_faithfullyFlat_iso_etaPoint, pr5_ht_p_eq_verschiebung_one,
    pr5_ht_p_not_hodge_tate, pr5_ht_unit_times_v_one, pr5_ht_aut_eta_fp
* PR.5/sen-operator (construction): TauCeti.Prismatic.WCart.senOperator,
    TauCeti.Prismatic.WCart.senOperator_unit, TauCeti.Prismatic.WCart.senOperator_twist,
    TauCeti.Prismatic.WCart.fibreEta_twist,
    TauCeti.Prismatic.WCart.one_add_teichmuller_eps_mul_verschiebung, pr5_sen_unit_zero,
    pr5_sen_ideal_identity, pr5_sen_ideal_ne_zero, pr5_sen_teichmuller_frobenius
* PR.5/sen-operator-classification (theorem)
* PR.5/wcart-frobenius (construction): TauCeti.Prismatic.WCart.frobenius,
    TauCeti.Prismatic.WCart.frobenius_ofWitt, TauCeti.Prismatic.WCart.frobenius_hodgeTate,
    TauCeti.Prismatic.WCart.frobeniusPullbackMap, TauCeti.Prismatic.WCart.frobPullback_bkTwist,
    pr5_frob_eta_is_p, pr5_frob_preserves_distinguished, pr5_frob_kills_sen_automorphism,
    pr5_point_frobenius
* PR.5/frobenius-pullback-square (theorem)
* PR.5/relative-site-comparison (theorem)
* PR.5/absolute-prismatic-cohomology (construction): TauCeti.Prismatic.Absolute.prismaticSheaf,
    TauCeti.Prismatic.Absolute.prismaticSheafMap, TauCeti.Prismatic.Absolute.prismaticComplex,
    TauCeti.Prismatic.Absolute.absolutePrismatic,
    TauCeti.Prismatic.Absolute.prismPullback_prismaticSheaf,
    TauCeti.Prismatic.Absolute.absolutePrismatic_zero_zero, pr5_abs_sheaf_integers,
    pr5_abs_sheaf_zero_ring, pr5_abs_fp, pr5_abs_sheaf_fp_not_unit
* PR.5/absolute-relative-comparison (theorem)
* PR.5/absolute-prismatic-descent (theorem)
* PR.5/absolute-site-comparison (comparison)
* PR.5/absolute-hodge-tate-cohomology (construction): TauCeti.Prismatic.Absolute.hodgeTateSheaf,
    TauCeti.Prismatic.Absolute.absoluteHodgeTate, TauCeti.Prismatic.Absolute.diffractedHodge,
    TauCeti.Prismatic.Absolute.diffractedHodgeFil,
    TauCeti.Prismatic.Absolute.absolutePrismatic_fibre_sequence,
    TauCeti.Prismatic.Absolute.absoluteHodgeTate_fibre_sequence, pr5_ht_integers_h1,
    pr5_ht_integers_twist_h0, pr5_ht_sheaf_integers, pr5_ht_diffracted_integers
* PR.5/absolute-crystalline-comparison (theorem)
* PR.5/absolute-de-rham-comparison (theorem)
* PR.5/absolute-nygaard-filtration (construction): TauCeti.Prismatic.Absolute.nygaardFil,
    TauCeti.Prismatic.Absolute.nygaardTransition, TauCeti.Prismatic.Absolute.nygaardFil_of_nonpos,
    TauCeti.Prismatic.Absolute.nygaardGr, TauCeti.Prismatic.Absolute.nygaard_fibre_sequence,
    TauCeti.Prismatic.Absolute.nygaardGr_fibre_sequence,
    TauCeti.Prismatic.Absolute.nygaardToHodge, pr5_nyg_fil_zero, pr5_nyg_gr_fp,
    pr5_nyg_gr_zero_integers, pr5_nyg_gr_one_integers
* PR.5/absolute-nygaard-graded-pieces (theorem)
* PR.5/absolute-nygaard-perfect-prism (theorem)
* PR.5/absolute-frobenius (construction): TauCeti.Prismatic.Absolute.relativeFrobenius,
    TauCeti.Prismatic.Absolute.frobeniusEnd, TauCeti.Prismatic.Absolute.absoluteFrobenius,
    TauCeti.Prismatic.Absolute.nygaardToIdealFil,
    TauCeti.Prismatic.Absolute.prismaticSheafMap_relativeFrobenius, pr5_frob_fp_iso,
    pr5_frob_zp_not_iso, pr5_frob_twist_zp_iso
* PR.6/q-divided-power-operation (definition): TauCeti.Prismatic.QCrys.pAnalog,
    TauCeti.Prismatic.QCrys.pAnalog_eq_eval_cyclotomic,
    TauCeti.Prismatic.QCrys.pAnalog_mul_sub_one, TauCeti.Prismatic.QCrys.pAnalog_one,
    TauCeti.Prismatic.QCrys.frobeniusPreimageIdeal, TauCeti.Prismatic.QCrys.gamma,
    TauCeti.Prismatic.QCrys.pAnalog_mul_gamma, TauCeti.Prismatic.QCrys.gamma_add,
    TauCeti.Prismatic.QCrys.gamma_mul, TauCeti.Prismatic.QCrys.delta_pAnalog_sub_one_mem,
    pr6_gamma_q_sub_one, pr6_gamma_at_q_one, pr6_gamma_p_padic, pr6_pAnalog_two,
    pr6_p_not_mem_frobenius_preimage
* PR.6/q-pd-pair (definition): TauCeti.Prismatic.QCrys.QPDPair,
    TauCeti.Prismatic.QCrys.QPDPair.Hom, TauCeti.Prismatic.QCrys.QPDPair.prism,
    TauCeti.Prismatic.QCrys.QPDPair.prism_I, TauCeti.Prismatic.QCrys.QPDPair.IsDeltaPD,
    TauCeti.Prismatic.QCrys.QPDPair.frobenius_mem, TauCeti.Prismatic.QCrys.QPDPair.gamma_mem,
    TauCeti.Prismatic.QCrys.QPDPair.isAdicComplete, pr6_qpd_pair_initial, pr6_qpd_pair_classical,
    pr6_qpd_pair_zero_ideal, pr6_qpd_pair_p_not_mem, pr6_qpd_pair_sub_one_frobenius
* PR.6/delta-pd-pairs (comparison)
* PR.6/q-pd-homological-properties (lemma)
* PR.6/smallest-largest-q-pd-ideals (theorem)
* PR.6/ainf-q-pd-pair (lemma)
* PR.6/q-pd-envelope (construction): TauCeti.Prismatic.QCrys.envelope,
    TauCeti.Prismatic.QCrys.envelopeMap, TauCeti.Prismatic.QCrys.envelopePair,
    TauCeti.Prismatic.QCrys.envelopeMap_delta, TauCeti.Prismatic.QCrys.envelope_frobenius_mem,
    TauCeti.Prismatic.QCrys.envelopeMap_mem, TauCeti.Prismatic.QCrys.envelopeQuotientEquiv,
    TauCeti.Prismatic.QCrys.envelopeLift, TauCeti.Prismatic.QCrys.envelopeLift_comp,
    TauCeti.Prismatic.QCrys.envelopeLift_unique, pr6_envelope_empty_sequence,
    pr6_envelope_frobenius_divisible, pr6_envelope_universal_identity, pr6_envelope_not_surjective
* PR.6/q-pd-envelope-base-change (theorem)
* PR.6/q-crystalline-site (definition): TauCeti.Prismatic.QCrys.Thickening,
    TauCeti.Prismatic.QCrys.Thickening.Hom, TauCeti.Prismatic.QCrys.Thickening.base,
    TauCeti.Prismatic.QCrys.qCrystallineCohomology, TauCeti.Prismatic.QCrys.qCrystallineFrobenius,
    TauCeti.Prismatic.QCrys.qCrystallineEval, TauCeti.Prismatic.QCrys.qCrystallineMap,
    TauCeti.Prismatic.QCrys.qCrystallineBaseIso, pr6_qcrys_base, pr6_qcrys_eval_natural,
    pr6_qcrys_map_id, pr6_qcrys_not_structure_ring
* PR.6/q-crystalline-cech-alexander (construction): TauCeti.Prismatic.QCrys.cechAlexanderComplex,
    TauCeti.Prismatic.QCrys.cechAlexanderIso, TauCeti.Prismatic.QCrys.cechAlexanderZero,
    TauCeti.Prismatic.QCrys.cechAlexanderZero_weaklyInitial,
    TauCeti.Prismatic.QCrys.cechAlexanderSmallComplex,
    TauCeti.Prismatic.QCrys.cechAlexanderSmallIso, pr6_cech_alexander_independent,
    pr6_cech_alexander_weakly_initial_base, pr6_cech_alexander_base_presentation,
    pr6_cech_alexander_not_cech_nerve
* PR.6/q-crystalline-crystalline-comparison (theorem)
* PR.6/q-pd-thickening-invariance (theorem)
* PR.6/q-crystalline-prismatic-comparison (theorem)
* PR.6/framed-q-pd-datum (definition): TauCeti.Prismatic.QCrys.FramedAlgebra,
    TauCeti.Prismatic.QCrys.FramedAlgebra.delta_coord,
    TauCeti.Prismatic.QCrys.FramedAlgebra.gamma_coord_self,
    TauCeti.Prismatic.QCrys.FramedAlgebra.gamma_coord_of_ne,
    TauCeti.Prismatic.QCrys.FramedAlgebra.gamma_comm,
    TauCeti.Prismatic.QCrys.FramedAlgebra.gamma_delta,
    TauCeti.Prismatic.QCrys.FramedAlgebra.sub_one_mul_coord_mul_nabla,
    TauCeti.Prismatic.QCrys.FramedDatum, TauCeti.Prismatic.QCrys.FramedDatum.Hom,
    pr6_framed_nabla_coord_pow, pr6_framed_nabla_const, pr6_framed_gamma_frobenius,
    pr6_framed_two_framings_gamma
* PR.6/gamma-extension-to-q-pd-envelope (lemma)
* PR.6/framed-q-de-rham-complex (construction): TauCeti.Prismatic.QCrys.FramedDatum.envelope,
    TauCeti.Prismatic.QCrys.FramedDatum.envelopeMap,
    TauCeti.Prismatic.QCrys.FramedDatum.envelopeFramed,
    TauCeti.Prismatic.QCrys.FramedDatum.envelopeFramed_gamma,
    TauCeti.Prismatic.QCrys.FramedDatum.qDeRhamComplex,
    TauCeti.Prismatic.QCrys.FramedDatum.qDeRhamMap,
    TauCeti.Prismatic.QCrys.FramedDatum.qDeRhamFrobenius,
    TauCeti.Prismatic.QCrys.FramedAlgebra.nabla_frobenius, pr6_qdr_polynomial_nabla,
    pr6_qdr_at_q_one_derivative, pr6_qdr_no_coordinates, pr6_qdr_two_framings_differ,
    pr6_qdr_leibniz
* PR.6/q-de-rham-comparison (theorem)
* PR.6/change-of-framing (theorem)
* PR.6/q-de-rham-prismatic-comparison-zp (theorem)
* PR.6/ainf-omega-comparison-map (construction): TauCeti.Prismatic.AOmega.Chart,
    TauCeti.Prismatic.AOmega.coordinateMap, TauCeti.Prismatic.AOmega.coordinateMap_comp,
    TauCeti.Prismatic.AOmega.coordinateMap_gamma, TauCeti.Prismatic.AOmega.AOmegaData,
    TauCeti.Prismatic.AOmega.frobeniusPullback, TauCeti.Prismatic.AOmega.comparisonMap,
    TauCeti.Prismatic.AOmega.comparisonMap_frobenius, pr6_mu_torus_coordinate, pr6_mu_point,
    pr6_mu_frobenius_square, pr6_mu_needs_decalage
* PR.6/hodge-tate-comparison-criterion (lemma)
* PR.6/ainf-omega-comparison (theorem)
* PR.6/theta-theta-tilde-square (comparison)
* PR.6/comparison-uniqueness (theorem)
* PR.6/nygaard-filtration-q-de-rham-coordinates (theorem)
* PR.7/prismatic-crystal (definition): TauCeti.Prismatic.FCrystal.IsBaseChangeAlong,
    TauCeti.Prismatic.FCrystal.Crystal, TauCeti.Prismatic.FCrystal.Crystal.Hom,
    TauCeti.Prismatic.FCrystal.Crystal.unit, TauCeti.Prismatic.FCrystal.Crystal.tensor,
    TauCeti.Prismatic.FCrystal.Crystal.pullback, TauCeti.Prismatic.FCrystal.Crystal.baseChange,
    TauCeti.Prismatic.FCrystal.Crystal.Iso, pr7_crystal_unit_eval, pr7_crystal_base_change_id,
    pr7_crystal_initial_object_eval, pr7_crystal_hodge_tate_quotient_not_projective
* PR.7/crystal-descent (theorem)
* PR.7/quasisyntomic-crystal-comparison (theorem)
* PR.7/f-crystal-over-prism (definition): TauCeti.Prismatic.FCrystal.IsAwayIdeal,
    TauCeti.Prismatic.FCrystal.OverPrism, TauCeti.Prismatic.FCrystal.OverPrism.Hom,
    TauCeti.Prismatic.FCrystal.OverPrism.IsEffective, TauCeti.Prismatic.FCrystal.OverPrism.unit,
    TauCeti.Prismatic.FCrystal.OverPrism.baseChange, pr7_over_prism_away_principal,
    pr7_over_prism_unit_effective, pr7_over_prism_rank_one_scaling, pr7_over_prism_frob_ne_zero
* PR.7/prismatic-f-crystal (definition): TauCeti.Prismatic.FCrystal.SiteData,
    TauCeti.Prismatic.FCrystal.SiteData.restrict, TauCeti.Prismatic.FCrystal.PrismaticFCrystal,
    TauCeti.Prismatic.FCrystal.PrismaticFCrystal.Hom,
    TauCeti.Prismatic.FCrystal.PrismaticFCrystal.eval,
    TauCeti.Prismatic.FCrystal.PrismaticFCrystal.IsEffective,
    TauCeti.Prismatic.FCrystal.PrismaticFCrystal.unit,
    TauCeti.Prismatic.FCrystal.PrismaticFCrystal.tensor,
    TauCeti.Prismatic.FCrystal.PrismaticFCrystal.pullback,
    TauCeti.Prismatic.FCrystal.breuilKisinTwist, pr7_fcrystal_eval_effective,
    pr7_fcrystal_twist_invertible, pr7_fcrystal_twist_not_effective, pr7_fcrystal_unit_effective
* PR.7/laurent-f-crystal (definition): TauCeti.Prismatic.FCrystal.LaurentRing,
    TauCeti.Prismatic.FCrystal.laurentFrobenius, TauCeti.Prismatic.FCrystal.LaurentFCrystal,
    TauCeti.Prismatic.FCrystal.LaurentFCrystal.Hom,
    TauCeti.Prismatic.FCrystal.LaurentFCrystal.fixedPoints, pr7_laurent_frobenius_extends,
    pr7_laurent_fixed_points_res, pr7_laurent_p_frobenius_non_example
* PR.7/artin-schreier-riemann-hilbert (theorem)
* PR.7/laurent-f-crystals-local-systems (theorem)
* PR.7/etale-realization (construction): TauCeti.Prismatic.FCrystal.etaleRealization,
    TauCeti.Prismatic.FCrystal.etaleRealizationMap,
    TauCeti.Prismatic.FCrystal.etaleRealization_eval, TauCeti.Prismatic.FCrystal.OKData.galoisRep,
    pr7_etale_real_unit, pr7_etale_real_char_p_zero, pr7_etale_real_map_injective_transversal,
    pr7_etale_real_not_full
* PR.7/crystalline-realization (construction): TauCeti.Prismatic.FCrystal.ideal_eq_span_p_of_mem,
    TauCeti.Prismatic.FCrystal.crystallineRealization,
    TauCeti.Prismatic.FCrystal.deRhamRealization, pr7_crys_real_site_crystalline,
    pr7_crys_real_eval, pr7_crys_real_twist_value, pr7_crys_real_not_effective
* PR.7/f-crystals-over-qrsp (theorem)
* PR.7/breuil-kisin-and-ainf-covers (construction): TauCeti.Prismatic.FCrystal.OKData,
    TauCeti.Prismatic.FCrystal.OKData.bk_covers, TauCeti.Prismatic.FCrystal.OKData.ainf_covers,
    TauCeti.Prismatic.FCrystal.OKData.evalBK, TauCeti.Prismatic.FCrystal.OKData.evalAinf,
    pr7_ok_bk_to_ainf_base_change, pr7_ok_ainf_perfect, pr7_ok_bk_not_perfect,
    pr7_ok_bk_orientable
* PR.7/bkf-modules-comparison (comparison)
* PR.7/crystalline-representation-of-f-crystal (theorem)
* PR.7/etale-realization-fully-faithful (theorem)
* PR.7/period-sheaves-qrsp (construction): TauCeti.Prismatic.FCrystal.Period.Rational,
    TauCeti.Prismatic.FCrystal.Period.toRational,
    TauCeti.Prismatic.FCrystal.Period.rationalFrobenius,
    TauCeti.Prismatic.FCrystal.Period.BdRPlus,
    TauCeti.Prismatic.FCrystal.Period.bdRPlus_equiv_rational, pr7_period_rational_p_dvd,
    pr7_period_bdr_plus_p_unit, pr7_period_rational_frobenius_extends,
    pr7_period_frobenius_not_lift
* PR.7/filtered-phi-module-to-crystal (construction):
    TauCeti.Prismatic.FCrystal.OKData.filteredCrystal,
    TauCeti.Prismatic.FCrystal.OKData.filteredCrystal_rank,
    TauCeti.Prismatic.FCrystal.OKData.filteredCrystal_restrict, pr7_filtered_crystal_rank_zero,
    pr7_filtered_crystal_finite_projective, pr7_filtered_crystal_twist,
    pr7_filtered_crystal_not_integral
* PR.7/tate-twist-analytic-continuation (theorem)
* PR.7/descent-data-boundedness (theorem)
* PR.7/weakly-admissible-extension-over-ainf (theorem)
* PR.7/crystalline-lattice-to-f-crystal (construction):
    TauCeti.Prismatic.FCrystal.OKData.latticeFCrystal,
    TauCeti.Prismatic.FCrystal.OKData.latticeFCrystal_realization,
    TauCeti.Prismatic.FCrystal.OKData.latticeFCrystal_unique, pr7_lattice_rank, pr7_lattice_twist,
    pr7_lattice_hom, pr7_lattice_not_all_representations
* PR.7/crystalline-lattices-theorem (theorem)
* PR.7/etale-realization-over-breuil-kisin-prism (theorem)
* PR.7/breuil-kisin-evaluation (theorem)
* PR.7/kisin-functor-comparison (comparison)
* PR.7/mod-p-full-faithfulness-fails (application)
* PR.8/delta-log-ring (definition): DeltaLogRing.mk, DeltaLogRing.frobenius_alpha,
    DeltaLogRing.unitFactor_mul, DeltaLogRing.frobenius_iterate_alpha,
    DeltaLogRing.deltaLog_unique_of_nonZeroDivisor, DeltaLogRing.exists_iff_dvd,
    DeltaLogRing.equivWittSection, DeltaLogRing.Hom, DeltaLogRing.IsRankOne,
    DeltaLogRing.trivialLog, DeltaLogRing.monoidAlgebra, DeltaLogRing.baseChange,
    DeltaLogRing.ext, DeltaLogRing.Hom.ext, DeltaLogRing.trivialLog_deltaLog,
    DeltaLogRing.zero_monoid, DeltaLogRing.monoidAlgebra_rankOne, DeltaLogRing.not_any_map,
    DeltaLogRing.frobenius_alpha_example
* PR.8/delta-log-frobenius (construction): DeltaLogRing.frobeniusMonoid,
    DeltaLogRing.alpha_frobeniusMonoid, DeltaLogRing.frobeniusMonoid_eq_pow_of_rankOne,
    DeltaLogRing.frobeniusMonoid_units, DeltaLogRing.frobeniusMonoid_natural,
    DeltaLogRing.frobeniusMonoid_bk, DeltaLogRing.frobeniusMonoid_trivial,
    DeltaLogRing.frobeniusMonoid_not_pow
* PR.8/delta-log-free (construction): DeltaLogRing.freeOnMonoid, DeltaLogRing.freeOnMonoid.lift,
    DeltaLogRing.freeOneGenerator_equiv_mvPolynomial,
    DeltaLogRing.freeOneGenerator_frobenius_faithfullyFlat, DeltaLogRing.hasLimits,
    DeltaLogRing.invertGenerator_completion, DeltaLogRing.freeOneGenerator_frobenius_x,
    DeltaLogRing.freeOnMonoid_trivial, DeltaLogRing.freeOneGenerator_not_monoidAlgebra,
    DeltaLogRing.pdivisible_rankOne
* PR.8/delta-log-completion-etale (lemma)
* PR.8/delta-log-associated-log (theorem)
* PR.8/delta-log-groupification (theorem)
* PR.8/delta-log-exactification (construction): DeltaLogTriple.exactification,
    DeltaLogTriple.exactification.toQuotient_exactSurjective, DeltaLogTriple.exactification.lift,
    DeltaLogTriple.exactification.baseChange, DeltaLogTriple.exactification.integral,
    DeltaLogTriple.exactification_of_exact, DeltaLogTriple.exactification_compat_monoid
* PR.8/prelog-prism (definition): PrelogPrism.mk, PrelogPrism.toPrism, PrelogPrism.IsBounded,
    PrelogPrism.IsRankOne, PrelogPrism.baseChange_of_flat, PrelogPrism.rigid,
    PrelogPrism.zero_log, PrelogPrism.trivial_monoid, PrelogPrism.not_delta_pair,
    PrelogPrism.forget_compat
* PR.8/log-prism (definition): LogPrism.ofPrelog, LogPrism.globalSections, LogPrism.homOfPrelog,
    LogPrism.frobenius, LogPrism.trivial, LogPrism.trivial_frobenius, LogPrism.bk_associated,
    LogPrism.forget_compat
* PR.8/standard-log-prisms (construction): PrelogPrism.breuilKisin, PrelogPrism.ainf,
    PrelogPrism.crystallineZeroLog, PrelogPrism.breuilKisinToCrystalline,
    PrelogPrism.breuilKisinToAinf, PrelogPrism.breuilKisin_frobenius,
    PrelogPrism.breuilKisin_mod_u, PrelogPrism.ainf_rankOne,
    PrelogPrism.breuilKisin_not_frobenius_u_plus_p
* PR.8/prelog-prismatic-envelope (construction): PrelogPrism.envelope, PrelogPrism.envelope.lift,
    PrelogPrism.envelope.exactSurjective, PrelogPrism.envelope.monoid_integral,
    PrelogPrism.envelope_of_exact, PrelogPrism.envelope_identity
* PR.8/log-prismatic-envelope (theorem)
* PR.8/envelope-flatness-smooth (theorem)
* PR.8/perfectoid-monoid (definition): Monoid.tilt, Monoid.IsPerfectoid, Monoid.IsPerfect,
    Monoid.IsPseudoPerfectoid, Monoid.IsPerfect.isPerfectoid,
    Monoid.IsPerfectoid.isPseudoPerfectoid, PrelogRing.tilt, PrelogRing.ainf,
    PerfectoidLogRing.iff_pseudoPerfectoid, Monoid.tilt_nat_inv_p, Monoid.isPerfectoid_units,
    Monoid.tilt_compat_pretilt
* PR.8/perfect-log-prism (definition): LogPrism.IsPerfect,
    LogPrism.isPerfect_iff_uniquelyDivisible, LogPrism.IsPerfect.pSaturated, LogPrism.perfection,
    LogPrism.perfection.lift, LogPrism.ainfPerfect, LogPrism.ainf_isPerfect,
    LogPrism.trivial_isPerfect_iff, LogPrism.breuilKisin_not_perfect, LogPrism.zeroLog_perfect
* PR.8/perfect-log-prisms-perfectoid (theorem)
* PR.8/perfectoid-prelog-cotangent (lemma)
* PR.8/log-prismatic-site (definition): LogPrismaticSite, LogPrismaticSite.structureSheaf,
    LogPrismaticSite.reducedStructureSheaf, LogPrismaticSite.toEtale,
    LogPrismaticSite.flat_eq_etale, LogPrismaticSite.affineLine_object,
    LogPrismaticSite.trivialLog, LogPrismaticSite.base_point,
    LogPrismaticSite.not_strict_open_immersion
* PR.8/log-prismatic-cohomology (construction): LogPrismaticSite.cohomology,
    LogPrismaticSite.sheafCohomology, LogPrismaticSite.reducedCohomology,
    LogPrismaticSite.reduced_eq_tensor, LogPrismaticSite.frobenius,
    LogPrismaticSite.cohomology_isComplete, LogPrismaticSite.cohomology_map,
    LogPrismaticSite.cohomology_point, LogPrismaticSite.cohomology_trivialLog,
    LogPrismaticSite.reduced_affineLine, LogPrismaticSite.cohomology_not_nonlog
* PR.8/absolute-log-prismatic-site (definition): AbsoluteLogPrismaticSite,
    AbsoluteLogPrismaticSite.saturated, AbsoluteLogPrismaticSite.structureSheaf,
    AbsoluteLogPrismaticSite.ofRelative, AbsoluteLogPrismaticSite.trivialLog
* PR.8/cech-alexander-log (construction): LogPrismaticSite.cechAlexander,
    LogPrismaticSite.cechAlexander_computes, LogPrismaticSite.cechAlexander_baseChange,
    LogPrismaticSite.cechAlexanderFunctorial, LogPrismaticSite.cechAlexander_independent,
    LogPrismaticSite.cechAlexander_trivial
* PR.8/log-prismatic-weak-base-change (lemma)
* PR.8/log-prismatic-etale-localization (lemma)
* PR.8/smooth-chart-covers (theorem)
* PR.8/log-hodge-tate-map (construction): LogPrismaticSite.hodgeTateMap,
    LogPrismaticSite.hodgeTateMap_bockstein_dlog, LogPrismaticSite.hodgeTateMap_dlog_not_dx
* PR.8/hodge-tate-group-lemma (lemma)
* PR.8/hodge-tate-log-affine-line (lemma)
* PR.8/log-hodge-tate-comparison (theorem)
* PR.8/log-prismatic-base-change (theorem)
* PR.8/delta-log-crystalline-site (definition): DeltaLogCrystallineSite,
    DeltaLogCrystallineSite.structureSheaf, DeltaLogCrystallineSite.toBigLogCrystalline,
    DeltaLogCrystallineSite.toEtale, DeltaLogCrystallineSite.point,
    DeltaLogCrystallineSite.affineLine
* PR.8/delta-log-crystalline-vs-log-crystalline (theorem)
* PR.8/cartier-type-cosimplicial-frobenius (lemma)
* PR.8/crystalline-comparison-map (construction): LogPrismaticSite.crystallineFunctor,
    LogPrismaticSite.crystallineFunctor_cocontinuous, LogPrismaticSite.crystallineComparisonMap,
    LogPrismaticSite.crystallineComparisonMap_point
* PR.8/local-crystalline-comparison (theorem)
* PR.8/log-crystalline-comparison (theorem)
* PR.8/log-q-pd-triple (definition): LogQPDTriple, LogQPDTriple.gamma_mem, LogQPDTriple.envelope,
    LogQPDTriple.not_q_minus_one_ideal
* PR.8/log-q-crystalline-site (definition): LogQCrystallineSite, LogQCrystallineSite.qOmega,
    LogQCrystallineSite.ofDeltaLogCrystalline, LogQCrystallineSite.point
* PR.8/log-q-crystalline-vs-crystalline (theorem)
* PR.8/log-q-crystalline-vs-prismatic (theorem)
* PR.8/log-q-de-rham-complex (construction): LogQDeRham.gamma, LogQDeRham.qNabla,
    LogQDeRham.complex, LogQDeRham.computes, LogQDeRham.affineLine_monomial, LogQDeRham.empty
* PR.8/semistable-aomega-comparison (theorem)
* PR.8/semistable-crys-bdr-diagram (theorem)
* PR.8/breuil-kisin-log-cohomology (construction): BreuilKisinLogCohomology,
    BreuilKisinLogCohomology.toAinf, BreuilKisinLogCohomology.frobenius,
    BreuilKisinLogCohomology.point
* PR.8/log-quasisyntomic-site (definition): LogQSyn.site, LogQSyn.pushout, LogQSyn.trivialLog,
    LogQSyn.trivialLog_eq
* PR.8/log-qrsp (definition): LogQRSP.IsSemiperfectoid, LogQRSP.perfectoidCover,
    LogQRSP.quotient_monoid, LogQRSP.trivialLog, LogQRSP.log_line_not
* PR.8/log-qrsp-basis (theorem)
* PR.8/derived-log-prismatic (construction): DerivedLogPrismatic, DerivedLogPrismatic.reduced,
    DerivedLogPrismatic.onFree, DerivedLogPrismatic.sheaf, DerivedLogPrismatic.map,
    DerivedLogPrismatic.free_logLine, DerivedLogPrismatic.base, DerivedLogPrismatic.trivialLog,
    DerivedLogPrismatic.zeroLog_not_discrete
* PR.8/derived-log-hodge-tate (theorem)
* PR.8/derived-log-properties (theorem)
* PR.8/derived-vs-site (theorem)
* PR.8/log-quasisyntomic-descent (theorem)
* PR.8/initial-log-prism-qrsp (theorem)
* PR.8/log-nygaard-filtration (construction): LogNygaard.fil, LogNygaard.frobenius,
    LogNygaard.mulI, LogNygaard.flatBaseChange, LogNygaard.sheaf, LogNygaard.fil0,
    LogNygaard.trivialLog
* PR.8/log-nygaard-graded (theorem)
* PR.8/nygaard-hodge-fiber-sequence (theorem)
* PR.8/log-l-eta-factorization (theorem)
* PR.8/log-de-rham-comparison (theorem)
* PR.8/log-frobenius-isogeny (theorem)
* PR.8/kummer-etale-site-log-scheme (definition): KummerEtale.IsKummerType, KummerEtale.site,
    KummerEtale.cohomology, KummerEtale.trivialLog, KummerEtale.baseChange,
    KummerEtale.trivialLog_eq, KummerEtale.kummerType_nat, KummerEtale.empty
* PR.8/log-scheme-vs-log-adic-kummer (lemma)
* PR.8/affine-kummer-etale-comparison (theorem)
* PR.8/log-diamond (definition): LogDiamond, LogDiamond.saturation, LogDiamond.ofLogAdicSpace,
    LogDiamond.trivial
* PR.8/log-diamond-generic-fibre (construction): LogDiamond.genericFibre, LogDiamond.ofHuberPair,
    LogDiamond.genericFibre_map, LogDiamond.genericFibre_affine
* PR.8/stdisc-log-perfectoid (definition): LogPerfectoid.of_divisible, LogPerfectoid.trivial,
    LogPerfectoid.compat_D1
* PR.8/quasi-pro-kummer-etale-site (definition): QProKummerEtale.site,
    QProKummerEtale.pullbackSite, QProKummerEtale.trivialLog, QProKummerEtale.cohomology,
    QProKummerEtale.trivial
* PR.8/kummer-tower-covers (theorem)
* PR.8/kummer-etale-vs-qpket (theorem)
* PR.8/global-etale-comparison (theorem)
* PR.8/kummer-local-systems (definition): KummerLocalSystem, KummerLocalSystem.constant,
    KummerLocalSystem.pullback, KummerLocalSystem.tensor, KummerLocalSystem.trivialLog,
    KummerLocalSystem.constant_rank, KummerLocalSystem.zero, KummerLocalSystem.trivialLog_eq
* PR.8/laurent-f-crystal (definition): LaurentFCrystal, LaurentFCrystal.unit,
    LaurentFCrystal.tensor, LaurentFCrystal.pullback, LaurentFCrystal.etaleRealisation,
    LaurentFCrystal.unit_realisation, LaurentFCrystal.trivialLog, LaurentFCrystal.zero
* PR.8/laurent-f-crystals-local-systems (theorem)
* PR.8/smooth-proper-pushforward (theorem)
* PR.8/etale-comparison-over-ainf (theorem)
* PR.8/log-hyodo-kato-isomorphism (theorem)
* PR.8/log-prismatic-bkf-module (theorem)
* PR.8/semistable-chart-application (application)
-/
