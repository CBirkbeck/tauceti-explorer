import Mathlib.RingTheory.AdicCompletion.Completeness
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.RingTheory.Jacobson.Ideal
import Mathlib.RingTheory.Localization.AtPrime.Basic
import Mathlib.Data.Nat.Prime.Int
import Mathlib.RingTheory.Localization.Basic
import Mathlib.RingTheory.Localization.FractionRing
import Mathlib.Data.Nat.Choose.Dvd
import Mathlib.Data.Nat.Choose.Sum
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.RingTheory.WittVector.Truncated
import Mathlib.RingTheory.WittVector.WittPolynomial
import Mathlib.RingTheory.Ideal.Quotient.Operations

/-!
This is not the roadmap and is not exhaustive. PrismaticCohomology--PR.0.md
is definitive. These are suggested signatures, API and tests, not an
implementation claim. The full file elaborates at the pins with proof-placeholder warnings only.
The existing ring, square-zero and truncated Witt carriers are reused.
The algebraic delta axioms work over any commutative ring; the prismatic
consumers retain the source's p-local hypotheses. No prism is defined here.
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
