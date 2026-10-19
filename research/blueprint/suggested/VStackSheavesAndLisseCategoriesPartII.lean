import Mathlib.Algebra.Category.FGModuleCat.Basic
import Mathlib.Algebra.Category.ModuleCat.Monoidal.Symmetric
import Mathlib.CategoryTheory.Monoidal.Braided.Basic
import Mathlib.CategoryTheory.Monoidal.Rigid.Basic
import Mathlib.CategoryTheory.Monoidal.Subcategory
import Mathlib.Data.Finsupp.Defs
import Mathlib.Data.ZMod.Basic
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.LinearAlgebra.Trace
import Mathlib.NumberTheory.Padics.PadicIntegers
import Mathlib.RingTheory.DiscreteValuationRing.Basic
import Mathlib.RingTheory.Finiteness.Defs
import Mathlib.Topology.LocallyConstant.Algebra
import Mathlib.Topology.Sets.Compacts

/-!
# Artin v-stacks, solid and lisse coefficient categories, Part II: representative target signatures

This file is not the roadmap. The roadmap is the README of
`VStackSheavesAndLisseCategoriesPartII`, which is definitive; this file is not exhaustive. It records
the definitions and theorem signatures of the roadmap that can be stated against the pinned Mathlib
and Tau Ceti, so that contributors and reviewers converge on names and signatures.

Most of the roadmap lives on carriers that are not yet in the libraries: small v-stacks, decent
v-stacks and fine morphisms (Layer VS6), the exceptional functors `Rf_!`, `Rf^!` for fine maps
(Layer VS7), sheaves on classifying stacks (Layer VS8), the symmetric monoidal 2-categories of
(cohomological) correspondences (Layer VS9), the Lefschetz–Verdier trace formula and local terms
(Layer VS10), and characteristic classes on classifying and quotient stacks (Layer VS11). Those
targets are stated in the README only. What is stated here are the parts with carriers at the
pins:

* the 1-categorical shadow of the categorical trace of Layer VS9, on Mathlib's
  `CategoryTheory.ExactPairing` in a symmetric monoidal category;
* smooth modules over the ring of locally constant functions on a locally profinite set
  (Layer VS8, the algebra behind sheaves on constant locally profinite diamonds);
* the reflexivity criterion over truncated discrete valuation rings (Layer VS9).

Design choices made explicit: the trace uses Mathlib's orientation of exact pairings
(`η_ X Y : 𝟙_ C ⟶ X ⊗ Y`, `ε_ X Y : Y ⊗ X ⟶ 𝟙_ C`), so `Y` is the dual of `X`; smoothness of a
module over `C(T, Λ)` is tested with characteristic functions of compact open subsets, which are
clopen because the space is Hausdorff.
-/

namespace TauCetiRoadmap.VStackSheavesAndLisseCategoriesPartII

open CategoryTheory MonoidalCategory

/-! ## Layer VS9: categorical traces (the 1-categorical shadow) -/

section Trace

variable {C : Type*} [Category C] [MonoidalCategory C] [SymmetricCategory C]

/-- The categorical trace of an endomorphism `f` of an object `X` with dual `Y` in a symmetric
monoidal category: `𝟙 ⟶ X ⊗ Y ⟶ X ⊗ Y ⟶ Y ⊗ X ⟶ 𝟙` (Lu–Zheng, Construction 1.6). The roadmap
states it in symmetric monoidal 2-categories (Layer VS9, `categoricalTrace`), where its value is an
object of `End(𝟙)`; in a 1-category it is an endomorphism of the unit. -/
def categoricalTrace (X Y : C) [ExactPairing X Y] (f : X ⟶ X) : 𝟙_ C ⟶ 𝟙_ C :=
  η_ X Y ≫ f ▷ Y ≫ (β_ X Y).hom ≫ ε_ X Y

/-- Cyclicity of traces: `tr(v ∘ u) = tr(u ∘ v)` for dualizable `X` and `Y`. -/
theorem categoricalTrace_comp_comm {X X' Y Y' : C} [ExactPairing X X'] [ExactPairing Y Y']
    (u : X ⟶ Y) (v : Y ⟶ X) :
    categoricalTrace X X' (u ≫ v) = categoricalTrace Y Y' (v ≫ u) := by
  sorry

/-- The trace of the identity of the unit, with its canonical self-duality, is the identity. -/
theorem categoricalTrace_id_tensorUnit :
    categoricalTrace (𝟙_ C) (𝟙_ C) (𝟙 (𝟙_ C)) = 𝟙 (𝟙_ C) := by
  sorry

/-- Multiplicativity of traces: the trace of `f ⊗ g` on `X₁ ⊗ X₂`, with dual `Y₂ ⊗ Y₁`, is the
composite of the traces. -/
theorem categoricalTrace_tensor {X₁ X₂ Y₁ Y₂ : C} [ExactPairing X₁ Y₁] [ExactPairing X₂ Y₂]
    (f : X₁ ⟶ X₁) (g : X₂ ⟶ X₂) :
    categoricalTrace (X₁ ⊗ X₂) (Y₂ ⊗ Y₁) (f ⊗ₘ g) =
      categoricalTrace X₁ Y₁ f ≫ categoricalTrace X₂ Y₂ g := by
  sorry

/-- The trace does not depend on the choice of dual: two exact pairings `X Y₁`, `X Y₂` give the
same trace. -/
theorem categoricalTrace_eq_of_exactPairing {X Y₁ Y₂ : C} (p₁ : ExactPairing X Y₁)
    (p₂ : ExactPairing X Y₂) (f : X ⟶ X) :
    @categoricalTrace C _ _ _ X Y₁ p₁ f = @categoricalTrace C _ _ _ X Y₂ p₂ f := by
  sorry

