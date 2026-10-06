/-
Suggested Lean forms for Lefschetz pencils, nearby cycles and vanishing cycles, LPV.0–6.

This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/LefschetzPencilsAndVanishingCycles--LPV.0.md is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names and
signatures. Names and test comments alone do not establish agreement with the packet.
No implementation is claimed; implementationStatus remains unchecked.

Independent review REV-LefschetzPencilsAndVanishingCycles--LPV.0 requires revision:
several prototypes below omit hypotheses essential to their conclusions, and some test
bodies do not express the examples in their comments. See the review report and the
packet's G-review-* gaps. These forms have not been accepted as sound specifications.

Pinned baseline: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

The actual small étale sheaf and derived categories, scheme fibres, linear maps, submodules,
quotients, quadratic forms and representation invariants are used. Missing supplier conditions
are stated in the packet and explicitly omitted from the affected prototypes, not represented
by uninterpreted Prop fields. Supplied functors, geometric models and t-structures occur as
parameters of the actual existing categories. Continuity/constructibility and a coherent derived
Galois action await their owners; Action here records the underlying algebraic action.
The gluing prototype is over a strictly henselian residue field; full residue-Galois descent is
imported from PR196. Derived gluing records the underlying diagram; its enhancement is E0.
All nontrivial proposed proofs are admitted. The preserved elementary calculations are tests
of signs and linear algebra, not a proof of a geometric theorem.
-/

import Mathlib.AlgebraicGeometry.Sites.AffineEtale
import Mathlib.AlgebraicGeometry.Fiber
import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.Algebra.Homology.DerivedCategory.TStructure
import Mathlib.CategoryTheory.Triangulated.TStructure.Heart
import Mathlib.CategoryTheory.Sites.ConstantSheaf
import Mathlib.CategoryTheory.Action.Basic
import Mathlib.CategoryTheory.Comma.Basic
import Mathlib.CategoryTheory.Category.Preorder
import Mathlib.RepresentationTheory.Invariants
import Mathlib.RepresentationTheory.FDRep
import Mathlib.LinearAlgebra.Trace
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.TensorProduct.Tower
import Mathlib.Algebra.Homology.ShortComplex.Exact
import Mathlib.RingTheory.Valuation.RamificationGroup
import Mathlib.RingTheory.Henselian
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.LinearAlgebra.CliffordAlgebra.Even
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.MvPowerSeries.Basic
import TauCeti.AlgebraicGeometry.Fibers
import TauCeti.RingTheory.Nilpotent.Exp
import TauCeti.LinearAlgebra.GeneralLinearGroup.Unipotent
import Mathlib.LinearAlgebra.Transvection.Basic
import Mathlib.LinearAlgebra.BilinearForm.Orthogonal
import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.Algebra.Lie.SkewAdjoint
import Mathlib.Algebra.Lie.Semisimple.Defs
import Mathlib.Algebra.Lie.Subalgebra
import Mathlib.Algebra.CharP.Lemmas
import Mathlib.Tactic.Ring
import Mathlib.LinearAlgebra.QuadraticForm.Radical
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.ZMod.Basic
import Mathlib.Algebra.Field.ZMod
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.LinearAlgebra.QuadraticForm.TensorProduct
import Mathlib.AlgebraicGeometry.Morphisms.Flat
import Mathlib.CategoryTheory.Triangulated.Pretriangulated
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.Algebra.Algebra.Rat
import Mathlib.Algebra.Category.ModuleCat.Abelian

set_option autoImplicit false

noncomputable section

local instance : Fact (Nat.Prime 2) := ⟨by decide⟩

open CategoryTheory CategoryTheory.Limits CategoryTheory.Triangulated CategoryTheory.Pretriangulated AlgebraicGeometry
open scoped TensorProduct

namespace TauCeti.AlgebraicGeometry.VanishingCycles

/- LPV.0. These use the actual sheaf category and its standard derived localization.
Constructible/adic subcategories and continuous actions are omitted supplier conditions. -/
abbrev EtaleSheaf (X : Scheme.{0}) (Λ : Type) [Ring Λ] :=
  Sheaf X.smallEtaleTopology (ModuleCat Λ)

instance (X : Scheme.{0}) (Λ : Type) [Ring Λ] : HasDerivedCategory (EtaleSheaf X Λ) :=
  HasDerivedCategory.standard _

instance (Λ : Type) [Ring Λ] : HasDerivedCategory (ModuleCat Λ) :=
  HasDerivedCategory.standard _

abbrev EtaleD (X : Scheme.{0}) (Λ : Type) [Ring Λ] := DerivedCategory (EtaleSheaf X Λ)

def constantComplex (X : Scheme.{0}) (Λ : Type) [CommRing Λ] : EtaleD X Λ :=
  (DerivedCategory.singleFunctor (EtaleSheaf X Λ) 0).obj
    ((CategoryTheory.constantSheaf X.smallEtaleTopology (ModuleCat Λ)).obj (ModuleCat.of Λ Λ))

structure HenselianTrait where
  R : Type
  [ring : CommRing R]
  [domain : IsDomain R]
  [dvr : IsDiscreteValuationRing R]
  [henselian : HenselianLocalRing R]
  K : Type
  [field : Field K]
  [algebra : Algebra R K]
  [fraction : IsFractionRing R K]
  valuation : ValuationSubring (AlgebraicClosure K)
  extendsBase : valuation.toSubring.comap (algebraMap K (AlgebraicClosure K)) =
    (⊤ : Subring R).map (algebraMap R K)

attribute [instance] HenselianTrait.ring HenselianTrait.domain HenselianTrait.dvr
  HenselianTrait.henselian HenselianTrait.field HenselianTrait.algebra HenselianTrait.fraction

namespace HenselianTrait
abbrev inertia (S : HenselianTrait) := S.valuation.inertiaSubgroup S.K
-- Full residue-Galois surjectivity is omitted: this is its exact kernel component.
theorem inertia_exact (S : HenselianTrait) : S.inertia =
    MonoidHom.ker (MulSemiringAction.toRingAut (S.valuation.decompositionSubgroup S.K)
      (IsLocalRing.ResidueField S.valuation)) := by sorry
abbrev genericFiber (S : HenselianTrait) {X : Scheme.{0}} (f : X ⟶ Spec (.of S.R)) :=
  TauCeti.genericFiber S.R S.K f
abbrev specialFiber (S : HenselianTrait) {X : Scheme.{0}} (f : X ⟶ Spec (.of S.R)) :=
  TauCeti.specialFiber S.R f
end HenselianTrait

def trivialActionFunctor (C : Type*) [Category C] (I : Type*) [Group I] : C ⥤ Action C I where
  obj X := Action.trivial I X
  map f := { hom := f, comm := by sorry }

abbrev OrientedFibreTopos (C : Type*) [Category C] (I : Type*) [Group I] :=
  Comma (trivialActionFunctor C I) (𝟭 (Action C I))

namespace OrientedFibreTopos
variable {C : Type*} [Category C] {I : Type*} [Group I]
def sp_pullback : C ⥤ OrientedFibreTopos C I where
  obj X := ⟨X, Action.trivial I X, 𝟙 _⟩
  map f := { left := f, right := { hom := f, comm := by sorry }, w := by sorry }
abbrev etaPart : OrientedFibreTopos C I ⥤ Action C I := Comma.snd _ _
-- Omitted: continuity and the residue-Galois descent part of PR196.
def equivSheavesOnTrait (S : HenselianTrait) (Λ : Type) [Ring Λ] :
    EtaleSheaf (Spec (.of S.R)) Λ ≌ OrientedFibreTopos (ModuleCat Λ) S.inertia := by sorry
end OrientedFibreTopos

section Gluing
variable {Λ : Type} [Ring Λ] {I : Type*} [Group I]
variable (A : OrientedFibreTopos (ModuleCat Λ) I)
-- coker(sp) is the degree-zero model of the vanishing object. It is not coker(σ−1).
def variation (σ : I) : cokernel A.hom.hom ⟶ A.right.V := by sorry
def quotientInertia (σ : I) : cokernel A.hom.hom ⟶ cokernel A.hom.hom := by sorry
theorem variation_left (σ : I) : cokernel.π A.hom.hom ≫ variation A σ =
    (A.right.ρ σ - 1 : End A.right.V) := by sorry
theorem variation_right (σ : I) : variation A σ ≫ cokernel.π A.hom.hom =
    quotientInertia A σ - 𝟙 _ := by sorry
theorem variation_mul (σ τ : I) : variation A (σ * τ) =
    variation A τ ≫ cokernel.π A.hom.hom ≫ variation A σ +
      variation A σ + variation A τ := by sorry
theorem variation_wellDefined (σ : I) :
    A.hom.hom ≫ ((A.right.ρ σ - 1 : End A.right.V)) = 0 := by sorry
end Gluing

section GeometricCycles
variable (S : HenselianTrait) {X : Scheme.{0}} (f : X ⟶ Spec (.of S.R))
variable (Λ : Type) [CommRing Λ]
-- Geometric scalar extensions use algebraic closures, not rational fibres.
abbrev geometricGeneric : Scheme.{0} :=
  pullback f (Spec.map (CommRingCat.ofHom
    ((algebraMap S.K (AlgebraicClosure S.K)).comp (algebraMap S.R S.K))))
abbrev geometricSpecial : Scheme.{0} :=
  pullback f (Spec.map (CommRingCat.ofHom
    ((algebraMap (IsLocalRing.ResidueField S.R)
      (AlgebraicClosure (IsLocalRing.ResidueField S.R))).comp
        (algebraMap S.R (IsLocalRing.ResidueField S.R)))))

def psiEta : EtaleSheaf (S.genericFiber f).left Λ ⥤
    Action (EtaleSheaf (geometricSpecial S f) Λ) S.inertia := by sorry
def psi : EtaleSheaf X Λ ⥤
    OrientedFibreTopos (EtaleSheaf (geometricSpecial S f) Λ) S.inertia := by sorry
theorem psi_leftExact : PreservesFiniteLimits (psi S f Λ) := by sorry
-- The actual direct-image functors are supplied by PR196. Their geometric square is omitted.
def psi_pushforward {Y : Scheme.{0}} (g : Y ⟶ Spec (.of S.R))
    (push : EtaleSheaf X Λ ⥤ EtaleSheaf Y Λ)
    (pushGlue : OrientedFibreTopos (EtaleSheaf (geometricSpecial S f) Λ) S.inertia ⥤
      OrientedFibreTopos (EtaleSheaf (geometricSpecial S g) Λ) S.inertia) :
    push ⋙ psi S g Λ ≅ psi S f Λ ⋙ pushGlue := by sorry

def RPsi : EtaleD X Λ ⥤ OrientedFibreTopos (EtaleD (geometricSpecial S f) Λ) S.inertia := by sorry
def RPhi : EtaleD X Λ ⥤ Action (EtaleD (geometricSpecial S f) Λ) S.inertia := by sorry
def vanishingTriangle (K : EtaleD X Λ) : Triangle (EtaleD (geometricSpecial S f) Λ) := by sorry
-- The Milnor tube and its cohomology/stalk functors are supplied by the site's owner.
def RPsi_stalk (K : EtaleD X Λ)
    (stalk : EtaleD (geometricSpecial S f) Λ ⥤ DerivedCategory (ModuleCat Λ))
    (milnorCohomology : DerivedCategory (ModuleCat Λ)) :
    stalk.obj ((RPsi S f Λ).obj K).right.V ≅ milnorCohomology := by sorry
-- Local acyclicity and the locally constant cohomology condition cannot yet be stated. Only the smooth constant-coefficient specialization
-- is prototyped; the coefficient object K must be the supplied constant complex.
theorem RPhi_eq_zero_iff_locallyAcyclic [Smooth f] :
    IsZero ((RPhi S f Λ).obj (constantComplex X Λ)).V := by sorry
end GeometricCycles

/- LPV.1: finite logarithm, kernel-image filtration, maximal unipotence. -/
section LinearMonodromy
variable {K V : Type*} [Field K] [CharZero K] [AddCommGroup V] [Module K V]
variable [FiniteDimensional K V]
variable [Algebra ℚ (Module.End K V)]
def finiteLog (U : Module.End K V) (d : ℕ) : Module.End K V :=
  ∑ j ∈ Finset.Ico 1 d, ((-1 : K) ^ (j + 1) / (j : K)) • U ^ j
theorem finiteLog_bound_independent (U : Module.End K V) {d e : ℕ}
    (hd : U ^ d = 0) (he : U ^ e = 0) : finiteLog U d = finiteLog U e := by sorry
theorem finiteLog_nilpotent (U : Module.End K V) {d : ℕ} (hd : U ^ d = 0) :
    IsNilpotent (finiteLog U d) := by sorry
theorem finiteLog_exp (U : Module.End K V) {d : ℕ} (hd : U ^ d = 0) :
    IsNilpotent.exp (finiteLog U d) = 1 + U := by sorry
-- Tate twists and geometric inertia are omitted. This is the scalar identity they use.
theorem finiteLog_twisted (N : Module.End K V) (d : ℕ) (hN : N ^ d = 0) (t : K) :
    finiteLog (IsNilpotent.exp (t • N) - 1) d = t • N := by sorry

theorem finiteLog_conj (e : V ≃ₗ[K] V) (U : Module.End K V) (d : ℕ) :
    finiteLog (e.toLinearMap * U * e.symm.toLinearMap) d =
      e.toLinearMap * finiteLog U d * e.symm.toLinearMap := by sorry

def monodromyFiltration (N : Module.End K V) (c i : ℤ) : Submodule K V :=
  ⨆ a : ℕ, ⨆ b : ℕ, ⨆ (_ : (a : ℤ) - b = i - c),
    LinearMap.ker (N ^ (a + 1)) ⊓ LinearMap.range (N ^ b)
abbrev Gr (M : ℤ → Submodule K V) (i : ℤ) :=
  M i ⧸ (M (i - 1)).comap (M i).subtype
