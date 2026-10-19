import Mathlib

/-!
# K3BlochGroups: representative target signatures

The roadmap is README.md. This file records light definitions and representative signatures
statable against the pinned APIs; it is not exhaustive. It fixes the order of the homological
comparison, uses actual unnormalised group-homology cycles, distinguishes root multiples from
division over coefficients, and retains the inverse scalar in the finite Chern comparison.
-/

namespace TauCetiRoadmap.K3BlochGroups

open CategoryTheory TensorProduct

/-! ## Layer 1: Homological K₃ of a ring -/

namespace K3Homological

variable {K P H J S : Type*}
variable [AddCommGroup K] [AddCommGroup P] [AddCommGroup H]
variable [AddCommGroup J] [AddCommGroup S]

/-- Compose the four specified supplier equivalences in the order of §1.2. -/
def comparison (q : P ≃+ K) (h : P ≃+ H) (j : J ≃+ H) (b : J ≃+ S) : K ≃+ S :=
  ((q.symm.trans h).trans j.symm).trans b

/-- The canonical comparison is evaluated by first reversing the plus-space map. -/
theorem comparison_apply (q : P ≃+ K) (h : P ≃+ H) (j : J ≃+ H)
    (b : J ≃+ S) (x : K) : comparison q h j b x = b (j.symm (h (q.symm x))) := by
  sorry

example : comparison (AddEquiv.refl ℤ) (AddEquiv.refl ℤ)
    (AddEquiv.refl ℤ) (AddEquiv.refl ℤ) 3 = 3 := by
  rfl

example (q : ZMod 5 ≃+ ZMod 5) (hq : ∀ x, q x = (2 : ZMod 5) * x) :
    comparison q (AddEquiv.refl (ZMod 5)) (AddEquiv.refl (ZMod 5))
      (AddEquiv.refl (ZMod 5)) 1 = 3 := by
  change q.symm 1 = 3
  apply q.injective
  rw [q.apply_symm_apply, hq]
  decide

/-- The comparison detects zero; its injectivity is essential. -/
theorem comparison_eq_zero (q : P ≃+ K) (h : P ≃+ H) (j : J ≃+ H)
    (b : J ≃+ S) (x : K) : comparison q h j b x = 0 ↔ x = 0 := by
  sorry

/-- The trivial integral coefficient representation; this is Mathlib's carrier. -/
abbrev integralRep (G : Type) [Group G] := Rep.trivial ℤ G ℤ

variable {G : Type} [Group G] {A : Type} [AddCommGroup A]

/-- Evaluate an actual cycle through its homology class and the supplied comparison. -/
noncomputable def eval3 (c : A ≃+ groupHomology (integralRep G) 3) :
    groupHomology.cycles (integralRep G) 3 →+ A :=
  c.symm.toAddMonoidHom.comp (groupHomology.π (integralRep G) 3).hom.toAddMonoidHom

