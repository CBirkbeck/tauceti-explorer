/-
Suggested Lean statements for the roadmap "Modular curves, following Katz–Mazur, Part II",
layer R13.4a (algebraic coarse construction before analytic comparison).

This file is not the roadmap and is not exhaustive: the roadmap document
`research/blueprint/readmes/ModularCurvesPartII--R13.4a.md` is definitive. The statements below
suggest Lean forms so that contributors and reviewers converge on names and signatures. They are
goals, proved by `sorry` where no short proof is given; nothing here is claimed formalised.

Pinned baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174,
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Only what the pinned libraries can already express is stated: the level subgroups of
`GL₂(ℤ/n)` in the row-vector right-action convention, the projective index (the degree of the
coarse `j`-map), the determinant image (the cyclotomic base), the cusp double cosets, and the
recognition criterion for Mathlib's relative normalization. The level stacks, their coarse
curves, the fixed-pairing and twisted curves and every geometric statement about them have no
carrier at the pins; they are targets of the roadmap document and are listed at the end.
-/

import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Card
import Mathlib.LinearAlgebra.Matrix.SpecialLinearGroup
import Mathlib.Data.ZMod.Basic
import Mathlib.GroupTheory.Index
import Mathlib.GroupTheory.GroupAction.Quotient
import Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
import Mathlib.AlgebraicGeometry.Normalization
import Mathlib.AlgebraicGeometry.Noetherian
import Mathlib.Tactic.NormNum.Prime

open Matrix
open scoped MatrixGroups

namespace TauCeti.ModularCurves

/-! ## Levels (target `level-subgroups`)

A level structure is the orbit of a frame `φ : (ℤ/n)² ≅ E[n]` under `φ ↦ φ ∘ g`, so that
`(P, Q) • [[a, b], [c, d]] = (aP + cQ, bP + dQ)`. -/

/-- `GL₂(ℤ/n)`. -/
abbrev GL2 (n : ℕ) := GL (Fin 2) (ZMod n)

/-- `Γ₀(N)‾`: lower-left entry zero; the stabiliser of the line through `P`. -/
def levelGamma0 (n : ℕ) : Subgroup (GL2 n) where
  carrier := {g | (g : Matrix (Fin 2) (Fin 2) (ZMod n)) 1 0 = 0}
  one_mem' := by simp
  mul_mem' {a b} ha hb := by
    simp only [Set.mem_ofPred_eq, Units.val_mul, Matrix.mul_apply, Fin.sum_univ_two] at *
    rw [ha, hb]; ring
  inv_mem' {a} ha := by
    simp only [Set.mem_ofPred_eq] at *
    rw [Matrix.coe_units_inv, Matrix.inv_def, Matrix.adjugate_fin_two]
    simp [ha]

/-- `Γ₁(N)‾`: upper-left entry one and lower-left entry zero; the stabiliser of `P`. -/
def levelGamma1 (n : ℕ) : Subgroup (GL2 n) where
  carrier := {g | (g : Matrix (Fin 2) (Fin 2) (ZMod n)) 0 0 = 1 ∧
    (g : Matrix (Fin 2) (Fin 2) (ZMod n)) 1 0 = 0}
  one_mem' := by simp
  mul_mem' {a b} ha hb := by
    simp only [Set.mem_ofPred_eq, Units.val_mul, Matrix.mul_apply, Fin.sum_univ_two] at *
    obtain ⟨ha1, ha2⟩ := ha; obtain ⟨hb1, hb2⟩ := hb
    rw [ha1, ha2, hb1, hb2]; constructor <;> ring
  inv_mem' {a} ha := by
    simp only [Set.mem_ofPred_eq] at *
    obtain ⟨ha1, ha2⟩ := ha
    have hdet : (a : Matrix (Fin 2) (Fin 2) (ZMod n)).det =
        (a : Matrix (Fin 2) (Fin 2) (ZMod n)) 1 1 := by
      rw [Matrix.det_fin_two, ha1, ha2]; ring
    have hu : IsUnit (a : Matrix (Fin 2) (Fin 2) (ZMod n)).det := Matrix.isUnits_det_units a
    rw [Matrix.coe_units_inv, Matrix.inv_def, Matrix.adjugate_fin_two]
    refine ⟨?_, by simp [ha2]⟩
    simp only [Matrix.smul_apply, Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero,
      Matrix.cons_val_fin_one, smul_eq_mul]
    rw [← hdet]; exact Ring.inverse_mul_cancel _ hu

