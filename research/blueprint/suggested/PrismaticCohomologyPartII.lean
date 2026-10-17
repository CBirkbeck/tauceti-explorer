import Mathlib.RingTheory.Henselian
import Mathlib.RingTheory.WittVector.Frobenius
import Mathlib.RingTheory.WittVector.Verschiebung
import Mathlib.Algebra.Module.Projective
import Mathlib.RingTheory.Finiteness.Defs
import Mathlib.RingTheory.Jacobson.Ideal
import Mathlib.LinearAlgebra.TensorProduct.Basic

/-!
# Prismatic cohomology, Part II: prismatic Dieudonné theory — suggested Lean forms

This file is not the roadmap and is not exhaustive. The roadmap document
`research/blueprint/readmes/PrismaticCohomologyPartII.md` is definitive. The statements below suggest
Lean forms so that contributors and reviewers converge on names and signatures. Every proof is
`sorry`; nothing here is an implementation.

Only what is statable over the pinned Mathlib and Tau Ceti is written in Lean: the frame-and-window
algebra of Layer PD.0, the Witt frame of Layer PD.7, minuscule Breuil–Kisin modules over a ring with a
Frobenius lift, and lifting of projective modules along henselian pairs. The prismatic objects
(prisms, the absolute prismatic site, `O^pris`, the quasi-syntomic site, prismatic Dieudonné crystals
and modules, the functor `ℳ_Δ` and the classification theorems) have no carrier at the pins: their
carriers are targets of the roadmap *Prismatic cohomology* (PrismaticCohomology PR.0–PR.7) and of
DerivedDeRhamCohomology DD.5. They are README targets, listed at the end of this file with the Lean
names the roadmap fixes for them.
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

/-- The identity is a `1`-morphism. -/
def UMorphism.id (F : Frame p A) : UMorphism F F 1 where
  toRingHom := RingHom.id A
  map_frob _ := rfl
  map_mem_fil _ h := h
  map_frobOne _ := by simp
  map_ϖ := by simp

