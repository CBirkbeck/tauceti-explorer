/-
# Completed cohomology, homology and arithmetic towers: representative target signatures

Arithmetic locally symmetric spaces and their cohomology, Part II.

This file is not the roadmap and is not exhaustive. The definitive roadmap is
CompletedCohomologyPartII.md; it states every target with its hypotheses, sources, API and
checks. The declarations below suggest Lean forms so that contributors and reviewers can
converge on names and signatures. Proofs by `sorry` assert nothing, and nothing here claims
an implementation.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Only light definitions with real bodies over carriers that exist at the pins, and the
milestones statable with those carriers, appear here. The arithmetic tower and its local
systems, the continuous O and E/O duals with their topologies, the completed group algebra
of a compact p-adic analytic group with its noetherianity, strict admissible complexes, the
enhanced countable derived limit, continuous completed Tor, derived analytic vectors, the
canonical-model and étale–Betti comparisons, the finite derived Hecke images of the tower and
the smooth representations of the tame-level layer are not at the pins. Their targets are in
the roadmap document. Neither arbitrary module diagrams nor `Prop`-valued fields stand in for
them.

The diagram sections check the native limit and colimit operations that the arithmetic
construction uses once its actual diagram is constructed; the Layer 8 sections state the
completed Hecke algebra, its residual projectors and the residual localisation for a supplied
compatible diagram of finite rings and a supplied continuous idempotent.
-/
import Mathlib.Algebra.Category.ModuleCat.Topology.Basic
import Mathlib.Algebra.Category.Ring.Limits
import Mathlib.Algebra.Homology.Embedding.CochainComplex
import Mathlib.Algebra.Homology.ShortComplex.ModuleCat
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.CategoryTheory.Endomorphism
import Mathlib.CategoryTheory.Limits.Final
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.RepresentationTheory.Basic
import Mathlib.RepresentationTheory.Invariants
import Mathlib.RingTheory.AdicCompletion.Basic
import Mathlib.RingTheory.Ideal.Quotient.Operations
import Mathlib.RingTheory.Localization.Away.Basic
import Mathlib.RingTheory.Localization.AtPrime.Basic
import Mathlib.RingTheory.Localization.Module
import Mathlib.RingTheory.Noetherian.Basic
import Mathlib.RingTheory.Spectrum.Maximal.Basic
import Mathlib.Topology.Algebra.Module.ContinuousLinearMap.Basic
import Mathlib.Topology.Algebra.Module.ContinuousLinearMap.Idempotent
import Mathlib.Topology.Algebra.Module.ContinuousLinearMap.Restrict
import Mathlib.Tactic
import TauCeti.Algebra.Homology.ShortComplex.Colimit

noncomputable section
open CategoryTheory CategoryTheory.Limits Opposite

namespace TauCeti.CompletedCohomology

/-! ## Layer 1: the fixed-exponent colimit -/

section Diagrams
variable {R : Type} [Ring R]

/-- The fixed-exponent level colimit, as the native colimit of the supplied diagram of
modules (roadmap 1.1). The arithmetic diagram is a roadmap target; this is its colimit. -/
abbrev torsionColimit (F : ℕ ⥤ ModuleCat R) : ModuleCat R := colimit F

/-- Cofinal restriction is the native final-functor comparison (`torsionColimit_cofinal`). -/
example {J : Type} [Category J] (u : J ⥤ ℕ) [u.Final]
    (F : ℕ ⥤ ModuleCat R) : colimit (u ⋙ F) ≅ torsionColimit F :=
  Functor.Final.colimitIso u F

/-- Tau Ceti already provides exactness of these module colimits. -/
example : AB5OfSize.{0, 0} (ModuleCat R) := inferInstance

end Diagrams

/-! ## Layers 2 and 8: the coefficient limit and transported actions -/

section TopologicalDiagrams
variable {R : Type} [CommRing R] [TopologicalSpace R]
variable (F : ℕᵒᵖ ⥤ TopModuleCat R)
variable {Γ : Type} [Monoid Γ]

/-- The coefficient limit of a supplied diagram of topological modules (roadmap 2.1), as the
native categorical limit in `TopModuleCat`. -/
abbrev coefficientLimit : TopModuleCat R := limit F

/-- The action on the coefficient limit induced by a natural action on the diagram: Mathlib's
limit functor applied to endomorphisms (roadmap 8.7). The arithmetic finite actions are
transported to the diagram first. -/
abbrev transportedAction (ρ : Γ →* End F) : Γ →* End (coefficientLimit F) :=
  ((lim : (ℕᵒᵖ ⥤ TopModuleCat R) ⥤ TopModuleCat R).mapEnd F).comp ρ

/-- Each limit projection intertwines the induced operator with the diagram component. -/
theorem transportedAction_projection (ρ : Γ →* End F) (g : Γ) (j : ℕᵒᵖ) :
    transportedAction F ρ g ≫ limit.π F j = limit.π F j ≫ (ρ g).app j := by
  sorry

/-- An action agreeing with the diagram action under every projection is the induced one. -/
theorem transportedAction_unique (ρ : Γ →* End F) (σ : Γ →* End (coefficientLimit F))
    (hσ : ∀ g j, σ g ≫ limit.π F j = limit.π F j ≫ (ρ g).app j) :
    σ = transportedAction F ρ := by
  sorry

/-- Commuting natural actions induce commuting operators on the limit. -/
theorem transportedAction_commute {Δ : Type} [Monoid Δ]
    (ρ : Γ →* End F) (σ : Δ →* End F)
    (h : ∀ g d, Commute (ρ g) (σ d)) (g : Γ) (d : Δ) :
    Commute (transportedAction F ρ g) (transportedAction F σ d) := by
  sorry

/-- Milestone of roadmap 2.6 and 8.7: coordinatewise joint continuity gives joint continuity
on the limit topology. -/
theorem transportedAction_jointlyContinuous [TopologicalSpace Γ]
    (ρ : Γ →* End F)
    (h : ∀ j, Continuous (fun z : Γ × F.obj j => ((ρ z.1).app j).hom z.2)) :
    Continuous (fun z : Γ × ↥(coefficientLimit F) => (transportedAction F ρ z.1).hom z.2) := by
  sorry

