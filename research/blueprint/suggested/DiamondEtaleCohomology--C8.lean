/-
This file is not the roadmap and is not exhaustive. The roadmap document is definitive.
These statements suggest Lean forms so contributors and reviewers converge on names and
signatures. These are planning signatures; their proof bodies are placeholders.

Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174
Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369

The topology, dense-intermediate-field, finite-generator, tower/base-change,
wild-automorphism and specialization-chain signatures use the actual pinned carriers.
The remaining signatures require supplier types or unclosed mathematical interfaces.
They are listed at the end, not represented by arbitrary Prop fields or assumed theorem
packages. Elaboration checks signatures and does not establish these results.

Source locators: Scholze, ECD v4, Definition 21.2, Lemma 21.3, the finite-degree
paragraph after Question 21.4, Proposition 21.16 and Lemma 21.17; Temkin, Section 2.1.6,
Remark 2.1.10, Lemma 2.2.2 and Theorems 3.2.1 and 3.2.3; Conrad, Section 2;
Kelly--Saito--Tamme, Lemma 6.6. The chain-space construction below does
not establish the quasi-augmented cohomological descent theorem used in that lemma.
-/
import Mathlib.Topology.KrullDimension
import Mathlib.Topology.Sober
import Mathlib.FieldTheory.IntermediateField.Basic
import Mathlib.RingTheory.AlgebraicIndependent.Basic
import Mathlib.RingTheory.Algebraic.Defs
import Mathlib.Data.ENat.Lattice
import Mathlib.Analysis.Normed.Field.Ultra
import Mathlib.FieldTheory.IsAlgClosed.Basic
import Mathlib.Data.Nat.Factorial.Basic
import Mathlib.Topology.Spectral.ConstructibleTopology
import Mathlib.Topology.Category.TopCat.Basic
import Mathlib.AlgebraicTopology.SimplicialObject.Basic
import Mathlib.Topology.Order
import Mathlib.GroupTheory.PGroup
import Mathlib.NumberTheory.Padics.Complex

noncomputable section
open TopologicalSpace

namespace TauCeti.DiamondEtale

universe u v w

section FibreDimension
variable {X : Type u} {Y : Type v} [TopologicalSpace X] [TopologicalSpace Y]

