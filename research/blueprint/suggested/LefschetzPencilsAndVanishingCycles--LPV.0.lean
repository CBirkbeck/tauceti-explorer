/-
This file is not the roadmap and is not exhaustive. The roadmap document
research/blueprint/readmes/LefschetzPencilsAndVanishingCycles--LPV.0.md is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names
and signatures. No implementation is claimed.

LPV.0–6, revised after the independent review. Algebraic specializations below are
labelled by their domain. A geometric theorem with an unavailable supplier hypothesis
has no declaration here: its exact missing form, including all API/test names, is
listed at the end and in the packet's prototype ledger. Such entries are gaps, not
successful prototypes or tests. In particular no arbitrary functor, representation,
quadric, pencil, filtration or t-structure stands in for the geometric object.

Pinned Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174.
Pinned Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369.
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
import Mathlib.LinearAlgebra.Matrix.BilinearForm
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
theorem inertia_eq_kernel (S : HenselianTrait) : S.inertia =
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

abbrev AlgebraicGluing (C : Type*) [Category C] (I : Type*) [Group I] :=
  Comma (trivialActionFunctor C I) (𝟭 (Action C I))

namespace AlgebraicGluing
variable {C : Type*} [Category C] {I : Type*} [Group I]
def sp_pullback : C ⥤ AlgebraicGluing C I where
  obj X := ⟨X, Action.trivial I X, 𝟙 _⟩
  map f := { left := f, right := { hom := f, comm := by sorry }, w := by sorry }
abbrev etaPart : AlgebraicGluing C I ⥤ Action C I := Comma.snd _ _
end AlgebraicGluing

section Gluing
variable {Λ : Type} [Ring Λ] {I : Type*} [Group I]
variable (A : AlgebraicGluing (ModuleCat Λ) I)
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
theorem variation_annihilates_specialization (σ : I) :
    A.hom.hom ≫ ((A.right.ρ σ - 1 : End A.right.V)) = 0 := by sorry
end Gluing


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
theorem finiteLog_exp_scalar (N : Module.End K V) (d : ℕ) (hN : N ^ d = 0) (t : K) :
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
theorem gradedN_mk (N : Module.End K V) (hN : IsNilpotent N) (c i : ℤ)
    (x : monodromyFiltration N c i) :
    gradedN N hN c i (Submodule.mkQ _ x) =
      Submodule.mkQ _ ⟨N x, by sorry⟩ := by sorry
theorem monodromyGradedPower_mk (N : Module.End K V) (hN : IsNilpotent N)
    (c : ℤ) (r : ℕ) (x : monodromyFiltration N c (c + r)) :
    monodromyGradedPower N hN c r (Submodule.mkQ _ x) =
      Submodule.mkQ _ ⟨(N ^ r) x, by sorry⟩ := by sorry
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
variable [FiniteDimensional K V] {I : Type*} [Group I]
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


section LinearTheorems
variable {K V : Type*} [Field K] [CharZero K] [AddCommGroup V] [Module K V]
variable [FiniteDimensional K V]
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
theorem inducedGradedN_mk (N : Module.End K V) (W : ℤ → Submodule K V)
    (hW : ∀ w, (W w).map N ≤ W w) (w : ℤ) (x : W w) :
    inducedGradedN N W hW w (Submodule.mkQ _ x) =
      Submodule.mkQ _ ⟨N x, by sorry⟩ := by sorry
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
end LinearTheorems

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
example (N : Module.End ℚ (Fin 2 → ℚ)) (h : N ^ 2 = 0) (hne : N ≠ 0) : monodromyFiltration N 0 (-2) = ⊥ ∧ monodromyFiltration N 0 (-1) = LinearMap.range N ∧ monodromyFiltration N 0 0 = LinearMap.range N ∧ monodromyFiltration N 0 1 = ⊤ := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_three_block`: For N(e₂)=e₁, N(e₁)=e₀, the weights are −2,0,2 and Gr_−1=Gr_1=0. -/
example (N : Module.End ℚ (Fin 3 → ℚ)) (h : IsMaximallyNilpotent N) : Module.finrank ℚ (Gr (monodromyFiltration N 0) (-2)) = 1 ∧ Module.finrank ℚ (Gr (monodromyFiltration N 0) 0) = 1 ∧ Module.finrank ℚ (Gr (monodromyFiltration N 0) 2) = 1 ∧ Module.finrank ℚ (Gr (monodromyFiltration N 0) (-1)) = 0 ∧ Module.finrank ℚ (Gr (monodromyFiltration N 0) 1) = 0 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration_not_kernel_filtration`: For a two-block, ker N is M_−1, and M_0 is still ker N, whereas ker N² is V. -/
example (N : Module.End ℚ (Fin 2 → ℚ)) (h : IsMaximallyNilpotent N) : monodromyFiltration N 0 0 = LinearMap.ker N ∧ monodromyFiltration N 0 (-1) ≠ ⊥ := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_three_block`: The size-three Jordan block is maximally nilpotent. -/
example (N : Module.End ℚ (Fin 3 → ℚ)) (h : N ^ 3 = 0) (h2 : N ^ 2 ≠ 0) : IsMaximallyNilpotent N := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_not_two_plus_one`: A size-two Jordan block plus a trivial line in dimension three is not maximally nilpotent. -/
example (N : Module.End ℚ (Fin 3 → ℚ)) (h : N ^ 2 = 0) : ¬ IsMaximallyNilpotent N := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_one_dimension`: The zero endomorphism of a one-dimensional space is maximally nilpotent; the identity is maximally unipotent. -/
example : IsMaximallyNilpotent (0 : Module.End ℚ ℚ) ∧
    IsMaximallyUnipotent (LinearEquiv.refl ℚ ℚ) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.VanishingCycles.maximal_zero_dimension_excluded`: The zero-dimensional vector space does not satisfy the nonzero-dimension definition. -/
example : ¬ IsMaximallyNilpotent (0 : Module.End ℚ (Fin 0 → ℚ)) := by sorry


end TauCeti.AlgebraicGeometry.VanishingCycles

namespace TauCeti.AlgebraicGeometry.Quadric

section OrdinaryForm

variable {k V : Type*} [Field k] [AddCommGroup V] [Module k V] [FiniteDimensional k V]

/-- Deligne's ordinary quadratic form over a field (SGA 7 XII 1.1, with `car(A) = 2` in case b)): the polar form is
nondegenerate when the rank is even or the characteristic is not 2; in characteristic 2 and odd rank, the polar kernel
is a line on which `Q` does not vanish (node `LPV.2/ordinary-quadratic-form`). -/
def IsOrdinary (Q : QuadraticForm k V) : Prop :=
  0 < Module.finrank k V ∧
  ((Even (Module.finrank k V) ∨ ringChar k ≠ 2) → (QuadraticMap.polarBilin Q).Nondegenerate) ∧
  ((Odd (Module.finrank k V) ∧ ringChar k = 2) →
    Module.finrank k (LinearMap.ker (QuadraticMap.polarBilin Q)) = 1 ∧
      ∀ v ∈ LinearMap.ker (QuadraticMap.polarBilin Q), v ≠ 0 → Q v ≠ 0)

/-- For `V ≠ 0` over a field, ordinary is Mathlib's `QuadraticMap.Nondegenerate` (Elman–Karpenko–Merkurjev). -/
theorem isOrdinary_iff_nondegenerate [Nontrivial V] (Q : QuadraticForm k V) :
    IsOrdinary Q ↔ QuadraticMap.Nondegenerate (Q := Q) := by
  sorry
theorem isOrdinary_iff_polar_nondegenerate (Q : QuadraticForm k V)
    (hr : 0 < Module.finrank k V) (h : Even (Module.finrank k V) ∨ ringChar k ≠ 2) :
    IsOrdinary Q ↔ (QuadraticMap.polarBilin Q).Nondegenerate := by sorry
theorem isOrdinary_iff_of_char_two (Q : QuadraticForm k V)
    (hr : Odd (Module.finrank k V)) (hp : ringChar k = 2) :
    IsOrdinary Q ↔ Module.finrank k (LinearMap.ker (QuadraticMap.polarBilin Q)) = 1 ∧
      ∀ v ∈ LinearMap.ker (QuadraticMap.polarBilin Q), v ≠ 0 → Q v ≠ 0 := by sorry
/-- Test `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_zero_rank_excluded`. -/
example : ¬ IsOrdinary (0 : QuadraticForm ℚ (Fin 0 → ℚ)) := by sorry

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

namespace TauCeti.AlgebraicGeometry.LefschetzPencil

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
theorem transvection_apply_vanishingVector (B : BilinForm K V) (δ x : V) (c : K) :
    LinearMap.transvection (c • B.flip δ) δ x = x + c • B x δ • δ := by sorry
abbrev vanishingQuotient (B : BilinForm K V) (E : Submodule K V) :=
  E ⧸ (E ⊓ B.orthogonal E).comap E.subtype
def vanishingForm (B : BilinForm K V) (E : Submodule K V)
    (hsym : B.IsSymm ∨ B.IsAlt) :
    BilinForm K (vanishingQuotient B E) := by sorry
def vanishingProjection (B : BilinForm K V) (E : Submodule K V) :
    E →ₗ[K] vanishingQuotient B E := Submodule.mkQ _
theorem vanishingForm_mk (B : BilinForm K V) (E : Submodule K V)
    (hsym : B.IsSymm ∨ B.IsAlt) (x y : E) :
    vanishingForm B E hsym (vanishingProjection B E x) (vanishingProjection B E y) =
      B x y := by sorry
def vanishingQuotient_lift (B : BilinForm K V) (E : Submodule K V)
    (l : E →ₗ[K] K) (hl : (E ⊓ B.orthogonal E).comap E.subtype ≤ l.ker) :
    vanishingQuotient B E →ₗ[K] K := Submodule.liftQ _ l hl
theorem vanishingQuotient_lift_comp (B : BilinForm K V) (E : Submodule K V)
    (l : E →ₗ[K] K) (hl : (E ⊓ B.orthogonal E).comap E.subtype ≤ l.ker) :
    (vanishingQuotient_lift B E l hl).comp (vanishingProjection B E) = l := by sorry
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

namespace TauCeti.AlgebraicGeometry.VanishingCycles

/- Haines–Ngô §3.1, Lemma 8 and Corollary 9 (pp. 127–128).
An admissible filtration belongs to one fixed inertia/Frobenius representation.
Finite graded image is a concrete condition, not a substitute for geometry. -/
section AdmissibleTrace
variable {K V I : Type*} [Field K] [CharZero K] [AddCommGroup V] [Module K V]
variable [FiniteDimensional K V] [Group I]

abbrev FiltrationGrade (W : ℕ → Submodule K V) (i : ℕ) :=
  W (i + 1) ⧸ (W i).comap (W (i + 1)).subtype

def filtrationRepresentation (ρ : Representation K I V) (W : ℕ → Submodule K V)
    (hW : ∀ i g, (W i).map (ρ g) ≤ W i) (i : ℕ) :
    Representation K I (FiltrationGrade W i) := by sorry

theorem filtrationRepresentation_mk (ρ : Representation K I V) (W : ℕ → Submodule K V)
    (hW : ∀ i g, (W i).map (ρ g) ≤ W i) (i : ℕ) (g : I) (v : W (i + 1)) :
    filtrationRepresentation ρ W hW i g (Submodule.mkQ _ v) =
      Submodule.mkQ _ ⟨ρ g v, by sorry⟩ := by sorry

def filtrationFrobenius (F : Module.End K V) (W : ℕ → Submodule K V)
    (hW : ∀ i, (W i).map F ≤ W i) (i : ℕ) :
    Module.End K (FiltrationGrade W i) := by sorry

theorem filtrationFrobenius_mk (F : Module.End K V) (W : ℕ → Submodule K V)
    (hW : ∀ i, (W i).map F ≤ W i) (i : ℕ) (v : W (i + 1)) :
    filtrationFrobenius F W hW i (Submodule.mkQ _ v) =
      Submodule.mkQ _ ⟨F v, by sorry⟩ := by sorry

structure AdmissibleInertiaFiltration (ρ : Representation K I V) (F : Module.End K V) where
  length : ℕ
  W : ℕ → Submodule K V
  monotone : Monotone W
  bottom : W 0 = ⊥
  top : W length = ⊤
  stableInertia : ∀ i g, (W i).map (ρ g) ≤ W i
  stableFrobenius : ∀ i, (W i).map F ≤ W i
  finiteGradedImage : ∀ i < length,
    (Set.range (filtrationRepresentation ρ W stableInertia i)).Finite

-- F normalizes inertia through the specified automorphism α.
theorem filtrationFrobenius_preservesInvariants (ρ : Representation K I V)
    (F : Module.End K V) (α : I ≃* I)
    (hF : ∀ g, F * ρ g = ρ (α g) * F) (A : AdmissibleInertiaFiltration ρ F) (i : ℕ) :
    ∀ v ∈ (filtrationRepresentation ρ A.W A.stableInertia i).invariants,
      filtrationFrobenius F A.W A.stableFrobenius i v ∈
        (filtrationRepresentation ρ A.W A.stableInertia i).invariants := by sorry

def semisimpleTrace (ρ : Representation K I V) (F : Module.End K V) (α : I ≃* I)
    (hF : ∀ g, F * ρ g = ρ (α g) * F) (A : AdmissibleInertiaFiltration ρ F) : K :=
  ∑ i ∈ Finset.range A.length,
    inertiaTrace (filtrationRepresentation ρ A.W A.stableInertia i)
      (filtrationFrobenius F A.W A.stableFrobenius i)
      (filtrationFrobenius_preservesInvariants ρ F α hF A i)

-- Both sides are filtrations of precisely the same representation and Frobenius.
theorem semisimpleTrace_refinement (ρ : Representation K I V) (F : Module.End K V)
    (α : I ≃* I) (hF : ∀ g, F * ρ g = ρ (α g) * F)
    (A B : AdmissibleInertiaFiltration ρ F) :
    semisimpleTrace ρ F α hF A = semisimpleTrace ρ F α hF B := by sorry

theorem semisimpleTrace_finiteImage (ρ : Representation K I V) (F : Module.End K V)
    (hρ : (Set.range ρ).Finite) (α : I ≃* I)
    (hF : ∀ g, F * ρ g = ρ (α g) * F) (A : AdmissibleInertiaFiltration ρ F)
    (hInv : ∀ v ∈ ρ.invariants, F v ∈ ρ.invariants) :
    semisimpleTrace ρ F α hF A = inertiaTrace ρ F hInv := by sorry

def changeFrobenius (ρ : Representation K I V) (F : Module.End K V)
    (A : AdmissibleInertiaFiltration ρ F) (g : I) :
    AdmissibleInertiaFiltration ρ (F * ρ g) := by sorry

theorem changeFrobenius_W (ρ : Representation K I V) (F : Module.End K V)
    (A : AdmissibleInertiaFiltration ρ F) (g : I) :
    (changeFrobenius ρ F A g).W = A.W ∧
      (changeFrobenius ρ F A g).length = A.length := by sorry

theorem semisimpleTrace_frobeniusLift (ρ : Representation K I V) (F : Module.End K V)
    (α : I ≃* I) (hF : ∀ g, F * ρ g = ρ (α g) * F)
    (A : AdmissibleInertiaFiltration ρ F) (g : I) :
    semisimpleTrace ρ (F * ρ g) ((MulAut.conj g).trans α) (by sorry)
      (changeFrobenius ρ F A g) = semisimpleTrace ρ F α hF A := by sorry

-- A genuine unipotent two-block; the action is not replaced by its graded pieces.
def shearRepresentation : Representation ℚ (Multiplicative ℤ) (Fin 2 → ℚ) := by sorry
theorem shearRepresentation_apply (g : Multiplicative ℤ) (v : Fin 2 → ℚ) :
    shearRepresentation g v = ![v 0 + (g.toAdd : ℚ) * v 1, v 1] := by sorry
def shearFiltration : AdmissibleInertiaFiltration shearRepresentation 1 := by sorry
theorem shearFiltration_values : shearFiltration.length = 2 ∧
    shearFiltration.W 1 = Submodule.span ℚ {(![1, 0] : Fin 2 → ℚ)} := by sorry

/-- Test semisimpleTrace_trivial: any admissible filtration of the actual trivial line. -/
example (a : ℚ) (A : AdmissibleInertiaFiltration (Representation.trivial ℚ Unit ℚ) (a • 1)) :
    semisimpleTrace (Representation.trivial ℚ Unit ℚ) (a • 1) (MulEquiv.refl Unit)
      (by sorry) A = a := by sorry

/-- Test semisimpleTrace_unipotent_block: the same two-block has trace 2 on its
admissible grading and trace 1 on its inertia invariants. -/
example : semisimpleTrace shearRepresentation 1 (MulEquiv.refl _) (by sorry) shearFiltration = 2 ∧
    inertiaTrace shearRepresentation 1 (by sorry) = 1 := by sorry

/-- Test semisimpleTrace_quadratic: a nontrivial sign line has no invariants. -/
example (ρ : Representation ℚ (Multiplicative (ZMod 2)) ℚ)
    (hρ : ∃ g, ρ g = -1) (a : ℚ)
    (A : AdmissibleInertiaFiltration ρ (a • 1)) :
    semisimpleTrace ρ (a • 1) (MulEquiv.refl _) (by sorry) A = 0 := by sorry

end AdmissibleTrace

section TraceExactness
variable {K I V₁ V₂ V₃ : Type*} [Field K] [CharZero K] [Group I]
variable [AddCommGroup V₁] [Module K V₁] [FiniteDimensional K V₁]
variable [AddCommGroup V₂] [Module K V₂] [FiniteDimensional K V₂]
variable [AddCommGroup V₃] [Module K V₃] [FiniteDimensional K V₃]

-- This realizes Haines–Ngô Corollary 9 on a short exact sequence.
-- Derived triangle additivity is a separate missing form, not an arbitrary list identity.
theorem semisimpleTrace_shortExact
    (ρ₁ : Representation K I V₁) (ρ₂ : Representation K I V₂) (ρ₃ : Representation K I V₃)
    (F₁ : Module.End K V₁) (F₂ : Module.End K V₂) (F₃ : Module.End K V₃)
    (α : I ≃* I)
    (hF₁ : ∀ g, F₁ * ρ₁ g = ρ₁ (α g) * F₁)
    (hF₂ : ∀ g, F₂ * ρ₂ g = ρ₂ (α g) * F₂)
    (hF₃ : ∀ g, F₃ * ρ₃ g = ρ₃ (α g) * F₃)
    (A₁ : AdmissibleInertiaFiltration ρ₁ F₁)
    (A₂ : AdmissibleInertiaFiltration ρ₂ F₂)
    (A₃ : AdmissibleInertiaFiltration ρ₃ F₃)
    (u : V₁ →ₗ[K] V₂) (v : V₂ →ₗ[K] V₃)
    (hu : Function.Injective u) (hv : Function.Surjective v)
    (hexact : LinearMap.range u = LinearMap.ker v)
    (hρu : ∀ g, u.comp (ρ₁ g) = (ρ₂ g).comp u)
    (hρv : ∀ g, v.comp (ρ₂ g) = (ρ₃ g).comp v)
    (hFu : u.comp F₁ = F₂.comp u) (hFv : v.comp F₂ = F₃.comp v) :
    semisimpleTrace ρ₂ F₂ α hF₂ A₂ =
      semisimpleTrace ρ₁ F₁ α hF₁ A₁ + semisimpleTrace ρ₃ F₃ α hF₃ A₃ := by sorry
end TraceExactness

/- This is the algebraic degree-sign rule used by the derived trace,
not an identification of a list with an arbitrary complex. -/
def alternatingTrace (pieces : List (ℤ × ℚ)) : ℚ :=
  (pieces.map fun p => (-1 : ℚ) ^ p.1 * p.2).sum
/-- Algebraic specialization of semisimpleTrace_shift; the geometric derived form is missing. -/
example (pieces : List (ℤ × ℚ)) :
    alternatingTrace (pieces.map fun p => (p.1 + 1, p.2)) = -alternatingTrace pieces := by sorry

section LinearTameIdentities
variable {K V : Type*} [Field K] [CharZero K] [AddCommGroup V] [Module K V]
variable [FiniteDimensional K V] [Algebra ℚ (Module.End K V)]
-- Genuine input commutativity implies commutativity of finite logarithms.
theorem finiteLog_commute (U W : Module.End K V) (h : Commute U W) (d e : ℕ) :
    Commute (finiteLog U d) (finiteLog W e) := by sorry
-- The Frobenius relation is supplied on the actual unipotent operator.
theorem finiteLog_frobenius (U : Module.End K V) (d q : ℕ) (hU : U ^ d = 0)
    (F : V ≃ₗ[K] V)
    (hF : F.symm.toLinearMap * (1 + U) * F.toLinearMap = (1 + U) ^ q) :
    finiteLog U d * F.toLinearMap = (q : K) • (F.toLinearMap * finiteLog U d) := by sorry
end LinearTameIdentities

-- Representative-level uniqueness makes the degree-zero cokernel construction usable.
section GluingAPI
variable {Λ : Type} [Ring Λ] {I : Type*} [Group I]
variable (A : AlgebraicGluing (ModuleCat Λ) I)
theorem variation_unique (σ : I) (v : cokernel A.hom.hom ⟶ A.right.V)
    (hv : cokernel.π A.hom.hom ≫ v = (A.right.ρ σ - 1 : End A.right.V)) :
    v = variation A σ := by sorry
/-- Algebraic variation_one. -/
example : variation A 1 = 0 := by sorry
/-- Algebraic variation_of_phi_zero. -/
example (h : IsZero (cokernel A.hom.hom)) (g : I) :
    variation A g = 0 ∧ A.right.ρ g = 1 := by sorry
/-- Algebraic variation_ne_sub_one: the factorization has the correct domain. -/
example (g : I) : cokernel.π A.hom.hom ≫ variation A g =
    (A.right.ρ g - 1 : End A.right.V) := by sorry
end GluingAPI

end TauCeti.AlgebraicGeometry.VanishingCycles

namespace TauCeti.AlgebraicGeometry.Quadric

section QuadraticGerms
variable {k : Type} [Field k]
def coordinateVector (r : ℕ) (i : Fin r) : Fin r → k := fun j => if j = i then 1 else 0

-- Coordinate expansion works in every characteristic, without dividing by two.
def quadraticSeries {r : ℕ} (Q : QuadraticForm k (Fin r → k)) : MvPowerSeries (Fin r) k :=
  (∑ i : Fin r, MvPowerSeries.C (Q (coordinateVector r i)) * (MvPowerSeries.X i) ^ 2) +
  ∑ i : Fin r, ∑ j ∈ Finset.univ.filter (i < ·),
    MvPowerSeries.C (Q (coordinateVector r i + coordinateVector r j) -
      Q (coordinateVector r i) - Q (coordinateVector r j)) * MvPowerSeries.X i * MvPowerSeries.X j

def OrderAtLeastThree {r : ℕ} (F : MvPowerSeries (Fin r) k) : Prop :=
  ∀ d : Fin r →₀ ℕ, d.sum (fun _ n => n) < 3 → MvPowerSeries.coeff d F = 0

-- The parameter A is the completed local k-algebra, not an arbitrary bare ring.
-- Identifying A with a scheme's geometric completed local ring is the SF supplier form.
def IsOrdinaryQuadraticPoint (k A : Type) [Field k] [CommRing A] [Algebra k A] (r : ℕ) : Prop :=
  0 < r ∧ ∃ Q : QuadraticForm k (Fin r → k), IsOrdinary Q ∧
    ∃ R : MvPowerSeries (Fin r) k, OrderAtLeastThree R ∧
      Nonempty (A ≃ₐ[k] (MvPowerSeries (Fin r) k ⧸ Ideal.span {quadraticSeries Q + R}))

def IsNondegenerateQuadraticPoint (k A : Type) [Field k] [CommRing A] [Algebra k A]
    (r : ℕ) : Prop :=
  0 < r ∧ ∃ Q : QuadraticForm k (Fin r → k), (QuadraticMap.polarBilin Q).Nondegenerate ∧
    ∃ R : MvPowerSeries (Fin r) k, OrderAtLeastThree R ∧
      Nonempty (A ≃ₐ[k] (MvPowerSeries (Fin r) k ⧸ Ideal.span {quadraticSeries Q + R}))

theorem isNondegenerate_iff (k A : Type) [Field k] [CommRing A] [Algebra k A] (r : ℕ) :
    IsNondegenerateQuadraticPoint k A r ↔
      IsOrdinaryQuadraticPoint k A r ∧ (ringChar k ≠ 2 ∨ Even r) := by sorry

theorem isOrdinaryQuadraticPoint_cone {r : ℕ} (hr : 0 < r)
    (Q : QuadraticForm k (Fin r → k)) (hQ : IsOrdinary Q) :
    IsOrdinaryQuadraticPoint k (MvPowerSeries (Fin r) k ⧸ Ideal.span {quadraticSeries Q}) r := by sorry

-- Agreement with the actual coordinate quadratic form pins down the series constructor.
theorem quadraticSeries_proj {r : ℕ} (i j : Fin r) :
    quadraticSeries (QuadraticMap.proj i j : QuadraticForm k (Fin r → k)) =
      MvPowerSeries.X i * MvPowerSeries.X j := by sorry

def evenCliffordCentre {V : Type} [AddCommGroup V] [Module k V] (Q : QuadraticForm k V) :=
  Subalgebra.center k (CliffordAlgebra.even Q)

theorem evenCliffordCentre_rank_two {V : Type} [AddCommGroup V] [Module k V]
    [FiniteDimensional k V] (Q : QuadraticForm k V)
    (hQ : QuadraticMap.Nondegenerate (Q := Q)) (hr : Even (Module.finrank k V))
    (hpos : 0 < Module.finrank k V) : Module.finrank k (evenCliffordCentre Q) = 2 := by sorry

