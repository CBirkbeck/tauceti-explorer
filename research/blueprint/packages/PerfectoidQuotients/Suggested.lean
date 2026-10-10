import Mathlib

/-!
# PerfectoidQuotients: representative target signatures

The mathematical roadmap is README.md. This file records definitions and theorem
signatures statable against the pinned Mathlib APIs and is not exhaustive.
Integral perfectoidness permits the zero ring and p-torsion. Semiperfectoidness
uses the ordinary-module tower criterion for derived completeness. Root closure
retains its ambient ring, and perfectoidization stores actual ring maps and its
universal property. The full prism, derived, almost and analytic targets use the
supplier carriers specified in the roadmap.
-/

namespace TauCetiRoadmap.PerfectoidQuotients
noncomputable section
universe u v

/-! ## Layer 0: integral perfectoid algebra -/

section IntegralAlgebra
variable (p : ℕ) [Fact p.Prime]

/-- BMS2 Definition 4.18, with an explicit zero-ring branch because the pinned
PreTilt ring instance and Fontaine map require that p is not a unit. -/
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

/-- The zero ring satisfies integral perfectoidness at every prime. -/
theorem IsIntegralPerfectoid.of_subsingleton [Subsingleton R] :
    IsIntegralPerfectoid p R := by sorry

/-- Integral perfectoid rings are classically p-adically complete and separated. -/
theorem IsIntegralPerfectoid.complete (h : IsIntegralPerfectoid p R) :
    IsAdicComplete (Ideal.span {(p : R)}) R := by sorry

/-- Integral perfectoid rings have a pth root of p up to a unit. -/
theorem IsIntegralPerfectoid.has_p_root (h : IsIntegralPerfectoid p R) :
    ∃ π : R, ∃ a : Rˣ, π ^ p = (p : R) * a := by sorry

/-- With nonunit p and completeness, the three remaining BMS2 clauses characterize perfectoidness. -/
theorem IsIntegralPerfectoid.iff_nontrivial
    [Fact (¬ IsUnit (p : R))] [IsAdicComplete (Ideal.span {(p : R)}) R] :
    IsIntegralPerfectoid p R ↔
      (∃ π : R, ∃ a : Rˣ, π ^ p = (p : R) * a) ∧
      Function.Surjective (frobenius (ModP R p) p) ∧
      ∃ ξ : WittVector p (PreTilt R p),
        RingHom.ker (WittVector.fontaineTheta R p) = Ideal.span {ξ} := by sorry

-- A degenerate ring, a positive field example, and two independent non-examples.
-- zeroRing
example : IsIntegralPerfectoid p (ZMod 1) := by sorry
-- primeField
example : IsIntegralPerfectoid p (ZMod p) := by sorry
-- zmodFour
example : ¬ IsIntegralPerfectoid 2 (ZMod 4) := by sorry
-- polynomial
example : ¬ IsIntegralPerfectoid 2 (Polynomial (ZMod 2)) := by sorry
-- dualNumbers
example : ¬ IsIntegralPerfectoid 2 (TrivSqZeroExt (ZMod 2) (ZMod 2)) := by sorry
-- Omitting the principal-kernel clause would accept this semiperfect quotient.
-- semiperfectNotPerfect
example : ¬ IsIntegralPerfectoid 2
    (PerfectClosure (Polynomial (ZMod 2)) 2 ⧸
      Ideal.span {PerfectClosure.of (Polynomial (ZMod 2)) 2 Polynomial.X}) := by sorry
-- semiperfectSquaring
example : Function.Surjective (fun x :
    PerfectClosure (Polynomial (ZMod 2)) 2 ⧸
      Ideal.span {PerfectClosure.of (Polynomial (ZMod 2)) 2 Polynomial.X} => x ^ 2) := by sorry

section Units
variable [hchar : CharP R p]
include hchar

-- BMS1 Lemma 3.10: detection in the inverse perfection, not direct perfection.
/-- A unit in inverse perfection is detected by its zeroth coordinate, without surjective Frobenius on R. -/
theorem perfection_isUnit_iff (x : Perfection R p) :
    IsUnit x ↔ IsUnit (Perfection.coeff R p 0 x) := by sorry

-- General-ring replacement for the pinned field-only Witt unit criterion.
/-- A Witt vector over a perfect characteristic-p ring is a unit exactly when its constant coordinate is. -/
theorem witt_isUnit_iff [PerfectRing R p] (x : WittVector p R) :
    IsUnit x ↔ IsUnit (x.coeff 0) := by sorry

/-- In characteristic p, Witt coordinate one of a product is x₀^p y₁ + x₁ y₀^p. -/
theorem witt_mul_coeff_one (x y : WittVector p R) :
    (x * y).coeff 1 = x.coeff 0 ^ p * y.coeff 1 +
      x.coeff 1 * y.coeff 0 ^ p := by sorry

-- wittPNonunit
example [PerfectRing R p] : ¬ IsUnit (p : WittVector p R) := by sorry
-- wittOnePlusPUnit
example [PerfectRing R p] : IsUnit (1 + p : WittVector p R) := by sorry
-- tiltUnit
example (x : Perfection R p) (h : Perfection.coeff R p 0 x = 1) :
    IsUnit x := by sorry
/-- At p=2 the first two coordinates of p are (0,1), and p² has coordinate one zero. -/
example :
    (2 : WittVector 2 (ZMod 2)).coeff 0 = 0 ∧
      (2 : WittVector 2 (ZMod 2)).coeff 1 = 1 ∧
      ((2 : WittVector 2 (ZMod 2)) ^ 2).coeff 1 = 0 := by sorry

