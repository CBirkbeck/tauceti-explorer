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

/-!
# Adelic algebraic groups and arithmetic quotients: suggested Lean forms

Independent review `REV-AdelicAlgebraicGroups` (2026-10-06): **needs_changes**.
The packet and review report record the corrected mathematics and unresolved obligations.
The reader document still needs a revision to match them. These suggested forms claim no
implementation: proofs are `sorry`. Elaboration in the Mathlib-only shared build checks types,
but does not validate the stand-ins against the pinned Tau Ceti declarations.

The review corrected finite presentation, the right-translation measure factor, the finite-only
level embedding, the relative-chamber kernel, positive corner coordinates, the identity height,
and the archimedean hypothesis on Hecke translation. Many signatures still omit finite-type,
connectedness, reductivity, naturality or normalization hypotheses: see the review report and
packet gaps. This file is not yet a faithful prototype of the whole packet.

Conventions of this prototype.
* An affine algebraic group over a field `F` is given by a commutative Hopf algebra `H` over `F`;
  its `R`-points are `WithConv (H →ₐ[F] R)`. Tau Ceti provides the convolution group on these
  points for every commutative `F`-algebra `R` (`TauCeti.HopfAlgebra.points`); the shared build
  used to check this file contains Mathlib but not Tau Ceti's algebraic-group modules, so the
  group law is restated below as `pointsGroup` with its proofs left as `sorry`.
* Objects that the roadmap imports from other roadmaps (the affine-points topology of
  ReductiveGroupsPartII RG2.0, the GL_n coordinate Hopf algebra of Tau Ceti) appear as explicitly
  named stand-ins or as hypotheses. These must be replaced by the actual imported structures
  before the mathematical assertions can be accepted.
-/

noncomputable section

open scoped RestrictedProduct Topology ENNReal NNReal TensorProduct
open MeasureTheory Filter Set
open scoped Pointwise

/-! ## AA.0 Restricted products of Haar measures -/

/-- `AA.0/mixed-space-topology`: the algebraic equivalence alone asserts no continuity. -/
theorem NumberField.InfiniteAdeleRing.continuous_ringEquiv_mixedSpace
    (F : Type) [Field F] [NumberField F] :
    Continuous (NumberField.InfiniteAdeleRing.ringEquiv_mixedSpace F) ∧
      Continuous (NumberField.InfiniteAdeleRing.ringEquiv_mixedSpace F).symm := by
  sorry

namespace RestrictedProduct

variable {ι : Type*} {G : ι → Type*} [∀ i, Group (G i)] [∀ i, TopologicalSpace (G i)]
  [∀ i, IsTopologicalGroup (G i)] {B : ∀ i, Subgroup (G i)}
  [hBopen : Fact (∀ i, IsOpen (B i : Set (G i)))]

/-- `AA.0/second-countable`: countably many second countable factors give a second countable
restricted product. -/
theorem secondCountable [Countable ι] [∀ i, SecondCountableTopology (G i)] :
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

theorem borel_eq_generateFrom_boxes [Countable ι] [∀ i, SecondCountableTopology (G i)] :
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
    [∀ i, SecondCountableTopology (G i)] :
    Measurable (fun x : Πʳ i, [G i, B i] => (⇑x : ∀ i, G i)) := by
  sorry

-- Test RestrictedProduct.measurableSet_not_box_infinite
/-- For `ι = ℕ`, `G i = ZMod 4`, `B i = 2(ZMod 4)` and `C i = {0}`, the product is not a box of
the generating family: it differs from `B i` at every index. -/
example : ¬ ∀ᶠ i in (cofinite : Filter ℕ),
    ({1} : Set (Multiplicative (ZMod 4))) =
      ((Subgroup.zpowers (Multiplicative.ofAdd (2 : ZMod 4)) : Subgroup _) : Set _) := by
  sorry

/-- The open subgroup `U_S = ∏_{i ∈ S} G i × ∏_{i ∉ S} B i` of the restricted product. -/
def levelSubgroup (S : Set ι) : Subgroup (Πʳ i, [G i, B i]) := sorry

theorem isOpen_levelSubgroup (S : Set ι) :
    IsOpen ((levelSubgroup (B := B) S : Subgroup _) : Set (Πʳ i, [G i, B i])) := by
  sorry

variable [∀ i, MeasurableSpace (G i)] [∀ i, BorelSpace (G i)]

/-- `AA.0/level-measure`: the product measure `μ_S` on the level subgroup `U_S`, built from
`Measure.pi` over the finite set `S` and `Measure.infinitePi` of the probability measures
`μ i` restricted to `B i` off `S`. -/
def levelMeasure (μ : ∀ i, Measure (G i)) (S : Finset ι)
    (hμ : ∀ i ∉ S, μ i (B i) = 1) : Measure (levelSubgroup (B := B) (S : Set ι)) := sorry

theorem levelMeasure_box (μ : ∀ i, Measure (G i)) (S : Finset ι) (hμ : ∀ i ∉ S, μ i (B i) = 1)
    (C : ∀ i, Set (G i)) (hC : ∀ i ∉ S, C i = B i) :
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
    [∀ i, IsTopologicalGroup (G₂ i)] {B₂ : ∀ i, Subgroup (G₂ i)}
    [Fact (∀ i, IsOpen (B₂ i : Set (G₂ i)))] [∀ i, MeasurableSpace (G₂ i)] [∀ i, BorelSpace (G₂ i)]
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

variable (μ : ∀ i, Measure (G i)) (hμ : ∀ᶠ i in cofinite, μ i (B i) = 1)

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
    [∀ i, LocallyCompactSpace (G i)] (hcpt : ∀ᶠ i in cofinite, IsCompact (B i : Set (G i))) :
    (haarProduct μ hμ).IsHaarMeasure := by
  sorry

theorem haarProduct_smul (c : ι → ℝ≥0∞) (hc : ∀ᶠ i in cofinite, c i = 1)
    (hcμ : ∀ᶠ i in cofinite, (c i • μ i) (B i) = 1) :
    haarProduct (fun i => c i • μ i) hcμ = (∏ᶠ i, c i) • haarProduct μ hμ := by
  sorry

-- Test RestrictedProduct.haarProduct_compact_open_box
example (h1 : ∀ i, μ i (B i) = 1) :
    haarProduct μ hμ {x : Πʳ i, [G i, B i] | ∀ i, x i ∈ B i} = 1 := by
  sorry

-- Test RestrictedProduct.haarProduct_finite_index
example [Fintype ι] [∀ i, SigmaFinite (μ i)] :
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

theorem haarProduct_rescale (c : ι → ℝ≥0∞) (hc : ∀ᶠ i in cofinite, c i = 1)
    (hcμ : ∀ᶠ i in cofinite, (c i • μ i) (B i) = 1) :
    haarProduct (fun i => c i • μ i) hcμ = (∏ᶠ i, c i) • haarProduct μ hμ := by
  sorry

end RestrictedProduct

namespace RestrictedProduct

variable {ι : Type*} {G : ι → Type*} [∀ i, Group (G i)] [∀ i, TopologicalSpace (G i)]
  [∀ i, IsTopologicalGroup (G i)]