-- These test the actual algebra structure, rather than only its dimension.
/-- evenCliffordCentre_hyperbolic. -/
example : Nonempty (evenCliffordCentre (QuadraticMap.proj 0 1 :
    QuadraticForm ℚ (Fin 2 → ℚ)) ≃ₐ[ℚ] (ℚ × ℚ)) := by sorry
/-- evenCliffordCentre_discriminant: the binary form x²−2y² has discriminant 2. -/
example : Nonempty (evenCliffordCentre (QuadraticMap.proj 0 0 - 2 • QuadraticMap.proj 1 1 :
    QuadraticForm ℚ (Fin 2 → ℚ)) ≃ₐ[ℚ]
      (Polynomial ℚ ⧸ Ideal.span {(Polynomial.X : Polynomial ℚ) ^ 2 - Polynomial.C 2})) := by sorry
/-- evenCliffordCentre_eq_mathlib. -/
example (Q : QuadraticForm ℚ (Fin 2 → ℚ)) :
    evenCliffordCentre Q = Subalgebra.center ℚ (CliffordAlgebra.even Q) := by sorry
end QuadraticGerms
/-- Test `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_xy_add_sq_char_two`: Characteristic 2, r = 3, Q = xy + z²: ker Φ = k·e_z and Q(e_z) = 1, so Q is ordinary (the conic xy = z² is smooth). -/
example : Quadric.IsOrdinary ((QuadraticMap.proj 0 1 + QuadraticMap.proj 2 2) : QuadraticForm (ZMod 2) (Fin 3 → ZMod 2)) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.not_isOrdinary_sum_sq_char_two`: Characteristic 2, r = 2, Q = x² + y² = (x + y)²: Φ = 0 and the quadric is a double point, so Q is not ordinary. -/
example : ¬ Quadric.IsOrdinary ((QuadraticMap.proj 0 0 + QuadraticMap.proj 1 1) : QuadraticForm (ZMod 2) (Fin 2 → ZMod 2)) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_rank_one`: r = 1, Q = ax² with a a unit: the quadric is empty and Q is ordinary in every characteristic. -/
example : Quadric.IsOrdinary (QuadraticMap.sq : QuadraticForm (ZMod 2) (ZMod 2)) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.isOrdinary_iff_nondegenerate_test`: Over a field and for V ≠ 0, IsOrdinary Q agrees with Mathlib's QuadraticMap.Nondegenerate Q: in characteristic 2 the alternating Φ has kernel of dimension ≡ r mod 2, so rank ≤ 1 forces 0 or 1 according to the parity of r. -/
example : Quadric.IsOrdinary (QuadraticMap.sq : QuadraticForm ℚ ℚ) ↔ QuadraticMap.Nondegenerate (Q := (QuadraticMap.sq : QuadraticForm ℚ ℚ)) := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.node_isOrdinary`: The node xy = 0 in 𝔸² (n = 1): Q = xy is ordinary and nondegenerate in every characteristic. -/
example : Quadric.IsOrdinaryQuadraticPoint ℚ (MvPowerSeries (Fin 2) ℚ ⧸ Ideal.span {Quadric.quadraticSeries (QuadraticMap.proj 0 1 : QuadraticForm ℚ (Fin 2 → ℚ))}) 2 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.doublePoint_char_two`: n = 0, Y = Spec k[x]/(x²): Q = x² is ordinary in every characteristic, so the origin is ordinary; it is non-degenerate if and only if p ≠ 2, and for p = 2 it is degenerate. -/
example : Quadric.IsOrdinaryQuadraticPoint (ZMod 2) (MvPowerSeries (Fin 1) (ZMod 2) ⧸ Ideal.span {Quadric.quadraticSeries (QuadraticMap.proj 0 0 : QuadraticForm (ZMod 2) (Fin 1 → ZMod 2))}) 1 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.cusp_not_ordinary`: The cusp y² = x³ (n = 1): the quadratic part y² in two variables is not ordinary (its quadric is a double point of P¹), so the cusp is not an ordinary quadratic point. -/
example : ¬ Quadric.IsOrdinaryQuadraticPoint ℚ (MvPowerSeries (Fin 2) ℚ ⧸ Ideal.span {(MvPowerSeries.X (1 : Fin 2) : MvPowerSeries (Fin 2) ℚ) ^ 2 - MvPowerSeries.X (0 : Fin 2) ^ 3}) 2 := by sorry

/-- Test `TauCeti.AlgebraicGeometry.Quadric.smooth_point_not_quadratic`: A smooth point is not an ordinary quadratic point: its Zariski tangent space has dimension n, not n + 1. -/
example : ¬ Quadric.IsOrdinaryQuadraticPoint ℚ (MvPowerSeries (Fin 1) ℚ) 2 := by sorry


end TauCeti.AlgebraicGeometry.Quadric

namespace TauCeti.AlgebraicGeometry.LefschetzPencil
open LinearMap (BilinForm)
open TauCeti.AlgebraicGeometry.VanishingCycles

def standardSymplecticFour : BilinForm ℚ (Fin 4 → ℚ) :=
  Matrix.toBilin' !![0,1,0,0; -1,0,0,0; 0,0,0,1; 0,0,-1,0]
def threePlane : Submodule ℚ (Fin 4 → ℚ) :=
  Submodule.span ℚ {![1,0,0,0], ![0,1,0,0], ![0,0,1,0]}
def isotropicPlane : Submodule ℚ (Fin 4 → ℚ) :=
  Submodule.span ℚ {![1,0,0,0], ![0,0,1,0]}
def conicDot : BilinForm ℚ (Fin 2 → ℚ) := Matrix.toBilin' (1 : Matrix (Fin 2) (Fin 2) ℚ)
def conicLine : Submodule ℚ (Fin 2 → ℚ) := Submodule.span ℚ {![1,-1]}

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_zero`. -/
example : Module.finrank ℚ (vanishingQuotient standardSymplecticFour (⊥ : Submodule ℚ (Fin 4 → ℚ))) = 0 := by sorry
/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_radical`. -/
example : threePlane ⊓ standardSymplecticFour.orthogonal threePlane =
    Submodule.span ℚ {![0,0,1,0]} ∧
    Module.finrank ℚ (vanishingQuotient standardSymplecticFour threePlane) = 2 ∧
    Module.finrank ℚ (vanishingQuotient standardSymplecticFour isotropicPlane) = 0 := by sorry
/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_conic`:
    the degree-zero conic model has norm 2 and zero radical. -/
example : conicLine ⊓ conicDot.orthogonal conicLine = ⊥ ∧
    Module.finrank ℚ (vanishingQuotient conicDot conicLine) = 1 ∧
    conicDot ![1,-1] ![1,-1] = 2 := by sorry
/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm_on_E_degenerate`. -/
example : ¬ (standardSymplecticFour.restrict threePlane).Nondegenerate ∧
    (vanishingForm standardSymplecticFour threePlane (Or.inr (by sorry))).Nondegenerate := by sorry

/-- Test `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingCycle_depends_on_path`:
    two concrete paths send the same generator to different lines. -/
example : vanishingCycle shearRepresentation (fun _ : Unit => (![0,1] : Fin 2 → ℚ))
    () (Multiplicative.ofAdd 1) = ![1,1] ∧
    (![1,1] : Fin 2 → ℚ) ≠ ![0,1] ∧ (![1,1] : Fin 2 → ℚ) ≠ -![0,1] := by sorry
/-- Algebraic specialization of
    `TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_eq_bot_of_no_singular_fibre`. -/
example {G V : Type} [Group G] [AddCommGroup V] [Module ℚ V]
    (ρ : Representation ℚ G V) (δ : Empty → V) : vanishingSubspace ρ δ = ⊥ := by sorry
end TauCeti.AlgebraicGeometry.LefschetzPencil

namespace TauCeti.AlgebraicGeometry.VanishingCycles
section VariationTests
variable {Λ : Type} [Ring Λ] {I : Type} [Group I]
variable (A : AlgebraicGluing (ModuleCat Λ) I)
/-- Degree-zero specialization of `TauCeti.AlgebraicGeometry.VanishingCycles.variation_one`. -/
example : variation A (1 : I) = 0 := by sorry
/-- Degree-zero specialization of `TauCeti.AlgebraicGeometry.VanishingCycles.variation_of_phi_zero`. -/
example (h : IsZero (cokernel A.hom.hom)) (σ : I) : variation A σ = 0 := by sorry
end VariationTests
end TauCeti.AlgebraicGeometry.VanishingCycles

namespace TauCeti.AlgebraicGeometry.VanishingCycles
open LinearMap (BilinForm)
open TauCeti.AlgebraicGeometry.LefschetzPencil

theorem fixedSpaceOfTheLocalTransvections {K V S : Type*} [Field K]
    [AddCommGroup V] [Module K V] (B : BilinForm K V) (hsym : B.IsSymm ∨ B.IsAlt)
    (δ : S → V) (c : S → K) (hc : ∀ s, c s ≠ 0) (x : V) :
    (∀ s, LinearMap.transvection (c s • B.flip (δ s)) (δ s) x = x) ↔
      x ∈ B.orthogonal (Submodule.span K (Set.range δ)) := by sorry

attribute [local instance 100] LieRing.ofAssociativeRing
theorem symplecticLieAlgebraGeneratedByTransvections {k V : Type*} [Field k]
    [CharZero k] [AddCommGroup V] [Module k V] [FiniteDimensional k V]
    (ψ : BilinForm k V) (hψ : ψ.IsAlt) (hnd : ψ.Nondegenerate)
    (L : LieSubalgebra k (Module.End k V)) (hL : L ≤ skewAdjointLieSubalgebra ψ)
    [LieModule.IsIrreducible k L V] {ι : Type*} (δ : ι → V)
    (hgen : LieSubalgebra.lieSpan k (Module.End k V)
      (Set.range fun i => nilpotentOfVector ψ (δ i)) = L) :
    L = skewAdjointLieSubalgebra ψ := by sorry
end TauCeti.AlgebraicGeometry.VanishingCycles

/- Missing-form ledger — revision 2, independently reviewed.
These are omitted signatures, not declarations or completed unit tests.
Each entry states the full target contract and the exact owner input needed.