end Trace

section FGModule

variable (K : Type) [Field K]

/-- In finite-dimensional vector spaces, the categorical trace of an endomorphism, read as the
scalar by which it acts on `𝟙 = K`, is the linear-algebra trace. -/
theorem categoricalTrace_fgModule (V : FGModuleCat K) (f : V ⟶ V) :
    (categoricalTrace V (FGModuleCat.FGModuleCatDual K V) f).hom.hom (1 : K) =
      LinearMap.trace K V f.hom.hom := by
  sorry

/-- Check (`categoricalTrace_id_fgModule`): the trace of the identity of a finite-dimensional
vector space is its dimension. -/
example (V : FGModuleCat K) :
    (categoricalTrace V (FGModuleCat.FGModuleCatDual K V) (𝟙 V)).hom.hom (1 : K) = (Module.finrank K V : K) := by
  sorry

end FGModule

/-! ## Layer VS8: smooth modules over locally constant functions -/

section SmoothModules

variable (T Λ : Type*) [TopologicalSpace T] [T2Space T] [CommRing Λ]

/-- A module over `C(T, Λ) = LocallyConstant T Λ` is smooth if every element is fixed by the
characteristic function `1_U` of some compact open `U ⊆ T` (Hansen–Kaletha–Weinstein, Definition
B.2.1; Layer VS8, `LocallyConstant.IsSmoothModule`). Compact opens are clopen as `T` is
Hausdorff. -/
def IsSmoothModule (M : Type*) [AddCommGroup M] [Module (LocallyConstant T Λ) M] : Prop :=
  ∀ m : M, ∃ U : TopologicalSpace.CompactOpens T,
    LocallyConstant.charFn Λ (⟨U.isCompact.isClosed, U.isOpen⟩ : IsClopen (U : Set T)) • m = m

/-- The smooth vectors of a module over `C(T, Λ)`: the elements fixed by some `1_U`. As a
submodule this is the smooth part `M^s` of Layer VS8. -/
def smoothVectors (M : Type*) [AddCommGroup M] [Module (LocallyConstant T Λ) M] : Set M :=
  {m | ∃ U : TopologicalSpace.CompactOpens T,
    LocallyConstant.charFn Λ (⟨U.isCompact.isClosed, U.isOpen⟩ : IsClopen (U : Set T)) • m = m}

/-- A module is smooth iff all its vectors are smooth. -/
theorem isSmoothModule_iff_smoothVectors_eq_univ (M : Type*) [AddCommGroup M]
    [Module (LocallyConstant T Λ) M] :
    IsSmoothModule T Λ M ↔ smoothVectors T Λ M = Set.univ := by
  sorry

/-- The smooth vectors are closed under addition: if `1_U • m = m` and `1_V • n = n` then
`1_{U ∪ V}` fixes `m + n`. -/
theorem add_mem_smoothVectors {M : Type*} [AddCommGroup M] [Module (LocallyConstant T Λ) M]
    {m n : M} (hm : m ∈ smoothVectors T Λ M) (hn : n ∈ smoothVectors T Λ M) :
    m + n ∈ smoothVectors T Λ M := by
  sorry

/-- Over a compact space every module is smooth (take `U = T`). -/
theorem isSmoothModule_of_compactSpace [CompactSpace T] (M : Type*) [AddCommGroup M]
    [Module (LocallyConstant T Λ) M] : IsSmoothModule T Λ M := by
  sorry

/-- Check (`isSmoothModule_finite`): over a finite discrete set every module is smooth. -/
example (S : Type*) [TopologicalSpace S] [DiscreteTopology S] [Finite S] (M : Type*)
    [AddCommGroup M] [Module (LocallyConstant S Λ) M] : IsSmoothModule S Λ M := by
  sorry

/-- Check (`not_isSmoothModule_regular`, non-example): the regular module `C(ℕ, ℤ) = ℤ^ℕ` is not
smooth, since the constant function `1` is not supported on a finite set. -/
example : ¬ IsSmoothModule ℕ ℤ (LocallyConstant ℕ ℤ) := by
  sorry

end SmoothModules

/-! ## Layer VS9: reflexivity over truncated discrete valuation rings -/

section Reflexivity

/-- Hansen–Kaletha–Weinstein, Lemma B.1.1: over `Λ = R/𝔪^k` for a discrete valuation ring `R`,
the canonical map `M → M**` is bijective iff `M` is finitely generated. -/
theorem bijective_dual_eval_iff_finite (R : Type*) [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] (k : ℕ) (hk : 0 < k) (M : Type*) [AddCommGroup M]
    [Module (R ⧸ IsLocalRing.maximalIdeal R ^ k) M] :
    Function.Bijective (Module.Dual.eval (R ⧸ IsLocalRing.maximalIdeal R ^ k) M) ↔
      Module.Finite (R ⧸ IsLocalRing.maximalIdeal R ^ k) M := by
  sorry

/-- Check: `ℤ/4` is reflexive over itself. -/
example : Function.Bijective (Module.Dual.eval (ZMod 4) (ZMod 4)) := by
  sorry

/-- Check (non-example): an infinite free module over `F_p` is not reflexive. -/
example (p : ℕ) [Fact p.Prime] : ¬ Function.Surjective (Module.Dual.eval (ZMod p) (ℕ →₀ ZMod p)) := by
  sorry

end Reflexivity

end TauCetiRoadmap.VStackSheavesAndLisseCategoriesPartII
