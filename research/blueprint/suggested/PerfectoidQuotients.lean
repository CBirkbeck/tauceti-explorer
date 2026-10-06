import Mathlib.RingTheory.Perfectoid.FontaineTheta
import Mathlib.RingTheory.WittVector.Complete
import Mathlib.RingTheory.Ideal.Quotient.Nilpotent
import Mathlib.FieldTheory.PerfectClosure
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.RingTheory.WittVector.TeichmullerSeries
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.RingTheory.AdicCompletion.Algebra
import Mathlib.RingTheory.AdicCompletion.Exactness
import Mathlib.RingTheory.IntegralClosure.Algebra.Basic
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.Algebra.Polynomial.Eval.Defs

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These statements suggest Lean forms so that contributors and
reviewers converge on names and signatures. This is a suggested API, not an
implementation. Every proof is a placeholder.
Do not merge this file into Mathlib or Tau Ceti as a completed development.
The signatures below use the pinned libraries' actual rings, ideals, quotients,
Witt vectors and perfection. The omitted prismatic, derived, almost and analytic signatures are listed
explicitly at the end. Comments there do not count as typed signatures.
-/

noncomputable section
universe u v
namespace TauCeti.PerfectoidQuotients

variable (p : ℕ) [Fact p.Prime]

/-- BMS2 Definition 4.18, with an explicit zero-ring branch because the pinned
PreTilt ring instance and Fontaine map require that p is not a unit. -/
-- PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings
def IsIntegralPerfectoid (R : Type u) [CommRing R] : Prop :=
  Subsingleton R ∨ ∃ hnu : ¬ IsUnit (p : R),
    ∃ hc : IsAdicComplete (Ideal.span {(p : R)}) R,
      letI : Fact (¬ IsUnit (p : R)) := ⟨hnu⟩
      letI : IsAdicComplete (Ideal.span {(p : R)}) R := hc
      (∃ π : R, ∃ a : Rˣ, π ^ p = (p : R) * a) ∧
      Function.Surjective (frobenius (ModP R p) p) ∧
      ∃ ξ : WittVector p (PreTilt R p),
        RingHom.ker (WittVector.fontaineTheta R p) = Ideal.span {ξ}

variable (R : Type u) [CommRing R]

theorem IsIntegralPerfectoid.of_subsingleton [Subsingleton R] :
    IsIntegralPerfectoid p R := by sorry

theorem IsIntegralPerfectoid.complete (h : IsIntegralPerfectoid p R) :
    IsAdicComplete (Ideal.span {(p : R)}) R := by sorry

theorem IsIntegralPerfectoid.has_p_root (h : IsIntegralPerfectoid p R) :
    ∃ π : R, ∃ a : Rˣ, π ^ p = (p : R) * a := by sorry

-- PerfectoidQuotients:Q0:integral-algebra/integral-perfectoid-nontrivial-criterion
theorem IsIntegralPerfectoid.iff_nontrivial
    [Fact (¬ IsUnit (p : R))] [IsAdicComplete (Ideal.span {(p : R)}) R] :
    IsIntegralPerfectoid p R ↔
      (∃ π : R, ∃ a : Rˣ, π ^ p = (p : R) * a) ∧
      Function.Surjective (frobenius (ModP R p) p) ∧
      ∃ ξ : WittVector p (PreTilt R p),
        RingHom.ker (WittVector.fontaineTheta R p) = Ideal.span {ξ} := by sorry

-- A degenerate ring, a positive field example, and two independent non-examples.
-- TauCeti.PerfectoidQuotients.zeroRing
example : IsIntegralPerfectoid p (ZMod 1) := by sorry
-- TauCeti.PerfectoidQuotients.primeField
example : IsIntegralPerfectoid p (ZMod p) := by sorry
-- TauCeti.PerfectoidQuotients.zmodFour
example : ¬ IsIntegralPerfectoid 2 (ZMod 4) := by sorry
-- TauCeti.PerfectoidQuotients.polynomial
example : ¬ IsIntegralPerfectoid 2 (Polynomial (ZMod 2)) := by sorry
-- TauCeti.PerfectoidQuotients.dualNumbers
example : ¬ IsIntegralPerfectoid 2 (TrivSqZeroExt (ZMod 2) (ZMod 2)) := by sorry
-- Omitting the principal-kernel clause would accept this semiperfect quotient.
-- TauCeti.PerfectoidQuotients.semiperfectNotPerfect
example : ¬ IsIntegralPerfectoid 2
    (PerfectClosure (Polynomial (ZMod 2)) 2 ⧸
      Ideal.span {PerfectClosure.of (Polynomial (ZMod 2)) 2 Polynomial.X}) := by sorry
-- TauCeti.PerfectoidQuotients.semiperfectSquaring
example : Function.Surjective (fun x :
    PerfectClosure (Polynomial (ZMod 2)) 2 ⧸
      Ideal.span {PerfectClosure.of (Polynomial (ZMod 2)) 2 Polynomial.X} => x ^ 2) := by sorry

section Units
variable [hchar : CharP R p]
include hchar

-- BMS1 Lemma 3.10: detection in the inverse perfection, not direct perfection.
-- PerfectoidQuotients:Q0:integral-algebra/inverse-perfection-unit-criterion
theorem perfection_isUnit_iff (x : Perfection R p) :
    IsUnit x ↔ IsUnit (Perfection.coeff R p 0 x) := by sorry

-- General-ring replacement for the pinned field-only Witt unit criterion.
-- PerfectoidQuotients:Q0:integral-algebra/perfect-witt-unit-criterion
theorem witt_isUnit_iff [PerfectRing R p] (x : WittVector p R) :
    IsUnit x ↔ IsUnit (x.coeff 0) := by sorry

-- PerfectoidQuotients:Q0:integral-algebra/witt-product-first-coordinate
theorem witt_mul_coeff_one (x y : WittVector p R) :
    (x * y).coeff 1 = x.coeff 0 ^ p * y.coeff 1 +
      x.coeff 1 * y.coeff 0 ^ p := by sorry

-- TauCeti.PerfectoidQuotients.wittPNonunit
example [PerfectRing R p] : ¬ IsUnit (p : WittVector p R) := by sorry
-- TauCeti.PerfectoidQuotients.wittOnePlusPUnit
example [PerfectRing R p] : IsUnit (1 + p : WittVector p R) := by sorry
-- TauCeti.PerfectoidQuotients.tiltUnit
example (x : Perfection R p) (h : Perfection.coeff R p 0 x = 1) :
    IsUnit x := by sorry
end Units

section CharacteristicP
variable [hchar : CharP R p] [Fact (¬ IsUnit (p : R))]
variable [IsAdicComplete (Ideal.span {(p : R)}) R]
include hchar

-- The theta modulo p formula is the existing WittVector.mk_fontaineTheta.

-- PerfectoidQuotients:Q0:integral-algebra/theta-kernel-characteristic-p
theorem theta_kernel_charP
    (h : ∃ ξ : WittVector p (PreTilt R p),
      RingHom.ker (WittVector.fontaineTheta R p) = Ideal.span {ξ}) :
    RingHom.ker (WittVector.fontaineTheta R p) =
      Ideal.span {(p : WittVector p (PreTilt R p))} := by sorry

-- PerfectoidQuotients:Q0:integral-algebra/tilt-projection-injective-characteristic-p
theorem tilt_projection_injective_charP
    (h : ∃ ξ : WittVector p (PreTilt R p),
      RingHom.ker (WittVector.fontaineTheta R p) = Ideal.span {ξ}) :
    Function.Injective (PreTilt.coeff (O := R) (p := p) 0) := by sorry

end CharacteristicP

section Naturality
variable [Fact (¬ IsUnit (p : R))]
variable [IsAdicComplete (Ideal.span {(p : R)}) R]
variable (S : Type v) [CommRing S] [Fact (¬ IsUnit (p : S))]
variable [IsAdicComplete (Ideal.span {(p : S)}) S]
variable (f : R →+* S) (g : ModP R p →+* ModP S p)
variable (hg : g.comp (Ideal.Quotient.mk (Ideal.span {(p : R)})) =
  (Ideal.Quotient.mk (Ideal.span {(p : S)})).comp f)
include hg

-- PerfectoidQuotients:Q0:integral-algebra/untilt-naturality
theorem untilt_natural (x : PreTilt R p) :
    f x.untilt = PreTilt.untilt (O := S) (p := p) (Perfection.map p g x) := by sorry

-- PerfectoidQuotients:Q0:integral-algebra/theta-naturality
theorem theta_natural (x : WittVector p (PreTilt R p)) :
    f (WittVector.fontaineTheta R p x) =
      WittVector.fontaineTheta S p (WittVector.map (Perfection.map p g) x) := by sorry
end Naturality

-- PerfectoidQuotients:Q0:integral-algebra/integral-perfectoid-ring-equivalence
theorem IsIntegralPerfectoid.congr (S : Type v) [CommRing S] (e : R ≃+* S) :
    IsIntegralPerfectoid p R ↔ IsIntegralPerfectoid p S := by sorry

-- PerfectoidQuotients:Q0:integral-algebra/characteristic-p-perfectoid-criterion
theorem integralPerfectoid_iff_perfect [CharP R p] :
    IsIntegralPerfectoid p R ↔ PerfectRing R p := by sorry