LefschetzPencilsAndVanishingCycles:LPV.0/henselian-trait-conventions-and-galois-sheaves
Full target: A henselian trait is S = Spec R for a henselian discrete valuation ring R. Fix a separable geometric generic point and the uniquely extended valuation, with geometric closed point, normalization S̄, open generic inclusion j̄ and closed inclusion ī. Inertia is the kernel of generic-to-residue Galois specialization. The generic Galois-sheaf equivalence is imported from ConstructibleEtale:3, not constructed here.
Hypotheses: R a discrete valuation ring and henselian; the normalization in the chosen separable closure has the uniquely extended valuation; The residue field of S̄ can be a purely inseparable extension of the selected separable residue closure
Owner inputs: ArithmeticGaloisRepresentations:R01.2; SchemeAndStackFoundations:SF.2 (ConstructibleEtale/EtaleBaseChange); EnhancedDerivedSheaves:E0/E1/E4; ClassicalAdicEtaleCohomology:H1
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait [definition]: A henselian trait is S = Spec R for a henselian discrete valuation ring R. Fix a separable geometric generic point and the uniquely extended valuation, with geometric closed point, normalization S̄, open generic inclusion j̄ and closed inclusion ī. Inertia is the kernel of generic-to-residue Galois specialization. The generic Galois-sheaf equivalence is imported from ConstructibleEtale:3, not constructed here. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait.inertia [api:constructor]: I = ker(Gal(η̄/η) → Gal(s̄/s)), a closed normal subgroup. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait.inertia_exact [api:characterisation]: 1 → I → Gal(η̄/η) → Gal(s̄/s) → 1 is exact; surjectivity uses that V is henselian. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait.genericFiber [api:compatibility]: The trait-indexed generic fibre is TauCeti.genericFiber, with its canonical pullback projection. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.HenselianTrait.specialFiber [api:compatibility]: The trait-indexed closed fibre is TauCeti.specialFiber over the residue field. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.inertia_eq_top_of_strictlyHenselian [test:degenerate]: If V is strictly henselian then Gal(s̄/s) = 1 and I = Gal(η̄/η). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.inertia_puiseux [test:computation]: For V the henselisation of k[t] at (t), k algebraically closed of characteristic 0, I = Gal(η̄/η) ≅ Ẑ(1), acting on t^{1/n} through μ_n. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.inertia_eq_valuation_inertia [test:compatibility]: I coincides with Mathlib's ValuationSubring.inertiaSubgroup for the valuation subring of k(η̄) over V, as a subgroup of the decomposition group, which here is all of Gal(η̄/η). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.wild_inertia_ne_bot [test:non-example]: For V = the henselisation of 𝔽̄_p[t] at (t), I is not procyclic: the Artin–Schreier extensions x^p − x = t^{-a} (p ∤ a) give infinitely many independent ℤ/p quotients. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.0/fibre-product-topos-Y-times-S
Full target: For a henselian trait S with closed point s and Y over s, construct the 2-fibre product of étale topoi T=Y_et×_(s_et)S_et. On the geometric closed fibre Ȳ, an object consists of a continuous Gal(s̄/s)-sheaf F_s, a continuous Gal(η̄/η)-sheaf F_η, and a Gal(η̄/η)-equivariant map F_s→F_η, where the action on F_s is inflated along specialization. The generic part is the open subtopos Y_et×_(s_et)η_et and the closed complement is Y_et. Projection to Y sends a sheaf F by inverse image to (F,F,id); the generic restriction selects F_η. For Y=s this gluing category is equivalent to S_et, with gluing map into the inertia invariants of the generic sheaf. Henselian specialization identifies finite étale covers of S and s and gives sp_*F=i*F and sp_*j_*G=i*j_*G. The construction is independent, up to its canonical equivalence, of the chosen separable closure and has conservative geometric point families lying over pairs of compatible points of Y and S. Pullback and direct image are functorial for quasi-compact maps in Y and surjective trait maps; for a finite trait extension, direct image is induction on the generic Galois action. Extension by zero for locally closed immersions and proper-support pushforward for separated locally finite-type maps have their usual gluing descriptions. For abelian sheaves the right adjoint f^! to f_! extends to quasi-finite maps and agrees with f^* when f is étale.
Hypotheses: S a henselian trait; Y a scheme over s; the 2-fibre product is taken for the étale topoi (Giraud); readers may take the galoisian description 1.2.4 as the definition; For non-separably-closed residue field the 2-product must be fibred over Spec(k)_et (introduction, item c))
Owner inputs: ArithmeticGaloisRepresentations:R01.2; SchemeAndStackFoundations:SF.2 (ConstructibleEtale/EtaleBaseChange); EnhancedDerivedSheaves:E0/E1/E4; ClassicalAdicEtaleCohomology:H1
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.OrientedFibreTopos [construction]: For a henselian trait S with closed point s and Y over s, construct the 2-fibre product of étale topoi T=Y_et×_(s_et)S_et. On the geometric closed fibre Ȳ, an object consists of a continuous Gal(s̄/s)-sheaf F_s, a continuous Gal(η̄/η)-sheaf F_η, and a Gal(η̄/η)-equivariant map F_s→F_η, where the action on F_s is inflated along specialization. The generic part is the open subtopos Y_et×_(s_et)η_et and the closed complement is Y_et. Projection to Y sends a sheaf F by inverse image to (F,F,id); the generic restriction selects F_η. For Y=s this gluing category is equivalent to S_et, with gluing map into the inertia invariants of the generic sheaf. Henselian specialization identifies finite étale covers of S and s and gives sp_*F=i*F and sp_*j_*G=i*j_*G. The construction is independent, up to its canonical equivalence, of the chosen separable closure and has conservative geometric point families lying over pairs of compatible points of Y and S. Pullback and direct image are functorial for quasi-compact maps in Y and surjective trait maps; for a finite trait extension, direct image is induction on the generic Galois action. Extension by zero for locally closed immersions and proper-support pushforward for separated locally finite-type maps have their usual gluing descriptions. For abelian sheaves the right adjoint f^! to f_! extends to quasi-finite maps and agrees with f^* when f is étale. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.OrientedFibreTopos.sp_pullback [api:constructor]: sp^* : sheaves on Y → sheaves on Y ×_s S, F ↦ (F, F, id). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.OrientedFibreTopos.etaPart [api:constructor]: The restriction to Y ×_s η, (F_s, F_η, φ) ↦ F_η. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.OrientedFibreTopos.equivSheavesOnTrait [api:equivalence]: For Y = s, sheaves on S ≌ triples (F_s̄, F_η̄, φ : F_s̄ → F_η̄^I) (XIII 1.2.2). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.equivSheavesOnTrait_constant [test:computation]: The constant sheaf Λ on S is the triple (Λ, Λ, id) with I acting trivially. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.equivSheavesOnTrait_jPushforward [test:computation]: j_*G for a Gal(η̄/η)-module G is the triple (G^I, G, inclusion). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.equivSheavesOnTrait_degenerate [test:degenerate]: For Y = ∅ the category is the terminal one. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.not_triple_of_noninvariant [test:non-example]: For Y = s, a pair (F_s̄, F_η̄) with an equivariant map φ whose image is not in F_η̄^I is not a sheaf on S: the description 1.2.2 forces φ to land in the inertia invariants. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.0/functor-psi-and-functorialities
Full target: Fix X→S, a henselian trait, its geometric normalization S̄, and the inclusions j̄:X_η̄→X̄ and ī:X_s̄→X̄. For a sheaf G on X_η define ψEta(G)=ī* j̄_*G_η̄, with its continuous generic Galois action compatible with the action on X_s̄. For a sheaf F on X, assemble ψ(F)=(F_s,ψEta(F_η),sp_F) in the gluing topos, where sp_F is induced by the adjunction unit F→j_*j*F. Both functors are left exact. For an S-map f, actual base-change morphisms give ψ f_*→f_*ψ and f*ψ→ψ f*. The first is an isomorphism when f is proper; over X′=S it identifies geometric generic sections with sections of the nearby sheaf. For quasi-finite f there are f_!ψ→ψ f_! and ψ f^!→f^!ψ, respectively inverse to the direct-image map for finite f and to the inverse-image map for étale f. A map of henselian traits also has its natural inverse-image comparison. These are constructions on the actual sites; ψ is not identified with the direct image of an arbitrary topos morphism.
Hypotheses: S a henselian trait; X any S-scheme; sheaves of sets (pointed sets for f_!); Ψ is not in general the direct image of a morphism of topoi (1.3.1)
Owner inputs: ArithmeticGaloisRepresentations:R01.2; SchemeAndStackFoundations:SF.2 (ConstructibleEtale/EtaleBaseChange); EnhancedDerivedSheaves:E0/E1/E4; ClassicalAdicEtaleCohomology:H1
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.psiEta [construction]: Fix X→S, a henselian trait, its geometric normalization S̄, and the inclusions j̄:X_η̄→X̄ and ī:X_s̄→X̄. For a sheaf G on X_η define ψEta(G)=ī* j̄_*G_η̄, with its continuous generic Galois action compatible with the action on X_s̄. For a sheaf F on X, assemble ψ(F)=(F_s,ψEta(F_η),sp_F) in the gluing topos, where sp_F is induced by the adjunction unit F→j_*j*F. Both functors are left exact. For an S-map f, actual base-change morphisms give ψ f_*→f_*ψ and f*ψ→ψ f*. The first is an isomorphism when f is proper; over X′=S it identifies geometric generic sections with sections of the nearby sheaf. For quasi-finite f there are f_!ψ→ψ f_! and ψ f^!→f^!ψ, respectively inverse to the direct-image map for finite f and to the inverse-image map for étale f. A map of henselian traits also has its natural inverse-image comparison. These are constructions on the actual sites; ψ is not identified with the direct image of an arbitrary topos morphism. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.psi [api:constructor]: Ψ(F) = (F_s, Ψ_η(F_η), φ) on X_s ×_s S, φ from F → j_*j^*F (XIII 1.3.3). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.psi_leftExact [api:characterisation]: Ψ and Ψ_η are left exact. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.psi_pushforward [api:compatibility]: The base-change map Ψ f_* → f_* Ψ, an isomorphism for f proper (XIII 1.3.6). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.psiEta_trait [test:computation]: For X = S, Ψ_η(F) is F_η̄ with its Gal(η̄/η)-action. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.psiEta_ne_invariants [test:non-example]: For X = S, Ψ_η(F) = F_η̄ differs from i^*j_*F = F_η̄^I whenever I acts nontrivially: using j_* in place of j̄_* loses the inertia action. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.psiEta_smooth_constant [test:computation]: For X smooth over S and Λ constant, Ψ_η(Λ) = Λ, since the strict henselisations of X̄ at points of X_s̄ are normal domains. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.psi_proper_pushforward_id [test:degenerate]: For f = id the base-change map is the identity. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.0/variation-morphism
Full target: Let K be a derived complex of A-modules in the gluing topos Y_et×_(s_et)S_et. Its closed and generic complexes have an equivariant specialization map φ. Choose a homotopy-equivalent representative whose specialization map φ′ is injective and split in each degree, and define Φ(K) by its cokernel. This gives the representative-independent distinguished triangle sp*K_s→K_η→Φ(K)→ and its cohomology sequence. Inertia acts trivially on the image of the closed part, so σ−1 on K′_η factors through the quotient q:K′_η→Φ(K). The resulting derived variation Var(σ):Φ(K)→K_η satisfies Var(σ)∘q=σ−1 on K_η, q∘Var(σ)=σ−1 on Φ(K), and Var(στ)=Var(σ)∘q∘Var(τ)+Var(σ)+Var(τ). The derived construction and its representative independence are part of the contract; uniqueness of a degree-zero cokernel factor alone does not establish them.
Hypotheses: A a ring (or a sheaf of rings on Y); K ∈ D(Y ×_s S, A); I acts trivially on the s-part
Owner inputs: ArithmeticGaloisRepresentations:R01.2; SchemeAndStackFoundations:SF.2 (ConstructibleEtale/EtaleBaseChange); EnhancedDerivedSheaves:E0/E1/E4; ClassicalAdicEtaleCohomology:H1
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.variation [construction]: Let K be a derived complex of A-modules in the gluing topos Y_et×_(s_et)S_et. Its closed and generic complexes have an equivariant specialization map φ. Choose a homotopy-equivalent representative whose specialization map φ′ is injective and split in each degree, and define Φ(K) by its cokernel. This gives the representative-independent distinguished triangle sp*K_s→K_η→Φ(K)→ and its cohomology sequence. Inertia acts trivially on the image of the closed part, so σ−1 on K′_η factors through the quotient q:K′_η→Φ(K). The resulting derived variation Var(σ):Φ(K)→K_η satisfies Var(σ)∘q=σ−1 on K_η, q∘Var(σ)=σ−1 on Φ(K), and Var(στ)=Var(σ)∘q∘Var(τ)+Var(σ)+Var(τ). The derived construction and its representative independence are part of the contract; uniqueness of a degree-zero cokernel factor alone does not establish them. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.variation_left [api:characterisation]: σ = 1 + Var(σ) ∘ q on K_η. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.variation_right [api:characterisation]: σ = 1 + q ∘ Var(σ) on Φ(K)_η. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.variation_mul [api:compatibility]: Var(στ) = Var(σ) q Var(τ) + Var(σ) + Var(τ). The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.variation_wellDefined [api:compatibility]: Var(σ) depends only on K in the derived category, not on the representative K'. Derived representative independence is omitted. The distinct elaborated helper variation_annihilates_specialization only says that σ−1 kills the image of specialization in the degree-zero module model.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.variation_unique [api:universal-property]: The degree-zero cokernel factor is uniquely characterized by composition with its quotient map giving σ−1. Derived representative independence remains a distinct form. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.variation_one [test:degenerate]: Var(1) = 0. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.variation_of_phi_zero [test:computation]: If Φ(K) = 0 then Var(σ) = 0 and I acts trivially on K_η, by σ = 1 + Var(σ) q. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.variation_picardLefschetz [test:computation]: At an ordinary quadratic point in odd relative dimension n = 2m + 1, Var(σ)(a) = (−1)^{m+1} t_ℓ(σ)(a, δ)δ, which over rational coefficients is nonzero when t_ℓ(σ) ≠ 0, (a, δ) ≠ 0 and δ ≠ 0 (XV 3.3). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.variation_ne_sub_one [test:non-example]: Var(σ) is not σ − 1: it goes from Φ(K)_η to K_η, and σ − 1 on K_η is Var(σ) ∘ q, which vanishes on the image of K_s. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.0/derived-nearby-cycles-RPsi-and-vanishing-triangle
Full target: For X over a henselian trait S and a torsion coefficient ring A whose torsion is prime to the residue characteristic, derive the actual left-exact nearby functors on bounded-below complexes. The resulting Rψ:D⁺(X,A)→D⁺(X_s_et×_(s_et)S_et,A) has closed part i*K and generic part RψEta(K_η); on the geometric closed fibre its generic part is ī* Rj̄_*K_η̄. Define Rφ(K)=Φ(Rψ(K)). Its specialization triangle is sp*i*K→RψEta(K_η)→Rφ(K)→, and the variation map returns from Rφ to nearby cycles. At a geometric closed point x̄, the nearby stalk is RΓ(X_(x̄)×_(S^nr)η̄,K), where X_(x̄) and S^nr are the corresponding strict localizations. Thus the stalks of the cohomology sheaves are the cohomology groups of this geometric Milnor fibre. Local acyclicity over S is equivalent to vanishing of Rφ; in particular it holds on a smooth locus where the cohomology sheaves of K are locally constant. The ring may be replaced by a prime-to-residue-characteristic torsion sheaf of rings, with the same bounded-below domain.
Hypotheses: A torsion, prime to the residue characteristic (0.2.7); K ∈ D^+; The stalk formula uses the strict henselization at x̄ and the strict henselization S^nr of the trait; Local acyclicity of smooth morphisms is imported from SGA 4 XV 2.1
Owner inputs: ArithmeticGaloisRepresentations:R01.2; SchemeAndStackFoundations:SF.2 (ConstructibleEtale/EtaleBaseChange); EnhancedDerivedSheaves:E0/E1/E4; ClassicalAdicEtaleCohomology:H1
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.RPsi [construction]: For X over a henselian trait S and a torsion coefficient ring A whose torsion is prime to the residue characteristic, derive the actual left-exact nearby functors on bounded-below complexes. The resulting Rψ:D⁺(X,A)→D⁺(X_s_et×_(s_et)S_et,A) has closed part i*K and generic part RψEta(K_η); on the geometric closed fibre its generic part is ī* Rj̄_*K_η̄. Define Rφ(K)=Φ(Rψ(K)). Its specialization triangle is sp*i*K→RψEta(K_η)→Rφ(K)→, and the variation map returns from Rφ to nearby cycles. At a geometric closed point x̄, the nearby stalk is RΓ(X_(x̄)×_(S^nr)η̄,K), where X_(x̄) and S^nr are the corresponding strict localizations. Thus the stalks of the cohomology sheaves are the cohomology groups of this geometric Milnor fibre. Local acyclicity over S is equivalent to vanishing of Rφ; in particular it holds on a smooth locus where the cohomology sheaves of K are locally constant. The ring may be replaced by a prime-to-residue-characteristic torsion sheaf of rings, with the same bounded-below domain. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.RPhi [api:constructor]: RΦ(K) = Φ(RΨ(K)), in D⁺(X_s ×_s η, A). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.vanishingTriangle [api:constructor]: The distinguished triangle sp^* i^*K → RΨ_η(K_η) → RΦ(K) → (XIII 2.1.2.4). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.RPsi_stalk [api:characterisation]: R^iΨ(K)_(x̄, η̄) = H^i(X_(x̄) ×_{S^nr} η̄, K), the cohomology of the geometric Milnor fibre (XIII 2.1.4). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.RPhi_eq_zero_iff_locallyAcyclic [api:characterisation]: (X, K) is locally acyclic over S if and only if RΦ(K) = 0 (XIII 2.1.5); for f smooth and K constant it holds. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.RPhi_smooth [test:computation]: For X → S smooth and K = Λ: RΦ(Λ) = 0 and RΨ_η(Λ) = Λ. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.RPsi_trait [test:degenerate]: For X = S: RΨ_η(K) = K_η̄ with its Gal(η̄/η)-action. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.RPhi_node [test:computation]: For X = Spec V[x, y]/(xy − π), π a uniformiser and S strictly henselian: R^iΦ(Λ) = 0 for i ≠ 1, and R^1Φ(Λ) is supported at the origin, free of rank 1 (XV 3.1.2 with n = 1). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.specialization_direction [test:non-example]: For f proper the triangle gives H^i(X_s, K) → H^i(X_η̄, K) → H^i(X_s, RΦ K) → H^{i+1}(X_s, K): specialisation runs from the special to the generic fibre, and the reversed arrow is not a morphism of the triangle. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.0/derived-functorialities-and-specialization-sequence
Full target: For a separated finite-type morphism g over a henselian trait, nearby cycles have natural exchange maps with g*, Rg_* and Rg_!. The Rg_* comparison is an isomorphism for proper g and the pullback comparison for smooth g. SGA 7 XIII also constructs the Rg^! comparison for quasi-finite g, where it is an isomorphism for étale g; broader exceptional comparisons require the requested six-operation extension. Dominant change of henselian traits, with compatible geometric points, gives an isomorphism after inertia restriction. For proper f:X→S the specialization triangle gives the inertia-equivariant sequence H^i(X_s̄,K)→H^i(X_η̄,K)→H^i(X_s̄,RΦK)→H^{i+1}(X_s̄,K). The compact-support comparison points from special-fibre nearby cohomology to generic-fibre cohomology; only the proper case is claimed to be an isomorphism here.
Hypotheses: Finite-type noetherian schemes; torsion coefficients invertible on the trait; bounded-below complexes; Properness or smoothness for the corresponding exchange isomorphism; quasi-finiteness for XIII’s Rg^! construction, étaleness for its isomorphism; broader separated finite-type exceptional maps require the six-operation extension; Dominant change of traits, with compatible geometric points
Owner inputs: ArithmeticGaloisRepresentations:R01.2; SchemeAndStackFoundations:SF.2 (ConstructibleEtale/EtaleBaseChange); EnhancedDerivedSheaves:E0/E1/E4; ClassicalAdicEtaleCohomology:H1
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.derivedFunctorialitiesAndSpecializationSequence [theorem]: For a separated finite-type morphism g over a henselian trait, nearby cycles have natural exchange maps with g*, Rg_* and Rg_!. The Rg_* comparison is an isomorphism for proper g and the pullback comparison for smooth g. SGA 7 XIII also constructs the Rg^! comparison for quasi-finite g, where it is an isomorphism for étale g; broader exceptional comparisons require the requested six-operation extension. Dominant change of henselian traits, with compatible geometric points, gives an isomorphism after inertia restriction. For proper f:X→S the specialization triangle gives the inertia-equivariant sequence H^i(X_s̄,K)→H^i(X_η̄,K)→H^i(X_s̄,RΦK)→H^{i+1}(X_s̄,K). The compact-support comparison points from special-fibre nearby cohomology to generic-fibre cohomology; only the proper case is claimed to be an isomorphism here. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.0/geometric-fibre-site-morphisms
Full target: The chosen geometric fibre square X_η̄→X_S̄←X_s̄ induces the small-étale inverse-image and direct-image adjunctions. The inclusions are the base changes of the open generic and closed special inclusions, and inertia acts on the geometric generic side, with natural descent action on ī*Rj̄*. The sites are Scheme.smallEtaleTopology, not the Zariski sites.
Hypotheses: Henselian trait; finite-type X→S; chosen compatible geometric points
Owner inputs: ArithmeticGaloisRepresentations:R01.2; SchemeAndStackFoundations:SF.2 (ConstructibleEtale/EtaleBaseChange); EnhancedDerivedSheaves:E0/E1/E4; ClassicalAdicEtaleCohomology:H1
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.geometricFibreSiteMaps [theorem]: The chosen geometric fibre square X_η̄→X_S̄←X_s̄ induces the small-étale inverse-image and direct-image adjunctions. The inclusions are the base changes of the open generic and closed special inclusions, and inertia acts on the geometric generic side, with natural descent action on ī*Rj̄*. The sites are Scheme.smallEtaleTopology, not the Zariski sites. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.0/oriented-product-comparison
Full target: The oriented product X_s←×_Sη has points consisting of a geometric x, geometric generic point and specialization path. Its derived nearby-cycle stalk is RΓ(X_(x)×_{S_(f(x))}η̄,K). For a trait the oriented product identifies with the classical generic part of X_s×_sS, carrying the same specialization and inertia action. The full gluing topos has special and generic parts; it is not identified with the generic part alone.
Hypotheses: Trait base and compatible geometric points; torsion derived sheaves; For a general higher-dimensional base this statement does not assert arbitrary base-change or constructibility
Owner inputs: ArithmeticGaloisRepresentations:R01.2; SchemeAndStackFoundations:SF.2 (ConstructibleEtale/EtaleBaseChange); EnhancedDerivedSheaves:E0/E1/E4; ClassicalAdicEtaleCohomology:H1
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.orientedProductTraitComparison [comparison]: The oriented product X_s←×_Sη has points consisting of a geometric x, geometric generic point and specialization path. Its derived nearby-cycle stalk is RΓ(X_(x)×_{S_(f(x))}η̄,K). For a trait the oriented product identifies with the classical generic part of X_s×_sS, carrying the same specialization and inertia action. The full gluing topos has special and generic parts; it is not identified with the generic part alone. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.0/constructibility-and-finite-amplitude
Full target: For X of finite type over an excellent henselian trait and a bounded constructible torsion complex K with coefficients invertible on S, RΨK and RΦK have bounded constructible cohomology. Finite Tor-amplitude is retained under the finite-coefficient hypotheses of the finiteness theorem. A mere collection of finite stalks is not used as the constructibility criterion.
Hypotheses: Excellent henselian trait; finite-type morphism; Bounded constructible finite torsion coefficients invertible on S; finite Tor-amplitude for the Tor conclusion
Owner inputs: ArithmeticGaloisRepresentations:R01.2; SchemeAndStackFoundations:SF.2 (ConstructibleEtale/EtaleBaseChange); EnhancedDerivedSheaves:E0/E1/E4; ClassicalAdicEtaleCohomology:H1
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.nearbyCyclesConstructible [theorem]: For X of finite type over an excellent henselian trait and a bounded constructible torsion complex K with coefficients invertible on S, RΨK and RΦK have bounded constructible cohomology. Finite Tor-amplitude is retained under the finite-coefficient hypotheses of the finiteness theorem. A mere collection of finite stalks is not used as the constructibility criterion. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.0/coefficient-and-trait-change
Full target: Nearby and vanishing cycles commute with derived extension of finite coefficient rings in the invertible finite-Tor setting, and with dominant change of henselian traits. These isomorphisms preserve specialization, the cone triangle and inertia after restriction. For adic coefficient systems the statement is applied compatibly at every finite level before derived completion; underived tensor is not substituted for derived tensor.
Hypotheses: Finite coefficient homomorphism and constructible finite-Tor complexes; ℓ invertible; Dominant trait morphism with transported geometric points
Owner inputs: ArithmeticGaloisRepresentations:R01.2; SchemeAndStackFoundations:SF.2 (ConstructibleEtale/EtaleBaseChange); EnhancedDerivedSheaves:E0/E1/E4; ClassicalAdicEtaleCohomology:H1
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.nearbyCyclesCoefficientTraitChange [theorem]: Nearby and vanishing cycles commute with derived extension of finite coefficient rings in the invertible finite-Tor setting, and with dominant change of henselian traits. These isomorphisms preserve specialization, the cone triangle and inertia after restriction. For adic coefficient systems the statement is applied compatibly at every finite level before derived completion; underived tensor is not substituted for derived tensor. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.0/adic-nearby-cycle-realization
Full target: A compatible system of bounded constructible Z/ℓ^r-complexes defines the integral adic nearby/vanishing complex by the imported derived adic realization. Tensoring with Q_l gives the rational functors and their inertia-equivariant specialization triangle. This is the realization of the finite-level LPV carrier, not a separate nearby-cycle definition.
Hypotheses: ℓ invertible; finite-level constructibility and uniform amplitude; derived-complete compatible systems
Owner inputs: ArithmeticGaloisRepresentations:R01.2; SchemeAndStackFoundations:SF.2 (ConstructibleEtale/EtaleBaseChange); EnhancedDerivedSheaves:E0/E1/E4; ClassicalAdicEtaleCohomology:H1
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.adicNearbyCycleRealization [comparison]: A compatible system of bounded constructible Z/ℓ^r-complexes defines the integral adic nearby/vanishing complex by the imported derived adic realization. Tensoring with Q_l gives the rational functors and their inertia-equivariant specialization triangle. This is the realization of the finite-level LPV carrier, not a separate nearby-cycle definition. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.0/scheme-adic-trait-comparison
Full target: For a scheme X and a closed subscheme Y defined by a finite-type ideal I, let U=X−Y and let d(X̂) be the adic generic complement of the I-adic completion. Assume X locally noetherian, or the principal-I/type-(S) completion alternative of Huber 3.5.12. For a torsion coefficient ring E and K∈D⁺(U,E), the canonical map i*Rj_*K→Rb_*a*K is an isomorphism (3.5.13). For the nearby-cycle specialization assume a strictly henselian rank-one discrete valuation trait, X locally of finite type, and completion/base change to the integral closure in an algebraic closure and its completed fraction field as in 3.5.16–17. Then the actual scheme RΨ and formal/adic Rλ_*c* complexes agree. This is RΨ, not the cone RΦ. Specialization and inertia actions agree by naturality in every automorphism of the completion/base-change diagram.
Hypotheses: The precise noetherian or principal/type-(S) completion alternatives of Huber 3.5.12; torsion E and bounded-below K.; For the nearby corollary, strictly henselian rank-one DVR and locally finite-type X, actual geometric completion and generic fibre; prime-to-residue-characteristic finite coefficients when used by the LPV geometric finiteness/perverse targets.; Adic/rational passage requires the uniform amplitude and derived-limit hypotheses of E4; no comparison for arbitrary analytic spaces.
Owner inputs: ArithmeticGaloisRepresentations:R01.2; SchemeAndStackFoundations:SF.2 (ConstructibleEtale/EtaleBaseChange); EnhancedDerivedSheaves:E0/E1/E4; ClassicalAdicEtaleCohomology:H1
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.schemeAdicNearbyComparison [comparison]: For a scheme X and a closed subscheme Y defined by a finite-type ideal I, let U=X−Y and let d(X̂) be the adic generic complement of the I-adic completion. Assume X locally noetherian, or the principal-I/type-(S) completion alternative of Huber 3.5.12. For a torsion coefficient ring E and K∈D⁺(U,E), the canonical map i*Rj_*K→Rb_*a*K is an isomorphism (3.5.13). For the nearby-cycle specialization assume a strictly henselian rank-one discrete valuation trait, X locally of finite type, and completion/base change to the integral closure in an algebraic closure and its completed fraction field as in 3.5.16–17. Then the actual scheme RΨ and formal/adic Rλ_*c* complexes agree. This is RΨ, not the cone RΦ. Specialization and inertia actions agree by naturality in every automorphism of the completion/base-change diagram. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.1/normalized-can-var
Full target: For the geometric nearby/vanishing triangle, can:RΨK→RΦK and Var(σ):RΦK→RΨK satisfy Var(σ)can=σ−1 and can Var(σ)=σ−1 on their respective objects. For the unipotent part with rational ℓ-adic coefficients, normalized var:RΦK→RΨK(−1) and N:RΨK→RΨK(−1) satisfy var can=N and can(−1)var=N_Φ. The same normalization is used after choosing a generator of Z_l(1); it is independent of that choice as a twisted map.
Hypotheses: Derived geometric functors; unipotent part for normalized var; rational coefficients; A finite logarithm is taken only after unipotence is proved
Owner inputs: ArithmeticGaloisRepresentations:R01.2; EnhancedDerivedSheaves:E0/E4; EDC.3 trait-purity Part II; LieHighestWeight Part II for the SL₂ realization
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.normalizedCanVar [theorem]: For the geometric nearby/vanishing triangle, can:RΨK→RΦK and Var(σ):RΦK→RΨK satisfy Var(σ)can=σ−1 and can Var(σ)=σ−1 on their respective objects. For the unipotent part with rational ℓ-adic coefficients, normalized var:RΦK→RΨK(−1) and N:RΨK→RΨK(−1) satisfy var can=N and can(−1)var=N_Φ. The same normalization is used after choosing a generator of Z_l(1); it is independent of that choice as a twisted map. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.1/finite-monodromy-logarithm
Full target: For a unipotent automorphism T of a finite-dimensional characteristic-zero vector space and (T−1)^d=0, log T is the finite sum Σ_{1≤j<d}(-1)^(j+1)(T−1)^j/j. It is independent of the chosen valid d, nilpotent, and inverse to the pinned nilpotent exponential. For an inertia action factoring through t_l on an open subgroup, these logarithms give the canonical twisted N:V→V(−1).
Hypotheses: Characteristic-zero coefficient field; finite dimension; Unipotence is an input, not deduced from an arbitrary inertia action
Owner inputs: ArithmeticGaloisRepresentations:R01.2; EnhancedDerivedSheaves:E0/E4; EDC.3 trait-purity Part II; LieHighestWeight Part II for the SL₂ realization
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog [construction]: For a unipotent automorphism T of a finite-dimensional characteristic-zero vector space and (T−1)^d=0, log T is the finite sum Σ_{1≤j<d}(-1)^(j+1)(T−1)^j/j. It is independent of the chosen valid d, nilpotent, and inverse to the pinned nilpotent exponential. For an inertia action factoring through t_l on an open subgroup, these logarithms give the canonical twisted N:V→V(−1). The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.finiteLog_twisted [api:compatibility]: log ρ(σ)=t_l(σ)N; changing the Tate generator changes the scalar matrix but not N:V→V(−1). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.1/geometric-quasi-unipotence
Full target: For ℓ different from the residue characteristic and a finite-type family over a henselian discretely valued field in the geometric local-monodromy setting, inertia acts quasi-unipotently on its finite-dimensional rational ℓ-adic geometric cohomology with constant Q_l coefficients (with compact supports as well). After a finite extension the action is unipotent and factors through the ℓ-primary tame character. An arbitrary continuous representation of the inertia of an algebraically closed-residue field is not asserted quasi-unipotent by a formal group-theoretic argument.
Hypotheses: Geometric cohomology of a finite-type family; finite-dimensional Q_l realization; ℓ invertible; The hypotheses of the geometric theorem in Illusie 1.4; excellent trait in the nearby-cycle realization; An arbitrary inertia representation needs the distinct arithmetic residue-field hypothesis of the representation-theoretic theorem
Owner inputs: ArithmeticGaloisRepresentations:R01.2; EnhancedDerivedSheaves:E0/E4; EDC.3 trait-purity Part II; LieHighestWeight Part II for the SL₂ realization
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.geometricQuasiUnipotence [theorem]: For ℓ different from the residue characteristic and a finite-type family over a henselian discretely valued field in the geometric local-monodromy setting, inertia acts quasi-unipotently on its finite-dimensional rational ℓ-adic geometric cohomology with constant Q_l coefficients (with compact supports as well). After a finite extension the action is unipotent and factors through the ℓ-primary tame character. An arbitrary continuous representation of the inertia of an algebraically closed-residue field is not asserted quasi-unipotent by a formal group-theoretic argument. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.1/finite-extension-and-logarithm-rescaling
Full target: For a finite extension of henselian discretely valued fields of ramification index e, restrict the inertia representation and transport Tate twists. On a common unipotent open subgroup the normalized monodromy satisfies N′=eN relative to the respective uniformizer-normalized tame characters. Thus log nilpotency index, monodromy filtration and primitive dimensions are unchanged for e≠0 in the rational coefficient field.
Hypotheses: Finite extension; rational characteristic-zero coefficients; common unipotent subgroup; Integral assertions do not cancel e when e is divisible by ℓ
Owner inputs: ArithmeticGaloisRepresentations:R01.2; EnhancedDerivedSheaves:E0/E4; EDC.3 trait-purity Part II; LieHighestWeight Part II for the SL₂ realization
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.monodromyRamificationRescaling [theorem]: For a finite extension of henselian discretely valued fields of ramification index e, restrict the inertia representation and transport Tate twists. On a common unipotent open subgroup the normalized monodromy satisfies N′=eN relative to the respective uniformizer-normalized tame characters. Thus log nilpotency index, monodromy filtration and primitive dimensions are unchanged for e≠0 in the rational coefficient field. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.

LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration
Full target: For nilpotent N on a finite-dimensional vector space, define the unique finite increasing filtration M centered at c with N M_i⊂M_(i−2) and N^r:Gr_(c+r)^M V≅Gr_(c−r)^M V (with twist −r when N is a twisted map). One concrete center-zero formula is M_k=Σ_{a,b≥0,a−b=k}(ker N^(a+1)∩im N^b). For N=0, M_(c−1)=0 and M_c=V. Primitive parts use Deligne’s lower-weight convention P_i=ker(N:Gr_i→Gr_(i−2)), zero for i>c.
Hypotheses: Finite-dimensional field module; nilpotent N; integer center c; For equivariant twisted N, all graded powers retain their Tate twists
Owner inputs: ArithmeticGaloisRepresentations:R01.2; EnhancedDerivedSheaves:E0/E4; EDC.3 trait-purity Part II; LieHighestWeight Part II for the SL₂ realization
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.monodromyFiltration [construction]: For nilpotent N on a finite-dimensional vector space, define the unique finite increasing filtration M centered at c with N M_i⊂M_(i−2) and N^r:Gr_(c+r)^M V≅Gr_(c−r)^M V (with twist −r when N is a twisted map). One concrete center-zero formula is M_k=Σ_{a,b≥0,a−b=k}(ker N^(a+1)∩im N^b). For N=0, M_(c−1)=0 and M_c=V. Primitive parts use Deligne’s lower-weight convention P_i=ker(N:Gr_i→Gr_(i−2)), zero for i>c. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.monodromyGradedPower [api:data]: The induced map N^r from Gr_(c+r) to Gr_(c−r), with twist −r. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.

LefschetzPencilsAndVanishingCycles:LPV.1/primitive-decomposition-and-strictness
Full target: For the center-zero monodromy filtration, N:(V,M)→(V,M shifted by two) is strict: N(M_(i+2))=im N∩M_i. Consequently Gr_i(ker N)≅P_i. Every Gr_i V is the direct sum of the lower primitive pieces P_−j with j≥|i| and j≡i mod 2, using the inverses of the opposite-graded isomorphisms N^j followed by powers of N (equivalently, in characteristic zero, the canonical SL₂ raising operator); on a length-(d+1) Jordan block the successive weights are d,d−2,…,−d. In characteristic zero the associated graded has the canonical SL₂ action whose lowering operator is N.
Hypotheses: Nilpotent N and finite-dimensional vector space; characteristic zero only for SL₂; Strictness here is for N and for isomorphisms commuting with N; arbitrary commuting morphisms are not asserted strict
Owner inputs: ArithmeticGaloisRepresentations:R01.2; EnhancedDerivedSheaves:E0/E4; EDC.3 trait-purity Part II; LieHighestWeight Part II for the SL₂ realization
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.primitiveDecomposition [theorem]: For the center-zero monodromy filtration, N:(V,M)→(V,M shifted by two) is strict: N(M_(i+2))=im N∩M_i. Consequently Gr_i(ker N)≅P_i. Every Gr_i V is the direct sum of the lower primitive pieces P_−j with j≥|i| and j≡i mod 2, using the inverses of the opposite-graded isomorphisms N^j followed by powers of N (equivalently, in characteristic zero, the canonical SL₂ raising operator); on a length-(d+1) Jordan block the successive weights are d,d−2,…,−d. In characteristic zero the associated graded has the canonical SL₂ action whose lowering operator is N. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.

LefschetzPencilsAndVanishingCycles:LPV.1/tensor-dual-and-symmetric-monodromy
Full target: In characteristic zero, for N=N₁⊗1+1⊗N₂, the monodromy filtration is the convolution M_i=Σ_(a+b=i)M_a(V₁)⊗M_b(V₂), with centers added. For the dual operator −Nᵗ, M_i(V*)=ann M_(−i−1)(V) at center zero. The associated graded and primitive decomposition commute with these operations, with the Tate twists attached to powers of N. Sym^d of the standard two-block is the length-(d+1) block with weights −d,−d+2,…,d.
Hypotheses: Finite dimension; characteristic zero for tensor and symmetric-power assertions; Dual uses −Nᵗ and the reflected filtration indices
Owner inputs: ArithmeticGaloisRepresentations:R01.2; EnhancedDerivedSheaves:E0/E4; EDC.3 trait-purity Part II; LieHighestWeight Part II for the SL₂ realization
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.monodromyTensorDual [theorem]: In characteristic zero, for N=N₁⊗1+1⊗N₂, the monodromy filtration is the convolution M_i=Σ_(a+b=i)M_a(V₁)⊗M_b(V₂), with centers added. For the dual operator −Nᵗ, M_i(V*)=ann M_(−i−1)(V) at center zero. The associated graded and primitive decomposition commute with these operations, with the Tate twists attached to powers of N. Sym^d of the standard two-block is the length-(d+1) block with weights −d,−d+2,…,d. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.

LefschetzPencilsAndVanishingCycles:LPV.1/relative-monodromy-uniqueness
Full target: Given a finite increasing filtration W and nilpotent N preserving W, at most one finite increasing M satisfies N M_i⊂M_(i−2) and N^r:Gr_(w+r)^M Gr_w^W V≅Gr_(w−r)^M Gr_w^W V for every w and r≥0. Existence is an additional hypothesis; scaling N by a nonzero scalar does not change M. The corresponding graded maps have twist −r for twisted monodromy.
Hypotheses: Finite filtrations; nilpotent N preserving W; No unconditional existence conclusion
Owner inputs: ArithmeticGaloisRepresentations:R01.2; EnhancedDerivedSheaves:E0/E4; EDC.3 trait-purity Part II; LieHighestWeight Part II for the SL₂ realization
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.relativeMonodromyUnique [theorem]: Given a finite increasing filtration W and nilpotent N preserving W, at most one finite increasing M satisfies N M_i⊂M_(i−2) and N^r:Gr_(w+r)^M Gr_w^W V≅Gr_(w−r)^M Gr_w^W V for every w and r≥0. Existence is an additional hypothesis; scaling N by a nonzero scalar does not change M. The corresponding graded maps have twist −r for twisted monodromy. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.