/-- The Witt coordinate of p[T] is T², while its first Teichmüller digit is T. -/
example :
    let A := PerfectClosure (Polynomial (ZMod 2)) 2
    let t : A := PerfectClosure.of (Polynomial (ZMod 2)) 2 Polynomial.X
    ((2 : WittVector 2 A) * WittVector.teichmuller 2 t).coeff 1 = t ^ 2 := by sorry

end Units

section CharacteristicP
variable [hchar : CharP R p] [Fact (¬ IsUnit (p : R))]
variable [IsAdicComplete (Ideal.span {(p : R)}) R]
include hchar

-- The theta modulo p formula is the existing WittVector.mk_fontaineTheta.

/-- In characteristic p, a principal Fontaine kernel is (p), without an extra Frobenius-surjectivity premise. -/
theorem theta_kernel_charP
    (h : ∃ ξ : WittVector p (PreTilt R p),
      RingHom.ker (WittVector.fontaineTheta R p) = Ideal.span {ξ}) :
    RingHom.ker (WittVector.fontaineTheta R p) =
      Ideal.span {(p : WittVector p (PreTilt R p))} := by sorry

/-- A principal Fontaine kernel in characteristic p makes the zeroth tilt projection injective. -/
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

/-- Sharp commutes with a ring map and its explicitly compatible reduction modulo p. -/
theorem untilt_natural (x : PreTilt R p) :
    f x.untilt = PreTilt.untilt (O := S) (p := p) (Perfection.map p g x) := by sorry

/-- Fontaine’s map commutes with the induced Witt map of tilts. -/
theorem theta_natural (x : WittVector p (PreTilt R p)) :
    f (WittVector.fontaineTheta R p x) =
      WittVector.fontaineTheta S p (WittVector.map (Perfection.map p g) x) := by sorry
end Naturality

section FiniteWitt
/-- The finite Witt Frobenius reduces length by one; it descends infinite Frobenius through truncation, over any commutative ring. -/
def finiteWittFrobenius (r : ℕ) :
    TruncatedWittVector p (r + 1) R →+* TruncatedWittVector p r R := by sorry

/-- Finite Frobenius is the truncation of infinite Witt Frobenius, not the restriction map. -/
theorem finiteWittFrobenius_truncate (r : ℕ) (x : WittVector p R) :
    finiteWittFrobenius p R r (WittVector.truncate (r + 1) x) =
      WittVector.truncate r (WittVector.frobenius x) := by sorry

/-- At length two the finite Frobenius is x₀^p+p x₁, including in mixed characteristic. -/
theorem finiteWittFrobenius_coeff_zero (x : TruncatedWittVector p 2 R) :
    (finiteWittFrobenius p R 1 x).coeff ⟨0, by decide⟩ =
      x.coeff ⟨0, by decide⟩ ^ p + (p : R) * x.coeff ⟨1, by decide⟩ := by sorry

/-- Restriction and finite Frobenius commute when both sides reduce to length r. -/
theorem finiteWittFrobenius_restrict (r : ℕ) (x : TruncatedWittVector p (r + 2) R) :
    TruncatedWittVector.truncate (by omega : r ≤ r + 1)
      (finiteWittFrobenius p R (r + 1) x) =
    finiteWittFrobenius p R r
      (TruncatedWittVector.truncate (by omega : r + 1 ≤ r + 2) x) := by sorry

/-- Length zero is the zero ring, so finite Frobenius has its unique value there. -/
example (x : TruncatedWittVector 2 1 ℤ) : finiteWittFrobenius 2 ℤ 0 x = 0 := by sorry

/-- At p=2, Frobenius sends the two Witt coordinates (1,1) over ℤ to 3; restriction would give 1. -/
example : (finiteWittFrobenius 2 ℤ 1
    (TruncatedWittVector.mk 2 (fun _ : Fin 2 => (1 : ℤ)))).coeff ⟨0, by decide⟩ = 3 := by sorry

/-- In characteristic 2 the second coordinate contributes zero to length-one Frobenius. -/
example : (finiteWittFrobenius 2 (ZMod 2) 1
    (TruncatedWittVector.mk 2 (fun i : Fin 2 => if i = 0 then 0 else 1))).coeff
      ⟨0, by decide⟩ = 0 := by sorry

variable [Fact (¬ IsUnit (p : R))] [IsAdicComplete (Ideal.span {(p : R)}) R]

/-- The BMS finite Fontaine map θ_r sends a Teichmüller lift to the truncated Teichmüller lift of sharp. At r=0 its target is the zero ring. -/
def finiteFontaineTheta (r : ℕ) :
    WittVector p (PreTilt R p) →+* TruncatedWittVector p r R := by sorry

/-- This fixes θ_r rather than its Frobenius-twisted inverse-limit projection. -/
theorem finiteFontaineTheta_teichmuller (r : ℕ) (a : PreTilt R p) :
    finiteFontaineTheta p R r (WittVector.teichmuller p a) =
      WittVector.truncate r (WittVector.teichmuller p a.untilt) := by sorry

/-- Restriction of θ_(r+1) is θ_r. -/
theorem finiteFontaineTheta_restrict (r : ℕ) (x : WittVector p (PreTilt R p)) :
    TruncatedWittVector.truncate (by omega : r ≤ r + 1)
      (finiteFontaineTheta p R (r + 1) x) = finiteFontaineTheta p R r x := by sorry

/-- Finite Frobenius of θ_(r+1) equals θ_r after the Witt Frobenius on A_inf. -/
theorem finiteFontaineTheta_frobenius (r : ℕ) (x : WittVector p (PreTilt R p)) :
    finiteWittFrobenius p R r (finiteFontaineTheta p R (r + 1) x) =
      finiteFontaineTheta p R r (WittVector.frobenius x) := by sorry