-- Stronger testing of the definition: a non-field perfect ring is included.
-- TauCeti.PerfectoidQuotients.productField
example : IsIntegralPerfectoid p (ZMod p × ZMod p) := by sorry
-- TauCeti.PerfectoidQuotients.perfectRingAgreement
example [CharP R p] [PerfectRing R p] : IsIntegralPerfectoid p R := by sorry

section Quotients
variable [hchar : CharP R p]
include hchar

omit hchar in
-- PerfectoidQuotients:Q4/quotient-frobenius-surjective
theorem quotient_pow_surjective (h : Function.Surjective (fun x : R => x ^ p))
    (I : Ideal R) : Function.Surjective (fun x : R ⧸ I => x ^ p) := by sorry

-- PerfectoidQuotients:Q4/perfect-quotient-radical-criterion
theorem quotient_perfect_iff_radical [PerfectRing R p] (I : Ideal R) :
    PerfectRing (R ⧸ I) p ↔ I.IsRadical := by sorry

-- PerfectoidQuotients:Q4/radical-quotient-integral-perfectoid
theorem radical_quotient_integralPerfectoid [PerfectRing R p] (I : Ideal R) :
    IsIntegralPerfectoid p (R ⧸ I.radical) := by sorry

-- PerfectoidQuotients:Q4/characteristic-p-perfectoidization-universal
theorem radical_quotient_universal [PerfectRing R p] (I : Ideal R)
    (T : Type v) [CommRing T] (hT : IsIntegralPerfectoid p T)
    (f : R →+* T) (hf : I ≤ RingHom.ker f) :
    ∃! g : R ⧸ I.radical →+* T, g.comp (Ideal.Quotient.mk I.radical) = f := by sorry

-- The quotient need not have characteristic exactly p: I = top gives zero.
-- TauCeti.PerfectoidQuotients.topQuotient
example [PerfectRing R p] : IsIntegralPerfectoid p (R ⧸ (⊤ : Ideal R)) := by sorry
-- TauCeti.PerfectoidQuotients.zeroQuotient
example [PerfectRing R p] : IsIntegralPerfectoid p (R ⧸ (⊥ : Ideal R)) := by sorry
-- TauCeti.PerfectoidQuotients.nonradicalQuotient
example [PerfectRing R p] (I : Ideal R) (h : ¬ I.IsRadical) :
    ¬ PerfectRing (R ⧸ I) p := by sorry

-- Single-step roots and their ideal, on an existing perfect ring.
-- PerfectoidQuotients:Q4/compatible-root-ideal-radical
theorem root_span_eq_radical [PerfectRing R p] (f : R) :
    Ideal.span (Set.range (fun n : ℕ => ((frobeniusEquiv R p).symm^[n]) f)) =
      (Ideal.span {f}).radical := by sorry

-- PerfectoidQuotients:Q4/integral-perfectoid-quotient-radical-criterion
theorem quotient_perfectoid_iff_radical [PerfectRing R p] (I : Ideal R) :
    IsIntegralPerfectoid p (R ⧸ I) ↔ I.IsRadical := by sorry

-- TauCeti.PerfectoidQuotients.rootZero
example [PerfectRing R p] :
    Ideal.span (Set.range (fun n : ℕ => ((frobeniusEquiv R p).symm^[n]) (0 : R))) = ⊥ := by sorry
-- TauCeti.PerfectoidQuotients.rootOne
example [PerfectRing R p] :
    Ideal.span (Set.range (fun n : ℕ => ((frobeniusEquiv R p).symm^[n]) (1 : R))) = ⊤ := by sorry
-- TauCeti.PerfectoidQuotients.rootKilled
example [PerfectRing R p] (f : R) (n : ℕ) :
    Ideal.Quotient.mk (Ideal.span {f}).radical
      (((frobeniusEquiv R p).symm^[n]) f) = 0 := by sorry
end Quotients

end TauCeti.PerfectoidQuotients

/-! Retained elementary Witt-quotient bounded-torsion signatures. -/

namespace TauCeti.Perfectoid

variable (p : ℕ) [Fact p.Prime]
variable {k : Type*} [CommRing k] [CharP k p] [PerfectRing k p]

/-- The first Witt coordinate of xi must be a unit; no condition on xi_0. -/
theorem witt_p_sq_dvd_mul_detects_p (xi g : WittVector p k)
    (hxi : IsUnit (xi.coeff 1))
    (h : (p : WittVector p k) ^ 2 ∣ xi * g) :
    (p : WittVector p k) ∣ g := by sorry

/-- A principal Witt ideal with the stated coefficient condition is p-saturated
after one multiplication by p, without assuming xi is a nonzerodivisor. -/
theorem witt_principal_p_saturation (xi f : WittVector p k)
    (hxi : IsUnit (xi.coeff 1))
    (h : (p : WittVector p k) ^ 2 * f ∈ Ideal.span {xi}) :
    (p : WittVector p k) * f ∈ Ideal.span {xi} := by sorry

/-- All p-power torsion in this quotient is killed by p. -/
theorem witt_principal_quotient_p_torsion (xi : WittVector p k)
    (hxi : IsUnit (xi.coeff 1)) (n : ℕ)
    (x : WittVector p k ⧸ Ideal.span {xi})
    (hx : (p : WittVector p k ⧸ Ideal.span {xi}) ^ n * x = 0) :
    (p : WittVector p k ⧸ Ideal.span {xi}) * x = 0 := by sorry

-- Acceptance: xi=p detects exactly ordinary divisibility by p.
-- witt_torsion_prime_detection
example (g : WittVector p k) :
    ((p : WittVector p k) ^ 2 ∣ (p : WittVector p k) * g) ↔
      (p : WittVector p k) ∣ g := by sorry

-- Acceptance: the quotient by p is killed by p, with no domain assumption on k.
-- witt_torsion_quotient_by_prime
example (x : WittVector p k ⧸ Ideal.span {(p : WittVector p k)}) :
    (p : WittVector p k ⧸ Ideal.span {(p : WittVector p k)}) * x = 0 := by sorry

-- Negative control: omitting the first-coordinate condition admits W(F_2)/(4).
-- witt_torsion_hypothesis_required
example [Fact (Nat.Prime 2)] :
    let A := WittVector 2 (ZMod 2)
    let I : Ideal A := Ideal.span {(2 : A) ^ 2}
    (2 : A ⧸ I) ^ 2 * (1 : A ⧸ I) = 0 ∧
      (2 : A ⧸ I) * (1 : A ⧸ I) ≠ 0 := by sorry

end TauCeti.Perfectoid

namespace TauCeti.PerfectoidQuotients
noncomputable section
variable (p : ℕ) [Fact p.Prime]

/-- Concrete ordinary-module criterion of Stacks 091P(7).
DD.1 owns derived completeness; this private specialization exposes no second generic API. -/
private def pCompletionTowerMap (S : Type u) [CommRing S] (a : ℕ → S) : ℕ → S :=
  fun n => a n - (p : S) * a (n + 1)

-- PerfectoidQuotients:Q2/semiperfectoid-rings
/-- A fixed universe for presentations. Enlarge it using a universe lift when necessary. -/
def IsSemiperfectoid (S : Type u) [CommRing S] : Prop :=
  Function.Bijective (pCompletionTowerMap p S) ∧
  ∃ (R : Type u) (_ : CommRing R), IsIntegralPerfectoid p R ∧
    ∃ f : R →+* S, Function.Surjective f

variable (S : Type u) [CommRing S]
theorem IsSemiperfectoid.presentation (h : IsSemiperfectoid p S) :
    ∃ (R : Type u) (_ : CommRing R), IsIntegralPerfectoid p R ∧
      ∃ f : R →+* S, Function.Surjective f := by sorry

theorem IsSemiperfectoid.derived_complete (h : IsSemiperfectoid p S) :
    Function.Bijective (pCompletionTowerMap p S) := by sorry

theorem IsSemiperfectoid.of_perfectoid (h : IsIntegralPerfectoid p S) :
    IsSemiperfectoid p S := by sorry

theorem IsSemiperfectoid.congr (T : Type u) [CommRing T] (e : S ≃+* T) :
    IsSemiperfectoid p S ↔ IsSemiperfectoid p T := by sorry

-- The API is the comparison of completeness predicates, with the torsion bound explicit.
theorem IsSemiperfectoid.classically_complete_of_bounded
    (hb : ∃ n : ℕ, ∀ m : ℕ, ∀ x : S, (p : S) ^ m * x = 0 → (p : S) ^ n * x = 0) :
    Function.Bijective (pCompletionTowerMap p S) ↔
      IsAdicComplete (Ideal.span {(p : S)}) S := by sorry

-- TauCeti.PerfectoidQuotients.semiperfectoidZero
example : IsSemiperfectoid p (ZMod 1) := by sorry
-- TauCeti.PerfectoidQuotients.semiperfectoidRootQuotient
example :
    let A := PerfectClosure (Polynomial (ZMod 2)) 2
    let I := Ideal.span {PerfectClosure.of (Polynomial (ZMod 2)) 2 Polynomial.X}
    IsSemiperfectoid 2 (A ⧸ I) ∧ ¬ IsIntegralPerfectoid 2 (A ⧸ I) := by sorry