LefschetzPencilsAndVanishingCycles:LPV.1/normal-crossings-tame-restriction
Full target: For a regular scheme with strict normal-crossings divisor D=∪D_a and a lisse rational ℓ-adic sheaf on its complement, tame unipotent local inertia gives commuting twisted residues N_a on the tame restriction to each stratum. The restriction is constructed using compatible Kummer covers and is independent of their cofinal choice. Relative filtrations along a stratum are unique when they exist. Existence and purity under mixedness are requested from DeligneWeightsAndPurity; they are not consequences of the linear algebra alone.
Hypotheses: Strict normal crossings; ℓ invertible; tame and unipotent local monodromy after the specified cover; The relative-filtration existence result needs the weight hypotheses of Weil II 1.9.1; Local Kummer coordinates are fixed for the restriction on E; independence of the cofinal tower does not assert independence of defining equations. The intrinsic version uses the normal-bundle torsor (1.7.10).
Owner inputs: ArithmeticGaloisRepresentations:R01.2; EnhancedDerivedSheaves:E0/E4; EDC.3 trait-purity Part II; LieHighestWeight Part II for the SL₂ realization
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.normalCrossingsTameRestriction [theorem]: For a regular scheme with strict normal-crossings divisor D=∪D_a and a lisse rational ℓ-adic sheaf on its complement, tame unipotent local inertia gives commuting twisted residues N_a on the tame restriction to each stratum. The restriction is constructed using compatible Kummer covers and is independent of their cofinal choice. Relative filtrations along a stratum are unique when they exist. Existence and purity under mixedness are requested from DeligneWeightsAndPurity; they are not consequences of the linear algebra alone. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.1/semisimple-nearby-trace
Full target: Let K be a bounded finite-dimensional continuous Weil complex over a characteristic-zero coefficient field with quasi-unipotent inertia. For each actual cohomology representation choose a finite increasing filtration 0=W₀⊂…⊂W_r=V, stable under inertia and the specified Frobenius F, with finite inertia image on every associated graded. F normalizes inertia through its actual automorphism α. Define the degree-zero trace as the sum of traces of F on the inertia invariants of those graded pieces and the complex trace as the alternating sum over cohomological degrees. Any two such filtrations of the same representation and F give the same value, Frobenius-lift changes preserve it, and equivariant distinguished triangles give additivity. An arbitrary list of unrelated linear maps is not an admissible filtration.
Hypotheses: Characteristic-zero field, continuous finite-dimensional Weil representations; bounded finite-dimensional cohomology.; W finite increasing, endpoint zero and whole V, stable under ρ and F; finite Set.range of each induced graded inertia representation.; Fρ(g)=ρ(α(g))F for the actual normalizing inertia automorphism α.; All refinements filter this same V,ρ,F. Distinguished triangles and exact sequences are equivariant for both inertia and F.
Owner inputs: ArithmeticGaloisRepresentations:R01.2; EnhancedDerivedSheaves:E0/E4; EDC.3 trait-purity Part II; LieHighestWeight Part II for the SL₂ realization
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace [construction]: Let K be a bounded finite-dimensional continuous Weil complex over a characteristic-zero coefficient field with quasi-unipotent inertia. For each actual cohomology representation choose a finite increasing filtration 0=W₀⊂…⊂W_r=V, stable under inertia and the specified Frobenius F, with finite inertia image on every associated graded. F normalizes inertia through its actual automorphism α. Define the degree-zero trace as the sum of traces of F on the inertia invariants of those graded pieces and the complex trace as the alternating sum over cohomological degrees. Any two such filtrations of the same representation and F give the same value, Frobenius-lift changes preserve it, and equivariant distinguished triangles give additivity. An arbitrary list of unrelated linear maps is not an admissible filtration. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_refinement [api:compatibility]: The trace is unchanged under a finite common refinement. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_additive [api:relation]: For an equivariant distinguished triangle, trace B=trace A+trace C. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_frobeniusLift [api:compatibility]: Changing Frobenius by an inertia element leaves the semisimple trace unchanged. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_trivial [test:computation]: For a degree-zero trivial inertia line with Frobenius a, the semisimple trace is a. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_unipotent_block [test:non-example]: For ρ(g)(x,y)=(x+gy,y) on Q², g∈Z, and F=identity (the q=1 algebraic specialization), the actual two-step admissible filtration gives semisimple trace two, while trace on invariants is one. The arithmetic q≠1 test requires the genuine Weil action and is recorded as a missing form. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_quadratic [test:computation]: For a nontrivial quadratic finite inertia line, the semisimple trace is 0. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.semisimpleTrace_shift [test:compatibility]: Shifting a complex by one negates its semisimple trace. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.1/two-component-semistable-nearby-complex
Full target: Let a regular strictly semistable scheme over an excellent strictly henselian trait have special fibre D₁∪D₂, with smooth transverse components and intersection C. The early filtered Rapoport–Zink nearby-cycle complex has graded objects gr₁=Λ_C[−1](−1), gr₀=Λ_D₁⊕Λ_D₂, gr_−1=Λ_C[−1], and other grades zero; the boundary maps are alternating restrictions and Gysin maps. N:gr₁→gr_−1(−1) is the identity on Λ_C[−1](−1), and N²=0 in the filtered derived calculation. The corrected simple complex resolves K=RΨΛ, not the inertia-cohomology cone L. Its inertia action can be trivial on cohomology sheaves while N on the derived object is nonzero.
Hypotheses: Strictly semistable regular total space over a excellent strictly henselian trait; precisely two transverse components; Λ finite with ℓ invertible, or rational ℓ-adic after realization; Only this filtered two-component calculation is claimed here; the general weight spectral sequence belongs to LPV.7
Owner inputs: ArithmeticGaloisRepresentations:R01.2; EnhancedDerivedSheaves:E0/E4; EDC.3 trait-purity Part II; LieHighestWeight Part II for the SL₂ realization
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.twoComponentNearbyComplex [construction]: Let a regular strictly semistable scheme over an excellent strictly henselian trait have special fibre D₁∪D₂, with smooth transverse components and intersection C. The early filtered Rapoport–Zink nearby-cycle complex has graded objects gr₁=Λ_C[−1](−1), gr₀=Λ_D₁⊕Λ_D₂, gr_−1=Λ_C[−1], and other grades zero; the boundary maps are alternating restrictions and Gysin maps. N:gr₁→gr_−1(−1) is the identity on Λ_C[−1](−1), and N²=0 in the filtered derived calculation. The corrected simple complex resolves K=RΨΛ, not the inertia-cohomology cone L. Its inertia action can be trivial on cohomology sheaves while N on the derived object is nonzero. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.twoComponentNearbyComplex_grades [api:data]: The three graded objects are Λ_C[−1](−1), Λ_D₁⊕Λ_D₂ and Λ_C[−1]. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.twoComponentNearbyComplex_monodromy [api:relation]: N on the outer grades is the identity after the Tate twist, and N²=0. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.twoComponentNearbyComplex_resolves [api:compatibility]: The corrected total complex is quasi-isomorphic to the geometric nearby complex K, not to L=RΓ(I,K). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_node [test:computation]: For xy=π, the degree-one nearby stalk is Λ(−1). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_disjoint [test:degenerate]: If C is empty then N=0 and only the center-zero grade remains. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_not_sheaf_split [test:non-example]: For the nodal local model the cohomology-sheaf inertia action is trivial, but the derived N map on the two outer grades is an isomorphism. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.twoComponent_N_square [test:characterisation]: The filtered two-component operator has N²=0 and gr₁N equal to identity onto gr_−1(−1). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.1/twisted-monodromy-equivariance
Full target: The canonical N:V→V(−1) is equivariant for the trait Galois action. After trivializing the Tate line and using geometric Frobenius over F_q, this reads NF=qFN. For σ in the chosen unipotent inertia subgroup, ρ(σ)=exp(t_l(σ)N). Changing a Tate generator by a unit rescales the displayed scalar N inversely and leaves the twisted map unchanged.
Hypotheses: Finite-dimensional rational ℓ-adic geometric representation; a unipotent open inertia subgroup; Geometric Frobenius convention; Frob acts by q on Q_l(−1)
Owner inputs: ArithmeticGaloisRepresentations:R01.2; EnhancedDerivedSheaves:E0/E4; EDC.3 trait-purity Part II; LieHighestWeight Part II for the SL₂ realization
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.twistedMonodromyEquivariance [theorem]: The canonical N:V→V(−1) is equivariant for the trait Galois action. After trivializing the Tate line and using geometric Frobenius over F_q, this reads NF=qFN. For σ in the chosen unipotent inertia subgroup, ρ(σ)=exp(t_l(σ)N). Changing a Tate generator by a unit rescales the displayed scalar N inversely and leaves the twisted map unchanged. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point-nearby-cycles-3-1-2
Full target: For f:X→S flat of finite type and pure relative dimension n over a henselian trait, assume the special fibre is smooth away from finitely many ordinary quadratic points. Let Σ be those points and E⊂Σ the points near which the generic fibre is smooth. With finite coefficients Λ invertible on S, R^iΦΛ=0 for i≠n and R^nΦΛ is supported exactly on E, where its stalks are free of rank one. The local nearby-cycle stalk and costalk pairing is perfect; at n=0 the nearby-cycle degree-zero stalk has rank two, while the vanishing-cycle stalk has rank one.
Hypotheses: f flat of finite type, pure relative dimension n; special-fibre singularities ordinary quadratic; Λ finite torsion invertible on S; E is the smooth-generic subset of the singular locus; persistent cone singularities are excluded from its support
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.ordinaryQuadraticPointNearbyCycles312 [theorem]: For f:X→S flat of finite type and pure relative dimension n over a henselian trait, assume the special fibre is smooth away from finitely many ordinary quadratic points. Let Σ be those points and E⊂Σ the points near which the generic fibre is smooth. With finite coefficients Λ invertible on S, R^iΦΛ=0 for i≠n and R^nΦΛ is supported exactly on E, where its stalks are free of rank one. The local nearby-cycle stalk and costalk pairing is perfect; at n=0 the nearby-cycle degree-zero stalk has rank two, while the vanishing-cycle stalk has rank one. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/even-relative-dimension-variation-3-2
Full target: For an ordinary quadratic point x in the smooth-generic support E, with relative dimension n=2m over a strictly henselian trait, the middle nearby costalk with twist m has an integral orientation δ, determined up to sign, whose self-pairing is (−1)^m·2. In dimension zero impose trace zero inside the rank-two nearby object. The vanishing line carries a coefficient-independent quadratic inertia character ε_x, and variation on a vanishing class a is (−1)^m((ε_x(σ)−1)/2)(a,δ)δ. Define this integral coefficient before reduction, using twice the coefficient modulus when necessary. The character is that of the centre of the even Clifford algebra of the local quadratic model. In residue characteristic different from two, the model Q=b has ε_x=ε^{v(b)}, where ε is the uniformizer Kummer character; its Clifford centre is obtained by adjoining a square root of (−1)^{m+1}·2b·det(a_ij) in the source’s polar-matrix convention. Thus even v(b) gives trivial variation and odd v(b) gives the reflection branch. The centre description, rather than this tame parity shortcut, remains the contract in characteristic two.
Hypotheses: n = 2m even; S strictly henselian; x ∈ E; 3.2.3 requires residue characteristic ≠ 2 and uses the Clifford-algebra description; the characteristic-2 case is only covered by 3.2.2's Clifford-centre description; NOTATION as in the 3.1.2 node: the source's Sigma is this packet's E. Part (i) of 3.2.1 is about R^n psi_eta and part (ii) about R^n Phi_eta; the two are genuinely different functors and the source uses both on the same page.
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.evenRelativeDimensionVariation32 [theorem]: For an ordinary quadratic point x in the smooth-generic support E, with relative dimension n=2m over a strictly henselian trait, the middle nearby costalk with twist m has an integral orientation δ, determined up to sign, whose self-pairing is (−1)^m·2. In dimension zero impose trace zero inside the rank-two nearby object. The vanishing line carries a coefficient-independent quadratic inertia character ε_x, and variation on a vanishing class a is (−1)^m((ε_x(σ)−1)/2)(a,δ)δ. Define this integral coefficient before reduction, using twice the coefficient modulus when necessary. The character is that of the centre of the even Clifford algebra of the local quadratic model. In residue characteristic different from two, the model Q=b has ε_x=ε^{v(b)}, where ε is the uniformizer Kummer character; its Clifford centre is obtained by adjoining a square root of (−1)^{m+1}·2b·det(a_ij) in the source’s polar-matrix convention. Thus even v(b) gives trivial variation and odd v(b) gives the reflection branch. The centre description, rather than this tame parity shortcut, remains the contract in characteristic two. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/odd-relative-dimension-picard-lefschetz-3-3
Full target: Let X→S have an ordinary nondegenerate quadratic singularity of relative dimension n=2m+1, with smooth generic fibre, local equation Q−b=0 and b≠0 in the maximal ideal of the henselian trait. The primitive quotient of the exceptional quadric determines ±δ. For finite coefficients prime to the residue characteristic, Var(σ)(a)=(-1)^(m+1) ε_b(σ)(a,δ)δ, where ε_b(σ)=σ(b^(1/r))/b^(1/r) in μ_r=Λ(1); the root is of b. For a proper family this gives σ(a)=a+(-1)^(m+1)ε_b(σ)(a,δ)δ on middle cohomology. For Q_l coefficients ε_b=v(b)t_l. The algebraic proof uses the LPV.1 two-component filtered nearby-cycle calculation, its restriction/Gysin boundary signs and quadric cohomology, before LPV.2.
Hypotheses: n=2m+1; ordinary nondegenerate point; smooth generic fibre; S henselian trait; b≠0; ℓ invertible; properness for the global cohomology formula; Geometric δ is normalized by the primitive quadric classes; twists make ε_b(a,δ)δ untwisted
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.oddRelativeDimensionPicardLefschetz33 [theorem]: Let X→S have an ordinary nondegenerate quadratic singularity of relative dimension n=2m+1, with smooth generic fibre, local equation Q−b=0 and b≠0 in the maximal ideal of the henselian trait. The primitive quotient of the exceptional quadric determines ±δ. For finite coefficients prime to the residue characteristic, Var(σ)(a)=(-1)^(m+1) ε_b(σ)(a,δ)δ, where ε_b(σ)=σ(b^(1/r))/b^(1/r) in μ_r=Λ(1); the root is of b. For a proper family this gives σ(a)=a+(-1)^(m+1)ε_b(σ)(a,δ)δ on middle cohomology. For Q_l coefficients ε_b=v(b)t_l. The algebraic proof uses the LPV.1 two-component filtered nearby-cycle calculation, its restriction/Gysin boundary signs and quadric cohomology, before LPV.2. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/lefschetz-degeneration-specialization-sequence
Full target: Let S be the spectrum of a henselian discrete valuation ring A with algebraically closed residue field of characteristic p, with generic point η, closed point s and geometric generic point η̄, and let ℓ ≠ p be prime. Let f : X → S be proper with X regular, purely of dimension n + 1, and f smooth except at one ordinary quadratic point x of the special fibre X_s. Write n = 2m or n = 2m + 1. Then: (i) there is a vanishing cycle δ ∈ H^n(X_η̄, ℚ_ℓ)(m), well defined up to sign; (ii) sp : H^i(X_s, ℚ_ℓ) ≅ H^i(X, ℚ_ℓ) → H^i(X_η̄, ℚ_ℓ) is an isomorphism for i ≠ n, n + 1; (iii) there is an exact sequence 0 → H^n(X_s, ℚ_ℓ) → H^n(X_η̄, ℚ_ℓ) → ℚ_ℓ(m − n) → H^{n+1}(X_s, ℚ_ℓ) → H^{n+1}(X_η̄, ℚ_ℓ) → 0 whose middle map is x ↦ Tr(x ∪ δ) and whose other maps are sp.
Hypotheses: The residue field is algebraically closed; the general case is reached by passing to the strict henselisation.; ℓ is different from the residue characteristic p.; X is regular and x is the only point where f fails to be smooth; the generic fibre X_η is then smooth and proper.
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.lefschetzDegenerationSpecializationSequence [theorem]: Let S be the spectrum of a henselian discrete valuation ring A with algebraically closed residue field of characteristic p, with generic point η, closed point s and geometric generic point η̄, and let ℓ ≠ p be prime. Let f : X → S be proper with X regular, purely of dimension n + 1, and f smooth except at one ordinary quadratic point x of the special fibre X_s. Write n = 2m or n = 2m + 1. Then: (i) there is a vanishing cycle δ ∈ H^n(X_η̄, ℚ_ℓ)(m), well defined up to sign; (ii) sp : H^i(X_s, ℚ_ℓ) ≅ H^i(X, ℚ_ℓ) → H^i(X_η̄, ℚ_ℓ) is an isomorphism for i ≠ n, n + 1; (iii) there is an exact sequence 0 → H^n(X_s, ℚ_ℓ) → H^n(X_η̄, ℚ_ℓ) → ℚ_ℓ(m − n) → H^{n+1}(X_s, ℚ_ℓ) → H^{n+1}(X_η̄, ℚ_ℓ) → 0 whose middle map is x ↦ Tr(x ∪ δ) and whose other maps are sp. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/local-picard-lefschetz-formula
Full target: Let S be the spectrum of a henselian discrete valuation ring A with algebraically closed residue field of characteristic p, with generic point η, closed point s and geometric generic point η̄, and let ℓ ≠ p be prime. Let f : X → S be proper with X regular, purely of dimension n + 1, and f smooth except at one ordinary quadratic point x of the special fibre X_s. Write n = 2m or n = 2m + 1. Let I = Gal(η̄/η) (the inertia group, as the residue field is algebraically closed) act on H^i(X_η̄, ℚ_ℓ) by transport of structure, and write (x, δ) = Tr(x ∪ δ). Then I acts trivially on H^i(X_η̄, ℚ_ℓ) for i ≠ n. On H^n: (A) if n = 2m + 1 is odd, σx = x + (−1)^{m+1} t_ℓ(σ)(x, δ)δ, where t_ℓ : I → ℤ_ℓ(1) is the tame character; (B) if n = 2m is even and p ≠ 2, let ε : I → {±1} be the unique character of order 2; then σx = x when ε(σ) = 1 and σx = x + (−1)^{m+1}(x, δ)δ when ε(σ) = −1, and (δ, δ) = (−1)^m·2. Equivalently, in Deligne's table (4.1), the sign in σx = x ± … is − for n ≡ 0, 1 and + for n ≡ 2, 3 mod 4, and (δ, δ) = 2, 0, −2, 0.
Hypotheses: p ≠ 2 in case (B).; ℓ ≠ p.; The twists are as in the specialisation sequence: δ ∈ H^n(X_η̄)(m), (x, δ) ∈ ℚ_ℓ(m − n), so t_ℓ(σ)(x, δ)δ lies in H^n(X_η̄)(2m + 1 − n) = H^n(X_η̄) for n odd.
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.localPicardLefschetzFormula [theorem]: Let S be the spectrum of a henselian discrete valuation ring A with algebraically closed residue field of characteristic p, with generic point η, closed point s and geometric generic point η̄, and let ℓ ≠ p be prime. Let f : X → S be proper with X regular, purely of dimension n + 1, and f smooth except at one ordinary quadratic point x of the special fibre X_s. Write n = 2m or n = 2m + 1. Let I = Gal(η̄/η) (the inertia group, as the residue field is algebraically closed) act on H^i(X_η̄, ℚ_ℓ) by transport of structure, and write (x, δ) = Tr(x ∪ δ). Then I acts trivially on H^i(X_η̄, ℚ_ℓ) for i ≠ n. On H^n: (A) if n = 2m + 1 is odd, σx = x + (−1)^{m+1} t_ℓ(σ)(x, δ)δ, where t_ℓ : I → ℤ_ℓ(1) is the tame character; (B) if n = 2m is even and p ≠ 2, let ε : I → {±1} be the unique character of order 2; then σx = x when ε(σ) = 1 and σx = x + (−1)^{m+1}(x, δ)δ when ε(σ) = −1, and (δ, δ) = (−1)^m·2. Equivalently, in Deligne's table (4.1), the sign in σx = x ± … is − for n ≡ 0, 1 and + for n ≡ 2, 3 mod 4, and (δ, δ) = 2, 0, −2, 0. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/direct-images-at-a-lefschetz-degeneration
Full target: Let S be the spectrum of a henselian discrete valuation ring A with algebraically closed residue field of characteristic p, with generic point η, closed point s and geometric generic point η̄, and let ℓ ≠ p be prime. Let f : X → S be proper with X regular, purely of dimension n + 1, and f smooth except at one ordinary quadratic point x of the special fibre X_s. Write n = 2m or n = 2m + 1. Let j : η → S be the inclusion. (a) If δ ≠ 0: R^i f_*ℚ_ℓ is constant for i ≠ n, and R^n f_*ℚ_ℓ = j_*j^*R^n f_*ℚ_ℓ. (b) If δ = 0, which can happen only for n odd since (δ, δ) = ±2 for n even: R^i f_*ℚ_ℓ is constant for i ≠ n + 1, and there is an exact sequence 0 → ℚ_ℓ(m − n)_s → R^{n+1} f_*ℚ_ℓ → j_*j^*R^{n+1} f_*ℚ_ℓ → 0 with j_*j^*R^{n+1} f_*ℚ_ℓ constant, where ℚ_ℓ(m − n)_s is ℚ_ℓ(m − n) on {s} extended by zero.
Hypotheses: As in the specialisation sequence, with p ≠ 2 when n is even.
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.directImagesAtALefschetzDegeneration [theorem]: Let S be the spectrum of a henselian discrete valuation ring A with algebraically closed residue field of characteristic p, with generic point η, closed point s and geometric generic point η̄, and let ℓ ≠ p be prime. Let f : X → S be proper with X regular, purely of dimension n + 1, and f smooth except at one ordinary quadratic point x of the special fibre X_s. Write n = 2m or n = 2m + 1. Let j : η → S be the inclusion. (a) If δ ≠ 0: R^i f_*ℚ_ℓ is constant for i ≠ n, and R^n f_*ℚ_ℓ = j_*j^*R^n f_*ℚ_ℓ. (b) If δ = 0, which can happen only for n odd since (δ, δ) = ±2 for n even: R^i f_*ℚ_ℓ is constant for i ≠ n + 1, and there is an exact sequence 0 → ℚ_ℓ(m − n)_s → R^{n+1} f_*ℚ_ℓ → j_*j^*R^{n+1} f_*ℚ_ℓ → 0 with j_*j^*R^{n+1} f_*ℚ_ℓ constant, where ℚ_ℓ(m − n)_s is ℚ_ℓ(m − n) on {s} extended by zero. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-form
Full target: Let S = Spec A, V a locally free A-module of rank r and Q a quadratic form on V, with polar form Φ(x, y) = Q(x + y) − Q(x) − Q(y). Q is nowhere zero if the values Q(v) generate the unit ideal; then Q = 0 defines a subscheme of P(V*) (EGA convention), flat and purely of relative dimension r − 2 over S, the quadric of Q. Q is ordinary if it is nowhere zero and its quadric is smooth over S; this can be checked after base change to fields. Over a field: (a) if r is even or the characteristic is not 2, Q is ordinary if and only if Φ is nondegenerate; (b) if r is odd and the characteristic is 2, Q is ordinary if and only if the kernel N of the alternating form Φ has dimension one and Q does not vanish on N. For V ≠ 0 over a field, ordinary is Mathlib's QuadraticMap.Nondegenerate (radical zero and polar kernel of rank at most one), which follows Elman–Karpenko–Merkurjev. Require positive locally free rank. Over a field, the finite-dimensional prototype requires finrank V>0, so rank zero is excluded; no invertibility-of-two assumption is imposed on the characteristic-two branch.
Hypotheses: The case r = 0 is excluded: the zero form on the zero module is not nowhere zero.; Condition (b) is for characteristic 2; the source prints card(A) = 2 (source issue E1).
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.IsOrdinary [definition]: Let S = Spec A, V a locally free A-module of rank r and Q a quadratic form on V, with polar form Φ(x, y) = Q(x + y) − Q(x) − Q(y). Q is nowhere zero if the values Q(v) generate the unit ideal; then Q = 0 defines a subscheme of P(V*) (EGA convention), flat and purely of relative dimension r − 2 over S, the quadric of Q. Q is ordinary if it is nowhere zero and its quadric is smooth over S; this can be checked after base change to fields. Over a field: (a) if r is even or the characteristic is not 2, Q is ordinary if and only if Φ is nondegenerate; (b) if r is odd and the characteristic is 2, Q is ordinary if and only if the kernel N of the alternating form Φ has dimension one and Q does not vanish on N. For V ≠ 0 over a field, ordinary is Mathlib's QuadraticMap.Nondegenerate (radical zero and polar kernel of rank at most one), which follows Elman–Karpenko–Merkurjev. Require positive locally free rank. Over a field, the finite-dimensional prototype requires finrank V>0, so rank zero is excluded; no invertibility-of-two assumption is imposed on the characteristic-two branch. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.IsOrdinary.baseChange [api:compatibility]: Ordinary is stable under base change and can be checked on the fibres at points of S. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.isOrdinary_xy_add_sq_char_two [test:computation]: Characteristic 2, r = 3, Q = xy + z²: ker Φ = k·e_z and Q(e_z) = 1, so Q is ordinary (the conic xy = z² is smooth). The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.not_isOrdinary_sum_sq_char_two [test:non-example]: Characteristic 2, r = 2, Q = x² + y² = (x + y)²: Φ = 0 and the quadric is a double point, so Q is not ordinary. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.isOrdinary_rank_one [test:degenerate]: r = 1, Q = ax² with a a unit: the quadric is empty and Q is ordinary in every characteristic. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.isOrdinary_iff_nondegenerate_test [test:compatibility]: Over a field and for V ≠ 0, IsOrdinary Q agrees with Mathlib's QuadraticMap.Nondegenerate Q: in characteristic 2 the alternating Φ has kernel of dimension ≡ r mod 2, so rank ≤ 1 forces 0 or 1 according to the parity of r. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.

