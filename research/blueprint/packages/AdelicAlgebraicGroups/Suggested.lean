import Mathlib
import TauCeti.Algebra.AlgebraicGroup.PointsFunctor
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.FunctorOfPoints
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.Determinant
import TauCeti.Algebra.AlgebraicGroup.SpecialLinear.Basic
import TauCeti.Algebra.AlgebraicGroup.AdditiveGroup.Basic
import TauCeti.Algebra.AlgebraicGroup.MultiplicativeGroup.Basic
import TauCeti.Algebra.AlgebraicGroup.CommHopfAlgCat.BaseChange
import TauCeti.Algebra.AlgebraicGroup.CommHopfAlgCat.CharacterLattice.Torsion
import TauCeti.Algebra.AlgebraicGroup.Tangent.Representation
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Points.Basic
import TauCeti.Algebra.AlgebraicGroup.HopfIdeal.Central
import TauCeti.Algebra.AlgebraicGroup.Reductive.Basic
import TauCeti.Algebra.AlgebraicGroup.Product
import TauCeti.Algebra.AlgebraicGroup.Torus.Basic
import TauCeti.Algebra.AlgebraicGroup.Unipotent.Basic
import TauCeti.NumberTheory.LocalField.NormalizedValuation
import TauCeti.RingTheory.DedekindDomain.AdicValuation.ValuativeRel
import TauCeti.Algebra.AlgebraicGroup.SimplyConnected.Basic

/-!
# Adelic algebraic groups: representative target signatures

The mathematical roadmap is `README.md`. This file records definitions and theorem signatures which
can already be stated against the pinned Mathlib and Tau Ceti APIs. It is not an exhaustive list of
the results in any layer.

The file makes its design choices explicit. Adelic points are Tau Ceti's convolution group of
`F`-algebra maps `H → 𝔸_F`, with the evaluation topology, which is the point topology of
ReductiveGroupsPartII, layer RG2.0. Four interfaces owned by other roadmaps are written out in
their defining form so that the adelic signatures elaborate, and the declarations of those
roadmaps replace them: the evaluation topology (ReductiveGroupsPartII, RG2.0), the idele norm
(Global number fields, layer 6), the Weil restriction with its point adjunction
(ReductiveGroupsPartII, RG2.0a) and the base-change comparison `E ⊗_F 𝔸_F ≃ 𝔸_E` (Global number
fields, layer 8). Measures on restricted products are built as directed suprema of level
measures, not as infinite products of probability measures. Declarations appear in dependency
order; each section heading names the README layer the block belongs to. Statements whose
carriers no pinned library provides are listed in the closing comment.
-/

namespace TauCetiRoadmap.AdelicAlgebraicGroups

set_option autoImplicit false

noncomputable section
open scoped RestrictedProduct Topology ENNReal NNReal TensorProduct Pointwise
open MeasureTheory Filter Set
open scoped Classical
set_option linter.unusedVariables false

/-! ## Layer 0: Restricted products of Haar measures -/

/-- AA.0 target *mixed space topology*: the algebraic equivalence alone asserts no continuity.
Tau Ceti (a91d3aaf) provides this as `InfiniteAdeleRing.homeomorphMixedSpace`; it is restated
here because the pinned f790474 lacks it. -/
theorem NumberField.InfiniteAdeleRing.continuous_ringEquiv_mixedSpace
    (F : Type) [Field F] [NumberField F] :
    Continuous (NumberField.InfiniteAdeleRing.ringEquiv_mixedSpace F) ∧
      Continuous (NumberField.InfiniteAdeleRing.ringEquiv_mixedSpace F).symm := by
  sorry

namespace RestrictedProduct
open _root_.RestrictedProduct

variable {ι : Type*} {G : ι → Type*} [∀ i, Group (G i)] [∀ i, TopologicalSpace (G i)]
  [∀ i, IsTopologicalGroup (G i)] [hcount : Countable ι]
  [hT2 : ∀ i, T2Space (G i)] [hLC : ∀ i, LocallyCompactSpace (G i)]
  [hsecond : ∀ i, SecondCountableTopology (G i)] {B : ∀ i, Subgroup (G i)}
  [hBopen : Fact (∀ i, IsOpen (B i : Set (G i)))]

/-- AA.0 target *second countable*: countably many second countable factors give a second countable
restricted product. -/
theorem secondCountable :
    SecondCountableTopology (Πʳ i, [G i, B i]) := by
  sorry

/-- AA.0 target *borel structure*: the Borel σ-algebra on a restricted product. -/
instance instMeasurableSpace : MeasurableSpace (Πʳ i, [G i, B i]) := borel _

instance borelSpace : BorelSpace (Πʳ i, [G i, B i]) := ⟨rfl⟩

theorem measurable_eval (i : ι) [MeasurableSpace (G i)] [BorelSpace (G i)] :
    Measurable (fun x : Πʳ i, [G i, B i] => x i) := by
  sorry

/-- The box with factors `C i`, equal to `B i` for all but finitely many `i`. -/
def box (C : ∀ i, Set (G i)) : Set (Πʳ i, [G i, B i]) := {x | ∀ i, x i ∈ C i}

theorem measurableSet_box [∀ i, MeasurableSpace (G i)] [∀ i, BorelSpace (G i)]
    (C : ∀ i, Set (G i)) (hC : ∀ i, MeasurableSet (C i))
    (hcof : ∀ᶠ i in cofinite, C i = B i) : MeasurableSet (box (B := B) C) := by
  sorry

theorem measurable_inclusion {S : Set ι} (hS : cofinite ≤ 𝓟 S) :
    @Measurable _ _ (borel _) _ (inclusion G (fun i => (B i : Set (G i))) hS) := by
  sorry

theorem borel_eq_generateFrom_boxes :
    (inferInstance : MeasurableSpace (Πʳ i, [G i, B i])) =
      MeasurableSpace.generateFrom
        {s | ∃ C : ∀ i, Set (G i), (∀ i, IsOpen (C i)) ∧ (∀ᶠ i in cofinite, C i = B i) ∧
          s = box (B := B) C} := by
  sorry

-- Test RestrictedProduct.measurableSet_structureMap_range
example : MeasurableSet {x : Πʳ i, [G i, B i] | ∀ i, x i ∈ B i} := by
  sorry

-- Test RestrictedProduct.borel_finite_index
example [Finite ι] [∀ i, MeasurableSpace (G i)] [∀ i, BorelSpace (G i)]
    :
    borel (Πʳ i, [G i, B i]) = MeasurableSpace.comap
      (fun x : Πʳ i, [G i, B i] => (⇑x : ∀ i, G i))
      (inferInstance : MeasurableSpace (∀ i, G i)) := by
  sorry

-- Test RestrictedProduct.measurableSet_singleton_not_box
/-- For `ι = ℕ`, `G i = ZMod 4`, `B i = 2(ZMod 4)`: the singleton `{1}` is not a box with
cofinitely trivial factors, yet it is measurable (a decreasing intersection of boxes). -/
example [Infinite ι] [∀ i, MeasurableSpace (G i)] [∀ i, BorelSpace (G i)]
    (hne : ∀ i, (B i : Set (G i)) ≠ {1}) :
    MeasurableSet ({1} : Set (Πʳ i, [G i, B i])) ∧
      ¬ ∃ C : ∀ i, Set (G i), (∀ᶠ i in cofinite, C i = B i) ∧ box (B := B) C = {1} := by
  sorry

/-- The open subgroup `U_S = ∏_{i ∈ S} G i × ∏_{i ∉ S} B i` of the restricted product. -/
def levelSubgroup (S : Set ι) : Subgroup (Πʳ i, [G i, B i]) where
  carrier := {x | ∀ i ∉ S, x i ∈ B i}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

theorem isOpen_levelSubgroup (S : Set ι) (hS : S.Finite) :
    IsOpen ((levelSubgroup (B := B) S : Subgroup _) : Set (Πʳ i, [G i, B i])) := by
  sorry

variable [∀ i, MeasurableSpace (G i)] [∀ i, BorelSpace (G i)]
  [hcB : Fact (∀ᶠ i in cofinite, IsCompact (B i : Set (G i)))]
include hcount hT2 hLC hsecond hcB

/-- AA.0 target *level measure*: the product measure `μ_S` on the level subgroup `U_S`, built from
`Measure.pi` over the finite set `S` and `Measure.infinitePi` of the probability measures
`μ i` restricted to `B i` off `S`. Its product formulas are stated for sigma-finite local
measures (in particular, Haar measures in the stated second countable setting). -/
def levelMeasure (μ : ∀ i, Measure (G i)) (S : Finset ι)
    (hμ : ∀ i ∉ S, μ i (B i) = 1) : Measure (levelSubgroup (B := B) (S : Set ι)) := sorry

theorem levelMeasure_box (μ : ∀ i, Measure (G i)) [∀ i, SigmaFinite (μ i)] (S : Finset ι) (hμ : ∀ i ∉ S, μ i (B i) = 1)
    (C : ∀ i, Set (G i)) (hC : ∀ i ∉ S, C i = B i)
    (hCm : ∀ i, MeasurableSet (C i)) :
    levelMeasure μ S hμ {x | ∀ i, (x : Πʳ i, [G i, B i]) i ∈ C i} = ∏ i ∈ S, μ i (C i) := by
  sorry

theorem levelMeasure_isHaar (μ : ∀ i, Measure (G i)) [∀ i, (μ i).IsHaarMeasure]
    (S : Finset ι) (hμ : ∀ i ∉ S, μ i (B i) = 1) :
    (levelMeasure μ S hμ).IsHaarMeasure := by
  sorry

theorem levelMeasure_univ_compact (μ : ∀ i, Measure (G i)) (hcpt : ∀ i, IsCompact (B i : Set (G i)))
    (hμ : ∀ i, μ i (B i) = 1) :
    IsProbabilityMeasure (levelMeasure μ ∅ (fun i _ => hμ i)) := by
  sorry

-- Test RestrictedProduct.levelMeasure_empty_prob
example (μ : ∀ i, Measure (G i)) (hcpt : ∀ i, IsCompact (B i : Set (G i)))
    (hμ : ∀ i, μ i (B i) = 1) : levelMeasure μ ∅ (fun i _ => hμ i) univ = 1 := by
  sorry

-- Test RestrictedProduct.levelMeasure_two_factor
example {G₂ : Fin 2 → Type*} [∀ i, Group (G₂ i)] [∀ i, TopologicalSpace (G₂ i)]
    [∀ i, IsTopologicalGroup (G₂ i)] [∀ i, T2Space (G₂ i)]
    [∀ i, LocallyCompactSpace (G₂ i)] [∀ i, SecondCountableTopology (G₂ i)] {B₂ : ∀ i, Subgroup (G₂ i)}
    [Fact (∀ i, IsOpen (B₂ i : Set (G₂ i)))]
    [Fact (∀ᶠ i in cofinite, IsCompact (B₂ i : Set (G₂ i)))] [∀ i, MeasurableSpace (G₂ i)] [∀ i, BorelSpace (G₂ i)]
    (μ : ∀ i, Measure (G₂ i)) [∀ i, SigmaFinite (μ i)] :
    Measure.map (fun x : levelSubgroup (B := B₂) ((Finset.univ : Finset (Fin 2)) : Set (Fin 2)) =>
        (⇑(x : Πʳ i, [G₂ i, B₂ i]) : ∀ i, G₂ i))
      (levelMeasure μ Finset.univ (fun i h => absurd (Finset.mem_univ i) h)) =
      Measure.pi μ := by
  sorry

-- Test RestrictedProduct.levelMeasure_unnormalized_factor
/-- The factors indexed by `S` are not normalized: with `S = {i₀}` the mass of `{x | x i₀ ∈ C}` is
`μ i₀ C` whatever `μ i₀ (B i₀)` is (counting measure on `ZMod 4`, `C = {0}`: value `1`, not `1/2`). -/
example (μ : ∀ i, Measure (G i)) [∀ i, SigmaFinite (μ i)] (i₀ : ι)
    (hμ : ∀ i ∉ ({i₀} : Finset ι), μ i (B i) = 1) (C : Set (G i₀)) (hC : MeasurableSet C) :
    levelMeasure μ {i₀} hμ {x | (x : Πʳ i, [G i, B i]) i₀ ∈ C} = μ i₀ C := by
  sorry

/-- AA.0 target *restricted haar product*: the restricted product of Haar measures. -/
def haarProduct (μ : ∀ i, Measure (G i)) (hμ : ∀ᶠ i in cofinite, μ i (B i) = 1) :
    Measure (Πʳ i, [G i, B i]) := sorry

variable (μ : ∀ i, Measure (G i)) [∀ i, SigmaFinite (μ i)]
  (hμ : ∀ᶠ i in cofinite, μ i (B i) = 1)

theorem haarProduct_restrict_level (S : Finset ι) (hS : ∀ i ∉ S, μ i (B i) = 1) :
    (haarProduct μ hμ).restrict (levelSubgroup (B := B) (S : Set ι)) =
      Measure.map Subtype.val (levelMeasure μ S hS) := by
  sorry

theorem haarProduct_eq_of_restrict (ν : Measure (Πʳ i, [G i, B i]))
    (hν : ∀ (S : Finset ι) (hS : ∀ i ∉ S, μ i (B i) = 1),
      ν.restrict (levelSubgroup (B := B) (S : Set ι)) = Measure.map Subtype.val (levelMeasure μ S hS)) :
    ν = haarProduct μ hμ := by
  sorry

theorem haarProduct_box (C : ∀ i, Set (G i)) (hC : ∀ i, MeasurableSet (C i))
    (hcof : ∀ᶠ i in cofinite, C i = B i) :
    haarProduct μ hμ (box (B := B) C) = ∏ᶠ i, μ i (C i) := by
  sorry

theorem haarProduct_isHaarMeasure [∀ i, (μ i).IsHaarMeasure]
    (hcpt : ∀ᶠ i in cofinite, IsCompact (B i : Set (G i))) :
    (haarProduct μ hμ).IsHaarMeasure := by
  sorry

theorem haarProduct_smul (c : ι → ℝ≥0∞) (hc : ∀ᶠ i in cofinite, c i = 1) (hpos : ∀ i, c i ≠ 0 ∧ c i ≠ ∞)
    (hcμ : ∀ᶠ i in cofinite, (c i • μ i) (B i) = 1) :
    haarProduct (fun i => c i • μ i) hcμ = (∏ᶠ i, c i) • haarProduct μ hμ := by
  sorry

-- Test RestrictedProduct.haarProduct_compact_open_box
example (h1 : ∀ i, μ i (B i) = 1) :
    haarProduct μ hμ {x : Πʳ i, [G i, B i] | ∀ i, x i ∈ B i} = 1 := by
  sorry

-- Test RestrictedProduct.haarProduct_finite_index
example [Fintype ι] :
    Measure.map (fun x : Πʳ i, [G i, B i] => (⇑x : ∀ i, G i)) (haarProduct μ hμ) = Measure.pi μ := by
  sorry

-- Test RestrictedProduct.haarProduct_not_probability_product
/-- The restricted product of Haar measures of noncompact groups is not a product of probability
measures: it gives infinite mass to the whole group. -/
example [Infinite ι] [∀ i, (μ i).IsHaarMeasure]
    (hnc : ∃ i, μ i univ = ∞) : haarProduct μ hμ univ = ∞ := by
  sorry

/-- AA.0 target *restricted haar restrict level* and AA.0 target *restricted haar box* are the two lemmas above;
AA.0 target *restricted haar is haar* is `haarProduct_isHaarMeasure`. -/
theorem haarProduct_isMulRightInvariant [∀ i, (μ i).IsMulRightInvariant] :
    (haarProduct μ hμ).IsMulRightInvariant := by
  sorry

theorem haarProduct_rescale (c : ι → ℝ≥0∞) (hc : ∀ᶠ i in cofinite, c i = 1) (hpos : ∀ i, c i ≠ 0 ∧ c i ≠ ∞)
    (hcμ : ∀ᶠ i in cofinite, (c i • μ i) (B i) = 1) :
    haarProduct (fun i => c i • μ i) hcμ = (∏ᶠ i, c i) • haarProduct μ hμ := by
  sorry

end RestrictedProduct

namespace RestrictedProduct
open _root_.RestrictedProduct

variable {ι : Type*} {G : ι → Type*} [∀ i, Group (G i)] [∀ i, TopologicalSpace (G i)]
  [∀ i, IsTopologicalGroup (G i)] [hcount : Countable ι]
  [hT2 : ∀ i, T2Space (G i)] [hLC : ∀ i, LocallyCompactSpace (G i)]
  [hsecond : ∀ i, SecondCountableTopology (G i)]