/-- `AA.0/restricted-haar-change-subgroups`: changing the restricting subgroups at finitely many
indices does not change the restricted product. -/
def changeSubgroups (B B' : ∀ i, Subgroup (G i)) (h : ∀ᶠ i in cofinite, B i = B' i) :
    (Πʳ i, [G i, B i]) ≃ₜ* (Πʳ i, [G i, B' i]) := sorry

theorem changeSubgroups_apply (B B' : ∀ i, Subgroup (G i)) (h : ∀ᶠ i in cofinite, B i = B' i)
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
example (x : Πʳ i, [G i, B i]) (i : {i // i ∉ (∅ : Finset ι)}) :
    (splitFinite (∅ : Finset ι) x).2 i = x i := by
  sorry

-- Test RestrictedProduct.splitFinite_univ_finite
example [Fintype ι] (x : Πʳ i, [G i, B i]) (i : (Finset.univ : Finset ι)) :
    (splitFinite Finset.univ x).1 i = x i := by
  sorry

-- Test RestrictedProduct.splitFinite_not_infinite
/-- A family lying outside `B i` at infinitely many indices (such as `(1/p)_p` in `∏_p ℚ_p`
with `B p = ℤ_p`) is not an element of the restricted product. -/
example (x : ∀ i, G i) (h : Set.Infinite {i | x i ∉ B i}) : ¬ ∀ᶠ i in cofinite, x i ∈ B i := by
  sorry

variable [∀ i, MeasurableSpace (G i)] [∀ i, BorelSpace (G i)]
variable (μ : ∀ i, Measure (G i)) (hμ : ∀ᶠ i in cofinite, μ i (B i) = 1)

/-- `AA.0/restricted-haar-split`: Fubini for restricted product measures. -/
theorem haarProduct_split (S : Finset ι) [∀ i, SigmaFinite (μ i)]
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
theorem modularCharacter_haarProduct [∀ i, LocallyCompactSpace (G i)]
    [LocallyCompactSpace (Πʳ i, [G i, B i])] (x : Πʳ i, [G i, B i]) :
    Measure.modularCharacter x = ∏ᶠ i, Measure.modularCharacter (x i) := by
  sorry

/-- `AA.0/restricted-haar-map`. -/
theorem map_haarProduct {G' : ι → Type*} [∀ i, Group (G' i)] [∀ i, TopologicalSpace (G' i)]
    [∀ i, IsTopologicalGroup (G' i)] [∀ i, MeasurableSpace (G' i)] [∀ i, BorelSpace (G' i)]
    {B' : ∀ i, Subgroup (G' i)} [Fact (∀ i, IsOpen (B' i : Set (G' i)))]
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

theorem ideleHaar_units (C : Set (InfiniteAdeleRing K)ˣ) :
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
    ∀ w, ‖(x : AdeleRing (𝓞 ℚ) ℚ).1 w‖ ∈ Icc (1 : ℝ) (Real.exp 1)} = 1 := by
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

/-! ## AA.1 Adelic points and functoriality -/

namespace AdelicPoints

variable {F : Type} [Field F] {H : Type} [CommRing H] [HopfAlgebra F H]

/-- The convolution group of `R`-points of the affine group with coordinate Hopf algebra `H`.
Tau Ceti: `TauCeti.HopfAlgebra.points`; restated because the checking build lacks it. -/
instance pointsGroup (R : Type*) [CommRing R] [Algebra F R] : Group (WithConv (H →ₐ[F] R)) :=
  { (inferInstance : Monoid (WithConv (H →ₐ[F] R))) with
    inv := fun f => WithConv.toConv (f.ofConv.comp (HopfAlgebra.antipodeAlgHom F H))
    inv_mul_cancel := sorry }

/-- The affine-points topology over a topological ring (Conrad, Proposition 2.1), supplied by
ReductiveGroupsPartII RG2.0: induced from `R^H` by evaluation. -/
instance pointsTopology (R : Type*) [CommRing R] [Algebra F R] [TopologicalSpace R] :
    TopologicalSpace (WithConv (H →ₐ[F] R)) :=
  TopologicalSpace.induced (fun f : WithConv (H →ₐ[F] R) => (⇑(WithConv.ofConv f) : H → R))
    Pi.topologicalSpace

/-- Points along a map of coefficient algebras (Tau Ceti `TauCeti.HopfAlgebra.mapPoints`). -/
def mapPoints {R S : Type*} [CommRing R] [Algebra F R] [CommRing S] [Algebra F S]
    (φ : R →ₐ[F] S) : WithConv (H →ₐ[F] R) →* WithConv (H →ₐ[F] S) where
  toFun f := WithConv.toConv (φ.comp f.ofConv)
  map_one' := sorry
  map_mul' := sorry

variable (F H) [NumberField F]

/-- `AA.1/adelic-points`: the adelic points `G(𝔸_F)`. -/
abbrev _root_.AdelicPoints := WithConv (H →ₐ[F] NumberField.AdeleRing (NumberField.RingOfIntegers F) F)

/-- The local points `G(F_v)` at a finite place. -/
abbrev LocalPoints (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :=
  WithConv (H →ₐ[F] v.adicCompletion F)

/-- The finite adelic points `G(𝔸_{F,f})`. -/
abbrev FiniteAdelicPoints :=
  WithConv (H →ₐ[F] IsDedekindDomain.FiniteAdeleRing (NumberField.RingOfIntegers F) F)

/-- The archimedean points `G(F_∞) = G(F ⊗ ℝ)`. -/
abbrev InfinitePoints := WithConv (H →ₐ[F] NumberField.InfiniteAdeleRing F)

theorem instTopologicalSpace :
    (inferInstance : TopologicalSpace (AdelicPoints F H)) =
      TopologicalSpace.induced (fun f : AdelicPoints F H => (⇑(WithConv.ofConv f) : H → _))
        Pi.topologicalSpace := rfl

theorem instIsTopologicalGroup : IsTopologicalGroup (AdelicPoints F H) := by
  sorry

/-- The diagonal embedding `G(F) → G(𝔸_F)`. -/
def diagonal : WithConv (H →ₐ[F] F) →* AdelicPoints F H :=
  mapPoints (Algebra.ofId F _)

/-- The projection of the adeles to a finite completion, as an `F`-algebra map (requested from
GlobalNumberFields layer 4). -/
def adeleProj (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    NumberField.AdeleRing (NumberField.RingOfIntegers F) F →ₐ[F] v.adicCompletion F := sorry

/-- The local projection `G(𝔸_F) → G(F_v)`. -/
def proj (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    AdelicPoints F H →* LocalPoints F H v :=
  mapPoints (adeleProj F v)

theorem continuous_eval (h : H) :
    Continuous (fun x : AdelicPoints F H => (WithConv.ofConv x) h) := by
  sorry

theorem proj_diagonal (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (g : WithConv (H →ₐ[F] F)) :
    proj F H v (diagonal F H g) = mapPoints (Algebra.ofId F (v.adicCompletion F)) g := by
  sorry

-- Test AdelicPoints.ga_eq_adeles
/-- For the additive group (`H = F[T]` with `T` primitive) the points are the adeles. -/
example (e : ∀ (R : Type) [CommRing R] [Algebra F R], WithConv (H →ₐ[F] R) ≃ R) :
    Nonempty (AdelicPoints F H ≃ NumberField.AdeleRing (NumberField.RingOfIntegers F) F) := by
  sorry

-- Test AdelicPoints.trivial_group
example (e : H ≃ₐ[F] F) : Subsingleton (AdelicPoints F H) := by
  sorry

-- Test AdelicPoints.not_product_topology
/-- For `G_m` the affine-points topology is the units topology: inversion is continuous, while it
is not continuous for the subspace topology of `𝔸_F` on `𝔸_F^×`. -/
example : ¬ Continuous (fun x : {a : NumberField.AdeleRing (NumberField.RingOfIntegers F) F // IsUnit a} =>
    (Ring.inverse (x : NumberField.AdeleRing (NumberField.RingOfIntegers F) F))) := by
  sorry

/-- `AA.1/integral-model`: an integral model of `H` away from a finite set `S` of finite places
(the archimedean places are always excluded), a Hopf algebra over the `S`-integers with generic
fibre `H`. The compatibility of the isomorphism with the Hopf structures is part of the intended
definition; it is not stated in this prototype. -/
structure _root_.IntegralModel where
  S : Set (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
  finite_S : S.Finite
  𝓗 : Type
  [instRing : CommRing 𝓗]
  [instHopf : HopfAlgebra (Set.integer S F) 𝓗]
  [finitePresentation : Algebra.FinitePresentation (S.integer F) 𝓗]
  baseChangeIso : (F ⊗[S.integer F] 𝓗) ≃ₐ[F] H

attribute [instance] IntegralModel.instRing IntegralModel.instHopf IntegralModel.finitePresentation

variable {F H}

/-- The integral points `𝓗(𝒪_v)` inside `G(F_v)`, for `v ∉ S`. -/
def _root_.IntegralModel.localPoints (M : IntegralModel F H)
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    Subgroup (LocalPoints F H v) := sorry

/-- Enlarging `S`. -/
def _root_.IntegralModel.enlarge (M : IntegralModel F H)
    (S' : Set (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)))
    (hS : M.S ⊆ S') (hS' : S'.Finite) : IntegralModel F H := sorry

theorem _root_.IntegralModel.enlarge_localPoints (M : IntegralModel F H)
    (S' : Set (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))) (hS : M.S ⊆ S')
    (hS' : S'.Finite) (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (hv : v ∉ S') :
    (M.enlarge S' hS hS').localPoints v = M.localPoints v := by
  sorry

theorem _root_.IntegralModel.localPoints_injective (M : IntegralModel F H)
    (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (g g' : M.𝓗 →+* v.adicCompletionIntegers F)
    (h : (v.adicCompletionIntegers F).subtype.comp g = (v.adicCompletionIntegers F).subtype.comp g') :
    g = g' := by
  sorry

-- Test IntegralModel.gln_localPoints
/-- For a model whose `𝒪_v`-points are `GL_n(𝒪_v)` (Tau Ceti `GeneralLinear.pointsMulEquiv`),
an integral matrix with nonzero but non-unit determinant is not an integral point. -/
example (n : ℕ) (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (A : Matrix (Fin n) (Fin n) (v.adicCompletionIntegers F)) (hA : A.det ≠ 0) (hA' : ¬ IsUnit A.det) :
    ¬ IsUnit A := by
  sorry

-- Test IntegralModel.trivial
example (M : IntegralModel F H) (e : H ≃ₐ[F] F) (v) : M.localPoints v = ⊥ := by
  sorry

-- Test IntegralModel.monoid_not_model
/-- The bialgebra `F[T]` with `T ↦ T ⊗ T` has no antipode: `T` would have to be invertible. -/
example : ¬ IsUnit (Polynomial.X : Polynomial F) := by
  sorry

/-- `AA.1/integral-model-exists` (spreading out). -/
theorem _root_.IntegralModel.exists [Algebra.FiniteType F H] : Nonempty (IntegralModel F H) := by
  sorry

/-- `AA.1/integral-model-unique`. -/
theorem _root_.IntegralModel.localPoints_eventually_eq (M M' : IntegralModel F H) :
    ∀ᶠ v in cofinite, M.localPoints v = M'.localPoints v := by
  sorry

variable (F H)

/-- `AA.1/restricted-product-comparison`: the finite adelic points are the restricted product of
the local points with respect to the integral points of a model. -/
theorem restrictedProductComparison (M : IntegralModel F H)
    [Fact (∀ v, IsOpen (M.localPoints v : Set (LocalPoints F H v)))] :
    Nonempty (FiniteAdelicPoints F H ≃ₜ* Πʳ v, [LocalPoints F H v, M.localPoints v]) := by
  sorry

/-- `AA.1/rational-points-discrete`. -/
theorem discreteTopology_diagonal :
    DiscreteTopology (diagonal F H).range ∧ IsClosed ((diagonal F H).range : Set (AdelicPoints F H)) := by
  sorry

section functoriality

variable {F H} {H' H'' : Type} [CommRing H'] [HopfAlgebra F H'] [CommRing H''] [HopfAlgebra F H'']

/-- `AA.1/adelic-map`: a homomorphism of affine groups `G → G'`, given by a bialgebra map
`H' → H` of coordinate rings, induces a continuous homomorphism of adelic points. -/
def map (φ : H' →ₐc[F] H) : AdelicPoints F H →* AdelicPoints F H' where
  toFun x := WithConv.toConv ((WithConv.ofConv x).comp (φ : H' →ₐ[F] H))
  map_one' := sorry
  map_mul' := sorry

theorem continuous_map (φ : H' →ₐc[F] H) : Continuous (map φ) := by
  sorry

theorem map_id : map (BialgHom.id F H) = MonoidHom.id (AdelicPoints F H) := by
  sorry

theorem map_comp (φ : H' →ₐc[F] H) (ψ : H'' →ₐc[F] H') :
    map (φ.comp ψ) = (map ψ).comp (map φ) := by
  sorry

theorem map_diagonal (φ : H' →ₐc[F] H) (g : WithConv (H →ₐ[F] F)) :
    map φ (diagonal F H g) = diagonal F H' (WithConv.toConv ((WithConv.ofConv g).comp (φ : H' →ₐ[F] H))) := by
  sorry

theorem proj_map (φ : H' →ₐc[F] H) (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (x : AdelicPoints F H) :
    proj F H' v (map φ x) = WithConv.toConv ((WithConv.ofConv (proj F H v x)).comp (φ : H' →ₐ[F] H)) := by
  sorry

-- Test AdelicPoints.map_det_gl1
/-- For `n = 1` the determinant is the identity: `map (id)` is the identity of `𝔸_F^×`. -/
example (x : AdelicPoints F H) : map (BialgHom.id F H) x = x := by
  sorry

-- Test AdelicPoints.map_trivial
example (φ : F →ₐc[F] H) (x : AdelicPoints F H) : map φ x = 1 := by
  sorry

-- Test AdelicPoints.map_not_open
/-- Infinite index alone does not imply non-openness. The idelic square image is also closed
and non-open: every basic unit neighbourhood leaves infinitely many odd-prime square obstructions. -/
example : ¬ (Subgroup.map (powMonoidHom 2 : (NumberField.AdeleRing (NumberField.RingOfIntegers ℚ) ℚ)ˣ →* _)
    ⊤).FiniteIndex := by
  sorry

example : IsClosed ((powMonoidHom 2 : (NumberField.AdeleRing (NumberField.RingOfIntegers ℚ) ℚ)ˣ →* _).range :
      Set (NumberField.AdeleRing (NumberField.RingOfIntegers ℚ) ℚ)ˣ) := by
  sorry

example : ¬ IsOpen ((powMonoidHom 2 : (NumberField.AdeleRing (NumberField.RingOfIntegers ℚ) ℚ)ˣ →* _).range :
      Set (NumberField.AdeleRing (NumberField.RingOfIntegers ℚ) ℚ)ˣ) := by
  sorry

end functoriality

section restriction

variable (E : Type) [Field E] [NumberField E] [Algebra F E] [FiniteDimensional F E]
  (HE : Type) [CommRing HE] [HopfAlgebra E HE]
  (HRes : Type) [CommRing HRes] [HopfAlgebra F HRes]

/-- The defining property of the Weil restriction `Res_{E/F} G_E` (ReductiveGroupsPartII RG2.0a):
its `R`-points are the `E ⊗_F R`-points of `G_E`, naturally in `R`. -/
abbrev WeilRestrictionPoints :=
  ∀ (R : Type) [CommRing R] [Algebra F R], WithConv (HRes →ₐ[F] R) ≃* WithConv (HE →ₐ[E] E ⊗[F] R)

/-- `AA.1/base-change-adelic`: restriction of scalars on adelic points. -/
def resEquiv (e : WeilRestrictionPoints F E HE HRes) : AdelicPoints F HRes ≃ₜ* AdelicPoints E HE :=
  sorry

theorem resEquiv_diagonal (e : WeilRestrictionPoints F E HE HRes) (g : WithConv (HRes →ₐ[F] F)) :
    resEquiv F E HE HRes e (diagonal F HRes g) =
      diagonal E HE (mapPoints (Algebra.TensorProduct.rid F E E).toAlgHom (e F g)) := by
  sorry

theorem resEquiv_natural (e : WeilRestrictionPoints F E HE HRes)
    {HE' HRes' : Type} [CommRing HE'] [HopfAlgebra E HE'] [CommRing HRes'] [HopfAlgebra F HRes']
    (e' : WeilRestrictionPoints F E HE' HRes') (φ : HE' →ₐc[E] HE) (φRes : HRes' →ₐc[F] HRes)
    (x : AdelicPoints F HRes) :
    resEquiv F E HE' HRes' e' (map φRes x) = map φ (resEquiv F E HE HRes e x) := by
  sorry

theorem resEquiv_trans (e : WeilRestrictionPoints F E HE HRes)
    (L : Type) [Field L] [NumberField L] [Algebra E L] [Algebra F L] [IsScalarTower F E L]
    [FiniteDimensional E L] [FiniteDimensional F L]
    (HL : Type) [CommRing HL] [HopfAlgebra L HL]
    (eLE : WeilRestrictionPoints E L HL HE) (eLF : WeilRestrictionPoints F L HL HRes) (x : AdelicPoints F HRes) :
    resEquiv F L HL HRes eLF x = resEquiv E L HL HE eLE (resEquiv F E HE HRes e x) := by
  sorry

-- Test AdelicPoints.resEquiv_gm
/-- For `G_E = G_m`, `resEquiv` identifies `(E ⊗_F 𝔸_F)^×` with `𝔸_E^×`. -/
example (e : WeilRestrictionPoints F E HE HRes)
    (eGm : ∀ (R : Type) [CommRing R] [Algebra E R], WithConv (HE →ₐ[E] R) ≃* Rˣ) :
    Nonempty ((E ⊗[F] NumberField.AdeleRing (NumberField.RingOfIntegers F) F)ˣ ≃*
      (NumberField.AdeleRing (NumberField.RingOfIntegers E) E)ˣ) := by
  sorry

-- Test AdelicPoints.resEquiv_self
example (e : WeilRestrictionPoints F F H H) (he : ∀ (R : Type) [CommRing R] [Algebra F R] (x : WithConv (H →ₐ[F] R)), e R x = WithConv.toConv
    ((Algebra.TensorProduct.lid F R).symm.toAlgHom.comp (WithConv.ofConv x))) (x : AdelicPoints F H) :
    resEquiv F F H H e x = x := by
  sorry

-- Test AdelicPoints.res_not_base_change
/-- `Res_{E/F} G_m(F) = E^×`, which is larger than `G_m(F) = F^×` when `E ≠ F`. -/
example (h : Module.finrank F E ≠ 1) : ¬ Function.Surjective (Units.map (algebraMap F E).toMonoidHom) := by
  sorry

end restriction

end AdelicPoints

/-! ## AA.2 Characters, heights and integration -/

namespace AdelicPoints

variable (F : Type) [Field F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- `AA.2/rational-characters`: the `F`-rational characters, the group-like elements of `H`. -/
abbrev _root_.RationalCharacter := GroupLike F H

variable {F H}

/-- Evaluation of a rational character at a point, a unit of the coefficient ring. -/
def _root_.RationalCharacter.apply {R : Type} [CommRing R] [Algebra F R] (χ : RationalCharacter F H)
    (x : WithConv (H →ₐ[F] R)) : Rˣ :=
  Units.map (WithConv.ofConv x).toMonoidHom (GroupLike.toUnits F χ)

theorem _root_.RationalCharacter.apply_mul {R : Type} [CommRing R] [Algebra F R]
    (χ : RationalCharacter F H) (x y : WithConv (H →ₐ[F] R)) :
    χ.apply (x * y) = χ.apply x * χ.apply y := by
  sorry

/-- Rational characters are the Hopf maps from the coordinate ring of `G_m`. -/
def _root_.RationalCharacter.equivHom :
    RationalCharacter F H ≃ (MonoidAlgebra F (Multiplicative ℤ) →ₐc[F] H) := sorry

/-- Comparison with the Galois-fixed geometric characters (Tau Ceti
`CommHopfAlgCat.geometricCharacterGroup`): base change to an algebraic closure is injective. -/
theorem _root_.RationalCharacter.toGeometric_injective :
    Function.Injective (fun χ : RationalCharacter F H =>
      (algebraMap F (AlgebraicClosure F) 1 ⊗ₜ[F] (χ : H) : AlgebraicClosure F ⊗[F] H)) := by
  sorry

theorem _root_.RationalCharacter.free [Algebra.FiniteType F H] (hconn : IsDomain H) :
    Module.Free ℤ (Additive (RationalCharacter F H)) ∧ Module.Finite ℤ (Additive (RationalCharacter F H)) := by
  sorry

-- Test RationalCharacter.gln_det
/-- For a Hopf algebra whose points are `GL_n` naturally (Tau Ceti
`GeneralLinear.pointsMulEquiv`), the rational characters form an infinite cyclic group. -/
example (n : ℕ) (hn : 0 < n)
    (e : ∀ (R : Type) [CommRing R] [Algebra F R], WithConv (H →ₐ[F] R) ≃* GL (Fin n) R) :
    IsCyclic (RationalCharacter F H) ∧ Infinite (RationalCharacter F H) := by
  sorry

-- Test RationalCharacter.sln_trivial
example (n : ℕ)
    (e : ∀ (R : Type) [CommRing R] [Algebra F R], WithConv (H →ₐ[F] R) ≃* Matrix.SpecialLinearGroup (Fin n) R) :
    Subsingleton (RationalCharacter F H) := by
  sorry

-- Test RationalCharacter.res_norm
/-- For `Res_{ℚ(i)/ℚ} G_m` the rational characters have rank one (the norm). -/
example (E : Type) [Field E] [NumberField E] [Algebra ℚ E] (hE : Module.finrank ℚ E = 2)
    (HR : Type) [CommRing HR] [HopfAlgebra ℚ HR]
    (e : ∀ (R : Type) [CommRing R] [Algebra ℚ R], WithConv (HR →ₐ[ℚ] R) ≃* (E ⊗[ℚ] R)ˣ) :
    Module.finrank ℤ (Additive (RationalCharacter ℚ HR)) = 1 := by
  sorry

variable (F H)

/-- `AA.2/real-character-space`: `a_G = Hom(X*_F(G), ℝ)`. -/
abbrev _root_.RealCharacterSpace := Additive (RationalCharacter F H) →+ ℝ

/-- The topology of pointwise convergence (the finite-dimensional vector-space topology). -/
instance : TopologicalSpace (RealCharacterSpace F H) :=
  TopologicalSpace.induced (fun a (χ : Additive (RationalCharacter F H)) => a χ) Pi.topologicalSpace

variable {F H}

/-- The pairing of `a_G` with rational characters. -/
def _root_.RealCharacterSpace.pairing (a : RealCharacterSpace F H) (χ : RationalCharacter F H) : ℝ :=
  a (Additive.ofMul χ)

theorem _root_.RealCharacterSpace.finrank [Module.Free ℤ (Additive (RationalCharacter F H))]
    [Module.Finite ℤ (Additive (RationalCharacter F H))] :
    Module.finrank ℝ (RealCharacterSpace F H) = Module.finrank ℤ (Additive (RationalCharacter F H)) := by
  sorry

/-- Functoriality of `a_G` along a homomorphism of groups. -/
def _root_.RealCharacterSpace.map {H' : Type} [CommRing H'] [HopfAlgebra F H'] (φ : H' →ₐc[F] H) :
    RealCharacterSpace F H →ₗ[ℝ] RealCharacterSpace F H' := sorry

-- Test RealCharacterSpace.gln_finrank
example (n : ℕ) (hn : 0 < n)
    (e : ∀ (R : Type) [CommRing R] [Algebra F R], WithConv (H →ₐ[F] R) ≃* GL (Fin n) R) :
    Module.finrank ℝ (RealCharacterSpace F H) = 1 := by
  sorry

-- Test RealCharacterSpace.sln_zero
example (n : ℕ)
    (e : ∀ (R : Type) [CommRing R] [Algebra F R], WithConv (H →ₐ[F] R) ≃* Matrix.SpecialLinearGroup (Fin n) R) :
    Subsingleton (RealCharacterSpace F H) := by
  sorry

-- Test RealCharacterSpace.res_gm_rank
example (E : Type) [Field E] [NumberField E] [Algebra ℚ E] (hE : Module.finrank ℚ E = 2)
    (HR : Type) [CommRing HR] [HopfAlgebra ℚ HR]
    (e : ∀ (R : Type) [CommRing R] [Algebra ℚ R], WithConv (HR →ₐ[ℚ] R) ≃* (E ⊗[ℚ] R)ˣ) :
    Module.finrank ℝ (RealCharacterSpace ℚ HR) = 1 := by
  sorry

variable [NumberField F]

/-- The idele norm `‖·‖ : 𝔸_F^× → ℝ_{>0}`, supplied by GlobalNumberFields layer 6. -/
def _root_.NumberField.ideleNorm : (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)ˣ →* ℝ := sorry

/-- `AA.2/log-height`: the Harish-Chandra map `H_G : G(𝔸) → a_G`, written multiplicatively. -/
def logHeight : AdelicPoints F H →* Multiplicative (RealCharacterSpace F H) := sorry

theorem logHeight_apply (x : AdelicPoints F H) (χ : RationalCharacter F H) :
    (Multiplicative.toAdd (logHeight x)).pairing χ = Real.log (NumberField.ideleNorm (χ.apply x)) := by
  sorry

theorem continuous_logHeight : Continuous (fun x : AdelicPoints F H => Multiplicative.toAdd (logHeight x)) := by
  sorry

theorem logHeight_diagonal (g : WithConv (H →ₐ[F] F)) : logHeight (diagonal F H g) = 1 := by
  sorry

theorem logHeight_map {H' : Type} [CommRing H'] [HopfAlgebra F H'] (φ : H' →ₐc[F] H) (x : AdelicPoints F H) :
    Multiplicative.toAdd (logHeight (map φ x)) = RealCharacterSpace.map φ (Multiplicative.toAdd (logHeight x)) := by
  sorry

theorem logHeight_compact (K : Subgroup (AdelicPoints F H)) (hK : IsCompact (K : Set (AdelicPoints F H))) :
    K ≤ (logHeight (F := F) (H := H)).ker := by
  sorry

-- Test AdelicPoints.logHeight_gm
example (eGm : ∀ (R : Type) [CommRing R] [Algebra F R], WithConv (H →ₐ[F] R) ≃* Rˣ) (χ : RationalCharacter F H)
    (hχ : ∀ x : AdelicPoints F H, χ.apply x = eGm _ x) (x : AdelicPoints F H) :
    (Multiplicative.toAdd (logHeight x)).pairing χ = Real.log (NumberField.ideleNorm (eGm _ x)) := by
  sorry

-- Test AdelicPoints.logHeight_sln
example (n : ℕ)
    (e : ∀ (R : Type) [CommRing R] [Algebra F R], WithConv (H →ₐ[F] R) ≃* Matrix.SpecialLinearGroup (Fin n) R)
    (x : AdelicPoints F H) : logHeight x = 1 := by
  sorry

-- Test AdelicPoints.logHeight_not_infinite_only
/-- The idele norm is not determined by the archimedean component: the finite idele `p` at one
place has norm `p⁻¹`. -/
example (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers ℚ))
    (a : (NumberField.AdeleRing (NumberField.RingOfIntegers ℚ) ℚ)ˣ)
    (ha : NumberField.adeleInfPart ℚ a = 1) (hnorm : NumberField.ideleNorm a ≠ 1) :
    ∃ b : (NumberField.AdeleRing (NumberField.RingOfIntegers ℚ) ℚ)ˣ,
      NumberField.adeleInfPart ℚ b = NumberField.adeleInfPart ℚ a ∧ NumberField.ideleNorm b ≠ NumberField.ideleNorm a := by
  sorry

variable (F H)

/-- `AA.2/norm-one-subgroup`: `G(𝔸)^1 = ker H_G`. -/
def normOne : Subgroup (AdelicPoints F H) := (logHeight (F := F) (H := H)).ker

variable {F H}

theorem isClosed_normOne : IsClosed (normOne F H : Set (AdelicPoints F H)) := by
  sorry

instance normOne_normal : (normOne F H).Normal := by
  sorry

@[simp] theorem diagonal_mem_normOne (g : WithConv (H →ₐ[F] F)) : diagonal F H g ∈ normOne F H := by
  sorry

theorem mem_normOne_iff (x : AdelicPoints F H) :
    x ∈ normOne F H ↔ ∀ χ : RationalCharacter F H, NumberField.ideleNorm (χ.apply x) = 1 := by
  sorry

theorem normOne_eq_top_of_no_characters (h : Subsingleton (RationalCharacter F H)) : normOne F H = ⊤ := by
  sorry

-- Test AdelicPoints.normOne_gm
example (eGm : ∀ (R : Type) [CommRing R] [Algebra F R], WithConv (H →ₐ[F] R) ≃* Rˣ) (x : AdelicPoints F H) :
    x ∈ normOne F H ↔ NumberField.ideleNorm (eGm _ x) = 1 := by
  sorry

-- Test AdelicPoints.normOne_sl2
example (e : ∀ (R : Type) [CommRing R] [Algebra F R], WithConv (H →ₐ[F] R) ≃* Matrix.SpecialLinearGroup (Fin 2) R) :
    normOne F H = ⊤ := by
  sorry

-- Test AdelicPoints.normOne_not_finite_part
/-- An idele of norm one whose archimedean component has absolute value `≠ 1`. -/
example : ∃ a : (NumberField.AdeleRing (NumberField.RingOfIntegers ℚ) ℚ)ˣ,
    NumberField.ideleNorm a = 1 ∧ NumberField.adeleInfPart ℚ a ≠ 1 := by
  sorry

variable (F H)

/-- `AA.2/split-centre`: the subgroup `A_G(ℝ)^0` of `G(𝔸)`, supported at the archimedean places. -/
def _root_.SplitComponent : Subgroup (AdelicPoints F H) := sorry

variable {F H}

def _root_.SplitComponent.logHeight_equiv :
    SplitComponent F H ≃ₜ RealCharacterSpace F H := sorry

theorem _root_.SplitComponent.central : SplitComponent F H ≤ Subgroup.center (AdelicPoints F H) := by
  sorry

@[simp] theorem _root_.SplitComponent.inter_normOne : SplitComponent F H ⊓ normOne F H = ⊥ := by
  sorry

-- Test SplitComponent.gln_scalars
example (n : ℕ) (hn : 0 < n)
    (e : ∀ (R : Type) [CommRing R] [Algebra F R], WithConv (H →ₐ[F] R) ≃* GL (Fin n) R) :
    Module.finrank ℝ (RealCharacterSpace F H) = 1 ∧ Nonempty (SplitComponent F H ≃ₜ ℝ) := by
  sorry

-- Test SplitComponent.semisimple_trivial
example (h : Subsingleton (RationalCharacter F H)) : SplitComponent F H = ⊥ := by
  sorry

-- Test SplitComponent.gm_number_field
/-- For `G_m` over a field `F ≠ ℚ` the split component is one-dimensional, smaller than
`(F ⊗ ℝ)^×_{>0}` when `F` has more than one archimedean place. -/
example (eGm : ∀ (R : Type) [CommRing R] [Algebra F R], WithConv (H →ₐ[F] R) ≃* Rˣ) :
    Module.finrank ℝ (RealCharacterSpace F H) = 1 := by
  sorry

/-- `AA.2/split-centre-decomposition`. -/
theorem splitCentre_decomposition :
    Nonempty (AdelicPoints F H ≃ₜ* (normOne F H) × (SplitComponent F H)) := by
  sorry

end AdelicPoints

/-- The archimedean projection of the adeles as an `F`-algebra map. -/
def NumberField.adeleInfAlg (F : Type) [Field F] [NumberField F] :
    NumberField.AdeleRing (NumberField.RingOfIntegers F) F →ₐ[F] NumberField.InfiniteAdeleRing F := sorry

/-- The finite projection of the adeles as an `F`-algebra map. -/
def NumberField.adeleFinAlg (F : Type) [Field F] [NumberField F] :
    NumberField.AdeleRing (NumberField.RingOfIntegers F) F →ₐ[F]
      IsDedekindDomain.FiniteAdeleRing (NumberField.RingOfIntegers F) F := sorry

namespace AdelicPoints

variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]

/-- The canonical finite-supported embedding under `G(𝔸) ≃ G(𝔸∞) × G(𝔸f)`. -/
def finiteEmbed : FiniteAdelicPoints F H →* AdelicPoints F H := sorry

@[simp] theorem finiteEmbed_finite (x : FiniteAdelicPoints F H) :
    mapPoints (NumberField.adeleFinAlg F) (finiteEmbed x) = x := by
  sorry

@[simp] theorem finiteEmbed_infinite (x : FiniteAdelicPoints F H) :
    mapPoints (NumberField.adeleInfAlg F) (finiteEmbed x) = 1 := by
  sorry

/-- A parabolic subgroup `P = M_P N_P` of `G`, given by its coordinate Hopf algebra and the
restriction map `H → H_P` of a closed immersion, together with the Hopf algebra of its unipotent
radical (Tau Ceti `Cocharacter.parabolic` and `Cocharacter.unipotent` give the points). -/
structure _root_.Parabolic (F H : Type) [Field F] [CommRing H] [HopfAlgebra F H] where
  HP : Type
  [instRing : CommRing HP]
  [instHopf : HopfAlgebra F HP]
  restrict : H →ₐc[F] HP
  surjective_restrict : Function.Surjective restrict

attribute [instance] Parabolic.instRing Parabolic.instHopf

/-- `AA.2/modulus-character`: `δ_P(p) = ‖det(Ad p | Lie N_P)‖`. -/
def _root_.Parabolic.modulus (P : Parabolic F H) : AdelicPoints F P.HP →* ℝ≥0 := sorry

theorem _root_.Parabolic.modulus_apply_local (P : Parabolic F H) (x : AdelicPoints F P.HP)
    (δv : (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) → LocalPoints F P.HP v → ℝ≥0)
    (δinf : InfinitePoints F P.HP → ℝ≥0) :
    (P.modulus x : ℝ≥0) =
      δinf (mapPoints (NumberField.adeleInfAlg F) x) * ∏ᶠ v, δv v (proj F P.HP v x) := by
  sorry

@[simp] theorem _root_.Parabolic.modulus_rational (P : Parabolic F H) (g : WithConv (P.HP →ₐ[F] F)) :
    P.modulus (diagonal F P.HP g) = 1 := by
  sorry

theorem _root_.Parabolic.modulus_unipotent (P : Parabolic F H) (N : Subgroup (AdelicPoints F P.HP))
    (n : AdelicPoints F P.HP) (hn : n ∈ N) (hN : ∀ x ∈ N, ∀ χ : RationalCharacter F P.HP, χ.apply x = 1) :
    P.modulus n = 1 := by
  sorry

theorem _root_.Parabolic.modulus_eq_exp_rho (P : Parabolic F H) (ρ : RationalCharacter F P.HP)
    (x : AdelicPoints F P.HP) :
    (P.modulus x : ℝ) = Real.exp (2 * (Multiplicative.toAdd (logHeight x)).pairing ρ) := by
  sorry

-- Test Parabolic.modulus_borel_gl2
/-- For the Borel of `GL_2` (points `{(a, b; 0, d)}`), `δ(diag(a,d) n) = ‖a/d‖`. -/
example (P : Parabolic F H)
    (e : ∀ (R : Type) [CommRing R] [Algebra F R], WithConv (P.HP →ₐ[F] R) →* GL (Fin 2) R)
    (he : ∀ (R : Type) [CommRing R] [Algebra F R] (x : WithConv (P.HP →ₐ[F] R)),
      (e R x : Matrix (Fin 2) (Fin 2) R) 1 0 = 0)
    (x : AdelicPoints F P.HP) (a d : (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)ˣ)
    (ha : (e _ x : Matrix (Fin 2) (Fin 2) (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)) 0 0 = a)
    (hd : (e _ x : Matrix (Fin 2) (Fin 2) (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)) 1 1 = d) :
    (P.modulus x : ℝ) = NumberField.ideleNorm a / NumberField.ideleNorm d := by
  sorry

-- Test Parabolic.modulus_top
example (P : Parabolic F H) (hP : Function.Bijective P.restrict) (x : AdelicPoints F P.HP) : P.modulus x = 1 := by
  sorry

-- Test Parabolic.modulus_not_det
/-- For the Borel of `GL_2`, the modulus character is not the idele norm of the determinant. -/
example (P : Parabolic F H)
    (e : ∀ (R : Type) [CommRing R] [Algebra F R], WithConv (P.HP →ₐ[F] R) →* GL (Fin 2) R)
    (he : ∀ (R : Type) [CommRing R] [Algebra F R] (x : WithConv (P.HP →ₐ[F] R)),
      (e R x : Matrix (Fin 2) (Fin 2) R) 1 0 = 0)
    (himage : ∀ g : GL (Fin 2) (NumberField.AdeleRing (NumberField.RingOfIntegers F) F),
      (g : Matrix (Fin 2) (Fin 2) (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)) 1 0 = 0 →
        ∃ x, e _ x = g) :
    ¬ ∀ x : AdelicPoints F P.HP, (P.modulus x : ℝ) =
      NumberField.ideleNorm (Matrix.GeneralLinearGroup.det (e _ x)) := by
  sorry

end AdelicPoints

namespace QuotientMeasure

variable {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [LocallyCompactSpace G]
  [SecondCountableTopology G] [T2Space G] [MeasurableSpace G] [BorelSpace G]
  (Γ : Subgroup G) [MeasurableSpace Γ] [BorelSpace Γ] [LocallyCompactSpace Γ]

/-- The right coset space `Γ\G` (orbits of `Γ` acting by left multiplication). -/
abbrev Cosets := MulAction.orbitRel.Quotient Γ G

/-- `AA.2/left-right-quotient-inversion`: left Γ-orbits to Mathlib's right Γ-orbits. -/
def inversionHomeomorph : Cosets Γ ≃ₜ (G ⧸ Γ) := sorry

@[simp] theorem inversionHomeomorph_mk (g : G) :
    inversionHomeomorph Γ (Quotient.mk _ g) = ((g⁻¹ : G) : G ⧸ Γ) := by
  sorry

/-- This is the Haar ingredient for transporting the corresponding fundamental-domain
quotient measures; the pinned unfolding theorem's integrability and measurability remain needed. -/
theorem inversion_preserves_biHaar (μ : Measure G) [μ.IsHaarMeasure]
    [μ.IsMulRightInvariant] : Measure.map (fun g : G => g⁻¹) μ = μ := by
  sorry

/-- `AA.2/quotient-measure`: right Haar measures have right invariance, finite mass on compact
sets and positive mass on nonempty open sets; `IsHaarMeasure` itself uses left invariance.
Weil's right invariant measure on `Γ\G` for a closed subgroup with
`Δ_G|_Γ = Δ_Γ`. -/
def measure (μ : Measure G) (ν : Measure Γ) [IsFiniteMeasureOnCompacts μ] [μ.IsOpenPosMeasure] [μ.IsMulRightInvariant]
    [IsFiniteMeasureOnCompacts ν] [ν.IsOpenPosMeasure] [ν.IsMulRightInvariant] (hΓ : IsClosed (Γ : Set G))
    (hmod : ∀ γ : Γ, Measure.modularCharacter (γ : G) = Measure.modularCharacter γ) :
    Measure (Cosets Γ) := sorry

/-- The right action of `G` on `Γ\G`. -/
def rightAct (g : G) : Cosets Γ → Cosets Γ := sorry

theorem rightAct_mk (g x : G) : rightAct Γ g (Quotient.mk _ x) = Quotient.mk _ (x * g) := by
  sorry

/-- The fibre integral `Γg ↦ ∫_Γ f(γg) dγ`. -/
def fiberIntegral (ν : Measure Γ) [ν.IsMulRightInvariant] (f : G → ℝ) : Cosets Γ → ℝ := sorry

theorem fiberIntegral_mk (ν : Measure Γ) [ν.IsMulRightInvariant] (f : G → ℝ) (g : G) :
    fiberIntegral Γ ν f (Quotient.mk _ g) = ∫ γ, f ((γ : G) * g) ∂ν := by
  sorry

variable {Γ} (μ : Measure G) (ν : Measure Γ) [IsFiniteMeasureOnCompacts μ] [μ.IsOpenPosMeasure] [μ.IsMulRightInvariant]
  [IsFiniteMeasureOnCompacts ν] [ν.IsOpenPosMeasure] [ν.IsMulRightInvariant] (hΓ : IsClosed (Γ : Set G))
  (hmod : ∀ γ : Γ, Measure.modularCharacter (γ : G) = Measure.modularCharacter γ)

theorem integral_eq (f : G → ℝ) (hf : Continuous f) (hfc : HasCompactSupport f) :
    ∫ g, f g ∂μ = ∫ x, fiberIntegral Γ ν f x ∂(measure Γ μ ν hΓ hmod) := by
  sorry

theorem invariant (g : G) :
    Measure.map (rightAct Γ g) (measure Γ μ ν hΓ hmod) = measure Γ μ ν hΓ hmod := by
  sorry

theorem unique (lam : Measure (Cosets Γ)) (hlam : ∀ g : G, Measure.map (rightAct Γ g) lam = lam)
    [IsFiniteMeasureOnCompacts lam] : ∃ c : ℝ≥0∞, lam = c • measure Γ μ ν hΓ hmod := by
  sorry

theorem smul_left (c : ℝ≥0∞) (hc : c ≠ 0) (hc' : c ≠ ∞)
    [IsFiniteMeasureOnCompacts (c • ν)] [(c • ν).IsOpenPosMeasure]
    [(c • ν).IsMulRightInvariant] :
    measure Γ μ (c • ν) hΓ hmod = c⁻¹ • measure Γ μ ν hΓ hmod := by
  sorry

-- Test QuotientMeasure.trivial_subgroup
example (ν : Measure (⊥ : Subgroup G)) [ν.IsHaarMeasure] [ν.IsMulRightInvariant]
    (hν : ν = Measure.dirac 1)
    (hmod' : ∀ γ : (⊥ : Subgroup G), Measure.modularCharacter (γ : G) = Measure.modularCharacter γ) :
    Measure.map (Quotient.mk _) μ = measure (⊥ : Subgroup G) μ ν (by simp) hmod' := by
  sorry

-- Test QuotientMeasure.z_in_r
/-- `ℤ\ℝ` has volume one for Lebesgue measure and counting measure on `ℤ` (written
multiplicatively). -/
example [MeasurableSpace (Subgroup.zpowers (Multiplicative.ofAdd (1 : ℝ)))]
    [LocallyCompactSpace (Subgroup.zpowers (Multiplicative.ofAdd (1 : ℝ)))]
    [MeasurableSpace (Multiplicative ℝ)] [BorelSpace (Multiplicative ℝ)]
    (μ : Measure (Multiplicative ℝ)) [μ.IsHaarMeasure] [μ.IsMulRightInvariant]
    (hμ : μ = Measure.map Multiplicative.ofAdd volume)
    (hΓ : IsClosed ((Subgroup.zpowers (Multiplicative.ofAdd (1 : ℝ)) : Subgroup _) : Set (Multiplicative ℝ)))
    [Measure.IsHaarMeasure (Measure.count : Measure (Subgroup.zpowers (Multiplicative.ofAdd (1 : ℝ))))]
    (hmod : ∀ γ : Subgroup.zpowers (Multiplicative.ofAdd (1 : ℝ)),
      Measure.modularCharacter (γ : Multiplicative ℝ) = Measure.modularCharacter γ) :
    measure (Subgroup.zpowers (Multiplicative.ofAdd (1 : ℝ))) μ Measure.count hΓ hmod Set.univ = 1 := by
  sorry

-- Test QuotientMeasure.borel_no_invariant
/-- For the upper triangular Borel `B ⊂ SL_2(ℝ)` the modular characters disagree on `B`, so no
invariant measure on `B\SL_2(ℝ)` exists. -/
example (B : Subgroup (Matrix.SpecialLinearGroup (Fin 2) ℝ))
    (hB : ∀ g, g ∈ B ↔ (g : Matrix (Fin 2) (Fin 2) ℝ) 1 0 = 0) [MeasurableSpace (Matrix.SpecialLinearGroup (Fin 2) ℝ)]
    [TopologicalSpace B] [IsTopologicalGroup B] [LocallyCompactSpace B] :
    ∃ b : B, Measure.modularCharacter b ≠ 1 := by
  sorry

/-- `AA.2/quotient-integral-integrable`. -/
theorem integral_eq_of_integrable (f : G → ℝ) (hf : Integrable f μ) :
    ∫ g, f g ∂μ = ∫ x, fiberIntegral Γ ν f x ∂(measure Γ μ ν hΓ hmod) := by
  sorry

end QuotientMeasure

namespace AdelicPoints

variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]

instance pointsMeasurableSpace (R : Type) [CommRing R] [Algebra F R] [TopologicalSpace R] :
    MeasurableSpace (WithConv (H →ₐ[F] R)) := borel _

instance (R : Type) [CommRing R] [Algebra F R] [TopologicalSpace R] :
    BorelSpace (WithConv (H →ₐ[F] R)) := ⟨rfl⟩

variable (F H)

/-- The automorphic quotient `[G]^1 = G(F)\G(𝔸)^1`. -/
abbrev _root_.AutomorphicQuotient :=
  MulAction.orbitRel.Quotient ((diagonal F H).range.subgroupOf (normOne F H)) (normOne F H)

instance : MeasurableSpace (normOne F H) := borel _

variable {F H}

/-- `AA.2/automorphic-quotient-measure`. -/
def _root_.AutomorphicQuotient.measure (dx : Measure (AdelicPoints F H)) : Measure (AutomorphicQuotient F H) :=
  sorry

/-- Its transport to `G(F) A_G(ℝ)^0 \ G(𝔸)`. -/
def _root_.AutomorphicQuotient.measure_split (dx : Measure (AdelicPoints F H)) :
    Measure (MulAction.orbitRel.Quotient ((diagonal F H).range ⊔ SplitComponent F H : Subgroup (AdelicPoints F H)) (AdelicPoints F H)) :=
  sorry

theorem _root_.AutomorphicQuotient.invariant (dx : Measure (AdelicPoints F H)) (g : normOne F H) :
    Measure.map (QuotientMeasure.rightAct ((diagonal F H).range.subgroupOf (normOne F H)) g)
      (AutomorphicQuotient.measure dx) = AutomorphicQuotient.measure dx := by
  sorry

theorem _root_.AutomorphicQuotient.smul_haar (dx : Measure (AdelicPoints F H)) (c : ℝ≥0∞) :
    AutomorphicQuotient.measure (c • dx) = c • AutomorphicQuotient.measure dx := by
  sorry

-- Test AutomorphicQuotient.semisimple
example (dx : Measure (AdelicPoints F H)) (h : Subsingleton (RationalCharacter F H)) :
    normOne F H = ⊤ := by
  sorry

-- Test AutomorphicQuotient.gl1_rat
example (H : Type) [CommRing H] [HopfAlgebra ℚ H]
    (eGm : ∀ (R : Type) [CommRing R] [Algebra ℚ R], WithConv (H →ₐ[ℚ] R) ≃* Rˣ)
    (dx : Measure (AdelicPoints ℚ H))
    (hdx : dx = Measure.map (fun a => (eGm _).symm a) (NumberField.ideleHaar ℚ)) :
    AutomorphicQuotient.measure dx Set.univ = 1 := by
  sorry

-- Test AutomorphicQuotient.not_full_quotient
/-- For `GL_1`, the norm-one quotient has finite volume while the split component `ℝ_{>0}` is not
compact, so `F^×\𝔸^×` has infinite volume. -/
example (eGm : ∀ (R : Type) [CommRing R] [Algebra F R], WithConv (H →ₐ[F] R) ≃* Rˣ)
    (dx : Measure (AdelicPoints F H)) [dx.IsHaarMeasure] :
    AutomorphicQuotient.measure dx Set.univ < ∞ ∧ ¬ CompactSpace (SplitComponent F H) := by
  sorry

/-- `AA.2/central-character-l2`: the Hilbert space `L²(G(F)\G(𝔸), ω)` for a closed central
subgroup `𝔛` and a unitary character `ω` of `𝔛`. The carrier is left unconstructed here: it is the
`L²` space of `(𝔛, ω)`-equivariant functions modulo null functions. -/
def _root_.CentralCharL2 (𝔛 : Subgroup (AdelicPoints F H)) (ω : 𝔛 →* Circle) : Type := sorry

variable (𝔛 : Subgroup (AdelicPoints F H)) (ω : 𝔛 →* Circle)

instance : NormedAddCommGroup (CentralCharL2 𝔛 ω) := sorry
instance : InnerProductSpace ℂ (CentralCharL2 𝔛 ω) := sorry
instance : CompleteSpace (CentralCharL2 𝔛 ω) := sorry

def _root_.CentralCharL2.rightReg : AdelicPoints F H →* (CentralCharL2 𝔛 ω →L[ℂ] CentralCharL2 𝔛 ω) := sorry

@[simp] theorem _root_.CentralCharL2.rightReg_central (z : 𝔛) (φ : CentralCharL2 𝔛 ω) :
    CentralCharL2.rightReg 𝔛 ω z φ = ((ω z : Circle) : ℂ) • φ := by
  sorry

/-- A representative function on `G(𝔸)` of an element of `CentralCharL2`. -/
def _root_.CentralCharL2.toFun : CentralCharL2 𝔛 ω → AdelicPoints F H → ℂ := sorry

theorem _root_.CentralCharL2.inner_def (dx : Measure (AdelicPoints F H)) (D : Set (AdelicPoints F H))
    (hD : IsFundamentalDomain ((diagonal F H).range ⊔ 𝔛 : Subgroup (AdelicPoints F H)) D dx)
    (φ ψ : CentralCharL2 𝔛 ω) :
    inner ℂ φ ψ = ∫ g in D, starRingEnd ℂ (CentralCharL2.toFun 𝔛 ω φ g) * CentralCharL2.toFun 𝔛 ω ψ g ∂dx := by
  sorry

theorem _root_.CentralCharL2.continuous_rightReg (φ : CentralCharL2 𝔛 ω) :
    Continuous (fun g : AdelicPoints F H => CentralCharL2.rightReg 𝔛 ω g φ) := by
  sorry

-- Test CentralCharL2.trivial_X
example (ω : (⊥ : Subgroup (AdelicPoints F H)) →* Circle)
    (μX : Measure (MulAction.orbitRel.Quotient (diagonal F H).range (AdelicPoints F H))) :
    Nonempty (CentralCharL2 (⊥ : Subgroup (AdelicPoints F H)) ω ≃ₗᵢ[ℂ] MeasureTheory.Lp ℂ 2 μX) := by
  sorry

-- Test CentralCharL2.gl1_dim
example (eGm : ∀ (R : Type) [CommRing R] [Algebra F R], WithConv (H →ₐ[F] R) ≃* Rˣ)
    (ω : (⊤ : Subgroup (AdelicPoints F H)) →* Circle) :
    Module.finrank ℂ (CentralCharL2 ⊤ ω) = 1 ↔ ∀ g, ω ⟨diagonal F H g, trivial⟩ = 1 := by
  sorry

-- Test CentralCharL2.nontrivial_on_rational
example (z : 𝔛) (hz : (z : AdelicPoints F H) ∈ (diagonal F H).range) (hω : ω z ≠ 1) :
    Subsingleton (CentralCharL2 𝔛 ω) := by
  sorry

/-- `AA.2/central-quotient-change`. -/
theorem centralQuotientChange (𝔛' : Subgroup (AdelicPoints F H)) (h𝔛 : 𝔛' ≤ 𝔛) (ω' : 𝔛' →* Circle) :
    Nonempty (CentralCharL2 𝔛' ω' ≃ₗᵢ[ℂ]
      lp (fun ω : {ω : 𝔛 →* Circle // ∀ z : 𝔛', ω ⟨z, h𝔛 z.2⟩ = ω' z} => CentralCharL2 𝔛 ω.1) 2) := by
  sorry

end AdelicPoints

namespace GaugeForm

variable (F : Type) [Field F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- The cotangent space `𝔪/𝔪²` at the identity (Tau Ceti `Bialgebra.CotangentSpace`). -/
abbrev CotangentAtOne := (RingHom.ker (Bialgebra.counitAlgHom F H)).Cotangent

end GaugeForm

/-- `AA.2/invariant-top-form`: left-invariant top-degree forms `∧^d (𝔪/𝔪²)`. -/
abbrev GaugeForm (F : Type) [Field F] (H : Type) [CommRing H] [HopfAlgebra F H] (d : ℕ) :=
  ⋀[F]^d (GaugeForm.CotangentAtOne F H)

namespace GaugeForm

variable {F : Type} [Field F] {H : Type} [CommRing H] [HopfAlgebra F H]

theorem finrank_eq_one (d : ℕ) [Algebra.Smooth F H] (hd : Module.finrank F (CotangentAtOne F H) = d) :
    Module.finrank F (GaugeForm F H d) = 1 := by
  sorry

/-- Base change of gauge forms along a field extension `F → F'`, for a Hopf algebra `H'` over
`F'` identified with `F' ⊗_F H`. -/
def baseChange (d : ℕ) (F' : Type) [Field F'] [Algebra F F'] (H' : Type) [CommRing H'] [HopfAlgebra F' H']
    (e : F' ⊗[F] H ≃ₐ[F'] H') :
    F' ⊗[F] GaugeForm F H d ≃ₗ[F'] GaugeForm F' H' d := sorry

/-- Right translation by a point acts on gauge forms through `det (Ad g)⁻¹`. -/
def rightTranslate (d : ℕ) (g : WithConv (H →ₐ[F] F)) : GaugeForm F H d →ₗ[F] GaugeForm F H d := sorry

/-- The coadjoint action of a rational point on the cotangent space at the identity. -/
def coadjoint (g : WithConv (H →ₐ[F] F)) : CotangentAtOne F H →ₗ[F] CotangentAtOne F H := sorry

theorem rightTranslate_eq_smul (d : ℕ) (hd : Module.finrank F (CotangentAtOne F H) = d)
    (g : WithConv (H →ₐ[F] F)) (ω : GaugeForm F H d) :
    rightTranslate d g ω = LinearMap.det (coadjoint g) • ω := by
  sorry

/-- The gauge form attached to an element of the augmentation ideal (for `d = 1`). -/
def ofElement (a : H) (ha : a ∈ RingHom.ker (Bialgebra.counitAlgHom F H)) : GaugeForm F H 1 :=
  exteriorPower.ιMulti F 1 (fun _ => (RingHom.ker (Bialgebra.counitAlgHom F H)).toCotangent ⟨a, ha⟩)

-- Test GaugeForm.gm
/-- For `G_m`, the cotangent space at `1` is one-dimensional, spanned by the class of `T - 1`
(the gauge form `dT/T`). -/
example (eGm : H ≃ₐ[F] MonoidAlgebra F (Multiplicative ℤ)) :
    Module.finrank F (CotangentAtOne F H) = 1 := by
  sorry

-- Test GaugeForm.trivial_group
example : Module.finrank F (GaugeForm F H 0) = 1 := by
  sorry

-- Test GaugeForm.borel_not_biinvariant
/-- For the Borel subgroup of `GL_2`, some right translate of a gauge form is not the form itself. -/
example (eB : ∀ (R : Type) [CommRing R] [Algebra F R], WithConv (H →ₐ[F] R) →* GL (Fin 2) R)
    (hinj : ∀ (R : Type) [CommRing R] [Algebra F R], Function.Injective (eB R))
    (hB : ∀ (R : Type) [CommRing R] [Algebra F R] (x : WithConv (H →ₐ[F] R)),
      (eB R x : Matrix (Fin 2) (Fin 2) R) 1 0 = 0)
    (himage : ∀ (R : Type) [CommRing R] [Algebra F R] (g : GL (Fin 2) R),
      (g : Matrix (Fin 2) (Fin 2) R) 1 0 = 0 → ∃ x, eB R x = g)
    (h2 : (2 : F) ≠ 0) :
    ∃ g : WithConv (H →ₐ[F] F), ∃ ω : GaugeForm F H 3, rightTranslate 3 g ω ≠ ω := by
  sorry

variable [NumberField F]

/-- `AA.2/local-form-measure`: the Haar measure `|ω|_v` on `G(F_v)`. -/
def localMeasure (d : ℕ) (ω : GaugeForm F H d) (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    Measure (AdelicPoints.LocalPoints F H v) := sorry

variable (d : ℕ) (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))

theorem localMeasure_isHaar (ω : GaugeForm F H d) (hω : ω ≠ 0) : (localMeasure d ω v).IsHaarMeasure := by
  sorry

/-- The normalized absolute value on `F_v` (GlobalNumberFields layer 0). -/
def _root_.NumberField.localAbs (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)) :
    v.adicCompletion F → ℝ≥0∞ := sorry

/-- `det (Ad g)` for a local point `g ∈ G(F_v)`. -/
def localDetAd (g : AdelicPoints.LocalPoints F H v) : v.adicCompletion F := sorry

theorem localMeasure_smul (ω : GaugeForm F H d) (c : F) :
    localMeasure d (c • ω) v = NumberField.localAbs v (algebraMap F _ c) • localMeasure d ω v := by
  sorry

theorem localMeasure_rightTranslate (ω : GaugeForm F H d) (g : AdelicPoints.LocalPoints F H v) :
    Measure.map (· * g) (localMeasure d ω v) =
      NumberField.localAbs v (localDetAd v g) • localMeasure d ω v := by
  sorry

-- Test GaugeForm.localMeasure_ga
/-- For `G_a` with coordinate `T`, the image of `|dT|_v` under `x ↦ x(T)` is the standard Haar
measure of `F_v`. -/
example (T : H) (h1 : T ∈ RingHom.ker (Bialgebra.counitAlgHom F H))
    (eGa : H ≃ₐ[F] Polynomial F) (heT : eGa T = Polynomial.X)
    [MeasurableSpace (v.adicCompletion F)] (μv : Measure (v.adicCompletion F)) [μv.IsAddHaarMeasure]
    (hμv : μv (v.adicCompletionIntegers F) = 1) :
    Measure.map (fun x : AdelicPoints.LocalPoints F H v => WithConv.ofConv x T)
      (localMeasure 1 (ofElement T h1) v) = μv := by
  sorry

-- Test GaugeForm.localMeasure_gm_units
/-- For `G_m` with coordinate `T` (so `T - 1` gives `dT/T`), the units `𝒪_v^×` have volume
`1 - q_v⁻¹`. -/
example (T : H)
    (eGm : H ≃ₐ[F] MonoidAlgebra F (Multiplicative ℤ))
    (heT : eGm T = MonoidAlgebra.single (Multiplicative.ofAdd (1 : ℤ)) 1)
    (h1 : T - 1 ∈ RingHom.ker (Bialgebra.counitAlgHom F H)) :
    localMeasure 1 (ofElement (T - 1) h1) v
        {x | (WithConv.ofConv x) T ∈ v.adicCompletionIntegers F ∧
          (WithConv.ofConv x) (HopfAlgebra.antipode F T) ∈ v.adicCompletionIntegers F} =
      1 - (Ideal.absNorm v.asIdeal : ℝ≥0∞)⁻¹ := by
  sorry

-- Test GaugeForm.localMeasure_not_normalized
example (q : ℕ) (hq : 1 < q) : (1 - (q : ℝ≥0∞)⁻¹) ≠ 1 := by
  sorry

end GaugeForm

namespace Tamagawa

/-- `AA.2/convergence-factors`: the local factor `det(1 - q^{-s} Frob | X^{I_v})⁻¹`, for the matrix
of Frobenius on the inertia invariants of the character module (rank `r`). -/
def localFactor (r : ℕ) (frob : Matrix (Fin r) (Fin r) ℤ) (q : ℕ) (s : ℝ) : ℝ :=
  ((1 : Matrix (Fin r) (Fin r) ℝ) - ((q : ℝ) ^ (-s)) • frob.map (Int.cast)).det⁻¹

@[simp] theorem localFactor_trivial (r : ℕ) (q : ℕ) (s : ℝ) :
    localFactor r 1 q s = ((1 - (q : ℝ) ^ (-s)) ^ r)⁻¹ := by
  sorry

/-- The leading coefficient `ρ_G = lim_{s→1⁺} (s-1)^r ∏_v L_v(X, s)`, when it exists. -/
def leadingCoeff (r : ℕ) (L : ℝ → ℝ) : ℝ := limUnder (𝓝[>] 1) (fun s => (s - 1) ^ r * L s)

theorem leadingCoeff_split (F : Type) [Field F] [NumberField F] (r : ℕ) :
    leadingCoeff r (fun s => (NumberField.dedekindZeta F s).re ^ r) = NumberField.dedekindZeta_residue F ^ r := by
  sorry

-- Test Tamagawa.localFactor_gm
example (q : ℕ) : localFactor 1 1 q 1 = (1 - (q : ℝ)⁻¹)⁻¹ := by
  sorry

-- Test Tamagawa.localFactor_semisimple
example (q : ℕ) (s : ℝ) : localFactor 0 1 q s = 1 := by
  sorry

-- Test Tamagawa.localFactor_res_gm
/-- For `Res_{ℚ(i)/ℚ} G_m` at an inert prime `p` Frobenius swaps the two characters. -/
example (p : ℕ) :
    localFactor 2 !![0, 1; 1, 0] p 1 = ((1 - (p : ℝ)⁻¹) * (1 + (p : ℝ)⁻¹))⁻¹ := by
  sorry

variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]

/-- `AA.2/tamagawa-measure`. -/
def measure (d : ℕ) (ω : GaugeForm F H d) : Measure (AdelicPoints F H) := sorry

theorem measure_isHaar (d : ℕ) (ω : GaugeForm F H d) (hω : ω ≠ 0) : (measure d ω).IsHaarMeasure := by
  sorry

/-- REVIEW: the infinite product below requires convergence and canonical `μinf`, `lamv` and
`ρ` hypotheses. Arbitrary values of those parameters do not describe the Tamagawa measure. -/
theorem measure_eq_product (d : ℕ) (ω : GaugeForm F H d) (M : IntegralModel F H)
    (S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F)))
    (C : ∀ v, Set (AdelicPoints.LocalPoints F H v)) (hC : ∀ v ∉ S, C v = M.localPoints v)
    (Cinf : Set (AdelicPoints.InfinitePoints F H)) (μinf : Measure (AdelicPoints.InfinitePoints F H))
    (lamv : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F) → ℝ≥0∞) (ρ : ℝ≥0∞) :
    measure d ω {x | AdelicPoints.mapPoints (NumberField.adeleInfAlg F) x ∈ Cinf ∧
        ∀ v, AdelicPoints.proj F H v x ∈ C v} =
      ENNReal.ofReal (Real.sqrt |(NumberField.discr F : ℝ)|) ^ (-(d : ℤ)) * ρ⁻¹ * μinf Cinf *
        ∏' v, lamv v * GaugeForm.localMeasure d ω v (C v) := by
  sorry

theorem measure_ga (ω : GaugeForm F H 1) (eGa : ∀ (R : Type) [CommRing R] [Algebra F R],
    WithConv (H →ₐ[F] R) ≃ R) (hω : ω ≠ 0) :
    Measure.map (eGa _) (measure 1 ω) =
      ENNReal.ofReal (Real.sqrt |(NumberField.discr F : ℝ)|)⁻¹ • NumberField.adeleHaar F := by
  sorry

theorem measure_res (E : Type) [Field E] [NumberField E] [Algebra F E] [FiniteDimensional F E]
    (HE HRes : Type) [CommRing HE] [HopfAlgebra E HE] [CommRing HRes] [HopfAlgebra F HRes]
    (e : AdelicPoints.WeilRestrictionPoints F E HE HRes) (d : ℕ) (ωE : GaugeForm E HE d)
    (ωR : GaugeForm F HRes (d * Module.finrank F E)) :
    Measure.map (AdelicPoints.resEquiv F E HE HRes e) (measure _ ωR) = measure d ωE := by
  sorry

-- Test Tamagawa.measure_ga_selfdual
/-- For `G_a` over `ℚ` with `ω = dT`, the fundamental domain `[0,1) × ℤ̂` has Tamagawa volume one. -/
example (H : Type) [CommRing H] [HopfAlgebra ℚ H] (T : H)
    (eGa : ∀ (R : Type) [CommRing R] [Algebra ℚ R], WithConv (H →ₐ[ℚ] R) ≃ R)
    (hT : ∀ (R : Type) [CommRing R] [Algebra ℚ R] (x : WithConv (H →ₐ[ℚ] R)), eGa R x = WithConv.ofConv x T)
    (h1 : T ∈ RingHom.ker (Bialgebra.counitAlgHom ℚ H)) :
    measure 1 (GaugeForm.ofElement T h1) ((eGa _) ⁻¹'
      (((NumberField.InfiniteAdeleRing.ringEquiv_mixedSpace ℚ) ⁻¹' {x | ∀ w, x.1 w ∈ Ico (0 : ℝ) 1}) ×ˢ
        NumberField.finiteIntegers ℚ)) = 1 := by
  sorry

-- Test Tamagawa.measure_trivial
example (e : H ≃ₐ[F] F) (ω : GaugeForm F H 0) (hω : ω = exteriorPower.ιMulti F 0 (fun i => i.elim0)) :
    measure 0 ω = Measure.dirac 1 := by
  sorry

-- Test Tamagawa.measure_not_naive_product
example : ¬ Summable (fun p : Nat.Primes => (1 : ℝ) / p) := by
  sorry

/-- `AA.2/tamagawa-number`. -/
def number (d : ℕ) (ω : GaugeForm F H d) : ℝ≥0∞ :=
  AutomorphicQuotient.measure (measure d ω) Set.univ

theorem number_pos (d : ℕ) (ω : GaugeForm F H d) (hω : ω ≠ 0) : 0 < number d ω := by
  sorry

theorem number_res (E : Type) [Field E] [NumberField E] [Algebra F E] [FiniteDimensional F E]
    (HE HRes : Type) [CommRing HE] [HopfAlgebra E HE] [CommRing HRes] [HopfAlgebra F HRes]
    (e : AdelicPoints.WeilRestrictionPoints F E HE HRes) (d : ℕ) (ωE : GaugeForm E HE d)
    (ωR : GaugeForm F HRes (d * Module.finrank F E)) (hωE : ωE ≠ 0) (hωR : ωR ≠ 0) :
    number _ ωR = number d ωE := by
  sorry

-- Test Tamagawa.number_trivial
example (e : H ≃ₐ[F] F) (ω : GaugeForm F H 0) (hω : ω = exteriorPower.ιMulti F 0 (fun i => i.elim0)) :
    number 0 ω = 1 := by
  sorry

-- Test Tamagawa.number_gm_statement
example (eGm : H ≃ₐ[F] MonoidAlgebra F (Multiplicative ℤ)) (ω : GaugeForm F H 1) (hω : ω ≠ 0) :
    number 1 ω = 1 := by
  sorry

-- Test Tamagawa.number_not_full_quotient
example (eGm : H ≃ₐ[F] MonoidAlgebra F (Multiplicative ℤ)) :
    ¬ CompactSpace (SplitComponent F H) := by
  sorry

/-- `AA.2/tamagawa-independent-of-form`. -/
theorem measure_smul (d : ℕ) (ω : GaugeForm F H d) (c : F) (hc : c ≠ 0) :
    measure d (c • ω) = measure d ω := by
  sorry

end Tamagawa

/-! ## AA.3 Reduction theory -/

namespace Parabolic

variable {F : Type} [Field F] {H : Type} [CommRing H] [HopfAlgebra F H]

/-- The points of a parabolic as a subgroup of the points of `G` (image under the closed
immersion). -/
def toSubgroup (P : Parabolic F H) (R : Type) [CommRing R] [Algebra F R] : Subgroup (WithConv (H →ₐ[F] R)) :=
  sorry

end Parabolic

namespace Reduction

variable (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]

/-- `AA.3/minimal-parabolic-data`: a minimal `F`-parabolic `P_0` with its simple relative roots and
the standard parabolics attached to subsets of them (Borel–Tits, requested from RG2.1). -/
structure MinimalParabolic where
  P0 : Parabolic F H
  SimpleRoot : Type
  [fintype : Fintype SimpleRoot]
  [decEq : DecidableEq SimpleRoot]
  standard : Finset SimpleRoot → Parabolic F H

attribute [instance] MinimalParabolic.fintype MinimalParabolic.decEq

variable {F H}

/-- The standard parabolics: those containing `P_0`. -/
def StandardParabolic (D : MinimalParabolic F H) : Type 1 :=
  {P : Parabolic F H // ∀ (R : Type) [CommRing R] [Algebra F R], D.P0.toSubgroup R ≤ P.toSubgroup R}

def standardParabolic_equiv_subsets (D : MinimalParabolic F H) :
    StandardParabolic D ≃ Finset D.SimpleRoot := sorry

noncomputable instance (D : MinimalParabolic F H) : Fintype (StandardParabolic D) :=
  Fintype.ofEquiv _ (standardParabolic_equiv_subsets D).symm

theorem exists_unique_standard_conj (D : MinimalParabolic F H) (P : Parabolic F H) :
    ∃! Q : StandardParabolic D, ∃ γ : WithConv (H →ₐ[F] F),
      (P.toSubgroup F).map (MulAut.conj γ).toMonoidHom = Q.1.toSubgroup F := by
  sorry

theorem StandardParabolic.le_iff (D : MinimalParabolic F H) (P Q : StandardParabolic D) :
    (∀ (R : Type) [CommRing R] [Algebra F R], P.1.toSubgroup R ≤ Q.1.toSubgroup R) ↔
      standardParabolic_equiv_subsets D P ⊆ standardParabolic_equiv_subsets D Q := by
  sorry

-- Test Reduction.standardParabolic_gl3_card
example (D : MinimalParabolic F H) (h : Fintype.card D.SimpleRoot = 2) :
    Fintype.card (StandardParabolic D) = 4 := by
  sorry

-- Test Reduction.standardParabolic_anisotropic
example (D : MinimalParabolic F H) (h : IsEmpty D.SimpleRoot) : Fintype.card (StandardParabolic D) = 1 := by
  sorry

-- Test Reduction.standardParabolic_not_all_parabolics
/-- For `GL_2`, the lower triangular Borel is a parabolic that is not standard. -/
example (D : MinimalParabolic F H) (e : ∀ (R : Type) [CommRing R] [Algebra F R], WithConv (H →ₐ[F] R) ≃* GL (Fin 2) R)
    (hB : ∀ g, g ∈ D.P0.toSubgroup F ↔ (e F g : Matrix (Fin 2) (Fin 2) F) 1 0 = 0) :
    ∃ P : Parabolic F H, ∀ Q : StandardParabolic D, Q.1.toSubgroup F ≠ P.toSubgroup F := by
  sorry

/-- `AA.3/relative-chamber`: the real vector space `a_P = a_{M_P}`. -/
abbrev aP {D : MinimalParabolic F H} (P : StandardParabolic D) := RealCharacterSpace F P.1.HP

/-- Restriction of rational characters, dualized. REVIEW: the imported parabolic/split-centre
structures must supply this canonical projection and its canonical splitting. -/
def aPProjection {D : MinimalParabolic F H} (P₁ P₂ : StandardParabolic D)
    (h : ∀ (R : Type) [CommRing R] [Algebra F R], P₁.1.toSubgroup R ≤ P₂.1.toSubgroup R) :
    aP P₁ →ₗ[ℝ] aP P₂ := sorry

def aP_decomp {D : MinimalParabolic F H} (P₁ P₂ : StandardParabolic D) (h : ∀ (R : Type) [CommRing R] [Algebra F R],
    P₁.1.toSubgroup R ≤ P₂.1.toSubgroup R) :
    aP P₁ ≃ₗ[ℝ] aP P₂ × (aPProjection P₁ P₂ h).ker := sorry

def rho {D : MinimalParabolic F H} (P : StandardParabolic D) : aP P →ₗ[ℝ] ℝ := sorry

def simpleRoots {D : MinimalParabolic F H} (P : StandardParabolic D) : Finset (aP P →ₗ[ℝ] ℝ) := sorry

def positiveChamber {D : MinimalParabolic F H} (P : StandardParabolic D) : Set (aP P) :=
  {a | ∀ α ∈ simpleRoots P, 0 < α a}

-- Test Reduction.rho_gl2
/-- For the Borel of `GL_2`, `ρ` pairs to `(1/2)(e_1 - e_2)`: on `H_0(diag(a, d))` it is
`(log ‖a‖ - log ‖d‖)/2`. -/
example {D : MinimalParabolic F H} (P : StandardParabolic D) (a d : ℝ) (Ha : aP P)
    (hH : ∀ α ∈ simpleRoots P, α Ha = a - d) (hcard : (simpleRoots P).card = 1) :
    rho P Ha = (a - d) / 2 := by
  sorry

-- Test Reduction.aP_top
example {D : MinimalParabolic F H} (P : StandardParabolic D) (hP : Function.Bijective P.1.restrict)
    (hss : Subsingleton (RationalCharacter F H)) : Subsingleton (aP P) := by
  sorry

-- Test Reduction.positiveChamber_not_cone_of_all_roots
/-- For `GL_3`, positivity of the non-simple root `e_1 - e_3` does not imply membership in `a_0^+`. -/
example : ¬ ∀ x : Fin 3 → ℝ, 0 < x 0 - x 2 → (0 < x 0 - x 1 ∧ 0 < x 1 - x 2) := by
  sorry

/-- `AA.3/good-maximal-compact`: an admissible maximal compact subgroup of `G(𝔸)`, with the
Iwasawa decomposition for every standard parabolic. The hyperspecial and special conditions on the
local factors are part of the intended definition and are not stated in this prototype. -/
structure AdmissibleCompact (D : MinimalParabolic F H) where
  K : Subgroup (AdelicPoints F H)
  isCompact' : IsCompact (K : Set (AdelicPoints F H))
  iwasawa : ∀ P : StandardParabolic D,
    (P.1.toSubgroup (NumberField.AdeleRing (NumberField.RingOfIntegers F) F) : Set (AdelicPoints F H)) *
      (K : Set (AdelicPoints F H)) = Set.univ

def AdmissibleCompact.toSubgroup {D : MinimalParabolic F H} (K : AdmissibleCompact D) :
    Subgroup (AdelicPoints F H) := K.K

theorem AdmissibleCompact.isCompact {D : MinimalParabolic F H} (K : AdmissibleCompact D) :
    IsCompact (K.toSubgroup : Set (AdelicPoints F H)) := K.isCompact'

theorem AdmissibleCompact.exists (D : MinimalParabolic F H) : Nonempty (AdmissibleCompact D) := by
  sorry

-- Test Reduction.AdmissibleCompact.gln
/-- For `GL_n` over `ℚ`, `O(n) × ∏_p GL_n(ℤ_p)` is admissible; here: an admissible `K` exists. -/
example (n : ℕ) (H : Type) [CommRing H] [HopfAlgebra ℚ H] (D : MinimalParabolic ℚ H)
    (e : ∀ (R : Type) [CommRing R] [Algebra ℚ R], WithConv (H →ₐ[ℚ] R) ≃* GL (Fin n) R) :
    Nonempty (AdmissibleCompact D) := by
  sorry

-- Test Reduction.AdmissibleCompact.anisotropic
example (D : MinimalParabolic F H) (h : IsEmpty D.SimpleRoot) (K : Subgroup (AdelicPoints F H))
    (hK : IsCompact (K : Set (AdelicPoints F H))) (P : StandardParabolic D)
    (hP : P.1.toSubgroup (NumberField.AdeleRing (NumberField.RingOfIntegers F) F) = ⊤) :
    (P.1.toSubgroup (NumberField.AdeleRing (NumberField.RingOfIntegers F) F) : Set (AdelicPoints F H)) *
      (K : Set (AdelicPoints F H)) = Set.univ := by
  sorry

-- Test Reduction.AdmissibleCompact.not_all_places_iwahori
/-- The Iwahori subgroup of `GL_2(ℤ_p)` is not maximal: it is properly contained in `GL_2(ℤ_p)`. -/
example (p : ℕ) [Fact p.Prime] :
    ({g : GL (Fin 2) (ZMod p) | (g : Matrix (Fin 2) (Fin 2) (ZMod p)) 1 0 = 0} : Set _) ≠ Set.univ := by
  sorry

/-- `AA.3/H-P`. -/
def HP {D : MinimalParabolic F H} (K : AdmissibleCompact D) (P : StandardParabolic D) :
    AdelicPoints F H → aP P := sorry

theorem HP_nmk {D : MinimalParabolic F H} (K : AdmissibleCompact D) (P : StandardParabolic D)
    (p : AdelicPoints F P.1.HP) (k : AdelicPoints F H) (hk : k ∈ K.K) (ι : AdelicPoints F P.1.HP →* AdelicPoints F H) :
    HP K P (ι p * k) = Multiplicative.toAdd (AdelicPoints.logHeight p) := by
  sorry

theorem HP_left_P {D : MinimalParabolic F H} (K : AdmissibleCompact D) (P : StandardParabolic D)
    (p x : AdelicPoints F H) (hp : p ∈ P.1.toSubgroup _) :
    HP K P (p * x) = HP K P p + HP K P x := by
  sorry

theorem continuous_HP {D : MinimalParabolic F H} (K : AdmissibleCompact D) (P : StandardParabolic D) :
    Continuous (HP K P) := by
  sorry

theorem HP_rational {D : MinimalParabolic F H} (K : AdmissibleCompact D) (P : StandardParabolic D)
    (γ : WithConv (H →ₐ[F] F)) (hγ : γ ∈ P.1.toSubgroup F) (x : AdelicPoints F H) :
    HP K P (AdelicPoints.diagonal F H γ * x) = HP K P x := by
  sorry

-- Test Reduction.HP_gl2_borel
example {D : MinimalParabolic F H} (K : AdmissibleCompact D) (P : StandardParabolic D)
    (x : AdelicPoints F H) (hx : x ∈ P.1.toSubgroup _) (χ : RationalCharacter F P.1.HP) :
    ∃ y : AdelicPoints F P.1.HP, (HP K P x).pairing χ = Real.log (NumberField.ideleNorm (χ.apply y)) := by
  sorry

-- Test Reduction.HP_top
example {D : MinimalParabolic F H} (K : AdmissibleCompact D) (P : StandardParabolic D)
    (hP : Function.Bijective P.1.restrict) (x : AdelicPoints F H) (χ : RationalCharacter F H)
    (χP : RationalCharacter F P.1.HP) (hχ : (χP : P.1.HP) = P.1.restrict χ) :
    (HP K P x).pairing χP = (Multiplicative.toAdd (AdelicPoints.logHeight x)).pairing χ := by
  sorry

-- Test Reduction.HP_not_homomorphism
example {D : MinimalParabolic F H} (K : AdmissibleCompact D) (P : StandardParabolic D)
    (hD : Nonempty D.SimpleRoot) : ¬ ∀ x y : AdelicPoints F H, HP K P (x * y) = HP K P x + HP K P y := by
  sorry

/-- `AA.3/adelic-siegel-set`: `𝔖(T₁, ω) = {p a k : p ∈ ω, a ∈ A_0(ℝ)^0, k ∈ K, β(H_0(a) - T₁) > 0}`. -/
def siegelSet {D : MinimalParabolic F H} (K : AdmissibleCompact D) (P0 : StandardParabolic D)
    (T₁ : aP P0) (ω : Set (AdelicPoints F H)) : Set (AdelicPoints F H) :=
  {x | ∃ p ∈ ω, ∃ a ∈ SplitComponent F P0.1.HP, ∃ k ∈ K.K,
    x = p * AdelicPoints.map P0.1.restrict a * k ∧
      ∀ β ∈ simpleRoots P0, 0 < β (Multiplicative.toAdd (AdelicPoints.logHeight a) - T₁)}

variable {D : MinimalParabolic F H} (K : AdmissibleCompact D) (P0 : StandardParabolic D)

theorem mem_siegelSet (T₁ : aP P0) (ω : Set (AdelicPoints F H)) (x : AdelicPoints F H) :
    x ∈ siegelSet K P0 T₁ ω ↔ ∃ p ∈ ω, ∃ a ∈ SplitComponent F P0.1.HP, ∃ k ∈ K.K,
      x = p * AdelicPoints.map P0.1.restrict a * k ∧
        ∀ β ∈ simpleRoots P0, 0 < β (Multiplicative.toAdd (AdelicPoints.logHeight a) - T₁) := Iff.rfl

theorem siegelSet_mono (T₁ T₁' : aP P0) (ω ω' : Set (AdelicPoints F H))
    (hT : ∀ β ∈ simpleRoots P0, β T₁' ≤ β T₁) (hω : ω ⊆ ω') :
    siegelSet K P0 T₁ ω ⊆ siegelSet K P0 T₁' ω' := by
  sorry

theorem siegelSet_mul_K (T₁ : aP P0) (ω : Set (AdelicPoints F H)) :
    siegelSet K P0 T₁ ω * (K.K : Set (AdelicPoints F H)) = siegelSet K P0 T₁ ω := by
  sorry

theorem siegelSet_center (T₁ : aP P0) (ω : Set (AdelicPoints F H)) (z : AdelicPoints F H)
    (hz : z ∈ SplitComponent F H) : z • siegelSet K P0 T₁ ω = siegelSet K P0 T₁ ω := by
  sorry

-- Test Reduction.siegelSet_sl2
/-- For `SL_2` over `ℚ`, a suitable Siegel set meets every `SL_2(ℚ)`-orbit (it contains the
standard fundamental domain at the archimedean place). -/
example (H : Type) [CommRing H] [HopfAlgebra ℚ H] (D : MinimalParabolic ℚ H) (K : AdmissibleCompact D)
    (P0 : StandardParabolic D)
    (e : ∀ (R : Type) [CommRing R] [Algebra ℚ R], WithConv (H →ₐ[ℚ] R) ≃* Matrix.SpecialLinearGroup (Fin 2) R) :
    ∃ T₁ ω, IsCompact ω ∧ ∀ x : AdelicPoints ℚ H, ∃ γ, AdelicPoints.diagonal ℚ H γ * x ∈ siegelSet K P0 T₁ ω := by
  sorry

-- Test Reduction.siegelSet_anisotropic
example (h : IsEmpty D.SimpleRoot) (T₁ : aP P0) (ω : Set (AdelicPoints F H))
    (hω : ω * (AdelicPoints.map P0.1.restrict '' (SplitComponent F P0.1.HP : Set _)) = ω) :
    siegelSet K P0 T₁ ω = ω * (K.K : Set (AdelicPoints F H)) := by
  sorry

-- Test Reduction.siegelSet_not_fundamental_domain
example (hD : Nonempty D.SimpleRoot) (T₁ : aP P0) (ω : Set (AdelicPoints F H))
    (hcover : ∀ x, ∃ γ, AdelicPoints.diagonal F H γ * x ∈ siegelSet K P0 T₁ ω) :
    ∃ γ ≠ 1, ((AdelicPoints.diagonal F H γ) • siegelSet K P0 T₁ ω ∩ siegelSet K P0 T₁ ω).Nonempty := by
  sorry

/-- `AA.3/siegel-covering-adelic` (Borel–Harish-Chandra). -/
theorem siegel_covering :
    ∃ (T₁ : aP P0) (ω : Set (AdelicPoints F H)), IsCompact ω ∧
      ∀ x : AdelicPoints F H, ∃ γ : WithConv (H →ₐ[F] F), AdelicPoints.diagonal F H γ * x ∈ siegelSet K P0 T₁ ω := by
  sorry

/-- `AA.3/siegel-finiteness-adelic`. -/
theorem siegel_finiteness (T₁ : aP P0) (ω : Set (AdelicPoints F H)) (hω : IsCompact ω) :
    {γ : WithConv (H →ₐ[F] F) | ((AdelicPoints.diagonal F H γ) • siegelSet K P0 T₁ ω ∩ siegelSet K P0 T₁ ω).Nonempty}.Finite := by
  sorry

variable (F H)

/-- The diagonal into the finite adelic points. -/
def finiteDiagonal : WithConv (H →ₐ[F] F) →* AdelicPoints.FiniteAdelicPoints F H :=
  AdelicPoints.mapPoints (Algebra.ofId F _)

/-- `AA.3/class-number-finite`. -/
theorem classNumber_finite (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H))
    (hU : IsOpen (U : Set (AdelicPoints.FiniteAdelicPoints F H))) (hUc : IsCompact (U : Set (AdelicPoints.FiniteAdelicPoints F H))) :
    Finite (DoubleCoset.Quotient ((finiteDiagonal F H).range : Set (AdelicPoints.FiniteAdelicPoints F H)) U) := by
  sorry

variable {F H}

/-- `AA.3/arithmetic-subgroup-of-level`: `Γ_{x,U} = G(F) ∩ x U x⁻¹`. -/
def levelArithmetic (x : AdelicPoints.FiniteAdelicPoints F H) (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H)) :
    Subgroup (WithConv (H →ₐ[F] F)) :=
  (U.map (MulAut.conj x).toMonoidHom).comap (finiteDiagonal F H)

theorem levelArithmetic_discrete (x : AdelicPoints.FiniteAdelicPoints F H)
    (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H)) (hU : IsCompact (U : Set (AdelicPoints.FiniteAdelicPoints F H))) :
    DiscreteTopology ((levelArithmetic x U).map
      (AdelicPoints.mapPoints (Algebra.ofId F (NumberField.InfiniteAdeleRing F)))) := by
  sorry

theorem levelArithmetic_conj (x : AdelicPoints.FiniteAdelicPoints F H) (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H))
    (γ : WithConv (H →ₐ[F] F)) (u : AdelicPoints.FiniteAdelicPoints F H) (hu : u ∈ U) :
    levelArithmetic (finiteDiagonal F H γ * x * u) U = (levelArithmetic x U).map (MulAut.conj γ).toMonoidHom := by
  sorry

theorem levelArithmetic_commensurable (x : AdelicPoints.FiniteAdelicPoints F H)
    (U U' : Subgroup (AdelicPoints.FiniteAdelicPoints F H)) (h : U' ≤ U) (hU' : IsOpen (U' : Set (AdelicPoints.FiniteAdelicPoints F H)))
    (hU : IsCompact (U : Set (AdelicPoints.FiniteAdelicPoints F H))) :
    ((levelArithmetic x U').subgroupOf (levelArithmetic x U)).FiniteIndex := by
  sorry

-- Test Reduction.levelArithmetic_gl2
/-- For `GL_2/ℚ` and `U = GL_2(ℤ̂)`, the arithmetic group is `GL_2(ℤ)`: its elements have integral
entries and unit determinant. -/
example (H : Type) [CommRing H] [HopfAlgebra ℚ H]
    (e : ∀ (R : Type) [CommRing R] [Algebra ℚ R], WithConv (H →ₐ[ℚ] R) ≃* GL (Fin 2) R)
    (U : Subgroup (AdelicPoints.FiniteAdelicPoints ℚ H)) (γ : WithConv (H →ₐ[ℚ] ℚ))
    (hU : ∀ x, x ∈ U ↔ ∀ (i j : Fin 2) (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers ℚ)),
      ((e _ x : Matrix (Fin 2) (Fin 2) (IsDedekindDomain.FiniteAdeleRing (NumberField.RingOfIntegers ℚ) ℚ)) i j) v ∈
        v.adicCompletionIntegers ℚ ∧
      ((e _ x⁻¹ : Matrix (Fin 2) (Fin 2) (IsDedekindDomain.FiniteAdeleRing (NumberField.RingOfIntegers ℚ) ℚ)) i j) v ∈
        v.adicCompletionIntegers ℚ) :
    γ ∈ levelArithmetic 1 U ↔ (∃ A : GL (Fin 2) ℤ, ∀ i j, ((e ℚ γ : Matrix (Fin 2) (Fin 2) ℚ) i j) = (A i j : ℚ)) := by
  sorry

-- Test Reduction.levelArithmetic_trivial_group
example (eT : H ≃ₐ[F] F) (x : AdelicPoints.FiniteAdelicPoints F H) (U : Subgroup _) :
    levelArithmetic x U = ⊥ := by
  sorry

-- Test Reduction.levelArithmetic_not_conj_invariant
example (H : Type) [CommRing H] [HopfAlgebra ℚ H]
    (e : ∀ (R : Type) [CommRing R] [Algebra ℚ R], WithConv (H →ₐ[ℚ] R) ≃* GL (Fin 2) R)
    (U : Subgroup (AdelicPoints.FiniteAdelicPoints ℚ H)) (hU : (levelArithmetic 1 U).map (e ℚ).toMonoidHom ≠ ⊤) :
    ∃ x, levelArithmetic x U ≠ levelArithmetic 1 U := by
  sorry

/-- `AA.3/component-decomposition`. -/
theorem component_decomposition (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H))
    (hU : IsOpen (U : Set (AdelicPoints.FiniteAdelicPoints F H))) :
    Nonempty (DoubleCoset.Quotient ((AdelicPoints.diagonal F H).range : Set (AdelicPoints F H))
      ((U.map AdelicPoints.finiteEmbed : Set (AdelicPoints F H))) ≃
      Σ x : DoubleCoset.Quotient ((finiteDiagonal F H).range : Set (AdelicPoints.FiniteAdelicPoints F H)) U,
        MulAction.orbitRel.Quotient ((levelArithmetic (Quotient.out x) U).map
          (AdelicPoints.mapPoints (Algebra.ofId F (NumberField.InfiniteAdeleRing F)))) (AdelicPoints.InfinitePoints F H)) := by
  sorry

/-- `AA.3/finite-volume`. -/
theorem finite_volume (dx : Measure (AdelicPoints F H)) [dx.IsHaarMeasure] (hconn : IsDomain H) :
    AutomorphicQuotient.measure dx Set.univ < ∞ := by
  sorry

/-- `AA.3/compactness-anisotropic`. -/
theorem compact_of_anisotropic (D : MinimalParabolic F H) (h : IsEmpty D.SimpleRoot) :
    CompactSpace (AutomorphicQuotient F H) := by
  sorry

/-- `AA.3/compactness-isotropic`. -/
theorem not_compact_of_isotropic (D : MinimalParabolic F H) (h : Nonempty D.SimpleRoot) :
    ¬ CompactSpace (AutomorphicQuotient F H) := by
  sorry

/-- `AA.3/adelic-height`: finite-place max norms and archimedean Hilbert-Schmidt norms,
with complex-place multiplicity two. Properness estimates require a proper algebraic
representation (for example a representation together with its dual), not bare faithfulness. -/
def height (m : ℕ) (r : ∀ (R : Type) [CommRing R] [Algebra F R], WithConv (H →ₐ[F] R) →* GL (Fin m) R) :
    AdelicPoints F H → ℝ := sorry

variable (m : ℕ) (r : ∀ (R : Type) [CommRing R] [Algebra F R], WithConv (H →ₐ[F] R) →* GL (Fin m) R)

theorem height_mul_le (x y : AdelicPoints F H) : height m r (x * y) ≤ height m r x * height m r y := by
  sorry

theorem height_inv_le : ∃ C N : ℝ, ∀ x : AdelicPoints F H, height m r x⁻¹ ≤ C * height m r x ^ N := by
  sorry

theorem isCompact_height_le (t : ℝ) (hr : ∀ (R : Type) [CommRing R] [Algebra F R], Function.Injective (r R)) :
    IsCompact {x : AdelicPoints F H | height m r x ≤ t ∧ height m r x⁻¹ ≤ t} := by
  sorry

theorem card_rational_height_le : ∃ C N : ℝ, ∀ t : ℝ, 0 ≤ t →
    (Set.ncard {γ : WithConv (H →ₐ[F] F) | height m r (AdelicPoints.diagonal F H γ) ≤ t} : ℝ) ≤ C * t ^ N := by
  sorry

-- Test Reduction.height_gl1
/-- For `G_m` with `r(x) = diag(x, x⁻¹)` the height is symmetric under inversion. -/
example (H : Type) [CommRing H] [HopfAlgebra ℚ H]
    (r : ∀ (R : Type) [CommRing R] [Algebra ℚ R], WithConv (H →ₐ[ℚ] R) →* GL (Fin 2) R)
    (hr : ∀ (R : Type) [CommRing R] [Algebra ℚ R] (x : WithConv (H →ₐ[ℚ] R)),
      (r R x⁻¹ : Matrix (Fin 2) (Fin 2) R) = (r R x : Matrix (Fin 2) (Fin 2) R).submatrix (Equiv.swap 0 1) (Equiv.swap 0 1))
    (x : AdelicPoints ℚ H) : height 2 r x⁻¹ = height 2 r x := by
  sorry

-- Test Reduction.height_one
example (hm : 0 < m) :
    height m r 1 = (m : ℝ) ^ ((Module.finrank ℚ F : ℝ) / 2) := by
  sorry

-- Test Reduction.height_not_finite_only
example (hcpt : ¬ CompactSpace (AdelicPoints.InfinitePoints F H)) :
    ¬ ∃ C : ℝ, ∀ x : AdelicPoints F H, height m r x ≤ C := by
  sorry

/-- `AA.3/height-representation-comparison`. -/
theorem height_comparison (m' : ℕ) (r' : ∀ (R : Type) [CommRing R] [Algebra F R], WithConv (H →ₐ[F] R) →* GL (Fin m') R)
    (hr : ∀ (R : Type) [CommRing R] [Algebra F R], Function.Injective (r R)) :
    ∃ C N : ℝ, ∀ x, height m' r' x ≤ C * height m r x ^ N := by
  sorry

end Reduction

namespace RealSiegel

/-- `AA.3/horospherical-decomposition`: the horospherical decomposition of a real group `G` for a
rational parabolic and a fixed maximal compact subgroup, `G ≃ N_P × A_P × (M_P K)`. -/
structure HoroData (G : Type*) [Group G] [TopologicalSpace G] where
  N : Subgroup G
  A : Subgroup G
  MK : Set G
  horoDecomp : G ≃ₜ (N × A × MK)
  horoDecomp_symm_apply : ∀ n a mk, (horoDecomp.symm (n, a, mk) : G) = n * a * mk
  /-- The simple roots `Δ(A_P, N_P)`, as positive characters of `A_P`. -/
  simpleRoots : Finset (A →* ℝ≥0)

variable {G : Type*} [Group G] [TopologicalSpace G]

/-- The left action formula: `p₀ (n, a, m) = (n₀ · (a₀m₀) n (a₀m₀)⁻¹, a₀ a, m₀ m)` (BKT (2.3),
read as a left action). -/
theorem horoDecomp_left_mul (D : HoroData G) (n₀ n : D.N) (a₀ a : D.A) (m₀ : G) (mk : D.MK) :
    let y := D.horoDecomp ((n₀ : G) * a₀ * m₀ * D.horoDecomp.symm (n, a, mk))
    (y.1 : G) = n₀ * ((a₀ : G) * m₀) * n * ((a₀ : G) * m₀)⁻¹ ∧ y.2.1 = a₀ * a ∧ (y.2.2 : G) = m₀ * mk := by
  sorry

/-- Conjugation by a rational element transports the decomposition. -/
def horoDecomp_conj (D : HoroData G) (g : G) : HoroData G := sorry

theorem horoDecomp_conj_N (D : HoroData G) (g : G) :
    (horoDecomp_conj D g).N = D.N.map (MulAut.conj g).toMonoidHom := by
  sorry

/-- Changing `K` by an element of `N_P` does not change the `A_P`-coordinate. -/
theorem horoDecomp_change_K (D D' : HoroData G) (hN : D'.N = D.N) (hA : D'.A = D.A)
    (n : D.N) (hMK : D'.MK = (n : G) • D.MK) (x : G) :
    ((D'.horoDecomp x).2.1 : G) = (D.horoDecomp x).2.1 := by
  sorry

-- Test RealSiegel.horoDecomp_sl2
/-- For `SL_2(ℝ)` and the upper triangular Borel, `n(x) diag(√a, 1/√a) k` has `A`-coordinate
`diag(√a, 1/√a)`. -/
example (D : HoroData (Matrix.SpecialLinearGroup (Fin 2) ℝ)) (n : D.N) (a : D.A) (mk : D.MK) :
    (D.horoDecomp (D.horoDecomp.symm (n, a, mk))).2.1 = a := by
  sorry

-- Test RealSiegel.horoDecomp_trivial_parabolic
example (D : HoroData G) (hN : D.N = ⊥) (hA : D.A = ⊥) : D.MK = Set.univ := by
  sorry

-- Test RealSiegel.horoDecomp_not_right_action
/-- Right multiplication by `n₀ ∈ N_P` does not act on the `N`-coordinate by left translation in
general (`SL_2`, `n₀ ≠ 1`). -/
example (D : HoroData (Matrix.SpecialLinearGroup (Fin 2) ℝ)) (hD : D.N ≠ ⊥) :
    ¬ ∀ (n₀ n : D.N) (a : D.A) (mk : D.MK),
      ((D.horoDecomp (D.horoDecomp.symm (n, a, mk) * n₀)).1 : Matrix.SpecialLinearGroup (Fin 2) ℝ) = n₀ * n := by
  sorry

/-- `AA.3/positive-root-coordinates`: the truncated torus `A_{P,t}`. -/
def truncatedTorus (D : HoroData G) (t : ℝ≥0) : Set D.A := {a | ∀ α ∈ D.simpleRoots, t < α a}

/-- The corner coordinates `e_P(a) = (a^{-α_1}, …, a^{-α_r})` are strictly positive.
REVIEW: `HoroData` still needs the root-basis and split-torus axioms to justify bijectivity. -/
def cornerCoord (D : HoroData G) : D.A ≃ (D.simpleRoots → {x : ℝ≥0 // 0 < x}) := sorry

theorem cornerCoord_apply (D : HoroData G) (a : D.A) (α : D.simpleRoots) :
    (cornerCoord D a α).val = (α.1 a)⁻¹ := by
  sorry

theorem cornerCoord_truncated (D : HoroData G) (t : ℝ≥0) (ht : 0 < t) :
    cornerCoord D '' truncatedTorus D t = {x | ∀ α, (x α).val < t⁻¹} := by
  sorry

-- Test RealSiegel.simpleRoots_sl2
example (D : HoroData (Matrix.SpecialLinearGroup (Fin 2) ℝ)) (hD : D.N ≠ ⊥) : D.simpleRoots.card = 1 := by
  sorry

-- Test RealSiegel.simpleRoots_minimal_rank
example (D : HoroData G) (hA : Nonempty (D.A ≃* Multiplicative ℝ)) (hN : D.N ≠ ⊥) :
    D.simpleRoots.card = 1 := by
  sorry

-- Test RealSiegel.simpleRoots_not_all_roots
/-- For the Borel of `SL_3`, positivity of `α_1 + α_2` alone does not give membership in
`A_{P,t}`. -/
example : ¬ ∀ x y : ℝ, (1 : ℝ) < x * y → ((1 : ℝ) < x ∧ (1 : ℝ) < y) := by
  sorry

/-- `AA.3/real-siegel-set`: `𝔖 = U × A_{P,t} × W` for one fixed maximal compact `K`. -/
def siegelSet (D : HoroData G) (U : Set D.N) (t : ℝ≥0) (W : Set D.MK) : Set G :=
  D.horoDecomp ⁻¹' (U ×ˢ truncatedTorus D t ×ˢ W)

theorem mem_siegelSet (D : HoroData G) (U : Set D.N) (t : ℝ≥0) (W : Set D.MK) (x : G) :
    x ∈ siegelSet D U t W ↔ (D.horoDecomp x).1 ∈ U ∧ (D.horoDecomp x).2.1 ∈ truncatedTorus D t ∧
      (D.horoDecomp x).2.2 ∈ W := Iff.rfl

theorem siegelSet_mono (D : HoroData G) {U U' : Set D.N} {t t' : ℝ≥0} {W W' : Set D.MK}
    (hU : U ⊆ U') (ht : t' ≤ t) (hW : W ⊆ W') : siegelSet D U t W ⊆ siegelSet D U' t' W' := by
  sorry

/-- The image of a Siegel set in `G/M`. -/
def siegelSet_quotient (D : HoroData G) (M : Subgroup G) (U : Set D.N) (t : ℝ≥0) (W : Set D.MK) :
    Set (G ⧸ M) := (QuotientGroup.mk : G → G ⧸ M) '' siegelSet D U t W

-- Test RealSiegel.siegelSet_sl2
example (D : HoroData (Matrix.SpecialLinearGroup (Fin 2) ℝ)) (U : Set D.N) (t : ℝ≥0) :
    siegelSet D U t Set.univ = D.horoDecomp ⁻¹' (U ×ˢ truncatedTorus D t ×ˢ Set.univ) := rfl

-- Test RealSiegel.siegelSet_anisotropic
example (D : HoroData G) (hN : D.N = ⊥) (hA : D.A = ⊥) (W : Set D.MK) (t : ℝ≥0) :
    siegelSet D Set.univ t W = Subtype.val '' W := by
  sorry

-- Test RealSiegel.siegelSet_needs_fixed_K
/-- Siegel sets for two maximal compact subgroups are not interchangeable: some Siegel set for `K'`
is not covered by finitely many translates of Siegel sets for `K` (BKT erratum §1.6.1). -/
example (D D' : HoroData (Matrix.SpecialLinearGroup (Fin 2) ℝ)) (hN : D'.N = D.N) (hA : D'.A = D.A)
    (hMK : D'.MK ≠ D.MK) :
    ∃ (U' : Set D'.N) (t' : ℝ≥0) (W' : Set D'.MK), ∀ (s : Finset (Matrix.SpecialLinearGroup (Fin 2) ℤ))
      (U : Set D.N) (t : ℝ≥0) (W : Set D.MK), IsCompact (closure (Subtype.val '' W : Set (Matrix.SpecialLinearGroup (Fin 2) ℝ))) →
      ¬ siegelSet D' U' t' W' ⊆ ⋃ γ ∈ s, (Matrix.SpecialLinearGroup.map (Int.castRingHom ℝ) γ) • siegelSet D U t W := by
  sorry

/-- `AA.3/real-siegel-finite-cover`. -/
theorem siegel_finite_cover (Γ : Subgroup G) (Ds : Finset (HoroData G)) :
    ∃ (U : ∀ D : HoroData G, Set D.N) (t : HoroData G → ℝ≥0) (W : ∀ D : HoroData G, Set D.MK),
      ∀ x : G, ∃ γ ∈ Γ, ∃ D ∈ Ds, γ * x ∈ siegelSet D (U D) (t D) (W D) := by
  sorry

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

theorem IsReduced.cholesky {C : ℝ} {b : Matrix (Fin n) (Fin n) ℝ} (hb : b.PosDef) (h : IsReduced C b)
    (L : Matrix (Fin n) (Fin n) ℝ) (hL : L.BlockTriangular id) (hLb : L * L.transpose = b) :
    ∀ i j, |L i j| ≤ C * |L j j| := by
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

/-! ## AA.4 Approximation and level maps -/

namespace Approximation

variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]

/-- The points at a finite set `S` of finite places, `G(F_S) = ∏_{v ∈ S} G(F_v)`. -/
abbrev PointsAt (S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))) :=
  ∀ v : S, AdelicPoints.LocalPoints F H v

variable (F H) in
/-- `AA.4/weak-approximation-property` (at finite places; the archimedean factor is handled by
the same definition with `G(F_∞)`). -/
def HasWeakApproximation (S : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))) : Prop :=
  DenseRange (fun γ : WithConv (H →ₐ[F] F) => fun v : S =>
    AdelicPoints.mapPoints (Algebra.ofId F (v.1.adicCompletion F)) γ)

theorem HasWeakApproximation.mono {S S' : Finset (IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))}
    (h : HasWeakApproximation F H S) (hS : S' ⊆ S) : HasWeakApproximation F H S' := by
  sorry

theorem HasWeakApproximation.prod {H' H'' : Type} [CommRing H'] [HopfAlgebra F H'] [CommRing H'']
    [HopfAlgebra F H''] (S)
    (e : ∀ (R : Type) [CommRing R] [Algebra F R],
      WithConv (H'' →ₐ[F] R) ≃* WithConv (H →ₐ[F] R) × WithConv (H' →ₐ[F] R))
    (h : HasWeakApproximation F H S) (h' : HasWeakApproximation F H' S) :
    HasWeakApproximation F H'' S := by
  sorry

theorem HasWeakApproximation.of_iso {H' : Type} [CommRing H'] [HopfAlgebra F H'] (S)
    (e : H ≃ₐc[F] H') (h : HasWeakApproximation F H S) : HasWeakApproximation F H' S := by
  sorry

-- Test Approximation.hasWeakApproximation_ga
example (eGa : H ≃ₐ[F] Polynomial F) (S) : HasWeakApproximation F H S := by
  sorry

-- Test Approximation.hasWeakApproximation_empty
example : HasWeakApproximation F H ∅ := by
  sorry

-- Test Approximation.not_hasWeakApproximation_mu2
/-- `μ_2`: the diagonal image of `{±1}` in `{±1} × {±1}` is not dense. -/
example : ¬ DenseRange (fun s : ({1, -1} : Set ℚ) => ((s : ℚ), (s : ℚ))) := by
  sorry

/-- `AA.4/group-torsor`: a torsor under the affine group `Spec H` over a field `k`, as a comodule
algebra that becomes isomorphic to `H` over an algebraic closure. -/
structure Torsor (k : Type) [Field k] (H : Type) [CommRing H] [HopfAlgebra k H] where
  A : Type
  [instRing : CommRing A]
  [instAlg : Algebra k A]
  coaction : A →ₐ[k] A ⊗[k] H
  trivialization : AlgebraicClosure k ⊗[k] A ≃ₐ[AlgebraicClosure k] AlgebraicClosure k ⊗[k] H

attribute [instance] Torsor.instRing Torsor.instAlg

def Torsor.IsTrivial {k : Type} [Field k] {H : Type} [CommRing H] [HopfAlgebra k H] (X : Torsor k H) : Prop :=
  Nonempty (X.A →ₐ[k] k)

def Torsor.baseChange {k : Type} [Field k] {H : Type} [CommRing H] [HopfAlgebra k H] (X : Torsor k H)
    (k' : Type) [Field k'] [Algebra k k'] (H' : Type) [CommRing H'] [HopfAlgebra k' H'] (e : k' ⊗[k] H ≃ₐ[k'] H') :
    Torsor k' H' := sorry

theorem Torsor.trivial_iff_iso {k : Type} [Field k] {H : Type} [CommRing H] [HopfAlgebra k H] (X : Torsor k H) :
    X.IsTrivial ↔ Nonempty (X.A ≃ₐ[k] H) := by
  sorry

-- Test Approximation.Torsor.self_trivial
example (k : Type) [Field k] (Hk : Type) [CommRing Hk] [HopfAlgebra k Hk] (X : Torsor k Hk)
    (e : X.A ≃ₐ[k] Hk) : X.IsTrivial := by
  sorry

-- Test Approximation.Torsor.mu2_sqrt
/-- `ℚ[x]/(x² - 2)` has no `ℚ`-point. -/
example : ¬ ∃ q : ℚ, q ^ 2 = 2 := by
  sorry

-- Test Approximation.Torsor.not_torsor_two_orbits
/-- `G_m` acting on `A¹` by scaling has the two geometric orbits `{0}` and `A¹ ∖ {0}`. -/
example : ¬ ∃ c : ℚ, c * 0 = (1 : ℚ) := by
  sorry

/-- `AA.4/kneser-local-torsor`. -/
theorem kneser_local (v : IsDedekindDomain.HeightOneSpectrum (NumberField.RingOfIntegers F))
    (Hv : Type) [CommRing Hv] [HopfAlgebra (v.adicCompletion F) Hv] (X : Torsor (v.adicCompletion F) Hv)
    (hsc : ∀ (K : Type) [CommRing K] [HopfAlgebra (v.adicCompletion F) K] (f : Hv →ₐc[v.adicCompletion F] K),
      Function.Surjective f → Function.Injective f) :
    X.IsTrivial := by
  sorry

variable (F H) in
/-- `AA.4/strong-approximation-property` with respect to the archimedean places: `G(F)` is dense in
`G(𝔸_f)`. -/
def HasStrongApproximation : Prop :=
  DenseRange (Reduction.finiteDiagonal F H)

theorem HasStrongApproximation.mul_open (h : HasStrongApproximation F H)
    (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H)) (hU : IsOpen (U : Set (AdelicPoints.FiniteAdelicPoints F H))) :
    ((Reduction.finiteDiagonal F H).range : Set _) * (U : Set (AdelicPoints.FiniteAdelicPoints F H)) = Set.univ := by
  sorry

theorem HasStrongApproximation.mono (h : HasStrongApproximation F H) : DenseRange (Reduction.finiteDiagonal F H) := h

theorem HasStrongApproximation.classNumber_one (h : HasStrongApproximation F H)
    (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H)) (hU : IsOpen (U : Set (AdelicPoints.FiniteAdelicPoints F H))) :
    Subsingleton (DoubleCoset.Quotient ((Reduction.finiteDiagonal F H).range : Set (AdelicPoints.FiniteAdelicPoints F H)) U) := by
  sorry

-- Test Approximation.hasStrongApproximation_ga
example (eGa : H ≃ₐ[F] Polynomial F) : HasStrongApproximation F H := by
  sorry

-- Test Approximation.hasStrongApproximation_sl2_rat
example (d : ℕ) : Function.Surjective (Matrix.SpecialLinearGroup.map (Int.castRingHom (ZMod d)) :
    Matrix.SpecialLinearGroup (Fin 2) ℤ →* Matrix.SpecialLinearGroup (Fin 2) (ZMod d)) := by
  sorry

-- Test Approximation.not_hasStrongApproximation_gm
example (H : Type) [CommRing H] [HopfAlgebra ℚ H] (eGm : H ≃ₐ[ℚ] MonoidAlgebra ℚ (Multiplicative ℤ)) :
    ¬ HasStrongApproximation ℚ H := by
  sorry

/-- `AA.4/strong-approximation-sufficiency` (Kneser–Platonov): stated for `G` absolutely almost
simple and simply connected with `G(F_∞)` noncompact; the simple-connectedness and absolute
simplicity hypotheses are carried by the coordinate ring (Tau Ceti
`simplyConnectedSemisimpleCommHopfAlgProperty`), recorded here as hypotheses on `H`. -/
theorem strongApproximation_of_simplyConnected
    (hsc : ∀ (K : Type) [CommRing K] [HopfAlgebra F K] (f : H →ₐc[F] K), Function.Surjective f → Function.Injective f)
    (hnc : ¬ CompactSpace (AdelicPoints.InfinitePoints F H)) :
    HasStrongApproximation F H := by
  sorry

end Approximation

namespace Neat

/-- `AA.4/neat-element`: an automorphism is neat if its eigenvalues generate a torsion-free
subgroup of `ℂ^×`. -/
def IsNeatAut {n : ℕ} (α : GL (Fin n) ℂ) : Prop :=
  ∀ z ∈ Subgroup.closure {z : ℂˣ | Module.End.HasEigenvalue (Matrix.toLin' (α : Matrix (Fin n) (Fin n) ℂ)) z},
    IsOfFinOrder z → z = 1

variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]

/-- A rational point is neat if its image under a faithful representation is neat. -/
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

/-- `AA.4/neat-representation-independence`. -/
theorem isNeat_iff_of_faithful (m : ℕ) (σ : WithConv (H →ₐ[F] F) →* GL (Fin m) ℂ)
    (hρ : Function.Injective ρ) (g : WithConv (H →ₐ[F] F)) (h : IsNeat n ρ g) : IsNeat m σ g := by
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

/-- `AA.4/neat-level`: a compact open level is neat if all its arithmetic groups are neat. -/
def IsNeatLevel (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H)) : Prop :=
  ∀ x, IsNeatSubgroup n ρ (Reduction.levelArithmetic x U)

theorem IsNeatLevel.mono {U U' : Subgroup (AdelicPoints.FiniteAdelicPoints F H)} (h : IsNeatLevel n ρ U) (hU : U' ≤ U) :
    IsNeatLevel n ρ U' := by
  sorry

theorem IsNeatLevel.conj {U : Subgroup (AdelicPoints.FiniteAdelicPoints F H)} (h : IsNeatLevel n ρ U)
    (g : AdelicPoints.FiniteAdelicPoints F H) : IsNeatLevel n ρ (U.map (MulAut.conj g).toMonoidHom) := by
  sorry

theorem IsNeatLevel.torsionFree (hρ : Function.Injective ρ) {U : Subgroup (AdelicPoints.FiniteAdelicPoints F H)}
    (h : IsNeatLevel n ρ U) (x : AdelicPoints.FiniteAdelicPoints F H) (g : Reduction.levelArithmetic x U)
    (hg : IsOfFinOrder g) : g = 1 := by
  sorry

-- Test Neat.isNeatLevel_U3
/-- The arithmetic group `Γ(3) = SL_2(ℤ) ∩ U(3)` of the level `U(3)` is neat. -/
example (γ : Matrix.SpecialLinearGroup (Fin 2) ℤ) (hγ : γ ∈ CongruenceSubgroup.Gamma 3) :
    IsNeatAut (Matrix.SpecialLinearGroup.toGL (Matrix.SpecialLinearGroup.map (Int.castRingHom ℂ) γ)) := by
  sorry

-- Test Neat.isNeatLevel_trivial_group
example (e : H ≃ₐ[F] F) (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H)) : IsNeatLevel n ρ U := by
  sorry

-- Test Neat.not_isNeatLevel_GL2Zhat
example (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H)) (g : WithConv (H →ₐ[F] F))
    (hg : g ∈ Reduction.levelArithmetic 1 U) (hρg : ρ g = -1) (hn : 0 < n) : ¬ IsNeatLevel n ρ U := by
  sorry

/-- `AA.4/neat-level-exists`. -/
theorem exists_neat_normal (hρ : Function.Injective ρ) (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H))
    (hU : IsOpen (U : Set (AdelicPoints.FiniteAdelicPoints F H))) (hUc : IsCompact (U : Set (AdelicPoints.FiniteAdelicPoints F H))) :
    ∃ U' ≤ U, (U'.subgroupOf U).Normal ∧ (U'.subgroupOf U).FiniteIndex ∧
      IsOpen (U' : Set (AdelicPoints.FiniteAdelicPoints F H)) ∧ IsNeatLevel n ρ U' := by
  sorry

end Neat

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

variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]

/-- The level subgroup `K_∞ U` of `G(𝔸)`. -/
def levelSubgroup (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H))
    (Kinf : Subgroup (AdelicPoints.InfinitePoints F H)) : Subgroup (AdelicPoints F H) :=
  U.comap (AdelicPoints.mapPoints (NumberField.adeleFinAlg F)) ⊓
    Kinf.comap (AdelicPoints.mapPoints (NumberField.adeleInfAlg F))

/-- `AA.4/level-quotient`: `X_U = G(F)\G(𝔸)/K_∞U`. -/
abbrev LevelQuotient (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H))
    (Kinf : Subgroup (AdelicPoints.InfinitePoints F H)) :=
  DoubleCoset.Quotient ((AdelicPoints.diagonal F H).range : Set (AdelicPoints F H)) (levelSubgroup U Kinf)

variable (U : Subgroup (AdelicPoints.FiniteAdelicPoints F H)) (Kinf : Subgroup (AdelicPoints.InfinitePoints F H))

def LevelQuotient.mk : AdelicPoints F H → LevelQuotient U Kinf := DoubleCoset.mk _ _

/-- Right translation `X_{gUg⁻¹} ≃ X_U`, `[x] ↦ [x g]`. -/
def LevelQuotient.rightTranslate (g : AdelicPoints F H) (gf : AdelicPoints.FiniteAdelicPoints F H)
    (hg : AdelicPoints.mapPoints (NumberField.adeleFinAlg F) g = gf)
    (hgInf : AdelicPoints.mapPoints (NumberField.adeleInfAlg F) g = 1) :
    LevelQuotient (U.map (MulAut.conj gf).toMonoidHom) Kinf ≃ LevelQuotient U Kinf := sorry

@[simp] theorem LevelQuotient.mk_rational (γ : WithConv (H →ₐ[F] F)) (x : AdelicPoints F H) :
    LevelQuotient.mk U Kinf (AdelicPoints.diagonal F H γ * x) = LevelQuotient.mk U Kinf x := by
  sorry

-- Test LevelMaps.LevelQuotient.gl1_rat
example (H : Type) [CommRing H] [HopfAlgebra ℚ H] (eGm : H ≃ₐ[ℚ] MonoidAlgebra ℚ (Multiplicative ℤ))
    (U : Subgroup (AdelicPoints.FiniteAdelicPoints ℚ H)) (Kinf : Subgroup (AdelicPoints.InfinitePoints ℚ H))
    (hU : IsOpen (U : Set (AdelicPoints.FiniteAdelicPoints ℚ H)))
    (hUmax : ∀ U' : Subgroup _, IsCompact (U' : Set (AdelicPoints.FiniteAdelicPoints ℚ H)) → U' ≤ U) :
    Subsingleton (LevelQuotient U (⊤ : Subgroup (AdelicPoints.InfinitePoints ℚ H))) := by
  sorry

-- Test LevelMaps.LevelQuotient.trivial_group
example (e : H ≃ₐ[F] F) : Subsingleton (LevelQuotient U Kinf) := by
  sorry

-- Test LevelMaps.LevelQuotient.not_finite_adelic_only
example (H : Type) [CommRing H] [HopfAlgebra ℚ H]
    (e : ∀ (R : Type) [CommRing R] [Algebra ℚ R], WithConv (H →ₐ[ℚ] R) ≃* Matrix.SpecialLinearGroup (Fin 2) R)
    (U : Subgroup (AdelicPoints.FiniteAdelicPoints ℚ H)) (hU : IsOpen (U : Set (AdelicPoints.FiniteAdelicPoints ℚ H))) :
    ¬ Subsingleton (LevelQuotient U (⊥ : Subgroup (AdelicPoints.InfinitePoints ℚ H))) := by
  sorry

/-- `AA.4/level-covering-map`. -/
theorem levelMap_isCoveringMap [TopologicalSpace (LevelQuotient U Kinf)]
    (U' : Subgroup (AdelicPoints.FiniteAdelicPoints F H)) (hU' : U' ≤ U)
    [TopologicalSpace (LevelQuotient U' Kinf)] (n : ℕ) (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ)
    (hneat : Neat.IsNeatLevel n ρ U) (hKinf : IsCompact (Kinf : Set (AdelicPoints.InfinitePoints F H))) :
    IsCoveringMap (levelMap _ (inf_le_inf_right _ (Subgroup.comap_mono hU')) :
      LevelQuotient U' Kinf → LevelQuotient U Kinf) := by
  sorry

/-- `AA.4/level-quotient-groupoid`: the action groupoid of `G(F)` on `G(𝔸)/K_∞U`. -/
abbrev levelGroupoid :=
  CategoryTheory.ActionCategory (AdelicPoints.diagonal F H).range (AdelicPoints F H ⧸ levelSubgroup U Kinf)

theorem levelGroupoid_aut (x : AdelicPoints F H) :
    Nonempty (MulAction.stabilizer (AdelicPoints.diagonal F H).range (x : AdelicPoints F H ⧸ levelSubgroup U Kinf) ≃*
      ((levelSubgroup U Kinf).map (MulAut.conj x).toMonoidHom).subgroupOf (AdelicPoints.diagonal F H).range) := by
  sorry

def levelGroupoid_isoClasses :
    MulAction.orbitRel.Quotient (AdelicPoints.diagonal F H).range (AdelicPoints F H ⧸ levelSubgroup U Kinf) ≃
      LevelQuotient U Kinf := sorry

theorem levelGroupoid_finite_aut (hU : IsCompact (U : Set (AdelicPoints.FiniteAdelicPoints F H))) (hK : IsCompact (Kinf : Set (AdelicPoints.InfinitePoints F H)))
    (x : AdelicPoints F H ⧸ levelSubgroup U Kinf) :
    Finite (MulAction.stabilizer (AdelicPoints.diagonal F H).range x) := by
  sorry

-- Test LevelMaps.levelGroupoid_sl2_i
example (H : Type) [CommRing H] [HopfAlgebra ℚ H]
    (e : ∀ (R : Type) [CommRing R] [Algebra ℚ R], WithConv (H →ₐ[ℚ] R) ≃* Matrix.SpecialLinearGroup (Fin 2) R) :
    Nat.card (Subgroup.zpowers (ModularGroup.S)) = 4 := by
  sorry

-- Test LevelMaps.levelGroupoid_neat
example (n : ℕ) (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) (hρ : Function.Injective ρ)
    (hneat : Neat.IsNeatLevel n ρ U) (x : AdelicPoints F H ⧸ levelSubgroup U Kinf)
    (hK : IsCompact (Kinf : Set (AdelicPoints.InfinitePoints F H)))
    (hU : IsCompact (U : Set (AdelicPoints.FiniteAdelicPoints F H))) :
    ∀ g ∈ MulAction.stabilizer (AdelicPoints.diagonal F H).range x,
      (g : AdelicPoints F H) = 1 := by
  sorry

-- Test LevelMaps.levelGroupoid_not_space
example : Nat.card (Subgroup.zpowers (ModularGroup.S * ModularGroup.T)) = 6 := by
  sorry

/-- `AA.4/hecke-correspondence`: `X_U ← X_{U ∩ gUg⁻¹} → X_U`. -/
def hecke (g : AdelicPoints F H) (gf : AdelicPoints.FiniteAdelicPoints F H)
    (hg : AdelicPoints.mapPoints (NumberField.adeleFinAlg F) g = gf)
    (hgInf : AdelicPoints.mapPoints (NumberField.adeleInfAlg F) g = 1) :
    (LevelQuotient (U ⊓ U.map (MulAut.conj gf).toMonoidHom) Kinf → LevelQuotient U Kinf) ×
      (LevelQuotient (U ⊓ U.map (MulAut.conj gf).toMonoidHom) Kinf → LevelQuotient U Kinf) := sorry

variable (g : AdelicPoints F H) (gf : AdelicPoints.FiniteAdelicPoints F H)
  (hg : AdelicPoints.mapPoints (NumberField.adeleFinAlg F) g = gf)
  (hgInf : AdelicPoints.mapPoints (NumberField.adeleInfAlg F) g = 1)

@[simp] theorem hecke_fst (x : AdelicPoints F H) :
    (hecke U Kinf g gf hg hgInf).1 (DoubleCoset.mk _ _ x) = LevelQuotient.mk U Kinf x := by
  sorry

@[simp] theorem hecke_snd (x : AdelicPoints F H) :
    (hecke U Kinf g gf hg hgInf).2 (DoubleCoset.mk _ _ x) = LevelQuotient.mk U Kinf (x * g) := by
  sorry

theorem hecke_degree (x : LevelQuotient U Kinf) [((U ⊓ U.map (MulAut.conj gf).toMonoidHom).subgroupOf U).FiniteIndex]
    (n : ℕ) (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) (hneat : Neat.IsNeatLevel n ρ U) :
    Nat.card ((hecke U Kinf g gf hg hgInf).1 ⁻¹' {x}) ≤ ((U ⊓ U.map (MulAut.conj gf).toMonoidHom).subgroupOf U).index := by
  sorry

-- Test LevelMaps.hecke_one
example (h1 : AdelicPoints.mapPoints (NumberField.adeleFinAlg F) (1 : AdelicPoints F H) = 1)
    (h1Inf : AdelicPoints.mapPoints (NumberField.adeleInfAlg F) (1 : AdelicPoints F H) = 1)
    (x : AdelicPoints F H) :
    (hecke U Kinf 1 1 h1 h1Inf).2 (DoubleCoset.mk _ _ x) = (hecke U Kinf 1 1 h1 h1Inf).1 (DoubleCoset.mk _ _ x) := by
  sorry

-- Test LevelMaps.hecke_Tp_degree
example (p : ℕ) [Fact p.Prime] :
    ((CongruenceSubgroup.Gamma0 p).index : ℕ) = p + 1 := by
  sorry

-- Test LevelMaps.hecke_not_symmetric
example (x : AdelicPoints F H) (hg' : AdelicPoints.mapPoints (NumberField.adeleFinAlg F) g⁻¹ = gf⁻¹)
    (hgInf' : AdelicPoints.mapPoints (NumberField.adeleInfAlg F) g⁻¹ = 1) :
    (hecke U Kinf g⁻¹ gf⁻¹ hg' hgInf').2 (DoubleCoset.mk _ _ x) = LevelQuotient.mk U Kinf (x * g⁻¹) := by
  sorry

/-- `AA.4/hecke-cartesian`. -/
theorem hecke_cartesian (U' L : Subgroup (AdelicPoints.FiniteAdelicPoints F H)) (hU' : U' ≤ U) (hL : L ≤ U)
    (hUL : (U' : Set (AdelicPoints.FiniteAdelicPoints F H)) * (L : Set (AdelicPoints.FiniteAdelicPoints F H)) = U)
    (n : ℕ) (ρ : WithConv (H →ₐ[F] F) →* GL (Fin n) ℂ) (hneat : Neat.IsNeatLevel n ρ U) :
    Function.Injective (fun y : LevelQuotient (U' ⊓ L) Kinf =>
      ((levelMap _ (inf_le_inf_right _ (Subgroup.comap_mono inf_le_left)) y,
       levelMap _ (inf_le_inf_right _ (Subgroup.comap_mono inf_le_right)) y) :
        LevelQuotient U' Kinf × LevelQuotient L Kinf)) ∧
    Set.range (fun y : LevelQuotient (U' ⊓ L) Kinf =>
      ((levelMap _ (inf_le_inf_right _ (Subgroup.comap_mono inf_le_left)) y,
       levelMap _ (inf_le_inf_right _ (Subgroup.comap_mono inf_le_right)) y) :
        LevelQuotient U' Kinf × LevelQuotient L Kinf)) =
      {p | levelMap _ (inf_le_inf_right _ (Subgroup.comap_mono hU')) p.1 =
        levelMap _ (inf_le_inf_right _ (Subgroup.comap_mono hL)) p.2} := by
  sorry

end LevelMaps

namespace Approximation

variable {F : Type} [Field F] [NumberField F] {H : Type} [CommRing H] [HopfAlgebra F H]
  {Hsc : Type} [CommRing Hsc] [HopfAlgebra F Hsc]

/-- `AA.4/plus-subgroup`: `G(𝔸)^+`, the image of the adelic points of the simply connected cover
`G̃ → G` (given by its comorphism `cover : H → H̃`). -/
def plusSubgroup (cover : H →ₐc[F] Hsc) : Subgroup (AdelicPoints F H) := (AdelicPoints.map cover).range

variable (cover : H →ₐc[F] Hsc)

instance plusSubgroup_normal : (plusSubgroup cover).Normal := by
  sorry

theorem commutator_le_plusSubgroup : commutator (AdelicPoints F H) ≤ plusSubgroup cover := by
  sorry

theorem plusSubgroup_gln (n : ℕ)
    (e : ∀ (R : Type) [CommRing R] [Algebra F R], WithConv (H →ₐ[F] R) ≃* GL (Fin n) R)
    (x : AdelicPoints F H) (hcover : ∀ y, AdelicPoints.map cover y ∈ (plusSubgroup cover)) :
    x ∈ plusSubgroup cover ↔ Matrix.GeneralLinearGroup.det (e _ x) = 1 := by
  sorry

-- Test Approximation.plusSubgroup_sln
example (hiso : Function.Bijective cover) : plusSubgroup cover = ⊤ := by
  sorry

-- Test Approximation.plusSubgroup_pgl2_quotient
/-- For `PGL_2`, the determinant identifies `G(𝔸)/G(𝔸)^+` with `𝔸^×/𝔸^{×2}`. -/
example (det : AdelicPoints F H →* (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)ˣ ⧸
      (powMonoidHom 2 : (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)ˣ →* _).range)
    (hdet : Function.Surjective det) (hker : det.ker = plusSubgroup cover) :
    Nonempty (AdelicPoints F H ⧸ plusSubgroup cover ≃* (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)ˣ ⧸
      (powMonoidHom 2 : (NumberField.AdeleRing (NumberField.RingOfIntegers F) F)ˣ →* _).range) := by
  sorry

-- Test Approximation.plusSubgroup_not_derived_points
/-- The image of `SL_2(ℚ_p) → PGL_2(ℚ_p)` has index `#(ℚ_p^×/ℚ_p^{×2}) = 4` for odd `p`. -/
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) :
    Nat.card ((ZMod p)ˣ ⧸ (powMonoidHom 2 : (ZMod p)ˣ →* (ZMod p)ˣ).range) * 2 = 4 := by
  sorry

/-- The normal subgroup `G(F) G(𝔸)^+`. -/
def rationalPlus : Subgroup (AdelicPoints F H) := (AdelicPoints.diagonal F H).range ⊔ plusSubgroup cover

instance : (rationalPlus cover).Normal := by
  sorry

/-- `AA.4/residual-quotient`: `G_res = G(F)\G(𝔸)/G(𝔸)^+`. -/
abbrev residualQuotient := AdelicPoints F H ⧸ rationalPlus cover

instance residualQuotient.commGroup : CommGroup (residualQuotient cover) := sorry

def residualQuotient.piPlus : AdelicPoints F H →* residualQuotient cover := QuotientGroup.mk' _

theorem residualQuotient.continuous_piPlus : Continuous (residualQuotient.piPlus cover) := by
  sorry

@[simp] theorem residualQuotient.piPlus_rational (γ : WithConv (H →ₐ[F] F)) :
    residualQuotient.piPlus cover (AdelicPoints.diagonal F H γ) = 1 := by
  sorry

-- Test Approximation.residualQuotient_sl2
example (hiso : Function.Bijective cover) : Subsingleton (residualQuotient cover) := by
  sorry

-- Test Approximation.residualQuotient_pgl2
/-- For `PGL_2` over `ℚ`, use the determinant valued in idele square classes. There is no
canonical determinant lift to the full idele group. Keep surjectivity and rational compatibility. -/
example (H Hsc : Type) [CommRing H] [HopfAlgebra ℚ H] [CommRing Hsc] [HopfAlgebra ℚ Hsc]
    (cover : H →ₐc[ℚ] Hsc)
    (det : AdelicPoints ℚ H →* NumberField.IdeleGroup (NumberField.RingOfIntegers ℚ) ℚ ⧸
      (powMonoidHom 2 : NumberField.IdeleGroup (NumberField.RingOfIntegers ℚ) ℚ →* _).range)
    (hdet : det.ker = plusSubgroup cover)
    (hdetSurj : Function.Surjective det)
    (hprincipal : Subgroup.map det (AdelicPoints.diagonal ℚ H).range =
      Subgroup.map (QuotientGroup.mk' (powMonoidHom 2 :
        NumberField.IdeleGroup (NumberField.RingOfIntegers ℚ) ℚ →* _).range)
        (NumberField.IdeleGroup.principalSubgroup (NumberField.RingOfIntegers ℚ) ℚ)) :
    Nonempty (residualQuotient cover ≃* NumberField.IdeleGroup (NumberField.RingOfIntegers ℚ) ℚ ⧸
      (NumberField.IdeleGroup.principalSubgroup (NumberField.RingOfIntegers ℚ) ℚ ⊔
        (powMonoidHom 2 : NumberField.IdeleGroup (NumberField.RingOfIntegers ℚ) ℚ →* _).range)) := by
  sorry

-- Test Approximation.residualQuotient_not_G_mod_plus
example : ¬ CompactSpace ((NumberField.AdeleRing (NumberField.RingOfIntegers ℚ) ℚ)ˣ ⧸
    (powMonoidHom 2 : (NumberField.AdeleRing (NumberField.RingOfIntegers ℚ) ℚ)ˣ →* _).range) := by
  sorry

end Approximation

/-! ## AA.5 General-purpose validation -/

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

/-- `AA.5/gl1-adelic-quotient`: for `G_m`, the adelic quotient is the idele class group. -/
theorem gl1_adelic_quotient (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]
    (eGm : ∀ (R : Type) [CommRing R] [Algebra F R], WithConv (H →ₐ[F] R) ≃* Rˣ) :
    Nonempty (MulAction.orbitRel.Quotient (AdelicPoints.diagonal F H).range (AdelicPoints F H) ≃
      NumberField.IdeleClassGroup (NumberField.RingOfIntegers F) F) := by
  sorry

/-- `AA.5/gl1-XQ-components`: for `G_m` over `F` and the level `K_∞ U_Q`, every connected
component of the level quotient (modulo `A_∞^0`) is a compact torus of dimension `r₁ + r₂ - 1`. -/
theorem gl1_XQ_components (F : Type) [Field F] [NumberField F] (H : Type) [CommRing H] [HopfAlgebra F H]
    (eGm : ∀ (R : Type) [CommRing R] [Algebra F R], WithConv (H →ₐ[F] R) ≃* Rˣ)
    (UQ : Subgroup (AdelicPoints.FiniteAdelicPoints F H)) (Kinf : Subgroup (AdelicPoints.InfinitePoints F H))
    [TopologicalSpace (LevelMaps.LevelQuotient UQ Kinf)] (x : LevelMaps.LevelQuotient UQ Kinf) :
    Nonempty (connectedComponent x ≃ₜ (Fin (NumberField.Units.rank F) → AddCircle (1 : ℝ))) := by
  sorry

/-- `AA.5/gl2-upper-half-plane-component`: for `GL_2/ℚ` and a level with `det U = ℤ̂^×`, the level
quotient is `Γ\ℍ` for `Γ = GL_2(ℚ)^+ ∩ U`. -/
theorem gl2_upper_half_plane (H : Type) [CommRing H] [HopfAlgebra ℚ H]
    (e : ∀ (R : Type) [CommRing R] [Algebra ℚ R], WithConv (H →ₐ[ℚ] R) ≃* GL (Fin 2) R)
    (U : Subgroup (AdelicPoints.FiniteAdelicPoints ℚ H)) (Kinf : Subgroup (AdelicPoints.InfinitePoints ℚ H))
    (Γ : Subgroup (GL (Fin 2) ℝ)) :
    Nonempty (LevelMaps.LevelQuotient U Kinf ≃ MulAction.orbitRel.Quotient Γ UpperHalfPlane) := by
  sorry

/-- `AA.5/definite-quaternion-compact`. -/
theorem definite_quaternion_compact (H : Type) [CommRing H] [HopfAlgebra ℚ H] (a b : ℚ) (ha : a < 0) (hb : b < 0)
    (hdiv : ∀ x : QuaternionAlgebra ℚ a 0 b, x ≠ 0 → IsUnit x)
    (e : ∀ (R : Type) [CommRing R] [Algebra ℚ R], WithConv (H →ₐ[ℚ] R) ≃*
      (QuaternionAlgebra R (algebraMap ℚ R a) 0 (algebraMap ℚ R b))ˣ) :
    CompactSpace (AutomorphicQuotient ℚ H) := by
  sorry

end AdelicExamples

/-! ## Second-pass lemmas

Statements for the elementary lemmas added in the second refinement of the plan. -/

namespace QuotientMeasure

open MeasureTheory

/-- `AA.2/fundamental-domain-exists`: a countable discrete subgroup of a second countable locally
compact Hausdorff group has a measurable set meeting every orbit `Γg` in exactly one point, and
that set is a fundamental domain for every measure. -/
theorem exists_measurableSet_unique_orbit_rep {G : Type*} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [LocallyCompactSpace G] [T2Space G] [SecondCountableTopology G]
    [MeasurableSpace G] [BorelSpace G] (Γ : Subgroup G) [Countable Γ] [DiscreteTopology Γ]
    (μ : Measure G) :
    ∃ D : Set G, MeasurableSet D ∧ (∀ g : G, ∃! γ : Γ, γ • g ∈ D) ∧ IsFundamentalDomain Γ D μ := by
  sorry

end QuotientMeasure

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

namespace NumberField

open NumberField.Units NumberField.Units.dirichletUnitTheorem

/-- `AA.5/gl1-units-lattice`: a finite-index subgroup of the units has image a full lattice in
the logarithmic space, of rank `r₁ + r₂ - 1`. -/
theorem finiteIndex_units_logEmbedding_rank (K : Type*) [Field K] [NumberField K]
    (Γ : Subgroup (RingOfIntegers K)ˣ) [Γ.FiniteIndex] :
    Module.finrank ℤ (Submodule.span ℤ
      (Set.range fun γ : Γ => logEmbedding K (Additive.ofMul (γ : (RingOfIntegers K)ˣ)))) =
        Units.rank K ∧
    Submodule.span ℝ
      (Set.range fun γ : Γ => logEmbedding K (Additive.ofMul (γ : (RingOfIntegers K)ˣ))) = ⊤ := by
  sorry

end NumberField