LefschetzPencilsAndVanishingCycles:LPV.2/normal-form-of-ordinary-quadratic-forms
Full target: Let Q be an ordinary quadratic form on a locally free A-module V of rank r = 2m (resp. r = 2m + 1). Étale locally on Spec A, V has a basis e₁, …, e_r with Q(Σ xᵢeᵢ) = Σ_{i=1}^{m} x_i x_{i+m} (resp. Σ_{i=1}^{m} x_i x_{i+m} + λx²_{2m+1} with λ invertible).
Hypotheses: The source prints the upper summation limit m − 1 (source issue E2).
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.normalFormOfOrdinaryQuadraticForms [theorem]: Let Q be an ordinary quadratic form on a locally free A-module V of rank r = 2m (resp. r = 2m + 1). Étale locally on Spec A, V has a basis e₁, …, e_r with Q(Σ xᵢeᵢ) = Σ_{i=1}^{m} x_i x_{i+m} (resp. Σ_{i=1}^{m} x_i x_{i+m} + λx²_{2m+1} with λ invertible). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/discriminant-double-cover-of-an-even-quadric
Full target: Let Q be nondegenerate on V locally free of rank 2m > 0 over A. The centre Z(Q) of the even Clifford algebra C⁺(Q) is a finite étale A-algebra of rank 2, and C⁺(Q) is an Azumaya algebra over Z(Q) (XII 1.5); C⁺(Q) depends only on the quadric Q = 0 in P(V*) (XII 1.3). A totally isotropic direct summand W of rank m defines an idempotent e(W) ∈ Z(Q) (XII 1.6–1.7), and over a field e(W₁) = e(W₂) if and only if dim(W₁/W₁ ∩ W₂) is even (XII 1.12). For a smooth quadric X/S of dimension n = 2m > 0 this gives an étale double cover Z(X) → S (Z(X) = X for n = 0), and the generatrices (linear subspaces of dimension m of P(X) inside X) form a smooth projective S-scheme Gén(X) whose Stein factorisation is e : Gén(X) → Z(X) (XII 2.7–2.8).
Hypotheses: Even rank; for rank 2 in characteristic not 2, Z(Q) is the discriminant algebra.
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre [construction]: Let Q be nondegenerate on V locally free of rank 2m > 0 over A. The centre Z(Q) of the even Clifford algebra C⁺(Q) is a finite étale A-algebra of rank 2, and C⁺(Q) is an Azumaya algebra over Z(Q) (XII 1.5); C⁺(Q) depends only on the quadric Q = 0 in P(V*) (XII 1.3). A totally isotropic direct summand W of rank m defines an idempotent e(W) ∈ Z(Q) (XII 1.6–1.7), and over a field e(W₁) = e(W₂) if and only if dim(W₁/W₁ ∩ W₂) is even (XII 1.12). For a smooth quadric X/S of dimension n = 2m > 0 this gives an étale double cover Z(X) → S (Z(X) = X for n = 0), and the generatrices (linear subspaces of dimension m of P(X) inside X) form a smooth projective S-scheme Gén(X) whose Stein factorisation is e : Gén(X) → Z(X) (XII 2.7–2.8). The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre_isEtale [api:characterisation]: Z(Q) is finite étale of rank 2 over A, and C⁺(Q) is Azumaya over Z(Q). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.lagrangianIdempotent [api:constructor]: e(W) ∈ Z(Q) for W totally isotropic of rank m. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.lagrangianIdempotent_eq_iff [api:characterisation]: Over a field, e(W₁) = e(W₂) ↔ Even (finrank (W₁ ⧸ W₁ ⊓ W₂)). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.discriminantCover [api:constructor]: Z(X) → S for a smooth quadric of even dimension, with e : Gén(X) → Z(X) the Stein factorisation. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre_hyperbolic [test:computation]: V = Ae ⊕ Af with Q(xe + yf) = xy: C⁺(Q) = Z(Q) ≅ A × A, and the isotropic lines Ae and Af give the two idempotents fe and ef = 1 − fe (XII 1.12, proof). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre_discriminant [test:computation]: Over a field of characteristic not 2, Q = x² − dy²: C⁺(Q) = k ⊕ k·e₁e₂ with (e₁e₂)² = d, so Z(Q) ≅ k[t]/(t² − d), split if and only if d is a square. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.evenCliffordCentre_eq_mathlib [test:compatibility]: C⁺(Q) is Mathlib's CliffordAlgebra.even Q. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.lagrangianIdempotent_sum [test:characterisation]: For an orthogonal sum, e(W₁ ⊕ W₂) = e(W₁)e(W₂) + (1 − e(W₁))(1 − e(W₂)) (XII 1.10.1): the sections add as ℤ/2-torsors, not as idempotents. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/smooth-quadric
Full target: Over an algebraically closed field k, a smooth quadric of dimension n is a k-scheme isomorphic to the subscheme Q = 0 of P(V*), dim V = n + 2, for Q an ordinary quadratic form. Over a scheme S, a smooth quadric of dimension n is a proper smooth S-scheme whose geometric fibres are smooth quadrics. For n = 0 it is an étale double cover of S, for n = 1 a Severi–Brauer scheme of relative dimension 1, and for n = 2 its geometric fibres are P¹ × P¹. Étale locally on S it is the quadric of an ordinary form in a projective space; for n>0 its ambient Severi–Brauer scheme P(X) depends only on X/S; Ω^n_{X/S} ≅ O(−n) has ample inverse.
Hypotheses: For n>0 the ambient Severi–Brauer scheme P(X) is canonical (XII 2.6). The n=0 case is the étale double-cover statement, with no canonical ambient asserted by that proposition.
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.IsSmoothQuadric [definition]: Over an algebraically closed field k, a smooth quadric of dimension n is a k-scheme isomorphic to the subscheme Q = 0 of P(V*), dim V = n + 2, for Q an ordinary quadratic form. Over a scheme S, a smooth quadric of dimension n is a proper smooth S-scheme whose geometric fibres are smooth quadrics. For n = 0 it is an étale double cover of S, for n = 1 a Severi–Brauer scheme of relative dimension 1, and for n = 2 its geometric fibres are P¹ × P¹. Étale locally on S it is the quadric of an ordinary form in a projective space; for n>0 its ambient Severi–Brauer scheme P(X) depends only on X/S; Ω^n_{X/S} ≅ O(−n) has ample inverse. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.isSmoothQuadric_of_isOrdinary [api:constructor]: The quadric of an ordinary form of rank n + 2 is a smooth quadric of dimension n. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.ambientProjective [api:constructor]: For a smooth quadric X/S of relative dimension n>0, the canonical ambient Severi–Brauer S-scheme P(X) with X a relative divisor of degree 2. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.isSmoothQuadric_zero_iff [api:characterisation]: A smooth quadric of dimension 0 is the same as an étale double cover. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.canonical_iso [api:characterisation]: Ω^n_{X/S} ≅ O_X(−n). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.smoothQuadric_dim_zero [test:degenerate]: n = 0 over an algebraically closed field: X ≅ Spec k ⊔ Spec k. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.smoothQuadric_dim_two [test:computation]: n = 2: xy = zw in P³ is P¹ × P¹ (Segre). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.smoothQuadric_real_conic [test:computation]: n = 1 over ℝ: x² + y² + z² = 0 is a smooth conic without real points, a nontrivial Severi–Brauer curve. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.not_smoothQuadric_cone [test:non-example]: The cone xy = z² in P³ (a form of rank 3 in 4 variables) is singular at (0:0:0:1); the form is not ordinary. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-smooth-quadrics
Full target: Let p : X → S be a smooth quadric of dimension n and ℓ a prime invertible on S, with hyperplane class η ∈ H⁰(S, R²p_*ℤ_ℓ(1)). (i) R^{2i+1}p_*ℤ_ℓ = 0. (ii) For 0 ≤ 2i < n (resp. n < 2i ≤ 2n), R^{2i}p_*ℤ_ℓ(i) is canonically the constant sheaf ℤ_ℓ, generated by η^i (resp. η^i/2). (iii) For n = 2m, the cycle-class map cℓ : ℤ_ℓ^{Z(X)} → R^n p_*ℤ_ℓ(m) of the generatrices is an isomorphism, and for disjoint sections α, β of Z(X): (a) η^m = cℓ(α) + cℓ(β); (b) for m even, Tr(cℓ(α)²) = Tr(cℓ(β)²) = 1 and cℓ(α)cℓ(β) = 0, and for m odd, cℓ(α)² = cℓ(β)² = 0 and Tr(cℓ(α)cℓ(β)) = 1; (c) η·(cℓ(α) − cℓ(β)) = 0. Consequently, over 𝔽_q, #X(𝔽_q) = Σ_{i=0}^{n} q^i for n odd and Σ_{i=0}^{n} q^i + εq^m for n = 2m, with ε = 1 if X has a rational generatrix and ε = −1 otherwise.
Hypotheses: The source writes η ∈ H⁰(S, R¹p_*ℤ_ℓ(1)) in 3.1 (source issue E3); η lives in degree 2.
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.cohomologyOfSmoothQuadrics [theorem]: Let p : X → S be a smooth quadric of dimension n and ℓ a prime invertible on S, with hyperplane class η ∈ H⁰(S, R²p_*ℤ_ℓ(1)). (i) R^{2i+1}p_*ℤ_ℓ = 0. (ii) For 0 ≤ 2i < n (resp. n < 2i ≤ 2n), R^{2i}p_*ℤ_ℓ(i) is canonically the constant sheaf ℤ_ℓ, generated by η^i (resp. η^i/2). (iii) For n = 2m, the cycle-class map cℓ : ℤ_ℓ^{Z(X)} → R^n p_*ℤ_ℓ(m) of the generatrices is an isomorphism, and for disjoint sections α, β of Z(X): (a) η^m = cℓ(α) + cℓ(β); (b) for m even, Tr(cℓ(α)²) = Tr(cℓ(β)²) = 1 and cℓ(α)cℓ(β) = 0, and for m odd, cℓ(α)² = cℓ(β)² = 0 and Tr(cℓ(α)cℓ(β)) = 1; (c) η·(cℓ(α) − cℓ(β)) = 0. Consequently, over 𝔽_q, #X(𝔽_q) = Σ_{i=0}^{n} q^i for n odd and Σ_{i=0}^{n} q^i + εq^m for n = 2m, with ε = 1 if X has a rational generatrix and ε = −1 otherwise. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-affine-quadrics
Full target: Let X be the smooth quadric over S of an ordinary form Q on V of rank n + 2, H a hyperplane of P(V*) meeting X transversally, Y = X ∩ H (a smooth quadric of dimension n − 1), X° = X − Y and f : X° → S. For n = 2m the primitive part of R^n p_*ℤ_ℓ(m) is the orthogonal of η^m, generated by cℓ(α) − cℓ(β), and the primitive quotient is R^n p_*ℤ_ℓ(m)/ℤ_ℓη^m. The cohomology of X° is torsion-free, with nonzero Betti numbers b₀ = b_n = 1, and with compact support b_{2n} = b_n = 1 (b₀ = 2 for n = 0). For n = 2m > 0, R^n f_!ℤ_ℓ(m) is the primitive part and R^n f_*ℤ_ℓ(m) the primitive quotient of R^{2m}p_*ℤ_ℓ(m); for n = 2m + 1, R^n f_!ℤ_ℓ(m) is the primitive quotient and R^n f_*ℤ_ℓ(m + 1) the primitive part of R^{2m}q_*ℤ_ℓ(m). Locally these have natural generators defined up to sign, δ with compact support and δ′ without. The forget-supports map φ : R^n f_!ℤ_ℓ → R^n f_*ℤ_ℓ is 0 for n odd and sends ±δ to ±2δ′ for n even > 0; Tr(δδ′) = ±1, and Tr(δ²) = 0 for n = 2m + 1 and (−1)^m·2 for n = 2m.
Hypotheses: n > 0 for the exact sequences; n = 0 gives Y = ∅ and X° = X.
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.cohomologyOfAffineQuadrics [theorem]: Let X be the smooth quadric over S of an ordinary form Q on V of rank n + 2, H a hyperplane of P(V*) meeting X transversally, Y = X ∩ H (a smooth quadric of dimension n − 1), X° = X − Y and f : X° → S. For n = 2m the primitive part of R^n p_*ℤ_ℓ(m) is the orthogonal of η^m, generated by cℓ(α) − cℓ(β), and the primitive quotient is R^n p_*ℤ_ℓ(m)/ℤ_ℓη^m. The cohomology of X° is torsion-free, with nonzero Betti numbers b₀ = b_n = 1, and with compact support b_{2n} = b_n = 1 (b₀ = 2 for n = 0). For n = 2m > 0, R^n f_!ℤ_ℓ(m) is the primitive part and R^n f_*ℤ_ℓ(m) the primitive quotient of R^{2m}p_*ℤ_ℓ(m); for n = 2m + 1, R^n f_!ℤ_ℓ(m) is the primitive quotient and R^n f_*ℤ_ℓ(m + 1) the primitive part of R^{2m}q_*ℤ_ℓ(m). Locally these have natural generators defined up to sign, δ with compact support and δ′ without. The forget-supports map φ : R^n f_!ℤ_ℓ → R^n f_*ℤ_ℓ is 0 for n odd and sends ±δ to ±2δ′ for n even > 0; Tr(δδ′) = ±1, and Tr(δ²) = 0 for n = 2m + 1 and (−1)^m·2 for n = 2m. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/ordinary-quadratic-point
Full target: Let y be a closed point of a scheme Y of finite type over a field k of characteristic p, and n = dim_y Y. For k algebraically closed, y is an ordinary quadratic point of Y if Ô_{Y,y} ≅ k[[x₁, …, x_{n+1}]]/(f) with f = Q(x) + (terms of order > 2) and Q an ordinary quadratic form in n + 1 variables. For general k, y is an ordinary quadratic point if the points of Y ⊗_k k̄ over y are. Replacing ordinary by nondegenerate gives a non-degenerate quadratic point; y is non-degenerate if and only if it is ordinary and p ≠ 2 or n is odd. An ordinary quadratic point with p = 2 and n even is called degenerate. The completed-local isomorphism is an isomorphism of k-algebras. With r=n+1, the field prototype uses an actual multivariate series Q+R, where every coefficient of R in total degree below three vanishes. It does not replace an arbitrary ordinary germ by its pure quadratic cone. General-field geometric descent and identification with the scheme’s completed local algebra are separate supplier forms.
Hypotheses: The quadratic part Q is well defined up to linear change of variables because f has no linear term.; r=n+1>0; A is the completed local k-algebra with its actual scalar map.; Nondegenerate means polar nondegenerate: ordinary AND (p≠2 OR n odd).
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.IsOrdinaryQuadraticPoint [definition]: Let y be a closed point of a scheme Y of finite type over a field k of characteristic p, and n = dim_y Y. For k algebraically closed, y is an ordinary quadratic point of Y if Ô_{Y,y} ≅ k[[x₁, …, x_{n+1}]]/(f) with f = Q(x) + (terms of order > 2) and Q an ordinary quadratic form in n + 1 variables. For general k, y is an ordinary quadratic point if the points of Y ⊗_k k̄ over y are. Replacing ordinary by nondegenerate gives a non-degenerate quadratic point; y is non-degenerate if and only if it is ordinary and p ≠ 2 or n is odd. An ordinary quadratic point with p = 2 and n even is called degenerate. The completed-local isomorphism is an isomorphism of k-algebras. With r=n+1, the field prototype uses an actual multivariate series Q+R, where every coefficient of R in total degree below three vanishes. It does not replace an arbitrary ordinary germ by its pure quadratic cone. General-field geometric descent and identification with the scheme’s completed local algebra are separate supplier forms. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.IsNondegenerateQuadraticPoint [api:data]: The same with the leading form nondegenerate. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.isNondegenerate_iff [api:characterisation]: IsNondegenerateQuadraticPoint Y y ↔ IsOrdinaryQuadraticPoint Y y ∧ (p ≠ 2 ∨ Odd n). The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.isOrdinaryQuadraticPoint_baseChange [api:compatibility]: The notion is geometric: it holds at y if and only if it holds at the points over y after any field extension. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.isOrdinaryQuadraticPoint_cone [api:example]: For r>0 and ordinary Q, the actual formal quotient by quadraticSeries Q is an ordinary germ; the geometric cone-vertex identification is imported from SF.0. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.node_isOrdinary [test:computation]: The node xy = 0 in 𝔸² (n = 1): Q = xy is ordinary and nondegenerate in every characteristic. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.doublePoint_char_two [test:computation]: n = 0, Y = Spec k[x]/(x²): Q = x² is ordinary in every characteristic, so the origin is ordinary; it is non-degenerate if and only if p ≠ 2, and for p = 2 it is degenerate. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.cusp_not_ordinary [test:non-example]: The cusp y² = x³ (n = 1): the quadratic part y² in two variables is not ordinary (its quadric is a double point of P¹), so the cusp is not an ordinary quadratic point. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.Quadric.smooth_point_not_quadratic [test:degenerate]: A smooth point is not an ordinary quadratic point: its Zariski tangent space has dimension n, not n + 1. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.

