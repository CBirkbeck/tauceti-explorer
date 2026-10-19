import Mathlib.RingTheory.PicardGroup
import Mathlib.RingTheory.DedekindDomain.Ideal.Lemmas
import Mathlib.Algebra.TrivSqZeroExt.Basic
import TauCeti.Algebra.Category.ModuleCat.CartanMap
import TauCeti.RingTheory.ClassGroup.RelNorm
import TauCeti.RingTheory.DedekindDomain.SInteger.ClassGroup

/-!
# Dedekind K₀: native milestone statements

This file is not the roadmap and is not exhaustive. The README is definitive;
these statements suggest names and signatures for contributors and reviewers.

Companion to KTheoryLowDegrees--Z.4.md. All target IDs are imported from
KTheoryLowDegrees--Z.3.json; this file introduces no replacement blueprint nodes.
Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174,
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The two abbreviations below use the existing categorical K₀ carrier. Heavy
rank/determinant, base-change and transfer constructions remain README targets.
Existence of the classification is stated as a theorem, without an admitted
data definition. The index ideal and normalised Picard norm have small real bodies.
-/

noncomputable section

open scoped nonZeroDivisors TensorProduct
open CommRing (Pic)

universe u

namespace TauCeti.RingK0

variable (R : Type u) [CommRing R]

/-- The existing full subcategory, owned by Z.1/ring-k0. -/
abbrev FP := (TauCeti.finiteProjectiveModules R).FullSubcategory

/-- Native split K₀, without rebuilding its presentation. -/
abbrev K0 := TauCeti.SplitK0.{u} (FP R)

/-- Native class of a finite projective module. -/
abbrev cls (P : Type u) [AddCommGroup P] [Module R P]
    [Module.Finite R P] [Module.Projective R P] : K0 R :=
  TauCeti.SplitK0.of ⟨ModuleCat.of R P, ⟨inferInstance, inferInstance⟩⟩

variable [IsDedekindDomain R]

/-- Z.4/ideal-sum; the nonzero hypotheses exclude the zero ideal. -/
theorem ideal_sum (I J : Ideal R) (hI : I ≠ ⊥) (hJ : J ≠ ⊥) :
    Nonempty ((I × J) ≃ₗ[R] R × (I * J : Ideal R)) := by
  sorry

/-- Z.4/steinitz: a separate zero alternative, with the correct positive rank. -/
theorem steinitz (P : Type u) [AddCommGroup P] [Module R P]
    [Module.Finite R P] [Module.Projective R P] :
    Subsingleton P ∨ ∃ (n : ℕ) (I : Ideal R), I ≠ ⊥ ∧
      Nonempty (P ≃ₗ[R] (Fin n → R) × I) ∧ Module.finrank R P = n + 1 := by
  sorry

/-- Z.4/reduced-line-class: existence on the actual Picard and K₀ carriers. -/
theorem exists_picToK0 : ∃ s : Additive (Pic R) →+ K0 R,
    ∀ L : Pic R, s (Additive.ofMul L) = cls R L - cls R R := by
  sorry

/-- Z.4/rank-pic-equivalence and rank-pic-inverse, including negative integers.
The generator formula uniquely pins down the Picard coordinate; rank is checked
on every finite projective, without presupposing an unimplemented determinant. -/
theorem exists_rankPicEquiv : ∃ e : K0 R ≃+ ℤ × Additive (Pic R),
    (∀ P : FP R, (e (TauCeti.SplitK0.of P)).1 = (Module.finrank R P.obj : ℤ)) ∧
    (∀ L : Pic R, e (cls R L) = (1, Additive.ofMul L)) ∧
    (∀ (n : ℤ) (L : Pic R),
      e.symm (n, Additive.ofMul L) = (n - 1) • cls R R + cls R L) := by
  sorry

/-- Z.4/rank-class-group-equivalence, transported through the pinned equivPic. -/
theorem exists_rankClassGroupEquiv : ∃ e : K0 R ≃+ ℤ × Additive (ClassGroup R),
    (∀ P : FP R, (e (TauCeti.SplitK0.of P)).1 = (Module.finrank R P.obj : ℤ)) ∧
    (∀ L : Pic R, e (cls R L) =
      (1, Additive.ofMul ((ClassGroup.equivPic R).symm L))) ∧
    (∀ (n : ℤ) (L : Pic R),
      e.symm (n, Additive.ofMul ((ClassGroup.equivPic R).symm L)) =
        (n - 1) • cls R R + cls R L) := by
  sorry

/-- Z.4/projective-class-injective: equality of stable classes cancels. -/
theorem class_injective (P Q : Type u) [AddCommGroup P] [Module R P]
    [Module.Finite R P] [Module.Projective R P] [AddCommGroup Q] [Module R Q]
    [Module.Finite R Q] [Module.Projective R Q] (h : cls R P = cls R Q) :
    Nonempty (P ≃ₗ[R] Q) := by
  sorry