/-- The length-one coordinate is the existing Fontaine map. -/
theorem finiteFontaineTheta_one (x : WittVector p (PreTilt R p)) :
    (finiteFontaineTheta p R 1 x).coeff ⟨0, by decide⟩ =
      WittVector.fontaineTheta R p x := by sorry

/-- Every vector maps to zero at length zero. -/
example (x : WittVector p (PreTilt R p)) : finiteFontaineTheta p R 0 x = 0 := by sorry

/-- At length one the integer 2 is zero over F₂. -/
example :
    letI : Fact (¬ IsUnit (2 : ZMod 2)) := ⟨by sorry⟩
    (finiteFontaineTheta 2 (ZMod 2) 1 2).coeff ⟨0, by decide⟩ = 0 := by sorry

/-- At length two the same integer has Witt coordinates (0,1), so θ₂ is not a pointwise-coordinate map. -/
example :
    letI : Fact (¬ IsUnit (2 : ZMod 2)) := ⟨by sorry⟩
    (finiteFontaineTheta 2 (ZMod 2) 2 2).coeff ⟨1, by decide⟩ = 1 := by sorry

/-- Over a perfect polynomial ring θ₂ uses sharp itself, with Witt coordinates (T,0). -/
example :
    let A := PerfectClosure (Polynomial (ZMod 2)) 2
    let t : A := PerfectClosure.of (Polynomial (ZMod 2)) 2 Polynomial.X
    letI : Fact (¬ IsUnit (2 : A)) := ⟨by sorry⟩
    letI : IsAdicComplete (Ideal.span {(2 : A)}) A := by sorry
    ∀ a : PreTilt A 2, a.untilt = t →
      (finiteFontaineTheta 2 A 2 (WittVector.teichmuller 2 a)).coeff ⟨0, by decide⟩ = t ∧
      (finiteFontaineTheta 2 A 2 (WittVector.teichmuller 2 a)).coeff ⟨1, by decide⟩ = 0 := by sorry

/-- A generator with sharp equal to 2 fixes the minus sign in [a]−2: changing it to plus gives 4. -/
example [CharZero R] (a : PreTilt R 2) [Fact (¬ IsUnit (2 : R))]
    [IsAdicComplete (Ideal.span {(2 : R)}) R] (ha : a.untilt = 2) :
    WittVector.fontaineTheta R 2 (WittVector.teichmuller 2 a - 2) = 0 ∧
      WittVector.fontaineTheta R 2 (WittVector.teichmuller 2 a + 2) = 4 ∧
      (4 : R) ≠ 0 := by sorry

end FiniteWitt

/-- Ring equivalences preserve and reflect integral perfectoidness. -/
theorem IsIntegralPerfectoid.congr (S : Type v) [CommRing S] (e : R ≃+* S) :
    IsIntegralPerfectoid p R ↔ IsIntegralPerfectoid p S := by sorry

/-- In characteristic exactly p, integral perfectoidness is bijectivity of Frobenius. -/
theorem integralPerfectoid_iff_perfect [CharP R p] :
    IsIntegralPerfectoid p R ↔ PerfectRing R p := by sorry

-- Stronger testing of the definition: a non-field perfect ring is included.
-- productField
example : IsIntegralPerfectoid p (ZMod p × ZMod p) := by sorry
-- perfectRingAgreement
example [CharP R p] [PerfectRing R p] : IsIntegralPerfectoid p R := by sorry


namespace Witt
variable (p : ℕ) [Fact p.Prime]
variable {k : Type*} [CommRing k] [CharP k p] [PerfectRing k p]

/-- If ξ₁ is a unit, divisibility p² ∣ ξg implies p ∣ g over a perfect characteristic-p ring. -/
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

-- witt_torsion_prime_detection
example (g : WittVector p k) :
    ((p : WittVector p k) ^ 2 ∣ (p : WittVector p k) * g) ↔
      (p : WittVector p k) ∣ g := by sorry

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


end Witt

section ClosureAndOperations
variable (p : ℕ) [Fact p.Prime]
/-- The infimum formulation equals the successive root-adjunction union. -/
def pIntegralClosure (B : Type u) [CommRing B] (A : Subring B) : Subring B :=
  sInf {C : Subring B | A ≤ C ∧ ∀ b : B, b ^ p ∈ C → b ∈ C}

variable (B : Type u) [CommRing B] (A : Subring B)
/-- The source subring lies in its ambient p-integral closure. -/
theorem pIntegralClosure.le : A ≤ pIntegralClosure p B A := by sorry

/-- The ambient p-integral closure is closed under pth roots inside B. -/
theorem pIntegralClosure.isClosed (b : B) (h : b ^ p ∈ pIntegralClosure p B A) :
    b ∈ pIntegralClosure p B A := by sorry

/-- Root closure is contained in every root-closed intermediate subring containing A. -/
theorem pIntegralClosure.minimal (C : Subring B) (hAC : A ≤ C)
    (hC : ∀ b : B, b ^ p ∈ C → b ∈ C) : pIntegralClosure p B A ≤ C := by sorry

/-- Ambient p-integral closure is idempotent. -/
theorem pIntegralClosure.idempotent :
    pIntegralClosure p B (pIntegralClosure p B A) = pIntegralClosure p B A := by sorry

/-- Ambient p-integral closure is monotone in the source subring. -/
theorem pIntegralClosure.mono (C : Subring B) (hAC : A ≤ C) :
    pIntegralClosure p B A ≤ pIntegralClosure p B C := by sorry

/-- For prime p, ambient root closure is contained in ordinary integral closure. -/
theorem pIntegralClosure.le_integralClosure (hp : p.Prime) :
    pIntegralClosure p B A ≤ (integralClosure A B).toSubring := by sorry

