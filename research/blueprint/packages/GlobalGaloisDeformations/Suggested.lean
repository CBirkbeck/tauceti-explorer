import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.Topology.Instances.Matrix
import Mathlib.RingTheory.LocalRing.ResidueField.Defs
import Mathlib.RingTheory.Artinian.Ring
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.GroupTheory.GroupAction.Quotient
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Tactic.LinearCombination
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.RingTheory.Polynomial.Basic
import Mathlib.Data.ZMod.Defs
import Mathlib.Algebra.Field.ZMod
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.Noetherian.Defs
import Mathlib.RingTheory.LocalRing.ResidueField.Basic
import Mathlib.LinearAlgebra.Dimension.RankNullity
import Mathlib.LinearAlgebra.Dimension.DivisionRing
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.LinearAlgebra.Pi
import Mathlib.LinearAlgebra.Quotient.Basic

import Mathlib.Algebra.DualNumber
import Mathlib.Topology.Instances.TrivSqZeroExt
import TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree

/-!
# Global Galois deformation rings: suggested Lean forms

This file is not the roadmap and is not exhaustive. README.md is definitive.
These statements suggest names and signatures for contributors and reviewers;
admitted proofs do not claim implementation.

The unbundled Lift interface below takes a commutative ring, topology and
reduction map. When a theorem uses an actual coefficient object its hypotheses
include locality, a surjective residue map with maximal-ideal kernel, and the
required Artinian or complete Noetherian structure. The coefficient categories,
polynomial-law determinants, arithmetic Galois groups, condition-specific local
rings and framed Selmer complexes are supplied by the roadmaps named in README.md.
Their mathematical contracts appear at the end of this file; they are not
replaced by empty predicates or abstract carriers asserting their conclusions.

Continuity means continuity of matrix entries. The orbit quotient is strict
conjugacy. The tangent signatures use Tau Ceti's continuous Z1 and H1, with the
actual adjoint action specified explicitly. The full-adjoint degree-zero frame
boundary and characteristic-two exceptions are retained in the regression cases.
-/

open Matrix

noncomputable section

namespace TauCeti.GaloisDeformation

variable {G : Type*} [Group G] [TopologicalSpace G]
variable {𝔽 : Type*} [Field 𝔽]
variable (n : ℕ) (ρbar : G →* GL (Fin n) 𝔽)

section Lifts

variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] (π : A →+* 𝔽)

/-- **`R04.1/lifting-functor`**. A lift of `ρ̄` to the coefficient ring `(A, π)`: a continuous
homomorphism `G → GL_n(A)` reducing to `ρ̄`. -/
@[ext]
structure Lift where
  toHom : G →* GL (Fin n) A
  continuous : Continuous fun g ↦ (toHom g : Matrix (Fin n) (Fin n) A)
  reduce : (Matrix.GeneralLinearGroup.map π).comp toHom = ρbar

/-- `Γ̂_n(A)`: invertible matrices reducing to the identity. -/
def strictKernel : Subgroup (GL (Fin n) A) := (Matrix.GeneralLinearGroup.map (n := Fin n) π).ker

/-- Strict conjugation on the underlying homomorphism. -/
def Lift.conj (a : strictKernel n π) (ρ : Lift n ρbar π) : Lift n ρbar π where
  toHom := (MulAut.conj (a : GL (Fin n) A)).toMonoidHom.comp ρ.toHom
  continuous := by sorry
  reduce := by sorry

/-- Strict conjugation of lifts. -/
instance : MulAction (strictKernel n π) (Lift n ρbar π) where
  smul := Lift.conj n ρbar π
  one_smul := by sorry
  mul_smul := by sorry

/-- The action is conjugation, fixing its mathematical meaning independently of the instance. -/
theorem strict_smul_apply (a : strictKernel n π) (ρ : Lift n ρbar π) (g : G) :
    (a • ρ).toHom g = (a : GL (Fin n) A) * ρ.toHom g * (a : GL (Fin n) A)⁻¹ := sorry

/-- **`R04.1/strict-deformation-functor`**. Deformations: lifts modulo strict conjugation. -/
def Def : Type _ := MulAction.orbitRel.Quotient (strictKernel n π) (Lift n ρbar π)

/-- API: two lifts define the same deformation iff they are conjugate by `Γ̂_n(A)`. -/
theorem def_mk_eq_iff (ρ ρ' : Lift n ρbar π) :
    (Quotient.mk (MulAction.orbitRel _ _) ρ : Def n ρbar π) = Quotient.mk _ ρ' ↔
      ∃ a ∈ strictKernel n π, ∀ g, ρ'.toHom g = a * ρ.toHom g * a⁻¹ := sorry

/-- **`R04.1/fixed-determinant-functors`**. Lifts with determinant `χ_A`. -/
def LiftDet (χ : G →* Aˣ) : Set (Lift n ρbar π) :=
  {ρ | ∀ g, Matrix.GeneralLinearGroup.det (ρ.toHom g) = χ g}

/-- API: strict conjugation preserves the fixed-determinant condition. -/
theorem smul_mem_liftDet (χ : G →* Aˣ) (a : strictKernel n π) {ρ : Lift n ρbar π}
    (hρ : ρ ∈ LiftDet n ρbar π χ) : a • ρ ∈ LiftDet n ρbar π χ := sorry

/-- Strict action restricted to the actual fixed-determinant subset. -/
instance (χ : G →* Aˣ) : MulAction (strictKernel n π) (LiftDet n ρbar π χ) where
  smul a ρ := ⟨a • ρ.val, smul_mem_liftDet n ρbar π χ a ρ.property⟩
  one_smul := by sorry
  mul_smul := by sorry

/-- Fixed determinant classes use the same strict equivalence. -/
def DefDet (χ : G →* Aˣ) : Type _ :=
  MulAction.orbitRel.Quotient (strictKernel n π) (LiftDet n ρbar π χ)

theorem liftDet_smul_val (χ : G →* Aˣ) (a : strictKernel n π)
    (ρ : LiftDet n ρbar π χ) : (a • ρ).val = a • ρ.val := sorry

/-- Strict conjugation on the genuine fixed-determinant subtype. -/
def LiftDet.conj (χ : G →* Aˣ) (a : strictKernel n π)
    (ρ : LiftDet n ρbar π χ) : LiftDet n ρbar π χ := a • ρ

omit [IsTopologicalRing A] in
/-- Membership is the pointwise determinant equation, rather than a new predicate. -/
theorem mem_LiftDet_iff (χ : G →* Aˣ) (ρ : Lift n ρbar π) :
    ρ ∈ LiftDet n ρbar π χ ↔ ∀ g, Matrix.GeneralLinearGroup.det (ρ.toHom g) = χ g := Iff.rfl

example (χ : G →* Aˣ) (ρ : LiftDet n ρbar π χ) :
    ∀ g, Matrix.GeneralLinearGroup.det (ρ.val.toHom g) = χ g := ρ.property

end Lifts


section CoefficientMaps

variable {A B C : Type*} [CommRing A] [CommRing B] [CommRing C]
  [TopologicalSpace A] [TopologicalSpace B] [TopologicalSpace C]
  [IsTopologicalRing A] [IsTopologicalRing B] [IsTopologicalRing C]
  (πA : A →+* 𝔽) (πB : B →+* 𝔽) (πC : C →+* 𝔽)

/-- Pushforward along a continuous coefficient map respecting reduction. -/
def Lift.map (f : A →+* B) (hf : Continuous f) (hπ : πB.comp f = πA)
    (ρ : Lift n ρbar πA) : Lift n ρbar πB := sorry

theorem Lift.map_apply (f : A →+* B) (hf : Continuous f) (hπ : πB.comp f = πA)
    (ρ : Lift n ρbar πA) (g : G) :
    (ρ.map n ρbar πA πB f hf hπ).toHom g =
      Matrix.GeneralLinearGroup.map f (ρ.toHom g) := sorry

theorem Lift.map_id (ρ : Lift n ρbar πA) :
    ρ.map n ρbar πA πA (RingHom.id A) continuous_id (by ext; rfl) = ρ := sorry

theorem Lift.map_comp (f : A →+* B) (hf : Continuous f) (hπf : πB.comp f = πA)
    (g : B →+* C) (hg : Continuous g) (hπg : πC.comp g = πB)
    (ρ : Lift n ρbar πA) :
    (ρ.map n ρbar πA πB f hf hπf).map n ρbar πB πC g hg hπg =
      ρ.map n ρbar πA πC (g.comp f) (hg.comp hf)
        (by rw [← RingHom.comp_assoc, hπg, hπf]) := sorry

/-- The canonical strict-class constructor. -/
def Def.mk (ρ : Lift n ρbar πA) : Def n ρbar πA :=
  Quotient.mk (MulAction.orbitRel _ _) ρ

theorem Def.mk_eq_mk_iff (ρ ρ' : Lift n ρbar πA) :
    Def.mk n ρbar πA ρ = Def.mk n ρbar πA ρ' ↔
      ∃ a ∈ strictKernel n πA, ∀ g, ρ'.toHom g = a * ρ.toHom g * a⁻¹ := sorry

/-- Pushforward descends to strict classes. -/
def Def.map (f : A →+* B) (hf : Continuous f) (hπ : πB.comp f = πA) :
    Def n ρbar πA → Def n ρbar πB := sorry

theorem Def.map_mk (f : A →+* B) (hf : Continuous f) (hπ : πB.comp f = πA)
    (ρ : Lift n ρbar πA) :
    Def.map n ρbar πA πB f hf hπ (Def.mk n ρbar πA ρ) =
      Def.mk n ρbar πB (ρ.map n ρbar πA πB f hf hπ) := sorry

/-- Three basic lifting-functor tests: residue uniqueness, identity and composition. -/
example [TopologicalSpace 𝔽] (ρ : Lift n ρbar (RingHom.id 𝔽)) : ρ.toHom = ρbar := sorry

example (ρ : Lift n ρbar πA) :
    ρ.map n ρbar πA πA (RingHom.id A) continuous_id (by ext; rfl) = ρ :=
  Lift.map_id n ρbar πA ρ

example (f : A →+* B) (hf : Continuous f) (hπ : πB.comp f = πA)
    (ρ : Lift n ρbar πA) (g : G) (i j : Fin n) :
    πB ((ρ.map n ρbar πA πB f hf hπ).toHom g i j) =
      πA (ρ.toHom g i j) := sorry

end CoefficientMaps

section Tangents

variable [TopologicalSpace 𝔽] [DiscreteTopology 𝔽]
  [DistribMulAction G (Matrix (Fin n) (Fin n) 𝔽)]
  [ContinuousSMul G (Matrix (Fin n) (Fin n) 𝔽)]
  (hact : ∀ (g : G) (X : Matrix (Fin n) (Fin n) 𝔽),
    g • X = (ρbar g : Matrix (Fin n) (Fin n) 𝔽) * X *
      (ρbar g⁻¹ : Matrix (Fin n) (Fin n) 𝔽))
  (hbar : Continuous fun g ↦ (ρbar g : Matrix (Fin n) (Fin n) 𝔽))

/-- The residue projection on the actual Mathlib dual-number ring. -/
abbrev dualResidue : DualNumber 𝔽 →+* 𝔽 :=
  (TrivSqZeroExt.fstHom 𝔽 𝔽 𝔽).toRingHom

include hact hbar

/-- Continuous adjoint cocycles classify dual-number lifts. The supplied action
must be the conjugation action hact, not an arbitrary action on matrices. -/
def liftDualNumbersEquiv (_hact : ∀ (g : G) (X : Matrix (Fin n) (Fin n) 𝔽),
    g • X = (ρbar g : Matrix (Fin n) (Fin n) 𝔽) * X *
      (ρbar g⁻¹ : Matrix (Fin n) (Fin n) 𝔽))
    (_hbar : Continuous fun g ↦ (ρbar g : Matrix (Fin n) (Fin n) 𝔽)) : TauCeti.ContCohomology.Z1 G (Matrix (Fin n) (Fin n) 𝔽) ≃
    Lift n ρbar (dualResidue (𝔽 := 𝔽)) := sorry

/-- This formula fixes the convention f ↦ (1 + εf)ρ̄. -/
theorem liftDualNumbersEquiv_apply
    (f : TauCeti.ContCohomology.Z1 G (Matrix (Fin n) (Fin n) 𝔽)) (g : G) :
    ((liftDualNumbersEquiv n ρbar hact hbar f).toHom g :
        Matrix (Fin n) (Fin n) (DualNumber 𝔽)) =
      (1 + (f.val g).map TrivSqZeroExt.inr) *
        (ρbar g : Matrix (Fin n) (Fin n) 𝔽).map TrivSqZeroExt.inl := sorry

/-- Strict equivalence is the continuous-cohomology coboundary quotient. -/
def defDualNumbersEquiv (_hact : ∀ (g : G) (X : Matrix (Fin n) (Fin n) 𝔽),
    g • X = (ρbar g : Matrix (Fin n) (Fin n) 𝔽) * X *
      (ρbar g⁻¹ : Matrix (Fin n) (Fin n) 𝔽))
    (_hbar : Continuous fun g ↦ (ρbar g : Matrix (Fin n) (Fin n) 𝔽)) : Def n ρbar (dualResidue (𝔽 := 𝔽)) ≃
    TauCeti.ContCohomology.H1 G (Matrix (Fin n) (Fin n) 𝔽) := sorry

/-- Check the zero cocycle rather than a dimension-only identity. -/
example (g : G) :
    ((liftDualNumbersEquiv n ρbar hact hbar 0).toHom g :
        Matrix (Fin n) (Fin n) (DualNumber 𝔽)) =
      (ρbar g : Matrix (Fin n) (Fin n) 𝔽).map TrivSqZeroExt.inl := sorry

end Tangents

section Restriction

variable {H : Type*} [Group H] [TopologicalSpace H]
variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] (π : A →+* 𝔽)

/-- **`R04.1/restriction-of-deformations`**. Restriction along a continuous homomorphism. -/
def Lift.restrict (ι : H →* G) (hι : Continuous ι) (ρ : Lift n ρbar π) :
    Lift n (ρbar.comp ι) π where
  toHom := ρ.toHom.comp ι
  continuous := ρ.continuous.comp hι
  reduce := by sorry

theorem Lift.restrict_apply (ι : H →* G) (hι : Continuous ι)
    (ρ : Lift n ρbar π) (h : H) :
    (ρ.restrict n ρbar π ι hι).toHom h = ρ.toHom (ι h) := sorry

/-- Strict restriction descends to the actual orbit quotient. -/
def Def.restrict (ι : H →* G) (hι : Continuous ι) :
    Def n ρbar π → Def n (ρbar.comp ι) π := sorry

theorem Def.restrict_mk (ι : H →* G) (hι : Continuous ι) (ρ : Lift n ρbar π) :
    Def.restrict n ρbar π ι hι (Def.mk n ρbar π ρ) =
      Def.mk n (ρbar.comp ι) π (ρ.restrict n ρbar π ι hι) := sorry

/-- API: the framed local restriction `α⁻¹ (ρ ∘ ι) α` is invariant under
`(ρ, α) ↦ (β ρ β⁻¹, β α)`. -/
theorem framed_restrict_invariant (ι : H →* G) (ρ : G →* GL (Fin n) A)
    (α β : GL (Fin n) A) (h : H) :
    (β * α)⁻¹ * (β * ρ (ι h) * β⁻¹) * (β * α) = α⁻¹ * ρ (ι h) * α := sorry

end Restriction

section Schur

/-- `ρ̄` is Schur: its `𝔽[G]`-endomorphisms are scalars. -/
def IsSchur : Prop :=
  ∀ M : Matrix (Fin n) (Fin n) 𝔽, (∀ g, M * (ρbar g : Matrix (Fin n) (Fin n) 𝔽) =
    (ρbar g : Matrix (Fin n) (Fin n) 𝔽) * M) → ∃ c : 𝔽, M = c • (1 : Matrix (Fin n) (Fin n) 𝔽)

variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] (π : A →+* 𝔽)