/-- `Γ₁^μ(N)‾`: lower row `(0, 1)`; its structures are embeddings `μ_N ↪ E[N]`. -/
def levelGamma1Mu (n : ℕ) : Subgroup (GL2 n) where
  carrier := {g | (g : Matrix (Fin 2) (Fin 2) (ZMod n)) 1 1 = 1 ∧
    (g : Matrix (Fin 2) (Fin 2) (ZMod n)) 1 0 = 0}
  one_mem' := by simp
  mul_mem' {a b} ha hb := by
    simp only [Set.mem_ofPred_eq, Units.val_mul, Matrix.mul_apply, Fin.sum_univ_two] at *
    obtain ⟨ha1, ha2⟩ := ha; obtain ⟨hb1, hb2⟩ := hb
    rw [ha1, ha2, hb1, hb2]; constructor <;> ring
  inv_mem' {a} ha := by
    simp only [Set.mem_ofPred_eq] at *
    obtain ⟨ha1, ha2⟩ := ha
    have hdet : (a : Matrix (Fin 2) (Fin 2) (ZMod n)).det =
        (a : Matrix (Fin 2) (Fin 2) (ZMod n)) 0 0 := by
      rw [Matrix.det_fin_two, ha1, ha2]; ring
    have hu : IsUnit (a : Matrix (Fin 2) (Fin 2) (ZMod n)).det := Matrix.isUnits_det_units a
    rw [Matrix.coe_units_inv, Matrix.inv_def, Matrix.adjugate_fin_two]
    refine ⟨?_, by simp [ha2]⟩
    simp only [Matrix.smul_apply, Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_one,
      Matrix.cons_val_fin_one, smul_eq_mul]
    rw [← hdet]; exact Ring.inverse_mul_cancel _ hu

/-- The split Cartan subgroup `C_s`: diagonal matrices. -/
def splitCartan (n : ℕ) : Subgroup (GL2 n) where
  carrier := {g | (g : Matrix (Fin 2) (Fin 2) (ZMod n)) 0 1 = 0 ∧
    (g : Matrix (Fin 2) (Fin 2) (ZMod n)) 1 0 = 0}
  one_mem' := by simp
  mul_mem' {a b} ha hb := by
    simp only [Set.mem_ofPred_eq, Units.val_mul, Matrix.mul_apply, Fin.sum_univ_two] at *
    obtain ⟨ha1, ha2⟩ := ha; obtain ⟨hb1, hb2⟩ := hb
    rw [ha1, ha2, hb1, hb2]; constructor <;> ring
  inv_mem' {a} ha := by
    simp only [Set.mem_ofPred_eq] at *
    obtain ⟨ha1, ha2⟩ := ha
    rw [Matrix.coe_units_inv, Matrix.inv_def, Matrix.adjugate_fin_two]
    simp [ha1, ha2]

/-- The normaliser `C_s⁺` of the split Cartan subgroup. -/
def splitCartanNormalizer (n : ℕ) : Subgroup (GL2 n) :=
  Subgroup.normalizer (splitCartan n : Set (GL2 n))