-- pClosureIdentity
example (h : ∀ b : B, b ^ p ∈ A → b ∈ A) : pIntegralClosure p B A = A := by sorry
-- pClosureZero
example : pIntegralClosure p (ZMod 1) ⊥ = ⊤ := by sorry

/-- The actual polynomial subring F₂[T^n] inside F₂[T]. -/
private def powerPolynomialSubring (n : ℕ) : Subring (Polynomial (ZMod 2)) :=
  (Polynomial.eval₂RingHom (Polynomial.C : ZMod 2 →+* Polynomial (ZMod 2))
    (Polynomial.X ^ n)).range

-- pClosureRoot
/-- The subring generated by T¹ already contains every polynomial; this fixes the ambient polynomial model. -/
example : powerPolynomialSubring 1 = ⊤ := by sorry

example : pIntegralClosure 2 (Polynomial (ZMod 2)) (powerPolynomialSubring 2) = ⊤ := by sorry
-- pClosureNotOrdinary
example :
    pIntegralClosure 2 (Polynomial (ZMod 2)) (powerPolynomialSubring 3) =
      powerPolynomialSubring 3 ∧
    (integralClosure (powerPolynomialSubring 3) (Polynomial (ZMod 2))).toSubring = ⊤ ∧
    powerPolynomialSubring 3 ≠ ⊤ := by sorry

section AlgebraicTargets
variable (R : Type u) [CommRing R]
/-- All p-primary torsion in an integral perfectoid ring is killed by p, including exponent zero. -/
theorem perfectoid_p_torsion_killed_by_p (h : IsIntegralPerfectoid p R)
    (n : ℕ) (x : R) (hx : (p : R) ^ n * x = 0) : (p : R) * x = 0 := by sorry

/-- Every integral perfectoid ring is reduced, allowing p-torsion. -/
theorem integralPerfectoid_reduced (h : IsIntegralPerfectoid p R) : IsReduced R := by sorry

/-- Every entry of a compatible root tower has the same annihilator. -/
theorem compatible_root_annihilator (h : IsIntegralPerfectoid p R)
    (a : Perfection R p) (n : ℕ) (x : R) :
    a.val n * x = 0 ↔ a.val 0 * x = 0 := by sorry

/-- For a compatible-root element, power torsion equals its annihilator. -/
theorem compatible_root_power_torsion (h : IsIntegralPerfectoid p R)
    (a : Perfection R p) (x : R) :
    (∃ n : ℕ, (a.val 0) ^ n * x = 0) ↔ a.val 0 * x = 0 := by sorry

-- The Z_p action is unique on these p-complete rings; ordinary ring carriers suffice here.
/-- An arbitrary small product is integral perfectoid exactly when every factor is, including an empty product. -/
theorem integralPerfectoid_pi_iff (ι : Type v) (A : ι → Type u) [∀ i, CommRing (A i)] :
    IsIntegralPerfectoid p (∀ i, A i) ↔ ∀ i, IsIntegralPerfectoid p (A i) := by sorry

/-- For a π-complete perfectoid ring with π^p dividing p, remove the actual localization kernel to obtain a π-torsion-free perfectoid quotient. -/
theorem perfectoid_torsion_free_quotient (h : IsIntegralPerfectoid p R)
    (π : R) (hπ : ∃ a : R, π ^ p * a = (p : R))
    [IsAdicComplete (Ideal.span {π}) R] :
    IsIntegralPerfectoid p (R ⧸ RingHom.ker (algebraMap R (Localization.Away π))) ∧
    ∀ x : R ⧸ RingHom.ker (algebraMap R (Localization.Away π)),
      Ideal.Quotient.mk _ π * x = 0 → x = 0 := by sorry

section Kernel
variable [Fact (¬ IsUnit (p : R))] [IsAdicComplete (Ideal.span {(p : R)}) R]
/-- A member of the Fontaine kernel generates it exactly when its first Witt coordinate is a unit. -/
theorem theta_generator_iff_unit_coeff_one (h : IsIntegralPerfectoid p R)
    (ξ : WittVector p (PreTilt R p)) (hξ : ξ ∈ RingHom.ker (WittVector.fontaineTheta R p)) :
    RingHom.ker (WittVector.fontaineTheta R p) = Ideal.span {ξ} ↔ IsUnit (ξ.coeff 1) := by sorry

/-- Every Fontaine-kernel generator of an integral perfectoid ring is a nonzerodivisor. -/
theorem theta_generator_nonzerodivisor (h : IsIntegralPerfectoid p R)
    (ξ : WittVector p (PreTilt R p))
    (hξ : RingHom.ker (WittVector.fontaineTheta R p) = Ideal.span {ξ}) :
    ∀ x : WittVector p (PreTilt R p), ξ * x = 0 → x = 0 := by sorry

/-- Ordinary completion at a finite ideal of sharp elements is perfectoid; the full target also compares derived completion and tilts. -/
theorem perfectoid_sharp_ideal_completion (h : IsIntegralPerfectoid p R)
    (r : ℕ) (a : Fin r → PreTilt R p) :
    IsIntegralPerfectoid p
      (AdicCompletion (Ideal.span (Set.range (fun i => (a i).untilt))) R) := by sorry
end Kernel
/-- In cohomological notation M[1] has M in degree −1 and zero in degree 0. -/
example :
    let M := ModuleCat.of ℤ ℤ
    let K := (HomologicalComplex.single (ModuleCat ℤ) (ComplexShape.up ℤ) 0).obj M
    ((CochainComplex.shiftFunctor (ModuleCat ℤ) 1).obj K).X (-1) = M ∧
      CategoryTheory.Limits.IsZero (((CochainComplex.shiftFunctor (ModuleCat ℤ) 1).obj K).X 0) := by sorry