/-- **`R04.1/strict-vs-full-conjugacy`**. For Schur `ρ̄`, `GL_n(A)`-conjugate lifts are strictly
conjugate over a LOCAL coefficient ring with its genuine residue map. Surjectivity alone
is insufficient: see the integral S₃ regression below. -/
theorem strict_of_full [IsLocalRing A]
    (hres : RingHom.ker π = IsLocalRing.maximalIdeal A) (hS : IsSchur n ρbar) (hπ : Function.Surjective π) (ρ ρ' : Lift n ρbar π)
    (a : GL (Fin n) A) (h : ∀ g, ρ'.toHom g = a * ρ.toHom g * a⁻¹) :
    ∃ b ∈ strictKernel n π, ∀ g, ρ'.toHom g = b * ρ.toHom g * b⁻¹ := sorry

end Schur

section PhiP

variable (p : ℕ) (G)

/-- **`R04.2/phi-p-condition`**. Mazur's `Φ_p`: every open subgroup has finitely many
homomorphisms to `ℤ/p` with open kernel. -/
def PhiP : Prop :=
  ∀ Δ : Subgroup G, IsOpen (Δ : Set G) →
    Finite {f : Δ →* Multiplicative (ZMod p) // IsOpen (f.ker : Set Δ)}

variable {G}

/-- API: `Φ_p` passes to open subgroups. -/
theorem PhiP.«open» (h : PhiP G p) (Δ : Subgroup G) (hΔ : IsOpen (Δ : Set G)) : PhiP Δ p := sorry

end PhiP

section Comparison

variable {R : Type*} [CommRing R]

/-- **`R04.2/framed-unframed-comparison`**, explicit form: the framed universal lift
`(1 + X) ρ^univ (1 + X)⁻¹` over `R[[X_{ij}]]/(X_{11})`, here recorded on the level of matrices:
normalising the `(1,1)` entry determines a matrix `1 + X` of `Γ̂_n` up to scalars. -/
theorem exists_unique_normalized (hn : 0 < n) (a : Matrix (Fin n) (Fin n) R)
    (ha : IsUnit (a ⟨0, hn⟩ ⟨0, hn⟩)) :
    ∃! c : Rˣ, (((c : R) • a) ⟨0, hn⟩ ⟨0, hn⟩ = 1) := sorry

end Comparison

section Carayol

variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] (π : A →+* 𝔽)

/-- **`R04.2/carayol-trace-theorem`** (2), Gee Lemma 3.7 on complete Noetherian
LOCAL rings. The spanning hypothesis is Burnside's condition; a nonlocal ring with a
surjective map to the same field is not an admissible coefficient object. -/
theorem strictly_conj_of_trace_eq [IsLocalRing A] [IsNoetherianRing A]
    [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    (hπ : Function.Surjective π) (hres : RingHom.ker π = IsLocalRing.maximalIdeal A)
    (habs : Submodule.span 𝔽 (Set.range fun g ↦ (ρbar g : Matrix (Fin n) (Fin n) 𝔽)) = ⊤)
    (ρ ρ' : Lift n ρbar π) (htr : ∀ g, (ρ.toHom g : Matrix (Fin n) (Fin n) A).trace =
      (ρ'.toHom g : Matrix (Fin n) (Fin n) A).trace) :
    ∃ a ∈ strictKernel n π, ∀ g, ρ'.toHom g = a * ρ.toHom g * a⁻¹ := sorry

/-- The separate Artinian-local form (Kisin Lecture 1, Theorem 1.4.1).
The Artinian coefficient category supplies these locality and residue hypotheses. -/
theorem strictly_conj_of_trace_eq_artinian [IsLocalRing A] [IsArtinianRing A]
    (hπ : Function.Surjective π) (hres : RingHom.ker π = IsLocalRing.maximalIdeal A)
    (habs : Submodule.span 𝔽 (Set.range fun g ↦ (ρbar g : Matrix (Fin n) (Fin n) 𝔽)) = ⊤)
    (ρ ρ' : Lift n ρbar π) (htr : ∀ g, (ρ.toHom g : Matrix (Fin n) (Fin n) A).trace =
      (ρ'.toHom g : Matrix (Fin n) (Fin n) A).trace) :
    ∃ a ∈ strictKernel n π, ∀ g, ρ'.toHom g = a * ρ.toHom g * a⁻¹ := sorry

end Carayol

section Global

variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] (π : A →+* 𝔽) (T : Type*)

/-- **`R04.3/global-deformation-type`**. A `T`-framed lift: a lift together with framings
`α_v ∈ Γ̂_n(A)` for `v ∈ T` (local conditions are imposed separately). -/
structure TFramedLift where
  lift : Lift n ρbar π
  frame : T → strictKernel n π

/-- The equivalence `(ρ, α) ∼ (β ρ β⁻¹, β α)`. -/
instance : MulAction (strictKernel n π) (TFramedLift n ρbar π T) where
  smul b x := ⟨b • x.lift, fun v ↦ b * x.frame v⟩
  one_smul := by sorry
  mul_smul := by sorry

theorem tframed_smul_lift (b : strictKernel n π) (x : TFramedLift n ρbar π T) :
    (b • x).lift = b • x.lift := sorry

theorem tframed_smul_frame (b : strictKernel n π) (x : TFramedLift n ρbar π T) (v : T) :
    (b • x).frame v = b * x.frame v := sorry

/-- Unrestricted `T`-framed classes. This auxiliary quotient does not impose the
local problems, ramification set or determinant of a global type `𝒮`. -/
def UnrestrictedTFramedDef : Type _ := MulAction.orbitRel.Quotient (strictKernel n π) (TFramedLift n ρbar π T)

/-- API: the framed local lift `α_v⁻¹ ρ α_v` (here on the whole group) is constant on classes. -/
theorem framedLocalLift_smul (x : TFramedLift n ρbar π T) (b : strictKernel n π) (v : T) (g : G) :
    ((b • x).frame v : GL (Fin n) A)⁻¹ * (b • x).lift.toHom g * (b • x).frame v =
      (x.frame v : GL (Fin n) A)⁻¹ * x.lift.toHom g * x.frame v := sorry

end Global

section Twisting

variable {A : Type*} [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] (π : A →+* 𝔽)

/-- **`R04.4/twisting-action`**. The twist `χ ⊗ ρ` of a lift by a continuous character `χ`
that reduces to the trivial character. -/
def Lift.twist (χ : G →* Aˣ) (hχ : ∀ g, π (χ g) = 1)
    (hc : Continuous fun g ↦ ((χ g : Aˣ) : A)) (ρ : Lift n ρbar π) : Lift n ρbar π := sorry

/-- API: `χ ⊗ ρ` has matrices `χ(g) • ρ(g)`. -/
theorem Lift.twist_apply (χ : G →* Aˣ) (hχ : ∀ g, π (χ g) = 1)
    (hc : Continuous fun g ↦ ((χ g : Aˣ) : A)) (ρ : Lift n ρbar π) (g : G) :
    ((ρ.twist n ρbar π χ hχ hc).toHom g : Matrix (Fin n) (Fin n) A) =
      ((χ g : Aˣ) : A) • (ρ.toHom g : Matrix (Fin n) (Fin n) A) := sorry

/-- **`R04.4/twist-action-free`**, the trace step: `tr (χ ⊗ ρ)(g) = χ(g) · tr ρ(g)`. -/
theorem Lift.trace_twist (χ : G →* Aˣ) (hχ : ∀ g, π (χ g) = 1)
    (hc : Continuous fun g ↦ ((χ g : Aˣ) : A)) (ρ : Lift n ρbar π) (g : G) :
    ((ρ.twist n ρbar π χ hχ hc).toHom g : Matrix (Fin n) (Fin n) A).trace =
      ((χ g : Aˣ) : A) * (ρ.toHom g : Matrix (Fin n) (Fin n) A).trace := sorry

/-- The twist commutes with strict conjugation, so it acts on `Def`. -/
theorem Lift.twist_smul (χ : G →* Aˣ) (hχ : ∀ g, π (χ g) = 1)
    (hc : Continuous fun g ↦ ((χ g : Aˣ) : A)) (ρ : Lift n ρbar π) (b : strictKernel n π) :
    (b • ρ).twist n ρbar π χ hχ hc = b • ρ.twist n ρbar π χ hχ hc := sorry

end Twisting

end TauCeti.GaloisDeformation

namespace TauCeti.GaloisDeformation.SuggestedTest

open TauCeti.GaloisDeformation

/-- Shared selection: independent coordinate detections have zero joint kernel. -/
example : Function.Injective (fun x : Fin 2 → ZMod 3 => (x 0, x 1)) := by
  intro x y h
  funext i
  fin_cases i
  · exact congrArg Prod.fst h
  · exact congrArg Prod.snd h

/-- Repeating one detection cannot kill a two-dimensional kernel. -/
example : ¬ Function.Injective (fun x : Fin 2 → ZMod 3 => (x 0, x 0)) := by
  intro h
  have he := h (a₁ := fun _ => 0) (a₂ := fun i => if i = 0 then 0 else 1)
    (by simp)
  have bad := congrFun he 1
  norm_num at bad

/-- The framed restriction invariance is a group identity. -/
example {A : Type*} [CommRing A] (n : ℕ) (x α β : GL (Fin n) A) :
    (β * α)⁻¹ * (β * x * β⁻¹) * (β * α) = α⁻¹ * x * α := by group

/-- A discrete topology on `Multiplicative ℤ`, for the examples. -/
local instance : TopologicalSpace (Multiplicative ℤ) := ⊥


/-- The trivial one-dimensional residual representation is Schur. -/
example (𝔽 : Type) [Field 𝔽] : IsSchur 1 (1 : Multiplicative ℤ →* GL (Fin 1) 𝔽) := sorry

/-- `1 ⊕ 1` is not Schur. -/
example (𝔽 : Type) [Field 𝔽] : ¬ IsSchur 2 (1 : Multiplicative ℤ →* GL (Fin 2) 𝔽) := sorry

/-- `R04.4/diagonalizable-groups`, the case `p = 2`, `m = 1` of the truncation isomorphism:
`(1 + X)² − 1 ∈ (2, X)²`. -/
example : ((1 + Polynomial.X) ^ 2 - 1 : Polynomial ℤ) ∈
    (Ideal.span {(2 : Polynomial ℤ), Polynomial.X}) ^ 2 := by
  have h2 : (2 : Polynomial ℤ) ∈ Ideal.span {(2 : Polynomial ℤ), Polynomial.X} :=
    Ideal.subset_span (by simp)
  have hX : (Polynomial.X : Polynomial ℤ) ∈ Ideal.span {(2 : Polynomial ℤ), Polynomial.X} :=
    Ideal.subset_span (by simp)
  have : ((1 + Polynomial.X) ^ 2 - 1 : Polynomial ℤ) = 2 * Polynomial.X + Polynomial.X * Polynomial.X := by
    ring
  rw [this, pow_two]
  exact Ideal.add_mem _ (Ideal.mul_mem_mul h2 hX) (Ideal.mul_mem_mul hX hX)

/-- `R04.4/twisting-action`: twisting a rank-two lift by `c` multiplies determinants by `c²`. -/
example {A : Type*} [CommRing A] (c : A) (M : Matrix (Fin 2) (Fin 2) A) :
    (c • M).det = c ^ 2 * M.det := by
  simp

/-- `R04.4/twist-action-free`, the dihedral stabiliser: in the induced basis, conjugation by
`diag(1, −1)` negates the matrix of an element outside the index-two subgroup. -/
example {A : Type*} [CommRing A] (a : A) :
    !![1, 0; 0, -1] * !![0, a; 1, 0] * !![1, 0; 0, -1] = -!![(0 : A), a; 1, 0] := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]

/-- ... and fixes a diagonal matrix, the image of an element of the index-two subgroup. -/
example {A : Type*} [CommRing A] (x y : A) :
    !![1, 0; 0, -1] * !![x, 0; 0, y] * !![1, 0; 0, -1] = !![x, 0; 0, y] := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]

/-- `R04.5/taylor-wiles-local-cohomology`: `Frob_v = diag(α, β)` acts on `E₁₂` by `α/β`, so
`ad⁰` has the eigenvalues `1, α/β, β/α` and its coinvariants are one-dimensional when `α ≠ β`. -/
example {K : Type*} [Field K] (α β : K) :
    !![α, 0; 0, β] * !![0, 1; 0, 0] * !![α⁻¹, 0; 0, β⁻¹] = (α * β⁻¹) • !![(0 : K), 1; 0, 0] := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two]

/-- `R04.5/taylor-wiles-local-cohomology`, why `p = 2` differs: scalars are trace-free in
characteristic two, so `Z ⊆ Ad⁰` and `Ad⁰/Z` is two-dimensional. -/
example : (1 : Matrix (Fin 2) (Fin 2) (ZMod 2)).trace = 0 := by decide

/-- `R04.5/dyadic-linear-disjointness`: KW II's recursion `R₄(X) = R₃(2X² − 1)` with
`R₃ = 2X² − 1`, so `R₄(0) = 1` (the Chebyshev polynomial `T₄`). -/
example : (2 * (2 * Polynomial.X ^ 2 - 1) ^ 2 - 1 : Polynomial ℤ) =
    8 * Polynomial.X ^ 4 - 8 * Polynomial.X ^ 2 + 1 := by ring

/-- `R04.6/patching-numerology`, `p > 2`: the number of generators `h + j − d` with `j = 4|S| − 1`,
`d = 3|S|` equals `h + |S| − 1`. -/
example (h S : ℤ) : h + (4 * S - 1) - 3 * S = h + S - 1 := by ring

/-- `p = 2`: with `t = 2 − |S| + h`, `h + j + t − d = 2h + 1`. -/
example (h S : ℤ) : h + (4 * S - 1) + (2 - S + h) - 3 * S = 2 * h + 1 := by ring

/-- `R04.6/kw-deformation-data`: `3|S_f| + [F : ℚ] + 2[F : ℚ] = 3|S|` for totally real `F`, whose
infinite places number `[F : ℚ]`. -/
example (Sf n : ℕ) : 3 * Sf + n + 2 * n = 3 * (Sf + n) := by ring

/-- `G8/fixed-versus-variable-determinant`: in characteristic `3` with `ε² = 0`,
`(1 + aε)³ = 1`, so `1 + ε` has no cube root of the form `1 + aε`: the splitting needs `p ∤ n`. -/
example {R : Type*} [CommRing R] (a e : R) (h3 : (3 : R) = 0) (he : e ^ 2 = 0) :
    (1 + a * e) ^ 3 = 1 := by
  linear_combination (a * e) * h3 + (3 * a ^ 2 + a ^ 3 * e) * he

/-- `G7/polarized-tangent-obstruction`: for `p = n = 3` the identity matrix has trace `0`, so the
scalars lie in `𝔤⁰`. -/
example : Matrix.trace (1 : Matrix (Fin 3) (Fin 3) (ZMod 3)) = 0 := by
  rw [Matrix.trace_one, Fintype.card_fin]
  decide

/-- `G7/enormous-taylor-wiles-presentation`: `−n²[F⁺ : ℚ] + q·n = qn − n²[F⁺ : ℚ]`. -/
example (q n f : ℤ) : -(n ^ 2 * f) + q * n = q * n - n ^ 2 * f := by ring

/-- `defProblem_not_conj_stable` and `fixed_matrix_not_problem`: a concrete strict
conjugator over the actual dual numbers, with its inverse and reduction checked. -/
private abbrev ε₃ : DualNumber (ZMod 3) := TrivSqZeroExt.inr 1
private abbrev D₃ : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 3)) := !![1, 0; 0, -1]
private abbrev b₃ : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 3)) := !![1, 0; ε₃, 1]
private abbrev b₃inv : Matrix (Fin 2) (Fin 2) (DualNumber (ZMod 3)) := !![1, 0; -ε₃, 1]

example : D₃ ^ 2 = 1 ∧ b₃ * b₃inv = 1 ∧ b₃inv * b₃ = 1 ∧
    b₃.map (dualResidue (𝔽 := ZMod 3)) = 1 ∧
    b₃ * D₃ * b₃inv = !![1, 0; 2 * ε₃, -1] ∧
    (b₃ * D₃ * b₃inv) 1 0 ≠ 0 := by
  let : DecidableEq (DualNumber (ZMod 3)) :=
    inferInstanceAs (DecidableEq (ZMod 3 × ZMod 3))
  decide

/- Regression helpers abbreviate existing matrices, linear maps and quotient spaces. -/

private abbrev Cℤ : Matrix (Fin 2) (Fin 2) ℤ := !![0, -1; 1, -1]
private abbrev Sℤ : Matrix (Fin 2) (Fin 2) ℤ := !![0, 1; 1, 0]
private abbrev aℤ : Matrix (Fin 2) (Fin 2) ℤ := !![2, 5; 5, 12]
private abbrev aℤinv : Matrix (Fin 2) (Fin 2) ℤ := !![-12, 5; 5, -2]

/-- the integral matrices generate S₃, and a is an integral unit matrix. -/
example : Cℤ ^ 3 = 1 ∧ Sℤ ^ 2 = 1 ∧ Sℤ * Cℤ * Sℤ = Cℤ ^ 2 ∧
    aℤ * aℤinv = 1 ∧ aℤinv * aℤ = 1 := by decide

/-- a reduces to 2I, not I, modulo 5; only ±1 are integral scalar units. -/
example : aℤ.map (Int.castRingHom (ZMod 5)) =
    (2 : ZMod 5) • (1 : Matrix (Fin 2) (Fin 2) (ZMod 5)) ∧
    aℤ.map (Int.castRingHom (ZMod 5)) ≠ 1 ∧
    (-aℤ).map (Int.castRingHom (ZMod 5)) ≠ 1 := by decide

/-- the integral common centralizer of C and S consists of scalar matrices. -/
example (x y z w : ℤ)
    (hC : !![x,y;z,w] * Cℤ = Cℤ * !![x,y;z,w])
    (hS : !![x,y;z,w] * Sℤ = Sℤ * !![x,y;z,w]) :
    y = 0 ∧ z = 0 ∧ x = w := by
  have hc00 := congrArg (fun M : Matrix (Fin 2) (Fin 2) ℤ => M 0 0) hC
  have hc01 := congrArg (fun M : Matrix (Fin 2) (Fin 2) ℤ => M 0 1) hC
  have hs00 := congrArg (fun M : Matrix (Fin 2) (Fin 2) ℤ => M 0 0) hS
  simp [Matrix.mul_apply, Fin.sum_univ_two] at hc00 hc01 hs00
  omega

/-- the local-residue condition genuinely supplies the missing scalar unit. -/
example {A : Type*} [CommRing A] [IsLocalRing A] [IsArtinianRing A]
    (π : A →+* ZMod 5) (hres : RingHom.ker π = IsLocalRing.maximalIdeal A)
    (c : A) (hc : π c ≠ 0) : IsUnit c := by
  by_contra hu
  have hm : c ∈ IsLocalRing.maximalIdeal A := hu
  have hk : c ∈ RingHom.ker π := hres.symm ▸ hm
  exact hc (RingHom.mem_ker.mp hk)

/-- The allowed Artinian-local A=Z/25, residue F₅: 2 lifts a residue scalar and is a unit.
The inverse 13 normalizes the same conjugator to the strict kernel. -/
example : (2 * 13 : ZMod 25) = 1 ∧
    ((13 : ZMod 25) • (aℤ.map (Int.castRingHom (ZMod 25)))).map
      (ZMod.castHom (by norm_num : 5 ∣ 25) (ZMod 5)) = 1 := by decide

/-- the normalized Artinian-local matrix is still invertible. -/
example :
    ((13 : ZMod 25) • (aℤ.map (Int.castRingHom (ZMod 25)))) *
      ((2 : ZMod 25) • (aℤinv.map (Int.castRingHom (ZMod 25)))) = 1 := by decide

local instance : Fact (Nat.Prime 3) := ⟨by decide⟩

private abbrev diagonal (m : ℕ) : ZMod 3 →ₗ[ZMod 3] (Fin m → ZMod 3) :=
  LinearMap.pi fun _ => LinearMap.id

private abbrev scalarFrames (m : ℕ) :=
  (Fin m → ZMod 3) ⧸ (diagonal m).range

/-- Rank one: trace-zero matrices vanish, but scalar framings need not. -/
example (M : Matrix (Fin 1) (Fin 1) (ZMod 3)) (h : M.trace = 0) : M = 0 := by
  ext i j
  fin_cases i
  fin_cases j
  simpa [Matrix.trace, Fin.sum_univ_one] using h

/-- the scalar boundary is the diagonal map, injective for two framings. -/
example : Function.Injective (diagonal 2) := by
  intro x y h
  exact congrFun h 0