theorem monodromyFiltration_mono (N : Module.End K V) (hN : IsNilpotent N) (c : ℤ) :
    Monotone (monodromyFiltration N c) ∧
      ∃ a b : ℤ, monodromyFiltration N c a = ⊥ ∧ monodromyFiltration N c b = ⊤ := by sorry
theorem monodromyFiltration_lowering (N : Module.End K V) (hN : IsNilpotent N) (c i : ℤ) :
    (monodromyFiltration N c i).map N ≤ monodromyFiltration N c (i - 2) := by sorry
def monodromyGradedPower (N : Module.End K V) (hN : IsNilpotent N) (c : ℤ) (r : ℕ) :
    Gr (monodromyFiltration N c) (c + r) →ₗ[K]
      Gr (monodromyFiltration N c) (c - r) := by sorry
theorem monodromyGradedPower_bijective (N : Module.End K V) (hN : IsNilpotent N)
    (c : ℤ) (r : ℕ) : Function.Bijective (monodromyGradedPower N hN c r) := by sorry
theorem monodromyFiltration_scalar (N : Module.End K V) (c : ℤ) {a : K} (ha : a ≠ 0) :
    monodromyFiltration (a • N) c = monodromyFiltration N c := by sorry
theorem monodromyFiltration_conj (e : V ≃ₗ[K] V) (N : Module.End K V) (c i : ℤ) :
    (monodromyFiltration N c i).map e.toLinearMap =
      monodromyFiltration (e.toLinearMap * N * e.symm.toLinearMap) c i := by sorry
def gradedN (N : Module.End K V) (hN : IsNilpotent N) (c i : ℤ) :
    Gr (monodromyFiltration N c) i →ₗ[K] Gr (monodromyFiltration N c) (i - 2) := by sorry
def primitivePart (N : Module.End K V) (hN : IsNilpotent N) (c i : ℤ) :=
  LinearMap.ker (gradedN N hN c i)

def IsMaximallyNilpotent (N : Module.End K V) : Prop :=
  0 < Module.finrank K V ∧ N ^ Module.finrank K V = 0 ∧
    N ^ (Module.finrank K V - 1) ≠ 0
def IsMaximallyUnipotent (T : V ≃ₗ[K] V) : Prop :=
  IsMaximallyNilpotent (T.toLinearMap - 1)
theorem maximalLog_iff (T : V ≃ₗ[K] V) (d : ℕ) (h : (T.toLinearMap - 1) ^ d = 0) :
    IsMaximallyUnipotent T ↔ IsMaximallyNilpotent (finiteLog (T.toLinearMap - 1) d) := by sorry
theorem maximalNilpotent_kernel_rank (N : Module.End K V) (h : IsMaximallyNilpotent N) (j : ℕ) :
    Module.finrank K (LinearMap.ker (N ^ j)) = min j (Module.finrank K V) := by sorry
theorem maximalNilpotent_conj (e : V ≃ₗ[K] V) (N : Module.End K V) :
    IsMaximallyNilpotent (e.toLinearMap * N * e.symm.toLinearMap) ↔
      IsMaximallyNilpotent N := by sorry
end LinearMonodromy

section Trace
variable {K V : Type*} [Field K] [CharZero K] [AddCommGroup V] [Module K V]
variable [FiniteDimensional K V] {I : Type*} [Group I] [Fintype I]
-- One finite-inertia graded piece. The full complex sums these traces with degree signs.
def inertiaTrace (ρ : Representation K I V) (F : Module.End K V)
    (hF : ∀ v ∈ ρ.invariants, F v ∈ ρ.invariants) : K :=
  LinearMap.trace K _ (F.restrict hF)
-- Refinement through an equivariant isomorphism; exact filtrations require E0's enhancement.
theorem inertiaTrace_refinement (ρ : Representation K I V) (F : Module.End K V)
    (hF : ∀ v ∈ ρ.invariants, F v ∈ ρ.invariants) :
    inertiaTrace ρ F hF = LinearMap.trace K _ (F.restrict hF) := by sorry
theorem inertiaTrace_additive (ρ : Representation K I V) (F G : Module.End K V)
    (hF : ∀ v ∈ ρ.invariants, F v ∈ ρ.invariants)
    (hG : ∀ v ∈ ρ.invariants, G v ∈ ρ.invariants)
    (hFG : ∀ v ∈ ρ.invariants, (F + G) v ∈ ρ.invariants) :
    inertiaTrace ρ (F + G) hFG = inertiaTrace ρ F hF + inertiaTrace ρ G hG := by sorry
theorem inertiaTrace_frobeniusLift (ρ : Representation K I V) (F : Module.End K V)
    (hF : ∀ v ∈ ρ.invariants, F v ∈ ρ.invariants) (g : I)
    (hFg : ∀ v ∈ ρ.invariants, (F * ρ g) v ∈ ρ.invariants) :
    inertiaTrace ρ (F * ρ g) hFg = inertiaTrace ρ F hF := by sorry
end Trace

-- A finite-inertia graded cohomology piece is an actual finite-dimensional module with
-- an action, a Frobenius endomorphism preserving its invariants, and its cohomological degree.
structure FiniteInertiaPiece (K : Type) [Field K] where
  V : Type
  [add : AddCommGroup V]
  [module : Module K V]
  [finite : FiniteDimensional K V]
  I : Type
  [group : Group I]
  [fintype : Fintype I]
  rho : Representation K I V
  frobenius : Module.End K V
  preserves : ∀ v ∈ rho.invariants, frobenius v ∈ rho.invariants
  degree : ℤ
attribute [instance] FiniteInertiaPiece.add FiniteInertiaPiece.module FiniteInertiaPiece.finite
  FiniteInertiaPiece.group FiniteInertiaPiece.fintype

def semisimpleTrace {K : Type} [Field K] [CharZero K] (pieces : List (FiniteInertiaPiece K)) : K :=
  (pieces.map fun P => (-1 : K) ^ P.degree * inertiaTrace P.rho P.frobenius P.preserves).sum

-- Concrete graded lines used by the trace examples, with genuinely trivial finite inertia.
def trivialGradedLine (a : ℚ) (degree : ℤ) : FiniteInertiaPiece ℚ where
  V := ℚ
  I := Unit
  rho := Representation.trivial ℚ Unit ℚ
  frobenius := a • 1
  preserves := by sorry
  degree := degree
-- Omitted: these are the finite-inertia pieces of two admissible filtrations of the same
-- cohomology representation, with a genuine common exact refinement.
theorem semisimpleTrace_refinement {K : Type} [Field K] [CharZero K]
    (pieces refined : List (FiniteInertiaPiece K)) : semisimpleTrace pieces = semisimpleTrace refined := by sorry
-- The equivariant distinguished triangle is actual; the identification of its three lists
-- with the admissible cohomological gradings is an omitted supplier condition.
theorem semisimpleTrace_additive {K : Type} [Field K] [CharZero K]
    (T : Triangle (DerivedCategory (ModuleCat K))) (hT : T ∈ distTriang _)
    (A B C : List (FiniteInertiaPiece K)) : semisimpleTrace B = semisimpleTrace A + semisimpleTrace C := by sorry

def changeFrobenius {K : Type} [Field K] (P : FiniteInertiaPiece K) (g : P.I) : FiniteInertiaPiece K :=
  { P with frobenius := P.frobenius * P.rho g, preserves := by sorry }
theorem semisimpleTrace_frobeniusLift {K : Type} [Field K] [CharZero K]
    (P : FiniteInertiaPiece K) (g : P.I) :
    semisimpleTrace [changeFrobenius P g] = semisimpleTrace [P] := by sorry

section TwoComponents
variable {X : Scheme.{0}} {Λ : Type} [CommRing Λ]
-- The objects and restriction/Gysin maps are supplied by PR196/EDC. Their geometric
-- hypotheses and the filtered derived enhancement are omitted, not stored as opaque Props.
def twoComponentNearbyComplex (C D₁ D₂ : EtaleD X Λ)
    (restriction₁ : D₁ ⟶ C) (restriction₂ : D₂ ⟶ C)
    (gysin₁ : C ⟶ D₁⟦(2 : ℤ)⟧) (gysin₂ : C ⟶ D₂⟦(2 : ℤ)⟧) :
    ℤ ⥤ EtaleD X Λ := by sorry
theorem twoComponentNearbyComplex_grades (filtered : ℤ ⥤ EtaleD X Λ)
    (graded : (ℤ ⥤ EtaleD X Λ) ⥤ (ℤ ⥤ EtaleD X Λ))
    (C D₁ D₂ : EtaleD X Λ) (twist : EtaleD X Λ ⥤ EtaleD X Λ) :
    Nonempty ((graded.obj filtered).obj 1 ≅ (twist.obj C)⟦(-1 : ℤ)⟧) ∧
    Nonempty ((graded.obj filtered).obj 0 ≅ (D₁ ⊞ D₂)) ∧
    Nonempty ((graded.obj filtered).obj (-1) ≅ C⟦(-1 : ℤ)⟧) := by sorry
-- The monodromy map is attached to the two-component model. Coherent filtered descent,
-- and its identification with the identity on the outer grades, are E0 supplier conditions.
def twoComponentN (C D₁ D₂ : EtaleD X Λ)
    (r₁ : D₁ ⟶ C) (r₂ : D₂ ⟶ C)
    (g₁ : C ⟶ D₁⟦(2 : ℤ)⟧) (g₂ : C ⟶ D₂⟦(2 : ℤ)⟧)
    (twist : EtaleD X Λ ⥤ EtaleD X Λ) :
    (twoComponentNearbyComplex C D₁ D₂ r₁ r₂ g₁ g₂).obj 2 ⟶
      twist.obj ((twoComponentNearbyComplex C D₁ D₂ r₁ r₂ g₁ g₂).obj 2) := by sorry
theorem twoComponentNearbyComplex_monodromy (C D₁ D₂ : EtaleD X Λ)
    (r₁ : D₁ ⟶ C) (r₂ : D₂ ⟶ C)
    (g₁ : C ⟶ D₁⟦(2 : ℤ)⟧) (g₂ : C ⟶ D₂⟦(2 : ℤ)⟧)
    (twist : EtaleD X Λ ⥤ EtaleD X Λ) :
    twoComponentN C D₁ D₂ r₁ r₂ g₁ g₂ twist ≫
      twist.map (twoComponentN C D₁ D₂ r₁ r₂ g₁ g₂ twist) = 0 := by sorry
def twoComponentNearbyComplex_resolves (filtered : ℤ ⥤ EtaleD X Λ)
    (realize : (ℤ ⥤ EtaleD X Λ) ⥤ EtaleD X Λ) (nearby : EtaleD X Λ) :
    realize.obj filtered ≅ nearby := by sorry
end TwoComponents

end TauCeti.AlgebraicGeometry.VanishingCycles

namespace TauCeti.AlgebraicGeometry.Quadric
open LinearMap (BilinForm)
section Models
variable {k : Type} [Field k] {V : Type} [AddCommGroup V] [Module k V]
variable [FiniteDimensional k V]
-- Projectivization, closed immersion, dimension and coordinate-free descent are SF.2
-- supplier conditions. These data-valued prototypes describe the quadratic models only.
def projectiveQuadric (Q : QuadraticForm k V) : Scheme.{0} := by sorry
def affineQuadric (Q : QuadraticForm k V) (b : k) : Scheme.{0} := by sorry
def quadraticSeries {r : ℕ} (Q : QuadraticForm k (Fin r → k)) : MvPowerSeries (Fin r) k := by sorry
def evenCliffordCentre (Q : QuadraticForm k V) := Subalgebra.center k (CliffordAlgebra.even Q)
-- Etaleness/Azumaya structures await SF.2. Rank two is the algebraic specialization.
theorem evenCliffordCentre_isEtale (Q : QuadraticForm k V)
    (hQ : QuadraticMap.Nondegenerate (Q := Q)) (hr : Even (Module.finrank k V))
    (hpos : 0 < Module.finrank k V) : Module.finrank k (evenCliffordCentre Q) = 2 := by sorry
-- Hypotheses that W is maximal totally isotropic are explicit in the characterization.
def lagrangianIdempotent (Q : QuadraticForm k V) (W : Submodule k V)
    (hQ : QuadraticMap.Nondegenerate (Q := Q)) (hW : ∀ x ∈ W, Q x = 0)
    (hd : 2 * Module.finrank k W = Module.finrank k V) : evenCliffordCentre Q := by sorry
theorem lagrangianIdempotent_eq_iff (Q : QuadraticForm k V)
    (hQ : QuadraticMap.Nondegenerate (Q := Q)) (W₁ W₂ : Submodule k V)
    (h₁ : ∀ x ∈ W₁, Q x = 0) (h₂ : ∀ x ∈ W₂, Q x = 0)
    (hd₁ : 2 * Module.finrank k W₁ = Module.finrank k V)
    (hd₂ : 2 * Module.finrank k W₂ = Module.finrank k V) :
    lagrangianIdempotent Q W₁ hQ h₁ hd₁ = lagrangianIdempotent Q W₂ hQ h₂ hd₂ ↔
      Even (Module.finrank k (W₁ ⧸ (W₁ ⊓ W₂).comap W₁.subtype)) := by sorry
-- Spectrum of the actual centre; finite-étale scheme structure is the preceding supplier gap.
def discriminantCover (Q : QuadraticForm k V) : Scheme.{0} := by sorry
def ambientProjective (Q : QuadraticForm k V) : Scheme.{0} := by sorry
end Models

-- The geometric fibre, over the algebraic closure of the actual residue field.
abbrev geometricFiber {X S : Scheme.{0}} (f : X ⟶ S) (s : S) : Scheme.{0} :=
  pullback f (Spec.map (CommRingCat.ofHom
    (algebraMap (S.residueField s) (AlgebraicClosure (S.residueField s)))) ≫ S.fromSpecResidueField s)
-- Projective-model descent and the relative dimension API are omitted supplier conditions.
def IsSmoothQuadric {X S : Scheme.{0}} (f : X ⟶ S) (n : ℕ) : Prop :=
  IsProper f ∧ Smooth f ∧ ∀ s : S,
    ∃ Q : QuadraticForm (AlgebraicClosure (S.residueField s))
      (Fin (n + 2) → AlgebraicClosure (S.residueField s)),
        QuadraticMap.Nondegenerate (Q := Q) ∧
          Nonempty (geometricFiber f s ≅ projectiveQuadric Q)