/-- Composition of a `u`-morphism and a `u'`-morphism is an `(α'(u) u')`-morphism. -/
def UMorphism.comp {F : Frame p A} {F' : Frame p A'} {F'' : Frame p A''} {u : A'ˣ} {u' : A''ˣ}
    (β : UMorphism F' F'' u') (α : UMorphism F F' u) :
    UMorphism F F'' (Units.map β.toRingHom.toMonoidHom u * u') where
  toRingHom := β.toRingHom.comp α.toRingHom
  map_frob a := by simp [α.map_frob, β.map_frob]
  map_mem_fil b hb := β.map_mem_fil _ (α.map_mem_fil b hb)
  map_frobOne b := sorry
  map_ϖ := sorry

end Frame

end Frames

section Windows

variable {p : ℕ} [Fact p.Prime] {A : Type*} [CommRing A]

/-- A window over a frame (Layer PD.0): a finite projective `A`-module `M` with a submodule `fil`,
a `φ`-semilinear `frobM` and a `φ`-semilinear divided Frobenius `frobOneM` on `fil`, satisfying the
window axioms. The condition that `M ⧸ fil` is finite projective over `A ⧸ Fil A` is a README
condition of the definition. -/
structure Window (F : Frame p A) (M : Type*) [AddCommGroup M] [Module A M] [Module.Finite A M]
    [Module.Projective A M] where
  /-- The filtration `Fil M`. -/
  fil : Submodule A M
  /-- The Frobenius `φ_M`. -/
  frobM : M →+ M
  /-- The divided Frobenius `φ_{M,1}`. -/
  frobOneM : fil →+ M
  frobM_smul : ∀ (a : A) (m : M), frobM (a • m) = F.frob a • frobM m
  frobOneM_smul : ∀ (a : A) (m : fil), frobOneM (a • m) = F.frob a • frobOneM m
  fil_smul_mem : ∀ a ∈ F.fil, ∀ m : M, a • m ∈ fil
  frobOneM_fil_smul : ∀ (a : F.fil) (m : M),
    frobOneM ⟨(a : A) • m, fil_smul_mem a a.2 m⟩ = F.frobOne a • frobM m
  frobM_eq_smul_frobOneM : ∀ m : fil, frobM m = F.ϖ • frobOneM m
  span_eq_top : Submodule.span A (Set.range frobOneM ∪ Set.range frobM) = ⊤

namespace Window

variable {F : Frame p A}
variable {M N : Type*} [AddCommGroup M] [Module A M] [Module.Finite A M] [Module.Projective A M]
  [AddCommGroup N] [Module A N] [Module.Finite A N] [Module.Projective A N]

/-- Morphisms of windows: `A`-linear maps preserving filtrations and commuting with both
Frobenii. -/
structure Hom (W₁ : Window F M) (W₂ : Window F N) where
  /-- The underlying linear map. -/
  toLinearMap : M →ₗ[A] N
  map_fil : ∀ m ∈ W₁.fil, toLinearMap m ∈ W₂.fil
  map_frobM : ∀ m, toLinearMap (W₁.frobM m) = W₂.frobM (toLinearMap m)
  map_frobOneM : ∀ m : W₁.fil,
    toLinearMap (W₁.frobOneM m) = W₂.frobOneM ⟨toLinearMap m, map_fil m m.2⟩

/-- The Hodge quotient `M / Fil M`. -/
abbrev hodgeQuotient (W : Window F M) : Type _ := M ⧸ W.fil

/-- The unit window `(A, Fil A, φ, φ₁)` of a frame whose divided Frobenius has unit image. -/
def unit (F : Frame p A) (h : Submodule.span A (Set.range F.frobOne) = ⊤) : Window F A where
  fil := F.fil
  frobM := F.frob.toAddMonoidHom
  frobOneM := F.frobOne
  frobM_smul a m := by simp [smul_eq_mul]
  frobOneM_smul a m := by simpa [smul_eq_mul] using F.frobOne_smul a m
  fil_smul_mem a ha m := by simpa [smul_eq_mul, mul_comm] using F.fil.mul_mem_left m ha
  frobOneM_fil_smul a m := sorry
  frobM_eq_smul_frobOneM m := by simpa [smul_eq_mul] using F.frob_eq_mul_frobOne m
  span_eq_top := sorry

end Window

/-- `Window.zero`: the zero module carries the zero window. -/
example (F : Frame p A) : Window F PUnit := sorry

end Windows

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
    (e : (A ⧸ J) ⊗[A] M ≃ₗ[A ⧸ J] (A ⧸ J) ⊗[A] N) : Nonempty (M ≃ₗ[A] N) := by
  sorry

end Henselian

section Minuscule

variable {A : Type*} [CommRing A]

/-- `IsMinuscule φ d φM`: the `φ`-semilinear endomorphism `φM` of `M` has integral image and the
cokernel of its linearisation is killed by `d` (Layer PD.0, for a prism `(A, (d))`). -/
def IsMinuscule {M : Type*} [AddCommGroup M] [Module A M] (φ : A →+* A) (d : A) (φM : M →+ M) :
    Prop :=
  (∀ (a : A) (m : M), φM (a • m) = φ a • φM m) ∧
    ∀ m : M, d • m ∈ Submodule.span A (Set.range φM)

/-- `MinusculeBK.unit_isMinuscule`: `(A, φ)` is minuscule. -/
example (φ : A →+* A) (d : A) : IsMinuscule φ d φ.toAddMonoidHom := by
  refine ⟨fun a m => by simp [smul_eq_mul], fun m => ?_⟩
  sorry

/-- `MinusculeBK.twist_cokernel`: `(A, d·φ)` is minuscule, with cokernel `A / d`. -/
example (φ : A →+* A) (d : A) :
    IsMinuscule φ d ((AddMonoidHom.mulLeft d).comp φ.toAddMonoidHom) := by
  sorry

/-- `MinusculeBK.square_not_minuscule`: over `ℤ` with `φ = id` and `d = 2`, multiplication by
`d² = 4` is not minuscule: `2` is not in the ideal `(4)`. -/
example : ¬ IsMinuscule (RingHom.id ℤ) 2 ((AddMonoidHom.mulLeft (4 : ℤ)).comp
    (RingHom.id ℤ).toAddMonoidHom) := by
  sorry

end Minuscule

section WittFrame

variable (p : ℕ) [hp : Fact p.Prime] (R : Type*) [CommRing R]

/-- Every element of the kernel of `W(R) → R` is a Verschiebung. -/
theorem exists_verschiebung_eq (b : RingHom.ker (WittVector.constantCoeff (p := p) (R := R))) :
    ∃ x : WittVector p R, WittVector.verschiebung x = (b : WittVector p R) := by
  sorry

/-- The Witt frame `(W(R), I_R, F, V⁻¹, p)` (Layer PD.7), for `p`-adically complete `R` in Lau's
sense; the radical condition is the README hypothesis on `R`. -/
noncomputable def Frame.witt (hrad : RingHom.ker (WittVector.constantCoeff (p := p) (R := R)) ⊔
    Ideal.span {(p : WittVector p R)} ≤ (⊥ : Ideal (WittVector p R)).jacobson) :
    Frame p (WittVector p R) where
  fil := RingHom.ker (WittVector.constantCoeff (p := p) (R := R))
  frob := WittVector.frobenius
  frobOne :=
    { toFun := fun b => Classical.choose (exists_verschiebung_eq p R b)
      map_zero' := sorry
      map_add' := sorry }
  ϖ := p
  frob_mod_p := sorry
  frob_eq_mul_frobOne := sorry
  frobOne_smul := sorry
  fil_sup_le_jacobson := hrad

/-- `Frame.witt_frobOne_verschiebung`: `F₁(V x) = x`. -/
theorem Frame.witt_frobOne_verschiebung (hrad) (x : WittVector p R)
    (hx : WittVector.verschiebung x ∈ (Frame.witt p R hrad).fil) :
    (Frame.witt p R hrad).frobOne ⟨_, hx⟩ = x := by
  sorry

end WittFrame

/-!
## README targets without a carrier at the pins

The following are targets of the roadmap, specified in the README with their API and checks, under
these names; their carriers (prisms and the absolute prismatic site, PrismaticCohomology PR.0–PR.7;
the quasi-syntomic site, DerivedDeRhamCohomology DD.5) are not in the pinned libraries.

- Layer PD.0: `Frame.ofOrientedPrism`, `Frame.nygaard`, `Window.baseChange`, `MinusculeBK`,
  `MinusculeBK.dual`, the Cais–Lau equivalence and the deformation theorems for windows.
- Layer PD.1: `prismToQsyn`, `smallPushforward`, `OPris` (with `OPris.ideal`, `OPris.nygaard`),
  `DieudonneCrystal`, `DieudonneCrystal.IsAdmissible`, `DieudonneModule`,
  `FilteredDieudonneCrystal`.
- Layer PD.2: `functorialResolution`, `dieudonneCrystal`, `dieudonneModule`.
- Layers PD.3–PD.5: the classification over perfectoid rings and the main theorem, that
  `dieudonneCrystal : BT(R) → DM^adm(R)` is an antiequivalence for every quasi-syntomic `R`;
  `qLog` and `dividedQLog`.
- Layer PD.6: `TorsionDieudonneModule` and the classification of finite locally free group schemes.
- Layer PD.7: `Display` (windows over `Frame.witt`), the display functor and the étale comparison.
-/

end TauCeti.PrismaticDieudonne