/-- two framings leave exactly one actual quotient direction, k²/diag(k). -/
example : Module.finrank (ZMod 3) (scalarFrames 2) = 1 := by
  have hi : Function.Injective (diagonal 2) := fun _ _ h => congrFun h 0
  have hr := LinearMap.finrank_range_of_inj hi
  have hd := (diagonal 2).range.finrank_quotient_add_finrank
  simp only [CommSemiring.finrank_self] at hr
  rw [hr, Module.finrank_fin_fun] at hd
  exact Nat.add_right_cancel (hd.trans (by rfl))

/-- the two-framing quotient is not zero: the frame (0,1) is not diagonal. -/
example : (Submodule.Quotient.mk ![0,1] : scalarFrames 2) ≠ 0 := by
  intro h
  obtain ⟨c,hc⟩ := LinearMap.mem_range.mp
    ((Submodule.Quotient.mk_eq_zero (diagonal 2).range).mp h)
  have h0 := congrFun hc 0
  have h1 := congrFun hc 1
  change c = 0 at h0
  change c = 1 at h1
  norm_num [h0] at h1

/-- one framing is killed by the diagonal scalar change, so its quotient has dimension 0. -/
example : Module.finrank (ZMod 3) (scalarFrames 1) = 0 := by
  have hi : Function.Injective (diagonal 1) := fun _ _ h => congrFun h 0
  have hr := LinearMap.finrank_range_of_inj hi
  have hd := (diagonal 1).range.finrank_quotient_add_finrank
  simp only [CommSemiring.finrank_self] at hr
  rw [hr, Module.finrank_fin_fun] at hd
  exact Nat.add_right_cancel (hd.trans (by rfl))

/-- no framings give zero H¹ frame directions, but all scalars remain in ker d⁰. -/
example : Module.finrank (ZMod 3) (scalarFrames 0) = 0 ∧
    (diagonal 0).ker = ⊤ := by
  constructor
  · have hd := (diagonal 0).range.finrank_quotient_add_finrank
    rw [Module.finrank_fin_fun] at hd
    change Module.finrank (ZMod 3) ((Fin 0 → ZMod 3) ⧸ (diagonal 0).range) = 0
    omega
  · ext x
    simp [LinearMap.mem_ker, diagonal, funext_iff]

private abbrev C₅ : Matrix (Fin 2) (Fin 2) (ZMod 5) := Cℤ.map (Int.castRingHom _)
private abbrev S₅ : Matrix (Fin 2) (Fin 2) (ZMod 5) := Sℤ.map (Int.castRingHom _)
private abbrev J₅ : Matrix (Fin 2) (Fin 2) (ZMod 5) := C₅ - C₅ ^ 2

/-- J spans a nonzero trace-zero sign line in the adjoint of the S₃ representation. -/
example : J₅.trace = 0 ∧ J₅ ≠ 0 ∧
    C₅ * J₅ * C₅ ^ 2 = J₅ ∧ S₅ * J₅ * S₅ = -J₅ := by decide

/-- the sign line is proper even inside ad⁰: diag(1,-1) is not in it. -/
example : !![(1 : ZMod 5),0;0,-1] ∉ Submodule.span (ZMod 5) {J₅} := by
  rw [Submodule.mem_span_singleton]
  decide

/-- all scalar multiples stay in the sign line under the two generators. -/
example (t : ZMod 5) :
    C₅ * (t • J₅) * C₅ ^ 2 = t • J₅ ∧ S₅ * (t • J₅) * S₅ = -(t • J₅) := by
  fin_cases t <;> decide

/-- I,C,S,CS form a basis of M₂(F₅), witnessed by their flattened determinant.
This tests residual absolute irreducibility, not irreducibility of the adjoint. -/
example : (!![(1 : ZMod 5),0,0,1;0,-1,1,-1;0,1,1,0;-1,0,-1,1]).det ≠ 0 := by decide

end TauCeti.GaloisDeformation.SuggestedTest

/-!
## Mathematical contracts for the full roadmap

The native declarations above cover the lifting, strict quotient, restriction,
fixed determinant, adjoint tangent, framing and twisting interfaces and their
matrix regressions. The coefficient categories, arithmetic groups, local quotient
rings, polynomial-law determinants and Selmer complexes needed for the remaining
signatures have no imported native interface at this baseline. Following the
standard nonexhaustive convention, those signatures are omitted until their
suppliers are available. In particular these contracts are mathematical
specifications, not declarations or elaborated Lean examples. Every planned
API and regression name is retained below for comparison with README.md.

## Layer R04.1: Deformation functors

Construct the functors before asking which are representable. The residual identification, strict action and continuity belong to their definitions. Matrix and module descriptions agree, while determinant laws have a separate comparison.

Target: lifting-functor

### 1.1. The lifting (framed deformation) functor

Define Lift_ρ̄(A) to consist of continuous homomorphisms G → GLₙ(A) whose reduction is ρ̄. A coefficient morphism f pushes a lift forward by GLₙ(f). This defines a set-valued functor on Art_𝒪 without a representability assumption. On C_𝒪, construct the natural identification with limᵣ Lift_ρ̄(A/m_Aʳ). The strict kernel acts by conjugation. Since Artinian coefficient rings here are finite, continuity there is equivalent to factoring through a finite quotient with open kernel.

API. Use the following interfaces in TauCeti.GaloisDeformation, together with extensionality and the coefficient-map identity/composition laws where relevant.

- Lift (constructor): Lift ρ̄ : Art_𝒪 ⥤ Type, A ↦ continuous lifts of ρ̄ to GL_n(A).
- Lift.map (functoriality): A local 𝒪-algebra map f induces Lift(A) → Lift(B), ρ ↦ GL_n(f) ∘ ρ.
- Lift.reduce (projection): Every lift reduces to ρ̄ modulo m_A.
- Lift.conj (structure): Γ̂_n(A) acts on Lift(A) by conjugation.
- Lift.limEquiv (equivalence): For A ∈ C_𝒪, Lift(A) ≃ lim_k Lift(A/m_A^k).

Unit tests. These are mathematical regression cases, including examples that reject an incorrect definition.

- lift_trivial_char_Zp: For G = ℤ_p, n = 1, ρ̄ = 1: Lift(A) ≅ 1 + m_A, via ρ ↦ ρ(1).
- lift_residue: Lift_ρ̄(𝔽) is a singleton.
- lift_not_continuous: For G = ∏_ℕ ℤ/p, n = 1, ρ̄ = 1 and A = 𝔽[ε], a homomorphism G → 1 + ε𝔽 ≅ 𝔽 given by an 𝔽_p-linear functional that vanishes on no open subgroup is not in Lift(A).
- lift_functorial: Lift.map (g ∘ f) = Lift.map g ∘ Lift.map f.

Sources. Gee, §3.1, p. 12; Kisin, Lecture 1, (1.1.1)–(1.1.2), p. 1.

Prerequisites. DeformationAndDerivedPatchingAlgebra R03.1; ArithmeticGaloisRepresentations R01.1; Mathlib Matrix.GeneralLinearGroup; Mathlib Matrix.GeneralLinearGroup.map; Mathlib IsArtinianRing; Mathlib IsLocalRing; Mathlib ContinuousMonoidHom.

Target: module-deformation-functor

### 1.2. Deformations as modules with a residual identification

Fix the standard residual G-module V̄ = kⁿ and its basis β. A module deformation over A is a finite free A-module V with a continuous A-linear G-action, together with a G-equivariant residual identification ι : V ⊗_A k ≅ V̄. Morphisms are G-equivariant A-linear isomorphisms commuting with ι. Define ModDef as their isomorphism classes; ModDefFramed adds an A-basis reducing through ι to β, and morphisms must also preserve that basis. A basis lifting β exists by freeness and Nakayama. Base change carries the action, residual identification and basis, rather than just the underlying module.

API. Use the following interfaces in TauCeti.GaloisDeformation, together with extensionality and the coefficient-map identity/composition laws where relevant.

- ModDef (constructor): Def^mod_ρ̄ : Art_𝒪 ⥤ Type, isomorphism classes of (V_A, ι).
- ModDefFramed (constructor): Def^{mod,□}_ρ̄, adding a basis lifting β.
- ModDef.baseChange (functoriality): Base change along local 𝒪-algebra maps.
- ModDef.exists_basis_lift (characterisation): Every (V_A, ι) has a basis lifting β.

Unit tests. These are mathematical regression cases, including examples that reject an incorrect definition.

- moddef_residue: Def^mod_ρ̄(𝔽) is a singleton.
- moddef_rank_one: For n = 1 and ρ̄ = χ̄, Def^mod(A) = {χ̃ψ : ψ ∈ Hom_cont(G, 1 + m_A)} for a fixed lift χ̃.
- moddef_needs_iota: For ρ̄ = 1 ⊕ 1, A = 𝔽[ε] and a nonzero continuous additive character x : G → (𝔽,+), the lifts diag(1 + εx, 1) and diag(1, 1 + εx) give isomorphic G-modules by swapping basis vectors, but distinct deformations with the specified residual identification ι. Strict conjugation fixes their first-order matrices; the swap does not reduce to the identity.

Sources. Kisin, Lecture 1, (1.1.1), p. 1.

Prerequisites. DeformationAndDerivedPatchingAlgebra R03.1; The lifting (framed deformation) functor (Layer R04.1); Mathlib Module.Free; Mathlib IsLocalRing.

Target: strict-deformation-functor

### 1.3. Deformations up to strict equivalence

For every continuous ρ̄, form Def_ρ̄(A) = Lift_ρ̄(A)/Γ̂ₙ(A). Coefficient maps descend to this orbit quotient. Specify the quotient constructor and equality criterion: two representatives have the same class precisely when a conjugator reduces to the identity. This functor exists even when ρ̄ has non-scalar endomorphisms; representability is a separate target in R04.2.

API. Use the following interfaces in TauCeti.GaloisDeformation, together with extensionality and the coefficient-map identity/composition laws where relevant.

- Def (constructor): Def ρ̄ A := Lift ρ̄ A ⧸ Γ̂_n(A).
- Def.mk (constructor): The class of a lift.
- Def.mk_eq_mk_iff (characterisation): [ρ] = [ρ′] ↔ ∃ a ∈ Γ̂_n(A), ρ′ = aρa⁻¹.
- Def.map (functoriality): Functoriality in A.
- Def.toModDef (equivalence): Def ≃ Def^mod (module-deformations-are-strict-classes).

Unit tests. These are mathematical regression cases, including examples that reject an incorrect definition.

- def_residue: Def_ρ̄(𝔽) is a singleton.
- def_rank_one_eq_lift: For n = 1, Def = Lift.
- def_not_full_conj: For ρ̄ = 1 ⊕ 1, the lifts diag(1 + εx, 1) and diag(1, 1 + εx) to 𝔽[ε] (x a nonzero continuous character G → 𝔽) are distinct strict classes although GL₂(𝔽[ε])-conjugate.

Sources. Gee, Definition 3.4, p. 12; Kisin, Lecture 1, Remark (1.1.2)(1), p. 1.

Prerequisites. The lifting (framed deformation) functor (Layer R04.1); Mathlib Matrix.GeneralLinearGroup; Mathlib MonoidHom.ker.

Target: module-deformations-are-strict-classes

### 1.4. Module deformations are lifts up to strict conjugation

Construct natural equivalences Lift_ρ̄(A) ≅ ModDefFramed_ρ̄(A) and Def_ρ̄(A) ≅ ModDef_ρ̄(A), for A in Art_𝒪 and C_𝒪 with its specified topology. A compatible module isomorphism has reduction equal to the identity in any bases lifting β; conversely a strict conjugator induces such an isomorphism. Check independence of the chosen lifted basis and compatibility with coefficient maps.

Sources. Kisin, Lecture 1, Remark (1.1.2)(1), p. 1.

Prerequisites. The lifting (framed deformation) functor (Layer R04.1); Deformations as modules with a residual identification (Layer R04.1); Deformations up to strict equivalence (Layer R04.1).

Target: strict-vs-full-conjugacy

### 1.5. Strict and full conjugacy agree for Schur residual representations

Assume ρ̄ is Schur. If lifts ρ and ρ′ over A ∈ Art_𝒪 or C_𝒪 are conjugate by a ∈ GLₙ(A), they are strictly conjugate. The reduction of a centralizes ρ̄ and is a nonzero scalar; a unit lifting that scalar normalizes a into Γ̂ₙ(A). In an unbundled signature require locality, surjectivity of π_A and ker π_A = m_A explicitly. The scalar normalization uses the local-ring unit criterion. Give both the nonschur failure and the failure of replacing a local coefficient ring by an arbitrary surjection onto k.

Sources. Gee, Definition 3.4, p. 12.

Prerequisites. Deformations up to strict equivalence (Layer R04.1); Mathlib Matrix.GeneralLinearGroup; DeformationAndDerivedPatchingAlgebra R03.1.

Target: restriction-of-deformations

### 1.6. Restriction of lifts and deformations is well defined

For a continuous homomorphism ι : H → G of profinite groups, precomposition gives Lift_ρ̄ → Lift_{ρ̄∘ι}. It commutes with strict conjugation and therefore descends to Def. A framed pair (ρ,α), with α ∈ Γ̂ₙ(A), has restricted lift α⁻¹(ρ∘ι)α. This lift is invariant under simultaneous replacement (ρ,α) ↦ (βρβ⁻¹,βα); prove the identity before using it to classify a map out of a local framed ring. Restriction need not be an inclusion of groups.

Sources. Gee, §3.20–3.21, p. 15.

Prerequisites. The lifting (framed deformation) functor (Layer R04.1); Deformations up to strict equivalence (Layer R04.1); Mathlib ContinuousMonoidHom.

Target: fixed-determinant-functors

### 1.7. Lifts and deformations with fixed determinant

For a continuous χ : G → 𝒪ˣ reducing to det ρ̄, define LiftDet_χ(A) by the pointwise equation det ρ(g) = χ_A(g). Strict conjugation preserves it; define DefDet_χ as its orbit quotient and construct the inclusions into Lift and Def. Pushforward respects the determinant equation, so both are subfunctors. If a proposed χ has incompatible residual determinant, the corresponding set of lifts is empty.

API. Use the following interfaces in TauCeti.GaloisDeformation, together with extensionality and the coefficient-map identity/composition laws where relevant.

- LiftDet (constructor): Lift_{ρ̄,χ} as a subfunctor of Lift_ρ̄.
- DefDet (constructor): Def_{ρ̄,χ} as a subfunctor of Def_ρ̄.
- LiftDet.conj (structure): Γ̂_n(A) preserves Lift_{ρ̄,χ}(A).
- mem_LiftDet_iff (characterisation): ρ ∈ Lift_{ρ̄,χ}(A) ↔ det ∘ ρ = χ_A.

Unit tests. These are mathematical regression cases, including examples that reject an incorrect definition.

- liftDet_rank_one: For n = 1, Lift_{ρ̄,χ}(A) is the singleton {χ_A}.
- liftDet_residue: Lift_{ρ̄,χ}(𝔽) = {ρ̄}.
- liftDet_wrong_char: If χ mod λ ≠ det ρ̄ the functor is empty on 𝔽, so the hypothesis is needed.

Sources. Gee, §3.18, p. 15.

Prerequisites. The lifting (framed deformation) functor (Layer R04.1); Deformations up to strict equivalence (Layer R04.1); Mathlib Matrix.GeneralLinearGroup.det.

Target: change-of-coefficients

### 1.8. Change of coefficient ring and residue field

Take a finite local coefficient map 𝒪 → 𝒪′ and its specified residue inclusion k → k′. Put ρ̄′ = ρ̄ ⊗_k k′. Identify lifts over an Art_𝒪′ object A′ with lifts over the underlying 𝒪-algebra A′ having reduction prescribed by ρ̄′; its residue field is k′, not k. The identification descends to strict classes and fixed-determinant classes and is natural in A′. Scalar extension of the residual centralizer shows that a Schur representation remains Schur. Ordinary irreducibility alone need not persist under residue extension.

API. Use the following interfaces in TauCeti.GaloisDeformation, together with extensionality and the coefficient-map identity/composition laws where relevant.

- Lift.changeCoeff (equivalence): Lift^{𝒪′}_{ρ̄⊗𝔽′}(A′) ≃ lifts of ρ̄ to A′ as an 𝒪-algebra.
- Def.changeCoeff (equivalence): The same for strict classes.
- isSchur_baseChange (compatibility): ρ̄ Schur ↔ ρ̄ ⊗ 𝔽′ Schur.
- LiftDet.changeCoeff (equivalence): The same with fixed determinant χ composed with 𝒪 → 𝒪′.

Unit tests. These are mathematical regression cases, including examples that reject an incorrect definition.

- changeCoeff_id: For 𝒪 = 𝒪′ the change of coefficients is the identity.
- changeCoeff_schur: ρ̄ Schur iff ρ̄ ⊗ 𝔽′ Schur.
- changeCoeff_irreducible_fails: The representation of ℤ/(p²−1) through an element of 𝔽_{p²}^× of order p²−1 viewed over 𝔽_p is irreducible of dimension 2 but splits over 𝔽_{p²}.

Sources. Gee, §3.1, p. 12; Kisin, Lecture 1, (1.1.1), p. 1.

Prerequisites. DeformationAndDerivedPatchingAlgebra R03.1; The lifting (framed deformation) functor (Layer R04.1); Deformations up to strict equivalence (Layer R04.1); Lifts and deformations with fixed determinant (Layer R04.1).

Target: determinant-deformation-functor

### 1.9. Deformations of a residual determinant

Import degree-n multiplicative polynomial laws from IntegralHeckeAndGaloisDeterminants IHG.0. Write D̄ for the law obtained by extending ρ̄ to k[G] and taking its matrix determinant. DetDef_D̄(A) consists of degree-n determinants on A[G] reducing to D̄. Require continuity of every characteristic-polynomial coefficient g ↦ Λ_i(g). Give base change, restriction and the inverse-limit extension to C_𝒪. This law contains characteristic-polynomial data on the group algebra; the character g ↦ det ρ̄(g) alone is not its definition.

API. Use the following interfaces in TauCeti.GaloisDeformation, together with extensionality and the coefficient-map identity/composition laws where relevant.

- DetDef (constructor): Def_{D̄} : Art_𝒪 ⥤ Type, continuous n-dimensional determinants lifting D̄.
- DetDef.map (functoriality): Base change of determinants.
- DetDef.charpoly (projection): The characteristic-polynomial coefficients of a lifted determinant.
- DetDef.rank_one (equivalence): For n = 1, Def_{D̄} ≃ Lift_{χ̄}.