-- TauCeti.PerfectoidQuotients.semiperfectoidIdentity
example (h : IsIntegralPerfectoid p S) : IsSemiperfectoid p S := by sorry
-- TauCeti.PerfectoidQuotients.semiperfectoidPolynomialFails
example : ¬ IsSemiperfectoid p (Polynomial (ZMod p)) := by sorry

/-- This bundle states the actual integral predicate and actual universal property.
Its existence is the construction theorem, whose proof remains a placeholder.
It contains no unspecified prism or derived predicate. -/
structure PerfectoidizationData where
  Carrier : Type u
  [ring : CommRing Carrier]
  eta : S →+* Carrier
  isPerfectoid : IsIntegralPerfectoid p Carrier
  universal : ∀ (T : Type u) [CommRing T], IsIntegralPerfectoid p T →
    ∀ f : S →+* T, ∃! g : Carrier →+* T, g.comp eta = f
attribute [instance] PerfectoidizationData.ring

-- PerfectoidQuotients:Q2/universal-perfectoidization
theorem existsPerfectoidization (h : IsSemiperfectoid p S) :
    Nonempty (PerfectoidizationData p S) := by sorry

private def perfectoidizationData (h : IsSemiperfectoid p S) : PerfectoidizationData p S :=
  Classical.choice (existsPerfectoidization p S h)

def perfectoidization (h : IsSemiperfectoid p S) : Type u :=
  (perfectoidizationData p S h).Carrier

instance perfectoidization.commRing (h : IsSemiperfectoid p S) :
    CommRing (perfectoidization p S h) :=
  (perfectoidizationData p S h).ring

def perfectoidization.eta (h : IsSemiperfectoid p S) : S →+* perfectoidization p S h :=
  (perfectoidizationData p S h).eta

theorem perfectoidization.isIntegralPerfectoid (h : IsSemiperfectoid p S) :
    IsIntegralPerfectoid p (perfectoidization p S h) := by sorry

def perfectoidization.lift (h : IsSemiperfectoid p S) (T : Type u) [CommRing T]
    (hT : IsIntegralPerfectoid p T) (f : S →+* T) : perfectoidization p S h →+* T :=
  Classical.choose ((perfectoidizationData p S h).universal T hT f)

theorem perfectoidization.lift_eta (h : IsSemiperfectoid p S) (T : Type u) [CommRing T]
    (hT : IsIntegralPerfectoid p T) (f : S →+* T) :
    (perfectoidization.lift p S h T hT f).comp (perfectoidization.eta p S h) = f := by sorry

theorem perfectoidization.lift_unique (h : IsSemiperfectoid p S) (T : Type u) [CommRing T]
    (hT : IsIntegralPerfectoid p T) (g₁ g₂ : perfectoidization p S h →+* T)
    (he : g₁.comp (perfectoidization.eta p S h) = g₂.comp (perfectoidization.eta p S h)) :
    g₁ = g₂ := by sorry

def perfectoidization.map (h : IsSemiperfectoid p S) (T : Type u) [CommRing T]
    (hT : IsSemiperfectoid p T) (f : S →+* T) :
    perfectoidization p S h →+* perfectoidization p T hT :=
  perfectoidization.lift p S h _ (perfectoidization.isIntegralPerfectoid p T hT)
    ((perfectoidization.eta p T hT).comp f)

theorem perfectoidization.map_eta (h : IsSemiperfectoid p S) (T : Type u) [CommRing T]
    (hT : IsSemiperfectoid p T) (f : S →+* T) :
    (perfectoidization.map p S h T hT f).comp (perfectoidization.eta p S h) =
      (perfectoidization.eta p T hT).comp f := by sorry

theorem perfectoidization.map_id (h : IsSemiperfectoid p S) :
    perfectoidization.map p S h S h (RingHom.id S) = RingHom.id _ := by sorry

theorem perfectoidization.map_comp (h : IsSemiperfectoid p S)
    (T U : Type u) [CommRing T] [CommRing U]
    (hT : IsSemiperfectoid p T) (hU : IsSemiperfectoid p U)
    (f : S →+* T) (g : T →+* U) :
    perfectoidization.map p S h U hU (g.comp f) =
      (perfectoidization.map p T hT U hU g).comp (perfectoidization.map p S h T hT f) := by sorry

theorem perfectoidization.of_perfectoid (h : IsIntegralPerfectoid p S) :
    ∃ e : S ≃+* perfectoidization p S (IsSemiperfectoid.of_perfectoid p S h),
      e.toRingHom = perfectoidization.eta p S (IsSemiperfectoid.of_perfectoid p S h) := by sorry

theorem perfectoidization.presentation_independent (h : IsSemiperfectoid p S)
    (E : PerfectoidizationData p S) :
    ∃! e : perfectoidization p S h ≃+* E.Carrier,
      e.toRingHom.comp (perfectoidization.eta p S h) = E.eta := by sorry

-- TauCeti.PerfectoidQuotients.perfectoidizationZero
example (h : IsSemiperfectoid p (ZMod 1)) :
    Function.Bijective (perfectoidization.eta p (ZMod 1) h) := by sorry
-- TauCeti.PerfectoidQuotients.perfectoidizationPerfect
example (h : IsIntegralPerfectoid p S) :
    Function.Bijective (perfectoidization.eta p S (IsSemiperfectoid.of_perfectoid p S h)) := by sorry
-- TauCeti.PerfectoidQuotients.perfectoidizationRootQuotient
example :
    let A := PerfectClosure (Polynomial (ZMod 2)) 2
    let I := Ideal.span {PerfectClosure.of (Polynomial (ZMod 2)) 2 Polynomial.X}
    ∀ h : IsSemiperfectoid 2 (A ⧸ I),
      (∃ e : perfectoidization 2 (A ⧸ I) h ≃+* A ⧸ I.radical,
        e.toRingHom.comp (perfectoidization.eta 2 (A ⧸ I) h) =
          Ideal.quotientMap I.radical (RingHom.id A) (by sorry)) ∧
      ¬ Function.Injective (perfectoidization.eta 2 (A ⧸ I) h) := by sorry
-- TauCeti.PerfectoidQuotients.perfectoidizationTwoPresentations
example (h : IsSemiperfectoid p S) (E₁ E₂ : PerfectoidizationData p S) :
    ∃! e : E₁.Carrier ≃+* E₂.Carrier, e.toRingHom.comp E₁.eta = E₂.eta := by sorry

-- PerfectoidQuotients:Q4/surjectivity-of-perfectoidization
-- G5 and G6 are proof obligations, not hypotheses smuggled into the target signature.
theorem perfectoidization_surjective (h : IsSemiperfectoid p S) :
    Function.Surjective (perfectoidization.eta p S h) := by sorry

-- PerfectoidQuotients:Q0:integral-algebra/p-integral-closure
/-- The infimum formulation equals the successive root-adjunction union. -/
def pIntegralClosure (B : Type u) [CommRing B] (A : Subring B) : Subring B :=
  sInf {C : Subring B | A ≤ C ∧ ∀ b : B, b ^ p ∈ C → b ∈ C}

variable (B : Type u) [CommRing B] (A : Subring B)
theorem pIntegralClosure.le : A ≤ pIntegralClosure p B A := by sorry

theorem pIntegralClosure.isClosed (b : B) (h : b ^ p ∈ pIntegralClosure p B A) :
    b ∈ pIntegralClosure p B A := by sorry

theorem pIntegralClosure.minimal (C : Subring B) (hAC : A ≤ C)
    (hC : ∀ b : B, b ^ p ∈ C → b ∈ C) : pIntegralClosure p B A ≤ C := by sorry

theorem pIntegralClosure.idempotent :
    pIntegralClosure p B (pIntegralClosure p B A) = pIntegralClosure p B A := by sorry

theorem pIntegralClosure.mono (C : Subring B) (hAC : A ≤ C) :
    pIntegralClosure p B A ≤ pIntegralClosure p B C := by sorry

theorem pIntegralClosure.le_integralClosure (hp : p.Prime) :
    pIntegralClosure p B A ≤ (integralClosure A B).toSubring := by sorry

-- TauCeti.PerfectoidQuotients.pClosureIdentity
example (h : ∀ b : B, b ^ p ∈ A → b ∈ A) : pIntegralClosure p B A = A := by sorry
-- TauCeti.PerfectoidQuotients.pClosureZero
example : pIntegralClosure p (ZMod 1) ⊥ = ⊤ := by sorry

private def powerPolynomialSubring (n : ℕ) : Subring (Polynomial (ZMod 2)) :=
  (Polynomial.eval₂RingHom (Polynomial.C : ZMod 2 →+* Polynomial (ZMod 2))
    (Polynomial.X ^ n)).range

-- TauCeti.PerfectoidQuotients.pClosureRoot
example : pIntegralClosure 2 (Polynomial (ZMod 2)) (powerPolynomialSubring 2) = ⊤ := by sorry
-- TauCeti.PerfectoidQuotients.pClosureNotOrdinary
example :
    pIntegralClosure 2 (Polynomial (ZMod 2)) (powerPolynomialSubring 3) =
      powerPolynomialSubring 3 ∧
    (integralClosure (powerPolynomialSubring 3) (Polynomial (ZMod 2))).toSubring = ⊤ ∧
    powerPolynomialSubring 3 ≠ ⊤ := by sorry