/-- The nonsplit Cartan subgroup `{[[a, εb], [b, a]]}` attached to `ε`; it is the image of
`𝔽_{ℓ²}^×` when `n = ℓ` is an odd prime and `ε` is a nonsquare. -/
def nonsplitCartan (n : ℕ) (ε : ZMod n) : Subgroup (GL2 n) where
  carrier := {g | (g : Matrix (Fin 2) (Fin 2) (ZMod n)) 1 1 = (g : Matrix (Fin 2) (Fin 2) (ZMod n)) 0 0 ∧
    (g : Matrix (Fin 2) (Fin 2) (ZMod n)) 0 1 = ε * (g : Matrix (Fin 2) (Fin 2) (ZMod n)) 1 0}
  one_mem' := by simp
  mul_mem' {a b} ha hb := by
    simp only [Set.mem_ofPred_eq, Units.val_mul, Matrix.mul_apply, Fin.sum_univ_two] at *
    obtain ⟨ha1, ha2⟩ := ha; obtain ⟨hb1, hb2⟩ := hb
    rw [ha1, ha2, hb1, hb2]; constructor <;> ring
  inv_mem' {a} ha := by
    simp only [Set.mem_ofPred_eq] at *
    obtain ⟨ha1, ha2⟩ := ha
    rw [Matrix.coe_units_inv, Matrix.inv_def, Matrix.adjugate_fin_two]
    simp only [Matrix.smul_apply, Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_one,
      Matrix.cons_val_zero, Matrix.cons_val_fin_one, smul_eq_mul]
    rw [ha1, ha2]; constructor <;> ring

/-- The normaliser `C_ns⁺` of the nonsplit Cartan subgroup. -/
def nonsplitCartanNormalizer (n : ℕ) (ε : ZMod n) : Subgroup (GL2 n) :=
  Subgroup.normalizer (nonsplitCartan n ε : Set (GL2 n))

/-- The projective index `[GL₂(ℤ/n) : ±H]`, the degree of the coarse `j`-map `X_H → ℙ¹`. -/
noncomputable def projectiveIndex {n : ℕ} (H : Subgroup (GL2 n)) : ℕ :=
  (H ⊔ Subgroup.zpowers (-1)).index

/-- The determinant image `det(H̄) ⊂ (ℤ/n)ˣ`; its fixed field in `ℚ(ζ_n)` is the field of
definition of the components of `X_H`. -/
def levelDet {n : ℕ} (H : Subgroup (GL2 n)) : Subgroup (ZMod n)ˣ :=
  H.map Matrix.GeneralLinearGroup.det

/-- Reduction `SL(2, ℤ) → GL₂(ℤ/N)`. -/
def reduction (N : ℕ) : SL(2, ℤ) →* GL2 N :=
  Matrix.SpecialLinearGroup.toGL.comp (Matrix.SpecialLinearGroup.map (Int.castRingHom (ZMod N)))

/-- Pullback of a level along reduction `GL₂(ℤ/m) → GL₂(ℤ/n)` for `n ∣ m`. -/
def levelPullback {n m : ℕ} (h : n ∣ m) (H : Subgroup (GL2 n)) : Subgroup (GL2 m) :=
  H.comap (Matrix.GeneralLinearGroup.map (ZMod.castHom h (ZMod n)))

/-- The projective index equals the index when `-1 ∈ H̄`, and is half of it otherwise. -/
theorem projectiveIndex_eq_index {n : ℕ} (H : Subgroup (GL2 n)) :
    ((-1 : GL2 n) ∈ H → projectiveIndex H = H.index) ∧
      ((-1 : GL2 n) ∉ H → H.index = 2 * projectiveIndex H) := by
  refine ⟨fun h ↦ ?_, fun _ ↦ sorry⟩
  rw [projectiveIndex, sup_eq_left.mpr ((Subgroup.zpowers_le).mpr h)]

/-- Index and projective index are unchanged by pulling back to a multiple of the level. -/
theorem levelPullback_index {n m : ℕ} [NeZero m] (h : n ∣ m) (H : Subgroup (GL2 n)) :
    (levelPullback h H).index = H.index ∧
      projectiveIndex (levelPullback h H) = projectiveIndex H := sorry