Unit tests. These are mathematical regression cases, including examples that reject an incorrect definition.

- detDef_rank_one: For n = 1 the functor is Lift_{χ̄}.
- detDef_residue: Def_{D̄}(𝔽) = {D̄}.
- detDef_ignores_extension: Two residual representations with the same semisimplification have the same Def_{D̄}.

Sources. Chenevier, §3.1, Proposition 3.3, p. 42.

Prerequisites. IntegralHeckeAndGaloisDeterminants IHG.0; DeformationAndDerivedPatchingAlgebra R03.1.

Target: determinant-comparison

### 1.10. The determinant map from representation deformations to determinant deformations

Extend a lift ρ A-linearly to A[G] and compose with the matrix determinant law. Conjugation invariance gives a natural map δ : Def_ρ̄ → DetDef_D̄, compatible with coefficient extension and subgroup restriction. Exhibit its noninjectivity without an absolute-irreducibility hypothesis: take a nonsplit extension of χ₂ by χ₁ with more than one extension direction, and change its extension cocycle over k[ε] in a direction not absorbed by strict change of basis. Its polynomial-law determinant stays constant. This is the construction and counterexample; the isomorphism under absolute irreducibility belongs to R04.2.

Sources. Kisin, Lecture 1, (1.5) Exercise 3, p. 4; Chenevier, §3.1, Example 3.4, p. 42.

Prerequisites. Deformations up to strict equivalence (Layer R04.1); Deformations of a residual determinant (Layer R04.1); IntegralHeckeAndGaloisDeterminants IHG.0.

Target: tangent-spaces

### 1.11. Tangent spaces of the lifting and deformation functors

For k[ε] = k[X]/(X²), construct the cocycle-to-lift bijection f ↦ (1 + εf)ρ̄ from Z¹(G,ad ρ̄) to Lift_ρ̄(k[ε]). Under a strict infinitesimal change of basis cocycles differ by a coboundary, giving H¹(G,ad ρ̄) ≅ Def_ρ̄(k[ε]). The fibres are torsors for ad ρ̄/(ad ρ̄)^G. Thus, when the cohomology is finite dimensional, the framed tangent dimension is h¹(G,ad ρ̄) + n² − h⁰(G,ad ρ̄). For fixed determinant use the trace-zero cocycle condition; in the p ∤ n convention identify its cohomology using ad⁰. Import Tau Ceti's continuous cocycles and quotient H¹, retaining the continuous adjoint action needed to put B¹ inside Z¹.

Sources. Kisin, Lecture 1, Lemma (1.3.1), p. 3; Gee, Exercise 3.11 and Corollary 3.12, p. 13.

Prerequisites. The lifting (framed deformation) functor (Layer R04.1); Deformations up to strict equivalence (Layer R04.1); Tau Ceti TauCeti.ContCohomology.Z1; Tau Ceti TauCeti.ContCohomology.B1; Tau Ceti TauCeti.ContCohomology.H1.

## Layer R04.2: Representability and universal lifts

Apply the coefficient-category and representability algebra to the actual continuous Galois functors. Keep the Φₚ, Schur and absolute-irreducibility inputs separate. The frame and determinant comparisons give reusable maps between the resulting rings.

Target: phi-p-condition

### 2.1. Mazur's finiteness condition Φ_p

For a profinite group G and prime p, define Φₚ(G) by finiteness of Hom_cont(Δ,𝔽ₚ) for every open subgroup Δ. Relate this to topological finite generation of the maximal pro-p quotient of every Δ, prove inheritance by open subgroups and prove Φₚ for topologically finitely generated profinite groups. The latter implication uses finite-index subgroup generation. Quantifying only over G does not define Φₚ.

API. Use the following interfaces in TauCeti.GaloisDeformation, together with extensionality and the coefficient-map identity/composition laws where relevant.

- PhiP (constructor): The predicate Φ_p on profinite groups.
- phiP_iff_fg (characterisation): Φ_p ↔ every open subgroup has topologically finitely generated maximal pro-p quotient.
- PhiP.open (compatibility): Φ_p passes to open subgroups.
- phiP_of_fg (instance): Topologically finitely generated profinite groups satisfy Φ_p.

Unit tests. These are mathematical regression cases, including examples that reject an incorrect definition.

- phiP_Zp: ℤ_p satisfies Φ_p.
- phiP_open: If G satisfies Φ_p, so does every open subgroup.
- phiP_not_of_Hom: Let G = (∏_ℕ ℤ/p) ⋊ ℤ/2 with the involution acting by inversion and p odd. Then Hom_cont(G, (𝔽_p,+)) = 0, but the open subgroup ∏_ℕ ℤ/p has infinitely many continuous coordinate characters, so G fails Φ_p.

Sources. Gee, §3.1, p. 12; Kisin, Lecture 1, (1.2), p. 1, and Exercise 1, p. 4.

Prerequisites. Mathlib ProfiniteGrp; Mathlib ContinuousMonoidHom; Mathlib IsPGroup.

Target: phi-p-global

### 2.2. Global and local Galois groups satisfy Φ_p

For a number field F and finite ramification set S, prove Φₚ(G_{F,S}), where the maximal extension is allowed to ramify at the infinite places. Apply the finiteness theorem of ArithmeticGaloisDuality R02.3 to each finite extension corresponding to an open subgroup. For a finite extension K/ℚ_ℓ, with ℓ arbitrary including p, prove Φₚ(G_K). Use LocalGaloisGroups Layer 3 for the maximal pro-p quotient and apply it to every finite extension of K. These arithmetic examples supply the finiteness condition required by representability.

Sources. Gee, §3.1, p. 12; Kisin, Lecture 1, (1.2), p. 2.

Prerequisites. Mazur's finiteness condition Φ_p (Layer R04.2); ArithmeticGaloisDuality R02.3; LocalGaloisGroups Layer 3.

Target: universal-lifting-ring

### 2.3. The universal lifting ring

If Φₚ(G) holds, construct R^□_ρ̄ ∈ C_𝒪 and a continuous lift ρ^□ such that local 𝒪-algebra maps R^□_ρ̄ → A correspond naturally and bijectively to Lift_ρ̄(A), by pushforward of ρ^□. Apply the generic framed representability construction from R03.2: the residual-kernel reduction and Φₚ give finite tangent space, while the lifting functor respects the required fibre products. No Schur hypothesis is needed. Specialize to global and local Galois groups using the previous target.

Sources. Kisin, Lecture 1, Proposition (1.2.1)(1) and its proof, p. 2; Gee, Lemma 3.2 and Definition 3.3, p. 12.

Prerequisites. Mazur's finiteness condition Φ_p (Layer R04.2); The lifting (framed deformation) functor (Layer R04.1); Tangent spaces of the lifting and deformation functors (Layer R04.1); DeformationAndDerivedPatchingAlgebra R03.2; Mathlib MvPowerSeries; Mathlib IsAdicComplete.

Target: universal-continuous-lift

### 2.4. The universal continuous lift over the inverse-limit ring

Recover ρ^□ over the complete representing ring from the compatible universal lifts over R^□/mʳ. Its reduction is ρ̄ and its matrix entries are continuous for the adic topology. Evaluation at this lift realizes the representing bijection for every complete coefficient object, not only an Artinian quotient. Carry out the analogous inverse-limit construction for a chosen universal unframed representative in the Schur case and for the determinant quotients.

API. Use the following interfaces in TauCeti.GaloisDeformation, together with extensionality and the coefficient-map identity/composition laws where relevant.

- univLift (constructor): ρ^□ : G →* GL_n(R^□_ρ̄), continuous.
- univLift_reduce (simp): ρ^□ mod m = ρ̄.
- liftEquivHom (universal-property): Lift_ρ̄(A) ≃ (R^□_ρ̄ →ₐ[𝒪] A) local, for A ∈ C_𝒪.
- univLift_continuous (characterisation): ρ^□ is continuous for the m-adic topology.

Unit tests. These are mathematical regression cases, including examples that reject an incorrect definition.

- univLift_rank_one_trivial: For n = 1, ρ̄ = 1, ρ^□ is the tautological character into 𝒪[[G^{ab,(p)}]]^×.
- univLift_residue: ρ^□ reduces to ρ̄.
- univLift_not_Artinian: For G = ℤₚ in rank one with trivial residual character, the representing ring 𝒪⟦T⟧ is not Artinian. The universal lift cannot be replaced by a lift over one fixed Artinian quotient.

Sources. Gee, Definition 3.3, p. 12; Kisin, Lecture 1, Remark (1.2.2)(2), p. 2.

Prerequisites. The universal lifting ring (Layer R04.2); The lifting (framed deformation) functor (Layer R04.1); DeformationAndDerivedPatchingAlgebra R03.1; Mathlib IsAdicComplete.

Target: universal-deformation-ring

### 2.5. The universal deformation ring

Under Φₚ and the Schur hypothesis, Def_ρ̄ is pro-represented by R_ρ̄ ∈ C_𝒪 with a universal strict class. The universal property is a natural bijection Hom_{C_𝒪}(R_ρ̄,A) ≅ Def_ρ̄(A). Without Schur, construct a hull from R03.2's criteria and retain the distinction between versality and a representing bijection: automorphisms can prevent pro-representability. A hull is not renamed a universal ring.

Sources. Kisin, Lecture 1, Proposition (1.2.1)(2), p. 2; Gee, Lemma 3.5, p. 12.

Prerequisites. Mazur's finiteness condition Φ_p (Layer R04.2); Deformations up to strict equivalence (Layer R04.1); Strict and full conjugacy agree for Schur residual representations (Layer R04.1); Tangent spaces of the lifting and deformation functors (Layer R04.1); The universal lifting ring (Layer R04.2); DeformationAndDerivedPatchingAlgebra R03.2.

Target: framed-unframed-comparison

### 2.6. Framed rings are power series over unframed rings

For Schur ρ̄ under Φₚ, choose a representative ρ^univ and construct an isomorphism R^□_ρ̄ ≅ R_ρ̄⟦X_{ij}⟧/(X_{11}). The universal framed lift is (1 + X)ρ^univ(1 + X)⁻¹ in a choice of these coordinates. Normalize the distinguished entry of a strict frame using its scalar unit; the scalar centralizer removes exactly one variable. The resulting extension is formally smooth with n² − 1 variables. Repeat for fixed determinant with the same framing variables. For a nonempty finite framing set T the simultaneous version has n²|T| − 1 variables; T empty is unframed. None of these coordinate isomorphisms is claimed canonical.

Sources. Gee, Exercise 3.9, p. 13; Kisin, Lecture 1, Remark (1.2.2)(3), p. 2.

Prerequisites. The universal lifting ring (Layer R04.2); The universal deformation ring (Layer R04.2); The universal continuous lift over the inverse-limit ring (Layer R04.2); Lifts and deformations with fixed determinant (Layer R04.1); DeformationAndDerivedPatchingAlgebra R03.2; Mathlib MvPowerSeries; Mathlib Algebra.FormallySmooth.

Target: carayol-trace-theorem

### 2.7. Carayol's theorem: absolutely irreducible deformations are determined by traces

Let ρ̄ be absolutely irreducible and ρ a lift over R ∈ C_𝒪. Prove: its invertible centralizer consists of scalar units; two lifts with identical trace functions are strictly conjugate; and if all traces lie in a closed subring S ∈ C_𝒪 with m_S = S ∩ m_R and compatible residue identification, then ρ is strictly conjugate to a lift over S. Deduce topological generation of R_ρ̄ by universal traces, also using any dense subset of G. Burnside's full matrix-span criterion is the residual input. Keep locality, Noetherianity and maximal-ideal adic completeness in the complete-ring version, and separately state the Artinian-local version.

Sources. Kisin, Lecture 1, Theorem (1.4.1) and its proof, pp. 3–4; Gee, Lemma 3.7, pp. 12–13.

Prerequisites. Deformations up to strict equivalence (Layer R04.1); The lifting (framed deformation) functor (Layer R04.1); Mathlib Matrix.GeneralLinearGroup; DeformationAndDerivedPatchingAlgebra R03.1.

Target: determinant-comparison-isomorphism

### 2.8. For absolutely irreducible ρ̄ the determinant map is an isomorphism of deformation functors

If ρ̄ is absolutely irreducible, δ from R04.1 is a natural isomorphism on Art_𝒪, and on C_𝒪 by inverse limits. For surjectivity, form the Cayley–Hamilton quotient A[G]/CH(D) of a determinant deformation and apply IHG.1's henselian reconstruction to its induced law. The residual law is split and absolutely irreducible; Artinian local A is henselian. Match the reconstructed reduction with ρ̄, adjusting its basis. For injectivity, equality of determinant laws gives equality of traces and Carayol gives strict conjugacy. Whenever R_ρ̄ exists it therefore also represents DetDef_D̄. This comparison does not impose an ordinary fixed determinant character.

Sources. Chenevier, §3.1, Example 3.4, p. 42; Chenevier, Theorem 2.22(i), p. 34; Cayley–Hamilton quotient construction §1.17.

Prerequisites. The determinant map from representation deformations to determinant deformations (Layer R04.1); Carayol's theorem: absolutely irreducible deformations are determined by traces (Layer R04.2); The universal deformation ring (Layer R04.2); IntegralHeckeAndGaloisDeterminants IHG.0; IntegralHeckeAndGaloisDeterminants IHG.1, henselian-irreducible.

Target: fixed-determinant-rings

### 2.9. Fixed-determinant rings and change of determinant

Under Φₚ, the closed quotient of R^□_ρ̄ by the equations det ρ^□(g) − χ(g), for all g, represents LiftDet_χ. In the Schur case the corresponding quotient of R_ρ̄ represents DefDet_χ. If p ∤ n, n-th power is an automorphism of 1 + m_A; use its unique inverse to define ψ = (χ_A⁻¹ det ρ)^{1/n}. The correspondence ρ ↦ (ψ⁻¹⊗ρ,ψ) gives R^□_ρ̄ ≅ R^□_{ρ̄,χ} ⊗̂_𝒪 𝒪⟦G^{ab,(p)}⟧, and similarly unframed. For any other compatible χ′, twisting by the unique n-th root of χ′χ⁻¹ identifies the fixed-determinant rings. Keep p ∤ n on the root and product assertions.

Sources. Gee, §3.18 and Exercise 3.19, p. 15.

Prerequisites. Lifts and deformations with fixed determinant (Layer R04.1); The universal lifting ring (Layer R04.2); The universal deformation ring (Layer R04.2); Mazur's finiteness condition Φ_p (Layer R04.2); Mathlib Matrix.GeneralLinearGroup.det.

Target: change-of-residue-field

### 2.10. Representing rings under change of coefficients

For a finite local map 𝒪 → 𝒪′ with residue inclusion k → k′, let ρ̄′ = ρ̄ ⊗ k′. Show R^□_{ρ̄′,𝒪′} ≅ R^□_{ρ̄,𝒪} ⊗̂_𝒪 𝒪′ by the coefficient-change functoriality in R04.1 and the representing property. In the Schur case give the unframed isomorphism, and give both fixed-determinant versions. The maps carry the universal lifts or classes to their scalar extensions. Use finiteness of 𝒪′/𝒪 to ensure the completed tensor product is again a local Noetherian coefficient object.

Sources. Gee, §3.1, p. 12.

Prerequisites. Change of coefficient ring and residue field (Layer R04.1); The universal lifting ring (Layer R04.2); The universal deformation ring (Layer R04.2); DeformationAndDerivedPatchingAlgebra R03.1.

## Layer R04.3: Local conditions and global presentations

Assemble local problems into a global framed functor. The map from the local tensor ring is characterized by invariant framed restrictions. The arithmetic mapping fibre gives the relative tangent and obstruction bounds; its scalar degree-zero term fixes the frame count.

Target: local-deformation-problem

### 3.1. Local deformation problems

For G_v satisfying Φₚ and residual ρ̄_v, define a local deformation problem as a family D(A) ⊆ Lift_ρ̄_v(A), for A ∈ C_𝒪, with six axioms: membership of the residual point; preservation by coefficient maps; detection along injective coefficient maps; gluing a pair of lifts in R₁×_{R₁/I₁≅R₂/I₂}R₂ whenever I₁,I₂ are closed ideals and the quotient lifts agree; detection by a decreasing separated filtration of ideals; and stability under strict conjugation. State each using actual lifts and classifying maps. An unrestricted problem is the whole lifting functor. The p-adic and inertial local conditions imported from LocalGaloisDeformationRings must carry this interface.

API. Use the following interfaces in TauCeti.GaloisDeformation, together with extensionality and the coefficient-map identity/composition laws where relevant.

- DeformationProblem (structure): A Γ̂_n-stable set of lifts satisfying the CHT axioms.
- DeformationProblem.unrestricted (constructor): All lifts.
- DeformationProblem.mem_map (compatibility): Closure under pushforward.
- DeformationProblem.conj_mem (compatibility): Stability under Γ̂_n-conjugation.

Unit tests. These are mathematical regression cases, including examples that reject an incorrect definition.

- defProblem_unrestricted: All lifts form a deformation problem.
- defProblem_residue: (𝔽, ρ̄_v) belongs to every deformation problem.
- defProblem_not_conj_stable: Take G = ℤ/2 with generator σ, A = 𝔽₃[ε], D = diag(1,−1), ρ(σ) = D and b = 1 + εE₂₁. Then b reduces to 1 and bDb⁻¹ = D + 2εE₂₁ has a nonzero lower-left entry. Thus this particular upper-triangular condition is not strict-conjugation-stable.

Sources. Gee, Definition 3.16, p. 14.

Prerequisites. The lifting (framed deformation) functor (Layer R04.1); Restriction of lifts and deformations is well defined (Layer R04.1).

Target: deformation-problem-ideal

### 3.2. Deformation problems are invariant ideals of the lifting ring

Associate to D a closed ideal I(D) of R^□_ρ̄_v so that a lift belongs to D exactly when its classifying map kills I(D). The universal strict conjugation transformations preserve the ideal; do not assert that these transformations, indexed by universal-ring matrices, form an ordinary group action on that ring. The annihilator of I(D) in the tangent space is L̃(D) ⊆ Z¹ and is the inverse image of a subspace L(D) ⊆ H¹. In the sufficient converse of Gee Lemma 3.17(3), a strict-conjugation-invariant radical ideal I ≠ m yields D(I), and the constructions are inverse on their stated domain. Radicality here is a hypothesis of that converse, not an axiom on every quotient-represented deformation problem. The general invariant-ideal correspondence of CHT Lemma 2.2.3 also covers nonradical invariant ideals; use it for local conditions with nilpotent structure.