section AlgebraicTargets
variable (R : Type u) [CommRing R]
-- PerfectoidQuotients:Q0:integral-algebra/perfectoid-bounded-p-torsion
theorem perfectoid_p_torsion_killed_by_p (h : IsIntegralPerfectoid p R)
    (n : ℕ) (x : R) (hx : (p : R) ^ n * x = 0) : (p : R) * x = 0 := by sorry

-- PerfectoidQuotients:Q0:integral-algebra/perfectoid-rings-reduced
theorem integralPerfectoid_reduced (h : IsIntegralPerfectoid p R) : IsReduced R := by sorry

theorem compatible_root_annihilator (h : IsIntegralPerfectoid p R)
    (a : Perfection R p) (n : ℕ) (x : R) :
    a.val n * x = 0 ↔ a.val 0 * x = 0 := by sorry

theorem compatible_root_power_torsion (h : IsIntegralPerfectoid p R)
    (a : Perfection R p) (x : R) :
    (∃ n : ℕ, (a.val 0) ^ n * x = 0) ↔ a.val 0 * x = 0 := by sorry

-- PerfectoidQuotients:Q0:integral-algebra/products-of-perfectoid-rings
-- The Z_p action is unique on these p-complete rings; ordinary ring carriers suffice here.
theorem integralPerfectoid_pi_iff (ι : Type v) (A : ι → Type u) [∀ i, CommRing (A i)] :
    IsIntegralPerfectoid p (∀ i, A i) ↔ ∀ i, IsIntegralPerfectoid p (A i) := by sorry

-- PerfectoidQuotients:Q0:integral-algebra/torsion-free-perfectoid-quotient
-- Only its ordinary perfectoid/torsion-free conclusion is typed; tilt and fiber-product
-- identifications remain G1/G2 signatures because of completion-instance transport.
theorem perfectoid_torsion_free_quotient (h : IsIntegralPerfectoid p R)
    (π : R) (hπ : ∃ a : R, π ^ p * a = (p : R))
    [IsAdicComplete (Ideal.span {π}) R] :
    IsIntegralPerfectoid p (R ⧸ RingHom.ker (algebraMap R (Localization.Away π))) ∧
    ∀ x : R ⧸ RingHom.ker (algebraMap R (Localization.Away π)),
      Ideal.Quotient.mk _ π * x = 0 → x = 0 := by sorry

section Kernel
variable [Fact (¬ IsUnit (p : R))] [IsAdicComplete (Ideal.span {(p : R)}) R]
-- PerfectoidQuotients:Q0:integral-algebra/principal-theta-kernel-criterion
-- Nonzerodivisor conclusion only; the general ϖ-adic Frobenius equivalence is G1.
theorem principal_theta_kernel_criterion (h : IsIntegralPerfectoid p R)
    (ξ : WittVector p (PreTilt R p))
    (hξ : RingHom.ker (WittVector.fontaineTheta R p) = Ideal.span {ξ}) :
    ∀ x : WittVector p (PreTilt R p), ξ * x = 0 → x = 0 := by sorry

-- PerfectoidQuotients:Q0:integral-algebra/theta-generator-unit-coordinate
theorem theta_generator_iff_unit_coeff_one (h : IsIntegralPerfectoid p R)
    (ξ : WittVector p (PreTilt R p)) (hξ : ξ ∈ RingHom.ker (WittVector.fontaineTheta R p)) :
    RingHom.ker (WittVector.fontaineTheta R p) = Ideal.span {ξ} ↔ IsUnit (ξ.coeff 1) := by sorry

theorem theta_generator_nonzerodivisor (h : IsIntegralPerfectoid p R)
    (ξ : WittVector p (PreTilt R p))
    (hξ : RingHom.ker (WittVector.fontaineTheta R p) = Ideal.span {ξ}) :
    ∀ x : WittVector p (PreTilt R p), ξ * x = 0 → x = 0 := by sorry

-- PerfectoidQuotients:Q0:integral-algebra/compatible-roots-and-iterated-frobenius
-- The root-system monoid comparison is typed; its finite quotient/expansion clauses
-- require G1 and the missing finite-Witt interfaces of G2.
theorem perfectoid_compatible_roots_iterated_frobenius (h : IsIntegralPerfectoid p R) :
    ∃ e : Perfection R p ≃* PreTilt R p, ∀ a : Perfection R p, ∀ n : ℕ,
      PreTilt.coeff (O := R) (p := p) n (e a) =
        Ideal.Quotient.mk (Ideal.span {(p : R)}) (a.val n) := by sorry

-- PerfectoidQuotients:Q0:integral-algebra/completion-along-sharp-ideal
-- Ordinary conclusion only; derived equality and tilt comparison need supplier carriers.
theorem perfectoid_sharp_ideal_completion (h : IsIntegralPerfectoid p R)
    (r : ℕ) (a : Fin r → PreTilt R p) :
    IsIntegralPerfectoid p
      (AdicCompletion (Ideal.span (Set.range (fun i => (a i).untilt))) R) := by sorry
end Kernel
end AlgebraicTargets
end
end TauCeti.PerfectoidQuotients
namespace TauCeti.PerfectoidQuotients
noncomputable section
variable (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R]

/-- Representative formula for the cross-quotient p-power map.
The divisibility hypothesis in the theorem makes it independent of representatives. -/
private def quotientPowerMap (π : R) :
    R ⧸ Ideal.span {π} → R ⧸ Ideal.span {π ^ p} :=
  fun x => Ideal.Quotient.mk (Ideal.span {π ^ p}) (Quotient.out x ^ p)

-- PerfectoidQuotients:Q0:integral-algebra/p-integral-closedness-criterion
-- The localization criterion is typed; the completion clause remains G1.
theorem perfectoid_p_integral_closedness (π : R)
    (hπ : ∃ a : R, π ^ p * a = (p : R))
    (hreg : ∀ x : R, π * x = 0 → x = 0) :
    Function.Injective (quotientPowerMap p R π) ↔
      ∀ b : Localization.Away π,
        b ^ p ∈ (algebraMap R (Localization.Away π)).range →
        b ∈ (algebraMap R (Localization.Away π)).range := by sorry

-- PerfectoidQuotients:Q0:integral-algebra/completed-p-integral-closure-perfectoid
theorem completion_pIntegralClosure_perfectoid (π : R)
    (hπ : ∃ a : R, π ^ p * a = (p : R))
    (hreg : ∀ x : R, π * x = 0 → x = 0)
    (hroot : ∃ a : Perfection R p, a.val 0 = π)
    (hF : Function.Surjective (quotientPowerMap p R π)) :
    let C := pIntegralClosure p (Localization.Away π)
      (algebraMap R (Localization.Away π)).range
    ∃ t : C, (t : Localization.Away π) = algebraMap R (Localization.Away π) π ∧
      IsIntegralPerfectoid p (AdicCompletion (Ideal.span {t}) C) := by sorry

-- PerfectoidQuotients:Q0:integral-algebra/completed-root-stable-quotients
-- Compatible p-th roots in the set are the source's sufficient special case.
-- The general modulo-ϖ^n ideal-power condition and tilt formula are signature gaps G2.
theorem perfectoid_completed_root_quotient (h : IsIntegralPerfectoid p R)
    (π : R) (hπ : ∃ a : R, π ^ p * a = (p : R))
    [IsAdicComplete (Ideal.span {π}) R] (s : Set R)
    (hs : ∀ x ∈ s, ∃ y ∈ s, y ^ p = x) :
    IsIntegralPerfectoid p
      (AdicCompletion (Ideal.span {Ideal.Quotient.mk (Ideal.span s) π})
        (R ⧸ Ideal.span s)) := by sorry

-- PerfectoidQuotients:Q4/principal-root-quotient-perfectoidization
-- The completed quotient and its unit are actual carriers and maps.
-- Surjectivity uses the baseline AdicCompletion.map_surjective and map_of.
theorem principal_root_quotient_perfectoidization (h : IsIntegralPerfectoid p R)
    (a : Perfection R p)
    (hS : IsSemiperfectoid p (R ⧸ Ideal.span {a.val 0})) :
    let I := Ideal.span (Set.range a.val)
    let C := AdicCompletion (Ideal.span {(p : R ⧸ I)}) (R ⧸ I)
    IsIntegralPerfectoid p C ∧
    ∃ e : perfectoidization p (R ⧸ Ideal.span {a.val 0}) hS ≃+* C,
      e.toRingHom.comp (perfectoidization.eta p _ hS) =
        (algebraMap (R ⧸ I) C).comp
          (Ideal.quotientMap I (RingHom.id R) (by sorry)) ∧
      Function.Surjective (perfectoidization.eta p _ hS) := by sorry
end
end TauCeti.PerfectoidQuotients

/-! Explicit signature omissions and import boundaries (PROTOCOL §13).
These comments preserve the exact proposed names and mathematical statements.
They are not typed signatures and are excluded from elaborated-signature counts.