/-- Finite four-chain witnesses characterize equality of evaluated three-cycles. -/
theorem eval3_eq_iff_certificate (c : A ≃+ groupHomology (integralRep G) 3)
    (z z' : groupHomology.cycles (integralRep G) 3) :
    eval3 c z = eval3 c z' ↔
      ∃ w : (Fin 4 → G) →₀ ℤ,
        groupHomology.toCycles (integralRep G) 4 3 w = z - z' := by
  sorry

/-- Every element has a finite-cycle representative. -/
theorem eval3_surjective (c : A ≃+ groupHomology (integralRep G) 3) :
    Function.Surjective (eval3 c) := by
  sorry

example (c : A ≃+ groupHomology (integralRep G) 3) : eval3 c 0 = 0 := by
  exact map_zero _

example (c : A ≃+ groupHomology (integralRep G) 3)
    (w : (Fin 4 → G) →₀ ℤ) :
    eval3 c (groupHomology.toCycles (integralRep G) 4 3 w) = 0 := by
  change c.symm ((groupHomology.π (integralRep G) 3)
    (groupHomology.toCycles (integralRep G) 4 3 w)) = 0
  have hz := congrArg (fun f => f w)
    ((groupHomology.inhomogeneousChains (integralRep G)).toCycles_comp_homologyπ 4 3)
  change (groupHomology.π (integralRep G) 3)
    (groupHomology.toCycles (integralRep G) 4 3 w) = 0 at hz
  rw [hz, map_zero]

/-- Identity entries survive in the unnormalised bar complex: d₄[1|1|1|1]=[1|1|1]. -/
theorem bar_four_identity_boundary : groupHomology.inhomogeneousChains.d (integralRep G) 3
    (Finsupp.single (fun _ : Fin 4 => (1 : G)) 1) =
      Finsupp.single (fun _ : Fin 3 => (1 : G)) 1 := by
  sorry

/-- The chain [g|1|1] is not a cycle when g is nonidentity. -/
theorem bar_noncycle (g : G) (hg : g ≠ 1) :
    groupHomology.inhomogeneousChains.d (integralRep G) 2
      (Finsupp.single (fun i : Fin 3 => if i = 0 then g else 1) 1) ≠ 0 := by
  sorry

end K3Homological

/-! ## Layer 2: Decomposable and indecomposable K₃ -/

/-- The number-field model retains a nonzero decomposable element in the kernel. -/
theorem rational_quotient_kernel : (24 : ZMod 48) ≠ 0 ∧
    ZMod.castHom (show 24 ∣ 48 by decide) (ZMod 24) (24 : ZMod 48) = 0 := by
  sorry

/-- The rational K₃ quotient model has no additive section. -/
theorem rational_quotient_nonsplit : ¬ ∃ s : ZMod 24 →+ ZMod 48,
    (ZMod.castHom (show 24 ∣ 48 by decide) (ZMod 24)).toAddMonoidHom.comp s =
      AddMonoidHom.id (ZMod 24) := by
  sorry

/-! ## Layer 3: Bloch presentations with integral conventions -/

namespace Symbols

variable {F : Type*} [Field F]

/-- Nondegenerate reduced generators; the pre-Bloch quotient is a later target. -/
abbrev RawSymbols (F : Type*) [Field F] := FreeAbelianGroup {x : F // x ≠ 0 ∧ x ≠ 1}

/-- Extend the reduced free-symbol map by zero at zero and one. -/
noncomputable def rawSymbol (x : F) : RawSymbols F := by
  classical
  exact if h : x ≠ 0 ∧ x ≠ 1 then FreeAbelianGroup.of ⟨x, h⟩ else 0

/-- The admissibility predicate forbids every zero denominator and coincident pair. -/
def Admissible (x y : F) : Prop := x ≠ 0 ∧ x ≠ 1 ∧ y ≠ 0 ∧ y ≠ 1 ∧ x ≠ y

/-- Suslin's five terms in the reduced free group, with the ordered fractions fixed. -/
noncomputable def fiveTermRaw (x y : F) (_h : Admissible x y) : RawSymbols F :=
  rawSymbol x - rawSymbol y + rawSymbol (y / x) -
    rawSymbol ((1 - x⁻¹) / (1 - y⁻¹)) + rawSymbol ((1 - x) / (1 - y))

/-- Reflection of a relation gives the explicit independence certificate for c. -/
theorem fiveTermRaw_oneSub (x y : F) (h : Admissible x y)
    (h' : Admissible (1 - y) (1 - x)) :
    fiveTermRaw x y h - fiveTermRaw (1 - y) (1 - x) h' =
      rawSymbol x + rawSymbol (1 - x) - rawSymbol y - rawSymbol (1 - y) := by
  sorry

example : rawSymbol (0 : F) = 0 ∧ rawSymbol (1 : F) = 0 := by
  simp [rawSymbol]

example : rawSymbol (2 : ℚ) ≠ 0 := by
  simp [rawSymbol, FreeAbelianGroup.of_ne_zero]

example (x : F) : ¬ Admissible x x ∧ ¬ Admissible x 1 := by
  simp [Admissible]

example : Admissible (2 : ℚ) 3 := by
  norm_num [Admissible]

example (h : Admissible (2 : ℚ) 3) :
    fiveTermRaw (2 : ℚ) 3 h = rawSymbol 2 - rawSymbol 3 + rawSymbol (3 / 2) -
      rawSymbol (3 / 4) + rawSymbol (1 / 2) := by
  norm_num [fiveTermRaw]

/-- The ordered valuation pairing sends the boundary of [3] to −1 (§3.5). -/
theorem blochBoundary_valuation_sign : padicValRat 2 (3 : ℚ) * padicValRat 3 (1 - (3 : ℚ)) -
    padicValRat 3 (3 : ℚ) * padicValRat 2 (1 - (3 : ℚ)) = -1 := by
  sorry

end Symbols

/-! ## Layer 4: Configuration homology and the Suslin sequence -/

/-- The power-two endomorphism acts on cyclic H₃ with weight two, rather than weight one. -/
theorem cyclic_seven_power_two
    (φ : K3Homological.integralRep (Multiplicative (ZMod 7)) ⟶
      Rep.res (powMonoidHom 2) (K3Homological.integralRep (Multiplicative (ZMod 7))))
    (hφ : φ.hom.toLinearMap = LinearMap.id) :
    ∃ e : groupHomology (K3Homological.integralRep (Multiplicative (ZMod 7))) 3 ≃+
        ZMod 7,
      ∀ z, e (groupHomology.map (powMonoidHom 2) φ 3 z) = 4 * e z := by
  sorry

/-! ## Layer 5: Finite fields and arithmetic examples -/

/-- The prime-to-characteristic part of unstable SL₂ homology is cyclic of order q²−1.
Hutchinson, Corollary 3.6, arXiv v2, pp14–15. -/
theorem finite_sl2_localized_homology (F : Type) [Field F] [Fintype F]
    (p : ℕ) [Fact p.Prime] [CharP F p] :
    Nonempty (groupHomology
      (Rep.trivial (Localization (Submonoid.powers (p : ℤ)))
        (Matrix.SpecialLinearGroup (Fin 2) F)
        (Localization (Submonoid.powers (p : ℤ)))) 3 ≃+
      ZMod (Fintype.card F ^ 2 - 1)) := by
  sorry

/-! ## Layer 6: Certificates and coefficient comparisons -/

section Roots

variable {P W : Type*} [AddCommGroup P] [AddCommGroup W]

/-- Form the integral multiple in the actual additive kernel, retaining its annihilator. -/
def rootMultiple (δ : P →+ W) (x : P) (m : ℕ) (h : δ (m • x) = 0) : δ.ker :=
  ⟨m • x, h⟩

variable {R : Type*} [CommRing R]

/-- Divide the integral multiple using a specified unit; flatness is not assumed. -/
def rootCoefficient (δ : P →+ W) (x : P) (m : ℕ) (h : δ (m • x) = 0)
    (u : Rˣ) (_hu : (u : R) = (m : R)) : δ.ker ⊗[ℤ] R :=
  rootMultiple δ x m h ⊗ₜ[ℤ] ((u⁻¹ : Rˣ) : R)

/-- The divided multiple maps to the original symbol in the raw tensor group. -/
theorem rootCoefficient_toPre (δ : P →+ W) (x : P) (m : ℕ) (h : δ (m • x) = 0)
    (u : Rˣ) (hu : (u : R) = (m : R)) :
    TensorProduct.map δ.ker.subtype.toIntLinearMap (LinearMap.id : R →ₗ[ℤ] R)
      (rootCoefficient δ x m h u hu) = x ⊗ₜ[ℤ] (1 : R) := by
  sorry

/-- Two invertible annihilators give the same divided tensor class. -/
theorem rootCoefficient_denominator_independent (δ : P →+ W) (x : P) (m l : ℕ)
    (h : δ (m • x) = 0) (h' : δ (l • x) = 0)
    (u v : Rˣ) (hu : (u : R) = (m : R)) (hv : (v : R) = (l : R)) :
    rootCoefficient δ x m h u hu = rootCoefficient δ x l h' v hv := by
  sorry

example (h : (Int.castAddHom (ZMod 2)) (2 • (1 : ℤ)) = 0) :
    (rootMultiple (Int.castAddHom (ZMod 2)) 1 2 h : ℤ) = 2 := by
  rfl

example (δ : P →+ W) (x : P) (h : δ (0 • x) = 0) :
    rootMultiple δ x 0 h = 0 := by
  apply Subtype.ext
  exact zero_nsmul x

example (h : (Int.castAddHom (ZMod 2)) (2 • (1 : ℤ)) = 0)
    (u : (ZMod 5)ˣ) (hu : (u : ZMod 5) = 2) :
    rootCoefficient (Int.castAddHom (ZMod 2)) 1 2 h u hu =
      rootMultiple (Int.castAddHom (ZMod 2)) 1 2 h ⊗ₜ[ℤ] (3 : ZMod 5) := by
  unfold rootCoefficient
  congr 1
  rw [show u = (⟨2, 3, by decide, by decide⟩ : (ZMod 5)ˣ) by
    apply Units.ext
    exact hu]
  decide

example (δ : P →+ W) (m : ℕ) (h : δ (m • (0 : P)) = 0)
    (u : Rˣ) (hu : (u : R) = (m : R)) : rootCoefficient δ 0 m h u hu = 0 := by
  have hz : rootMultiple δ 0 m h = 0 := by
    apply Subtype.ext
    exact nsmul_zero m
  simp [rootCoefficient, hz]

/-- Tensoring a kernel inclusion with a nonflat ring can destroy injectivity (§6.4). -/
theorem nonflat_kernel_control : (∃ t : (Int.castAddHom (ZMod 2)).ker ⊗[ℤ] ZMod 2,
    t ≠ 0 ∧ TensorProduct.map (Int.castAddHom (ZMod 2)).ker.subtype.toIntLinearMap
      (LinearMap.id : ZMod 2 →ₗ[ℤ] ZMod 2) t = 0) ∧ ¬ IsUnit (2 : ZMod 2) := by
  sorry

end Roots

section Lifts

variable {K B T : Type*} [AddCommGroup K] [AddCommGroup B] [AddCommGroup T]

/-- A lift is a fibre of the specified homomorphism, without an origin or group structure. -/
abbrev SuslinLift (q : K →+ B) (β : B) := {k : K // q k = β}

/-- Translate a fibre by a kernel element, using the supplied inclusion. -/
def SuslinLift.translate (q : K →+ B) (i : T →+ K) (hi : ∀ t, q (i t) = 0)
    (β : B) (a : SuslinLift q β) (t : T) : SuslinLift q β :=
  ⟨a.val + i t, by simp only [map_add, a.property, hi, add_zero]⟩

/-- Exactness and injectivity give the unique difference between two lifts. -/
theorem SuslinLift.unique_difference (q : K →+ B) (i : T →+ K)
    (hi : Function.Injective i) (he : ∀ k, q k = 0 ↔ ∃ t, i t = k)
    (β : B) (a b : SuslinLift q β) : ∃! t : T, b.val = a.val + i t := by
  sorry

example : Fintype.card
    (SuslinLift (ZMod.castHom (show 6 ∣ 24 by decide) (ZMod 6)).toAddMonoidHom 1) = 4 := by
  decide

/-- The finite-field torsor model has four lifts but no additive choice of lifts. -/
theorem finite_lift_nonsplit : ¬ ∃ s : ZMod 6 →+ ZMod 24,
    (ZMod.castHom (show 6 ∣ 24 by decide) (ZMod 6)).toAddMonoidHom.comp s =
      AddMonoidHom.id (ZMod 6) := by
  sorry

example (q : K →+ B) (i : T →+ K) (hi : ∀ t, q (i t) = 0)
    (β : B) (a : SuslinLift q β) : SuslinLift.translate q i hi β a 0 = a := by
  apply Subtype.ext
  simp [SuslinLift.translate]

example (q : K →+ B) (i : T →+ K) (hi : ∀ t, q (i t) = 0)
    (β : B) (a : SuslinLift q β) (s t : T) :
    SuslinLift.translate q i hi β (SuslinLift.translate q i hi β a t) s =
      SuslinLift.translate q i hi β a (s + t) := by
  apply Subtype.ext
  simp only [SuslinLift.translate, map_add]
  abel

end Lifts

section BarLifts

open K3Homological

variable {G : Type} [Group G] {B : Type} [AddCommGroup B]

/-- Finite-chain lift data use the actual cycles object and homology projection. -/
abbrev BarLiftCertificate (ψ : groupHomology (integralRep G) 3 →ₗ[ℤ] B) (β : B) :=
  {z : groupHomology.cycles (integralRep G) 3 // ψ (groupHomology.π (integralRep G) 3 z) = β}

/-- Extract the finite underlying chain without quotienting by boundaries. -/
noncomputable def BarLiftCertificate.chain
    (ψ : groupHomology (integralRep G) 3 →ₗ[ℤ] B) (β : B)
    (c : BarLiftCertificate ψ β) : (Fin 3 → G) →₀ ℤ :=
  groupHomology.iCycles (integralRep G) 3 c.val

/-- Surjectivity gives existence of a finite witness, without a synthesis algorithm. -/
theorem BarLiftCertificate.exists_of_surjective
    (ψ : groupHomology (integralRep G) 3 →ₗ[ℤ] B) (hψ : Function.Surjective ψ)
    (β : B) : Nonempty (BarLiftCertificate ψ β) := by
  sorry

example (ψ : groupHomology (integralRep G) 3 →ₗ[ℤ] B) :
    ∃ c : BarLiftCertificate ψ 0, BarLiftCertificate.chain ψ 0 c = 0 := by
  refine ⟨⟨0, by simp⟩, ?_⟩
  exact map_zero _

/-- The trivial group cannot provide a lift of a nonzero Bloch value. -/
theorem BarLiftCertificate.trivial_nonzero [Subsingleton G]
    (ψ : groupHomology (integralRep G) 3 →ₗ[ℤ] B) (β : B) (hβ : β ≠ 0) : IsEmpty (BarLiftCertificate ψ β) := by
  sorry

/-- A nonzero boundary and zero are distinct chain certificates for the same value. -/
theorem BarLiftCertificate.trivial_boundary [Subsingleton G]
    (ψ : groupHomology (integralRep G) 3 →ₗ[ℤ] B) :
    ∃ c : BarLiftCertificate ψ 0,
      BarLiftCertificate.chain ψ 0 c = Finsupp.single (fun _ : Fin 3 => (1 : G)) 1 ∧
      BarLiftCertificate.chain ψ 0 c ≠ 0 := by
  sorry

end BarLifts

section FiniteCoefficients

variable {K E H : Type*} [AddCommGroup K] [AddCommGroup E] [AddCommGroup H]

/-- Compose genuine finite Chern and étale Bloch equivalences in the direction r⁻¹c. -/
def finiteCoefficientBlochEquiv (c : K ≃+ H) (r : E ≃+ H) : K ≃+ E := c.trans r.symm

/-- Evaluation and the inverse characterize the finite-coefficient comparison. -/
theorem finiteCoefficientBlochEquiv_spec (c : K ≃+ H) (r : E ≃+ H) (x : K) (y : E) :
    r (finiteCoefficientBlochEquiv c r x) = c x ∧
      (finiteCoefficientBlochEquiv c r).symm y = c.symm (r y) := by
  sorry

/-- The comparison scalar is inverted on the ordinary modulo subgroup. -/
theorem finiteCoefficientBlochEquiv_on_quotient {n : ℕ} {L : Type*}
    [AddCommGroup L] [Module (ZMod n) L] [Module (ZMod n) H]
    (c : K ≃+ H) (r : E ≃+ H) (jK : L →+ K) (jB : L →+ E)
    (h₀ : L →ₗ[ZMod n] H) (γ : (ZMod n)ˣ)
    (hc : ∀ x, c (jK x) = h₀ x) (hr : ∀ x, r (jB x) = (γ : ZMod n) • h₀ x)
    (x : L) : finiteCoefficientBlochEquiv c r (jK x) =
      jB (((γ⁻¹ : (ZMod n)ˣ) : ZMod n) • x) := by
  sorry

example (c r : ZMod 5 ≃+ ZMod 5) (hc : ∀ x, c x = (2 : ZMod 5) * x)
    (hr : ∀ x, r x = (3 : ZMod 5) * x) : finiteCoefficientBlochEquiv c r 1 = 4 := by
  apply r.injective
  change r (r.symm (c 1)) = r 4
  rw [r.apply_symm_apply, hc, hr]
  decide

example (c r : ZMod 1 ≃+ ZMod 1) : finiteCoefficientBlochEquiv c r 0 = 0 := by
  exact map_zero _

end FiniteCoefficients

/- Definitions and constructions specified in README.md whose carriers are not at the pins:
bStPlus, elementaryCover and its lifted H-space, the canonical field/ring K₃ comparison,
milnorToQuillen3, K3ind and its quotient maps, motivicEdgeQuotientEquiv,
real-place Milnor basis, decomposableSignature, totallyImaginaryQuotientEquiv,
stableHurewiczQuotientEquiv; antisymSquare and its exterior/negative-eigenspace comparisons;
projective crossRatio and orbit equivalence; fiveTermSubgroup, preBloch, blochBoundary,
blochGroup, BlochGroup.c, the inversion homomorphism and extBloch;
LectureBloch.lambda, its raw kernel, K_raw, muRel and obstruction;
GoncharovB2, GoncharovCurve, curve specialization and the conditional K_curv comparison;
cgzBloch/B_old, CGZPublished.negativeTensor, boundary, B_new and exact convention maps;
group-module hyperhomology, unimodularChains, stabilityCoinvariants and its products,
frameConnecting, milnorHomologyTheta, the frame retraction and splitting;
diagonalSubgroup, permSubgroup, monomialSubgroup and stable inclusions;
configComplex, projective coinvariants, rank-two spectral sequence and psiGL2;
generalPositionComplex, precyclic rotations, cyclicComplexD, psiPrime and psiGL3;
monomial plus-space maps, pi3Ind, enhancedTor, enhancedRootsOfUnity,
closureTorsionDetector and the cyclic Chern/Bockstein normalization;
finite indecomposable quotient, algebraicClosureStabilization, finiteStabilization, finiteBlochHom, finiteK3Bloch,
cartanEmbedding and realRogersHom; FiveTermCertificate, BoundaryCertificate,
ofData, ofBoundaryCertificate, rootClassMod, rootClassLoc and rootClassPadic;
field-specific SuslinLift and BarLiftCertificate maps, genuine K₃(F;ℤ/n), the étale
coefficient Bloch group, finiteChernIndEquiv and their finite Chern comparison. -/

end TauCetiRoadmap.K3BlochGroups