Sources. Gee, Lemma 3.17, p. 14; CHT, Lemma 2.2.3, p. 19.

Prerequisites. Local deformation problems (Layer R04.3); The universal lifting ring (Layer R04.2); Tangent spaces of the lifting and deformation functors (Layer R04.1).

Target: global-deformation-type

### 3.3. Global deformation data and T-framed deformations

Take a number field F, S containing its p-adic and residual ramification places, continuous absolutely irreducible ρ̄ on G_{F,S}, a determinant lift χ, local problems D_v and T ⊆ S. Define a type-𝒮 T-framed deformation over A as a tuple (ρ,(α_v)_{v∈T}), with det ρ = χ_A, ρ|G_v ∈ D_v and α_v ∈ Γ̂ₙ(A), modulo (ρ,α_v) ↦ (βρβ⁻¹,βα_v). Its framed local representative is α_v⁻¹ρ|G_vα_v. This invariant representative, rather than an arbitrarily chosen global matrix lift, defines the local restriction map. Schur suffices for the representability mechanism; the arithmetic statement here uses absolute irreducibility.

API. Use the following interfaces in TauCeti.GaloisDeformation, together with extensionality and the coefficient-map identity/composition laws where relevant.

- DeformationType (structure): 𝒮 = (S, {D_v}_{v∈S}, χ).
- TFramedDef (constructor): T-framed deformations of type 𝒮 as a functor on C_𝒪.
- TFramedDef.localLift (projection): The well-defined framed local lift α_v^{-1}ρ|_{G_v}α_v for v ∈ T.
- TFramedDef.forgetFraming (functoriality): The map to unframed deformations of type 𝒮.

Unit tests. These are mathematical regression cases, including examples that reject an incorrect definition.

- tframed_empty_T: For T = ∅ the functor is unframed deformations of type 𝒮.
- tframed_residue: The functor is a point on 𝔽.
- tframed_localLift_invariant: localLift is constant on equivalence classes.

Sources. Gee, §3.20–3.21, p. 15; KW ESI, §4.1, p. 29.

Prerequisites. Local deformation problems (Layer R04.3); Restriction of lifts and deformations is well defined (Layer R04.1); Lifts and deformations with fixed determinant (Layer R04.1); Deformations up to strict equivalence (Layer R04.1).

Target: global-framed-ring

### 3.4. Representability of global deformations of type 𝒮

Prove that the T-framed type-𝒮 functor is represented on C_𝒪 by R^{□T}_𝒮, with its universal framed class. Use the local ideal conditions, fixed-determinant representability and Φₚ(G_{F,S}). For T = ∅ denote the ring by R^univ_𝒮. Identify the chosen representative and frame data whenever a matrix-valued universal object is used; the invariant universal framed class is independent of those choices.

Sources. Gee, Lemma 3.22, p. 15.

Prerequisites. Global deformation data and T-framed deformations (Layer R04.3); Deformation problems are invariant ideals of the lifting ring (Layer R04.3); The universal deformation ring (Layer R04.2); Fixed-determinant rings and change of determinant (Layer R04.2); Global and local Galois groups satisfy Φ_p (Layer R04.2); DeformationAndDerivedPatchingAlgebra R03.2.

Target: local-to-global-map

### 3.5. The map from local rings to the global framed ring

For each v ∈ T take the local framed determinant-χ ring and impose I(D_v). Form R^loc_{𝒮,T} = ⊗̂_{v∈T}(R^□_{ρ̄|G_v,χ}/I(D_v)) over 𝒪. The universal framed local representatives classify compatible maps from its factors to R^{□T}_𝒮, hence a tautological local-to-global 𝒪-algebra map. Check the characterizing restriction formula and compatibility with increasing T. The empty product is 𝒪. Local rings and their condition-specific quotients are the supplied local interfaces.

API. Use the following interfaces in TauCeti.GaloisDeformation, together with extensionality and the coefficient-map identity/composition laws where relevant.

- Rloc (constructor): R^loc_{S,T} as a completed tensor product.
- locToGlobal (constructor): R^loc_{S,T} →ₐ[𝒪] R^□T_𝒮.
- locToGlobal_apply (characterisation): It classifies the framed local lifts α_v^{-1}ρ^□T|_{G_v}α_v.
- locToGlobal_mono_T (compatibility): Compatible with enlarging T.

Unit tests. These are mathematical regression cases, including examples that reject an incorrect definition.

- rloc_empty: R^loc_{S,∅} = 𝒪.
- locToGlobal_forget: Forgetting framings kills the α_v data.
- rloc_wrong_restriction: Using ρ^□T|_{G_v} without α_v is not well defined on classes, so there is no map from the local ring.

Sources. Gee, §3.23, p. 15; KW ESI, §4.1, p. 29.

Prerequisites. Representability of global deformations of type 𝒮 (Layer R04.3); Deformation problems are invariant ideals of the lifting ring (Layer R04.3); Restriction of lifts and deformations is well defined (Layer R04.1); LocalGaloisDeformationRings R08.1; DeformationAndDerivedPatchingAlgebra R03.1.

Target: relative-tangent-space

### 3.6. The relative tangent space is an adjoint Selmer group

Identify the dual of m_{R^{□T}}/(m_{R^{□T}}², λ, m_{R^loc}R^{□T}) with H¹ of the framed mapping fibre supplied by ArithmeticGaloisDuality R02.5/D8. Its exact cochain specification and dimension formula are displayed below. Degree zero uses the full adjoint; positive global degrees use trace zero. Local degree zero consists only of full-adjoint framing terms at T. The dual group is an ordinary Selmer kernel with orthogonal conditions outside T; it is not the H¹ of a second framed complex. In the odd-characteristic dimension statement require p ∤ n, S finite, T ⊆ S containing all p-adic places, and Schur ρ̄. The nonempty-T constant is |T| − 1. With T empty, H⁰_rel = k and H¹_rel is ordinary fixed-determinant Selmer H¹, without extending that dimension formula past its hypotheses.

Write M = ad ρ̄ and M₀ = ad⁰ρ̄. Specify the supplied complexes in every degree:

| Degree | Global terms | Local terms |
| --- | --- | --- |
| 0 | C⁰(G,M) | ⊕_{v∈T} C⁰(G_v,M) |
| 1 | C¹(G,M₀) | ⊕_{v∈T} C¹(G_v,M₀) ⊕ ⊕_{v∈S∖T} C¹(G_v,M₀)/L̃_v |
| i ≥ 2 | Cⁱ(G,M₀) | ⊕_{v∈S} Cⁱ(G_v,M₀) |

All negative degrees vanish. Here L̃_v is the inverse image of L_v under
Z¹ → H¹, included in C¹. Since its elements are cocycles, its differential
vanishes, making the local quotient differential well defined. The degree-zero
commutator of a full matrix has trace zero. The restriction chain map therefore
lands in the displayed terms. Define C_relⁱ = C_globⁱ ⊕ C_loc^{i−1}, with

    d(φ,ψ) = (dφ, res φ − dψ).

This is Cone(res)[−1]. In particular its exact sequence begins with the full
adjoint scalar boundary H⁰(G,M) → ⊕_T H⁰(G_v,M). For nonempty T and Schur ρ̄
this map is injective, so H⁰_rel = 0. Set

    H¹_dual = ker(H¹(G,M₀ˇ(1)) → ⊕_{v∈S∖T} H¹(G_v,M₀ˇ(1))/L_v^⊥).

Under the dimension hypotheses, prove

    h¹_rel = |T| − 1 − Σ_{v|∞}h⁰(G_v,M₀)
             + Σ_{v∈S∖T}(dim L_v − h⁰(G_v,M₀))
             + dim H¹_dual − h⁰(G,M₀(1)).

The scalar boundary is visible even in rank one: with two framings its quotient
is k²/diag(k), of dimension one; one framing gives dimension zero; with no
framings all scalars remain in H⁰. These are required regression cases for the
complex and prevent changing full degree-zero adjoints to trace-zero ones.

Sources. Gee, Proposition 3.24(1), p. 18; KW ESI, §4.1, Lemma 4.3, p. 31; Gee, §3.23, p.16, displayed definitions of the global/local/relative complexes and differential; pp.17–18.

Prerequisites. Representability of global deformations of type 𝒮 (Layer R04.3); The map from local rings to the global framed ring (Layer R04.3); Tangent spaces of the lifting and deformation functors (Layer R04.1); ArithmeticGaloisDuality R02.5; ArithmeticGaloisDuality R02.4; ArithmeticGaloisDuality R02.6; SelmerIwasawaCohomology L2; ArithmeticGaloisDuality D8.

Target: local-to-global-presentation

### 3.7. Presentation of the global ring over the local rings

Choose g = dim_k H¹_rel relative tangent generators and construct a surjection R^loc_{𝒮,T}⟦x₁,…,x_g⟧ ↠ R^{□T}_𝒮 inducing the tangent isomorphism. For its kernel J and the source maximal ideal m, assume T = S or that every D_v outside T is liftable, and bound dim_k J/mJ by dim_k H²_rel. This extra hypothesis allows the required local lifts across each small extension; the tangent-generator surjection itself does not require liftability. In the duality setting of the preceding target this is the dimension of the ordinary dual Selmer group. The obstruction map and product formula come from ArithmeticGaloisDuality; the algebra turning tangent and obstruction spaces into a presentation comes from R03.2. For the rank-two dyadic version use Khare–Wintenberger's full-adjoint/dual conventions instead of applying the odd-p trace splitting.

Sources. KW ESI, §4.1, Lemma 4.5 and its proof, pp. 32–33; Gee, Proposition 3.24(2), p. 18; KW final, §4.2, Lemma 4.6, pp. 43–45; CHT, Corollary 2.2.12, p. 25.

Prerequisites. The relative tangent space is an adjoint Selmer group (Layer R04.3); The map from local rings to the global framed ring (Layer R04.3); ArithmeticGaloisDuality R02.4; ArithmeticGaloisDuality R02.6; DeformationAndDerivedPatchingAlgebra R03.2.

Target: global-dimension-lower-bound

### 3.8. Lower bound for the dimension of global deformation rings

With the odd-p finite-place convention of R04.3 and T = S, deduce

    dim R^univ_𝒮 ≥ 1 + Σ_{v∈S}(dim(R^□_{ρ̄|G_v,χ}/I(D_v)) − n²)
                       − Σ_{v|∞}h⁰(G_v,ad⁰ρ̄) − h⁰(G_{F,S},ad⁰ρ̄(1)).

Here p > 2 and p ∤ n as in the trace-zero presentation. Local Krull dimensions are supplied by LocalGaloisDeformationRings. In the Khare–Wintenberger rank-two totally real odd setting, include archimedean local rings in S. The local relative dimensions are 3 away from p and infinity, 3 + [F_v:ℚₚ] at p, and 2 at infinity, giving dim R̄^ψ_S ≥ 1. This is a lower bound; a characteristic-zero point also requires the finiteness used in its modularity consumer.

Sources. Gee, Proposition 3.24(3), p. 18; KW ESI, §4.1, Proposition 4.4, p. 32; KW final, §4.2, Proposition 4.5, p. 42; KW final, §4.2, Corollary 4.7, p. 45.

Prerequisites. Presentation of the global ring over the local rings (Layer R04.3); The relative tangent space is an adjoint Selmer group (Layer R04.3); Framed rings are power series over unframed rings (Layer R04.2); ArithmeticGaloisDuality R02.6; LocalGaloisDeformationRings R08.1.

## Layer R04.4: Restriction, twists and changes of problem

Build the functorial ring maps and their distinct algebraic properties. Restriction is finite under its hypothesis; imposing additional equations is a quotient. Twisting supplies formal group actions and, in the dyadic setting, a determinant fibre and its finite flat torsor.

Target: restriction-ring-map

### 4.1. Restriction to a finite extension as a ring map

For F′/F finite and S′ the places above S, restriction defines the contravariant local ring map R^□_{ρ̄|G_{F′,S′}} → R^□_ρ̄. Give fixed-determinant restriction as well. On unframed rings require absolute irreducibility after restriction. If each local problem over F′ contains the restrictions allowed by the corresponding problem over F, the map descends to their local-condition quotients. Verify that the map classifies the restricted universal lift and that compositions of restrictions give compositions of ring maps in the correct order.

API. Use the following interfaces in TauCeti.GaloisDeformation, together with extensionality and the coefficient-map identity/composition laws where relevant.

- resRing (constructor): The framed restriction map R^□_{ρ̄|H} → R^□_{ρ̄} for a continuous H → G.
- resRingUnframed (constructor): The unframed restriction map, for absolutely irreducible ρ̄|H.
- resRing_classifies (characterisation): resRing classifies the restriction of the universal lift.
- resRing_comp (compatibility): Restriction along a composite is the composite of the maps.

Unit tests. These are mathematical regression cases, including examples that reject an incorrect definition.

- resRing_id: Restriction along the identity is the identity map.
- resRing_comp_apply: For H′ → H → G, resRing_{H′→G} = resRing_{H→G} ∘ resRing_{H′→H}.
- resRing_not_flat: For p odd, let G = ℤ_p ⋊ {±1} with inversion action, H = ℤ_p, n = 1 and ρ̄ = 1. Then resRing is 𝒪⟦Y⟧ → 𝒪, Y ↦ 0, which is finite and not flat.

Sources. Gee, §3.25, p. 18; KW final, §10.1, proof of Theorem 10.1, p. 91.

Prerequisites. The universal lifting ring (Layer R04.2); The universal deformation ring (Layer R04.2); Restriction of lifts and deformations is well defined (Layer R04.1); Global deformation data and T-framed deformations (Layer R04.3).

Target: restriction-finiteness

### 4.2. Finiteness of restriction maps

Let Γ satisfy Φₚ, let Σ be open in Γ and assume ρ̄|Σ is absolutely irreducible. Prove that the unframed restriction map R^univ_{ρ̄|Σ} → R^univ_ρ̄ makes its target a finite module over its source. This applies to finite number-field extension restrictions. Use the trace generation theorem and the open-subgroup argument in BLGGT Lemma 1.2.3, specialized to GLₙ. Finiteness is the conclusion; no flatness or injectivity is built into it.

Sources. Gee, Proposition 3.26, p. 18; BLGGT, Lemma 1.2.3(1) and its proof, pp. 16–17.

Prerequisites. Restriction to a finite extension as a ring map (Layer R04.4); Carayol's theorem: absolutely irreducible deformations are determined by traces (Layer R04.2); The universal deformation ring (Layer R04.2).

Target: enlarging-ramification

### 4.3. Enlarging the ramification set gives closed immersions

If S ⊆ S′ and ρ̄ is unramified outside S, identify lifts on G_{F,S} with lifts on G_{F,S′} trivial on inertia at S′∖S. The induced maps R^□_{S′} ↠ R^□_S and, in the absolutely irreducible case, R_{S′} ↠ R_S are surjective. Their closed kernel is generated by all entries of ρ^univ(σ) − 1 at the newly added inertia groups. Include fixed-determinant and compatible local-condition versions. Use the correct duality: surjectivity of the ring map means injectivity of the represented functor's map, detectable on the tangent space for these complete local coefficient objects.

Sources. KW final, §2.1, p. 6; KW final, Proposition 5.11, p. 53.

Prerequisites. The universal lifting ring (Layer R04.2); The universal deformation ring (Layer R04.2); Tangent spaces of the lifting and deformation functors (Layer R04.1).

Target: change-of-determinant

### 4.4. Twisting isomorphisms and change of determinant

Twisting by any continuous 𝒪-valued unit character μ identifies the framed lifting rings for ρ̄ and μ̄⊗ρ̄, and the unframed rings when they exist. It sends determinant χ to μⁿχ and transports D_v to μ|G_v⊗D_v. A residually trivial μ with μⁿ = χ′χ⁻¹ gives an isomorphism between the corresponding fixed-determinant rings. For rank two and p odd there is a unique such square root in the residual identity component. For p = 2 a root need not exist; retain the obstruction. Khare–Wintenberger's remedy by solvable base change and Hecke characters is an application in GL2ModularityLifting, not an additional global class field theorem here.

Sources. KW final, Lemma 7.10 and its proof, p. 69; BLGGT, Lemma 1.2.3(2), p. 16.

Prerequisites. Fixed-determinant rings and change of determinant (Layer R04.2); Lifts and deformations with fixed determinant (Layer R04.1); Local deformation problems (Layer R04.3).

Target: diagonalizable-groups

### 4.5. Diagonalizable groups on complete local algebras

For a finitely generated abelian group a with p-primary torsion, define its formal diagonalizable group by D̂(a)(A) = Hom(a,1 + m_A). It is represented by the completion of 𝒪[a] at the special-fibre identity. The free lattice ℤᵗ gives T = Ĝ_mᵗ; a = (ℤ/pᵐ)ᵗ gives its pᵐ-torsion subgroup. Prove T[pᵐ] → T becomes an isomorphism on coefficients truncated modulo m_A^{m+1}. The binomial relation (1 + X)^{pᵐ} − 1 lies in (p,X)^{m+1}, hence in the corresponding maximal-ideal power over 𝒪. Explain why prime-to-p torsion contributes no points in the formal identity component.

API. Use the following interfaces in TauCeti.GaloisDeformation, together with extensionality and the coefficient-map identity/composition laws where relevant.

- DiagGroup (constructor): (a)* as a group functor on complete local 𝒪-algebras, with its representing algebra.
- DiagGroup.points (characterisation): (a)*(A) ≃ Hom(a, 1 + 𝔪_A).
- DiagGroup.torus (constructor): The formal torus Ĝ_m^t = (ℤ^t)*.
- DiagGroup.truncation_iso (compatibility): T_{p^m} → T is an isomorphism after truncation at level m + 1.

Unit tests. These are mathematical regression cases, including examples that reject an incorrect definition.

- diagGroup_int_points: (ℤ)*(A) = 1 + 𝔪_A.
- one_add_X_sq_sub_one_mem: (1 + X)² − 1 ∈ (2, X)² in ℤ[X], the case p = 2, m = 1 of the truncation isomorphism.
- diagGroup_prime_to_p_trivial: For a = ℤ/ℓ with ℓ ≠ p, Hom(a, 1 + 𝔪_A) is trivial for Artinian A (1 + 𝔪_A is a p-group), which is why torsion prime to p is excluded.