/-- AA.0 target *restricted haar change subgroups*: changing the restricting subgroups at finitely many
indices does not change the restricted product. -/
def changeSubgroups (B B' : ∀ i, Subgroup (G i))
    [Fact (∀ i, IsOpen (B i : Set (G i)))] [Fact (∀ i, IsOpen (B' i : Set (G i)))] (h : ∀ᶠ i in cofinite, B i = B' i) :
    (Πʳ i, [G i, B i]) ≃ₜ* (Πʳ i, [G i, B' i]) := sorry

theorem changeSubgroups_apply (B B' : ∀ i, Subgroup (G i))
    [Fact (∀ i, IsOpen (B i : Set (G i)))] [Fact (∀ i, IsOpen (B' i : Set (G i)))] (h : ∀ᶠ i in cofinite, B i = B' i)
    (x : Πʳ i, [G i, B i]) (i : ι) : changeSubgroups B B' h x i = x i := by
  sorry

/-- AA.0 target *restricted haar change subgroups*, measure clause: the identification carries the
restricted Haar product for `B` to the one for `B'`. -/
theorem map_changeSubgroups_haarProduct [∀ i, MeasurableSpace (G i)] [∀ i, BorelSpace (G i)]
    (B B' : ∀ i, Subgroup (G i))
    [Fact (∀ i, IsOpen (B i : Set (G i)))] [Fact (∀ i, IsOpen (B' i : Set (G i)))]
    [Fact (∀ᶠ i in cofinite, IsCompact (B i : Set (G i)))]
    [Fact (∀ᶠ i in cofinite, IsCompact (B' i : Set (G i)))]
    (h : ∀ᶠ i in cofinite, B i = B' i) (μ : ∀ i, Measure (G i))
    (hμ : ∀ᶠ i in cofinite, μ i (B i) = 1) (hμ' : ∀ᶠ i in cofinite, μ i (B' i) = 1) :
    Measure.map (changeSubgroups B B' h) (haarProduct (B := B) μ hμ) =
      haarProduct (B := B') μ hμ' := by
  sorry

variable {B : ∀ i, Subgroup (G i)} [hBopen : Fact (∀ i, IsOpen (B i : Set (G i)))]

/-- AA.0 target *split finite factors*: splitting off finitely many factors. Tau Ceti
(a91d3aaf) provides this as `awayDecomposition`; it is restated here because the pinned f790474
lacks it and the Fubini statements below consume it. -/
def splitFinite (S : Finset ι) :
    (Πʳ i, [G i, B i]) ≃ₜ* ((∀ i : S, G i) × Πʳ (i : {i // i ∉ S}), [G i, B i]) := sorry

theorem splitFinite_apply_fst (S : Finset ι) (x : Πʳ i, [G i, B i]) (i : S) :
    (splitFinite S x).1 i = x i := by
  sorry

theorem splitFinite_apply_snd (S : Finset ι) (x : Πʳ i, [G i, B i]) (i : {i // i ∉ S}) :
    (splitFinite S x).2 i = x i := by
  sorry

theorem splitFinite_symm_apply [DecidableEq ι] (S : Finset ι)
    (y : (∀ i : S, G i) × Πʳ (i : {i // i ∉ S}), [G i, B i]) (i : ι) :
    (splitFinite S).symm y i = if h : i ∈ S then (y.1 ⟨i, h⟩ : G i) else (y.2 ⟨i, h⟩ : G i) := by
  sorry

theorem splitFinite_mono (S S' : Finset ι) (h : S ⊆ S') (x : Πʳ i, [G i, B i]) :
    (∀ i : S, (splitFinite S' x).1 ⟨i, h i.2⟩ = (splitFinite S x).1 i) ∧
      ∀ i : {i // i ∉ S'}, (splitFinite S' x).2 i =
        (splitFinite S x).2 ⟨i, fun hi => i.2 (h hi)⟩ := by
  sorry

-- Test RestrictedProduct.splitFinite_empty
example [∀ i, MeasurableSpace (G i)] [∀ i, BorelSpace (G i)]
    [Fact (∀ᶠ i in cofinite, IsCompact (B i : Set (G i)))]
    (μ : ∀ i, Measure (G i)) [∀ i, SigmaFinite (μ i)]
    (hμ : ∀ᶠ i in cofinite, μ i (B i) = 1)
    (hμ' : ∀ᶠ i : {i // i ∉ (∅ : Finset ι)} in cofinite, μ i (B i) = 1) :
    Measure.map (splitFinite (B := B) ∅) (haarProduct μ hμ) =
      (Measure.pi (fun i : (∅ : Finset ι) => μ i)).prod
        (haarProduct (fun i : {i // i ∉ (∅ : Finset ι)} => μ i) hμ') := by
  sorry

-- Test RestrictedProduct.splitFinite_univ_finite
example [Fintype ι] [∀ i, MeasurableSpace (G i)] [∀ i, BorelSpace (G i)]
    [Fact (∀ᶠ i in cofinite, IsCompact (B i : Set (G i)))]
    (μ : ∀ i, Measure (G i)) [∀ i, SigmaFinite (μ i)]
    (hμ : ∀ᶠ i in cofinite, μ i (B i) = 1)
    (hμ' : ∀ᶠ i : {i // i ∉ (Finset.univ : Finset ι)} in cofinite, μ i (B i) = 1) :
    Measure.map (splitFinite (B := B) Finset.univ) (haarProduct μ hμ) =
      (Measure.pi (fun i : (Finset.univ : Finset ι) => μ i)).prod
        (haarProduct (fun i : {i // i ∉ (Finset.univ : Finset ι)} => μ i) hμ') := by
  sorry

-- Test RestrictedProduct.splitFinite_not_infinite
/-- A family lying outside `B i` at infinitely many indices (such as `(1/p)_p` in `∏_p ℚ_p`
with `B p = ℤ_p`) is not an element of the restricted product. -/
example (x : ∀ i, G i) (h : Set.Infinite {i | x i ∉ B i}) : ¬ ∀ᶠ i in cofinite, x i ∈ B i := by
  sorry

variable [∀ i, MeasurableSpace (G i)] [∀ i, BorelSpace (G i)]
  [hcB : Fact (∀ᶠ i in cofinite, IsCompact (B i : Set (G i)))]
include hcount hT2 hLC hsecond hcB
variable (μ : ∀ i, Measure (G i)) [∀ i, SigmaFinite (μ i)]
  (hμ : ∀ᶠ i in cofinite, μ i (B i) = 1)

/-- AA.0 target *restricted haar split*: Fubini for restricted product measures. -/
theorem haarProduct_split (S : Finset ι)
    (hμ' : ∀ᶠ (i : {i // i ∉ S}) in cofinite, μ i (B i) = 1) :
    Measure.map (splitFinite (B := B) S) (haarProduct μ hμ) =
      (Measure.pi (fun i : S => μ i)).prod (haarProduct (fun i : {i // i ∉ S} => μ i) hμ') := by
  sorry

/-- AA.0 target *restricted haar factorizable integral*. -/
theorem integral_haarProduct_factorizable (f : ∀ i, G i → ℂ) (hf : ∀ i, Integrable (f i) (μ i))
    (hB : ∀ᶠ i in cofinite, f i = (B i : Set (G i)).indicator 1) :
    ∫ x, (∏ᶠ i, f i (x i)) ∂(haarProduct μ hμ) = ∏ᶠ i, ∫ g, f i g ∂(μ i) := by
  sorry

/-- AA.0 target *restricted unimodular*. -/
theorem modularCharacter_haarProduct
    [LocallyCompactSpace (Πʳ i, [G i, B i])] (x : Πʳ i, [G i, B i]) :
    Measure.modularCharacter x = ∏ᶠ i, Measure.modularCharacter (x i) := by
  sorry

/-- AA.0 target *restricted haar map*. -/
theorem map_haarProduct {G' : ι → Type*} [∀ i, Group (G' i)] [∀ i, TopologicalSpace (G' i)]
    [∀ i, IsTopologicalGroup (G' i)] [∀ i, T2Space (G' i)]
    [∀ i, LocallyCompactSpace (G' i)] [∀ i, SecondCountableTopology (G' i)]
    [∀ i, MeasurableSpace (G' i)] [∀ i, BorelSpace (G' i)]
    {B' : ∀ i, Subgroup (G' i)} [Fact (∀ i, IsOpen (B' i : Set (G' i)))]
    [Fact (∀ᶠ i in cofinite, IsCompact (B' i : Set (G' i)))]
    (φ : ∀ i, G i ≃ₜ* G' i) (hφ : ∀ᶠ i in cofinite, (B i).map (φ i : G i →* G' i) = B' i)
    (Φ : (Πʳ i, [G i, B i]) ≃ₜ* (Πʳ i, [G' i, B' i])) (hΦ : ∀ x i, Φ x i = φ i (x i))
    (hμ' : ∀ᶠ i in cofinite, (Measure.map (φ i) (μ i)) (B' i) = 1) :
    Measure.map Φ (haarProduct μ hμ) = haarProduct (fun i => Measure.map (φ i) (μ i)) hμ' := by
  sorry

end RestrictedProduct

/-- AA.0 target *tamagawa convergence failure*: the volumes `1 - p⁻¹` of `ℤ_p^×` for the measures
`|dx/x|_p` have divergent product, so convergence factors are needed. -/
theorem tamagawa_convergence_failure :
    Tendsto (fun N : ℕ => ∏ p ∈ Finset.filter Nat.Prime (Finset.range N), (1 - (p : ℝ)⁻¹))
      atTop (𝓝 0) := by
  sorry

namespace NumberField
open _root_.NumberField

variable (K : Type*) [Field K] [NumberField K]

instance : MeasurableSpace (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K) := borel _
instance : BorelSpace (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K) := ⟨rfl⟩
instance : MeasurableSpace (AdeleRing (𝓞 K) K) := borel _
instance : BorelSpace (AdeleRing (𝓞 K) K) := ⟨rfl⟩
instance : MeasurableSpace (IdeleGroup (𝓞 K) K) := borel _
instance : BorelSpace (IdeleGroup (𝓞 K) K) := ⟨rfl⟩
instance : MeasurableSpace (InfiniteAdeleRing K) := borel _
instance : BorelSpace (InfiniteAdeleRing K) := ⟨rfl⟩
instance : MeasurableSpace (InfiniteAdeleRing K)ˣ := borel _

/-- The archimedean component of an adele. -/
def adeleInfPart : AdeleRing (𝓞 K) K →+* InfiniteAdeleRing K := RingHom.fst _ _

/-- The compact open subring `∏_v 𝒪_v` of the finite adeles. -/
def finiteIntegers : Set (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K) :=
  {x | ∀ v, x v ∈ v.adicCompletionIntegers K}

/-- AA.0 target *finite adele haar*. -/
def finiteAdeleHaar : Measure (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K) := sorry

@[simp] theorem finiteAdeleHaar_integers : finiteAdeleHaar K (finiteIntegers K) = 1 := by
  sorry

theorem finiteAdeleHaar_isAddHaar : (finiteAdeleHaar K).IsAddHaarMeasure := by
  sorry

/-- The idele norm of a finite idele, the product of the normalized absolute values. -/
def finiteIdeleNorm (a : (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K)ˣ) : ℝ≥0∞ := sorry

theorem finiteAdeleHaar_smul (a : (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K)ˣ) :
    Measure.map (fun x => (a : IsDedekindDomain.FiniteAdeleRing (𝓞 K) K) * x) (finiteAdeleHaar K) =
      (finiteIdeleNorm K a)⁻¹ • finiteAdeleHaar K := by
  sorry

-- Test NumberField.finiteAdeleHaar_ideal
example (I : Ideal (𝓞 K)) (hI : I ≠ ⊥) :
    finiteAdeleHaar K (closure (algebraMap (𝓞 K) (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K) '' I)) =
      (Ideal.absNorm I : ℝ≥0∞)⁻¹ := by
  sorry

-- Test NumberField.finiteAdeleHaar_rat_twoZ2
example (v₂ : IsDedekindDomain.HeightOneSpectrum (𝓞 ℚ))
    (hv₂ : (Ideal.absNorm v₂.asIdeal) = 2) :
    finiteAdeleHaar ℚ {x | ∀ v, x v ∈ v.adicCompletionIntegers ℚ ∧
      (v = v₂ → Valued.v (x v) < 1)} = 1 / 2 := by
  sorry

-- Test NumberField.finiteAdeleHaar_not_finite
example : ¬ IsFiniteMeasure (finiteAdeleHaar K) := by
  sorry

/-- The archimedean measure: Lebesgue measure at real places and twice Lebesgue at complex places,
transported from the mixed space. -/
def infiniteAdeleHaar : Measure (InfiniteAdeleRing K) := sorry

/-- AA.0 target *adele haar*. -/
def adeleHaar : Measure (AdeleRing (𝓞 K) K) := sorry

theorem adeleHaar_isAddHaar : (adeleHaar K).IsAddHaarMeasure := by
  sorry

theorem adeleHaar_prod (s : Set (InfiniteAdeleRing K)) (t : Set (IsDedekindDomain.FiniteAdeleRing (𝓞 K) K))
    (hs : MeasurableSet s) (ht : MeasurableSet t) :
    adeleHaar K (s ×ˢ t) = infiniteAdeleHaar K s * finiteAdeleHaar K t := by
  sorry

open scoped Classical in
theorem adeleHaar_infinite_eq_mixed (s : Set (mixedEmbedding.mixedSpace K)) (hs : MeasurableSet s) :
    infiniteAdeleHaar K (InfiniteAdeleRing.ringEquiv_mixedSpace K ⁻¹' s) =
      (2 : ℝ≥0∞) ^ InfinitePlace.nrComplexPlaces K * volume s := by
  sorry

-- Test NumberField.adeleHaar_box_rat
example : adeleHaar ℚ (((InfiniteAdeleRing.ringEquiv_mixedSpace ℚ) ⁻¹'
    {x | ∀ w, x.1 w ∈ Ico (0 : ℝ) 1}) ×ˢ finiteIntegers ℚ) = 1 := by
  sorry

-- Test NumberField.adeleHaar_complex_factor
example (K : Type*) [Field K] [NumberField K] (h : InfinitePlace.nrRealPlaces K = 0) (h' : InfinitePlace.nrComplexPlaces K = 1) :
    adeleHaar K (((InfiniteAdeleRing.ringEquiv_mixedSpace K) ⁻¹'
      {x | ∀ w, (x.2 w).re ∈ Icc (0 : ℝ) 1 ∧ (x.2 w).im ∈ Icc (0 : ℝ) 1}) ×ˢ finiteIntegers K) = 2 := by
  sorry

-- Test NumberField.adeleHaar_covolume
open scoped Classical in
/-- The `𝓞_K` parallelotope in `K_∞` times `∏_v 𝒪_v` is a fundamental domain for `K` in `𝔸_K`;
its mass is `2^{r₂} · 2^{-r₂} |d_K|^{1/2}`. The self-dual measure (AL.0) gives it volume one. -/
example : adeleHaar K (((InfiniteAdeleRing.ringEquiv_mixedSpace K) ⁻¹'
    ZSpan.fundamentalDomain (mixedEmbedding.latticeBasis K)) ×ˢ finiteIntegers K) =
      ENNReal.ofReal (Real.sqrt |(discr K : ℝ)|) := by
  sorry

/-- The archimedean idele measure: `dx/|x|` at real places and `2 dx dy/(x² + y²)` at complex
places. -/
def infiniteIdeleHaar : Measure (InfiniteAdeleRing K)ˣ := sorry

/-- AA.0 target *idele haar*. -/
def ideleHaar : Measure (IdeleGroup (𝓞 K) K) := sorry

theorem ideleHaar_isHaar : (ideleHaar K).IsHaarMeasure := by
  sorry

theorem ideleHaar_units (C : Set (InfiniteAdeleRing K)ˣ) (hC : MeasurableSet C) :
    ideleHaar K {x | (∀ v, (x : AdeleRing (𝓞 K) K).2 v ∈ v.adicCompletionIntegers K ∧
        ((x⁻¹ : IdeleGroup (𝓞 K) K) : AdeleRing (𝓞 K) K).2 v ∈ v.adicCompletionIntegers K) ∧
      (Units.map (adeleInfPart K).toMonoidHom x) ∈ C} =
      infiniteIdeleHaar K C := by
  sorry

theorem ideleHaar_invariant_principal (a : Kˣ) :
    Measure.map (fun x : IdeleGroup (𝓞 K) K => Units.map (algebraMap K (AdeleRing (𝓞 K) K)) a * x)
      (ideleHaar K) = ideleHaar K := by
  sorry

-- Test NumberField.ideleHaar_rat_box
example : ideleHaar ℚ {x | (∀ v, (x : AdeleRing (𝓞 ℚ) ℚ).2 v ∈ v.adicCompletionIntegers ℚ ∧
    ((x⁻¹ : IdeleGroup (𝓞 ℚ) ℚ) : AdeleRing (𝓞 ℚ) ℚ).2 v ∈ v.adicCompletionIntegers ℚ) ∧
    ∀ w, ((InfiniteAdeleRing.ringEquiv_mixedSpace ℚ)
      (x : AdeleRing (𝓞 ℚ) ℚ).1).1 w ∈ Icc (1 : ℝ) (Real.exp 1)} = 1 := by
  sorry

-- Test NumberField.ideleHaar_neq_restrict_adele
example : adeleHaar K (Set.range (fun x : IdeleGroup (𝓞 K) K => (x : AdeleRing (𝓞 K) K))) = 0 := by
  sorry

-- Test NumberField.ideleHaar_form_factor
/-- At a finite place, with the additive normalization `μ_v(𝒪_v) = 1`, the units `𝒪_v^×` (where
`|x|_v = 1`, so `dx/|x|_v = dx`) have volume `1 - q_v⁻¹`. -/
example (v : IsDedekindDomain.HeightOneSpectrum (𝓞 K)) [MeasurableSpace (v.adicCompletion K)]
    (μv : Measure (v.adicCompletion K)) [μv.IsAddHaarMeasure]
    (hμv : μv (v.adicCompletionIntegers K) = 1) :
    μv {x | x ∈ v.adicCompletionIntegers K ∧ Valued.v x = 1} =
      1 - (Ideal.absNorm v.asIdeal : ℝ≥0∞)⁻¹ := by
  sorry

-- Test NumberField.ideleHaar_form_factor (global clause)
/-- For `K = ℚ` the factor at `2` is `(1 - 2⁻¹)⁻¹ |dx/x|_2`: the set `x_2 ∈ 1 + 4ℤ_2`,
`x_p ∈ ℤ_p^×` (`p` odd), `x_∞ ∈ [1, e]` has mass `2 · 4⁻¹ = 1/2` (it would be `1/4` without it). -/
example (v₂ : IsDedekindDomain.HeightOneSpectrum (𝓞 ℚ)) (hv₂ : Ideal.absNorm v₂.asIdeal = 2) :
    ideleHaar ℚ {x | (∀ v, (x : AdeleRing (𝓞 ℚ) ℚ).2 v ∈ v.adicCompletionIntegers ℚ ∧
        ((x⁻¹ : IdeleGroup (𝓞 ℚ) ℚ) : AdeleRing (𝓞 ℚ) ℚ).2 v ∈ v.adicCompletionIntegers ℚ) ∧
      Valued.v ((x : AdeleRing (𝓞 ℚ) ℚ).2 v₂ - 1) ≤ Valued.v (4 : v₂.adicCompletion ℚ) ∧
      ∀ w, ((InfiniteAdeleRing.ringEquiv_mixedSpace ℚ) (x : AdeleRing (𝓞 ℚ) ℚ).1).1 w ∈
        Icc (1 : ℝ) (Real.exp 1)} = 1 / 2 := by
  sorry

end NumberField

namespace RealSiegel
/-- AA.3 target *reduced form*: `b` is `(e, C)`-reduced in the standard basis `e` (Gram matrix `b`). -/
def IsReduced {n : ℕ} (C : ℝ) (b : Matrix (Fin n) (Fin n) ℝ) : Prop :=
  (∀ i j, |b i j| < C * b i i) ∧ (∀ i j, i < j → b i i < C * b j j) ∧ (∏ i, b i i < C * b.det)

variable {n : ℕ}

theorem IsReduced.mono {C C' : ℝ} {b : Matrix (Fin n) (Fin n) ℝ} (h : IsReduced C b) (hC : C ≤ C')
    (hb : b.PosDef) : IsReduced C' b := by
  sorry

theorem IsReduced.smul {C c : ℝ} {b : Matrix (Fin n) (Fin n) ℝ} (hc : 0 < c) :
    IsReduced C b ↔ IsReduced C (c • b) := by
  sorry

-- Test RealSiegel.IsReduced_identity
example : IsReduced 2 (1 : Matrix (Fin n) (Fin n) ℝ) := by
  sorry

-- Test RealSiegel.IsReduced_dim_one
example (C : ℝ) (hC : 1 < C) (b : Matrix (Fin 1) (Fin 1) ℝ) (hb : 0 < b 0 0) : IsReduced C b := by
  sorry

-- Test RealSiegel.IsReduced_not_ordered
example : ¬ IsReduced 2 (Matrix.diagonal ![(4 : ℝ), 1]) ∧ IsReduced 2 (Matrix.diagonal ![(1 : ℝ), 4]) := by
  sorry

/-- AA.3 target *reduced form set*: `T_{e,C}`. -/
def reducedSet (C : ℝ) : Set (Matrix (Fin n) (Fin n) ℝ) := {b | b.PosDef ∧ IsReduced C b}

theorem reducedSet_mono {C C' : ℝ} (h : C ≤ C') : reducedSet (n := n) C ⊆ reducedSet C' := by
  sorry

theorem reducedSet_smul_basis (C : ℝ) (g : GL (Fin n) ℚ) :
    {b | b.PosDef ∧ IsReduced C (((g.map (algebraMap ℚ ℝ) : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ).transpose * b *
        ((g.map (algebraMap ℚ ℝ) : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ))} =
      (fun b => (((g.map (algebraMap ℚ ℝ))⁻¹ : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ).transpose * b *
        (((g.map (algebraMap ℚ ℝ))⁻¹ : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ)) '' reducedSet C := by
  sorry

-- Test RealSiegel.reducedSet_contains_one
example : (1 : Matrix (Fin n) (Fin n) ℝ) ∈ reducedSet 2 := by
  sorry

-- Test RealSiegel.reducedSet_dim_one
example (C : ℝ) (hC : 1 < C) : reducedSet (n := 1) C = {b | b.PosDef} := by
  sorry

-- Test RealSiegel.reducedSet_not_closed_under_inverse
example : Matrix.diagonal ![(1 : ℝ), 4] ∈ reducedSet 2 ∧ Matrix.diagonal ![(1 : ℝ), 1/4] ∉ reducedSet 2 := by
  sorry

end RealSiegel
namespace LevelMaps

section groups

variable {G : Type*} [Group G] (H : Subgroup G) {K K' K'' : Subgroup G}

/-- AA.4 target *double coset level map*: the nested-level map `H\G/K' → H\G/K`. -/
def levelMap (h : K' ≤ K) : DoubleCoset.Quotient (H : Set G) K' → DoubleCoset.Quotient (H : Set G) K := sorry

theorem levelMap_mk (h : K' ≤ K) (g : G) :
    levelMap H h (DoubleCoset.mk H K' g) = DoubleCoset.mk H K g := by
  sorry

theorem levelMap_surjective (h : K' ≤ K) : Function.Surjective (levelMap H h) := by
  sorry

/-- The surjection `K/K' → fibre`, `kK' ↦ [gk]`. -/
def fibreSurj (h : K' ≤ K) (g : G) : K ⧸ K'.subgroupOf K → levelMap H h ⁻¹' {DoubleCoset.mk H K g} := sorry

theorem fibreSurj_surjective (h : K' ≤ K) (g : G) : Function.Surjective (fibreSurj H h g) := by
  sorry

theorem levelMap_comp (h : K' ≤ K) (h' : K'' ≤ K') :
    levelMap H h ∘ levelMap H h' = levelMap H (h'.trans h) := by
  sorry

-- Test LevelMaps.levelMap_refl
example (x : DoubleCoset.Quotient (H : Set G) K) : levelMap H (le_refl K) x = x := by
  sorry

-- Test LevelMaps.levelMap_trivial_H
example (h : K' ≤ K) [(K'.subgroupOf K).FiniteIndex] (g : G) :
    Nat.card (levelMap (⊥ : Subgroup G) h ⁻¹' {DoubleCoset.mk ⊥ K g}) = (K'.subgroupOf K).index := by
  sorry

-- Test LevelMaps.levelMap_fibre_not_index
example (h : K' ≤ K) (g : G) (hidx : (K'.subgroupOf K).index = 2) :
    Nat.card (levelMap (⊤ : Subgroup G) h ⁻¹' {DoubleCoset.mk ⊤ K g}) = 1 := by
  sorry

/-- AA.4 target *double coset level cardinality*. -/
theorem card_le_index_mul (h : K' ≤ K) [(K'.subgroupOf K).FiniteIndex]
    [Finite (DoubleCoset.Quotient (H : Set G) K)] :
    Nat.card (DoubleCoset.Quotient (H : Set G) K') ≤
      (K'.subgroupOf K).index * Nat.card (DoubleCoset.Quotient (H : Set G) K) := by
  sorry

/-- AA.4 target *double coset conjugate level*. -/
def conjLevelEquiv (a : G) :
    DoubleCoset.Quotient (H : Set G) (K.map (MulAut.conj a).toMonoidHom) ≃ DoubleCoset.Quotient (H : Set G) K := sorry

end groups

end LevelMaps
namespace AdelicExamples

/-- AA.5 target *upper half plane action conventions*: raw Möbius transformations on ℍ±. -/
def rawMoebius (g : GL (Fin 2) ℝ) (z : ℂ) : ℂ :=
  UpperHalfPlane.num g z / UpperHalfPlane.denom g z

theorem rawMoebius_im (g : GL (Fin 2) ℝ) (z : ℂ) :
    (rawMoebius g z).im = g.det.val * z.im / Complex.normSq (UpperHalfPlane.denom g z) := by
  sorry

theorem rawMoebius_mul (g h : GL (Fin 2) ℝ) (z : ℂ) (hz : z.im ≠ 0) :
    rawMoebius (g * h) z = rawMoebius g (rawMoebius h z) := by
  sorry

theorem folded_eq_glAction (g : GL (Fin 2) ℝ) (z : UpperHalfPlane) :
    (g • z : UpperHalfPlane) =
      (⟨if 0 < g.det.val then rawMoebius g z else star (rawMoebius g z), by sorry⟩ : UpperHalfPlane) := by
  sorry

/-- `ℍ± = ℂ ∖ ℝ`. -/
abbrev UpperLowerHalfPlane := {z : ℂ // z.im ≠ 0}

/-- The raw Möbius action of `GL₂(ℝ)` on `ℍ±`; negative determinant exchanges the half-planes. -/
instance rawMulAction : MulAction (GL (Fin 2) ℝ) UpperLowerHalfPlane where
  smul g z := ⟨rawMoebius g z, sorry⟩
  one_smul := sorry
  mul_smul := sorry

theorem coe_rawSMul (g : GL (Fin 2) ℝ) (z : UpperLowerHalfPlane) :
    ((g • z : UpperLowerHalfPlane) : ℂ) = rawMoebius g z :=
  rfl

/-- `ℝ^×SO(2)`, the invertible matrices `(a -b; b a)`. -/
def KInf : Subgroup (GL (Fin 2) ℝ) where
  carrier := {g | (g : Matrix (Fin 2) (Fin 2) ℝ) 0 0 = (g : Matrix (Fin 2) (Fin 2) ℝ) 1 1 ∧
    (g : Matrix (Fin 2) (Fin 2) ℝ) 0 1 = -(g : Matrix (Fin 2) (Fin 2) ℝ) 1 0}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- The base point `i ∈ ℍ±`. -/
def basePoint : UpperLowerHalfPlane := ⟨Complex.I, by simp⟩

/-- AA.5 target *gl2 real quotient*: the stabilizer of `i` for the raw action is `ℝ^×SO(2)`. -/
theorem stabilizer_basePoint : MulAction.stabilizer (GL (Fin 2) ℝ) basePoint = KInf := by
  sorry

/-- `g ↦ g • i` induces a homeomorphism `GL₂(ℝ)/ℝ^×SO(2) ≃ ℍ±`. -/
def realQuotientHomeomorph : (GL (Fin 2) ℝ ⧸ KInf) ≃ₜ UpperLowerHalfPlane :=
  sorry

theorem realQuotientHomeomorph_mk (g : GL (Fin 2) ℝ) :
    realQuotientHomeomorph (QuotientGroup.mk g) = g • basePoint := by
  sorry

/-- Equivariance: left multiplication on the quotient corresponds to the raw action. -/
theorem realQuotientHomeomorph_smul (g : GL (Fin 2) ℝ) (x : GL (Fin 2) ℝ ⧸ KInf) :
    realQuotientHomeomorph (g • x) = g • realQuotientHomeomorph x := by
  sorry

/-- `GL₂(ℝ)^+` acts transitively on `ℍ`. -/
theorem isPretransitive_GLPos : MulAction.IsPretransitive (Matrix.GLPos (Fin 2) ℝ) UpperHalfPlane := by
  sorry

/-- The stabilizer of `i ∈ ℍ` in `GL₂(ℝ)^+` is `ℝ^×SO(2)`. -/
theorem stabilizer_GLPos_I :
    MulAction.stabilizer (Matrix.GLPos (Fin 2) ℝ) UpperHalfPlane.I =
      KInf.subgroupOf (Matrix.GLPos (Fin 2) ℝ) := by
  sorry

/-- `diag(1, -1)`. -/
def diagOneNegOne : GL (Fin 2) ℝ :=
  Matrix.GeneralLinearGroup.mkOfDetNeZero !![1, 0; 0, -1] (by simp)

-- Test: `diag(1, -1)` sends `i` to `-i` in the raw action and fixes `i` in Mathlib's `glAction`.
example : ((diagOneNegOne • basePoint : UpperLowerHalfPlane) : ℂ) = -Complex.I ∧
    diagOneNegOne • UpperHalfPlane.I = UpperHalfPlane.I := by
  sorry

end AdelicExamples
namespace Tamagawa

/-- AA.2 target *tamagawa convergence gln*, the local count for `GL_n`: with the convergence factor
`λ = (1 - q⁻¹)⁻¹`, the normalized count of `GL_n(𝔽_q)` is `∏_{i=2}^{n} (1 - q^{-i})`. -/
theorem gl_local_volume (k : Type*) [Field k] [Fintype k] {n : ℕ} (hn : 1 ≤ n) :
    (1 - (Fintype.card k : ℝ)⁻¹)⁻¹ * Nat.card (GL (Fin n) k) / (Fintype.card k : ℝ) ^ (n ^ 2) =
      ∏ i ∈ Finset.Icc 2 n, (1 - (Fintype.card k : ℝ)⁻¹ ^ i) := by
  sorry

/-- AA.2 target *tamagawa convergence gln*, the local count for `SL_n`. -/
theorem sl_local_volume (k : Type*) [Field k] [Fintype k] [DecidableEq k] {n : ℕ} (hn : 1 ≤ n) :
    (Nat.card (Matrix.SpecialLinearGroup (Fin n) k) : ℝ) / (Fintype.card k : ℝ) ^ (n ^ 2 - 1) =
      ∏ i ∈ Finset.Icc 2 n, (1 - (Fintype.card k : ℝ)⁻¹ ^ i) := by
  sorry

/-- AA.2 target *tamagawa convergence gln*, convergence: `∑_v q_v^{-2}` converges, so the local factors
`∏_{i=2}^{n} (1 - q_v^{-i})` have an absolutely convergent product. -/
theorem summable_absNorm_rpow_neg_two (K : Type*) [Field K] [NumberField K] :
    Summable (fun v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers K) =>
      (Ideal.absNorm v.asIdeal : ℝ) ^ (-2 : ℝ)) := by
  sorry

end Tamagawa

namespace Reduction

/-- AA.3 target *division algebra no unipotent*: a division ring has no unipotent element other
than `1`. -/
theorem eq_one_of_isNilpotent_sub_one {D : Type*} [DivisionRing D] {u : D}
    (h : IsNilpotent (u - 1)) : u = 1 :=
  sub_eq_zero.mp h.eq_zero

end Reduction


namespace RestrictedProduct
open _root_.RestrictedProduct

variable {ι : Type*} [Countable ι]
  {G : ι → Type*} [∀ i, Group (G i)] [∀ i, TopologicalSpace (G i)]
  [∀ i, IsTopologicalGroup (G i)] [∀ i, T2Space (G i)]
  [∀ i, LocallyCompactSpace (G i)] [∀ i, SecondCountableTopology (G i)]
  {B : ∀ i, Subgroup (G i)} [Fact (∀ i, IsOpen (B i : Set (G i)))]
  [∀ i, MeasurableSpace (G i)] [∀ i, BorelSpace (G i)]
  [Fact (∀ᶠ i in cofinite, IsCompact (B i : Set (G i)))]

/-- AA.0 target *summable log product*: positive masses with summable error have a positive finite
product; the tail outside a finite exceptional set is taken over that subtype. -/
theorem positive_tprod_of_summable_sub_one (a : ι → ℝ) (ha : ∀ i, 0 < a i)
    (hs : Summable (fun i => |a i - 1|)) :
    Summable (fun i => |Real.log (a i)|) ∧ Multipliable a ∧ 0 < ∏' i, a i := by
  sorry

/-- Normalize only the good compact factors. The exceptional local Haar measures are retained. -/
def normalizedFamily (μ : ∀ i, Measure (G i)) (S : Finset ι) : ∀ i, Measure (G i) :=
  fun i => if i ∈ S then μ i else (μ i (B i))⁻¹ • μ i

/-- AA.0 target *convergent haar product*. The actual compactness, finite positive mass and summability
hypotheses are explicit; no eventual equality of the original masses to one is required. -/
def convergentHaarProduct (μ : ∀ i, Measure (G i)) [∀ i, (μ i).IsHaarMeasure]
    (S : Finset ι) (hc : ∀ i ∉ S, IsCompact (B i : Set (G i)))
    (hp : ∀ i ∉ S, 0 < μ i (B i) ∧ μ i (B i) < ∞)
    (hs : Summable (fun i : {i // i ∉ S} => |(μ i (B i)).toReal - 1|)) :
    Measure (Πʳ i, [G i, B i]) :=
  ENNReal.ofReal (∏' i : {i // i ∉ S}, (μ i (B i)).toReal) •
    haarProduct (B := B) (normalizedFamily (B := B) μ S) (by sorry)

theorem convergentHaarProduct_independent_exceptionalSet
    (μ : ∀ i, Measure (G i)) [∀ i, (μ i).IsHaarMeasure]
    (S T : Finset ι)
    (hcS : ∀ i ∉ S, IsCompact (B i : Set (G i)))
    (hpS : ∀ i ∉ S, 0 < μ i (B i) ∧ μ i (B i) < ∞)
    (hsS : Summable (fun i : {i // i ∉ S} => |(μ i (B i)).toReal - 1|))
    (hcT : ∀ i ∉ T, IsCompact (B i : Set (G i)))
    (hpT : ∀ i ∉ T, 0 < μ i (B i) ∧ μ i (B i) < ∞)
    (hsT : Summable (fun i : {i // i ∉ T} => |(μ i (B i)).toReal - 1|)) :
    convergentHaarProduct (B := B) μ S hcS hpS hsS = convergentHaarProduct (B := B) μ T hcT hpT hsT := by
  sorry

theorem convergentHaarProduct_isHaarMeasure
    (μ : ∀ i, Measure (G i)) [∀ i, (μ i).IsHaarMeasure]
    (S : Finset ι) (hc : ∀ i ∉ S, IsCompact (B i : Set (G i)))
    (hp : ∀ i ∉ S, 0 < μ i (B i) ∧ μ i (B i) < ∞)
    (hs : Summable (fun i : {i // i ∉ S} => |(μ i (B i)).toReal - 1|)) :
    (convergentHaarProduct (B := B) μ S hc hp hs).IsHaarMeasure := by
  sorry

/-- AA.0 target *convergent product independence*: changing the compact open subgroups at finitely many
indices, all inside `S`, transports the convergent product along `changeSubgroups`. -/
theorem map_changeSubgroups_convergentHaarProduct
    (B' : ∀ i, Subgroup (G i)) [Fact (∀ i, IsOpen (B' i : Set (G i)))]
    [Fact (∀ᶠ i in cofinite, IsCompact (B' i : Set (G i)))]
    (μ : ∀ i, Measure (G i)) [∀ i, (μ i).IsHaarMeasure] (S : Finset ι)
    (hBS : ∀ i ∉ S, B i = B' i) (hc : ∀ i ∉ S, IsCompact (B i : Set (G i)))
    (hp : ∀ i ∉ S, 0 < μ i (B i) ∧ μ i (B i) < ∞)
    (hs : Summable (fun i : {i // i ∉ S} => |(μ i (B i)).toReal - 1|))
    (hc' : ∀ i ∉ S, IsCompact (B' i : Set (G i)))
    (hp' : ∀ i ∉ S, 0 < μ i (B' i) ∧ μ i (B' i) < ∞)
    (hs' : Summable (fun i : {i // i ∉ S} => |(μ i (B' i)).toReal - 1|)) :
    Measure.map (changeSubgroups B B' (by sorry)) (convergentHaarProduct (B := B) μ S hc hp hs) =
      convergentHaarProduct (B := B') μ S hc' hp' hs' := by
  sorry

theorem convergentHaarProduct_box
    (μ : ∀ i, Measure (G i)) [∀ i, (μ i).IsHaarMeasure]
    (S : Finset ι) (hc : ∀ i ∉ S, IsCompact (B i : Set (G i)))
    (hp : ∀ i ∉ S, 0 < μ i (B i) ∧ μ i (B i) < ∞)
    (hs : Summable (fun i : {i // i ∉ S} => |(μ i (B i)).toReal - 1|))
    (T : Finset ι) (hST : S ⊆ T) (C : ∀ i, Set (G i))
    (hC : ∀ i, MeasurableSet (C i)) (htail : ∀ i ∉ T, C i = B i) :
    convergentHaarProduct (B := B) μ S hc hp hs (box (B := B) C) =
      (∏ i ∈ T, μ i (C i)) * ENNReal.ofReal (∏' i : {i // i ∉ T}, (μ i (B i)).toReal) := by
  sorry

-- Test RestrictedProduct.convergentHaarProduct_normalized
example (μ : ∀ i, Measure (G i)) [∀ i, (μ i).IsHaarMeasure]
    (hc : ∀ i, IsCompact (B i : Set (G i))) (hμ : ∀ i, μ i (B i) = 1) :
    convergentHaarProduct (B := B) μ ∅ (by sorry) (by sorry) (by sorry) =
      haarProduct (B := B) μ (Filter.Eventually.of_forall hμ) ∧
    convergentHaarProduct (B := B) μ ∅ (by sorry) (by sorry) (by sorry)
      {x | ∀ i, x i ∈ B i} = 1 := by
  sorry

-- Test RestrictedProduct.convergentHaarProduct_single_rescale
example (μ : ∀ i, Measure (G i)) [∀ i, (μ i).IsHaarMeasure]
    (hc : ∀ i, IsCompact (B i : Set (G i))) (hμ : ∀ i, μ i (B i) = 1)
    (j : ι) (c : ℝ≥0∞) (hcpos : 0 < c) (hcfin : c < ∞) :
    let ν : ∀ i, Measure (G i) := fun i => if i = j then c • μ i else μ i
    ∃ hν : ∀ i, (ν i).IsHaarMeasure,
    letI : ∀ i, (ν i).IsHaarMeasure := hν
    ∃ (hcν : ∀ i ∉ (∅ : Finset ι), IsCompact (B i : Set (G i)))
      (hpν : ∀ i ∉ (∅ : Finset ι), 0 < ν i (B i) ∧ ν i (B i) < ∞)
      (hsν : Summable (fun i : {i // i ∉ (∅ : Finset ι)} => |(ν i (B i)).toReal - 1|)),
      convergentHaarProduct (B := B) ν ∅ hcν hpν hsν =
        c • haarProduct (B := B) μ (Filter.Eventually.of_forall hμ) := by
  sorry

-- Test RestrictedProduct.convergentHaarProduct_sl2_tail
/-- Good masses `a_i < 1` with summable defect (for SL₂, `a_v = 1 - q_v⁻²`): the integral box has
mass `∏' a_i`, positive and `< 1`; no eventual equality of the masses to one is used. -/
example [Nonempty ι] (μ : ∀ i, Measure (G i)) [∀ i, (μ i).IsHaarMeasure]
    (hc : ∀ i, IsCompact (B i : Set (G i))) (a : ι → ℝ) (ha0 : ∀ i, 0 < a i)
    (ha1 : ∀ i, a i < 1) (hμ : ∀ i, μ i (B i) = ENNReal.ofReal (a i))
    (hs : Summable (fun i => |a i - 1|)) :
    convergentHaarProduct (B := B) μ ∅ (fun i _ => hc i) (by sorry) (by sorry)
        {x | ∀ i, x i ∈ B i} = ENNReal.ofReal (∏' i, a i) ∧
      0 < ∏' i, a i ∧ ∏' i, a i < 1 := by
  sorry

end RestrictedProduct

namespace QuotientMeasure

variable {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [T2Space G] [LocallyCompactSpace G] [SecondCountableTopology G]
  [MeasurableSpace G] [BorelSpace G]
  (H : Subgroup G) [Fact (IsClosed (H : Set G))] [LocallyCompactSpace H]

/-- The left H-orbits with their canonical quotient topology. -/
abbrev Cosets := MulAction.orbitRel.Quotient H G

instance : MeasurableSpace (Cosets H) := borel _
instance : BorelSpace (Cosets H) := ⟨rfl⟩

/-- Right Haar hypotheses expressed by actual Mathlib predicates. -/
def IsRightHaar {A : Type*} [Group A] [TopologicalSpace A] [MeasurableSpace A]
    (μ : Measure A) : Prop :=
  μ.IsMulRightInvariant ∧ IsFiniteMeasureOnCompacts μ ∧ μ.IsOpenPosMeasure

/-- The modular equality is required even when H is not normal. -/
def measure (μ : Measure G) (ν : Measure H)
    (hμ : IsRightHaar μ) (hν : IsRightHaar ν)
    (hmod : ∀ h : H, Measure.modularCharacter (h : G) = Measure.modularCharacter h) :
    Measure (Cosets H) := sorry


/-- AA.2 target *left right quotient inversion*: Hg ↦ g⁻¹H, from left orbits to Mathlib's left cosets. -/
def inversionHomeomorph : Cosets H ≃ₜ (G ⧸ H) := sorry

theorem inversionHomeomorph_mk (g : G) :
    inversionHomeomorph H (Quotient.mk _ g) = ((g⁻¹ : G) : G ⧸ H) := by
  sorry

/-- AA.2 target *closed homogeneous space*, with the canonical orbit quotient topology. -/
theorem homogeneous_topology :
    T2Space (Cosets H) ∧ LocallyCompactSpace (Cosets H) ∧
      SecondCountableTopology (Cosets H) ∧ IsOpenMap (fun g : G => (Quotient.mk _ g : Cosets H)) := by
  sorry

theorem compact_lift (C : Set (Cosets H)) (hC : IsCompact C) :
    ∃ K : Set G, IsCompact K ∧ C ⊆ (fun g : G => (Quotient.mk _ g : Cosets H)) '' K := by
  sorry

/-- Fibre averaging uses right Haar measure on H. -/
def average (ν : Measure H) (hν : IsRightHaar ν) (f : G → ℝ) : Cosets H → ℝ :=
  fun q => Quotient.liftOn q (fun g => ∫ h : H, f (h * g) ∂ν) (by sorry)

/-- AA.2 target *fibre average continuous*. -/
theorem average_continuous_compact (ν : Measure H) (hν : IsRightHaar ν)
    (f : G → ℝ) (hf : Continuous f) (hfc : HasCompactSupport f) :
    Continuous (average H ν hν f) ∧ HasCompactSupport (average H ν hν f) ∧
      Function.support (average H ν hν f) ⊆
        (fun g : G => (Quotient.mk _ g : Cosets H)) '' tsupport f := by
  sorry

/-- AA.2 target *compact quotient cutoff*. -/
theorem compact_cutoff (ν : Measure H) (hν : IsRightHaar ν)
    (C : Set (Cosets H)) (hC : IsCompact C) :
    ∃ β : G → ℝ, Continuous β ∧ HasCompactSupport β ∧ (∀ g, 0 ≤ β g) ∧
      ∀ q ∈ C, average H ν hν β q = 1 := by
  sorry

/-- AA.2 target *right haar exchange*. -/
theorem right_haar_exchange (μ : Measure G) (ν : Measure H)
    (hμ : IsRightHaar μ) (hν : IsRightHaar ν)
    (hmod : ∀ h : H, Measure.modularCharacter (h : G) = Measure.modularCharacter h)
    (f β : G → ℝ) (hf : Continuous f) (hfc : HasCompactSupport f)
    (hβ : Continuous β) (hβc : HasCompactSupport β) :
    (∫ g, β g * average H ν hν f (Quotient.mk _ g) ∂μ) =
      ∫ g, f g * average H ν hν β (Quotient.mk _ g) ∂μ := by
  sorry

/-- AA.2 target *quotient tonelli*. -/
theorem quotient_lintegral (μ : Measure G) (ν : Measure H)
    (hμ : IsRightHaar μ) (hν : IsRightHaar ν)
    (hmod : ∀ h : H, Measure.modularCharacter (h : G) = Measure.modularCharacter h)
    (f : G → ℝ≥0∞) (hf : Measurable f) :
    ∃ P : Cosets H → ℝ≥0∞, Measurable P ∧
      (∀ g, P (Quotient.mk _ g) = ∫⁻ h : H, f (h * g) ∂ν) ∧
      (∫⁻ g, f g ∂μ) = ∫⁻ q, P q ∂(measure H μ ν hμ hν hmod) := by
  sorry

/-- AA.2 target *quotient integral integrable*. -/
theorem integral_eq_of_integrable (μ : Measure G) (ν : Measure H)
    (hμ : IsRightHaar μ) (hν : IsRightHaar ν)
    (hmod : ∀ h : H, Measure.modularCharacter (h : G) = Measure.modularCharacter h)
    (f : G → ℝ) (hf : Integrable f μ) :
    (∀ᵐ g ∂μ, Integrable (fun h : H => f (h * g)) ν) ∧
    Integrable (average H ν hν f) (measure H μ ν hμ hν hmod) ∧
    ∫ g, f g ∂μ = ∫ q, average H ν hν f q ∂(measure H μ ν hμ hν hmod) := by
  sorry

def rightAct (g : G) : Cosets H → Cosets H := sorry

theorem rightAct_mk (g x : G) :
    rightAct H g (Quotient.mk _ x) = Quotient.mk _ (x * g) := by
  sorry

theorem integral_eq (μ : Measure G) (ν : Measure H)
    (hμ : IsRightHaar μ) (hν : IsRightHaar ν)
    (hmod : ∀ h : H, Measure.modularCharacter (h : G) = Measure.modularCharacter h)
    (f : G → ℝ) (hf : Continuous f) (hfc : HasCompactSupport f) :
    ∫ g, f g ∂μ = ∫ q, Quotient.liftOn q (fun g => ∫ h : H, f (h * g) ∂ν)
      (by sorry) ∂(measure H μ ν hμ hν hmod) := by
  sorry

theorem invariant (μ : Measure G) (ν : Measure H)
    (hμ : IsRightHaar μ) (hν : IsRightHaar ν)
    (hmod : ∀ h : H, Measure.modularCharacter (h : G) = Measure.modularCharacter h)
    (g : G) :
    Measure.map (rightAct H g) (measure H μ ν hμ hν hmod) = measure H μ ν hμ hν hmod := by
  sorry

theorem unique (μ : Measure G) (ν : Measure H)
    (hμ : IsRightHaar μ) (hν : IsRightHaar ν)
    (hmod : ∀ h : H, Measure.modularCharacter (h : G) = Measure.modularCharacter h)
    (lam : Measure (Cosets H)) [Measure.Regular lam]
    (hinv : ∀ g : G, Measure.map (rightAct H g) lam = lam) :
    ∃ c : ℝ≥0, lam = c • measure H μ ν hμ hν hmod := by
  sorry

theorem smul_left (μ : Measure G) (ν : Measure H)
    (hμ : IsRightHaar μ) (hν : IsRightHaar ν)
    (hmod : ∀ h : H, Measure.modularCharacter (h : G) = Measure.modularCharacter h)
    (c : ℝ≥0∞) (hc : c ≠ 0) (hcfin : c ≠ ∞) :
    ∃ hνc : IsRightHaar (c • ν),
      measure H μ (c • ν) hμ hνc hmod = c⁻¹ • measure H μ ν hμ hν hmod := by
  sorry

-- Test QuotientMeasure.trivial_subgroup: the subgroup measure is normalized counting.
example (μ : Measure G) (hμ : IsRightHaar μ) :
    let H : Subgroup G := ⊥
    letI : Fact (IsClosed (H : Set G)) := ⟨by sorry⟩
    letI : LocallyCompactSpace H := by sorry
    ∃ hν : IsRightHaar (Measure.count : Measure H),
    ∃ hmod : ∀ h : H, Measure.modularCharacter (h : G) = Measure.modularCharacter h,
    Measure.map (fun g : G => Quotient.mk _ g) μ = measure H μ Measure.count hμ hν hmod := by
  sorry

-- Test QuotientMeasure.z_in_r: a unit-period lattice has quotient volume one.
example :
    let G := Multiplicative ℝ
    letI : MeasurableSpace G := borel G
    letI : BorelSpace G := ⟨rfl⟩
    let H : Subgroup G := Subgroup.zpowers (Multiplicative.ofAdd (1 : ℝ))
    letI : Fact (IsClosed (H : Set G)) := ⟨by sorry⟩
    letI : LocallyCompactSpace H := by sorry
    let μ := Measure.map (Multiplicative.ofAdd : ℝ → G) (volume : Measure ℝ)
    ∃ hμ : IsRightHaar μ,
    ∃ hν : IsRightHaar (Measure.count : Measure H),
    ∃ hmod : ∀ h : H, Measure.modularCharacter (h : G) = Measure.modularCharacter h,
      measure H μ Measure.count hμ hν hmod Set.univ = 1 := by
  sorry

end QuotientMeasure

namespace RealSiegel
/-- AA.3 target *reduced form*: a uniform Cholesky adapter. The bound is quantified before the form,
so it cannot be chosen separately for each matrix. No pivot bound is assumed as a hypothesis. -/
theorem IsReduced.cholesky {n : ℕ} (C : ℝ) (hC : 0 < C) :
    ∃ R : ℝ, 0 < R ∧ ∀ (b N : Matrix (Fin n) (Fin n) ℝ) (d : Fin n → ℝ),
      b.PosDef → IsReduced C b →
      (∀ i j, j < i → N i j = 0) → (∀ i, N i i = 1) → (∀ i, 0 < d i) →
      b = N.transpose * Matrix.diagonal d * N →
      (∀ i j, i < j → |N i j| ≤ R) ∧ (∀ i j, i.val + 1 = j.val → d i ≤ R * d j) := by
  sorry

end RealSiegel

namespace RealSiegel
/-- The converse uniform Cholesky adapter. -/
theorem IsReduced.of_cholesky_bounds {n : ℕ} (R : ℝ) (hR : 0 < R) :
    ∃ C : ℝ, 1 < C ∧ ∀ (b N : Matrix (Fin n) (Fin n) ℝ) (d : Fin n → ℝ),
      b.PosDef → (∀ i j, j < i → N i j = 0) → (∀ i, N i i = 1) →
      (∀ i, 0 < d i) → b = N.transpose * Matrix.diagonal d * N →
      (∀ i j, i < j → |N i j| ≤ R) →
      (∀ i j, i.val + 1 = j.val → d i ≤ R * d j) → IsReduced C b := by
  sorry
end RealSiegel

namespace IntegralModelTests
-- Test IntegralModel.monoid_not_model. The canonical monoid algebra is F[T] with
-- group-like T, not the additive-group Hopf structure on the same polynomial ring.
example (F : Type*) [Field F] :
    let A := MonoidAlgebra F (Multiplicative ℕ)
    ¬ ∃ S : A →ₗ[F] A,
      LinearMap.mul' F A ∘ₗ S.rTensor A ∘ₗ Coalgebra.comul =
        Algebra.linearMap F A ∘ₗ Coalgebra.counit := by
  sorry
end IntegralModelTests

namespace QuotientMeasure
/-- The actual upper triangular subgroup of SL₂(R). -/
def sl2Borel : Subgroup (Matrix.SpecialLinearGroup (Fin 2) ℝ) where
  carrier := {g | g 1 0 = 0}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

-- Test QuotientMeasure.borel_no_invariant: equality of modular characters fails.
example :
    let G := Matrix.SpecialLinearGroup (Fin 2) ℝ
    letI : MeasurableSpace G := borel G
    letI : BorelSpace G := ⟨rfl⟩
    let H := sl2Borel
    letI : T2Space G := by sorry
    letI : LocallyCompactSpace G := by sorry
    letI : SecondCountableTopology G := by sorry
    letI : Fact (IsClosed (H : Set G)) := ⟨by sorry⟩
    letI : LocallyCompactSpace H := by sorry
    ¬ ∃ μ : Measure (Cosets H), IsFiniteMeasureOnCompacts μ ∧ Measure.Regular μ ∧
      μ ≠ 0 ∧ ∀ g : G, Measure.map (rightAct H g) μ = μ := by
  sorry

/-- AA.2 target *fundamental domain exists*: a Borel set meeting every left orbit Γg exactly once;
it is a fundamental domain for every measure. -/
theorem exists_measurableSet_unique_orbit_rep {G : Type*} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [LocallyCompactSpace G] [T2Space G] [SecondCountableTopology G]
    [MeasurableSpace G] [BorelSpace G] (Γ : Subgroup G) [Countable Γ] [DiscreteTopology Γ]
    (μ : Measure G) :
    ∃ D : Set G, MeasurableSet D ∧ (∀ g : G, ∃! γ : Γ, γ • g ∈ D) ∧ IsFundamentalDomain Γ D μ := by
  sorry
end QuotientMeasure


namespace RestrictedProduct
open _root_.RestrictedProduct
variable {ι : Type*} {G : ι → Type*} [∀ i, Group (G i)] [∀ i, TopologicalSpace (G i)]
  [∀ i, IsTopologicalGroup (G i)] [Countable ι] [∀ i, T2Space (G i)]
  [∀ i, LocallyCompactSpace (G i)] [∀ i, SecondCountableTopology (G i)]
  {B : ∀ i, Subgroup (G i)} [Fact (∀ i, IsOpen (B i : Set (G i)))]
  [Fact (∀ᶠ i in cofinite, IsCompact (B i : Set (G i)))]
  [∀ i, MeasurableSpace (G i)] [∀ i, BorelSpace (G i)]

/-- AA.0 target *level measure compat*. -/
theorem levelMeasure_compat (μ : ∀ i, Measure (G i)) [∀ i, SigmaFinite (μ i)]
    (S T : Finset ι) (hST : S ⊆ T) (hS : ∀ i ∉ S, μ i (B i) = 1)
    (hT : ∀ i ∉ T, μ i (B i) = 1) :
    (Measure.map Subtype.val (levelMeasure μ T hT)).restrict
      (levelSubgroup (B := B) (S : Set ι)) = Measure.map Subtype.val (levelMeasure μ S hS) := by
  sorry

/-- AA.0 target *local normalized haar*. -/
theorem exists_normalized_haar (i : ι) (hcompact : IsCompact (B i : Set (G i))) :
    ∃ μ : Measure (G i), μ.IsHaarMeasure ∧ μ (B i) = 1 := by
  sorry
end RestrictedProduct

/-- AA.0 target *local normalized haar*, number-field form: uniqueness of the normalized additive Haar
measure on `K_v` and the scaling law `map (a * ·) μ_v = |a|_v⁻¹ • μ_v`, with `|a|_v = q_v^{-v(a)}`
the pinned normalized absolute value (needs `TauCeti.NumberTheory.LocalField.NormalizedValuation`
and `TauCeti.RingTheory.DedekindDomain.AdicValuation.ValuativeRel`). -/
theorem NumberField.normalizedLocalHaar_unique_and_scaling (K : Type*) [Field K] [NumberField K]
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers K))
    [MeasurableSpace (v.adicCompletion K)] [BorelSpace (v.adicCompletion K)] :
    (∃! μ : Measure (v.adicCompletion K),
        μ.IsAddHaarMeasure ∧ μ (v.adicCompletionIntegers K) = 1) ∧
      ∀ μ : Measure (v.adicCompletion K), μ.IsAddHaarMeasure →
        μ (v.adicCompletionIntegers K) = 1 → ∀ a : v.adicCompletion K, a ≠ 0 →
          Measure.map (fun x => a * x) μ =
            (((TauCeti.normalizedAbsoluteValue (v.adicCompletion K) a : ℚ≥0) : ℝ≥0) : ℝ≥0∞)⁻¹ • μ := by
  sorry

/-! Layer 1: uses the actual Tau Ceti convolution group; its evaluation topology is installed after
the integral models below. -/

abbrev AdelicPoints (F : Type) [Field F] [NumberField F]
    (H : Type) [CommRing H] [HopfAlgebra F H] :=
  TauCeti.HopfAlgebra.points (H := H)
    (CommAlgCat.of F (NumberField.AdeleRing (NumberField.RingOfIntegers F) F))

namespace AdelicPoints
variable (F : Type) [Field F] [NumberField F]
  (H : Type) [CommRing H] [HopfAlgebra F H]

abbrev FiniteAdelicPoints := TauCeti.HopfAlgebra.points (H := H)
  (CommAlgCat.of F (IsDedekindDomain.FiniteAdeleRing (NumberField.RingOfIntegers F) F))

abbrev InfinitePoints := TauCeti.HopfAlgebra.points (H := H)
  (CommAlgCat.of F (NumberField.InfiniteAdeleRing F))

abbrev LocalPoints (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :=
  TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of F (v.adicCompletion F))

def diagonal : WithConv (H →ₐ[F] F) →* AdelicPoints F H :=
  TauCeti.AlgHom.mapValue (H := H) (Algebra.ofId F _)

/-- Canonical value-algebra projection `𝔸_F → F_v`. -/
def valueProjection (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    NumberField.AdeleRing (NumberField.RingOfIntegers F) F →ₐ[F] v.adicCompletion F where
  toFun x := x.2 v
  map_zero' := by sorry
  map_one' := by sorry
  map_add' := by sorry
  map_mul' := by sorry
  commutes' := by sorry

def proj (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    AdelicPoints F H →* LocalPoints F H v := TauCeti.AlgHom.mapValue (H := H) (valueProjection F v)

theorem proj_diagonal (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (g : WithConv (H →ₐ[F] F)) :
    proj F H v (diagonal F H g) = TauCeti.AlgHom.mapValue (H := H) (Algebra.ofId F _) g := by
  sorry

def finiteProjection : AdelicPoints F H →* FiniteAdelicPoints F H :=
  TauCeti.AlgHom.mapValue (H := H) (AlgHom.snd F _ _)

def infiniteProjection : AdelicPoints F H →* InfinitePoints F H :=
  TauCeti.AlgHom.mapValue (H := H) (AlgHom.fst F _ _)

/-- The archimedean coordinate is the identity point of the group. -/
def finiteEmbed : FiniteAdelicPoints F H →* AdelicPoints F H where
  toFun x := WithConv.toConv {
    toFun h := ((1 : InfinitePoints F H).ofConv h, x.ofConv h)
    map_zero' := by sorry
    map_one' := by sorry
    map_add' := by sorry
    map_mul' := by sorry
    commutes' := by sorry }
  map_one' := by sorry
  map_mul' := by sorry

theorem finiteEmbed_finite (x : FiniteAdelicPoints F H) :
    finiteProjection F H (finiteEmbed F H x) = x := by
  sorry

theorem finiteEmbed_infinite (x : FiniteAdelicPoints F H) :
    infiniteProjection F H (finiteEmbed F H x) = 1 := by
  sorry

-- The group morphism is induced by the actual coordinate bialgebra morphism.
def map {H' : Type} [CommRing H'] [HopfAlgebra F H']
    (φ : H' →ₐc[F] H) : AdelicPoints F H →* AdelicPoints F H' where
  toFun x := WithConv.toConv (x.ofConv.comp (φ : H' →ₐ[F] H))
  map_one' := by sorry
  map_mul' := by sorry

theorem map_id (x : AdelicPoints F H) : map F H (BialgHom.id F H) x = x := by
  sorry

theorem map_comp {H' H'' : Type} [CommRing H'] [HopfAlgebra F H']
    [CommRing H''] [HopfAlgebra F H''] (φ : H' →ₐc[F] H) (ψ : H'' →ₐc[F] H')
    (x : AdelicPoints F H) : map F H (φ.comp ψ) x = map F H' ψ (map F H φ x) := by
  sorry

theorem map_diagonal {H' : Type} [CommRing H'] [HopfAlgebra F H']
    (φ : H' →ₐc[F] H) (g : WithConv (H →ₐ[F] F)) :
    map F H φ (diagonal F H g) =
      diagonal F H' (WithConv.toConv (g.ofConv.comp (φ : H' →ₐ[F] H))) := by
  sorry

theorem proj_map {H' : Type} [CommRing H'] [HopfAlgebra F H']
    (φ : H' →ₐc[F] H) (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (x : AdelicPoints F H) :
    proj F H' v (map F H φ x) =
      WithConv.toConv ((proj F H v x).ofConv.comp (φ : H' →ₐ[F] H)) := by
  sorry

-- Test AdelicPoints.map_trivial.
example (φ : F →ₐc[F] H) (x : AdelicPoints F H) : map F H φ x = 1 := by
  sorry

-- Test AdelicPoints.ga_eq_adeles, algebraic part; the homeomorphism is `AdelicPoints.gaEquiv`.
-- The canonical identification is evaluation at the generator (pinned `gaPointsMulEquiv`), and it
-- carries the diagonal to `algebraMap F 𝔸_F`; an abstract `Nonempty (≃*)` would not test this.
example (g : WithConv (SymmetricAlgebra F F →ₐ[F] F)) :
    Multiplicative.toAdd (TauCeti.AdditiveGroup.gaPointsMulEquiv
        (diagonal F (SymmetricAlgebra F F) g)) =
      algebraMap F (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)
        (Multiplicative.toAdd (TauCeti.AdditiveGroup.gaPointsMulEquiv g)) := by
  sorry

-- Test AdelicPoints.trivial_group uses the actual trivial coordinate Hopf algebra.
example : Subsingleton (AdelicPoints F F) := by
  sorry

-- Test AdelicPoints.map_det_gl1: determinant is the canonical GL_1-to-units comparison.
example (x : AdelicPoints F (TauCeti.GeneralLinear.coordinateHopfAlgebra F 1)) :
    TauCeti.DiagonalizableGroup.pointsMulEquiv
      (map F (TauCeti.GeneralLinear.coordinateHopfAlgebra F 1)
        (TauCeti.GeneralLinear.determinantCoordinateMap F 1).hom x)
      (Multiplicative.ofAdd (1 : ℤ)) =
        Matrix.GeneralLinearGroup.det (TauCeti.GeneralLinear.pointsMulEquiv (R := F) 1 x) := by
  sorry

end AdelicPoints

abbrev RationalCharacter (F : Type) [Field F]
    (H : Type) [CommRing H] [HopfAlgebra F H] := GroupLike F H

namespace RationalCharacter
variable {F : Type} [Field F] {H : Type} [CommRing H] [HopfAlgebra F H]

def apply {R : Type} [CommRing R] [Algebra F R] (χ : RationalCharacter F H)
    (x : WithConv (H →ₐ[F] R)) : Rˣ :=
  Units.map x.ofConv.toMonoidHom (GroupLike.toUnits F χ)

theorem apply_mul {R : Type} [CommRing R] [Algebra F R]
    (χ : RationalCharacter F H) (x y : WithConv (H →ₐ[F] R)) :
    χ.apply (x * y) = χ.apply x * χ.apply y := by
  sorry

/-- The character group structure on actual Laurent coordinate bialgebra maps. -/
noncomputable instance characterHomCommGroup :
    CommGroup (LaurentPolynomial F →ₐc[F] H) := sorry

def equivHom : RationalCharacter F H ≃* (LaurentPolynomial F →ₐc[F] H) := sorry

def toGeometric (χ : RationalCharacter F H) :
    TauCeti.CommHopfAlgCat.geometricCharacterGroup (CommHopfAlgCat.of F H) := sorry

theorem toGeometric_injective : Function.Injective (toGeometric (F := F) (H := H)) := by
  sorry

theorem toGeometric_range [CharZero F] :
    Set.range (toGeometric (F := F) (H := H)) =
      {χ | ∀ σ : Field.absoluteGaloisGroup F, σ • χ = χ} := by
  sorry

theorem free [Algebra.FiniteType F H]
    (hred : TauCeti.geometricallyReducedCommHopfAlgProperty F (CommHopfAlgCat.of F H))
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty F (CommHopfAlgCat.of F H)) :
    Module.Free ℤ (Additive (RationalCharacter F H)) ∧
    Module.Finite ℤ (Additive (RationalCharacter F H)) := by
  sorry

-- Test RationalCharacter.gln_det: determinant is the specified lattice generator.
example (n : ℕ) (hn : 0 < n) :
    ∃ e : RationalCharacter F (TauCeti.GeneralLinear.coordinateHopfAlgebra F n) ≃*
      Multiplicative ℤ,
      e (TauCeti.GeneralLinear.determinantGroupLike F n) = Multiplicative.ofAdd (1 : ℤ) := by
  sorry

-- Test RationalCharacter.sln_trivial at the actual determinant-one coordinate quotient.
example (n : ℕ) :
    Subsingleton (RationalCharacter F (TauCeti.SpecialLinear.coordinateHopfAlgebra F n)) := by
  sorry

end RationalCharacter

abbrev RealCharacterSpace (F : Type) [Field F]
    (H : Type) [CommRing H] [HopfAlgebra F H] := Additive (RationalCharacter F H) →+ ℝ

namespace RealCharacterSpace
variable {F : Type} [Field F] {H : Type} [CommRing H] [HopfAlgebra F H]

def pairing (a : RealCharacterSpace F H) (χ : RationalCharacter F H) : ℝ :=
  a (Additive.ofMul χ)

theorem finrank [Module.Free ℤ (Additive (RationalCharacter F H))]
    [Module.Finite ℤ (Additive (RationalCharacter F H))] :
    Module.finrank ℝ (RealCharacterSpace F H) =
      Module.finrank ℤ (Additive (RationalCharacter F H)) := by
  sorry

-- The Hopf morphism pulls back characters; precomposition gives the stated covariant a_G map.
def map {H' : Type} [CommRing H'] [HopfAlgebra F H'] (φ : H' →ₐc[F] H) :
    RealCharacterSpace F H →ₗ[ℝ] RealCharacterSpace F H' := sorry

theorem map_id (a : RealCharacterSpace F H) : map (BialgHom.id F H) a = a := by
  sorry

theorem map_comp {H' H'' : Type} [CommRing H'] [HopfAlgebra F H']
    [CommRing H''] [HopfAlgebra F H''] (φ : H' →ₐc[F] H) (ψ : H'' →ₐc[F] H')
    (a : RealCharacterSpace F H) : map (φ.comp ψ) a = map ψ (map φ a) := by
  sorry

-- Test RealCharacterSpace.gln_finrank: the dimension assertion uses the actual GL_n carrier.
example (n : ℕ) (hn : 0 < n) :
    Module.finrank ℝ (RealCharacterSpace F (TauCeti.GeneralLinear.coordinateHopfAlgebra F n)) = 1 := by
  sorry

-- Test RealCharacterSpace.sln_zero at the actual determinant-one carrier.
example (n : ℕ) :
    Subsingleton (RealCharacterSpace F (TauCeti.SpecialLinear.coordinateHopfAlgebra F n)) := by
  sorry

end RealCharacterSpace

/-! Layer 1: Integral models use finitely presented Hopf algebras and genuine Hopf isomorphisms.
The S-integer algebra and local integer inclusion are the canonical library carriers. -/
open CategoryTheory

abbrev AdelicSIntegers (F : Type) [Field F] [NumberField F]
    (S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))) :=
  (S : Set (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))).integer F

structure IntegralModel (F : Type) [Field F] [NumberField F]
    (H : Type) [CommRing H] [HopfAlgebra F H]
    (S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))) where
  coordinate : CommHopfAlgCat (AdelicSIntegers F S)
  finitePresentation : Algebra.FinitePresentation (AdelicSIntegers F S) coordinate
  baseChangeIso : TauCeti.CommHopfAlgCat.baseChange (K := F) coordinate ≅ CommHopfAlgCat.of F H

namespace IntegralModel
variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]
  {S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))}

/-- The value map is the canonical S-integer inclusion into the completed valuation ring. -/
def localIntegerMap (v : {v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F) // v ∉ S}) :
    AdelicSIntegers F S →+* v.val.adicCompletionIntegers F where
  toFun x := ⟨algebraMap F (v.val.adicCompletion F) x, by sorry⟩
  map_zero' := by sorry
  map_one' := by sorry
  map_add' := by sorry
  map_mul' := by sorry

instance localIntegerAlgebra (v : {v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F) // v ∉ S}) :
    Algebra (AdelicSIntegers F S) (v.val.adicCompletionIntegers F) := (localIntegerMap v).toAlgebra

abbrev IntegralPoints (M : IntegralModel F H S)
    (v : {v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F) // v ∉ S}) :=
  TauCeti.HopfAlgebra.points (H := M.coordinate)
    (CommAlgCat.of (AdelicSIntegers F S) (v.val.adicCompletionIntegers F))

/-- Extend an integral point through the specified generic-fibre Hopf isomorphism. -/
def localEmbed (M : IntegralModel F H S)
    (v : {v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F) // v ∉ S}) :
    IntegralPoints M v →* AdelicPoints.LocalPoints F H v.val := sorry

theorem localEmbed_apply (M : IntegralModel F H S)
    (v : {v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F) // v ∉ S})
    (x : IntegralPoints M v) (h : M.coordinate) :
    (localEmbed M v x).ofConv (M.baseChangeIso.hom.hom (1 ⊗ₜ[AdelicSIntegers F S] h)) =
      algebraMap (v.val.adicCompletionIntegers F) (v.val.adicCompletion F) (x.ofConv h) := by
  sorry

def localPoints (M : IntegralModel F H S)
    (v : {v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F) // v ∉ S}) :
    Subgroup (AdelicPoints.LocalPoints F H v.val) := (localEmbed M v).range

theorem localPoints_injective (M : IntegralModel F H S)
    (v : {v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F) // v ∉ S}) :
    Function.Injective (localEmbed M v) := by
  sorry

/-- Enlarge S by scalar extension; the Hopf base-change tower isomorphism fixes the generic fibre. -/
def enlarge (M : IntegralModel F H S)
    (T : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)))
    (hST : S ⊆ T) : IntegralModel F H T := sorry

theorem enlarge_localPoints (M : IntegralModel F H S)
    (T : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)))
    (hST : S ⊆ T)
    (v : {v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F) // v ∉ T}) :
    (enlarge M T hST).localPoints v = M.localPoints ⟨v.val, by sorry⟩ := by
  sorry

/-- Standard GL_n model: its coordinate ring is the library's determinant localization. -/
def standardGLn (n : ℕ) : IntegralModel F (TauCeti.GeneralLinear.coordinateHopfAlgebra F n) S where
  coordinate := CommHopfAlgCat.of (AdelicSIntegers F S)
    (TauCeti.GeneralLinear.coordinateHopfAlgebra (AdelicSIntegers F S) n)
  finitePresentation := by sorry
  baseChangeIso := by sorry

-- Test IntegralModel.gln_localPoints: the determinant must be a unit in O_v.
example (n : ℕ)
    (v : {v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F) // v ∉ S}) :
    ((standardGLn (F := F) (S := S) n).localPoints v).map
      (TauCeti.GeneralLinear.pointsMulEquiv (R := F) (A := v.val.adicCompletion F) n).toMonoidHom =
      (Matrix.GeneralLinearGroup.map
        (algebraMap (v.val.adicCompletionIntegers F) (v.val.adicCompletion F))).range := by
  sorry

-- Test IntegralModel.ga_rescaled_identification: with generator `X ↦ c • T` the integral points
-- at `v ∉ S` are `c⁻¹ 𝒪_v`; they depend on the specified identification.
example (M : IntegralModel F (SymmetricAlgebra F F) S) (c : AdelicSIntegers F S)
    (X : M.coordinate) (hgen : Algebra.adjoin (AdelicSIntegers F S) {X} = ⊤)
    (hX : M.baseChangeIso.hom.hom (1 ⊗ₜ[AdelicSIntegers F S] X) =
      (c : F) • SymmetricAlgebra.ι F F 1)
    (v : {v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F) // v ∉ S}) :
    (((M.localPoints v).map
        (TauCeti.AdditiveGroup.gaPointsMulEquiv (R := F) (A := v.val.adicCompletion F)).toMonoidHom) :
          Set (Multiplicative (v.val.adicCompletion F))) =
      {a | algebraMap F (v.val.adicCompletion F) (c : F) * Multiplicative.toAdd a ∈
        v.val.adicCompletionIntegers F} := by
  sorry

end IntegralModel

namespace IntegralModel
variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]

/-- AA.1 target *integral model exists* and AA.1 target *hopf spreading*. -/
theorem «exists» [Algebra.FiniteType F H] :
    ∃ S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)),
      Nonempty (IntegralModel F H S) := by
  sorry

/-- AA.1 target *integral model unique*: the enlarged models have a compatible Hopf isomorphism. -/
theorem unique
    {S S' : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))}
    (M : IntegralModel F H S) (M' : IntegralModel F H S') :
    ∃ T, ∃ hST : S ⊆ T, ∃ hS'T : S' ⊆ T,
      ∃ e : (M.enlarge T hST).coordinate ≅ (M'.enlarge T hS'T).coordinate,
        ∀ h : (M.enlarge T hST).coordinate,
          (M.enlarge T hST).baseChangeIso.hom.hom (1 ⊗ₜ[AdelicSIntegers F T] h) =
            (M'.enlarge T hS'T).baseChangeIso.hom.hom
              (1 ⊗ₜ[AdelicSIntegers F T] e.hom.hom h) := by
  sorry

/-- AA.1 target *hopf spreading*, morphism clause: a Hopf map `H' → H` spreads to a Hopf map of the
enlarged models compatible with the generic-fibre identifications. -/
theorem exists_spread_hom {H' : Type} [CommRing H'] [HopfAlgebra F H']
    {S S' : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))}
    (M : IntegralModel F H S) (M' : IntegralModel F H' S') (φ : H' →ₐc[F] H) :
    ∃ T, ∃ hST : S ⊆ T, ∃ hS'T : S' ⊆ T,
      ∃ ψ : (M'.enlarge T hS'T).coordinate ⟶ (M.enlarge T hST).coordinate,
        ∀ h : (M'.enlarge T hS'T).coordinate,
          (M.enlarge T hST).baseChangeIso.hom.hom (1 ⊗ₜ[AdelicSIntegers F T] ψ.hom h) =
            φ ((M'.enlarge T hS'T).baseChangeIso.hom.hom (1 ⊗ₜ[AdelicSIntegers F T] h)) := by
  sorry
end IntegralModel

/-! Layer 1: The evaluation topology on points and the restricted-product realization.

The topology on `R`-points of an affine group over a topological `F`-algebra `R` is the
coarsest one for which every coordinate evaluation `x ↦ x h` is continuous. On the local
groups `G(F_v)` this is the topology of ReductiveGroupsPartII, layer RG2.0, which also owns its
chart independence; the local Hausdorff, local compactness and countability instances below are
that layer's theorems, stated here so that the adelic signatures elaborate. -/

namespace AdelicPoints

/-- AA.1 target *adelic points*: the affine-points topology on `R`-points, induced from `R^H` by
evaluation. -/
abbrev evalTopology (F : Type) [Field F] (H : Type) [CommRing H] [HopfAlgebra F H]
    (R : Type) [CommRing R] [Algebra F R] [TopologicalSpace R] :
    TopologicalSpace (WithConv (H →ₐ[F] R)) :=
  TopologicalSpace.induced (fun x h => x.ofConv h) Pi.topologicalSpace

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

instance instTopologicalSpace : TopologicalSpace (AdelicPoints F H) :=
  evalTopology F H (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)

instance instTopologicalSpaceFinite : TopologicalSpace (FiniteAdelicPoints F H) :=
  evalTopology F H (IsDedekindDomain.FiniteAdeleRing (NumberField.RingOfIntegers F) F)

instance instTopologicalSpaceInfinite : TopologicalSpace (InfinitePoints F H) :=
  evalTopology F H (NumberField.InfiniteAdeleRing F)

instance instTopologicalSpaceLocal
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    TopologicalSpace (LocalPoints F H v) :=
  evalTopology F H (v.adicCompletion F)

instance instIsTopologicalGroup : IsTopologicalGroup (AdelicPoints F H) := sorry

instance instIsTopologicalGroupFinite : IsTopologicalGroup (FiniteAdelicPoints F H) := sorry

instance instIsTopologicalGroupInfinite : IsTopologicalGroup (InfinitePoints F H) := sorry

instance instIsTopologicalGroupLocal
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    IsTopologicalGroup (LocalPoints F H v) := sorry

theorem continuous_eval (h : H) :
    Continuous (fun x : AdelicPoints F H =>
      (x.ofConv h : NumberField.AdeleRing (NumberField.RingOfIntegers F) F)) := by
  sorry

theorem continuous_proj (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    Continuous (proj F H v) := by
  sorry

theorem continuous_finiteProjection : Continuous (finiteProjection F H) := by
  sorry

theorem continuous_infiniteProjection : Continuous (infiniteProjection F H) := by
  sorry

theorem continuous_finiteEmbed : Continuous (finiteEmbed F H) := by
  sorry

/-- AA.1 target *adelic map*: the induced map on adelic points is continuous. -/
theorem continuous_map {H' : Type} [CommRing H'] [HopfAlgebra F H'] (φ : H' →ₐc[F] H) :
    Continuous (map F H φ) := by
  sorry

-- Test AdelicPoints.not_product_topology: for `G_m` evaluation at `T` is injective but is not an
-- embedding into `𝔸_F`; the topology is not the subspace topology of `𝔸_F^×` in `𝔸_F`.
example : Function.Injective (fun x : AdelicPoints F (LaurentPolynomial F) =>
      (x.ofConv (LaurentPolynomial.T 1) : NumberField.AdeleRing (NumberField.RingOfIntegers F) F)) ∧
    ¬ Topology.IsEmbedding (fun x : AdelicPoints F (LaurentPolynomial F) =>
      (x.ofConv (LaurentPolynomial.T 1) : NumberField.AdeleRing (NumberField.RingOfIntegers F) F)) := by
  sorry

/-! The local groups `G(F_v)`: ReductiveGroupsPartII, RG2.0. -/

instance instT2SpaceLocal
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    T2Space (LocalPoints F H v) := sorry

instance instLocallyCompactSpaceLocal [Algebra.FiniteType F H]
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    LocallyCompactSpace (LocalPoints F H v) := sorry

instance instSecondCountableLocal [Algebra.FiniteType F H]
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    SecondCountableTopology (LocalPoints F H v) := sorry

/-- AA.1 target *adelic points locally compact*. -/
instance instT2Space : T2Space (AdelicPoints F H) := sorry

instance instLocallyCompactSpace [Algebra.FiniteType F H] :
    LocallyCompactSpace (AdelicPoints F H) := sorry

instance instSecondCountable [Algebra.FiniteType F H] :
    SecondCountableTopology (AdelicPoints F H) := sorry

instance instT2SpaceFinite : T2Space (FiniteAdelicPoints F H) := sorry

instance instLocallyCompactSpaceFinite [Algebra.FiniteType F H] :
    LocallyCompactSpace (FiniteAdelicPoints F H) := sorry

instance instSecondCountableFinite [Algebra.FiniteType F H] :
    SecondCountableTopology (FiniteAdelicPoints F H) := sorry

instance instLocallyCompactSpaceInfinite [Algebra.FiniteType F H] :
    LocallyCompactSpace (InfinitePoints F H) := sorry

/-- AA.1 target *rational points discrete*: the diagonal is injective with discrete closed image. -/
theorem diagonal_injective : Function.Injective (diagonal F H) := by
  sorry

theorem discreteTopology_range_diagonal [Algebra.FiniteType F H] :
    DiscreteTopology (diagonal F H).range := by
  sorry

theorem isClosed_range_diagonal [Algebra.FiniteType F H] :
    IsClosed ((diagonal F H).range : Set (AdelicPoints F H)) := by
  sorry

/-- The diagonal into the finite adelic points. -/
def finiteDiagonal : WithConv (H →ₐ[F] F) →* FiniteAdelicPoints F H :=
  TauCeti.AlgHom.mapValue (H := H) (Algebra.ofId F _)

/-- AA.1 target *finite adelic discreteness criterion*: `G(F)` is discrete in `G(𝔸_{F,f})` exactly when it
meets a compact open subgroup in a finite set. -/
theorem discreteTopology_finiteDiagonal_iff [Algebra.FiniteType F H]
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H))) :
    DiscreteTopology (finiteDiagonal F H).range ↔ ((finiteDiagonal F H) ⁻¹' U).Finite := by
  sorry

/-- AA.1 target *adelic points split*: archimedean and finite parts. -/
def infiniteFiniteEquiv : AdelicPoints F H ≃ₜ* (InfinitePoints F H × FiniteAdelicPoints F H) :=
  sorry

theorem infiniteFiniteEquiv_apply (x : AdelicPoints F H) :
    infiniteFiniteEquiv F H x = (infiniteProjection F H x, finiteProjection F H x) := by
  sorry

theorem infiniteFiniteEquiv_diagonal (g : WithConv (H →ₐ[F] F)) :
    infiniteFiniteEquiv F H (diagonal F H g) =
      (TauCeti.AlgHom.mapValue (H := H) (Algebra.ofId F _) g, finiteDiagonal F H g) := by
  sorry

/-- AA.1 target *points product ring*: points over a product of algebras. -/
def prodValueEquiv (R₁ R₂ : Type) [CommRing R₁] [Algebra F R₁] [CommRing R₂] [Algebra F R₂] :
    WithConv (H →ₐ[F] R₁ × R₂) ≃* WithConv (H →ₐ[F] R₁) × WithConv (H →ₐ[F] R₂) where
  toFun x := (WithConv.toConv ((AlgHom.fst F R₁ R₂).comp x.ofConv),
    WithConv.toConv ((AlgHom.snd F R₁ R₂).comp x.ofConv))
  invFun y := WithConv.toConv (y.1.ofConv.prod y.2.ofConv)
  left_inv := sorry
  right_inv := sorry
  map_mul' := sorry

theorem isHomeomorph_prodValueEquiv (R₁ R₂ : Type) [CommRing R₁] [Algebra F R₁]
    [TopologicalSpace R₁] [CommRing R₂] [Algebra F R₂] [TopologicalSpace R₂] :
    @IsHomeomorph _ _ (evalTopology F H (R₁ × R₂))
      (@instTopologicalSpaceProd _ _ (evalTopology F H R₁) (evalTopology F H R₂))
      (prodValueEquiv F H R₁ R₂) := by
  sorry

/-- AA.1 target *product adelic*: adelic points of a product group. -/
def prodEquiv (H' : Type) [CommRing H'] [HopfAlgebra F H'] :
    AdelicPoints F (TensorProduct F H H') ≃ₜ* (AdelicPoints F H × AdelicPoints F H') :=
  sorry

theorem prodEquiv_apply (H' : Type) [CommRing H'] [HopfAlgebra F H']
    (x : AdelicPoints F (TensorProduct F H H')) :
    (prodEquiv F H H' x : AdelicPoints F H × AdelicPoints F H') =
      TauCeti.AffineGroup.Product.pointsMulEquiv x := by
  sorry

/-- AA.1 target *closed subgroup adelic*: a Hopf ideal cuts out a closed subgroup of adelic points. -/
theorem isClosed_quotientPointsSubgroup (I : TauCeti.HopfIdeal F (CommHopfAlgCat.of F H)) :
    IsClosed ((TauCeti.CommHopfAlgCat.quotientPointsSubgroup (CommHopfAlgCat.of F H) I
      (CommAlgCat.of F (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)) :
        Set (AdelicPoints F H))) := by
  sorry

theorem isClosedEmbedding_quotientPointsHom (I : TauCeti.HopfIdeal F (CommHopfAlgCat.of F H)) :
    Topology.IsClosedEmbedding
      (@DFunLike.coe _ _ _ _ (TauCeti.CommHopfAlgCat.quotientPointsHom (CommHopfAlgCat.of F H) I
        (CommAlgCat.of F (NumberField.AdeleRing (NumberField.RingOfIntegers F) F))).hom :
        AdelicPoints F (TauCeti.CommHopfAlgCat.quotient (CommHopfAlgCat.of F H) I) →
          AdelicPoints F H) := by
  sorry

end AdelicPoints

/-! Layer 1: Integral points as levels and the restricted product. -/

namespace IntegralModel
variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]
  {S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))}

/-- AA.1 target *integral points level*: the integral points are a compact open subgroup. -/
theorem isOpen_localPoints [Algebra.FiniteType F H] (M : IntegralModel F H S)
    (v : {v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F) // v ∉ S}) :
    IsOpen (M.localPoints v : Set (AdelicPoints.LocalPoints F H v.val)) := by
  sorry

theorem isCompact_localPoints [Algebra.FiniteType F H] (M : IntegralModel F H S)
    (v : {v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F) // v ∉ S}) :
    IsCompact (M.localPoints v : Set (AdelicPoints.LocalPoints F H v.val)) := by
  sorry

/-- The level family: `𝓗(𝒪_v)` outside `S`, the whole local group at `v ∈ S`. -/
def levelFamily (M : IntegralModel F H S)
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    Subgroup (AdelicPoints.LocalPoints F H v) :=
  if hv : v ∈ S then ⊤ else M.localPoints ⟨v, hv⟩

instance levelFamily_isOpen [Algebra.FiniteType F H] (M : IntegralModel F H S) :
    Fact (∀ v, IsOpen (M.levelFamily v : Set (AdelicPoints.LocalPoints F H v))) := sorry

/-- AA.1 target *restricted product comparison*: `x ↦ (p_v x)_v` is an isomorphism of topological groups
`G(𝔸_{F,f}) ≃ Πʳ v, [G(F_v), B_v]`. -/
def restrictedProductEquiv [Algebra.FiniteType F H] (M : IntegralModel F H S) :
    AdelicPoints.FiniteAdelicPoints F H ≃ₜ*
      Πʳ v, [AdelicPoints.LocalPoints F H v, M.levelFamily v] :=
  sorry

theorem restrictedProductEquiv_apply [Algebra.FiniteType F H] (M : IntegralModel F H S)
    (x : AdelicPoints.FiniteAdelicPoints F H)
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) (h : H) :
    ((restrictedProductEquiv M x v).ofConv h : v.adicCompletion F) =
      (x.ofConv h : IsDedekindDomain.FiniteAdeleRing (NumberField.RingOfIntegers F) F) v := by
  sorry

/-- AA.1 target *restricted product bijection*: the bijection on `S'`-adelic points, before topology. -/
theorem restrictedProductEquiv_bijective [Algebra.FiniteType F H] (M : IntegralModel F H S) :
    Function.Bijective (restrictedProductEquiv M) :=
  (restrictedProductEquiv M).bijective

/-- AA.1 target *restricted product model independence*: two models differ by `changeSubgroups`. -/
theorem eventually_levelFamily_eq [Algebra.FiniteType F H]
    {S' : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))}
    (M : IntegralModel F H S) (M' : IntegralModel F H S') :
    ∀ᶠ v in Filter.cofinite, M.levelFamily v = M'.levelFamily v := by
  sorry

theorem restrictedProductEquiv_indep [Algebra.FiniteType F H]
    {S' : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))}
    (M : IntegralModel F H S) (M' : IntegralModel F H S') (x : AdelicPoints.FiniteAdelicPoints F H) :
    restrictedProductEquiv M' x =
      RestrictedProduct.changeSubgroups M.levelFamily M'.levelFamily
        (eventually_levelFamily_eq M M') (restrictedProductEquiv M x) := by
  sorry

end IntegralModel

/-! Layer 1: Concrete groups, levels and unimodularity. -/

namespace AdelicPoints

variable (F : Type) [Field F] [NumberField F]

/-- AA.1 target *ga adelic*: `G_a(𝔸_F) ≃ 𝔸_F`, through evaluation at the generator. -/
def gaEquiv :
    AdelicPoints F (SymmetricAlgebra F F) ≃ₜ*
      Multiplicative (NumberField.AdeleRing (NumberField.RingOfIntegers F) F) :=
  sorry

theorem gaEquiv_apply (x : AdelicPoints F (SymmetricAlgebra F F)) :
    gaEquiv F x = TauCeti.AdditiveGroup.gaPointsMulEquiv x := by
  sorry

/-- AA.1 target *gm adelic*: `G_m(𝔸_F)` is the idele group with its units topology. -/
def gmEquiv :
    AdelicPoints F (LaurentPolynomial F) ≃ₜ* NumberField.IdeleGroup (NumberField.RingOfIntegers F) F :=
  sorry

theorem gmEquiv_apply (x : AdelicPoints F (LaurentPolynomial F)) :
    gmEquiv F x = TauCeti.MultiplicativeGroup.pointsMulEquiv x := by
  sorry

/-- The finite part of `gm-adelic`: `G_m(𝔸_{F,f}) ≃ 𝔸_{F,f}^×`. -/
def gmFiniteEquiv :
    FiniteAdelicPoints F (LaurentPolynomial F) ≃ₜ*
      (IsDedekindDomain.FiniteAdeleRing (NumberField.RingOfIntegers F) F)ˣ :=
  sorry

theorem gmFiniteEquiv_apply (x : FiniteAdelicPoints F (LaurentPolynomial F)) :
    gmFiniteEquiv F x = TauCeti.MultiplicativeGroup.pointsMulEquiv x := by
  sorry

-- Test AdelicPoints.map_not_open: for `G_m` over `ℚ` the image of squaring, `(𝔸_ℚ^×)²`, is
-- closed of infinite index but not open.
example : IsClosed ((powMonoidHom 2 : NumberField.IdeleGroup (NumberField.RingOfIntegers ℚ) ℚ →*
      NumberField.IdeleGroup (NumberField.RingOfIntegers ℚ) ℚ).range :
        Set (NumberField.IdeleGroup (NumberField.RingOfIntegers ℚ) ℚ)) ∧
    (powMonoidHom 2 : NumberField.IdeleGroup (NumberField.RingOfIntegers ℚ) ℚ →*
      NumberField.IdeleGroup (NumberField.RingOfIntegers ℚ) ℚ).range.index = 0 ∧
    ¬ IsOpen ((powMonoidHom 2 : NumberField.IdeleGroup (NumberField.RingOfIntegers ℚ) ℚ →*
      NumberField.IdeleGroup (NumberField.RingOfIntegers ℚ) ℚ).range :
        Set (NumberField.IdeleGroup (NumberField.RingOfIntegers ℚ) ℚ)) := by
  sorry

/-- AA.1 target *gln adelic*: `GL_n(𝔸_F)` with the units topology of the matrix ring. -/
def glnEquiv (n : ℕ) :
    AdelicPoints F (TauCeti.GeneralLinear.coordinateHopfAlgebra F n) ≃ₜ*
      GL (Fin n) (NumberField.AdeleRing (NumberField.RingOfIntegers F) F) :=
  sorry

theorem glnEquiv_apply (n : ℕ) (x : AdelicPoints F (TauCeti.GeneralLinear.coordinateHopfAlgebra F n)) :
    glnEquiv F n x = TauCeti.GeneralLinear.pointsMulEquiv (R := F) n x := by
  sorry

/-- The finite part of `gln-adelic`. -/
def glnFiniteEquiv (n : ℕ) :
    FiniteAdelicPoints F (TauCeti.GeneralLinear.coordinateHopfAlgebra F n) ≃ₜ*
      GL (Fin n) (IsDedekindDomain.FiniteAdeleRing (NumberField.RingOfIntegers F) F) :=
  sorry

/-- AA.1 target *compact open product*: two compact open subgroups of `G(𝔸_{F,f})` are commensurable. -/
theorem commensurable_of_compact_open {H : Type} [CommRing H] [HopfAlgebra F H]
    [Algebra.FiniteType F H] {U U' : Subgroup (FiniteAdelicPoints F H)}
    (hU : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H)))
    (hU' : IsCompact (U' : Set (FiniteAdelicPoints F H)))
    (hU'o : IsOpen (U' : Set (FiniteAdelicPoints F H))) :
    Subgroup.Commensurable U U' := by
  sorry

end AdelicPoints

namespace IntegralModel
variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]
  {S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))}

/-- The product level `∏_v V_v` inside `G(𝔸_{F,f})`, through the restricted-product comparison. -/
def productLevel [Algebra.FiniteType F H] (M : IntegralModel F H S)
    (V : ∀ v, Subgroup (AdelicPoints.LocalPoints F H v))
    (hV : ∀ᶠ v in Filter.cofinite, V v = M.levelFamily v) :
    Subgroup (AdelicPoints.FiniteAdelicPoints F H) where
  carrier := {x | ∀ v, restrictedProductEquiv M x v ∈ V v}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- AA.1 target *compact open product*: every compact open subgroup contains, and is contained in, a
product level whose factors are compact open and equal to `𝓗(𝒪_v)` at almost every place. -/
theorem exists_productLevel_le [Algebra.FiniteType F H] (M : IntegralModel F H S)
    (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H))
    (hU : IsCompact (U : Set (AdelicPoints.FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (AdelicPoints.FiniteAdelicPoints F H))) :
    ∃ (V : ∀ v, Subgroup (AdelicPoints.LocalPoints F H v))
      (hV : ∀ᶠ v in Filter.cofinite, V v = M.levelFamily v),
      (∀ v, IsCompact (V v : Set (AdelicPoints.LocalPoints F H v)) ∧
        IsOpen (V v : Set (AdelicPoints.LocalPoints F H v))) ∧ M.productLevel V hV ≤ U := by
  sorry

theorem exists_le_productLevel [Algebra.FiniteType F H] (M : IntegralModel F H S)
    (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H))
    (hU : IsCompact (U : Set (AdelicPoints.FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (AdelicPoints.FiniteAdelicPoints F H))) :
    ∃ (V : ∀ v, Subgroup (AdelicPoints.LocalPoints F H v))
      (hV : ∀ᶠ v in Filter.cofinite, V v = M.levelFamily v),
      (∀ v, IsCompact (V v : Set (AdelicPoints.LocalPoints F H v)) ∧
        IsOpen (V v : Set (AdelicPoints.LocalPoints F H v))) ∧ U ≤ M.productLevel V hV := by
  sorry

/-- AA.1 target *finite support conjugate*: conjugating a product level changes it only at the finitely
many places where `g` is not integral. -/
theorem conj_productLevel [Algebra.FiniteType F H] (M : IntegralModel F H S)
    (V : ∀ v, Subgroup (AdelicPoints.LocalPoints F H v))
    (hV : ∀ᶠ v in Filter.cofinite, V v = M.levelFamily v)
    (g : AdelicPoints.FiniteAdelicPoints F H) :
    ∃ hV' : ∀ᶠ v in Filter.cofinite,
        (V v).map (MulAut.conj (restrictedProductEquiv M g v)).toMonoidHom = M.levelFamily v,
      (M.productLevel V hV).map (MulAut.conj g).toMonoidHom =
        M.productLevel (fun v => (V v).map (MulAut.conj (restrictedProductEquiv M g v)).toMonoidHom)
          hV' := by
  sorry

/-- The integral level `∏_v 𝓗(𝒪_v)` (the whole local group at `v ∈ S`). -/
def integralLevel [Algebra.FiniteType F H] (M : IntegralModel F H S) :
    Subgroup (AdelicPoints.FiniteAdelicPoints F H) :=
  M.productLevel M.levelFamily (Filter.Eventually.of_forall fun _ => rfl)

/-- Every finite adelic point is `g_B * u` with `g_B` supported on a finite set `B` and `u` in the
integral level. -/
theorem exists_finiteSupport_mul [Algebra.FiniteType F H] (M : IntegralModel F H S)
    (g : AdelicPoints.FiniteAdelicPoints F H) :
    ∃ (B : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)))
      (gB u : AdelicPoints.FiniteAdelicPoints F H),
      (∀ v ∉ B, restrictedProductEquiv M gB v = 1) ∧ u ∈ M.integralLevel ∧ g = gB * u := by
  sorry

/-- AA.1 target *finite adeles directed union*: the `S'`-adeles `∏_{v ∈ S'} F_v × ∏_{v ∉ S'} 𝒪_v`. -/
def sAdeles (S' : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))) :
    Subring (IsDedekindDomain.FiniteAdeleRing (NumberField.RingOfIntegers F) F) where
  carrier := {x | ∀ v ∉ S', x v ∈ v.adicCompletionIntegers F}
  zero_mem' := sorry
  one_mem' := sorry
  add_mem' := sorry
  mul_mem' := sorry
  neg_mem' := sorry

theorem isOpen_sAdeles
    (S' : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))) :
    IsOpen (sAdeles (F := F) S' :
      Set (IsDedekindDomain.FiniteAdeleRing (NumberField.RingOfIntegers F) F)) := by
  sorry

theorem sAdeles_mono {S₁ S₂ : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))}
    (h : S₁ ⊆ S₂) : sAdeles (F := F) S₁ ≤ sAdeles S₂ := by
  sorry

theorem iSup_sAdeles : ⨆ S' : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)),
    sAdeles (F := F) S' = ⊤ := by
  sorry

/-- Every finite adelic point takes integral values on the model outside a larger finite set. -/
theorem exists_sAdeles [Algebra.FiniteType F H] (M : IntegralModel F H S)
    (x : AdelicPoints.FiniteAdelicPoints F H) :
    ∃ T, S ⊆ T ∧ ∀ h : M.coordinate,
      (x.ofConv (M.baseChangeIso.hom.hom (1 ⊗ₜ[AdelicSIntegers F S] h)) :
        IsDedekindDomain.FiniteAdeleRing (NumberField.RingOfIntegers F) F) ∈ sAdeles T := by
  sorry

end IntegralModel

namespace AdelicPoints

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- `H` as an object of the finite-type Hopf algebra category, for reductivity hypotheses. -/
abbrev finiteTypeObj [Algebra.FiniteType F H] : TauCeti.FiniteTypeCommHopfAlgCat F :=
  ⟨CommHopfAlgCat.of F H, (inferInstance : Algebra.FiniteType F H)⟩

/-- AA.1 target *local unimodular reductive*: `G(F_v)` is unimodular for connected reductive `G`. -/
theorem modularCharacter_local_eq_one [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H))
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    MeasureTheory.Measure.modularCharacter (G := LocalPoints F H v) = 1 := by
  sorry

/-- AA.1 target *unimodular reductive*: `G(𝔸_F)`, `G(𝔸_{F,f})` and `G(F_∞)` are unimodular. -/
theorem modularCharacter_eq_one [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) :
    MeasureTheory.Measure.modularCharacter (G := AdelicPoints F H) = 1 ∧
      MeasureTheory.Measure.modularCharacter (G := FiniteAdelicPoints F H) = 1 ∧
      MeasureTheory.Measure.modularCharacter (G := InfinitePoints F H) = 1 := by
  sorry

/-- AA.1 target *center adelic*, for a central Hopf ideal `I` (the centre is the case
`I = centerDefiningIdeal`): its adelic points are central in `G(𝔸_F)`, and `I(F) = I(𝔸_F) ∩ G(F)`. -/
theorem quotientPointsSubgroup_le_center (I : TauCeti.HopfIdeal F (CommHopfAlgCat.of F H))
    (hI : I.IsCentral) :
    (TauCeti.CommHopfAlgCat.quotientPointsSubgroup (CommHopfAlgCat.of F H) I
      (CommAlgCat.of F (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)) :
        Set (AdelicPoints F H)) ⊆ Subgroup.center (AdelicPoints F H) := by
  sorry

theorem diagonal_mem_quotientPointsSubgroup_iff (I : TauCeti.HopfIdeal F (CommHopfAlgCat.of F H))
    (g : WithConv (H →ₐ[F] F)) :
    diagonal F H g ∈ (TauCeti.CommHopfAlgCat.quotientPointsSubgroup (CommHopfAlgCat.of F H) I
      (CommAlgCat.of F (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)) :
        Set (AdelicPoints F H)) ↔
      g ∈ (TauCeti.CommHopfAlgCat.quotientPointsSubgroup (CommHopfAlgCat.of F H) I
        (CommAlgCat.of F F) : Set (WithConv (H →ₐ[F] F))) := by
  sorry

end AdelicPoints

namespace MeasureTheory.Measure
open _root_.MeasureTheory.Measure

variable {G : Type*} [TopologicalSpace G] [Group G] [IsTopologicalGroup G] [LocallyCompactSpace G]

/-- AA.1 target *modular character trivial compact centre*. -/
theorem modularCharacter_eq_one_of_mem_compact {K : Subgroup G} (hK : IsCompact (K : Set G))
    {g : G} (hg : g ∈ K) : modularCharacter g = 1 := by
  sorry

theorem modularCharacter_eq_one_of_mem_center {g : G} (hg : g ∈ Subgroup.center G) :
    modularCharacter g = 1 := by
  sorry

theorem modularCharacter_conj (g h : G) :
    modularCharacter (h * g * h⁻¹) = modularCharacter g := by
  sorry

end MeasureTheory.Measure

/-! Layer 2: The idele norm, the Harish-Chandra map and the norm-one subgroup.

`NumberField.ideleNorm` is the idele norm of the Global number fields roadmap, layer 6, written
out here from the normalized absolute values so that `H_G` can be stated; that layer's
declaration replaces it. -/

namespace NumberField
open _root_.NumberField

variable (K : Type) [Field K] [NumberField K]

/-- The idele norm `‖x‖ = ∏_w |x_w|_w^{m_w} · ∏_v |x_v|_v`, with `m_w = 2` at complex places and
the finite factors normalized by `|ϖ_v|_v = q_v⁻¹`. -/
def ideleNorm (x : IdeleGroup (RingOfIntegers K) K) : ℝ :=
  (∏ w : InfinitePlace K, ‖adeleInfPart K (x : AdeleRing (RingOfIntegers K) K) w‖ ^ w.mult) *
    ∏ᶠ v : IsDedekindDomain.HeightOneSpectrum (RingOfIntegers K),
      ((TauCeti.normalizedAbsoluteValue (v.adicCompletion K)
        (RingHom.snd _ _ (x : AdeleRing (RingOfIntegers K) K) v) : ℚ≥0) : ℝ)

theorem ideleNorm_pos (x : IdeleGroup (RingOfIntegers K) K) : 0 < ideleNorm K x := by
  sorry

theorem ideleNorm_mul (x y : IdeleGroup (RingOfIntegers K) K) :
    ideleNorm K (x * y) = ideleNorm K x * ideleNorm K y := by
  sorry

theorem continuous_ideleNorm : Continuous (ideleNorm K) := by
  sorry

/-- The product formula. -/
theorem ideleNorm_principal (k : Kˣ) :
    ideleNorm K (Units.map (algebraMap K (AdeleRing (RingOfIntegers K) K)) k) = 1 := by
  sorry

/-- The norm-one ideles `𝔸_K^1`. -/
def normOneIdeles : Subgroup (IdeleGroup (RingOfIntegers K) K) where
  carrier := {x | ideleNorm K x = 1}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

end NumberField

/-- AA.2 target *real character space*: `a_G` with its finite-dimensional real topology. -/
instance RealCharacterSpace.instTopologicalSpace {F : Type} [Field F] {H : Type} [CommRing H]
    [HopfAlgebra F H] : TopologicalSpace (RealCharacterSpace F H) :=
  moduleTopology ℝ _

namespace AdelicPoints

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- AA.2 target *log height*: the Harish-Chandra map `H_G : G(𝔸_F) → a_G`,
`⟨H_G(x), χ⟩ = log ‖χ(x)‖`. -/
def logHeight : AdelicPoints F H →* Multiplicative (RealCharacterSpace F H) where
  toFun x := Multiplicative.ofAdd
    { toFun := fun χ => Real.log (NumberField.ideleNorm F
        (RationalCharacter.apply (Additive.toMul χ) x))
      map_zero' := sorry
      map_add' := sorry }
  map_one' := sorry
  map_mul' := sorry

theorem logHeight_apply (x : AdelicPoints F H) (χ : RationalCharacter F H) :
    RealCharacterSpace.pairing (Multiplicative.toAdd (logHeight F H x)) χ =
      Real.log (NumberField.ideleNorm F (RationalCharacter.apply χ x)) := by
  sorry

theorem continuous_logHeight : Continuous (logHeight F H) := by
  sorry

/-- AA.2 target *log height rational*: `H_G` vanishes on `G(F)`, by the product formula. -/
theorem logHeight_diagonal (g : WithConv (H →ₐ[F] F)) : logHeight F H (diagonal F H g) = 1 := by
  sorry

theorem logHeight_map {H' : Type} [CommRing H'] [HopfAlgebra F H'] (φ : H' →ₐc[F] H)
    (x : AdelicPoints F H) :
    Multiplicative.toAdd (logHeight F H' (map F H φ x)) =
      RealCharacterSpace.map φ (Multiplicative.toAdd (logHeight F H x)) := by
  sorry

theorem logHeight_compact (K : Subgroup (AdelicPoints F H))
    (hK : IsCompact (K : Set (AdelicPoints F H))) : K ≤ (logHeight F H).ker := by
  sorry

/-- The character `T` of `G_m`. -/
def gmCharacter : RationalCharacter F (LaurentPolynomial F) :=
  ⟨LaurentPolynomial.T 1, sorry⟩

-- Test AdelicPoints.logHeight_gm: for `G_m`, `H_G` is the logarithm of the idele norm.
example (x : AdelicPoints F (LaurentPolynomial F)) :
    RealCharacterSpace.pairing (Multiplicative.toAdd (logHeight F (LaurentPolynomial F) x))
        (gmCharacter F) =
      Real.log (NumberField.ideleNorm F (gmEquiv F x)) := by
  sorry

-- Test AdelicPoints.logHeight_sln: `H_G` vanishes identically on `SL_n`.
example (n : ℕ) (x : AdelicPoints F (TauCeti.SpecialLinear.coordinateHopfAlgebra F n)) :
    logHeight F (TauCeti.SpecialLinear.coordinateHopfAlgebra F n) x = 1 := by
  sorry

-- Test AdelicPoints.logHeight_not_infinite_only: over `ℚ` an idele with archimedean component `1`
-- can have norm different from `1`, so `H_G` is not computed at the archimedean places alone.
example : ∃ x : NumberField.IdeleGroup (NumberField.RingOfIntegers ℚ) ℚ,
    NumberField.adeleInfPart ℚ (x : NumberField.AdeleRing (NumberField.RingOfIntegers ℚ) ℚ) = 1 ∧
      NumberField.ideleNorm ℚ x ≠ 1 := by
  sorry

/-- AA.2 target *norm one subgroup*: `G(𝔸_F)^1 = ker H_G`. -/
def normOne : Subgroup (AdelicPoints F H) := (logHeight F H).ker

theorem isClosed_normOne : IsClosed (normOne F H : Set (AdelicPoints F H)) := by
  sorry

theorem normOne_normal : (normOne F H).Normal := by
  sorry

theorem diagonal_mem_normOne (g : WithConv (H →ₐ[F] F)) : diagonal F H g ∈ normOne F H := by
  sorry

theorem mem_normOne_iff (x : AdelicPoints F H) :
    x ∈ normOne F H ↔ ∀ χ : RationalCharacter F H,
      NumberField.ideleNorm F (RationalCharacter.apply χ x) = 1 := by
  sorry

theorem normOne_eq_top_of_no_characters [Subsingleton (RationalCharacter F H)] :
    normOne F H = ⊤ := by
  sorry

theorem commutator_le_normOne : commutator (AdelicPoints F H) ≤ normOne F H := by
  sorry

-- Test AdelicPoints.normOne_gm: for `G_m` the norm-one subgroup is `𝔸_F^1`.
example : (normOne F (LaurentPolynomial F)).map (gmEquiv F).toMonoidHom =
    NumberField.normOneIdeles F := by
  sorry

-- Test AdelicPoints.normOne_sl2: `SL_2(𝔸_F)^1 = SL_2(𝔸_F)`.
example : normOne F (TauCeti.SpecialLinear.coordinateHopfAlgebra F 2) = ⊤ := by
  sorry

-- Test AdelicPoints.normOne_not_finite_part: over `ℚ` a norm-one idele need not have norm-one
-- archimedean component, so `𝔸^1 ≠ (𝔸_∞)^1 × 𝔸_f^×`.
example : ∃ x ∈ NumberField.normOneIdeles ℚ,
    ‖NumberField.adeleInfPart ℚ (x : NumberField.AdeleRing (NumberField.RingOfIntegers ℚ) ℚ)
      (NumberField.InfinitePlace.mk (Rat.castHom ℂ))‖ ≠ 1 := by
  sorry

/-- AA.2 target *split centre*: `A_G(ℝ)^0`, the identity component of the real points of the largest
`ℚ`-split central torus of `Res_{F/ℚ} G`, inside the archimedean factor `G(F_∞)`; the Weil
restriction is ReductiveGroupsPartII, RG2.0a. -/
def SplitComponent : Subgroup (AdelicPoints F H) := sorry

theorem splitComponent_le_infinite :
    SplitComponent F H ≤ (finiteProjection F H).ker := by
  sorry

theorem SplitComponent.central : SplitComponent F H ≤ Subgroup.center (AdelicPoints F H) := by
  sorry

theorem SplitComponent.inter_normOne [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) :
    SplitComponent F H ⊓ normOne F H = ⊥ := by
  sorry

/-- AA.2 target *log height split centre iso*: `H_G` restricts to an isomorphism `A_G(ℝ)^0 ≃ a_G`. -/
def SplitComponent.logHeight_equiv [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) :
    SplitComponent F H ≃ₜ* Multiplicative (RealCharacterSpace F H) :=
  sorry

theorem SplitComponent.logHeight_equiv_apply [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) (a : SplitComponent F H) :
    SplitComponent.logHeight_equiv F H hred a = logHeight F H a := by
  sorry

theorem logHeight_surjective [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) :
    Function.Surjective (logHeight F H) := by
  sorry

/-- AA.2 target *split centre decomposition*: `G(𝔸)^1 × A_G(ℝ)^0 → G(𝔸)` is an isomorphism. -/
def normOneSplitEquiv [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) :
    (normOne F H × SplitComponent F H) ≃ₜ AdelicPoints F H :=
  sorry

theorem normOneSplitEquiv_apply [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H))
    (x : normOne F H × SplitComponent F H) :
    normOneSplitEquiv F H hred x = (x.1 : AdelicPoints F H) * x.2 := by
  sorry

/-- AA.2 target *quotient norm one comparison*: `G(F)\G(𝔸)^1 ≃ G(F)\G(𝔸)/A_G(ℝ)^0`. -/
def normOneQuotientHomeomorph [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) :
    MulAction.orbitRel.Quotient ((diagonal F H).range.subgroupOf (normOne F H)) (normOne F H) ≃ₜ
      MulAction.orbitRel.Quotient (diagonal F H).range (AdelicPoints F H ⧸ SplitComponent F H) :=
  sorry

theorem normOneQuotientHomeomorph_mk [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) (x : normOne F H) :
    normOneQuotientHomeomorph F H hred (Quotient.mk'' x) =
      Quotient.mk'' ((x : AdelicPoints F H) : AdelicPoints F H ⧸ SplitComponent F H) := by
  sorry

-- Test SplitComponent.semisimple_trivial: without rational characters the split component is
-- trivial.
example [Subsingleton (RationalCharacter F H)] [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) :
    SplitComponent F H = ⊥ := by
  sorry

-- Test SplitComponent.gm_number_field: for `G_m` over `F`, `a_G` is one-dimensional, while the
-- positive archimedean units `(F ⊗ ℝ)^×_{>0}` have dimension `r₁ + r₂`.
example : Module.finrank ℝ (RealCharacterSpace F (LaurentPolynomial F)) = 1 := by
  sorry

-- Test SplitComponent.gln_scalars: for `GL_n` over `ℚ`, `A_G(ℝ)^0` is homeomorphic to `ℝ`.
example (n : ℕ) (hn : 0 < n) :
    Nonempty (SplitComponent ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n) ≃ₜ ℝ) := by
  sorry

end AdelicPoints

/-! Layer 2: A gauge form is a nonzero vector in the invariant top-form line below.
For smooth finite-type groups, the cotangent dimension is the group dimension. -/

namespace GaugeForm
variable (k : Type*) [Field k] (H : Type*) [CommRing H] [HopfAlgebra k H]

abbrev augmentationIdeal := TauCeti.Bialgebra.AugmentationIdeal k H

abbrev cotangent := TauCeti.Bialgebra.CotangentSpace k H
end GaugeForm

abbrev GaugeForm (k : Type*) [Field k] (H : Type*) [CommRing H] [HopfAlgebra k H] :=
  ⋀[k]^(Module.finrank k (GaugeForm.cotangent k H)) (GaugeForm.cotangent k H)

namespace GaugeForm
variable (k : Type*) [Field k] (H : Type*) [CommRing H] [HopfAlgebra k H]

theorem finrank_eq_one [FiniteDimensional k (cotangent k H)] :
    Module.finrank k (GaugeForm k H) = 1 := by
  sorry

-- Test GaugeForm.trivial_group: the degree-zero exterior power is the scalar field.
example : Nonempty (GaugeForm k k ≃ₗ[k] k) := by
  sorry
end GaugeForm

namespace GaugeForm
variable {k : Type} [Field k] {H : Type} [CommRing H] [HopfAlgebra k H]

/-- Cotangent scalar extension induces the canonical top-exterior-power comparison. -/
def baseChange (K : Type) [Field K] [Algebra k K]
    [Algebra.FiniteType k H] :
    K ⊗[k] GaugeForm k H ≃ₗ[K] GaugeForm K (K ⊗[k] H) := sorry

def gmCotangentGenerator : cotangent k (LaurentPolynomial k) :=
  (augmentationIdeal k (LaurentPolynomial k)).toCotangent ⟨LaurentPolynomial.T 1 - 1, by sorry⟩

-- Test GaugeForm.gm: the class of T-1 spans the actual cotangent space at the identity.
example : Submodule.span k {gmCotangentGenerator (k := k)} =
    (⊤ : Submodule k (cotangent k (LaurentPolynomial k))) ∧
    gmCotangentGenerator (k := k) ≠ 0 := by
  sorry
end GaugeForm

namespace GaugeForm
variable {k : Type} [Field k] {H : Type} [CommRing H] [HopfAlgebra k H]
  [FiniteDimensional k (cotangent k H)]

/-- The actual pinned adjoint action, after the canonical k-tensor unit comparison. -/
def adjointLinearEquiv (g : TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of k k)) :
    Module.Dual k (cotangent k H) ≃ₗ[k] Module.Dual k (cotangent k H) :=
  ((TensorProduct.lid k (Module.Dual k (cotangent k H))).symm.trans
    ((Derivation.adjointAction (R := k) (H := H) (CommAlgCat.of k k) g).toLinearEquiv)).trans
      (TensorProduct.lid k (Module.Dual k (cotangent k H)))

/-- Pullback on identity cotangents is the transpose of Ad(g⁻¹). -/
def rightCotangent (g : TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of k k)) :
    cotangent k H ≃ₗ[k] cotangent k H :=
  ((Module.evalEquiv k (cotangent k H)).trans
    (adjointLinearEquiv g⁻¹).dualMap).trans (Module.evalEquiv k (cotangent k H)).symm

/-- Algebraic right pullback on the invariant top-form line. Its comparison with sections
of the differential-form sheaf is an additional structural contract. -/
def rightTranslate (g : TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of k k)) :
    GaugeForm k H →ₗ[k] GaugeForm k H :=
  exteriorPower.map (Module.finrank k (cotangent k H)) (rightCotangent g).toLinearMap

theorem rightTranslate_eq_det_inv
    (g : TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of k k)) (ω : GaugeForm k H) :
    rightTranslate g ω = (LinearMap.det (adjointLinearEquiv g).toLinearMap)⁻¹ • ω := by
  sorry

example (ω : GaugeForm k H) : rightTranslate (1 : TauCeti.HopfAlgebra.points
    (H := H) (CommAlgCat.of k k)) ω = ω := by
  sorry
end GaugeForm

/-! Layer 2: Quotient integration: stages, volumes and the averaging map. -/

namespace QuotientMeasure

variable {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [T2Space G] [LocallyCompactSpace G] [SecondCountableTopology G]
  [MeasurableSpace G] [BorelSpace G]
  (H : Subgroup G) [Fact (IsClosed (H : Set G))] [LocallyCompactSpace H]

/-- AA.2 target *bruhat section*: fibre averaging `C_c(G) → C_c(H\G)` is surjective, and nonnegative
functions have nonnegative preimages. -/
theorem average_surjective (ν : Measure H) (hν : IsRightHaar ν) (φ : Cosets H → ℝ)
    (hφ : Continuous φ) (hφc : HasCompactSupport φ) :
    ∃ f : G → ℝ, Continuous f ∧ HasCompactSupport f ∧ average H ν hν f = φ ∧
      ((∀ q, 0 ≤ φ q) → ∀ g, 0 ≤ f g) := by
  sorry

/-- AA.2 target *quotient functional well defined*: under `Δ_G|_H = Δ_H`, `Pf = 0` forces `∫ f = 0`. -/
theorem integral_eq_zero_of_average_eq_zero (μ : Measure G) (ν : Measure H)
    (hμ : IsRightHaar μ) (hν : IsRightHaar ν)
    (hmod : ∀ h : H, Measure.modularCharacter (h : G) = Measure.modularCharacter h)
    (f : G → ℝ) (hf : Continuous f) (hfc : HasCompactSupport f) (h0 : average H ν hν f = 0) :
    ∫ g, f g ∂μ = 0 := by
  sorry

/-- The canonical identification of `H` with its copy inside `H₂`. -/
def subgroupOfEquiv (H₂ : Subgroup G) (hle : H ≤ H₂) : H ≃ₜ* H.subgroupOf H₂ :=
  sorry

theorem subgroupOfEquiv_apply (H₂ : Subgroup G) (hle : H ≤ H₂) (h : H) :
    ((subgroupOfEquiv H H₂ hle h : H₂) : G) = h := by
  sorry

/-- AA.2 target *quotient measure transitivity*: integration over `H₁\G` in stages through `H₂\G` and
`H₁\H₂`, for nonnegative measurable functions on `H₁\G`. The smaller subgroup's Haar measure
is transported to its copy inside `H₂`; the inner measure is the resulting quotient measure. -/
theorem lintegral_trans (H₂ : Subgroup G) [Fact (IsClosed (H₂ : Set G))] [LocallyCompactSpace H₂]
    (hle : H ≤ H₂) (μ : Measure G) (ν₂ : Measure H₂) (ν₁ : Measure H)
    (hμ : IsRightHaar μ) (hν₂ : IsRightHaar ν₂) (hν₁ : IsRightHaar ν₁)
    (hmod₂ : ∀ h : H₂, Measure.modularCharacter (h : G) = Measure.modularCharacter h)
    (hmod₁ : ∀ h : H, Measure.modularCharacter (h : G) = Measure.modularCharacter h)
    (f : Cosets H → ℝ≥0∞) (hf : Measurable f) :
    let H₁₂ := H.subgroupOf H₂
    letI : Fact (IsClosed (H₁₂ : Set H₂)) := ⟨by sorry⟩
    letI : LocallyCompactSpace H₁₂ := by sorry
    let ν₁₂ := Measure.map (subgroupOfEquiv H H₂ hle) ν₁
    let hν₁₂ : IsRightHaar ν₁₂ := by sorry
    let hmod₁₂ : ∀ h : H₁₂,
        Measure.modularCharacter (h : H₂) = Measure.modularCharacter h := by sorry
    (∫⁻ q, f q ∂(measure H μ ν₁ hμ hν₁ hmod₁)) =
      ∫⁻ q₂, Quotient.liftOn q₂ (fun g =>
        ∫⁻ q₁₂, Quotient.liftOn q₁₂
          (fun h₂ : H₂ => f (Quotient.mk _ ((h₂ : G) * g))) (by sorry)
          ∂(measure H₁₂ ν₂ ν₁₂ hν₂ hν₁₂ hmod₁₂)) (by sorry)
        ∂(measure H₂ μ ν₂ hμ hν₂ hmod₂) := by
  sorry

end QuotientMeasure

namespace QuotientMeasure

variable {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [MeasurableSpace G] [BorelSpace G]

/-- AA.2 target *compact open volume*: `μ(U) [U' : U ∩ U'] = μ(U') [U : U ∩ U']` for compact open
subgroups and a left Haar measure. -/
theorem measure_mul_relIndex (μ : Measure G) [μ.IsHaarMeasure] (U U' : Subgroup G)
    (hU : IsCompact (U : Set G)) (hUo : IsOpen (U : Set G))
    (hU' : IsCompact (U' : Set G)) (hU'o : IsOpen (U' : Set G)) :
    μ U * ((U ⊓ U').relIndex U' : ℝ≥0∞) = μ U' * ((U ⊓ U').relIndex U : ℝ≥0∞) := by
  sorry

end QuotientMeasure

namespace AdelicPoints

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

instance instMeasurableSpace : MeasurableSpace (AdelicPoints F H) := borel _
instance instBorelSpace : BorelSpace (AdelicPoints F H) := ⟨rfl⟩
instance instMeasurableSpaceFinite : MeasurableSpace (FiniteAdelicPoints F H) := borel _
instance instBorelSpaceFinite : BorelSpace (FiniteAdelicPoints F H) := ⟨rfl⟩
instance instMeasurableSpaceInfinite : MeasurableSpace (InfinitePoints F H) := borel _
instance instBorelSpaceInfinite : BorelSpace (InfinitePoints F H) := ⟨rfl⟩
instance instMeasurableSpaceLocal
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    MeasurableSpace (LocalPoints F H v) := borel _
instance instBorelSpaceLocal
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    BorelSpace (LocalPoints F H v) := ⟨rfl⟩

/-- AA.2 target *discrete quotient fundamental domain*: for unimodular `G(𝔸_F)` (for instance `G`
connected reductive), `G(F)` has a Borel fundamental domain in `G(𝔸_F)`, and the quotient measure
does not depend on it. -/
theorem exists_isFundamentalDomain [Algebra.FiniteType F H] (μ : Measure (AdelicPoints F H))
    [μ.IsHaarMeasure] (hunim : Measure.modularCharacter (G := AdelicPoints F H) = 1) :
    ∃ D : Set (AdelicPoints F H), IsFundamentalDomain (diagonal F H).range D μ := by
  sorry

theorem map_restrict_eq_of_isFundamentalDomain [Algebra.FiniteType F H]
    (μ : Measure (AdelicPoints F H)) [μ.IsHaarMeasure]
    (hunim : Measure.modularCharacter (G := AdelicPoints F H) = 1)
    {D D' : Set (AdelicPoints F H)} (hD : IsFundamentalDomain (diagonal F H).range D μ)
    (hD' : IsFundamentalDomain (diagonal F H).range D' μ) :
    Measure.map (fun x : AdelicPoints F H =>
        (Quotient.mk'' x : MulAction.orbitRel.Quotient (diagonal F H).range (AdelicPoints F H)))
        (μ.restrict D) =
      Measure.map (fun x : AdelicPoints F H =>
        (Quotient.mk'' x : MulAction.orbitRel.Quotient (diagonal F H).range (AdelicPoints F H)))
        (μ.restrict D') := by
  sorry

end AdelicPoints

namespace AutomorphicQuotient

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- `[G]^1 = G(F)\G(𝔸_F)^1`. -/
abbrev NormOneQuotient :=
  MulAction.orbitRel.Quotient ((AdelicPoints.diagonal F H).range.subgroupOf
    (AdelicPoints.normOne F H)) (AdelicPoints.normOne F H)

instance : MeasurableSpace (NormOneQuotient F H) := borel _

/-- AA.2 target *automorphic quotient measure*: the measure on `[G]^1` induced by a Haar measure `dx` on
`G(𝔸_F)`, Lebesgue measure on `a_G` normalized by the lattice dual to `X*_F(G)`, the
decomposition `G(𝔸) = G(𝔸)^1 × A_G(ℝ)^0` and counting measure on `G(F)`. -/
def measure [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (μ : Measure (AdelicPoints F H)) : Measure (NormOneQuotient F H) :=
  sorry

/-- Right translation by `G(𝔸)^1` on `[G]^1`. -/
def rightAct (g : AdelicPoints.normOne F H) : NormOneQuotient F H → NormOneQuotient F H :=
  Quotient.map' (· * g) (by sorry)

theorem invariant [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (μ : Measure (AdelicPoints F H)) [μ.IsHaarMeasure] (g : AdelicPoints.normOne F H) :
    Measure.map (rightAct F H g) (measure F H hred μ) = measure F H hred μ := by
  sorry

theorem smul_haar [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (μ : Measure (AdelicPoints F H)) (c : ℝ≥0∞) :
    measure F H hred (c • μ) = c • measure F H hred μ := by
  sorry

instance : MeasurableSpace
    (MulAction.orbitRel.Quotient (AdelicPoints.diagonal F H).range
      (AdelicPoints F H ⧸ AdelicPoints.SplitComponent F H)) := borel _

/-- Its transport to `G(F)A_G(ℝ)^0\G(𝔸_F)` along the norm-one comparison. -/
def measure_split [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (μ : Measure (AdelicPoints F H)) :
    Measure (MulAction.orbitRel.Quotient (AdelicPoints.diagonal F H).range
      (AdelicPoints F H ⧸ AdelicPoints.SplitComponent F H)) :=
  Measure.map (AdelicPoints.normOneQuotientHomeomorph F H hred) (measure F H hred μ)

/-- The transported measure is invariant under right translation by `G(𝔸_F)`. -/
theorem measure_split_invariant [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (μ : Measure (AdelicPoints F H)) [μ.IsHaarMeasure] (g : AdelicPoints F H) :
    Measure.map (Quotient.map' (fun x : AdelicPoints F H ⧸ AdelicPoints.SplitComponent F H =>
        (Quotient.liftOn' x (fun y => ((y * g : AdelicPoints F H) :
          AdelicPoints F H ⧸ AdelicPoints.SplitComponent F H)) (by sorry))) (by sorry))
      (measure_split F H hred μ) = measure_split F H hred μ := by
  sorry

-- Test AutomorphicQuotient.semisimple: without rational characters `G(𝔸)^1 = G(𝔸)`.
example [Subsingleton (RationalCharacter F H)] : AdelicPoints.normOne F H = ⊤ :=
  AdelicPoints.normOne_eq_top_of_no_characters F H

-- Test AutomorphicQuotient.not_full_quotient: `ℚ^×\𝔸_ℚ^×` has infinite volume for every nonzero
-- invariant measure, since the split component `ℝ_{>0}` is not compact; `[GL_1]^1` is compact.
example : CompactSpace (NormOneQuotient ℚ (LaurentPolynomial ℚ)) ∧
    ¬ CompactSpace (MulAction.orbitRel.Quotient (AdelicPoints.diagonal ℚ (LaurentPolynomial ℚ)).range
      (AdelicPoints ℚ (LaurentPolynomial ℚ))) := by
  sorry

-- Test AutomorphicQuotient.gl1_rat: for `GL_1` over `ℚ` with the normalized idele measure,
-- `ℚ^×\𝔸_ℚ^1 ≃ ℤ̂^×` has volume one.
example (hred : TauCeti.reductiveCommHopfAlgProperty ℚ
    (AdelicPoints.finiteTypeObj ℚ (LaurentPolynomial ℚ))) :
    measure ℚ (LaurentPolynomial ℚ) hred
      (Measure.map (AdelicPoints.gmEquiv ℚ).symm (NumberField.ideleHaar ℚ)) Set.univ = 1 := by
  sorry

end AutomorphicQuotient

/-! Layer 2: Gauge-form measures and Tamagawa measures. -/

namespace GaugeForm

variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]

/-- AA.2 target *local form measure*: the Haar measure `|ω|_v` on `G(F_v)`, given in an `F_v`-analytic
chart by `|f(x)|_v dx`, where `φ^*ω = f dx_1 ∧ ⋯ ∧ dx_d` and `𝒪_v` has volume one. -/
def localMeasure (ω : GaugeForm F H)
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    Measure (AdelicPoints.LocalPoints F H v) :=
  sorry

theorem localMeasure_isHaar [Algebra.FiniteType F H] [FiniteDimensional F (cotangent F H)]
    (ω : GaugeForm F H) (hω : ω ≠ 0)
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    (localMeasure ω v).IsHaarMeasure := by
  sorry

theorem localMeasure_smul (ω : GaugeForm F H) (c : F)
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    localMeasure (c • ω) v =
      (((TauCeti.normalizedAbsoluteValue (v.adicCompletion F)
        (algebraMap F (v.adicCompletion F) c) : ℚ≥0) : ℝ≥0) : ℝ≥0∞) • localMeasure ω v := by
  sorry

/-- The diagonal `G(F) → G(F_v)`. -/
def localDiagonal (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    WithConv (H →ₐ[F] F) →* AdelicPoints.LocalPoints F H v :=
  TauCeti.AlgHom.mapValue (H := H) (Algebra.ofId F _)

/-- Right translation scales `|ω|_v` by `|det Ad(g)|_v`, matching Mathlib's
`map (· * g) μ = Δ(g) μ`; here for rational `g`, where `Ad(g)` is the pinned adjoint action. -/
theorem localMeasure_rightTranslate [FiniteDimensional F (cotangent F H)] (ω : GaugeForm F H)
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (g : TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of F F)) :
    Measure.map (· * localDiagonal v g) (localMeasure ω v) =
      (((TauCeti.normalizedAbsoluteValue (v.adicCompletion F)
        (algebraMap F (v.adicCompletion F)
          (LinearMap.det (adjointLinearEquiv g).toLinearMap)) : ℚ≥0) : ℝ≥0) : ℝ≥0∞) •
        localMeasure ω v := by
  sorry

/-- The cotangent class of the coordinate `X` of `G_a`. -/
def gaCotangentGenerator : cotangent F (SymmetricAlgebra F F) :=
  (augmentationIdeal F (SymmetricAlgebra F F)).toCotangent ⟨SymmetricAlgebra.ι F F 1, by sorry⟩

/-- The gauge form `dX` of `G_a`. -/
def gaForm : GaugeForm F (SymmetricAlgebra F F) :=
  exteriorPower.ιMulti F _ (fun _ => gaCotangentGenerator)

/-- The gauge form `dT/T` of `G_m`. -/
def gmForm : GaugeForm F (LaurentPolynomial F) :=
  exteriorPower.ιMulti F _ (fun _ => gmCotangentGenerator)

-- Test GaugeForm.localMeasure_ga: under `x ↦ x(X)`, `|dX|_v` is the Haar measure of `F_v` with
-- `vol(𝒪_v) = 1`.
example (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    [MeasurableSpace (v.adicCompletion F)] [BorelSpace (v.adicCompletion F)]
    (μ : Measure (v.adicCompletion F)) [μ.IsAddHaarMeasure]
    (hμ : μ (v.adicCompletionIntegers F) = 1) :
    Measure.map (fun x : AdelicPoints.LocalPoints F (SymmetricAlgebra F F) v =>
        (x.ofConv (SymmetricAlgebra.ι F F 1) : v.adicCompletion F)) (localMeasure gaForm v) = μ := by
  sorry

-- Test GaugeForm.localMeasure_gm_units: `|dT/T|_v(𝒪_v^×) = 1 - q_v⁻¹`.
example (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    localMeasure gmForm v
        {x | (TauCeti.MultiplicativeGroup.pointsMulEquiv x : v.adicCompletion F) ∈
            v.adicCompletionIntegers F ∧
          (((TauCeti.MultiplicativeGroup.pointsMulEquiv x)⁻¹ : (v.adicCompletion F)ˣ) :
            v.adicCompletion F) ∈ v.adicCompletionIntegers F} =
      1 - ((Ideal.absNorm v.asIdeal : ℝ≥0∞))⁻¹ := by
  sorry

-- Test GaugeForm.localMeasure_not_normalized: `|dT/T|_v` gives `𝒪_v^×` volume `1 - q_v⁻¹ ≠ 1`, so
-- it is not the normalized idele measure of AA.0.
example (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    (1 : ℝ≥0∞) - ((Ideal.absNorm v.asIdeal : ℝ≥0∞))⁻¹ ≠ 1 := by
  sorry

end GaugeForm

namespace Tamagawa

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- AA.2 target *tamagawa measure*: `τ_G = |d_F|^{-d/2} ρ_G⁻¹ ∏_v λ_v |ω|_v`, with the convergence
factors and the convergent Haar product of AA.0. -/
def measure (ω : GaugeForm F H) : Measure (AdelicPoints F H) := sorry

theorem measure_isHaar [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (ω : GaugeForm F H) (hω : ω ≠ 0) : (measure F H ω).IsHaarMeasure := by
  sorry

/-- AA.2 target *tamagawa independent of form*: by the product formula, `τ_G` does not depend on `ω`. -/
theorem measure_smul (ω : GaugeForm F H) (c : F) (hc : c ≠ 0) :
    measure F H (c • ω) = measure F H ω := by
  sorry

/-- For `G_a`, `τ = |d_F|^{-1/2} • adeleHaar`. -/
theorem measure_ga :
    Measure.map (fun x => Multiplicative.toAdd (AdelicPoints.gaEquiv F x))
        (measure F (SymmetricAlgebra F F) GaugeForm.gaForm) =
      (ENNReal.ofReal (|(NumberField.discr F : ℝ)| ^ (-(1 / 2 : ℝ)))) • NumberField.adeleHaar F := by
  sorry

-- Test Tamagawa.measure_trivial: for the trivial group `τ` is the unit point mass.
example (ω : GaugeForm F F) (hω : ω ≠ 0) : measure F F ω = Measure.dirac 1 := by
  sorry

-- Test Tamagawa.measure_not_naive_product: `∏_p (1 - p⁻¹)` tends to `0`, so the unnormalized
-- factors `|dT/T|_p(ℤ_p^×)` have no nonzero product.
example : Filter.Tendsto (fun N : ℕ => ∏ p ∈ Finset.filter Nat.Prime (Finset.range N),
    (1 - (p : ℝ)⁻¹)) Filter.atTop (𝓝 0) := by
  sorry

/-- AA.2 target *tamagawa number*: `τ(G) = vol(G(F)\G(𝔸_F)^1)`. -/
def number [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (ω : GaugeForm F H) : ℝ≥0∞ :=
  AutomorphicQuotient.measure F H hred (measure F H ω) Set.univ

theorem number_pos [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (ω : GaugeForm F H) (hω : ω ≠ 0) : 0 < number F H hred ω := by
  sorry

theorem number_smul [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (ω : GaugeForm F H) (c : F) (hc : c ≠ 0) : number F H hred (c • ω) = number F H hred ω := by
  sorry

-- Test Tamagawa.number_gm_statement: `τ(G_m) = 1` over every number field.
example (hred : TauCeti.reductiveCommHopfAlgProperty F
    (AdelicPoints.finiteTypeObj F (LaurentPolynomial F))) :
    number F (LaurentPolynomial F) hred GaugeForm.gmForm = 1 := by
  sorry

-- Test Tamagawa.number_trivial: `τ = 1` for the trivial group.
example (hred : TauCeti.reductiveCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F F))
    (ω : GaugeForm F F) (hω : ω ≠ 0) : number F F hred ω = 1 := by
  sorry

-- Test Tamagawa.measure_ga_selfdual: for `G_a` over `ℚ`, every measurable fundamental domain of `ℚ`
-- in `𝔸_ℚ` (for instance `[0, 1) × ℤ̂`) has Tamagawa volume one.
example (D : Set (NumberField.AdeleRing (NumberField.RingOfIntegers ℚ) ℚ))
    (hD : MeasureTheory.IsAddFundamentalDomain
      (algebraMap ℚ (NumberField.AdeleRing (NumberField.RingOfIntegers ℚ) ℚ)).range.toAddSubgroup D
        (NumberField.adeleHaar ℚ)) :
    measure ℚ (SymmetricAlgebra ℚ ℚ) GaugeForm.gaForm
      {x | Multiplicative.toAdd (AdelicPoints.gaEquiv ℚ x) ∈ D} = 1 := by
  sorry

-- Test Tamagawa.number_not_full_quotient: `G_m(F)\G_m(𝔸_F)` has infinite volume: every
-- fundamental domain of `F^×` in `G_m(𝔸_F)` has infinite Haar measure.
example (μ : Measure (AdelicPoints F (LaurentPolynomial F))) [μ.IsHaarMeasure]
    (D : Set (AdelicPoints F (LaurentPolynomial F)))
    (hD : IsFundamentalDomain (AdelicPoints.diagonal F (LaurentPolynomial F)).range D μ) :
    μ D = ⊤ := by
  sorry

end Tamagawa

namespace Neat

/-- AA.4 target *neat element*: an automorphism is neat if its eigenvalues generate a torsion-free
subgroup of `ℂ^×`. -/
def IsNeatAut {n : ℕ} (α : GL (Fin n) ℂ) : Prop :=
  ∀ z ∈ Subgroup.closure {z : ℂˣ | Module.End.HasEigenvalue (Matrix.toLin' (α : Matrix (Fin n) (Fin n) ℂ)) z},
    IsOfFinOrder z → z = 1

variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]

/-- Evaluate an actual algebraic representation in Hopf coordinates on rational points,
then extend entries along the specified embedding into C. The map on coordinate rings is
contravariant: O(GL_n)→O(G). The imported points equivalence uses ordinary matrix order. -/
def algebraicPointMap (τ : F →+* ℂ) (n : ℕ)
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F n →ₐc[F] H) :
    WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ where
  toFun g := Matrix.GeneralLinearGroup.map τ
    (TauCeti.GeneralLinear.pointsMulEquiv (R := F) n
      (WithConv.toConv (g.ofConv.comp
        (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F n →ₐ[F] H))))
  map_one' := sorry
  map_mul' := sorry

/-- The point action comes from an algebraic representation, not an arbitrary abstract
homomorphism of G(F). This predicate spells out its existing coordinate-ring carrier. -/
def IsAlgebraicPointHom (τ : F →+* ℂ) (n : ℕ)
    (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) : Prop :=
  ∃ r : TauCeti.GeneralLinear.coordinateHopfAlgebra F n →ₐc[F] H,
    ρ = algebraicPointMap τ n r

/-- Faithful algebraic means a closed immersion, hence a surjection on coordinate rings.
Injectivity on F-rational points alone is not the algebraicity/faithfulness hypothesis. -/
def IsFaithfulAlgebraicPointHom (τ : F →+* ℂ) (n : ℕ)
    (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) : Prop :=
  ∃ r : TauCeti.GeneralLinear.coordinateHopfAlgebra F n →ₐc[F] H,
    Function.Surjective r ∧ ρ = algebraicPointMap τ n r

/-- Neatness relative to the supplied matrix action. The algebraic-group notion chooses a
faithful algebraic action; its independence is the theorem below with those hypotheses. -/
def IsNeat (n : ℕ) (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) (g : WithConv (H →ₐ[F] F)) : Prop :=
  IsNeatAut (ρ g)

def IsNeatSubgroup (n : ℕ) (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) (Γ : Subgroup (WithConv (H →ₐ[F] F))) : Prop :=
  ∀ g ∈ Γ, IsNeat n ρ g

variable (n : ℕ) (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ)

theorem IsNeat.pow {g : WithConv (H →ₐ[F] F)} (h : IsNeat n ρ g) (k : ℕ) : IsNeat n ρ (g ^ k) := by
  sorry

theorem IsNeat.torsion_eq_one (hρ : Function.Injective ρ) {g : WithConv (H →ₐ[F] F)} (h : IsNeat n ρ g)
    (hg : IsOfFinOrder g) : g = 1 := by
  sorry

/-- AA.4 target *neat representation independence*: this direction permits nonfaithful σ,
but both representations must be algebraic over the same embedded coefficient field. -/
theorem isNeat_of_faithful [Algebra.FiniteType F H] (m : ℕ) (σ : WithConv (H →ₐ[F] F) →* GL (Fin m) ℂ)
    (τ : F →+* ℂ) (hρ : IsFaithfulAlgebraicPointHom τ n ρ)
    (hσ : IsAlgebraicPointHom τ m σ)
    (g : WithConv (H →ₐ[F] F)) (h : IsNeat n ρ g) : IsNeat m σ g := by
  sorry

-- Test Neat.isNeat_diag
example : IsNeatAut (Matrix.GeneralLinearGroup.mkOfDetNeZero (Matrix.diagonal ![(2 : ℂ), 1/2])
    (by simp [Matrix.det_diagonal, Fin.prod_univ_two])) := by
  sorry

-- Test Neat.isNeat_one
example : IsNeatAut (1 : GL (Fin n) ℂ) := by
  sorry

-- Test Neat.not_isNeat_rotation
example : ¬ IsNeatAut (Matrix.GeneralLinearGroup.mkOfDetNeZero !![(0 : ℂ), -1; 1, -1]
    (by simp [Matrix.det_fin_two_of])) := by
  sorry
end Neat

namespace Neat
variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]
  (n : ℕ) (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ)

/-- Relative-to-ρ form of neat level. The algebraic-group API fixes ρ to be a faithful
algebraic representation; independence is `isNeat_of_faithful` in both directions.
`rationalLevelAt U g = G(F) ∩ g U g⁻¹`, through `AdelicPoints.finiteDiagonal`. -/
def rationalLevelAt (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H))
    (g : AdelicPoints.FiniteAdelicPoints F H) : Subgroup (WithConv (H →ₐ[F] F)) :=
  U.comap ((MulAut.conj g⁻¹).toMonoidHom.comp (AdelicPoints.finiteDiagonal F H))

def IsNeatLevel (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H)) : Prop :=
  ∀ g : AdelicPoints.FiniteAdelicPoints F H, IsNeatSubgroup n ρ (rationalLevelAt U g)

theorem IsNeatLevel.mono {U U' : Subgroup (AdelicPoints.FiniteAdelicPoints F H)}
    (h : IsNeatLevel n ρ U) (hU : U' ≤ U) : IsNeatLevel n ρ U' := by
  sorry

theorem IsNeatLevel.conj (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H))
    (g : AdelicPoints.FiniteAdelicPoints F H) :
    IsNeatLevel n ρ (U.map (MulAut.conj g).toMonoidHom) ↔ IsNeatLevel n ρ U := by
  sorry

theorem IsNeatLevel.torsionFree (hρ : Function.Injective ρ)
    {U : Subgroup (AdelicPoints.FiniteAdelicPoints F H)} (h : IsNeatLevel n ρ U)
    (g : AdelicPoints.FiniteAdelicPoints F H)
    (γ : WithConv (H →ₐ[F] F)) (hγ : γ ∈ rationalLevelAt U g) (ht : IsOfFinOrder γ) : γ = 1 := by
  sorry

-- Test Neat.isNeatLevel_trivial_group at the actual trivial Hopf algebra.
example (ρ : WithConv (F →ₐ[F] F) →* GL (Fin n) ℂ)
    (U : Subgroup (AdelicPoints.FiniteAdelicPoints F F)) : IsNeatLevel n ρ U := by
  sorry
end Neat

/-! ## Layer 4: Approximation

`G(F_S) = ∏_{w ∈ S_∞} G(F_w) × ∏_{v ∈ S_f} G(F_v)` for a finite set of archimedean places `S_∞` and
of finite places `S_f`. Strong approximation is stated for sets `S` containing every archimedean
place, the case the sources use, in the equivalent form "`G(F) G(F_S)` is dense in `G(𝔸_F)`". -/

namespace Approximation

open _root_.NumberField NumberField

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- `G(F_w)` at an archimedean place, with the evaluation topology. -/
abbrev ArchPoints (w : InfinitePlace F) :=
  TauCeti.HopfAlgebra.points (H := H) (CommAlgCat.of F w.Completion)

instance (w : InfinitePlace F) : TopologicalSpace (ArchPoints F H w) :=
  AdelicPoints.evalTopology F H w.Completion

/-- The diagonal `G(F) → G(F_S)`. -/
def diagonalS (Sinf : Finset (InfinitePlace F))
    (Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F)))
    (g : WithConv (H →ₐ[F] F)) :
    (∀ w : Sinf, ArchPoints F H w) × (∀ v : Sf, AdelicPoints.LocalPoints F H v) :=
  (fun w => TauCeti.AlgHom.mapValue (H := H) (Algebra.ofId F _) g,
    fun v => TauCeti.AlgHom.mapValue (H := H) (Algebra.ofId F _) g)

/-- AA.4 target *weak approximation property*: `G(F)` is dense in `G(F_S)`. -/
def HasWeakApproximation (Sinf : Finset (InfinitePlace F))
    (Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))) : Prop :=
  DenseRange (diagonalS F H Sinf Sf)

variable {F H}

theorem HasWeakApproximation.mono {Sinf Sinf' : Finset (InfinitePlace F)}
    {Sf Sf' : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))}
    (h : HasWeakApproximation F H Sinf Sf) (hinf : Sinf' ⊆ Sinf) (hf : Sf' ⊆ Sf) :
    HasWeakApproximation F H Sinf' Sf' := by
  sorry

theorem HasWeakApproximation.prod {H' : Type} [CommRing H'] [HopfAlgebra F H']
    {Sinf : Finset (InfinitePlace F)} {Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))}
    (h : HasWeakApproximation F H Sinf Sf) (h' : HasWeakApproximation F H' Sinf Sf) :
    HasWeakApproximation F (TensorProduct F H H') Sinf Sf := by
  sorry

theorem HasWeakApproximation.of_iso {H' : Type} [CommRing H'] [HopfAlgebra F H']
    (e : H ≃ₐc[F] H') {Sinf : Finset (InfinitePlace F)}
    {Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))}
    (h : HasWeakApproximation F H Sinf Sf) : HasWeakApproximation F H' Sinf Sf := by
  sorry

variable (F)

-- Test Approximation.hasWeakApproximation_empty.
example : HasWeakApproximation F H ∅ ∅ := by
  sorry

-- Test Approximation.hasWeakApproximation_ga: `G_a` has weak approximation for every finite `S`.
example (Sinf : Finset (InfinitePlace F))
    (Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))) :
    HasWeakApproximation F (SymmetricAlgebra F F) Sinf Sf := by
  sorry

-- Test Approximation.not_hasWeakApproximation_mu2: `μ_2 = Spec ℚ[ℤ/2]` fails for `S = {∞, 2}`.
example : ∃ (Sinf : Finset (InfinitePlace ℚ))
    (Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers ℚ))),
    Sinf.card = 1 ∧ Sf.card = 1 ∧
      ¬ HasWeakApproximation ℚ (MonoidAlgebra ℚ (Multiplicative (ZMod 2))) Sinf Sf := by
  sorry

/-- AA.4 target *weak approximation gln*: `GL_n`, `SL_n`, `G_a` and split tori have weak approximation. -/
theorem hasWeakApproximation_gln (n : ℕ) (Sinf : Finset (InfinitePlace F))
    (Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))) :
    HasWeakApproximation F (TauCeti.GeneralLinear.coordinateHopfAlgebra F n) Sinf Sf := by
  sorry

theorem hasWeakApproximation_sln (n : ℕ) (Sinf : Finset (InfinitePlace F))
    (Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))) :
    HasWeakApproximation F (TauCeti.SpecialLinear.coordinateHopfAlgebra F n) Sinf Sf := by
  sorry

theorem hasWeakApproximation_splitTorus (r : ℕ) (Sinf : Finset (InfinitePlace F))
    (Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))) :
    HasWeakApproximation F (MonoidAlgebra F (Multiplicative (Fin r → ℤ))) Sinf Sf := by
  sorry

variable (H)

/-- Points of `G(𝔸_F)` supported at `∞ ∪ S_f`. -/
def supportedAt (Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))) :
    Subgroup (AdelicPoints F H) where
  carrier := {x | ∀ v ∉ Sf, AdelicPoints.proj F H v x = 1}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- AA.4 target *strong approximation property*, for `S = ∞ ∪ S_f`: `G(F) G(F_S)` is dense in `G(𝔸_F)`;
equivalently `G(F)` is dense in `G(𝔸_F^S)`. -/
def HasStrongApproximation (Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))) :
    Prop :=
  Dense {x : AdelicPoints F H | ∃ g y, y ∈ supportedAt F H Sf ∧ x = AdelicPoints.diagonal F H g * y}

variable {F H}

theorem HasStrongApproximation.mono
    {Sf Sf' : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))}
    (h : HasStrongApproximation F H Sf) (hS : Sf ⊆ Sf') : HasStrongApproximation F H Sf' := by
  sorry

/-- For every open subgroup `U` of `G(𝔸_F)`, `G(𝔸_F) = G(F) G(F_S) U`. -/
theorem HasStrongApproximation.mul_open
    {Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))}
    (h : HasStrongApproximation F H Sf) (U : Subgroup (AdelicPoints F H))
    (hU : IsOpen (U : Set (AdelicPoints F H))) (x : AdelicPoints F H) :
    ∃ g, ∃ y ∈ supportedAt F H Sf, ∃ u ∈ U, x = AdelicPoints.diagonal F H g * y * u := by
  sorry

/-- With `S = ∞`, the class set `G(F)\G(𝔸_f)/U` is a point for every compact open `U`. -/
theorem HasStrongApproximation.classNumber_one (h : HasStrongApproximation F H ∅)
    (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H))
    (hU : IsOpen (U : Set (AdelicPoints.FiniteAdelicPoints F H))) :
    Subsingleton (DoubleCoset.Quotient
      ((AdelicPoints.finiteDiagonal F H).range : Set (AdelicPoints.FiniteAdelicPoints F H)) U) := by
  sorry

variable (F)

-- Test Approximation.hasStrongApproximation_ga: `G_a` has strong approximation for `S = ∞`.
example : HasStrongApproximation F (SymmetricAlgebra F F) ∅ := by
  sorry

-- Test Approximation.hasStrongApproximation_sl2_rat: `SL_2` over `ℚ`, `S = ∞`; the surjectivity
-- of `SL_2(ℤ) → SL_2(ℤ/d)` alone gives only density of `SL_2(ℤ)` in `SL_2(ℤ̂)`.
example : HasStrongApproximation ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2) ∅ := by
  sorry

-- Test Approximation.not_hasStrongApproximation_gm: `G_m` over `ℚ` fails for `S = ∞`.
example : ¬ HasStrongApproximation ℚ (LaurentPolynomial ℚ) ∅ := by
  sorry

-- Acceptance of AA.4 target *strong approximation theorem* at `SL_n`, `n ≥ 2`, `S = ∞`.
example (n : ℕ) (hn : 2 ≤ n) :
    HasStrongApproximation F (TauCeti.SpecialLinear.coordinateHopfAlgebra F n) ∅ := by
  sorry

/-- AA.4 target *ga strong approximation*: smooth unipotent groups have strong approximation for every
`S ⊇ ∞`. -/
theorem hasStrongApproximation_of_unipotent [Algebra.FiniteType F H]
    (hN : TauCeti.smoothUnipotentCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))) :
    HasStrongApproximation F H Sf := by
  sorry

/-- AA.4 target *torus strong approximation failure*: a nontrivial torus never has strong approximation
for a finite `S`. -/
theorem not_hasStrongApproximation_of_torus [Algebra.FiniteType F H]
    (hT : TauCeti.torusCommHopfAlgProperty F (AdelicPoints.finiteTypeObj F H))
    (hnontriv : ¬ Subsingleton (WithConv (H →ₐ[F] AlgebraicClosure F)))
    (Sf : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))) :
    ¬ HasStrongApproximation F H Sf := by
  sorry

end Approximation

namespace AdelicPoints

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- The archimedean embedding `G(F_∞) → G(𝔸_F)`, `x ↦ (x, 1)`. -/
def infiniteEmbed : InfinitePoints F H →* AdelicPoints F H where
  toFun x := WithConv.toConv {
    toFun h := (x.ofConv h, (1 : FiniteAdelicPoints F H).ofConv h)
    map_zero' := by sorry
    map_one' := by sorry
    map_add' := by sorry
    map_mul' := by sorry
    commutes' := by sorry }
  map_one' := by sorry
  map_mul' := by sorry

theorem infiniteEmbed_infinite (x : InfinitePoints F H) :
    infiniteProjection F H (infiniteEmbed F H x) = x := by
  sorry

theorem infiniteEmbed_finite (x : InfinitePoints F H) :
    finiteProjection F H (infiniteEmbed F H x) = 1 := by
  sorry

theorem continuous_infiniteEmbed : Continuous (infiniteEmbed F H) := by
  sorry

end AdelicPoints

/-- AA.4 target *open finite covolume finite index*: an open subgroup `Δ` of a locally compact group with
a nonzero finite invariant Radon measure on `G/Δ` has finite index. -/
theorem Subgroup.finiteIndex_of_finite_covolume {G : Type*} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [LocallyCompactSpace G]
    (Δ : Subgroup G) (hΔ : IsOpen (Δ : Set G)) [MeasurableSpace (G ⧸ Δ)] [BorelSpace (G ⧸ Δ)]
    (μ : Measure (G ⧸ Δ)) [IsFiniteMeasure μ] [μ.Regular] (hμ : μ ≠ 0)
    (hinv : ∀ g : G, Measure.map (fun x : G ⧸ Δ => g • x) μ = μ) : Δ.FiniteIndex := by
  sorry

/-! ## Layer 4: Compact abelian quotients and limits of invariant measures -/

namespace Residual

open _root_.MeasureTheory

variable {C : Type*} [CommGroup C] [TopologicalSpace C] [IsTopologicalGroup C] [CompactSpace C]
  [T2Space C] [SecondCountableTopology C] [MeasurableSpace C] [BorelSpace C]

/-- AA.4 target *chabauty limit kernels*: for pairwise distinct continuous characters `χ_i : C → {±1}`,
every weak limit of probability measures invariant under `ker χ_i` is `C`-invariant. -/
theorem invariant_of_tendsto_kernels (χ : ℕ → C →* ℤˣ) (hχc : ∀ i, Continuous (χ i))
    (hχ : Function.Injective χ) (μ : ℕ → ProbabilityMeasure C)
    (hμ : ∀ i, ∀ c ∈ (χ i).ker, Measure.map (c * ·) (μ i : Measure C) = μ i)
    (ν : ProbabilityMeasure C) (hlim : Filter.Tendsto μ Filter.atTop (𝓝 ν)) :
    ∀ c : C, Measure.map (c * ·) (ν : Measure C) = ν := by
  sorry

/-- AA.4 target *homogeneous measure pushforward*: let `π : G → C` be a continuous surjective
homomorphism, `T ≤ G` closed, `Λ ≤ T` discrete with `Λ\T` compact and `π(Λ) = 1`, and `ν` the
`T`-invariant probability measure on `Λ\T`. Then the pushforward of `ν` along `[t] ↦ π(t g)` is
the probability measure on the coset `π(T) π(g)` invariant under `π(T)`. -/
theorem map_invariant_eq {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (π : G →* C) (hπ : Continuous π) (hπs : Function.Surjective π) (T : Subgroup G)
    (hT : IsClosed (T : Set G)) (Λ : Subgroup T) (hΛ : DiscreteTopology Λ)
    [CompactSpace (MulAction.orbitRel.Quotient Λ T)] (hπΛ : ∀ l : Λ, π ((l : T) : G) = 1)
    [MeasurableSpace (MulAction.orbitRel.Quotient Λ T)]
    (ν : Measure (MulAction.orbitRel.Quotient Λ T)) [IsProbabilityMeasure ν]
    (hν : ∀ s : T, Measure.map (Quotient.map' (· * s) (by sorry)) ν = ν) (g : G) :
    let q : MulAction.orbitRel.Quotient Λ T → C :=
      Quotient.lift (fun t : T => π ((t : G) * g)) (by sorry)
    IsProbabilityMeasure (Measure.map q ν) ∧
      (∀ s ∈ T.map π, Measure.map (s * ·) (Measure.map q ν) = Measure.map q ν) ∧
      Measure.map q ν (((T.map π : Subgroup C) : Set C) * {π g})ᶜ = 0 := by
  sorry

/-- AA.4 target *quadratic kernel fourier*: for pairwise distinct nontrivial continuous `χ_i : C → {±1}`,
the Haar probability `m_i` of `ker χ_i` integrates a character `ψ` to zero unless `ψ = 1` or
`ψ = χ_i`, so the `m_i` converge weakly to Haar probability on `C`. -/
theorem integral_character_kernel (χ : C →* ℤˣ) (hχ : Continuous χ) (hχ1 : χ ≠ 1)
    (m : Measure C) [IsProbabilityMeasure m] (hm : m (χ.ker : Set C)ᶜ = 0)
    (hminv : ∀ c ∈ χ.ker, Measure.map (c * ·) m = m) (ψ : C →* Circle) (hψ : Continuous ψ)
    (hψ1 : ψ ≠ 1) (hψχ : ∃ c, (ψ c : ℂ) ≠ ((χ c : ℤ) : ℂ)) :
    ∫ c, (ψ c : ℂ) ∂m = 0 := by
  sorry

theorem tendsto_kernel_haar (χ : ℕ → C →* ℤˣ) (hχc : ∀ i, Continuous (χ i))
    (hχ : Function.Injective χ) (m : ℕ → ProbabilityMeasure C)
    (hm : ∀ i, (m i : Measure C) ((χ i).ker : Set C)ᶜ = 0)
    (hminv : ∀ i, ∀ c ∈ (χ i).ker, Measure.map (c * ·) (m i : Measure C) = m i)
    (ν : ProbabilityMeasure C) (hν : ∀ c, Measure.map (c * ·) (ν : Measure C) = ν) :
    Filter.Tendsto m Filter.atTop (𝓝 ν) := by
  sorry

end Residual

/-- AA.4 target *idele class square compact*: `C_F/C_F²` is compact Hausdorff. -/
theorem NumberField.compactSpace_ideleClassGroup_mod_squares (F : Type) [Field F] [NumberField F] :
    CompactSpace (NumberField.IdeleClassGroup (NumberField.RingOfIntegers F) F ⧸
        Subgroup.closure (Set.range fun y : NumberField.IdeleClassGroup (NumberField.RingOfIntegers F) F =>
          y ^ 2)) ∧
      T2Space (NumberField.IdeleClassGroup (NumberField.RingOfIntegers F) F ⧸
        Subgroup.closure (Set.range fun y : NumberField.IdeleClassGroup (NumberField.RingOfIntegers F) F =>
          y ^ 2)) := by
  sorry


/-- AA.4 target *projection finite covolume*: if `Γ` is a lattice in `A × B`, the closure `Δ` of its
projection to `B` has finite covolume: `Δ\B` carries a nonzero finite `B`-invariant measure. -/
theorem exists_finite_invariant_measure_projection {A B : Type*} [Group A] [Group B]
    [TopologicalSpace A] [TopologicalSpace B] [IsTopologicalGroup A] [IsTopologicalGroup B]
    [LocallyCompactSpace A] [LocallyCompactSpace B] [SecondCountableTopology A]
    [SecondCountableTopology B] [T2Space A] [T2Space B]
    (Γ : Subgroup (A × B)) (hΓ : DiscreteTopology Γ)
    (μ : Measure (QuotientMeasure.Cosets Γ)) [IsFiniteMeasure μ] [μ.Regular] (hμ : μ ≠ 0)
    (hμinv : ∀ x : A × B, Measure.map (Quotient.map' (· * x) (by sorry)) μ = μ)
    : ∃ ν : Measure (QuotientMeasure.Cosets (Γ.map (MonoidHom.snd A B)).topologicalClosure),
      ν ≠ 0 ∧ IsFiniteMeasure ν ∧ ν.Regular ∧
        ∀ b : B, Measure.map (Quotient.map' (· * b) (by sorry)) ν = ν := by
  sorry

/-! ## Layer 4: Torsors -/

namespace Approximation

/-- AA.4 target *group torsor*: a torsor under the affine group `Spec H` over a field `k`: a nonzero
finitely generated algebra `A` with a coassociative, counital coaction `A → A ⊗ H`, trivialized as a
comodule algebra over an algebraic closure. -/
structure Torsor (k : Type) [Field k] (H : Type) [CommRing H] [HopfAlgebra k H] where
  /-- The coordinate algebra of the torsor. -/
  A : Type
  [commRing : CommRing A]
  [algebra : Algebra k A]
  [nontrivial : Nontrivial A]
  finiteType : Algebra.FiniteType k A
  /-- The coaction `A → A ⊗ H`, a right action of `G` on `Spec A`. -/
  coaction : A →ₐ[k] TensorProduct k A H
  coassoc : (TensorProduct.map coaction.toLinearMap LinearMap.id) ∘ₗ coaction.toLinearMap =
    (TensorProduct.assoc k A H H).symm.toLinearMap ∘ₗ
      (TensorProduct.map LinearMap.id (Coalgebra.comul (R := k) (A := H))) ∘ₗ coaction.toLinearMap
  counit : (TensorProduct.rid k A).toLinearMap ∘ₗ
      (TensorProduct.map LinearMap.id (Coalgebra.counit (R := k) (A := H))) ∘ₗ
        coaction.toLinearMap = LinearMap.id
  /-- `Spec A × G → Spec A × Spec A`, `(x, g) ↦ (x, x g)`, is an isomorphism; over a field this is
  equivalent to a comodule-algebra trivialization over an algebraic closure. -/
  bijective_actionMap :
    Function.Bijective (Algebra.TensorProduct.productMap Algebra.TensorProduct.includeLeft coaction)

attribute [instance] Torsor.commRing Torsor.algebra Torsor.nontrivial

variable {k : Type} [Field k] {H : Type} [CommRing H] [HopfAlgebra k H]

/-- A torsor is trivial when it has a `k`-point. -/
def Torsor.IsTrivial (X : Torsor k H) : Prop := Nonempty (X.A →ₐ[k] k)

/-- `G` acting on itself. -/
def Torsor.self [Algebra.FiniteType k H] [Nontrivial H] : Torsor k H := sorry

/-- An isomorphism of torsors: an algebra isomorphism commuting with the coactions. -/
def Torsor.Iso (X Y : Torsor k H) : Prop :=
  ∃ e : X.A ≃ₐ[k] Y.A, (Algebra.TensorProduct.map e.toAlgHom (AlgHom.id k H)).comp X.coaction =
    Y.coaction.comp e.toAlgHom

theorem Torsor.trivial_iff_iso [Algebra.FiniteType k H] [Nontrivial H] (X : Torsor k H) :
    X.IsTrivial ↔ X.Iso Torsor.self := by
  sorry

/-- Base change of a torsor along a field extension `k → k'`. -/
def Torsor.baseChange (k' : Type) [Field k'] [Algebra k k'] (X : Torsor k H) :
    Torsor k' (TensorProduct k k' H) :=
  sorry

-- Test Approximation.Torsor.self_trivial.
example [Algebra.FiniteType k H] [Nontrivial H] : (Torsor.self (k := k) (H := H)).IsTrivial := by
  sorry

-- Test Approximation.Torsor.mu2_sqrt: `ℚ[x]/(x² - 2)` with `x ↦ x ⊗ g` is a nontrivial
-- `μ_2`-torsor over `ℚ`.
example : ∃ X : Torsor ℚ (MonoidAlgebra ℚ (Multiplicative (ZMod 2))),
    Nonempty (X.A ≃ₐ[ℚ] AdjoinRoot (Polynomial.X ^ 2 - Polynomial.C (2 : ℚ))) ∧ ¬ X.IsTrivial := by
  sorry

-- Test Approximation.Torsor.not_torsor_two_orbits: `G_m` acting on `A¹` by scaling is not a torsor.
example : ¬ ∃ X : Torsor ℚ (LaurentPolynomial ℚ), ∃ e : X.A ≃ₐ[ℚ] Polynomial ℚ,
    (Algebra.TensorProduct.map e.toAlgHom (AlgHom.id ℚ (LaurentPolynomial ℚ))).comp X.coaction =
      (Polynomial.aeval (Polynomial.X ⊗ₜ[ℚ] LaurentPolynomial.T 1 :
        TensorProduct ℚ (Polynomial ℚ) (LaurentPolynomial ℚ))).comp e.toAlgHom := by
  sorry

end Approximation

/-! ## Layer 4: Neatness: stability, p-adic criteria and existence -/

namespace Neat

variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]
  (n : ℕ) (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ)

/-- AA.4 target *neat stability*: subgroups of neat subgroups are neat. -/
theorem IsNeatSubgroup.mono {Γ Γ' : Subgroup (WithConv (H →ₐ[F] F))} (h : IsNeatSubgroup n ρ Γ)
    (hle : Γ' ≤ Γ) : IsNeatSubgroup n ρ Γ' := by
  sorry

/-- Conjugates of neat subgroups by rational points are neat. -/
theorem IsNeatSubgroup.conj {Γ : Subgroup (WithConv (H →ₐ[F] F))} (h : IsNeatSubgroup n ρ Γ)
    (γ : WithConv (H →ₐ[F] F)) : IsNeatSubgroup n ρ (Γ.map (MulAut.conj γ).toMonoidHom) := by
  sorry

/-- Images of neat subgroups under homomorphisms of algebraic groups are neat, for faithful
algebraic representations over the same embedding `τ`. -/
theorem IsNeatSubgroup.map {H' : Type} [CommRing H'] [HopfAlgebra F H'] [Algebra.FiniteType F H]
    [Algebra.FiniteType F H'] (τ : F →+* ℂ) (m : ℕ) (ρ' : WithConv (H' →ₐ[F] F) →* GL (Fin m) ℂ)
    (hρ : IsFaithfulAlgebraicPointHom τ n ρ) (hρ' : IsFaithfulAlgebraicPointHom τ m ρ')
    (φ : H' →ₐc[F] H) {Γ : Subgroup (WithConv (H →ₐ[F] F))} (h : IsNeatSubgroup n ρ Γ) :
    IsNeatSubgroup m ρ' (Γ.map (TauCeti.AlgHom.mapDomain (R := F) (H₁ := H') (H₂ := H) (A := F) φ)) := by
  sorry

/-- AA.4 target *algebraic tensor eigenvalues*: for faithful algebraic `ρ` and algebraic `σ`, every
eigenvalue of `σ(g)` lies in the group generated by the eigenvalues of `ρ(g)`. -/
theorem eigenvalue_mem_closure [Algebra.FiniteType F H] (τ : F →+* ℂ) (m : ℕ)
    (σ : WithConv (H →ₐ[F] F) →* GL (Fin m) ℂ) (hρ : IsFaithfulAlgebraicPointHom τ n ρ)
    (hσ : IsAlgebraicPointHom τ m σ) (g : WithConv (H →ₐ[F] F)) (μ : ℂˣ)
    (hμ : Module.End.HasEigenvalue (Matrix.toLin' (σ g : Matrix (Fin m) (Fin m) ℂ)) μ) :
    μ ∈ Subgroup.closure
      {z : ℂˣ | Module.End.HasEigenvalue (Matrix.toLin' (ρ g : Matrix (Fin n) (Fin n) ℂ)) z} := by
  sorry

/-- The value algebra map `𝔸_{F,f} → F_v`. -/
def finiteValue (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    IsDedekindDomain.FiniteAdeleRing (NumberField.RingOfIntegers F) F →ₐ[F] v.adicCompletion F where
  toFun x := x v
  map_zero' := by sorry
  map_one' := by sorry
  map_add' := by sorry
  map_mul' := by sorry
  commutes' := by sorry

/-- The projection `G(𝔸_{F,f}) → G(F_v)`. -/
def finiteProj (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    AdelicPoints.FiniteAdelicPoints F H →* AdelicPoints.LocalPoints F H v :=
  TauCeti.AlgHom.mapValue (H := H) (finiteValue v)

/-- AA.4 target *neat criterion one prime*: if at one place `v | p` with `p ≥ 3` every element of `U` acts
in `1 + p M_n(𝒪_v)` through the faithful algebraic representation, then `U` is neat. -/
theorem isNeatLevel_of_congruence [Algebra.FiniteType F H] (τ : F →+* ℂ)
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F n →ₐc[F] H)
    (hr : Function.Surjective r) (hρ : ρ = algebraicPointMap τ n r)
    (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H))
    (hU : IsCompact (U : Set (AdelicPoints.FiniteAdelicPoints F H)))
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) (p : ℕ) [Fact p.Prime]
    (hp : 3 ≤ p) (hv : (p : NumberField.RingOfIntegers F) ∈ v.asIdeal)
    (hcong : ∀ u ∈ U, ∀ i j, ∃ y ∈ v.adicCompletionIntegers F,
      ((TauCeti.GeneralLinear.pointsMulEquiv (R := F) n
          (TauCeti.AlgHom.mapDomain r (finiteProj v u)) :
            Matrix (Fin n) (Fin n) (v.adicCompletion F)) - 1) i j = (p : v.adicCompletion F) * y) :
    IsNeatLevel n ρ U := by
  sorry

/-- AA.4 target *neat level exists*: every compact open level contains a neat open normal subgroup of
finite index. -/
theorem exists_isNeatLevel [Algebra.FiniteType F H] (τ : F →+* ℂ)
    (hρ : IsFaithfulAlgebraicPointHom τ n ρ) (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H))
    (hU : IsCompact (U : Set (AdelicPoints.FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (AdelicPoints.FiniteAdelicPoints F H))) :
    ∃ U' : Subgroup (AdelicPoints.FiniteAdelicPoints F H), U' ≤ U ∧
      IsOpen (U' : Set (AdelicPoints.FiniteAdelicPoints F H)) ∧ (U'.subgroupOf U).Normal ∧
      (U'.subgroupOf U).FiniteIndex ∧ IsNeatLevel n ρ U' := by
  sorry

end Neat

/-! p-adic inputs to the one-prime criterion. `PadicAlgCl p` is Mathlib's algebraic closure of
`ℚ_p` with the extended absolute value. -/

namespace NeatPadic

variable (p : ℕ) [Fact p.Prime]

/-- AA.4 target *padic root unity distance*: a root of unity `ζ ≠ 1` satisfies `|ζ - 1| ≥ p^{-1/(p-1)}`. -/
theorem le_norm_sub_one {ζ : PadicAlgCl p} (hζ : ζ ≠ 1) {m : ℕ} (hm : 0 < m) (hζm : ζ ^ m = 1) :
    (p : ℝ) ^ (-(1 / ((p : ℝ) - 1))) ≤ ‖ζ - 1‖ := by
  sorry

/-- A primitive `p^k`-th root of unity has distance `p^{-1/(p^{k-1}(p-1))}` from `1`. -/
theorem norm_sub_one_of_primitive_pow {ζ : PadicAlgCl p} {k : ℕ} (hk : 0 < k)
    (hζ : IsPrimitiveRoot ζ (p ^ k)) :
    ‖ζ - 1‖ = (p : ℝ) ^ (-(1 / ((p : ℝ) ^ (k - 1) * ((p : ℝ) - 1)))) := by
  sorry

/-- A root of unity of order prime to `p`, other than `1`, has distance one from `1`. -/
theorem norm_sub_one_of_coprime {ζ : PadicAlgCl p} {m : ℕ} (hm : IsPrimitiveRoot ζ m)
    (hcop : Nat.Coprime m p) (h1 : 1 < m) : ‖ζ - 1‖ = 1 := by
  sorry

/-- AA.4 target *padic ball torsion free*: the ball `|λ - 1| < p^{-1/(p-1)}` has no nontrivial roots of
unity. -/
theorem eq_one_of_norm_sub_one_lt {ζ : PadicAlgCl p}
    (hζ : ‖ζ - 1‖ < (p : ℝ) ^ (-(1 / ((p : ℝ) - 1)))) {m : ℕ} (hm : 0 < m) (hζm : ζ ^ m = 1) :
    ζ = 1 := by
  sorry

/-- AA.4 target *congruence matrix eigenvalue bound*: eigenvalues of `M ∈ 1 + p^a M_n(ℤ_p)` satisfy
`|λ - 1| ≤ p^{-a}`. -/
theorem norm_eigenvalue_sub_one_le {n : ℕ} (a : ℕ) (M : Matrix (Fin n) (Fin n) ℤ_[p])
    (hM : ∀ i j, ∃ y : ℤ_[p], (M - 1) i j = (p : ℤ_[p]) ^ a * y) (ev : PadicAlgCl p)
    (hev : Module.End.HasEigenvalue
      (Matrix.toLin' (M.map fun x => algebraMap ℚ_[p] (PadicAlgCl p) (x : ℚ_[p]))) ev) :
    ‖ev - 1‖ ≤ (p : ℝ) ^ (-(a : ℤ)) := by
  sorry

/-- AA.4 target *compact stable padic lattice*: a compact subgroup of `GL_n(ℚ_p)` stabilizes a lattice,
so it is conjugate into `GL_n(ℤ_p)`. -/
theorem exists_conj_le_integral {n : ℕ} (C : Subgroup (GL (Fin n) ℚ_[p]))
    (hC : IsCompact (C : Set (GL (Fin n) ℚ_[p]))) :
    ∃ g : GL (Fin n) ℚ_[p], ∀ c ∈ C, g * c * g⁻¹ ∈
      (Matrix.GeneralLinearGroup.map (algebraMap ℤ_[p] ℚ_[p])).range := by
  sorry

end NeatPadic

/-! ## Layer 4: Level quotients, groupoids and Hecke correspondences

For a compact open `U ⊂ G(𝔸_{F,f})` and a closed `K∞ ⊂ G(F_∞)`, `X_U = G(F)\G(𝔸_F)/K∞U`. -/

namespace LevelMaps

open AdelicPoints

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- The subgroup `K∞U` of `G(𝔸_F)`. -/
def levelSubgroup (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H)) :
    Subgroup (AdelicPoints F H) :=
  Kinf.map (infiniteEmbed F H) ⊔ U.map (finiteEmbed F H)

/-- `x ∼ γ x k` for `γ ∈ G(F)` and `k ∈ K∞U`. -/
def levelSetoid (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H)) :
    Setoid (AdelicPoints F H) where
  r x y := ∃ γ, ∃ k ∈ levelSubgroup F H U Kinf, y = diagonal F H γ * x * k
  iseqv := sorry

/-- AA.4 target *level quotient*: `X_U = G(F)\G(𝔸_F)/K∞U`, with the quotient topology. -/
abbrev LevelQuotient (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H)) :=
  Quotient (levelSetoid F H U Kinf)

variable {F H}

/-- The projection `G(𝔸_F) → X_U`. -/
def LevelQuotient.mk (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H))
    (x : AdelicPoints F H) : LevelQuotient F H U Kinf :=
  Quotient.mk _ x

theorem LevelQuotient.mk_rational (U : Subgroup (FiniteAdelicPoints F H))
    (Kinf : Subgroup (InfinitePoints F H)) (γ : WithConv (H →ₐ[F] F)) (x : AdelicPoints F H) :
    LevelQuotient.mk U Kinf (diagonal F H γ * x) = LevelQuotient.mk U Kinf x := by
  sorry

/-- Hecke translation `X_{gUg⁻¹} ≃ X_U`, `[x] ↦ [x g]`. -/
def LevelQuotient.rightTranslate (U : Subgroup (FiniteAdelicPoints F H))
    (Kinf : Subgroup (InfinitePoints F H)) (g : FiniteAdelicPoints F H) :
    LevelQuotient F H (U.map (MulAut.conj g).toMonoidHom) Kinf ≃ₜ LevelQuotient F H U Kinf :=
  sorry

theorem LevelQuotient.rightTranslate_mk (U : Subgroup (FiniteAdelicPoints F H))
    (Kinf : Subgroup (InfinitePoints F H)) (g : FiniteAdelicPoints F H) (x : AdelicPoints F H) :
    LevelQuotient.rightTranslate U Kinf g (LevelQuotient.mk _ Kinf x) =
      LevelQuotient.mk U Kinf (x * finiteEmbed F H g) := by
  sorry

/-- The level map `X_{U'} → X_U` for `U' ≤ U`. -/
def LevelQuotient.levelMap {U U' : Subgroup (FiniteAdelicPoints F H)} (h : U' ≤ U)
    (Kinf : Subgroup (InfinitePoints F H)) :
    LevelQuotient F H U' Kinf → LevelQuotient F H U Kinf :=
  Quotient.map' id (by sorry)

/-- AA.4 target *level quotient hausdorff*: for compact open `U` and `K∞` containing `A_G(ℝ)^0` and compact
modulo it, `X_U` is Hausdorff and locally compact. -/
theorem LevelQuotient.t2Space_locallyCompact [Algebra.FiniteType F H]
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H))) (Kinf : Subgroup (InfinitePoints F H))
    (hKc : IsClosed (Kinf : Set (InfinitePoints F H)))
    (hA : (SplitComponent F H).comap (infiniteEmbed F H) ≤ Kinf)
    (hK : IsCompact ((fun k : InfinitePoints F H =>
      (k : InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H))) ''
        (Kinf : Set (InfinitePoints F H)))) :
    T2Space (LevelQuotient F H U Kinf) ∧ LocallyCompactSpace (LevelQuotient F H U Kinf) := by
  sorry

/-- AA.4 target *rational stabilizer finite*: the full stabilizer `G(F) ∩ g K∞U g⁻¹` is finite. -/
theorem finite_rationalStabilizer [Algebra.FiniteType F H]
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H))) (Kinf : Subgroup (InfinitePoints F H))
    (hKc : IsClosed (Kinf : Set (InfinitePoints F H)))
    (hA : (SplitComponent F H).comap (infiniteEmbed F H) ≤ Kinf)
    (hK : IsCompact ((fun k : InfinitePoints F H =>
      (k : InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H))) ''
        (Kinf : Set (InfinitePoints F H))))
    (g : AdelicPoints F H) :
    Finite (((levelSubgroup F H U Kinf).map (MulAut.conj g).toMonoidHom).comap (diagonal F H)) := by
  sorry

/-- AA.4 target *compact kernel split centre*: `K∞ ∩ ker H_{G,∞}` is compact and
`K∞ ≃ A_G(ℝ)^0 × (K∞ ∩ ker H_{G,∞})`. -/
theorem isCompact_inf_ker_logHeight [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H))
    (Kinf : Subgroup (InfinitePoints F H)) (hKc : IsClosed (Kinf : Set (InfinitePoints F H)))
    (hA : (SplitComponent F H).comap (infiniteEmbed F H) ≤ Kinf)
    (hK : IsCompact ((fun k : InfinitePoints F H =>
      (k : InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H))) ''
        (Kinf : Set (InfinitePoints F H)))) :
    IsCompact ((Kinf ⊓ ((logHeight F H).comp (infiniteEmbed F H)).ker : Subgroup _) :
      Set (InfinitePoints F H)) ∧
    ∀ k ∈ Kinf, ∃! ak : (SplitComponent F H).comap (infiniteEmbed F H) ×
        (Kinf ⊓ ((logHeight F H).comp (infiniteEmbed F H)).ker : Subgroup _),
      k = (ak.1 : InfinitePoints F H) * ak.2 := by
  sorry

/-- AA.4 target *level covering map*: at neat level the level map is a finite covering of degree
`[U : U']`. -/
theorem LevelQuotient.isCoveringMap_levelMap [Algebra.FiniteType F H] (n : ℕ)
    (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) (τ : F →+* ℂ)
    (hρ : Neat.IsFaithfulAlgebraicPointHom τ n ρ)
    {U U' : Subgroup (FiniteAdelicPoints F H)} (h : U' ≤ U)
    (hU : IsCompact (U : Set (FiniteAdelicPoints F H))) (hUo : IsOpen (U : Set (FiniteAdelicPoints F H)))
    (hU'o : IsOpen (U' : Set (FiniteAdelicPoints F H))) (hneat : Neat.IsNeatLevel n ρ U)
    (Kinf : Subgroup (InfinitePoints F H)) (hKc : IsClosed (Kinf : Set (InfinitePoints F H)))
    (hA : (SplitComponent F H).comap (infiniteEmbed F H) ≤ Kinf)
    (hK : IsCompact ((fun k : InfinitePoints F H =>
      (k : InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H))) ''
        (Kinf : Set (InfinitePoints F H)))) :
    IsCoveringMap (LevelQuotient.levelMap h Kinf) ∧
      ∀ x, Nat.card (LevelQuotient.levelMap h Kinf ⁻¹' {x}) = U'.relIndex U := by
  sorry

/-- AA.4 target *level action free at neat*: for `U'` normal in a neat `U`, the right action of `U` on
`X_{U'}` factors through `U/U'` and is free. -/
theorem LevelQuotient.action_free [Algebra.FiniteType F H] (n : ℕ)
    (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) (τ : F →+* ℂ)
    (hρ : Neat.IsFaithfulAlgebraicPointHom τ n ρ)
    {U U' : Subgroup (FiniteAdelicPoints F H)} (h : U' ≤ U) (hnorm : (U'.subgroupOf U).Normal)
    (hneat : Neat.IsNeatLevel n ρ U) (Kinf : Subgroup (InfinitePoints F H))
    (hA : (SplitComponent F H).comap (infiniteEmbed F H) ≤ Kinf)
    (hK : IsCompact ((fun k : InfinitePoints F H =>
      (k : InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H))) ''
        (Kinf : Set (InfinitePoints F H))))
    (u : FiniteAdelicPoints F H) (hu : u ∈ U) (x : AdelicPoints F H)
    (hfix : LevelQuotient.mk U' Kinf (x * finiteEmbed F H u) = LevelQuotient.mk U' Kinf x) :
    u ∈ U' := by
  sorry

/-- AA.4 target *level quotient groupoid*: the action groupoid of `G(F)` on `G(𝔸_F)/K∞U`. -/
abbrev levelGroupoid (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H)) :=
  CategoryTheory.ActionCategory (diagonal F H).range (AdelicPoints F H ⧸ levelSubgroup F H U Kinf)

/-- The automorphisms of an object are its stabilizer `G(F) ∩ x K∞U x⁻¹`. -/
def levelGroupoid_aut (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H))
    (x : AdelicPoints F H ⧸ levelSubgroup F H U Kinf) :
    MulAction.stabilizer (diagonal F H).range x ≃*
      CategoryTheory.Aut (CategoryTheory.ActionCategory.objEquiv (diagonal F H).range _ x) :=
  sorry

/-- Its isomorphism classes are the points of `X_U`. -/
def levelGroupoid_isoClasses (U : Subgroup (FiniteAdelicPoints F H))
    (Kinf : Subgroup (InfinitePoints F H)) :
    Quotient (CategoryTheory.isIsomorphicSetoid (levelGroupoid (F := F) (H := H) U Kinf)) ≃
      LevelQuotient F H U Kinf :=
  sorry

theorem levelGroupoid_finite_aut [Algebra.FiniteType F H]
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H))) (Kinf : Subgroup (InfinitePoints F H))
    (hKc : IsClosed (Kinf : Set (InfinitePoints F H)))
    (hA : (SplitComponent F H).comap (infiniteEmbed F H) ≤ Kinf)
    (hK : IsCompact ((fun k : InfinitePoints F H =>
      (k : InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H))) ''
        (Kinf : Set (InfinitePoints F H))))
    (x : AdelicPoints F H ⧸ levelSubgroup F H U Kinf) :
    Finite (MulAction.stabilizer (diagonal F H).range x) := by
  sorry

/-- AA.4 target *rational action proper*: `G(F)` acts properly discontinuously on `G(𝔸_F)/K∞U`. -/
theorem properlyDiscontinuous_rational [Algebra.FiniteType F H]
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H))) (Kinf : Subgroup (InfinitePoints F H))
    (hKc : IsClosed (Kinf : Set (InfinitePoints F H)))
    (hA : (SplitComponent F H).comap (infiniteEmbed F H) ≤ Kinf)
    (hK : IsCompact ((fun k : InfinitePoints F H =>
      (k : InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H))) ''
        (Kinf : Set (InfinitePoints F H)))) :
    ProperlyDiscontinuousSMul (diagonal F H).range (AdelicPoints F H ⧸ levelSubgroup F H U Kinf) := by
  sorry

/-- AA.4 target *level full stabilizer mass*: for `U' ≤ U` and a point `x = [g]` of `X_U` with finite full
stabilizer `A_x = G(F) ∩ g K∞U g⁻¹`, `∑_{y ↦ x} 1/|A_y| = [U : U']/|A_x|`. -/
theorem sum_inv_card_stabilizer {U U' : Subgroup (FiniteAdelicPoints F H)} (h : U' ≤ U)
    [(U'.subgroupOf U).FiniteIndex] (Kinf : Subgroup (InfinitePoints F H)) (g : AdelicPoints F H)
    (hfin : Finite (MulAction.stabilizer (diagonal F H).range
      (g : AdelicPoints F H ⧸ levelSubgroup F H U Kinf))) :
    (∑ᶠ y : (LevelQuotient.levelMap h Kinf ⁻¹' {LevelQuotient.mk U Kinf g}),
        ((Nat.card (MulAction.stabilizer (diagonal F H).range
          ((Quotient.out (y : LevelQuotient F H U' Kinf) : AdelicPoints F H) :
            AdelicPoints F H ⧸ levelSubgroup F H U' Kinf)) : ℚ))⁻¹) =
      (U'.relIndex U : ℚ) / Nat.card (MulAction.stabilizer (diagonal F H).range
        (g : AdelicPoints F H ⧸ levelSubgroup F H U Kinf)) := by
  sorry

-- Test LevelMaps.levelGroupoid_neat: at neat level, under the compact-modulo-`A_G` hypotheses, the
-- automorphism groups are trivial.
example [Algebra.FiniteType F H] (n : ℕ) (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) (τ : F →+* ℂ)
    (hρ : Neat.IsFaithfulAlgebraicPointHom τ n ρ)
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H))) (hneat : Neat.IsNeatLevel n ρ U)
    (Kinf : Subgroup (InfinitePoints F H))
    (hA : (SplitComponent F H).comap (infiniteEmbed F H) ≤ Kinf)
    (hK : IsCompact ((fun k : InfinitePoints F H =>
      (k : InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H))) ''
        (Kinf : Set (InfinitePoints F H))))
    (x : AdelicPoints F H ⧸ levelSubgroup F H U Kinf) :
    Subsingleton (MulAction.stabilizer (diagonal F H).range x) := by
  sorry

/-- AA.4 target *hecke correspondence*: `T_g` is `X_U ← X_{U ∩ gUg⁻¹} → X_U`, `[x] ↦ [x]` and
`[x] ↦ [x g]`. -/
def hecke (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H))
    (g : FiniteAdelicPoints F H) :
    (LevelQuotient F H (U ⊓ U.map (MulAut.conj g).toMonoidHom) Kinf → LevelQuotient F H U Kinf) ×
      (LevelQuotient F H (U ⊓ U.map (MulAut.conj g).toMonoidHom) Kinf → LevelQuotient F H U Kinf) :=
  (Quotient.map' id (by sorry), Quotient.map' (· * finiteEmbed F H g) (by sorry))

theorem hecke_fst (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H))
    (g : FiniteAdelicPoints F H) (x : AdelicPoints F H) :
    (hecke U Kinf g).1 (LevelQuotient.mk _ Kinf x) = LevelQuotient.mk U Kinf x := by
  sorry

theorem hecke_snd (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H))
    (g : FiniteAdelicPoints F H) (x : AdelicPoints F H) :
    (hecke U Kinf g).2 (LevelQuotient.mk _ Kinf x) = LevelQuotient.mk U Kinf (x * finiteEmbed F H g) := by
  sorry

/-- At neat level the first leg has degree `[U : U ∩ gUg⁻¹]`. -/
theorem hecke_degree [Algebra.FiniteType F H] (n : ℕ) (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ)
    (τ : F →+* ℂ) (hρ : Neat.IsFaithfulAlgebraicPointHom τ n ρ)
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H))) (hneat : Neat.IsNeatLevel n ρ U)
    (Kinf : Subgroup (InfinitePoints F H))
    (hA : (SplitComponent F H).comap (infiniteEmbed F H) ≤ Kinf)
    (hK : IsCompact ((fun k : InfinitePoints F H =>
      (k : InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H))) ''
        (Kinf : Set (InfinitePoints F H))))
    (g : FiniteAdelicPoints F H) (x : LevelQuotient F H U Kinf) :
    Nat.card ((hecke U Kinf g).1 ⁻¹' {x}) = (U ⊓ U.map (MulAut.conj g).toMonoidHom).relIndex U := by
  sorry

-- Test LevelMaps.hecke_one: for `g = 1` the two legs agree.
example (U : Subgroup (FiniteAdelicPoints F H)) (Kinf : Subgroup (InfinitePoints F H)) :
    (hecke U Kinf 1).1 = (hecke U Kinf 1).2 := by
  sorry

/-- AA.4 target *hecke cartesian*: for neat `U` and `U' L = U`, the square of level maps through
`X_{U' ∩ L}` is Cartesian. -/
theorem levelMap_cartesian [Algebra.FiniteType F H] (n : ℕ)
    (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) (τ : F →+* ℂ)
    (hρ : Neat.IsFaithfulAlgebraicPointHom τ n ρ)
    {U U' L : Subgroup (FiniteAdelicPoints F H)} (hU' : U' ≤ U) (hL : L ≤ U)
    (hprod : ∀ u ∈ U, ∃ a ∈ U', ∃ b ∈ L, u = a * b) (hneat : Neat.IsNeatLevel n ρ U)
    (hU : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hopen : IsOpen (U' : Set (FiniteAdelicPoints F H)) ∧ IsOpen (L : Set (FiniteAdelicPoints F H)))
    (Kinf : Subgroup (InfinitePoints F H))
    (hA : (SplitComponent F H).comap (infiniteEmbed F H) ≤ Kinf)
    (hK : IsCompact ((fun k : InfinitePoints F H =>
      (k : InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H))) ''
        (Kinf : Set (InfinitePoints F H)))) :
    Function.Bijective (fun y : LevelQuotient F H (U' ⊓ L) Kinf =>
      (⟨(LevelQuotient.levelMap inf_le_left Kinf y, LevelQuotient.levelMap inf_le_right Kinf y),
        by sorry⟩ : {p : LevelQuotient F H U' Kinf × LevelQuotient F H L Kinf //
          LevelQuotient.levelMap hU' Kinf p.1 = LevelQuotient.levelMap hL Kinf p.2})) := by
  sorry

variable (F H)

-- Test LevelMaps.LevelQuotient.trivial_group: for the trivial group `X_U` is a point.
example (U : Subgroup (FiniteAdelicPoints F F)) (Kinf : Subgroup (InfinitePoints F F)) :
    Subsingleton (LevelQuotient F F U Kinf) := by
  sorry

-- Test LevelMaps.LevelQuotient.not_finite_adelic_only: for `SL_2/ℚ` with `K∞ = 1`, `X_U` is not a
-- point (it contains `SL_2(ℤ)\SL_2(ℝ)`), unlike `SL_2(ℚ)\SL_2(𝔸_f)/U`.
example (U : Subgroup (FiniteAdelicPoints ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2)))
    (hU : IsCompact (U : Set (FiniteAdelicPoints ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2))))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2)))) :
    ¬ Subsingleton (LevelQuotient ℚ (TauCeti.SpecialLinear.coordinateHopfAlgebra ℚ 2) U ⊥) := by
  sorry

end LevelMaps

namespace LevelMaps

/-- AA.4 target *hecke degree double coset*: `UgU` is the union of `[U : U ∩ gUg⁻¹]` left cosets `ugU`. -/
theorem card_doubleCoset_cosets {G : Type*} [Group G] (U : Subgroup G) (g : G)
    [((U ⊓ U.map (MulAut.conj g).toMonoidHom).subgroupOf U).FiniteIndex] :
    Nat.card (Set.range (fun u : U => ((u * g : G) : G ⧸ U))) =
      (U ⊓ U.map (MulAut.conj g).toMonoidHom).relIndex U := by
  sorry

/-- AA.4 target *finite support product index*: the index of a product subgroup equal to the ambient one
outside a finite set `B` is the product of the local indices over `B`. -/
theorem relIndex_pi {ι : Type*} {G : ι → Type*} [∀ i, Group (G i)] (K K' : ∀ i, Subgroup (G i))
    (hle : ∀ i, K' i ≤ K i) (B : Finset ι) (hB : ∀ i ∉ B, K' i = K i) :
    (Subgroup.pi Set.univ K').relIndex (Subgroup.pi Set.univ K) =
      ∏ i ∈ B, (K' i).relIndex (K i) := by
  sorry

end LevelMaps

/-! ## Layer 3: Arithmetic subgroups, class numbers, finiteness and compactness, heights and real
reduction for `GL_n`

Statements needing rational parabolic subgroups, relative roots or Siegel sets (ReductiveGroups,
layer 7; the local parabolics `BruhatTits.Decomposition.parabolicOfVector` of ReductiveGroupsPartII,
RG2.4) are not stated here; the closing comment lists them. -/

namespace Reduction

open AdelicPoints

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- The diagonal `G(F) → G(F_∞)`. -/
def infiniteDiagonal : WithConv (H →ₐ[F] F) →* InfinitePoints F H :=
  TauCeti.AlgHom.mapValue (H := H) (Algebra.ofId F _)

/-- AA.3 target *arithmetic subgroup of level*: `Γ_{x,U} = G(F) ∩ x U x⁻¹`. -/
def levelArithmetic (x : FiniteAdelicPoints F H) (U : Subgroup (FiniteAdelicPoints F H)) :
    Subgroup (WithConv (H →ₐ[F] F)) :=
  (U.map (MulAut.conj x).toMonoidHom).comap (finiteDiagonal F H)

variable {F H}

theorem levelArithmetic_eq_rationalLevelAt (x : FiniteAdelicPoints F H)
    (U : Subgroup (FiniteAdelicPoints F H)) :
    levelArithmetic F H x U = Neat.rationalLevelAt U x := by
  sorry

theorem levelArithmetic_discrete [Algebra.FiniteType F H] (x : FiniteAdelicPoints F H)
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsCompact (U : Set (FiniteAdelicPoints F H))) :
    DiscreteTopology ((levelArithmetic F H x U).map (infiniteDiagonal F H)) := by
  sorry

theorem levelArithmetic_conj (x : FiniteAdelicPoints F H) (U : Subgroup (FiniteAdelicPoints F H))
    (γ : WithConv (H →ₐ[F] F)) {u : FiniteAdelicPoints F H} (hu : u ∈ U) :
    levelArithmetic F H (finiteDiagonal F H γ * x * u) U =
      (levelArithmetic F H x U).map (MulAut.conj γ).toMonoidHom := by
  sorry

theorem levelArithmetic_commensurable [Algebra.FiniteType F H] (x : FiniteAdelicPoints F H)
    {U U' : Subgroup (FiniteAdelicPoints F H)} (h : U' ≤ U)
    (hU : IsCompact (U : Set (FiniteAdelicPoints F H))) (hU'o : IsOpen (U' : Set (FiniteAdelicPoints F H))) :
    (levelArithmetic F H x U').relIndex (levelArithmetic F H x U) ≠ 0 := by
  sorry

/-- AA.3 target *class number finite*: `G(F)\G(𝔸_{F,f})/U` is finite. -/
theorem finite_classes [Algebra.FiniteType F H] (U : Subgroup (FiniteAdelicPoints F H))
    (hU : IsCompact (U : Set (FiniteAdelicPoints F H))) (hUo : IsOpen (U : Set (FiniteAdelicPoints F H))) :
    Finite (DoubleCoset.Quotient ((finiteDiagonal F H).range : Set (FiniteAdelicPoints F H)) U) := by
  sorry

/-- AA.3 target *unipotent class number one*: for smooth unipotent `N`, `N(𝔸_f) = N(F) U`. -/
theorem classes_subsingleton_of_unipotent [Algebra.FiniteType F H]
    (hN : TauCeti.smoothUnipotentCommHopfAlgProperty F (finiteTypeObj F H))
    (U : Subgroup (FiniteAdelicPoints F H)) (hUo : IsOpen (U : Set (FiniteAdelicPoints F H))) :
    Subsingleton (DoubleCoset.Quotient ((finiteDiagonal F H).range : Set (FiniteAdelicPoints F H)) U) := by
  sorry

/-- AA.3 target *component decomposition*: for representatives `x_c` of the classes,
`[g_∞] ↦ [(g_∞, x_c)]` is a homeomorphism `⊔_c Γ_{x_c,U}\G(F_∞) ≃ G(F)\G(𝔸_F)/U`. -/
def componentHomeomorph [Algebra.FiniteType F H] (U : Subgroup (FiniteAdelicPoints F H))
    (hU : IsCompact (U : Set (FiniteAdelicPoints F H))) (hUo : IsOpen (U : Set (FiniteAdelicPoints F H)))
    (rep : DoubleCoset.Quotient ((finiteDiagonal F H).range : Set (FiniteAdelicPoints F H)) U →
      FiniteAdelicPoints F H)
    (hrep : ∀ c, DoubleCoset.mk (finiteDiagonal F H).range U (rep c) = c) :
    (Σ c, MulAction.orbitRel.Quotient ((levelArithmetic F H (rep c) U).map (infiniteDiagonal F H))
      (InfinitePoints F H)) ≃ₜ LevelMaps.LevelQuotient F H U ⊥ :=
  sorry

theorem componentHomeomorph_mk [Algebra.FiniteType F H] (U : Subgroup (FiniteAdelicPoints F H))
    (hU : IsCompact (U : Set (FiniteAdelicPoints F H))) (hUo : IsOpen (U : Set (FiniteAdelicPoints F H)))
    (rep : DoubleCoset.Quotient ((finiteDiagonal F H).range : Set (FiniteAdelicPoints F H)) U →
      FiniteAdelicPoints F H)
    (hrep : ∀ c, DoubleCoset.mk (finiteDiagonal F H).range U (rep c) = c) (c) (g : InfinitePoints F H) :
    componentHomeomorph U hU hUo rep hrep ⟨c, Quotient.mk'' g⟩ =
      LevelMaps.LevelQuotient.mk U ⊥ (infiniteEmbed F H g * finiteEmbed F H (rep c)) := by
  sorry

/-- AA.3 target *finite volume*: `G(F)\G(𝔸_F)^1` has finite positive volume. -/
theorem finite_volume [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H))
    (μ : MeasureTheory.Measure (AdelicPoints F H)) [μ.IsHaarMeasure] :
    0 < AutomorphicQuotient.measure F H hred μ Set.univ ∧
      AutomorphicQuotient.measure F H hred μ Set.univ < ⊤ := by
  sorry

/-- AA.3 target *tamagawa number finite*. -/
theorem tamagawa_number_lt_top [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H))
    (ω : GaugeForm F H) (hω : ω ≠ 0) : Tamagawa.number F H hred ω < ⊤ := by
  sorry

/-- Right translation on `G(F)\G(𝔸_F)`. -/
def rightAct (g : AdelicPoints F H) :
    MulAction.orbitRel.Quotient (diagonal F H).range (AdelicPoints F H) →
      MulAction.orbitRel.Quotient (diagonal F H).range (AdelicPoints F H) :=
  Quotient.map' (· * g) (by sorry)

instance : MeasurableSpace (MulAction.orbitRel.Quotient (diagonal F H).range (AdelicPoints F H)) :=
  borel _

/-- AA.3 target *finite volume criterion*: for connected `G`, `G(F)\G(𝔸_F)` carries a nonzero finite
invariant Radon measure exactly when `X*_F(G) = 0`. -/
theorem finite_volume_iff [Algebra.FiniteType F H]
    (hconn : TauCeti.geometricallyConnectedCommHopfAlgProperty F (CommHopfAlgCat.of F H)) :
    (∃ ν : MeasureTheory.Measure (MulAction.orbitRel.Quotient (diagonal F H).range (AdelicPoints F H)),
      ν ≠ 0 ∧ MeasureTheory.IsFiniteMeasure ν ∧ ν.Regular ∧
        ∀ g, MeasureTheory.Measure.map (rightAct g) ν = ν) ↔
      Subsingleton (RationalCharacter F H) := by
  sorry

/-- Unipotent rational points, through a faithful algebraic representation. -/
def IsUnipotentPoint (n : ℕ) (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ)
    (γ : WithConv (H →ₐ[F] F)) : Prop :=
  IsNilpotent ((ρ γ : Matrix (Fin n) (Fin n) ℂ) - 1)

/-- AA.3 target *compactness isotropic* (Godement's criterion): `G(F)\G(𝔸_F)^1` is compact exactly when
`G(F)` has no nontrivial unipotent element. -/
theorem compactSpace_normOneQuotient_iff [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) (n : ℕ)
    (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) (τ : F →+* ℂ)
    (hρ : Neat.IsFaithfulAlgebraicPointHom τ n ρ) :
    CompactSpace (AutomorphicQuotient.NormOneQuotient F H) ↔
      ∀ γ, IsUnipotentPoint n ρ γ → γ = 1 := by
  sorry

/-- AA.3 target *arithmetic quotient finite volume*: `Γ\(G(F_∞)/A_G(ℝ)^0)` carries a nonzero finite
invariant measure for `Γ = G(F) ∩ U`. -/
theorem arithmeticQuotient_finite_volume [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H))
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H))) :
    letI : MeasurableSpace (MulAction.orbitRel.Quotient
        ((levelArithmetic F H 1 U).map (infiniteDiagonal F H))
        (InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H))) := borel _
    ∃ ν : MeasureTheory.Measure (MulAction.orbitRel.Quotient
        ((levelArithmetic F H 1 U).map (infiniteDiagonal F H))
        (InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H))),
      ν ≠ 0 ∧ MeasureTheory.IsFiniteMeasure ν ∧ ν.Regular ∧
        ∀ g : InfinitePoints F H,
          MeasureTheory.Measure.map (Quotient.map'
            (fun x : InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H) =>
              Quotient.liftOn' x
                (fun y => ((y * g : InfinitePoints F H) :
                  InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H)))
                (by sorry)) (by sorry)) ν = ν := by
  sorry

/-- AA.3 target *arithmetic quotient compact*: that quotient is compact exactly when `G(F)` has no nontrivial
unipotent element. -/
theorem arithmeticQuotient_compact_iff [Algebra.FiniteType F H]
    (hred : TauCeti.reductiveCommHopfAlgProperty F (finiteTypeObj F H)) (n : ℕ)
    (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) (τ : F →+* ℂ)
    (hρ : Neat.IsFaithfulAlgebraicPointHom τ n ρ)
    (U : Subgroup (FiniteAdelicPoints F H)) (hU : IsCompact (U : Set (FiniteAdelicPoints F H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints F H))) :
    CompactSpace (MulAction.orbitRel.Quotient ((levelArithmetic F H 1 U).map (infiniteDiagonal F H))
        (InfinitePoints F H ⧸ (SplitComponent F H).comap (infiniteEmbed F H))) ↔
      ∀ γ, IsUnipotentPoint n ρ γ → γ = 1 := by
  sorry

/-- AA.3 target *cocompact no unipotents*: over `ℚ`, if `Γ\G(ℝ)` is compact then `Γ = G(ℚ) ∩ U` has no
nontrivial unipotent element. -/
theorem no_unipotent_of_cocompact {H : Type} [CommRing H] [HopfAlgebra ℚ H] [Algebra.FiniteType ℚ H]
    (hred : TauCeti.reductiveCommHopfAlgProperty ℚ (finiteTypeObj ℚ H)) (n : ℕ)
    (ρ : WithConv (H →ₐ[ℚ] ℚ) →* GL (Fin n) ℂ) (hρ : Neat.IsFaithfulAlgebraicPointHom (Rat.castHom ℂ) n ρ)
    (U : Subgroup (FiniteAdelicPoints ℚ H)) (hU : IsCompact (U : Set (FiniteAdelicPoints ℚ H)))
    (hUo : IsOpen (U : Set (FiniteAdelicPoints ℚ H)))
    (hcpt : CompactSpace (MulAction.orbitRel.Quotient ((levelArithmetic ℚ H 1 U).map
      (infiniteDiagonal ℚ H)) (InfinitePoints ℚ H)))
    (γ : WithConv (H →ₐ[ℚ] ℚ)) (hγ : γ ∈ levelArithmetic ℚ H 1 U) (hu : IsUnipotentPoint n ρ γ) :
    γ = 1 := by
  sorry

/-- AA.3 target *adelic height*: `‖x‖_r = ∏_v ‖(r ⊕ r^∨)(x)_v‖_v` for the algebraic representation with
coordinate map `r` augmented by its dual, with entrywise maxima of normalized absolute values at
finite places and Hilbert–Schmidt norms raised to `[F_w : ℝ]` at archimedean places. Every local
factor is at least one, and the height is symmetric under inversion. -/
def height {m : ℕ} (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F m →ₐc[F] H) :
    AdelicPoints F H → ℝ :=
  sorry

theorem height_mul_le {m : ℕ} (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F m →ₐc[F] H)
    (x y : AdelicPoints F H) : height r (x * y) ≤ height r x * height r y := by
  sorry

theorem height_inv_le {m : ℕ} (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F m →ₐc[F] H) :
    ∃ C N : ℝ, 0 < C ∧ ∀ x, height r x⁻¹ ≤ C * height r x ^ N := by
  sorry

theorem isCompact_height_le [Algebra.FiniteType F H] {m : ℕ}
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F m →ₐc[F] H) (hr : Function.Surjective r)
    (t : ℝ) : IsCompact {x | height r x ≤ t} := by
  sorry

theorem card_rational_height_le [Algebra.FiniteType F H] {m : ℕ}
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F m →ₐc[F] H) (hr : Function.Surjective r) :
    ∃ C N : ℝ, ∀ t : ℝ, 1 ≤ t → ({γ | height r (diagonal F H γ) ≤ t}.ncard : ℝ) ≤ C * t ^ N := by
  sorry

/-- AA.3 target *rational coordinate height count*: `#{a ∈ F^d : ∏_v max(1, |a_1|_v, …, |a_d|_v) ≤ R}` is at
most `C R^N`, with Mathlib's product-formula normalized multiplicative height of `(1, a)`. -/
theorem card_height_le (d : ℕ) :
    ∃ C N : ℝ, ∀ R : ℝ, 1 ≤ R →
      ({a : Fin d → F | Height.mulHeight (Fin.cons (1 : F) a) ≤ R}.ncard : ℝ) ≤ C * R ^ N := by
  sorry

/-- AA.3 target *height representation comparison*: heights for two faithful representations are
polynomially equivalent. -/
theorem height_le_pow [Algebra.FiniteType F H] {m m' : ℕ}
    (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F m →ₐc[F] H) (hr : Function.Surjective r)
    (r' : TauCeti.GeneralLinear.coordinateHopfAlgebra F m' →ₐc[F] H) :
    ∃ C N : ℝ, 0 < C ∧ ∀ x, height r' x ≤ C * height r x ^ N := by
  sorry

theorem height_mul_compact_le {m : ℕ} (r : TauCeti.GeneralLinear.coordinateHopfAlgebra F m →ₐc[F] H)
    (K : Set (AdelicPoints F H)) (hK : IsCompact K) :
    ∃ C : ℝ, 0 < C ∧ ∀ x, ∀ k ∈ K, height r (x * k) ≤ C * height r x ∧ height r (k * x) ≤ C * height r x := by
  sorry

-- Test Reduction.height_one: over `ℚ` with `r` the standard representation of `GL_2`, `r ⊕ r^∨` has
-- size `m = 4` and the Hilbert–Schmidt factor gives `height 1 = m^{1/2} = 2`, not `1`.
example : height (F := ℚ) (H := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 2)
    (BialgHom.id ℚ _) 1 = 2 := by
  sorry

-- Test Reduction.height_gl1: for `GL_1/ℚ` with `r` the standard character, `r ⊕ r^∨ = diag(x, x⁻¹)`;
-- the real factor is `√(x_∞² + x_∞⁻²)` and the finite factors are `max(|x_p|_p, |x_p⁻¹|_p)`.
example (x : AdelicPoints ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ 1)) :
    let a : NumberField.AdeleRing (NumberField.RingOfIntegers ℚ) ℚ :=
      ((AdelicPoints.glnEquiv ℚ 1 x : GL (Fin 1) _) : Matrix (Fin 1) (Fin 1) _) 0 0
    let b : NumberField.AdeleRing (NumberField.RingOfIntegers ℚ) ℚ :=
      (((AdelicPoints.glnEquiv ℚ 1 x)⁻¹ : GL (Fin 1) _) : Matrix (Fin 1) (Fin 1) _) 0 0
    height (BialgHom.id ℚ _) x =
      Real.sqrt (‖NumberField.adeleInfPart ℚ a (NumberField.InfinitePlace.mk (Rat.castHom ℂ))‖ ^ 2 +
        ‖NumberField.adeleInfPart ℚ b (NumberField.InfinitePlace.mk (Rat.castHom ℂ))‖ ^ 2) *
      ∏ᶠ v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers ℚ),
        max (((TauCeti.normalizedAbsoluteValue (v.adicCompletion ℚ) (RingHom.snd _ _ a v) : ℚ≥0) : ℝ))
          (((TauCeti.normalizedAbsoluteValue (v.adicCompletion ℚ) (RingHom.snd _ _ b v) : ℚ≥0) : ℝ)) := by
  sorry

-- Test Reduction.height_not_finite_only: for `G(F_∞)` noncompact the height is unbounded; a
-- height built from the finite places alone would be bounded on `G(F_∞)`.
example (n : ℕ) (hn : 1 ≤ n) :
    ¬ BddAbove (Set.range (height (F := ℚ) (H := TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n)
      (BialgHom.id ℚ _))) := by
  sorry

end Reduction

namespace RealSiegel

open Matrix

variable {n : ℕ}

/-- AA.3 target *gram diagonal lower bound*: if `∏ B_kk ≤ D det B` then `aᵀ B a ≥ a_k² B_kk / D`. -/
theorem quadForm_ge_diag (B : Matrix (Fin n) (Fin n) ℝ) (hB : B.PosDef) (D : ℝ) (hD : 1 ≤ D)
    (hdet : ∏ k, B k k ≤ D * B.det) (a : Fin n → ℝ) (k : Fin n) :
    a k ^ 2 * B k k / D ≤ a ⬝ᵥ (B *ᵥ a) := by
  sorry

/-- AA.3 target *gram offdiagonal transfer*: bounds for the Gram matrix in one basis transfer to another
basis, with the explicit constant `C'³ L_i L_j m_i⁻²`. -/
theorem gram_offdiag_transfer (B : Matrix (Fin n) (Fin n) ℝ) (hB : B.PosDef) (C' : ℝ) (hC' : 1 ≤ C')
    (h1 : ∀ a b, |B a b| ≤ C' * B a a) (h2 : ∀ a b, a < b → B a a ≤ C' * B b b)
    (h3 : ∏ a, B a a ≤ C' * B.det) (A : Matrix (Fin n) (Fin n) ℝ) (k : Fin n → Fin n)
    (hk : ∀ i, A (k i) i ≠ 0 ∧ ∀ a, k i < a → A a i = 0) (i j : Fin n) :
    |(Aᵀ * B * A) i j| ≤ C' ^ 3 * (∑ a, |A a i|) * (∑ a, |A a j|) * |A (k i) i|⁻¹ ^ 2 *
      (Aᵀ * B * A) i i := by
  sorry

/-- AA.3 target *basis change reducedness*: with determinant control, reducedness in one basis gives
reducedness in a reordering of another, with a constant depending only on the data. -/
theorem exists_perm_isReduced (C C' : ℝ) (hC : 1 ≤ C) (hC' : 1 ≤ C') (A : GL (Fin n) ℚ) :
    ∃ C'' : ℝ, ∀ b : Matrix (Fin n) (Fin n) ℝ, b.PosDef → IsReduced C' b →
      let bA := ((A.map (algebraMap ℚ ℝ) : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ)ᵀ * b *
        ((A.map (algebraMap ℚ ℝ) : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ)
      ∏ i, bA i i ≤ C * bA.det →
        ∃ σ : Equiv.Perm (Fin n), IsReduced C'' (bA.submatrix σ σ) := by
  sorry

/-- AA.3 target *gln real reduction*: every positive definite form is `GL_n(ℤ)`-equivalent to a reduced
one. -/
theorem exists_reduced_GLZ : ∃ C : ℝ, 0 < C ∧ ∀ b : Matrix (Fin n) (Fin n) ℝ, b.PosDef →
    ∃ γ : GL (Fin n) ℤ, IsReduced C
      (((γ.map (Int.castRingHom ℝ) : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ)ᵀ * b *
        ((γ.map (Int.castRingHom ℝ) : GL (Fin n) ℝ) : Matrix (Fin n) (Fin n) ℝ)) := by
  sorry

end RealSiegel

namespace Reduction

/-- AA.3 target *gln finite class number one*: `GL_n(𝔸_{ℚ,f}) = GL_n(ℚ) GL_n(ℤ̂)`, for the standard model. -/
theorem gln_classes_subsingleton (n : ℕ) :
    Subsingleton (DoubleCoset.Quotient
      ((AdelicPoints.finiteDiagonal ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n)).range :
        Set (AdelicPoints.FiniteAdelicPoints ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n)))
      (IntegralModel.standardGLn (F := ℚ) (S := ∅) n).integralLevel) := by
  sorry

theorem gln_levelArithmetic (n : ℕ) :
    (levelArithmetic ℚ (TauCeti.GeneralLinear.coordinateHopfAlgebra ℚ n) 1
        (IntegralModel.standardGLn (F := ℚ) (S := ∅) n).integralLevel).map
      (TauCeti.GeneralLinear.pointsMulEquiv (R := ℚ) n).toMonoidHom =
      (Matrix.GeneralLinearGroup.map (Int.castRingHom ℚ)).range := by
  sorry

end Reduction

/-! ## Layer 5: GL₂ over ℚ: components, congruence groups and change of level

`GL (Fin 2) 𝔸_f` carries the topology of units of the matrix ring over Mathlib's finite adeles,
which is the evaluation topology of AA.1 for `GL₂`. The level quotient
`GL₂(ℚ)\GL₂(𝔸)/K∞U` with `K∞ = ℝ^×SO(2)` is written in the equivalent form
`GL₂(ℚ)^+\(ℍ × GL₂(𝔸_f)/U)`: AA.5 target *gl2 real quotient* identifies `GL₂(ℝ)/K∞` with `ℍ±`,
and a rational matrix of negative determinant exchanges the two half-planes. The
Riemann-surface structure of a quotient `Γ\ℍ` by a Fuchsian group is supplied by the Fuchsian
orbifolds roadmap (layers 0, 1 and 4) and is not in the pinned libraries; the statements below
give its topological and group-theoretic content. -/

namespace AdelicExamples.GL2

open scoped MatrixGroups UpperHalfPlane
open Matrix

/-- The finite adeles of `ℚ`. -/
abbrev Af := IsDedekindDomain.FiniteAdeleRing ℤ ℚ

/-- `x ∈ ℤ̂`: every component of `x` lies in `ℤ_p`. -/
def IsAdelicInteger (x : Af) : Prop :=
  ∀ v : IsDedekindDomain.HeightOneSpectrum ℤ, x v ∈ v.adicCompletionIntegers ℚ

/-- `x ≡ y mod N` in `ℤ̂`: `(x - y)/N ∈ ℤ̂`. -/
def CongrMod (N : ℕ) (x y : Af) : Prop :=
  IsAdelicInteger (algebraMap ℚ Af ((N : ℚ)⁻¹) * (x - y))

/-- The diagonal embedding `GL₂(ℚ) → GL₂(𝔸_f)`. -/
def diag : GL (Fin 2) ℚ →* GL (Fin 2) Af := Matrix.GeneralLinearGroup.map (algebraMap ℚ Af)

/-- Rational matrices as real matrices; `GL₂(ℚ)^+` acts on `ℍ` through Mathlib's `glAction`. -/
def toReal : GL (Fin 2) ℚ →* GL (Fin 2) ℝ := Matrix.GeneralLinearGroup.map (Rat.castHom ℝ)

/-- `ℤ̂^×` inside `𝔸_f^×`. -/
def zhatUnits : Subgroup Afˣ where
  carrier := {x | IsAdelicInteger (x : Af) ∧ IsAdelicInteger ((x⁻¹ : Afˣ) : Af)}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- `GL₂(ℤ̂)`: integral matrices with integral inverse. -/
def GL2Zhat : Subgroup (GL (Fin 2) Af) where
  carrier := {g | ∀ i j, IsAdelicInteger ((g : Matrix (Fin 2) (Fin 2) Af) i j) ∧
    IsAdelicInteger (((g⁻¹ : GL (Fin 2) Af) : Matrix (Fin 2) (Fin 2) Af) i j)}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- `K(N) = ker(GL₂(ℤ̂) → GL₂(ℤ/N))`. -/
def principalLevel (N : ℕ) : Subgroup (GL (Fin 2) Af) where
  carrier := {g | g ∈ GL2Zhat ∧
    ∀ i j, CongrMod N ((g : Matrix (Fin 2) (Fin 2) Af) i j) ((1 : Matrix (Fin 2) (Fin 2) Af) i j)}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- `K₀(N)`: matrices of `GL₂(ℤ̂)` with `c ≡ 0 mod N`. -/
def level0 (N : ℕ) : Subgroup (GL (Fin 2) Af) where
  carrier := {g | g ∈ GL2Zhat ∧ CongrMod N ((g : Matrix (Fin 2) (Fin 2) Af) 1 0) 0}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- `K₁(N)`: matrices of `GL₂(ℤ̂)` with `c ≡ 0` and `d ≡ 1 mod N`. -/
def level1 (N : ℕ) : Subgroup (GL (Fin 2) Af) where
  carrier := {g | g ∈ GL2Zhat ∧ CongrMod N ((g : Matrix (Fin 2) (Fin 2) Af) 1 0) 0 ∧
    CongrMod N ((g : Matrix (Fin 2) (Fin 2) Af) 1 1) 1}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

theorem principalLevel_le_level1 (N : ℕ) : principalLevel N ≤ level1 N := by
  sorry

theorem level1_le_level0 (N : ℕ) : level1 N ≤ level0 N := by
  sorry

theorem isOpen_principalLevel (N : ℕ) (hN : 0 < N) :
    IsOpen (principalLevel N : Set (GL (Fin 2) Af)) := by
  sorry

theorem isCompact_principalLevel (N : ℕ) : IsCompact (principalLevel N : Set (GL (Fin 2) Af)) := by
  sorry

/-- The principal levels form a neighbourhood basis of `1` in `GL₂(𝔸_f)`. -/
theorem exists_principalLevel_le {V : Set (GL (Fin 2) Af)} (hV : V ∈ 𝓝 (1 : GL (Fin 2) Af)) :
    ∃ M : ℕ, 0 < M ∧ (principalLevel M : Set (GL (Fin 2) Af)) ⊆ V := by
  sorry

/-! ### The component groups `Γ_{g,U}` -/

/-- `Γ_{g,U} = GL₂(ℚ)^+ ∩ gUg⁻¹`, with `GL₂(ℚ)` embedded diagonally. -/
def componentGroup (U : Subgroup (GL (Fin 2) Af)) (g : GL (Fin 2) Af) : Subgroup (GL (Fin 2) ℚ) :=
  GLPos (Fin 2) ℚ ⊓ (U.map (MulAut.conj g).toMonoidHom).comap diag

/-- The image of `Γ_{g,U}` in `GL₂(ℝ)`, acting on `ℍ` by Möbius transformations. -/
def componentGroupReal (U : Subgroup (GL (Fin 2) Af)) (g : GL (Fin 2) Af) :
    Subgroup (GL (Fin 2) ℝ) :=
  (componentGroup U g).map toReal

variable {U U' : Subgroup (GL (Fin 2) Af)}

/-- AA.5 target *gl2 congruence component groups*: elements of `Γ_{g,U}` have determinant one, since
`det U ⊆ ℤ̂^×` and `ℚ_{>0} ∩ ℤ̂^× = {1}`. -/
theorem det_eq_one_of_mem_componentGroup (hU : IsCompact (U : Set (GL (Fin 2) Af)))
    (g : GL (Fin 2) Af) {γ : GL (Fin 2) ℚ} (hγ : γ ∈ componentGroup U g) :
    Matrix.GeneralLinearGroup.det γ = 1 := by
  sorry

/-- If `K(M) ⊆ gUg⁻¹` then `Γ(M) ⊆ Γ_{g,U}`. -/
theorem gamma_le_componentGroup (g : GL (Fin 2) Af) {M : ℕ}
    (hM : principalLevel M ≤ U.map (MulAut.conj g).toMonoidHom) :
    (CongruenceSubgroup.Gamma M).map (SpecialLinearGroup.mapGL ℚ) ≤ componentGroup U g := by
  sorry

/-- `Γ_{g,U}` is commensurable with `SL₂(ℤ)`: its real image is arithmetic in Mathlib's sense.
Consequently it is discrete and acts properly discontinuously on `ℍ`
(`Subgroup.IsArithmetic.discreteTopology`, `Subgroup.IsArithmetic.properlyDiscontinuous`). -/
theorem isArithmetic_componentGroupReal (hU : IsCompact (U : Set (GL (Fin 2) Af)))
    (hUo : IsOpen (U : Set (GL (Fin 2) Af))) (g : GL (Fin 2) Af) :
    (componentGroupReal U g).IsArithmetic := by
  sorry

-- Test: the component quotient is Hausdorff, from proper discontinuity.
example (hU : IsCompact (U : Set (GL (Fin 2) Af))) (hUo : IsOpen (U : Set (GL (Fin 2) Af)))
    (g : GL (Fin 2) Af) :
    T2Space (Quotient (MulAction.orbitRel (componentGroupReal U g) ℍ)) := by
  have := isArithmetic_componentGroupReal hU hUo g
  infer_instance

/-- Changing the representative `g` to `qgu` conjugates the component group by `q`. -/
theorem componentGroup_mul (g : GL (Fin 2) Af) {q : GL (Fin 2) ℚ} (hq : q ∈ GLPos (Fin 2) ℚ)
    {u : GL (Fin 2) Af} (hu : u ∈ U) :
    componentGroup U (diag q * g * u) = (componentGroup U g).map (MulAut.conj q).toMonoidHom := by
  sorry

/-- `z ↦ q • z` induces a homeomorphism `Γ_{g,U}\ℍ ≃ Γ_{qgu,U}\ℍ`; it is a biholomorphism for
the Fuchsian-orbifold complex structures. -/
def conjQuotientHomeomorph (g : GL (Fin 2) Af) {q : GL (Fin 2) ℚ} (hq : q ∈ GLPos (Fin 2) ℚ)
    {u : GL (Fin 2) Af} (hu : u ∈ U) :
    MulAction.orbitRel.Quotient (componentGroupReal U g) ℍ ≃ₜ
      MulAction.orbitRel.Quotient (componentGroupReal U (diag q * g * u)) ℍ :=
  sorry

theorem conjQuotientHomeomorph_mk (g : GL (Fin 2) Af) {q : GL (Fin 2) ℚ}
    (hq : q ∈ GLPos (Fin 2) ℚ) {u : GL (Fin 2) Af} (hu : u ∈ U) (z : ℍ) :
    conjQuotientHomeomorph g hq hu (Quotient.mk'' z) = Quotient.mk'' (toReal q • z) := by
  sorry

theorem componentGroup_mono (h : U' ≤ U) (g : GL (Fin 2) Af) :
    componentGroup U' g ≤ componentGroup U g := by
  sorry

/-- For compact open `U' ≤ U`, `Γ_{g,U'}` has finite index in `Γ_{g,U}`. -/
theorem relIndex_componentGroup_ne_zero (h : U' ≤ U) (hU : IsCompact (U : Set (GL (Fin 2) Af)))
    (hU'o : IsOpen (U' : Set (GL (Fin 2) Af))) (g : GL (Fin 2) Af) :
    (componentGroup U' g).relIndex (componentGroup U g) ≠ 0 := by
  sorry

/-- The quotient map `Γ_{g,U'}\ℍ → Γ_{g,U}\ℍ` induced by the identity of `ℍ`; it is a finite
holomorphic map of the Fuchsian-orbifold Riemann surfaces. -/
def componentLevelMap (h : U' ≤ U) (g : GL (Fin 2) Af) :
    MulAction.orbitRel.Quotient (componentGroupReal U' g) ℍ →
      MulAction.orbitRel.Quotient (componentGroupReal U g) ℍ :=
  sorry

theorem componentLevelMap_mk (h : U' ≤ U) (g : GL (Fin 2) Af) (z : ℍ) :
    componentLevelMap h g (Quotient.mk'' z) = Quotient.mk'' z := by
  sorry

theorem continuous_componentLevelMap (h : U' ≤ U) (g : GL (Fin 2) Af) :
    Continuous (componentLevelMap h g) := by
  sorry

theorem finite_fibre_componentLevelMap (h : U' ≤ U) (hU : IsCompact (U : Set (GL (Fin 2) Af)))
    (hU'o : IsOpen (U' : Set (GL (Fin 2) Af))) (g : GL (Fin 2) Af)
    (x : MulAction.orbitRel.Quotient (componentGroupReal U g) ℍ) :
    (componentLevelMap h g ⁻¹' {x}).Finite := by
  sorry

/-! ### The level quotient and its components -/

/-- `GL₂(ℚ)^+`, embedded diagonally in `GL₂(𝔸_f)`. -/
def ratPos : Subgroup (GL (Fin 2) Af) := (GLPos (Fin 2) ℚ).map diag

/-- The components `GL₂(ℚ)^+\GL₂(𝔸_f)/U`. -/
abbrev Components (U : Subgroup (GL (Fin 2) Af)) :=
  DoubleCoset.Quotient (ratPos : Set (GL (Fin 2) Af)) U

/-- `(z, a) ∼ (q • z, q a u)` for `q ∈ GL₂(ℚ)^+` and `u ∈ U`. -/
def levelSetoid (U : Subgroup (GL (Fin 2) Af)) : Setoid (ℍ × GL (Fin 2) Af) where
  r x y := ∃ q ∈ GLPos (Fin 2) ℚ, ∃ u ∈ U, y.1 = toReal q • x.1 ∧ y.2 = diag q * x.2 * u
  iseqv := sorry

/-- The level quotient `X_U = GL₂(ℚ)^+\(ℍ × GL₂(𝔸_f)/U)`, with the quotient topology. -/
abbrev LevelSpace (U : Subgroup (GL (Fin 2) Af)) := Quotient (levelSetoid U)

/-- AA.5 target *gl2 upper half plane component*: for representatives `rep c` of the components,
`[z] ↦ [(z, rep c)]` is a homeomorphism `⊔_c Γ_{rep c, U}\ℍ ≃ X_U`. -/
def componentHomeomorph (hU : IsCompact (U : Set (GL (Fin 2) Af)))
    (hUo : IsOpen (U : Set (GL (Fin 2) Af))) (rep : Components U → GL (Fin 2) Af)
    (hrep : ∀ c, DoubleCoset.mk ratPos U (rep c) = c) :
    (Σ c : Components U, MulAction.orbitRel.Quotient (componentGroupReal U (rep c)) ℍ) ≃ₜ
      LevelSpace U :=
  sorry

theorem componentHomeomorph_mk (hU : IsCompact (U : Set (GL (Fin 2) Af)))
    (hUo : IsOpen (U : Set (GL (Fin 2) Af))) (rep : Components U → GL (Fin 2) Af)
    (hrep : ∀ c, DoubleCoset.mk ratPos U (rep c) = c)
    (c : Components U) (z : ℍ) :
    componentHomeomorph hU hUo rep hrep ⟨c, Quotient.mk'' z⟩ =
      (Quotient.mk (levelSetoid U) (z, rep c) : LevelSpace U) := by
  sorry

/-- `ℚ_{>0}` inside `𝔸_f^×`. -/
def posRatIdeles : Subgroup Afˣ :=
  (Units.posSubgroup ℚ).map (IsDedekindDomain.FiniteAdeleRing.unitEmbedding ℤ ℚ)

/-- The determinant identifies the components with `ℚ_{>0}\𝔸_f^×/det U`. -/
def componentsEquivDet (hU : IsCompact (U : Set (GL (Fin 2) Af)))
    (hUo : IsOpen (U : Set (GL (Fin 2) Af))) :
    Components U ≃ (Afˣ ⧸ (posRatIdeles ⊔ U.map Matrix.GeneralLinearGroup.det)) :=
  sorry

theorem componentsEquivDet_mk (hU : IsCompact (U : Set (GL (Fin 2) Af)))
    (hUo : IsOpen (U : Set (GL (Fin 2) Af))) (g : GL (Fin 2) Af) :
    componentsEquivDet hU hUo (DoubleCoset.mk _ _ g) =
      QuotientGroup.mk (Matrix.GeneralLinearGroup.det g) := by
  sorry

theorem finite_components (hU : IsCompact (U : Set (GL (Fin 2) Af)))
    (hUo : IsOpen (U : Set (GL (Fin 2) Af))) : Finite (Components U) := by
  sorry

/-- With `det U = ℤ̂^×` there is a single component. -/
theorem subsingleton_components (hU : IsCompact (U : Set (GL (Fin 2) Af)))
    (hUo : IsOpen (U : Set (GL (Fin 2) Af)))
    (hdet : U.map Matrix.GeneralLinearGroup.det = zhatUnits) : Subsingleton (Components U) := by
  sorry

-- Test: at level `GL₂(ℤ̂)` the quotient is the single component `SL₂(ℤ)\ℍ`.
example : componentGroup GL2Zhat 1 = (⊤ : Subgroup SL(2, ℤ)).map (SpecialLinearGroup.mapGL ℚ) := by
  sorry

/-! ### Principal and standard levels -/

/-- AA.5 target *gl2 principal level*: `det K(N)` is the group of `x ∈ ℤ̂^×` with `x ≡ 1 mod N`. -/
theorem map_det_principalLevel (N : ℕ) (hN : 0 < N) :
    ((principalLevel N).map Matrix.GeneralLinearGroup.det : Set Afˣ) =
      {x | x ∈ zhatUnits ∧ CongrMod N (x : Af) 1} := by
  sorry

/-- The components of `X_{K(N)}` are indexed by `(ℤ/N)^×`. -/
def componentsPrincipalEquiv (N : ℕ) (hN : 0 < N) :
    Components (principalLevel N) ≃ (ZMod N)ˣ :=
  sorry

/-- Each component group at level `K(N)`, for a representative in `GL₂(ℤ̂)`, is `Γ(N)`. -/
theorem componentGroup_principalLevel (N : ℕ) (hN : 0 < N) {g : GL (Fin 2) Af}
    (hg : g ∈ GL2Zhat) :
    componentGroup (principalLevel N) g =
      (CongruenceSubgroup.Gamma N).map (SpecialLinearGroup.mapGL ℚ) := by
  sorry

-- Test: `N = 1` and `N = 2` give one component.
example : Nat.card (Components (principalLevel 1)) = 1 ∧
    Nat.card (Components (principalLevel 2)) = 1 := by
  sorry

/-- AA.5 target *gl2 level riemann surfaces*: `K₀(N)` and `K₁(N)` have determinant `ℤ̂^×`, so their level
quotients are connected. -/
theorem map_det_level0 (N : ℕ) (hN : 0 < N) :
    (level0 N).map Matrix.GeneralLinearGroup.det = zhatUnits := by
  sorry

theorem map_det_level1 (N : ℕ) (hN : 0 < N) :
    (level1 N).map Matrix.GeneralLinearGroup.det = zhatUnits := by
  sorry

theorem componentGroup_level0 (N : ℕ) (hN : 0 < N) :
    componentGroup (level0 N) 1 =
      (CongruenceSubgroup.Gamma0 N).map (SpecialLinearGroup.mapGL ℚ) := by
  sorry

theorem componentGroup_level1 (N : ℕ) (hN : 0 < N) :
    componentGroup (level1 N) 1 =
      (CongruenceSubgroup.Gamma1 N).map (SpecialLinearGroup.mapGL ℚ) := by
  sorry

/-- The projection `X_{U'} → X_U` for `U' ≤ U`. -/
def levelMap (h : U' ≤ U) : LevelSpace U' → LevelSpace U :=
  Quotient.map' id (by sorry)

theorem levelMap_mk (h : U' ≤ U) (z : ℍ) (a : GL (Fin 2) Af) :
    levelMap h (Quotient.mk (levelSetoid U') (z, a)) = Quotient.mk (levelSetoid U) (z, a) := by
  sorry

theorem continuous_levelMap (h : U' ≤ U) : Continuous (levelMap h) := by
  sorry

/-- On components, the projection is `z ↦ q⁻¹ • z` followed by the finite-index quotient map: if
`g' = q g u` with `q ∈ GL₂(ℚ)^+` and `u ∈ U`, the class of `(z, g')` maps to that of `(q⁻¹ • z, g)`. -/
theorem levelMap_component (h : U' ≤ U) {g g' : GL (Fin 2) Af} {q : GL (Fin 2) ℚ}
    (hq : q ∈ GLPos (Fin 2) ℚ) {u : GL (Fin 2) Af} (hu : u ∈ U) (hg' : g' = diag q * g * u)
    (z : ℍ) :
    levelMap h (Quotient.mk (levelSetoid U') (z, g')) =
      Quotient.mk (levelSetoid U) (toReal q⁻¹ • z, g) := by
  sorry

/-- Right translation `T(h) : X_U → X_{h⁻¹Uh}`, `[(z, a)] ↦ [(z, a h)]`; a biholomorphism for the
transported complex structures. -/
def translate (h : GL (Fin 2) Af) :
    LevelSpace U ≃ₜ LevelSpace (U.map (MulAut.conj h⁻¹).toMonoidHom) :=
  sorry

theorem translate_mk (h : GL (Fin 2) Af) (z : ℍ) (a : GL (Fin 2) Af) :
    translate (U := U) h (Quotient.mk (levelSetoid U) (z, a)) =
      Quotient.mk (levelSetoid (U.map (MulAut.conj h⁻¹).toMonoidHom)) (z, a * h) := by
  sorry

-- Test: on the component of `1`, `K(N) ≤ K₁(N) ≤ K₀(N)` induce `Γ(N)\ℍ → Γ₁(N)\ℍ → Γ₀(N)\ℍ`.
example (N : ℕ) (hN : 0 < N) :
    componentGroup (principalLevel N) 1 ≤ componentGroup (level1 N) 1 ∧
      componentGroup (level1 N) 1 ≤ componentGroup (level0 N) 1 :=
  ⟨componentGroup_mono (principalLevel_le_level1 N) 1,
    componentGroup_mono (level1_le_level0 N) 1⟩

/-! ### `K∞ = ℝ^×O(2)` and the folded half-plane -/

/-- The components `GL₂(ℚ)\GL₂(𝔸_f)/U` for `K∞ = ℝ^×O(2)`. -/
abbrev ComponentsO2 (U : Subgroup (GL (Fin 2) Af)) :=
  DoubleCoset.Quotient (diag.range : Set (GL (Fin 2) Af)) U

/-- AA.5 target *gl2 orthogonal level components*: at level `K(N)` the `O(2)` components are
`(ℤ/N)^×/{±1}`. -/
def componentsO2PrincipalEquiv (N : ℕ) (hN : 0 < N) :
    ComponentsO2 (principalLevel N) ≃ (ZMod N)ˣ ⧸ Subgroup.zpowers (-1 : (ZMod N)ˣ) :=
  sorry

-- Test: at `N = 3` the `SO(2)` quotient has two components and the `O(2)` quotient one.
example : Nat.card (Components (principalLevel 3)) = 2 ∧
    Nat.card (ComponentsO2 (principalLevel 3)) = 1 := by
  sorry

-- Test: at `N = 5` the counts are four and two.
example : Nat.card (Components (principalLevel 5)) = 4 ∧
    Nat.card (ComponentsO2 (principalLevel 5)) = 2 := by
  sorry

/-! Neatness and Hecke degrees at `GL₂` levels, for the standard representation. -/

/-- The standard representation `GL₂(ℚ) → GL₂(ℂ)`. -/
def toComplex : GL (Fin 2) ℚ →* GL (Fin 2) ℂ := Matrix.GeneralLinearGroup.map (Rat.castHom ℂ)

-- Test Neat.isNeatLevel_U3: `U(3) = K(3)` is neat: every `GL₂(ℚ) ∩ x K(3) x⁻¹` is neat.
example (x : GL (Fin 2) Af) :
    ∀ γ ∈ ((principalLevel 3).map (MulAut.conj x).toMonoidHom).comap diag,
      Neat.IsNeatAut (toComplex γ) := by
  sorry

-- Test Neat.not_isNeatLevel_GL2Zhat: `GL₂(ℤ̂)` is not neat, since it contains `-1 ∈ GL₂(ℤ)`.
example : -1 ∈ GL2Zhat.comap diag ∧ ¬ Neat.IsNeatAut (toComplex (-1)) := by
  sorry

/-- `diag(p, 1)`. -/
def diagP (p : ℕ) [Fact p.Prime] : GL (Fin 2) Af :=
  diag (Matrix.GeneralLinearGroup.mkOfDetNeZero !![(p : ℚ), 0; 0, 1] (by sorry))

-- Test LevelMaps.hecke_Tp_degree: for `U = GL₂(ℤ̂)` and `g = diag(p, 1)`, `[U : U ∩ gUg⁻¹] = p + 1`.
example (p : ℕ) [Fact p.Prime] :
    (GL2Zhat ⊓ GL2Zhat.map (MulAut.conj (diagP p)).toMonoidHom).relIndex GL2Zhat = p + 1 := by
  sorry

-- Test Reduction.levelArithmetic_gl2: `GL₂(ℚ) ∩ GL₂(ℤ̂) = GL₂(ℤ)`.
example : GL2Zhat.comap diag = (Matrix.GeneralLinearGroup.map (Int.castRingHom ℚ)).range := by
  sorry

-- Test Reduction.levelArithmetic_not_conj_invariant: the arithmetic group depends on `x`: at
-- `x = diag(p, 1)` it is `diag(p,1) GL₂(ℤ) diag(p,1)⁻¹ ≠ GL₂(ℤ)`.
example (p : ℕ) [Fact p.Prime] :
    (GL2Zhat.map (MulAut.conj (diagP p)).toMonoidHom).comap diag ≠ GL2Zhat.comap diag := by
  sorry

end AdelicExamples.GL2

/-! ## Layer 5: GL₁ over a number field: idele classes, units and the quotients `X_Q`

`G_m(𝔸_F)` is identified with the idele group by `AdelicPoints.gmEquiv`; the statements below are
written on Mathlib's ideles. -/

namespace AdelicExamples.GL1

open _root_.NumberField NumberField

variable (F : Type) [Field F] [NumberField F]

/-- AA.5 target *gl1 adelic quotient*: `G_m(F)\G_m(𝔸_F)` is the idele class group. -/
def quotientHomeomorph :
    MulAction.orbitRel.Quotient (AdelicPoints.diagonal F (LaurentPolynomial F)).range
        (AdelicPoints F (LaurentPolynomial F)) ≃ₜ
      IdeleClassGroup (RingOfIntegers F) F :=
  sorry

theorem quotientHomeomorph_mk (x : AdelicPoints F (LaurentPolynomial F)) :
    quotientHomeomorph F (Quotient.mk'' x) = QuotientGroup.mk (AdelicPoints.gmEquiv F x) := by
  sorry

/-- The real number `t` in the completion `F_w`. -/
def archComponent (t : ℝ) (w : InfinitePlace F) : w.Completion :=
  if hw : w.IsReal then (InfinitePlace.Completion.ringEquivRealOfIsReal hw).symm t
  else (InfinitePlace.Completion.ringEquivComplexOfIsComplex
    (InfinitePlace.not_isReal_iff_isComplex.mp hw)).symm (t : ℂ)

/-- The idele with component `t` at every archimedean place and `1` at every finite place
(for `t = 0` the junk value `1`). -/
def archimedeanScalar (t : ℝ) : IdeleGroup (RingOfIntegers F) F :=
  if ht : t = 0 then 1 else
    { val := ((fun w => archComponent F t w : InfiniteAdeleRing F), 1)
      inv := ((fun w => archComponent F t⁻¹ w : InfiniteAdeleRing F), 1)
      val_inv := by sorry
      inv_val := by sorry }

/-- `ℝ_{>0}`, embedded diagonally at the archimedean places. -/
def posRealsDiag : Subgroup (IdeleGroup (RingOfIntegers F) F) where
  carrier := {x | ∃ t : ℝ, 0 < t ∧ x = archimedeanScalar F t}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

theorem ideleNorm_archimedeanScalar (t : ℝ) (ht : 0 < t) :
    ideleNorm F (archimedeanScalar F t) = t ^ Module.finrank ℚ F := by
  sorry

/-- `A_{G_m}(ℝ)^0 = ℝ_{>0}` embedded diagonally. -/
theorem map_splitComponent :
    (AdelicPoints.SplitComponent F (LaurentPolynomial F)).map (AdelicPoints.gmEquiv F).toMonoidHom =
      posRealsDiag F := by
  sorry

/-- `𝔸_F^× = 𝔸_F^1 × ℝ_{>0}`. -/
def normOneProdEquiv : (normOneIdeles F × posRealsDiag F) ≃ₜ* IdeleGroup (RingOfIntegers F) F :=
  sorry

theorem normOneProdEquiv_apply (x : normOneIdeles F × posRealsDiag F) :
    normOneProdEquiv F x = (x.1 : IdeleGroup (RingOfIntegers F) F) * x.2 := by
  sorry

/-- `F^×\𝔸_F^1` is compact while `F^×\𝔸_F^×` is not. -/
theorem isCompact_normOne_classes :
    IsCompact (((normOneIdeles F).map (QuotientGroup.mk' (IdeleGroup.principalSubgroup
      (RingOfIntegers F) F))) : Set (IdeleClassGroup (RingOfIntegers F) F)) := by
  sorry

theorem not_compactSpace_ideleClassGroup :
    ¬ CompactSpace (IdeleClassGroup (RingOfIntegers F) F) := by
  sorry

/-- `Ô^× = ∏_v 𝒪_v^×` inside `𝔸_{F,f}^×`. -/
def integralUnits : Subgroup (IsDedekindDomain.FiniteAdeleRing (RingOfIntegers F) F)ˣ where
  carrier := {x | ∀ v, (x : IsDedekindDomain.FiniteAdeleRing (RingOfIntegers F) F) v ∈
      v.adicCompletionIntegers F ∧
    ((x⁻¹ : (IsDedekindDomain.FiniteAdeleRing (RingOfIntegers F) F)ˣ) :
      IsDedekindDomain.FiniteAdeleRing (RingOfIntegers F) F) v ∈ v.adicCompletionIntegers F}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

-- Test LevelMaps.LevelQuotient.gl1_rat: for `GL_1/ℚ`, `U = ℤ̂^×` and `K∞ = ℝ^×`, `X_U` is a point.
example : Subsingleton (LevelMaps.LevelQuotient ℚ (LaurentPolynomial ℚ)
    ((integralUnits ℚ).comap (AdelicPoints.gmFiniteEquiv ℚ).toMonoidHom) ⊤) := by
  sorry

/-- AA.5 target *gl1 class number*: `F^×\𝔸_{F,f}^×/Ô^× ≃ Cl(𝒪_F)`. -/
def classGroupEquiv :
    ((IsDedekindDomain.FiniteAdeleRing (RingOfIntegers F) F)ˣ ⧸
      ((IsDedekindDomain.FiniteAdeleRing.unitEmbedding (RingOfIntegers F) F).range ⊔
        integralUnits F)) ≃* ClassGroup (RingOfIntegers F) :=
  sorry

theorem card_classes :
    Nat.card ((IsDedekindDomain.FiniteAdeleRing (RingOfIntegers F) F)ˣ ⧸
      ((IsDedekindDomain.FiniteAdeleRing.unitEmbedding (RingOfIntegers F) F).range ⊔
        integralUnits F)) = classNumber F := by
  sorry

-- Test Reduction.levelArithmetic_trivial_group: `ℚ^× ∩ ℤ̂^× = {±1}`, and with the congruence
-- condition `u ≡ 1 mod N`, `N ≥ 3`, the intersection is trivial.
example : (integralUnits ℚ).comap (IsDedekindDomain.FiniteAdeleRing.unitEmbedding (RingOfIntegers ℚ) ℚ) =
    Subgroup.zpowers (-1) := by
  sorry

example (N : ℕ) (hN : 3 ≤ N) :
    {q : ℚˣ | IsDedekindDomain.FiniteAdeleRing.unitEmbedding (RingOfIntegers ℚ) ℚ q ∈ integralUnits ℚ ∧
      ∀ v : IsDedekindDomain.HeightOneSpectrum (RingOfIntegers ℚ),
        (algebraMap ℚ (v.adicCompletion ℚ) (N : ℚ))⁻¹ * (algebraMap ℚ (v.adicCompletion ℚ) q - 1) ∈
          v.adicCompletionIntegers ℚ} = {1} := by
  sorry

/-- The global units in a subgroup `U ≤ Ô^×`: `Γ_U = F^× ∩ U`, as units of `𝒪_F`. -/
def levelUnits (U : Subgroup (IsDedekindDomain.FiniteAdeleRing (RingOfIntegers F) F)ˣ) :
    Subgroup (RingOfIntegers F)ˣ :=
  U.comap ((IsDedekindDomain.FiniteAdeleRing.unitEmbedding (RingOfIntegers F) F).comp
    (Units.map (algebraMap (RingOfIntegers F) F).toMonoidHom))

/-- AA.5 target *gl1 units lattice*: for compact open `U ≤ Ô^×`, `Γ_U` has finite index in `𝒪_F^×` and
its logarithmic image is a lattice of rank `r₁ + r₂ - 1`. -/
theorem levelUnits_finiteIndex (U : Subgroup (IsDedekindDomain.FiniteAdeleRing (RingOfIntegers F) F)ˣ)
    (hU : IsOpen (U : Set (IsDedekindDomain.FiniteAdeleRing (RingOfIntegers F) F)ˣ))
    (hle : U ≤ integralUnits F) : (levelUnits F U).FiniteIndex := by
  sorry

theorem levelUnits_lattice (U : Subgroup (IsDedekindDomain.FiniteAdeleRing (RingOfIntegers F) F)ˣ)
    (hU : IsOpen (U : Set (IsDedekindDomain.FiniteAdeleRing (RingOfIntegers F) F)ˣ))
    (hle : U ≤ integralUnits F) :
    DiscreteTopology (AddSubgroup.closure
        ((Units.logEmbedding F ∘ Additive.ofMul) '' (levelUnits F U : Set (RingOfIntegers F)ˣ))) ∧
      Module.finrank ℤ (Submodule.span ℤ
        ((Units.logEmbedding F ∘ Additive.ofMul) '' (levelUnits F U : Set (RingOfIntegers F)ˣ))) =
        Units.rank F := by
  sorry

/-! The quotients `X_Q`. Throughout, `Q` is a finite set of finite places with
`N(v) ≡ 1 mod p^n` for `v ∈ Q`. -/

/-- `U_Q = K_∞ × ∏_v U_{Q,v}`: `K_∞ = (S¹)^{r₂}` (trivial at real places, the unit circle at
complex places), `U_{Q,v} = 𝒪_v^×` for `v ∉ Q`, and the `p^n`-th powers of `𝒪_v^×` (the subgroup of
index `p^n`) for `v ∈ Q`. -/
def levelQ (Q : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))) (p n : ℕ) :
    Subgroup (IdeleGroup (RingOfIntegers F) F) where
  carrier := {x |
    (∀ w : InfinitePlace F, w.IsReal →
      adeleInfPart F (x : AdeleRing (RingOfIntegers F) F) w = 1) ∧
    (∀ w : InfinitePlace F, w.IsComplex →
      ‖adeleInfPart F (x : AdeleRing (RingOfIntegers F) F) w‖ = 1) ∧
    (∀ v, v ∉ Q → RingHom.snd _ _ (x : AdeleRing (RingOfIntegers F) F) v ∈
        v.adicCompletionIntegers F ∧
      RingHom.snd _ _ ((x⁻¹ : IdeleGroup (RingOfIntegers F) F) : AdeleRing (RingOfIntegers F) F) v ∈
        v.adicCompletionIntegers F) ∧
    (∀ v ∈ Q, ∃ y : (v.adicCompletionIntegers F)ˣ,
      RingHom.snd _ _ (x : AdeleRing (RingOfIntegers F) F) v = ((y ^ (p ^ n) : (v.adicCompletionIntegers F)ˣ) :
        v.adicCompletion F))}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- `X_Q = F^×\𝔸_F^×/U_Q A_∞^0`, with the quotient topology. -/
abbrev XQ (Q : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))) (p n : ℕ) :=
  IdeleGroup (RingOfIntegers F) F ⧸
    (IdeleGroup.principalSubgroup (RingOfIntegers F) F ⊔ levelQ F Q p n ⊔ posRealsDiag F)

/-- `(F ⊗ ℝ)^{×,0}`: positive at real places, arbitrary at complex places, `1` at finite places. -/
def archIdentityComponent : Subgroup (IdeleGroup (RingOfIntegers F) F) where
  carrier := {x | (∀ v, RingHom.snd _ _ (x : AdeleRing (RingOfIntegers F) F) v = 1) ∧
    ∀ w : InfinitePlace F, w.IsReal → ∃ t : ℝ, 0 < t ∧
      adeleInfPart F (x : AdeleRing (RingOfIntegers F) F) w =
        adeleInfPart F (archimedeanScalar F t : AdeleRing (RingOfIntegers F) F) w}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

variable (Q : Finset (IsDedekindDomain.HeightOneSpectrum (RingOfIntegers F))) (p n : ℕ)

/-- `AA.5 target *gl1 *XQ-components`: `π₀(X_Q) = F^×\𝔸_F^×/U_Q (F ⊗ ℝ)^{×,0}`. -/
def componentsEquiv [Fact p.Prime] (hQ : ∀ v ∈ Q, Ideal.absNorm v.asIdeal ≡ 1 [MOD p ^ n]) :
    ConnectedComponents (XQ F Q p n) ≃
      (IdeleGroup (RingOfIntegers F) F ⧸ (IdeleGroup.principalSubgroup (RingOfIntegers F) F ⊔
        levelQ F Q p n ⊔ archIdentityComponent F)) :=
  sorry

theorem finite_components [Fact p.Prime] (hQ : ∀ v ∈ Q, Ideal.absNorm v.asIdeal ≡ 1 [MOD p ^ n]) :
    Finite (ConnectedComponents (XQ F Q p n)) := by
  sorry

/-- The ideles supported on `Q` with unit components there. -/
def localUnitsQ : Subgroup (IdeleGroup (RingOfIntegers F) F) where
  carrier := {x | adeleInfPart F (x : AdeleRing (RingOfIntegers F) F) = 1 ∧
    (∀ v, v ∉ Q → RingHom.snd _ _ (x : AdeleRing (RingOfIntegers F) F) v = 1) ∧
    ∀ v ∈ Q, RingHom.snd _ _ (x : AdeleRing (RingOfIntegers F) F) v ∈ v.adicCompletionIntegers F ∧
      RingHom.snd _ _ ((x⁻¹ : IdeleGroup (RingOfIntegers F) F) : AdeleRing (RingOfIntegers F) F) v ∈
        v.adicCompletionIntegers F}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

/-- The narrow class group, idelically: `F^×\𝔸_F^×/Ô^× (F ⊗ ℝ)^{×,0}`. -/
abbrev NarrowClasses :=
  IdeleGroup (RingOfIntegers F) F ⧸ (IdeleGroup.principalSubgroup (RingOfIntegers F) F ⊔
    levelQ F ∅ 0 0 ⊔ archIdentityComponent F)

/-- `π₀(X_Q)` is an extension of the narrow class group by a quotient of
`∏_{v ∈ Q} 𝒪_v^×/𝒪_v^{×p^n}`: the natural map is surjective and its kernel is generated by the
classes of ideles supported on `Q` with unit components there. -/
theorem components_to_narrow [Fact p.Prime]
    (hQ : ∀ v ∈ Q, Ideal.absNorm v.asIdeal ≡ 1 [MOD p ^ n]) :
    ∃ π : (IdeleGroup (RingOfIntegers F) F ⧸ (IdeleGroup.principalSubgroup (RingOfIntegers F) F ⊔
        levelQ F Q p n ⊔ archIdentityComponent F)) →* NarrowClasses F,
      Function.Surjective π ∧
      (∀ x : IdeleGroup (RingOfIntegers F) F, π (QuotientGroup.mk x) = QuotientGroup.mk x) ∧
      π.ker = (localUnitsQ F Q).map (QuotientGroup.mk' _) := by
  sorry

/-- The totally positive congruence units `F^× ∩ U_{Q,f}`, as units of `𝒪_F`. -/
def congruenceUnits : Subgroup (RingOfIntegers F)ˣ :=
  (levelQ F Q p n ⊔ archIdentityComponent F).comap
    ((Units.map (algebraMap F (AdeleRing (RingOfIntegers F) F))).comp
      (Units.map (algebraMap (RingOfIntegers F) F).toMonoidHom))

/-- AA.5 target *gl1 logarithmic torus*: `W/Λ_Q` with `W = ℝ^{r₁+r₂}/ℝ(1, …, 1)`, here in Mathlib's
coordinates `logSpace F` (omitting one place), and `Λ_Q` the logarithmic image of the totally
positive congruence units. -/
abbrev LogTorus :=
  Units.dirichletUnitTheorem.logSpace F ⧸
    AddSubgroup.closure ((Units.logEmbedding F ∘ Additive.ofMul) ''
      (congruenceUnits F Q p n : Set (RingOfIntegers F)ˣ))

/-- The identity component of `X_Q` is the logarithmic torus, a compact real torus of dimension
`r₁ + r₂ - 1 = NumberField.Units.rank F` (this is the invariant `l₀` of `GL₁/F`). -/
def identityComponentHomeomorph [Fact p.Prime]
    (hQ : ∀ v ∈ Q, Ideal.absNorm v.asIdeal ≡ 1 [MOD p ^ n]) :
    LogTorus F Q p n ≃ₜ connectedComponent (1 : XQ F Q p n) :=
  sorry

theorem logTorus_homeomorph_torus [Fact p.Prime]
    (hQ : ∀ v ∈ Q, Ideal.absNorm v.asIdeal ≡ 1 [MOD p ^ n]) :
    Nonempty (LogTorus F Q p n ≃ₜ (Fin (Units.rank F) → UnitAddCircle)) := by
  sorry

/-- AA.5 target *gl1 component dimension*: every component of `X_Q` is a torus of dimension
`NumberField.Units.rank F`. -/
theorem component_homeomorph_torus [Fact p.Prime]
    (hQ : ∀ v ∈ Q, Ideal.absNorm v.asIdeal ≡ 1 [MOD p ^ n]) (x : XQ F Q p n) :
    Nonempty (connectedComponent x ≃ₜ (Fin (Units.rank F) → UnitAddCircle)) := by
  sorry

/-- `AA.5 target *gl1 *H0`: locally constant `ℤ_p`-valued functions on `X_Q` are functions on `π₀(X_Q)`. -/
def locallyConstantEquiv [hp : Fact p.Prime]
    (hQ : ∀ v ∈ Q, Ideal.absNorm v.asIdeal ≡ 1 [MOD p ^ n]) :
    LocallyConstant (XQ F Q p n) ℤ_[p] ≃ₗ[ℤ_[p]] (ConnectedComponents (XQ F Q p n) → ℤ_[p]) :=
  sorry

/-- AA.5 target *gl1 hecke action*: right translation by the class of a finite idele `a` (a uniformizer
at `v ∉ Q`, or a unit at `v ∈ Q` for the diamond operator) moves each component to the component
of its translate. -/
theorem translate_connectedComponent (a : IdeleGroup (RingOfIntegers F) F) (x : XQ F Q p n) :
    (fun y : XQ F Q p n => y * QuotientGroup.mk a) '' connectedComponent x =
      connectedComponent (x * QuotientGroup.mk a) := by
  sorry

end AdelicExamples.GL1

/-! ## Layer 5: Definite quaternion algebras over ℚ

`D = ℍ[ℚ, a, b]` with `a, b < 0` is a definite quaternion division algebra. Its finite adelic
points `(D ⊗ 𝔸_f)^×` are the units of `ℍ[𝔸_f, a, b]`, with the product topology on the four
coordinates. -/

namespace AdelicExamples.DefiniteQuaternion

open scoped Quaternion

/-- The finite adeles of `ℚ`. -/
abbrev Af := IsDedekindDomain.FiniteAdeleRing ℤ ℚ

variable (a b : ℚ)

instance : TopologicalSpace ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b] :=
  TopologicalSpace.induced (QuaternionAlgebra.equivTuple _ _ _) inferInstance

/-- Coefficientwise extension `D → D ⊗ 𝔸_f`. -/
def coeffMap : ℍ[ℚ, a, b] →+* ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b] where
  toFun x := ⟨algebraMap ℚ Af x.re, algebraMap ℚ Af x.imI, algebraMap ℚ Af x.imJ,
    algebraMap ℚ Af x.imK⟩
  map_one' := sorry
  map_mul' := sorry
  map_zero' := sorry
  map_add' := sorry

/-- The diagonal `D^× → (D ⊗ 𝔸_f)^×`. -/
def diag : ℍ[ℚ, a, b]ˣ →* ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ :=
  Units.map (coeffMap a b).toMonoidHom

/-- `Cl(U) = D^×\(D ⊗ 𝔸_f)^×/U`. -/
abbrev Classes (U : Subgroup ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ) :=
  DoubleCoset.Quotient ((diag a b).range : Set ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ) U

/-- `Γ_{x,U} = D^× ∩ xUx⁻¹`. -/
def stab (U : Subgroup ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ)
    (x : ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ) : Subgroup ℍ[ℚ, a, b]ˣ :=
  (U.map (MulAut.conj x).toMonoidHom).comap (diag a b)

variable {a b} (ha : a < 0) (hb : b < 0)
include ha hb

/-- AA.5 target *definite quaternion compact*: the class set is finite for every compact open level. -/
theorem finite_classes (U : Subgroup ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ)
    (hU : IsCompact (U : Set ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ))
    (hUo : IsOpen (U : Set ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ)) :
    Finite (Classes a b U) := by
  sorry

/-- Each `Γ_{x,U}` is finite. -/
theorem finite_stab (U : Subgroup ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ)
    (hU : IsCompact (U : Set ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ))
    (x : ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ) : Finite (stab a b U x) := by
  sorry

/-- `D^×/ℚ^×` is discrete in `(D ⊗ 𝔸_f)^×/𝔸_f^×`: the diagonal meets every compact open level in
finitely many elements modulo rational scalars. -/
theorem finite_stab_mod_scalars (U : Subgroup ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ)
    (hU : IsCompact (U : Set ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ))
    (hUo : IsOpen (U : Set ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ)) :
    Finite ((U ⊔ (Units.map (algebraMap Af ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]).toMonoidHom).range).comap
      (diag a b) ⧸ ((Units.map (algebraMap ℚ ℍ[ℚ, a, b]).toMonoidHom).range.subgroupOf
        ((U ⊔ (Units.map (algebraMap Af ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]).toMonoidHom).range).comap
          (diag a b)))) := by
  sorry

/-- AA.5 target *definite quaternion mass*: the mass `∑_{x ∈ Cl(U)} 1/|Γ_x/(ℚ^× ∩ U)|` scales with the
index under `U' ≤ U`. -/
theorem mass_le (U U' : Subgroup ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ) (h : U' ≤ U)
    (hU : IsCompact (U : Set ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ))
    (hU'o : IsOpen (U' : Set ℍ[Af, algebraMap ℚ Af a, algebraMap ℚ Af b]ˣ)) :
    (∑ᶠ c : Classes a b U',
        ((Nat.card (stab a b U' (Quotient.out c)) : ℚ) / Nat.card ↥(stab a b U' 1 ⊓
          (Units.map (algebraMap ℚ ℍ[ℚ, a, b]).toMonoidHom).range))⁻¹) =
      ((U'.relIndex U : ℚ) /
        ((stab a b U' 1 ⊓ (Units.map (algebraMap ℚ ℍ[ℚ, a, b]).toMonoidHom).range).relIndex
          (stab a b U 1 ⊓ (Units.map (algebraMap ℚ ℍ[ℚ, a, b]).toMonoidHom).range) : ℚ)) *
      ∑ᶠ c : Classes a b U,
        ((Nat.card (stab a b U (Quotient.out c)) : ℚ) / Nat.card ↥(stab a b U 1 ⊓
          (Units.map (algebraMap ℚ ℍ[ℚ, a, b]).toMonoidHom).range))⁻¹ := by
  sorry

/-- The reduced norm `Nrd(x) = x x̄` of a quaternion algebra. -/
def nrd {R : Type*} [CommRing R] {c₁ c₂ : R} (x : ℍ[R, c₁, c₂]) : R := (x * star x).re

omit ha hb in
/-- AA.4 target *quaternion reduced norm image*: `Nrd(B_p^×) = ℚ_p^×` at every prime. -/
theorem nrd_surjective_local (a b : ℚ) (ha : a ≠ 0) (hb : b ≠ 0)
    (p : ℕ) [Fact p.Prime] (c : ℚ_[p]) (hc : c ≠ 0) :
    ∃ x : ℍ[ℚ_[p], (a : ℚ_[p]), (b : ℚ_[p])], x ≠ 0 ∧ nrd x = c := by
  sorry

omit ha hb in
/-- At `∞`, `Nrd(B_∞^×)` is `ℝ^×` if `B` splits at `∞` and `ℝ_{>0}` otherwise. -/
theorem nrd_image_real (a b : ℚ) (ha : a ≠ 0) (hb : b ≠ 0) (c : ℝ) (hc : c ≠ 0) :
    (∃ x : ℍ[ℝ, (a : ℝ), (b : ℝ)], x ≠ 0 ∧ nrd x = c) ↔ (0 < c ∨ ¬ (a < 0 ∧ b < 0)) := by
  sorry

omit ha hb in
/-- Hasse–Schilling–Maass: `Nrd(B^×)` is `ℚ^×` if `B` splits at `∞` and `ℚ_{>0}` otherwise. -/
theorem nrd_image_global (a b : ℚ) (ha : a ≠ 0) (hb : b ≠ 0) (c : ℚ) (hc : c ≠ 0) :
    (∃ x : ℍ[ℚ, a, b], x ≠ 0 ∧ nrd x = c) ↔ (0 < c ∨ ¬ (a < 0 ∧ b < 0)) := by
  sorry

end AdelicExamples.DefiniteQuaternion

/-! ## Layer 1: restriction of scalars on adelic points

Two further imported interfaces, written in their defining form so that the adelic signatures
elaborate; the declarations of their owners replace them. `ResHopf`, its Hopf structure,
`pointsMulEquiv` and `mapHopf` are the Weil restriction of ReductiveGroupsPartII, RG2.0a.
`adeleBaseChange` is the topological base-change comparison `E ⊗_F 𝔸_F ≃ 𝔸_E` of the Global
number fields roadmap, layer 8, read as an `E`-algebra isomorphism through the left factor. -/

namespace WeilRestriction

/-- ReductiveGroupsPartII, RG2.0a: the Weil restriction `Res_{k'/k}` of a commutative Hopf
`k'`-algebra along a finite locally free `k → k'`, as a commutative Hopf `k`-algebra. -/
def ResHopf (k : Type) [CommRing k] (k' : Type) [CommRing k'] [Algebra k k']
    (H' : Type) [CommRing H'] [HopfAlgebra k' H'] : Type := sorry

variable (k : Type) [CommRing k] (k' : Type) [CommRing k'] [Algebra k k']
  [Module.Finite k k'] [Module.Projective k k'] (H' : Type) [CommRing H'] [HopfAlgebra k' H']

instance : CommRing (ResHopf k k' H') := sorry

instance instHopfAlgebraRes : HopfAlgebra k (ResHopf k k' H') := sorry

/-- The point adjunction: points of `Res_{k'/k} G'` over `R` are points of `G'` over `k' ⊗_k R`,
as groups (ReductiveGroupsPartII, RG2.0a). -/
def pointsMulEquiv (R : Type) [CommRing R] [Algebra k R] :
    WithConv (ResHopf k k' H' →ₐ[k] R) ≃* WithConv (H' →ₐ[k'] k' ⊗[k] R) := sorry

/-- Functoriality of the Weil restriction in coordinate Hopf maps (ReductiveGroupsPartII,
RG2.0a). -/
def mapHopf {H'' : Type} [CommRing H''] [HopfAlgebra k' H''] (φ : H'' →ₐc[k'] H') :
    ResHopf k k' H'' →ₐc[k] ResHopf k k' H' := sorry

/-- Transitivity `Res_{k'/k} ∘ Res_{k''/k'} ≅ Res_{k''/k}` in Hopf form (ReductiveGroupsPartII,
RG2.0a, `compEquiv`). -/
def compHopfEquiv (k'' : Type) [CommRing k''] [Algebra k' k''] [Algebra k k'']
    [IsScalarTower k k' k''] [Module.Finite k' k''] [Module.Projective k' k'']
    (H'' : Type) [CommRing H''] [HopfAlgebra k'' H''] :
    ResHopf k k' (ResHopf k' k'' H'') →ₐc[k] ResHopf k k'' H'' := sorry

end WeilRestriction

/-- Global number fields, layer 8: the base-change comparison `E ⊗_F 𝔸_F ≃ 𝔸_E` for a finite
extension `E/F` of number fields, as an `E`-algebra isomorphism. Its continuity in both directions
is `continuous_adeleBaseChange`. -/
def adeleBaseChange (F : Type) [Field F] [NumberField F] (E : Type) [Field E] [NumberField E]
    [Algebra F E] :
    E ⊗[F] NumberField.AdeleRing (NumberField.RingOfIntegers F) F ≃ₐ[E]
      NumberField.AdeleRing (NumberField.RingOfIntegers E) E := sorry

/-- The comparison is a homeomorphism for the module topology on the tensor product (Global
number fields, layer 8). -/
theorem continuous_adeleBaseChange (F : Type) [Field F] [NumberField F] (E : Type) [Field E]
    [NumberField E] [Algebra F E] :
    letI : Algebra (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)
      (E ⊗[F] NumberField.AdeleRing (NumberField.RingOfIntegers F) F) :=
      Algebra.TensorProduct.rightAlgebra
    ∀ [TopologicalSpace (E ⊗[F] NumberField.AdeleRing (NumberField.RingOfIntegers F) F)]
      [IsModuleTopology (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)
        (E ⊗[F] NumberField.AdeleRing (NumberField.RingOfIntegers F) F)],
      Continuous (adeleBaseChange F E) ∧ Continuous (adeleBaseChange F E).symm := by
  sorry

/-- For `E = F` the comparison is the canonical `F ⊗_F 𝔸_F ≃ 𝔸_F`. -/
theorem adeleBaseChange_self (F : Type) [Field F] [NumberField F]
    (x : F ⊗[F] NumberField.AdeleRing (NumberField.RingOfIntegers F) F) :
    adeleBaseChange F F x = Algebra.TensorProduct.lid F _ x := by
  sorry

namespace AdelicPoints

variable (F : Type) [Field F] [NumberField F] (E : Type) [Field E] [NumberField E] [Algebra F E]
  [FiniteDimensional F E] (H' : Type) [CommRing H'] [HopfAlgebra E H']

/-- AA.1 target *base change adelic*: the points of `Res_{E/F} G_E` over `𝔸_F` are the points
of `G_E` over `𝔸_E`. The map is fixed by `resEquiv_apply`: the point adjunction followed by the
base-change comparison on values. -/
def resEquiv : AdelicPoints F (WeilRestriction.ResHopf F E H') ≃* AdelicPoints E H' := sorry

theorem resEquiv_apply (x : AdelicPoints F (WeilRestriction.ResHopf F E H')) :
    (resEquiv F E H' x).ofConv =
      (adeleBaseChange F E).toAlgHom.comp
        (WeilRestriction.pointsMulEquiv F E H' _ x).ofConv := by
  sorry

/-- `resEquiv` is a homeomorphism for the evaluation topologies. -/
theorem continuous_resEquiv : Continuous (resEquiv F E H') ∧
    Continuous (resEquiv F E H').symm := by
  sorry

/-- The rational points of the restriction: `Res_{E/F} G_E (F) = G_E (E)`, through the point
adjunction and `E ⊗_F F ≃ E`; fixed by `resRationalEquiv_apply`. -/
def resRationalEquiv :
    WithConv (WeilRestriction.ResHopf F E H' →ₐ[F] F) ≃* WithConv (H' →ₐ[E] E) := sorry

theorem resRationalEquiv_apply (g : WithConv (WeilRestriction.ResHopf F E H' →ₐ[F] F)) :
    (resRationalEquiv F E H' g).ofConv =
      (Algebra.TensorProduct.rid F E E).toAlgHom.comp
        (WeilRestriction.pointsMulEquiv F E H' F g).ofConv := by
  sorry

/-- `resEquiv` carries the diagonal of `Res(F)` to the diagonal of `G_E(E)`. -/
theorem resEquiv_diagonal (g : WithConv (WeilRestriction.ResHopf F E H' →ₐ[F] F)) :
    resEquiv F E H' (diagonal F (WeilRestriction.ResHopf F E H') g) =
      diagonal E H' (resRationalEquiv F E H' g) := by
  sorry

/-- Naturality of `resEquiv` in coordinate Hopf maps `G_E → G'_E`. -/
theorem resEquiv_natural {H'' : Type} [CommRing H''] [HopfAlgebra E H''] (φ : H'' →ₐc[E] H')
    (x : AdelicPoints F (WeilRestriction.ResHopf F E H')) :
    map E H' φ (resEquiv F E H' x) =
      resEquiv F E H''
        (map F (WeilRestriction.ResHopf F E H') (WeilRestriction.mapHopf F E H' φ) x) := by
  sorry

/-- Transitivity in a tower `F ⊂ E ⊂ L`: `resEquiv` for `L/F` is the composite of those for
`L/E` and `E/F`, through `compHopfEquiv`. -/
theorem resEquiv_trans (L : Type) [Field L] [NumberField L] [Algebra E L] [Algebra F L]
    [IsScalarTower F E L] [FiniteDimensional E L] (H'' : Type) [CommRing H''] [HopfAlgebra L H'']
    (x : AdelicPoints F (WeilRestriction.ResHopf F L H'')) :
    resEquiv F L H'' x =
      resEquiv E L H'' (resEquiv F E (WeilRestriction.ResHopf E L H'')
        (map F (WeilRestriction.ResHopf F L H'')
          (WeilRestriction.compHopfEquiv F E L H'') x)) := by
  sorry

-- Test AdelicPoints.resEquiv_gm: for `G_E = G_m`, `resEquiv` is `(E ⊗ 𝔸_F)^× ≃ 𝔸_E^×` through
-- the base-change comparison on units.
example (x : AdelicPoints F (WeilRestriction.ResHopf F E (LaurentPolynomial E))) :
    TauCeti.MultiplicativeGroup.pointsMulEquiv (resEquiv F E (LaurentPolynomial E) x) =
      Units.map (adeleBaseChange F E : _ →* _)
        (TauCeti.MultiplicativeGroup.pointsMulEquiv
          (WeilRestriction.pointsMulEquiv F E (LaurentPolynomial E) _ x)) := by
  sorry

-- Test AdelicPoints.resEquiv_self: for `E = F` the comparison on values is `F ⊗_F 𝔸_F ≃ 𝔸_F`.
example (H₀ : Type) [CommRing H₀] [HopfAlgebra F H₀]
    (x : AdelicPoints F (WeilRestriction.ResHopf F F H₀)) (h : H₀) :
    (resEquiv F F H₀ x).ofConv h =
      Algebra.TensorProduct.lid F _ ((WeilRestriction.pointsMulEquiv F F H₀ _ x).ofConv h) := by
  sorry

-- Test AdelicPoints.res_not_base_change: `Res_{E/ℚ} G_m (ℚ) = E^×` is not `G_m(ℚ) = ℚ^×`: when
-- `E` contains a square root of `-1` the former has an element of order `4` and the latter
-- does not.
example (E : Type) [Field E] [NumberField E] (i : E) (hi : i * i = -1) :
    ¬ Nonempty (WithConv (WeilRestriction.ResHopf ℚ E (LaurentPolynomial E) →ₐ[ℚ] ℚ) ≃* ℚˣ) := by
  sorry

end AdelicPoints

-- Test RationalCharacter.res_norm: for a quadratic field `E`, the rational characters of
-- `Res_{E/ℚ} G_m` have rank `1` (the norm), not the rank `2` of the geometric character group.
example (E : Type) [Field E] [NumberField E] (hE : Module.finrank ℚ E = 2) :
    Nonempty (Additive (RationalCharacter ℚ (WeilRestriction.ResHopf ℚ E (LaurentPolynomial E)))
      ≃+ ℤ) := by
  sorry

-- Test RealCharacterSpace.res_gm_rank: for a quadratic field `E` and `G = Res_{E/ℚ} G_m`,
-- `a_G` has real dimension `1`, not `2`.
example (E : Type) [Field E] [NumberField E] (hE : Module.finrank ℚ E = 2) :
    Module.finrank ℝ
      (RealCharacterSpace ℚ (WeilRestriction.ResHopf ℚ E (LaurentPolynomial E))) = 1 := by
  sorry

/-! ## Layer 4: torsors under simply connected groups -/

namespace Approximation

/-- AA.4 target *kneser local torsor* (Kneser): over a nonarchimedean local field of
characteristic `0`, every torsor under a semisimple simply connected group is trivial, i.e.
`H¹(K, G) = 1`. Simple connectedness is Tau Ceti's
`simplyConnectedSemisimpleCommHopfAlgProperty`. -/
theorem Torsor.isTrivial_of_simplyConnected_local (K : Type) [Field K] [ValuativeRel K]
    [TopologicalSpace K] [IsNonarchimedeanLocalField K] [CharZero K]
    (G : TauCeti.SemisimpleCommHopfAlgCat K)
    (hsc : TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty K G)
    (X : Torsor K (G.obj : Type)) : X.IsTrivial := by
  sorry

/-- AA.4 target *hasse principle simply connected* (Kneser, Harder, Chernousov): over a number
field, a torsor under a semisimple simply connected group is trivial if and only if it is trivial
over `ℝ` at every real place. -/
theorem Torsor.isTrivial_iff_forall_real (F : Type) [Field F] [NumberField F]
    (G : TauCeti.SemisimpleCommHopfAlgCat F)
    (hsc : TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty F G)
    (X : Torsor F (G.obj : Type)) :
    X.IsTrivial ↔ ∀ (v : NumberField.InfinitePlace F) (hv : v.IsReal),
      letI := (NumberField.InfinitePlace.embedding_of_isReal hv).toAlgebra
      (X.baseChange ℝ).IsTrivial := by
  sorry

-- Test Approximation.Torsor.hasse_fails_without_simply_connected: for `μ_2` over `ℚ` the torsor
-- `ℚ[x]/(x² - 2)` is trivial over `ℝ` but not over `ℚ`.
example : ∃ X : Torsor ℚ (MonoidAlgebra ℚ (Multiplicative (ZMod 2))),
    (X.baseChange ℝ).IsTrivial ∧ ¬ X.IsTrivial := by
  sorry

end Approximation

/-!
## Statements not typed at the pins

The README states the following targets; no pinned library or bundle signature provides their
carriers, so they have no declaration here.

* Rational parabolic subgroups, Levi decompositions and relative roots (ReductiveGroups, layer 7)
  and the Siegel sets built on them: the parabolic modulus character and homogeneous integration
  (AA.2.2), the minimal parabolic data, relative chambers, horospherical decompositions, positive
  root coordinates, real and adelic Siegel sets, `H_P`, admissible maximal compacts and every
  reduction statement of AA.3.1, AA.3.3, AA.3.4, AA.3.6 and AA.3.7 that uses them, the Siegel
  comparison of reduced forms, and the Siegel-set height estimate.
* The Galois representation on the geometric character lattice, the Artin leading coefficient
  and gauge-form measures in local analytic charts: the convergence factors, Tamagawa convergence,
  the Weil volume formula, the local, finite and global restriction Jacobians, the gauge-form
  discriminant under restriction of scalars and the Tamagawa measure under restriction of scalars
  (AA.2.4–AA.2.5).
* The simply connected cover of the derived group with its integral models and the centre and
  adjoint quotient of a connected reductive group (ReductiveGroups, layer 6): `G(𝔸)^+`, the
  residual quotient and its reduced-norm, torus-image, Fourier-limit and joint-limit statements,
  the central-character `L²` space with its completeness, sections and twists, the closedness of
  the central rational product, the central quotient change, and the Weyl-orbit product in the
  split centre (AA.2.1, AA.2.3, AA.4.6, AA.4.7).
* Absolutely almost simple groups with their local isotropy, `S`-arithmetic lattices and Borel
  density: the strong approximation theorem with its necessity and sufficiency halves, the
  arithmetic closure statements of AA.4.2, the abelianization and class-set statements of AA.4.5,
  and the level-volume, fibre-mass and groupoid examples that need the rational centre or a
  named `K_∞` (AA.4.4–AA.4.5).
* The local factors of restriction of scalars over `F_v` and the place-by-place norms of a
  representation: the local comparison `Res(F_v) ≃ ∏_{w ∣ v} G_E(E_w)` and the local polynomial
  height comparison.
* The Riemann-surface structures and holomorphy of the level and translation maps of AA.5.2
  (Fuchsian orbifolds roadmap, layers 1, 4 and 5).
-/

end

end TauCetiRoadmap.AdelicAlgebraicGroups