end AlgebraicTargets

end ClosureAndOperations

section RootClosureCompletion
variable (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R]

/-- The canonical p-power ring map R/(π) → R/(π^p), where π^p divides p.
The divisibility makes the target characteristic dividing p and makes the
representative formula well defined, including the zero quotient. -/
private def quotientPowerMap (π : R) (hπ : ∃ a : R, π ^ p * a = (p : R)) :
    R ⧸ Ideal.span {π} →+* R ⧸ Ideal.span {π ^ p} := by sorry

/-- The quotient p-power map agrees with pth powers of representatives. -/
private theorem quotientPowerMap_mk (π : R)
    (hπ : ∃ a : R, π ^ p * a = (p : R)) (x : R) :
    quotientPowerMap p R π hπ (Ideal.Quotient.mk (Ideal.span {π}) x) =
      Ideal.Quotient.mk (Ideal.span {π ^ p}) (x ^ p) := by sorry

/-- For regular π with π^p dividing p, injectivity of R/(π) → R/(π^p) is ambient p-root closedness in R[1/π]. -/
theorem perfectoid_p_integral_closedness (π : R)
    (hπ : ∃ a : R, π ^ p * a = (p : R))
    (hreg : ∀ x : R, π * x = 0 → x = 0) :
    Function.Injective (quotientPowerMap p R π hπ) ↔
      ∀ b : Localization.Away π,
        b ^ p ∈ (algebraMap R (Localization.Away π)).range →
        b ∈ (algebraMap R (Localization.Away π)).range := by sorry

/-- A compatible regular root tower and surjective quotient Frobenius make the π-completed ambient root closure perfectoid. -/
theorem completion_pIntegralClosure_perfectoid (π : R)
    (hπ : ∃ a : R, π ^ p * a = (p : R))
    (hreg : ∀ x : R, π * x = 0 → x = 0)
    (hroot : ∃ a : Perfection R p, a.val 0 = π)
    (hF : Function.Surjective (quotientPowerMap p R π hπ)) :
    let C := pIntegralClosure p (Localization.Away π)
      (algebraMap R (Localization.Away π)).range
    ∃ t : C, (t : Localization.Away π) = algebraMap R (Localization.Away π) π ∧
      IsIntegralPerfectoid p (AdicCompletion (Ideal.span {t}) C) := by sorry

/-- The π-completion of a quotient by a set containing pth roots of its members is perfectoid; this is the sufficient special case of §0.6. -/
theorem perfectoid_completed_root_quotient (h : IsIntegralPerfectoid p R)
    (π : R) (hπ : ∃ a : R, π ^ p * a = (p : R))
    [IsAdicComplete (Ideal.span {π}) R] (s : Set R)
    (hs : ∀ x ∈ s, ∃ y ∈ s, y ^ p = x) :
    IsIntegralPerfectoid p
      (AdicCompletion (Ideal.span {Ideal.Quotient.mk (Ideal.span s) π})
        (R ⧸ Ideal.span s)) := by sorry


/-- At π=1 both cross-quotients are zero; the map is bijective. -/
example : Function.Bijective (quotientPowerMap 2 ℤ 1 ⟨2, by norm_num⟩) := by sorry

/-- At π=0 over F₂, the map squares in F₂ and hence is bijective. -/
example : Function.Bijective (quotientPowerMap 2 (ZMod 2) 0
    ⟨0, by rw [mul_zero]; exact (CharP.cast_eq_zero (ZMod 2) 2).symm⟩) := by sorry

/-- In characteristic 2 the source is modulo T and the target modulo T²; the map squares representatives. -/
example :
    let R := Polynomial (ZMod 2)
    let π : R := Polynomial.X
    let hπ : ∃ a : R, π ^ 2 * a = (2 : R) := ⟨0, by rw [mul_zero]; exact (CharP.cast_eq_zero R 2).symm⟩
    quotientPowerMap 2 R π hπ (Ideal.Quotient.mk (Ideal.span {π}) (1 + π)) =
      Ideal.Quotient.mk (Ideal.span {π ^ 2}) 1 := by sorry

end RootClosureCompletion
end IntegralAlgebra

/-! ## Layer 1: initial prisms and universal perfectoidization -/

section Perfectoidization
variable (p : ℕ) [Fact p.Prime]
/-- Concrete ordinary-module criterion of Stacks 091P(7).
DD.1 owns derived completeness; this private specialization exposes no second generic API. -/
private def pCompletionTowerMap (S : Type u) [CommRing S] (a : ℕ → S) : ℕ → S :=
  fun n => a n - (p : S) * a (n + 1)

/-- An ordinary ring is semiperfectoid when its derived-completion difference operator is bijective and it is a quotient of an integral perfectoid ring. Presentations are existential in a fixed universe. -/
def IsSemiperfectoid (S : Type u) [CommRing S] : Prop :=
  Function.Bijective (pCompletionTowerMap p S) ∧
  ∃ (R : Type u) (_ : CommRing R), IsIntegralPerfectoid p R ∧
    ∃ f : R →+* S, Function.Surjective f

variable (S : Type u) [CommRing S]
/-- A semiperfectoid ring has an actual surjective integral-perfectoid presentation. -/
theorem IsSemiperfectoid.presentation (h : IsSemiperfectoid p S) :
    ∃ (R : Type u) (_ : CommRing R), IsIntegralPerfectoid p R ∧
      ∃ f : R →+* S, Function.Surjective f := by sorry

