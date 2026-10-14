import Mathlib.Algebra.Algebra.Pi
import Mathlib.Algebra.Category.CommAlgCat.Basic
import Mathlib.Algebra.Category.ModuleCat.Abelian
import Mathlib.Algebra.Category.ModuleCat.Biproducts
import Mathlib.Algebra.Category.ModuleCat.Limits
import Mathlib.Algebra.Category.ModuleCat.Monoidal.Symmetric
import Mathlib.Algebra.DualNumber
import Mathlib.Algebra.Group.Action.End
import Mathlib.Algebra.Group.Subgroup.Basic
import Mathlib.Algebra.Homology.ShortComplex.Exact
import Mathlib.Algebra.Module.Submodule.Ker
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Algebra.Polynomial.Derivative
import Mathlib.Algebra.Polynomial.Eval.Defs
import Mathlib.Algebra.Torsor.Defs
import Mathlib.Algebra.TrivSqZeroExt.Basic
import Mathlib.AlgebraicGeometry.Noetherian
import Mathlib.AlgebraicGeometry.Scheme
import Mathlib.AlgebraicGeometry.Sites.Etale
import Mathlib.Analysis.Analytic.Basic
import Mathlib.CategoryTheory.Category.Preorder
import Mathlib.CategoryTheory.Comma.Over.Basic
import Mathlib.CategoryTheory.Galois.Topology
import Mathlib.CategoryTheory.Limits.Types.Filtered
import Mathlib.CategoryTheory.Linear.FunctorCategory
import Mathlib.CategoryTheory.Monoidal.NaturalTransformation
import Mathlib.CategoryTheory.ObjectProperty.FullSubcategory
import Mathlib.CategoryTheory.Yoneda
import Mathlib.Data.Fintype.Card
import Mathlib.Data.Set.Finite.Basic
import Mathlib.Data.ZMod.Basic
import Mathlib.GroupTheory.Coset.Basic
import Mathlib.GroupTheory.Finiteness
import Mathlib.GroupTheory.GroupAction.ConjAct
import Mathlib.GroupTheory.GroupAction.Defs
import Mathlib.GroupTheory.GroupAction.OfQuotient
import Mathlib.GroupTheory.GroupAction.Quotient
import Mathlib.GroupTheory.Nilpotent
import Mathlib.GroupTheory.Perm.Basic
import Mathlib.GroupTheory.Perm.Fin
import Mathlib.GroupTheory.SpecificGroups.Cyclic
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.LinearAlgebra.Dual.Lemmas
import Mathlib.LinearAlgebra.FiniteDimensional.Basic
import Mathlib.LinearAlgebra.Finsupp.LSum
import Mathlib.LinearAlgebra.Isomorphisms
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Prod
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.TensorProduct.Map
import Mathlib.NumberTheory.ArithmeticFunction.Moebius
import Mathlib.NumberTheory.Divisors
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.RepresentationTheory.Homological.ContCohomology.Basic
import Mathlib.RepresentationTheory.Homological.GroupCohomology.LowDegree
import Mathlib.RepresentationTheory.Homological.GroupCohomology.Shapiro
import Mathlib.RingTheory.Derivation.Basic
import Mathlib.RingTheory.Etale.Finite
import Mathlib.RingTheory.RootsOfUnity.PrimitiveRoots
import Mathlib.RingTheory.TwoSidedIdeal.Operations
import Mathlib.Tactic.Group
import Mathlib.Topology.Algebra.ClopenNhdofOne
import Mathlib.Topology.Algebra.ContinuousMonoidHom
import Mathlib.Topology.Algebra.Group.Quotient
import Mathlib.Topology.Algebra.Group.Subgroup
import Mathlib.Topology.Algebra.Group.Torsor
import Mathlib.Topology.Algebra.MulAction
import Mathlib.Topology.Algebra.OpenSubgroup
import TauCeti.Algebra.AlgebraicGroup.Representation.Tannaka.Equivalence
import TauCeti.Algebra.Coalgebra.Comodule.Finite.ScalarExtension.Monoidal
import TauCeti.AlgebraicGeometry.AffineGroupScheme.Unipotent
import TauCeti.FieldTheory.GaloisCohomology.Kummer
import TauCeti.RepresentationTheory.Homological.ContCohomology.ExplicitFunctoriality
import TauCeti.RepresentationTheory.Homological.ContCohomology.FiniteQuotient.Colimit
import TauCeti.RepresentationTheory.Homological.ContCohomology.Inflation
import TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree
import TauCeti.Topology.Algebra.Group.Profinite.MaximalProP

/-!
# Anabelian geometry and nonabelian Chabauty — suggested declarations

This file is not the roadmap and is not exhaustive. The roadmap document,
`research/blueprint/readmes/AnabelianGeometryAndNonabelianChabauty.md`, is definitive.
The statements below suggest Lean forms so that contributors and reviewers converge on
names and signatures. Every proof is `sorry`; nothing here is claimed to be formalised.

The file states what the pinned libraries (Mathlib `082e2d3`, Tau Ceti `f790474`) can
already express. Its sections follow the roadmap's layers, with the cohomological core first
because the other layers use it:

* the cohomological core of layer NC.3 (`TauCeti.NonabelianCohomology`): continuous
  cocycles, `H1` as a pointed orbit set, connecting maps for nonnormal subgroups, discrete
  finite-quotient descent, inflation and restriction, coefficient and source functoriality,
  inner twisting and gauge transport, twisted kernels, the invariant action on kernel
  classes, equivariant topological torsors; and the finite-coefficient regressions of the
  étale K(π,1) interface of layer NC.0 (`TauCeti.EtaleKPiOne`);
* layer NC.0: arithmetic paths over the identity on constants, transported sections, path
  cocycles, local inertia orbits, good and symmetric paths;
* layer NC.1 (`TauCeti.Anabelian`): relative outer homomorphisms and isomorphisms, the
  geometrically pro-p quotient, tower decomposition groups and canonical relations;
* layer NC.2: unipotent length, universal pointed objects, finite path modules, the affine
  universal connection, filtered path fibres and Frobenius transport on native carriers;
* layer NC.3 (`TauCeti.NonabelianCohomology.NC3`): the positive central defect and its
  continuous H² class, Galois coefficient families, the cohomology functor, neutral loci and
  Selmer functors;
* layer NC.4 (`TauCeti.ChabautyKim`): torsor-point periods, affine coefficient points,
  represented morphisms, point loci and the depth-one linear comparison;
* layer NC.5: nice correspondences, the depth-two height quotient and module, admissible
  Tate classes, quadratic Chabauty pairs and height determinants on native linear carriers;
* layer NC.6 (`TauCeti.Anabelian`): Galois sections and section classes, the section map,
  divisibility, Witt and Labute dimensions, and the eventual-equality combinatorics.

Each layer keeps the namespace its plan gives to its declarations. Statements whose carriers
(étale fundamental groups of schemes, unipotent completions, period rings, Selmer varieties,
Galois cohomology of number fields) are not at the pins are targets of the roadmap document,
not declarations here; the list at the end of the file names them.
-/

/-! ## Layers NC.3 and NC.0: the cohomological core of nonabelian H¹ and the étale K(π,1) interface -/

section CohomologicalCore

noncomputable section
namespace TauCeti.NonabelianCohomology
universe u v w

section Basic
variable (G : Type u) [Group G] [TopologicalSpace G]
  (U : Type v) [Group U] [TopologicalSpace U] [MulDistribMulAction G U]

/-- NC.3/continuous-cocycles: the invariants `H⁰(G, U) = U^G`. -/
abbrev H0 : Subgroup U := FixedPoints.subgroup G U

/-- NC.3/continuous-cocycles: continuous `1`-cocycles `c(gh) = c(g) · g • c(h)`. -/
def Z1 : Type (max u v) :=
  {c : G → U // Continuous c ∧ ∀ g h, c (g * h) = c g * g • c h}

namespace Z1
variable {G U}

instance : CoeFun (Z1 G U) (fun _ => G → U) := ⟨Subtype.val⟩

theorem mem_iff (f : G → U) :
    (∃ c : Z1 G U, (c : G → U) = f) ↔
      Continuous f ∧ ∀ g h, f (g * h) = f g * g • f h := by sorry

@[ext] theorem ext {c c' : Z1 G U} (h : ∀ g, c g = c' g) : c = c' := by sorry

theorem continuous (c : Z1 G U) : Continuous (c : G → U) := c.2.1

theorem map_mul (c : Z1 G U) (g h : G) : c (g * h) = c g * g • c h := c.2.2 g h

/-- The trivial cocycle, the base point. -/
instance instOne : One (Z1 G U) := ⟨⟨fun _ => 1, continuous_const, by sorry⟩⟩

theorem map_one (c : Z1 G U) : c 1 = 1 := by sorry

theorem map_inv (c : Z1 G U) (g : G) : c g⁻¹ = g⁻¹ • (c g)⁻¹ := by sorry

variable [IsTopologicalGroup U] [ContinuousSMul G U]

/-- The coboundary `g ↦ u · (g • u)⁻¹`. -/
def coboundary (u : U) : Z1 G U := ⟨fun g => u * (g • u)⁻¹, by sorry, by sorry⟩

/-- NC.3/nonabelian-h1: the twisted-conjugation action `(u · c)(g) = u · c(g) · (g • u)⁻¹`. -/
instance instMulAction : MulAction U (Z1 G U) where
  smul u c := ⟨fun g => u * c g * (g • u)⁻¹, by sorry, by sorry⟩
  one_smul := by sorry
  mul_smul := by sorry

theorem smul_apply (u : U) (c : Z1 G U) (g : G) : (u • c) g = u * c g * (g • u)⁻¹ := by sorry

/-- For a trivial action, cocycles are continuous homomorphisms. -/
def equivContinuousMonoidHomOfTrivial [IsTopologicalGroup G]
    (htriv : ∀ (g : G) (x : U), g • x = x) : Z1 G U ≃ ContinuousMonoidHom G U := sorry

end Z1

variable [IsTopologicalGroup U] [ContinuousSMul G U]

/-- NC.3/nonabelian-h1: `H¹(G, U)`, the orbit set of the twisted-conjugation action. -/
def H1 : Type (max u v) := MulAction.orbitRel.Quotient U (Z1 G U)

namespace H1
variable {G U}

/-- The class of a cocycle. -/
def mk (c : Z1 G U) : H1 G U := Quotient.mk'' c

theorem mk_surjective : Function.Surjective (mk : Z1 G U → H1 G U) := by sorry

theorem mk_eq_mk_iff {c c' : Z1 G U} : mk c = mk c' ↔ ∃ x : U, x • c = c' := by sorry

/-- The base point. -/
instance instOne : One (H1 G U) := ⟨mk 1⟩

theorem mk_eq_one_iff (c : Z1 G U) : mk c = 1 ↔ ∃ x : U, ∀ g, c g = x * (g • x)⁻¹ := by sorry

/-- Under trivial coefficient action, the quotient is by ordinary conjugation of homomorphisms. -/
def equivOfTrivial [IsTopologicalGroup G]
    (htriv : ∀ (g : G) (x : U), g • x = x) :
    H1 G U ≃
      (letI : MulAction U (ContinuousMonoidHom G U) :=
        { smul := fun x f =>
            { toMonoidHom := (MulAut.conj x).toMonoidHom.comp f.toMonoidHom
              continuous_toFun := by sorry }
          one_smul := by sorry
          mul_smul := by sorry }
       MulAction.orbitRel.Quotient U (ContinuousMonoidHom G U)) := sorry

end H1
end Basic

section Functoriality
variable {G : Type u} [Group G] [TopologicalSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]
  [IsTopologicalGroup U] [ContinuousSMul G U]
  {U' : Type w} [Group U'] [TopologicalSpace U'] [MulDistribMulAction G U']
  [IsTopologicalGroup U'] [ContinuousSMul G U']

/-- NC.3/functoriality (a), on cocycles. -/
def Z1.map (f : U →* U') (hf : Continuous f) (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    Z1 G U → Z1 G U' := fun c => ⟨fun g => f (c g), by sorry, by sorry⟩

/-- NC.3/functoriality (a). -/
def H1.map (f : U →* U') (hf : Continuous f) (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    H1 G U → H1 G U' := sorry

theorem H1.map_one (f : U →* U') (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) : H1.map f hf hG 1 = 1 := by sorry

theorem H1.map_id : H1.map (MonoidHom.id U) continuous_id (fun (_ : G) _ => rfl) = id := by sorry

theorem H1.map_mk (f : U →* U') (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (c : Z1 G U) :
    H1.map f hf hG (H1.mk c) = H1.mk (Z1.map f hf hG c) := by sorry

/-- NC.3/functoriality (a), on invariants. -/
def H0.map (f : U →* U') (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) : H0 G U →* H0 G U' := sorry

end Functoriality

section Abelian
variable (G : Type u) [Group G] [TopologicalSpace G]
  (M : Type v) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
  [DistribMulAction G M] [ContinuousSMul G M]

/-- NC.3/abelian-comparison: the multiplicative action on `Multiplicative M` (no Mathlib instance
at the pin). -/
instance instMulDistribMulActionMultiplicative : MulDistribMulAction G (Multiplicative M) := sorry

instance : ContinuousSMul G (Multiplicative M) := sorry

/-- The identity on functions, with the additive cocycle identity on the target. -/
def Z1.equivContCohomology :
    Z1 G (Multiplicative M) ≃ TauCeti.ContCohomology.Z1 G M := sorry

/-- Invariants agree after changing between additive and multiplicative notation. -/
def H0.equivContCohomology :
    H0 G (Multiplicative M) ≃* Multiplicative (TauCeti.ContCohomology.H0 G M) := sorry

/-- NC.3/abelian-comparison. -/
def H1.equivContCohomology : H1 G (Multiplicative M) ≃ TauCeti.ContCohomology.H1 G M := sorry

theorem H1.equivContCohomology_one : H1.equivContCohomology G M 1 = 0 := by sorry

end Abelian

section ExactSequence
variable {G : Type u} [Group G] [TopologicalSpace G]
  {A : Type v} [Group A] [TopologicalSpace A] [IsTopologicalGroup A] [MulDistribMulAction G A]
  [ContinuousSMul G A]
  {B : Type v} [Group B] [TopologicalSpace B] [IsTopologicalGroup B] [MulDistribMulAction G B]
  [ContinuousSMul G B]
  {C : Type v} [Group C] [TopologicalSpace C] [IsTopologicalGroup C] [MulDistribMulAction G C]
  [ContinuousSMul G C]

/-- NC.3/connecting-cocycle: lift of the coboundary of `b⁻¹` into the subgroup.
`hb` expresses invariance of the left coset. No quotient section is used. -/
def connectingCocycle (i : A →* B) (hi : Topology.IsClosedEmbedding i)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) (b : B)
    (hb : ∀ g : G, b⁻¹ * (g • b) ∈ i.range) : Z1 G A := sorry

/-- NC.3/connecting-cocycle-image; promoted construction API. -/
theorem connectingCocycle_apply (i : A →* B) (hi : Topology.IsClosedEmbedding i)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) (b : B)
    (hb : ∀ g : G, b⁻¹ * (g • b) ∈ i.range) (g : G) :
    i (connectingCocycle i hi hG b hb g) = b⁻¹ * (g • b) := by sorry

theorem connectingCocycle_unique (i : A →* B) (hi : Topology.IsClosedEmbedding i)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) (b : B)
    (hb : ∀ g : G, b⁻¹ * (g • b) ∈ i.range) (c : Z1 G A)
    (hc : ∀ g, i (c g) = b⁻¹ * (g • b)) :
    c = connectingCocycle i hi hG b hb := by sorry

theorem connectingCocycle_eq_one_of_fixed (i : A →* B)
    (hi : Topology.IsClosedEmbedding i) (hG : ∀ (g : G) (a : A), i (g • a) = g • i a)
    (b : B) (hb : ∀ g : G, b⁻¹ * (g • b) ∈ i.range)
    (hfixed : ∀ g : G, g • b = b) : connectingCocycle i hi hG b hb = 1 := by sorry

/-- NC.3/connecting-change-lift. The second membership proof is obtained by
subgroup closure after expanding the product; it adds no independent hypothesis. -/
theorem connectingCocycle_change_lift (i : A →* B)
    (hi : Topology.IsClosedEmbedding i) (hG : ∀ (g : G) (a : A), i (g • a) = g • i a)
    (b : B) (hb : ∀ g : G, b⁻¹ * (g • b) ∈ i.range) (a : A)
    (hba : ∀ g : G, (b * i a)⁻¹ * (g • (b * i a)) ∈ i.range) :
    connectingCocycle i hi hG (b * i a) hba = a⁻¹ • connectingCocycle i hi hG b hb :=
  by sorry

/-- NC.3/connecting-fixed-orbits: left fixed-element action and right lift change. -/
theorem connecting_classes_eq_iff (i : A →* B) (hi : Topology.IsClosedEmbedding i)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) (b b' : B) (c c' : Z1 G A)
    (hc : ∀ g, i (c g) = b⁻¹ * (g • b))
    (hc' : ∀ g, i (c' g) = b'⁻¹ * (g • b')) :
    H1.mk c = H1.mk c' ↔ ∃ t : B, (∀ g : G, g • t = t) ∧
      ∃ a : A, b' = t * b * i a := by sorry

-- TauCeti.NonabelianCohomology.tests.connecting_fixed_lift
example (i : A →* B) (hi : Topology.IsClosedEmbedding i)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) (b : B)
    (hb : ∀ g : G, b⁻¹ * (g • b) ∈ i.range) (hfixed : ∀ g : G, g • b = b) :
    connectingCocycle i hi hG b hb = 1 := by sorry

-- TauCeti.NonabelianCohomology.tests.connecting_identity_embedding
example (hi : Topology.IsClosedEmbedding (MonoidHom.id B)) (b : B)
    (hb : ∀ g : G, b⁻¹ * (g • b) ∈ (MonoidHom.id B).range) :
    connectingCocycle (MonoidHom.id B) hi (fun _ _ => rfl) b hb =
      Z1.coboundary b⁻¹ := by sorry

-- TauCeti.NonabelianCohomology.tests.connecting_proof_independence
example (i : A →* B) (hi : Topology.IsClosedEmbedding i)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) (b : B)
    (hb hb' : ∀ g : G, b⁻¹ * (g • b) ∈ i.range) :
    connectingCocycle i hi hG b hb = connectingCocycle i hi hG b hb' := by sorry

-- TauCeti.NonabelianCohomology.tests.connecting_right_lift
example (i : A →* B) (hi : Topology.IsClosedEmbedding i)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) (b : B)
    (hb : ∀ g : G, b⁻¹ * (g • b) ∈ i.range) (a : A)
    (hba : ∀ g : G, (b * i a)⁻¹ * (g • (b * i a)) ∈ i.range) :
    H1.mk (connectingCocycle i hi hG (b * i a) hba) =
      H1.mk (connectingCocycle i hi hG b hb) := by sorry

/-- NC.3/exact-sequence (a), exactness at `H¹(G, A)` for a closed `G`-stable subgroup `A ↪ B`
(not necessarily normal): a class dies in `H¹(G, B)` iff it is the connecting image
`[g ↦ b⁻¹ · g • b]` of a `G`-invariant coset `bA`. -/
theorem exact_H1_of_subgroup (i : A →* B) (hi : Topology.IsClosedEmbedding i)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) (x : H1 G A) :
    H1.map i hi.continuous hG x = 1 ↔
      ∃ (b : B) (c : Z1 G A), x = H1.mk c ∧ ∀ g : G, i (c g) = b⁻¹ * (g • b) := by sorry

/-- NC.3/connecting-class-zero, exactness at the invariant cosets: the connecting class of `bA` is
trivial iff `bA` contains a `G`-invariant element. -/
theorem connecting_eq_one_iff (i : A →* B) (hi : Topology.IsClosedEmbedding i)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) (b : B) (c : Z1 G A)
    (hc : ∀ g : G, i (c g) = b⁻¹ * (g • b)) :
    H1.mk c = 1 ↔ ∃ a : A, ∀ g : G, g • (b * i a) = b * i a := by sorry

/-- NC.3/normal-h1-kernel, exactness at `H¹(G, B)` for `1 → A → B → C → 1` with `A` normal
and `B → C` a continuous open surjection: a class dies in `H¹(G, C)` iff it comes from
`H¹(G, A)`. No continuous section is needed. -/
theorem exact_H1_of_normal (i : A →* B) (hi : Topology.IsClosedEmbedding i)
    (hiG : ∀ (g : G) (a : A), i (g • a) = g • i a)
    (π : B →* C) (hπ : Continuous π) (hπo : IsOpenMap π) (hπs : Function.Surjective π)
    (hπG : ∀ (g : G) (b : B), π (g • b) = g • π b) (hker : π.ker = i.range) (y : H1 G B) :
    H1.map π hπ hπG y = 1 ↔ y ∈ Set.range (H1.map i hi.continuous hiG) := by sorry

/-- NC.3/quotient-action: equivariance makes the existing coset action available. -/
theorem quotientAction_range (i : A →* B)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) :
    MulAction.QuotientAction G i.range := by sorry

/-- Not a new quotient or invariant carrier: a local abbreviation for Mathlib's
fixed-point subset of its left coset type, with the descended action. -/
abbrev InvariantCosets (i : A →* B)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) : Type v :=
  letI : MulAction.QuotientAction G i.range := quotientAction_range i hG
  MulAction.fixedPoints G (B ⧸ i.range)

/-- NC.3/fixed-coset-criterion. No normality is needed. -/
theorem fixed_coset_iff (i : A →* B)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) (b : B) :
    letI : MulAction.QuotientAction G i.range := quotientAction_range i hG
    (QuotientGroup.mk b : B ⧸ i.range) ∈ MulAction.fixedPoints G (B ⧸ i.range) ↔
      ∀ g : G, b⁻¹ * (g • b) ∈ i.range := by sorry

/-- NC.3/invariant-coset-projection: the map from invariant elements to invariant cosets. -/
def invariantCoset (i : A →* B)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) (b : H0 G B) :
    InvariantCosets i hG := by
  letI : MulAction.QuotientAction G i.range := quotientAction_range i hG
  exact ⟨QuotientGroup.mk b.val, by sorry⟩

/-- NC.3/invariant-coset-image; promoted projection API. -/
theorem invariantCoset_apply (i : A →* B)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) (b : H0 G B) :
    (invariantCoset i hG b).val = (QuotientGroup.mk b.val : B ⧸ i.range) := by sorry

theorem invariantCoset_one (i : A →* B)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) :
    (invariantCoset i hG (1 : H0 G B)).val = (QuotientGroup.mk (1 : B) : B ⧸ i.range) :=
  by sorry

theorem invariantCoset_mul_image (i : A →* B)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) (b : H0 G B) (a : H0 G A) :
    invariantCoset i hG (b * H0.map i hG a) = invariantCoset i hG b := by sorry

/-- NC.3/connecting-map: the actual map on Mathlib's invariant cosets.
Choice of a representative is allowed; the representative formula below proves
independence. The chosen function is a class of the already planned continuous cocycle. -/
def connecting (i : A →* B) (hi : Topology.IsClosedEmbedding i)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) (q : InvariantCosets i hG) : H1 G A := by
  letI : MulAction.QuotientAction G i.range := quotientAction_range i hG
  exact H1.mk (connectingCocycle i hi hG q.val.out (by sorry))

/-- NC.3/connecting-map-lift; promoted representative API. -/
theorem connecting_mk (i : A →* B) (hi : Topology.IsClosedEmbedding i)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a)
    (q : InvariantCosets i hG) (b : B)
    (hb : ∀ g : G, b⁻¹ * (g • b) ∈ i.range)
    (hq : q.val = (QuotientGroup.mk b : B ⧸ i.range)) :
    connecting i hi hG q = H1.mk (connectingCocycle i hi hG b hb) := by sorry

theorem connecting_invariantCoset (i : A →* B) (hi : Topology.IsClosedEmbedding i)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) (b : H0 G B) :
    connecting i hi hG (invariantCoset i hG b) = 1 := by sorry

theorem connecting_change_representative (i : A →* B) (hi : Topology.IsClosedEmbedding i)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) (q q' : InvariantCosets i hG)
    (b : B) (a : A) (hq : q.val = (QuotientGroup.mk b : B ⧸ i.range))
    (hq' : q'.val = (QuotientGroup.mk (b * i a) : B ⧸ i.range)) :
    connecting i hi hG q' = connecting i hi hG q := by sorry

/-- NC.3/invariants-injection: exactness at the initial invariant subgroup. -/
theorem H0.map_injective (i : A →* B) (hi : Topology.IsClosedEmbedding i)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) :
    Function.Injective (H0.map i hG) := by sorry

/-- NC.3/invariants-kernel: exactness at `B^G`. -/
theorem invariantCoset_eq_base_iff (i : A →* B) (hi : Topology.IsClosedEmbedding i)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) (b : H0 G B) :
    invariantCoset i hG b = invariantCoset i hG (1 : H0 G B) ↔
      b ∈ Set.range (H0.map i hG) := by sorry

/-- NC.3/invariant-coset-kernel: exactness at the invariant coset set. -/
theorem connecting_eq_one_iff_mem_range (i : A →* B) (hi : Topology.IsClosedEmbedding i)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) (q : InvariantCosets i hG) :
    connecting i hi hG q = 1 ↔ q ∈ Set.range (invariantCoset i hG) := by sorry

/-- NC.3/connecting-image-kernel: the inclusion-kernel theorem with the actual boundary map. -/
theorem H1.map_eq_one_iff_mem_range_connecting (i : A →* B)
    (hi : Topology.IsClosedEmbedding i)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) (x : H1 G A) :
    H1.map i hi.continuous hG x = 1 ↔ x ∈ Set.range (connecting i hi hG) := by sorry

/-- NC.3/connecting-quotient-fibres: explicit left `B^G`-orbits on the existing coset set.
The formula uses a representative only to express the existing left translation. -/
theorem connecting_eq_connecting_iff (i : A →* B) (hi : Topology.IsClosedEmbedding i)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) (q q' : InvariantCosets i hG) :
    connecting i hi hG q = connecting i hi hG q' ↔
      ∃ t : H0 G B, q'.val = (QuotientGroup.mk (t.val * q.val.out) : B ⧸ i.range) := by sorry

-- TauCeti.NonabelianCohomology.tests.invariantCoset_identity
example (b : H0 G B) :
    invariantCoset (MonoidHom.id B) (fun (_ : G) _ => rfl) b =
      invariantCoset (MonoidHom.id B) (fun (_ : G) _ => rfl) (1 : H0 G B) := by sorry

-- TauCeti.NonabelianCohomology.tests.invariantCoset_trivial_subgroup
example (i : A →* B) (hG : ∀ (g : G) (a : A), i (g • a) = g • i a)
    (hrange : i.range = ⊥) : Function.Injective (invariantCoset i hG) := by sorry

-- TauCeti.NonabelianCohomology.tests.invariantCoset_nonnormal
-- Both actions are specified to be trivial; `K` is the two-element transposition subgroup.
example [TopologicalSpace (Multiplicative (ZMod 2))]
    [DiscreteTopology (Multiplicative (ZMod 2))]
    [TopologicalSpace (Equiv.Perm (Fin 3))] [DiscreteTopology (Equiv.Perm (Fin 3))]
    (K : Subgroup (Equiv.Perm (Fin 3)))
    [MulDistribMulAction (Multiplicative (ZMod 2)) K]
    [MulDistribMulAction (Multiplicative (ZMod 2)) (Equiv.Perm (Fin 3))]
    [ContinuousSMul (Multiplicative (ZMod 2)) K]
    [ContinuousSMul (Multiplicative (ZMod 2)) (Equiv.Perm (Fin 3))]
    (hK : ∀ b : Equiv.Perm (Fin 3), b ∈ K ↔ b = 1 ∨ b = Equiv.swap 0 1)
    (hA : ∀ (g : Multiplicative (ZMod 2)) (a : K), g • a = a)
    (hB : ∀ (g : Multiplicative (ZMod 2)) (b : Equiv.Perm (Fin 3)), g • b = b)
    (hG : ∀ (g : Multiplicative (ZMod 2)) (a : K), K.subtype (g • a) = g • K.subtype a) :
    Nat.card (InvariantCosets (G := Multiplicative (ZMod 2)) K.subtype hG) = 3 := by sorry

-- TauCeti.NonabelianCohomology.tests.connecting_coset_fixed
example (i : A →* B) (hi : Topology.IsClosedEmbedding i)
    (hG : ∀ (g : G) (a : A), i (g • a) = g • i a) (b : H0 G B) :
    connecting i hi hG (invariantCoset i hG b) = 1 := by sorry

-- TauCeti.NonabelianCohomology.tests.connecting_coset_identity
example (hi : Topology.IsClosedEmbedding (MonoidHom.id B))
    (q : InvariantCosets (MonoidHom.id B) (fun (_ : G) _ => rfl)) :
    connecting (MonoidHom.id B) hi (fun (_ : G) _ => rfl) q = 1 := by sorry

-- TauCeti.NonabelianCohomology.tests.connecting_coset_nontrivial
-- Discrete C2 acts trivially on A=C2 and by negation on B=C4; i doubles representatives.
-- The odd coset is fixed but has no fixed lift, so its actual boundary class is nontrivial.
example [TopologicalSpace (Multiplicative (ZMod 2))]
    [DiscreteTopology (Multiplicative (ZMod 2))]
    [TopologicalSpace (Multiplicative (ZMod 4))]
    [DiscreteTopology (Multiplicative (ZMod 4))]
    [actAA : MulDistribMulAction (Multiplicative (ZMod 2)) (Multiplicative (ZMod 2))]
    [MulDistribMulAction (Multiplicative (ZMod 2)) (Multiplicative (ZMod 4))]
    [@ContinuousSMul (Multiplicative (ZMod 2)) (Multiplicative (ZMod 2))
      actAA.toMulAction.toSMul _ _]
    [ContinuousSMul (Multiplicative (ZMod 2)) (Multiplicative (ZMod 4))]
    (i : Multiplicative (ZMod 2) →* Multiplicative (ZMod 4))
    (hi : Topology.IsClosedEmbedding i)
    (hG : ∀ (g a : Multiplicative (ZMod 2)), i (actAA.toMulAction.toSMul.smul g a) = g • i a)
    (hi2 : ∀ a : Multiplicative (ZMod 2), (i a).toAdd = 2 * (a.toAdd.val : ZMod 4))
    (hA : ∀ g a : Multiplicative (ZMod 2), actAA.toMulAction.toSMul.smul g a = a)
    (hB : ∀ (g : Multiplicative (ZMod 2)) (b : Multiplicative (ZMod 4)),
      (g • b).toAdd = if g.toAdd = 0 then b.toAdd else -b.toAdd)
    (q : InvariantCosets i hG)
    (hq : q.val = (QuotientGroup.mk (Multiplicative.ofAdd (1 : ZMod 4)) :
      Multiplicative (ZMod 4) ⧸ i.range)) : connecting (G := Multiplicative (ZMod 2)) i hi hG q ≠ 1 := by sorry

/-- NC.3/central-extension (a): a `Z`-valued cocycle acts on `B`-valued ones by pointwise
multiplication when `Z` is central. -/
def Z1.centralSMul (i : A →* B) (hcentral : ∀ (a : A) (b : B), i a * b = b * i a)
    (hiG : ∀ (g : G) (a : A), i (g • a) = g • i a) (hi : Continuous i)
    (z : Z1 G A) (c : Z1 G B) : Z1 G B := ⟨fun g => i (z g) * c g, by sorry, by sorry⟩

/-- NC.3/central-extension (a): the fibres of `H¹(G, B) → H¹(G, C)` are the orbits of the
central action. -/
theorem H1.map_eq_map_iff_central (i : A →* B) (hi : Topology.IsClosedEmbedding i)
    (hcentral : ∀ (a : A) (b : B), i a * b = b * i a)
    (hiG : ∀ (g : G) (a : A), i (g • a) = g • i a)
    (π : B →* C) (hπ : Continuous π) (hπs : Function.Surjective π)
    (hπG : ∀ (g : G) (b : B), π (g • b) = g • π b) (hker : π.ker = i.range) (c c' : Z1 G B) :
    H1.map π hπ hπG (H1.mk c) = H1.map π hπ hπG (H1.mk c') ↔
      ∃ z : Z1 G A, H1.mk c' = H1.mk (Z1.centralSMul i hcentral hiG hi.continuous z c) := by sorry

-- NC.3/central-extension (b), (c): `H1.connecting₂` to `TauCeti.ContCohomology.H2 G (Additive A)`
--   given a continuous section of `π`, the equality of the image of `H1.map π` with the kernel of
--   `H1.connecting₂`, and freeness of the central action under vanishing twisted invariants:
--   not stated here; the first needs a `DistribMulAction G (Additive A)` instance, which Mathlib
--   does not provide at the pin.
-- The planned obstruction uses the positive defect c(g) * (g • c(h)) * c(g*h)⁻¹,
-- matching TauCeti.ContCohomology.d1 after writing the central coefficient additively.
-- Kim arXiv:math/0409456v1, printed p.5, uses its inverse as dc(g,h). Thus the planned
-- class is the negative of Kim's printed class; their zero fibres agree. This convention
-- must also be retained in the missing cochain-independence and connecting-map comparisons.

-- TauCeti.NonabelianCohomology.tests.central_defect_sign_C3_C9
-- For the trivial-action extension C3 -> C9 -> C3, use the least-residue lift s.
-- At (2,1) the positive defect is 3 in C9 and Kim's defect is 6. Under the
-- identification a -> 3*a of the central C3, these are 1 and -1, respectively.
-- This arithmetic discriminator does not type the missing continuous H² interface.
example :
    (let s : ZMod 3 → ZMod 9 := fun x => (x.val : ZMod 9)
     let D := s 2 + s 1 - s ((2 : ZMod 3) + 1)
     D = 3 ∧ -D = 6 ∧ D ≠ -D) := by decide

end ExactSequence

section Twisting
variable {G : Type u} [Group G] [TopologicalSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [IsTopologicalGroup U] [MulDistribMulAction G U]
  [ContinuousSMul G U]

/-- NC.3/twisting: the type synonym `₍c₎U`. -/
def Twist (_c : Z1 G U) : Type v := U

instance (c : Z1 G U) : Group (Twist c) := inferInstanceAs (Group U)
instance (c : Z1 G U) : TopologicalSpace (Twist c) := inferInstanceAs (TopologicalSpace U)
instance (c : Z1 G U) : IsTopologicalGroup (Twist c) := inferInstanceAs (IsTopologicalGroup U)

/-- The underlying identification is the native identity; twisting changes the action. -/
def Twist.toOriginal (c : Z1 G U) : Twist c ≃* U := MulEquiv.refl U

theorem Twist.toOriginal_apply (c : Z1 G U) (x : Twist c) :
    Twist.toOriginal c x = (show U from x) := by sorry

/-- The twisted action `g ⋆ u = c(g) · (g • u) · c(g)⁻¹`. -/
instance (c : Z1 G U) : MulDistribMulAction G (Twist c) := sorry
instance Twist.continuousSMul (c : Z1 G U) : ContinuousSMul G (Twist c) := sorry

theorem Twist.self (g : G) (x : U) :
    g • (show Twist (1 : Z1 G U) from x) = (show Twist (1 : Z1 G U) from g • x) := by sorry

theorem Twist.smul_def (c : Z1 G U) (g : G) (x : Twist c) :
    g • x = (show Twist c from c g * (g • (show U from x)) * (c g)⁻¹) := by sorry

/-- NC.3/twisting: `c' ↦ c' · c`. -/
def Z1.twistEquiv (c : Z1 G U) : Z1 G (Twist c) ≃ Z1 G U := sorry

def H1.twistEquiv (c : Z1 G U) : H1 G (Twist c) ≃ H1 G U := sorry

theorem H1.twistEquiv_one (c : Z1 G U) : H1.twistEquiv c 1 = H1.mk c := by sorry

-- TauCeti.NonabelianCohomology.tests.twist_trivial
example (d : Z1 G (Twist (1 : Z1 G U))) :
    (∀ (g : G) (x : U),
      g • (show Twist (1 : Z1 G U) from x) =
        (show Twist (1 : Z1 G U) from g • x)) ∧
    (∀ g, Z1.twistEquiv (1 : Z1 G U) d g = (show U from d g)) ∧
    H1.twistEquiv (1 : Z1 G U) (H1.mk d) =
      H1.mk (Z1.twistEquiv (1 : Z1 G U) d) := by sorry

end Twisting

section AbelianTwistingTest
variable {G : Type u} [Group G] [TopologicalSpace G]
  {U : Type v} [CommGroup U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]

-- TauCeti.NonabelianCohomology.tests.twist_abelian
example (c : Z1 G U) (d : Z1 G (Twist c)) :
    (∀ (g : G) (x : U),
      g • (show Twist c from x) = (show Twist c from g • x)) ∧
    (∀ g, Z1.twistEquiv c d g = (show U from d g) * c g) ∧
    H1.twistEquiv c (H1.mk d) = H1.mk (Z1.twistEquiv c d) := by sorry
end AbelianTwistingTest

section Torsor
variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  (U : Type v) [Group U] [TopologicalSpace U] [IsTopologicalGroup U] [MulDistribMulAction G U]
  [ContinuousSMul G U]

/-- NC.3/equivariant-topological-torsors: a nonempty `(G, U)`-torsor. -/
structure Torsor where
  carrier : Type (max u v)
  [top : TopologicalSpace carrier]
  [rightTorsor : _root_.Torsor Uᵐᵒᵖ carrier]
  [topologicalTorsor : IsTopologicalTorsor carrier]
  [leftAction : MulAction G carrier]
  continuous_left : Continuous fun p : G × carrier => p.1 • p.2
  compat : ∀ (g : G) (p : carrier) (x : U),
    g • ((MulOpposite.op x) • p) = (MulOpposite.op (g • x)) • (g • p)

attribute [instance] Torsor.top Torsor.rightTorsor Torsor.topologicalTorsor Torsor.leftAction

variable {G U}

/-- The cocycle of a point, `g • p = p · c_p(g)`. -/
def Torsor.cocycle (P : Torsor G U) (p : P.carrier) : Z1 G U := sorry

/-- The classification: isomorphism classes of torsors are in bijection with `H¹(G, U)`;
stated as the class map and its bijectivity on isomorphism classes. -/
def Torsor.classOf (P : Torsor G U) : H1 G U := sorry

theorem Torsor.classOf_eq_one_iff (P : Torsor G U) :
    P.classOf = 1 ↔ ∃ p : P.carrier, ∀ g : G, g • p = p := by sorry

theorem Torsor.classOf_surjective :
    Function.Surjective (Torsor.classOf : Torsor G U → H1 G U) := by sorry

/-- A torsor isomorphism is a homeomorphism respecting the right U-action and left G-action. -/
structure Torsor.Iso (P Q : Torsor G U) where
  toHomeomorph : P.carrier ≃ₜ Q.carrier
  map_right : ∀ (p : P.carrier) (x : U),
    toHomeomorph ((MulOpposite.op x) • p) = (MulOpposite.op x) • toHomeomorph p
  map_left : ∀ (g : G) (p : P.carrier), toHomeomorph (g • p) = g • toHomeomorph p

@[ext] theorem Torsor.Iso.ext {P Q : Torsor G U} (e f : P.Iso Q)
    (h : ∀ p, e.toHomeomorph p = f.toHomeomorph p) : e = f := by sorry

def Torsor.Iso.refl (P : Torsor G U) : P.Iso P := sorry

def Torsor.Iso.symm {P Q : Torsor G U} (e : P.Iso Q) : Q.Iso P := sorry

def Torsor.Iso.trans {P Q R : Torsor G U} (e : P.Iso Q) (f : Q.Iso R) : P.Iso R := sorry

def Torsor.orbitHomeomorph (P : Torsor G U) (p : P.carrier) : U ≃ₜ P.carrier :=
  (MulOpposite.opHomeomorph : U ≃ₜ Uᵐᵒᵖ).trans (Homeomorph.smulConst p)

theorem Torsor.orbitHomeomorph_apply (P : Torsor G U) (p : P.carrier) (x : U) :
    P.orbitHomeomorph p x = (MulOpposite.op x) • p := by sorry

def Torsor.ofCocycle (c : Z1 G U) : Torsor G U := sorry

/-- A model coordinate, avoiding universe-unsafe identification of carriers. -/
def Torsor.ofCocycleHomeomorph (c : Z1 G U) : U ≃ₜ (Torsor.ofCocycle c).carrier := sorry

theorem Torsor.ofCocycleHomeomorph_right (c : Z1 G U) (x y : U) :
    Torsor.ofCocycleHomeomorph c (x * y) =
      (MulOpposite.op y) • Torsor.ofCocycleHomeomorph c x := by sorry

theorem Torsor.ofCocycleHomeomorph_left (c : Z1 G U) (g : G) (x : U) :
    g • Torsor.ofCocycleHomeomorph c x =
      Torsor.ofCocycleHomeomorph c (c g * (g • x)) := by sorry

theorem Torsor.cocycle_ofCocycle (c : Z1 G U) :
    (Torsor.ofCocycle c).cocycle (Torsor.ofCocycleHomeomorph c 1) = c := by sorry

theorem Torsor.cocycle_spec (P : Torsor G U) (p : P.carrier) (g : G) :
    g • p = (MulOpposite.op (P.cocycle p g)) • p := by sorry

theorem Torsor.cocycle_change_point (P : Torsor G U) (p : P.carrier) (x : U) :
    P.cocycle ((MulOpposite.op x) • p) = x⁻¹ • P.cocycle p := by sorry

theorem Torsor.cocycle_map_iso {P Q : Torsor G U} (e : P.Iso Q) (p : P.carrier) :
    Q.cocycle (e.toHomeomorph p) = P.cocycle p := by sorry

theorem Torsor.classOf_eq_mk_cocycle (P : Torsor G U) (p : P.carrier) :
    P.classOf = H1.mk (P.cocycle p) := by sorry

theorem Torsor.classOf_ofCocycle (c : Z1 G U) :
    (Torsor.ofCocycle c).classOf = H1.mk c := by sorry

/-- Injectivity on isomorphism classes, the missing half of the classification. -/
theorem Torsor.classOf_eq_classOf_iff (P Q : Torsor G U) :
    P.classOf = Q.classOf ↔ Nonempty (P.Iso Q) := by sorry

/-- The relation is concrete: existence of an equivariant homeomorphism. -/
def Torsor.isoSetoid (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (U : Type v) [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
    [MulDistribMulAction G U] [ContinuousSMul G U] : Setoid (Torsor G U) where
  r P Q := Nonempty (P.Iso Q)
  iseqv := by sorry

def Torsor.classification : Quotient (Torsor.isoSetoid G U) ≃ H1 G U := sorry

theorem Torsor.classification_mk (P : Torsor G U) :
    Torsor.classification (Quotient.mk (Torsor.isoSetoid G U) P) = P.classOf := by sorry

-- TauCeti.NonabelianCohomology.tests.torsor_orbit_at_identity
example (P : Torsor G U) (p : P.carrier) : P.orbitHomeomorph p 1 = p := by sorry

-- TauCeti.NonabelianCohomology.tests.torsor_coboundary_isomorphic
example (x : U) :
    Nonempty ((Torsor.ofCocycle (Z1.coboundary (G := G) x)).Iso
      (Torsor.ofCocycle (1 : Z1 G U))) := by sorry

-- TauCeti.NonabelianCohomology.tests.torsor_gauge_isomorphic
example (c : Z1 G U) (x : U) :
    Nonempty ((Torsor.ofCocycle (x • c)).Iso (Torsor.ofCocycle c)) := by sorry

-- TauCeti.NonabelianCohomology.tests.torsor_nonneutral_no_fixed_point
example (c : Z1 G U) (hc : H1.mk c ≠ (1 : H1 G U)) :
    ¬ ∃ p : (Torsor.ofCocycle c).carrier, ∀ g : G, g • p = p := by sorry

-- TauCeti.NonabelianCohomology.tests.torsor_inequivalent_not_isomorphic
example (c d : Z1 G U) (hcd : H1.mk c ≠ H1.mk d) :
    ¬ Nonempty ((Torsor.ofCocycle c).Iso (Torsor.ofCocycle d)) := by sorry

end Torsor

/-! ## Unit tests -/

-- TauCeti.NonabelianCohomology.tests.trivial_group
example [TopologicalSpace (Multiplicative (ZMod 1))]
    (U : Type) [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
    [MulDistribMulAction (Multiplicative (ZMod 1)) U]
    [ContinuousSMul (Multiplicative (ZMod 1)) U] :
    Subsingleton (Z1 (Multiplicative (ZMod 1)) U) := by sorry

-- The actual cocycle factor-order test appears in CanonicalDescentTests below.

section FiniteCoreTests
variable [TopologicalSpace (Multiplicative (ZMod 2))]
  [DiscreteTopology (Multiplicative (ZMod 2))]
  [TopologicalSpace (Equiv.Perm (Fin 3))] [DiscreteTopology (Equiv.Perm (Fin 3))]
  [MulDistribMulAction (Multiplicative (ZMod 2)) (Equiv.Perm (Fin 3))]
  [ContinuousSMul (Multiplicative (ZMod 2)) (Equiv.Perm (Fin 3))]
  (htriv : ∀ (g : Multiplicative (ZMod 2)) (x : Equiv.Perm (Fin 3)), g • x = x)

include htriv

-- TauCeti.NonabelianCohomology.tests.trivial_action_hom
example : Nat.card (Z1 (Multiplicative (ZMod 2)) (Equiv.Perm (Fin 3))) = 4 := by
  sorry

-- TauCeti.NonabelianCohomology.tests.h1_S3
example : Nat.card (H1 (Multiplicative (ZMod 2)) (Equiv.Perm (Fin 3))) = 2 := by
  sorry

-- TauCeti.NonabelianCohomology.tests.not_coboundary_quotient
example :
    (∀ c c' : Z1 (Multiplicative (ZMod 2)) (Equiv.Perm (Fin 3)),
      (∃ x : Equiv.Perm (Fin 3), ∀ g, c' g = c g * x * (g • x)⁻¹) ↔ c' = c) ∧
    Nat.card (Z1 (Multiplicative (ZMod 2)) (Equiv.Perm (Fin 3))) = 4 ∧
    Nat.card (H1 (Multiplicative (ZMod 2)) (Equiv.Perm (Fin 3))) = 2 := by
  sorry

-- TauCeti.NonabelianCohomology.tests.twist_S3
example (c : Z1 (Multiplicative (ZMod 2)) (Equiv.Perm (Fin 3)))
    (hc : c (Multiplicative.ofAdd (1 : ZMod 2)) = Equiv.swap (0 : Fin 3) 1) :
    (∀ x : Twist c, Multiplicative.ofAdd (1 : ZMod 2) • x =
      (show Twist c from Equiv.swap (0 : Fin 3) 1 *
        (show Equiv.Perm (Fin 3) from x) * (Equiv.swap (0 : Fin 3) 1)⁻¹)) ∧
    Nat.card (H0 (Multiplicative (ZMod 2)) (Twist c)) = 2 := by sorry

-- TauCeti.NonabelianCohomology.tests.twist_changes_invariants
example (c : Z1 (Multiplicative (ZMod 2)) (Equiv.Perm (Fin 3)))
    (hc : c (Multiplicative.ofAdd (1 : ZMod 2)) = Equiv.swap (0 : Fin 3) 1) :
    Nat.card (H0 (Multiplicative (ZMod 2)) (Twist c)) = 2 ∧
    Nat.card (H0 (Multiplicative (ZMod 2)) (Equiv.Perm (Fin 3))) = 6 ∧
    H1.twistEquiv c 1 ≠ (1 : H1 (Multiplicative (ZMod 2)) (Equiv.Perm (Fin 3))) := by sorry

end FiniteCoreTests

section InvariantsIntegerTests
variable [MulDistribMulAction (Multiplicative (ZMod 2)) (Multiplicative ℤ)]

-- TauCeti.NonabelianCohomology.tests.invariants (negation action)
example (hneg : ∀ (g : Multiplicative (ZMod 2)) (x : Multiplicative ℤ),
    (g • x).toAdd = if g.toAdd = 0 then x.toAdd else -x.toAdd) :
    H0 (Multiplicative (ZMod 2)) (Multiplicative ℤ) = ⊥ := by sorry

-- TauCeti.NonabelianCohomology.tests.invariants (trivial action)
example (htriv : ∀ (g : Multiplicative (ZMod 2)) (x : Multiplicative ℤ), g • x = x) :
    H0 (Multiplicative (ZMod 2)) (Multiplicative ℤ) = ⊤ := by sorry
end InvariantsIntegerTests

section ContinuityCoreTest
variable [TopologicalSpace (Multiplicative (ZMod 2))]
  [DiscreteTopology (Multiplicative (ZMod 2))]
  [MulDistribMulAction (ℕ → Multiplicative (ZMod 2)) (Multiplicative (ZMod 2))]
  (htriv : ∀ (g : ℕ → Multiplicative (ZMod 2)) (x : Multiplicative (ZMod 2)), g • x = x)
include htriv

-- TauCeti.NonabelianCohomology.tests.continuity
example : Countable (Z1 (ℕ → Multiplicative (ZMod 2)) (Multiplicative (ZMod 2))) ∧
    ¬ Countable ((ℕ → Multiplicative (ZMod 2)) →* Multiplicative (ZMod 2)) := by sorry
end ContinuityCoreTest

section FiniteAbelianCoreTest
variable [TopologicalSpace (Multiplicative (ZMod 2))]
  [DiscreteTopology (Multiplicative (ZMod 2))]
  [TopologicalSpace (Multiplicative (ZMod 3))]
  [DiscreteTopology (Multiplicative (ZMod 3))]
  [MulDistribMulAction (Multiplicative (ZMod 2)) (Multiplicative (ZMod 3))]
  [ContinuousSMul (Multiplicative (ZMod 2)) (Multiplicative (ZMod 3))]
  (hneg : ∀ (g : Multiplicative (ZMod 2)) (x : Multiplicative (ZMod 3)),
    (g • x).toAdd = if g.toAdd = 0 then x.toAdd else -x.toAdd)
include hneg

-- TauCeti.NonabelianCohomology.tests.h1_abelian
example : Subsingleton (H1 (Multiplicative (ZMod 2)) (Multiplicative (ZMod 3))) := by sorry
end FiniteAbelianCoreTest

namespace Z1
variable {G : Type u} [Group G] [TopologicalSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]

-- node: NC.3/cocycle-one-fibre
/-- A subgroup, not the kernel of a group homomorphism in general. -/
def oneFibre (c : Z1 G U) : Subgroup G := by sorry

lemma mem_oneFibre (c : Z1 G U) (g : G) : g ∈ c.oneFibre ↔ c g = 1 := by sorry

lemma oneFibre_eq_ker (c : Z1 G U) (f : G →* U) (hf : ∀ g, c g = f g) :
    c.oneFibre = f.ker := by sorry

-- node: NC.3/cocycle-one-fibre-clopen
lemma oneFibre_isClopen [DiscreteTopology U] (c : Z1 G U) :
    IsClopen (c.oneFibre : Set G) := by sorry

-- node: NC.3/discrete-normal-killing
lemma exists_openNormal_killing [IsTopologicalGroup G] [CompactSpace G]
    [DiscreteTopology U] (c : Z1 G U) :
    ∃ N : OpenNormalSubgroup G, ∀ n ∈ N, c n = 1 := by sorry

-- node: NC.3/cocycle-right-cosets
lemma mul_right_eq_of_trivial (c : Z1 G U) (N : Subgroup G)
    (hc : ∀ n ∈ N, c n = 1) (g n : G) (hn : n ∈ N) : c (g * n) = c g := by sorry

-- node: NC.3/cocycle-left-cosets
lemma mul_left_eq_of_trivial (c : Z1 G U) (N : Subgroup G) [N.Normal]
    (hc : ∀ n ∈ N, c n = 1) (g n : G) (hn : n ∈ N) : c (n * g) = c g := by sorry

-- node: NC.3/cocycle-values-fixed
lemma values_fixed_of_trivial (c : Z1 G U) (N : Subgroup G) [N.Normal]
    (hc : ∀ n ∈ N, c n = 1) (g n : G) (hn : n ∈ N) : n • c g = c g := by sorry

-- node: NC.3/gauge-witness-fixed
lemma gauge_witness_fixed (c d : Z1 G U) (N : Subgroup G)
    (hc : ∀ n ∈ N, c n = 1) (hd : ∀ n ∈ N, d n = 1) (x : U)
    (h : ∀ g, d g = x * c g * (g • x)⁻¹) :
    ∀ n ∈ N, n • x = x := by sorry

-- node: NC.3/finite-family-normal-killing
lemma exists_openNormal_killing_family [IsTopologicalGroup G] [CompactSpace G]
    {ι : Type w} [Finite ι] (V : ι → Type v) [∀ i, Group (V i)]
    [∀ i, TopologicalSpace (V i)] [∀ i, DiscreteTopology (V i)]
    [∀ i, MulDistribMulAction G (V i)] (c : ∀ i, Z1 G (V i)) :
    ∃ N : OpenNormalSubgroup G, ∀ i n, n ∈ N → c i n = 1 := by sorry
end Z1

namespace Z1
variable {G : Type u} [Group G] [TopologicalSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]

-- node: NC.3/cocycle-values-invariants
lemma values_mem_fixedPoints (c : Z1 G U) (N : Subgroup G) [N.Normal]
    (hc : ∀ n ∈ N, c n = 1) (g : G) : c g ∈ FixedPoints.subgroup N U := by sorry

lemma oneFibre_eq_top (c : Z1 G U) (hc : ∀ g, c g = 1) : c.oneFibre = ⊤ := by sorry

-- test: TauCeti.NonabelianCohomology.Z1.oneFibre.test_trivial
example : (1 : Z1 G U).oneFibre = ⊤ := by sorry

-- test: TauCeti.NonabelianCohomology.Z1.oneFibre.test_native_kernel
example (f : G →* U) (hf : Continuous f) (htriv : ∀ (g : G) (x : U), g • x = x) :
    oneFibre (⟨f, hf, by intro g h; rw [f.map_mul, htriv]⟩ : Z1 G U) = f.ker := by sorry

-- test: TauCeti.NonabelianCohomology.Z1.oneFibre.test_nonnormal
example [TopologicalSpace (ConjAct (Equiv.Perm (Fin 3)))]
    [TopologicalSpace (Equiv.Perm (Fin 3))]
    (c : Z1 (ConjAct (Equiv.Perm (Fin 3))) (Equiv.Perm (Fin 3)))
    (hc : ∀ g, c g = Equiv.swap (0 : Fin 3) 1 *
      (g • Equiv.swap (0 : Fin 3) 1)⁻¹) : ¬ c.oneFibre.Normal := by sorry

-- test: TauCeti.NonabelianCohomology.Z1.exists_openNormal_killing_family.test_empty
example [IsTopologicalGroup G] [CompactSpace G] :
    ∃ N : OpenNormalSubgroup G, ∀ _i : Fin 0, ∀ n : G, n ∈ N → True := by sorry

-- test: TauCeti.NonabelianCohomology.Z1.values_mem_fixedPoints.test_top_trivial
example (g : G) : (1 : Z1 G U) g ∈ FixedPoints.subgroup (⊤ : Subgroup G) U := by sorry

-- test: TauCeti.NonabelianCohomology.Z1.gauge_witness_fixed.test_full_subgroup
example (x : U) (h : ∀ g : G, (1 : U) = x * (g • x)⁻¹) :
    x ∈ FixedPoints.subgroup G U := by sorry
end Z1

namespace Z1
variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [DiscreteTopology U] [MulDistribMulAction G U]

-- test: TauCeti.NonabelianCohomology.Z1.exists_openNormal_killing.test_finite_quotient
example (N : OpenNormalSubgroup G) : Finite (G ⧸ N.toSubgroup) := by sorry

-- test: TauCeti.NonabelianCohomology.Z1.exists_openNormal_killing_family.test_single
example (c : Z1 G U) : ∃ N : OpenNormalSubgroup G, ∀ n ∈ N, c n = 1 := by sorry
end Z1

namespace Z1
variable {G : Type u} [Group G] [TopologicalSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]
  (N : Subgroup G) [N.Normal]

def descend (c : Z1 G U) (hc : ∀ n ∈ N, c n = 1) :
    Z1 (G ⧸ N) (FixedPoints.subgroup N U) := by sorry

lemma descend_apply (c : Z1 G U) (hc : ∀ n ∈ N, c n = 1) (g : G) :
    (descend N c hc (QuotientGroup.mk g)).val = c g := by sorry

lemma descend_unique (c : Z1 G U) (hc : ∀ n ∈ N, c n = 1)
    (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U))
    (hd : ∀ g : G, (d (QuotientGroup.mk g)).val = c g) : d = descend N c hc := by sorry

def inflate (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) : Z1 G U := by sorry

lemma inflate_apply (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) (g : G) :
    inflate N d g = (d (QuotientGroup.mk g)).val := by sorry

lemma inflate_trivialOn (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U))
    (n : G) (hn : n ∈ N) : inflate N d n = 1 := by sorry

lemma inflate_descend (c : Z1 G U) (hc : ∀ n ∈ N, c n = 1) :
    inflate N (descend N c hc) = c := by sorry

lemma descend_inflate (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    descend N (inflate N d) (inflate_trivialOn N d) = d := by sorry

lemma descend_one (hc : ∀ n ∈ N, (1 : Z1 G U) n = 1) :
    descend N (1 : Z1 G U) hc = 1 := by sorry

lemma inflate_one : inflate N (1 : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) = 1 := by sorry

def descendEquiv :
    {c : Z1 G U // ∀ n ∈ N, c n = 1} ≃ Z1 (G ⧸ N) (FixedPoints.subgroup N U) := by sorry

lemma descendEquiv_apply (c : {c : Z1 G U // ∀ n ∈ N, c n = 1}) :
    descendEquiv N c = descend N c.val c.property := by sorry

lemma descendEquiv_symm_apply (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    ((descendEquiv N).symm d).val = inflate N d := by sorry

lemma descend_proof_independent (c : Z1 G U) (hc hc' : ∀ n ∈ N, c n = 1) :
    descend N c hc = descend N c hc' := by sorry

lemma descend_gauge_iff (c d : Z1 G U) (hc : ∀ n ∈ N, c n = 1)
    (hd : ∀ n ∈ N, d n = 1) :
    (∃ x : U, ∀ g, d g = x * c g * (g • x)⁻¹) ↔
      ∃ x : FixedPoints.subgroup N U, ∀ q : G ⧸ N,
        descend N d hd q = x * descend N c hc q * (q • x)⁻¹ := by sorry

lemma inflate_injective : Function.Injective (inflate N : Z1 (G ⧸ N) (FixedPoints.subgroup N U) → Z1 G U) := by sorry

lemma descendEquiv_left_inv (c : {c : Z1 G U // ∀ n ∈ N, c n = 1}) :
    (descendEquiv N).symm (descendEquiv N c) = c := by sorry

lemma descendEquiv_right_inv (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    descendEquiv N ((descendEquiv N).symm d) = d := by sorry

lemma descendEquiv_one (hc : ∀ n ∈ N, (1 : Z1 G U) n = 1) :
    descendEquiv N ⟨1,hc⟩ = 1 := by sorry

end Z1

namespace Z1
variable {G : Type u} [Group G] [TopologicalSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]
  (N : Subgroup G) [N.Normal]

-- test: TauCeti.NonabelianCohomology.Z1.descend.test_one
example (hc : ∀ n ∈ N, (1 : Z1 G U) n = 1) :
    descend N (1 : Z1 G U) hc = 1 := by sorry

-- test: TauCeti.NonabelianCohomology.Z1.descend.test_representative
example (c : Z1 G U) (hc : ∀ n ∈ N, c n = 1) (g n : G) (hn : n ∈ N) :
    descend N c hc (QuotientGroup.mk (g * n)) = descend N c hc (QuotientGroup.mk g) := by sorry

-- test: TauCeti.NonabelianCohomology.Z1.descend.test_proper_invariants
example :
    Equiv.swap (0 : Fin 3) 1 ∉
      FixedPoints.subgroup (⊤ : Subgroup (ConjAct (Equiv.Perm (Fin 3))))
        (Equiv.Perm (Fin 3)) := by sorry

-- test: TauCeti.NonabelianCohomology.Z1.inflate.test_one
example : inflate N (1 : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) = 1 := by sorry

-- test: TauCeti.NonabelianCohomology.Z1.inflate.test_native_projection
example (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) (g : G) :
    inflate N d g = (d (QuotientGroup.mk g)).val := by sorry

-- test: TauCeti.NonabelianCohomology.Z1.inflate.test_subgroup
example (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) (n : G) (hn : n ∈ N) :
    inflate N d n = 1 := by sorry

-- test: TauCeti.NonabelianCohomology.Z1.descendEquiv.test_left_inverse
example (c : {c : Z1 G U // ∀ n ∈ N, c n = 1}) :
    (descendEquiv N).symm (descendEquiv N c) = c := by sorry

-- test: TauCeti.NonabelianCohomology.Z1.descendEquiv.test_right_inverse
example (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    descendEquiv N ((descendEquiv N).symm d) = d := by sorry

-- test: TauCeti.NonabelianCohomology.Z1.descendEquiv.test_proof_irrelevance
example (c : Z1 G U) (hc hc' : ∀ n ∈ N, c n = 1) :
    descendEquiv N ⟨c,hc⟩ = descendEquiv N ⟨c,hc'⟩ := by sorry

end Z1

section QuotientH1
variable {G : Type u} [Group G] [TopologicalSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]
  [IsTopologicalGroup U] [ContinuousSMul G U]
  (N : Subgroup G) [N.Normal]
  [ContinuousSMul (G ⧸ N) (FixedPoints.subgroup N U)]

lemma Z1.inflate_smul (x : FixedPoints.subgroup N U)
    (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    Z1.inflate N (x • d) = x.val • Z1.inflate N d := by sorry

lemma Z1.inflate_gauge_iff (d e : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    (∃ x : U, x • Z1.inflate N d = Z1.inflate N e) ↔
      ∃ x : FixedPoints.subgroup N U, x • d = e := by sorry

namespace H1

def inflate : H1 (G ⧸ N) (FixedPoints.subgroup N U) → H1 G U := by sorry

lemma inflate_mk (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    inflate N (mk d) = mk (Z1.inflate N d) := by sorry

lemma inflate_one : inflate N (1 : H1 (G ⧸ N) (FixedPoints.subgroup N U)) = 1 := by sorry

lemma inflate_injective :
    Function.Injective (inflate N : H1 (G ⧸ N) (FixedPoints.subgroup N U) → H1 G U) := by sorry

lemma inflate_eq_one_iff (a : H1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    inflate N a = 1 ↔ a = 1 := by sorry

end H1
-- test: TauCeti.NonabelianCohomology.H1.inflate.test_one
example : H1.inflate N (1 : H1 (G ⧸ N) (FixedPoints.subgroup N U)) = 1 := by sorry

-- test: TauCeti.NonabelianCohomology.H1.inflate.test_gauge
example (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) (x : FixedPoints.subgroup N U) :
    H1.inflate N (H1.mk (x • d)) = H1.inflate N (H1.mk d) := by sorry

-- test: TauCeti.NonabelianCohomology.H1.inflate.test_neutral_reflection
example (a : H1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    H1.inflate N a = 1 ↔ a = 1 := by sorry

end QuotientH1

-- test: TauCeti.NonabelianCohomology.H1.inflate.test_nonabelian_transposition
example :
    let G := Equiv.Perm (Fin 2)
    let U := Equiv.Perm (Fin 3)
    letI : TopologicalSpace G := ⊥
    letI : TopologicalSpace U := ⊥
    letI : DiscreteTopology G := ⟨rfl⟩
    letI : DiscreteTopology U := ⟨rfl⟩
    letI : IsTopologicalGroup U := inferInstance
    letI : MulDistribMulAction G U := {
      smul := fun _ x => x
      one_smul := fun _ => rfl
      mul_smul := fun _ _ _ => rfl
      smul_one := fun _ => rfl
      smul_mul := fun _ _ _ => rfl }
    letI : ContinuousSMul G U := ⟨continuous_snd⟩
    let N : Subgroup G := ⊥
    letI : ContinuousSMul (G ⧸ N) (FixedPoints.subgroup N U) :=
      ⟨continuous_of_discreteTopology⟩
    let c : Z1 G U := ⟨fun g => if g = 1 then 1 else Equiv.swap 0 1,
      continuous_of_discreteTopology, by sorry⟩
    let d := Z1.descend N c (by sorry)
    H1.inflate N (H1.mk d) ≠ 1 := by sorry

end TauCeti.NonabelianCohomology

open CategoryTheory AlgebraicGeometry

-- TauCeti.EtaleKPiOne.native.smallEtaleTopology
example (X : Scheme) : GrothendieckTopology X.Etale := X.smallEtaleTopology

-- TauCeti.EtaleKPiOne.native.locallyNoetherian
example (X : Scheme) [IsLocallyNoetherian X] : IsLocallyNoetherian X := inferInstance

-- TauCeti.EtaleKPiOne.native.finiteEtaleFiber
example (R Ω : Type) [CommRing R] [Field Ω] [Algebra R Ω] :
    (CommAlgCat.FiniteEtale R)ᵒᵖ ⥤ FintypeCat := CommAlgCat.FiniteEtale.fiber R Ω

-- TauCeti.EtaleKPiOne.native.allDegreeContinuousCohomology
example (k G : Type) [Ring k] [TopologicalSpace k] [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] (A : TopRep k G) (n : ℕ) :
    TopModuleCat k := continuousCohomology n A

noncomputable section
open CategoryTheory Rep
universe u
variable {k G : Type u} [CommRing k] [Group G] {H : Subgroup G} (A : Rep k H) (n : ℕ)
example : groupCohomology (coind H.subtype A) n ≅ groupCohomology A n := by sorry
example : (groupCohomology.coindIso A n).hom ≫ (groupCohomology.coindIso A n).inv = 𝟙 _ := by sorry
example : (groupCohomology.coindIso A n).inv ≫ (groupCohomology.coindIso A n).hom = 𝟙 _ := by sorry

noncomputable section
namespace TauCeti.EtaleKPiOne.ArithmeticSmoke
example (p : ℕ) [Fact p.Prime] : IsSimpleAddGroup (ZMod p) := by sorry
example (p : ℕ) [NeZero p] : Fintype.card (ZMod p) = p := by sorry
example (p : ℕ) (x : ZMod p) : (p : ZMod p) * x = 0 := by sorry
example (n : ℕ) : addOrderOf (1 : ZMod n) = n := by sorry
example (d n : ℕ) (h : Nat.Coprime d n) :
    (ZMod.unitOfCoprime d h : ZMod n) *
      ((ZMod.unitOfCoprime d h)⁻¹ : (ZMod n)ˣ) = 1 := by sorry
example (d n : ℕ) (h : Nat.Coprime d n) :
    Function.Bijective (fun x : ZMod n => (d : ZMod n) * x) := by sorry
example : (3 : ZMod 9) * 1 ≠ 0 := by sorry
example (x : ZMod 9) : (9 : ZMod 9) * x = 0 := by sorry
example (x : ZMod 3) : (4 : ZMod 3) * x = x := by sorry
example : (2 : ZMod 3) * 1 ≠ 0 := by sorry
example (x : ZMod 1) : x = 0 := by sorry
example (a : ℕ) : ((3 ^ a : ℕ) : ZMod (3 ^ a)) = 0 := by sorry
end TauCeti.EtaleKPiOne.ArithmeticSmoke

noncomputable section
namespace TauCeti.EtaleKPiOne.ProductSmoke
variable {G H : Type*} [Group G] [Group H]

example (K : Subgroup (G × H)) (A : Subgroup G) (B : Subgroup H) :
    A.prod B ≤ K ↔ A ≤ K.comap (MonoidHom.inl G H) ∧
      B ≤ K.comap (MonoidHom.inr G H) := by sorry

example (K : Subgroup (G × H)) :
    (K.comap (MonoidHom.inl G H)).prod (K.comap (MonoidHom.inr G H)) ≤ K := by sorry

example [TopologicalSpace G] [TopologicalSpace H] (K : OpenSubgroup (G × H)) :
    ∃ (A : OpenSubgroup G) (B : OpenSubgroup H), A.prod B ≤ K := by sorry

example [TopologicalSpace G] [TopologicalSpace H]
    [CompactSpace G] [CompactSpace H] [SeparatelyContinuousMul G] [SeparatelyContinuousMul H]
    (K : OpenSubgroup (G × H)) :
    ∃ (A : OpenSubgroup G) (B : OpenSubgroup H), A.prod B ≤ K ∧
      Finite (G ⧸ A.toSubgroup) ∧ Finite (H ⧸ B.toSubgroup) := by sorry

example :
    let C := Multiplicative (ZMod 2)
    let D := (MonoidHom.fst C C).eqLocus (MonoidHom.snd C C)
    Nat.card ((C × C) ⧸ D) = 2 ∧
      (D.comap (MonoidHom.inl C C)).prod (D.comap (MonoidHom.inr C C)) = ⊥ ∧
      Nat.card ((C × C) ⧸ (⊥ : Subgroup (C × C))) = 4 := by sorry

example :
    let S := Equiv.Perm (Fin 3)
    let D := (MonoidHom.fst S S).eqLocus (MonoidHom.snd S S)
    ¬ D.Normal ∧ Finite ((S × S) ⧸ D) := by sorry

-- Coordinates (0,2), (1,1), (2,0) of total degree two.
example :
    let killHigher := (![0, 1, 0] : Fin 3 → ZMod 2)
    (fun j : Fin 3 => killHigher j * (![0, 1, 0] : Fin 3 → ZMod 2) j) =
      (![0, 1, 0] : Fin 3 → ZMod 2) ∧
      (![0, 1, 0] : Fin 3 → ZMod 2) ≠ 0 := by sorry

example :
    (∀ a b : ZMod 4, 2 * a = 0 → 2 * b = 0 → a * b = 0) ∧
      (2 : ZMod 4) ≠ 0 ∧ 2 * (2 : ZMod 4) = 0 := by sorry

-- Killing every positive-degree factor removes every summand of positive total degree.
example (q i j : ℕ) (hq : 0 < q) (hij : i + j = q) :
    0 < i ∨ 0 < j := by sorry

-- A genuine bilinear map, with no cohomology carrier introduced.
example (p : ℕ) (B : (ZMod p) →ₗ[ZMod p] (ZMod p) →ₗ[ZMod p] (ZMod p))
    (x : ZMod p) : B 0 x = 0 ∧ B x 0 = 0 := by sorry

-- Arithmetic groups are fibre products over the base group.
example : Fintype.card {z : ZMod 2 × ZMod 2 // z.1 = z.2} = 2 ∧
    Fintype.card (ZMod 2 × ZMod 2) = 4 := by sorry

end TauCeti.EtaleKPiOne.ProductSmoke

/-! Actual subgroup restriction and neutral-fibre signatures. All new bodies are admitted. -/
namespace TauCeti.NonabelianCohomology

section Restriction
variable {G : Type u} [Group G] [TopologicalSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]
  (N : Subgroup G)

namespace Z1
def restrict (c : Z1 G U) : Z1 N U := by sorry

lemma restrict_apply (c : Z1 G U) (n : N) : restrict N c n = c n.val := by sorry

lemma restrict_one : restrict N (1 : Z1 G U) = 1 := by sorry

variable [IsTopologicalGroup U] [ContinuousSMul G U]

lemma restrict_smul (x : U) (c : Z1 G U) :
    restrict N (x • c) = x • restrict N c := by sorry

lemma normalize_trivialOn (c : Z1 G U) (x : U)
    (hx : ∀ n : N, c n.val = x * (n.val • x)⁻¹) :
    ∀ n ∈ N, (x⁻¹ • c) n = 1 := by sorry

end Z1

variable [IsTopologicalGroup U] [ContinuousSMul G U]

namespace H1
lemma mk_smul (x : U) (c : Z1 G U) : mk (x • c) = mk c := by sorry

def restrict : H1 G U → H1 N U := by sorry

lemma restrict_mk (c : Z1 G U) : restrict N (mk c) = mk (Z1.restrict N c) := by sorry

lemma restrict_one : restrict N (1 : H1 G U) = 1 := by sorry

lemma restrict_mk_eq_one_iff (c : Z1 G U) :
    restrict N (mk c) = 1 ↔ ∃ x : U, ∀ n : N, c n.val = x * (n.val • x)⁻¹ := by sorry

end H1
end Restriction

section Exactness
variable {G : Type u} [Group G] [TopologicalSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]
  (N : Subgroup G) [N.Normal]

lemma Z1.restrict_inflate (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    Z1.restrict N (Z1.inflate N d) = 1 := by sorry

variable [IsTopologicalGroup U] [ContinuousSMul G U]
  [ContinuousSMul (G ⧸ N) (FixedPoints.subgroup N U)]

namespace H1
lemma restrict_inflate (a : H1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    restrict N (inflate N a) = 1 := by sorry

theorem mem_range_inflate_iff_restrict_eq_one (a : H1 G U) :
    a ∈ Set.range (inflate N) ↔ restrict N a = 1 := by sorry

theorem existsUnique_inflate_of_restrict_eq_one (a : H1 G U) (ha : restrict N a = 1) :
    ∃! b : H1 (G ⧸ N) (FixedPoints.subgroup N U), inflate N b = a := by sorry

end H1
end Exactness

section RestrictionTests
variable {G : Type u} [Group G] [TopologicalSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]
  (N : Subgroup G)

-- test: TauCeti.NonabelianCohomology.Z1.restrict.test_one
example : Z1.restrict N (1 : Z1 G U) = 1 := by sorry

-- test: TauCeti.NonabelianCohomology.Z1.restrict.test_subgroup_value
example (c : Z1 G U) (n : N) : Z1.restrict N c n = c n.val := by sorry

-- test: TauCeti.NonabelianCohomology.Z1.restrict.test_bottom
example (c : Z1 G U) : Z1.restrict (⊥ : Subgroup G) c = 1 := by sorry

variable [IsTopologicalGroup U] [ContinuousSMul G U]
-- test: TauCeti.NonabelianCohomology.H1.restrict.test_one
example : H1.restrict N (1 : H1 G U) = 1 := by sorry

-- test: TauCeti.NonabelianCohomology.H1.restrict.test_gauge
example (x : U) (c : Z1 G U) : H1.restrict N (H1.mk (x • c)) = H1.restrict N (H1.mk c) := by sorry

-- test: TauCeti.NonabelianCohomology.H1.restrict.test_bottom
example (a : H1 G U) : H1.restrict (⊥ : Subgroup G) a = 1 := by sorry

-- test: TauCeti.NonabelianCohomology.H1.restrict.test_top_detects
example (a : H1 G U) : H1.restrict (⊤ : Subgroup G) a = 1 ↔ a = 1 := by sorry

end RestrictionTests

-- An order-three gauge witness distinguishes x from x⁻¹.
-- test: TauCeti.NonabelianCohomology.Z1.normalize_trivialOn.test_inverse_gauge
example :
    let U := Equiv.Perm (Fin 3)
    let G := ConjAct U
    letI : TopologicalSpace U := ⊥
    letI : TopologicalSpace G := ⊥
    letI : DiscreteTopology U := ⟨rfl⟩
    letI : DiscreteTopology G := ⟨rfl⟩
    letI : IsTopologicalGroup U := inferInstance
    letI : ContinuousSMul G U := ⟨continuous_of_discreteTopology⟩
    let x : U := Equiv.swap 0 1 * Equiv.swap 1 2
    let c : Z1 G U := x • 1
    (x⁻¹ • c = 1) ∧ (x • c ≠ 1) := by sorry

-- test: TauCeti.NonabelianCohomology.H1.restrict.test_neutral_not_pointwise
example :
    let U := Equiv.Perm (Fin 3)
    let G := ConjAct U
    letI : TopologicalSpace U := ⊥
    letI : TopologicalSpace G := ⊥
    letI : DiscreteTopology U := ⟨rfl⟩
    letI : DiscreteTopology G := ⟨rfl⟩
    letI : IsTopologicalGroup U := inferInstance
    letI : ContinuousSMul G U := ⟨continuous_of_discreteTopology⟩
    let x : U := Equiv.swap 0 1 * Equiv.swap 1 2
    let c : Z1 G U := x • 1
    H1.restrict (⊤ : Subgroup G) (H1.mk c) = 1 ∧
      Z1.restrict (⊤ : Subgroup G) c ≠ 1 := by sorry

end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology

section QuotientActionContinuity
variable {G : Type u} [Group G] [TopologicalSpace G] [SeparatelyContinuousMul G]
  {U : Type v} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]
  [ContinuousSMul G U]

-- AnabelianGeometryAndNonabelianChabauty:NC.3/quotient-fixed-action-continuity
lemma quotientFixedContinuousSMul (N : Subgroup G) [N.Normal] :
    ContinuousSMul (G ⧸ N) (FixedPoints.subgroup N U) := by sorry

end QuotientActionContinuity

section NeutralEquivalence
variable {G : Type u} [Group G] [TopologicalSpace G] [SeparatelyContinuousMul G]
  {U : Type v} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
  (N : Subgroup G) [N.Normal]

attribute [local instance] quotientFixedContinuousSMul

-- The existing H1.inflate_one signature above is promoted unchanged
-- to AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation-one.
-- AnabelianGeometryAndNonabelianChabauty:NC.3/h1-inflation-neutral-equivalence
def H1.inflateNeutralEquiv :
    H1 (G ⧸ N) (FixedPoints.subgroup N U) ≃
      {a : H1 G U // H1.restrict N a = 1} := by sorry

lemma H1.inflateNeutralEquiv_apply
    (a : H1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    (inflateNeutralEquiv N a).val = inflate N a := by sorry

lemma H1.inflateNeutralEquiv_symm_inflate
    (a : H1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    (inflateNeutralEquiv N).symm ⟨inflate N a, restrict_inflate N a⟩ = a := by sorry

lemma H1.inflateNeutralEquiv_apply_symm
    (a : {a : H1 G U // H1.restrict N a = 1}) :
    inflate N ((inflateNeutralEquiv N).symm a) = a.val := by sorry

lemma H1.inflateNeutralEquiv_one :
    inflateNeutralEquiv N (1 : H1 (G ⧸ N) (FixedPoints.subgroup N U)) =
      ⟨1, restrict_one N⟩ := by sorry

-- TauCeti.NonabelianCohomology.quotientFixedContinuousSMul.test_joint
example : Continuous (fun p : (G ⧸ N) × FixedPoints.subgroup N U => p.1 • p.2) := by sorry

-- TauCeti.NonabelianCohomology.H1.inflateNeutralEquiv.test_one
example : H1.inflateNeutralEquiv N (1 : H1 (G ⧸ N) (FixedPoints.subgroup N U)) =
    ⟨1, H1.restrict_one N⟩ := by sorry

-- TauCeti.NonabelianCohomology.H1.inflateNeutralEquiv.test_representative
example (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    (H1.inflateNeutralEquiv N (H1.mk d)).val = H1.mk (Z1.inflate N d) := by sorry

-- TauCeti.NonabelianCohomology.H1.inflateNeutralEquiv.test_target_round_trip
example (a : H1 G U) (ha : H1.restrict N a = 1) :
    H1.inflate N ((H1.inflateNeutralEquiv N).symm ⟨a, ha⟩) = a := by sorry

-- TauCeti.NonabelianCohomology.H1.inflateNeutralEquiv.test_nonneutral
example (a : H1 (G ⧸ N) (FixedPoints.subgroup N U)) (ha : a ≠ 1) :
    (H1.inflateNeutralEquiv N a).val ≠ 1 := by sorry

-- TauCeti.NonabelianCohomology.H1.inflateNeutralEquiv.test_gauge_neutral
example (x : U) :
    (H1.inflateNeutralEquiv N).symm
      ⟨H1.mk (x • (1 : Z1 G U)), by
        rw [H1.mk_smul]
        exact H1.restrict_one N⟩ = 1 := by sorry

end NeutralEquivalence
end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section Transitions
variable {G : Type u} [Group G] [TopologicalSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]
  {M N P : Subgroup G} [M.Normal] [N.Normal] [P.Normal]

/-- Reverse-inclusion transition: descend the same inflated cocycle to the smaller subgroup. -/
def Z1.transition (h : M ≤ N) (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    Z1 (G ⧸ M) (FixedPoints.subgroup M U) := by sorry

lemma Z1.transition_apply (h : M ≤ N)
    (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) (g : G) :
    (Z1.transition h d (QuotientGroup.mk g)).val = (d (QuotientGroup.mk g)).val := by sorry

lemma Z1.inflate_transition (h : M ≤ N)
    (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    Z1.inflate M (Z1.transition h d) = Z1.inflate N d := by sorry

lemma Z1.transition_refl (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    Z1.transition (le_refl N) d = d := by sorry

lemma Z1.transition_trans (h : M ≤ N) (k : P ≤ M)
    (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    Z1.transition k (Z1.transition h d) = Z1.transition (k.trans h) d := by sorry

lemma Z1.transition_one (h : M ≤ N) :
    Z1.transition h (1 : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) = 1 := by sorry

lemma Z1.transition_injective (h : M ≤ N) :
    Function.Injective (Z1.transition (U := U) h) := by sorry

variable [IsTopologicalGroup U] [ContinuousSMul G U]
  [ContinuousSMul (G ⧸ M) (FixedPoints.subgroup M U)]
  [ContinuousSMul (G ⧸ N) (FixedPoints.subgroup N U)]
  [ContinuousSMul (G ⧸ P) (FixedPoints.subgroup P U)]

/-- Transitions on the actual native gauge-orbit pointed sets. -/
def H1.transition (h : M ≤ N) :
    H1 (G ⧸ N) (FixedPoints.subgroup N U) → H1 (G ⧸ M) (FixedPoints.subgroup M U) := by sorry

lemma H1.transition_mk (h : M ≤ N) (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    H1.transition h (H1.mk d) = H1.mk (Z1.transition h d) := by sorry

lemma H1.inflate_transition (h : M ≤ N) (a : H1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    H1.inflate M (H1.transition h a) = H1.inflate N a := by sorry

lemma H1.transition_refl (a : H1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    H1.transition (le_refl N) a = a := by sorry

lemma H1.transition_trans (h : M ≤ N) (k : P ≤ M)
    (a : H1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    H1.transition k (H1.transition h a) = H1.transition (k.trans h) a := by sorry

lemma H1.transition_one (h : M ≤ N) :
    H1.transition h (1 : H1 (G ⧸ N) (FixedPoints.subgroup N U)) = 1 := by sorry

lemma H1.transition_injective (h : M ≤ N) :
    Function.Injective (H1.transition (U := U) h) := by sorry

end Transitions
end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
open CategoryTheory CategoryTheory.Limits
section QuotientDiagram
variable (G : Type u) [Group G] [TopologicalSpace G] [SeparatelyContinuousMul G]
  (U : Type v) [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
attribute [local instance] quotientFixedContinuousSMul

/-- Actual quotient cohomology, indexed by reverse inclusion of open normal subgroups. -/
def H1.quotientDiagram (G : Type u) [Group G] [TopologicalSpace G] [SeparatelyContinuousMul G]
    (U : Type v) [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
    [MulDistribMulAction G U] [ContinuousSMul G U] : OrderDual (OpenNormalSubgroup G) ⥤ Type (max u v) where
  obj N := H1 (G ⧸ (OrderDual.ofDual N).toSubgroup) (FixedPoints.subgroup (OrderDual.ofDual N).toSubgroup U)
  map {M N} f := ↾(H1.transition (M := (OrderDual.ofDual N).toSubgroup) (N := (OrderDual.ofDual M).toSubgroup) (show _ ≤ _ from leOfHom f))
  map_id := by sorry
  map_comp := by sorry

/-- The native inflation maps form a cocone of pointed sets in the category of types. -/
def H1.inflationCocone : Cocone (H1.quotientDiagram G U) where
  pt := H1 G U
  ι := {
    app N := ↾(H1.inflate (OrderDual.ofDual N).toSubgroup)
    naturality := by sorry }

lemma H1.quotientDiagram_map_apply {M N : OrderDual (OpenNormalSubgroup G)}
    (f : M ⟶ N) (a : (H1.quotientDiagram G U).obj M) :
    (H1.quotientDiagram G U).map f a = H1.transition (M := (OrderDual.ofDual N).toSubgroup) (N := (OrderDual.ofDual M).toSubgroup) (show _ ≤ _ from leOfHom f) a := by sorry

lemma H1.inflationCocone_app (N : OrderDual (OpenNormalSubgroup G))
    (a : (H1.quotientDiagram G U).obj N) :
    (H1.inflationCocone G U).ι.app N a = H1.inflate (OrderDual.ofDual N).toSubgroup a := by sorry

lemma H1.quotientDiagram_obj (N : OrderDual (OpenNormalSubgroup G)) :
    (H1.quotientDiagram G U).obj N =
      H1 (G ⧸ (OrderDual.ofDual N).toSubgroup) (FixedPoints.subgroup (OrderDual.ofDual N).toSubgroup U) := by sorry

lemma H1.quotientDiagram_map_id (N : OrderDual (OpenNormalSubgroup G))
    (a : (H1.quotientDiagram G U).obj N) :
    (H1.quotientDiagram G U).map (𝟙 N) a = a := by sorry

lemma H1.inflationCocone_pt : (H1.inflationCocone G U).pt = H1 G U := by sorry

lemma H1.inflationCocone_naturality {M N : OrderDual (OpenNormalSubgroup G)}
    (f : M ⟶ N) (a : (H1.quotientDiagram G U).obj M) :
    (H1.inflationCocone G U).ι.app N ((H1.quotientDiagram G U).map f a) =
      (H1.inflationCocone G U).ι.app M a := by sorry

end QuotientDiagram

section CompactDiscreteColimit
variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  (U : Type v) [Group U] [TopologicalSpace U] [DiscreteTopology U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
attribute [local instance] quotientFixedContinuousSMul

/-- Every class is inflated from a genuinely descended cocycle on an open normal quotient. -/
theorem H1.exists_quotient_class (a : H1 G U) :
    ∃ (N : OpenNormalSubgroup G) (b : H1 (G ⧸ N.toSubgroup) (FixedPoints.subgroup N.toSubgroup U)),
      H1.inflate N.toSubgroup b = a := by sorry

/-- Inflation realizes the native filtered colimit, with equality detected on intersections. -/
noncomputable def H1.inflationCoconeIsColimit : IsColimit (H1.inflationCocone G U) := by sorry

omit [IsTopologicalGroup G] [CompactSpace G] in
/-- The indexing category is filtered: intersections refine any two subgroups. -/
theorem H1.quotientIndex_isFiltered : IsFiltered (OrderDual (OpenNormalSubgroup G)) := by sorry

/-- The chosen native colimit is identified with H¹ by inflation. -/
noncomputable def H1.finiteQuotientColimitEquiv :
    colimit (H1.quotientDiagram G U) ≃ H1 G U := by sorry

lemma H1.finiteQuotientColimitEquiv_ι (N : OrderDual (OpenNormalSubgroup G))
    (a : (H1.quotientDiagram G U).obj N) :
    H1.finiteQuotientColimitEquiv G U (colimit.ι (H1.quotientDiagram G U) N a) =
      H1.inflate (OrderDual.ofDual N).toSubgroup a := by sorry

lemma H1.finiteQuotientColimitEquiv_symm_inflate (N : OrderDual (OpenNormalSubgroup G))
    (a : (H1.quotientDiagram G U).obj N) :
    (H1.finiteQuotientColimitEquiv G U).symm (H1.inflate (OrderDual.ofDual N).toSubgroup a) =
      colimit.ι (H1.quotientDiagram G U) N a := by sorry

lemma H1.finiteQuotientColimitEquiv_one (N : OrderDual (OpenNormalSubgroup G)) :
    H1.finiteQuotientColimitEquiv G U (colimit.ι (H1.quotientDiagram G U) N (1 : H1 (G ⧸ (OrderDual.ofDual N).toSubgroup) (FixedPoints.subgroup (OrderDual.ofDual N).toSubgroup U))) = 1 := by sorry

end CompactDiscreteColimit
end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
open CategoryTheory CategoryTheory.Limits
section TransitionTests
variable {G : Type u} [Group G] [TopologicalSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]
  {M N : Subgroup G} [M.Normal] [N.Normal]

-- test: TauCeti.NonabelianCohomology.Z1.transition.test_one
example (h : M ≤ N) : Z1.transition h (1 : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) = 1 := by sorry

-- test: TauCeti.NonabelianCohomology.Z1.transition.test_value
example (h : M ≤ N) (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) (g : G) :
    (Z1.transition h d (QuotientGroup.mk g)).val = (d (QuotientGroup.mk g)).val := by sorry

-- test: TauCeti.NonabelianCohomology.Z1.transition.test_identity
example (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U)) :
    Z1.transition (le_refl N) d = d := by sorry

variable [IsTopologicalGroup U] [ContinuousSMul G U]
  [ContinuousSMul (G ⧸ M) (FixedPoints.subgroup M U)]
  [ContinuousSMul (G ⧸ N) (FixedPoints.subgroup N U)]
-- test: TauCeti.NonabelianCohomology.H1.transition.test_one
example (h : M ≤ N) : H1.transition h (1 : H1 (G ⧸ N) (FixedPoints.subgroup N U)) = 1 := by sorry

-- test: TauCeti.NonabelianCohomology.H1.transition.test_gauge
example (h : M ≤ N) (d : Z1 (G ⧸ N) (FixedPoints.subgroup N U))
    (x : FixedPoints.subgroup N U) :
    H1.transition h (H1.mk (x • d)) = H1.mk (Z1.transition h d) := by sorry

-- test: TauCeti.NonabelianCohomology.H1.transition.test_nonneutral
example (h : M ≤ N) (a : H1 (G ⧸ N) (FixedPoints.subgroup N U)) (ha : a ≠ 1) :
    H1.transition h a ≠ 1 := by sorry

end TransitionTests

section DiagramTests
variable (G : Type u) [Group G] [TopologicalSpace G] [SeparatelyContinuousMul G]
  (U : Type v) [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
attribute [local instance] quotientFixedContinuousSMul
-- test: TauCeti.NonabelianCohomology.H1.quotientDiagram.test_identity
example (N : OrderDual (OpenNormalSubgroup G)) (a : (H1.quotientDiagram G U).obj N) :
    (H1.quotientDiagram G U).map (𝟙 N) a = a := by sorry

-- test: TauCeti.NonabelianCohomology.H1.quotientDiagram.test_composition
example {M N P : OrderDual (OpenNormalSubgroup G)} (f : M ⟶ N) (g : N ⟶ P)
    (a : (H1.quotientDiagram G U).obj M) :
    (H1.quotientDiagram G U).map (f ≫ g) a =
      (H1.quotientDiagram G U).map g ((H1.quotientDiagram G U).map f a) := by sorry

-- test: TauCeti.NonabelianCohomology.H1.quotientDiagram.test_coefficients
example (N : OrderDual (OpenNormalSubgroup G)) :
    (H1.quotientDiagram G U).obj N =
      H1 (G ⧸ (OrderDual.ofDual N).toSubgroup) (FixedPoints.subgroup (OrderDual.ofDual N).toSubgroup U) := by sorry

-- test: TauCeti.NonabelianCohomology.H1.inflationCocone.test_representative
example (N : OrderDual (OpenNormalSubgroup G))
    (d : Z1 (G ⧸ (OrderDual.ofDual N).toSubgroup) (FixedPoints.subgroup (OrderDual.ofDual N).toSubgroup U)) :
    (H1.inflationCocone G U).ι.app N (H1.mk d) = H1.mk (Z1.inflate (OrderDual.ofDual N).toSubgroup d) := by sorry

-- test: TauCeti.NonabelianCohomology.H1.inflationCocone.test_one
example (N : OrderDual (OpenNormalSubgroup G)) :
    (H1.inflationCocone G U).ι.app N
      (1 : H1 (G ⧸ (OrderDual.ofDual N).toSubgroup) (FixedPoints.subgroup (OrderDual.ofDual N).toSubgroup U)) = (1 : H1 G U) := by sorry

-- test: TauCeti.NonabelianCohomology.H1.inflationCocone.test_commutes
example {M N : OrderDual (OpenNormalSubgroup G)} (f : M ⟶ N)
    (a : (H1.quotientDiagram G U).obj M) :
    (H1.inflationCocone G U).ι.app N ((H1.quotientDiagram G U).map f a) =
      (H1.inflationCocone G U).ι.app M a := by sorry

end DiagramTests

section ColimitTests
variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  (U : Type v) [Group U] [TopologicalSpace U] [DiscreteTopology U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
attribute [local instance] quotientFixedContinuousSMul
-- test: TauCeti.NonabelianCohomology.H1.finiteQuotientColimitEquiv.test_target_round_trip
example (a : H1 G U) :
    H1.finiteQuotientColimitEquiv G U ((H1.finiteQuotientColimitEquiv G U).symm a) = a := by sorry

-- test: TauCeti.NonabelianCohomology.H1.finiteQuotientColimitEquiv.test_one
example (N : OrderDual (OpenNormalSubgroup G)) :
    H1.finiteQuotientColimitEquiv G U (colimit.ι (H1.quotientDiagram G U) N
      (1 : H1 (G ⧸ (OrderDual.ofDual N).toSubgroup) (FixedPoints.subgroup (OrderDual.ofDual N).toSubgroup U))) = 1 := by sorry

-- test: TauCeti.NonabelianCohomology.H1.finiteQuotientColimitEquiv.test_inflated_inverse
example (N : OrderDual (OpenNormalSubgroup G)) (a : (H1.quotientDiagram G U).obj N) :
    (H1.finiteQuotientColimitEquiv G U).symm (H1.inflate (OrderDual.ofDual N).toSubgroup a) =
      colimit.ι (H1.quotientDiagram G U) N a := by sorry

-- test: TauCeti.NonabelianCohomology.H1.finiteQuotientColimitEquiv.test_nonneutral
example (N : OrderDual (OpenNormalSubgroup G))
    (a : H1 (G ⧸ (OrderDual.ofDual N).toSubgroup) (FixedPoints.subgroup (OrderDual.ofDual N).toSubgroup U))
    (ha : a ≠ 1) :
    H1.finiteQuotientColimitEquiv G U (colimit.ι (H1.quotientDiagram G U) N a) ≠ 1 := by sorry

end ColimitTests
-- test: TauCeti.NonabelianCohomology.H1.finiteQuotientColimitEquiv.test_transposition
example :
    let G := Equiv.Perm (Fin 2)
    let U := Equiv.Perm (Fin 3)
    letI : TopologicalSpace G := ⊥
    letI : TopologicalSpace U := ⊥
    letI : DiscreteTopology G := ⟨rfl⟩
    letI : DiscreteTopology U := ⟨rfl⟩
    letI : IsTopologicalGroup U := inferInstance
    letI : MulDistribMulAction G U := {
      smul := fun _ x => x
      one_smul := fun _ => rfl
      mul_smul := fun _ _ _ => rfl
      smul_one := fun _ => rfl
      smul_mul := fun _ _ _ => rfl }
    letI : ContinuousSMul G U := ⟨continuous_snd⟩
    let c : Z1 G U := ⟨fun g => if g = 1 then 1 else Equiv.swap 0 1,
      continuous_of_discreteTopology, by decide⟩
    (H1.finiteQuotientColimitEquiv G U).symm (H1.mk c) ≠
      (H1.finiteQuotientColimitEquiv G U).symm 1 := by sorry

end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section CoefficientMaps
variable {G : Type u} [Group G] [TopologicalSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]
  {U' : Type w} [Group U'] [TopologicalSpace U'] [MulDistribMulAction G U']
  {U'' : Type*} [Group U''] [TopologicalSpace U''] [MulDistribMulAction G U'']

lemma Z1.map_apply (f : U →* U') (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (c : Z1 G U) (g : G) :
    Z1.map f hf hG c g = f (c g) := by
  sorry

lemma Z1.map_trivial (f : U →* U') (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    Z1.map f hf hG (1 : Z1 G U) = 1 := by
  sorry

lemma Z1.map_id : Z1.map (MonoidHom.id U) continuous_id (fun (_ : G) _ => rfl) = id := by
  sorry

lemma Z1.map_comp (f : U →* U') (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (f' : U' →* U'') (hf' : Continuous f')
    (hG' : ∀ (g : G) (x : U'), f' (g • x) = g • f' x) :
    Z1.map (f'.comp f) (hf'.comp hf) (fun g x => by rw [MonoidHom.comp_apply, hG, hG']; rfl) =
      Z1.map f' hf' hG' ∘ Z1.map f hf hG := by
  sorry

variable [IsTopologicalGroup U] [ContinuousSMul G U]
  [IsTopologicalGroup U'] [ContinuousSMul G U']
  [IsTopologicalGroup U''] [ContinuousSMul G U'']

lemma Z1.map_smul (f : U →* U') (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (x : U) (c : Z1 G U) :
    Z1.map f hf hG (x • c) = f x • Z1.map f hf hG c := by
  sorry

lemma H1.map_comp (f : U →* U') (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (f' : U' →* U'') (hf' : Continuous f')
    (hG' : ∀ (g : G) (x : U'), f' (g • x) = g • f' x) :
    H1.map (f'.comp f) (hf'.comp hf) (fun g x => by rw [MonoidHom.comp_apply, hG, hG']; rfl) =
      H1.map f' hf' hG' ∘ H1.map f hf hG := by
  sorry

end CoefficientMaps
section InvariantCoefficientMaps
variable {G : Type u} [Group G]
  {U : Type v} [Group U] [MulDistribMulAction G U]
  {U' : Type w} [Group U'] [MulDistribMulAction G U']
  {U'' : Type*} [Group U''] [MulDistribMulAction G U'']

lemma H0.map_apply (f : U →* U') (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (x : H0 G U) :
    (H0.map f hG x).val = f x := by
  sorry

lemma H0.map_id : H0.map (MonoidHom.id U) (fun (_ : G) _ => rfl) = MonoidHom.id (H0 G U) := by
  sorry

lemma H0.map_comp (f : U →* U') (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (f' : U' →* U'') (hG' : ∀ (g : G) (x : U'), f' (g • x) = g • f' x) :
    H0.map (f'.comp f) (fun g x => by rw [MonoidHom.comp_apply, hG, hG']; rfl) =
      (H0.map f' hG').comp (H0.map f hG) := by
  sorry

end InvariantCoefficientMaps
end TauCeti.NonabelianCohomology
namespace TauCeti.NonabelianCohomology
section CoefficientTests
variable {G : Type u} [Group G] [TopologicalSpace G]
  {U : Type v} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]
  [IsTopologicalGroup U] [ContinuousSMul G U]
  {U' : Type w} [Group U'] [TopologicalSpace U'] [MulDistribMulAction G U']
  [IsTopologicalGroup U'] [ContinuousSMul G U']
-- test: coefficientCocyclesTests.identity
example (c : Z1 G U) : Z1.map (MonoidHom.id U) continuous_id (fun (_ : G) _ => rfl) c = c := by
  sorry

-- test: coefficientCocyclesTests.constant
example (c : Z1 G U) :
    Z1.map (1 : U →* U') continuous_const
      (fun g x => by simp only [MonoidHom.one_apply, smul_one]) c = 1 := by
  sorry

-- test: coefficientCocyclesTests.value
example (f : U →* U') (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (c : Z1 G U) (g : G) :
    Z1.map f hf hG c g = f (c g) := by
  sorry

-- test: coefficientClassesTests.identity
example (a : H1 G U) : H1.map (MonoidHom.id U) continuous_id (fun (_ : G) _ => rfl) a = a := by
  sorry

-- test: coefficientClassesTests.gauge
example (f : U →* U') (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (c : Z1 G U) (x : U) :
    H1.map f hf hG (H1.mk (x • c)) = H1.mk (Z1.map f hf hG c) := by
  sorry

-- test: coefficientClassesTests.one
example (f : U →* U') (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) : H1.map f hf hG 1 = 1 := by
  sorry

end CoefficientTests
section InvariantTests
variable {G : Type u} [Group G]
  {U : Type v} [Group U] [MulDistribMulAction G U]
  {U' : Type w} [Group U'] [MulDistribMulAction G U']
-- test: invariantCoefficientsTests.identity
example (x : H0 G U) : H0.map (MonoidHom.id U) (fun (_ : G) _ => rfl) x = x := by
  sorry

-- test: invariantCoefficientsTests.constant
example (x : H0 G U) :
    H0.map (1 : U →* U') (fun g x => by simp only [MonoidHom.one_apply, smul_one]) x = 1 := by
  sorry

-- test: invariantCoefficientsTests.value
example (f : U →* U') (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (x : H0 G U) :
    (H0.map f hG x).val = f x := by
  sorry

end InvariantTests
-- test: coefficientClassesTests.noninjective
example :
    let G := Equiv.Perm (Fin 2)
    let U := Equiv.Perm (Fin 3)
    letI : TopologicalSpace G := ⊥
    letI : TopologicalSpace U := ⊥
    letI : DiscreteTopology G := ⟨rfl⟩
    letI : DiscreteTopology U := ⟨rfl⟩
    letI : IsTopologicalGroup U := inferInstance
    letI : MulDistribMulAction G U := {
      smul := fun _ x => x
      one_smul := fun _ => rfl
      mul_smul := fun _ _ _ => rfl
      smul_one := fun _ => rfl
      smul_mul := fun _ _ _ => rfl }
    letI : ContinuousSMul G U := ⟨continuous_snd⟩
    let c : Z1 G U := ⟨fun g => if g = 1 then 1 else Equiv.swap 0 1,
      continuous_of_discreteTopology, by decide⟩
    H1.mk c ≠ 1 ∧
      H1.map (1 : U →* U) continuous_const (fun _ _ => rfl) (H1.mk c) = 1 := by
  sorry

-- test: coefficientCocyclesTests.transposition
example :
    let G := Equiv.Perm (Fin 2)
    let U := Equiv.Perm (Fin 3)
    letI : TopologicalSpace G := ⊥
    letI : TopologicalSpace U := ⊥
    letI : DiscreteTopology G := ⟨rfl⟩
    letI : DiscreteTopology U := ⟨rfl⟩
    letI : IsTopologicalGroup U := inferInstance
    letI : MulDistribMulAction G U := {
      smul := fun _ x => x
      one_smul := fun _ => rfl
      mul_smul := fun _ _ _ => rfl
      smul_one := fun _ => rfl
      smul_mul := fun _ _ _ => rfl }
    letI : ContinuousSMul G U := ⟨continuous_snd⟩
    let c : Z1 G U := ⟨fun g => if g = 1 then 1 else Equiv.swap 0 1,
      continuous_of_discreteTopology, by decide⟩
    Z1.map (MonoidHom.id U) continuous_id (fun (_ : G) _ => rfl) c
      (Equiv.swap (0 : Fin 2) 1) = Equiv.swap (0 : Fin 3) 1 := by
  sorry

-- test: invariantCoefficientsTests.transposition
example :
    let G := Equiv.Perm (Fin 2)
    let U := Equiv.Perm (Fin 3)
    letI : TopologicalSpace G := ⊥
    letI : TopologicalSpace U := ⊥
    letI : DiscreteTopology G := ⟨rfl⟩
    letI : DiscreteTopology U := ⟨rfl⟩
    letI : IsTopologicalGroup U := inferInstance
    letI : MulDistribMulAction G U := {
      smul := fun _ x => x
      one_smul := fun _ => rfl
      mul_smul := fun _ _ _ => rfl
      smul_one := fun _ => rfl
      smul_mul := fun _ _ _ => rfl }
    letI : ContinuousSMul G U := ⟨continuous_snd⟩
    (H0.map (MonoidHom.id U) (fun (_ : G) _ => rfl)
      ⟨Equiv.swap (0 : Fin 3) 1, fun _ => rfl⟩).val = Equiv.swap (0 : Fin 3) 1 := by
  sorry

end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section SourceRestriction
variable {G : Type*} [Group G] [TopologicalSpace G]
  {H : Type*} [Group H] [TopologicalSpace H]
  {K : Type*} [Group K] [TopologicalSpace K]
  {U : Type*} [Group U] [TopologicalSpace U]
  [MulDistribMulAction G U] [MulDistribMulAction H U] [MulDistribMulAction K U]

def Z1.res (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) : Z1 G U → Z1 H U := by
  sorry
lemma Z1.res_apply (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) (h : H) :
    Z1.res φ hφ hact c h = c (φ h) := by
  sorry
lemma Z1.res_one (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) :
    Z1.res φ hφ hact (1 : Z1 G U) = 1 := by
  sorry
lemma Z1.res_id : Z1.res (MonoidHom.id G) continuous_id (fun _ _ => rfl) =
    (id : Z1 G U → Z1 G U) := by
  sorry
lemma Z1.res_comp (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x)
    (ψ : K →* H) (hψ : Continuous ψ)
    (hact' : ∀ (k : K) (x : U), k • x = ψ k • x) :
    Z1.res (φ.comp ψ) (hφ.comp hψ) (fun k x => (hact' k x).trans (hact (ψ k) x)) =
      Z1.res ψ hψ hact' ∘ Z1.res φ hφ hact := by
  sorry
lemma Z1.res_injective (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x)
    (hsur : Function.Surjective φ) : Function.Injective (Z1.res φ hφ hact) := by
  sorry
lemma Z1.res_subgroup (N : Subgroup G) :
    Z1.res N.subtype continuous_subtype_val (fun _ _ => rfl) =
      (Z1.restrict N : Z1 G U → Z1 N U) := by
  sorry

variable [IsTopologicalGroup U] [ContinuousSMul G U] [ContinuousSMul H U]
  [ContinuousSMul K U]

lemma Z1.res_smul (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (x : U) (c : Z1 G U) :
    Z1.res φ hφ hact (x • c) = x • Z1.res φ hφ hact c := by
  sorry
def H1.res (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) : H1 G U → H1 H U := by
  sorry
lemma H1.res_mk (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) :
    H1.res φ hφ hact (H1.mk c) = H1.mk (Z1.res φ hφ hact c) := by
  sorry
lemma H1.res_one (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) :
    H1.res φ hφ hact (1 : H1 G U) = 1 := by
  sorry
lemma H1.res_id : H1.res (MonoidHom.id G) continuous_id (fun _ _ => rfl) =
    (id : H1 G U → H1 G U) := by
  sorry
lemma H1.res_comp (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x)
    (ψ : K →* H) (hψ : Continuous ψ)
    (hact' : ∀ (k : K) (x : U), k • x = ψ k • x) :
    H1.res (φ.comp ψ) (hφ.comp hψ) (fun k x => (hact' k x).trans (hact (ψ k) x)) =
      H1.res ψ hψ hact' ∘ H1.res φ hφ hact := by
  sorry
lemma H1.res_injective (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x)
    (hsur : Function.Surjective φ) : Function.Injective (H1.res φ hφ hact) := by
  sorry
lemma H1.res_subgroup (N : Subgroup G) :
    H1.res N.subtype continuous_subtype_val (fun _ _ => rfl) =
      (H1.restrict N : H1 G U → H1 N U) := by
  sorry

end SourceRestriction

section SourceCoefficientCompatibility
variable {G : Type*} [Group G] [TopologicalSpace G]
  {H : Type*} [Group H] [TopologicalSpace H]
  {U : Type*} [Group U] [TopologicalSpace U]
  [MulDistribMulAction G U] [MulDistribMulAction H U]
  {V : Type*} [Group V] [TopologicalSpace V]
  [MulDistribMulAction G V] [MulDistribMulAction H V]

lemma Z1.res_map (φ : H →* G) (hφ : Continuous φ)
    (hU : ∀ (h : H) (x : U), h • x = φ h • x)
    (hV : ∀ (h : H) (x : V), h • x = φ h • x)
    (f : U →* V) (hf : Continuous f)
    (heq : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    Z1.res φ hφ hV ∘ Z1.map f hf heq =
      Z1.map f hf (fun h x => by rw [hU, heq, hV]) ∘ Z1.res φ hφ hU := by
  sorry

variable [IsTopologicalGroup U] [ContinuousSMul G U] [ContinuousSMul H U]
  [IsTopologicalGroup V] [ContinuousSMul G V] [ContinuousSMul H V]

lemma H1.res_map (φ : H →* G) (hφ : Continuous φ)
    (hU : ∀ (h : H) (x : U), h • x = φ h • x)
    (hV : ∀ (h : H) (x : V), h • x = φ h • x)
    (f : U →* V) (hf : Continuous f)
    (heq : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    H1.res φ hφ hV ∘ H1.map f hf heq =
      H1.map f hf (fun h x => by rw [hU, heq, hV]) ∘ H1.res φ hφ hU := by
  sorry

end SourceCoefficientCompatibility

section SourceInvariants
variable {G : Type*} [Group G] {H : Type*} [Group H] {K : Type*} [Group K]
  {U : Type*} [Group U]
  [MulDistribMulAction G U] [MulDistribMulAction H U] [MulDistribMulAction K U]

def H0.res (φ : H →* G)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) : H0 G U →* H0 H U := by
  sorry
lemma H0.res_apply (φ : H →* G)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (x : H0 G U) :
    (H0.res φ hact x : U) = x := by
  sorry
lemma H0.res_id : H0.res (MonoidHom.id G) (fun _ _ => rfl) =
    MonoidHom.id (H0 G U) := by
  sorry
lemma H0.res_comp (φ : H →* G)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x)
    (ψ : K →* H) (hact' : ∀ (k : K) (x : U), k • x = ψ k • x) :
    H0.res (φ.comp ψ) (fun k x => (hact' k x).trans (hact (ψ k) x)) =
      (H0.res ψ hact').comp (H0.res φ hact) := by
  sorry
lemma H0.res_injective (φ : H →* G)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) :
    Function.Injective (H0.res φ hact) := by
  sorry

variable {V : Type*} [Group V] [MulDistribMulAction G V] [MulDistribMulAction H V]
lemma H0.res_map (φ : H →* G)
    (hU : ∀ (h : H) (x : U), h • x = φ h • x)
    (hV : ∀ (h : H) (x : V), h • x = φ h • x)
    (f : U →* V) (heq : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (H0.res φ hV).comp (H0.map f heq) =
      (H0.map f (fun h x => by rw [hU, heq, hV])).comp (H0.res φ hU) := by
  sorry

end SourceInvariants
end TauCeti.NonabelianCohomology
namespace TauCeti.NonabelianCohomology
section SourceRestrictionTests
variable {G : Type*} [Group G] [TopologicalSpace G]
  {H : Type*} [Group H] [TopologicalSpace H]
  {U : Type*} [Group U] [TopologicalSpace U]
  [MulDistribMulAction G U] [MulDistribMulAction H U]
-- test: sourceCocyclesTests.value
example (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) (h : H) :
    Z1.res φ hφ hact c h = c (φ h) := by
  sorry

-- test: sourceCocyclesTests.identity
example (c : Z1 G U) : Z1.res (MonoidHom.id G) continuous_id (fun _ _ => rfl) c = c := by
  sorry

-- test: sourceCocyclesTests.constantSource
example (hact : ∀ (h : H) (x : U), h • x = (1 : H →* G) h • x) (c : Z1 G U) :
    Z1.res (1 : H →* G) continuous_const hact c = 1 := by
  sorry

-- test: sourceCocyclesTests.subgroup
example (N : Subgroup G) (c : Z1 G U) :
    Z1.res N.subtype continuous_subtype_val (fun _ _ => rfl) c = Z1.restrict N c := by
  sorry

variable [IsTopologicalGroup U] [ContinuousSMul G U] [ContinuousSMul H U]
-- test: sourceClassesTests.one
example (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) :
    H1.res φ hφ hact (1 : H1 G U) = 1 := by
  sorry

-- test: sourceClassesTests.gauge
example (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) (x : U) :
    H1.res φ hφ hact (H1.mk (x • c)) = H1.mk (Z1.res φ hφ hact c) := by
  sorry

-- test: sourceClassesTests.subgroup
example (N : Subgroup G) (a : H1 G U) :
    H1.res N.subtype continuous_subtype_val (fun _ _ => rfl) a = H1.restrict N a := by
  sorry

-- test: sourceClassesTests.surjectiveReflection
example (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x)
    (hsur : Function.Surjective φ) (a : H1 G U) :
    H1.res φ hφ hact a = 1 ↔ a = 1 := by
  sorry

end SourceRestrictionTests
section SourceInvariantTests
variable {G : Type*} [Group G] {H : Type*} [Group H]
  {U : Type*} [Group U] [MulDistribMulAction G U] [MulDistribMulAction H U]
-- test: sourceInvariantsTests.one
example (φ : H →* G) (hact : ∀ (h : H) (x : U), h • x = φ h • x) :
    H0.res φ hact (1 : H0 G U) = 1 := by
  sorry

-- test: sourceInvariantsTests.identity
example (x : H0 G U) : H0.res (MonoidHom.id G) (fun _ _ => rfl) x = x := by
  sorry

-- test: sourceInvariantsTests.value
example (φ : H →* G) (hact : ∀ (h : H) (x : U), h • x = φ h • x) (x : H0 G U) :
    (H0.res φ hact x : U) = x := by
  sorry

end SourceInvariantTests
end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
-- test: sourceClassesTests.noninjective
example :
    let G := Equiv.Perm (Fin 2)
    let U := Equiv.Perm (Fin 3)
    letI : TopologicalSpace G := ⊥
    letI : TopologicalSpace U := ⊥
    letI : DiscreteTopology G := ⟨rfl⟩
    letI : DiscreteTopology U := ⟨rfl⟩
    letI : IsTopologicalGroup U := inferInstance
    letI : MulDistribMulAction G U := {
      smul := fun _ x => x
      one_smul := fun _ => rfl
      mul_smul := fun _ _ _ => rfl
      smul_one := fun _ => rfl
      smul_mul := fun _ _ _ => rfl }
    letI : ContinuousSMul G U := ⟨continuous_snd⟩
    let c : Z1 G U := ⟨fun g => if g = 1 then 1 else Equiv.swap 0 1,
      continuous_of_discreteTopology, by decide⟩
    H1.mk c ≠ 1 ∧
      H1.res (1 : G →* G) continuous_const (fun _ _ => rfl) (H1.mk c) = 1 := by
  sorry

end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
-- test: sourceClassesTests.nativePullbackAction
example {G : Type*} [Group G] [TopologicalSpace G]
    {H : Type*} [Group H] [TopologicalSpace H]
    {U : Type*} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
    [MulDistribMulAction G U] [ContinuousSMul G U]
    (φ : H →* G) (hφ : Continuous φ) :
    letI : MulDistribMulAction H U := MulDistribMulAction.compHom U φ
    letI : ContinuousSMul H U := MulAction.continuousSMul_compHom hφ
    H1.res φ hφ (fun _ _ => rfl) (1 : H1 G U) = 1 := by
  sorry

end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section InnerTwisting
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]

lemma Z1.twistEquiv_apply (c : Z1 G U) (d : Z1 G (Twist c)) (g : G) :
    Z1.twistEquiv c d g = (Twist.toOriginal c (d g)) * c g := by sorry

lemma Z1.twistEquiv_symm_apply (c : Z1 G U) (d : Z1 G U) (g : G) :
    (Z1.twistEquiv c).symm d g = (show Twist c from d g * (c g)⁻¹) := by sorry

lemma Z1.twistEquiv_smul (c : Z1 G U) (x : Twist c) (d : Z1 G (Twist c)) :
    Z1.twistEquiv c (x • d) = (Twist.toOriginal c x) • Z1.twistEquiv c d := by sorry

lemma H1.twistEquiv_mk (c : Z1 G U) (d : Z1 G (Twist c)) :
    H1.twistEquiv c (H1.mk d) = H1.mk (Z1.twistEquiv c d) := by sorry

lemma H1.twistEquiv_eq_class_iff (c : Z1 G U) (a : H1 G (Twist c)) :
    H1.twistEquiv c a = H1.mk c ↔ a = 1 := by sorry

lemma Twist.mem_fixed_iff (c : Z1 G U) (x : Twist c) :
    x ∈ H0 G (Twist c) ↔ ∀ g : G, c g * (g • (Twist.toOriginal c x)) = (Twist.toOriginal c x) * c g := by sorry

-- test: TauCeti.NonabelianCohomology.tests.twist_unit_value
example (c : Z1 G U) (g : G) : Z1.twistEquiv c 1 g = c g := by sorry

-- test: TauCeti.NonabelianCohomology.tests.twist_untwist
example (c d : Z1 G U) : Z1.twistEquiv c ((Z1.twistEquiv c).symm d) = d := by sorry

-- test: TauCeti.NonabelianCohomology.tests.twist_neutral_fibre
example (c : Z1 G U) : (H1.twistEquiv c).symm (H1.mk c) = 1 := by sorry

-- test: TauCeti.NonabelianCohomology.tests.twist_commutative_action
example (hcomm : ∀ x y : U, x * y = y * x) (c : Z1 G U) (g : G) (x : Twist c) :
    g • x = (show Twist c from g • (Twist.toOriginal c x)) := by sorry

-- test: TauCeti.NonabelianCohomology.tests.twist_translation_order
example (c : Z1 G U) (d : Z1 G (Twist c)) (g : G) :
    (Z1.twistEquiv c).symm (Z1.twistEquiv c d) g = d g := by sorry

-- test: TauCeti.NonabelianCohomology.tests.twist_transposition_invariants
example :
    let G := Equiv.Perm (Fin 2)
    let U := Equiv.Perm (Fin 3)
    letI : TopologicalSpace G := ⊥
    letI : TopologicalSpace U := ⊥
    letI : DiscreteTopology G := ⟨rfl⟩
    letI : DiscreteTopology U := ⟨rfl⟩
    letI : IsTopologicalGroup U := inferInstance
    letI : MulDistribMulAction G U := {
      smul := fun _ x => x
      one_smul := fun _ => rfl
      mul_smul := fun _ _ _ => rfl
      smul_one := fun _ => rfl
      smul_mul := fun _ _ _ => rfl }
    letI : ContinuousSMul G U := ⟨continuous_snd⟩
    let c : Z1 G U := ⟨fun g => if g = 1 then 1 else Equiv.swap 0 1,
      continuous_of_discreteTopology, by decide⟩
    ∀ x : U, (show Twist c from x) ∈ H0 G (Twist c) ↔
      x = 1 ∨ x = Equiv.swap 0 1 := by sorry

-- test: TauCeti.NonabelianCohomology.tests.twist_not_neutral
example :
    let G := Equiv.Perm (Fin 2)
    let U := Equiv.Perm (Fin 3)
    letI : TopologicalSpace G := ⊥
    letI : TopologicalSpace U := ⊥
    letI : DiscreteTopology G := ⟨rfl⟩
    letI : DiscreteTopology U := ⟨rfl⟩
    letI : IsTopologicalGroup U := inferInstance
    letI : MulDistribMulAction G U := {
      smul := fun _ x => x
      one_smul := fun _ => rfl
      mul_smul := fun _ _ _ => rfl
      smul_one := fun _ => rfl
      smul_mul := fun _ _ _ => rfl }
    letI : ContinuousSMul G U := ⟨continuous_snd⟩
    let c : Z1 G U := ⟨fun g => if g = 1 then 1 else Equiv.swap 0 1,
      continuous_of_discreteTopology, by decide⟩
    H1.twistEquiv c 1 ≠ 1 := by sorry

-- test: TauCeti.NonabelianCohomology.tests.twist_class_representative
example (c : Z1 G U) (d : Z1 G (Twist c)) :
    H1.twistEquiv c (H1.mk d) = H1.mk (Z1.twistEquiv c d) := by sorry

end InnerTwisting
end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section CoefficientTwisting
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V] [IsTopologicalGroup V]
  [MulDistribMulAction G V] [ContinuousSMul G V]
  {W : Type*} [Group W] [TopologicalSpace W] [IsTopologicalGroup W]
  [MulDistribMulAction G W] [ContinuousSMul G W]

def Twist.map (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    Twist c →* Twist (Z1.map f hf hG c) := by sorry

lemma Twist.map_apply (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (x : Twist c) :
    Twist.toOriginal (Z1.map f hf hG c) (Twist.map c f hf hG x) =
      f (Twist.toOriginal c x) := by sorry

lemma Twist.map_continuous (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    Continuous (Twist.map c f hf hG) := by sorry

lemma Twist.map_smul (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (g : G) (x : Twist c) :
    Twist.map c f hf hG (g • x) = g • Twist.map c f hf hG x := by sorry

lemma Twist.map_id (c : Z1 G U) :
    Twist.map c (MonoidHom.id U) continuous_id (fun (_ : G) _ => rfl) =
      MonoidHom.id (Twist c) := by sorry

lemma Twist.map_comp (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (f' : V →* W) (hf' : Continuous f')
    (hG' : ∀ (g : G) (x : V), f' (g • x) = g • f' x) :
    Twist.map c (f'.comp f) (hf'.comp hf)
      (fun g x => by rw [MonoidHom.comp_apply, hG, hG']; rfl) =
        (Twist.map (Z1.map f hf hG c) f' hf' hG').comp (Twist.map c f hf hG) := by sorry

lemma Z1.twistEquiv_map (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (d : Z1 G (Twist c)) :
    Z1.twistEquiv (Z1.map f hf hG c)
      (Z1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
        (Twist.map_smul c f hf hG) d) =
          Z1.map f hf hG (Z1.twistEquiv c d) := by sorry

lemma Z1.twistEquiv_symm_map (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (e : Z1 G U) :
    (Z1.twistEquiv (Z1.map f hf hG c)).symm (Z1.map f hf hG e) =
      Z1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
        (Twist.map_smul c f hf hG) ((Z1.twistEquiv c).symm e) := by sorry

lemma H1.twistEquiv_map (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (a : H1 G (Twist c)) :
    H1.twistEquiv (Z1.map f hf hG c)
      (H1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
        (Twist.map_smul c f hf hG) a) =
          H1.map f hf hG (H1.twistEquiv c a) := by sorry

lemma H1.twistEquiv_symm_map (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (a : H1 G U) :
    (H1.twistEquiv (Z1.map f hf hG c)).symm (H1.map f hf hG a) =
      H1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
        (Twist.map_smul c f hf hG) ((H1.twistEquiv c).symm a) := by sorry

lemma H1.twistEquiv_map_one (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    H1.map f hf hG (H1.twistEquiv c 1) = H1.mk (Z1.map f hf hG c) := by sorry

lemma H1.twistEquiv_map_fibre (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (a : H1 G (Twist c)) :
    H1.map f hf hG (H1.twistEquiv c a) = H1.mk (Z1.map f hf hG c) ↔
      H1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
        (Twist.map_smul c f hf hG) a = 1 := by sorry

-- test: twistCoefficientTests.value
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (x : Twist c) :
    Twist.toOriginal (Z1.map f hf hG c) (Twist.map c f hf hG x) =
      f (Twist.toOriginal c x) := by sorry

-- test: twistCoefficientTests.identity
example (c : Z1 G U) (x : Twist c) :
    Twist.map c (MonoidHom.id U) continuous_id (fun (_ : G) _ => rfl) x = x := by sorry

-- test: twistCoefficientTests.constant
example (c : Z1 G U) (x : Twist c) :
    Twist.map c (1 : U →* V) continuous_const (fun (_ : G) _ => (smul_one _).symm) x = 1 := by sorry

-- test: twistCoefficientTests.cocycle_square
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (d : Z1 G (Twist c)) :
    Z1.map f hf hG (Z1.twistEquiv c d) =
      Z1.twistEquiv (Z1.map f hf hG c)
        (Z1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
          (Twist.map_smul c f hf hG) d) := by sorry

-- test: twistCoefficientTests.repointed_neutral
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    H1.map f hf hG (H1.twistEquiv c 1) = H1.mk (Z1.map f hf hG c) := by sorry

end CoefficientTwisting
end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section GaugeTransport
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]

def Twist.gaugeEquiv (c : Z1 G U) (b : U) : Twist c ≃* Twist (b • c) := by sorry

lemma Twist.gaugeEquiv_apply (c : Z1 G U) (b : U) (x : Twist c) :
    Twist.toOriginal (b • c) (Twist.gaugeEquiv c b x) =
      b * Twist.toOriginal c x * b⁻¹ := by sorry

lemma Twist.gaugeEquiv_symm_apply (c : Z1 G U) (b : U) (y : Twist (b • c)) :
    Twist.toOriginal c ((Twist.gaugeEquiv c b).symm y) =
      b⁻¹ * Twist.toOriginal (b • c) y * b := by sorry

lemma Twist.gaugeEquiv_continuous (c : Z1 G U) (b : U) :
    Continuous (Twist.gaugeEquiv c b).toMonoidHom := by sorry

lemma Twist.gaugeEquiv_symm_continuous (c : Z1 G U) (b : U) :
    Continuous (Twist.gaugeEquiv c b).symm := by sorry

lemma Twist.gaugeEquiv_smul (c : Z1 G U) (b : U) (g : G) (x : Twist c) :
    Twist.gaugeEquiv c b (g • x) = g • Twist.gaugeEquiv c b x := by sorry

lemma Twist.gaugeEquiv_one (c : Z1 G U) (x : Twist c) :
    Twist.toOriginal (1 • c) (Twist.gaugeEquiv c 1 x) = Twist.toOriginal c x := by sorry

lemma Twist.gaugeEquiv_comp (c : Z1 G U) (b a : U) (x : Twist c) :
    Twist.toOriginal (a • (b • c))
      (Twist.gaugeEquiv (b • c) a (Twist.gaugeEquiv c b x)) =
        Twist.toOriginal ((a * b) • c) (Twist.gaugeEquiv c (a * b) x) := by sorry

lemma Z1.twistEquiv_gaugeMap (c : Z1 G U) (b : U) (d : Z1 G (Twist c)) :
    Z1.twistEquiv (b • c)
      (Z1.map (Twist.gaugeEquiv c b).toMonoidHom (Twist.gaugeEquiv_continuous c b)
        (Twist.gaugeEquiv_smul c b) d) = b • Z1.twistEquiv c d := by sorry

lemma H1.twistEquiv_gaugeMap (c : Z1 G U) (b : U) (a : H1 G (Twist c)) :
    H1.twistEquiv (b • c)
      (H1.map (Twist.gaugeEquiv c b).toMonoidHom (Twist.gaugeEquiv_continuous c b)
        (Twist.gaugeEquiv_smul c b) a) = H1.twistEquiv c a := by sorry

def H1.changeRepresentative (c d : Z1 G U) (_h : H1.mk c = H1.mk d) :
    H1 G (Twist c) ≃ H1 G (Twist d) := by sorry

lemma H1.changeRepresentative_apply (c d : Z1 G U) (h : H1.mk c = H1.mk d)
    (a : H1 G (Twist c)) :
    H1.changeRepresentative c d h a =
      (H1.twistEquiv d).symm (H1.twistEquiv c a) := by sorry

lemma H1.changeRepresentative_one (c d : Z1 G U) (h : H1.mk c = H1.mk d) :
    H1.changeRepresentative c d h 1 = 1 := by sorry

lemma H1.changeRepresentative_gauge (c : Z1 G U) (b : U) :
    H1.changeRepresentative c (b • c) (H1.mk_smul b c).symm =
      H1.map (Twist.gaugeEquiv c b).toMonoidHom (Twist.gaugeEquiv_continuous c b)
        (Twist.gaugeEquiv_smul c b) := by sorry

lemma H1.changeRepresentative_id (c : Z1 G U) :
    H1.changeRepresentative c c rfl = Equiv.refl (H1 G (Twist c)) := by sorry

lemma H1.changeRepresentative_comp (c d e : Z1 G U)
    (hcd : H1.mk c = H1.mk d) (hde : H1.mk d = H1.mk e) :
    (H1.changeRepresentative c d hcd).trans (H1.changeRepresentative d e hde) =
      H1.changeRepresentative c e (hcd.trans hde) := by sorry

lemma H1.changeRepresentative_symm (c d : Z1 G U) (h : H1.mk c = H1.mk d) :
    (H1.changeRepresentative c d h).symm = H1.changeRepresentative d c h.symm := by sorry

lemma H1.changeRepresentative_twistEquiv (c d : Z1 G U) (h : H1.mk c = H1.mk d)
    (a : H1 G (Twist c)) :
    H1.twistEquiv d (H1.changeRepresentative c d h a) = H1.twistEquiv c a := by sorry

lemma H1.changeRepresentative_eq_map (c d : Z1 G U) (h : H1.mk c = H1.mk d)
    (f : Twist c →* Twist d) (hf : Continuous f)
    (hG : ∀ (g : G) (x : Twist c), f (g • x) = g • f x)
    (he : ∀ a, H1.twistEquiv d (H1.map f hf hG a) = H1.twistEquiv c a) :
    H1.changeRepresentative c d h = H1.map f hf hG := by sorry

-- test: Twist.gaugeEquiv.test_inverse
example (c : Z1 G U) (b : U) (x : Twist c) :
    (Twist.gaugeEquiv c b).symm (Twist.gaugeEquiv c b x) = x := by sorry

-- test: Twist.gaugeEquiv.test_identity
example (c : Z1 G U) (x : Twist c) :
    Twist.toOriginal (1 • c) (Twist.gaugeEquiv c 1 x) = Twist.toOriginal c x := by sorry

-- test: Twist.gaugeEquiv.test_noncommutative_direction
example :
    let G := Equiv.Perm (Fin 2)
    let U := Equiv.Perm (Fin 3)
    letI : TopologicalSpace G := ⊥
    letI : TopologicalSpace U := ⊥
    letI : DiscreteTopology G := ⟨rfl⟩
    letI : DiscreteTopology U := ⟨rfl⟩
    letI : IsTopologicalGroup U := inferInstance
    letI : MulDistribMulAction G U := {
      smul := fun _ x => x
      one_smul := fun _ => rfl
      mul_smul := fun _ _ _ => rfl
      smul_one := fun _ => rfl
      smul_mul := fun _ _ _ => rfl }
    letI : ContinuousSMul G U := ⟨continuous_snd⟩
    let c : Z1 G U := ⟨fun g => if g = 1 then 1 else Equiv.swap 0 1,
      continuous_of_discreteTopology, by decide⟩
    let b : U := Equiv.swap 0 1 * Equiv.swap 1 2
    Twist.toOriginal (b • c) (Twist.gaugeEquiv c b (Equiv.swap 0 1)) = Equiv.swap 1 2 ∧
      b⁻¹ * Equiv.swap 0 1 * b ≠ Equiv.swap 1 2 := by sorry

-- test: H1.changeRepresentative.test_neutral
example (c d : Z1 G U) (h : H1.mk c = H1.mk d) :
    H1.changeRepresentative c d h 1 = 1 := by sorry

-- test: H1.changeRepresentative.test_nonneutral
example (c d : Z1 G U) (h : H1.mk c = H1.mk d)
    (hc : H1.mk c ≠ 1) :
    H1.changeRepresentative c d h ((H1.twistEquiv c).symm 1) ≠ 1 ∧
      H1.twistEquiv d (H1.changeRepresentative c d h ((H1.twistEquiv c).symm 1)) = 1 := by sorry

-- test: H1.changeRepresentative.test_class_hypothesis
example (c : Z1 G U) (hc : H1.mk c ≠ 1) :
    (H1.twistEquiv (1 : Z1 G U)).symm (H1.twistEquiv c 1) ≠ 1 := by sorry

end GaugeTransport
end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section TwistedSourceRestriction
variable {G H : Type*} [Group G] [TopologicalSpace G] [Group H] [TopologicalSpace H]
  {U : Type*} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
  [MulDistribMulAction H U] [ContinuousSMul H U]

def Twist.sourceEquiv (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) :
    Twist c ≃* Twist (Z1.res φ hφ hact c) := by
  sorry

omit [IsTopologicalGroup U] [ContinuousSMul G U] [ContinuousSMul H U] in
lemma Twist.sourceEquiv_apply (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) (x : Twist c) :
    Twist.toOriginal (Z1.res φ hφ hact c) (Twist.sourceEquiv φ hφ hact c x) =
      Twist.toOriginal c x := by
  sorry

omit [IsTopologicalGroup U] [ContinuousSMul G U] [ContinuousSMul H U] in
lemma Twist.sourceEquiv_symm_apply (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (x : Twist (Z1.res φ hφ hact c)) :
    Twist.toOriginal c ((Twist.sourceEquiv φ hφ hact c).symm x) =
      Twist.toOriginal (Z1.res φ hφ hact c) x := by
  sorry

omit [IsTopologicalGroup U] [ContinuousSMul G U] [ContinuousSMul H U] in
lemma Twist.sourceEquiv_continuous (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) :
    Continuous (Twist.sourceEquiv φ hφ hact c) := by
  sorry

omit [IsTopologicalGroup U] [ContinuousSMul G U] [ContinuousSMul H U] in
lemma Twist.sourceEquiv_symm_continuous (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) :
    Continuous (Twist.sourceEquiv φ hφ hact c).symm := by
  sorry

omit [IsTopologicalGroup U] [ContinuousSMul G U] [ContinuousSMul H U] in
lemma Twist.sourceEquiv_smul (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (h : H) (x : Twist c) :
    Twist.sourceEquiv φ hφ hact c (φ h • x) = h • Twist.sourceEquiv φ hφ hact c x := by
  sorry

def Z1.twistRes (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) :
    Z1 G (Twist c) → Z1 H (Twist (Z1.res φ hφ hact c)) := by
  sorry

omit [IsTopologicalGroup U] [ContinuousSMul G U] [ContinuousSMul H U] in
lemma Z1.twistRes_apply (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (d : Z1 G (Twist c)) (h : H) :
    Z1.twistRes φ hφ hact c d h = Twist.sourceEquiv φ hφ hact c (d (φ h)) := by
  sorry

omit [IsTopologicalGroup U] [ContinuousSMul G U] [ContinuousSMul H U] in
lemma Z1.twistRes_one (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) :
    Z1.twistRes φ hφ hact c 1 = 1 := by
  sorry

lemma Z1.twistRes_smul (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (x : Twist c) (d : Z1 G (Twist c)) :
    Z1.twistRes φ hφ hact c (x • d) =
      Twist.sourceEquiv φ hφ hact c x • Z1.twistRes φ hφ hact c d := by
  sorry

lemma Z1.twistRes_translation (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (d : Z1 G (Twist c)) :
    Z1.twistEquiv (Z1.res φ hφ hact c) (Z1.twistRes φ hφ hact c d) =
      Z1.res φ hφ hact (Z1.twistEquiv c d) := by
  sorry

def H1.twistRes (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) :
    H1 G (Twist c) → H1 H (Twist (Z1.res φ hφ hact c)) := by
  sorry

lemma H1.twistRes_mk (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (d : Z1 G (Twist c)) :
    H1.twistRes φ hφ hact c (H1.mk d) = H1.mk (Z1.twistRes φ hφ hact c d) := by
  sorry

lemma H1.twistRes_one (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) :
    H1.twistRes φ hφ hact c 1 = 1 := by
  sorry

lemma H1.twistRes_translation (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (a : H1 G (Twist c)) :
    H1.twistEquiv (Z1.res φ hφ hact c) (H1.twistRes φ hφ hact c a) =
      H1.res φ hφ hact (H1.twistEquiv c a) := by
  sorry

lemma Twist.sourceEquiv_gauge (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (b : U) (x : Twist c) :
    Twist.toOriginal (Z1.res φ hφ hact (b • c))
      (Twist.sourceEquiv φ hφ hact (b • c) (Twist.gaugeEquiv c b x)) =
    Twist.toOriginal (b • Z1.res φ hφ hact c)
      (Twist.gaugeEquiv (Z1.res φ hφ hact c) b (Twist.sourceEquiv φ hφ hact c x)) := by
  sorry

lemma Z1.twistRes_injective (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (hsur : Function.Surjective φ) : Function.Injective (Z1.twistRes φ hφ hact c) := by
  sorry

lemma H1.twistRes_injective (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (hsur : Function.Surjective φ) : Function.Injective (H1.twistRes φ hφ hact c) := by
  sorry

lemma H1.twistRes_representative (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c d : Z1 G U)
    (hcd : H1.mk c = H1.mk d) (a : H1 G (Twist c)) :
    H1.twistRes φ hφ hact d (H1.changeRepresentative c d hcd a) =
      H1.changeRepresentative (Z1.res φ hφ hact c) (Z1.res φ hφ hact d)
        (by rw [← H1.res_mk, ← H1.res_mk, hcd]) (H1.twistRes φ hφ hact c a) := by
  sorry

lemma H1.twistRes_identity_translation (c : Z1 G U) (a : H1 G (Twist c)) :
    H1.twistEquiv (Z1.res (MonoidHom.id G) continuous_id (fun _ _ => rfl) c)
      (H1.twistRes (MonoidHom.id G) continuous_id (fun _ _ => rfl) c a) =
        H1.twistEquiv c a := by
  sorry

section SourceComposition
variable {K : Type*} [Group K] [TopologicalSpace K]
  [MulDistribMulAction K U] [ContinuousSMul K U]

lemma H1.twistRes_comp_translation (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x)
    (ψ : K →* H) (hψ : Continuous ψ)
    (hact' : ∀ (k : K) (x : U), k • x = ψ k • x)
    (c : Z1 G U) (a : H1 G (Twist c)) :
    H1.twistEquiv (Z1.res ψ hψ hact' (Z1.res φ hφ hact c))
      (H1.twistRes ψ hψ hact' (Z1.res φ hφ hact c) (H1.twistRes φ hφ hact c a)) =
        H1.res (φ.comp ψ) (hφ.comp hψ)
          (fun k x => (hact' k x).trans (hact (ψ k) x)) (H1.twistEquiv c a) := by
  sorry

end SourceComposition

end TwistedSourceRestriction
end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section TwistedSourceTests
variable {G H : Type*} [Group G] [TopologicalSpace G] [Group H] [TopologicalSpace H]
  {U : Type*} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
  [MulDistribMulAction H U] [ContinuousSMul H U]

-- test: Twist.sourceEquiv.test_inverse
omit [IsTopologicalGroup U] [ContinuousSMul G U] [ContinuousSMul H U] in
example (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) (x : Twist c) :
    (Twist.sourceEquiv φ hφ hact c).symm (Twist.sourceEquiv φ hφ hact c x) = x := by
  sorry

-- test: Twist.sourceEquiv.test_semilinear
omit [IsTopologicalGroup U] [ContinuousSMul G U] [ContinuousSMul H U] in
example (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) (h : H) (x : Twist c) :
    Twist.toOriginal (Z1.res φ hφ hact c) (h • Twist.sourceEquiv φ hφ hact c x) =
      c (φ h) * (φ h • Twist.toOriginal c x) * (c (φ h))⁻¹ := by
  sorry

-- test: Twist.sourceEquiv.test_noncommutative_action
example :
    let G := Equiv.Perm (Fin 2)
    let U := Equiv.Perm (Fin 3)
    letI : TopologicalSpace G := ⊥
    letI : TopologicalSpace U := ⊥
    letI : DiscreteTopology G := ⟨rfl⟩
    letI : DiscreteTopology U := ⟨rfl⟩
    letI : IsTopologicalGroup U := inferInstance
    letI : MulDistribMulAction G U := {
      smul := fun _ x => x
      one_smul := fun _ => rfl
      mul_smul := fun _ _ _ => rfl
      smul_one := fun _ => rfl
      smul_mul := fun _ _ _ => rfl }
    letI : ContinuousSMul G U := ⟨continuous_snd⟩
    let c : Z1 G U := ⟨fun g => if g = 1 then 1 else Equiv.swap 0 1,
      continuous_of_discreteTopology, by decide⟩
    let g : G := Equiv.swap 0 1
    let x : Twist c := Equiv.swap 1 2
    let e := Twist.sourceEquiv (MonoidHom.id G) continuous_id (fun _ _ => rfl) c
    Twist.toOriginal (Z1.res (MonoidHom.id G) continuous_id (fun _ _ => rfl) c)
      (e (g • x)) = Equiv.swap 0 2 ∧
    Twist.toOriginal (Z1.res (MonoidHom.id G) continuous_id (fun _ _ => rfl) c)
      (e (g • x)) ≠ Twist.toOriginal c x := by
  sorry

-- test: Z1.twistRes.test_identity
omit [IsTopologicalGroup U] [ContinuousSMul G U] [ContinuousSMul H U] in
example (c : Z1 G U) (d : Z1 G (Twist c)) (g : G) :
    Twist.toOriginal (Z1.res (MonoidHom.id G) continuous_id (fun _ _ => rfl) c)
      (Z1.twistRes (MonoidHom.id G) continuous_id (fun _ _ => rfl) c d g) =
        Twist.toOriginal c (d g) := by
  sorry

-- test: Z1.twistRes.test_gauge_translation
example (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (x : Twist c) (d : Z1 G (Twist c)) :
    Z1.twistEquiv (Z1.res φ hφ hact c) (Z1.twistRes φ hφ hact c (x • d)) =
      Twist.toOriginal c x • Z1.res φ hφ hact (Z1.twistEquiv c d) := by
  sorry

-- test: Z1.twistRes.test_surjective_detection
example (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (hsur : Function.Surjective φ) (d : Z1 G (Twist c)) :
    Z1.twistRes φ hφ hact c d = 1 ↔ d = 1 := by
  sorry

-- test: H1.twistRes.test_neutral
example (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U) :
    H1.twistEquiv (Z1.res φ hφ hact c) (H1.twistRes φ hφ hact c 1) =
      H1.mk (Z1.res φ hφ hact c) := by
  sorry

-- test: H1.twistRes.test_gauge_classes
example (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (x : Twist c) (d : Z1 G (Twist c)) :
    H1.twistRes φ hφ hact c (H1.mk (x • d)) = H1.twistRes φ hφ hact c (H1.mk d) := by
  sorry

-- test: H1.twistRes.test_surjective_reflection
example (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (c : Z1 G U)
    (hsur : Function.Surjective φ) (a : H1 G (Twist c)) :
    H1.twistRes φ hφ hact c a = 1 ↔ a = 1 := by
  sorry

-- test: H1.twistRes.test_nonsurjective_loss
example (φ : H →* G) (hφ : Continuous φ)
    (hact : ∀ (h : H) (x : U), h • x = φ h • x) (hzero : ∀ h, φ h = 1)
    (c : Z1 G U) (hc : H1.mk c ≠ 1) :
    (H1.twistEquiv c).symm 1 ≠ 1 ∧
      H1.twistRes φ hφ hact c ((H1.twistEquiv c).symm 1) = 1 := by
  sorry

end TwistedSourceTests
end TauCeti.NonabelianCohomology

/-! Actual kernels and normal quotients of twisted coefficient maps. -/
namespace TauCeti.NonabelianCohomology
section TwistedKernels
-- Algebraic and topological declarations share these parameters; each actual
-- declaration header records the parameters needed after its body is admitted.
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V] [IsTopologicalGroup V]
  [MulDistribMulAction G V] [ContinuousSMul G V]

lemma Twist.kernel_mem (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (x : Twist c) :
    x ∈ (Twist.map c f hf hG).ker ↔ f (Twist.toOriginal c x) = 1 := by
  sorry

lemma Twist.kernel_stable (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (g : G)
    {x : Twist c} (hx : x ∈ (Twist.map c f hf hG).ker) :
    g • x ∈ (Twist.map c f hf hG).ker := by
  sorry

def Twist.kernelEquiv (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (Twist.map c f hf hG).ker ≃* f.ker := by
  sorry

lemma Twist.kernelEquiv_value (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (x : (Twist.map c f hf hG).ker) :
    (Twist.kernelEquiv c f hf hG x).val = Twist.toOriginal c x.val := by
  sorry

lemma Twist.kernelEquiv_continuous (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    Continuous (Twist.kernelEquiv c f hf hG) := by
  sorry

lemma Twist.kernelEquiv_symm_continuous (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    Continuous (Twist.kernelEquiv c f hf hG).symm := by
  sorry

@[instance_reducible]
def Twist.kernelAction (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    MulDistribMulAction G (Twist.map c f hf hG).ker := by
  sorry

lemma Twist.kernelAction_value (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (g : G)
    (x : (Twist.map c f hf hG).ker) :
    (letI := Twist.kernelAction c f hf hG
     (g • x).val = g • x.val) := by
  sorry

lemma Twist.kernelContinuousSMul (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     ContinuousSMul G (Twist.map c f hf hG).ker) := by
  sorry

def H1.twistedKernelInclusion (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     H1 G (Twist.map c f hf hG).ker → H1 G (Twist c)) := by
  sorry

lemma H1.twistedKernelInclusion_mk (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     ∀ d : Z1 G (Twist.map c f hf hG).ker,
     H1.twistedKernelInclusion c f hf hG (H1.mk d) =
       H1.mk (Z1.map (Twist.map c f hf hG).ker.subtype continuous_subtype_val
         (fun g x => Twist.kernelAction_value c f hf hG g x) d)) := by
  sorry

lemma H1.twistedKernelInclusion_one (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     H1.twistedKernelInclusion c f hf hG 1 = 1) := by
  sorry

lemma H1.twistedKernelInclusion_image (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     ∀ a : H1 G (Twist.map c f hf hG).ker,
     H1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
       (Twist.map_smul c f hf hG) (H1.twistedKernelInclusion c f hf hG a) = 1) := by
  sorry

lemma H1.twistedKernelInclusion_fibre (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     ∀ a : H1 G (Twist.map c f hf hG).ker,
     H1.map f hf hG (H1.twistEquiv c (H1.twistedKernelInclusion c f hf hG a)) =
       H1.mk (Z1.map f hf hG c)) := by
  sorry

lemma Twist.map_surjective (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) : Function.Surjective (Twist.map c f hf hG) := by
  sorry

def Twist.quotientEquiv (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) :
    Twist c ⧸ (Twist.map c f hf hG).ker ≃* Twist (Z1.map f hf hG c) := by
  sorry

lemma Twist.quotientEquiv_mk (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (x : Twist c) :
    Twist.quotientEquiv c f hf hG hsur (QuotientGroup.mk x) = Twist.map c f hf hG x := by
  sorry

lemma Twist.quotientEquiv_continuous (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) :
    Continuous (Twist.quotientEquiv c f hf hG hsur) := by
  sorry

lemma Twist.quotientEquiv_symm_continuous (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f) :
    Continuous (Twist.quotientEquiv c f hf hG hsur).symm := by
  sorry

def Twist.quotientHomeomorph (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f) :
    Twist c ⧸ (Twist.map c f hf hG).ker ≃ₜ Twist (Z1.map f hf hG c) := by
  sorry

lemma Twist.quotientHomeomorph_mk (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f) (x : Twist c) :
    Twist.quotientHomeomorph c f hf hG hsur hquot (QuotientGroup.mk x) =
      Twist.map c f hf hG x := by
  sorry

lemma Twist.quotientHomeomorph_toEquiv (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f) :
    (Twist.quotientHomeomorph c f hf hG hsur hquot).toEquiv =
      (Twist.quotientEquiv c f hf hG hsur).toEquiv := by
  sorry

lemma Twist.quotientHomeomorph_mul (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f)
    (x y : Twist c ⧸ (Twist.map c f hf hG).ker) :
    Twist.quotientHomeomorph c f hf hG hsur hquot (x*y) =
      Twist.quotientHomeomorph c f hf hG hsur hquot x *
        Twist.quotientHomeomorph c f hf hG hsur hquot y := by
  sorry

lemma Twist.quotientEquiv_symm_continuous_iff (c : Z1 G U) (f : U →* V)
    (hf : Continuous f) (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) :
    Continuous (Twist.quotientEquiv c f hf hG hsur).symm ↔ Topology.IsQuotientMap f := by
  sorry

end TwistedKernels
end TauCeti.NonabelianCohomology
namespace TauCeti.NonabelianCohomology
section TwistedKernelTests
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V] [IsTopologicalGroup V]
  [MulDistribMulAction G V] [ContinuousSMul G V]

-- test: Twist.kernelEquiv.test_inverse
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (x : (Twist.map c f hf hG).ker) :
    (Twist.kernelEquiv c f hf hG).symm (Twist.kernelEquiv c f hf hG x) = x := by
  sorry

-- test: Twist.kernelEquiv.test_identity_kernel
example (c : Z1 G U)
    (x : (Twist.map c (MonoidHom.id U) continuous_id (fun (_ : G) _ => rfl)).ker) :
    (Twist.kernelEquiv c (MonoidHom.id U) continuous_id (fun (_ : G) _ => rfl) x).val = 1 := by
  sorry

-- test: Twist.kernelEquiv.test_constant_kernel
example (c : Z1 G U) (x : Twist c) :
    (Twist.kernelEquiv c (1 : U →* V) continuous_const
      (fun (_ : G) _ => (smul_one _).symm)
      ⟨x, (Twist.kernel_mem c (1 : U →* V) continuous_const
        (fun (_ : G) _ => (smul_one _).symm) x).mpr rfl⟩).val = Twist.toOriginal c x := by
  sorry

-- test: Twist.kernelAction.test_unit
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     ∀ g : G, g • (1 : (Twist.map c f hf hG).ker) = 1) := by
  sorry

-- test: Twist.kernelAction.test_joint_continuity
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     Continuous (fun p : G × (Twist.map c f hf hG).ker => p.1 • p.2)) := by
  sorry

-- test: Twist.kernelAction.test_noncommutative_action
example :
    (let G := Equiv.Perm (Fin 2)
     let U := Equiv.Perm (Fin 3)
     letI : TopologicalSpace G := ⊥
     letI : TopologicalSpace U := ⊥
     letI : DiscreteTopology G := ⟨rfl⟩
     letI : DiscreteTopology U := ⟨rfl⟩
     letI : IsTopologicalGroup U := inferInstance
     letI : MulDistribMulAction G U := {
       smul := fun _ x => x
       one_smul := fun _ => rfl
       mul_smul := fun _ _ _ => rfl
       smul_one := fun _ => rfl
       smul_mul := fun _ _ _ => rfl }
     letI : ContinuousSMul G U := ⟨continuous_snd⟩
     let c : Z1 G U := ⟨fun g => if g = 1 then 1 else Equiv.swap 0 1,
       continuous_of_discreteTopology, by decide⟩
     let f : U →* U := 1
     let hG : ∀ (g : G) (x : U), f (g • x) = g • f x := fun _ _ => rfl
     letI := Twist.kernelAction c f continuous_const hG
     let x : (Twist.map c f continuous_const hG).ker :=
       ⟨Equiv.swap 1 2, (Twist.kernel_mem c f continuous_const hG _).mpr rfl⟩
     (Twist.toOriginal c ((Equiv.swap 0 1 : G) • x).val = Equiv.swap 0 2) ∧
       (Twist.toOriginal c ((Equiv.swap 0 1 : G) • x).val ≠ Twist.toOriginal c x.val)) := by
  sorry

-- test: H1.twistedKernelInclusion.test_neutral
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     H1.twistedKernelInclusion c f hf hG 1 = 1) := by
  sorry

-- test: H1.twistedKernelInclusion.test_gauge_classes
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     ∀ (x : (Twist.map c f hf hG).ker) (d : Z1 G (Twist.map c f hf hG).ker),
     H1.twistedKernelInclusion c f hf hG (H1.mk (x • d)) =
       H1.twistedKernelInclusion c f hf hG (H1.mk d)) := by
  sorry

-- test: H1.twistedKernelInclusion.test_repointed_fibre
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     ∀ a : H1 G (Twist.map c f hf hG).ker,
     H1.map f hf hG (H1.twistEquiv c (H1.twistedKernelInclusion c f hf hG a)) =
       H1.mk (Z1.map f hf hG c)) := by
  sorry

-- test: Twist.quotientEquiv.test_native_comparison
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (hsur : Function.Surjective f) :
    Twist.quotientEquiv c f hf hG hsur =
      QuotientGroup.quotientKerEquivOfSurjective (Twist.map c f hf hG)
        (Twist.map_surjective c f hf hG hsur) := by
  sorry

-- test: Twist.quotientEquiv.test_inverse
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (hsur : Function.Surjective f)
    (x : Twist c ⧸ (Twist.map c f hf hG).ker) :
    (Twist.quotientEquiv c f hf hG hsur).symm
      (Twist.quotientEquiv c f hf hG hsur x) = x := by
  sorry

-- test: Twist.quotientEquiv.test_nonsurjective_constant
example (c : Z1 G U) (v : V) (hv : v ≠ 1) :
    ¬ Function.Surjective (Twist.map c (1 : U →* V) continuous_const
      (fun (_ : G) _ => (smul_one _).symm)) := by
  sorry

-- test: Twist.quotientHomeomorph.test_native_value
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (hsur : Function.Surjective f)
    (hquot : Topology.IsQuotientMap f) (x : Twist c) :
    Twist.toOriginal (Z1.map f hf hG c)
      (Twist.quotientHomeomorph c f hf hG hsur hquot (QuotientGroup.mk x)) =
        f (Twist.toOriginal c x) := by
  sorry

-- test: Twist.quotientHomeomorph.test_inverse
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (hsur : Function.Surjective f)
    (hquot : Topology.IsQuotientMap f) (x : Twist c ⧸ (Twist.map c f hf hG).ker) :
    (Twist.quotientHomeomorph c f hf hG hsur hquot).symm
      (Twist.quotientHomeomorph c f hf hG hsur hquot x) = x := by
  sorry

-- test: Twist.quotientHomeomorph.test_quotient_topology_required
example (c : Z1 G U) (f : U →* V)
    (hf : Continuous f) (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (hnq : ¬ Topology.IsQuotientMap f) :
    ¬ Continuous (Twist.quotientEquiv c f hf hG hsur).symm := by
  sorry

end TwistedKernelTests
end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section TwistedQuotients
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V] [IsTopologicalGroup V]
  [MulDistribMulAction G V] [ContinuousSMul G V]

@[instance_reducible]
def Twist.quotientAction (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    MulDistribMulAction G (Twist c ⧸ (Twist.map c f hf hG).ker) := by sorry

lemma Twist.quotientAction_mk (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (g : G) (x : Twist c) :
    (letI := Twist.quotientAction c f hf hG
     g • (QuotientGroup.mk x : Twist c ⧸ (Twist.map c f hf hG).ker) =
       QuotientGroup.mk (g • x)) := by sorry

lemma Twist.quotientContinuousSMul (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.quotientAction c f hf hG
     ContinuousSMul G (Twist c ⧸ (Twist.map c f hf hG).ker)) := by sorry

lemma Twist.quotientEquiv_smul (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) :
    (letI := Twist.quotientAction c f hf hG
     ∀ (g : G) (q : Twist c ⧸ (Twist.map c f hf hG).ker),
     Twist.quotientEquiv c f hf hG hsur (g • q) =
       g • Twist.quotientEquiv c f hf hG hsur q) := by sorry

lemma Twist.quotientEquiv_symm_smul (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) :
    (letI := Twist.quotientAction c f hf hG
     ∀ (g : G) (y : Twist (Z1.map f hf hG c)),
     (Twist.quotientEquiv c f hf hG hsur).symm (g • y) =
       g • (Twist.quotientEquiv c f hf hG hsur).symm y) := by sorry

def Z1.twistedQuotient (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.quotientAction c f hf hG
     Z1 G (Twist c) → Z1 G (Twist c ⧸ (Twist.map c f hf hG).ker)) := by sorry

lemma Z1.twistedQuotient_apply (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (d : Z1 G (Twist c)) (g : G) :
    (letI := Twist.quotientAction c f hf hG
     Z1.twistedQuotient c f hf hG d g = QuotientGroup.mk (d g)) := by sorry

lemma Z1.twistedQuotient_one (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.quotientAction c f hf hG
     Z1.twistedQuotient c f hf hG 1 = 1) := by sorry

lemma Z1.twistedQuotient_gauge (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (x : Twist c) (d : Z1 G (Twist c)) :
    (letI := Twist.quotientAction c f hf hG
     letI := Twist.quotientContinuousSMul c f hf hG
     Z1.twistedQuotient c f hf hG (x • d) =
       (QuotientGroup.mk x : Twist c ⧸ (Twist.map c f hf hG).ker) •
         Z1.twistedQuotient c f hf hG d) := by sorry

def H1.twistedQuotient (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.quotientAction c f hf hG
     letI := Twist.quotientContinuousSMul c f hf hG
     H1 G (Twist c) → H1 G (Twist c ⧸ (Twist.map c f hf hG).ker)) := by sorry

lemma H1.twistedQuotient_mk (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (d : Z1 G (Twist c)) :
    (letI := Twist.quotientAction c f hf hG
     letI := Twist.quotientContinuousSMul c f hf hG
     H1.twistedQuotient c f hf hG (H1.mk d) =
       H1.mk (Z1.twistedQuotient c f hf hG d)) := by sorry

lemma H1.twistedQuotient_one (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.quotientAction c f hf hG
     letI := Twist.quotientContinuousSMul c f hf hG
     H1.twistedQuotient c f hf hG 1 = 1) := by sorry

def Z1.twistedQuotientEquiv (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f) :
    (letI := Twist.quotientAction c f hf hG
     Z1 G (Twist c ⧸ (Twist.map c f hf hG).ker) ≃
       Z1 G (Twist (Z1.map f hf hG c))) := by sorry

lemma Z1.twistedQuotientEquiv_apply (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f) :
    (letI := Twist.quotientAction c f hf hG
     ∀ (d : Z1 G (Twist c ⧸ (Twist.map c f hf hG).ker)) (g : G),
     Z1.twistedQuotientEquiv c f hf hG hsur hquot d g =
       Twist.quotientEquiv c f hf hG hsur (d g)) := by sorry

lemma Z1.twistedQuotientEquiv_symm_apply (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f)
    (d : Z1 G (Twist (Z1.map f hf hG c))) (g : G) :
    (letI := Twist.quotientAction c f hf hG
     (Z1.twistedQuotientEquiv c f hf hG hsur hquot).symm d g =
       (Twist.quotientEquiv c f hf hG hsur).symm (d g)) := by sorry

lemma Z1.twistedQuotientEquiv_one (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f) :
    (letI := Twist.quotientAction c f hf hG
     Z1.twistedQuotientEquiv c f hf hG hsur hquot 1 = 1) := by sorry

lemma Z1.twistedQuotientEquiv_gauge (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f) :
    (letI := Twist.quotientAction c f hf hG
     letI := Twist.quotientContinuousSMul c f hf hG
     ∀ (x : Twist c ⧸ (Twist.map c f hf hG).ker)
       (d : Z1 G (Twist c ⧸ (Twist.map c f hf hG).ker)),
     Z1.twistedQuotientEquiv c f hf hG hsur hquot (x • d) =
       Twist.quotientEquiv c f hf hG hsur x •
         Z1.twistedQuotientEquiv c f hf hG hsur hquot d) := by sorry

lemma Z1.twistedQuotientEquiv_projection (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f)
    (d : Z1 G (Twist c)) :
    (letI := Twist.quotientAction c f hf hG
     Z1.twistedQuotientEquiv c f hf hG hsur hquot
       (Z1.twistedQuotient c f hf hG d) =
       Z1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
         (Twist.map_smul c f hf hG) d) := by sorry

def H1.twistedQuotientEquiv (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f) :
    (letI := Twist.quotientAction c f hf hG
     letI := Twist.quotientContinuousSMul c f hf hG
     H1 G (Twist c ⧸ (Twist.map c f hf hG).ker) ≃
       H1 G (Twist (Z1.map f hf hG c))) := by sorry

lemma H1.twistedQuotientEquiv_mk (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f) :
    (letI := Twist.quotientAction c f hf hG
     letI := Twist.quotientContinuousSMul c f hf hG
     ∀ d : Z1 G (Twist c ⧸ (Twist.map c f hf hG).ker),
     H1.twistedQuotientEquiv c f hf hG hsur hquot (H1.mk d) =
       H1.mk (Z1.twistedQuotientEquiv c f hf hG hsur hquot d)) := by sorry

lemma H1.twistedQuotientEquiv_symm_mk (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f)
    (d : Z1 G (Twist (Z1.map f hf hG c))) :
    (letI := Twist.quotientAction c f hf hG
     letI := Twist.quotientContinuousSMul c f hf hG
     (H1.twistedQuotientEquiv c f hf hG hsur hquot).symm (H1.mk d) =
       H1.mk ((Z1.twistedQuotientEquiv c f hf hG hsur hquot).symm d)) := by sorry

lemma H1.twistedQuotientEquiv_one (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f) :
    (letI := Twist.quotientAction c f hf hG
     letI := Twist.quotientContinuousSMul c f hf hG
     H1.twistedQuotientEquiv c f hf hG hsur hquot 1 = 1) := by sorry

lemma H1.twistedQuotientEquiv_projection (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f)
    (a : H1 G (Twist c)) :
    (letI := Twist.quotientAction c f hf hG
     letI := Twist.quotientContinuousSMul c f hf hG
     H1.twistedQuotientEquiv c f hf hG hsur hquot (H1.twistedQuotient c f hf hG a) =
       H1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
         (Twist.map_smul c f hf hG) a) := by sorry

lemma H1.twistedQuotient_kernel (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     letI := Twist.quotientAction c f hf hG
     letI := Twist.quotientContinuousSMul c f hf hG
     ∀ a : H1 G (Twist.map c f hf hG).ker,
     H1.twistedQuotient c f hf hG (H1.twistedKernelInclusion c f hf hG a) = 1) := by sorry

lemma H1.twistedQuotientEquiv_translation (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f)
    (a : H1 G (Twist c)) :
    (letI := Twist.quotientAction c f hf hG
     letI := Twist.quotientContinuousSMul c f hf hG
     H1.twistEquiv (Z1.map f hf hG c)
       (H1.twistedQuotientEquiv c f hf hG hsur hquot
         (H1.twistedQuotient c f hf hG a)) =
       H1.map f hf hG (H1.twistEquiv c a)) := by sorry

lemma H1.twistedQuotient_fibre (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f)
    (a : H1 G (Twist c)) :
    (letI := Twist.quotientAction c f hf hG
     letI := Twist.quotientContinuousSMul c f hf hG
     H1.twistedQuotient c f hf hG a = 1 ↔
       H1.map f hf hG (H1.twistEquiv c a) = H1.mk (Z1.map f hf hG c)) := by sorry

end TwistedQuotients
end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section TwistedQuotientTests
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V] [IsTopologicalGroup V]
  [MulDistribMulAction G V] [ContinuousSMul G V]

-- test: Twist.quotientAction.test_unit
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (g : G) :
    (letI := Twist.quotientAction c f hf hG
     g • (1 : Twist c ⧸ (Twist.map c f hf hG).ker) = 1) := by sorry

-- test: Twist.quotientAction.test_projection
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (g : G) (x : Twist c) :
    (letI := Twist.quotientAction c f hf hG
     g • (QuotientGroup.mk x : Twist c ⧸ (Twist.map c f hf hG).ker) =
       QuotientGroup.mk (g • x)) := by sorry

-- test: Twist.quotientAction.test_joint_continuity
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.quotientAction c f hf hG
     Continuous (fun z : G × (Twist c ⧸ (Twist.map c f hf hG).ker) => z.1 • z.2)) := by sorry

-- test: Twist.quotientAction.test_nontrivial_twist
example (c : Z1 G U) (g : G) (x : Twist c) (hne : g • x ≠ x) :
    (letI := Twist.quotientAction c (MonoidHom.id U) continuous_id (fun (_ : G) _ => rfl)
     g • (QuotientGroup.mk x : Twist c ⧸
       (Twist.map c (MonoidHom.id U) continuous_id (fun (_ : G) _ => rfl)).ker) ≠
       QuotientGroup.mk x) := by sorry

-- test: Z1.twistedQuotient.test_value
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (d : Z1 G (Twist c)) (g : G) :
    (letI := Twist.quotientAction c f hf hG
     Z1.twistedQuotient c f hf hG d g = QuotientGroup.mk (d g)) := by sorry

-- test: Z1.twistedQuotient.test_constant_map
example (c : Z1 G U) (d : Z1 G (Twist c)) :
    (let f : U →* V := 1
     let hG : ∀ (g : G) (x : U), f (g • x) = g • f x :=
       fun g _ => (smul_one g).symm
     letI := Twist.quotientAction c f continuous_const hG
     Z1.twistedQuotient c f continuous_const hG d = 1) := by sorry

-- test: Z1.twistedQuotient.test_gauge
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (x : Twist c) (d : Z1 G (Twist c)) :
    (letI := Twist.quotientAction c f hf hG
     letI := Twist.quotientContinuousSMul c f hf hG
     Z1.twistedQuotient c f hf hG (x • d) =
       (QuotientGroup.mk x : Twist c ⧸ (Twist.map c f hf hG).ker) •
         Z1.twistedQuotient c f hf hG d) := by sorry

-- test: H1.twistedQuotient.test_neutral
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.quotientAction c f hf hG
     letI := Twist.quotientContinuousSMul c f hf hG
     H1.twistedQuotient c f hf hG 1 = 1) := by sorry

-- test: H1.twistedQuotient.test_representative
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (d : Z1 G (Twist c)) :
    (letI := Twist.quotientAction c f hf hG
     letI := Twist.quotientContinuousSMul c f hf hG
     H1.twistedQuotient c f hf hG (H1.mk d) =
       H1.mk (Z1.twistedQuotient c f hf hG d)) := by sorry

-- test: H1.twistedQuotient.test_kernel
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     letI := Twist.quotientAction c f hf hG
     letI := Twist.quotientContinuousSMul c f hf hG
     ∀ a : H1 G (Twist.map c f hf hG).ker,
     H1.twistedQuotient c f hf hG (H1.twistedKernelInclusion c f hf hG a) = 1) := by sorry

-- test: Z1.twistedQuotientEquiv.test_round_trip
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f) :
    (letI := Twist.quotientAction c f hf hG
     ∀ d : Z1 G (Twist c ⧸ (Twist.map c f hf hG).ker),
     (Z1.twistedQuotientEquiv c f hf hG hsur hquot).symm
       (Z1.twistedQuotientEquiv c f hf hG hsur hquot d) = d) := by sorry

-- test: Z1.twistedQuotientEquiv.test_projection_triangle
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f)
    (d : Z1 G (Twist c)) :
    (letI := Twist.quotientAction c f hf hG
     Z1.twistedQuotientEquiv c f hf hG hsur hquot (Z1.twistedQuotient c f hf hG d) =
       Z1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
         (Twist.map_smul c f hf hG) d) := by sorry

-- test: Z1.twistedQuotientEquiv.test_neutral
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f) :
    (letI := Twist.quotientAction c f hf hG
     Z1.twistedQuotientEquiv c f hf hG hsur hquot 1 = 1) := by sorry

-- test: H1.twistedQuotientEquiv.test_round_trip
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f) :
    (letI := Twist.quotientAction c f hf hG
     letI := Twist.quotientContinuousSMul c f hf hG
     ∀ a : H1 G (Twist c ⧸ (Twist.map c f hf hG).ker),
     (H1.twistedQuotientEquiv c f hf hG hsur hquot).symm
       (H1.twistedQuotientEquiv c f hf hG hsur hquot a) = a) := by sorry

-- test: H1.twistedQuotientEquiv.test_neutral
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f) :
    (letI := Twist.quotientAction c f hf hG
     letI := Twist.quotientContinuousSMul c f hf hG
     H1.twistedQuotientEquiv c f hf hG hsur hquot 1 = 1) := by sorry

-- test: H1.twistedQuotientEquiv.test_repointed_fibre
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) (hsur : Function.Surjective f) (hquot : Topology.IsQuotientMap f)
    (a : H1 G (Twist c)) :
    (letI := Twist.quotientAction c f hf hG
     letI := Twist.quotientContinuousSMul c f hf hG
     H1.twistedQuotient c f hf hG a = 1 ↔
       H1.map f hf hG (H1.twistEquiv c a) = H1.mk (Z1.map f hf hG c)) := by sorry

end TwistedQuotientTests
end TauCeti.NonabelianCohomology
-- END NATIVE TWISTED QUOTIENT ACTION AND COHOMOLOGY

namespace TauCeti.NonabelianCohomology
section KernelImageConverse
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V] [IsTopologicalGroup V]
  [MulDistribMulAction G V] [ContinuousSMul G V]

lemma Z1.map_gauge_normalizes (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (d : Z1 G U) (x : U)
    (hd : ∀ g, f (d g) = f x * (g • f x)⁻¹) :
    Z1.map f hf hG (x⁻¹ • d) = 1 := by
  sorry

def Z1.twistedKernelLift (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (d : Z1 G (Twist c)) (hd : ∀ g, Twist.map c f hf hG (d g) = 1) :
    (letI := Twist.kernelAction c f hf hG
     Z1 G (Twist.map c f hf hG).ker) := by
  sorry

lemma Z1.twistedKernelLift_apply (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (d : Z1 G (Twist c)) (hd : ∀ g, Twist.map c f hf hG (d g) = 1) (g : G) :
    (letI := Twist.kernelAction c f hf hG
     (Z1.twistedKernelLift c f hf hG d hd g).val = d g) := by
  sorry

lemma Z1.twistedKernelLift_inclusion (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (d : Z1 G (Twist c)) (hd : ∀ g, Twist.map c f hf hG (d g) = 1) :
    (letI := Twist.kernelAction c f hf hG
     Z1.map (Twist.map c f hf hG).ker.subtype continuous_subtype_val
       (fun g x => Twist.kernelAction_value c f hf hG g x)
       (Z1.twistedKernelLift c f hf hG d hd) = d) := by
  sorry

lemma Z1.twistedKernelLift_one (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     Z1.twistedKernelLift c f hf hG 1 (fun _ => (Twist.map c f hf hG).map_one) = 1) := by
  sorry

lemma Z1.twistedKernelLift_gauge (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (d : Z1 G (Twist c)) (hd : ∀ g, Twist.map c f hf hG (d g) = 1) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     ∀ (x : (Twist.map c f hf hG).ker)
       (he : ∀ g, Twist.map c f hf hG ((x.val • d) g) = 1),
     Z1.twistedKernelLift c f hf hG (x.val • d) he =
       x • Z1.twistedKernelLift c f hf hG d hd) := by
  sorry

lemma Z1.twistedKernelLift_injective (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (d e : Z1 G (Twist c))
    (hd : ∀ g, Twist.map c f hf hG (d g) = 1)
    (he : ∀ g, Twist.map c f hf hG (e g) = 1) :
    (letI := Twist.kernelAction c f hf hG
     Z1.twistedKernelLift c f hf hG d hd = Z1.twistedKernelLift c f hf hG e he ↔ d = e) := by
  sorry

lemma H1.exists_twistedKernelInclusion_of_quotient_eq_one
    (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     letI := Twist.quotientAction c f hf hG
     letI := Twist.quotientContinuousSMul c f hf hG
     ∀ a : H1 G (Twist c), H1.twistedQuotient c f hf hG a = 1 →
       ∃ b : H1 G (Twist.map c f hf hG).ker,
         H1.twistedKernelInclusion c f hf hG b = a) := by
  sorry

lemma H1.twistedQuotient_range_iff (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     letI := Twist.quotientAction c f hf hG
     letI := Twist.quotientContinuousSMul c f hf hG
     ∀ a : H1 G (Twist c),
     a ∈ Set.range (H1.twistedKernelInclusion c f hf hG) ↔
       H1.twistedQuotient c f hf hG a = 1) := by
  sorry

lemma H1.exists_twistedKernelInclusion_of_map_eq_one
    (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     ∀ a : H1 G (Twist c),
     H1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
       (Twist.map_smul c f hf hG) a = 1 →
     ∃ b : H1 G (Twist.map c f hf hG).ker,
       H1.twistedKernelInclusion c f hf hG b = a) := by
  sorry

lemma H1.twistedKernelInclusion_range_iff (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     ∀ a : H1 G (Twist c),
     a ∈ Set.range (H1.twistedKernelInclusion c f hf hG) ↔
       H1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
         (Twist.map_smul c f hf hG) a = 1) := by
  sorry

lemma H1.twistedKernelInclusion_fibre_range_iff
    (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     ∀ a : H1 G U,
     a ∈ Set.range (fun b => H1.twistEquiv c (H1.twistedKernelInclusion c f hf hG b)) ↔
       H1.map f hf hG a = H1.mk (Z1.map f hf hG c)) := by
  sorry

end KernelImageConverse
end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section KernelImageTests
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V] [IsTopologicalGroup V]
  [MulDistribMulAction G V] [ContinuousSMul G V]

-- test: Z1.twistedKernelLift.test_value
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (d : Z1 G (Twist c)) (hd : ∀ g, Twist.map c f hf hG (d g) = 1) (g : G) :
    (letI := Twist.kernelAction c f hf hG
     (Z1.twistedKernelLift c f hf hG d hd g).val = d g) := by
  sorry

-- test: Z1.twistedKernelLift.test_inclusion
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (d : Z1 G (Twist c)) (hd : ∀ g, Twist.map c f hf hG (d g) = 1) :
    (letI := Twist.kernelAction c f hf hG
     Z1.map (Twist.map c f hf hG).ker.subtype continuous_subtype_val
       (fun g x => Twist.kernelAction_value c f hf hG g x)
       (Z1.twistedKernelLift c f hf hG d hd) = d) := by
  sorry

-- test: Z1.twistedKernelLift.test_neutral
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     Z1.twistedKernelLift c f hf hG 1 (fun _ => (Twist.map c f hf hG).map_one) = 1) := by
  sorry

-- test: Z1.twistedKernelLift.test_detection
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (d e : Z1 G (Twist c))
    (hd : ∀ g, Twist.map c f hf hG (d g) = 1)
    (he : ∀ g, Twist.map c f hf hG (e g) = 1) :
    (letI := Twist.kernelAction c f hf hG
     Z1.twistedKernelLift c f hf hG d hd = Z1.twistedKernelLift c f hf hG e he ↔ d = e) := by
  sorry

-- test: Z1.twistedKernelLift.test_gauge
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (d : Z1 G (Twist c)) (hd : ∀ g, Twist.map c f hf hG (d g) = 1) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     ∀ (x : (Twist.map c f hf hG).ker)
       (he : ∀ g, Twist.map c f hf hG ((x.val • d) g) = 1),
     Z1.twistedKernelLift c f hf hG (x.val • d) he =
       x • Z1.twistedKernelLift c f hf hG d hd) := by
  sorry

-- test: Z1.twistedKernelLift.test_non_kernel_rejected
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (d : Z1 G (Twist c)) (g : G) (hbad : Twist.map c f hf hG (d g) ≠ 1) :
    (letI := Twist.kernelAction c f hf hG
     ¬ ∃ k : Z1 G (Twist.map c f hf hG).ker, ∀ h, (k h).val = d h) := by
  sorry

-- test: H1.kernelImage.test_quotient_neutral
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     (1 : H1 G (Twist c)) ∈ Set.range (H1.twistedKernelInclusion c f hf hG)) := by
  sorry

-- test: H1.kernelImage.test_no_quotient_map
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hsur : Function.Surjective f) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     ∀ a : H1 G (Twist c),
     H1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
       (Twist.map_smul c f hf hG) a = 1 →
     ∃ b : H1 G (Twist.map c f hf hG).ker,
       H1.twistedKernelInclusion c f hf hG b = a) := by
  sorry

-- test: H1.kernelImage.test_non_neutral_rejected
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (a : H1 G (Twist c))
    (ha : H1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
      (Twist.map_smul c f hf hG) a ≠ 1) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     a ∉ Set.range (H1.twistedKernelInclusion c f hf hG)) := by
  sorry

-- test: H1.kernelImage.test_shifted_basepoint
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (hfc : H1.mk (Z1.map f hf hG c) ≠ 1) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     (1 : H1 G U) ∉ Set.range
       (fun b => H1.twistEquiv c (H1.twistedKernelInclusion c f hf hG b))) := by
  sorry

-- test: H1.kernelImage.test_constant_map
example (c : Z1 G U) (a : H1 G (Twist c)) :
    (let f : U →* V := 1
     let hG : ∀ (g : G) (x : U), f (g • x) = g • f x := fun g _ => (smul_one g).symm
     letI := Twist.kernelAction c f continuous_const hG
     letI := Twist.kernelContinuousSMul c f continuous_const hG
     a ∈ Set.range (H1.twistedKernelInclusion c f continuous_const hG)) := by
  sorry

-- test: Z1.kernelImage.test_inverse_gauge_order
example :
    let U := Equiv.Perm (Fin 3)
    let G := ConjAct U
    letI : TopologicalSpace U := ⊥
    letI : TopologicalSpace G := ⊥
    letI : DiscreteTopology U := ⟨rfl⟩
    letI : DiscreteTopology G := ⟨rfl⟩
    letI : IsTopologicalGroup U := inferInstance
    letI : ContinuousSMul G U := ⟨continuous_of_discreteTopology⟩
    let x : U := Equiv.swap (0 : Fin 3) 1 * Equiv.swap (1 : Fin 3) 2
    let d : Z1 G U := Z1.coboundary x
    x⁻¹ • d = 1 ∧ x • d ≠ 1 := by
  sorry

end KernelImageTests
end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section NamedKernel
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U]
  [MulDistribMulAction G U]
  {V : Type*} [Group V] [TopologicalSpace V]
  [MulDistribMulAction G V]
variable (c : Z1 G U) (f : U →* V) (hf : Continuous f)
  (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
  (S : Subgroup U) (hS : ∀ x : U, x ∈ S ↔ f x = 1)

/-- A named subgroup has to be the actual kernel, with its native subspace topology. -/
def Twist.namedKernelEquiv (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (S : Subgroup U) (hS : ∀ x : U, x ∈ S ↔ f x = 1) : S ≃* (Twist.map c f hf hG).ker := by sorry

lemma Twist.namedKernelEquiv_apply (x : S) :
    Twist.toOriginal c (Twist.namedKernelEquiv c f hf hG S hS x).val = x.val := by sorry

lemma Twist.namedKernelEquiv_symm_apply (x : (Twist.map c f hf hG).ker) :
    ((Twist.namedKernelEquiv c f hf hG S hS).symm x).val =
      Twist.toOriginal c x.val := by sorry

lemma Twist.namedKernelEquiv_continuous :
    Continuous (Twist.namedKernelEquiv c f hf hG S hS) := by sorry

lemma Twist.namedKernelEquiv_symm_continuous :
    Continuous (Twist.namedKernelEquiv c f hf hG S hS).symm := by sorry

@[instance_reducible]
def Twist.namedKernelAction (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (S : Subgroup U) (hS : ∀ x : U, x ∈ S ↔ f x = 1)
    [hTopU : IsTopologicalGroup U] [hActionU : ContinuousSMul G U]
    [hTopV : IsTopologicalGroup V] [hActionV : ContinuousSMul G V] : MulDistribMulAction G S := by sorry

variable [hTopU : IsTopologicalGroup U] [hActionU : ContinuousSMul G U]
  [hTopV : IsTopologicalGroup V] [hActionV : ContinuousSMul G V]

lemma Twist.namedKernelAction_value (g : G) (x : S) :
    (letI := Twist.namedKernelAction c f hf hG S hS
     (g • x).val = c g * (g • x.val) * (c g)⁻¹) := by sorry

lemma Twist.namedKernelEquiv_smul (g : G) (x : S) :
    (letI := Twist.namedKernelAction c f hf hG S hS
     letI := Twist.kernelAction c f hf hG
     Twist.namedKernelEquiv c f hf hG S hS (g • x) =
       g • Twist.namedKernelEquiv c f hf hG S hS x) := by sorry

lemma Twist.namedKernelContinuousSMul :
    (letI := Twist.namedKernelAction c f hf hG S hS
     ContinuousSMul G S) := by sorry

def H1.namedKernelEquiv (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (S : Subgroup U) (hS : ∀ x : U, x ∈ S ↔ f x = 1) :
    (letI := Twist.namedKernelAction c f hf hG S hS
     letI := Twist.namedKernelContinuousSMul c f hf hG S hS
     letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     H1 G S ≃ H1 G (Twist.map c f hf hG).ker) := by sorry

lemma H1.namedKernelEquiv_mk :
    (letI := Twist.namedKernelAction c f hf hG S hS
     letI := Twist.namedKernelContinuousSMul c f hf hG S hS
     letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     ∀ d : Z1 G S,
     H1.namedKernelEquiv c f hf hG S hS (H1.mk d) =
       H1.mk (Z1.map (Twist.namedKernelEquiv c f hf hG S hS).toMonoidHom
         (Twist.namedKernelEquiv_continuous c f hf hG S hS)
         (Twist.namedKernelEquiv_smul c f hf hG S hS) d)) := by sorry

lemma H1.namedKernelEquiv_symm_mk :
    (letI := Twist.namedKernelAction c f hf hG S hS
     letI := Twist.namedKernelContinuousSMul c f hf hG S hS
     letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     let e := Twist.namedKernelEquiv c f hf hG S hS
     ∀ d : Z1 G (Twist.map c f hf hG).ker,
     (H1.namedKernelEquiv c f hf hG S hS).symm (H1.mk d) =
       H1.mk (Z1.map e.symm.toMonoidHom
         (Twist.namedKernelEquiv_symm_continuous c f hf hG S hS)
         (fun g x => by
           apply e.injective
           change e (e.symm (g • x)) = e (g • e.symm x)
           rw [e.apply_symm_apply, Twist.namedKernelEquiv_smul, e.apply_symm_apply]) d)) := by sorry

lemma H1.namedKernelEquiv_one :
    (letI := Twist.namedKernelAction c f hf hG S hS
     letI := Twist.namedKernelContinuousSMul c f hf hG S hS
     letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     H1.namedKernelEquiv c f hf hG S hS 1 = 1) := by sorry

lemma H1.namedKernelEquiv_inclusion :
    (letI := Twist.namedKernelAction c f hf hG S hS
     letI := Twist.namedKernelContinuousSMul c f hf hG S hS
     letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     let j : H1 G S → H1 G (Twist c) := H1.map (G := G) (U := S) (U' := Twist c) (show S →* Twist c from S.subtype)
         continuous_subtype_val (fun g x => by
           change (show Twist c from (g • x).val) = g • (show Twist c from x.val)
           rw [Twist.smul_def]
           exact Twist.namedKernelAction_value c f hf hG S hS g x)
     ∀ a : H1 G S,
     H1.twistedKernelInclusion (G := G) (U := U) (V := V) c f hf hG
       ((H1.namedKernelEquiv c f hf hG S hS).toFun a) =
       j a) := by sorry

lemma H1.namedKernelInclusion_range :
    (letI := Twist.namedKernelAction c f hf hG S hS
     letI := Twist.namedKernelContinuousSMul c f hf hG S hS
     letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     Set.range (H1.map (G := G) (U := S) (U' := Twist c) (show S →* Twist c from S.subtype)
       continuous_subtype_val (fun g x => by
           change (show Twist c from (g • x).val) = g • (show Twist c from x.val)
           rw [Twist.smul_def]
           exact Twist.namedKernelAction_value c f hf hG S hS g x)) =
       Set.range (H1.twistedKernelInclusion c f hf hG)) := by sorry

lemma H1.namedKernelInclusion_quotient_range_iff :
    (letI := Twist.namedKernelAction c f hf hG S hS
     letI := Twist.namedKernelContinuousSMul c f hf hG S hS
     letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     letI := Twist.quotientAction c f hf hG
     letI := Twist.quotientContinuousSMul c f hf hG
     ∀ a : H1 G (Twist c),
     a ∈ Set.range (H1.map (G := G) (U := S) (U' := Twist c) (show S →* Twist c from S.subtype)
       continuous_subtype_val (fun g x => by
           change (show Twist c from (g • x).val) = g • (show Twist c from x.val)
           rw [Twist.smul_def]
           exact Twist.namedKernelAction_value c f hf hG S hS g x)) ↔ H1.twistedQuotient c f hf hG a = 1) := by sorry

lemma H1.namedKernelInclusion_mapped_range_iff (hsur : Function.Surjective f) :
    (letI := Twist.namedKernelAction c f hf hG S hS
     letI := Twist.namedKernelContinuousSMul c f hf hG S hS
     letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     ∀ a : H1 G (Twist c),
     a ∈ Set.range (H1.map (G := G) (U := S) (U' := Twist c) (show S →* Twist c from S.subtype)
       continuous_subtype_val (fun g x => by
           change (show Twist c from (g • x).val) = g • (show Twist c from x.val)
           rw [Twist.smul_def]
           exact Twist.namedKernelAction_value c f hf hG S hS g x)) ↔
       H1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
         (Twist.map_smul c f hf hG) a = 1) := by sorry

lemma H1.namedKernelInclusion_fibre_range_iff (hsur : Function.Surjective f) :
    (letI := Twist.namedKernelAction c f hf hG S hS
     letI := Twist.namedKernelContinuousSMul c f hf hG S hS
     letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     ∀ a : H1 G U,
     a ∈ Set.range (fun b => H1.twistEquiv c
       (H1.map (G := G) (U := S) (U' := Twist c) (show S →* Twist c from S.subtype)
         continuous_subtype_val (fun g x => by
           change (show Twist c from (g • x).val) = g • (show Twist c from x.val)
           rw [Twist.smul_def]
           exact Twist.namedKernelAction_value c f hf hG S hS g x) b)) ↔
       H1.map f hf hG a = H1.mk (Z1.map f hf hG c)) := by sorry

end NamedKernel
end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section NamedKernelTests
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]
  {V : Type*} [Group V] [TopologicalSpace V] [MulDistribMulAction G V]

-- test: Twist.namedKernelEquiv.test_constant_top
example (c : Z1 G U) (x : U) :
    let f : U →* V := 1
    let hG : ∀ (g : G) (x : U), f (g • x) = g • f x := fun g _ => (smul_one g).symm
    let hS : ∀ x : U, x ∈ (⊤ : Subgroup U) ↔ f x = 1 := fun _ => by simp [f]
    Twist.toOriginal c
      (Twist.namedKernelEquiv c f continuous_const hG ⊤ hS ⟨x, by simp⟩).val = x := by sorry

-- test: Twist.namedKernelEquiv.test_identity_bot
example (c : Z1 G U) (x : (⊥ : Subgroup U)) :
    let hS : ∀ x : U, x ∈ (⊥ : Subgroup U) ↔ MonoidHom.id U x = 1 := fun _ => by simp
    Twist.toOriginal c
      (Twist.namedKernelEquiv c (MonoidHom.id U) continuous_id
        (fun (_ : G) _ => rfl) ⊥ hS x).val = 1 := by sorry

-- test: Twist.namedKernelEquiv.test_wrong_subgroup_rejected
example (f : U →* V) (S : Subgroup U) (x : U) (hx : x ∈ S) (hbad : f x ≠ 1) :
    ¬ (∀ y : U, y ∈ S ↔ f y = 1) := by sorry

variable [IsTopologicalGroup U] [ContinuousSMul G U]
  [IsTopologicalGroup V] [ContinuousSMul G V]

-- test: Twist.namedKernelAction.test_neutral_twist
example (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (S : Subgroup U) (hS : ∀ x : U, x ∈ S ↔ f x = 1) (g : G) (x : S) :
    (letI := Twist.namedKernelAction (1 : Z1 G U) f hf hG S hS
     (g • x).val = g • x.val) := by sorry

-- test: Twist.namedKernelAction.test_multiplication
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (S : Subgroup U) (hS : ∀ x : U, x ∈ S ↔ f x = 1) (g : G) (x y : S) :
    (letI := Twist.namedKernelAction c f hf hG S hS
     (g • (x * y)).val = (g • x).val * (g • y).val) := by sorry

-- test: Twist.namedKernelAction.test_noncommutative_inner_action
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (S : Subgroup U) (hS : ∀ x : U, x ∈ S ↔ f x = 1) (g : G) (x : S)
    (hbad : c g * (g • x.val) * (c g)⁻¹ ≠ g • x.val) :
    (letI := Twist.namedKernelAction c f hf hG S hS
     (g • x).val ≠ g • x.val) := by sorry

-- test: Twist.namedKernelAction.test_inner_action_witness
example :
    let U := Equiv.Perm (Fin 3)
    let G := ConjAct U
    letI : TopologicalSpace U := ⊥
    letI : TopologicalSpace G := ⊥
    letI : DiscreteTopology U := ⟨rfl⟩
    letI : DiscreteTopology G := ⟨rfl⟩
    letI : IsTopologicalGroup U := inferInstance
    letI : ContinuousSMul G U := ⟨continuous_of_discreteTopology⟩
    let c : Z1 G U := Z1.coboundary (Equiv.swap (0 : Fin 3) 1)
    let g : G := ConjAct.toConjAct (Equiv.swap (1 : Fin 3) 2)
    let x : U := Equiv.swap (0 : Fin 3) 1
    c g * (g • x) * (c g)⁻¹ ≠ g • x := by sorry

-- test: H1.namedKernelEquiv.test_neutral_class
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (S : Subgroup U) (hS : ∀ x : U, x ∈ S ↔ f x = 1) :
    (letI := Twist.namedKernelAction c f hf hG S hS
     letI := Twist.namedKernelContinuousSMul c f hf hG S hS
     letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     H1.namedKernelEquiv c f hf hG S hS (H1.mk (1 : Z1 G S)) = 1) := by sorry

-- test: H1.namedKernelEquiv.test_inverse_on_classes
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (S : Subgroup U) (hS : ∀ x : U, x ∈ S ↔ f x = 1) :
    (letI := Twist.namedKernelAction c f hf hG S hS
     letI := Twist.namedKernelContinuousSMul c f hf hG S hS
     letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     ∀ a : H1 G S, (H1.namedKernelEquiv c f hf hG S hS).symm
       (H1.namedKernelEquiv c f hf hG S hS a) = a) := by sorry

-- test: H1.namedKernelEquiv.test_repointed_non_neutral
example (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (S : Subgroup U) (hS : ∀ x : U, x ∈ S ↔ f x = 1)
    (hsur : Function.Surjective f) (hfc : H1.mk (Z1.map f hf hG c) ≠ 1) :
    (letI := Twist.namedKernelAction c f hf hG S hS
     letI := Twist.namedKernelContinuousSMul c f hf hG S hS
     letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     (1 : H1 G U) ∉ Set.range (fun b => H1.twistEquiv c
       (H1.map (G := G) (U := S) (U' := Twist c)
         (show S →* Twist c from S.subtype)
         continuous_subtype_val (fun g x => by
           change (show Twist c from (g • x).val) = g • (show Twist c from x.val)
           rw [Twist.smul_def]
           exact Twist.namedKernelAction_value c f hf hG S hS g x) b))) := by sorry

end NamedKernelTests
end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section EmbeddedKernel
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]
  {V : Type*} [Group V] [TopologicalSpace V] [MulDistribMulAction G V]
  {A : Type*} [Group A] [TopologicalSpace A]
variable (c : Z1 G U) (f : U →* V) (hf : Continuous f)
  (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
  (i : A →* U) (hi : Topology.IsEmbedding i)
  (hK : ∀ x : U, x ∈ i.range ↔ f x = 1)

/-- The algebraic range equivalence is reused from Mathlib; exactness identifies its target. -/
def Twist.embeddedKernelEquiv (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (i : A →* U) (hi : Topology.IsEmbedding i)
    (hK : ∀ x : U, x ∈ i.range ↔ f x = 1) : A ≃* (Twist.map c f hf hG).ker := by sorry

lemma Twist.embeddedKernelEquiv_apply (x : A) :
    Twist.toOriginal c (Twist.embeddedKernelEquiv c f hf hG i hi hK x).val = i x := by sorry

lemma Twist.embeddedKernelEquiv_symm_apply (x : (Twist.map c f hf hG).ker) :
    i ((Twist.embeddedKernelEquiv c f hf hG i hi hK).symm x) =
      Twist.toOriginal c x.val := by sorry

lemma Twist.embeddedKernelEquiv_continuous :
    Continuous (Twist.embeddedKernelEquiv c f hf hG i hi hK) := by sorry

lemma Twist.embeddedKernelEquiv_symm_continuous :
    Continuous (Twist.embeddedKernelEquiv c f hf hG i hi hK).symm := by sorry

@[instance_reducible]
def Twist.embeddedKernelAction (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (i : A →* U) (hi : Topology.IsEmbedding i)
    (hK : ∀ x : U, x ∈ i.range ↔ f x = 1)
    [IsTopologicalGroup U] [ContinuousSMul G U]
    [IsTopologicalGroup V] [ContinuousSMul G V] : MulDistribMulAction G A := by sorry

variable [IsTopologicalGroup U] [ContinuousSMul G U]
  [IsTopologicalGroup V] [ContinuousSMul G V]

lemma Twist.embeddedKernelAction_value (g : G) (x : A) :
    (letI := Twist.embeddedKernelAction c f hf hG i hi hK
     i (g • x) = c g * (g • i x) * (c g)⁻¹) := by sorry

lemma Twist.embeddedKernelEquiv_smul (g : G) (x : A) :
    (letI := Twist.embeddedKernelAction c f hf hG i hi hK
     letI := Twist.kernelAction c f hf hG
     Twist.embeddedKernelEquiv c f hf hG i hi hK (g • x) =
       g • Twist.embeddedKernelEquiv c f hf hG i hi hK x) := by sorry

lemma Twist.embeddedKernelContinuousSMul :
    (letI := Twist.embeddedKernelAction c f hf hG i hi hK
     ContinuousSMul G A) := by sorry

variable [IsTopologicalGroup A]

def H1.embeddedKernelEquiv (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (i : A →* U) (hi : Topology.IsEmbedding i)
    (hK : ∀ x : U, x ∈ i.range ↔ f x = 1) :
    (letI := Twist.embeddedKernelAction c f hf hG i hi hK
     letI := Twist.embeddedKernelContinuousSMul c f hf hG i hi hK
     letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     H1 G A ≃ H1 G (Twist.map c f hf hG).ker) := by sorry

lemma H1.embeddedKernelEquiv_one :
    (letI := Twist.embeddedKernelAction c f hf hG i hi hK
     letI := Twist.embeddedKernelContinuousSMul c f hf hG i hi hK
     letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     H1.embeddedKernelEquiv c f hf hG i hi hK 1 = 1) := by sorry

/-- The actual inclusion on continuous gauge classes, with domain carrying the transported action. -/
def H1.embeddedKernelInclusion (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
    (i : A →* U) (hi : Topology.IsEmbedding i)
    (hK : ∀ x : U, x ∈ i.range ↔ f x = 1) :
    (letI := Twist.embeddedKernelAction c f hf hG i hi hK
     letI := Twist.embeddedKernelContinuousSMul c f hf hG i hi hK
     H1 G A → H1 G (Twist c)) := by sorry

lemma H1.embeddedKernelEquiv_inclusion :
    (letI := Twist.embeddedKernelAction c f hf hG i hi hK
     letI := Twist.embeddedKernelContinuousSMul c f hf hG i hi hK
     letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     ∀ a : H1 G A,
     H1.twistedKernelInclusion c f hf hG (H1.embeddedKernelEquiv c f hf hG i hi hK a) =
       H1.embeddedKernelInclusion c f hf hG i hi hK a) := by sorry

lemma H1.embeddedKernelInclusion_range :
    (letI := Twist.embeddedKernelAction c f hf hG i hi hK
     letI := Twist.kernelAction c f hf hG
     Set.range (H1.embeddedKernelInclusion c f hf hG i hi hK) =
       Set.range (H1.twistedKernelInclusion c f hf hG)) := by sorry

lemma H1.embeddedKernelInclusion_mapped_range_iff (hsur : Function.Surjective f) :
    (letI := Twist.embeddedKernelAction c f hf hG i hi hK
     ∀ a : H1 G (Twist c),
     a ∈ Set.range (H1.embeddedKernelInclusion c f hf hG i hi hK) ↔
       H1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
         (Twist.map_smul c f hf hG) a = 1) := by sorry

lemma H1.embeddedKernelInclusion_fibre_range_iff (hsur : Function.Surjective f) :
    (letI := Twist.embeddedKernelAction c f hf hG i hi hK
     ∀ a : H1 G U,
     a ∈ Set.range (fun b => H1.twistEquiv c
       (H1.embeddedKernelInclusion c f hf hG i hi hK b)) ↔
       H1.map f hf hG a = H1.mk (Z1.map f hf hG c)) := by sorry

lemma H1.embeddedKernelEquiv_mk :
    (letI := Twist.embeddedKernelAction c f hf hG i hi hK
     letI := Twist.embeddedKernelContinuousSMul c f hf hG i hi hK
     letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     ∀ d : Z1 G A,
     H1.embeddedKernelEquiv c f hf hG i hi hK (H1.mk d) =
       H1.mk (Z1.map (Twist.embeddedKernelEquiv c f hf hG i hi hK).toMonoidHom
         (Twist.embeddedKernelEquiv_continuous c f hf hG i hi hK)
         (Twist.embeddedKernelEquiv_smul c f hf hG i hi hK) d)) := by sorry

lemma H1.embeddedKernelInclusion_mk :
    (letI := Twist.embeddedKernelAction c f hf hG i hi hK
     letI := Twist.embeddedKernelContinuousSMul c f hf hG i hi hK
     ∀ d : Z1 G A,
     H1.embeddedKernelInclusion c f hf hG i hi hK (H1.mk d) =
       H1.mk (Z1.map (G := G) (U' := Twist c) (show A →* Twist c from i)
         hi.continuous (fun g x => by
           change (show Twist c from i (g • x)) = g • (show Twist c from i x)
           rw [Twist.smul_def]
           exact Twist.embeddedKernelAction_value c f hf hG i hi hK g x) d)) := by sorry

lemma H1.embeddedKernelInclusion_quotient_range_iff :
    (letI := Twist.embeddedKernelAction c f hf hG i hi hK
     letI := Twist.kernelAction c f hf hG
     letI := Twist.quotientAction c f hf hG
     letI := Twist.quotientContinuousSMul c f hf hG
     ∀ a : H1 G (Twist c),
     a ∈ Set.range (H1.embeddedKernelInclusion c f hf hG i hi hK) ↔
       H1.twistedQuotient c f hf hG a = 1) := by sorry

end EmbeddedKernel
end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section EmbeddedKernelTests
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [MulDistribMulAction G U]
  {V : Type*} [Group V] [TopologicalSpace V] [MulDistribMulAction G V]
  {A : Type*} [Group A] [TopologicalSpace A]

-- test: embedded_kernel_wrong_image
example (i : A →* U) (f : U →* V) (x : U) (hx : f x = 1) (hbad : x ∉ i.range) :
    ¬ (∀ y : U, y ∈ i.range ↔ f y = 1) := by sorry

-- test: embedded_kernel_noninjective
example (i : A →* U) (x y : A) (hxy : x ≠ y) (heq : i x = i y) :
    ¬ Topology.IsEmbedding i := by sorry

-- test: embedded_kernel_inverse_topology
example (e : A ≃* U) (hbad : ¬ Continuous e.symm) :
    ¬ Topology.IsEmbedding e := by sorry

-- test: embedded_kernel_constant_nonsurjective
example (c : Z1 G U) (v : V) (hv : v ≠ 1) :
    ¬ Function.Surjective (1 : U →* V) ∧
      ∀ x : U, Twist.toOriginal c
        (Twist.embeddedKernelEquiv c (1 : U →* V) continuous_const
          (fun g _ => (smul_one g).symm) (MonoidHom.id U) Topology.IsEmbedding.id
          (fun y => by simp) x).val = x := by sorry

variable [IsTopologicalGroup U] [ContinuousSMul G U]
  [IsTopologicalGroup V] [ContinuousSMul G V] [IsTopologicalGroup A]
variable (c : Z1 G U) (f : U →* V) (hf : Continuous f)
  (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)
  (i : A →* U) (hi : Topology.IsEmbedding i)
  (hK : ∀ x : U, x ∈ i.range ↔ f x = 1)

-- test: embedded_kernel_neutral_action
example (g : G) (x : A) :
    (letI := Twist.embeddedKernelAction (1 : Z1 G U) f hf hG i hi hK
     i (g • x) = g • i x) := by sorry

-- test: embedded_kernel_inner_action_order
example (g : G) (x : A) (hbad : c g * (g • i x) * (c g)⁻¹ ≠ g • i x) :
    (letI := Twist.embeddedKernelAction c f hf hG i hi hK
     i (g • x) ≠ g • i x) := by sorry

-- test: embedded_kernel_h1_inverse
example :
    (letI := Twist.embeddedKernelAction c f hf hG i hi hK
     letI := Twist.embeddedKernelContinuousSMul c f hf hG i hi hK
     letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     ∀ a : H1 G A, (H1.embeddedKernelEquiv c f hf hG i hi hK).symm
       (H1.embeddedKernelEquiv c f hf hG i hi hK a) = a) := by sorry

-- test: embedded_kernel_repointed_non_neutral
example (hsur : Function.Surjective f) (hfc : H1.mk (Z1.map f hf hG c) ≠ 1) :
    (letI := Twist.embeddedKernelAction c f hf hG i hi hK
     (1 : H1 G U) ∉ Set.range (fun b => H1.twistEquiv c
       (H1.embeddedKernelInclusion c f hf hG i hi hK b))) := by sorry

-- test: embedded_kernel_action_multiplication
example (g : G) (x y : A) :
    (letI := Twist.embeddedKernelAction c f hf hG i hi hK
     i (g • (x * y)) = i (g • x) * i (g • y)) := by sorry

-- test: embedded_kernel_h1_neutral
example :
    (letI := Twist.embeddedKernelAction c f hf hG i hi hK
     letI := Twist.embeddedKernelContinuousSMul c f hf hG i hi hK
     letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     H1.embeddedKernelEquiv c f hf hG i hi hK (H1.mk (1 : Z1 G A)) = 1) := by sorry

-- test: embedded_kernel_h1_forward_inverse
example :
    (letI := Twist.embeddedKernelAction c f hf hG i hi hK
     letI := Twist.embeddedKernelContinuousSMul c f hf hG i hi hK
     letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     ∀ a : H1 G (Twist.map c f hf hG).ker,
       H1.embeddedKernelEquiv c f hf hG i hi hK
         ((H1.embeddedKernelEquiv c f hf hG i hi hK).symm a) = a) := by sorry

-- test: embedded_kernel_inclusion_neutral
example :
    (letI := Twist.embeddedKernelAction c f hf hG i hi hK
     letI := Twist.embeddedKernelContinuousSMul c f hf hG i hi hK
     H1.embeddedKernelInclusion c f hf hG i hi hK (H1.mk (1 : Z1 G A)) = 1) := by sorry

-- test: embedded_kernel_inclusion_killed
example :
    (letI := Twist.embeddedKernelAction c f hf hG i hi hK
     letI := Twist.embeddedKernelContinuousSMul c f hf hG i hi hK
     letI := Twist.kernelAction c f hf hG
     letI := Twist.quotientAction c f hf hG
     letI := Twist.quotientContinuousSMul c f hf hG
     ∀ a : H1 G A, H1.twistedQuotient c f hf hG
       (H1.embeddedKernelInclusion c f hf hG i hi hK a) = 1) := by sorry

end EmbeddedKernelTests
section InverseCoordinateTest
variable {G : Type*} [Group G] [TopologicalSpace G]
  {C : Type*} [CommGroup C] [TopologicalSpace C] [IsTopologicalGroup C]
  [MulDistribMulAction G C] (c : Z1 G C)

-- test: embedded_kernel_inverse_coordinate
example (x : C) (hx : x⁻¹ ≠ x) :
    let hK : ∀ y : C, y ∈ (invMonoidHom : C →* C).range ↔ (1 : C →* C) y = 1 :=
      fun y => ⟨fun _ => rfl, fun _ => ⟨y⁻¹, inv_inv y⟩⟩
    Twist.toOriginal c
      (Twist.embeddedKernelEquiv c (1 : C →* C) continuous_const
        (fun g _ => (smul_one g).symm) invMonoidHom (Homeomorph.inv C).isEmbedding hK x).val ≠ x := by sorry

end InverseCoordinateTest
end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section GaugeStabilizers
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]

lemma Z1.stabilizer_iff_twisted_fixed (c : Z1 G U) (x : U) :
    x ∈ MulAction.stabilizer U c ↔
      (Twist.toOriginal c).symm x ∈ H0 G (Twist c) := by sorry

def Twist.invariantStabilizerEquiv (c : Z1 G U) :
    H0 G (Twist c) ≃* MulAction.stabilizer U c := by sorry

lemma Twist.invariantStabilizerEquiv_apply (c : Z1 G U) (x : H0 G (Twist c)) :
    (Twist.invariantStabilizerEquiv c x).val = Twist.toOriginal c x.val := by sorry

lemma Twist.invariantStabilizerEquiv_symm_apply (c : Z1 G U)
    (x : MulAction.stabilizer U c) :
    ((Twist.invariantStabilizerEquiv c).symm x).val =
      (Twist.toOriginal c).symm x.val := by sorry

lemma Twist.invariantStabilizerEquiv_continuous (c : Z1 G U) :
    Continuous (Twist.invariantStabilizerEquiv c) := by sorry

lemma Twist.invariantStabilizerEquiv_symm_continuous (c : Z1 G U) :
    Continuous (Twist.invariantStabilizerEquiv c).symm := by sorry

lemma Z1.gauge_transporter_iff (c d : Z1 G U) (x : U) (hx : x • c = d) (y : U) :
    y • c = d ↔ x⁻¹ * y ∈ MulAction.stabilizer U c := by sorry

def Z1.gaugeTransporterEquiv (c d : Z1 G U) (x : U) (hx : x • c = d) :
    MulAction.stabilizer U c ≃ {y : U // y • c = d} := by sorry

lemma Z1.gaugeTransporterEquiv_apply (c d : Z1 G U) (x : U) (hx : x • c = d)
    (s : MulAction.stabilizer U c) :
    (Z1.gaugeTransporterEquiv c d x hx s).val = x * s.val := by sorry

lemma Z1.gaugeTransporterEquiv_symm_apply (c d : Z1 G U) (x : U) (hx : x • c = d)
    (y : {y : U // y • c = d}) :
    ((Z1.gaugeTransporterEquiv c d x hx).symm y).val = x⁻¹ * y.val := by sorry

lemma Z1.gaugeTransporterEquiv_continuous (c d : Z1 G U) (x : U) (hx : x • c = d) :
    Continuous (Z1.gaugeTransporterEquiv c d x hx) := by sorry

lemma Z1.gaugeTransporterEquiv_symm_continuous (c d : Z1 G U) (x : U) (hx : x • c = d) :
    Continuous (Z1.gaugeTransporterEquiv c d x hx).symm := by sorry

lemma Z1.gauge_witness_unique_iff (c d : Z1 G U) (x : U) (hx : x • c = d) :
    (∀ y : U, y • c = d → y = x) ↔ MulAction.stabilizer U c = ⊥ := by sorry

end GaugeStabilizers

section KernelInjectivity
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {A : Type*} [Group A] [TopologicalSpace A] [IsTopologicalGroup A]
  [MulDistribMulAction G A] [ContinuousSMul G A]
  {U : Type*} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V] [IsTopologicalGroup V]
  [MulDistribMulAction G V] [ContinuousSMul G V]

lemma Z1.kernel_gauge_projects_fixed (i : A →* U) (hi : Continuous i)
    (hiG : ∀ (g : G) (a : A), i (g • a) = g • i a)
    (f : U →* V) (_hf : Continuous f)
    (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
    (hzero : ∀ a : A, f (i a) = 1) (c d : Z1 G A) (x : U)
    (hx : x • Z1.map i hi hiG c = Z1.map i hi hiG d) :
    f x ∈ H0 G V := by sorry

lemma H1.kernelMap_injective_of_stabilizer_lifts (i : A →* U) (hi : Continuous i)
    (hiG : ∀ (g : G) (a : A), i (g • a) = g • i a) (hinj : Function.Injective i)
    (f : U →* V) (hf : Continuous f)
    (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
    (hK : ∀ u : U, u ∈ i.range ↔ f u = 1)
    (hlift : ∀ (c : Z1 G A) (v : H0 G V),
      ∃ t : MulAction.stabilizer U (Z1.map i hi hiG c), f t.val = v.val) :
    Function.Injective (H1.map i hi hiG) := by sorry

lemma H1.kernelMap_injective_of_fixed_trivial (i : A →* U) (hi : Continuous i)
    (hiG : ∀ (g : G) (a : A), i (g • a) = g • i a) (hinj : Function.Injective i)
    (f : U →* V) (hf : Continuous f)
    (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
    (hK : ∀ u : U, u ∈ i.range ↔ f u = 1)
    (hfix : H0 G V = ⊥) : Function.Injective (H1.map i hi hiG) := by sorry

end KernelInjectivity

section TwistedKernelInjectivity
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V] [IsTopologicalGroup V]
  [MulDistribMulAction G V] [ContinuousSMul G V]

lemma H1.twistedKernelInclusion_injective (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (u : U), f (g • u) = g • f u)
    (hfix : H0 G (Twist (Z1.map f hf hG c)) = ⊥) :
    (letI := Twist.kernelAction c f hf hG
     let := Twist.kernelContinuousSMul c f hf hG
     Function.Injective (H1.twistedKernelInclusion c f hf hG)) := by sorry

end TwistedKernelInjectivity

section EmbeddedKernelInjectivity
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V] [IsTopologicalGroup V]
  [MulDistribMulAction G V] [ContinuousSMul G V]
  {A : Type*} [Group A] [TopologicalSpace A] [IsTopologicalGroup A]

lemma H1.embeddedKernelInclusion_injective (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (u : U), f (g • u) = g • f u)
    (i : A →* U) (hi : Topology.IsEmbedding i)
    (hK : ∀ u : U, u ∈ i.range ↔ f u = 1)
    (hfix : H0 G (Twist (Z1.map f hf hG c)) = ⊥) :
    (letI := Twist.embeddedKernelAction c f hf hG i hi hK
     letI := Twist.embeddedKernelContinuousSMul c f hf hG i hi hK
     Function.Injective (H1.embeddedKernelInclusion c f hf hG i hi hK)) := by sorry

lemma H1.embeddedKernel_fibre_existsUnique (c : Z1 G U) (f : U →* V) (hf : Continuous f)
    (hG : ∀ (g : G) (u : U), f (g • u) = g • f u)
    (i : A →* U) (hi : Topology.IsEmbedding i)
    (hK : ∀ u : U, u ∈ i.range ↔ f u = 1) (hsur : Function.Surjective f)
    (hfix : H0 G (Twist (Z1.map f hf hG c)) = ⊥) :
    (letI := Twist.embeddedKernelAction c f hf hG i hi hK
     letI := Twist.embeddedKernelContinuousSMul c f hf hG i hi hK
     ∀ a : H1 G U,
     (∃! b : H1 G A, H1.twistEquiv c (H1.embeddedKernelInclusion c f hf hG i hi hK b) = a) ↔
       H1.map f hf hG a = H1.mk (Z1.map f hf hG c)) := by sorry

end EmbeddedKernelInjectivity
end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section GaugeStabilizerTests
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]

-- test: invariant_stabilizer_inverse
example (c : Z1 G U) (s : H0 G (Twist c)) :
    (Twist.invariantStabilizerEquiv c).symm (Twist.invariantStabilizerEquiv c s) = s := by sorry

-- test: invariant_stabilizer_multiplication
example (c : Z1 G U) (s t : H0 G (Twist c)) :
    (Twist.invariantStabilizerEquiv c (s * t)).val =
      (Twist.invariantStabilizerEquiv c s).val * (Twist.invariantStabilizerEquiv c t).val := by sorry

-- test: gauge_transporter_inverse
example (c d : Z1 G U) (x : U) (hx : x • c = d)
    (y : {y : U // y • c = d}) :
    Z1.gaugeTransporterEquiv c d x hx ((Z1.gaugeTransporterEquiv c d x hx).symm y) = y := by sorry

-- test: gauge_transporter_right_order
example (c d : Z1 G U) (x : U) (hx : x • c = d)
    (s : MulAction.stabilizer U c) (horder : x * s.val ≠ s.val * x) :
    (Z1.gaugeTransporterEquiv c d x hx s).val ≠ s.val * x := by sorry

-- test: gauge_transporter_continuous_roundtrip
example (c d : Z1 G U) (x : U) (hx : x • c = d) :
    Continuous ((Z1.gaugeTransporterEquiv c d x hx).symm ∘ Z1.gaugeTransporterEquiv c d x hx) := by sorry

-- test: gauge_witness_nonunique
example (c d : Z1 G U) (x : U) (hx : x • c = d)
    (s : MulAction.stabilizer U c) (hs : s.val ≠ 1) :
    ∃ y : U, y • c = d ∧ y ≠ x := by sorry

-- test: gauge_witness_unique
example (c d : Z1 G U) (x y : U) (hx : x • c = d)
    (hy : y • c = d) (hbot : MulAction.stabilizer U c = ⊥) : y = x := by sorry

-- test: neutral_stabilizer_fixed_points
example (x : U) : x ∈ MulAction.stabilizer U (1 : Z1 G U) ↔ x ∈ H0 G U := by sorry

end GaugeStabilizerTests

section KernelInjectivityTests
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {A : Type*} [Group A] [TopologicalSpace A] [IsTopologicalGroup A]
  [MulDistribMulAction G A] [ContinuousSMul G A]
  {U : Type*} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V] [IsTopologicalGroup V]
  [MulDistribMulAction G V] [ContinuousSMul G V]

-- test: kernel_neutral_reflection
example (i : A →* U) (hi : Continuous i)
    (hiG : ∀ (g : G) (a : A), i (g • a) = g • i a) (hinj : Function.Injective i)
    (f : U →* V) (hf : Continuous f)
    (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
    (hK : ∀ u : U, u ∈ i.range ↔ f u = 1) (hfix : H0 G V = ⊥) (a : H1 G A) :
    H1.map i hi hiG a = 1 ↔ a = 1 := by sorry

-- test: trivial_action_fixed_obstruction
example (htriv : ∀ (g : G) (v : V), g • v = v) (v : V) (hv : v ≠ 1) :
    H0 G V ≠ ⊥ := by sorry

end KernelInjectivityTests

section PermutationRegression
set_option maxHeartbeats 3000000
local notation "C3" => Multiplicative (ZMod 3)
local notation "S3" => Equiv.Perm (Fin 3)
local instance : TopologicalSpace C3 := ⊥
local instance : TopologicalSpace S3 := ⊥
local instance : DiscreteTopology C3 := ⟨rfl⟩
local instance : DiscreteTopology S3 := ⟨rfl⟩
local instance trivialC3Action : MulDistribMulAction C3 C3 :=
  { smul := fun _ x => x
    one_smul := fun _ => rfl
    mul_smul := fun _ _ _ => rfl
    smul_one := fun _ => rfl
    smul_mul := fun _ _ _ => rfl }
local instance : MulDistribMulAction C3 S3 :=
  { smul := fun _ x => x
    one_smul := fun _ => rfl
    mul_smul := fun _ _ _ => rfl
    smul_one := fun _ => rfl
    smul_mul := fun _ _ _ => rfl }
local instance (priority := 3000) : SMul C3 C3 := trivialC3Action.toSMul
local instance : ContinuousSMul C3 C3 := ⟨continuous_snd⟩
local instance : ContinuousSMul C3 S3 := ⟨continuous_snd⟩

-- test: injective_coefficients_noninjective_h1
example :
    let p : S3 := Equiv.swap 0 1 * Equiv.swap 1 2
    let i : C3 →* S3 :=
      { toFun := fun a => if a = 1 then 1 else if a = Multiplicative.ofAdd (1 : ZMod 3) then p else p⁻¹
        map_one' := by decide
        map_mul' := by decide }
    let c : Z1 C3 C3 := ⟨id, continuous_id, by intro a b; rfl⟩
    let d : Z1 C3 C3 := ⟨fun a => a⁻¹, continuous_of_discreteTopology, by
      intro a b; exact mul_inv_rev a b |>.trans (mul_comm _ _)⟩
    Function.Injective i ∧ H1.mk c ≠ H1.mk d ∧
      H1.map i continuous_of_discreteTopology (fun _ _ => rfl) (H1.mk c) =
        H1.map i continuous_of_discreteTopology (fun _ _ => rfl) (H1.mk d) := by sorry

-- test: concrete_gauge_nonunique_noncommutative
example :
    let c : Z1 C3 S3 := ⟨fun a => if a = 1 then 1 else
      if a = Multiplicative.ofAdd (1 : ZMod 3) then Equiv.swap 0 1 * Equiv.swap 1 2
      else (Equiv.swap 0 1 * Equiv.swap 1 2)⁻¹,
      continuous_of_discreteTopology, by decide⟩
    (1 : S3) • c = c ∧ (Equiv.swap (0 : Fin 3) 1 * Equiv.swap 1 2) • c = c ∧
      (1 : S3) ≠ Equiv.swap (0 : Fin 3) 1 * Equiv.swap 1 2 := by sorry

end PermutationRegression
end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U]
  [MulDistribMulAction G U]
  {V : Type*} [Group V] [TopologicalSpace V]
  [MulDistribMulAction G V]
  (K : Subgroup U) [MulDistribMulAction G K] [ContinuousSMul G K]
  (f : U →* V) (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
  (hK : ∀ u : U, u ∈ K ↔ f u = 1)
  (hKG : ∀ (g : G) (k : K), (g • k).val = g • k.val)

def Z1.kernelGauge [IsTopologicalGroup U] [ContinuousSMul G U]
    (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
    (hK : ∀ u : U, u ∈ K ↔ f u = 1)
    (hKG : ∀ (g : G) (k : K), (g • k).val = g • k.val) (u : U) (hu : f u ∈ H0 G V) (c : Z1 G K) : Z1 G K := by sorry

end

section
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [topU : IsTopologicalGroup U]
  [MulDistribMulAction G U] [contU : ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V]
  [MulDistribMulAction G V]
  (K : Subgroup U) [MulDistribMulAction G K] [ContinuousSMul G K]
  (f : U →* V) (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
  (hK : ∀ u : U, u ∈ K ↔ f u = 1)
  (hKG : ∀ (g : G) (k : K), (g • k).val = g • k.val)

lemma Z1.kernelGauge_apply (u : U) (hu : f u ∈ H0 G V) (c : Z1 G K) (g : G) :
    (Z1.kernelGauge K f hfG hK hKG u hu c g).val = u * (c g).val * (g • u)⁻¹ := by sorry

end

section
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [topU : IsTopologicalGroup U]
  [MulDistribMulAction G U] [contU : ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V]
  [MulDistribMulAction G V]
  (K : Subgroup U) [MulDistribMulAction G K] [ContinuousSMul G K]
  (f : U →* V) (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
  (hK : ∀ u : U, u ∈ K ↔ f u = 1)
  (hKG : ∀ (g : G) (k : K), (g • k).val = g • k.val)

lemma Z1.kernelGauge_one (c : Z1 G K) :
    Z1.kernelGauge K f hfG hK hKG 1 (by simp) c = c := by sorry

end

section
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [topU : IsTopologicalGroup U]
  [MulDistribMulAction G U] [contU : ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V]
  [MulDistribMulAction G V]
  (K : Subgroup U) [MulDistribMulAction G K] [ContinuousSMul G K]
  (f : U →* V) (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
  (hK : ∀ u : U, u ∈ K ↔ f u = 1)
  (hKG : ∀ (g : G) (k : K), (g • k).val = g • k.val)

lemma Z1.kernelGauge_mul (u v : U) (hu : f u ∈ H0 G V) (hv : f v ∈ H0 G V)
    (c : Z1 G K) :
    Z1.kernelGauge K f hfG hK hKG (u*v) (by simpa using (H0 G V).mul_mem hu hv) c =
      Z1.kernelGauge K f hfG hK hKG u hu (Z1.kernelGauge K f hfG hK hKG v hv c) := by sorry

end

section
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [topU : IsTopologicalGroup U]
  [MulDistribMulAction G U] [contU : ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V]
  [MulDistribMulAction G V]
  (K : Subgroup U) [MulDistribMulAction G K] [ContinuousSMul G K]
  (f : U →* V) (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
  (hK : ∀ u : U, u ∈ K ↔ f u = 1)
  (hKG : ∀ (g : G) (k : K), (g • k).val = g • k.val)

lemma Z1.kernelGauge_gauge (u : U) (hu : f u ∈ H0 G V) (a : K) (c : Z1 G K) :
    Z1.kernelGauge K f hfG hK hKG u hu (a • c) =
      (⟨u * a.val * u⁻¹, (hK _).mpr (by
        rw [_root_.map_mul, _root_.map_mul, _root_.map_inv, (hK _).mp a.property]
        simp)⟩ : K) • Z1.kernelGauge K f hfG hK hKG u hu c := by sorry

end

section
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U]
  [MulDistribMulAction G U]
  {V : Type*} [Group V] [TopologicalSpace V]
  [MulDistribMulAction G V]
  (K : Subgroup U) [MulDistribMulAction G K] [ContinuousSMul G K]
  (f : U →* V) (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
  (hK : ∀ u : U, u ∈ K ↔ f u = 1)
  (hKG : ∀ (g : G) (k : K), (g • k).val = g • k.val)

@[instance_reducible]
def H1.kernelPreimageAction [IsTopologicalGroup U] [ContinuousSMul G U]
    (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
    (hK : ∀ u : U, u ∈ K ↔ f u = 1)
    (hKG : ∀ (g : G) (k : K), (g • k).val = g • k.val) : MulAction ((H0 G V).comap f) (H1 G K) := by sorry

end

section
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [topU : IsTopologicalGroup U]
  [MulDistribMulAction G U] [contU : ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V]
  [MulDistribMulAction G V]
  (K : Subgroup U) [MulDistribMulAction G K] [ContinuousSMul G K]
  (f : U →* V) (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
  (hK : ∀ u : U, u ∈ K ↔ f u = 1)
  (hKG : ∀ (g : G) (k : K), (g • k).val = g • k.val)

lemma H1.kernelPreimageAction_mk (u : (H0 G V).comap f) (c : Z1 G K) :
    (letI := H1.kernelPreimageAction K f hfG hK hKG
     u • H1.mk c = H1.mk (Z1.kernelGauge K f hfG hK hKG u.val (show f u.val ∈ H0 G V from u.property) c)) := by sorry

end

section
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [topU : IsTopologicalGroup U]
  [MulDistribMulAction G U] [contU : ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V]
  [MulDistribMulAction G V]
  (K : Subgroup U) [MulDistribMulAction G K] [ContinuousSMul G K]
  (f : U →* V) (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
  (hK : ∀ u : U, u ∈ K ↔ f u = 1)
  (hKG : ∀ (g : G) (k : K), (g • k).val = g • k.val)

lemma H1.kernelPreimageAction_kernel (u : (H0 G V).comap f) (hu : f u.val = 1)
    (a : H1 G K) :
    (letI := H1.kernelPreimageAction K f hfG hK hKG
     u • a = a) := by sorry

end

section
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [topU : IsTopologicalGroup U]
  [MulDistribMulAction G U] [contU : ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V]
  [MulDistribMulAction G V]
  (K : Subgroup U) [MulDistribMulAction G K] [ContinuousSMul G K]
  (f : U →* V) (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
  (hK : ∀ u : U, u ∈ K ↔ f u = 1)
  (hKG : ∀ (g : G) (k : K), (g • k).val = g • k.val)

def H0.preimageProjection : (H0 G V).comap f →* H0 G V := by sorry

end

section
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [topU : IsTopologicalGroup U]
  [MulDistribMulAction G U] [contU : ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V]
  [MulDistribMulAction G V]
  (K : Subgroup U) [MulDistribMulAction G K] [ContinuousSMul G K]
  (f : U →* V) (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
  (hK : ∀ u : U, u ∈ K ↔ f u = 1)
  (hKG : ∀ (g : G) (k : K), (g • k).val = g • k.val)

lemma H0.preimageProjection_apply (u : (H0 G V).comap f) :
    (H0.preimageProjection (G := G) f u).val = f u.val := by sorry

end

section
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [topU : IsTopologicalGroup U]
  [MulDistribMulAction G U] [contU : ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V]
  [MulDistribMulAction G V]
  (K : Subgroup U) [MulDistribMulAction G K] [ContinuousSMul G K]
  (f : U →* V) (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
  (hK : ∀ u : U, u ∈ K ↔ f u = 1)
  (hKG : ∀ (g : G) (k : K), (g • k).val = g • k.val)

lemma H0.preimageProjection_mem_ker (u : (H0 G V).comap f) :
    u ∈ (H0.preimageProjection (G := G) f).ker ↔ f u.val = 1 := by sorry

end

section
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [topU : IsTopologicalGroup U]
  [MulDistribMulAction G U] [contU : ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V]
  [MulDistribMulAction G V]
  (K : Subgroup U) [MulDistribMulAction G K] [ContinuousSMul G K]
  (f : U →* V) (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
  (hK : ∀ u : U, u ∈ K ↔ f u = 1)
  (hKG : ∀ (g : G) (k : K), (g • k).val = g • k.val)

lemma H0.preimageProjection_surjective (hs : Function.Surjective f) :
    Function.Surjective (H0.preimageProjection (G := G) f) := by sorry

end

section
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [topU : IsTopologicalGroup U]
  [MulDistribMulAction G U] [contU : ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V]
  [MulDistribMulAction G V]
  (K : Subgroup U) [MulDistribMulAction G K] [ContinuousSMul G K]
  (f : U →* V) (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
  (hK : ∀ u : U, u ∈ K ↔ f u = 1)
  (hKG : ∀ (g : G) (k : K), (g • k).val = g • k.val)

lemma H1.kernelPreimageAction_perm_kernel :
    (letI := H1.kernelPreimageAction K f hfG hK hKG
     (H0.preimageProjection (G := G) f).ker ≤
       (MulAction.toPermHom ((H0 G V).comap f) (H1 G K)).ker) := by sorry

end

section
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U]
  [MulDistribMulAction G U]
  {V : Type*} [Group V] [TopologicalSpace V]
  [MulDistribMulAction G V]
  (K : Subgroup U) [MulDistribMulAction G K] [ContinuousSMul G K]
  (f : U →* V) (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
  (hK : ∀ u : U, u ∈ K ↔ f u = 1)
  (hKG : ∀ (g : G) (k : K), (g • k).val = g • k.val)

@[instance_reducible]
def H1.kernelInvariantAction [IsTopologicalGroup U] [ContinuousSMul G U]
    (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
    (hK : ∀ u : U, u ∈ K ↔ f u = 1)
    (hKG : ∀ (g : G) (k : K), (g • k).val = g • k.val) (hs : Function.Surjective f) :
    MulAction (H0 G V) (H1 G K) := by sorry

end

section
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [topU : IsTopologicalGroup U]
  [MulDistribMulAction G U] [contU : ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V]
  [MulDistribMulAction G V]
  (K : Subgroup U) [MulDistribMulAction G K] [ContinuousSMul G K]
  (f : U →* V) (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
  (hK : ∀ u : U, u ∈ K ↔ f u = 1)
  (hKG : ∀ (g : G) (k : K), (g • k).val = g • k.val)

lemma H1.kernelInvariantAction_lift (hs : Function.Surjective f)
    (u : (H0 G V).comap f) (a : H1 G K) :
    (letI := H1.kernelInvariantAction K f hfG hK hKG hs
     H0.preimageProjection (G := G) f u • a =
       letI := H1.kernelPreimageAction K f hfG hK hKG
       u • a) := by sorry

end

section
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [topU : IsTopologicalGroup U]
  [MulDistribMulAction G U] [contU : ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V]
  [MulDistribMulAction G V]
  (K : Subgroup U) [MulDistribMulAction G K] [ContinuousSMul G K]
  (f : U →* V) (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
  (hK : ∀ u : U, u ∈ K ↔ f u = 1)
  (hKG : ∀ (g : G) (k : K), (g • k).val = g • k.val)

lemma H1.kernelInvariantAction_mk (hs : Function.Surjective f)
    (v : H0 G V) (u : U) (hu : f u = v.val) (c : Z1 G K) :
    (letI := H1.kernelInvariantAction K f hfG hK hKG hs
     v • H1.mk c = H1.mk (Z1.kernelGauge K f hfG hK hKG u
       (by rw [hu]; exact v.property) c)) := by sorry

end

section
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [topU : IsTopologicalGroup U]
  [MulDistribMulAction G U] [contU : ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V]
  [MulDistribMulAction G V]
  (K : Subgroup U) [MulDistribMulAction G K] [ContinuousSMul G K]
  (f : U →* V) (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
  (hK : ∀ u : U, u ∈ K ↔ f u = 1)
  (hKG : ∀ (g : G) (k : K), (g • k).val = g • k.val)

lemma H1.kernelInvariantAction_lift_independent (u w : U) (hu : f u ∈ H0 G V)
    (hw : f w ∈ H0 G V) (he : f u = f w) (c : Z1 G K) :
    H1.mk (Z1.kernelGauge K f hfG hK hKG u hu c) =
      H1.mk (Z1.kernelGauge K f hfG hK hKG w hw c) := by sorry

end

section
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [topU : IsTopologicalGroup U]
  [MulDistribMulAction G U] [contU : ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V]
  [MulDistribMulAction G V]
  (K : Subgroup U) [MulDistribMulAction G K] [ContinuousSMul G K]
  (f : U →* V) (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
  (hK : ∀ u : U, u ∈ K ↔ f u = 1)
  (hKG : ∀ (g : G) (k : K), (g • k).val = g • k.val)

lemma Z1.kernelGauge_inclusion (u : U) (hu : f u ∈ H0 G V) (c : Z1 G K) :
    Z1.map K.subtype continuous_subtype_val hKG
      (Z1.kernelGauge K f hfG hK hKG u hu c) =
      u • Z1.map K.subtype continuous_subtype_val hKG c := by sorry

end

section
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [topU : IsTopologicalGroup U]
  [MulDistribMulAction G U] [contU : ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V]
  [MulDistribMulAction G V]
  (K : Subgroup U) [MulDistribMulAction G K] [ContinuousSMul G K]
  (f : U →* V) (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
  (hK : ∀ u : U, u ∈ K ↔ f u = 1)
  (hKG : ∀ (g : G) (k : K), (g • k).val = g • k.val)

lemma H1.kernelInvariantAction_inclusion (hs : Function.Surjective f)
    (v : H0 G V) (a : H1 G K) :
    (letI := H1.kernelInvariantAction K f hfG hK hKG hs
     H1.map K.subtype continuous_subtype_val hKG (v • a) =
       H1.map K.subtype continuous_subtype_val hKG a) := by sorry

end

section
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [topU : IsTopologicalGroup U]
  [MulDistribMulAction G U] [contU : ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V]
  [MulDistribMulAction G V]
  (K : Subgroup U) [MulDistribMulAction G K] [ContinuousSMul G K]
  (f : U →* V) (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
  (hK : ∀ u : U, u ∈ K ↔ f u = 1)
  (hKG : ∀ (g : G) (k : K), (g • k).val = g • k.val)

lemma H1.kernelInvariantAction_fibre_iff (hs : Function.Surjective f) (a b : H1 G K) :
    (letI := H1.kernelInvariantAction K f hfG hK hKG hs
     H1.map K.subtype continuous_subtype_val hKG a =
       H1.map K.subtype continuous_subtype_val hKG b ↔ ∃ v : H0 G V, v • a = b) := by sorry

end

end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section KernelInvariantActionTests
set_option linter.unusedSectionVars false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V]
  [MulDistribMulAction G V]
  (K : Subgroup U) [MulDistribMulAction G K] [ContinuousSMul G K]
  (f : U →* V) (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
  (hK : ∀ u : U, u ∈ K ↔ f u = 1)
  (hKG : ∀ (g : G) (k : K), (g • k).val = g • k.val)

-- test: kernel_gauge_identity
example (c : Z1 G K) : Z1.kernelGauge K f hfG hK hKG 1 (by simp) c = c := by sorry

-- test: kernel_gauge_native_inclusion
example (u : U) (hu : f u ∈ H0 G V) (c : Z1 G K) :
    Z1.map K.subtype continuous_subtype_val hKG (Z1.kernelGauge K f hfG hK hKG u hu c) =
      u • Z1.map K.subtype continuous_subtype_val hKG c := by sorry

-- test: kernel_gauge_trivial_value
example (u : U) (hu : f u ∈ H0 G V) (g : G) :
    (Z1.kernelGauge K f hfG hK hKG u hu (1 : Z1 G K) g).val = u * (g • u)⁻¹ := by sorry

-- test: preimage_action_representative
example (u : (H0 G V).comap f) (c : Z1 G K) :
    (letI := H1.kernelPreimageAction K f hfG hK hKG
     u • H1.mk c = H1.mk (Z1.kernelGauge K f hfG hK hKG u.val
       (show f u.val ∈ H0 G V from u.property) c)) := by sorry

-- test: preimage_kernel_acts_trivially
example (u : (H0 G V).comap f) (hu : f u.val = 1) (a : H1 G K) :
    (letI := H1.kernelPreimageAction K f hfG hK hKG; u • a = a) := by sorry

-- test: preimage_inverse_roundtrip
example (u : (H0 G V).comap f) (a : H1 G K) :
    (letI := H1.kernelPreimageAction K f hfG hK hKG; u⁻¹ • (u • a) = a) := by sorry

-- test: invariant_projection_identity
example : H0.preimageProjection (G := G) f 1 = 1 := by sorry

-- test: invariant_projection_exact_kernel
example (u : (H0 G V).comap f) :
    u ∈ (H0.preimageProjection (G := G) f).ker ↔ u.val ∈ K := by sorry

-- test: invariant_projection_lifts
example (hs : Function.Surjective f) (v : H0 G V) :
    ∃ u : (H0 G V).comap f, H0.preimageProjection (G := G) f u = v := by sorry

-- test: invariant_action_identity
example (hs : Function.Surjective f) (a : H1 G K) :
    (letI := H1.kernelInvariantAction K f hfG hK hKG hs; (1 : H0 G V) • a = a) := by sorry

-- test: invariant_action_ambient_constant
example (hs : Function.Surjective f) (v : H0 G V) (a : H1 G K) :
    (letI := H1.kernelInvariantAction K f hfG hK hKG hs
     H1.map K.subtype continuous_subtype_val hKG (v • a) =
       H1.map K.subtype continuous_subtype_val hKG a) := by sorry

end KernelInvariantActionTests
end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section SignKernelRegression
set_option maxHeartbeats 3000000
local notation "C3" => Multiplicative (ZMod 3)
local notation "S3" => Equiv.Perm (Fin 3)
local notation "Ksign" => MonoidHom.ker (Equiv.Perm.sign : S3 →* ℤˣ)
local instance : TopologicalSpace C3 := ⊥
local instance : TopologicalSpace S3 := ⊥
local instance : TopologicalSpace ℤˣ := ⊥
local instance : DiscreteTopology C3 := ⟨rfl⟩
local instance : DiscreteTopology S3 := ⟨rfl⟩
local instance : DiscreteTopology ℤˣ := ⟨rfl⟩
local instance : MulDistribMulAction C3 S3 :=
  { smul := fun _ x => x
    one_smul := fun _ => rfl
    mul_smul := fun _ _ _ => rfl
    smul_one := fun _ => rfl
    smul_mul := fun _ _ _ => rfl }
local instance : MulDistribMulAction C3 ℤˣ :=
  { smul := fun _ x => x
    one_smul := fun _ => rfl
    mul_smul := fun _ _ _ => rfl
    smul_one := fun _ => rfl
    smul_mul := fun _ _ _ => rfl }
local instance : MulDistribMulAction C3 Ksign :=
  { smul := fun _ x => x
    one_smul := fun _ => rfl
    mul_smul := fun _ _ _ => rfl
    smul_one := fun _ => rfl
    smul_mul := fun _ _ _ => rfl }
local instance : ContinuousSMul C3 S3 := ⟨continuous_snd⟩
local instance : ContinuousSMul C3 Ksign := ⟨continuous_snd⟩

-- test: odd_invariant_exchanges_distinct_kernel_classes
example :
    let p : S3 := Equiv.swap 0 1 * Equiv.swap 1 2
    let i : C3 →* S3 :=
      { toFun := fun a => if a = 1 then 1 else if a = Multiplicative.ofAdd (1 : ZMod 3) then p else p⁻¹
        map_one' := by decide
        map_mul' := by decide }
    let c : Z1 C3 Ksign := ⟨fun a => ⟨i a,(by decide : ∀ a : C3, Equiv.Perm.sign (i a) = 1) a⟩,
      continuous_of_discreteTopology, by intro a b; apply Subtype.ext; exact i.map_mul a b⟩
    let d : Z1 C3 Ksign := ⟨fun a => ⟨i a⁻¹,(by decide : ∀ a : C3, Equiv.Perm.sign (i a) = 1) a⁻¹⟩,
      continuous_of_discreteTopology, by
        intro a b
        apply Subtype.ext
        exact (by decide : ∀ a b : C3, i ((a*b)⁻¹) = i a⁻¹ * i b⁻¹) a b⟩
    letI := H1.kernelInvariantAction (G := C3) Ksign Equiv.Perm.sign (fun _ _ => rfl)
      (fun _ => Iff.rfl) (fun _ _ => rfl) (Equiv.Perm.sign_surjective (Fin 3))
    H1.mk c ≠ H1.mk d ∧ (⟨-1,fun _ => rfl⟩ : H0 C3 ℤˣ) • H1.mk c = H1.mk d := by sorry

end SignKernelRegression
end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section KernelOrbitClassification
set_option linter.unusedSectionVars false
set_option linter.style.haveILetI false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V] [MulDistribMulAction G V]
  (K : Subgroup U) [MulDistribMulAction G K] [ContinuousSMul G K]
  (f : U →* V) (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
  (hK : ∀ u : U, u ∈ K ↔ f u = 1)
  (hKG : ∀ (g : G) (k : K), (g • k).val = g • k.val)

def H1.kernelOrbitImageEquiv (hs : Function.Surjective f) :
    (letI := H1.kernelInvariantAction K f hfG hK hKG hs
     MulAction.orbitRel.Quotient (H0 G V) (H1 G K) ≃
       Set.range (H1.map K.subtype continuous_subtype_val hKG)) := by sorry

lemma H1.kernelOrbitImageEquiv_mk (hs : Function.Surjective f) (a : H1 G K) :
    (letI := H1.kernelInvariantAction K f hfG hK hKG hs
     (H1.kernelOrbitImageEquiv K f hfG hK hKG hs (Quotient.mk'' a)).val =
       H1.map K.subtype continuous_subtype_val hKG a) := by sorry

lemma H1.kernelOrbitImageEquiv_symm_mk (hs : Function.Surjective f) (a : H1 G K) :
    (letI := H1.kernelInvariantAction K f hfG hK hKG hs
     (H1.kernelOrbitImageEquiv K f hfG hK hKG hs).symm
       ⟨H1.map K.subtype continuous_subtype_val hKG a, a, rfl⟩ = Quotient.mk'' a) := by sorry

lemma H1.kernelOrbitImageEquiv_symm_projection (hs : Function.Surjective f)
    (a : Set.range (H1.map K.subtype continuous_subtype_val hKG)) :
    (letI := H1.kernelInvariantAction K f hfG hK hKG hs
     (H1.kernelOrbitImageEquiv K f hfG hK hKG hs
       ((H1.kernelOrbitImageEquiv K f hfG hK hKG hs).symm a)).val = a.val) := by sorry

lemma H1.kernelOrbitImageEquiv_choice_independent (hs : Function.Surjective f)
    (a b : H1 G K)
    (hab : H1.map K.subtype continuous_subtype_val hKG a =
      H1.map K.subtype continuous_subtype_val hKG b) :
    (letI := H1.kernelInvariantAction K f hfG hK hKG hs
     (Quotient.mk'' a : MulAction.orbitRel.Quotient (H0 G V) (H1 G K)) = Quotient.mk'' b) := by sorry

lemma H1.kernelInvariantAction_injective_iff (hs : Function.Surjective f) :
    (letI := H1.kernelInvariantAction K f hfG hK hKG hs
     Function.Injective (H1.map K.subtype continuous_subtype_val hKG) ↔
       ∀ (v : H0 G V) (a : H1 G K), v • a = a) := by sorry

variable [IsTopologicalGroup V] [ContinuousSMul G V]
include hfG hK

lemma H1.kernelInclusion_range_iff (hf : Continuous f) (hs : Function.Surjective f)
    (a : H1 G U) :
    a ∈ Set.range (H1.map K.subtype continuous_subtype_val hKG) ↔
      H1.map f hf hfG a = 1 := by sorry

def H1.kernelOrbitNeutralFibreEquiv (hf : Continuous f) (hs : Function.Surjective f) :
    (letI := H1.kernelInvariantAction K f hfG hK hKG hs
     MulAction.orbitRel.Quotient (H0 G V) (H1 G K) ≃
       {a : H1 G U // H1.map f hf hfG a = 1}) := by sorry

lemma H1.kernelOrbitNeutralFibreEquiv_mk (hf : Continuous f) (hs : Function.Surjective f)
    (a : H1 G K) :
    (letI := H1.kernelInvariantAction K f hfG hK hKG hs
     (H1.kernelOrbitNeutralFibreEquiv K f hfG hK hKG hf hs (Quotient.mk'' a)).val =
       H1.map K.subtype continuous_subtype_val hKG a) := by sorry

lemma H1.kernelOrbitNeutralFibreEquiv_symm_mk (hf : Continuous f) (hs : Function.Surjective f)
    (a : H1 G K) :
    (letI := H1.kernelInvariantAction K f hfG hK hKG hs
     (H1.kernelOrbitNeutralFibreEquiv K f hfG hK hKG hf hs).symm
       ⟨H1.map K.subtype continuous_subtype_val hKG a,
         (H1.kernelInclusion_range_iff K f hfG hK hKG hf hs _).mp ⟨a,rfl⟩⟩ = Quotient.mk'' a) := by sorry

lemma H1.kernelOrbitNeutralFibreEquiv_one (hf : Continuous f) (hs : Function.Surjective f) :
    (letI := H1.kernelInvariantAction K f hfG hK hKG hs
     (H1.kernelOrbitNeutralFibreEquiv K f hfG hK hKG hf hs (Quotient.mk'' (1 : H1 G K))).val = 1) := by sorry

lemma H1.kernelOrbitNeutralFibreEquiv_inverse (hf : Continuous f) (hs : Function.Surjective f)
    (a : {a : H1 G U // H1.map f hf hfG a = 1}) :
    (letI := H1.kernelInvariantAction K f hfG hK hKG hs
     H1.kernelOrbitNeutralFibreEquiv K f hfG hK hKG hf hs
       ((H1.kernelOrbitNeutralFibreEquiv K f hfG hK hKG hf hs).symm a) = a) := by sorry

end KernelOrbitClassification
end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section KernelOrbitTests
set_option linter.unusedSectionVars false
set_option linter.style.haveILetI false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V] [MulDistribMulAction G V]
  (K : Subgroup U) [MulDistribMulAction G K] [ContinuousSMul G K]
  (f : U →* V) (hfG : ∀ (g : G) (u : U), f (g • u) = g • f u)
  (hK : ∀ u : U, u ∈ K ↔ f u = 1)
  (hKG : ∀ (g : G) (k : K), (g • k).val = g • k.val)

-- test: kernel_orbit_image_cocycle_projection
example (hs : Function.Surjective f) (c : Z1 G K) :
    (letI := H1.kernelInvariantAction K f hfG hK hKG hs
     (H1.kernelOrbitImageEquiv K f hfG hK hKG hs (Quotient.mk'' (H1.mk c))).val =
       H1.mk (Z1.map K.subtype continuous_subtype_val hKG c)) := by sorry

-- test: kernel_orbit_image_inverse_witness
example (hs : Function.Surjective f) (a : H1 G K) :
    (letI := H1.kernelInvariantAction K f hfG hK hKG hs
     (H1.kernelOrbitImageEquiv K f hfG hK hKG hs).symm
       ⟨H1.map K.subtype continuous_subtype_val hKG a,a,rfl⟩ = Quotient.mk'' a) := by sorry

-- test: kernel_orbit_image_quotient_roundtrip
example (hs : Function.Surjective f) :
    (letI := H1.kernelInvariantAction K f hfG hK hKG hs
     ∀ q : MulAction.orbitRel.Quotient (H0 G V) (H1 G K),
       (H1.kernelOrbitImageEquiv K f hfG hK hKG hs).symm
         (H1.kernelOrbitImageEquiv K f hfG hK hKG hs q) = q) := by sorry

variable [IsTopologicalGroup V] [ContinuousSMul G V]
-- test: kernel_orbit_neutral_identity
example (hf : Continuous f) (hs : Function.Surjective f) :
    (letI := H1.kernelInvariantAction K f hfG hK hKG hs
     (H1.kernelOrbitNeutralFibreEquiv K f hfG hK hKG hf hs (Quotient.mk'' (1 : H1 G K))).val = 1) := by sorry

-- test: kernel_orbit_neutral_image_witness
example (hf : Continuous f) (hs : Function.Surjective f) (a : H1 G K) :
    (letI := H1.kernelInvariantAction K f hfG hK hKG hs
     (H1.kernelOrbitNeutralFibreEquiv K f hfG hK hKG hf hs).symm
       ⟨H1.map K.subtype continuous_subtype_val hKG a,
         (H1.kernelInclusion_range_iff K f hfG hK hKG hf hs _).mp ⟨a,rfl⟩⟩ = Quotient.mk'' a) := by sorry

-- test: kernel_orbit_neutral_full_inverse
example (hf : Continuous f) (hs : Function.Surjective f)
    (a : {a : H1 G U // H1.map f hf hfG a = 1}) :
    (letI := H1.kernelInvariantAction K f hfG hK hKG hs
     H1.kernelOrbitNeutralFibreEquiv K f hfG hK hKG hf hs
       ((H1.kernelOrbitNeutralFibreEquiv K f hfG hK hKG hf hs).symm a) = a) := by sorry

end KernelOrbitTests
end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section SignKernelOrbitRegression
set_option maxHeartbeats 3000000
local notation "C3" => Multiplicative (ZMod 3)
local notation "S3" => Equiv.Perm (Fin 3)
local notation "Ksign" => MonoidHom.ker (Equiv.Perm.sign : S3 →* ℤˣ)
local instance : TopologicalSpace C3 := ⊥
local instance : TopologicalSpace S3 := ⊥
local instance : TopologicalSpace ℤˣ := ⊥
local instance : DiscreteTopology C3 := ⟨rfl⟩
local instance : DiscreteTopology S3 := ⟨rfl⟩
local instance : DiscreteTopology ℤˣ := ⟨rfl⟩
local instance : MulDistribMulAction C3 S3 :=
  { smul := fun _ x => x
    one_smul := fun _ => rfl
    mul_smul := fun _ _ _ => rfl
    smul_one := fun _ => rfl
    smul_mul := fun _ _ _ => rfl }
local instance : MulDistribMulAction C3 ℤˣ :=
  { smul := fun _ x => x
    one_smul := fun _ => rfl
    mul_smul := fun _ _ _ => rfl
    smul_one := fun _ => rfl
    smul_mul := fun _ _ _ => rfl }
local instance : MulDistribMulAction C3 Ksign :=
  { smul := fun _ x => x
    one_smul := fun _ => rfl
    mul_smul := fun _ _ _ => rfl
    smul_one := fun _ => rfl
    smul_mul := fun _ _ _ => rfl }
local instance : ContinuousSMul C3 S3 := ⟨continuous_snd⟩
local instance : ContinuousSMul C3 Ksign := ⟨continuous_snd⟩

-- test: kernel_orbit_sign_distinct_classes_identified
example :
    let p : S3 := Equiv.swap 0 1 * Equiv.swap 1 2
    let i : C3 →* S3 :=
      { toFun := fun a => if a = 1 then 1 else if a = Multiplicative.ofAdd (1 : ZMod 3) then p else p⁻¹
        map_one' := by decide
        map_mul' := by decide }
    let c : Z1 C3 Ksign := ⟨fun a => ⟨i a,(by decide : ∀ a : C3, Equiv.Perm.sign (i a) = 1) a⟩,
      continuous_of_discreteTopology, by intro a b; apply Subtype.ext; exact i.map_mul a b⟩
    let d : Z1 C3 Ksign := ⟨fun a => ⟨i a⁻¹,(by decide : ∀ a : C3, Equiv.Perm.sign (i a) = 1) a⁻¹⟩,
      continuous_of_discreteTopology, by
        intro a b
        apply Subtype.ext
        exact (by decide : ∀ a b : C3, i ((a*b)⁻¹) = i a⁻¹ * i b⁻¹) a b⟩
    letI := H1.kernelInvariantAction (G := C3) Ksign Equiv.Perm.sign (fun _ _ => rfl)
      (fun _ => Iff.rfl) (fun _ _ => rfl) (Equiv.Perm.sign_surjective (Fin 3))
    H1.mk c ≠ H1.mk d ∧
      (Quotient.mk'' (H1.mk c) : MulAction.orbitRel.Quotient (H0 C3 ℤˣ) (H1 C3 Ksign)) = Quotient.mk'' (H1.mk d) := by sorry

end SignKernelOrbitRegression
end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section TwistedOrbitFibre
set_option linter.unusedSectionVars false
set_option linter.style.haveILetI false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V] [IsTopologicalGroup V]
  [MulDistribMulAction G V] [ContinuousSMul G V]
  (c : Z1 G U) (f : U →* V) (hf : Continuous f)
  (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)

def H1.twistNeutralFibreEquiv :
    {a : H1 G (Twist c) //
      H1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
        (Twist.map_smul c f hf hG) a = 1} ≃
    {a : H1 G U // H1.map f hf hG a = H1.mk (Z1.map f hf hG c)} := by sorry

lemma H1.twistNeutralFibreEquiv_apply
    (a : {a : H1 G (Twist c) //
      H1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
        (Twist.map_smul c f hf hG) a = 1}) :
    (H1.twistNeutralFibreEquiv c f hf hG a).val = H1.twistEquiv c a.val := by sorry

lemma H1.twistNeutralFibreEquiv_symm_apply
    (a : {a : H1 G U // H1.map f hf hG a = H1.mk (Z1.map f hf hG c)}) :
    ((H1.twistNeutralFibreEquiv c f hf hG).symm a).val =
      (H1.twistEquiv c).symm a.val := by sorry

lemma H1.twistNeutralFibreEquiv_basepoint :
    (H1.twistNeutralFibreEquiv c f hf hG
      ⟨1, H1.map_one _ _ _⟩).val = H1.mk c := by sorry

@[instance_reducible]
def H1.twistedKernelInvariantAction (hs : Function.Surjective f) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     MulAction (H0 G (Twist (Z1.map f hf hG c))) (H1 G (Twist.map c f hf hG).ker)) := by sorry

lemma H1.twistedKernelInvariantAction_mk (hs : Function.Surjective f) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     letI := H1.twistedKernelInvariantAction c f hf hG hs
     ∀ (v : H0 G (Twist (Z1.map f hf hG c))) (u : Twist c)
       (hu : Twist.map c f hf hG u = v.val) (d : Z1 G (Twist.map c f hf hG).ker),
       v • H1.mk d =
         H1.mk (Z1.kernelGauge (Twist.map c f hf hG).ker
           (Twist.map c f hf hG) (Twist.map_smul c f hf hG)
           (fun _ => Iff.rfl) (fun g x => Twist.kernelAction_value c f hf hG g x) u
           (by rw [hu]; exact v.property) d)) := by sorry

lemma H1.twistedKernelInvariantAction_inclusion (hs : Function.Surjective f) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     letI := H1.twistedKernelInvariantAction c f hf hG hs
     ∀ (v : H0 G (Twist (Z1.map f hf hG c))) (a : H1 G (Twist.map c f hf hG).ker),
       H1.twistedKernelInclusion c f hf hG (v • a) =
         H1.twistedKernelInclusion c f hf hG a) := by sorry

lemma H1.twistedKernelInvariantAction_fibre_iff (hs : Function.Surjective f) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     letI := H1.twistedKernelInvariantAction c f hf hG hs
     ∀ a b : H1 G (Twist.map c f hf hG).ker,
       H1.twistEquiv c (H1.twistedKernelInclusion c f hf hG a) =
         H1.twistEquiv c (H1.twistedKernelInclusion c f hf hG b) ↔
       ∃ v : H0 G (Twist (Z1.map f hf hG c)), v • a = b) := by sorry

def H1.twistedKernelOrbitFibreEquiv (hs : Function.Surjective f) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     letI := H1.twistedKernelInvariantAction c f hf hG hs
     MulAction.orbitRel.Quotient (H0 G (Twist (Z1.map f hf hG c)))
       (H1 G (Twist.map c f hf hG).ker) ≃
       {a : H1 G U // H1.map f hf hG a = H1.mk (Z1.map f hf hG c)}) := by sorry

lemma H1.twistedKernelOrbitFibreEquiv_mk (hs : Function.Surjective f) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     letI := H1.twistedKernelInvariantAction c f hf hG hs
     ∀ a : H1 G (Twist.map c f hf hG).ker,
       (H1.twistedKernelOrbitFibreEquiv c f hf hG hs (Quotient.mk'' a)).val =
         H1.twistEquiv c (H1.twistedKernelInclusion c f hf hG a)) := by sorry

lemma H1.twistedKernelOrbitFibreEquiv_symm_mk (hs : Function.Surjective f) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     letI := H1.twistedKernelInvariantAction c f hf hG hs
     ∀ a : H1 G (Twist.map c f hf hG).ker,
       (H1.twistedKernelOrbitFibreEquiv c f hf hG hs).symm
         ⟨H1.twistEquiv c (H1.twistedKernelInclusion c f hf hG a),
          H1.twistedKernelInclusion_fibre c f hf hG a⟩ = Quotient.mk'' a) := by sorry

lemma H1.twistedKernelOrbitFibreEquiv_left_inv (hs : Function.Surjective f) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     letI := H1.twistedKernelInvariantAction c f hf hG hs
     ∀ q : MulAction.orbitRel.Quotient (H0 G (Twist (Z1.map f hf hG c)))
       (H1 G (Twist.map c f hf hG).ker),
       (H1.twistedKernelOrbitFibreEquiv c f hf hG hs).symm
         (H1.twistedKernelOrbitFibreEquiv c f hf hG hs q) = q) := by sorry

lemma H1.twistedKernelOrbitFibreEquiv_right_inv (hs : Function.Surjective f)
    (a : {a : H1 G U // H1.map f hf hG a = H1.mk (Z1.map f hf hG c)}) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     letI := H1.twistedKernelInvariantAction c f hf hG hs
     H1.twistedKernelOrbitFibreEquiv c f hf hG hs
       ((H1.twistedKernelOrbitFibreEquiv c f hf hG hs).symm a) = a) := by sorry

lemma H1.twistedKernelOrbitFibreEquiv_basepoint (hs : Function.Surjective f) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     letI := H1.twistedKernelInvariantAction c f hf hG hs
     (H1.twistedKernelOrbitFibreEquiv c f hf hG hs
       (Quotient.mk'' (1 : H1 G (Twist.map c f hf hG).ker))).val = H1.mk c) := by sorry

lemma H1.twistedKernelOrbitFibreEquiv_choice_independent (hs : Function.Surjective f) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     letI := H1.twistedKernelInvariantAction c f hf hG hs
     ∀ a b : H1 G (Twist.map c f hf hG).ker,
       H1.twistEquiv c (H1.twistedKernelInclusion c f hf hG a) =
         H1.twistEquiv c (H1.twistedKernelInclusion c f hf hG b) →
       (Quotient.mk'' a : MulAction.orbitRel.Quotient
         (H0 G (Twist (Z1.map f hf hG c))) (H1 G (Twist.map c f hf hG).ker)) =
         Quotient.mk'' b) := by sorry

lemma H1.twistedKernelInvariantAction_injective_iff (hs : Function.Surjective f) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     letI := H1.twistedKernelInvariantAction c f hf hG hs
     Function.Injective (fun a => H1.twistEquiv c (H1.twistedKernelInclusion c f hf hG a)) ↔
       ∀ (v : H0 G (Twist (Z1.map f hf hG c))) (a : H1 G (Twist.map c f hf hG).ker),
         v • a = a) := by sorry

end TwistedOrbitFibre
end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section TwistedOrbitTests
set_option linter.unusedSectionVars false
set_option linter.style.haveILetI false
variable {G : Type*} [Group G] [TopologicalSpace G]
  {U : Type*} [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
  {V : Type*} [Group V] [TopologicalSpace V] [IsTopologicalGroup V]
  [MulDistribMulAction G V] [ContinuousSMul G V]
  (c : Z1 G U) (f : U →* V) (hf : Continuous f)
  (hG : ∀ (g : G) (x : U), f (g • x) = g • f x)

-- test: twist_fibre_translation_value
example (a : {a : H1 G (Twist c) //
    H1.map (Twist.map c f hf hG) (Twist.map_continuous c f hf hG)
      (Twist.map_smul c f hf hG) a = 1}) :
    (H1.twistNeutralFibreEquiv c f hf hG a).val = H1.twistEquiv c a.val := by sorry

-- test: twist_fibre_translation_basepoint
example :
    (H1.twistNeutralFibreEquiv c f hf hG ⟨1,H1.map_one _ _ _⟩).val = H1.mk c := by sorry

-- test: twist_fibre_translation_inverse
example (a : {a : H1 G U // H1.map f hf hG a = H1.mk (Z1.map f hf hG c)}) :
    H1.twistNeutralFibreEquiv c f hf hG ((H1.twistNeutralFibreEquiv c f hf hG).symm a) = a := by sorry

-- test: twisted_invariant_action_unit
example (hs : Function.Surjective f) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     letI := H1.twistedKernelInvariantAction c f hf hG hs
     ∀ a : H1 G (Twist.map c f hf hG).ker,
       (1 : H0 G (Twist (Z1.map f hf hG c))) • a = a) := by sorry

-- test: twisted_invariant_action_lift_value
example (hs : Function.Surjective f) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     letI := H1.twistedKernelInvariantAction c f hf hG hs
     ∀ (v : H0 G (Twist (Z1.map f hf hG c))) (u : Twist c)
       (hu : Twist.map c f hf hG u = v.val) (d : Z1 G (Twist.map c f hf hG).ker),
       v • H1.mk d = H1.mk (Z1.kernelGauge (Twist.map c f hf hG).ker
         (Twist.map c f hf hG) (Twist.map_smul c f hf hG)
         (fun _ => Iff.rfl) (fun g x => Twist.kernelAction_value c f hf hG g x) u
         (by rw [hu]; exact v.property) d)) := by sorry

-- test: twisted_invariant_action_translated_constant
example (hs : Function.Surjective f) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     letI := H1.twistedKernelInvariantAction c f hf hG hs
     ∀ (v : H0 G (Twist (Z1.map f hf hG c))) (a : H1 G (Twist.map c f hf hG).ker),
       H1.twistEquiv c (H1.twistedKernelInclusion c f hf hG (v • a)) =
         H1.twistEquiv c (H1.twistedKernelInclusion c f hf hG a)) := by sorry

-- test: twisted_orbit_actual_cocycle_value
example (hs : Function.Surjective f) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     letI := H1.twistedKernelInvariantAction c f hf hG hs
     ∀ d : Z1 G (Twist.map c f hf hG).ker,
       (H1.twistedKernelOrbitFibreEquiv c f hf hG hs (Quotient.mk'' (H1.mk d))).val =
         H1.mk (Z1.twistEquiv c (Z1.map (Twist.map c f hf hG).ker.subtype
           continuous_subtype_val (fun g x => Twist.kernelAction_value c f hf hG g x) d))) := by sorry

-- test: twisted_orbit_repointed_basepoint
example (hs : Function.Surjective f) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     letI := H1.twistedKernelInvariantAction c f hf hG hs
     (H1.twistedKernelOrbitFibreEquiv c f hf hG hs
       (Quotient.mk'' (1 : H1 G (Twist.map c f hf hG).ker))).val = H1.mk c) := by sorry

-- test: twisted_orbit_inverse_on_included_class
example (hs : Function.Surjective f) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     letI := H1.twistedKernelInvariantAction c f hf hG hs
     ∀ a : H1 G (Twist.map c f hf hG).ker,
       (H1.twistedKernelOrbitFibreEquiv c f hf hG hs).symm
         ⟨H1.twistEquiv c (H1.twistedKernelInclusion c f hf hG a),
          H1.twistedKernelInclusion_fibre c f hf hG a⟩ = Quotient.mk'' a) := by sorry

-- test: twisted_orbit_quotient_roundtrip
example (hs : Function.Surjective f) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     letI := H1.twistedKernelInvariantAction c f hf hG hs
     ∀ q : MulAction.orbitRel.Quotient (H0 G (Twist (Z1.map f hf hG c)))
       (H1 G (Twist.map c f hf hG).ker),
       (H1.twistedKernelOrbitFibreEquiv c f hf hG hs).symm
         (H1.twistedKernelOrbitFibreEquiv c f hf hG hs q) = q) := by sorry

-- test: twisted_orbit_fibre_roundtrip
example (hs : Function.Surjective f)
    (a : {a : H1 G U // H1.map f hf hG a = H1.mk (Z1.map f hf hG c)}) :
    (letI := Twist.kernelAction c f hf hG
     letI := Twist.kernelContinuousSMul c f hf hG
     letI := H1.twistedKernelInvariantAction c f hf hG hs
     H1.twistedKernelOrbitFibreEquiv c f hf hG hs
       ((H1.twistedKernelOrbitFibreEquiv c f hf hG hs).symm a) = a) := by sorry

end TwistedOrbitTests

section NonneutralOrbitRegression
set_option maxHeartbeats 3000000
local notation "C2" => Equiv.Perm (Fin 2)
local notation "S3" => Equiv.Perm (Fin 3)
local instance : TopologicalSpace C2 := ⊥
local instance : TopologicalSpace S3 := ⊥
local instance : DiscreteTopology C2 := ⟨rfl⟩
local instance : DiscreteTopology S3 := ⟨rfl⟩
local instance : MulDistribMulAction C2 S3 :=
  { smul := fun _ x => x
    one_smul := fun _ => rfl
    mul_smul := fun _ _ _ => rfl
    smul_one := fun _ => rfl
    smul_mul := fun _ _ _ => rfl }
local instance : ContinuousSMul C2 S3 := ⟨continuous_snd⟩

-- test: twisted_orbit_identity_fibre_nonneutral
example :
    let c : Z1 C2 S3 := ⟨fun g => if g = 1 then 1 else Equiv.swap 0 1,
      continuous_of_discreteTopology, by decide⟩
    let f : S3 →* S3 := MonoidHom.id S3
    let hG : ∀ (g : C2) (x : S3), f (g • x) = g • f x := fun _ _ => rfl
    letI := Twist.kernelAction c f continuous_id hG
    letI := Twist.kernelContinuousSMul c f continuous_id hG
    letI := H1.twistedKernelInvariantAction c f continuous_id hG Function.surjective_id
    let q : MulAction.orbitRel.Quotient (H0 C2 (Twist (Z1.map f continuous_id hG c)))
      (H1 C2 (Twist.map c f continuous_id hG).ker) :=
      Quotient.mk'' (1 : H1 C2 (Twist.map c f continuous_id hG).ker)
    (H1.twistedKernelOrbitFibreEquiv c f continuous_id hG Function.surjective_id q).val =
      H1.mk c ∧
    (H1.twistedKernelOrbitFibreEquiv c f continuous_id hG Function.surjective_id q).val ≠ 1 := by sorry

end NonneutralOrbitRegression
end TauCeti.NonabelianCohomology

namespace TauCeti.NonabelianCohomology
section CanonicalDescentTests
local notation "S3" => Equiv.Perm (Fin 3)
local instance : TopologicalSpace S3 := ⊥
local instance : DiscreteTopology S3 := ⟨rfl⟩
local instance : MulDistribMulAction S3 S3 where
  smul _ x := x
  one_smul _ := rfl
  mul_smul _ _ _ := rfl
  smul_one _ := rfl
  smul_mul _ _ _ := rfl

-- The actual identity homomorphism is a cocycle for this trivial action.
private def identityCocycleS3 : Z1 S3 S3 :=
  ⟨id, continuous_id, by intro g h; rfl⟩

private theorem identityCocycleS3_trivial :
    ∀ n ∈ (⊥ : Subgroup S3), identityCocycleS3 n = 1 := by
  intro n hn
  have hn1 : n = 1 := hn
  exact hn1

-- test: TauCeti.NonabelianCohomology.Z1.descend.test_identity_S3_values
example :
    (Z1.descend (⊥ : Subgroup S3) identityCocycleS3 identityCocycleS3_trivial
      (QuotientGroup.mk (Equiv.swap (0 : Fin 3) 1))).val = Equiv.swap (0 : Fin 3) 1 ∧
    Equiv.swap (0 : Fin 3) 1 ≠ 1 := by sorry

-- test: TauCeti.NonabelianCohomology.Z1.inflate.test_identity_S3_values
example :
    Z1.inflate (⊥ : Subgroup S3)
      (Z1.descend (⊥ : Subgroup S3) identityCocycleS3 identityCocycleS3_trivial)
      (Equiv.swap (0 : Fin 3) 1) = Equiv.swap (0 : Fin 3) 1 ∧
    Equiv.swap (0 : Fin 3) 1 ≠ 1 := by sorry

-- test: TauCeti.NonabelianCohomology.Z1.descendEquiv.test_identity_S3_values
example :
    let d := Z1.descendEquiv (⊥ : Subgroup S3)
      ⟨identityCocycleS3, identityCocycleS3_trivial⟩
    (d (QuotientGroup.mk (Equiv.swap (0 : Fin 3) 1))).val = Equiv.swap (0 : Fin 3) 1 ∧
    (d (QuotientGroup.mk (Equiv.swap (1 : Fin 3) 2))).val = Equiv.swap (1 : Fin 3) 2 := by sorry

-- test: TauCeti.NonabelianCohomology.tests.factor_order
-- Uses the actual continuous-cocycle subtype and its explicit identity representative.
example :
    let c := identityCocycleS3
    let g : S3 := Equiv.swap 0 1
    let h : S3 := Equiv.swap 1 2
    c (g * h) = c g * c h ∧
      c (g * h) ≠ c h * c g := by decide

-- test: TauCeti.NonabelianCohomology.tests.twist_right_translation_S3
-- A noncommuting value distinguishes right translation from a swapped forward map.
example :
    let c := identityCocycleS3
    let x : Twist c := Equiv.swap 0 1
    let d := Z1.coboundary (G := S3) x
    let g : S3 := Equiv.swap 1 2
    Z1.twistEquiv c d g = Equiv.swap 0 1 * g * (Equiv.swap 0 1)⁻¹ ∧
      Z1.twistEquiv c d g ≠ c g * Twist.toOriginal c (d g) := by sorry

end CanonicalDescentTests

-- test: TauCeti.NonabelianCohomology.Z1.mul_left_eq_of_trivial.test_requires_normal
-- Native arithmetic, independent of the proposed subgroup/descent implementations.
example :
    let U := Equiv.Perm (Fin 3)
    let G := ConjAct U
    let τ : U := Equiv.swap 0 1
    let c : G → U := fun h => τ * (h • τ)⁻¹
    let n := ConjAct.toConjAct τ
    let g := ConjAct.toConjAct (Equiv.swap (1 : Fin 3) 2)
    c n = 1 ∧ c (g * n) = c g ∧ c (n * g) ≠ c g := by decide

end TauCeti.NonabelianCohomology
end
end
end
end

end CohomologicalCore

/-! ## Layer NC.0: arithmetic paths, sections and tangential specialization -/

section LayerNC0

set_option autoImplicit false

namespace TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty.NC0

open CategoryTheory CategoryTheory.Functor
open scoped CategoryTheory.PreGaloisCategory

universe u v w

section Constants
variable {C : Type u} [Category.{v} C] {D : Type u} [Category.{v} D]
variable (K : D ⥤ C) {B X : C ⥤ FintypeCat.{w}} {W : D ⥤ FintypeCat.{w}}
variable (rb : K ⋙ B ≅ W) (rx : K ⋙ X ≅ W)

/-- Arithmetic paths over the identity on the constant-cover fibre functor. -/
def ArithmeticPath := {p : B ≅ X // isoWhiskerLeft K p = rb ≪≫ rx.symm}

namespace ArithmeticPath

theorem ext {p q : ArithmeticPath K rb rx} (h : p.val = q.val) : p = q := by sorry

theorem restrict_id (p : ArithmeticPath K rb rx) :
    rb.symm ≪≫ isoWhiskerLeft K p.val ≪≫ rx = Iso.refl W := by sorry

def identity : ArithmeticPath K rb rb := ⟨Iso.refl B, by sorry⟩

/-- Geometric right action: first apply the source automorphism, then the path. -/
def rightMul (p : ArithmeticPath K rb rx) (h : Aut B)
    (hh : isoWhiskerLeft K h = Iso.refl (K ⋙ B)) : ArithmeticPath K rb rx :=
  ⟨h ≪≫ p.val, by sorry⟩

/-- The arithmetic Galois action, with compatible lifts at the two endpoints. -/
def galoisAction (p : ArithmeticPath K rb rx) (a : Aut B) (b : Aut X)
    (h : rb.symm ≪≫ isoWhiskerLeft K a ≪≫ rb =
      rx.symm ≪≫ isoWhiskerLeft K b ≪≫ rx) : ArithmeticPath K rb rx :=
  ⟨a.symm ≪≫ p.val ≪≫ b, by sorry⟩

theorem rightMul_val (p : ArithmeticPath K rb rx) (h : Aut B)
    (hh : isoWhiskerLeft K h = Iso.refl (K ⋙ B)) :
    (rightMul K rb rx p h hh).val = h ≪≫ p.val := by sorry

theorem galoisAction_val (p : ArithmeticPath K rb rx) (a : Aut B) (b : Aut X)
    (h : rb.symm ≪≫ isoWhiskerLeft K a ≪≫ rb =
      rx.symm ≪≫ isoWhiskerLeft K b ≪≫ rx) :
    (galoisAction K rb rx p a b h).val = a.symm ≪≫ p.val ≪≫ b := by sorry

-- Tests: identity path; nontrivial geometric translation is retained; nonidentity
-- restriction to constants excludes an otherwise valid ordinary path.
-- test: arithmeticPath_identity
example : (identity K rb).val = Iso.refl B := by sorry
-- test: arithmeticPath_translation_ne
example (p : ArithmeticPath K rb rx) (h : Aut B)
    (hh : isoWhiskerLeft K h = Iso.refl (K ⋙ B)) (hne : h ≠ 1) :
    rightMul K rb rx p h hh ≠ p := by sorry
-- test: arithmeticPath_constants_excluded
example (p : B ≅ X) (h : isoWhiskerLeft K p ≠ rb ≪≫ rx.symm) :
    ¬ ∃ q : ArithmeticPath K rb rx, q.val = p := by sorry

end ArithmeticPath
end Constants

section Transport
variable {C : Type u} [Category.{v} C]
variable {B X Y : C ⥤ FintypeCat.{w}}
variable {Γ : Type*} [Group Γ] [TopologicalSpace Γ]

/-- Backward transport: the opposite direction to IG.0's forward basepoint map. -/
def pullAut (p : B ≅ X) : Aut X →* Aut B where
  toFun g := p ≪≫ g ≪≫ p.symm
  map_one' := by sorry
  map_mul' := by sorry

theorem pullAut_continuous (p : B ≅ X) : Continuous (pullAut p) := by sorry

/-- The section at x, transferred to b along a geometric path. -/
def transportedSection (p : B ≅ X) (sx : Γ →ₜ* Aut X) : Γ →ₜ* Aut B where
  toMonoidHom := (pullAut p).comp sx.toMonoidHom
  continuous_toFun := by sorry

theorem transportedSection_apply (p : B ≅ X) (sx : Γ →ₜ* Aut X) (σ : Γ) :
    transportedSection p sx σ = p ≪≫ sx σ ≪≫ p.symm := by sorry

theorem transportedSection_changePath (p : B ≅ X) (sx : Γ →ₜ* Aut X)
    (h : Aut B) (σ : Γ) :
    transportedSection (h ≪≫ p) sx σ = h⁻¹ * transportedSection p sx σ * h := by sorry

theorem transportedSection_comp (p : B ≅ X) (q : X ≅ Y) (sy : Γ →ₜ* Aut Y) :
    transportedSection (p ≪≫ q) sy = transportedSection p (transportedSection q sy) := by sorry

-- Tests: the identity; geometric translation gives the displayed conjugacy;
-- noncommuting elements detect the inverse convention.
-- test: transportedSection_identity
example (sx : Γ →ₜ* Aut B) : transportedSection (Iso.refl B) sx = sx := by sorry
-- test: transportedSection_translation
example (p : B ≅ X) (sx : Γ →ₜ* Aut X) (h : Aut B) (σ : Γ) :
    h * transportedSection (h ≪≫ p) sx σ * h⁻¹ = transportedSection p sx σ := by sorry
-- test: transportedSection_inverse_order
example (h g : Aut B) (hne : h⁻¹ * g * h ≠ h * g * h⁻¹) :
    pullAut h g ≠ h * g * h⁻¹ := by sorry
end Transport

section KernelCoordinates
variable {E Γ : Type*} [Group E] [TopologicalSpace E] [IsTopologicalGroup E]
variable [Group Γ] [TopologicalSpace Γ] [IsTopologicalGroup Γ]
variable (q : E →ₜ* Γ)

-- A notation for native continuous sections, not a second extension theory.
abbrev Section := {s : Γ →ₜ* E // q.comp s = ContinuousMonoidHom.id Γ}
abbrev GeometricKernel := q.toMonoidHom.ker

/-- Conjugation action on the geometric kernel determined by the reference section. -/
def kernelAction (s0 : Section q) (σ : Γ) (h : GeometricKernel q) : GeometricKernel q :=
  ⟨s0.val σ * h.val * (s0.val σ)⁻¹, by sorry⟩

/-- The arithmetic path action after a chosen geometric path identifies its torsor with ker q. -/
def pathAction (s0 s1 : Section q) (σ : Γ) (h : GeometricKernel q) : GeometricKernel q :=
  ⟨s1.val σ * h.val * (s0.val σ)⁻¹, by sorry⟩

theorem pathAction_mul (s0 s1 : Section q) (σ τ : Γ) (h : GeometricKernel q) :
    pathAction q s0 s1 (σ * τ) h = pathAction q s0 s1 σ (pathAction q s0 s1 τ h) := by sorry

theorem pathAction_continuous (s0 s1 : Section q) :
    Continuous (fun z : Γ × GeometricKernel q => pathAction q s0 s1 z.1 z.2) := by sorry

theorem pathAction_rightMul (s0 s1 : Section q) (σ : Γ) (h k : GeometricKernel q) :
    pathAction q s0 s1 σ (h * k) = pathAction q s0 s1 σ h * kernelAction q s0 σ k := by sorry

/-- Specific cocycle of a chosen point h in the arithmetic path torsor. -/
def pathCocycle (s0 s1 : Section q) (h : GeometricKernel q) : C(Γ, GeometricKernel q) where
  toFun σ := h⁻¹ * pathAction q s0 s1 σ h
  continuous_toFun := by sorry

theorem pathCocycle_apply (s0 s1 : Section q) (h : GeometricKernel q) (σ : Γ) :
    (pathCocycle q s0 s1 h σ).val = h.val⁻¹ * s1.val σ * h.val * (s0.val σ)⁻¹ := by sorry

theorem pathCocycle_mul (s0 s1 : Section q) (h : GeometricKernel q) (σ τ : Γ) :
    pathCocycle q s0 s1 h (σ * τ) = pathCocycle q s0 s1 h σ *
      kernelAction q s0 σ (pathCocycle q s0 s1 h τ) := by sorry

theorem pathCocycle_changePoint (s0 s1 : Section q) (h k : GeometricKernel q) (σ : Γ) :
    pathCocycle q s0 s1 (h * k) σ = k⁻¹ * pathCocycle q s0 s1 h σ * kernelAction q s0 σ k := by sorry

-- Tests: identical endpoints at the identity; a changed point is generally not the same
-- representative; differing sections give a nontrivial value at the identity path.
-- test: pathCocycle_same_sections
example (s0 : Section q) (σ : Γ) : pathCocycle q s0 s0 1 σ = 1 := by sorry
-- test: pathCocycle_changed_representative
example (s0 : Section q) (h : GeometricKernel q) (σ : Γ)
    (hne : kernelAction q s0 σ h ≠ h) : pathCocycle q s0 s0 h σ ≠ 1 := by sorry
-- test: pathCocycle_distinct_sections
example (s0 s1 : Section q) (σ : Γ) (hne : s1.val σ ≠ s0.val σ) :
    pathCocycle q s0 s1 1 σ ≠ 1 := by sorry

/-- The fixed-path criterion and the neutral-class criterion of the imported NC.3 H1. -/
theorem fixedPath_iff_sections_conjugate (s0 s1 : Section q) :
    (∃ h : GeometricKernel q, ∀ σ, pathAction q s0 s1 σ h = h) ↔
    ∃ h : GeometricKernel q, ∀ σ, s1.val σ = h.val * s0.val σ * h.val⁻¹ := by sorry

theorem pathCocycle_neutral_iff_fixedPath (s0 s1 : Section q) (h : GeometricKernel q) :
    (∃ k : GeometricKernel q, ∀ σ,
      pathCocycle q s0 s1 h σ = k * (kernelAction q s0 σ k)⁻¹) ↔
    ∃ k : GeometricKernel q, ∀ σ, pathAction q s0 s1 σ k = k := by sorry

/-- Morphisms of arithmetic extensions commute with the coordinate cocycles. -/
theorem pathCocycle_map {E' : Type*} [Group E'] [TopologicalSpace E'] [IsTopologicalGroup E']
    (q' : E' →ₜ* Γ) (f : E →ₜ* E') (hf : q'.comp f = q)
    (s0 s1 : Section q) (t0 t1 : Section q')
    (h0 : f.comp s0.val = t0.val) (h1 : f.comp s1.val = t1.val)
    (h : GeometricKernel q) (σ : Γ) :
    f (pathCocycle q s0 s1 h σ).val =
      (pathCocycle q' t0 t1 ⟨f h.val, by sorry⟩ σ).val := by sorry

/-- Changing the reference section twists its kernel action by the path cocycle. -/
theorem kernelAction_changeReference (s0 s1 : Section q) (σ : Γ) (h : GeometricKernel q) :
    kernelAction q s1 σ h = pathCocycle q s0 s1 1 σ * kernelAction q s0 σ h *
      (pathCocycle q s0 s1 1 σ)⁻¹ := by sorry
end KernelCoordinates

section LocalSpecialization
variable {Y : Type u} (e : Y → ℕ+)

-- Local power-map coordinates used only to prove Chen's geometric specialization theorem.
abbrev BranchFiber := Σ y : Y, ZMod (e y : ℕ)

instance branchNeZero (y : Y) : NeZero (e y : ℕ) := ⟨(e y).ne_zero⟩

/-- Translation in each local Kummer fibre; a compatible primitive root chooses +1. -/
def branchRotation : Equiv.Perm (BranchFiber e) where
  toFun x := ⟨x.1, x.2 + 1⟩
  invFun x := ⟨x.1, x.2 - 1⟩
  left_inv := by sorry
  right_inv := by sorry

abbrev InertiaOrbits := MulAction.orbitRel.Quotient
  (Subgroup.zpowers (branchRotation e)) (BranchFiber e)

/-- The branch projection factors through the actual cyclic-action orbit quotient. -/
def specializeLocal : InertiaOrbits e → Y :=
  Quotient.lift (fun x : BranchFiber e => x.1) (by sorry)

theorem specializeLocal_mk (x : BranchFiber e) :
    specializeLocal e (Quotient.mk _ x) = x.1 := by sorry

theorem branchRotation_apply (x : BranchFiber e) : branchRotation e x = ⟨x.1, x.2 + 1⟩ := by sorry

theorem inertiaOrbit_iff (x z : BranchFiber e) :
    MulAction.orbitRel (Subgroup.zpowers (branchRotation e)) (BranchFiber e) x z ↔ x.1 = z.1 := by sorry

theorem specializeLocal_bijective : Function.Bijective (specializeLocal e) := by sorry

theorem branch_card (y : Y) : Fintype.card (ZMod (e y : ℕ)) = e y := by sorry

-- Tests: a degree-three branch has one orbit, not three; distinct branches stay
-- distinct even when their ramification indices coincide; unramified branches are fixed.
-- test: inertiaOrbit_degree_three
example : Subsingleton (InertiaOrbits (fun _ : Unit => (3 : ℕ+))) := by sorry
-- test: inertiaOrbit_distinct_branches
example (x z : BranchFiber (fun _ : Bool => (2 : ℕ+))) (h : x.1 ≠ z.1) :
    (Quotient.mk _ x : InertiaOrbits (fun _ : Bool => (2 : ℕ+))) ≠ Quotient.mk _ z := by sorry
-- test: inertiaOrbit_unramified
example (x : BranchFiber (fun _ : Y => (1 : ℕ+))) :
    branchRotation (fun _ : Y => (1 : ℕ+)) x = x := by sorry
end LocalSpecialization

section GoodPaths
variable {C : Type u} [Category.{v} C]
variable {F0 F1 Finf : C ⥤ FintypeCat.{w}}

/-- Chen's relation uses the exact order infinity, one, zero. -/
def IsGoodPath (γ0 : Aut F0) (γ1 : Aut F1) (γinf : Aut Finf) (δ : F0 ≅ Finf) : Prop :=
  (Subgroup.closure {γ0, pullAut δ γinf}).topologicalClosure = ⊤ ∧
    ∃ ε : F0 ≅ F1, pullAut δ γinf * pullAut ε γ1 * γ0 = 1

theorem IsGoodPath.generates {γ0 : Aut F0} {γ1 : Aut F1} {γinf : Aut Finf} {δ : F0 ≅ Finf}
    (h : IsGoodPath γ0 γ1 γinf δ) :
    (Subgroup.closure {γ0, pullAut δ γinf}).topologicalClosure = ⊤ := by sorry

theorem IsGoodPath.relation {γ0 : Aut F0} {γ1 : Aut F1} {γinf : Aut Finf} {δ : F0 ≅ Finf}
    (h : IsGoodPath γ0 γ1 γinf δ) :
    ∃ ε : F0 ≅ F1, pullAut δ γinf * pullAut ε γ1 * γ0 = 1 := by sorry

theorem isGoodPath_iff (γ0 : Aut F0) (γ1 : Aut F1) (γinf : Aut Finf) (δ : F0 ≅ Finf) :
    IsGoodPath γ0 γ1 γinf δ ↔
      (Subgroup.closure {γ0, pullAut δ γinf}).topologicalClosure = ⊤ ∧
        ∃ ε : F0 ≅ F1, pullAut δ γinf * pullAut ε γ1 * γ0 = 1 := by sorry

-- Tests: the zero peripheral system works only for the trivial group; a correctly ordered
-- noncommutative relation works; reversing the order can destroy that relation.
-- test: goodPath_trivial_group
example [Subsingleton (Aut F0)] : IsGoodPath (1 : Aut F0) (1 : Aut F0) (1 : Aut F0) (Iso.refl F0) := by sorry
-- test: goodPath_identity_nonexample
example (h : ¬ Subsingleton (Aut F0)) : ¬ IsGoodPath (1 : Aut F0) (1 : Aut F0) (1 : Aut F0) (Iso.refl F0) := by sorry
-- test: goodPath_ordered_relation
example (a b : Aut F0) (hgen : (Subgroup.closure {a, b}).topologicalClosure = ⊤) :
    IsGoodPath a (b⁻¹ * a⁻¹) b (Iso.refl F0) := by sorry
-- test: goodPath_reversed_order
example (a b : Aut F0) (h : b * a ≠ a * b) : a * (b⁻¹ * a⁻¹) * b ≠ 1 := by sorry

/-- Pullback of a path by inversion of the punctured line, with endpoint identifications. -/
def invertPath (J : C ⥤ C) (e0 : J ⋙ F0 ≅ Finf) (einf : J ⋙ Finf ≅ F0)
    (δ : F0 ≅ Finf) : Finf ≅ F0 := e0.symm ≪≫ isoWhiskerLeft J δ ≪≫ einf

/-- Chen's symmetry witnesses are integers, not profinite integers. -/
def IsSymmetricPath (J : C ⥤ C) (e0 : J ⋙ F0 ≅ Finf) (einf : J ⋙ Finf ≅ F0)
    (γ0 : Aut F0) (γinf : Aut Finf) (δ : F0 ≅ Finf) : Prop :=
  ∃ r s : ℤ, invertPath J e0 einf δ = (γinf ^ s) ≪≫ δ.symm ≪≫ (γ0 ^ r)

theorem IsSymmetricPath.witnesses (J : C ⥤ C) (e0 : J ⋙ F0 ≅ Finf)
    (einf : J ⋙ Finf ≅ F0) (γ0 : Aut F0) (γinf : Aut Finf) (δ : F0 ≅ Finf)
    (h : IsSymmetricPath J e0 einf γ0 γinf δ) :
    ∃ r s : ℤ, invertPath J e0 einf δ = (γinf ^ s) ≪≫ δ.symm ≪≫ (γ0 ^ r) := by sorry

theorem isSymmetricPath_of_eq (J : C ⥤ C) (e0 : J ⋙ F0 ≅ Finf)
    (einf : J ⋙ Finf ≅ F0) (γ0 : Aut F0) (γinf : Aut Finf) (δ : F0 ≅ Finf)
    (r s : ℤ) (h : invertPath J e0 einf δ = (γinf ^ s) ≪≫ δ.symm ≪≫ (γ0 ^ r)) :
    IsSymmetricPath J e0 einf γ0 γinf δ := by sorry

theorem isSymmetricPath_iff (J : C ⥤ C) (e0 : J ⋙ F0 ≅ Finf)
    (einf : J ⋙ Finf ≅ F0) (γ0 : Aut F0) (γinf : Aut Finf) (δ : F0 ≅ Finf) :
    IsSymmetricPath J e0 einf γ0 γinf δ ↔
      ∃ r s : ℤ, invertPath J e0 einf δ = (γinf ^ s) ≪≫ δ.symm ≪≫ (γ0 ^ r) := by sorry

-- Tests use the identity pullback with its actual functor unitor, so there is no assumed
-- abstract path involution. Identity is symmetric; zero inertia forces a loop to square
-- to one; an order-three loop fails.
-- test: symmetricPath_identity
example : IsSymmetricPath (𝟭 C) (Functor.leftUnitor F0) (Functor.leftUnitor F0)
    1 1 (Iso.refl F0) := by sorry
-- test: symmetricPath_zero_inertia
example (δ : Aut F0) :
    IsSymmetricPath (𝟭 C) (Functor.leftUnitor F0) (Functor.leftUnitor F0) 1 1 δ ↔ δ * δ = 1 := by sorry
-- test: symmetricPath_square_nonexample
example (δ : Aut F0) (h : δ * δ ≠ 1) :
    ¬ IsSymmetricPath (𝟭 C) (Functor.leftUnitor F0) (Functor.leftUnitor F0) 1 1 δ := by sorry
end GoodPaths

/-! The rational/tangential acceptance test consumes the existing Kummer map. These examples
check its nontrivial finite projections without introducing a second Kummer definition. -/
-- test: kummer_two_nontrivial
example : TauCeti.kummerMap ℚ 2 (by norm_num) (Units.mk0 2 (by norm_num)) ≠ 1 := by sorry
-- test: kummer_four_trivial
example : TauCeti.kummerMap ℚ 2 (by norm_num) (Units.mk0 4 (by norm_num)) = 1 := by sorry
-- test: kummer_one_trivial
example : TauCeti.kummerMap ℚ 1 (by norm_num) (Units.mk0 2 (by norm_num)) = 1 := by sorry

end TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty.NC0

end LayerNC0

/-! ## Layer NC.1: source-qualified anabelian reconstruction -/

section LayerNC1

noncomputable section
namespace TauCeti.Anabelian

universe u v w z

section Relative
variable {Γ : Type u} {X : Type v} {Y : Type w}
variable [Group Γ] [Group X] [Group Y]
variable [TopologicalSpace Γ] [TopologicalSpace X] [TopologicalSpace Y]
variable [IsTopologicalGroup Γ] [IsTopologicalGroup X] [IsTopologicalGroup Y]

/-- A continuous homomorphism over the fixed arithmetic quotient. -/
structure OverHom (qX : X →ₜ* Γ) (qY : Y →ₜ* Γ) where
  hom : X →ₜ* Y
  over : qY.comp hom = qX

/-- Equality removes only conjugation by a target geometric kernel element. -/
def relativeHomSetoid (qX : X →ₜ* Γ) (qY : Y →ₜ* Γ) : Setoid (OverHom qX qY) where
  r f g := ∃ d : qY.toMonoidHom.ker,
    ∀ x, g.hom x = (d : Y) * f.hom x * (d : Y)⁻¹
  iseqv := by
    refine ⟨fun _ => ⟨1, fun _ => by simp⟩, ?_, ?_⟩
    · rintro _ _ ⟨d, h⟩
      refine ⟨d⁻¹, fun x => ?_⟩
      rw [h x]
      simp only [Subgroup.coe_inv, inv_inv, mul_assoc, inv_mul_cancel_left, mul_one,
        inv_mul_cancel]
    · rintro _ _ _ ⟨d, hd⟩ ⟨e, he⟩
      refine ⟨e * d, fun x => ?_⟩
      rw [he x, hd x]
      simp only [Subgroup.coe_mul, mul_inv_rev, mul_assoc]

abbrev RelativeOuterHom (qX : X →ₜ* Γ) (qY : Y →ₜ* Γ) :=
  Quotient (relativeHomSetoid qX qY)

namespace RelativeOuterHom
variable {qX : X →ₜ* Γ} {qY : Y →ₜ* Γ}

def ofHom (f : OverHom qX qY) : RelativeOuterHom qX qY := Quotient.mk _ f

theorem eq_iff (f g : OverHom qX qY) : ofHom f = ofHom g ↔
    ∃ d : qY.toMonoidHom.ker, ∀ x,
      g.hom x = (d : Y) * f.hom x * (d : Y)⁻¹ := by sorry

def openClasses (qX : X →ₜ* Γ) (qY : Y →ₜ* Γ) : Set (RelativeOuterHom qX qY) :=
  {c | ∃ f : OverHom qX qY, ofHom f = c ∧ IsOpen (Set.range f.hom)}

theorem open_iff (f : OverHom qX qY) : ofHom f ∈ openClasses qX qY ↔
    IsOpen (Set.range f.hom) := by sorry
end RelativeOuterHom

-- relativeHom_kernel_conj_test: a supplied geometric conjugate has the same class.
example (qX : X →ₜ* Γ) (qY : Y →ₜ* Γ) (f g : OverHom qX qY)
    (d : qY.toMonoidHom.ker)
    (h : ∀ x, g.hom x = (d : Y) * f.hom x * (d : Y)⁻¹) :
    RelativeOuterHom.ofHom f = RelativeOuterHom.ofHom g := by sorry

-- relativeHom_base_change_test: the arithmetic quotient is fixed pointwise.
example (f : OverHom (ContinuousMonoidHom.id Γ) (ContinuousMonoidHom.id Γ)) :
    f.hom = ContinuousMonoidHom.id Γ := by sorry

-- relativeHom_sign_test: conjugation by an arithmetic element is not removed: over the
-- sign map S₃ → C₂, conjugation by a transposition inverts A₃, unlike any A₃-conjugate of id.
example [TopologicalSpace (Equiv.Perm (Fin 3))] [DiscreteTopology (Equiv.Perm (Fin 3))]
    [TopologicalSpace ℤˣ] [DiscreteTopology ℤˣ]
    (q : Equiv.Perm (Fin 3) →ₜ* ℤˣ) (hq : ∀ σ, q σ = Equiv.Perm.sign σ) :
    ∃ f g : OverHom q q, (∀ x, f.hom x = x) ∧
      RelativeOuterHom.ofHom f ≠ RelativeOuterHom.ofHom g ∧
      ∃ t : Equiv.Perm (Fin 3), ∀ x, g.hom x = t * x * t⁻¹ := by sorry

structure OverIsom (qX : X →ₜ* Γ) (qY : Y →ₜ* Γ) where
  equiv : X ≃ₜ* Y
  over : qY.comp (ContinuousMonoidHom.toContinuousMonoidHom equiv) = qX

def relativeIsomSetoid (qX : X →ₜ* Γ) (qY : Y →ₜ* Γ) : Setoid (OverIsom qX qY) where
  r e f := ∃ d : qY.toMonoidHom.ker,
    ∀ x, f.equiv x = (d : Y) * e.equiv x * (d : Y)⁻¹
  iseqv := by
    refine ⟨fun _ => ⟨1, fun _ => by simp⟩, ?_, ?_⟩
    · rintro _ _ ⟨d, h⟩
      refine ⟨d⁻¹, fun x => ?_⟩
      rw [h x]
      simp only [Subgroup.coe_inv, inv_inv, mul_assoc, inv_mul_cancel_left, mul_one,
        inv_mul_cancel]
    · rintro _ _ _ ⟨d, hd⟩ ⟨e, he⟩
      refine ⟨e * d, fun x => ?_⟩
      rw [he x, hd x]
      simp only [Subgroup.coe_mul, mul_inv_rev, mul_assoc]

abbrev RelativeOuterIsom (qX : X →ₜ* Γ) (qY : Y →ₜ* Γ) :=
  Quotient (relativeIsomSetoid qX qY)

namespace RelativeOuterIsom
variable {qX : X →ₜ* Γ} {qY : Y →ₜ* Γ}

def ofIsom (e : OverIsom qX qY) : RelativeOuterIsom qX qY := Quotient.mk _ e

theorem eq_iff (e f : OverIsom qX qY) : ofIsom e = ofIsom f ↔
    ∃ d : qY.toMonoidHom.ker, ∀ x,
      f.equiv x = (d : Y) * e.equiv x * (d : Y)⁻¹ := by sorry
end RelativeOuterIsom

-- relativeIsom_base_test
example (e : OverIsom (ContinuousMonoidHom.id Γ) (ContinuousMonoidHom.id Γ)) :
    e.equiv = ContinuousMulEquiv.refl Γ := by sorry

-- relativeIsom_sign_test: the same S₃ → C₂ conjugation is a nontrivial relative class.
example [TopologicalSpace (Equiv.Perm (Fin 3))] [DiscreteTopology (Equiv.Perm (Fin 3))]
    [TopologicalSpace ℤˣ] [DiscreteTopology ℤˣ]
    (q : Equiv.Perm (Fin 3) →ₜ* ℤˣ) (hq : ∀ σ, q σ = Equiv.Perm.sign σ) :
    ∃ e₀ e : OverIsom q q, (∀ x, e₀.equiv x = x) ∧
      RelativeOuterIsom.ofIsom e ≠ RelativeOuterIsom.ofIsom e₀ ∧
      ∃ t : Equiv.Perm (Fin 3), ∀ x, e.equiv x = t * x * t⁻¹ := by sorry

/-- Native quotient adapter; characteristic invariance makes the closure redundant.
This completes the geometric kernel, retaining the full arithmetic base. -/
def relativeProPKernel (p : ℕ) (q : X →ₜ* Γ) : Subgroup X :=
  Subgroup.normalClosure
    ((TauCeti.proPKernel p q.toMonoidHom.ker).map q.toMonoidHom.ker.subtype : Set X)

instance relativeProPKernel_normal (p : ℕ) (q : X →ₜ* Γ) :
    (relativeProPKernel p q).Normal := inferInstanceAs (Subgroup.normalClosure _).Normal

abbrev RelativeProP (p : ℕ) (q : X →ₜ* Γ) := X ⧸ relativeProPKernel p q

namespace RelativeProP
variable (p : ℕ) (qX : X →ₜ* Γ)

def mk : X →ₜ* RelativeProP p qX where
  toMonoidHom := QuotientGroup.mk' (relativeProPKernel p qX)
  continuous_toFun := QuotientGroup.continuous_mk

/-- Relative quotient milestone; the projection and kernel equivalence are witnesses,
not data definitions filled by an admitted term. -/
theorem projection_exists [CompactSpace X] [T2Space X] [T2Space Γ]
    (hq : Function.Surjective qX) :
    ∃ π : RelativeProP p qX →ₜ* Γ,
      π.comp (mk p qX) = qX ∧ Function.Surjective π ∧
      Nonempty (π.toMonoidHom.ker ≃ₜ*
        TauCeti.maximalProPQuotient p qX.toMonoidHom.ker) := by sorry

/-- Universal factorization, stated without choosing a lift construction. -/
theorem lift_exists_unique {qY : Y →ₜ* Γ} (f : OverHom qX qY)
    (hY : TauCeti.proPKernel p qY.toMonoidHom.ker = ⊥)
    (π : RelativeProP p qX →ₜ* Γ) (hπ : π.comp (mk p qX) = qX) :
    ∃! g : OverHom π qY, g.hom.comp (mk p qX) = f.hom := by sorry

-- relativeProP_identity_test: a trivial geometric kernel leaves the base intact.
example : relativeProPKernel p (ContinuousMonoidHom.id Γ) = ⊥ := by sorry

-- relativeProP_prime_to_p_test: the arithmetic factor is retained even when not pro-p.
example {A B : Type*} [Group A] [Group B] [TopologicalSpace A] [TopologicalSpace B]
    [IsTopologicalGroup A] [IsTopologicalGroup B] [Fact p.Prime]
    (q : (A × B) →ₜ* A) (hq : ∀ x, q x = x.1)
    (hB : TauCeti.proPKernel p B = ⊥) : relativeProPKernel p q = ⊥ := by sorry
end RelativeProP
end Relative

section Towers
variable {G : Type u} [Group G] {ι : Type v} {A : ι → Type w}
variable [∀ i, MulAction G (A i)]

def towerDecomposition (x : ∀ i, A i) : Subgroup G := ⨅ i, MulAction.stabilizer G (x i)

namespace towerDecomposition

/-- Actual geometric cofinality must supply the fixing hypothesis via transition maps. -/
theorem cofinal {κ : Type*} (r : κ → ι) (x : ∀ i, A i)
    (hfix : ∀ g : G, (∀ j, g • x (r j) = x (r j)) → ∀ i, g • x i = x i) :
    towerDecomposition (G := G) (fun j => x (r j)) = towerDecomposition (G := G) x := by sorry

theorem isClosed [TopologicalSpace G] (x : ∀ i, A i)
    (hclosed : ∀ i, IsClosed (MulAction.stabilizer G (x i) : Set G)) :
    IsClosed (towerDecomposition (G := G) x : Set G) := by sorry
end towerDecomposition

-- towerDecomposition_regular_test
example : towerDecomposition (G := G) (fun _ : Unit => (1 : G)) = ⊥ := by sorry

-- towerDecomposition_trivial_test
example : towerDecomposition (G := G) (fun _ : Unit => (PUnit.unit : PUnit)) =
    (⊤ : Subgroup G) := by sorry
end Towers

section Relations
variable {K : Type u} [Field K]
variable {V : Type v} {W : Type w} {T : Type z}
variable [AddCommGroup V] [AddCommGroup W] [AddCommGroup T]
variable [Module K V] [Module K W] [Module K T]

/-- Kernel of supplied multiplication. The actual canonical section spaces and
their multiplication remain geometric supplier obligations in the reader. -/
abbrev CanonicalRelations (μ : V →ₗ[K] W) : Submodule K V := μ.ker

namespace CanonicalRelations

theorem transport_iff (μ : V →ₗ[K] W) (θ : V →ₗ[K] T) :
    CanonicalRelations μ ≤ θ.ker ↔ ∀ r, μ r = 0 → θ r = 0 := by sorry

/-- No surjectivity of the supplied multiplication is assumed. -/
theorem factor (μ : V →ₗ[K] W) (θ : V →ₗ[K] T)
    (h : CanonicalRelations μ ≤ θ.ker) :
    ∃ ψ : μ.range →ₗ[K] T, ∀ v,
      ψ ⟨μ v, LinearMap.mem_range_self μ v⟩ = θ v := by sorry
end CanonicalRelations

-- canonicalRelations_degree_one_test
example : CanonicalRelations (LinearMap.id : V →ₗ[K] V) = ⊥ := by sorry

-- canonicalRelations_injection_test: injection alone does not preserve products.
example : ∃ r : K × K, (LinearMap.fst K K K) r = 0 ∧
    (LinearMap.snd K K K) ((LinearMap.id : (K × K) →ₗ[K] (K × K)) r) ≠ 0 := by sorry
end Relations

end TauCeti.Anabelian
end

end LayerNC1

/-! ## Layer NC.2: unipotent fundamental groups and realizations -/

section LayerNC2

set_option autoImplicit false

namespace TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty.NC2

open CategoryTheory CategoryTheory.Limits
open scoped TensorProduct

universe u v w

section Length
variable {C : Type u} [Category.{v} C] [Abelian C] [HasFiniteBiproducts C]

/-- A trivial object is a finite biproduct of the specified tensor unit. -/
def IsTrivialObject (unit E : C) : Prop :=
  ∃ n : ℕ, Nonempty (E ≅ biproduct (fun _ : Fin n => unit))

/-- Index zero means one trivial graded layer. The zero object is included. -/
def IsUnipotentLength (unit : C) : ℕ → C → Prop
  | 0, E => IsTrivialObject unit E
  | n + 1, E => ∃ (T Q : C) (i : T ⟶ E) (p : E ⟶ Q) (h : i ≫ p = 0),
      IsTrivialObject unit T ∧ IsUnipotentLength unit n Q ∧
        Mono i ∧ Epi p ∧ (ShortComplex.mk i p h).Exact

namespace IsUnipotentLength
theorem trivial (unit E : C) :
    IsUnipotentLength unit 0 E ↔ IsTrivialObject unit E := by sorry

theorem mono (unit E : C) (n : ℕ) (h : IsUnipotentLength unit n E) :
    IsUnipotentLength unit (n + 1) E := by sorry

theorem extension (unit T E Q : C) (n : ℕ) (i : T ⟶ E) (p : E ⟶ Q)
    (h : i ≫ p = 0) (hT : IsTrivialObject unit T)
    (hQ : IsUnipotentLength unit n Q) [Mono i] [Epi p]
    (hex : (ShortComplex.mk i p h).Exact) : IsUnipotentLength unit (n + 1) E := by sorry

end IsUnipotentLength

abbrev UnipotentCategory (unit : C) :=
  (show ObjectProperty C from fun E => ∃ n, IsUnipotentLength unit n E).FullSubcategory

-- test: length_zero_object
example (unit Z : C) (hZ : IsZero Z) : IsUnipotentLength unit 0 Z := by sorry
-- test: length_unit_sum
example (unit : C) :
    IsUnipotentLength unit 0 (biproduct (fun _ : Fin 2 => unit)) := by sorry
-- test: length_nonsplit_extension

-- and Ext realization are native. The concrete Jordan obstruction appears below.

/-- Select the unipotent full subcategory of a supplied geometric ambient category. -/
abbrev UnipotentRealizations (unit : C) := UnipotentCategory unit

namespace UnipotentRealizations
abbrev etale (unit : C) := UnipotentRealizations unit
abbrev deRham (unit : C) := UnipotentRealizations unit
abbrev rigid (unit : C) := UnipotentRealizations unit

def fiber {k : Type w} [Field k] (unit : C) (ω : C ⥤ ModuleCat.{w} k) :
    UnipotentRealizations unit ⥤ ModuleCat.{w} k :=
  ObjectProperty.ι _ ⋙ ω

-- The three abbreviations instantiate three different imported ambient categories;
-- they do not assert that those categories already exist or are equivalent.
end UnipotentRealizations

end Length

section RealizationUnitTest
open MonoidalCategory
variable {k : Type w} [Field k]
variable {C : Type u} [Category.{v} C] [MonoidalCategory C]

-- test: realization_unit
-- The fibre functor's strong monoidal unit comparison identifies the fibre with k.
example (ω : C ⥤ ModuleCat.{w} k) [ω.Monoidal] :
    Nonempty (ω.obj (𝟙_ C) ≅ ModuleCat.of k k) := by sorry
end RealizationUnitTest

section Universal
variable {k : Type w} [Field k]
variable {C : Type u} [Category.{v} C] [Abelian C] [HasFiniteBiproducts C]
variable (unit : C) (n : ℕ) (ω : C ⥤ ModuleCat.{w} k)

/-- The actual evaluation-bijection universal property, including the length condition. -/
def IsUniversalPointed (E : C) (e : ω.obj E) : Prop :=
  IsUnipotentLength unit n E ∧ ∀ (V : C), IsUnipotentLength unit n V →
    Function.Bijective (fun f : E ⟶ V => (ω.map f).hom e)

namespace IsUniversalPointed
noncomputable def lift {E : C} {e : ω.obj E}
    (h : IsUniversalPointed unit n ω E e) (V : C)
    (hV : IsUnipotentLength unit n V) (v : ω.obj V) : E ⟶ V := by sorry

theorem lift_eval {E : C} {e : ω.obj E}
    (h : IsUniversalPointed unit n ω E e) (V : C)
    (hV : IsUnipotentLength unit n V) (v : ω.obj V) :
    (ω.map (lift unit n ω h V hV v)).hom e = v := by sorry

theorem lift_unique {E : C} {e : ω.obj E}
    (h : IsUniversalPointed unit n ω E e) (V : C)
    (hV : IsUnipotentLength unit n V) (f g : E ⟶ V)
    (he : (ω.map f).hom e = (ω.map g).hom e) : f = g := by sorry

noncomputable def pointedIso {E F : C} {e : ω.obj E} {f : ω.obj F}
    (hE : IsUniversalPointed unit n ω E e)
    (hF : IsUniversalPointed unit n ω F f) : E ≅ F := by sorry
end IsUniversalPointed

-- test: universal_eval_unique
example {E V : C} {e : ω.obj E} (h : IsUniversalPointed unit n ω E e)
    (hV : IsUnipotentLength unit n V) (f g : E ⟶ V)
    (he : (ω.map f).hom e = (ω.map g).hom e) : f = g := by sorry

end Universal

section ConcreteUniversalTests
variable {k : Type u} [Field k]

-- test: universal_unit
example : IsUniversalPointed (ModuleCat.of k k) 0 (𝟭 (ModuleCat k))
    (ModuleCat.of k k) (1 : k) := by sorry

-- test: universal_extra_summand
example : ∃ f g : (k × k) →ₗ[k] k,
    f (1, 0) = 1 ∧ g (1, 0) = 1 ∧ f ≠ g := by sorry

-- test: realization_nontrivial_rank_one
example (a : k) (h : a ≠ 1) (n : ℕ) : (a - 1) ^ n ≠ 0 := by sorry

-- A genuine nilpotent operator for the rank-two unipotent extension test.
def jordan : (k × k) →ₗ[k] k × k where
  toFun z := (z.2, 0)
  map_add' := by sorry
  map_smul' := by sorry

-- test: realization_extension
-- test: length_nonsplit_extension (the local Jordan obstruction)
example : jordan (k := k) ≠ 0 ∧
    (jordan (k := k)).comp (jordan (k := k)) = 0 := by sorry

end ConcreteUniversalTests

section TensorPoints
variable {C : Type u} [Category.{v} C] [MonoidalCategory C]
variable {D : Type w} [Category D] [MonoidalCategory D]

/-- Point carrier only; neutral reconstruction supplies its affine representability. -/
abbrev UnipotentFundamentalGroup (F : LaxMonoidalFunctor C D) := Aut F

namespace UnipotentFundamentalGroup
theorem points (F : LaxMonoidalFunctor C D) :
    UnipotentFundamentalGroup F = Aut F := by sorry

def pullback {E : Type*} [Category E] (T : LaxMonoidalFunctor C D ⥤ E)
    (F : LaxMonoidalFunctor C D) : UnipotentFundamentalGroup F →* Aut (T.obj F) where
  toFun g := T.mapIso g
  map_one' := by sorry
  map_mul' := by sorry

theorem map_comp {E : Type*} [Category E] {E' : Type*} [Category E']
    (T : LaxMonoidalFunctor C D ⥤ E) (S : E ⥤ E')
    (F : LaxMonoidalFunctor C D) (g : UnipotentFundamentalGroup F) :
    (T ⋙ S).mapIso g = S.mapIso (T.mapIso g) := by sorry
end UnipotentFundamentalGroup

/-- Genuine monoidal natural isomorphisms, rather than all natural transformations. -/
abbrev TensorPath (F G : LaxMonoidalFunctor C D) := F ≅ G

namespace TensorPath
def identity (F : LaxMonoidalFunctor C D) : TensorPath F F := Iso.refl F

def rightMul {F G : LaxMonoidalFunctor C D} (p : TensorPath F G) (g : Aut F) :
    TensorPath F G := g ≪≫ p

def comp {F G H : LaxMonoidalFunctor C D} (q : TensorPath G H) (p : TensorPath F G) :
    TensorPath F H := p ≪≫ q

def inverse {F G : LaxMonoidalFunctor C D} (p : TensorPath F G) : TensorPath G F := p.symm

def conjugate {F G : LaxMonoidalFunctor C D} (p : TensorPath F G) : Aut F ≃* Aut G where
  toFun g := p.symm ≪≫ g ≪≫ p
  invFun g := p ≪≫ g ≪≫ p.symm
  left_inv := by sorry
  right_inv := by sorry
  map_mul' := by sorry

theorem ext {F G : LaxMonoidalFunctor C D} {p q : TensorPath F G}
    (h : ∀ E : C, p.hom.hom.app E = q.hom.hom.app E) : p = q := by sorry

-- test: path_identity_comp
example {F G : LaxMonoidalFunctor C D} (p : TensorPath F G) :
    comp (identity G) p = p ∧ comp p (identity F) = p := by sorry
-- test: path_right_action_free
example {F G : LaxMonoidalFunctor C D} (p : TensorPath F G) (g : Aut F)
    (h : rightMul p g = p) : g = 1 := by sorry
-- test: path_comp_order
example {F G H : LaxMonoidalFunctor C D} (p : TensorPath F G) (q : TensorPath G H)
    (E : C) : (comp q p).hom.hom.app E = p.hom.hom.app E ≫ q.hom.hom.app E := by sorry

end TensorPath
end TensorPoints

section FixedHopf
variable (k H A : Type u) [Field k] [CommRing H] [HopfAlgebra k H]
variable [CommRing A] [Algebra k A]

namespace UnipotentFundamentalGroup
noncomputable def fixedHopf : WithConv (H →ₐ[k] A) ≃*
    UnipotentFundamentalGroup (TauCeti.FGComoduleCat.scalarExtensionMonoidalFunctor k H A) :=
  TauCeti.Tannaka.fgPointTensorIsoEquiv k H A
end UnipotentFundamentalGroup

-- test: group_fixed_hopf
example : Nonempty (WithConv (H →ₐ[k] A) ≃*
    UnipotentFundamentalGroup (TauCeti.FGComoduleCat.scalarExtensionMonoidalFunctor k H A)) := by sorry

end FixedHopf

section TensorUnitTests
variable {k : Type u} [Field k]

-- The unit object test is on actual monoidal natural transformations of ModuleCat.
-- test: group_trivial_category
example (p : Aut (LaxMonoidalFunctor.of (𝟭 (ModuleCat k)))) : p = 1 := by sorry

-- test: group_unit_constraint
example [CharZero k] : ¬ ∃ p : Aut (LaxMonoidalFunctor.of (𝟭 (ModuleCat k))),
    p.hom.hom.app (ModuleCat.of k k) = 2 • (𝟙 (ModuleCat.of k k)) := by sorry

end TensorUnitTests

section Depth
variable {G : Type u} [Group G]

/-- Abstract indexing prototype of Gamma_(n+1); the geometric version uses closed schemes. -/
abbrev UnipotentDepth (n : ℕ) := (⊤ : Subgroup G).lowerCentralSeries n

namespace UnipotentDepth
def quotient (n : ℕ) : G →* G ⧸ (UnipotentDepth (G := G) n) := QuotientGroup.mk' _

def transition (m n : ℕ) (hmn : m ≤ n) :
    (G ⧸ UnipotentDepth (G := G) n) →* (G ⧸ UnipotentDepth (G := G) m) := by sorry

theorem nativeIndex (n : ℕ) :
    UnipotentDepth (G := G) (n + 1) =
      ⁅UnipotentDepth (G := G) n, (⊤ : Subgroup G)⁆ := by sorry

-- test: depth_zero
example : Subsingleton (G ⧸ UnipotentDepth (G := G) 0) := by sorry
-- test: depth_index
example : UnipotentDepth (G := G) 1 = commutator G := by sorry

end UnipotentDepth

-- test: depth_one_abelian
example {H : Type u} [CommGroup H] : UnipotentDepth (G := H) 1 = ⊥ := by sorry
end Depth

section LengthAlgebra
variable {k A : Type u} [Field k] [Ring A] [Algebra k A]

-- A finite power of a two-sided augmentation ideal; this helper is not a new
-- proposed general ideal API. It keeps the noncommutative quotient honest.
private noncomputable def augmentationPower (I : TwoSidedIdeal A) : ℕ → TwoSidedIdeal A
  | 0 => ⊤
  | n + 1 => TwoSidedIdeal.span
      {x | ∃ a b : A, a ∈ I ∧ b ∈ augmentationPower I n ∧ a * b = x}

/-- Actual associative finite augmentation quotient. Completion belongs to the full contract. -/
noncomputable abbrev UnipotentLengthAlgebra (ε : A →ₐ[k] k) (n : ℕ) :=
  (augmentationPower (TwoSidedIdeal.ker ε) (n + 1)).ringCon.Quotient

namespace UnipotentLengthAlgebra
noncomputable def augmentation (ε : A →ₐ[k] k) (n : ℕ) :
    UnipotentLengthAlgebra ε n →+* k := by sorry

noncomputable def transition (ε : A →ₐ[k] k) (n : ℕ) :
    UnipotentLengthAlgebra ε (n + 1) →+* UnipotentLengthAlgebra ε n := by sorry

-- test: length_algebra_zero
example (ε : A →ₐ[k] k) : Nonempty (UnipotentLengthAlgebra ε 0 ≃+* k) := by sorry
end UnipotentLengthAlgebra
end LengthAlgebra

section PrimitiveTests
variable {k : Type u} [Field k]

-- test: length_algebra_ga
example : Nonempty (UnipotentLengthAlgebra (Polynomial.aeval (0 : k)) 1 ≃+*
    TrivSqZeroExt k k) := by sorry

-- test: length_algebra_not_hopf
example [CharZero k] :
    let T : TrivSqZeroExt k k := TrivSqZeroExt.inr (1 : k)
    T ^ 2 = 0 ∧
      ((T ⊗ₜ[k] (1 : TrivSqZeroExt k k)) + ((1 : TrivSqZeroExt k k) ⊗ₜ[k] T)) ^ 2 ≠ 0 := by sorry

end PrimitiveTests

section FinitePaths
variable {k : Type w} [Field k] {C : Type u} [Category.{v} C]
variable (ω ν ξ : C ⥤ ModuleCat.{w} k)

/-- In the geometric instance C here is the full length-n subcategory, not a tensor closure. -/
abbrev FinitePathModule := ω ⟶ ν

namespace FinitePathModule
def eval (E : C) (e : ω.obj E) : FinitePathModule ω ν →ₗ[k] ν.obj E where
  toFun α := (α.app E).hom e
  map_add' := by sorry
  map_smul' := by sorry

noncomputable def evalEquiv (E : C) (e : ω.obj E)
    (h : Function.Bijective (eval ω ν E e)) : FinitePathModule ω ν ≃ₗ[k] ν.obj E :=
  LinearEquiv.ofBijective (eval ω ν E e) h

def comp (q : FinitePathModule ν ξ) (p : FinitePathModule ω ν) :
    FinitePathModule ω ξ := p ≫ q

def rightMul (p : FinitePathModule ω ν) (a : FinitePathModule ω ω) :
    FinitePathModule ω ν := a ≫ p

-- The full contract reverses endpoints and composition, not a transpose at the same object.

-- test: finite_path_zero
example (E : C) (e : ω.obj E) : eval ω ν E e 0 = 0 := by sorry
-- test: finite_path_comp_order
example (p : FinitePathModule ω ν) (q : FinitePathModule ν ξ) (E : C) :
    (comp ω ν ξ q p).app E = p.app E ≫ q.app E := by sorry
end FinitePathModule
end FinitePaths

section FinitePathUnitTest
variable {k : Type u} [Field k]
-- test: finite_path_not_tensor
example : ¬ ∃ p : Aut (LaxMonoidalFunctor.of (𝟭 (ModuleCat k))), p.hom.hom = 0 := by sorry
end FinitePathUnitTest

section AffineWords
variable {k : Type u} [Field k] {ι : Type v}

/-- Finite word indices for the affine universal connection, not another shuffle algebra. -/
abbrev BoundedWord (ι : Type v) (n : ℕ) := {w : List ι // w.length ≤ n}
abbrev WordModule (k : Type u) [Field k] (ι : Type v) (n : ℕ) := BoundedWord ι n →₀ k

noncomputable def prepend (n : ℕ) (i : ι) : WordModule k ι n →ₗ[k] WordModule k ι n :=
  Finsupp.linearCombination k (fun w =>
    if h : (i :: w.val).length ≤ n then Finsupp.single ⟨i :: w.val, h⟩ 1 else 0)

noncomputable def AffineUniversalConnection (n : ℕ) (i : ι) :
    WordModule k ι n →ₗ[k] WordModule k ι n := -(prepend (k := k) n i)

namespace AffineUniversalConnection
noncomputable def empty (n : ℕ) : WordModule k ι n := Finsupp.single ⟨[], by simp⟩ 1

theorem nabla (n : ℕ) (i : ι) :
    AffineUniversalConnection (k := k) n i = -(prepend (k := k) n i) := by sorry

-- discards degrees above the destination, rather than retaining an overflow generator.

-- the full rank is sum_{j=0}^n m^j for m cohomology generators.

-- test: affine_length_zero
example (i : ι) : AffineUniversalConnection (k := k) 0 i = 0 := by sorry
-- test: affine_one_generator
example (i : ι) :
    prepend (k := k) 1 i (empty (k := k) (ι := ι) 1) =
      Finsupp.single ⟨[i], by simp⟩ 1 ∧
    prepend (k := k) 1 i (Finsupp.single ⟨[i], by simp⟩ 1) = 0 := by sorry
-- test: affine_order_noncommuting
example (i j : ι) (h : i ≠ j) :
    prepend (k := k) 2 i (Finsupp.single ⟨[j], by simp⟩ 1) ≠
      Finsupp.single ⟨[j, i], by simp⟩ 1 := by sorry

end AffineUniversalConnection
end AffineWords

section AffineDerivation
variable {k A Ω : Type u} [Field k] [CommRing A] [Algebra k A]
variable [AddCommGroup Ω] [Module A Ω] [Module k Ω] [IsScalarTower k A Ω]
variable (d : Derivation k A Ω)
-- The scalar part of the actual connection is an existing derivation, not a
-- function with an assumed opaque Leibniz condition.
example (a b : A) : d (a * b) = a • d b + b • d a := by sorry
end AffineDerivation

section Filtration
variable {k V : Type u} [Field k] [AddCommGroup V] [Module k V]

/-- Endpoint Hodge flag data; no geometric uniqueness theorem is a field. -/
structure FilteredPathFiber where
  filtration : ℤ → Submodule k V
  antitone : Antitone filtration
  bounded : ∃ a b : ℤ, filtration a = ⊤ ∧ filtration b = ⊥

namespace FilteredPathFiber

-- invented at every endpoint of a nontrivial torsor.

def dual (F : FilteredPathFiber (k := k) (V := V)) :
    FilteredPathFiber (k := k) (V := Module.Dual k V) where
  filtration i := (F.filtration (1 - i)).dualAnnihilator
  antitone := by sorry
  bounded := by sorry

def truncate (F : FilteredPathFiber (k := k) (V := V)) (W : Submodule k V) :
    FilteredPathFiber (k := k) (V := V ⧸ W) where
  filtration i := (F.filtration i).map W.mkQ
  antitone := by sorry
  bounded := by sorry

-- test: filtered_augmentation_quotient
example (F : FilteredPathFiber (k := k) (V := V)) (W : Submodule k V) (i : ℤ) :
    (truncate F W).filtration i = (F.filtration i).map W.mkQ := by sorry

end FilteredPathFiber

def degreeFlag (k : Type u) [Field k] (d : ℤ) : FilteredPathFiber (k := k) (V := k) where
  filtration i := if i ≤ d then ⊤ else ⊥
  antitone := by sorry
  bounded := by sorry

-- test: filtered_unit
example : (degreeFlag k 0).filtration 0 = ⊤ ∧ (degreeFlag k 0).filtration 1 = ⊥ := by sorry
-- test: filtered_dual_index
example : ((degreeFlag k 1).dual).filtration (-1) = ⊤ ∧
    ((degreeFlag k 1).dual).filtration 0 = ⊥ := by sorry

end Filtration

section Horizontal
variable {k M N E F H : Type u} [Field k]
variable [AddCommGroup M] [Module k M] [AddCommGroup N] [Module k N]
variable [AddCommGroup E] [Module k E] [AddCommGroup F] [Module k F]
variable [AddCommGroup H] [Module k H]

/-- On actual disc sections, horizontal vectors are the kernel of the connection. -/
abbrev RigidHorizontalFiber (conn : M →ₗ[k] N) := LinearMap.ker conn

namespace RigidHorizontalFiber
abbrev horizontal (conn : M →ₗ[k] N) := RigidHorizontalFiber conn

noncomputable def eval (conn : M →ₗ[k] N) (e : M →ₗ[k] E)
    (h : Function.Bijective (e.comp (LinearMap.ker conn).subtype)) :
    RigidHorizontalFiber conn ≃ₗ[k] E :=
  LinearEquiv.ofBijective (e.comp (LinearMap.ker conn).subtype) h

def transport (eb : M ≃ₗ[k] E) (ex : M ≃ₗ[k] F) : E ≃ₗ[k] F := eb.symm.trans ex

theorem transport_comp (eb : M ≃ₗ[k] E) (ex : M ≃ₗ[k] F) (ey : M ≃ₗ[k] H) :
    (transport eb ex).trans (transport ex ey) = transport eb ey := by sorry

-- The bijectivity input above is the native linear consequence of the geometric theorem,
-- not a definition of a category of supposed geometric objects.

-- test: rigid_same_endpoint
example (eb : M ≃ₗ[k] E) : transport eb eb = LinearEquiv.refl k E := by sorry

end RigidHorizontalFiber

-- Additional finite linear consequence: composition of nilpotent transports.
example (T : M →ₗ[k] M) (h : T.comp T = 0) (x y z : k) :
    (LinearMap.id + (z - y) • T).comp (LinearMap.id + (y - x) • T) =
      LinearMap.id + (z - x) • T := by sorry

end Horizontal

section HorizontalPolynomialTests
variable {k : Type u} [Field k] [CharZero k]

-- test: rigid_unit
-- A polynomial model of (O,d) has precisely constant horizontal sections. A zero
-- operator on all sections would wrongly make every nonconstant polynomial horizontal.
example (p : Polynomial k) (x : k) :
    Polynomial.derivative p = 0 ↔ p = Polynomial.C (p.eval x) := by sorry

-- test: rigid_nilpotent_transport
-- For N(a,b)=(b,0), the solution of d s=N s dt with initial value (a,b) at x
-- is (a+(t-x)b,b). This checks the sign against the differential equation itself.
example (a b x y : k) :
    let s₁ := Polynomial.C a + (Polynomial.X - Polynomial.C x) * Polynomial.C b
    let s₂ := Polynomial.C b
    Polynomial.derivative s₁ = s₂ ∧ Polynomial.derivative s₂ = 0 ∧
      (s₁.eval x, s₂.eval x) = (a, b) ∧
      (s₁.eval y, s₂.eval y) = (a + (y - x) * b, b) := by sorry

end HorizontalPolynomialTests

section Frobenius
variable {k M N : Type u} [Field k]
variable [AddCommGroup M] [Module k M] [AddCommGroup N] [Module k N]

/-- Native linear conjugation component of the geometric endpoint Frobenius operator. -/
def PathFrobenius (φ : M ≃ₗ[k] M) (τ : M ≃ₗ[k] N) : N ≃ₗ[k] N :=
  τ.symm.trans (φ.trans τ)

namespace PathFrobenius
def fixedLift (φ : M ≃ₗ[k] M) := φ
def transport (φ : M ≃ₗ[k] M) (τ : M ≃ₗ[k] N) := PathFrobenius φ τ

theorem changeLift (φ : M ≃ₗ[k] M) (τ : M ≃ₗ[k] N) (v : M) :
    PathFrobenius φ τ (τ v) = τ (φ v) := by sorry

-- test: frobenius_fixed_lifts
example (φ : M ≃ₗ[k] M) : PathFrobenius φ (LinearEquiv.refl k M) = φ := by sorry
-- The linear conjugation formula; the endpoint-sensitive test follows below.
example (φ : M ≃ₗ[k] M) (τ : M ≃ₗ[k] N) (v : N) :
    PathFrobenius φ τ v = τ (φ (τ.symm v)) := by sorry
-- test: frobenius_conjugation_fixed
example (φ : M ≃ₗ[k] M) (τ : M ≃ₗ[k] N) (v : M) (h : φ v = v) :
    PathFrobenius φ τ (τ v) = τ v := by sorry

end PathFrobenius
end Frobenius

section TwoSidedTransportTest
variable {k B B₀ X X₀ : Type u} [Field k]
variable [AddCommGroup B] [Module k B] [AddCommGroup B₀] [Module k B₀]
variable [AddCommGroup X] [Module k X] [AddCommGroup X₀] [Module k X₀]

-- test: frobenius_two_sided
-- tb transports b to b₀; tx transports x₀ to x. Both endpoint maps are needed:
-- tau(g)=tx ∘ g ∘ tb. This is the finite Hom-space component of equation (41).
example (tb : B ≃ₗ[k] B₀) (tx : X₀ ≃ₗ[k] X)
    (φ : (B₀ →ₗ[k] X₀) ≃ₗ[k] (B₀ →ₗ[k] X₀))
    (g : B₀ →ₗ[k] X₀) (v : B) :
    PathFrobenius φ (tb.symm.arrowCongr tx) ((tb.symm.arrowCongr tx) g) v =
      tx (φ g (tb v)) := by sorry

end TwoSidedTransportTest

section FixedPath
variable {P : Type u}

/-- Choose the unique fixed path after the geometric Lang theorem proves existence. -/
noncomputable def CanonicalFrobeniusPath (φ : P → P) (h : ∃! p, φ p = p) : P :=
  h.choose

namespace CanonicalFrobeniusPath
theorem fixed (φ : P → P) (h : ∃! p, φ p = p) :
    φ (CanonicalFrobeniusPath φ h) = CanonicalFrobeniusPath φ h := by sorry

theorem unique (φ : P → P) (h : ∃! p, φ p = p) (p : P) (hp : φ p = p) :
    p = CanonicalFrobeniusPath φ h := by sorry

-- unique fixed points for an arbitrary self-map do not imply this power statement.

-- test: canonical_equal_endpoint
-- At equal endpoints the path torsor is the tensor automorphism group, and its
-- identity is fixed by every group endomorphism. Uniqueness selects that identity.
example {G : Type u} [Group G] (φ : G →* G) (h : ∃! g, φ g = g) :
    CanonicalFrobeniusPath φ h = 1 := by sorry
-- test: canonical_additive
example (c : ℚ) : (∃! z : ℚ, 2 * z + c = z) ∧
    ∀ h : ∃! z : ℚ, 2 * z + c = z,
      CanonicalFrobeniusPath (fun z : ℚ => 2 * z + c) h = -c := by sorry
-- test: canonical_identity_fails
example : ¬ ∃! z : ℚ, (id z) = z := by sorry

end CanonicalFrobeniusPath
end FixedPath

end TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty.NC2

end LayerNC2

/-! ## Layer NC.3: the central obstruction, algebra-valued cohomology and Selmer functors -/

section LayerNC3

noncomputable section
open CategoryTheory
namespace TauCeti.NonabelianCohomology.NC3
universe u

-- The cocycles `Z1`, classes `H1` and coefficient maps are those of the cohomological core above.
namespace SupplierInterface
variable (G U : Type u) [Group G] [TopologicalSpace G]
  [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
  [MulDistribMulAction G U] [ContinuousSMul G U]
/-- The class of a cocycle, with the groups explicit. -/
abbrev classOf (c : Z1 G U) : H1 G U := H1.mk c
/-- The coefficient map on `H1` along a continuous equivariant homomorphism. -/
abbrev map {G U V : Type u} [Group G] [TopologicalSpace G]
    [Group U] [TopologicalSpace U] [IsTopologicalGroup U]
    [MulDistribMulAction G U] [ContinuousSMul G U]
    [Group V] [TopologicalSpace V] [IsTopologicalGroup V]
    [MulDistribMulAction G V] [ContinuousSMul G V]
    (f : U →ₜ* V) (hf : ∀ (g : G) x, f (g • x) = g • f x) : H1 G U → H1 G V :=
  H1.map f.toMonoidHom f.continuous hf
end SupplierInterface
open SupplierInterface

section Abelian
variable {G H M N : Type u} [Group G] [TopologicalSpace G]
  [Group H] [TopologicalSpace H]
  [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
  [DistribMulAction G M] [ContinuousSMul G M]
  [AddCommGroup N] [TopologicalSpace N] [IsTopologicalAddGroup N]
  [DistribMulAction H N] [ContinuousSMul H N]

namespace SupplierInterface
/-- The abelian comparison of the cohomological core. -/
abbrev abelianEquiv : H1 G (Multiplicative M) ≃ TauCeti.ContCohomology.H1 G M :=
  H1.equivContCohomology G M
def pullH1 (φ : H →ₜ* G) (f : M →+ N) (hf : Continuous f)
    (hequiv : ∀ (h : H) m, f (φ h • m) = h • f m) :
    H1 G (Multiplicative M) → H1 H (Multiplicative N) := sorry
lemma abelianEquiv_class (c : Z1 G (Multiplicative M)) :
    abelianEquiv (classOf G (Multiplicative M) c) =
      TauCeti.ContCohomology.H1pi G M
        ⟨fun g => Multiplicative.toAdd (c.val g), by sorry⟩ := by sorry
lemma pullH1_class (φ : H →ₜ* G) (f : M →+ N) (hf : Continuous f)
    (hequiv : ∀ (h : H) m, f (φ h • m) = h • f m)
    (c : Z1 G (Multiplicative M)) :
    pullH1 φ f hf hequiv (classOf G (Multiplicative M) c) =
      classOf H (Multiplicative N)
        ⟨fun h => Multiplicative.ofAdd (f (Multiplicative.toAdd (c.val (φ h)))),
          by sorry, by sorry⟩ := by sorry
end SupplierInterface
/-- NC.3/canonical-comparison-naturality: the actual compatible-pair square. -/
theorem comparison_naturality (φ : H →ₜ* G) (f : M →+ N) (hf : Continuous f)
    (hequiv : ∀ (h : H) m, f (φ h • m) = h • f m)
    (x : H1 G (Multiplicative M)) :
    SupplierInterface.abelianEquiv (SupplierInterface.pullH1 φ f hf hequiv x) =
      TauCeti.ContCohomology.explicitMap1 G M H N φ f hf hequiv
        (SupplierInterface.abelianEquiv x) := by sorry
end Abelian

section Inflation
variable (G M : Type u) [Group G] [TopologicalSpace G]
  [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
  [DistribMulAction G M] [ContinuousSMul G M]
  (N : Subgroup G) [N.Normal]
  [ContinuousSMul (G ⧸ N) (FixedPoints.addSubgroup N M)]
namespace SupplierInterface

def inflateH1 : H1 (G ⧸ N) (Multiplicative (FixedPoints.addSubgroup N M)) →
    H1 G (Multiplicative M) := sorry
lemma inflateH1_class (c : Z1 (G ⧸ N) (Multiplicative (FixedPoints.addSubgroup N M))) :
    inflateH1 G M N (classOf (G ⧸ N) (Multiplicative (FixedPoints.addSubgroup N M)) c) =
      classOf G (Multiplicative M)
        ⟨fun g => Multiplicative.ofAdd
          ((Multiplicative.toAdd (c.val (QuotientGroup.mk g))).val), by sorry, by sorry⟩ := by sorry
end SupplierInterface
/-- The inflation square is computed on the canonical invariant coefficients. -/
theorem comparison_inflation
    (x : H1 (G ⧸ N) (Multiplicative (FixedPoints.addSubgroup N M))) :
    SupplierInterface.abelianEquiv (SupplierInterface.inflateH1 G M N x) =
      TauCeti.ContCohomology.explicitInfl1 G M N
        (SupplierInterface.abelianEquiv x) := by sorry
end Inflation

section Defect
variable {G B : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [Group B] [TopologicalSpace B] [IsTopologicalGroup B]
  [MulDistribMulAction G B] [ContinuousSMul G B]
/-- NC.3/positive-defect: the positive, left-ordered multiplicative defect. -/
def positiveDefect (b : G → B) (g h : G) : B := b g * (g • b h) * (b (g * h))⁻¹
lemma positiveDefect_apply (b : G → B) (g h : G) :
    positiveDefect b g h = b g * (g • b h) * (b (g * h))⁻¹ := by sorry
lemma positiveDefect_continuous (b : G → B) (hb : Continuous b) :
    Continuous (fun p : G × G => positiveDefect b p.1 p.2) := by sorry
lemma positiveDefect_eq_one_iff (b : G → B) :
    (∀ g h, positiveDefect b g h = 1) ↔ ∀ g h, b (g * h) = b g * (g • b h) := by sorry
lemma positiveDefect_kernel {C : Type u} [Group C] [MulDistribMulAction G C]
    (q : B →* C) (hq : ∀ (g : G) x, q (g • x) = g • q x)
    (b : G → B) (hc : ∀ g h, q (b (g * h)) = q (b g) * (g • q (b h))) (g h : G) :
    q (positiveDefect b g h) = 1 := by sorry
-- TauCeti.NonabelianCohomology.NC3.positiveDefect_cocycle — a genuine cocycle has zero defect.
example (c : Z1 G B) (g h : G) : positiveDefect c.val g h = 1 := by sorry
-- TauCeti.NonabelianCohomology.NC3.positiveDefect_identity — a non-normalized lift retains its value at the identity.
example (b : G → B) : positiveDefect b 1 1 = b 1 := by sorry
-- TauCeti.NonabelianCohomology.NC3.positiveDefect_inverse — the sign is the positive defect, not Kim's inverse convention.
example (b : G → B) (g h : G) :
    (positiveDefect b g h)⁻¹ = b (g * h) * (g • b h)⁻¹ * (b g)⁻¹ := by sorry

variable {M : Type u} [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
  [DistribMulAction G M] [ContinuousSMul G M]
/-- NC.3/continuous-central-obstruction: descend the actual central defect into Z2. -/
theorem centralDefect_mem_Z2
    (i : Multiplicative M →* B) (hi : Function.Injective i)
    (hcentral : ∀ m b, i m * b = b * i m)
    (hequiv : ∀ (g : G) m, i (Multiplicative.ofAdd (g • Multiplicative.toAdd m)) = g • i m)
    (b : G → B) (f : G × G → M) (hf : Continuous f)
    (hdefect : ∀ g h, i (Multiplicative.ofAdd (f (g,h))) = positiveDefect b g h) :
    f ∈ TauCeti.ContCohomology.Z2 G M := by sorry
/-- Changing a central lift adds exactly d1 of a continuous one-cochain. -/
theorem centralDefect_change_lift
    (i : Multiplicative M →* B) (hcentral : ∀ m b, i m * b = b * i m)
    (hequiv : ∀ (g : G) m, i (Multiplicative.ofAdd (g • Multiplicative.toAdd m)) = g • i m)
    (b : G → B) (a : G → M) (g h : G) :
    positiveDefect (fun k => i (Multiplicative.ofAdd (a k)) * b k) g h =
      i (Multiplicative.ofAdd (TauCeti.ContCohomology.d1 G M a (g,h))) *
        positiveDefect b g h := by sorry
/-- Vanishing in continuous H2 supplies a continuous correction, not an arbitrary cochain. -/
theorem centralDefect_lift_exact
    (i : Multiplicative M →* B) (hi : Function.Injective i)
    (hcentral : ∀ m b, i m * b = b * i m)
    (hequiv : ∀ (g : G) m, i (Multiplicative.ofAdd (g • Multiplicative.toAdd m)) = g • i m)
    (b : G → B) (f : TauCeti.ContCohomology.Z2 G M)
    (hdefect : ∀ g h, i (Multiplicative.ofAdd (f.val (g,h))) = positiveDefect b g h) :
    TauCeti.ContCohomology.H2pi G M f = 0 ↔
      ∃ a : G → M, Continuous a ∧
        ∀ g h, positiveDefect (fun k => i (Multiplicative.ofAdd (a k)) * b k) g h = 1 := by sorry
-- TauCeti.NonabelianCohomology.NC3.positiveDefect_additive
example (a : G → M) (g h : G) :
    Multiplicative.toAdd (positiveDefect (fun k => Multiplicative.ofAdd (a k)) g h) =
      TauCeti.ContCohomology.d1 G M a (g,h) := by sorry
end Defect

section CoefficientFamily
variable (K G : Type u) [CommRing K] [Group G] [TopologicalSpace G]
/-- NC.3/galois-coefficient-family: continuous semilinear points varying with a K-algebra. -/
structure GaloisCoefficientFamily where
  obj : CommAlgCat.{u} K → Type u
  group : ∀ R, Group (obj R)
  topology : ∀ R, TopologicalSpace (obj R)
  topGroup : ∀ R, @IsTopologicalGroup (obj R) (topology R) (group R)
  action : ∀ R, letI := group R; MulDistribMulAction G (obj R)
  continuousAction : ∀ R, letI := group R; letI := topology R;
    letI := action R; ContinuousSMul G (obj R)
  map : ∀ {R S}, (R ⟶ S) → @ContinuousMonoidHom (obj R) (obj S)
    (group R).toMonoid (group S).toMonoid (topology R) (topology S)
  map_smul : ∀ {R S} (f : R ⟶ S) g x, map f ((action R).toSMul.smul g x) =
    (action S).toSMul.smul g (map f x)
  map_id : ∀ R x, map (𝟙 R) x = x
  map_comp : ∀ {R S T} (f : R ⟶ S) (g : S ⟶ T) x, map (f ≫ g) x = map g (map f x)
attribute [instance] GaloisCoefficientFamily.group GaloisCoefficientFamily.topology
  GaloisCoefficientFamily.topGroup GaloisCoefficientFamily.action
  GaloisCoefficientFamily.continuousAction
variable {K G}
namespace GaloisCoefficientFamily
lemma equivariance (P : GaloisCoefficientFamily K G) {R S} (f : R ⟶ S) (g : G) x :
    P.map f (g • x) = g • P.map f x := by sorry
lemma identity (P : GaloisCoefficientFamily K G) (R) (x : P.obj R) : P.map (𝟙 R) x = x := by sorry
lemma composition (P : GaloisCoefficientFamily K G) {R S T}
    (f : R ⟶ S) (g : S ⟶ T) (x : P.obj R) : P.map (f ≫ g) x = P.map g (P.map f x) := by sorry
lemma continuous (P : GaloisCoefficientFamily K G) {R S} (f : R ⟶ S) : Continuous (P.map f) := by sorry
-- Tests distinguish semilinear maps, actual group maps, and continuity.
-- TauCeti.NonabelianCohomology.NC3.GaloisCoefficientFamily.map_mul_test
example (P : GaloisCoefficientFamily K G) {R S} (f : R ⟶ S) (x y : P.obj R) :
    P.map f (x * y) = P.map f x * P.map f y := by sorry
-- TauCeti.NonabelianCohomology.NC3.GaloisCoefficientFamily.map_one_test
example (P : GaloisCoefficientFamily K G) {R S} (f : R ⟶ S) : P.map f 1 = 1 := by sorry
-- TauCeti.NonabelianCohomology.NC3.GaloisCoefficientFamily.semilinear_test
example (P : GaloisCoefficientFamily K G) {R S} (f : R ⟶ S) (g : G) x :
    P.map f (g • x) = g • P.map f x := by sorry
-- TauCeti.NonabelianCohomology.NC3.GaloisCoefficientFamily.identity_test
example (P : GaloisCoefficientFamily K G) (R) (x : P.obj R) :
    P.map (𝟙 R) x = x := by sorry
-- TauCeti.NonabelianCohomology.NC3.GaloisCoefficientFamily.composition_test
example (P : GaloisCoefficientFamily K G) {R S T}
    (f : R ⟶ S) (g : S ⟶ T) (x : P.obj R) :
    P.map (f ≫ g) x = P.map g (P.map f x) := by sorry
end GaloisCoefficientFamily

/-- NC.3/cohomology-functor: the actual gauge-orbit functor on coefficient algebras. -/
def cohomologyFunctor (P : GaloisCoefficientFamily K G) : CommAlgCat.{u} K ⥤ Type u where
  obj R := H1 G (P.obj R)
  map f := TypeCat.ofHom (SupplierInterface.map (P.map f) (P.map_smul f))
  map_id := by sorry
  map_comp := by sorry
lemma cohomologyFunctor_obj (P : GaloisCoefficientFamily K G) (R) :
    (cohomologyFunctor P).obj R = H1 G (P.obj R) := by sorry
lemma cohomologyFunctor_map_class (P : GaloisCoefficientFamily K G) {R S}
    (f : R ⟶ S) (c : Z1 G (P.obj R)) :
    (cohomologyFunctor P).map f (classOf G (P.obj R) c) =
      classOf G (P.obj S) ⟨fun g => P.map f (c.val g), by sorry, by sorry⟩ := by sorry
lemma cohomologyFunctor_map_one (P : GaloisCoefficientFamily K G) {R S} (f : R ⟶ S) :
    (cohomologyFunctor P).map f (1 : H1 G (P.obj R)) = (1 : H1 G (P.obj S)) := by sorry
lemma cohomologyFunctor_map_id (P : GaloisCoefficientFamily K G) (R)
    (x : (cohomologyFunctor P).obj R) : (cohomologyFunctor P).map (𝟙 R) x = x := by sorry
lemma cohomologyFunctor_map_comp (P : GaloisCoefficientFamily K G) {R S T}
    (f : R ⟶ S) (g : S ⟶ T) (x : (cohomologyFunctor P).obj R) :
    (cohomologyFunctor P).map (f ≫ g) x = (cohomologyFunctor P).map g ((cohomologyFunctor P).map f x) := by sorry
-- TauCeti.NonabelianCohomology.NC3.cohomologyFunctor_neutral_test
example (P : GaloisCoefficientFamily K G) {R S} (f : R ⟶ S) :
    (cohomologyFunctor P).map f (classOf G (P.obj R) 1) = (1 : H1 G (P.obj S)) := by sorry
-- TauCeti.NonabelianCohomology.NC3.cohomologyFunctor_identity_test
example (P : GaloisCoefficientFamily K G) (R) (x : H1 G (P.obj R)) :
    (cohomologyFunctor P).map (𝟙 R) x = x := by sorry
-- TauCeti.NonabelianCohomology.NC3.cohomologyFunctor_gauge_test
example (P : GaloisCoefficientFamily K G) {R S} (f : R ⟶ S) (x : P.obj R)
    (c : Z1 G (P.obj R)) :
    (cohomologyFunctor P).map f (classOf G (P.obj R) (x • c)) =
      (cohomologyFunctor P).map f (classOf G (P.obj R) c) := by sorry
-- TauCeti.NonabelianCohomology.NC3.cohomologyFunctor_representative_test
example (P : GaloisCoefficientFamily K G) {R S} (f : R ⟶ S)
    (c : Z1 G (P.obj R)) (d : Z1 G (P.obj S))
    (hd : ∀ g, d.val g = P.map f (c.val g)) :
    (cohomologyFunctor P).map f (classOf G (P.obj R) c) =
      classOf G (P.obj S) d := by sorry
end CoefficientFamily

section Loci
variable {K : Type u} [CommRing K]
variable (F T : CommAlgCat.{u} K ⥤ Type u) (f : F ⟶ T)
  (e : ∀ R, T.obj R) (he : ∀ {R S} (a : R ⟶ S), T.map a (e R) = e S)
/-- NC.3/local-neutral-locus: exact neutralization, with arbitrary algebra points. -/
def neutralLocus (he : ∀ {R S} (a : R ⟶ S), T.map a (e R) = e S) : CommAlgCat.{u} K ⥤ Type u where
  obj R := {x : F.obj R // f.app R x = e R}
  map a := TypeCat.ofHom (fun x => ⟨F.map a x.val, by sorry⟩)
  map_id := by sorry
  map_comp := by sorry
lemma neutralLocus_mem (R) (x : F.obj R) :
    (∃ y : (neutralLocus F T f e he).obj R, y.val = x) ↔ f.app R x = e R := by sorry
lemma neutralLocus_ext (R) (x y : (neutralLocus F T f e he).obj R) :
    x = y ↔ x.val = y.val := by sorry
lemma neutralLocus_map_val {R S} (a : R ⟶ S) (x : (neutralLocus F T f e he).obj R) :
    ((neutralLocus F T f e he).map a x).val = F.map a x.val := by sorry
def neutralLocus_inclusion : neutralLocus F T f e he ⟶ F := sorry
def neutralLocus_lift {E : CommAlgCat.{u} K ⥤ Type u} (a : E ⟶ F)
    (ha : ∀ R x, f.app R (a.app R x) = e R) : E ⟶ neutralLocus F T f e he := sorry
lemma neutralLocus_inclusion_val (R) (x : (neutralLocus F T f e he).obj R) :
    (neutralLocus_inclusion F T f e he).app R x = x.val := by sorry
lemma neutralLocus_inclusion_injective (R) :
    Function.Injective ((neutralLocus_inclusion F T f e he).app R) := by sorry
lemma neutralLocus_lift_comp {E : CommAlgCat.{u} K ⥤ Type u} (a : E ⟶ F)
    (ha : ∀ R x, f.app R (a.app R x) = e R) :
    neutralLocus_lift F T f e he a ha ≫ neutralLocus_inclusion F T f e he = a := by sorry
lemma neutralLocus_lift_unique {E : CommAlgCat.{u} K ⥤ Type u} (a : E ⟶ F)
    (ha : ∀ R x, f.app R (a.app R x) = e R) (b : E ⟶ neutralLocus F T f e he)
    (hb : b ≫ neutralLocus_inclusion F T f e he = a) :
    b = neutralLocus_lift F T f e he a ha := by sorry
-- TauCeti.NonabelianCohomology.NC3.neutralLocus_reject_test
example (R) (x : F.obj R) (hx : f.app R x ≠ e R) :
    ¬ ∃ y : (neutralLocus F T f e he).obj R, y.val = x := by sorry
-- TauCeti.NonabelianCohomology.NC3.neutralLocus_neutral_test
example (R) (x : (neutralLocus F T f e he).obj R) : f.app R x.val = e R := by sorry
-- TauCeti.NonabelianCohomology.NC3.neutralLocus_basechange_test
example {R S} (a : R ⟶ S) (x : (neutralLocus F T f e he).obj R) :
    ((neutralLocus F T f e he).map a x).val = F.map a x.val := by sorry
end Loci

section Selmer
variable {K : Type u} [CommRing K] {ι : Type u}
variable (F : CommAlgCat.{u} K ⥤ Type u) (L : ι → CommAlgCat.{u} K ⥤ Type u)
  (r : ∀ v, F ⟶ L v) (C : ∀ v R, Set ((L v).obj R))
  (hC : ∀ v {R S} (a : R ⟶ S) x, x ∈ C v R → (L v).map a x ∈ C v S)
/-- NC.3/selmer-functor: impose every specified local condition. -/
def selmerFunctor (hC : ∀ v {R S} (a : R ⟶ S) x, x ∈ C v R → (L v).map a x ∈ C v S) : CommAlgCat.{u} K ⥤ Type u where
  obj R := {x : F.obj R // ∀ v, (r v).app R x ∈ C v R}
  map a := TypeCat.ofHom (fun x => ⟨F.map a x.val, by sorry⟩)
  map_id := by sorry
  map_comp := by sorry
lemma selmerFunctor_mem (R) (x : F.obj R) :
    (∃ y : (selmerFunctor F L r C hC).obj R, y.val = x) ↔ ∀ v, (r v).app R x ∈ C v R := by sorry
lemma selmerFunctor_ext (R) (x y : (selmerFunctor F L r C hC).obj R)
    (h : x.val = y.val) : x = y := by sorry
def selmerFunctor_inclusion : selmerFunctor F L r C hC ⟶ F := sorry
def selmerFunctor_localization (v : ι) : selmerFunctor F L r C hC ⟶ L v := sorry
lemma selmerFunctor_map_val {R S} (a : R ⟶ S) (x : (selmerFunctor F L r C hC).obj R) :
    ((selmerFunctor F L r C hC).map a x).val = F.map a x.val := by sorry
lemma selmerFunctor_inclusion_val (R) (x : (selmerFunctor F L r C hC).obj R) :
    (selmerFunctor_inclusion F L r C hC).app R x = x.val := by sorry
lemma selmerFunctor_inclusion_injective (R) :
    Function.Injective ((selmerFunctor_inclusion F L r C hC).app R) := by sorry
lemma selmerFunctor_localization_val (v : ι) (R)
    (x : (selmerFunctor F L r C hC).obj R) :
    (selmerFunctor_localization F L r C hC v).app R x = (r v).app R x.val := by sorry
-- Empty collection: the functor is the whole global cohomology functor.
-- TauCeti.NonabelianCohomology.NC3.selmerFunctor_empty_test
example (hι : IsEmpty ι) (R) :
    ∃ e : (selmerFunctor F L r C hC).obj R ≃ F.obj R, ∀ x, e x = x.val := by sorry
-- A rejected class at any one bad place must be rejected globally.
-- TauCeti.NonabelianCohomology.NC3.selmerFunctor_bad_place_test
example (R) (x : F.obj R) (v : ι) (hx : (r v).app R x ∉ C v R) :
    ¬ ∃ y : (selmerFunctor F L r C hC).obj R, y.val = x := by sorry
-- Universal local conditions impose no constraint.
-- TauCeti.NonabelianCohomology.NC3.selmerFunctor_universal_test
example (h : ∀ v R, C v R = Set.univ) (R) :
    ∃ e : (selmerFunctor F L r C hC).obj R ≃ F.obj R, ∀ x, e x = x.val := by sorry
end Selmer

end TauCeti.NonabelianCohomology.NC3
end

end LayerNC3

/-! ## Layer NC.4: unipotent Albanese maps and Chabauty–Kim loci -/

section LayerNC4

open CategoryTheory

namespace TauCeti.ChabautyKim

section TorsorPoints
variable {U P : Type*} [Group U] [Torsor Uᵐᵒᵖ P]

/-- Point reduction of the ratio pφ · u = pH. -/
def admissiblePeriod (H : Subgroup U) (pφ pH : P) : U ⧸ H :=
  QuotientGroup.mk (MulOpposite.unop (pH /ₛ pφ : Uᵐᵒᵖ))

lemma admissiblePeriod_eq_mk (H : Subgroup U) (pφ pH : P) (u : U)
    (hu : MulOpposite.op u • pφ = pH) :
    admissiblePeriod H pφ pH = (QuotientGroup.mk u : U ⧸ H) := by sorry

lemma admissiblePeriod_hodge_change (H : Subgroup U) (pφ pH : P) (h : H) :
    admissiblePeriod H pφ (MulOpposite.op (h : U) • pH) =
      admissiblePeriod H pφ pH := by sorry

lemma admissiblePeriod_eq_iff (H : Subgroup U) (pφ pH pH' : P) :
    admissiblePeriod H pφ pH = admissiblePeriod H pφ pH' ↔
      (MulOpposite.unop (pH /ₛ pφ : Uᵐᵒᵖ))⁻¹ *
        MulOpposite.unop (pH' /ₛ pφ : Uᵐᵒᵖ) ∈ H := by sorry

lemma admissiblePeriod_self (H : Subgroup U) (pφ : P) :
    admissiblePeriod H pφ pφ = (QuotientGroup.mk 1 : U ⧸ H) := by sorry

lemma admissiblePeriod_transport {P' : Type*} [Torsor Uᵐᵒᵖ P']
    (H : Subgroup U) (f : P ≃ P')
    (hf : ∀ (g : Uᵐᵒᵖ) (p : P), f (g • p) = g • f p) (pφ pH : P) :
    admissiblePeriod H (f pφ) (f pH) = admissiblePeriod H pφ pH := by sorry

-- admissiblePeriod_identity
example (H : Subgroup U) (g : U) :
    admissiblePeriod H (MulOpposite.op (1 : U)) (MulOpposite.op g) =
      (QuotientGroup.mk g : U ⧸ H) := by sorry

-- admissiblePeriod_right_change
example (H : Subgroup U) (g : U) (h : H) :
    admissiblePeriod H (MulOpposite.op (1 : U)) (MulOpposite.op (g * h)) =
      admissiblePeriod H (MulOpposite.op (1 : U)) (MulOpposite.op g) := by sorry

-- admissiblePeriod_inverse_fixed_path: pφ is a forward path, not the ratio itself.
example :
    let g : Multiplicative ℚ := Multiplicative.ofAdd 1
    let H : Subgroup (Multiplicative ℚ) := ⊥
    admissiblePeriod H (MulOpposite.op g) (MulOpposite.op 1) =
        (QuotientGroup.mk g⁻¹ : Multiplicative ℚ ⧸ H) ∧
      admissiblePeriod H (MulOpposite.op g) (MulOpposite.op 1) ≠
        (QuotientGroup.mk g : Multiplicative ℚ ⧸ H) := by sorry

-- admissiblePeriod_left_change_fails: H=<swap(0,1)> is nonnormal in S₃.
example :
    let h : Equiv.Perm (Fin 3) := Equiv.swap 0 1
    let g : Equiv.Perm (Fin 3) := Equiv.swap 1 2
    let H := Subgroup.closure ({h} : Set (Equiv.Perm (Fin 3)))
    admissiblePeriod H (MulOpposite.op (1 : Equiv.Perm (Fin 3)))
        (MulOpposite.op (h * g)) ≠
      admissiblePeriod H (MulOpposite.op (1 : Equiv.Perm (Fin 3)))
        (MulOpposite.op g) := by sorry

/-- Point-family reduction; the geometric family itself is imported from NC.2. -/
def localAlbanese {Y : Type*} (H : Subgroup U) (P : Y → Type*)
    [∀ y, Torsor Uᵐᵒᵖ (P y)] (pφ pH : ∀ y, P y) : Y → U ⧸ H :=
  fun y => admissiblePeriod H (pφ y) (pH y)

lemma localAlbanese_apply {Y : Type*} (H : Subgroup U) (P : Y → Type*)
    [∀ y, Torsor Uᵐᵒᵖ (P y)] (pφ pH : ∀ y, P y) (y : Y) :
    localAlbanese H P pφ pH y = admissiblePeriod H (pφ y) (pH y) := by sorry

lemma localAlbanese_base {Y : Type*} (H : Subgroup U) (P : Y → Type*)
    [∀ y, Torsor Uᵐᵒᵖ (P y)] (pφ pH : ∀ y, P y) (b : Y) (hb : pH b = pφ b) :
    localAlbanese H P pφ pH b = (QuotientGroup.mk 1 : U ⧸ H) := by sorry

lemma localAlbanese_reindex {Y Z : Type*} (H : Subgroup U) (P : Y → Type*)
    [t : ∀ y, Torsor Uᵐᵒᵖ (P y)] (pφ pH : ∀ y, P y) (f : Z → Y) :
    letI : ∀ z, Torsor Uᵐᵒᵖ ((P ∘ f) z) := fun z => t (f z)
    localAlbanese H (P ∘ f) (fun z => pφ (f z)) (fun z => pH (f z)) =
      localAlbanese H P pφ pH ∘ f := by sorry

lemma localAlbanese_hodge_change {Y : Type*} (H : Subgroup U) (P : Y → Type*)
    [∀ y, Torsor Uᵐᵒᵖ (P y)] (pφ pH : ∀ y, P y) (h : Y → H) :
    localAlbanese H P pφ (fun y => MulOpposite.op (h y : U) • pH y) =
      localAlbanese H P pφ pH := by sorry

-- Point reduction on actual equivariant torsor maps and their induced coset map.
-- The full schematic central-quotient construction is imported, not inferred here.
lemma localAlbanese_tower {V Y : Type*} [Group V] (H : Subgroup U) (J : Subgroup V)
    (P : Y → Type*) (P' : Y → Type*)
    [∀ y, Torsor Uᵐᵒᵖ (P y)] [∀ y, Torsor Vᵐᵒᵖ (P' y)]
    (f : U →* V) (F : ∀ y, P y → P' y) (q : U ⧸ H → V ⧸ J)
    (hq : ∀ u, q (QuotientGroup.mk u) = (QuotientGroup.mk (f u) : V ⧸ J))
    (hF : ∀ y (u : U) (p : P y),
      F y (MulOpposite.op u • p) = MulOpposite.op (f u) • F y p)
    (pφ pH : ∀ y, P y) (pφ' pH' : ∀ y, P' y)
    (hφ : ∀ y, F y (pφ y) = pφ' y) (hH : ∀ y, F y (pH y) = pH' y) :
    q ∘ localAlbanese H P pφ pH = localAlbanese J P' pφ' pH' := by sorry

-- localAlbanese_self_family
example {Y : Type*} (H : Subgroup U) (P : Y → Type*)
    [∀ y, Torsor Uᵐᵒᵖ (P y)] (pφ : ∀ y, P y) :
    localAlbanese H P pφ pφ = fun _ => (QuotientGroup.mk 1 : U ⧸ H) := by sorry

-- localAlbanese_trivial_hodge
example (g : U) :
    localAlbanese (⊥ : Subgroup U) (fun _ : U => Uᵐᵒᵖ)
        (fun _ => MulOpposite.op 1) MulOpposite.op g =
      (QuotientGroup.mk g : U ⧸ (⊥ : Subgroup U)) := by sorry

-- localAlbanese_fibre_change
example {Y : Type*} (H : Subgroup U) (g : Y → U) (h : Y → H) :
    localAlbanese H (fun _ : Y => Uᵐᵒᵖ) (fun _ => MulOpposite.op 1)
        (fun y => MulOpposite.op (g y * h y)) =
      localAlbanese H (fun _ : Y => Uᵐᵒᵖ) (fun _ => MulOpposite.op 1)
        (fun y => MulOpposite.op (g y)) := by sorry
end TorsorPoints

section AffinePoints
variable {K A B R R' : Type*} [CommRing K] [CommRing A] [CommRing B]
  [CommRing R] [CommRing R'] [Algebra K A] [Algebra K B]
  [Algebra K R] [Algebra K R']

/-- Coordinate-point reduction of an already represented period morphism. -/
def crystallinePeriodMap (dStar : A →ₐ[K] B) (c : B →ₐ[K] R) : A →ₐ[K] R :=
  c.comp dStar

lemma crystallinePeriodMap_apply (dStar : A →ₐ[K] B) (c : B →ₐ[K] R) (a : A) :
    crystallinePeriodMap dStar c a = c (dStar a) := by sorry

lemma crystallinePeriodMap_coeff (dStar : A →ₐ[K] B) (c : B →ₐ[K] R)
    (α : R →ₐ[K] R') :
    α.comp (crystallinePeriodMap dStar c) = crystallinePeriodMap dStar (α.comp c) :=
  by sorry

lemma crystallinePeriodMap_neutral (dStar : A →ₐ[K] B)
    (εB : B →ₐ[K] K) (εA : A →ₐ[K] K) (hε : εB.comp dStar = εA) :
    crystallinePeriodMap dStar εB = εA := by sorry

lemma crystallinePeriodMap_tower {A' B' : Type*} [CommRing A'] [CommRing B']
    [Algebra K A'] [Algebra K B'] (dStar : A →ₐ[K] B) (dStar' : A' →ₐ[K] B')
    (qA : A' →ₐ[K] A) (qB : B' →ₐ[K] B)
    (h : dStar.comp qA = qB.comp dStar') (c : B →ₐ[K] R) :
    (crystallinePeriodMap dStar c).comp qA =
      crystallinePeriodMap dStar' (c.comp qB) := by sorry

-- The universal point c=id_B is already sufficient to detect equality of d*.
lemma crystallinePeriodMap_ext (dStar dStar' : A →ₐ[K] B)
    (h : crystallinePeriodMap dStar (AlgHom.id K B) =
      crystallinePeriodMap dStar' (AlgHom.id K B)) : dStar = dStar' := by sorry

-- crystallinePeriodMap_identity
example (c : A →ₐ[K] R) : crystallinePeriodMap (AlgHom.id K A) c = c := by sorry

-- crystallinePeriodMap_universal
example (dStar : A →ₐ[K] B) :
    crystallinePeriodMap dStar (AlgHom.id K B) = dStar := by sorry

-- crystallinePeriodMap_dual_numbers: retained infinitesimal point, not its reduction.
example :
    let c : Polynomial ℚ →ₐ[ℚ] DualNumber ℚ := Polynomial.aeval DualNumber.eps
    crystallinePeriodMap (AlgHom.id ℚ (Polynomial ℚ)) c Polynomial.X =
      DualNumber.eps ∧ (DualNumber.eps : DualNumber ℚ) ≠ 0 := by sorry
end AffinePoints

section RepresentedMorphisms
variable {Base : AlgebraicGeometry.Scheme}
  {B S L Q S' L' Q' C : Over Base}

/-- Represented Selmer localization followed by a represented crystalline period. -/
def selmerPeriod (loc : S ⟶ L) (D : L ⟶ Q) : S ⟶ Q := loc ≫ D

lemma selmerPeriod_def (loc : S ⟶ L) (D : L ⟶ Q) :
    selmerPeriod loc D = loc ≫ D := by sorry

lemma selmerPeriod_point (loc : S ⟶ L) (D : L ⟶ Q) (s : B ⟶ S) :
    s ≫ selmerPeriod loc D = (s ≫ loc) ≫ D := by sorry

lemma selmerPeriod_precompose (loc : S ⟶ L) (D : L ⟶ Q) (s : B ⟶ S) (f : C ⟶ B) :
    (f ≫ s) ≫ selmerPeriod loc D = f ≫ (s ≫ selmerPeriod loc D) := by sorry

lemma selmerPeriod_tower (loc : S ⟶ L) (D : L ⟶ Q)
    (loc' : S' ⟶ L') (D' : L' ⟶ Q') (qS : S ⟶ S') (qL : L ⟶ L') (qQ : Q ⟶ Q')
    (hloc : loc ≫ qL = qS ≫ loc') (hD : D ≫ qQ = qL ≫ D') :
    selmerPeriod loc D ≫ qQ = qS ≫ selmerPeriod loc' D' := by sorry

lemma selmerPeriod_neutral (loc : S ⟶ L) (D : L ⟶ Q)
    (eS : B ⟶ S) (eL : B ⟶ L) (eQ : B ⟶ Q)
    (hloc : eS ≫ loc = eL) (hD : eL ≫ D = eQ) :
    eS ≫ selmerPeriod loc D = eQ := by sorry

-- selmerPeriod_identity_local
example (loc : S ⟶ L) : selmerPeriod loc (𝟙 L) = loc := by sorry
-- selmerPeriod_identity_global
example (D : L ⟶ Q) : selmerPeriod (𝟙 L) D = D := by sorry
-- selmerPeriod_point_associativity
example (loc : S ⟶ L) (D : L ⟶ Q) (s : B ⟶ S) :
    s ≫ selmerPeriod loc D = (s ≫ loc) ≫ D := by sorry

-- The geometric base is Spec Q_p. Over Base retains the supplied structure maps and
-- their commutativity; composition is between schemes over that same actual base.
end RepresentedMorphisms

section PointLoci
variable {Y X S L Q Sm Lm Qm : Type*}

def crystallineLocus (jet : Y → L) (loc : S → L) : Set Y := jet ⁻¹' Set.range loc

def deRhamLocus (j : Y → Q) (ell : S → Q) : Set Y := j ⁻¹' Set.range ell

-- Z is the supplied rational point subset of the geometric image closure. This
-- definition alone neither computes that closure nor turns it into a rational image.
def closedDeRhamLocus (j : Y → Q) (Z : Set Q) : Set Y := j ⁻¹' Z

lemma crystallineLocus_mem (jet : Y → L) (loc : S → L) (y : Y) :
    y ∈ crystallineLocus jet loc ↔ ∃ s, loc s = jet y := by sorry

lemma deRhamLocus_mem (j : Y → Q) (ell : S → Q) (y : Y) :
    y ∈ deRhamLocus j ell ↔ ∃ s, ell s = j y := by sorry

lemma closedDeRhamLocus_mem (j : Y → Q) (Z : Set Q) (y : Y) :
    y ∈ closedDeRhamLocus j Z ↔ j y ∈ Z := by sorry

lemma kimLoci_inclusions (jet : Y → L) (loc : S → L) (D : L → Q)
    (j : Y → Q) (Z : Set Q) (hj : D ∘ jet = j) (hZ : Set.range (D ∘ loc) ⊆ Z) :
    crystallineLocus jet loc ⊆ deRhamLocus j (D ∘ loc) ∧
      deRhamLocus j (D ∘ loc) ⊆ closedDeRhamLocus j Z := by sorry

lemma deRhamLocus_mono {S' : Type*} (j : Y → Q) (ell : S → Q) (ell' : S' → Q)
    (h : Set.range ell ⊆ Set.range ell') :
    deRhamLocus j ell ⊆ deRhamLocus j ell' := by sorry

lemma kimLoci_ext (jet jet' : Y → L) (j j' : Y → Q) (loc loc' : S → L)
    (ell ell' : S → Q) (Z Z' : Set Q)
    (hjet : jet = jet') (hj : j = j') (hloc : Set.range loc = Set.range loc')
    (hell : Set.range ell = Set.range ell') (hZ : Z = Z') :
    crystallineLocus jet loc = crystallineLocus jet' loc' ∧
      deRhamLocus j ell = deRhamLocus j' ell' ∧
      closedDeRhamLocus j Z = closedDeRhamLocus j' Z' := by sorry

-- kimLoci_identity
example (j : Y → Q) : deRhamLocus j (id : Q → Q) = Set.univ := by sorry
-- kimLoci_empty_source
example (j : Y → Q) (ell : Empty → Q) : deRhamLocus j ell = ∅ := by sorry
-- kimLoci_square_image: the supplied Z=univ is correct for the geometric square map;

example :
    (-1 : ℚ) ∉ deRhamLocus id (fun u : ℚ => u ^ 2) ∧
      (-1 : ℚ) ∈ closedDeRhamLocus id (Set.univ : Set ℚ) := by sorry

/-- Point consequence of the global-to-local path square and local period triangle. -/
theorem fundamental_diagram (i : X → Y) (glob : X → S) (loc : S → L)
    (jet : Y → L) (D : L → Q) (j : Y → Q)
    (hglobal : loc ∘ glob = jet ∘ i) (hlocal : D ∘ jet = j) :
    (D ∘ loc) ∘ glob = j ∘ i := by sorry

/-- Witness projection gives the decreasing tower for the point-image loci. -/
theorem locus_compatibilities (j : Y → Q) (ell : S → Q) (jm : Y → Qm)
    (ellm : Sm → Qm) (qS : S → Sm) (qQ : Q → Qm)
    (hj : qQ ∘ j = jm) (hell : qQ ∘ ell = ellm ∘ qS) :
    deRhamLocus j ell ⊆ deRhamLocus jm ellm := by sorry

-- The geometric closed-image projection, condition-change and D-injective variants

-- injective-D point consequence is included separately.
lemma crystallineLocus_eq_deRhamLocus (jet : Y → L) (loc : S → L)
    (D : L → Q) (hD : Function.Injective D) :
    crystallineLocus jet loc = deRhamLocus (D ∘ jet) (D ∘ loc) := by sorry

theorem rational_integral_containment (i : X → Y) (glob : X → S)
    (jet : Y → L) (loc : S → L) (D : L → Q) (j : Y → Q) (Z : Set Q)
    (hglobal : loc ∘ glob = jet ∘ i) (hlocal : D ∘ jet = j)
    (hZ : Set.range (D ∘ loc) ⊆ Z) :
    Set.range i ⊆ crystallineLocus jet loc ∧
      crystallineLocus jet loc ⊆ deRhamLocus j (D ∘ loc) ∧
      deRhamLocus j (D ∘ loc) ⊆ closedDeRhamLocus j Z := by sorry

lemma global_finite_of_local_locus_finite (i : X → Y) (C : Set Y)
    (hi : Function.Injective i) (hC : C.Finite) (h : Set.range i ⊆ C) :
    (Set.univ : Set X).Finite := by sorry
end PointLoci

section RegularEvaluation
variable {K A Y Z : Type*} [CommRing K] [CommRing A] [Algebra K A]

/-- Pullback by actual affine K-points, retaining multiplication and constants. -/
def regularAlbanesePullback (j : Y → (A →ₐ[K] K)) : A →ₐ[K] (Y → K) where
  toFun f y := j y f
  map_zero' := by sorry
  map_one' := by sorry
  map_add' := by sorry
  map_mul' := by sorry
  commutes' := by sorry

lemma regularAlbanesePullback_apply (j : Y → (A →ₐ[K] K)) (f : A) (y : Y) :
    regularAlbanesePullback j f y = j y f := by sorry
lemma regularAlbanesePullback_add (j : Y → (A →ₐ[K] K)) (f g : A) :
    regularAlbanesePullback j (f + g) =
      regularAlbanesePullback j f + regularAlbanesePullback j g := by sorry
lemma regularAlbanesePullback_mul (j : Y → (A →ₐ[K] K)) (f g : A) :
    regularAlbanesePullback j (f * g) =
      regularAlbanesePullback j f * regularAlbanesePullback j g := by sorry
lemma regularAlbanesePullback_const (j : Y → (A →ₐ[K] K)) (r : K) :
    regularAlbanesePullback j (algebraMap K A r) = fun _ => r := by sorry
lemma regularAlbanesePullback_reindex (j : Y → (A →ₐ[K] K)) (g : Z → Y) (f : A) :
    regularAlbanesePullback (j ∘ g) f = regularAlbanesePullback j f ∘ g := by sorry

-- This is the affine-coordinate consequence of density, not a predicate pretending
-- to define density of the missing geometric Albanese map.
lemma regularAlbanesePullback_injective_disc (j : Y → (A →ₐ[K] K)) (B : Set Y)
    (hB : ∀ f : A, (∀ y ∈ B, j y f = 0) → f = 0) :
    Function.Injective (fun f : A => fun y : B => regularAlbanesePullback j f y) :=
  by sorry

-- regularAlbanesePullback_affine_coordinate
example (a : ℚ) :
    regularAlbanesePullback (fun x : ℚ => Polynomial.aeval x) Polynomial.X a = a :=
  by sorry
-- regularAlbanesePullback_product_test
example (a : ℚ) :
    regularAlbanesePullback (fun x : ℚ => Polynomial.aeval x)
        (Polynomial.X * (Polynomial.X + 1)) a = a * (a + 1) := by sorry
-- regularAlbanesePullback_unit_test
example :
    regularAlbanesePullback (fun x : ℚ => Polynomial.aeval x) 1 0 = 1 ∧
      regularAlbanesePullback (fun x : ℚ => Polynomial.aeval x) 1 0 ≠ 0 := by sorry
end RegularEvaluation

theorem finite_annihilator_locus {Y Q K : Type*} [Zero K] (j : Y → Q)
    (Z : Set Q) (f : Q → K) (hZ : ∀ q ∈ Z, f q = 0)
    (hf : {y : Y | f (j y) = 0}.Finite) :
    (closedDeRhamLocus j Z).Finite := by sorry

section DepthOneLinear
variable {K V X : Type*} [Field K] [AddCommGroup V] [Module K V]

theorem depth_one_locus (j : X → V) (W : Subspace K V) :
    {x : X | j x ∈ W} =
      {x : X | ∀ ω : Module.Dual K V, ω ∈ W.dualAnnihilator → ω (j x) = 0} :=
  by sorry

lemma classical_locus_subset_selmer (j : X → V) (WMW WS : Subspace K V)
    (h : WMW ≤ WS) : {x : X | j x ∈ WMW} ⊆ {x : X | j x ∈ WS} := by sorry

lemma classical_locus_eq_selmer (j : X → V) (WMW WS : Subspace K V)
    (h : WMW = WS) : {x : X | j x ∈ WMW} = {x : X | j x ∈ WS} := by sorry

example (j : X → V) : {x : X | j x ∈ (⊤ : Subspace K V)} = Set.univ := by sorry
example (j : X → V) : {x : X | j x ∈ (⊥ : Subspace K V)} = {x | j x = 0} := by sorry

-- A Mordell–Weil rank bound alone does not bound the full Selmer period image.
example (j : X → V) (WMW : Subspace K V) :
    {x : X | j x ∈ WMW} ⊆ {x : X | j x ∈ (⊤ : Subspace K V)} := by sorry
end DepthOneLinear

end TauCeti.ChabautyKim

end LayerNC4

/-! ## Layer NC.5: quadratic Chabauty and height equations -/

section LayerNC5

set_option autoImplicit false
set_option warningAsError false

namespace TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty.NC5

open scoped TensorProduct BigOperators

universe u v w

section Correspondence
variable {k : Type u} [Field k]
variable {C : Type v} [AddCommGroup C] [Module k C]
variable {N : Type w} [AddCommGroup N] [Module k N]

/-- Linear interface for symmetry modulo pullbacks, zero trace and a nonzero class. -/
def IsNiceCorrespondence (P : Submodule k C) (swap : C →ₗ[k] C)
    (trace : C →ₗ[k] k) (cl : C →ₗ[k] N) (Z : C) : Prop :=
  swap Z - Z ∈ P ∧ trace Z = 0 ∧ cl Z ≠ 0

namespace IsNiceCorrespondence
theorem nonzero (P : Submodule k C) (swap : C →ₗ[k] C)
    (trace : C →ₗ[k] k) (cl : C →ₗ[k] N) {Z : C}
    (h : IsNiceCorrespondence P swap trace cl Z) : Z ≠ 0 := by sorry

theorem smul (P : Submodule k C) (swap : C →ₗ[k] C)
    (trace : C →ₗ[k] k) (cl : C →ₗ[k] N) {Z : C}
    (h : IsNiceCorrespondence P swap trace cl Z) (a : k) (ha : a ≠ 0) :
    IsNiceCorrespondence P swap trace cl (a • Z) := by sorry

theorem add_pullback (P : Submodule k C) (swap : C →ₗ[k] C)
    (trace : C →ₗ[k] k) (cl : C →ₗ[k] N)
    (hP : ∀ z ∈ P, swap z - z ∈ P)
    (htrace : P ≤ trace.ker) (hcl : P ≤ cl.ker) {Z d : C}
    (h : IsNiceCorrespondence P swap trace cl Z) (hd : d ∈ P) :
    IsNiceCorrespondence P swap trace cl (Z + d) := by sorry
end IsNiceCorrespondence

-- submodule, diagonal-degree normalization and Kunneth class map. Gap G1.

end Correspondence

section CorrespondenceTests
-- test: nice_nonzero_primitive
example : IsNiceCorrespondence (⊥ : Submodule ℚ (ℚ × ℚ))
    (LinearMap.id : (ℚ × ℚ) →ₗ[ℚ] ℚ × ℚ)
    (LinearMap.fst ℚ ℚ ℚ) (LinearMap.snd ℚ ℚ ℚ) (0, 1) := by sorry
-- test: nice_nonzero_trace
example : ¬ IsNiceCorrespondence (⊥ : Submodule ℚ (ℚ × ℚ))
    (LinearMap.id : (ℚ × ℚ) →ₗ[ℚ] ℚ × ℚ)
    (LinearMap.fst ℚ ℚ ℚ) (LinearMap.snd ℚ ℚ ℚ) (1, 1) := by sorry
-- test: nice_zero_class
example : ¬ IsNiceCorrespondence (⊥ : Submodule ℚ (ℚ × ℚ))
    (LinearMap.id : (ℚ × ℚ) →ₗ[ℚ] ℚ × ℚ)
    (0 : (ℚ × ℚ) →ₗ[ℚ] ℚ) (LinearMap.snd ℚ ℚ ℚ) (1, 0) := by sorry
end CorrespondenceTests

section CentralQuotient
variable {k : Type u} [Field k]
variable {T : Type v} [AddCommGroup T] [Module k T]

namespace DepthTwoHeightQuotient

abbrev central (q : T →ₗ[k] k) := T ⧸ q.ker

abbrev centralMap (q : T →ₗ[k] k) : T →ₗ[k] central q := q.ker.mkQ

noncomputable def centralEquiv (q : T →ₗ[k] k) (hq : Function.Surjective q) :
    central q ≃ₗ[k] k := q.quotKerEquivOfSurjective hq

theorem centralEquiv_apply (q : T →ₗ[k] k) (hq : Function.Surjective q) (z : T) :
    centralEquiv q hq (centralMap q z) = q z := by sorry

theorem centralMap_eq_zero (q : T →ₗ[k] k) (z : T) :
    centralMap q z = 0 ↔ q z = 0 := by sorry

-- DepthTwoHeightQuotient.geometric, projection, central_exact, commutator:

-- coker(cup-dual) → Q_p(1). Requires the NC.2 quotient and NC.3 pushout. Gap G1.
end DepthTwoHeightQuotient

-- test: quotient_coordinate
example : Function.Surjective (LinearMap.fst ℚ ℚ ℚ) ∧
    DepthTwoHeightQuotient.centralMap (LinearMap.fst ℚ ℚ ℚ) (3, 5) =
    DepthTwoHeightQuotient.centralMap (LinearMap.fst ℚ ℚ ℚ) (3, 0) := by sorry
-- test: quotient_zero_map
example (z : ℚ × ℚ) :
    DepthTwoHeightQuotient.centralMap (0 : (ℚ × ℚ) →ₗ[ℚ] ℚ) z = 0 := by sorry
-- test: quotient_retains_nonzero_class
example : DepthTwoHeightQuotient.centralMap (LinearMap.fst ℚ ℚ ℚ) (1, 0) ≠ 0 :=
  by sorry
end CentralQuotient

section TateClass
variable {k : Type u} [Field k]
variable {H : Type v} [AddCommGroup H] [Module k H]

/-- Nonvanishing and the four de Rham conditions of BDMTV section 4.4. -/
def IsAdmissibleTateClass (p : k) (phi : H →ₗ[k] H)
    (Fil1 : Submodule k (H ⊗[k] H)) (cup : (H ⊗[k] H) →ₗ[k] k)
    (Z : H ⊗[k] H) : Prop :=
  Z ≠ 0 ∧ TensorProduct.map phi phi Z = p • Z ∧
    Z ∈ Fil1 ∧ cup Z = 0 ∧ TensorProduct.comm k H H Z = -Z

namespace IsAdmissibleTateClass
theorem nonzero (p : k) (phi : H →ₗ[k] H)
    (Fil1 : Submodule k (H ⊗[k] H)) (cup : (H ⊗[k] H) →ₗ[k] k)
    {Z : H ⊗[k] H} (h : IsAdmissibleTateClass p phi Fil1 cup Z) : Z ≠ 0 := by sorry

theorem smul (p : k) (phi : H →ₗ[k] H)
    (Fil1 : Submodule k (H ⊗[k] H)) (cup : (H ⊗[k] H) →ₗ[k] k)
    {Z : H ⊗[k] H} (h : IsAdmissibleTateClass p phi Fil1 cup Z)
    (a : k) (ha : a ≠ 0) : IsAdmissibleTateClass p phi Fil1 cup (a • Z) := by sorry

theorem not_zero (p : k) (phi : H →ₗ[k] H)
    (Fil1 : Submodule k (H ⊗[k] H)) (cup : (H ⊗[k] H) →ₗ[k] k) :
    ¬ IsAdmissibleTateClass p phi Fil1 cup 0 := by sorry
end IsAdmissibleTateClass

-- The converse is deliberately absent: p-adic admissibility is insufficient.
end TateClass

section TateTests
def testPhi : (ℚ × ℚ) →ₗ[ℚ] ℚ × ℚ where
  toFun z := (z.1, 2 * z.2)
  map_add' := by sorry
  map_smul' := by sorry
def testWedge : (ℚ × ℚ) ⊗[ℚ] (ℚ × ℚ) :=
  (1, 0) ⊗ₜ[ℚ] (0, 1) - (0, 1) ⊗ₜ[ℚ] (1, 0)
-- An explicit bilinear functional detecting e1 ⊗ e2, used only in the linear tests.
def testCup : ((ℚ × ℚ) ⊗[ℚ] (ℚ × ℚ)) →ₗ[ℚ] ℚ :=
  TensorProduct.lift {
    toFun := fun z => z.1 • LinearMap.snd ℚ ℚ ℚ
    map_add' := by sorry
    map_smul' := by sorry }
-- test: tate_wedge_eigenvalue
example : IsAdmissibleTateClass 2 testPhi (⊤ : Submodule ℚ _)
    (0 : ((ℚ × ℚ) ⊗[ℚ] (ℚ × ℚ)) →ₗ[ℚ] ℚ) testWedge := by sorry
-- test: tate_zero_rejected
example : ¬ IsAdmissibleTateClass 2 testPhi (⊤ : Submodule ℚ _)
    (0 : ((ℚ × ℚ) ⊗[ℚ] (ℚ × ℚ)) →ₗ[ℚ] ℚ) 0 := by sorry
-- test: tate_symmetric_tensor_rejected
example : ¬ IsAdmissibleTateClass 2 testPhi (⊤ : Submodule ℚ _)
    (0 : ((ℚ × ℚ) ⊗[ℚ] (ℚ × ℚ)) →ₗ[ℚ] ℚ)
    ((1, 0) ⊗ₜ[ℚ] (0, 1) + (0, 1) ⊗ₜ[ℚ] (1, 0)) := by sorry
-- test: tate_wrong_frobenius
example : ¬ IsAdmissibleTateClass 2 (LinearMap.id : (ℚ × ℚ) →ₗ[ℚ] ℚ × ℚ)
    (⊤ : Submodule ℚ _)
    (0 : ((ℚ × ℚ) ⊗[ℚ] (ℚ × ℚ)) →ₗ[ℚ] ℚ) testWedge := by sorry
-- test: tate_wrong_filtration
example : ¬ IsAdmissibleTateClass 2 testPhi (⊥ : Submodule ℚ _)
    (0 : ((ℚ × ℚ) ⊗[ℚ] (ℚ × ℚ)) →ₗ[ℚ] ℚ) testWedge := by sorry
-- test: tate_nonzero_cup_rejected
example : ¬ IsAdmissibleTateClass 2 testPhi (⊤ : Submodule ℚ _)
    testCup testWedge := by sorry
end TateTests

section HeightModule
variable {k : Type u} [Field k]
variable {A T M : Type v} [AddCommGroup A] [Module k A]
    [AddCommGroup T] [Module k T] [AddCommGroup M] [Module k M]

/-- Quotient of the length-two module, killing exactly the kernel in its central grade. -/
abbrev DepthTwoHeightModule (i : T →ₗ[k] A) (q : T →ₗ[k] k) :=
  A ⧸ (q.ker.map i)

namespace DepthTwoHeightModule
abbrev mk (i : T →ₗ[k] A) (q : T →ₗ[k] k) : A →ₗ[k] DepthTwoHeightModule i q :=
  (q.ker.map i).mkQ

theorem relation (i : T →ₗ[k] A) (q : T →ₗ[k] k) (z : T) (hz : q z = 0) :
    mk i q (i z) = 0 := by sorry

def lift (i : T →ₗ[k] A) (q : T →ₗ[k] k) (f : A →ₗ[k] M)
    (hf : q.ker.map i ≤ f.ker) : DepthTwoHeightModule i q →ₗ[k] M :=
  (q.ker.map i).liftQ f hf

theorem lift_mk (i : T →ₗ[k] A) (q : T →ₗ[k] k) (f : A →ₗ[k] M)
    (hf : q.ker.map i ≤ f.ker) (a : A) : lift i q f hf (mk i q a) = f a := by sorry

theorem lift_unique (i : T →ₗ[k] A) (q : T →ₗ[k] k) (f : A →ₗ[k] M)
    (hf : q.ker.map i ≤ f.ker) (g : DepthTwoHeightModule i q →ₗ[k] M)
    (hg : ∀ a, g (mk i q a) = f a) : g = lift i q f hf := by sorry

-- DepthTwoHeightModule.geometric, grades, action, deRham:

end DepthTwoHeightModule

-- test: module_zero_quotient
example (z : ℚ) : DepthTwoHeightModule.mk (LinearMap.id : ℚ →ₗ[ℚ] ℚ)
    (0 : ℚ →ₗ[ℚ] ℚ) z = 0 := by sorry
-- test: module_identity_quotient
example : DepthTwoHeightModule.mk (LinearMap.id : ℚ →ₗ[ℚ] ℚ)
    (LinearMap.id : ℚ →ₗ[ℚ] ℚ) 1 ≠ 0 := by sorry
-- test: module_other_grades_preserved
example : DepthTwoHeightModule.mk (LinearMap.inr ℚ ℚ ℚ)
    (0 : ℚ →ₗ[ℚ] ℚ) (1, 0) ≠ 0 := by sorry
end HeightModule

-- HeightModuleTwist, HeightModuleTwist.neutral, .compose, .classes:

-- flag-preserving Galois representation with identity maps on all named grades.

-- pi1=0 does not imply c_Z=0.

-- acts freely on a nonempty fibre of the two adjacent-extension projections.
-- These test signatures need the actual torsor and mixed-extension categories, G1,G2.
-- twist_two_classes, twist_injective, height_module_comparison, away_height_vanishes,

section Preheight
variable {k : Type u} [Field k]
variable {V : Type v} [AddCommGroup V] [Module k V]

/-- The scalar inside the height-character evaluation, with both negative beta terms.
Geometrically s1 projects onto the chosen complement W and s2 onto Fil0. -/
def HeightPrevalue (s1 s2 : V →ₗ[k] V) (alpha : V)
    (betaPhi betaFil : Module.Dual k V) (gammaPhi gammaFil : k) : k :=
  gammaPhi - gammaFil - betaPhi (s1 alpha) - betaFil (s2 alpha)

namespace HeightPrevalue
theorem zero_alpha (s1 s2 : V →ₗ[k] V) (betaPhi betaFil : Module.Dual k V)
    (gammaPhi gammaFil : k) :
    HeightPrevalue s1 s2 0 betaPhi betaFil gammaPhi gammaFil = gammaPhi - gammaFil :=
  by sorry

theorem gamma_add (s1 s2 : V →ₗ[k] V) (alpha : V)
    (betaPhi betaFil : Module.Dual k V) (gammaPhi gammaFil a : k) :
    HeightPrevalue s1 s2 alpha betaPhi betaFil (gammaPhi + a) gammaFil =
    HeightPrevalue s1 s2 alpha betaPhi betaFil gammaPhi gammaFil + a := by sorry

theorem character_smul (chi : k →ₗ[k] k) (a z : k) : chi (a * z) = a * chi z :=
  by sorry

-- Requires G2, chosen Hodge splitting and the nonzero local linear character.
end HeightPrevalue

-- In this test frame W is the first coordinate and Fil0 is the second coordinate.
def firstProjection : (ℚ × ℚ) →ₗ[ℚ] ℚ × ℚ where
  toFun z := (z.1, 0)
  map_add' := by sorry
  map_smul' := by sorry
def secondProjection : (ℚ × ℚ) →ₗ[ℚ] ℚ × ℚ where
  toFun z := (0, z.2)
  map_add' := by sorry
  map_smul' := by sorry
-- test: preheight_two_negative_terms
example : HeightPrevalue firstProjection secondProjection (1, 2)
    (2 • LinearMap.fst ℚ ℚ ℚ) (3 • LinearMap.snd ℚ ℚ ℚ) 7 1 = -2 := by sorry
-- test: preheight_zero_alpha
example : HeightPrevalue firstProjection secondProjection (0, 0)
    (2 • LinearMap.fst ℚ ℚ ℚ) (3 • LinearMap.snd ℚ ℚ ℚ) 7 1 = 6 := by sorry
-- test: preheight_central_variation
example : HeightPrevalue firstProjection secondProjection (1, 2)
    (2 • LinearMap.fst ℚ ℚ ℚ) (3 • LinearMap.snd ℚ ℚ ℚ) 8 1 = -1 := by sorry
-- test: preheight_projection_order
example : HeightPrevalue secondProjection firstProjection (1, 2)
    (2 • LinearMap.fst ℚ ℚ ℚ) (3 • LinearMap.snd ℚ ℚ ℚ) 7 1 = 6 := by sorry
end Preheight

section HeightCoordinates
variable {k V : Type*} [Field k]
/-- Native fibre coordinate bijection; algebraic/geometric realization remains a gap. -/
def heightCoordinates (F : V → k) (a : k) (ha : a ≠ 0) : (V × k) ≃ (V × k) where
  toFun z := (z.1, a * (z.2 - F z.1))
  invFun z := (z.1, z.2 / a + F z.1)
  left_inv := by sorry
  right_inv := by sorry

-- ≅ H^1_f(G_p,V) × Q_p, using the mixed-extension classifier and a nonzero character.

-- heightCoordinates above supplies only the explicitly stated fibre set equivalence.
end HeightCoordinates

section AwayConstants
variable {k : Type u} [Field k]
variable {I : Type v} [Fintype I]

/-- Independent local upper bounds give a sound finite correction set. -/
def AwayHeightConstants (Gamma : I → Set k) : Set k :=
  {a | ∃ t : I → k, (∀ i, t i ∈ Gamma i) ∧ a = -(∑ i, t i)}

namespace AwayHeightConstants
theorem finite (Gamma : I → Set k) (h : ∀ i, (Gamma i).Finite) :
    (AwayHeightConstants Gamma).Finite := by sorry

theorem mem (Gamma : I → Set k) (t : I → k) (h : ∀ i, t i ∈ Gamma i) :
    -(∑ i, t i) ∈ AwayHeightConstants Gamma := by sorry

theorem mono (Gamma Delta : I → Set k) (h : ∀ i, Gamma i ⊆ Delta i) :
    AwayHeightConstants Gamma ⊆ AwayHeightConstants Delta := by sorry

theorem all_zero : AwayHeightConstants (fun _ : I => ({0} : Set k)) = {0} := by sorry

theorem height_sum (Gamma : I → Set k) (t : I → k) (ht : ∀ i, t i ∈ Gamma i)
    (hp globalHeight : k) (h : globalHeight = hp + ∑ i, t i) :
    hp - globalHeight ∈ AwayHeightConstants Gamma := by sorry
end AwayHeightConstants

-- test: away_empty
example : AwayHeightConstants (fun _ : Fin 0 => (∅ : Set ℚ)) = {0} := by sorry
-- test: away_nonzero_one_place
example : AwayHeightConstants (fun _ : Fin 1 => ({2} : Set ℚ)) = {-2} := by sorry
-- test: away_nonzero_two_places
example : AwayHeightConstants (fun i : Fin 2 => ({if i = 0 then 1 else 2} : Set ℚ)) =
    {-3} := by sorry
-- test: away_nonzero_cannot_be_dropped
example : (3 : ℚ) ∉ AwayHeightConstants (fun _ : Fin 1 => ({3} : Set ℚ)) ∧
    (0 : ℚ) ∉ AwayHeightConstants (fun _ : Fin 1 => ({3} : Set ℚ)) := by sorry
end AwayConstants

section Pair
variable {p : ℕ} [Fact p.Prime]
variable {X d : Type*} [Fintype d] {g : ℕ}

def heightJointCoordinates (AJ : X → Fin g → ℚ_[p]) (theta : X → ℚ_[p])
    (x : X) : Option (Fin g) → ℚ_[p]
  | none => theta x
  | some i => AJ x i

/-- Analyticity and polynomial density on EVERY nonempty open subdisc, plus containment. -/
def IsQuadraticChabautyPair (AJ : X → Fin g → ℚ_[p]) (theta : X → ℚ_[p])
    (Upsilon : Set ℚ_[p]) (E : (Fin g → ℚ_[p]) →ₗ[ℚ_[p]] (Fin g → ℚ_[p]))
    (c : Fin g → ℚ_[p])
    (B : (Fin g → ℚ_[p]) →ₗ[ℚ_[p]] (Fin g → ℚ_[p]) →ₗ[ℚ_[p]] ℚ_[p])
    (chart : d → ℚ_[p] → X) (localPoints rationalPoints : Set X) : Prop :=
  Upsilon.Finite ∧ rationalPoints ⊆ localPoints ∧
    localPoints ⊆ ⋃ i : d, chart i '' Metric.closedBall (0 : ℚ_[p]) 1 ∧
    (∀ i, AnalyticOnNhd ℚ_[p] (theta ∘ chart i) (Metric.closedBall 0 1) ∧
      ∀ j : Fin g, AnalyticOnNhd ℚ_[p] (fun t => AJ (chart i t) j)
        (Metric.closedBall 0 1)) ∧
    (∀ (i : d) (a : ℚ_[p]) (r : ℝ), a ∈ Metric.closedBall (0 : ℚ_[p]) 1 →
      0 < r → Metric.ball a r ⊆ Metric.closedBall (0 : ℚ_[p]) 1 →
      ∀ P : MvPolynomial (Option (Fin g)) ℚ_[p],
        (∀ t ∈ Metric.ball a r, MvPolynomial.eval
          (heightJointCoordinates AJ theta (chart i t)) P = 0) → P = 0) ∧
    ∀ x ∈ rationalPoints, theta x - B (AJ x) (E (AJ x) + c) ∈ Upsilon

namespace IsQuadraticChabautyPair
theorem rational_mem (AJ : X → Fin g → ℚ_[p]) (theta : X → ℚ_[p])
    (Upsilon : Set ℚ_[p]) (E : (Fin g → ℚ_[p]) →ₗ[ℚ_[p]] (Fin g → ℚ_[p]))
    (c : Fin g → ℚ_[p])
    (B : (Fin g → ℚ_[p]) →ₗ[ℚ_[p]] (Fin g → ℚ_[p]) →ₗ[ℚ_[p]] ℚ_[p])
    (chart : d → ℚ_[p] → X) (localPoints rationalPoints : Set X)
    (h : IsQuadraticChabautyPair AJ theta Upsilon E c B chart localPoints rationalPoints)
    {x : X} (hx : x ∈ rationalPoints) :
    x ∈ localPoints ∧ theta x - B (AJ x) (E (AJ x) + c) ∈ Upsilon := by sorry

theorem weaken_constants (AJ : X → Fin g → ℚ_[p]) (theta : X → ℚ_[p])
    (Upsilon : Set ℚ_[p]) (E : (Fin g → ℚ_[p]) →ₗ[ℚ_[p]] (Fin g → ℚ_[p]))
    (c : Fin g → ℚ_[p])
    (B : (Fin g → ℚ_[p]) →ₗ[ℚ_[p]] (Fin g → ℚ_[p]) →ₗ[ℚ_[p]] ℚ_[p])
    (chart : d → ℚ_[p] → X) (localPoints rationalPoints : Set X)
    (h : IsQuadraticChabautyPair AJ theta Upsilon E c B chart localPoints rationalPoints)
    (Upsilon' : Set ℚ_[p]) (hsub : Upsilon ⊆ Upsilon') (hfin : Upsilon'.Finite) :
    IsQuadraticChabautyPair AJ theta Upsilon' E c B chart localPoints rationalPoints :=
  by sorry

theorem non_graph (AJ : X → Fin g → ℚ_[p]) (theta : X → ℚ_[p])
    (Upsilon : Set ℚ_[p]) (E : (Fin g → ℚ_[p]) →ₗ[ℚ_[p]] (Fin g → ℚ_[p]))
    (c : Fin g → ℚ_[p])
    (B : (Fin g → ℚ_[p]) →ₗ[ℚ_[p]] (Fin g → ℚ_[p]) →ₗ[ℚ_[p]] ℚ_[p])
    (chart : d → ℚ_[p] → X) (localPoints rationalPoints : Set X)
    (h : IsQuadraticChabautyPair AJ theta Upsilon E c B chart localPoints rationalPoints)
    (i : d) (a : ℚ_[p]) (r : ℝ) (ha : a ∈ Metric.closedBall (0 : ℚ_[p]) 1)
    (hr : 0 < r) (hball : Metric.ball a r ⊆ Metric.closedBall (0 : ℚ_[p]) 1)
    (Q : MvPolynomial (Fin g) ℚ_[p]) :
    ¬ ∀ t ∈ Metric.ball a r, theta (chart i t) = MvPolynomial.eval (AJ (chart i t)) Q :=
  by sorry

-- IsQuadraticChabautyPair.geometric, .joint_dense, .height_construction:

end IsQuadraticChabautyPair

-- test: pair_identity_height
-- A genus-zero INTERFACE test only; it makes no geometric genus-zero QC claim.
example : IsQuadraticChabautyPair (fun _ : ℚ_[p] => (0 : Fin 0 → ℚ_[p]))
    (fun x => x) ({0} : Set ℚ_[p]) 0 0 0
    (fun _ : Fin 1 => fun t => t) (Metric.closedBall 0 1) {0} := by sorry
-- test: pair_constant_abel_jacobi_rejected
example : ¬ IsQuadraticChabautyPair (fun _ : ℚ_[p] => (0 : Fin 1 → ℚ_[p]))
    (fun x => x) ({0} : Set ℚ_[p]) 0 0 0
    (fun _ : Fin 1 => fun t => t) (Metric.closedBall 0 1) {0} := by sorry
-- test: pair_wrong_correction_rejected
example : ¬ IsQuadraticChabautyPair (fun _ : ℚ_[p] => (0 : Fin 0 → ℚ_[p]))
    (fun x => x) ({1} : Set ℚ_[p]) 0 0 0
    (fun _ : Fin 1 => fun t => t) (Metric.closedBall 0 1) {0} := by sorry
end Pair

section Determinant
variable {k : Type u} [Field k]
variable {X : Type v} {m : ℕ}

/-- First column consists of height values with their specified local corrections. -/
def HeightDeterminantMatrix (psi : X → Fin m → k) (theta : X → k)
    (anchors : Fin m → X) (alpha : k) (anchorAlpha : Fin m → k) (x : X) :
    Matrix (Option (Fin m)) (Option (Fin m)) k
  | none, none => theta x - alpha
  | none, some j => psi x j
  | some i, none => theta (anchors i) - anchorAlpha i
  | some i, some j => psi (anchors i) j

noncomputable def HeightDeterminant (psi : X → Fin m → k) (theta : X → k)
    (anchors : Fin m → X) (alpha : k) (anchorAlpha : Fin m → k) (x : X) : k :=
  (HeightDeterminantMatrix psi theta anchors alpha anchorAlpha x).det

namespace HeightDeterminant
theorem matrix_first (psi : X → Fin m → k) (theta : X → k)
    (anchors : Fin m → X) (alpha : k) (anchorAlpha : Fin m → k) (x : X) :
    HeightDeterminantMatrix psi theta anchors alpha anchorAlpha x none none =
      theta x - alpha := by sorry

theorem duplicate_row (psi : X → Fin m → k) (theta : X → k)
    (anchors : Fin m → X) (alpha : k) (anchorAlpha : Fin m → k)
    (i : Fin m) (h : alpha = anchorAlpha i) :
    HeightDeterminant psi theta anchors alpha anchorAlpha (anchors i) = 0 := by sorry

theorem equation (psi : X → Fin m → k) (theta : X → k)
    (anchors : Fin m → X) (alpha : k) (anchorAlpha : Fin m → k)
    (L : (Fin m → k) →ₗ[k] k)
    (hanchors : ∀ i, theta (anchors i) - anchorAlpha i = L (psi (anchors i)))
    (hbasis : Matrix.det (fun i j => psi (anchors i) j) ≠ 0)
    (x : X) :
    HeightDeterminant psi theta anchors alpha anchorAlpha x = 0 ↔
      theta x - L (psi x) = alpha := by sorry
end HeightDeterminant

-- test: determinant_empty_features
example : HeightDeterminant (fun _ : ℚ => (0 : Fin 0 → ℚ)) (fun x => x)
    (fun i : Fin 0 => Fin.elim0 i) 2 0 7 = 5 := by sorry
-- test: determinant_nonzero_corrections
example : HeightDeterminant (fun x : ℚ => fun _ : Fin 1 => x) (fun x => x + 5)
    (fun _ : Fin 1 => 4) 2 (fun _ => -1) 2 = 0 := by sorry

example : HeightDeterminant (fun _ : ℚ => (0 : Fin 1 → ℚ)) (fun x => x)
    (fun _ : Fin 1 => 0) 0 0 7 = 0 := by sorry

-- Its native algebraic part is HeightDeterminant.equation, with an invertible anchor matrix.
end Determinant

-- height modules. Balanced tensor dimension and Q_p-valued K-balanced bilinearity
-- are required; a Q_p-valued form is not declared K-linear without such a module.

section Choices
variable {k V : Type*} [Field k] [AddCommGroup V] [Module k V]

theorem splitting_residual (theta : k) (B D : V →ₗ[k] V →ₗ[k] k) (x y : V) :
    (theta + D x y) - (B + D) x y = theta - B x y := by sorry

theorem character_scale (a theta globalHeight : k) (ha : a ≠ 0) (Upsilon : Set k) :
    a * theta - a * globalHeight ∈ (fun z => a * z) '' Upsilon ↔
    theta - globalHeight ∈ Upsilon := by sorry

-- test: zero_character_loses_obstruction
example : (0 : ℚ) * 7 - 0 * 2 ∈ (fun z : ℚ => 0 * z) '' ({0} : Set ℚ) ∧
    (7 : ℚ) - 2 ∉ ({0} : Set ℚ) := by sorry

-- choices_independence: the geometric theorem applies both identities to the shared
-- generic height variation theorem, scaling all local correction sets as well. G2.
end Choices

-- The concrete X_s(13) model and computation already belong to ED.6:
-- EffectiveDiophantineMethods:ED.6/xs13-plane-model, /xs13-rank-three,
-- /xs13-tate-classes, /xs13-equivariant-height-matrices, /xs13-first-chart-points,
-- /xs13-second-chart-points, /xs13-p0-disc and /xs13-rational-points.
-- They are illustrated in the reader and imported-target register, not defined again.
-- NC.5 supplies their generic pair, mixed-extension height and determinant inputs.
-- chow_heegner_class: the relative-cohomology object is E_Z = A_Z(b,x)^*(1).
-- Its divisor-height comparison preserves Q_p,V,Q_p(1); Tate-dual height symmetry
-- gives the height identity for A_Z. The distinct-endpoint and x=b signatures

-- Correct U1.m line358 to use betafil2 in the Z2 feature and replay its certificates;
-- no numerical execution or rational-point completeness replay is claimed here.

end TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty.NC5

end LayerNC5

/-! ## Layer NC.6: sections, rational points and the conjectural frontier -/

section LayerNC6

namespace TauCeti.Anabelian

open Filter

/-! ## Sections of an abstract arithmetic extension -/

section Sections

variable {E Γ : Type*} [Group E] [Group Γ] [TopologicalSpace E] [TopologicalSpace Γ]

/-- A continuous section of the continuous homomorphism `q : E →ₜ* Γ`. For a scheme `X/k`,
`q` is the projection `π₁(X, x̄) → Γ_k` and its kernel is the geometric fundamental group. -/
structure GaloisSection (q : E →ₜ* Γ) where
  /-- The underlying continuous homomorphism `Γ → E`. -/
  toHom : Γ →ₜ* E
  /-- `q ∘ s = id`. -/
  comp_eq : ∀ σ, q (toHom σ) = σ

namespace GaloisSection

variable {q : E →ₜ* Γ}

/-- Two sections are conjugate when one is obtained from the other by conjugating with an
element of the kernel of `q`. -/
def Conj (q : E →ₜ* Γ) (s t : GaloisSection q) : Prop :=
  ∃ δ : E, q δ = 1 ∧ ∀ σ, t.toHom σ = δ * s.toHom σ * δ⁻¹

lemma conj_refl (s : GaloisSection q) : Conj q s s := by sorry

lemma conj_symm {s t : GaloisSection q} (h : Conj q s t) : Conj q t s := by sorry

lemma conj_trans {s t u : GaloisSection q} (h₁ : Conj q s t) (h₂ : Conj q t u) :
    Conj q s u := by sorry

/-- The difference cocycle `σ ↦ s σ * (s₀ σ)⁻¹` of two sections, with values in the kernel. -/
def diff (s₀ s : GaloisSection q) (σ : Γ) : q.toMonoidHom.ker :=
  ⟨s.toHom σ * (s₀.toHom σ)⁻¹, by
    change q (s.toHom σ * (s₀.toHom σ)⁻¹) = 1
    rw [map_mul, map_inv, s.comp_eq, s₀.comp_eq, mul_inv_cancel]⟩

lemma diff_self (s₀ : GaloisSection q) (σ : Γ) : diff s₀ s₀ σ = 1 := by sorry

/-- The difference cocycle satisfies the twisted cocycle identity for the conjugation action
through `s₀`. -/
lemma diff_mul (s₀ s : GaloisSection q) (σ τ : Γ) :
    ((diff s₀ s (σ * τ) : q.toMonoidHom.ker) : E) =
      (diff s₀ s σ : E) * (s₀.toHom σ * (diff s₀ s τ : E) * (s₀.toHom σ)⁻¹) := by sorry

/-- Sections along a morphism of extensions: `f : E →ₜ* E'` over `Γ` (that is, `q' ∘ f = q`)
carries sections of `q` to sections of `q'`. For schemes this is the map induced by a
`k`-morphism `X → Y`. -/
def map {E' : Type*} [Group E'] [TopologicalSpace E'] {q' : E' →ₜ* Γ} (f : E →ₜ* E')
    (hf : ∀ e, q' (f e) = q e) (s : GaloisSection q) : GaloisSection q' :=
  ⟨f.comp s.toHom, fun σ => by rw [ContinuousMonoidHom.coe_comp, Function.comp_apply, hf, s.comp_eq]⟩

lemma conj_map {E' : Type*} [Group E'] [TopologicalSpace E'] {q' : E' →ₜ* Γ} (f : E →ₜ* E')
    (hf : ∀ e, q' (f e) = q e) {s t : GaloisSection q} (h : Conj q s t) :
    Conj q' (map f hf s) (map f hf t) := by
  obtain ⟨δ, hδ, h⟩ := h
  refine ⟨f δ, by rw [hf, hδ], fun σ => ?_⟩
  change f (t.toHom σ) = f δ * f (s.toHom σ) * (f δ)⁻¹
  rw [h σ, map_mul, map_mul, map_inv]

end GaloisSection

/-- `Sect(X/k)`: conjugacy classes of continuous sections. -/
def SectionClasses (q : E →ₜ* Γ) : Type _ :=
  Quot (GaloisSection.Conj q)

namespace SectionClasses

variable {q : E →ₜ* Γ}

/-- The class of a section. -/
def mk (q : E →ₜ* Γ) (s : GaloisSection q) : SectionClasses q :=
  Quot.mk _ s

lemma mk_eq_mk_iff (s t : GaloisSection q) :
    mk q s = mk q t ↔ GaloisSection.Conj q s t := by sorry

lemma mk_surjective : Function.Surjective (mk q) := by sorry

/-- Kim's action of the whole group `E` (conjugation, precomposed with conjugation in `Γ`) has
the same orbits as conjugation by the kernel. -/
lemma orbit_eq_kim (s t : GaloisSection q) (γ : E)
    (h : ∀ σ, t.toHom σ = γ * s.toHom (q γ⁻¹ * σ * q γ) * γ⁻¹) :
    mk q t = mk q s := by sorry

/-- `Sect` is functorial for morphisms of extensions over `Γ`. -/
def map {E' : Type*} [Group E'] [TopologicalSpace E'] {q' : E' →ₜ* Γ} (f : E →ₜ* E')
    (hf : ∀ e, q' (f e) = q e) : SectionClasses q → SectionClasses q' :=
  Quot.map (GaloisSection.map f hf) (fun _ _ h => GaloisSection.conj_map f hf h)

lemma map_mk {E' : Type*} [Group E'] [TopologicalSpace E'] {q' : E' →ₜ* Γ} (f : E →ₜ* E')
    (hf : ∀ e, q' (f e) = q e) (s : GaloisSection q) :
    map f hf (mk q s) = mk q' (GaloisSection.map f hf s) := rfl

lemma map_id : map (ContinuousMonoidHom.id E) (q := q) (fun _ => rfl) = id := by sorry

end SectionClasses

/-- The section map of a family of sections indexed by a point set `P`; for a curve, `P` is
the set of rational points and `sec x` is a section attached to `x`. -/
def sectionClassMap (q : E →ₜ* Γ) {P : Type*} (sec : P → GaloisSection q) :
    P → SectionClasses q :=
  fun x => SectionClasses.mk q (sec x)

/-- `SectionConjecture(X/k)` for an abstract datum: the section map is bijective. -/
def SectionConjectureFor (q : E →ₜ* Γ) {P : Type*} (sec : P → GaloisSection q) : Prop :=
  Function.Bijective (sectionClassMap q sec)

lemma sectionClassMap_natural {E' : Type*} [Group E'] [TopologicalSpace E'] {q' : E' →ₜ* Γ}
    (q : E →ₜ* Γ) (f : E →ₜ* E') (hf : ∀ e, q' (f e) = q e) {P P' : Type*}
    (sec : P → GaloisSection q) (sec' : P' → GaloisSection q') (φ : P → P')
    (hφ : ∀ x, GaloisSection.Conj q' (GaloisSection.map f hf (sec x)) (sec' (φ x))) :
    ∀ x, sectionClassMap q' sec' (φ x) = SectionClasses.map f hf (sectionClassMap q sec x) := by
  sorry

lemma sectionClassMap_eq_iff (q : E →ₜ* Γ) {P : Type*} (sec : P → GaloisSection q) (x y : P) :
    sectionClassMap q sec x = sectionClassMap q sec y ↔ GaloisSection.Conj q (sec x) (sec y) := by
  sorry

lemma sectionConjectureFor_iff_surjective (q : E →ₜ* Γ) {P : Type*} (sec : P → GaloisSection q)
    (hinj : Function.Injective (sectionClassMap q sec)) :
    SectionConjectureFor q sec ↔ Function.Surjective (sectionClassMap q sec) := by sorry

lemma sectionConjectureFor_isEmpty_iff (q : E →ₜ* Γ) {P : Type*} [IsEmpty P]
    (sec : P → GaloisSection q) :
    SectionConjectureFor q sec ↔ IsEmpty (SectionClasses q) := by sorry

-- SectionClasses.spec_field_unique: for `q = id` (the case `X = Spec k`) there is exactly one class.
example : Subsingleton (SectionClasses (ContinuousMonoidHom.id Γ)) := by sorry

example : Nonempty (SectionClasses (ContinuousMonoidHom.id Γ)) := by sorry

-- sectionConjecture_spec_field: the identity datum with a single point satisfies the conjecture.
example (s : GaloisSection (ContinuousMonoidHom.id Γ)) :
    SectionConjectureFor (ContinuousMonoidHom.id Γ) (fun _ : Unit => s) := by sorry

-- not_sectionConjecture_projectiveLine: two distinct points with the same section violate
-- injectivity, as for `P¹`, where every section is conjugate to every other.
example (q : E →ₜ* Γ) (s : GaloisSection q) :
    ¬ SectionConjectureFor q (fun _ : Bool => s) := by sorry

-- sectionConjecture_iff_bijective: the proposition is bijectivity, nothing weaker.
example (q : E →ₜ* Γ) {P : Type*} (sec : P → GaloisSection q) :
    SectionConjectureFor q sec ↔
      Function.Injective (sectionClassMap q sec) ∧ Function.Surjective (sectionClassMap q sec) :=
  Iff.rfl

end Sections

/-! ## The arithmetic core of injectivity (Stix, Theorem 45) -/

section Injectivity

/-- A finitely generated abelian group has no nonzero element divisible by every positive
integer; with Mordell–Weil this is the input of the injectivity theorem over number fields. -/
theorem eq_zero_of_forall_divisible {A : Type*} [AddCommGroup A] [AddGroup.FG A] (a : A)
    (h : ∀ n : ℕ, 0 < n → ∃ b : A, n • b = a) : a = 0 := by sorry

/-- The shape of Stix's Theorem 45: an injection into a finitely generated abelian group,
together with the Kummer comparison (equal classes force the difference to be divisible by every
`n`), makes the section map injective. -/
theorem injective_of_kummer {P A C : Type*} [AddCommGroup A] [AddGroup.FG A] (ι : P → A)
    (hι : Function.Injective ι) (κ : P → C)
    (hκ : ∀ x y, κ x = κ y → ∀ n : ℕ, 0 < n → ∃ b : A, n • b = ι x - ι y) :
    Function.Injective κ := by sorry

-- the elementary step in `ℤ × ZMod 6`: an element divisible by every `n` is zero.
example (a : ℤ × ZMod 6) (h : ∀ n : ℕ, 0 < n → ∃ b : ℤ × ZMod 6, n • b = a) : a = 0 := by
  sorry

-- sectionClassMap_gm_eq_kummer: `-1` is not a square in `ℚ`, so its Kummer class is nonzero.
example : ¬ ∃ b : ℚ, b ^ 2 = -1 := by sorry

end Injectivity

/-! ## Dimensions of the lower central quotients (Witt, Labute) -/

section GradedDimensions

open ArithmeticFunction

/-- Witt's formula: the dimension of the degree-`n` part of the free Lie algebra on `m`
generators, `(1/n) ∑_{d ∣ n} μ(d) m^{n/d}`. It is `d_n` for an affine curve with `m = 2g + s - 1`. -/
def wittDim (m n : ℕ) : ℤ :=
  (∑ d ∈ n.divisors, moebius d * (m : ℤ) ^ (n / d)) / n

/-- `α^n + β^n` for the roots `α, β` of `t² - 2g t + 1`, by its linear recursion. -/
def lucasSum (g : ℕ) : ℕ → ℤ
  | 0 => 2
  | 1 => 2 * g
  | n + 2 => 2 * g * lucasSum g (n + 1) - lucasSum g n

/-- Labute's formula: the rank of the `n`-th lower central quotient of the fundamental group of a
compact surface of genus `g`, `(1/n) ∑_{d ∣ n} μ(d) (α^{n/d} + β^{n/d})`. -/
def labuteDim (g n : ℕ) : ℤ :=
  (∑ d ∈ n.divisors, moebius d * lucasSum g (n / d)) / n

theorem sum_divisors_mul_wittDim (m n : ℕ) (hn : 0 < n) :
    ∑ d ∈ n.divisors, (d : ℤ) * wittDim m d = (m : ℤ) ^ n := by sorry

theorem sum_divisors_mul_labuteDim (g n : ℕ) (hn : 0 < n) :
    ∑ d ∈ n.divisors, (d : ℤ) * labuteDim g d = lucasSum g n := by sorry

theorem wittDim_nonneg (m n : ℕ) : 0 ≤ wittDim m n := by sorry

-- thrice-punctured line (`m = 2`): `d₁, …, d₅ = 2, 1, 2, 3, 6`.
example : (List.range 5).map (fun k => wittDim 2 (k + 1)) = [2, 1, 2, 3, 6] := by sorry

-- genus 2: `d₁ = 4`, `d₂ = 5 = dim Λ²H₁ - 1`, `d₃ = 16`.
example : labuteDim 2 1 = 4 ∧ labuteDim 2 2 = 5 ∧ labuteDim 2 3 = 16 := by sorry

-- genus 1 (not hyperbolic): the abelian case, `d₁ = 2` and `d₂ = 0`.
example : labuteDim 1 1 = 2 ∧ labuteDim 1 2 = 0 := by sorry

-- the free Lie algebra on two generators is not abelian: `d₂ ≠ 0`, unlike `Λ²` of a line.
example : wittDim 2 2 ≠ 0 := by sorry

end GradedDimensions

/-! ## Kim's dimension conjecture and Selmer vanishing, on dimension sequences -/

section DimensionFrontier

/-- Kim's Conjecture 1 for given dimension sequences: some depth `n ≥ 1` has
`dim S_n < dim Q_n`. -/
def KimDimensionInequality (selDim dRDim : ℕ → ℕ) : Prop :=
  ∃ n, 1 ≤ n ∧ selDim n < dRDim n

/-- Kim's Conjecture 2 for a sequence of strict Selmer dimensions: eventually zero. -/
def EventuallyVanishing (dim : ℕ → ℕ) : Prop :=
  ∀ᶠ n in atTop, dim n = 0

lemma kimDimensionInequality_mono {selDim selDim' dRDim : ℕ → ℕ} (h : ∀ n, selDim' n ≤ selDim n)
    (hK : KimDimensionInequality selDim dRDim) : KimDimensionInequality selDim' dRDim := by sorry

-- kimDimensionConjecture_thrice_punctured_Z: over `ℤ`, `dim S₁ = 0 < 2 = dim Q₁`.
example (selDim dRDim : ℕ → ℕ) (h₁ : selDim 1 = 0) (h₂ : dRDim 1 = 2) :
    KimDimensionInequality selDim dRDim := by sorry

-- kimDimensionConjecture_thrice_punctured_half: over `ℤ[1/2]`, depth one gives `2 = 2` and
-- depth two gives `2 < 3`; the inequality is witnessed at depth two.
example (selDim dRDim : ℕ → ℕ) (h₂ : selDim 2 = 2) (h₃ : dRDim 2 = 3) :
    KimDimensionInequality selDim dRDim := by sorry

-- not_kimDimensionConjecture_gm: for `G_m` over `ℤ[1/2]` both dimensions are `1` at every depth.
example : ¬ KimDimensionInequality (fun _ => 1) (fun _ => 1) := by sorry

-- selmerVanishing_zero_rep: the zero sequence vanishes eventually.
example : EventuallyVanishing (fun _ => 0) := by sorry

-- selmerVanishing_needs_local_conditions (dimension form): the unrestricted `H¹(G_T, V_n)` of the
-- thrice-punctured line is nonzero at every even `n`, and such a sequence never vanishes eventually.
example (dim : ℕ → ℕ) (h : ∀ n, 2 ≤ n → n % 2 = 0 → 1 ≤ dim n) : ¬ EventuallyVanishing dim := by
  sorry

end DimensionFrontier

/-! ## Kim's conjecture: eventual equality of a decreasing family of loci -/

section EventualEquality

variable {Y : Type*}

/-- `X(ℤ_p)_n = 𝒳(ℤ)` for all large `n`. -/
def EventualEquality (L : ℕ → Set Y) (G : Set Y) : Prop :=
  ∀ᶠ n in atTop, L n = G

lemma eventualEquality_iff_exists_subset {L : ℕ → Set Y} {G : Set Y} (hanti : Antitone L)
    (hG : ∀ n, G ⊆ L n) : EventualEquality L G ↔ ∃ n, L n ⊆ G := by sorry

lemma eventualEquality_iInter {L : ℕ → Set Y} {G : Set Y} (h : EventualEquality L G)
    (hanti : Antitone L) : (⋂ n, L n) = G := by sorry

-- kimConjecture_not_intersection: the intersection can be `G` without eventual equality.
example :
    (⋂ n : ℕ, ({m : ℕ | n ≤ m} ∪ {0})) = ({0} : Set ℕ) ∧
      ¬ EventualEquality (fun n : ℕ => {m : ℕ | n ≤ m} ∪ {0}) ({0} : Set ℕ) := by sorry

-- kimConjectureS_empty (degenerate form): a constant family is eventually equal to its value.
example (G : Set Y) : EventualEquality (fun _ => G) G := by sorry

end EventualEquality

/-! ## The thrice-punctured line at depth one -/

section ThricePunctured

-- `𝒳(ℤ) = ∅` for `P¹ ∖ {0, 1, ∞}`: no integer `z` has `z` and `1 - z` both units.
example : ¬ ∃ z : ℤ, IsUnit z ∧ IsUnit (1 - z) := by sorry

/-- Residue-level form of the depth-one computation: a primitive sixth root of unity exists
modulo `p` exactly when `p ≡ 1 (mod 3)`; by Hensel's lemma (Teichmüller lifts) the same holds
in `ℤ_p`. -/
theorem exists_primitiveRoot_six_iff (p : ℕ) [Fact p.Prime] :
    (∃ x : ZMod p, IsPrimitiveRoot x 6) ↔ p % 3 = 1 := by sorry

-- kimConjecture_thrice_punctured_p5: no primitive sixth root of unity modulo 5.
example : ¬ ∃ x : ZMod 5, IsPrimitiveRoot x 6 := by sorry

-- kimLocus_thrice_punctured_p7: `3` is a primitive sixth root of unity modulo 7.
example : IsPrimitiveRoot (3 : ZMod 7) 6 := by sorry

end ThricePunctured

end TauCeti.Anabelian

end LayerNC6

/-!
## Statements not typed at the pins

The roadmap document states each of the following, with its hypotheses, API and unit tests.
Their carriers are not available at the pinned Mathlib and Tau Ceti, so they are named here
and not declared. They are listed by target, in the order of the document.

* `key/etale-k-pi-1`: `TauCeti.EtaleKPiOne.Is`, `TauCeti.EtaleKPiOne.Is.basePoint_iff`, `TauCeti.EtaleKPiOne.Is.constantFp_edgeIso`, `TauCeti.EtaleKPiOne.Is.edgeIso`, `TauCeti.EtaleKPiOne.Is.iff_all_comparisons`, `TauCeti.EtaleKPiOne.Is.of_subclass`, `TauCeti.EtaleKPiOne.Is.pointedIso_iff`, `TauCeti.EtaleKPiOne.Is.zero_coefficients`, `TauCeti.EtaleKPiOne.tests.affine_curve`, `TauCeti.EtaleKPiOne.tests.arithmetic_restriction_not_injective`, `TauCeti.EtaleKPiOne.tests.artin_tower`, `TauCeti.EtaleKPiOne.tests.constantFp_not_pro_p_cohomology`, `TauCeti.EtaleKPiOne.tests.field`, `TauCeti.EtaleKPiOne.tests.genus_after_prime_cover`, `TauCeti.EtaleKPiOne.tests.positive_genus`, `TauCeti.EtaleKPiOne.tests.prime_degree_cover`, `TauCeti.EtaleKPiOne.tests.prime_power_tower`, `TauCeti.EtaleKPiOne.tests.prime_to_degree_does_not_kill`, `TauCeti.EtaleKPiOne.tests.pro_p_not_coefficient_restriction`, `TauCeti.EtaleKPiOne.tests.product_char_zero`, `TauCeti.EtaleKPiOne.tests.projective_line_degree_two`, `TauCeti.EtaleKPiOne.tests.tower_exponent_zero`, `TauCeti.EtaleKPiOne.tests.zero_class`
* `NC.0/coefficient-restriction`: `TauCeti.EtaleKPiOne.Is.of_subclass`
* `NC.0/pointed-isomorphism`: `TauCeti.EtaleKPiOne.Is.pointedIso_iff`
* `NC.0/basepoint-transport`: `TauCeti.EtaleKPiOne.Is.basePoint_iff`
* `NC.0/field`: `TauCeti.EtaleKPiOne.field`
* `NC.0/projective-line-obstruction`: `TauCeti.EtaleKPiOne.not_projectiveLine`
* `NC.0/finite-cover-effacement`: `TauCeti.EtaleKPiOne.iff_finiteCover_effacement`
* `NC.0/effacement-finite-cover-transfer`: `TauCeti.EtaleKPiOne.effacement_of_finiteEtale`
* `NC.0/all-coefficient-effacement`: `TauCeti.EtaleKPiOne.iff_allCoefficient_effacement`
* `NC.0/finite-etale-invariance`: `TauCeti.EtaleKPiOne.finiteEtale_iff`
* `NC.0/effacement-extension`: `TauCeti.EtaleKPiOne.effacement_of_shortExact`
* `NC.0/prime-field-effacement`: `TauCeti.EtaleKPiOne.iff_primeField_effacement`
* `NC.0/connected-prime-degree-cover`: `TauCeti.EtaleKPiOne.exists_connected_primeDegree_cover`
* `NC.0/prime-cover-degree-two-killing`: `TauCeti.EtaleKPiOne.primeDegree_cover_kills_H2`
* `NC.0/prime-power-degree-two-killing`: `TauCeti.EtaleKPiOne.exists_primePower_cover_kills_H2`
* `NC.0/geometric-smooth-curve`: `TauCeti.EtaleKPiOne.smooth_curve_algebraicallyClosed`
* `NC.0/separable-killing-descent`: `TauCeti.EtaleKPiOne.descend_separable_killing_cover`
* `NC.0/separable-base-change`: `TauCeti.EtaleKPiOne.separableClosure_iff`
* `NC.0/smooth-curve`: `TauCeti.EtaleKPiOne.smooth_curve_charZero`
* `NC.0/positive-family-effacement`: `TauCeti.EtaleKPiOne.exists_connected_cover_kills_finiteFamily`
* `NC.0/product-cover-effacement`: `TauCeti.EtaleKPiOne.ProductSmoke.diagonal_C2`, `TauCeti.EtaleKPiOne.ProductSmoke.diagonal_S3_nonnormal`, `TauCeti.EtaleKPiOne.ProductSmoke.mixed_degree_one`, `TauCeti.EtaleKPiOne.ProductSmoke.nonfield_canonical_map`, `TauCeti.EtaleKPiOne.exists_product_refinement_kills_primeField_class`
* `NC.0/geometric-product`: `TauCeti.EtaleKPiOne.product_algebraicallyClosed`
* `NC.0/products`: `TauCeti.EtaleKPiOne.product_charZero`
* `NC.0/raw-homotopy-comparison`: `TauCeti.EtaleKPiOne.iff_raw_etale_aspherical`
* `NC.0/elementary-fibration`: `TauCeti.EtaleKPiOne.elementary_fibration_charZero`
* `NC.0/artin-neighbourhood`: `TauCeti.EtaleKPiOne.artin_tower_charZero`
* `NC.1/relative-outer-hom`: `TauCeti.Anabelian.RelativeOuterHom.comp`, `TauCeti.Anabelian.relativeHom_base_change_test`, `TauCeti.Anabelian.relativeHom_kernel_conj_test`, `TauCeti.Anabelian.relativeHom_self_test`, `TauCeti.Anabelian.relativeHom_sign_test`
* `NC.1/relative-outer-isom`: `TauCeti.Anabelian.RelativeOuterIsom.symm`, `TauCeti.Anabelian.RelativeOuterIsom.toHom`, `TauCeti.Anabelian.RelativeOuterIsom.trans`, `TauCeti.Anabelian.relativeIsom_base_test`, `TauCeti.Anabelian.relativeIsom_conj_test`, `TauCeti.Anabelian.relativeIsom_id_test`, `TauCeti.Anabelian.relativeIsom_sign_test`
* `NC.1/relative-pro-p`: `TauCeti.Anabelian.RelativeProP.lift`, `TauCeti.Anabelian.RelativeProP.lift_comp_mk`, `TauCeti.Anabelian.RelativeProP.lift_unique`, `TauCeti.Anabelian.RelativeProP.map`, `TauCeti.Anabelian.RelativeProP.open_map`, `TauCeti.Anabelian.RelativeProP.projection`, `TauCeti.Anabelian.relativeProP_field_test`, `TauCeti.Anabelian.relativeProP_identity_test`, `TauCeti.Anabelian.relativeProP_prime_to_p_test`
* `NC.1/finite-field-decomposition`: `TauCeti.Anabelian.finiteFieldTameDecomposition`
* `NC.1/linear-system-addition`: `TauCeti.Anabelian.additionOfValuationsAndPrincipalUnits`
* `NC.1/finite-field-tame-isom`: `TauCeti.Anabelian.finiteFieldTameIsom`
* `NC.1/log-admissible-system`: `TauCeti.Anabelian.AdmissibleLogCoverSystem`, `TauCeti.Anabelian.AdmissibleLogCoverSystem.admissibleGroup`, `TauCeti.Anabelian.AdmissibleLogCoverSystem.orderly_cofinal`, `TauCeti.Anabelian.AdmissibleLogCoverSystem.tame_baseChange`, `TauCeti.Anabelian.admissible_identity_test`, `TauCeti.Anabelian.admissible_orderly_test`, `TauCeti.Anabelian.admissible_wild_base_test`
* `NC.1/tower-decomposition`: `TauCeti.Anabelian.towerDecomposition.conjugate`, `TauCeti.Anabelian.towerDecomposition.mem_iff`, `TauCeti.Anabelian.towerDecomposition_regular_test`, `TauCeti.Anabelian.towerDecomposition_singleton_test`, `TauCeti.Anabelian.towerDecomposition_trivial_test`
* `NC.1/sturdy-cover`: `TauCeti.Anabelian.sturdyOrderlyCoversCofinal`
* `NC.1/component-recovery`: `TauCeti.Anabelian.admissibleComponentsAndTorsion`
* `NC.1/ordinary-special-quotient`: `TauCeti.Anabelian.ordinarySpecialQuotientRecovered`
* `NC.1/node-branch-recovery`: `TauCeti.Anabelian.admissibleNodesAndBranches`
* `NC.1/cyclotomic-degree`: `TauCeti.Anabelian.ReconstructionDegree`, `TauCeti.Anabelian.ReconstructionDegree.comp`, `TauCeti.Anabelian.ReconstructionDegree.component_eq`, `TauCeti.Anabelian.ReconstructionDegree.one_iff`, `TauCeti.Anabelian.reconstructionDegree_composition_test`, `TauCeti.Anabelian.reconstructionDegree_frobenius_test`, `TauCeti.Anabelian.reconstructionDegree_identity_test`
* `NC.1/thickness-log-gluing`: `TauCeti.Anabelian.nodeThicknessAndLogGluing`
* `NC.1/finite-field-log-isom`: `TauCeti.Anabelian.stableLogIsomDegreeOne`
* `NC.1/local-admissible-recovery`: `TauCeti.Anabelian.genericGroupRecoversAdmissibleReduction`
* `NC.1/degree-normalization`: `TauCeti.Anabelian.localArithmeticIsomDegreeOne`
* `NC.1/local-special-isom`: `TauCeti.Anabelian.stableLogSpecialFibreIsom`
* `NC.1/curve-map-rigidity`: `TauCeti.Anabelian.hyperbolicMapFundamentalGroupFaithful`
* `NC.1/geometric-centre-free`: `TauCeti.Anabelian.hyperbolicGeometricKernelCentreFree`
* `NC.1/local-galois-centre-free`: `TauCeti.Anabelian.localAndFinitelyGeneratedGaloisCentreFree`
* `NC.1/weight-zero-quotient`: `TauCeti.Anabelian.WeightZeroTwoStep`, `TauCeti.Anabelian.WeightZeroTwoStep.comm_quotient`, `TauCeti.Anabelian.WeightZeroTwoStep.inner_independent`, `TauCeti.Anabelian.WeightZeroTwoStep.section_action`, `TauCeti.Anabelian.weightZero_affine_relation_test`, `TauCeti.Anabelian.weightZero_inner_test`, `TauCeti.Anabelian.weightZero_wedge_test`
* `NC.1/j-geometric-section`: `TauCeti.Anabelian.IsJGeometric`, `TauCeti.Anabelian.IsJGeometric.baseChange`, `TauCeti.Anabelian.IsJGeometric.inner`, `TauCeti.Anabelian.IsJGeometric.picard_iff`, `TauCeti.Anabelian.jGeometric_curve_point_test`, `TauCeti.Anabelian.jGeometric_picard_point_test`, `TauCeti.Anabelian.jGeometric_translation_test`
* `NC.1/fi-geometric-section`: `TauCeti.Anabelian.FormalGeometry.baseChange`, `TauCeti.Anabelian.FormalGeometry.saturation`, `TauCeti.Anabelian.IsFGeometric`, `TauCeti.Anabelian.IsFIGeometric`, `TauCeti.Anabelian.formalGeometry_geometric_test`, `TauCeti.Anabelian.formalGeometry_saturation_test`, `TauCeti.Anabelian.formalGeometry_split_test`
* `NC.1/arithmetic-chern-comparison`: `TauCeti.Anabelian.arithmeticChernClassComparison`
* `NC.1/geometric-splitting`: `TauCeti.Anabelian.geometricSectionWeightZeroSplitting`
* `NC.1/open-map-j-geometric`: `TauCeti.Anabelian.openMapGenericSectionJGeometric`
* `NC.1/fi-to-f`: `TauCeti.Anabelian.fiGeometricImpliesFGeometric`
* `NC.1/prime-to-p-line-bundle`: `TauCeti.Anabelian.openMapPrimeToPLineBundle`
* `NC.1/nondegenerate-section`: `TauCeti.Anabelian.IsNondegenerateSection`, `TauCeti.Anabelian.IsNondegenerateSection.frattiniCover`, `TauCeti.Anabelian.IsNondegenerateSection.inner`, `TauCeti.Anabelian.IsNondegenerateSection.kernel_quotient`, `TauCeti.Anabelian.nondegenerate_geometric_test`, `TauCeti.Anabelian.nondegenerate_residue_test`, `TauCeti.Anabelian.nondegenerate_zero_test`
* `NC.1/canonical-relations`: `TauCeti.Anabelian.CanonicalRelations.baseChange`, `TauCeti.Anabelian.CanonicalRelations.mem_iff`, `TauCeti.Anabelian.canonicalRelations_degree_one_test`, `TauCeti.Anabelian.canonicalRelations_injection_test`, `TauCeti.Anabelian.canonicalRelations_zero_product_test`
* `NC.1/tame-point-existence`: `TauCeti.Anabelian.primeToPLineBundleTamePoint`
* `NC.1/compatible-tower-point`: `TauCeti.Anabelian.nondegenerateFrattiniTowerPoint`
* `NC.1/canonical-cover-descent`: `TauCeti.Anabelian.nondegenerateSectionIsGeometric`
* `NC.1/completed-differential-comparison`: `TauCeti.Anabelian.completedToricDifferentialComparison`
* `NC.1/canonical-relation-vanishing`: `TauCeti.Anabelian.openMapCanonicalRelationsVanish`
* `NC.1/inertia-and-regularity`: `TauCeti.Anabelian.openMapInertiaAndRegularity`
* `NC.1/canonical-effectivity`: `TauCeti.Anabelian.canonicalRelationsCurveEffectivity`
* `NC.1/local-pro-p-hom`: `TauCeti.Anabelian.localGeometricProPHom`
* `NC.1/finitely-generated-hom`: `TauCeti.Anabelian.finitelyGeneratedPadicProPHom`
* `NC.1/punctured-elliptic-isom`: `TauCeti.Anabelian.finitelyGeneratedPuncturedEllipticIsom`
* `NC.1/galois-centre-free`: `TauCeti.Anabelian.subPadicGaloisCentreFree`
* `NC.1/sub-p-adic-hom`: `TauCeti.Anabelian.subPadicGeometricProPHom`
* `NC.1/number-field-isom`: `TauCeti.Anabelian.numberFieldProfiniteIsom`
* `NC.1/geometric-outer-comparison`: `TauCeti.Anabelian.arithmeticGeometricIsomComparison`
* `NC.1/full-profinite-hom`: `TauCeti.Anabelian.numberFieldFullProfiniteHom`
* `NC.2/unipotent-length`: `IsUnipotentLength.tensor`
* `NC.2/realization-categories`: `UnipotentRealizations.pullback`
* `NC.2/central-quotients`: `UnipotentDepth.pathQuotient`
* `NC.2/length-algebra`: `UnipotentLengthAlgebra.coordinate`, `UnipotentLengthAlgebra.graded`, `UnipotentLengthAlgebra.regularObject`
* `NC.2/finite-path-module`: `FinitePathModule.reverseDual`
* `NC.2/affine-universal`: `AffineUniversalConnection.rank`, `AffineUniversalConnection.rightMul`, `AffineUniversalConnection.truncate`
* `NC.2/filtered-path`: `FilteredPathFiber.filtration`, `FilteredPathFiber.graded`, `FilteredPathFiber.unit`
* `NC.2/rigid-fibre`: `RigidHorizontalFiber.tensor`
* `NC.2/path-frobenius`: `PathFrobenius.comp`, `PathFrobenius.truncate`
* `NC.2/canonical-frobenius-path`: `CanonicalFrobeniusPath.comp`, `CanonicalFrobeniusPath.power`, `CanonicalFrobeniusPath.sameDisc`
* `NC.3/nonabelian-h1`: `TauCeti.NonabelianCohomology.tests.h1_trivial_group`
* `NC.3/named-kernel-equivalence`: `TauCeti.NonabelianCohomology.Twist.namedKernelEquiv.test_constant_top`, `TauCeti.NonabelianCohomology.Twist.namedKernelEquiv.test_identity_bot`, `TauCeti.NonabelianCohomology.Twist.namedKernelEquiv.test_wrong_subgroup_rejected`
* `NC.3/named-kernel-inner-action`: `TauCeti.NonabelianCohomology.Twist.namedKernelAction.test_inner_action_witness`, `TauCeti.NonabelianCohomology.Twist.namedKernelAction.test_multiplication`, `TauCeti.NonabelianCohomology.Twist.namedKernelAction.test_neutral_twist`, `TauCeti.NonabelianCohomology.Twist.namedKernelAction.test_noncommutative_inner_action`
* `NC.3/named-kernel-h1-equivalence`: `TauCeti.NonabelianCohomology.H1.namedKernelEquiv.test_inverse_on_classes`, `TauCeti.NonabelianCohomology.H1.namedKernelEquiv.test_neutral_class`, `TauCeti.NonabelianCohomology.H1.namedKernelEquiv.test_repointed_non_neutral`
* `NC.3/galois-coefficient-family`: `TauCeti.NonabelianCohomology.NC3.GaloisCoefficientFamily.action`, `TauCeti.NonabelianCohomology.NC3.GaloisCoefficientFamily.group`, `TauCeti.NonabelianCohomology.NC3.GaloisCoefficientFamily.map`, `TauCeti.NonabelianCohomology.NC3.GaloisCoefficientFamily.obj`, `TauCeti.NonabelianCohomology.NC3.GaloisCoefficientFamily.topology`
* `NC.4/local-etale-albanese`: `localEtaleAlbanese_base`, `localEtaleAlbanese_base_test`, `localEtaleAlbanese_gauge_test`, `localEtaleAlbanese_kummer_test`, `localEtaleAlbanese_path`, `localEtaleAlbanese_path_change`, `localEtaleAlbanese_tower`
* `NC.4/global-etale-albanese`: `globalEtaleAlbanese_base`, `globalEtaleAlbanese_base_test`, `globalEtaleAlbanese_conditions`, `globalEtaleAlbanese_kummer_test`, `globalEtaleAlbanese_local_test`, `globalEtaleAlbanese_localize`, `globalEtaleAlbanese_path`, `globalEtaleAlbanese_tower`
* `NC.5/depth-two-quotient`: `DepthTwoHeightQuotient.central_exact`
* `NC.5/height-module`: `DepthTwoHeightModule.action`, `DepthTwoHeightModule.deRham`, `DepthTwoHeightModule.grades`
* `NC.5/height-module-twist`: `HeightModuleTwist.classes`, `HeightModuleTwist.compose`, `twist_endpoint`, `twist_neutral`, `twist_nontrivial_center`
* `NC.5/height-prevalue`: `HeightPrevalue.local_height`
* `NC.5/height-determinant`: `determinant_basis_cannot_be_omitted`
* `NC.6/section-classes`: `SectionClasses.basepointEquiv`, `SectionClasses.equivH1`, `SectionClasses.gm_kummer`, `SectionClasses.projectiveLine_unique`, `SectionClasses.raw_sections_not_classes`, `SectionClasses.restrict`
* `NC.6/section-class-map`: `sectionClassMap_base`, `sectionClassMap_eq_pathTorsor`, `sectionClassMap_gm_not_surjective`, `sectionClassMap_projectiveLine_not_injective`, `sectionClassMap_restrict`, `sectionClassMap_spec_field`
* `NC.6/section-conjecture`: `GrothendieckSectionConjecture`, `not_sectionConjecture_gm`, `sectionConjecture_iff_surjective`, `sectionConjecture_isEmpty_iff`, `sectionConjecture_of_equiv`
* `NC.6/kim-dimension-conjecture`: `KimDimensionConjecture`, `dim_Q_eq_sum`, `finite_of_kimDimensionConjecture`, `kimDimensionConjecture_basepoint`, `kimDimensionConjecture_depth_one_chabauty`, `kimDimensionConjecture_needs_crystalline`, `kimDimensionConjecture_of_refined`
* `NC.6/selmer-vanishing-conjecture`: `SelmerVanishing`, `sel0_dual_sha2`, `sel0_eq_sha1`, `sel0_eq_sha1_test`, `sel0_mono_T`, `selmerVanishing_of_finite_extension`, `selmerVanishing_thrice_punctured`
* `NC.6/kim-conjecture`: `integral_subset_kimLocus`, `kimConjectureS`, `kimConjecture_iff_exists_subset`, `kimLocus`, `kimLocusS_half_contains`, `kimLocus_antitone`, `kimLocus_eq_crystallineLocus`, `kimLocus_indep_T`, `kimLocus_indep_basepoint`
-/