PerfectoidQuotients:Q0:animated-application/prism-and-animation-import-contract [import]
Supplier application: Q0 imports δ-rings and their free and universal quotient constructions; prisms with an invertible Cartier ideal, derived (p,I)-completeness and p in I+φ(I); boundedness, orientations and rigidity J=IB; completed perfection and the equivalence (A,I) ↦ A/I with integral perfectoid rings. It also imports regular prismatic envelopes with their boundedness, complete-flatness and Koszul-regularity hypotheses. For integral perfectoid R, (A_inf(R),ker θ) is initial among all prisms under R (BS22 Lemma 4.8), not only bounded prisms. Animated commutative rings, the cotangent complex, derived exterior powers and derived completion are imported on their genuine simplicial/derived carriers.
Application/reexport only. All generic declarations retain the exact supplier names listed in prerequisites; this file defines no second generic carrier.
Imports: PrismaticCohomology:PR.0/delta-frobenius-dictionary, PrismaticCohomology:PR.0/free-delta-ring, PrismaticCohomology:PR.0/delta-ideal-closure, PrismaticCohomology:PR.0/delta-universal-quotient, PrismaticCohomology:PR.0/distinguished-element, PrismaticCohomology:PR.0/prism, PrismaticCohomology:PR.0/prism-category, PrismaticCohomology:PR.0/rigidity-prism-ideal, PrismaticCohomology:PR.0/prism-perfection, PrismaticCohomology:PR.0/perfect-prisms-perfectoid-rings, PrismaticCohomology:PR.0/regular-prismatic-envelopes, PrismaticCohomology:PR.0/perfectoid-tor-independence, PrismaticCohomology:PR.1/perfect-prism-initial, EnhancedDerivedSheaves:E5:animation/animated-commutative-rings, EnhancedDerivedSheaves:E5:animation/universal-property-of-animation, EnhancedDerivedSheaves:E5:animation/sifted-colimits, DerivedDeRhamCohomology:DD.0/cotangent-complex, DerivedDeRhamCohomology:DD.0/derived-exterior-powers, DerivedDeRhamCohomology:DD.1/derived-completion, PrismaticCohomology:PR.0/bounded-prism-complete-flatness

PerfectoidQuotients:Q1/smooth-prismatic-hodge-tate-reexport [import]
Supplier application: For a bounded prism (A,I) and a p-completely smooth A/I-algebra R, Q1 reexports PR.1: the relative site, (p,I)-completely faithfully flat coverings, structure sheaf, derived cohomology Δ_R/A, Čech–Alexander models independent of polynomial presentation and the semilinear Frobenius. Its Hodge–Tate reduction has the multiplicative comparison Ω^i_R/(A/I){−i} ≅ H^i(Δ_R/A ⊗^L_A A/I), with the Breuil–Kisin twists and Bockstein de Rham differential of Theorem 6.3. The crystalline and de Rham comparisons, polynomial calculations, gluing and the stated completed base-change laws are supplier interfaces. PR.3 owns the étale comparison; Q1 reexports the listed PR.1 constructions.
Application/reexport only. All generic declarations retain the exact supplier names listed in prerequisites; this file defines no second generic carrier.
Imports: PrismaticCohomology:PR.1/relative-prismatic-site, PrismaticCohomology:PR.1/prismatic-structure-sheaf, PrismaticCohomology:PR.1/relative-prismatic-cohomology, PrismaticCohomology:PR.1/change-of-topology, PrismaticCohomology:PR.1/cech-alexander-complex, PrismaticCohomology:PR.1/cech-alexander-computes-cohomology, PrismaticCohomology:PR.1/frobenius-on-prismatic-cohomology, PrismaticCohomology:PR.1/hodge-tate-cohomology, PrismaticCohomology:PR.1/bockstein-differential, PrismaticCohomology:PR.1/crystalline-comparison, PrismaticCohomology:PR.1/crystalline-comparison-syntomic, PrismaticCohomology:PR.1/hodge-tate-comparison-map, PrismaticCohomology:PR.1/hodge-tate-comparison, PrismaticCohomology:PR.1/prismatic-base-change, PrismaticCohomology:PR.1/de-rham-comparison

PerfectoidQuotients:Q2/initial-prism-of-a-semiperfectoid-ring [omitted]
TauCeti.PerfectoidQuotients.initialPrism: For a semiperfectoid S, the category of all prisms (A,I) with a map S → A/I has an initial object (Δ_init(S),I_S). The ideal I_S is principal. There is a structure map S → Δ_init(S)/I_S, and every prism under S receives a unique compatible δ-map. The result makes no boundedness assertion. For a chosen presentation R ↠ S and d generating ker θ_R, the ideal is the image of (d); the resulting initial object is independent of both choices.
PR.0 has no implemented prism/δ-map carrier at the pin. The transfinite torsion-killing, H⁰-completion and stationary universal object require the supplier completion/animation interfaces and cardinal argument.
API TauCeti.PerfectoidQuotients.initialPrism.structureMap (projection): The canonical ring map S → Δ_init(S)/I_S.
API TauCeti.PerfectoidQuotients.initialPrism.ideal_principal (structure): I_S is generated by the image of the chosen d.
API TauCeti.PerfectoidQuotients.initialPrism.lift (universal-property): Every prism C under S receives the unique compatible δ-map Δ_init(S) → C.
API TauCeti.PerfectoidQuotients.initialPrism.lift_unique (extensionality): Two compatible prism maps out of Δ_init(S) are equal.
API TauCeti.PerfectoidQuotients.initialPrism.map (functoriality): A map of semiperfectoid rings gives a map of initial prisms; identity and composition are preserved.
API TauCeti.PerfectoidQuotients.initialPrism.presentation_independent (equivalence): Any two quotient presentations give uniquely isomorphic initial prisms over S.
TEST TauCeti.PerfectoidQuotients.initialPrismPerfectoid (compatibility): For integral perfectoid S, recover (A_inf(S),ker θ_S) via PR.1 Lemma 4.8.
TEST TauCeti.PerfectoidQuotients.initialPrismZero (degenerate): For S=0 the initial prism is the trivial prism.
TEST TauCeti.PerfectoidQuotients.initialPrismQrsp (compatibility): For QRSP S use PR.2/qrsp-prism to identify Δ_init(S) with derived prismatic cohomology.
TEST TauCeti.PerfectoidQuotients.initialPrismFp (computation): For S=F_p, the initial prism is (W(F_p),(p)), canonically identified with (ℤ_p,(p)); its reduction map is the identity of F_p.

PerfectoidQuotients:Q2/universal-perfectoidization [restricted]
TauCeti.PerfectoidQuotients.perfectoidization: For semiperfectoid S there is an integral perfectoid ring S_perfd and a map η_S:S → S_perfd initial among all maps from S to integral perfectoid rings: for every such T, composition with η_S is a bijection Hom(S_perfd,T) ≅ Hom(S,T). It is the reduction modulo I of the completed perfection of Δ_init(S), equivalently the p-completion of the uncompleted perfection modulo I. It depends only on S. This statement does not assert η_S is surjective; that is Q4.
The complete ring-valued universal property, naturality, all eight API items and four tests are typed. The initial-prism formula Δ_init(S)_perf/I and its identification with that chosen universal ring require the unavailable PR.0 prism carrier (G2); they are omitted.

PerfectoidQuotients:Q2/derived-prismatic-initiality-import-contract [import]
Supplier application: For a perfect prism base (A,I) and derived p-complete animated A/I-algebra S, import PR.2 Construction 7.6, the derived left Kan extension Δ_S/A, conjugate/Hodge–Tate filtration gr^i=(∧^i L_S/(A/I))^∧{−i}[−i], base change and Künneth. If the Hodge–Tate reduction Δ̄_S/A is concentrated in degree zero, PR.2 supplies discreteness and I-torsion-freeness of Δ_S/A, its δ-ring prism structure, weak initiality and an idempotent retraction onto the initial prism. Discreteness of Δ_S/A alone is not the supplier hypothesis, and automatic initiality is not asserted. The idempotent-retract lemma, the bounded-torsion Koszul-regular quotient envelope calculation, and the QRSP theorem identify the initial object in the respective cases. General site/derived agreement and quasisyntomic descent are imported with the exact stated hypotheses.
Application/reexport only. All generic declarations retain the exact supplier names listed in prerequisites; this file defines no second generic carrier.
Imports: PrismaticCohomology:PR.2/derived-prismatic-cohomology, PrismaticCohomology:PR.2/conjugate-filtration, PrismaticCohomology:PR.2/derived-hodge-tate-comparison, PrismaticCohomology:PR.2/derived-prismatic-base-change, PrismaticCohomology:PR.2/kunneth-formula, PrismaticCohomology:PR.2/comparison-to-prisms, PrismaticCohomology:PR.2/derived-agrees-with-site, PrismaticCohomology:PR.2/idempotent-retract-initial-object, PrismaticCohomology:PR.2/regular-quotient-prismatic-envelope, PrismaticCohomology:PR.2/qrsp-prism, PrismaticCohomology:PR.2/qrsp-char-p-acrys, PrismaticCohomology:PR.2/quasisyntomic-descent

PerfectoidQuotients:Q3/lifting-quasisyntomic-covers-to-prisms [import]
Supplier application: For a bounded prism (A,I) and a quasisyntomic A/I-algebra R, there is a prism object (B → B/IB ← R) with R → B/IB p-completely faithfully flat. The map A → B is (p,I)-completely flat and faithfully flat if A/I → R is p-completely faithfully flat. If A is perfect, completed perfection B_perf retains these assertions. Use the existing PR.2/quasisyntomic-covers-lift-to-prisms node as the single planned theorem. This Q3 node records its application to monic-root covers and the ownership correction required by RS-01 and this issue.
Application/reexport only. All generic declarations retain the exact supplier names listed in prerequisites; this file defines no second generic carrier.
Imports: PrismaticCohomology:PR.2/quasisyntomic-covers-lift-to-prisms, DerivedDeRhamCohomology:DD.0/quasisyntomic-condition, DerivedDeRhamCohomology:DD.5/elementary-semiperfectoid-covers