LefschetzPencilsAndVanishingCycles:LPV.2/tjurina-module-of-an-ordinary-quadratic-point
Full target: Let y be an ordinary quadratic point of Y/k with k(y) purely inseparable over k, and T¹_{Y/k} = O_Y/J the quotient by the Jacobian ideal (XV 1.1.1). Near y, T¹_{Y/k} is monogenic and concentrated at y, of rank 1 over k if y is non-degenerate (so k(y) = k), and of rank 2 if y is degenerate (p = 2, n = 2m), in which case k(y) = k or k(y) ≅ k(√a) with a ∈ k − k².
Hypotheses: k(y) purely inseparable over k; the general case reduces to it through the largest separable subextension of k(y).
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.tjurinaModuleOfAnOrdinaryQuadraticPoint [lemma]: Let y be an ordinary quadratic point of Y/k with k(y) purely inseparable over k, and T¹_{Y/k} = O_Y/J the quotient by the Jacobian ideal (XV 1.1.1). Near y, T¹_{Y/k} is monogenic and concentrated at y, of rank 1 over k if y is non-degenerate (so k(y) = k), and of rank 2 if y is degenerate (p = 2, n = 2m), in which case k(y) = k or k(y) ≅ k(√a) with a ∈ k − k². The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/tougeron-artin-implicit-function-theorem
Full target: In the ordinary quadratic local equation, a formal coordinate change tangent to the identity can be approximated to a prescribed finite order by a henselian coordinate change, under the finite-presentation/Jacobian-ideal hypotheses of Artin’s lemma cited in XV 1.1.2. This is the application of general henselian approximation to the quadratic germ, not a second general approximation theorem.
Hypotheses: Excellent henselian local base in the approximation application; finite-presentation hypersurface; The Jacobian-square divisibility condition of XV 1.1.2; the exact general statement is requested from SchemeAndStackFoundations, Part II
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.tougeronArtinImplicitFunctionTheorem [theorem]: In the ordinary quadratic local equation, a formal coordinate change tangent to the identity can be approximated to a prescribed finite order by a henselian coordinate change, under the finite-presentation/Jacobian-ideal hypotheses of Artin’s lemma cited in XV 1.1.2. This is the application of general henselian approximation to the quadratic germ, not a second general approximation theorem. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/elkik-versal-henselian-deformations
Full target: For an isolated ordinary quadratic germ over a field, the versal henselian deformation has the one-parameter nondegenerate model Q−b, or the two-parameter characteristic-two even-dimensional model x₀²+bx₀+c+Q′. A chosen special-fibre identification extends after the coefficient lifts are prescribed. Versality and comparison with the formal deformation are imported from the general Elkik approximation/deformation supplier.
Hypotheses: Isolated ordinary quadratic germ; finite presentation over a henselian noetherian local base; Nondegenerate polar form in the first branch; characteristic two with even fibre dimension in the second
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.elkikVersalHenselianDeformations [theorem]: For an isolated ordinary quadratic germ over a field, the versal henselian deformation has the one-parameter nondegenerate model Q−b, or the two-parameter characteristic-two even-dimensional model x₀²+bx₀+c+Q′. A chosen special-fibre identification extends after the coefficient lifts are prescribed. Versality and comparison with the formal deformation are imported from the general Elkik approximation/deformation supplier. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/canonical-form-of-an-ordinary-quadratic-point
Full target: Let y be an ordinary quadratic point of a k-scheme Y and k′ the largest separable subextension of k(y). There are a k′-scheme Y₀ ⊂ 𝔸^{n+1}_{k′}, either the cone Q = 0 of a nondegenerate form with y₀ the origin (1.2.3), or, for p = 2 and n = 2m, the scheme (x₀² − a) + Σ_{0<i≤j≤2m} a_ij x_i x_j = 0 with the 2m-variable form nondegenerate and y₀ = (√a, 0, …, 0) (1.2.4), and a k-isomorphism between the henselisations Y_(y) and Y₀(y₀). The same holds for the affine quadric of a non-homogeneous quadratic form with an ordinary singular point, by an affine change of variables (XV 1.2.12).
Hypotheses: When a ∉ k², k(y₀) = k(√a) is purely inseparable of degree 2 over k.
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.canonicalFormOfAnOrdinaryQuadraticPoint [theorem]: Let y be an ordinary quadratic point of a k-scheme Y and k′ the largest separable subextension of k(y). There are a k′-scheme Y₀ ⊂ 𝔸^{n+1}_{k′}, either the cone Q = 0 of a nondegenerate form with y₀ the origin (1.2.3), or, for p = 2 and n = 2m, the scheme (x₀² − a) + Σ_{0<i≤j≤2m} a_ij x_i x_j = 0 with the 2m-variable form nondegenerate and y₀ = (√a, 0, …, 0) (1.2.4), and a k-isomorphism between the henselisations Y_(y) and Y₀(y₀). The same holds for the affine quadric of a non-homogeneous quadratic form with an ordinary singular point, by an affine change of variables (XV 1.2.12). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/local-equation-of-a-family-at-an-ordinary-quadratic-point
Full target: Let S = Spec A be henselian local with closed point s, f : X → S flat of finite presentation, and x a closed point of X_s at which X_s has an ordinary quadratic singularity, with k(x) purely inseparable over k(s) and X_s of dimension n. (i) If x is non-degenerate, there are a nondegenerate quadratic form Q in n + 1 variables over A and b in the maximal ideal such that the henselisation of X at x is isomorphic to the henselisation at the origin of Q − b = 0 in 𝔸^{n+1}_S. (ii) If x is degenerate (n = 2m, char k(s) = 2), there is Q(x) = x₀² + bx₀ + c + Σ_{1≤i≤j≤2m} a_ij x_i x_j over A with b in the maximal ideal and the 2m-variable form nondegenerate, such that the henselisation of X at x is isomorphic to that of Q = 0 at (√c, 0, …, 0). The isomorphism can be chosen to extend a given one on the special fibre, lifting its coefficients (XV 1.3.3).
Hypotheses: The source prints x₀ for x₀² in the formula of (ii) (source issue E7).
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.localEquationOfAFamilyAtAnOrdinaryQuadraticPoint [theorem]: Let S = Spec A be henselian local with closed point s, f : X → S flat of finite presentation, and x a closed point of X_s at which X_s has an ordinary quadratic singularity, with k(x) purely inseparable over k(s) and X_s of dimension n. (i) If x is non-degenerate, there are a nondegenerate quadratic form Q in n + 1 variables over A and b in the maximal ideal such that the henselisation of X at x is isomorphic to the henselisation at the origin of Q − b = 0 in 𝔸^{n+1}_S. (ii) If x is degenerate (n = 2m, char k(s) = 2), there is Q(x) = x₀² + bx₀ + c + Σ_{1≤i≤j≤2m} a_ij x_i x_j over A with b in the maximal ideal and the 2m-variable form nondegenerate, such that the henselisation of X at x is isomorphic to that of Q = 0 at (√c, 0, …, 0). The isomorphism can be chosen to extend a given one on the special fibre, lifting its coefficients (XV 1.3.3). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/non-smooth-points-near-an-ordinary-quadratic-point
Full target: In the situation of the local-equation theorem, there is a neighbourhood U of x in X such that every point of U at which f is not smooth is an ordinary quadratic point of its fibre.
Hypotheses: f flat of finite presentation; x an ordinary quadratic point of X_s with k(x) purely inseparable over k(s).
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.nonSmoothPointsNearAnOrdinaryQuadraticPoint [theorem]: In the situation of the local-equation theorem, there is a neighbourhood U of x in X such that every point of U at which f is not smooth is an ordinary quadratic point of its fibre. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/homotopy-invariance-of-etale-cohomology
Full target: Let k be algebraically closed, Λ a torsion ring prime to char k, U and V k-schemes, K ∈ D⁺(U, Λ) and L ∈ D⁺(V, Λ). A morphism (U, K) → (V, L) is a pair (f : U → V, φ : f*L → K); it induces f* : H*(V, L) → H*(U, K). Two morphisms f₀, f₁ are homotopic if there are a connected k-scheme T of finite type, points 0, 1 ∈ T(k) and a morphism (U × T, pr₁*K) → (V, L) whose fibres at 0 and 1 are f₀ and f₁. Homotopic morphisms induce the same map on cohomology.
Hypotheses: k algebraically closed; T connected of finite type.
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.homotopyInvarianceOfEtaleCohomology [lemma]: Let k be algebraically closed, Λ a torsion ring prime to char k, U and V k-schemes, K ∈ D⁺(U, Λ) and L ∈ D⁺(V, Λ). A morphism (U, K) → (V, L) is a pair (f : U → V, φ : f*L → K); it induces f* : H*(V, L) → H*(U, K). Two morphisms f₀, f₁ are homotopic if there are a connected k-scheme T of finite type, points 0, 1 ∈ T(k) and a morphism (U × T, pr₁*K) → (V, L) whose fibres at 0 and 1 are f₀ and f₁. Homotopic morphisms induce the same map on cohomology. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-a-cone
Full target: Let Y ⊂ P^r be projective over an algebraically closed field k, X ⊂ 𝔸^{r+1} its affine cone with vertex 0, X_(0) the henselisation at 0, X* = X − {0}, X*_(0) = X_(0) − {0}, X₁ ⊂ P^{r+1} the projective cone (X = X₁ − Y), and F a torsion group prime to char k. Then (i) H^i(X, F) ≅ H^i({0}, F), which is F for i = 0 and 0 for i > 0; (ii) H^i_{0}(X, F) ≅ H^i_c(X, F); and H^i(X*, F) ≅ H^i(X*_(0), F) (Corollary 2.1.4).
Hypotheses: F torsion prime to the characteristic; all cohomology with coefficients in F.
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.cohomologyOfACone [theorem]: Let Y ⊂ P^r be projective over an algebraically closed field k, X ⊂ 𝔸^{r+1} its affine cone with vertex 0, X_(0) the henselisation at 0, X* = X − {0}, X*_(0) = X_(0) − {0}, X₁ ⊂ P^{r+1} the projective cone (X = X₁ − Y), and F a torsion group prime to char k. Then (i) H^i(X, F) ≅ H^i({0}, F), which is F for i = 0 and 0 for i > 0; (ii) H^i_{0}(X, F) ≅ H^i_c(X, F); and H^i(X*, F) ≅ H^i(X*_(0), F) (Corollary 2.1.4). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/cohomology-of-a-punctured-cone
Full target: In the notation of the cone theorem, let X̃, X̃_(0), X̃₁ be the blow-ups of X, X_(0), X₁ at 0, Y₀ the exceptional divisor, h : X̃₁ → Y the projection, and y₀, y_∞ : Y → X̃₁ the sections with images Y₀ and Y. Restriction gives isomorphisms H^i(X̃₁ − Y₀) ≅ H^i(Y) and H^i(X̃) ≅ H^i(Y₀) = H^i(Y), through which the long exact sequences of the pairs (X̃₁ − Y₀, Y) and (X̃₁ − Y, Y₀) become the rows of a commutative diagram (2.1.5.1): … → H^{i−1}(X*) → H^{i−2}(Y)(−1) → H^i(Y) → H^i(X*) → …, the middle arrows being cup product with the class η of a hyperplane section in one row and −η in the other (Lemma 2.1.6). Locally, H^i(X̃_(0)) ≅ H^i(Y₀) by proper base change, and the sequence of (X̃_(0), Y₀) maps to the second row of (2.1.5.1) (diagram (2.1.7.1)).
Hypotheses: Coefficients F torsion prime to char k.
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.cohomologyOfAPuncturedCone [theorem]: In the notation of the cone theorem, let X̃, X̃_(0), X̃₁ be the blow-ups of X, X_(0), X₁ at 0, Y₀ the exceptional divisor, h : X̃₁ → Y the projection, and y₀, y_∞ : Y → X̃₁ the sections with images Y₀ and Y. Restriction gives isomorphisms H^i(X̃₁ − Y₀) ≅ H^i(Y) and H^i(X̃) ≅ H^i(Y₀) = H^i(Y), through which the long exact sequences of the pairs (X̃₁ − Y₀, Y) and (X̃₁ − Y, Y₀) become the rows of a commutative diagram (2.1.5.1): … → H^{i−1}(X*) → H^{i−2}(Y)(−1) → H^i(Y) → H^i(X*) → …, the middle arrows being cup product with the class η of a hyperplane section in one row and −η in the other (Lemma 2.1.6). Locally, H^i(X̃_(0)) ≅ H^i(Y₀) by proper base change, and the sequence of (X̃_(0), Y₀) maps to the second row of (2.1.5.1) (diagram (2.1.7.1)). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/boundary-anticommutativity-for-a-cone
Full target: In the notation of the punctured-cone theorem, the composite H^{n−1}(Y₀) ≅ H^{n−1}(X̃) → H^{n−1}(X*) → H^n_{0}(X) → H^n_c(X) is the negative of the boundary map ∂ : H^{n−1}(Y) → H^n_c(X) of the pair (X₁, Y), under Y₀ ≅ Y.
Hypotheses: The source numbers this lemma 2.7.8; it is Lemma 2.1.8, as its application in 2.2.7 says (source issue E9).
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.boundaryAnticommutativityForACone [lemma]: In the notation of the punctured-cone theorem, the composite H^{n−1}(Y₀) ≅ H^{n−1}(X̃) → H^{n−1}(X*) → H^n_{0}(X) → H^n_c(X) is the negative of the boundary map ∂ : H^{n−1}(Y) → H^n_c(X) of the pair (X₁, Y), under Y₀ ≅ Y. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/standard-quadratic-degeneration
Full target: Let S be a henselian trait with s, η, s̄, η̄ as in SGA 7 XIII 0.2.5, and Λ = ℤ/k with k invertible on S. A standard quadratic degeneration of relative dimension n is the closed subscheme X ⊂ 𝔸^{n+1}_S defined by Q(x) = Σ_{i≤j} a_ij x_i x_j + Σ b_i x_i + c, nonzero modulo the uniformiser, such that, with X₁ ⊂ P^{n+1}_S the quadric Σ a_ij x_i x_j + Σ b_i x_i z + cz² = 0 and Y = X₁ ∩ H (H the hyperplane at infinity, X = X₁ − Y): (a) Y is a smooth quadric over S, that is, Σ a_ij x_i x_j is ordinary; (b) X_s̄ is a quadratic cone. Its vertex x₀ is the singular point of X_s. The subscheme A of X_s cut out by the ∂Q/∂x_i is concentrated at x₀; it has degree one, so x₀ is rational, except when char k(s) = 2 and n is even, where A has rank 2 and k(x₀) is k(s) or a purely inseparable quadratic extension of k(s). If x₀ = 0, the b_i and c lie in the maximal ideal.
Hypotheses: The source says 'n + 1 est pair' for the exceptional case; it is n + 1 odd, that is, n even (source issue E12).; Condition (*) of XV 2.2.5, that the generic fibre is smooth, is a further hypothesis, not part of the definition.
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.StandardQuadraticDegeneration [definition]: Let S be a henselian trait with s, η, s̄, η̄ as in SGA 7 XIII 0.2.5, and Λ = ℤ/k with k invertible on S. A standard quadratic degeneration of relative dimension n is the closed subscheme X ⊂ 𝔸^{n+1}_S defined by Q(x) = Σ_{i≤j} a_ij x_i x_j + Σ b_i x_i + c, nonzero modulo the uniformiser, such that, with X₁ ⊂ P^{n+1}_S the quadric Σ a_ij x_i x_j + Σ b_i x_i z + cz² = 0 and Y = X₁ ∩ H (H the hyperplane at infinity, X = X₁ − Y): (a) Y is a smooth quadric over S, that is, Σ a_ij x_i x_j is ordinary; (b) X_s̄ is a quadratic cone. Its vertex x₀ is the singular point of X_s. The subscheme A of X_s cut out by the ∂Q/∂x_i is concentrated at x₀; it has degree one, so x₀ is rational, except when char k(s) = 2 and n is even, where A has rank 2 and k(x₀) is k(s) or a purely inseparable quadratic extension of k(s). If x₀ = 0, the b_i and c lie in the maximal ideal. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.StandardQuadraticDegeneration.vertex [api:projection]: The singular point x₀ of X_s, rational unless char k(s) = 2 and n is even. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.StandardQuadraticDegeneration.projectiveClosure [api:constructor]: X₁ ⊂ P^{n+1}_S with X = X₁ − Y and Y = X₁ ∩ H a smooth quadric over S. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.StandardQuadraticDegeneration.discriminantCharacter [api:constructor]: For n even, the character ε : I → {±1} of the separable quadratic extension of k(η) given by the centre of the even Clifford algebra of (2.2.1.1). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.StandardQuadraticDegeneration.ofLocalEquation [api:constructor]: The local model Q − b = 0 of a family at a non-degenerate ordinary quadratic point (XV 1.3.2) is a standard degeneration. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.standard_node [test:computation]: n = 1, Q = xy − π with π a uniformiser: Y = {xy = 0, z = 0} is two points (a smooth quadric of dimension 0), X_s is the cone xy = 0, and the generic fibre is smooth. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.standard_double_point [test:degenerate]: n = 0, Q = x² − π with p ≠ 2: Y = ∅, X_s = Spec k(s)[x]/(x²) is a cone, and the geometric generic fibre is two points. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.not_standard_char_two [test:non-example]: char k(s) = 2, n = 1, Q = x² + y² − π: the leading form (x + y)² is not ordinary, so (a) fails. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.standard_trivial_family [test:non-example]: Q = xy (c = 0): X_η̄ is again a cone, so (*) fails and all R^iΦ vanish (Corollary 2.2.4). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/nearby-cycles-of-a-standard-quadratic-degeneration
Full target: For the standard affine quadratic degeneration X/S with smooth boundary Y and special fibre a cone with vertex x₀, use finite coefficients Λ=Z/k with k invertible on the henselian trait. Ordinary cohomology of the geometric generic fibre identifies with the nearby stalk at x₀, and compactly supported cohomology identifies with the nearby costalk there. These comparisons follow by compactification and the cone calculation. If the generic fibre remains a cone, specialization is an isomorphism and RΦΛ vanishes. If the generic fibre is smooth, RΦΛ is a rank-one skyscraper in degree n. For n>0, RΨΛ has the constant degree-zero sheaf and a rank-one degree-n skyscraper; its costalk is concentrated in degrees n and 2n, both rank one, and the top trace after twist n is an isomorphism. The middle nearby stalk and costalk with complementary twists pair perfectly by cup product and trace. When n=0 the nearby stalk and costalk are Λ²; specialization is the diagonal Λ→Λ² and the vanishing line is its cokernel. These degree-zero objects must be kept separate.
Hypotheses: (*) X_η smooth for (A)–(C); S strictly henselian for simplicity.
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.nearbyCyclesOfAStandardQuadraticDegeneration [theorem]: For the standard affine quadratic degeneration X/S with smooth boundary Y and special fibre a cone with vertex x₀, use finite coefficients Λ=Z/k with k invertible on the henselian trait. Ordinary cohomology of the geometric generic fibre identifies with the nearby stalk at x₀, and compactly supported cohomology identifies with the nearby costalk there. These comparisons follow by compactification and the cone calculation. If the generic fibre remains a cone, specialization is an isomorphism and RΦΛ vanishes. If the generic fibre is smooth, RΦΛ is a rank-one skyscraper in degree n. For n>0, RΨΛ has the constant degree-zero sheaf and a rank-one degree-n skyscraper; its costalk is concentrated in degrees n and 2n, both rank one, and the top trace after twist n is an isomorphism. The middle nearby stalk and costalk with complementary twists pair perfectly by cup product and trace. When n=0 the nearby stalk and costalk are Λ²; specialization is the diagonal Λ→Λ² and the vanishing line is its cokernel. These degree-zero objects must be kept separate. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/variation-in-a-standard-quadratic-degeneration
Full target: In the smooth-generic standard quadratic degeneration over a strictly henselian trait, choose the nearby middle costalk generator δ and the nearby stalk generator δ′ compatibly with the affine-quadric orientation and normalize (δ′,δ)=1. For n=2m>0 their twist is m, and the map forgetting support sends δ to (−1)^m·2δ′. Both generators transform through the quadratic character ε of the even Clifford centre. Variation is (−1)^m((ε(σ)−1)/2)(a,δ)δ; obtain its integral coefficient with modulus 2k before reduction to Λ=Z/k. For n=2m+1 the costalk twist is m, the stalk twist is m+1, and the forget-supports map is zero. Inertia acts trivially on these cohomology groups, although variation may be nonzero: Var(σ)(δ′)=λ(σ)δ for an additive character λ:I→Λ(1). It is a scalar λ_X times the uniformizer Kummer character, so Var(σ)(a)=λ_X t_k(σ)(a,δ)δ. Determining λ_X, including its sign, is the separate odd-dimensional Picard–Lefschetz target.
Hypotheses: (D) is derived in ℤ/2k-coefficients, where (ε(σ) − 1)/2 makes sense, and then reduced.; λ_X is determined in XV §3; for the local model with b a uniformiser it is (−1)^{m+1} (the carried odd-dimensional node).; The source writes D(σ) for Var(σ) in (2.2.5.9) (source issue E10).
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.variationInAStandardQuadraticDegeneration [theorem]: In the smooth-generic standard quadratic degeneration over a strictly henselian trait, choose the nearby middle costalk generator δ and the nearby stalk generator δ′ compatibly with the affine-quadric orientation and normalize (δ′,δ)=1. For n=2m>0 their twist is m, and the map forgetting support sends δ to (−1)^m·2δ′. Both generators transform through the quadratic character ε of the even Clifford centre. Variation is (−1)^m((ε(σ)−1)/2)(a,δ)δ; obtain its integral coefficient with modulus 2k before reduction to Λ=Z/k. For n=2m+1 the costalk twist is m, the stalk twist is m+1, and the forget-supports map is zero. Inertia acts trivially on these cohomology groups, although variation may be nonzero: Var(σ)(δ′)=λ(σ)δ for an additive character λ:I→Λ(1). It is a scalar λ_X times the uniformizer Kummer character, so Var(σ)(a)=λ_X t_k(σ)(a,δ)δ. Determining λ_X, including its sign, is the separate odd-dimensional Picard–Lefschetz target. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/local-description-of-the-vanishing-cycle
Full target: Let S be a henselian trait (s, η, s̄, η̄ as in SGA 7 XIII 0.2.5), Λ = ℤ/k with k invertible on S, and X ⊂ 𝔸^{n+1}_S a standard quadratic degeneration: Q = Σ_{i≤j} a_ij x_i x_j + Σ b_i x_i + c, with Y smooth over S and X_s̄ a quadratic cone with vertex x₀. Assume X_η smooth and S strictly henselian. (n even) ±δ is determined by (2.2.5.3)–(2.2.5.4), which for k a power of an odd prime amounts to (δ, δ) = (−1)^m·2; in general the unordered pair ±δ is obtained from the distinguished geometric classes of XII 3.7 by coefficient reduction with one common geometric sign. Choosing norm-normalized generators independently at each prime factor, even after a ℤ/2^a k lift, does not characterize this pair. (n = 2m + 1 odd, so x₀ is rational) Let X_{s(0)} be the henselisation of X_s at x₀, X̃_{s(0)} its blow-up at x₀, Y₀ the exceptional divisor (a smooth quadric of dimension 2m) and X*_{s(0)} = X_{s(0)} − {x₀}. The composite (2.2.6.2) H^{n−1}(Y₀, Λ(m)) ≅ H^{n−1}(X̃_{s(0)}, Λ(m)) → H^{n−1}(X*_{s(0)}, Λ(m)) → H^n_{x₀}(X_s, Λ(m)) → H^n_{x₀}(X_s, RΨ_η̄Λ(m)) identifies the last group with the primitive quotient of H^{2m}(Y₀, Λ(m)), and ±δ is the image of the natural generators of that primitive quotient.
Hypotheses: The source asserts the characterisation by (δ, δ) = (−1)^m·2 whenever 2 ∤ k; for k with two distinct odd prime factors it fails (source issue E11).
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.localDescriptionOfTheVanishingCycle [theorem]: Let S be a henselian trait (s, η, s̄, η̄ as in SGA 7 XIII 0.2.5), Λ = ℤ/k with k invertible on S, and X ⊂ 𝔸^{n+1}_S a standard quadratic degeneration: Q = Σ_{i≤j} a_ij x_i x_j + Σ b_i x_i + c, with Y smooth over S and X_s̄ a quadratic cone with vertex x₀. Assume X_η smooth and S strictly henselian. (n even) ±δ is determined by (2.2.5.3)–(2.2.5.4), which for k a power of an odd prime amounts to (δ, δ) = (−1)^m·2; in general the unordered pair ±δ is obtained from the distinguished geometric classes of XII 3.7 by coefficient reduction with one common geometric sign. Choosing norm-normalized generators independently at each prime factor, even after a ℤ/2^a k lift, does not characterize this pair. (n = 2m + 1 odd, so x₀ is rational) Let X_{s(0)} be the henselisation of X_s at x₀, X̃_{s(0)} its blow-up at x₀, Y₀ the exceptional divisor (a smooth quadric of dimension 2m) and X*_{s(0)} = X_{s(0)} − {x₀}. The composite (2.2.6.2) H^{n−1}(Y₀, Λ(m)) ≅ H^{n−1}(X̃_{s(0)}, Λ(m)) → H^{n−1}(X*_{s(0)}, Λ(m)) → H^n_{x₀}(X_s, Λ(m)) → H^n_{x₀}(X_s, RΨ_η̄Λ(m)) identifies the last group with the primitive quotient of H^{2m}(Y₀, Λ(m)), and ±δ is the image of the natural generators of that primitive quotient. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/complex-picard-lefschetz-comparison
Full target: For an algebraic ordinary quadratic degeneration over C, compare the finite-coefficient étale specialization triangle, inertia and the primitive-quadric vanishing generator with the classical Milnor-fibre triangle and positively oriented small loop. Cup products, trace and Tate orientation are part of the comparison. For n modulo 4 equal to 0,1,2,3, the Picard–Lefschetz coefficient is respectively −,−,+,+ and the vanishing self-pairing is 2,0,−2,0. The complex comparison is a verification of conventions, not the algebraic proof in positive characteristic.
Hypotheses: Algebraic finite-type complex family with a single ordinary quadratic critical point; properness for the global sequence; Finite coefficients, then adic realization; compatible loop and Tate orientations
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.complexPicardLefschetzComparison [comparison]: For an algebraic ordinary quadratic degeneration over C, compare the finite-coefficient étale specialization triangle, inertia and the primitive-quadric vanishing generator with the classical Milnor-fibre triangle and positively oriented small loop. Cup products, trace and Tate orientation are part of the comparison. For n modulo 4 equal to 0,1,2,3, the Picard–Lefschetz coefficient is respectively −,−,+,+ and the vanishing self-pairing is 2,0,−2,0. The complex comparison is a verification of conventions, not the algebraic proof in positive characteristic. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/quadratic-character-in-characteristic-two
Full target: In even fibre dimension and residue characteristic two, the ordinary quadratic vanishing stalk is still rank one, but the inertia character is the separable quadratic character of the even Clifford center of the generic quadratic model. It can be wildly ramified, so it is not replaced by the unique tame quadratic character used when p≠2. The rational local monodromy formula is x↦x+(-1)^m((ε_x(σ)−1)/2)(x,δ)δ, with δ²=(-1)^m·2; the finite even-coefficient formula is defined by lifting before dividing by two.
Hypotheses: Ordinary quadratic point; even relative dimension; smooth generic fibre; Rational ℓ-adic coefficients with ℓ≠2, or the finite-level lift convention; The character may be trivial; a nontrivial reflection is asserted only where ε_x(σ)=−1
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.wildQuadraticPicardLefschetz [theorem]: In even fibre dimension and residue characteristic two, the ordinary quadratic vanishing stalk is still rank one, but the inertia character is the separable quadratic character of the even Clifford center of the generic quadratic model. It can be wildly ramified, so it is not replaced by the unique tame quadratic character used when p≠2. The rational local monodromy formula is x↦x+(-1)^m((ε_x(σ)−1)/2)(x,δ)δ, with δ²=(-1)^m·2; the finite even-coefficient formula is defined by lifting before dividing by two. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/isolated-nonordinary-quadratic-concentration
Full target: For the isolated quadratic hypersurface singularities in residue characteristic two covered by Illusie’s 2003 Corollary 2.10, including the nonordinary singularities used by Fresán–Sabbah–Yu §5.1.3, R^iΦ Q_l is zero outside the middle degree n. This gives injective specialization H^n(X_s̄)→H^n(X_η̄) in the proper setting. No rank-one, reflection, or ordinary-quadric generator assertion is made for these nonordinary stalks.
Hypotheses: Isolated quadratic hypersurface singularity in the precise 2003 corollary’s class; ℓ≠2; The original corollary’s complete hypotheses remain source gap G-nonordinary; FSY supplies the verified application; Properness for the stated global injection
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.nonordinaryQuadraticConcentration [theorem]: For the isolated quadratic hypersurface singularities in residue characteristic two covered by Illusie’s 2003 Corollary 2.10, including the nonordinary singularities used by Fresán–Sabbah–Yu §5.1.3, R^iΦ Q_l is zero outside the middle degree n. This gives injective specialization H^n(X_s̄)→H^n(X_η̄) in the proper setting. No rank-one, reflection, or ordinary-quadric generator assertion is made for these nonordinary stalks. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.2/fsy-discriminant-example
Full target: In the odd-prime ordinary quadratic models of FSY §5.1.3 with k=2m+1, the orthogonal vanishing line has square (-1)^m·2, Tate twist −m, and the quadratic Galois character of the explicitly computed Hessian determinant. The paper identifies its field by adjoining a square root of (-1)^((1+ap)/2)·2ap. This is a worked check of the even-dimensional Picard–Lefschetz discriminant interface; the motives’ weight and Hodge conclusions remain with their owners.
Hypotheses: The FSY §5.1.3 ordinary points and odd prime p; the paper’s a,p indexing; Even fibre dimension k−1=2m
Owner inputs: SchemeAndStackFoundations:SF.0/SF.2 and approximation Part II; EtaleDualityAndPerverseSheaves:EDC.3/EDC.4; the actual LPV.0 RΨ/RΦ and Tate line
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.fsyDiscriminantExample [application]: In the odd-prime ordinary quadratic models of FSY §5.1.3 with k=2m+1, the orthogonal vanishing line has square (-1)^m·2, Tate twist −m, and the quadratic Galois character of the explicitly computed Hessian determinant. The paper identifies its field by adjoining a square root of (-1)^((1+ap)/2)·2ap. This is a worked check of the even-dimensional Picard–Lefschetz discriminant interface; the motives’ weight and Hodge conclusions remain with their owners. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.3/lefschetz-pencil
Full target: Let k be algebraically closed of characteristic p, P a projective space of dimension N ≥ 1 over k, P̌ its dual, H_t the hyperplane of t ∈ P̌, and X ⊂ P a smooth connected projective variety of dimension n + 1. For a linear subspace A ⊂ P of codimension 2 (the axis), let D ⊂ P̌ be the dual line of hyperplanes containing A, X_t = X ∩ H_t for t ∈ D, X̃ = {(x, t) ∈ X × D : x ∈ H_t} with projections π : X̃ → X and f : X̃ → D, so that f^{-1}(t) = X_t. The family (X_t)_{t∈D} is a Lefschetz pencil if: (A) A is transverse to X, so that π : X̃ → X is the blow-up of X along A ∩ X and X̃ is smooth; (B) there are a finite subset S ⊂ D and points x_s ∈ X_s (s ∈ S) such that f is smooth outside {x_s : s ∈ S}; (C) each x_s is an ordinary quadratic singular point of X_s. Then, for each s ∈ S, the local theory applies to the henselisation D_s of D at s and X̃ ×_D D_s.
Hypotheses: Transversality of A means A ∩ X is smooth of codimension 2 in X, or empty.; Ordinary quadratic singular points are those of the LPV.2 node ordinary-quadratic-point (SGA 7 XV 1.2.1).
Owner inputs: SchemeAndStackFoundations:SF.0 projective/jet/completed-local geometry and SF.4 Rees blowup; actual LPV.2 ordinary germs
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.IsLefschetzPencil [definition]: Let k be algebraically closed of characteristic p, P a projective space of dimension N ≥ 1 over k, P̌ its dual, H_t the hyperplane of t ∈ P̌, and X ⊂ P a smooth connected projective variety of dimension n + 1. For a linear subspace A ⊂ P of codimension 2 (the axis), let D ⊂ P̌ be the dual line of hyperplanes containing A, X_t = X ∩ H_t for t ∈ D, X̃ = {(x, t) ∈ X × D : x ∈ H_t} with projections π : X̃ → X and f : X̃ → D, so that f^{-1}(t) = X_t. The family (X_t)_{t∈D} is a Lefschetz pencil if: (A) A is transverse to X, so that π : X̃ → X is the blow-up of X along A ∩ X and X̃ is smooth; (B) there are a finite subset S ⊂ D and points x_s ∈ X_s (s ∈ S) such that f is smooth outside {x_s : s ∈ S}; (C) each x_s is an ordinary quadratic singular point of X_s. Then, for each s ∈ S, the local theory applies to the henselisation D_s of D at s and X̃ ×_D D_s. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.totalSpace [api:constructor]: X̃ ⊂ X × D with π and f, and f^{-1}(t) = X ∩ H_t. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.totalSpace_iso_blowup [api:characterisation]: Under (A), π : X̃ ≅ Bl_{A∩X} X and X̃ is smooth over k. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.singularSet [api:constructor]: The finite set S ⊂ D with its points x_s, and f smooth on X̃ − {x_s}. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.localModel [api:compatibility]: X̃ ×_D D_s → D_s is proper, X̃ ×_D D_s is regular of dimension n + 1, and it is smooth except at the ordinary quadratic point x_s. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.line_in_plane [test:degenerate]: X a line in P², A a point not on X: every line through A meets X transversally in one point, so S = ∅ and f : X̃ = X → D is an isomorphism. This is a Lefschetz pencil with no singular fibre. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.quadric_surface [test:computation]: X a smooth quadric surface in P³, p ≠ 2, A a general line: S has two points, each X_s is a pair of lines meeting in one point, and X̃ is X blown up in the two points of A ∩ X; χ(X̃) = 6 = 2·2 + 2·1. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.cubic_surface [test:computation]: X a smooth cubic surface in P³, p = 0, A a general line: |S| = 12, the degree 3·2² of the dual surface, each X_s a plane cubic with one node; χ(X̃) = 9 + 3 = 12 = 2·0 + 12·1. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.hermitian_curve_not_lefschetz [test:non-example]: p odd, q = p^e, X = {x^{q+1} + y^{q+1} + z^{q+1} = 0} ⊂ P²: along the tangent direction (u, v) at an affine point (a, b), with a^q u + b^q v = 0, one has F(a + tu, b + tv) = t^q(a u^q + b v^q) + t^{q+1}(u^{q+1} + v^{q+1}). So every tangent line meets X with multiplicity ≥ q ≥ 3 at its point of tangency, condition (C) fails, and no pencil of lines is Lefschetz in this embedding. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.3/dual-variety
Full target: Let k be algebraically closed of characteristic p, P a projective space of dimension N ≥ 1 over k, P̌ its dual, H_t the hyperplane of t ∈ P̌, and X ⊂ P a smooth connected projective variety of dimension n + 1. Let Y = {(x, t) ∈ X × P̌ : x ∈ H_t} with g : Y → P̌, whose fibre over t is X_t = X ∩ H_t. The dual variety X̌ ⊂ P̌ is the set of t such that H_t is tangent to X, that is, X_t is singular or X ⊂ H_t. It is closed and, when nonempty, irreducible, and g is smooth outside g^{-1}(X̌). For a Lefschetz pencil with parameter line D, S = D ∩ X̌.
Hypotheses: X smooth, connected and projective; irreducibility of X̌ comes from its description as the image of the conormal variety, a projective bundle over X.
Owner inputs: SchemeAndStackFoundations:SF.0 projective/jet/completed-local geometry and SF.4 Rees blowup; actual LPV.2 ordinary germs
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety [definition]: Let k be algebraically closed of characteristic p, P a projective space of dimension N ≥ 1 over k, P̌ its dual, H_t the hyperplane of t ∈ P̌, and X ⊂ P a smooth connected projective variety of dimension n + 1. Let Y = {(x, t) ∈ X × P̌ : x ∈ H_t} with g : Y → P̌, whose fibre over t is X_t = X ∩ H_t. The dual variety X̌ ⊂ P̌ is the set of t such that H_t is tangent to X, that is, X_t is singular or X ⊂ H_t. It is closed and, when nonempty, irreducible, and g is smooth outside g^{-1}(X̌). For a Lefschetz pencil with parameter line D, S = D ∩ X̌. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.mem_dualVariety_iff [api:characterisation]: t ∈ X̌ if and only if X ∩ H_t is singular or X ⊂ H_t. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_isIrreducible [api:characterisation]: If X is smooth, connected, projective and its dual is nonempty, the reduced dual is irreducible. For X equal to the ambient projective space the dual is empty. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.incidence_smooth_off_dual [api:characterisation]: g : Y → P̌ is smooth over P̌ − X̌. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.singularSet_eq_inter_dual [api:compatibility]: For a Lefschetz pencil, S = D ∩ X̌. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_projectiveSpace [test:degenerate]: X = P: every H_t ∩ P = H_t is smooth and P ⊄ H_t, so X̌ = ∅. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_linear [test:computation]: X a linear subspace of dimension d, 1 ≤ d < N: X ∩ H_t is always smooth, so X̌ = {t : X ⊂ H_t}, a linear subspace of codimension d + 1 ≥ 2, not a hypersurface. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_conic [test:computation]: X the conic xz = y² in P², p ≠ 2: X̌ is the conic of lines (a : b : c) with b² = 4ac. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.dualVariety_conic_char_two [test:non-example]: p = 2, X the conic xz = y²: the tangent line at (s² : st : t²) is t²x + s²z = 0, which passes through the nucleus (0 : 1 : 0). So X̌ is a line in P̌² and X → X̌ is purely inseparable of degree 2, not the dual conic. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.3/existence-of-lefschetz-pencils
Full target: Let k be algebraically closed of characteristic p, P a projective space of dimension N ≥ 1 over k, P̌ its dual, H_t the hyperplane of t ∈ P̌, and X ⊂ P a smooth connected projective variety of dimension n + 1. For r ≥ 1 let i_r : P → P^{C(N+r, N) − 1} be the Veronese embedding by the monomials of degree r, whose hyperplane sections are the degree-r hypersurfaces of P. If r ≥ 2 and X is embedded by i_r ∘ i_1, then every sufficiently general pencil of hyperplane sections is a Lefschetz pencil: the axes A for which (X_t)_{t∈D} is a Lefschetz pencil contain a nonempty open subset of the Grassmannian of codimension-2 linear subspaces. Equivalently, a sufficiently general pencil of degree-r hypersurface sections of X is Lefschetz. For r = 1 and p ≠ 0 there may be no Lefschetz pencil of hyperplane sections at all.
Hypotheses: k algebraically closed.; r ≥ 2 in the positive statement; the r = 1 failure needs p ≠ 0.
Owner inputs: SchemeAndStackFoundations:SF.0 projective/jet/completed-local geometry and SF.4 Rees blowup; actual LPV.2 ordinary germs
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.existenceOfLefschetzPencils [theorem]: Let k be algebraically closed of characteristic p, P a projective space of dimension N ≥ 1 over k, P̌ its dual, H_t the hyperplane of t ∈ P̌, and X ⊂ P a smooth connected projective variety of dimension n + 1. For r ≥ 1 let i_r : P → P^{C(N+r, N) − 1} be the Veronese embedding by the monomials of degree r, whose hyperplane sections are the degree-r hypersurfaces of P. If r ≥ 2 and X is embedded by i_r ∘ i_1, then every sufficiently general pencil of hyperplane sections is a Lefschetz pencil: the axes A for which (X_t)_{t∈D} is a Lefschetz pencil contain a nonempty open subset of the Grassmannian of codimension-2 linear subspaces. Equivalently, a sufficiently general pencil of degree-r hypersurface sections of X is Lefschetz. For r = 1 and p ≠ 0 there may be no Lefschetz pencil of hyperplane sections at all. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.3/ordinary-axis-open-and-jet-separation
Full target: For a smooth projective connected X of positive dimension, after a Veronese embedding of degree r≥2 the hyperplanes whose section has exactly one ordinary quadratic singularity form a dense open in the relevant dual locus, and the locus of bad hyperplanes has codimension at least two in the dual projective space. Together with transversality of the base axis this gives a nonempty open of good pencil axes. Degree two requires the separate two-point jet estimate: the common mixed coefficient can reduce the number of independent conditions by one when the joining line lies in both tangent spaces; the linear-X case is treated by an explicit quadratic pencil.
Hypotheses: Smooth connected projective X; dim X≥1; algebraically closed base; r≥2; The good-axis conditions concern ordinary singularities, not separability of the Gauss map in all characteristics
Owner inputs: SchemeAndStackFoundations:SF.0 projective/jet/completed-local geometry and SF.4 Rees blowup; actual LPV.2 ordinary germs
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.ordinaryAxisOpen [theorem]: For a smooth projective connected X of positive dimension, after a Veronese embedding of degree r≥2 the hyperplanes whose section has exactly one ordinary quadratic singularity form a dense open in the relevant dual locus, and the locus of bad hyperplanes has codimension at least two in the dual projective space. Together with transversality of the base axis this gives a nonempty open of good pencil axes. Degree two requires the separate two-point jet estimate: the common mixed coefficient can reduce the number of independent conditions by one when the joining line lies in both tangent spaces; the linear-X case is treated by an explicit quadratic pencil. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.3/incidence-pencil-blowup
Full target: Let X⊂P be smooth projective and A a codimension-two axis meeting X transversely. The incidence family X̃={(x,H):x∈X∩H, H⊃A} over the dual line D is canonically Bl_(A∩X)X, with the actual hyperplane fibres. The center is smooth of codimension two when nonempty, X̃ is smooth, and f:X̃→D is projective. For a curve the general axis misses X, the center is empty and the blowup is X.
Hypotheses: Smooth projective X; transverse axis; dim X≥1; Empty center allowed in dimension one
Owner inputs: SchemeAndStackFoundations:SF.0 projective/jet/completed-local geometry and SF.4 Rees blowup; actual LPV.2 ordinary germs
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.incidencePencilBlowup [theorem]: Let X⊂P be smooth projective and A a codimension-two axis meeting X transversely. The incidence family X̃={(x,H):x∈X∩H, H⊃A} over the dual line D is canonically Bl_(A∩X)X, with the actual hyperplane fibres. The center is smooth of codimension two when nonempty, X̃ is smooth, and f:X̃→D is projective. For a curve the general axis misses X, the center is empty and the blowup is X. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.3/finite-field-pencil-descent
Full target: A nonempty good-axis open defined over F_q has a point over some finite extension F_(q^r). The resulting axis, finite singular set and ordinary local models descend at finite presentation to that finite extension. After this base extension arithmetic Frobenius is Frob_q^r on the original cohomology, and the pencil can be supplied to the DWP.4 dimension induction. The open need not have an F_q-rational point.
Hypotheses: Smooth projective variety over F_q; Veronese degree≥2; geometrically nonempty good-axis open; Finite-presentation descent; ℓ≠p
Owner inputs: SchemeAndStackFoundations:SF.0 projective/jet/completed-local geometry and SF.4 Rees blowup; actual LPV.2 ordinary germs
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.finiteFieldPencilDescent [theorem]: A nonempty good-axis open defined over F_q has a point over some finite extension F_(q^r). The resulting axis, finite singular set and ordinary local models descend at finite presentation to that finite extension. After this base extension arithmetic Frobenius is Frob_q^r on the original cohomology, and the pencil can be supplied to the DWP.4 dimension induction. The open need not have an F_q-rational point. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.3/inseparable-gauss-and-low-dimension
Full target: In characteristic two and even fibre dimension n, the ordinary hyperplane locus can have an inseparable Gauss map; a Lefschetz axis is not required to meet the reduced dual transversely as if that map were étale. For a linear X the dual has codimension at least two and a general pencil can have no singular fibres; for X=P the dual is empty. A curve has an empty general base axis. Connected-fibre cohomology arguments are applied only in dimensions where the weak Lefschetz connectedness hypotheses hold, with n=0 handled by finite fibres.
Hypotheses: The all-characteristic ordinary-pencil definition of XVII 2.2; Separate n=0, empty-dual and dual-defective cases
Owner inputs: SchemeAndStackFoundations:SF.0 projective/jet/completed-local geometry and SF.4 Rees blowup; actual LPV.2 ordinary germs
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.inseparableGaussPencilCases [comparison]: In characteristic two and even fibre dimension n, the ordinary hyperplane locus can have an inseparable Gauss map; a Lefschetz axis is not required to meet the reduced dual transversely as if that map were étale. For a linear X the dual has codimension at least two and a general pencil can have no singular fibres; for X=P the dual is empty. A curve has an empty general base axis. Connected-fibre cohomology arguments are applied only in dimensions where the weak Lefschetz connectedness hypotheses hold, with n=0 handled by finite fibres. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.4/cohomology-sheaves-of-a-lefschetz-pencil
Full target: Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. R^n f_*ℚ_ℓ is lisse on U and tamely ramified at each s ∈ S. (a) If the vanishing cycles are nonzero: R^i f_*ℚ_ℓ is constant on D for i ≠ n, and R^n f_*ℚ_ℓ = j_*j^*R^n f_*ℚ_ℓ. (b) If they are zero (possible only for n = 2m + 1 odd): R^i f_*ℚ_ℓ is constant for i ≠ n + 1, there is an exact sequence 0 → ⊕_{s∈S} ℚ_ℓ(m − n)_s → R^{n+1} f_*ℚ_ℓ → ℱ → 0 with ℱ constant, and E = 0. If one vanishing cycle is zero, all are.
Hypotheses: The vanishing cycle δ_s is the one of the local theory at s, transported to X_u; being zero does not depend on the transport.
Owner inputs: SchemeAndStackFoundations:SF.2 actual cohomology/Leray maps; EDC.4 weak Lefschetz and blowup maps; actual LPV.2/LPV.3 geometric data
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.cohomologySheavesOfALefschetzPencil [theorem]: Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. R^n f_*ℚ_ℓ is lisse on U and tamely ramified at each s ∈ S. (a) If the vanishing cycles are nonzero: R^i f_*ℚ_ℓ is constant on D for i ≠ n, and R^n f_*ℚ_ℓ = j_*j^*R^n f_*ℚ_ℓ. (b) If they are zero (possible only for n = 2m + 1 odd): R^i f_*ℚ_ℓ is constant for i ≠ n + 1, there is an exact sequence 0 → ⊕_{s∈S} ℚ_ℓ(m − n)_s → R^{n+1} f_*ℚ_ℓ → ℱ → 0 with ℱ constant, and E = 0. If one vanishing cycle is zero, all are. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-subspace
Full target: Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. For s ∈ S, an étale path from u to a geometric generic point of D_s transports the local vanishing cycle to δ_s ∈ H^n(X_u, ℚ_ℓ)(m), well defined up to sign once the path is fixed; changing the path changes δ_s by an element of π₁(U, u). Identify ℚ_ℓ(m) with ℚ_ℓ by a generator of ℤ_ℓ(1) (k is algebraically closed). The vanishing subspace E ⊂ H^n(X_u, ℚ_ℓ) is the span of all transports gδ_s (g ∈ π₁(U, u), s ∈ S). It does not depend on the paths and is π₁(U, u)-stable. For suitable paths (tame generators), E is already spanned by the δ_s, s ∈ S (monodromy-generation theorem).
Hypotheses: Only E is independent of the paths, not the individual oriented vectors δ_s.
Owner inputs: SchemeAndStackFoundations:SF.2 actual cohomology/Leray maps; EDC.4 weak Lefschetz and blowup maps; actual LPV.2/LPV.3 geometric data
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingCycle [construction]: Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. For s ∈ S, an étale path from u to a geometric generic point of D_s transports the local vanishing cycle to δ_s ∈ H^n(X_u, ℚ_ℓ)(m), well defined up to sign once the path is fixed; changing the path changes δ_s by an element of π₁(U, u). Identify ℚ_ℓ(m) with ℚ_ℓ by a generator of ℤ_ℓ(1) (k is algebraically closed). The vanishing subspace E ⊂ H^n(X_u, ℚ_ℓ) is the span of all transports gδ_s (g ∈ π₁(U, u), s ∈ S). It does not depend on the paths and is π₁(U, u)-stable. For suitable paths (tame generators), E is already spanned by the δ_s, s ∈ S (monodromy-generation theorem). The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingCycle_changePath [api:compatibility]: vanishingCycle s (g · γ) = ± g • vanishingCycle s γ for g ∈ π₁(U, u). The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace [api:constructor]: E : Submodule ℚ_ℓ (H^n(X_u, ℚ_ℓ)), the span of all vanishing cycles for all paths. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_stable [api:characterisation]: g • E = E for every g ∈ π₁(U, u). The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.localMonodromy_vanishingCycle [api:characterisation]: σ in the inertia at s acts on H^n(X_u) by x ↦ x + (−1)^{m+1} t_ℓ(σ)(x, δ_s)δ_s (n odd), and by the reflection in δ_s when ε(σ) = −1 (n even). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_eq_bot_of_no_singular_fibre [test:degenerate]: If S = ∅ (a line in P²) then E = 0. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_quadric_surface [test:computation]: Quadric-surface pencil: |S| = 2 but each δ_s lies in H^1 of a conic, which is 0, so E = 0 (case (b)). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingSubspace_conic [test:computation]: n = 0, X a smooth conic in P², p ≠ 2, A a general point: X_u is two points, |S| = 2 (the tangents from A), δ_s = ±(e₁ − e₂) for both s, E = ℚ_ℓ(e₁ − e₂) and E^⊥ = ℚ_ℓ(e₁ + e₂). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingCycle_depends_on_path [test:non-example]: For the concrete rational shear action ρ(g)(x,y)=(x+gy,y), δ=(0,1) and g=1, transport gives (1,1), which is neither δ nor −δ. The geometric local generator/path identification remains part of the source-specific construction. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.

