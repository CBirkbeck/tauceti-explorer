import Mathlib

/-!
# K3BlochGroups: representative target signatures

The roadmap is README.md. This file records light definitions and representative signatures
statable against the pinned APIs; it is not exhaustive. It fixes the order of the homological
comparison, uses actual unnormalised group-homology cycles, and distinguishes root multiples from
division over coefficients.
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

end Symbols

/-! ## Layer 4: Configuration homology and the Suslin sequence -/

/-- The three face matrices for the explicit rank-two bar lift of §4.11. -/
def rankTwoFaceMatrices {F : Type*} [Field F] (a : F) :
    Fin 3 → Matrix (Fin 2) (Fin 2) F :=
  ![!![0, 1; a - 1, 1], !![1 - a, a; 0, a], !![1, 0; 0, a]]

/-- Determinants distinguish the three lifts and their excluded parameters. -/
theorem rankTwoFaceMatrices_det {F : Type*} [Field F] (a : F) :
    (rankTwoFaceMatrices a 0).det = 1 - a ∧
    (rankTwoFaceMatrices a 1).det = a * (1 - a) ∧
    (rankTwoFaceMatrices a 2).det = a := by
  sorry

example : (rankTwoFaceMatrices (2 : ℚ) 0).det = -1 ∧
    (rankTwoFaceMatrices (2 : ℚ) 1).det = -2 ∧
    (rankTwoFaceMatrices (2 : ℚ) 2).det = 2 := by
  norm_num [rankTwoFaceMatrices, Matrix.det_fin_two, Matrix.cons_val_two,
    Matrix.vecHead, Matrix.vecTail]

example : (rankTwoFaceMatrices (0 : ℚ) 2).det = 0 ∧
    (rankTwoFaceMatrices (1 : ℚ) 0).det = 0 ∧
    (rankTwoFaceMatrices (2 : ZMod 3) 1).det = 1 := by
  norm_num [rankTwoFaceMatrices, Matrix.det_fin_two, Matrix.cons_val_two,
    Matrix.vecHead, Matrix.vecTail]
  decide

/-- The change of splitting which cancels the exterior coordinate of d³ (§4.11). -/
def rankTwoBoundarySplit {V T : Type*} [AddCommGroup V] [AddCommGroup T]
    (alt : T →+ V) : (V × T) ≃+ (V × T) where
  toFun z := (z.1 + alt z.2, z.2)
  invFun z := (z.1 - alt z.2, z.2)
  left_inv z := by simp
  right_inv z := by simp
  map_add' z z' := by simp [map_add, add_add_add_comm]

example {V T : Type*} [AddCommGroup V] [AddCommGroup T]
    (alt : T →+ V) (t : T) :
    rankTwoBoundarySplit alt (-alt t, t) = (0, t) ∧
    (rankTwoBoundarySplit alt).symm (0, t) = (-alt t, t) := by
  simp [rankTwoBoundarySplit]

example : rankTwoBoundarySplit (AddMonoidHom.id ℤ) (1, -1) = (0, -1) ∧
    rankTwoBoundarySplit (0 : ℤ →+ ℤ) (1, -1) = (1, -1) ∧
    rankTwoBoundarySplit (AddMonoidHom.id ℤ) (2, -2) = (0, -2) := by
  decide

/-- An integral change of basis for the D₈ permutation subgroup (§4.15). -/
def permutationSylowBasis : Matrix (Fin 4) (Fin 4) ℤ :=
  !![1, 1, 1, 0; 1, 1, 0, 0; 1, 0, 0, 1; 1, 0, 0, 0]

example : permutationSylowBasis.det = 1 ∧
    (!![0, 0, 0, 1; 0, 1, 0, -1; 1, -1, 0, 0; 0, 0, 1, -1] :
      Matrix (Fin 4) (Fin 4) ℤ) * permutationSylowBasis = 1 ∧
    permutationSylowBasis *
      (!![0, 0, 0, 1; 0, 1, 0, -1; 1, -1, 0, 0; 0, 0, 1, -1] :
        Matrix (Fin 4) (Fin 4) ℤ) = 1 := by
  decide

example :
    let Γinv : Matrix (Fin 4) (Fin 4) ℤ :=
      !![0, 0, 0, 1; 0, 1, 0, -1; 1, -1, 0, 0; 0, 0, 1, -1]
    Γinv * !![0, 1, 0, 0; 1, 0, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1] *
        permutationSylowBasis =
      !![1, 0, 0, 0; 0, 1, 1, 0; 0, 0, -1, 0; 0, 0, 0, 1] ∧
    Γinv * !![1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 0, 1; 0, 0, 1, 0] *
        permutationSylowBasis =
      !![1, 0, 0, 1; 0, 1, 0, -1; 0, 0, 1, 0; 0, 0, 0, -1] ∧
    Γinv * !![0, 0, 1, 0; 0, 0, 0, 1; 1, 0, 0, 0; 0, 1, 0, 0] *
        permutationSylowBasis =
      !![1, 1, 0, 0; 0, -1, 0, 0; 0, 0, 0, 1; 0, 0, 1, 0] := by
  decide

/-- `cyclicHomology_maps` (§4.15): the power-`a` endomorphism of a cyclic group of order `m`
acts on `H_{2j-1}(C_m, ℤ) ≅ ℤ/m` by `a ^ j`, with the identity coefficient map. At `m = 7`,
`a = 2`, `j = 2` this is multiplication by `4` on `H₃`, the weight-two action of §4.18. -/
theorem cyclicHomology_power_map (m : ℕ) [NeZero m] (a j : ℕ) (hj : 1 ≤ j)
    (φ : K3Homological.integralRep (Multiplicative (ZMod m)) ⟶
      Rep.res (powMonoidHom a) (K3Homological.integralRep (Multiplicative (ZMod m))))
    (hφ : φ.hom.toLinearMap = LinearMap.id) :
    ∃ e : groupHomology (K3Homological.integralRep (Multiplicative (ZMod m))) (2 * j - 1) ≃+
        ZMod m,
      ∀ z, e (groupHomology.map (powMonoidHom a) φ (2 * j - 1) z) = (a : ZMod m) ^ j * e z := by
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

/-!
## Targets stated only in README.md

Their carriers (Quillen `K₃`, plus constructions, the pre-Bloch and Bloch quotients, group
hyperhomology, motivic and étale cohomology) are not at the pins. Among them: `bStPlus`, `K3ind`,
`milnorToQuillen3`, `motivicEdgeQuotientEquiv`, `antisymSquare`, `crossRatio`, `preBloch`,
`blochBoundary`, `blochGroup`, `extBloch`, `cgzBloch`, `configComplex`, `psiGL2`, `psiGL3`,
`pi3Ind`, `enhancedTor`, `closureTorsionDetector`, `finiteStabilization`, `finiteK3Bloch`,
`realRogersHom`, `FiveTermCertificate`, `BoundaryCertificate`, `finiteChernIndEquiv`, and the
theorems of §§1.5, 2.2, 4.5, 4.16, 4.21 and 5.2.
-/

end TauCetiRoadmap.K3BlochGroups
