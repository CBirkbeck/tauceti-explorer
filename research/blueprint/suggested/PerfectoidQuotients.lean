import Mathlib.RingTheory.Perfectoid.FontaineTheta
import Mathlib.RingTheory.WittVector.Complete
import Mathlib.RingTheory.Ideal.Quotient.Nilpotent
import Mathlib.FieldTheory.PerfectClosure
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.RingTheory.WittVector.TeichmullerSeries
import Mathlib.RingTheory.Ideal.Quotient.Operations

/-!
This file is not the roadmap and is not exhaustive. The roadmap document is
definitive. These statements suggest Lean forms so that contributors and
reviewers converge on names and signatures. This is a suggested API, not an
implementation. Every proof is a placeholder.
Do not merge this file into Mathlib or Tau Ceti as a completed development.
The signatures below use the pinned libraries' actual rings, ideals, quotients,
Witt vectors and perfection. The inherited prismatic and analytic obligations
are listed in the final comment because their supplier carriers are missing.
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

/-!
Required inherited targets not yet expressible on the pinned supplier carriers:
* PerfectoidQuotients:Q0:animated-application/perfect-prism-is-initial-over-its-perfectoid-ring
  Maps out of a perfect prism are determined by their reduction: (A_inf(R), ker θ) is initial in (R)_Δ.
* PerfectoidQuotients:Q2/initial-prism-of-a-semiperfectoid-ring
  The category of prisms under a semiperfectoid ring has an initial object with principal ideal.
* PerfectoidQuotients:Q2/universal-perfectoidization
  Universal perfectoid ring S_perfd under a semiperfectoid ring.
* PerfectoidQuotients:Q2/derived-prismatic-cohomology-and-hodge-tate-filtration
  Derived prismatic cohomology by left Kan extension, with its Hodge-Tate filtration and formal properties.
* PerfectoidQuotients:Q2/discrete-derived-prismatic-cohomology-gives-a-weakly-initial-prism
  When Δ_{R/A} is discrete it is a δ-ring, a prism over (A, I), and weakly initial with an idempotent retract that is initial.
* PerfectoidQuotients:Q2/lci-quotient-prism-is-initial
  For a Koszul-regular quotient R = A/(I, f_1, ..., f_r) with bounded p-torsion, Δ_{R/A} is the prismatic envelope and initial.
* PerfectoidQuotients:Q2/qrsp-derived-prismatic-cohomology-is-the-initial-prism
  For quasiregular semiperfectoid S, Δ_{S/A} is discrete, equals the initial prism Δ^init_S independently of the perfectoid R, and S → Δ̄_S is p-completely faithfully flat.
* PerfectoidQuotients:Q3/lifting-quasisyntomic-covers-to-prisms
  A quasisyntomic A/I-algebra admits a prism (B, IB) over (A, I) with R → B/IB p-completely faithfully flat; flatness of the (perfected) prism.
* PerfectoidQuotients:Q3/andre-flatness-lemma
  Andre's flatness lemma: every perfectoid ring has a p-completely faithfully flat absolutely integrally closed perfectoid extension.
* PerfectoidQuotients:Q4/surjectivity-of-perfectoidization
  S → S_perfd is surjective for every semiperfectoid S.
* PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed
  Closed perfectoid quotients: the vanishing locus of an ideal in an affinoid perfectoid space is strongly Zariski closed.
These are preserved in full in the packet continuation register. They do not
count as typed signatures. PR.0 supplies prism objects, PR.1/PR.2 the relative
and derived functors, DD.0/DD.1/DD.5 cotangent, completion and quasisyntomic
objects, and P4 the analytic immersion carriers. No placeholder proposition or
assumed comparison equivalence stands in for those constructions here.
-/


/-!
These are suggested signatures for the bounded-torsion ingredient, not an
implementation or a complete roadmap. The roadmap document is definitive.
The carrier W(k), its coefficients, and all ring quotients are existing objects.
-/

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