PerfectoidQuotients:Q3/andre-flatness-lemma [omitted]
TauCeti.PerfectoidQuotients.andre_flatness: Every integral perfectoid ring R has a p-completely faithfully flat map R → S to an integral perfectoid ring S in which every positive-degree monic polynomial has a root. Thus S is absolutely integrally closed (in this sense, not required to be a domain). Every element of S admits a compatible system of p-power roots. The map can be chosen ind-syntomic modulo p by Remark 7.15.
The actual p-complete faithfully flat predicate and completed extension colimit are supplier interfaces. Monic polynomial roots are required in the resulting ring; no unspecified root property is introduced.

PerfectoidQuotients:Q4/completed-integral-closed-quotient [omitted]
TauCeti.PerfectoidQuotients.perfectoidClosedQuotient: Let (R,R⁺) be a perfectoid Tate pair and I any ideal of R. Choose a compatible-root pseudouniformizer ϖ∈R⁺ with ϖ^p dividing p. Set S to the ordinary ϖ-adic completion of R⁺/(I∩R⁺), prove that S is semiperfectoid in the derived sense, and define R_I=S_perfd[1/ϖ]. Let R_I⁺ be the minimal open integrally closed subring of R_I containing the image of R⁺. Then R_I is a perfectoid Tate ring and the canonical continuous map q:R → R_I has the universal property among continuous maps from R to perfectoid Tate rings annihilating I. Different choices of ϖ give canonically isomorphic pairs over (R,R⁺). The ideal I need not be topologically closed or finitely generated.
The actual topological perfectoid Tate-pair, plus-ring and Spa carriers come from P1/P4. The completed integral model’s semiperfectoidness is outlined through baseline completion surjectivity and Stacks 091T/091P; its Tate topology, localization and minimal plus-ring comparison remain G7.
API TauCeti.PerfectoidQuotients.perfectoidClosedQuotient.map (projection): The continuous map q:R → R_I annihilates I.
API TauCeti.PerfectoidQuotients.perfectoidClosedQuotient.plus (data): R_I⁺ is the minimal open integrally closed subring containing q(R⁺).
API TauCeti.PerfectoidQuotients.perfectoidClosedQuotient.lift (universal-property): A continuous map to a perfectoid Tate ring killing I factors uniquely through q.
API TauCeti.PerfectoidQuotients.perfectoidClosedQuotient.choices (equivalence): Choices of pseudouniformizer and integral presentation give canonically isomorphic pairs.
API TauCeti.PerfectoidQuotients.perfectoidClosedQuotient.spa (compatibility): The induced Spa map is the P4 universal perfectoid Zariski-closed subspace with image V(I).
TEST TauCeti.PerfectoidQuotients.closedQuotientZeroIdeal (compatibility): For I=0 recover (R,R⁺).
TEST TauCeti.PerfectoidQuotients.closedQuotientUnitIdeal (degenerate): For I=R obtain the empty affinoid space and zero pair.
TEST TauCeti.PerfectoidQuotients.closedQuotientCharacteristicP (computation): In characteristic p the perfectoid kernel contains the radical of I; the raw nonradical quotient is not the answer.
TEST TauCeti.PerfectoidQuotients.closedQuotientNonclosedIdeal (non-example): Allow a nonclosed ideal I; the universal pair depends on V(I), and its kernel is a closed saturated ideal containing I.
TEST TauCeti.PerfectoidQuotients.closedQuotientPlus (compatibility): The plus ring is integral closure of the image with openness, rather than an arbitrarily chosen powerbounded ring.

PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed [omitted]
TauCeti.PerfectoidQuotients.zariskiClosed_is_stronglyZariskiClosed: Every Zariski closed subset Z=V(I) of Spa(R,R⁺), for an affinoid perfectoid Tate pair and any ideal I⊂R, is strongly Zariski closed on the P4 immersion carriers: the universal pair (R_I,R_I⁺) has a surjective map R → R_I, its Spa map is a homeomorphism onto Z, and the integral map R⁺ → R_I⁺ is almost surjective for the root ideal generated by ϖ^(1/p^n). This identifies Z with an affinoid perfectoid space and agrees with the P4 universal construction.
The actual affinoid perfectoid, closed-immersion and plus-ring carriers are unavailable. The integral-model proof obligation is G7.

PerfectoidQuotients:Q0:integral-algebra/frobenius-surjectivity-equivalences [omitted]
TauCeti.PerfectoidQuotients.frobenius_surjectivity_equivalences: Let R be ϖ-adically complete and separated with ϖ^p dividing p. The following are equivalent: every element of R/(pϖ) is a pth power; Frobenius on R/p is surjective; every element of R/ϖ^p is a pth power; F:W_{r+1}(R) → W_r(R) is surjective for every r≥1; and θ_r:A_inf(R) → W_r(R) is surjective for every r≥1. Moreover unit multiples of ϖ and of p admit compatible p-power roots. F is the length-reducing finite Witt Frobenius, not the endomorphism of infinite Witt vectors.
The finite length-reducing Witt Frobenius maps W_(r+1)(R)→W_r(R) and θ_r are absent from the pinned finite-Witt interface. Infinite Witt Frobenius is not a substitute.

PerfectoidQuotients:Q0:integral-algebra/bms-perfectoid-normalization [omitted]
TauCeti.PerfectoidQuotients.integralPerfectoid_bms_iff: The integral predicate defined here agrees with BMS1 Definition 3.5: existence of ϖ with ϖ^p | p, ordinary ϖ-adic completeness, Frobenius surjective on R/p, and principal ker θ. Its p-torsion-free specialization agrees with Česnavičius Definition 4.2: R is p-adically complete, (π^p)=(p), and the p-power map R/π → R/p is an isomorphism. The broader nonzerodivisor ϖ criterion R/ϖ → R/ϖ^p is BMS1 Lemma 3.10, not the literal definition in Česnavičius. No torsion-free condition is imposed on the general predicate.
The original ϖ-adic BMS1 condition and its θ/completion transport to the p-adic BMS2 carrier are not yet expressed. Only the BMS2 predicate is typed.

PerfectoidQuotients:Q0:integral-algebra/principal-theta-kernel-criterion [restricted]
TauCeti.PerfectoidQuotients.principal_theta_kernel_criterion: For a ϖ-adically complete ring R with ϖ^p | p and surjective p-power map R/ϖ → R/ϖ^p, a principal ker θ implies that this map is an isomorphism and every generator of ker θ is a nonzerodivisor in A_inf(R). Conversely, if the p-power map is an isomorphism and ϖ is a nonzerodivisor, ker θ is principal. The forward direction imposes no torsion-free condition on R.
Only the nonzerodivisor consequence for a normalized integral perfectoid ring is typed. The criterion for an originally ϖ-adic complete ring with ϖ^p dividing p, and its equivalence to the quotient p-power isomorphism, requires normalization/completion transport (G1).

PerfectoidQuotients:Q0:integral-algebra/theta-generator-unit-coordinate [restricted]
TauCeti.PerfectoidQuotients.theta_generator_iff_unit_coeff_one: For a nonzero integral perfectoid R, an element ξ∈ker θ generates ker θ if and only if its Witt coordinate ξ₁ is a unit in R♭. Every generator is a nonzerodivisor. There is a generator of the form p+[π♭]^p x, after a compatible-root unit change of π. Along any map of perfectoid rings the induced Witt map sends a generator to a generator; the criterion is preserved because units map to units.
The generator iff unit in Witt coordinate one and the nonzerodivisor assertion are typed. The explicit compatible-root generator, finite θ_r generators and Verschiebung/Frobenius compatibilities are omitted because finite Witt Frobenius/θ_r interfaces are missing (G2).

PerfectoidQuotients:Q0:integral-algebra/perfectoid-bounded-p-torsion [restricted]
TauCeti.PerfectoidQuotients.perfectoid_p_torsion_killed_by_p: For any integral perfectoid R, its p-primary torsion is killed by p: if p^n x=0 for any n≥0 then px=0. In particular it has bounded p-primary torsion and ordinary and derived p-adic completeness agree.
The algebraic assertion R[p^∞]=R[p] is typed. The classical-to-derived completeness comparison is a DD.1 import applied in the proof, rather than an additional typed derived-category statement (G2).

PerfectoidQuotients:Q0:integral-algebra/perfectoid-cotangent-vanishing [omitted]
TauCeti.PerfectoidQuotients.perfectoid_cotangent_mod_p_vanishes: For every map R → S of integral perfectoid rings, L_S/R ⊗^L_ℤ F_p is zero; consequently the derived p-completion of L_S/R is zero. This is about the full cotangent complex, not only ordinary Kähler differentials. For integral perfectoid R, the derived p-completion of L_R/ℤ_p is isomorphic to R[1]; it has p-complete Tor-amplitude concentrated in degree −1. The isomorphism is a choice of generator of ker θ, rather than a canonical un-oriented trivialization.
The full cotangent complex, derived tensor and completed cotangent category are DD.0/DD.1-owned and have no implemented carrier at the pin. Both relative vanishing and the absolute rank-one computation are omitted.