/-- A continuous idempotent commuting with the action has an invariant range. -/
theorem transportedAction_localized (ρ : Γ →* End F)
    (P : ↥(coefficientLimit F) →L[R] ↥(coefficientLimit F)) (hP : IsIdempotentElem P)
    (h : ∀ g, Commute P (transportedAction F ρ g).hom)
    (g : Γ) (x : P.range) :
    (transportedAction F ρ g).hom x ∈ P.range := by
  sorry

/-- Joint projections detect elements of the limit. -/
example (x y : ↥(coefficientLimit F))
    (h : ∀ j, (limit.π F j).hom x = (limit.π F j).hom y) : x = y := by
  sorry

/- Test `transportedAction_identity`: the trivial natural action stays trivial. -/
example (ρ : Γ →* End F) (h : ∀ g, ρ g = 1) (g : Γ) :
    transportedAction F ρ g = 1 := by
  sorry

/- Test `transportedAction_sign`: for the constant O diagram and the nontrivial element of
C₂, including O = Z₂, the action is −1 and not 1. -/
example (ρ : Γ →* End F) (g : Γ)
    (h : ∀ j, (ρ g).app j = -(𝟙 (F.obj j))) :
    transportedAction F ρ g = -(𝟙 (coefficientLimit F)) := by
  sorry

end TopologicalDiagrams

/- Test `transportedAction_noncommuting`: two integral shears do not commute, so commutation on
the limit needs the commuting finite actions as a hypothesis. -/
example :
    let A : Matrix (Fin 2) (Fin 2) ℤ := !![1, 1; 0, 1]
    let B : Matrix (Fin 2) (Fin 2) ℤ := !![1, 0; 1, 1]
    A * B ≠ B * A := by
  sorry

/-! ## Layer 2: complexes of complete torsion-free modules -/

/-- Clause (1) of roadmap 2.5 (Pan 2022, Lemma 4.4.4 and its proof). For a bounded-above cochain
complex of `ϖ`-adically complete, `ϖ`-torsion-free modules, no cohomology module receives a
nonzero `O`-linear map from `O[1/ϖ]`: no nonzero class has a compatible system of `ϖ`-power
roots, so the `ϖ`-adic Tate module of the cohomology vanishes. A class lying in every
`ϖ ^ n • H^i` need not vanish without the bounded-torsion hypothesis of clause (4). Clauses
(2)–(4) need the reductions of the complex modulo every power of `ϖ` and their limits, and are
roadmap targets. -/
theorem homology_hom_away_eq_zero {O : Type} [CommRing O] (ϖ : O)
    (M : CochainComplex (ModuleCat.{0} O) ℤ) (n : ℤ) [M.IsStrictlyLE n]
    (hcomplete : ∀ i, IsAdicComplete (Ideal.span {ϖ}) (M.X i))
    (htorsionFree : ∀ i, IsSMulRegular (M.X i) ϖ) (i : ℤ)
    (f : Localization.Away ϖ →ₗ[O] M.homology i) : f = 0 := by
  sorry

/-- Check of roadmap 2.5 for `[O → O]` with differential `p`: the image of `p ^ n` in
`ZMod (p ^ n)` is zero, so the transitions of `H^0(M / p^(n+1)) = p^n O / p^(n+1)` vanish and
their limit is `0 = H^0(M)`. -/
example (p n : ℕ) : ((p : ZMod (p ^ n)) ^ n) = 0 := by
  rw [← Nat.cast_pow, ZMod.natCast_self]

/-! ## Layer 3: continuous duals, contragredients and the circle tower -/

section ContinuousDual
variable {O M N : Type} [CommRing O]
variable [AddCommGroup M] [Module O M] [TopologicalSpace M]
variable [AddCommGroup N] [Module O N] [TopologicalSpace N]
variable [TopologicalSpace O]

/-- The native carrier of continuous `O`-linear functionals (roadmap 3.1); its dual topology is
a roadmap target. -/
abbrev ContinuousIntegralDual (M : Type) [AddCommGroup M] [Module O M]
    [TopologicalSpace M] := M →L[O] O

/-- Precomposition of continuous functionals, the transpose of a continuous map. -/
def continuousDualPrecomp (f : M →L[O] N) (φ : ContinuousIntegralDual (O := O) N) :
    ContinuousIntegralDual (O := O) M := φ.comp f

example (f : M →L[O] N) (φ : N →L[O] O) (x : M) :
    continuousDualPrecomp f φ x = φ (f x) := rfl

example (φ : M →L[O] O) :
    continuousDualPrecomp (ContinuousLinearMap.id O M) φ = φ := by
  ext x
  rfl

example (φ : N →L[O] O) :
    continuousDualPrecomp (0 : M →L[O] N) φ = 0 := by
  ext x
  simp [continuousDualPrecomp]

end ContinuousDual

section Contragredient
variable {O Γ M : Type} [CommRing O] [Group Γ]
variable [AddCommGroup M] [Module O M]

/-- The left contragredient uses the inverse, as Mathlib's `Representation.dual` does. -/
example (ρ : Representation O Γ M) (g : Γ) (φ : Module.Dual O M) (x : M) :
    (ρ.dual g φ) x = φ (ρ g⁻¹ x) := rfl

/-- An `O`-valued functional kills a class annihilated by a nonzero scalar, which is why
`O`-linear duals cannot replace `E/O`-duals of torsion. -/
example [IsDomain O] (π : O) (hπ : π ≠ 0) (φ : M →ₗ[O] O)
    (x : M) (hx : π • x = 0) : φ x = 0 := by
  have h : π * φ x = 0 := by
    simpa only [map_smul, smul_eq_mul, map_zero] using congrArg φ hx
  exact (mul_eq_zero.mp h).resolve_left hπ

/-- The integral algebraic dual of a torsion module vanishes. -/
example (φ : ZMod 2 →ₗ[ℤ] ℤ) : φ = 0 := by
  sorry

end Contragredient