/-- Conjugation preserves the index, the projective index and the determinant image. -/
theorem levelConj {n : ℕ} (g : GL2 n) (H : Subgroup (GL2 n)) :
    (H.map (MulAut.conj g).toMonoidHom).index = H.index ∧
      projectiveIndex (H.map (MulAut.conj g).toMonoidHom) = projectiveIndex H ∧
      levelDet (H.map (MulAut.conj g).toMonoidHom) = levelDet H := sorry

/-- Compatibility with Mathlib's congruence subgroups of `SL(2, ℤ)`. -/
theorem levelGamma0_comap (N : ℕ) :
    (levelGamma0 N).comap (reduction N) = CongruenceSubgroup.Gamma0 N ∧
      (⊥ : Subgroup (GL2 N)).comap (reduction N) = CongruenceSubgroup.Gamma N := sorry

/-- Test `levelGamma1_comap`: the preimage of `Γ₁(N)‾` is Mathlib's `Γ₁(N)`, whose bottom row
is `(0, 1)`; the upper-left condition is forced by the determinant. -/
example (N : ℕ) : (levelGamma1 N).comap (reduction N) = CongruenceSubgroup.Gamma1 N := sorry

/-- Test `levelGamma0_projectiveIndex_prime`. -/
theorem levelGamma0_projectiveIndex_prime (p : ℕ) [Fact p.Prime] :
    projectiveIndex (levelGamma0 p) = p + 1 := sorry

/-- `-1` lies in `Γ₀(N)‾` but not in `Γ₁(5)‾`. -/
example (n : ℕ) : (-1 : GL2 n) ∈ levelGamma0 n := by
  show ((-1 : GL2 n) : Matrix (Fin 2) (Fin 2) (ZMod n)) 1 0 = 0
  simp

example : (-1 : GL2 5) ∉ levelGamma1 5 := by
  rintro ⟨h, -⟩
  rw [Units.val_neg, Units.val_one, Matrix.neg_apply, Matrix.one_apply_eq] at h
  exact absurd h (by decide)

/-- Test `levelGamma1_five_index`: the plain index is twice the coarse degree. -/
example : (levelGamma1 5).index = 24 ∧ projectiveIndex (levelGamma1 5) = 12 := sorry

/-- Test `splitCartanNormalizer_thirteen`: the degrees of `X_s⁺(13)` and `X_ns⁺(13)`
(`2` is a nonsquare modulo `13`). -/
example : projectiveIndex (splitCartanNormalizer 13) = 91 ∧
    projectiveIndex (nonsplitCartanNormalizer 13 2) = 78 := sorry

/-- Test `level_one`: at level one every subgroup is everything. -/
example (H : Subgroup (GL2 1)) : H.index = 1 ∧ projectiveIndex H = 1 := sorry

/-- The determinant image of `Γ₀(N)‾` is everything: the cyclotomic base of `X₀(N)` is `ℤ`
(test `cyclotomicBase_gamma0`, group-theoretic part). -/
theorem levelDet_levelGamma0 (N : ℕ) : levelDet (levelGamma0 N) = ⊤ := sorry

/-- The trivial level has trivial determinant image: the base of `X(N)` is `ℤ[ζ_N]`
(test `cyclotomicBase_full`, group-theoretic part). -/
example (N : ℕ) : levelDet (⊥ : Subgroup (GL2 N)) = ⊥ := Subgroup.map_bot _

/-! ## Cusps away from the level (target `coarse-cusps-away-from-the-level`)

The geometric cusps of `X_H` over a field of characteristic prime to `n` are the double cosets
`⟨±u⟩ \ GL₂(ℤ/n) / H̄`, `u = [[1, 1], [0, 1]]`. -/

/-- The unipotent element `u`, the monodromy of the Tate curve on the frame `(ζ, q^{1/n})`. -/
def unipotent (n : ℕ) : GL2 n :=
  ⟨!![1, 1; 0, 1], !![1, -1; 0, 1], by simp [Matrix.one_fin_two], by simp [Matrix.one_fin_two]⟩