PerfectoidQuotients:Q0:integral-algebra/torsion-free-perfectoid-quotient [restricted]
TauCeti.PerfectoidQuotients.perfectoid_torsion_free_quotient: If integral perfectoid R is ordinarily ϖ-adically complete with ϖ^p | p, then R̄=R/R[ϖ^∞] is ϖ-torsion-free and integral perfectoid, (R̄)♭=R♭/R♭[(ϖ♭)^∞], and R ≅ R̄ ×_(R̄/ϖ)_red (R/ϖ)_red. The quotient by the ideal generated by all compatible ϖ-roots is (R/ϖ)_red, a perfect F_p-algebra. The tilting statement uses a compatible-root unit replacement of ϖ.
The perfectoidness and ϖ-torsion-freeness of R/ker(R→R[1/ϖ]) are typed. The tilt quotient R♭/R♭[ϖ♭] and canonical fibre-product decomposition R≅R_tf×_((R_tf/ϖ)_red)(R/ϖ)_red require quotient/completion transport and the missing supplier interfaces (G1/G2).

PerfectoidQuotients:Q0:integral-algebra/compatible-roots-and-iterated-frobenius [restricted]
TauCeti.PerfectoidQuotients.perfectoid_compatible_roots_iterated_frobenius: For p-torsion-free integral perfectoid R, choose π with (π^p)=(p). The pinned reduction map lim_(x↦x^p) R → R♭=lim_F R/p is an isomorphism of multiplicative monoids. There are compatible π_n, n≥1, with π₁ a unit multiple of π, π_(n+1)^p=π_n and (π_n^(p^n))=(p). Each ideal (π_n) is the inverse image of ker(F^n:R/p → R/p), and x↦x^(p^n) gives R/π_n ≅ R/p. Modulo p² every element is x^p+p y^p, and modulo pπ every element is a pth power.
The monoid isomorphism between actual compatible root sequences and the pinned PreTilt is typed. The chosen π_n, ideal descriptions ker(F^n), R/π_n≅R/p, and the modulo-p² and pπ expansions are omitted pending normalization and finite Frobenius interfaces (G1/G2). The typed comparison admits the stronger normalized torsion-allowing setting; the node’s stated p-torsion-free specialization is included.

PerfectoidQuotients:Q0:integral-algebra/p-integral-closedness-criterion [restricted]
TauCeti.PerfectoidQuotients.perfectoid_p_integral_closedness: If ϖ is a nonzerodivisor of A and ϖ^p | p, the p-power map A/ϖ → A/ϖ^p is injective exactly when A is p-integrally closed in A[1/ϖ]. Hence for integral perfectoid A ordinarily ϖ-complete the image of A in A[1/ϖ] is p-integrally closed, including when A has ϖ-torsion. For p-torsion-free A with (ϖ^p)=(p), ordinary integral closedness in A[1/p] and Frobenius surjectivity modulo p imply that the ordinary p-completion is perfectoid.
The injectivity criterion for the quotient p-power map and p-root closedness of the actual localization image is typed. The completion criterion for p-torsion-free integrally closed rings and the torsion-removal transport are omitted pending G1.

PerfectoidQuotients:Q0:integral-algebra/completely-etale-and-henselian-perfectoid [omitted]
TauCeti.PerfectoidQuotients.perfectoid_completely_etale_henselization: If R is integral perfectoid and R → R′ is p-completely étale (R′ derived p-complete and R′⊗^L_R R/p discrete étale), then R′ is integral perfectoid. For any ideal J⊂R, the ordinary p-completion of the henselization R_J^h is integral perfectoid. Thus p-completion of ind-étale R-algebras is perfectoid. No finite generation or closedness of J is required.
The completed étale/faithfully flat and henselization carriers require DD.1 and PR.0’s unique δ-extension/algebraization interfaces.

PerfectoidQuotients:Q0:integral-algebra/completed-root-polynomial-algebras [omitted]
TauCeti.PerfectoidQuotients.perfectoid_completed_root_polynomial: For integral perfectoid A ordinarily ϖ-complete with ϖ^p | p and any set I, the ordinary ϖ-completion of A[X_i^(1/p^∞)]_(i∈I) is perfectoid. Its tilt is the ordinary ϖ♭-completion of A♭[(X_i♭)^(1/p^∞)]_(i∈I), where X_i♭ corresponds to the compatible powers of the variable.
The canonical completed polynomial algebra on an arbitrary family of compatible p-power root variables and its tilt transport have no pinned supplier construction.

PerfectoidQuotients:Q0:integral-algebra/completed-perfectoid-tensor-products [omitted]
TauCeti.PerfectoidQuotients.perfectoid_completed_tensor: For integral perfectoid A ordinarily ϖ-complete with ϖ^p | p and a small family of ϖ-complete perfectoid A-algebras A_i, the ordinary ϖ-completed tensor product of all A_i over A is perfectoid; its tilt is the ϖ♭-completed tensor product of the tilts over A♭. Infinite tensor products are filtered colimits over finite subsets before completion. This is a classical completion statement on these hypotheses.
The arbitrary-family completed tensor product of integral perfectoid algebras and its tilt comparison require the supplier completed-colimit carrier. An arbitrary chosen ring is not substituted.

PerfectoidQuotients:Q0:integral-algebra/completed-root-stable-quotients [restricted]
TauCeti.PerfectoidQuotients.perfectoid_completed_root_quotient: For integral perfectoid A ordinarily ϖ-complete with ϖ^p | p and a subset S⊂A, suppose for every n>0 the ideal generated by S modulo ϖ^n is generated by p^n-th powers of its elements. Then the ordinary ϖ-completion of A/(S) is perfectoid. Its tilt is the ordinary ϖ♭-completion of A♭/(S♭), where S♭=lim_(x↦x^p)(S mod ϖ) inside A♭. A sufficient hypothesis is that every s∈S has some positive p-power root in S; in particular take the elements of a compatible root tower. The raw quotient is not asserted complete.
Perfectoidness of the ordinary completion for a set admitting compatible p-th roots inside the set is typed. The general modulo-ϖ^n ideal-power condition and the tilt formula are omitted pending the supplier completion and tilt interfaces (G2).

PerfectoidQuotients:Q0:integral-algebra/products-of-perfectoid-rings [restricted]
TauCeti.PerfectoidQuotients.integralPerfectoid_pi_iff: A small product of Z_p-algebras is integral perfectoid if and only if each factor is integral perfectoid. Its tilt is the product of the tilts. No common bounded cardinality or uniform bound on p-torsion is added; the bound one is supplied by the perfectoid factors.
The if-and-only-if perfectoid criterion on the actual dependent product ring is typed, including the empty product. The product-tilt equivalence is omitted pending the completion-instance/tilt transport (G2).

PerfectoidQuotients:Q0:integral-algebra/completion-along-sharp-ideal [restricted]
TauCeti.PerfectoidQuotients.perfectoid_sharp_ideal_completion: For integral perfectoid A, a finite tuple a_i♭∈A♭ and a_i=(a_i♭)♯, ordinary completion of A at (a₁,…,a_r) is perfectoid, agrees with derived completion at that ideal, and has tilt the ordinary completion of A♭ at (a₁♭,…,a_r♭). The ideal need not contain p.
The ordinary finite sharp-ideal completion is typed and asserted perfectoid. The equality with derived completion and the completed tilt identification are omitted pending G1/G2; ϖ^p dividing p alone is not used to assert arbitrary derived/classical equality.

PerfectoidQuotients:Q0:integral-algebra/tate-powerbounded-model-import-contract [import]
Supplier application: For a p-torsion-free integral perfectoid A choose π^p=p·u and put T=A[1/p] with A open p-adic. Import the P1 Tate adapter: T is perfectoid and uniform, every compatible π-root annihilates T°/A, T° is the almost-elements saturation of A inside T, A contains T°°, and T° is ordinarily p-adically complete and integral perfectoid. This is the powerbounded-model reduction of Česnavičius §4.8. No integral-closedness assumption on A is added.
Application/reexport only. All generic declarations retain the exact supplier names listed in prerequisites; this file defines no second generic carrier.
Imports: PerfectoidSpaces:P1/perfectoid-tate-ring-from-integral-perfectoid, PerfectoidSpaces:P1/almost-integral-dictionary, PerfectoidSpaces:P1/topologically-nilpotent-elements-as-root-ideal, PerfectoidSpaces:P1/integral-perfectoid-comparison

PerfectoidQuotients:Q2/completed-perfectoidization-base-change [omitted]
TauCeti.PerfectoidQuotients.perfectoidization_complete_flat_base_change: Let R → R′ be a p-completely faithfully flat map of integral perfectoid rings and R → S a semiperfectoid quotient. Let S′=(S⊗^L_R R′)^∧_p, which is an ordinary derived p-complete semiperfectoid ring by complete flatness. There is a canonical equivalence (S_perfd⊗^L_R R′)^∧_p ≅ S′_perfd compatible with the units. If η_S′ is surjective, η_S is surjective. Only this base-change law along a perfectoid cover is asserted.
The actual derived p-completed pushout and cofiber comparison use DD.1/PR.0 carriers. The mathematical target is stated in the packet; G5 is not added as a hypothesis in a tautological signature.