/-- The ordinary-module difference operator is bijective for a semiperfectoid ring. -/
theorem IsSemiperfectoid.derived_complete (h : IsSemiperfectoid p S) :
    Function.Bijective (pCompletionTowerMap p S) := by sorry

/-- An integral perfectoid ring is semiperfectoid with its identity presentation. -/
theorem IsSemiperfectoid.of_perfectoid (h : IsIntegralPerfectoid p S) :
    IsSemiperfectoid p S := by sorry

/-- Ring equivalences preserve and reflect semiperfectoidness. -/
theorem IsSemiperfectoid.congr (T : Type u) [CommRing T] (e : S ≃+* T) :
    IsSemiperfectoid p S ↔ IsSemiperfectoid p T := by sorry

-- The API is the comparison of completeness predicates, with the torsion bound explicit.
/-- With bounded p-primary torsion, the tower criterion agrees with classical p-completeness. -/
theorem IsSemiperfectoid.classically_complete_of_bounded
    (hb : ∃ n : ℕ, ∀ m : ℕ, ∀ x : S, (p : S) ^ m * x = 0 → (p : S) ^ n * x = 0) :
    Function.Bijective (pCompletionTowerMap p S) ↔
      IsAdicComplete (Ideal.span {(p : S)}) S := by sorry

/-- The tower difference has the sign a₀ − p a₁: at p=2, (1,1,0,…) maps to (−1,1,0,…). -/
example :
    pCompletionTowerMap 2 ℤ (fun n => if n < 2 then 1 else 0) 0 = -1 ∧
      pCompletionTowerMap 2 ℤ (fun n => if n < 2 then 1 else 0) 1 = 1 := by decide

/-- In characteristic p the tower map is the identity, not a one-step shift. -/
example (a : ℕ → ZMod p) : pCompletionTowerMap p (ZMod p) a = a := by sorry

/-- Inverting 2 destroys uniqueness of completion: the geometric sequence is a nonzero kernel element. -/
example : ¬ Function.Injective (pCompletionTowerMap 2 ℚ) := by sorry

-- semiperfectoidZero
example : IsSemiperfectoid p (ZMod 1) := by sorry
-- semiperfectoidRootQuotient
example :
    let A := PerfectClosure (Polynomial (ZMod 2)) 2
    let I := Ideal.span {PerfectClosure.of (Polynomial (ZMod 2)) 2 Polynomial.X}
    IsSemiperfectoid 2 (A ⧸ I) ∧ ¬ IsIntegralPerfectoid 2 (A ⧸ I) := by sorry
-- semiperfectoidIdentity
example (h : IsIntegralPerfectoid p S) : IsSemiperfectoid p S := by sorry
-- semiperfectoidPolynomialFails
example : ¬ IsSemiperfectoid p (Polynomial (ZMod p)) := by sorry

/-- A commutative integral perfectoid ring under S with unique factorization of every map from S to an integral perfectoid target. -/
structure PerfectoidizationData where
  Carrier : Type u
  [ring : CommRing Carrier]
  eta : S →+* Carrier
  isPerfectoid : IsIntegralPerfectoid p Carrier
  universal : ∀ (T : Type u) [CommRing T], IsIntegralPerfectoid p T →
    ∀ f : S →+* T, ∃! g : Carrier →+* T, g.comp eta = f
attribute [instance] PerfectoidizationData.ring

/-- Every semiperfectoid ring has an initial ring-valued integral perfectoidization. -/
theorem existsPerfectoidization (h : IsSemiperfectoid p S) :
    Nonempty (PerfectoidizationData p S) := by sorry

/-- Choose an actual universal perfectoid ring and its unit under S. -/
private def perfectoidizationData (h : IsSemiperfectoid p S) : PerfectoidizationData p S :=
  Classical.choice (existsPerfectoidization p S h)

/-- The chosen universal integral perfectoid ring under the semiperfectoid ring S. -/
def perfectoidization (h : IsSemiperfectoid p S) : Type u :=
  (perfectoidizationData p S h).Carrier

/-- The universal perfectoidization carries the chosen commutative ring structure. -/
instance perfectoidization.commRing (h : IsSemiperfectoid p S) :
    CommRing (perfectoidization p S h) :=
  (perfectoidizationData p S h).ring

/-- The canonical ring map from S to its universal perfectoidization. -/
def perfectoidization.eta (h : IsSemiperfectoid p S) : S →+* perfectoidization p S h :=
  (perfectoidizationData p S h).eta

/-- The universal perfectoidization satisfies the actual integral predicate. -/
theorem perfectoidization.isIntegralPerfectoid (h : IsSemiperfectoid p S) :
    IsIntegralPerfectoid p (perfectoidization p S h) := by sorry

/-- The unique extension of a ring map S → T to a perfectoid target. -/
def perfectoidization.lift (h : IsSemiperfectoid p S) (T : Type u) [CommRing T]
    (hT : IsIntegralPerfectoid p T) (f : S →+* T) : perfectoidization p S h →+* T :=
  Classical.choose ((perfectoidizationData p S h).universal T hT f)

/-- Extending a map along the unit recovers that map on S. -/
theorem perfectoidization.lift_eta (h : IsSemiperfectoid p S) (T : Type u) [CommRing T]
    (hT : IsIntegralPerfectoid p T) (f : S →+* T) :
    (perfectoidization.lift p S h T hT f).comp (perfectoidization.eta p S h) = f := by sorry

/-- Maps from the universal ring to a perfectoid target are determined on S. -/
theorem perfectoidization.lift_unique (h : IsSemiperfectoid p S) (T : Type u) [CommRing T]
    (hT : IsIntegralPerfectoid p T) (g₁ g₂ : perfectoidization p S h →+* T)
    (he : g₁.comp (perfectoidization.eta p S h) = g₂.comp (perfectoidization.eta p S h)) :
    g₁ = g₂ := by sorry

