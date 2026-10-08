import TauCeti.Algebra.AlgebraicGroup.PointsFunctor
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.FunctorOfPoints
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.Determinant
import TauCeti.Algebra.AlgebraicGroup.SpecialLinear.Basic
import TauCeti.Algebra.AlgebraicGroup.AdditiveGroup.Basic
import TauCeti.Algebra.AlgebraicGroup.MultiplicativeGroup.Basic
import TauCeti.Algebra.AlgebraicGroup.CommHopfAlgCat.BaseChange
import TauCeti.Algebra.AlgebraicGroup.CommHopfAlgCat.CharacterLattice.Torsion
import TauCeti.Algebra.AlgebraicGroup.Tangent.Representation

import Mathlib.RingTheory.HopfAlgebra.Convolution
import Mathlib.RingTheory.HopfAlgebra.GroupLike
import Mathlib.RingTheory.Bialgebra.MonoidAlgebra
import Mathlib.NumberTheory.NumberField.AdeleRing
import Mathlib.NumberTheory.NumberField.InfiniteAdeleRing
import Mathlib.NumberTheory.NumberField.DedekindZeta
import Mathlib.NumberTheory.NumberField.Units.DirichletTheorem
import Mathlib.NumberTheory.NumberField.CanonicalEmbedding.Basic
import Mathlib.NumberTheory.SumPrimeReciprocals
import Mathlib.NumberTheory.Modular
import Mathlib.NumberTheory.ModularForms.CongruenceSubgroups
import Mathlib.Topology.Algebra.RestrictedProduct.TopologicalSpace
import Mathlib.Topology.Algebra.RestrictedProduct.Units
import Mathlib.Topology.Covering.Quotient
import Mathlib.MeasureTheory.Measure.Haar.Basic
import Mathlib.MeasureTheory.Measure.Haar.Unique
import Mathlib.MeasureTheory.Measure.Haar.Quotient
import Mathlib.MeasureTheory.Measure.Haar.Extension
import Mathlib.MeasureTheory.Group.ModularCharacter
import Mathlib.MeasureTheory.Group.FundamentalDomain
import Mathlib.MeasureTheory.Constructions.Pi
import Mathlib.MeasureTheory.Function.LpSpace.Basic
import Mathlib.Probability.ProductMeasure
import Mathlib.GroupTheory.DoubleCoset
import Mathlib.CategoryTheory.Action
import Mathlib.Algebra.Quaternion
import Mathlib.LinearAlgebra.ExteriorAlgebra.Basic
import Mathlib.LinearAlgebra.ExteriorPower.Basic
import Mathlib.RingTheory.Ideal.Cotangent
import Mathlib.Analysis.Complex.UpperHalfPlane.MoebiusAction
import Mathlib.Analysis.Complex.Circle
import Mathlib.Topology.Instances.AddCircle.Defs
import Mathlib.Analysis.Normed.Lp.lpSpace
import Mathlib.Algebra.DirectSum.Module
import Mathlib.Analysis.InnerProductSpace.Basic
import Mathlib.RingTheory.DedekindDomain.SInteger
import Mathlib.RingTheory.FinitePresentation

import Mathlib.Analysis.SpecialFunctions.Log.Summable
import Mathlib.Topology.Algebra.InfiniteSum.Real
/-!
# Adelic algebraic groups and arithmetic quotients: suggested signatures

This file is not the roadmap and is not exhaustive. The reader roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers can converge on names and
signatures. This file is a proposed interface, not an implementation. Bodies and proofs use `sorry`.
The packet records the exact mathematics, dependencies and source locators. Native declarations
below use pinned library carriers. The section-13 omission catalogue names each interface whose
structural language is not yet supplied, gives its mathematical contract and names its supplier.
No omitted condition is replaced by an arbitrary proposition, topology, point-group homomorphism,
model equivalence or cover. In particular the file does not define a replacement convolution group.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174;
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369.
-/

noncomputable section
open scoped RestrictedProduct Topology ENNReal NNReal TensorProduct Pointwise
open MeasureTheory Filter Set
open scoped Classical
set_option linter.unusedVariables false

/-! ## AA.0 Restricted products of Haar measures -/

/-- `AA.0/mixed-space-topology`: the algebraic equivalence alone asserts no continuity. -/
theorem NumberField.InfiniteAdeleRing.continuous_ringEquiv_mixedSpace
    (F : Type) [Field F] [NumberField F] :
    Continuous (NumberField.InfiniteAdeleRing.ringEquiv_mixedSpace F) ∧
      Continuous (NumberField.InfiniteAdeleRing.ringEquiv_mixedSpace F).symm := by
  sorry

namespace RestrictedProduct

variable {ι : Type*} {G : ι → Type*} [∀ i, Group (G i)] [∀ i, TopologicalSpace (G i)]
  [∀ i, IsTopologicalGroup (G i)] [hcount : Countable ι]
  [hT2 : ∀ i, T2Space (G i)] [hLC : ∀ i, LocallyCompactSpace (G i)]
  [hsecond : ∀ i, SecondCountableTopology (G i)] {B : ∀ i, Subgroup (G i)}
  [hBopen : Fact (∀ i, IsOpen (B i : Set (G i)))]

/-- `AA.0/second-countable`: countably many second countable factors give a second countable
restricted product. -/
theorem secondCountable :
    SecondCountableTopology (Πʳ i, [G i, B i]) := by
  sorry

/-- `AA.0/borel-structure`: the Borel σ-algebra on a restricted product. -/
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

-- Test RestrictedProduct.measurableSet_not_box_infinite
/-- For `ι = ℕ`, `G i = ZMod 4`, `B i = 2(ZMod 4)` and `C i = {0}`, the product is not a box of
the generating family: it differs from `B i` at every index. -/
example : ¬ ∀ᶠ i in (cofinite : Filter ℕ),
    ({1} : Set (Multiplicative (ZMod 4))) =
      ((Subgroup.zpowers (Multiplicative.ofAdd (2 : ZMod 4)) : Subgroup _) : Set _) := by
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

/-- `AA.0/level-measure`: the product measure `μ_S` on the level subgroup `U_S`, built from
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

-- Test RestrictedProduct.levelMeasure_needs_normalization
/-- With `μ i (B i) = 2` off `S` the restrictions are not probability measures. -/
example (μ : ∀ i, Measure (G i)) (i : ι) (h : μ i (B i) = 2) :
    ¬ IsProbabilityMeasure ((μ i).restrict (B i)) := by
  sorry

/-- `AA.0/restricted-haar-product`: the restricted product of Haar measures. -/
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

/-- `AA.0/restricted-haar-restrict-level` and `AA.0/restricted-haar-box` are the two lemmas above;
`AA.0/restricted-haar-is-haar` is `haarProduct_isHaarMeasure`. -/
theorem haarProduct_isMulRightInvariant [∀ i, (μ i).IsMulRightInvariant] :
    (haarProduct μ hμ).IsMulRightInvariant := by
  sorry

theorem haarProduct_rescale (c : ι → ℝ≥0∞) (hc : ∀ᶠ i in cofinite, c i = 1) (hpos : ∀ i, c i ≠ 0 ∧ c i ≠ ∞)
    (hcμ : ∀ᶠ i in cofinite, (c i • μ i) (B i) = 1) :
    haarProduct (fun i => c i • μ i) hcμ = (∏ᶠ i, c i) • haarProduct μ hμ := by
  sorry

end RestrictedProduct

namespace RestrictedProduct

variable {ι : Type*} {G : ι → Type*} [∀ i, Group (G i)] [∀ i, TopologicalSpace (G i)]
  [∀ i, IsTopologicalGroup (G i)] [hcount : Countable ι]
  [hT2 : ∀ i, T2Space (G i)] [hLC : ∀ i, LocallyCompactSpace (G i)]
  [hsecond : ∀ i, SecondCountableTopology (G i)]