/-- Check of roadmap 3.6: in the tower of connected degree-`p` covers of a circle a compatible
family `x_k = p * x_{k+1}` in `ℤ` has `p ^ k ∣ x_0` for every `k`, so the integral limit
vanishes. -/
example {p : ℕ} (hp : 1 < p) {x : ℤ} (h : ∀ k : ℕ, (p : ℤ) ^ k ∣ x) : x = 0 := by
  by_contra hx
  have hk := h x.natAbs
  have hlt : x.natAbs < ((p : ℤ) ^ x.natAbs).natAbs := by
    rw [Int.natAbs_pow, Int.natAbs_natCast]
    exact Nat.lt_pow_self hp
  exact hx (Int.eq_zero_of_dvd_of_natAbs_lt_natAbs hk hlt)

/-- Check of roadmap 3.6: over `ℚ` the family `x_k = p⁻ᵏ` is compatible under multiplication by
`p` and nonzero, so the limit of the rational groups is not zero. -/
example {p : ℕ} (hp : p ≠ 0) (k : ℕ) :
    (p : ℚ) * ((p : ℚ) ^ (k + 1))⁻¹ = ((p : ℚ) ^ k)⁻¹ ∧ ((p : ℚ) ^ k)⁻¹ ≠ 0 := by
  have : (p : ℚ) ≠ 0 := by exact_mod_cast hp
  refine ⟨?_, by positivity⟩
  field_simp
  ring

/-- Check `tameCompleted_p_index` of roadmap 3.8: pullback along the degree-`p` cover of a circle
is multiplication by `p` on `H^1(S^1, F_p) = F_p`, which is zero, while an index prime to `p`
acts by a unit. -/
example (p d : ℕ) [Fact p.Prime] (hd : Nat.Coprime d p) (x : ZMod p) :
    (p : ZMod p) * x = 0 ∧ IsUnit (d : ZMod p) :=
  ⟨by simp, (ZMod.unitOfCoprime d hd).isUnit⟩

/-- Check of `TameCompleted.averaging_comp_ι` (roadmap 3.8): for a finite deck group of
invertible order, Mathlib's averaging projection is the group sum divided by the order, the
finite form of `e_K ∘ ι_{K'} = ι_K ∘ [K : K']⁻¹ cor` (Tau Ceti states it as
`Representation.averageMap_eq_invOf_card_smul_norm`). -/
example {k Q V : Type*} [CommRing k] [Group Q] [AddCommGroup V]
    [Module k V] (ρ : Representation k Q V) [Fintype Q] [Invertible (Fintype.card Q : k)] (v : V) :
    ρ.averageMap v = ⅟(Fintype.card Q : k) • ∑ q : Q, ρ q v := by
  simp only [Representation.averageMap, GroupAlgebra.average, map_smul, map_sum,
    MonoidAlgebra.of_apply, Representation.asAlgebraHom_single_one, LinearMap.smul_apply,
    LinearMap.sum_apply]

/-- The averaging projection fixes invariant vectors. -/
example {k Q V : Type*} [CommRing k] [Group Q] [AddCommGroup V] [Module k V]
    (ρ : Representation k Q V) [Fintype Q] [Invertible (Fintype.card Q : k)] (v : V)
    (hv : v ∈ ρ.invariants) : ρ.averageMap v = v :=
  ρ.averageMap_id v hv

/-- Check of roadmap 3.9: with `μ(K) = [K⁰ : K]⁻¹`, `[K : K'] · μ(K') = μ(K)`, which is why the
normalised duality maps `μ(K) · h_K` commute with transfer. -/
example {k : Type*} [Field k] {a b : ℕ} (ha : (a : k) ≠ 0) (hb : (b : k) ≠ 0) :
    (b : k) * ((a : k) * (b : k))⁻¹ = (a : k)⁻¹ := by
  field_simp

/-! ## Layers 4 and 5: finite homology over a noetherian ring -/

section FiniteHomology
variable {R : Type} [Ring R] [IsNoetherianRing R]

/-- The homology of a short complex of finite modules over a noetherian ring is finite. The
instance for `Λ = O[[K_0]]` needs the analytic noetherianity and the actual chain model of
roadmap 4.3 and 5.1. -/
theorem finite_shortComplex_homology (S : ShortComplex (ModuleCat R))
    [Module.Finite R S.X₁] [Module.Finite R S.X₂] [Module.Finite R S.X₃] :
    Module.Finite R S.homology := by
  sorry

end FiniteHomology

/-! ## Layer 7: completed interior cohomology as an image -/

section Interior
variable {R M N : Type} [Ring R]
variable [AddCommGroup M] [Module R M]
variable [AddCommGroup N] [Module R N]

/-- The image of the support map (roadmap 7.4), as the native range. Neither the interchange of
image and limit nor closedness is part of this definition. -/
def interiorSubmodule (f : M →ₗ[R] N) : Submodule R N := f.range

example : interiorSubmodule (0 : M →ₗ[R] N) = ⊥ := by
  simp [interiorSubmodule]

example : interiorSubmodule (LinearMap.id : M →ₗ[R] M) = ⊤ := by
  simp [interiorSubmodule]

example (f : M →ₗ[R] N) (x : M) : f x ∈ interiorSubmodule f := by
  exact ⟨x, rfl⟩

/-- The closed-image milestone of roadmap 7.5 uses compactness and the Hausdorff property. -/
theorem interiorSubmodule_closed [TopologicalSpace M] [CompactSpace M]
    [TopologicalSpace N] [T2Space N] (f : M →L[R] N) :
    IsClosed (interiorSubmodule f.toLinearMap : Set N) := by
  sorry

end Interior

/-! ## Layer 8: compatible images of a supplied endomorphism-ring diagram

Here `E` is meant to be the actual diagram of derived endomorphism rings of roadmap 8.8;
constructing it from Layer 4 and the equivariant extension of the integral Hecke image theory
is a roadmap target. This section only restricts a supplied diagram to its native images. -/

section Images
variable {H : Type} [CommRing H]

/-- The image of a commutative ring is commutative. -/
instance imageCommRing {A : Type} [Ring A] (α : H →+* A) : CommRing α.range :=
  { (inferInstance : Ring α.range) with
    mul_comm := by
      rintro ⟨_, a, rfl⟩ ⟨_, b, rfl⟩
      apply Subtype.ext
      change α a * α b = α b * α a
      rw [← map_mul, ← map_mul, mul_comm] }

