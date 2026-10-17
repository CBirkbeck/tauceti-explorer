import Mathlib.RingTheory.Henselian
import Mathlib.Algebra.Module.Projective
import Mathlib.RingTheory.Finiteness.Defs
import Mathlib.RingTheory.Jacobson.Ideal
import Mathlib.LinearAlgebra.TensorProduct.Basic

/-!
# Prismatic Dieudonné theory: representative suggested statements

The README specifies all eight layers, including the missing carriers and the review's gaps.
At the pinned libraries one can state the frame data over rings, the integral height predicate,
and the henselian projective-lifting milestones. The frame convention is Cais–Lau's radical
condition, with a separately specified scalar. Completeness is imposed only at uses.

Windows with their projective Hodge quotient, the Witt frame construction, the relative sites,
internal Ext sheaves, prismatic crystals and the classification functors are README targets.
Their constructions are not developed in this suggested file. Every declaration below has
existing carriers; the only unfinished terms are proofs of propositions.
-/

namespace TauCeti.PrismaticDieudonne

open scoped TensorProduct

section Frames

variable (p : ℕ) [Fact p.Prime]

/-- A frame in the sense of Lau and Zink (Layer PD.0): a ring `A`, an ideal `fil`, a Frobenius lift
`frob`, a divided Frobenius `frobOne` on `fil` and an element `ϖ` with `frob = ϖ * frobOne` on `fil`.
Following Lau, completeness is replaced by `fil + (p) ⊆ Rad A`. -/
structure Frame (A : Type*) [CommRing A] where
  /-- The filtration ideal `Fil A`. -/
  fil : Ideal A
  /-- The Frobenius lift `φ`. -/
  frob : A →+* A
  /-- The divided Frobenius `φ₁ : Fil A → A`. -/
  frobOne : fil →+ A
  /-- The element `ϖ` with `φ = ϖ φ₁` on `Fil A`. -/
  ϖ : A
  frob_mod_p : ∀ a : A, frob a - a ^ p ∈ Ideal.span {(p : A)}
  frob_eq_mul_frobOne : ∀ b : fil, frob b = ϖ * frobOne b
  frobOne_smul : ∀ (a : A) (b : fil), frobOne (a • b) = frob a * frobOne b
  fil_sup_le_jacobson : fil ⊔ Ideal.span {(p : A)} ≤ (⊥ : Ideal A).jacobson

namespace Frame

variable {p}
variable {A A' A'' : Type*} [CommRing A] [CommRing A'] [CommRing A'']

/-- The quotient `R = A / Fil A` of a frame. -/
abbrev quotient (F : Frame p A) : Type _ := A ⧸ F.fil

/-- A `u`-morphism of frames: a ring map intertwining `φ`, carrying `Fil` into `Fil`, with
`φ₁' ∘ α = u · (α ∘ φ₁)` and `α(ϖ) = u ϖ'`. -/
structure UMorphism (F : Frame p A) (F' : Frame p A') (u : A'ˣ) where
  /-- The underlying ring map. -/
  toRingHom : A →+* A'
  map_frob : ∀ a : A, toRingHom (F.frob a) = F'.frob (toRingHom a)
  map_mem_fil : ∀ b ∈ F.fil, toRingHom b ∈ F'.fil
  map_frobOne : ∀ b : F.fil,
    F'.frobOne ⟨toRingHom b, map_mem_fil b b.2⟩ = (u : A') * toRingHom (F.frobOne b)
  map_ϖ : toRingHom F.ϖ = (u : A') * F'.ϖ

end Frame

end Frames

section Henselian

/-- Finite projective modules lift along a henselian pair (Layer PD.0). -/
theorem henselian_projective_lifting {A : Type*} [CommRing A] (J : Ideal A) [HenselianRing A J]
    (P : Type*) [AddCommGroup P] [Module (A ⧸ J) P] [Module.Finite (A ⧸ J) P]
    [Module.Projective (A ⧸ J) P] :
    ∃ (M : Type _) (_ : AddCommGroup M) (_ : Module A M),
      Module.Finite A M ∧ Module.Projective A M ∧ Nonempty ((A ⧸ J) ⊗[A] M ≃ₗ[A ⧸ J] P) := by
  sorry

/-- Isomorphisms of reductions lift along a henselian pair. -/
theorem henselian_projective_iso_lift {A : Type*} [CommRing A] (J : Ideal A) [HenselianRing A J]
    {M N : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
    [AddCommGroup N] [Module A N] [Module.Finite A N] [Module.Projective A N]
    (e : (A ⧸ J) ⊗[A] M ≃ₗ[A ⧸ J] (A ⧸ J) ⊗[A] N) : ∃ f : M ≃ₗ[A] N, ∀ m : M,
      e ((1 : A ⧸ J) ⊗ₜ[A] m) = (1 : A ⧸ J) ⊗ₜ[A] (f m) := by
  sorry

end Henselian

section Height

variable {A : Type*} [CommRing A]

/-- The integral semilinear height bound: `d` kills the cokernel of the linearization.
This is only the height condition; a full minuscule module also requires finite projectivity
and the localized Frobenius isomorphism specified in the README. -/
def HasHeightAtMostOne {M : Type*} [AddCommGroup M] [Module A M] (φ : A →+* A) (d : A) (φM : M →+ M) :
    Prop :=
  (∀ (a : A) (m : M), φM (a • m) = φ a • φM m) ∧
    ∀ m : M, d • m ∈ Submodule.span A (Set.range φM)

/-- `MinusculeBK.unit_isMinuscule`: `(A, φ)` is minuscule. -/
example (φ : A →+* A) (d : A) : HasHeightAtMostOne φ d φ.toAddMonoidHom := by
  refine ⟨fun a m => by simp [smul_eq_mul], fun m => ?_⟩
  sorry

/-- `MinusculeBK.square_not_minuscule`: over `ℤ` with `φ = id` and `d = 2`, multiplication by
`d² = 4` is not minuscule: `2` is not in the ideal `(4)`. -/
example : ¬ HasHeightAtMostOne (RingHom.id ℤ) 2 ((AddMonoidHom.mulLeft (4 : ℤ)).comp
    (RingHom.id ℤ).toAddMonoidHom) := by
  sorry

end Height

/-!
The remaining layer milestones are README targets: PD.1 coefficient sites and crystals;
PD.2 the contravariant Ext functor; PD.3 the perfectoid classification; PD.4 local freeness,
admissibility and crystalline comparison; PD.5 `BT(R)ᵒᵖ ≌ DMᵃᵈᵐ(R)`; PD.6 finite-group
classification and twisted Ext¹ Cartier duality; PD.7 regular-ring, display and étale comparisons.
Their absent carriers are not replaced by placeholder types or sorry-defined data.
-/

end TauCeti.PrismaticDieudonne