/-- A ring map S → T induces a covariant map between perfectoidizations. -/
def perfectoidization.map (h : IsSemiperfectoid p S) (T : Type u) [CommRing T]
    (hT : IsSemiperfectoid p T) (f : S →+* T) :
    perfectoidization p S h →+* perfectoidization p T hT :=
  perfectoidization.lift p S h _ (perfectoidization.isIntegralPerfectoid p T hT)
    ((perfectoidization.eta p T hT).comp f)

/-- The units commute with the covariant perfectoidization map. -/
theorem perfectoidization.map_eta (h : IsSemiperfectoid p S) (T : Type u) [CommRing T]
    (hT : IsSemiperfectoid p T) (f : S →+* T) :
    (perfectoidization.map p S h T hT f).comp (perfectoidization.eta p S h) =
      (perfectoidization.eta p T hT).comp f := by sorry

/-- Perfectoidization preserves identity ring maps. -/
theorem perfectoidization.map_id (h : IsSemiperfectoid p S) :
    perfectoidization.map p S h S h (RingHom.id S) = RingHom.id _ := by sorry

/-- Perfectoidization preserves composition in the order S → T → U. -/
theorem perfectoidization.map_comp (h : IsSemiperfectoid p S)
    (T U : Type u) [CommRing T] [CommRing U]
    (hT : IsSemiperfectoid p T) (hU : IsSemiperfectoid p U)
    (f : S →+* T) (g : T →+* U) :
    perfectoidization.map p S h U hU (g.comp f) =
      (perfectoidization.map p T hT U hU g).comp (perfectoidization.map p S h T hT f) := by sorry

/-- For an integral perfectoid source, the unit itself is a ring equivalence. -/
theorem perfectoidization.of_perfectoid (h : IsIntegralPerfectoid p S) :
    ∃ e : S ≃+* perfectoidization p S (IsSemiperfectoid.of_perfectoid p S h),
      e.toRingHom = perfectoidization.eta p S (IsSemiperfectoid.of_perfectoid p S h) := by sorry

/-- Two universal rings under S have a unique equivalence preserving their units. -/
theorem perfectoidization.presentation_independent (h : IsSemiperfectoid p S)
    (E : PerfectoidizationData p S) :
    ∃! e : perfectoidization p S h ≃+* E.Carrier,
      e.toRingHom.comp (perfectoidization.eta p S h) = E.eta := by sorry

-- perfectoidizationZero
example (h : IsSemiperfectoid p (ZMod 1)) :
    Function.Bijective (perfectoidization.eta p (ZMod 1) h) := by sorry
-- perfectoidizationPerfect
example (h : IsIntegralPerfectoid p S) :
    Function.Bijective (perfectoidization.eta p S (IsSemiperfectoid.of_perfectoid p S h)) := by sorry
-- perfectoidizationRootQuotient
example :
    let A := PerfectClosure (Polynomial (ZMod 2)) 2
    let I := Ideal.span {PerfectClosure.of (Polynomial (ZMod 2)) 2 Polynomial.X}
    ∀ h : IsSemiperfectoid 2 (A ⧸ I),
      (∃ e : perfectoidization 2 (A ⧸ I) h ≃+* A ⧸ I.radical,
        e.toRingHom.comp (perfectoidization.eta 2 (A ⧸ I) h) =
          Ideal.quotientMap I.radical (RingHom.id A) (by sorry)) ∧
      ¬ Function.Injective (perfectoidization.eta 2 (A ⧸ I) h) := by sorry
-- perfectoidizationTwoPresentations
example (h : IsSemiperfectoid p S) (E₁ E₂ : PerfectoidizationData p S) :
    ∃! e : E₁.Carrier ≃+* E₂.Carrier, e.toRingHom.comp E₁.eta = E₂.eta := by sorry


/-- The induced maps follow S→T→U: swap then second projection sends (0,1) to 0, whereas the second projection alone gives 1. -/
example :
    let S := ZMod 2 × ZMod 2
    let hS : IsSemiperfectoid 2 S := by sorry
    let hT : IsSemiperfectoid 2 (ZMod 2) := by sorry
    let f : S →+* S := (RingEquiv.prodComm : S ≃+* S).toRingHom
    let g := RingHom.snd (ZMod 2) (ZMod 2)
    (perfectoidization.map 2 S hS (ZMod 2) hT (g.comp f))
      (perfectoidization.eta 2 S hS (0,1)) = perfectoidization.eta 2 (ZMod 2) hT 0 ∧
    (perfectoidization.map 2 S hS (ZMod 2) hT g)
      (perfectoidization.eta 2 S hS (0,1)) = perfectoidization.eta 2 (ZMod 2) hT 1 ∧
      perfectoidization.eta 2 (ZMod 2) hT 0 ≠ perfectoidization.eta 2 (ZMod 2) hT 1 := by sorry

end Perfectoidization

/-! ## Layer 2: prism covers and adjoining roots -/

/-! ## Layer 3: universal perfectoid quotients -/

section CharacteristicPQuotients
variable (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R]
section Quotients
variable [hchar : CharP R p]
include hchar

omit hchar in
/-- A surjective power function remains surjective on every ring quotient. -/
theorem quotient_pow_surjective (h : Function.Surjective (fun x : R => x ^ p))
    (I : Ideal R) : Function.Surjective (fun x : R ⧸ I => x ^ p) := by sorry

/-- A quotient of a perfect characteristic-p ring is perfect exactly for radical ideals, including the unit ideal. -/
theorem quotient_perfect_iff_radical [PerfectRing R p] (I : Ideal R) :
    PerfectRing (R ⧸ I) p ↔ I.IsRadical := by sorry