/-- The diagram of image rings (roadmap 8.8): the image of `H` at each level, with the
transition maps induced by the supplied diagram. -/
def derivedHeckeDiagram (E : ℕᵒᵖ ⥤ RingCat)
    (α : (Functor.const ℕᵒᵖ).obj (RingCat.of H) ⟶ E) : ℕᵒᵖ ⥤ CommRingCat where
  obj j := CommRingCat.of (α.app j).hom.range
  map {i j} g := CommRingCat.ofHom
    { toFun := fun x => ⟨(E.map g).hom x.1, by
        obtain ⟨h, hh⟩ := x.2
        refine ⟨h, ?_⟩
        have := congrArg (fun f => f.hom h) (α.naturality g)
        simp only [Functor.const_obj_obj, Functor.const_obj_map, Category.id_comp,
          RingCat.hom_comp, RingHom.coe_comp, Function.comp_apply] at this
        rw [this, hh]⟩
      map_one' := by apply Subtype.ext; simp
      map_mul' := fun x y => by apply Subtype.ext; simp
      map_zero' := by apply Subtype.ext; simp
      map_add' := fun x y => by apply Subtype.ext; simp }
  map_id := by intro j; ext x; simp
  map_comp := by intro i j k f g; ext x; simp

theorem derivedHeckeDiagram_class (E : ℕᵒᵖ ⥤ RingCat)
    (α : (Functor.const ℕᵒᵖ).obj (RingCat.of H) ⟶ E)
    {i j : ℕᵒᵖ} (g : i ⟶ j) (h : H) :
    ((derivedHeckeDiagram E α).map g).hom ((α.app i).hom.rangeRestrict h) =
      (α.app j).hom.rangeRestrict h := by
  sorry

theorem derivedHeckeDiagram_surjective (E : ℕᵒᵖ ⥤ RingCat)
    (α : (Functor.const ℕᵒᵖ).obj (RingCat.of H) ⟶ E)
    {i j : ℕᵒᵖ} (g : i ⟶ j) :
    Function.Surjective ((derivedHeckeDiagram E α).map g).hom := by
  sorry

theorem derivedHeckeDiagram_coherence (E : ℕᵒᵖ ⥤ RingCat)
    (α : (Functor.const ℕᵒᵖ).obj (RingCat.of H) ⟶ E)
    {i j k : ℕᵒᵖ} (f : i ⟶ j) (g : j ⟶ k) :
    (derivedHeckeDiagram E α).map (f ≫ g) =
      (derivedHeckeDiagram E α).map f ≫ (derivedHeckeDiagram E α).map g := by
  sorry

/- Test `derivedHeckeDiagram_zero`: every map to the one-element ring has a one-element image. -/
example :
    let E := (Functor.const ℕᵒᵖ).obj (RingCat.of (ZMod 1))
    Subsingleton ((derivedHeckeDiagram E (𝟙 E)).obj (op 0)) := by
  sorry

/- Test `derivedHeckeDiagram_scalar`: for a rank-one scalar action of `R = O/varpi^s` the
image is `R`. -/
example (R : Type) [CommRing R] :
    let E := (Functor.const ℕᵒᵖ).obj (RingCat.of R)
    Nonempty ((derivedHeckeDiagram E (𝟙 E)).obj (op 0) ≃+* R) := by
  sorry

/- Test `derivedHeckeDiagram_intertwiner_insufficient`: the zero module map intertwines the
actions `x = 0` and `x = 1`, but no map of image rings preserves all classes of `H`. -/
example : ¬ ∃ f : ZMod 3 →+* ZMod 3,
    ∀ q : Polynomial (ZMod 3), f (q.eval 0) = q.eval 1 := by
  sorry

end Images

/-! ## Layer 8: the completed Hecke algebra of a compatible diagram of finite rings -/

/-- The completed Hecke algebra (roadmap 8.10): the native ring of compatible sections of the
supplied diagram of finite image rings. -/
abbrev completedHecke (F : ℕᵒᵖ ⥤ CommRingCat) :=
  ↥(RingCat.sectionsSubring (F ⋙ forget₂ CommRingCat RingCat))

instance completedHeckeCommRing (F : ℕᵒᵖ ⥤ CommRingCat) : CommRing (completedHecke F) :=
  { (inferInstance : Ring (completedHecke F)) with
    mul_comm := by
      intro x y
      apply Subtype.ext
      funext j
      let : CommRing ((F ⋙ forget₂ CommRingCat RingCat).obj j) :=
        inferInstanceAs (CommRing (F.obj j))
      exact mul_comm (x.1 j) (y.1 j) }

/-- The inverse-limit topology, induced from the product. -/
instance completedHeckeTopology (F : ℕᵒᵖ ⥤ CommRingCat)
    [∀ j, TopologicalSpace (F.obj j)] : TopologicalSpace (completedHecke F) :=
  TopologicalSpace.induced (fun x : completedHecke F => fun j => x.1 j)
    (inferInstanceAs (TopologicalSpace (∀ j, F.obj j)))

/-- Evaluation at a level. -/
def completedHecke_eval (F : ℕᵒᵖ ⥤ CommRingCat) (j : ℕᵒᵖ) :
    completedHecke F →+* F.obj j where
  toFun x := x.1 j
  map_one' := rfl
  map_mul' _ _ := rfl
  map_zero' := rfl
  map_add' _ _ := rfl

theorem completedHecke_ext {F : ℕᵒᵖ ⥤ CommRingCat} (x y : completedHecke F)
    (h : ∀ j, completedHecke_eval F j x = completedHecke_eval F j y) : x = y := by
  sorry

/-- A compatible family of ring maps lands in the compatible sections. -/
def completedHecke_lift {A : Type} [CommRing A] (F : ℕᵒᵖ ⥤ CommRingCat)
    (f : ∀ j, A →+* F.obj j)
    (hf : ∀ {i j} (g : i ⟶ j), (F.map g).hom.comp (f i) = f j) :
    A →+* completedHecke F where
  toFun a := ⟨fun j => f j a, fun {i j} g => RingHom.congr_fun (hf g) a⟩
  map_one' := by apply Subtype.ext; funext j; exact map_one (f j)
  map_mul' x y := by apply Subtype.ext; funext j; exact map_mul (f j) x y
  map_zero' := by apply Subtype.ext; funext j; exact map_zero (f j)
  map_add' x y := by apply Subtype.ext; funext j; exact map_add (f j) x y

theorem completedHecke_lift_eval {A : Type} [CommRing A] (F : ℕᵒᵖ ⥤ CommRingCat)
    (f : ∀ j, A →+* F.obj j)
    (hf : ∀ {i j} (g : i ⟶ j), (F.map g).hom.comp (f i) = f j) (j : ℕᵒᵖ) :
    (completedHecke_eval F j).comp (completedHecke_lift F f hf) = f j := by
  sorry

theorem completedHecke_lift_unique {A : Type} [CommRing A]
    (F : ℕᵒᵖ ⥤ CommRingCat) (f : ∀ j, A →+* F.obj j)
    (hf : ∀ {i j} (g : i ⟶ j), (F.map g).hom.comp (f i) = f j)
    (q : A →+* completedHecke F)
    (hq : ∀ j, (completedHecke_eval F j).comp q = f j) :
    q = completedHecke_lift F f hf := by
  sorry

section FiniteTopology
variable (F : ℕᵒᵖ ⥤ CommRingCat)
variable [∀ j, TopologicalSpace (F.obj j)] [∀ j, DiscreteTopology (F.obj j)]
variable [∀ j, Finite (F.obj j)]

/-- The completed Hecke algebra of finite discrete rings is compact. -/
theorem completedHecke_compact : CompactSpace (completedHecke F) := by
  sorry

theorem completedHecke_hausdorff : T2Space (completedHecke F) := by
  sorry

theorem completedHecke_eval_continuous (j : ℕᵒᵖ) :
    Continuous (completedHecke_eval F j) := by
  sorry

theorem completedHecke_eval_surjective
    (hs : ∀ {i j} (g : i ⟶ j), Function.Surjective (F.map g).hom) (j : ℕᵒᵖ) :
    Function.Surjective (completedHecke_eval F j) := by
  sorry

theorem completedHecke_lift_continuous {A : Type} [CommRing A] [TopologicalSpace A]
    (f : ∀ j, A →+* F.obj j)
    (hf : ∀ {i j} (g : i ⟶ j), (F.map g).hom.comp (f i) = f j)
    (hc : ∀ j, Continuous (f j)) :
    Continuous (completedHecke_lift F f hf) := by
  sorry

/-- The abstract Hecke algebra has dense image when it maps onto every finite level. -/
theorem completedHecke_dense {H : Type} [CommRing H]
    (α : (Functor.const ℕᵒᵖ).obj (CommRingCat.of H) ⟶ F)
    (hα : ∀ j, Function.Surjective (α.app j).hom) :
    DenseRange (completedHecke_lift F (fun j => (α.app j).hom) (fun {i j} g => by
      have := α.naturality g
      simp only [Functor.const_obj_obj, Functor.const_obj_map, Category.id_comp] at this
      rw [this]
      rfl)) := by
  sorry

end FiniteTopology

/-- Restriction along an initial functor identifies the completed Hecke algebras, compatibly with
evaluation. -/
theorem completedHecke_cofinal (F : ℕᵒᵖ ⥤ CommRingCat)
    (ι : ℕᵒᵖ ⥤ ℕᵒᵖ) [Functor.Initial ι] :
    ∃ e : completedHecke F ≃+* completedHecke (ι ⋙ F),
      ∀ (x : completedHecke F) (j : ℕᵒᵖ),
        completedHecke_eval (ι ⋙ F) j (e x) = completedHecke_eval F (ι.obj j) x := by
  sorry

/-- Any such identification is a homeomorphism. -/
theorem completedHecke_cofinal_continuous (F : ℕᵒᵖ ⥤ CommRingCat)
    [∀ j, TopologicalSpace (F.obj j)] [∀ j, DiscreteTopology (F.obj j)]
    (ι : ℕᵒᵖ ⥤ ℕᵒᵖ) [Functor.Initial ι]
    (e : completedHecke F ≃+* completedHecke (ι ⋙ F))
    (he : ∀ (x : completedHecke F) (j : ℕᵒᵖ),
      completedHecke_eval (ι ⋙ F) j (e x) = completedHecke_eval F (ι.obj j) x) :
    letI : ∀ j, TopologicalSpace ((ι ⋙ F).obj j) :=
      fun j => inferInstanceAs (TopologicalSpace (F.obj (ι.obj j)))
    Continuous e ∧ Continuous e.symm := by
  sorry

/-- The coordinatewise action on a supplied compatible-sections module: the completed Hecke
algebra acts, and the action is computed level by level. -/
theorem completedHecke_action {R : Type} [CommRing R]
    (F : ℕᵒᵖ ⥤ CommRingCat) (M : ℕᵒᵖ ⥤ ModuleCat R)
    (act : ∀ j, F.obj j →+* Module.End R (M.obj j))
    (hc : ∀ {i j} (g : i ⟶ j) (t : F.obj i) (x : M.obj i),
      (M.map g).hom (act i t x) = act j ((F.map g).hom t) ((M.map g).hom x)) :
    ∃ φ : completedHecke F →+* Module.End R (ModuleCat.sectionsSubmodule M),
      ∀ (t : completedHecke F) (x : ModuleCat.sectionsSubmodule M) (j : ℕᵒᵖ),
        (φ t x).1 j = act j (t.1 j) (x.1 j) := by
  sorry

/-- An action computed level by level is jointly continuous for the product topologies. -/
theorem completedHecke_action_continuous {R : Type} [CommRing R]
    (F : ℕᵒᵖ ⥤ CommRingCat) (M : ℕᵒᵖ ⥤ ModuleCat R)
    [∀ j, TopologicalSpace (F.obj j)] [∀ j, TopologicalSpace (M.obj j)]
    (act : ∀ j, F.obj j →+* Module.End R (M.obj j))
    (φ : completedHecke F →+* Module.End R (ModuleCat.sectionsSubmodule M))
    (hφ : ∀ (t : completedHecke F) (x : ModuleCat.sectionsSubmodule M) (j : ℕᵒᵖ),
      (φ t x).1 j = act j (t.1 j) (x.1 j))
    (hcont : ∀ j, Continuous (fun z : F.obj j × M.obj j => act j z.1 z.2)) :
    letI : TopologicalSpace (ModuleCat.sectionsSubmodule M) :=
      TopologicalSpace.induced (fun x : ModuleCat.sectionsSubmodule M => fun j => x.1 j)
        (inferInstanceAs (TopologicalSpace (∀ j, M.obj j)))
    Continuous (fun z : completedHecke F × ↥(ModuleCat.sectionsSubmodule M) => φ z.1 z.2) := by
  sorry

/- Test `completedHecke_constant`: a constant diagram has its ring as completed algebra. -/
example (A : Type) [CommRing A] :
    Nonempty (completedHecke ((Functor.const ℕᵒᵖ).obj (CommRingCat.of A)) ≃+* A) := by
  sorry

/-- The diagram of the rings `Z/p^(n+1)` with their quotient maps, a test fixture. -/
def scalarDiagram (p : ℕ) : ℕᵒᵖ ⥤ CommRingCat where
  obj n := CommRingCat.of (ZMod (p ^ (unop n + 1)))
  map {i j} f := CommRingCat.ofHom
    (ZMod.castHom (Nat.pow_dvd_pow p (Nat.add_le_add_right (leOfHom f.unop) 1))
      (ZMod (p ^ (unop j + 1))))
  map_id := by
    intro n; ext x
    simp
  map_comp := by
    intro i j k f g; ext x
    simp only [CommRingCat.hom_comp, CommRingCat.hom_ofHom, RingHom.coe_comp,
      Function.comp_apply]
    exact (RingHom.congr_fun (ZMod.castHom_comp
      (Nat.pow_dvd_pow p (Nat.add_le_add_right (leOfHom g.unop) 1))
      (Nat.pow_dvd_pow p (Nat.add_le_add_right (leOfHom f.unop) 1))) x).symm

/- Test `completedHecke_scalar`: the completed algebra of the scalar diagram is `Z_p`, an inverse
limit, not the image of `Z`. -/
example (p : ℕ) [Fact p.Prime] :
    Nonempty (completedHecke (scalarDiagram p) ≃+* ℤ_[p]) := by
  sorry

example (p : ℕ) [Fact p.Prime] :
    ¬ Function.Surjective (Int.castRingHom ℤ_[p]) := by
  sorry

/- Test `completedHecke_zero`: for the zero complex the image ring has one element and no
maximal ideals. -/
example :
    Subsingleton (completedHecke ((Functor.const ℕᵒᵖ).obj (CommRingCat.of (ZMod 1)))) ∧
    IsEmpty (MaximalSpectrum
      (completedHecke ((Functor.const ℕᵒᵖ).obj (CommRingCat.of (ZMod 1))))) := by
  sorry

/-- Milestone of roadmap 8.11: under surjective transitions with radical kernels the completed
Hecke algebra has finitely many maximal ideals. The radical condition concerns algebraic maximal
ideals; continuity alone would not give it. -/
theorem completedHecke_semilocal (F : ℕᵒᵖ ⥤ CommRingCat)
    [∀ j, Finite (F.obj j)]
    (hs : ∀ {i j} (g : i ⟶ j), Function.Surjective (F.map g).hom)
    (hr : ∀ (j : ℕᵒᵖ),
      RingHom.ker ((F.map ((homOfLE (Nat.zero_le (unop j))).op)).hom) ≤
        Ideal.jacobson (⊥ : Ideal (F.obj j))) :
    Finite (MaximalSpectrum (completedHecke F)) := by
  sorry

/-- The algebraic product decomposition into local factors (roadmap 8.11); the inverse-limit
topology of the factors is a further roadmap statement. -/
theorem completedHecke_decomposition (F : ℕᵒᵖ ⥤ CommRingCat)
    [∀ j, Finite (F.obj j)]
    (hs : ∀ {i j} (g : i ⟶ j), Function.Surjective (F.map g).hom)
    (hr : ∀ (j : ℕᵒᵖ),
      RingHom.ker ((F.map ((homOfLE (Nat.zero_le (unop j))).op)).hom) ≤
        Ideal.jacobson (⊥ : Ideal (F.obj j))) :
    Nonempty (completedHecke F ≃+*
      ∀ m : MaximalSpectrum (completedHecke F), Localization.AtPrime m.asIdeal) := by
  sorry

/-! ## Layer 8: compatible residual projectors -/

/-- A compatible family of finite idempotents is an element of the completed Hecke algebra
(roadmap 8.12). Its residual label comes from the semilocal decomposition. -/
def residualProjector (F : ℕᵒᵖ ⥤ CommRingCat) (e : ∀ j, F.obj j)
    (he : ∀ {i j} (g : i ⟶ j), (F.map g).hom (e i) = e j) : completedHecke F :=
  ⟨e, by exact he⟩

theorem residualProjector_eval (F : ℕᵒᵖ ⥤ CommRingCat) (e : ∀ j, F.obj j)
    (he : ∀ {i j} (g : i ⟶ j), (F.map g).hom (e i) = e j) (j : ℕᵒᵖ) :
    completedHecke_eval F j (residualProjector F e he) = e j := by
  sorry

theorem residualProjector_unique (F : ℕᵒᵖ ⥤ CommRingCat) (e : ∀ j, F.obj j)
    (he : ∀ {i j} (g : i ⟶ j), (F.map g).hom (e i) = e j) (x : completedHecke F)
    (hx : ∀ j, completedHecke_eval F j x = e j) :
    x = residualProjector F e he := by
  sorry

theorem residualProjector_relations (F : ℕᵒᵖ ⥤ CommRingCat)
    {L : Type} [Fintype L] (e : ∀ l j, F.obj j)
    (he : ∀ l {i j} (g : i ⟶ j), (F.map g).hom (e l i) = e l j)
    (hi : ∀ l j, IsIdempotentElem (e l j))
    (ho : ∀ l l', l ≠ l' → ∀ j, e l j * e l' j = 0)
    (h1 : ∀ j, ∑ l : L, e l j = 1) :
    (∀ l, IsIdempotentElem (residualProjector F (e l) (he l))) ∧
    (∀ l l', l ≠ l' → residualProjector F (e l) (he l) *
      residualProjector F (e l') (he l') = 0) ∧
    (∑ l : L, residualProjector F (e l) (he l)) = 1 := by
  sorry

/-- The factor cut out by an idempotent supported at exactly one maximal ideal is the
localisation there. -/
theorem residualProjector_factor {T : Type} [CommRing T] (e : T)
    (he : IsIdempotentElem e) (m : MaximalSpectrum T)
    (hsupport : ∀ n : MaximalSpectrum T, e ∈ n.asIdeal ↔ n ≠ m) :
    Nonempty ((T ⧸ Ideal.span ({1 - e} : Set T)) ≃+* Localization.AtPrime m.asIdeal) := by
  sorry

/- Test `residualProjector_product`: the constructor on the product of two copies of `O`. -/
example (O : Type) [CommRing O] :
    let F := (Functor.const ℕᵒᵖ).obj (CommRingCat.of (O × O))
    completedHecke_eval F (op 0)
      (residualProjector F (fun _ => (1, 0)) (by intro i j g; rfl)) = (1, 0) ∧
    completedHecke_eval F (op 0)
      (residualProjector F (fun _ => (0, 1)) (by intro i j g; rfl)) = (0, 1) := by
  sorry

/- Test `residualProjector_local`: the compatible identity projectors give `1`. -/
example (F : ℕᵒᵖ ⥤ CommRingCat) :
    residualProjector F (fun _ => 1) (by intro i j g; exact map_one _) = 1 := by
  sorry

/-- The ring of pairs congruent modulo `I`, a test fixture for congruent characters. -/
def congruenceSubring {O : Type} [CommRing O] (I : Ideal O) : Subring (O × O) where
  carrier := {x | x.1 - x.2 ∈ I}
  mul_mem' := by
    intro a b ha hb
    have : a.1 * b.1 - a.2 * b.2 = a.1 * (b.1 - b.2) + (a.1 - a.2) * b.2 := by ring
    simp only [Set.mem_ofPred_eq, Prod.fst_mul, Prod.snd_mul, this]
    exact I.add_mem (I.mul_mem_left _ hb) (I.mul_mem_right _ ha)
  one_mem' := by simp
  add_mem' := by
    intro a b ha hb
    have : a.1 + b.1 - (a.2 + b.2) = (a.1 - a.2) + (b.1 - b.2) := by ring
    simp only [Set.mem_ofPred_eq, Prod.fst_add, Prod.snd_add, this]
    exact I.add_mem ha hb
  zero_mem' := by simp
  neg_mem' := by
    intro a ha
    have : -a.1 - -a.2 = -(a.1 - a.2) := by ring
    simp only [Set.mem_ofPred_eq, Prod.fst_neg, Prod.snd_neg, this]
    exact I.neg_mem ha

/- Test `residualProjector_congruent_characters`: for `I = (varpi)` in a discrete valuation ring
the pair `(1, 0)` is not congruent, so the congruence ring has no splitting idempotent. -/
example {O : Type} [CommRing O] (I : Ideal O) (hI : I ≠ ⊤) :
    ((1, 0) : O × O) ∉ congruenceSubring I := by
  sorry

/-! ## Layer 8: residual localisation as the range of a continuous idempotent

`P` is meant to be the action of an actual residual projector; this is not an abstract
localisation at an arbitrary ideal. -/

section Localization
variable {R M N : Type} [CommRing R]
variable [AddCommGroup M] [Module R M] [TopologicalSpace M] [IsTopologicalAddGroup M]
variable [AddCommGroup N] [Module R N] [TopologicalSpace N] [IsTopologicalAddGroup N]

/-- The residual localisation of roadmap 8.13: the range of a continuous idempotent. -/
abbrev completedLocalization (P : M →L[R] M) := ↥P.range

abbrev completedLocalization_inclusion (P : M →L[R] M) :
    completedLocalization P →L[R] M := P.range.subtypeL

abbrev completedLocalization_projection (P : M →L[R] M) :
    M →L[R] completedLocalization P := P.rangeRestrict

theorem completedLocalization_split (P : M →L[R] M) (hP : IsIdempotentElem P) :
    (completedLocalization_projection P).comp (completedLocalization_inclusion P) =
      ContinuousLinearMap.id R (completedLocalization P) ∧
    (completedLocalization_inclusion P).comp (completedLocalization_projection P) = P := by
  sorry

theorem completedLocalization_fixed (P : M →L[R] M) (hP : IsIdempotentElem P) (x : M) :
    x ∈ P.range ↔ P x = x := by
  sorry

theorem completedLocalization_closed [T1Space M]
    (P : M →L[R] M) (hP : IsIdempotentElem P) : IsClosed (P.range : Set M) := by
  sorry

/-- A continuous map intertwining two idempotents maps one range into the other. -/
def completedLocalization_map (P : M →L[R] M) (Q : N →L[R] N)
    (f : M →L[R] N) (hf : f.comp P = Q.comp f) :
    completedLocalization P →L[R] completedLocalization Q :=
  (f.comp (completedLocalization_inclusion P)).codRestrict Q.range (by
    rintro ⟨_, y, rfl⟩
    exact ⟨f y, by simpa using (congrArg (fun φ => φ y) hf).symm⟩)

theorem completedLocalization_map_id (P : M →L[R] M) :
    completedLocalization_map P P (ContinuousLinearMap.id R M) (by simp) =
      ContinuousLinearMap.id R (completedLocalization P) := by
  sorry

theorem completedLocalization_map_comp
    {K : Type} [AddCommGroup K] [Module R K] [TopologicalSpace K] [IsTopologicalAddGroup K]
    (P : M →L[R] M) (Q : N →L[R] N) (S : K →L[R] K)
    (f : M →L[R] N) (g : N →L[R] K)
    (hf : f.comp P = Q.comp f) (hg : g.comp Q = S.comp g) :
    completedLocalization_map P S (g.comp f) (by
      rw [ContinuousLinearMap.comp_assoc, hf, ← ContinuousLinearMap.comp_assoc, hg,
        ContinuousLinearMap.comp_assoc]) =
      (completedLocalization_map Q S g hg).comp
        (completedLocalization_map P Q f hf) := by
  sorry

/- Test `completedLocalization_zero`. -/
example : Subsingleton (completedLocalization (0 : M →L[R] M)) := by
  sorry

/- Test `completedLocalization_one`. -/
example : Nonempty (completedLocalization (ContinuousLinearMap.id R M) ≃L[R] M) := by
  sorry

/-- The projection to the first factor, a test fixture. -/
def firstProjector (O : Type) [CommRing O] [TopologicalSpace O]
    [IsTopologicalRing O] : (O × O) →L[O] (O × O) :=
  { toLinearMap :=
    { toFun := fun x => (x.1, 0)
      map_add' := by intro x y; simp
      map_smul' := by intro r x; simp }
    cont := by fun_prop }

/- Test `completedLocalization_product`. -/
example (O : Type) [CommRing O] [Nontrivial O] [TopologicalSpace O]
    [IsTopologicalRing O] :
    ((1, 0) : O × O) ∈ Set.range (completedLocalization_inclusion (firstProjector O)) ∧
    ((0, 1) : O × O) ∉ Set.range (completedLocalization_inclusion (firstProjector O)) := by
  sorry

end Localization

theorem completedLocalization_complete {R M : Type} [CommRing R]
    [AddCommGroup M] [Module R M] [UniformSpace M] [IsUniformAddGroup M]
    [T2Space M] [CompleteSpace M] (P : M →L[R] M) (hP : IsIdempotentElem P) :
    CompleteSpace (completedLocalization P) := by
  sorry

/-- Under the supported-label hypothesis the algebraic localisation agrees with the residual
image; no new topology is put on an algebraic tensor localisation. -/
theorem completedLocalization_algebraic {T M : Type} [CommRing T]
    [AddCommGroup M] [Module T M] [TopologicalSpace M] [IsTopologicalAddGroup M]
    [ContinuousConstSMul T M] (e : T) (he : IsIdempotentElem e)
    (m : MaximalSpectrum T)
    (hsupport : ∀ n : MaximalSpectrum T, e ∈ n.asIdeal ↔ n ≠ m) :
    Nonempty (LocalizedModule m.asIdeal.primeCompl M ≃ₗ[T]
      LinearMap.range (e • LinearMap.id : M →ₗ[T] M)) := by
  sorry

/-! ## Layer 8: residual localisation through the coefficient limit -/

section LocalizationLimit
variable {R : Type} [CommRing R] [TopologicalSpace R]
variable (F : ℕᵒᵖ ⥤ TopModuleCat R) (P : End F)

/-- The diagram of ranges of a supplied natural projector. -/
def projectorRangeDiagram : ℕᵒᵖ ⥤ TopModuleCat R where
  obj j := TopModuleCat.of R (P.app j).hom.range
  map {i j} g := TopModuleCat.ofHom
    (((F.map g).hom.comp (P.app i).hom.range.subtypeL).codRestrict
      (P.app j).hom.range (by
        rintro ⟨_, y, rfl⟩
        exact ⟨(F.map g).hom y, by simp⟩))
  map_id := by intro j; ext x; simp
  map_comp := by intro i j k f g; ext x; simp

/-- Milestone of roadmap 8.14: localisation commutes with the coefficient limit. -/
theorem completedLocalization_limit (hP : IsIdempotentElem P) :
    ∃ e : completedLocalization (limMap P).hom ≃L[R] ↥(limit (projectorRangeDiagram F P)),
      ∀ (x : completedLocalization (limMap P).hom) (j : ℕᵒᵖ),
        (((limit.π (projectorRangeDiagram F P) j).hom (e x)).1 : F.obj j) =
          (limit.π F j).hom (x : ↥(limit F)) := by
  sorry

end LocalizationLimit

/-! ## Targets stated only in the roadmap document

Their carriers are not at the pins. The names below are those the roadmap gives them.

* Layer 0: the arithmetic level index, the coherent tower, conjugation and tame coherence, the
  non-neat realisation, the acceptance towers, the finite étale–Betti comparison and the trace
  and orientation comparison.
* Layers 1–3: the arithmetic instances of `torsionColimit` and `coefficientLimit`, the derived
  completed tower and its Milnor sequence, strict integral control, clauses (2)–(4) of
  `homology_equiv_limit_of_complete_torsionFree`, the Bockstein and completion–Tate comparisons,
  the unitary Banach completion, the continuous duals with their topologies, completed homology
  and its O[[K_0]]-action, `completedHomology_equiv_limit_finite`, the integral dualities, the
  tame-level modules `TameCompleted` with `tameBorelMooreDuality`, admissible complexes and the
  coefficient-module dualities.
* Layers 4–7: the lifted cellular tower, the completed chain complex and its perfectness,
  derived coinvariants, `integralCochainModel` and `completedCohomology_coeff_equiv`, the
  finiteness, torsion, admissibility and dimension theorems, completed descent, classical
  evaluation, the derived analytic comparison, the derived support triangle, completed interior
  cohomology and completed Iwasawa–Poincaré duality.
* Layer 8: `modularCompletedComparison`, `siegelCompletedComparison`,
  `unitaryCompletedComparison`, `hilbertCompletedComparison`,
  `definiteUnitaryDegreeZeroComparison`, `scholzeFixedExponentComparison`, the arithmetic
  instance of `derivedHeckeDiagram`, residual support at a pro-p level,
  `completedLocalization_levelColimit`, `completedLocalization_supportTriangle`,
  `completedLocalization_dual` and `derivedCohomologicalResidualComparison`, together with the
  canonical-model, Hilbert and central-quotient inputs.
-/

end TauCeti.CompletedCohomology