Sources. KW final, §2.5, p. 12; KW final, §2.6, Proposition 2.8 and its proof, p. 14.

Prerequisites. The universal lifting ring (Layer R04.2).

Target: free-action-quotient

### 4.6. Quotients by free actions

Let a representable formally smooth group functor G act freely on a complete local affine functor X = Sp A: the map (g,x) ↦ (x,gx) is a closed immersion. Show that the orbit functor is represented by the coaction invariants A^G, that X → Sp A^G is formally smooth and that X is a trivial G-torsor after choosing the local section. Its tangent space is the quotient t_X/t_G and dim A = dim A^G + dim G. For a possibly finite formal diagonalizable group, construct the invariant quotient and its torsor and show compatibility with quotienting the character group in stages. The finite locally free affine quotient is imported from ModularCurves 0C; completion, the smooth part and passage through the torsion/free filtration are the constructions here.

Sources. KW final, §2.4, p. 10; KW final, Proposition 2.5 and its proof, pp. 11–12; KW final, Proposition 2.6, pp. 12–13.

Prerequisites. Diagonalizable groups on complete local algebras (Layer R04.4); DeformationAndDerivedPatchingAlgebra R03.2; ModularCurves 0C.

Target: truncated-actions

### 4.7. Free actions assembled from truncated actions

For m ≥ 1, use coefficient rings with m_Aᵐ = 0 and truncate products and group axioms at that level. Construct compatible action chunks of a representable group on a system A_m, with the specified coefficient surjections and inverse limit A_∞. Prove a unique limiting action, and prove that it is free if each chunk is free. The finite-torus truncation isomorphisms give chunks of Ĝ_mᵗ from actions of its sufficiently deep p-power torsion. This is the passage used for the dyadic patched limit; no untruncated torus action on a finite-level fixed-determinant ring is inferred.

Sources. KW final, §2.6, Proposition 2.7 and its proof, pp. 13–14; KW final, proof of Proposition 9.3, pp. 86–87.

Prerequisites. Diagonalizable groups on complete local algebras (Layer R04.4); Quotients by free actions (Layer R04.4).

Target: determinant-fixed-on-S

### 4.8. Rings with determinant fixed only on S, and the determinant map

For the rank-two Khare–Wintenberger data, define R^□_{S∪V} to classify S-framed lifts with det ρ|D_v = ψχ_p|D_v for v ∈ S, and R^{□,ψ}_{S∪V} to impose that determinant globally. Both are algebras over the same local fixed-determinant tensor product at S. Base change to the local-condition quotient gives the barred rings. Define d(ρ) = det ρ/(ψχ_p), a character of G_V. The globally fixed-determinant subfunctor is d⁻¹(1), and d(χ⊗ρ) = χ²d(ρ). The unframed trace subrings have simultaneous framing extensions in 4|S| − 1 variables when S is nonempty.

API. Use the following interfaces in TauCeti.GaloisDeformation, together with extensionality and the coefficient-map identity/composition laws where relevant.

- RdetOnS (constructor): The framed ring with determinant fixed only at the places of S.
- detMap (constructor): d : Sp R^□_{S∪V} → G*_V.
- detMap_twist (compatibility): d(χ ⊗ ρ) = χ² d(ρ).
- fixedDet_eq_fiber (characterisation): Sp R^{□,ψ}_{S∪V} = d^{−1}(1).

Unit tests. These are mathematical regression cases, including examples that reject an incorrect definition.

- detMap_trivial_group: If G_V = 1, the two rings coincide.
- fixedDet_iff_detMap_one: A point lies in Sp R^{□,ψ} if and only if d of it is 1.
- twist_map_not_injective_p2: On coefficients admitting a nontrivial 2-torsion character η, the pairs (x,χ) and (η⊗x,ηχ) have the same twisted image. Test such an Artinian coefficient object; points over 𝒪 alone need not detect the entire finite group scheme.

Sources. KW final, §4.1.1, pp. 37–38; KW final, proof of Proposition 9.3, p. 86.

Prerequisites. Global deformation data and T-framed deformations (Layer R04.3); The map from local rings to the global framed ring (Layer R04.3); Diagonalizable groups on complete local algebras (Layer R04.4); Fixed-determinant rings and change of determinant (Layer R04.2).

Target: twisting-action

### 4.9. The action of twisting characters

In rank two, take disjoint sets S and V, with S containing p and infinity. Let G_V be the Galois group of the maximal abelian p-extension unramified outside V and split at S. Use class field correspondence and tame ray class finiteness to make G_V a finite abelian p-group. Its formal diagonalizable dual acts on the globally framed problem with determinant fixed on S by ρ ↦ χ⊗ρ, preserving the local data and frames at S. Obtain the induced ring automorphisms and their universal-representation formula, their commutation with changes of frame, and their descent to local-condition quotients and trace subrings. The determinant changes by χ²; at p = 2 only the subgroup dual to G_V/2G_V preserves the globally fixed determinant.

API. Use the following interfaces in TauCeti.GaloisDeformation, together with extensionality and the coefficient-map identity/composition laws where relevant.

- twistAction (constructor): The action of G*_V on the framed functor with determinant fixed on S.
- twistAut (constructor): a_χ for χ : G_V → 𝒪^× residually trivial.
- twistAut_univ (characterisation): a_χ ∘ ρ^univ = χ ⊗ ρ^univ.
- twistAction_comm_frame (compatibility): Twisting commutes with the frame action.
- twistAction_det (compatibility): det(χ ⊗ ρ) = χ² det ρ; for χ² = 1 the determinant is preserved.

Unit tests. These are mathematical regression cases, including examples that reject an incorrect definition.

- twistAction_one: The trivial character acts as the identity.
- twist_det: For 2 × 2 matrices, det(c • M) = c² det M.
- twist_not_fixed_det_odd: For p odd and χ ≠ 1, χ ⊗ − does not preserve the fixed-determinant locus, since χ² ≠ 1.

Sources. KW final, §5.1, p. 46; KW final, §5.1, p. 46.

Prerequisites. Diagonalizable groups on complete local algebras (Layer R04.4); Rings with determinant fixed only on S, and the determinant map (Layer R04.4); Global deformation data and T-framed deformations (Layer R04.3); Framed rings are power series over unframed rings (Layer R04.2); ClassFieldTheory Layer 12.

Target: twist-action-free

### 4.10. Freeness of dyadic twisting and its stabilisers

Assume p = 2 and nonsolvable residual rank-two image. Prove that a residually trivial character χ of G_V fixing a strict deformation class must be trivial, for every coefficient object. Apply the residual trace argument to every nonzero character direction. Conclude freeness on the determinant-on-S framed functor, on the globally fixed-determinant functor for its 2-torsion twisting subgroup, and on their unframed and local-condition versions. The nonsolvable-image hypothesis cannot be discarded: induced representations can have self-twists.

Sources. KW final, §5.2, Lemma 5.1 and its proof, pp. 46–47.

Prerequisites. The action of twisting characters (Layer R04.4); Quotients by free actions (Layer R04.4); Deformations up to strict equivalence (Layer R04.1).

Target: determinant-twist-torsor

### 4.11. The determinant torsor for dyadic twisting

Let the formal torus T = Ĝ_m^γ act freely on X′ = Sp R′ and let d : X′ → T satisfy d(λx) = λ²d(x). Set X = d⁻¹(1) = Sp R. Prove X′ → Sp (R′)^T is formally smooth of relative dimension γ and X → Sp (R′)^T is a torsor for T[2]. In the dyadic setting, squaring on a formal torus is finite flat of degree 2^γ, so R is finite flat of that degree over (R′)^T and dim R = dim (R′)^T = dim R′ − γ. Use the fibre-product description from Khare–Wintenberger Lemma 9.4. The torus assumption is part of the theorem: a finite diagonalizable group does not have the same squaring interface.

Sources. KW final, proof of Proposition 9.3, Lemma 9.4 and its proof, p. 87.

Prerequisites. Quotients by free actions (Layer R04.4); Rings with determinant fixed only on S, and the determinant map (Layer R04.4); Freeness of dyadic twisting and its stabilisers (Layer R04.4); Free actions assembled from truncated actions (Layer R04.4).

Target: inertia-rigid-deformations

### 4.12. Inertia-rigid deformation rings

Fix a profinite G with finite normal inertia subgroup I and G/I ≅ ℤ̂, a generator lift F, a residual rank-d representation and an 𝒪-valued lift ρ₀ of determinant φ. Form the affine scheme of pairs (ρ_I,f) satisfying the F-conjugation relation, determinant φ and the characteristic-polynomial equalities on every inertia element with ρ₀. Complete its p-torsion-free quotient at the residual point to obtain R^□_{φ,0,fl}. Show the point lies on the flat part, every irreducible component is faithfully flat over 𝒪 of absolute dimension d², and its generic fibre is regular. Its 𝒪′-points are precisely determinant-φ lifts whose inertia restriction is conjugate over the fraction field of 𝒪′ to that of ρ₀. Apply to finite inertial image away from p; use the excellence and completion theorems from R03.3.

Sources. KW final, §2.7, Proposition 2.10, p. 15; KW final, §2.7, Proposition 2.11, p. 16; KW ESI, §2.3, Propositions 2.6–2.7, pp. 9–11.

Prerequisites. The universal lifting ring (Layer R04.2); Lifts and deformations with fixed determinant (Layer R04.1); DeformationAndDerivedPatchingAlgebra R03.3.

## Layer R04.5: Taylor–Wiles auxiliary primes

Separate the local eigenline calculation, finite-image detecting elements, global cohomology vanishing and arithmetic prime selection. Odd and dyadic constructions use different adjoints and leave different numerical remainders. A shared conditional selection theorem handles finite avoidance, degree one and exact cardinality.

Target: taylor-wiles-datum

### 5.1. Taylor–Wiles data

In rank two, a level-N datum, N ≥ 1, comprises a finite Q disjoint from S and a selected eigenvalue α_v at each v ∈ Q. Require v ∤ p, norm(v) ≡ 1 mod pᴺ, unramified residual representation at v and two distinct residual Frobenius eigenvalues, in the chosen residue coefficient field. Set Δ_v to the maximal p-power quotient of k(v)ˣ and Δ_Q = ∏ Δ_v. The augmented problem permits unrestricted ramification at Q, with local tangent condition H¹ and dual condition zero. Construct the quotient Δ_Q/pᴺΔ_Q ≅ (ℤ/pᴺ)^{|Q|}. In the dyadic construction additionally impose the specified Kummer splitting condition. A congruence condition alone does not select an eigenline.

API. Use the following interfaces in TauCeti.GaloisDeformation, together with extensionality and the coefficient-map identity/composition laws where relevant.