LefschetzPencilsAndVanishingCycles:LPV.4/vanishing-quotient-and-its-pairing
Full target: Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. With ( , ) = Tr(x ∪ y) the cup-product pairing H^n(X_u) ⊗ H^n(X_u) → ℚ_ℓ(−n), the subspace E ∩ E^⊥ is the kernel of the restriction of ( , ) to E, so ( , ) induces a nondegenerate form ψ : E/(E ∩ E^⊥) ⊗ E/(E ∩ E^⊥) → ℚ_ℓ(−n), alternating for n odd and symmetric for n even. Monodromy respects ψ; for n odd it gives ρ : π₁(U, u) → Sp(E/(E ∩ E^⊥), ψ).
Hypotheses: The pairing on H^n(X_u) is perfect by Poincaré duality, but its restriction to E can be degenerate: E ∩ E^⊥ may be nonzero, and irreducibility and open image concern the quotient, not E.
Owner inputs: SchemeAndStackFoundations:SF.2 actual cohomology/Leray maps; EDC.4 weak Lefschetz and blowup maps; actual LPV.2/LPV.3 geometric data
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient [construction]: Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. With ( , ) = Tr(x ∪ y) the cup-product pairing H^n(X_u) ⊗ H^n(X_u) → ℚ_ℓ(−n), the subspace E ∩ E^⊥ is the kernel of the restriction of ( , ) to E, so ( , ) induces a nondegenerate form ψ : E/(E ∩ E^⊥) ⊗ E/(E ∩ E^⊥) → ℚ_ℓ(−n), alternating for n odd and symmetric for n even. Monodromy respects ψ; for n odd it gives ρ : π₁(U, u) → Sp(E/(E ∩ E^⊥), ψ). The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm [api:constructor]: ψ, the form induced by Tr(x ∪ y), with values in ℚ_ℓ(−n). The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm_nondegenerate [api:characterisation]: ψ is nondegenerate. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm_isAlt [api:characterisation]: ψ is alternating for n odd (LinearMap.BilinForm.IsAlt) and symmetric for n even. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.monodromyRep [api:constructor]: ρ : π₁(U, u) →* Sp(vanishingQuotient, ψ) for n odd, continuous. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm_mk [api:compatibility]: The pairing on classes represented by x,y is B(x,y); in the geometric form retain Q_l(−n). The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_zero [test:degenerate]: In the concrete rational four-dimensional symplectic model, E=0 has quotient dimension zero. Identifying this model with a quadric-surface pencil is a separate geometric test. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_radical [test:computation]: Over Q with basis e₀,e₁,e₂,e₃ and B(e₀,e₁)=B(e₂,e₃)=1, E=span(e₀,e₁,e₂) has radical Qe₂ and quotient dimension two; span(e₀,e₂) has quotient dimension zero. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingQuotient_conic [test:computation]: For the rational dot-product form on Q² and E=Q(1,−1), the radical is zero, the quotient has dimension one and the generator has square two. The geometric degree-zero conic comparison retains the Tate/coefficient conventions. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.vanishingForm_on_E_degenerate [test:non-example]: The actual restriction of the standard symplectic form to span(e₀,e₁,e₂) is degenerate, whereas its descended quotient form is nondegenerate. The file contains the algebraic/field/degree-zero specialization under this name; the full geometric, coefficient or derived form is omitted.

