import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Fin.VecNotation
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

/-!
# Geometric Satake fusion: representative target signatures

This file is not the roadmap and is not exhaustive. The definitive specification
is research/blueprint/readmes/GeometricSatakeAndFusion--GS3-fusion.md. The forms
below suggest names and signatures; they claim no geometric implementation.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.

Only the incidence/parity conventions have existing carriers. All definitions
below have real bodies. The geometric API and geometric unit tests remain in
the reader, with exact hypotheses, rather than assertions about arbitrary
categories. Arithmetic Weil degree and geometric degree have opposite signs.
Unnormalized fusion requires no half-Tate choice.
-/
open scoped BigOperators

namespace TauCetiRoadmap.GeometricSatakeAndFusion

universe u v w

/-! ## Layer GS3: coherent collision and factorization -/

/-- Set-level incidence condition. The geometric open sub-v-stack is a reader target. -/
def disjointLegLocus {I : Type u} {K : Type v} {X : Type w}
    (block : I → K) : Set (I → X) :=
  {x | ∀ i j, block i ≠ block j → x i ≠ x j}

/-- Membership is precisely the cross-block inequality. -/
theorem disjointLegLocus_mem {I : Type u} {K : Type v} {X : Type w}
    (block : I → K) (x : I → X) :
    x ∈ disjointLegLocus block ↔ ∀ i j, block i ≠ block j → x i ≠ x j := by
  sorry

/-- Bijection of leg sets preserves the incidence condition. -/
theorem disjointLegLocus_reindex {I J : Type u} {K : Type v} {X : Type w}
    (e : J ≃ I) (block : I → K) (x : I → X) :
    x ∈ disjointLegLocus block ↔ x ∘ e ∈ disjointLegLocus (block ∘ e) := by
  sorry

/-- The set-level pullback condition along a family of tuples. -/
theorem disjointLegLocus_baseChange {I : Type u} {K : Type v} {X S : Type w}
    (block : I → K) (f : S → I → X) :
    f ⁻¹' disjointLegLocus block =
      {s | ∀ i j, block i ≠ block j → f s i ≠ f s j} := by
  sorry

-- test_disjoint_oneBlock
example {I : Type u} {X : Type w} :
    disjointLegLocus (X := X) (fun _ : I => ()) = Set.univ := by
  sorry

-- test_disjoint_twoSingletons
example {X : Type u} (x : Fin 2 → X) :
    x ∈ disjointLegLocus (id : Fin 2 → Fin 2) ↔ x 0 ≠ x 1 := by
  sorry

-- test_disjoint_internalCollision
example {X : Type u} (x y : X) (h : x ≠ y) :
    (![x, x, y] : Fin 3 → X) ∈
      disjointLegLocus (![false, false, true] : Fin 3 → Bool) := by
  sorry

-- Cross-block collision is forbidden; an empty leg set imposes no condition.
example : (![0, 1, 0] : Fin 3 → ℕ) ∉
    disjointLegLocus (![false, false, true] : Fin 3 → Bool) := by
  change ¬ (∀ i j, (![false, false, true] : Fin 3 → Bool) i ≠
    (![false, false, true] : Fin 3 → Bool) j →
    (![0, 1, 0] : Fin 3 → ℕ) i ≠ (![0, 1, 0] : Fin 3 → ℕ) j)
  decide

example : (Fin.elim0 : Fin 0 → ℕ) ∈
    disjointLegLocus (Fin.elim0 : Fin 0 → Bool) := by
  change ∀ i j : Fin 0, _
  decide

/-- Sum of supplied dimensions, reduced modulo two. Geometric descent is a reader target. -/
def supportParity {I : Type u} [Fintype I] (dimension : I → ℤ) : ZMod 2 :=
  (∑ i, dimension i : ℤ)

/-- Even coordinate differences preserve total parity. -/
theorem supportParity_dominance {I : Type u} [Fintype I] (d e : I → ℤ)
    (difference : ∀ i, ∃ n : ℤ, d i - e i = 2 * n) :
    supportParity d = supportParity e := by
  sorry

/-- Disjoint unions add total dimension parity. -/
theorem supportParity_union {I J : Type u} [Fintype I] [Fintype J]
    (d : I → ℤ) (e : J → ℤ) :
    supportParity (Sum.elim d e) = supportParity d + supportParity e := by
  sorry

/-- Homogeneous correction scalar; mixed objects use their clopen support summands. -/
def fusionSign (e f : ZMod 2) : ℤ := if e = 1 ∧ f = 1 then -1 else 1

-- Characteristic-two coefficients need no division by two.
-- test_sign_oddOdd
example : fusionSign 1 1 = -1 := by decide

-- test_sign_evenOdd
example : fusionSign 0 1 = 1 := by decide