/-- The supremum of topological Krull dimensions of the actual fibre subspaces. -/
def fibreDimension {X : Type u} {Y : Type v} [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y) : WithBot ℕ∞ :=
  ⨆ y : Y, topologicalKrullDim {x : X // f x = y}

lemma fibreDimension_eq_iSup (f : X → Y) :
    fibreDimension f = ⨆ y : Y, topologicalKrullDim {x : X // f x = y} := by sorry

lemma fibreDimension_le_iff (f : X → Y) (d : WithBot ℕ∞) :
    fibreDimension f ≤ d ↔ ∀ y : Y, topologicalKrullDim {x : X // f x = y} ≤ d := by sorry

lemma fibreDimension_homeomorph
    {X' : Type w} {Y' : Type w} [TopologicalSpace X'] [TopologicalSpace Y']
    (eX : X ≃ₜ X') (eY : Y ≃ₜ Y') (f : X → Y) (g : X' → Y')
    (h : ∀ x, g (eX x) = eY (f x)) : fibreDimension f = fibreDimension g := by sorry

lemma fibreDimension_id [Nonempty X] : fibreDimension (id : X → X) = 0 := by sorry

-- fibreDimension_empty
example [IsEmpty X] (f : X → Y) : fibreDimension f = ⊥ := by sorry

-- fibreDimension_identity
example [Nonempty X] : fibreDimension (id : X → X) = 0 := by sorry

-- fibreDimension_toPoint
example : fibreDimension (fun _ : X => (PUnit.unit : PUnit)) = topologicalKrullDim X := by sorry

-- fibreDimension_emptyTarget
example [IsEmpty X] : fibreDimension (id : X → X) = ⊥ := by sorry
end FibreDimension

section DenseIntermediateFields
variable (K : Type u) (L : Type u) [Field K] [Field L] [Algebra K L]
variable [TopologicalSpace L]

/-- Infimum of finite algebraic transcendence bounds witnessed by a dense intermediate field. -/
def topologicalTrdeg (K L : Type u) [Field K] [Field L] [Algebra K L]
    [TopologicalSpace L] : ℕ∞ :=
  ⨅ (n : ℕ) (_ : ∃ A : IntermediateField K L,
      Dense (A : Set L) ∧ Algebra.trdeg K A ≤ (n : Cardinal)), (n : ℕ∞)

lemma topologicalTrdeg_le_iff (n : ℕ) :
    topologicalTrdeg K L ≤ n ↔
      ∃ A : IntermediateField K L, Dense (A : Set L) ∧ Algebra.trdeg K A ≤ (n : Cardinal) := by sorry

lemma topologicalTrdeg_le_of_dense (A : IntermediateField K L) (n : ℕ)
    (hd : Dense (A : Set L)) (ht : Algebra.trdeg K A ≤ (n : Cardinal)) :
    topologicalTrdeg K L ≤ n := by sorry

lemma topologicalTrdeg_eq_top_iff :
    topologicalTrdeg K L = ⊤ ↔
      ∀ n : ℕ, ¬ ∃ A : IntermediateField K L,
        Dense (A : Set L) ∧ Algebra.trdeg K A ≤ (n : Cardinal) := by sorry

lemma topologicalTrdeg_self [TopologicalSpace K] : topologicalTrdeg K K = 0 := by sorry

lemma topologicalTrdeg_equiv {M : Type u} [Field M] [Algebra K M]
    [TopologicalSpace M] (e : L ≃ₐ[K] M) (he : IsHomeomorph (e : L → M)) :
    topologicalTrdeg K L = topologicalTrdeg K M := by sorry

-- topologicalTrdeg_self_test
example [TopologicalSpace K] : topologicalTrdeg K K = 0 := by sorry

-- topologicalTrdeg_dense_algebraic
example (A : IntermediateField K L) [Algebra.IsAlgebraic K A]
    (hd : Dense (A : Set L)) : topologicalTrdeg K L = 0 := by sorry

-- topologicalTrdeg_discrete_one
example [DiscreteTopology L] (h : Algebra.trdeg K L = 1) :
    topologicalTrdeg K L = 1 := by sorry

-- topologicalTrdeg_discrete_infinite
example [DiscreteTopology L] (h : Cardinal.aleph0 ≤ Algebra.trdeg K L) :
    topologicalTrdeg K L = ⊤ := by sorry

variable {L} in
/-- `DiamondEtaleCohomology:C8/topological-independence-degree`, Temkin §2.1.6.
No element of `s` lies in the closure of the elements algebraic over the intermediate field
generated by the other elements. In a complete algebraically closed `L` that closure is the
completed algebraic closure, so this is Temkin's topgebraic independence. -/
def IsTopAlgIndependent (s : Set L) : Prop :=
  ∀ x ∈ s, x ∉ closure {y : L | IsAlgebraic (IntermediateField.adjoin K (s \ {x})) y}

/-- Temkin's independent degree `top.tr.deg`, through finite independent sets. -/
def topologicalIndependenceDegree : ℕ∞ :=
  ⨆ (s : Finset L) (_ : IsTopAlgIndependent K (s : Set L)), (s.card : ℕ∞)

lemma topologicalIndependenceDegree_le_iff (n : ℕ) :
    topologicalIndependenceDegree K L ≤ n ↔
      ∀ s : Finset L, IsTopAlgIndependent K (s : Set L) → s.card ≤ n := by sorry

variable {K L} in
lemma IsTopAlgIndependent.algebraicIndependent {s : Set L}
    (h : IsTopAlgIndependent K s) : AlgebraicIndependent K ((↑) : s → L) := by sorry

variable {K L} in
lemma IsTopAlgIndependent.mono {s t : Set L} (h : IsTopAlgIndependent K s) (hts : t ⊆ s) :
    IsTopAlgIndependent K t := by sorry

lemma topologicalIndependenceDegree_self [TopologicalSpace K] :
    topologicalIndependenceDegree K K = 0 := by sorry

-- isTopAlgIndependent_discrete
example [DiscreteTopology L] (s : Set L) :
    IsTopAlgIndependent K s ↔ AlgebraicIndependent K ((↑) : s → L) := by sorry

-- isTopAlgIndependent_singleton
example (x : L) :
    IsTopAlgIndependent K ({x} : Set L) ↔ x ∉ closure {y : L | IsAlgebraic K y} := by sorry
end DenseIntermediateFields

section PadicComplex
variable (p : ℕ) [Fact p.Prime]

-- topologicalTrdeg_padicComplex: the algebraic closure of `ℚ_[p]` is dense in `ℂ_[p]`,
-- although `Algebra.trdeg ℚ_[p] ℂ_[p]` is infinite.
example : topologicalTrdeg ℚ_[p] ℂ_[p] = 0 := by sorry

-- topologicalIndependenceDegree_padicComplex
example : topologicalIndependenceDegree ℚ_[p] ℂ_[p] = 0 := by sorry
end PadicComplex

/-!
## Complete fields: the unmodified invariant

All embeddings in this block are explicitly isometric. The algebra towers express the
commuting squares, rather than implicitly identifying unrelated field embeddings.

Closed algebraically closed intermediate fields express the finite-generator condition
intrinsically. This is not an unconstrained predicate field. Closedness in the complete
ambient normed field supplies completeness with the subspace metric.

Important proof boundary: the pinned `IsAlgClosed.of_denseRange` requires `CharZero`.
It cannot discharge the positive-characteristic completion step needed here. Conrad's
"Completion of algebraic closure", Section 2, supplies a characteristic-independent
root-approximation proof; its adaptation and the remaining proof leaves are recorded in
the handoff, not assumed to be compiled library results.
-/
section CompleteFields
variable (K L M : Type u)
variable [NontriviallyNormedField K] [NontriviallyNormedField L]
variable [NontriviallyNormedField M]
variable [CompleteSpace K] [CompleteSpace L] [CompleteSpace M]
variable [IsUltrametricDist K] [IsUltrametricDist L] [IsUltrametricDist M]
variable [IsAlgClosed K] [IsAlgClosed L] [IsAlgClosed M]

/-- `DiamondEtaleCohomology:C8/finite-topological-generators`.
The tuple may contain repetitions, permitting padding from fewer than n generators. -/
lemma finite_topological_generators [Algebra K L]
    (hKL : Isometry (algebraMap K L)) (n : ℕ) :
    topologicalTrdeg K L ≤ n ↔
      ∃ t : Fin n → L, ∀ A : IntermediateField K L,
        IsClosed (A : Set L) → IsAlgClosed A →
        (∀ i, t i ∈ A) → A = ⊤ := by sorry

/-- `DiamondEtaleCohomology:C8/topological-trdeg-tower`. -/
lemma topological_trdeg_tower [Algebra K L] [Algebra L M] [Algebra K M]
    [IsScalarTower K L M]
    (hKL : Isometry (algebraMap K L)) (hLM : Isometry (algebraMap L M)) :
    topologicalTrdeg K M ≤ topologicalTrdeg L M + topologicalTrdeg K L := by sorry

/-- `DiamondEtaleCohomology:C8/independent-le-generating-degree` (a), Temkin 3.2.1. -/
lemma topologicalIndependenceDegree_le_topologicalTrdeg [Algebra K M]
    (hKM : Isometry (algebraMap K M)) :
    topologicalIndependenceDegree K M ≤ topologicalTrdeg K M := by sorry

/-- `DiamondEtaleCohomology:C8/independent-le-generating-degree` (b), Temkin 3.2.3 and
Remark 2.1.10(i): equality when the generating degree is finite. -/
lemma topologicalIndependenceDegree_eq_of_lt_top [Algebra K M]
    (hKM : Isometry (algebraMap K M)) (hfin : topologicalTrdeg K M < ⊤) :
    topologicalIndependenceDegree K M = topologicalTrdeg K M := by sorry

/-- `DiamondEtaleCohomology:C8/independent-le-generating-degree` (c), Temkin Lemma 2.2.2. -/
lemma topologicalIndependenceDegree_mono [Algebra K L] [Algebra L M] [Algebra K M]
    [IsScalarTower K L M]
    (hKL : Isometry (algebraMap K L)) (hLM : Isometry (algebraMap L M)) :
    topologicalIndependenceDegree K L ≤ topologicalIndependenceDegree K M := by sorry

-- topologicalTrdeg_eq_zero_iff_surjective
example [Algebra K L] (hKL : Isometry (algebraMap K L)) :
    topologicalTrdeg K L = 0 ↔ Function.Surjective (algebraMap K L) := by sorry

/-- ECD's paragraph after Question 21.4, using Temkin 3.2.3 and 2.2.2.
The finiteness assumption is on the intermediate extension, not only the ambient one. -/
lemma topologicalTrdeg_mono_of_lt_top [Algebra K L] [Algebra L M] [Algebra K M]
    [IsScalarTower K L M]
    (hKL : Isometry (algebraMap K L)) (hLM : Isometry (algebraMap L M))
    (hfinite : topologicalTrdeg K L < ⊤) :
    topologicalTrdeg K L ≤ topologicalTrdeg K M := by sorry

/-- `DiamondEtaleCohomology:C8/topological-trdeg-base-change`.
The density hypothesis concerns the relative algebraic closure of the compositum in L'.
It is neither an arbitrary square nor a requirement that the bare compositum be dense. -/
lemma topological_trdeg_base_change
    (K' L' : Type u) [NontriviallyNormedField K'] [NontriviallyNormedField L']
    [CompleteSpace K'] [CompleteSpace L'] [IsUltrametricDist K'] [IsUltrametricDist L']
    [IsAlgClosed K'] [IsAlgClosed L']
    [Algebra K K'] [Algebra K L] [Algebra K L'] [Algebra K' L'] [Algebra L L']
    [IsScalarTower K K' L'] [IsScalarTower K L L']
    (hKK' : Isometry (algebraMap K K')) (hKL : Isometry (algebraMap K L))
    (hK'L' : Isometry (algebraMap K' L')) (hLL' : Isometry (algebraMap L L'))
    (hd : Dense {x : L' |
      IsAlgebraic (IntermediateField.adjoin L (Set.range (algebraMap K' L'))) x}) :
    topologicalTrdeg L L' ≤ topologicalTrdeg K K' := by sorry
end CompleteFields

/-!
## Modified topological transcendence degree

The helper bundles actual extension data. It does not assume any of the dimension
theorems. Its universe is a cutoff: every finite witness in a larger universe has a
small model, by algebraic finite generation followed by metric completion. Establish
that size comparison before identifying this infimum with ECD's unrestricted minimum.
-/
structure CompleteACExtension (K L : Type u)
    [NontriviallyNormedField K] [NontriviallyNormedField L] [Algebra K L] where
  Field : Type u
  normedField : NontriviallyNormedField Field
  complete : @CompleteSpace Field normedField.toUniformSpace
  ultrametric : @IsUltrametricDist Field normedField.toDist
  algebraicallyClosed : @IsAlgClosed Field normedField.toField
  algebraK : Algebra K Field
  algebraL : Algebra L Field
  tower : @IsScalarTower K L Field _ _ algebraK.toSMul
  isometry : Isometry (@algebraMap L Field _ _ algebraL)

attribute [instance] CompleteACExtension.normedField CompleteACExtension.complete
  CompleteACExtension.ultrametric CompleteACExtension.algebraicallyClosed
  CompleteACExtension.algebraK CompleteACExtension.algebraL CompleteACExtension.tower

section ModifiedFields
variable (K L : Type u) [NontriviallyNormedField K] [NontriviallyNormedField L]
variable [CompleteSpace K] [CompleteSpace L] [IsUltrametricDist K] [IsUltrametricDist L]
variable [IsAlgClosed K] [IsAlgClosed L] [Algebra K L]

def modifiedTopologicalTrdeg (K L : Type u)
    [NontriviallyNormedField K] [NontriviallyNormedField L] [Algebra K L] : ℕ∞ :=
  ⨅ (n : ℕ) (_ : ∃ E : CompleteACExtension K L, topologicalTrdeg K E.Field ≤ n), (n : ℕ∞)

lemma modifiedTopologicalTrdeg_le_iff (n : ℕ) :
    modifiedTopologicalTrdeg K L ≤ n ↔
      ∃ E : CompleteACExtension K L, topologicalTrdeg K E.Field ≤ n := by sorry

lemma modifiedTopologicalTrdeg_le (hKL : Isometry (algebraMap K L)) :
    modifiedTopologicalTrdeg K L ≤ topologicalTrdeg K L := by sorry

lemma modifiedTopologicalTrdeg_mono
    (M : Type u) [NontriviallyNormedField M] [CompleteSpace M]
    [IsUltrametricDist M] [IsAlgClosed M] [Algebra L M] [Algebra K M]
    [IsScalarTower K L M] (hLM : Isometry (algebraMap L M)) :
    modifiedTopologicalTrdeg K L ≤ modifiedTopologicalTrdeg K M := by sorry

lemma modifiedTopologicalTrdeg_equiv
    (M : Type u) [NontriviallyNormedField M] [CompleteSpace M]
    [IsUltrametricDist M] [IsAlgClosed M] [Algebra K M]
    (e : L ≃ₐ[K] M) (he : Isometry e) :
    modifiedTopologicalTrdeg K L = modifiedTopologicalTrdeg K M := by sorry

/-- The finite-degree case does not assert an answer to Question 21.4. -/
lemma modifiedTopologicalTrdeg_eq_of_lt_top (hKL : Isometry (algebraMap K L))
    (hfinite : topologicalTrdeg K L < ⊤) :
    modifiedTopologicalTrdeg K L = topologicalTrdeg K L := by sorry

lemma modified_topological_trdeg_tower
    (M : Type u) [NontriviallyNormedField M] [CompleteSpace M]
    [IsUltrametricDist M] [IsAlgClosed M] [Algebra L M] [Algebra K M]
    [IsScalarTower K L M]
    (hKL : Isometry (algebraMap K L)) (hLM : Isometry (algebraMap L M)) :
    modifiedTopologicalTrdeg K M ≤
      modifiedTopologicalTrdeg L M + modifiedTopologicalTrdeg K L := by sorry

lemma modified_topological_trdeg_base_change
    (K' L' : Type u) [NontriviallyNormedField K'] [NontriviallyNormedField L']
    [CompleteSpace K'] [CompleteSpace L'] [IsUltrametricDist K'] [IsUltrametricDist L']
    [IsAlgClosed K'] [IsAlgClosed L']
    [Algebra K K'] [Algebra K L'] [Algebra K' L'] [Algebra L L']
    [IsScalarTower K K' L'] [IsScalarTower K L L']
    (hKK' : Isometry (algebraMap K K')) (hKL : Isometry (algebraMap K L))
    (hK'L' : Isometry (algebraMap K' L')) (hLL' : Isometry (algebraMap L L'))
    (hd : Dense {x : L' |
      IsAlgebraic (IntermediateField.adjoin L (Set.range (algebraMap K' L'))) x}) :
    modifiedTopologicalTrdeg L L' ≤ modifiedTopologicalTrdeg K K' := by sorry

-- modifiedTopologicalTrdeg_identity
example : modifiedTopologicalTrdeg K K = 0 := by sorry

-- modifiedTopologicalTrdeg_zeroWitness
example (E : CompleteACExtension K L) (hE : topologicalTrdeg K E.Field = 0) :
    modifiedTopologicalTrdeg K L = 0 := by sorry

-- modifiedTopologicalTrdeg_noFiniteWitness
example (h : ∀ n : ℕ, ¬ ∃ E : CompleteACExtension K L,
    topologicalTrdeg K E.Field ≤ n) : modifiedTopologicalTrdeg K L = ⊤ := by sorry

-- modifiedTopologicalTrdeg_eq_zero_iff_surjective
example (hKL : Isometry (algebraMap K L)) :
    modifiedTopologicalTrdeg K L = 0 ↔ Function.Surjective (algebraMap K L) := by sorry

-- modifiedTopologicalTrdeg_eq_one
example (hKL : Isometry (algebraMap K L)) (h : topologicalTrdeg K L = 1) :
    modifiedTopologicalTrdeg K L = 1 := by sorry

-- modifiedTopologicalTrdeg_vsOriginal
example (hKL : Isometry (algebraMap K L))
    (hmono : ∀ E : CompleteACExtension K L,
      topologicalTrdeg K L ≤ topologicalTrdeg K E.Field) :
    modifiedTopologicalTrdeg K L = topologicalTrdeg K L := by sorry
end ModifiedFields

/-! ## The characteristic-p wild subgroup, via the finite continuous quotient criterion -/
section WildAutomorphisms
open Filter
open scoped Topology
variable {p : ℕ} {C : Type u}
variable [NontriviallyNormedField C] [CompleteSpace C]
variable [IsUltrametricDist C] [IsAlgClosed C] [CharP C p]

/-- `DiamondEtaleCohomology:C8/wild-automorphism`, ECD Lemma 21.17.
The inequality is the literal trivial-action condition on leading multiplicative terms.
Factorial-power convergence is an assumption, not inferred merely from continuity. -/
lemma wild_automorphism (hp : p.Prime) (γ : C ≃+* C) (hγ : Continuous γ)
    (hfactorial : ∀ x : C,
      Tendsto (fun n : ℕ => (γ ^ Nat.factorial n) x) atTop (𝓝 x))
    (hleading : ∀ x : C, x ≠ 0 → ‖γ x / x - 1‖ < 1) :
    ∀ x : C, Tendsto (fun n : ℕ => (γ ^ (p ^ n)) x) atTop (𝓝 x) := by sorry

/-- `DiamondEtaleCohomology:C8/wild-kernel-pro-p`, the first step of ECD 21.16.
P is identified by its actual membership condition, not an opaque wildness proposition.
Faithfulness excludes an invisible non-pro-p kernel in the action. -/
lemma wild_kernel_pro_p (hp : p.Prime)
    {G : Type v} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [T2Space G] [TotallyDisconnectedSpace G]
    (ρ : G →* (C ≃+* C)) (hfaithful : Function.Injective ρ)
    (hact : Continuous (fun gx : G × C => ρ gx.1 gx.2))
    (P : Subgroup G) (hclosed : IsClosed (P : Set G))
    (hP : ∀ g : G, g ∈ P ↔ ∀ x : C, x ≠ 0 → ‖ρ g x / x - 1‖ < 1) :
    ∀ (H : Type v) [Group H] [Finite H] [TopologicalSpace H] [DiscreteTopology H]
      (q : P →* H), Continuous q → Function.Surjective q → IsPGroup p H := by sorry

-- Supplemental regression: identity automorphism satisfies both convergence conclusions.
example (x : C) :
    Tendsto (fun n : ℕ => ((RingEquiv.refl C) ^ Nat.factorial n) x) atTop (𝓝 x) ∧
      Tendsto (fun n : ℕ => ((RingEquiv.refl C) ^ (p ^ n)) x) atTop (𝓝 x) := by sorry

-- Supplemental regression: the leading-term condition omits zero, where division is totalized.
example : ¬ ‖(RingEquiv.refl C) 0 / (0 : C) - 1‖ < 1 := by sorry
end WildAutomorphisms

/-!
## Specialization chains in the constructible topology

The chain relation is always evaluated in the ORIGINAL topology on X. Using specialization
in `WithConstructibleTopology X` instead would retain only constant chains for spectral X.
The carrier is a subtype of the finite product of Mathlib's existing constructible-topology
synonym. `SpecializationChain` is its helper spelling, not a new spectral-space carrier.
-/
section SpecializationChains
open CategoryTheory
open scoped Simplicial
variable (X : Type u) [TopologicalSpace X]

/-- Helper carrier for the single construction node
`DiamondEtaleCohomology:C8/specialization-chain-space`. -/
abbrev SpecializationChain (X : Type u) [TopologicalSpace X] (n : ℕ) : Type u :=
  {c : Fin (n + 1) → WithConstructibleTopology X //
    ∀ i j, i ≤ j →
      Specializes (WithTopology.ofTopology (c i) : X) (WithTopology.ofTopology (c j) : X)}

/-- The simplicial TOPological space of specialization chains, not an ordinary hypercover
with an augmentation obtained by taking the first vertex. The object carrier and maps on
points are given explicitly; continuity and functor laws remain proof obligations. -/
def specializationChainSpace : SimplicialObject TopCat.{u} where
  obj n := TopCat.of (SpecializationChain X n.unop.len)
  map {n m} θ := TopCat.ofHom {
    toFun := fun c => ⟨fun i => c.val (θ.unop.toOrderHom i),
      fun i j hij => c.property _ _ (θ.unop.toOrderHom.monotone hij)⟩
    continuous_toFun := by sorry }
  map_id := by sorry
  map_comp := by sorry

/-- The degree-zero chain space is the EXISTING constructible-topology space. -/
def specializationChainSpace_zero : SpecializationChain X 0 ≃ₜ WithConstructibleTopology X := by
  sorry

-- Coordinate contract of the preceding comparison; helper, not another packet node.
lemma specializationChainSpace_zero_apply (c : SpecializationChain X 0) :
    specializationChainSpace_zero X c = c.val 0 := by sorry

lemma specializationChainSpace_face {n : ℕ} (i : Fin (n + 2))
    (c : SpecializationChain X (n + 1)) (j : Fin (n + 1)) :
    ((specializationChainSpace X).δ i c).val j =
      c.val ((SimplexCategory.δ i).toOrderHom j) := by sorry

lemma specializationChainSpace_degeneracy {n : ℕ} (i : Fin (n + 1))
    (c : SpecializationChain X n) (j : Fin (n + 2)) :
    ((specializationChainSpace X).σ i c).val j =
      c.val ((SimplexCategory.σ i).toOrderHom j) := by sorry

/-- In positive degree, nondegeneracy is failure to lie in every elementary degeneracy image.
T0 is necessary for a repeated nonadjacent vertex to force an adjacent repetition. -/
lemma specializationChainSpace_nondegenerate [T0Space X] {n : ℕ}
    (c : SpecializationChain X (n + 1)) :
    (¬ ∃ (i : Fin (n + 1)) (d : SpecializationChain X n),
        (specializationChainSpace X).σ i d = c) ↔ Function.Injective c.val := by sorry

-- specializationChainSpace_empty
example [IsEmpty X] (n : ℕ) : IsEmpty (SpecializationChain X n) := by sorry

-- specializationChainSpace_point: existence and uniqueness, including degree zero.
example [Unique X] (n : ℕ) : Unique (SpecializationChain X n) := by sorry
example [Unique X] (n : ℕ) (c : SpecializationChain X (n + 1)) :
    ∃ (i : Fin (n + 1)) (d : SpecializationChain X n),
      (specializationChainSpace X).σ i d = c := by sorry

-- specializationChainSpace_discrete: stronger than the two-point discrete regression.
example [DiscreteTopology X] (n : ℕ) (c : SpecializationChain X n)
    (i j : Fin (n + 1)) : c.val i = c.val j := by sorry

-- specializationChainSpace_twoPointChain: Prop with Mathlib's Sierpinski topology.
example :
    (∃! c : SpecializationChain Prop 1, Function.Injective c.val) ∧
      ¬ ∃ c : SpecializationChain Prop 2, Function.Injective c.val := by sorry

-- Supplemental regression: first-vertex projection does NOT commute with face zero.
-- The unique nondegenerate Sierpinski edge changes its first vertex when that face is taken.
example : ∃ c : SpecializationChain Prop 1,
    WithTopology.ofTopology (((specializationChainSpace Prop).δ (0 : Fin 2) c).val 0) ≠
      WithTopology.ofTopology (c.val 0) := by sorry
end SpecializationChains

section Specialization
attribute [local instance] specializationOrder

-- DiamondEtaleCohomology:C8/specialization-dimension
lemma specialization_dimension (X : Type u) [TopologicalSpace X]
    [QuasiSober X] [T0Space X] :
    topologicalKrullDim X = Order.krullDim X := by sorry
end Specialization

end TauCeti.DiamondEtale

/-
Omitted signatures under PROTOCOL §13. The actual analytic/diamond/site/enhanced and
cohomological-dimension carriers are supplied by the named owners in the packet.
These 49 nodes are not represented by arbitrary proposition fields.

DiamondEtaleCohomology:C8/analytic-dim-trg — Geometric transcendence dimension of an analytic map
  Omitted API: analyticDimTrg_le_iff
  Omitted API: analyticDimTrg_equiv
  Omitted API: analyticDimTrg_empty
  Omitted API: analyticDimTrg_field
  Omitted example: analyticDimTrg_empty_test
  Omitted example: analyticDimTrg_identity_point
  Omitted example: analyticDimTrg_field_test
DiamondEtaleCohomology:C8/analytic-dimension-bound — Topological dimension bounded by geometric transcendence dimension
DiamondEtaleCohomology:C8/diamond-dim-trg — Geometric transcendence dimension of a diamond map
  Omitted API: diamondDimTrg_le_iff
  Omitted API: diamondDimTrg_vstack
  Omitted API: diamondDimTrg_empty
  Omitted API: diamondDimTrg_point
  Omitted API: diamondDimTrg_representative
  Omitted example: diamondDimTrg_empty_test
  Omitted example: diamondDimTrg_identity_point
  Omitted example: diamondDimTrg_field_test
  Omitted example: diamondDimTrg_bottom
DiamondEtaleCohomology:C8/diamond-dim-base-change — Geometric transcendence dimension under pullback
DiamondEtaleCohomology:C8/diamond-dim-composition — Geometric transcendence dimension of a composite
DiamondEtaleCohomology:C8/locally-finite-dim-trg — Local finiteness of geometric transcendence dimension
  Omitted API: locallyFiniteDimTrg_of_bound
  Omitted API: locallyFiniteDimTrg_openCover
  Omitted API: locallyFiniteDimTrg_baseChange
  Omitted API: locallyFiniteDimTrg_identity
  Omitted example: locallyFiniteDimTrg_empty
  Omitted example: locallyFiniteDimTrg_identity_test
  Omitted example: locallyFiniteDimTrg_localNotUniform
DiamondEtaleCohomology:C8/strictly-disconnected-acyclic — Étale acyclicity of strictly totally disconnected spaces
DiamondEtaleCohomology:C8/qpetale-direct-image — Degree-zero direct image for quasi-pro-étale maps
DiamondEtaleCohomology:C8/injection-direct-image — Degree-zero direct image for a quasicompact injection
DiamondEtaleCohomology:C8/point-quotient — A one-point diamond as a profinite quotient
DiamondEtaleCohomology:C8/point-quotient-unique — Uniqueness of the profinite point presentation
DiamondEtaleCohomology:C8/point-sheaf-equivalence — Sheaves at a diamond point as discrete modules
DiamondEtaleCohomology:C8/point-cohomology — Point cohomology is canonical continuous cohomology
DiamondEtaleCohomology:C8/point-cd — Cohomological dimension at a maximal point
  Omitted API: pointCd_presentation
  Omitted API: pointCd_le_iff
  Omitted API: pointCd_equiv
  Omitted API: pointCd_open
  Omitted example: pointCd_closedField
  Omitted example: pointCd_presentation_test
  Omitted example: pointCd_unbounded
DiamondEtaleCohomology:C8/specialization-stabilizers — Closed inclusion of specialization stabilizers
DiamondEtaleCohomology:C8/closed-point-cohomology — Cohomology with support at the closed point
DiamondEtaleCohomology:C8/closed-point-bound — Closed-point support and generic-point cohomological dimension
DiamondEtaleCohomology:C8/extension-cd-bound — Cohomological dimension of a profinite extension
DiamondEtaleCohomology:C8/prime-to-p-wild-removal — Removing a pro-p kernel from cohomological dimension
DiamondEtaleCohomology:C8/residue-galois-identification — The residue action as an absolute Galois group
DiamondEtaleCohomology:C8/residue-cd-bound — Residue-field transcendence bound
DiamondEtaleCohomology:C8/tame-character-embedding — The tame-inertia character embedding
DiamondEtaleCohomology:C8/tame-cd-bound — Cohomological dimension of tame inertia
DiamondEtaleCohomology:C8/valuation-transcendence-bound — Residue and value-group transcendence inequality
DiamondEtaleCohomology:C8/point-cd-geometric-bound — Maximal-point cohomological dimension bound
DiamondEtaleCohomology:C8/chain-cohomology-comparison — Cohomology from the quasi-augmented chain space
DiamondEtaleCohomology:C8/spectral-cohomological-bound — Spectral-space cohomological dimension
DiamondEtaleCohomology:C8/boundary-dimension-drop — Dimension drop at the boundary of an open stratum
DiamondEtaleCohomology:C8/constructible-support-reduction — Constructible reduction with controlled support
DiamondEtaleCohomology:C8/local-stalk-bound — The local stalk bound for topological direct image
DiamondEtaleCohomology:C8/spatial-cohomological-bound — Cohomological dimension of a spatial diamond
DiamondEtaleCohomology:C8/partially-proper-closure-dimension — Dimension of a rank-one closure in a partially proper adic space
DiamondEtaleCohomology:C8/partially-proper-dimension — Dimension of a partially proper adic space
DiamondEtaleCohomology:C8/partially-proper-fibre-dimension — Closure dimension along a partially proper analytic map
DiamondEtaleCohomology:C9/bounded-filtered-compactness — Constructible sheaves and bounded filtered colimits
DiamondEtaleCohomology:C9/uniform-test-bound — The same cohomological bound on étale test objects
DiamondEtaleCohomology:C9/left-completeness — Left completeness under the uniform bound
DiamondEtaleCohomology:C9/ordinary-derived-comparison — The ordinary and enhanced étale categories agree
DiamondEtaleCohomology:C9/global-sections-coproducts — Global sections preserves coproducts under a uniform bound
DiamondEtaleCohomology:C9/etale-constant-compact — Compactness of étale extension-by-zero generators
DiamondEtaleCohomology:C9/etale-generators-detect-zero — Étale test objects detect zero complexes
DiamondEtaleCohomology:C9/compact-generators — Compact generation under bounded cohomological dimension
DiamondEtaleCohomology:C9/compact-implies-perfect-constructible — Compact objects are perfect-constructible
DiamondEtaleCohomology:C9/perfect-local-system-compact — Compactness of extensions of perfect local systems
DiamondEtaleCohomology:C9/perfect-constructible-implies-compact — Perfect-constructible objects are compact
DiamondEtaleCohomology:C9/compact-iff-perfect-constructible — Characterization of compact étale complexes
DiamondEtaleCohomology:C9/finite-field-compact-objects — Compact complexes with finite-field coefficients
DiamondEtaleCohomology:C8/topological-dimension-field-tests — Topological fibre dimension can be tested on field points
DiamondEtaleCohomology:C9/compact-generation-from-dimension-bounds — Compact generation from finite dimension bounds
-/