/-- Z.4/projective-cancellation. -/
theorem projective_cancellation (P M N : Type u)
    [AddCommGroup P] [Module R P] [Module.Finite R P] [Module.Projective R P]
    [AddCommGroup M] [Module R M] [Module.Finite R M] [Module.Projective R M]
    [AddCommGroup N] [Module R N] [Module.Finite R N] [Module.Projective R N]
    (h : Nonempty ((P × M) ≃ₗ[R] P × N)) : Nonempty (M ≃ₗ[R] N) := by
  sorry

local instance : Module ℤᵐᵒᵖ (Additive (Pic R)) :=
  Module.compHom (Additive (Pic R)) (RingEquiv.toOpposite ℤ).symm.toRingHom

/-- The native square-zero target of Z.4/rank-pic-ring-equiv. -/
abbrev RankPic := TrivSqZeroExt ℤ (Additive (Pic R))

-- Tests of the existing target carrier; the K₀ ring equivalence is a README target.
example (L M : Additive (Pic R)) :
    (TrivSqZeroExt.inr L : RankPic R) * (TrivSqZeroExt.inr M : RankPic R) = 0 := by
  sorry

example (m n : ℤ) (L M : Pic R) :
    (TrivSqZeroExt.inl m + TrivSqZeroExt.inr (Additive.ofMul L) : RankPic R) *
      (TrivSqZeroExt.inl n + TrivSqZeroExt.inr (Additive.ofMul M) : RankPic R) =
      TrivSqZeroExt.inl (m * n) + TrivSqZeroExt.inr (Additive.ofMul (L ^ n * M ^ m)) := by
  sorry

example : (0 : RankPic R).fst = 0 ∧ (1 : RankPic R).snd = 0 := by
  sorry

end TauCeti.RingK0

namespace Module.Invertible

variable {R L N : Type u} [CommRing R] [AddCommGroup L] [Module R L]
    [AddCommGroup N] [Module R N]

/-- Z.4/index-ideal, for arbitrary modules and arbitrary linear maps. -/
def indexIdeal (f : L →ₗ[R] N) : Ideal R :=
  LinearMap.range ((contractLeft R N).comp (f.lTensor (Module.Dual R N)))

-- The three discriminating examples of the definition.
example : indexIdeal (LinearMap.id : ℤ →ₗ[ℤ] ℤ) = ⊤ := by
  sorry

example : indexIdeal (6 • (LinearMap.id : ℤ →ₗ[ℤ] ℤ)) = Ideal.span {6} := by
  sorry

example : indexIdeal (0 : ℤ →ₗ[ℤ] ℤ) = ⊥ := by
  sorry

/-- Z.4/index-ideal-evaluation, without assuming an existing invertibility
instance on the ideal in the statement. -/
theorem indexIdeal_nonzero [IsDomain R] [Module.Invertible R L]
    [Module.Invertible R N] (f : L →ₗ[R] N) (hf : Function.Injective f) :
    indexIdeal f ≠ ⊥ ∧ Module.Invertible R (indexIdeal f) := by
  sorry

end Module.Invertible

namespace CommRing.Pic

variable (R S : Type u) [CommRing R] [CommRing S]
    [IsDedekindDomain R] [IsDedekindDomain S] [Algebra R S]
    [Module.Finite R S] [Module.IsTorsionFree R S]

/-- Z.4/pic-norm: transport the existing class-group norm, including its
normalisation, rather than defining a second ideal norm. -/
def relNorm : Pic S →* Pic R :=
  (ClassGroup.equivPic R).toMonoidHom.comp
    ((ClassGroup.relNorm (R := R) (S := S)).comp
      (ClassGroup.equivPic S).symm.toMonoidHom)

/-- The two native descriptions of the norm agree. -/
theorem relNorm_equivPic (c : ClassGroup S) :
    relNorm R S (ClassGroup.equivPic S c) =
      ClassGroup.equivPic R (ClassGroup.relNorm (R := R) c) := by
  sorry

/-- Extension followed by normalised norm is the degree power. -/
theorem relNorm_mapAlgebra (c : Pic R) :
    relNorm R S (mapAlgebra R S c) = c ^ Module.finrank R S := by
  sorry

-- Tests distinguish normalisation, ideal-class transport, and the degree power.
example : relNorm R S 1 = 1 := (relNorm R S).map_one

example (c : ClassGroup S) :
    relNorm R S (ClassGroup.equivPic S c) =
      ClassGroup.equivPic R (ClassGroup.relNorm (R := R) c) := by
  sorry

example (c : Pic R) (h : c ^ 2 = 1) (hd : Module.finrank R S = 2) :
    relNorm R S (mapAlgebra R S c) = 1 := by
  sorry

end CommRing.Pic

-- Existing quotient, tested on its actual extension map. No new quotient is planned.
example {R K : Type u} [CommRing R] [IsDedekindDomain R] [Field K] [Algebra R K]
    [IsFractionRing R K] (S : Set (IsDedekindDomain.HeightOneSpectrum R))
    (c : ClassGroup R) :
    IsDedekindDomain.integerClassGroupEquiv K S
        (ClassGroup.extendedHom R (S.integer K) c) = QuotientGroup.mk c :=
  IsDedekindDomain.integerClassGroupEquiv_extendedHom K S c