-- Completed local ring A is supplied by SF Part II, never a replacement sheaf carrier.
def IsOrdinaryQuadraticPoint (k A : Type) [Field k] [CommRing A] (r : ℕ) : Prop :=
  ∃ Q : QuadraticForm k (Fin r → k), QuadraticMap.Nondegenerate (Q := Q) ∧
    Nonempty (A ≃+* (MvPowerSeries (Fin r) k ⧸ Ideal.span {quadraticSeries Q}))
def IsNondegenerateQuadraticPoint (k A : Type) [Field k] [CommRing A] (r : ℕ) : Prop :=
  ∃ Q : QuadraticForm k (Fin r → k), (QuadraticMap.polarBilin Q).Nondegenerate ∧
    Nonempty (A ≃+* (MvPowerSeries (Fin r) k ⧸ Ideal.span {quadraticSeries Q}))
-- Additional API below is after the field IsOrdinary definition preserved from the input.
end TauCeti.AlgebraicGeometry.Quadric

namespace TauCeti.AlgebraicGeometry.VanishingCycles
-- A quadratic polynomial is Q(x)+L(x)+a. Its homogenization and scheme maps are supplied.
structure StandardQuadraticDegeneration where
  trait : HenselianTrait
  rank : ℕ
  Q : QuadraticForm trait.R (Fin rank → trait.R)
  linear : (Fin rank → trait.R) →ₗ[trait.R] trait.R
  constant : trait.R
  total : Scheme.{0}
  toBase : total ⟶ Spec (.of trait.R)
  -- Omitted supplier conditions: generic/special fibre ordinarity, cone equation,
  -- invertible coefficients, the affine chart and the projective-closure identification.

namespace StandardQuadraticDegeneration
def vertex (D : StandardQuadraticDegeneration) : (D.trait.specialFiber D.toBase).left := by sorry
def projectiveClosure (D : StandardQuadraticDegeneration) : Scheme.{0} := by sorry
def discriminantCharacter (D : StandardQuadraticDegeneration) : D.trait.inertia →* ℤˣ := by sorry
def ofLocalEquation (S : HenselianTrait) (r : ℕ)
    (Q : QuadraticForm S.R (Fin r → S.R)) (b : S.R) : StandardQuadraticDegeneration := by sorry
end StandardQuadraticDegeneration
end TauCeti.AlgebraicGeometry.VanishingCycles

namespace TauCeti.AlgebraicGeometry.LefschetzPencil
-- The projective embedding, codimension-two axis and incidence scheme are supplied by SF.2.
-- The genuine singular-locus condition below uses neighborhoods on which f is smooth.
def smoothAt {X Y : Scheme.{0}} (f : X ⟶ Y) (x : X) : Prop :=
  ∃ U : X.Opens, x ∈ U ∧ Smooth (U.ι ≫ f)
def singularSet {X D : Scheme.{0}} (f : X ⟶ D) : Set D :=
  f '' {x | ¬ smoothAt f x}
def IsLefschetzPencil {X D : Scheme.{0}} (f : X ⟶ D) : Prop :=
  IsProper f ∧ Flat f ∧ (singularSet f).Finite ∧
    ∀ t ∈ singularSet f, ∃! x : X, f x = t ∧ ¬ smoothAt f x
-- Omitted: ordinarity of each unique singular point, smooth total space and axis transversality.
-- totalSpace's input is the incidence model; it does not reconstruct the general blowup owner.
def totalSpace (incidenceModel : Scheme.{0}) : Scheme.{0} := incidenceModel
def totalSpace_iso_blowup (incidenceModel blowupModel : Scheme.{0}) :
    totalSpace incidenceModel ≅ blowupModel := by sorry
def localModel {X D : Scheme.{0}} (f : X ⟶ D) (S : Scheme.{0}) (g : S ⟶ D) := pullback f g

-- The conormal incidence and projection come from the supplied embedding. The closure
-- includes hyperplanes containing X, not just singular sections of the expected dimension.
def dualVariety {C Pdual : Scheme.{0}} (conormalProjection : C ⟶ Pdual) : Set Pdual :=
  closure (Set.range conormalProjection)
theorem mem_dualVariety_iff {C Pdual : Scheme.{0}} (p : C ⟶ Pdual)
    (hp : IsClosedMap p) (t : Pdual) : t ∈ dualVariety p ↔ ∃ x, p x = t := by sorry
theorem dualVariety_isIrreducible {C Pdual : Scheme.{0}} (p : C ⟶ Pdual)
    (hC : IsIrreducible (Set.univ : Set C)) : IsIrreducible (dualVariety p) := by sorry
-- The supplied incidence map g and its relation to p are omitted geometric hypotheses.
theorem incidence_smooth_off_dual {C Pdual Y : Scheme.{0}} (p : C ⟶ Pdual)
    (g : Y ⟶ Pdual) (y : Y) (hy : g y ∉ dualVariety p) : smoothAt g y := by sorry
theorem singularSet_eq_inter_dual {X D C Pdual : Scheme.{0}} (f : X ⟶ D)
    (h : IsLefschetzPencil f) (p : C ⟶ Pdual) (line : D ⟶ Pdual) :
    singularSet f = line ⁻¹' dualVariety p := by sorry

section VanishingSpace
open LinearMap (BilinForm)
variable {K V G S : Type*} [Field K] [AddCommGroup V] [Module K V] [Group G]
-- δ is a geometric generator at a chosen base path. Changing the path uses the action.
def vanishingCycle (ρ : Representation K G V) (δ : S → V) (s : S) (g : G) : V := ρ g (δ s)
theorem vanishingCycle_changePath (ρ : Representation K G V) (δ : S → V) (s : S) (g h : G) :
    vanishingCycle ρ δ s (g * h) = ρ g (vanishingCycle ρ δ s h) := by sorry
def vanishingSubspace (ρ : Representation K G V) (δ : S → V) : Submodule K V :=
  Submodule.span K (Set.range fun sg : S × G => vanishingCycle ρ δ sg.1 sg.2)
theorem vanishingSubspace_stable (ρ : Representation K G V) (δ : S → V) (g : G) :
    (vanishingSubspace ρ δ).map (ρ g) = vanishingSubspace ρ δ := by sorry
-- Local Picard–Lefschetz geometry is omitted; the coefficient and sign are retained.
theorem localMonodromy_vanishingCycle (B : BilinForm K V) (δ x : V) (c : K) :
    LinearMap.transvection (c • B.flip δ) δ x = x + c • B x δ • δ := by sorry
abbrev vanishingQuotient (B : BilinForm K V) (E : Submodule K V) :=
  E ⧸ (E ⊓ B.orthogonal E).comap E.subtype
def vanishingForm (B : BilinForm K V) (E : Submodule K V)
    (hsym : B.IsSymm ∨ B.IsAlt) :
    BilinForm K (vanishingQuotient B E) := by sorry
theorem vanishingForm_nondegenerate (B : BilinForm K V) (E : Submodule K V)
    (hsym : B.IsSymm ∨ B.IsAlt) : (vanishingForm B E hsym).Nondegenerate := by sorry
theorem vanishingForm_isAlt (B : BilinForm K V) (E : Submodule K V) (hB : B.IsAlt) :
    (vanishingForm B E (Or.inr hB)).IsAlt := by sorry
-- The symplectic group is the actual subgroup of linear equivalences preserving B.
def formPreservingGroup (B : BilinForm K V) : Subgroup (V ≃ₗ[K] V) where
  carrier := {g | ∀ x y, B (g x) (g y) = B x y}
  one_mem' := by simp
  mul_mem' := by intro g h hg hh x y; exact (hg _ _).trans (hh _ _)
  inv_mem' := by sorry
def monodromyRep (B : BilinForm K V) (E : Submodule K V)
    (hsym : B.IsSymm ∨ B.IsAlt) (ρ : Representation K G V)
    (hE : ∀ g, E.map (ρ g) = E) (hB : ∀ g x y, B (ρ g x) (ρ g y) = B x y) :
    G →* formPreservingGroup (vanishingForm B E hsym) := by sorry
end VanishingSpace
end TauCeti.AlgebraicGeometry.LefschetzPencil

namespace TauCeti.AlgebraicGeometry.LefschetzPencil

open LinearMap (BilinForm)

section FixedSpace

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V]

/-- A Picard–Lefschetz transvection x ↦ x + c (x, δ) δ fixes x exactly when (x, δ) = 0, for c ≠ 0 and δ ≠ 0
(node `LPV.4/fixed-space-of-the-local-transvections`). -/
theorem transvection_apply_eq_self_iff (B : BilinForm K V) {δ : V} (hδ : δ ≠ 0) {c : K} (hc : c ≠ 0) (x : V) :
    LinearMap.transvection (c • B.flip δ) δ x = x ↔ B x δ = 0 := by
  simp [LinearMap.transvection.apply, hδ, hc]

/-- The common fixed space of the local transvections is E^⊥, E the span of the vanishing cycles (Weil I 5.3). -/
theorem forall_transvection_apply_eq_self_iff {ι : Type*} (B : BilinForm K V) (δ : ι → V) (c : ι → K)
    (hc : ∀ i, c i ≠ 0) (x : V) :
    (∀ i, LinearMap.transvection (c i • B.flip (δ i)) (δ i) x = x) ↔ ∀ i, B x (δ i) = 0 := by
  refine forall_congr' fun i => ?_
  by_cases hδ : δ i = 0
  · simp [hδ]
  · exact transvection_apply_eq_self_iff B hδ (hc i) x

/-- Test `vanishingCycle_swap_conic`: in the n = 0 conic pencil, H⁰(X_u) = ℚ² and δ = e₁ − e₂; the reflection
x ↦ x − (x, δ)δ, with (x, δ) = x₀ − x₁, swaps the two points: e₁ ↦ e₂. -/
example : LinearMap.transvection (-(LinearMap.proj (R := ℚ) (φ := fun _ : Fin 2 => ℚ) 0 - LinearMap.proj 1)) ![1, -1]
    ![1, 0] = ![0, 1] := by
  ext i; fin_cases i <;> simp [LinearMap.transvection.apply]

/-- Test `vanishingCycle_fixed_conic`: the same reflection fixes e₁ + e₂, which spans E^⊥. -/
example : LinearMap.transvection (-(LinearMap.proj (R := ℚ) (φ := fun _ : Fin 2 => ℚ) 0 - LinearMap.proj 1)) ![1, -1]
    ![1, 1] = ![1, 1] := by
  ext i; fin_cases i <;> simp [LinearMap.transvection.apply]

end FixedSpace

section LieLemma

attribute [local instance 100] LieRing.ofAssociativeRing

variable {k V : Type*} [Field k] [AddCommGroup V] [Module k V]

/-- N(δ) : x ↦ ψ(x, δ) δ, the logarithm of the Picard–Lefschetz transvection. -/
def nilpotentOfVector (ψ : BilinForm k V) (δ : V) : Module.End k V :=
  (ψ.flip δ).smulRight δ

theorem nilpotentOfVector_apply (ψ : BilinForm k V) (δ x : V) : nilpotentOfVector ψ δ x = ψ x δ • δ := rfl

/-- N(δ)² = 0 when ψ is alternating. -/
theorem nilpotentOfVector_sq (ψ : BilinForm k V) (hψ : ψ.IsAlt) (δ : V) : nilpotentOfVector ψ δ ^ 2 = 0 := by
  ext x
  simp [pow_two, nilpotentOfVector_apply, hψ δ]

/-- N(δ) lies in sp(V, ψ) when ψ is alternating. -/
theorem nilpotentOfVector_mem_sp (ψ : BilinForm k V) (hψ : ψ.IsAlt) (δ : V) :
    nilpotentOfVector ψ δ ∈ skewAdjointLieSubalgebra ψ := by
  sorry

/-- Weil I, Lemma 5.11: a Lie subalgebra of sp(V, ψ), char k = 0, for which V is simple and which is generated by
operators N(δᵢ), is all of sp(V, ψ) (node `LPV.5/symplectic-lie-algebra-generated-by-transvections`). -/
theorem eq_sp_of_isIrreducible_of_generated [CharZero k] [FiniteDimensional k V] (ψ : BilinForm k V)
    (hψ : ψ.IsAlt) (hnd : ψ.Nondegenerate) (L : LieSubalgebra k (Module.End k V))
    (hL : L ≤ skewAdjointLieSubalgebra ψ) [LieModule.IsIrreducible k L V] {ι : Type*} (δ : ι → V)
    (hgen : LieSubalgebra.lieSpan k (Module.End k V) (Set.range fun i => nilpotentOfVector ψ (δ i)) = L) :
    L = skewAdjointLieSubalgebra ψ := by
  sorry

end LieLemma

section Hermitian

/-- Test `hermitian_curve_not_lefschetz`: along the direction (u, v) at (a, b), the Hermitian polynomial
x^{p+1} + y^{p+1} + 1 in characteristic p expands with linear term a^p u + b^p v and next term in t^p. When
a^p u + b^p v = 0 (the tangent direction) the contact order is at least p. -/
example {R : Type*} [CommRing R] (p : ℕ) [Fact p.Prime] [CharP R p] (a b u v t : R) :
    (a + t * u) ^ (p + 1) + (b + t * v) ^ (p + 1) + 1 =
      (a ^ (p + 1) + b ^ (p + 1) + 1) + t * (a ^ p * u + b ^ p * v) + t ^ p * (a * u ^ p + b * v ^ p) +
        t ^ (p + 1) * (u ^ (p + 1) + v ^ (p + 1)) := by
  have h1 := add_pow_char a (t * u) p
  have h2 := add_pow_char b (t * v) p
  rw [pow_succ, pow_succ, h1, h2]
  ring

end Hermitian

end TauCeti.AlgebraicGeometry.LefschetzPencil

namespace TauCeti.AlgebraicGeometry.Quadric