PerfectoidQuotients:Q2/perfectoidization-completed-colimits [omitted]
TauCeti.PerfectoidQuotients.perfectoidization_completed_filtered_colimits: Fix integral perfectoid R and an ideal J⊂R such that S=R/J is derived p-complete. For finite subsets F⊂J set S_F=R/(F). The rings S_F are derived p-complete semiperfectoid (cokernels of maps of finite sums of derived-complete R-modules). Their colimit in derived p-complete animated rings is S. Perfectoidization carries this colimit to the colimit in perfectoid R-algebras, computed by the appropriate completed filtered colimit, with compatible units. G6 is the exact identification of that completed perfectoid colimit with the ordinary p-completion of R/K, where K is the union of the compatible finite-stage unit kernels. Once established, the image assertion follows from the baseline completion-surjectivity theorem and completeness of R.
The actual completed animated/perfect-prism colimit carrier and its quotient-completion identification remain G6. Completion-surjectivity after that identification is already in the baseline.

PerfectoidQuotients:Q3/relative-perfectoid-cover-of-smooth-site [omitted]
TauCeti.PerfectoidQuotients.relative_perfectoid_cover_smooth_site: For bounded (A,I), a p-completely smooth A/I-algebra R and a quasisyntomic cover R → R∞ with (L_R∞/(A/I))^∧_p=0, let B=Δ_R∞/A. Then B is a discrete relatively perfect δ-A-algebra, (p,I)-completely flat over A, B/IB≅R∞, and (B,IB) covers the final object of the relative prismatic site of R. Here “covers” means that every test prism receives a faithfully flat refinement mapping from B.
The actual smooth/prismatic-site, completed cotangent and relatively perfect δ-algebra carriers are missing.

PerfectoidQuotients:Q3/frobenius-flat-prism-perfection-cover [omitted]
TauCeti.PerfectoidQuotients.frobenius_flat_prism_perfection_cover: If (A,I) is a bounded prism whose Frobenius φ:A → A is (p,I)-completely flat, then the completed perfection (B,IB) has B/IB perfectoid and covers the final object of the absolute prismatic site of A/I. For a perfect base A, completed perfection of a flat prism map preserves (p,I)-complete flatness, and faithful flatness when the map was faithful.
The relatively regular reduction Frobenius-flatness criterion and actual completed prism perfection carrier must be supplied by PR.0/DD.1.

PerfectoidQuotients:Q3/andre-ind-syntomic-mod-p [omitted]
TauCeti.PerfectoidQuotients.andre_ind_syntomic_mod_p: The map R → S in André’s flatness lemma can be chosen so R/p → S/p is an ind-syntomic faithfully flat cover. This is a modulo-p refinement of the general integral theorem. It is distinct from the ordinary ind-syntomic theorem of ČS24 Proposition 2.3.4, which remains owned by IntegralPerfectoidPartII.
The ind-syntomic predicate and divided-power envelope/finite stages need the owning suppliers. The stronger ordinary ind-syntomic theorem of ČS24 is not substituted for the modulo-p statement.

PerfectoidQuotients:Q0:integral-algebra/bhatt-field-integral-model-comparison [omitted]
TauCeti.PerfectoidQuotients.bhatt_integral_model_comparison: Fix a perfectoid field K, its valuation ring K° and a nonzero topologically nilpotent t∈K° with compatible p-power roots; in characteristic zero normalize |t|=|p|. Bhatt’s integral perfectoid K°-algebras are flat K°-algebras A, ordinarily t-complete, with A=A_* (every x∈A[1/t] with t^(1/p^n)x∈A for all n lies in A), and with F:A/t^(1/p) → A/t an isomorphism. They are precisely the powerbounded integral models of perfectoid K-algebras. They satisfy the general integral predicate; the converse from the general predicate needs this K°-algebra structure, t-torsion-freeness/flatness and saturation. The field-based model does not replace the general torsion-allowing predicate.
The fixed perfectoid field K, K°-flat saturated t-adic integral model, (-)_* saturation and Tate normalization are P0/P1-owned carriers, absent at the pin.

PerfectoidQuotients:Q3/bhatt-rational-root-neighborhoods [omitted]
TauCeti.PerfectoidQuotients.bhatt_root_neighborhoods: For a Bhatt integral perfectoid K°-model A and g∈A, set Y=Spa(A⟨T^(1/p^∞)⟩[1/t],A⟨T^(1/p^∞)⟩) using the P1/P2 powerbounded integral model. For ℓ≥0 let U_ℓ={y:|T(y)−g(y)|≤|t(y)|^ℓ} and B_ℓ=O_Y⁺(U_ℓ). These are nested rational neighborhoods of V(T−g), with restriction maps B_ℓ → B_(ℓ+1). B_ℓ is the integral rational-localization model furnished by P2 and is integral perfectoid after the necessary almost-elements saturation.
The fixed-field rational-localization, powerbounded integral model and saturated inverse limit are P0/P1/P2/P4 carriers. The application imports their actual constructions.

PerfectoidQuotients:Q3/bhatt-perfectoid-root-extension [omitted]
TauCeti.PerfectoidQuotients.bhattRootExtension: For a Bhatt integral perfectoid K°-algebra A and g∈A, form the ordinary t-completion C of colim_ℓ B_ℓ from the rational neighborhoods of T−g and set A∞=C_* using the P0 almost-elements saturation. Then A∞ is an integral perfectoid K°-model, has a natural map from A, and has a distinguished compatible root tower of g given by the coordinates T^(1/p^n). The raw completion C is only asserted almost isomorphic to A∞; Bhatt footnote 6 explicitly requires this correction. This geometric construction supplies the field-based alternative, not the strong actual-flatness statement of BS22 Theorem 7.14.
The fixed-field Bhatt integral model and saturation (-)_* carrier are not implemented at the pin. Its raw completed colimit is only almost isomorphic to the saturated object; all six API items and four tests are explicitly omitted.
API TauCeti.PerfectoidQuotients.bhattRootExtension.map (projection): The natural K°-algebra map A → A∞.
API TauCeti.PerfectoidQuotients.bhattRootExtension.root (data): For each n≥0, a distinguished root g_n∈A∞, with g₀ the image of g.
API TauCeti.PerfectoidQuotients.bhattRootExtension.root_pow (simp): g_(n+1)^p=g_n for every n.
API TauCeti.PerfectoidQuotients.bhattRootExtension.perfectoid (structure): A∞ is t-complete, flat over K°, saturated, and has the integral-model Frobenius isomorphism.
API TauCeti.PerfectoidQuotients.bhattRootExtension.raw_almost_iso (compatibility): C → C_* is an almost isomorphism for the specified root ideal.
API TauCeti.PerfectoidQuotients.bhattRootExtension.map_comp (functoriality): Maps of pairs (A,g) induce compatible root-extension maps preserving identities and composition.
TEST TauCeti.PerfectoidQuotients.bhattRootExtensionZero (degenerate): For the zero K°-algebra the root extension is zero and every root is zero.
TEST TauCeti.PerfectoidQuotients.bhattRootExtensionPower (characterisation): For every n, the distinguished root satisfies g_n^(p^n)=image(g), and the adjacent roots satisfy the stronger compatibility equality.
TEST TauCeti.PerfectoidQuotients.bhattRootExtensionModel (compatibility): After localization the extension is the P4 universal perfectoid closed subspace V(T−g); its integral ring is the saturated powerbounded model.
TEST TauCeti.PerfectoidQuotients.bhattRootExtensionZeroElement (computation): For g=0 in any Bhatt integral perfectoid K°-model A, the canonical map A → A∞ is an isomorphism and every distinguished root is zero.

PerfectoidQuotients:Q3/bhatt-root-extension-almost-flat [omitted]
TauCeti.PerfectoidQuotients.bhatt_root_extension_almost_faithfully_flat: For ℓ>0, the map A → B_ℓ is almost faithfully flat modulo t for the root ideal (t^(1/p^n)); consequently A → A∞ is almost faithfully flat modulo t. These are statements in the almost module category. They do not assert ordinary flatness or the p-completely faithfully flat general integral theorem. More generally, for a perfectoid affinoid K-pair (A,A⁺) and any positive-degree monic P(T)∈A⁺[T], let B⁺ be the π-completion of the integral closure of A⁺ in A[T^(1/p^∞)]/(P(T)), and B=B⁺[1/π]. Then (B,B⁺) is perfectoid, universal among complete uniform affinoid A-pairs equipped with a root h₀∈C⁺ of P and adjacent compatible p-power roots of h₀. The map A⁺→B⁺ is almost faithfully flat modulo π. This applies the existing P4 universal closed-space construction to P(T), and is the monic version used in the functorial iteration.
P0’s specified root-ideal almost category and P2’s rational approximation/integral-model carrier are not implemented.

PerfectoidQuotients:Q3/functorial-almost-absolutely-integrally-closed-extension [omitted]
TauCeti.PerfectoidQuotients.functorial_almost_aic_extension: On the category of Bhatt integral perfectoid K°-models there is a functor B and a natural map A → B(A), almost faithfully flat modulo t, such that B(A) is again an integral model and every positive-degree monic polynomial over B(A) has a root. This is the functorial almost variant of Remark 2.7, distinct from the arbitrary integral p-complete-cover theorem.
The actual almost category and functorial completed construction use P0/P5 carriers, absent at the pin (G2). The cited Corollary 9.4.7 and its transfinite proof have now been acquired and outlined; there is no missing-source gap.
-/