LefschetzPencilsAndVanishingCycles:LPV.4/pencil-restriction-and-gysin
Full target: For the transverse-axis pencil with center Z=A∩X and incidence blowup π:X̃→X, the imported codimension-two blowup formula identifies H^i(X̃)=H^i(X)⊕H^(i−2)(Z)(−1) by π* plus exceptional Gysin. The inverse has the exceptional minus sign. For a smooth pencil fibre Y, restriction sends (a,b) to m*a+h*b, while fibre Gysin sends y to (m*y,−h*y), where m:Y→X and h:Z→Y. These formulas identify the lower-dimensional contributions used in DWP.4.
Hypotheses: Smooth projective X and transverse smooth codimension-two center; Q_l coefficients; The empty-center curve case has no exceptional summand
Owner inputs: SchemeAndStackFoundations:SF.2 actual cohomology/Leray maps; EDC.4 weak Lefschetz and blowup maps; actual LPV.2/LPV.3 geometric data
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.pencilRestrictionGysin [theorem]: For the transverse-axis pencil with center Z=A∩X and incidence blowup π:X̃→X, the imported codimension-two blowup formula identifies H^i(X̃)=H^i(X)⊕H^(i−2)(Z)(−1) by π* plus exceptional Gysin. The inverse has the exceptional minus sign. For a smooth pencil fibre Y, restriction sends (a,b) to m*a+h*b, while fibre Gysin sends y to (m*y,−h*y), where m:Y→X and h:Z→Y. These formulas identify the lower-dimensional contributions used in DWP.4. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.4/pencil-leray-and-middle-reduction
Full target: Let f:X̃→D=P¹ be the proper incidence pencil, U=D−S its smooth locus, j:U→D, and n=2m+1 the fibre dimension in the odd tame branch of Weil I §7.1. Put V=(Rⁿf_*Q_l)|_U, E its actual vanishing local subsystem, R=E∩E⊥ and A=Rⁿf_*Q_l=j_*V. The Leray filtration on H^(n+1)(X̃) has graded terms E∞^(2,n−1), E∞^(1,n), E∞^(0,n+1), each the actual subquotient of its E₂ term. The only possible differentials on a curve are d₂^(0,b):H⁰(D,R^bf_*)→H²(D,R^(b−1)f_*); retain the incoming and outgoing ones on the two corner terms. E∞^(1,n)=H¹(D,A). If δ is nonradical, exact sequences 0→j_*E→A→C→0 and 0→j_*R→j_*E→j_*(E/R)→0 have C and j_*R constant. Hence H¹(j_*E)→H¹(A) is surjective, and H¹(j_*E)→H¹(j_*(E/R)) is injective. If δ is radical and E⊂E⊥, define F=coker(j_*E⊥→A). Then 0→constant j_*E⊥→A→F→0 and 0→F→constant j_*j*F→⊕_s i_(s*)L_s→0 yield H¹(A)↪H¹(F) and ⊕_s H⁰(L_s)↠H¹(F). L_s is the actual evaluation/vanishing line Q_l(m−n) with its orientation character, after finite-field descent making the critical points and characters rational. This corrects the opposite printed twist in (7.1.5), recorded as E24, independently confirmed for its Tate-label defect. If E=0, A is constant and H¹(A)=0; the upper-corner skyscraper contribution in degree n+1 remains.
Hypotheses: Actual proper Lefschetz pencil over P¹ and rational ℓ-adic coefficients; n=2m+1 for these §7.1 branches.; Conjugacy of the local generators makes the nonradical, totally isotropic and zero cases uniform. E⊥ is the global fixed subsystem in this geometric situation, so its direct image is constant.; Cohomology and all quotient/connecting/edge maps come from these sheaf sequences and the actual Rf* Leray sequence.; For arithmetic twists pass to a finite residue-field extension rationalizing critical points and orientation characters. No hard Lefschetz, E₂ degeneration or split filtration is used.
Owner inputs: SchemeAndStackFoundations:SF.2 actual cohomology/Leray maps; EDC.4 weak Lefschetz and blowup maps; actual LPV.2/LPV.3 geometric data
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.pencilMiddleReduction [theorem]: Let f:X̃→D=P¹ be the proper incidence pencil, U=D−S its smooth locus, j:U→D, and n=2m+1 the fibre dimension in the odd tame branch of Weil I §7.1. Put V=(Rⁿf_*Q_l)|_U, E its actual vanishing local subsystem, R=E∩E⊥ and A=Rⁿf_*Q_l=j_*V. The Leray filtration on H^(n+1)(X̃) has graded terms E∞^(2,n−1), E∞^(1,n), E∞^(0,n+1), each the actual subquotient of its E₂ term. The only possible differentials on a curve are d₂^(0,b):H⁰(D,R^bf_*)→H²(D,R^(b−1)f_*); retain the incoming and outgoing ones on the two corner terms. E∞^(1,n)=H¹(D,A). If δ is nonradical, exact sequences 0→j_*E→A→C→0 and 0→j_*R→j_*E→j_*(E/R)→0 have C and j_*R constant. Hence H¹(j_*E)→H¹(A) is surjective, and H¹(j_*E)→H¹(j_*(E/R)) is injective. If δ is radical and E⊂E⊥, define F=coker(j_*E⊥→A). Then 0→constant j_*E⊥→A→F→0 and 0→F→constant j_*j*F→⊕_s i_(s*)L_s→0 yield H¹(A)↪H¹(F) and ⊕_s H⁰(L_s)↠H¹(F). L_s is the actual evaluation/vanishing line Q_l(m−n) with its orientation character, after finite-field descent making the critical points and characters rational. This corrects the opposite printed twist in (7.1.5), recorded as E24, independently confirmed for its Tate-label defect. If E=0, A is constant and H¹(A)=0; the upper-corner skyscraper contribution in degree n+1 remains. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.4/global-fixed-and-local-fixed-interface
Full target: The common fixed space of the nontrivial local transvections/reflections is E⊥ by the elementary linear-algebra lemma. It equals the full π₁(U,u)-invariant space only after the algebraic monodromy-generation theorem of LPV.5 is applied. E is the span of all transported local cycles, and E∩E⊥ is the radical of its restricted pairing. These identities do not require hard Lefschetz or nondegeneracy of E itself.
Hypotheses: Tame pencil branch; Q_l coefficients; all transported cycles included; For local zero cycles the corresponding operator is identity
Owner inputs: SchemeAndStackFoundations:SF.2 actual cohomology/Leray maps; EDC.4 weak Lefschetz and blowup maps; actual LPV.2/LPV.3 geometric data
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.localGlobalFixedComparison [comparison]: The common fixed space of the nontrivial local transvections/reflections is E⊥ by the elementary linear-algebra lemma. It equals the full π₁(U,u)-invariant space only after the algebraic monodromy-generation theorem of LPV.5 is applied. E is the span of all transported local cycles, and E∩E⊥ is the radical of its restricted pairing. These identities do not require hard Lefschetz or nondegeneracy of E itself. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.4/hypersurface-outside-middle
Full target: For a smooth projective hypersurface Y of dimension n over an algebraically closed field, rational ℓ-adic cohomology outside degree n agrees with the projective-space even Tate classes in degrees 0,2,…,2n and vanishes in the other odd degrees, with the dual generators above the middle degree. In a sufficiently ample pencil of hypersurface sections this identifies the constant direct-image pieces and isolates the middle vanishing quotient used by the odd-dimensional Weil-I induction.
Hypotheses: Smooth hypersurface; ℓ invertible; rational coefficients; Weak Lefschetz below n and Poincaré duality above n; the middle cohomology is not asserted to be Tate
Owner inputs: SchemeAndStackFoundations:SF.2 actual cohomology/Leray maps; EDC.4 weak Lefschetz and blowup maps; actual LPV.2/LPV.3 geometric data
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.hypersurfaceOutsideMiddle [application]: For a smooth projective hypersurface Y of dimension n over an algebraically closed field, rational ℓ-adic cohomology outside degree n agrees with the projective-space even Tate classes in degrees 0,2,…,2n and vanishes in the other odd degrees, with the dual generators above the middle degree. In a sufficiently ample pencil of hypersurface sections this identifies the constant direct-image pieces and isolates the middle vanishing quotient used by the odd-dimensional Weil-I induction. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.5/bertini-surjectivity-on-fundamental-groups
Full target: For a connected smooth projective variety and the incidence family over the complement of its nonempty irreducible dual divisor, a sufficiently general line satisfying the source’s transversality conditions has the same monodromy image as the base on the given finite-dimensional Q_l local system. The proof uses irreducibility of the pullback along a general line for each relevant finite cover, specialization and a finite congruence/Frattini control of the fixed representation. It does not claim that one universal open works simultaneously for every finite cover or every representation.
Hypotheses: The dual is a nonempty divisor; its smooth ordinary locus and the chosen generic line meet the source’s transversality conditions; A fixed finite-dimensional continuous Q_l representation with compact image; tame branch for the specialization argument; Linear/empty-dual cases are treated separately
Owner inputs: Actual LPV pencil cohomology representation; current OrthogonalSpinGroups Layers 0/2, ClassicalGroups Part II and LieGroups Part II; FA.5, CharacterTheory and IntegralLattices for rationality
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.bertiniSurjectivityOnFundamentalGroups [theorem]: For a connected smooth projective variety and the incidence family over the complement of its nonempty irreducible dual divisor, a sufficiently general line satisfying the source’s transversality conditions has the same monodromy image as the base on the given finite-dimensional Q_l local system. The proof uses irreducibility of the pullback along a general line for each relevant finite cover, specialization and a finite congruence/Frattini control of the fixed representation. It does not claim that one universal open works simultaneously for every finite cover or every representation. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.5/vanishing-cycles-are-conjugate
Full target: Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. The vanishing cycles ±δ_s (s ∈ S), taken up to sign, are conjugate under π₁(U, u): for s, s′ ∈ S there is g ∈ π₁(U, u) with gδ_s = ±δ_{s′}.
Hypotheses: The pencil is sufficiently general for the surjectivity onto π₁(P̌ − X̌).
Owner inputs: Actual LPV pencil cohomology representation; current OrthogonalSpinGroups Layers 0/2, ClassicalGroups Part II and LieGroups Part II; FA.5, CharacterTheory and IntegralLattices for rationality
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.vanishingCyclesAreConjugate [theorem]: Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. The vanishing cycles ±δ_s (s ∈ S), taken up to sign, are conjugate under π₁(U, u): for s, s′ ∈ S there is g ∈ π₁(U, u) with gδ_s = ±δ_{s′}. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.5/monodromy-generated-by-local-transvections
Full target: Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. For a suitable choice of paths, the image of π₁(U, u) in GL(H^n(X_u, ℚ_ℓ)) is topologically generated by the local monodromies T_s (s ∈ S), with T_s x = x ± (x, δ_s)δ_s for a generator of the inertia at s. Consequently E = span(δ_s : s ∈ S), E^⊥ = H^n(X_u, ℚ_ℓ)^{π₁(U, u)}, and the image of π₁(U, u) in GL(E/(E ∩ E^⊥)) is topologically generated by the maps induced by the T_s.
Hypotheses: The sign ± is the one fixed by the Picard–Lefschetz formula; for n odd the generator of the inertia is one with t_ℓ(γ_s) a chosen generator of ℤ_ℓ(1).
Owner inputs: Actual LPV pencil cohomology representation; current OrthogonalSpinGroups Layers 0/2, ClassicalGroups Part II and LieGroups Part II; FA.5, CharacterTheory and IntegralLattices for rationality
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.monodromyGeneratedByLocalTransvections [theorem]: Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. For a suitable choice of paths, the image of π₁(U, u) in GL(H^n(X_u, ℚ_ℓ)) is topologically generated by the local monodromies T_s (s ∈ S), with T_s x = x ± (x, δ_s)δ_s for a generator of the inertia at s. Consequently E = span(δ_s : s ∈ S), E^⊥ = H^n(X_u, ℚ_ℓ)^{π₁(U, u)}, and the image of π₁(U, u) in GL(E/(E ∩ E^⊥)) is topologically generated by the maps induced by the T_s. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.5/absolute-irreducibility-of-the-vanishing-quotient
Full target: For the tame Lefschetz pencil branch (odd fibre dimension, or residue characteristic different from 2), the nonzero representation V=E/(E∩E⊥) of π₁(U,u) is absolutely irreducible. If V=0 the representation is zero and is handled as a separate branch, not called irreducible.
Hypotheses: V≠0 for the irreducibility assertion; Coefficient field Q_l, with scalar extension to any finite extension or algebraic closure; local operators and conjugacy persist; The pencil is in the tame branch
Owner inputs: Actual LPV pencil cohomology representation; current OrthogonalSpinGroups Layers 0/2, ClassicalGroups Part II and LieGroups Part II; FA.5, CharacterTheory and IntegralLattices for rationality
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.absoluteIrreducibilityOfTheVanishingQuotient [theorem]: For the tame Lefschetz pencil branch (odd fibre dimension, or residue characteristic different from 2), the nonzero representation V=E/(E∩E⊥) of π₁(U,u) is absolutely irreducible. If V=0 the representation is zero and is handled as a separate branch, not called irreducible. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.5/lie-algebra-of-a-compact-l-adic-subgroup
Full target: Let V be a finite-dimensional ℚ_ℓ-vector space with a nondegenerate alternating form ψ and H ⊂ Sp(V, ψ)(ℚ_ℓ) a compact subgroup. Let 𝔏 = {X ∈ gl(V) : exp(tX) ∈ H for all t in some neighbourhood of 0 in ℚ_ℓ}. Then 𝔏 is a ℚ_ℓ-Lie subalgebra of sp(V, ψ); if h ∈ H is unipotent, h = exp(N) with N nilpotent, then N ∈ 𝔏; and if 𝔏 = sp(V, ψ) then H is open in Sp(V, ψ)(ℚ_ℓ).
Hypotheses: H closed (compact) is essential: the group generated by the local monodromies is dense in the image of π₁, and only its closure is compact.; ℓ prime; canonical module topology on V, End(V) and the subgroup topology induced by (g,g⁻¹).; The Sp carrier and its ℓ-adic analytic structure use the classical-group extension; closed-subgroup analytic charts come from LieGroups, Part II.
Owner inputs: Actual LPV pencil cohomology representation; current OrthogonalSpinGroups Layers 0/2, ClassicalGroups Part II and LieGroups Part II; FA.5, CharacterTheory and IntegralLattices for rationality
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.lieAlgebraOfACompactLAdicSubgroup [lemma]: Let V be a finite-dimensional ℚ_ℓ-vector space with a nondegenerate alternating form ψ and H ⊂ Sp(V, ψ)(ℚ_ℓ) a compact subgroup. Let 𝔏 = {X ∈ gl(V) : exp(tX) ∈ H for all t in some neighbourhood of 0 in ℚ_ℓ}. Then 𝔏 is a ℚ_ℓ-Lie subalgebra of sp(V, ψ); if h ∈ H is unipotent, h = exp(N) with N nilpotent, then N ∈ 𝔏; and if 𝔏 = sp(V, ψ) then H is open in Sp(V, ψ)(ℚ_ℓ). The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.5/kazhdan-margulis-open-image
Full target: Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. Let n be odd. The image of ρ : π₁(U, u) → Sp(E/(E ∩ E^⊥), ψ)(ℚ_ℓ) is open. The statement is for the fixed ℚ_ℓ-model; openness in Sp(V ⊗ E′)(E′) for a larger coefficient field E′ is not asserted.
Hypotheses: n odd, so ψ is alternating.; V = E/(E ∩ E^⊥) = 0 is allowed: Sp(0) is trivial and the image is open.
Owner inputs: Actual LPV pencil cohomology representation; current OrthogonalSpinGroups Layers 0/2, ClassicalGroups Part II and LieGroups Part II; FA.5, CharacterTheory and IntegralLattices for rationality
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.kazhdanMargulisOpenImage [theorem]: Let (X_t)_{t∈D} be a Lefschetz pencil of hyperplane sections of X as in the Lefschetz-pencil node, excluding the case p = 2 with n even. Put U = D − S, j : U → D, fix u ∈ U and a prime ℓ ≠ p. Let n be odd. The image of ρ : π₁(U, u) → Sp(E/(E ∩ E^⊥), ψ)(ℚ_ℓ) is open. The statement is for the fixed ℚ_ℓ-model; openness in Sp(V ⊗ E′)(E′) for a larger coefficient field E′ is not asserted. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.5/characteristic-two-transverse-monodromy
Full target: In the characteristic-two even-fibre-dimensional branch of Weil II 4.2, retain the actual, possibly wild, quadratic inertia characters. A transverse pencil with axis in the generic open of 4.2.7 has its ordinary local vanishing cycles in one monodromy orbit up to sign, after transport within that pencil. Their full transported span is stable under that pencil’s monodromy. Independence of this span across different pencils is not asserted: 4.2.5 discusses that stronger comparison as requiring a multidimensional vanishing-cycle theory. This branch supplies conjugacy for generic axes; it does not supply tame generation for every characteristic-two pencil.
Hypotheses: Characteristic two, even fibre dimension; the transverse/generic-axis hypotheses of Weil II 4.2.3–8; Rational ℓ-adic coefficients ℓ≠2
Owner inputs: Actual LPV pencil cohomology representation; current OrthogonalSpinGroups Layers 0/2, ClassicalGroups Part II and LieGroups Part II; FA.5, CharacterTheory and IntegralLattices for rationality
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.charTwoTransverseMonodromy [theorem]: In the characteristic-two even-fibre-dimensional branch of Weil II 4.2, retain the actual, possibly wild, quadratic inertia characters. A transverse pencil with axis in the generic open of 4.2.7 has its ordinary local vanishing cycles in one monodromy orbit up to sign, after transport within that pencil. Their full transported span is stable under that pencil’s monodromy. Independence of this span across different pencils is not asserted: 4.2.5 discusses that stronger comparison as requiring a multidimensional vanishing-cycle theory. This branch supplies conjugacy for generic axes; it does not supply tame generation for every characteristic-two pencil. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.5/conditional-orthogonal-open-or-finite
Full target: For a pencil in the even-dimensional branch of Weil II 4.4, assume its vanishing space E has already been proved nondegenerate over the fixed Q_l field and the source’s conjugacy and generation hypotheses hold. Its compact geometric monodromy image in O(E) is open or finite. The nondegeneracy of E is an explicit input; in the source it is obtained from hard Lefschetz, so this branch is not used to prove the DWP hard Lefschetz theorem. The odd-dimensional open-Sp theorem instead uses the radical quotient V.
Hypotheses: Even fibre dimension; nondegenerate E; source 4.4.1 hypotheses; Compact geometric image over the fixed Q_l coefficient field; zero space handled separately
Owner inputs: Actual LPV pencil cohomology representation; current OrthogonalSpinGroups Layers 0/2, ClassicalGroups Part II and LieGroups Part II; FA.5, CharacterTheory and IntegralLattices for rationality
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.orthogonalOpenOrFinite [theorem]: For a pencil in the even-dimensional branch of Weil II 4.4, assume its vanishing space E has already been proved nondegenerate over the fixed Q_l field and the source’s conjugacy and generation hypotheses hold. Its compact geometric monodromy image in O(E) is open or finite. The nondegeneracy of E is an explicit input; in the source it is obtained from hard Lefschetz, so this branch is not used to prove the DWP hard Lefschetz theorem. The odd-dimensional open-Sp theorem instead uses the radical quotient V. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.5/finite-orthogonal-ade
Full target: Let a nonzero even-dimensional geometric vanishing space E be nondegenerate and have finite orthogonal monodromy, with conjugate local reflections as in the preceding pencil theorem. Weil II 4.4.5–9 proves that the finite reflection representation has a rational integral vanishing lattice L: after changing the form by (−1)^(n/2), each vanishing root has square two and their pairings are integral. The form on L⊗R is positive definite, L is generated by these roots, and the root system is irreducible simply laced. Thus it has type A,D or E, and monodromy is its Weyl group. Rationality is proved by the explicit trace and cross-ℓ comparison below, not assumed from finite Q_l image or imported from the downstream weight induction.
Hypotheses: A genuine geometric even-dimensional pencil with E nonzero and nondegenerate; finite monodromy, conjugate vanishing cycles and local reflection formulas.; Compatible ℓ-adic cohomology of the same family for all invertible primes; finite-cover Chebotarev, trace formula for all Frobenius powers and the finite-character descent interface.; The source-specific nondegeneracy assumption remains conditional; hard Lefschetz is not imported into the earlier geometric open-Sp theorem.
Owner inputs: Actual LPV pencil cohomology representation; current OrthogonalSpinGroups Layers 0/2, ClassicalGroups Part II and LieGroups Part II; FA.5, CharacterTheory and IntegralLattices for rationality
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.finiteOrthogonalADE [theorem]: Let a nonzero even-dimensional geometric vanishing space E be nondegenerate and have finite orthogonal monodromy, with conjugate local reflections as in the preceding pencil theorem. Weil II 4.4.5–9 proves that the finite reflection representation has a rational integral vanishing lattice L: after changing the form by (−1)^(n/2), each vanishing root has square two and their pairings are integral. The form on L⊗R is positive definite, L is generated by these roots, and the root system is irreducible simply laced. Thus it has type A,D or E, and monodromy is its Weyl group. Rationality is proved by the explicit trace and cross-ℓ comparison below, not assumed from finite Q_l image or imported from the downstream weight induction. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.5/integral-failure-and-arithmetic-routing
Full target: Weil II 4.3.10 identifies the integral intersection of vanishing cycles with fixed classes as the kernel of the polarization map; integral torsion prevents copying rational splittings without further hypotheses. The application in 4.5.1–4.5.2 concerns common polynomial divisors of the Frobenius characteristic polynomials of smooth fibres, together with their compatibility under finite-field extension. Its bounded common-divisor contribution uses the finite orthogonal monodromy branch and the source’s geometric and cohomological hypotheses. It is a downstream DWP/trace/character application, not a divisor-degree gcd statement or an input to the geometric local-monodromy proof.
Hypotheses: Integral Z_l cohomology for the failure example; rational coefficients for the monodromy consequence; The 4.5 gcd application retains its source’s geometric and rationality hypotheses
Owner inputs: Actual LPV pencil cohomology representation; current OrthogonalSpinGroups Layers 0/2, ClassicalGroups Part II and LieGroups Part II; FA.5, CharacterTheory and IntegralLattices for rationality
MISSING_FORM TauCeti.AlgebraicGeometry.LefschetzPencil.integralVanishingFailure [application]: Weil II 4.3.10 identifies the integral intersection of vanishing cycles with fixed classes as the kernel of the polarization map; integral torsion prevents copying rational splittings without further hypotheses. The application in 4.5.1–4.5.2 concerns common polynomial divisors of the Frobenius characteristic polynomials of smooth fibres, together with their compatibility under finite-field extension. Its bounded common-divisor contribution uses the finite orthogonal monodromy branch and the source’s geometric and cohomological hypotheses. It is a downstream DWP/trace/character application, not a divisor-degree gcd statement or an input to the geometric local-monodromy proof. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.6/nearby-perverse-exactness
Full target: For a finite-type scheme over a henselian trait with ℓ invertible, geometric nearby cycles preserve the middle perverse heart on geometric fibres, for rational ℓ-adic coefficients and for the finite coefficient convention Λ=Z/ℓ^ν of the supplier. The induced functor on those hearts is exact. Fibrewise RΨ adds no shift. For a perverse complex on the total trait space with rectified dimension function, its generic restriction is shifted by −1 before applying this fibrewise functor: this is the total-space RΨ[−1] convention. No weight or decomposition theorem is used; integral p and p+ conventions remain separate.
Hypotheses: Finite type over a henselian trait; ℓ invertible; early middle/rectified perverse structures and affine Artin vanishing imported from EDC.5/SF.2; Finite coefficients Λ=Z/ℓ^ν (ν≥1), or rational ℓ-adic coefficients under the derived realization convention; integral p and p+ are not identified
Owner inputs: EDC.5 rectified-trait/integral/enlarged perverse structures and qualified costalk colimits; E1/E4; H1 exact comparison; independent IG.4 geometry prefix
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.nearbyPerverseExact [theorem]: For a finite-type scheme over a henselian trait with ℓ invertible, geometric nearby cycles preserve the middle perverse heart on geometric fibres, for rational ℓ-adic coefficients and for the finite coefficient convention Λ=Z/ℓ^ν of the supplier. The induced functor on those hearts is exact. Fibrewise RΨ adds no shift. For a perverse complex on the total trait space with rectified dimension function, its generic restriction is shifted by −1 before applying this fibrewise functor: this is the total-space RΨ[−1] convention. No weight or decomposition theorem is used; integral p and p+ conventions remain separate. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.6/vanishing-perverse-exactness
Full target: For a perverse complex K on the total trait space with rectified perversity, RΦK[−1] is perverse on the special fibre. Its can/var maps match the shifted nearby triangle. This is different from asserting that arbitrary i*K or i*K[−1] is perverse: the restriction has the two adjacent perverse degrees appearing in the gluing argument.
Hypotheses: Finite type; ℓ invertible; early EDC.5 rectified perversity; finite Λ=Z/ℓ^ν or rational coefficients with the supplier’s convention
Owner inputs: EDC.5 rectified-trait/integral/enlarged perverse structures and qualified costalk colimits; E1/E4; H1 exact comparison; independent IG.4 geometry prefix
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.vanishingPerverseExact [theorem]: For a perverse complex K on the total trait space with rectified perversity, RΦK[−1] is perverse on the special fibre. Its can/var maps match the shifted nearby triangle. This is different from asserting that arbitrary i*K or i*K[−1] is perverse: the restriction has the two adjacent perverse degrees appearing in the gluing argument. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.6/nearby-verdier-duality
Full target: For separated finite-type X over the trait and K∈D_ctf(X_η,Λ) with finite coefficients of invertible order, Gabber’s map RΨ(D_ηK)→D_s(RΨK) is a natural inertia-equivariant isomorphism. Use the supplier’s dualizing complexes and Tate twists. Illusie 4.4 gives the bounded constructible adic and rational variant. Shifted vanishing-cycle duality retains its can/var and specialization-pairing conventions; integral p and p+ perversities are kept distinct. Dropping finite Tor dimension for a general finite coefficient ring is not part of this theorem.
Hypotheses: Separated finite-type X over a henselian trait; finite coefficients invertible on the trait; K bounded constructible with finite Tor dimension (D_ctf), as in Illusie 4.2; For derived adic or rational coefficients use the bounded constructible realization of 4.4 with uniform finite-level amplitude; dualizing objects and normalizations supplied by EDC.1–2
Owner inputs: EDC.5 rectified-trait/integral/enlarged perverse structures and qualified costalk colimits; E1/E4; H1 exact comparison; independent IG.4 geometry prefix
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.nearbyVerdierDuality [theorem]: For separated finite-type X over the trait and K∈D_ctf(X_η,Λ) with finite coefficients of invertible order, Gabber’s map RΨ(D_ηK)→D_s(RΨK) is a natural inertia-equivariant isomorphism. Use the supplier’s dualizing complexes and Tate twists. Illusie 4.4 gives the bounded constructible adic and rational variant. Shifted vanishing-cycle duality retains its can/var and specialization-pairing conventions; integral p and p+ perversities are kept distinct. Dropping finite Tor dimension for a general finite coefficient ring is not part of this theorem. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.6/intermediate-extension-exchange
Full target: Let j_η and j_s be compatible open immersions in a trait family. Suppose nearby cycles are t-exact for the specified perverse structures and both exchange maps RΨ j_η!≅j_s! RΨ and RΨ Rj_η*≅Rj_s* RΨ are isomorphisms on the complexes in question, including the coherence of the !→* map. Then RΨ(j_η!*P)≅j_s!*(RΨP), by exact preservation of the image in the perverse heart. These exchange hypotheses must be verified for the chosen pair, for example a constant product family with a fixed smooth boundary; they are not a universal assertion for moving boundaries.
Hypotheses: The displayed ! and * exchange isomorphisms and their common map coherence; Perverse t-exactness; constructible perverse P; specified coefficient convention
Owner inputs: EDC.5 rectified-trait/integral/enlarged perverse structures and qualified costalk colimits; E1/E4; H1 exact comparison; independent IG.4 geometry prefix
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.nearbyIntermediateExtension [theorem]: Let j_η and j_s be compatible open immersions in a trait family. Suppose nearby cycles are t-exact for the specified perverse structures and both exchange maps RΨ j_η!≅j_s! RΨ and RΨ Rj_η*≅Rj_s* RΨ are isomorphisms on the complexes in question, including the coherence of the !→* map. Then RΨ(j_η!*P)≅j_s!*(RΨP), by exact preservation of the image in the perverse heart. These exchange hypotheses must be verified for the chosen pair, for example a constant product family with a fixed smooth boundary; they are not a universal assertion for moving boundaries. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.6/perverse-coefficients-and-comparison
Full target: The finite-level nearby-cycle functor, its derived adic realization and its rational form are compared in the early perverse framework. Integral duality exchanges the supplier’s p and p+ conventions where torsion requires it. The scheme/adic and scheme/complex comparison maps are used only for their stated finite-type admissible domains and must preserve dimension shifts, specialization and inertia. No perverse diamond or arbitrary analytic comparison is manufactured inside LPV.
Hypotheses: Finite-type and coefficient hypotheses of the supplier comparisons; Derived adic limits with uniform amplitude; p/p+ conventions explicit
Owner inputs: EDC.5 rectified-trait/integral/enlarged perverse structures and qualified costalk colimits; E1/E4; H1 exact comparison; independent IG.4 geometry prefix
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.perverseCoefficientComparison [comparison]: The finite-level nearby-cycle functor, its derived adic realization and its rational form are compared in the early perverse framework. Integral duality exchanges the supplier’s p and p+ conventions where torsion requires it. The scheme/adic and scheme/complex comparison maps are used only for their stated finite-type admissible domains and must preserve dimension shifts, specialization and inertia. No perverse diamond or arbitrary analytic comparison is manufactured inside LPV. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.6/filtered-colimit-support-criterion
Full target: In the enlarged derived étale category supplied by EDC.5/E1, let K=colim K_a be a filtered colimit of finite-level constructible complexes with a common perverse lower bound relative to a fixed dimension function. Assume geometric costalks commute with this colimit in the stated finite-cohomological-dimension setting; then K has the same lower bound, because cohomology commutes with filtered colimits of coefficient modules. The analogous upper-bound assertion uses stalks. The colimit need not be constructible, so the conclusion is a support/cosupport bound in the enlarged category, not membership in the constructible perverse heart.
Hypotheses: Filtered system; uniform finite-level bound; fixed dimension function; The required stalk or costalk/filtered-colimit commutation proved by the supplier under finite cohomological dimension; The enlarged category permits nonconstructible objects
Owner inputs: EDC.5 rectified-trait/integral/enlarged perverse structures and qualified costalk colimits; E1/E4; H1 exact comparison; independent IG.4 geometry prefix
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.filteredColimitSupportCriterion [theorem]: In the enlarged derived étale category supplied by EDC.5/E1, let K=colim K_a be a filtered colimit of finite-level constructible complexes with a common perverse lower bound relative to a fixed dimension function. Assume geometric costalks commute with this colimit in the stated finite-cohomological-dimension setting; then K has the same lower bound, because cohomology commutes with filtered colimits of coefficient modules. The analogous upper-bound assertion uses stalks. The colimit need not be constructible, so the conclusion is a support/cosupport bound in the enlarged category, not membership in the constructible perverse heart. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

LefschetzPencilsAndVanishingCycles:LPV.6/igusa-semiperversity-interface
Full target: For the cofinal finite-level formal models in Caraiani–Scholze §4.6, the scheme/adic nearby comparison and the preceding support criterion transport the finite-level lower perverse bound to the filtered-colimit object consumed by IgusaVarietiesAndTorsionConcentration:IG.4. The Igusa/Hodge–Tate tower geometry, affineness and vanishing of boundary terms under transition maps remain with IG.2–4. LPV exports only the nearby-cycle exactness, shift conventions, comparison and support criterion.
Hypotheses: Cofinal finite-level formal models and transition diagrams from IG.4/finite-level-formal-models, independent of the LPV.6 bound.; Boundary-killing maps from IG.4/ell-power-boundary-killing; affine finite-level residue-scheme maps, integral-pushforward continuity and uniform cohomological dimension as in CS §4.6.; Common dimension shift d and the enlarged EDC.5/E1 category; the semiperverse conclusion of IG.4 is not an input.
Owner inputs: EDC.5 rectified-trait/integral/enlarged perverse structures and qualified costalk colimits; E1/E4; H1 exact comparison; independent IG.4 geometry prefix
MISSING_FORM TauCeti.AlgebraicGeometry.VanishingCycles.igusaSemiperversityInterface [application]: For the cofinal finite-level formal models in Caraiani–Scholze §4.6, the scheme/adic nearby comparison and the preceding support criterion transport the finite-level lower perverse bound to the filtered-colimit object consumed by IgusaVarietiesAndTorsionConcentration:IG.4. The Igusa/Hodge–Tate tower geometry, affineness and vanishing of boundary terms under transition maps remain with IG.2–4. LPV exports only the nearby-cycle exactness, shift conventions, comparison and support criterion. The exact supplied geometric/derived carrier or compatibility map is unavailable at the pinned baseline. The advertised conclusion is not asserted for arbitrary replacement data.

-/