section OrdinaryForm

variable {k V : Type*} [Field k] [AddCommGroup V] [Module k V]

/-- Deligne's ordinary quadratic form over a field (SGA 7 XII 1.1, with `car(A) = 2` in case b)): the polar form is
nondegenerate when the rank is even or the characteristic is not 2; in characteristic 2 and odd rank, the polar kernel
is a line on which `Q` does not vanish (node `LPV.2/ordinary-quadratic-form`). -/
def IsOrdinary (Q : QuadraticForm k V) : Prop :=
  ((Even (Module.finrank k V) ∨ ringChar k ≠ 2) → (QuadraticMap.polarBilin Q).Nondegenerate) ∧
  ((Odd (Module.finrank k V) ∧ ringChar k = 2) →
    Module.finrank k (LinearMap.ker (QuadraticMap.polarBilin Q)) = 1 ∧
      ∀ v ∈ LinearMap.ker (QuadraticMap.polarBilin Q), v ≠ 0 → Q v ≠ 0)

/-- For `V ≠ 0` over a field, ordinary is Mathlib's `QuadraticMap.Nondegenerate` (Elman–Karpenko–Merkurjev). -/
theorem isOrdinary_iff_nondegenerate [FiniteDimensional k V] [Nontrivial V] (Q : QuadraticForm k V) :
    IsOrdinary Q ↔ QuadraticMap.Nondegenerate (Q := Q) := by
  sorry

end OrdinaryForm

section Tables

/-- Test `affineQuadric_trace_delta_sq_even`: for m even the generatrix classes have Gram matrix [[1, 0], [0, 1]]
(XII 3.3 (iii)(b)), so δ = cℓ(α) − cℓ(β) has Tr(δ²) = 2 = (−1)^m·2. -/
example : dotProduct (![1, -1] : Fin 2 → ℤ) (Matrix.mulVec (1 : Matrix (Fin 2) (Fin 2) ℤ) ![1, -1]) = 2 := by
  simp [dotProduct, Matrix.mulVec, Fin.sum_univ_two]

/-- Test `affineQuadric_trace_delta_sq_odd`: for m odd the Gram matrix is [[0, 1], [1, 0]], so Tr(δ²) = −2. -/
example : dotProduct (![1, -1] : Fin 2 → ℤ) (Matrix.mulVec !![0, 1; 1, 0] ![1, -1]) = -2 := by
  simp [dotProduct, Matrix.mulVec, Fin.sum_univ_two]

/-- Test `pointCount_quadric_surface`: XII 3.4 with n = 2, m = 1: a split quadric surface has
1 + q + q² + q = (1 + q)² points, the nonsplit one 1 + q + q² − q = 1 + q². -/
example (q : ℤ) : (1 + q + q ^ 2) + q = (1 + q) ^ 2 ∧ (1 + q + q ^ 2) - q = 1 + q ^ 2 := by
  constructor <;> ring

end Tables

end TauCeti.AlgebraicGeometry.Quadric

namespace TauCeti.AlgebraicGeometry.VanishingCycles

/-- Test `variation_even_sign`: in XV (2.2.5.6), for ε(σ) = −1 the coefficient ((ε(σ) − 1)/2)(−1)^m is (−1)^{m+1},
which is the sign of Weil I (4.1) for n = 2m (−, + for n ≡ 0, 2 mod 4). -/
example (m : ℕ) : (-1 : ℤ) * (-1) ^ m = (-1) ^ (m + 1) := by ring

/-- Test `delta_characterisation_composite`: in ℤ/15, u = 4 satisfies u² = 1 but u ≠ ±1, so (δ, δ) = (−1)^m·2 does not
characterise ±δ for Λ = ℤ/15 (source issue E11 on SGA 7 XV 2.2.6). -/
example : (4 : ZMod 15) ^ 2 = 1 ∧ (4 : ZMod 15) ≠ 1 ∧ (4 : ZMod 15) ≠ -1 := by decide

/-- A 2-primary lift does not synchronize the signs at distinct odd primes:
19 has norm one modulo 60 and reduces to the offending 4 modulo 15. -/
example : (19 : ZMod 60) ^ 2 = 1 ∧ (19 : ZMod 15) = 4 ∧
    (19 : ZMod 15) ≠ 1 ∧ (19 : ZMod 15) ≠ -1 := by decide

end TauCeti.AlgebraicGeometry.VanishingCycles