-- Unit and symmetry are part of the bicharacter convention.
example (e : ZMod 2) : fusionSign e 0 = 1 := by sorry
example (e f : ZMod 2) : fusionSign e f = fusionSign f e := by sorry
example (e f g : ZMod 2) :
    fusionSign (e + f) g = fusionSign e g * fusionSign f g := by sorry

-- test_parity_unit
example : supportParity (fun _ : Fin 1 => (0 : ℤ)) = 0 := by decide

-- test_parity_empty
example : supportParity (Fin.elim0 : Fin 0 → ℤ) = 0 := by decide

-- test_parity_minusculeRank: dimension one is odd, regardless of rank two.
example : supportParity (fun _ : Fin 1 => (1 : ℤ)) = 1 ∧
    supportParity (fun _ : Fin 1 => (1 : ℤ)) ≠
      supportParity (fun _ : Fin 1 => (2 : ℤ)) := by decide

-- test_parity_coroot: adding a simple-coroot pairing changes degree by two.
example : supportParity (fun _ : Fin 1 => (1 : ℤ)) =
    supportParity (fun _ : Fin 1 => (3 : ℤ)) := by decide

-- test_sign_characteristicTwo: the same integer sign reduces differently in char 2 and 3.
example : (fusionSign 1 1 : ZMod 2) = 1 ∧
    (fusionSign 1 1 : ZMod 3) ≠ 1 := by decide

/-! Finite-leg convention examples, using existing function composition.
These are tests of dα(w)_i = w_{α(i)}, not definitions of a Weil group or
continuous representation category. For α:I→J the tuple map goes J→I. -/

-- Fold: one surviving coordinate repeats on both source legs (Weil diagonal).
example (w : Fin 1 → ℤ) :
    w ∘ (fun _ : Fin 2 => (0 : Fin 1)) = ![w 0, w 0] := by sorry

-- Insertion: forget the unused target coordinate (Weil projection).
example (w : Fin 2 → ℤ) :
    w ∘ (fun _ : Fin 1 => (0 : Fin 2)) = ![w 0] := by sorry

-- Three successive maps reverse order on products.
example {I J K L : Type u} {W : Type v}
    (a : I → J) (b : J → K) (c : K → L) (w : L → W) :
    w ∘ (c ∘ b ∘ a) = ((w ∘ c) ∘ b) ∘ a := by rfl

-- Empty product: its unique tuple is unchanged by any map into it.
example {W : Type u} (w : Fin 1 → W) :
    w ∘ (Fin.elim0 : Fin 0 → Fin 1) = Fin.elim0 := by sorry

-- A relabelling followed by its inverse is identity.
example {I J : Type u} {W : Type v} (e : I ≃ J) (w : I → W) :
    (w ∘ e.symm) ∘ e = w := by sorry

-- P¹ Tate root-line convention: q⁻¹ rather than q for geometric Frobenius.
-- This tests the scalar arithmetic only, not Drinfeld transport or étale cohomology.
example : (2 : ZMod 5) * 3 = 1 ∧ (3 : ZMod 5) ≠ 2 := by decide

/-
Geometric targets omitted because their carriers do not exist at the pins:
1. disjoint-leg-locus: open sub-v-stack, geometric base change and factorization.
2. disjoint-leg-factorization-and-full-faithfulness: Satake/local-system restriction,
   positive-codimension purity and canonical perverse reconstruction.
3. support-parity: component descent from root data, clopen summands and their signs.
4. fusion-product-and-sign-rule: fusionProduct, fusionProduct_restrict, fusionTensor,
   fusionBraiding, fibreFusionIso, fusionProduct_interchange; test_fusion_unit,
   test_fusion_disjoint, test_fusion_oddSymmetry, test_fusion_mixedParity.
5. finite-set-functoriality-and-constant-terms: collisionFunctor, collisionFunctor_id,
   collisionFunctor_comp, collisionFunctor_comp_assoc, collisionFunctor_union,
   collisionFunctor_unitInsertion; test_collision_threeLegs,
   test_collision_permutation, test_collision_emptyFibre. Closed immersion is on Gr.
6. drinfeld-fibre-realization: locally constant perfect Drinfeld equivalence,
   continuous finite-projective product Weil representations, exact faithful F,
   split kernel/cokernel criterion, diagonal naturality and coefficient transport.
7. symmetric-constant-term: shifted CT, tensor/fibre/finite-map compatibility,
   nested-parabolic transitivity and additive degrees.
8. fusion-verdier-duality: symmetric sw*, contravariant symmetric D, their commutation,
   fibre comparisons and sw*D as the internal dual, including evaluation triangles.
All these remain full reader targets, not assertions for arbitrary categories.
Convolution closure and rigidity are imported from GS2 before fusion.
-/

end TauCetiRoadmap.GeometricSatakeAndFusion