/-- The radical quotient of a perfect characteristic-p ring is integral perfectoid. -/
theorem radical_quotient_integralPerfectoid [PerfectRing R p] (I : Ideal R) :
    IsIntegralPerfectoid p (R ⧸ I.radical) := by sorry

/-- Maps killing I into any integral perfectoid target factor uniquely through the radical quotient. -/
theorem radical_quotient_universal [PerfectRing R p] (I : Ideal R)
    (T : Type v) [CommRing T] (hT : IsIntegralPerfectoid p T)
    (f : R →+* T) (hf : I ≤ RingHom.ker f) :
    ∃! g : R ⧸ I.radical →+* T, g.comp (Ideal.Quotient.mk I.radical) = f := by sorry

-- The quotient need not have characteristic exactly p: I = top gives zero.
-- topQuotient
example [PerfectRing R p] : IsIntegralPerfectoid p (R ⧸ (⊤ : Ideal R)) := by sorry
-- zeroQuotient
example [PerfectRing R p] : IsIntegralPerfectoid p (R ⧸ (⊥ : Ideal R)) := by sorry
-- nonradicalQuotient
example [PerfectRing R p] (I : Ideal R) (h : ¬ I.IsRadical) :
    ¬ PerfectRing (R ⧸ I) p := by sorry

-- Single-step roots and their ideal, on an existing perfect ring.
/-- The ideal of all inverse-Frobenius roots of f equals the radical of (f). -/
theorem root_span_eq_radical [PerfectRing R p] (f : R) :
    Ideal.span (Set.range (fun n : ℕ => ((frobeniusEquiv R p).symm^[n]) f)) =
      (Ideal.span {f}).radical := by sorry

/-- A quotient of a perfect characteristic-p ring is integral perfectoid exactly for radical ideals. -/
theorem quotient_perfectoid_iff_radical [PerfectRing R p] (I : Ideal R) :
    IsIntegralPerfectoid p (R ⧸ I) ↔ I.IsRadical := by sorry

-- rootZero
example [PerfectRing R p] :
    Ideal.span (Set.range (fun n : ℕ => ((frobeniusEquiv R p).symm^[n]) (0 : R))) = ⊥ := by sorry
-- rootOne
example [PerfectRing R p] :
    Ideal.span (Set.range (fun n : ℕ => ((frobeniusEquiv R p).symm^[n]) (1 : R))) = ⊤ := by sorry
-- rootKilled
example [PerfectRing R p] (f : R) (n : ℕ) :
    Ideal.Quotient.mk (Ideal.span {f}).radical
      (((frobeniusEquiv R p).symm^[n]) f) = 0 := by sorry
end Quotients
/-- The first three roots go in the inverse-Frobenius direction: r₀=t, r₁²=t, r₂⁴=t. -/
example :
    let A := PerfectClosure (Polynomial (ZMod 2)) 2
    let t : A := PerfectClosure.of (Polynomial (ZMod 2)) 2 Polynomial.X
    (((frobeniusEquiv A 2).symm^[0]) t) = t ∧
      (((frobeniusEquiv A 2).symm^[1]) t) ^ 2 = t ∧
      (((frobeniusEquiv A 2).symm^[2]) t) ^ 4 = t := by sorry

/-- The nonradical quotient kills t but retains its nonzero square-zero root. -/
example :
    let A := PerfectClosure (Polynomial (ZMod 2)) 2
    let t : A := PerfectClosure.of (Polynomial (ZMod 2)) 2 Polynomial.X
    let I := Ideal.span {t}
    Ideal.Quotient.mk I t = 0 ∧
      Ideal.Quotient.mk I ((frobeniusEquiv A 2).symm t) ≠ 0 ∧
      (Ideal.Quotient.mk I ((frobeniusEquiv A 2).symm t)) ^ 2 = 0 := by sorry

end CharacteristicPQuotients

section UniversalQuotients
variable (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R]
variable (S : Type u) [CommRing S]
/-- The unit of every ordinary semiperfectoid ring is surjective (BS Theorem 7.4). -/
theorem perfectoidization_surjective (h : IsSemiperfectoid p S) :
    Function.Surjective (perfectoidization.eta p S h) := by sorry


/-- The completed quotient by all specified roots realizes the principal quotient’s perfectoidization and its surjective unit. -/
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

end UniversalQuotients

/- The full supplier-carrier targets in README.md include:
§0.2 frobenius_surjectivity_equivalences, integralPerfectoid_bms_iff,
principal_theta_kernel_criterion, theta_generator_normal_form,
theta_map_preserves_generator; §0.3 perfectoid_cotangent_mod_p_vanishes,
perfectoid_absolute_cotangent; §0.4 perfectoid_compatible_roots_iterated_frobenius
(the finite-quotient clauses); §0.6 perfectoid_completely_etale_henselization,
perfectoid_completed_root_polynomial, perfectoid_completed_tensor;
§0.7 bhatt_integral_model_comparison;
§1.1 initialPrism and its API/checks; §1.3
perfectoidization_complete_flat_base_change, perfectoidization_completed_filtered_colimits;
§2.1 relative_perfectoid_cover_smooth_site, frobenius_flat_prism_perfection_cover;
§2.2 andre_flatness, andre_ind_syntomic_mod_p; §2.3 bhatt_root_neighborhoods,
bhattRootExtension and its API/checks; §2.4
bhatt_root_extension_almost_faithfully_flat, functorial_almost_aic_extension;
§3.3 perfectoidClosedQuotient and its API/checks,
zariskiClosed_is_stronglyZariskiClosed. -/

end
end TauCetiRoadmap.PerfectoidQuotients