namespace TauCeti.AlgebraicGeometry.Quadric
section API
variable {k V : Type*} [Field k] [AddCommGroup V] [Module k V] [FiniteDimensional k V]
-- Mathlib quadratic baseChange currently requires 2 invertible. The characteristic-two
-- base-change construction is a missing supplier condition, explicitly omitted here.
theorem IsOrdinary.baseChange {k' : Type*} [Field k'] [Algebra k k']
    [Invertible (2 : k)] [Invertible (2 : k')]
    (Q : QuadraticForm k V) (h : IsOrdinary Q) : IsOrdinary (Q.baseChange k') := by sorry
theorem isOrdinary_iff_polar_nondegenerate (Q : QuadraticForm k V)
    (h : Even (Module.finrank k V) ∨ ringChar k ≠ 2) :
    IsOrdinary Q ↔ (QuadraticMap.polarBilin Q).Nondegenerate := by sorry
theorem isOrdinary_iff_of_char_two (Q : QuadraticForm k V)
    (hc : ringChar k = 2) (hr : Odd (Module.finrank k V)) :
    IsOrdinary Q ↔ Module.finrank k (LinearMap.ker (QuadraticMap.polarBilin Q)) = 1 ∧
      ∀ v ∈ LinearMap.ker (QuadraticMap.polarBilin Q), v ≠ 0 → Q v ≠ 0 := by sorry
end API
section GeometricAPI
variable {k : Type} [Field k] {r : ℕ}
-- The model's structure morphism and line bundles are supplied by SF.2.
theorem isSmoothQuadric_of_isOrdinary (Q : QuadraticForm k (Fin (r + 2) → k))
    (h : IsOrdinary Q) (f : projectiveQuadric Q ⟶ Spec (.of k)) : IsSmoothQuadric f r := by sorry
theorem isSmoothQuadric_zero_iff {X S : Scheme.{0}} (f : X ⟶ S) :
    IsSmoothQuadric f 0 ↔ Etale f ∧ IsProper f ∧
      ∀ s : S, Nat.card (geometricFiber f s) = 2 := by sorry
-- The geometric cardinality, rather than rational residue-field points, is intended above.
-- The differential/top-exterior and O(-n) functors are supplied actual sheaf objects.
def canonical_iso {X : Scheme.{0}} {Λ : Type} [CommRing Λ]
    (topDifferentials negativeTwist : TauCeti.AlgebraicGeometry.VanishingCycles.EtaleSheaf X Λ) :
    topDifferentials ≅ negativeTwist := by sorry
-- Completion, characteristic and descent hypotheses are in the packet.
theorem isNondegenerate_iff (k A : Type) [Field k] [CommRing A] (r : ℕ) :
    IsNondegenerateQuadraticPoint k A r ↔
      IsOrdinaryQuadraticPoint k A r ∧ (ringChar k ≠ 2 ∨ Even r) := by sorry
theorem isOrdinaryQuadraticPoint_baseChange (k A k' A' : Type)
    [Field k] [CommRing A] [Field k'] [CommRing A'] (r : ℕ) :
    IsOrdinaryQuadraticPoint k A r ↔ IsOrdinaryQuadraticPoint k' A' r := by sorry
theorem isOrdinaryQuadraticPoint_cone (Q : QuadraticForm k (Fin r → k))
    (h : IsOrdinary Q) :
    IsOrdinaryQuadraticPoint k (MvPowerSeries (Fin r) k ⧸ Ideal.span {quadraticSeries Q}) r := by sorry
end GeometricAPI
end TauCeti.AlgebraicGeometry.Quadric

namespace TauCeti.AlgebraicGeometry.VanishingCycles
section LinearTheorems
variable {K V : Type*} [Field K] [CharZero K] [AddCommGroup V] [Module K V]
variable [FiniteDimensional K V]
-- Geometric identification with constant-coefficient étale cohomology is omitted.
theorem geometricQuasiUnipotence {I : Type*} [Group I] (ρ : Representation K I V) :
    ∃ H : Subgroup I, H.index ≠ 0 ∧ ∀ g ∈ H, IsNilpotent (ρ g - 1) := by sorry
-- The Kummer character comparison supplies N' = eN. Its valuation condition is omitted.
theorem monodromyRamificationRescaling (N N' : Module.End K V) (e : ℕ)
    (he : e ≠ 0) (h : N' = (e : K) • N) :
    monodromyFiltration N' 0 = monodromyFiltration N 0 := by sorry
theorem primitiveDecomposition (N : Module.End K V) (hN : IsNilpotent N) (i : ℤ) :
    (monodromyFiltration N 0 (i + 2)).map N =
      LinearMap.range N ⊓ monodromyFiltration N 0 i := by sorry
-- Tensor and symmetric powers use the imported tensor API. This is the dual part.
theorem monodromyTensorDual (N : Module.End K V) (hN : IsNilpotent N) (i : ℤ) :
    monodromyFiltration (-N.dualMap) 0 i =
      (monodromyFiltration N 0 (-i - 1)).dualAnnihilator := by sorry
-- Relative opposite-graded-power isomorphisms on Gr^W are omitted pending the filtered
-- derived/module interface. No blanket existence statement is made.
-- N on each actual associated graded of W, and the filtration induced by M there.
def inducedGradedN (N : Module.End K V) (W : ℤ → Submodule K V)
    (hW : ∀ w, (W w).map N ≤ W w) (w : ℤ) : Module.End K (Gr W w) := by sorry
def inducedGradedFiltration (W M : ℤ → Submodule K V) (w i : ℤ) : Submodule K (Gr W w) :=
  ((M i).comap (W w).subtype).map (Submodule.mkQ ((W (w - 1)).comap (W w).subtype))
-- The condition on each Gr^W is genuine monodromy filtration data; it does not assume
-- M=M' or the existence of a relative filtration for an arbitrary pair (W,N).
theorem relativeMonodromyUnique (N : Module.End K V) (hN : IsNilpotent N)
    (W M M' : ℤ → Submodule K V) (hNW : ∀ w, (W w).map N ≤ W w)
    (monoW : Monotone W) (monoM : Monotone M) (monoM' : Monotone M')
    (finiteW : ∃ a b, W a = ⊥ ∧ W b = ⊤)
    (finiteM : ∃ a b, M a = ⊥ ∧ M b = ⊤)
    (finiteM' : ∃ a b, M' a = ⊥ ∧ M' b = ⊤)
    (lower : ∀ i, (M i).map N ≤ M (i - 2))
    (lower' : ∀ i, (M' i).map N ≤ M' (i - 2))
    (graded : ∀ w, inducedGradedFiltration W M w =
      monodromyFiltration (inducedGradedN N W hNW w) w)
    (graded' : ∀ w, inducedGradedFiltration W M' w =
      monodromyFiltration (inducedGradedN N W hNW w) w) : M = M' := by sorry
-- A stratum's Kummer-cover construction is the omitted geometric condition on this family.
theorem normalCrossingsTameRestriction {ι : Type*} (N : ι → Module.End K V) :
    ∀ i j, Commute (N i) (N j) := by sorry
-- Frobenius q-scaling in a chosen Tate basis; the geometric realization is omitted.
theorem twistedMonodromyEquivariance (N F : Module.End K V) (q : K) : N * F = q • (F * N) := by sorry
end LinearTheorems

section DerivedTheorems
variable (S : HenselianTrait) {X : Scheme.{0}} (f : X ⟶ Spec (.of S.R))
variable (Λ : Type) [CommRing Λ]
-- Each supplier square is geometric; arbitrary functors alone do not imply an exchange.
-- Properness/smoothness/invertibility/constructibility are specified in the packet.
theorem derivedFunctorialitiesAndSpecializationSequence (K : EtaleD X Λ) :
    vanishingTriangle S f Λ K ∈ distTriang (EtaleD (geometricSpecial S f) Λ) := by sorry
def geometricFibreSiteMaps :
    EtaleSheaf X Λ ⥤ EtaleSheaf (geometricGeneric S f) Λ := by sorry
def orientedProductTraitComparison (C : Type*) [Category C] (J : GrothendieckTopology C) :
    Sheaf J (ModuleCat Λ) ≌ Action (EtaleSheaf (geometricSpecial S f) Λ) S.inertia := by sorry
-- Bounded constructibility awaits ConstructibleEtale/PR196. Ordinary boundedness is genuine.
theorem nearbyCyclesConstructible (K : EtaleD X Λ) : ∃ a b : ℤ,
    (DerivedCategory.TStructure.t).IsGE ((RPsi S f Λ).obj K).right.V a ∧
    (DerivedCategory.TStructure.t).IsLE ((RPsi S f Λ).obj K).right.V b := by sorry
def nearbyCyclesCoefficientTraitChange {Λ' : Type} [CommRing Λ']
    (extX : EtaleD X Λ ⥤ EtaleD X Λ')
    (extPhi : Action (EtaleD (geometricSpecial S f) Λ) S.inertia ⥤
      Action (EtaleD (geometricSpecial S f) Λ') S.inertia) :
    RPhi S f Λ ⋙ extPhi ≅ extX ⋙ RPhi S f Λ' := by sorry
-- Adic realization and Huber comparison are supplied functors, not replacement categories.
def adicNearbyCycleRealization {A : Type*} [Category A]
    (realize : Action (EtaleD (geometricSpecial S f) Λ) S.inertia ⥤ A)
    (adicPhi : EtaleD X Λ ⥤ A) : RPhi S f Λ ⋙ realize ≅ adicPhi := by sorry
def schemeAdicNearbyComparison {A : Type*} [Category A]
    (realize : Action (EtaleD (geometricSpecial S f) Λ) S.inertia ⥤ A)
    (analyticPhi : EtaleD X Λ ⥤ A) : RPhi S f Λ ⋙ realize ≅ analyticPhi := by sorry
-- Normalized can/var are morphisms, with domain order and Tate twist retained.
theorem normalizedCanVar (K : EtaleD (geometricSpecial S f) Λ)
    (Phi twistK : EtaleD (geometricSpecial S f) Λ)
    (can : K ⟶ Phi) (var : Phi ⟶ twistK) (N : K ⟶ twistK) : can ≫ var = N := by sorry
end DerivedTheorems

section Perverse
variable {X Y : Scheme.{0}} {Λ : Type} [CommRing Λ]
-- Supplied t-structures are the actual TStructure objects. EDC.5 identifies them with the
-- dimension/costalk perverse conditions. Excellence and constructibility are omitted here.
variable (pX : TStructure (EtaleD X Λ)) (pY : TStructure (EtaleD Y Λ))
variable (nearby vanishing : EtaleD X Λ ⥤ EtaleD Y Λ)
theorem nearbyPerverseExact (K : EtaleD X Λ) (h : pX.IsLE K 0 ∧ pX.IsGE K 0) :
    pY.IsLE ((nearby.obj K)⟦(-1 : ℤ)⟧) 0 ∧ pY.IsGE ((nearby.obj K)⟦(-1 : ℤ)⟧) 0 := by sorry
theorem vanishingPerverseExact (K : EtaleD X Λ) (h : pX.IsLE K 0 ∧ pX.IsGE K 0) :
    pY.IsLE ((vanishing.obj K)⟦(-1 : ℤ)⟧) 0 ∧ pY.IsGE ((vanishing.obj K)⟦(-1 : ℤ)⟧) 0 := by sorry
def nearbyVerdierDuality (dualX : (EtaleD X Λ)ᵒᵖ ⥤ EtaleD X Λ)
    (dualY : (EtaleD Y Λ)ᵒᵖ ⥤ EtaleD Y Λ) :
    nearby.op ⋙ dualY ≅ dualX ⋙ nearby := by sorry
-- Both ! and * exchange maps must be invertible. Geometric square and functorial image
-- construction for j!* are omitted supplier conditions; no unrestricted exchange is asserted.
def nearbyIntermediateExtension (jMiddle : EtaleD X Λ ⥤ EtaleD X Λ)
    (jMiddle' : EtaleD Y Λ ⥤ EtaleD Y Λ) :
    jMiddle ⋙ nearby ≅ nearby ⋙ jMiddle' := by sorry
def perverseCoefficientComparison {Λ' : Type} [CommRing Λ']
    (extX : EtaleD X Λ ⥤ EtaleD X Λ') (extY : EtaleD Y Λ ⥤ EtaleD Y Λ')
    (nearby' : EtaleD X Λ' ⥤ EtaleD Y Λ') : nearby ⋙ extY ≅ extX ⋙ nearby' := by sorry
-- The enlarged category must admit the colimit. Ri! commutation and uniformly bounded
-- cohomological dimension are omitted; finite-level constructibility is not claimed for it.
theorem filteredColimitSupportCriterion {J : Type*} [SmallCategory J] [IsFiltered J]
    (F : J ⥤ EtaleD X Λ) [HasColimit F] (hF : ∀ j, pX.IsGE (F.obj j) 0) :
    pX.IsGE (colimit F) 0 := by sorry
theorem igusaSemiperversityInterface {J : Type*} [SmallCategory J] [IsFiltered J]
    (F : J ⥤ EtaleD X Λ) [HasColimit F] (d : ℤ)
    (hF : ∀ j, pX.IsGE (F.obj j) d) : pX.IsGE (colimit F) d := by sorry
end Perverse
end TauCeti.AlgebraicGeometry.VanishingCycles

namespace TauCeti.AlgebraicGeometry.VanishingCycles
open TauCeti.AlgebraicGeometry
/- All source-specific geometric realizations used in these tests are the omitted supplier
conditions described above. Arithmetic sign/count tests retain the source normalization. -/
/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.inertia_eq_top_of_strictlyHenselian`: If V is strictly henselian then Gal(s̄/s) = 1 and I = Gal(η̄/η). -/
example (S : HenselianTrait) [IsAlgClosed (IsLocalRing.ResidueField S.valuation)] : S.inertia = ⊤ := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.inertia_puiseux`: For V the henselisation of k[t] at (t), k algebraically closed of characteristic 0, I = Gal(η̄/η) ≅ Ẑ(1), acting on t^{1/n} through μ_n. -/
example (S : HenselianTrait) (n : ℕ) (root uniformizer : AlgebraicClosure S.K) (h : root ^ n = uniformizer) (g : S.inertia) : (g.1.1 root) ^ n = g.1.1 uniformizer := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.inertia_eq_valuation_inertia`: I coincides with Mathlib's ValuationSubring.inertiaSubgroup for the valuation subring of k(η̄) over V, as a subgroup of the decomposition group, which here is all of Gal(η̄/η). -/
example (S : HenselianTrait) : S.inertia = S.valuation.inertiaSubgroup S.K := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.wild_inertia_ne_bot`: For V = the henselisation of 𝔽̄_p[t] at (t), I is not procyclic: the Artin–Schreier extensions x^p − x = t^{-a} (p ∤ a) give infinitely many independent ℤ/p quotients. -/
example (S : HenselianTrait) (p : ℕ) [Fact p.Prime] [CharP S.K p] : ∃ (χ : S.inertia →* Multiplicative (ZMod p)), Function.Surjective χ := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.equivSheavesOnTrait_constant`: The constant sheaf Λ on S is the triple (Λ, Λ, id) with I acting trivially. -/
example {Λ : Type} [Ring Λ] {I : Type} [Group I] (M : ModuleCat Λ) : ((OrientedFibreTopos.sp_pullback (I := I)).obj M).left = M := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.equivSheavesOnTrait_jPushforward`: j_*G for a Gal(η̄/η)-module G is the triple (G^I, G, inclusion). -/
example {Λ : Type} [CommRing Λ] {V : Type} [AddCommGroup V] [Module Λ V] {I : Type} [Group I] (ρ : Representation Λ I V) (v : ρ.invariants) (g : I) : ρ g (v : V) = (v : V) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.equivSheavesOnTrait_degenerate`: For Y = ∅ the category is the terminal one. -/
example (C : Type*) [Category C] [Subsingleton C] (I : Type*) [Group I] (A B : OrientedFibreTopos C I) : A.left = B.left := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.not_triple_of_noninvariant`: For Y = s, a pair (F_s̄, F_η̄) with an equivariant map φ whose image is not in F_η̄^I is not a sheaf on S: the description 1.2.2 forces φ to land in the inertia invariants. -/
example {Λ : Type} [Ring Λ] {I : Type} [Group I] (A : OrientedFibreTopos (ModuleCat Λ) I) (g : I) : A.hom.hom ≫ (A.right.ρ g : End A.right.V) = A.hom.hom := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.psiEta_trait`: For X = S, Ψ_η(F) is F_η̄ with its Gal(η̄/η)-action. -/
example (S : HenselianTrait) (Λ : Type) [CommRing Λ] (F : EtaleSheaf (S.genericFiber (𝟙 (Spec (.of S.R)))).left Λ) : IsZero F → IsZero ((psiEta S (𝟙 (Spec (.of S.R))) Λ).obj F).V := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.psiEta_ne_invariants`: For X = S, Ψ_η(F) = F_η̄ differs from i^*j_*F = F_η̄^I whenever I acts nontrivially: using j_* in place of j̄_* loses the inertia action. -/
example (ρ : Representation ℚ (Multiplicative (ZMod 2)) ℚ) (h : ∃ g, ρ g = -1) : ρ.invariants = ⊥ := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.psiEta_smooth_constant`: For X smooth over S and Λ constant, Ψ_η(Λ) = Λ, since the strict henselisations of X̄ at points of X_s̄ are normal domains. -/
example (S : HenselianTrait) {X : Scheme.{0}} (f : X ⟶ Spec (.of S.R)) [Smooth f] (Λ : Type) [CommRing Λ] (constantGeneric : EtaleSheaf (S.genericFiber f).left Λ) (constantSpecial : EtaleSheaf (geometricSpecial S f) Λ) : Nonempty (((psiEta S f Λ).obj constantGeneric).V ≅ constantSpecial) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.psi_proper_pushforward_id`: For f = id the base-change map is the identity. -/
example (S : HenselianTrait) {X : Scheme.{0}} (f : X ⟶ Spec (.of S.R)) (Λ : Type) [CommRing Λ] : Nonempty (psi S f Λ ≅ (𝟭 _) ⋙ psi S f Λ) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.variation_one`: Var(1) = 0. -/
example {Λ : Type} [Ring Λ] {I : Type} [Group I] (A : OrientedFibreTopos (ModuleCat Λ) I) : variation A 1 = 0 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.variation_of_phi_zero`: If Φ(K) = 0 then Var(σ) = 0 and I acts trivially on K_η, by σ = 1 + Var(σ) q. -/
example {Λ : Type} [Ring Λ] {I : Type} [Group I] (A : OrientedFibreTopos (ModuleCat Λ) I) (h : IsZero (cokernel A.hom.hom)) (g : I) : variation A g = 0 ∧ A.right.ρ g = 1 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.variation_picardLefschetz`:
the rank-one expression over rational coefficients is nonzero when the tame parameter,
the pairing and the vanishing vector are all nonzero. Its identification with geometric
Var still requires the ordinary-degeneration model listed in the packet. -/
example (m : ℕ) (t : ℚ) (B : LinearMap.BilinForm ℚ (Fin 2 → ℚ))
    (δ x : Fin 2 → ℚ) (ht : t ≠ 0) (hpair : B x δ ≠ 0) (hδ : δ ≠ 0) :
    ((-1 : ℚ) ^ (m + 1) * t) • B x δ • δ ≠ 0 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.variation_ne_sub_one`: Var(σ) is not σ − 1: it goes from Φ(K)_η to K_η, and σ − 1 on K_η is Var(σ) ∘ q, which vanishes on the image of K_s. -/
example {Λ : Type} [Ring Λ] {I : Type} [Group I] (A : OrientedFibreTopos (ModuleCat Λ) I) (g : I) : cokernel.π A.hom.hom ≫ variation A g = (A.right.ρ g - 1 : End A.right.V) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.RPhi_smooth`: For X → S smooth and K = Λ: RΦ(Λ) = 0 and RΨ_η(Λ) = Λ. -/
example (S : HenselianTrait) {X : Scheme.{0}} (f : X ⟶ Spec (.of S.R)) [Smooth f] (Λ : Type) [CommRing Λ] : IsZero ((RPhi S f Λ).obj (constantComplex X Λ)).V := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.RPsi_trait`: For X = S: RΨ_η(K) = K_η̄ with its Gal(η̄/η)-action. -/
example (S : HenselianTrait) {X : Scheme.{0}} (f : X ⟶ Spec (.of S.R)) [Smooth f] (Λ : Type) [CommRing Λ] : IsZero ((RPhi S f Λ).obj (constantComplex X Λ)).V := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.RPhi_node`: For X = Spec V[x, y]/(xy − π), π a uniformiser and S strictly henselian: R^iΦ(Λ) = 0 for i ≠ 1, and R^1Φ(Λ) is supported at the origin, free of rank 1 (XV 3.1.2 with n = 1). -/
example (Phi : DerivedCategory (ModuleCat ℚ)) : ∀ i : ℤ, i ≠ 1 → IsZero ((DerivedCategory.homologyFunctor (ModuleCat ℚ) i).obj Phi) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.specialization_direction`: For f proper the triangle gives H^i(X_s, K) → H^i(X_η̄, K) → H^i(X_s, RΦ K) → H^{i+1}(X_s, K): specialisation runs from the special to the generic fibre, and the reversed arrow is not a morphism of the triangle. -/
example (S : HenselianTrait) {X : Scheme.{0}} (f : X ⟶ Spec (.of S.R)) (Λ : Type) [CommRing Λ] (K : EtaleD X Λ) : (vanishingTriangle S f Λ K).mor₁ ≫ (vanishingTriangle S f Λ K).mor₂ = 0 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_zero`: log 1=0. -/
example : finiteLog (0 : Module.End ℚ ℚ) 1 = 0 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_square_zero`: If U²=0 then log(1+U)=U. -/
example (U : Module.End ℚ (Fin 2 → ℚ)) (h : U ^ 2 = 0) : finiteLog U 2 = U := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_three_block`: For U=E₀₁+E₁₂ on Q³, log(1+U)=U−U²/2. -/
example (U : Module.End ℚ (Fin 3 → ℚ)) (h : U ^ 3 = 0) : finiteLog U 3 = U - (1 / 2 : ℚ) • U ^ 2 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_not_reflection`: The involution −1 on Q is not unipotent, so the finite nilpotent logarithm hypothesis fails. -/
example : ¬ IsNilpotent ((-1 : Module.End ℚ ℚ) - 1) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_zero`: For N=0 the filtration is 0 below c and V at and above c. -/
example (i : ℤ) : monodromyFiltration (0 : Module.End ℚ ℚ) 0 i = if i < 0 then ⊥ else ⊤ := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_two_block`: For N(e₁)=e₀ on Q² centered at zero, M_−2=0, M_−1=M_0=Qe₀ and M_1=V. -/
example (N : Module.End ℚ (Fin 2 → ℚ)) (h : N ^ 2 = 0) (hne : N ≠ 0) : monodromyFiltration N 0 (-1) = LinearMap.range N ∧ monodromyFiltration N 0 1 = ⊤ := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_three_block`: For N(e₂)=e₁, N(e₁)=e₀, the weights are −2,0,2 and Gr_−1=Gr_1=0. -/
example (N : Module.End ℚ (Fin 3 → ℚ)) (h : IsMaximallyNilpotent N) : Module.finrank ℚ (monodromyFiltration N 0 (-2)) = 1 ∧ Module.finrank ℚ (monodromyFiltration N 0 0) = 2 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_not_kernel_filtration`: For a two-block, ker N is M_−1, and M_0 is still ker N, whereas ker N² is V. -/
example (N : Module.End ℚ (Fin 2 → ℚ)) (h : IsMaximallyNilpotent N) : monodromyFiltration N 0 0 = LinearMap.ker N ∧ monodromyFiltration N 0 (-1) ≠ ⊥ := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_three_block`: The size-three Jordan block is maximally nilpotent. -/
example (N : Module.End ℚ (Fin 3 → ℚ)) (h : N ^ 3 = 0) (h2 : N ^ 2 ≠ 0) : IsMaximallyNilpotent N := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_not_two_plus_one`: A size-two Jordan block plus a trivial line in dimension three is not maximally nilpotent. -/
example (N : Module.End ℚ (Fin 3 → ℚ)) (h : N ^ 2 = 0) : ¬ IsMaximallyNilpotent N := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_one_dimension`: The zero endomorphism of a one-dimensional space is maximally nilpotent; the identity is maximally unipotent. -/
example : IsMaximallyNilpotent (0 : Module.End ℚ ℚ) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_zero_dimension_excluded`: The zero-dimensional vector space does not satisfy the nonzero-dimension definition. -/
example : ¬ IsMaximallyNilpotent (0 : Module.End ℚ (Fin 0 → ℚ)) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_trivial`: For a degree-zero trivial inertia line with Frobenius a, the semisimple trace is a. -/
example (a : ℚ) : semisimpleTrace [trivialGradedLine a 0] = a := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_unipotent_block`: For a two-block with graded Frobenius eigenvalues a and qa, the semisimple trace is a+qa, while the trace on invariants is only the eigenvalue of ker N. -/
example (a q : ℚ) (ρ : Representation ℚ (Multiplicative ℤ) (Fin 2 → ℚ))
    (hgen : ρ (Multiplicative.ofAdd 1) = 1 +
      LinearMap.pi (fun i => if i = 0 then LinearMap.proj 1 else 0))
    (hF : ∀ v ∈ ρ.invariants,
      (LinearMap.pi fun i => (if i = 0 then a else q * a) • LinearMap.proj i) v ∈ ρ.invariants) :
    semisimpleTrace [trivialGradedLine a 0, trivialGradedLine (q * a) 0] = a + q * a ∧
    LinearMap.trace ℚ ρ.invariants
      ((LinearMap.pi fun i => (if i = 0 then a else q * a) • LinearMap.proj i).restrict hF) = a := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_quadratic`: For a nontrivial quadratic finite inertia line, the semisimple trace is 0. -/
example (ρ : Representation ℚ (Multiplicative (ZMod 2)) ℚ) (F : Module.End ℚ ℚ) (h : ∃ g, ρ g = -1) (hF : ∀ v ∈ ρ.invariants, F v ∈ ρ.invariants) : inertiaTrace ρ F hF = 0 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_shift`: Shifting a complex by one negates its semisimple trace. -/
example (a : ℚ) (i : ℤ) :
    semisimpleTrace [trivialGradedLine a (i + 1)] = -semisimpleTrace [trivialGradedLine a i] := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_node`: For xy=π, the degree-one nearby stalk is Λ(−1). -/
example {X : Scheme.{0}} {Λ : Type} [CommRing Λ] (C D₁ D₂ : EtaleD X Λ) (r₁ : D₁ ⟶ C) (r₂ : D₂ ⟶ C) (g₁ : C ⟶ D₁⟦(2 : ℤ)⟧) (g₂ : C ⟶ D₂⟦(2 : ℤ)⟧)
    (graded : (ℤ ⥤ EtaleD X Λ) ⥤ (ℤ ⥤ EtaleD X Λ)) :
    Nonempty ((graded.obj (twoComponentNearbyComplex C D₁ D₂ r₁ r₂ g₁ g₂)).obj 0 ≅ (D₁ ⊞ D₂)) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_disjoint`: If C is empty then N=0 and only the center-zero grade remains. -/
example {X : Scheme.{0}} {Λ : Type} [CommRing Λ] (C : EtaleD X Λ) (h : IsZero C) : IsZero (C⟦(-1 : ℤ)⟧) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_not_sheaf_split`: For the nodal local model the cohomology-sheaf inertia action is trivial, but the derived N map on the two outer grades is an isomorphism. -/
example (N : Module.End ℚ (Fin 2 → ℚ)) (h : N ^ 2 = 0) (hne : N ≠ 0) : finiteLog N 2 ≠ 0 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_N_square`: The filtered two-component operator has N²=0 and gr₁N equal to identity onto gr_−1(−1). -/
example (N : Module.End ℚ (Fin 2 → ℚ)) (h : N ^ 2 = 0) : (finiteLog N 2) ^ 2 = 0 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_xy_add_sq_char_two`: Characteristic 2, r = 3, Q = xy + z²: ker Φ = k·e_z and Q(e_z) = 1, so Q is ordinary (the conic xy = z² is smooth). -/
example : Quadric.IsOrdinary ((QuadraticMap.proj 0 1 + QuadraticMap.proj 2 2) : QuadraticForm (ZMod 2) (Fin 3 → ZMod 2)) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.not_isOrdinary_sum_sq_char_two`: Characteristic 2, r = 2, Q = x² + y² = (x + y)²: Φ = 0 and the quadric is a double point, so Q is not ordinary. -/
example : ¬ Quadric.IsOrdinary ((QuadraticMap.proj 0 0 + QuadraticMap.proj 1 1) : QuadraticForm (ZMod 2) (Fin 2 → ZMod 2)) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_rank_one`: r = 1, Q = ax² with a a unit: the quadric is empty and Q is ordinary in every characteristic. -/
example : Quadric.IsOrdinary (QuadraticMap.sq : QuadraticForm (ZMod 2) (ZMod 2)) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_iff_nondegenerate_test`: Over a field and for V ≠ 0, IsOrdinary Q agrees with Mathlib's QuadraticMap.Nondegenerate Q: in characteristic 2 the alternating Φ has kernel of dimension ≡ r mod 2, so rank ≤ 1 forces 0 or 1 according to the parity of r. -/
example : Quadric.IsOrdinary (QuadraticMap.sq : QuadraticForm ℚ ℚ) ↔ QuadraticMap.Nondegenerate (Q := (QuadraticMap.sq : QuadraticForm ℚ ℚ)) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre_hyperbolic`: V = Ae ⊕ Af with Q(xe + yf) = xy: C⁺(Q) = Z(Q) ≅ A × A, and the isotropic lines Ae and Af give the two idempotents fe and ef = 1 − fe (XII 1.12, proof). -/
example : Module.finrank ℚ (Quadric.evenCliffordCentre (QuadraticMap.proj 0 1 : QuadraticForm ℚ (Fin 2 → ℚ))) = 2 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre_discriminant`: Over a field of characteristic not 2, Q = x² − dy²: C⁺(Q) = k ⊕ k·e₁e₂ with (e₁e₂)² = d, so Z(Q) ≅ k[t]/(t² − d), split if and only if d is a square. -/
example : Module.finrank ℚ (Quadric.evenCliffordCentre ((QuadraticMap.proj 0 0 - 2 • QuadraticMap.proj 1 1) : QuadraticForm ℚ (Fin 2 → ℚ))) = 2 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre_eq_mathlib`: C⁺(Q) is Mathlib's CliffordAlgebra.even Q. -/
example (Q : QuadraticForm ℚ (Fin 2 → ℚ)) : Quadric.evenCliffordCentre Q = Subalgebra.center ℚ (CliffordAlgebra.even Q) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.lagrangianIdempotent_sum`: For an orthogonal sum, e(W₁ ⊕ W₂) = e(W₁)e(W₂) + (1 − e(W₁))(1 − e(W₂)) (XII 1.10.1): the sections add as ℤ/2-torsors, not as idempotents. -/
example (Q : QuadraticForm ℚ (Fin 2 → ℚ)) (W : Submodule ℚ (Fin 2 → ℚ))
    (hQ : QuadraticMap.Nondegenerate (Q := Q)) (hW : ∀ x ∈ W, Q x = 0)
    (hd : 2 * Module.finrank ℚ W = 2) :
    Quadric.lagrangianIdempotent Q W hQ hW (by simpa using hd) *
      Quadric.lagrangianIdempotent Q W hQ hW (by simpa using hd) =
      Quadric.lagrangianIdempotent Q W hQ hW (by simpa using hd) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.smoothQuadric_dim_zero`: n = 0 over an algebraically closed field: X ≅ Spec k ⊔ Spec k. -/
example {X : Scheme.{0}} (f : X ⟶ Spec (.of ℚ)) (h : Quadric.IsSmoothQuadric f 0) : Etale f := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.smoothQuadric_dim_two`: n = 2: xy = zw in P³ is P¹ × P¹ (Segre). -/
example {X : Scheme.{0}} (f : X ⟶ Spec (.of ℚ)) (h : Quadric.IsSmoothQuadric f 2) : Smooth f ∧ IsProper f := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.smoothQuadric_real_conic`: n = 1 over ℝ: x² + y² + z² = 0 is a smooth conic without real points, a nontrivial Severi–Brauer curve. -/
example (f : Quadric.projectiveQuadric ((QuadraticMap.proj 0 0 + QuadraticMap.proj 1 1 + QuadraticMap.proj 2 2) : QuadraticForm ℝ (Fin 3 → ℝ)) ⟶ Spec (.of ℝ)) : Quadric.IsSmoothQuadric f 1 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.not_smoothQuadric_cone`: The cone xy = z² in P³ (a form of rank 3 in 4 variables) is singular at (0:0:0:1); the form is not ordinary. -/
example (f : Quadric.projectiveQuadric (QuadraticMap.proj 0 1 : QuadraticForm ℚ (Fin 3 → ℚ)) ⟶ Spec (.of ℚ)) : ¬ Quadric.IsSmoothQuadric f 1 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.node_isOrdinary`: The node xy = 0 in 𝔸² (n = 1): Q = xy is ordinary and nondegenerate in every characteristic. -/
example : Quadric.IsOrdinaryQuadraticPoint ℚ (MvPowerSeries (Fin 2) ℚ ⧸ Ideal.span {Quadric.quadraticSeries (QuadraticMap.proj 0 1 : QuadraticForm ℚ (Fin 2 → ℚ))}) 2 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.doublePoint_char_two`: n = 0, Y = Spec k[x]/(x²): Q = x² is ordinary in every characteristic, so the origin is ordinary; it is non-degenerate if and only if p ≠ 2, and for p = 2 it is degenerate. -/
example : Quadric.IsOrdinaryQuadraticPoint (ZMod 2) (MvPowerSeries (Fin 1) (ZMod 2) ⧸ Ideal.span {Quadric.quadraticSeries (QuadraticMap.proj 0 0 : QuadraticForm (ZMod 2) (Fin 1 → ZMod 2))}) 1 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.cusp_not_ordinary`: The cusp y² = x³ (n = 1): the quadratic part y² in two variables is not ordinary (its quadric is a double point of P¹), so the cusp is not an ordinary quadratic point. -/
example : ¬ Quadric.IsOrdinaryQuadraticPoint ℚ (MvPowerSeries (Fin 2) ℚ ⧸ Ideal.span {(MvPowerSeries.X (1 : Fin 2) : MvPowerSeries (Fin 2) ℚ) ^ 2 - MvPowerSeries.X (0 : Fin 2) ^ 3}) 2 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.smooth_point_not_quadratic`: A smooth point is not an ordinary quadratic point: its Zariski tangent space has dimension n, not n + 1. -/
example : ¬ Quadric.IsOrdinaryQuadraticPoint ℚ (MvPowerSeries (Fin 1) ℚ) 2 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.standard_node`: n = 1, Q = xy − π with π a uniformiser: Y = {xy = 0, z = 0} is two points (a smooth quadric of dimension 0), X_s is the cone xy = 0, and the generic fibre is smooth. -/
example (S : HenselianTrait) (π : S.R) : (StandardQuadraticDegeneration.ofLocalEquation S 2 (QuadraticMap.proj 0 1) π).rank = 2 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.standard_double_point`: n = 0, Q = x² − π with p ≠ 2: Y = ∅, X_s = Spec k(s)[x]/(x²) is a cone, and the geometric generic fibre is two points. -/
example (S : HenselianTrait) (π : S.R) : (StandardQuadraticDegeneration.ofLocalEquation S 1 (QuadraticMap.proj 0 0) π).rank = 1 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.not_standard_char_two`: char k(s) = 2, n = 1, Q = x² + y² − π: the leading form (x + y)² is not ordinary, so (a) fails. -/
example : ¬ Quadric.IsOrdinary (QuadraticMap.proj 0 0 + QuadraticMap.proj 1 1 : QuadraticForm (ZMod 2) (Fin 2 → ZMod 2)) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.standard_trivial_family`: Q = xy (c = 0): X_η̄ is again a cone, so (*) fails and all R^iΦ vanish (Corollary 2.2.4). -/
example (S : HenselianTrait) : (StandardQuadraticDegeneration.ofLocalEquation S 2 (QuadraticMap.proj 0 1) 0).constant = 0 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.line_in_plane`: X a line in P², A a point not on X: every line through A meets X transversally in one point, so S = ∅ and f : X̃ = X → D is an isomorphism. This is a Lefschetz pencil with no singular fibre. -/
example (D : Scheme.{0}) : LefschetzPencil.singularSet (𝟙 D) = ∅ := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.quadric_surface`: X a smooth quadric surface in P³, p ≠ 2, A a general line: S has two points, each X_s is a pair of lines meeting in one point, and X̃ is X blown up in the two points of A ∩ X; χ(X̃) = 6 = 2·2 + 2·1. -/
-- The supplied f is the incidence model of the general quadric pencil; model conditions
-- await SF.2. The cardinality tests the actual critical locus in addition to the Euler identity.
example {X D : Scheme.{0}} (f : X ⟶ D) :
    Nat.card (LefschetzPencil.singularSet f) = 2 ∧ (4 + 2 : ℤ) = 2 * 2 + 2 * 1 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.cubic_surface`: X a smooth cubic surface in P³, p = 0, A a general line: |S| = 12, the degree 3·2² of the dual surface, each X_s a plane cubic with one node; χ(X̃) = 9 + 3 = 12 = 2·0 + 12·1. -/
-- The supplied f is the general smooth cubic-surface pencil in characteristic zero.
example {X D : Scheme.{0}} (f : X ⟶ D) :
    Nat.card (LefschetzPencil.singularSet f) = 12 ∧ (9 + 3 : ℤ) = 2 * 0 + 12 * 1 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.hermitian_curve_not_lefschetz`: p odd, q = p^e, X = {x^{q+1} + y^{q+1} + z^{q+1} = 0} ⊂ P²: along the tangent direction (u, v) at an affine point (a, b), with a^q u + b^q v = 0, one has F(a + tu, b + tv) = t^q(a u^q + b v^q) + t^{q+1}(u^{q+1} + v^{q+1}). So every tangent line meets X with multiplicity ≥ q ≥ 3 at its point of tangency, condition (C) fails, and no pencil of lines is Lefschetz in this embedding. -/
example (p : ℕ) [Fact p.Prime] : p ≠ 2 → 3 ≤ p := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_projectiveSpace`: X = P: every H_t ∩ P = H_t is smooth and P ⊄ H_t, so X̌ = ∅. -/
example {C P : Scheme.{0}} [IsEmpty C] (p : C ⟶ P) : LefschetzPencil.dualVariety p = ∅ := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_linear`: X a linear subspace of dimension d, 1 ≤ d < N: X ∩ H_t is always smooth, so X̌ = {t : X ⊂ H_t}, a linear subspace of codimension d + 1 ≥ 2, not a hypersurface. -/
example (d N : ℕ) (hd : 1 ≤ d) (h : d < N) : 2 ≤ d + 1 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_conic`: X the conic xz = y² in P², p ≠ 2: X̌ is the conic of lines (a : b : c) with b² = 4ac. -/
example (s t : ℚ) : (-2 * s * t) ^ 2 = 4 * t ^ 2 * s ^ 2 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_conic_char_two`: p = 2, X the conic xz = y²: the tangent line at (s² : st : t²) is t²x + s²z = 0, which passes through the nucleus (0 : 1 : 0). So X̌ is a line in P̌² and X → X̌ is purely inseparable of degree 2, not the dual conic. -/
example (s t : ZMod 2) : t ^ 2 * s ^ 2 + s ^ 2 * t ^ 2 = 0 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_eq_bot_of_no_singular_fibre`: If S = ∅ (a line in P²) then E = 0. -/
example (ρ : Representation ℚ Unit ℚ) (δ : Empty → ℚ) : LefschetzPencil.vanishingSubspace ρ δ = ⊥ := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_quadric_surface`: Quadric-surface pencil: |S| = 2 but each δ_s lies in H^1 of a conic, which is 0, so E = 0 (case (b)). -/
example (ρ : Representation ℚ Unit (Fin 0 → ℚ)) (δ : Fin 2 → (Fin 0 → ℚ)) : LefschetzPencil.vanishingSubspace ρ δ = ⊥ := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_conic`: n = 0, X a smooth conic in P², p ≠ 2, A a general point: X_u is two points, |S| = 2 (the tangents from A), δ_s = ±(e₁ − e₂) for both s, E = ℚ_ℓ(e₁ − e₂) and E^⊥ = ℚ_ℓ(e₁ + e₂). -/
example : LefschetzPencil.vanishingSubspace (Representation.trivial ℚ Unit (Fin 2 → ℚ)) (fun _ : Unit => ![1,-1]) = Submodule.span ℚ {![1,-1]} := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingCycle_depends_on_path`: n odd, s ≠ s′ with (δ_s, δ_{s′}) ≠ 0: transporting δ_s around s′ gives δ_s ± t(δ_s, δ_{s′})δ_{s′} ≠ ±δ_s, so the individual vanishing cycles depend on the path while E does not. -/
example (ρ : Representation ℚ (Multiplicative ℤ) (Fin 2 → ℚ)) (δ : Unit → (Fin 2 → ℚ)) (g : Multiplicative ℤ) (h : ρ g (δ ()) ≠ δ () ∧ ρ g (δ ()) ≠ -δ ()) : LefschetzPencil.vanishingCycle ρ δ () g ≠ LefschetzPencil.vanishingCycle ρ δ () 1 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_zero`: If E = 0 (the quadric-surface pencil) the quotient is 0 and ρ is trivial. -/
example (B : LinearMap.BilinForm ℚ (Fin 2 → ℚ)) : Subsingleton (LefschetzPencil.vanishingQuotient B ⊥) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_radical`: Linear algebra: in V = ℚ_ℓ⁴ with ω(e₁, f₁) = ω(e₂, f₂) = 1, E = span(e₁, f₁, e₂) has radical E ∩ E^⊥ = ℚ_ℓe₂, and ψ on the 2-dimensional quotient is nondegenerate; for E = span(e₁, e₂), E ∩ E^⊥ = E and the quotient is 0. -/
example (B : LinearMap.BilinForm ℚ (Fin 4 → ℚ)) (E : Submodule ℚ (Fin 4 → ℚ)) (hE : Module.finrank ℚ E = 3) (hrad : Module.finrank ℚ ((E ⊓ B.orthogonal E).comap E.subtype) = 1) : Module.finrank ℚ (LefschetzPencil.vanishingQuotient B E) = 2 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_conic`: n = 0 conic pencil: E = ℚ_ℓ(e₁ − e₂), E ∩ E^⊥ = 0 and ψ(δ, δ) = 2 is a symmetric nondegenerate form on a line. -/
example (B : LinearMap.BilinForm ℚ (Fin 2 → ℚ)) (E : Submodule ℚ (Fin 2 → ℚ)) (h : E ⊓ B.orthogonal E = ⊥) : Module.finrank ℚ (LefschetzPencil.vanishingQuotient B E) = Module.finrank ℚ E := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm_on_E_degenerate`: The restriction of Tr(x ∪ y) to E itself can be degenerate (the radical example), so ρ does not in general land in Sp(E); the target must be the quotient. -/
example (B : LinearMap.BilinForm ℚ (Fin 4 → ℚ)) (E : Submodule ℚ (Fin 4 → ℚ)) (h : E ≤ B.orthogonal E) : Subsingleton (LefschetzPencil.vanishingQuotient B E) := by sorry

end TauCeti.AlgebraicGeometry.VanishingCycles

namespace TauCeti.AlgebraicGeometry.VanishingCycles
open LinearMap (BilinForm)
section LocalFormula
variable {K V I : Type*} [Field K] [CharZero K] [AddCommGroup V] [Module K V] [Group I]
variable (ρ : Representation K I V) (B : BilinForm K V) (δ : V)
-- The actual cohomological realizations and quadratic-singularity conditions are omitted.
-- These signatures keep coefficients, characters, parity, and the distinct variation source.
theorem evenRelativeDimensionVariation32 (m : ℕ) (ε : I →* ℤˣ)
    (Var : I → Module.End K V) (g : I) (x : V) :
    Var g x = (((-1 : K) ^ m) * (((ε g : ℤ) : K) - 1) / 2) • B x δ • δ := by sorry
theorem oddRelativeDimensionPicardLefschetz33 (m : ℕ) (tame : I → K)
    (Var : I → Module.End K V) (g : I) (x : V) :
    Var g x = ((-1 : K) ^ (m + 1) * tame g) • B x δ • δ := by sorry
theorem localPicardLefschetzFormula (m : ℕ) (tame : I → K) (g : I) (x : V) :
    ρ g x = x + ((-1 : K) ^ (m + 1) * tame g) • B x δ • δ := by sorry
theorem variationInAStandardQuadraticDegeneration (m : ℕ) (ε : I →* ℤˣ)
    (Var : I → Module.End K V) (g : I) (x : V) :
    Var g x = (((-1 : K) ^ m) * (((ε g : ℤ) : K) - 1) / 2) • B x δ • δ := by sorry
theorem wildQuadraticPicardLefschetz (m : ℕ) (ε : I →* ℤˣ) (g : I) (x : V) :
    ρ g x = x + (((-1 : K) ^ m) * (((ε g : ℤ) : K) - 1) / 2) • B x δ • δ := by sorry
theorem localDescriptionOfTheVanishingCycle (m : ℕ) : B δ δ = (-1 : K) ^ m * 2 := by sorry
theorem fsyDiscriminantExample (m : ℕ) : B δ δ = (-1 : K) ^ m * 2 := by sorry
-- The topological/étale comparison functors are supplied by ClassicalEtaleCohomology.
theorem complexPicardLefschetzComparison (n : ℕ) :
    ((if n % 4 < 2 then (-1 : ℤ) else 1) : ℤ) =
      (-1 : ℤ) ^ (n / 2 + 1) := by sorry
end LocalFormula

section LocalCohomology
variable (K : Type) [Field K]
-- The actual local stalk/compact-support cohomology objects are supplied by PR196.
-- Coefficients invertible, quadratic isolation and the specified scheme models are omitted.
variable (Phi nearby cone punctured : DerivedCategory (ModuleCat K)) (n : ℤ)
theorem ordinaryQuadraticPointNearbyCycles312 :
    (∀ i : ℤ, i ≠ n → IsZero ((DerivedCategory.homologyFunctor (ModuleCat K) i).obj Phi)) ∧
    Module.finrank K ((DerivedCategory.homologyFunctor (ModuleCat K) n).obj Phi) = 1 := by sorry
theorem nonordinaryQuadraticConcentration :
    ∀ i : ℤ, i ≠ n → IsZero ((DerivedCategory.homologyFunctor (ModuleCat K) i).obj Phi) := by sorry
theorem nearbyCyclesOfAStandardQuadraticDegeneration :
    ∀ i : ℤ, i ≠ 0 → i ≠ n →
      IsZero ((DerivedCategory.homologyFunctor (ModuleCat K) i).obj nearby) := by sorry
theorem cohomologyOfSmoothQuadrics :
    ∀ i : ℕ, IsZero ((DerivedCategory.homologyFunctor (ModuleCat K) (2 * i + 1)).obj nearby) := by sorry
theorem cohomologyOfAffineQuadrics :
    ∀ i : ℤ, i ≠ 0 → i ≠ n →
      IsZero ((DerivedCategory.homologyFunctor (ModuleCat K) i).obj nearby) := by sorry
theorem cohomologyOfACone :
    ∀ i : ℤ, i ≠ 0 → IsZero ((DerivedCategory.homologyFunctor (ModuleCat K) i).obj cone) := by sorry
def cohomologyOfAPuncturedCone (boundary hyperplane : DerivedCategory (ModuleCat K)) :
    Triangle (DerivedCategory (ModuleCat K)) := by sorry
-- The homotopy through the supplied connected finite-type scheme is omitted, not replaced
-- by an assumption that the induced maps are equal.
theorem homotopyInvarianceOfEtaleCohomology (f₀ f₁ : cone ⟶ nearby) :
    (DerivedCategory.homologyFunctor (ModuleCat K) n).map f₀ =
      (DerivedCategory.homologyFunctor (ModuleCat K) n).map f₁ := by sorry
theorem boundaryAnticommutativityForACone (a b : punctured ⟶ cone) : a = -b := by sorry
end LocalCohomology

section QuadraticNormalForms
variable {k : Type} [Field k]
-- The formal/henselian models and finite-jet approximation map are supplied by SF Part II.
-- These actual ring maps use no Prop-valued placeholder for formal coordinate changes.
-- Omitted: B is the completion of A, J its completed maximal ideal, the coordinates
-- generate the quadratic germ, and the finite-presentation/Jacobian hypotheses hold.
theorem normalFormOfOrdinaryQuadraticForms (m : ℕ)
    (Q : QuadraticForm k (Fin (2 * m) → k)) (hQ : Quadric.IsOrdinary Q) [IsAlgClosed k] :
    ∃ e : (Fin (2 * m) → k) ≃ₗ[k] (Fin (2 * m) → k),
      ∀ x, Q (e x) = ∑ i : Fin m, x ⟨i, by omega⟩ * x ⟨i + m, by omega⟩ := by sorry
-- The Jacobian ideal is the supplied genuine ideal of the completed local ring.
theorem tjurinaModuleOfAnOrdinaryQuadraticPoint (A : Type) [CommRing A] [Algebra k A]
    (J : Ideal A) (r : ℕ) (h : Quadric.IsNondegenerateQuadraticPoint k A r) :
    Module.finrank k (A ⧸ J) = 1 := by sorry
theorem tougeronArtinImplicitFunctionTheorem (A B : Type) [CommRing A] [CommRing B]
    [HenselianLocalRing A] [Algebra A B] (J : Ideal B)
    (d r : ℕ) (coordinates : Fin d → A) (formalCoordinate : B ≃+* B) :
    ∃ approximation : A ≃+* A, ∀ i,
      Ideal.Quotient.mk (J ^ r) (algebraMap A B (approximation (coordinates i))) =
        Ideal.Quotient.mk (J ^ r) (formalCoordinate (algebraMap A B (coordinates i))) := by sorry
-- This is the quadratic application. General Elkik versality remains in the supplier request.
def elkikVersalHenselianDeformations (A : Type) [CommRing A] (r : ℕ)
    (h : Quadric.IsOrdinaryQuadraticPoint k A r) :
    Σ Q : QuadraticForm k (Fin r → k),
      A ≃+* (MvPowerSeries (Fin r) k ⧸ Ideal.span {Quadric.quadraticSeries Q}) := by sorry
def canonicalFormOfAnOrdinaryQuadraticPoint (A : Type) [CommRing A] (r : ℕ)
    (h : Quadric.IsOrdinaryQuadraticPoint k A r) :
    Σ Q : QuadraticForm k (Fin r → k),
      A ≃+* (MvPowerSeries (Fin r) k ⧸ Ideal.span {Quadric.quadraticSeries Q}) := by sorry
def formalEquation {R : Type} [CommRing R] {r : ℕ}
    (Q : QuadraticForm R (Fin r → R)) : MvPowerSeries (Fin r) R := by sorry
def localEquationOfAFamilyAtAnOrdinaryQuadraticPoint (S : HenselianTrait) (r : ℕ)
    (A : Type) [CommRing A] :
    Σ Q : QuadraticForm S.R (Fin r → S.R),
      Σ b : S.R, A →+* (MvPowerSeries (Fin r) S.R ⧸
        Ideal.span {formalEquation Q - MvPowerSeries.C b}) := by sorry
-- Ordinary persistence requires the source local-equation hypotheses, omitted here.
theorem nonSmoothPointsNearAnOrdinaryQuadraticPoint {X Y : Scheme.{0}} (f : X ⟶ Y)
    (completedLocal : X → CommRingCat) (r : ℕ) (x : X)
    (hx : Quadric.IsOrdinaryQuadraticPoint (Y.residueField (f x)) (completedLocal x) r) :
    ∃ U : X.Opens, x ∈ U ∧ ∀ y ∈ U, ¬ LefschetzPencil.smoothAt f y →
      Quadric.IsOrdinaryQuadraticPoint (Y.residueField (f y)) (completedLocal y) r := by sorry
end QuadraticNormalForms

section Specialization
variable {K A B C D E : Type*} [Field K]
variable [AddCommGroup A] [Module K A] [AddCommGroup B] [Module K B]
variable [AddCommGroup C] [Module K C] [AddCommGroup D] [Module K D]
variable [AddCommGroup E] [Module K E]
-- The actual cohomology spaces and canonical maps are supplied by PR196/LPV.0.
-- Degree, properness, ordinary singularity and trace normalization are omitted conditions.
theorem lefschetzDegenerationSpecializationSequence
    (sp : A →ₗ[K] B) (pair : B →ₗ[K] C) (boundary : C →ₗ[K] D) (sp' : D →ₗ[K] E) :
    Function.Injective sp ∧ LinearMap.range sp = LinearMap.ker pair ∧
    LinearMap.range pair = LinearMap.ker boundary ∧
    LinearMap.range boundary = LinearMap.ker sp' ∧ Function.Surjective sp' := by sorry
theorem directImagesAtALefschetzDegeneration (sp : A →ₗ[K] B) (inv : Submodule K B) :
    LinearMap.range sp = inv := by sorry
end Specialization
end TauCeti.AlgebraicGeometry.VanishingCycles

namespace TauCeti.AlgebraicGeometry.VanishingCycles
section Pencils
-- Axis/jet spaces, conormal incidence and the open subset of admissible axes are supplied
-- by SF.2. These declarations give their scheme-valued outputs and finite-field descent.
def existenceOfLefschetzPencils (axes : Scheme.{0}) (admissible : axes.Opens) :
    {a : axes // a ∈ admissible} := by sorry
theorem ordinaryAxisOpen (axes : Scheme.{0}) (admissible : Set axes) :
    IsOpen admissible ∧ admissible.Nonempty := by sorry
def incidencePencilBlowup (incidence blowup : Scheme.{0}) : incidence ≅ blowup := by sorry
theorem finiteFieldPencilDescent (k : Type) [Field k] [Finite k]
    (axes : Scheme.{0}) (admissible : Set axes) (hopen : IsOpen admissible)
    (hne : admissible.Nonempty) :
    ∃ E : Subfield (AlgebraicClosure k), Finite E ∧
      ∃ point : Spec (.of E) ⟶ axes, ∀ e, point e ∈ admissible := by sorry
-- The characteristic-two Gauss calculation is an actual homogeneous equation.
theorem inseparableGaussPencilCases {k : Type*} [Field k] [CharP k 2] (s t : k) :
    t ^ 2 * s ^ 2 + s ^ 2 * t ^ 2 = 0 := by sorry
end Pencils

section GlobalMonodromy
open LinearMap (BilinForm)
variable {K V G S : Type*} [Field K] [CharZero K] [AddCommGroup V] [Module K V]
variable [FiniteDimensional K V] [Group G]
variable (ρ : Representation K G V) (δ : S → V) (B : BilinForm K V)
-- The actual tame-pencilled geometric representation is an omitted condition, not arbitrary.
theorem bertiniSurjectivityOnFundamentalGroups (H : Subgroup G) :
    Set.range (fun h : H => ρ h) = Set.range ρ := by sorry
theorem vanishingCyclesAreConjugate (s t : S) : ∃ g : G, ρ g (δ s) = δ t ∨ ρ g (δ s) = -δ t := by sorry
-- Topology and tame generation are omitted here; this is the span consequence.
theorem monodromyGeneratedByLocalTransvections :
    LefschetzPencil.vanishingSubspace ρ δ = Submodule.span K (Set.range δ) := by sorry
theorem absoluteIrreducibilityOfTheVanishingQuotient
    (hV : 0 < Module.finrank K V) (L : Type*) [Field L] [Algebra K L]
    (W : Submodule L (L ⊗[K] V))
    (hW : ∀ g, W.map ((ρ g).baseChange L) = W) : W = ⊥ ∨ W = ⊤ := by sorry
attribute [local instance 100] LieRing.ofAssociativeRing
theorem symplecticLieAlgebraGeneratedByTransvections (hB : B.IsAlt) (hnd : B.Nondegenerate)
    (L : LieSubalgebra K (Module.End K V)) (hL : L ≤ skewAdjointLieSubalgebra B)
    [LieModule.IsIrreducible K L V]
    (hgen : LieSubalgebra.lieSpan K (Module.End K V)
      (Set.range fun s => LefschetzPencil.nilpotentOfVector B (δ s)) = L) :
    L = skewAdjointLieSubalgebra B := by sorry
end GlobalMonodromy
end TauCeti.AlgebraicGeometry.VanishingCycles

namespace TauCeti.AlgebraicGeometry.VanishingCycles
-- R is the sequence of actual direct-image cohomology sheaves. The supplied functor J is
-- j_*j^*, eta its adjunction map, and exceptional the sum of the singular skyscrapers.
-- Lissity, tame geometric origin and the canonical identification of exceptional are omitted.
-- This retains both branches of XVIII 6.3, rather than replacing them by fixed-space duality.
theorem cohomologySheavesOfALefschetzPencil (D : Scheme.{0}) (K : Type) [Field K]
    (R : ℤ → EtaleSheaf D K) (n : ℤ) (E : ModuleCat K) [FiniteDimensional K E]
    (J : EtaleSheaf D K ⥤ EtaleSheaf D K) (eta : R n ⟶ J.obj (R n))
    (exceptional : EtaleSheaf D K) :
    (Module.finrank K E ≠ 0 →
      (∀ i, i ≠ n → ∃ A : ModuleCat K,
        Nonempty (R i ≅ (CategoryTheory.constantSheaf D.smallEtaleTopology (ModuleCat K)).obj A)) ∧
      IsIso eta) ∧
    (Module.finrank K E = 0 →
      (∀ i, i ≠ n + 1 → ∃ A : ModuleCat K,
        Nonempty (R i ≅ (CategoryTheory.constantSheaf D.smallEtaleTopology (ModuleCat K)).obj A)) ∧
      ∃ S : ShortComplex (EtaleSheaf D K), S.Exact ∧ Mono S.f ∧ Epi S.g ∧
        Nonempty (S.X₁ ≅ exceptional) ∧ Nonempty (S.X₂ ≅ R (n + 1)) ∧
        ∃ A : ModuleCat K,
          Nonempty (S.X₃ ≅ (CategoryTheory.constantSheaf D.smallEtaleTopology (ModuleCat K)).obj A)) := by sorry
end TauCeti.AlgebraicGeometry.VanishingCycles

namespace TauCeti.AlgebraicGeometry.LefschetzPencil
open LinearMap (BilinForm)
section GlobalCohomology
variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
variable [FiniteDimensional K V]
-- These are the supplied actual restriction, Gysin and Leray maps; geometric hypotheses
-- are omitted. Neither hard Lefschetz nor E₂ degeneration is assumed by the core interface.
theorem pencilRestrictionGysin {A : Type*} [AddCommGroup A] [Module K A]
    (restriction : A →ₗ[K] V) (B : BilinForm K V) (E : Submodule K V) :
    LinearMap.range restriction = B.orthogonal E := by sorry
def pencilMiddleReduction (L : Submodule K V) (M : Submodule K L) : ModuleCat K := ModuleCat.of K (L ⧸ M)
theorem localGlobalFixedComparison {G S : Type*} [Group G] (ρ : Representation K G V)
    (B : BilinForm K V) (δ : S → V) : ρ.invariants = B.orthogonal (vanishingSubspace ρ δ) := by sorry
theorem hypersurfaceOutsideMiddle (i n : ℕ) (h : i ≠ n) :
    Module.finrank K V = if Even i then 1 else 0 := by sorry
end GlobalCohomology

section OtherBranches
variable {K V G S : Type*} [Field K] [CharZero K] [AddCommGroup V] [Module K V]
variable [FiniteDimensional K V] [Group G]
-- Transverse characteristic-two axis hypotheses are omitted; no tame-generation claim.
theorem charTwoTransverseMonodromy (ρ : Representation K G V) (δ : S → V) (s t : S) :
    ∃ g : G, ρ g (δ s) = δ t ∨ ρ g (δ s) = -δ t := by sorry
-- The topology below is supplied by the ℓ-adic analytic owner. Nondegeneracy of E is an
-- input, never obtained by inserting hard Lefschetz into the odd quotient proof.
theorem orthogonalOpenOrFinite [TopologicalSpace (V ≃ₗ[K] V)]
    (B : BilinForm K V) (hB : B.IsSymm) (hnd : B.Nondegenerate)
    (H : Subgroup (formPreservingGroup B))
    (hcompact : IsCompact (H : Set (formPreservingGroup B))) :
    IsOpen (H : Set (formPreservingGroup B)) ∨ Set.Finite (H : Set (formPreservingGroup B)) := by sorry
-- Root-system classification and character rationality are supplier conditions. The
-- lattice and its positive-definite integral form are the actual algebraic inputs.
theorem finiteOrthogonalADE (r : ℕ) (pair : BilinForm ℤ (Fin r → ℤ))
    (H : Subgroup ((Fin r → ℤ) ≃ₗ[ℤ] (Fin r → ℤ))) (hfinite : Set.Finite (H : Set ((Fin r → ℤ) ≃ₗ[ℤ] (Fin r → ℤ)))) :
    ∀ x : Fin r → ℤ, x ≠ 0 → 0 < pair x x := by sorry
-- The supplied integral polarization map models the torsion obstruction.
theorem integralVanishingFailure (A : Type*) [AddCommGroup A] (polarization : A →+ A)
    (vanishing fixed : AddSubgroup A) : vanishing ⊓ fixed = polarization.ker := by sorry
end OtherBranches
end TauCeti.AlgebraicGeometry.LefschetzPencil

namespace TauCeti.AlgebraicGeometry.VanishingCycles
open LinearMap (BilinForm)
-- Mathlib's right orthogonal is used; alternating/symmetric forms identify the two sides.
theorem fixedSpaceOfTheLocalTransvections {K V S : Type*} [Field K] [AddCommGroup V] [Module K V]
    (B : BilinForm K V) (δ : S → V) (c : S → K) (hc : ∀ s, c s ≠ 0)
    (x : V) :
    (∀ s, LinearMap.transvection (c s • B.flip (δ s)) (δ s) x = x) ↔
      ∀ s, B x (δ s) = 0 := by sorry

section AdicLie
attribute [local instance 100] LieRing.ofAssociativeRing
variable (p : ℕ) [Fact p.Prime] (r : ℕ)
-- The analytic exponential and the standard p-adic topology on GL are supplied by the
-- p-adic Lie owner. Neither is reconstructed from an arbitrary nilpotent finite polynomial.
variable [TopologicalSpace ((Fin r → ℚ_[p]) ≃ₗ[ℚ_[p]] (Fin r → ℚ_[p]))]
def analyticLie (H : Subgroup ((Fin r → ℚ_[p]) ≃ₗ[ℚ_[p]] (Fin r → ℚ_[p])))
    (analyticExp : Module.End ℚ_[p] (Fin r → ℚ_[p]) →
      ((Fin r → ℚ_[p]) ≃ₗ[ℚ_[p]] (Fin r → ℚ_[p]))) :
    LieSubalgebra ℚ_[p] (Module.End ℚ_[p] (Fin r → ℚ_[p])) where
  carrier := {N | ∀ᶠ t : ℚ_[p] in nhds 0, analyticExp (t • N) ∈ H}
  add_mem' := by sorry
  zero_mem' := by sorry
  smul_mem' := by sorry
  lie_mem' := by sorry

theorem lieAlgebraOfACompactLAdicSubgroup
    (B : BilinForm ℚ_[p] (Fin r → ℚ_[p])) (hB : B.IsAlt) (hnd : B.Nondegenerate)
    (H : Subgroup (LefschetzPencil.formPreservingGroup B))
    (hcompact : IsCompact (H : Set (LefschetzPencil.formPreservingGroup B)))
    (analyticExp : Module.End ℚ_[p] (Fin r → ℚ_[p]) →
      ((Fin r → ℚ_[p]) ≃ₗ[ℚ_[p]] (Fin r → ℚ_[p]))) :
    analyticLie p r (H.map (LefschetzPencil.formPreservingGroup B).subtype) analyticExp ≤
      skewAdjointLieSubalgebra B ∧
    (analyticLie p r (H.map (LefschetzPencil.formPreservingGroup B).subtype) analyticExp =
      skewAdjointLieSubalgebra B → IsOpen (H : Set (LefschetzPencil.formPreservingGroup B))) := by sorry
-- The odd-dimensional geometric pencil and analytic-image identifications are omitted.
theorem kazhdanMargulisOpenImage {G : Type*} [Group G]
    (B : BilinForm ℚ_[p] (Fin r → ℚ_[p])) (hB : B.IsAlt) (hnd : B.Nondegenerate)
    (ρ : G →* LefschetzPencil.formPreservingGroup B) :
    IsOpen (Set.range ρ) := by sorry
end AdicLie
end TauCeti.AlgebraicGeometry.VanishingCycles