/-- `AA.0/restricted-haar-change-subgroups`: changing the restricting subgroups at finitely many
indices does not change the restricted product. -/
def changeSubgroups (B B' : ∀ i, Subgroup (G i))
    [Fact (∀ i, IsOpen (B i : Set (G i)))] [Fact (∀ i, IsOpen (B' i : Set (G i)))] (h : ∀ᶠ i in cofinite, B i = B' i) :
    (Πʳ i, [G i, B i]) ≃ₜ* (Πʳ i, [G i, B' i]) := sorry

theorem changeSubgroups_apply (B B' : ∀ i, Subgroup (G i))
    [Fact (∀ i, IsOpen (B i : Set (G i)))] [Fact (∀ i, IsOpen (B' i : Set (G i)))] (h : ∀ᶠ i in cofinite, B i = B' i)
    (x : Πʳ i, [G i, B i]) (i : ι) : changeSubgroups B B' h x i = x i := by
  sorry

variable {B : ∀ i, Subgroup (G i)} [hBopen : Fact (∀ i, IsOpen (B i : Set (G i)))]

/-- `AA.0/split-finite-factors`: splitting off finitely many factors. -/
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

theorem splitFinite_mono (S S' : Finset ι) (h : S ⊆ S') (x : Πʳ i, [G i, B i]) (i : S') :
    (splitFinite S' x).1 i = x i := by
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

/-- `AA.0/restricted-haar-split`: Fubini for restricted product measures. -/
theorem haarProduct_split (S : Finset ι)
    (hμ' : ∀ᶠ (i : {i // i ∉ S}) in cofinite, μ i (B i) = 1) :
    Measure.map (splitFinite (B := B) S) (haarProduct μ hμ) =
      (Measure.pi (fun i : S => μ i)).prod (haarProduct (fun i : {i // i ∉ S} => μ i) hμ') := by
  sorry

/-- `AA.0/restricted-haar-factorizable-integral`. -/
theorem integral_haarProduct_factorizable (f : ∀ i, G i → ℂ) (hf : ∀ i, Integrable (f i) (μ i))
    (hB : ∀ᶠ i in cofinite, f i = (B i : Set (G i)).indicator 1) :
    ∫ x, (∏ᶠ i, f i (x i)) ∂(haarProduct μ hμ) = ∏ᶠ i, ∫ g, f i g ∂(μ i) := by
  sorry

/-- `AA.0/restricted-unimodular`. -/
theorem modularCharacter_haarProduct
    [LocallyCompactSpace (Πʳ i, [G i, B i])] (x : Πʳ i, [G i, B i]) :
    Measure.modularCharacter x = ∏ᶠ i, Measure.modularCharacter (x i) := by
  sorry

/-- `AA.0/restricted-haar-map`. -/
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

/-- `AA.0/tamagawa-convergence-failure`: the volumes `1 - p⁻¹` of `ℤ_p^×` for the measures
`|dx/x|_p` have divergent product, so convergence factors are needed. -/
theorem tamagawa_convergence_failure :
    Tendsto (fun N : ℕ => ∏ p ∈ Finset.filter Nat.Prime (Finset.range N), (1 - (p : ℝ)⁻¹))
      atTop (𝓝 0) := by
  sorry

namespace NumberField

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

/-- `AA.0/finite-adele-haar`. -/
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

/-- `AA.0/adele-haar`. -/
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

-- Test NumberField.adeleHaar_not_selfdual
/-- The self-dual measure for the standard character is `|d_K|^{-1/2} • adeleHaar`; for
`|d_K| > 1` it differs from `adeleHaar` (the self-dual normalization is owned by AL.0). -/
example (h : 1 < |discr K|) :
    ENNReal.ofReal (Real.sqrt |(discr K : ℝ)|)⁻¹ • adeleHaar K ≠ adeleHaar K := by
  sorry

/-- The archimedean idele measure: `dx/|x|` at real places and `2 dx dy/(x² + y²)` at complex
places. -/
def infiniteIdeleHaar : Measure (InfiniteAdeleRing K)ˣ := sorry

/-- `AA.0/idele-haar`. -/
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

end NumberField

namespace RealSiegel
/-- `AA.3/reduced-form`: `b` is `(e, C)`-reduced in the standard basis `e` (Gram matrix `b`). -/
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

/-- `AA.3/reduced-form-set`: `T_{e,C}`. -/
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

/-- `AA.4/double-coset-level-map`: the nested-level map `H\G/K' → H\G/K`. -/
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

/-- `AA.4/double-coset-level-cardinality`. -/
theorem card_le_index_mul (h : K' ≤ K) [(K'.subgroupOf K).FiniteIndex]
    [Finite (DoubleCoset.Quotient (H : Set G) K)] :
    Nat.card (DoubleCoset.Quotient (H : Set G) K') ≤
      (K'.subgroupOf K).index * Nat.card (DoubleCoset.Quotient (H : Set G) K) := by
  sorry

/-- `AA.4/double-coset-conjugate-level`. -/
def conjLevelEquiv (a : G) :
    DoubleCoset.Quotient (H : Set G) (K.map (MulAut.conj a).toMonoidHom) ≃ DoubleCoset.Quotient (H : Set G) K := sorry

end groups

end LevelMaps
namespace AdelicExamples

/-- `AA.5/upper-half-plane-action-conventions`: raw Möbius transformations on ℍ±. -/
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

end AdelicExamples
namespace Tamagawa

/-- `AA.2/tamagawa-convergence-gln`, the local count for `GL_n`: with the convergence factor
`λ = (1 - q⁻¹)⁻¹`, the normalized count of `GL_n(𝔽_q)` is `∏_{i=2}^{n} (1 - q^{-i})`. -/
theorem gl_local_volume (k : Type*) [Field k] [Fintype k] {n : ℕ} (hn : 1 ≤ n) :
    (1 - (Fintype.card k : ℝ)⁻¹)⁻¹ * Nat.card (GL (Fin n) k) / (Fintype.card k : ℝ) ^ (n ^ 2) =
      ∏ i ∈ Finset.Icc 2 n, (1 - (Fintype.card k : ℝ)⁻¹ ^ i) := by
  sorry

/-- `AA.2/tamagawa-convergence-gln`, the local count for `SL_n`. -/
theorem sl_local_volume (k : Type*) [Field k] [Fintype k] [DecidableEq k] {n : ℕ} (hn : 1 ≤ n) :
    (Nat.card (Matrix.SpecialLinearGroup (Fin n) k) : ℝ) / (Fintype.card k : ℝ) ^ (n ^ 2 - 1) =
      ∏ i ∈ Finset.Icc 2 n, (1 - (Fintype.card k : ℝ)⁻¹ ^ i) := by
  sorry

/-- `AA.2/tamagawa-convergence-gln`, convergence: `∑_v q_v^{-2}` converges, so the local factors
`∏_{i=2}^{n} (1 - q_v^{-i})` have an absolutely convergent product. -/
theorem summable_absNorm_rpow_neg_two (K : Type*) [Field K] [NumberField K] :
    Summable (fun v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers K) =>
      (Ideal.absNorm v.asIdeal : ℝ) ^ (-2 : ℝ)) := by
  sorry

end Tamagawa

namespace Reduction

/-- `AA.3/division-algebra-no-unipotent`: a division ring has no unipotent element other
than `1`. -/
theorem eq_one_of_isNilpotent_sub_one {D : Type*} [DivisionRing D] {u : D}
    (h : IsNilpotent (u - 1)) : u = 1 :=
  sub_eq_zero.mp h.eq_zero

end Reduction


namespace RestrictedProduct

variable {ι : Type*} [Countable ι]
  {G : ι → Type*} [∀ i, Group (G i)] [∀ i, TopologicalSpace (G i)]
  [∀ i, IsTopologicalGroup (G i)] [∀ i, T2Space (G i)]
  [∀ i, LocallyCompactSpace (G i)] [∀ i, SecondCountableTopology (G i)]
  {B : ∀ i, Subgroup (G i)} [Fact (∀ i, IsOpen (B i : Set (G i)))]
  [∀ i, MeasurableSpace (G i)] [∀ i, BorelSpace (G i)]
  [Fact (∀ᶠ i in cofinite, IsCompact (B i : Set (G i)))]

/-- AA.0/summable-log-product: positive masses with summable error have a positive finite
product; the tail outside a finite exceptional set is taken over that subtype. -/
theorem positive_tprod_of_summable_sub_one (a : ι → ℝ) (ha : ∀ i, 0 < a i)
    (hs : Summable (fun i => |a i - 1|)) :
    Summable (fun i => |Real.log (a i)|) ∧ Multipliable a ∧ 0 < ∏' i, a i := by
  sorry

/-- Normalize only the good compact factors. The exceptional local Haar measures are retained. -/
def normalizedFamily (μ : ∀ i, Measure (G i)) (S : Finset ι) : ∀ i, Measure (G i) :=
  fun i => if i ∈ S then μ i else (μ i (B i))⁻¹ • μ i

/-- AA.0/convergent-haar-product. The actual compactness, finite positive mass and summability
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
    ∃ (hcν : ∀ i ∉ ({j} : Finset ι), IsCompact (B i : Set (G i)))
      (hpν : ∀ i ∉ ({j} : Finset ι), 0 < ν i (B i) ∧ ν i (B i) < ∞)
      (hsν : Summable (fun i : {i // i ∉ ({j} : Finset ι)} => |(ν i (B i)).toReal - 1|)),
      convergentHaarProduct (B := B) ν {j} hcν hpν hsν =
        c • haarProduct (B := B) μ (Filter.Eventually.of_forall hμ) := by
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


/-- AA.2/closed-homogeneous-space, with the canonical orbit quotient topology. -/
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

/-- AA.2/fibre-average-continuous. -/
theorem average_continuous_compact (ν : Measure H) (hν : IsRightHaar ν)
    (f : G → ℝ) (hf : Continuous f) (hfc : HasCompactSupport f) :
    Continuous (average H ν hν f) ∧ HasCompactSupport (average H ν hν f) ∧
      Function.support (average H ν hν f) ⊆
        (fun g : G => (Quotient.mk _ g : Cosets H)) '' tsupport f := by
  sorry

/-- AA.2/compact-quotient-cutoff. -/
theorem compact_cutoff (ν : Measure H) (hν : IsRightHaar ν)
    (C : Set (Cosets H)) (hC : IsCompact C) :
    ∃ β : G → ℝ, Continuous β ∧ HasCompactSupport β ∧ (∀ g, 0 ≤ β g) ∧
      ∀ q ∈ C, average H ν hν β q = 1 := by
  sorry

/-- AA.2/right-haar-exchange. -/
theorem right_haar_exchange (μ : Measure G) (ν : Measure H)
    (hμ : IsRightHaar μ) (hν : IsRightHaar ν)
    (hmod : ∀ h : H, Measure.modularCharacter (h : G) = Measure.modularCharacter h)
    (f β : G → ℝ) (hf : Continuous f) (hfc : HasCompactSupport f)
    (hβ : Continuous β) (hβc : HasCompactSupport β) :
    (∫ g, β g * average H ν hν f (Quotient.mk _ g) ∂μ) =
      ∫ g, f g * average H ν hν β (Quotient.mk _ g) ∂μ := by
  sorry

/-- AA.2/quotient-tonelli. -/
theorem quotient_lintegral (μ : Measure G) (ν : Measure H)
    (hμ : IsRightHaar μ) (hν : IsRightHaar ν)
    (hmod : ∀ h : H, Measure.modularCharacter (h : G) = Measure.modularCharacter h)
    (f : G → ℝ≥0∞) (hf : Measurable f) :
    ∃ P : Cosets H → ℝ≥0∞, Measurable P ∧
      (∀ g, P (Quotient.mk _ g) = ∫⁻ h : H, f (h * g) ∂ν) ∧
      (∫⁻ g, f g ∂μ) = ∫⁻ q, P q ∂(measure H μ ν hμ hν hmod) := by
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
/-- AA.3/reduced-form: a uniform Cholesky adapter. The bound is quantified before the form,
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
    ¬ ∃ μ : Measure (Cosets H), IsFiniteMeasureOnCompacts μ ∧ Measure.Regular μ ∧
      μ ≠ 0 ∧ ∀ g : G, Measure.map (rightAct H g) μ = μ := by
  sorry
end QuotientMeasure


namespace RestrictedProduct
variable {ι : Type*} {G : ι → Type*} [∀ i, Group (G i)] [∀ i, TopologicalSpace (G i)]
  [∀ i, IsTopologicalGroup (G i)] [Countable ι] [∀ i, T2Space (G i)]
  [∀ i, LocallyCompactSpace (G i)] [∀ i, SecondCountableTopology (G i)]
  {B : ∀ i, Subgroup (G i)} [Fact (∀ i, IsOpen (B i : Set (G i)))]
  [Fact (∀ᶠ i in cofinite, IsCompact (B i : Set (G i)))]
  [∀ i, MeasurableSpace (G i)] [∀ i, BorelSpace (G i)]

/-- AA.0/level-measure-compat. -/
theorem levelMeasure_compat (μ : ∀ i, Measure (G i)) [∀ i, SigmaFinite (μ i)]
    (S T : Finset ι) (hST : S ⊆ T) (hS : ∀ i ∉ S, μ i (B i) = 1)
    (hT : ∀ i ∉ T, μ i (B i) = 1) :
    (Measure.map Subtype.val (levelMeasure μ T hT)).restrict
      (levelSubgroup (B := B) (S : Set ι)) = Measure.map Subtype.val (levelMeasure μ S hS) := by
  sorry

/-- AA.0/local-normalized-haar. -/
theorem exists_normalized_haar (i : ι) (hcompact : IsCompact (B i : Set (G i))) :
    ∃ μ : Measure (G i), μ.IsHaarMeasure ∧ μ (B i) = 1 := by
  sorry
end RestrictedProduct

/-! AA.1 uses the actual Tau Ceti convolution group. RG2.0 supplies the affine-points topology;
there is no local replacement topology instance in this prototype. -/

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
  AlgHom.mapValue (H := H) (Algebra.ofId F _)

/-- Canonical value-algebra projection; continuity is supplied by the places/points owners. -/
def valueProjection (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    NumberField.AdeleRing (NumberField.RingOfIntegers F) F →ₐ[F] v.adicCompletion F where
  toFun x := x.2 v
  map_zero' := by sorry
  map_one' := by sorry
  map_add' := by sorry
  map_mul' := by sorry
  commutes' := by sorry

def proj (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    AdelicPoints F H →* LocalPoints F H v := AlgHom.mapValue (H := H) (valueProjection F v)

theorem proj_diagonal (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (g : WithConv (H →ₐ[F] F)) :
    proj F H v (diagonal F H g) = AlgHom.mapValue (H := H) (Algebra.ofId F _) g := by
  sorry

def finiteProjection : AdelicPoints F H →* FiniteAdelicPoints F H :=
  AlgHom.mapValue (H := H) (AlgHom.snd F _ _)

def infiniteProjection : AdelicPoints F H →* InfinitePoints F H :=
  AlgHom.mapValue (H := H) (AlgHom.fst F _ _)

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

-- Test AdelicPoints.ga_eq_adeles, algebraic part; its topology contract is in the omission catalogue.
example : Nonempty (AdelicPoints F (SymmetricAlgebra F F) ≃*
    Multiplicative (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)) := by
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

/-! AA.1 Integral models use finitely presented Hopf algebras and genuine Hopf isomorphisms.
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
    ((TauCeti.GeneralLinear.pointsMulEquiv (R := F) (A := v.val.adicCompletion F) n).toMonoidHom).map
      ((standardGLn (F := F) (S := S) n).localPoints v) =
      (Matrix.GeneralLinearGroup.map
        (algebraMap (v.val.adicCompletionIntegers F) (v.val.adicCompletion F))).range := by
  sorry

-- Test IntegralModel.trivial: the canonical constant Hopf algebra is the trivial model.
example (M : IntegralModel F F S)
    (v : {v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F) // v ∉ S}) :
    M.localPoints v = ⊥ := by
  sorry

end IntegralModel

namespace IntegralModel
variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]

/-- AA.1/integral-model-exists and AA.1/hopf-spreading. -/
theorem exists [Algebra.FiniteType F H] :
    ∃ S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)),
      Nonempty (IntegralModel F H S) := by
  sorry

/-- AA.1/integral-model-unique: the enlarged models have a compatible Hopf isomorphism. -/
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
end IntegralModel

/-! AA.2 A gauge form is a nonzero vector in the invariant top-form line below.
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

namespace Neat

/-- `AA.4/neat-element`: an automorphism is neat if its eigenvalues generate a torsion-free
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

/-- `AA.4/neat-representation-independence`: this direction permits nonfaithful σ,
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
algebraic representation; independence is `isNeat_of_faithful` in both directions. -/
def finiteDiagonal : WithConv (H →ₐ[F] F) →* AdelicPoints.FiniteAdelicPoints F H :=
  AlgHom.mapValue (H := H) (Algebra.ofId F _)

def rationalLevelAt (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H))
    (g : AdelicPoints.FiniteAdelicPoints F H) : Subgroup (WithConv (H →ₐ[F] F)) :=
  U.comap ((MulAut.conj g⁻¹).toMonoidHom.comp (finiteDiagonal (F := F) (H := H)))

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

/-!
## Section-13 interface and condition catalogue

The following catalogue accounts for every packet declaration, API name and test name.
A native name refers to the actual carrier signature above. An omitted item states its full
mathematical contract and the precise missing structural language/supplier; it makes no Lean
assertion with those conditions removed. A signature using an arbitrary proposition, topology,
cover, local measure, abstract representation or equivalence would not state the planned result.
Known mathematical gaps are separately recorded in the packet and reader document.
The Tau Ceti import-dependent signatures have not been elaborated in the shared build.

### AdelicAlgebraicGroups:AA.0/second-countable — The restricted product of countably many second countable groups is second countable
Hypotheses: ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i open subgroups
Contract: Let ι be countable, let each G i be a second countable topological group and each B i an open subgroup of G i. Then Πʳ i, [G i, B i] is second countable. Consequently its Borel σ-algebra is generated by the boxes Π i, C i with C i open in G i and C i = B i for all but finitely many i.
Native equivalent signature(s): RestrictedProduct.secondCountable.

### AdelicAlgebraicGroups:AA.0/borel-structure — Borel structure on a restricted product
Hypotheses: ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i is an open subgroup for every i, compact for all but finitely many i
Contract: For the data of AA.0 put the Borel σ-algebra on Πʳ i, [G i, B i]. With it the restricted product is a Borel space in which every open subgroup U_S, every box Π i, C i (C i Borel, C i = B i cofinitely) and every inclusion of a principal piece is measurable, and the coordinate maps x ↦ x i are measurable.
Native carrier/API part: the named signatures below. Full structural specializations remain subject to their recorded conditions.
API RestrictedProduct.borelSpace: Πʳ i, [G i, B i] carries the Borel σ-algebra and is a BorelSpace.
Native signature above.
API RestrictedProduct.measurable_eval: For each i the coordinate map x ↦ x i is measurable.
Native signature above.
API RestrictedProduct.measurableSet_box: For Borel C i with C i = B i for all but finitely many i, the box {x | ∀ i, x i ∈ C i} is measurable.
Native signature above.
API RestrictedProduct.measurable_inclusion: The inclusion of each principal piece Πʳ i, [G i, B i]_[𝓟 S] is measurable.
Native signature above.
API RestrictedProduct.borel_eq_generateFrom_boxes: For countable ι the Borel σ-algebra is generated by the boxes with open factors.
Native signature above.
Test RestrictedProduct.measurableSet_structureMap_range: The set {x | ∀ i, x i ∈ B i} is measurable.
Native example above.
Test RestrictedProduct.borel_finite_index: For finite ι the Borel structure agrees with the product σ-algebra on Π i, G i under the homeomorphism of homeoBot.
Native example above.
Test RestrictedProduct.measurableSet_not_box_infinite: For ι = ℕ, G i = ℤ/4, B i = 2ℤ/4 and C i = {0}, the family C differs from B at every index, so Π i, C i is not a box of the generating family (it is a null set for the product measure, not a basic open).
Native example above.

### AdelicAlgebraicGroups:AA.0/level-measure — Product measure on a level subgroup
Hypotheses: ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i is an open subgroup for every i, compact for all but finitely many i; μ i is a left Haar measure on G i; S finite with μ i (B i) = 1 for i ∉ S
Contract: Let S ⊂ ι be finite with B i compact and μ i (B i) = 1 for i ∉ S, where μ i is a left Haar measure on G i. On U_S = Π_{i∈S} G i × Π_{i∉S} B i define μ_S as the product of the finite product measure Measure.pi (fun i : S => μ i) and the infinite product measure infinitePi (fun i : ι∖S => μ i restricted to B i), each factor a probability measure on the compact group B i.
Native carrier/API part: the named signatures below. Full structural specializations remain subject to their recorded conditions.
API RestrictedProduct.levelMeasure: The measure μ_S on the open subgroup U_S.
Native signature above.
API RestrictedProduct.levelMeasure_box: μ_S of a box with factors C i (i ∈ S) and B i (i ∉ S) is ∏_{i∈S} μ i (C i).
Native signature above.
API RestrictedProduct.levelMeasure_isHaar: μ_S is a left Haar measure on the topological group U_S.
Native signature above.
API RestrictedProduct.levelMeasure_univ_compact: If every B i is compact and μ i (B i) = 1 for all i, then μ_∅ is a probability measure.
Native signature above.
Test RestrictedProduct.levelMeasure_empty_prob: For S = ∅ and μ i (B i) = 1 for all i, μ_∅ (univ) = 1.
Native example above.
Test RestrictedProduct.levelMeasure_two_factor: For ι = Fin 2, S = univ, μ_S is Measure.pi of the two Haar measures.
Native example above.
Test RestrictedProduct.levelMeasure_needs_normalization: If μ i (B i) = 2 for infinitely many i ∉ S, the restrictions μ i|B i are not probability measures and the construction does not apply; rescaling by 1/2 changes the measure.
Native example above.

### AdelicAlgebraicGroups:AA.0/level-measure-compat — Compatibility of level measures
Hypotheses: ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i is an open subgroup for every i, compact for all but finitely many i; μ i (B i) = 1 for i ∉ S
Contract: For finite S ⊆ S' as in level-measure, the restriction of μ_{S'} to the open subgroup U_S ⊂ U_{S'} equals μ_S.
Native equivalent signature(s): RestrictedProduct.levelMeasure_compat.

### AdelicAlgebraicGroups:AA.0/restricted-haar-product — Restricted product of Haar measures
Hypotheses: ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i is an open subgroup for every i, compact for all but finitely many i; μ i left Haar measures on G i; μ i (B i) = 1 for all but finitely many i
Contract: Given left Haar measures μ i on G i with μ i (B i) = 1 for all but finitely many i, the restricted product measure μ = ∏ʳ μ i on Πʳ i, [G i, B i] is the unique Borel measure whose restriction to each open subgroup U_S (S finite and containing the finitely many i with μ i (B i) ≠ 1 or B i not compact) is μ_S. It is defined as the supremum of the directed family of measures (U_S ↪ Πʳ)_* μ_S.
Native carrier/API part: the named signatures below. Full structural specializations remain subject to their recorded conditions.
API RestrictedProduct.haarProduct: The measure ∏ʳ μ i on Πʳ i, [G i, B i], given hμ : ∀ᶠ i in cofinite, μ i (B i) = 1.
Native signature above.
API RestrictedProduct.haarProduct_restrict_level: For admissible finite S, the restriction of ∏ʳ μ i to U_S is μ_S.
Native signature above.
API RestrictedProduct.haarProduct_eq_of_restrict: A Borel measure whose restriction to every admissible U_S is μ_S equals ∏ʳ μ i.
Native signature above.
API RestrictedProduct.haarProduct_box: ∏ʳ μ i of a box Π i, C i with C i = B i cofinitely equals ∏ᶠ i, μ i (C i).
Native signature above.
API RestrictedProduct.haarProduct_isHaarMeasure: ∏ʳ μ i is a left Haar measure.
Native signature above.
API RestrictedProduct.haarProduct_smul: For positive finite real c_i equal to 1 cofinitely, rescaling μ_i by c_i rescales the product by ∏ᶠ c_i.
Native signature above.
Test RestrictedProduct.haarProduct_compact_open_box: If μ i (B i) = 1 for every i, then ∏ʳ μ i of {x | ∀ i, x i ∈ B i} is 1.
Native example above.
Test RestrictedProduct.haarProduct_finite_index: For finite ι, transported along homeoBot, ∏ʳ μ i equals Measure.pi μ.
Native example above.
Test RestrictedProduct.haarProduct_not_probability_product: If some factor has infinite total mass (as μ_p on ℚ_p), then ∏ʳ μ i has infinite total mass; it is not an infinite product of probability measures.
Native example above.

### AdelicAlgebraicGroups:AA.0/restricted-haar-restrict-level — Restriction of the restricted product measure to a level
Hypotheses: ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i is an open subgroup for every i, compact for all but finitely many i
Contract: For every finite S containing the exceptional indices, (∏ʳ μ i).restrict U_S = (U_S ↪ Πʳ)_* μ_S, and ∏ʳ μ i is the unique measure with this property.
Native equivalent signature(s): RestrictedProduct.haarProduct_restrict_level.

### AdelicAlgebraicGroups:AA.0/restricted-haar-box — Measure of a box
Hypotheses: ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i is an open subgroup for every i, compact for all but finitely many i
Contract: For Borel sets C i ⊂ G i with C i = B i for all but finitely many i, ∏ʳ μ i (Π i, C i) = ∏ᶠ i, μ i (C i), the product being finite because almost all factors equal 1.
Native equivalent signature(s): RestrictedProduct.haarProduct_box.

### AdelicAlgebraicGroups:AA.0/restricted-haar-is-haar — The restricted product measure is a Haar measure
Hypotheses: ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i is an open subgroup for every i, compact for all but finitely many i
Contract: ∏ʳ μ i is a left Haar measure on the locally compact group Πʳ i, [G i, B i]; if every μ i is also right invariant then ∏ʳ μ i is right invariant.
Native equivalent signature(s): RestrictedProduct.haarProduct_isHaarMeasure, RestrictedProduct.haarProduct_isMulRightInvariant.

### AdelicAlgebraicGroups:AA.0/restricted-haar-rescale — Change of local normalizations
Hypotheses: ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i is an open subgroup for every i, compact for all but finitely many i
Contract: If μ′_i = c_i μ_i, where 0<c_i<∞ and c_i=1 outside a finite set, then the normalized restricted Haar products satisfy ∏ʳ μ′_i = (∏ᶠ c_i) ∏ʳ μ_i. An infinitely rescaled family needs the separately stated convergent-product construction; finite rescaling alone gives no such theorem.
Native equivalent signature(s): RestrictedProduct.haarProduct_rescale.

### AdelicAlgebraicGroups:AA.0/restricted-haar-change-subgroups — Changing the restricting subgroups at finitely many places
Hypotheses: ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i is an open subgroup for every i, compact for all but finitely many i; B' i open subgroups, B' i = B i cofinitely
Contract: Let B' i ≤ G i be open subgroups with B' i = B i for all but finitely many i. The identity on Π i, G i restricts to an isomorphism of topological groups Πʳ i, [G i, B i] ≃ₜ* Πʳ i, [G i, B' i], under which ∏ʳ μ i corresponds to ∏ʳ μ i (the normalization condition being cofinite). Thus the restricted product and its measure depend only on the B i up to finitely many indices.
Native equivalent signature(s): RestrictedProduct.changeSubgroups.

### AdelicAlgebraicGroups:AA.0/split-finite-factors — Splitting off finitely many factors
Hypotheses: ι arbitrary, S finite; G i topological groups, B i open subgroups
Contract: For a finite S ⊂ ι, the map x ↦ ((x i)_{i∈S}, (x i)_{i∉S}) is an isomorphism of topological groups Πʳ i, [G i, B i] ≃ₜ* (Π_{i∈S} G i) × Πʳ (i : ι∖S), [G i, B i].
Native carrier/API part: the named signatures below. Full structural specializations remain subject to their recorded conditions.
API RestrictedProduct.splitFinite: The isomorphism of topological groups for a finite set S.
Native signature above.
API RestrictedProduct.splitFinite_apply_fst: (splitFinite S x).1 i = x i for i ∈ S.
Native signature above.
API RestrictedProduct.splitFinite_apply_snd: (splitFinite S x).2 i = x i for i ∉ S.
Native signature above.
API RestrictedProduct.splitFinite_symm_apply: The inverse glues the two families.
Native signature above.
API RestrictedProduct.splitFinite_mono: For S ⊆ S' the splittings are compatible with the further splitting of the restricted factor.
Native signature above.
Test RestrictedProduct.splitFinite_empty: For S=∅, splitFinite identifies the restricted product with the one-point finite factor times itself, and the measure becomes the point measure times haarProduct.
Native example above.
Test RestrictedProduct.splitFinite_univ_finite: For finite ι and S=univ, splitFinite identifies the full restricted product with ∏_i G_i times the trivial group and transports Haar measure to Measure.pi μ times the point measure.
Native example above.
Test RestrictedProduct.splitFinite_not_infinite: Infinitely many factors cannot be split off: a family lying outside B i at infinitely many indices, such as (1/p)_p in ∏_p ℚ_p with B p = ℤ_p, is not an element of the restricted product.
Native example above.

### AdelicAlgebraicGroups:AA.0/restricted-haar-split — Fubini for restricted product measures
Hypotheses: ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i is an open subgroup for every i, compact for all but finitely many i; f integrable for ∏ʳ μ i
Contract: Under split-finite-factors, ∏ʳ_ι μ i corresponds to (Measure.pi (fun i : S => μ i)).prod (∏ʳ_{ι∖S} μ i). Hence for f integrable on Πʳ i, [G i, B i], ∫ f ∂(∏ʳ μ i) = ∫_{Π_{i∈S} G i} ∫_{Πʳ_{ι∖S}} f(x_S, x^S) dμ^S dμ_S.
Native equivalent signature(s): RestrictedProduct.haarProduct_split.

### AdelicAlgebraicGroups:AA.0/restricted-haar-factorizable-integral — Integral of a factorizable function
Hypotheses: ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i is an open subgroup for every i, compact for all but finitely many i; f i integrable, f i = 1_{B i} cofinitely
Contract: Let f i : G i → ℂ be integrable, with f i = indicator of B i for all but finitely many i. Then f(x) = ∏ i, f i (x i) is a well-defined integrable function on Πʳ i, [G i, B i] and ∫ f ∂(∏ʳ μ i) = ∏ᶠ i, ∫ f i ∂μ i.
Native equivalent signature(s): RestrictedProduct.integral_haarProduct_factorizable.

### AdelicAlgebraicGroups:AA.0/restricted-unimodular — Restricted products of unimodular groups are unimodular
Hypotheses: ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i is an open subgroup for every i, compact for all but finitely many i
Contract: If every G i is unimodular (modularCharacter G i = 1), then Πʳ i, [G i, B i] is unimodular. More generally the modular character of the restricted product is x ↦ ∏ᶠ i, Δ_{G i}(x i), a finite product because x_i belongs to B_i at almost every index and those B_i are compact at almost every index.
Native equivalent signature(s): RestrictedProduct.modularCharacter_haarProduct.

### AdelicAlgebraicGroups:AA.0/restricted-haar-map — Functoriality of restricted product measures
Hypotheses: ι is a countable index type; each G i is a second countable, locally compact, Hausdorff topological group; B i ≤ G i is an open subgroup for every i, compact for all but finitely many i; φ i topological group isomorphisms, φ i (B i) = B' i cofinitely
Contract: Let φ i : G i ≃ₜ* G' i be isomorphisms of topological groups with φ i (B i) = B' i for all but finitely many i. The induced isomorphism Φ = RestrictedProduct.map φ of restricted products satisfies Φ_*(∏ʳ μ i) = ∏ʳ (φ i)_* μ i.
Native equivalent signature(s): RestrictedProduct.map_haarProduct.

### AdelicAlgebraicGroups:AA.0/finite-adele-haar — Normalized Haar measure on the finite adeles
Hypotheses: K a number field
Contract: For a number field K, the measure μ_f on 𝔸_{K,f} = FiniteAdeleRing (𝓞 K) K is the restricted product of the additive Haar measures μ_v on K_v normalized by μ_v(𝒪_v) = 1, where each K_v is a nonarchimedean local field and 𝒪_v its compact open valuation ring.
Native carrier/API part: the named signatures below. Full structural specializations remain subject to their recorded conditions.
API NumberField.finiteAdeleHaar: The normalized Haar measure on 𝔸_{K,f}.
Native signature above.
API NumberField.finiteAdeleHaar_integers: finiteAdeleHaar (∏_v 𝒪_v) = 1.
Native signature above.
API NumberField.finiteAdeleHaar_isAddHaar: finiteAdeleHaar is an additive Haar measure.
Native signature above.
API NumberField.finiteAdeleHaar_smul: For a finite idele a, map (a * ·) finiteAdeleHaar = (∏_v |a_v|_v)⁻¹ • finiteAdeleHaar.
Native signature above.
Test NumberField.finiteAdeleHaar_ideal: For a nonzero ideal 𝔞 of 𝓞 K, the closure of 𝔞 in ∏_v 𝒪_v has measure (Ideal.absNorm 𝔞)⁻¹.
Native example above.
Test NumberField.finiteAdeleHaar_rat_twoZ2: For K = ℚ, the set 2ℤ_2 × ∏_{p≠2} ℤ_p has measure 1/2.
Native example above.
Test NumberField.finiteAdeleHaar_not_finite: finiteAdeleHaar is not a finite measure: 𝔸_{K,f} is a disjoint union of infinitely many translates of ∏_v 𝒪_v.
Native example above.

### AdelicAlgebraicGroups:AA.0/adele-haar — Normalized Haar measure on the adeles
Hypotheses: K a number field
Contract: For a number field K, the measure μ_𝔸 on 𝔸_K = K_∞ × 𝔸_{K,f} is the product of the measure on K_∞ = ∏_{w|∞} K_w given by Lebesgue measure at real places and twice Lebesgue measure at complex places, and the finite-adele measure finite-adele-haar.
Native carrier/API part: the named signatures below. Full structural specializations remain subject to their recorded conditions.
API NumberField.adeleHaar: The normalized Haar measure on 𝔸_K.
Native signature above.
API NumberField.adeleHaar_isAddHaar: adeleHaar is an additive Haar measure.
Native signature above.
API NumberField.adeleHaar_prod: adeleHaar is the product of the archimedean measure and finiteAdeleHaar.
Native signature above.
API NumberField.adeleHaar_infinite_eq_mixed: The archimedean factor is 2^{r₂} times the transport of the mixed-space volume.
Native signature above.
Test NumberField.adeleHaar_box_rat: For K = ℚ the set [0,1) × ∏_p ℤ_p has measure 1.
Native example above.
Test NumberField.adeleHaar_complex_factor: For K = ℚ(i), the set ([0,1]²) × ∏_v 𝒪_v has measure 2.
Native example above.
Test NumberField.adeleHaar_not_selfdual: For K with |d_K| > 1 the measure is not self-dual for the standard character: the self-dual measure is |d_K|^{-1/2} • adeleHaar (AL.0 owns the self-dual normalization).
Native example above.

### AdelicAlgebraicGroups:AA.0/idele-haar — Normalized Haar measure on the ideles
Hypotheses: K a number field
Contract: For a number field K, the measure d^×x on the idele group 𝔸_K^× is the restricted product, through the topological isomorphism 𝔸_K^× ≅ Πʳ v, [K_v^×, 𝒪_v^×] (finite part) times ∏_{w|∞} K_w^×, of the Haar measures d^×x_v with vol(𝒪_v^×) = 1 at finite places, dx/|x| at real places and 2 dx dy/(x² + y²) at complex places.
Native carrier/API part: the named signatures below. Full structural specializations remain subject to their recorded conditions.
API NumberField.ideleHaar: The normalized Haar measure on 𝔸_K^×.
Native signature above.
API NumberField.ideleHaar_isHaar: ideleHaar is a Haar measure on the idele group.
Native signature above.
API NumberField.ideleHaar_units: ideleHaar of ∏_v 𝒪_v^× times a box at infinity is the archimedean volume of the box.
Native signature above.
API NumberField.ideleHaar_invariant_principal: ideleHaar is invariant under multiplication by K^×.
Native signature above.
Test NumberField.ideleHaar_rat_box: For K = ℚ, ideleHaar (∏_p ℤ_p^× × [1,e]) = 1.
Native example above.
Test NumberField.ideleHaar_neq_restrict_adele: ideleHaar is not the restriction of adeleHaar to the units: the units are adeleHaar-null in 𝔸_K.
Native example above.
Test NumberField.ideleHaar_form_factor: At a finite place, the measure |dx/x|_v built from the additive normalization gives 𝒪_v^× volume 1 - q_v⁻¹, so ideleHaar is the product of (1 - q_v⁻¹)⁻¹|dx/x|_v.
Native example above.

### AdelicAlgebraicGroups:AA.0/tamagawa-convergence-failure — Products of form measures need convergence factors
Hypotheses: K = ℚ; the analogous statement for a number field K uses the pole of the Dedekind zeta function at s = 1
Contract: For K = ℚ and ω = dx/x on G_m, the local measures |ω|_p built from the additive normalization μ_p(ℤ_p) = 1 give vol(ℤ_p^×) = 1 - p⁻¹, and ∏_p (1 - p⁻¹) diverges to 0. Hence the family |ω|_p does not satisfy the normalization hypothesis of restricted-haar-product (cofinitely volume 1), and no rescaling by a single constant makes it do so; the Tamagawa measure of G_m uses the convergence factors λ_p = (1 - p⁻¹)⁻¹.
Native equivalent signature(s): tamagawa_convergence_failure.

### AdelicAlgebraicGroups:AA.1/adelic-points — Adelic points of an affine algebraic group
Hypotheses: F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G)
Contract: For a finitely generated commutative Hopf algebra H over a number field F, G(𝔸_F) is the group of F-algebra maps H → 𝔸_F under convolution (TauCeti.HopfAlgebra.points H 𝔸_F), with the topology of affine points over the topological ring 𝔸_F (weakest topology making every evaluation h ↦ x(h) continuous). Likewise G(𝔸_{F,f}), G(F_∞) = G(F ⊗_ℚ ℝ) and G(F_v). The diagonal ι : G(F) → G(𝔸_F) is mapPoints along F → 𝔸_F and the local projection p_v : G(𝔸_F) → G(F_v) is mapPoints along the projection 𝔸_F → F_v.
Native carrier/API part: the named signatures below. Full structural specializations remain subject to their recorded conditions.
API AdelicPoints: AdelicPoints H := WithConv (H →ₐ[F] 𝔸_F), a group under convolution.
Native signature above.
API AdelicPoints.instTopologicalSpace: The affine-points topology: induced from 𝔸_F^H by evaluation.
Signature omitted — RG2.0 must supply the affine-points evaluation topology and its group/embedding instances on these actual Hopf carriers; GlobalNumberFields layers 4–6 supply canonical local compactness and units topology. The algebraic carrier is native, but those general canonical instances are not pinned. No arbitrary topology is supplied.
API AdelicPoints.instIsTopologicalGroup: AdelicPoints H is a topological group.
Signature omitted — RG2.0 must supply the affine-points evaluation topology and its group/embedding instances on these actual Hopf carriers; GlobalNumberFields layers 4–6 supply canonical local compactness and units topology. The algebraic carrier is native, but those general canonical instances are not pinned. No arbitrary topology is supplied.
API AdelicPoints.diagonal: The diagonal G(F) →* AdelicPoints H, mapPoints along algebraMap F 𝔸_F.
Native signature above.
API AdelicPoints.proj: For a finite place v, the continuous homomorphism AdelicPoints H →* G(F_v).
Native signature above.
API AdelicPoints.continuous_eval: For h ∈ H, x ↦ x h is continuous AdelicPoints H → 𝔸_F.
Signature omitted — RG2.0 must supply the affine-points evaluation topology and its group/embedding instances on these actual Hopf carriers; GlobalNumberFields layers 4–6 supply canonical local compactness and units topology. The algebraic carrier is native, but those general canonical instances are not pinned. No arbitrary topology is supplied.
API AdelicPoints.proj_diagonal: proj v (diagonal g) is the image of g in G(F_v).
Native signature above.
API AdelicPoints.finiteEmbed: The finite-supported homomorphism G(𝔸_f)→G(𝔸), x↦(1,x), under the canonical archimedean/finite splitting. This is an embedding of point groups, not a ring inclusion with archimedean coordinate zero.
Native signature above.
API AdelicPoints.finiteEmbed_finite: The finite projection of finiteEmbed x equals x.
Native signature above.
API AdelicPoints.finiteEmbed_infinite: The infinite projection of finiteEmbed x equals 1.
Native signature above.
Test AdelicPoints.ga_eq_adeles: For H = F[T] with additive comultiplication, AdelicPoints H ≃ₜ+ 𝔸_F (see ga-adelic).
Example omitted — RG2.0 must supply the affine-points evaluation topology and its group/embedding instances on these actual Hopf carriers; GlobalNumberFields layers 4–6 supply canonical local compactness and units topology. The algebraic carrier is native, but those general canonical instances are not pinned. No arbitrary topology is supplied.
Test AdelicPoints.trivial_group: For H = F (the trivial group), AdelicPoints H is the one-point group.
Native example above.
Test AdelicPoints.not_product_topology: For H = F[T, T⁻¹] the topology is not the subspace topology of 𝔸_F: the inversion map is not continuous for the subspace topology on 𝔸_F^×.
Example omitted — RG2.0 must supply the affine-points evaluation topology and its group/embedding instances on these actual Hopf carriers; GlobalNumberFields layers 4–6 supply canonical local compactness and units topology. The algebraic carrier is native, but those general canonical instances are not pinned. No arbitrary topology is supplied.

### AdelicAlgebraicGroups:AA.1/integral-model — Integral models over S-integers
Hypotheses: F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G); S a finite set of places containing the archimedean ones
Contract: An integral model of H away from a finite set S of places of F (containing the archimedean places) is a finitely presented commutative Hopf algebra 𝓗 over the S-integers 𝒪_{F,S} together with an isomorphism of Hopf algebras F ⊗_{𝒪_{F,S}} 𝓗 ≅ H. For v ∉ S its integral points are 𝓗(𝒪_v) = Hom_{𝒪_{F,S}}(𝓗, 𝒪_v) ⊂ G(F_v).
Native carrier/API part: the named signatures below. Full structural specializations remain subject to their recorded conditions.
API IntegralModel: A finitely presented commutative Hopf algebra over O_{F,S} and a specified Hopf isomorphism of its F-generic fibre with H; S is finite and all infinite places are understood to be included.
Native signature above.
API IntegralModel.localPoints: For v ∉ S, the subgroup 𝓗(𝒪_v) of G(F_v).
Native signature above.
API IntegralModel.enlarge: For S ⊆ S′, the base-changed model over 𝒪_{F,S′}, with localPoints unchanged at v ∉ S′.
Native signature above.
API IntegralModel.localPoints_injective: The map 𝓗(𝒪_v) → G(F_v) induced by the injection 𝒪_v → F_v is injective.
Native signature above.
Test IntegralModel.gln_localPoints: For the standard model of GL_n, localPoints v = GL_n(𝒪_v) (invertible determinant), not all integral matrices with nonzero determinant.
Native example above.
Test IntegralModel.trivial: For the trivial group the localPoints are the trivial subgroup.
Native example above.
Test IntegralModel.monoid_not_model: The 𝒪_{F,S}-bialgebra 𝒪_{F,S}[T] with T ↦ T ⊗ T is not an integral model of G_m: its generic fibre F[T] has no antipode, although its F-points contain F^×.
Native example above.

### AdelicAlgebraicGroups:AA.1/integral-model-exists — Spreading out
Hypotheses: F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G)
Contract: Every finitely generated commutative Hopf algebra H over F has an integral model away from some finite set S of places.
Native equivalent signature(s): IntegralModel.exists.

### AdelicAlgebraicGroups:AA.1/integral-model-unique — Uniqueness of integral models up to enlarging S
Hypotheses: F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G)
Contract: Two integral models 𝓗, 𝓗′ of H (away from S and S′) become isomorphic, compatibly with their identifications with H, after base change to 𝒪_{F,S″} for some finite S″ ⊇ S ∪ S′. Consequently 𝓗(𝒪_v) = 𝓗′(𝒪_v) inside G(F_v) for all but finitely many v.
Native equivalent signature(s): IntegralModel.unique.

### AdelicAlgebraicGroups:AA.1/integral-points-level — Integral points are compact open subgroups
Hypotheses: F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G)
Contract: For an integral model 𝓗 away from S and a finite place v ∉ S, 𝓗(𝒪_v) is a compact open subgroup of G(F_v).
Signature omitted — RG2.0 must supply the affine-points evaluation topology and its group/embedding instances on these actual Hopf carriers; GlobalNumberFields layers 4–6 supply canonical local compactness and units topology. The algebraic carrier is native, but those general canonical instances are not pinned. No arbitrary topology is supplied.

### AdelicAlgebraicGroups:AA.1/restricted-product-comparison — Adelic points as a restricted product
Hypotheses: F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G); 𝓗 an integral model away from S
Contract: Let 𝓗 be an integral model of H away from S. The map x ↦ (p_v(x))_v is an isomorphism of topological groups G(𝔸_{F,f}) ≃ₜ* Πʳ v, [G(F_v), B_v], where B_v = 𝓗(𝒪_v) for v ∉ S and B_v = G(F_v) for the finitely many finite v ∈ S; and G(𝔸_F) ≃ₜ* G(F_∞) × G(𝔸_{F,f}).
Signature omitted — RG2.0 must supply the affine-points evaluation topology and its group/embedding instances on these actual Hopf carriers; GlobalNumberFields layers 4–6 supply canonical local compactness and units topology. The algebraic carrier is native, but those general canonical instances are not pinned. No arbitrary topology is supplied.

### AdelicAlgebraicGroups:AA.1/restricted-product-model-independence — Independence of the model and of the exceptional set
Hypotheses: F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G)
Contract: The topological group structure on Πʳ v, [G(F_v), 𝓗(𝒪_v)] obtained from restricted-product-comparison does not depend on the integral model 𝓗 or on S: for two models the identity of G(𝔸_{F,f}) corresponds to the canonical isomorphism of RestrictedProduct.changeSubgroups, and enlarging S does not change it.
Signature omitted — RG2.0 must supply the affine-points evaluation topology and its group/embedding instances on these actual Hopf carriers; GlobalNumberFields layers 4–6 supply canonical local compactness and units topology. The algebraic carrier is native, but those general canonical instances are not pinned. No arbitrary topology is supplied.

### AdelicAlgebraicGroups:AA.1/adelic-points-locally-compact — Adelic groups are locally compact
Hypotheses: F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G)
Contract: G(𝔸_F), G(𝔸_{F,f}) and G(F_∞) are second countable, locally compact, Hausdorff topological groups.
Signature omitted — RG2.0 must supply the affine-points evaluation topology and its group/embedding instances on these actual Hopf carriers; GlobalNumberFields layers 4–6 supply canonical local compactness and units topology. The algebraic carrier is native, but those general canonical instances are not pinned. No arbitrary topology is supplied.

### AdelicAlgebraicGroups:AA.1/rational-points-discrete — Rational points are discrete in the full adeles
Hypotheses: F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G)
Contract: The diagonal G(F) → G(𝔸_F) is injective, its image is a discrete subgroup, and the image is closed.
Signature omitted — RG2.0 must supply the affine-points evaluation topology and its group/embedding instances on these actual Hopf carriers; GlobalNumberFields layers 4–6 supply canonical local compactness and units topology. The algebraic carrier is native, but those general canonical instances are not pinned. No arbitrary topology is supplied.

### AdelicAlgebraicGroups:AA.1/finite-adelic-discreteness-criterion — Discreteness in the finite adeles alone
Hypotheses: F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G)
Contract: G(F) is discrete in G(𝔸_{F,f}) if and only if G(F) ∩ U is finite for one (equivalently every) compact open subgroup U ⊂ G(𝔸_{F,f}). In particular G_a(F) = F is not discrete in 𝔸_{F,f}, SL_2(ℚ) is not discrete in SL_2(𝔸_{ℚ,f}) because SL_2(ℤ) is infinite, and ℚ^× is discrete in 𝔸_{ℚ,f}^× because ℚ^× ∩ ∏_p ℤ_p^× = {±1}.
Signature omitted — RG2.0 must supply the affine-points evaluation topology and its group/embedding instances on these actual Hopf carriers; GlobalNumberFields layers 4–6 supply canonical local compactness and units topology. The algebraic carrier is native, but those general canonical instances are not pinned. No arbitrary topology is supplied.

### AdelicAlgebraicGroups:AA.1/adelic-points-split — Splitting off finitely many places
Hypotheses: F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G)
Contract: For a finite set S of places, G(𝔸_F) ≃ₜ* G(F_S) × G(𝔸_F^S), with G(F_S) = ∏_{v∈S} G(F_v) and G(𝔸_F^S) the adelic points away from S; in particular G(𝔸_F) ≃ₜ* G(F_∞) × G(𝔸_{F,f}). The diagonal G(F) maps to the pair of diagonals.
Signature omitted — RG2.0 must supply the affine-points evaluation topology and its group/embedding instances on these actual Hopf carriers; GlobalNumberFields layers 4–6 supply canonical local compactness and units topology. The algebraic carrier is native, but those general canonical instances are not pinned. No arbitrary topology is supplied.

### AdelicAlgebraicGroups:AA.1/adelic-map — Functoriality of adelic points
Hypotheses: F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G); φ a homomorphism of affine algebraic groups over F
Contract: A homomorphism of affine algebraic groups φ : G → G′ over F (a Hopf algebra map φ* : H′ → H) induces a continuous homomorphism φ_𝔸 : G(𝔸_F) → G′(𝔸_F), x ↦ x ∘ φ*, commuting with the diagonals and with the local projections, with (id)_𝔸 = id and (ψ ∘ φ)_𝔸 = ψ_𝔸 ∘ φ_𝔸. Under restricted-product-comparison it is the restricted product of the local maps φ_v, which send 𝓗(𝒪_v) into 𝓗′(𝒪_v) for almost all v.
Native carrier/API part: the named signatures below. Full structural specializations remain subject to their recorded conditions.
API AdelicPoints.map: AdelicPoints.map φ : AdelicPoints H →* AdelicPoints H′ for a Hopf algebra map H′ → H.
Native signature above.
API AdelicPoints.continuous_map: AdelicPoints.map φ is continuous.
Signature omitted — RG2.0 must supply the affine-points evaluation topology and its group/embedding instances on these actual Hopf carriers; GlobalNumberFields layers 4–6 supply canonical local compactness and units topology. The algebraic carrier is native, but those general canonical instances are not pinned. No arbitrary topology is supplied.
API AdelicPoints.map_id: AdelicPoints.map (id) = id.
Native signature above.
API AdelicPoints.map_comp: AdelicPoints.map (φ ∘ ψ) = AdelicPoints.map ψ ∘ AdelicPoints.map φ (contravariance on Hopf algebras).
Native signature above.
API AdelicPoints.map_diagonal: map φ (diagonal g) = diagonal (φ g).
Native signature above.
API AdelicPoints.proj_map: proj v ∘ map φ = φ_v ∘ proj v.
Native signature above.
Test AdelicPoints.map_det_gl1: For GL₁, the adelic determinant point map corresponds under the canonical GL₁-to-units identification to the identity on the idele group; explicitly its G_m unit is the one-by-one matrix determinant.
Native example above.
Test AdelicPoints.map_trivial: The map to the trivial group is the constant map.
Native example above.
Test AdelicPoints.map_not_open: For G_m over ℚ the image (𝔸_ℚ^×)² is closed and has infinite index. It is not open: every basic identity neighbourhood allows arbitrary units at almost all odd primes, including nonsquare units. Thus the adelic squaring map need not be surjective or open.
Example omitted — RG2.0 must supply the affine-points evaluation topology and its group/embedding instances on these actual Hopf carriers; GlobalNumberFields layers 4–6 supply canonical local compactness and units topology. The algebraic carrier is native, but those general canonical instances are not pinned. No arbitrary topology is supplied.

### AdelicAlgebraicGroups:AA.1/closed-subgroup-adelic — Closed subgroups give closed embeddings
Hypotheses: F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G); I a Hopf ideal of H
Contract: If H′ = H/I for a Hopf ideal I (a closed subgroup G′ ⊂ G), the induced map G′(𝔸_F) → G(𝔸_F) is a closed embedding of topological groups with image quotientPointsSubgroup H I 𝔸_F.
Signature omitted — RG2.0 must supply the affine-points evaluation topology and its group/embedding instances on these actual Hopf carriers; GlobalNumberFields layers 4–6 supply canonical local compactness and units topology. The algebraic carrier is native, but those general canonical instances are not pinned. No arbitrary topology is supplied.

### AdelicAlgebraicGroups:AA.1/product-adelic — Products of groups
Hypotheses: F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G)
Contract: For affine algebraic groups G, G′ over F, (G × G′)(𝔸_F) ≃ₜ* G(𝔸_F) × G′(𝔸_F), compatibly with diagonals and local projections.
Signature omitted — RG2.0 must supply the affine-points evaluation topology and its group/embedding instances on these actual Hopf carriers; GlobalNumberFields layers 4–6 supply canonical local compactness and units topology. The algebraic carrier is native, but those general canonical instances are not pinned. No arbitrary topology is supplied.

### AdelicAlgebraicGroups:AA.1/center-adelic — The centre on adelic points
Hypotheses: F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G)
Contract: Let Z ⊂ G be the centre (centerDefiningIdeal). Then Z(𝔸_F) is a closed subgroup of G(𝔸_F) contained in the centre of G(𝔸_F), and Z(F) = Z(𝔸_F) ∩ G(F).
Signature omitted — RG2.0 must supply the affine-points evaluation topology and its group/embedding instances on these actual Hopf carriers; GlobalNumberFields layers 4–6 supply canonical local compactness and units topology. The algebraic carrier is native, but those general canonical instances are not pinned. No arbitrary topology is supplied.

### AdelicAlgebraicGroups:AA.1/base-change-adelic — Restriction of scalars on adelic points
Hypotheses: E/F a finite extension of number fields; G_E an affine algebraic group over E; The Weil restriction and the completion/adelic base-change maps are the natural adjunction and canonical tensor-product maps; arbitrary point equivalences are excluded.; F is a number field and O(G) is a finite-type commutative Hopf F-algebra; integral generic-fibre identifications respect the Hopf structure.
Contract: For a finite extension E/F and an affine algebraic group G_E over E, with Res = Res_{E/F} G_E, there is an isomorphism of topological groups Res(𝔸_F) ≃ₜ* G_E(𝔸_E), natural in G_E, compatible with Res(F) = G_E(E) on diagonals.
Signature omitted — RG2.0a must supply the actual Weil-restriction group object and its natural point adjunction; GlobalNumberFields layer 8 must supply the canonical continuous adelic tensor comparison. Their objects and naturality squares have no pinned general interface. No chosen equivalence is substituted.
API AdelicPoints.resEquiv: The isomorphism of topological groups Res_{E/F}(G_E)(𝔸_F) ≃ₜ* G_E(𝔸_E).
Signature omitted — RG2.0a must supply the actual Weil-restriction group object and its natural point adjunction; GlobalNumberFields layer 8 must supply the canonical continuous adelic tensor comparison. Their objects and naturality squares have no pinned general interface. No chosen equivalence is substituted.
API AdelicPoints.resEquiv_diagonal: resEquiv carries the diagonal of Res(F) to the diagonal of G_E(E).
Signature omitted — RG2.0a must supply the actual Weil-restriction group object and its natural point adjunction; GlobalNumberFields layer 8 must supply the canonical continuous adelic tensor comparison. Their objects and naturality squares have no pinned general interface. No chosen equivalence is substituted.
API AdelicPoints.resEquiv_natural: resEquiv is natural in homomorphisms G_E → G′_E.
Signature omitted — RG2.0a must supply the actual Weil-restriction group object and its natural point adjunction; GlobalNumberFields layer 8 must supply the canonical continuous adelic tensor comparison. Their objects and naturality squares have no pinned general interface. No chosen equivalence is substituted.
API AdelicPoints.resEquiv_trans: In a tower F ⊂ E ⊂ L, resEquiv for L/F is the composite of those for L/E and E/F.
Signature omitted — RG2.0a must supply the actual Weil-restriction group object and its natural point adjunction; GlobalNumberFields layer 8 must supply the canonical continuous adelic tensor comparison. Their objects and naturality squares have no pinned general interface. No chosen equivalence is substituted.
Test AdelicPoints.resEquiv_gm: For G_E = G_m, resEquiv is 𝔸_E^× ≃ (E ⊗ 𝔸_F)^×.
Example omitted — RG2.0a must supply the actual Weil-restriction group object and its natural point adjunction; GlobalNumberFields layer 8 must supply the canonical continuous adelic tensor comparison. Their objects and naturality squares have no pinned general interface. No chosen equivalence is substituted.
Test AdelicPoints.resEquiv_self: For E = F, resEquiv is the identity.
Example omitted — RG2.0a must supply the actual Weil-restriction group object and its natural point adjunction; GlobalNumberFields layer 8 must supply the canonical continuous adelic tensor comparison. Their objects and naturality squares have no pinned general interface. No chosen equivalence is substituted.
Test AdelicPoints.res_not_base_change: Res_{E/F}(G_E) is not the base change of G_E: for E = ℚ(i), Res G_m(ℚ) = ℚ(i)^× while G_m(ℚ) = ℚ^×.
Example omitted — RG2.0a must supply the actual Weil-restriction group object and its natural point adjunction; GlobalNumberFields layer 8 must supply the canonical continuous adelic tensor comparison. Their objects and naturality squares have no pinned general interface. No chosen equivalence is substituted.

### AdelicAlgebraicGroups:AA.1/base-change-local-factors — Local factors of restriction of scalars
Hypotheses: E/F finite; G_E affine over E; The Weil restriction and the completion/adelic base-change maps are the natural adjunction and canonical tensor-product maps; arbitrary point equivalences are excluded.; F is a number field and O(G) is a finite-type commutative Hopf F-algebra; integral generic-fibre identifications respect the Hopf structure.
Contract: Under base-change-adelic, the projection to F_v corresponds to Res(F_v) ≃ ∏_{w|v} G_E(E_w), and for almost all v the integral points of a model of Res correspond to ∏_{w|v} 𝓗_E(𝒪_w).
Signature omitted — RG2.0a must supply the actual Weil-restriction group object and its natural point adjunction; GlobalNumberFields layer 8 must supply the canonical continuous adelic tensor comparison. Their objects and naturality squares have no pinned general interface. No chosen equivalence is substituted.

### AdelicAlgebraicGroups:AA.1/ga-adelic — The additive group
Hypotheses: F a number field
Contract: For G = G_a (H = F[T] with T primitive), G(𝔸_F) ≃ₜ+ 𝔸_F, the diagonal is algebraMap F 𝔸_F and restricted-product-comparison recovers FiniteAdeleRing as a restricted product.
Signature omitted — RG2.0 must supply the affine-points evaluation topology and its group/embedding instances on these actual Hopf carriers; GlobalNumberFields layers 4–6 supply canonical local compactness and units topology. The algebraic carrier is native, but those general canonical instances are not pinned. No arbitrary topology is supplied.

### AdelicAlgebraicGroups:AA.1/gm-adelic — The multiplicative group and the ideles
Hypotheses: F a number field
Contract: For G = G_m, G(𝔸_F) ≃ₜ* NumberField.IdeleGroup (𝓞 F) F = 𝔸_F^× with the units topology, and under restricted-product-comparison the finite part is Πʳ v, [F_v^×, 𝒪_v^×] via RestrictedProduct.unitsEquiv.
Signature omitted — RG2.0 must supply the affine-points evaluation topology and its group/embedding instances on these actual Hopf carriers; GlobalNumberFields layers 4–6 supply canonical local compactness and units topology. The algebraic carrier is native, but those general canonical instances are not pinned. No arbitrary topology is supplied.

### AdelicAlgebraicGroups:AA.1/gln-adelic — The general linear group
Hypotheses: F a number field; n ≥ 1
Contract: For G = GL_n, G(𝔸_F) ≃ₜ* GL_n(𝔸_F) = (Matrix (Fin n) (Fin n) 𝔸_F)ˣ with the units topology, and its finite part is the restricted product Πʳ v, [GL_n(F_v), GL_n(𝒪_v)].
Signature omitted — RG2.0 must supply the affine-points evaluation topology and its group/embedding instances on these actual Hopf carriers; GlobalNumberFields layers 4–6 supply canonical local compactness and units topology. The algebraic carrier is native, but those general canonical instances are not pinned. No arbitrary topology is supplied.

### AdelicAlgebraicGroups:AA.1/local-unimodular-reductive — Local unimodularity of reductive groups
Hypotheses: E a local field of characteristic 0; G connected reductive over E
Contract: For a connected reductive group G over a local field E of characteristic 0, the locally compact group G(E) is unimodular.
Signature omitted — RG2.0 supplies canonical local point topology and RG2.1 supplies the field-generic torus/root and adjoint structure. The group-theoretic modular statement cannot be specialized to unspecified point topologies or generic reductive data fields.

### AdelicAlgebraicGroups:AA.1/unimodular-reductive — Adelic groups of reductive groups are unimodular
Hypotheses: F a number field; G connected reductive over F
Contract: For a connected reductive group G over a number field F, G(𝔸_F), G(𝔸_{F,f}) and G(F_∞) are unimodular.
Signature omitted — RG2.0 supplies canonical local point topology and RG2.1 supplies the field-generic torus/root and adjoint structure. The group-theoretic modular statement cannot be specialized to unspecified point topologies or generic reductive data fields.

### AdelicAlgebraicGroups:AA.1/compact-open-product — Compact open subgroups and product levels
Hypotheses: F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G)
Contract: Every compact open subgroup U ⊂ G(𝔸_{F,f}) contains a product subgroup ∏_v U_v with U_v ⊂ G(F_v) compact open and U_v = 𝓗(𝒪_v) for all but finitely many v, and is contained in such a product; any two compact open subgroups are commensurable.
Signature omitted — RG2.0 must supply the affine-points evaluation topology and its group/embedding instances on these actual Hopf carriers; GlobalNumberFields layers 4–6 supply canonical local compactness and units topology. The algebraic carrier is native, but those general canonical instances are not pinned. No arbitrary topology is supplied.

### AdelicAlgebraicGroups:AA.1/finite-support-conjugate — Conjugation changes a level at finitely many places
Hypotheses: F a number field; H a finitely generated commutative Hopf algebra over F (the coordinate ring of an affine algebraic group G)
Contract: For g ∈ G(𝔸_{F,f}) and an integral model 𝓗, g_v ∈ 𝓗(𝒪_v) for all but finitely many v; hence for a product level U = ∏_v U_v, the conjugate gUg⁻¹ = ∏_v g_v U_v g_v⁻¹ agrees with U at all but finitely many v, and the element g can be written as g_B · u with g_B supported on a finite set B of places and u ∈ ∏_v 𝓗(𝒪_v).
Signature omitted — RG2.0 must supply the affine-points evaluation topology and its group/embedding instances on these actual Hopf carriers; GlobalNumberFields layers 4–6 supply canonical local compactness and units topology. The algebraic carrier is native, but those general canonical instances are not pinned. No arbitrary topology is supplied.

### AdelicAlgebraicGroups:AA.2/rational-characters — F-rational characters
Hypotheses: F a number field; G = Spec H an affine algebraic group over F, H finitely generated
Contract: X*_F(G) is the group of homomorphisms G → G_m defined over F, realized as the group-like elements χ ∈ H (Δχ = χ ⊗ χ, ε(χ) = 1) under multiplication; χ acts on points by x ↦ x(χ) ∈ R^×. Equivalently, X*_F(G) is the Galois-fixed subgroup of the geometric character group X*(G_{F̄}).
Native carrier/API part: the named signatures below. Full structural specializations remain subject to their recorded conditions.
API RationalCharacter: RationalCharacter H := GroupLike F H, a commutative group.
Native signature above.
API RationalCharacter.apply: For χ and a point x : H →ₐ[F] R, χ x := x χ ∈ Rˣ.
Native signature above.
API RationalCharacter.apply_mul: χ (x * y) = χ x * χ y for the convolution product.
Native signature above.
API RationalCharacter.equivHom: RationalCharacter H ≃* (Hopf maps F[T,T⁻¹] → H).
Native signature above.
API RationalCharacter.toGeometric_injective: Base change to an algebraic closure injects rational characters into Tau Ceti’s geometric character group.
Native signature above.
API RationalCharacter.free: For finite-type smooth geometrically reduced and geometrically connected G, its rational character group is free abelian of finite rank.
Native signature above.
API RationalCharacter.toGeometric_range: Over a number field F, the image of rational characters in the geometric character group is exactly the subgroup fixed by Field.absoluteGaloisGroup F.
Native signature above.
Test RationalCharacter.gln_det: For n≥1, X*_F(GL_n)≃ℤ and the actual generic determinant is sent to 1, so every character is its unique integral power.
Native example above.
Test RationalCharacter.sln_trivial: For SL_n, RationalCharacter is trivial.
Native example above.
Test RationalCharacter.res_norm: For E = ℚ(i), the rational characters of Res_{E/ℚ} G_m have rank 1, not the rank 2 of the geometric character group.
Example omitted — The native group-like and real-dual interfaces are above. This additional restriction-of-scalars or centre comparison needs the actual RG2.0a Weil-restriction object or RG2.1 central torus/quotient maps. A comparison with a chosen lattice is not a replacement.

### AdelicAlgebraicGroups:AA.2/rational-characters-free — Rational characters form a lattice
Hypotheses: F a number field; G = Spec H an affine algebraic group over F, H finitely generated; G geometrically connected; G smooth and geometrically reduced (automatic for reduced finite-type characteristic-zero algebraic groups through the requested bridge)
Contract: For geometrically connected G, X*_F(G) is a free abelian group of finite rank. For connected reductive G, restriction of F-rational characters to the identity component of the centre is injective with finite cokernel (Borel 5.9).
Signature omitted — The native group-like and real-dual interfaces are above. This additional restriction-of-scalars or centre comparison needs the actual RG2.0a Weil-restriction object or RG2.1 central torus/quotient maps. A comparison with a chosen lattice is not a replacement.

### AdelicAlgebraicGroups:AA.2/real-character-space — The real vector space a_G
Hypotheses: F a number field; G = Spec H an affine algebraic group over F, H finitely generated; G geometrically connected
Contract: a_G = Hom_ℤ(X*_F(G), ℝ), a finite-dimensional real vector space, with dual a_G^* = X*_F(G) ⊗_ℤ ℝ and complexification a_{G,ℂ}^* = X*_F(G) ⊗ ℂ. A homomorphism G → G′ induces a linear map a_G → a_{G′}.
Native carrier/API part: the named signatures below. Full structural specializations remain subject to their recorded conditions.
API RealCharacterSpace: RealCharacterSpace H = Hom_ℤ(Additive X*_F(G), ℝ), with scalar multiplication on the codomain and the finite-dimensional topology from rational-characters-free.
Native signature above.
API RealCharacterSpace.pairing: The pairing a_G × X*_F(G) → ℝ.
Native signature above.
API RealCharacterSpace.finrank: finrank ℝ a_G = rank of X*_F(G).
Native signature above.
API RealCharacterSpace.map: A coordinate Hopf map H′→H gives the linear map a_G→a_{G′} by precomposition with character pullback.
Native signature above.
API RealCharacterSpace.map_id: The map induced by the identity coordinate Hopf map is the identity on a_G.
Native signature above.
API RealCharacterSpace.map_comp: For coordinate Hopf maps φ:H′→H and ψ:H″→H′, map(φ∘ψ)=map(ψ)∘map(φ).
Native signature above.
Test RealCharacterSpace.gln_finrank: For GL_n with n≥1, its rational character lattice is ℤ·det and a_G has real dimension 1.
Native example above.
Test RealCharacterSpace.sln_zero: a_{SL_n} = 0.
Native example above.
Test RealCharacterSpace.res_gm_rank: For E = ℚ(i) and G = Res_{E/ℚ} G_m, finrank a_G = 1, not 2.
Example omitted — The native group-like and real-dual interfaces are above. This additional restriction-of-scalars or centre comparison needs the actual RG2.0a Weil-restriction object or RG2.1 central torus/quotient maps. A comparison with a chosen lattice is not a replacement.

### AdelicAlgebraicGroups:AA.2/log-height — The Harish-Chandra map H_G
Hypotheses: F a number field; G = Spec H an affine algebraic group over F, H finitely generated; G geometrically connected
Contract: H_G : G(𝔸_F) → a_G is the continuous homomorphism with ⟨H_G(x), χ⟩ = log ‖χ(x)‖ for χ ∈ X*_F(G), where χ(x) = χ_𝔸(x) ∈ 𝔸_F^× and ‖·‖ is the idele norm ∏_v |·|_v.
Signature omitted — GlobalNumberFields layer 6 must supply the canonical continuous full-idele norm with product formula, and RG2.0 the canonical evaluation topology and character point maps. The corresponding kernel/height contracts are retained rather than using an arbitrary multiplicative norm.
API AdelicPoints.logHeight: logHeight : AdelicPoints H →* Multiplicative a_G (an additive map to a_G).
Signature omitted — GlobalNumberFields layer 6 must supply the canonical continuous full-idele norm with product formula, and RG2.0 the canonical evaluation topology and character point maps. The corresponding kernel/height contracts are retained rather than using an arbitrary multiplicative norm.
API AdelicPoints.logHeight_apply: ⟪logHeight x, χ⟫ = Real.log ‖χ x‖.
Signature omitted — GlobalNumberFields layer 6 must supply the canonical continuous full-idele norm with product formula, and RG2.0 the canonical evaluation topology and character point maps. The corresponding kernel/height contracts are retained rather than using an arbitrary multiplicative norm.
API AdelicPoints.continuous_logHeight: logHeight is continuous.
Signature omitted — GlobalNumberFields layer 6 must supply the canonical continuous full-idele norm with product formula, and RG2.0 the canonical evaluation topology and character point maps. The corresponding kernel/height contracts are retained rather than using an arbitrary multiplicative norm.
API AdelicPoints.logHeight_diagonal: logHeight (diagonal g) = 0 (product formula).
Signature omitted — GlobalNumberFields layer 6 must supply the canonical continuous full-idele norm with product formula, and RG2.0 the canonical evaluation topology and character point maps. The corresponding kernel/height contracts are retained rather than using an arbitrary multiplicative norm.
API AdelicPoints.logHeight_map: logHeight ∘ map φ = a(φ) ∘ logHeight.
Signature omitted — GlobalNumberFields layer 6 must supply the canonical continuous full-idele norm with product formula, and RG2.0 the canonical evaluation topology and character point maps. The corresponding kernel/height contracts are retained rather than using an arbitrary multiplicative norm.
API AdelicPoints.logHeight_compact: logHeight vanishes on every compact subgroup.
Signature omitted — GlobalNumberFields layer 6 must supply the canonical continuous full-idele norm with product formula, and RG2.0 the canonical evaluation topology and character point maps. The corresponding kernel/height contracts are retained rather than using an arbitrary multiplicative norm.
Test AdelicPoints.logHeight_gm: For G = G_m, logHeight is log of the idele norm.
Example omitted — GlobalNumberFields layer 6 must supply the canonical continuous full-idele norm with product formula, and RG2.0 the canonical evaluation topology and character point maps. The corresponding kernel/height contracts are retained rather than using an arbitrary multiplicative norm.
Test AdelicPoints.logHeight_sln: For SL_n, logHeight is identically zero.
Example omitted — GlobalNumberFields layer 6 must supply the canonical continuous full-idele norm with product formula, and RG2.0 the canonical evaluation topology and character point maps. The corresponding kernel/height contracts are retained rather than using an arbitrary multiplicative norm.
Test AdelicPoints.logHeight_not_infinite_only: logHeight is not computed from the archimedean component alone: for F = ℚ, the ideles 1 and (p at the place p, 1 elsewhere) have the same archimedean component but norms 1 and p⁻¹.
Example omitted — GlobalNumberFields layer 6 must supply the canonical continuous full-idele norm with product formula, and RG2.0 the canonical evaluation topology and character point maps. The corresponding kernel/height contracts are retained rather than using an arbitrary multiplicative norm.

### AdelicAlgebraicGroups:AA.2/log-height-rational — H_G vanishes on rational points
Hypotheses: F a number field; G = Spec H an affine algebraic group over F, H finitely generated
Contract: For g ∈ G(F), H_G(g) = 0.
Signature omitted — GlobalNumberFields layer 6 must supply the canonical continuous full-idele norm with product formula, and RG2.0 the canonical evaluation topology and character point maps. The corresponding kernel/height contracts are retained rather than using an arbitrary multiplicative norm.

### AdelicAlgebraicGroups:AA.2/norm-one-subgroup — The norm-one subgroup G(𝔸)^1
Hypotheses: F a number field; G = Spec H an affine algebraic group over F, H finitely generated; G geometrically connected
Contract: G(𝔸_F)^1 = ker H_G = ⋂_{χ ∈ X*_F(G)} ker ‖χ‖, a closed normal subgroup of G(𝔸_F) containing G(F), every compact subgroup and the commutator subgroup.
Signature omitted — GlobalNumberFields layer 6 must supply the canonical continuous full-idele norm with product formula, and RG2.0 the canonical evaluation topology and character point maps. The corresponding kernel/height contracts are retained rather than using an arbitrary multiplicative norm.
API AdelicPoints.normOne: normOne H : Subgroup (AdelicPoints H) := logHeight.ker.
Signature omitted — GlobalNumberFields layer 6 must supply the canonical continuous full-idele norm with product formula, and RG2.0 the canonical evaluation topology and character point maps. The corresponding kernel/height contracts are retained rather than using an arbitrary multiplicative norm.
API AdelicPoints.isClosed_normOne: normOne is closed.
Signature omitted — GlobalNumberFields layer 6 must supply the canonical continuous full-idele norm with product formula, and RG2.0 the canonical evaluation topology and character point maps. The corresponding kernel/height contracts are retained rather than using an arbitrary multiplicative norm.
API AdelicPoints.normOne_normal: normOne is normal.
Signature omitted — GlobalNumberFields layer 6 must supply the canonical continuous full-idele norm with product formula, and RG2.0 the canonical evaluation topology and character point maps. The corresponding kernel/height contracts are retained rather than using an arbitrary multiplicative norm.
API AdelicPoints.diagonal_mem_normOne: diagonal g ∈ normOne.
Signature omitted — GlobalNumberFields layer 6 must supply the canonical continuous full-idele norm with product formula, and RG2.0 the canonical evaluation topology and character point maps. The corresponding kernel/height contracts are retained rather than using an arbitrary multiplicative norm.
API AdelicPoints.mem_normOne_iff: x ∈ normOne iff ‖χ x‖ = 1 for every rational character χ.
Signature omitted — GlobalNumberFields layer 6 must supply the canonical continuous full-idele norm with product formula, and RG2.0 the canonical evaluation topology and character point maps. The corresponding kernel/height contracts are retained rather than using an arbitrary multiplicative norm.
API AdelicPoints.normOne_eq_top_of_no_characters: If X*_F(G) = 0 then normOne = ⊤.
Signature omitted — GlobalNumberFields layer 6 must supply the canonical continuous full-idele norm with product formula, and RG2.0 the canonical evaluation topology and character point maps. The corresponding kernel/height contracts are retained rather than using an arbitrary multiplicative norm.
Test AdelicPoints.normOne_gm: For G_m, normOne is the norm-one idele subgroup of GlobalNumberFields layer 6.
Example omitted — GlobalNumberFields layer 6 must supply the canonical continuous full-idele norm with product formula, and RG2.0 the canonical evaluation topology and character point maps. The corresponding kernel/height contracts are retained rather than using an arbitrary multiplicative norm.
Test AdelicPoints.normOne_sl2: For SL_2, normOne = ⊤.
Example omitted — GlobalNumberFields layer 6 must supply the canonical continuous full-idele norm with product formula, and RG2.0 the canonical evaluation topology and character point maps. The corresponding kernel/height contracts are retained rather than using an arbitrary multiplicative norm.
Test AdelicPoints.normOne_not_finite_part: normOne is not G(F_∞)^1 × G(𝔸_f): for GL_1(𝔸_ℚ) the idele (p_∞ = p, p_p = p, 1 elsewhere) has norm 1 but its archimedean component has |p|_∞ ≠ 1.
Example omitted — GlobalNumberFields layer 6 must supply the canonical continuous full-idele norm with product formula, and RG2.0 the canonical evaluation topology and character point maps. The corresponding kernel/height contracts are retained rather than using an arbitrary multiplicative norm.

### AdelicAlgebraicGroups:AA.2/split-centre — The split component A_G
Hypotheses: F a number field; G a connected reductive group over F
Contract: Let G₁ = Res_{F/ℚ} G. A_G is the largest ℚ-split torus in the centre of G₁, and A_G(ℝ)^0 ⊂ G₁(ℝ) = G(F ⊗ ℝ) = G(F_∞) ⊂ G(𝔸_F) the identity component of its real points, isomorphic to (ℝ_{>0})^k with k = rank X*_F(G).
Signature omitted — RG2.0a/RG2.1 must supply Res_{F/ℚ}, its maximal split central torus and its canonical positive real embedding; the lattice-dual Lebesgue normalization and quotient topology then specify this comparison. Those group objects/embeddings have no pinned general interface.
API SplitComponent: The subgroup A_G(ℝ)^0 of AdelicPoints H (supported at the archimedean places).
Signature omitted — RG2.0a/RG2.1 must supply Res_{F/ℚ}, its maximal split central torus and its canonical positive real embedding; the lattice-dual Lebesgue normalization and quotient topology then specify this comparison. Those group objects/embeddings have no pinned general interface.
API SplitComponent.logHeight_equiv: logHeight restricts to an isomorphism of topological groups A_G(ℝ)^0 ≃ a_G.
Signature omitted — RG2.0a/RG2.1 must supply Res_{F/ℚ}, its maximal split central torus and its canonical positive real embedding; the lattice-dual Lebesgue normalization and quotient topology then specify this comparison. Those group objects/embeddings have no pinned general interface.
API SplitComponent.central: A_G(ℝ)^0 is central in G(𝔸).
Signature omitted — RG2.0a/RG2.1 must supply Res_{F/ℚ}, its maximal split central torus and its canonical positive real embedding; the lattice-dual Lebesgue normalization and quotient topology then specify this comparison. Those group objects/embeddings have no pinned general interface.
API SplitComponent.inter_normOne: A_G(ℝ)^0 ∩ G(𝔸)^1 = {1}.
Signature omitted — RG2.0a/RG2.1 must supply Res_{F/ℚ}, its maximal split central torus and its canonical positive real embedding; the lattice-dual Lebesgue normalization and quotient topology then specify this comparison. Those group objects/embeddings have no pinned general interface.
Test SplitComponent.gln_scalars: For GL_n, a_G is one-dimensional and SplitComponent (the positive real scalars at ∞ for F = ℚ) is homeomorphic to ℝ.
Example omitted — RG2.0a/RG2.1 must supply Res_{F/ℚ}, its maximal split central torus and its canonical positive real embedding; the lattice-dual Lebesgue normalization and quotient topology then specify this comparison. Those group objects/embeddings have no pinned general interface.
Test SplitComponent.semisimple_trivial: For semisimple G, SplitComponent is trivial.
Example omitted — RG2.0a/RG2.1 must supply Res_{F/ℚ}, its maximal split central torus and its canonical positive real embedding; the lattice-dual Lebesgue normalization and quotient topology then specify this comparison. Those group objects/embeddings have no pinned general interface.
Test SplitComponent.gm_number_field: For G_m over a number field F, a_G and SplitComponent are one-dimensional, whereas (F ⊗ ℝ)^×_{>0} has dimension r₁ + r₂: for F real quadratic the anti-diagonal direction is not split over ℚ.
Example omitted — RG2.0a/RG2.1 must supply Res_{F/ℚ}, its maximal split central torus and its canonical positive real embedding; the lattice-dual Lebesgue normalization and quotient topology then specify this comparison. Those group objects/embeddings have no pinned general interface.

### AdelicAlgebraicGroups:AA.2/log-height-split-centre-iso — H_G on the split centre
Hypotheses: F a number field; G a connected reductive group over F
Contract: The restriction of H_G to A_G(ℝ)^0 is an isomorphism of topological groups onto a_G; in particular H_G is surjective.
Signature omitted — RG2.0a/RG2.1 must supply Res_{F/ℚ}, its maximal split central torus and its canonical positive real embedding; the lattice-dual Lebesgue normalization and quotient topology then specify this comparison. Those group objects/embeddings have no pinned general interface.

### AdelicAlgebraicGroups:AA.2/split-centre-decomposition — G(𝔸) = G(𝔸)^1 × A_G(ℝ)^0
Hypotheses: F a number field; G a connected reductive group over F
Contract: Multiplication G(𝔸_F)^1 × A_G(ℝ)^0 → G(𝔸_F) is an isomorphism of topological groups.
Signature omitted — RG2.0a/RG2.1 must supply Res_{F/ℚ}, its maximal split central torus and its canonical positive real embedding; the lattice-dual Lebesgue normalization and quotient topology then specify this comparison. Those group objects/embeddings have no pinned general interface.

### AdelicAlgebraicGroups:AA.2/quotient-norm-one-comparison — Two normalizations of the quotient
Hypotheses: F a number field; G a connected reductive group over F
Contract: The inclusion G(𝔸_F)^1 → G(𝔸_F) induces a homeomorphism G(F)\G(𝔸_F)^1 ≃ G(F)\G(𝔸_F)/A_G(ℝ)^0, equivariant for G(𝔸_F)^1 acting on the right; it is a theorem, not a definitional identity, and it fails if A_G(ℝ)^0 is replaced by a larger central subgroup such as Z(F_∞)^0.
Signature omitted — RG2.0a/RG2.1 must supply Res_{F/ℚ}, its maximal split central torus and its canonical positive real embedding; the lattice-dual Lebesgue normalization and quotient topology then specify this comparison. Those group objects/embeddings have no pinned general interface.

### AdelicAlgebraicGroups:AA.2/modulus-character — Modulus character of a parabolic
Hypotheses: F a number field; G a connected reductive group over F; P an F-parabolic with unipotent radical N_P (Tau Ceti dynamic parabolic P(λ) for an F-cocharacter λ)
Contract: For an F-parabolic P = M_P N_P of G (or any F-group with a normal unipotent F-subgroup N), δ_P : P(𝔸_F) → ℝ_{>0} is δ_P(p) = ‖det(Ad(p) | Lie N_P)‖, the idele norm of the determinant of the adjoint action on Lie N_P ⊗ 𝔸_F. It factors as ∏_v δ_{P,v}, is trivial on N_P(𝔸) and P(F), and δ_P(p) = e^{⟨2ρ_P, H_P(p)⟩}.
Signature omitted — RG2.1 supplies the actual rational parabolic, unipotent radical and adjoint action on its Lie algebra. The scalar expression alone does not define those canonical group/Lie objects; dleft=δ⁻¹ dright is the fixed convention.
API Parabolic.modulus: Parabolic.modulus P : P(𝔸) →* ℝ≥0, p ↦ ‖det (Ad p | Lie N_P)‖.
Signature omitted — RG2.1 supplies the actual rational parabolic, unipotent radical and adjoint action on its Lie algebra. The scalar expression alone does not define those canonical group/Lie objects; dleft=δ⁻¹ dright is the fixed convention.
API Parabolic.modulus_apply_local: modulus p = ∏ᶠ v, |det(Ad p_v | Lie N_P ⊗ F_v)|_v.
Signature omitted — RG2.1 supplies the actual rational parabolic, unipotent radical and adjoint action on its Lie algebra. The scalar expression alone does not define those canonical group/Lie objects; dleft=δ⁻¹ dright is the fixed convention.
API Parabolic.modulus_rational: modulus (diagonal p) = 1 for p ∈ P(F).
Signature omitted — RG2.1 supplies the actual rational parabolic, unipotent radical and adjoint action on its Lie algebra. The scalar expression alone does not define those canonical group/Lie objects; dleft=δ⁻¹ dright is the fixed convention.
API Parabolic.modulus_unipotent: modulus n = 1 for n ∈ N_P(𝔸).
Signature omitted — RG2.1 supplies the actual rational parabolic, unipotent radical and adjoint action on its Lie algebra. The scalar expression alone does not define those canonical group/Lie objects; dleft=δ⁻¹ dright is the fixed convention.
API Parabolic.modulus_eq_exp_rho: modulus p = exp ⟨2ρ_P, H_P p⟩.
Signature omitted — RG2.1 supplies the actual rational parabolic, unipotent radical and adjoint action on its Lie algebra. The scalar expression alone does not define those canonical group/Lie objects; dleft=δ⁻¹ dright is the fixed convention.
Test Parabolic.modulus_borel_gl2: For the Borel of GL_2, modulus (diag(a,d) * n) = ‖a/d‖.
Example omitted — RG2.1 supplies the actual rational parabolic, unipotent radical and adjoint action on its Lie algebra. The scalar expression alone does not define those canonical group/Lie objects; dleft=δ⁻¹ dright is the fixed convention.
Test Parabolic.modulus_top: For P = G, modulus = 1.
Example omitted — RG2.1 supplies the actual rational parabolic, unipotent radical and adjoint action on its Lie algebra. The scalar expression alone does not define those canonical group/Lie objects; dleft=δ⁻¹ dright is the fixed convention.
Test Parabolic.modulus_not_det: For the Borel of GL_2, modulus ≠ ‖det‖: at diag(a,1) with ‖a‖ = 2 both equal 2, but at diag(1,d) with ‖d‖ = 2, modulus = 1/2 while ‖det‖ = 2.
Example omitted — RG2.1 supplies the actual rational parabolic, unipotent radical and adjoint action on its Lie algebra. The scalar expression alone does not define those canonical group/Lie objects; dleft=δ⁻¹ dright is the fixed convention.

### AdelicAlgebraicGroups:AA.2/modular-function-parabolic — Modular function of P(𝔸)
Hypotheses: F a number field; G a connected reductive group over F
Contract: For a parabolic P of a connected reductive G over a number field F, Mathlib's modular character (map (·p) μ_l = Δ(p)μ_l) on P(𝔸_F) is δ_P. With mutually inversion-normalized left and right Haar measures, dμ_l(p)=δ_P(p)⁻¹dμ_r(p). For a proper parabolic δ_P is nontrivial; for P=G it is 1.
Signature omitted — RG2.1 supplies the actual rational parabolic, unipotent radical and adjoint action on its Lie algebra. The scalar expression alone does not define those canonical group/Lie objects; dleft=δ⁻¹ dright is the fixed convention.

### AdelicAlgebraicGroups:AA.2/quotient-measure — Invariant measure on a coset space
Hypotheses: G second countable locally compact Hausdorff group; H closed subgroup; Δ_G restricted to H equals Δ_H; dg and dh are right Haar measures; invariance means the right G-action on H\G
Contract: Let G be a second countable locally compact group, H ≤ G a closed subgroup with Δ_G|_H = Δ_H, and dg, dh right Haar measures. There is a unique G-invariant Radon measure dġ on the right coset space H\G with ∫_G f(g) dg = ∫_{H\G} ∫_H f(hg) dh dġ for every f ∈ C_c(G).
Native carrier/API part: the named signatures below. Full structural specializations remain subject to their recorded conditions.
API QuotientMeasure.measure: The measure on H\G given dg, dh and the modular condition.
Native signature above.
API QuotientMeasure.integral_eq: ∫_G f dg = ∫_{H\G} ∫_H f(hg) dh dġ for f ∈ C_c(G).
Native signature above.
API QuotientMeasure.invariant: The measure is invariant under the right action of G.
Native signature above.
API QuotientMeasure.unique: Any G-invariant Radon measure on H\G is a scalar multiple.
Native signature above.
API QuotientMeasure.smul_left: Replacing dh by c • dh replaces dġ by c⁻¹ • dġ.
Native signature above.
Test QuotientMeasure.trivial_subgroup: For H=⊥ with its normalized counting measure, the quotient measure transported to G equals dg.
Native example above.
Test QuotientMeasure.z_in_r: For G = ℝ, H = ℤ with counting measure, ℤ\ℝ has volume 1.
Native example above.
Test QuotientMeasure.borel_no_invariant: For G=SL₂(ℝ) and H its upper triangular Borel, Δ_G|H≠Δ_H; the canonical homogeneous quotient ℙ¹(ℝ) has no nonzero invariant Radon measure.
Native example above.

### AdelicAlgebraicGroups:AA.2/quotient-integral-integrable — Weil's formula for integrable functions
Hypotheses: as in quotient-measure
Contract: In the setting of quotient-measure, for f ∈ L¹(G), the function h ↦ f(hg) is integrable on H for almost every Hg, the function Hg ↦ ∫_H f(hg) dh is integrable on H\G, and ∫_G f dg = ∫_{H\G} ∫_H f(hg) dh dġ.
Signature omitted — The native closed-subgroup right-Haar quotient interfaces are above. This adelic specialization or iterated-quotient contract additionally requires the canonical RG2.0 point topology, split/central quotient embeddings and their quotient-measure comparison; those maps are retained as exact mathematical contracts.

### AdelicAlgebraicGroups:AA.2/quotient-measure-transitivity — Quotient measures in stages
Hypotheses: G, H₂, H₁ as stated
Contract: For closed subgroups H₁ ≤ H₂ ≤ G satisfying the modular conditions, the quotient measure on H₁\G is the product of those on H₂\G and H₁\H₂: ∫_{H₁\G} f = ∫_{H₂\G} ∫_{H₁\H₂} f(hg) dh dg.
Signature omitted — The native closed-subgroup right-Haar quotient interfaces are above. This adelic specialization or iterated-quotient contract additionally requires the canonical RG2.0 point topology, split/central quotient embeddings and their quotient-measure comparison; those maps are retained as exact mathematical contracts.

### AdelicAlgebraicGroups:AA.2/discrete-quotient-fundamental-domain — Fundamental domains for rational points
Hypotheses: F a number field; G = Spec H an affine algebraic group over F, H finitely generated
Contract: G(F) acting on G(𝔸_F) (or G(𝔸_F)^1) by left translation admits a Borel fundamental domain; the quotient measure on G(F)\G(𝔸_F) equals the pushforward of the restriction of Haar measure to any measurable fundamental domain, and does not depend on the choice.
Signature omitted — The native closed-subgroup right-Haar quotient interfaces are above. This adelic specialization or iterated-quotient contract additionally requires the canonical RG2.0 point topology, split/central quotient embeddings and their quotient-measure comparison; those maps are retained as exact mathematical contracts.

### AdelicAlgebraicGroups:AA.2/automorphic-quotient-measure — The measure on the automorphic quotient
Hypotheses: F a number field; G a connected reductive group over F
Contract: For connected reductive G with a Haar measure dx on G(𝔸_F) and Lebesgue measure on a_G (normalized by the lattice dual to X*_F(G)), the measure on [G]^1 = G(F)\G(𝔸_F)^1 is the quotient (quotient-measure) of the measure on G(𝔸)^1 induced via split-centre-decomposition, and the measure on G(F)A_G(ℝ)^0\G(𝔸_F) is its transport by quotient-norm-one-comparison.
Signature omitted — RG2.0a/RG2.1 must supply Res_{F/ℚ}, its maximal split central torus and its canonical positive real embedding; the lattice-dual Lebesgue normalization and quotient topology then specify this comparison. Those group objects/embeddings have no pinned general interface.
API AutomorphicQuotient.measure: The measure on G(F)\G(𝔸)^1 attached to dx.
Signature omitted — RG2.0a/RG2.1 must supply Res_{F/ℚ}, its maximal split central torus and its canonical positive real embedding; the lattice-dual Lebesgue normalization and quotient topology then specify this comparison. Those group objects/embeddings have no pinned general interface.
API AutomorphicQuotient.measure_split: Its transport to G(F)A_G(ℝ)^0\G(𝔸).
Signature omitted — RG2.0a/RG2.1 must supply Res_{F/ℚ}, its maximal split central torus and its canonical positive real embedding; the lattice-dual Lebesgue normalization and quotient topology then specify this comparison. Those group objects/embeddings have no pinned general interface.
API AutomorphicQuotient.invariant: Right G(𝔸)^1-invariance.
Signature omitted — RG2.0a/RG2.1 must supply Res_{F/ℚ}, its maximal split central torus and its canonical positive real embedding; the lattice-dual Lebesgue normalization and quotient topology then specify this comparison. Those group objects/embeddings have no pinned general interface.
API AutomorphicQuotient.smul_haar: Scaling dx by c scales the quotient measure by c.
Signature omitted — RG2.0a/RG2.1 must supply Res_{F/ℚ}, its maximal split central torus and its canonical positive real embedding; the lattice-dual Lebesgue normalization and quotient topology then specify this comparison. Those group objects/embeddings have no pinned general interface.
Test AutomorphicQuotient.semisimple: For G without rational characters (for instance semisimple G), G(𝔸)^1 = G(𝔸), so the measure lives on G(F)\G(𝔸).
Example omitted — RG2.0a/RG2.1 must supply Res_{F/ℚ}, its maximal split central torus and its canonical positive real embedding; the lattice-dual Lebesgue normalization and quotient topology then specify this comparison. Those group objects/embeddings have no pinned general interface.
Test AutomorphicQuotient.gl1_rat: For GL_1 over ℚ with ideleHaar, the quotient ℚ^×\𝔸^1 ≃ ℤ̂^× has volume 1 (ideleHaar(ℤ̂^×) = 1).
Example omitted — RG2.0a/RG2.1 must supply Res_{F/ℚ}, its maximal split central torus and its canonical positive real embedding; the lattice-dual Lebesgue normalization and quotient topology then specify this comparison. Those group objects/embeddings have no pinned general interface.
Test AutomorphicQuotient.not_full_quotient: For GL_1, the norm-one quotient has finite volume while the split component ℝ_{>0} is not compact, so ℚ^×\𝔸^× has infinite volume.
Example omitted — RG2.0a/RG2.1 must supply Res_{F/ℚ}, its maximal split central torus and its canonical positive real embedding; the lattice-dual Lebesgue normalization and quotient topology then specify this comparison. Those group objects/embeddings have no pinned general interface.

### AdelicAlgebraicGroups:AA.2/central-character-l2 — L² space with a unitary central character
Hypotheses: F a number field; G a connected reductive group over F; 𝔛, ω as stated
Contract: Let 𝔛 ⊂ Z(𝔸_F) be a closed subgroup such that 𝔛Z(F) is closed, and ω a continuous unitary character of 𝔛 trivial on 𝔛 ∩ Z(F). L²(G(F)\G(𝔸_F), ω) is the Hilbert space of (classes of) measurable φ on G(𝔸) with φ(γ z g) = ω(z) φ(g) for γ ∈ G(F), z ∈ 𝔛, and ∫_{𝔛G(F)\G(𝔸)} |φ|² < ∞, with right translation R a unitary representation of G(𝔸) on which 𝔛 acts by ω.
Signature omitted — This contract needs canonical adelic centre/adjoint quotient data from RG2.1 and the associated measurable line, Borel section and completion-identification language recorded in the central analytic gap. It is not represented by an arbitrary Hilbert space, a topological line bundle or an assumed unitary representation.
API CentralCharL2: CentralCharL2 𝔛 ω, a Hilbert space.
Signature omitted — This contract needs canonical adelic centre/adjoint quotient data from RG2.1 and the associated measurable line, Borel section and completion-identification language recorded in the central analytic gap. It is not represented by an arbitrary Hilbert space, a topological line bundle or an assumed unitary representation.
API CentralCharL2.rightReg: The unitary representation of G(𝔸) by right translation.
Signature omitted — This contract needs canonical adelic centre/adjoint quotient data from RG2.1 and the associated measurable line, Borel section and completion-identification language recorded in the central analytic gap. It is not represented by an arbitrary Hilbert space, a topological line bundle or an assumed unitary representation.
API CentralCharL2.rightReg_central: rightReg z = ω z • id for z ∈ 𝔛.
Signature omitted — This contract needs canonical adelic centre/adjoint quotient data from RG2.1 and the associated measurable line, Borel section and completion-identification language recorded in the central analytic gap. It is not represented by an arbitrary Hilbert space, a topological line bundle or an assumed unitary representation.
API CentralCharL2.inner_def: ⟪φ, ψ⟫ = ∫_{𝔛G(F)\G(𝔸)} conj(φ) · ψ, conjugate-linear in the first argument as in Mathlib; the integrand is quotient-invariant.
Signature omitted — This contract needs canonical adelic centre/adjoint quotient data from RG2.1 and the associated measurable line, Borel section and completion-identification language recorded in the central analytic gap. It is not represented by an arbitrary Hilbert space, a topological line bundle or an assumed unitary representation.
API CentralCharL2.continuous_rightReg: rightReg is strongly continuous.
Signature omitted — This contract needs canonical adelic centre/adjoint quotient data from RG2.1 and the associated measurable line, Borel section and completion-identification language recorded in the central analytic gap. It is not represented by an arbitrary Hilbert space, a topological line bundle or an assumed unitary representation.
Test CentralCharL2.trivial_X: For 𝔛 = 1 it is L²(G(F)\G(𝔸)).
Example omitted — This contract needs canonical adelic centre/adjoint quotient data from RG2.1 and the associated measurable line, Borel section and completion-identification language recorded in the central analytic gap. It is not represented by an arbitrary Hilbert space, a topological line bundle or an assumed unitary representation.
Test CentralCharL2.gl1_dim: For GL_1 and 𝔛 = 𝔸^×, it is one-dimensional iff ω is trivial on F^×.
Example omitted — This contract needs canonical adelic centre/adjoint quotient data from RG2.1 and the associated measurable line, Borel section and completion-identification language recorded in the central analytic gap. It is not represented by an arbitrary Hilbert space, a topological line bundle or an assumed unitary representation.
Test CentralCharL2.nontrivial_on_rational: If ω is nontrivial on 𝔛 ∩ Z(F) the space is zero.
Example omitted — This contract needs canonical adelic centre/adjoint quotient data from RG2.1 and the associated measurable line, Borel section and completion-identification language recorded in the central analytic gap. It is not represented by an arbitrary Hilbert space, a topological line bundle or an assumed unitary representation.

### AdelicAlgebraicGroups:AA.2/central-quotient-change — Change of central quotient
Hypotheses: F a number field; G a connected reductive group over F; 𝔛′Z(F) and 𝔛Z(F) closed; their quotient compact; ω′ continuous and trivial on 𝔛′∩Z(F)
Contract: Let 𝔛′ ⊂ 𝔛 ⊂ Z(𝔸_F) be as in central-character-l2 with 𝔛′Z(F)\𝔛Z(F) compact, and ω′ a unitary character of 𝔛′. Then L²(G(F)\G(𝔸), ω′) is the Hilbert direct sum of the subspaces L²(G(F)\G(𝔸), ω) over the unitary characters ω of 𝔛 trivial on 𝔛 ∩ Z(F) and restricting to ω′, each being the ω-isotypic part for 𝔛. In particular L²(G(F)A_G(ℝ)^0\G(𝔸)) ≅ L²(G(F)\G(𝔸)^1) unitarily and G(𝔸)^1-equivariantly.
Signature omitted — This contract needs canonical adelic centre/adjoint quotient data from RG2.1 and the associated measurable line, Borel section and completion-identification language recorded in the central analytic gap. It is not represented by an arbitrary Hilbert space, a topological line bundle or an assumed unitary representation.

### AdelicAlgebraicGroups:AA.2/invariant-top-form — Invariant top-degree forms
Hypotheses: k a field; G smooth affine of dimension d
Contract: For a smooth affine algebraic group G of dimension d over a field k with coordinate Hopf algebra H, the space of left-invariant top-degree differential forms is ω_G = ∧^d_k (𝔪_ε/𝔪_ε²), the top exterior power of the cotangent space at the identity; it is a one-dimensional k-vector space, and a nonzero ω ∈ ω_G is a gauge form. Right translation by g acts on ω_G by det(Ad(g))⁻¹.
Native carrier/API part: the named signatures below. Full structural specializations remain subject to their recorded conditions.
API GaugeForm: GaugeForm is the top exterior-power line of the cotangent module (ker ε)/(ker ε)² at the identity; a gauge form is a nonzero vector in it.
Native signature above.
API GaugeForm.finrank_eq_one: For smooth G, finrank k (GaugeForm H) = 1.
Native signature above.
API GaugeForm.baseChange: GaugeForm commutes with base change k → k′.
Native signature above. The algebraic cotangent/exterior comparison is stated for actual Hopf scalar extension, using the imported Tau Ceti base-change instances.
API GaugeForm.rightTranslate: Right pullback by g acts on the left-invariant top-form line by det(Ad(g))⁻¹.
Native signature above. The cotangent transpose and top-exterior map are native, with determinant relation above. The comparison with invariant differential-form sections remains structural.
Test GaugeForm.gm: For G_m the cotangent space at 1 is one-dimensional, spanned by the class of T − 1, so GaugeForm is spanned by dT/T.
Native example above. The actual cotangent generator/span is native. The invariant differential section named dT/T additionally needs the invariant-section comparison; no analytic chart is assumed.
Test GaugeForm.trivial_group: For the trivial group (d = 0), GaugeForm = k.
Native example above.
Test GaugeForm.borel_not_biinvariant: For the upper triangular Borel of GL₂, right pullback by diag(a,d) multiplies a left-invariant gauge form by (a/d)⁻¹. For a/d≠1 it is not invariant.
Example omitted — The native identity-cotangent exterior-power line and scalar-extension signatures are above. The pinned adjoint action also gives the native algebraic rightTranslate signature. The remaining comparison with actual invariant differential-form sections needs the differential-form sheaf and its translation-pullback language; no arbitrary linear automorphism or chart is substituted.

### AdelicAlgebraicGroups:AA.2/local-form-measure — The Haar measure |ω|_v of a gauge form
Hypotheses: F_v a local field of characteristic 0; G smooth affine over F_v; ω a gauge form
Contract: For a smooth affine group G over a local field F_v of characteristic 0 with gauge form ω and the standard Haar measure on F_v (𝒪_v of volume 1; Lebesgue on ℝ; twice Lebesgue on ℂ), |ω|_v is the left Haar measure on G(F_v) given in any F_v-analytic chart φ : U → G(F_v), U ⊂ F_v^d open, by |f(x)|_v dx_1 ⋯ dx_d where φ^*ω = f dx_1 ∧ ⋯ ∧ dx_d.
Signature omitted — RG2.0/RG2.3 and the local analytic gap must supply the smooth local-point analytic charts, invariant differential extension and nonarchimedean change-of-variables language. No measure is chosen independently of the specified gauge form and additive normalization.
API GaugeForm.localMeasure: The Haar measure |ω|_v on G(F_v).
Signature omitted — RG2.0/RG2.3 and the local analytic gap must supply the smooth local-point analytic charts, invariant differential extension and nonarchimedean change-of-variables language. No measure is chosen independently of the specified gauge form and additive normalization.
API GaugeForm.localMeasure_isHaar: |ω|_v is a left Haar measure.
Signature omitted — RG2.0/RG2.3 and the local analytic gap must supply the smooth local-point analytic charts, invariant differential extension and nonarchimedean change-of-variables language. No measure is chosen independently of the specified gauge form and additive normalization.
API GaugeForm.localMeasure_smul: |c ω|_v = |c|_v • |ω|_v.
Signature omitted — RG2.0/RG2.3 and the local analytic gap must supply the smooth local-point analytic charts, invariant differential extension and nonarchimedean change-of-variables language. No measure is chosen independently of the specified gauge form and additive normalization.
API GaugeForm.localMeasure_rightTranslate: Measure.map (· * g) |ω|_v = |det Ad(g)|_v • |ω|_v. In contrast R_g^*ω = det Ad(g)⁻¹ • ω. This agrees with the pinned Mathlib convention map R_g μ = modularCharacter(g) • μ.
Signature omitted — RG2.0/RG2.3 and the local analytic gap must supply the smooth local-point analytic charts, invariant differential extension and nonarchimedean change-of-variables language. No measure is chosen independently of the specified gauge form and additive normalization.
Test GaugeForm.localMeasure_ga: For G_a with coordinate T, the image of localMeasure dT under x ↦ x(T) is the standard Haar measure of F_v (𝒪_v of volume 1).
Example omitted — RG2.0/RG2.3 and the local analytic gap must supply the smooth local-point analytic charts, invariant differential extension and nonarchimedean change-of-variables language. No measure is chosen independently of the specified gauge form and additive normalization.
Test GaugeForm.localMeasure_gm_units: For G_m at a finite place, localMeasure (dT/T) (𝒪_v^×) = 1 - q_v⁻¹.
Example omitted — RG2.0/RG2.3 and the local analytic gap must supply the smooth local-point analytic charts, invariant differential extension and nonarchimedean change-of-variables language. No measure is chosen independently of the specified gauge form and additive normalization.
Test GaugeForm.localMeasure_not_normalized: localMeasure (dT/T) on ℚ_p^× is not the normalized idele measure of AA.0/idele-haar: they differ by the factor 1 − p⁻¹ ≠ 1.
Example omitted — RG2.0/RG2.3 and the local analytic gap must supply the smooth local-point analytic charts, invariant differential extension and nonarchimedean change-of-variables language. No measure is chosen independently of the specified gauge form and additive normalization.

### AdelicAlgebraicGroups:AA.2/weil-volume-formula — Weil's volume formula for integral points
Hypotheses: 𝓗 smooth affine over 𝒪_v; ω extends to a generator over 𝒪_v
Contract: Let 𝓗 be a smooth affine group scheme of relative dimension d over 𝒪_v with residue field k_v of order q_v, and ω a gauge form of the generic fibre that extends to a generator of the invariant top forms of 𝓗. Then |ω|_v(𝓗(𝒪_v)) = #𝓗(k_v) · q_v^{-d}.
Signature omitted — RG2.0/RG2.3 and the local analytic gap must supply the smooth local-point analytic charts, invariant differential extension and nonarchimedean change-of-variables language. No measure is chosen independently of the specified gauge form and additive normalization.

### AdelicAlgebraicGroups:AA.2/convergence-factors — Convergence factors from the character module
Hypotheses: F a number field; G = Spec H an affine algebraic group over F, H finitely generated; G connected
Contract: Let X = X*(G_{F̄}) ⊗ ℂ with its continuous finite-image Galois action. For a finite place v, L_v(X, s) = det(1 - q_v^{-s} Frob_v | X^{I_v})⁻¹, and the convergence factors are λ_v = L_v(X, 1) at finite v and λ_v = 1 at infinite v. The partial Euler product L^S(X, s) = ∏_{v∉S} L_v(X, s) converges for Re s > 1, and ρ_G = lim_{s→1⁺} (s - 1)^r L^S(X, s) · ∏_{v∈S, v finite} L_v(X, s) with r = rank X*_F(G), whenever this limit exists and is nonzero.
Signature omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.
API Tamagawa.localFactor: localFactor v s := det(1 - q_v^{-s} Frob_v | X^{I_v})⁻¹.
Signature omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.
API Tamagawa.localFactor_trivial: If Gal acts trivially on X of rank r, localFactor v s = (1 - q_v^{-s})^{-r}.
Signature omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.
API Tamagawa.leadingCoeff: ρ_G, defined when the limit exists.
Signature omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.
API Tamagawa.leadingCoeff_split: For split characters of rank r, ρ_G = (dedekindZeta_residue F)^r.
Signature omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.
Test Tamagawa.localFactor_gm: For G_m, localFactor v 1 = (1 - q_v⁻¹)⁻¹.
Example omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.
Test Tamagawa.localFactor_semisimple: For semisimple G (for instance SL_n), X = 0 and localFactor v s = 1.
Example omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.
Test Tamagawa.localFactor_res_gm: For G = Res_{E/ℚ} G_m with E = ℚ(i), localFactor p 1 = (1 - p⁻¹)⁻¹(1 - χ₄(p)p⁻¹)⁻¹, not (1 - p⁻¹)⁻¹: the inert primes see the nontrivial character.
Example omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.

### AdelicAlgebraicGroups:AA.2/tamagawa-measure — Tamagawa measure
Hypotheses: F a number field; G = Spec H an affine algebraic group over F, H finitely generated; G connected; ρ_G exists (convergence-factors); ρ_G is finite and strictly positive; The product of corrected integral volumes is absolutely convergent and nonzero
Contract: For a smooth connected affine F-group of dimension d for which the Artin leading coefficient ρ_G exists and is positive and the corrected integral volumes converge absolutely, define τ_G=|d_F|⁻ᵈ/²ρ_G⁻¹ times the convergent Haar product of μ_v=λ_v|ω|_v. At finite v, λ_v=L_v(X*(G_Fbar)⊗ℂ,1), including ramified inertia invariants; at infinite v λ_v=1. Use the specified additive normalizations dx, 2dxdy and vol(O_v)=1. Connected reductive groups satisfy the separate convergence target. If the geometric character lattice is zero, λ_v=ρ_G=1, but the gauge integral masses still need the convergent-product construction.
Signature omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.
API Tamagawa.measure: Tamagawa.measure G : Measure (AdelicPoints H).
Signature omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.
API Tamagawa.measure_isHaar: Tamagawa.measure is a left Haar measure.
Signature omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.
API Tamagawa.measure_eq_product: On a product of finitely many local sets and almost all 𝓗(𝒪_v) it is |d_F|^{-d/2} ρ_G⁻¹ ∏ λ_v |ω|_v(C_v).
Signature omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.
API Tamagawa.measure_ga: For G_a it is |d_F|^{-1/2} • adeleHaar.
Signature omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.
API Tamagawa.measure_res: Compatibility with restriction of scalars (tamagawa-restriction-scalars).
Signature omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.
Test Tamagawa.measure_ga_selfdual: For G_a over ℚ, Tamagawa.measure (ℚ\𝔸 fundamental domain [0,1) × ℤ̂) = 1.
Example omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.
Test Tamagawa.measure_trivial: For the trivial group it is the Dirac measure of mass 1.
Example omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.
Test Tamagawa.measure_not_naive_product: For G_m the naive product ∏ |dT/T|_p is not a measure on 𝔸^×: the volumes 1 − p⁻¹ have product 0 because Σ_p 1/p diverges; Tamagawa.measure uses λ_v = (1 − q_v⁻¹)⁻¹ and ρ = Res ζ_F.
Example omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.

### AdelicAlgebraicGroups:AA.2/tamagawa-independent-of-form — Independence of the gauge form
Hypotheses: F a number field; G = Spec H an affine algebraic group over F, H finitely generated
Contract: τ_G does not depend on the gauge form ω: replacing ω by cω with c ∈ F^× multiplies each |ω|_v by |c|_v, and ∏_v |c|_v = 1.
Signature omitted — The native closed-subgroup right-Haar quotient interfaces are above. This adelic specialization or iterated-quotient contract additionally requires the canonical RG2.0 point topology, split/central quotient embeddings and their quotient-measure comparison; those maps are retained as exact mathematical contracts.

### AdelicAlgebraicGroups:AA.2/tamagawa-convergence — Absolute convergence of the corrected volumes
Hypotheses: F a number field; G a connected reductive group over F; 𝓗 reductive over 𝒪_{F,S}
Contract: For connected reductive G with an integral model 𝓗 smooth with connected reductive fibres away from S, the product ∏_{v∉S} λ_v #𝓗(k_v) q_v^{-d} converges absolutely; for semisimple G the factors are 1 + O(q_v^{-2}).
Signature omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.

### AdelicAlgebraicGroups:AA.2/tamagawa-number — Tamagawa number
Hypotheses: F a number field; G a connected reductive group over F
Contract: For connected reductive G, τ(G) = vol(G(F)\G(𝔸_F)^1) for the measure on G(𝔸)^1 induced by τ_G and the Lebesgue measure on a_G normalized by the lattice Hom(X*_F(G), ℤ) (through split-centre-decomposition and log-height-split-centre-iso), with counting measure on G(F), as an element of [0, ∞]. Its finiteness is AA.3/tamagawa-number-finite.
Signature omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.
API Tamagawa.number: Tamagawa.number G : ℝ≥0∞.
Signature omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.
API Tamagawa.number_pos: Tamagawa.number G > 0.
Signature omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.
API Tamagawa.number_res: Tamagawa.number (Res_{E/F} G) = Tamagawa.number G.
Signature omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.
Test Tamagawa.number_trivial: For the trivial group τ = 1.
Example omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.
Test Tamagawa.number_gm_statement: τ(G_m) = 1 over any number field (statement; proof in AutomorphicLFunctionsAndLocalFactors:AL.1 via Tate's thesis).
Example omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.
Test Tamagawa.number_not_full_quotient: vol(G_m(F)\G_m(𝔸)) = ∞ because the split component ℝ_{>0} is not compact; τ uses the norm-one quotient.
Example omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.

### AdelicAlgebraicGroups:AA.2/tamagawa-restriction-scalars — Tamagawa measures and restriction of scalars
Hypotheses: E/F finite extensions of number fields; G_E connected reductive; The Artin leading coefficients and Haar products have the existence/convergence proved in the named inputs.
Contract: Let E/F be a finite extension of number fields and G_E a connected reductive E-group of dimension d. The canonical topological group isomorphism Res_{E/F}G_E(𝔸_F)→G_E(𝔸_E), together with the induced character-space map and its integral-lattice Lebesgue normalization, transports Tamagawa measures and norm-one quotient measures. In particular the Tamagawa numbers agree. The extension to connected nonreductive groups requires the Levi/unipotent integration input recorded separately.
Signature omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.

### AdelicAlgebraicGroups:AA.2/compact-open-volume — Volumes of commensurable compact open subgroups
Hypotheses: G(𝔸_{F,f}) as in AA.1
Contract: For compact open subgroups U, U′ of G(𝔸_{F,f}) (or of G(F_v)) and a left Haar measure μ, μ(U)/μ(U′) = [U : U ∩ U′]/[U′ : U ∩ U′]; in particular all volumes of compact open subgroups are positive rational multiples of one of them.
Signature omitted — The native closed-subgroup right-Haar quotient interfaces are above. This adelic specialization or iterated-quotient contract additionally requires the canonical RG2.0 point topology, split/central quotient embeddings and their quotient-measure comparison; those maps are retained as exact mathematical contracts.

### AdelicAlgebraicGroups:AA.3/minimal-parabolic-data — Minimal rational parabolics and standard parabolics
Hypotheses: F a number field; G a connected reductive group over F
Contract: Fix a minimal F-parabolic P_0 ⊂ G with Levi decomposition P_0 = M_0 N_0, M_0 the centralizer of a maximal F-split torus S_0. A standard parabolic is an F-parabolic P ⊇ P_0; it has a unique Levi component M_P ⊇ M_0, unipotent radical N_P, and split component A_P = A_{M_P}. The standard parabolics are finite in number, correspond to subsets of the simple relative roots Δ_0, and every F-parabolic is G(F)-conjugate to exactly one of them.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API Reduction.MinimalParabolic: Structure: P_0, M_0, N_0, S_0 with the Levi decomposition.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API Reduction.StandardParabolic: The finite type of standard parabolics P ⊇ P_0, with M_P, N_P, A_P.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API Reduction.standardParabolic_equiv_subsets: StandardParabolic ≃ Finset Δ_0.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API Reduction.exists_unique_standard_conj: Every F-parabolic is G(F)-conjugate to a unique standard parabolic.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API Reduction.StandardParabolic.le_iff: P ≤ P′ iff the corresponding subsets satisfy Δ_0^P ⊆ Δ_0^{P′} (with the convention that the subset lists the simple roots of M_P).
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
Test Reduction.standardParabolic_gl3_card: For GL_3 there are 4 standard parabolics.
Example omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
Test Reduction.standardParabolic_anisotropic: If G is F-anisotropic the only standard parabolic is G.
Example omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
Test Reduction.standardParabolic_not_all_parabolics: For GL_2 over ℚ the lower triangular Borel is a parabolic that is not standard; it is conjugate to the standard one by the Weyl element.
Example omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/relative-chamber — Relative chambers and the spaces a_P
Hypotheses: F a number field; G a connected reductive group over F
Contract: For standard P, a_P = a_{M_P} (AA.2/real-character-space), with a_0 = a_{P_0}. For P_1 ⊆ P_2 there are split exact sequences giving a_{P_1} = a_{P_2} ⊕ a_{P_1}^{P_2} and dually. The roots Φ_P of (P, A_P) lie in (a_P^G)^*, ρ_P = (1/2) ∑_{α∈Φ_P} (dim 𝔫_α) α, the simple roots Δ_P are the restrictions of Δ_0 ∖ Δ_0^P, and the positive chamber is a_P^+ = {H ∈ a_P : α(H) > 0 for α ∈ Δ_P}.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API Reduction.aP: The real vector space a_P for a standard parabolic.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API Reduction.aPProjection: For P₁⊆P₂ the canonical linear projection a_{P₁}→a_{P₂}, dual to restriction of rational characters; its kernel is the relative space a_{P₁}^{P₂}.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API Reduction.aP_decomp: For P₁≤P₂, restriction of rational characters induces the canonical projection π:a_{P₁}→a_{P₂}; a_{P₁}≃ₗ a_{P₂}×ker π, with the splitting induced by the split centres. The kernel is 0 for P₁=P₂.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API Reduction.rho: ρ_P ∈ (a_P^G)^*.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API Reduction.simpleRoots: Δ_P ⊂ (a_P^G)^*, a basis.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API Reduction.positiveChamber: a_P^+ = {H | ∀ α ∈ Δ_P, 0 < α H}.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
Test Reduction.rho_gl2: For the Borel of GL_2, ρ = (1/2)(e_1 - e_2).
Example omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
Test Reduction.aP_top: For P = G and G without rational characters, a_P = 0; in general a_G^G = 0.
Example omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
Test Reduction.positiveChamber_not_cone_of_all_roots: For GL_3, a_0^+ is cut out by the two simple roots; positivity of e_1 - e_3 alone does not imply membership.
Example omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/good-maximal-compact — Admissible maximal compact subgroup of G(𝔸)
Hypotheses: F a number field; G a connected reductive group over F
Contract: A maximal compact subgroup K = ∏_v K_v of G(𝔸_F) is admissible relative to M_0 if K_v = 𝓗(𝒪_v) is hyperspecial for all but finitely many v, each K_v is a special maximal compact subgroup in good position relative to M_0 at finite v and a maximal compact subgroup of G(F_v) at archimedean v, and G(F_v) = P_0(F_v) K_v for every v.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API Reduction.AdmissibleCompact: Structure: the local K_v with the hyperspecial, special and Iwasawa conditions.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API Reduction.AdmissibleCompact.toSubgroup: The compact subgroup ∏_v K_v of G(𝔸).
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API Reduction.AdmissibleCompact.isCompact: toSubgroup is compact.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API Reduction.AdmissibleCompact.exists: An admissible K exists for every minimal parabolic data.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
Test Reduction.AdmissibleCompact.gln: For GL_n over ℚ, O(n) × ∏_p GL_n(ℤ_p) is admissible.
Example omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
Test Reduction.AdmissibleCompact.anisotropic: For F-anisotropic G the Iwasawa condition is vacuous (P_0 = G).
Example omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
Test Reduction.AdmissibleCompact.not_all_places_iwahori: The Iwahori subgroup (upper triangular modulo p) is a proper subgroup of GL_2(ℤ_p), so a product of Iwahori subgroups is not maximal compact and not admissible.
Example omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/adelic-iwasawa — Adelic Iwasawa decomposition and integration formula
Hypotheses: F a number field; G a connected reductive group over F; K admissible
Contract: For admissible K and standard P, G(𝔸_F) = P(𝔸_F)K = N_P(𝔸)M_P(𝔸)^1 A_P(ℝ)^0 K, and for f ∈ L¹(G(𝔸)), ∫_{G(𝔸)} f(x) dx = ∫_K ∫_{M_P(𝔸)} ∫_{N_P(𝔸)} f(nmk) δ_P(m)^{-1} dn dm dk for compatible Haar measures.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/H-P — The map H_P
Hypotheses: F a number field; G a connected reductive group over F; K admissible
Contract: For standard P and admissible K, H_P : G(𝔸_F) → a_P is H_P(nmk) = H_{M_P}(m) for n ∈ N_P(𝔸), m ∈ M_P(𝔸), k ∈ K; write H_0 = H_{P_0}.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API Reduction.HP: Reduction.HP P : AdelicPoints H → a_P.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API Reduction.HP_nmk: HP (n * m * k) = logHeight_{M_P} m.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API Reduction.HP_left_P: HP (p * x) = HP p + HP x for p ∈ P(𝔸).
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API Reduction.continuous_HP: HP is continuous.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API Reduction.HP_rational: HP (diagonal γ * x) = HP x for γ ∈ P(F).
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
Test Reduction.HP_gl2_borel: For x in P(𝔸), the pairing of HP x with each rational character χ of P is log ‖χ(y)‖ for a point y of P; for GL_2 and the Borel, HP (diag(a, d)) = (log ‖a‖, log ‖d‖).
Example omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
Test Reduction.HP_top: For P = G, HP = logHeight.
Example omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
Test Reduction.HP_not_homomorphism: HP is not a homomorphism on G(𝔸): for GL_2, HP(w) = 0 for the Weyl element w ∈ K, but HP of a product of upper and lower unipotents can be nonzero.
Example omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/adelic-siegel-set — Adelic Siegel sets
Hypotheses: F a number field; G a connected reductive group over F; K admissible
Contract: For T_1 ∈ a_0 and a compact subset ω ⊂ N_0(𝔸)M_0(𝔸)^1, the Siegel set is 𝔖(T_1, ω) = {p a k : p ∈ ω, a ∈ A_0(ℝ)^0, k ∈ K, β(H_0(a) - T_1) > 0 for all β ∈ Δ_0}.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API Reduction.siegelSet: Reduction.siegelSet T₁ ω : Set (AdelicPoints H).
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API Reduction.mem_siegelSet: x ∈ siegelSet T₁ ω iff x = p a k with the stated conditions.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API Reduction.siegelSet_mono: siegelSet is antitone in T₁ (coordinatewise for Δ_0) and monotone in ω.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API Reduction.siegelSet_mul_K: siegelSet T₁ ω * K = siegelSet T₁ ω.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API Reduction.siegelSet_center: siegelSet is stable under A_G(ℝ)^0.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
Test Reduction.siegelSet_sl2: For SL_2/ℚ, some Siegel set with compact ω meets every SL_2(ℚ)-orbit in SL_2(𝔸) (at ∞ it contains the standard fundamental domain of SL_2(ℤ)).
Example omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
Test Reduction.siegelSet_anisotropic: For F-anisotropic G, siegelSet T₁ ω = ω * K.
Example omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
Test Reduction.siegelSet_not_fundamental_domain: For SL₂/ℚ choose the finite factor SL₂(ℤ̂), real N-window [−1,1], and A-parameter y≥1/2. Both the identity and n(1) lie in this Siegel set; their ratio is a nontrivial rational element. Thus this specified Siegel set cannot be a fundamental domain with disjoint rational translates.
Example omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/siegel-covering-adelic — Siegel sets cover G(F)\G(𝔸)
Hypotheses: F a number field; G a connected reductive group over F; K admissible
Contract: There are T_1 and ω such that G(𝔸_F) = G(F) 𝔖(T_1, ω) (Borel–Harish-Chandra).
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/siegel-finiteness-adelic — Siegel property
Hypotheses: F a number field; G a connected reductive group over F; K admissible
Contract: For a Siegel set 𝔖 = 𝔖(T_1, ω), the set {γ ∈ G(F) : γ𝔖 ∩ 𝔖 ≠ ∅} is finite.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/class-number-finite — Finiteness of class numbers
Hypotheses: F a number field; G a linear algebraic group over F; U compact open
Contract: For every linear algebraic group G over F and every compact open subgroup U ⊂ G(𝔸_{F,f}), the double coset space G(F)\G(𝔸_{F,f})/U is finite; equivalently G(𝔸_F) = ⋃_{i=1}^h G(F) x_i G(F_∞) U for finitely many x_i.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/unipotent-class-number-one — Unipotent groups have class number one
Hypotheses: N unipotent over F
Contract: For a unipotent group N over F and compact open U ⊂ N(𝔸_f), N(𝔸_f) = N(F)U.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/semidirect-class-number — Class numbers of semidirect products
Hypotheses: G = H ⋉ N
Contract: If G = H ⋉ N over F with N unipotent, then every double coset G(F)\G(𝔸_f)/U meets H(𝔸_f), and G(F)\G(𝔸_f)/U is finite if H(F)\H(𝔸_f)/(U ∩ H(𝔸_f)) is finite for all compact open U.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/arithmetic-subgroup-of-level — Arithmetic subgroups attached to a level
Hypotheses: F a number field; G a connected reductive group over F
Contract: For compact open U ⊂ G(𝔸_{F,f}) and x ∈ G(𝔸_{F,f}), Γ_{x,U} = G(F) ∩ x U x⁻¹, viewed in G(F_∞) through the diagonal. It is a discrete subgroup of G(F_∞); for x, x′ and U, U′ the groups Γ_{x,U} and Γ_{x′,U′} are commensurable after conjugating by a rational element when x′ ∈ G(F) x U.
Signature omitted — RG2.0 must supply the canonical real/finite point topologies and actual restricted-product embeddings; the arithmetic subgroup and quotient maps use those specific structures. No abstract subgroup of an arbitrary topological group replaces them.
API Reduction.levelArithmetic: Reduction.levelArithmetic x U : Subgroup (G(F)) := G(F) ∩ x U x⁻¹.
Signature omitted — RG2.0 must supply the canonical real/finite point topologies and actual restricted-product embeddings; the arithmetic subgroup and quotient maps use those specific structures. No abstract subgroup of an arbitrary topological group replaces them.
API Reduction.levelArithmetic_discrete: Its image in G(F_∞) is discrete.
Signature omitted — RG2.0 must supply the canonical real/finite point topologies and actual restricted-product embeddings; the arithmetic subgroup and quotient maps use those specific structures. No abstract subgroup of an arbitrary topological group replaces them.
API Reduction.levelArithmetic_conj: levelArithmetic (γ x u) U = γ (levelArithmetic x U) γ⁻¹ for γ ∈ G(F), u ∈ U.
Signature omitted — RG2.0 must supply the canonical real/finite point topologies and actual restricted-product embeddings; the arithmetic subgroup and quotient maps use those specific structures. No abstract subgroup of an arbitrary topological group replaces them.
API Reduction.levelArithmetic_commensurable: For U′ ≤ U, levelArithmetic x U′ has finite index in levelArithmetic x U.
Signature omitted — RG2.0 must supply the canonical real/finite point topologies and actual restricted-product embeddings; the arithmetic subgroup and quotient maps use those specific structures. No abstract subgroup of an arbitrary topological group replaces them.
Test Reduction.levelArithmetic_gl2: For GL_2/ℚ, levelArithmetic 1 GL_2(ℤ̂) = GL_2(ℤ).
Example omitted — RG2.0 must supply the canonical real/finite point topologies and actual restricted-product embeddings; the arithmetic subgroup and quotient maps use those specific structures. No abstract subgroup of an arbitrary topological group replaces them.
Test Reduction.levelArithmetic_trivial_group: For the trivial group it is trivial.
Example omitted — RG2.0 must supply the canonical real/finite point topologies and actual restricted-product embeddings; the arithmetic subgroup and quotient maps use those specific structures. No abstract subgroup of an arbitrary topological group replaces them.
Test Reduction.levelArithmetic_not_conj_invariant: levelArithmetic x U depends on x and not only on U: for GL_2/ℚ and x = diag(p,1) at the place p, levelArithmetic x GL_2(ℤ̂) = diag(p,1) GL_2(ℤ) diag(p,1)⁻¹ ≠ GL_2(ℤ).
Example omitted — RG2.0 must supply the canonical real/finite point topologies and actual restricted-product embeddings; the arithmetic subgroup and quotient maps use those specific structures. No abstract subgroup of an arbitrary topological group replaces them.

### AdelicAlgebraicGroups:AA.3/component-decomposition — Component decomposition of a level quotient
Hypotheses: F a number field; G a connected reductive group over F; U compact open
Contract: Let x_1, …, x_h represent G(F)\G(𝔸_{F,f})/U (class-number-finite). Then [g_∞] ↦ [(g_∞, x_i)] induces a homeomorphism ⊔_i Γ_{x_i,U}\G(F_∞) ≃ G(F)\G(𝔸_F)/U, equivariant for the right action of G(F_∞); the archimedean factor and the split centre are retained, and the finite set G(F)\G(𝔸_f)/U is in general not the whole quotient.
Signature omitted — RG2.0 must supply the canonical real/finite point topologies and actual restricted-product embeddings; the arithmetic subgroup and quotient maps use those specific structures. No abstract subgroup of an arbitrary topological group replaces them.

### AdelicAlgebraicGroups:AA.3/finite-volume — Finite volume of G(F)\G(𝔸)^1
Hypotheses: F a number field; G connected
Contract: For a connected reductive group G/F, G(F)\G(𝔸_F)^1 has finite positive volume for the invariant quotient measure. For a connected nonreductive group the same conclusion follows after supplying its characteristic-zero Levi decomposition, compact unipotent adelic quotient and the associated product integration.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/tamagawa-number-finite — Tamagawa numbers are finite
Hypotheses: F a number field; G a connected reductive group over F
Contract: For connected reductive G, the Tamagawa number τ(G) of AA.2/tamagawa-number is finite and positive.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/finite-volume-criterion — When G(F)\G(𝔸) has finite volume
Hypotheses: F a number field; G linear algebraic over F
Contract: For a linear algebraic group G over F, G(F)\G(𝔸_F) carries a G(𝔸)-invariant measure of finite volume iff X*_F(G°) = 0.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/compactness-anisotropic — Anisotropic groups have compact quotients
Hypotheses: F a number field; G a connected reductive group over F; G^der F-anisotropic
Contract: For connected reductive G over F whose derived group is F-anisotropic (equivalently, G has no proper F-parabolic subgroup), G(F)\G(𝔸_F)^1 is compact.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/compactness-isotropic — Isotropic groups have noncompact quotients
Hypotheses: F a number field; G a connected reductive group over F
Contract: For connected reductive G over F with a proper F-parabolic subgroup, G(F)\G(𝔸_F)^1 is not compact. Precisely: G(F)\G(𝔸)^1 is compact iff G(F) has no nontrivial unipotent element iff G^der is F-anisotropic.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/cocompact-no-unipotents — Cocompact arithmetic groups contain no unipotents
Hypotheses: G connected semisimple over ℚ; U compact open
Contract: Let G be connected semisimple over ℚ and Γ = G(ℚ) ∩ U for a compact open U ⊂ G(𝔸_f). If Γ\G(ℝ) is compact then Γ contains no nontrivial unipotent element.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/s-arithmetic-lattice — S-arithmetic subgroups are lattices
Hypotheses: G connected semisimple over F; S finite ⊇ archimedean places
Contract: Let G be connected semisimple over F, S a finite set of places containing the archimedean ones, and U^S ⊂ G(𝔸_F^S) compact open. Then Γ_S = G(F) ∩ G(F_S)U^S is a lattice in G(F_S) = ∏_{v∈S} G(F_v), cocompact iff G is F-anisotropic.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/adelic-height — Height functions on G(𝔸)
Hypotheses: F a number field; G a connected reductive group over F; r is an algebraic faithful representation chosen with the stated dual/properness condition; arbitrary abstract faithful point representations do not suffice
Contract: Choose a faithful F-algebraic representation r : G → GL_m containing a representation and its dual (and, if needed, a trivial summand), so the resulting height is proper and each local norm is at least 1. Define ‖x‖_r = product over v of ‖r(x)_v‖_v, using the entrywise maximum of normalized absolute values at finite v and the Hilbert–Schmidt norm raised to the archimedean multiplicity [F_v:ℝ] at infinity. The height is submultiplicative, has compact sublevel sets, and satisfies polynomial inverse and rational-point counting bounds, subject to the recorded proper-height and counting inputs.
Signature omitted — The actual algebraic coordinate representation with its dual, canonical normalized local absolute values and RG2.0 evaluation topology are required to state this adelic height. The height-counting gap supplies ideal/unit/lattice estimates. An arbitrary proper function or norm without inverse coordinates would not state the contract.
API Reduction.height: Reduction.height r : AdelicPoints H → ℝ.
Signature omitted — The actual algebraic coordinate representation with its dual, canonical normalized local absolute values and RG2.0 evaluation topology are required to state this adelic height. The height-counting gap supplies ideal/unit/lattice estimates. An arbitrary proper function or norm without inverse coordinates would not state the contract.
API Reduction.height_mul_le: height (x * y) ≤ height x * height y.
Signature omitted — The actual algebraic coordinate representation with its dual, canonical normalized local absolute values and RG2.0 evaluation topology are required to state this adelic height. The height-counting gap supplies ideal/unit/lattice estimates. An arbitrary proper function or norm without inverse coordinates would not state the contract.
API Reduction.height_inv_le: ∃ C N, height x⁻¹ ≤ C * height x ^ N.
Signature omitted — The actual algebraic coordinate representation with its dual, canonical normalized local absolute values and RG2.0 evaluation topology are required to state this adelic height. The height-counting gap supplies ideal/unit/lattice estimates. An arbitrary proper function or norm without inverse coordinates would not state the contract.
API Reduction.isCompact_height_le: {x | height x ≤ t} is compact for a suitable r.
Signature omitted — The actual algebraic coordinate representation with its dual, canonical normalized local absolute values and RG2.0 evaluation topology are required to state this adelic height. The height-counting gap supplies ideal/unit/lattice estimates. An arbitrary proper function or norm without inverse coordinates would not state the contract.
API Reduction.card_rational_height_le: #{γ ∈ G(F) | height γ ≤ t} ≤ C t^N.
Signature omitted — The actual algebraic coordinate representation with its dual, canonical normalized local absolute values and RG2.0 evaluation topology are required to state this adelic height. The height-counting gap supplies ideal/unit/lattice estimates. An arbitrary proper function or norm without inverse coordinates would not state the contract.
Test Reduction.height_gl1: For GL₁/ℚ with r(x)=diag(x,x⁻¹), height x⁻¹=height x; the real local factor is sqrt(x²+x⁻²), and each finite factor is max(|x|_p,|x⁻¹|_p).
Example omitted — The actual algebraic coordinate representation with its dual, canonical normalized local absolute values and RG2.0 evaluation topology are required to state this adelic height. The height-counting gap supplies ideal/unit/lattice estimates. An arbitrary proper function or norm without inverse coordinates would not state the contract.
Test Reduction.height_one: With Hilbert–Schmidt norms and normalized infinite-place exponents, height 1 = m^([F:ℚ]/2). In particular over ℚ and m=2 this is sqrt 2, not 1.
Example omitted — The actual algebraic coordinate representation with its dual, canonical normalized local absolute values and RG2.0 evaluation topology are required to state this adelic height. The height-counting gap supplies ideal/unit/lattice estimates. An arbitrary proper function or norm without inverse coordinates would not state the contract.
Test Reduction.height_not_finite_only: If G(F_∞) is noncompact the height is unbounded on G(𝔸); a height built from finite places only would be bounded on G(F_∞) and fail the compactness of height balls.
Example omitted — The actual algebraic coordinate representation with its dual, canonical normalized local absolute values and RG2.0 evaluation topology are required to state this adelic height. The height-counting gap supplies ideal/unit/lattice estimates. An arbitrary proper function or norm without inverse coordinates would not state the contract.

### AdelicAlgebraicGroups:AA.3/height-representation-comparison — Comparison of heights
Hypotheses: F a number field; G a connected reductive group over F; Both representations are algebraic and define proper heights controlling their inverses
Contract: For two proper F-algebraic height representations r,r′ satisfying adelic-height, there are C,N>0 with ‖x‖_{r′}≤C‖x‖_r^N for every x∈G(𝔸_F), and conversely. Multiplication on either side by a fixed compact subgroup changes these heights by bounded factors.
Signature omitted — The actual algebraic coordinate representation with its dual, canonical normalized local absolute values and RG2.0 evaluation topology are required to state this adelic height. The height-counting gap supplies ideal/unit/lattice estimates. An arbitrary proper function or norm without inverse coordinates would not state the contract.

### AdelicAlgebraicGroups:AA.3/height-siegel-estimate — Heights on Siegel sets
Hypotheses: F a number field; G a connected reductive group over F
Contract: On a Siegel set 𝔖(T_1, ω) there are c, C > 0 such that for x = pak, c^{-1} e^{c‖H_0(a)‖} ≤ ‖x‖ ≤ C e^{C‖H_0(a)‖} (any norm on a_0); in particular log‖x‖ and ‖H_0(x)‖ are comparable on 𝔖 ∩ G(𝔸)^1 up to constants.
Signature omitted — The actual algebraic coordinate representation with its dual, canonical normalized local absolute values and RG2.0 evaluation topology are required to state this adelic height. The height-counting gap supplies ideal/unit/lattice estimates. An arbitrary proper function or norm without inverse coordinates would not state the contract.

### AdelicAlgebraicGroups:AA.3/horospherical-decomposition — Horospherical decomposition for a fixed maximal compact
Hypotheses: G connected semisimple over ℚ; K a maximal compact subgroup of G(ℝ)^+; 𝐏 a ℚ-parabolic
Contract: Let G be connected semisimple over ℚ, G = G(ℝ)^+, K ⊂ G maximal compact with Cartan involution θ, and 𝐏 a ℚ-parabolic with unipotent radical 𝐍_P and Levi quotient 𝐋_P. With S_P the split centre of 𝐋_P, A_P = S_P(ℝ)^0 and M_P the real points of ⋂_{χ∈X*(𝐋_P)} ker χ², there is a unique θ-stable real Levi lift of (𝐋_P)_ℝ, giving P = N_P A_P M_P and the diffeomorphism N_P × A_P × (M_P K) → G. Left multiplication by p_0 = n_0 a_0 m_0 acts by (n, a, m) ↦ (n_0 · (a_0m_0) n (a_0m_0)⁻¹, a_0 a, m_0 m).
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API RealSiegel.HoroData: Structure: N_P, A_P, M_P K, the homeomorphism horoDecomp : G ≃ₜ N_P × A_P × (M_P K) for fixed K and 𝐏, and the simple roots.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API RealSiegel.horoDecomp_left_mul: The left action formula of p_0 = n_0 a_0 m_0.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API RealSiegel.horoDecomp_conj: Conjugation by g ∈ G(ℚ) carries the decomposition for (𝐏, K) to that for (g𝐏g⁻¹, gKg⁻¹).
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API RealSiegel.horoDecomp_change_K: For K′=uKu⁻¹ with u∈N_P and the Levi lifts identified by conjugation by u, the A-coordinate satisfies a_{K′}(g)=a_K(gu), equivalently H_{P,K′}(g)=H_{P,K}(gu). It need not equal a_K(g).
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
Test RealSiegel.horoDecomp_sl2: For SL_2(ℝ): (x, a, ±k) ↦ n(x) diag(√a, 1/√a)(±k).
Example omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
Test RealSiegel.horoDecomp_trivial_parabolic: For 𝐏 = 𝐆, N_P = 1, A_P = 1 and the decomposition is G = M_G K.
Example omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
Test RealSiegel.horoDecomp_not_right_action: The formula (n_0a_0m_0)(n,a,m) describes left multiplication; read as a right action it fails already for SL_2 with n_0 ≠ 1.
Example omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
Test RealSiegel.horoDecomp_change_K_sl2: In SL₂(ℝ), take u=n(1), k=[[0,−1],[1,0]]∈SO(2). The upper-half-plane height of ki is 1 whereas that of k(1+i) is 1/2. Thus a_K(k)=1 but a_{uKu⁻¹}(k)=1/2 under the parameter diag(√a,1/√a).
Example omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/positive-root-coordinates — Simple roots of P and truncated tori
Hypotheses: as in horospherical-decomposition
Contract: Φ(A_P, N_P) is the set of characters of A_P on Lie N_P; Δ(A_P, N_P) = {α_1, …, α_r} is the unique set of dim A_P linearly independent roots of which every root is a nonnegative integral combination (the simple roots). For t > 0, A_{P,t} = {a ∈ A_P : a^α > t for all α ∈ Δ(A_P, N_P)}, and e_P(a) = (a^{-α_1}, …, a^{-α_r}) is a semialgebraic diffeomorphism A_P ≃ (ℝ_{>0})^r with e_P(A_{P,t}) = (0, 1/t)^r.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API RealSiegel.HoroData.simpleRoots: Δ(A_P, N_P) as a Finset of positive characters of A_P.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API RealSiegel.truncatedTorus: A_{P,t}.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API RealSiegel.cornerCoord: e_P : A_P ≃ (Fin r → ℝ_{>0}).
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API RealSiegel.cornerCoord_truncated: e_P '' A_{P,t} = Set.pi univ (fun _ => Ioo 0 t⁻¹).
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
Test RealSiegel.simpleRoots_sl2: For SL_2 and the Borel, Δ = {α} with diag(a, a⁻¹)^α = a².
Example omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
Test RealSiegel.simpleRoots_minimal_rank: For a maximal parabolic of SL_n, Δ has one element.
Example omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
Test RealSiegel.simpleRoots_not_all_roots: For the Borel of SL_3 the root α_1 + α_2 is positive but not simple; truncating by it alone does not give A_{P,t}.
Example omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/real-siegel-set — Siegel set for a fixed maximal compact
Hypotheses: as in horospherical-decomposition; K fixed
Contract: For a ℚ-parabolic 𝐏, a maximal compact K ⊂ G = G(ℝ)^+, t > 0 and bounded (relatively compact open semialgebraic) U ⊂ N_P, W ⊂ M_P K, the Siegel set associated to 𝐏 and K is 𝔖 = U × A_{P,t} × W ⊂ G in horospherical coordinates. For a connected compact M ⊂ K, a Siegel set of G/M associated to K is the image of such a set; K is fixed once and for all (BKT Definition 2.5 as corrected by the 2023 erratum).
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API RealSiegel.siegelSet: RealSiegel.siegelSet 𝐏 K U t W : Set G.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API RealSiegel.mem_siegelSet: Membership in horospherical coordinates.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API RealSiegel.siegelSet_mono: Monotone in U, W and antitone in t.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
API RealSiegel.siegelSet_quotient: The image in G/M.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
Test RealSiegel.siegelSet_sl2: For SL_2 and K = SO(2), the image in ℍ is {x + iy : x ∈ U, y > t}.
Example omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
Test RealSiegel.siegelSet_anisotropic: For the improper parabolic P=G the unipotent and relative-root factors are trivial and a Siegel set is the bounded W in the semisimple fixed-K scope. P=G is always allowed; anisotropy means there are no proper rational parabolics.
Example omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.
Test RealSiegel.siegelSet_needs_fixed_K: Siegel sets for different K are not interchangeable: for SL_2, P upper triangular and x ≠ i in ℍ, a Siegel set B_N B_A K_x is not contained in finitely many SL_2(ℤ)-translates of Siegel sets for K_i (erratum §1.6.1).
Example omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/real-siegel-translation — Translating and conjugating Siegel sets
Hypotheses: as in real-siegel-set
Contract: For g ∈ G(ℚ), g𝔖g⁻¹ is a Siegel set associated to g𝐏g⁻¹ and gKg⁻¹. For g ∈ G, 𝔖g is a Siegel set for 𝐏 and g⁻¹Kg, and for g ∈ 𝐏(ℝ), g𝔖 is a Siegel set for 𝐏 and K (exactly, for the sets U a A_{>0} W of the erratum; for Definition 2.3's A_{P,t}, up to containment). Consequently, for γ ∈ 𝐆(ℚ)^+, γ𝔖 is contained in a Siegel set associated to γ𝐏γ⁻¹ and the same K.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/finitely-many-cusps — Finitely many cusps
Hypotheses: G connected semisimple over ℚ; Γ arithmetic
Contract: For an arithmetic subgroup Γ ⊂ 𝐆(ℚ), there are only finitely many Γ-conjugacy classes of ℚ-parabolic subgroups.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/real-siegel-finite-cover — Finitely many fixed-K Siegel sets cover
Hypotheses: G connected semisimple over ℚ; Γ arithmetic; K fixed, M ⊂ K compact
Contract: Let 𝐏_1, …, 𝐏_k represent the Γ-conjugacy classes of ℚ-parabolics and K a fixed maximal compact. There are Siegel sets 𝔖_i = U_i × A_{𝐏_i,t_i} × W_i associated to 𝐏_i and the same K whose images cover Γ\G/M.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/real-siegel-finite-overlap — Finite overlaps of Siegel sets
Hypotheses: as in real-siegel-finite-cover
Contract: For Siegel sets 𝔖_1, 𝔖_2 associated to the same K, the set {γ ∈ Γ : γ𝔖_1 ∩ 𝔖_2 ≠ ∅} is finite; the same holds for the relatively compact closures of their unipotent and Levi factors.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/cusp-separation — Inequivalent cusps separate
Hypotheses: as in real-siegel-finite-cover
Contract: If 𝐏_1 and 𝐏_2 are not Γ-conjugate, then for fixed U_i, W_i and all sufficiently large t_1, t_2, γ𝔖_1 ∩ 𝔖_2 = ∅ for every γ ∈ Γ.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/deep-cusp-stabilizer — Deep self-intersections come from the parabolic
Hypotheses: as in real-siegel-finite-cover
Contract: For fixed U, W and sufficiently large t, a Siegel set 𝔖 for 𝐏 and K satisfies γ𝔖 ∩ 𝔖 = ∅ for every γ ∈ Γ ∖ Γ_𝐏, where Γ_𝐏 = Γ ∩ 𝐏(ℚ).
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/deep-distinct-parabolics — Deep Siegel sets of distinct parabolics are disjoint
Hypotheses: as in real-siegel-finite-cover
Contract: For distinct ℚ-parabolics 𝐏_1 ≠ 𝐏_2 and fixed bounded U_i, W_i (one K), the Siegel sets 𝔖_1, 𝔖_2 are disjoint once t_1, t_2 are sufficiently large.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/siegel-convention-comparison — Comparison of Siegel-set conventions
Hypotheses: as in real-siegel-set
Contract: Fix K. Every Siegel set U × A_{P,t} × W associated to 𝐏 and K is contained in a Siegel set Ω A_{t′} K in Orr's sense for a Siegel triple (𝐏_0, 𝐒_0, K) with 𝐏_0 ⊂ 𝐏 a minimal ℚ-parabolic, and conversely; every Siegel set for K lies in a 𝐆(ℚ)-translate of one for K and a fixed minimal ℚ-parabolic.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/orr-schnell-containment — Containment of subgroup Siegel sets
Hypotheses: 𝐇 ⊂ 𝐆 reductive over ℚ; K_H ⊂ K_G; θ_{K_G} stabilises 𝐒_H
Contract: Let 𝐇 ⊂ 𝐆 be reductive ℚ-groups, (𝐏_H, 𝐒_H, K_H) a Siegel triple for 𝐇 and 𝔖_H = Ω A_t K_H a Siegel set. Let K_G ⊂ 𝐆(ℝ) be maximal compact with K_H ⊂ K_G and whose Cartan involution stabilises 𝐒_H. Then there are a Siegel triple (𝐏_G, 𝐒_G, K_G), a Siegel set 𝔖_G for it and a finite C ⊂ 𝐆(ℚ) with 𝔖_H ⊂ C·𝔖_G; moreover R_u(𝐏_H) ⊂ R_u(𝐏_G) and 𝐒_H = 𝐒_G ∩ 𝐇.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/cartan-subgroup-criterion — Stability of the subgroup under the Cartan involution suffices
Hypotheses: as in orr-schnell-containment
Contract: In the setting of orr-schnell-containment with K_H ⊂ K_G: if the Cartan involution Θ of 𝐆 for K_G stabilises 𝐇, then Θ|_𝐇 is the Cartan involution of 𝐇 for K_H and Θ stabilises the torus 𝐒_H of every Siegel triple, so the theorem applies. The converse fails for 𝐆 = SL_2, 𝐇 = {(a, db; b, a) : a² − db² = 1} with d a positive non-square rational, K_G = SO_2(ℝ), 𝐒_H = {1}.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/rational-siegel-pullback — Intersecting Siegel sets with a subgroup
Hypotheses: as stated, with the forward-containment hypothesis
Contract: Let 𝐇 ⊂ 𝐆 be reductive over ℚ, K_H = K_G ∩ 𝐇(ℝ) maximal compact, and assume every K_H-Siegel set lies in finitely many 𝐆(ℚ)-translates of a K_G-Siegel set (the conclusion of orr-schnell-containment). Then for every K_G-Siegel set 𝔖_G there are a K_H-Siegel set 𝔖_H and a finite F ⊂ 𝐇(ℚ) with 𝔖_G ∩ 𝐇(ℝ) ⊂ F 𝔖_H.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/incompatible-morphism-obstruction — Compact inclusion alone does not give Siegel containment
Hypotheses: The groups and maps are the concrete ones specified in the statement.
Contract: There are inclusions of reductive (even semisimple) ℚ-groups 𝐇 ⊂ 𝐆 with K_H ⊂ K_G for which some 𝐇-Siegel set is not covered by finitely many 𝐆(ℚ)-translates of K_G-Siegel sets; the Cartan compatibility hypothesis of orr-schnell-containment cannot be removed.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/orbit-map-siegel-preimage — Preimages of Siegel sets under orbit maps
Hypotheses: as stated
Contract: Let 𝐇 ⊂ SL(V) be reductive over ℚ, x_0 ∈ X = SL(V_ℝ)/SO(b_0) with K_H = Stab_{𝐇(ℝ)}(x_0) and the Cartan involution of x_0 stabilising Lie 𝐇, and ι : 𝐇(ℝ)/K_H → X the orbit map. For every Siegel set 𝔖 ⊂ X, ι⁻¹(𝔖) is contained in finitely many Siegel sets of 𝐇(ℝ)/K_H associated to K_H.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/orbit-map-siegel-image — Images of Siegel sets under orbit maps
Hypotheses: as in orbit-map-siegel-preimage
Contract: In the setting of orbit-map-siegel-preimage, every Siegel set of 𝐇(ℝ)/K_H is mapped by ι into finitely many Siegel sets of X.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/reduced-form — Reduced positive forms
Hypotheses: V a finite-dimensional ℚ-vector space; e an ordered basis; C > 0
Contract: Given an ordered basis e = (e_i) of V_ℚ (integral bases of V_ℤ in BKT), C > 0 and a positive definite symmetric form b on V_ℝ, b is (e, C)-reduced if (1) |b(e_i, e_j)| < C b(e_i, e_i) for all i, j; (2) b(e_i, e_i) < C b(e_j, e_j) for i < j; (3) ∏_i b(e_i, e_i) < C det(b), the Gram determinant in e.
Native carrier/API part: the named signatures below. Full structural specializations remain subject to their recorded conditions.
API RealSiegel.IsReduced: RealSiegel.IsReduced e C b : Prop for a positive definite matrix b in the basis e.
Native signature above.
API RealSiegel.IsReduced.mono: IsReduced e C b → C ≤ C′ → IsReduced e C′ b.
Native signature above.
API RealSiegel.IsReduced.smul: IsReduced e C b ↔ IsReduced e C (λ • b) for λ > 0.
Native signature above.
API RealSiegel.IsReduced.cholesky: For fixed dimension n and C>0 there is a constant R(n,C)>0 such that every C-reduced positive Gram matrix b=Nᵀdiag(d)N with N unit upper triangular and d_i>0 satisfies |N_ij|≤R for i<j and d_i≤R d_{i+1} for 0≤i<n−1. The bound is uniform over b.
Native signature above.
API RealSiegel.IsReduced.of_cholesky_bounds: For fixed n and R>0 there is C(n,R)>1 such that every positive Gram matrix b=Nᵀdiag(d)N with N unit upper triangular, positive pivots d_i, |N_ij|≤R above the diagonal and d_i≤R d_{i+1} for i<n−1 is C-reduced.
Native signature above.
Test RealSiegel.IsReduced_identity: The identity matrix of size n is (std, 2)-reduced.
Native example above.
Test RealSiegel.IsReduced_dim_one: In dimension 1 every positive form is (e, C)-reduced for C > 1.
Native example above.
Test RealSiegel.IsReduced_not_ordered: diag(4, 1) is not (std, 2)-reduced (condition (2) fails) although diag(1, 4) is.
Native example above.

### AdelicAlgebraicGroups:AA.3/reduced-form-set — The set T_{e,C} of reduced forms
Hypotheses: as in reduced-form
Contract: T_{e,C} = {b ∈ X : b is (e, C)-reduced} ⊂ X, the space of positive definite forms on V_ℝ; it is semialgebraic and satisfies T_{ge,C} = g·T_{e,C} for g ∈ GL(V_ℚ).
Native carrier/API part: the named signatures below. Full structural specializations remain subject to their recorded conditions.
API RealSiegel.reducedSet: RealSiegel.reducedSet e C : Set (PosDefMatrix n).
Native signature above.
API RealSiegel.reducedSet_mono: Monotone in C.
Native signature above.
API RealSiegel.reducedSet_smul_basis: reducedSet (g • e) C = g • reducedSet e C.
Native signature above.
Test RealSiegel.reducedSet_contains_one: 1 ∈ reducedSet std 2.
Native example above.
Test RealSiegel.reducedSet_dim_one: For n = 1 and C > 1, reducedSet = all positive reals.
Native example above.
Test RealSiegel.reducedSet_not_closed_under_inverse: diag(1, 4) ∈ reducedSet std 2 but its inverse diag(1, 1/4) is not.
Native example above.

### AdelicAlgebraicGroups:AA.3/reduction-siegel-dictionary — Reduced forms and Siegel sets
Hypotheses: V_ℤ a lattice in V_ℚ
Contract: For an ordered integral basis e and C>0, the set of (e,C)-reduced positive definite forms lies in the image of a GL_n(ℝ) Siegel set in GL_n(ℝ)/O(n), and each such Siegel set has reduced-form image for some C. Restricting to Gram determinant one gives the corresponding statement for SL_n(ℝ)/SO(n); normalize an arbitrary form B by det(B)^−1/n B. Rational bases are handled by the matching rational change of basis.
Signature omitted — The native matrix reducedness and uniform forward/converse Cholesky signatures are above. Its comparison with actual Siegel data needs RG2.1 relative parabolics/roots and the fixed-K real Lie Iwasawa coordinates; these cannot be replaced by an arbitrary triangular decomposition.

### AdelicAlgebraicGroups:AA.3/gram-diagonal-lower-bound — Lower bound by diagonal entries
Hypotheses: B positive definite; ∏ d_k ≤ D det B
Contract: Let B be a positive definite real symmetric n × n matrix with diagonal d_k = B_kk and D ≥ 1 with ∏_k d_k ≤ D det B. Then for every real vector a and every k, aᵀ B a ≥ a_k² d_k / D.
Signature omitted — The native matrix reducedness and uniform forward/converse Cholesky signatures are above. Its comparison with actual Siegel data needs RG2.1 relative parabolics/roots and the fixed-K real Lie Iwasawa coordinates; these cannot be replaced by an arbitrary triangular decomposition.

### AdelicAlgebraicGroups:AA.3/gram-offdiagonal-transfer — Transferring off-diagonal bounds to another basis
Hypotheses: as stated
Contract: Let B be the Gram matrix in an ordered basis e′ of a positive definite form b with |B_ab| ≤ C′ d_a, d_a ≤ C′ d_b for a < b and ∏ d_a ≤ C′ det B (C′ ≥ 1). For a fixed basis e_i = ∑_a A_ai e′_a put k_i = max{a : A_ai ≠ 0}, m_i = |A_{k_i,i}|, L_i = ∑_a |A_ai|. Then |b(e_i, e_j)| ≤ C′³ L_i L_j m_i⁻² b(e_i, e_i) for all i, j.
Signature omitted — The native matrix reducedness and uniform forward/converse Cholesky signatures are above. Its comparison with actual Siegel data needs RG2.1 relative parabolics/roots and the fixed-K real Lie Iwasawa coordinates; these cannot be replaced by an arbitrary triangular decomposition.

### AdelicAlgebraicGroups:AA.3/basis-change-reducedness — Basis change with determinant control
Hypotheses: as stated
Contract: Let e, e′ be bases of V_ℚ (m = dim V) and C, C′ ≥ 1. If b is (e′, C′)-reduced and ∏_i b(e_i, e_i) ≤ C det(b in e), then b is (σe, C″)-reduced for the ordering σ of e that sorts the values b(e_i, e_i), with C″ depending only on C, C′ and the change-of-basis matrix; hence b lies in one of the m! sets T_{σe,C″}. The printed statement with the fixed ordering e is false.
Signature omitted — The native matrix reducedness and uniform forward/converse Cholesky signatures are above. Its comparison with actual Siegel data needs RG2.1 relative parabolics/roots and the fixed-K real Lie Iwasawa coordinates; these cannot be replaced by an arbitrary triangular decomposition.

### AdelicAlgebraicGroups:AA.4/weak-approximation-property — Weak approximation
Hypotheses: F a number field; G affine algebraic over F
Contract: An affine algebraic group G over F has weak approximation with respect to a finite set S of places if G(F) is dense in G(F_S) = ∏_{v∈S} G(F_v); it has weak approximation if this holds for every finite S.
Signature omitted — RG2.0 supplies the canonical point topology at each actual place, and the places owner the cofinite restricted product outside S. Density must use those canonical embeddings/topologies. A chosen product of unspecified local groups or a density hypothesis cannot replace the approximation predicate.
API Approximation.HasWeakApproximation: HasWeakApproximation G S : Prop := DenseRange (diagonal G(F) → G(F_S)).
Signature omitted — RG2.0 supplies the canonical point topology at each actual place, and the places owner the cofinite restricted product outside S. Density must use those canonical embeddings/topologies. A chosen product of unspecified local groups or a density hypothesis cannot replace the approximation predicate.
API Approximation.HasWeakApproximation.mono: Weak approximation for S implies it for every S′ ⊆ S.
Signature omitted — RG2.0 supplies the canonical point topology at each actual place, and the places owner the cofinite restricted product outside S. Density must use those canonical embeddings/topologies. A chosen product of unspecified local groups or a density hypothesis cannot replace the approximation predicate.
API Approximation.HasWeakApproximation.prod: Weak approximation for G and H gives it for G × H.
Signature omitted — RG2.0 supplies the canonical point topology at each actual place, and the places owner the cofinite restricted product outside S. Density must use those canonical embeddings/topologies. A chosen product of unspecified local groups or a density hypothesis cannot replace the approximation predicate.
API Approximation.HasWeakApproximation.of_iso: Invariant under isomorphisms of F-groups.
Signature omitted — RG2.0 supplies the canonical point topology at each actual place, and the places owner the cofinite restricted product outside S. Density must use those canonical embeddings/topologies. A chosen product of unspecified local groups or a density hypothesis cannot replace the approximation predicate.
Test Approximation.hasWeakApproximation_ga: G_a has weak approximation for every finite S (weakApproximation_denseRange).
Example omitted — RG2.0 supplies the canonical point topology at each actual place, and the places owner the cofinite restricted product outside S. Density must use those canonical embeddings/topologies. A chosen product of unspecified local groups or a density hypothesis cannot replace the approximation predicate.
Test Approximation.hasWeakApproximation_empty: Every G has weak approximation for S = ∅.
Example omitted — RG2.0 supplies the canonical point topology at each actual place, and the places owner the cofinite restricted product outside S. Density must use those canonical embeddings/topologies. A chosen product of unspecified local groups or a density hypothesis cannot replace the approximation predicate.
Test Approximation.not_hasWeakApproximation_mu2: μ_2 over ℚ fails weak approximation for S = {∞, 2}: the diagonal image {(1,1), (−1,−1)} is not dense in {±1}².
Example omitted — RG2.0 supplies the canonical point topology at each actual place, and the places owner the cofinite restricted product outside S. Density must use those canonical embeddings/topologies. A chosen product of unspecified local groups or a density hypothesis cannot replace the approximation predicate.

### AdelicAlgebraicGroups:AA.4/weak-approximation-gln — Weak approximation for GL_n, SL_n and split tori
Hypotheses: F a number field
Contract: GL_n, SL_n, G_a and split tori G_m^r over F have weak approximation.
Signature omitted — RG2.0/RG2.1/RG2.4 supply canonical arithmetic local group/Lie/torus objects. The recorded analytic, density, cohomological, native-field or anisotropic gaps specify the remaining proof input. No generic Zariski-density assertion on an arbitrary subgroup replaces the full arithmetic subgroup.

### AdelicAlgebraicGroups:AA.4/weak-approximation-simply-connected — Weak approximation for simply connected groups
Hypotheses: G semisimple simply connected over F
Contract: A connected semisimple simply connected group G over a number field F has weak approximation; more generally (property (⋆)) a torsor under G that has points at all real places has an F-point and satisfies weak approximation.
Signature omitted — RG2.0/RG2.1/RG2.4 supply canonical arithmetic local group/Lie/torus objects. The recorded analytic, density, cohomological, native-field or anisotropic gaps specify the remaining proof input. No generic Zariski-density assertion on an arbitrary subgroup replaces the full arithmetic subgroup.

### AdelicAlgebraicGroups:AA.4/group-torsor — Torsors under an affine group over a field
Hypotheses: k a field; G affine algebraic over k
Contract: For an affine algebraic group G over a field k (Hopf algebra H), a G-torsor is a nonzero finitely generated commutative k-algebra A with a coaction A → A ⊗ H making Spec A a right G-space such that A ⊗_k k̄ ≅ H ⊗_k k̄ as comodule algebras (the isomorphism is of comodule algebras; geometric points alone are insufficient for nonreduced group schemes). It is trivial if X(k) ≠ ∅.
Signature omitted — This needs the actual affine algebraic-group action and geometric torsor/descent or Galois-H¹ object, with the canonical field-extension maps. The simply connected cohomology gap has no pinned general torsor interface. An arbitrary free transitive action on F-points is not an algebraic torsor.
API Approximation.Torsor: Structure: the algebra, the coaction, the geometric trivialization.
Signature omitted — This needs the actual affine algebraic-group action and geometric torsor/descent or Galois-H¹ object, with the canonical field-extension maps. The simply connected cohomology gap has no pinned general torsor interface. An arbitrary free transitive action on F-points is not an algebraic torsor.
API Approximation.Torsor.IsTrivial: IsTrivial X : Prop := Nonempty (A →ₐ[k] k).
Signature omitted — This needs the actual affine algebraic-group action and geometric torsor/descent or Galois-H¹ object, with the canonical field-extension maps. The simply connected cohomology gap has no pinned general torsor interface. An arbitrary free transitive action on F-points is not an algebraic torsor.
API Approximation.Torsor.baseChange: Base change along a field extension k → k′.
Signature omitted — This needs the actual affine algebraic-group action and geometric torsor/descent or Galois-H¹ object, with the canonical field-extension maps. The simply connected cohomology gap has no pinned general torsor interface. An arbitrary free transitive action on F-points is not an algebraic torsor.
API Approximation.Torsor.trivial_iff_iso: X is trivial iff X is isomorphic to G acting on itself.
Signature omitted — This needs the actual affine algebraic-group action and geometric torsor/descent or Galois-H¹ object, with the canonical field-extension maps. The simply connected cohomology gap has no pinned general torsor interface. An arbitrary free transitive action on F-points is not an algebraic torsor.
Test Approximation.Torsor.self_trivial: G acting on itself is trivial.
Example omitted — This needs the actual affine algebraic-group action and geometric torsor/descent or Galois-H¹ object, with the canonical field-extension maps. The simply connected cohomology gap has no pinned general torsor interface. An arbitrary free transitive action on F-points is not an algebraic torsor.
Test Approximation.Torsor.mu2_sqrt: For μ_2 over ℚ and a = 2, the torsor ℚ[x]/(x² − 2) is nontrivial over ℚ: 2 is not a rational square (it becomes trivial over ℚ_7).
Example omitted — This needs the actual affine algebraic-group action and geometric torsor/descent or Galois-H¹ object, with the canonical field-extension maps. The simply connected cohomology gap has no pinned general torsor interface. An arbitrary free transitive action on F-points is not an algebraic torsor.
Test Approximation.Torsor.not_torsor_two_orbits: G_m acting on A¹ by scaling is not a torsor: A¹(k̄) has two orbits.
Example omitted — This needs the actual affine algebraic-group action and geometric torsor/descent or Galois-H¹ object, with the canonical field-extension maps. The simply connected cohomology gap has no pinned general torsor interface. An arbitrary free transitive action on F-points is not an algebraic torsor.

### AdelicAlgebraicGroups:AA.4/kneser-local-torsor — Kneser's theorem: local triviality of torsors
Hypotheses: F_v nonarchimedean of characteristic 0; G semisimple simply connected
Contract: For G connected semisimple simply connected over a nonarchimedean local field F_v of characteristic 0, every G-torsor over F_v is trivial (H¹(F_v, G) = 1).
Signature omitted — This needs the actual affine algebraic-group action and geometric torsor/descent or Galois-H¹ object, with the canonical field-extension maps. The simply connected cohomology gap has no pinned general torsor interface. An arbitrary free transitive action on F-points is not an algebraic torsor.

### AdelicAlgebraicGroups:AA.4/hasse-principle-simply-connected — Hasse principle for simply connected groups
Hypotheses: G semisimple simply connected over F
Contract: For G connected semisimple simply connected over a number field F, a G-torsor over F is trivial iff it is trivial over F_v for every real place v (H¹(F, G) → ∏_{v real} H¹(F_v, G) is bijective).
Signature omitted — This needs the actual affine algebraic-group action and geometric torsor/descent or Galois-H¹ object, with the canonical field-extension maps. The simply connected cohomology gap has no pinned general torsor interface. An arbitrary free transitive action on F-points is not an algebraic torsor.

### AdelicAlgebraicGroups:AA.4/strong-approximation-property — Strong approximation
Hypotheses: F a number field; S a finite set of places
Contract: An affine algebraic group G over F has strong approximation with respect to a finite set S of places if G(F) is dense in G(𝔸_F^S), the adelic points away from S (equivalently G(F)G(F_S) is dense in G(𝔸_F)).
Signature omitted — RG2.0 supplies the canonical point topology at each actual place, and the places owner the cofinite restricted product outside S. Density must use those canonical embeddings/topologies. A chosen product of unspecified local groups or a density hypothesis cannot replace the approximation predicate.
API Approximation.HasStrongApproximation: HasStrongApproximation G S : Prop := DenseRange (diagonal G(F) → G(𝔸^S)).
Signature omitted — RG2.0 supplies the canonical point topology at each actual place, and the places owner the cofinite restricted product outside S. Density must use those canonical embeddings/topologies. A chosen product of unspecified local groups or a density hypothesis cannot replace the approximation predicate.
API Approximation.HasStrongApproximation.mul_open: For every open subgroup U ⊂ G(𝔸^S), G(𝔸^S) = G(F)U.
Signature omitted — RG2.0 supplies the canonical point topology at each actual place, and the places owner the cofinite restricted product outside S. Density must use those canonical embeddings/topologies. A chosen product of unspecified local groups or a density hypothesis cannot replace the approximation predicate.
API Approximation.HasStrongApproximation.mono: Strong approximation for S implies it for S′ ⊇ S.
Signature omitted — RG2.0 supplies the canonical point topology at each actual place, and the places owner the cofinite restricted product outside S. Density must use those canonical embeddings/topologies. A chosen product of unspecified local groups or a density hypothesis cannot replace the approximation predicate.
API Approximation.HasStrongApproximation.classNumber_one: If it holds for S = archimedean places then G(F)\G(𝔸_f)/U is a point for every compact open U.
Signature omitted — RG2.0 supplies the canonical point topology at each actual place, and the places owner the cofinite restricted product outside S. Density must use those canonical embeddings/topologies. A chosen product of unspecified local groups or a density hypothesis cannot replace the approximation predicate.
Test Approximation.hasStrongApproximation_ga: G_a over F has strong approximation for S = archimedean places (GlobalNumberFields layer 6).
Example omitted — RG2.0 supplies the canonical point topology at each actual place, and the places owner the cofinite restricted product outside S. Density must use those canonical embeddings/topologies. A chosen product of unspecified local groups or a density hypothesis cannot replace the approximation predicate.
Test Approximation.hasStrongApproximation_sl2_rat: SL_2 over ℚ with S = {∞}: SL_2(ℤ) → SL_2(ℤ/d) surjective for all d (Tau Ceti), equivalent to density of SL_2(ℚ) in SL_2(𝔸_f).
Example omitted — RG2.0 supplies the canonical point topology at each actual place, and the places owner the cofinite restricted product outside S. Density must use those canonical embeddings/topologies. A chosen product of unspecified local groups or a density hypothesis cannot replace the approximation predicate.
Test Approximation.not_hasStrongApproximation_gm: G_m over ℚ fails for S = {∞}: ℚ^× ∩ ℤ̂^× = {±1}, so ℚ^× is discrete in 𝔸_f^× (AA.1/finite-adelic-discreteness-criterion).
Example omitted — RG2.0 supplies the canonical point topology at each actual place, and the places owner the cofinite restricted product outside S. Density must use those canonical embeddings/topologies. A chosen product of unspecified local groups or a density hypothesis cannot replace the approximation predicate.

### AdelicAlgebraicGroups:AA.4/ga-strong-approximation — Strong approximation for unipotent groups
Hypotheses: N unipotent over F
Contract: Every unipotent group over F (in particular G_a) has strong approximation with respect to any nonempty finite S containing the archimedean places.
Signature omitted — RG2.0/RG2.1/RG2.4 supply canonical arithmetic local group/Lie/torus objects. The recorded analytic, density, cohomological, native-field or anisotropic gaps specify the remaining proof input. No generic Zariski-density assertion on an arbitrary subgroup replaces the full arithmetic subgroup.

### AdelicAlgebraicGroups:AA.4/torus-strong-approximation-failure — Tori never have strong approximation for finite S
Hypotheses: T a nontrivial F-torus; S finite
Contract: For a nontrivial torus T over F and a finite set S of places, T(F) is not dense in T(𝔸^S); the quotient of T(𝔸^S) by the closure of T(F) has infinite exponent. Weak approximation for tori is asserted only for split tori (weak-approximation-gln).
Signature omitted — RG2.0/RG2.1/RG2.4 supply canonical arithmetic local group/Lie/torus objects. The recorded analytic, density, cohomological, native-field or anisotropic gaps specify the remaining proof input. No generic Zariski-density assertion on an arbitrary subgroup replaces the full arithmetic subgroup.

### AdelicAlgebraicGroups:AA.4/zariski-dense-closure-open — Closures of Zariski-dense subgroups are open
Hypotheses: G connected absolutely almost simple over ℚ_p; Γ⊂G(ℚ_p) Zariski dense and nondiscrete
Contract: Let G be connected absolutely almost simple over ℚ_p, and Γ⊂G(ℚ_p) a Zariski-dense nondiscrete subgroup. Its closure is open in G(ℚ_p), subject to the recorded p-adic analytic closed-subgroup input. This statement does not extend to arbitrary E/ℚ_p with E-Zariski density alone.
Signature omitted — RG2.0/RG2.1/RG2.4 supply canonical arithmetic local group/Lie/torus objects. The recorded analytic, density, cohomological, native-field or anisotropic gaps specify the remaining proof input. No generic Zariski-density assertion on an arbitrary subgroup replaces the full arithmetic subgroup.

### AdelicAlgebraicGroups:AA.4/borel-density — Borel density for S-arithmetic groups
Hypotheses: G absolutely almost simple over F; G_S noncompact
Contract: For G connected absolutely almost simple over F and S a finite set of places containing the archimedean ones with G_S noncompact, the S-arithmetic group G(𝒪_{F,S}) is infinite and Zariski dense in G.
Signature omitted — RG2.0/RG2.1/RG2.4 supply canonical arithmetic local group/Lie/torus objects. The recorded analytic, density, cohomological, native-field or anisotropic gaps specify the remaining proof input. No generic Zariski-density assertion on an arbitrary subgroup replaces the full arithmetic subgroup.

### AdelicAlgebraicGroups:AA.4/open-finite-covolume-finite-index — Open subgroups of finite covolume have finite index
Hypotheses: H locally compact; Δ open; The quotient measure is nonzero, finite and Radon
Contract: If Δ is an open subgroup of a locally compact group H such that H/Δ carries a nonzero finite H-invariant Radon measure, then Δ has finite index in H.
Signature omitted — RG2.0/RG2.1/RG2.4 supply canonical arithmetic local group/Lie/torus objects. The recorded analytic, density, cohomological, native-field or anisotropic gaps specify the remaining proof input. No generic Zariski-density assertion on an arbitrary subgroup replaces the full arithmetic subgroup.

### AdelicAlgebraicGroups:AA.4/strong-approximation-sufficiency — Strong approximation: sufficiency
Hypotheses: G absolutely almost simple simply connected over F; S ⊇ archimedean places; G_S noncompact
Contract: Let G be connected, absolutely almost simple and simply connected over a number field F, and S a finite set of places containing the archimedean ones with G_S = ∏_{v∈S} G(F_v) noncompact. Then G has strong approximation with respect to S.
Signature omitted — RG2.0/RG2.1/RG2.4 supply canonical arithmetic local group/Lie/torus objects. The recorded analytic, density, cohomological, native-field or anisotropic gaps specify the remaining proof input. No generic Zariski-density assertion on an arbitrary subgroup replaces the full arithmetic subgroup.

### AdelicAlgebraicGroups:AA.4/strong-approximation-necessity — Strong approximation: necessity
Hypotheses: G connected absolutely almost simple over F; S finite
Contract: In the setting of strong-approximation-sufficiency without the hypotheses: if G has strong approximation with respect to S then G_S is noncompact and G is simply connected.
Signature omitted — RG2.0/RG2.1/RG2.4 supply canonical arithmetic local group/Lie/torus objects. The recorded analytic, density, cohomological, native-field or anisotropic gaps specify the remaining proof input. No generic Zariski-density assertion on an arbitrary subgroup replaces the full arithmetic subgroup.

### AdelicAlgebraicGroups:AA.4/strong-approximation-theorem — Strong approximation for semisimple groups
Hypotheses: G semisimple simply connected; each F-simple factor noncompact at S
Contract: Let G be connected semisimple simply connected over F and S ⊇ archimedean places finite such that G′(F_S) is noncompact for every F-simple factor G′ of G. Then G(𝔸_F) = G(F)·G(F_S)·U for every compact open U ⊂ G(𝔸_F^S); in particular G(F)\G(𝔸_f)/U is a single point when S is the set of archimedean places.
Signature omitted — RG2.0/RG2.1/RG2.4 supply canonical arithmetic local group/Lie/torus objects. The recorded analytic, density, cohomological, native-field or anisotropic gaps specify the remaining proof input. No generic Zariski-density assertion on an arbitrary subgroup replaces the full arithmetic subgroup.

### AdelicAlgebraicGroups:AA.4/class-set-abelianization — Class sets of groups with simply connected derived group
Hypotheses: F a number field; G a connected reductive group over F; G^der simply connected; G^der(F_∞) noncompact on each simple factor
Contract: Let G be connected reductive over F with G^der simply connected and G^der(F_∞) noncompact on each F-simple factor, ν : G → D = G/G^der. For compact open U ⊂ G(𝔸_{F,f}), ν induces a bijection G(F)\G(𝔸_{F,f})/U ≃ ν(G(F))\D(𝔸_{F,f})/ν(U).
Signature omitted — RG2.0/RG2.1/RG2.4 supply canonical arithmetic local group/Lie/torus objects. The recorded analytic, density, cohomological, native-field or anisotropic gaps specify the remaining proof input. No generic Zariski-density assertion on an arbitrary subgroup replaces the full arithmetic subgroup.

### AdelicAlgebraicGroups:AA.4/neat-element — Neat elements
Hypotheses: F a number field (G over ℚ via restriction of scalars); G linear algebraic; The group representation is algebraic and faithful, rather than merely injective as a map on F-rational points. In Hopf coordinates it is induced by a surjective GL_n-coordinate morphism O(GL_n)→O(G).
Contract: An automorphism α of a finite-dimensional vector space over a subfield of ℂ is neat if its eigenvalues in ℂ generate a torsion-free subgroup of ℂ^×. An element g ∈ G(F) of a linear algebraic group over a number field F is neat if ρ(g) is neat for one faithful F-representation ρ; a subgroup of G(F) is neat if all its elements are.
Native carrier/API part: the named signatures below. Full structural specializations remain subject to their recorded conditions.
API Neat.IsNeatAut: IsNeatAut α : Prop for α ∈ GL(V), V over a subfield of ℂ.
Native signature above.
API Neat.IsNeat: IsNeat g : Prop for g ∈ G(F), via a chosen faithful representation.
Native signature above.
API Neat.IsNeatSubgroup: A subgroup all of whose elements are neat.
Native signature above.
API Neat.IsNeat.pow: If g is neat then so is g^n.
Native signature above.
API Neat.IsNeat.torsion_eq_one: A neat element of finite order is 1.
Native signature above.
API Neat.algebraicPointMap: For a GL_n coordinate bialgebra morphism r:O(GL_n)→O(G) and an embedding F→ℂ, evaluate r on F-points through Tau Ceti GeneralLinear.pointsMulEquiv and extend matrix entries to ℂ.
Native signature above.
API Neat.IsAlgebraicPointHom: The point homomorphism is induced by such an algebraic coordinate morphism, using the specified coefficient embedding.
Native signature above.
API Neat.IsFaithfulAlgebraicPointHom: The point homomorphism is induced by a surjective coordinate morphism, hence a closed algebraic immersion; this is stronger than injectivity on rational points.
Native signature above.
Test Neat.isNeat_diag: diag(2, 1/2) ∈ SL_2(ℚ) is neat.
Native example above.
Test Neat.isNeat_one: 1 is neat.
Native example above.
Test Neat.not_isNeat_rotation: The order-3 element (0 −1; 1 −1) of SL_2(ℤ) is not neat; nor is a torsion-free element whose eigenvalue group contains ζ_3, such as (0 −1; 1 1)·(scalar 2) in GL_2(ℚ).
Native example above.

### AdelicAlgebraicGroups:AA.4/neat-representation-independence — Neatness does not depend on the representation
Hypotheses: G a finite-type linear algebraic group over the number field F; ρ is a faithful algebraic representation (a closed immersion), σ is an algebraic representation, and the compared complex point actions use the same embedding F→ℂ. Arbitrary homomorphisms of the abstract rational-point group are excluded.
Contract: If ρ(g) is neat for one faithful representation ρ of G then σ(g) is neat for every representation σ of G defined over a subfield of ℂ.
Native equivalent signature(s): Neat.isNeat_of_faithful.

### AdelicAlgebraicGroups:AA.4/neat-stability — Neatness is stable under subgroups, conjugation and homomorphisms
Hypotheses: G, G′ linear algebraic over F
Contract: Subgroups of neat subgroups are neat; conjugates of neat subgroups by elements of G(F) are neat; and for a homomorphism φ : G → G′ of linear algebraic groups the image φ(Γ) of a neat subgroup Γ is neat.
Native equivalent signature(s): Neat.IsNeat.pow.

### AdelicAlgebraicGroups:AA.4/neat-torsion-free — Neat groups are torsion free
Hypotheses: G linear algebraic
Contract: A neat subgroup of G(F) is torsion free.
Native equivalent signature(s): Neat.IsNeat.torsion_eq_one.

### AdelicAlgebraicGroups:AA.4/neat-level — Neat compact open levels
Hypotheses: G linear algebraic over F
Contract: A compact open subgroup U ⊂ G(𝔸_{F,f}) is neat if G(F) ∩ x U x⁻¹ is neat for every x ∈ G(𝔸_{F,f}) (convention: all rational intersections, not every element of U).
Native carrier/API part: the named signatures below. Full structural specializations remain subject to their recorded conditions.
API Neat.IsNeatLevel: IsNeatLevel U : Prop := ∀ x, IsNeatSubgroup (levelArithmetic x U).
Native signature above.
API Neat.IsNeatLevel.mono: A compact open subgroup of a neat level is neat.
Native signature above.
API Neat.IsNeatLevel.conj: Conjugates of neat levels are neat.
Native signature above.
API Neat.IsNeatLevel.torsionFree: All levelArithmetic x U are torsion free.
Native signature above.
Test Neat.isNeatLevel_U3: The arithmetic group Γ(3) = SL_2(ℤ) ∩ U(3) of the level U(3) ⊂ GL_2(ℤ̂) is neat.
Example omitted — The actual coordinate-algebra neatness and relative-level signatures are above; the algebraic-group meaning fixes a closed faithful representation. Concrete compact/congruence levels require RG2.0/RG2.3 canonical point/model topology and the actual completed valuation/eigenvalue field interface. The existence theorem also uses the coordinate-comodule supplier. No arbitrary abstract point representation is admitted.
Test Neat.isNeatLevel_trivial_group: For the trivial group every level is neat.
Native example above.
Test Neat.not_isNeatLevel_GL2Zhat: GL_2(ℤ̂) is not neat: it contains −1 ∈ GL_2(ℤ).
Example omitted — The actual coordinate-algebra neatness and relative-level signatures are above; the algebraic-group meaning fixes a closed faithful representation. Concrete compact/congruence levels require RG2.0/RG2.3 canonical point/model topology and the actual completed valuation/eigenvalue field interface. The existence theorem also uses the coordinate-comodule supplier. No arbitrary abstract point representation is admitted.

### AdelicAlgebraicGroups:AA.4/neat-criterion-one-prime — A one-prime criterion for neatness
Hypotheses: ρ faithful; U compact open; p ≥ 3 (or p = 2 with level 4)
Contract: Let ρ : G ↪ GL_n be a faithful representation over ℚ (after restriction of scalars) and U ⊂ G(𝔸_f) compact open. If for some prime p ≥ 3 the projection of ρ(U) to GL_n(ℚ_p) lies in 1 + p M_n(ℤ_p) (for p = 2, in 1 + 4M_n(ℤ_2)), then U is neat.
Signature omitted — The actual coordinate-algebra neatness and relative-level signatures are above; the algebraic-group meaning fixes a closed faithful representation. Concrete compact/congruence levels require RG2.0/RG2.3 canonical point/model topology and the actual completed valuation/eigenvalue field interface. The existence theorem also uses the coordinate-comodule supplier. No arbitrary abstract point representation is admitted.

### AdelicAlgebraicGroups:AA.4/neat-level-exists — Neat levels exist
Hypotheses: G linear algebraic over F
Contract: Every compact open U ⊂ G(𝔸_{F,f}) contains a neat normal open subgroup of finite index; every arithmetic subgroup of G(F) contains a neat subgroup of finite index defined by congruence conditions (Borel).
Signature omitted — The actual coordinate-algebra neatness and relative-level signatures are above; the algebraic-group meaning fixes a closed faithful representation. Concrete compact/congruence levels require RG2.0/RG2.3 canonical point/model topology and the actual completed valuation/eigenvalue field interface. The existence theorem also uses the coordinate-comodule supplier. No arbitrary abstract point representation is admitted.

### AdelicAlgebraicGroups:AA.4/double-coset-level-map — Nested-level map on double cosets
Hypotheses: G a group; H, K′ ≤ K subgroups
Contract: For a group G, H ≤ G and K′ ≤ K ≤ G, π : H\G/K′ → H\G/K, [g] ↦ [g], is well defined and surjective, and for each g the map K/K′ → π⁻¹([g]), kK′ ↦ [gk], is a surjection; no normality is assumed.
Native carrier/API part: the named signatures below. Full structural specializations remain subject to their recorded conditions.
API LevelMaps.levelMap: levelMap H hK : DoubleCoset.Quotient H K′ → DoubleCoset.Quotient H K.
Native signature above.
API LevelMaps.levelMap_mk: levelMap (mk g) = mk g.
Native signature above.
API LevelMaps.levelMap_surjective: levelMap is surjective.
Native signature above.
API LevelMaps.fibreSurj: fibreSurj g : K ⧸ K′.subgroupOf K → levelMap ⁻¹' {mk g}, kK′ ↦ mk (g k), surjective.
Native signature above.
API LevelMaps.levelMap_comp: levelMap for K″ ≤ K′ ≤ K composes.
Native signature above.
Test LevelMaps.levelMap_refl: For K′ = K, levelMap is the identity.
Native example above.
Test LevelMaps.levelMap_trivial_H: For H = ⊥ and finite index, each fibre has exactly [K : K′] elements.
Native example above.
Test LevelMaps.levelMap_fibre_not_index: For H = G and [K : K′] = 2 there is one fine class, so the fibre size 1 is not the index 2.
Native example above.

### AdelicAlgebraicGroups:AA.4/double-coset-level-cardinality — Finite-index bound for level changes
Hypotheses: K′ ≤ K, [K : K′] = N finite
Contract: For K′ ≤ K of finite index N, every fibre of H\G/K′ → H\G/K has at most N elements; if H\G/K is finite of cardinality h then H\G/K′ is finite of cardinality at most Nh. No normality, freeness or neatness is assumed.
Native equivalent signature(s): LevelMaps.card_le_index_mul.

### AdelicAlgebraicGroups:AA.4/double-coset-conjugate-level — Conjugate levels give equivalent double-coset sets
Hypotheses: G a group
Contract: For H, K ≤ G and a ∈ G, [g] ↦ [ga] is a bijection H\G/(aKa⁻¹) ≃ H\G/K with inverse [x] ↦ [xa⁻¹]; a need not normalize H.
Native equivalent signature(s): LevelMaps.conjLevelEquiv.

### AdelicAlgebraicGroups:AA.4/finite-support-product-index — Index of product subgroups with finite exceptional support
Hypotheses: S_v = H_v outside finite B
Contract: For groups H_v with subgroups S_v ≤ H_v equal to H_v outside a finite set B and of finite index for v ∈ B, (∏ H_v)/(∏ S_v) ≃ ∏_{v∈B} H_v/S_v and [∏ H_v : ∏ S_v] = ∏_{v∈B} [H_v : S_v]; in particular for compact open product levels in G(𝔸_f), [∏ K_v : ∏ K′_v] = ∏_v [K_v : K′_v].
Signature omitted — RG2.0/RG2.1/RG2.4 supply canonical arithmetic local group/Lie/torus objects. The recorded analytic, density, cohomological, native-field or anisotropic gaps specify the remaining proof input. No generic Zariski-density assertion on an arbitrary subgroup replaces the full arithmetic subgroup.

### AdelicAlgebraicGroups:AA.4/level-quotient — Level quotients
Hypotheses: F a number field; G a connected reductive group over F; U compact open; K_∞ closed
Contract: For compact open U ⊂ G(𝔸_{F,f}) and a closed subgroup K_∞ ⊂ G(F_∞) (for example a maximal compact subgroup times A_G(ℝ)^0, or trivial), the level quotient is X_U = G(F)\G(𝔸_F)/K_∞U with the quotient topology, together with the right action of G(𝔸_f) by Hecke translation X_{gUg⁻¹} ≃ X_U, [x] ↦ [xg].
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.
API LevelMaps.LevelQuotient: LevelQuotient U K∞ : Type, the double quotient with its topology.
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.
API LevelMaps.LevelQuotient.mk: The projection G(𝔸) → LevelQuotient U K∞.
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.
API LevelMaps.LevelQuotient.rightTranslate: rightTranslate g : LevelQuotient (g U g⁻¹) K∞ ≃ₜ LevelQuotient U K∞.
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.
API LevelMaps.LevelQuotient.mk_rational: mk (diagonal γ * x) = mk x.
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.
Test LevelMaps.LevelQuotient.gl1_rat: For GL_1/ℚ, U = ℤ̂^× (the maximal compact open subgroup) and K∞ = ℝ^×: LevelQuotient is a point.
Example omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.
Test LevelMaps.LevelQuotient.trivial_group: For the trivial group it is a point.
Example omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.
Test LevelMaps.LevelQuotient.not_finite_adelic_only: For SL_2/ℚ with K∞ = 1, LevelQuotient is SL_2(ℤ)\SL_2(ℝ) (strong approximation), not the one-point set SL_2(ℚ)\SL_2(𝔸_f)/U.
Example omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.

### AdelicAlgebraicGroups:AA.4/level-covering-map — Covering maps between neat levels
Hypotheses: F a number field; G a connected reductive group over F; U neat; U′ ⊂ U compact open; K∞ contains A_G(ℝ)^0 and is compact modulo it
Contract: Let U′⊂U be compact open with U neat, and K∞ containing A_G(ℝ)^0 and compact modulo it. Then X_{U′}→X_U is a finite covering of degree [U:U′]. If U′ is normal in U, the canonical U/U′ action is free and transitive on each fibre, so this is a principal U/U′ covering. The rational stabilizer is trivial in this scope. Equality of U/U′ with the full deck-transformation group additionally requires the usual connectedness hypotheses (in particular connected total space).
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.

### AdelicAlgebraicGroups:AA.4/level-map-fibre-mass — Fibre mass of a level map with stabilizers
Hypotheses: F a number field; G a connected reductive group over F; U′ ⊂ U compact open
Contract: Without neatness, for U′ ⊂ U and x ∈ X_U with finite stabilizer group Γ_x = (G(F) ∩ g K_∞U g⁻¹)/(Z(F) ∩ K_∞U), the fibre of X_{U′} → X_U over x satisfies ∑_{y ↦ x} 1/|Γ_y| = [U : U′]/(|Γ_x|·[Z(F) ∩ K_∞U : Z(F) ∩ K_∞U′]).
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.

### AdelicAlgebraicGroups:AA.4/level-quotient-groupoid — Quotient groupoids at non-neat level
Hypotheses: F a number field; G a connected reductive group over F
Contract: For compact open U and closed K∞, 𝒳_U is the action groupoid of G(F) on G(𝔸)/K∞U, with automorphism group G(F)∩xK∞Ux⁻¹ and isomorphism classes X_U. If K∞ contains A_G(ℝ)^0 and is compact modulo it, these automorphism groups are finite; at neat U they are trivial. For an arbitrary closed K∞ they need not be finite (real quadratic unit stabilizers when K∞ is the full archimedean centre).
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.
API LevelMaps.levelGroupoid: The action groupoid of G(F) on G(𝔸)/K∞U.
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.
API LevelMaps.levelGroupoid_aut: Aut of the object x is G(F) ∩ x K∞U x⁻¹.
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.
API LevelMaps.levelGroupoid_isoClasses: Isomorphism classes ≃ LevelQuotient U K∞.
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.
API LevelMaps.levelGroupoid_finite_aut: Every automorphism group is finite if U is compact open and K∞ contains A_G(ℝ)^0 and is compact modulo it; no finiteness assertion is made for general closed K∞.
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.
Test LevelMaps.levelGroupoid_sl2_i: For SL_2/ℚ, U = SL_2(ℤ̂), the automorphism group of the object over i has order 4.
Example omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.
Test LevelMaps.levelGroupoid_neat: Under the compact-modulo-A_G hypotheses, neat level has trivial actual automorphism groups, by finiteness and torsion-freeness.
Example omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.
Test LevelMaps.levelGroupoid_not_space: The groupoid is not determined by X_U: Y(1) and the coarse space of the groupoid agree, but the groupoid remembers the stabilizers of orders 4 and 6.
Example omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.

### AdelicAlgebraicGroups:AA.4/hecke-correspondence — Hecke correspondences
Hypotheses: F a number field; G a connected reductive group over F; U compact open; g ∈ G(𝔸_f)
Contract: For g ∈ G(𝔸_{F,f}) and compact open U, put U_g = U ∩ gUg⁻¹. The Hecke correspondence T_g is X_U ←p₁ X_{U_g} →p₂ X_U with p₁[x] = [x] and p₂[x] = [xg]; it depends only on UgU.
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.
API LevelMaps.hecke: The pair of maps X_{U_g} → X_U.
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.
API LevelMaps.hecke_fst: (hecke g).1 (mk x) = mk x.
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.
API LevelMaps.hecke_snd: (hecke g).2 (mk x) = mk (x * g).
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.
API LevelMaps.hecke_degree: At neat level the degree of p₁ is [U : U_g] = degree of the double coset UgU (HeckeCoset.degree_eq_relIndex).
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.
Test LevelMaps.hecke_one: For g = 1 both maps are the identity.
Example omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.
Test LevelMaps.hecke_Tp_degree: For GL_2/ℚ, U = GL_2(ℤ̂), g = diag(p,1): [U : U_g] = p + 1.
Example omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.
Test LevelMaps.hecke_not_symmetric: T_g and T_{g⁻¹} are transposes, not equal in general: for GL_2 with g = diag(p,1), T_{g⁻¹} is T_g composed with translation by the central idele p⁻¹ at p.
Example omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.

### AdelicAlgebraicGroups:AA.4/hecke-cartesian — Cartesian squares of level maps
Hypotheses: F a number field; G a connected reductive group over F; U neat; U′L = U; K∞ contains A_G(ℝ)^0 and is compact modulo it
Contract: Let U′,L⊂U be compact open with U neat, K∞ containing A_G(ℝ)^0 and compact modulo it, and U′L=U. Then X_{U′∩L}→X_L, X_{U′∩L}→X_{U′}, X_{U′}→X_U, X_L→X_U is Cartesian. For L=U_g this identifies this one leg of a Hecke pullback only when the product condition holds. U′ normal does not imply that condition, and U′∩U_g is generally different from U′∩gU′g⁻¹.
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.

### AdelicAlgebraicGroups:AA.4/quotient-volume-decomposition — Volume of a level quotient
Hypotheses: F a number field; G a connected reductive group over F; U compact open
Contract: With a Haar measure dg_f on G(𝔸_f), dg_∞ on G(F_∞) and the product measure on G(𝔸) (AA.0/restricted-haar-split), vol(G(F)\G(𝔸)^1) = vol(U) ∑_{i} vol(Γ_i\G(F_∞)/A_G(ℝ)^0) for representatives x_i of G(F)\G(𝔸_f)/U, where Γ_i = G(F) ∩ x_iUx_i⁻¹, the measure on G(𝔸)^1 is transported from G(𝔸)/A_G(ℝ)^0 (AA.2/split-centre-decomposition) and G(F_∞)/A_G(ℝ)^0 carries the quotient measure. (G(𝔸)^1 is not G(F_∞)^1 × G(𝔸_f): finite ideles have nontrivial norms.)
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.

### AdelicAlgebraicGroups:AA.4/level-volume-index — Volumes under finite-index level change
Hypotheses: F a number field; G a connected reductive group over F; U′ ⊂ U compact open
Contract: For compact open U′ ⊂ U, ∑_j vol(Γ′_j\G(F_∞)/A_G(ℝ)^0) = [U : U′] ∑_i vol(Γ_i\G(F_∞)/A_G(ℝ)^0).
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.

### AdelicAlgebraicGroups:AA.4/plus-subgroup — The subgroup G(𝔸)^+ from the simply connected cover
Hypotheses: F a number field; G a connected reductive group over F
Contract: For G connected reductive over F with simply connected cover ρ : G̃ → G^der ⊂ G of the derived group, G(𝔸_F)^+ = ρ(G̃(𝔸_F)), a normal subgroup of G(𝔸_F) containing the commutator subgroup; likewise G(R)^+ for any F-algebra R. For G = PB^× (B a quaternion algebra over ℚ), G̃ = B^(1) is the norm-one group.
Signature omitted — RG2.1/RG2.3 must supply the actual simply connected algebraic cover and its integral models. Reduced norms, their open local images and good integral images determine the restricted-product quotient topology, as recorded in the quaternion norm gap. A chosen point homomorphism or bijection of square classes is insufficient.
API Approximation.plusSubgroup: plusSubgroup G : Subgroup (AdelicPoints H) := range of the simply connected cover.
Signature omitted — RG2.1/RG2.3 must supply the actual simply connected algebraic cover and its integral models. Reduced norms, their open local images and good integral images determine the restricted-product quotient topology, as recorded in the quaternion norm gap. A chosen point homomorphism or bijection of square classes is insufficient.
API Approximation.plusSubgroup_normal: plusSubgroup is normal.
Signature omitted — RG2.1/RG2.3 must supply the actual simply connected algebraic cover and its integral models. Reduced norms, their open local images and good integral images determine the restricted-product quotient topology, as recorded in the quaternion norm gap. A chosen point homomorphism or bijection of square classes is insufficient.
API Approximation.commutator_le_plusSubgroup: ⁅G(𝔸), G(𝔸)⁆ ≤ plusSubgroup.
Signature omitted — RG2.1/RG2.3 must supply the actual simply connected algebraic cover and its integral models. Reduced norms, their open local images and good integral images determine the restricted-product quotient topology, as recorded in the quaternion norm gap. A chosen point homomorphism or bijection of square classes is insufficient.
API Approximation.plusSubgroup_gln: For GL_n, plusSubgroup = SL_n(𝔸).
Signature omitted — RG2.1/RG2.3 must supply the actual simply connected algebraic cover and its integral models. Reduced norms, their open local images and good integral images determine the restricted-product quotient topology, as recorded in the quaternion norm gap. A chosen point homomorphism or bijection of square classes is insufficient.
Test Approximation.plusSubgroup_sln: For simply connected G, plusSubgroup = ⊤.
Example omitted — RG2.1/RG2.3 must supply the actual simply connected algebraic cover and its integral models. Reduced norms, their open local images and good integral images determine the restricted-product quotient topology, as recorded in the quaternion norm gap. A chosen point homomorphism or bijection of square classes is insufficient.
Test Approximation.plusSubgroup_pgl2_quotient: For PGL_2/ℚ, det induces G(𝔸)/plusSubgroup ≃ 𝔸^×/𝔸^{×2}.
Example omitted — RG2.1/RG2.3 must supply the actual simply connected algebraic cover and its integral models. Reduced norms, their open local images and good integral images determine the restricted-product quotient topology, as recorded in the quaternion norm gap. A chosen point homomorphism or bijection of square classes is insufficient.
Test Approximation.plusSubgroup_not_derived_points: For PGL_2, plusSubgroup ≠ G^der(𝔸) = PGL_2(𝔸): the image of SL_2(ℚ_p) in PGL_2(ℚ_p) has index 4 for odd p.
Example omitted — RG2.1/RG2.3 must supply the actual simply connected algebraic cover and its integral models. Reduced norms, their open local images and good integral images determine the restricted-product quotient topology, as recorded in the quaternion norm gap. A chosen point homomorphism or bijection of square classes is insufficient.

### AdelicAlgebraicGroups:AA.4/residual-quotient — The residual quotient G_res
Hypotheses: F a number field; G a connected reductive group over F
Contract: For connected reductive G/F, define G_res=G(𝔸_F)/(G(F)G(𝔸_F)^+), an abelian topological group with its canonical quotient topology, and π⁺:[G(𝔸)]→G_res. The composite G(𝔸)→G_res is a continuous surjective homomorphism. Hausdorffness or compactness requires closedness of the denominator subgroup; for PB×/ℚ these follow from reduced-norm-components and idele-class-square-compact.
Signature omitted — RG2.1/RG2.3 must supply the actual simply connected algebraic cover and its integral models. Reduced norms, their open local images and good integral images determine the restricted-product quotient topology, as recorded in the quaternion norm gap. A chosen point homomorphism or bijection of square classes is insufficient.
API Approximation.residualQuotient: residualQuotient G : Type, the quotient group G(𝔸) ⧸ (G(F) ⊔ plusSubgroup).
Signature omitted — RG2.1/RG2.3 must supply the actual simply connected algebraic cover and its integral models. Reduced norms, their open local images and good integral images determine the restricted-product quotient topology, as recorded in the quaternion norm gap. A chosen point homomorphism or bijection of square classes is insufficient.
API Approximation.residualQuotient.commGroup: residualQuotient is a commutative topological group.
Signature omitted — RG2.1/RG2.3 must supply the actual simply connected algebraic cover and its integral models. Reduced norms, their open local images and good integral images determine the restricted-product quotient topology, as recorded in the quaternion norm gap. A chosen point homomorphism or bijection of square classes is insufficient.
API Approximation.residualQuotient.piPlus: piPlus : G(𝔸) →* residualQuotient, continuous and surjective.
Signature omitted — RG2.1/RG2.3 must supply the actual simply connected algebraic cover and its integral models. Reduced norms, their open local images and good integral images determine the restricted-product quotient topology, as recorded in the quaternion norm gap. A chosen point homomorphism or bijection of square classes is insufficient.
API Approximation.residualQuotient.piPlus_rational: piPlus (diagonal γ) = 1.
Signature omitted — RG2.1/RG2.3 must supply the actual simply connected algebraic cover and its integral models. Reduced norms, their open local images and good integral images determine the restricted-product quotient topology, as recorded in the quaternion norm gap. A chosen point homomorphism or bijection of square classes is insufficient.
Test Approximation.residualQuotient_sl2: For SL_2 the residual quotient is trivial.
Example omitted — RG2.1/RG2.3 must supply the actual simply connected algebraic cover and its integral models. Reduced norms, their open local images and good integral images determine the restricted-product quotient topology, as recorded in the quaternion norm gap. A chosen point homomorphism or bijection of square classes is insufficient.
Test Approximation.residualQuotient_pgl2: For PGL_2/ℚ, residualQuotient ≃ ℚ^×\𝔸^×/𝔸^{×2}.
Example omitted — RG2.1/RG2.3 must supply the actual simply connected algebraic cover and its integral models. Reduced norms, their open local images and good integral images determine the restricted-product quotient topology, as recorded in the quaternion norm gap. A chosen point homomorphism or bijection of square classes is insufficient.
Test Approximation.residualQuotient_not_G_mod_plus: G(𝔸)/G(𝔸)^+ itself is not compact for PGL_2: it is 𝔸^×/𝔸^{×2}, only locally compact (Khayutin E40).
Example omitted — RG2.1/RG2.3 must supply the actual simply connected algebraic cover and its integral models. Reduced norms, their open local images and good integral images determine the restricted-product quotient topology, as recorded in the quaternion norm gap. A chosen point homomorphism or bijection of square classes is insufficient.

### AdelicAlgebraicGroups:AA.4/quaternion-reduced-norm-image — Reduced norms of a quaternion algebra over ℚ
Hypotheses: B a quaternion algebra over ℚ
Contract: For a quaternion algebra B over ℚ: Nrd(B_p^×) = ℚ_p^× for every prime p; Nrd(B_∞^×) = ℝ^× if B is split at ∞ and ℝ_{>0} otherwise; and Nrd(B^×) = ℚ^× if B is split at ∞, ℚ_{>0} otherwise (Hasse–Schilling–Maass).
Signature omitted — RG2.1/RG2.3 must supply the actual simply connected algebraic cover and its integral models. Reduced norms, their open local images and good integral images determine the restricted-product quotient topology, as recorded in the quaternion norm gap. A chosen point homomorphism or bijection of square classes is insufficient.

### AdelicAlgebraicGroups:AA.4/reduced-norm-components — The reduced norm on the residual quotient
Hypotheses: B a quaternion algebra over ℚ; G = PB^×
Contract: For G = PB^× with B a quaternion algebra over ℚ, the reduced norm induces an injective continuous homomorphism of locally compact groups Nrd : G(𝔸)/G(𝔸)^+ → 𝔸^×/𝔸^{×2}, and a bijection (indeed an isomorphism of compact groups) G_res ≃ ℚ^×\𝔸^×/𝔸^{×2} whether or not B is split at ∞. Neither G(𝔸)/G(𝔸)^+ nor 𝔸^×/𝔸^{×2} is compact.
Signature omitted — RG2.1/RG2.3 must supply the actual simply connected algebraic cover and its integral models. Reduced norms, their open local images and good integral images determine the restricted-product quotient topology, as recorded in the quaternion norm gap. A chosen point homomorphism or bijection of square classes is insufficient.

### AdelicAlgebraicGroups:AA.4/torus-image-residual — Images of tori in the residual quotient
Hypotheses: B quaternion over ℚ; E ⊂ B quadratic
Contract: For a quadratic field E ⊂ B and the torus T = E^×/ℚ^× ⊂ G = PB^×, π^+([T(𝔸)]) is a closed subgroup of G_res and Nrd ∘ π^+([T(𝔸)]) = ker χ_E, where χ_E : ℚ^×\𝔸^×/𝔸^{×2} → {±1} is the quadratic character of E/ℚ.
Signature omitted — RG2.1/RG2.3 must supply the actual simply connected algebraic cover and its integral models. Reduced norms, their open local images and good integral images determine the restricted-product quotient topology, as recorded in the quaternion norm gap. A chosen point homomorphism or bijection of square classes is insufficient.

### AdelicAlgebraicGroups:AA.4/residual-joint-limit — Limit behaviour of the residual spectrum
Hypotheses: as stated
Contract: Let B be a quaternion algebra over ℚ, G = PB^×, and for each i let T_i = E_i^×/ℚ^× ⊂ G be the torus of a quadratic field E_i ⊂ B, g_i, s_i ∈ G(𝔸), and μ_i the pushforward to [G(𝔸)] × [G(𝔸)] of the Haar probability measure of [T_i(𝔸)] under t ↦ ([t g_i], [t s_i g_i]). Suppose either the E_i are pairwise distinct (put H = G_res) or all equal one field E_0 (put H = ker(χ_{E_0} ∘ Nrd) < G_res). Then every weak-* limit point of (π^+ × π^+)_* μ_i is an H^Δ-invariant probability measure supported on a single coset of H^Δ; in general (π^+ × π^+)_* μ_i need not converge.
Signature omitted — This needs the actual compact Hausdorff residual/idele quotient from the preceding canonical norm maps and CompactGroups layer 5 character/Fourier interfaces. The general weak-measure limit language cannot replace that identified quotient and its diagonal embeddings.

### AdelicAlgebraicGroups:AA.5/gl1-adelic-quotient — The GL_1 quotient is the idele class group
Hypotheses: F a number field
Contract: For G = G_m over a number field F: G(F)\G(𝔸_F) ≃ₜ* IdeleClassGroup F; G(𝔸_F)^1 is the group 𝔸_F^1 of norm-one ideles; A_G(ℝ)^0 = ℝ_{>0} embedded diagonally at the archimedean places; 𝔸_F^× = 𝔸_F^1 × ℝ_{>0}; and F^×\𝔸_F^1 is compact while F^×\𝔸_F^× is not.
Signature omitted — GlobalNumberFields layers 4–6 supply the actual idele norm/unit topology and finite-idele class maps; the canonical logarithmic unit lattice and specified level then define these spaces. AlgebraicTopology stage 6 supplies actual torus cohomology and its translation maps. An arbitrary torus or chosen equivalence would omit the component/level assertion.

### AdelicAlgebraicGroups:AA.5/gl1-class-number — GL_1 class number
Hypotheses: F a number field
Contract: For G = G_m over F and U = Ô^× = ∏_v 𝒪_v^×, G(F)\G(𝔸_f)/U ≃ Cl(𝒪_F), so its cardinality is the class number of F.
Signature omitted — GlobalNumberFields layers 4–6 supply the actual idele norm/unit topology and finite-idele class maps; the canonical logarithmic unit lattice and specified level then define these spaces. AlgebraicTopology stage 6 supplies actual torus cohomology and its translation maps. An arbitrary torus or chosen equivalence would omit the component/level assertion.

### AdelicAlgebraicGroups:AA.5/gl1-XQ-components — Geometry of the GL_1 arithmetic quotients X_Q
Hypotheses: F a number field; Q, p, n as stated
Contract: For a finite set Q of finite places with N(v) ≡ 1 mod p^n, let U_Q = K_∞ × ∏_v U_{Q,v}, where K_∞ ≅ (S¹)^{r₂} is the identity component of the maximal compact subgroup of (F ⊗ ℝ)^×, U_{Q,v} = 𝒪_v^× for v ∉ Q and the index-p^n subgroup of 𝒪_v^× for v ∈ Q, and X_Q = F^×\𝔸_F^×/U_Q A_∞^0 with A_∞^0 = A_{G_m}(ℝ)^0. Each connected component of X_Q is a compact torus (S¹)^{r₁+r₂−1}, and π_0(X_Q) = F^×\𝔸_F^×/U_Q (F ⊗ ℝ)^{×,0}, an extension of the narrow class group of F by a quotient of ∏_{v∈Q} 𝒪_v^×/𝒪_v^{×p^n} (not, in general, the maximal exponent-p^n quotient of the ray class group).
Signature omitted — GlobalNumberFields layers 4–6 supply the actual idele norm/unit topology and finite-idele class maps; the canonical logarithmic unit lattice and specified level then define these spaces. AlgebraicTopology stage 6 supplies actual torus cohomology and its translation maps. An arbitrary torus or chosen equivalence would omit the component/level assertion.

### AdelicAlgebraicGroups:AA.5/gl1-component-dimension — The invariant l0 for GL_1
Hypotheses: F a number field
Contract: Every connected component of X_Q has dimension r₁ + r₂ − 1 = NumberField.Units.rank F, the value of Calegari–Geraghty's invariant l0 for G = GL_1/F; in particular its cohomology vanishes above degree r₁ + r₂ − 1.
Signature omitted — GlobalNumberFields layers 4–6 supply the actual idele norm/unit topology and finite-idele class maps; the canonical logarithmic unit lattice and specified level then define these spaces. AlgebraicTopology stage 6 supplies actual torus cohomology and its translation maps. An arbitrary torus or chosen equivalence would omit the component/level assertion.

### AdelicAlgebraicGroups:AA.5/gl1-H0 — Degree-zero cohomology of X_Q
Hypotheses: as in gl1-XQ-components
Contract: The ℤ_p-module of locally constant functions X_Q → ℤ_p is free on π_0(X_Q): H^0(X_Q, ℤ_p) ≅ ℤ_p[π_0(X_Q)].
Signature omitted — GlobalNumberFields layers 4–6 supply the actual idele norm/unit topology and finite-idele class maps; the canonical logarithmic unit lattice and specified level then define these spaces. AlgebraicTopology stage 6 supplies actual torus cohomology and its translation maps. An arbitrary torus or chosen equivalence would omit the component/level assertion.

### AdelicAlgebraicGroups:AA.5/gl1-hecke-action — Hecke and diamond operators for GL_1
Hypotheses: as in gl1-XQ-components
Contract: For v∉Q the GL₁ Hecke operator of the finite idele π_v is right translation, and for v∈Q a unit α gives the diamond translation. Each permutes π₀(X_Q) by its finite idele class. Under the natural exterior-power identification of torus cohomology, translation induces the identity within the torus factor and the indicated permutation of the component factors in every degree.
Signature omitted — GlobalNumberFields layers 4–6 supply the actual idele norm/unit topology and finite-idele class maps; the canonical logarithmic unit lattice and specified level then define these spaces. AlgebraicTopology stage 6 supplies actual torus cohomology and its translation maps. An arbitrary torus or chosen equivalence would omit the component/level assertion.

### AdelicAlgebraicGroups:AA.5/gl2-upper-half-plane-component — The GL_2/ℚ quotient and the upper half-plane
Hypotheses: G = GL_2/ℚ; U compact open
Contract: For G = GL_2 over ℚ, K_∞ = ℝ^× SO(2) and U ⊂ GL_2(𝔸_f) compact open, G(ℚ)\G(𝔸)/K_∞U ≃ ⊔_{c ∈ ℚ_{>0}\𝔸_f^×/det U} Γ_c\ℍ, where Γ_c = GL_2(ℚ)^+ ∩ g_c U g_c⁻¹ for g_c ∈ GL_2(𝔸_f) with det g_c = c, acting on ℍ by Möbius transformations; for det U = ℤ̂^× there is a single component.
Signature omitted — The raw/folded matrix formulas are native above. The full adelic statement needs RG2.0 canonical GL₂ point topology, actual principal finite congruence level, and the arithmetic quotient comparison from ModularCurvesPartII:R12.2. A generic upper-half-plane action alone does not specify the SO(2)/O(2) component maps.

### AdelicAlgebraicGroups:AA.5/gl2-principal-level — Principal congruence level
Hypotheses: N ≥ 1
Contract: For U = K(N) = ker(GL_2(ℤ̂) → GL_2(ℤ/N)), det K(N) = {x ∈ ℤ̂^× : x ≡ 1 mod N}, the components are indexed by (ℤ/N)^×, and each Γ_c is Γ(N) = ker(SL_2(ℤ) → SL_2(ℤ/N)) (Mathlib CongruenceSubgroup.Gamma).
Signature omitted — The raw/folded matrix formulas are native above. The full adelic statement needs RG2.0 canonical GL₂ point topology, actual principal finite congruence level, and the arithmetic quotient comparison from ModularCurvesPartII:R12.2. A generic upper-half-plane action alone does not specify the SO(2)/O(2) component maps.

### AdelicAlgebraicGroups:AA.5/definite-quaternion-compact — Compactness for a definite quaternion algebra
Hypotheses: D a quaternion division algebra over ℚ with D ⊗ ℝ ≅ ℍ (Hamilton)
Contract: For a definite quaternion algebra D over ℚ and G = D^×: G(ℚ)\G(𝔸)^1 is compact; G(ℚ)\G(𝔸_f)/U is finite for every compact open U; each Γ_{x,U} = D^× ∩ xUx⁻¹ is finite; and D^×/ℚ^× is discrete in (D ⊗ 𝔸_f)^×/𝔸_f^×.
Signature omitted — The actual definite quaternion algebraic group, order/unit level and canonical finite/real point topology are required. The Hurwitz/Eichler gap specifies the concrete class/unit/index computations. An arbitrary finite class set or mass cannot replace this validation.

### AdelicAlgebraicGroups:AA.5/definite-quaternion-mass — Volume comparison under level change for a definite quaternion algebra
Hypotheses: D definite; U′ ⊂ U compact open
Contract: For D definite over ℚ and compact open U′ ⊂ U ⊂ (D ⊗ 𝔸_f)^×, with Γ_x = (D^× ∩ xUx⁻¹)/(ℚ^× ∩ U) the finite stabilizers: ∑_{x ∈ Cl(U′)} 1/|Γ′_x| = [U : U′]/[ℚ^× ∩ U : ℚ^× ∩ U′] · ∑_{x ∈ Cl(U)} 1/|Γ_x|, where Cl(U) = D^×\(D ⊗ 𝔸_f)^×/U.
Signature omitted — The actual definite quaternion algebraic group, order/unit level and canonical finite/real point topology are required. The Hurwitz/Eichler gap specifies the concrete class/unit/index computations. An arbitrary finite class set or mass cannot replace this validation.

### AdelicAlgebraicGroups:AA.0/directed-supremum-measure — Directed suprema of compatible measures
Hypotheses: (U_S) countable, directed and covering; compatibility ν_{S'}|_{U_S} = ν_S
Contract: Let X be a measurable space, (U_S) a countable directed family of measurable sets covering X and ν_S measures with ν_S supported on U_S and ν_{S'}|_{U_S} = ν_S for S ⊆ S'. Then E ↦ sup_S ν_S(E ∩ U_S) is a measure ν on X with ν|_{U_S} = ν_S for every S, and it is the unique measure with this property.
Native equivalent signature(s): RestrictedProduct.haarProduct, RestrictedProduct.haarProduct_eq_of_restrict.

### AdelicAlgebraicGroups:AA.0/local-normalized-haar — Normalized local Haar measures
Hypotheses: K a number field; v a finite place
Contract: For a number field K and a finite place v there is a unique additive Haar measure μ_v on K_v with μ_v(𝒪_v) = 1; for a ∈ K_v^×, map (a · ·) μ_v = |a|_v⁻¹ • μ_v with |a|_v = q_v^{−v(a)}.
Native equivalent signature(s): RestrictedProduct.exists_normalized_haar.

### AdelicAlgebraicGroups:AA.1/points-product-ring — Points over a product of rings
Hypotheses: H a commutative Hopf algebra over F
Contract: For commutative F-algebras R₁, R₂ (and more generally a finite product), WithConv (H →ₐ[F] R₁ × R₂) ≃* WithConv (H →ₐ[F] R₁) × WithConv (H →ₐ[F] R₂), naturally and as topological groups for the affine-points topology.
Signature omitted — RG2.0 must supply the affine-points evaluation topology and its group/embedding instances on these actual Hopf carriers; GlobalNumberFields layers 4–6 supply canonical local compactness and units topology. The algebraic carrier is native, but those general canonical instances are not pinned. No arbitrary topology is supplied.

### AdelicAlgebraicGroups:AA.1/finite-adeles-directed-union — Finite adeles as a directed union of S-adeles
Hypotheses: H finitely generated; 𝓗 an integral model; F is a number field and O(G) is a finite-type commutative Hopf F-algebra; integral generic-fibre identifications respect the Hopf structure.
Contract: For finite sets S of finite places, the S-adeles 𝔸_{F,S} = ∏_{v∈S} F_v × ∏_{v∉S} 𝒪_v are open subrings of 𝔸_{F,f} forming a directed union, and every F-algebra map H → 𝔸_{F,f} from a finitely generated H restricts to a map of models 𝓗 → 𝔸_{F,S} for S large: G(𝔸_{F,f}) = ⋃_S 𝓗(𝔸_{F,S}).
Signature omitted — RG2.0 must supply the affine-points evaluation topology and its group/embedding instances on these actual Hopf carriers; GlobalNumberFields layers 4–6 supply canonical local compactness and units topology. The algebraic carrier is native, but those general canonical instances are not pinned. No arbitrary topology is supplied.

### AdelicAlgebraicGroups:AA.1/restricted-product-bijection — The restricted-product bijection on S-adelic points
Hypotheses: 𝓗 affine over 𝒪_{F,S}; F is a number field and O(G) is a finite-type commutative Hopf F-algebra; integral generic-fibre identifications respect the Hopf structure.
Contract: For a fixed affine finitely presented model over O_{F,S}, the evaluation map from its S′-adelic points to ∏_{v∈S′}G(F_v)×∏_{v∉S′}𝓗(O_v), for finite S′⊃S, is a bijection. This is a set and group statement; the topology is proved separately.
Signature omitted — RG2.0 must supply the affine-points evaluation topology and its group/embedding instances on these actual Hopf carriers; GlobalNumberFields layers 4–6 supply canonical local compactness and units topology. The algebraic carrier is native, but those general canonical instances are not pinned. No arbitrary topology is supplied.

### AdelicAlgebraicGroups:AA.1/modular-character-trivial-compact-centre — The modular character on compact and central elements
Hypotheses: G locally compact
Contract: For a locally compact group G, the modular character Δ : G → ℝ_{>0} is a continuous homomorphism trivial on every compact subgroup and on the centre of G, and it is invariant under conjugation.
Signature omitted — RG2.0 supplies canonical local point topology and RG2.1 supplies the field-generic torus/root and adjoint structure. The group-theoretic modular statement cannot be specialized to unspecified point topologies or generic reductive data fields.

### AdelicAlgebraicGroups:AA.1/weyl-orbit-product-central — Weyl orbit products lie in the split centre up to finite index
Hypotheses: G connected reductive; A maximal split torus
Contract: Let A be a maximal split torus of a connected reductive group over a field and W its relative Weyl group. For a ∈ A(E), the product ∏_{w∈W} w(a) lies in (Z(G) ∩ A)(E) up to an element of a finite group; in particular some power of it lies in the split centre.
Signature omitted — RG2.0 supplies canonical local point topology and RG2.1 supplies the field-generic torus/root and adjoint structure. The group-theoretic modular statement cannot be specialized to unspecified point topologies or generic reductive data fields.

### AdelicAlgebraicGroups:AA.2/bruhat-section — Averaging over a closed subgroup is surjective on compact supports
Hypotheses: G locally compact Hausdorff; H closed; dh a right Haar measure on H
Contract: For a closed subgroup H of a locally compact group G and a right Haar measure dh on H, the map P : C_c(G) → C_c(H\G), (Pf)(Hg) = ∫_H f(hg) dh, is surjective, and every f ≥ 0 in C_c(H\G) is Pφ for some φ ≥ 0.
Signature omitted — The native closed-subgroup right-Haar quotient interfaces are above. This adelic specialization or iterated-quotient contract additionally requires the canonical RG2.0 point topology, split/central quotient embeddings and their quotient-measure comparison; those maps are retained as exact mathematical contracts.

### AdelicAlgebraicGroups:AA.2/quotient-functional-well-defined — Weil's functional is well defined under the modular condition
Hypotheses: G locally compact Hausdorff; H a closed subgroup; dg and dh right Haar measures; Δ_G|_H = Δ_H, using the pinned Mathlib modular-character convention
Contract: If Δ_G|_H = Δ_H, then for f ∈ C_c(G), Pf = 0 implies ∫_G f dg = 0; hence Pf ↦ ∫_G f dg is a well-defined positive G-invariant functional on C_c(H\G).
Signature omitted — The native closed-subgroup right-Haar quotient interfaces are above. This adelic specialization or iterated-quotient contract additionally requires the canonical RG2.0 point topology, split/central quotient embeddings and their quotient-measure comparison; those maps are retained as exact mathematical contracts.

### AdelicAlgebraicGroups:AA.2/gauge-form-restriction-discriminant — Gauge forms under restriction of scalars
Hypotheses: E/F finite; ω_E a gauge form
Contract: Choose an F-basis β of E and an E-basis of the cotangent space dual to the E-gauge ω_E. Let ω_β be the F-top form dual to the ordered F-basis β_j e_i of the restricted cotangent space. At v, transport |ω_β|_v to G_E(∏_{w|v}E_w); it equals j_{β,v}^d∏_{w|v}|ω_E|_w. Here j_{β,v} is defined by (β-coordinates)_*μ_{F_v}^{[E:F]}=j_{β,v}∏_{w|v}μ_{E_w}. It depends on β and is not an unspecified square root of a local discriminant.
Signature omitted — The native closed-subgroup right-Haar quotient interfaces are above. This adelic specialization or iterated-quotient contract additionally requires the canonical RG2.0 point topology, split/central quotient embeddings and their quotient-measure comparison; those maps are retained as exact mathematical contracts.

### AdelicAlgebraicGroups:AA.2/artin-factor-induction — Inductivity of the convergence factors
Hypotheses: E/F finite; X with finite image
Contract: For a finite separable E/F and a finite-image complex Galois representation X over E, the induced representation satisfies L_v(Ind X,s)=∏_{w|v}L_w(X,s) at every finite v, including ramified v with inertia invariants. Consequently their global Euler products coincide for Re(s)>1 and their leading coefficients coincide whenever the stated nonzero limits at s=1 exist.
Signature omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.

### AdelicAlgebraicGroups:AA.3/gln-real-reduction — Reduction for GL_n(ℝ)
Hypotheses: n ≥ 1
Contract: There are C > 0 and a standard Siegel set 𝔖 ⊂ GL_n(ℝ) (with respect to O(n) and the upper triangular Borel) such that GL_n(ℝ) = GL_n(ℤ)·𝔖; equivalently every positive definite form is GL_n(ℤ)-equivalent to an (e, C)-reduced form for the standard basis e.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/gln-adelic-covering — Adelic reduction for GL_n over ℚ
Hypotheses: n ≥ 1
Contract: For a standard Siegel domain 𝔖 of GL_n(ℝ), GL_n(𝔸_ℚ) = GL_n(ℚ) · (𝔖 × GL_n(ℤ̂)).
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/self-adjoint-reduction — Reduction for reductive subgroups of GL_n
Hypotheses: G reductive over ℚ; self-adjoint embedding
Contract: Let G ⊂ GL_n be reductive over ℚ with a(G(ℝ))a⁻¹ self-adjoint for some a ∈ SL_n(ℝ). There are finitely many b_i ∈ GL_n(ℚ) such that ⋃_i (a⁻¹𝔖 GL_n(ℤ̂) b_i ∩ G(𝔸)) is a fundamental set for G(ℚ) in G(𝔸).
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/closed-orbit-finiteness — Rational points on closed orbits
Hypotheses: G, H reductive
Contract: Let G be reductive over F, H ⊂ G a reductive F-subgroup and σ : G → H\G. Then σ_𝔸(G(𝔸)) ∩ (H\G)(F) is a finite union of G(F)-orbits.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/siegel-set-finite-measure — Siegel sets in G(𝔸)^1 have finite measure
Hypotheses: G connected reductive; ω compact
Contract: For an adelic Siegel set 𝔖 = 𝔖(T₁, ω), the measure of 𝔖 ∩ G(𝔸)^1 is finite.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/parabolic-double-cosets-finite — Finitely many G(𝒪)-orbits on rational flags
Hypotheses: G connected; P parabolic over F
Contract: For connected G and an F-parabolic P, (G/P)(F) is a finite union of orbits of an arithmetic subgroup; equivalently G(F) = ⋃_{i∈I} Γ x_i P(F) with I finite.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.4/strong-approximation-finite-places — Strong approximation through finitely many places
Hypotheses: S ⊇ archimedean places
Contract: For S containing the archimedean places, G has strong approximation with respect to S iff for every finite set S₁ of places disjoint from S, the S ∪ S₁-arithmetic group G(𝒪(S ∪ S₁)) is dense in G_{S₁} = ∏_{v∈S₁} G(F_v).
Signature omitted — RG2.0/RG2.1/RG2.4 supply canonical arithmetic local group/Lie/torus objects. The recorded analytic, density, cohomological, native-field or anisotropic gaps specify the remaining proof input. No generic Zariski-density assertion on an arbitrary subgroup replaces the full arithmetic subgroup.

### AdelicAlgebraicGroups:AA.4/s-arithmetic-nondiscrete — S-arithmetic groups are not discrete at an extra place
Hypotheses: G_S noncompact; F a number field; G connected absolutely almost simple; S finite containing the archimedean places; S₁ finite, nonempty and disjoint from S
Contract: If G is absolutely almost simple, G_S is noncompact and S₁ is finite, nonempty and disjoint from S, then the image of G(𝒪(S ∪ S₁)) in G_{S₁} is not discrete and is infinite.
Signature omitted — RG2.0/RG2.1/RG2.4 supply canonical arithmetic local group/Lie/torus objects. The recorded analytic, density, cohomological, native-field or anisotropic gaps specify the remaining proof input. No generic Zariski-density assertion on an arbitrary subgroup replaces the full arithmetic subgroup.

### AdelicAlgebraicGroups:AA.4/padic-ball-torsion-free — Principal units of small radius are torsion free
Hypotheses: p prime
Contract: In an algebraic closure of ℚ_p, the multiplicative group {λ : |λ − 1|_p < p^{−1/(p−1)}} contains no root of unity other than 1; in particular eigenvalues of elements of 1 + pM_n(ℤ_p) (p ≥ 3) or 1 + 4M_n(ℤ_2) generate a torsion-free group.
Signature omitted — The actual coordinate-algebra neatness and relative-level signatures are above; the algebraic-group meaning fixes a closed faithful representation. Concrete compact/congruence levels require RG2.0/RG2.3 canonical point/model topology and the actual completed valuation/eigenvalue field interface. The existence theorem also uses the coordinate-comodule supplier. No arbitrary abstract point representation is admitted.

### AdelicAlgebraicGroups:AA.4/level-action-free-at-neat — Free action of finite level groups at neat level
Hypotheses: U neat; U′ normal in U; K∞ contains A_G(ℝ)^0 and is compact modulo it
Contract: For neat compact open U, normal open U′⊂U, and K∞ containing A_G(ℝ)^0 and compact modulo it, the full group U/U′ acts freely and properly discontinuously on X_{U′}. Rational stabilizers are finite, and neatness makes them trivial; the central rational kernel is trivial in this scope.
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.

### AdelicAlgebraicGroups:AA.5/gl2-real-quotient — GL_2(ℝ) modulo ℝ^× SO(2)
Hypotheses: The groups and maps are the concrete ones specified in the statement.
Contract: GL_2(ℝ)/ℝ^× SO(2) is homeomorphic to ℍ^± = ℂ ∖ ℝ through g ↦ g·i, equivariantly for the Möbius action; GL_2(ℝ)^+ acts transitively on ℍ with stabilizer ℝ^× SO(2) at i.
Signature omitted — The raw/folded matrix formulas are native above. The full adelic statement needs RG2.0 canonical GL₂ point topology, actual principal finite congruence level, and the arithmetic quotient comparison from ModularCurvesPartII:R12.2. A generic upper-half-plane action alone does not specify the SO(2)/O(2) component maps.

### AdelicAlgebraicGroups:AA.4/homogeneous-measure-pushforward — Pushforward of a homogeneous measure to a compact abelian quotient
Hypotheses: C compact abelian; π continuous surjective homomorphism; Λ\T compact
Contract: Let C be a compact abelian group, π : G → C a continuous surjective homomorphism, T ≤ G a closed subgroup with Λ ≤ T discrete and Λ\T compact (as for [T(𝔸)] with T anisotropic modulo the centre), and μ the T-invariant probability measure on Λ\T g. If π(Λ) = 1, then π_*μ is the Haar probability measure of the coset π(T)·π(g) of the closed subgroup π(T).
Signature omitted — This needs the actual compact Hausdorff residual/idele quotient from the preceding canonical norm maps and CompactGroups layer 5 character/Fourier interfaces. The general weak-measure limit language cannot replace that identified quotient and its diagonal embeddings.

### AdelicAlgebraicGroups:AA.4/chabauty-limit-kernels — Kernels of distinct characters converge to the whole group
Hypotheses: C compact abelian; χ_i pairwise distinct
Contract: Let C be a compact abelian group and (χ_i) a sequence of pairwise distinct continuous characters C → {±1}. Then the closed subgroups ker χ_i converge to C in the Chabauty topology; consequently any weak-* limit of probability measures invariant under ker χ_i is C-invariant.
Signature omitted — This needs the actual compact Hausdorff residual/idele quotient from the preceding canonical norm maps and CompactGroups layer 5 character/Fourier interfaces. The general weak-measure limit language cannot replace that identified quotient and its diagonal embeddings.

### AdelicAlgebraicGroups:AA.2/fundamental-domain-exists — Borel fundamental domains for countable discrete subgroups
Hypotheses: G second countable locally compact Hausdorff; Γ countable and discrete
Contract: Let G be a second countable locally compact Hausdorff group and Γ ≤ G a countable discrete subgroup acting by left translation. There is a Borel set D ⊂ G meeting every orbit Γg in exactly one point.
Signature omitted — The native closed-subgroup right-Haar quotient interfaces are above. This adelic specialization or iterated-quotient contract additionally requires the canonical RG2.0 point topology, split/central quotient embeddings and their quotient-measure comparison; those maps are retained as exact mathematical contracts.

### AdelicAlgebraicGroups:AA.2/tamagawa-convergence-gln — Corrected volumes for GL_n and SL_n
Hypotheses: n ≥ 1
Contract: For the standard models of GL_n and SL_n over 𝒪_F and their standard gauge forms, at every finite place v: λ_v · #GL_n(k_v) q_v^{-n²} = ∏_{i=2}^{n} (1 − q_v^{-i}) with λ_v = (1 − q_v^{-1})^{-1}, and #SL_n(k_v) q_v^{-(n²−1)} = ∏_{i=2}^{n} (1 − q_v^{-i}); both products over v converge absolutely.
Signature omitted — The native closed-subgroup right-Haar quotient interfaces are above. This adelic specialization or iterated-quotient contract additionally requires the canonical RG2.0 point topology, split/central quotient embeddings and their quotient-measure comparison; those maps are retained as exact mathematical contracts.

### AdelicAlgebraicGroups:AA.3/arithmetic-quotient-finite-volume — Arithmetic quotients have finite volume
Hypotheses: G connected reductive; U compact open
Contract: For connected reductive G over F and Γ = G(F) ∩ U with U ⊂ G(𝔸_{F,f}) compact open, Γ\(G(F_∞)/A_G(ℝ)^0) has finite invariant volume.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/division-algebra-no-unipotent — Division algebras have no nontrivial unipotent units
Hypotheses: D a division algebra
Contract: If D is a division algebra over a field of characteristic 0, then D^× contains no unipotent element other than 1.
Native equivalent signature(s): Reduction.eq_one_of_isNilpotent_sub_one.

### AdelicAlgebraicGroups:AA.3/arithmetic-quotient-compact — Arithmetic quotients of anisotropic groups are compact
Hypotheses: G connected reductive
Contract: In the setting of arithmetic-quotient-finite-volume, Γ\(G(F_∞)/A_G(ℝ)^0) is compact iff G^der is F-anisotropic; for an anisotropic inner form SL_1(D) of a central division algebra D, H(F)\H(𝔸_F) and Γ\H(F_∞) are compact.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.4/level-quotient-hausdorff — Level quotients are Hausdorff
Hypotheses: U compact open; K_∞ as stated
Contract: For compact open U and K_∞ compact modulo A_G(ℝ)^0 containing A_G(ℝ)^0, the level quotient X_U is Hausdorff and locally compact, and G(F) acts properly discontinuously on G(𝔸)/K_∞U.
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.

### AdelicAlgebraicGroups:AA.4/hecke-degree-double-coset — Degree of a Hecke correspondence
Hypotheses: U compact open
Contract: For compact open U and g∈G(𝔸_f), UgU is the disjoint union of [U:U∩gUg⁻¹] right U-cosets, represented by u g. In the compact-modulo-A_G neat scope, p₁:X_{U∩gUg⁻¹}→X_U is a covering of exactly that degree; the rational central kernel is trivial.
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.

### AdelicAlgebraicGroups:AA.5/gl1-units-lattice — Units at level U_Q form a lattice of rank r₁ + r₂ − 1
Hypotheses: F a number field; U compact open
Contract: For a compact open U ⊂ Ô^×, Γ_U = F^× ∩ U is a finite-index subgroup of 𝒪_F^×, and its image under the logarithmic embedding is a lattice of rank r₁ + r₂ − 1 in the trace-zero hyperplane of ℝ^{r₁+r₂}.
Signature omitted — GlobalNumberFields layers 4–6 supply the actual idele norm/unit topology and finite-idele class maps; the canonical logarithmic unit lattice and specified level then define these spaces. AlgebraicTopology stage 6 supplies actual torus cohomology and its translation maps. An arbitrary torus or chosen equivalence would omit the component/level assertion.

### AdelicAlgebraicGroups:AA.0/mixed-space-topology — Topology of the infinite-adele mixed-space comparison
Hypotheses: F a number field
Contract: The canonical ring equivalence ringEquiv_mixedSpace F and its inverse are continuous for the product topologies, so it upgrades to a ring homeomorphism.
Native equivalent signature(s): NumberField.InfiniteAdeleRing.continuous_ringEquiv_mixedSpace.

### AdelicAlgebraicGroups:AA.2/left-right-quotient-inversion — Inversion between left and right quotient conventions
Hypotheses: G second countable locally compact Hausdorff and unimodular; Γ a countable discrete subgroup; normalized Haar μ is left and right invariant; Use the fundamental-domain quotient measures and the integrability/measurability hypotheses of the pinned theorem
Contract: For a locally compact unimodular G and discrete countable Γ, inversion sends Γg to g⁻¹Γ, giving a homeomorphism Γ\G≃G/Γ that preserves the correspondingly normalized quotient measures. It carries left-orbit unfolding to the pinned right Γ.op-orbit unfolding.
Signature omitted — The native closed-subgroup right-Haar quotient interfaces are above. This adelic specialization or iterated-quotient contract additionally requires the canonical RG2.0 point topology, split/central quotient embeddings and their quotient-measure comparison; those maps are retained as exact mathematical contracts.

### AdelicAlgebraicGroups:AA.5/upper-half-plane-action-conventions — Raw Möbius action and the Mathlib folded action
Hypotheses: g∈GL₂(ℝ), z∈ℂ with Im z≠0
Contract: The raw Möbius maps of GL₂(ℝ) induce an action on ℍ±=ℂ∖ℝ. Folding the lower half-plane by conjugation is equivariant for this action and Mathlib glAction on ℍ. For positive determinant the raw and folded formulas coincide; diag(1,−1) sends i to −i in the raw action and fixes i in glAction. The existing pinned imaginary-part and denominator formulas supply the carrier and sign checks.
Native equivalent signature(s): AdelicExamples.rawMoebius, AdelicExamples.rawMoebius_im, AdelicExamples.rawMoebius_mul, AdelicExamples.folded_eq_glAction.

### AdelicAlgebraicGroups:AA.0/summable-log-product — Positive convergent products
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For a countable family a_i>0 of real numbers with ∑_i |a_i−1|<∞, the net of finite products has a positive finite limit C. Deleting a finite set S divides C by ∏_{i∈S}a_i; equivalently ∑ log a_i converges absolutely and C=exp(∑ log a_i).
Native equivalent signature(s): RestrictedProduct.positive_tprod_of_summable_sub_one.

### AdelicAlgebraicGroups:AA.0/convergent-haar-product — Convergent restricted products of local Haar measures
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: Let G_i be countably many second countable locally compact Hausdorff groups, B_i open and compact cofinitely, and μ_i left Haar measures. Choose finite S containing the noncompact B_i. Put a_i=μ_i(B_i)∈(0,∞) for i∉S, suppose ∑_{i∉S}|a_i−1|<∞, and let C_S=∏_{i∉S}a_i>0. Define the convergent product as C_S times the normalized restricted Haar product of μ_i for i∈S and a_i⁻¹μ_i for i∉S. It is independent of S.
Native carrier/API part: the named signatures below. Full structural specializations remain subject to their recorded conditions.
API RestrictedProduct.convergentHaarProduct: Let G_i be countably many second countable locally compact Hausdorff groups, B_i open and compact cofinitely, and μ_i left Haar measures. Choose finite S containing the noncompact B_i. Put a_i=μ_i(B_i)∈(0,∞) for i∉S, suppose ∑_{i∉S}|a_i−1|<∞, and let C_S=∏_{i∉S}a_i>0. Define the convergent product as C_S times the normalized restricted Haar product of μ_i for i∈S and a_i⁻¹μ_i for i∉S. It is independent of S.
Native signature above.
API RestrictedProduct.convergentHaarProduct_independent_exceptionalSet: Enlarging the finite exceptional set leaves the measure unchanged.
Native signature above.
API RestrictedProduct.convergentHaarProduct_isHaarMeasure: The convergent product is a nonzero Haar measure.
Native signature above.
API RestrictedProduct.convergentHaarProduct_box: If C_i=B_i off finite T⊃S, its box mass is (∏_{i∈T}μ_i(C_i))·∏_{i∉T}a_i.
Native signature above.
Test RestrictedProduct.convergentHaarProduct_normalized: When every a_i=1 the measure equals haarProduct, including its integral box of mass 1.
Native example above.
Test RestrictedProduct.convergentHaarProduct_single_rescale: Changing one local normalized Haar measure by c>0 multiplies the resulting measure by c.
Native example above.
Test RestrictedProduct.convergentHaarProduct_sl2_tail: For SL₂ good factors a_v=1−q_v⁻², the integral box mass is their positive infinite product, strictly less than 1 for a nonempty tail; eventual equality to 1 is unnecessary.
Example omitted — The carrier, Borel measure and compact/open subgroup language is native. The equivalent interface is given above by the restricted-product signatures; the separately named directed gluing proof is the measure constructor/uniqueness contract, not a new carrier.

### AdelicAlgebraicGroups:AA.0/convergent-product-independence — Independence under finite changes of integral subgroups
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: Changing compact open B_i at finitely many indices transports the convergent Haar product to the same measure on the canonically identified restricted product.
Native equivalent signature(s): RestrictedProduct.convergentHaarProduct_independent_exceptionalSet.

### AdelicAlgebraicGroups:AA.1/hopf-spreading — Spreading Hopf structure and its identities
Hypotheses: All objects, actions and measures have the hypotheses in the statement.; F is a number field and O(G) is a finite-type commutative Hopf F-algebra; integral generic-fibre identifications respect the Hopf structure.
Contract: A finitely presented affine F-algebra with Hopf structure descends to a finitely presented Hopf algebra over O_{F,S} after enlarging finite S. A prescribed finite collection of Hopf morphisms and their identities descends simultaneously.
Native equivalent signature(s): IntegralModel.exists.

### AdelicAlgebraicGroups:AA.1/restricted-product-topology — Topology of the restricted-product comparison
Hypotheses: All objects, actions and measures have the hypotheses in the statement.; F is a number field and O(G) is a finite-type commutative Hopf F-algebra; integral generic-fibre identifications respect the Hopf structure.
Contract: The bijection G(A_{F,f})→∏ʳ_v[G(F_v),B_v] induced by coordinate projections is a homeomorphism. On each S-integral principal piece it is the product homeomorphism of affine points, and the principal pieces are open on both sides.
Signature omitted — RG2.0 must supply the affine-points evaluation topology and its group/embedding instances on these actual Hopf carriers; GlobalNumberFields layers 4–6 supply canonical local compactness and units topology. The algebraic carrier is native, but those general canonical instances are not pinned. No arbitrary topology is supplied.

### AdelicAlgebraicGroups:AA.1/weil-restriction-naturality — Naturality of adelic restriction of scalars
Hypotheses: All objects, actions and measures have the hypotheses in the statement.; F is a number field and O(G) is a finite-type commutative Hopf F-algebra; integral generic-fibre identifications respect the Hopf structure.
Contract: For the Weil-restriction adjunction Res_{E/F}G(R)≃G(E⊗_F R), the adelic comparison commutes with every algebraic group morphism, the diagonal F→A_F, projections to F_v, and the canonical tensor associator for towers E/F/k.
Signature omitted — RG2.0a must supply the actual Weil-restriction group object and its natural point adjunction; GlobalNumberFields layer 8 must supply the canonical continuous adelic tensor comparison. Their objects and naturality squares have no pinned general interface. No chosen equivalence is substituted.

### AdelicAlgebraicGroups:AA.2/closed-homogeneous-space — Topology of a closed homogeneous quotient
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For a second countable locally compact Hausdorff group G and closed H, the left-orbit quotient H\G with its quotient topology is locally compact, Hausdorff and second countable; q:G→H\G is open. Over each compact subset of H\G there is a compact subset of G whose image contains it.
Native equivalent signature(s): QuotientMeasure.homogeneous_topology, QuotientMeasure.compact_lift.

### AdelicAlgebraicGroups:AA.2/fibre-average-continuous — Continuity and support of fibre averaging
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For f∈C_c(G,ℝ) and a right Haar dh on closed H, P f(Hg)=∫_H f(hg)dh is a continuous compactly supported function on H\G, with support contained in q(support f). It preserves positivity.
Native equivalent signature(s): QuotientMeasure.average_continuous_compact.

### AdelicAlgebraicGroups:AA.2/compact-quotient-cutoff — A cutoff over a compact part of the quotient
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For compact C⊂H\G there is β∈C_c(G,ℝ), β≥0, with Pβ=1 on C.
Native equivalent signature(s): QuotientMeasure.compact_cutoff.

### AdelicAlgebraicGroups:AA.2/right-haar-exchange — The right-Haar exchange identity
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: Assume Δ_G(h)=Δ_H(h) for h∈H, and dg,dh are right Haar measures. For f,β∈C_c(G), ∫_G β(g)Pf(Hg)dg = ∫_G f(g)Pβ(Hg)dg.
Native equivalent signature(s): QuotientMeasure.right_haar_exchange.

### AdelicAlgebraicGroups:AA.2/quotient-tonelli — Tonelli extension of quotient integration
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For a nonnegative Borel function f on G in the modular-compatible right-Haar setting, fibre integration is measurable on H\G and ∫_G f = ∫_{H\G}∫_H f(hg)dh. The identity is valid in [0,∞].
Native equivalent signature(s): QuotientMeasure.quotient_lintegral.

### AdelicAlgebraicGroups:AA.2/central-associated-line — The central-character measurable Hermitian line
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: With Γ=G(F), closed central X, XΓ closed, and continuous unitary ω trivial on X∩Γ, ξ(γz)=ω(z) defines a continuous unitary character of XΓ. The associated measurable Hermitian line field on XΓ\G has fibres (G×ℂ)/(hg,t)∼(g,ξ(h)⁻¹t). A Borel section of G→XΓ\G trivializes this field measurably; equivariant functions φ(hg)=ξ(h)φ(g) are its sections. Topological local triviality is not asserted for an arbitrary closed subgroup.
Signature omitted — This contract needs canonical adelic centre/adjoint quotient data from RG2.1 and the associated measurable line, Borel section and completion-identification language recorded in the central analytic gap. It is not represented by an arbitrary Hilbert space, a topological line bundle or an assumed unitary representation.

### AdelicAlgebraicGroups:AA.2/central-measurable-section — A measurable section and unitary cocycle
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For closed XΓ in the second countable adelic group there is a Borel section s:XΓ\G→G. With c(y,g)=s(y)g s(yg)⁻¹∈XΓ, right translation on sections is represented on quotient functions by ξ(c(y,g)) times translation y↦yg. Different sections give unitarily equivalent models.
Signature omitted — This contract needs canonical adelic centre/adjoint quotient data from RG2.1 and the associated measurable line, Borel section and completion-identification language recorded in the central analytic gap. It is not represented by an arbitrary Hilbert space, a topological line bundle or an assumed unitary representation.

### AdelicAlgebraicGroups:AA.2/central-l2-completeness — Completeness of central-character L² sections
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: Square-integrable measurable sections of the associated Hermitian line, modulo equality almost everywhere, form a complex Hilbert space with inner product ∫conj(φ)ψ. Right translation is unitary and strongly continuous.
Signature omitted — This contract needs canonical adelic centre/adjoint quotient data from RG2.1 and the associated measurable line, Borel section and completion-identification language recorded in the central analytic gap. It is not represented by an arbitrary Hilbert space, a topological line bundle or an assumed unitary representation.

### AdelicAlgebraicGroups:AA.2/central-character-extension-twist — Extension and twisting of a central character
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For X′⊂X with X′Γ\XΓ compact and continuous ω′ trivial on X′∩Γ, extend the resulting character of X′Γ/Γ to a continuous character ω₀ of XΓ/Γ. The operators ω₀(z)⁻¹R(z) define a strongly continuous unitary action of the compact abelian quotient XΓ/X′Γ on CentralCharL2(X′,ω′).
Signature omitted — This contract needs canonical adelic centre/adjoint quotient data from RG2.1 and the associated measurable line, Borel section and completion-identification language recorded in the central analytic gap. It is not represented by an arbitrary Hilbert space, a topological line bundle or an assumed unitary representation.

### AdelicAlgebraicGroups:AA.2/restriction-finite-jacobian — Finite-place scalar Jacobian for a chosen basis
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For β:F_v^n≃∏_{w|v}E_w, let L_{β,v}=∑_j O_vβ_j. With every valuation ring of volume 1, j_{β,v}=vol_{∏E_w}(L_{β,v})⁻¹. In particular j_{β,v}=1 when β is an O_v-basis of ∏_{w|v}O_w.
Signature omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.

### AdelicAlgebraicGroups:AA.2/restriction-infinite-jacobian — Archimedean scalar Jacobian for a chosen basis
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: If F_v=ℝ and E⊗F_v=ℝ^a×ℂ^b, let D_{β,v} be the real determinant of the basis map in real and imaginary coordinates. Then j_{β,v}=2⁻ᵇ|D_{β,v}|⁻¹. If F_v=ℂ, then j_{β,v}=|det_ℂ β|⁻². The factors use dx at real places and 2dxdy at complex places.
Signature omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.

### AdelicAlgebraicGroups:AA.2/restriction-global-jacobian — Global scalar Jacobian and absolute discriminants
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For an F-basis β of E, the positive factors j_{β,v} equal 1 at almost all finite v and ∏_v j_{β,v}=|d_F|^{[E:F]/2}|d_E|⁻¹/². Thus |d_F|⁻ⁿᵈ/²∏_v j_{β,v}^d=|d_E|⁻ᵈ/².
Signature omitted — The actual Galois character representation, inertia/Frobenius Artin determinants and positive leading coefficient, canonical gauge local measures and Weil-restriction differential/Jacobian comparisons are required. They are supplied by RG2.0a/RG2.3, the arithmetic Jacobian owner and the recorded Artin/local analytic gaps. Arbitrary Euler factors or Haar measures would remove the normalization assertion.

### AdelicAlgebraicGroups:AA.3/adelic-iwasawa-factorization — Adelic Iwasawa factorization
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For connected reductive G/F, minimal-parabolic data and an admissible K, multiplication N_P(𝔸)×M_P(𝔸)^1×A_P(ℝ)^0×K→G(𝔸) is surjective and open for each standard P. At almost all finite places it restricts to the integral Iwasawa factorization; this integrality permits assembling local choices into restricted-product elements.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/parabolic-haar-jacobian — Parabolic Haar Jacobian
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: Write P=N⋊M and δ_P(m)=|det(Ad(m)|Lie N)|_𝔸. With left Haar measures dn,dm, the measure δ_P(m)^−1 dn dm in coordinates (n,m) is a left Haar measure of P(𝔸); with the convention d(p x)=Δ_P(p)^−1 dx for right Haar, Δ_P(m)=δ_P(m).
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/iwasawa-integration-compact — Iwasawa integration through the compact factor
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For admissible K and P=N⋊M, normalize dk to mass one and choose compatible dn,dm. The functional f↦∫_K∫_M∫_N f(nmk)δ_P(m)^−1 dn dm dk on compactly supported continuous f is a positive left-G-invariant functional, hence gives Haar measure on G(𝔸). Equivalently use the compact homogeneous space (P∩K)\K, whose measure is quasi-invariant under G with the parabolic Radon–Nikodym cocycle. No invariant measure on P\G is asserted.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/gln-finite-class-number-one — GLₙ finite class number one over ℚ
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For n≥1, GL_n(𝔸_{ℚ,f})=GL_n(ℚ)GL_n(ℤ̂). The rational intersection with GL_n(ℤ̂) is GL_n(ℤ).
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/simultaneous-self-adjointness — Simultaneous self-adjointness
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For a finite nested chain of reductive real algebraic subgroups of GL_n, one a∈SL_n(ℝ) makes every aG_i(ℝ)a⁻¹ stable under transpose.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/closed-orbit-realization — Reductive homogeneous spaces as closed orbits
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: If H⊂G are reductive algebraic groups over a characteristic-zero field F, then H\G is affine and has a G-equivariant closed immersion into a finite-dimensional rational G-representation, taking the identity coset to w∈V(F) with stabilizer H. The orbit of w is closed.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/closed-orbit-weight-bound — Closed-orbit weight bounds in a real Siegel domain
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: Let GL_n act rationally on V, w have closed orbit and transpose-stable stabilizer, and Γ⊂V(ℚ) be a lattice. For a standard real Siegel domain Σ there is a compact Q⊂GL_n(ℝ) such that wΣ∩Γ⊂wQ. In particular the norms of these lattice points are uniformly bounded.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/closed-orbit-lattice-finite — Closed-orbit lattice finiteness
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: Under closed-orbit-weight-bound, wΣ∩Γ is finite. The same holds after any fixed rational translation of Σ and any rational change of lattice.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/finite-part-denominator-bound — Compact finite parts give bounded denominators
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For a rational representation ρ:G→GL(V), w∈V(F) and compact C⊂G(𝔸_f), there is a fractional O_F-lattice L⊂V(F) such that wρ(C)∩V(F)⊂L. Likewise a compact C bounds denominators of all entries of g and g⁻¹ for g∈C∩GL_n(F).
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/gln-real-overlap — Real GLₙ Siegel overlap
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For a standard GL_n(ℝ) Siegel domain Σ and a fixed integer d≥1, the set of γ∈GL_n(ℚ) with γ,γ⁻¹∈d^−1M_n(ℤ) and γΣ∩Σ≠∅ is finite. The same statement holds for two fixed rational translates of such domains.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/local-height-polynomial — Local polynomial comparison for algebraic heights
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For closed algebraic embeddings σ,τ of an affine group G into general linear groups and dual-augmented norms, there are integers N≥1 and positive c_v, with c_v=1 at almost all finite places, such that ‖τ(g)‖_v≤c_v‖σ(g)‖_v^N. The statement includes inverse coordinates.
Signature omitted — The actual algebraic coordinate representation with its dual, canonical normalized local absolute values and RG2.0 evaluation topology are required to state this adelic height. The height-counting gap supplies ideal/unit/lattice estimates. An arbitrary proper function or norm without inverse coordinates would not state the contract.

### AdelicAlgebraicGroups:AA.3/adelic-height-proper — Properness of dual-augmented adelic height
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: If r contains a closed embedding σ and σ∨, the product height in adelic-height has compact sublevel sets. At infinity it bounds both σ(g) and σ(g)⁻¹; at finite v its value is ≥1 and, when not integral in both directions, is ≥q_v. A height bound therefore allows only finitely many exceptional finite places.
Signature omitted — The actual algebraic coordinate representation with its dual, canonical normalized local absolute values and RG2.0 evaluation topology are required to state this adelic height. The height-counting gap supplies ideal/unit/lattice estimates. An arbitrary proper function or norm without inverse coordinates would not state the contract.

### AdelicAlgebraicGroups:AA.3/rational-coordinate-height-count — Polynomial count of rational coordinates
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For a fixed number field F and integer d≥1, the number of a∈F^d with ∏_v max(1,|a₁|_v,…,|a_d|_v)≤R is at most C R^N for R≥1, for constants C,N depending only on F,d. The absolute values are normalized for the product formula.
Signature omitted — The actual algebraic coordinate representation with its dual, canonical normalized local absolute values and RG2.0 evaluation topology are required to state this adelic height. The height-counting gap supplies ideal/unit/lattice estimates. An arbitrary proper function or norm without inverse coordinates would not state the contract.

### AdelicAlgebraicGroups:AA.3/positive-root-cone-integral — Exponential integrability on the relative chamber
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: Let β₁,…,β_r be a basis of (a₀^G)* and let 2ρ=∑c_iβ_i with every c_i>0. For any T the integral of exp(−2ρ(H)) over β_i(H)>β_i(T) is finite. For r=0 the domain is the zero-dimensional point and has the chosen finite Haar mass.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/reduced-form-scalar-invariance — Scalar invariance of reduced forms
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For a positive definite Gram matrix B, C>0 and a>0, B is (e,C)-reduced iff aB is (e,C)-reduced. Consequently determinant normalization preserves reducedness.
Native equivalent signature(s): RealSiegel.IsReduced.smul.

### AdelicAlgebraicGroups:AA.3/containment-parabolic-torus — Compatible parabolic and torus for a subgroup
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For H⊂G reductive over ℚ, a Siegel triple (P_H,S_H,K_H), and K_G containing K_H with Cartan involution stabilizing S_H, choose Q⊂G with Levi Z_G(S_H) and N_H⊂R_u(Q), then a minimal P_G⊂Q. Its Cartan-stable Siegel torus S_G contains S_H, satisfies S_G∩H=S_H, and N_H⊂N_G.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/containment-finite-root-cones — Finite root-cone comparison
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: In containment-parabolic-torus, for any t>0 there is t′>0 such that every a∈A_{H,t} belongs to wA_{G,t′}w⁻¹ for some w in the finite Weyl group of S_G satisfying N_H,N_Z⊂wN_Gw⁻¹. Restricted roots equal to zero on S_H impose no inequality.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/containment-weyl-representatives — Rational and compact Weyl representatives
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For each admissible Weyl element w in containment-finite-root-cones, choose a compact representative w_K∈K_G and a representative w_Q=u⁻¹w′_Qu with w′_Q∈G(ℚ), u∈N_Z(ℝ), and w′_Q⁻¹w_Q∈N_G(ℝ). Their quotient can be chosen in the identity component of Z_G(S_G)(ℝ).
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.3/containment-compact-factors — Uniform compact factors for subgroup Siegel sets
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: With Ω_H⊂N_HM_H compact, choose a compact Ω_G⊂N_GM_G and, for every admissible w, a compact B_w⊂S_G(ℝ)^0 such that w′_Q⁻¹Ω_H⊂Ω_G w_K⁻¹ B_w K_Z. All these choices range over a finite Weyl set.
Signature omitted — RG2.1/RG2.3 must supply the actual rational parabolic, Levi, relative roots and good local integral models; LieGroups layer 9 and RG2.4 supply the specified Cartan/Iwasawa coordinates. Fixed-K compatibility is part of the contract. The reduction, root-intersection, pivot and Levi gaps remain explicit; arbitrary data fields for parabolics, compactness or factorization are not used.

### AdelicAlgebraicGroups:AA.4/projection-finite-covolume — Finite covolume of a projection closure
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: Let Γ be a lattice in locally compact second-countable groups A×B, and Δ the closure of its B-projection. Then Δ\B carries a nonzero finite B-invariant Radon measure.
Signature omitted — RG2.0/RG2.1/RG2.4 supply canonical arithmetic local group/Lie/torus objects. The recorded analytic, density, cohomological, native-field or anisotropic gaps specify the remaining proof input. No generic Zariski-density assertion on an arbitrary subgroup replaces the full arithmetic subgroup.

### AdelicAlgebraicGroups:AA.4/arithmetic-native-lie-closure — Native-field Lie algebra of an arithmetic closure
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For absolutely almost simple G/F, S containing all infinite places with G(F_S) noncompact, and finite nonempty S₁ disjoint from S, the closure of G(O_{F,S∪S₁}) in ∏_{v∈S₁}G(F_v) has full native F_v Lie algebra in every factor and no proper graph Lie subalgebra linking distinct places. This is an arithmetic statement requiring the full S-integral subgroup, rather than mere F_v-Zariski density.
Signature omitted — RG2.0/RG2.1/RG2.4 supply canonical arithmetic local group/Lie/torus objects. The recorded analytic, density, cohomological, native-field or anisotropic gaps specify the remaining proof input. No generic Zariski-density assertion on an arbitrary subgroup replaces the full arithmetic subgroup.

### AdelicAlgebraicGroups:AA.4/arithmetic-finite-product-openness — Openness in a finite product of completions
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: Given arithmetic-native-lie-closure and the closed analytic subgroup theorem for ∏_{v∈S₁}G(F_v), the closure Δ of G(O_{F,S∪S₁}) is open in that finite product. Its index is finite by projection-finite-covolume.
Signature omitted — RG2.0/RG2.1/RG2.4 supply canonical arithmetic local group/Lie/torus objects. The recorded analytic, density, cohomological, native-field or anisotropic gaps specify the remaining proof input. No generic Zariski-density assertion on an arbitrary subgroup replaces the full arithmetic subgroup.

### AdelicAlgebraicGroups:AA.4/arithmetic-finite-index-elimination — Elimination of arithmetic finite-index closures
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For G/F absolutely almost simple simply connected, S containing infinity with G(F_S) noncompact, and S₁ finite disjoint from S, an open finite-index closure of G(O_{F,S∪S₁}) in ∏_{v∈S₁}G(F_v) is the whole product. At isotropic factors this follows from the local Kneser–Tits/Tits finite-index theorem; anisotropic factors need the separate global arithmetic congruence argument.
Signature omitted — RG2.0/RG2.1/RG2.4 supply canonical arithmetic local group/Lie/torus objects. The recorded analytic, density, cohomological, native-field or anisotropic gaps specify the remaining proof input. No generic Zariski-density assertion on an arbitrary subgroup replaces the full arithmetic subgroup.

### AdelicAlgebraicGroups:AA.4/algebraic-tensor-eigenvalues — Eigenvalues of algebraic tensor subquotients
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For a closed faithful algebraic representation ρ of a finite-type affine group G over a characteristic-zero field and any algebraic representation σ, every eigenvalue of σ(g) over an algebraic closure lies in the multiplicative subgroup generated by the eigenvalues of ρ(g).
Signature omitted — The actual coordinate-algebra neatness and relative-level signatures are above; the algebraic-group meaning fixes a closed faithful representation. Concrete compact/congruence levels require RG2.0/RG2.3 canonical point/model topology and the actual completed valuation/eigenvalue field interface. The existence theorem also uses the coordinate-comodule supplier. No arbitrary abstract point representation is admitted.

### AdelicAlgebraicGroups:AA.4/compact-stable-padic-lattice — Stable lattices for compact p-adic matrix groups
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: Every compact subgroup C⊂GL_n(ℚ_p) preserves a full ℤ_p-lattice Λ⊂ℚ_p^n. It is conjugate into GL_n(ℤ_p).
Signature omitted — The actual coordinate-algebra neatness and relative-level signatures are above; the algebraic-group meaning fixes a closed faithful representation. Concrete compact/congruence levels require RG2.0/RG2.3 canonical point/model topology and the actual completed valuation/eigenvalue field interface. The existence theorem also uses the coordinate-comodule supplier. No arbitrary abstract point representation is admitted.

### AdelicAlgebraicGroups:AA.4/padic-root-unity-distance — Distance of p-adic roots of unity from one
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: If ζ≠1 is a root of unity in an algebraic closure of ℚ_p, then |ζ−1|_p≥p^{−1/(p−1)}. More precisely a primitive p^k-th root has distance p^{−1/(p^{k−1}(p−1))}, while a root of order prime to p has distance one.
Signature omitted — The actual coordinate-algebra neatness and relative-level signatures are above; the algebraic-group meaning fixes a closed faithful representation. Concrete compact/congruence levels require RG2.0/RG2.3 canonical point/model topology and the actual completed valuation/eigenvalue field interface. The existence theorem also uses the coordinate-comodule supplier. No arbitrary abstract point representation is admitted.

### AdelicAlgebraicGroups:AA.4/congruence-matrix-eigenvalue-bound — Eigenvalue bound for congruence matrices
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: If M∈1+p^a M_n(ℤ_p), every eigenvalue λ of M in ℚ̄_p satisfies |λ−1|_p≤p^−a. The eigenvalues and their inverses then lie in the multiplicative open ball used by padic-ball-torsion-free when p≥3,a≥1 or p=2,a≥2.
Signature omitted — The actual coordinate-algebra neatness and relative-level signatures are above; the algebraic-group meaning fixes a closed faithful representation. Concrete compact/congruence levels require RG2.0/RG2.3 canonical point/model topology and the actual completed valuation/eigenvalue field interface. The existence theorem also uses the coordinate-comodule supplier. No arbitrary abstract point representation is admitted.

### AdelicAlgebraicGroups:AA.4/compact-kernel-split-centre — Compact kernel of height on an archimedean level
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For connected reductive G/F let K∞⊂G(F∞) be closed, contain A_G(ℝ)^0, and be compact modulo it. Then K∞∩ker H_{G,∞} is compact, and multiplication gives K∞≃A_G(ℝ)^0×(K∞∩ker H_{G,∞}).
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.

### AdelicAlgebraicGroups:AA.4/rational-stabilizer-finite — Finite full rational stabilizers
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: Under compact-kernel-split-centre and for compact open U⊂G(𝔸_f), A_x=G(F)∩gK∞Ug⁻¹ is finite. Here A_x is the full stabilizer, before division by any rational central subgroup.
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.

### AdelicAlgebraicGroups:AA.4/rational-action-proper — Proper arithmetic action on the level space
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: Under rational-stabilizer-finite, the discrete group G(F) acts properly discontinuously on G(𝔸)/K∞U with its canonical quotient topology: for compact C,D only finitely many γ satisfy γC∩D≠∅.
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.

### AdelicAlgebraicGroups:AA.4/level-full-stabilizer-mass — Fibre mass for full stabilizers
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: Let U′⊂U be compact open and let A_x=G(F)∩gK∞Ug⁻¹ be finite. For the full stabilizers A_y at the points above x, ∑_{y↦x}1/|A_y|=[U:U′]/|A_x|.
Signature omitted — This needs the canonical adelic product/quotient topology, actual split-centre-containing K∞ and compact open U, and its rational action groupoid. RG2.0/RG2.1 supply those point/split-centre maps. The generic double-coset functions above cover the algebraic set part only; arbitrary covers, spaces or stabilizer counts would lose the geometric contract.

### AdelicAlgebraicGroups:AA.4/abelianization-integral-lifts — Integral lifting for reductive abelianization
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For connected reductive G/F with simply connected derived group and ν:G→D=G/G^der, there is a finite set B such that smooth reductive models over O_{F,B} extend ν and ν:G(O_v)→D(O_v) is surjective for every finite v∉B.
Signature omitted — RG2.0/RG2.1/RG2.4 supply canonical arithmetic local group/Lie/torus objects. The recorded analytic, density, cohomological, native-field or anisotropic gaps specify the remaining proof input. No generic Zariski-density assertion on an arbitrary subgroup replaces the full arithmetic subgroup.

### AdelicAlgebraicGroups:AA.4/abelianization-adelic-surjective — Surjectivity of finite adelic abelianization
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: Under abelianization-integral-lifts and local simply connected H¹ vanishing, ν:G(𝔸_f)→D(𝔸_f) is surjective with kernel G^der(𝔸_f). It is the actual restricted-product homomorphism induced by ν.
Signature omitted — RG2.0/RG2.1/RG2.4 supply canonical arithmetic local group/Lie/torus objects. The recorded analytic, density, cohomological, native-field or anisotropic gaps specify the remaining proof input. No generic Zariski-density assertion on an arbitrary subgroup replaces the full arithmetic subgroup.

### AdelicAlgebraicGroups:AA.4/cover-integral-image — Integral compatibility of a central derived cover
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For the actual simply connected central cover ρ:G̃→G^der, at almost every finite place v one has ρ(G̃(F_v))∩G^der(O_v)=ρ(G̃(O_v)). Consequently the adelic image is exactly the restricted product of the local images with these integral image subgroups.
Signature omitted — RG2.1/RG2.3 must supply the actual simply connected algebraic cover and its integral models. Reduced norms, their open local images and good integral images determine the restricted-product quotient topology, as recorded in the quaternion norm gap. A chosen point homomorphism or bijection of square classes is insufficient.

### AdelicAlgebraicGroups:AA.4/idele-class-square-compact — Compact idele classes modulo squares
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: Let C_F=F×\𝔸_F× be the idele class group of a number field. Then C_F/C_F² is compact Hausdorff: the norm decomposition C_F≃ℝ_{>0}×C_F¹ identifies it with the quotient of compact C_F¹ by its square image.
Signature omitted — This needs the actual compact Hausdorff residual/idele quotient from the preceding canonical norm maps and CompactGroups layer 5 character/Fourier interfaces. The general weak-measure limit language cannot replace that identified quotient and its diagonal embeddings.

### AdelicAlgebraicGroups:AA.4/quadratic-kernel-fourier — Fourier convergence of quadratic-character kernels
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: Let C be a compact Hausdorff abelian group and χ_i:C→{±1} pairwise distinct nontrivial continuous characters. For each fixed character ψ of C, the Haar integral of ψ over ker χ_i is zero unless ψ=1 or ψ=χ_i, and hence these kernel Haar probabilities converge weakly to Haar probability on C.
Signature omitted — This needs the actual compact Hausdorff residual/idele quotient from the preceding canonical norm maps and CompactGroups layer 5 character/Fourier interfaces. The general weak-measure limit language cannot replace that identified quotient and its diagonal embeddings.

### AdelicAlgebraicGroups:AA.4/diagonal-coset-limit — Limits of Haar measures on diagonal cosets
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For compact abelian C, closed H_i≤C with H_i→H through the quadratic-kernel setting, and points z_i∈C×C, every weak limit of Haar probabilities on z_iH_i^Δ is H^Δ-invariant and supported on one coset of H^Δ. The analogous statement holds when H_i=H is fixed.
Signature omitted — This needs the actual compact Hausdorff residual/idele quotient from the preceding canonical norm maps and CompactGroups layer 5 character/Fourier interfaces. The general weak-measure limit language cannot replace that identified quotient and its diagonal embeddings.

### AdelicAlgebraicGroups:AA.5/gl1-logarithmic-torus — Canonical logarithmic torus at GL₁ level
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For the level U_Q of gl1-XQ-components, the identity component is the logarithmic quotient W/Λ_Q, where W=ℝ^{r₁+r₂}/ℝ·(1,…,1) and Λ_Q is the image of totally positive congruence units F×∩U_{Q,f}. It is a compact real torus of dimension r₁+r₂−1. The complex circle factors have already been divided out by K∞.
Signature omitted — GlobalNumberFields layers 4–6 supply the actual idele norm/unit topology and finite-idele class maps; the canonical logarithmic unit lattice and specified level then define these spaces. AlgebraicTopology stage 6 supplies actual torus cohomology and its translation maps. An arbitrary torus or chosen equivalence would omit the component/level assertion.

### AdelicAlgebraicGroups:AA.5/gl2-orthogonal-level-components — GL₂ components for O(2) and SO(2)
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: For GL₂/ℚ and principal finite level K(N), the quotient with K∞=ℝ×SO(2) has components (ℤ/N)× and raw real symmetric space ℍ± before rational orientation reduction. With K∞=ℝ×O(2), the real space is the folded ℍ and the component set is (ℤ/N)×/{±1}. At N=3 these cardinalities are respectively two and one.
Signature omitted — The raw/folded matrix formulas are native above. The full adelic statement needs RG2.0 canonical GL₂ point topology, actual principal finite congruence level, and the arithmetic quotient comparison from ModularCurvesPartII:R12.2. A generic upper-half-plane action alone does not specify the SO(2)/O(2) component maps.

### AdelicAlgebraicGroups:AA.2/central-product-closed — Closedness of the central rational product
Hypotheses: All objects, actions and measures have the hypotheses in the statement.
Contract: Let G be connected reductive over F and X a closed subgroup of Z(𝔸_F). If XZ(F) is closed in Z(𝔸_F), then XG(F) is closed in G(𝔸_F).
Signature omitted — This contract needs canonical adelic centre/adjoint quotient data from RG2.1 and the associated measurable line, Borel section and completion-identification language recorded in the central analytic gap. It is not represented by an arbitrary Hilbert space, a topological line bundle or an assumed unitary representation.

-/
