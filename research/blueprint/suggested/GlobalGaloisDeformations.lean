import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.Topology.Algebra.Group.Basic
import Mathlib.Topology.Instances.Matrix
import Mathlib.RingTheory.LocalRing.ResidueField.Defs
import Mathlib.RingTheory.Artinian.Ring
import Mathlib.RingTheory.MvPowerSeries.Basic
import Mathlib.GroupTheory.GroupAction.Quotient
import Mathlib.Data.ZMod.Basic

/-!
# Suggested Lean forms: global Galois deformations (GlobalGaloisDeformations, R04.1–R04.2)

**Standard note.** This file is not the roadmap and it is not exhaustive. The roadmap document
(`GlobalGaloisDeformations`) is definitive. The statements below suggest Lean forms, so that
contributors and reviewers converge on names and signatures. Every proof of a new declaration is
`sorry`; nothing here claims to be formalised.

Pinned baseline: Mathlib `082e2d3`, Tau Ceti `f790474`. This file imports Mathlib only.

## Conventions

* A coefficient ring is a commutative topological ring `A` with a surjective ring map
  `π : A →+* 𝔽` onto the residue field; the categories `Art_𝒪` and `C_𝒪` themselves are imported
  from DeformationAndDerivedPatchingAlgebra R03.1 and are not re-declared here.
* `Γ̂_n(A) = ker (GL_n(A) → GL_n(𝔽))`; deformations are lifts modulo conjugation by `Γ̂_n(A)`
  (strict equivalence), not by all of `GL_n(A)`.
* Continuity of a lift is continuity of its matrix entries.
* Pro-representability is a theorem about these functors, not part of their definition.
-/

open Matrix

noncomputable section

namespace TauCeti.GaloisDeformation

variable {G : Type*} [Group G] [TopologicalSpace G]
variable {𝔽 : Type*} [Field 𝔽]
variable (n : ℕ) (ρbar : G →* GL (Fin n) 𝔽)

section Lifts

variable {A : Type*} [CommRing A] [TopologicalSpace A] (π : A →+* 𝔽)

/-- **`R04.1/lifting-functor`**. A lift of `ρ̄` to the coefficient ring `(A, π)`: a continuous
homomorphism `G → GL_n(A)` reducing to `ρ̄`. -/
@[ext]
structure Lift where
  toHom : G →* GL (Fin n) A
  continuous : Continuous fun g ↦ (toHom g : Matrix (Fin n) (Fin n) A)
  reduce : (Matrix.GeneralLinearGroup.map π).comp toHom = ρbar

/-- `Γ̂_n(A)`: invertible matrices reducing to the identity. -/
def strictKernel : Subgroup (GL (Fin n) A) := (Matrix.GeneralLinearGroup.map (n := Fin n) π).ker

/-- Strict conjugation of lifts. -/
instance : MulAction (strictKernel n π) (Lift n ρbar π) := sorry

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

end Lifts

section Restriction

variable {H : Type*} [Group H] [TopologicalSpace H]
variable {A : Type*} [CommRing A] [TopologicalSpace A] (π : A →+* 𝔽)

/-- **`R04.1/restriction-of-deformations`**. Restriction along a continuous homomorphism. -/
def Lift.restrict (ι : H →* G) (hι : Continuous ι) (ρ : Lift n ρbar π) : Lift n (ρbar.comp ι) π :=
  sorry

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

variable {A : Type*} [CommRing A] [TopologicalSpace A] (π : A →+* 𝔽)

/-- **`R04.1/strict-vs-full-conjugacy`**. For Schur `ρ̄`, `GL_n(A)`-conjugate lifts are strictly
conjugate. -/
theorem strict_of_full (hS : IsSchur n ρbar) (hπ : Function.Surjective π) (ρ ρ' : Lift n ρbar π)
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
theorem PhiP.of_open (h : PhiP G p) (Δ : Subgroup G) (hΔ : IsOpen (Δ : Set G)) : PhiP Δ p := sorry

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

variable {A : Type*} [CommRing A] [TopologicalSpace A] (π : A →+* 𝔽)

/-- **`R04.2/carayol-trace-theorem`** (2): for absolutely irreducible `ρ̄` (here: Schur and
spanning all matrices), lifts with the same traces are strictly conjugate. -/
theorem strictly_conj_of_trace_eq
    (habs : Submodule.span 𝔽 (Set.range fun g ↦ (ρbar g : Matrix (Fin n) (Fin n) 𝔽)) = ⊤)
    (ρ ρ' : Lift n ρbar π) (htr : ∀ g, (ρ.toHom g : Matrix (Fin n) (Fin n) A).trace =
      (ρ'.toHom g : Matrix (Fin n) (Fin n) A).trace) :
    ∃ a ∈ strictKernel n π, ∀ g, ρ'.toHom g = a * ρ.toHom g * a⁻¹ := sorry

end Carayol

/-!
## Signatures against Tau Ceti and the requested suppliers (comment only)

These need Tau Ceti's continuous cohomology and the R03.1/R03.2 coefficient categories, which are
not available as oleans on this server; they are recorded here, not elaborated.

```
-- R04.1/tangent-spaces
def liftDualNumbersEquiv : TauCeti.ContCohomology.Z1 G (Matrix (Fin n) (Fin n) 𝔽) ≃ Lift n ρbar (DualNumber.fst : 𝔽[ε] →+* 𝔽)
theorem defDualNumbersEquiv : Def n ρbar DualNumber.fst ≃ TauCeti.ContCohomology.H1 G (ad ρbar)
-- R04.2/universal-lifting-ring (with Art_𝒪, C_𝒪 from R03.1 and Schlessinger from R03.2)
theorem Lift.proRepresentable (hG : PhiP G p) : (Lift n ρbar).IsProRepresentable (C 𝒪)
-- R04.2/universal-deformation-ring
theorem Def.proRepresentable (hG : PhiP G p) (hS : IsSchur n ρbar) : (Def n ρbar).IsProRepresentable (C 𝒪)
-- R04.1/determinant-deformation-functor (determinants from IHG.0)
def DetDef (Dbar : Determinant 𝔽 G n) : ArtO ⥤ Type
theorem Def.toDetDef_bijective (habs : AbsolutelyIrreducible ρbar) : Function.Bijective (Def.toDetDef …)
```
-/

end TauCeti.GaloisDeformation

namespace TauCeti.GaloisDeformation.SuggestedTest

open TauCeti.GaloisDeformation

/-- The framed restriction invariance is a group identity. -/
example {A : Type*} [CommRing A] (n : ℕ) (x α β : GL (Fin n) A) :
    (β * α)⁻¹ * (β * x * β⁻¹) * (β * α) = α⁻¹ * x * α := by group

/-- A discrete topology on `Multiplicative ℤ`, for the examples. -/
local instance : TopologicalSpace (Multiplicative ℤ) := ⊥


/-- The trivial one-dimensional residual representation is Schur. -/
example (𝔽 : Type) [Field 𝔽] : IsSchur 1 (1 : Multiplicative ℤ →* GL (Fin 1) 𝔽) := sorry

/-- `1 ⊕ 1` is not Schur. -/
example (𝔽 : Type) [Field 𝔽] : ¬ IsSchur 2 (1 : Multiplicative ℤ →* GL (Fin 2) 𝔽) := sorry

end TauCeti.GaloisDeformation.SuggestedTest