/-- The group `⟨±u⟩`. -/
def cuspGroup (n : ℕ) : Subgroup (GL2 n) := Subgroup.closure {unipotent n, -1}

/-- The cusp double cosets `⟨±u⟩ \ GL₂(ℤ/n) / H̄`. -/
def Cusps {n : ℕ} (H : Subgroup (GL2 n)) : Type :=
  MulAction.orbitRel.Quotient (cuspGroup n) (GL2 n ⧸ H)

/-- `X₀(p)` has two cusps and `X₁(p)` has `p - 1`, for `p ≥ 5` prime. -/
theorem card_cusps_prime (p : ℕ) [Fact p.Prime] (hp : 5 ≤ p) :
    Nat.card (Cusps (levelGamma0 p)) = 2 ∧ Nat.card (Cusps (levelGamma1 p)) = p - 1 := sorry

/-- Test `cartanCurve_cusps` (group-theoretic part): `X_s⁺(ℓ)` has `(ℓ + 1) / 2` cusps and
`X_ns⁺(ℓ)` has `(ℓ - 1) / 2`, for an odd prime `ℓ` and a nonsquare `ε`. -/
theorem cartanCurve_cusps (ℓ : ℕ) [Fact ℓ.Prime] (hℓ : ℓ ≠ 2) (ε : ZMod ℓ)
    (hε : ¬ IsSquare ε) :
    Nat.card (Cusps (splitCartanNormalizer ℓ)) = (ℓ + 1) / 2 ∧
      Nat.card (Cusps (nonsplitCartanNormalizer ℓ ε)) = (ℓ - 1) / 2 := sorry

/-- Level one has the single cusp of `X(1)`. -/
example (n : ℕ) : Nat.card (Cusps (⊤ : Subgroup (GL2 n))) = 1 := sorry

/-! ## Recognising a relative normalization (target `finite-normal-recognition`) -/

open AlgebraicGeometry CategoryTheory in
/-- If `T` is integral over `J`, locally noetherian and normal, and `Y` is a dense open of `T`,
then `T` is the relative normalization of `J` in `Y`. All three hypotheses are needed: a spare
component, a non-normal `T`, or a non-dense `Y` break the conclusion. -/
theorem finiteNormalRecognition {Y J T : Scheme.{0}} (f : Y ⟶ J) [QuasiCompact f]
    [QuasiSeparated f] (u : Y ⟶ T) (g : T ⟶ J) [IsIntegralHom g] [IsOpenImmersion u]
    (h : f = u ≫ g) [IsLocallyNoetherian T]
    (hT : ∀ x : T, IsDomain (T.presheaf.stalk x) ∧ IsIntegrallyClosed (T.presheaf.stalk x))
    (hu : Dense (Set.range u.base)) : IsIso (f.normalizationDesc u g h) := sorry


/-! ## Statements not typed at the pins

Every target below is specified in the roadmap document. Its carriers (algebraic stacks over the
site of schemes, the stack `X(1)` of generalized elliptic curves, the level stacks `𝒳_H`, their
Keel–Mori coarse spaces, the projective `j`-line over `ℤ` with its section at infinity, and the
Tau Ceti ModularCurves level problems) do not exist in Mathlib or Tau Ceti at the pins, so no
Lean statement is given for them here. Grouped by target, the API items, unit tests and
statements that remain README targets:

* `level-h-structures`: `LevelStructure`, `LevelStructure.ofFrame`,
  `LevelStructure.ofFrame_eq_iff`, `LevelStructure.baseChange`, `LevelStructure.changeLevel`,
  `LevelStructure.aut_fix_iff`, `levelOpenStack_forget_finiteEtale`, `LevelStructure.conj`,
  `LevelStructure.toKatzMazur`, `LevelStructure.full_group`, `LevelStructure.gamma1_point`,
  `LevelStructure.not_frame`, `LevelStructure.minusOne_gamma1`.