- TaylorWilesDatum (structure): (Q, (α_v)_{v∈Q}) with N(v) ≡ 1 mod p^N and distinct Frobenius eigenvalues.
- TaylorWilesDatum.delta (constructor): Δ_Q = ∏_{v∈Q} (k(v)^×)_p.
- TaylorWilesDatum.deformationType (constructor): S_Q, with no condition at the places of Q.
- TaylorWilesDatum.delta_quotient (characterisation): Δ_Q/p^N ≅ (ℤ/p^N)^{#Q}.

Unit tests. These are mathematical regression cases, including examples that reject an incorrect definition.

- twDatum_empty: The empty set is a datum of every level.
- twDatum_split_iff: N(v) ≡ 1 mod p^N if and only if v splits completely in F(ζ_{p^N}) (for v ∤ p).
- twDatum_scalar_excluded: If ρ̄(Frob_v) is scalar, v is not a Taylor–Wiles place.

Sources. Gee, §5.6, p. 33; KW final, Lemma 5.3, p. 47.

Prerequisites. Global deformation data and T-framed deformations (Layer R04.3); LocalGaloisDeformationRings R08.2, taylor-wiles-local-ring.

Target: image-hypotheses

### 5.2. The residual image hypotheses used to choose primes

Keep three rank-two hypotheses separate: absolute irreducibility on G_{F(ζ_p)}; the strong SL₂(𝔽ₚ)-containment condition in Gee's p ≥ 5 argument, with p unramified in F; and nonsolvability for the dyadic Khare–Wintenberger argument. Their finite-image content, submodule calculations and detectors come from ArithmeticGaloisRepresentations R01.4. Enormous image and adequacy are different higher-rank conditions and are not substituted here. The odd-p cyclotomic hypothesis admits induced representations with a reducible adjoint, so its detector must work constituent by constituent. In particular the S₃ representation over 𝔽₅ from the splitting field of X³−2 over ℚ has a proper invariant sign line in ad⁰ despite residual absolute irreducibility. Its quadratic subfield is ℚ(√−3), so it is disjoint from ℚ(ζ₅) and remains absolutely irreducible on the cyclotomic subgroup.

API. Use the following interfaces in TauCeti.GaloisDeformation, together with extensionality and the coefficient-map identity/composition laws where relevant.

- IsCyclotomicAbsIrred (constructor): ρ̄|G_{F(ζ_p)} is absolutely irreducible.
- HasBigImage (constructor): ρ̄(G_F) ⊇ SL_2(𝔽_p).
- HasNonsolvableImage (constructor): ρ̄(G_F) is not solvable.

Unit tests. These are mathematical regression cases, including examples that reject an incorrect definition.

- sl2F4_not_solvable: SL_2(𝔽_4) ≅ A_5 is not solvable.
- dihedral_not_cyclotomic_irred: For odd p, assume K = F(√p*) is a proper quadratic subfield of F(ζ_p), and choose a character θ of G_K with θ ≠ θᶜ. Then Ind_{G_K}^{G_F} θ is absolutely irreducible but splits on G_{F(ζ_p)}, so it fails the cyclotomic irreducibility hypothesis.
- cyclotomic_irred_p2_trivial: For p = 2, (1) is plain absolute irreducibility, since F(ζ_2) = F.
- allowed_dihedral_adjoint_sign_line: Over 𝔽₅ the standard S₃ representation satisfies the KW cyclotomic hypothesis in the stated ℚ example, while k·J⊊ad⁰ is a nonzero invariant sign line; matrix calculations verify J≠0, trJ=0, conjugation and properness, and the residual matrix-span determinant −3.

Sources. KW final, §4, p. 37; Gee, Theorem 5.2, p. 29.

Prerequisites. ArithmeticGaloisRepresentations R01.4; Deformations up to strict equivalence (Layer R04.1).

Target: taylor-wiles-local-cohomology

### 5.3. Local cohomology at Taylor–Wiles places

At an odd-p rank-two Taylor–Wiles place with Frobenius diag(α,β), α ≠ β, prove h⁰(G_v,ad⁰(1)) = 1 and h¹(G_v,ad⁰) = 2 = 1 + h⁰(G_v,ad⁰). Identify unramified H¹(G_{k(v)},ad⁰(1)) with k by taking the α-eigenline component of the value of a cocycle at Frobenius. Its nonzero value detects the restriction of a dual Selmer class. Use local Tate duality and the Euler characteristic formula. These odd-p trace-zero dimensions are not used unchanged in characteristic two.

Sources. KW final, Lemma 5.4, p. 48; Gee, proof of Proposition 5.10, p. 39; KW final, Remark after Lemma 5.3, pp. 47–48.

Prerequisites. Taylor–Wiles data (Layer R04.5); ArithmeticGaloisDuality R02.4; Tangent spaces of the lifting and deformation functors (Layer R04.1).

Target: dyadic-linear-disjointness

### 5.4. Linear disjointness for dyadic auxiliary primes

Use p = 2, F totally real and nonsolvable residual image. Write M_n = ℚ(μ_{2ⁿ}), M_n⁺ = ℚ(x_n), x_n = (ε_n + ε_n⁻¹)/2 and y_n = (x_n+1)/2 = x_{n+1}². Let n₀ ≥ 2 be maximal with M_{n₀}⁺ ⊆ F, F_n = F(μ_{2ⁿ}), and F̃_n the Kummer extension over F_n from y_{n₀}. Prove the successive p-power radical degree lemma of KW 5.7, the degree-eight dihedral extension of 5.8 and the cyclic degree 2^{n−1} and quadratic subextension description of 5.9. The Kummer class is unramified outside S and has order divisible by 2^{n−1}. If K is cut out by ad ρ̄ and L is the splitting field over K of the image of H¹(G_{F,S},ad ρ̄), prove L(μ_{2ⁿ}) and F̃_n linearly disjoint over F_n for n > n₀. Track the polynomial recursion R_n(X) = R_{n−1}(2X²−1) to control ramification.

Sources. KW final, §5.5.1, Proposition 5.6 and Lemmas 5.7–5.9, pp. 48–50; KW final, Lemma 5.9, p. 50.

Prerequisites. The residual image hypotheses used to choose primes (Layer R04.5); ArithmeticGaloisRepresentations R01.4.

Target: dyadic-taylor-wiles-primes

### 5.5. Existence of Taylor–Wiles primes for p = 2

For totally real F, nonsolvable residual rank-two image and S containing infinity, 2-adic and ramified places, construct Q_n for every n > n₀ with the eight properties displayed below. This is the full-adjoint dyadic construction, not a claim that the odd-p dual Selmer group vanishes. Combine the Kummer disjointness, the dyadic cohomology inputs of R02.6, R01.4's adjoint submodules and H¹-vanishing, and Chebotarev. The numerical residue of dimension two is accounted for by the auxiliary twisting group and its quotient.

Use Ad = ad ρ̄, Z its scalar submodule and D_v the decomposition group. Establish:

1. |Q_n| = h¹(S,Ad) − 2, independent of n.
2. Every auxiliary place has norm congruent to 1 modulo 2ⁿ and two distinct residual Frobenius eigenvalues.
3. Each splits in F̃_n; h⁰(D_v,Ad) = 2 and h¹_{Q_n-split}(S,Ad) = 2.
4. h¹_{S-split}(Q_n,Ad) = 2 − Σ_{v∈S}h⁰(D_v,Ad) + 2|Q_n|.
5. R^□_{S∪Q_n}, with determinant imposed only on S, needs 2|Q_n| + 1 generators over the fixed-determinant local tensor ring.
6. G_n/2^{n−2}G_n ≅ (ℤ/2^{n−2})ᵗ for the auxiliary abelian p-extension group G_n.
7. t = 2 − |S| + |Q_n|.
8. (h¹_{S-split}(Q_n,Ad) − t) + (Σ_{v∈S}h⁰(D_v,Ad) − h⁰(G_F,Ad)) = |Q_n| + |S| − 1.

The required cohomology statements are KW 5.2(2)'s identification with
H¹(F_m/F,Z), of dimension two for m > n₀, and KW 4.3(5)'s finite-image H¹
vanishing and submodule list 0,Z,Ad⁰,Ad. Import the former from R02.6 and the
latter from R01.4. The full-adjoint/trace-kernel relationship in characteristic
two remains explicit throughout the calculation.

Sources. KW final, §5.5.2, Lemma 5.10 and its proof, pp. 50–53; KW final, Lemma 5.10(f)–(g), p. 51.

Prerequisites. Taylor–Wiles data (Layer R04.5); Linear disjointness for dyadic auxiliary primes (Layer R04.5); The residual image hypotheses used to choose primes (Layer R04.5); Rings with determinant fixed only on S, and the determinant map (Layer R04.4); The action of twisting characters (Layer R04.4); ArithmeticGaloisDuality R02.6; ArithmeticGaloisDuality R02.5; Chebotarev Layer 10; Chebotarev 11.3(2).

Target: taylor-wiles-inertia-action

### 5.6. Inertia at Taylor–Wiles places and the Δ_Q-module structure

Use the selected α_v to diagonalize the universal local lift at each v ∈ Q_N into two characters. For globally fixed unramified determinant their inertia characters are inverse and the selected one factors through Δ_v. Construct the 𝒪[Δ_Q]-algebra structure on both framed and trace rings. Quotienting by the augmentation ideal recovers the base problem without Q. In the dyadic case, for the fixed-determinant twisting automorphism a_χ and diamond element δ, prove a_χ∘δ = χ(δ)·(δ∘a_χ). The local diagonalization and its presenting ring come from LocalGaloisDeformationRings R08.2; the global augmentation statement uses the inertia quotient of R04.4.

Sources. KW final, §5.6, Proposition 5.11 and Lemma 5.12, p. 53; KW final, Lemma 5.12, p. 53.

Prerequisites. Taylor–Wiles data (Layer R04.5); LocalGaloisDeformationRings R08.2, taylor-wiles-local-ring; Enlarging the ramification set gives closed immersions (Layer R04.4); The action of twisting characters (Layer R04.4).

Target: chebotarev-selmer-selection

### 5.7. Shared Chebotarev selection for Selmer detection

Let H be a finite-dimensional k-space of continuous global cohomology classes, with linear localization maps loc_v at admissible unramified places. Suppose each nonzero class admits a detecting conjugacy class in a finite Galois quotient: every prime in that class, outside a specified finite exceptional set, is admissible and has nonzero localization. Also require a nonempty admissible conjugacy class for padding, even when H = 0. Given a finite avoidance set B and q ≥ dim H, choose exactly q distinct admissible primes outside B with injective joint localization. They can all have residue degree one over ℚ. Congruences and ordered eigenvalues must be encoded compatibly in the finite quotient. Use Chebotarev Layer 10 and its higher-degree discard estimate 11.3(2); induct on the dimension of the current joint kernel, then pad. Each application supplies conjugacy invariance, coboundary independence, detection and the interpretation as the new dual Selmer kernel. Include ramified primes of auxiliary fields in B.

Sources. ACC published, Lemma 6.2.32, proof, printed pp. 1045–1046 (physical PDF pp. 149–150).

Prerequisites. ArithmeticGaloisDuality R02.6; Chebotarev Layer 10; Chebotarev 11.3(2).

Target: odd-taylor-wiles-primes

### 5.8. Existence of Taylor–Wiles primes for odd p

For p > 2 use either the Khare–Wintenberger hypotheses (F totally real and unramified at p, totally odd ρ̄ with cyclotomic absolute irreducibility, and the §4 local splitting convention when its p-adic restriction is irreducible) or Gee's stronger p ≥ 5 SL₂-image hypotheses in his totally real odd modularity setting. For every N ≥ 1 construct a level-N datum Q_N of constant size killing the dual Selmer group with orthogonal conditions at S and zero at Q_N. In the Khare–Wintenberger convention its size is h¹_{L^⊥}(S,(ad⁰)ˇ(1)); in Gee's convention take r = max(h¹(G_{F,T},ad⁰(1)),1 + [F:ℚ] − |T|). Import the exact inflation-restriction vanishing from R02.6 and the source-specific residual detector from R01.4, then apply the shared selection theorem. At p = 3 use the Khare–Wintenberger Lemmas 5.2(1) and 5.3 input; Taylor's proof assuming l > 3 is not a justification at p = 3. Whole-adjoint irreducibility is used only under the strong image hypothesis that supplies it.

Sources. KW final, Lemma 5.3 and its proof, pp. 47–48; Lemma 5.2(1), p. 47; Gee, Proposition 5.10 and its proof, pp. 38–39; Taylor, Lemma2.5 and proof, printed pp.749–750, physical PDF pp.21–22.

Prerequisites. Taylor–Wiles data (Layer R04.5); Local cohomology at Taylor–Wiles places (Layer R04.5); The residual image hypotheses used to choose primes (Layer R04.5); ArithmeticGaloisDuality R02.6; Shared Chebotarev selection for Selmer detection (Layer R04.5); ArithmeticGaloisRepresentations R01.4.

Target: taylor-wiles-generator-count

### 5.9. Generator counts at Taylor–Wiles levels

Apply the relative tangent formula after dual Selmer vanishing. In the Khare–Wintenberger convention, with infinity in S and framing at every S-place, R^{□,ψ}_{S∪Q_N} has |Q_N| + |S| − 1 generators over R^{□,loc,ψ}_S. In Gee's finite-place convention, framing at T gives |T| − 1 − [F:ℚ] + r generators over R^loc. Each count is independent of N. Use the correct local ring and archimedean convention in each application rather than identifying these two numbers by notation.

Sources. KW final, Proposition 5.5, p. 48; Gee, Proposition 5.10, last bullet, p. 38.

Prerequisites. Existence of Taylor–Wiles primes for odd p (Layer R04.5); The relative tangent space is an adjoint Selmer group (Layer R04.3); Presentation of the global ring over the local rings (Layer R04.3); ArithmeticGaloisDuality R02.5.

## Layer R04.6: Finite-level deformation data for patching

Package the actual local-condition rings, trace representations, diamond actions and uniform presentations into systems. The numerical comparisons specify the deformation side of patching, without assuming arithmetic modules or support theorems.

Target: kw-deformation-data

### 6.1. The global deformation data of KW II §9

For the rank-two totally real lifting data of KW §8–9, construct the finite set S = Σ ∪ {v|p} ∪ {v|∞}, determinant ψχ_p and the prescribed local-condition rings. Away from p and infinity use the semistable condition with fixed unramified γ_v; at infinity use odd lifts; at p use the appropriate case (A) low-weight crystalline, (B) weight two in the stated odd-p weight range, or (C) weight-two semistable. Import the case-specific statements from R08.6: each local ring is a flat domain with regular generic fibre, of relative dimension 3, 3+[F_v:ℚₚ], or 2 respectively. Their completed tensor product B is a flat domain of relative dimension 3|S| with regular generic fibre. Base change the unrestricted global framed ring to B. In Gee's variant retain the two local systems, their equality modulo λ and the asserted irreducibility of the reduced local ring; it is not automatic for all local conditions.

API. Use the following interfaces in TauCeti.GaloisDeformation, together with extensionality and the coefficient-map identity/composition laws where relevant.

- KWDeformationData (structure): S, ψ and the local conditions at v ∈ S of KW II §9.1.1.
- KWDeformationData.localRing (constructor): R̄^{□,loc,ψ}_S = ⊗̂_v R̄^{□,ψ}_v.
- KWDeformationData.localRing_isDomain (characterisation): R̄^{□,loc,ψ}_S is a flat domain with regular generic fibre.
- KWDeformationData.localRing_relDim (characterisation): Relative dimension 3|S|.

Unit tests. These are mathematical regression cases, including examples that reject an incorrect definition.

- relDim_Q: F = ℚ, S = {∞, p}: relative dimension 6.
- relDim_formula: 3|S_f| + [F : ℚ] + 2[F : ℚ] = 3|S| for totally real F.
- not_finite_claim: A nonzero framed ring R̄^{□,ψ}_S is never finite over 𝒪 when |S| ≥ 1: it is a power series ring over R̄^ψ_S in 4|S| − 1 ≥ 3 variables.

Sources. KW final, §9.1.1, pp. 78–79; KW final, §9.1.1, p. 79.

Prerequisites. Global deformation data and T-framed deformations (Layer R04.3); The map from local rings to the global framed ring (Layer R04.3); LocalGaloisDeformationRings R08.1, archimedean-odd-ring-p2; LocalGaloisDeformationRings R08.1, archimedean-rings-p-odd; LocalGaloisDeformationRings R08.2, steinberg-condition; LocalGaloisDeformationRings R08.6; DeformationAndDerivedPatchingAlgebra R03.3.

Target: trace-subring-universal-representation

### 6.2. The unframed ring as a trace subring, with its universal representation

Inside the condition-specific framed ring define R̄^ψ_S as the closed 𝒪-subring generated by universal traces. Show that it is the image of the unframed ring and that the framed ring is a power-series extension in j = 4|S| − 1 variables when S is nonempty. Carayol descends the universal representation to this trace ring; the simultaneous-frame torsor gives the power-series coordinates. Repeat with Q_n added while keeping the framing set S. The frame variables are extra directions and are not generated by traces.

API. Use the following interfaces in TauCeti.GaloisDeformation, together with extensionality and the coefficient-map identity/composition laws where relevant.

- KWDeformationData.unframedRing (constructor): R̄^ψ_S as the trace subring of R̄^{□,ψ}_S.
- KWDeformationData.univRep (constructor): ρ̄^univ_S : G_{F,S} → GL_2(R̄^ψ_S).
- KWDeformationData.framed_powerSeries (equivalence): R̄^{□,ψ}_S ≃ R̄^ψ_S⟦y_1, …, y_{4|S|−1}⟧.

Unit tests. These are mathematical regression cases, including examples that reject an incorrect definition.

- framingVars_one_place: |S| = 1 gives 3 framing variables.
- trace_subring_eq_image: The trace subring equals the image of the unframed ring.
- framed_not_trace_generated: R̄^{□,ψ}_S is not generated by traces when |S| ≥ 1: the framing variables are not traces.

Sources. KW final, §4.1.2, Proposition 4.1, p. 38; KW final, §9.1.1, p. 80.

Prerequisites. The global deformation data of KW II §9 (Layer R04.6); Framed rings are power series over unframed rings (Layer R04.2); Carayol's theorem: absolutely irreducible deformations are determined by traces (Layer R04.2).

Target: factorization-through-local-conditions

### 6.3. Representations satisfying the local conditions factor through the quotient

Let A be reduced, 𝒪-flat and finite over 𝒪, and let ρ be a rank-two lift of determinant ψχ_p. Assume every specialization A → 𝒪′ to the integers in a finite coefficient extension satisfies each prescribed local condition at S. The classifying map R^ψ_S → A then factors uniquely through R̄^ψ_S; give the framed factorization as well. The reduced flat local quotients are characterized by their 𝒪′-points, so the specializations detect their defining equations. With Q_n added, check compatibility with diamond structures and, for p = 2, twists. The construction of the Hecke algebra and its Galois representation is a consumer's separate input.

Sources. KW final, Lemma 9.1 and its proof, pp. 80–81; KW final, Definition 2.4, p. 10.

Prerequisites. The unframed ring as a trace subring, with its universal representation (Layer R04.6); The global deformation data of KW II §9 (Layer R04.6); Inertia at Taylor–Wiles places and the Δ_Q-module structure (Layer R04.5); The action of twisting characters (Layer R04.4).

Target: taylor-wiles-deformation-system

### 6.4. The Taylor–Wiles system of deformation rings

For p odd write B for the condition-specific local tensor ring, d = 3|S|, h for the original dual Selmer dimension and j = 4|S| − 1. Choose the constant-cardinality data Q_n and generators δ_i of their h diamond factors. Construct compatible surjections B⟦x₁,…,x_{h+j−d}⟧ ↠ R̄^{□,ψ}_{S∪Q_n} ↠ R̄^{□,ψ}_S. Make the intermediate ring an 𝒪⟦y₁,…,y_{h+j}⟧-algebra: the first h variables map to δ_i−1, the remaining j are frame coordinates. Killing the first h recovers the base framed ring; killing all recovers R̄^ψ_S. The completed diamond-group algebra relations are (1+y_i)^{|Δ_{v_i}|}−1 and lie in the ideal generated by (1+y_i)^{pⁿ}−1. This finite-level ring system is the export; its modules and patched limit belong to the modularity and patching roadmaps.

API. Use the following interfaces in TauCeti.GaloisDeformation, together with extensionality and the coefficient-map identity/composition laws where relevant.

- TWSystem (structure): For each n, R̄^{□,ψ}_{S∪Q_n} with its B⟦x⟧-presentation and 𝒪⟦y⟧-algebra structure.
- TWSystem.quot_y_eq (characterisation): R̄^{□,ψ}_{S∪Q_n}/(y_1, …, y_h) ≅ R̄^{□,ψ}_S.
- TWSystem.quot_all_eq (characterisation): R̄^{□,ψ}_{S∪Q_n}/(y_1, …, y_{h+j}) ≅ R̄^ψ_S.
- TWSystem.numVars_const (compatibility): The number h + j − d of x-variables is independent of n.

Unit tests. These are mathematical regression cases, including examples that reject an incorrect definition.

- twSystem_h_zero: h = 0: the system is constant.
- twSystem_specialisation: Killing y_1, …, y_h recovers R̄^{□,ψ}_S.
- twSystem_not_p2: The odd-p construction does not extend by substituting p = 2: in the nonsolvable dyadic setting, distinct-eigenvalue Frobenius elements fail to detect the Ad⁰/Z constituent. Use the determinant-on-S rings and the counts in dyadic-patching-data, rather than assert that every characteristic-two dual Selmer group is nonzero.

Sources. KW final, proof of Proposition 9.2, (∗∗), p. 82; Gee, after Proposition 5.10, p. 39.

Prerequisites. The global deformation data of KW II §9 (Layer R04.6); The unframed ring as a trace subring, with its universal representation (Layer R04.6); Existence of Taylor–Wiles primes for odd p (Layer R04.5); Generator counts at Taylor–Wiles levels (Layer R04.5); Inertia at Taylor–Wiles places and the Δ_Q-module structure (Layer R04.5); Enlarging the ramification set gives closed immersions (Layer R04.4).

Target: patching-numerology

### 6.5. The numerical coincidence for patching

Prove the integral identities with dim B = 1+d. For p odd, 1+d+(h+j−d) = 1+h+j, matching the dimension of 𝒪⟦y₁,…,y_{h+j}⟧. In the dyadic construction t = 2−|S|+h and the source has h+j+t−d = 2h+1 generators and dimension 1+h+j+t. In Gee's framing convention the corresponding two source dimensions both equal 4|T|+r. These comparisons use the specific local-ring dimensions and the chosen framing variables, not a generic assertion that every global deformation ring has that dimension.

Sources. KW final, proof of Proposition 9.2, (II), p. 83; KW final, proof of Proposition 9.3, p. 86; Gee, §5.6, p. 40.

Prerequisites. The global deformation data of KW II §9 (Layer R04.6); The Taylor–Wiles system of deformation rings (Layer R04.6); Existence of Taylor–Wiles primes for p = 2 (Layer R04.5).

Target: dyadic-patching-data

### 6.6. The finite-level data for 2-adic patching

At p = 2 let h = |Q_n|, t = 2−|S|+h and G_n the auxiliary abelian group. Choose an identification G′_n = G_n/2^{n−2}G_n ≅ (ℤ/2^{n−2})ᵗ and a compatible surjection ℤᵗ ↠ G_n. Its dual embeds G_n* in T = Ĝ_mᵗ and identifies (G′_n)* with T[2^{n−2}]. Construct the pair R′_n = R̄^□_{S∪Q_n}, with determinant imposed only on S, and R_n = R̄^{□,ψ}_{S∪Q_n}. Retain the determinant character into G_n*, its fibre-one equation, its square-equivariance, the free twisting action, the B-presentation in h+j+t−d variables and compatibility with diamond elements. The compatible lattice presentation puts the determinant map into T, while the chosen quotient supplies the torsion subgroup used for action chunks. Using levels n+a with a ≥ 2 gives chunks compatible with the required truncations. These are the finite-level inputs to the dyadic patching argument.

API. Use the following interfaces in TauCeti.GaloisDeformation, together with extensionality and the coefficient-map identity/composition laws where relevant.

- DyadicPatchingDatum (structure): (R′_n, R_n, ℤ^t ↠ G_n compatible with G′_n, d_n, twisting action, presentation) at level n.
- DyadicPatchingDatum.fiber_eq (characterisation): Sp R_n = d_n^{−1}(1).
- DyadicPatchingDatum.d_sq (compatibility): d_n(λρ) = λ²d_n(ρ).
- DyadicPatchingDatum.action_free (characterisation): The twisting action is free.

Unit tests. These are mathematical regression cases, including examples that reject an incorrect definition.

- dyadic_t_zero: t = 0: T is trivial and R′_n = R_n.
- dyadic_d_sq: d_n(λρ) = λ²d_n(ρ).
- dyadic_not_fixed_det: The fixed-determinant rings R_n alone carry only the 2-torsion G*_{n,2}-action, not a torus action.

Sources. KW final, §9.1.3, Proposition 9.3 (I)(3), p. 84; KW final, proof of Proposition 9.3, pp. 84–87.

Prerequisites. Existence of Taylor–Wiles primes for p = 2 (Layer R04.5); Rings with determinant fixed only on S, and the determinant map (Layer R04.4); Freeness of dyadic twisting and its stabilisers (Layer R04.4); Diagonalizable groups on complete local algebras (Layer R04.4); Inertia at Taylor–Wiles places and the Δ_Q-module structure (Layer R04.5); The global deformation data of KW II §9 (Layer R04.6).

## Layer G8: Variable-determinant global problems

Use the full adjoint and local coefficient rings Λ_v. This layer supplies the nonpolarized global rings for ACC and their fixed-determinant quotients. It precedes the arbitrary-rank Taylor–Wiles applications in G7.

Target: variable-determinant-problem

### 7.1. Global deformation problems with variable determinant

In the ACC setting, assume F a number field, continuous absolutely irreducible rank-n ρ̄, p ∤ 2n, and a coefficient field containing the images of all embeddings of F. Choose finite S containing p and residual ramification; for each v take Λ_v ∈ CNL_𝒪 and a strict-conjugation-stable quotient-represented local lifting subfunctor D_v on CNL_{Λ_v}. Put Λ = ⊗̂_{v∈S}Λ_v and 𝒮 = (ρ̄,S,(Λ_v),(D_v)). A global lift over CNL_Λ is unramified outside S and belongs locally to D_v; no determinant equation is imposed. Define strict classes and T-framed classes by the same simultaneous action as R04.3. The local quotient and strict stability are part of the local-problem data, with coefficient and residue compatibility retained.

API. Use the following interfaces in TauCeti.GaloisDeformation, together with extensionality and the coefficient-map identity/composition laws where relevant.

- GlobalDeformationProblem (structure): (ρ̄, S, {Λ_v}, {D_v}) with D_v strict-conjugation-stable quotient-represented subfunctors.
- GlobalDeformationProblem.IsOfType (constructor): ρ is unramified outside S and ρ|G_{F_v} ∈ D_v(A) for all v ∈ S.
- GlobalDeformationProblem.framedDef (constructor): The functor D^T_𝒮 of T-framed deformations of type 𝒮 on CNL_Λ.

Unit tests. These are mathematical regression cases, including examples that reject an incorrect definition.

- problem_unrestricted: Among lifts already factoring through G_{F,S}, unrestricted D_v impose no further condition; they do not remove the unramified-outside-S requirement.
- isOfType_strictEquiv: Type 𝒮 is preserved by strict equivalence.
- fixed_matrix_not_problem: For the 𝔽₃[ε] example in defProblem_not_conj_stable, the prescription ρ(σ) = diag(1,−1) fails strict-conjugation-stability. Prescribing a central matrix such as 1 does not give this counterexample.

Sources. ACC arXiv v2, §6.2.1, Definition 6.2.2, p. 136.

Prerequisites. Local deformation problems (Layer R04.3); Deformation problems are invariant ideals of the lifting ring (Layer R04.3); The lifting (framed deformation) functor (Layer R04.1); Deformations up to strict equivalence (Layer R04.1); LocalGaloisDeformationRings R08.1, local-lifting-ring.

Target: variable-determinant-representability

### 7.2. Representability and framing

Represent both the unframed and T-framed type-𝒮 functors by R_𝒮 and R^T_𝒮 in CNL_Λ. If T is nonempty and v₀ ∈ T, choose a universal representative and normalize one frame entry. Obtain R^T_𝒮 ≅ R_𝒮 ⊗̂_𝒪 (𝒪⟦X_{v,i,j}⟧/(X_{v₀,1,1})), formally smooth over R_𝒮 with n²|T|−1 frame variables. The universal frame tuple is represented by 1+(X_{v,i,j}). For T empty use R_𝒮 directly. Keep the full adjoint and the residual absolute-irreducibility hypothesis of the ACC coefficient setting.

Sources. ACC arXiv v2, Theorem 6.2.3 and Lemma 6.2.4, p. 137.

Prerequisites. Global deformation problems with variable determinant (Layer G8); The universal lifting ring (Layer R04.2); Global and local Galois groups satisfy Φ_p (Layer R04.2); The universal deformation ring (Layer R04.2); Framed rings are power series over unframed rings (Layer R04.2); Strict and full conjugacy agree for Schur residual representations (Layer R04.1); Deformation problems are invariant ideals of the lifting ring (Layer R04.3).

Target: variable-determinant-presentation

### 7.3. Presentation over the local rings

For nonempty T ⊆ S, require Λ_v = 𝒪 outside T and set R^{T,loc}_𝒮 = ⊗̂_{v∈T}R_v. Let L¹_v be the tangent subspace inside Z¹(F_v,ad ρ̄), and L_v its image in H¹. The full-adjoint framed complex specified below identifies the relative tangent space. Construct a local Λ-algebra surjection R^{T,loc}_𝒮⟦X₁,…,X_g⟧ ↠ R^T_𝒮 with g = h¹_{𝒮,T}(ad ρ̄), and establish the displayed dual-Selmer/Euler formula using ArithmeticGaloisDuality D8. Its orthogonal conditions apply at S∖T. Scalar directions remain in this variable-determinant complex.

The global full-adjoint complex has degree zero C⁰(G,ad), degree one
C¹(G,ad) ⊕ ⊕_T C⁰(G_v,ad), degree two
C²(G,ad) ⊕ ⊕_T C¹(G_v,ad) ⊕ ⊕_{S∖T} C¹(G_v,ad)/L¹_v,
and the analogous mapping-fibre terms in higher degrees. Use the same shifted
mapping-fibre sign convention as R04.3. For the ordinary dual kernel, impose
L_v^⊥ only outside T. The generator formula is

    g = h¹_{𝒮^⊥,T}(ad ρ̄(1)) − h⁰(G,ad ρ̄(1))
        − Σ_{v|∞}h⁰(G_v,ad ρ̄)
        + Σ_{v∈S∖T}(dim L_v − h⁰(G_v,ad ρ̄)).

The full-adjoint trace pairing identifies the dual with ad(1). It introduces
no trace-zero hypothesis and no borrowed |T|−1 correction from the different
fixed-determinant complex.

Sources. ACC arXiv v2, §6.2.22 and Proposition 6.2.24 with its proof, pp. 143–146.

Prerequisites. Representability and framing (Layer G8); The relative tangent space is an adjoint Selmer group (Layer R04.3); ArithmeticGaloisDuality R02.4; ArithmeticGaloisDuality D8.

Target: fixed-versus-variable-determinant

### 7.4. Fixed against variable determinant

When all Λ_v = 𝒪, intersect each local D_v with determinant χ, obtaining the fixed-determinant problem 𝒮_χ. Always construct the quotient R_𝒮 ↠ R_{𝒮_χ} defined by det ρ_𝒮(g)−χ(g), and its T-framed version. If p ∤ n and every D_v is stable under all residually trivial local character twists, unique n-th roots split the functor as fixed determinant times the trivial-character functor, yielding R_𝒮 ≅ R_{𝒮_χ} ⊗̂_𝒪 𝒪⟦G_{F,S}^{ab,(p)}⟧. This extension is formally smooth of relative dimension rank_{ℤₚ}G_{F,S}^{ab,(p)} exactly when that finitely generated pro-p abelian group is torsion free. Fixed Hodge–Tate or inertial data can violate twist stability; for such problems retain the quotient statement rather than the product conclusion.

Sources. ACC arXiv v2, §6.1–6.2 opening, pp. 135–136.

Prerequisites. Representability and framing (Layer G8); Fixed-determinant rings and change of determinant (Layer R04.2); Lifts and deformations with fixed determinant (Layer R04.1); Global deformation data and T-framed deformations (Layer R04.3).

## Layer G7: Polarized problems and arbitrary-rank Taylor–Wiles data

The polarized fixed-multiplier branch uses the pairing dictionary and its trivial strict centralizer. The ACC auxiliary-prime branch instead uses G8’s variable-determinant problem and enormous cyclotomic image. Each has its own tangent and generator formula.

Target: polarized-deformation-problem

### 8.1. Polarized deformation problems

Use ArithmeticGaloisRepresentations G7's group 𝒢ₙ = (GLₙ×GL₁)⋊{1,j}, with j(g,μ)j⁻¹ = (μ·ᵗg⁻¹,μ) and multiplier ν(j)=−1. In the CM setting F/F⁺, take odd p, finite S of split finite places containing p, and a chosen lift ṽ over each v. Fix r̄ : G_{F⁺,S} → 𝒢ₙ(k) whose connected-component preimage is G_{F,S}, and a lift χ of νr̄. A polarized lift is a continuous lift r with νr = χ. Quotient by strict GLₙ conjugation, and add T-frames using simultaneous left multiplication. A type adds the GLₙ local problems at ṽ. Import the exact pairing dictionary: for γ₀ outside G_F, triples (ρ,χ,⟨ , ⟩) have a perfect pairing with ⟨x,ρ(γ₀²)y⟩ = −χ(γ₀)⟨y,x⟩ and χ(δ)⟨x,y⟩ = ⟨ρ(δ)x,ρ(γ₀δγ₀⁻¹)y⟩. This is an actual polarization, not merely an isomorphism label without its pairing and signs. Use the supplier's CHT Schur condition; absolute irreducibility on G_F suffices.

API. Use the following interfaces in TauCeti.GaloisDeformation, together with extensionality and the coefficient-map identity/composition laws where relevant.

- GroupGn (constructor): Use the group and multiplier from ArithmeticGaloisRepresentations G7; expose that existing interface to polarized deformation constructions.
- PolarizedDeformationProblem (structure): (F/F⁺, S, S̃, 𝒪, r̄, χ, {D_v}).
- polarizedLift_equiv_triple (equivalence): 𝒢_n-valued lifts ≃ triples (ρ, μ, ⟨ , ⟩) (CHT Lemma 2.1.1).

Unit tests. These are mathematical regression cases, including examples that reject an incorrect definition.

- polarized_rank_one: n = 1: conjugate-self-dual characters.
- polarizedLift_triple_bijective: The correspondence with triples is bijective.
- polarized_not_schur: Take a reducible polarized residual representation with distinct constituent lines exchanged by the duality. Its nontrivial diagonal infinitesimal centralizer violates the CHT Schur condition. Reducibility by itself is not the test: some reducible polarized representations are Schur.

Sources. CHT, §2.1, Lemma 2.1.1, p. 7; Definitions 2.2.1 and 2.2.7, pp. 17 and 21; §2.3, p. 26.

Prerequisites. Local deformation problems (Layer R04.3); Change of coefficient ring and residue field (Layer R04.1); ArithmeticGaloisRepresentations G7.

Target: polarized-representability

### 8.2. Representability of polarized problems

For Schur r̄, represent T-framed polarized type-𝒮 deformations by R^{□T}_𝒮. Construct the local tensor map and identify its relative cotangent dual with H¹_{𝒮,T}(G_{F⁺,S},ad r̄). A universal representative gives R^{□T}_𝒮 ≅ R^univ_𝒮⟦X_{v,i,j}⟧ in n²|T| variables. Here the fixed-multiplier polarized strict centralizer is trivial at odd p, so there is no scalar frame variable to remove. The adjoint is Mₙ(k) with (g,μ) acting by conjugation and j acting by negative transpose; do not reuse the GLₙ scalar-centralizer count.

Sources. CHT, Proposition 2.2.9 and its proof, pp. 22–24.

Prerequisites. Polarized deformation problems (Layer G7); The universal lifting ring (Layer R04.2); Global and local Galois groups satisfy Φ_p (Layer R04.2); Deformation problems are invariant ideals of the lifting ring (Layer R04.3).

Target: polarized-tangent-obstruction

### 8.3. Tangent and obstruction spaces of polarized problems

For Schur polarized data, a small extension with kernel I has its obstruction in H²_{𝒮,T}(G_{F⁺,S},ad r̄)⊗_k I. Prove the long exact sequence and the supplied arithmetic comparisons: Hⁱ_rel vanishes above degree 3; H⁰_rel is global H⁰ when T is empty and zero otherwise; h³_rel = h⁰(ad r̄(1)); h²_rel is the ordinary dual Selmer dimension. With χ(c_v) = ±1, the Euler characteristic (Σ(−1)ⁱhⁱ) is Σ_{v|∞} n(n+χ(c_v))/2 + Σ_{v∈S∖T}(h⁰(G_{F_ṽ},ad r̄)−dim L_v). The global Euler formula uses the CM prime-to-p descent from D7, including ramification outside the split S. If p ∤ n, split the adjoint as its trace kernel and a scalar line with j acting by −1; if p | n this splitting fails and the full adjoint must be retained.

Sources. CHT, Lemmas 2.2.8, 2.2.11, 2.1.3, 2.3.3 and 2.3.4, pp. 8–32.

Prerequisites. Representability of polarized problems (Layer G7); ArithmeticGaloisDuality D7; ArithmeticGaloisDuality D8; ArithmeticGaloisDuality R02.4.

Target: polarized-presentation

### 8.4. Presentations of polarized deformation rings

Use the previous tangent and duality comparisons to present R^{□T}_𝒮 over its local tensor ring in the nonnegative number

    g = h¹_{L^⊥,T}(ad r̄(1)) − h⁰(ad r̄(1))
        + Σ_{v∈S∖T}(dim L_v − h⁰(G_{F_ṽ},ad r̄))
        − Σ_{v|∞}n(n+χ(c_v))/2

of variables. If the problems outside T are liftable, at most h¹_{L^⊥,T}(ad r̄(1)) relations are needed. Deduce the Krull dimension bound displayed below from the condition-specific local dimensions. Use LocalGaloisDeformationRings L7 for the rank-n p-adic problems and R08.2 away from p, carrying their actual tangent dimensions and liftability. A torsion-free quotient and a reduced generic fibre have their own roles in component arguments; they are not substituted for the representing ring in this theorem.

The resulting dimension bound is

    dim R^{□T}_𝒮 ≥ 1 + Σ_{v∈T}(dim(R^loc_v/I_v) − 1)
                      + Σ_{v∈S∖T}(dim L_v − h⁰(G_{F_ṽ},ad r̄))
                      − h⁰(G_{F⁺,S},ad r̄(1))
                      − Σ_{v|∞}n(n+χ(c_v))/2.

Use liftability outside T for the stated relation bound. The local conditions
must be nonempty problems for the chosen residual representation; formal
smoothness, dimensions and component properties come with their individual
local theorems, rather than following merely from a condition's name.

Sources. CHT, Corollaries 2.2.12, 2.2.13 and 2.3.5, pp. 25 and 32.

Prerequisites. Tangent and obstruction spaces of polarized problems (Layer G7); Representability of polarized problems (Layer G7); DeformationAndDerivedPatchingAlgebra R03.2; LocalGaloisDeformationRings L7.

Target: taylor-wiles-local-diamond

### 8.5. Taylor–Wiles places in rank n

In the ACC rank-n setting, take v ∤ p, q_v ≡ 1 mod p, residual unramifiedness and an ordering of n distinct k-rational Frobenius eigenvalues. The local lifting ring supplied by R08.2 classifies a direct sum of uniquely labelled character deformations, after change of basis. Reciprocity on their inertia characters gives 𝒪[k(v)ˣ(p)ⁿ] → R^□_v, formally smooth of relative dimension n². For Q, put Δ_Q = ∏_{v∈Q}k(v)ˣ(p)ⁿ and augment 𝒮 by unrestricted local conditions. The chosen ordering gives R^T_{𝒮_Q} its Λ[Δ_Q]-algebra structure. The specialization R^T_{𝒮_Q} ↠ R^T_𝒮 has kernel the augmentation ideal times R^T_{𝒮_Q}. This is the variable-determinant n-factor diamond action; the fixed-determinant rank-two action of R04.5 has its own constraint.

Sources. ACC arXiv v2, §6.2.18, Lemma 6.2.19, p. 143; the Taylor–Wiles datum and 𝒮_Q, p. 149.

Prerequisites. Global deformation problems with variable determinant (Layer G8); Local cohomology at Taylor–Wiles places (Layer R04.5); Inertia at Taylor–Wiles places and the Δ_Q-module structure (Layer R04.5); LocalGaloisDeformationRings R08.2, taylor-wiles-local-ring.

Target: enormous-taylor-wiles-primes

### 8.6. Taylor–Wiles primes for enormous image

Assume the ACC setting, F CM, ζ_p ∉ F and enormous ρ̄(G_{F(ζ_p)}), with k containing all residual eigenvalues. For T ⊆ S, any q at least the ordinary dual Selmer dimension and every N ≥ 1, find exactly q auxiliary degree-one primes with q_v ≡ 1 mod pᴺ and ordered distinct residual eigenvalues, killing the augmented dual Selmer group. Allow any additional finite avoidance set. The enormous-image and Kummer arguments establish detecting elements and an admissible padding class; apply R04.5's shared arithmetic selector, using D8 to identify its joint kernel with the augmented dual Selmer group. The full adjoint splitting uses p ∤ n; the scalar Kummer summand uses ζ_p ∉ F. Enormous means the exact R01/G7 condition (no nontrivial p-power quotient, vanishing H⁰ and H¹ on ad⁰, and a regular-semisimple detector on each simple submodule), not just adequacy.

Sources. ACC arXiv v2, Definition 6.2.28, Lemma 6.2.29 and Lemma 6.2.31 with its proof, pp. 148–151; ACC published, §6.2.28, Definition 6.2.29, Lemmas 6.2.30 and 6.2.32; printed pp. 1044–1046, PDF pp. 148–150.

Prerequisites. Taylor–Wiles places in rank n (Layer G7); Presentation over the local rings (Layer G8); ArithmeticGaloisRepresentations G7; Shared Chebotarev selection for Selmer detection (Layer R04.5); ArithmeticGaloisDuality D8.

Target: enormous-taylor-wiles-presentation

### 8.7. The Taylor–Wiles presentation of ACC+

Take the variable-determinant ACC problem with T = S. Assume F = F⁺F₀, F⁺ totally real and F₀ imaginary quadratic, ζ_p ∉ F, p ∤ 2n, continuous absolutely irreducible ρ̄, enormous cyclotomic image and a residue field containing all its eigenvalues. Given N ≥ 1 and q at least the ordinary dual Selmer dimension, construct Q_N of size q with q_v ≡ 1 mod pᴺ and rational primes split in F₀, and a local Λ-algebra surjection

    R^{T,loc}_𝒮⟦X₁,…,X_g⟧ ↠ R^T_{𝒮_{Q_N}},     g = qn − n²[F⁺:ℚ].

Prove g ≥ 0 in ℤ before indexing the variables. The diamond group has qn cyclic p-power factors, each of order at least pᴺ, and its augmentation quotient is R^T_𝒮. The degree-one selection avoids primes ramified in F₀ to ensure the splitting assertion. This ring, action, quotient and generator count form the input for arithmetic complex patching. The polarized and fixed-determinant branches retain their own formulas.

Sources. ACC arXiv v2, Proposition 6.2.32 and its proof, p. 151; ACC published, Proposition 6.2.33 and proof, printed p. 1047 (PDF p. 151); preceding diamond/augmentation data, printed p. 1045 (PDF p. 149).

Prerequisites. Taylor–Wiles primes for enormous image (Layer G7); Presentation over the local rings (Layer G8); Taylor–Wiles places in rank n (Layer G7).


-/