* `deligne-rapoport-level-stack`: `levelStack`, `levelStack.toX1`, `levelStack.ellipticOpen`,
  `levelStack.boundary`, `levelStack.indepLevel`, `levelStack.map`, `levelStack.conj`,
  `levelStack.lift`, `levelStack.lift_unique`, `levelStack_full_group`,
  `levelStack_gamma0_prime_rank`, `levelStack_not_naive`, `levelStack_gamma_compat`.
* `level-stack-geometry`: (statement of the target).
* `standard-level-stack-identifications`: (statement of the target).
* `compactified-coarse-j-line`: (statement of the target).
* `fibrewise-coarse-base-change`: (statement of the target).
* `coarse-local-structure`: (statement of the target).
* `coarse-degree-and-cusp-divisor`: (statement of the target).
* `coarse-cusps-away-from-the-level`: (statement of the target).
* `coarse-cyclotomic-structure`: `cyclotomicBase`, `toCyclotomicBase`,
  `toCyclotomicBase_ellipticOpen`, `toCyclotomicBase_unique`, `toCyclotomicBase_levelMap`,
  `toCyclotomicBase_normaliser`, `toCyclotomicBase_flat`, `cyclotomicBase_gamma0`,
  `cyclotomicBase_full`, `toCyclotomicBase_not_connected`, `cyclotomicBase_kernelDet`.
* `fixed-pairing-coarse-curve`: `fixedPairingCurve`, `fixedPairingCurve.toBase`,
  `fixedPairingCurve.ellipticOpen`, `fixedPairingCurve.baseChange`, `fullLevel_split`,
  `fixedPairingCurve.galois`, `fixedPairingCurve_one`, `fixedPairingCurve_five_cusps`,
  `fixedPairingCurve_not_full`, `fixedPairingCurve_fine`.
* `twisted-coarse-curve`: `twistedCurve`, `twistedCurve.ellipticOpen`, `twistedCurve.frameIso`,
  `twistedCurve.frameIso_change`, `twistedCurve.smooth`, `twistedCurve.baseChange`,
  `twistedCurve_split`, `twistedCurve_point`, `twistedCurve_unpaired`.
* `affine-open-identification`: (statement of the target).
* `prime-diamond-agreement`: (statement of the target).
* `coarse-level-maps`: `levelMap`, `levelMap_id`, `levelMap_comp`, `levelMap_degree`, `levelMap_j`,
  `conjIso`, `normaliserAction`, `normaliserAction_cyclotomic`, `levelMap_flat_of_regular`,
  `levelMap_gamma1_gamma0_degree`, `levelMap_self`, `normaliserAction_minusOne`,
  `normaliserAction_gamma1_diamond`.
* `coarse-level-quotients`: (statement of the target).
* `coarse-base-change-failure`: (statement of the target).
* `cartan-level-curves`: `cartanCurve`, `cartanCurve_degree`, `cartanCurve_moduli`,
  `splitCartanCurve_iso_gammaZero`, `cartanCurve_quotient`,
  `cartanCurve_splitPlus_thirteen_degree`, `cartanCurve_split_two`, `cartanCurve_ordered_not_plus`,
  `cartanCurve_nonsplitPlus_cusps`.
* `coarse-rational-points`: (statement of the target).
* `atkin-lehner-quotient-curves`: `gammaZeroPlus`, `gammaZeroPlus.quotientMap`,
  `gammaZeroPlus.lift`, `gammaZeroPlus.smooth`, `gammaZeroPlus.baseChange`,
  `gammaZeroPlus.symmetricJ`, `gammaZeroPlus_square`, `gammaZeroPlus_cusps`, `gammaZeroPlus_noJ`,
  `gammaZeroPlus_one`.
* `proper-rigidifying-covers`: (statement of the target).

The level-subgroup, cusp-count and determinant statements above are the group-theoretic parts
of `level-subgroups`, `coarse-degree-and-cusp-divisor`, `coarse-cusps-away-from-the-level`,
`coarse-cyclotomic-structure` and `cartan-level-curves`; their geometric parts are README targets.
-/

end TauCeti.ModularCurves
